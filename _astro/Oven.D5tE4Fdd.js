import{j as t}from"./jsx-runtime.DDS51bD4.js";import{r as a}from"./index.DIn8BZQ7.js";import{l,a as d}from"./useClient.x3PQNGmI.js";import{MiniRepl as c}from"./MiniRepl.Br2j6_c7.js";import{P as m}from"./PatternsTab.CiecGvAI.js";import"./_commonjsHelpers.BosuxZz1.js";import"./codemirror.DcFRIHI_.js";import"./index.CEVOgZNG.js";import"./index.D_JsPLR7.js";import"./scope.D3Xd9ZOT.js";/* empty css                      */import"./Claviature.DCnIPR8v.js";function n({patterns:s}){return t.jsx("div",{className:"space-y-4",children:s.map(e=>t.jsxs("div",{children:[t.jsx("div",{className:"flex justify-between not-prose pb-2",children:t.jsx("h2",{className:"text-lg",children:t.jsx("a",{href:`/?${e.hash}`,target:"_blank",className:"underline",children:t.jsx(m,{pattern:e})})})}),t.jsx(c,{tune:e.code.trim(),maxHeight:300})]},e.id))})}function F(){const[s,e]=a.useState([]),[i,o]=a.useState([]);return a.useEffect(()=>{l().then(({data:r})=>{console.log("pats",r),o(r)}),d().then(({data:r})=>{console.log("pats",r),e(r)})},[]),t.jsxs("div",{children:[t.jsx("h2",{id:"featured",children:"Featured Patterns"}),t.jsx(n,{patterns:s}),t.jsx("h2",{id:"latest",children:"Last Creations"}),t.jsx(n,{patterns:i})]})}export{F as Oven};
//# sourceMappingURL=Oven.D5tE4Fdd.js.map