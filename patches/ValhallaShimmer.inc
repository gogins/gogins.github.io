// This must be initialized in the orc header before any #includes.

gi_vst3_handle_valhallashimmer vst3init "/Library/Audio/Plug-Ins/VST3/ValhallaShimmer.vst3", "ValhallaShimmer", 1
vst3info gi_vst3_handle_valhallashimmer

gk_ValhallaShimmer_level chnexport "gk_ValhallaShimmer_level", 3 ;  0
gi_ValhallaShimmer_print chnexport "gi_ValhallaShimmer_print", 3 ;  1
gk_ValhallaShimmer_front_to_back chnexport "gk_ValhallaShimmer_front_to_back", 3 ;  0
gk_ValhallaShimmer_left_to_right chnexport "gk_ValhallaShimmer_left_to_right", 3 ;  0.5
gk_ValhallaShimmer_bottom_to_top chnexport "gk_ValhallaShimmer_bottom_to_top", 3 ;  0

gk_ValhallaShimmer_level init 0
gi_ValhallaShimmer_print init 1
gk_ValhallaShimmer_front_to_back init 0
gk_ValhallaShimmer_left_to_right init 0.5
gk_ValhallaShimmer_bottom_to_top init 0

instr ValhallaShimmer
prints "starting Valhalla Shimmer"
vstprogset gi_vst3_handle_valhallashimmer, 1
; Sustain off.
vstparamset gi_vst3_handle_valhallashimmer, 6, 0
; Reverb switch off.
vstparamset gi_vst3_handle_valhallashimmer, 93, 0
k_gain = ampdb(gk_ValhallaShimmer_level)
i_overall_amps = 87
i_normalization = ampdb(-i_overall_amps) * 2
i_amplitude = ampdb(80) * i_normalization
i_instrument = p1
i_time = p2
i_duration = p3
i_midi_key = p4
i_midi_velocity = p5
ainleft init 0
ainright init 0
aoutleft, aoutright vstaudio gi_vst3_handle_valhallashimmer, ainleft, ainright
a_signal = aoutleft + aoutright
a_signal *= k_gain
a_signal *= i_amplitude
a_out_left, a_out_right pan2 a_signal, gk_ValhallaShimmer_left_to_right
k_1 rms aoutleft
k_2 rms aoutright

kx = gk_ValhallaShimmer_front_to_back
ky = gk_ValhallaShimmer_left_to_right
kz = gk_ValhallaShimmer_bottom_to_top


a_out_left, a_out_right pan2 a_signal, ky
outleta "outleft", a_out_left
outleta "outright", a_out_right
prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
endin
