<CsoundSynthesizer>
<CsLicense>
Csound patch test program.
Copyright (c) 2022 by Michael Gogins.

This file is licensed under the terms of the GNU Lesser Public License version 
2.1.
</CsLicense>
<CsOptions>
-d -RWf -m163 -+msg_color=0 --midi-key=4 --midi-velocity=5 -Ffugue2.1.mid --sample-accurate -oREADME.wav
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 128
nchnls = 2
nchnls_i = 1
0dbfs = 1

alwayson "PianoOutFluidsynth"
alwayson "PianoOutPianoteq"
alwayson "OrganOutOrganteq"

# cloud-5
<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" 
style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" />
</a>
<p>All music and examples herein are licensed under the  
<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">
Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

## [Michael Gogins](https://michaelgogins.tumblr.com)

The cloud-5 system is a toolkit and library designed for creating computer 
music that is hosted on Web servers and that runs and plays in the user's Web 
browser. In theory, that can be any current Web browser, even on smartphones and 
tablets, although performance might be an issue. For examples of such music, see 
<a href="https://gogins.github.io/">cloud-music</a>.

The cloud-5 system is based on <a href="https://github.com/gogins/csound-wasm"> 
my own WebAssembly builds of Csound and CsoundAC</a>. Some pieces may use 
third party libraries. The home page of Csound itself is 
<a href="https://csound.com/">here</a>.

Code written as part of cloud-5 is licensed under the terms of the same 
license as Csound, the 
[GNU Lesser Public License, version 2.1](https://github.com/csound/csound/blob/master/COPYING). 
Components and libraries used by cloud-5 come under a variety of open source 
licenses; see the links to individual packages for more information.

## Introduction

The cloud-5 system is designed for making sophisticated computer music purely 
in the HTML5 environment. The system is especially suited for pieces that play 
online, for pieces that play indefinitely, for visual music, for algorithmic 
composition, and for live coding.

cloud-5 runs on every system with an audio output that can run a Web server 
and a standards compliant Web browser. That includes _all_ computers 
running macOS, Linux, or Windows, as well as the more powerful smartphones and 
tablets. 

For recent changes, see the _[Release Notes](#release-notes)_ at the end of 
this document.

## Getting Started

### Pre-requisites

 - A Web server that will run from a configurable directory in which you can 
   read, edit, and write files. On most systems, the simplest way to get a Web 
   server is to install [Python 3](https://www.python.org/).
   
 - A standards-compliant Web browser (currently, that includes nearly all Web 
   browsers). Should already exist on your system. On Android, install a Web 
   server app such as 
   [Phlox](https://play.google.com/store/apps/details?id=com.phlox.simpleserver).
   
 - A text or code editor for writing your compositions. A simple text editor 
   should already exist on your system. I use 
   [Visual Studio Code](https://code.visualstudio.com/) myself, as it is very 
   powerful and yet easy to customize. On Android, install a text editor such as
   [QuickEdit Pro](https://play.google.com/store/apps/details?id=com.rhmsoft.edit.pro). 

### Installation

There is no installation! Simply download the release (`cloud-5.zip`), and 
unzip it into in empty directory.

cloud-5 can be stored on a USB thumb drive, and will run with all functionality 
_from_ the thumb drive. That makes it possible to carry all of your work in 
progress from computer to device to computer.

Or, simply copy the entire cloud-5 directory with all contents to your computer 
or device. Make sure you can execute, read, edit, and write files in your 
cloud-5 directory.

### Configuration

There is no configuration!

If you have built cloud-5 yourself, cloud-5's Web root directory is 
`cloud-5/strudel/website/dist`. If you have downloaded the prebuilt cloud-5 
release, the Web root directory is where you unzipped `cloud-5.zip`.

### Running

 1. Start a local Web server to serve the Web root directory. The easiest 
    way to do this on most systems is to open a terminal, change to the Web 
    root directory, and run `python3 -m http.server`.

 2. Start your Web browser, and navigate to your cloud-5 Web site (usually 
    just something like `https://localhost:8000`). Some users have problems 
    with Firefox, e.g. with WebMIDI permissions. If you experience this, try 
    the Chrome browser.

 3. The home page of the default installation is 
    [cloud_music_no_1.html](cloud_music_no_1.html). Verify that you see 
    animated graphics on this page, and can play and hear the piece.

 4. Some cloud-5 pieces use the dat.gui library to create a popup menu of 
    controls for Csound instruments or other purposes. You can create new 
    presets, and you can get the Web browser to remember the current preset 
    parameters in local storage. If you need to revert to the hard-coded 
    parameters in a piece, clear local storage in the browser settings, or 
    in the browser's debugger.

## Making Music

In cloud-5, musical compositions are written as Web pages, i.e. as .html 
files. 

It's a good idea for each composition to be written as just one .html file. 
It must end up in your `cloud-5/strudel/website/dist` directory. Any Csound 
orchestra code, JavaScript code, and GLSL shader programs should simply be 
embedded in the HTML file, e.g. in template strings (string literals) in 
JavaScript code, or included as `<script>` or `<textview>` elements.

There are many ways to write compositions, because the capabilities of Csound, 
Strudel, and HTML5 are so vast. Start out by a making a copy of one of the 
examples below, and edit it to suit your own purposes. 

### Tutorial Examples

These are pieces designed to show how to use the new architecture for cloud-5 
based on `cloud-5.js`, a library of resuable Web components that greatly 
simplifies writing cloud music pieces.

- [`cloud5-example-score-generator.html`](cloud5-example-score-generator.html): 
  a fixed-length piece with a score generated by CsoundAC, with an animated 
  piano roll display and audio visualization.

- [`cloud5-example-parametric-lindenmayer.html`](cloud5-example-parametric-lindenmayer.html): 
  a fixed-length piece with a score generated by a parametric Lindenmayer 
  system, with an animated piano roll display and audio visualization.

- [`cloud5-example-strudel.html`](cloud5-example-strudel.html): always-on 
  music produced by a Strudel patch, with audio visualization. This piece is 
  live-codeable.

- [`cloud5-example-visual-music.html`](cloud5-example-visual-music.html): 
  always-on visual music produced by a GLSL shader that is sampled and 
  shaped using CsoundAC.

### Other Things

 - [Strudel REPL](strudel_repl.html), exactly like the main Strudel Web site.

 - [CsoundAC Reference](jsdocs/), reference documentation for cloud-5's 
   JavaScript code.
 
 - A [minimal example](minimal.html) that just plays an embedded Csound piece.
 
 - A [Csound Player](player.html) that will play, and let you edit, any 
   Csound piece that you paste into the text area.
   
 - [Message from Another Planet](message.html), a Csound piece with a basic 
   HTML user interface.
 
 - [Trichord Space](trichord_space.cloud5.html), an interactive piece that displays 
   Dmitri Tymoczko's chord space for trichords, with the ability to perform, 
   hear, and visualize various operations on the chords in the space.
 
### Components

 - [Csound](https://csound.com/) version 6.18, one of the oldest and most 
   powerful sound programming languages, compiled for WebAssembly to run in 
   Web browers in [csound-wasm](https://github.com/gogins/csound-wasm).
   
 - [CsoundAC](https://github.com/gogins/csound-ac), my C++ library for 
   algorithmic composition with Csound, compiled for WebAssembly to run in 
   Web browsers in [csound-wasm](https://github.com/gogins/csound-wasm), and 
   incorporating my implementation of mathematical theories of chord space and 
   neo-Reimannian operations, and scales and functional harmony, by 
   [Dmitri Tymoczko](http://dmitri.mycpanel.princeton.edu/).
   
 - A collection of predefined Csound instrument definitions by me from 
   [CsoundAC](https://github.com/gogins/csound-ac/tree/master/patches).
 
 - [Strudel](https://strudel.tidalcycles.org/), a JavaScript port of the 
   widely used live coding system [Tidal Cycles](http://tidalcycles.org/), by 
   Alex McLean, Felix Roos, and others. 
   
 - Of course, a standards-compliant Web browser, which has an awesome set of 
   capabilities, including the most widely used programming language, 
   JavaScript, which can call Csound, CsoundAC, and Strudel.

### Design Notes

The integration between Csound and Strudel has been implemented without any 
changes to Strudel's source code. Instead, the Csound and CsoundAC APIs are 
exposed as global singletons in `globalThis.csound` and `globalThis.csoundac`. 
These are copied into the Strudel REPL's JavaScript context, also as 
`globalThis.csound` and `globalThis.csoundac`. This is permitted because the 
cloud-5 Web site and the Strudel REPL's IFrame have the same HTTP origin. 

The cloud-5 build copies cloud-5 pieces, examples, tests, documentation, and 
other resources from the cloud-5 repository's root directory (`cloud-5`) to 
the Strudel submodule's Web root directory (`cloud-5/strudel/website/dist`) 
-- _after_ building Strudel.

This means that cloud-5 becomes a completely static Web site hosted from 
`cloud-5/strudel/website/dist`.

It also means that any Strudel patch can import or access Csound, CsoundAC, or 
any JavaScript or other resource in the Web root.

### Capabilities

 - High-resolution, sample-accurate sound synthesis using one of the largest and 
   most capable libraries that exists for synthesis and signal processing, the 
   [Csound opcodes](https://csound.com/docs/manual/index.html).
   
 - Interactive live music coding using the domain-specific, real-time music 
   programming language Strudel; this includes a neat animated piano roll 
   display of currently playing notes in the music.
   
 - Control of Csound from Strudel. This includes both real-time notes 
   generated by Strudel patches for the `csound` and `csoundn` outputs, and 
   real-time control channel values created by Strudel Patterns, including the 
   new `slider` widget.
   
 - MIDI input and output from Csound and Strudel.
 
 - Open Sound Control input and output from Csound and Strudel.
   
 - Several systems for time-frequency analysis/synthesis, from Csound, including 
   Victor Lazzarini's 
   [phase vocoder streaming](https://csound.com/docs/manual/SpectralRealTime.html) 
   (PVS) opcodes.
 
 - Several high-fidelity sample players, from Csound 
   ([Fluidsynth opcodes](https://csound.com/docs/manual/SiggenSample.html#SiggenSampleSF)) 
   and Strudel ([superdough](https://github.com/tidalcycles/strudel/tree/main/packages/superdough)).
 
 - High-resolution, three-dimensional, animated computer graphics using 
   WebGL and/or OpenGL Shader Language (GLSL), from the Web browser.
   
 - All of the staggering panoply of capabilities that are built into every 
   standards-compliant Web browser, see [HTML5 Test](https://html5test.com/).

## Running in the Browser

### Limitations

The major limitation of running in the browser is that csound-5 pieces are 
sandboxed, and can write files only to a temporary filesystem inside the 
sandbox. It is not possible to write soundfiles directly to the filesystem on 
the user's computer.

However, in some cloud-5 pieces, the Csound orchestra supports not only 
rendering to the sandbox filesystem, but also automatically downloading the 
finished soundfile to the user's Downloads directory. This done using the 
_Render_ on the cloud-5 menu. However, the WebAssembly runtime sets a hard 
limit on the size of such soundfiles, which cannot exceed the size of the 
WebAssembly heap; pieces should probably not be more than about 10 minutes 
long.

It is _also_ possible to use an audio loopback driver such as 
[BlackHole](https://github.com/ExistentialAudio/BlackHole) to route 
audio produced by cloud-5 to a digital audio workstation that _can_ write 
soundfiles. The maximum resolution of such soundfiles is floating-point 
samples at 48 KHz, significantly higher resolution than the CD format, and 
there is no hard limit to the size of the resulting soundfiles.

To set this up on the Mac, open the Audio MIDI Setup app, click on the `+` at
the bottom, and click on Create Multi-Ouput Device, including both your 
standard audio output and BlackHole. Then, in the Sound settings, select that 
Multi-Output Device as the default output. Finally, in your DAW or recording 
software, select BlackHole as the audio input device.

## Documentation

 - [My paper on the cloud-5 system](cloud-5.pdf).

 - [cloud-5 API reference](jsdocs/index.html).

 - [Strudel documentation](https://strudel.tidalcycles.org/workshop/getting-started).

 - [Csound reference](https://csound.com/docs/manual/index.html).
   
## Extending cloud-5

You can extend the capabilities of cloud-5 in several ways, including:

 - Write user-defined opcodes (UDOs) in Csound that you can `#include` in any 
   Csound orchestra.
   
 - Write a custom JavaScript module that you can use in any .html file; it 
   must be served from cloud-5's Web root, i.e. `./my_file.mjs`.
 
 - Write code in another high-level language and compile it for WebAssembly, 
   so that it will run in any standards-compliant Web browser.

 - Subclass any of cloud-5's custom HTML elements, or create your own.
   
 - Adapt for your musical purposes any other software that can run in a Web 
   browser and be controlled by JavaScript. That covers rather a lot of 
   ground....
   
## Contributing to cloud-5

 - Enter an issue in the cloud-5 GitHub repository: either a bug, or a 
   feature request. It should briefly describe what you are going to 
   contribute.

 - Make your own fork of the cloud-5 repository.
 
 - Make any contributions or changes in your fork.
 
 - Create a pull request in your fork. Reference the issue you have 
   created.
 
 - I will review the pull request, and I will probably merge it if it does not 
   break existing functionality, is in keeping with the general objectives of 
   cloud-5, and builds and runs for me.
 
Avoid introducing new external dependencies as much as possible. Avoid 
introducing new programming languages as much as possible. Do not load 
dependencies from content distribution networks (CDNs); all dependendencies 
used by cloud-5 must be static resources in the cloud-5 directory; 
that includes a bundled version of Strudel.

## Building

It's not necessary to build cloud-5 in order to run it, or to write new pieces 
for it. But if you want to build it, the fundamental assumptions of the build 
are:

 1. Absolutely no changes or patches are made to any code in the `strudel` 
    directory of this repository. The cloud-5 build invokes the Strudel build, 
    and once that has completed, the cloud-5 build copies pieces 
    and other files from the `cloud-5` root directory to Strudel's Web root 
    directory (`cloud-5/strudel/website/dist`), and renames some files.
    
 2. The end product is a static cloud-5 Web site in 
    `cloud-5/strudel/website/dist`. Once this site has been built, a composer 
    can simply drop new pieces (.html files) into that directory, and they 
    will run. At any time, this directory can be published as a public 
    Web site.

The actual build steps are:

 1. Clone the [cloud-5 GitHub repository](https://github.com/gogins/cloud-5.git).

 2. Install [pnpm](https://www.npmjs.com/package/pnpm), which cloud-5 and 
    Strudel use rather than npm. On macOS (I don't know about other platforms), 
    you may need to specifically install node@18.

 2. Change to the `cloud-5` directory.

 3. Execute `pnpm install` to update dependencies of cloud-5.

 4. Execute `pnpm run setup` to bring in the Strudel submodule.

 5. Execute `pnpm run build` to build Strudel and copy cloud-5 into 
    `strudel/website/dist`.

 6. Execute `pnpm run local` to run a local Web site from your `dist` 
    directory.

## Running in NW.js

It also is possible to run cloud-5 pieces locally in [NW.js](https://nwjs.io/) 
using [csound.nwjs](https://github.com/gogins/csound-nwjs). In this 
case, csound.node is a native addon for NW.js based on the Csound shared 
library, and such pieces can load native code plugins and read and write to 
the local filesystem.

This involves installing a number of pre-requisites, but the advantages 
include somewhat higher performance from native code Csound, the ability to 
use native plugins (both Csound plugin opcodes and VST3 plugins), and the 
ability to read and write in the local filesystem.

### Installation

 1. Install regular [Csound for desktop computers](https://csound.com/download.html).

 2. Install [pnpm](https://pnpm.io/installation).

 2. Install [csound.node](https://github.com/gogins/csound-nwjs). Note that 
    the API for csound.node is virtually the same as the API for my WebAssembly build 
    of Csound.

 2. Install [NW.js](https://nwjs.io/).

### Configuration and Running

Read about [csound.nwjs](https://github.com/gogins/csound-nwjs) 
and make sure that the application directory for your `csound.node` pieces is the 
`cloud-5` directory, which includes necessary resources.

## Release Notes

### [v2.0](https://github.com/gogins/cloud-5/releases/tag/v1.2)

 - Moved cloud-5's Web root directory from to `cloud-5/strudel/website/dist`. 
   This makes it possible to integrate Strudel, Csound, and CsoundAC without any 
   patches or other modifications of Strudel source code.

 - Added one-time singleton creation code for Csound and CsoundAC to 
   `csound_loader.js`.

 - Simplified the integration of Csound, CsoundAC, and Strudel by ensuring 
   that Csound and CsoundAC exist as fully initialized global objects in the 
   JavaScript context (as `globalThis.csound` and `globalThis.csoundac`), 
   before any HTML elements run.

### [v1.1](https://github.com/gogins/cloud-5/releases/tag/v1.1)

 - Made a clearer distinction between the Web site serving showcase for 
 cloud-music pieces, and the README.md for the cloud-5 system.

 - Added a global menu with a curated list of better pieces.

 - Improved layouts to deal with presence/absence of global menu.

### [v1](https://github.com/gogins/cloud-5/releases/tag/v1-beta)

 - Updated Csound, CsoundAC, and Strudel.

 - Edited README.md for clearer build instructions.

 - Added non-chord tones to `csound::Scale` when conforming notes to a  
   Chord of the Scale.
 
- Added [Polymetric](polymetric.html) piece.

### [v1.0beta](https://github.com/gogins/cloud-5/releases/tag/v1-beta)

 - Added cloud-5.js, cloud-5.css, example pieces, and my paper on using 
   cloud-5. These greatly simplify writing cloud music pieces.

 - Various bug fixes ported from CsoundAC's Silencio score, used for the piano 
   roll display.

 - Updated Csound, CsoundAC, and Strudel.

### [v0.2](https://github.com/gogins/cloud-5/commits/v0.2)

 - Added _Record_ and _Pause_ button to _Cloud Music No. 14_, for the user to
 download a soundfile that records the performance using Csound's `fout` 
 opcode.

 - Updated Csound, [csound-wasm](https://github.com/gogins/csound-wasm), 
   and Strudel to current versions.

### [v0.1](https://github.com/gogins/cloud-5/commits/v0.1)

 - Improved user interface and code organization in some pieces, making them 
   more usable as templates for newer pieces.

 - Improved documentation.

 - Updated Csound, [csound-wasm](https://github.com/gogins/csound-wasm), 
   and Strudel to current versions.

 - Pieces in cloud-5, including pieces using Strudel, can now also run locally 
   in [NW.js](https://nwjs.io/) using 
   [csound.node](https://github.com/gogins/csound-extended-node).

### [v0.1beta7](https://github.com/gogins/cloud-5/commits/v0.1beta7)

 - Updated Csound to version 6.19.0.

 - Improved [csound-wasm](https://github.com/gogins/csound-wasm) 
   and the [Cloud Music No. 9](cloud_music_no_9.html) example to support 
   running either in NW.js with native Csound, or in Web browsers with 
   Csound for WebAssembly. This makes it possible to compose pieces 
   using Strudel that use native Csound, VST plugins, access to the local 
   filesystem, and so on.

### [v0.1beta6](https://github.com/gogins/cloud-5/commits/v0.1beta6)

 - Introduced the CsoundAC `track` function, a variant of Strudel's `arrange` 
   that does not crash when the number of cycles for a section is set to zero 
   to silence it.
   
 - Improved the CsoundAC `csoundn` output to send all control parameters 
   with names beginning `gi` or `gk` to Csound as control channel values; 
   these channels must first be set up in the Csound orchestra with the same 
   names.
   
 - Added `cancyle.html`, a piece designed for live performance by doing a 
   modest amount of live coding during play.
   

### [v0.1beta5](https://github.com/gogins/cloud-5/commits/v0.1beta5)

 - Updated Strudel to get the extremely useful `slider`, which can be either 
   discrete or continuous. The `slider` is embedded directly into the Strudel 
   patch.
 
 - Added some code to `csoundn` that sends the value of any Strudel control 
   registered with `createParam` and whose name begins with `gi` or `gk` to 
   Csound as a control channel value. This also means that the new `slider` 
   widget in Strudel can send its value to the Csound control channel.
 
### [v0.1beta4](https://github.com/gogins/cloud-5/commits/v0.1beta4)

 - Attempts have been made to correct the scheduling of the `csoundn` output 
   based on a trigger, and to get `csoundn` to output correct piano roll 
   events.
 
 - Put in diagnostic messages marked `sync` for testing.
 
 - Colorize notes in the piano roll that come from `csoundn`.
 
 - In `package.json` always make a releasable zip file in each build.

### [v0.1beta3](https://github.com/gogins/cloud-5/commits/v0.1beta3)

 - Put in needed patch for `cyclist.mjs`.
 
 - Restored concatenated Strudel controls string in `csoundac.mjs`.

### [v0.1beta2](https://github.com/gogins/cloud-5/commits/v0.1beta2)

 - Improved README.md/index.html.

 - Corrected broken links and incorrect credits in example pieces.

 - Replaced the favicon from Strudel with cloud-5's own favicon.
 
### [v0.1beta](https://github.com/gogins/cloud-5/commits/v0.1beta)

 - This was the initial release.

// Comment out if you don't have the Steinway_C.sf2 SoundFont.
//#include "PianoOutFluidsynth.inc"

// Comment out if you don't have the Pianoteq and vst4cs.
//#include "PianoOutPianoteq.inc"

// Comment out if you don't have the Organtec and vst4cs.
//#include "OrganOutOrganteq.inc"

#include "MasterOutput.inc"

iampdbfs init 1
prints "Default amplitude at 0 dBFS: %9.4f", iampdbfs
idbafs init dbamp(iampdbfs)
prints "dbA at 0 dBFS:               %9.4f", idbafs
iheadroom init 6
prints "Headroom (dB):               %9.4f", iheadroom
idbaheadroom init idbafs - iheadroom
prints "dbA at headroom:             %9.4f", idbaheadroom
iampheadroom init ampdb(idbaheadroom)
prints "Amplitude at headroom:       %9.4f", iampheadroom
prints "Balance so the 'overall amps' at the end of performance is -6 dBFS."
prints "nchnls:                      %9.4f", nchnls

connect "README", "outleft", "MasterOutput", "inleft"
connect "README", "outright", "MasterOutput", "inright"
connect "PianoOutFluidsynth", "outleft", "MasterOutput", "inleft"
connect "PianoOutFluidsynth", "outright", "MasterOutput", "inright"
connect "PianoOutPianoteq", "outleft", "MasterOutput", "inleft"
connect "PianoOutPianoteq", "outright", "MasterOutput", "inright"
connect "OrganOutOrganteq", "outleft", "MasterOutput", "inleft"
connect "OrganOutOrganteq", "outright", "MasterOutput", "inright"

alwayson "MasterOutput"

</CsInstruments>
<CsScore>
f 0 300
i  1      65.0000    5.0000   36.0000   70.0000 0 0.5
i  1      65.0000    5.0000   48.0000   70.0000 0 0.5
i  1      65.0000    5.0000   55.0000   70.0000 0 0.5
i  1      65.0000    5.0000   59.0000   70.0000 0 0.5
i  1      65.0000    5.0000   64.0000   70.0000 0 0.5
i  1      72.3333    0.6667   29.0000   60.0000 0 0.5
i  1      72.3958    0.1250   24.0000   60.0000 0 0.5
i  1      72.8958    1.0000   86.0000   60.0000 0 0.5
i  1      73.3958    1.0000   25.0000   60.0000 0 0.5
i  1      73.5625    0.3333   67.0000   60.0000 0 0.5
i  1      73.8958    0.6667   62.0000   60.0000 0 0.5
i  1      74.0208    0.2500   31.0000   60.0000 0 0.5
i  1      74.5208    1.0000   45.0000   60.0000 0 0.5
i  1      74.6875    0.3333   24.0000   60.0000 0 0.5
i  1      74.7500    0.1250   75.0000   60.0000 0 0.5
i  1      74.9167    0.3333   54.0000   60.0000 0 0.5
i  1      74.9792    0.1250   64.0000   60.0000 0 0.5
i  1      75.0417    0.1250   42.0000   60.0000 0 0.5
i  1      75.1667    0.2500   69.0000   60.0000 0 0.5
i  1      75.6667    1.0000  101.0000   60.0000 0 0.5
i  1      75.7917    0.2500   57.0000   60.0000 0 0.5
i  1      75.8542    0.1250   52.0000   60.0000 0 0.5
i  1      76.0208    0.3333   74.0000   60.0000 0 0.5
i  1      76.5208    1.0000   46.0000   60.0000 0 0.5
i  1      76.6458    0.2500   67.0000   60.0000 0 0.5
i  1      76.8125    0.3333   66.0000   60.0000 0 0.5
i  1      77.1459    0.6667   38.0000   60.0000 0 0.5
i  1      77.2084    0.1250   31.0000   60.0000 0 0.5
i  1      77.2709    0.1250   95.0000   60.0000 0 0.5
i  1      77.3334    0.1250   58.0000   60.0000 0 0.5
i  1      77.6667    0.6667   80.0000   60.0000 0 0.5
i  1      78.1667    1.0000   38.0000   60.0000 0 0.5
i  1      78.2917    0.2500   55.0000   60.0000 0 0.5
i  1      78.7917    1.0000   91.0000   60.0000 0 0.5
i  1      79.2917    1.0000   48.0000   60.0000 0 0.5
i  1      79.6250    0.6667   42.0000   60.0000 0 0.5
i  1      79.6875    0.1250   41.0000   60.0000 0 0.5
i  1      79.7500    0.1250   99.0000   60.0000 0 0.5
i  1      79.8125    0.1250   51.0000   60.0000 0 0.5
i  1      80.3125    1.0000   66.0000   60.0000 0 0.5
i  1      80.4375    0.2500  102.0000   60.0000 0 0.5
i  1      80.9375    1.0000   74.0000   60.0000 0 0.5
i  1      81.2709    0.6667   37.0000   60.0000 0 0.5
i  1      81.4375    0.3333   70.0000   60.0000 0 0.5
i  1      81.5625    0.2500   54.0000   60.0000 0 0.5
i  1      81.8959    0.6667   45.0000   60.0000 0 0.5
i  1      82.0625    0.3333   68.0000   60.0000 0 0.5
i  1      82.1875    0.2500   70.0000   60.0000 0 0.5
i  1      82.3542    0.3333  101.0000   60.0000 0 0.5
i  1      82.8542    1.0000   34.0000   60.0000 0 0.5
i  1      82.9167    0.1250   75.0000   60.0000 0 0.5
i  1      83.4167    1.0000   83.0000   60.0000 0 0.5
i  1      83.5417    0.2500   47.0000   60.0000 0 0.5
i  1      83.6667    0.2500   58.0000   60.0000 0 0.5
i  1      83.7917    0.2500  110.0000   60.0000 0 0.5
i  1      88.4792    0.1250   24.0000   68.0000 0 0.5
i  1      89.1667    0.1250   27.0000   74.0000 0 0.5
i  1      89.8542    0.1250   30.0000   74.0000 0 0.5
i  1      90.5417    0.1250   33.0000   68.0000 0 0.5
i  1      91.2292    0.1250   36.0000   74.0000 0 0.5
i  1      91.9167    0.1250   39.0000   62.0000 0 0.5
i  1      92.6042    0.1250   42.0000   74.0000 0 0.5
i  1      93.2917    0.1250   45.0000   68.0000 0 0.5
i  1      93.9792    0.1250   48.0000   68.0000 0 0.5
i  1      94.6667    0.1250   51.0000   80.0000 0 0.5
i  1      95.3542    0.1250   54.0000   68.0000 0 0.5
i  1      96.0417    0.1250   57.0000   74.0000 0 0.5
i  1      96.7292    0.1250   60.0000   74.0000 0 0.5
i  1      97.4167    0.1250   63.0000   68.0000 0 0.5
i  1      98.1042    0.1250   66.0000   80.0000 0 0.5
i  1      98.7917    0.1250   69.0000   62.0000 0 0.5
i  1      99.4792    0.1250   72.0000   68.0000 0 0.5
i  1     100.1667    0.1250   75.0000   68.0000 0 0.5
i  1     100.8542    0.1250   78.0000   80.0000 0 0.5
i  1     101.5417    0.1250   81.0000   80.0000 0 0.5
i  1     102.2292    0.1250   84.0000   74.0000 0 0.5
i  1     102.9167    0.1250   87.0000   80.0000 0 0.5
i  1     103.6042    0.1250   90.0000   80.0000 0 0.5
i  1     104.2917    0.1250   93.0000   74.0000 0 0.5
i  1     104.9792    0.1250   96.0000   80.0000 0 0.5
i  1     105.6667    0.1250   99.0000   80.0000 0 0.5
i  1     106.3542    0.1250  102.0000   80.0000 0 0.5
i  1     107.0417    0.1250  105.0000   62.0000 0 0.5
i  1     107.9167    0.2500   24.0000   68.0000 0 0.5
i  1     108.7917    0.2500   27.0000   80.0000 0 0.5
i  1     109.6667    0.2500   30.0000   62.0000 0 0.5
i  1     110.5417    0.2500   33.0000   62.0000 0 0.5
i  1     111.4167    0.2500   36.0000   80.0000 0 0.5
i  1     112.2917    0.2500   39.0000   80.0000 0 0.5
i  1     113.1667    0.2500   42.0000   74.0000 0 0.5
i  1     114.0417    0.2500   45.0000   80.0000 0 0.5
i  1     114.9167    0.2500   48.0000   74.0000 0 0.5
i  1     115.7917    0.2500   51.0000   80.0000 0 0.5
i  1     116.6667    0.2500   54.0000   68.0000 0 0.5
i  1     117.5417    0.2500   57.0000   80.0000 0 0.5
i  1     118.4167    0.2500   60.0000   74.0000 0 0.5
i  1     119.2917    0.2500   63.0000   74.0000 0 0.5
i  1     120.1667    0.2500   66.0000   62.0000 0 0.5
i  1     121.0417    0.2500   69.0000   80.0000 0 0.5
i  1     121.9167    0.2500   72.0000   62.0000 0 0.5
i  1     122.7917    0.2500   75.0000   74.0000 0 0.5
i  1     123.6667    0.2500   78.0000   68.0000 0 0.5
i  1     124.5417    0.2500   81.0000   74.0000 0 0.5
i  1     125.4167    0.2500   84.0000   62.0000 0 0.5
i  1     126.2917    0.2500   87.0000   62.0000 0 0.5
i  1     127.1667    0.2500   90.0000   62.0000 0 0.5
i  1     128.0417    0.2500   93.0000   62.0000 0 0.5
i  1     128.9167    0.2500   96.0000   62.0000 0 0.5
i  1     129.7917    0.2500   99.0000   80.0000 0 0.5
i  1     130.6667    0.2500  102.0000   68.0000 0 0.5
i  1     131.5417    0.2500  105.0000   80.0000 0 0.5
i  1     135.0417    2.0000   24.0000   80.0000 0 0.5
i  1     138.5417    2.0000   27.0000   80.0000 0 0.5
i  1     142.0417    2.0000   30.0000   68.0000 0 0.5
i  1     145.5417    2.0000   33.0000   74.0000 0 0.5
i  1     149.0417    2.0000   36.0000   74.0000 0 0.5
i  1     152.5417    2.0000   39.0000   62.0000 0 0.5
i  1     156.0417    2.0000   42.0000   80.0000 0 0.5
i  1     159.5417    2.0000   45.0000   68.0000 0 0.5
i  1     163.0417    2.0000   48.0000   74.0000 0 0.5
i  1     166.5417    2.0000   51.0000   62.0000 0 0.5
i  1     170.0417    2.0000   54.0000   68.0000 0 0.5
i  1     173.5417    2.0000   57.0000   80.0000 0 0.5
i  1     177.0417    2.0000   60.0000   74.0000 0 0.5
i  1     180.5417    2.0000   63.0000   80.0000 0 0.5
i  1     184.0417    2.0000   66.0000   68.0000 0 0.5
i  1     187.5417    2.0000   69.0000   62.0000 0 0.5
i  1     191.0417    2.0000   72.0000   74.0000 0 0.5
i  1     194.5417    2.0000   75.0000   68.0000 0 0.5
i  1     198.0417    2.0000   78.0000   68.0000 0 0.5
i  1     201.5417    2.0000   81.0000   62.0000 0 0.5
i  1     205.0417    2.0000   84.0000   80.0000 0 0.5
i  1     208.5417    2.0000   87.0000   62.0000 0 0.5
i  1     212.0417    2.0000   90.0000   80.0000 0 0.5
i  1     215.5417    2.0000   93.0000   80.0000 0 0.5
i  1     219.0417    2.0000   96.0000   62.0000 0 0.5
i  1     222.5417    2.0000   99.0000   74.0000 0 0.5
i  1     226.0417    2.0000  102.0000   68.0000 0 0.5
i  1     229.5417    2.0000  105.0000   62.0000 0 0.5
i  1.01  234.5417   -1.0000   36.0000   70.0000 0 0.5
i  1.02  235.5417   -1.0000   48.0000   70.0000 0 0.5
i  1.03  236.5417   -1.0000   55.0000   70.0000 0 0.5
i  1.04  237.5417   -1.0000   59.0000   70.0000 0 0.5
i  1.05  238.5417   -1.0000   64.0000   70.0000 0 0.5
i  1.06  239.5417   -1.0000   68.0000   70.0000 0 0.5
i -1.01  244.5417    0.0000   36.0000    0.0000 0 0.5
i -1.02  245.5417    0.0000   48.0000    0.0000 0 0.5
i -1.03  246.5417    0.0000   55.0000    0.0000 0 0.5
i -1.04  247.5417    0.0000   59.0000    0.0000 0 0.5
i -1.05  248.5417    0.0000   64.0000    0.0000 0 0.5
i -1.06  249.5417    0.0000   67.0000    0.0000 0 0.5
i  1.10  264.5417   -1.0000   36.0000   70.0000 0 0.5
i  1.10  265.5417   -1.0000   48.0000   70.0000 0 0.5
i  1.10  266.5417   -1.0000   55.0000   70.0000 0 0.5
i  1.10  267.5417   -1.0000   59.0000   70.0000 0 0.5
i  1.10  268.5417   -1.0000   64.0000   70.0000 0 0.5
i  1.10  269.5417   -1.0000   68.0000   70.0000 0 0.5
i -1.10  274.5417    0.0000   77.0000    0.0000 0 0.5

</CsScore>
</CsoundSynthesizer>
