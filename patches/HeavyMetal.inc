gk_HeavyMetal_level chnexport "gk_HeavyMetal_level", 3
gk_HeavyMetal_level init 0
gk_HeavyMetal_midi_dynamic_range chnexport "gk_HeavyMetal_midi_dynamic_range", 3 ; 127
gk_HeavyMetal_midi_dynamic_range init 30
gk_HeavyMetal_space_left_to_right chnexport "gk_HeavyMetal_space_left_to_right", 3
gk_HeavyMetal_space_left_to_right init .5

gi_HeavyMetal_sine ftgen 0, 0, 65537, 10, 1
gi_HeavyMetal_cosine ftgen 0, 0, 65537, 11, 1
gi_HeavyMetal_exponentialrise ftgen 0, 0, 65536, 5, .001, 65536, 1 , 0; Exponential rise.
gi_HeavyMetal_thirteen ftgen 0, 0, 65537, 9, 1, .3, 0

instr HeavyMetal
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Author: Perry Cook and John ffitch
; Adapted by: Michael Gogins
i_instrument = p1
i_time = p2
i_duration = p3
i_midi_key = p4
i_midi_dynamic_range = i(gk_HeavyMetal_midi_dynamic_range)
i_midi_velocity = p5 * i_midi_dynamic_range / 127 + (63.5 - i_midi_dynamic_range / 2)
k_space_front_to_back = p6
if p7 ==0 then
k_space_left_to_right = gk_HeavyMetal_space_left_to_right
else
k_space_left_to_right = p7
endif
k_space_bottom_to_top = p8
i_phase = p9
i_overall_amps = (135 - 67) + 6
i_normalization = ampdb(-i_overall_amps) / 2
i_amplitude = ampdb(i_midi_velocity) * i_normalization
i_frequency = cpsmidinn(i_midi_key)
k_gain = ampdb(gk_HeavyMetal_level)
iindex = 1.1
icrossfade = 2
ivibedepth = 0.02
iviberate = 4.8
ifn1 = gi_HeavyMetal_sine
ifn2 = gi_HeavyMetal_exponentialrise
ifn3 = gi_HeavyMetal_thirteen
ifn4 = gi_HeavyMetal_sine
ivibefn = gi_HeavyMetal_cosine
iattack = 0.003
idecay = 3.0
isustain = p3
irelease = 0.05
xtratim iattack + idecay + irelease
adecay transeg 0.0, iattack, -4, 1.0, idecay, -4, 0.1, isustain, -4, 0.1, irelease, -4, 0.0
asignal fmmetal 1.0, i_frequency, iindex, icrossfade, ivibedepth, iviberate, ifn1, ifn2, ifn3, ifn4, ivibefn
adeclick linsegr 0, iattack, 1, isustain, 1, irelease, 0
a_signal = asignal * adeclick * i_amplitude * k_gain
i_attack = .002
i_sustain = p3
i_release = 0.01
xtratim i_attack + i_sustain + i_release
a_declicking linsegr 0, i_attack, 1, i_sustain, 1, i_release, 0
a_signal = a_signal * i_amplitude * a_declicking * k_gain

a_out_left, a_out_right pan2 a_signal, k_space_left_to_right
outleta "outleft", a_out_left
outleta "outright", a_out_right
prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
endin
