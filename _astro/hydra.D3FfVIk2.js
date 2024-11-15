function __vite__mapDeps(indexes) {
  if (!__vite__mapDeps.viteFileDeps) {
    __vite__mapDeps.viteFileDeps = []
  }
  return indexes.map((i) => __vite__mapDeps.viteFileDeps[i])
}
import{_ as h}from"./codemirror.r8QnqVLK.js";import{g as n}from"./index.xsBMAGf9.js";import{s as f,a as g,r as p,g as i}from"./index.CEVOgZNG.js";import"./_commonjsHelpers.BosuxZz1.js";let t,a;async function x(e={}){if(t&&JSON.stringify(t)!==JSON.stringify(e)&&document.getElementById("hydra-canvas")?.remove(),t=e,!document.getElementById("hydra-canvas")){const{src:o="https://unpkg.com/hydra-synth",feedStrudel:d=!1,contextType:c="webgl",pixelRatio:l=1,pixelated:y=!0,...s}={detectAudio:!1,...e},{canvas:m}=n("hydra-canvas",{contextType:c,pixelRatio:l,pixelated:y});if(s.canvas=m,await h(()=>import(o),__vite__mapDeps([])),a=new Hydra(s),d){const{canvas:r}=n();r.style.display="none",a.synth.s0.init({src:r})}}}function E(){a&&a.hush(),globalThis.s0?.clear(),document.getElementById("hydra-canvas")?.remove(),globalThis.speed=f,globalThis.shape=g}const b=e=>()=>p(e).queryArc(i(),i())[0].value;export{b as H,E as clearHydra,x as initHydra};
//# sourceMappingURL=hydra.D3FfVIk2.js.map
