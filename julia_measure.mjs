#!/usr/bin/env node
// julia_measure_cli.mjs
// ESM CLI: generate Csound i-statements from a Julia-set MEASURE → piano roll mapping.
//
// Approach:
// 1) Random backward iteration for f_c(z)=z^2+c: z <- ±sqrt(z - c) to sample invariant measure on J_c.
// 2) Bin samples into a 2D histogram H[t, p], where t=16th step (time via Re z), p=pitch bin (via Im z).
// 3) Per time column: pick top-K pitch bins (after beat-biased convolution), quantize to a scale, map to 4 instruments,
//    merge consecutive steps to durations, set velocities via log-compressed mass.
//
// Defaults: 120 BPM, 210 bars (420s), 60-semitone window (MIDI 36..95), K=2 peaks/column.
// Tonic defaults from arg(c) mapped to circle of fifths; scale major/minor selectable.

////////////////////////////////////////////////////////////////////////////////
// CLI utils

function parseArgs(argv){
  const args = { _:[] };
  for (let i=0;i<argv.length;i++){
    const a = argv[i];
    if (!a.startsWith('--')) { args._.push(a); continue; }
    const k = a.slice(2);
    const v = (i+1<argv.length && !argv[i+1].startsWith('--')) ? argv[++i] : 'true';
    args[k] = v;
  }
  return args;
}

function printHelp(){
  console.log(`
julia_measure_cli — Julia-set MEASURE → piano roll → Csound score

USAGE
  ./julia_measure_cli.mjs --c "-0.8+0.156i" [options] > score.sco

OPTIONS
  --c STR         Complex c as "a+bi" or "a-bi" (required), e.g. "--c -0.8+0.156i"
  --samples N     Number of samples for the measure (default 2000000)
  --burn N        Burn-in backward steps before collecting (default 800)
  --bars N        Bars at 4/4, 16ths grid (default 210 → 420 s at 120 BPM)
  --bpm N         BPM (default 120)
  --window STR    Complex window "x0:x1,y0:y1" (default "-1.8:1.8,-1.5:1.5")
  --peaks K       Max peaks per column (default 2)
  --scale S       "major" | "minor" | comma-separated pitch classes (e.g. "0,2,3,5,7,8,10")
  --tonic N       MIDI tonic; if omitted, inferred from arg(c) via circle-of-fifths
  --baseMidi N    Lowest MIDI of 60-semitone window (default 36 → [36..95])
  --regs STR      Register centers CSV for 4 instruments (default "50,60,67,72")
  --seed N        RNG seed (default 1337)
  --help          Show this help

OUTPUT
  Prints Csound i-statements:  i <instr> <startSec> <durSec> <midi> <vel>

EXAMPLES
  # Classic Douady rabbit-ish parameter:
  ./julia_measure_cli.mjs --c "-0.123+0.745i" > score.sco

  # Fewer samples, minor scale, 3 peaks, faster tempo:
  ./julia_measure_cli.mjs --c "-0.8+0.156i" --samples 800000 --scale minor --peaks 3 --bpm 132 > score.sco

  # Fixed tonic A (69), dorian-like PCS:
  ./julia_measure_cli.mjs --c "0.285+0i" --tonic 69 --scale "0,2,3,5,7,9,10" > score.sco
`);
}

////////////////////////////////////////////////////////////////////////////////
// Math & complex

function parseComplex(str){
  // Accept "a+bi", "a-bi", "a", "bi"
  const s = str.replace(/\s+/g,'').toLowerCase();
  if (!s.includes('i')){
    const re = Number(s);
    if (Number.isNaN(re)) throw new Error(`Bad complex: ${str}`);
    return {re, im:0};
  }
  // split into real and imaginary parts
  const m = s.match(/^([+-]?\d*\.?\d+(?:e[+-]?\d+)?)?([+-]?\d*\.?\d*(?:e[+-]?\d+)?)i$/);
  if (m){
    const re = (m[1]===''||m[1]===undefined)? 0 : Number(m[1]);
    const im = (m[2]===''||m[2]===undefined||m[2]==='+')? 1 : (m[2]==='-'? -1 : Number(m[2]));
    return {re, im};
  }
  // try general form a+bi / a-bi
  const m2 = s.match(/^([+-]?\d*\.?\d+(?:e[+-]?\d+)?)([+-]\d*\.?\d*(?:e[+-]?\d+)?)i$/);
  if (m2){
    return {re:Number(m2[1]), im:Number(m2[2])};
  }
  throw new Error(`Bad complex: ${str}`);
}

function csub(a,b){ return {re:a.re - b.re, im:a.im - b.im}; }
function cabs(a){ return Math.hypot(a.re, a.im); }
function carg(a){ return Math.atan2(a.im, a.re); } // (-pi, pi]
function csqrt(a){
  const r = Math.hypot(a.re, a.im);
  const u = Math.sqrt((r + a.re)/2);
  const v = Math.sign(a.im) * Math.sqrt(Math.max(0,(r - a.re)/2));
  return {re:u, im:v};
}
function tanhComplex(z){
  // tanh(z) = sinh(z)/cosh(z)
  const x=z.re, y=z.im;
  const ex = Math.exp(x), enx = Math.exp(-x);
  const cosh2x = (ex+enx)/2, sinh2x = (ex-enx)/2;
  const denom = cosh2x + Math.cos(2*y);
  return {
    re: (sinh2x) / denom,
    im: (Math.sin(2*y) / denom)
  };
}

////////////////////////////////////////////////////////////////////////////////
// RNG (Mulberry32)

function mulberry32(seed){
  let t = seed >>> 0;
  return function(){
    t += 0x6D2B79F5;
    let r = Math.imul(t ^ (t>>>15), 1 | t);
    r ^= r + Math.imul(r ^ (r>>>7), 61 | r);
    return ((r ^ (r>>>14)) >>> 0) / 4294967296;
  };
}

////////////////////////////////////////////////////////////////////////////////
// Musical helpers

function pcsFromOpt(opt){
  if (!opt || opt==='major') return [0,2,4,5,7,9,11];
  if (opt==='minor') return [0,2,3,5,7,8,10];
  return opt.split(',').map(s=>Number(s.trim())).filter(x=>Number.isFinite(x)&&x>=0&&x<12);
}

function quantizeMidiToPCS(midi, tonic, pcs){
  // snap midi to nearest pitch-class in pcs (ties bias downward)
  const pc = ((midi - tonic) % 12 + 12) % 12;
  let best = pcs[0], bestd = 12;
  for (const q of pcs){
    const d = Math.min((pc - q + 12) % 12, (q - pc + 12) % 12);
    if (d < bestd){ bestd = d; best = q; }
  }
  return midi - pc + best;
}

function argToTonicFromFifths(theta){
  // Map external angle (arg c) to circle of fifths: 12 points over [0,2π)
  const x = (theta/(2*Math.PI) + 1) % 1; // [0,1)
  const fifthSteps = Math.round(x*12) % 12; // 0..11
  // Start at C4=60 and step by fifths mod 12
  const fifthToPitch = [0,7,2,9,4,11,6,1,8,3,10,5]; // mod-12 mapping
  const pc = fifthToPitch[fifthSteps];
  return 60 + pc; // tonic around middle C region
}

////////////////////////////////////////////////////////////////////////////////
// Measure sampling → histogram

function sampleJuliaMeasureToHistogram({
  c, samples=2_000_000, burn=800,
  window={x0:-1.8,x1:1.8,y0:-1.5,y1:1.5},
  steps=3360, pitchBins=60,
  seed=1337
}){
  const rnd = mulberry32(seed|0);
  // H: counts; also keep angle sector & branch counts for instrument mapping
  const H = Array.from({length:steps}, ()=>new Uint32Array(pitchBins));
  const S = Array.from({length:steps}, ()=>Array.from({length:pitchBins}, ()=>[0,0,0,0])); // 4 angle sectors
  const B = Array.from({length:steps}, ()=>Array.from({length:pitchBins}, ()=>[0,0])); // branch +/-

  const W = { dx: window.x1 - window.x0, dy: window.y1 - window.y0 };

  // seed at origin (anywhere works for backward iteration)
  let z = {re:0, im:0};

  // burn-in
  for (let i=0;i<burn;i++){
    const zmc = csub(z, c);
    const rt = csqrt(zmc);
    const sign = (rnd()<0.5) ? 1 : -1;
    z = {re: sign*rt.re, im: sign*rt.im};
  }

  // sample
  for (let i=0;i<samples;i++){
    const zmc = csub(z, c);
    const rt = csqrt(zmc);
    const sign = (rnd()<0.5) ? 1 : -1;
    z = {re: sign*rt.re, im: sign*rt.im};

    // optional taming if we drift far (should be rare on boundary)
    const R = cabs(z);
    if (R>8){
      z = tanhComplex(z); // reinject near unit disk
    }

    // bin if inside window
    const tx = (z.re - window.x0) / W.dx;
    const ty = (z.im - window.y0) / W.dy;
    const t = Math.floor(tx * steps);
    const p = Math.floor(ty * pitchBins);
    if (t>=0 && t<steps && p>=0 && p<pitchBins){
      H[t][p] += 1;

      // angle sector 4-way
      const th = carg(z); // (-pi, pi]
      let sector = Math.floor(((th + Math.PI) / (2*Math.PI)) * 4) % 4; // 0..3
      if (sector<0) sector+=4;
      S[t][p][sector]++;

      // branch ± counts
      if (sign>0) B[t][p][0]++; else B[t][p][1]++;
    }
  }
  return {H,S,B};
}

////////////////////////////////////////////////////////////////////////////////
// Beat-biased peak picking & roll realization

function convolveBeatBias(H){
  // Apply simple 16th-position weights across time to bias downbeats/backbeats.
  // We don't change density, just score columns with nearby beats to stabilize rhythm.
  const weights = [1,0,0,0, 0.6,0,0,0, 0.8,0,0,0, 0.6,0,0,0];
  const steps = H.length, pitchBins = H[0].length;
  const STEPS_PER_BAR = 16;
  const score = new Float32Array(steps);
  for (let t=0;t<steps;t++){
    // total mass in this column
    let colsum = 0;
    for (let p=0;p<pitchBins;p++) colsum += H[t][p];
    // add neighborhood weighted by phase
    let s = colsum * 1.0;
    const phase = t % STEPS_PER_BAR;
    for (let k=0;k<STEPS_PER_BAR;k++){
      if (weights[k]===0) continue;
      // neighbor at same phase in prev bars
      const tt = t - (phase - k);
      if (tt>=0 && tt<steps){
        let csum = 0;
        for (let p=0;p<pitchBins;p++) csum += H[tt][p];
        s += csum * weights[k];
      }
    }
    score[t] = s;
  }
  return score;
}

function buildNotesFromHistogram({
  H,S,B, steps, pitchBins,
  peaksPerCol=2, baseMidi=36, regs=[50,60,67,72],
  bpm=120, tonic, pcs,
}){
  const STEP_SEC = 60/bpm/4; // 16ths
  const midiLow = baseMidi;
  const midiHigh = baseMidi + pitchBins - 1;

  // Precompute max count for velocity scaling
  let Hmax = 0;
  for (let t=0;t<steps;t++){
    for (let p=0;p<pitchBins;p++){
      if (H[t][p] > Hmax) Hmax = H[t][p];
    }
  }
  if (Hmax === 0) return []; // no notes

  // Beat-biased column scores (used to slightly sharpen selection order per column)
  const columnBias = convolveBeatBias(H);

  // For each column, pick up to K peaks (nonzero)
  const chosen = Array.from({length:steps}, ()=>[]);
  for (let t=0;t<steps;t++){
    // collect nonzero p with effective score mass = count * (1 + small bias)
    const entries = [];
    for (let p=0;p<pitchBins;p++){
      const c = H[t][p];
      if (c>0) entries.push({p, c});
    }
