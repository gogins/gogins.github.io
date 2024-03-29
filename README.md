<script>
if ('caches' in window) {
    caches.keys().then(function(names) {
    for (let name of names)
        caches.delete(name);
        console.log(`deleted ${name} from caches.`);
    });
}
</script>
# cloud-music 

## Computer music in the cloud by Michael Gogins 

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">
<img alt="Creative Commons License" style="border-width:0" 
src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />This 
work is licensed under a <a rel="license" 
href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons 
Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

This is real music. But it is not a streaming recording. It is not performed 
in a concert. These pieces are Web pages that are loaded from my Web server 
and run in your browser -- in _any_ standard Web browser, including mobile 
devices (at least, if they are powerful enough).

Each piece will play indefinitely. There may or may not be animated visuals 
along with the music. The listener may or may not be able to customize the 
piece -- perhaps quite a bit, amounting to a new piece, co-composed with me.

The underlying technology is my WebAssembly build of Csound with CsoundAC. 
Some pieces use third party libraries, especially [Strudel](https://github.com/tidalcycles/strudel),
a JavaScript port of the live coding system [Tidal Cycles](https://tidalcycles.org/).

- A [Csound Player](player.html) that will play, and let you edit, any 
Csound piece that you paste into the text area.

- [Message from Another Planet](message.html), a Csound piece with a basic 
HTML user interface.

- [Strudel REPL](strudel_repl.html), exactly the same as the main Strudel Web 
site.

- [Trichord Space](trichord_space.cloud5.html), an interactive piece that displays 
Dmitri Tymoczko's chord space for trichords, with the ability to perform, 
hear, and visualize various operations on the chords in the space.

- [Scrims](scrims.html), a JavaScript piece that samples an animated WebGL 
hopalong fractal to obtain notes that are then harmonized using CsoundAC's 
chord space operations.

For more information on the following pieces, read the _About_ page in the 
piece itself.

- [Cloud Music No. 1](cloud_music_no_1.html).

- [Cloud Music No. 2](cloud_music_no_2.html).

- [Cloud Music No. 3](cloud_music_no_3.html).

- [Cloud Music No. 4](cloud_music_no_4.html).

- [Cloud Music No. 6](cloud_music_no_6.html).

- [Cloud Music No. 8](cloud_music_no_8.html).

- [Cloud Music No. 9](cloud_music_no_9.html).

- [Cloud Music No. 13](cloud_music_no_13.html).

- [Cloud Music No. 14](cloud_music_no_14.html). This one has a button so the user can 
record a performance and download the resulting soundfile.

- [Cancycle](cancycle.html), a piece for live coding.

### Experiments

I am working on supporting the use of CsoundAC in the Strudel REPL. The most 
important thing is to import the `csoundac.mjs` module in your Strudel patch. 
To see how this is done, look at the following pieces. At the present time, 
these are also the unit tests fr `csoundac.mjs`. Comments and suggestions are 
wecome.

- [CsoundAC Example 1](ac_example_1.html).

## cloud-music as a Studio and/or Development Environment

I have designed this repository not only to present some of my compositions, 
but also to serve as a development environment/computer music studio for 
working with Csound, algorithmic composition, and live coding in a 
_completely platform-independent way_.

All software used here is JavaScript, WebAssembly, or HTML. All third party 
dependencies are contained in this repository as static files.

To use cloud-music, fork cloud-music on GitHub and clone your fork on your 
own computer. You can also just download the latest cloud-music release as a zip 
file and unzip it on your computer.

_This is actually the easiest way to install a usable version of Csound on your 
computer._

### Writing New Compositions

There is no need to build or configure anything. In a terminal, simply change 
to your cloud-music directory and run `python3 -m http.server`. Then you can 
use your Web browser to go to `http://localhost:8000`, where you can view and 
run any of these compositions in your browser.

To create a new composition, simply create a new HTML file. You can copy one 
of my existing pieces as a template and modify it, or you can create a new HTML 
file from scratch.

**__Important note!__** If you are simply using cloud-music to write pieces, 
write them in the `dist` directory. However, if you are going to build 
cloud-music yourself, for example to keep up with new releases of Strudel, 
then write your pieces in the `public` directory, and build cloud-music.

Although cloud-music renders audio only in real time, it is easy to use an 
audio loopback driver to route audio from the system output to an audio 
recorder and save the recording as a soundfile. On my MacBook Pro, I have been 
able to use [BlackHole](https://github.com/ExistentialAudio/BlackHole) to 
route audio from cloud-music pices to [Audacity](https://www.audacityteam.org/).

### Writing New Software

Because algorithmic compositions are generally also software, the line between 
compositions and other software can become blurred. However, it is often the 
case that a composer will write new software as libraries or other resources 
to support a number of their musical compositions.

To develop this kind of software in your fork of cloud-music, keep in mind 
that the cloud-music project uses [pnpm](https://www.npmjs.com/), which of 
course must first be installed. 

If you just want to work in the context of a Web site created in your fork of 
cloud-music, then just writing static code in the `public` directory would be 
fine, and by far the easiest. 

Otherwise, take a look at [README.md](https://github.com/gogins/cloud-music/blob/main/README.md)
and at the build system files such as `package.json`.



