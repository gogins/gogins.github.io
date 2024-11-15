function __vite__mapDeps(indexes) {
  if (!__vite__mapDeps.viteFileDeps) {
    __vite__mapDeps.viteFileDeps = []
  }
  return indexes.map((i) => __vite__mapDeps.viteFileDeps[i])
}
import{i as f,c as g,_ as w}from"./codemirror.DcFRIHI_.js";import"./index.CEVOgZNG.js";import"./index.D_JsPLR7.js";import"./_commonjsHelpers.BosuxZz1.js";f(g.get().theme);const s=()=>{document.documentElement.style.setProperty("--app-height",`${window.innerHeight-1}px`)};typeof window<"u"&&(window.addEventListener("resize",s),s());function u(i={}){const{immediate:a=!1,onNeedRefresh:h,onOfflineReady:d,onRegistered:c,onRegisteredSW:r,onRegisterError:p}=i;let t,n;const l=async(o=!0)=>{await n};async function m(){if("serviceWorker"in navigator){const{Workbox:o}=await w(()=>import("./workbox-window.prod.es5.DFjpnwFp.js"),__vite__mapDeps([]));t=new o("/sw.js",{scope:"/",type:"classic"}),t.addEventListener("activated",e=>{(e.isUpdate||e.isExternal)&&window.location.reload()}),t.addEventListener("installed",e=>{e.isUpdate||d?.()}),t.register({immediate:a}).then(e=>{r?r("/sw.js",e):c?.(e)}).catch(e=>{p?.(e)})}}return n=m(),l}u({immediate:!0,onRegisteredSW(i){},onOfflineReady(){}});
//# sourceMappingURL=hoisted.DWU3Kek3.js.map
