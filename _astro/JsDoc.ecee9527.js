import{j}from"./doc.bd86b523.js";import{MiniRepl as x}from"./MiniRepl.eb0582fe.js";import{j as s}from"./jsx-runtime.7e7f555b.js";import"./settings.ceb8da38.js";import"./index.7dcdd514.js";import"./index.3d4af9ee.js";import"./scope.efc95823.js";import"./prebake.1db9593c.js";import"./Claviature.c3e47521.js";const g=j.docs.reduce((t,e)=>Object.assign(t,{[e.longname]:e}),{}),h=(t,e)=>e.tags?.find(c=>c.title===t)?.text;function C({name:t,h:e=3,hideDescription:c,punchcard:m,canvasHeight:a}){const n=g[t];if(!n)return console.warn("Not found: "+t),s.jsx("div",{});const l=h("synonyms",n)?.split(", ")||[],p=`h${e}`,d=n.description?.replaceAll(/\{@link ([a-zA-Z\.]+)?#?([a-zA-Z]*)\}/g,(o,i,r)=>`<a href="#${i.replaceAll(".","").toLowerCase()}${r?`-${r}`:""}">${i}${r?`#${r}`:""}</a>`)||"";return s.jsxs(s.Fragment,{children:[!!e&&s.jsx(p,{children:n.longname}),!c&&s.jsxs(s.Fragment,{children:[!!l.length&&s.jsxs("span",{children:["Synonyms: ",s.jsx("code",{children:l.join(", ")})]}),s.jsx("div",{dangerouslySetInnerHTML:{__html:d}})]}),s.jsx("ul",{children:n.params?.map((o,i)=>s.jsxs("li",{children:[o.name," (",o.type?.names?.join("|"),"): ",o.description?.replace(/(<([^>]+)>)/gi,"")]},i))}),n.examples?.length?s.jsx("div",{className:"space-y-2",children:n.examples?.map((o,i)=>s.jsx(x,{tune:o,punchcard:m,canvasHeight:a},i))}):s.jsx("div",{})]})}export{C as JsDoc};
//# sourceMappingURL=JsDoc.ecee9527.js.map