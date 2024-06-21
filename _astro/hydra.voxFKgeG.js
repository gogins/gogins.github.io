function __vite__mapDeps(indexes) {
  if (!__vite__mapDeps.viteFileDeps) {
    __vite__mapDeps.viteFileDeps = []
  }
  return indexes.map((i) => __vite__mapDeps.viteFileDeps[i])
}
import{_ as m}from"./preload-helper.DD-9sS-h.js";import{g as r,o as f,q as g,t as p,u as i}from"./index.DR46Wx_P.js";import"./_commonjsHelpers.BosuxZz1.js";let t,a;async function T(e={}){if(t&&JSON.stringify(t)!==JSON.stringify(e)&&document.getElementById("hydra-canvas")?.remove(),t=e,!document.getElementById("hydra-canvas")){const{src:o="https://unpkg.com/hydra-synth",feedStrudel:d=!1,contextType:c="webgl",pixelRatio:l=1,pixelated:y=!0,...s}={detectAudio:!1,...e},{canvas:h}=r("hydra-canvas",{contextType:c,pixelRatio:l,pixelated:y});if(s.canvas=h,await m(()=>import(o),__vite__mapDeps([])),a=new Hydra(s),d){const{canvas:n}=r();n.style.display="none",a.synth.s0.init({src:n})}}}function x(){a&&a.hush(),globalThis.s0?.clear(),document.getElementById("hydra-canvas")?.remove(),globalThis.speed=f,globalThis.shape=g}const E=e=>()=>p(e).queryArc(i(),i())[0].value;export{E as H,x as clearHydra,T as initHydra};
//# sourceMappingURL=hydra.voxFKgeG.js.map
