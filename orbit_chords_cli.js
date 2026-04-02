#!/usr/bin/env node
// orbit_chords_cli.mjs
// One iterate ⇒ one chord. Emits Csound i-lines: i <instr> <startSec> <durSec> <midi> <vel>
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
orbit_chords_cli — iterate z for c in J, 1 tick = 1 chord, output Csound

USAGE
  ./orbit_chords_cli.mjs --mode delay|bundle|preimage|henon --c "a+bi" [opts] > score.sco

COMMON
  --mode M        chord mode (required): delay|bundle|preimage|henon
  --c STR         complex "a+bi" (required for delay|bundle|preimage)
  --bars N        bars (4/4, 16ths grid) default 210 (420s @ 120 BPM)
  --bpm N         tempo, default 120
  --k N           chord size (delay/bundle/preimage), default 4
  --baseMidi N    lowest MIDI (60 bins total), default 36 → [36..95]
  --regs CSV      register centers for instruments, default "50,60,67,72"
  --scale S       "major"|"minor"|csv pcs (e.g. "0,2,3,5,7,8,10")
  --tonic N       MIDI tonic; default inferred from arg(c)
  --seed N        RNG seed, default 1337

DELAY (k-delay embedding)
  --tau N         delay (in 16ths), default 1

BUNDLE (k seeds, optional weak coupling)
  --epsilon X     coupling 0..0.5, default 0.0

PREIMAGE (2^m preimages ⇒ pick k)
  --m N           preimage depth, default 2

HENON (complex Hénon in C^2)
  --a X           Henon 'a' (real), default 1.4
  --b X           Henon 'b' (real), default 0.3
  --steps N       total steps; default bars*16

OUTPUT
  Csound score lines: i <instr 1..4> <startSec> <durSec> <midi> <vel>

EXAMPLES
  # Delay chords (k=4) with tau=2
  ./orbit_chords_cli.mjs --mode delay --c "-0.8+0.156i" --k 4 --tau 2 > score.sco

  # Bundle chords (k=4), weak coupling
  ./orbit_chords_cli.mjs --mode bundle --c "-0.123+0.745i" --k 4 --epsilon 0.08 > score.sco

  # Preimage chords (m=3 → up to 8), keep k=4 most separated by angle
  ./orbit_chords_cli.mjs --mode preimage --c "0.285+0i" --m 3 --k 4 > score.sco

  # Complex Henon 2D → 2 notes per tick
  ./orbit_chords_cli.mjs --mode henon --a 1.4 --b 0.3 --steps 3360 > score.sco
`);}
////////////////////////////////////////////////////////////////////////////////
// Complex math

function parseComplex(str){
  const s = String(str).replace(/\s+/g,'').toLowerCase();
  if (!s.includes('i')) return {re:Number(s), im:0};
  const m = s.match(/^([+-]?\d*\.?\d+(?:e[+-]?\d+)?)?([+-]?\d*\.?\d*(?:e[+-]?\d+)?)i$/)
         || s.match(/^([+-]?\d*\.?\d+(?:e[+-]?\d+)?)([+-]\d*\.?\d*(?:e[+-]?\d+)?)i$/);
  if (!m) throw new Error(`Bad complex: ${str}`);
  const re = Number(m[1] ?? 0);
  const im = Number((m[2] ?? '+1').replace('+','')) || (m[2]==='-'? -1 : Number(m[2]));
  return {re, im};
}
const cadd=(a,b)=>({re:a.re+b.re, im:a.im+b.im});
const csub=(a,b)=>({re:a.re-b.re, im:a.im-b.im});
const cmul=(a,b)=>({re:a.re*b.re - a.im*b.im, im:a.re*b.im + a.im*b.re});
const cabs=a=>Math.hypot(a.re,a.im);
const carg=a=>Math.atan2(a.im,a.re);
function csqrt(a){
  const r = Math.hypot(a.re, a.im);
  const u = Math.sqrt((r + a.re)/2);
  const v = Math.sign(a.im) * Math.sqrt(Math.max(0,(r - a.re)/2));
  return {re:u, im:v};
}
////////////////////////////////////////////////////////////////////////////////
// RNG

function mulberry32(seed){ let t=seed>>>0; return ()=>{ t+=0x6D2B79F5;
  let r=Math.imul(t^t>>>15,1|t); r^=r+Math.imul(r^r>>>7,61|r);
  return ((r^r>>>14)>>>0)/4294967296; }; }

////////////////////////////////////////////////////////////////////////////////
// Music helpers

function pcsFromOpt(opt){
  if (!opt || opt==='major') return [0,2,4,5,7,9,11];
  if (opt==='minor') return [0,2,3,5,7,8,10];
  return String(opt).split(',').map(s=>Number(s.trim())).filter(x=>Number.isFinite(x)&&x>=0&&x<12);
}
function quantizeMidiToPCS(midi, tonic, pcs){
  const pc = ((midi - tonic) % 12 + 12) % 12;
  let best = pcs[0], bestd = 12;
  for (const q of pcs){
    const d = Math.min((pc - q + 12) % 12, (q - pc + 12) % 12);
    if (d<bestd){ bestd=d; best=q; }
  }
  return midi - pc + best;
}
function argToTonicFromFifths(theta){
  const x = (theta/(2*Math.PI) + 1) % 1;
  const fifthToPitch = [0,7,2,9,4,11,6,1,8,3,10,5];
  const pc = fifthToPitch[Math.round(x*12)%12];
  return 60 + pc;
}
function nearestRegisterIndex(midi, regs){
  let bestI=0, bestD=1e9;
  for (let i=0;i<regs.length;i++){ const d = Math.abs(midi - regs[i]); if (d<bestD){bestD=d;bestI=i;} }
  return bestI; // 0..3
}

////////////////////////////////////////////////////////////////////////////////
// Mapping complex values -> chord notes at step n

function mapComplexSetToChord(zlist, {baseMidi, pitchBins, tonic, pcs, regs}){
  // pitch from angle, breadth ~ 30 semis; quantize; clamp to 60-bin window
  const midiLow = baseMidi, midiHigh = baseMidi + pitchBins - 1;
  const chord = [];
  for (const z of zlist){
    const ang = carg(z); // (-pi,pi]
    const raw = Math.round(((ang/Math.PI) * 30)); // ~[-30,30]
    let midi = Math.round(regs[0] + raw); // centered near lower register; will get reassigned to instruments
    midi = quantizeMidiToPCS(midi, tonic, pcs);
    midi = Math.max(midiLow, Math.min(midiHigh, midi));
    // velocity: log of radius, inverted so near 1 gets mid-high; clamp
    const r = cabs(z);
    const v = Math.max(30, Math
