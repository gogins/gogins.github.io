# New cloud-music pieces

I hve posted some new examples of my "cloud music" pieces at [gogins.github.io](https://gogins.github.io/). These pieces play live computer music indefinitely in any standard Web browser, with accompanying visuals.

In particular, have a look at [Cloud Music No. 9](https://gogins.github.io/cloud_music_no_9.html) and [Cancycle](https://gogins.github.io/cancycle.html), which integrate Csound for synthesis, Strudel for live coding, and CsoundAC for doing algorithmic compositions with harmony.

Feel free to fool around with these pieces as they play!

Comments are welcome here, and bug reports are welcome in the [cloud-5](https://github.com/gogins/cloud-5/issues) repository.

Initiates of Strudel may note that these pieces use my patched version of Strudel. My patches include:

- A version of the Strudel REPL that has an API for controlling Strudel from a host Web page.

- The piano roll is patched to receive Haps from the `csoundn` output.

- The `StatefulPatterns` class in the `csoundac.mjs` module enables the user to define Patterns associated with the state of a JavaScript class, merely by implementing new methods, with the names of the new Patterns, of the class. [Cancycle](https://gogins.github.io/cancycle.html) is a fairly complete example of this.

Regards,
[Michael Gogins](https://michaelgogins.tumblr.com)
