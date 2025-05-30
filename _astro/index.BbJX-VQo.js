function __vite__mapDeps(indexes) {
  if (!__vite__mapDeps.viteFileDeps) {
    __vite__mapDeps.viteFileDeps = []
  }
  return indexes.map((i) => __vite__mapDeps.viteFileDeps[i])
}
import{_}from"./preload-helper.BTSXcWDV.js";import{C as w,A as r,E as h}from"./index.DeKTR5mX.js";import{g as m}from"./scope.hDWzALKC.js";import"./_commonjsHelpers.BosuxZz1.js";const b=`<CsoundSynthesizer>
<CsInstruments>

sr=48000
ksmps=64
nchnls=2
0dbfs=1

</CsInstruments>
</CsoundSynthesizer>`,C=`; returns value of given key in given "string map"
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
endin`;let l,e;async function y(n=""){await c(),n&&(n=`${n}`,await e?.evalCode(n))}const M=y,A=y,z=w("csound",(n,i)=>(n=n||"triangle",c(),i.onTrigger((t,s)=>{if(!e){r("[csound] not loaded yet","warning");return}s.ensureObjectValue();let{gain:a=.8}=s.value;a*=.2;const o=Math.round(h(s)),g=Object.entries({...s.value,freq:o}).flat().join("/"),d=`i ${[`"${n}"`,t-m().currentTime,s.duration+0,o,a,`"${g}"`].join(" ")}`;e.inputMessage(d)})));function O(n,i){const[t]=i;if(n==="message"&&(["[commit: HEAD]"].includes(t)||t.startsWith("--Csound version")||t.startsWith("libsndfile")||t.startsWith("sr =")||t.startsWith("0dBFS")||t.startsWith("audio buffered")||t.startsWith("writing")||t.startsWith("SECTION 1:")))return;let s="info";t.startsWith("error:")&&(s="error"),r(`[csound] ${t||""}`,s)}async function q(){if(window.__csound__)return r("[load] Using external Csound","warning"),e=window.__csound__,e;{const{Csound:n}=await _(()=>import("./csound.rGqV05_F.js"),__vite__mapDeps([]));return e=await n({audioContext:m()}),e.removeAllListeners("message"),["message"].forEach(i=>e.on(i,(...t)=>O(i,t))),await e.setOption("-m0d"),await e.setOption("--sample-accurate"),await e.setOption("-odac"),await e.compileCsdText(b),await e.compileOrc(C),await e.start(),e}}async function c(){return l=l||q(),l}let f={};async function D(n){if(await c(),typeof n!="string")throw new Error("loadOrc: expected url string");if(n.startsWith("github:")){const[i,t]=n.split("github:");n=`https://raw.githubusercontent.com/${t}`}f[n]||(f[n]=fetch(n).then(i=>i.text()).then(i=>e.compileOrc(i))),await f[n]}const I=w("csoundm",(n,i)=>{let t=n;return typeof n=="string"&&(t=`"${n}"`),c(),i.onTrigger((s,a)=>{if(!e){r("[csound] not loaded yet","warning");return}if(typeof a.value!="object")throw new Error("csound only support objects as hap values");const o=s-m().currentTime,g=a.duration.valueOf()+0,u=h(a);let{gain:d=1,velocity:p=.9}=a.value;p=d*p;const k=(Math.log(u/261.62558)/Math.log(2)+8)*12-36,S=127*p;Object.entries({...a.value,frequency:u}).flat().join("/");const v=`i ${t} ${o} ${g} ${k} ${S}`;console.log("[csoundm]:",v),e.inputMessage(v)})});export{z as csound,I as csoundm,y as loadCSound,A as loadCsound,D as loadOrc,M as loadcsound};
//# sourceMappingURL=index.BbJX-VQo.js.map
