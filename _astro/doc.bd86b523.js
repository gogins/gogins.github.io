const e=[{comment:`/**
   * Select a sound / sample by name. When using mininotation, you can also optionally supply 'n' and 'gain' parameters
   * separated by ':'.
   *
   * @name s
   * @param {string | Pattern} sound The sound / pattern of sounds to pick
   * @synonyms sound
   * @example
   * s("bd hh")
   * @example
   * s("bd:0 bd:1 bd:0:0.3 bd:1:1.4")
   *
   */`,meta:{filename:"controls.mjs",lineno:12,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Select a sound / sample by name. When using mininotation, you can also optionally supply 'n' and 'gain' parameters
separated by ':'.</p>`,name:"s",params:[{type:{names:["string","Pattern"]},description:"<p>The sound / pattern of sounds to pick</p>",name:"sound"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"sound",value:"sound"}],examples:['s("bd hh")','s("bd:0 bd:1 bd:0:0.3 bd:1:1.4")'],longname:"s",kind:"member",scope:"global"},{comment:`/**
   * Define a custom webaudio node to use as a sound source.
   *
   * @name source
   * @param {function} getSource
   * @synonyms src
   *
   */`,meta:{filename:"controls.mjs",lineno:26,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Define a custom webaudio node to use as a sound source.</p>",name:"source",params:[{type:{names:["function"]},name:"getSource"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"src",value:"src"}],longname:"source",kind:"member",scope:"global"},{comment:`/**
   * Selects the given index from the sample map.
   * Numbers too high will wrap around.
   * \`n\` can also be used to play midi numbers, but it is recommended to use \`note\` instead.
   *
   * @name n
   * @param {number | Pattern} value sample index starting from 0
   * @example
   * s("bd sd,hh*3").n("<0 1>")
   */`,meta:{filename:"controls.mjs",lineno:35,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Selects the given index from the sample map.
Numbers too high will wrap around.
<code>n</code> can also be used to play midi numbers, but it is recommended to use <code>note</code> instead.</p>`,name:"n",params:[{type:{names:["number","Pattern"]},description:"<p>sample index starting from 0</p>",name:"value"}],examples:['s("bd sd,hh*3").n("<0 1>")'],longname:"n",kind:"member",scope:"global"},{comment:`/**
   * Plays the given note name or midi number. A note name consists of
   *
   * - a letter (a-g or A-G)
   * - optional accidentals (b or #)
   * - optional octave number (0-9). Defaults to 3
   *
   * Examples of valid note names: \`c\`, \`bb\`, \`Bb\`, \`f#\`, \`c3\`, \`A4\`, \`Eb2\`, \`c#5\`
   *
   * You can also use midi numbers instead of note names, where 69 is mapped to A4 440Hz in 12EDO.
   *
   * @name note
   * @example
   * note("c a f e")
   * @example
   * note("c4 a4 f4 e4")
   * @example
   * note("60 69 65 64")
   */`,meta:{filename:"controls.mjs",lineno:47,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Plays the given note name or midi number. A note name consists of</p>
<ul>
<li>a letter (a-g or A-G)</li>
<li>optional accidentals (b or #)</li>
<li>optional octave number (0-9). Defaults to 3</li>
</ul>
<p>Examples of valid note names: <code>c</code>, <code>bb</code>, <code>Bb</code>, <code>f#</code>, <code>c3</code>, <code>A4</code>, <code>Eb2</code>, <code>c#5</code></p>
<p>You can also use midi numbers instead of note names, where 69 is mapped to A4 440Hz in 12EDO.</p>`,name:"note",examples:['note("c a f e")','note("c4 a4 f4 e4")','note("60 69 65 64")'],longname:"note",kind:"member",scope:"global"},{comment:`/**
   * A pattern of numbers that speed up (or slow down) samples while they play. Currently only supported by osc / superdirt.
   *
   * @name accelerate
   * @param {number | Pattern} amount acceleration.
   * @superdirtOnly
   * @example
   * s("sax").accelerate("<0 1 2 4 8 16>").slow(2).osc()
   *
   */`,meta:{filename:"controls.mjs",lineno:68,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>A pattern of numbers that speed up (or slow down) samples while they play. Currently only supported by osc / superdirt.</p>",name:"accelerate",params:[{type:{names:["number","Pattern"]},description:"<p>acceleration.</p>",name:"amount"}],tags:[{originalTitle:"superdirtOnly",title:"superdirtonly",text:""}],examples:['s("sax").accelerate("<0 1 2 4 8 16>").slow(2).osc()'],longname:"accelerate",kind:"member",scope:"global"},{comment:`/**
   * Controls the gain by an exponential amount.
   *
   * @name gain
   * @param {number | Pattern} amount gain.
   * @example
   * s("hh*8").gain(".4!2 1 .4!2 1 .4 1")
   *
   */`,meta:{filename:"controls.mjs",lineno:79,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Controls the gain by an exponential amount.</p>",name:"gain",params:[{type:{names:["number","Pattern"]},description:"<p>gain.</p>",name:"amount"}],examples:['s("hh*8").gain(".4!2 1 .4!2 1 .4 1")'],longname:"gain",kind:"member",scope:"global"},{comment:`/**
   * Like {@link gain}, but linear.
   *
   * @name amp
   * @param {number | Pattern} amount gain.
   * @superdirtOnly
   * @example
   * s("bd*8").amp(".1*2 .5 .1*2 .5 .1 .5").osc()
   *
   */`,meta:{filename:"controls.mjs",lineno:89,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Like {@link gain}, but linear.</p>",name:"amp",params:[{type:{names:["number","Pattern"]},description:"<p>gain.</p>",name:"amount"}],tags:[{originalTitle:"superdirtOnly",title:"superdirtonly",text:""}],examples:['s("bd*8").amp(".1*2 .5 .1*2 .5 .1 .5").osc()'],longname:"amp",kind:"member",scope:"global"},{comment:`/**
   * Amplitude envelope attack time: Specifies how long it takes for the sound to reach its peak value, relative to the onset.
   *
   * @name attack
   * @param {number | Pattern} attack time in seconds.
   * @synonyms att
   * @example
   * note("c3 e3").attack("<0 .1 .5>")
   *
   */`,meta:{filename:"controls.mjs",lineno:100,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Amplitude envelope attack time: Specifies how long it takes for the sound to reach its peak value, relative to the onset.</p>",name:"attack",params:[{type:{names:["number","Pattern"]},description:"<p>time in seconds.</p>",name:"attack"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"att",value:"att"}],examples:['note("c3 e3").attack("<0 .1 .5>")'],longname:"attack",kind:"member",scope:"global"},{comment:`/**
   * Sets the Frequency Modulation Harmonicity Ratio.
   * Controls the timbre of the sound.
   * Whole numbers and simple ratios sound more natural,
   * while decimal numbers and complex ratios sound metallic.
   *
   * @name fmh
   * @param {number | Pattern} harmonicity
   * @example
   * note("c e g b")
   * .fm(4)
   * .fmh("<1 2 1.5 1.61>")
   * .scope()
   *
   */`,meta:{filename:"controls.mjs",lineno:112,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Sets the Frequency Modulation Harmonicity Ratio.
Controls the timbre of the sound.
Whole numbers and simple ratios sound more natural,
while decimal numbers and complex ratios sound metallic.</p>`,name:"fmh",params:[{type:{names:["number","Pattern"]},name:"harmonicity"}],examples:[`note("c e g b")
.fm(4)
.fmh("<1 2 1.5 1.61>")
.scope()`],longname:"fmh",kind:"member",scope:"global"},{comment:`/**
   * Sets the Frequency Modulation of the synth.
   * Controls the modulation index, which defines the brightness of the sound.
   *
   * @name fm
   * @param {number | Pattern} brightness modulation index
   * @synonyms fmi
   * @example
   * note("c e g b")
   * .fm("<0 1 2 8 32>")
   * .scope()
   *
   */`,meta:{filename:"controls.mjs",lineno:128,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Sets the Frequency Modulation of the synth.
Controls the modulation index, which defines the brightness of the sound.</p>`,name:"fm",params:[{type:{names:["number","Pattern"]},description:"<p>modulation index</p>",name:"brightness"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"fmi",value:"fmi"}],examples:[`note("c e g b")
.fm("<0 1 2 8 32>")
.scope()`],longname:"fm",kind:"member",scope:"global"},{comment:`/**
   * Ramp type of fm envelope. Exp might be a bit broken..
   *
   * @name fmenv
   * @param {number | Pattern} type lin | exp
   * @example
   * note("c e g b")
   * .fm(4)
   * .fmdecay(.2)
   * .fmsustain(0)
   * .fmenv("<exp lin>")
   * .scope()
   *
   */`,meta:{filename:"controls.mjs",lineno:143,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Ramp type of fm envelope. Exp might be a bit broken..</p>",name:"fmenv",params:[{type:{names:["number","Pattern"]},description:"<p>lin | exp</p>",name:"type"}],examples:[`note("c e g b")
.fm(4)
.fmdecay(.2)
.fmsustain(0)
.fmenv("<exp lin>")
.scope()`],longname:"fmenv",kind:"member",scope:"global"},{comment:`/**
   * Attack time for the FM envelope: time it takes to reach maximum modulation
   *
   * @name fmattack
   * @param {number | Pattern} time attack time
   * @example
   * note("c e g b")
   * .fm(4)
   * .fmattack("<0 .05 .1 .2>")
   * .scope()
   *
   */`,meta:{filename:"controls.mjs",lineno:158,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Attack time for the FM envelope: time it takes to reach maximum modulation</p>",name:"fmattack",params:[{type:{names:["number","Pattern"]},description:"<p>attack time</p>",name:"time"}],examples:[`note("c e g b")
.fm(4)
.fmattack("<0 .05 .1 .2>")
.scope()`],longname:"fmattack",kind:"member",scope:"global"},{comment:`/**
   * Decay time for the FM envelope: seconds until the sustain level is reached after the attack phase.
   *
   * @name fmdecay
   * @param {number | Pattern} time decay time
   * @example
   * note("c e g b")
   * .fm(4)
   * .fmdecay("<.01 .05 .1 .2>")
   * .fmsustain(.4)
   * .scope()
   *
   */`,meta:{filename:"controls.mjs",lineno:171,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Decay time for the FM envelope: seconds until the sustain level is reached after the attack phase.</p>",name:"fmdecay",params:[{type:{names:["number","Pattern"]},description:"<p>decay time</p>",name:"time"}],examples:[`note("c e g b")
.fm(4)
.fmdecay("<.01 .05 .1 .2>")
.fmsustain(.4)
.scope()`],longname:"fmdecay",kind:"member",scope:"global"},{comment:`/**
   * Sustain level for the FM envelope: how much modulation is applied after the decay phase
   *
   * @name fmsustain
   * @param {number | Pattern} level sustain level
   * @example
   * note("c e g b")
   * .fm(4)
   * .fmdecay(.1)
   * .fmsustain("<1 .75 .5 0>")
   * .scope()
   *
   */`,meta:{filename:"controls.mjs",lineno:185,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sustain level for the FM envelope: how much modulation is applied after the decay phase</p>",name:"fmsustain",params:[{type:{names:["number","Pattern"]},description:"<p>sustain level</p>",name:"level"}],examples:[`note("c e g b")
.fm(4)
.fmdecay(.1)
.fmsustain("<1 .75 .5 0>")
.scope()`],longname:"fmsustain",kind:"member",scope:"global"},{comment:`/**
   * Select the sound bank to use. To be used together with \`s\`. The bank name (+ "_") will be prepended to the value of \`s\`.
   *
   * @name bank
   * @param {string | Pattern} bank the name of the bank
   * @example
   * s("bd sd").bank('RolandTR909') // = s("RolandTR909_bd RolandTR909_sd")
   *
   */`,meta:{filename:"controls.mjs",lineno:203,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Select the sound bank to use. To be used together with <code>s</code>. The bank name (+ &quot;_&quot;) will be prepended to the value of <code>s</code>.</p>",name:"bank",params:[{type:{names:["string","Pattern"]},description:"<p>the name of the bank</p>",name:"bank"}],examples:[`s("bd sd").bank('RolandTR909') // = s("RolandTR909_bd RolandTR909_sd")`],longname:"bank",kind:"member",scope:"global"},{comment:`/**
   * Amplitude envelope decay time: the time it takes after the attack time to reach the sustain level.
   * Note that the decay is only audible if the sustain value is lower than 1.
   *
   * @name decay
   * @param {number | Pattern} time decay time in seconds
   * @example
   * note("c3 e3").decay("<.1 .2 .3 .4>").sustain(0)
   *
   */`,meta:{filename:"controls.mjs",lineno:217,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Amplitude envelope decay time: the time it takes after the attack time to reach the sustain level.
Note that the decay is only audible if the sustain value is lower than 1.</p>`,name:"decay",params:[{type:{names:["number","Pattern"]},description:"<p>decay time in seconds</p>",name:"time"}],examples:['note("c3 e3").decay("<.1 .2 .3 .4>").sustain(0)'],longname:"decay",kind:"member",scope:"global"},{comment:`/**
   * Amplitude envelope sustain level: The level which is reached after attack / decay, being sustained until the offset.
   *
   * @name sustain
   * @param {number | Pattern} gain sustain level between 0 and 1
   * @synonyms sus
   * @example
   * note("c3 e3").decay(.2).sustain("<0 .1 .4 .6 1>")
   *
   */`,meta:{filename:"controls.mjs",lineno:228,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Amplitude envelope sustain level: The level which is reached after attack / decay, being sustained until the offset.</p>",name:"sustain",params:[{type:{names:["number","Pattern"]},description:"<p>sustain level between 0 and 1</p>",name:"gain"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"sus",value:"sus"}],examples:['note("c3 e3").decay(.2).sustain("<0 .1 .4 .6 1>")'],longname:"sustain",kind:"member",scope:"global"},{comment:`/**
   * Amplitude envelope release time: The time it takes after the offset to go from sustain level to zero.
   *
   * @name release
   * @param {number | Pattern} time release time in seconds
   * @synonyms rel
   * @example
   * note("c3 e3 g3 c4").release("<0 .1 .4 .6 1>/2")
   *
   */`,meta:{filename:"controls.mjs",lineno:239,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Amplitude envelope release time: The time it takes after the offset to go from sustain level to zero.</p>",name:"release",params:[{type:{names:["number","Pattern"]},description:"<p>release time in seconds</p>",name:"time"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"rel",value:"rel"}],examples:['note("c3 e3 g3 c4").release("<0 .1 .4 .6 1>/2")'],longname:"release",kind:"member",scope:"global"},{comment:`/**
   * Sets the center frequency of the **b**and-**p**ass **f**ilter. When using mininotation, you
   * can also optionally supply the 'bpq' parameter separated by ':'.
   *
   * @name bpf
   * @param {number | Pattern} frequency center frequency
   * @synonyms bandf, bp
   * @example
   * s("bd sd,hh*3").bpf("<1000 2000 4000 8000>")
   *
   */`,meta:{filename:"controls.mjs",lineno:252,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Sets the center frequency of the <strong>b</strong>and-<strong>p</strong>ass <strong>f</strong>ilter. When using mininotation, you
can also optionally supply the 'bpq' parameter separated by ':'.</p>`,name:"bpf",params:[{type:{names:["number","Pattern"]},description:"<p>center frequency</p>",name:"frequency"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"bandf, bp",value:"bandf, bp"}],examples:['s("bd sd,hh*3").bpf("<1000 2000 4000 8000>")'],longname:"bpf",kind:"member",scope:"global"},{comment:`/**
   * Sets the **b**and-**p**ass **q**-factor (resonance).
   *
   * @name bpq
   * @param {number | Pattern} q q factor
   * @synonyms bandq
   * @example
   * s("bd sd").bpf(500).bpq("<0 1 2 3>")
   *
   */`,meta:{filename:"controls.mjs",lineno:265,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the <strong>b</strong>and-<strong>p</strong>ass <strong>q</strong>-factor (resonance).</p>",name:"bpq",params:[{type:{names:["number","Pattern"]},description:"<p>q factor</p>",name:"q"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"bandq",value:"bandq"}],examples:['s("bd sd").bpf(500).bpq("<0 1 2 3>")'],longname:"bpq",kind:"member",scope:"global"},{comment:`/**
   * a pattern of numbers from 0 to 1. Skips the beginning of each sample, e.g. \`0.25\` to cut off the first quarter from each sample.
   *
   * @memberof Pattern
   * @name begin
   * @param {number | Pattern} amount between 0 and 1, where 1 is the length of the sample
   * @example
   * samples({ rave: 'rave/AREUREADY.wav' }, 'github:tidalcycles/Dirt-Samples/master/')
   * s("rave").begin("<0 .25 .5 .75>")
   *
   */`,meta:{filename:"controls.mjs",lineno:278,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>a pattern of numbers from 0 to 1. Skips the beginning of each sample, e.g. <code>0.25</code> to cut off the first quarter from each sample.</p>",memberof:"Pattern",name:"begin",params:[{type:{names:["number","Pattern"]},description:"<p>between 0 and 1, where 1 is the length of the sample</p>",name:"amount"}],examples:[`samples({ rave: 'rave/AREUREADY.wav' }, 'github:tidalcycles/Dirt-Samples/master/')
s("rave").begin("<0 .25 .5 .75>")`],scope:"static",longname:"Pattern.begin",kind:"member"},{comment:`/**
   * The same as .begin, but cuts off the end off each sample.
   *
   * @memberof Pattern
   * @name end
   * @param {number | Pattern} length 1 = whole sample, .5 = half sample, .25 = quarter sample etc..
   * @example
   * s("bd*2,oh*4").end("<.1 .2 .5 1>")
   *
   */`,meta:{filename:"controls.mjs",lineno:290,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>The same as .begin, but cuts off the end off each sample.</p>",memberof:"Pattern",name:"end",params:[{type:{names:["number","Pattern"]},description:"<p>1 = whole sample, .5 = half sample, .25 = quarter sample etc..</p>",name:"length"}],examples:['s("bd*2,oh*4").end("<.1 .2 .5 1>")'],scope:"static",longname:"Pattern.end",kind:"member"},{comment:`/**
   * Loops the sample.
   * Note that the tempo of the loop is not synced with the cycle tempo.
   * To change the loop region, use loopBegin / loopEnd.
   *
   * @name loop
   * @param {number | Pattern} on If 1, the sample is looped
   * @example
   * s("casio").loop(1)
   *
   */`,meta:{filename:"controls.mjs",lineno:301,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Loops the sample.
Note that the tempo of the loop is not synced with the cycle tempo.
To change the loop region, use loopBegin / loopEnd.</p>`,name:"loop",params:[{type:{names:["number","Pattern"]},description:"<p>If 1, the sample is looped</p>",name:"on"}],examples:['s("casio").loop(1)'],longname:"loop",kind:"member",scope:"global"},{comment:`/**
   * Begin to loop at a specific point in the sample (inbetween \`begin\` and \`end\`).
   * Note that the loop point must be inbetween \`begin\` and \`end\`, and before \`loopEnd\`!
   * Note: Samples starting with wt_ will automatically loop! (wt = wavetable)
   *
   * @name loopBegin
   * @param {number | Pattern} time between 0 and 1, where 1 is the length of the sample
   * @synonyms loopb
   * @example
   * s("space").loop(1)
   * .loopBegin("<0 .125 .25>").scope()
   */`,meta:{filename:"controls.mjs",lineno:313,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Begin to loop at a specific point in the sample (inbetween <code>begin</code> and <code>end</code>).
Note that the loop point must be inbetween <code>begin</code> and <code>end</code>, and before <code>loopEnd</code>!
Note: Samples starting with wt_ will automatically loop! (wt = wavetable)</p>`,name:"loopBegin",params:[{type:{names:["number","Pattern"]},description:"<p>between 0 and 1, where 1 is the length of the sample</p>",name:"time"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"loopb",value:"loopb"}],examples:[`s("space").loop(1)
.loopBegin("<0 .125 .25>").scope()`],longname:"loopBegin",kind:"member",scope:"global"},{comment:`/**
   *
   * End the looping section at a specific point in the sample (inbetween \`begin\` and \`end\`).
   * Note that the loop point must be inbetween \`begin\` and \`end\`, and after \`loopBegin\`!
   *
   * @name loopEnd
   * @param {number | Pattern} time between 0 and 1, where 1 is the length of the sample
   * @synonyms loope
   * @example
   * s("space").loop(1)
   * .loopEnd("<1 .75 .5 .25>").scope()
   */`,meta:{filename:"controls.mjs",lineno:326,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>End the looping section at a specific point in the sample (inbetween <code>begin</code> and <code>end</code>).
Note that the loop point must be inbetween <code>begin</code> and <code>end</code>, and after <code>loopBegin</code>!</p>`,name:"loopEnd",params:[{type:{names:["number","Pattern"]},description:"<p>between 0 and 1, where 1 is the length of the sample</p>",name:"time"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"loope",value:"loope"}],examples:[`s("space").loop(1)
.loopEnd("<1 .75 .5 .25>").scope()`],longname:"loopEnd",kind:"member",scope:"global"},{comment:`/**
   * bit crusher effect.
   *
   * @name crush
   * @param {number | Pattern} depth between 1 (for drastic reduction in bit-depth) to 16 (for barely no reduction).
   * @example
   * s("<bd sd>,hh*3").fast(2).crush("<16 8 7 6 5 4 3 2>")
   *
   */`,meta:{filename:"controls.mjs",lineno:339,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>bit crusher effect.</p>",name:"crush",params:[{type:{names:["number","Pattern"]},description:"<p>between 1 (for drastic reduction in bit-depth) to 16 (for barely no reduction).</p>",name:"depth"}],examples:['s("<bd sd>,hh*3").fast(2).crush("<16 8 7 6 5 4 3 2>")'],longname:"crush",kind:"member",scope:"global"},{comment:`/**
   * a pattern of numbers from 0 to 1. Skips the beginning of each sample, e.g. \`0.25\` to cut off the first quarter from each sample.
   *
   * @name legato
   * @param {number | Pattern} duration between 0 and 1, where 1 is the length of the whole hap time
   * @noAutocomplete
   * @example
   * "c4 eb4 g4 bb4".legato("<0.125 .25 .5 .75 1 2 4>")
   *
   */`,meta:{filename:"controls.mjs",lineno:350,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>a pattern of numbers from 0 to 1. Skips the beginning of each sample, e.g. <code>0.25</code> to cut off the first quarter from each sample.</p>",name:"legato",params:[{type:{names:["number","Pattern"]},description:"<p>between 0 and 1, where 1 is the length of the whole hap time</p>",name:"duration"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],examples:['"c4 eb4 g4 bb4".legato("<0.125 .25 .5 .75 1 2 4>")'],longname:"legato",kind:"member",scope:"global"},{comment:`/**
   * fake-resampling for lowering the sample rate. Caution: This effect seems to only work in chromium based browsers
   *
   * @name coarse
   * @param {number | Pattern} factor 1 for original 2 for half, 3 for a third and so on.
   * @example
   * s("bd sd,hh*4").coarse("<1 4 8 16 32>")
   *
   */`,meta:{filename:"controls.mjs",lineno:363,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>fake-resampling for lowering the sample rate. Caution: This effect seems to only work in chromium based browsers</p>",name:"coarse",params:[{type:{names:["number","Pattern"]},description:"<p>1 for original 2 for half, 3 for a third and so on.</p>",name:"factor"}],examples:['s("bd sd,hh*4").coarse("<1 4 8 16 32>")'],longname:"coarse",kind:"member",scope:"global"},{comment:`/**
   * choose the channel the pattern is sent to in superdirt
   *
   * @name channel
   * @param {number | Pattern} channel channel number
   *
   */`,meta:{filename:"controls.mjs",lineno:373,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>choose the channel the pattern is sent to in superdirt</p>",name:"channel",params:[{type:{names:["number","Pattern"]},description:"<p>channel number</p>",name:"channel"}],longname:"channel",kind:"member",scope:"global"},{comment:`/**
   * In the style of classic drum-machines, \`cut\` will stop a playing sample as soon as another samples with in same cutgroup is to be played. An example would be an open hi-hat followed by a closed one, essentially muting the open.
   *
   * @name cut
   * @param {number | Pattern} group cut group number
   * @example
   * s("rd*4").cut(1)
   *
   */`,meta:{filename:"controls.mjs",lineno:381,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>In the style of classic drum-machines, <code>cut</code> will stop a playing sample as soon as another samples with in same cutgroup is to be played. An example would be an open hi-hat followed by a closed one, essentially muting the open.</p>",name:"cut",params:[{type:{names:["number","Pattern"]},description:"<p>cut group number</p>",name:"group"}],examples:['s("rd*4").cut(1)'],longname:"cut",kind:"member",scope:"global"},{comment:`/**
   * Applies the cutoff frequency of the **l**ow-**p**ass **f**ilter.
   *
   * When using mininotation, you can also optionally add the 'lpq' parameter, separated by ':'.
   *
   * @name lpf
   * @param {number | Pattern} frequency audible between 0 and 20000
   * @synonyms cutoff, ctf, lp
   * @example
   * s("bd sd,hh*3").lpf("<4000 2000 1000 500 200 100>")
   * @example
   * s("bd*8").lpf("1000:0 1000:10 1000:20 1000:30")
   *
   */`,meta:{filename:"controls.mjs",lineno:391,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Applies the cutoff frequency of the <strong>l</strong>ow-<strong>p</strong>ass <strong>f</strong>ilter.</p>
<p>When using mininotation, you can also optionally add the 'lpq' parameter, separated by ':'.</p>`,name:"lpf",params:[{type:{names:["number","Pattern"]},description:"<p>audible between 0 and 20000</p>",name:"frequency"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"cutoff, ctf, lp",value:"cutoff, ctf, lp"}],examples:['s("bd sd,hh*3").lpf("<4000 2000 1000 500 200 100>")','s("bd*8").lpf("1000:0 1000:10 1000:20 1000:30")'],longname:"lpf",kind:"member",scope:"global"},{comment:`/**
   * Sets the lowpass filter envelope modulation depth.
   * @name lpenv
   * @param {number | Pattern} modulation depth of the lowpass filter envelope between 0 and _n_
   * @synonyms lpe
   * @example
   * note("<c2 e2 f2 g2>")
   * .sound('sawtooth')
   * .lpf(500)
   * .lpa(.5)
   * .lpenv("<4 2 1 0 -1 -2 -4>/4")
   */`,meta:{filename:"controls.mjs",lineno:407,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the lowpass filter envelope modulation depth.</p>",name:"lpenv",params:[{type:{names:["number","Pattern"]},description:"<p>depth of the lowpass filter envelope between 0 and <em>n</em></p>",name:"modulation"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"lpe",value:"lpe"}],examples:[`note("<c2 e2 f2 g2>")
.sound('sawtooth')
.lpf(500)
.lpa(.5)
.lpenv("<4 2 1 0 -1 -2 -4>/4")`],longname:"lpenv",kind:"member",scope:"global"},{comment:`/**
   * Sets the highpass filter envelope modulation depth.
   * @name hpenv
   * @param {number | Pattern} modulation depth of the highpass filter envelope between 0 and _n_
   * @synonyms hpe
   * @example
   * note("<c2 e2 f2 g2>")
   * .sound('sawtooth')
   * .hpf(500)
   * .hpa(.5)
   * .hpenv("<4 2 1 0 -1 -2 -4>/4")
   */`,meta:{filename:"controls.mjs",lineno:420,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the highpass filter envelope modulation depth.</p>",name:"hpenv",params:[{type:{names:["number","Pattern"]},description:"<p>depth of the highpass filter envelope between 0 and <em>n</em></p>",name:"modulation"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"hpe",value:"hpe"}],examples:[`note("<c2 e2 f2 g2>")
.sound('sawtooth')
.hpf(500)
.hpa(.5)
.hpenv("<4 2 1 0 -1 -2 -4>/4")`],longname:"hpenv",kind:"member",scope:"global"},{comment:`/**
   * Sets the bandpass filter envelope modulation depth.
   * @name bpenv
   * @param {number | Pattern} modulation depth of the bandpass filter envelope between 0 and _n_
   * @synonyms bpe
   * @example
   * note("<c2 e2 f2 g2>")
   * .sound('sawtooth')
   * .bpf(500)
   * .bpa(.5)
   * .bpenv("<4 2 1 0 -1 -2 -4>/4")
   */`,meta:{filename:"controls.mjs",lineno:433,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the bandpass filter envelope modulation depth.</p>",name:"bpenv",params:[{type:{names:["number","Pattern"]},description:"<p>depth of the bandpass filter envelope between 0 and <em>n</em></p>",name:"modulation"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"bpe",value:"bpe"}],examples:[`note("<c2 e2 f2 g2>")
.sound('sawtooth')
.bpf(500)
.bpa(.5)
.bpenv("<4 2 1 0 -1 -2 -4>/4")`],longname:"bpenv",kind:"member",scope:"global"},{comment:`/**
   * Sets the attack duration for the lowpass filter envelope.
   * @name lpattack
   * @param {number | Pattern} attack time of the filter envelope
   * @synonyms lpa
   * @example
   * note("<c2 e2 f2 g2>")
   * .sound('sawtooth')
   * .lpf(500)
   * .lpa("<.5 .25 .1 .01>/4")
   * .lpenv(4)
   */`,meta:{filename:"controls.mjs",lineno:446,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the attack duration for the lowpass filter envelope.</p>",name:"lpattack",params:[{type:{names:["number","Pattern"]},description:"<p>time of the filter envelope</p>",name:"attack"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"lpa",value:"lpa"}],examples:[`note("<c2 e2 f2 g2>")
.sound('sawtooth')
.lpf(500)
.lpa("<.5 .25 .1 .01>/4")
.lpenv(4)`],longname:"lpattack",kind:"member",scope:"global"},{comment:`/**
   * Sets the attack duration for the highpass filter envelope.
   * @name hpattack
   * @param {number | Pattern} attack time of the highpass filter envelope
   * @synonyms hpa
   * @example
   * note("<c2 e2 f2 g2>")
   * .sound('sawtooth')
   * .hpf(500)
   * .hpa("<.5 .25 .1 .01>/4")
   * .hpenv(4)
   */`,meta:{filename:"controls.mjs",lineno:459,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the attack duration for the highpass filter envelope.</p>",name:"hpattack",params:[{type:{names:["number","Pattern"]},description:"<p>time of the highpass filter envelope</p>",name:"attack"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"hpa",value:"hpa"}],examples:[`note("<c2 e2 f2 g2>")
.sound('sawtooth')
.hpf(500)
.hpa("<.5 .25 .1 .01>/4")
.hpenv(4)`],longname:"hpattack",kind:"member",scope:"global"},{comment:`/**
   * Sets the attack duration for the bandpass filter envelope.
   * @name bpattack
   * @param {number | Pattern} attack time of the bandpass filter envelope
   * @synonyms bpa
   * @example
   * note("<c2 e2 f2 g2>")
   * .sound('sawtooth')
   * .bpf(500)
   * .bpa("<.5 .25 .1 .01>/4")
   * .bpenv(4)
   */`,meta:{filename:"controls.mjs",lineno:472,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the attack duration for the bandpass filter envelope.</p>",name:"bpattack",params:[{type:{names:["number","Pattern"]},description:"<p>time of the bandpass filter envelope</p>",name:"attack"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"bpa",value:"bpa"}],examples:[`note("<c2 e2 f2 g2>")
.sound('sawtooth')
.bpf(500)
.bpa("<.5 .25 .1 .01>/4")
.bpenv(4)`],longname:"bpattack",kind:"member",scope:"global"},{comment:`/**
   * Sets the decay duration for the lowpass filter envelope.
   * @name lpdecay
   * @param {number | Pattern} decay time of the filter envelope
   * @synonyms lpd
   * @example
   * note("<c2 e2 f2 g2>")
   * .sound('sawtooth')
   * .lpf(500)
   * .lpd("<.5 .25 .1 0>/4")
   * .lps(0.2)
   * .lpenv(4)
   */`,meta:{filename:"controls.mjs",lineno:485,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the decay duration for the lowpass filter envelope.</p>",name:"lpdecay",params:[{type:{names:["number","Pattern"]},description:"<p>time of the filter envelope</p>",name:"decay"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"lpd",value:"lpd"}],examples:[`note("<c2 e2 f2 g2>")
.sound('sawtooth')
.lpf(500)
.lpd("<.5 .25 .1 0>/4")
.lps(0.2)
.lpenv(4)`],longname:"lpdecay",kind:"member",scope:"global"},{comment:`/**
   * Sets the decay duration for the highpass filter envelope.
   * @name hpdecay
   * @param {number | Pattern} decay time of the highpass filter envelope
   * @synonyms hpd
   * @example
   * note("<c2 e2 f2 g2>")
   * .sound('sawtooth')
   * .hpf(500)
   * .hpd("<.5 .25 .1 0>/4")
   * .hps(0.2)
   * .hpenv(4)
   */`,meta:{filename:"controls.mjs",lineno:499,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the decay duration for the highpass filter envelope.</p>",name:"hpdecay",params:[{type:{names:["number","Pattern"]},description:"<p>time of the highpass filter envelope</p>",name:"decay"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"hpd",value:"hpd"}],examples:[`note("<c2 e2 f2 g2>")
.sound('sawtooth')
.hpf(500)
.hpd("<.5 .25 .1 0>/4")
.hps(0.2)
.hpenv(4)`],longname:"hpdecay",kind:"member",scope:"global"},{comment:`/**
   * Sets the decay duration for the bandpass filter envelope.
   * @name bpdecay
   * @param {number | Pattern} decay time of the bandpass filter envelope
   * @synonyms bpd
   * @example
   * note("<c2 e2 f2 g2>")
   * .sound('sawtooth')
   * .bpf(500)
   * .bpd("<.5 .25 .1 0>/4")
   * .bps(0.2)
   * .bpenv(4)
   */`,meta:{filename:"controls.mjs",lineno:513,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the decay duration for the bandpass filter envelope.</p>",name:"bpdecay",params:[{type:{names:["number","Pattern"]},description:"<p>time of the bandpass filter envelope</p>",name:"decay"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"bpd",value:"bpd"}],examples:[`note("<c2 e2 f2 g2>")
.sound('sawtooth')
.bpf(500)
.bpd("<.5 .25 .1 0>/4")
.bps(0.2)
.bpenv(4)`],longname:"bpdecay",kind:"member",scope:"global"},{comment:`/**
   * Sets the sustain amplitude for the lowpass filter envelope.
   * @name lpsustain
   * @param {number | Pattern} sustain amplitude of the lowpass filter envelope
   * @synonyms lps
   * @example
   * note("<c2 e2 f2 g2>")
   * .sound('sawtooth')
   * .lpf(500)
   * .lpd(.5)
   * .lps("<0 .25 .5 1>/4")
   * .lpenv(4)
   */`,meta:{filename:"controls.mjs",lineno:527,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the sustain amplitude for the lowpass filter envelope.</p>",name:"lpsustain",params:[{type:{names:["number","Pattern"]},description:"<p>amplitude of the lowpass filter envelope</p>",name:"sustain"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"lps",value:"lps"}],examples:[`note("<c2 e2 f2 g2>")
.sound('sawtooth')
.lpf(500)
.lpd(.5)
.lps("<0 .25 .5 1>/4")
.lpenv(4)`],longname:"lpsustain",kind:"member",scope:"global"},{comment:`/**
   * Sets the sustain amplitude for the highpass filter envelope.
   * @name hpsustain
   * @param {number | Pattern} sustain amplitude of the highpass filter envelope
   * @synonyms hps
   * @example
   * note("<c2 e2 f2 g2>")
   * .sound('sawtooth')
   * .hpf(500)
   * .hpd(.5)
   * .hps("<0 .25 .5 1>/4")
   * .hpenv(4)
   */`,meta:{filename:"controls.mjs",lineno:541,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the sustain amplitude for the highpass filter envelope.</p>",name:"hpsustain",params:[{type:{names:["number","Pattern"]},description:"<p>amplitude of the highpass filter envelope</p>",name:"sustain"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"hps",value:"hps"}],examples:[`note("<c2 e2 f2 g2>")
.sound('sawtooth')
.hpf(500)
.hpd(.5)
.hps("<0 .25 .5 1>/4")
.hpenv(4)`],longname:"hpsustain",kind:"member",scope:"global"},{comment:`/**
   * Sets the sustain amplitude for the bandpass filter envelope.
   * @name bpsustain
   * @param {number | Pattern} sustain amplitude of the bandpass filter envelope
   * @synonyms bps
   * @example
   * note("<c2 e2 f2 g2>")
   * .sound('sawtooth')
   * .bpf(500)
   * .bpd(.5)
   * .bps("<0 .25 .5 1>/4")
   * .bpenv(4)
   */`,meta:{filename:"controls.mjs",lineno:555,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the sustain amplitude for the bandpass filter envelope.</p>",name:"bpsustain",params:[{type:{names:["number","Pattern"]},description:"<p>amplitude of the bandpass filter envelope</p>",name:"sustain"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"bps",value:"bps"}],examples:[`note("<c2 e2 f2 g2>")
.sound('sawtooth')
.bpf(500)
.bpd(.5)
.bps("<0 .25 .5 1>/4")
.bpenv(4)`],longname:"bpsustain",kind:"member",scope:"global"},{comment:`/**
   * Sets the release time for the lowpass filter envelope.
   * @name lprelease
   * @param {number | Pattern} release time of the filter envelope
   * @synonyms lpr
   * @example
   * note("<c2 e2 f2 g2>")
   * .sound('sawtooth')
   * .clip(.5)
   * .lpf(500)
   * .lpenv(4)
   * .lpr("<.5 .25 .1 0>/4")
   * .release(.5)
   */`,meta:{filename:"controls.mjs",lineno:569,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the release time for the lowpass filter envelope.</p>",name:"lprelease",params:[{type:{names:["number","Pattern"]},description:"<p>time of the filter envelope</p>",name:"release"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"lpr",value:"lpr"}],examples:[`note("<c2 e2 f2 g2>")
.sound('sawtooth')
.clip(.5)
.lpf(500)
.lpenv(4)
.lpr("<.5 .25 .1 0>/4")
.release(.5)`],longname:"lprelease",kind:"member",scope:"global"},{comment:`/**
   * Sets the release time for the highpass filter envelope.
   * @name hprelease
   * @param {number | Pattern} release time of the highpass filter envelope
   * @synonyms hpr
   * @example
   * note("<c2 e2 f2 g2>")
   * .sound('sawtooth')
   * .clip(.5)
   * .hpf(500)
   * .hpenv(4)
   * .hpr("<.5 .25 .1 0>/4")
   * .release(.5)
   */`,meta:{filename:"controls.mjs",lineno:584,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the release time for the highpass filter envelope.</p>",name:"hprelease",params:[{type:{names:["number","Pattern"]},description:"<p>time of the highpass filter envelope</p>",name:"release"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"hpr",value:"hpr"}],examples:[`note("<c2 e2 f2 g2>")
.sound('sawtooth')
.clip(.5)
.hpf(500)
.hpenv(4)
.hpr("<.5 .25 .1 0>/4")
.release(.5)`],longname:"hprelease",kind:"member",scope:"global"},{comment:`/**
   * Sets the release time for the bandpass filter envelope.
   * @name bprelease
   * @param {number | Pattern} release time of the bandpass filter envelope
   * @synonyms bpr
   * @example
   * note("<c2 e2 f2 g2>")
   * .sound('sawtooth')
   * .clip(.5)
   * .bpf(500)
   * .bpenv(4)
   * .bpr("<.5 .25 .1 0>/4")
   * .release(.5)
   */`,meta:{filename:"controls.mjs",lineno:599,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the release time for the bandpass filter envelope.</p>",name:"bprelease",params:[{type:{names:["number","Pattern"]},description:"<p>time of the bandpass filter envelope</p>",name:"release"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"bpr",value:"bpr"}],examples:[`note("<c2 e2 f2 g2>")
.sound('sawtooth')
.clip(.5)
.bpf(500)
.bpenv(4)
.bpr("<.5 .25 .1 0>/4")
.release(.5)`],longname:"bprelease",kind:"member",scope:"global"},{comment:`/**
   * Sets the filter type. The 24db filter is more aggressive. More types might be added in the future.
   * @name ftype
   * @param {number | Pattern} type 12db (default) or 24db
   * @example
   * note("<c2 e2 f2 g2>")
   * .sound('sawtooth')
   * .lpf(500)
   * .bpenv(4)
   * .ftype("<12db 24db>")
   */`,meta:{filename:"controls.mjs",lineno:614,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the filter type. The 24db filter is more aggressive. More types might be added in the future.</p>",name:"ftype",params:[{type:{names:["number","Pattern"]},description:"<p>12db (default) or 24db</p>",name:"type"}],examples:[`note("<c2 e2 f2 g2>")
.sound('sawtooth')
.lpf(500)
.bpenv(4)
.ftype("<12db 24db>")`],longname:"ftype",kind:"member",scope:"global"},{comment:`/**
   * Applies the cutoff frequency of the **h**igh-**p**ass **f**ilter.
   *
   * When using mininotation, you can also optionally add the 'hpq' parameter, separated by ':'.
   *
   * @name hpf
   * @param {number | Pattern} frequency audible between 0 and 20000
   * @synonyms hp, hcutoff
   * @example
   * s("bd sd,hh*4").hpf("<4000 2000 1000 500 200 100>")
   * @example
   * s("bd sd,hh*4").hpf("<2000 2000:25>")
   *
   */`,meta:{filename:"controls.mjs",lineno:627,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Applies the cutoff frequency of the <strong>h</strong>igh-<strong>p</strong>ass <strong>f</strong>ilter.</p>
<p>When using mininotation, you can also optionally add the 'hpq' parameter, separated by ':'.</p>`,name:"hpf",params:[{type:{names:["number","Pattern"]},description:"<p>audible between 0 and 20000</p>",name:"frequency"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"hp, hcutoff",value:"hp, hcutoff"}],examples:['s("bd sd,hh*4").hpf("<4000 2000 1000 500 200 100>")','s("bd sd,hh*4").hpf("<2000 2000:25>")'],longname:"hpf",kind:"member",scope:"global"},{comment:`/**
   * Applies a vibrato to the frequency of the oscillator.
   *
   * @name vib
   * @synonyms vibrato, v
   * @param {number | Pattern} frequency of the vibrato in hertz
   * @example
   * note("a")
   * .vib("<.5 1 2 4 8 16>")
   * @example
   * // change the modulation depth with ":"
   * note("a")
   * .vib("<.5 1 2 4 8 16>:12")
   */`,meta:{filename:"controls.mjs",lineno:643,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Applies a vibrato to the frequency of the oscillator.</p>",name:"vib",tags:[{originalTitle:"synonyms",title:"synonyms",text:"vibrato, v",value:"vibrato, v"}],params:[{type:{names:["number","Pattern"]},description:"<p>of the vibrato in hertz</p>",name:"frequency"}],examples:[`note("a")
.vib("<.5 1 2 4 8 16>")`,`// change the modulation depth with ":"
note("a")
.vib("<.5 1 2 4 8 16>:12")`],longname:"vib",kind:"member",scope:"global"},{comment:`/**
   * Sets the vibrato depth in semitones. Only has an effect if \`vibrato\` | \`vib\` | \`v\` is is also set
   *
   * @name vibmod
   * @synonyms vmod
   * @param {number | Pattern} depth of vibrato (in semitones)
   * @example
   * note("a").vib(4)
   * .vibmod("<.25 .5 1 2 12>")
   * @example
   * // change the vibrato frequency with ":"
   * note("a")
   * .vibmod("<.25 .5 1 2 12>:8")
   */`,meta:{filename:"controls.mjs",lineno:658,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the vibrato depth in semitones. Only has an effect if <code>vibrato</code> | <code>vib</code> | <code>v</code> is is also set</p>",name:"vibmod",tags:[{originalTitle:"synonyms",title:"synonyms",text:"vmod",value:"vmod"}],params:[{type:{names:["number","Pattern"]},description:"<p>of vibrato (in semitones)</p>",name:"depth"}],examples:[`note("a").vib(4)
.vibmod("<.25 .5 1 2 12>")`,`// change the vibrato frequency with ":"
note("a")
.vibmod("<.25 .5 1 2 12>:8")`],longname:"vibmod",kind:"member",scope:"global"},{comment:`/**
   * Controls the **h**igh-**p**ass **q**-value.
   *
   * @name hpq
   * @param {number | Pattern} q resonance factor between 0 and 50
   * @synonyms hresonance
   * @example
   * s("bd sd,hh*4").hpf(2000).hpq("<0 10 20 30>")
   *
   */`,meta:{filename:"controls.mjs",lineno:674,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Controls the <strong>h</strong>igh-<strong>p</strong>ass <strong>q</strong>-value.</p>",name:"hpq",params:[{type:{names:["number","Pattern"]},description:"<p>resonance factor between 0 and 50</p>",name:"q"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"hresonance",value:"hresonance"}],examples:['s("bd sd,hh*4").hpf(2000).hpq("<0 10 20 30>")'],longname:"hpq",kind:"member",scope:"global"},{comment:`/**
   * Controls the **l**ow-**p**ass **q**-value.
   *
   * @name lpq
   * @param {number | Pattern} q resonance factor between 0 and 50
   * @synonyms resonance
   * @example
   * s("bd sd,hh*4").lpf(2000).lpq("<0 10 20 30>")
   *
   */`,meta:{filename:"controls.mjs",lineno:685,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Controls the <strong>l</strong>ow-<strong>p</strong>ass <strong>q</strong>-value.</p>",name:"lpq",params:[{type:{names:["number","Pattern"]},description:"<p>resonance factor between 0 and 50</p>",name:"q"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"resonance",value:"resonance"}],examples:['s("bd sd,hh*4").lpf(2000).lpq("<0 10 20 30>")'],longname:"lpq",kind:"member",scope:"global"},{comment:`/**
   * DJ filter, below 0.5 is low pass filter, above is high pass filter.
   *
   * @name djf
   * @param {number | Pattern} cutoff below 0.5 is low pass filter, above is high pass filter
   * @example
   * n("0 3 7 [10,24]").s('superzow').octave(3).djf("<.5 .25 .5 .75>").osc()
   *
   */`,meta:{filename:"controls.mjs",lineno:697,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>DJ filter, below 0.5 is low pass filter, above is high pass filter.</p>",name:"djf",params:[{type:{names:["number","Pattern"]},description:"<p>below 0.5 is low pass filter, above is high pass filter</p>",name:"cutoff"}],examples:[`n("0 3 7 [10,24]").s('superzow').octave(3).djf("<.5 .25 .5 .75>").osc()`],longname:"djf",kind:"member",scope:"global"},{comment:`/**
   * Sets the level of the delay signal.
   *
   * When using mininotation, you can also optionally add the 'delaytime' and 'delayfeedback' parameter,
   * separated by ':'.
   *
   *
   * @name delay
   * @param {number | Pattern} level between 0 and 1
   * @example
   * s("bd").delay("<0 .25 .5 1>")
   * @example
   * s("bd bd").delay("0.65:0.25:0.9 0.65:0.125:0.7")
   *
   */`,meta:{filename:"controls.mjs",lineno:709,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Sets the level of the delay signal.</p>
<p>When using mininotation, you can also optionally add the 'delaytime' and 'delayfeedback' parameter,
separated by ':'.</p>`,name:"delay",params:[{type:{names:["number","Pattern"]},description:"<p>between 0 and 1</p>",name:"level"}],examples:['s("bd").delay("<0 .25 .5 1>")','s("bd bd").delay("0.65:0.25:0.9 0.65:0.125:0.7")'],longname:"delay",kind:"member",scope:"global"},{comment:`/**
   * Sets the level of the signal that is fed back into the delay.
   * Caution: Values >= 1 will result in a signal that gets louder and louder! Don't do it
   *
   * @name delayfeedback
   * @param {number | Pattern} feedback between 0 and 1
   * @synonyms delayfb, dfb
   * @example
   * s("bd").delay(.25).delayfeedback("<.25 .5 .75 1>").slow(2)
   *
   */`,meta:{filename:"controls.mjs",lineno:725,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Sets the level of the signal that is fed back into the delay.
Caution: Values &gt;= 1 will result in a signal that gets louder and louder! Don't do it</p>`,name:"delayfeedback",params:[{type:{names:["number","Pattern"]},description:"<p>between 0 and 1</p>",name:"feedback"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"delayfb, dfb",value:"delayfb, dfb"}],examples:['s("bd").delay(.25).delayfeedback("<.25 .5 .75 1>").slow(2)'],longname:"delayfeedback",kind:"member",scope:"global"},{comment:`/**
   * Sets the time of the delay effect.
   *
   * @name delaytime
   * @param {number | Pattern} seconds between 0 and Infinity
   * @synonyms delayt, dt
   * @example
   * s("bd").delay(.25).delaytime("<.125 .25 .5 1>").slow(2)
   *
   */`,meta:{filename:"controls.mjs",lineno:737,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the time of the delay effect.</p>",name:"delaytime",params:[{type:{names:["number","Pattern"]},description:"<p>between 0 and Infinity</p>",name:"seconds"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"delayt, dt",value:"delayt, dt"}],examples:['s("bd").delay(.25).delaytime("<.125 .25 .5 1>").slow(2)'],longname:"delaytime",kind:"member",scope:"global"},{comment:`/**
   * Set detune of oscillators. Works only with some synths, see <a target="_blank" href="https://tidalcycles.org/docs/patternlib/tutorials/synthesizers">tidal doc</a>
   *
   * @name detune
   * @param {number | Pattern} amount between 0 and 1
   * @synonyms det
   * @superdirtOnly
   * @example
   * n("0 3 7").s('superzow').octave(3).detune("<0 .25 .5 1 2>").osc()
   *
   */`,meta:{filename:"controls.mjs",lineno:758,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:'<p>Set detune of oscillators. Works only with some synths, see <a target="_blank" href="https://tidalcycles.org/docs/patternlib/tutorials/synthesizers">tidal doc</a></p>',name:"detune",params:[{type:{names:["number","Pattern"]},description:"<p>between 0 and 1</p>",name:"amount"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"det",value:"det"},{originalTitle:"superdirtOnly",title:"superdirtonly",text:""}],examples:[`n("0 3 7").s('superzow').octave(3).detune("<0 .25 .5 1 2>").osc()`],longname:"detune",kind:"member",scope:"global"},{comment:`/**
   * Set dryness of reverb. See {@link room} and {@link size} for more information about reverb.
   *
   * @name dry
   * @param {number | Pattern} dry 0 = wet, 1 = dry
   * @example
   * n("[0,3,7](3,8)").s("superpiano").room(.7).dry("<0 .5 .75 1>").osc()
   * @superdirtOnly
   *
   */`,meta:{filename:"controls.mjs",lineno:770,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Set dryness of reverb. See {@link room} and {@link size} for more information about reverb.</p>",name:"dry",params:[{type:{names:["number","Pattern"]},description:"<p>0 = wet, 1 = dry</p>",name:"dry"}],examples:['n("[0,3,7](3,8)").s("superpiano").room(.7).dry("<0 .5 .75 1>").osc()'],tags:[{originalTitle:"superdirtOnly",title:"superdirtonly",text:""}],longname:"dry",kind:"member",scope:"global"},{comment:`/**
   * Set frequency of sound.
   *
   * @name freq
   * @param {number | Pattern} frequency in Hz. the audible range is between 20 and 20000 Hz
   * @example
   * freq("220 110 440 110").s("superzow").osc()
   * @example
   * freq("110".mul.out(".5 1.5 .6 [2 3]")).s("superzow").osc()
   *
   */`,meta:{filename:"controls.mjs",lineno:794,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Set frequency of sound.</p>",name:"freq",params:[{type:{names:["number","Pattern"]},description:"<p>in Hz. the audible range is between 20 and 20000 Hz</p>",name:"frequency"}],examples:['freq("220 110 440 110").s("superzow").osc()','freq("110".mul.out(".5 1.5 .6 [2 3]")).s("superzow").osc()'],longname:"freq",kind:"member",scope:"global"},{comment:`/**
   * Emulation of a Leslie speaker: speakers rotating in a wooden amplified cabinet.
   *
   * @name leslie
   * @param {number | Pattern} wet between 0 and 1
   * @example
   * n("0,4,7").s("supersquare").leslie("<0 .4 .6 1>").osc()
   * @superdirtOnly
   *
   */`,meta:{filename:"controls.mjs",lineno:817,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Emulation of a Leslie speaker: speakers rotating in a wooden amplified cabinet.</p>",name:"leslie",params:[{type:{names:["number","Pattern"]},description:"<p>between 0 and 1</p>",name:"wet"}],examples:['n("0,4,7").s("supersquare").leslie("<0 .4 .6 1>").osc()'],tags:[{originalTitle:"superdirtOnly",title:"superdirtonly",text:""}],longname:"leslie",kind:"member",scope:"global"},{comment:`/**
   * Rate of modulation / rotation for leslie effect
   *
   * @name lrate
   * @param {number | Pattern} rate 6.7 for fast, 0.7 for slow
   * @example
   * n("0,4,7").s("supersquare").leslie(1).lrate("<1 2 4 8>").osc()
   * @superdirtOnly
   *
   */`,meta:{filename:"controls.mjs",lineno:828,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Rate of modulation / rotation for leslie effect</p>",name:"lrate",params:[{type:{names:["number","Pattern"]},description:"<p>6.7 for fast, 0.7 for slow</p>",name:"rate"}],examples:['n("0,4,7").s("supersquare").leslie(1).lrate("<1 2 4 8>").osc()'],tags:[{originalTitle:"superdirtOnly",title:"superdirtonly",text:""}],longname:"lrate",kind:"member",scope:"global"},{comment:`/**
   * Physical size of the cabinet in meters. Be careful, it might be slightly larger than your computer. Affects the Doppler amount (pitch warble)
   *
   * @name lsize
   * @param {number | Pattern} meters somewhere between 0 and 1
   * @example
   * n("0,4,7").s("supersquare").leslie(1).lrate(2).lsize("<.1 .5 1>").osc()
   * @superdirtOnly
   *
   */`,meta:{filename:"controls.mjs",lineno:840,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Physical size of the cabinet in meters. Be careful, it might be slightly larger than your computer. Affects the Doppler amount (pitch warble)</p>",name:"lsize",params:[{type:{names:["number","Pattern"]},description:"<p>somewhere between 0 and 1</p>",name:"meters"}],examples:['n("0,4,7").s("supersquare").leslie(1).lrate(2).lsize("<.1 .5 1>").osc()'],tags:[{originalTitle:"superdirtOnly",title:"superdirtonly",text:""}],longname:"lsize",kind:"member",scope:"global"},{comment:`/**
   * Sets the default octave of a synth.
   *
   * @name octave
   * @param {number | Pattern} octave octave number
   * @example
   * n("0,4,7").s('supersquare').octave("<3 4 5 6>").osc()
   * @superDirtOnly
   */`,meta:{filename:"controls.mjs",lineno:876,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the default octave of a synth.</p>",name:"octave",params:[{type:{names:["number","Pattern"]},description:"<p>octave number</p>",name:"octave"}],examples:[`n("0,4,7").s('supersquare').octave("<3 4 5 6>").osc()`],tags:[{originalTitle:"superDirtOnly",title:"superdirtonly",text:""}],longname:"octave",kind:"member",scope:"global"},{comment:`/**
   * An \`orbit\` is a global parameter context for patterns. Patterns with the same orbit will share the same global effects.
   *
   * @name orbit
   * @param {number | Pattern} number
   * @example
   * stack(
   *   s("hh*3").delay(.5).delaytime(.25).orbit(1),
   *   s("~ sd").delay(.5).delaytime(.125).orbit(2)
   * )
   */`,meta:{filename:"controls.mjs",lineno:889,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>An <code>orbit</code> is a global parameter context for patterns. Patterns with the same orbit will share the same global effects.</p>",name:"orbit",params:[{type:{names:["number","Pattern"]},name:"number"}],examples:[`stack(
  s("hh*3").delay(.5).delaytime(.25).orbit(1),
  s("~ sd").delay(.5).delaytime(.125).orbit(2)
)`],longname:"orbit",kind:"member",scope:"global"},{comment:`/**
   * Sets position in stereo.
   *
   * @name pan
   * @param {number | Pattern} pan between 0 and 1, from left to right (assuming stereo), once round a circle (assuming multichannel)
   * @example
   * s("[bd hh]*2").pan("<.5 1 .5 0>")
   *
   */`,meta:{filename:"controls.mjs",lineno:903,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets position in stereo.</p>",name:"pan",params:[{type:{names:["number","Pattern"]},description:"<p>between 0 and 1, from left to right (assuming stereo), once round a circle (assuming multichannel)</p>",name:"pan"}],examples:['s("[bd hh]*2").pan("<.5 1 .5 0>")'],longname:"pan",kind:"member",scope:"global"},{comment:`/**
   * Sets the level of reverb.
   *
   * When using mininotation, you can also optionally add the 'size' parameter, separated by ':'.
   *
   * @name room
   * @param {number | Pattern} level between 0 and 1
   * @example
   * s("bd sd").room("<0 .2 .4 .6 .8 1>")
   * @example
   * s("bd sd").room("<0.9:1 0.9:4>")
   *
   */`,meta:{filename:"controls.mjs",lineno:959,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Sets the level of reverb.</p>
<p>When using mininotation, you can also optionally add the 'size' parameter, separated by ':'.</p>`,name:"room",params:[{type:{names:["number","Pattern"]},description:"<p>between 0 and 1</p>",name:"level"}],examples:['s("bd sd").room("<0 .2 .4 .6 .8 1>")','s("bd sd").room("<0.9:1 0.9:4>")'],longname:"room",kind:"member",scope:"global"},{comment:`/**
   * Sets the room size of the reverb, see {@link room}.
   *
   * @name roomsize
   * @param {number | Pattern} size between 0 and 10
   * @synonyms size, sz
   * @example
   * s("bd sd").room(.8).roomsize("<0 1 2 4 8>")
   *
   */`,meta:{filename:"controls.mjs",lineno:973,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the room size of the reverb, see {@link room}.</p>",name:"roomsize",params:[{type:{names:["number","Pattern"]},description:"<p>between 0 and 10</p>",name:"size"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"size, sz",value:"size, sz"}],examples:['s("bd sd").room(.8).roomsize("<0 1 2 4 8>")'],longname:"roomsize",kind:"member",scope:"global"},{comment:`/**
   * Wave shaping distortion. CAUTION: it might get loud
   *
   * @name shape
   * @param {number | Pattern} distortion between 0 and 1
   * @example
   * s("bd sd,hh*4").shape("<0 .2 .4 .6 .8>")
   *
   */`,meta:{filename:"controls.mjs",lineno:991,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Wave shaping distortion. CAUTION: it might get loud</p>",name:"shape",params:[{type:{names:["number","Pattern"]},description:"<p>between 0 and 1</p>",name:"distortion"}],examples:['s("bd sd,hh*4").shape("<0 .2 .4 .6 .8>")'],longname:"shape",kind:"member",scope:"global"},{comment:`/**
   * Changes the speed of sample playback, i.e. a cheap way of changing pitch.
   *
   * @name speed
   * @param {number | Pattern} speed -inf to inf, negative numbers play the sample backwards.
   * @example
   * s("bd").speed("<1 2 4 1 -2 -4>")
   * @example
   * speed("1 1.5*2 [2 1.1]").s("piano").clip(1)
   *
   */`,meta:{filename:"controls.mjs",lineno:1001,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Changes the speed of sample playback, i.e. a cheap way of changing pitch.</p>",name:"speed",params:[{type:{names:["number","Pattern"]},description:"<p>inf to inf, negative numbers play the sample backwards.</p>",name:"speed"}],examples:['s("bd").speed("<1 2 4 1 -2 -4>")','speed("1 1.5*2 [2 1.1]").s("piano").clip(1)'],longname:"speed",kind:"member",scope:"global"},{comment:'/**\n   * Used in conjunction with {@link speed}, accepts values of "r" (rate, default behavior), "c" (cycles), or "s" (seconds). Using `unit "c"` means `speed` will be interpreted in units of cycles, e.g. `speed "1"` means samples will be stretched to fill a cycle. Using `unit "s"` means the playback speed will be adjusted so that the duration is the number of seconds specified by `speed`.\n   *\n   * @name unit\n   * @param {number | string | Pattern} unit see description above\n   * @example\n   * speed("1 2 .5 3").s("bd").unit("c").osc()\n   * @superdirtOnly\n   *\n   */',meta:{filename:"controls.mjs",lineno:1013,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Used in conjunction with {@link speed}, accepts values of &quot;r&quot; (rate, default behavior), &quot;c&quot; (cycles), or &quot;s&quot; (seconds). Using <code>unit &quot;c&quot;</code> means <code>speed</code> will be interpreted in units of cycles, e.g. <code>speed &quot;1&quot;</code> means samples will be stretched to fill a cycle. Using <code>unit &quot;s&quot;</code> means the playback speed will be adjusted so that the duration is the number of seconds specified by <code>speed</code>.</p>",name:"unit",params:[{type:{names:["number","string","Pattern"]},description:"<p>see description above</p>",name:"unit"}],examples:['speed("1 2 .5 3").s("bd").unit("c").osc()'],tags:[{originalTitle:"superdirtOnly",title:"superdirtonly",text:""}],longname:"unit",kind:"member",scope:"global"},{comment:`/**
   * Made by Calum Gunn. Reminiscent of some weird mixture of filter, ring-modulator and pitch-shifter. The SuperCollider manual defines Squiz as:
   *
   * "A simplistic pitch-raising algorithm. It's not meant to sound natural; its sound is reminiscent of some weird mixture of filter, ring-modulator and pitch-shifter, depending on the input. The algorithm works by cutting the signal into fragments (delimited by upwards-going zero-crossings) and squeezing those fragments in the time domain (i.e. simply playing them back faster than they came in), leaving silences inbetween. All the parameters apart from memlen can be modulated."
   *
   * @name squiz
   * @param {number | Pattern} squiz Try passing multiples of 2 to it - 2, 4, 8 etc.
   * @example
   * squiz("2 4/2 6 [8 16]").s("bd").osc()
   * @superdirtOnly
   *
   */`,meta:{filename:"controls.mjs",lineno:1024,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Made by Calum Gunn. Reminiscent of some weird mixture of filter, ring-modulator and pitch-shifter. The SuperCollider manual defines Squiz as:</p>
<p>&quot;A simplistic pitch-raising algorithm. It's not meant to sound natural; its sound is reminiscent of some weird mixture of filter, ring-modulator and pitch-shifter, depending on the input. The algorithm works by cutting the signal into fragments (delimited by upwards-going zero-crossings) and squeezing those fragments in the time domain (i.e. simply playing them back faster than they came in), leaving silences inbetween. All the parameters apart from memlen can be modulated.&quot;</p>`,name:"squiz",params:[{type:{names:["number","Pattern"]},description:"<p>Try passing multiples of 2 to it - 2, 4, 8 etc.</p>",name:"squiz"}],examples:['squiz("2 4/2 6 [8 16]").s("bd").osc()'],tags:[{originalTitle:"superdirtOnly",title:"superdirtonly",text:""}],longname:"squiz",kind:"member",scope:"global"},{comment:`/**
   *
   * Formant filter to make things sound like vowels.
   *
   * @name vowel
   * @param {string | Pattern} vowel You can use a e i o u.
   * @example
   * note("c2 <eb2 <g2 g1>>").s('sawtooth')
   * .vowel("<a e i <o u>>")
   *
   */`,meta:{filename:"controls.mjs",lineno:1045,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Formant filter to make things sound like vowels.</p>",name:"vowel",params:[{type:{names:["string","Pattern"]},description:"<p>You can use a e i o u.</p>",name:"vowel"}],examples:[`note("c2 <eb2 <g2 g1>>").s('sawtooth')
.vowel("<a e i <o u>>")`],longname:"vowel",kind:"member",scope:"global"},{comment:`/**
   * Multiplies the duration with the given number. Also cuts samples off at the end if they exceed the duration.
   * In tidal, this would be done with legato, [which has a complicated history in strudel](https://github.com/tidalcycles/strudel/issues/111).
   * For now, if you're coming from tidal, just think clip = legato.
   *
   * @name clip
   * @param {number | Pattern} factor >= 0
   * @example
   * note("c a f e").s("piano").clip("<.5 1 2>")
   *
   */`,meta:{filename:"controls.mjs",lineno:1135,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Multiplies the duration with the given number. Also cuts samples off at the end if they exceed the duration.
In tidal, this would be done with legato, <a href="https://github.com/tidalcycles/strudel/issues/111">which has a complicated history in strudel</a>.
For now, if you're coming from tidal, just think clip = legato.</p>`,name:"clip",params:[{type:{names:["number","Pattern"]},description:`<blockquote>
<p>= 0</p>
</blockquote>`,name:"factor"}],examples:['note("c a f e").s("piano").clip("<.5 1 2>")'],longname:"clip",kind:"member",scope:"global"},{comment:`/**
 * Intended for a debugging, drawLine renders the pattern as a string, where each character represents the same time span.
 * Should only be used with single characters as values, otherwise the character slots will be messed up.
 * Character legend:
 *
 * - "|" cycle separator
 * - "-" hold previous value
 * - "." silence
 *
 * @param {Pattern} pattern the pattern to use
 * @param {number} chars max number of characters (approximately)
 * @returns string
 * @example
 * const line = drawLine("0 [1 2 3]", 10); // |0--123|0--123
 * console.log(line);
 * silence;
 */`,meta:{range:[1426,2796],filename:"drawLine.mjs",lineno:26,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100004462",name:"drawLine",type:"FunctionDeclaration",paramnames:["pat","chars"]},vars:{cycle:"drawLine~cycle",pos:"drawLine~pos",lines:"drawLine~lines",emptyLine:"drawLine~emptyLine",haps:"drawLine~haps",durations:"drawLine~durations","":null,charFraction:"drawLine~charFraction",totalSlots:"drawLine~totalSlots",i:"drawLine~i",undefined:null,matches:"drawLine~matches",missingLines:"drawLine~missingLines"}},description:`<p>Intended for a debugging, drawLine renders the pattern as a string, where each character represents the same time span.
Should only be used with single characters as values, otherwise the character slots will be messed up.
Character legend:</p>
<ul>
<li>&quot;|&quot; cycle separator</li>
<li>&quot;-&quot; hold previous value</li>
<li>&quot;.&quot; silence</li>
</ul>`,params:[{type:{names:["Pattern"]},description:"<p>the pattern to use</p>",name:"pattern"},{type:{names:["number"]},description:"<p>max number of characters (approximately)</p>",name:"chars"}],returns:[{description:"<p>string</p>"}],examples:[`const line = drawLine("0 [1 2 3]", 10); // |0--123|0--123
console.log(line);
silence;`],name:"drawLine",longname:"drawLine",kind:"function",scope:"global"},{comment:`/**
 * Changes the structure of the pattern to form an euclidean rhythm.
 * Euclidian rhythms are rhythms obtained using the greatest common
 * divisor of two numbers.  They were described in 2004 by Godfried
 * Toussaint, a canadian computer scientist.  Euclidian rhythms are
 * really useful for computer/algorithmic music because they can
 * describe a large number of rhythms with a couple of numbers.
 *
 * @memberof Pattern
 * @name euclid
 * @param {number} pulses the number of onsets / beats
 * @param {number} steps the number of steps to fill
 * @returns Pattern
 * @example
 * // The Cuban tresillo pattern.
 * note("c3").euclid(3,8)
 */`,meta:{filename:"euclid.mjs",lineno:51,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Changes the structure of the pattern to form an euclidean rhythm.
Euclidian rhythms are rhythms obtained using the greatest common
divisor of two numbers.  They were described in 2004 by Godfried
Toussaint, a canadian computer scientist.  Euclidian rhythms are
really useful for computer/algorithmic music because they can
describe a large number of rhythms with a couple of numbers.</p>`,memberof:"Pattern",name:"euclid",params:[{type:{names:["number"]},description:"<p>the number of onsets / beats</p>",name:"pulses"},{type:{names:["number"]},description:"<p>the number of steps to fill</p>",name:"steps"}],returns:[{description:"<p>Pattern</p>"}],examples:[`// The Cuban tresillo pattern.
note("c3").euclid(3,8)`],scope:"static",longname:"Pattern.euclid",kind:"member"},{comment:`/**
 * Like \`euclid\`, but has an additional parameter for 'rotating' the resulting sequence.
 * @memberof Pattern
 * @name euclidRot
 * @param {number} pulses the number of onsets / beats
 * @param {number} steps the number of steps to fill
 * @param {number} rotation offset in steps
 * @returns Pattern
 * @example
 * // A Samba rhythm necklace from Brazil
 * note("c3").euclidRot(3,16,14)
 */`,meta:{filename:"euclid.mjs",lineno:69,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Like <code>euclid</code>, but has an additional parameter for 'rotating' the resulting sequence.</p>",memberof:"Pattern",name:"euclidRot",params:[{type:{names:["number"]},description:"<p>the number of onsets / beats</p>",name:"pulses"},{type:{names:["number"]},description:"<p>the number of steps to fill</p>",name:"steps"},{type:{names:["number"]},description:"<p>offset in steps</p>",name:"rotation"}],returns:[{description:"<p>Pattern</p>"}],examples:[`// A Samba rhythm necklace from Brazil
note("c3").euclidRot(3,16,14)`],scope:"static",longname:"Pattern.euclidRot",kind:"member"},{comment:`/**
 * @example // A thirteenth century Persian rhythm called Khafif-e-ramal.
 * note("c3").euclid(2,5)
 * @example // The archetypal pattern of the Cumbia from Colombia, as well as a Calypso rhythm from Trinidad.
 * note("c3").euclid(3,4)
 * @example // Another thirteenth century Persian rhythm by the name of Khafif-e-ramal, as well as a Rumanian folk-dance rhythm.
 * note("c3").euclidRot(3,5,2)
 * @example // A Ruchenitza rhythm used in a Bulgarian folk-dance.
 * note("c3").euclid(3,7)
 * @example // The Cuban tresillo pattern.
 * note("c3").euclid(3,8)
 * @example // Another Ruchenitza Bulgarian folk-dance rhythm.
 * note("c3").euclid(4,7)
 * @example // The Aksak rhythm of Turkey.
 * note("c3").euclid(4,9)
 * @example // The metric pattern used by Frank Zappa in his piece titled Outside Now.
 * note("c3").euclid(4,11)
 * @example // Yields the York-Samai pattern, a popular Arab rhythm.
 * note("c3").euclid(5,6)
 * @example // The Nawakhat pattern, another popular Arab rhythm.
 * note("c3").euclid(5,7)
 * @example // The Cuban cinquillo pattern.
 * note("c3").euclid(5,8)
 * @example // A popular Arab rhythm called Agsag-Samai.
 * note("c3").euclid(5,9)
 * @example // The metric pattern used by Moussorgsky in Pictures at an Exhibition.
 * note("c3").euclid(5,11)
 * @example // The Venda clapping pattern of a South African children’s song.
 * note("c3").euclid(5,12)
 * @example // The Bossa-Nova rhythm necklace of Brazil.
 * note("c3").euclid(5,16)
 * @example // A typical rhythm played on the Bendir (frame drum).
 * note("c3").euclid(7,8)
 * @example // A common West African bell pattern.
 * note("c3").euclid(7,12)
 * @example // A Samba rhythm necklace from Brazil.
 * note("c3").euclidRot(7,16,14)
 * @example // A rhythm necklace used in the Central African Republic.
 * note("c3").euclid(9,16)
 * @example // A rhythm necklace of the Aka Pygmies of Central Africa.
 * note("c3").euclidRot(11,24,14)
 * @example // Another rhythm necklace of the Aka Pygmies of the upper Sangha.
 * note("c3").euclidRot(13,24,5)
 */`,meta:{range:[5141,5293],filename:"euclid.mjs",lineno:127,columnno:6,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100004932",name:"_euclidRot",type:"FunctionExpression"},vars:{b:"_euclidRot~b"}},examples:[`// A thirteenth century Persian rhythm called Khafif-e-ramal.
note("c3").euclid(2,5)`,`// The archetypal pattern of the Cumbia from Colombia, as well as a Calypso rhythm from Trinidad.
note("c3").euclid(3,4)`,`// Another thirteenth century Persian rhythm by the name of Khafif-e-ramal, as well as a Rumanian folk-dance rhythm.
note("c3").euclidRot(3,5,2)`,`// A Ruchenitza rhythm used in a Bulgarian folk-dance.
note("c3").euclid(3,7)`,`// The Cuban tresillo pattern.
note("c3").euclid(3,8)`,`// Another Ruchenitza Bulgarian folk-dance rhythm.
note("c3").euclid(4,7)`,`// The Aksak rhythm of Turkey.
note("c3").euclid(4,9)`,`// The metric pattern used by Frank Zappa in his piece titled Outside Now.
note("c3").euclid(4,11)`,`// Yields the York-Samai pattern, a popular Arab rhythm.
note("c3").euclid(5,6)`,`// The Nawakhat pattern, another popular Arab rhythm.
note("c3").euclid(5,7)`,`// The Cuban cinquillo pattern.
note("c3").euclid(5,8)`,`// A popular Arab rhythm called Agsag-Samai.
note("c3").euclid(5,9)`,`// The metric pattern used by Moussorgsky in Pictures at an Exhibition.
note("c3").euclid(5,11)`,`// The Venda clapping pattern of a South African children’s song.
note("c3").euclid(5,12)`,`// The Bossa-Nova rhythm necklace of Brazil.
note("c3").euclid(5,16)`,`// A typical rhythm played on the Bendir (frame drum).
note("c3").euclid(7,8)`,`// A common West African bell pattern.
note("c3").euclid(7,12)`,`// A Samba rhythm necklace from Brazil.
note("c3").euclidRot(7,16,14)`,`// A rhythm necklace used in the Central African Republic.
note("c3").euclid(9,16)`,`// A rhythm necklace of the Aka Pygmies of Central Africa.
note("c3").euclidRot(11,24,14)`,`// Another rhythm necklace of the Aka Pygmies of the upper Sangha.
note("c3").euclidRot(13,24,5)`],name:"_euclidRot",longname:"_euclidRot",kind:"function",scope:"global",params:[]},{comment:`/**
 * Similar to \`euclid\`, but each pulse is held until the next pulse,
 * so there will be no gaps.
 * @name euclidLegato
 * @memberof Pattern
 * @example
 * n("g2").decay(.1).sustain(.3).euclidLegato(3,8)
 */`,meta:{filename:"euclid.mjs",lineno:143,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Similar to <code>euclid</code>, but each pulse is held until the next pulse,
so there will be no gaps.</p>`,name:"euclidLegato",memberof:"Pattern",examples:['n("g2").decay(.1).sustain(.3).euclidLegato(3,8)'],scope:"static",longname:"Pattern.euclidLegato",kind:"member"},{comment:"/** @class Class representing a pattern. */",meta:{range:[1532,25380],filename:"pattern.mjs",lineno:25,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100006864",name:"exports.Pattern",type:"ClassDeclaration"}},name:"Pattern",longname:"Pattern",kind:"class",classdesc:"<p>Class representing a pattern.</p>",scope:"global",description:"<p>Create a pattern. As an end user, you will most likely not create a Pattern directly.</p>",tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],memberof:"Pattern",params:[{type:{names:["function"]},description:"<p>The function that maps a {@link State} to an array of {@link Hap}.</p>",name:"query"}]},{comment:`/**
   * Returns a new pattern, with the function applied to the value of
   * each hap. It has the alias {@link Pattern#fmap}.
   * @synonyms fmap
   * @param {Function} func to to apply to the value
   * @returns Pattern
   * @example
   * "0 1 2".withValue(v => v + 10).log()
   */`,meta:{range:[2398,2507],filename:"pattern.mjs",lineno:49,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100006885",name:"Pattern#withValue",type:"MethodDefinition",paramnames:["func"]},vars:{"":null}},description:`<p>Returns a new pattern, with the function applied to the value of
each hap. It has the alias {@link Pattern#fmap}.</p>`,tags:[{originalTitle:"synonyms",title:"synonyms",text:"fmap",value:"fmap"}],params:[{type:{names:["function"]},description:"<p>to to apply to the value</p>",name:"func"}],returns:[{description:"<p>Pattern</p>"}],examples:['"0 1 2".withValue(v => v + 10).log()'],name:"withValue",longname:"Pattern#withValue",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * see {@link Pattern#withValue}
   * @noAutocomplete
   */`,meta:{range:[2579,2628],filename:"pattern.mjs",lineno:57,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100006910",name:"Pattern#fmap",type:"MethodDefinition",paramnames:["func"]},vars:{"":null}},description:"<p>see {@link Pattern#withValue}</p>",tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"fmap",longname:"Pattern#fmap",kind:"function",memberof:"Pattern",scope:"instance",params:[]},{comment:`/**
   * Assumes 'this' is a pattern of functions, and given a function to
   * resolve wholes, applies a given pattern of values to that
   * pattern of functions.
   * @param {Function} whole_func
   * @param {Function} func
   * @noAutocomplete
   * @returns Pattern
   */`,meta:{range:[2910,3652],filename:"pattern.mjs",lineno:70,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100006921",name:"Pattern#appWhole",type:"MethodDefinition",paramnames:["whole_func","pat_val"]},vars:{"":null}},description:`<p>Assumes 'this' is a pattern of functions, and given a function to
resolve wholes, applies a given pattern of values to that
pattern of functions.</p>`,params:[{type:{names:["function"]},name:"whole_func"},{type:{names:["function"]},name:"func"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],returns:[{description:"<p>Pattern</p>"}],name:"appWhole",longname:"Pattern#appWhole",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * When this method is called on a pattern of functions, it matches its haps
   * with those in the given pattern of values.  A new pattern is returned, with
   * each matching value applied to the corresponding function.
   *
   * In this \`_appBoth\` variant, where timespans of the function and value haps
   * are not the same but do intersect, the resulting hap has a timespan of the
   * intersection. This applies to both the part and the whole timespan.
   * @param {Pattern} pat_val
   * @noAutocomplete
   * @returns Pattern
   */`,meta:{range:[4203,4483],filename:"pattern.mjs",lineno:106,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100007028",name:"Pattern#appBoth",type:"MethodDefinition",paramnames:["pat_val"]},vars:{"":null}},description:`<p>When this method is called on a pattern of functions, it matches its haps
with those in the given pattern of values.  A new pattern is returned, with
each matching value applied to the corresponding function.</p>
<p>In this <code>_appBoth</code> variant, where timespans of the function and value haps
are not the same but do intersect, the resulting hap has a timespan of the
intersection. This applies to both the part and the whole timespan.</p>`,params:[{type:{names:["Pattern"]},name:"pat_val"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],returns:[{description:"<p>Pattern</p>"}],name:"appBoth",longname:"Pattern#appBoth",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * As with {@link Pattern#appBoth}, but the \`whole\` timespan is not the intersection,
   * but the timespan from the function of patterns that this method is called
   * on. In practice, this means that the pattern structure, including onsets,
   * are preserved from the pattern of functions (often referred to as the left
   * hand or inner pattern).
   * @param {Pattern} pat_val
   * @noAutocomplete
   * @returns Pattern
   */`,meta:{range:[4927,5671],filename:"pattern.mjs",lineno:127,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100007064",name:"Pattern#appLeft",type:"MethodDefinition",paramnames:["pat_val"]},vars:{"":null}},description:`<p>As with {@link Pattern#appBoth}, but the <code>whole</code> timespan is not the intersection,
but the timespan from the function of patterns that this method is called
on. In practice, this means that the pattern structure, including onsets,
are preserved from the pattern of functions (often referred to as the left
hand or inner pattern).</p>`,params:[{type:{names:["Pattern"]},name:"pat_val"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],returns:[{description:"<p>Pattern</p>"}],name:"appLeft",longname:"Pattern#appLeft",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * As with {@link Pattern#appLeft}, but \`whole\` timespans are instead taken from the
   * pattern of values, i.e. structure is preserved from the right hand/outer
   * pattern.
   * @param {Pattern} pat_val
   * @noAutocomplete
   * @returns Pattern
   */`,meta:{range:[5939,6684],filename:"pattern.mjs",lineno:158,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100007174",name:"Pattern#appRight",type:"MethodDefinition",paramnames:["pat_val"]},vars:{"":null}},description:`<p>As with {@link Pattern#appLeft}, but <code>whole</code> timespans are instead taken from the
pattern of values, i.e. structure is preserved from the right hand/outer
pattern.</p>`,params:[{type:{names:["Pattern"]},name:"pat_val"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],returns:[{description:"<p>Pattern</p>"}],name:"appRight",longname:"Pattern#appRight",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * Query haps inside the given time span.
   *
   * @param {Fraction | number} begin from time
   * @param {Fraction | number} end to time
   * @returns Hap[]
   * @example
   * const pattern = sequence('a', ['b', 'c'])
   * const haps = pattern.queryArc(0, 1)
   * console.log(haps)
   * silence
   * @noAutocomplete
   */`,meta:{range:[12110,12301],filename:"pattern.mjs",lineno:343,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100007792",name:"Pattern#queryArc",type:"MethodDefinition",paramnames:["begin","end"]},vars:{"":null}},description:"<p>Query haps inside the given time span.</p>",params:[{type:{names:["Fraction","number"]},description:"<p>from time</p>",name:"begin"},{type:{names:["Fraction","number"]},description:"<p>to time</p>",name:"end"}],returns:[{description:"<p>Hap[]</p>"}],examples:[`const pattern = sequence('a', ['b', 'c'])
const haps = pattern.queryArc(0, 1)
console.log(haps)
silence`],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"queryArc",longname:"Pattern#queryArc",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * Returns a new pattern, with queries split at cycle boundaries. This makes
   * some calculations easier to express, as all haps are then constrained to
   * happen within a cycle.
   * @returns Pattern
   * @noAutocomplete
   */`,meta:{range:[12545,12745],filename:"pattern.mjs",lineno:359,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100007824",name:"Pattern#splitQueries",type:"MethodDefinition",paramnames:[]},vars:{"":null}},description:`<p>Returns a new pattern, with queries split at cycle boundaries. This makes
some calculations easier to express, as all haps are then constrained to
happen within a cycle.</p>`,returns:[{description:"<p>Pattern</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"splitQueries",longname:"Pattern#splitQueries",kind:"function",memberof:"Pattern",scope:"instance",params:[]},{comment:`/**
   * Returns a new pattern, where the given function is applied to the query
   * timespan before passing it to the original pattern.
   * @param {Function} func the function to apply
   * @returns Pattern
   * @noAutocomplete
   */`,meta:{range:[12988,13082],filename:"pattern.mjs",lineno:374,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100007864",name:"Pattern#withQuerySpan",type:"MethodDefinition",paramnames:["func"]},vars:{"":null}},description:`<p>Returns a new pattern, where the given function is applied to the query
timespan before passing it to the original pattern.</p>`,params:[{type:{names:["function"]},description:"<p>the function to apply</p>",name:"func"}],returns:[{description:"<p>Pattern</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"withQuerySpan",longname:"Pattern#withQuerySpan",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * As with {@link Pattern#withQuerySpan}, but the function is applied to both the
   * begin and end time of the query timespan.
   * @param {Function} func the function to apply
   * @returns Pattern
   * @noAutocomplete
   */`,meta:{range:[13556,13675],filename:"pattern.mjs",lineno:396,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100007920",name:"Pattern#withQueryTime",type:"MethodDefinition",paramnames:["func"]},vars:{"":null}},description:`<p>As with {@link Pattern#withQuerySpan}, but the function is applied to both the
begin and end time of the query timespan.</p>`,params:[{type:{names:["function"]},description:"<p>the function to apply</p>",name:"func"}],returns:[{description:"<p>Pattern</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"withQueryTime",longname:"Pattern#withQueryTime",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * Similar to {@link Pattern#withQuerySpan}, but the function is applied to the timespans
   * of all haps returned by pattern queries (both \`part\` timespans, and where
   * present, \`whole\` timespans).
   * @param {Function} func
   * @returns Pattern
   * @noAutocomplete
   */`,meta:{range:[13967,14077],filename:"pattern.mjs",lineno:408,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100007945",name:"Pattern#withHapSpan",type:"MethodDefinition",paramnames:["func"]},vars:{"":null}},description:`<p>Similar to {@link Pattern#withQuerySpan}, but the function is applied to the timespans
of all haps returned by pattern queries (both <code>part</code> timespans, and where
present, <code>whole</code> timespans).</p>`,params:[{type:{names:["function"]},name:"func"}],returns:[{description:"<p>Pattern</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"withHapSpan",longname:"Pattern#withHapSpan",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * As with {@link Pattern#withHapSpan}, but the function is applied to both the
   * begin and end time of the hap timespans.
   * @param {Function} func the function to apply
   * @returns Pattern
   * @noAutocomplete
   */`,meta:{range:[14314,14397],filename:"pattern.mjs",lineno:419,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100007970",name:"Pattern#withHapTime",type:"MethodDefinition",paramnames:["func"]},vars:{"":null}},description:`<p>As with {@link Pattern#withHapSpan}, but the function is applied to both the
begin and end time of the hap timespans.</p>`,params:[{type:{names:["function"]},description:"<p>the function to apply</p>",name:"func"}],returns:[{description:"<p>Pattern</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"withHapTime",longname:"Pattern#withHapTime",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * Returns a new pattern with the given function applied to the list of haps returned by every query.
   * @param {Function} func
   * @returns Pattern
   * @noAutocomplete
   */`,meta:{range:[14588,14668],filename:"pattern.mjs",lineno:429,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100007987",name:"Pattern#withHaps",type:"MethodDefinition",paramnames:["func"]},vars:{"":null}},description:"<p>Returns a new pattern with the given function applied to the list of haps returned by every query.</p>",params:[{type:{names:["function"]},name:"func"}],returns:[{description:"<p>Pattern</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"withHaps",longname:"Pattern#withHaps",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * As with {@link Pattern#withHaps}, but applies the function to every hap, rather than every list of haps.
   * @param {Function} func
   * @returns Pattern
   * @noAutocomplete
   */`,meta:{range:[14865,14936],filename:"pattern.mjs",lineno:439,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100008004",name:"Pattern#withHap",type:"MethodDefinition",paramnames:["func"]},vars:{"":null}},description:"<p>As with {@link Pattern#withHaps}, but applies the function to every hap, rather than every list of haps.</p>",params:[{type:{names:["function"]},name:"func"}],returns:[{description:"<p>Pattern</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"withHap",longname:"Pattern#withHap",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * Returns a new pattern with the context field set to every hap set to the given value.
   * @param {*} context
   * @returns Pattern
   * @noAutocomplete
   */`,meta:{range:[15110,15194],filename:"pattern.mjs",lineno:449,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100008021",name:"Pattern#setContext",type:"MethodDefinition",paramnames:["context"]},vars:{"":null}},description:"<p>Returns a new pattern with the context field set to every hap set to the given value.</p>",params:[{type:{names:["*"]},name:"context"}],returns:[{description:"<p>Pattern</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"setContext",longname:"Pattern#setContext",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * Returns a new pattern with the given function applied to the context field of every hap.
   * @param {Function} func
   * @returns Pattern
   * @noAutocomplete
   */`,meta:{range:[15375,15467],filename:"pattern.mjs",lineno:459,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100008038",name:"Pattern#withContext",type:"MethodDefinition",paramnames:["func"]},vars:{"":null}},description:"<p>Returns a new pattern with the given function applied to the context field of every hap.</p>",params:[{type:{names:["function"]},name:"func"}],returns:[{description:"<p>Pattern</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"withContext",longname:"Pattern#withContext",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * Returns a new pattern with the context field of every hap set to an empty object.
   * @returns Pattern
   * @noAutocomplete
   */`,meta:{range:[15613,15687],filename:"pattern.mjs",lineno:468,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100008059",name:"Pattern#stripContext",type:"MethodDefinition",paramnames:[]},vars:{"":null}},description:"<p>Returns a new pattern with the context field of every hap set to an empty object.</p>",returns:[{description:"<p>Pattern</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"stripContext",longname:"Pattern#stripContext",kind:"function",memberof:"Pattern",scope:"instance",params:[]},{comment:`/**
   * Returns a new pattern with the given location information added to the
   * context of every hap.
   * @param {Number} start start offset
   * @param {Number} end end offset
   * @returns Pattern
   * @noAutocomplete
   */`,meta:{range:[15925,16165],filename:"pattern.mjs",lineno:480,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100008075",name:"Pattern#withLoc",type:"MethodDefinition",paramnames:["start","end"]},vars:{"":null}},description:`<p>Returns a new pattern with the given location information added to the
context of every hap.</p>`,params:[{type:{names:["Number"]},description:"<p>start offset</p>",name:"start"},{type:{names:["Number"]},description:"<p>end offset</p>",name:"end"}],returns:[{description:"<p>Pattern</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"withLoc",longname:"Pattern#withLoc",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * Returns a new Pattern, which only returns haps that meet the given test.
   * @param {Function} hap_test - a function which returns false for haps to be removed from the pattern
   * @returns Pattern
   * @noAutocomplete
   */`,meta:{range:[16407,16504],filename:"pattern.mjs",lineno:497,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100008116",name:"Pattern#filterHaps",type:"MethodDefinition",paramnames:["hap_test"]},vars:{"":null}},description:"<p>Returns a new Pattern, which only returns haps that meet the given test.</p>",params:[{type:{names:["function"]},description:"<p>a function which returns false for haps to be removed from the pattern</p>",name:"hap_test"}],returns:[{description:"<p>Pattern</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"filterHaps",longname:"Pattern#filterHaps",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * As with {@link Pattern#filterHaps}, but the function is applied to values
   * inside haps.
   * @param {Function} value_test
   * @returns Pattern
   * @noAutocomplete
   */`,meta:{range:[16694,16817],filename:"pattern.mjs",lineno:508,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100008135",name:"Pattern#filterValues",type:"MethodDefinition",paramnames:["value_test"]},vars:{"":null}},description:`<p>As with {@link Pattern#filterHaps}, but the function is applied to values
inside haps.</p>`,params:[{type:{names:["function"]},name:"value_test"}],returns:[{description:"<p>Pattern</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"filterValues",longname:"Pattern#filterValues",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * Returns a new pattern, with haps containing undefined values removed from
   * query results.
   * @returns Pattern
   * @noAutocomplete
   */`,meta:{range:[16975,17056],filename:"pattern.mjs",lineno:518,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100008160",name:"Pattern#removeUndefineds",type:"MethodDefinition",paramnames:[]},vars:{"":null}},description:`<p>Returns a new pattern, with haps containing undefined values removed from
query results.</p>`,returns:[{description:"<p>Pattern</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"removeUndefineds",longname:"Pattern#removeUndefineds",kind:"function",memberof:"Pattern",scope:"instance",params:[]},{comment:`/**
   * Returns a new pattern, with all haps without onsets filtered out. A hap
   * with an onset is one with a \`whole\` timespan that begins at the same time
   * as its \`part\` timespan.
   * @returns Pattern
   * @noAutocomplete
   */`,meta:{range:[17300,17565],filename:"pattern.mjs",lineno:529,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100008174",name:"Pattern#onsetsOnly",type:"MethodDefinition",paramnames:[]},vars:{"":null}},description:`<p>Returns a new pattern, with all haps without onsets filtered out. A hap
with an onset is one with a <code>whole</code> timespan that begins at the same time
as its <code>part</code> timespan.</p>`,returns:[{description:"<p>Pattern</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"onsetsOnly",longname:"Pattern#onsetsOnly",kind:"function",memberof:"Pattern",scope:"instance",params:[]},{comment:`/**
   * Returns a new pattern, with 'continuous' haps (those without 'whole'
   * timespans) removed from query results.
   * @returns Pattern
   * @noAutocomplete
   */`,meta:{range:[17742,17876],filename:"pattern.mjs",lineno:542,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100008189",name:"Pattern#discreteOnly",type:"MethodDefinition",paramnames:[]},vars:{"":null}},description:`<p>Returns a new pattern, with 'continuous' haps (those without 'whole'
timespans) removed from query results.</p>`,returns:[{description:"<p>Pattern</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"discreteOnly",longname:"Pattern#discreteOnly",kind:"function",memberof:"Pattern",scope:"instance",params:[]},{comment:`/**
   * Combines adjacent haps with the same value and whole.  Only
   * intended for use in tests.
   * @noAutocomplete
   */`,meta:{range:[18010,19455],filename:"pattern.mjs",lineno:552,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100008203",name:"Pattern#defragmentHaps",type:"MethodDefinition",paramnames:[]},vars:{"":null}},description:`<p>Combines adjacent haps with the same value and whole.  Only
intended for use in tests.</p>`,tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"defragmentHaps",longname:"Pattern#defragmentHaps",kind:"function",memberof:"Pattern",scope:"instance",params:[]},{comment:`/**
   * Queries the pattern for the first cycle, returning Haps. Mainly of use when
   * debugging a pattern.
   * @param {Boolean} with_context - set to true, otherwise the context field
   * will be stripped from the resulting haps.
   * @returns [Hap]
   * @noAutocomplete
   */`,meta:{range:[19744,19942],filename:"pattern.mjs",lineno:607,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100008434",name:"Pattern#firstCycle",type:"MethodDefinition",paramnames:["with_context"]},vars:{"":null}},description:`<p>Queries the pattern for the first cycle, returning Haps. Mainly of use when
debugging a pattern.</p>`,params:[{type:{names:["Boolean"]},description:`<p>set to true, otherwise the context field
will be stripped from the resulting haps.</p>`,name:"with_context",defaultvalue:!1}],returns:[{description:"<p>[Hap]</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"firstCycle",longname:"Pattern#firstCycle",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * Accessor for a list of values returned by querying the first cycle.
   * @noAutocomplete
   */`,meta:{range:[20052,20134],filename:"pattern.mjs",lineno:619,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100008471",name:"Pattern#firstCycleValues",type:"MethodDefinition",paramnames:[]},vars:{"":null}},description:"<p>Accessor for a list of values returned by querying the first cycle.</p>",tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"firstCycleValues",longname:"Pattern#firstCycleValues",kind:"member",memberof:"Pattern",scope:"instance",params:[]},{comment:`/**
   * More human-readable version of the {@link Pattern#firstCycleValues} accessor.
   * @noAutocomplete
   */`,meta:{range:[20254,20417],filename:"pattern.mjs",lineno:627,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100008488",name:"Pattern#showFirstCycle",type:"MethodDefinition",paramnames:[]},vars:{"":null}},description:"<p>More human-readable version of the {@link Pattern#firstCycleValues} accessor.</p>",tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"showFirstCycle",longname:"Pattern#showFirstCycle",kind:"member",memberof:"Pattern",scope:"instance",params:[]},{comment:`/**
   * Returns a new pattern, which returns haps sorted in temporal order. Mainly
   * of use when comparing two patterns for equality, in tests.
   * @returns Pattern
   * @noAutocomplete
   */`,meta:{range:[20620,20893],filename:"pattern.mjs",lineno:639,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100008526",name:"Pattern#sortHapsByPart",type:"MethodDefinition",paramnames:[]},vars:{"":null}},description:`<p>Returns a new pattern, which returns haps sorted in temporal order. Mainly
of use when comparing two patterns for equality, in tests.</p>`,returns:[{description:"<p>Pattern</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"sortHapsByPart",longname:"Pattern#sortHapsByPart",kind:"function",memberof:"Pattern",scope:"instance",params:[]},{comment:`/**
   * Layers the result of the given function(s). Like {@link Pattern.superimpose}, but without the original pattern:
   * @name layer
   * @memberof Pattern
   * @synonyms apply
   * @returns Pattern
   * @example
   * "<0 2 4 6 ~ 4 ~ 2 0!3 ~!5>*4"
   *   .layer(x=>x.add("0,2"))
   *   .scale('C minor').note()
   */`,meta:{filename:"pattern.mjs",lineno:693,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Layers the result of the given function(s). Like {@link Pattern.superimpose}, but without the original pattern:</p>",name:"layer",memberof:"Pattern",tags:[{originalTitle:"synonyms",title:"synonyms",text:"apply",value:"apply"}],returns:[{description:"<p>Pattern</p>"}],examples:[`"<0 2 4 6 ~ 4 ~ 2 0!3 ~!5>*4"
  .layer(x=>x.add("0,2"))
  .scale('C minor').note()`],scope:"static",longname:"Pattern.layer",kind:"member"},{comment:`/**
   * Superimposes the result of the given function(s) on top of the original pattern:
   * @name superimpose
   * @memberof Pattern
   * @returns Pattern
   * @example
   * "<0 2 4 6 ~ 4 ~ 2 0!3 ~!5>*4"
   *   .superimpose(x=>x.add(2))
   *   .scale('C minor').note()
   */`,meta:{filename:"pattern.mjs",lineno:708,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Superimposes the result of the given function(s) on top of the original pattern:</p>",name:"superimpose",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:[`"<0 2 4 6 ~ 4 ~ 2 0!3 ~!5>*4"
  .superimpose(x=>x.add(2))
  .scale('C minor').note()`],scope:"static",longname:"Pattern.superimpose",kind:"member"},{comment:`/**
   * Stacks the given pattern(s) to the current pattern.
   * @name stack
   * @memberof Pattern
   * @example
   * s("hh*2").stack(
   *   note("c2(3,8)")
   * )
   */`,meta:{filename:"pattern.mjs",lineno:725,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Stacks the given pattern(s) to the current pattern.</p>",name:"stack",memberof:"Pattern",examples:[`s("hh*2").stack(
  note("c2(3,8)")
)`],scope:"static",longname:"Pattern.stack",kind:"member"},{comment:`/**
   * Appends the given pattern(s) to the current pattern.
   * @name seq
   * @memberof Pattern
   * @synonyms sequence, fastcat
   * @example
   * s("hh*2").seq(
   *   note("c2(3,8)")
   * )
   */`,meta:{filename:"pattern.mjs",lineno:742,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Appends the given pattern(s) to the current pattern.</p>",name:"seq",memberof:"Pattern",tags:[{originalTitle:"synonyms",title:"synonyms",text:"sequence, fastcat",value:"sequence, fastcat"}],examples:[`s("hh*2").seq(
  note("c2(3,8)")
)`],scope:"static",longname:"Pattern.seq",kind:"member"},{comment:`/**
   * Appends the given pattern(s) to the next cycle.
   * @name cat
   * @memberof Pattern
   * @synonyms slowcat
   * @example
   * s("hh*2").cat(
   *   note("c2(3,8)")
   * )
   */`,meta:{filename:"pattern.mjs",lineno:756,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Appends the given pattern(s) to the next cycle.</p>",name:"cat",memberof:"Pattern",tags:[{originalTitle:"synonyms",title:"synonyms",text:"slowcat",value:"slowcat"}],examples:[`s("hh*2").cat(
  note("c2(3,8)")
)`],scope:"static",longname:"Pattern.cat",kind:"member"},{comment:`/**
 * Selects indices in in stacked notes.
 * @example
 * note("<[c,eb,g]!2 [c,f,ab] [d,f,ab]>")
 * .arpWith(haps => haps[2])
 * */`,meta:{range:[26350,26560],filename:"pattern.mjs",lineno:850,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100009147",name:"Pattern.prototype.arpWith",type:"FunctionExpression",paramnames:["func"]},vars:{"":null}},description:"<p>Selects indices in in stacked notes.</p>",examples:[`note("<[c,eb,g]!2 [c,f,ab] [d,f,ab]>")
.arpWith(haps => haps[2])`],name:"arpWith",longname:"Pattern#arpWith",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
 * Selects indices in in stacked notes.
 * @example
 * note("<[c,eb,g]!2 [c,f,ab] [d,f,ab]>")
 * .arp("0 [0,2] 1 [0,2]").slow(2)
 * */`,meta:{range:[26702,26817],filename:"pattern.mjs",lineno:863,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100009200",name:"Pattern.prototype.arp",type:"FunctionExpression",paramnames:["pat"]},vars:{"":null}},description:"<p>Selects indices in in stacked notes.</p>",examples:[`note("<[c,eb,g]!2 [c,f,ab] [d,f,ab]>")
.arp("0 [0,2] 1 [0,2]").slow(2)`],name:"arp",longname:"Pattern#arp",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
     *
     * Assumes a pattern of numbers. Adds the given number to each item in the pattern.
     * @name add
     * @memberof Pattern
     * @example
     * // Here, the triad 0, 2, 4 is shifted by different amounts
     * "0 2 4".add("<0 3 4 0>").scale('C major').note()
     * // Without add, the equivalent would be:
     * // "<[0 2 4] [3 5 7] [4 6 8] [0 2 4]>".scale('C major').note()
     * @example
     * // You can also use add with notes:
     * "c3 e3 g3".add("<0 5 7 0>").note()
     * // Behind the scenes, the notes are converted to midi numbers:
     * // "48 52 55".add("<0 5 7 0>").note()
     */`,meta:{filename:"pattern.mjs",lineno:925,columnno:4,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Assumes a pattern of numbers. Adds the given number to each item in the pattern.</p>",name:"add",memberof:"Pattern",examples:[`// Here, the triad 0, 2, 4 is shifted by different amounts
"0 2 4".add("<0 3 4 0>").scale('C major').note()
// Without add, the equivalent would be:
// "<[0 2 4] [3 5 7] [4 6 8] [0 2 4]>".scale('C major').note()`,`// You can also use add with notes:
"c3 e3 g3".add("<0 5 7 0>").note()
// Behind the scenes, the notes are converted to midi numbers:
// "48 52 55".add("<0 5 7 0>").note()`],scope:"static",longname:"Pattern.add",kind:"member"},{comment:`/**
     *
     * Like add, but the given numbers are subtracted.
     * @name sub
     * @memberof Pattern
     * @example
     * "0 2 4".sub("<0 1 2 3>").scale('C4 minor').note()
     * // See add for more information.
     */`,meta:{filename:"pattern.mjs",lineno:942,columnno:4,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Like add, but the given numbers are subtracted.</p>",name:"sub",memberof:"Pattern",examples:[`"0 2 4".sub("<0 1 2 3>").scale('C4 minor').note()
// See add for more information.`],scope:"static",longname:"Pattern.sub",kind:"member"},{comment:`/**
     *
     * Multiplies each number by the given factor.
     * @name mul
     * @memberof Pattern
     * @example
     * "1 1.5 [1.66, <2 2.33>]".mul(150).freq()
     */`,meta:{filename:"pattern.mjs",lineno:952,columnno:4,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Multiplies each number by the given factor.</p>",name:"mul",memberof:"Pattern",examples:['"1 1.5 [1.66, <2 2.33>]".mul(150).freq()'],scope:"static",longname:"Pattern.mul",kind:"member"},{comment:`/**
     *
     * Divides each number by the given factor.
     * @name div
     * @memberof Pattern
     */`,meta:{filename:"pattern.mjs",lineno:961,columnno:4,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Divides each number by the given factor.</p>",name:"div",memberof:"Pattern",scope:"static",longname:"Pattern.div",kind:"member"},{comment:`/**
   * Applies the given structure to the pattern:
   *
   * @example
   * note("c3,eb3,g3")
   *   .struct("x ~ x ~ ~ x ~ x ~ ~ ~ x ~ x ~ ~")
   *   .slow(4)
   */`,meta:{range:[32715,32803],filename:"pattern.mjs",lineno:1056,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100009726",name:"Pattern.prototype.struct",type:"FunctionExpression",paramnames:["args"]}},description:"<p>Applies the given structure to the pattern:</p>",examples:[`note("c3,eb3,g3")
  .struct("x ~ x ~ ~ x ~ x ~ ~ ~ x ~ x ~ ~")
  .slow(4)`],name:"struct",longname:"Pattern#struct",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * Returns silence when mask is 0 or "~"
   *
   * @example
   * note("c [eb,g] d [eb,g]").mask("<1 [0 1]>").slow(2)
   */`,meta:{range:[33031,33116],filename:"pattern.mjs",lineno:1068,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100009766",name:"Pattern.prototype.mask",type:"FunctionExpression",paramnames:["args"]}},description:"<p>Returns silence when mask is 0 or &quot;~&quot;</p>",examples:['note("c [eb,g] d [eb,g]").mask("<1 [0 1]>").slow(2)'],name:"mask",longname:"Pattern#mask",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * Resets the pattern to the start of the cycle for each onset of the reset pattern.
   *
   * @example
   * s("<bd lt> sd, hh*4").reset("<x@3 x(3,8)>")
   */`,meta:{range:[33377,33465],filename:"pattern.mjs",lineno:1080,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100009806",name:"Pattern.prototype.reset",type:"FunctionExpression",paramnames:["args"]}},description:"<p>Resets the pattern to the start of the cycle for each onset of the reset pattern.</p>",examples:['s("<bd lt> sd, hh*4").reset("<x@3 x(3,8)>")'],name:"reset",longname:"Pattern#reset",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
   * Restarts the pattern for each onset of the restart pattern.
   * While reset will only reset the current cycle, restart will start from cycle 0.
   *
   * @example
   * s("<bd lt> sd, hh*4").restart("<x@3 x(3,8)>")
   */`,meta:{range:[33794,33888],filename:"pattern.mjs",lineno:1093,columnno:2,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100009846",name:"Pattern.prototype.restart",type:"FunctionExpression",paramnames:["args"]}},description:`<p>Restarts the pattern for each onset of the restart pattern.
While reset will only reset the current cycle, restart will start from cycle 0.</p>`,examples:['s("<bd lt> sd, hh*4").restart("<x@3 x(3,8)>")'],name:"restart",longname:"Pattern#restart",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
 * Does absolutely nothing..
 * @name silence
 * @example
 * silence // "~"
 */`,meta:{filename:"pattern.mjs",lineno:1127,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Does absolutely nothing..</p>",name:"silence",examples:['silence // "~"'],longname:"silence",kind:"member",scope:"global"},{comment:`/** A discrete value that repeats once per cycle.
 *
 * @returns {Pattern}
 * @example
 * pure('e4') // "e4"
 * @noAutocomplete
 */`,meta:{range:[34813,35017],filename:"pattern.mjs",lineno:1142,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100009940",name:"exports.pure",type:"FunctionDeclaration",paramnames:["value"]}},description:"<p>A discrete value that repeats once per cycle.</p>",returns:[{type:{names:["Pattern"]}}],examples:[`pure('e4') // "e4"`],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"pure",longname:"pure",kind:"function",scope:"global"},{comment:`/** The given items are played at the same time at the same length.
 *
 * @return {Pattern}
 * @synonyms polyrhythm, pr
 * @example
 * stack(g3, b3, [e4, d4]).note() // "g3,b3,[e4,d4]".note()
 */`,meta:{range:[36167,36440],filename:"pattern.mjs",lineno:1183,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100010019",name:"exports.stack",type:"FunctionDeclaration",paramnames:["pats"]}},description:"<p>The given items are played at the same time at the same length.</p>",returns:[{type:{names:["Pattern"]}}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"polyrhythm, pr",value:"polyrhythm, pr"}],examples:['stack(g3, b3, [e4, d4]).note() // "g3,b3,[e4,d4]".note()'],name:"stack",longname:"stack",kind:"function",scope:"global"},{comment:`/** Concatenation: combines a list of patterns, switching between them successively, one per cycle:
 *
 * synonyms: {@link cat}
 *
 * @return {Pattern}
 * @example
 * slowcat(e5, b4, [d5, c5])
 *
 */`,meta:{range:[36642,37553],filename:"pattern.mjs",lineno:1199,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100010069",name:"exports.slowcat",type:"FunctionDeclaration",paramnames:["pats"]}},description:`<p>Concatenation: combines a list of patterns, switching between them successively, one per cycle:</p>
<p>synonyms: {@link cat}</p>`,returns:[{type:{names:["Pattern"]}}],examples:["slowcat(e5, b4, [d5, c5])"],name:"slowcat",longname:"slowcat",kind:"function",scope:"global"},{comment:`/** Concatenation: combines a list of patterns, switching between them successively, one per cycle. Unlike slowcat, this version will skip cycles.
 * @param {...any} items - The items to concatenate
 * @return {Pattern}
 */`,meta:{range:[37779,38152],filename:"pattern.mjs",lineno:1224,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100010196",name:"exports.slowcatPrime",type:"FunctionDeclaration",paramnames:["pats"]}},description:"<p>Concatenation: combines a list of patterns, switching between them successively, one per cycle. Unlike slowcat, this version will skip cycles.</p>",params:[{type:{names:["any"]},variable:!0,description:"<p>The items to concatenate</p>",name:"items"}],returns:[{type:{names:["Pattern"]}}],name:"slowcatPrime",longname:"slowcatPrime",kind:"function",scope:"global"},{comment:`/** The given items are con**cat**enated, where each one takes one cycle.
 *
 * @param {...any} items - The items to concatenate
 * @synonyms slowcat
 * @return {Pattern}
 * @example
 * cat(e5, b4, [d5, c5]).note() // "<e5 b4 [d5 c5]>".note()
 *
 */`,meta:{range:[38404,38463],filename:"pattern.mjs",lineno:1243,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100010249",name:"exports.cat",type:"FunctionDeclaration",paramnames:["pats"]}},description:"<p>The given items are con<strong>cat</strong>enated, where each one takes one cycle.</p>",params:[{type:{names:["any"]},variable:!0,description:"<p>The items to concatenate</p>",name:"items"}],tags:[{originalTitle:"synonyms",title:"synonyms",text:"slowcat",value:"slowcat"}],returns:[{type:{names:["Pattern"]}}],examples:['cat(e5, b4, [d5, c5]).note() // "<e5 b4 [d5 c5]>".note()'],name:"cat",longname:"cat",kind:"function",scope:"global"},{comment:`/** Like {@link Pattern.seq}, but each step has a length, relative to the whole.
 * @return {Pattern}
 * @example
 * timeCat([3,e3],[1, g3]).note() // "e3@3 g3".note()
 */`,meta:{range:[38637,38996],filename:"pattern.mjs",lineno:1252,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100010260",name:"exports.timeCat",type:"FunctionDeclaration",paramnames:["timepats"]}},description:"<p>Like {@link Pattern.seq}, but each step has a length, relative to the whole.</p>",returns:[{type:{names:["Pattern"]}}],examples:['timeCat([3,e3],[1, g3]).note() // "e3@3 g3".note()'],name:"timeCat",longname:"timeCat",kind:"function",scope:"global"},{comment:`/**
 * Allows to arrange multiple patterns together over multiple cycles.
 * Takes a variable number of arrays with two elements specifying the number of cycles and the pattern to use.
 *
 * @return {Pattern}
 * @example
 * arrange([4, "<c a f e>(3,8)"],[2, "<g a>(5,8)"]).note()
 */`,meta:{range:[39282,39516],filename:"pattern.mjs",lineno:1272,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100010346",name:"exports.arrange",type:"FunctionDeclaration",paramnames:["sections"]}},description:`<p>Allows to arrange multiple patterns together over multiple cycles.
Takes a variable number of arrays with two elements specifying the number of cycles and the pattern to use.</p>`,returns:[{type:{names:["Pattern"]}}],examples:['arrange([4, "<c a f e>(3,8)"],[2, "<g a>(5,8)"]).note()'],name:"arrange",longname:"arrange",kind:"function",scope:"global"},{comment:"/** See {@link fastcat} */",meta:{range:[39629,39693],filename:"pattern.mjs",lineno:1283,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100010408",name:"exports.sequence",type:"FunctionDeclaration",paramnames:["pats"]}},description:"<p>See {@link fastcat}</p>",name:"sequence",longname:"sequence",kind:"function",scope:"global"},{comment:`/** Like **cat**, but the items are crammed into one cycle.
 * @synonyms fastcat, sequence
 * @example
 * seq(e5, b4, [d5, c5]).note() // "e5 b4 [d5 c5]".note()
 *
 */`,meta:{range:[39863,39922],filename:"pattern.mjs",lineno:1293,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100010419",name:"exports.seq",type:"FunctionDeclaration",paramnames:["pats"]}},description:"<p>Like <strong>cat</strong>, but the items are crammed into one cycle.</p>",tags:[{originalTitle:"synonyms",title:"synonyms",text:"fastcat, sequence",value:"fastcat, sequence"}],examples:['seq(e5, b4, [d5, c5]).note() // "e5 b4 [d5 c5]".note()'],name:"seq",longname:"seq",kind:"function",scope:"global"},{comment:`/**
 * Aligns one or more given sequences to the given number of steps per cycle.
 *
 * @name polymeterSteps
 * @param  {number} steps how many items are placed in one cycle
 * @param  {any[]} sequences one or more arrays of Patterns / values
 * @example
 * polymeterSteps(2, ["c", "d", "e", "f", "g", "f", "e", "d"])
 * .note().stack(s("bd")) // 1 cycle = 1 bd = 2 notes
 * // note("{c d e f g f e d}%2").stack(s("bd"))
 */`,meta:{filename:"pattern.mjs",lineno:1309,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Aligns one or more given sequences to the given number of steps per cycle.</p>",name:"polymeterSteps",params:[{type:{names:["number"]},description:"<p>how many items are placed in one cycle</p>",name:"steps"},{type:{names:["Array.<any>"]},description:"<p>one or more arrays of Patterns / values</p>",name:"sequences"}],examples:[`polymeterSteps(2, ["c", "d", "e", "f", "g", "f", "e", "d"])
.note().stack(s("bd")) // 1 cycle = 1 bd = 2 notes
// note("{c d e f g f e d}%2").stack(s("bd"))`],longname:"polymeterSteps",kind:"member",scope:"global"},{comment:`/**
 * Combines the given lists of patterns with the same pulse. This will create so called polymeters when different sized sequences are used.
 * @synonyms pm
 * @example
 * polymeter(["c", "eb", "g"], ["c2", "g2"]).note()
 * // "{c eb g, c2 g2}".note()
 *
 */`,meta:{range:[41354,41429],filename:"pattern.mjs",lineno:1350,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100010592",name:"exports.polymeter",type:"FunctionDeclaration",paramnames:["args"]}},description:"<p>Combines the given lists of patterns with the same pulse. This will create so called polymeters when different sized sequences are used.</p>",tags:[{originalTitle:"synonyms",title:"synonyms",text:"pm",value:"pm"}],examples:[`polymeter(["c", "eb", "g"], ["c2", "g2"]).note()
// "{c eb g, c2 g2}".note()`],name:"polymeter",longname:"polymeter",kind:"function",scope:"global"},{comment:`/**
 * Registers a new pattern method. The method is added to the Pattern class + the standalone function is returned from register.
 *
 * @param {string} name name of the function
 * @param {function} func function with 1 or more params, where last is the current pattern
 * @noAutocomplete
 *
 */`,meta:{range:[43276,45254],filename:"pattern.mjs",lineno:1393,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100011053",name:"exports.register",type:"FunctionDeclaration",paramnames:["name","func","patternify"]}},description:"<p>Registers a new pattern method. The method is added to the Pattern class + the standalone function is returned from register.</p>",params:[{type:{names:["string"]},description:"<p>name of the function</p>",name:"name"},{type:{names:["function"]},description:"<p>function with 1 or more params, where last is the current pattern</p>",name:"func"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"register",longname:"register",kind:"function",scope:"global"},{comment:`/**
 * Assumes a numerical pattern. Returns a new pattern with all values rounded
 * to the nearest integer.
 * @name round
 * @memberof Pattern
 * @returns Pattern
 * @example
 * "0.5 1.5 2.5".round().scale('C major').note()
 */`,meta:{filename:"pattern.mjs",lineno:1459,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Assumes a numerical pattern. Returns a new pattern with all values rounded
to the nearest integer.</p>`,name:"round",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:[`"0.5 1.5 2.5".round().scale('C major').note()`],scope:"static",longname:"Pattern.round",kind:"member"},{comment:`/**
 * Assumes a numerical pattern. Returns a new pattern with all values set to
 * their mathematical floor. E.g. \`3.7\` replaced with to \`3\`, and \`-4.2\`
 * replaced with \`-5\`.
 * @name floor
 * @memberof Pattern
 * @returns Pattern
 * @example
 * "42 42.1 42.5 43".floor().note()
 */`,meta:{filename:"pattern.mjs",lineno:1472,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Assumes a numerical pattern. Returns a new pattern with all values set to
their mathematical floor. E.g. <code>3.7</code> replaced with to <code>3</code>, and <code>-4.2</code>
replaced with <code>-5</code>.</p>`,name:"floor",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:['"42 42.1 42.5 43".floor().note()'],scope:"static",longname:"Pattern.floor",kind:"member"},{comment:`/**
 * Assumes a numerical pattern. Returns a new pattern with all values set to
 * their mathematical ceiling. E.g. \`3.2\` replaced with \`4\`, and \`-4.2\`
 * replaced with \`-4\`.
 * @name ceil
 * @memberof Pattern
 * @returns Pattern
 * @example
 * "42 42.1 42.5 43".ceil().note()
 */`,meta:{filename:"pattern.mjs",lineno:1486,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Assumes a numerical pattern. Returns a new pattern with all values set to
their mathematical ceiling. E.g. <code>3.2</code> replaced with <code>4</code>, and <code>-4.2</code>
replaced with <code>-4</code>.</p>`,name:"ceil",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:['"42 42.1 42.5 43".ceil().note()'],scope:"static",longname:"Pattern.ceil",kind:"member"},{comment:`/**
 * Assumes a numerical pattern, containing unipolar values in the range 0 ..
 * 1. Returns a new pattern with values scaled to the bipolar range -1 .. 1
 * @returns Pattern
 * @noAutocomplete
 */`,meta:{range:[46689,46793],filename:"pattern.mjs",lineno:1505,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100011407",name:"exports.toBipolar",type:"VariableDeclaration"}},description:`<p>Assumes a numerical pattern, containing unipolar values in the range 0 ..</p>
<ol>
<li>Returns a new pattern with values scaled to the bipolar range -1 .. 1</li>
</ol>`,returns:[{description:"<p>Pattern</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"toBipolar",longname:"toBipolar",kind:"constant",scope:"global"},{comment:`/**
 * Assumes a numerical pattern, containing bipolar values in the range -1 .. 1
 * Returns a new pattern with values scaled to the unipolar range 0 .. 1
 * @returns Pattern
 * @noAutocomplete
 */`,meta:{range:[46994,47104],filename:"pattern.mjs",lineno:1515,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100011429",name:"exports.fromBipolar",type:"VariableDeclaration"}},description:`<p>Assumes a numerical pattern, containing bipolar values in the range -1 .. 1
Returns a new pattern with values scaled to the unipolar range 0 .. 1</p>`,returns:[{description:"<p>Pattern</p>"}],tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"fromBipolar",longname:"fromBipolar",kind:"constant",scope:"global"},{comment:`/**
 * Assumes a numerical pattern, containing unipolar values in the range 0 .. 1.
 * Returns a new pattern with values scaled to the given min/max range.
 * Most useful in combination with continuous patterns.
 * @name range
 * @memberof Pattern
 * @returns Pattern
 * @example
 * s("bd sd,hh*4").cutoff(sine.range(500,2000).slow(4))
 */`,meta:{filename:"pattern.mjs",lineno:1519,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Assumes a numerical pattern, containing unipolar values in the range 0 .. 1.
Returns a new pattern with values scaled to the given min/max range.
Most useful in combination with continuous patterns.</p>`,name:"range",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:['s("bd sd,hh*4").cutoff(sine.range(500,2000).slow(4))'],scope:"static",longname:"Pattern.range",kind:"member"},{comment:`/**
 * Assumes a numerical pattern, containing unipolar values in the range 0 .. 1
 * Returns a new pattern with values scaled to the given min/max range,
 * following an exponential curve.
 * @name rangex
 * @memberof Pattern
 * @returns Pattern
 * @example
 * s("bd sd,hh*4").cutoff(sine.rangex(500,2000).slow(4))
 */`,meta:{filename:"pattern.mjs",lineno:1533,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Assumes a numerical pattern, containing unipolar values in the range 0 .. 1
Returns a new pattern with values scaled to the given min/max range,
following an exponential curve.</p>`,name:"rangex",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:['s("bd sd,hh*4").cutoff(sine.rangex(500,2000).slow(4))'],scope:"static",longname:"Pattern.rangex",kind:"member"},{comment:`/**
 * Assumes a numerical pattern, containing bipolar values in the range -1 .. 1
 * Returns a new pattern with values scaled to the given min/max range.
 * @name range2
 * @memberof Pattern
 * @returns Pattern
 * @example
 * s("bd sd,hh*4").cutoff(sine2.range2(500,2000).slow(4))
 */`,meta:{filename:"pattern.mjs",lineno:1547,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Assumes a numerical pattern, containing bipolar values in the range -1 .. 1
Returns a new pattern with values scaled to the given min/max range.</p>`,name:"range2",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:['s("bd sd,hh*4").cutoff(sine2.range2(500,2000).slow(4))'],scope:"static",longname:"Pattern.range2",kind:"member"},{comment:`/**
 * Allows dividing numbers via list notation using ":".
 * Returns a new pattern with just numbers.
 * @name ratio
 * @memberof Pattern
 * @returns Pattern
 * @example
 * ratio("1, 5:4, 3:2").mul(110).freq().s("piano").slow(2)
 */`,meta:{filename:"pattern.mjs",lineno:1560,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Allows dividing numbers via list notation using &quot;:&quot;.
Returns a new pattern with just numbers.</p>`,name:"ratio",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:['ratio("1, 5:4, 3:2").mul(110).freq().s("piano").slow(2)'],scope:"static",longname:"Pattern.ratio",kind:"member"},{comment:`/** Compress each cycle into the given timespan, leaving a gap
 * @example
 * cat(
 *   s("bd sd").compress(.25,.75),
 *   s("~ bd sd ~")
 * )
 */`,meta:{range:[49101,49354],filename:"pattern.mjs",lineno:1588,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100011574",name:"exports.compress",type:"VariableDeclaration"}},description:"<p>Compress each cycle into the given timespan, leaving a gap</p>",examples:[`cat(
  s("bd sd").compress(.25,.75),
  s("~ bd sd ~")
)`],name:"compress",longname:"compress",kind:"constant",scope:"global"},{comment:`/**
 * speeds up a pattern like fast, but rather than it playing multiple times as fast would it instead leaves a gap in the remaining space of the cycle. For example, the following will play the sound pattern "bd sn" only once but compressed into the first half of the cycle, i.e. twice as fast.
 * @name fastGap
 * @synonyms fastgap
 * @example
 * s("bd sd").fastGap(2)
 */`,meta:{filename:"pattern.mjs",lineno:1601,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>speeds up a pattern like fast, but rather than it playing multiple times as fast would it instead leaves a gap in the remaining space of the cycle. For example, the following will play the sound pattern &quot;bd sn&quot; only once but compressed into the first half of the cycle, i.e. twice as fast.</p>",name:"fastGap",tags:[{originalTitle:"synonyms",title:"synonyms",text:"fastgap",value:"fastgap"}],examples:['s("bd sd").fastGap(2)'],longname:"fastGap",kind:"member",scope:"global"},{comment:`/**
 * Similar to compress, but doesn't leave gaps, and the 'focus' can be bigger than a cycle
 * @example
 * s("bd hh sd hh").focus(1/4, 3/4)
 */`,meta:{range:[51243,51412],filename:"pattern.mjs",lineno:1643,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100011916",name:"exports.focus",type:"VariableDeclaration"}},description:"<p>Similar to compress, but doesn't leave gaps, and the 'focus' can be bigger than a cycle</p>",examples:['s("bd hh sd hh").focus(1/4, 3/4)'],name:"focus",longname:"focus",kind:"constant",scope:"global"},{comment:`/** The ply function repeats each event the given number of times.
 * @example
 * s("bd ~ sd cp").ply("<1 2 3>")
 */`,meta:{range:[51679,51805],filename:"pattern.mjs",lineno:1657,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100011991",name:"exports.ply",type:"VariableDeclaration"}},description:"<p>The ply function repeats each event the given number of times.</p>",examples:['s("bd ~ sd cp").ply("<1 2 3>")'],name:"ply",longname:"ply",kind:"constant",scope:"global"},{comment:`/**
 * Speed up a pattern by the given factor. Used by "*" in mini notation.
 *
 * @name fast
 * @synonyms density
 * @memberof Pattern
 * @param {number | Pattern} factor speed up factor
 * @returns Pattern
 * @example
 * s("<bd sd> hh").fast(2) // s("[<bd sd> hh]*2")
 */`,meta:{filename:"pattern.mjs",lineno:1661,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Speed up a pattern by the given factor. Used by &quot;*&quot; in mini notation.</p>",name:"fast",tags:[{originalTitle:"synonyms",title:"synonyms",text:"density",value:"density"}],memberof:"Pattern",params:[{type:{names:["number","Pattern"]},description:"<p>speed up factor</p>",name:"factor"}],returns:[{description:"<p>Pattern</p>"}],examples:['s("<bd sd> hh").fast(2) // s("[<bd sd> hh]*2")'],scope:"static",longname:"Pattern.fast",kind:"member"},{comment:`/**
 * Both speeds up the pattern (like 'fast') and the sample playback (like 'speed').
 * @example
 * s("bd sd:2").hurry("<1 2 4 3>").slow(1.5)
 */`,meta:{range:[52513,52622],filename:"pattern.mjs",lineno:1686,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100012075",name:"exports.hurry",type:"VariableDeclaration"}},description:"<p>Both speeds up the pattern (like 'fast') and the sample playback (like 'speed').</p>",examples:['s("bd sd:2").hurry("<1 2 4 3>").slow(1.5)'],name:"hurry",longname:"hurry",kind:"constant",scope:"global"},{comment:`/**
 * Slow down a pattern over the given number of cycles. Like the "/" operator in mini notation.
 *
 * @name slow
 * @synonyms sparsity
 * @memberof Pattern
 * @param {number | Pattern} factor slow down factor
 * @returns Pattern
 * @example
 * s("<bd sd> hh").slow(2) // s("[<bd sd> hh]/2")
 */`,meta:{filename:"pattern.mjs",lineno:1690,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Slow down a pattern over the given number of cycles. Like the &quot;/&quot; operator in mini notation.</p>",name:"slow",tags:[{originalTitle:"synonyms",title:"synonyms",text:"sparsity",value:"sparsity"}],memberof:"Pattern",params:[{type:{names:["number","Pattern"]},description:"<p>slow down factor</p>",name:"factor"}],returns:[{description:"<p>Pattern</p>"}],examples:['s("<bd sd> hh").slow(2) // s("[<bd sd> hh]/2")'],scope:"static",longname:"Pattern.slow",kind:"member"},{comment:`/**
 * Carries out an operation 'inside' a cycle.
 * @example
 * "0 1 2 3 4 3 2 1".inside(4, rev).scale('C major').note()
 * // "0 1 2 3 4 3 2 1".slow(4).rev().fast(4).scale('C major').note()
 */`,meta:{range:[53305,53422],filename:"pattern.mjs",lineno:1714,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100012136",name:"exports.inside",type:"VariableDeclaration"}},description:"<p>Carries out an operation 'inside' a cycle.</p>",examples:[`"0 1 2 3 4 3 2 1".inside(4, rev).scale('C major').note()
// "0 1 2 3 4 3 2 1".slow(4).rev().fast(4).scale('C major').note()`],name:"inside",longname:"inside",kind:"constant",scope:"global"},{comment:`/**
 * Carries out an operation 'outside' a cycle.
 * @example
 * "<[0 1] 2 [3 4] 5>".outside(4, rev).scale('C major').note()
 * // "<[0 1] 2 [3 4] 5>".fast(4).rev().slow(4).scale('C major').note()
 */`,meta:{range:[53626,53745],filename:"pattern.mjs",lineno:1724,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100012160",name:"exports.outside",type:"VariableDeclaration"}},description:"<p>Carries out an operation 'outside' a cycle.</p>",examples:[`"<[0 1] 2 [3 4] 5>".outside(4, rev).scale('C major').note()
// "<[0 1] 2 [3 4] 5>".fast(4).rev().slow(4).scale('C major').note()`],name:"outside",longname:"outside",kind:"constant",scope:"global"},{comment:`/**
 * Applies the given function every n cycles, starting from the last cycle.
 * @name lastOf
 * @memberof Pattern
 * @param {number} n how many cycles
 * @param {function} func function to apply
 * @returns Pattern
 * @example
 * note("c3 d3 e3 g3").lastOf(4, x=>x.rev())
 */`,meta:{filename:"pattern.mjs",lineno:1728,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Applies the given function every n cycles, starting from the last cycle.</p>",name:"lastOf",memberof:"Pattern",params:[{type:{names:["number"]},description:"<p>how many cycles</p>",name:"n"},{type:{names:["function"]},description:"<p>function to apply</p>",name:"func"}],returns:[{description:"<p>Pattern</p>"}],examples:['note("c3 d3 e3 g3").lastOf(4, x=>x.rev())'],scope:"static",longname:"Pattern.lastOf",kind:"member"},{comment:`/**
 * Applies the given function every n cycles, starting from the first cycle.
 * @name firstOf
 * @memberof Pattern
 * @param {number} n how many cycles
 * @param {function} func function to apply
 * @returns Pattern
 * @example
 * note("c3 d3 e3 g3").firstOf(4, x=>x.rev())
 */`,meta:{filename:"pattern.mjs",lineno:1744,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Applies the given function every n cycles, starting from the first cycle.</p>",name:"firstOf",memberof:"Pattern",params:[{type:{names:["number"]},description:"<p>how many cycles</p>",name:"n"},{type:{names:["function"]},description:"<p>function to apply</p>",name:"func"}],returns:[{description:"<p>Pattern</p>"}],examples:['note("c3 d3 e3 g3").firstOf(4, x=>x.rev())'],scope:"static",longname:"Pattern.firstOf",kind:"member"},{comment:`/**
 * An alias for {@link firstOf}
 * @name every
 * @memberof Pattern
 * @param {number} n how many cycles
 * @param {function} func function to apply
 * @returns Pattern
 * @example
 * note("c3 d3 e3 g3").every(4, x=>x.rev())
 */`,meta:{filename:"pattern.mjs",lineno:1755,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>An alias for {@link firstOf}</p>",name:"every",memberof:"Pattern",params:[{type:{names:["number"]},description:"<p>how many cycles</p>",name:"n"},{type:{names:["function"]},description:"<p>function to apply</p>",name:"func"}],returns:[{description:"<p>Pattern</p>"}],examples:['note("c3 d3 e3 g3").every(4, x=>x.rev())'],scope:"static",longname:"Pattern.every",kind:"member"},{comment:`/**
 * Like layer, but with a single function:
 * @name apply
 * @memberof Pattern
 * @example
 * "<c3 eb3 g3>".scale('C minor').apply(scaleTranspose("0,2,4")).note()
 */`,meta:{filename:"pattern.mjs",lineno:1771,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Like layer, but with a single function:</p>",name:"apply",memberof:"Pattern",examples:[`"<c3 eb3 g3>".scale('C minor').apply(scaleTranspose("0,2,4")).note()`],scope:"static",longname:"Pattern.apply",kind:"member"},{comment:`/**
 * Plays the pattern at the given cycles per minute.
 * @example
 * s("<bd sd>,hh*2").cpm(90) // = 90 bpm
 */`,meta:{range:[55336,55426],filename:"pattern.mjs",lineno:1789,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100012279",name:"exports.cpm",type:"VariableDeclaration"}},description:"<p>Plays the pattern at the given cycles per minute.</p>",examples:['s("<bd sd>,hh*2").cpm(90) // = 90 bpm'],name:"cpm",longname:"cpm",kind:"constant",scope:"global"},{comment:`/**
 * Nudge a pattern to start earlier in time. Equivalent of Tidal's <~ operator
 *
 * @name early
 * @memberof Pattern
 * @param {number | Pattern} cycles number of cycles to nudge left
 * @returns Pattern
 * @example
 * "bd ~".stack("hh ~".early(.1)).s()
 */`,meta:{filename:"pattern.mjs",lineno:1793,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Nudge a pattern to start earlier in time. Equivalent of Tidal's &lt;~ operator</p>",name:"early",memberof:"Pattern",params:[{type:{names:["number","Pattern"]},description:"<p>number of cycles to nudge left</p>",name:"cycles"}],returns:[{description:"<p>Pattern</p>"}],examples:['"bd ~".stack("hh ~".early(.1)).s()'],scope:"static",longname:"Pattern.early",kind:"member"},{comment:`/**
 * Nudge a pattern to start later in time. Equivalent of Tidal's ~> operator
 *
 * @name late
 * @memberof Pattern
 * @param {number | Pattern} cycles number of cycles to nudge right
 * @returns Pattern
 * @example
 * "bd ~".stack("hh ~".late(.1)).s()
 */`,meta:{filename:"pattern.mjs",lineno:1808,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Nudge a pattern to start later in time. Equivalent of Tidal's ~&gt; operator</p>",name:"late",memberof:"Pattern",params:[{type:{names:["number","Pattern"]},description:"<p>number of cycles to nudge right</p>",name:"cycles"}],returns:[{description:"<p>Pattern</p>"}],examples:['"bd ~".stack("hh ~".late(.1)).s()'],scope:"static",longname:"Pattern.late",kind:"member"},{comment:`/**
 * Plays a portion of a pattern, specified by the beginning and end of a time span. The new resulting pattern is played over the time period of the original pattern:
 *
 * @example
 * s("bd*2 hh*3 [sd bd]*2 perc").zoom(0.25, 0.75)
 * // s("hh*3 [sd bd]*2") // equivalent
 */`,meta:{range:[56554,56847],filename:"pattern.mjs",lineno:1830,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100012366",name:"exports.zoom",type:"VariableDeclaration"}},description:"<p>Plays a portion of a pattern, specified by the beginning and end of a time span. The new resulting pattern is played over the time period of the original pattern:</p>",examples:[`s("bd*2 hh*3 [sd bd]*2 perc").zoom(0.25, 0.75)
// s("hh*3 [sd bd]*2") // equivalent`],name:"zoom",longname:"zoom",kind:"constant",scope:"global"},{comment:`/**
 * Selects the given fraction of the pattern and repeats that part to fill the remainder of the cycle.
 * @param {number} fraction fraction to select
 * @example
 * s("lt ht mt cp, [hh oh]*2").linger("<1 .5 .25 .125>")
 */`,meta:{range:[57205,57410],filename:"pattern.mjs",lineno:1850,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100012471",name:"exports.linger",type:"VariableDeclaration"}},description:"<p>Selects the given fraction of the pattern and repeats that part to fill the remainder of the cycle.</p>",params:[{type:{names:["number"]},description:"<p>fraction to select</p>",name:"fraction"}],examples:['s("lt ht mt cp, [hh oh]*2").linger("<1 .5 .25 .125>")'],name:"linger",longname:"linger",kind:"constant",scope:"global"},{comment:`/**
 * Samples the pattern at a rate of n events per cycle. Useful for turning a continuous pattern into a discrete one.
 * @param {number} segments number of segments per cycle
 * @example
 * note(saw.range(0,12).segment(24)).add(40)
 */`,meta:{range:[57651,57765],filename:"pattern.mjs",lineno:1865,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100012520",name:"exports.segment",type:"VariableDeclaration"}},description:"<p>Samples the pattern at a rate of n events per cycle. Useful for turning a continuous pattern into a discrete one.</p>",params:[{type:{names:["number"]},description:"<p>number of segments per cycle</p>",name:"segments"}],examples:["note(saw.range(0,12).segment(24)).add(40)"],name:"segment",longname:"segment",kind:"constant",scope:"global"},{comment:`/**
 * Swaps 1s and 0s in a binary pattern.
 * @name invert
 * @synonyms inv
 * @example
 * s("bd").struct("1 0 0 1 0 0 1 0".lastOf(4, invert))
 */`,meta:{filename:"pattern.mjs",lineno:1869,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Swaps 1s and 0s in a binary pattern.</p>",name:"invert",tags:[{originalTitle:"synonyms",title:"synonyms",text:"inv",value:"inv"}],examples:['s("bd").struct("1 0 0 1 0 0 1 0".lastOf(4, invert))'],longname:"invert",kind:"member",scope:"global"},{comment:`/**
 * Applies the given function whenever the given pattern is in a true state.
 * @name when
 * @memberof Pattern
 * @param {Pattern} binary_pat
 * @param {function} func
 * @returns Pattern
 * @example
 * "c3 eb3 g3".when("<0 1>/2", x=>x.sub(5)).note()
 */`,meta:{filename:"pattern.mjs",lineno:1881,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Applies the given function whenever the given pattern is in a true state.</p>",name:"when",memberof:"Pattern",params:[{type:{names:["Pattern"]},name:"binary_pat"},{type:{names:["function"]},name:"func"}],returns:[{description:"<p>Pattern</p>"}],examples:['"c3 eb3 g3".when("<0 1>/2", x=>x.sub(5)).note()'],scope:"static",longname:"Pattern.when",kind:"member"},{comment:`/**
 * Superimposes the function result on top of the original pattern, delayed by the given time.
 * @name off
 * @memberof Pattern
 * @param {Pattern | number} time offset time
 * @param {function} func function to apply
 * @returns Pattern
 * @example
 * "c3 eb3 g3".off(1/8, x=>x.add(7)).note()
 */`,meta:{filename:"pattern.mjs",lineno:1895,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Superimposes the function result on top of the original pattern, delayed by the given time.</p>",name:"off",memberof:"Pattern",params:[{type:{names:["Pattern","number"]},description:"<p>offset time</p>",name:"time"},{type:{names:["function"]},description:"<p>function to apply</p>",name:"func"}],returns:[{description:"<p>Pattern</p>"}],examples:['"c3 eb3 g3".off(1/8, x=>x.add(7)).note()'],scope:"static",longname:"Pattern.off",kind:"member"},{comment:`/**
 * Returns a new pattern where every other cycle is played once, twice as
 * fast, and offset in time by one quarter of a cycle. Creates a kind of
 * breakbeat feel.
 * @returns Pattern
 */`,meta:{range:[59044,59182],filename:"pattern.mjs",lineno:1915,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100012610",name:"exports.brak",type:"VariableDeclaration"}},description:`<p>Returns a new pattern where every other cycle is played once, twice as
fast, and offset in time by one quarter of a cycle. Creates a kind of
breakbeat feel.</p>`,returns:[{description:"<p>Pattern</p>"}],name:"brak",longname:"brak",kind:"constant",scope:"global"},{comment:`/**
 * Reverse all haps in a pattern
 *
 * @name rev
 * @memberof Pattern
 * @returns Pattern
 * @example
 * note("c3 d3 e3 g3").rev()
 */`,meta:{filename:"pattern.mjs",lineno:1919,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Reverse all haps in a pattern</p>",name:"rev",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:['note("c3 d3 e3 g3").rev()'],scope:"static",longname:"Pattern.rev",kind:"member"},{comment:`/** Like press, but allows you to specify the amount by which each
 * event is shifted. pressBy(0.5) is the same as press, while
 * pressBy(1/3) shifts each event by a third of its timespan.
 * @example
 * stack(s("hh*4"),
 *       s("bd mt sd ht").pressBy("<0 0.5 0.25>")
 *      ).slow(2)
 */`,meta:{range:[60336,60466],filename:"pattern.mjs",lineno:1955,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100012758",name:"exports.pressBy",type:"VariableDeclaration"}},description:`<p>Like press, but allows you to specify the amount by which each
event is shifted. pressBy(0.5) is the same as press, while
pressBy(1/3) shifts each event by a third of its timespan.</p>`,examples:[`stack(s("hh*4"),
      s("bd mt sd ht").pressBy("<0 0.5 0.25>")
     ).slow(2)`],name:"pressBy",longname:"pressBy",kind:"constant",scope:"global"},{comment:`/**
 * Syncopates a rhythm, by shifting each event halfway into its timespan.
 * @example
 * stack(s("hh*4"),
 *       s("bd mt sd ht").every(4, press)
 *      ).slow(2)
 */`,meta:{range:[60642,60729],filename:"pattern.mjs",lineno:1966,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100012787",name:"exports.press",type:"VariableDeclaration"}},description:"<p>Syncopates a rhythm, by shifting each event halfway into its timespan.</p>",examples:[`stack(s("hh*4"),
      s("bd mt sd ht").every(4, press)
     ).slow(2)`],name:"press",longname:"press",kind:"constant",scope:"global"},{comment:`/**
 * Silences a pattern.
 * @example
 * stack(
 *   s("bd").hush(),
 *   s("hh*3")
 * )
 */`,meta:{range:[60825,60900],filename:"pattern.mjs",lineno:1978,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100012803",name:"exports.hush",type:"VariableDeclaration"}},description:"<p>Silences a pattern.</p>",examples:[`stack(
  s("bd").hush(),
  s("hh*3")
)`],name:"hush",longname:"hush",kind:"constant",scope:"global"},{comment:`/**
 * Applies \`rev\` to a pattern every other cycle, so that the pattern alternates between forwards and backwards.
 * @example
 * note("c d e g").palindrome()
 */`,meta:{range:[61066,61163],filename:"pattern.mjs",lineno:1987,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100012815",name:"exports.palindrome",type:"VariableDeclaration"}},description:"<p>Applies <code>rev</code> to a pattern every other cycle, so that the pattern alternates between forwards and backwards.</p>",examples:['note("c d e g").palindrome()'],name:"palindrome",longname:"palindrome",kind:"constant",scope:"global"},{comment:`/**
 * Jux with adjustable stereo width. 0 = mono, 1 = full stereo.
 * @name juxBy
 * @synonyms juxby
 * @example
 * s("lt ht mt ht hh").juxBy("<0 .5 1>/2", rev)
 */`,meta:{filename:"pattern.mjs",lineno:1991,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Jux with adjustable stereo width. 0 = mono, 1 = full stereo.</p>",name:"juxBy",tags:[{originalTitle:"synonyms",title:"synonyms",text:"juxby",value:"juxby"}],examples:['s("lt ht mt ht hh").juxBy("<0 .5 1>/2", rev)'],longname:"juxBy",kind:"member",scope:"global"},{comment:`/**
 * The jux function creates strange stereo effects, by applying a function to a pattern, but only in the right-hand channel.
 * @example
 * s("lt ht mt ht hh").jux(rev)
 */`,meta:{range:[61977,62073],filename:"pattern.mjs",lineno:2017,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100012928",name:"exports.jux",type:"VariableDeclaration"}},description:"<p>The jux function creates strange stereo effects, by applying a function to a pattern, but only in the right-hand channel.</p>",examples:['s("lt ht mt ht hh").jux(rev)'],name:"jux",longname:"jux",kind:"constant",scope:"global"},{comment:`/**
 * Superimpose and offset multiple times, applying the given function each time.
 * @name echoWith
 * @synonyms echowith, stutWith, stutwith
 * @param {number} times how many times to repeat
 * @param {number} time cycle offset between iterations
 * @param {function} func function to apply, given the pattern and the iteration index
 * @example
 * "<0 [2 4]>"
 * .echoWith(4, 1/8, (p,n) => p.add(n*2))
 * .scale('C minor').note().clip(.2)
 */`,meta:{filename:"pattern.mjs",lineno:2021,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Superimpose and offset multiple times, applying the given function each time.</p>",name:"echoWith",tags:[{originalTitle:"synonyms",title:"synonyms",text:"echowith, stutWith, stutwith",value:"echowith, stutWith, stutwith"}],params:[{type:{names:["number"]},description:"<p>how many times to repeat</p>",name:"times"},{type:{names:["number"]},description:"<p>cycle offset between iterations</p>",name:"time"},{type:{names:["function"]},description:"<p>function to apply, given the pattern and the iteration index</p>",name:"func"}],examples:[`"<0 [2 4]>"
.echoWith(4, 1/8, (p,n) => p.add(n*2))
.scale('C minor').note().clip(.2)`],longname:"echoWith",kind:"member",scope:"global"},{comment:`/**
 * Superimpose and offset multiple times, gradually decreasing the velocity
 * @name echo
 * @memberof Pattern
 * @returns Pattern
 * @param {number} times how many times to repeat
 * @param {number} time cycle offset between iterations
 * @param {number} feedback velocity multiplicator for each iteration
 * @example
 * s("bd sd").echo(3, 1/6, .8)
 */`,meta:{filename:"pattern.mjs",lineno:2040,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Superimpose and offset multiple times, gradually decreasing the velocity</p>",name:"echo",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],params:[{type:{names:["number"]},description:"<p>how many times to repeat</p>",name:"times"},{type:{names:["number"]},description:"<p>cycle offset between iterations</p>",name:"time"},{type:{names:["number"]},description:"<p>velocity multiplicator for each iteration</p>",name:"feedback"}],examples:['s("bd sd").echo(3, 1/6, .8)'],scope:"static",longname:"Pattern.echo",kind:"member"},{comment:`/**
 * Deprecated. Like echo, but the last 2 parameters are flipped.
 * @name stut
 * @param {number} times how many times to repeat
 * @param {number} feedback velocity multiplicator for each iteration
 * @param {number} time cycle offset between iterations
 * @example
 * s("bd sd").stut(3, .8, 1/6)
 */`,meta:{filename:"pattern.mjs",lineno:2055,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Deprecated. Like echo, but the last 2 parameters are flipped.</p>",name:"stut",params:[{type:{names:["number"]},description:"<p>how many times to repeat</p>",name:"times"},{type:{names:["number"]},description:"<p>velocity multiplicator for each iteration</p>",name:"feedback"},{type:{names:["number"]},description:"<p>cycle offset between iterations</p>",name:"time"}],examples:['s("bd sd").stut(3, .8, 1/6)'],longname:"stut",kind:"member",scope:"global"},{comment:`/**
 * Divides a pattern into a given number of subdivisions, plays the subdivisions in order, but increments the starting subdivision each cycle. The pattern wraps to the first subdivision after the last subdivision is played.
 * @name iter
 * @memberof Pattern
 * @returns Pattern
 * @example
 * note("0 1 2 3".scale('A minor')).iter(4)
 */`,meta:{filename:"pattern.mjs",lineno:2068,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Divides a pattern into a given number of subdivisions, plays the subdivisions in order, but increments the starting subdivision each cycle. The pattern wraps to the first subdivision after the last subdivision is played.</p>",name:"iter",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:[`note("0 1 2 3".scale('A minor')).iter(4)`],scope:"static",longname:"Pattern.iter",kind:"member"},{comment:`/**
 * Like \`iter\`, but plays the subdivisions in reverse order. Known as iter' in tidalcycles
 * @name iterBack
 * @synonyms iterback
 * @memberof Pattern
 * @returns Pattern
 * @example
 * note("0 1 2 3".scale('A minor')).iterBack(4)
 */`,meta:{filename:"pattern.mjs",lineno:2090,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Like <code>iter</code>, but plays the subdivisions in reverse order. Known as iter' in tidalcycles</p>",name:"iterBack",tags:[{originalTitle:"synonyms",title:"synonyms",text:"iterback",value:"iterback"}],memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:[`note("0 1 2 3".scale('A minor')).iterBack(4)`],scope:"static",longname:"Pattern.iterBack",kind:"member"},{comment:`/**
 * Divides a pattern into a given number of parts, then cycles through those parts in turn, applying the given function to each part in turn (one part per cycle).
 * @name chunk
 * @memberof Pattern
 * @returns Pattern
 * @example
 * "0 1 2 3".chunk(4, x=>x.add(7)).scale('A minor').note()
 */`,meta:{filename:"pattern.mjs",lineno:2103,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Divides a pattern into a given number of parts, then cycles through those parts in turn, applying the given function to each part in turn (one part per cycle).</p>",name:"chunk",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:[`"0 1 2 3".chunk(4, x=>x.add(7)).scale('A minor').note()`],scope:"static",longname:"Pattern.chunk",kind:"member"},{comment:`/**
 * Like \`chunk\`, but cycles through the parts in reverse order. Known as chunk' in tidalcycles
 * @name chunkBack
 * @synonyms chunkback
 * @memberof Pattern
 * @returns Pattern
 * @example
 * "0 1 2 3".chunkBack(4, x=>x.add(7)).scale('A minor').note()
 */`,meta:{filename:"pattern.mjs",lineno:2122,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Like <code>chunk</code>, but cycles through the parts in reverse order. Known as chunk' in tidalcycles</p>",name:"chunkBack",tags:[{originalTitle:"synonyms",title:"synonyms",text:"chunkback",value:"chunkback"}],memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:[`"0 1 2 3".chunkBack(4, x=>x.add(7)).scale('A minor').note()`],scope:"static",longname:"Pattern.chunkBack",kind:"member"},{comment:`/**
 * Loops the pattern inside at \`offset\` for \`cycles\`.
 * @param {number} offset start point of loop in cycles
 * @param {number} cycles loop length in cycles
 * @example
 * // Looping a portion of randomness
 * note(irand(8).segment(4).scale('C3 minor')).ribbon(1337, 2)
 */`,meta:{range:[66335,66450],filename:"pattern.mjs",lineno:2149,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100013279",name:"exports.ribbon",type:"VariableDeclaration"}},description:"<p>Loops the pattern inside at <code>offset</code> for <code>cycles</code>.</p>",params:[{type:{names:["number"]},description:"<p>start point of loop in cycles</p>",name:"offset"},{type:{names:["number"]},description:"<p>loop length in cycles</p>",name:"cycles"}],examples:[`// Looping a portion of randomness
note(irand(8).segment(4).scale('C3 minor')).ribbon(1337, 2)`],name:"ribbon",longname:"ribbon",kind:"constant",scope:"global"},{comment:`/**
 * Sets the color of the hap in visualizations like pianoroll or highlighting.
 */`,meta:{range:[66827,66981],filename:"pattern.mjs",lineno:2161,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100013335",name:"exports.",type:"VariableDeclaration"}},description:"<p>Sets the color of the hap in visualizations like pianoroll or highlighting.</p>",name:"",longname:"",kind:"constant",scope:"global"},{comment:`/**
 *
 * Sets the velocity from 0 to 1. Is multiplied together with gain.
 * @name velocity
 * @example
 * s("hh*8")
 * .gain(".4!2 1 .4!2 1 .4 1")
 * .velocity(".4 1")
 */`,meta:{filename:"pattern.mjs",lineno:2165,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Sets the velocity from 0 to 1. Is multiplied together with gain.</p>",name:"velocity",examples:[`s("hh*8")
.gain(".4!2 1 .4!2 1 .4 1")
.velocity(".4 1")`],longname:"velocity",kind:"member",scope:"global"},{comment:`/**
 *
 * Multiplies the hap duration with the given factor.
 * With samples, \`clip\` might be a better function to use ([more info](https://github.com/tidalcycles/strudel/pull/598))
 * @name legato
 * @memberof Pattern
 * @example
 * note("c3 eb3 g3 c4").legato("<.25 .5 1 2>")
 */`,meta:{filename:"pattern.mjs",lineno:2178,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Multiplies the hap duration with the given factor.
With samples, <code>clip</code> might be a better function to use (<a href="https://github.com/tidalcycles/strudel/pull/598">more info</a>)</p>`,name:"legato",memberof:"Pattern",examples:['note("c3 eb3 g3 c4").legato("<.25 .5 1 2>")'],scope:"static",longname:"Pattern.legato",kind:"member"},{comment:`/**
 * Cuts each sample into the given number of parts, allowing you to explore a technique known as 'granular synthesis'.
 * It turns a pattern of samples into a pattern of parts of samples.
 * @name chop
 * @memberof Pattern
 * @returns Pattern
 * @example
 * samples({ rhodes: 'https://cdn.freesound.org/previews/132/132051_316502-lq.mp3' })
 * s("rhodes")
 *  .chop(4)
 *  .rev() // reverse order of chops
 *  .loopAt(4) // fit sample into 4 cycles
 *
 */`,meta:{filename:"pattern.mjs",lineno:2197,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Cuts each sample into the given number of parts, allowing you to explore a technique known as 'granular synthesis'.
It turns a pattern of samples into a pattern of parts of samples.</p>`,name:"chop",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:[`samples({ rhodes: 'https://cdn.freesound.org/previews/132/132051_316502-lq.mp3' })
s("rhodes")
 .chop(4)
 .rev() // reverse order of chops
 .loopAt(4) // fit sample into 4 cycles`],scope:"static",longname:"Pattern.chop",kind:"member"},{comment:`/**
 * Makes the sample fit the given number of cycles by changing the speed.
 * @name loopAt
 * @memberof Pattern
 * @returns Pattern
 * @example
 * samples({ rhodes: 'https://cdn.freesound.org/previews/132/132051_316502-lq.mp3' })
 * s("rhodes").loopAt(4)
 */`,meta:{filename:"pattern.mjs",lineno:2227,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Makes the sample fit the given number of cycles by changing the speed.</p>",name:"loopAt",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:[`samples({ rhodes: 'https://cdn.freesound.org/previews/132/132051_316502-lq.mp3' })
s("rhodes").loopAt(4)`],scope:"static",longname:"Pattern.loopAt",kind:"member"},{comment:`/**
 * Chops samples into the given number of slices, triggering those slices with a given pattern of slice numbers.
 * Instead of a number, it also accepts a list of numbers from 0 to 1 to slice at specific points.
 * @name slice
 * @memberof Pattern
 * @returns Pattern
 * @example
 * await samples('github:tidalcycles/Dirt-Samples/master')
 * s("breaks165").slice(8, "0 1 <2 2*2> 3 [4 0] 5 6 7".every(3, rev)).slow(1.5)
 * @example
 * await samples('github:tidalcycles/Dirt-Samples/master')
 * s("breaks125/2").fit().slice([0,.25,.5,.75], "0 1 1 <2 3>")
 */`,meta:{filename:"pattern.mjs",lineno:2244,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Chops samples into the given number of slices, triggering those slices with a given pattern of slice numbers.
Instead of a number, it also accepts a list of numbers from 0 to 1 to slice at specific points.</p>`,name:"slice",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:[`await samples('github:tidalcycles/Dirt-Samples/master')
s("breaks165").slice(8, "0 1 <2 2*2> 3 [4 0] 5 6 7".every(3, rev)).slow(1.5)`,`await samples('github:tidalcycles/Dirt-Samples/master')
s("breaks125/2").fit().slice([0,.25,.5,.75], "0 1 1 <2 3>")`],scope:"static",longname:"Pattern.slice",kind:"member"},{comment:`/**
 * Works the same as slice, but changes the playback speed of each slice to match the duration of its step.
 * @name splice
 * @example
 * await samples('github:tidalcycles/Dirt-Samples/master')
 * s("breaks165")
 * .splice(8,  "0 1 [2 3 0]@2 3 0@2 7")
 * .hurry(0.65)
 */`,meta:{filename:"pattern.mjs",lineno:2276,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Works the same as slice, but changes the playback speed of each slice to match the duration of its step.</p>",name:"splice",examples:[`await samples('github:tidalcycles/Dirt-Samples/master')
s("breaks165")
.splice(8,  "0 1 [2 3 0]@2 3 0@2 7")
.hurry(0.65)`],longname:"splice",kind:"member",scope:"global"},{comment:`/**
 * Makes the sample fit its event duration. Good for rhythmical loops like drum breaks.
 * Similar to loopAt.
 * @name fit
 * @example
 * samples({ rhodes: 'https://cdn.freesound.org/previews/132/132051_316502-lq.mp3' })
 * s("rhodes/4").fit()
 */`,meta:{filename:"pattern.mjs",lineno:2312,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Makes the sample fit its event duration. Good for rhythmical loops like drum breaks.
Similar to loopAt.</p>`,name:"fit",examples:[`samples({ rhodes: 'https://cdn.freesound.org/previews/132/132051_316502-lq.mp3' })
s("rhodes/4").fit()`],longname:"fit",kind:"member",scope:"global"},{comment:`/**
 * Makes the sample fit the given number of cycles and cps value, by
 * changing the speed. Please note that at some point cps will be
 * given by a global clock and this function will be
 * deprecated/removed.
 * @name loopAtCps
 * @memberof Pattern
 * @returns Pattern
 * @example
 * samples({ rhodes: 'https://cdn.freesound.org/previews/132/132051_316502-lq.mp3' })
 * s("rhodes").loopAtCps(4,1.5).cps(1.5)
 */`,meta:{filename:"pattern.mjs",lineno:2330,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Makes the sample fit the given number of cycles and cps value, by
changing the speed. Please note that at some point cps will be
given by a global clock and this function will be
deprecated/removed.</p>`,name:"loopAtCps",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:[`samples({ rhodes: 'https://cdn.freesound.org/previews/132/132051_316502-lq.mp3' })
s("rhodes").loopAtCps(4,1.5).cps(1.5)`],scope:"static",longname:"Pattern.loopAtCps",kind:"member"},{comment:`/**
 *  A sawtooth signal between 0 and 1.
 *
 * @return {Pattern}
 * @example
 * "c3 [eb3,g3] g2 [g3,bb3]".note().clip(saw.slow(4))
 * @example
 * saw.range(0,8).segment(8).scale('C major').slow(4).note()
 *
 */`,meta:{range:[1579,1619],filename:"signal.mjs",lineno:35,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100015531",name:"exports.saw",type:"VariableDeclaration"}},description:"<p>A sawtooth signal between 0 and 1.</p>",returns:[{type:{names:["Pattern"]}}],examples:['"c3 [eb3,g3] g2 [g3,bb3]".note().clip(saw.slow(4))',"saw.range(0,8).segment(8).scale('C major').slow(4).note()"],name:"saw",longname:"saw",kind:"constant",scope:"global"},{comment:`/**
 *  A sine signal between 0 and 1.
 *
 * @return {Pattern}
 * @example
 * sine.segment(16).range(0,15).slow(2).scale('C minor').note()
 *
 */`,meta:{range:[1868,1908],filename:"signal.mjs",lineno:48,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100015569",name:"exports.sine",type:"VariableDeclaration"}},description:"<p>A sine signal between 0 and 1.</p>",returns:[{type:{names:["Pattern"]}}],examples:["sine.segment(16).range(0,15).slow(2).scale('C minor').note()"],name:"sine",longname:"sine",kind:"constant",scope:"global"},{comment:`/**
 *  A cosine signal between 0 and 1.
 *
 * @return {Pattern}
 * @example
 * stack(sine,cosine).segment(16).range(0,15).slow(2).scale('C minor').note()
 *
 */`,meta:{range:[2072,2126],filename:"signal.mjs",lineno:58,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100015577",name:"exports.cosine",type:"VariableDeclaration"}},description:"<p>A cosine signal between 0 and 1.</p>",returns:[{type:{names:["Pattern"]}}],examples:["stack(sine,cosine).segment(16).range(0,15).slow(2).scale('C minor').note()"],name:"cosine",longname:"cosine",kind:"constant",scope:"global"},{comment:`/**
 *  A square signal between 0 and 1.
 *
 * @return {Pattern}
 * @example
 * square.segment(2).range(0,7).scale('C minor').note()
 *
 */`,meta:{range:[2325,2386],filename:"signal.mjs",lineno:69,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100015607",name:"exports.square",type:"VariableDeclaration"}},description:"<p>A square signal between 0 and 1.</p>",returns:[{type:{names:["Pattern"]}}],examples:["square.segment(2).range(0,7).scale('C minor').note()"],name:"square",longname:"square",kind:"constant",scope:"global"},{comment:`/**
 *  A triangle signal between 0 and 1.
 *
 * @return {Pattern}
 * @example
 * tri.segment(8).range(0,7).scale('C minor').note()
 *
 */`,meta:{range:[2570,2608],filename:"signal.mjs",lineno:80,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100015632",name:"exports.tri",type:"VariableDeclaration"}},description:"<p>A triangle signal between 0 and 1.</p>",returns:[{type:{names:["Pattern"]}}],examples:["tri.segment(8).range(0,7).scale('C minor').note()"],name:"tri",longname:"tri",kind:"constant",scope:"global"},{comment:`/**
 * A discrete pattern of numbers from 0 to n-1
 * @example
 * run(4).scale('C4 major').note()
 * // "0 1 2 3".scale('C4 major').note()
 */`,meta:{range:[3563,3624],filename:"signal.mjs",lineno:123,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100015787",name:"exports.run",type:"VariableDeclaration"}},description:"<p>A discrete pattern of numbers from 0 to n-1</p>",examples:[`run(4).scale('C4 major').note()
// "0 1 2 3".scale('C4 major').note()`],name:"run",longname:"run",kind:"constant",scope:"global"},{comment:`/**
 * A continuous pattern of random numbers, between 0 and 1.
 *
 * @name rand
 * @example
 * // randomly change the cutoff
 * s("bd sd,hh*4").cutoff(rand.range(500,2000))
 *
 */`,meta:{filename:"signal.mjs",lineno:125,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>A continuous pattern of random numbers, between 0 and 1.</p>",name:"rand",examples:[`// randomly change the cutoff
s("bd sd,hh*4").cutoff(rand.range(500,2000))`],longname:"rand",kind:"member",scope:"global"},{comment:`/**
 * A continuous pattern of random numbers, between -1 and 1
 */`,meta:{range:[3915,3953],filename:"signal.mjs",lineno:138,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100015813",name:"exports.rand2",type:"VariableDeclaration"}},description:"<p>A continuous pattern of random numbers, between -1 and 1</p>",name:"rand2",longname:"rand2",kind:"constant",scope:"global"},{comment:`/**
 * A continuous pattern of random integers, between 0 and n-1.
 *
 * @name irand
 * @param {number} n max value (exclusive)
 * @example
 * // randomly select scale notes from 0 - 7 (= C to C)
 * irand(8).struct("x(3,8)").scale('C minor').note()
 *
 */`,meta:{filename:"signal.mjs",lineno:146,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>A continuous pattern of random integers, between 0 and n-1.</p>",name:"irand",params:[{type:{names:["number"]},description:"<p>max value (exclusive)</p>",name:"n"}],examples:[`// randomly select scale notes from 0 - 7 (= C to C)
irand(8).struct("x(3,8)").scale('C minor').note()`],longname:"irand",kind:"member",scope:"global"},{comment:`/**
 * Choose from the list of values (or patterns of values) using the given
 * pattern of numbers, which should be in the range of 0..1
 * @param {Pattern} pat
 * @param {*} xs
 * @returns {Pattern}
 */`,meta:{range:[4900,4987],filename:"signal.mjs",lineno:172,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100015940",name:"exports.chooseWith",type:"VariableDeclaration"}},description:`<p>Choose from the list of values (or patterns of values) using the given
pattern of numbers, which should be in the range of 0..1</p>`,params:[{type:{names:["Pattern"]},name:"pat"},{type:{names:["*"]},name:"xs"}],returns:[{type:{names:["Pattern"]}}],name:"chooseWith",longname:"chooseWith",kind:"constant",scope:"global"},{comment:`/**
 * As with {chooseWith}, but the structure comes from the chosen values, rather
 * than the pattern you're using to choose with.
 * @param {Pattern} pat
 * @param {*} xs
 * @returns {Pattern}
 */`,meta:{range:[5189,5278],filename:"signal.mjs",lineno:183,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100015956",name:"exports.chooseInWith",type:"VariableDeclaration"}},description:`<p>As with {chooseWith}, but the structure comes from the chosen values, rather
than the pattern you're using to choose with.</p>`,params:[{type:{names:["Pattern"]},name:"pat"},{type:{names:["*"]},name:"xs"}],returns:[{type:{names:["Pattern"]}}],name:"chooseInWith",longname:"chooseInWith",kind:"constant",scope:"global"},{comment:`/**
 * Chooses randomly from the given list of elements.
 * @param  {...any} xs values / patterns to choose from.
 * @returns {Pattern} - a continuous pattern.
 */`,meta:{range:[5444,5498],filename:"signal.mjs",lineno:192,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100015972",name:"exports.choose",type:"VariableDeclaration"}},description:"<p>Chooses randomly from the given list of elements.</p>",params:[{type:{names:["any"]},variable:!0,description:"<p>values / patterns to choose from.</p>",name:"xs"}],returns:[{type:{names:["Pattern"]},description:`<ul>
<li>a continuous pattern.</li>
</ul>`}],name:"choose",longname:"choose",kind:"constant",scope:"global"},{comment:`/**
 * Chooses from the given list of values (or patterns of values), according
 * to the pattern that the method is called on. The pattern should be in
 * the range 0 .. 1.
 * @param  {...any} xs
 * @returns {Pattern}
 */`,meta:{range:[5723,5801],filename:"signal.mjs",lineno:201,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100015984",name:"Pattern.prototype.choose",type:"FunctionExpression",paramnames:["xs"]}},description:`<p>Chooses from the given list of values (or patterns of values), according
to the pattern that the method is called on. The pattern should be in
the range 0 .. 1.</p>`,params:[{type:{names:["any"]},variable:!0,name:"xs"}],returns:[{type:{names:["Pattern"]}}],name:"choose",longname:"Pattern#choose",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
 * As with choose, but the pattern that this method is called on should be
 * in the range -1 .. 1
 * @param  {...any} xs
 * @returns {Pattern}
 */`,meta:{range:[5956,6049],filename:"signal.mjs",lineno:211,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100016000",name:"Pattern.prototype.choose2",type:"FunctionExpression",paramnames:["xs"]}},description:`<p>As with choose, but the pattern that this method is called on should be
in the range -1 .. 1</p>`,params:[{type:{names:["any"]},variable:!0,name:"xs"}],returns:[{type:{names:["Pattern"]}}],name:"choose2",longname:"Pattern#choose2",kind:"function",memberof:"Pattern",scope:"instance"},{comment:`/**
 * Picks one of the elements at random each cycle.
 * @returns {Pattern}
 * @example
 * chooseCycles("bd", "hh", "sd").s().fast(4)
 * @example
 * "bd | hh | sd".s().fast(4)
 */`,meta:{range:[6233,6306],filename:"signal.mjs",lineno:223,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100016018",name:"exports.chooseCycles",type:"VariableDeclaration"}},description:"<p>Picks one of the elements at random each cycle.</p>",returns:[{type:{names:["Pattern"]}}],examples:['chooseCycles("bd", "hh", "sd").s().fast(4)','"bd | hh | sd".s().fast(4)'],name:"chooseCycles",longname:"chooseCycles",kind:"constant",scope:"global"},{comment:`/**
 * Generates a continuous pattern of [perlin noise](https://en.wikipedia.org/wiki/Perlin_noise), in the range 0..1.
 *
 * @name perlin
 * @example
 * // randomly change the cutoff
 * s("bd sd,hh*4").cutoff(perlin.range(500,2000))
 *
 */`,meta:{filename:"signal.mjs",lineno:258,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:'<p>Generates a continuous pattern of <a href="https://en.wikipedia.org/wiki/Perlin_noise">perlin noise</a>, in the range 0..1.</p>',name:"perlin",examples:[`// randomly change the cutoff
s("bd sd,hh*4").cutoff(perlin.range(500,2000))`],longname:"perlin",kind:"member",scope:"global"},{comment:`/**
 * Randomly removes events from the pattern by a given amount.
 * 0 = 0% chance of removal
 * 1 = 100% chance of removal
 *
 * @name degradeBy
 * @memberof Pattern
 * @param {number} amount - a number between 0 and 1
 * @returns Pattern
 * @example
 * s("hh*8").degradeBy(0.2)
 * @example
 * s("[hh?0.2]*8")
 */`,meta:{filename:"signal.mjs",lineno:273,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Randomly removes events from the pattern by a given amount.
0 = 0% chance of removal
1 = 100% chance of removal</p>`,name:"degradeBy",memberof:"Pattern",params:[{type:{names:["number"]},description:"<p>a number between 0 and 1</p>",name:"amount"}],returns:[{description:"<p>Pattern</p>"}],examples:['s("hh*8").degradeBy(0.2)','s("[hh?0.2]*8")'],scope:"static",longname:"Pattern.degradeBy",kind:"member"},{comment:`/**
 *
 * Randomly removes 50% of events from the pattern. Shorthand for \`.degradeBy(0.5)\`
 *
 * @name degrade
 * @memberof Pattern
 * @returns Pattern
 * @example
 * s("hh*8").degrade()
 * @example
 * s("[hh?]*8")
 */`,meta:{filename:"signal.mjs",lineno:291,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Randomly removes 50% of events from the pattern. Shorthand for <code>.degradeBy(0.5)</code></p>",name:"degrade",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:['s("hh*8").degrade()','s("[hh?]*8")'],scope:"static",longname:"Pattern.degrade",kind:"member"},{comment:`/**
 * Inverse of {@link Pattern#degradeBy}: Randomly removes events from the pattern by a given amount.
 * 0 = 100% chance of removal
 * 1 = 0% chance of removal
 * Events that would be removed by degradeBy are let through by undegradeBy and vice versa (see second example).
 *
 * @name undegradeBy
 * @memberof Pattern
 * @param {number} amount - a number between 0 and 1
 * @returns Pattern
 * @example
 * s("hh*8").undegradeBy(0.2)
 */`,meta:{filename:"signal.mjs",lineno:305,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Inverse of {@link Pattern#degradeBy}: Randomly removes events from the pattern by a given amount.
0 = 100% chance of removal
1 = 0% chance of removal
Events that would be removed by degradeBy are let through by undegradeBy and vice versa (see second example).</p>`,name:"undegradeBy",memberof:"Pattern",params:[{type:{names:["number"]},description:"<p>a number between 0 and 1</p>",name:"amount"}],returns:[{description:"<p>Pattern</p>"}],examples:['s("hh*8").undegradeBy(0.2)'],scope:"static",longname:"Pattern.undegradeBy",kind:"member"},{comment:`/**
 *
 * Randomly applies the given function by the given probability.
 * Similar to {@link Pattern#someCyclesBy}
 *
 * @name sometimesBy
 * @memberof Pattern
 * @param {number | Pattern} probability - a number between 0 and 1
 * @param {function} function - the transformation to apply
 * @returns Pattern
 * @example
 * s("hh(3,8)").sometimesBy(.4, x=>x.speed("0.5"))
 */`,meta:{filename:"signal.mjs",lineno:327,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Randomly applies the given function by the given probability.
Similar to {@link Pattern#someCyclesBy}</p>`,name:"sometimesBy",memberof:"Pattern",params:[{type:{names:["number","Pattern"]},description:"<p>a number between 0 and 1</p>",name:"probability"},{type:{names:["function"]},description:"<p>the transformation to apply</p>",name:"function"}],returns:[{description:"<p>Pattern</p>"}],examples:['s("hh(3,8)").sometimesBy(.4, x=>x.speed("0.5"))'],scope:"static",longname:"Pattern.sometimesBy",kind:"member"},{comment:`/**
 *
 * Applies the given function with a 50% chance
 *
 * @name sometimes
 * @memberof Pattern
 * @param {function} function - the transformation to apply
 * @returns Pattern
 * @example
 * s("hh*4").sometimes(x=>x.speed("0.5"))
 */`,meta:{filename:"signal.mjs",lineno:347,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Applies the given function with a 50% chance</p>",name:"sometimes",memberof:"Pattern",params:[{type:{names:["function"]},description:"<p>the transformation to apply</p>",name:"function"}],returns:[{description:"<p>Pattern</p>"}],examples:['s("hh*4").sometimes(x=>x.speed("0.5"))'],scope:"static",longname:"Pattern.sometimes",kind:"member"},{comment:`/**
 *
 * Randomly applies the given function by the given probability on a cycle by cycle basis.
 * Similar to {@link Pattern#sometimesBy}
 *
 * @name someCyclesBy
 * @memberof Pattern
 * @param {number | Pattern} probability - a number between 0 and 1
 * @param {function} function - the transformation to apply
 * @returns Pattern
 * @example
 * s("hh(3,8)").someCyclesBy(.3, x=>x.speed("0.5"))
 */`,meta:{filename:"signal.mjs",lineno:362,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:`<p>Randomly applies the given function by the given probability on a cycle by cycle basis.
Similar to {@link Pattern#sometimesBy}</p>`,name:"someCyclesBy",memberof:"Pattern",params:[{type:{names:["number","Pattern"]},description:"<p>a number between 0 and 1</p>",name:"probability"},{type:{names:["function"]},description:"<p>the transformation to apply</p>",name:"function"}],returns:[{description:"<p>Pattern</p>"}],examples:['s("hh(3,8)").someCyclesBy(.3, x=>x.speed("0.5"))'],scope:"static",longname:"Pattern.someCyclesBy",kind:"member"},{comment:`/**
 *
 * Shorthand for \`.someCyclesBy(0.5, fn)\`
 *
 * @name someCycles
 * @memberof Pattern
 * @returns Pattern
 * @example
 * s("hh(3,8)").someCycles(x=>x.speed("0.5"))
 */`,meta:{filename:"signal.mjs",lineno:387,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Shorthand for <code>.someCyclesBy(0.5, fn)</code></p>",name:"someCycles",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:['s("hh(3,8)").someCycles(x=>x.speed("0.5"))'],scope:"static",longname:"Pattern.someCycles",kind:"member"},{comment:`/**
 *
 * Shorthand for \`.sometimesBy(0.75, fn)\`
 *
 * @name often
 * @memberof Pattern
 * @returns Pattern
 * @example
 * s("hh*8").often(x=>x.speed("0.5"))
 */`,meta:{filename:"signal.mjs",lineno:401,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Shorthand for <code>.sometimesBy(0.75, fn)</code></p>",name:"often",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:['s("hh*8").often(x=>x.speed("0.5"))'],scope:"static",longname:"Pattern.often",kind:"member"},{comment:`/**
 *
 * Shorthand for \`.sometimesBy(0.25, fn)\`
 *
 * @name rarely
 * @memberof Pattern
 * @returns Pattern
 * @example
 * s("hh*8").rarely(x=>x.speed("0.5"))
 */`,meta:{filename:"signal.mjs",lineno:415,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Shorthand for <code>.sometimesBy(0.25, fn)</code></p>",name:"rarely",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:['s("hh*8").rarely(x=>x.speed("0.5"))'],scope:"static",longname:"Pattern.rarely",kind:"member"},{comment:`/**
 *
 * Shorthand for \`.sometimesBy(0.1, fn)\`
 *
 * @name almostNever
 * @memberof Pattern
 * @returns Pattern
 * @example
 * s("hh*8").almostNever(x=>x.speed("0.5"))
 */`,meta:{filename:"signal.mjs",lineno:429,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Shorthand for <code>.sometimesBy(0.1, fn)</code></p>",name:"almostNever",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:['s("hh*8").almostNever(x=>x.speed("0.5"))'],scope:"static",longname:"Pattern.almostNever",kind:"member"},{comment:`/**
 *
 * Shorthand for \`.sometimesBy(0.9, fn)\`
 *
 * @name almostAlways
 * @memberof Pattern
 * @returns Pattern
 * @example
 * s("hh*8").almostAlways(x=>x.speed("0.5"))
 */`,meta:{filename:"signal.mjs",lineno:443,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Shorthand for <code>.sometimesBy(0.9, fn)</code></p>",name:"almostAlways",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:['s("hh*8").almostAlways(x=>x.speed("0.5"))'],scope:"static",longname:"Pattern.almostAlways",kind:"member"},{comment:`/**
 *
 * Shorthand for \`.sometimesBy(0, fn)\` (never calls fn)
 *
 * @name never
 * @memberof Pattern
 * @returns Pattern
 * @example
 * s("hh*8").never(x=>x.speed("0.5"))
 */`,meta:{filename:"signal.mjs",lineno:457,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Shorthand for <code>.sometimesBy(0, fn)</code> (never calls fn)</p>",name:"never",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:['s("hh*8").never(x=>x.speed("0.5"))'],scope:"static",longname:"Pattern.never",kind:"member"},{comment:`/**
 *
 * Shorthand for \`.sometimesBy(1, fn)\` (always calls fn)
 *
 * @name always
 * @memberof Pattern
 * @returns Pattern
 * @example
 * s("hh*8").always(x=>x.speed("0.5"))
 */`,meta:{filename:"signal.mjs",lineno:471,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{}},description:"<p>Shorthand for <code>.sometimesBy(1, fn)</code> (always calls fn)</p>",name:"always",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],examples:['s("hh*8").always(x=>x.speed("0.5"))'],scope:"static",longname:"Pattern.always",kind:"member"},{comment:`/**
 * @deprecated does not appear to be referenced or invoked anywhere in the codebase
 * @noAutocomplete
 */`,meta:{range:[2576,2743],filename:"util.mjs",lineno:66,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100026896",name:"exports.getFreq",type:"VariableDeclaration"}},deprecated:"does not appear to be referenced or invoked anywhere in the codebase",tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"getFreq",longname:"getFreq",kind:"constant",scope:"global"},{comment:`/**
 * @deprecated only used in workshop (first-notes)
 * @noAutocomplete
 */`,meta:{range:[2902,3021],filename:"util.mjs",lineno:78,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/core",code:{id:"astnode100026935",name:"exports.midi2note",type:"VariableDeclaration"}},deprecated:"only used in workshop (first-notes)",tags:[{originalTitle:"noAutocomplete",title:"noautocomplete",text:""}],name:"midi2note",longname:"midi2note",kind:"constant",scope:"global"},{comment:`/**
 * Sends notes to Csound for rendering with MIDI semantics. The hap value is
 * translated to these Csound pfields:
 *
 *  p1 -- Csound instrument either as a number (1-based, can be a fraction),
 *        or as a string name.
 *  p2 -- time in beats (usually seconds) from start of performance.
 *  p3 -- duration in beats (usually seconds).
 *  p4 -- MIDI key number (as a real number, not an integer but in [0, 127].
 *  p5 -- MIDI velocity (as a real number, not an integer but in [0, 127].
 *  p6 -- Strudel controls, as a string.
 */`,meta:{range:[4583,5898],filename:"index.mjs",lineno:137,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/csound",code:{id:"astnode100028813",name:"exports.csoundm",type:"VariableDeclaration"}},description:`<p>Sends notes to Csound for rendering with MIDI semantics. The hap value is
translated to these Csound pfields:</p>
<p>p1 -- Csound instrument either as a number (1-based, can be a fraction),
or as a string name.
p2 -- time in beats (usually seconds) from start of performance.
p3 -- duration in beats (usually seconds).
p4 -- MIDI key number (as a real number, not an integer but in [0, 127].
p5 -- MIDI velocity (as a real number, not an integer but in [0, 127].
p6 -- Strudel controls, as a string.</p>`,name:"csoundm",longname:"csoundm",kind:"constant",scope:"global"},{comment:`/**
 *
 * Sends each hap as an OSC message, which can be picked up by SuperCollider or any other OSC-enabled software.
 * For more info, read [MIDI & OSC in the docs](https://strudel.tidalcycles.org/learn/input-output)
 *
 * @name osc
 * @memberof Pattern
 * @returns Pattern
 */`,meta:{filename:"osc.mjs",lineno:37,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/osc",code:{}},description:`<p>Sends each hap as an OSC message, which can be picked up by SuperCollider or any other OSC-enabled software.
For more info, read <a href="https://strudel.tidalcycles.org/learn/input-output">MIDI &amp; OSC in the docs</a></p>`,name:"osc",memberof:"Pattern",returns:[{description:"<p>Pattern</p>"}],scope:"static",longname:"Pattern.osc",kind:"member"},{comment:`/**
 * Loads a collection of samples to use with \`s\`
 * @example
 * samples('github:tidalcycles/Dirt-Samples/master');
 * s("[bd ~]*2, [~ hh]*2, ~ sd")
 * @example
 * samples({
 *  bd: '808bd/BD0000.WAV',
 *  sd: '808sd/SD0010.WAV'
 *  }, 'https://raw.githubusercontent.com/tidalcycles/Dirt-Samples/master/');
 * s("[bd ~]*2, [~ hh]*2, ~ sd")
 *
 */`,meta:{range:[5057,6446],filename:"sampler.mjs",lineno:152,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/superdough",code:{id:"astnode100052605",name:"exports.samples",type:"VariableDeclaration"}},description:"<p>Loads a collection of samples to use with <code>s</code></p>",examples:[`samples('github:tidalcycles/Dirt-Samples/master');
s("[bd ~]*2, [~ hh]*2, ~ sd")`,`samples({
 bd: '808bd/BD0000.WAV',
 sd: '808sd/SD0010.WAV'
 }, 'https://raw.githubusercontent.com/tidalcycles/Dirt-Samples/master/');
s("[bd ~]*2, [~ hh]*2, ~ sd")`],name:"samples",longname:"samples",kind:"constant",scope:"global"},{comment:`/**
 * Change the pitch of each value by the given amount. Expects numbers or note strings as values.
 * The amount can be given as a number of semitones or as a string in interval short notation.
 * If you don't care about enharmonic correctness, just use numbers. Otherwise, pass the interval of
 * the form: ST where S is the degree number and T the type of interval with
 *
 * - M = major
 * - m = minor
 * - P = perfect
 * - A = augmented
 * - d = diminished
 *
 * Examples intervals:
 *
 * - 1P = unison
 * - 3M = major third
 * - 3m = minor third
 * - 4P = perfect fourth
 * - 4A = augmented fourth
 * - 5P = perfect fifth
 * - 5d = diminished fifth
 *
 * @param {string | number} amount Either number of semitones or interval string.
 * @returns Pattern
 * @memberof Pattern
 * @name transpose
 * @example
 * "c2 c3".fast(2).transpose("<0 -2 5 3>".slow(2)).note()
 * @example
 * "c2 c3".fast(2).transpose("<1P -2M 4P 3m>".slow(2)).note()
 */`,meta:{filename:"tonal.mjs",lineno:45,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/tonal",code:{}},description:`<p>Change the pitch of each value by the given amount. Expects numbers or note strings as values.
The amount can be given as a number of semitones or as a string in interval short notation.
If you don't care about enharmonic correctness, just use numbers. Otherwise, pass the interval of
the form: ST where S is the degree number and T the type of interval with</p>
<ul>
<li>M = major</li>
<li>m = minor</li>
<li>P = perfect</li>
<li>A = augmented</li>
<li>d = diminished</li>
</ul>
<p>Examples intervals:</p>
<ul>
<li>1P = unison</li>
<li>3M = major third</li>
<li>3m = minor third</li>
<li>4P = perfect fourth</li>
<li>4A = augmented fourth</li>
<li>5P = perfect fifth</li>
<li>5d = diminished fifth</li>
</ul>`,params:[{type:{names:["string","number"]},description:"<p>Either number of semitones or interval string.</p>",name:"amount"}],returns:[{description:"<p>Pattern</p>"}],memberof:"Pattern",name:"transpose",examples:['"c2 c3".fast(2).transpose("<0 -2 5 3>".slow(2)).note()','"c2 c3".fast(2).transpose("<1P -2M 4P 3m>".slow(2)).note()'],scope:"static",longname:"Pattern.transpose",kind:"member"},{comment:`/**
 * Transposes notes inside the scale by the number of steps.
 * Expected to be called on a Pattern which already has a {@link Pattern#scale}
 *
 * @memberof Pattern
 * @name scaleTranspose
 * @param {offset} offset number of steps inside the scale
 * @returns Pattern
 * @example
 * "-8 [2,4,6]"
 * .scale('C4 bebop major')
 * .scaleTranspose("<0 -1 -2 -3 -4 -5 -6 -4>")
 * .note()
 */`,meta:{filename:"tonal.mjs",lineno:96,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/tonal",code:{}},description:`<p>Transposes notes inside the scale by the number of steps.
Expected to be called on a Pattern which already has a {@link Pattern#scale}</p>`,memberof:"Pattern",name:"scaleTranspose",params:[{type:{names:["offset"]},description:"<p>number of steps inside the scale</p>",name:"offset"}],returns:[{description:"<p>Pattern</p>"}],examples:[`"-8 [2,4,6]"
.scale('C4 bebop major')
.scaleTranspose("<0 -1 -2 -3 -4 -5 -6 -4>")
.note()`],scope:"static",longname:"Pattern.scaleTranspose",kind:"member"},{comment:`/**
 * Turns numbers into notes in the scale (zero indexed). Also sets scale for other scale operations, like {@link Pattern#scaleTranspose}.
 *
 * A scale consists of a root note (e.g. \`c4\`, \`c\`, \`f#\`, \`bb4\`) followed by semicolon (':') and then a [scale type](https://github.com/tonaljs/tonal/blob/main/packages/scale-type/data.ts).
 *
 * The root note defaults to octave 3, if no octave number is given.
 *
 * @name scale
 * @param {string} scale Name of scale
 * @returns Pattern
 * @example
 * n("0 2 4 6 4 2").scale("C:major")
 * @example
 * n("[0,7] 4 [2,7] 4")
 * .scale("C:<major minor>/2")
 * .s("piano")
 * @example
 * n(rand.range(0,12).segment(8).round())
 * .scale("C:ritusen")
 * .s("folkharp")
 */`,meta:{filename:"tonal.mjs",lineno:123,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/tonal",code:{}},description:`<p>Turns numbers into notes in the scale (zero indexed). Also sets scale for other scale operations, like {@link Pattern#scaleTranspose}.</p>
<p>A scale consists of a root note (e.g. <code>c4</code>, <code>c</code>, <code>f#</code>, <code>bb4</code>) followed by semicolon (':') and then a <a href="https://github.com/tonaljs/tonal/blob/main/packages/scale-type/data.ts">scale type</a>.</p>
<p>The root note defaults to octave 3, if no octave number is given.</p>`,name:"scale",params:[{type:{names:["string"]},description:"<p>Name of scale</p>",name:"scale"}],returns:[{description:"<p>Pattern</p>"}],examples:['n("0 2 4 6 4 2").scale("C:major")',`n("[0,7] 4 [2,7] 4")
.scale("C:<major minor>/2")
.s("piano")`,`n(rand.range(0,12).segment(8).round())
.scale("C:ritusen")
.s("folkharp")`],longname:"scale",kind:"member",scope:"global"},{comment:`/**
 * Adds a new custom voicing dictionary.
 *
 * @name addVoicings
 * @memberof Pattern
 * @param {string} name identifier for the voicing dictionary
 * @param {Object} dictionary maps chord symbol to possible voicings
 * @param {Array} range min, max note
 * @returns Pattern
 * @example
 * addVoicings('cookie', {
 *   7: ['3M 7m 9M 12P 15P', '7m 10M 13M 16M 19P'],
 *   '^7': ['3M 6M 9M 12P 14M', '7M 10M 13M 16M 19P'],
 *   m7: ['8P 11P 14m 17m 19P', '5P 8P 11P 14m 17m'],
 *   m7b5: ['3m 5d 8P 11P 14m', '5d 8P 11P 14m 17m'],
 *   o7: ['3m 6M 9M 11A 15P'],
 *   '7alt': ['3M 7m 10m 13m 15P'],
 *   '7#11': ['7m 10m 13m 15P 17m'],
 * }, ['C3', 'C6'])
 * "<C^7 A7 Dm7 G7>".voicings('cookie').note()
 */`,meta:{filename:"voicings.mjs",lineno:84,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/tonal",code:{}},description:"<p>Adds a new custom voicing dictionary.</p>",name:"addVoicings",memberof:"Pattern",params:[{type:{names:["string"]},description:"<p>identifier for the voicing dictionary</p>",name:"name"},{type:{names:["Object"]},description:"<p>maps chord symbol to possible voicings</p>",name:"dictionary"},{type:{names:["Array"]},description:"<p>min, max note</p>",name:"range"}],returns:[{description:"<p>Pattern</p>"}],examples:[`addVoicings('cookie', {
  7: ['3M 7m 9M 12P 15P', '7m 10M 13M 16M 19P'],
  '^7': ['3M 6M 9M 12P 14M', '7M 10M 13M 16M 19P'],
  m7: ['8P 11P 14m 17m 19P', '5P 8P 11P 14m 17m'],
  m7b5: ['3m 5d 8P 11P 14m', '5d 8P 11P 14m 17m'],
  o7: ['3m 6M 9M 11A 15P'],
  '7alt': ['3M 7m 10m 13m 15P'],
  '7#11': ['7m 10m 13m 15P 17m'],
}, ['C3', 'C6'])
"<C^7 A7 Dm7 G7>".voicings('cookie').note()`],scope:"static",longname:"Pattern.addVoicings",kind:"member"},{comment:`/**
 * DEPRECATED: still works, but it is recommended you use .voicing instead (without s).
 * Turns chord symbols into voicings, using the smoothest voice leading possible.
 * Uses [chord-voicings package](https://github.com/felixroos/chord-voicings#chord-voicings).
 *
 * @name voicings
 * @memberof Pattern
 * @param {string} dictionary which voicing dictionary to use.
 * @returns Pattern
 * @example
 * stack("<C^7 A7 Dm7 G7>".voicings('lefthand'), "<C3 A2 D3 G2>").note()
 */`,meta:{filename:"voicings.mjs",lineno:125,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/tonal",code:{}},description:`<p>DEPRECATED: still works, but it is recommended you use .voicing instead (without s).
Turns chord symbols into voicings, using the smoothest voice leading possible.
Uses <a href="https://github.com/felixroos/chord-voicings#chord-voicings">chord-voicings package</a>.</p>`,name:"voicings",memberof:"Pattern",params:[{type:{names:["string"]},description:"<p>which voicing dictionary to use.</p>",name:"dictionary"}],returns:[{description:"<p>Pattern</p>"}],examples:[`stack("<C^7 A7 Dm7 G7>".voicings('lefthand'), "<C3 A2 D3 G2>").note()`],scope:"static",longname:"Pattern.voicings",kind:"member"},{comment:`/**
 * Maps the chords of the incoming pattern to root notes in the given octave.
 *
 * @name rootNotes
 * @memberof Pattern
 * @param {octave} octave octave to use
 * @returns Pattern
 * @example
 * "<C^7 A7 Dm7 G7>".rootNotes(2).note()
 */`,meta:{filename:"voicings.mjs",lineno:151,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/tonal",code:{}},description:"<p>Maps the chords of the incoming pattern to root notes in the given octave.</p>",name:"rootNotes",memberof:"Pattern",params:[{type:{names:["octave"]},description:"<p>octave to use</p>",name:"octave"}],returns:[{description:"<p>Pattern</p>"}],examples:['"<C^7 A7 Dm7 G7>".rootNotes(2).note()'],scope:"static",longname:"Pattern.rootNotes",kind:"member"},{comment:`/**
 * Turns chord symbols into voicings. You can use the following control params:
 *
 * - \`chord\`: Note, followed by chord symbol, e.g. C Am G7 Bb^7
 * - \`dict\`: voicing dictionary to use, falls back to default dictionary
 * - \`anchor\`: the note that is used to align the chord
 * - \`mode\`: how the voicing is aligned to the anchor
 *   - \`below\`: top note <= anchor
 *   - \`duck\`: top note <= anchor, anchor excluded
 *   - \`above\`: bottom note >= anchor
 * - \`offset\`: whole number that shifts the voicing up or down to the next voicing
 * - \`n\`: if set, the voicing is played like a scale. Overshooting numbers will be octaved
 *
 * All of the above controls are optional, except \`chord\`.
 * If you pass a pattern of strings to voicing, they will be interpreted as chords.
 *
 * @name voicing
 * @param {string} dictionary which voicing dictionary to use.
 * @returns Pattern
 * @example
 * voicing("<C Am F G>")
 * @example
 * n("0 1 2 3 4 5 6 7").chord("<C Am F G>").voicing()
 */`,meta:{filename:"voicings.mjs",lineno:170,columnno:0,path:"/Users/michaelgogins/cloud-5/strudel/packages/tonal",code:{}},description:`<p>Turns chord symbols into voicings. You can use the following control params:</p>
<ul>
<li><code>chord</code>: Note, followed by chord symbol, e.g. C Am G7 Bb^7</li>
<li><code>dict</code>: voicing dictionary to use, falls back to default dictionary</li>
<li><code>anchor</code>: the note that is used to align the chord</li>
<li><code>mode</code>: how the voicing is aligned to the anchor
<ul>
<li><code>below</code>: top note &lt;= anchor</li>
<li><code>duck</code>: top note &lt;= anchor, anchor excluded</li>
<li><code>above</code>: bottom note &gt;= anchor</li>
</ul>
</li>
<li><code>offset</code>: whole number that shifts the voicing up or down to the next voicing</li>
<li><code>n</code>: if set, the voicing is played like a scale. Overshooting numbers will be octaved</li>
</ul>
<p>All of the above controls are optional, except <code>chord</code>.
If you pass a pattern of strings to voicing, they will be interpreted as chords.</p>`,name:"voicing",params:[{type:{names:["string"]},description:"<p>which voicing dictionary to use.</p>",name:"dictionary"}],returns:[{description:"<p>Pattern</p>"}],examples:['voicing("<C Am F G>")','n("0 1 2 3 4 5 6 7").chord("<C Am F G>").voicing()'],longname:"voicing",kind:"member",scope:"global"},{kind:"package",longname:"package:undefined",files:["/Users/michaelgogins/cloud-5/strudel/packages/codemirror/codemirror.mjs","/Users/michaelgogins/cloud-5/strudel/packages/codemirror/flash.mjs","/Users/michaelgogins/cloud-5/strudel/packages/codemirror/highlight.mjs","/Users/michaelgogins/cloud-5/strudel/packages/codemirror/index.mjs","/Users/michaelgogins/cloud-5/strudel/packages/codemirror/themes/one-dark.mjs","/Users/michaelgogins/cloud-5/strudel/packages/codemirror/vite.config.js","/Users/michaelgogins/cloud-5/strudel/packages/core/animate.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/color.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/controls.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/cyclist.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/draw.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/drawLine.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/euclid.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/evaluate.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/examples/vite-vanilla-repl/main.js","/Users/michaelgogins/cloud-5/strudel/packages/core/examples/vite-vanilla-repl/tune.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/examples/vite-vanilla-repl-cm6/main.js","/Users/michaelgogins/cloud-5/strudel/packages/core/examples/vite-vanilla-repl-cm6/tunes.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/fraction.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/gist.js","/Users/michaelgogins/cloud-5/strudel/packages/core/hap.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/index.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/logger.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/pattern.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/pianoroll.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/repl.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/signal.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/speak.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/spiral.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/state.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/test/controls.test.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/test/drawLine.test.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/test/fraction.test.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/test/pattern.test.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/test/solmization.test.js","/Users/michaelgogins/cloud-5/strudel/packages/core/test/util.test.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/test/value.test.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/time.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/timespan.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/ui.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/util.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/value.mjs","/Users/michaelgogins/cloud-5/strudel/packages/core/vite.config.js","/Users/michaelgogins/cloud-5/strudel/packages/core/zyklus.mjs","/Users/michaelgogins/cloud-5/strudel/packages/csound/index.mjs","/Users/michaelgogins/cloud-5/strudel/packages/csound/vite.config.js","/Users/michaelgogins/cloud-5/strudel/packages/desktopbridge/index.mjs","/Users/michaelgogins/cloud-5/strudel/packages/desktopbridge/loggerbridge.mjs","/Users/michaelgogins/cloud-5/strudel/packages/desktopbridge/midibridge.mjs","/Users/michaelgogins/cloud-5/strudel/packages/desktopbridge/oscbridge.mjs","/Users/michaelgogins/cloud-5/strudel/packages/desktopbridge/utils.mjs","/Users/michaelgogins/cloud-5/strudel/packages/embed/embed.js","/Users/michaelgogins/cloud-5/strudel/packages/midi/index.mjs","/Users/michaelgogins/cloud-5/strudel/packages/midi/midi.mjs","/Users/michaelgogins/cloud-5/strudel/packages/midi/vite.config.js","/Users/michaelgogins/cloud-5/strudel/packages/mini/index.mjs","/Users/michaelgogins/cloud-5/strudel/packages/mini/krill-parser.js","/Users/michaelgogins/cloud-5/strudel/packages/mini/mini.mjs","/Users/michaelgogins/cloud-5/strudel/packages/mini/test/mini.test.mjs","/Users/michaelgogins/cloud-5/strudel/packages/mini/vite.config.js","/Users/michaelgogins/cloud-5/strudel/packages/osc/osc.mjs","/Users/michaelgogins/cloud-5/strudel/packages/osc/server.js","/Users/michaelgogins/cloud-5/strudel/packages/osc/tidal-sniffer.js","/Users/michaelgogins/cloud-5/strudel/packages/osc/vite.config.js","/Users/michaelgogins/cloud-5/strudel/packages/react/examples/nano-repl/src/App.jsx","/Users/michaelgogins/cloud-5/strudel/packages/react/examples/nano-repl/src/main.jsx","/Users/michaelgogins/cloud-5/strudel/packages/react/examples/nano-repl/vite.config.js","/Users/michaelgogins/cloud-5/strudel/packages/react/postcss.config.js","/Users/michaelgogins/cloud-5/strudel/packages/react/src/App.jsx","/Users/michaelgogins/cloud-5/strudel/packages/react/src/components/Autocomplete.jsx","/Users/michaelgogins/cloud-5/strudel/packages/react/src/components/CodeMirror6.jsx","/Users/michaelgogins/cloud-5/strudel/packages/react/src/components/MiniRepl.jsx","/Users/michaelgogins/cloud-5/strudel/packages/react/src/cx.js","/Users/michaelgogins/cloud-5/strudel/packages/react/src/hooks/useEvent.mjs","/Users/michaelgogins/cloud-5/strudel/packages/react/src/hooks/useFrame.mjs","/Users/michaelgogins/cloud-5/strudel/packages/react/src/hooks/useHighlighting.mjs","/Users/michaelgogins/cloud-5/strudel/packages/react/src/hooks/useKeydown.mjs","/Users/michaelgogins/cloud-5/strudel/packages/react/src/hooks/usePatternFrame.mjs","/Users/michaelgogins/cloud-5/strudel/packages/react/src/hooks/usePostMessage.mjs","/Users/michaelgogins/cloud-5/strudel/packages/react/src/hooks/useStrudel.mjs","/Users/michaelgogins/cloud-5/strudel/packages/react/src/index.js","/Users/michaelgogins/cloud-5/strudel/packages/react/src/main.jsx","/Users/michaelgogins/cloud-5/strudel/packages/react/src/themes/algoboy.js","/Users/michaelgogins/cloud-5/strudel/packages/react/src/themes/blackscreen.js","/Users/michaelgogins/cloud-5/strudel/packages/react/src/themes/bluescreen.js","/Users/michaelgogins/cloud-5/strudel/packages/react/src/themes/strudel-theme.js","/Users/michaelgogins/cloud-5/strudel/packages/react/src/themes/teletext.js","/Users/michaelgogins/cloud-5/strudel/packages/react/src/themes/terminal.js","/Users/michaelgogins/cloud-5/strudel/packages/react/src/themes/whitescreen.js","/Users/michaelgogins/cloud-5/strudel/packages/react/tailwind.config.js","/Users/michaelgogins/cloud-5/strudel/packages/react/vite.config.js","/Users/michaelgogins/cloud-5/strudel/packages/serial/serial.mjs","/Users/michaelgogins/cloud-5/strudel/packages/serial/vite.config.js","/Users/michaelgogins/cloud-5/strudel/packages/soundfonts/convert.js","/Users/michaelgogins/cloud-5/strudel/packages/soundfonts/fontloader.mjs","/Users/michaelgogins/cloud-5/strudel/packages/soundfonts/gm.mjs","/Users/michaelgogins/cloud-5/strudel/packages/soundfonts/index.mjs","/Users/michaelgogins/cloud-5/strudel/packages/soundfonts/list.mjs","/Users/michaelgogins/cloud-5/strudel/packages/soundfonts/sfumato.mjs","/Users/michaelgogins/cloud-5/strudel/packages/soundfonts/vite.config.js","/Users/michaelgogins/cloud-5/strudel/packages/superdough/dspworklet.mjs","/Users/michaelgogins/cloud-5/strudel/packages/superdough/example/main.js","/Users/michaelgogins/cloud-5/strudel/packages/superdough/feedbackdelay.mjs","/Users/michaelgogins/cloud-5/strudel/packages/superdough/helpers.mjs","/Users/michaelgogins/cloud-5/strudel/packages/superdough/index.mjs","/Users/michaelgogins/cloud-5/strudel/packages/superdough/logger.mjs","/Users/michaelgogins/cloud-5/strudel/packages/superdough/reverb.mjs","/Users/michaelgogins/cloud-5/strudel/packages/superdough/sampler.mjs","/Users/michaelgogins/cloud-5/strudel/packages/superdough/superdough.mjs","/Users/michaelgogins/cloud-5/strudel/packages/superdough/synth.mjs","/Users/michaelgogins/cloud-5/strudel/packages/superdough/util.mjs","/Users/michaelgogins/cloud-5/strudel/packages/superdough/vite.config.js","/Users/michaelgogins/cloud-5/strudel/packages/superdough/vowel.mjs","/Users/michaelgogins/cloud-5/strudel/packages/superdough/worklets.mjs","/Users/michaelgogins/cloud-5/strudel/packages/superdough/zzfx.mjs","/Users/michaelgogins/cloud-5/strudel/packages/superdough/zzfx_fork.mjs","/Users/michaelgogins/cloud-5/strudel/packages/tonal/index.mjs","/Users/michaelgogins/cloud-5/strudel/packages/tonal/ireal.mjs","/Users/michaelgogins/cloud-5/strudel/packages/tonal/test/tonal.test.mjs","/Users/michaelgogins/cloud-5/strudel/packages/tonal/test/tonleiter.test.mjs","/Users/michaelgogins/cloud-5/strudel/packages/tonal/tonal.mjs","/Users/michaelgogins/cloud-5/strudel/packages/tonal/tonleiter.mjs","/Users/michaelgogins/cloud-5/strudel/packages/tonal/vite.config.js","/Users/michaelgogins/cloud-5/strudel/packages/tonal/voicings.mjs","/Users/michaelgogins/cloud-5/strudel/packages/transpiler/index.mjs","/Users/michaelgogins/cloud-5/strudel/packages/transpiler/test/transpiler.test.mjs","/Users/michaelgogins/cloud-5/strudel/packages/transpiler/transpiler.mjs","/Users/michaelgogins/cloud-5/strudel/packages/transpiler/vite.config.js","/Users/michaelgogins/cloud-5/strudel/packages/web/vite.config.js","/Users/michaelgogins/cloud-5/strudel/packages/web/web.mjs","/Users/michaelgogins/cloud-5/strudel/packages/webaudio/index.mjs","/Users/michaelgogins/cloud-5/strudel/packages/webaudio/scope.mjs","/Users/michaelgogins/cloud-5/strudel/packages/webaudio/vite.config.js","/Users/michaelgogins/cloud-5/strudel/packages/webaudio/webaudio.mjs","/Users/michaelgogins/cloud-5/strudel/packages/xen/index.mjs","/Users/michaelgogins/cloud-5/strudel/packages/xen/test/xen.test.mjs","/Users/michaelgogins/cloud-5/strudel/packages/xen/tune.mjs","/Users/michaelgogins/cloud-5/strudel/packages/xen/tunejs.js","/Users/michaelgogins/cloud-5/strudel/packages/xen/vite.config.js","/Users/michaelgogins/cloud-5/strudel/packages/xen/xen.mjs"]}],n={docs:e};export{n as j};
//# sourceMappingURL=doc.bd86b523.js.map
