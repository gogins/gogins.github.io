import{P as g,v as i,u as v}from"./index.Cq8ZdErn.js";import{I as b}from"./utils.DVIrqvtf.js";import"./useClient.CWiTElP1.js";import"./preload-helper.9kgL1G8q.js";import"./_commonjsHelpers.BosuxZz1.js";import"./scope.R9TuNW29.js";import"./index.DIn8BZQ7.js";/* empty css                      */g.prototype.osc=function(){return this.onTrigger(async(O,e,m,u=1,c)=>{e.ensureObjectValue();const l=e.wholeOrPart().begin.valueOf(),p=e.duration.valueOf(),t=Object.assign({},{cps:u,cycle:l,delta:p},e.value);t.n&&(t.n=i(t.n)),t.note&&(t.note=i(t.note));const n=[],f=Math.round(Date.now()+v(c,m));Object.keys(t).forEach(s=>{const o=t[s],a=typeof o=="number"?o.toString():o;a!=null&&n.push({name:s,value:a,valueisnumber:typeof o=="number"})});const r=[];n.length&&r.push({target:"/dirt/play",timestamp:f,params:n}),r.length&&setTimeout(()=>{b("sendosc",{messagesfromjs:r})})})};
//# sourceMappingURL=oscbridge.DW2rjpxE.js.map