import{_ as c}from"./preload-helper.p054LDAL.js";import{g as i}from"./index.diuTzW_X.js";let e;function d(t){const{canvas:a}=i();return t.canvas.id="hydra-canvas",t.canvas.style.position="fixed",t.canvas.style.top="0px",a.after(t.canvas),a}async function l(t={}){if(e&&JSON.stringify(e)!==JSON.stringify(t)&&document.getElementById("hydra-canvas").remove(),e=t,!document.getElementById("hydra-canvas")){console.log("reinit..");const{src:a="https://unpkg.com/hydra-synth",feedStrudel:r=!1,...o}={detectAudio:!1,...t};await c(()=>import(a),__vite__mapDeps([]));const n=new Hydra(o);if(r){const{canvas:s}=i();s.style.display="none",n.synth.s0.init({src:s})}d(n)}}const v=t=>()=>t.queryArc(getTime(),getTime())[0].value;export{v as H,l as initHydra};
function __vite__mapDeps(indexes) {
  if (!__vite__mapDeps.viteFileDeps) {
    __vite__mapDeps.viteFileDeps = []
  }
  return indexes.map((i) => __vite__mapDeps.viteFileDeps[i])
}