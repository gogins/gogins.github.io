import{I as b}from"./utils.f11d1ed5.js";import{P as h,n as g}from"./index.86034b57.js";import"./util.da3382fd.js";import"./_commonjsHelpers.de833af9.js";import"./index.f3ddec24.js";import"./preload-helper.a5b6065c.js";import"./scope.4b7f6baa.js";/* empty css                       */const v=144,E=128,M=176;h.prototype.midi=function(u){return this.onTrigger((a,e,d)=>{const{note:n,nrpnn:x,nrpv:y,ccn:s,ccv:t}=e.value,p=(a-d)*1e3,f=Math.floor((e.context?.velocity??.9)*100),l=Math.floor(e.duration.valueOf()*1e3-10),i=Math.round(p),c=(e.value.midichan??1)-1,m=u??"IAC",o=[];if(n!=null){const r=typeof n=="number"?n:g(n);o.push({requestedport:m,message:[v+c,r,f],offset:i}),o.push({requestedport:m,message:[E+c,r,f],offset:i+l})}if(t&&s){if(typeof t!="number"||t<0||t>1)throw new Error("expected ccv to be a number between 0 and 1");if(!["string","number"].includes(typeof s))throw new Error("expected ccn to be a number or a string");const r=Math.round(t*127);o.push({requestedport:m,message:[M+c,s,r],offset:i})}o.length&&setTimeout(()=>{b("sendmidi",{messagesfromjs:o})})})};
//# sourceMappingURL=midibridge.161552c4.js.map