import{z as m,c as g,_ as w}from"./preload-helper.531c110d.js";import"./index.0c96e269.js";import"./_commonjsHelpers.de833af9.js";m(g.get().theme);const s=()=>{document.documentElement.style.setProperty("--app-height",`${window.innerHeight-1}px`)};typeof window<"u"&&(window.addEventListener("resize",s),s());function u(i={}){const{immediate:a=!1,onNeedRefresh:h,onOfflineReady:d,onRegistered:c,onRegisteredSW:r,onRegisterError:l}=i;let t,n;const p=async(o=!0)=>{await n};async function f(){if("serviceWorker"in navigator){const{Workbox:o}=await w(()=>import("./workbox-window.prod.es5.a7b12eab.js"),[]);t=new o("/sw.js",{scope:"/",type:"classic"}),t.addEventListener("activated",e=>{(e.isUpdate||e.isExternal)&&window.location.reload()}),t.addEventListener("installed",e=>{e.isUpdate||d?.()}),t.register({immediate:a}).then(e=>{r?r("/sw.js",e):c?.(e)}).catch(e=>{l?.(e)})}}return n=f(),p}u({immediate:!0,onRegisteredSW(i){},onOfflineReady(){}});
//# sourceMappingURL=hoisted.268ab3a5.js.map