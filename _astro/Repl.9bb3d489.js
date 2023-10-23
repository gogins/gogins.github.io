import{_ as B,g as He,u as we,j as at,m as Lt,b as q,n as Ut,o as Gt,p as Mt,q as qt}from"./settings.270953c1.js";import{l as W,I as zt,J as Ht,E as Jt,K as Kt,L as lt}from"./index.a2044bc2.js";import{t as F,k as Vt,p as Wt,r as Yt,a as Xt,q as Zt,C as Qt}from"./useKeydown.71409498.js";import{f as be,s as es,h as ts,a as ss,e as rs}from"./scope.f68c2f6d.js";import{g as ns,c as is,r as v}from"./index.3d4af9ee.js";import{j as h}from"./jsx-runtime.7e7f555b.js";import"./mini.03263755.js";import{u as Ct}from"./useFrame.84ba1694.js";import{j as os}from"./doc.fa0d4fbe.js";import{c as as,d as ls,i as cs,p as ds,e as At}from"./prebake.5a610a01.js";function hs(r,e){for(var t=0;t<e.length;t++){const s=e[t];if(typeof s!="string"&&!Array.isArray(s)){for(const n in s)if(n!=="default"&&!(n in r)){const i=Object.getOwnPropertyDescriptor(s,n);i&&Object.defineProperty(r,n,i.get?i:{enumerable:!0,get:()=>s[n]})}}}return Object.freeze(Object.defineProperty(r,Symbol.toStringTag,{value:"Module"}))}var us=globalThis&&globalThis.__awaiter||function(r,e,t,s){function n(i){return i instanceof t?i:new t(function(o){o(i)})}return new(t||(t=Promise))(function(i,o){function a(d){try{c(s.next(d))}catch(u){o(u)}}function l(d){try{c(s.throw(d))}catch(u){o(u)}}function c(d){d.done?i(d.value):n(d.value).then(a,l)}c((s=s.apply(r,e||[])).next())})};const fs=r=>{let e;return r?e=r:typeof fetch>"u"?e=(...t)=>us(void 0,void 0,void 0,function*(){return yield(yield B(()=>Promise.resolve().then(()=>Fe),void 0)).fetch(...t)}):e=fetch,(...t)=>e(...t)};class Qe extends Error{constructor(e,t="FunctionsError",s){super(e),super.name=t,this.context=s}}class ps extends Qe{constructor(e){super("Failed to send a request to the Edge Function","FunctionsFetchError",e)}}class ms extends Qe{constructor(e){super("Relay Error invoking the Edge Function","FunctionsRelayError",e)}}class gs extends Qe{constructor(e){super("Edge Function returned a non-2xx status code","FunctionsHttpError",e)}}var vs=globalThis&&globalThis.__awaiter||function(r,e,t,s){function n(i){return i instanceof t?i:new t(function(o){o(i)})}return new(t||(t=Promise))(function(i,o){function a(d){try{c(s.next(d))}catch(u){o(u)}}function l(d){try{c(s.throw(d))}catch(u){o(u)}}function c(d){d.done?i(d.value):n(d.value).then(a,l)}c((s=s.apply(r,e||[])).next())})};class ys{constructor(e,{headers:t={},customFetch:s}={}){this.url=e,this.headers=t,this.fetch=fs(s)}setAuth(e){this.headers.Authorization=`Bearer ${e}`}invoke(e,t={}){var s;return vs(this,void 0,void 0,function*(){try{const{headers:n,method:i,body:o}=t;let a={},l;o&&(n&&!Object.prototype.hasOwnProperty.call(n,"Content-Type")||!n)&&(typeof Blob<"u"&&o instanceof Blob||o instanceof ArrayBuffer?(a["Content-Type"]="application/octet-stream",l=o):typeof o=="string"?(a["Content-Type"]="text/plain",l=o):typeof FormData<"u"&&o instanceof FormData?l=o:(a["Content-Type"]="application/json",l=JSON.stringify(o)));const c=yield this.fetch(`${this.url}/${e}`,{method:i||"POST",headers:Object.assign(Object.assign(Object.assign({},a),this.headers),n),body:l}).catch(y=>{throw new ps(y)}),d=c.headers.get("x-relay-error");if(d&&d==="true")throw new ms(c);if(!c.ok)throw new gs(c);let u=((s=c.headers.get("Content-Type"))!==null&&s!==void 0?s:"text/plain").split(";")[0].trim(),p;return u==="application/json"?p=yield c.json():u==="application/octet-stream"?p=yield c.blob():u==="multipart/form-data"?p=yield c.formData():p=yield c.text(),{data:p,error:null}}catch(n){return{data:null,error:n}}})}}var Je={exports:{}};(function(r,e){var t=typeof self<"u"?self:is,s=function(){function i(){this.fetch=!1,this.DOMException=t.DOMException}return i.prototype=t,new i}();(function(i){(function(o){var a={searchParams:"URLSearchParams"in i,iterable:"Symbol"in i&&"iterator"in Symbol,blob:"FileReader"in i&&"Blob"in i&&function(){try{return new Blob,!0}catch{return!1}}(),formData:"FormData"in i,arrayBuffer:"ArrayBuffer"in i};function l(f){return f&&DataView.prototype.isPrototypeOf(f)}if(a.arrayBuffer)var c=["[object Int8Array]","[object Uint8Array]","[object Uint8ClampedArray]","[object Int16Array]","[object Uint16Array]","[object Int32Array]","[object Uint32Array]","[object Float32Array]","[object Float64Array]"],d=ArrayBuffer.isView||function(f){return f&&c.indexOf(Object.prototype.toString.call(f))>-1};function u(f){if(typeof f!="string"&&(f=String(f)),/[^a-z0-9\-#$%&'*+.^_`|~]/i.test(f))throw new TypeError("Invalid character in header field name");return f.toLowerCase()}function p(f){return typeof f!="string"&&(f=String(f)),f}function y(f){var m={next:function(){var x=f.shift();return{done:x===void 0,value:x}}};return a.iterable&&(m[Symbol.iterator]=function(){return m}),m}function g(f){this.map={},f instanceof g?f.forEach(function(m,x){this.append(x,m)},this):Array.isArray(f)?f.forEach(function(m){this.append(m[0],m[1])},this):f&&Object.getOwnPropertyNames(f).forEach(function(m){this.append(m,f[m])},this)}g.prototype.append=function(f,m){f=u(f),m=p(m);var x=this.map[f];this.map[f]=x?x+", "+m:m},g.prototype.delete=function(f){delete this.map[u(f)]},g.prototype.get=function(f){return f=u(f),this.has(f)?this.map[f]:null},g.prototype.has=function(f){return this.map.hasOwnProperty(u(f))},g.prototype.set=function(f,m){this.map[u(f)]=p(m)},g.prototype.forEach=function(f,m){for(var x in this.map)this.map.hasOwnProperty(x)&&f.call(m,this.map[x],x,this)},g.prototype.keys=function(){var f=[];return this.forEach(function(m,x){f.push(x)}),y(f)},g.prototype.values=function(){var f=[];return this.forEach(function(m){f.push(m)}),y(f)},g.prototype.entries=function(){var f=[];return this.forEach(function(m,x){f.push([x,m])}),y(f)},a.iterable&&(g.prototype[Symbol.iterator]=g.prototype.entries);function _(f){if(f.bodyUsed)return Promise.reject(new TypeError("Already read"));f.bodyUsed=!0}function b(f){return new Promise(function(m,x){f.onload=function(){m(f.result)},f.onerror=function(){x(f.error)}})}function A(f){var m=new FileReader,x=b(m);return m.readAsArrayBuffer(f),x}function O(f){var m=new FileReader,x=b(m);return m.readAsText(f),x}function $(f){for(var m=new Uint8Array(f),x=new Array(m.length),D=0;D<m.length;D++)x[D]=String.fromCharCode(m[D]);return x.join("")}function S(f){if(f.slice)return f.slice(0);var m=new Uint8Array(f.byteLength);return m.set(new Uint8Array(f)),m.buffer}function J(){return this.bodyUsed=!1,this._initBody=function(f){this._bodyInit=f,f?typeof f=="string"?this._bodyText=f:a.blob&&Blob.prototype.isPrototypeOf(f)?this._bodyBlob=f:a.formData&&FormData.prototype.isPrototypeOf(f)?this._bodyFormData=f:a.searchParams&&URLSearchParams.prototype.isPrototypeOf(f)?this._bodyText=f.toString():a.arrayBuffer&&a.blob&&l(f)?(this._bodyArrayBuffer=S(f.buffer),this._bodyInit=new Blob([this._bodyArrayBuffer])):a.arrayBuffer&&(ArrayBuffer.prototype.isPrototypeOf(f)||d(f))?this._bodyArrayBuffer=S(f):this._bodyText=f=Object.prototype.toString.call(f):this._bodyText="",this.headers.get("content-type")||(typeof f=="string"?this.headers.set("content-type","text/plain;charset=UTF-8"):this._bodyBlob&&this._bodyBlob.type?this.headers.set("content-type",this._bodyBlob.type):a.searchParams&&URLSearchParams.prototype.isPrototypeOf(f)&&this.headers.set("content-type","application/x-www-form-urlencoded;charset=UTF-8"))},a.blob&&(this.blob=function(){var f=_(this);if(f)return f;if(this._bodyBlob)return Promise.resolve(this._bodyBlob);if(this._bodyArrayBuffer)return Promise.resolve(new Blob([this._bodyArrayBuffer]));if(this._bodyFormData)throw new Error("could not read FormData body as blob");return Promise.resolve(new Blob([this._bodyText]))},this.arrayBuffer=function(){return this._bodyArrayBuffer?_(this)||Promise.resolve(this._bodyArrayBuffer):this.blob().then(A)}),this.text=function(){var f=_(this);if(f)return f;if(this._bodyBlob)return O(this._bodyBlob);if(this._bodyArrayBuffer)return Promise.resolve($(this._bodyArrayBuffer));if(this._bodyFormData)throw new Error("could not read FormData body as text");return Promise.resolve(this._bodyText)},a.formData&&(this.formData=function(){return this.text().then(Be)}),this.json=function(){return this.text().then(JSON.parse)},this}var ae=["DELETE","GET","HEAD","OPTIONS","POST","PUT"];function Ce(f){var m=f.toUpperCase();return ae.indexOf(m)>-1?m:f}function U(f,m){m=m||{};var x=m.body;if(f instanceof U){if(f.bodyUsed)throw new TypeError("Already read");this.url=f.url,this.credentials=f.credentials,m.headers||(this.headers=new g(f.headers)),this.method=f.method,this.mode=f.mode,this.signal=f.signal,!x&&f._bodyInit!=null&&(x=f._bodyInit,f.bodyUsed=!0)}else this.url=String(f);if(this.credentials=m.credentials||this.credentials||"same-origin",(m.headers||!this.headers)&&(this.headers=new g(m.headers)),this.method=Ce(m.method||this.method||"GET"),this.mode=m.mode||this.mode||null,this.signal=m.signal||this.signal,this.referrer=null,(this.method==="GET"||this.method==="HEAD")&&x)throw new TypeError("Body not allowed for GET or HEAD requests");this._initBody(x)}U.prototype.clone=function(){return new U(this,{body:this._bodyInit})};function Be(f){var m=new FormData;return f.trim().split("&").forEach(function(x){if(x){var D=x.split("="),R=D.shift().replace(/\+/g," "),j=D.join("=").replace(/\+/g," ");m.append(decodeURIComponent(R),decodeURIComponent(j))}}),m}function ee(f){var m=new g,x=f.replace(/\r?\n[\t ]+/g," ");return x.split(/\r?\n/).forEach(function(D){var R=D.split(":"),j=R.shift().trim();if(j){var K=R.join(":").trim();m.append(j,K)}}),m}J.call(U.prototype);function I(f,m){m||(m={}),this.type="default",this.status=m.status===void 0?200:m.status,this.ok=this.status>=200&&this.status<300,this.statusText="statusText"in m?m.statusText:"OK",this.headers=new g(m.headers),this.url=m.url||"",this._initBody(f)}J.call(I.prototype),I.prototype.clone=function(){return new I(this._bodyInit,{status:this.status,statusText:this.statusText,headers:new g(this.headers),url:this.url})},I.error=function(){var f=new I(null,{status:0,statusText:""});return f.type="error",f};var Ae=[301,302,303,307,308];I.redirect=function(f,m){if(Ae.indexOf(m)===-1)throw new RangeError("Invalid status code");return new I(null,{status:m,headers:{location:f}})},o.DOMException=i.DOMException;try{new o.DOMException}catch{o.DOMException=function(m,x){this.message=m,this.name=x;var D=Error(m);this.stack=D.stack},o.DOMException.prototype=Object.create(Error.prototype),o.DOMException.prototype.constructor=o.DOMException}function he(f,m){return new Promise(function(x,D){var R=new U(f,m);if(R.signal&&R.signal.aborted)return D(new o.DOMException("Aborted","AbortError"));var j=new XMLHttpRequest;function K(){j.abort()}j.onload=function(){var te={status:j.status,statusText:j.statusText,headers:ee(j.getAllResponseHeaders()||"")};te.url="responseURL"in j?j.responseURL:te.headers.get("X-Request-URL");var ue="response"in j?j.response:j.responseText;x(new I(ue,te))},j.onerror=function(){D(new TypeError("Network request failed"))},j.ontimeout=function(){D(new TypeError("Network request failed"))},j.onabort=function(){D(new o.DOMException("Aborted","AbortError"))},j.open(R.method,R.url,!0),R.credentials==="include"?j.withCredentials=!0:R.credentials==="omit"&&(j.withCredentials=!1),"responseType"in j&&a.blob&&(j.responseType="blob"),R.headers.forEach(function(te,ue){j.setRequestHeader(ue,te)}),R.signal&&(R.signal.addEventListener("abort",K),j.onreadystatechange=function(){j.readyState===4&&R.signal.removeEventListener("abort",K)}),j.send(typeof R._bodyInit>"u"?null:R._bodyInit)})}return he.polyfill=!0,i.fetch||(i.fetch=he,i.Headers=g,i.Request=U,i.Response=I),o.Headers=g,o.Request=U,o.Response=I,o.fetch=he,Object.defineProperty(o,"__esModule",{value:!0}),o})({})})(s),s.fetch.ponyfill=!0,delete s.fetch.polyfill;var n=s;e=n.fetch,e.default=n.fetch,e.fetch=n.fetch,e.Headers=n.Headers,e.Request=n.Request,e.Response=n.Response,r.exports=e})(Je,Je.exports);var et=Je.exports;const tt=ns(et),Fe=hs({__proto__:null,default:tt},[et]);class bs{constructor(e){this.shouldThrowOnError=!1,this.method=e.method,this.url=e.url,this.headers=e.headers,this.schema=e.schema,this.body=e.body,this.shouldThrowOnError=e.shouldThrowOnError,this.signal=e.signal,this.allowEmpty=e.allowEmpty,e.fetch?this.fetch=e.fetch:typeof fetch>"u"?this.fetch=tt:this.fetch=fetch}throwOnError(){return this.shouldThrowOnError=!0,this}then(e,t){this.schema===void 0||(["GET","HEAD"].includes(this.method)?this.headers["Accept-Profile"]=this.schema:this.headers["Content-Profile"]=this.schema),this.method!=="GET"&&this.method!=="HEAD"&&(this.headers["Content-Type"]="application/json");const s=this.fetch;let n=s(this.url.toString(),{method:this.method,headers:this.headers,body:JSON.stringify(this.body),signal:this.signal}).then(async i=>{var o,a,l;let c=null,d=null,u=null,p=i.status,y=i.statusText;if(i.ok){if(this.method!=="HEAD"){const A=await i.text();A===""||(this.headers.Accept==="text/csv"||this.headers.Accept&&this.headers.Accept.includes("application/vnd.pgrst.plan+text")?d=A:d=JSON.parse(A))}const _=(o=this.headers.Prefer)===null||o===void 0?void 0:o.match(/count=(exact|planned|estimated)/),b=(a=i.headers.get("content-range"))===null||a===void 0?void 0:a.split("/");_&&b&&b.length>1&&(u=parseInt(b[1]))}else{const _=await i.text();try{c=JSON.parse(_),Array.isArray(c)&&i.status===404&&(d=[],c=null,p=200,y="OK")}catch{i.status===404&&_===""?(p=204,y="No Content"):c={message:_}}if(c&&this.allowEmpty&&(!((l=c?.details)===null||l===void 0)&&l.includes("Results contain 0 rows"))&&(c=null,p=200,y="OK"),c&&this.shouldThrowOnError)throw c}return{error:c,data:d,count:u,status:p,statusText:y}});return this.shouldThrowOnError||(n=n.catch(i=>{var o,a,l;return{error:{message:`${(o=i?.name)!==null&&o!==void 0?o:"FetchError"}: ${i?.message}`,details:`${(a=i?.stack)!==null&&a!==void 0?a:""}`,hint:"",code:`${(l=i?.code)!==null&&l!==void 0?l:""}`},data:null,count:null,status:0,statusText:""}})),n.then(e,t)}}class _s extends bs{select(e){let t=!1;const s=(e??"*").split("").map(n=>/\s/.test(n)&&!t?"":(n==='"'&&(t=!t),n)).join("");return this.url.searchParams.set("select",s),this.headers.Prefer&&(this.headers.Prefer+=","),this.headers.Prefer+="return=representation",this}order(e,{ascending:t=!0,nullsFirst:s,foreignTable:n}={}){const i=n?`${n}.order`:"order",o=this.url.searchParams.get(i);return this.url.searchParams.set(i,`${o?`${o},`:""}${e}.${t?"asc":"desc"}${s===void 0?"":s?".nullsfirst":".nullslast"}`),this}limit(e,{foreignTable:t}={}){const s=typeof t>"u"?"limit":`${t}.limit`;return this.url.searchParams.set(s,`${e}`),this}range(e,t,{foreignTable:s}={}){const n=typeof s>"u"?"offset":`${s}.offset`,i=typeof s>"u"?"limit":`${s}.limit`;return this.url.searchParams.set(n,`${e}`),this.url.searchParams.set(i,`${t-e+1}`),this}abortSignal(e){return this.signal=e,this}single(){return this.headers.Accept="application/vnd.pgrst.object+json",this}maybeSingle(){return this.headers.Accept="application/vnd.pgrst.object+json",this.allowEmpty=!0,this}csv(){return this.headers.Accept="text/csv",this}geojson(){return this.headers.Accept="application/geo+json",this}explain({analyze:e=!1,verbose:t=!1,settings:s=!1,buffers:n=!1,wal:i=!1,format:o="text"}={}){const a=[e?"analyze":null,t?"verbose":null,s?"settings":null,n?"buffers":null,i?"wal":null].filter(Boolean).join("|"),l=this.headers.Accept;return this.headers.Accept=`application/vnd.pgrst.plan+${o}; for="${l}"; options=${a};`,o==="json"?this:this}rollback(){var e;return((e=this.headers.Prefer)!==null&&e!==void 0?e:"").trim().length>0?this.headers.Prefer+=",tx=rollback":this.headers.Prefer="tx=rollback",this}returns(){return this}}class ce extends _s{eq(e,t){return this.url.searchParams.append(e,`eq.${t}`),this}neq(e,t){return this.url.searchParams.append(e,`neq.${t}`),this}gt(e,t){return this.url.searchParams.append(e,`gt.${t}`),this}gte(e,t){return this.url.searchParams.append(e,`gte.${t}`),this}lt(e,t){return this.url.searchParams.append(e,`lt.${t}`),this}lte(e,t){return this.url.searchParams.append(e,`lte.${t}`),this}like(e,t){return this.url.searchParams.append(e,`like.${t}`),this}likeAllOf(e,t){return this.url.searchParams.append(e,`like(all).{${t.join(",")}}`),this}likeAnyOf(e,t){return this.url.searchParams.append(e,`like(any).{${t.join(",")}}`),this}ilike(e,t){return this.url.searchParams.append(e,`ilike.${t}`),this}ilikeAllOf(e,t){return this.url.searchParams.append(e,`ilike(all).{${t.join(",")}}`),this}ilikeAnyOf(e,t){return this.url.searchParams.append(e,`ilike(any).{${t.join(",")}}`),this}is(e,t){return this.url.searchParams.append(e,`is.${t}`),this}in(e,t){const s=t.map(n=>typeof n=="string"&&new RegExp("[,()]").test(n)?`"${n}"`:`${n}`).join(",");return this.url.searchParams.append(e,`in.(${s})`),this}contains(e,t){return typeof t=="string"?this.url.searchParams.append(e,`cs.${t}`):Array.isArray(t)?this.url.searchParams.append(e,`cs.{${t.join(",")}}`):this.url.searchParams.append(e,`cs.${JSON.stringify(t)}`),this}containedBy(e,t){return typeof t=="string"?this.url.searchParams.append(e,`cd.${t}`):Array.isArray(t)?this.url.searchParams.append(e,`cd.{${t.join(",")}}`):this.url.searchParams.append(e,`cd.${JSON.stringify(t)}`),this}rangeGt(e,t){return this.url.searchParams.append(e,`sr.${t}`),this}rangeGte(e,t){return this.url.searchParams.append(e,`nxl.${t}`),this}rangeLt(e,t){return this.url.searchParams.append(e,`sl.${t}`),this}rangeLte(e,t){return this.url.searchParams.append(e,`nxr.${t}`),this}rangeAdjacent(e,t){return this.url.searchParams.append(e,`adj.${t}`),this}overlaps(e,t){return typeof t=="string"?this.url.searchParams.append(e,`ov.${t}`):this.url.searchParams.append(e,`ov.{${t.join(",")}}`),this}textSearch(e,t,{config:s,type:n}={}){let i="";n==="plain"?i="pl":n==="phrase"?i="ph":n==="websearch"&&(i="w");const o=s===void 0?"":`(${s})`;return this.url.searchParams.append(e,`${i}fts${o}.${t}`),this}match(e){return Object.entries(e).forEach(([t,s])=>{this.url.searchParams.append(t,`eq.${s}`)}),this}not(e,t,s){return this.url.searchParams.append(e,`not.${t}.${s}`),this}or(e,{foreignTable:t}={}){const s=t?`${t}.or`:"or";return this.url.searchParams.append(s,`(${e})`),this}filter(e,t,s){return this.url.searchParams.append(e,`${t}.${s}`),this}}class ws{constructor(e,{headers:t={},schema:s,fetch:n}){this.url=e,this.headers=t,this.schema=s,this.fetch=n}select(e,{head:t=!1,count:s}={}){const n=t?"HEAD":"GET";let i=!1;const o=(e??"*").split("").map(a=>/\s/.test(a)&&!i?"":(a==='"'&&(i=!i),a)).join("");return this.url.searchParams.set("select",o),s&&(this.headers.Prefer=`count=${s}`),new ce({method:n,url:this.url,headers:this.headers,schema:this.schema,fetch:this.fetch,allowEmpty:!1})}insert(e,{count:t,defaultToNull:s=!0}={}){const n="POST",i=[];if(this.headers.Prefer&&i.push(this.headers.Prefer),t&&i.push(`count=${t}`),s||i.push("missing=default"),this.headers.Prefer=i.join(","),Array.isArray(e)){const o=e.reduce((a,l)=>a.concat(Object.keys(l)),[]);if(o.length>0){const a=[...new Set(o)].map(l=>`"${l}"`);this.url.searchParams.set("columns",a.join(","))}}return new ce({method:n,url:this.url,headers:this.headers,schema:this.schema,body:e,fetch:this.fetch,allowEmpty:!1})}upsert(e,{onConflict:t,ignoreDuplicates:s=!1,count:n,defaultToNull:i=!0}={}){const o="POST",a=[`resolution=${s?"ignore":"merge"}-duplicates`];if(t!==void 0&&this.url.searchParams.set("on_conflict",t),this.headers.Prefer&&a.push(this.headers.Prefer),n&&a.push(`count=${n}`),i||a.push("missing=default"),this.headers.Prefer=a.join(","),Array.isArray(e)){const l=e.reduce((c,d)=>c.concat(Object.keys(d)),[]);if(l.length>0){const c=[...new Set(l)].map(d=>`"${d}"`);this.url.searchParams.set("columns",c.join(","))}}return new ce({method:o,url:this.url,headers:this.headers,schema:this.schema,body:e,fetch:this.fetch,allowEmpty:!1})}update(e,{count:t}={}){const s="PATCH",n=[];return this.headers.Prefer&&n.push(this.headers.Prefer),t&&n.push(`count=${t}`),this.headers.Prefer=n.join(","),new ce({method:s,url:this.url,headers:this.headers,schema:this.schema,body:e,fetch:this.fetch,allowEmpty:!1})}delete({count:e}={}){const t="DELETE",s=[];return e&&s.push(`count=${e}`),this.headers.Prefer&&s.unshift(this.headers.Prefer),this.headers.Prefer=s.join(","),new ce({method:t,url:this.url,headers:this.headers,schema:this.schema,fetch:this.fetch,allowEmpty:!1})}}const xs="1.6.0",Cs={"X-Client-Info":`postgrest-js/${xs}`};class As{constructor(e,{headers:t={},schema:s,fetch:n}={}){this.url=e,this.headers=Object.assign(Object.assign({},Cs),t),this.schema=s,this.fetch=n}from(e){const t=new URL(`${this.url}/${e}`);return new ws(t,{headers:Object.assign({},this.headers),schema:this.schema,fetch:this.fetch})}rpc(e,t={},{head:s=!1,count:n}={}){let i;const o=new URL(`${this.url}/rpc/${e}`);let a;s?(i="HEAD",Object.entries(t).forEach(([c,d])=>{o.searchParams.append(c,`${d}`)})):(i="POST",a=t);const l=Object.assign({},this.headers);return n&&(l.Prefer=`count=${n}`),new ce({method:i,url:o,headers:l,schema:this.schema,body:a,fetch:this.fetch,allowEmpty:!1})}}var $e,ct;function js(){if(ct)return $e;ct=1;var r=function(){if(typeof self=="object"&&self)return self;if(typeof window=="object"&&window)return window;throw new Error("Unable to resolve global `this`")};return $e=function(){if(this)return this;if(typeof globalThis=="object"&&globalThis)return globalThis;try{Object.defineProperty(Object.prototype,"__global__",{get:function(){return this},configurable:!0})}catch{return r()}try{return __global__||r()}finally{delete Object.prototype.__global__}}(),$e}const ks="websocket",Es="Websocket Client & Server Library implementing the WebSocket protocol as specified in RFC 6455.",Ts=["websocket","websockets","socket","networking","comet","push","RFC-6455","realtime","server","client"],Ss="Brian McKelvey <theturtle32@gmail.com> (https://github.com/theturtle32)",Fs=["Iñaki Baz Castillo <ibc@aliax.net> (http://dev.sipdoc.net)"],Os="1.0.34",Rs={type:"git",url:"https://github.com/theturtle32/WebSocket-Node.git"},Bs="https://github.com/theturtle32/WebSocket-Node",Ds={node:">=4.0.0"},$s={bufferutil:"^4.0.1",debug:"^2.2.0","es5-ext":"^0.10.50","typedarray-to-buffer":"^3.1.5","utf-8-validate":"^5.0.2",yaeti:"^0.0.6"},Ps={"buffer-equal":"^1.0.0",gulp:"^4.0.2","gulp-jshint":"^2.0.4","jshint-stylish":"^2.2.1",jshint:"^2.0.0",tape:"^4.9.1"},Is={verbose:!1},Ns={test:"tape test/unit/*.js",gulp:"gulp"},Ls="index",Us={lib:"./lib"},Gs="lib/browser.js",Ms="Apache-2.0",qs={name:ks,description:Es,keywords:Ts,author:Ss,contributors:Fs,version:Os,repository:Rs,homepage:Bs,engines:Ds,dependencies:$s,devDependencies:Ps,config:Is,scripts:Ns,main:Ls,directories:Us,browser:Gs,license:Ms};var zs=qs.version,re;if(typeof globalThis=="object")re=globalThis;else try{re=js()}catch{}finally{if(!re&&typeof window<"u"&&(re=window),!re)throw new Error("Could not determine global this")}var _e=re.WebSocket||re.MozWebSocket,Hs=zs;function jt(r,e){var t;return e?t=new _e(r,e):t=new _e(r),t}_e&&["CONNECTING","OPEN","CLOSING","CLOSED"].forEach(function(r){Object.defineProperty(jt,r,{get:function(){return _e[r]}})});var Js={w3cwebsocket:_e?jt:null,version:Hs};const Ks="2.7.2",Vs={"X-Client-Info":`realtime-js/${Ks}`},Ws="1.0.0",kt=1e4,Ys=1e3;var ve;(function(r){r[r.connecting=0]="connecting",r[r.open=1]="open",r[r.closing=2]="closing",r[r.closed=3]="closed"})(ve||(ve={}));var L;(function(r){r.closed="closed",r.errored="errored",r.joined="joined",r.joining="joining",r.leaving="leaving"})(L||(L={}));var z;(function(r){r.close="phx_close",r.error="phx_error",r.join="phx_join",r.reply="phx_reply",r.leave="phx_leave",r.access_token="access_token"})(z||(z={}));var Ke;(function(r){r.websocket="websocket"})(Ke||(Ke={}));var ne;(function(r){r.Connecting="connecting",r.Open="open",r.Closing="closing",r.Closed="closed"})(ne||(ne={}));class Et{constructor(e,t){this.callback=e,this.timerCalc=t,this.timer=void 0,this.tries=0,this.callback=e,this.timerCalc=t}reset(){this.tries=0,clearTimeout(this.timer)}scheduleTimeout(){clearTimeout(this.timer),this.timer=setTimeout(()=>{this.tries=this.tries+1,this.callback()},this.timerCalc(this.tries+1))}}class Xs{constructor(){this.HEADER_LENGTH=1}decode(e,t){return e.constructor===ArrayBuffer?t(this._binaryDecode(e)):t(typeof e=="string"?JSON.parse(e):{})}_binaryDecode(e){const t=new DataView(e),s=new TextDecoder;return this._decodeBroadcast(e,t,s)}_decodeBroadcast(e,t,s){const n=t.getUint8(1),i=t.getUint8(2);let o=this.HEADER_LENGTH+2;const a=s.decode(e.slice(o,o+n));o=o+n;const l=s.decode(e.slice(o,o+i));o=o+i;const c=JSON.parse(s.decode(e.slice(o,e.byteLength)));return{ref:null,topic:a,event:l,payload:c}}}class Pe{constructor(e,t,s={},n=kt){this.channel=e,this.event=t,this.payload=s,this.timeout=n,this.sent=!1,this.timeoutTimer=void 0,this.ref="",this.receivedResp=null,this.recHooks=[],this.refEvent=null,this.rateLimited=!1}resend(e){this.timeout=e,this._cancelRefEvent(),this.ref="",this.refEvent=null,this.receivedResp=null,this.sent=!1,this.send()}send(){if(this._hasReceived("timeout"))return;this.startTimeout(),this.sent=!0,this.channel.socket.push({topic:this.channel.topic,event:this.event,payload:this.payload,ref:this.ref,join_ref:this.channel._joinRef()})==="rate limited"&&(this.rateLimited=!0)}updatePayload(e){this.payload=Object.assign(Object.assign({},this.payload),e)}receive(e,t){var s;return this._hasReceived(e)&&t((s=this.receivedResp)===null||s===void 0?void 0:s.response),this.recHooks.push({status:e,callback:t}),this}startTimeout(){if(this.timeoutTimer)return;this.ref=this.channel.socket._makeRef(),this.refEvent=this.channel._replyEventName(this.ref);const e=t=>{this._cancelRefEvent(),this._cancelTimeout(),this.receivedResp=t,this._matchReceive(t)};this.channel._on(this.refEvent,{},e),this.timeoutTimer=setTimeout(()=>{this.trigger("timeout",{})},this.timeout)}trigger(e,t){this.refEvent&&this.channel._trigger(this.refEvent,{status:e,response:t})}destroy(){this._cancelRefEvent(),this._cancelTimeout()}_cancelRefEvent(){this.refEvent&&this.channel._off(this.refEvent,{})}_cancelTimeout(){clearTimeout(this.timeoutTimer),this.timeoutTimer=void 0}_matchReceive({status:e,response:t}){this.recHooks.filter(s=>s.status===e).forEach(s=>s.callback(t))}_hasReceived(e){return this.receivedResp&&this.receivedResp.status===e}}var dt;(function(r){r.SYNC="sync",r.JOIN="join",r.LEAVE="leave"})(dt||(dt={}));class ye{constructor(e,t){this.channel=e,this.state={},this.pendingDiffs=[],this.joinRef=null,this.caller={onJoin:()=>{},onLeave:()=>{},onSync:()=>{}};const s=t?.events||{state:"presence_state",diff:"presence_diff"};this.channel._on(s.state,{},n=>{const{onJoin:i,onLeave:o,onSync:a}=this.caller;this.joinRef=this.channel._joinRef(),this.state=ye.syncState(this.state,n,i,o),this.pendingDiffs.forEach(l=>{this.state=ye.syncDiff(this.state,l,i,o)}),this.pendingDiffs=[],a()}),this.channel._on(s.diff,{},n=>{const{onJoin:i,onLeave:o,onSync:a}=this.caller;this.inPendingSyncState()?this.pendingDiffs.push(n):(this.state=ye.syncDiff(this.state,n,i,o),a())}),this.onJoin((n,i,o)=>{this.channel._trigger("presence",{event:"join",key:n,currentPresences:i,newPresences:o})}),this.onLeave((n,i,o)=>{this.channel._trigger("presence",{event:"leave",key:n,currentPresences:i,leftPresences:o})}),this.onSync(()=>{this.channel._trigger("presence",{event:"sync"})})}static syncState(e,t,s,n){const i=this.cloneDeep(e),o=this.transformState(t),a={},l={};return this.map(i,(c,d)=>{o[c]||(l[c]=d)}),this.map(o,(c,d)=>{const u=i[c];if(u){const p=d.map(b=>b.presence_ref),y=u.map(b=>b.presence_ref),g=d.filter(b=>y.indexOf(b.presence_ref)<0),_=u.filter(b=>p.indexOf(b.presence_ref)<0);g.length>0&&(a[c]=g),_.length>0&&(l[c]=_)}else a[c]=d}),this.syncDiff(i,{joins:a,leaves:l},s,n)}static syncDiff(e,t,s,n){const{joins:i,leaves:o}={joins:this.transformState(t.joins),leaves:this.transformState(t.leaves)};return s||(s=()=>{}),n||(n=()=>{}),this.map(i,(a,l)=>{var c;const d=(c=e[a])!==null&&c!==void 0?c:[];if(e[a]=this.cloneDeep(l),d.length>0){const u=e[a].map(y=>y.presence_ref),p=d.filter(y=>u.indexOf(y.presence_ref)<0);e[a].unshift(...p)}s(a,d,l)}),this.map(o,(a,l)=>{let c=e[a];if(!c)return;const d=l.map(u=>u.presence_ref);c=c.filter(u=>d.indexOf(u.presence_ref)<0),e[a]=c,n(a,c,l),c.length===0&&delete e[a]}),e}static map(e,t){return Object.getOwnPropertyNames(e).map(s=>t(s,e[s]))}static transformState(e){return e=this.cloneDeep(e),Object.getOwnPropertyNames(e).reduce((t,s)=>{const n=e[s];return"metas"in n?t[s]=n.metas.map(i=>(i.presence_ref=i.phx_ref,delete i.phx_ref,delete i.phx_ref_prev,i)):t[s]=n,t},{})}static cloneDeep(e){return JSON.parse(JSON.stringify(e))}onJoin(e){this.caller.onJoin=e}onLeave(e){this.caller.onLeave=e}onSync(e){this.caller.onSync=e}inPendingSyncState(){return!this.joinRef||this.joinRef!==this.channel._joinRef()}}var T;(function(r){r.abstime="abstime",r.bool="bool",r.date="date",r.daterange="daterange",r.float4="float4",r.float8="float8",r.int2="int2",r.int4="int4",r.int4range="int4range",r.int8="int8",r.int8range="int8range",r.json="json",r.jsonb="jsonb",r.money="money",r.numeric="numeric",r.oid="oid",r.reltime="reltime",r.text="text",r.time="time",r.timestamp="timestamp",r.timestamptz="timestamptz",r.timetz="timetz",r.tsrange="tsrange",r.tstzrange="tstzrange"})(T||(T={}));const ht=(r,e,t={})=>{var s;const n=(s=t.skipTypes)!==null&&s!==void 0?s:[];return Object.keys(e).reduce((i,o)=>(i[o]=Zs(o,r,e,n),i),{})},Zs=(r,e,t,s)=>{const n=e.find(a=>a.name===r),i=n?.type,o=t[r];return i&&!s.includes(i)?Tt(i,o):Ve(o)},Tt=(r,e)=>{if(r.charAt(0)==="_"){const t=r.slice(1,r.length);return sr(e,t)}switch(r){case T.bool:return Qs(e);case T.float4:case T.float8:case T.int2:case T.int4:case T.int8:case T.numeric:case T.oid:return er(e);case T.json:case T.jsonb:return tr(e);case T.timestamp:return rr(e);case T.abstime:case T.date:case T.daterange:case T.int4range:case T.int8range:case T.money:case T.reltime:case T.text:case T.time:case T.timestamptz:case T.timetz:case T.tsrange:case T.tstzrange:return Ve(e);default:return Ve(e)}},Ve=r=>r,Qs=r=>{switch(r){case"t":return!0;case"f":return!1;default:return r}},er=r=>{if(typeof r=="string"){const e=parseFloat(r);if(!Number.isNaN(e))return e}return r},tr=r=>{if(typeof r=="string")try{return JSON.parse(r)}catch(e){return console.log(`JSON parse error: ${e}`),r}return r},sr=(r,e)=>{if(typeof r!="string")return r;const t=r.length-1,s=r[t];if(r[0]==="{"&&s==="}"){let i;const o=r.slice(1,t);try{i=JSON.parse("["+o+"]")}catch{i=o?o.split(","):[]}return i.map(a=>Tt(e,a))}return r},rr=r=>typeof r=="string"?r.replace(" ","T"):r;var ut=globalThis&&globalThis.__awaiter||function(r,e,t,s){function n(i){return i instanceof t?i:new t(function(o){o(i)})}return new(t||(t=Promise))(function(i,o){function a(d){try{c(s.next(d))}catch(u){o(u)}}function l(d){try{c(s.throw(d))}catch(u){o(u)}}function c(d){d.done?i(d.value):n(d.value).then(a,l)}c((s=s.apply(r,e||[])).next())})},ft;(function(r){r.ALL="*",r.INSERT="INSERT",r.UPDATE="UPDATE",r.DELETE="DELETE"})(ft||(ft={}));var pt;(function(r){r.BROADCAST="broadcast",r.PRESENCE="presence",r.POSTGRES_CHANGES="postgres_changes"})(pt||(pt={}));var mt;(function(r){r.SUBSCRIBED="SUBSCRIBED",r.TIMED_OUT="TIMED_OUT",r.CLOSED="CLOSED",r.CHANNEL_ERROR="CHANNEL_ERROR"})(mt||(mt={}));class st{constructor(e,t={config:{}},s){this.topic=e,this.params=t,this.socket=s,this.bindings={},this.state=L.closed,this.joinedOnce=!1,this.pushBuffer=[],this.params.config=Object.assign({broadcast:{ack:!1,self:!1},presence:{key:""}},t.config),this.timeout=this.socket.timeout,this.joinPush=new Pe(this,z.join,this.params,this.timeout),this.rejoinTimer=new Et(()=>this._rejoinUntilConnected(),this.socket.reconnectAfterMs),this.joinPush.receive("ok",()=>{this.state=L.joined,this.rejoinTimer.reset(),this.pushBuffer.forEach(n=>n.send()),this.pushBuffer=[]}),this._onClose(()=>{this.rejoinTimer.reset(),this.socket.log("channel",`close ${this.topic} ${this._joinRef()}`),this.state=L.closed,this.socket._remove(this)}),this._onError(n=>{this._isLeaving()||this._isClosed()||(this.socket.log("channel",`error ${this.topic}`,n),this.state=L.errored,this.rejoinTimer.scheduleTimeout())}),this.joinPush.receive("timeout",()=>{this._isJoining()&&(this.socket.log("channel",`timeout ${this.topic}`,this.joinPush.timeout),this.state=L.errored,this.rejoinTimer.scheduleTimeout())}),this._on(z.reply,{},(n,i)=>{this._trigger(this._replyEventName(i),n)}),this.presence=new ye(this)}subscribe(e,t=this.timeout){var s,n;if(this.joinedOnce)throw"tried to subscribe multiple times. 'subscribe' can only be called a single time per channel instance";{const{config:{broadcast:i,presence:o}}=this.params;this._onError(c=>e&&e("CHANNEL_ERROR",c)),this._onClose(()=>e&&e("CLOSED"));const a={},l={broadcast:i,presence:o,postgres_changes:(n=(s=this.bindings.postgres_changes)===null||s===void 0?void 0:s.map(c=>c.filter))!==null&&n!==void 0?n:[]};this.socket.accessToken&&(a.access_token=this.socket.accessToken),this.updateJoinPayload(Object.assign({config:l},a)),this.joinedOnce=!0,this._rejoin(t),this.joinPush.receive("ok",({postgres_changes:c})=>{var d;if(this.socket.accessToken&&this.socket.setAuth(this.socket.accessToken),c===void 0){e&&e("SUBSCRIBED");return}else{const u=this.bindings.postgres_changes,p=(d=u?.length)!==null&&d!==void 0?d:0,y=[];for(let g=0;g<p;g++){const _=u[g],{filter:{event:b,schema:A,table:O,filter:$}}=_,S=c&&c[g];if(S&&S.event===b&&S.schema===A&&S.table===O&&S.filter===$)y.push(Object.assign(Object.assign({},_),{id:S.id}));else{this.unsubscribe(),e&&e("CHANNEL_ERROR",new Error("mismatch between server and client bindings for postgres changes"));return}}this.bindings.postgres_changes=y,e&&e("SUBSCRIBED");return}}).receive("error",c=>{e&&e("CHANNEL_ERROR",new Error(JSON.stringify(Object.values(c).join(", ")||"error")))}).receive("timeout",()=>{e&&e("TIMED_OUT")})}return this}presenceState(){return this.presence.state}track(e,t={}){return ut(this,void 0,void 0,function*(){return yield this.send({type:"presence",event:"track",payload:e},t.timeout||this.timeout)})}untrack(e={}){return ut(this,void 0,void 0,function*(){return yield this.send({type:"presence",event:"untrack"},e)})}on(e,t,s){return this._on(e,t,s)}send(e,t={}){return new Promise(s=>{var n,i,o;const a=this._push(e.type,e,t.timeout||this.timeout);a.rateLimited&&s("rate limited"),e.type==="broadcast"&&!(!((o=(i=(n=this.params)===null||n===void 0?void 0:n.config)===null||i===void 0?void 0:i.broadcast)===null||o===void 0)&&o.ack)&&s("ok"),a.receive("ok",()=>s("ok")),a.receive("timeout",()=>s("timed out"))})}updateJoinPayload(e){this.joinPush.updatePayload(e)}unsubscribe(e=this.timeout){this.state=L.leaving;const t=()=>{this.socket.log("channel",`leave ${this.topic}`),this._trigger(z.close,"leave",this._joinRef())};return this.rejoinTimer.reset(),this.joinPush.destroy(),new Promise(s=>{const n=new Pe(this,z.leave,{},e);n.receive("ok",()=>{t(),s("ok")}).receive("timeout",()=>{t(),s("timed out")}).receive("error",()=>{s("error")}),n.send(),this._canPush()||n.trigger("ok",{})})}_push(e,t,s=this.timeout){if(!this.joinedOnce)throw`tried to push '${e}' to '${this.topic}' before joining. Use channel.subscribe() before pushing events`;let n=new Pe(this,e,t,s);return this._canPush()?n.send():(n.startTimeout(),this.pushBuffer.push(n)),n}_onMessage(e,t,s){return t}_isMember(e){return this.topic===e}_joinRef(){return this.joinPush.ref}_trigger(e,t,s){var n,i;const o=e.toLocaleLowerCase(),{close:a,error:l,leave:c,join:d}=z;if(s&&[a,l,c,d].indexOf(o)>=0&&s!==this._joinRef())return;let p=this._onMessage(o,t,s);if(t&&!p)throw"channel onMessage callbacks must return the payload, modified or unmodified";["insert","update","delete"].includes(o)?(n=this.bindings.postgres_changes)===null||n===void 0||n.filter(y=>{var g,_,b;return((g=y.filter)===null||g===void 0?void 0:g.event)==="*"||((b=(_=y.filter)===null||_===void 0?void 0:_.event)===null||b===void 0?void 0:b.toLocaleLowerCase())===o}).map(y=>y.callback(p,s)):(i=this.bindings[o])===null||i===void 0||i.filter(y=>{var g,_,b,A,O,$;if(["broadcast","presence","postgres_changes"].includes(o))if("id"in y){const S=y.id,J=(g=y.filter)===null||g===void 0?void 0:g.event;return S&&((_=t.ids)===null||_===void 0?void 0:_.includes(S))&&(J==="*"||J?.toLocaleLowerCase()===((b=t.data)===null||b===void 0?void 0:b.type.toLocaleLowerCase()))}else{const S=(O=(A=y?.filter)===null||A===void 0?void 0:A.event)===null||O===void 0?void 0:O.toLocaleLowerCase();return S==="*"||S===(($=t?.event)===null||$===void 0?void 0:$.toLocaleLowerCase())}else return y.type.toLocaleLowerCase()===o}).map(y=>{if(typeof p=="object"&&"ids"in p){const g=p.data,{schema:_,table:b,commit_timestamp:A,type:O,errors:$}=g;p=Object.assign(Object.assign({},{schema:_,table:b,commit_timestamp:A,eventType:O,new:{},old:{},errors:$}),this._getPayloadRecords(g))}y.callback(p,s)})}_isClosed(){return this.state===L.closed}_isJoined(){return this.state===L.joined}_isJoining(){return this.state===L.joining}_isLeaving(){return this.state===L.leaving}_replyEventName(e){return`chan_reply_${e}`}_on(e,t,s){const n=e.toLocaleLowerCase(),i={type:n,filter:t,callback:s};return this.bindings[n]?this.bindings[n].push(i):this.bindings[n]=[i],this}_off(e,t){const s=e.toLocaleLowerCase();return this.bindings[s]=this.bindings[s].filter(n=>{var i;return!(((i=n.type)===null||i===void 0?void 0:i.toLocaleLowerCase())===s&&st.isEqual(n.filter,t))}),this}static isEqual(e,t){if(Object.keys(e).length!==Object.keys(t).length)return!1;for(const s in e)if(e[s]!==t[s])return!1;return!0}_rejoinUntilConnected(){this.rejoinTimer.scheduleTimeout(),this.socket.isConnected()&&this._rejoin()}_onClose(e){this._on(z.close,{},e)}_onError(e){this._on(z.error,{},t=>e(t))}_canPush(){return this.socket.isConnected()&&this._isJoined()}_rejoin(e=this.timeout){this._isLeaving()||(this.socket._leaveOpenTopic(this.topic),this.state=L.joining,this.joinPush.resend(e))}_getPayloadRecords(e){const t={new:{},old:{}};return(e.type==="INSERT"||e.type==="UPDATE")&&(t.new=ht(e.columns,e.record)),(e.type==="UPDATE"||e.type==="DELETE")&&(t.old=ht(e.columns,e.old_record)),t}}var Ie=globalThis&&globalThis.__awaiter||function(r,e,t,s){function n(i){return i instanceof t?i:new t(function(o){o(i)})}return new(t||(t=Promise))(function(i,o){function a(d){try{c(s.next(d))}catch(u){o(u)}}function l(d){try{c(s.throw(d))}catch(u){o(u)}}function c(d){d.done?i(d.value):n(d.value).then(a,l)}c((s=s.apply(r,e||[])).next())})};const nr=()=>{};class ir{constructor(e,t){var s;this.accessToken=null,this.channels=[],this.endPoint="",this.headers=Vs,this.params={},this.timeout=kt,this.transport=Js.w3cwebsocket,this.heartbeatIntervalMs=3e4,this.heartbeatTimer=void 0,this.pendingHeartbeatRef=null,this.ref=0,this.logger=nr,this.conn=null,this.sendBuffer=[],this.serializer=new Xs,this.stateChangeCallbacks={open:[],close:[],error:[],message:[]},this.eventsPerSecondLimitMs=100,this.inThrottle=!1,this.endPoint=`${e}/${Ke.websocket}`,t?.params&&(this.params=t.params),t?.headers&&(this.headers=Object.assign(Object.assign({},this.headers),t.headers)),t?.timeout&&(this.timeout=t.timeout),t?.logger&&(this.logger=t.logger),t?.transport&&(this.transport=t.transport),t?.heartbeatIntervalMs&&(this.heartbeatIntervalMs=t.heartbeatIntervalMs);const n=(s=t?.params)===null||s===void 0?void 0:s.eventsPerSecond;n&&(this.eventsPerSecondLimitMs=Math.floor(1e3/n)),this.reconnectAfterMs=t?.reconnectAfterMs?t.reconnectAfterMs:i=>[1e3,2e3,5e3,1e4][i-1]||1e4,this.encode=t?.encode?t.encode:(i,o)=>o(JSON.stringify(i)),this.decode=t?.decode?t.decode:this.serializer.decode.bind(this.serializer),this.reconnectTimer=new Et(()=>Ie(this,void 0,void 0,function*(){this.disconnect(),this.connect()}),this.reconnectAfterMs)}connect(){this.conn||(this.conn=new this.transport(this._endPointURL(),[],null,this.headers),this.conn&&(this.conn.binaryType="arraybuffer",this.conn.onopen=()=>this._onConnOpen(),this.conn.onerror=e=>this._onConnError(e),this.conn.onmessage=e=>this._onConnMessage(e),this.conn.onclose=e=>this._onConnClose(e)))}disconnect(e,t){this.conn&&(this.conn.onclose=function(){},e?this.conn.close(e,t??""):this.conn.close(),this.conn=null,this.heartbeatTimer&&clearInterval(this.heartbeatTimer),this.reconnectTimer.reset())}getChannels(){return this.channels}removeChannel(e){return Ie(this,void 0,void 0,function*(){const t=yield e.unsubscribe();return this.channels.length===0&&this.disconnect(),t})}removeAllChannels(){return Ie(this,void 0,void 0,function*(){const e=yield Promise.all(this.channels.map(t=>t.unsubscribe()));return this.disconnect(),e})}log(e,t,s){this.logger(e,t,s)}connectionState(){switch(this.conn&&this.conn.readyState){case ve.connecting:return ne.Connecting;case ve.open:return ne.Open;case ve.closing:return ne.Closing;default:return ne.Closed}}isConnected(){return this.connectionState()===ne.Open}channel(e,t={config:{}}){this.isConnected()||this.connect();const s=new st(`realtime:${e}`,t,this);return this.channels.push(s),s}push(e){const{topic:t,event:s,payload:n,ref:i}=e;let o=()=>{this.encode(e,a=>{var l;(l=this.conn)===null||l===void 0||l.send(a)})};if(this.log("push",`${t} ${s} (${i})`,n),this.isConnected())if(["broadcast","presence","postgres_changes"].includes(s)){if(this._throttle(o)())return"rate limited"}else o();else this.sendBuffer.push(o)}setAuth(e){this.accessToken=e,this.channels.forEach(t=>{e&&t.updateJoinPayload({access_token:e}),t.joinedOnce&&t._isJoined()&&t._push(z.access_token,{access_token:e})})}_makeRef(){let e=this.ref+1;return e===this.ref?this.ref=0:this.ref=e,this.ref.toString()}_leaveOpenTopic(e){let t=this.channels.find(s=>s.topic===e&&(s._isJoined()||s._isJoining()));t&&(this.log("transport",`leaving duplicate topic "${e}"`),t.unsubscribe())}_remove(e){this.channels=this.channels.filter(t=>t._joinRef()!==e._joinRef())}_endPointURL(){return this._appendParams(this.endPoint,Object.assign({},this.params,{vsn:Ws}))}_onConnMessage(e){this.decode(e.data,t=>{let{topic:s,event:n,payload:i,ref:o}=t;(o&&o===this.pendingHeartbeatRef||n===i?.type)&&(this.pendingHeartbeatRef=null),this.log("receive",`${i.status||""} ${s} ${n} ${o&&"("+o+")"||""}`,i),this.channels.filter(a=>a._isMember(s)).forEach(a=>a._trigger(n,i,o)),this.stateChangeCallbacks.message.forEach(a=>a(t))})}_onConnOpen(){this.log("transport",`connected to ${this._endPointURL()}`),this._flushSendBuffer(),this.reconnectTimer.reset(),this.heartbeatTimer&&clearInterval(this.heartbeatTimer),this.heartbeatTimer=setInterval(()=>this._sendHeartbeat(),this.heartbeatIntervalMs),this.stateChangeCallbacks.open.forEach(e=>e())}_onConnClose(e){this.log("transport","close",e),this._triggerChanError(),this.heartbeatTimer&&clearInterval(this.heartbeatTimer),this.reconnectTimer.scheduleTimeout(),this.stateChangeCallbacks.close.forEach(t=>t(e))}_onConnError(e){this.log("transport",e.message),this._triggerChanError(),this.stateChangeCallbacks.error.forEach(t=>t(e))}_triggerChanError(){this.channels.forEach(e=>e._trigger(z.error))}_appendParams(e,t){if(Object.keys(t).length===0)return e;const s=e.match(/\?/)?"&":"?",n=new URLSearchParams(t);return`${e}${s}${n}`}_flushSendBuffer(){this.isConnected()&&this.sendBuffer.length>0&&(this.sendBuffer.forEach(e=>e()),this.sendBuffer=[])}_sendHeartbeat(){var e;if(this.isConnected()){if(this.pendingHeartbeatRef){this.pendingHeartbeatRef=null,this.log("transport","heartbeat timeout. Attempting to re-establish connection"),(e=this.conn)===null||e===void 0||e.close(Ys,"hearbeat timeout");return}this.pendingHeartbeatRef=this._makeRef(),this.push({topic:"phoenix",event:"heartbeat",payload:{},ref:this.pendingHeartbeatRef}),this.setAuth(this.accessToken)}}_throttle(e,t=this.eventsPerSecondLimitMs){return()=>this.inThrottle?!0:(e(),t>0&&(this.inThrottle=!0,setTimeout(()=>{this.inThrottle=!1},t)),!1)}}class rt extends Error{constructor(e){super(e),this.__isStorageError=!0,this.name="StorageError"}}function P(r){return typeof r=="object"&&r!==null&&"__isStorageError"in r}class or extends rt{constructor(e,t){super(e),this.name="StorageApiError",this.status=t}toJSON(){return{name:this.name,message:this.message,status:this.status}}}class gt extends rt{constructor(e,t){super(e),this.name="StorageUnknownError",this.originalError=t}}var St=globalThis&&globalThis.__awaiter||function(r,e,t,s){function n(i){return i instanceof t?i:new t(function(o){o(i)})}return new(t||(t=Promise))(function(i,o){function a(d){try{c(s.next(d))}catch(u){o(u)}}function l(d){try{c(s.throw(d))}catch(u){o(u)}}function c(d){d.done?i(d.value):n(d.value).then(a,l)}c((s=s.apply(r,e||[])).next())})};const Ft=r=>{let e;return r?e=r:typeof fetch>"u"?e=(...t)=>St(void 0,void 0,void 0,function*(){return yield(yield B(()=>Promise.resolve().then(()=>Fe),void 0)).fetch(...t)}):e=fetch,(...t)=>e(...t)},ar=()=>St(void 0,void 0,void 0,function*(){return typeof Response>"u"?(yield B(()=>Promise.resolve().then(()=>Fe),void 0)).Response:Response});var de=globalThis&&globalThis.__awaiter||function(r,e,t,s){function n(i){return i instanceof t?i:new t(function(o){o(i)})}return new(t||(t=Promise))(function(i,o){function a(d){try{c(s.next(d))}catch(u){o(u)}}function l(d){try{c(s.throw(d))}catch(u){o(u)}}function c(d){d.done?i(d.value):n(d.value).then(a,l)}c((s=s.apply(r,e||[])).next())})};const Ne=r=>r.msg||r.message||r.error_description||r.error||JSON.stringify(r),lr=(r,e)=>de(void 0,void 0,void 0,function*(){const t=yield ar();r instanceof t?r.json().then(s=>{e(new or(Ne(s),r.status||500))}).catch(s=>{e(new gt(Ne(s),s))}):e(new gt(Ne(r),r))}),cr=(r,e,t,s)=>{const n={method:r,headers:e?.headers||{}};return r==="GET"?n:(n.headers=Object.assign({"Content-Type":"application/json"},e?.headers),n.body=JSON.stringify(s),Object.assign(Object.assign({},n),t))};function Oe(r,e,t,s,n,i){return de(this,void 0,void 0,function*(){return new Promise((o,a)=>{r(t,cr(e,s,n,i)).then(l=>{if(!l.ok)throw l;return s?.noResolveJson?l:l.json()}).then(l=>o(l)).catch(l=>lr(l,a))})})}function We(r,e,t,s){return de(this,void 0,void 0,function*(){return Oe(r,"GET",e,t,s)})}function Q(r,e,t,s,n){return de(this,void 0,void 0,function*(){return Oe(r,"POST",e,s,n,t)})}function dr(r,e,t,s,n){return de(this,void 0,void 0,function*(){return Oe(r,"PUT",e,s,n,t)})}function Ot(r,e,t,s,n){return de(this,void 0,void 0,function*(){return Oe(r,"DELETE",e,s,n,t)})}var M=globalThis&&globalThis.__awaiter||function(r,e,t,s){function n(i){return i instanceof t?i:new t(function(o){o(i)})}return new(t||(t=Promise))(function(i,o){function a(d){try{c(s.next(d))}catch(u){o(u)}}function l(d){try{c(s.throw(d))}catch(u){o(u)}}function c(d){d.done?i(d.value):n(d.value).then(a,l)}c((s=s.apply(r,e||[])).next())})};const hr={limit:100,offset:0,sortBy:{column:"name",order:"asc"}},vt={cacheControl:"3600",contentType:"text/plain;charset=UTF-8",upsert:!1};class ur{constructor(e,t={},s,n){this.url=e,this.headers=t,this.bucketId=s,this.fetch=Ft(n)}uploadOrUpdate(e,t,s,n){return M(this,void 0,void 0,function*(){try{let i;const o=Object.assign(Object.assign({},vt),n),a=Object.assign(Object.assign({},this.headers),e==="POST"&&{"x-upsert":String(o.upsert)});typeof Blob<"u"&&s instanceof Blob?(i=new FormData,i.append("cacheControl",o.cacheControl),i.append("",s)):typeof FormData<"u"&&s instanceof FormData?(i=s,i.append("cacheControl",o.cacheControl)):(i=s,a["cache-control"]=`max-age=${o.cacheControl}`,a["content-type"]=o.contentType);const l=this._removeEmptyFolders(t),c=this._getFinalPath(l),d=yield this.fetch(`${this.url}/object/${c}`,Object.assign({method:e,body:i,headers:a},o?.duplex?{duplex:o.duplex}:{}));return d.ok?{data:{path:l},error:null}:{data:null,error:yield d.json()}}catch(i){if(P(i))return{data:null,error:i};throw i}})}upload(e,t,s){return M(this,void 0,void 0,function*(){return this.uploadOrUpdate("POST",e,t,s)})}uploadToSignedUrl(e,t,s,n){return M(this,void 0,void 0,function*(){const i=this._removeEmptyFolders(e),o=this._getFinalPath(i),a=new URL(this.url+`/object/upload/sign/${o}`);a.searchParams.set("token",t);try{let l;const c=Object.assign({upsert:vt.upsert},n),d=Object.assign(Object.assign({},this.headers),{"x-upsert":String(c.upsert)});typeof Blob<"u"&&s instanceof Blob?(l=new FormData,l.append("cacheControl",c.cacheControl),l.append("",s)):typeof FormData<"u"&&s instanceof FormData?(l=s,l.append("cacheControl",c.cacheControl)):(l=s,d["cache-control"]=`max-age=${c.cacheControl}`,d["content-type"]=c.contentType);const u=yield this.fetch(a.toString(),{method:"PUT",body:l,headers:d});return u.ok?{data:{path:i},error:null}:{data:null,error:yield u.json()}}catch(l){if(P(l))return{data:null,error:l};throw l}})}createSignedUploadUrl(e){return M(this,void 0,void 0,function*(){try{let t=this._getFinalPath(e);const s=yield Q(this.fetch,`${this.url}/object/upload/sign/${t}`,{},{headers:this.headers}),n=new URL(this.url+s.url),i=n.searchParams.get("token");if(!i)throw new rt("No token returned by API");return{data:{signedUrl:n.toString(),path:e,token:i},error:null}}catch(t){if(P(t))return{data:null,error:t};throw t}})}update(e,t,s){return M(this,void 0,void 0,function*(){return this.uploadOrUpdate("PUT",e,t,s)})}move(e,t){return M(this,void 0,void 0,function*(){try{return{data:yield Q(this.fetch,`${this.url}/object/move`,{bucketId:this.bucketId,sourceKey:e,destinationKey:t},{headers:this.headers}),error:null}}catch(s){if(P(s))return{data:null,error:s};throw s}})}copy(e,t){return M(this,void 0,void 0,function*(){try{return{data:{path:(yield Q(this.fetch,`${this.url}/object/copy`,{bucketId:this.bucketId,sourceKey:e,destinationKey:t},{headers:this.headers})).Key},error:null}}catch(s){if(P(s))return{data:null,error:s};throw s}})}createSignedUrl(e,t,s){return M(this,void 0,void 0,function*(){try{let n=this._getFinalPath(e),i=yield Q(this.fetch,`${this.url}/object/sign/${n}`,Object.assign({expiresIn:t},s?.transform?{transform:s.transform}:{}),{headers:this.headers});const o=s?.download?`&download=${s.download===!0?"":s.download}`:"";return i={signedUrl:encodeURI(`${this.url}${i.signedURL}${o}`)},{data:i,error:null}}catch(n){if(P(n))return{data:null,error:n};throw n}})}createSignedUrls(e,t,s){return M(this,void 0,void 0,function*(){try{const n=yield Q(this.fetch,`${this.url}/object/sign/${this.bucketId}`,{expiresIn:t,paths:e},{headers:this.headers}),i=s?.download?`&download=${s.download===!0?"":s.download}`:"";return{data:n.map(o=>Object.assign(Object.assign({},o),{signedUrl:o.signedURL?encodeURI(`${this.url}${o.signedURL}${i}`):null})),error:null}}catch(n){if(P(n))return{data:null,error:n};throw n}})}download(e,t){return M(this,void 0,void 0,function*(){const n=typeof t?.transform<"u"?"render/image/authenticated":"object",i=this.transformOptsToQueryString(t?.transform||{}),o=i?`?${i}`:"";try{const a=this._getFinalPath(e);return{data:yield(yield We(this.fetch,`${this.url}/${n}/${a}${o}`,{headers:this.headers,noResolveJson:!0})).blob(),error:null}}catch(a){if(P(a))return{data:null,error:a};throw a}})}getPublicUrl(e,t){const s=this._getFinalPath(e),n=[],i=t?.download?`download=${t.download===!0?"":t.download}`:"";i!==""&&n.push(i);const a=typeof t?.transform<"u"?"render/image":"object",l=this.transformOptsToQueryString(t?.transform||{});l!==""&&n.push(l);let c=n.join("&");return c!==""&&(c=`?${c}`),{data:{publicUrl:encodeURI(`${this.url}/${a}/public/${s}${c}`)}}}remove(e){return M(this,void 0,void 0,function*(){try{return{data:yield Ot(this.fetch,`${this.url}/object/${this.bucketId}`,{prefixes:e},{headers:this.headers}),error:null}}catch(t){if(P(t))return{data:null,error:t};throw t}})}list(e,t,s){return M(this,void 0,void 0,function*(){try{const n=Object.assign(Object.assign(Object.assign({},hr),t),{prefix:e||""});return{data:yield Q(this.fetch,`${this.url}/object/list/${this.bucketId}`,n,{headers:this.headers},s),error:null}}catch(n){if(P(n))return{data:null,error:n};throw n}})}_getFinalPath(e){return`${this.bucketId}/${e}`}_removeEmptyFolders(e){return e.replace(/^\/|\/$/g,"").replace(/\/+/g,"/")}transformOptsToQueryString(e){const t=[];return e.width&&t.push(`width=${e.width}`),e.height&&t.push(`height=${e.height}`),e.resize&&t.push(`resize=${e.resize}`),e.format&&t.push(`format=${e.format}`),e.quality&&t.push(`quality=${e.quality}`),t.join("&")}}const fr="2.5.1",pr={"X-Client-Info":`storage-js/${fr}`};var le=globalThis&&globalThis.__awaiter||function(r,e,t,s){function n(i){return i instanceof t?i:new t(function(o){o(i)})}return new(t||(t=Promise))(function(i,o){function a(d){try{c(s.next(d))}catch(u){o(u)}}function l(d){try{c(s.throw(d))}catch(u){o(u)}}function c(d){d.done?i(d.value):n(d.value).then(a,l)}c((s=s.apply(r,e||[])).next())})};class mr{constructor(e,t={},s){this.url=e,this.headers=Object.assign(Object.assign({},pr),t),this.fetch=Ft(s)}listBuckets(){return le(this,void 0,void 0,function*(){try{return{data:yield We(this.fetch,`${this.url}/bucket`,{headers:this.headers}),error:null}}catch(e){if(P(e))return{data:null,error:e};throw e}})}getBucket(e){return le(this,void 0,void 0,function*(){try{return{data:yield We(this.fetch,`${this.url}/bucket/${e}`,{headers:this.headers}),error:null}}catch(t){if(P(t))return{data:null,error:t};throw t}})}createBucket(e,t={public:!1}){return le(this,void 0,void 0,function*(){try{return{data:yield Q(this.fetch,`${this.url}/bucket`,{id:e,name:e,public:t.public,file_size_limit:t.fileSizeLimit,allowed_mime_types:t.allowedMimeTypes},{headers:this.headers}),error:null}}catch(s){if(P(s))return{data:null,error:s};throw s}})}updateBucket(e,t){return le(this,void 0,void 0,function*(){try{return{data:yield dr(this.fetch,`${this.url}/bucket/${e}`,{id:e,name:e,public:t.public,file_size_limit:t.fileSizeLimit,allowed_mime_types:t.allowedMimeTypes},{headers:this.headers}),error:null}}catch(s){if(P(s))return{data:null,error:s};throw s}})}emptyBucket(e){return le(this,void 0,void 0,function*(){try{return{data:yield Q(this.fetch,`${this.url}/bucket/${e}/empty`,{},{headers:this.headers}),error:null}}catch(t){if(P(t))return{data:null,error:t};throw t}})}deleteBucket(e){return le(this,void 0,void 0,function*(){try{return{data:yield Ot(this.fetch,`${this.url}/bucket/${e}`,{},{headers:this.headers}),error:null}}catch(t){if(P(t))return{data:null,error:t};throw t}})}}class gr extends mr{constructor(e,t={},s){super(e,t,s)}from(e){return new ur(this.url,this.headers,e,this.fetch)}}const vr="2.21.0",yr={"X-Client-Info":`supabase-js/${vr}`};var br=globalThis&&globalThis.__awaiter||function(r,e,t,s){function n(i){return i instanceof t?i:new t(function(o){o(i)})}return new(t||(t=Promise))(function(i,o){function a(d){try{c(s.next(d))}catch(u){o(u)}}function l(d){try{c(s.throw(d))}catch(u){o(u)}}function c(d){d.done?i(d.value):n(d.value).then(a,l)}c((s=s.apply(r,e||[])).next())})};const _r=r=>{let e;return r?e=r:typeof fetch>"u"?e=tt:e=fetch,(...t)=>e(...t)},wr=()=>typeof Headers>"u"?et.Headers:Headers,xr=(r,e,t)=>{const s=_r(t),n=wr();return(i,o)=>br(void 0,void 0,void 0,function*(){var a;const l=(a=yield e())!==null&&a!==void 0?a:r;let c=new n(o?.headers);return c.has("apikey")||c.set("apikey",r),c.has("Authorization")||c.set("Authorization",`Bearer ${l}`),s(i,Object.assign(Object.assign({},o),{headers:c}))})};function Cr(r){return r.replace(/\/$/,"")}function Ar(r,e){const{db:t,auth:s,realtime:n,global:i}=r,{db:o,auth:a,realtime:l,global:c}=e;return{db:Object.assign(Object.assign({},o),t),auth:Object.assign(Object.assign({},a),s),realtime:Object.assign(Object.assign({},l),n),global:Object.assign(Object.assign({},c),i)}}var oe=globalThis&&globalThis.__awaiter||function(r,e,t,s){function n(i){return i instanceof t?i:new t(function(o){o(i)})}return new(t||(t=Promise))(function(i,o){function a(d){try{c(s.next(d))}catch(u){o(u)}}function l(d){try{c(s.throw(d))}catch(u){o(u)}}function c(d){d.done?i(d.value):n(d.value).then(a,l)}c((s=s.apply(r,e||[])).next())})};function jr(r){return Math.round(Date.now()/1e3)+r}function kr(){return"xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g,function(r){const e=Math.random()*16|0;return(r=="x"?e:e&3|8).toString(16)})}const Z=()=>typeof document<"u",se={tested:!1,writable:!1},Le=()=>{if(!Z())return!1;try{if(typeof globalThis.localStorage!="object")return!1}catch{return!1}if(se.tested)return se.writable;const r=`lswt-${Math.random()}${Math.random()}`;try{globalThis.localStorage.setItem(r,r),globalThis.localStorage.removeItem(r),se.tested=!0,se.writable=!0}catch{se.tested=!0,se.writable=!1}return se.writable};function N(r,e){var t;e||(e=((t=window?.location)===null||t===void 0?void 0:t.href)||""),r=r.replace(/[\[\]]/g,"\\$&");const s=new RegExp("[?&#]"+r+"(=([^&#]*)|&|#|$)"),n=s.exec(e);return n?n[2]?decodeURIComponent(n[2].replace(/\+/g," ")):"":null}const Rt=r=>{let e;return r?e=r:typeof fetch>"u"?e=(...t)=>oe(void 0,void 0,void 0,function*(){return yield(yield B(()=>Promise.resolve().then(()=>Fe),void 0)).fetch(...t)}):e=fetch,(...t)=>e(...t)},Er=r=>typeof r=="object"&&r!==null&&"status"in r&&"ok"in r&&"json"in r&&typeof r.json=="function",fe=(r,e,t)=>oe(void 0,void 0,void 0,function*(){yield r.setItem(e,JSON.stringify(t))}),ke=(r,e)=>oe(void 0,void 0,void 0,function*(){const t=yield r.getItem(e);if(!t)return null;try{return JSON.parse(t)}catch{return t}}),Ue=(r,e)=>oe(void 0,void 0,void 0,function*(){yield r.removeItem(e)});function Tr(r){const e="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";let t="",s,n,i,o,a,l,c,d=0;for(r=r.replace("-","+").replace("_","/");d<r.length;)o=e.indexOf(r.charAt(d++)),a=e.indexOf(r.charAt(d++)),l=e.indexOf(r.charAt(d++)),c=e.indexOf(r.charAt(d++)),s=o<<2|a>>4,n=(a&15)<<4|l>>2,i=(l&3)<<6|c,t=t+String.fromCharCode(s),l!=64&&n!=0&&(t=t+String.fromCharCode(n)),c!=64&&i!=0&&(t=t+String.fromCharCode(i));return t}class Re{constructor(){this.promise=new Re.promiseConstructor((e,t)=>{this.resolve=e,this.reject=t})}}Re.promiseConstructor=Promise;function yt(r){const e=/^([a-z0-9_-]{4})*($|[a-z0-9_-]{3}=?$|[a-z0-9_-]{2}(==)?$)$/i,t=r.split(".");if(t.length!==3)throw new Error("JWT is not valid: not a JWT structure");if(!e.test(t[1]))throw new Error("JWT is not valid: payload is not in base64url format");const s=t[1];return JSON.parse(Tr(s))}function Sr(r){return new Promise(e=>{setTimeout(()=>e(null),r)})}function Fr(r,e){return new Promise((s,n)=>{oe(this,void 0,void 0,function*(){for(let i=0;i<1/0;i++)try{const o=yield r(i);if(!e(i,null,o)){s(o);return}}catch(o){if(!e(i,o)){n(o);return}}})})}function Or(r){return("0"+r.toString(16)).substr(-2)}function Ee(){const e=new Uint32Array(56);if(typeof crypto>"u"){const t="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~",s=t.length;let n="";for(let i=0;i<56;i++)n+=t.charAt(Math.floor(Math.random()*s));return n}return crypto.getRandomValues(e),Array.from(e,Or).join("")}function Rr(r){return oe(this,void 0,void 0,function*(){const t=new TextEncoder().encode(r),s=yield crypto.subtle.digest("SHA-256",t),n=new Uint8Array(s);return Array.from(n).map(i=>String.fromCharCode(i)).join("")})}function Br(r){return btoa(r).replace(/\+/g,"-").replace(/\//g,"_").replace(/=+$/,"")}function Te(r){return oe(this,void 0,void 0,function*(){if(typeof crypto>"u")return console.warn("WebCrypto API is not supported. Code challenge method will default to use plain instead of sha256."),r;const e=yield Rr(r);return Br(e)})}class nt extends Error{constructor(e,t){super(e),this.__isAuthError=!0,this.name="AuthError",this.status=t}}function C(r){return typeof r=="object"&&r!==null&&"__isAuthError"in r}class Dr extends nt{constructor(e,t){super(e,t),this.name="AuthApiError",this.status=t}toJSON(){return{name:this.name,message:this.message,status:this.status}}}function $r(r){return C(r)&&r.name==="AuthApiError"}class Bt extends nt{constructor(e,t){super(e),this.name="AuthUnknownError",this.originalError=t}}class xe extends nt{constructor(e,t,s){super(e),this.name=t,this.status=s}toJSON(){return{name:this.name,message:this.message,status:this.status}}}class pe extends xe{constructor(){super("Auth session missing!","AuthSessionMissingError",400)}}class Ge extends xe{constructor(e){super(e,"AuthInvalidCredentialsError",400)}}class V extends xe{constructor(e,t=null){super(e,"AuthImplicitGrantRedirectError",500),this.details=null,this.details=t}toJSON(){return{name:this.name,message:this.message,status:this.status,details:this.details}}}class Me extends xe{constructor(e,t=null){super(e,"AuthPKCEGrantCodeExchangeError",500),this.details=null,this.details=t}toJSON(){return{name:this.name,message:this.message,status:this.status,details:this.details}}}class Ye extends xe{constructor(e,t){super(e,"AuthRetryableFetchError",t)}}var it=globalThis&&globalThis.__awaiter||function(r,e,t,s){function n(i){return i instanceof t?i:new t(function(o){o(i)})}return new(t||(t=Promise))(function(i,o){function a(d){try{c(s.next(d))}catch(u){o(u)}}function l(d){try{c(s.throw(d))}catch(u){o(u)}}function c(d){d.done?i(d.value):n(d.value).then(a,l)}c((s=s.apply(r,e||[])).next())})},Pr=globalThis&&globalThis.__rest||function(r,e){var t={};for(var s in r)Object.prototype.hasOwnProperty.call(r,s)&&e.indexOf(s)<0&&(t[s]=r[s]);if(r!=null&&typeof Object.getOwnPropertySymbols=="function")for(var n=0,s=Object.getOwnPropertySymbols(r);n<s.length;n++)e.indexOf(s[n])<0&&Object.prototype.propertyIsEnumerable.call(r,s[n])&&(t[s[n]]=r[s[n]]);return t};const Se=r=>r.msg||r.message||r.error_description||r.error||JSON.stringify(r),Ir=(r,e)=>it(void 0,void 0,void 0,function*(){const t=[502,503,504];Er(r)?t.includes(r.status)?e(new Ye(Se(r),r.status)):r.json().then(s=>{e(new Dr(Se(s),r.status||500))}).catch(s=>{e(new Bt(Se(s),s))}):e(new Ye(Se(r),0))}),Nr=(r,e,t,s)=>{const n={method:r,headers:e?.headers||{}};return r==="GET"?n:(n.headers=Object.assign({"Content-Type":"application/json;charset=UTF-8"},e?.headers),n.body=JSON.stringify(s),Object.assign(Object.assign({},n),t))};function k(r,e,t,s){var n;return it(this,void 0,void 0,function*(){const i=Object.assign({},s?.headers);s?.jwt&&(i.Authorization=`Bearer ${s.jwt}`);const o=(n=s?.query)!==null&&n!==void 0?n:{};s?.redirectTo&&(o.redirect_to=s.redirectTo);const a=Object.keys(o).length?"?"+new URLSearchParams(o).toString():"",l=yield Lr(r,e,t+a,{headers:i,noResolveJson:s?.noResolveJson},{},s?.body);return s?.xform?s?.xform(l):{data:Object.assign({},l),error:null}})}function Lr(r,e,t,s,n,i){return it(this,void 0,void 0,function*(){return new Promise((o,a)=>{r(t,Nr(e,s,n,i)).then(l=>{if(!l.ok)throw l;return s?.noResolveJson?l:l.json()}).then(l=>o(l)).catch(l=>Ir(l,a))})})}function Y(r){var e;let t=null;qr(r)&&(t=Object.assign({},r),t.expires_at=jr(r.expires_in));const s=(e=r.user)!==null&&e!==void 0?e:r;return{data:{session:t,user:s},error:null}}function ie(r){var e;return{data:{user:(e=r.user)!==null&&e!==void 0?e:r},error:null}}function Ur(r){return{data:r,error:null}}function Gr(r){const{action_link:e,email_otp:t,hashed_token:s,redirect_to:n,verification_type:i}=r,o=Pr(r,["action_link","email_otp","hashed_token","redirect_to","verification_type"]),a={action_link:e,email_otp:t,hashed_token:s,redirect_to:n,verification_type:i},l=Object.assign({},o);return{data:{properties:a,user:l},error:null}}function Mr(r){return r}function qr(r){return r.access_token&&r.refresh_token&&r.expires_in}var H=globalThis&&globalThis.__awaiter||function(r,e,t,s){function n(i){return i instanceof t?i:new t(function(o){o(i)})}return new(t||(t=Promise))(function(i,o){function a(d){try{c(s.next(d))}catch(u){o(u)}}function l(d){try{c(s.throw(d))}catch(u){o(u)}}function c(d){d.done?i(d.value):n(d.value).then(a,l)}c((s=s.apply(r,e||[])).next())})},zr=globalThis&&globalThis.__rest||function(r,e){var t={};for(var s in r)Object.prototype.hasOwnProperty.call(r,s)&&e.indexOf(s)<0&&(t[s]=r[s]);if(r!=null&&typeof Object.getOwnPropertySymbols=="function")for(var n=0,s=Object.getOwnPropertySymbols(r);n<s.length;n++)e.indexOf(s[n])<0&&Object.prototype.propertyIsEnumerable.call(r,s[n])&&(t[s[n]]=r[s[n]]);return t};class Hr{constructor({url:e="",headers:t={},fetch:s}){this.url=e,this.headers=t,this.fetch=Rt(s),this.mfa={listFactors:this._listFactors.bind(this),deleteFactor:this._deleteFactor.bind(this)}}signOut(e){return H(this,void 0,void 0,function*(){try{return yield k(this.fetch,"POST",`${this.url}/logout`,{headers:this.headers,jwt:e,noResolveJson:!0}),{data:null,error:null}}catch(t){if(C(t))return{data:null,error:t};throw t}})}inviteUserByEmail(e,t={}){return H(this,void 0,void 0,function*(){try{return yield k(this.fetch,"POST",`${this.url}/invite`,{body:{email:e,data:t.data},headers:this.headers,redirectTo:t.redirectTo,xform:ie})}catch(s){if(C(s))return{data:{user:null},error:s};throw s}})}generateLink(e){return H(this,void 0,void 0,function*(){try{const{options:t}=e,s=zr(e,["options"]),n=Object.assign(Object.assign({},s),t);return"newEmail"in s&&(n.new_email=s?.newEmail,delete n.newEmail),yield k(this.fetch,"POST",`${this.url}/admin/generate_link`,{body:n,headers:this.headers,xform:Gr,redirectTo:t?.redirectTo})}catch(t){if(C(t))return{data:{properties:null,user:null},error:t};throw t}})}createUser(e){return H(this,void 0,void 0,function*(){try{return yield k(this.fetch,"POST",`${this.url}/admin/users`,{body:e,headers:this.headers,xform:ie})}catch(t){if(C(t))return{data:{user:null},error:t};throw t}})}listUsers(e){var t,s,n,i,o,a,l;return H(this,void 0,void 0,function*(){try{const c={nextPage:null,lastPage:0,total:0},d=yield k(this.fetch,"GET",`${this.url}/admin/users`,{headers:this.headers,noResolveJson:!0,query:{page:(s=(t=e?.page)===null||t===void 0?void 0:t.toString())!==null&&s!==void 0?s:"",per_page:(i=(n=e?.perPage)===null||n===void 0?void 0:n.toString())!==null&&i!==void 0?i:""},xform:Mr});if(d.error)throw d.error;const u=yield d.json(),p=(o=d.headers.get("x-total-count"))!==null&&o!==void 0?o:0,y=(l=(a=d.headers.get("link"))===null||a===void 0?void 0:a.split(","))!==null&&l!==void 0?l:[];return y.length>0&&(y.forEach(g=>{const _=parseInt(g.split(";")[0].split("=")[1].substring(0,1)),b=JSON.parse(g.split(";")[1].split("=")[1]);c[`${b}Page`]=_}),c.total=parseInt(p)),{data:Object.assign(Object.assign({},u),c),error:null}}catch(c){if(C(c))return{data:{users:[]},error:c};throw c}})}getUserById(e){return H(this,void 0,void 0,function*(){try{return yield k(this.fetch,"GET",`${this.url}/admin/users/${e}`,{headers:this.headers,xform:ie})}catch(t){if(C(t))return{data:{user:null},error:t};throw t}})}updateUserById(e,t){return H(this,void 0,void 0,function*(){try{return yield k(this.fetch,"PUT",`${this.url}/admin/users/${e}`,{body:t,headers:this.headers,xform:ie})}catch(s){if(C(s))return{data:{user:null},error:s};throw s}})}deleteUser(e,t=!1){return H(this,void 0,void 0,function*(){try{return yield k(this.fetch,"DELETE",`${this.url}/admin/users/${e}`,{headers:this.headers,body:{should_soft_delete:t},xform:ie})}catch(s){if(C(s))return{data:{user:null},error:s};throw s}})}_listFactors(e){return H(this,void 0,void 0,function*(){try{const{data:t,error:s}=yield k(this.fetch,"GET",`${this.url}/admin/users/${e.userId}/factors`,{headers:this.headers,xform:n=>({data:{factors:n},error:null})});return{data:t,error:s}}catch(t){if(C(t))return{data:null,error:t};throw t}})}_deleteFactor(e){return H(this,void 0,void 0,function*(){try{return{data:yield k(this.fetch,"DELETE",`${this.url}/admin/users/${e.userId}/factors/${e.id}`,{headers:this.headers}),error:null}}catch(t){if(C(t))return{data:null,error:t};throw t}})}}const Jr="2.24.0",Kr="http://localhost:9999",Vr="supabase.auth.token",Wr={"X-Client-Info":`gotrue-js/${Jr}`},Yr=10,Xr={getItem:r=>Le()?globalThis.localStorage.getItem(r):null,setItem:(r,e)=>{Le()&&globalThis.localStorage.setItem(r,e)},removeItem:r=>{Le()&&globalThis.localStorage.removeItem(r)}};function Zr(){if(typeof globalThis!="object")try{Object.defineProperty(Object.prototype,"__magic__",{get:function(){return this},configurable:!0}),__magic__.globalThis=__magic__,delete Object.prototype.__magic__}catch{typeof self<"u"&&(self.globalThis=self)}}var w=globalThis&&globalThis.__awaiter||function(r,e,t,s){function n(i){return i instanceof t?i:new t(function(o){o(i)})}return new(t||(t=Promise))(function(i,o){function a(d){try{c(s.next(d))}catch(u){o(u)}}function l(d){try{c(s.throw(d))}catch(u){o(u)}}function c(d){d.done?i(d.value):n(d.value).then(a,l)}c((s=s.apply(r,e||[])).next())})};Zr();const Qr={url:Kr,storageKey:Vr,autoRefreshToken:!0,persistSession:!0,detectSessionInUrl:!0,headers:Wr,flowType:"implicit"},qe=30*1e3,en=3;class tn{constructor(e){var t;this.stateChangeEmitters=new Map,this.autoRefreshTicker=null,this.visibilityChangedCallback=null,this.refreshingDeferred=null,this.initializePromise=null,this.detectSessionInUrl=!0,this.broadcastChannel=null;const s=Object.assign(Object.assign({},Qr),e);if(this.inMemorySession=null,this.storageKey=s.storageKey,this.autoRefreshToken=s.autoRefreshToken,this.persistSession=s.persistSession,this.storage=s.storage||Xr,this.admin=new Hr({url:s.url,headers:s.headers,fetch:s.fetch}),this.url=s.url,this.headers=s.headers,this.fetch=Rt(s.fetch),this.detectSessionInUrl=s.detectSessionInUrl,this.flowType=s.flowType,this.mfa={verify:this._verify.bind(this),enroll:this._enroll.bind(this),unenroll:this._unenroll.bind(this),challenge:this._challenge.bind(this),listFactors:this._listFactors.bind(this),challengeAndVerify:this._challengeAndVerify.bind(this),getAuthenticatorAssuranceLevel:this._getAuthenticatorAssuranceLevel.bind(this)},Z()&&globalThis.BroadcastChannel&&this.persistSession&&this.storageKey){try{this.broadcastChannel=new globalThis.BroadcastChannel(this.storageKey)}catch(n){console.error("Failed to create a new BroadcastChannel, multi-tab state changes will not be available",n)}(t=this.broadcastChannel)===null||t===void 0||t.addEventListener("message",n=>{this._notifyAllSubscribers(n.data.event,n.data.session,!1)})}this.initialize()}initialize(){return this.initializePromise||(this.initializePromise=this._initialize()),this.initializePromise}_initialize(){return w(this,void 0,void 0,function*(){if(this.initializePromise)return this.initializePromise;try{const e=yield this._isPKCEFlow();if(this.detectSessionInUrl&&this._isImplicitGrantFlow()||e){const{data:t,error:s}=yield this._getSessionFromUrl(e);if(s)return yield this._removeSession(),{error:s};const{session:n,redirectType:i}=t;return yield this._saveSession(n),setTimeout(()=>{i==="recovery"?this._notifyAllSubscribers("PASSWORD_RECOVERY",n):this._notifyAllSubscribers("SIGNED_IN",n)},0),{error:null}}return yield this._recoverAndRefresh(),{error:null}}catch(e){return C(e)?{error:e}:{error:new Bt("Unexpected error during initialization",e)}}finally{yield this._handleVisibilityChange()}})}signUp(e){var t,s,n;return w(this,void 0,void 0,function*(){try{yield this._removeSession();let i;if("email"in e){const{email:d,password:u,options:p}=e;let y=null,g=null;if(this.flowType==="pkce"){const _=Ee();yield fe(this.storage,`${this.storageKey}-code-verifier`,_),y=yield Te(_),g=_===y?"plain":"s256"}i=yield k(this.fetch,"POST",`${this.url}/signup`,{headers:this.headers,redirectTo:p?.emailRedirectTo,body:{email:d,password:u,data:(t=p?.data)!==null&&t!==void 0?t:{},gotrue_meta_security:{captcha_token:p?.captchaToken},code_challenge:y,code_challenge_method:g},xform:Y})}else if("phone"in e){const{phone:d,password:u,options:p}=e;i=yield k(this.fetch,"POST",`${this.url}/signup`,{headers:this.headers,body:{phone:d,password:u,data:(s=p?.data)!==null&&s!==void 0?s:{},channel:(n=p?.channel)!==null&&n!==void 0?n:"sms",gotrue_meta_security:{captcha_token:p?.captchaToken}},xform:Y})}else throw new Ge("You must provide either an email or phone number and a password");const{data:o,error:a}=i;if(a||!o)return{data:{user:null,session:null},error:a};const l=o.session,c=o.user;return o.session&&(yield this._saveSession(o.session),this._notifyAllSubscribers("SIGNED_IN",l)),{data:{user:c,session:l},error:null}}catch(i){if(C(i))return{data:{user:null,session:null},error:i};throw i}})}signInWithPassword(e){return w(this,void 0,void 0,function*(){try{yield this._removeSession();let t;if("email"in e){const{email:i,password:o,options:a}=e;t=yield k(this.fetch,"POST",`${this.url}/token?grant_type=password`,{headers:this.headers,body:{email:i,password:o,gotrue_meta_security:{captcha_token:a?.captchaToken}},xform:Y})}else if("phone"in e){const{phone:i,password:o,options:a}=e;t=yield k(this.fetch,"POST",`${this.url}/token?grant_type=password`,{headers:this.headers,body:{phone:i,password:o,gotrue_meta_security:{captcha_token:a?.captchaToken}},xform:Y})}else throw new Ge("You must provide either an email or phone number and a password");const{data:s,error:n}=t;return n||!s?{data:{user:null,session:null},error:n}:(s.session&&(yield this._saveSession(s.session),this._notifyAllSubscribers("SIGNED_IN",s.session)),{data:s,error:n})}catch(t){if(C(t))return{data:{user:null,session:null},error:t};throw t}})}signInWithOAuth(e){var t,s,n,i;return w(this,void 0,void 0,function*(){return yield this._removeSession(),yield this._handleProviderSignIn(e.provider,{redirectTo:(t=e.options)===null||t===void 0?void 0:t.redirectTo,scopes:(s=e.options)===null||s===void 0?void 0:s.scopes,queryParams:(n=e.options)===null||n===void 0?void 0:n.queryParams,skipBrowserRedirect:(i=e.options)===null||i===void 0?void 0:i.skipBrowserRedirect})})}exchangeCodeForSession(e){return w(this,void 0,void 0,function*(){const t=yield ke(this.storage,`${this.storageKey}-code-verifier`),{data:s,error:n}=yield k(this.fetch,"POST",`${this.url}/token?grant_type=pkce`,{headers:this.headers,body:{auth_code:e,code_verifier:t},xform:Y});return yield Ue(this.storage,`${this.storageKey}-code-verifier`),n||!s?{data:{user:null,session:null},error:n}:(s.session&&(yield this._saveSession(s.session),this._notifyAllSubscribers("SIGNED_IN",s.session)),{data:s,error:n})})}signInWithIdToken(e){return w(this,void 0,void 0,function*(){yield this._removeSession();try{const{options:t,provider:s,token:n,nonce:i}=e,o=yield k(this.fetch,"POST",`${this.url}/token?grant_type=id_token`,{headers:this.headers,body:{provider:s,id_token:n,nonce:i,gotrue_meta_security:{captcha_token:t?.captchaToken}},xform:Y}),{data:a,error:l}=o;return l||!a?{data:{user:null,session:null},error:l}:(a.session&&(yield this._saveSession(a.session),this._notifyAllSubscribers("SIGNED_IN",a.session)),{data:a,error:l})}catch(t){if(C(t))return{data:{user:null,session:null},error:t};throw t}})}signInWithOtp(e){var t,s,n,i,o;return w(this,void 0,void 0,function*(){try{if(yield this._removeSession(),"email"in e){const{email:a,options:l}=e;let c=null,d=null;if(this.flowType==="pkce"){const p=Ee();yield fe(this.storage,`${this.storageKey}-code-verifier`,p),c=yield Te(p),d=p===c?"plain":"s256"}const{error:u}=yield k(this.fetch,"POST",`${this.url}/otp`,{headers:this.headers,body:{email:a,data:(t=l?.data)!==null&&t!==void 0?t:{},create_user:(s=l?.shouldCreateUser)!==null&&s!==void 0?s:!0,gotrue_meta_security:{captcha_token:l?.captchaToken},code_challenge:c,code_challenge_method:d},redirectTo:l?.emailRedirectTo});return{data:{user:null,session:null},error:u}}if("phone"in e){const{phone:a,options:l}=e,{error:c}=yield k(this.fetch,"POST",`${this.url}/otp`,{headers:this.headers,body:{phone:a,data:(n=l?.data)!==null&&n!==void 0?n:{},create_user:(i=l?.shouldCreateUser)!==null&&i!==void 0?i:!0,gotrue_meta_security:{captcha_token:l?.captchaToken},channel:(o=l?.channel)!==null&&o!==void 0?o:"sms"}});return{data:{user:null,session:null},error:c}}throw new Ge("You must provide either an email or phone number.")}catch(a){if(C(a))return{data:{user:null,session:null},error:a};throw a}})}verifyOtp(e){var t,s;return w(this,void 0,void 0,function*(){try{yield this._removeSession();const{data:n,error:i}=yield k(this.fetch,"POST",`${this.url}/verify`,{headers:this.headers,body:Object.assign(Object.assign({},e),{gotrue_meta_security:{captcha_token:(t=e.options)===null||t===void 0?void 0:t.captchaToken}}),redirectTo:(s=e.options)===null||s===void 0?void 0:s.redirectTo,xform:Y});if(i)throw i;if(!n)throw new Error("An error occurred on token verification.");const o=n.session,a=n.user;return o?.access_token&&(yield this._saveSession(o),this._notifyAllSubscribers("SIGNED_IN",o)),{data:{user:a,session:o},error:null}}catch(n){if(C(n))return{data:{user:null,session:null},error:n};throw n}})}signInWithSSO(e){var t,s,n;return w(this,void 0,void 0,function*(){try{return yield this._removeSession(),yield k(this.fetch,"POST",`${this.url}/sso`,{body:Object.assign(Object.assign(Object.assign(Object.assign(Object.assign({},"providerId"in e?{provider_id:e.providerId}:null),"domain"in e?{domain:e.domain}:null),{redirect_to:(s=(t=e.options)===null||t===void 0?void 0:t.redirectTo)!==null&&s!==void 0?s:void 0}),!((n=e?.options)===null||n===void 0)&&n.captchaToken?{gotrue_meta_security:{captcha_token:e.options.captchaToken}}:null),{skip_http_redirect:!0}),headers:this.headers,xform:Ur})}catch(i){if(C(i))return{data:null,error:i};throw i}})}getSession(){return w(this,void 0,void 0,function*(){yield this.initializePromise;let e=null;if(this.persistSession){const i=yield ke(this.storage,this.storageKey);i!==null&&(this._isValidSession(i)?e=i:yield this._removeSession())}else e=this.inMemorySession;if(!e)return{data:{session:null},error:null};if(!(e.expires_at?e.expires_at<=Date.now()/1e3:!1))return{data:{session:e},error:null};const{session:s,error:n}=yield this._callRefreshToken(e.refresh_token);return n?{data:{session:null},error:n}:{data:{session:s},error:null}})}getUser(e){var t,s;return w(this,void 0,void 0,function*(){try{if(!e){const{data:n,error:i}=yield this.getSession();if(i)throw i;e=(s=(t=n.session)===null||t===void 0?void 0:t.access_token)!==null&&s!==void 0?s:void 0}return yield k(this.fetch,"GET",`${this.url}/user`,{headers:this.headers,jwt:e,xform:ie})}catch(n){if(C(n))return{data:{user:null},error:n};throw n}})}updateUser(e,t={}){return w(this,void 0,void 0,function*(){try{const{data:s,error:n}=yield this.getSession();if(n)throw n;if(!s.session)throw new pe;const i=s.session,{data:o,error:a}=yield k(this.fetch,"PUT",`${this.url}/user`,{headers:this.headers,redirectTo:t?.emailRedirectTo,body:e,jwt:i.access_token,xform:ie});if(a)throw a;return i.user=o.user,yield this._saveSession(i),this._notifyAllSubscribers("USER_UPDATED",i),{data:{user:i.user},error:null}}catch(s){if(C(s))return{data:{user:null},error:s};throw s}})}_decodeJWT(e){return yt(e)}setSession(e){return w(this,void 0,void 0,function*(){try{if(!e.access_token||!e.refresh_token)throw new pe;const t=Date.now()/1e3;let s=t,n=!0,i=null;const o=yt(e.access_token);if(o.exp&&(s=o.exp,n=s<=t),n){const{session:a,error:l}=yield this._callRefreshToken(e.refresh_token);if(l)return{data:{user:null,session:null},error:l};if(!a)return{data:{user:null,session:null},error:null};i=a}else{const{data:a,error:l}=yield this.getUser(e.access_token);if(l)throw l;i={access_token:e.access_token,refresh_token:e.refresh_token,user:a.user,token_type:"bearer",expires_in:s-t,expires_at:s},yield this._saveSession(i),this._notifyAllSubscribers("SIGNED_IN",i)}return{data:{user:i.user,session:i},error:null}}catch(t){if(C(t))return{data:{session:null,user:null},error:t};throw t}})}refreshSession(e){var t;return w(this,void 0,void 0,function*(){try{if(!e){const{data:i,error:o}=yield this.getSession();if(o)throw o;e=(t=i.session)!==null&&t!==void 0?t:void 0}if(!e?.refresh_token)throw new pe;const{session:s,error:n}=yield this._callRefreshToken(e.refresh_token);return n?{data:{user:null,session:null},error:n}:s?{data:{user:s.user,session:s},error:null}:{data:{user:null,session:null},error:null}}catch(s){if(C(s))return{data:{user:null,session:null},error:s};throw s}})}_getSessionFromUrl(e){return w(this,void 0,void 0,function*(){try{if(!Z())throw new V("No browser detected.");if(this.flowType==="implicit"&&!this._isImplicitGrantFlow())throw new V("Not a valid implicit grant flow url.");if(this.flowType=="pkce"&&!e)throw new Me("Not a valid PKCE flow url.");if(e){const b=N("code");if(!b)throw new Me("No code detected.");const{data:A,error:O}=yield this.exchangeCodeForSession(b);if(O)throw O;if(!A.session)throw new Me("No session detected.");return{data:{session:A.session,redirectType:null},error:null}}const t=N("error_description");if(t){const b=N("error_code");if(!b)throw new V("No error_code detected.");const A=N("error");throw A?new V(t,{error:A,code:b}):new V("No error detected.")}const s=N("provider_token"),n=N("provider_refresh_token"),i=N("access_token");if(!i)throw new V("No access_token detected.");const o=N("expires_in");if(!o)throw new V("No expires_in detected.");const a=N("refresh_token");if(!a)throw new V("No refresh_token detected.");const l=N("token_type");if(!l)throw new V("No token_type detected.");const d=Math.round(Date.now()/1e3)+parseInt(o),{data:u,error:p}=yield this.getUser(i);if(p)throw p;const y=u.user,g={provider_token:s,provider_refresh_token:n,access_token:i,expires_in:parseInt(o),expires_at:d,refresh_token:a,token_type:l,user:y},_=N("type");return window.location.hash="",{data:{session:g,redirectType:_},error:null}}catch(t){if(C(t))return{data:{session:null,redirectType:null},error:t};throw t}})}_isImplicitGrantFlow(){return Z()&&(!!N("access_token")||!!N("error_description"))}_isPKCEFlow(){return w(this,void 0,void 0,function*(){const e=yield ke(this.storage,`${this.storageKey}-code-verifier`);return Z()&&!!N("code")&&!!e})}signOut(){var e;return w(this,void 0,void 0,function*(){const{data:t,error:s}=yield this.getSession();if(s)return{error:s};const n=(e=t.session)===null||e===void 0?void 0:e.access_token;if(n){const{error:i}=yield this.admin.signOut(n);if(i&&!($r(i)&&(i.status===404||i.status===401)))return{error:i}}return yield this._removeSession(),yield Ue(this.storage,`${this.storageKey}-code-verifier`),this._notifyAllSubscribers("SIGNED_OUT",null),{error:null}})}onAuthStateChange(e){const t=kr(),s={id:t,callback:e,unsubscribe:()=>{this.stateChangeEmitters.delete(t)}};return this.stateChangeEmitters.set(t,s),this.emitInitialSession(t),{data:{subscription:s}}}emitInitialSession(e){var t,s;return w(this,void 0,void 0,function*(){try{const{data:{session:n},error:i}=yield this.getSession();if(i)throw i;(t=this.stateChangeEmitters.get(e))===null||t===void 0||t.callback("INITIAL_SESSION",n)}catch(n){(s=this.stateChangeEmitters.get(e))===null||s===void 0||s.callback("INITIAL_SESSION",null),console.error(n)}})}resetPasswordForEmail(e,t={}){return w(this,void 0,void 0,function*(){let s=null,n=null;if(this.flowType==="pkce"){const i=Ee();yield fe(this.storage,`${this.storageKey}-code-verifier`,i),s=yield Te(i),n=i===s?"plain":"s256"}try{return yield k(this.fetch,"POST",`${this.url}/recover`,{body:{email:e,code_challenge:s,code_challenge_method:n,gotrue_meta_security:{captcha_token:t.captchaToken}},headers:this.headers,redirectTo:t.redirectTo})}catch(i){if(C(i))return{data:null,error:i};throw i}})}_refreshAccessToken(e){return w(this,void 0,void 0,function*(){try{const t=Date.now();return yield Fr(s=>w(this,void 0,void 0,function*(){return yield Sr(s*200),yield k(this.fetch,"POST",`${this.url}/token?grant_type=refresh_token`,{body:{refresh_token:e},headers:this.headers,xform:Y})}),(s,n,i)=>i&&i.error&&i.error instanceof Ye&&Date.now()+(s+1)*200-t<qe)}catch(t){if(C(t))return{data:{session:null,user:null},error:t};throw t}})}_isValidSession(e){return typeof e=="object"&&e!==null&&"access_token"in e&&"refresh_token"in e&&"expires_at"in e}_handleProviderSignIn(e,t){return w(this,void 0,void 0,function*(){const s=yield this._getUrlForProvider(e,{redirectTo:t.redirectTo,scopes:t.scopes,queryParams:t.queryParams});return Z()&&!t.skipBrowserRedirect&&window.location.assign(s),{data:{provider:e,url:s},error:null}})}_recoverAndRefresh(){var e;return w(this,void 0,void 0,function*(){try{const t=yield ke(this.storage,this.storageKey);if(!this._isValidSession(t)){t!==null&&(yield this._removeSession());return}const s=Math.round(Date.now()/1e3);if(((e=t.expires_at)!==null&&e!==void 0?e:1/0)<s+Yr)if(this.autoRefreshToken&&t.refresh_token){const{error:n}=yield this._callRefreshToken(t.refresh_token);n&&(console.log(n.message),yield this._removeSession())}else yield this._removeSession();else this.persistSession&&(yield this._saveSession(t)),this._notifyAllSubscribers("SIGNED_IN",t)}catch(t){console.error(t);return}})}_callRefreshToken(e){var t,s;return w(this,void 0,void 0,function*(){if(this.refreshingDeferred)return this.refreshingDeferred.promise;try{if(this.refreshingDeferred=new Re,!e)throw new pe;const{data:n,error:i}=yield this._refreshAccessToken(e);if(i)throw i;if(!n.session)throw new pe;yield this._saveSession(n.session),this._notifyAllSubscribers("TOKEN_REFRESHED",n.session);const o={session:n.session,error:null};return this.refreshingDeferred.resolve(o),o}catch(n){if(C(n)){const i={session:null,error:n};return(t=this.refreshingDeferred)===null||t===void 0||t.resolve(i),i}throw(s=this.refreshingDeferred)===null||s===void 0||s.reject(n),n}finally{this.refreshingDeferred=null}})}_notifyAllSubscribers(e,t,s=!0){this.broadcastChannel&&s&&this.broadcastChannel.postMessage({event:e,session:t}),this.stateChangeEmitters.forEach(n=>n.callback(e,t))}_saveSession(e){return w(this,void 0,void 0,function*(){this.persistSession||(this.inMemorySession=e),this.persistSession&&e.expires_at&&(yield this._persistSession(e))})}_persistSession(e){return fe(this.storage,this.storageKey,e)}_removeSession(){return w(this,void 0,void 0,function*(){this.persistSession?yield Ue(this.storage,this.storageKey):this.inMemorySession=null})}_removeVisibilityChangedCallback(){const e=this.visibilityChangedCallback;this.visibilityChangedCallback=null;try{e&&Z()&&window?.removeEventListener&&window.removeEventListener("visibilitychange",e)}catch(t){console.error("removing visibilitychange callback failed",t)}}_startAutoRefresh(){return w(this,void 0,void 0,function*(){yield this._stopAutoRefresh();const e=setInterval(()=>this._autoRefreshTokenTick(),qe);this.autoRefreshTicker=e,e&&typeof e=="object"&&typeof e.unref=="function"?e.unref():typeof Deno<"u"&&typeof Deno.unrefTimer=="function"&&Deno.unrefTimer(e),yield this._autoRefreshTokenTick()})}_stopAutoRefresh(){return w(this,void 0,void 0,function*(){const e=this.autoRefreshTicker;this.autoRefreshTicker=null,e&&clearInterval(e)})}startAutoRefresh(){return w(this,void 0,void 0,function*(){this._removeVisibilityChangedCallback(),yield this._startAutoRefresh()})}stopAutoRefresh(){return w(this,void 0,void 0,function*(){this._removeVisibilityChangedCallback(),yield this._stopAutoRefresh()})}_autoRefreshTokenTick(){return w(this,void 0,void 0,function*(){const e=Date.now();try{const{data:{session:t}}=yield this.getSession();if(!t||!t.refresh_token||!t.expires_at)return;Math.floor((t.expires_at*1e3-e)/qe)<en&&(yield this._callRefreshToken(t.refresh_token))}catch(t){console.error("Auto refresh tick failed with error. This is likely a transient error.",t)}})}_handleVisibilityChange(){return w(this,void 0,void 0,function*(){if(!Z()||!window?.addEventListener)return this.autoRefreshToken&&this.startAutoRefresh(),!1;try{this.visibilityChangedCallback=()=>w(this,void 0,void 0,function*(){return yield this._onVisibilityChanged(!1)}),window?.addEventListener("visibilitychange",this.visibilityChangedCallback),yield this._onVisibilityChanged(!0)}catch(e){console.error("_handleVisibilityChange",e)}})}_onVisibilityChanged(e){return w(this,void 0,void 0,function*(){document.visibilityState==="visible"?(e||(yield this.initializePromise,yield this._recoverAndRefresh()),this.autoRefreshToken&&this._startAutoRefresh()):document.visibilityState==="hidden"&&this.autoRefreshToken&&this._stopAutoRefresh()})}_getUrlForProvider(e,t){return w(this,void 0,void 0,function*(){const s=[`provider=${encodeURIComponent(e)}`];if(t?.redirectTo&&s.push(`redirect_to=${encodeURIComponent(t.redirectTo)}`),t?.scopes&&s.push(`scopes=${encodeURIComponent(t.scopes)}`),this.flowType==="pkce"){const n=Ee();yield fe(this.storage,`${this.storageKey}-code-verifier`,n);const i=yield Te(n),o=n===i?"plain":"s256",a=new URLSearchParams({code_challenge:`${encodeURIComponent(i)}`,code_challenge_method:`${encodeURIComponent(o)}`});s.push(a.toString())}if(t?.queryParams){const n=new URLSearchParams(t.queryParams);s.push(n.toString())}return`${this.url}/authorize?${s.join("&")}`})}_unenroll(e){var t;return w(this,void 0,void 0,function*(){try{const{data:s,error:n}=yield this.getSession();return n?{data:null,error:n}:yield k(this.fetch,"DELETE",`${this.url}/factors/${e.factorId}`,{headers:this.headers,jwt:(t=s?.session)===null||t===void 0?void 0:t.access_token})}catch(s){if(C(s))return{data:null,error:s};throw s}})}_enroll(e){var t,s;return w(this,void 0,void 0,function*(){try{const{data:n,error:i}=yield this.getSession();if(i)return{data:null,error:i};const{data:o,error:a}=yield k(this.fetch,"POST",`${this.url}/factors`,{body:{friendly_name:e.friendlyName,factor_type:e.factorType,issuer:e.issuer},headers:this.headers,jwt:(t=n?.session)===null||t===void 0?void 0:t.access_token});return a?{data:null,error:a}:(!((s=o?.totp)===null||s===void 0)&&s.qr_code&&(o.totp.qr_code=`data:image/svg+xml;utf-8,${o.totp.qr_code}`),{data:o,error:null})}catch(n){if(C(n))return{data:null,error:n};throw n}})}_verify(e){var t;return w(this,void 0,void 0,function*(){try{const{data:s,error:n}=yield this.getSession();if(n)return{data:null,error:n};const{data:i,error:o}=yield k(this.fetch,"POST",`${this.url}/factors/${e.factorId}/verify`,{body:{code:e.code,challenge_id:e.challengeId},headers:this.headers,jwt:(t=s?.session)===null||t===void 0?void 0:t.access_token});return o?{data:null,error:o}:(yield this._saveSession(Object.assign({expires_at:Math.round(Date.now()/1e3)+i.expires_in},i)),this._notifyAllSubscribers("MFA_CHALLENGE_VERIFIED",i),{data:i,error:o})}catch(s){if(C(s))return{data:null,error:s};throw s}})}_challenge(e){var t;return w(this,void 0,void 0,function*(){try{const{data:s,error:n}=yield this.getSession();return n?{data:null,error:n}:yield k(this.fetch,"POST",`${this.url}/factors/${e.factorId}/challenge`,{headers:this.headers,jwt:(t=s?.session)===null||t===void 0?void 0:t.access_token})}catch(s){if(C(s))return{data:null,error:s};throw s}})}_challengeAndVerify(e){return w(this,void 0,void 0,function*(){const{data:t,error:s}=yield this._challenge({factorId:e.factorId});return s?{data:null,error:s}:yield this._verify({factorId:e.factorId,challengeId:t.id,code:e.code})})}_listFactors(){return w(this,void 0,void 0,function*(){const{data:{user:e},error:t}=yield this.getUser();if(t)return{data:null,error:t};const s=e?.factors||[],n=s.filter(i=>i.factor_type==="totp"&&i.status==="verified");return{data:{all:s,totp:n},error:null}})}_getAuthenticatorAssuranceLevel(){var e,t;return w(this,void 0,void 0,function*(){const{data:{session:s},error:n}=yield this.getSession();if(n)return{data:null,error:n};if(!s)return{data:{currentLevel:null,nextLevel:null,currentAuthenticationMethods:[]},error:null};const i=this._decodeJWT(s.access_token);let o=null;i.aal&&(o=i.aal);let a=o;((t=(e=s.user.factors)===null||e===void 0?void 0:e.filter(d=>d.status==="verified"))!==null&&t!==void 0?t:[]).length>0&&(a="aal2");const c=i.amr||[];return{data:{currentLevel:o,nextLevel:a,currentAuthenticationMethods:c},error:null}})}}class sn extends tn{constructor(e){super(e)}}var rn=globalThis&&globalThis.__awaiter||function(r,e,t,s){function n(i){return i instanceof t?i:new t(function(o){o(i)})}return new(t||(t=Promise))(function(i,o){function a(d){try{c(s.next(d))}catch(u){o(u)}}function l(d){try{c(s.throw(d))}catch(u){o(u)}}function c(d){d.done?i(d.value):n(d.value).then(a,l)}c((s=s.apply(r,e||[])).next())})};const nn={headers:yr},on={schema:"public"},an={autoRefreshToken:!0,persistSession:!0,detectSessionInUrl:!0,flowType:"implicit"},ln={};class cn{constructor(e,t,s){var n,i,o,a,l,c,d,u;if(this.supabaseUrl=e,this.supabaseKey=t,!e)throw new Error("supabaseUrl is required.");if(!t)throw new Error("supabaseKey is required.");const p=Cr(e);if(this.realtimeUrl=`${p}/realtime/v1`.replace(/^http/i,"ws"),this.authUrl=`${p}/auth/v1`,this.storageUrl=`${p}/storage/v1`,p.match(/(supabase\.co)|(supabase\.in)/)){const A=p.split(".");this.functionsUrl=`${A[0]}.functions.${A[1]}.${A[2]}`}else this.functionsUrl=`${p}/functions/v1`;const g=`sb-${new URL(this.authUrl).hostname.split(".")[0]}-auth-token`,_={db:on,realtime:ln,auth:Object.assign(Object.assign({},an),{storageKey:g}),global:nn},b=Ar(s??{},_);this.storageKey=(i=(n=b.auth)===null||n===void 0?void 0:n.storageKey)!==null&&i!==void 0?i:"",this.headers=(a=(o=b.global)===null||o===void 0?void 0:o.headers)!==null&&a!==void 0?a:{},this.auth=this._initSupabaseAuthClient((l=b.auth)!==null&&l!==void 0?l:{},this.headers,(c=b.global)===null||c===void 0?void 0:c.fetch),this.fetch=xr(t,this._getAccessToken.bind(this),(d=b.global)===null||d===void 0?void 0:d.fetch),this.realtime=this._initRealtimeClient(Object.assign({headers:this.headers},b.realtime)),this.rest=new As(`${p}/rest/v1`,{headers:this.headers,schema:(u=b.db)===null||u===void 0?void 0:u.schema,fetch:this.fetch}),this._listenForAuthEvents()}get functions(){return new ys(this.functionsUrl,{headers:this.headers,customFetch:this.fetch})}get storage(){return new gr(this.storageUrl,this.headers,this.fetch)}from(e){return this.rest.from(e)}rpc(e,t={},s){return this.rest.rpc(e,t,s)}channel(e,t={config:{}}){return this.realtime.channel(e,t)}getChannels(){return this.realtime.getChannels()}removeChannel(e){return this.realtime.removeChannel(e)}removeAllChannels(){return this.realtime.removeAllChannels()}_getAccessToken(){var e,t;return rn(this,void 0,void 0,function*(){const{data:s}=yield this.auth.getSession();return(t=(e=s.session)===null||e===void 0?void 0:e.access_token)!==null&&t!==void 0?t:null})}_initSupabaseAuthClient({autoRefreshToken:e,persistSession:t,detectSessionInUrl:s,storage:n,storageKey:i,flowType:o},a,l){const c={Authorization:`Bearer ${this.supabaseKey}`,apikey:`${this.supabaseKey}`};return new sn({url:this.authUrl,headers:Object.assign(Object.assign({},c),a),storageKey:i,autoRefreshToken:e,persistSession:t,detectSessionInUrl:s,storage:n,flowType:o,fetch:l})}_initRealtimeClient(e){return new ir(this.realtimeUrl,Object.assign(Object.assign({},e),{params:Object.assign({apikey:this.supabaseKey},e?.params)}))}_listenForAuthEvents(){return this.auth.onAuthStateChange((t,s)=>{this._handleTokenChanged(t,s?.access_token,"CLIENT")})}_handleTokenChanged(e,t,s){(e==="TOKEN_REFRESHED"||e==="SIGNED_IN")&&this.changedAccessToken!==t?(this.realtime.setAuth(t??null),this.changedAccessToken=t):e==="SIGNED_OUT"&&(this.realtime.setAuth(this.supabaseKey),s=="STORAGE"&&this.auth.signOut(),this.changedAccessToken=void 0)}}const dn=(r,e,t)=>new cn(r,e,t);let Dt=(r=21)=>crypto.getRandomValues(new Uint8Array(r)).reduce((e,t)=>(t&=63,t<36?e+=t.toString(36):t<62?e+=(t-26).toString(36).toUpperCase():t>62?e+="-":e+="_",e),"");function hn({title:r,titleId:e,...t},s){return v.createElement("svg",Object.assign({xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 20 20",fill:"currentColor","aria-hidden":"true",ref:s,"aria-labelledby":e},t),r?v.createElement("title",{id:e},r):null,v.createElement("path",{d:"M6.28 5.22a.75.75 0 00-1.06 1.06L8.94 10l-3.72 3.72a.75.75 0 101.06 1.06L10 11.06l3.72 3.72a.75.75 0 101.06-1.06L11.06 10l3.72-3.72a.75.75 0 00-1.06-1.06L10 8.94 6.28 5.22z"}))}const un=v.forwardRef(hn),fn=un,bt=os.docs.filter(({name:r,description:e})=>r&&!r.startsWith("_")&&!!e).sort((r,e)=>r.name.localeCompare(e.name));function pn(){return h.jsxs("div",{className:"flex h-full w-full pt-2 text-foreground overflow-hidden",children:[h.jsx("div",{className:"w-42 flex-none h-full overflow-y-auto overflow-x-hidden pr-4",children:bt.map((r,e)=>h.jsxs("a",{className:"cursor-pointer block hover:bg-lineHighlight py-1 px-4",href:`#doc-${e}`,children:[r.name," "]},e))}),h.jsx("div",{className:"break-normal w-full h-full overflow-auto pl-4 flex relative",children:h.jsxs("div",{className:"prose dark:prose-invert max-w-full pr-4",children:[h.jsx("h2",{children:"API Reference"}),h.jsx("p",{children:"This is the long list functions you can use! Remember that you don't need to remember all of those and that you can already make music with a small set of functions!"}),bt.map((r,e)=>h.jsxs("section",{children:[h.jsx("h3",{id:`doc-${e}`,children:r.name}),h.jsx("p",{dangerouslySetInnerHTML:{__html:r.description}}),r.examples?.map((t,s)=>h.jsx("pre",{children:t},s))]},e))]})})]})}function mn(){const[r,e]=v.useState([]);v.useEffect(()=>(as("",{dir:ls,recursive:!0}).then(a=>e([{name:"~/music",children:a}])).catch(a=>{console.log("error loadin files",a)}),()=>{}),[]);const t=v.useMemo(()=>r[r.length-1],[r]),s=v.useMemo(()=>r.slice(1).map(a=>a.name).join("/"),[r]),n=v.useMemo(()=>t?.children.filter(a=>!!a.children),[t]),i=v.useMemo(()=>t?.children.filter(a=>!a.children&&cs(a.name)),[t]),o=a=>e(l=>l.concat([a]));return h.jsxs("div",{className:"px-4 flex flex-col h-full",children:[h.jsx("div",{className:"flex justify-between font-mono pb-1",children:h.jsxs("div",{children:[h.jsx("span",{children:"samples('"}),r?.map((a,l)=>l<r.length-1?h.jsxs(v.Fragment,{children:[h.jsx("span",{className:"cursor-pointer underline",onClick:()=>e(c=>c.slice(0,l+1)),children:a.name}),h.jsx("span",{children:"/"})]},l):h.jsx("span",{className:"cursor-pointer underline",children:a.name},l)),h.jsx("span",{children:"')"})]})}),h.jsxs("div",{className:"overflow-auto",children:[!n?.length&&!i?.length&&h.jsx("span",{className:"text-gray-500",children:"Nothing here"}),n?.map((a,l)=>h.jsx("div",{className:"cursor-pointer",onClick:()=>o(a),children:a.name},l)),i?.map((a,l)=>h.jsx("div",{className:"text-gray-500 cursor-pointer select-none",onClick:async()=>ds(`${s}/${a.name}`),children:a.name},l))]})]})}const gn=window.__TAURI__;function _t({context:r}){const e=v.useRef(),[t,s]=v.useState([]),{activeFooter:n,isZen:i,panelPosition:o}=we();v.useLayoutEffect(()=>{e.current&&n==="console"&&(e.current.scrollTop=e.current?.scrollHeight)},[t,n]),v.useLayoutEffect(()=>{e.current&&(n==="console"?e.current.scrollTop=e.current?.scrollHeight:e.current.scrollTop=0)},[n]),vn(v.useCallback(d=>{const{message:u,type:p,data:y}=d.detail;s(g=>{const _=g.length?g[g.length-1]:void 0,b=Dt(12);if(p==="loaded-sample"){const A=g.findIndex(({data:{url:O},type:$})=>$==="load-sample"&&O===y.url);g[A]={message:u,type:p,id:b,data:y}}else _&&_.message===u?g=g.slice(0,-1).concat([{message:u,type:p,count:(_.count??1)+1,id:b,data:y}]):g=g.concat([{message:u,type:p,id:b,data:y}]);return g.slice(-20)})},[]));const a=({children:d,name:u,label:p})=>h.jsxs(h.Fragment,{children:[h.jsx("div",{onClick:()=>at(u),className:F("h-8 px-2 text-foreground cursor-pointer hover:opacity-50 flex items-center space-x-1 border-b",n===u?"border-foreground":"border-transparent"),children:p||u}),n===u&&h.jsx(h.Fragment,{children:d})]});if(i)return null;const l=n!=="";let c={right:F("max-w-full flex-grow-0 flex-none overflow-hidden",l?"w-[600px] h-full":"absolute right-0"),bottom:F("relative",l?"h-[360px] min-h-[360px]":"")};return h.jsxs("nav",{className:F("bg-lineHighlight z-[10] flex flex-col",c[o]),children:[h.jsxs("div",{className:"flex justify-between px-2",children:[h.jsxs("div",{className:F("flex select-none max-w-full overflow-auto",n&&"pb-2"),children:[h.jsx(a,{name:"intro",label:"welcome"}),h.jsx(a,{name:"sounds"}),h.jsx(a,{name:"console"}),h.jsx(a,{name:"reference"}),h.jsx(a,{name:"settings"}),gn&&h.jsx(a,{name:"files"})]}),n!==""&&h.jsx("button",{onClick:()=>at(""),className:"text-foreground px-2","aria-label":"Close Panel",children:h.jsx(fn,{className:"w-5 h-5"})})]}),n!==""&&h.jsx("div",{className:"relative overflow-hidden",children:h.jsxs("div",{className:"text-white overflow-auto h-full max-w-full",ref:e,children:[n==="intro"&&h.jsx(bn,{}),n==="console"&&h.jsx(_n,{log:t}),n==="sounds"&&h.jsx(xn,{}),n==="reference"&&h.jsx(pn,{}),n==="settings"&&h.jsx(kn,{scheduler:r.scheduler}),n==="files"&&h.jsx(mn,{})]})})]})}function vn(r){Ct(W.key,r)}function yn(r){var e,t,s,n;return t=/(\b(https?|ftp):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/gim,e=r.replace(t,'<a class="underline" href="$1" target="_blank">$1</a>'),s=/(^|[^\/])(www\.[\S]+(\b|$))/gim,e=e.replace(s,'$1<a class="underline" href="http://$2" target="_blank">$2</a>'),n=/(([a-zA-Z0-9\-\_\.])+@[a-zA-Z\_]+?(\.[a-zA-Z]{2,6})+)/gim,e=e.replace(n,'<a class="underline" href="mailto:$1">$1</a>'),e}function bn(){return h.jsxs("div",{className:"prose dark:prose-invert max-w-[600px] pt-2 font-sans pb-8 px-4",children:[h.jsxs("h3",{children:[h.jsx("span",{className:F("animate-spin inline-block select-none"),children:"🌀"})," welcome"]}),h.jsxs("p",{children:["You have found ",h.jsx("span",{className:"underline",children:"strudel"}),", a new live coding platform to write dynamic music pieces in the browser! It is free and open-source and made for beginners and experts alike. To get started:",h.jsx("br",{}),h.jsx("br",{}),h.jsx("span",{className:"underline",children:"1. hit play"})," - ",h.jsx("span",{className:"underline",children:"2. change something"})," -"," ",h.jsx("span",{className:"underline",children:"3. hit update"}),h.jsx("br",{}),"If you don't like what you hear, try ",h.jsx("span",{className:"underline",children:"shuffle"}),"!"]}),h.jsxs("p",{children:["To learn more about what this all means, check out the"," ",h.jsx("a",{href:"./workshop/getting-started",target:"_blank",children:"interactive tutorial"}),". Also feel free to join the"," ",h.jsx("a",{href:"https://discord.com/invite/HGEdXmRkzT",target:"_blank",children:"tidalcycles discord channel"})," ","to ask any questions, give feedback or just say hello."]}),h.jsx("h3",{children:"about"}),h.jsxs("p",{children:["strudel is a JavaScript version of"," ",h.jsx("a",{href:"https://tidalcycles.org/",target:"_blank",children:"tidalcycles"}),", which is a popular live coding language for music, written in Haskell. You can find the source code at"," ",h.jsx("a",{href:"https://github.com/tidalcycles/strudel",target:"_blank",children:"github"}),". Please consider to"," ",h.jsx("a",{href:"https://opencollective.com/tidalcycles",target:"_blank",children:"support this project"})," ","to ensure ongoing development 💖"]})]})}function _n({log:r}){return h.jsxs("div",{id:"console-tab",className:"break-all px-4 dark:text-white text-stone-900 text-sm",children:[h.jsx("pre",{children:`███████╗████████╗██████╗ ██╗   ██╗██████╗ ███████╗██╗     
██╔════╝╚══██╔══╝██╔══██╗██║   ██║██╔══██╗██╔════╝██║     
███████╗   ██║   ██████╔╝██║   ██║██║  ██║█████╗  ██║     
╚════██║   ██║   ██╔══██╗██║   ██║██║  ██║██╔══╝  ██║     
███████║   ██║   ██║  ██║╚██████╔╝██████╔╝███████╗███████╗
╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝╚══════╝`}),r.map((e,t)=>{const s=yn(e.message);return h.jsxs("div",{className:F(e.type==="error"&&"text-red-500",e.type==="highlight"&&"underline"),children:[h.jsx("span",{dangerouslySetInnerHTML:{__html:s}}),e.count?` (${e.count})`:""]},e.id)})]})}const wn=r=>Array.isArray(r)?r.length:typeof r=="object"?Object.values(r).length:1;function xn(){const r=Lt(es),{soundsFilter:e}=we(),t=v.useMemo(()=>{let n=Object.entries(r).filter(([i])=>!i.startsWith("_"));return r?e==="user"?n.filter(([i,{data:o}])=>!o.prebake):e==="drums"?n.filter(([i,{data:o}])=>o.type==="sample"&&o.tag==="drum-machines"):e==="samples"?n.filter(([i,{data:o}])=>o.type==="sample"&&o.tag!=="drum-machines"):e==="synths"?n.filter(([i,{data:o}])=>["synth","soundfont"].includes(o.type)):n:[]},[r,e]),s=v.useRef();return Ct("mouseup",()=>{const n=s.current;s.current=void 0,n?.then(i=>{i?.stop(be().currentTime+.01)})}),h.jsxs("div",{id:"sounds-tab",className:"flex flex-col w-full h-full dark:text-white text-stone-900",children:[h.jsx("div",{className:"px-2 pb-2 flex-none",children:h.jsx(Xe,{value:e,onChange:n=>q.setKey("soundsFilter",n),items:{samples:"samples",drums:"drum-machines",synths:"Synths",user:"User"}})}),h.jsxs("div",{className:"p-2 min-h-0 max-h-full grow overflow-auto font-mono text-sm break-normal",children:[t.map(([n,{data:i,onTrigger:o}])=>h.jsxs("span",{className:"cursor-pointer hover:opacity-50",onMouseDown:async()=>{const a=be(),l={note:["synth","soundfont"].includes(i.type)?"a3":void 0,s:n,clip:1,release:.5},c=a.currentTime+.05,d=()=>s.current?.node?.disconnect();s.current=Promise.resolve(o(c,l,d)),s.current.then(u=>{u?.node.connect(a.destination)})},children:[" ",n,i?.type==="sample"?`(${wn(i.samples)})`:"",i?.type==="soundfont"?`(${i.fonts.length})`:""]},n)),t.length?"":"No custom sounds loaded in this pattern (yet)."]})]})}function ze({label:r,value:e,onChange:t}){return h.jsxs("label",{children:[h.jsx("input",{type:"checkbox",checked:e,onChange:t})," "+r]})}function Xe({value:r,onChange:e,items:t}){return h.jsx("div",{className:"flex max-w-lg",children:Object.entries(t).map(([s,n],i,o)=>h.jsx("button",{onClick:()=>e(s),className:F("px-2 border-b h-8",r===s?"border-foreground":"border-transparent"),children:n.toLowerCase()},s))})}function wt({value:r,options:e,onChange:t}){return h.jsx("select",{className:"p-2 bg-background rounded-md text-foreground",value:r,onChange:s=>t(s.target.value),children:Object.entries(e).map(([s,n])=>h.jsx("option",{className:"bg-background",value:s,children:n},s))})}function Cn({value:r,onChange:e,step:t=1,...s}){return h.jsxs("div",{className:"flex space-x-2 gap-1",children:[h.jsx("input",{className:"p-2 grow",type:"range",value:r,step:t,onChange:n=>e(Number(n.target.value)),...s}),h.jsx("input",{type:"number",value:r,step:t,className:"w-16 bg-background rounded-md",onChange:n=>e(Number(n.target.value))})]})}function X({label:r,children:e}){return h.jsxs("div",{className:"grid gap-2",children:[h.jsx("label",{children:r}),e]})}const An=Object.fromEntries(Object.keys(He).map(r=>[r,r])),jn={monospace:"monospace",BigBlueTerminal:"BigBlueTerminal",x3270:"x3270",PressStart:"PressStart2P",galactico:"galactico","we-come-in-peace":"we-come-in-peace",FiraCode:"FiraCode","FiraCode-SemiBold":"FiraCode SemiBold",teletext:"teletext",mode7:"mode7"};function kn({scheduler:r}){const{theme:e,keybindings:t,isLineNumbersDisplayed:s,isAutoCompletionEnabled:n,isLineWrappingEnabled:i,fontSize:o,fontFamily:a,panelPosition:l}=we();return h.jsxs("div",{className:"text-foreground p-4 space-y-4",children:[h.jsx(X,{label:"Theme",children:h.jsx(wt,{options:An,value:e,onChange:c=>q.setKey("theme",c)})}),h.jsxs("div",{className:"grid grid-cols-1 md:grid-cols-2 gap-4",children:[h.jsx(X,{label:"Font Family",children:h.jsx(wt,{options:jn,value:a,onChange:c=>q.setKey("fontFamily",c)})}),h.jsx(X,{label:"Font Size",children:h.jsx(Cn,{value:o,onChange:c=>q.setKey("fontSize",c),min:10,max:40,step:2})})]}),h.jsx(X,{label:"Keybindings",children:h.jsx(Xe,{value:t,onChange:c=>q.setKey("keybindings",c),items:{codemirror:"Codemirror",vim:"Vim",emacs:"Emacs"}})}),h.jsx(X,{label:"Panel Position",children:h.jsx(Xe,{value:l,onChange:c=>q.setKey("panelPosition",c),items:{bottom:"Bottom",right:"Right"}})}),h.jsxs(X,{label:"Code Settings",children:[h.jsx(ze,{label:"Display line numbers",onChange:c=>q.setKey("isLineNumbersDisplayed",c.target.checked),value:s}),h.jsx(ze,{label:"Enable auto-completion",onChange:c=>q.setKey("isAutoCompletionEnabled",c.target.checked),value:n}),h.jsx(ze,{label:"Enable line wrapping",onChange:c=>q.setKey("isLineWrappingEnabled",c.target.checked),value:i})]}),h.jsx(X,{label:"Zen Mode",children:"Try clicking the logo in the top left!"}),h.jsx(X,{label:"Reset Settings",children:h.jsx("button",{className:"bg-background p-2 max-w-[300px] rounded-md hover:opacity-50",onClick:()=>{confirm("Sure?")&&q.set(Ut)},children:"restore default settings"})})]})}function En({title:r,titleId:e,...t},s){return v.createElement("svg",Object.assign({xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 20 20",fill:"currentColor","aria-hidden":"true",ref:s,"aria-labelledby":e},t),r?v.createElement("title",{id:e},r):null,v.createElement("path",{fillRule:"evenodd",d:"M9.664 1.319a.75.75 0 01.672 0 41.059 41.059 0 018.198 5.424.75.75 0 01-.254 1.285 31.372 31.372 0 00-7.86 3.83.75.75 0 01-.84 0 31.508 31.508 0 00-2.08-1.287V9.394c0-.244.116-.463.302-.592a35.504 35.504 0 013.305-2.033.75.75 0 00-.714-1.319 37 37 0 00-3.446 2.12A2.216 2.216 0 006 9.393v.38a31.293 31.293 0 00-4.28-1.746.75.75 0 01-.254-1.285 41.059 41.059 0 018.198-5.424zM6 11.459a29.848 29.848 0 00-2.455-1.158 41.029 41.029 0 00-.39 3.114.75.75 0 00.419.74c.528.256 1.046.53 1.554.82-.21.324-.455.63-.739.914a.75.75 0 101.06 1.06c.37-.369.69-.77.96-1.193a26.61 26.61 0 013.095 2.348.75.75 0 00.992 0 26.547 26.547 0 015.93-3.95.75.75 0 00.42-.739 41.053 41.053 0 00-.39-3.114 29.925 29.925 0 00-5.199 2.801 2.25 2.25 0 01-2.514 0c-.41-.275-.826-.541-1.25-.797a6.985 6.985 0 01-1.084 3.45 26.503 26.503 0 00-1.281-.78A5.487 5.487 0 006 12v-.54z",clipRule:"evenodd"}))}const Tn=v.forwardRef(En),Sn=Tn;function Fn({title:r,titleId:e,...t},s){return v.createElement("svg",Object.assign({xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 20 20",fill:"currentColor","aria-hidden":"true",ref:s,"aria-labelledby":e},t),r?v.createElement("title",{id:e},r):null,v.createElement("path",{fillRule:"evenodd",d:"M15.312 11.424a5.5 5.5 0 01-9.201 2.466l-.312-.311h2.433a.75.75 0 000-1.5H3.989a.75.75 0 00-.75.75v4.242a.75.75 0 001.5 0v-2.43l.31.31a7 7 0 0011.712-3.138.75.75 0 00-1.449-.39zm1.23-3.723a.75.75 0 00.219-.53V2.929a.75.75 0 00-1.5 0V5.36l-.31-.31A7 7 0 003.239 8.188a.75.75 0 101.448.389A5.5 5.5 0 0113.89 6.11l.311.31h-2.432a.75.75 0 000 1.5h4.243a.75.75 0 00.53-.219z",clipRule:"evenodd"}))}const On=v.forwardRef(Fn),Rn=On;function Bn({title:r,titleId:e,...t},s){return v.createElement("svg",Object.assign({xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 20 20",fill:"currentColor","aria-hidden":"true",ref:s,"aria-labelledby":e},t),r?v.createElement("title",{id:e},r):null,v.createElement("path",{d:"M12.232 4.232a2.5 2.5 0 013.536 3.536l-1.225 1.224a.75.75 0 001.061 1.06l1.224-1.224a4 4 0 00-5.656-5.656l-3 3a4 4 0 00.225 5.865.75.75 0 00.977-1.138 2.5 2.5 0 01-.142-3.667l3-3z"}),v.createElement("path",{d:"M11.603 7.963a.75.75 0 00-.977 1.138 2.5 2.5 0 01.142 3.667l-3 3a2.5 2.5 0 01-3.536-3.536l1.225-1.224a.75.75 0 00-1.061-1.06l-1.224 1.224a4 4 0 105.656 5.656l3-3a4 4 0 00-.225-5.865z"}))}const Dn=v.forwardRef(Bn),$n=Dn;function Pn({title:r,titleId:e,...t},s){return v.createElement("svg",Object.assign({xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 20 20",fill:"currentColor","aria-hidden":"true",ref:s,"aria-labelledby":e},t),r?v.createElement("title",{id:e},r):null,v.createElement("path",{fillRule:"evenodd",d:"M2 10a8 8 0 1116 0 8 8 0 01-16 0zm6.39-2.908a.75.75 0 01.766.027l3.5 2.25a.75.75 0 010 1.262l-3.5 2.25A.75.75 0 018 12.25v-4.5a.75.75 0 01.39-.658z",clipRule:"evenodd"}))}const In=v.forwardRef(Pn),$t=In;function Nn({title:r,titleId:e,...t},s){return v.createElement("svg",Object.assign({xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 20 20",fill:"currentColor","aria-hidden":"true",ref:s,"aria-labelledby":e},t),r?v.createElement("title",{id:e},r):null,v.createElement("path",{d:"M15.98 1.804a1 1 0 00-1.96 0l-.24 1.192a1 1 0 01-.784.785l-1.192.238a1 1 0 000 1.962l1.192.238a1 1 0 01.785.785l.238 1.192a1 1 0 001.962 0l.238-1.192a1 1 0 01.785-.785l1.192-.238a1 1 0 000-1.962l-1.192-.238a1 1 0 01-.785-.785l-.238-1.192zM6.949 5.684a1 1 0 00-1.898 0l-.683 2.051a1 1 0 01-.633.633l-2.051.683a1 1 0 000 1.898l2.051.684a1 1 0 01.633.632l.683 2.051a1 1 0 001.898 0l.683-2.051a1 1 0 01.633-.633l2.051-.683a1 1 0 000-1.898l-2.051-.683a1 1 0 01-.633-.633L6.95 5.684zM13.949 13.684a1 1 0 00-1.898 0l-.184.551a1 1 0 01-.632.633l-.551.183a1 1 0 000 1.898l.551.183a1 1 0 01.633.633l.183.551a1 1 0 001.898 0l.184-.551a1 1 0 01.632-.633l.551-.183a1 1 0 000-1.898l-.551-.184a1 1 0 01-.633-.632l-.183-.551z"}))}const Ln=v.forwardRef(Nn),Un=Ln;function Gn({title:r,titleId:e,...t},s){return v.createElement("svg",Object.assign({xmlns:"http://www.w3.org/2000/svg",viewBox:"0 0 20 20",fill:"currentColor","aria-hidden":"true",ref:s,"aria-labelledby":e},t),r?v.createElement("title",{id:e},r):null,v.createElement("path",{fillRule:"evenodd",d:"M2 10a8 8 0 1116 0 8 8 0 01-16 0zm5-2.25A.75.75 0 017.75 7h4.5a.75.75 0 01.75.75v4.5a.75.75 0 01-.75.75h-4.5a.75.75 0 01-.75-.75v-4.5z",clipRule:"evenodd"}))}const Mn=v.forwardRef(Gn),qn=Mn;function zn({context:r}){const{embedded:e,started:t,pending:s,isDirty:n,lastShared:i,activeCode:o,handleTogglePlay:a,handleUpdate:l,handleShuffle:c,handleShare:d}=r,u=e||window.location!==window.parent.location,{isZen:p}=we();return h.jsxs("header",{id:"header",className:F("flex-none text-black  z-[100] text-lg select-none",!p&&!u&&"bg-lineHighlight",p?"h-12 w-8 fixed top-0 left-0":"sticky top-0 w-full py-1 justify-between",u?"flex":"md:flex"),children:[h.jsx("div",{className:"px-4 flex space-x-2 md:pt-0 select-none",children:h.jsxs("h1",{onClick:()=>{u&&window.open(window.location.href.replace("embed",""))},className:F(u?"text-l cursor-pointer":"text-xl","text-foreground font-bold flex space-x-2 items-center"),children:[h.jsx("div",{className:F("mt-[1px]",t&&"animate-spin","cursor-pointer"),onClick:()=>{u||Gt(!p)},children:"🌀"}),!p&&h.jsxs("div",{className:F(t&&"animate-pulse"),children:[h.jsx("span",{className:"",children:"strudel"})," ",h.jsx("span",{className:"text-sm",children:"REPL"})]})]})}),!p&&h.jsxs("div",{className:"flex max-w-full overflow-auto text-foreground",children:[h.jsx("button",{onClick:a,title:t?"stop":"play",className:F(u?"px-2":"p-2","hover:opacity-50",!t&&"animate-pulse"),children:s?h.jsx(h.Fragment,{children:"loading..."}):h.jsxs("span",{className:F("flex items-center space-x-1",u?"":"w-16"),children:[t?h.jsx(qn,{className:"w-6 h-6"}):h.jsx($t,{className:"w-6 h-6"}),!u&&h.jsx("span",{children:t?"stop":"play"})]})}),h.jsxs("button",{onClick:l,title:"update",className:F("flex items-center space-x-1",u?"px-2":"p-2",!n||!o?"opacity-50":"hover:opacity-50"),children:[h.jsx(Rn,{className:"w-6 h-6"}),!u&&h.jsx("span",{children:"update"})]}),!u&&h.jsxs("button",{title:"shuffle",className:"hover:opacity-50 p-2 flex items-center space-x-1",onClick:c,children:[h.jsx(Un,{className:"w-6 h-6"}),h.jsx("span",{children:" shuffle"})]}),!u&&h.jsxs("button",{title:"share",className:F("cursor-pointer hover:opacity-50 flex items-center space-x-1",u?"px-2":"p-2"),onClick:d,children:[h.jsx($n,{className:"w-6 h-6"}),h.jsxs("span",{children:["share",i&&i===(o||code)?"d!":""]})]}),!u&&h.jsxs("a",{title:"learn",href:"./workshop/getting-started",className:F("hover:opacity-50 flex items-center space-x-1",u?"px-2":"p-2"),children:[h.jsx(Sn,{className:"w-6 h-6"}),h.jsx("span",{children:"learn"})]})]})]})}const Hn=`// Koji Kondo - Swimming (Super Mario World)
stack(
  seq(
    "~",
    "~",
    "~",
    "A5 [F5@2 C5] [D5@2 F5] F5",
    "[C5@2 F5] [F5@2 C6] A5 G5",
    "A5 [F5@2 C5] [D5@2 F5] F5",
    "[C5@2 F5] [Bb5 A5 G5] F5@2",
    "A5 [F5@2 C5] [D5@2 F5] F5",
    "[C5@2 F5] [F5@2 C6] A5 G5",
    "A5 [F5@2 C5] [D5@2 F5] F5",
    "[C5@2 F5] [Bb5 A5 G5] F5@2",
    "A5 [F5@2 C5] A5 F5",
    "Ab5 [F5@2 Ab5] G5@2",
    "A5 [F5@2 C5] A5 F5",
    "Ab5 [F5@2 C5] C6@2",
    "A5 [F5@2 C5] [D5@2 F5] F5",
    "[C5@2 F5] [Bb5 A5 G5] F5@2"
  ).color('#FFEBB5'),
  seq(
    "[F4,Bb4,D5] [[D4,G4,Bb4]@2 [Bb3,D4,F4]] [[G3,C4,E4]@2 [[Ab3,F4] [A3,Gb4]]] [Bb3,E4,G4]",
    "[~ [F3, A3, C3] [F3, A3, C3]] [~ [F3, A3, C3] [F3, A3, C3]] [~ [F3, Bb3, D3] [F3, Bb3, D3]] [~ [F3, Bb3, Db3] [F3, Bb3, Db3]]",
    "[~ [F3, A3, C3] [F3, A3, C3]] [~ [F3, A3, C3] [F3, A3, C3]] [~ [F3, Bb3, D3] [F3, Bb3, D3]] [~ [F3, B3, D3] [F3, B3, D3]]",
    "[~ [F3, A3, C3] [F3, A3, C3]] [~ [F3, A3, C3] [F3, A3, C3]] [~ [F3, Bb3, D3] [F3, Bb3, D3]] [~ [F3, B3, D3] [F3, B3, D3]]",
    "[~ [A3, C4, E4] [A3, C4, E4]] [~ [Ab3, C4, Eb4] [Ab3, C4, Eb4]] [~ [F3, Bb3, D3] [F3, Bb3, D3]] [~ [G3, C4, E4] [G3, C4, E4]]",
    "[~ [F3, A3, C4] [F3, A3, C4]] [~ [F3, A3, C4] [F3, A3, C4]] [~ [F3, Bb3, D3] [F3, Bb3, D3]] [~ [F3, B3, D3] [F3, B3, D3]]",
    "[~ [F3, Bb3, D4] [F3, Bb3, D4]] [~ [F3, Bb3, C4] [F3, Bb3, C4]] [~ [F3, A3, C4] [F3, A3, C4]] [~ [F3, A3, C4] [F3, A3, C4]]",
    "[~ [F3, A3, C3] [F3, A3, C3]] [~ [F3, A3, C3] [F3, A3, C3]] [~ [F3, Bb3, D3] [F3, Bb3, D3]] [~ [F3, B3, D3] [F3, B3, D3]]",
    "[~ [A3, C4, E4] [A3, C4, E4]] [~ [Ab3, C4, Eb4] [Ab3, C4, Eb4]] [~ [F3, Bb3, D3] [F3, Bb3, D3]] [~ [G3, C4, E4] [G3, C4, E4]]",
    "[~ [F3, A3, C3] [F3, A3, C3]] [~ [F3, A3, C3] [F3, A3, C3]] [~ [F3, Bb3, D3] [F3, Bb3, D3]] [~ [F3, B3, D3] [F3, B3, D3]]",
    "[~ [F3, Bb3, D4] [F3, Bb3, D4]] [~ [F3, Bb3, C4] [F3, Bb3, C4]] [~ [F3, A3, C4] [F3, A3, C4]] [~ [F3, A3, C4] [F3, A3, C4]]",
    "[~ [Bb3, D3, F4] [Bb3, D3, F4]] [~ [Bb3, D3, F4] [Bb3, D3, F4]] [~ [A3, C4, F4] [A3, C4, F4]] [~ [A3, C4, F4] [A3, C4, F4]]",
    "[~ [Ab3, B3, F4] [Ab3, B3, F4]] [~ [Ab3, B3, F4] [Ab3, B3, F4]] [~ [G3, Bb3, F4] [G3, Bb3, F4]] [~ [G3, Bb3, E4] [G3, Bb3, E4]]",
    "[~ [Bb3, D3, F4] [Bb3, D3, F4]] [~ [Bb3, D3, F4] [Bb3, D3, F4]] [~ [A3, C4, F4] [A3, C4, F4]] [~ [A3, C4, F4] [A3, C4, F4]]",
    "[~ [Ab3, B3, F4] [Ab3, B3, F4]] [~ [Ab3, B3, F4] [Ab3, B3, F4]] [~ [G3, Bb3, F4] [G3, Bb3, F4]] [~ [G3, Bb3, E4] [G3, Bb3, E4]]",
    "[~ [F3, A3, C3] [F3, A3, C3]] [~ [F3, A3, C3] [F3, A3, C3]] [~ [F3, Bb3, D3] [F3, Bb3, D3]] [~ [F3, B3, D3] [F3, B3, D3]]",
    "[~ [F3, Bb3, D4] [F3, Bb3, D4]] [~ [F3, Bb3, C4] [F3, Bb3, C4]] [~ [F3, A3, C4] [F3, A3, C4]] [~ [F3, A3, C4] [F3, A3, C4]]"
  ).color('#54C571'),
  seq(
    "[G3 G3 C3 E3]",
    "[F2 D2 G2 C2]",
    "[F2 D2 G2 C2]",
    "[F2 A2 Bb2 B2]",
    "[A2 Ab2 G2 C2]",
    "[F2 A2 Bb2 B2]",
    "[G2 C2 F2 F2]",
    "[F2 A2 Bb2 B2]",
    "[A2 Ab2 G2 C2]",
    "[F2 A2 Bb2 B2]",
    "[G2 C2 F2 F2]",
    "[Bb2 Bb2 A2 A2]",
    "[Ab2 Ab2 G2 [C2 D2 E2]]",
    "[Bb2 Bb2 A2 A2]",
    "[Ab2 Ab2 G2 [C2 D2 E2]]",
    "[F2 A2 Bb2 B2]",
    "[G2 C2 F2 F2]"
  ).color('#0077C9')
).note().slow(51)
//.pianoroll({fold:1})
`,Jn=`// John Coltrane - Giant Steps

let melody = note(
  "[F#5 D5] [B4 G4] Bb4 [B4 A4]",
  "[D5 Bb4] [G4 Eb4] F#4 [G4 F4]",
  "Bb4 [B4 A4] D5 [D#5 C#5]",
  "F#5 [G5 F5] Bb5 [F#5 F#5]",
)

stack(
  // melody
  melody.color('#F8E71C'),
  // chords
  chord(
    "[B^7 D7] [G^7 Bb7] Eb^7 [Am7 D7]",
    "[G^7 Bb7] [Eb^7 F#7] B^7 [Fm7 Bb7]",
    "Eb^7 [Am7 D7] G^7 [C#m7 F#7]",
    "B^7 [Fm7 Bb7] Eb^7 [C#m7 F#7]"
  ).dict('lefthand')
  .anchor(melody).mode('duck')
  .voicing().color('#7ED321'),
  // bass
  note(
    "[B2 D2] [G2 Bb2] [Eb2 Bb3] [A2 D2]",
    "[G2 Bb2] [Eb2 F#2] [B2 F#2] [F2 Bb2]",
    "[Eb2 Bb2] [A2 D2] [G2 D2] [C#2 F#2]",
    "[B2 F#2] [F2 Bb2] [Eb2 Bb3] [C#2 F#2]"
  ).color('#00B8D4')
).slow(20)
.pianoroll({fold:1})`,Kn=`// Koji Kondo - Princess Zelda's Rescue
stack(
  // melody
  \`[B3@2 D4] [A3@2 [G3 A3]] [B3@2 D4] [A3] 
  [B3@2 D4] [A4@2 G4] [D4@2 [C4 B3]] [A3]
  [B3@2 D4] [A3@2 [G3 A3]] [B3@2 D4] [A3]
  [B3@2 D4] [A4@2 G4] D5@2 
  [D5@2 [C5 B4]] [[C5 B4] G4@2] [C5@2 [B4 A4]] [[B4 A4] E4@2]
  [D5@2 [C5 B4]] [[C5 B4] G4 C5] [G5] [~ ~ B3]\`
  .color('#9C7C38'),
  // bass
  \`[[C2 G2] E3@2] [[C2 G2] F#3@2] [[C2 G2] E3@2] [[C2 G2] F#3@2]
  [[B1 D3] G3@2] [[Bb1 Db3] G3@2] [[A1 C3] G3@2] [[D2 C3] F#3@2]
  [[C2 G2] E3@2] [[C2 G2] F#3@2] [[C2 G2] E3@2] [[C2 G2] F#3@2]
  [[B1 D3] G3@2] [[Bb1 Db3] G3@2] [[A1 C3] G3@2] [[D2 C3] F#3@2]
  [[F2 C3] E3@2] [[E2 B2] D3@2] [[D2 A2] C3@2] [[C2 G2] B2@2]
  [[F2 C3] E3@2] [[E2 B2] D3@2] [[Eb2 Bb2] Db3@2] [[D2 A2] C3 [F3,G2]]\`
  .color('#4C4646')
).transpose(12).slow(48)
  .superimpose(x=>x.add(0.06)) // add slightly detuned voice
  .note()
  .gain(.1)
  .s('triangle')
  .room(1)
  //.pianoroll({fold:1})`,Vn=`// "Caverave"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

const keys = x => x.s('sawtooth').cutoff(1200).gain(.5)
  .attack(0).decay(.16).sustain(.3).release(.1);

const drums = stack(
  s("bd*2").mask("<x@7 ~>/8").gain(.8),
  s("~ <sd!7 [sd@3 ~]>").mask("<x@7 ~>/4").gain(.5),
  s("[~ hh]*2").delay(.3).delayfeedback(.5).delaytime(.125).gain(.4)
);

const synths = stack(
  
  "<eb4 d4 c4 b3>/2"
  .scale("<C:minor!3 C:melodic:minor>/2")
  .struct("[~ x]*2")
  .layer(
    x=>x.scaleTranspose(0).early(0),
    x=>x.scaleTranspose(2).early(1/8),
    x=>x.scaleTranspose(7).early(1/4),
    x=>x.scaleTranspose(8).early(3/8)
  ).note().apply(keys).mask("<~ x>/16")
  .color('darkseagreen'),
  
  note("<C2 Bb1 Ab1 [G1 [G2 G1]]>/2")
  .struct("[x [~ x] <[~ [~ x]]!3 [x x]>@2]/2".fast(2))
  .s('sawtooth').attack(0.001).decay(0.2).sustain(1).cutoff(500)
  .color('brown'),
  chord("<Cm7 Bb7 Fm7 G7b13>/2")
  .struct("~ [x@0.2 ~]".fast(2))
  .dict('lefthand').voicing()
  .every(2, early(1/8))
  .apply(keys).sustain(0)
  .delay(.4).delaytime(.12)
  .mask("<x@7 ~>/8".early(1/4))
).add(note("<-1 0>/8"))
stack(
  drums.fast(2).color('tomato'), 
  synths
).slow(2)
  //.pianoroll({fold:1})`,Wn=`samples({
  bd: 'bd/BT0A0D0.wav',
  sn: 'sn/ST0T0S3.wav',
  hh: 'hh/000_hh3closedhh.wav'
}, 'https://loophole-letters.vercel.app/samples/tidal/')

stack(
  "<bd!3 bd(3,4,3)>".color('#F5A623'),
  "hh*4".color('#673AB7'),
  "~ <sn!3 sn(3,4,2)>".color('#4CAF50')
).s()
.pianoroll({fold:1})
`,Yn=`// adapted from a Barry Harris excercise
"0,2,[7 6]"
  .add("<0 1 2 3 4 5 7 8>")
  .scale('C bebop major')
  .transpose("<0 1 2 1>/8")
  .slow(2)
  .note().piano()
  .color('#00B8D4')
`,Xn=`// "Blippy Rhodes"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

samples({
  bd: 'samples/tidal/bd/BT0A0D0.wav',
  sn: 'samples/tidal/sn/ST0T0S3.wav',
  hh: 'samples/tidal/hh/000_hh3closedhh.wav',
  rhodes: {
  E1: 'samples/rhodes/MK2Md2000.mp3',
  E2: 'samples/rhodes/MK2Md2012.mp3',
  E3: 'samples/rhodes/MK2Md2024.mp3',
  E4: 'samples/rhodes/MK2Md2036.mp3',
  E5: 'samples/rhodes/MK2Md2048.mp3',
  E6: 'samples/rhodes/MK2Md2060.mp3',
  E7: 'samples/rhodes/MK2Md2072.mp3'
  }
}, 'https://loophole-letters.vercel.app/')

stack(
  s("<bd sn> <hh hh*2 hh*3>").color('#00B8D4'),
  "<g4 c5 a4 [ab4 <eb5 f5>]>"
  .scale("<C:major C:mixolydian F:lydian [F:minor <Db:major Db:mixolydian>]>")
  .struct("x*8")
  .scaleTranspose("0 [-5,-2] -7 [-9,-2]")
  .slow(2)
  .note()
  .clip(.3)
  .s('rhodes')
  .room(.5)
  .delay(.3)
  .delayfeedback(.4)
  .delaytime(1/12).gain(.5).color('#7ED321'),
  "<c2 c3 f2 [[F2 C2] db2]>/2"
  .add("0,.02")
  .note().gain(.3)
  .clip("<1@3 [.3 1]>/2")
  .cutoff(600)
  .lpa(.2).lpenv(-4)
  .s('sawtooth').color('#F8E71C'),
).fast(3/2)
//.pianoroll({fold:1})`,Zn=`// "Wavy kalimba"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

samples({
  'kalimba': { c5:'https://freesound.org/data/previews/536/536549_11935698-lq.mp3' }
})
const scales = "<C:major C:mixolydian F:lydian [F:minor Db:major]>"

stack(
  "[0 2 4 6 9 2 0 -2]*3"
  .add("<0 2>/4")
  .scale(scales)
  .struct("x*8")
  .velocity("<.8 .3 .6>*8")
  .slow(2),
  "<c2 c2 f2 [[F2 C2] db2]>"
  .scale(scales)
  .scaleTranspose("[0 <2 4>]*2")
  .struct("x*4")
  .velocity("<.8 .5>*4")
  .velocity(0.8)
  .slow(2)
)
  .fast(1)
  .note()
  .clip("<.4 .8 1 1.2 1.4 1.6 1.8 2>/8")
  .s('kalimba')
  .delay(.2)`,Qn=`// "Festival of fingers"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

const chords = "<Cm7 Fm7 G7 F#7>";
stack(
  chord(chords).dict('lefthand').voicing().struct("x(3,8,-1)")
  .velocity(.5).off(1/7,x=>x.add(note(12)).velocity(.2)),
  
  chords.rootNotes(2).struct("x(4,8,-2)").note(),
  
  chords.rootNotes(4)
  .scale(cat('C minor','F dorian','G dorian','F# mixolydian'))
  .struct("x(3,8,-2)".fast(2))
  .scaleTranspose("0 4 0 6".early(".125 .5")).layer(scaleTranspose("0,<2 [4,6] [5,7]>/4"))
  .note()
  
).slow(2)
 .velocity(sine.struct("x*8").add(3/5).mul(2/5).fast(8))
 .piano()`,ei=`// "Underground plumber"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos
// @details inspired by Friendship - Let's not talk about it (1979) :)

samples({ bd: 'bd/BT0A0D0.wav', sn: 'sn/ST0T0S3.wav', hh: 'hh/000_hh3closedhh.wav', cp: 'cp/HANDCLP0.wav',
}, 'https://loophole-letters.vercel.app/samples/tidal/')

const h = x=>x.transpose("<0@2 5 0 7 5 0 -5>/2")

stack(
  s("<<bd*2 bd> sn> hh").fast(2).gain(.7),
  "[c2 a1 bb1 ~] ~"
  .echo(2, 1/16, 1)
  .slow(2)
  .layer(h)
  .note().s('square')
  .clip(.4)
  .cutoff(400).decay(.12).sustain(0)
  ,
  "[g2,[c3 eb3]]".iter(4)
  .echoWith(4, 1/8, (x,n)=>x.transpose(n*12).velocity(Math.pow(.4,n)))
  .layer(h).note()
  .clip(.1)
)
  .fast(2/3)
  .pianoroll()`,ti=`// "Bridge is over"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos, bassline by BDP - The Bridge Is Over

samples({mad:'https://freesound.org/data/previews/22/22274_109943-lq.mp3'})
stack(
  stack(
  note("c3*2 [[c3@1.4 bb2] ab2] gb2*2 <[[gb2@1.4 ab2] bb2] gb2>")
    .gain(.8).clip("[.5 1]*2"),
  n("<0 1 2 3 4 3 2 1>")
    .clip(.5)
    .echoWith(8, 1/32, (x,i)=>x.add(n(i)).velocity(Math.pow(.7,i)))
    .scale('c4 whole tone')
    .echo(3, 1/8, .5)
  ).piano(),
  s("mad").slow(2)
).cpm(78).slow(4)
  .pianoroll()
`,si=`// "Good times"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

const scale = cat('C3 dorian','Bb2 major').slow(4);
stack(
  n("2*4".add(12)).off(1/8, add(2))
  .scale(scale)
  .fast(2)
  .add("<0 1 2 1>").hush(),
  "<0 1 2 3>(3,8,2)".off(1/4, add("2,4"))
  .n().scale(scale),
  n("<0 4>(5,8,-1)").scale(scale).sub(note(12))
)
  .velocity(".6 .7".fast(4))
  .add(note(4))
  .piano()
  .clip(2)
  .velocity(.8)
  .slow(2)
  .pianoroll()`,ri=`// "Echo piano"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

n("<0 2 [4 6](3,4,2) 3*2>").color('salmon')
.off(1/4, x=>x.add(2).color('green'))
.off(1/2, x=>x.add(6).color('steelblue'))
.scale('D minor')
.echo(4, 1/8, .5)
.clip(.5)
.piano()
.pianoroll()`,ni=`// Hirokazu Tanaka - World 1-1
stack(
  // melody
  note(\`<
  [e5 ~] [[d5@2 c5] [~@2 e5]] ~ [~ [c5@2 d5]] [e5 e5] [d5 c5] [e5 f5] [g5 a5]
  [~ c5] [c5 d5] [e5 [c5@2 c5]] [~ c5] [f5 e5] [c5 d5] [~ g6] [g6 ~]
  [e5 ~] [[d5@2 c5] [~@2 e5]] ~ [~ [c5@2 d5]] [e5 e5] [d5 c5] [a5 g5] [c6 [e5@2 d5]]
  [~ c5] [c5 d5] [e5 [c5@2 c5]] [~ c5] [f5 e5] [c5 d5] [~ [g6@2 ~] ~@2] [g5 ~] 
  [~ a5] [b5 c6] [b5@2 ~@2 g5] ~
  [f5 ~] [[g5@2 f5] ~] [[e5 ~] [f5 ~]] [[f#5 ~] [g5 ~]]
  [~ a5] [b5 c6] [b5@2 ~@2 g5] ~
  [eb6 d6] [~ c6] ~!2
  >\`)
  .clip(.95),
  // sub melody
  note(\`<
  [~ g4]!2 [~ ab4]!2 [~ a4]!2 [~ bb4]!2 
  [~ a4]!2 [~ g4]!2 [d4 e4] [f4 gb4] ~!2
  [~ g4]!2 [~ ab4]!2 [~ a4]!2 [~ bb4]!2 
  [~ a4]!2 [~ g4]!2 [d4 e4] [f4 gb4] ~!2
  [~ c5]!4 [~ a4]!2 [[c4 ~] [d4 ~]] [[eb4 ~] [e4 ~]]
  [~ c5]!4 [~ eb5]!2 [g4*2 [f4 ~]] [[e4 ~] [d4 ~]]
  >\`),
  // bass
  note(\`<
  c3!7 a3 f3!2
  e3!2 ~!4
  c3!7 a3 f3!2
  e3!2 ~!4
  f3!2 e3!2 d3!2 ~!2
  f3!2 e3!2 ab3!2 ~!2
  >\`)
  .clip(.5)
).fast(2)`,ii=`// "Random bells"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

samples({
  bell: { c6: 'https://freesound.org/data/previews/411/411089_5121236-lq.mp3' },
  bass: { d2: 'https://freesound.org/data/previews/608/608286_13074022-lq.mp3' }
})

stack(
  // bells
  "0".euclidLegato(3,8)
  .echo(3, 1/16, .5)
  .add(rand.range(0,12))
  .scale("D:minor:pentatonic").note()
  .velocity(rand.range(.5,1))
  .s('bell').gain(.6).delay(.2).delaytime(1/3).delayfeedback(.8),
  // bass
  note("<D2 A2 G2 F2>").euclidLegatoRot(6,8,4).s('bass').clip(1).gain(.8)
)
  .slow(6)
  .pianoroll({vertical:1})`,oi=`// "Waa2"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

note(
  "a4 [a3 c3] a3 c3"
  .sub("<7 12 5 12>".slow(2))
  .off(1/4,x=>x.add(7))
  .off(1/8,x=>x.add(12))
)
  .slow(2)
  .clip(sine.range(0.3, 2).slow(28))
  .s("sawtooth square".fast(2))
  .cutoff(cosine.range(500,4000).slow(16))
  .gain(.5)
  .room(.5)
  .lpa(.125).lpenv(-2).v("8:.125").fanchor(.25)`,ai=`// "Hyperpop"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

const lfo = cosine.slow(15);
const lfo2 = sine.slow(16);
const filter1 = x=>x.cutoff(lfo2.range(300,3000));
const filter2 = x=>x.hcutoff(lfo.range(1000,6000)).cutoff(4000)
const scales = cat('D3 major', 'G3 major').slow(8)

samples({
  bd: '344/344757_1676145-lq.mp3',
  sn: '387/387186_7255534-lq.mp3',
  hh: '561/561241_12517458-lq.mp3',
  hh2:'44/44944_236326-lq.mp3',
  hh3: '44/44944_236326-lq.mp3',
}, 'https://freesound.org/data/previews/')

stack(
  "-7 0 -7 7".struct("x(5,8,1)").fast(2).sub(7)
  .scale(scales)
  .note()
  .s("sawtooth,square")
  .gain(.3).attack(0.01).decay(0.1).sustain(.5)
  .apply(filter1)
  .lpa(.1).lpenv(2).ftype('24db')
  ,
  "~@3 [<2 3>,<4 5>]"
  .echo(4,1/16,.7)
  .scale(scales)
  .note()
  .s('square').gain(.7)
  .attack(0.01).decay(0.1).sustain(0)
  .apply(filter1),
  "6 4 2".add(14)
  .superimpose(sub("5"))
  .fast(1).euclidLegato(3,8)
  .mask("<1 0@7>")
  .fast(2)
  .echo(32, 1/8, .8)
  .scale(scales)
  .note()
  .s("sawtooth")
  .gain(sine.range(.1,.4).slow(8))
  .attack(.001).decay(.2).sustain(0)
  .apply(filter2)
).stack(
  stack(
    "bd <~@7 [~ bd]>".fast(2),
    "~ sn",
    "[~ hh3]*2"
  ).s().fast(2).gain(.7)
).slow(2)
// strudel disable-highlighting`,li=`// "Festival of fingers 3"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

n("[-7*3],0,2,6,[8 7]")
  .echoWith(
    4, // echo 4 times
    1/4, // 1/4s between echos
    (x,i)=>x
      .add(n(i*7)) // add octaves
      .gain(1/(i+1)) // reduce gain
      .clip(1/(i+1))
    )
  .velocity(perlin.range(.5,.9).slow(8))
  .stack(n("[22 25]*3")
         .clip(sine.range(.5,2).slow(8))
         .gain(sine.range(.4,.8).slow(5))
         .echo(4,1/12,.5))
  .scale("<D:dorian G:mixolydian C:dorian F:mixolydian>")
  .slow(2).piano()
//.pianoroll({maxMidi:160})`,ci=`// "Melting submarine"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

await samples('github:tidalcycles/Dirt-Samples/master/')
stack(
  s("bd:5,[~ <sd:1!3 sd:1(3,4,3)>],hh27(3,4,1)") // drums
  .speed(perlin.range(.7,.9)) // random sample speed variation
  //.hush()
  ,"<a1 b1*2 a1(3,8) e2>" // bassline
  .off(1/8,x=>x.add(12).degradeBy(.5)) // random octave jumps
  .add(perlin.range(0,.5)) // random pitch variation
  .superimpose(add(.05)) // add second, slightly detuned voice
  .note() // wrap in "note"
  .decay(.15).sustain(0) // make each note of equal length
  .s('sawtooth') // waveform
  .gain(.4) // turn down
  .cutoff(sine.slow(7).range(300,5000)) // automate cutoff
  .lpa(.1).lpenv(-2)
  //.hush()
  ,chord("<Am7!3 <Em7 E7b13 Em7 Ebm7b5>>")
  .dict('lefthand').voicing() // chords
  .add(note("0,.04")) // add second, slightly detuned voice
  .add(note(perlin.range(0,.5))) // random pitch variation
  .s('sawtooth') // waveform
  .gain(.16) // turn down
  .cutoff(500) // fixed cutoff
  .attack(1) // slowly fade in
  //.hush()
  ,"a4 c5 <e6 a6>".struct("x(5,8,-1)")
  .superimpose(x=>x.add(.04)) // add second, slightly detuned voice
  .add(perlin.range(0,.5)) // random pitch variation
  .note() // wrap in "note"
  .decay(.1).sustain(0) // make notes short
  .s('triangle') // waveform
  .degradeBy(perlin.range(0,.5)) // randomly controlled random removal :)
  .echoWith(4,.125,(x,n)=>x.gain(.15*1/(n+1))) // echo notes
  //.hush()
)
  .slow(3/2)`;/* 
export const outroMusic = `// "Outro music"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

samples({
  bd: ['bd/BT0AADA.wav','bd/BT0AAD0.wav','bd/BT0A0DA.wav','bd/BT0A0D3.wav','bd/BT0A0D0.wav','bd/BT0A0A7.wav'],
  sd: ['sd/rytm-01-classic.wav','sd/rytm-00-hard.wav'],
  hh: ['hh27/000_hh27closedhh.wav','hh/000_hh3closedhh.wav'],
  perc: ['perc/002_perc2.wav'],
}, 'github:tidalcycles/Dirt-Samples/master/');

chord("<C^7 Am7 Dm7 G7>*2").dict('lefthand').anchor("G4").voicing()
  .stack(n("0@6 [<1 2> <2 0> 1]@2").scale('C5 major'))
  .slow(4)
  .s("gm_epiano1:1")
  .color('steelblue')
  .stack(
   "<-7 ~@2 [~@2 -7] -9 ~@2 [~@2 -9] -10!2 ~ [~@2 -10] -5 ~ [-3 -2 -10]@2>*2"
    .scale('C3 major').note()
    .s('sawtooth').color('brown')
  )
  .attack(0.05).decay(.1).sustain(.7)
  .cutoff(perlin.range(800,2000))
  .gain(.3)
  .stack(
    s("<bd!3 [bd ~ bd]> sd,hh*3,~@5 <perc perc*3>")
    .speed(perlin.range(.9,1.1))
    .n(3).color('gray')
  ).slow(3/2)
  //.pianoroll({autorange:1,vertical:1,fold:0})
  `; 
*/const di=`// "Bass fuge"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

samples({ flbass: ['00_c2_finger_long_neck.wav','01_c2_finger_short_neck.wav','02_c2_finger_long_bridge.wav','03_c2_finger_short_bridge.wav','04_c2_pick_long.wav','05_c2_pick_short.wav','06_c2_palm_mute.wav'] }, 
  'github:cleary/samples-flbass/main/')
samples({
bd: ['bd/BT0AADA.wav','bd/BT0AAD0.wav','bd/BT0A0DA.wav','bd/BT0A0D3.wav','bd/BT0A0D0.wav','bd/BT0A0A7.wav'],
sd: ['sd/rytm-01-classic.wav','sd/rytm-00-hard.wav'],
hh: ['hh27/000_hh27closedhh.wav','hh/000_hh3closedhh.wav'],
}, 'github:tidalcycles/Dirt-Samples/master/');

note("<8(3,8) <7 7*2> [4 5@3] 8>".sub(1) // sub 1 -> 1-indexed
.layer(
x=>x,
x=>x.add(7).color('steelblue')
.off(1/8,x=>x.add("2,4").off(1/8,x=>x.add(5).echo(4,.125,.5)))
.slow(2),
).scale('A1 minor'))
.s("flbass").n(0)
.gain(.3)
.cutoff(sine.slow(7).range(200,4000))
.resonance(10)
//.hcutoff(400)
.clip(1)
.stack(s("bd:1*2,~ sd:0,[~ hh:0]*2"))
.pianoroll({vertical:1})`,hi=`// "Chop"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

samples({ p: 'https://cdn.freesound.org/previews/648/648433_11943129-lq.mp3' })

s("p")
  .loopAt(32)
  .chop(128)
  .jux(rev)
  .shape(.4)
  .decay(.1)
  .sustain(.6)
  `,ui=`// "Delay"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

stack(
    s("bd <sd cp>")
    .delay("<0 .5>")
    .delaytime(".16 | .33")
    .delayfeedback(".6 | .8")
  ).sometimes(x=>x.speed("-1"))`,fi=`// "Orbit"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

stack(
    s("bd <sd cp>")
    .delay(.5)
    .delaytime(.33)
    .delayfeedback(.6),
    s("hh*2")
    .delay(.8)
    .delaytime(.08)
    .delayfeedback(.7)
    .orbit(2)
  ).sometimes(x=>x.speed("-1"))`,pi=`// "Belldub"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

samples({ bell: {b4:'https://cdn.freesound.org/previews/339/339809_5121236-lq.mp3'}})
// "Hand Bells, B, Single.wav" by InspectorJ (www.jshaw.co.uk) of Freesound.org
stack(
  // bass
  note("[0 ~] [2 [0 2]] [4 4*2] [[4 ~] [2 ~] 0@2]".scale('g1 dorian').superimpose(x=>x.add(.02)))
  .s('sawtooth').cutoff(200).resonance(20).gain(.15).shape(.6).release(.05),
  // perc
  s("[~ hh]*4").room("0 0.5".fast(2)).end(perlin.range(0.02,1)),
  s("mt lt ht").struct("x(3,8)").fast(2).gain(.5).room(.5).sometimes(x=>x.speed(".5")),
  s("misc:2").speed(1).delay(.5).delaytime(1/3).gain(.4),
  // chords
  chord("[~ Gm7] ~ [~ Dm7] ~")
  .dict('lefthand').voicing()
  .add(note("0,.1"))
  .s('sawtooth').gain(.8)
  .cutoff(perlin.range(400,3000).slow(8))
  .decay(perlin.range(0.05,.2)).sustain(0)
  .delay(.9).room(1),
  // blips
  note(
    "0 5 4 2".iter(4)
    .off(1/3, add(7))
    .scale('g4 dorian')
  ).s('square').cutoff(2000).decay(.03).sustain(0)
  .degradeBy(.2)
  .orbit(2).delay(.2).delaytime(".33 | .6 | .166 | .25")
  .room(1).gain(.5).mask("<0 1>/8"),
  // bell
  note(rand.range(0,12).struct("x(5,8,-1)").scale('g2 minor pentatonic')).s('bell').begin(.05)
  .delay(.2).degradeBy(.4).gain(.4)
  .mask("<1 0>/8")
).slow(5)`,mi=`// "Dinofunk"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

samples({bass:'https://cdn.freesound.org/previews/614/614637_2434927-hq.mp3',
dino:{b4:'https://cdn.freesound.org/previews/316/316403_5123851-hq.mp3'}})
setVoicingRange('lefthand', ['c3','a4'])

stack(
s('bass').loopAt(8).clip(1),
s("bd*2, ~ sd,hh*4"),
chord("Abm7")
  .mode("below:G4")
  .dict('lefthand')
  .voicing()
  .struct("x(3,8,1)".slow(2)),
"0 1 2 3".scale('ab4 minor pentatonic')
.superimpose(x=>x.add(.1))
.sometimes(x=>x.add(12))
.note().s('sawtooth')
.cutoff(sine.range(400,2000).slow(16)).gain(.8)
.decay(perlin.range(.05,.2)).sustain(0)
.delay(sine.range(0,.5).slow(32))
.degradeBy(.4).room(1),
note("<b4 eb4>").s('dino').delay(.8).slow(8).room(.5)
)`,gi=`// "Sample demo"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

stack(
  // percussion
  s("[woodblock:1 woodblock:2*2] snare_rim:0,gong/8,brakedrum:1(3,8),~@3 cowbell:3")
  .sometimes(x=>x.speed(2)),
  // melody
  note("<0 4 1 3 2>".off(".25 | .125",add(2)).scale('D3 hirajoshi'))
  .s("clavisynth").gain(.2).delay(.25).jux(rev)
  .degradeBy(sine.range(0,.5).slow(32)),
  // bass
  note("<0@3 <2(3,8) 3(3,8)>>".scale('D1 hirajoshi'))
  .s('psaltery_pluck').gain(.6).clip(1)
  .release(.1).room(.5)
)`,vi=`// "Holy flute"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

"c3 eb3(3,8) c4/2 g3*2"
.superimpose(
  x=>x.slow(2).add(12),
  x=>x.slow(4).sub(5)
).add("<0 1>/16")
.note().s('ocarina_vib').clip(1)
.release(.1).room(1).gain(.2)
.color("salmon | orange | darkseagreen")
.pianoroll({fold:0,autorange:0,vertical:0,cycles:12,smear:0,minMidi:40})
`,yi=`// "Flatrave"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

stack(
  s("bd*2,~ [cp,sd]").bank('RolandTR909'),
  
  s("hh:1*4").sometimes(fast("2"))
  .rarely(x=>x.speed(".5").delay(.5))
  .end(perlin.range(0.02,.05).slow(8))
  .bank('RolandTR909').room(.5)
  .gain("0.4,0.4(5,8,-1)"),
  
  note("<0 2 5 3>".scale('G1 minor')).struct("x(5,8,-1)")
  .s('sawtooth').decay(.1).sustain(0)
  .lpa(.1).lpenv(-4).lpf(800).lpq(8),
  
  note("<G4 A4 Bb4 A4>,Bb3,D3").struct("~ x*2").s('square').clip(1)
  .cutoff(sine.range(500,4000).slow(16)).resonance(10)
  .decay(sine.slow(15).range(.05,.2)).sustain(0)
  .room(.5).gain(.3).delay(.2).mask("<0 1@3>/8"),
  
  "0 5 3 2".sometimes(slow(2)).off(1/8,add(5)).scale('G4 minor').note()
  .decay(.05).sustain(0).delay(.2).degradeBy(.5).mask("<0 1>/16")
)`,bi=`// "Amensister"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

await samples('github:tidalcycles/Dirt-Samples/master')

stack(
  // amen
  n("0 1 2 3 4 5 6 7")
  .sometimes(x=>x.ply(2))
  .rarely(x=>x.speed("2 | -2"))
  .sometimesBy(.4, x=>x.delay(".5"))
  .s("amencutup")
  .slow(2)
  .room(.5)
  ,
  // bass
  sine.add(saw.slow(4)).range(0,7).segment(8)
  .superimpose(x=>x.add(.1))
  .scale('G0 minor').note()
  .s("sawtooth")
  .gain(.4).decay(.1).sustain(0)
  .lpa(.1).lpenv(-4).lpq(10)
  .cutoff(perlin.range(300,3000).slow(8))
  .degradeBy("0 0.1 .5 .1")
  .rarely(add(note("12")))
  ,
  // chord
  note("Bb3,D4".superimpose(x=>x.add(.2)))
  .s('sawtooth').lpf(1000).struct("<~@3 [~ x]>")
  .decay(.05).sustain(.0).delay(.8).delaytime(.125).room(.8)
  ,
  // alien
  s("breath").room(1).shape(.6).chop(16).rev().mask("<x ~@7>")
  ,
  n("0 1").s("east").delay(.5).degradeBy(.8).speed(rand.range(.5,1.5))
).reset("<x@7 x(5,8,-1)>")`,_i=`// "Jux und tollerei"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

note("c3 eb3 g3 bb3").palindrome()
.s('sawtooth')
.jux(x=>x.rev().color('green').s('sawtooth'))
.off(1/4, x=>x.add(note("<7 12>/2")).slow(2).late(.005).s('triangle'))
.lpf(sine.range(200,2000).slow(8))
.lpa(.2).lpenv(-2)
.decay(.05).sustain(0)
.room(.6)
.delay(.5).delaytime(.1).delayfeedback(.4)
.pianoroll()`,wi=`// "CSound demo"
// @license with CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

await loadCsound\`
instr CoolSynth
    iduration = p3
    ifreq = p4
    igain = p5
    ioct = octcps(ifreq)

    kpwm = oscili(.05, 8)
    asig = vco2(igain, ifreq, 4, .5 + kpwm)
    asig += vco2(igain, ifreq * 2)

    idepth = 2
    acut = transegr:a(0, .005, 0, idepth, .06, -4.2, 0.001, .01, -4.2, 0) ; filter envelope
    asig = zdf_2pole(asig, cpsoct(ioct + acut + 2), 0.5)

    iattack = .01
    isustain = .5
    idecay = .1
    irelease = .1
    asig *= linsegr:a(0, iattack, 1, idecay, isustain, iduration, isustain, irelease, 0)
    
    out(asig, asig)
endin\`

"<0 2 [4 6](3,4,2) 3*2>"
.off(1/4, add(2))
.off(1/2, add(6))
.scale('D minor')
.note()
//.pianoroll()
.csound('CoolSynth')`,xi=`// "Lounge sponge"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos, livecode.orc by Steven Yi

await loadOrc('github:kunstmusik/csound-live-code/master/livecode.orc')

stack(
  chord("<C^7 A7 Dm7 Fm7>/2").dict('lefthand').voicing()
  .cutoff(sine.range(500,2000).round().slow(16))
  .euclidLegato(3,8).csound('FM1')
  ,
  note("<C2 A1 D2 F2>/2").ply(8).csound('Bass').gain("1 4 1 4")
  ,
  n("0 7 [4 3] 2".fast(2/3).off(".25 .125", add("<2 4 -3 -1>"))
  .slow(2).scale('A4 minor'))
  .clip(.25).csound('SynHarp')
  ,
  s("bd*2,[~ hh]*2,~ cp").bank('RolandTR909')
)`,Ci=`// "Arpoon"
// @license CC BY-NC-SA 4.0 https://creativecommons.org/licenses/by-nc-sa/4.0/
// @by Felix Roos

await samples('github:tidalcycles/Dirt-Samples/master')

n("[0,3] 2 [1,3] 2".fast(3).lastOf(4, fast(2))).clip(2)
  .offset("<<1 2> 2 1 1>")
  .chord("<<Am7 C^7> C7 F^7 [Fm7 E7b9]>")
  .dict('lefthand').voicing()
  .add(perlin.range(0,0.2).add("<-12 0>/8").note())
  .cutoff(perlin.range(500,4000)).resonance(12)
  .gain("<.5 .8>*16")
  .decay(.16).sustain(0.5)
  .delay(.2)
  .room(.5).pan(sine.range(.3,.6))
  .s('piano')
  .stack(
    "<<A1 C2>!2 F2 F2>"
    .add.out("0 -5".fast(2))
    .add("0,.12").note()
    .s('sawtooth').cutoff(180)
    .lpa(.1).lpenv(2)
  )
  .slow(4)
  .stack(s("bd*4, [~ [hh hh? hh?]]*2,~ [sd ~ [sd:2? bd?]]").bank('RolandTR909').gain(.5).slow(2))
`,Ai=Object.freeze(Object.defineProperty({__proto__:null,amensister:bi,arpoon:Ci,barryHarris:Yn,bassFuge:di,belldub:pi,blippyRhodes:Xn,bridgeIsOver:ti,caverave:Vn,chop:hi,csoundDemo:wi,delay:ui,dinofunk:mi,echoPiano:ri,festivalOfFingers:Qn,festivalOfFingers3:li,flatrave:yi,giantSteps:Jn,goodTimes:si,holyflute:vi,hyperpop:ai,juxUndTollerei:_i,loungeSponge:xi,meltingsubmarine:ci,orbit:fi,randomBells:ii,sampleDemo:gi,sampleDrums:Wn,sml1:ni,swimming:Hn,undergroundPlumber:ei,waa2:oi,wavyKalimba:Zn,zeldasRescue:Kn},Symbol.toStringTag,{value:"Module"}));function ji({active:r}){return h.jsx("div",{className:"overflow-hidden opacity-50 fixed top-0 left-0 w-full z-[1000]",children:h.jsx("div",{className:F("h-[2px] block w-full",r?"bg-foreground animate-train":"bg-transparent"),children:h.jsx("div",{})})})}function ki(r){const e=new TextEncoder().encode(r);return btoa(String.fromCharCode(...e))}function Ei(r){const e=new Uint8Array(atob(r).split("").map(s=>s.charCodeAt(0)));return new TextDecoder().decode(e)}function Ti(r){return encodeURIComponent(ki(r))}function Si(r){return Ei(decodeURIComponent(r))}var Fi=Object.defineProperty,Oi=(r,e)=>{for(var t in e)Fi(r,t,{get:e[t],enumerable:!0})},Ri={};Oi(Ri,{convertFileSrc:()=>$i,invoke:()=>Di,transformCallback:()=>Ze});function Bi(){return window.crypto.getRandomValues(new Uint32Array(1))[0]}function Ze(r,e=!1){let t=Bi(),s=`_${t}`;return Object.defineProperty(window,s,{value:n=>(e&&Reflect.deleteProperty(window,s),r?.(n)),writable:!1,configurable:!0}),t}async function Di(r,e={}){return new Promise((t,s)=>{let n=Ze(o=>{t(o),Reflect.deleteProperty(window,`_${i}`)},!0),i=Ze(o=>{s(o),Reflect.deleteProperty(window,`_${n}`)},!0);window.__TAURI_IPC__({cmd:r,callback:n,error:i,...e})})}function $i(r,e="asset"){let t=encodeURIComponent(r);return navigator.userAgent.includes("Windows")?`https://${e}.localhost/${t}`:`${e}://localhost/${t}`}const Pi=()=>window.__TAURI_IPC__!=null;function Ii(r){const[e,t]=v.useState([]);return v.useEffect(()=>{r&&Vt(r,e)},[r,e]),{widgets:e,setWidgets:t}}const{latestCode:xt}=q.get();ts();const Pt=dn("https://pidxdsxphlhzjnzmifth.supabase.co","eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBpZHhkc3hwaGxoempuem1pZnRoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTYyMzA1NTYsImV4cCI6MTk3MTgwNjU1Nn0.bqlw7802fsWRnqU5BLYtmXk_k-D1VFmbkHMywWc15NM");let me=[B(()=>import("./index.a2044bc2.js").then(r=>r.A),["_astro/index.a2044bc2.js","_astro/index.3d4af9ee.js"]),B(()=>import("./index.a960f6ae.js"),["_astro/index.a960f6ae.js","_astro/index.a2044bc2.js","_astro/index.3d4af9ee.js"]),B(()=>import("./index.892731de.js"),["_astro/index.892731de.js","_astro/mini.03263755.js","_astro/index.a2044bc2.js","_astro/index.3d4af9ee.js"]),B(()=>import("./index.07c6f9df.js"),["_astro/index.07c6f9df.js","_astro/index.a2044bc2.js","_astro/index.3d4af9ee.js"]),B(()=>import("./index.8fd64fa4.js"),["_astro/index.8fd64fa4.js","_astro/scope.f68c2f6d.js","_astro/index.a2044bc2.js","_astro/index.3d4af9ee.js","_astro/prebake.5a610a01.js","_astro/settings.270953c1.js"]),B(()=>import("./index.539d1285.js"),["_astro/index.539d1285.js","_astro/useKeydown.71409498.js","_astro/index.3d4af9ee.js","_astro/settings.270953c1.js","_astro/index.a2044bc2.js","_astro/jsx-runtime.7e7f555b.js","_astro/client.014307a4.js","_astro/doc.fa0d4fbe.js","_astro/mini.03263755.js","_astro/useFrame.84ba1694.js"]),B(()=>import("./serial.265cc26a.js"),["_astro/serial.265cc26a.js","_astro/index.a2044bc2.js","_astro/index.3d4af9ee.js"]),B(()=>import("./index.56cc1610.js"),["_astro/index.56cc1610.js","_astro/index.a2044bc2.js","_astro/index.3d4af9ee.js","_astro/scope.f68c2f6d.js"]),B(()=>import("./index.de50da20.js"),["_astro/index.de50da20.js","_astro/settings.270953c1.js","_astro/index.a2044bc2.js","_astro/index.3d4af9ee.js","_astro/scope.f68c2f6d.js"])];Pi()?me=me.concat([B(()=>import("./loggerbridge.dda28407.js"),["_astro/loggerbridge.dda28407.js","_astro/index.a2044bc2.js","_astro/index.3d4af9ee.js","_astro/settings.270953c1.js","_astro/useKeydown.71409498.js","_astro/jsx-runtime.7e7f555b.js","_astro/client.014307a4.js","_astro/doc.fa0d4fbe.js","_astro/mini.03263755.js","_astro/useFrame.84ba1694.js","_astro/scope.f68c2f6d.js","_astro/prebake.5a610a01.js"]),B(()=>import("./midibridge.32024484.js"),["_astro/midibridge.32024484.js","_astro/utils.8d139480.js","_astro/index.a2044bc2.js","_astro/index.3d4af9ee.js","_astro/settings.270953c1.js","_astro/useKeydown.71409498.js","_astro/jsx-runtime.7e7f555b.js","_astro/client.014307a4.js","_astro/doc.fa0d4fbe.js","_astro/mini.03263755.js","_astro/useFrame.84ba1694.js","_astro/scope.f68c2f6d.js","_astro/prebake.5a610a01.js"]),B(()=>import("./oscbridge.1f796b77.js"),["_astro/oscbridge.1f796b77.js","_astro/index.a2044bc2.js","_astro/index.3d4af9ee.js","_astro/utils.8d139480.js","_astro/settings.270953c1.js","_astro/useKeydown.71409498.js","_astro/jsx-runtime.7e7f555b.js","_astro/client.014307a4.js","_astro/doc.fa0d4fbe.js","_astro/mini.03263755.js","_astro/useFrame.84ba1694.js","_astro/scope.f68c2f6d.js","_astro/prebake.5a610a01.js"])]):me=me.concat([B(()=>import("./index.0c52d160.js"),["_astro/index.0c52d160.js","_astro/index.a2044bc2.js","_astro/index.3d4af9ee.js"]),B(()=>import("./osc.35ce10d7.js"),["_astro/osc.35ce10d7.js","_astro/index.3d4af9ee.js","_astro/index.a2044bc2.js"])]);const Ni=zt(Ht,Mt,...me);At();let ge,It;typeof window<"u"&&(ge=Jt(),It=()=>ge.clearRect(0,0,ge.canvas.height,ge.canvas.width));const Li=()=>be().currentTime;async function Ui(){try{const e=window.location.href.split("?")[1]?.split("#")?.[0],t=window.location.href.split("#")[1]||"";if(t)return Si(t);if(e)return Pt.from("code").select("code").eq("hash",e).then(({data:s,error:n})=>{if(n&&console.warn("failed to load hash",err),s.length)return s[0].code})}catch(r){console.warn("failed to decode",r)}}function Nt(){const r=Object.entries(Ai),e=n=>n[Math.floor(Math.random()*n.length)],[t,s]=e(r);return{name:t,code:s}}const{code:Gi,name:Mi}=Nt(),qi=v.createContext(null);function to({embedded:r=!1}){const e=r||window.location!==window.parent.location,[t,s]=v.useState(),[n,i]=v.useState(),[o,a]=v.useState(!0),{theme:l,keybindings:c,fontSize:d,fontFamily:u,isLineNumbersDisplayed:p,isAutoCompletionEnabled:y,isLineWrappingEnabled:g,panelPosition:_}=we(),b=v.useMemo(()=>({fontFamily:u}),[u]),{setWidgets:A}=Ii(t),{code:O,setCode:$,scheduler:S,evaluate:J,activateCode:ae,isDirty:Ce,activeCode:U,pattern:Be,started:ee,stop:I,error:Ae}=Wt({initialCode:"// LOADING...",defaultOutput:ss,getTime:Li,beforeEval:async()=>{a(!0),await Ni,Kt(),lt()},afterEval:({code:E,meta:G})=>{he(G.miniLocations),A(G.widgets),a(!1),qt(E),window.location.hash="#"+Ti(E)},onEvalError:E=>{a(!1)},onToggle:E=>{E?window.postMessage("strudel-start"):(lt(!1),window.postMessage("strudel-stop"))},drawContext:ge,paintOptions:b});v.useEffect(()=>{Ui().then(E=>{let G;E?($(E),G="I have loaded the code from the URL."):xt?($(xt),G="Your last session has been loaded!"):($(Gi),G=`A random code snippet named "${Mi}" has been loaded!`),W(`Welcome to Strudel! ${G} Press play or hit ctrl+enter to run it!`,"highlight"),a(!1)})},[]),Yt(v.useCallback(async E=>{if(E.ctrlKey||E.altKey)if(E.code==="Enter"){if(be().state!=="running"){alert("please click play to initialize the audio. you can use shortcuts after that!");return}E.preventDefault(),Xt(t),await ae()}else(E.key==="."||E.code==="Period")&&(I(),E.preventDefault())},[ae,I,t]));const{setMiniLocations:he}=Zt({view:t,pattern:Be,active:ee&&!U?.includes("strudel disable-highlighting"),getTime:()=>S.now()}),f=v.useCallback(E=>{$(E)},[ee]),m=v.useCallback(E=>{},[]),x=async()=>{await be().resume(),ee?(W("[repl] stopped. tip: you can also stop by pressing ctrl+dot","highlight"),I()):(W("[repl] started. tip: you can also start by pressing ctrl+enter","highlight"),ae())},K={scheduler:S,embedded:r,started:ee,pending:o,isDirty:Ce,lastShared:n,activeCode:U,handleChangeCode:f,handleTogglePlay:x,handleUpdate:()=>{Ce&&ae(),W("[repl] code updated! tip: you can also update the code by pressing ctrl+enter","highlight")},handleShuffle:async()=>{const{code:E,name:G}=Nt();W(`[repl] ✨ loading random tune "${G}"`),It(),rs(),S.setCps(1),await At(),await J(E,!1)},handleShare:async()=>{const E=U||O;if(n===E){W("Link already generated!","error");return}const G=Dt(12),ot=window.location.origin+window.location.pathname+"?"+G,{data:zi,error:De}=await Pt.from("code").insert([{code:E,hash:G}]);if(De){console.log("error",De);const je=`Error: ${De.message}`;W(je)}else{i(U||O),await navigator.clipboard.writeText(ot);const je=`Link copied to clipboard: ${ot}`;alert(je),W(je,"highlight")}}},te=v.useMemo(()=>He[l]||He.strudelTheme,[l]),ue=v.useCallback(E=>{s(E)},[]);return h.jsx(qi.Provider,{value:K,children:h.jsxs("div",{className:F("h-full flex flex-col relative"),children:[h.jsx(ji,{active:o}),h.jsx(zn,{context:K}),e&&!ee&&h.jsxs("button",{onClick:()=>x(),className:"text-white text-2xl fixed left-[50%] top-[50%] translate-x-[-50%] translate-y-[-50%] z-[1000] m-auto p-4 bg-black rounded-md flex items-center space-x-2",children:[h.jsx($t,{className:"w-6 h-6"}),h.jsx("span",{children:"play"})]}),h.jsxs("div",{className:"grow flex relative overflow-hidden",children:[h.jsx("section",{className:"text-gray-100 cursor-text pb-0 overflow-auto grow",id:"code",children:h.jsx(Qt,{theme:te,value:O,keybindings:c,isLineNumbersDisplayed:p,isAutoCompletionEnabled:y,isLineWrappingEnabled:g,fontSize:d,fontFamily:u,onChange:f,onViewChanged:ue,onSelectionChange:m})}),_==="right"&&!e&&h.jsx(_t,{context:K})]}),Ae&&h.jsx("div",{className:"text-red-500 p-4 bg-lineHighlight animate-pulse",children:Ae.message||"Unknown Error :-/"}),_==="bottom"&&!e&&h.jsx(_t,{context:K})]})})}export{to as R,Di as d,Oi as e,Ze as s};
//# sourceMappingURL=Repl.9bb3d489.js.map
