import{u as Y,a as G}from"./useFrame.84ba1694.js";import{f as O}from"./scope.efc95823.js";import{m as I}from"./index.7dcdd514.js";import{r as u}from"./index.3d4af9ee.js";import{C as J}from"./Claviature.c3e47521.js";import{j as e}from"./jsx-runtime.7e7f555b.js";let C=l=>e.jsx("button",{...l,className:"bg-lineHighlight p-2 rounded-md color-foreground"});function S(l,d,m,f,x){let{width:N,height:r}=l.canvas;l.strokeStyle=x;const a=8;l.lineWidth=a,l.beginPath();let y=c=>(c-m)/(f-m)*N,g=c=>(1-c/d.length)*r;d.forEach((c,v,n)=>{l.lineTo(y(c),g(v))}),l.stroke()}let K="#eab308",Q="#3b82f6";function te({buttons:l=[],animatable:d=!1,plot:m=!1,showPitchSlider:f=!1,showFrequencySlider:x=!1,pitchStep:N="0.001",min:r=55,max:a=7040,initial:y=220,baseFrequency:g=r,zeroOffset:c=0,claviature:v}){const n=u.useRef(),k=u.useRef(),w=u.useRef(y),j=u.useRef([w.current]),F=u.useRef(),R=u.useRef(),[h,b]=u.useState(w.current);u.useEffect(()=>{w.current=h},[h]),Y("mouseup",()=>{n.current?.stop(),k.current=!1});let z=s=>r+s*(a-r),W=s=>r*2**(s*Math.log2(a/r)),B=s=>(s-r)/(a-r),A=s=>{const[t,o]=[Math.log2(r),Math.log2(a)];return(Math.log2(s)-t)/(o-t)};const L=B(h),T=A(h);let M=s=>{n.current&&n.current.stop(),n.current=O().createOscillator(),n.current.frequency.value=s,n.current.connect(O().destination),n.current.start(),k.current=!0,b(s)},D=(s=!1)=>{let t=r;M(t);const o=()=>{t<a?(s?t*=1.01:t+=10,n.current.frequency.value=t,F.current=requestAnimationFrame(o)):(n.current.stop(),cancelAnimationFrame(F.current)),b(t)};requestAnimationFrame(o)};G(()=>{if(j.current.push(w.current),j.current=j.current.slice(-1e3),R.current){let s=R.current.getContext("2d");if(s.clearRect(0,0,s.canvas.width,s.canvas.height),x&&S(s,j.current,r,a,Q),f){const[t,o]=[Math.log2(r),Math.log2(a)];let V=j.current.map(X=>Math.log2(X));S(s,V,t,o,K)}}},m);let q=s=>{b(s),n.current&&(n.current.frequency.value=s)},E=()=>{cancelAnimationFrame(F.current),M(h)},i,p,H;if(f){const s=g?Math.log2(g/r):0;i=A(h)*Math.log2(a/r)-s;let t=parseFloat((i*12).toFixed(2));if(c){t=t+c;const o=Math.round(t)===t;p=I(Math.round(t)),H=(o?"":"~")+p,t=o?t:t.toFixed(2),i=e.jsxs(e.Fragment,{children:["(",e.jsx("span",{className:"text-yellow-500",children:t})," - ",c,")/12"]})}else t%12===0?i=e.jsx("span",{className:"text-yellow-500",children:t/12}):t%1===0?i=e.jsxs(e.Fragment,{children:[e.jsx("span",{className:"text-yellow-500",children:t}),"/12"]}):i=e.jsx("span",{className:"text-yellow-500",children:i.toFixed(2)})}return e.jsxs(e.Fragment,{children:[e.jsxs("span",{className:"font-mono",children:[x&&e.jsxs("span",{className:"text-blue-500",children:[h.toFixed(0),"Hz"]}),x&&f&&e.jsx(e.Fragment,{children:" = "}),f&&e.jsxs(e.Fragment,{children:[g||r,"Hz * 2",e.jsx("sup",{children:i})]})]}),v&&e.jsxs(e.Fragment,{children:[" ","= ",e.jsx("span",{className:"text-yellow-500",children:H})]}),e.jsxs("div",{children:[x&&e.jsx("div",{className:"flex space-x-1 items-center",children:e.jsx("input",{type:"range",value:L,min:0,max:1,step:.001,onMouseDown:E,className:"block w-full max-w-[600px] accent-blue-500 ",onChange:s=>{const t=z(parseFloat(s.target.value));q(t)}})}),f&&e.jsx("div",{children:e.jsx("input",{type:"range",value:T,min:0,max:1,step:N,onMouseDown:E,className:"block w-full max-w-[600px] accent-yellow-500",onChange:s=>{const t=W(parseFloat(s.target.value));q(t)}})})]}),e.jsx("div",{className:"px-2",children:m&&e.jsx("canvas",{ref:R,className:"w-full max-w-[584px] h-[300px]",height:"600",width:800})}),e.jsxs("div",{className:"space-x-2",children:[d&&e.jsx(C,{onClick:()=>D(),children:e.jsx("span",{style:{color:"#3b82f6"},children:"Frequency Sweep"})}),d&&e.jsx(C,{onClick:()=>D(!0),children:e.jsx("span",{style:{color:"#eab308"},children:"Pitch Sweep"})}),l.map((s,t)=>e.jsxs(C,{onMouseDown:()=>M(s),children:[s,"Hz"]},t))]}),v&&e.jsx(J,{onMouseDown:s=>{const t=440*2**((s-69)/12);q(t),cancelAnimationFrame(F.current),M(t)},options:{range:["A1","A5"],scaleY:.75,scaleX:.86,colorize:p?[{keys:[p],color:"#eab308"}]:[],labels:p?{[p]:p}:{}}})]})}export{te as PitchSlider};
//# sourceMappingURL=PitchSlider.f6066792.js.map