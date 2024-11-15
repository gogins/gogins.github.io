function __vite__mapDeps(indexes) {
  if (!__vite__mapDeps.viteFileDeps) {
    __vite__mapDeps.viteFileDeps = []
  }
  return indexes.map((i) => __vite__mapDeps.viteFileDeps[i])
}
import{_ as O}from"./codemirror.DZQfiqCZ.js";import{d as h,l as g,e as y}from"./index.CEVOgZNG.js";import{g as k}from"./scope.CyWYA9A5.js";import"./index.xsBMAGf9.js";import"./_commonjsHelpers.BosuxZz1.js";const C=`<CsoundSynthesizer>
<CsInstruments>

sr=48000
ksmps=64
nchnls=2
0dbfs=1

</CsInstruments>
</CsoundSynthesizer>`,q=`; returns value of given key in given "string map"
; keymap("freq", "note/c3/freq/220/gain/0.5")
; yields "220"
opcode keymap, S, SS
  Skey, Smap xin
  idelimiter = strindex(Smap, strcat(Skey, "/"))
  ifrom = idelimiter + strlen(Skey) + 1
  Svalue = strsub(Smap, ifrom, strlen(Smap))
  Svalue = strsub(Svalue, 0, strindex(Svalue, "/"))
  xout Svalue
endop

; TODO add incredibly dope synths
instr organ
    iduration = p3
    ifreq = p4
    igain = p5
    ioct = octcps(ifreq)

    asig = vco2(igain, ifreq, 12, .5) ; my edit
    kpwm = oscili(.1, 5)
    asig = vco2(igain, ifreq, 4, .5 + kpwm)
    asig += vco2(igain/4, ifreq * 2)

    ; filter
    ; idepth = 2
    ; acut = transegr:a(0, .005, 0, idepth, .06, -4.2, 0.001, .01, -4.2, 0) ; filter envelope
    ; asig = zdf_2pole(asig, cpsoct(ioct + acut), 0.5)

    ; amp envelope
    iattack = .001
    irelease = .05
    asig *= linsegr:a(0, iattack, 1, iduration, 1, irelease, 0)

    out(asig, asig)

endin

instr triangle
  iduration = p3
  ifreq = p4
  igain = p5
  ioct = octcps(ifreq)
  
  asig = vco2(igain, ifreq, 12, .5)
  
  ; amp envelope
  iattack = .001
  irelease = .05
  asig *= linsegr:a(0, iattack, 1, iduration, 1, irelease, 0)
  
  out(asig, asig)
endin

instr pad
    iduration = p3
    ifreq = p4
    igain = p5
    ioct = octcps(ifreq)

    asig = vco2(igain, ifreq, 0)

    ; amp envelope
    iattack = .5
    irelease = .1
    asig *= linsegr:a(0, iattack, 1, iduration, 1, irelease, 0)
    
    idepth = 2
    acut = transegr:a(0, .005, 0, idepth, .06, -4.2, 0.001, .01, -4.2, 0)
    asig = zdf_2pole(asig, 1000, 2)

    out(asig, asig)
endin


gisine	ftgen	0, 0, 4096, 10, 1

instr bow
    kpres = 2
    krat = 0.16
    kvibf = 6.12723
    
    kvib  linseg 0, 0.5, 0, 1, 1, p3-0.5, 1	
    kvamp = kvib * 0.01
    asig  wgbow .7, p4, kpres, krat, kvibf, kvamp, gisine
    asig = asig*p5
    outs asig, asig
endin


instr Meta
    Smap = strget(p6)
    Sinstrument = keymap("s", Smap)
    schedule(Sinstrument, 0, p3, p4, p5)
    ; TODO find a way to pipe Sinstrument through effects
endin`;let l,e;async function S(n=""){await d(),n&&(n=`${n}`,await e?.evalCode(n))}const z=S,A=S,D=h("csound",(n,i)=>(n=n||"triangle",d(),i.onTrigger((t,s,a,m,p)=>{if(!e){g("[csound] not loaded yet","warning");return}s.ensureObjectValue();let{gain:o=.8}=s.value;o*=.2;const c=Math.round(y(s)),r=Object.entries({...s.value,freq:c}).flat().join("/"),v=p-a,u=`i ${[`"${n}"`,v,s.duration+0,c,o,`"${r}"`].join(" ")}`;e.inputMessage(u)})));function $(n,i){const[t]=i;if(n==="message"&&(["[commit: HEAD]"].includes(t)||t.startsWith("--Csound version")||t.startsWith("libsndfile")||t.startsWith("sr =")||t.startsWith("0dBFS")||t.startsWith("audio buffered")||t.startsWith("writing")||t.startsWith("SECTION 1:")))return;let s="info";t.startsWith("error:")&&(s="error"),g(`[csound] ${t||""}`,s)}async function x(){if(window.__csound__)return g("[load] Using external Csound","warning"),e=window.__csound__,e;{const{Csound:n}=await O(()=>import("./csound.rGqV05_F.js"),__vite__mapDeps([]));return e=await n({audioContext:k()}),e.removeAllListeners("message"),["message"].forEach(i=>e.on(i,(...t)=>$(i,t))),await e.setOption("-m0d"),await e.setOption("--sample-accurate"),await e.setOption("-odac"),await e.compileCsdText(C),await e.compileOrc(q),await e.start(),e}}async function d(){return l=l||x(),l}let f={};async function I(n){if(await d(),typeof n!="string")throw new Error("loadOrc: expected url string");if(n.startsWith("github:")){const[i,t]=n.split("github:");n=`https://raw.githubusercontent.com/${t}`}f[n]||(f[n]=fetch(n).then(i=>i.text()).then(i=>e.compileOrc(i))),await f[n]}const L=h("csoundm",(n,i)=>{let t=n;return typeof n=="string"&&(t=`"${n}"`),d(),i.onTrigger((s,a)=>{if(!e){g("[csound] not loaded yet","warning");return}if(typeof a.value!="object")throw new Error("csound only support objects as hap values");const m=s-k().currentTime,p=a.duration.valueOf()+0,o=y(a);let{gain:c=1,velocity:r=.9}=a.value;r=c*r;const u=(Math.log(o/261.62558)/Math.log(2)+8)*12-36,b=127*r;Object.entries({...a.value,frequency:o}).flat().join("/");const w=`i ${t} ${m} ${p} ${u} ${b}`;console.log("[csoundm]:",w),e.inputMessage(w)})});export{D as csound,L as csoundm,S as loadCSound,A as loadCsound,I as loadOrc,z as loadcsound};
//# sourceMappingURL=index.D_beRykn.js.map
