gk_Plucked_midi_dynamic_range chnexport "gk_Plucked_midi_dynamic_range", 3
gk_Plucked_midi_dynamic_range init 30
gk_Plucked_space_left_to_right chnexport "gk_Plucked_space_left_to_right", 3
gk_Plucked_space_left_to_right init .5
gk_Plucked_level chnexport "gk_Plucked_level", 3
gk_Plucked_level init 0

gi_Plucked_sine ftgen 0, 0, 65537, 10, 1

instr Plucked
; Author: Michael Gogins
i_instrument = p1
i_time = p2
; Make indefinite notes last no longer than the physical decay.
i_physical_decay = 20
if p3 == -1 then
i_duration = i_physical_decay
else
i_duration = p3
endif
i_midi_key = p4
i_midi_dynamic_range = i(gk_Plucked_midi_dynamic_range)
i_midi_velocity = p5 ;* i_midi_dynamic_range / 127 + (63.5 - i_midi_dynamic_range / 2)
i_midi_velocity ampmidid i_midi_velocity, i_midi_dynamic_range
k_space_front_to_back = p6
if p7 == 0 then
k_space_left_to_right = gk_Plucked_space_left_to_right
else
k_space_left_to_right = p7
endif
k_space_bottom_to_top = p8
i_phase = p9
i_detune_cents = 1.5
i_detune = i_detune_cents / 100
i_frequency1 = cpsmidinn(i_midi_key - i_detune)
i_frequency2 = cpsmidinn(i_midi_key)
i_frequency3 = cpsmidinn(i_midi_key + i_detune)
; Adjust the following value until "overall amps" at the end of performance is about -6 dB.
i_overall_amps = 26
i_normalization = ampdb(-(i_overall_amps)) / 2
i_amplitude = ampdb(i_midi_velocity) * i_normalization
k_gain = ampdb(gk_Plucked_level)
asignal1 wgpluck2 0.1, 1.0, i_frequency1, 0.25, 0.222
asignal2 wgpluck2 0.1, 1.0, i_frequency2, 0.20, 0.223
asignal3 wgpluck2 0.1, 1.0, i_frequency3, 0.23, 0.225
a_signal = (asignal1 + asignal2 + asignal3)
; As with most instruments that are based upon an impulse delivered to a 
; resonator, there are two envelopes, one for the physical decay with a 
; fixed release ending at zero, and one with a release segment to remove 
; clicks from the attack and release.
;
; As with most software instruments that are modeled on an impulse exciting a 
; resonator, there should be two envelopes. The "physical" envelope must have a 
; fixed decay ending at zero.
i_declick_minimum = .001
i_attack = .001 / i_frequency2 + i_declick_minimum
i_exponent = 7
a_physical_envelope transeg 0,   i_attack, i_exponent,  1,   i_physical_decay, -i_exponent,  0
; The de-clicking envelope must have attack and release segments that damp 
; artifacts in the signal. The duration of these segments depends on 
; the behavior of the instrument, and may vary as a function of frequency.
i_declick_attack = i_attack
i_declick_release = i_declick_minimum * 2
; The end of the note must be extended _past_ the end of the release segment.
xtratim 1
a_declicking_envelope cossegr 0, i_declick_attack, 1,  i_duration, 1,  i_declick_release, 0
; The envelope of the instrument is the product of the physical envelope times 
; the declicking envelope. 
a_envelope = a_physical_envelope * a_declicking_envelope
; That envelope is then low-pass filtered to remove most discontinuities.
a_filtered_envelope tonex a_envelope, 40, 4
a_signal = a_signal * i_amplitude * a_filtered_envelope * k_gain *.001

a_out_left, a_out_right pan2 a_signal, k_space_left_to_right
outleta "outleft", a_out_left
outleta "outright", a_out_right
prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
endin