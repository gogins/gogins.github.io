import{e as J,_ as p,c as K,u as Q,t as Z,n as ee}from"./settings.ea7ba944.js";import{i as te,p as oe}from"./prebake.2658b75f.js";import{r as V}from"./index.528e429e.js";import{j as b}from"./jsx-runtime.0c15e696.js";const re=r=>{var i;if(typeof r!="string")return[];const[n,u="",l]=((i=r.match(/^([a-gA-G])([#bs]*)([0-9])?$/))==null?void 0:i.slice(1))||[];return n?[n,u,l?Number(l):void 0]:[]},ie={"#":1,b:-1,s:1},y=r=>{if(typeof r=="number")return r;const[i,n,u]=re(r);if(!i)throw new Error('not a note: "'+r+'"');const l={c:0,d:2,e:4,f:5,g:7,a:9,b:11}[i.toLowerCase()],c=n?.split("").reduce((d,m)=>d+ie[m],0)||0;return(Number(u)+1)*12+l+c};function ne({options:r,onClick:i,onMouseDown:n,onMouseUp:u,onMouseLeave:l}){const{range:c=["A1","C6"],scaleX:d=1,scaleY:m=1,palette:_=["#39383D","#F2F2EF"],strokeWidth:f=1,stroke:g="black",upperWidth:w=14,upperHeight:k=100,lowerHeight:A=45,colorize:L=[],labels:R,topLabels:x}=r||{},E=[0,1,0,1,0,0,1,0,1,0,1,0],s=y(c[0]),I=y(c[1])-s+1,D=e=>{const t=[],a=[],h=y(e[1]);for(let v=s;v<=h;v++)(E[v%12]?a:t).push(v);return[t,a]},[j,M]=D(c),o=w*d,O=e=>(e%12>4?7/4:5/3)*o,P=(k+A)*m,C=k*m,T=e=>Array.from({length:e-s},(t,a)=>a+s).reduce((t,a)=>E[a%12]?t:t+O(a),0),N=12-s%12,G=T(N+s)-N*o,F=e=>(e-s)*o+G,X=L.map(e=>({...e,keys:e.keys.map(t=>y(t))})),S=e=>{var t;return(t=X.find(({keys:a})=>a.includes(e)))==null?void 0:t.color},$=e=>()=>i?.(e),z=e=>()=>n?.(e),W=e=>()=>u?.(e),H=e=>()=>l?.(e),q=e=>E[e%12]===1;return{name:"svg",type:"element",value:"",attributes:{width:I*o+o+f*2,height:P},children:[...j.map(e=>{var t;return{name:"rect",type:"element",value:"",attributes:{key:e,x:T(e),y:0,height:P,width:O(e),fill:(t=S(e))!=null?t:_[1],stroke:g,strokeWidth:`${f}px`,onClick:$(e),onMouseDown:z(e),onMouseUp:W(e),onMouseLeave:H(e)}}}),...M.map(e=>{var t;return{name:"rect",type:"element",value:"",attributes:{key:e,x:F(e),y:0,width:o,height:C,fill:(t=S(e))!=null?t:_[0],stroke:"black",strokeWidth:`${f}px`,onClick:$(e),onMouseDown:z(e),onMouseUp:W(e),onMouseLeave:H(e)}}}),...Object.entries(R||{}).reduce((e,[t,a])=>{const h=y(t),v=q(h),U=x?o*.7:(v?C:P)-o*.7,Y=v||x?F(h)+o/2:T(h)+O(h)/2;return e.concat([{name:"circle",value:a,attributes:{cx:Y,cy:U,r:o/2,fill:_[1],stroke:_[0]}},{name:"text",value:a,attributes:{x:Y,y:U+o*.2,textAnchor:"middle",fontFamily:"Verdana",fontSize:o*.7}}])},[])]}}function se({options:r,onClick:i,onMouseDown:n,onMouseUp:u,onMouseLeave:l}){const c=ne({options:r,onClick:i,onMouseDown:n,onMouseUp:u,onMouseLeave:l});return b.jsx("svg",{...c.attributes,children:c.children.map((d,m)=>{const _=d.name;return b.jsx(_,{...d.attributes,children:d.value},`${d.name}-${m}`)})})}let B;typeof window<"u"&&(B=J(K,p(()=>import("./settings.ea7ba944.js").then(r=>r.m),["_astro/settings.ea7ba944.js","_astro/index.528e429e.js"]),p(()=>import("./index.873ee4fb.js"),["_astro/index.873ee4fb.js","_astro/settings.ea7ba944.js","_astro/index.528e429e.js"]),p(()=>import("./index.9481925f.js"),["_astro/index.9481925f.js","_astro/mini.2df09350.js","_astro/settings.ea7ba944.js","_astro/index.528e429e.js"]),p(()=>import("./index.d89fc6fe.js"),["_astro/index.d89fc6fe.js","_astro/settings.ea7ba944.js","_astro/index.528e429e.js","_astro/prebake.2658b75f.js"]),p(()=>import("./index.80804d81.js"),["_astro/index.80804d81.js","_astro/settings.ea7ba944.js","_astro/index.528e429e.js"]),p(()=>import("./index.5099bcab.js"),["_astro/index.5099bcab.js","_astro/prebake.2658b75f.js","_astro/settings.ea7ba944.js","_astro/index.528e429e.js"]),p(()=>import("./osc.89644a0a.js"),["_astro/osc.89644a0a.js","_astro/index.528e429e.js","_astro/settings.ea7ba944.js"]),p(()=>import("./index.8d2999c5.js"),["_astro/index.8d2999c5.js","_astro/settings.ea7ba944.js","_astro/index.528e429e.js","_astro/prebake.2658b75f.js"]),p(()=>import("./index.0d606562.js"),["_astro/index.0d606562.js","_astro/settings.ea7ba944.js","_astro/index.528e429e.js","_astro/prebake.2658b75f.js"])));typeof window<"u"&&(te(),oe());function de({tune:r,drawTime:i,punchcard:n,punchcardLabels:u=!0,span:l=[0,4],canvasHeight:c=100,hideHeader:d,claviature:m,claviatureLabels:_}){const[f,g]=V.useState(),{theme:w,keybindings:k,fontSize:A,fontFamily:L,isLineNumbersDisplayed:R}=Q(),[x,E]=V.useState([]);return V.useEffect(()=>{Promise.all([p(()=>import("./index.5f8ac682.js"),["_astro/index.5f8ac682.js","_astro/useKeydown.06272697.js","_astro/index.528e429e.js","_astro/settings.ea7ba944.js","_astro/jsx-runtime.0c15e696.js","_astro/client.bf050b43.js","_astro/doc.b80fb82f.js","_astro/mini.2df09350.js","_astro/prebake.2658b75f.js"]),B]).then(([s])=>g(()=>s.MiniRepl)).catch(s=>console.error(s))},[]),f?b.jsxs("div",{className:"mb-4",children:[b.jsx(f,{tune:r,hideOutsideView:!0,drawTime:m?[0,0]:i,punchcard:n,punchcardLabels:u,span:l,canvasHeight:c,theme:Z[w],hideHeader:d,keybindings:k,fontFamily:L,fontSize:A,isLineNumbersDisplayed:R,onPaint:m?(s,I,D,j)=>{const M=D.map(o=>o.value.note).filter(Boolean).map(o=>typeof o=="string"?ee(o):o);E(M)}:void 0}),m&&b.jsx(se,{options:{range:["C2","C6"],scaleY:.75,colorize:[{keys:x,color:"steelblue"}],labels:_||{}}})]}):b.jsx("pre",{children:r})}export{de as M};