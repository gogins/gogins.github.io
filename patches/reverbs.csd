<CsoundSynthesizer>
<CsLicense>
This piece is to test various reverb implentations, especially with respect to stereo spatialization.
</CsLicense>
<CsOptions>
--m-amps=1 --m-range=1 --m-dB=1 --m-benchmarks=1 --m-warnings=0 -+msg_color=0 -d -odac
</CsOptions>
<CsInstruments>

sr = 48000
ksmps = 128
nchnls = 2
0dbfs = 4

// Score generating instrument.

gi_iterations init 100
gi_duration init 4
gi_time_step init 2
gi_loudness init 70
instr Score_Generator
i_time = p2
i_instrument = 2
i_c = p5
i_y = p6
i_bass = p7
i_range = p8
i_pan = .5

i_iteration = 0
while i_iteration < gi_iterations do
    i_iteration = i_iteration + 1
    i_time = p2 + (i_iteration * gi_time_step)
    // Normalized logistic equation:
    i_y1 = i_c * i_y * (1 - i_y) * 4
    i_y = i_y1
    i_pitch = floor(i_bass + (i_y * i_range)) 
    i_instrument = 2 + (i_iteration % 4) - .125
    ;;;i_pan random .125, .875
    i_pan = ((i_instrument - 1) / 4)
    event_i "i", i_instrument, i_time, gi_duration, i_pitch, gi_loudness, 0, i_pan
    prints "   %f => i %f %f %f %f %f %f %f\n", i_y, i_instrument, i_time, gi_duration, i_pitch, gi_loudness, 0, i_pan
od
prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
endin

gi_ampmidicurve_dynamic_range init .375
gi_ampmidicurve_exponent init 5

prealloc "ZakianFlute", 4
prealloc "Guitar", 4
prealloc "Harpsichord", 4
prealloc "YiString", 4
prealloc "Bower", 4

connect "Guitar", "outleft", "ReverbSC", "inleft"
connect "Guitar", "outleft", "ReverbSC", "inleft"
connect "ZakianFlute", "outleft", "ReverbSC", "inleft"
connect "ZakianFlute", "outleft", "ReverbSC", "inleft"
connect "Harpsichord", "outleft", "ReverbSC", "inleft"
connect "Harpsichord", "outright", "ReverbSC", "inright"
connect "YiString", "outleft", "ReverbSC", "inleft"
connect "YiString", "outright", "ReverbSC", "inright"
connect "Bower", "outleft", "ReverbSC", "inleft"
connect "Bower", "outright", "ReverbSC", "inright"
connect "ReverbSC", "outleft", "MasterOutput", "inleft"
connect "ReverbSC", "outright", "MasterOutput", "inright"

alwayson "ReverbSC"
alwayson "MasterOutput"

gk_overlap init .0125

;gk_ZakianFlute_level init -2
gk_ZakianFlute_level chnexport "gk_ZakianFlute_level",3
gk_ZakianFlute_pan init (2 / 7 - .5)
gi_ZakianFLute_seed init .5
gif2 ftgen 0, 0, 16, -2, 40, 40, 80, 160, 320, 640, 1280, 2560, 5120, 10240, 10240
gif26 ftgen 0, 0, 65536, -10, 2000, 489, 74, 219, 125, 9, 33, 5, 5
gif27 ftgen 0, 0, 65536, -10, 2729, 1926, 346, 662, 537, 110, 61, 29, 7
gif28 ftgen 0, 0, 65536, -10, 2558, 2012, 390, 361, 534, 139, 53, 22, 10, 13, 10
gif29 ftgen 0, 0, 65536, -10, 12318, 8844, 1841, 1636, 256, 150, 60, 46, 11
gif30 ftgen 0, 0, 65536, -10, 1229, 16, 34, 57, 32
gif31 ftgen 0, 0, 65536, -10, 163, 31, 1, 50, 31
gif32 ftgen 0, 0, 65536, -10, 4128, 883, 354, 79, 59, 23
gif33 ftgen 0, 0, 65536, -10, 1924, 930, 251, 50, 25, 14
gif34 ftgen 0, 0, 65536, -10, 94, 6, 22, 8
gif35 ftgen 0, 0, 65536, -10, 2661, 87, 33, 18
gif36 ftgen 0, 0, 65536, -10, 174, 12
gif37 ftgen 0, 0, 65536, -10, 314, 13
giwtsin ftgen 0, 0, 65536, 10, 1
instr ZakianFlute
; Author: Lee Zakian
; Adapted by: Michael Gogins
if p3 == -1 goto indefinite
goto non_indefinite
indefinite:
  p3 = 1000000
non_indefinite:
i_instrument = p1
i_time = p2
i_duration = p3
i_midi_key = p4
i_midi_velocity = p5
k_space_front_to_back = p6
k_space_left_to_right = p7
k_space_bottom_to_top = p8
i_phase = p9
i_overall_amps = 65
i_amplitude ampmidicurve i_midi_velocity, gi_ampmidicurve_dynamic_range, gi_ampmidicurve_exponent
k_gain = ampdb(gk_ZakianFlute_level)
iattack = .002
isustain = p3
irelease = .3
xtratim iattack + isustain + irelease
iHz = cpsmidinn(i_midi_key)
kHz = k(iHz)
aenvelope transeg 1.0, 20.0, -10.0, 0.05
ip3 = (p3 < 3.0 ? p3 : 3.0)
; parameters
; p4 overall amplitude scaling factor
ip4 init i_amplitude
; p5 pitch in Hertz (normal pitch range: C4-C7)
ip5 init iHz
; p6 percent vibrato depth, recommended values in range [-1., +1.]
ip6 init 0.5
; 0.0 -> no vibrato
; +1. -> 1% vibrato depth, where vibrato rate increases slightly
; -1. -> 1% vibrato depth, where vibrato rate decreases slightly
; p7 attack time in seconds
; recommended value: .12 for slurred notes, .06 for tongued notes
; (.03 for short notes)
ip7 init .08
; p8 decay time in seconds
; recommended value: .1 (.05 for short notes)
ip8 init .08
; p9 overall brightness / filter cutoff factor
; 1 -> least bright / minimum filter cutoff frequency (40 Hz)
; 9 -> brightest / maximum filter cutoff frequency (10,240Hz)
ip9 init 5
; initial variables
iampscale = ip4 ; overall amplitude scaling factor
ifreq = ip5 ; pitch in Hertz
ivibdepth = abs(ip6*ifreq/100.0) ; vibrato depth relative to fundamental frequency
iattack = ip7 * (1.1 - .2*gi_ZakianFLute_seed) ; attack time with up to +-10% random deviation
gi_ZakianFLute_seed = frac(gi_ZakianFLute_seed*105.947) ; reset gi_ZakianFLute_seed
idecay = ip8 * (1.1 - .2*gi_ZakianFLute_seed) ; decay time with up to +-10% random deviation
gi_ZakianFLute_seed = frac(gi_ZakianFLute_seed*105.947)
ifiltcut tablei ip9, gif2 ; lowpass filter cutoff frequency
iattack = (iattack < 6/kr ? 6/kr : iattack) ; minimal attack length
idecay = (idecay < 6/kr ? 6/kr : idecay) ; minimal decay length
isustain = p3 - iattack - idecay
p3 = (isustain < 5/kr ? iattack+idecay+5/kr : p3) ; minimal sustain length
isustain = (isustain < 5/kr ? 5/kr : isustain)
iatt = iattack/6
isus = isustain/4
idec = idecay/6
iphase = gi_ZakianFLute_seed ; use same phase for all wavetables
gi_ZakianFLute_seed = frac(gi_ZakianFLute_seed*105.947)
; vibrato block
; kvibdepth linseg .1, .8*p3, 1, .2*p3, .7
kvibdepth linseg .1, .8*ip3, 1, isustain, 1, .2*ip3, .7
kvibdepth = kvibdepth* ivibdepth ; vibrato depth
kvibdepthr randi .1*kvibdepth, 5, gi_ZakianFLute_seed ; up to 10% vibrato depth variation
gi_ZakianFLute_seed = frac(gi_ZakianFLute_seed*105.947)
kvibdepth = kvibdepth + kvibdepthr
ivibr1 = gi_ZakianFLute_seed ; vibrato rate
gi_ZakianFLute_seed = frac(gi_ZakianFLute_seed*105.947)
ivibr2 = gi_ZakianFLute_seed
gi_ZakianFLute_seed = frac(gi_ZakianFLute_seed*105.947)
if ip6 < 0 goto vibrato1
kvibrate linseg 2.5+ivibr1, p3, 4.5+ivibr2 ; if p6 positive vibrato gets faster
 goto vibrato2
vibrato1:
ivibr3 = gi_ZakianFLute_seed
gi_ZakianFLute_seed = frac(gi_ZakianFLute_seed*105.947)
kvibrate linseg 3.5+ivibr1, .1, 4.5+ivibr2, p3-.1, 2.5+ivibr3 ; if p6 negative vibrato gets slower
vibrato2:
kvibrater randi .1*kvibrate, 5, gi_ZakianFLute_seed ; up to 10% vibrato rate variation
gi_ZakianFLute_seed = frac(gi_ZakianFLute_seed*105.947)
kvibrate = kvibrate + kvibrater
kvib oscili kvibdepth, kvibrate, giwtsin
ifdev1 = -.03 * gi_ZakianFLute_seed ; frequency deviation
gi_ZakianFLute_seed = frac(gi_ZakianFLute_seed*105.947)
ifdev2 = .003 * gi_ZakianFLute_seed
gi_ZakianFLute_seed = frac(gi_ZakianFLute_seed*105.947)
ifdev3 = -.0015 * gi_ZakianFLute_seed
gi_ZakianFLute_seed = frac(gi_ZakianFLute_seed*105.947)
ifdev4 = .012 * gi_ZakianFLute_seed
gi_ZakianFLute_seed = frac(gi_ZakianFLute_seed*105.947)
kfreqr linseg ifdev1, iattack, ifdev2, isustain, ifdev3, idecay, ifdev4
kfreq = kHz * (1 + kfreqr) + kvib
if ifreq < 427.28 goto range1 ; (cpspch(8.08) + cpspch(8.09))/2
if ifreq < 608.22 goto range2 ; (cpspch(9.02) + cpspch(9.03))/2
if ifreq < 1013.7 goto range3 ; (cpspch(9.11) + cpspch(10.00))/2
goto range4
; wavetable amplitude envelopes
range1: ; for low range tones
kamp1 linseg 0, iatt, 0.002, iatt, 0.045, iatt, 0.146, iatt, 0.272, iatt, 0.072, iatt, 0.043, isus, 0.230, isus, 0.000, isus, 0.118, isus, 0.923, idec, 1.191, idec, 0.794, idec, 0.418, idec, 0.172, idec, 0.053, idec, 0
kamp2 linseg 0, iatt, 0.009, iatt, 0.022, iatt, -0.049, iatt, -0.120, iatt, 0.297, iatt, 1.890, isus, 1.543, isus, 0.000, isus, 0.546, isus, 0.690, idec, -0.318, idec, -0.326, idec, -0.116, idec, -0.035, idec, -0.020, idec, 0
kamp3 linseg 0, iatt, 0.005, iatt, -0.026, iatt, 0.023, iatt, 0.133, iatt, 0.060, iatt, -1.245, isus, -0.760, isus, 1.000, isus, 0.360, isus, -0.526, idec, 0.165, idec, 0.184, idec, 0.060, idec, 0.010, idec, 0.013, idec, 0
iwt1 = gif26 ; wavetable numbers
iwt2 = gif27
iwt3 = gif28
inorm = 3949
goto end
range2: ; for low mid-range tones
kamp1 linseg 0, iatt, 0.000, iatt, -0.005, iatt, 0.000, iatt, 0.030, iatt, 0.198, iatt, 0.664, isus, 1.451, isus, 1.782, isus, 1.316, isus, 0.817, idec, 0.284, idec, 0.171, idec, 0.082, idec, 0.037, idec, 0.012, idec, 0
kamp2 linseg 0, iatt, 0.000, iatt, 0.320, iatt, 0.882, iatt, 1.863, iatt, 4.175, iatt, 4.355, isus, -5.329, isus, -8.303, isus, -1.480, isus, -0.472, idec, 1.819, idec, -0.135, idec, -0.082, idec, -0.170, idec, -0.065, idec, 0
kamp3 linseg 0, iatt, 1.000, iatt, 0.520, iatt, -0.303, iatt, 0.059, iatt, -4.103, iatt, -6.784, isus, 7.006, isus, 11, isus, 12.495, isus, -0.562, idec, -4.946, idec, -0.587, idec, 0.440, idec, 0.174, idec, -0.027, idec, 0
iwt1 = gif29
iwt2 = gif30
iwt3 = gif31
inorm = 27668.2
goto end
range3: ; for high mid-range tones
kamp1 linseg 0, iatt, 0.005, iatt, 0.000, iatt, -0.082, iatt, 0.36, iatt, 0.581, iatt, 0.416, isus, 1.073, isus, 0.000, isus, 0.356, isus, .86, idec, 0.532, idec, 0.162, idec, 0.076, idec, 0.064, idec, 0.031, idec, 0
kamp2 linseg 0, iatt, -0.005, iatt, 0.000, iatt, 0.205, iatt, -0.284, iatt, -0.208, iatt, 0.326, isus, -0.401, isus, 1.540, isus, 0.589, isus, -0.486, idec, -0.016, idec, 0.141, idec, 0.105, idec, -0.003, idec, -0.023, idec, 0
kamp3 linseg 0, iatt, 0.722, iatt, 1.500, iatt, 3.697, iatt, 0.080, iatt, -2.327, iatt, -0.684, isus, -2.638, isus, 0.000, isus, 1.347, isus, 0.485, idec, -0.419, idec, -.700, idec, -0.278, idec, 0.167, idec, -0.059, idec, 0
iwt1 = gif32
iwt2 = gif33
iwt3 = gif34
inorm = 3775
goto end
range4: ; for high range tones
kamp1 linseg 0, iatt, 0.000, iatt, 0.000, iatt, 0.211, iatt, 0.526, iatt, 0.989, iatt, 1.216, isus, 1.727, isus, 1.881, isus, 1.462, isus, 1.28, idec, 0.75, idec, 0.34, idec, 0.154, idec, 0.122, idec, 0.028, idec, 0
kamp2 linseg 0, iatt, 0.500, iatt, 0.000, iatt, 0.181, iatt, 0.859, iatt, -0.205, iatt, -0.430, isus, -0.725, isus, -0.544, isus, -0.436, isus, -0.109, idec, -0.03, idec, -0.022, idec, -0.046, idec, -0.071, idec, -0.019, idec, 0
kamp3 linseg 0, iatt, 0.000, iatt, 1.000, iatt, 0.426, iatt, 0.222, iatt, 0.175, iatt, -0.153, isus, 0.355, isus, 0.175, isus, 0.16, isus, -0.246, idec, -0.045, idec, -0.072, idec, 0.057, idec, -0.024, idec, 0.002, idec, 0
iwt1 = gif35
iwt2 = gif36
iwt3 = gif37
inorm = 4909.05
goto end
end:
kampr1 randi .02*kamp1, 10, gi_ZakianFLute_seed ; up to 2% wavetable amplitude variation
gi_ZakianFLute_seed = frac(gi_ZakianFLute_seed*105.947)
kamp1 = kamp1 + kampr1
kampr2 randi .02*kamp2, 10, gi_ZakianFLute_seed ; up to 2% wavetable amplitude variation
gi_ZakianFLute_seed = frac(gi_ZakianFLute_seed*105.947)
kamp2 = kamp2 + kampr2
kampr3 randi .02*kamp3, 10, gi_ZakianFLute_seed ; up to 2% wavetable amplitude variation
gi_ZakianFLute_seed = frac(gi_ZakianFLute_seed*105.947)
kamp3 = kamp3 + kampr3
awt1 poscil kamp1, kfreq, iwt1, iphase ; wavetable lookup
awt2 poscil kamp2, kfreq, iwt2, iphase
awt3 poscil kamp3, kfreq, iwt3, iphase
asig = awt1 + awt2 + awt3
asig = asig*(iampscale/inorm)
kcut linseg 0, iattack, ifiltcut, isustain, ifiltcut, idecay, 0 ; lowpass filter for brightness control
afilt tone asig, kcut
a_signal balance afilt, asig
i_attack = .002
i_sustain = p3
i_release = 0.01
xtratim i_attack + i_sustain + i_release
a_declicking linsegr 0, i_attack, 1, i_sustain, 1, i_release, 0
a_signal = a_signal * i_amplitude * a_declicking * k_gain
a_out_left, a_out_right pan2 a_signal, p7
outleta "outleft", a_out_left
outleta "outright", a_out_right
prints "ZakianFlute    i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", p1, p2, p3, p4, p5, p7, active(p1)
endin

gk_Guitar_level init 8
instr Guitar
; Michael Gogins
if p3 == -1 goto indefinite
goto non_indefinite
indefinite:
  p3 = 1000000
non_indefinite:
i_instrument = p1
i_time = p2
i_duration = p3
i_midi_key = p4
i_midi_velocity = p5
k_space_front_to_back = p6
k_space_left_to_right = p7
k_space_bottom_to_top = p8
i_phase = p9
i_frequency = cpsmidinn(i_midi_key)
i_amplitude ampmidicurve i_midi_velocity, gi_ampmidicurve_dynamic_range, gi_ampmidicurve_exponent
k_gain = ampdb(gk_Guitar_level)
acomp pluck i_amplitude, 440.0, 440.0, 0, 1, .1
i_frequency2 = i_frequency / 2.0
kHz = k(i_frequency)
iattack = 0.004
isustain = p3
irelease = 0.05
p3 = iattack + isustain + irelease
asigcomp pluck 1.0, 440, 440, 0, 1
asig pluck 1.0, i_frequency, i_frequency, 0, 1
af1 reson asig, 110, 80
af2 reson asig, 220, 100
af3 reson asig, 440, 80
aout balance 0.6 * af1 + af2 + 0.6 * af3 + 0.4 * asig, asigcomp
aexp expseg 1.0, iattack, 2.0, isustain, 1.0, irelease, 1.0
aenv = aexp - 1.0
a_signal = aout * aenv
a_declicking linsegr 0, iattack, 1, isustain, 1, irelease, 0
a_signal = a_signal * i_amplitude * a_declicking * k_gain

a_out_left, a_out_right pan2 a_signal, p7
outleta "outleft", a_out_left
outleta "outright", a_out_right
prints "Guitar         i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", p1, p2, p3, p4, p5, p7, active(p1)
endin

gk_YiString_level init 6
gk_YiString_reverb_send init .5
gk_YiString_chorus_send init .5
gi_YiString_overlap init .1
instr YiString
 //////////////////////////////////////////////
 // Original by Steven Yi.
 // Adapted by Michael Gogins.
 //////////////////////////////////////////////
if p3 == -1 goto indefinite
goto non_indefinite
indefinite:
  p3 = 1000000
non_indefinite:
i_instrument = p1
i_time = p2
i_duration = p3
i_midi_key = p4
i_midi_velocity = p5
k_space_front_to_back = p6
k_space_left_to_right = p7
k_space_bottom_to_top = p8
i_phase = p9
i_frequency = cpsmidinn(i_midi_key)
i_amplitude ampmidicurve i_midi_velocity, gi_ampmidicurve_dynamic_range, gi_ampmidicurve_exponent
k_gain = ampdb(gk_YiString_level)
iattack = gi_YiString_overlap
isustain = p3
idecay = gi_YiString_overlap
p3 = iattack + isustain + idecay
aenvelope transeg 0.0, iattack / 2.0, 1.5, i_amplitude / 2.0, iattack / 2.0, -1.5, i_amplitude, isustain, 0.0, i_amplitude, idecay / 2.0, 1.5, i_amplitude / 2.0, idecay / 2.0, -1.5, 0
;ampenv = madsr:a(1, 0.1, 0.95, 0.5)
asignal = vco2(1, i_frequency)
asignal = moogladder(asignal, 6000, 0.1)
a_signal = asignal * aenvelope
i_attack = .002
i_release = 0.01
i_sustain = p3 - (i_attack + i_release)
a_declicking linsegr 0, i_attack, 1, i_sustain, 1, i_release, 0
a_signal = a_signal * i_amplitude * a_declicking * k_gain

a_out_left, a_out_right pan2 a_signal, p7
outleta "outleft", a_out_left * gk_YiString_reverb_send
outleta "outright", a_out_right * gk_YiString_reverb_send
outleta "chorusleft", a_out_left * gk_YiString_chorus_send
outleta "chorusright", a_out_right * gk_YiString_chorus_send
;printks "YiString         %9.4f  %9.4f\n", 0.5, a_out_left, a_out_right
prints  "YiString       i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", p1, p2, p3, p4, p5, p7, active(p1)
endin

gk_Harpsichord_level init 0
gk_Harpsichord_pick init .275
gk_Harpsichord_reflection init .75
gk_Harpsichord_pluck init .5
giharptable ftgen 0, 0, 65536, 7, -1, 1024, 1, 1024, -1
instr Harpsichord
if p3 == -1 goto indefinite
goto non_indefinite
indefinite:
  p3 = 1000000
non_indefinite:
i_instrument = p1
i_time = p2
i_duration = p3
i_midi_key = p4
i_midi_velocity = p5
k_space_front_to_back = p6
k_space_left_to_right = p7
k_space_bottom_to_top = p8
i_phase = p9
i_amplitude ampmidicurve i_midi_velocity, gi_ampmidicurve_dynamic_range, gi_ampmidicurve_exponent
k_gain = ampdb(gk_Harpsichord_level)
iHz = cpsmidinn(i_midi_key)
kHz = k(iHz)
aenvelope transeg 1.0, 20.0, -10.0, 0.05
k_amplitude = 1
apluck pluck 1, kHz, iHz, 0, 1
aharp poscil 1, kHz, giharptable
aharp2 balance apluck, aharp
a_signal	= (apluck + aharp2)
i_attack = .002
i_sustain = p3
i_release = 0.01
p3 = i_attack + i_sustain + i_release
a_declicking linsegr 0, i_attack, 1, i_sustain, 1, i_release, 0
a_signal = a_signal * i_amplitude * a_declicking * k_gain

a_out_left, a_out_right pan2 a_signal, p7
outleta "outleft", a_out_left
outleta "outright", a_out_right
; printks "Harpsichord      %9.4f   %9.4f\n", 0.5, a_out_left, a_out_right
prints "Harpsichord    i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", p1, p2, p3, p4, p5, p1/6, active(p1)
kpbend    pchbend   2
printks2 "pchbend %9.4f\n", kpbend
kmodw     midictrl  1
printks2 "kmodw   %9.4f\n", kmodw
kctl6     midictrl  6
printks2 "kctl6   %9.4f\n", kctl6
kctl4     midictrl  4
printks2 "kctl4   %9.4f\n", kctl4
kctl5     midictrl  5
printks2 "kctl5   %9.4f\n", kctl5
kafter    aftouch   1
printks2 "kafter  %9.4f\n", kafter

endin

gk_Bower_level chnexport "gk_Bower_level", 3
gk_Bower_pan chnexport "gk_Bower_pan", 3
gi_Bower_minimum_hz chnexport "gi_Bower_minimum_hz", 3
gk_Bower_bow_pressure chnexport "gk_Bower_bow_pressure", 3
gk_Bower_bow_position chnexport "gk_Bower_bow_position", 3
gk_Bower_vibrato_hz chnexport "gk_Bower_vibrato_hz", 3
gk_Bower_vibrato_amplitude chnexport "gk_Bower_vibrato_amplitude", 3
gi_Bower_sine ftgen 0,0,65537,10,1
gk_Bower_level init -30
gk_Bower_bow_pressure init 4.1
gk_Bower_bow_position init .148
gi_Bower_minimum_hz init 30
instr Bower
i_instrument = p1
i_time = p2
i_duration = p3
i_midi_key = p4
i_midi_velocity = p5
i_phase = p6
i_pan = p7
i_amplitude = ampdb(i_midi_velocity) * 500
i_amplitude ampmidicurve i_midi_velocity, gi_ampmidicurve_dynamic_range, gi_ampmidicurve_exponent
i_amplitude *= 50000

i_attack =  p3 * (1 / 4) * (4 / 3)
i_sustain = p3 * (1 / 2) * (4 / 3)
i_release =   p3 * (1 / 4) * (4 / 3)
p3 = i_attack + i_sustain + i_release
k_envelope transeg 0.0, i_attack / 2.0, 1.5, i_amplitude / 2.0, i_attack / 2.0, -1.5, i_amplitude, i_sustain, 0.0, i_amplitude, i_release / 2.0, 1.5, i_amplitude / 2.0, i_release / 2.0, -1.5, 0
i_frequency = cpsmidinn(i_midi_key)
kamp = k_envelope
kfreq = i_frequency
kpres = gk_Bower_bow_pressure
; krat rspline 0.006,0.988,0.1,0.4
krat rspline 0.006,0.988,1,4
krat = gk_Bower_bow_position
kvibf = gk_Bower_vibrato_hz
kvibamp = gk_Bower_vibrato_amplitude
iminfreq = gi_Bower_minimum_hz
aSig wgbow kamp,kfreq,kpres,krat,kvibf,kvibamp,gi_Bower_sine,iminfreq
k_gain = ampdb(gk_Bower_level)
aSig = aSig * k_gain
;aSig butlp aSig,2000
;aSig pareq aSig,80,6,0.707
a_left, a_right pan2 aSig / 7, i_pan
a_damping linseg 0, 0.03, 1, p3 - 0.1, 1, 0.07, 0
a_left = a_damping * a_left
a_right = a_damping * a_right
outleta "outleft", a_left
outleta "outright", a_right
prints "%-24.24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
endin

gk_Reverb_feedback init 0.985
gi_Reverb_delay_modulation init 0.05
gk_Reverb_frequency_cutoff init 15000
instr ReverbSC
aleftout init 0
arightout init 0
aleft inleta "inleft"
aright inleta "inright"
; aoutL, aoutR reverbsc ainL, ainR, kfblvl, kfco[, israte[, ipitchm[, iskip]]]
aleftout, arightout reverbsc aleft, aright, gk_Reverb_feedback, gk_Reverb_frequency_cutoff, sr, gi_Reverb_delay_modulation
outleta "outleft", aleftout
outleta "outright", arightout
prints "ReverbSC       i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\
", p1, p2, p3, p4, p5, p1/6, active(p1)
endin

gS_MVerb_preset chnexport "gS_MVerb_preset", 3 ; "Huge Hall"
gk_MVerb_FB chnexport "gk_MVerb_feedback", 3 ; .975
gk_MVerb_wet chnexport "gk_MVerb_wet", 3 ; .5
gk_MVerb_random chnexport "gk_MVerb_random", 3 ; 1
gk_MVerb_rslow chnexport "gk_MVerb_rslow", 3 ; 1.1
gk_MVerb_rfast chnexport "gk_MVerb_rfast", 3 ; 3.8
gk_MVerb_rmax chnexport "gk_MVerb_rmax", 3 ; .0005
gk_MVerb_print chnexport "gk_MVerb_print", 3 ; 1
gk_MVerb_DFact chnexport "gk_MVerb_DFact", 3 ; .75

gS_MVerb_preset init "Huge Hall"
gk_MVerb_feedback init .975
gk_MVerb_wet init .5
gk_MVerb_random init 1
gk_MVerb_rslow init 1.1
gk_MVerb_rfast init 3.8
gk_MVerb_rmax init .0005
gk_MVerb_print init 1
gk_MVerb_DFact init .75

instr MVerb
//////////////////////////////////////////////
// Original csd by Jon Christopher Nelson.
// Adapted to C++ plugin by Michael Gogins.
// Compute-intensive!
//////////////////////////////////////////////
ainleft  inleta  "inleft"
ainright  inleta  "inright"
aoutleft, aoutright MVerb ainleft, ainright, gS_MVerb_preset, "wet", gk_MVerb_wet, "FB", gk_MVerb_feedback, "random", 1, "rslow", gk_MVerb_rslow, "rfast", gk_MVerb_rfast, "rmax", gk_MVerb_rmax, "print", gk_MVerb_print, "DFact", gk_MVerb_DFact
outleta  "outleft", aoutleft
outleta  "outright", aoutright
prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
endin


gk_MasterOutput_level init -15
gS_MasterOutput_filename init ""
instr MasterOutput
aleft inleta "inleft"
aright inleta "inright"
k_gain = ampdb(gk_MasterOutput_level)
printks2 "Master gain: %f\n", k_gain
iamp init 1
iattack init .01
idecay init 10
isustain = 2400 - (iattack + idecay)
aenvelope transeg 0.0, iattack / 2.0, 1.5, iamp / 2.0, iattack / 2.0, -1.5, iamp, isustain, 0.0, iamp, idecay / 2.0, 1.5, iamp / 2.0, idecay / 2.0, -1.5, 0
aleft butterlp aleft, 18000
aright butterlp aright, 18000
outs aleft * k_gain * aenvelope, aright * k_gain * aenvelope
; We want something that will play on my phone.
i_amplitude_adjustment = ampdbfs(-3) / 32767
i_filename_length strlen gS_MasterOutput_filename
if i_filename_length > 0 goto has_filename
goto non_has_filename
has_filename:
prints sprintf("Output filename: %s\n", gS_MasterOutput_filename)
fout gS_MasterOutput_filename, 18, aleft * i_amplitude_adjustment, aright * i_amplitude_adjustment
non_has_filename:
prints "MasterOutput   i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", p1, p2, p3, p4, p5, p1/6, active(p1)
kstatus, kchan, kdata1, kdata2 midiin
;printf "          midi in s %4d c %4d %4d %4d\n", kdata2, kstatus, kchan, kdata1, kdata2
endin

</CsInstruments>
<CsScore>
f 0 30
i "Score_Generator" 1  1 3 .989 .5 [36 +  0] 60
i "Score_Generator" 2  1 4 .989 .5 [36 +  9] 60
i "Score_Generator" 3  1 4 .989 .5 [36 + 16] 60
</CsScore>
</CsoundSynthesizer>
