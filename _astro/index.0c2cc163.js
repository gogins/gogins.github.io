import{_ as S}from"./preload-helper.f847b49d.js";import{a as v,l as r,b as w}from"./index.0c96e269.js";import{f as l}from"./scope.019c43c0.js";import"./_commonjsHelpers.de833af9.js";const b=`<CsoundSynthesizer>
<CsInstruments>

sr=48000
ksmps=64
nchnls=2
0dbfs=1

</CsInstruments>
</CsoundSynthesizer>`,_=`; returns value of given key in given "string map"
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
endin`;let u,e;async function h(n=""){await c(),n&&(n=`${n}`,await e?.evalCode(n))}const j=h,E=h,M=v("csound",(n,i)=>(n=n||"triangle",c(),i.onTrigger((t,s)=>{if(!e){r("[csound] not loaded yet","warning");return}s.ensureObjectValue();let{gain:a=.8}=s.value;a*=.2;const o=Math.round(w(s)),g=Object.entries({...s.value,freq:o}).flat().join("/"),f=`i ${[`"${n}"`,t-l().currentTime,s.duration+0,o,a,`"${g}"`].join(" ")}`;e.inputMessage(f)})));function O(n,i){const[t]=i;if(n==="message"&&(["[commit: HEAD]"].includes(t)||t.startsWith("--Csound version")||t.startsWith("libsndfile")||t.startsWith("sr =")||t.startsWith("0dBFS")||t.startsWith("audio buffered")||t.startsWith("writing")||t.startsWith("SECTION 1:")))return;let s="info";t.startsWith("error:")&&(s="error"),r(`[csound] ${t||""}`,s)}async function C(){if(window.__csound__)return r("[load] Using external Csound","warning"),e=window.__csound__,e;{const{Csound:n}=await S(()=>import("./csound.f280dac2.js"),[]);return e=await n({audioContext:l()}),e.removeAllListeners("message"),["message"].forEach(i=>e.on(i,(...t)=>O(i,t))),await e.setOption("-m0d"),await e.setOption("--sample-accurate"),await e.setOption("-odac"),await e.compileCsdText(b),await e.compileOrc(_),await e.start(),e}}async function c(){return u=u||C(),u}let p={};async function z(n){if(await c(),typeof n!="string")throw new Error("loadOrc: expected url string");if(n.startsWith("github:")){const[i,t]=n.split("github:");n=`https://raw.githubusercontent.com/${t}`}p[n]||(p[n]=fetch(n).then(i=>i.text()).then(i=>e.compileOrc(i))),await p[n]}const A=v("csoundm",(n,i)=>{let t=n;return typeof n=="string"&&(t=`"${n}"`),c(),i.onTrigger((s,a)=>{if(!e){r("[csound] not loaded yet","warning");return}if(typeof a.value!="object")throw new Error("csound only support objects as hap values");const o=s-l().currentTime,g=a.duration.valueOf()+0,d=w(a),y=(Math.log(d/261.62558)/Math.log(2)+8)*12-36,k=127*(a.context?.velocity??.9);Object.entries({...a.value,frequency:d}).flat().join("/");const m=`i ${t} ${o} ${g} ${y} ${k}`;console.log("[csoundm]:",m),e.inputMessage(m)})});export{M as csound,A as csoundm,h as loadCSound,E as loadCsound,z as loadOrc,j as loadcsound};
//# sourceMappingURL=index.0c2cc163.js.map
