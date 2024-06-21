gk_Guitar_midi_dynamic_range chnexport "gk_Guitar_midi_dynamic_range", 3 ; 127
gk_Guitar_midi_dynamic_range init 127
gk_Guitar_level chnexport "gk_Guitar_level", 3
gk_Guitar_level init 0

instr GuitarNoXtratim
; Michael Gogins
; Considerably cleaned up upon closer listening and testing.
; But I think this plain `pluck` opcode is inherently a bit noisy. The 
; waveform is just jagged at first.
i_instrument = p1
i_time = p2
if p3 == -1 then
i_duration = 20
else
i_duration = p3
endif
i_midi_key = p4
i_midi_dynamic_range = i(gk_Guitar_midi_dynamic_range)
i_midi_velocity = p5 * i_midi_dynamic_range / 127 + (63.5 - i_midi_dynamic_range / 2)
k_space_front_to_back = p6
k_space_left_to_right = p7
k_space_bottom_to_top = p8
i_phase = p9
i_frequency = cpsmidinn(i_midi_key)
; Adjust the following value until "overall amps" at the end of performance is about -6 dB.
i_level_correction = 66
i_normalization = ampdb(-i_level_correction) / 2
i_amplitude = ampdb(i_midi_velocity) * i_normalization
k_gain = ampdb(gk_Guitar_level)
i_frequency2 = i_frequency
a_signal pluck 1.0, i_frequency, i_frequency2, 0, 6
;a_signal dcblock a_signal
a_f1 reson a_signal, 110, 80
a_f2 reson a_signal, 220, 100
a_f3 reson a_signal, 440, 80
a_signal = (.6 * a_f1 + .8 * a_f2 + .6 * a_f3 + .4 * a_signal) * .001
a_signal dcblock2 a_signal
; For testing the envelopes without a complex signal that may have confounding 
; artifacts.
;a_signal oscils .2, i_frequency2, 0

; As with most instruments that are based upon an impulse exciting a 
; resonator, there are two envelopes. The physical envelope must have a 
; fixed decay ending at zero, _and then staying at zero_.
i_attack = 3 / i_frequency
i_decay = 20
a_physical_envelope transeg 0,   i_attack, 6,  1,   i_decay, -6,  0, i_decay, 0, 0
; The de-clicking envelope must have smooth attack and release segments 
; to damp artifacts in the signal. The duration of these segments depends on 
; the behavior of the instrument, and may vary as a function of frequency.
i_declick_minimum = .006
i_declick_exponent = -3
i_declick_attack = i_declick_minimum + i_frequency2^i_declick_exponent
i_declick_release = .02 + i_declick_attack
; Extra time must be greater than duration plus attack plus release.
; Also, all envelopes must sit on 0 after release.
;xtratim 1
a_declicking_envelope cossegr 0, i_declick_attack, 1,  20, 1,  i_declick_release, 0
a_envelope = a_physical_envelope * a_declicking_envelope
a_filtered_envelope tonex a_envelope, 50, 4
a_signal = a_signal * i_amplitude * a_filtered_envelope * k_gain *.01

a_out_left, a_out_right pan2 a_signal, k_space_left_to_right
outleta "outleft", a_out_left
outleta "outright", a_out_right
prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
endin
