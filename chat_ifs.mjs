// musiclib.js
// Grid: 16ths @ 120 BPM → step = 0.125 s
export const STEP_SEC = 0.125;
export const STEPS_PER_BAR = 16;

// ---------- Utilities ----------
const clamp01 = x => Math.max(0, Math.min(1, x));
const dot = (a,b)=>a.reduce((s,x,i)=>s+x*(b[i]||0),0);
const norm = a => Math.hypot(...a);
const cosSim = (a,b)=> {
  const na = norm(a), nb = norm(b);
  return (na>0 && nb>0) ? dot(a,b)/(na*nb) : 0;
};
function entropy01(hist) {
  const s = hist.reduce((a,x)=>a+x,0);
  if (s === 0) return 0;
  let H = 0, k = 0;
  for (const x of hist) if (x>0){ const p = x/s; H -= p*Math.log(p); k++; }
  return (k>1) ? clamp01(H/Math.log(k)) : 0;
}
export function barsCount(totalSteps){ return Math.ceil(totalSteps / STEPS_PER_BAR); }

// Convert notes → step-wise arrays
export function buildStepArrays(roll, totalSteps){
  const voices = roll.length;
  const active = Array.from({length: voices}, ()=>Array(totalSteps).fill(0)); // 0/vel
  const onset  = Array.from({length: voices}, ()=>Array(totalSteps).fill(0)); // 0/1
  const pitchesAtStep = Array.from({length: totalSteps}, ()=>new Set());

  for (let v=0; v<voices; v++){
    for (const n of roll[v]){
      const s0 = n.startStep|0, s1 = Math.min(totalSteps, (n.startStep|0) + (n.durSteps|0));
      if (s0>=totalSteps || s0<0 || s1<=s0) continue;
      onset[v][s0] = 1;
      for (let t=s0; t<s1; t++){
        active[v][t] = Math.max(active[v][t], n.vel||1);
        pitchesAtStep[t].add(n.pitch|0);
      }
    }
  }
  return {active, onset, pitchesAtStep};
}
function barVectorFromOnsets(onsetV, m){
  const v = new Array(STEPS_PER_BAR).fill(0);
  const t0 = m*STEPS_PER_BAR;
  for (let k=0;k<STEPS_PER_BAR;k++){
    const t = t0+k; if (t<onsetV.length) v[k]+=onsetV[t];
  }
  return v;
}

// ---------- 1) Rhythm Regularity & Patterning (R) ----------
export function rhythmIndex(roll, totalSteps){
  const voices = roll.length;
  const {onset} = buildStepArrays(roll, totalSteps);
  // Downbeats & backbeats emphasis template:
  const b = [1,0,0,0, 0.6,0,0,0, 0.8,0,0,0, 0.6,0,0,0];
  const B = barsCount(totalSteps);

  function perVoice(v){
    // Beat template correlation (phase aggregate)
    const u = new Array(STEPS_PER_BAR).fill(0);
    for (let t=0;t<totalSteps;t++){
      if (onset[v][t]) u[t % STEPS_PER_BAR] += 1;
    }
    const Cb = clamp01(cosSim(u, b));

    // Bar-to-bar repeatability
    let cs = 0, cnt=0;
    for (let m=0; m<B-1; m++){
      const v1 = barVectorFromOnsets(onset[v], m);
      const v2 = barVectorFromOnsets(onset[v], m+1);
      const c = cosSim(v1, v2);
      if (!Number.isNaN(c)) { cs+=c; cnt++; }
    }
    const Crep = (cnt>0)? clamp01(cs/cnt) : 0;

    // IOI concentration (bins 1..8 16ths; 8=half-note)
    const ioi = [];
    let last = -1;
    for (let t=0;t<totalSteps;t++){
      if (onset[v][t]){
        if (last>=0) ioi.push(t-last);
        last = t;
      }
    }
    const K=8;
    const hist = new Array(K).fill(0);
    for (const x of ioi){
      if (x>=1 && x<=K) hist[x-1] += 1;
      else if (x>K) hist[K-1] += 0.5;
    }
    const Cioi = 1 - entropy01(hist);

    return 0.5*Cb + 0.3*Crep + 0.2*Cioi;
  }

  const R = (voices>0) ? (Array.from({length:voices},(_,v)=>perVoice(v)).reduce((a,x)=>a+x,0)/voices) : 0;
  return clamp01(R);
}

// ---------- 2) Tonal Centeredness & Consonance (T) ----------
const KS_MAJOR = [6.35,2.23,3.48,2.33,4.38,4.09,2.52,5.19,2.39,3.66,2.29,2.88];
const KS_MINOR = [6.33,2.68,3.52,5.38,2.60,3.53,2.54,4.75,3.98,2.69,3.34,3.17];
function rotate12(a,n){ const b=a.slice(); return b.map((_,i)=>a[(i-n+12)%12]); }
export function pitchClassHistogram(roll){
  const h = new Array(12).fill(0);
  for (const voice of roll){
    for (const n of voice){
      const w = Math.max(1, n.durSteps|0) * (n.vel ? n.vel/127 : 1);
      h[(n.pitch|0) % 12] += w;
    }
  }
  return h;
}
function keyClarity(h){
  if (norm(h)===0) return 0;
  let best = 0;
  for (let r=0;r<12;r++){
    const maj = rotate12(KS_MAJOR, r);
    const min = rotate12(KS_MINOR, r);
    best = Math.max(best, cosSim(h, maj), cosSim(h, min));
  }
  return clamp01(best);
}
function verticalConsonance(roll, totalSteps){
  const {pitchesAtStep} = buildStepArrays(roll, totalSteps);
  const W = {0:1.0, 7:0.95, 5:0.85, 3:0.8, 4:0.8, 8:0.6, 9:0.6, 2:0.4, 10:0.4, 6:0.2, 1:0.1, 11:0.1};
  let sum=0, count=0;
  for (let t=0;t<totalSteps;t++){
    const arr = Array.from(pitchesAtStep[t]);
    if (arr.length<=1) continue;
    let s=0, c=0;
    for (let i=0;i<arr.length;i++){
      for (let j=i+1;j<arr.length;j++){
        const iv = Math.abs(arr[i]-arr[j])%12;
        s += (W[iv] ?? 0.2); c++;
      }
    }
    if (c>0){ sum += s/c; count++; }
  }
  return (count>0) ? clamp01(sum/count) : 0;
}
function stepwiseMotion(roll){
  const per = [];
  for (const voice of roll){
    const notes = voice.slice().sort((a,b)=>a.startStep - b.startStep);
    let small=0, all=0, last=null;
    for (const n of notes){
      if (last){ const d = Math.abs((n.pitch|0) - (last.pitch|0)); if (d<=2) small++; all++; }
      last = n;
    }
    per.push(all>0 ? small/all : 0);
  }
  return per.length? per.reduce((a,x)=>a+x,0)/per.length : 0;
}
export function tonalIndex(roll, totalSteps){
  const h = pitchClassHistogram(roll);
  const Ckey = keyClarity(h);
  const Cvert = verticalConsonance(roll, totalSteps);
  const Sstep = stepwiseMotion(roll);
  return clamp01(0.5*Ckey + 0.3*Cvert + 0.2*Sstep);
}

// ---------- 3) Texture & Voice-Leading Coherence (V) ----------
function melodicSmoothness(roll){
  const vals = [];
  for (const voice of roll){
    const notes = voice.slice().sort((a,b)=>a.startStep - b.startStep);
    let sum=0, cnt=0, last=null;
    for (const n of notes){
      if (last){ sum += Math.abs((n.pitch|0) - (last.pitch|0)); cnt++; }
      last=n;
    }
    const meanAbs = (cnt>0)? sum/cnt : 0;
    const S = 1/(1 + meanAbs/3); // k=3 semitones
    vals.push(S);
  }
  return vals.length? vals.reduce((a,x)=>a+x,0)/vals.length : 0;
}
function sustainRatio(roll){
  let long=0, tot=0;
  for (const voice of roll){
    for (const n of voice){
      const w = Math.max(1, n.durSteps|0) * (n.vel ? n.vel/127 : 1);
      tot += w;
      if ((n.durSteps|0) >= 2) long += w; // ≥ 2×16ths
    }
  }
  return (tot>0) ? clamp01(long/tot) : 0;
}
function densityStability(roll, totalSteps){
  const voices = roll.length;
  const {active} = buildStepArrays(roll, totalSteps);
  const d = Array(totalSteps).fill(0);
  for (let t=0;t<totalSteps;t++){
    let k=0;
    for (let v=0; v<voices; v++) if (active[v][t]>0) k++;
    d[t]=k;
  }
  const B = barsCount(totalSteps);
  const sigmas=[];
  for (let m=0;m<B;m++){
    const s0=m*STEPS_PER_BAR, s1=Math.min((m+1)*STEPS_PER_BAR, totalSteps);
    const seg = d.slice(s0,s1);
    const mu = seg.reduce((a,x)=>a+x,0)/seg.length;
    const v = seg.reduce((a,x)=>a+(x-mu)*(x-mu),0)/seg.length;
    sigmas.push(Math.sqrt(v));
  }
  const meanSigma = sigmas.reduce((a,x)=>a+x,0)/sigmas.length;
  return clamp01(1 - meanSigma/2);
}
export function textureIndex(roll, totalSteps){
  const Ssmooth = melodicSmoothness(roll);
  const Sdur = sustainRatio(roll);
  const Sdens = densityStability(roll, totalSteps);
  return clamp01(0.5*Ssmooth + 0.25*Sdur + 0.25*Sdens);
}

// ---------- Guardrails & wrapper ----------
export function triageIndices(roll, totalSteps){
  const {active} = buildStepArrays(roll, totalSteps);
  let activeTime = 0;
  for (let t=0;t<totalSteps;t++){
    let any=0;
    for (let v=0; v<active.length; v++) if (active[v][t]>0){ any=1; break; }
    activeTime += any;
  }
  const fill = activeTime/totalSteps;

  let R = rhythmIndex(roll, totalSteps);
  let T = tonalIndex(roll, totalSteps);
  let V = textureIndex(roll, totalSteps);

  if (fill < 0.01){ R=T=V=0.1; }
  if (fill > 0.9){ R = Math.min(R, 0.3); V = Math.min(V, 0.3); }

  return { R:clamp01(R), T:clamp01(T), V:clamp01(V),
           J: clamp01(0.4*R + 0.35*T + 0.25*V), fill };
}

// ---------- Quantizer & IFS generator ----------
export function makeScaleQuantizer(tonic=60, pcs=[0,2,4,5,7,9,11]){
  return (p)=>{
    const midi = Math.round(p);
    const deg = ((midi - tonic) % 12 + 12) % 12;
    let best = pcs[0], bestd = 12;
    for (const q of pcs){
      const d = Math.min((deg - q + 12) % 12, (q - deg + 12) % 12);
      if (d<bestd){ best=q; bestd=d; }
    }
    return midi - deg + best;
  };
}

// small, stateless seeded RNG (Mulberry32)
function mulberry32(seed){
  let t = seed >>> 0;
  return function(){
    t += 0x6D2B79F5;
    let r = Math.imul(t ^ t>>>15, 1 | t);
    r ^= r + Math.imul(r ^ r>>>7, 61 | r);
    return ((r ^ r>>>14) >>> 0) / 4294967296;
  };
}

export function generateIFS({
  bars=210, voices=4, tonic=60, pcs=[0,2,4,5,7,9,11],
  regs=[50,60,67,72], density=1.2, // notes per bar per voice
  stepBias=[1,0.2,0.5,0.2, 0.8,0.1,0.4,0.1, 0.9,0.1,0.4,0.1, 0.7,0.1,0.3,0.1],
  seed=12345
}={}){
  const totalSteps = bars*STEPS_PER_BAR;
  const Q = makeScaleQuantizer(tonic, pcs);

  // RNG
  const rand = mulberry32(seed|0);
  const rnd = ()=>rand();

  // probability over 16 step positions
  const sumBias = stepBias.reduce((a,x)=>a+x,0);
  const pPhase = stepBias.map(x=>x/sumBias);

  const roll = Array.from({length: voices}, ()=>[]);
  const lastPitch = Array(voices).fill(null);

  function samplePhase(){ // 0..15
    const r = rnd();
    let a=0;
    for (let i=0;i<16;i++){ a+=pPhase[i]; if (r<=a) return i; }
    return 0;
  }
  function sampleStepDur(){ // bias to 2–4, cap 8
    const r1 = rnd(), r2 = rnd(), r3 = rnd();
    let base = 1 + (r1<0.6 ? 1 : 0) + (r2<0.3 ? 1 : 0);
    if (r3<0.15) base += 2;
    return Math.min(base, 8);
  }
  function nextPitch(v){
    const center = regs[v % regs.length];
    const prev = lastPitch[v] ?? (center + (rnd()<0.5?0:7));
    const steps = [-2,-1,0,1,2];
    const leaps = [-5,5,-7,7];
    const step = (rnd()<0.8) ? steps[(rnd()*steps.length)|0]
                             : leaps[(rnd()*leaps.length)|0];
    let p = prev + step;
    p = Math.round(0.7*p + 0.3*center);
    return Q(p);
  }

  for (let v=0; v<voices; v++){
    const nPerBar = density;
    for (let m=0; m<bars; m++){
      const jit = (rnd()-0.5)*0.5;
      const nNotes = Math.max(1, Math.round(nPerBar + jit));
      const used = new Set();
      for (let k=0; k<nNotes; k++){
        let phase=samplePhase(), tries=0;
        while (used.has(phase) && tries<16){ phase=(phase+1)%16; tries++; }
        used.add(phase);
        const startStep = m*STEPS_PER_BAR + phase;
        const pitch = nextPitch(v);
        lastPitch[v] = pitch;
        const durSteps = sampleStepDur();
        const vel = 80 + Math.floor(rnd()*36); // 80..115
        roll[v].push({startStep, durSteps, pitch, vel});
      }
    }
  }
  return {roll, totalSteps};
}

export function toCsoundIStatements(roll){
  const lines=[];
  for (let v=0; v<roll.length; v++){
    for (const n of roll[v]){
      const t = (n.startStep)*STEP_SEC;
      const d = (n.durSteps)*STEP_SEC;
      lines.push(`i ${v+1} ${t.toFixed(3)} ${d.toFixed(3)} ${n.pitch|0} ${Math.max(1,n.vel|0)}`);
    }
  }
  return lines.join("\n");
}
