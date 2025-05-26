        <CsoundSynthesizer>
          <CsOptions>
          -d -m160 -odac -+msg_color=0
          </CsOptions>
          <CsInstruments>
          sr = 48000
          ksmps = 128
          nchnls = 2
          0dbfs = 3

          ; -m (128 + 32)
          
          ; Ensure the same random stream for each rendering.
          ; rand, randh, randi, rnd(x) and birnd(x) are not affected by seed.
          
          ;seed  81814
          ;seed  818145
          seed  88818145
          
          connect "Blower", "outleft", "ReverbSC", "inleft"
          connect "Blower", "outright", "ReverbSC", "inright"
          connect "Buzzer", "outleft", "ReverbSC", "inleft"
          connect "Buzzer", "outright", "ReverbSC", "inright"
          connect "Droner", "outleft", "ReverbSC", "inleft"
          connect "Droner", "outright", "ReverbSC", "inright"
          connect "FMWaterBell", "outleft", "ReverbSC", "inleft"
          connect "FMWaterBell", "outright", "ReverbSC", "inright"
          ; Phaser is the one that actually "buzzes" in this piece.
          connect "Phaser", "outleft", "ReverbSC", "inleft"
          connect "Phaser", "outright", "ReverbSC", "inright"
          connect "Sweeper", "outleft", "ReverbSC", "inleft"
          connect "Sweeper", "outright", "ReverbSC", "inright"
          connect "Shiner", "outleft", "ReverbSC", "inleft"
          connect "Shiner", "outright", "ReverbSC", "inright"
          connect "ZakianFlute", "outleft", "ReverbSC", "inleft"
          connect "ZakianFlute", "outright", "ReverbSC", "inright"
          connect "FilteredSines", "outleft", "ReverbSC", "inleft"
          connect "FilteredSines", "outright", "ReverbSC", "inright"
          connect "FMModerate", "outleft", "ReverbSC", "inleft"
          connect "FMModerate", "outright", "ReverbSC", "inright"
          connect "Guitar", "outleft", "ReverbSC", "inleft"
          connect "Guitar", "outleft", "ReverbSC", "inleft"
          connect "Harpsichord", "outleft", "ReverbSC", "inleft"
          connect "Harpsichord", "outright", "ReverbSC", "inright"
          connect "Kung2", "outleft", "ReverbSC", "inleft"
          connect "Kung2", "outright", "ReverbSC", "inright"
          connect "Kung4", "outleft", "ReverbSC", "inleft"
          connect "Kung4", "outright", "ReverbSC", "inright"
          connect "Plucked", "outleft", "ReverbSC", "inleft"
          connect "Plucked", "outright", "ReverbSC", "inright"
          connect "SeidelHarmOsc", "outleft", "ReverbSC", "inleft"
          connect "SeidelHarmOsc", "outright", "ReverbSC", "inright"
          connect "TubularBell", "outleft", "ReverbSC", "inleft"
          connect "TubularBell", "outright", "ReverbSC", "inright"
          connect "YiString", "outleft", "ReverbSC", "inleft"
          connect "YiString", "outright", "ReverbSC", "inright"
          connect "VcvOut", "outleft", "ReverbSC", "inleft"
          connect "VcvOut", "outright", "ReverbSC", "inright"
          connect "Xing", "outleft", "ReverbSC", "inleft"
          connect "Xing", "outright", "ReverbSC", "inright"
        
          connect "ReverbSC", "outleft", "MasterOutput", "inleft"
          connect "ReverbSC", "outright", "MasterOutput", "inright"
          
          alwayson "ReverbSC"
          alwayson "MasterOutput"
          
gk_Duration_factor init 1.887587340731607 ; Updated from: gk_Duration_factor init 4.5
          
          prealloc 1, 50
          prealloc 2, 50
          prealloc 3, 50
          prealloc 4, 50
          prealloc 5, 50
          prealloc 6, 50
          prealloc 7, 50
          prealloc 8, 20
          prealloc 9, 20
        
          //////////////////////////////////////////////
          // Original by Steven Yi.
          // Adapted by Michael Gogins.
          //////////////////////////////////////////////
          gk_FMWaterBell_level chnexport "gk_FMWaterBell_level", 3 ; 0
          gi_FMWaterBell_attack chnexport "gi_FMWaterBell_attack", 3 ; 0.002
          gi_FMWaterBell_release chnexport "gi_FMWaterBell_release", 3 ; 0.01
          gi_FMWaterBell_sustain chnexport "gi_FMWaterBell_sustain", 3 ; 20
          gi_FMWaterBell_sustain_level chnexport "gi_FMWaterBell_sustain_level", 3 ; .1
          gk_FMWaterBell_index chnexport "gk_FMWaterBell_index", 3 ; .5
          gk_FMWaterBell_crossfade chnexport "gk_FMWaterBell_crossfade", 3 ; .5
          gk_FMWaterBell_vibrato_depth chnexport "gk_FMWaterBell_vibrato_depth", 3 ; 0.05
          gk_FMWaterBell_vibrato_rate chnexport "gk_FMWaterBell_vibrato_rate", 3 ; 6
          gk_FMWaterBell_midi_dynamic_range chnexport "gk_FMWaterBell_midi_dynamic_range", 3 ; 20
gk_FMWaterBell_level init 0.9094645976775197 ; Updated from: gk_FMWaterBell_level init 0
gi_FMWaterBell_attack init 0.002 ; Updated from: gi_FMWaterBell_attack init 0.002
gi_FMWaterBell_release init 0.01 ; Updated from: gi_FMWaterBell_release init 0.01
gi_FMWaterBell_sustain init 20 ; Updated from: gi_FMWaterBell_sustain init 20
gi_FMWaterBell_sustain_level init 0.1 ; Updated from: gi_FMWaterBell_sustain_level init .1
gk_FMWaterBell_index init 0.5 ; Updated from: gk_FMWaterBell_index init .5
gk_FMWaterBell_crossfade init 0.5 ; Updated from: gk_FMWaterBell_crossfade init .5
gk_FMWaterBell_vibrato_depth init 0.05 ; Updated from: gk_FMWaterBell_vibrato_depth init 0.05
gk_FMWaterBell_vibrato_rate init 6 ; Updated from: gk_FMWaterBell_vibrato_rate init 6
          gk_FMWaterBell_midi_dynamic_range init 20
          gk_FMWaterBell_space_left_to_right chnexport "gk_FMWaterBell_space_left_to_right", 3
          gk_FMWaterBell_space_left_to_right init .5
          gi_FMWaterBell_cosine ftgen 0, 0, 65537, 11, 1
          instr FMWaterBell
          i_instrument = p1
          i_time = p2
          i_duration = p3
          ; One of the envelopes in this instrument should be releasing, and use this:
          i_sustain = 1000
          xtratim gi_FMWaterBell_attack + gi_FMWaterBell_release
          i_midi_key = p4
          i_midi_dynamic_range = i(gk_FMWaterBell_midi_dynamic_range)
          i_midi_velocity = p5 * i_midi_dynamic_range / 127 + (63.6 - i_midi_dynamic_range / 2)
          k_space_front_to_back = p6
          if p7 == 0 then
          k_space_left_to_right = gk_FMWaterBell_space_left_to_right
          else
          k_space_left_to_right = p7
          endif
          k_space_bottom_to_top = p8
          i_phase = p9
          i_frequency = cpsmidinn(i_midi_key)
          ; Adjust the following value until "overall amps" at the end of performance is about -6 dB.
          i_level_correction = 80
          i_normalization = ampdb(-i_level_correction) / 2
          i_amplitude = ampdb(i_midi_velocity) * i_normalization * 1.6
          k_gain = ampdb(gk_FMWaterBell_level)
          i_releasing_attack = 3 / min(i_frequency, 256)
          i_releasing_release = .01
          a_signal fmbell	1, i_frequency, gk_FMWaterBell_index, gk_FMWaterBell_crossfade, gk_FMWaterBell_vibrato_depth, gk_FMWaterBell_vibrato_rate, gi_FMWaterBell_cosine, gi_FMWaterBell_cosine, gi_FMWaterBell_cosine, gi_FMWaterBell_cosine, gi_FMWaterBell_cosine ;, gi_FMWaterBell_sustain
          a_envelope transeg 0, gi_FMWaterBell_attack, -6,  1, gi_FMWaterBell_sustain, -6,  0
          a_declicking cossegr 0, i_releasing_attack, 1, gi_FMWaterBell_sustain - 1, 1, i_releasing_release, 0
          ;;;a_signal = a_signal * i_amplitude * a_envelope * a_declicking * k_gain
          a_signal = a_signal * i_amplitude * a_envelope * a_declicking * k_gain
          a_out_left, a_out_right pan2 a_signal, k_space_left_to_right
          outleta "outleft", a_out_left
          outleta "outright", a_out_right
          prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
          ;printks "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d l%9.4f r%9.4f\n", 1, nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1), dbamp(rms(a_out_left)), dbamp(rms(a_out_right))
          endin
          
          gk_Phaser_attack chnexport "gk_Phaser_attack", 3 ;  .125
          gk_Phaser_release chnexport "gk_Phaser_release", 3 ;  .125
          gk_Phaser_ratio1 chnexport "gk_Phaser_ratio1", 3 ;  1
          gk_Phaser_ratio2 chnexport "gk_Phaser_ratio2", 3 ;  1/5
          gk_Phaser_index1 chnexport "gk_Phaser_index1", 3 ;  1.01
          gk_Phaser_index2 chnexport "gk_Phaser_index2", 3 ;  .103
          gk_Phaser_level chnexport "gk_Phaser_level", 3 ;  0.5
          gk_Phaser_midi_dynamic_range chnexport "gk_Phaser_midi_dynamic_range", 3 ;  20
          gk_Phaser_attack init .125
          gk_Phaser_release init .125
gk_Phaser_ratio1 init 2 ; Updated from: gk_Phaser_ratio1 init 1
gk_Phaser_ratio2 init 3 ; Updated from: gk_Phaser_ratio2 init 1/5
gk_Phaser_index1 init 1.0266159695817492 ; Updated from: gk_Phaser_index1 init 1.01
gk_Phaser_index2 init 0.533347035248176 ; Updated from: gk_Phaser_index2 init .103
gk_Phaser_level init -21.452060425444458 ; Updated from: gk_Phaser_level init 0.5
          gk_Phaser_midi_dynamic_range init 20
          gi_Phaser_sine ftgen 0,0,65537,10,1
          instr Phaser
          i_instrument = p1
          i_time = p2
          i_duration = p3
          i_midi_key = p4
          i_midi_dynamic_range = i(gk_Phaser_midi_dynamic_range)
          i_midi_velocity = p5 * i_midi_dynamic_range / 127 + (63.5 - i_midi_dynamic_range / 2)
          k_space_front_to_back = p6
          k_space_left_to_right = p7
          k_space_bottom_to_top = p8
          i_phase = p9
          i_frequency = cpsmidinn(i_midi_key)
          ; Adjust the following value until "overall amps" at the end of performance is about -6 dB.
          i_level_correction = 81
          i_normalization = ampdb(-i_level_correction) / 2
          i_amplitude = ampdb(i_midi_velocity) * i_normalization
          k_gain = ampdb(gk_Phaser_level)
          i_attack = i(gk_Phaser_attack)
          i_release = i(gk_Phaser_release)
          i_sustain = 1000
          xtratim i_attack + i_release
          a_envelope transegr 0.0, i_attack / 2.0, 1.5, i_amplitude / 2.0, i_attack / 2.0, -1.5, i_amplitude, i_sustain, 0.0, i_amplitude, i_release / 2.0, 1.5, i_amplitude / 2.0, i_release / 2.0, -1.5, 0
          a1,a2 crosspm gk_Phaser_ratio1, gk_Phaser_ratio2, gk_Phaser_index1, gk_Phaser_index2, i_frequency, gi_Phaser_sine, gi_Phaser_sine
          a_signal = (a1 + a2) * k_gain * a_envelope
          prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
          a_out_left, a_out_right pan2 a_signal, k_space_left_to_right
          outleta "outleft", a_out_left
          outleta "outright", a_out_right
          ;printks "Phaser         i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d l%9.4f r%9.4f\n", 1, p1, p2, p3, p4, p5, p7, active(p1), dbamp(rms(aleft)), dbamp(rms(aright))
          endin
          
          gk_Droner_partial1 chnexport "gk_Droner_partial1", 3
          gk_Droner_partial2 chnexport "gk_Droner_partial2", 3
          gk_Droner_partial3 chnexport "gk_Droner_partial3", 3
          gk_Droner_partial4 chnexport "gk_Droner_partial4", 3
          gk_Droner_partial5 chnexport "gk_Droner_partial5", 3
          gk_Droner_partial6 chnexport "gk_Droner_partial6", 3
          gk_Droner_partial7 chnexport "gk_Droner_partial7", 3
          gk_Droner_partial8 chnexport "gk_Droner_partial8", 3
          gk_Droner_partial9 chnexport "gk_Droner_partial9", 3
          gk_Droner_partial10 chnexport "gk_Droner_partial10", 3
          gk_Droner_level chnexport "gk_Droner_level", 3
          gi_Droner_waveform chnexport "gi_Droner_waveform", 3
gk_Droner_partial1 init 0.12105641763436441 ; Updated from: gk_Droner_partial1 init .5
gk_Droner_partial2 init 0.22628712362552666 ; Updated from: gk_Droner_partial2 init .05
gk_Droner_partial3 init 0.6406330284657281 ; Updated from: gk_Droner_partial3 init .1
gk_Droner_partial4 init 0.11447949850991676 ; Updated from: gk_Droner_partial4 init .2
gk_Droner_partial5 init 0 ; Updated from: gk_Droner_partial5 init .1
          gk_Droner_partial6 init 0
          gk_Droner_partial7 init 0
          gk_Droner_partial8 init 0
          gk_Droner_partial9 init 0
          gk_Droner_partial10 init 0
gk_Droner_level init -29.34648581997534 ; Updated from: gk_Droner_level init 0
          gi_Droner_waveform init 0
          gk_Droner_space_left_to_right chnexport "gk_Droner_space_left_to_right", 3
          gk_Droner_space_left_to_right init .5
          gi_Droner_sine ftgen 0, 0, 65537, 10, 1, 0, .02
          instr Droner
          i_instrument = p1
          i_time = p2
          ; Make indefinite notes last no longer than the physical decay.
          i_physical_decay = 200000
          if p3 == -1 then
          i_duration = i_physical_decay
          else
          i_duration = p3
          endif
          i_midi_key = p4
          i_midi_velocity = p5
          k_space_front_to_back = p6
          if p7 ==0 then
          k_space_left_to_right = gk_Droner_space_left_to_right
          else
          k_space_left_to_right = p7
          endif
          k_space_bottom_to_top = p8
          i_phase = p9
          i_frequency = cpsmidinn(i_midi_key)
          ; Adjust the following value until "overall amps" at the end of performance is about -6 dB.
          i_overall_amps = 19
          i_normalization = ampdb(-i_overall_amps) / 2
          i_amplitude = ampdb(i_midi_velocity) * i_normalization
          k_gain = ampdb(gk_Droner_level)
          k1 = gk_Droner_partial1
          k2 = gk_Droner_partial2
          k3 = gk_Droner_partial3
          k4 = gk_Droner_partial4
          k5 = gk_Droner_partial5
          k6 = gk_Droner_partial6
          k7 = gk_Droner_partial7
          k8 = gk_Droner_partial8
          k9 = gk_Droner_partial9
          k10 = gk_Droner_partial10
          iwaveform = gi_Droner_waveform
          iattack = .5
          idecay = .5
          isustain = p3
          aenvelope transegr 0.0, iattack / 2.0, 1.5, 1 / 2.0, iattack / 2.0, -1.5, 1, isustain, 0.0, 1, idecay / 2.0, 1.5, 1 / 2.0, idecay / 2.0, -1.5, 0
          ihertz = cpsmidinn(i_midi_key)
          if iwaveform == 0 goto i_waveform_0
          if iwaveform == 1 goto i_waveform_1
          if iwaveform == 2 goto i_waveform_2
          i_waveform_0:
          asignal poscil3 1, ihertz, gi_Droner_sine
          goto i_waveform_endif
          i_waveform_1:
          asignal vco2 1, ihertz, 8 ; integrated saw
          goto i_waveform_endif
          i_waveform_2:
          asignal vco2 1, ihertz, 12 ; triangle
          i_waveform_endif:
          a_signal chebyshevpoly asignal, 0, k1, k2, k3, k4, k5, k6, k7, k8, k9, k10
          ;adeclicking linsegr 0, .004, 1, p3 - .014, 1, .1, 0
          ;a_signal = asignal * adeclicking
          ;
          ; The de-clicking envelope must have attack and release segments that damp 
          ; artifacts in the signal. The duration of these segments depends on 
          ; the behavior of the instrument, and may vary as a function of frequency.
          i_declick_attack = .005
          i_declick_release = .01
          ; The end of the note must be extended _past_ the end of the release segment.
          xtratim 1
          a_declicking_envelope cossegr 0, i_declick_attack, 1,  i_duration, 1,  i_declick_release, 0
          ; The envelope of the instrument is the product of the physical envelope times 
          ; the declicking envelope. 
          a_envelope = aenvelope * a_declicking_envelope
          ; That envelope is then low-pass filtered to remove most discontinuities.
          a_filtered_envelope tonex a_envelope, 40, 4
          a_signal = a_signal * i_amplitude * a_filtered_envelope * k_gain *.001
          prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
          a_out_left, a_out_right pan2 a_signal, k_space_left_to_right
          outleta "outleft", a_out_left
          outleta "outright", a_out_right
          endin
            
          gk_Sweeper_midi_dynamic_range chnexport "gk_Sweeper_midi_dynamic_range", 3 ;  127
          gk_Sweeper_attack chnexport "gk_Sweeper_attack", 3 ;  .125
          gk_Sweeper_release chnexport "gk_Sweeper_release", 3 ;  .25
          gk_Sweeper_britel chnexport "gk_Sweeper_britel", 3 ;  0.1
          gk_Sweeper_briteh chnexport "gk_Sweeper_briteh", 3 ;  2.9
          gk_Sweeper_britels chnexport "gk_Sweeper_britels", 3 ;  2
          gk_Sweeper_britehs chnexport "gk_Sweeper_britehs", 3 ;  1
          gk_Sweeper_level chnexport "gk_Sweeper_level", 3 ;  0
          gk_Sweeper_midi_dynamic_range init 20
          gk_Sweeper_attack init .125
          gk_Sweeper_release init .25
gk_Sweeper_britel init 0.11591819956838968 ; Updated from: gk_Sweeper_britel init .01
gk_Sweeper_briteh init 0.826225465008735 ; Updated from: gk_Sweeper_briteh init 5
gk_Sweeper_britels init 0.5631487000308293 ; Updated from: gk_Sweeper_britels init .5
gk_Sweeper_britehs init 1.668071112938033 ; Updated from: gk_Sweeper_britehs init 1.75
gk_Sweeper_level init -11.586681738772988 ; Updated from: gk_Sweeper_level init 0
          gk_Sweeper_space_left_to_right chnexport "gk_Sweeper_space_left_to_right", 3
          gk_Sweeper_space_left_to_right init .5
          gi_Sweeper_sine ftgen 0, 0, 65537, 10, 1
          gi_Sweeper_octfn ftgen 0, 0, 65537, -19, 1, 0.5, 270, 0.5
          instr Sweeper
          //////////////////////////////////////////////
          // Original by Iain McCurdy.
          // Adapted by Michael Gogins.
          //////////////////////////////////////////////
          i_instrument = p1
          i_time = p2
          i_duration = p3
          i_midi_key = p4
          i_midi_dynamic_range = i(gk_Sweeper_midi_dynamic_range)
          i_midi_velocity = p5 * i_midi_dynamic_range / 127 + (63.5 - i_midi_dynamic_range / 2)
          k_space_front_to_back = p6
          if p7 ==0 then
          k_space_left_to_right = gk_Sweeper_space_left_to_right
          else
          k_space_left_to_right = p7
          endif
          k_space_bottom_to_top = p8
          i_phase = p9
          i_frequency = cpsmidinn(i_midi_key)
          ; Adjust the following value until "overall amps" at the end of performance is about -6 dB.
          i_level_correction = 34.2
          i_normalization = ampdb(-i_level_correction) / 2
          i_amplitude = ampdb(i_midi_velocity) * i_normalization
          k_gain = ampdb(gk_Sweeper_level)
          iattack = i(gk_Sweeper_attack)
          irelease = i(gk_Sweeper_release)
          isustain = p3
          kenvelope transegr 0.0, iattack / 2.0, 1.5, i_amplitude / 2.0, iattack / 2.0, -1.5, i_amplitude, isustain, 0.0, i_amplitude, irelease / 2.0, 1.5, i_amplitude / 2.0, irelease / 2.0, -1.5, 0
          ihertz = i_frequency
          icps = ihertz
          kamp expseg 0.001,0.02,0.2,p3-0.01,0.001
          ktonemoddep jspline 0.01,0.05,0.2
          ktonemodrte jspline 6,0.1,0.2
          ktone poscil3 ktonemoddep, ktonemodrte, gi_Sweeper_sine
          ; kres rspline krangeMin, krangeMax, kcpsMin, kcpsMax
          kbrite rspline gk_Sweeper_britel, gk_Sweeper_briteh, gk_Sweeper_britels, gk_Sweeper_britehs
          ibasfreq init icps
          ioctcnt init 3
          iphs init 0
          a1 hsboscil kenvelope, ktone, kbrite, ibasfreq, gi_Sweeper_sine, gi_Sweeper_octfn, ioctcnt, iphs
          amod poscil3 0.25, ibasfreq*(1/3), gi_Sweeper_sine
          arm = a1*amod
          kmix expseg 0.001, 0.01, rnd(1), rnd(3)+0.3, 0.001
          kmix=.25
          a1 ntrpol a1, arm, kmix
          kpanrte jspline 5, 0.05, 0.1
          kpandep jspline 0.9, 0.2, 0.4
          kpan poscil3 kpandep, kpanrte, gi_Sweeper_sine
          ;a1,a2 pan2 a1, kpan
          a1,a2 pan2 a1, k_space_left_to_right
          aleft delay a1, rnd(0.1)
          aright delay a2, rnd(0.11)
          a_signal = (aleft + aright)
          ; As with most software instruments that are modeled on an impulse exciting a 
          ; resonator, there should be two envelopes. The "physical" envelope must have a 
          ; fixed decay ending at zero.
          i_declick_minimum = .003
          i_attack = .001 / i_frequency + i_declick_minimum
          i_declick_attack = i_attack
          i_declick_release = i_declick_minimum * 2
          ; The end of the note must be extended _past_ the end of the release segment.
          xtratim 1
          a_declicking_envelope cossegr 0, i_declick_attack, 1,  i_duration, 1,  i_declick_release, 0
          ; The envelope of the instrument is the product of the physical envelope times 
          ; the declicking envelope. 
          a_envelope = a_declicking_envelope
          ; That envelope is then low-pass filtered to remove most discontinuities.
          a_filtered_envelope tonex a_envelope, 40, 4
          a_signal = a_signal * i_amplitude * a_filtered_envelope * k_gain *.001
          prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
          a_out_left, a_out_right pan2 a_signal, k_space_left_to_right
          outleta "outleft", a_out_left
          outleta "outright", a_out_right
          outs a_out_left, a_out_right
          endin
            
          gk_Buzzer_attack chnexport "gk_Buzzer_attack", 3
          gk_Buzzer_release chnexport "gk_Buzzer_release", 3
          gk_Buzzer_harmonics chnexport "gk_Buzzer_harmonics", 3
          gk_Buzzer_level chnexport "gk_Buzzer_level", 3
          gk_Buzzer_midi_dynamic_range chnexport "gk_Buzzer_midi_dynamic_range", 3
          gk_Buzzer_attack init .125
          gk_Buzzer_release init .25
gk_Buzzer_harmonics init 1.3688212927756656 ; Updated from: gk_Buzzer_harmonics init 8
gk_Buzzer_level init 0.2466091245376134 ; Updated from: gk_Buzzer_level init 0
          gk_Buzzer_midi_dynamic_range init 20
          gi_Buzzer_sine ftgen 0, 0, 65537, 10, 1
          instr Buzzer
          i_instrument = p1
          i_time = p2
          i_duration = p3
          i_midi_key = p4
          i_midi_dynamic_range = i(gk_Buzzer_midi_dynamic_range)
          i_midi_velocity = p5 * i_midi_dynamic_range / 127 + (63.5 - i_midi_dynamic_range / 2)
          k_space_front_to_back = p6
          k_space_left_to_right = p7
          k_space_bottom_to_top = p8
          i_phase = p9
          i_frequency = cpsmidinn(i_midi_key)
          ; Adjust the following value until "overall amps" at the end of performance is about -6 dB.
          i_level_correction = 75
          i_normalization = ampdb(-i_level_correction) / 2
          i_amplitude = ampdb(i_midi_velocity) * i_normalization
          k_gain = ampdb(gk_Buzzer_level)
          i_attack = i(gk_Buzzer_attack)
          i_release = i(gk_Buzzer_release)
          i_sustain = p3
          xtratim 1
          a_envelope transegr 0.0, i_attack / 2.0, 1.5, i_amplitude / 2.0, i_attack / 2.0, -1.5, i_amplitude, i_sustain, 0.0, i_amplitude, i_release / 2.0, 1.5, i_amplitude / 2.0, i_release / 2.0, -1.5, 0
          a_signal buzz a_envelope, i_frequency, gk_Buzzer_harmonics, gi_Buzzer_sine
          a_signal = a_signal * k_gain
          prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
          a_out_left, a_out_right pan2 a_signal, k_space_left_to_right
          outleta "outleft", a_out_left
          outleta "outright", a_out_right
          ;printks "Buzzer         i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d l%9.4f r%9.4f\n", 1, p1, p2, p3, p4, p5, p7, active(p1), dbamp(rms(a_out_left)), dbamp(rms(a_out_right))
          endin
            
        gk_Shiner_midi_dynamic_range chnexport "gk_Shiner_midi_dynamic_range", 3 ;  127
        gk_Shiner_attack chnexport "gk_Shiner_attack", 3 ;  .0125
        gk_Shiner_release chnexport "gk_Shiner_release", 3 ;  .0125
        gk_Shiner_level chnexport "gk_Shiner_level", 3 ;  0.5
        gk_Shiner_midi_dynamic_range init 20
gk_Shiner_attack init 0.125 ; Updated from: gk_Shiner_attack init .0125
gk_Shiner_release init 0.5 ; Updated from: gk_Shiner_release init .0125
gk_Shiner_level init -16.848217038331107 ; Updated from: gk_Shiner_level init -23
        gk_Shiner_front_to_back chnexport "gk_Shiner_front_to_back", 3 ;  0
        gk_Shiner_left_to_right chnexport "gk_Shiner_left_to_right", 3 ;  0.5
        gk_Shiner_bottom_to_top chnexport "gk_Shiner_bottom_to_top", 3 ;  0
        gk_Shiner_front_to_back init 0
        gk_Shiner_left_to_right init 0.5
        gk_Shiner_bottom_to_top init 0
        instr Shiner
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
        i_midi_dynamic_range = i(gk_Shiner_midi_dynamic_range)
        i_midi_velocity = p5 * i_midi_dynamic_range / 127 + (63.5 - i_midi_dynamic_range / 2)
        k_space_front_to_back = p6
        if p7 ==0 then
        k_space_left_to_right = gk_Shiner_left_to_right
        else
        k_space_left_to_right = p7
        endif
        k_space_bottom_to_top = p8
        i_phase = p9
        i_frequency = cpsmidinn(i_midi_key)
        ; Adjust the following value until "overall amps" at the end of performance is about -6 dB.
        i_level_correction = 42.5
        i_normalization = ampdb(-i_level_correction) / 2
        i_amplitude = ampdb(i_midi_velocity) * i_normalization
        k_gain = ampdb(gk_Shiner_level)
        iattack = i(gk_Shiner_attack)
        idecay = i(gk_Shiner_release)
        isustain = i_duration
        a_physical_envelope transeg 0.0, iattack / 2.0, 1.5, i_amplitude / 2.0, iattack / 2.0, -1.5, i_amplitude, isustain, 0.0, i_amplitude, idecay / 2.0, 1.5, i_amplitude / 2.0, idecay / 2.0, -1.5, 0
        ihertz = cpsmidinn(i_midi_key)
        gk_Harmonics = 1 * 20
        a_signal vco2 4, ihertz, 12
        kgain = ampdb(gk_Shiner_level) * .5
        ; The end of the note must be extended _past_ the end of the release segment.
        xtratim 1
        a_declicking_envelope cossegr 0, .005, 1,  i_duration, 1,  .01, 0
        ; The envelope of the instrument is the product of the physical envelope times 
        ; the declicking envelope. 
        a_envelope = a_physical_envelope * a_declicking_envelope
        ; That envelope is then low-pass filtered to remove most discontinuities.
        a_filtered_envelope tonex a_envelope, 40, 4
        a_signal = a_signal * i_amplitude * a_filtered_envelope * k_gain *.001
        prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
        a_out_left, a_out_right pan2 a_signal, k_space_left_to_right
        outleta "outleft", a_out_left
        outleta "outright", a_out_right
        endin

        gk_FMModerate_level chnexport "gk_FMModerate_level", 3
gk_FMModerate_level init -34 ; Updated from: gk_FMModerate_level init -12
        gk_FMModerate_space_left_to_right chnexport "gk_FMModerate_space_left_to_right", 3
        gk_FMModerate_space_left_to_right init .5
        gi_FMModerate_exponent chnexport "gi_FMModerate_exponent", 3
gi_FMModerate_exponent init -99.50678175092477 ; Updated from: gi_FMModerate_exponent init -9

        gi_FMModerate_cosine ftgen 0, 0, 65537, 11, 1

        instr FMModerate
        ; Authors: Michael Gogins
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
        i_midi_velocity = p5
        k_space_front_to_back = p6
        k_space_left_to_right = p7
        k_space_bottom_to_top = p8
        i_phase = p9
        i_frequency = cpsmidinn(i_midi_key)
        i_overall_amps = 86 ; To start - change to observed value.
        i_normalization = ampdb(-i_overall_amps) / 2
        i_amplitude = ampdb(i_midi_velocity) * i_normalization
        k_gain = ampdb(gk_FMModerate_level)
        icarrier = 1
        imodulator = 1
        ifmamplitude = 8
        index = 5.4
        ifrequencyb = i_frequency * 1.003
        icarrierb = icarrier * 1.004
        aindenv transeg 1,  i_physical_decay, -10.0, 0
        aindex = aindenv * index * ifmamplitude
        aouta foscili 1.0, i_frequency, icarrier, imodulator, index, gi_FMModerate_cosine
        aoutb foscili 1.0, ifrequencyb, icarrierb, imodulator, index, gi_FMModerate_cosine
        a_signal = aouta + aoutb
        i_attack = .002
        i_release = 0.01
        ; As with most software instruments that are modeled on an impulse exciting a 
        ; resonator, there should be two envelopes. The "physical" envelope must have a 
        ; fixed decay ending at zero.
        i_declick_minimum = .008
        i_attack = i_declick_minimum
        i_exponent = 9
        a_physical_envelope transeg 0, i_attack, gi_FMModerate_exponent, 1, i_physical_decay, gi_FMModerate_exponent,  0
        ; The de-clicking envelope must have attack and release segments that damp 
        ; artifacts in the signal. The duration of these segments depends on 
        ; the behavior of the instrument, and may vary as a function of frequency.
        i_declick_attack = .008
        i_declick_release = .016
        ; The end of the note must be extended _past_ the end of the release segment.
        xtratim 1
        a_declicking_envelope cossegr 0, i_declick_attack, 1,  i_physical_decay, 1,  i_declick_release, 0
        ; The envelope of the instrument is the product of the physical envelope times 
        ; the declicking envelope. 
        a_envelope = a_physical_envelope * a_declicking_envelope
        ; That envelope is then low-pass filtered to remove most discontinuities.
        a_filtered_envelope tonex a_envelope, 40, 4
        a_signal = a_signal * i_amplitude * a_envelope * k_gain

        a_out_left, a_out_right pan2 a_signal, k_space_left_to_right
        outleta "outleft", a_out_left
        outleta "outright", a_out_right
        prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
        endin
        
        gk_Blower_grainDensity chnexport "gk_Blower_grainDensity", 3
        gk_Blower_grainDuration chnexport "gk_Blower_grainDuration", 3
        gk_Blower_grainAmplitudeRange chnexport "gk_Blower_grainAmplitudeRange", 3
        gk_Blower_grainFrequencyRange chnexport "gk_Blower_grainFrequencyRange", 3
        gk_Blower_attack chnexport "gk_Blower_attack", 3
        gk_Blower_release chnexport "gk_Blower_release", 3
        gk_Blower_level chnexport "gk_Blower_level", 3
        gk_Blower_midi_dynamic_range chnexport "gk_Blower_midi_dynamic_range", 3
gk_Blower_grainDensity init 245.730140787175 ; Updated from: gk_Blower_grainDensity init 40
gk_Blower_grainDuration init 0.03750899188161545 ; Updated from: gk_Blower_grainDuration init 0.2
gk_Blower_grainAmplitudeRange init 119.4532935977803 ; Updated from: gk_Blower_grainAmplitudeRange init 100
gk_Blower_grainFrequencyRange init 50.251772685232766 ; Updated from: gk_Blower_grainFrequencyRange init 3
gk_Blower_attack init 1.5 ; Updated from: gk_Blower_attack init 1.5
gk_Blower_release init 2 ; Updated from: gk_Blower_release init 2
gk_Blower_level init -29.344363374781626 ; Updated from: gk_Blower_level init 0
        gk_Blower_midi_dynamic_range init 20
        gk_Blower_space_left_to_right chnexport "gk_Blower_space_left_to_right", 3
        gk_Blower_space_left_to_right init .5
        gi_Blower_grtab ftgen 0, 0, 65537, 10, 1, .3, .1, 0, .2, .02, 0, .1, .04
        gi_Blower_wintab ftgen 0, 0, 65537, 10, 1, 0, .5, 0, .33, 0, .25, 0, .2, 0, .167
        instr Blower
        //////////////////////////////////////////////
        // Original by Hans Mikelson.
        // Adapted by Michael Gogins.
        //////////////////////////////////////////////
        i_instrument = p1
        i_time = p2
        i_duration = p3
        i_midi_key = p4
        i_midi_dynamic_range = i(gk_Blower_midi_dynamic_range)
        i_midi_velocity = p5 * i_midi_dynamic_range / 127 + (63.5 - i_midi_dynamic_range / 2)
        k_space_front_to_back = p6
        if p7 ==0 then
        k_space_left_to_right = gk_Blower_space_left_to_right
        else
        k_space_left_to_right = p7
        endif
        k_space_bottom_to_top = p8
        i_phase = p9
        i_frequency = cpsmidinn(i_midi_key)
        ; Adjust the following value until "overall amps" at the end of performance is about -6 dB.
        i_level_correction = 123
        i_normalization = ampdb(-i_level_correction) / 2
        i_amplitude = ampdb(i_midi_velocity) * i_normalization
        k_gain = ampdb(gk_Blower_level)
        iHz = i_frequency
        ihertz = iHz
        ip4 = i_amplitude
        ip5 = iHz
        ip6 = gi_Blower_grtab
        ip7 = gi_Blower_wintab
        ip8 = 0.033
        ip8 = .002
        ip9 = 150
        ip9 = 100
        ip10 = 1.6
        ip10 = 3
        idur = p3
        iamp = i_amplitude ; p4
        ifqc = iHz ; cpspch(p5)
        igrtab = ip6
        iwintab = ip7
        ifrng = ip8
        idens = ip9
        ifade = ip10
        igdur = 0.2
        iattack = i(gk_Blower_attack)
        i_sustain = p3
        idecay = i(gk_Blower_release)
        xtratim iattack + idecay
        kenvelope transegr 0.0, iattack / 2.0, 1.5, .5, iattack / 2.0, -1.5, 1, i_sustain, 0.0, 1, idecay / 2.0, 1.5, .5, idecay / 2.0, -1.5, 0
        ; Amp Fqc Dense AmpOff PitchOff GrDur GrTable WinTable MaxGrDur
        // Maybe frequency range should really be pitch range?
        aoutl grain ip4, ifqc, gk_Blower_grainDensity, gk_Blower_grainAmplitudeRange, gk_Blower_grainFrequencyRange, gk_Blower_grainDuration, igrtab, iwintab, 5
        aoutr grain ip4, ifqc, gk_Blower_grainDensity, gk_Blower_grainAmplitudeRange, gk_Blower_grainFrequencyRange, gk_Blower_grainDuration, igrtab, iwintab, 5
        a_signal = aoutl + aoutr
        i_attack = .002
        i_release = 0.01
        ; xtratim i_attack + i_release
        a_declicking linsegr 0, i_attack, 1, i_sustain, 1, i_release, 0
        ; print iattack, idecay
        a_signal = a_signal * i_amplitude * k_gain * kenvelope
        prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
        a_out_left, a_out_right pan2 a_signal, k_space_left_to_right
        outleta "outleft", a_out_left
        outleta "outright", a_out_right
        ;printks "Blower         i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d l%9.4f r%9.4f\n", 1, p1, p2, p3, p4, p5, p7, active(p1), dbamp(rms(a_out_left)), dbamp(rms(a_out_right))
        endin
          
          gk_ZakianFlute_midi_dynamic_range chnexport "gk_ZakianFlute_midi_dynamic_range", 3 ;  20
          gk_ZakianFlute_level chnexport "gk_ZakianFlute_level", 3 ;  0
          gk_ZakianFlute_pan chnexport "gk_ZakianFlute_pan", 3 ;  .5
          gi_ZakianFLute_seed chnexport "gi_ZakianFLute_seed", 3 ;  .5
          gi_ZakianFLute_space_left_to_front chnexport "gi_ZakianFLute_space_left_to_front", 3 ;  .5
          gk_ZakianFlute_midi_dynamic_range init 20
gk_ZakianFlute_level init -22.767444250333984 ; Updated from: gk_ZakianFlute_level init 0
          gk_ZakianFlute_pan init .5
          gi_ZakianFLute_seed init .5
          gi_ZakianFLute_space_left_to_front init .5
          gi_ZakianFLute_f2  ftgen 0, 0, 16, -2, 40, 40, 80, 160, 320, 640, 1280, 2560, 5120, 10240, 10240
          gi_ZakianFlute_f26 ftgen 0, 0, 65537, -10, 2000, 489, 74, 219, 125, 9, 33, 5, 5
          gi_ZakianFlute_f27 ftgen 0, 0, 65537, -10, 2729, 1926, 346, 662, 537, 110, 61, 29, 7
          gi_ZakianFlute_f28 ftgen 0, 0, 65537, -10, 2558, 2012, 390, 361, 534, 139, 53, 22, 10, 13, 10
          gi_ZakianFlute_f29 ftgen 0, 0, 65537, -10, 12318, 8844, 1841, 1636, 256, 150, 60, 46, 11
          gi_ZakianFlute_f30 ftgen 0, 0, 65537, -10, 1229, 16, 34, 57, 32
          gi_ZakianFlute_f31 ftgen 0, 0, 65537, -10, 163, 31, 1, 50, 31
          gi_ZakianFlute_f32 ftgen 0, 0, 65537, -10, 4128, 883, 354, 79, 59, 23
          gi_ZakianFlute_f33 ftgen 0, 0, 65537, -10, 1924, 930, 251, 50, 25, 14
          gi_ZakianFlute_f34 ftgen 0, 0, 65537, -10, 94, 6, 22, 8
          gi_ZakianFlute_f35 ftgen 0, 0, 65537, -10, 2661, 87, 33, 18
          gi_ZakianFlute_f36 ftgen 0, 0, 65537, -10, 174, 12
          gi_ZakianFlute_f37 ftgen 0, 0, 65537, -10, 314, 13
          gi_ZakianFlute_wtsin ftgen 0, 0, 65537, 10, 1
          instr ZakianFlute
          ; Author: Lee Zakian
          ; Adapted by: Michael Gogins
          i_instrument = p1
          i_time = p2
          if p3 == -1 then
          i_duration = 1000
          else
          i_duration = p3
          endif
          i_midi_key = p4
          i_midi_velocity = p5
          k_space_front_to_back = p6
          if p7 == 0 then
          k_space_left_to_right = gi_ZakianFLute_space_left_to_front
          else
          k_space_left_to_right = p7
          endif
          k_space_bottom_to_top = p8
          i_phase = p9
          i_overall_amps = 65.2
          i_normalization = ampdb(-i_overall_amps) / 2
          i_midi_dynamic_range = i(gk_ZakianFlute_midi_dynamic_range)
          i_midi_velocity = p5 * i_midi_dynamic_range / 127 + (63.5 - i_midi_dynamic_range / 2)
          i_amplitude = ampdb(i_midi_velocity) * i_normalization
          k_gain = ampdb(gk_ZakianFlute_level)
          ;;;xtratim iattack + irelease
          iHz = cpsmidinn(i_midi_key)
          kHz = k(iHz)
          // Bug?
          aenvelope transeg 1.0, 20.0, -10.0, 0.05
          ///aenvelope transegr 1.0, 20.0, -10.0, 0.05
          ip3 = 3;;; (p3 < 3.0 ? p3 : 3.0)
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
          ifiltcut tablei ip9, gi_ZakianFLute_f2 ; lowpass filter cutoff frequency
          iattack = (iattack < 6/kr ? 6/kr : iattack) ; minimal attack length
          idecay = (idecay < 6/kr ? 6/kr : idecay) ; minimal decay length
          isustain = i_duration - iattack - idecay
          ;;;p3 = (isustain < 5/kr ? iattack+idecay+5/kr : i_duration) ; minimal sustain length
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
          kvibrate linseg 2.5+ivibr1, isustain, 4.5+ivibr2 ; if p6 positive vibrato gets faster
          goto vibrato2
          vibrato1:
          ivibr3 = gi_ZakianFLute_seed
          gi_ZakianFLute_seed = frac(gi_ZakianFLute_seed*105.947)
          kvibrate linseg 3.5+ivibr1, .1, 4.5+ivibr2,isustain-.1, 2.5+ivibr3 ; if p6 negative vibrato gets slower
          vibrato2:
          kvibrater randi .1*kvibrate, 5, gi_ZakianFLute_seed ; up to 10% vibrato rate variation
          gi_ZakianFLute_seed = frac(gi_ZakianFLute_seed*105.947)
          kvibrate = kvibrate + kvibrater
          kvib oscili kvibdepth, kvibrate, gi_ZakianFlute_wtsin
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
          kamp1 linseg 0, iatt, 0.002, iatt, 0.045, iatt, 0.146, iatt, \
          0.272, iatt, 0.072, iatt, 0.043, isus, 0.230, isus, 0.000, isus, \
          0.118, isus, 0.923, idec, 1.191, idec, 0.794, idec, 0.418, idec, \
          0.172, idec, 0.053, idec, 0
          kamp2 linseg 0, iatt, 0.009, iatt, 0.022, iatt, -0.049, iatt, \
          -0.120, iatt, 0.297, iatt, 1.890, isus, 1.543, isus, 0.000, isus, \
          0.546, isus, 0.690, idec, -0.318, idec, -0.326, idec, -0.116, idec, \
          -0.035, idec, -0.020, idec, 0
          kamp3 linseg 0, iatt, 0.005, iatt, -0.026, iatt, 0.023, iatt, \
          0.133, iatt, 0.060, iatt, -1.245, isus, -0.760, isus, 1.000, isus, \
          0.360, isus, -0.526, idec, 0.165, idec, 0.184, idec, 0.060, idec, \
          0.010, idec, 0.013, idec, 0
          iwt1 = gi_ZakianFlute_f26 ; wavetable numbers
          iwt2 = gi_ZakianFlute_f27
          iwt3 = gi_ZakianFlute_f28
          inorm = 3949
          goto end
          range2: ; for low mid-range tones
          kamp1 linseg 0, iatt, 0.000, iatt, -0.005, iatt, 0.000, iatt, \
          0.030, iatt, 0.198, iatt, 0.664, isus, 1.451, isus, 1.782, isus, \
          1.316, isus, 0.817, idec, 0.284, idec, 0.171, idec, 0.082, idec, \
          0.037, idec, 0.012, idec, 0
          kamp2 linseg 0, iatt, 0.000, iatt, 0.320, iatt, 0.882, iatt, \
          1.863, iatt, 4.175, iatt, 4.355, isus, -5.329, isus, -8.303, isus, \
          -1.480, isus, -0.472, idec, 1.819, idec, -0.135, idec, -0.082, idec, \
          -0.170, idec, -0.065, idec, 0
          kamp3 linseg 0, iatt, 1.000, iatt, 0.520, iatt, -0.303, iatt, \
          0.059, iatt, -4.103, iatt, -6.784, isus, 7.006, isus, 11, isus, \
          12.495, isus, -0.562, idec, -4.946, idec, -0.587, idec, 0.440, idec, \
          0.174, idec, -0.027, idec, 0
          iwt1 = gi_ZakianFlute_f29
          iwt2 = gi_ZakianFlute_f30
          iwt3 = gi_ZakianFlute_f31
          inorm = 27668.2
          goto end
          range3: ; for high mid-range tones
          kamp1 linseg 0, iatt, 0.005, iatt, 0.000, iatt, -0.082, iatt, \
          0.36, iatt, 0.581, iatt, 0.416, isus, 1.073, isus, 0.000, isus, \
          0.356, isus, .86, idec, 0.532, idec, 0.162, idec, 0.076, idec, 0.064, \
          idec, 0.031, idec, 0
          kamp2 linseg 0, iatt, -0.005, iatt, 0.000, iatt, 0.205, iatt, \
          -0.284, iatt, -0.208, iatt, 0.326, isus, -0.401, isus, 1.540, isus, \
          0.589, isus, -0.486, idec, -0.016, idec, 0.141, idec, 0.105, idec, \
          -0.003, idec, -0.023, idec, 0
          kamp3 linseg 0, iatt, 0.722, iatt, 1.500, iatt, 3.697, iatt, \
          0.080, iatt, -2.327, iatt, -0.684, isus, -2.638, isus, 0.000, isus, \
          1.347, isus, 0.485, idec, -0.419, idec, -.700, idec, -0.278, idec, \
          0.167, idec, -0.059, idec, 0
          iwt1 = gi_ZakianFlute_f32
          iwt2 = gi_ZakianFlute_f33
          iwt3 = gi_ZakianFlute_f34
          inorm = 3775
          goto end
          range4: ; for high range tones
          kamp1 linseg 0, iatt, 0.000, iatt, 0.000, iatt, 0.211, iatt, \
          0.526, iatt, 0.989, iatt, 1.216, isus, 1.727, isus, 1.881, isus, \
          1.462, isus, 1.28, idec, 0.75, idec, 0.34, idec, 0.154, idec, 0.122, \
          idec, 0.028, idec, 0
          kamp2 linseg 0, iatt, 0.500, iatt, 0.000, iatt, 0.181, iatt, \
          0.859, iatt, -0.205, iatt, -0.430, isus, -0.725, isus, -0.544, isus, \
          -0.436, isus, -0.109, idec, -0.03, idec, -0.022, idec, -0.046, idec, \
          -0.071, idec, -0.019, idec, 0
          kamp3 linseg 0, iatt, 0.000, iatt, 1.000, iatt, 0.426, iatt, \
          0.222, iatt, 0.175, iatt, -0.153, isus, 0.355, isus, 0.175, isus, \
          0.16, isus, -0.246, idec, -0.045, idec, -0.072, idec, 0.057, idec, \
          -0.024, idec, 0.002, idec, 0
          iwt1 = gi_ZakianFlute_f35
          iwt2 = gi_ZakianFlute_f36
          iwt3 = gi_ZakianFlute_f37
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
          i_sustain = i_duration
          i_release = 0.01
          i_declick_attack = i_attack
          i_declick_release = i_declick_attack * 2
          ; The end of the note must be extended _past_ the end of the release segment.
          xtratim 1
          a_declicking_envelope cossegr 0, i_declick_attack, 1,  i_duration, 1,  i_declick_release, 0
          ; That envelope is then low-pass filtered to remove most discontinuities.
          a_filtered_envelope tonex a_declicking_envelope, 40, 4
          a_signal = a_signal * i_amplitude * a_filtered_envelope * k_gain 
          prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
          a_signal *= .7
          a_out_left, a_out_right pan2 a_signal, k_space_left_to_right
          outleta "outleft", a_out_left
          outleta "outright", a_out_right
          endin
            
            
          gk_FilteredSines_level chnexport "gk_FilteredSines_level", 3
        gi_FilteredSines_attack chnexport "gi_FilteredSines_attack", 3
        gi_FilteredSines_release chnexport "gi_FilteredSines_release", 3
        
gk_FilteredSines_level init -18.163600863220637 ; Updated from: gk_FilteredSines_level init 0
        gi_FilteredSines_attack init 1
          gi_FilteredSines_release init 1
        
        gi_FilteredSines_bergeman ftgen 0, 0, 65537, 10, .28, 1, .74, .66, .78, .48, .05, .33, 0.12, .08, .01, .54, 0.19, .08, .05, 0.16, .01, 0.11, .3, .02, 0.2 ; Bergeman f1
        
        instr FilteredSines
        ; Author: Michael Bergeman
        ; Modified by: Michael Gogins
        xtratim gi_FilteredSines_attack + gi_FilteredSines_release
        i_instrument = p1
        i_time = p2
        i_duration = p3
        i_midi_key = p4
        i_midi_velocity = p5
        k_space_front_to_back = p6
        k_space_left_to_right = p7
        k_space_bottom_to_top = p8
        i_phase = p9
        i_overall_amps = 166
        i_normalization = ampdb(-i_overall_amps) / 2
        i_amplitude = ampdb(i_midi_velocity) * i_normalization
        i_frequency = cpsmidinn(i_midi_key)
        k_gain = ampdb(gk_FilteredSines_level)
        kHz = k(i_frequency)
        koctave = octcps(kHz)
        iattack init gi_FilteredSines_attack
        isustain init p3
        irelease init gi_FilteredSines_release
        idb = 1.5
        ip5 = gi_FilteredSines_bergeman
        ip3 = 5.0
        ip6 = 0.9
        ip7 = 1.4
        kp8 = cpsoct(koctave - .01)
        kp9 = cpsoct(koctave + .01)
        isc = idb * .333
        k1 linseg 40, ip3, 800, p3, 800, 0.06, 0.0
        k2 linseg 440, ip3, 220, p3, 220, 0.06, 0.0
        k3 linseg 0.0, ip6, 800, ip7, 200.0, p3, 200, 0.06, 0.0
        k4 linseg 800, ip3, 40, p3, 40, 0.06, 0.0
        k5 linseg 220, ip3, 440, p3, 440, 0.06, 0.0
        k6 linseg isc, ip6, p3, ip7, p3, 0.06, 0.0
        k7 linseg 0.0, ip6, 1, ip7, .3, p3, .1, 0.06, 0.0
        a5 poscil k3, kp8, ip5
        a6 poscil k3, kp8 * 0.999, ip5
        a7 poscil k3, kp8 * 1.001, ip5
        a1 = a5 + a6 + a7
        a8 poscil k6, kp9, ip5
        a9 poscil k6, kp9 * 0.999, ip5
        a10 poscil k6, kp9 * 1.001, ip5
        a11 = a8 + a9 + a10
        a2 butterbp a1, k1, 40
        a3 butterbp a2, k5, k2 * 0.8
        a4 balance a3, a1
        a12 butterbp a11, k4, 40
        a13 butterbp a12, k2, k5 * 0.8
        a14 balance a13, a11
        a15 reverb2 a4, 5, 0.3
        a16 reverb2 a4, 4, 0.2
        a17 = (a15 + a4) * k7
        a18 = (a16 + a4) * k7
        a_signal = (a17 + a18)
        i_attack = .002
        i_sustain = p3
        i_release = 0.01
        xtratim (i_attack + i_release)
        a_declicking linsegr 0, i_attack, 1, i_sustain, 1, i_release, 0
        a_signal = a_signal * i_amplitude * a_declicking * k_gain * 1.88
        
        a_out_left, a_out_right pan2 a_signal, k_space_left_to_right
        outleta "outleft", a_out_left
        outleta "outright", a_out_right
          prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
          endin
          
          gk_Guitar_midi_dynamic_range chnexport "gk_Guitar_midi_dynamic_range", 3 ; 127
        gk_Guitar_midi_dynamic_range init 30
        gk_Guitar_level chnexport "gk_Guitar_level", 3
gk_Guitar_level init 0 ; Updated from: gk_Guitar_level init 0
        gk_Guitar_space_left_to_right chnexport "gk_Guitar_space_left_to_right", 3
        gk_Guitar_space_left_to_right init .5
        
        instr Guitar
        ; Michael Gogins
        ; Simple emulation of a Spanish guitar.
        ; Considerably cleaned up after close listening and systematic testing. 
        ; But I think the plain `pluck` opcode is inherently a bit noisy. The 
        ; waveform is just jagged at first.
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
        i_midi_dynamic_range = i(gk_Guitar_midi_dynamic_range)
        i_midi_velocity = p5 * i_midi_dynamic_range / 127 + (63.5 - i_midi_dynamic_range / 2)
        k_space_front_to_back = p6
        if p7 ==0 then
        k_space_left_to_right = gk_Guitar_space_left_to_right
        else
        k_space_left_to_right = p7
        endif
        k_space_bottom_to_top = p8
        i_phase = p9
        i_frequency = cpsmidinn(i_midi_key)
        ; Adjust the following value until "overall amps" at the end of performance is about -6 dB.
        i_level_correction = 73
        i_normalization = ampdb(-i_level_correction) / 2
        i_amplitude = ampdb(i_midi_velocity) * i_normalization
        k_gain = ampdb(gk_Guitar_level)
        i_frequency2 = i_frequency
        a_signal pluck 1.0, i_frequency, i_frequency2, 0, 6
        a_top_body reson a_signal, 110, 80
        a_bottom_body reson a_signal, 220, 100
        a_whole_body reson a_signal, 440, 80
        a_signal = (.6 * a_top_body + .8 * a_bottom_body + .6 * a_whole_body + .4 * a_signal) 
        ; For testing envelopes with a simple signal that lacks confounding artifacts.
        ; a_signal oscils .1, i_frequency2, 0
        ; For testing envelopes with a DC signal (shows only the envelope).
        ; a_signal = .25
        
        ; As with most software instruments that are modeled on an impulse exciting a 
        ; resonator, there should be two envelopes. The "physical" envelope must have a 
        ; fixed decay ending at zero.
        i_declick_minimum = .003
        i_attack = .001 / i_frequency + i_declick_minimum
        i_exponent = -200
        a_physical_envelope transeg 0,   i_attack, i_exponent,  1,   i_physical_decay, i_exponent,  0
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
        
        gk_Harpsichord_level chnexport "gk_Harpsichord_level", 3
        gk_Harpsichord_pick chnexport "gk_Harpsichord_pick", 3
        gk_Harpsichord_reflection chnexport "gk_Harpsichord_reflection", 3
        gk_Harpsichord_pluck chnexport "gk_Harpsichord_pluck", 3
        gk_Harpsichord_midi_dynamic_range chnexport "gk_Harpsichord_midi_dynamic_range", 3
        gk_Harpsichord_space_left_to_right chnexport "gk_Harpsichord_space_left_to_right", 3
        
gk_Harpsichord_level init -6 ; Updated from: gk_Harpsichord_level init 0
        gk_Harpsichord_pick init .075
        gk_Harpsichord_reflection init .5
        gk_Harpsichord_pluck init .75
        gk_Harpsichord_midi_dynamic_range init 20
        gk_Harpsichord_space_left_to_right init .5
        
        gi_Harpsichord_harptable ftgen 0, 0, 65537, 7, -1, 1024, 1, 1024, -1
        
        instr Harpsichord
        i_instrument = p1
        i_time = p2
        ; Make indefinite notes last no longer than the physical decay.
        i_physical_decay = 40
        if p3 == -1 then
        i_duration = i_physical_decay
        else
        i_duration = p3
        endif
        i_midi_key = p4
        i_midi_dynamic_range = i(gk_Harpsichord_midi_dynamic_range)
        i_midi_velocity = p5 * i_midi_dynamic_range / 127 + (63.6 - i_midi_dynamic_range / 2)
        k_space_front_to_back = p6
        if p7 == 0 then
        k_space_left_to_right = gk_Harpsichord_space_left_to_right
        else
        k_space_left_to_right = p7
        endif
        k_space_bottom_to_top = p8
        i_phase = p9
        i_frequency = cpsmidinn(i_midi_key)
        ; Adjust the following value until "overall amps" at the end of performance is about -6 dB.
        i_level_correction = 66
        i_normalization = ampdb(-i_level_correction) / 2
        i_amplitude = ampdb(i_midi_velocity) * i_normalization
        k_gain = ampdb(gk_Harpsichord_level)
        iHz = cpsmidinn(i_midi_key)
        kHz = k(iHz)
        a_physical_envelope transeg 1.0, i_physical_decay, -25.0, 0.0
        apluck pluck i_amplitude * k_gain, kHz, iHz, 0, 1
        aharp poscil a_physical_envelope, kHz, gi_Harpsichord_harptable
        aharp2 balance apluck, aharp
        a_signal	= (apluck + aharp2)
        i_attack = .0005
        i_sustain = p3
        i_release = 0.01
        ; The end of the note must be extended _past_ the end of the release segment.
        xtratim 1
        i_declick_attack init .0008
        i_declick_release init .01
        a_declicking_envelope cossegr 0, i_declick_attack, 1,  i_duration, 1,  i_declick_release, 0
        a_envelope = a_declicking_envelope
        a_filtered_envelope tonex a_envelope, 40, 4
        a_signal = a_signal * i_amplitude * a_filtered_envelope * k_gain 
        
        a_out_left, a_out_right pan2 a_signal, k_space_left_to_right
        outleta "outleft", a_out_left
        outleta "outright", a_out_right
        ;printks "Harpsichord      %9.4f   %9.4f\n", 0.5, a_out_left, a_out_right
        prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
        endin
        /**
         * This is yet another attempt to adapt this beautiful sound for use in 
         * wider contexts. 
         *
         * In its original form this could not work without artifacts because of the 
         * k-rate frequency modulation of the pluck opcode.
         */
        gi_Kung2_detune_cents chnexport "gk_Kung2_detune_cents", 3
        gi_Kung2_detune_cents init 8
        gk_Kung2_level chnexport "gk_Kung2_level", 3
gk_Kung2_level init -10.275380189066993 ; Updated from: gk_Kung2_level init 0
        gk_Kung2_midi_dynamic_range chnexport "gk_Kung2_midi_dynamic_range", 3
        gk_Kung2_midi_dynamic_range init 30
        gk_Kung2_space_left_to_right chnexport "gk_Kung2_space_left_to_right", 3
        gk_Kung2_space_left_to_right init .5
        gi_Kung2_sine ftgen 0, 0, 65537, 10, 1
        opcode Kung2_, aa, 0
        setksmps 1
        i_instrument = p1
        i_time = p2
        ; Make indefinite notes last no longer than the physical decay.
        i_instrument_duration = 999999
        if p3 == -1 then
        i_duration = i_instrument_duration
        else
        i_duration = p3
        endif
        i_midi_key = p4
        i_midi_dynamic_range = i(gk_Kung2_midi_dynamic_range)
        i_midi_velocity = p5 * i_midi_dynamic_range / 127 + (63.5 - i_midi_dynamic_range / 2)
        k_space_front_to_back = p6
        if p7 ==0 then
        k_space_left_to_right = gk_Kung2_space_left_to_right
        else
        k_space_left_to_right = p7
        endif
        k_space_bottom_to_top = p8
        i_phase = p9
        i_frequency = cpsmidinn(i_midi_key)
        ; Adjust the following value until "overall amps" at the end of performance is about -6 dB.
        i_level_correction = 21 + 51 + 7
        i_normalization = ampdb(-i_level_correction) / 2
        i_amplitude = ampdb(i_midi_velocity) * i_normalization
        k_gain = ampdb(gk_Kung2_level)
        ishift = gi_Kung2_detune_cents/12000
        ipch = cpsmidinn(i_midi_key)
        ioct = octmidinn(i_midi_key)
        i_vibrato_frequency = (i_midi_key / 127) * 2
        kvib poscil3 1/120, i_vibrato_frequency, gi_Kung2_sine
        ag pluck 1, cpsoct(ioct+kvib), 1000, gi_Kung2_sine, 1
        agleft pluck 1, cpsoct(ioct+ishift), 1000, gi_Kung2_sine, 1
        agright pluck 1, cpsoct(ioct-ishift), 1000, gi_Kung2_sine, 1
        i_physical_decay = 20
        ; As with most software instruments that are modeled on an impulse exciting a 
        ; resonator, there should be two envelopes. The "physical" envelope must have a 
        ; fixed decay ending at zero.
        i_declick_minimum = .003
        i_attack = .001 / i_frequency + i_declick_minimum
        i_exponent = 3
        a_physical_envelope transeg 0,   i_attack, -i_exponent,  1,   i_physical_decay, -i_exponent,  0
        a_declicking_envelope cossegr 0, .006, 1, i_instrument_duration, 1,  .06, 0
        a_envelope = a_physical_envelope * a_declicking_envelope
        a_filtered_envelope tonex a_envelope, 30, 3
        xtratim 3
        ag = a_declicking_envelope * ag
        agleft = a_declicking_envelope * agleft
        agright = a_declicking_envelope * agright
        adump delayr 0.3
        ad1 deltap3 0.1
        ad2 deltap3 0.2
        delayw ag
        a_out_left = agleft + ad1
        a_out_right = agright + ad2
        a_filtered_declicking tonex a_declicking_envelope, 30, 4
        a_out_left = a_out_left * k_gain * i_amplitude * a_filtered_declicking
        a_out_right = a_out_right * k_gain * i_amplitude * a_filtered_declicking 
        xout a_out_left, a_out_right
        endop
        
        instr Kung2
        a_out_left, a_out_right Kung2_
        outleta "outleft", a_out_left 
        outleta "outright", a_out_right
        prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
        endin
        
        gi_Kung4_detune_cents chnexport "gk_Kung4_detune_cents", 3
        gi_Kung4_detune_cents init 8
        gk_Kung4_level chnexport "gk_Kung4_level", 3
gk_Kung4_level init -20.136676600554924 ; Updated from: gk_Kung4_level init 0
        gk_Kung4_midi_dynamic_range chnexport "gk_Kung4_midi_dynamic_range", 3
        gk_Kung4_midi_dynamic_range init 30
        gk_Kung4_space_left_to_right chnexport "gk_Kung4_space_left_to_right", 3
        gk_Kung4_space_left_to_right init .5
        gi_Kung4_modulation_ratio_start chnexport "gi_Kung4_modulation_ratio_start", 3
        gi_Kung4_modulation_ratio_start init 1.7
        gi_Kung4_modulation_ratio_end chnexport "gi_Kung4_modulation_ratio_end", 3
        gi_Kung4_modulation_ratio_end init .5
        
        gi_Kung4_sine ftgen 0, 0, 65537, 10, 1
        gi_Kung4_cosine ftgen 0, 0, 65537, 11, 1
        gi_Kung4_ln ftgen 0, 9, 65537, -12, 20.0  ;unscaled ln(I(x)) from 0 to 20.0
        /**
         * This is yet another attempt to adapt this beautiful sound for use in 
         * wider contexts.
         */
        instr Kung4
        i_instrument = p1
        i_time = p2
        ; Make indefinite notes last no longer than the physical decay.
        i_instrument_duration = 999999
        if p3 == -1 then
        i_duration = i_instrument_duration
        else
        i_duration = p3
        endif
        ;print i_duration
        i_midi_key = p4
        i_midi_dynamic_range = i(gk_Kung4_midi_dynamic_range)
        i_midi_velocity = p5 * i_midi_dynamic_range / 127 + (63.5 - i_midi_dynamic_range / 2)
        k_space_front_to_back = p6
        if p7 ==0 then
        k_space_left_to_right = gk_Kung4_space_left_to_right
        else
        k_space_left_to_right = p7
        endif
        k_space_bottom_to_top = p8
        i_phase = p9
        i_frequency = cpsmidinn(i_midi_key)
        ; Adjust the following value until "overall amps" at the end of performance is about -6 dB.
        i_level_correction = 130 + 8 + 6
        i_normalization = ampdb(-i_level_correction) / 2
        i_amplitude = ampdb(i_midi_velocity) * i_normalization
        k_gain = ampdb(gk_Kung4_level)
        ishift = gi_Kung4_detune_cents/12000
        ipch = cpsmidinn(i_midi_key)
        ioct = octmidinn(i_midi_key)
        kvib poscil 1/120, ipch/50, gi_Kung4_sine
        ; The instrument envelope should observe limits.
        if (i_duration > 10) then
        i_instrument_attack = 10 / 3
        elseif (i_duration < 1) then
        i_instrument_attack = 1 / 3
        else
        i_instrument_attack = i_duration / 3
        endif
        ;print i_instrument_attack
        ;i_instrument_duration -= (2 * i_instrument_attack)
        aadsr linsegr 0, i_instrument_attack, 1.0, i_duration, 1.0, i_instrument_attack, 0 ;ADSR envelope
        amodi linseg 0, i_instrument_attack, 5, i_duration, 3, i_instrument_attack, 0 ;ADSR envelope for I
        amodr linseg gi_Kung4_modulation_ratio_start, i_duration, gi_Kung4_modulation_ratio_end ;r moves from p6->p7 in p3 sec.
        a1 = amodi*(amodr-1/amodr)/2
        a1ndx = abs(a1*2/20) ;a1*2 is normalized from 0-1.
        a2 = amodi*(amodr+1/amodr)/2
        a3 tablei a1ndx, gi_Kung4_ln, 1 ;lookup tbl in f3, normal index
        ao1 poscil a1, ipch, gi_Kung4_cosine ;cosine
        a4 = exp(-0.5*a3+ao1)
        ao2 poscil a2*ipch, ipch, gi_Kung4_cosine ;cosine
        a_out_left poscil 1000*aadsr*a4, ao2+cpsoct(ioct+ishift), gi_Kung4_sine ;fnl outleft
        a_out_right poscil 1000*aadsr*a4, ao2+cpsoct(ioct-ishift), gi_Kung4_sine ;fnl outright
        i_declick_minimum = .003
        i_attack = .001 / i_frequency + i_declick_minimum
        i_exponent = 7
        a_physical_envelope = aadsr ;  transeg 0,   i_attack, -i_exponent,  1,   i_duration, -i_exponent,  0
        ; The de-clicking envelope must have attack and release segments that damp 
        ; artifacts in the signal. The duration of these segments depends on 
        ; the behavior of the instrument, and may vary as a function of frequency.
        i_declick_attack = i_attack
        i_declick_release = i_declick_minimum * 2
        ; The end of the note must be extended _past_ the end of the release segment.
        xtratim 5
        ;print i_declick_attack
        ;print i_declick_release
        ;print i_duration
        a_declicking_envelope cossegr 0, i_declick_attack, 1,  i_duration, 1,  i_declick_release, 0
        ; The envelope of the instrument is the product of the physical envelope times 
        ; the declicking envelope. 
        a_envelope = a_physical_envelope * a_declicking_envelope
        ; That envelope is then low-pass filtered to remove most discontinuities.
        a_filtered_envelope tonex a_envelope, 40, 4
        a_out_left = a_out_left * i_amplitude * a_filtered_envelope * k_gain 
        a_out_right = a_out_right * i_amplitude * a_filtered_envelope * k_gain 
        
        outleta "outleft", a_out_left 
        outleta "outright", a_out_right
        prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
        endin
        gk_Plucked_midi_dynamic_range chnexport "gk_Plucked_midi_dynamic_range", 3
        gk_Plucked_midi_dynamic_range init 30
        gk_Plucked_space_left_to_right chnexport "gk_Plucked_space_left_to_right", 3
        gk_Plucked_space_left_to_right init .5
        gk_Plucked_level chnexport "gk_Plucked_level", 3
gk_Plucked_level init 27.874833007912855 ; Updated from: gk_Plucked_level init 0
        
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
        i_attack = .0003 / i_frequency2 + i_declick_minimum
        i_exponent = 40
        a_physical_envelope transeg 0,   i_attack, -i_exponent,  1,   i_physical_decay, -i_exponent,  0
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
        a_signal = a_signal * i_amplitude * a_filtered_envelope * k_gain *.05
        
        a_out_left, a_out_right pan2 a_signal, k_space_left_to_right
        outleta "outleft", a_out_left
        outleta "outright", a_out_right
        prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
        endin
        gi_SeidelHarmOsc_tabsz init 2^16
        
        gi_SeidelHarmOsc_Sin     ftgen 0, 0, gi_SeidelHarmOsc_tabsz, 9, 1,1,0
        gi_SeidelHarmOsc_Tri     ftgen 0, 0, gi_SeidelHarmOsc_tabsz, 9, 1,1,0,  3,0.333,180,  5,0.2,0,  7,0.143,180, 9,0.111,0, 11,0.091,180, 13,0.077,0, 15,0.067,180, 17,0.059,0, 19,0.053,180, 21,0.048,0, 23,0.043,180, 25,0.04,0, 27,0.037,180, 29,0.034,0, 31,0.032,180
        gi_SeidelHarmOsc_Saw     ftgen 0, 0, gi_SeidelHarmOsc_tabsz, 7, 0, gi_SeidelHarmOsc_tabsz/2, 1, 0, -1, gi_SeidelHarmOsc_tabsz/2, 0
        gi_SeidelHarmOsc_Square  ftgen 0, 0, gi_SeidelHarmOsc_tabsz, 7, 1, gi_SeidelHarmOsc_tabsz/2, 1, 0, -1, gi_SeidelHarmOsc_tabsz/2, -1
        gi_SeidelHarmOsc_Prime   ftgen 0, 0, gi_SeidelHarmOsc_tabsz, 9, 1,1,0,  2,0.5,0,  3,0.3333,0,  5,0.2,0,   7,0.143,0,  11,0.0909,0,  13,0.077,0,   17,0.0588,0,  19,0.0526,0, 23,0.0435,0, 27,0.037,0, 31,0.032,180
        gi_SeidelHarmOsc_Fib     ftgen 0, 0, gi_SeidelHarmOsc_tabsz, 9, 1,1,0,  2,0.5,0,  3,0.3333,0,  5,0.2,0,   8,0.125,0,  13,0.0769,0,  21,0.0476,0,  34,0.0294,0 ;,  55,0.0182,0,  89,0.0112,0, 144,0.0069,0
        
        gi_SeidelHarmOsc_NumTables = 5
        gi_SeidelHarmOsc_List ftgen 1000, 0, gi_SeidelHarmOsc_NumTables, -2, gi_SeidelHarmOsc_Tri, gi_SeidelHarmOsc_Saw, gi_SeidelHarmOsc_Square, gi_SeidelHarmOsc_Prime, gi_SeidelHarmOsc_Fib, gi_SeidelHarmOsc_Sin
        gi_SeidelHarmOsc_Morf ftgen 1001, 0, gi_SeidelHarmOsc_tabsz, 10, 1
        
        gi_SeidelHarmOsc_lforabsz init 2^13
        gi_SeidelHarmOsc_LfoTri ftgen 0, 0, gi_SeidelHarmOsc_lforabsz, 7, 0, gi_SeidelHarmOsc_lforabsz/4, 1, gi_SeidelHarmOsc_lforabsz/2, -1, gi_SeidelHarmOsc_lforabsz/4, 0
        
        gk_SeidelHarmOsc_level chnexport "gk_SeidelHarmOsc_level", 3 ;  0
        gi_SeidelHarmOsc_attack chnexport "gi_SeidelHarmOsc_attack", 3 ;  0.003
        gi_SeidelHarmOsc_petals chnexport "gi_SeidelHarmOsc_petals", 3 ;  2.99
        gi_SeidelHarmOsc_release chnexport "gi_SeidelHarmOsc_release", 3 ;  0.01
        gk_SeidelHarmOsc_midi_dynamic_range chnexport "gk_SeidelHarmOsc_midi_dynamic_range", 3 ;  20
        
gk_SeidelHarmOsc_level init -20.136676600554924 ; Updated from: gk_SeidelHarmOsc_level init 0
        gi_SeidelHarmOsc_attack init 0.003
        gi_SeidelHarmOsc_petals init 2.99
        gi_SeidelHarmOsc_release init 0.01
        gk_SeidelHarmOsc_midi_dynamic_range init 20
        
        gk_SeidelHarmOsc_P1 chnexport "gk_SeidelHarmOsc_P1", 3
        gk_SeidelHarmOsc_IN1CON chnexport "gk_SeidelHarmOsc_IN1CON", 3
        gk_SeidelHarmOsc_IN1C1 chnexport "gk_SeidelHarmOsc_IN1C1", 3
        
        gk_SeidelHarmOsc_P1 init 0.1
        gk_SeidelHarmOsc_IN1CON init 0.1
        gk_SeidelHarmOsc_IN1C1 init 1
        
        gk_SeidelHarmOsc_P2 chnexport "gk_SeidelHarmOsc_P2", 3
        gk_SeidelHarmOsc_IN2C1 chnexport "gk_SeidelHarmOsc_IN2C1", 3
        gk_SeidelHarmOsc_IN2CON chnexport "gk_SeidelHarmOsc_IN2CON", 3
        
        gk_SeidelHarmOsc_P2 init 0.1
        gk_SeidelHarmOsc_IN2C1 init 1
        gk_SeidelHarmOsc_IN2CON init 0.1
        
        gk_SeidelHarmOsc_P3 chnexport "gk_SeidelHarmOsc_P3", 3
        gk_SeidelHarmOsc_IN3C1 chnexport "gk_SeidelHarmOsc_IN3C1", 3
        gk_SeidelHarmOsc_IN3CON chnexport "gk_SeidelHarmOsc_IN3CON", 3
        
        gk_SeidelHarmOsc_P3 init 0.1
        gk_SeidelHarmOsc_IN3C1 init 1
        gk_SeidelHarmOsc_IN3CON init 0.1
        
        gk_SeidelHarmOsc_P4 chnexport "gk_SeidelHarmOsc_P4", 3
        gk_SeidelHarmOsc_IN4C1 chnexport "gk_SeidelHarmOsc_IN4C1", 3
        gk_SeidelHarmOsc_IN4CON chnexport "gk_SeidelHarmOsc_IN4CON", 3
        
        gk_SeidelHarmOsc_P4 init 0.1
        gk_SeidelHarmOsc_IN4C1 init 1
        gk_SeidelHarmOsc_IN4CON init 0.1
        
        gi_SeidelHarmOsc_pitch_bend_table ftgen 0, 0, 1024, -7, 1, 1024, 1 
        gi_SeidelHarmOsc_sine ftgen 0, 0, 65537, 10, 1
        
        instr SeidelHarmOsc
        i_instrument = p1
        i_time = p2
        i_sustain = p3
        xtratim gi_SeidelHarmOsc_attack + gi_SeidelHarmOsc_release
        i_midi_key = p4
        i_midi_dynamic_range = i(gk_SeidelHarmOsc_midi_dynamic_range)
        i_midi_velocity = p5 * i_midi_dynamic_range / 127 + (63.6 - i_midi_dynamic_range / 2)
        // Spatial location is specified in Ambisonic coordinates.
        k_space_front_to_back = p6
        // AKA stereo pan.
        k_space_left_to_right = p7
        k_space_bottom_to_top = p8
        i_phase = p9
        i_frequency = cpsmidinn(i_midi_key)
        // Adjust the following value until "overall amps" at the end of performance is about -6 dB.
        i_level_correction = 87
        i_normalization = ampdb(-i_level_correction) / 2
        i_amplitude = ampdb(i_midi_velocity) * i_normalization
        k_gain = ampdb(gk_SeidelHarmOsc_level)
        ; prints("p1=%f, p2=%f, p3=%f, p4=%f\n", p1, p2, p3, p4)
        ;;;kfreq chnget sprintf("FREQ%d", p4)
        kfreq init i_frequency
        
        kin1con init 0
        kin2con init 0
        kin3con init 0
        kin4con init 0
        
        koff  init 0.001
        koff1 init 0.001
        koff2 init 2 * 0.001
        koff3 init 3 * 0.001
        koff4 init 5 * 0.001
        koffa = scale2(gk_SeidelHarmOsc_P1, 0.001, 0.1, -10, 10)
        if (gk_SeidelHarmOsc_IN1CON == 1) then
        koffb = scale2(gk_SeidelHarmOsc_IN1C1, 0.001, 0.1, 0, 10)
        koff = koffa + koffb
        else
        koff = koffa
        endif
        koff1 = koff
        koff2 = 2 * koff
        koff3 = 3 * koff
        koff4 = 5 * koff
        
        itbl = gi_SeidelHarmOsc_Morf
        kndx init 0
        kndxa = scale2(gk_SeidelHarmOsc_P2, 0, gi_SeidelHarmOsc_NumTables-1.01, -10, 10)
        if (gk_SeidelHarmOsc_IN2CON == 1) then
        kndxb = scale2(gk_SeidelHarmOsc_IN2C1, 0, gi_SeidelHarmOsc_NumTables-1.01, 0, 10)
        kndx = kndxa + kndxb
        else
        kndx = kndxa
        endif
        ftmorf kndx, gi_SeidelHarmOsc_List, gi_SeidelHarmOsc_Morf
        
        kamp init 0.8/9
        
        ; a1 oscil3 kamp, kfreq, itbl
        a2 oscil3 kamp, kfreq+koff1, itbl
        a3 oscil3 kamp, kfreq+koff2, itbl
        a4 oscil3 kamp, kfreq+koff3, itbl
        a5 oscil3 kamp, kfreq+koff4, itbl
        a6 oscil3 kamp, kfreq-koff1, itbl
        a7 oscil3 kamp, kfreq-koff2, itbl
        a8 oscil3 kamp, kfreq-koff3, itbl
        a9 oscil3 kamp, kfreq-koff4, itbl
        
        kdst init 0
        kdsta = scale2(gk_SeidelHarmOsc_P3, 0, 10, -10, 10)
        if (gk_SeidelHarmOsc_IN3CON == 1) then
        kdstb = scale2(gk_SeidelHarmOsc_IN3C1, 0, 10, 0, 10)
        kdst = kdsta + kdstb
        else
        kdst = kdsta
        endif
        
        aL = a2+a4+a6+a8
        aR = a3+a5+a7+a9
        aoutL = aL + distort1(aL, kdst, 0.1, 0, 0)
        aoutR = aR + distort1(aR, kdst, 0.1, 0, 0)
        
        kpana = scale2(gk_SeidelHarmOsc_P4, 0, 7, -10, 10)
        if (gk_SeidelHarmOsc_IN4CON == 1) then
        kpanb = scale2(gk_SeidelHarmOsc_IN4C1, 0, 5, 0, 10)
        kpan = kpana + kpanb
        else
        kpan = kpana
        endif
        if (kpan == 0) then
        kext = 0
        else
        kext = 0.1
        endif
        klfoL oscili 0.49, kpan-kext, gi_SeidelHarmOsc_LfoTri, 90
        klfoR oscili 0.49, kpan+kext, gi_SeidelHarmOsc_LfoTri, 270
        klfoL += 0.5
        klfoR += 0.5
        aoutL1, aoutR1 pan2 aoutL, klfoL
        aoutL2, aoutR2 pan2 aoutR, klfoR
        aoutL = aoutL1+aoutL2
        aoutR = aoutR1+aoutR2
        
        aenv madsr 0.07,0,1,0.7
        a_out_left = aoutL * aenv * k_gain * i_amplitude
        a_out_right = aoutR * aenv * k_gain * i_amplitude
        ;;; outs aoutL*aenv, aoutR*aenv
        ;;; a_out_left, a_out_right pan2 a_signal, k_space_left_to_right
        outleta "outleft", a_out_left
        outleta "outright", a_out_right
        ;printks "WGPluck      %9.4f   %9.4f\n", 0.5, a_out_left, a_out_right
        prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
        endin
        
        gk_TubularBell_level chnexport "gk_TubularBell_level", 3
        gi_TubularBell_crossfade chnexport "gi_TubularBell_crossfade", 3
        gi_TubularBell_vibrato_depth chnexport "gi_TubularBell_vibrato_depth", 3
        gi_TubularBell_vibrato_rate chnexport "gi_TubularBell_vibrato_rate", 3
        
gk_TubularBell_level init -17.505908950775876 ; Updated from: gk_TubularBell_level init 0
        gi_TubularBell_crossfade init 2
        gi_TubularBell_vibrato_depth init .1
        gi_TubularBell_vibrato_rate init 5
        gk_TubularBell_midi_dynamic_range chnexport "gk_TubularBell_midi_dynamic_range", 3 ; 127
        gk_TubularBell_midi_dynamic_range init 30
        
        gk_TubularBell_space_left_to_right chnexport "gk_TubularBell_space_left_to_right", 3
        gk_TubularBell_space_left_to_right init .5
        
        gi_TubularBell_isine ftgen 0, 0, 65537, 10, 1
        gi_TubularBell_icosine ftgen 0, 0, 65537, 11, 1
        gi_TubularBell_icook3 ftgen 0, 0, 65537, 10, 1, .4, 0.2, 0.1, 0.1, .05
        
        instr TubularBell
        ; Authors: Perry Cook, John ffitch, Michael Gogins
        i_instrument = p1
        i_time = p2
        i_physical_decay = 5
        if p3 == -1 then
        i_duration = i_physical_decay
        else
        i_duration = p3
        endif
        i_midi_key = p4
        i_midi_velocity = p5
        k_space_front_to_back = p6
        if p7 ==0 then
        k_space_left_to_right = gk_TubularBell_space_left_to_right
        else
        k_space_left_to_right = p7
        endif
        k_space_bottom_to_top = p8
        i_phase = p9
        i_frequency = cpsmidinn(i_midi_key)
        ; Adjust the following value until "overall amps" at the end of performance is about -6 dB.
        i_overall_amps = 12.5
        i_normalization = ampdb(-i_overall_amps) / 2
        i_midi_dynamic_range = i(gk_TubularBell_midi_dynamic_range)
        i_midi_velocity = p5 * i_midi_dynamic_range / 127 + (63.5 - i_midi_dynamic_range / 2)
        i_amplitude = ampdb(i_midi_velocity) * i_normalization
        k_gain = ampdb(gk_TubularBell_level)
        iattack = 0.002
        isustain = p3
        irelease = 0.05
        iindex = 1
        ifn1 = gi_TubularBell_isine
        ifn2 = gi_TubularBell_icook3
        ifn3 = gi_TubularBell_isine
        ifn4 = gi_TubularBell_isine
        ivibefn = gi_TubularBell_icosine
        a_signal fmbell 1, i_frequency, iindex, gi_TubularBell_crossfade, gi_TubularBell_vibrato_depth, gi_TubularBell_vibrato_rate, ifn1, ifn2, ifn3, ifn4, ivibefn
        i_attack = .002
        i_sustain = i_duration
        i_release = 0.01
        ; As with most software instruments that are modeled on an impulse exciting a 
        ; resonator, there should be two envelopes. The "physical" envelope must have a 
        ; fixed decay ending at zero.
        i_declick_minimum = .001
        i_attack = .001 / i_frequency + i_declick_minimum
        i_exponent = 7
        a_physical_envelope transeg 0,   i_attack, -i_exponent,  1,   i_physical_decay, -i_exponent,  0
        ; The de-clicking envelope must have attack and release segments that damp 
        ; artifacts in the signal. The duration of these segments depends on 
        ; the behavior of the instrument, and may vary as a function of frequency.
        i_declick_attack = .004
        i_declick_release = i_declick_minimum * 2
        ; The end of the note must be extended _past_ the end of the release segment.
        xtratim 1
        a_declicking_envelope cossegr 0, i_declick_attack, 1,  i_duration, 1,  i_declick_release, 0
        ; The envelope of the instrument is the product of the physical envelope times 
        ; the declicking envelope. 
        a_envelope = a_physical_envelope * a_declicking_envelope
        ; That envelope is then low-pass filtered to remove most discontinuities.
        a_filtered_envelope tonex a_envelope, 120, 4
        a_signal = a_signal * i_amplitude * a_filtered_envelope * k_gain *.001
        
        a_out_left, a_out_right pan2 a_signal, k_space_left_to_right
        outleta "outleft", a_out_left
        outleta "outright", a_out_right
        prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
        endin
        
        gk_YiString_midi_dynamic_range chnexport "gk_YiString_midi_dynamic_range", 3 ;  127
        gk_YiString_level chnexport "gk_YiString_level", 3 ;  0
        gk_YiString_reverb_send chnexport "gk_YiString_reverb_send", 3 ;  .5
        gk_YiString_chorus_send chnexport "gk_YiString_chorus_send", 3 ;  .5
        gi_YiString_overlap chnexport "gi_YiString_overlap", 3 ;  .1
        
        gk_YiString_midi_dynamic_range init 20
gk_YiString_level init 0 ; Updated from: gk_YiString_level init 0
        gk_YiString_reverb_send init .5
        gk_YiString_chorus_send init .5
        gi_YiString_overlap init .1
        
        gk_YiString_space_left_to_right chnexport "gk_YiString_space_left_to_right", 3
        gk_YiString_space_left_to_right init .5
        
        instr YiString
        //////////////////////////////////////////////
        // Original by Steven Yi.
        // Adapted by Michael Gogins.
        //////////////////////////////////////////////
        i_instrument = p1
        i_time = p2
        ; Make indefinite notes last no longer than the physical decay.
        i_physical_duration = 20000
        if p3 == -1 then
        i_duration = i_physical_duration
        else
        i_duration = p3
        endif
        i_midi_key = p4
        i_midi_dynamic_range = i(gk_YiString_midi_dynamic_range)
        i_midi_velocity = p5 * i_midi_dynamic_range / 127 + (63.5 - i_midi_dynamic_range / 2)
        k_space_front_to_back = p6
        k_space_left_to_right = p7
        k_space_bottom_to_top = p8
        i_phase = p9
        i_frequency = cpsmidinn(i_midi_key)
        ; Adjust the following value until "overall amps" at the end of performance is about -6 dB.
        i_level_correction = 62.25
        i_normalization = ampdb(-i_level_correction) / 2
        i_amplitude = ampdb(i_midi_velocity) * i_normalization
        k_gain = ampdb(gk_YiString_level)
        iattack = gi_YiString_overlap
        isustain = i_duration
        idecay = gi_YiString_overlap
        xtratim 1
        a_physical_envelope transeg 0.0, iattack / 2.0, 1.5, i_amplitude / 2.0, iattack / 2.0, -1.5, i_amplitude, isustain, 0.0, i_amplitude, idecay / 2.0, 1.5, i_amplitude / 2.0, idecay / 2.0, -1.5, 0
        ;ampenv = madsr:a(1, 0.1, 0.95, 0.5)
        a_signal = vco2(1, i_frequency)
        a_signal = moogladder(a_signal, 6000, 0.1)
        
        ; The de-clicking envelope must have attack and release segments that damp 
        ; artifacts in the signal. The duration of these segments depends on 
        ; the behavior of the instrument, and may vary as a function of frequency.
        i_declick_attack = iattack
        i_declick_release = i_declick_attack * 2
        ; The end of the note must be extended _past_ the end of the release segment.
        xtratim 1
        a_declicking_envelope cossegr 0, i_declick_attack, 1,  i_duration, 1,  i_declick_release, 0
        ; The envelope of the instrument is the product of the physical envelope times 
        ; the declicking envelope. 
        a_envelope = a_physical_envelope * a_declicking_envelope
        ; That envelope is then low-pass filtered to remove most discontinuities.
        a_filtered_envelope tonex a_envelope, 40, 4
        a_signal = a_signal * i_amplitude * a_filtered_envelope * k_gain *.001
        
        a_signal_reverb = a_signal * gk_YiString_reverb_send
        a_signal_chorus = a_signal * gk_YiString_chorus_send
        a_out_left, a_out_right pan2 a_signal_reverb, p7
        outleta "outleft", a_out_left
        outleta "outright",  a_out_right
        a_out_left, a_out_right pan2 a_signal_chorus, p7
        outleta "chorusleft", a_out_left 
        outleta "chorusright", a_out_right 
        ;printks "YiString         %9.4f  %9.4f\n", 0.5, a_out_left, a_out_right
        prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
        endin
        gk_Xing_level chnexport "gk_Xing_level", 3
        
gk_Xing_level init 0 ; Updated from: gk_Xing_level init 0
        
        gi_Xing_isine ftgen 0, 0, 65537, 10, 1
        
        instr Xing
        ; Author: Andrew Horner
        i_instrument = p1
        i_time = p2
        i_duration = p3
        i_midi_key = p4
        i_midi_velocity = p5
        k_space_front_to_back = p6
        k_space_left_to_right = p7
        k_space_bottom_to_top = p8
        i_phase = p9
        i_overall_amps = 75
        i_normalization = ampdb(-i_overall_amps) / 2
        i_amplitude = ampdb(i_midi_velocity) * i_normalization
        i_frequency = cpsmidinn(i_midi_key)
        k_gain = ampdb(gk_Xing_level)
        iinstrument = p1
        istarttime = p2
        ioctave = p4
        idur = p3
        kfreq = k(i_frequency)
        iamp = 1
        inorm = 32310
        aamp1 linseg 0,.001,5200,.001,800,.001,3000,.0025,1100,.002,2800,.0015,1500,.001,2100,.011,1600,.03,1400,.95,700,1,320,1,180,1,90,1,40,1,20,1,12,1,6,1,3,1,0,1,0
        adevamp1 linseg 0, .05, .3, idur - .05, 0
        adev1 poscil adevamp1, 6.7, gi_Xing_isine, .8
        amp1 = aamp1 * (1 + adev1)
        aamp2 linseg 0,.0009,22000,.0005,7300,.0009,11000,.0004,5500,.0006,15000,.0004,5500,.0008,2200,.055,7300,.02,8500,.38,5000,.5,300,.5,73,.5,5.,5,0,1,1
        adevamp2 linseg 0,.12,.5,idur-.12,0
        adev2 poscil adevamp2, 10.5, gi_Xing_isine, 0
        amp2 = aamp2 * (1 + adev2)
        aamp3 linseg 0,.001,3000,.001,1000,.0017,12000,.0013,3700,.001,12500,.0018,3000,.0012,1200,.001,1400,.0017,6000,.0023,200,.001,3000,.001,1200,.0015,8000,.001,1800,.0015,6000,.08,1200,.2,200,.2,40,.2,10,.4,0,1,0
        adevamp3 linseg 0, .02, .8, idur - .02, 0
        adev3 poscil adevamp3, 70, gi_Xing_isine ,0
        amp3 = aamp3 * (1 + adev3)
        awt1 poscil amp1, i_frequency, gi_Xing_isine
        awt2 poscil amp2, 2.7 * i_frequency, gi_Xing_isine
        awt3 poscil amp3, 4.95 * i_frequency, gi_Xing_isine
        asig = awt1 + awt2 + awt3
        arel linenr 1,0, idur, .06
        a_signal = asig * arel * (iamp / inorm)
        i_attack = .002
        i_sustain = p3
        i_release = 0.01
        xtratim i_attack + i_release
        a_declicking linsegr 0, i_attack, 1, i_sustain, 1, i_release, 0
        a_signal = a_signal * i_amplitude * a_declicking * k_gain
        
        a_out_left, a_out_right pan2 a_signal, k_space_left_to_right
        outleta "outleft", a_out_left
        outleta "outright", a_out_right
        prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
        endin
        
        

          gk_ReverbSC_feedback chnexport "gk_ReverbSC_feedback", 3
          gk_ReverbSC_wet chnexport "gk_ReverbSC_wet", 3
          gi_ReverbSC_delay_modulation chnexport "gi_ReverbSC_delay_modulation", 3
          gk_ReverbSC_frequency_cutoff chnexport "gk_ReverbSC_frequency_cutoff", 3
          
gk_ReverbSC_feedback init 0.8707357172215372 ; Updated from: gk_ReverbSC_feedback init 0.875
gk_ReverbSC_wet init 0.5 ; Updated from: gk_ReverbSC_wet init 0.5
          gi_ReverbSC_delay_modulation init 0.0075
gk_ReverbSC_frequency_cutoff init 9000 ; Updated from: gk_ReverbSC_frequency_cutoff init 15000
          
          instr ReverbSC
          gk_ReverbSC_dry = 1.0 - gk_ReverbSC_wet
          aleftin init 0
          arightin init 0
          aleftout init 0
          arightout init 0
          aleftin inleta "inleft"
          arightin inleta "inright"
          aleftout, arightout reverbsc aleftin, arightin, gk_ReverbSC_feedback, gk_ReverbSC_frequency_cutoff, sr, gi_ReverbSC_delay_modulation
          aleftoutmix = aleftin * gk_ReverbSC_dry + aleftout * gk_ReverbSC_wet
          arightoutmix = arightin * gk_ReverbSC_dry + arightout * gk_ReverbSC_wet
          outleta "outleft", aleftoutmix
          outleta "outright", arightoutmix
          prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
          endin
      
          
          gk_MasterOutput_level chnexport "gk_MasterOutput_level", 3 ; 0
          gS_MasterOutput_filename chnexport "gS_MasterOutput_filename", 3 ; ""
          
gk_MasterOutput_level init -2.383888203863542 ; Updated from: gk_MasterOutput_level init 0
          gS_MasterOutput_filename init ""
        
          chn_k "gk_MasterOutput_output_level_left", 3
          chn_k "gk_MasterOutput_output_level_right", 3
        
          instr MasterOutput
          aleft inleta "inleft"
          aright inleta "inright"
          k_gain = ampdb(gk_MasterOutput_level)
          printks2 "Master gain: %f\n", k_gain
          iamp init 1
          aleft butterlp aleft, 18000
          aright butterlp aright, 18000
          a_out_left = aleft * k_gain
          a_out_right = aright * k_gain
          outs a_out_left, a_out_right
          ; We want something that will play on my phone.
          i_amplitude_adjustment = ampdbfs(-3) / 32767
          i_filename_length strlen gS_MasterOutput_filename
          ;if i_filename_length > 0 then
          ;prints sprintf("Output filename: %s\n", gS_MasterOutput_filename)
          ;fout gS_MasterOutput_filename, 18, a_out_left * i_amplitude_adjustment, a_out_right * i_amplitude_adjustment
          ;endif
          prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
          gk_MasterOutput_output_level_left = dbfsamp(rms(a_out_left))
          gk_MasterOutput_output_level_right = dbfsamp(rms(a_out_right))
          chnset gk_MasterOutput_output_level_left, "gk_MasterOutput_output_level_left"
          chnset gk_MasterOutput_output_level_right, "gk_MasterOutput_output_level_right"
          ;;; printks "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d l%9.4f r%9.4f\n", 1, nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1), gk_MasterOutput_output_level_left, gk_MasterOutput_output_level_right
          endin
          
          </CsInstruments>
          <CsScore>
          f 0 [ 10 * 60 + 45]
          
i 2.784594 1 1.542902 46 70.1496 0 0.1895731 0 0 4095 1 
i 2.784594 2.542902 1.580534 51 70.14893 0 0.1895731 0 0 4095 1 
i 2.784594 4.123436 1.469431 49 70.14826 0 0.1895731 0 0 4095 1 
i 2.784594 5.592867 1.691637 51 70.14759 0 0.1895731 0 0 4095 1 
i 2.96863 5.592867 1.691637 51 70.44948 0 0.1988104 0 0 4095 1 
i 2.784594 7.284504 1.469431 51 70.14692 0 0.1895731 0 0 4095 1 
i 2.784594 8.753935 0.7171673 48 70.14625 0 0.1895731 0 0 4095 1 
i 3.091321 8.753935 1.381552 54 70.64939 0 0.2049685 0 0 4095 1 
i 4.569188 10.13549 0.7171673 63 74.40017 0 0.2791463 0 0 4095 1 
i 2.784594 10.25921 0.7171673 51 70.14558 0 0.1895731 0 0 4095 1 
i 3.152666 10.25921 1.352101 54 70.74935 0 0.2080476 0 0 4095 1 
i 4.569188 11.61131 0.7171673 63 74.3995 0 0.2791463 0 0 4095 1 
i 2.784594 11.65866 0.7171673 51 70.14491 0 0.1895731 0 0 4095 1 
i 2.96863 11.65866 0.7171673 51 70.44679 0 0.1988104 0 0 4095 1 
i 3.091321 11.65866 0.7171673 52 70.64805 0 0.2049685 0 0 4095 1 
i 3.152666 11.65866 1.464458 55 70.74868 0 0.2080476 0 0 4095 1 
i 4.569188 13.12312 0.7171673 64 74.39883 0 0.2791463 0 0 4095 1 
i 2.784594 13.60664 0.9220234 49 70.14423 0 0.1895731 0 0 4095 1 
i 4.569188 14.52866 0.7171673 66 74.39816 0 0.2791463 0 0 4095 1 
i 4.753224 14.52866 0.7171673 66 74.70004 0 0.2883835 0 0 4095 1 
i 2.784594 15.07607 0.7171673 51 70.14356 0 0.1895731 0 0 4095 1 
i 3.336703 15.07607 1.070681 54 71.04922 0 0.2172848 0 0 4095 1 
i 4.569188 16.14675 0.7171673 63 74.39748 0 0.2791463 0 0 4095 1 
i 2.784594 16.58134 0.7171673 48 70.14289 0 0.1895731 0 0 4095 1 
i 3.398048 16.58134 0.9709524 54 71.14918 0 0.2203639 0 0 4095 1 
i 4.569188 17.55229 0.7171673 64 74.39681 0 0.2791463 0 0 4095 1 
i 4.875915 17.55229 0.7171673 66 74.89996 0 0.2945416 0 0 4095 1 
i 2.784594 17.9808 0.7171673 49 70.14222 0 0.1895731 0 0 4095 1 
i 2.96863 17.9808 0.7171673 49 70.44411 0 0.1988104 0 0 4095 1 
i 3.336703 17.9808 0.7171673 57 71.04788 0 0.2172848 0 0 4095 1 
i 3.398048 17.9808 1.011319 55 71.14851 0 0.2203639 0 0 4095 1 
i 4.569188 18.99212 0.7171673 66 74.39614 0 0.2791463 0 0 4095 1 
i 4.93726 18.99212 0.7171673 66 74.99992 0 0.2976207 0 0 4095 1 
i 2.784594 19.59188 0.7171673 51 70.14155 0 0.1895731 0 0 4095 1 
i 3.520739 19.59188 0.7171673 54 71.3491 0 0.226522 0 0 4095 1 
i 1 19.96641 0.5378755 51 70.1496 0 0.1 0 0 4095 1 
i 6.353782 20.14975 0.7171673 75 78.65073 0 0.3687194 0 0 4095 1 
i 4.569188 20.33073 0.7171673 67 74.39547 0 0.2791463 0 0 4095 1 
i 4.753224 20.33073 0.7171673 67 74.69736 0 0.2883835 0 0 4095 1 
i 4.875915 20.33073 0.7171673 69 74.89862 0 0.2945416 0 0 4095 1 
i 4.93726 20.33073 0.7171673 70 74.99925 0 0.2976207 0 0 4095 1 
i 2.784594 20.99134 0.7171673 51 70.14088 0 0.1895731 0 0 4095 1 
i 3.091321 20.99134 0.7171673 49 70.64403 0 0.2049685 0 0 4095 1 
i 3.336703 20.99134 0.7171673 55 71.04654 0 0.2172848 0 0 4095 1 
i 3.520739 20.99134 0.7171673 58 71.34843 0 0.226522 0 0 4095 1 
i 1 21.50931 0.5378755 56 70.14893 0 0.1 0 0 4095 1 
i 6.353782 21.62557 0.7171673 79 78.65006 0 0.3687194 0 0 4095 1 
i 4.569188 22.19401 0.7171673 64 74.3948 0 0.2791463 0 0 4095 1 
i 2.784594 22.42493 0.7171673 52 70.14021 0 0.1895731 0 0 4095 1 
i 3.152666 22.42493 0.7171673 49 70.74398 0 0.2080476 0 0 4095 1 
i 3.398048 22.42493 0.7171673 55 71.1465 0 0.2203639 0 0 4095 1 
i 3.520739 22.42493 0.7171673 57 71.34776 0 0.226522 0 0 4095 1 
i 1 23.08984 0.5378755 54 70.14826 0 0.1 0 0 4095 1 
i 6.353782 23.13738 0.7171673 76 78.64939 0 0.3687194 0 0 4095 1 
i 4.569188 23.59955 0.7171673 63 74.39413 0 0.2791463 0 0 4095 1 
i 5.121297 23.59955 0.7171673 70 75.29979 0 0.3068579 0 0 4095 1 
i 2.784594 23.75775 0.7171673 51 70.13954 0 0.1895731 0 0 4095 1 
i 2.96863 23.75775 0.7171673 54 70.44143 0 0.1988104 0 0 4095 1 
i 3.091321 23.75775 0.7171673 52 70.64268 0 0.2049685 0 0 4095 1 
i 3.152666 23.75775 0.7171673 51 70.74331 0 0.2080476 0 0 4095 1 
i 3.336703 23.75775 0.7171673 54 71.0452 0 0.2172848 0 0 4095 1 
i 3.398048 23.75775 0.7171673 57 71.14583 0 0.2203639 0 0 4095 1 
i 3.520739 23.75775 0.7171673 58 71.34709 0 0.226522 0 0 4095 1 
i 3.704775 23.75775 0.7851789 58 71.64897 0 0.2357593 0 0 4095 1 
i 6.353782 24.54293 0.7171673 78 78.64872 0 0.3687194 0 0 4095 1 
i 6.537818 24.54293 0.7171673 78 78.95061 0 0.3779566 0 0 4095 1 
i 1 24.55927 0.5378755 56 70.14759 0 0.1 0 0 4095 1 
i 1.184036 24.55927 0.5378755 56 70.44948 0 0.1092372 0 0 4095 1 
i 4.569188 25.03938 0.7171673 64 74.39346 0 0.2791463 0 0 4095 1 
i 5.182642 25.03938 1.121637 70 75.39975 0 0.309937 0 0 4095 1 
i 6.353782 26.16101 0.7171673 79 78.64805 0 0.3687194 0 0 4095 1 
i 1 26.25091 0.5378755 56 70.14692 0 0.1 0 0 4095 1 
i 2.784594 26.25091 0.7171673 47 70.13887 0 0.1895731 0 0 4095 1 
i 4.569188 26.37799 0.7171673 64 74.39279 0 0.2791463 0 0 4095 1 
i 4.753224 26.37799 0.7171673 61 74.69468 0 0.2883835 0 0 4095 1 
i 5.121297 26.37799 0.7171673 69 75.29845 0 0.3068579 0 0 4095 1 
i 5.182642 26.37799 1.188567 70 75.39908 0 0.309937 0 0 4095 1 
i 6.353782 27.56656 0.7171673 81 78.64738 0 0.3687194 0 0 4095 1 
i 6.660509 27.56656 0.7171673 82 79.15052 0 0.3841148 0 0 4095 1 
i 1 27.72034 0.5378755 57 70.14625 0 0.1 0 0 4095 1 
i 1.306727 27.72034 0.5378755 59 70.64939 0 0.1153954 0 0 4095 1 
i 2.784594 27.72034 0.7171673 44 70.1382 0 0.1895731 0 0 4095 1 
i 3.827466 27.72034 0.7171673 54 71.84889 0 0.2419174 0 0 4095 1 
i 4.569188 27.91903 0.7171673 66 74.39212 0 0.2791463 0 0 4095 1 
i 5.305333 27.91903 0.7171673 70 75.59966 0 0.3160952 0 0 4095 1 
i 2.784594 28.27727 0.6107733 68 74.40017 0 0.1895731 0 0 4095 1 
i 8.138376 28.88804 0.7171673 90 82.9013 0 0.4582925 0 0 4095 1 
i 6.353782 29.00638 0.7171673 78 78.64671 0 0.3687194 0 0 4095 1 
i 6.721854 29.00638 0.7171673 82 79.25048 0 0.3871938 0 0 4095 1 
i 1 29.22561 0.5378755 56 70.14558 0 0.1 0 0 4095 1 
i 1.368072 29.22561 0.5378755 59 70.74935 0 0.1184745 0 0 4095 1 
i 2.784594 29.22561 0.7171673 43 70.13753 0 0.1895731 0 0 4095 1 
i 3.888811 29.22561 0.7171673 54 71.94885 0 0.2449965 0 0 4095 1 
i 4.569188 29.25764 0.7171673 67 74.39145 0 0.2791463 0 0 4095 1 
i 4.875915 29.25764 0.7171673 64 74.89459 0 0.2945416 0 0 4095 1 
i 5.121297 29.25764 0.7171673 67 75.29711 0 0.3068579 0 0 4095 1 
i 5.305333 29.25764 0.7171673 70 75.59899 0 0.3160952 0 0 4095 1 
i 2.784594 29.75309 0.5466072 68 74.3995 0 0.1895731 0 0 4095 1 
i 8.138376 30.29969 0.7171673 91 82.90063 0 0.4582925 0 0 4095 1 
i 6.353782 30.34499 0.7171673 82 78.64604 0 0.3687194 0 0 4095 1 
i 6.537818 30.34499 0.7171673 79 78.94792 0 0.3779566 0 0 4095 1 
i 6.660509 30.34499 0.7171673 81 79.14918 0 0.3841148 0 0 4095 1 
i 6.721854 30.34499 0.7171673 82 79.24981 0 0.3871938 0 0 4095 1 
i 1 30.62507 0.5378755 56 70.14491 0 0.1 0 0 4095 1 
i 1.184036 30.62507 0.5378755 56 70.44679 0 0.1092372 0 0 4095 1 
i 1.306727 30.62507 0.5378755 57 70.64805 0 0.1153954 0 0 4095 1 
i 1.368072 30.62507 0.5378755 60 70.74868 0 0.1184745 0 0 4095 1 
i 2.784594 30.62507 0.7171673 43 70.13686 0 0.1895731 0 0 4095 1 
i 2.96863 30.62507 0.7171673 43 70.43874 0 0.1988104 0 0 4095 1 
i 3.827466 30.62507 0.7171673 57 71.84755 0 0.2419174 0 0 4095 1 
i 3.888811 30.62507 0.7171673 54 71.94818 0 0.2449965 0 0 4095 1 
i 4.569188 30.6289 0.7171673 64 74.39078 0 0.2791463 0 0 4095 1 
i 4.93726 30.6289 0.7171673 64 74.99455 0 0.2976207 0 0 4095 1 
i 5.182642 30.6289 0.7171673 67 75.39706 0 0.309937 0 0 4095 1 
i 5.305333 30.6289 0.7171673 69 75.59832 0 0.3160952 0 0 4095 1 
i 2.784594 31.2649 0.5378755 69 74.39883 0 0.1895731 0 0 4095 1 
i 8.138376 31.74578 0.7171673 93 82.89996 0 0.4582925 0 0 4095 1 
i 4.569188 31.90377 0.7171673 66 74.3901 0 0.2791463 0 0 4095 1 
i 4.753224 31.90377 0.7171673 66 74.69199 0 0.2883835 0 0 4095 1 
i 4.875915 31.90377 0.7171673 64 74.89325 0 0.2945416 0 0 4095 1 
i 4.93726 31.90377 0.7171673 63 74.99388 0 0.2976207 0 0 4095 1 
i 5.121297 31.90377 0.7171673 70 75.29577 0 0.3068579 0 0 4095 1 
i 5.182642 31.90377 0.7171673 69 75.39639 0 0.309937 0 0 4095 1 
i 5.305333 31.90377 0.7171673 70 75.59765 0 0.3160952 0 0 4095 1 
i 5.489369 31.90377 0.7171673 75 75.89954 0 0.3253324 0 0 4095 1 
i 6.353782 32.20828 0.7171673 76 78.64537 0 0.3687194 0 0 4095 1 
i 2.784594 32.23615 0.7171673 44 70.13618 0 0.1895731 0 0 4095 1 
i 4.011502 32.23615 0.7171673 54 72.14876 0 0.2511547 0 0 4095 1 
i 1 32.57305 0.5378755 54 70.14423 0 0.1 0 0 4095 1 
i 2.784594 32.67045 0.5378755 71 74.39816 0 0.1895731 0 0 4095 1 
i 2.96863 32.67045 0.5378755 71 74.70004 0 0.1988104 0 0 4095 1 
i 8.138376 33.09021 0.7171673 94 82.89929 0 0.4582925 0 0 4095 1 
i 8.322412 33.09021 0.7171673 94 83.20117 0 0.4675297 0 0 4095 1 
i 6.353782 33.61382 0.7171673 78 78.6447 0 0.3687194 0 0 4095 1 
i 6.905891 33.61382 0.7171673 82 79.55036 0 0.3964311 0 0 4095 1 
i 2.784594 33.63561 0.7171673 44 70.13551 0 0.1895731 0 0 4095 1 
i 3.091321 33.63561 0.7171673 43 70.63866 0 0.2049685 0 0 4095 1 
i 3.827466 33.63561 0.7171673 54 71.84621 0 0.2419174 0 0 4095 1 
i 4.011502 33.63561 0.7171673 59 72.14809 0 0.2511547 0 0 4095 1 
i 1 34.04248 0.5378755 56 70.14356 0 0.1 0 0 4095 1 
i 1.552109 34.04248 0.5378755 63 71.04922 0 0.1277117 0 0 4095 1 
i 2.784594 34.28853 0.5378755 68 74.39748 0 0.1895731 0 0 4095 1 
i 4.569188 34.28853 0.7171673 62 74.38943 0 0.2791463 0 0 4095 1 
i 8.138376 34.63795 0.7171673 91 82.89862 0 0.4582925 0 0 4095 1 
i 6.353782 35.05364 0.7171673 76 78.64403 0 0.3687194 0 0 4095 1 
i 6.967236 35.05364 0.7171673 87 79.65031 0 0.3995101 0 0 4095 1 
i 2.784594 35.0692 0.7171673 43 70.13484 0 0.1895731 0 0 4095 1 
i 3.152666 35.0692 0.7171673 43 70.73862 0 0.2080476 0 0 4095 1 
i 3.888811 35.0692 0.7171673 54 71.94616 0 0.2449965 0 0 4095 1 
i 4.011502 35.0692 0.7171673 57 72.14742 0 0.2511547 0 0 4095 1 
i 1 35.54775 0.5378755 53 70.14289 0 0.1 0 0 4095 1 
i 1.613454 35.54775 0.5378755 63 71.14918 0 0.1307908 0 0 4095 1 
i 2.784594 35.69408 0.5378755 69 74.39681 0 0.1895731 0 0 4095 1 
i 3.091321 35.69408 0.5378755 75 74.89996 0 0.2049685 0 0 4095 1 
i 4.569188 35.69408 0.7171673 56 74.38876 0 0.2791463 0 0 4095 1 
i 5.61206 35.69408 0.7171673 71 76.09945 0 0.3314906 0 0 4095 1 
i 8.138376 35.98238 0.7171673 93 82.89795 0 0.4582925 0 0 4095 1 
i 8.445103 35.98238 0.7171673 99 83.40109 0 0.4736879 0 0 4095 1 
i 6.353782 36.39225 0.7171673 76 78.64335 0 0.3687194 0 0 4095 1 
i 6.537818 36.39225 0.7171673 76 78.94524 0 0.3779566 0 0 4095 1 
i 6.905891 36.39225 0.7171673 81 79.54901 0 0.3964311 0 0 4095 1 
i 6.967236 36.39225 0.7171673 87 79.64964 0 0.3995101 0 0 4095 1 
i 2.784594 36.40202 0.7171673 44 70.13417 0 0.1895731 0 0 4095 1 
i 2.96863 36.40202 0.7171673 44 70.43606 0 0.1988104 0 0 4095 1 
i 3.091321 36.40202 0.7171673 43 70.63732 0 0.2049685 0 0 4095 1 
i 3.152666 36.40202 0.7171673 40 70.73795 0 0.2080476 0 0 4095 1 
i 3.827466 36.40202 0.7171673 54 71.84486 0 0.2419174 0 0 4095 1 
i 3.888811 36.40202 0.7171673 56 71.94549 0 0.2449965 0 0 4095 1 
i 4.011502 36.40202 0.7171673 59 72.14675 0 0.2511547 0 0 4095 1 
i 4.195539 36.40202 0.7171673 59 72.44864 0 0.2603919 0 0 4095 1 
i 1 36.94721 0.5378755 54 70.14222 0 0.1 0 0 4095 1 
i 1.184036 36.94721 0.5378755 54 70.44411 0 0.1092372 0 0 4095 1 
i 1.552109 36.94721 0.5378755 62 71.04788 0 0.1277117 0 0 4095 1 
i 1.613454 36.94721 0.5378755 60 71.14851 0 0.1307908 0 0 4095 1 
i 2.784594 37.1339 0.5378755 71 74.39614 0 0.1895731 0 0 4095 1 
i 3.152666 37.1339 0.5378755 75 74.99992 0 0.2080476 0 0 4095 1 
i 4.569188 37.1339 0.7171673 58 74.38809 0 0.2791463 0 0 4095 1 
i 5.673405 37.1339 0.7171673 71 76.19941 0 0.3345696 0 0 4095 1 
i 8.138376 37.3596 0.7171673 94 82.89727 0 0.4582925 0 0 4095 1 
i 8.506448 37.3596 0.7171673 99 83.50105 0 0.476767 0 0 4095 1 
i 6.353782 37.93329 0.7171673 78 78.64268 0 0.3687194 0 0 4095 1 
i 7.089927 37.93329 0.7171673 87 79.85023 0 0.4056683 0 0 4095 1 
i 2.784594 38.25724 0.7171673 46 70.1335 0 0.1895731 0 0 4095 1 
i 4.256884 38.25724 0.9324422 54 72.5486 0 0.263471 0 0 4095 1 
i 4.569188 38.29153 0.5378755 83 78.65073 0 0.2791463 0 0 4095 1 
i 2.784594 38.47251 0.5378755 72 74.39547 0 0.1895731 0 0 4095 1 
i 2.96863 38.47251 0.5378755 68 74.69736 0 0.1988104 0 0 4095 1 
i 3.091321 38.47251 0.5378755 74 74.89862 0 0.2049685 0 0 4095 1 
i 3.152666 38.47251 0.5378755 75 74.99925 0 0.2080476 0 0 4095 1 
i 4.569188 38.47251 0.7171673 59 74.38742 0 0.2791463 0 0 4095 1 
i 5.61206 38.47251 0.7171673 69 76.09811 0 0.3314906 0 0 4095 1 
i 5.673405 38.47251 0.7171673 71 76.19874 0 0.3345696 0 0 4095 1 
i 1 38.55829 0.5378755 56 70.14155 0 0.1 0 0 4095 1 
i 1.736145 38.55829 0.5378755 63 71.3491 0 0.1369489 0 0 4095 1 
i 8.138376 38.64001 0.7171673 94 82.8966 0 0.4582925 0 0 4095 1 
i 8.322412 38.64001 0.7171673 94 83.19849 0 0.4675297 0 0 4095 1 
i 8.445103 38.64001 0.7171673 97 83.39975 0 0.4736879 0 0 4095 1 
i 8.506448 38.64001 0.7171673 99 83.50038 0 0.476767 0 0 4095 1 
i 6.353782 39.2719 0.7171673 82 78.64201 0 0.3687194 0 0 4095 1 
i 6.660509 39.2719 0.7171673 76 79.14516 0 0.3841148 0 0 4095 1 
i 6.905891 39.2719 0.7171673 82 79.54767 0 0.3964311 0 0 4095 1 
i 7.089927 39.2719 0.7171673 87 79.84956 0 0.4056683 0 0 4095 1 
i 2.784594 39.65669 0.7171673 47 70.13283 0 0.1895731 0 0 4095 1 
i 3.336703 39.65669 0.7171673 43 71.03849 0 0.2172848 0 0 4095 1 
i 3.827466 39.65669 0.7171673 53 71.84352 0 0.2419174 0 0 4095 1 
i 4.256884 39.65669 0.7171673 59 72.54792 0 0.263471 0 0 4095 1 
i 4.569188 39.76735 0.5378755 80 78.65006 0 0.2791463 0 0 4095 1 
i 1 39.95775 0.5378755 56 70.14088 0 0.1 0 0 4095 1 
i 1.306727 39.95775 0.5378755 54 70.64403 0 0.1153954 0 0 4095 1 
i 1.552109 39.95775 0.5378755 56 71.04654 0 0.1277117 0 0 4095 1 
i 1.736145 39.95775 0.5378755 63 71.34843 0 0.1369489 0 0 4095 1 
i 4.569188 40.01355 0.7171673 56 74.38675 0 0.2791463 0 0 4095 1 
i 5.796096 40.01355 0.7171673 71 76.39933 0 0.3407278 0 0 4095 1 
i 2.784594 40.33579 0.5378755 69 74.3948 0 0.1895731 0 0 4095 1 
i 8.138376 40.42228 0.7171673 93 82.89593 0 0.4582925 0 0 4095 1 
i 6.353782 40.64316 0.7171673 81 78.64134 0 0.3687194 0 0 4095 1 
i 6.721854 40.64316 0.7171673 76 79.24512 0 0.3871938 0 0 4095 1 
i 6.967236 40.64316 0.7171673 82 79.64763 0 0.3995101 0 0 4095 1 
i 7.089927 40.64316 0.7171673 85 79.84889 0 0.4056683 0 0 4095 1 
i 2.784594 40.82946 0.5378755 51 70.1496 0 0.1895731 0 0 4095 1 
i 2.784594 41.09029 0.7171673 44 70.13216 0 0.1895731 0 0 4095 1 
i 3.398048 41.09029 0.7171673 43 71.13845 0 0.2203639 0 0 4095 1 
i 3.888811 41.09029 0.7171673 48 71.94348 0 0.2449965 0 0 4095 1 
i 4.256884 41.09029 0.9790413 57 72.54725 0 0.263471 0 0 4095 1 
i 4.569188 41.27917 0.5378755 81 78.64939 0 0.2791463 0 0 4095 1 
i 4.569188 41.35216 0.7171673 56 74.38608 0 0.2791463 0 0 4095 1 
i 5.61206 41.35216 0.7171673 66 76.09677 0 0.3314906 0 0 4095 1 
i 5.796096 41.35216 0.7171673 71 76.39866 0 0.3407278 0 0 4095 1 
i 1 41.39134 0.5378755 57 70.14021 0 0.1 0 0 4095 1 
i 1.368072 41.39134 0.5378755 54 70.74398 0 0.1184745 0 0 4095 1 
i 1.613454 41.39134 0.5378755 56 71.1465 0 0.1307908 0 0 4095 1 
i 1.736145 41.39134 0.5378755 62 71.34776 0 0.1369489 0 0 4095 1 
i 2.784594 41.74134 0.5378755 68 74.39413 0 0.1895731 0 0 4095 1 
i 3.336703 41.74134 0.5378755 75 75.29979 0 0.2172848 0 0 4095 1 
i 8.138376 41.76672 0.7171673 90 82.89526 0 0.4582925 0 0 4095 1 
i 8.690484 41.76672 0.7171673 99 83.80092 0 0.4860042 0 0 4095 1 
i 6.353782 41.91803 0.7171673 82 78.64067 0 0.3687194 0 0 4095 1 
i 6.537818 41.91803 0.7171673 82 78.94256 0 0.3779566 0 0 4095 1 
i 6.660509 41.91803 0.7171673 81 79.14382 0 0.3841148 0 0 4095 1 
i 6.721854 41.91803 0.7171673 78 79.24444 0 0.3871938 0 0 4095 1 
i 6.905891 41.91803 0.7171673 87 79.54633 0 0.3964311 0 0 4095 1 
i 6.967236 41.91803 0.7171673 81 79.64696 0 0.3995101 0 0 4095 1 
i 7.089927 41.91803 0.7171673 87 79.84822 0 0.4056683 0 0 4095 1 
i 7.273963 41.91803 0.7171673 87 80.1501 0 0.4149055 0 0 4095 1 
i 2.784594 42.37236 0.5378755 44 70.14893 0 0.1895731 0 0 4095 1 
i 2.784594 42.4231 0.7171673 50 70.13149 0 0.1895731 0 0 4095 1 
i 2.96863 42.4231 0.7171673 50 70.43338 0 0.1988104 0 0 4095 1 
i 3.336703 42.4231 0.7171673 43 71.03715 0 0.2172848 0 0 4095 1 
i 3.398048 42.4231 0.7171673 40 71.13778 0 0.2203639 0 0 4095 1 
i 3.827466 42.4231 0.7171673 53 71.84218 0 0.2419174 0 0 4095 1 
i 3.888811 42.4231 0.7171673 50 71.94281 0 0.2449965 0 0 4095 1 
i 4.256884 42.4231 0.7171673 59 72.54658 0 0.263471 0 0 4095 1 
i 4.44092 42.4231 1.017485 59 72.84847 0 0.2727082 0 0 4095 1 
i 4.569188 42.68471 0.5378755 87 78.64872 0 0.2791463 0 0 4095 1 
i 4.753224 42.68471 0.5378755 87 78.95061 0 0.2883835 0 0 4095 1 
i 4.93726 42.72342 0.7171673 55 74.98918 0 0.2976207 0 0 4095 1 
i 5.673405 42.72342 0.7171673 66 76.19673 0 0.3345696 0 0 4095 1 
i 5.796096 42.72342 0.7171673 69 76.39799 0 0.3407278 0 0 4095 1 
i 1 42.72416 0.5378755 59 70.13954 0 0.1 0 0 4095 1 
i 1.184036 42.72416 0.5378755 59 70.44143 0 0.1092372 0 0 4095 1 
i 1.306727 42.72416 0.5378755 57 70.64268 0 0.1153954 0 0 4095 1 
i 1.368072 42.72416 0.5378755 56 70.74331 0 0.1184745 0 0 4095 1 
i 1.552109 42.72416 0.5378755 63 71.0452 0 0.1277117 0 0 4095 1 
i 1.613454 42.72416 0.5378755 62 71.14583 0 0.1307908 0 0 4095 1 
i 1.736145 42.72416 0.5378755 63 71.34709 0 0.1369489 0 0 4095 1 
i 1.920181 42.72416 0.5378755 63 71.64897 0 0.1461861 0 0 4095 1 
i 8.138376 43.14394 0.7171673 93 82.89459 0 0.4582925 0 0 4095 1 
i 8.75183 43.14394 0.7171673 99 83.90088 0 0.4890833 0 0 4095 1 
i 2.784594 43.18116 0.5378755 69 74.39346 0 0.1895731 0 0 4095 1 
i 3.398048 43.18116 0.7717332 75 75.39975 0 0.2203639 0 0 4095 1 
i 2.784594 43.95289 0.7217411 45 70.14826 0 0.1895731 0 0 4095 1 
i 3.520739 43.95747 0.7171673 43 71.33836 0 0.226522 0 0 4095 1 
i 4.011502 43.95747 0.7171673 48 72.1434 0 0.2511547 0 0 4095 1 
i 4.256884 43.95747 0.7579888 54 72.54591 0 0.263471 0 0 4095 1 
i 4.569188 43.99829 0.7171673 56 74.38474 0 0.2791463 0 0 4095 1 
i 4.753224 43.99829 0.7171673 56 74.68662 0 0.2883835 0 0 4095 1 
i 4.875915 43.99829 0.7171673 55 74.88788 0 0.2945416 0 0 4095 1 
i 5.61206 43.99829 0.7171673 71 76.09543 0 0.3314906 0 0 4095 1 
i 5.673405 43.99829 0.7171673 68 76.19606 0 0.3345696 0 0 4095 1 
i 5.796096 43.99829 0.7171673 71 76.39732 0 0.3407278 0 0 4095 1 
i 5.980132 43.99829 0.7171673 74 76.6992 0 0.349965 0 0 4095 1 
i 4.569188 44.3028 0.5378755 84 78.64805 0 0.2791463 0 0 4095 1 
i 6.353782 44.3028 0.7171673 74 78.64 0 0.3687194 0 0 4095 1 
i 8.138376 44.42435 0.7171673 93 82.89392 0 0.4582925 0 0 4095 1 
i 8.322412 44.42435 0.7171673 93 83.19581 0 0.4675297 0 0 4095 1 
i 8.690484 44.42435 0.7171673 97 83.79958 0 0.4860042 0 0 4095 1 
i 8.75183 44.42435 0.7171673 99 83.90021 0 0.4890833 0 0 4095 1 
i 2.784594 44.51977 0.5378755 69 74.39279 0 0.1895731 0 0 4095 1 
i 2.96863 44.51977 0.5378755 69 74.69468 0 0.1988104 0 0 4095 1 
i 3.336703 44.51977 0.5378755 74 75.29845 0 0.2172848 0 0 4095 1 
i 3.398048 44.51977 0.6975485 75 75.39908 0 0.2203639 0 0 4095 1 
i 1 45.21732 0.5378755 52 70.13887 0 0.1 0 0 4095 1 
i 2.784594 45.29028 0.7171673 44 70.13015 0 0.1895731 0 0 4095 1 
i 3.091321 45.29028 0.7171673 50 70.63329 0 0.2049685 0 0 4095 1 
i 3.336703 45.29028 0.7171673 44 71.03581 0 0.2172848 0 0 4095 1 
i 3.520739 45.29028 0.7171673 40 71.33769 0 0.226522 0 0 4095 1 
i 3.827466 45.29028 0.7171673 54 71.84084 0 0.2419174 0 0 4095 1 
i 4.011502 45.29028 0.7171673 50 72.14273 0 0.2511547 0 0 4095 1 
i 4.256884 45.29028 0.7171673 56 72.54524 0 0.263471 0 0 4095 1 
i 4.563611 45.29028 0.7171673 59 73.04839 0 0.2788663 0 0 4095 1 
i 2.784594 45.42232 0.5378755 56 70.14759 0 0.1895731 0 0 4095 1 
i 2.96863 45.42232 0.5378755 56 70.44948 0 0.1988104 0 0 4095 1 
i 4.569188 45.70834 0.5378755 86 78.64738 0 0.2791463 0 0 4095 1 
i 4.875915 45.70834 0.5378755 87 79.15052 0 0.2945416 0 0 4095 1 
i 6.353782 45.70834 0.7171673 73 78.63933 0 0.3687194 0 0 4095 1 
i 7.396654 45.70834 0.7171673 83 80.35002 0 0.4210637 0 0 4095 1 
i 4.569188 45.77284 0.7171673 62 74.38407 0 0.2791463 0 0 4095 1 
i 6.041478 45.77284 0.7171673 71 76.79916 0 0.3530441 0 0 4095 1 
i 8.138376 45.89838 0.7171673 94 82.89325 0 0.4582925 0 0 4095 1 
i 8.874521 45.89838 0.7171673 99 84.1008 0 0.4952414 0 0 4095 1 
i 2.784594 46.06081 0.5378755 71 74.39212 0 0.1895731 0 0 4095 1 
i 3.520739 46.06081 0.5378755 75 75.59966 0 0.226522 0 0 4095 1 
i 6.353782 46.24105 0.5378755 99 82.9013 0 0.3687194 0 0 4095 1 
i 2.784594 46.65561 0.7171673 46 70.12948 0 0.1895731 0 0 4095 1 
i 3.152666 46.65561 0.7171673 50 70.73325 0 0.2080476 0 0 4095 1 
i 3.398048 46.65561 0.7171673 44 71.13577 0 0.2203639 0 0 4095 1 
i 3.520739 46.65561 0.7171673 43 71.33702 0 0.226522 0 0 4095 1 
i 3.888811 46.65561 0.7171673 54 71.9408 0 0.2449965 0 0 4095 1 
i 4.011502 46.65561 0.7171673 53 72.14205 0 0.2511547 0 0 4095 1 
i 4.256884 46.65561 0.7171673 54 72.54457 0 0.263471 0 0 4095 1 
i 4.624956 46.65561 0.7171673 59 73.14834 0 0.2819454 0 0 4095 1 
i 1 46.68675 0.5378755 49 70.1382 0 0.1 0 0 4095 1 
i 2.042872 46.68675 0.5378755 64 71.84889 0 0.1523443 0 0 4095 1 
i 4.569188 47.11145 0.7171673 62 74.3834 0 0.2791463 0 0 4095 1 
i 5.121297 47.11145 0.7171673 55 75.28906 0 0.3068579 0 0 4095 1 
i 5.61206 47.11145 0.7171673 65 76.09409 0 0.3314906 0 0 4095 1 
i 6.041478 47.11145 0.7171673 71 76.79849 0 0.3530441 0 0 4095 1 
i 2.784594 47.11396 0.5378755 39 70.14692 0 0.1895731 0 0 4095 1 
i 4.569188 47.14816 0.5378755 87 78.64671 0 0.2791463 0 0 4095 1 
i 4.93726 47.14816 0.5378755 87 79.25048 0 0.2976207 0 0 4095 1 
i 6.353782 47.14816 0.7171673 74 78.63866 0 0.3687194 0 0 4095 1 
i 7.457999 47.14816 0.7171673 86 80.44998 0 0.4241428 0 0 4095 1 
i 8.138376 47.1788 0.7171673 94 82.89258 0 0.4582925 0 0 4095 1 
i 8.445103 47.1788 0.7171673 93 83.39572 0 0.4736879 0 0 4095 1 
i 8.690484 47.1788 0.7171673 99 83.79824 0 0.4860042 0 0 4095 1 
i 8.874521 47.1788 0.7171673 99 84.10013 0 0.4952414 0 0 4095 1 
i 2.784594 47.39942 0.5378755 72 74.39145 0 0.1895731 0 0 4095 1 
i 3.091321 47.39942 0.5378755 69 74.89459 0 0.2049685 0 0 4095 1 
i 3.336703 47.39942 0.5378755 72 75.29711 0 0.2172848 0 0 4095 1 
i 3.520739 47.39942 0.5378755 75 75.59899 0 0.226522 0 0 4095 1 
i 6.353782 47.6527 0.5378755 96 82.90063 0 0.3687194 0 0 4095 1 
i 2.784594 47.92496 0.7171673 47 70.12881 0 0.1895731 0 0 4095 1 
i 2.96863 47.92496 0.7171673 47 70.43069 0 0.1988104 0 0 4095 1 
i 3.091321 47.92496 0.7171673 44 70.63195 0 0.2049685 0 0 4095 1 
i 3.152666 47.92496 0.7171673 50 70.73258 0 0.2080476 0 0 4095 1 
i 3.336703 47.92496 0.7171673 43 71.03447 0 0.2172848 0 0 4095 1 
i 3.398048 47.92496 0.7171673 44 71.13509 0 0.2203639 0 0 4095 1 
i 3.520739 47.92496 0.7171673 43 71.33635 0 0.226522 0 0 4095 1 
i 3.704775 47.92496 0.7171673 38 71.63824 0 0.2357593 0 0 4095 1 
i 3.827466 47.92496 0.7171673 53 71.8395 0 0.2419174 0 0 4095 1 
i 3.888811 47.92496 0.7171673 54 71.94013 0 0.2449965 0 0 4095 1 
i 4.011502 47.92496 0.7171673 53 72.14138 0 0.2511547 0 0 4095 1 
i 4.195539 47.92496 0.7171673 48 72.44327 0 0.2603919 0 0 4095 1 
i 4.256884 47.92496 0.7171673 54 72.5439 0 0.263471 0 0 4095 1 
i 4.44092 47.92496 0.7171673 54 72.84579 0 0.2727082 0 0 4095 1 
i 4.563611 47.92496 0.7171673 57 73.04704 0 0.2788663 0 0 4095 1 
i 4.624956 47.92496 0.7171673 59 73.14767 0 0.2819454 0 0 4095 1 
i 1 48.19202 0.5378755 51 70.13753 0 0.1 0 0 4095 1 
i 2.104217 48.19202 0.5378755 64 71.94885 0 0.1554234 0 0 4095 1 
i 4.569188 48.23323 0.5378755 63 74.40017 0 0.2791463 0 0 4095 1 
i 4.569188 48.48272 0.7171673 61 74.38273 0 0.2791463 0 0 4095 1 
i 5.182642 48.48272 0.7171673 55 75.38901 0 0.309937 0 0 4095 1 
i 5.673405 48.48272 0.7171673 65 76.19405 0 0.3345696 0 0 4095 1 
i 6.041478 48.48272 0.7212262 69 76.79782 0 0.3530441 0 0 4095 1 
i 4.569188 48.48677 0.5378755 87 78.64604 0 0.2791463 0 0 4095 1 
i 4.753224 48.48677 0.5378755 84 78.94792 0 0.2883835 0 0 4095 1 
i 4.875915 48.48677 0.5378755 86 79.14918 0 0.2945416 0 0 4095 1 
i 4.93726 48.48677 0.5378755 87 79.24981 0 0.2976207 0 0 4095 1 
i 6.353782 48.48677 0.7171673 74 78.63799 0 0.3687194 0 0 4095 1 
i 7.396654 48.48677 0.7171673 81 80.34868 0 0.4210637 0 0 4095 1 
i 7.457999 48.48677 0.7171673 87 80.44931 0 0.4241428 0 0 4095 1 
i 8.138376 48.49044 0.7171673 93 82.89191 0 0.4582925 0 0 4095 1 
i 8.506448 48.49044 0.7171673 93 83.49568 0 0.476767 0 0 4095 1 
i 8.75183 48.49044 0.7171673 99 83.8982 0 0.4890833 0 0 4095 1 
i 8.874521 48.49044 0.7171673 100 84.09945 0 0.4952414 0 0 4095 1 
i 2.784594 48.58339 0.5378755 53 70.14625 0 0.1895731 0 0 4095 1 
i 3.091321 48.58339 0.5378755 59 70.64939 0 0.2049685 0 0 4095 1 
i 2.784594 48.77068 0.5378755 69 74.39078 0 0.1895731 0 0 4095 1 
i 3.152666 48.77068 0.5378755 69 74.99455 0 0.2080476 0 0 4095 1 
i 3.398048 48.77068 0.5378755 75 75.39706 0 0.2203639 0 0 4095 1 
i 3.520739 48.77068 0.5378755 78 75.59832 0 0.226522 0 0 4095 1 
i 6.353782 49.09879 0.5378755 98 82.89996 0 0.3687194 0 0 4095 1 
i 1 49.59148 0.5378755 48 70.13686 0 0.1 0 0 4095 1 
i 1.184036 49.59148 0.5378755 48 70.43874 0 0.1092372 0 0 4095 1 
i 2.042872 49.59148 0.5378755 62 71.84755 0 0.1523443 0 0 4095 1 
i 2.104217 49.59148 0.5378755 64 71.94818 0 0.1554234 0 0 4095 1 
i 4.569188 49.70905 0.5378755 56 74.3995 0 0.2791463 0 0 4095 1 
i 8.138376 49.70988 0.7171673 94 82.89124 0 0.4582925 0 0 4095 1 
i 8.322412 49.70988 0.7171673 99 83.19312 0 0.4675297 0 0 4095 1 
i 8.445103 49.70988 0.7171673 93 83.39438 0 0.4736879 0 0 4095 1 
i 8.506448 49.70988 0.7171673 94 83.49501 0 0.476767 0 0 4095 1 
i 8.690484 49.70988 0.7171673 99 83.7969 0 0.4860042 0 0 4095 1 
i 8.75183 49.70988 0.7171673 96 83.89753 0 0.4890833 0 0 4095 1 
i 8.874521 49.70988 0.7171673 99 84.09878 0 0.4952414 0 0 4095 1 
i 9.058557 49.70988 0.7171673 102 84.40067 0 0.5044787 0 0 4095 1 
i 4.569188 49.75758 0.7171673 62 74.38205 0 0.2791463 0 0 4095 1 
i 4.753224 49.75758 0.7171673 62 74.68394 0 0.2883835 0 0 4095 1 
i 5.121297 49.75758 0.7171673 55 75.28771 0 0.3068579 0 0 4095 1 
i 5.182642 49.75758 0.7171673 56 75.38834 0 0.309937 0 0 4095 1 
i 5.61206 49.75758 0.7171673 65 76.09275 0 0.3314906 0 0 4095 1 
i 5.673405 49.75758 0.7171673 66 76.19338 0 0.3345696 0 0 4095 1 
i 6.041478 49.75758 0.7171673 71 76.79715 0 0.3530441 0 0 4095 1 
i 6.225514 49.75758 0.9873939 74 77.09904 0 0.3622813 0 0 4095 1 
i 7.58069 50.02781 0.7171673 86 80.6499 0 0.4303009 0 0 4095 1 
i 2.784594 50.04555 0.5378755 75 74.3901 0 0.1895731 0 0 4095 1 
i 2.96863 50.04555 0.5378755 75 74.69199 0 0.1988104 0 0 4095 1 
i 3.091321 50.04555 0.5378755 69 74.89325 0 0.2049685 0 0 4095 1 
i 3.152666 50.04555 0.5378755 71 74.99388 0 0.2080476 0 0 4095 1 
i 3.336703 50.04555 0.5378755 75 75.29577 0 0.2172848 0 0 4095 1 
i 3.398048 50.04555 0.5378755 74 75.39639 0 0.2203639 0 0 4095 1 
i 3.520739 50.04555 0.5378755 75 75.59765 0 0.226522 0 0 4095 1 
i 3.704775 50.04555 0.5378755 75 75.89954 0 0.2357593 0 0 4095 1 
i 2.784594 50.08866 0.5378755 44 70.14558 0 0.1895731 0 0 4095 1 
i 3.152666 50.08866 0.5378755 44 70.74935 0 0.2080476 0 0 4095 1 
i 4.569188 50.35006 0.5378755 81 78.64537 0 0.2791463 0 0 4095 1 
i 6.353782 50.44322 0.5378755 99 82.89929 0 0.3687194 0 0 4095 1 
i 6.537818 50.44322 0.7593431 99 83.20117 0 0.3779566 0 0 4095 1 
i 1 51.20256 0.5378755 49 70.13618 0 0.1 0 0 4095 1 
i 2.226908 51.20256 0.5378755 64 72.14876 0 0.1615815 0 0 4095 1 
i 4.569188 51.22086 0.5378755 62 74.39883 0 0.2791463 0 0 4095 1 
i 4.569188 51.22524 0.7171673 62 74.38138 0 0.2791463 0 0 4095 1 
i 5.305333 51.22524 0.7171673 55 75.58893 0 0.3160952 0 0 4095 1 
i 5.796096 51.22524 0.7171673 65 76.39396 0 0.3407278 0 0 4095 1 
i 6.041478 51.22524 0.7171673 71 76.79648 0 0.3530441 0 0 4095 1 
i 6.353782 51.36642 0.7171673 73 78.63665 0 0.3687194 0 0 4095 1 
i 6.660509 51.36642 0.7171673 71 79.13979 0 0.3841148 0 0 4095 1 
i 7.396654 51.36642 0.7171673 83 80.34734 0 0.4210637 0 0 4095 1 
i 7.58069 51.36642 0.7171673 87 80.64922 0 0.4303009 0 0 4095 1 
i 2.784594 51.48812 0.5378755 39 70.14491 0 0.1895731 0 0 4095 1 
i 2.96863 51.48812 0.5378755 39 70.44679 0 0.1988104 0 0 4095 1 
i 3.091321 51.48812 0.5378755 38 70.64805 0 0.2049685 0 0 4095 1 
i 3.152666 51.48812 0.5378755 36 70.74868 0 0.2080476 0 0 4095 1 
i 4.569188 51.7556 0.5378755 83 78.6447 0 0.2791463 0 0 4095 1 
i 5.121297 51.7556 0.5378755 87 79.55036 0 0.3068579 0 0 4095 1 
i 6.353782 51.99096 0.5378755 99 82.89862 0 0.3687194 0 0 4095 1 
i 8.138376 51.99096 0.7171673 86 82.89057 0 0.4582925 0 0 4095 1 
i 2.784594 52.43031 0.5378755 67 74.38943 0 0.1895731 0 0 4095 1 
i 4.569188 52.50011 0.7171673 61 74.38071 0 0.2791463 0 0 4095 1 
i 4.875915 52.50011 0.7171673 62 74.88386 0 0.2945416 0 0 4095 1 
i 5.121297 52.50011 0.7171673 56 75.28637 0 0.3068579 0 0 4095 1 
i 5.305333 52.50011 0.7171673 56 75.58826 0 0.3160952 0 0 4095 1 
i 5.61206 52.50011 0.7171673 66 76.0914 0 0.3314906 0 0 4095 1 
i 5.796096 52.50011 0.7171673 66 76.39329 0 0.3407278 0 0 4095 1 
i 6.041478 52.50011 0.9547448 68 76.79581 0 0.3530441 0 0 4095 1 
i 6.348205 52.50011 0.7171673 74 77.29895 0 0.3684395 0 0 4095 1 
i 1 52.60202 0.5378755 49 70.13551 0 0.1 0 0 4095 1 
i 1.306727 52.60202 0.5378755 48 70.63866 0 0.1153954 0 0 4095 1 
i 2.042872 52.60202 0.5378755 59 71.84621 0 0.1523443 0 0 4095 1 
i 2.226908 52.60202 0.5378755 64 72.14809 0 0.1615815 0 0 4095 1 
i 4.569188 52.6264 0.5378755 68 74.39816 0 0.2791463 0 0 4095 1 
i 4.753224 52.6264 0.5378755 71 74.70004 0 0.2883835 0 0 4095 1 
i 6.353782 52.73768 0.7171673 74 78.63597 0 0.3687194 0 0 4095 1 
i 7.457999 52.73768 0.7171673 83 80.4473 0 0.4241428 0 0 4095 1 
i 7.58069 52.73768 0.7171673 84 80.64855 0 0.4303009 0 0 4095 1 
i 4.569188 53.19542 0.5378755 86 78.64403 0 0.2791463 0 0 4095 1 
i 5.182642 53.19542 0.5378755 87 79.65031 0 0.309937 0 0 4095 1 
i 6.353782 53.33539 0.5378755 98 82.89795 0 0.3687194 0 0 4095 1 
i 6.660509 53.33539 0.5378755 99 83.40109 0 0.3841148 0 0 4095 1 
i 8.138376 53.33539 0.7171673 88 82.8899 0 0.4582925 0 0 4095 1 
i 9.181248 53.33539 0.7171673 98 84.60059 0 0.5106368 0 0 4095 1 
i 2.784594 53.4361 0.5378755 50 70.14423 0 0.1895731 0 0 4095 1 
i 4.569188 53.80607 0.7171673 62 74.38004 0 0.2791463 0 0 4095 1 
i 4.93726 53.80607 0.7171673 62 74.98382 0 0.2976207 0 0 4095 1 
i 5.182642 53.80607 0.7171673 56 75.38633 0 0.309937 0 0 4095 1 
i 5.305333 53.80607 0.7171673 55 75.58759 0 0.3160952 0 0 4095 1 
i 5.673405 53.80607 0.7171673 66 76.19136 0 0.3345696 0 0 4095 1 
i 5.796096 53.80607 0.7171673 65 76.39262 0 0.3407278 0 0 4095 1 
i 6.041478 53.80607 0.7171673 71 76.79514 0 0.3530441 0 0 4095 1 
i 6.40955 53.80607 0.9236505 74 77.39891 0 0.3715185 0 0 4095 1 
i 2.784594 53.83586 0.5378755 66 74.38876 0 0.1895731 0 0 4095 1 
i 3.827466 53.83586 0.5378755 76 76.09945 0 0.2419174 0 0 4095 1 
i 6.353782 54.01255 0.7171673 73 78.6353 0 0.3687194 0 0 4095 1 
i 6.660509 54.01255 0.7171673 70 79.13845 0 0.3841148 0 0 4095 1 
i 6.721854 54.01255 0.7171673 68 79.23908 0 0.3871938 0 0 4095 1 
i 7.396654 54.01255 0.7171673 86 80.346 0 0.4210637 0 0 4095 1 
i 7.457999 54.01255 0.7171673 80 80.44662 0 0.4241428 0 0 4095 1 
i 7.58069 54.01255 0.7171673 86 80.64788 0 0.4303009 0 0 4095 1 
i 7.764726 54.01255 0.7171673 86 80.94977 0 0.4395381 0 0 4095 1 
i 1 54.03561 0.5378755 48 70.13484 0 0.1 0 0 4095 1 
i 1.368072 54.03561 0.5378755 43 70.73862 0 0.1184745 0 0 4095 1 
i 2.104217 54.03561 0.5378755 59 71.94616 0 0.1554234 0 0 4095 1 
i 2.226908 54.03561 0.5378755 62 72.14742 0 0.1615815 0 0 4095 1 
i 4.569188 54.24449 0.5378755 56 74.39748 0 0.2791463 0 0 4095 1 
i 4.569188 54.53404 0.5378755 86 78.64335 0 0.2791463 0 0 4095 1 
i 4.753224 54.53404 0.5378755 81 78.94524 0 0.2883835 0 0 4095 1 
i 5.121297 54.53404 0.5378755 90 79.54901 0 0.3068579 0 0 4095 1 
i 5.182642 54.53404 0.5378755 92 79.64964 0 0.309937 0 0 4095 1 
i 6.353782 54.71261 0.5378755 99 82.89727 0 0.3687194 0 0 4095 1 
i 6.721854 54.71261 0.5378755 104 83.50105 0 0.3871938 0 0 4095 1 
i 8.138376 54.71261 0.7171673 86 82.88922 0 0.4582925 0 0 4095 1 
i 9.242593 54.71261 0.7171673 98 84.70055 0 0.5137159 0 0 4095 1 
i 2.784594 54.90553 0.5378755 39 70.14356 0 0.1895731 0 0 4095 1 
i 3.336703 54.90553 0.5378755 27 71.04922 0 0.2172848 0 0 4095 1 
i 4.569188 55.02023 0.7171673 62 74.37937 0 0.2791463 0 0 4095 1 
i 4.753224 55.02023 0.7171673 59 74.68126 0 0.2883835 0 0 4095 1 
i 4.875915 55.02023 0.7171673 61 74.88252 0 0.2945416 0 0 4095 1 
i 4.93726 55.02023 0.7171673 62 74.98314 0 0.2976207 0 0 4095 1 
i 5.121297 55.02023 0.7171673 59 75.28503 0 0.3068579 0 0 4095 1 
i 5.182642 55.02023 0.7171673 56 75.38566 0 0.309937 0 0 4095 1 
i 5.305333 55.02023 0.7171673 55 75.58692 0 0.3160952 0 0 4095 1 
i 5.489369 55.02023 0.7171673 55 75.88881 0 0.3253324 0 0 4095 1 
i 5.61206 55.02023 0.7171673 65 76.09006 0 0.3314906 0 0 4095 1 
i 5.673405 55.02023 0.7171673 66 76.19069 0 0.3345696 0 0 4095 1 
i 5.796096 55.02023 0.7171673 65 76.39195 0 0.3407278 0 0 4095 1 
i 5.980132 55.02023 0.7171673 65 76.69384 0 0.349965 0 0 4095 1 
i 6.041478 55.02023 0.7171673 71 76.79447 0 0.3530441 0 0 4095 1 
i 6.225514 55.02023 0.7171673 71 77.09635 0 0.3622813 0 0 4095 1 
i 6.348205 55.02023 0.7171673 69 77.29761 0 0.3684395 0 0 4095 1 
i 6.40955 55.02023 0.7171673 75 77.39824 0 0.3715185 0 0 4095 1 
i 2.784594 55.27568 0.5378755 63 74.38809 0 0.1895731 0 0 4095 1 
i 3.888811 55.27568 0.5378755 76 76.19941 0 0.2449965 0 0 4095 1 
i 1 55.36843 0.5378755 49 70.13417 0 0.1 0 0 4095 1 
i 1.184036 55.36843 0.5378755 49 70.43606 0 0.1092372 0 0 4095 1 
i 1.306727 55.36843 0.5378755 48 70.63732 0 0.1153954 0 0 4095 1 
i 1.368072 55.36843 0.5378755 45 70.73795 0 0.1184745 0 0 4095 1 
i 2.042872 55.36843 0.5378755 64 71.84486 0 0.1523443 0 0 4095 1 
i 2.104217 55.36843 0.5378755 61 71.94549 0 0.1554234 0 0 4095 1 
i 2.226908 55.36843 0.5378755 64 72.14675 0 0.1615815 0 0 4095 1 
i 2.410945 55.36843 0.5378755 64 72.44864 0 0.1708188 0 0 4095 1 
i 4.569188 55.65004 0.5378755 69 74.39681 0 0.2791463 0 0 4095 1 
i 4.875915 55.65004 0.5378755 75 74.89996 0 0.2945416 0 0 4095 1 
i 6.353782 55.78711 0.7171673 74 78.63463 0 0.3687194 0 0 4095 1 
i 7.826072 55.78711 0.7171673 86 81.04973 0 0.4426172 0 0 4095 1 
i 8.138376 55.99302 0.7171673 86 82.88855 0 0.4582925 0 0 4095 1 
i 8.322412 55.99302 0.7171673 86 83.19044 0 0.4675297 0 0 4095 1 
i 9.181248 55.99302 0.7171673 96 84.59925 0 0.5106368 0 0 4095 1 
i 9.242593 55.99302 0.7171673 99 84.69987 0 0.5137159 0 0 4095 1 
i 6.353782 55.99302 0.5378755 99 82.8966 0 0.3687194 0 0 4095 1 
i 6.537818 55.99302 0.5378755 99 83.19849 0 0.3779566 0 0 4095 1 
i 6.660509 55.99302 0.5378755 102 83.39975 0 0.3841148 0 0 4095 1 
i 6.721854 55.99302 0.5378755 104 83.50038 0 0.3871938 0 0 4095 1 
i 4.569188 56.07507 0.5378755 87 78.64268 0 0.2791463 0 0 4095 1 
i 5.305333 56.07507 0.5378755 92 79.85023 0 0.3160952 0 0 4095 1 
i 2.784594 56.4108 0.5378755 53 70.14289 0 0.1895731 0 0 4095 1 
i 3.398048 56.4108 0.5378755 63 71.14918 0 0.2203639 0 0 4095 1 
i 2.784594 56.61429 0.5378755 64 74.38742 0 0.1895731 0 0 4095 1 
i 2.96863 56.61429 0.5378755 64 74.68931 0 0.1988104 0 0 4095 1 
i 3.827466 56.61429 0.5378755 74 76.09811 0 0.2419174 0 0 4095 1 
i 3.888811 56.61429 0.5378755 76 76.19874 0 0.2449965 0 0 4095 1 
i 4.569188 57.08986 0.5378755 59 74.39614 0 0.2791463 0 0 4095 1 
i 4.93726 57.08986 0.5378755 59 74.99992 0 0.2976207 0 0 4095 1 
i 6.353782 57.12572 0.7171673 74 78.63396 0 0.3687194 0 0 4095 1 
i 6.905891 57.12572 0.7171673 71 79.53962 0 0.3964311 0 0 4095 1 
i 7.396654 57.12572 0.7171673 81 80.34465 0 0.4210637 0 0 4095 1 
i 7.826072 57.12572 0.7171673 87 81.04906 0 0.4426172 0 0 4095 1 
i 1 57.22364 0.5378755 51 70.1335 0 0.1 0 0 4095 1 
i 2.47229 57.22364 0.5378755 64 72.5486 0 0.1738978 0 0 4095 1 
i 4.569188 57.41368 0.5378755 87 78.64201 0 0.2791463 0 0 4095 1 
i 4.875915 57.41368 0.5378755 81 79.14516 0 0.2945416 0 0 4095 1 
i 5.121297 57.41368 0.5378755 87 79.54767 0 0.3068579 0 0 4095 1 
i 5.305333 57.41368 0.5378755 92 79.84956 0 0.3160952 0 0 4095 1 
i 8.138376 57.46706 0.7171673 88 82.88788 0 0.4582925 0 0 4095 1 
i 9.365284 57.46706 0.7171673 98 84.90046 0 0.519874 0 0 4095 1 
i 6.353782 57.77529 0.5378755 98 82.89593 0 0.3687194 0 0 4095 1 
i 2.784594 57.81026 0.5378755 50 70.14222 0 0.1895731 0 0 4095 1 
i 2.96863 57.81026 0.5378755 45 70.44411 0 0.1988104 0 0 4095 1 
i 3.336703 57.81026 0.5378755 50 71.04788 0 0.2172848 0 0 4095 1 
i 2.784594 58.15533 0.5378755 66 74.38675 0 0.1895731 0 0 4095 1 
i 4.011502 58.15533 0.5378755 76 76.39933 0 0.2511547 0 0 4095 1 
i 6.353782 58.24749 0.5378755 80 78.65073 0 0.3687194 0 0 4095 1 
i 4.569188 58.42847 0.5378755 51 74.39547 0 0.2791463 0 0 4095 1 
i 4.753224 58.42847 0.5378755 56 74.69736 0 0.2883835 0 0 4095 1 
i 4.875915 58.42847 0.5378755 54 74.89862 0 0.2945416 0 0 4095 1 
i 4.93726 58.42847 0.5378755 51 74.99925 0 0.2976207 0 0 4095 1 
i 6.353782 58.49698 0.7171673 77 78.63329 0 0.3687194 0 0 4095 1 
i 6.967236 58.49698 0.7171673 71 79.63958 0 0.3995101 0 0 4095 1 
i 7.457999 58.49698 0.7171673 81 80.44461 0 0.4241428 0 0 4095 1 
i 7.826072 58.49698 0.7171673 84 81.04839 0 0.4426172 0 0 4095 1 
i 1 58.6231 0.5378755 52 70.13283 0 0.1 0 0 4095 1 
i 1.552109 58.6231 0.5378755 48 71.03849 0 0.1277117 0 0 4095 1 
i 2.042872 58.6231 0.5378755 58 71.84352 0 0.1523443 0 0 4095 1 
i 2.47229 58.6231 0.5378755 64 72.54792 0 0.1738978 0 0 4095 1 
i 8.138376 58.74747 0.7171673 89 82.88721 0 0.4582925 0 0 4095 1 
i 8.445103 58.74747 0.7171673 86 83.39036 0 0.4736879 0 0 4095 1 
i 9.181248 58.74747 0.7171673 99 84.5979 0 0.5106368 0 0 4095 1 
i 9.365284 58.74747 0.7171673 99 84.89979 0 0.519874 0 0 4095 1 
i 4.569188 58.78494 0.5378755 86 78.64134 0 0.2791463 0 0 4095 1 
i 4.93726 58.78494 0.5378755 86 79.24512 0 0.2976207 0 0 4095 1 
i 5.182642 58.78494 0.5378755 87 79.64763 0 0.309937 0 0 4095 1 
i 5.305333 58.78494 0.5378755 90 79.84889 0 0.3160952 0 0 4095 1 
i 6.353782 59.11972 0.5378755 99 82.89526 0 0.3687194 0 0 4095 1 
i 6.905891 59.11972 0.5378755 104 83.80092 0 0.3964311 0 0 4095 1 
i 2.784594 59.42134 0.5378755 39 70.14155 0 0.1895731 0 0 4095 1 
i 3.520739 59.42134 0.5378755 32 71.3491 0 0.226522 0 0 4095 1 
i 2.784594 59.49394 0.5378755 66 74.38608 0 0.1895731 0 0 4095 1 
i 3.091321 59.49394 0.5378755 64 74.88922 0 0.2049685 0 0 4095 1 
i 3.827466 59.49394 0.5378755 76 76.09677 0 0.2419174 0 0 4095 1 
i 4.011502 59.49394 0.5378755 76 76.39866 0 0.2511547 0 0 4095 1 
i 6.353782 59.72331 0.5378755 72 78.65006 0 0.3687194 0 0 4095 1 
i 6.353782 59.77185 0.7171673 74 78.63262 0 0.3687194 0 0 4095 1 
i 6.537818 59.77185 0.7171673 79 78.93451 0 0.3779566 0 0 4095 1 
i 6.905891 59.77185 0.7171673 70 79.53828 0 0.3964311 0 0 4095 1 
i 6.967236 59.77185 0.7171673 68 79.63891 0 0.3995101 0 0 4095 1 
i 7.396654 59.77185 0.7171673 80 80.34331 0 0.4210637 0 0 4095 1 
i 7.457999 59.77185 0.7171673 78 80.44394 0 0.4241428 0 0 4095 1 
i 7.826072 59.77185 0.7171673 86 81.04771 0 0.4426172 0 0 4095 1 
i 8.010108 59.77185 0.7171673 86 81.3496 0 0.4518544 0 0 4095 1 
i 1 60.05669 0.5378755 54 70.13216 0 0.1 0 0 4095 1 
i 1.613454 60.05669 0.5378755 43 71.13845 0 0.1307908 0 0 4095 1 
i 2.104217 60.05669 0.5378755 58 71.94348 0 0.1554234 0 0 4095 1 
i 2.47229 60.05669 0.5378755 62 72.54725 0 0.1738978 0 0 4095 1 
i 8.138376 60.05911 0.7171673 86 82.88654 0 0.4582925 0 0 4095 1 
i 8.506448 60.05911 0.7171673 86 83.49031 0 0.476767 0 0 4095 1 
i 9.242593 60.05911 0.7171673 99 84.69786 0 0.5137159 0 0 4095 1 
i 9.365284 60.05911 0.7171673 101 84.89912 0 0.519874 0 0 4095 1 
i 4.569188 60.05981 0.5378755 87 78.64067 0 0.2791463 0 0 4095 1 
i 4.753224 60.05981 0.5378755 87 78.94256 0 0.2883835 0 0 4095 1 
i 4.875915 60.05981 0.5378755 86 79.14382 0 0.2945416 0 0 4095 1 
i 4.93726 60.05981 0.5378755 87 79.24444 0 0.2976207 0 0 4095 1 
i 5.121297 60.05981 0.5378755 92 79.54633 0 0.3068579 0 0 4095 1 
i 5.182642 60.05981 0.5378755 89 79.64696 0 0.309937 0 0 4095 1 
i 5.305333 60.05981 0.5378755 92 79.84822 0 0.3160952 0 0 4095 1 
i 5.489369 60.05981 0.5378755 92 80.1501 0 0.3253324 0 0 4095 1 
i 4.569188 60.29175 0.5378755 66 74.3948 0 0.2791463 0 0 4095 1 
i 6.353782 60.49695 0.5378755 98 82.89459 0 0.3687194 0 0 4095 1 
i 6.967236 60.49695 0.5378755 104 83.90088 0 0.3995101 0 0 4095 1 
i 2.784594 60.8208 0.5378755 56 70.14088 0 0.1895731 0 0 4095 1 
i 3.091321 60.8208 0.5378755 54 70.64403 0 0.2049685 0 0 4095 1 
i 3.336703 60.8208 0.58228 63 71.04654 0 0.2172848 0 0 4095 1 
i 3.520739 60.8208 0.5378755 68 71.34843 0 0.226522 0 0 4095 1 
i 2.784594 60.8652 1.062184 64 74.38541 0 0.1895731 0 0 4095 1 
i 3.888811 60.8652 0.5378755 76 76.19673 0 0.2449965 0 0 4095 1 
i 4.011502 60.8652 0.5378755 77 76.39799 0 0.2511547 0 0 4095 1 
i 6.353782 61.23513 0.5378755 74 78.64939 0 0.3687194 0 0 4095 1 
i 6.353782 61.2395 0.7171673 74 78.63195 0 0.3687194 0 0 4095 1 
i 7.089927 61.2395 0.7171673 71 79.8395 0 0.4056683 0 0 4095 1 
i 7.58069 61.2395 0.7171673 81 80.64453 0 0.4303009 0 0 4095 1 
i 7.826072 61.2395 0.7171673 87 81.04704 0 0.4426172 0 0 4095 1 
i 8.138376 61.27855 0.7171673 85 82.88587 0 0.4582925 0 0 4095 1 
i 8.322412 61.27855 0.7171673 88 83.18776 0 0.4675297 0 0 4095 1 
i 8.445103 61.27855 0.7171673 86 83.38901 0 0.4736879 0 0 4095 1 
i 8.506448 61.27855 0.7171673 85 83.48964 0 0.476767 0 0 4095 1 
i 9.181248 61.27855 0.7171673 98 84.59656 0 0.5106368 0 0 4095 1 
i 9.242593 61.27855 0.7171673 96 84.69719 0 0.5137159 0 0 4095 1 
i 9.365284 61.27855 0.7171673 98 84.89845 0 0.519874 0 0 4095 1 
i 9.54932 61.27855 0.7171673 102 85.20034 0 0.5291113 0 0 4095 1 
i 1 61.38951 0.5378755 51 70.13149 0 0.1 0 0 4095 1 
i 1.184036 61.38951 0.5378755 55 70.43338 0 0.1092372 0 0 4095 1 
i 1.552109 61.38951 0.5378755 48 71.03715 0 0.1277117 0 0 4095 1 
i 1.613454 61.38951 0.5378755 45 71.13778 0 0.1307908 0 0 4095 1 
i 2.042872 61.38951 0.5378755 58 71.84218 0 0.1523443 0 0 4095 1 
i 2.104217 61.38951 0.5378755 55 71.94281 0 0.1554234 0 0 4095 1 
i 2.47229 61.38951 0.5378755 64 72.54658 0 0.1738978 0 0 4095 1 
i 2.656326 61.38951 0.5378755 64 72.84847 0 0.1831351 0 0 4095 1 
i 4.569188 61.6973 0.5378755 56 74.39413 0 0.2791463 0 0 4095 1 
i 5.121297 61.6973 0.5378755 44 75.29979 0 0.3068579 0 0 4095 1 
i 6.353782 61.77736 0.5378755 98 82.89392 0 0.3687194 0 0 4095 1 
i 6.537818 61.77736 0.5378755 98 83.19581 0 0.3779566 0 0 4095 1 
i 6.905891 61.77736 0.5378755 102 83.79958 0 0.3964311 0 0 4095 1 
i 6.967236 61.77736 0.5378755 104 83.90021 0 0.3995101 0 0 4095 1 
i 2.784594 62.14007 0.5378755 66 74.38474 0 0.1895731 0 0 4095 1 
i 2.96863 62.14007 0.5378755 66 74.68662 0 0.1988104 0 0 4095 1 
i 3.091321 62.14007 0.5378755 63 74.88788 0 0.2049685 0 0 4095 1 
i 3.152666 62.14007 0.5378755 61 74.98851 0 0.2080476 0 0 4095 1 
i 3.827466 62.14007 0.5378755 76 76.09543 0 0.2419174 0 0 4095 1 
i 3.888811 62.14007 0.5378755 73 76.19606 0 0.2449965 0 0 4095 1 
i 4.011502 62.14007 0.5378755 76 76.39732 0 0.2511547 0 0 4095 1 
i 4.195539 62.14007 0.5378755 76 76.6992 0 0.2603919 0 0 4095 1 
i 2.784594 62.25439 0.5378755 42 70.14021 0 0.1895731 0 0 4095 1 
i 3.152666 62.25439 0.5378755 42 70.74398 0 0.2080476 0 0 4095 1 
i 3.398048 62.25439 0.5378755 39 71.1465 0 0.2203639 0 0 4095 1 
i 3.520739 62.25439 0.5378755 38 71.34776 0 0.226522 0 0 4095 1 
i 4.569188 62.44458 0.5378755 79 78.64 0 0.2791463 0 0 4095 1 
i 6.353782 62.51437 0.7171673 73 78.63128 0 0.3687194 0 0 4095 1 
i 6.660509 62.51437 0.7171673 79 79.13442 0 0.3841148 0 0 4095 1 
i 6.905891 62.51437 0.7171673 73 79.53694 0 0.3964311 0 0 4095 1 
i 7.089927 62.51437 0.7171673 68 79.83883 0 0.4056683 0 0 4095 1 
i 7.396654 62.51437 0.7171673 83 80.34197 0 0.4210637 0 0 4095 1 
i 7.58069 62.51437 0.7171673 78 80.64386 0 0.4303009 0 0 4095 1 
i 7.826072 62.51437 0.7171673 84 81.04637 0 0.4426172 0 0 4095 1 
i 8.132799 62.51437 0.7171673 86 81.54952 0 0.4580126 0 0 4095 1 
i 6.353782 62.64067 0.5378755 83 78.64872 0 0.3687194 0 0 4095 1 
i 6.537818 62.64067 0.5378755 87 78.95061 0 0.3779566 0 0 4095 1 
i 1 62.92387 0.5378755 52 70.13082 0 0.1 0 0 4095 1 
i 1.736145 62.92387 0.5378755 43 71.33836 0 0.1369489 0 0 4095 1 
i 2.226908 62.92387 0.5378755 58 72.1434 0 0.1615815 0 0 4095 1 
i 2.47229 62.92387 0.5378755 64 72.54591 0 0.1738978 0 0 4095 1 
i 8.138376 62.97595 0.7171673 91 82.8852 0 0.4582925 0 0 4095 1 
i 9.610666 62.97595 0.7171673 98 85.30029 0 0.5321903 0 0 4095 1 
i 4.569188 63.13712 0.5378755 65 74.39346 0 0.2791463 0 0 4095 1 
i 5.182642 63.13712 0.5378755 75 75.39975 0 0.309937 0 0 4095 1 
i 6.353782 63.25139 0.5378755 99 82.89325 0 0.3687194 0 0 4095 1 
i 7.089927 63.25139 0.5378755 104 84.1008 0 0.4056683 0 0 4095 1 
i 2.784594 63.5872 0.5378755 39 70.13954 0 0.1895731 0 0 4095 1 
i 2.96863 63.5872 0.5378755 39 70.44143 0 0.1988104 0 0 4095 1 
i 3.091321 63.5872 0.5378755 41 70.64268 0 0.2049685 0 0 4095 1 
i 3.152666 63.5872 0.5378755 44 70.74331 0 0.2080476 0 0 4095 1 
i 3.336703 63.5872 0.5378755 39 71.0452 0 0.2172848 0 0 4095 1 
i 3.398048 63.5872 0.5378755 38 71.14583 0 0.2203639 0 0 4095 1 
i 3.520739 63.5872 0.5378755 39 71.34709 0 0.226522 0 0 4095 1 
i 3.704775 63.5872 0.5378755 39 71.64897 0 0.2357593 0 0 4095 1 
i 6.353782 63.82033 0.7171673 74 78.63061 0 0.3687194 0 0 4095 1 
i 6.721854 63.82033 0.7171673 79 79.23438 0 0.3871938 0 0 4095 1 
i 6.967236 63.82033 0.7171673 73 79.6369 0 0.3995101 0 0 4095 1 
i 7.089927 63.82033 0.7171673 70 79.83816 0 0.4056683 0 0 4095 1 
i 7.457999 63.82033 0.7171673 83 80.44193 0 0.4241428 0 0 4095 1 
i 7.58069 63.82033 0.7171673 80 80.64319 0 0.4303009 0 0 4095 1 
i 7.826072 63.82033 0.7171673 86 81.0457 0 0.4426172 0 0 4095 1 
i 8.194144 63.82033 0.7171673 86 81.64948 0 0.4610917 0 0 4095 1 
i 4.569188 63.85012 0.5378755 78 78.63933 0 0.2791463 0 0 4095 1 
i 5.61206 63.85012 0.5378755 88 80.35002 0 0.3314906 0 0 4095 1 
i 2.784594 63.91462 0.5378755 67 74.38407 0 0.1895731 0 0 4095 1 
i 4.256884 63.91462 0.5378755 76 76.79916 0 0.263471 0 0 4095 1 
i 8.138376 64.25636 0.7171673 91 82.88453 0 0.4582925 0 0 4095 1 
i 8.690484 64.25636 0.7171673 86 83.79019 0 0.4860042 0 0 4095 1 
i 9.181248 64.25636 0.7171673 93 84.59522 0 0.5106368 0 0 4095 1 
i 9.610666 64.25636 0.7171673 99 85.29962 0 0.5321903 0 0 4095 1 
i 1 64.25669 0.5378755 54 70.13015 0 0.1 0 0 4095 1 
i 1.306727 64.25669 0.5378755 55 70.63329 0 0.1153954 0 0 4095 1 
i 1.552109 64.25669 0.5378755 49 71.03581 0 0.1277117 0 0 4095 1 
i 1.736145 64.25669 0.5378755 45 71.33769 0 0.1369489 0 0 4095 1 
i 2.042872 64.25669 0.5378755 59 71.84084 0 0.1523443 0 0 4095 1 
i 2.226908 64.25669 0.5378755 55 72.14273 0 0.1615815 0 0 4095 1 
i 2.47229 64.25669 0.5378755 61 72.54524 0 0.1738978 0 0 4095 1 
i 2.779017 64.25669 0.5378755 64 73.04839 0 0.1892932 0 0 4095 1 
i 6.353782 64.25876 0.5378755 68 78.64805 0 0.3687194 0 0 4095 1 
i 4.569188 64.47573 0.5378755 62 74.39279 0 0.2791463 0 0 4095 1 
i 5.121297 64.47573 0.5378755 66 75.29845 0 0.3068579 0 0 4095 1 
i 6.353782 64.5318 0.5378755 99 82.89258 0 0.3687194 0 0 4095 1 
i 6.660509 64.5318 0.5378755 98 83.39572 0 0.3841148 0 0 4095 1 
i 6.905891 64.5318 0.5378755 104 83.79824 0 0.3964311 0 0 4095 1 
i 7.089927 64.5318 0.5378755 104 84.10013 0 0.4056683 0 0 4095 1 
i 6.353782 65.03449 0.7171673 74 78.62994 0 0.3687194 0 0 4095 1 
i 6.537818 65.03449 0.7171673 74 78.93182 0 0.3779566 0 0 4095 1 
i 6.660509 65.03449 0.7171673 77 79.13308 0 0.3841148 0 0 4095 1 
i 6.721854 65.03449 0.7171673 79 79.23371 0 0.3871938 0 0 4095 1 
i 6.905891 65.03449 0.7171673 71 79.5356 0 0.3964311 0 0 4095 1 
i 6.967236 65.03449 0.7171673 73 79.63623 0 0.3995101 0 0 4095 1 
i 7.089927 65.03449 0.7171673 71 79.83748 0 0.4056683 0 0 4095 1 
i 7.273963 65.03449 0.7171673 71 80.13937 0 0.4149055 0 0 4095 1 
i 7.396654 65.03449 0.7171673 81 80.34063 0 0.4210637 0 0 4095 1 
i 7.457999 65.03449 0.7171673 83 80.44126 0 0.4241428 0 0 4095 1 
i 7.58069 65.03449 0.7171673 81 80.64252 0 0.4303009 0 0 4095 1 
i 7.764726 65.03449 0.7171673 77 80.9444 0 0.4395381 0 0 4095 1 
i 7.826072 65.03449 0.7171673 87 81.04503 0 0.4426172 0 0 4095 1 
i 8.010108 65.03449 0.7171673 83 81.34692 0 0.4518544 0 0 4095 1 
i 8.132799 65.03449 0.7171673 84 81.54818 0 0.4580126 0 0 4095 1 
i 8.194144 65.03449 0.7171673 87 81.64881 0 0.4610917 0 0 4095 1 
i 2.784594 65.25324 0.5378755 67 74.3834 0 0.1895731 0 0 4095 1 
i 3.336703 65.25324 0.5378755 64 75.28906 0 0.2172848 0 0 4095 1 
i 3.827466 65.25324 0.5378755 70 76.09409 0 0.2419174 0 0 4095 1 
i 4.256884 65.25324 0.5378755 76 76.79849 0 0.263471 0 0 4095 1 
i 4.569188 65.28994 0.5378755 79 78.63866 0 0.2791463 0 0 4095 1 
i 5.673405 65.28994 0.5378755 88 80.44998 0 0.3345696 0 0 4095 1 
i 8.138376 65.32936 0.5378755 92 82.9013 0 0.4582925 0 0 4095 1 
i 8.138376 65.568 0.7171673 89 82.88386 0 0.4582925 0 0 4095 1 
i 8.75183 65.568 0.7171673 86 83.89015 0 0.4890833 0 0 4095 1 
i 9.242593 65.568 0.7171673 93 84.69518 0 0.5137159 0 0 4095 1 
i 9.610666 65.568 0.7171673 101 85.29895 0 0.5321903 0 0 4095 1 
i 1 65.62202 0.5378755 51 70.12948 0 0.1 0 0 4095 1 
i 1.368072 65.62202 0.5378755 55 70.73325 0 0.1184745 0 0 4095 1 
i 1.613454 65.62202 0.5378755 49 71.13577 0 0.1307908 0 0 4095 1 
i 1.736145 65.62202 0.5378755 48 71.33702 0 0.1369489 0 0 4095 1 
i 2.104217 65.62202 0.5378755 59 71.9408 0 0.1554234 0 0 4095 1 
i 2.226908 65.62202 0.5378755 58 72.14205 0 0.1615815 0 0 4095 1 
i 2.47229 65.62202 0.5378755 64 72.54457 0 0.1738978 0 0 4095 1 
i 2.840362 65.62202 0.5378755 64 73.14834 0 0.1923723 0 0 4095 1 
i 6.353782 65.6643 0.5378755 81 78.64738 0 0.3687194 0 0 4095 1 
i 6.660509 65.6643 0.5378755 87 79.15052 0 0.3841148 0 0 4095 1 
i 6.353782 65.84344 0.5378755 102 82.89191 0 0.3687194 0 0 4095 1 
i 6.721854 65.84344 0.5378755 98 83.49568 0 0.3871938 0 0 4095 1 
i 6.967236 65.84344 0.5378755 104 83.8982 0 0.3995101 0 0 4095 1 
i 7.089927 65.84344 0.5378755 105 84.09945 0 0.4056683 0 0 4095 1 
i 4.569188 66.01677 0.5378755 51 74.39212 0 0.2791463 0 0 4095 1 
i 5.305333 66.01677 0.5378755 47 75.59966 0 0.3160952 0 0 4095 1 
i 2.784594 66.08037 0.5441282 43 70.13887 0 0.1895731 0 0 4095 1 
i 2.784594 66.6245 0.5378755 66 74.38273 0 0.1895731 0 0 4095 1 
i 3.398048 66.6245 0.5378755 64 75.38901 0 0.2203639 0 0 4095 1 
i 3.888811 66.6245 0.5378755 70 76.19405 0 0.2449965 0 0 4095 1 
i 4.256884 66.6245 0.5378755 77 76.79782 0 0.263471 0 0 4095 1 
i 4.569188 66.62856 0.5378755 79 78.63799 0 0.2791463 0 0 4095 1 
i 4.753224 66.62856 0.5378755 76 78.93987 0 0.2883835 0 0 4095 1 
i 5.61206 66.62856 0.5378755 89 80.34868 0 0.3314906 0 0 4095 1 
i 5.673405 66.62856 0.5378755 92 80.44931 0 0.3345696 0 0 4095 1 
i 8.138376 66.74101 0.5378755 87 82.90063 0 0.4582925 0 0 4095 1 
i 8.138376 66.78744 0.7171673 91 82.88319 0 0.4582925 0 0 4095 1 
i 8.322412 66.78744 0.7171673 91 83.18507 0 0.4675297 0 0 4095 1 
i 8.690484 66.78744 0.7171673 86 83.78885 0 0.4860042 0 0 4095 1 
i 8.75183 66.78744 0.7171673 85 83.88948 0 0.4890833 0 0 4095 1 
i 9.181248 66.78744 0.7171673 92 84.59388 0 0.5106368 0 0 4095 1 
i 9.242593 66.78744 0.7171673 95 84.69451 0 0.5137159 0 0 4095 1 
i 9.610666 66.78744 0.7171673 98 85.29828 0 0.5321903 0 0 4095 1 
i 9.794702 66.78744 0.7171673 102 85.60017 0 0.5414276 0 0 4095 1 
i 1 66.89137 0.5378755 52 70.12881 0 0.1 0 0 4095 1 
i 1.184036 66.89137 0.5378755 52 70.43069 0 0.1092372 0 0 4095 1 
i 1.306727 66.89137 0.5378755 54 70.63195 0 0.1153954 0 0 4095 1 
i 1.368072 66.89137 0.5378755 55 70.73258 0 0.1184745 0 0 4095 1 
i 1.552109 66.89137 0.5378755 48 71.03447 0 0.1277117 0 0 4095 1 
i 1.613454 66.89137 0.5378755 49 71.13509 0 0.1307908 0 0 4095 1 
i 1.736145 66.89137 0.5378755 48 71.33635 0 0.1369489 0 0 4095 1 
i 1.920181 66.89137 0.5378755 43 71.63824 0 0.1461861 0 0 4095 1 
i 2.042872 66.89137 0.5378755 58 71.8395 0 0.1523443 0 0 4095 1 
i 2.104217 66.89137 0.5378755 59 71.94013 0 0.1554234 0 0 4095 1 
i 2.226908 66.89137 0.5378755 58 72.14138 0 0.1615815 0 0 4095 1 
i 2.410945 66.89137 0.5378755 53 72.44327 0 0.1708188 0 0 4095 1 
i 2.47229 66.89137 0.5378755 64 72.5439 0 0.1738978 0 0 4095 1 
i 2.656326 66.89137 0.5378755 64 72.84579 0 0.1831351 0 0 4095 1 
i 2.779017 66.89137 0.5378755 62 73.04704 0 0.1892932 0 0 4095 1 
i 2.840362 66.89137 0.5378755 64 73.14767 0 0.1923723 0 0 4095 1 
i 6.353782 67.06288 0.5378755 99 82.89124 0 0.3687194 0 0 4095 1 
i 6.537818 67.06288 0.5378755 104 83.19312 0 0.3779566 0 0 4095 1 
i 6.660509 67.06288 0.5378755 101 83.39438 0 0.3841148 0 0 4095 1 
i 6.721854 67.06288 0.5378755 99 83.49501 0 0.3871938 0 0 4095 1 
i 6.905891 67.06288 0.5378755 104 83.7969 0 0.3964311 0 0 4095 1 
i 6.967236 67.06288 0.5378755 101 83.89753 0 0.3995101 0 0 4095 1 
i 7.089927 67.06288 0.5378755 104 84.09878 0 0.4056683 0 0 4095 1 
i 7.273963 67.06288 0.5378755 107 84.40067 0 0.4149055 0 0 4095 1 
i 6.353782 67.10412 0.5378755 75 78.64671 0 0.3687194 0 0 4095 1 
i 6.721854 67.10412 0.5378755 75 79.25048 0 0.3871938 0 0 4095 1 
i 4.569188 67.35538 0.5378755 72 74.39145 0 0.2791463 0 0 4095 1 
i 4.875915 67.35538 0.5378755 66 74.89459 0 0.2945416 0 0 4095 1 
i 5.121297 67.35538 0.5378755 75 75.29711 0 0.3068579 0 0 4095 1 
i 5.305333 67.35538 0.5378755 80 75.59899 0 0.3160952 0 0 4095 1 
i 2.784594 67.5498 0.5378755 49 70.1382 0 0.1895731 0 0 4095 1 
i 3.827466 67.5498 0.5378755 40 71.84889 0 0.2419174 0 0 4095 1 
i 2.784594 67.89937 0.5378755 67 74.38205 0 0.1895731 0 0 4095 1 
i 2.96863 67.89937 0.5378755 67 74.68394 0 0.1988104 0 0 4095 1 
i 3.336703 67.89937 0.5378755 63 75.28771 0 0.2172848 0 0 4095 1 
i 3.398048 67.89937 0.5378755 61 75.38834 0 0.2203639 0 0 4095 1 
i 3.827466 67.89937 0.5378755 70 76.09275 0 0.2419174 0 0 4095 1 
i 3.888811 67.89937 0.5378755 71 76.19338 0 0.2449965 0 0 4095 1 
i 4.256884 67.89937 0.5378755 76 76.79715 0 0.263471 0 0 4095 1 
i 4.44092 67.89937 0.5378755 76 77.09904 0 0.2727082 0 0 4095 1 
i 4.569188 68.16959 0.5378755 78 78.63732 0 0.2791463 0 0 4095 1 
i 5.796096 68.16959 0.5378755 91 80.6499 0 0.3407278 0 0 4095 1 
i 8.138376 68.1871 0.5378755 90 82.89996 0 0.4582925 0 0 4095 1 
i 8.138376 68.19128 0.7171673 86 82.88252 0 0.4582925 0 0 4095 1 
i 8.874521 68.19128 0.7171673 86 84.09006 0 0.4952414 0 0 4095 1 
i 9.365284 68.19128 0.7171673 93 84.89509 0 0.519874 0 0 4095 1 
i 9.610666 68.19128 0.7171673 99 85.29761 0 0.5321903 0 0 4095 1 
i 6.353782 68.44273 0.5378755 68 78.64604 0 0.3687194 0 0 4095 1 
i 6.537818 68.44273 0.5378755 68 78.94792 0 0.3779566 0 0 4095 1 
i 6.660509 68.44273 0.5378755 66 79.14918 0 0.3841148 0 0 4095 1 
i 6.721854 68.44273 0.5378755 63 79.24981 0 0.3871938 0 0 4095 1 
i 4.569188 68.72664 0.5378755 54 74.39078 0 0.2791463 0 0 4095 1 
i 4.93726 68.72664 0.5378755 57 74.99455 0 0.2976207 0 0 4095 1 
i 5.182642 68.72664 0.5378755 51 75.39706 0 0.309937 0 0 4095 1 
i 5.305333 68.72664 0.5378755 50 75.59832 0 0.3160952 0 0 4095 1 
i 2.784594 69.05507 0.5378755 43 70.13753 0 0.1895731 0 0 4095 1 
i 3.888811 69.05507 0.5378755 64 71.94885 0 0.2449965 0 0 4095 1 
i 6.353782 69.34396 0.5378755 91 82.89057 0 0.3687194 0 0 4095 1 
i 2.784594 69.36702 0.5378755 67 74.38138 0 0.1895731 0 0 4095 1 
i 3.520739 69.36702 0.5378755 64 75.58893 0 0.226522 0 0 4095 1 
i 4.011502 69.36702 0.5378755 70 76.39396 0 0.2511547 0 0 4095 1 
i 4.256884 69.36702 0.5378755 76 76.79648 0 0.263471 0 0 4095 1 
i 8.138376 69.41072 0.7171673 88 82.88184 0 0.4582925 0 0 4095 1 
i 8.445103 69.41072 0.7171673 91 83.38499 0 0.4736879 0 0 4095 1 
i 8.690484 69.41072 0.7171673 88 83.78751 0 0.4860042 0 0 4095 1 
i 8.874521 69.41072 0.7171673 85 84.08939 0 0.4952414 0 0 4095 1 
i 9.181248 69.41072 0.7171673 98 84.59254 0 0.5106368 0 0 4095 1 
i 9.365284 69.41072 0.7171673 95 84.89442 0 0.519874 0 0 4095 1 
i 9.610666 69.41072 0.7171673 96 85.29694 0 0.5321903 0 0 4095 1 
i 9.917393 69.41072 0.7171673 102 85.80008 0 0.5475857 0 0 4095 1 
i 4.569188 69.5082 0.5378755 78 78.63665 0 0.2791463 0 0 4095 1 
i 4.875915 69.5082 0.5378755 76 79.13979 0 0.2945416 0 0 4095 1 
i 5.61206 69.5082 0.5378755 88 80.34734 0 0.3314906 0 0 4095 1 
i 5.796096 69.5082 0.5378755 92 80.64922 0 0.3407278 0 0 4095 1 
i 8.138376 69.53153 0.5378755 99 82.89929 0 0.4582925 0 0 4095 1 
i 8.322412 69.53153 0.5378755 99 83.20117 0 0.4675297 0 0 4095 1 
i 4.569188 70.00151 0.5378755 56 74.3901 0 0.2791463 0 0 4095 1 
i 4.753224 70.00151 0.5378755 56 74.69199 0 0.2883835 0 0 4095 1 
i 4.875915 70.00151 0.5378755 57 74.89325 0 0.2945416 0 0 4095 1 
i 4.93726 70.00151 0.5378755 59 74.99388 0 0.2976207 0 0 4095 1 
i 5.121297 70.00151 0.5378755 51 75.29577 0 0.3068579 0 0 4095 1 
i 5.182642 70.00151 0.5378755 53 75.39639 0 0.309937 0 0 4095 1 
i 5.305333 70.00151 0.5378755 51 75.59765 0 0.3160952 0 0 4095 1 
i 5.489369 70.00151 0.5378755 51 75.89954 0 0.3253324 0 0 4095 1 
i 6.353782 70.30602 0.5378755 78 78.64537 0 0.3687194 0 0 4095 1 
i 2.784594 70.45453 0.5378755 52 70.13686 0 0.1895731 0 0 4095 1 
i 2.96863 70.45453 0.5378755 55 70.43874 0 0.1988104 0 0 4095 1 
i 3.827466 70.45453 0.5378755 34 71.84755 0 0.2419174 0 0 4095 1 
i 3.888811 70.45453 0.5378755 32 71.94818 0 0.2449965 0 0 4095 1 
i 2.784594 70.64189 0.5378755 66 74.38071 0 0.1895731 0 0 4095 1 
i 3.091321 70.64189 0.5378755 67 74.88386 0 0.2049685 0 0 4095 1 
i 3.336703 70.64189 0.5378755 66 75.28637 0 0.2172848 0 0 4095 1 
i 3.520739 70.64189 0.5378755 61 75.58826 0 0.226522 0 0 4095 1 
i 3.827466 70.64189 0.5378755 76 76.0914 0 0.2419174 0 0 4095 1 
i 4.011502 70.64189 0.5378755 71 76.39329 0 0.2511547 0 0 4095 1 
i 4.256884 70.64189 0.5378755 73 76.79581 0 0.263471 0 0 4095 1 
i 4.563611 70.64189 0.5378755 76 77.29895 0 0.2788663 0 0 4095 1 
i 8.138376 70.6599 0.7171673 91 82.88117 0 0.4582925 0 0 4095 1 
i 8.506448 70.6599 0.7171673 91 83.48495 0 0.476767 0 0 4095 1 
i 8.75183 70.6599 0.7171673 88 83.88746 0 0.4890833 0 0 4095 1 
i 8.874521 70.6599 0.7171673 86 84.08872 0 0.4952414 0 0 4095 1 
i 9.242593 70.6599 0.7171673 98 84.69249 0 0.5137159 0 0 4095 1 
i 9.365284 70.6599 0.7171673 92 84.89375 0 0.519874 0 0 4095 1 
i 9.610666 70.6599 0.7171673 98 85.29627 0 0.5321903 0 0 4095 1 
i 9.978738 70.6599 0.7171673 102 85.90004 0 0.5506648 0 0 4095 1 
i 6.353782 70.6884 0.5378755 93 82.8899 0 0.3687194 0 0 4095 1 
i 7.396654 70.6884 0.5378755 103 84.60059 0 0.4210637 0 0 4095 1 
i 4.569188 70.87947 0.5378755 79 78.63597 0 0.2791463 0 0 4095 1 
i 4.93726 70.87947 0.5378755 76 79.23975 0 0.2976207 0 0 4095 1 
i 5.673405 70.87947 0.5378755 88 80.4473 0 0.3345696 0 0 4095 1 
i 5.796096 70.87947 0.5378755 89 80.64855 0 0.3407278 0 0 4095 1 
i 8.138376 71.07926 0.6322944 80 82.89862 0 0.4582925 0 0 4095 1 
i 6.353782 71.71156 0.5378755 71 78.6447 0 0.3687194 0 0 4095 1 
i 6.905891 71.71156 0.5378755 59 79.55036 0 0.3964311 0 0 4095 1 
i 8.138376 71.82127 0.7171673 91 82.8805 0 0.4582925 0 0 4095 1 
i 8.322412 71.82127 0.7171673 86 83.18239 0 0.4675297 0 0 4095 1 
i 8.445103 71.82127 0.7171673 89 83.38365 0 0.4736879 0 0 4095 1 
i 8.506448 71.82127 0.7171673 91 83.48428 0 0.476767 0 0 4095 1 
i 8.690484 71.82127 0.7171673 86 83.78616 0 0.4860042 0 0 4095 1 
i 8.75183 71.82127 0.7171673 89 83.88679 0 0.4890833 0 0 4095 1 
i 8.874521 71.82127 0.7171673 86 84.08805 0 0.4952414 0 0 4095 1 
i 9.058557 71.82127 0.7171673 83 84.38994 0 0.5044787 0 0 4095 1 
i 9.181248 71.82127 0.7171673 93 84.59119 0 0.5106368 0 0 4095 1 
i 9.242593 71.82127 0.7171673 99 84.69182 0 0.5137159 0 0 4095 1 
i 9.365284 71.82127 0.7171673 93 84.89308 0 0.519874 0 0 4095 1 
i 9.54932 71.82127 0.7171673 93 85.19497 0 0.5291113 0 0 4095 1 
i 9.610666 71.82127 0.7171673 99 85.2956 0 0.5321903 0 0 4095 1 
i 9.794702 71.82127 0.7171673 99 85.59748 0 0.5414276 0 0 4095 1 
i 9.917393 71.82127 0.7171673 101 85.79874 0 0.5475857 0 0 4095 1 
i 9.978738 71.82127 0.7171673 102 85.89937 0 0.5506648 0 0 4095 1 
i 2.784594 71.94785 0.5378755 67 74.38004 0 0.1895731 0 0 4095 1 
i 3.152666 71.94785 0.5378755 67 74.98382 0 0.2080476 0 0 4095 1 
i 3.398048 71.94785 0.5378755 66 75.38633 0 0.2203639 0 0 4095 1 
i 3.520739 71.94785 0.5378755 63 75.58759 0 0.226522 0 0 4095 1 
i 3.888811 71.94785 0.5378755 76 76.19136 0 0.2449965 0 0 4095 1 
i 4.011502 71.94785 0.5378755 70 76.39262 0 0.2511547 0 0 4095 1 
i 4.256884 71.94785 0.5378755 76 76.79514 0 0.263471 0 0 4095 1 
i 4.624956 71.94785 0.7443586 76 77.39891 0 0.2819454 0 0 4095 1 
i 2.784594 72.06561 0.5378755 45 70.13618 0 0.1895731 0 0 4095 1 
i 4.011502 72.06561 0.5378755 55 72.14876 0 0.2511547 0 0 4095 1 
i 6.353782 72.06562 0.5378755 91 82.88922 0 0.3687194 0 0 4095 1 
i 7.457999 72.06562 0.5378755 103 84.70055 0 0.4241428 0 0 4095 1 
i 4.569188 72.15433 0.5378755 78 78.6353 0 0.2791463 0 0 4095 1 
i 4.753224 72.15433 0.5378755 78 78.93719 0 0.2883835 0 0 4095 1 
i 4.93726 72.15433 0.5378755 78 79.23908 0 0.2976207 0 0 4095 1 
i 5.61206 72.15433 0.5378755 91 80.346 0 0.3314906 0 0 4095 1 
i 5.673405 72.15433 0.5378755 89 80.44662 0 0.3345696 0 0 4095 1 
i 5.796096 72.15433 0.5378755 91 80.64788 0 0.3407278 0 0 4095 1 
i 5.980132 72.15433 0.5378755 91 80.94977 0 0.349965 0 0 4095 1 
i 4.569188 72.38627 0.5378755 64 74.38943 0 0.2791463 0 0 4095 1 
i 8.138376 72.4237 0.5378755 98 82.89795 0 0.4582925 0 0 4095 1 
i 8.445103 72.4237 0.7276864 99 83.40109 0 0.4736879 0 0 4095 1 
i 6.353782 73.15138 0.5378755 81 78.64403 0 0.3687194 0 0 4095 1 
i 6.967236 73.15138 0.5378755 87 79.65031 0 0.3995101 0 0 4095 1 
i 2.784594 73.16201 0.5378755 67 74.37937 0 0.1895731 0 0 4095 1 
i 2.96863 73.16201 0.5378755 64 74.68126 0 0.1988104 0 0 4095 1 
i 3.091321 73.16201 0.5378755 66 74.88252 0 0.2049685 0 0 4095 1 
i 3.152666 73.16201 0.5378755 67 74.98314 0 0.2080476 0 0 4095 1 
i 3.336703 73.16201 0.5378755 64 75.28503 0 0.2172848 0 0 4095 1 
i 3.398048 73.16201 0.5378755 66 75.38566 0 0.2203639 0 0 4095 1 
i 3.520739 73.16201 0.5378755 64 75.58692 0 0.226522 0 0 4095 1 
i 3.704775 73.16201 0.5378755 60 75.88881 0 0.2357593 0 0 4095 1 
i 3.827466 73.16201 0.5378755 74 76.09006 0 0.2419174 0 0 4095 1 
i 3.888811 73.16201 0.5378755 76 76.19069 0 0.2449965 0 0 4095 1 
i 4.011502 73.16201 0.5378755 70 76.39195 0 0.2511547 0 0 4095 1 
i 4.195539 73.16201 0.5378755 70 76.69384 0 0.2603919 0 0 4095 1 
i 4.256884 73.16201 0.5378755 76 76.79447 0 0.263471 0 0 4095 1 
i 4.44092 73.16201 0.5378755 76 77.09635 0 0.2727082 0 0 4095 1 
i 4.563611 73.16201 0.5378755 77 77.29761 0 0.2788663 0 0 4095 1 
i 4.624956 73.16201 0.5378755 76 77.39824 0 0.2819454 0 0 4095 1 
i 6.353782 73.34603 0.5378755 91 82.88855 0 0.3687194 0 0 4095 1 
i 6.537818 73.34603 0.5378755 91 83.19044 0 0.3779566 0 0 4095 1 
i 7.396654 73.34603 0.5378755 101 84.59925 0 0.4210637 0 0 4095 1 
i 7.457999 73.34603 0.5378755 104 84.69987 0 0.4241428 0 0 4095 1 
i 2.784594 73.46507 0.5378755 46 70.13551 0 0.1895731 0 0 4095 1 
i 3.091321 73.46507 0.5378755 43 70.63866 0 0.2049685 0 0 4095 1 
i 3.827466 73.46507 0.5378755 56 71.84621 0 0.2419174 0 0 4095 1 
i 4.011502 73.46507 0.5378755 59 72.14809 0 0.2511547 0 0 4095 1 
i 4.569188 73.79182 0.5378755 61 74.38876 0 0.2791463 0 0 4095 1 
i 5.61206 73.79182 0.5378755 52 76.09945 0 0.3314906 0 0 4095 1 
i 8.138376 73.80092 0.5378755 87 82.89727 0 0.4582925 0 0 4095 1 
i 8.506448 73.80092 0.5378755 87 83.50105 0 0.476767 0 0 4095 1 
i 4.569188 73.92889 0.5378755 79 78.63463 0 0.2791463 0 0 4095 1 
i 6.041478 73.92889 0.5611069 91 81.04973 0 0.3530441 0 0 4095 1 
i 6.353782 74.48999 0.5378755 78 78.64335 0 0.3687194 0 0 4095 1 
i 6.905891 74.48999 0.5378755 78 79.54901 0 0.3964311 0 0 4095 1 
i 6.967236 74.48999 0.5378755 80 79.64964 0 0.3995101 0 0 4095 1 
i 6.353782 74.82006 0.5378755 93 82.88788 0 0.3687194 0 0 4095 1 
i 7.58069 74.82006 0.5378755 103 84.90046 0 0.4303009 0 0 4095 1 
i 2.784594 74.89866 0.5378755 52 70.13484 0 0.1895731 0 0 4095 1 
i 3.152666 74.89866 0.5378755 55 70.73862 0 0.2080476 0 0 4095 1 
i 3.888811 74.89866 0.5378755 32 71.94616 0 0.2449965 0 0 4095 1 
i 4.011502 74.89866 0.5378755 26 72.14742 0 0.2511547 0 0 4095 1 
i 8.138376 75.08133 0.5378755 80 82.8966 0 0.4582925 0 0 4095 1 
i 8.322412 75.08133 0.5378755 80 83.19849 0 0.4675297 0 0 4095 1 
i 8.445103 75.08133 0.5378755 81 83.39975 0 0.4736879 0 0 4095 1 
i 8.506448 75.08133 0.5378755 80 83.50038 0 0.476767 0 0 4095 1 
i 4.569188 75.23164 0.5378755 55 74.38809 0 0.2791463 0 0 4095 1 
i 5.673405 75.23164 0.5378755 79 76.19941 0 0.3345696 0 0 4095 1 
i 4.569188 75.2675 0.5378755 79 78.63396 0 0.2791463 0 0 4095 1 
i 5.121297 75.2675 0.5378755 76 79.53962 0 0.3068579 0 0 4095 1 
i 5.61206 75.2675 0.5378755 86 80.34465 0 0.3314906 0 0 4095 1 
i 6.041478 75.2675 0.7635311 92 81.04906 0 0.3530441 0 0 4095 1 
i 6.353782 76.03103 0.5378755 68 78.64268 0 0.3687194 0 0 4095 1 
i 7.089927 76.03103 0.5378755 63 79.85023 0 0.4056683 0 0 4095 1 
i 6.353782 76.10048 0.5378755 94 82.88721 0 0.3687194 0 0 4095 1 
i 6.660509 76.10048 0.5378755 91 83.39036 0 0.3841148 0 0 4095 1 
i 7.396654 76.10048 0.5378755 104 84.5979 0 0.4210637 0 0 4095 1 
i 7.58069 76.10048 0.5378755 104 84.89979 0 0.4303009 0 0 4095 1 
i 2.784594 76.23148 0.5378755 42 70.13417 0 0.1895731 0 0 4095 1 
i 2.96863 76.23148 0.5378755 45 70.43606 0 0.1988104 0 0 4095 1 
i 3.091321 76.23148 0.5378755 43 70.63732 0 0.2049685 0 0 4095 1 
i 3.152666 76.23148 0.5378755 42 70.73795 0 0.2080476 0 0 4095 1 
i 3.827466 76.23148 0.5378755 59 71.84486 0 0.2419174 0 0 4095 1 
i 3.888811 76.23148 0.5378755 58 71.94549 0 0.2449965 0 0 4095 1 
i 4.011502 76.23148 0.5378755 64 72.14675 0 0.2511547 0 0 4095 1 
i 4.195539 76.23148 0.5378755 64 72.44864 0 0.2603919 0 0 4095 1 
i 4.569188 76.57025 0.5378755 67 74.38742 0 0.2791463 0 0 4095 1 
i 4.753224 76.57025 0.5378755 67 74.68931 0 0.2883835 0 0 4095 1 
i 5.61206 76.57025 0.5378755 46 76.09811 0 0.3314906 0 0 4095 1 
i 5.673405 76.57025 0.5378755 44 76.19874 0 0.3345696 0 0 4095 1 
i 4.569188 76.63876 0.5378755 82 78.63329 0 0.2791463 0 0 4095 1 
i 5.182642 76.63876 0.5378755 76 79.63958 0 0.309937 0 0 4095 1 
i 5.673405 76.63876 0.5378755 86 80.44461 0 0.3345696 0 0 4095 1 
i 6.041478 76.63876 0.5378755 89 81.04839 0 0.3530441 0 0 4095 1 
i 8.138376 76.8636 0.5378755 93 82.89593 0 0.4582925 0 0 4095 1 
i 6.353782 77.36964 0.5378755 87 78.64201 0 0.3687194 0 0 4095 1 
i 6.660509 77.36964 0.5378755 81 79.14516 0 0.3841148 0 0 4095 1 
i 6.905891 77.36964 0.5803494 92 79.54767 0 0.3964311 0 0 4095 1 
i 7.089927 77.36964 0.5378755 96 79.84956 0 0.4056683 0 0 4095 1 
i 6.353782 77.41212 1.039388 91 82.88654 0 0.3687194 0 0 4095 1 
i 7.457999 77.41212 0.5378755 104 84.69786 0 0.4241428 0 0 4095 1 
i 7.58069 77.41212 0.5378755 106 84.89912 0 0.4303009 0 0 4095 1 
i 4.569188 77.91363 0.5378755 79 78.63262 0 0.2791463 0 0 4095 1 
i 4.753224 77.91363 0.5378755 79 78.93451 0 0.2883835 0 0 4095 1 
i 5.121297 77.91363 0.5378755 75 79.53828 0 0.3068579 0 0 4095 1 
i 5.182642 77.91363 0.5378755 78 79.63891 0 0.309937 0 0 4095 1 
i 5.61206 77.91363 0.5378755 85 80.34331 0 0.3314906 0 0 4095 1 
i 5.673405 77.91363 0.5378755 88 80.44394 0 0.3345696 0 0 4095 1 
i 6.041478 77.91363 0.5378755 91 81.04771 0 0.3530441 0 0 4095 1 
i 2.784594 78.08669 0.5378755 43 70.1335 0 0.1895731 0 0 4095 1 
i 4.256884 78.08669 0.5378755 40 72.5486 0 0.263471 0 0 4095 1 
i 4.569188 78.11129 0.5378755 61 74.38675 0 0.2791463 0 0 4095 1 
i 5.796096 78.11129 0.5378755 67 76.39933 0 0.3407278 0 0 4095 1 
i 8.138376 78.20803 0.5378755 87 82.89526 0 0.4582925 0 0 4095 1 
i 8.690484 78.20803 0.5378755 75 83.80092 0 0.4860042 0 0 4095 1 
i 6.353782 78.63156 0.5378755 93 82.88587 0 0.3687194 0 0 4095 1 
i 6.537818 78.63156 0.5378755 93 83.18776 0 0.3779566 0 0 4095 1 
i 6.660509 78.63156 0.5378755 91 83.38901 0 0.3841148 0 0 4095 1 
i 6.721854 78.63156 0.5378755 90 83.48964 0 0.3871938 0 0 4095 1 
i 7.396654 78.63156 0.5378755 103 84.59656 0 0.4210637 0 0 4095 1 
i 7.457999 78.63156 0.5378755 101 84.69719 0 0.4241428 0 0 4095 1 
i 7.58069 78.63156 0.5378755 103 84.89845 0 0.4303009 0 0 4095 1 
i 7.764726 78.63156 0.5378755 107 85.20034 0 0.4395381 0 0 4095 1 
i 6.353782 78.7409 0.5378755 69 78.64134 0 0.3687194 0 0 4095 1 
i 6.721854 78.7409 0.5378755 74 79.24512 0 0.3871938 0 0 4095 1 
i 6.967236 78.7409 0.5378755 68 79.64763 0 0.3995101 0 0 4095 1 
i 7.089927 78.7409 0.6403788 66 79.84889 0 0.4056683 0 0 4095 1 
i 4.569188 79.38128 0.5378755 79 78.63195 0 0.2791463 0 0 4095 1 
i 5.305333 79.38128 0.5378755 76 79.8395 0 0.3160952 0 0 4095 1 
i 5.796096 79.38128 0.5378755 86 80.64453 0 0.3407278 0 0 4095 1 
i 6.041478 79.38128 0.5378755 88 81.04704 0 0.3530441 0 0 4095 1 
i 4.569188 79.4499 0.5378755 58 74.38608 0 0.2791463 0 0 4095 1 
i 4.875915 79.4499 0.5378755 55 74.88922 0 0.2945416 0 0 4095 1 
i 5.61206 79.4499 0.5378755 68 76.09677 0 0.3314906 0 0 4095 1 
i 5.796096 79.4499 0.5378755 76 76.39866 0 0.3407278 0 0 4095 1 
i 2.784594 79.48615 0.5378755 43 70.13283 0 0.1895731 0 0 4095 1 
i 3.336703 79.48615 0.5378755 52 71.03849 0 0.2172848 0 0 4095 1 
i 3.827466 79.48615 0.5378755 41 71.84352 0 0.2419174 0 0 4095 1 
i 4.256884 79.48615 0.5378755 40 72.54792 0 0.263471 0 0 4095 1 
i 8.138376 79.58526 0.5378755 93 82.89459 0 0.4582925 0 0 4095 1 
i 8.75183 79.58526 0.5378755 104 83.90088 0 0.4890833 0 0 4095 1 
i 6.353782 80.01577 0.5378755 71 78.64067 0 0.3687194 0 0 4095 1 
i 6.537818 80.01577 0.5378755 68 78.94256 0 0.3779566 0 0 4095 1 
i 6.660509 80.01577 0.5378755 69 79.14382 0 0.3841148 0 0 4095 1 
i 6.721854 80.01577 0.5378755 75 79.24444 0 0.3871938 0 0 4095 1 
i 6.905891 80.01577 0.5378755 68 79.54633 0 0.3964311 0 0 4095 1 
i 6.967236 80.01577 0.5378755 69 79.64696 0 0.3995101 0 0 4095 1 
i 7.089927 80.01577 0.5378755 68 79.84822 0 0.4056683 0 0 4095 1 
i 7.273963 80.01577 0.5378755 63 80.1501 0 0.4149055 0 0 4095 1 
i 6.353782 80.32896 0.5378755 96 82.8852 0 0.3687194 0 0 4095 1 
i 7.826072 80.32896 0.5378755 103 85.30029 0 0.4426172 0 0 4095 1 
i 4.569188 80.65615 0.5378755 81 78.63128 0 0.2791463 0 0 4095 1 
i 4.875915 80.65615 0.5378755 79 79.13442 0 0.2945416 0 0 4095 1 
i 5.121297 80.65615 0.5378755 78 79.53694 0 0.3068579 0 0 4095 1 
i 5.305333 80.65615 0.5378755 78 79.83883 0 0.3160952 0 0 4095 1 
i 5.61206 80.65615 0.5378755 88 80.34197 0 0.3314906 0 0 4095 1 
i 5.796096 80.65615 0.5378755 88 80.64386 0 0.3407278 0 0 4095 1 
i 6.041478 80.65615 0.5378755 89 81.04637 0 0.3530441 0 0 4095 1 
i 6.348205 80.65615 0.5378755 91 81.54952 0 0.3684395 0 0 4095 1 
i 4.569188 80.82116 0.5378755 67 74.38541 0 0.2791463 0 0 4095 1 
i 4.93726 80.82116 0.5378755 72 74.98918 0 0.2976207 0 0 4095 1 
i 5.673405 80.82116 0.5378755 47 76.19673 0 0.3345696 0 0 4095 1 
i 5.796096 80.82116 0.5378755 41 76.39799 0 0.3407278 0 0 4095 1 
i 8.138376 80.86567 0.5378755 90 82.89392 0 0.4582925 0 0 4095 1 
i 8.322412 80.86567 0.5378755 90 83.19581 0 0.4675297 0 0 4095 1 
i 8.690484 80.86567 0.5378755 93 83.79958 0 0.4860042 0 0 4095 1 
i 2.784594 80.91974 0.5378755 49 70.13216 0 0.1895731 0 0 4095 1 
i 3.398048 80.91974 0.5378755 36 71.13845 0 0.2203639 0 0 4095 1 
i 3.888811 80.91974 0.5378755 53 71.94348 0 0.2449965 0 0 4095 1 
i 4.256884 80.91974 0.6896255 65 72.54725 0 0.263471 0 0 4095 1 
i 6.353782 81.60937 0.5378755 96 82.88453 0 0.3687194 0 0 4095 1 
i 6.905891 81.60937 0.5378755 91 83.79019 0 0.3964311 0 0 4095 1 
i 7.396654 81.60937 0.5378755 98 84.59522 0 0.4210637 0 0 4095 1 
i 7.826072 81.60937 0.5378755 104 85.29962 0 0.4426172 0 0 4095 1 
i 4.569188 81.96211 0.5378755 79 78.63061 0 0.2791463 0 0 4095 1 
i 4.93726 81.96211 0.5378755 79 79.23438 0 0.2976207 0 0 4095 1 
i 5.182642 81.96211 0.5378755 78 79.6369 0 0.309937 0 0 4095 1 
i 5.305333 81.96211 0.6717915 75 79.83816 0 0.3160952 0 0 4095 1 
i 5.673405 81.96211 0.5378755 88 80.44193 0 0.3345696 0 0 4095 1 
i 5.796096 81.96211 0.5378755 85 80.64319 0 0.3407278 0 0 4095 1 
i 6.041478 81.96211 0.5378755 91 81.0457 0 0.3530441 0 0 4095 1 
i 6.40955 81.96211 0.5378755 91 81.64948 0 0.3715185 0 0 4095 1 
i 4.569188 82.09603 0.5378755 57 74.38474 0 0.2791463 0 0 4095 1 
i 4.753224 82.09603 0.5378755 57 74.68662 0 0.2883835 0 0 4095 1 
i 4.875915 82.09603 0.5378755 55 74.88788 0 0.2945416 0 0 4095 1 
i 4.93726 82.09603 0.5378755 54 74.98851 0 0.2976207 0 0 4095 1 
i 5.61206 82.09603 0.5378755 76 76.09543 0 0.3314906 0 0 4095 1 
i 5.673405 82.09603 0.5378755 73 76.19606 0 0.3345696 0 0 4095 1 
i 5.796096 82.09603 0.5378755 76 76.39732 0 0.3407278 0 0 4095 1 
i 2.784594 82.25256 0.5378755 43 70.13149 0 0.1895731 0 0 4095 1 
i 2.96863 82.25256 0.5378755 43 70.43338 0 0.1988104 0 0 4095 1 
i 3.336703 82.25256 0.5378755 51 71.03715 0 0.2172848 0 0 4095 1 
i 3.398048 82.25256 0.5378755 54 71.13778 0 0.2203639 0 0 4095 1 
i 3.827466 82.25256 0.5378755 37 71.84218 0 0.2419174 0 0 4095 1 
i 3.888811 82.25256 0.5378755 40 71.94281 0 0.2449965 0 0 4095 1 
i 4.256884 82.25256 0.5378755 31 72.54658 0 0.263471 0 0 4095 1 
i 4.44092 82.25256 0.5378755 31 72.84847 0 0.2727082 0 0 4095 1 
i 8.138376 82.3397 0.5378755 83 82.89325 0 0.4582925 0 0 4095 1 
i 8.874521 82.3397 0.5378755 75 84.1008 0 0.4952414 0 0 4095 1 
i 6.353782 82.40054 0.5378755 76 78.64 0 0.3687194 0 0 4095 1 
i 6.353782 82.92101 0.5378755 97 82.88386 0 0.3687194 0 0 4095 1 
i 6.967236 82.92101 0.7931413 91 83.89015 0 0.3995101 0 0 4095 1 
i 7.457999 82.92101 0.5378755 98 84.69518 0 0.4241428 0 0 4095 1 
i 7.826072 82.92101 0.5378755 106 85.29895 0 0.4426172 0 0 4095 1 
i 4.569188 83.17627 0.5378755 79 78.62994 0 0.2791463 0 0 4095 1 
i 4.753224 83.17627 0.5378755 79 78.93182 0 0.2883835 0 0 4095 1 
i 4.875915 83.17627 0.5378755 82 79.13308 0 0.2945416 0 0 4095 1 
i 4.93726 83.17627 0.5378755 79 79.23371 0 0.2976207 0 0 4095 1 
i 5.121297 83.17627 0.5378755 76 79.5356 0 0.3068579 0 0 4095 1 
i 5.182642 83.17627 0.5378755 78 79.63623 0 0.309937 0 0 4095 1 
i 5.305333 83.17627 0.5378755 76 79.83748 0 0.3160952 0 0 4095 1 
i 5.489369 83.17627 0.5378755 76 80.13937 0 0.3253324 0 0 4095 1 
i 5.61206 83.17627 0.5378755 86 80.34063 0 0.3314906 0 0 4095 1 
i 5.673405 83.17627 0.5378755 88 80.44126 0 0.3345696 0 0 4095 1 
i 5.796096 83.17627 0.5378755 86 80.64252 0 0.3407278 0 0 4095 1 
i 5.980132 83.17627 0.5378755 86 80.9444 0 0.349965 0 0 4095 1 
i 6.041478 83.17627 0.5378755 88 81.04503 0 0.3530441 0 0 4095 1 
i 6.225514 83.17627 0.5378755 88 81.34692 0 0.3622813 0 0 4095 1 
i 6.40955 83.17627 0.5378755 92 81.64881 0 0.3715185 0 0 4095 1 
i 2.784594 83.58666 0.7381345 46 70.10667 0 0.1895731 0 0 4095 1 
i 6.88916 83.58666 0.7171673 58 70.10667 0 0.3955913 0 0 4095 1 
i 8.138376 83.62011 0.5378755 99 82.89258 0 0.4582925 0 0 4095 1 
i 8.445103 83.62011 0.5378755 93 83.39572 0 0.4736879 0 0 4095 1 
i 8.690484 83.62011 0.5378755 104 83.79824 0 0.4860042 0 0 4095 1 
i 8.874521 83.62011 0.5378755 111 84.10013 0 0.4952414 0 0 4095 1 
i 3.520739 83.78692 0.5378755 43 71.33836 0 0.226522 0 0 4095 1 
i 4.011502 83.78692 0.5378755 50 72.1434 0 0.2511547 0 0 4095 1 
i 6.353782 83.80608 0.5378755 78 78.63933 0 0.3687194 0 0 4095 1 
i 7.396654 83.80608 0.5378755 67 80.35002 0 0.4210637 0 0 4095 1 
i 4.569188 83.87058 0.5378755 60 74.38407 0 0.2791463 0 0 4095 1 
i 6.041478 83.87058 0.5378755 52 76.79916 0 0.3530441 0 0 4095 1 
i 6.353782 84.14045 0.5378755 96 82.88319 0 0.3687194 0 0 4095 1 
i 6.537818 84.14045 0.5378755 96 83.18507 0 0.3779566 0 0 4095 1 
i 6.905891 84.14045 0.5378755 91 83.78885 0 0.3964311 0 0 4095 1 
i 6.967236 84.14045 0.5378755 90 83.88948 0 0.3995101 0 0 4095 1 
i 7.396654 84.14045 0.5378755 101 84.59388 0 0.4210637 0 0 4095 1 
i 7.457999 84.14045 0.5378755 100 84.69451 0 0.4241428 0 0 4095 1 
i 7.826072 84.14045 0.5378755 103 85.29828 0 0.4426172 0 0 4095 1 
i 8.010108 84.14045 0.7913061 107 85.60017 0 0.4518544 0 0 4095 1 
i 8.138376 84.93175 0.5378755 86 82.89191 0 0.4582925 0 0 4095 1 
i 8.506448 84.93175 0.5378755 86 83.49568 0 0.476767 0 0 4095 1 
i 8.75183 84.93175 0.5378755 80 83.8982 0 0.4890833 0 0 4095 1 
i 8.874521 84.93175 0.5378755 78 84.09945 0 0.4952414 0 0 4095 1 
i 2.784594 85.11974 0.5378755 45 70.13015 0 0.1895731 0 0 4095 1 
i 3.091321 85.11974 0.5378755 51 70.63329 0 0.2049685 0 0 4095 1 
i 3.336703 85.11974 0.5378755 45 71.03581 0 0.2172848 0 0 4095 1 
i 3.520739 85.11974 0.5378755 37 71.33769 0 0.226522 0 0 4095 1 
i 3.827466 85.11974 0.5378755 59 71.84084 0 0.2419174 0 0 4095 1 
i 4.011502 85.11974 0.5378755 55 72.14273 0 0.2511547 0 0 4095 1 
i 4.256884 85.11974 0.5378755 61 72.54524 0 0.263471 0 0 4095 1 
i 4.563611 85.11974 0.5378755 67 73.04839 0 0.2788663 0 0 4095 1 
i 2.784594 85.20304 0.7171673 51 70.106 0 0.1895731 0 0 4095 1 
i 6.88916 85.20304 0.7171673 63 70.106 0 0.3955913 0 0 4095 1 
i 4.569188 85.2092 0.5378755 60 74.3834 0 0.2791463 0 0 4095 1 
i 5.121297 85.2092 0.5378755 64 75.28906 0 0.3068579 0 0 4095 1 
i 5.61206 85.2092 0.5378755 58 76.09409 0 0.3314906 0 0 4095 1 
i 6.041478 85.2092 0.5378755 52 76.79849 0 0.3530441 0 0 4095 1 
i 6.353782 85.2459 0.5378755 72 78.63866 0 0.3687194 0 0 4095 1 
i 7.457999 85.2459 0.5378755 91 80.44998 0 0.4241428 0 0 4095 1 
i 6.353782 85.54429 0.5378755 91 82.88252 0 0.3687194 0 0 4095 1 
i 7.089927 85.54429 0.5378755 91 84.09006 0 0.4056683 0 0 4095 1 
i 7.58069 85.54429 0.5378755 98 84.89509 0 0.4303009 0 0 4095 1 
i 7.826072 85.54429 0.6069031 104 85.29761 0 0.4426172 0 0 4095 1 
i 8.138376 86.15119 0.5378755 87 82.89124 0 0.4582925 0 0 4095 1 
i 8.322412 86.15119 0.5378755 83 83.19312 0 0.4675297 0 0 4095 1 
i 8.445103 86.15119 0.5378755 86 83.39438 0 0.4736879 0 0 4095 1 
i 8.506448 86.15119 0.5378755 87 83.49501 0 0.476767 0 0 4095 1 
i 8.690484 86.15119 0.5378755 80 83.7969 0 0.4860042 0 0 4095 1 
i 8.75183 86.15119 0.5378755 81 83.89753 0 0.4890833 0 0 4095 1 
i 8.874521 86.15119 0.5378755 80 84.09878 0 0.4952414 0 0 4095 1 
i 9.058557 86.15119 0.5378755 80 84.40067 0 0.5044787 0 0 4095 1 
i 2.784594 86.48507 0.5378755 43 70.12948 0 0.1895731 0 0 4095 1 
i 3.152666 86.48507 0.5378755 43 70.73325 0 0.2080476 0 0 4095 1 
i 3.398048 86.48507 0.5378755 49 71.13577 0 0.2203639 0 0 4095 1 
i 3.520739 86.48507 0.5378755 55 71.33702 0 0.226522 0 0 4095 1 
i 3.888811 86.48507 0.5378755 31 71.9408 0 0.2449965 0 0 4095 1 
i 4.011502 86.48507 0.5378755 37 72.14205 0 0.2511547 0 0 4095 1 
i 4.256884 86.48507 0.5378755 28 72.54457 0 0.263471 0 0 4095 1 
i 4.624956 86.48507 0.5378755 28 73.14834 0 0.2819454 0 0 4095 1 
i 4.569188 86.58046 0.5378755 61 74.38273 0 0.2791463 0 0 4095 1 
i 5.182642 86.58046 0.5378755 52 75.38901 0 0.309937 0 0 4095 1 
i 5.673405 86.58046 0.5378755 70 76.19405 0 0.3345696 0 0 4095 1 
i 6.041478 86.58046 0.5378755 82 76.79782 0 0.3530441 0 0 4095 1 
i 6.353782 86.58452 0.5378755 79 78.63799 0 0.3687194 0 0 4095 1 
i 6.537818 86.58452 0.5378755 79 78.93987 0 0.3779566 0 0 4095 1 
i 7.396654 86.58452 0.5378755 62 80.34868 0 0.4210637 0 0 4095 1 
i 7.457999 86.58452 0.5378755 59 80.44931 0 0.4241428 0 0 4095 1 
i 6.353782 86.76373 0.5378755 93 82.88184 0 0.3687194 0 0 4095 1 
i 6.660509 86.76373 0.5378755 96 83.38499 0 0.3841148 0 0 4095 1 
i 6.905891 86.76373 0.5378755 93 83.78751 0 0.3964311 0 0 4095 1 
i 7.089927 86.76373 0.5378755 90 84.08939 0 0.4056683 0 0 4095 1 
i 7.396654 86.76373 0.5378755 103 84.59254 0 0.4210637 0 0 4095 1 
i 7.58069 86.76373 0.5378755 100 84.89442 0 0.4303009 0 0 4095 1 
i 7.826072 86.76373 0.5378755 101 85.29694 0 0.4426172 0 0 4095 1 
i 8.132799 86.76373 0.5378755 107 85.80008 0 0.4580126 0 0 4095 1 
i 2.784594 86.85884 0.7171673 49 70.10532 0 0.1895731 0 0 4095 1 
i 6.88916 86.85884 0.8955789 61 70.10532 0 0.3955913 0 0 4095 1 
i 2.784594 87.75441 0.5378755 43 70.12881 0 0.1895731 0 0 4095 1 
i 3.091321 87.75441 0.5378755 46 70.63195 0 0.2049685 0 0 4095 1 
i 3.336703 87.75441 0.5378755 43 71.03447 0 0.2172848 0 0 4095 1 
i 3.827466 87.75441 0.5378755 50 71.8395 0 0.2419174 0 0 4095 1 
i 4.011502 87.75441 0.5378755 50 72.14138 0 0.2511547 0 0 4095 1 
i 4.195539 87.75441 0.5378755 46 72.44327 0 0.2603919 0 0 4095 1 
i 4.624956 87.75441 0.5378755 52 73.14767 0 0.2819454 0 0 4095 1 
i 4.569188 87.85533 0.5378755 55 74.38205 0 0.2791463 0 0 4095 1 
i 4.753224 87.85533 0.5378755 55 74.68394 0 0.2883835 0 0 4095 1 
i 5.121297 87.85533 0.5378755 67 75.28771 0 0.3068579 0 0 4095 1 
i 5.182642 87.85533 0.5378755 69 75.38834 0 0.309937 0 0 4095 1 
i 5.61206 87.85533 0.5378755 53 76.09275 0 0.3314906 0 0 4095 1 
i 5.673405 87.85533 0.5378755 55 76.19338 0 0.3345696 0 0 4095 1 
i 6.041478 87.85533 0.5378755 43 76.79715 0 0.3530441 0 0 4095 1 
i 6.225514 87.85533 0.5378755 43 77.09904 0 0.3622813 0 0 4095 1 
i 6.353782 88.01291 0.5378755 91 82.88117 0 0.3687194 0 0 4095 1 
i 6.721854 88.01291 0.5378755 96 83.48495 0 0.3871938 0 0 4095 1 
i 6.967236 88.01291 0.5378755 93 83.88746 0 0.3995101 0 0 4095 1 
i 7.089927 88.01291 0.5378755 91 84.08872 0 0.4056683 0 0 4095 1 
i 7.457999 88.01291 0.5378755 103 84.69249 0 0.4241428 0 0 4095 1 
i 7.58069 88.01291 0.5378755 101 84.89375 0 0.4303009 0 0 4095 1 
i 7.826072 88.01291 0.5378755 103 85.29627 0 0.4426172 0 0 4095 1 
i 8.194144 88.01291 0.5378755 107 85.90004 0 0.4610917 0 0 4095 1 
i 6.353782 88.12555 0.5378755 73 78.63732 0 0.3687194 0 0 4095 1 
i 7.58069 88.12555 0.5378755 83 80.6499 0 0.4303009 0 0 4095 1 
i 2.784594 88.39824 0.7171673 51 70.10465 0 0.1895731 0 0 4095 1 
i 2.96863 88.39824 0.7171673 51 70.40654 0 0.1988104 0 0 4095 1 
i 6.88916 88.39824 0.7171673 63 70.10465 0 0.3955913 0 0 4095 1 
i 7.073196 88.39824 0.7171673 63 70.40654 0 0.4048286 0 0 4095 1 
i 8.138376 88.43227 0.7420086 91 82.89057 0 0.4582925 0 0 4095 1 
i 6.353782 89.17428 0.5378755 91 82.8805 0 0.3687194 0 0 4095 1 
i 6.537818 89.17428 0.5378755 91 83.18239 0 0.3779566 0 0 4095 1 
i 6.660509 89.17428 0.5378755 97 83.38365 0 0.3841148 0 0 4095 1 
i 6.721854 89.17428 0.5378755 96 83.48428 0 0.3871938 0 0 4095 1 
i 6.905891 89.17428 0.5378755 91 83.78616 0 0.3964311 0 0 4095 1 
i 6.967236 89.17428 0.5378755 94 83.88679 0 0.3995101 0 0 4095 1 
i 7.089927 89.17428 0.5378755 91 84.08805 0 0.4056683 0 0 4095 1 
i 7.273963 89.17428 0.5378755 91 84.38994 0 0.4149055 0 0 4095 1 
i 7.396654 89.17428 0.5378755 101 84.59119 0 0.4210637 0 0 4095 1 
i 7.457999 89.17428 0.5378755 100 84.69182 0 0.4241428 0 0 4095 1 
i 7.58069 89.17428 0.5378755 98 84.89308 0 0.4303009 0 0 4095 1 
i 7.764726 89.17428 0.5378755 98 85.19497 0 0.4395381 0 0 4095 1 
i 7.826072 89.17428 0.5378755 104 85.2956 0 0.4426172 0 0 4095 1 
i 8.010108 89.17428 0.5378755 104 85.59748 0 0.4518544 0 0 4095 1 
i 8.132799 89.17428 0.5378755 106 85.79874 0 0.4580126 0 0 4095 1 
i 8.194144 89.17428 0.5378755 107 85.89937 0 0.4610917 0 0 4095 1 
i 4.569188 89.32298 0.5378755 60 74.38138 0 0.2791463 0 0 4095 1 
i 5.305333 89.32298 0.5378755 60 75.58893 0 0.3160952 0 0 4095 1 
i 5.796096 89.32298 0.5378755 62 76.39396 0 0.3407278 0 0 4095 1 
i 6.041478 89.32298 0.5378755 64 76.79648 0 0.3530441 0 0 4095 1 
i 6.353782 89.46416 0.5378755 73 78.63665 0 0.3687194 0 0 4095 1 
i 6.660509 89.46416 0.5378755 67 79.13979 0 0.3841148 0 0 4095 1 
i 7.396654 89.46416 0.5378755 83 80.34734 0 0.4210637 0 0 4095 1 
i 7.58069 89.46416 0.5378755 88 80.64922 0 0.4303009 0 0 4095 1 
i 8.138376 89.77671 0.5378755 90 82.8899 0 0.4582925 0 0 4095 1 
i 9.181248 89.77671 0.5378755 83 84.60059 0 0.5106368 0 0 4095 1 
i 2.784594 90.17043 0.7171673 51 70.10398 0 0.1895731 0 0 4095 1 
i 6.88916 90.17043 0.7171673 63 70.10398 0 0.3955913 0 0 4095 1 
i 4.569188 90.59785 0.5378755 61 74.38071 0 0.2791463 0 0 4095 1 
i 4.875915 90.59785 0.5378755 63 74.88386 0 0.2945416 0 0 4095 1 
i 5.121297 90.59785 0.5378755 57 75.28637 0 0.3068579 0 0 4095 1 
i 5.305333 90.59785 0.5378755 54 75.58826 0 0.3160952 0 0 4095 1 
i 5.61206 90.59785 0.5378755 76 76.0914 0 0.3314906 0 0 4095 1 
i 5.796096 90.59785 0.5378755 67 76.39329 0 0.3407278 0 0 4095 1 
i 6.041478 90.59785 0.5378755 77 76.79581 0 0.3530441 0 0 4095 1 
i 6.348205 90.59785 0.775453 79 77.29895 0 0.3684395 0 0 4095 1 
i 6.721854 90.83542 0.5378755 88 79.23975 0 0.3871938 0 0 4095 1 
i 7.457999 90.83542 0.5378755 64 80.4473 0 0.4241428 0 0 4095 1 
i 7.58069 90.83542 0.5378755 53 80.64855 0 0.4303009 0 0 4095 1 
i 8.138376 91.15393 0.5378755 87 82.88922 0 0.4582925 0 0 4095 1 
i 9.242593 91.15393 0.5559067 107 84.70055 0 0.5137159 0 0 4095 1 
i 2.784594 91.70983 0.7171673 48 70.10331 0 0.1895731 0 0 4095 1 
i 3.091321 91.70983 0.7171673 54 70.60646 0 0.2049685 0 0 4095 1 
i 6.88916 91.70983 0.7171673 60 70.10331 0 0.3955913 0 0 4095 1 
i 7.195887 91.70983 0.7171673 66 70.60646 0 0.4109867 0 0 4095 1 
i 4.569188 91.90381 0.5378755 60 74.38004 0 0.2791463 0 0 4095 1 
i 4.93726 91.90381 0.5378755 55 74.98382 0 0.2976207 0 0 4095 1 
i 5.182642 91.90381 0.5378755 66 75.38633 0 0.309937 0 0 4095 1 
i 5.305333 91.90381 0.5378755 67 75.58759 0 0.3160952 0 0 4095 1 
i 5.673405 91.90381 0.5378755 47 76.19136 0 0.3345696 0 0 4095 1 
i 5.796096 91.90381 0.5378755 53 76.39262 0 0.3407278 0 0 4095 1 
i 6.041478 91.90381 0.5378755 43 76.79514 0 0.3530441 0 0 4095 1 
i 6.40955 91.90381 0.5378755 40 77.39891 0 0.3715185 0 0 4095 1 
i 6.353782 92.11029 0.5378755 73 78.6353 0 0.3687194 0 0 4095 1 
i 6.537818 92.11029 0.5378755 73 78.93719 0 0.3779566 0 0 4095 1 
i 6.660509 92.11029 0.5378755 67 79.13845 0 0.3841148 0 0 4095 1 
i 6.721854 92.11029 0.5378755 69 79.23908 0 0.3871938 0 0 4095 1 
i 7.396654 92.11029 0.5378755 88 80.346 0 0.4210637 0 0 4095 1 
i 7.457999 92.11029 0.5378755 85 80.44662 0 0.4241428 0 0 4095 1 
i 7.58069 92.11029 0.5378755 88 80.64788 0 0.4303009 0 0 4095 1 
i 7.764726 92.11029 0.5378755 91 80.94977 0 0.4395381 0 0 4095 1 
i 8.138376 92.43434 0.5378755 91 82.88855 0 0.4582925 0 0 4095 1 
i 8.322412 92.43434 0.5378755 96 83.19044 0 0.4675297 0 0 4095 1 
i 9.181248 92.43434 0.5378755 74 84.59925 0 0.5106368 0 0 4095 1 
i 9.242593 92.43434 0.683631 76 84.69987 0 0.5137159 0 0 4095 1 
i 4.569188 93.11797 0.5378755 60 74.37937 0 0.2791463 0 0 4095 1 
i 5.121297 93.11797 0.5378755 60 75.28503 0 0.3068579 0 0 4095 1 
i 5.305333 93.11797 0.5378755 60 75.58692 0 0.3160952 0 0 4095 1 
i 5.61206 93.11797 0.5378755 62 76.09006 0 0.3314906 0 0 4095 1 
i 6.041478 93.11797 0.8859817 64 76.79447 0 0.3530441 0 0 4095 1 
i 6.225514 93.11797 0.5378755 64 77.09635 0 0.3622813 0 0 4095 1 
i 2.784594 93.28678 0.7171673 51 70.10264 0 0.1895731 0 0 4095 1 
i 3.152666 93.28678 0.7171673 54 70.70642 0 0.2080476 0 0 4095 1 
i 7.257232 93.28678 1.135939 66 70.70642 0 0.4140658 0 0 4095 1 
i 6.353782 93.88485 0.5378755 75 78.63463 0 0.3687194 0 0 4095 1 
i 8.138376 93.90837 0.5378755 90 82.88788 0 0.4582925 0 0 4095 1 
i 9.365284 93.90837 0.8445096 100 84.90046 0 0.519874 0 0 4095 1 
i 2.784594 94.75288 0.7171673 51 70.10197 0 0.1895731 0 0 4095 1 
i 2.96863 94.75288 0.7171673 51 70.40386 0 0.1988104 0 0 4095 1 
i 3.091321 94.75288 0.7171673 52 70.60512 0 0.2049685 0 0 4095 1 
i 3.152666 94.75288 0.7171673 55 70.70574 0 0.2080476 0 0 4095 1 
i 6.88916 94.75288 0.7171673 63 70.10197 0 0.3955913 0 0 4095 1 
i 7.073196 94.75288 0.7171673 63 70.40386 0 0.4048286 0 0 4095 1 
i 7.195887 94.75288 0.7171673 64 70.60512 0 0.4109867 0 0 4095 1 
i 7.257232 94.75288 1.008452 67 70.70574 0 0.4140658 0 0 4095 1 
i 8.138376 95.18879 0.5378755 90 82.88721 0 0.4582925 0 0 4095 1 
i 8.445103 95.18879 0.5378755 84 83.39036 0 0.4736879 0 0 4095 1 
i 9.181248 95.18879 0.5378755 100 84.5979 0 0.5106368 0 0 4095 1 
i 9.365284 95.18879 0.5378755 100 84.89979 0 0.519874 0 0 4095 1 
i 6.353782 95.22346 0.5378755 76 78.63396 0 0.3687194 0 0 4095 1 
i 6.905891 95.22346 0.5378755 79 79.53962 0 0.3964311 0 0 4095 1 
i 7.396654 95.22346 1.276966 74 80.34465 0 0.4210637 0 0 4095 1 
i 8.138376 96.50043 0.5378755 91 82.88654 0 0.4582925 0 0 4095 1 
i 8.506448 96.50043 0.5378755 100 83.49031 0 0.476767 0 0 4095 1 
i 9.242593 96.50043 0.5378755 76 84.69786 0 0.5137159 0 0 4095 1 
i 9.365284 96.50043 0.5378755 70 84.89912 0 0.519874 0 0 4095 1 
i 6.353782 96.59472 0.5378755 78 78.63329 0 0.3687194 0 0 4095 1 
i 6.967236 96.59472 0.5378755 64 79.63958 0 0.3995101 0 0 4095 1 
i 7.457999 96.59472 0.5378755 82 80.44461 0 0.4241428 0 0 4095 1 
i 7.826072 96.59472 0.5378755 94 81.04839 0 0.4426172 0 0 4095 1 
i 2.784594 96.79362 0.7171673 49 70.1013 0 0.1895731 0 0 4095 1 
i 6.88916 96.79362 0.9262441 61 70.1013 0 0.3955913 0 0 4095 1 
i 8.138376 97.71987 0.5378755 85 82.88587 0 0.4582925 0 0 4095 1 
i 8.322412 97.71987 0.5378755 85 83.18776 0 0.4675297 0 0 4095 1 
i 8.445103 97.71987 0.5378755 84 83.38901 0 0.4736879 0 0 4095 1 
i 8.506448 97.71987 0.5378755 81 83.48964 0 0.476767 0 0 4095 1 
i 9.181248 97.71987 0.5378755 103 84.59656 0 0.5106368 0 0 4095 1 
i 9.242593 97.71987 0.5378755 101 84.69719 0 0.5137159 0 0 4095 1 
i 9.365284 97.71987 0.5378755 103 84.89845 0 0.519874 0 0 4095 1 
i 9.54932 97.71987 0.5378755 103 85.20034 0 0.5291113 0 0 4095 1 
i 6.353782 97.86959 0.5378755 72 78.63262 0 0.3687194 0 0 4095 1 
i 6.537818 97.86959 0.5378755 72 78.93451 0 0.3779566 0 0 4095 1 
i 6.905891 97.86959 0.5378755 79 79.53828 0 0.3964311 0 0 4095 1 
i 6.967236 97.86959 0.5378755 81 79.63891 0 0.3995101 0 0 4095 1 
i 7.396654 97.86959 0.5378755 70 80.34331 0 0.4210637 0 0 4095 1 
i 7.457999 97.86959 0.5378755 67 80.44394 0 0.4241428 0 0 4095 1 
i 7.826072 97.86959 0.5378755 64 81.04771 0 0.4426172 0 0 4095 1 
i 8.010108 97.86959 0.5378755 59 81.3496 0 0.4518544 0 0 4095 1 
i 2.784594 98.33302 0.7171673 51 70.10063 0 0.1895731 0 0 4095 1 
i 3.336703 98.33302 0.7171673 54 71.00629 0 0.2172848 0 0 4095 1 
i 6.88916 98.33302 0.7171673 63 70.10063 0 0.3955913 0 0 4095 1 
i 7.441269 98.33302 0.8126654 66 71.00629 0 0.423303 0 0 4095 1 
i 6.353782 99.14569 0.7171673 75 78.6078 0 0.3687194 0 0 4095 1 
i 10.45835 99.14569 0.7171673 87 78.6078 0 0.5747376 0 0 4095 1 
i 6.353782 99.33724 0.5378755 76 78.63195 0 0.3687194 0 0 4095 1 
i 7.089927 99.33724 0.5378755 76 79.8395 0 0.4056683 0 0 4095 1 
i 7.58069 99.33724 0.5378755 77 80.64453 0 0.4303009 0 0 4095 1 
i 7.826072 99.33724 0.5378755 76 81.04704 0 0.4426172 0 0 4095 1 
i 8.138376 99.41727 0.5378755 87 82.8852 0 0.4582925 0 0 4095 1 
i 9.610666 99.41727 0.5378755 79 85.30029 0 0.5321903 0 0 4095 1 
i 2.784594 99.90997 0.7171673 48 70.09996 0 0.1895731 0 0 4095 1 
i 3.398048 99.90997 0.7171673 54 71.10625 0 0.2203639 0 0 4095 1 
i 6.88916 99.90997 0.7171673 60 70.09996 0 0.3955913 0 0 4095 1 
i 7.502614 99.90997 1.240011 66 71.10625 0 0.4263821 0 0 4095 1 
i 6.353782 100.6121 0.5378755 73 78.63128 0 0.3687194 0 0 4095 1 
i 6.660509 100.6121 0.5378755 79 79.13442 0 0.3841148 0 0 4095 1 
i 6.905891 100.6121 0.5378755 73 79.53694 0 0.3964311 0 0 4095 1 
i 7.396654 100.6121 0.5378755 88 80.34197 0 0.4210637 0 0 4095 1 
i 7.58069 100.6121 0.5378755 83 80.64386 0 0.4303009 0 0 4095 1 
i 7.826072 100.6121 0.5378755 89 81.04637 0 0.4426172 0 0 4095 1 
i 8.132799 100.6121 0.5378755 95 81.54952 0 0.4580126 0 0 4095 1 
i 6.353782 100.6918 0.7171673 79 78.60713 0 0.3687194 0 0 4095 1 
i 10.45835 100.6918 0.7171673 91 78.60713 0 0.5747376 0 0 4095 1 
i 8.138376 100.6977 0.5378755 88 82.88453 0 0.4582925 0 0 4095 1 
i 8.690484 100.6977 0.5378755 91 83.79019 0 0.4860042 0 0 4095 1 
i 9.181248 100.6977 0.5378755 86 84.59522 0 0.5106368 0 0 4095 1 
i 9.610666 100.6977 0.6783968 80 85.29962 0 0.5321903 0 0 4095 1 
i 2.784594 101.3761 0.7171673 49 70.09929 0 0.1895731 0 0 4095 1 
i 2.96863 101.3761 0.7171673 49 70.40117 0 0.1988104 0 0 4095 1 
i 3.336703 101.3761 0.7171673 57 71.00495 0 0.2172848 0 0 4095 1 
i 3.398048 101.3761 0.7171673 55 71.10558 0 0.2203639 0 0 4095 1 
i 6.88916 101.3761 0.7171673 61 70.09929 0 0.3955913 0 0 4095 1 
i 7.073196 101.3761 0.7171673 61 70.40117 0 0.4048286 0 0 4095 1 
i 7.441269 101.3761 0.7171673 69 71.00495 0 0.423303 0 0 4095 1 
i 7.502614 101.3761 0.7171673 67 71.10558 0 0.4263821 0 0 4095 1 
i 6.353782 101.9181 0.5378755 75 78.63061 0 0.3687194 0 0 4095 1 
i 6.721854 101.9181 0.5378755 67 79.23438 0 0.3871938 0 0 4095 1 
i 6.967236 101.9181 0.5378755 78 79.6369 0 0.3995101 0 0 4095 1 
i 7.089927 101.9181 0.5378755 84 79.83816 0 0.4056683 0 0 4095 1 
i 7.457999 101.9181 0.5378755 64 80.44193 0 0.4241428 0 0 4095 1 
i 7.58069 101.9181 0.5378755 65 80.64319 0 0.4303009 0 0 4095 1 
i 7.826072 101.9181 0.5378755 55 81.0457 0 0.4426172 0 0 4095 1 
i 8.194144 101.9181 0.5378755 52 81.64948 0 0.4610917 0 0 4095 1 
i 8.138376 102.0093 0.5378755 90 82.88386 0 0.4582925 0 0 4095 1 
i 8.75183 102.0093 0.5378755 79 83.89015 0 0.4890833 0 0 4095 1 
i 9.242593 102.0093 0.5378755 98 84.69518 0 0.5137159 0 0 4095 1 
i 9.610666 102.0093 0.5378755 110 85.29895 0 0.5321903 0 0 4095 1 
i 6.353782 102.2756 0.7171673 76 78.60646 0 0.3687194 0 0 4095 1 
i 10.45835 102.2756 0.7882817 88 78.60646 0 0.5747376 0 0 4095 1 
i 2.784594 103.0639 0.7171673 51 70.09862 0 0.1895731 0 0 4095 1 
i 3.520739 103.0639 0.7171673 58 71.30616 0 0.226522 0 0 4095 1 
i 6.88916 103.0639 0.7171673 63 70.09862 0 0.3955913 0 0 4095 1 
i 7.625305 103.0639 0.7171673 66 71.30616 0 0.4325402 0 0 4095 1 
i 6.353782 103.1322 0.5378755 76 78.62994 0 0.3687194 0 0 4095 1 
i 6.660509 103.1322 0.5378755 78 79.13308 0 0.3841148 0 0 4095 1 
i 7.089927 103.1322 0.5378755 76 79.83748 0 0.4056683 0 0 4095 1 
i 7.273963 103.1322 0.5378755 76 80.13937 0 0.4149055 0 0 4095 1 
i 7.396654 103.1322 0.5378755 77 80.34063 0 0.4210637 0 0 4095 1 
i 7.826072 103.1322 0.5378755 76 81.04503 0 0.4426172 0 0 4095 1 
i 8.010108 103.1322 0.5378755 76 81.34692 0 0.4518544 0 0 4095 1 
i 8.138376 103.2288 0.5378755 87 82.88319 0 0.4582925 0 0 4095 1 
i 8.322412 103.2288 0.5378755 87 83.18507 0 0.4675297 0 0 4095 1 
i 8.690484 103.2288 0.5378755 91 83.78885 0 0.4860042 0 0 4095 1 
i 8.75183 103.2288 0.5378755 97 83.88948 0 0.4890833 0 0 4095 1 
i 9.181248 103.2288 0.5378755 82 84.59388 0 0.5106368 0 0 4095 1 
i 9.242593 103.2288 0.5378755 88 84.69451 0 0.5137159 0 0 4095 1 
i 9.610666 103.2288 0.5378755 76 85.29828 0 0.5321903 0 0 4095 1 
i 9.794702 103.2288 0.5378755 76 85.60017 0 0.5414276 0 0 4095 1 
i 1 103.4562 0.5378755 51 70.10667 0 0.1 0 0 4095 1 
i 5.104566 103.4562 0.5378755 63 70.10667 0 0.3060182 0 0 4095 1 
i 6.353782 103.7481 0.7171673 78 78.60579 0 0.3687194 0 0 4095 1 
i 6.537818 103.7481 0.7171673 78 78.90767 0 0.3779566 0 0 4095 1 
i 10.45835 103.7481 0.7171673 90 78.60579 0 0.5747376 0 0 4095 1 
i 10.64238 103.7481 0.7819074 90 78.90767 0 0.5839748 0 0 4095 1 
i 2.784594 104.53 0.7171673 51 70.09795 0 0.1895731 0 0 4095 1 
i 3.091321 104.53 0.7171673 49 70.60109 0 0.2049685 0 0 4095 1 
i 3.336703 104.53 0.7171673 55 71.00361 0 0.2172848 0 0 4095 1 
i 3.520739 104.53 0.7171673 58 71.30549 0 0.226522 0 0 4095 1 
i 6.88916 104.53 0.7171673 63 70.09795 0 0.3955913 0 0 4095 1 
i 7.195887 104.53 0.7171673 61 70.60109 0 0.4109867 0 0 4095 1 
i 7.441269 104.53 0.7171673 67 71.00361 0 0.423303 0 0 4095 1 
i 7.625305 104.53 0.7171673 67 71.30549 0 0.4325402 0 0 4095 1 
i 8.138376 104.6326 0.5378755 91 82.88252 0 0.4582925 0 0 4095 1 
i 8.874521 104.6326 0.5378755 88 84.09006 0 0.4952414 0 0 4095 1 
i 9.365284 104.6326 0.5378755 89 84.89509 0 0.519874 0 0 4095 1 
i 9.610666 104.6326 0.5378755 92 85.29761 0 0.5321903 0 0 4095 1 
i 1 105.0726 0.5378755 56 70.106 0 0.1 0 0 4095 1 
i 5.104566 105.0726 0.5378755 68 70.106 0 0.3060182 0 0 4095 1 
i 6.353782 105.4432 0.7171673 79 78.60512 0 0.3687194 0 0 4095 1 
i 10.45835 105.4432 0.7171673 91 78.60512 0 0.5747376 0 0 4095 1 
i 8.138376 105.852 0.5378755 90 82.88184 0 0.4582925 0 0 4095 1 
i 8.445103 105.852 0.5378755 91 83.38499 0 0.4736879 0 0 4095 1 
i 8.690484 105.852 0.5378755 85 83.78751 0 0.4860042 0 0 4095 1 
i 8.874521 105.852 0.5378755 81 84.08939 0 0.4952414 0 0 4095 1 
i 9.181248 105.852 0.5378755 103 84.59254 0 0.5106368 0 0 4095 1 
i 9.365284 105.852 0.5378755 100 84.89442 0 0.519874 0 0 4095 1 
i 9.610666 105.852 0.5378755 106 85.29694 0 0.5321903 0 0 4095 1 
i 9.917393 105.852 0.5378755 112 85.80008 0 0.5475857 0 0 4095 1 
i 2.784594 106.0318 0.7171673 52 70.09727 0 0.1895731 0 0 4095 1 
i 3.152666 106.0318 0.7171673 49 70.70105 0 0.2080476 0 0 4095 1 
i 3.398048 106.0318 0.7171673 55 71.10356 0 0.2203639 0 0 4095 1 
i 3.520739 106.0318 0.7171673 57 71.30482 0 0.226522 0 0 4095 1 
i 6.88916 106.0318 0.7171673 64 70.09727 0 0.3955913 0 0 4095 1 
i 7.257232 106.0318 0.7171673 61 70.70105 0 0.4140658 0 0 4095 1 
i 7.502614 106.0318 0.7171673 67 71.10356 0 0.4263821 0 0 4095 1 
i 7.625305 106.0318 0.7171673 69 71.30482 0 0.4325402 0 0 4095 1 
i 1 106.7284 0.5378755 54 70.10532 0 0.1 0 0 4095 1 
i 5.104566 106.7284 0.5378755 66 70.10532 0 0.3060182 0 0 4095 1 
i 6.353782 106.9157 0.7171673 81 78.60444 0 0.3687194 0 0 4095 1 
i 6.660509 106.9157 0.7171673 82 79.10759 0 0.3841148 0 0 4095 1 
i 10.45835 106.9157 0.7171673 88 78.60444 0 0.5747376 0 0 4095 1 
i 10.76507 106.9157 0.7171673 94 79.10759 0 0.590133 0 0 4095 1 
i 8.138376 107.1012 0.5378755 87 82.88117 0 0.4582925 0 0 4095 1 
i 8.506448 107.1012 0.5378755 84 83.48495 0 0.476767 0 0 4095 1 
i 8.75183 107.1012 0.5378755 93 83.88746 0 0.4890833 0 0 4095 1 
i 8.874521 107.1012 0.5378755 99 84.08872 0 0.4952414 0 0 4095 1 
i 9.242593 107.1012 0.5378755 76 84.69249 0 0.5137159 0 0 4095 1 
i 9.365284 107.1012 0.5378755 82 84.89375 0 0.519874 0 0 4095 1 
i 9.610666 107.1012 0.5378755 71 85.29627 0 0.5321903 0 0 4095 1 
i 9.978738 107.1012 0.5378755 67 85.90004 0 0.5506648 0 0 4095 1 
i 2.784594 107.4281 0.7171673 54 70.0966 0 0.1895731 0 0 4095 1 
i 2.96863 107.4281 0.7171673 54 70.39849 0 0.1988104 0 0 4095 1 
i 3.091321 107.4281 0.7171673 52 70.59975 0 0.2049685 0 0 4095 1 
i 3.152666 107.4281 0.7171673 51 70.70038 0 0.2080476 0 0 4095 1 
i 3.336703 107.4281 0.7171673 54 71.00226 0 0.2172848 0 0 4095 1 
i 3.398048 107.4281 0.7171673 57 71.10289 0 0.2203639 0 0 4095 1 
i 3.520739 107.4281 0.7171673 58 71.30415 0 0.226522 0 0 4095 1 
i 3.704775 107.4281 0.7171673 58 71.60604 0 0.2357593 0 0 4095 1 
i 6.88916 107.4281 0.7171673 63 70.0966 0 0.3955913 0 0 4095 1 
i 7.073196 107.4281 0.7171673 66 70.39849 0 0.4048286 0 0 4095 1 
i 7.195887 107.4281 0.7171673 64 70.59975 0 0.4109867 0 0 4095 1 
i 7.257232 107.4281 0.7171673 63 70.70038 0 0.4140658 0 0 4095 1 
i 7.441269 107.4281 0.7171673 66 71.00226 0 0.423303 0 0 4095 1 
i 7.502614 107.4281 0.7171673 64 71.10289 0 0.4263821 0 0 4095 1 
i 7.625305 107.4281 0.7171673 70 71.30415 0 0.4325402 0 0 4095 1 
i 7.809341 107.4281 0.834476 70 71.60604 0 0.4417775 0 0 4095 1 
i 8.138376 108.2626 0.5378755 91 82.8805 0 0.4582925 0 0 4095 1 
i 8.322412 108.2626 0.5378755 88 83.18239 0 0.4675297 0 0 4095 1 
i 9.058557 108.2626 0.5378755 88 84.38994 0 0.5044787 0 0 4095 1 
i 9.181248 108.2626 0.5378755 89 84.59119 0 0.5106368 0 0 4095 1 
i 9.365284 108.2626 0.5378755 89 84.89308 0 0.519874 0 0 4095 1 
i 1 108.2678 0.5378755 56 70.10465 0 0.1 0 0 4095 1 
i 1.184036 108.2678 0.5378755 56 70.40654 0 0.1092372 0 0 4095 1 
i 5.104566 108.2678 0.5378755 68 70.10465 0 0.3060182 0 0 4095 1 
i 5.288602 108.2678 0.5378755 68 70.40654 0 0.3152554 0 0 4095 1 
i 6.353782 108.4241 0.7171673 78 78.60377 0 0.3687194 0 0 4095 1 
i 6.721854 108.4241 0.7171673 82 79.20755 0 0.3871938 0 0 4095 1 
i 10.45835 108.4241 0.7171673 90 78.60377 0 0.5747376 0 0 4095 1 
i 10.82642 108.4241 1.402355 94 79.20755 0 0.593212 0 0 4095 1 
i 6.353782 109.8264 0.7171673 82 78.6031 0 0.3687194 0 0 4095 1 
i 6.537818 109.8264 0.7171673 79 78.90499 0 0.3779566 0 0 4095 1 
i 6.660509 109.8264 0.7171673 81 79.10625 0 0.3841148 0 0 4095 1 
i 6.721854 109.8264 0.7171673 82 79.20688 0 0.3871938 0 0 4095 1 
i 10.45835 109.8264 0.7171673 91 78.6031 0 0.5747376 0 0 4095 1 
i 10.64238 109.8264 0.7171673 91 78.90499 0 0.5839748 0 0 4095 1 
i 10.76507 109.8264 0.7171673 93 79.10625 0 0.590133 0 0 4095 1 
i 10.82642 109.8264 0.7171673 94 79.20688 0 0.593212 0 0 4095 1 
i 2.784594 110.04 0.7171673 47 70.09593 0 0.1895731 0 0 4095 1 
i 6.88916 110.04 0.7171673 59 70.09593 0 0.3955913 0 0 4095 1 
i 1 110.04 0.5378755 56 70.10398 0 0.1 0 0 4095 1 
i 5.104566 110.04 1.539404 68 70.10398 0 0.3060182 0 0 4095 1 
i 1 111.5794 0.5378755 57 70.10331 0 0.1 0 0 4095 1 
i 1.306727 111.5794 0.5378755 59 70.60646 0 0.1153954 0 0 4095 1 
i 2.784594 111.5794 0.7171673 44 70.09526 0 0.1895731 0 0 4095 1 
i 3.827466 111.5794 0.7171673 54 71.80595 0 0.2419174 0 0 4095 1 
i 5.104566 111.5794 0.5378755 65 70.10331 0 0.3060182 0 0 4095 1 
i 5.411293 111.5794 0.5378755 71 70.60646 0 0.3214136 0 0 4095 1 
i 6.88916 111.5794 0.7171673 56 70.09526 0 0.3955913 0 0 4095 1 
i 7.932032 111.5794 0.7171673 66 71.80595 0 0.4479356 0 0 4095 1 
i 6.353782 111.7784 0.7171673 76 78.60243 0 0.3687194 0 0 4095 1 
i 10.45835 111.7784 1.377924 88 78.60243 0 0.5747376 0 0 4095 1 
i 1 113.1564 0.5378755 56 70.10264 0 0.1 0 0 4095 1 
i 1.368072 113.1564 0.5378755 59 70.70642 0 0.1184745 0 0 4095 1 
i 2.784594 113.1564 0.7171673 46 70.09459 0 0.1895731 0 0 4095 1 
i 3.888811 113.1564 0.7171673 54 71.90591 0 0.2449965 0 0 4095 1 
i 5.104566 113.1564 0.5378755 68 70.10264 0 0.3060182 0 0 4095 1 
i 5.472639 113.1564 0.5378755 71 70.70642 0 0.3244927 0 0 4095 1 
i 6.88916 113.1564 0.7171673 55 70.09459 0 0.3955913 0 0 4095 1 
i 7.993377 113.1564 0.7171673 66 71.90591 0 0.4510147 0 0 4095 1 
i 6.353782 113.2509 0.7171673 78 78.60176 0 0.3687194 0 0 4095 1 
i 6.905891 113.2509 0.7171673 87 79.50742 0 0.3964311 0 0 4095 1 
i 10.45835 113.2509 0.7171673 90 78.60176 0 0.5747376 0 0 4095 1 
i 11.01046 113.2509 1.37155 94 79.50742 0 0.6024493 0 0 4095 1 
i 1 114.6225 0.5378755 56 70.10197 0 0.1 0 0 4095 1 
i 1.184036 114.6225 0.5378755 56 70.40386 0 0.1092372 0 0 4095 1 
i 1.306727 114.6225 0.5378755 57 70.60512 0 0.1153954 0 0 4095 1 
i 1.368072 114.6225 0.5378755 60 70.70574 0 0.1184745 0 0 4095 1 
i 2.784594 114.6225 0.7171673 43 70.09392 0 0.1895731 0 0 4095 1 
i 2.96863 114.6225 0.7171673 43 70.39581 0 0.1988104 0 0 4095 1 
i 3.827466 114.6225 0.7171673 57 71.80461 0 0.2419174 0 0 4095 1 
i 3.888811 114.6225 0.7171673 54 71.90524 0 0.2449965 0 0 4095 1 
i 5.104566 114.6225 0.5378755 68 70.10197 0 0.3060182 0 0 4095 1 
i 5.288602 114.6225 0.5378755 68 70.40386 0 0.3152554 0 0 4095 1 
i 5.411293 114.6225 0.5378755 69 70.60512 0 0.3214136 0 0 4095 1 
i 5.472639 114.6225 0.5378755 68 70.70574 0 0.3244927 0 0 4095 1 
i 6.88916 114.6225 0.7171673 55 70.09392 0 0.3955913 0 0 4095 1 
i 7.073196 114.6225 0.7171673 55 70.39581 0 0.4048286 0 0 4095 1 
i 7.932032 114.6225 0.7171673 65 71.80461 0 0.4479356 0 0 4095 1 
i 7.993377 114.6225 0.7171673 66 71.90524 0 0.4510147 0 0 4095 1 
i 6.353782 114.7593 0.7171673 76 78.60109 0 0.3687194 0 0 4095 1 
i 6.967236 114.7593 0.7171673 87 79.60738 0 0.3995101 0 0 4095 1 
i 10.45835 114.7593 0.7171673 88 78.60109 0 0.5747376 0 0 4095 1 
i 11.0718 114.7593 1.402355 99 79.60738 0 0.6055283 0 0 4095 1 
i 6.353782 116.1616 0.7171673 76 78.60042 0 0.3687194 0 0 4095 1 
i 6.537818 116.1616 0.7171673 76 78.90231 0 0.3779566 0 0 4095 1 
i 6.905891 116.1616 0.7171673 85 79.50608 0 0.3964311 0 0 4095 1 
i 6.967236 116.1616 0.7171673 87 79.60671 0 0.3995101 0 0 4095 1 
i 10.45835 116.1616 0.7171673 88 78.60042 0 0.5747376 0 0 4095 1 
i 10.64238 116.1616 0.7171673 88 78.90231 0 0.5839748 0 0 4095 1 
i 11.01046 116.1616 0.7171673 93 79.50608 0 0.6024493 0 0 4095 1 
i 11.0718 116.1616 0.7171673 99 79.60671 0 0.6055283 0 0 4095 1 
i 2.784594 116.3103 0.7171673 44 70.09325 0 0.1895731 0 0 4095 1 
i 4.011502 116.3103 0.7171673 59 72.10583 0 0.2511547 0 0 4095 1 
i 6.88916 116.3103 0.7171673 56 70.09325 0 0.3955913 0 0 4095 1 
i 8.116068 116.3103 0.7171673 66 72.10583 0 0.4571728 0 0 4095 1 
i 1 116.6632 0.5378755 54 70.1013 0 0.1 0 0 4095 1 
i 5.104566 116.6632 1.112874 66 70.1013 0 0.3060182 0 0 4095 1 
i 6.353782 117.7761 0.7171673 78 78.59975 0 0.3687194 0 0 4095 1 
i 7.089927 117.7761 0.7171673 87 79.8073 0 0.4056683 0 0 4095 1 
i 10.45835 117.7761 0.7171673 90 78.59975 0 0.5747376 0 0 4095 1 
i 11.19449 117.7761 0.7171673 99 79.8073 0 0.6116865 0 0 4095 1 
i 2.784594 117.7764 0.7171673 44 70.09258 0 0.1895731 0 0 4095 1 
i 3.091321 117.7764 0.7171673 43 70.59572 0 0.2049685 0 0 4095 1 
i 3.827466 117.7764 0.7171673 54 71.80327 0 0.2419174 0 0 4095 1 
i 4.011502 117.7764 0.7171673 59 72.10516 0 0.2511547 0 0 4095 1 
i 6.88916 117.7764 0.7171673 56 70.09258 0 0.3955913 0 0 4095 1 
i 7.195887 117.7764 0.7171673 55 70.59572 0 0.4109867 0 0 4095 1 
i 7.932032 117.7764 0.7171673 66 71.80327 0 0.4479356 0 0 4095 1 
i 8.116068 117.7764 0.7171673 66 72.10516 0 0.4571728 0 0 4095 1 
i 4.569188 118.1514 0.5378755 83 78.6078 0 0.2791463 0 0 4095 1 
i 8.673754 118.1514 0.5378755 92 78.6078 0 0.4851645 0 0 4095 1 
i 1 118.2026 0.5378755 56 70.10063 0 0.1 0 0 4095 1 
i 1.552109 118.2026 0.5378755 63 71.00629 0 0.1277117 0 0 4095 1 
i 5.104566 118.2026 0.5378755 68 70.10063 0 0.3060182 0 0 4095 1 
i 5.656675 118.2026 0.9758252 75 71.00629 0 0.3337299 0 0 4095 1 
i 6.353782 119.1784 0.7171673 82 78.59908 0 0.3687194 0 0 4095 1 
i 6.660509 119.1784 0.7171673 76 79.10222 0 0.3841148 0 0 4095 1 
i 6.905891 119.1784 0.7171673 82 79.50474 0 0.3964311 0 0 4095 1 
i 7.089927 119.1784 0.7171673 87 79.80662 0 0.4056683 0 0 4095 1 
i 10.45835 119.1784 0.7171673 91 78.59908 0 0.5747376 0 0 4095 1 
i 10.76507 119.1784 0.7171673 88 79.10222 0 0.590133 0 0 4095 1 
i 11.01046 119.1784 0.7171673 94 79.50474 0 0.6024493 0 0 4095 1 
i 11.19449 119.1784 0.7171673 99 79.80662 0 0.6116865 0 0 4095 1 
i 2.784594 119.2782 0.7171673 43 70.09191 0 0.1895731 0 0 4095 1 
i 3.152666 119.2782 0.7171673 43 70.69568 0 0.2080476 0 0 4095 1 
i 3.888811 119.2782 0.7171673 54 71.90323 0 0.2449965 0 0 4095 1 
i 4.011502 119.2782 0.7171673 57 72.10449 0 0.2511547 0 0 4095 1 
i 6.88916 119.2782 0.7171673 55 70.09191 0 0.3955913 0 0 4095 1 
i 7.257232 119.2782 0.7171673 55 70.69568 0 0.4140658 0 0 4095 1 
i 7.993377 119.2782 0.7171673 66 71.90323 0 0.4510147 0 0 4095 1 
i 8.116068 119.2782 0.7171673 69 72.10449 0 0.4571728 0 0 4095 1 
i 4.569188 119.6975 0.5378755 80 78.60713 0 0.2791463 0 0 4095 1 
i 8.673754 119.6975 0.5378755 92 78.60713 0 0.4851645 0 0 4095 1 
i 1 119.7795 0.5378755 53 70.09996 0 0.1 0 0 4095 1 
i 1.613454 119.7795 0.5378755 63 71.10625 0 0.1307908 0 0 4095 1 
i 5.104566 119.7795 0.5378755 65 70.09996 0 0.3060182 0 0 4095 1 
i 5.71802 119.7795 0.8354342 75 71.10625 0 0.336809 0 0 4095 1 
i 6.353782 120.615 0.7171673 81 78.59841 0 0.3687194 0 0 4095 1 
i 6.721854 120.615 0.7171673 76 79.20218 0 0.3871938 0 0 4095 1 
i 6.967236 120.615 0.7171673 82 79.6047 0 0.3995101 0 0 4095 1 
i 7.089927 120.615 0.7171673 85 79.80595 0 0.4056683 0 0 4095 1 
i 10.45835 120.615 0.7171673 93 78.59841 0 0.5747376 0 0 4095 1 
i 10.82642 120.615 0.7171673 88 79.20218 0 0.593212 0 0 4095 1 
i 11.0718 120.615 0.7171673 94 79.6047 0 0.6055283 0 0 4095 1 
i 11.19449 120.615 0.7171673 97 79.80595 0 0.6116865 0 0 4095 1 
i 2.784594 120.6745 0.7171673 44 70.09124 0 0.1895731 0 0 4095 1 
i 2.96863 120.6745 0.7171673 44 70.39312 0 0.1988104 0 0 4095 1 
i 3.091321 120.6745 0.7171673 43 70.59438 0 0.2049685 0 0 4095 1 
i 3.152666 120.6745 0.7171673 40 70.69501 0 0.2080476 0 0 4095 1 
i 3.827466 120.6745 0.7171673 54 71.80193 0 0.2419174 0 0 4095 1 
i 3.888811 120.6745 0.7171673 56 71.90256 0 0.2449965 0 0 4095 1 
i 4.011502 120.6745 0.7171673 59 72.10382 0 0.2511547 0 0 4095 1 
i 4.195539 120.6745 0.7171673 59 72.4057 0 0.2603919 0 0 4095 1 
i 6.88916 120.6745 0.7171673 56 70.09124 0 0.3955913 0 0 4095 1 
i 7.073196 120.6745 0.7171673 56 70.39312 0 0.4048286 0 0 4095 1 
i 7.195887 120.6745 0.7171673 55 70.59438 0 0.4109867 0 0 4095 1 
i 7.257232 120.6745 0.7171673 52 70.69501 0 0.4140658 0 0 4095 1 
i 7.932032 120.6745 0.7171673 66 71.80193 0 0.4479356 0 0 4095 1 
i 7.993377 120.6745 0.7171673 65 71.90256 0 0.4510147 0 0 4095 1 
i 8.116068 120.6745 0.7171673 71 72.10382 0 0.4571728 0 0 4095 1 
i 8.300105 120.6745 0.7171673 71 72.4057 0 0.4664101 0 0 4095 1 
i 1 121.2456 0.5378755 54 70.09929 0 0.1 0 0 4095 1 
i 1.184036 121.2456 0.5378755 54 70.40117 0 0.1092372 0 0 4095 1 
i 1.552109 121.2456 0.5378755 62 71.00495 0 0.1277117 0 0 4095 1 
i 1.613454 121.2456 0.5378755 60 71.10558 0 0.1307908 0 0 4095 1 
i 5.104566 121.2456 0.5378755 66 70.09929 0 0.3060182 0 0 4095 1 
i 5.288602 121.2456 0.5378755 66 70.40117 0 0.3152554 0 0 4095 1 
i 5.656675 121.2456 0.5378755 74 71.00495 0 0.3337299 0 0 4095 1 
i 5.71802 121.2456 0.5378755 72 71.10558 0 0.336809 0 0 4095 1 
i 4.569188 121.2813 0.5378755 81 78.60646 0 0.2791463 0 0 4095 1 
i 8.673754 121.2813 0.6692867 93 78.60646 0 0.4851645 0 0 4095 1 
i 6.353782 121.9506 0.7171673 82 78.59774 0 0.3687194 0 0 4095 1 
i 6.537818 121.9506 0.7171673 82 78.89962 0 0.3779566 0 0 4095 1 
i 6.660509 121.9506 0.7171673 81 79.10088 0 0.3841148 0 0 4095 1 
i 6.721854 121.9506 0.7171673 78 79.20151 0 0.3871938 0 0 4095 1 
i 6.905891 121.9506 0.7171673 87 79.5034 0 0.3964311 0 0 4095 1 
i 6.967236 121.9506 0.7171673 81 79.60403 0 0.3995101 0 0 4095 1 
i 7.089927 121.9506 0.7171673 87 79.80528 0 0.4056683 0 0 4095 1 
i 7.273963 121.9506 0.7171673 87 80.10717 0 0.4149055 0 0 4095 1 
i 10.45835 121.9506 0.7171673 94 78.59774 0 0.5747376 0 0 4095 1 
i 10.64238 121.9506 0.7171673 94 78.89962 0 0.5839748 0 0 4095 1 
i 10.76507 121.9506 0.7171673 93 79.10088 0 0.590133 0 0 4095 1 
i 10.82642 121.9506 0.7171673 90 79.20151 0 0.593212 0 0 4095 1 
i 11.01046 121.9506 0.7171673 99 79.5034 0 0.6024493 0 0 4095 1 
i 11.0718 121.9506 0.7171673 93 79.60403 0 0.6055283 0 0 4095 1 
i 11.19449 121.9506 0.7171673 99 79.80528 0 0.6116865 0 0 4095 1 
i 11.37853 121.9506 0.7171673 99 80.10717 0 0.6209237 0 0 4095 1 
i 2.784594 122.6181 0.7171673 46 70.09057 0 0.1895731 0 0 4095 1 
i 4.256884 122.6181 0.7171673 54 72.50566 0 0.263471 0 0 4095 1 
i 6.88916 122.6181 0.7171673 58 70.09057 0 0.3955913 0 0 4095 1 
i 8.36145 122.6181 0.7171673 66 72.50566 0 0.4694892 0 0 4095 1 
i 4.569188 122.7537 0.5378755 87 78.60579 0 0.2791463 0 0 4095 1 
i 4.753224 122.7537 0.5378755 87 78.90767 0 0.2883835 0 0 4095 1 
i 8.673754 122.7537 0.5378755 99 78.60579 0 0.4851645 0 0 4095 1 
i 8.85779 122.7537 0.5378755 99 78.90767 0 0.4944017 0 0 4095 1 
i 1 122.9334 0.5378755 56 70.09862 0 0.1 0 0 4095 1 
i 1.736145 122.9334 0.5378755 63 71.30616 0 0.1369489 0 0 4095 1 
i 5.104566 122.9334 0.5378755 68 70.09862 0 0.3060182 0 0 4095 1 
i 5.840711 122.9334 1.150709 75 71.30616 0 0.3429671 0 0 4095 1 
i 2.784594 124.0842 0.7171673 47 70.0899 0 0.1895731 0 0 4095 1 
i 3.336703 124.0842 0.7171673 43 70.99556 0 0.2172848 0 0 4095 1 
i 3.827466 124.0842 0.7171673 53 71.80059 0 0.2419174 0 0 4095 1 
i 4.256884 124.0842 0.7171673 59 72.50499 0 0.263471 0 0 4095 1 
i 6.88916 124.0842 0.7171673 59 70.0899 0 0.3955913 0 0 4095 1 
i 7.441269 124.0842 0.7171673 55 70.99556 0 0.423303 0 0 4095 1 
i 7.932032 124.0842 0.7171673 60 71.80059 0 0.4479356 0 0 4095 1 
i 8.36145 124.0842 0.7171673 66 72.50499 0 0.4694892 0 0 4095 1 
i 1 124.3995 0.5378755 56 70.09795 0 0.1 0 0 4095 1 
i 1.306727 124.3995 0.5378755 54 70.60109 0 0.1153954 0 0 4095 1 
i 1.552109 124.3995 0.5378755 56 71.00361 0 0.1277117 0 0 4095 1 
i 1.736145 124.3995 0.5378755 63 71.30549 0 0.1369489 0 0 4095 1 
i 5.104566 124.3995 0.5378755 68 70.09795 0 0.3060182 0 0 4095 1 
i 5.411293 124.3995 0.5378755 66 70.60109 0 0.3214136 0 0 4095 1 
i 5.656675 124.3995 0.5378755 68 71.00361 0 0.3337299 0 0 4095 1 
i 5.840711 124.3995 0.5378755 72 71.30549 0 0.3429671 0 0 4095 1 
i 6.353782 124.4489 0.7171673 74 78.59706 0 0.3687194 0 0 4095 1 
i 10.45835 124.4489 0.7171673 86 78.59706 0 0.5747376 0 0 4095 1 
i 4.569188 124.4489 0.5378755 84 78.60512 0 0.2791463 0 0 4095 1 
i 8.673754 124.4489 0.8638806 92 78.60512 0 0.4851645 0 0 4095 1 
i 2.784594 125.3128 0.5378755 51 70.10667 0 0.1895731 0 0 4095 1 
i 6.88916 125.3128 0.5378755 63 70.10667 0 0.3955913 0 0 4095 1 
i 2.784594 125.586 0.7171673 44 70.08922 0 0.1895731 0 0 4095 1 
i 3.398048 125.586 0.7171673 43 71.09551 0 0.2203639 0 0 4095 1 
i 3.888811 125.586 0.7171673 48 71.90055 0 0.2449965 0 0 4095 1 
i 4.256884 125.586 0.7171673 57 72.50432 0 0.263471 0 0 4095 1 
i 6.88916 125.586 0.7171673 56 70.08922 0 0.3955913 0 0 4095 1 
i 7.502614 125.586 0.7171673 55 71.09551 0 0.4263821 0 0 4095 1 
i 7.993377 125.586 0.7171673 60 71.90055 0 0.4510147 0 0 4095 1 
i 8.36145 125.586 0.7171673 69 72.50432 0 0.4694892 0 0 4095 1 
i 1 125.9014 0.5378755 57 70.09727 0 0.1 0 0 4095 1 
i 1.368072 125.9014 0.5378755 54 70.70105 0 0.1184745 0 0 4095 1 
i 1.613454 125.9014 0.5378755 56 71.10356 0 0.1307908 0 0 4095 1 
i 1.736145 125.9014 0.5378755 62 71.30482 0 0.1369489 0 0 4095 1 
i 5.104566 125.9014 0.5378755 69 70.09727 0 0.3060182 0 0 4095 1 
i 5.472639 125.9014 0.5378755 66 70.70105 0 0.3244927 0 0 4095 1 
i 5.71802 125.9014 0.5378755 68 71.10356 0 0.336809 0 0 4095 1 
i 5.840711 125.9014 0.5378755 74 71.30482 0 0.3429671 0 0 4095 1 
i 4.569188 125.9214 0.5378755 86 78.60444 0 0.2791463 0 0 4095 1 
i 4.875915 125.9214 0.5378755 87 79.10759 0 0.2945416 0 0 4095 1 
i 6.353782 125.9214 0.7171673 73 78.59639 0 0.3687194 0 0 4095 1 
i 7.396654 125.9214 0.7171673 83 80.30709 0 0.4210637 0 0 4095 1 
i 8.673754 125.9214 0.5378755 98 78.60444 0 0.4851645 0 0 4095 1 
i 8.980481 125.9214 0.5378755 99 79.10759 0 0.5005598 0 0 4095 1 
i 10.45835 125.9214 0.7171673 85 78.59639 0 0.5747376 0 0 4095 1 
i 11.50122 125.9214 1.007781 95 80.30709 0 0.6270819 0 0 4095 1 
i 2.784594 126.9291 0.5378755 44 70.106 0 0.1895731 0 0 4095 1 
i 6.88916 126.9291 0.5378755 56 70.106 0 0.3955913 0 0 4095 1 
i 2.784594 126.9823 0.7171673 50 70.08855 0 0.1895731 0 0 4095 1 
i 2.96863 126.9823 0.7171673 50 70.39044 0 0.1988104 0 0 4095 1 
i 3.336703 126.9823 0.7171673 43 70.99421 0 0.2172848 0 0 4095 1 
i 3.398048 126.9823 0.7171673 40 71.09484 0 0.2203639 0 0 4095 1 
i 3.827466 126.9823 0.7171673 53 71.79925 0 0.2419174 0 0 4095 1 
i 3.888811 126.9823 0.7171673 50 71.89987 0 0.2449965 0 0 4095 1 
i 4.256884 126.9823 0.7171673 59 72.50365 0 0.263471 0 0 4095 1 
i 4.44092 126.9823 0.7171673 59 72.80553 0 0.2727082 0 0 4095 1 
i 6.88916 126.9823 0.7171673 58 70.08855 0 0.3955913 0 0 4095 1 
i 7.073196 126.9823 0.7171673 62 70.39044 0 0.4048286 0 0 4095 1 
i 7.441269 126.9823 0.7171673 55 70.99421 0 0.423303 0 0 4095 1 
i 7.502614 126.9823 0.7171673 52 71.09484 0 0.4263821 0 0 4095 1 
i 7.932032 126.9823 0.7171673 65 71.79925 0 0.4479356 0 0 4095 1 
i 7.993377 126.9823 0.7171673 62 71.89987 0 0.4510147 0 0 4095 1 
i 8.36145 126.9823 0.7171673 71 72.50365 0 0.4694892 0 0 4095 1 
i 8.545486 126.9823 0.7171673 71 72.80553 0 0.4787264 0 0 4095 1 
i 1 127.2977 0.5378755 59 70.0966 0 0.1 0 0 4095 1 
i 1.184036 127.2977 0.5378755 59 70.39849 0 0.1092372 0 0 4095 1 
i 1.306727 127.2977 0.5378755 57 70.59975 0 0.1153954 0 0 4095 1 
i 1.368072 127.2977 0.5378755 56 70.70038 0 0.1184745 0 0 4095 1 
i 1.552109 127.2977 0.5378755 63 71.00226 0 0.1277117 0 0 4095 1 
i 1.613454 127.2977 0.5378755 62 71.10289 0 0.1307908 0 0 4095 1 
i 1.736145 127.2977 0.5378755 63 71.30415 0 0.1369489 0 0 4095 1 
i 1.920181 127.2977 0.5378755 63 71.60604 0 0.1461861 0 0 4095 1 
i 5.104566 127.2977 0.5378755 68 70.0966 0 0.3060182 0 0 4095 1 
i 5.288602 127.2977 0.5378755 71 70.39849 0 0.3152554 0 0 4095 1 
i 5.411293 127.2977 0.5378755 69 70.59975 0 0.3214136 0 0 4095 1 
i 5.472639 127.2977 0.5378755 68 70.70038 0 0.3244927 0 0 4095 1 
i 5.656675 127.2977 0.5378755 75 71.00226 0 0.3337299 0 0 4095 1 
i 5.71802 127.2977 0.5378755 74 71.10289 0 0.336809 0 0 4095 1 
i 5.840711 127.2977 0.5378755 75 71.30415 0 0.3429671 0 0 4095 1 
i 6.024747 127.2977 0.5378755 75 71.60604 0 0.3522043 0 0 4095 1 
i 4.569188 127.4297 0.5378755 87 78.60377 0 0.2791463 0 0 4095 1 
i 4.93726 127.4297 0.5378755 87 79.20755 0 0.2976207 0 0 4095 1 
i 6.353782 127.4297 0.7171673 74 78.59572 0 0.3687194 0 0 4095 1 
i 7.457999 127.4297 0.7171673 86 80.40704 0 0.4241428 0 0 4095 1 
i 8.673754 127.4297 0.5378755 99 78.60377 0 0.4851645 0 0 4095 1 
i 9.041826 127.4297 0.5378755 99 79.20755 0 0.5036389 0 0 4095 1 
i 10.45835 127.4297 0.7171673 86 78.59572 0 0.5747376 0 0 4095 1 
i 11.56257 127.4297 1.155192 98 80.40704 0 0.630161 0 0 4095 1 
i 2.784594 128.5849 0.7219589 45 70.10532 0 0.1895731 0 0 4095 1 
i 6.88916 128.5849 0.5378755 57 70.10532 0 0.3955913 0 0 4095 1 
i 3.520739 128.5897 0.7171673 43 71.29543 0 0.226522 0 0 4095 1 
i 4.011502 128.5897 0.7171673 53 72.10046 0 0.2511547 0 0 4095 1 
i 4.256884 128.5897 0.7171673 54 72.50298 0 0.263471 0 0 4095 1 
i 6.88916 128.5897 0.7171673 59 70.08788 0 0.3955913 0 0 4095 1 
i 7.625305 128.5897 0.7171673 55 71.29543 0 0.4325402 0 0 4095 1 
i 8.116068 128.5897 0.7171673 60 72.10046 0 0.4571728 0 0 4095 1 
i 8.36145 128.5897 0.7171673 66 72.50298 0 0.4694892 0 0 4095 1 
i 4.569188 128.8321 0.5378755 87 78.6031 0 0.2791463 0 0 4095 1 
i 4.753224 128.8321 0.5378755 84 78.90499 0 0.2883835 0 0 4095 1 
i 4.875915 128.8321 0.5378755 86 79.10625 0 0.2945416 0 0 4095 1 
i 4.93726 128.8321 0.5378755 87 79.20688 0 0.2976207 0 0 4095 1 
i 6.353782 128.8321 0.7171673 74 78.59505 0 0.3687194 0 0 4095 1 
i 6.537818 128.8321 0.7171673 71 78.89694 0 0.3779566 0 0 4095 1 
i 7.396654 128.8321 0.7171673 81 80.30574 0 0.4210637 0 0 4095 1 
i 7.457999 128.8321 0.7171673 87 80.40637 0 0.4241428 0 0 4095 1 
i 8.673754 128.8321 0.5378755 99 78.6031 0 0.4851645 0 0 4095 1 
i 8.85779 128.8321 0.5378755 96 78.90499 0 0.4944017 0 0 4095 1 
i 8.980481 128.8321 0.5378755 98 79.10625 0 0.5005598 0 0 4095 1 
i 9.041826 128.8321 0.5378755 99 79.20688 0 0.5036389 0 0 4095 1 
i 10.45835 128.8321 0.7171673 83 78.59505 0 0.5747376 0 0 4095 1 
i 10.64238 128.8321 0.7171673 83 78.89694 0 0.5839748 0 0 4095 1 
i 11.50122 128.8321 0.7171673 93 80.30574 0 0.6270819 0 0 4095 1 
i 11.56257 128.8321 1.077475 99 80.40637 0 0.630161 0 0 4095 1 
i 1 129.9096 0.5378755 52 70.09593 0 0.1 0 0 4095 1 
i 5.104566 129.9096 0.5378755 64 70.09593 0 0.3060182 0 0 4095 1 
i 2.784594 129.986 0.7171673 44 70.08721 0 0.1895731 0 0 4095 1 
i 3.091321 129.986 0.7171673 50 70.59036 0 0.2049685 0 0 4095 1 
i 3.336703 129.986 0.7171673 44 70.99287 0 0.2172848 0 0 4095 1 
i 3.520739 129.986 0.7171673 40 71.29476 0 0.226522 0 0 4095 1 
i 3.827466 129.986 0.7171673 54 71.7979 0 0.2419174 0 0 4095 1 
i 4.011502 129.986 0.7171673 50 72.09979 0 0.2511547 0 0 4095 1 
i 4.256884 129.986 0.7171673 56 72.50231 0 0.263471 0 0 4095 1 
i 4.563611 129.986 0.7171673 59 73.00545 0 0.2788663 0 0 4095 1 
i 6.88916 129.986 0.7171673 56 70.08721 0 0.3955913 0 0 4095 1 
i 7.195887 129.986 0.7171673 62 70.59036 0 0.4109867 0 0 4095 1 
i 7.441269 129.986 0.7171673 56 70.99287 0 0.423303 0 0 4095 1 
i 7.625305 129.986 0.7171673 52 71.29476 0 0.4325402 0 0 4095 1 
i 7.932032 129.986 0.7171673 66 71.7979 0 0.4479356 0 0 4095 1 
i 8.116068 129.986 0.7171673 62 72.09979 0 0.4571728 0 0 4095 1 
i 8.36145 129.986 0.7171673 68 72.50231 0 0.4694892 0 0 4095 1 
i 8.668177 129.986 0.7171673 71 73.00545 0 0.4848845 0 0 4095 1 
i 2.784594 130.1243 0.5378755 56 70.10465 0 0.1895731 0 0 4095 1 
i 2.96863 130.1243 0.5378755 56 70.40654 0 0.1988104 0 0 4095 1 
i 6.88916 130.1243 0.5378755 63 70.10465 0 0.3955913 0 0 4095 1 
i 7.073196 130.1243 0.5378755 68 70.40654 0 0.4048286 0 0 4095 1 
i 6.353782 130.4465 0.7171673 73 78.59438 0 0.3687194 0 0 4095 1 
i 7.58069 130.4465 0.7171673 86 80.60696 0 0.4303009 0 0 4095 1 
i 10.45835 130.4465 0.7171673 85 78.59438 0 0.5747376 0 0 4095 1 
i 11.68526 130.4465 0.7171673 98 80.60696 0 0.6363191 0 0 4095 1 
i 4.569188 130.7841 0.5378755 81 78.60243 0 0.2791463 0 0 4095 1 
i 8.673754 130.7841 0.6322429 93 78.60243 0 0.4851645 0 0 4095 1 
i 2.784594 131.4164 0.7171673 46 70.08654 0 0.1895731 0 0 4095 1 
i 3.152666 131.4164 0.7171673 50 70.69031 0 0.2080476 0 0 4095 1 
i 3.398048 131.4164 0.7171673 44 71.09283 0 0.2203639 0 0 4095 1 
i 3.520739 131.4164 0.7171673 43 71.29409 0 0.226522 0 0 4095 1 
i 3.888811 131.4164 0.7171673 54 71.89786 0 0.2449965 0 0 4095 1 
i 4.011502 131.4164 0.7171673 53 72.09912 0 0.2511547 0 0 4095 1 
i 4.256884 131.4164 0.7171673 54 72.50164 0 0.263471 0 0 4095 1 
i 4.624956 131.4164 0.7171673 59 73.10541 0 0.2819454 0 0 4095 1 
i 6.88916 131.4164 0.7171673 58 70.08654 0 0.3955913 0 0 4095 1 
i 7.257232 131.4164 0.7171673 62 70.69031 0 0.4140658 0 0 4095 1 
i 7.502614 131.4164 0.7171673 56 71.09283 0 0.4263821 0 0 4095 1 
i 7.625305 131.4164 0.7171673 55 71.29409 0 0.4325402 0 0 4095 1 
i 7.993377 131.4164 0.7171673 66 71.89786 0 0.4510147 0 0 4095 1 
i 8.116068 131.4164 0.7171673 65 72.09912 0 0.4571728 0 0 4095 1 
i 8.36145 131.4164 0.7171673 66 72.50164 0 0.4694892 0 0 4095 1 
i 8.729522 131.4164 0.7171673 71 73.10541 0 0.4879636 0 0 4095 1 
i 1 131.449 0.5378755 49 70.09526 0 0.1 0 0 4095 1 
i 2.042872 131.449 0.5378755 64 71.80595 0 0.1523443 0 0 4095 1 
i 5.104566 131.449 0.5378755 61 70.09526 0 0.3060182 0 0 4095 1 
i 6.147438 131.449 0.5378755 76 71.80595 0 0.3583625 0 0 4095 1 
i 6.353782 131.8489 0.7171673 73 78.59371 0 0.3687194 0 0 4095 1 
i 6.660509 131.8489 0.7171673 71 79.09686 0 0.3841148 0 0 4095 1 
i 7.396654 131.8489 0.7171673 83 80.3044 0 0.4210637 0 0 4095 1 
i 7.58069 131.8489 0.7171673 87 80.60629 0 0.4303009 0 0 4095 1 
i 10.45835 131.8489 0.7171673 85 78.59371 0 0.5747376 0 0 4095 1 
i 10.76507 131.8489 0.7171673 83 79.09686 0 0.590133 0 0 4095 1 
i 11.50122 131.8489 0.7171673 95 80.3044 0 0.6270819 0 0 4095 1 
i 11.68526 131.8489 0.7171673 99 80.60629 0 0.6363191 0 0 4095 1 
i 2.784594 131.8965 0.5378755 39 70.10398 0 0.1895731 0 0 4095 1 
i 6.88916 131.8965 0.5378755 51 70.10398 0 0.3955913 0 0 4095 1 
i 4.569188 132.2566 0.5378755 83 78.60176 0 0.2791463 0 0 4095 1 
i 5.121297 132.2566 0.5378755 87 79.50742 0 0.3068579 0 0 4095 1 
i 8.673754 132.2566 0.5378755 95 78.60176 0 0.4851645 0 0 4095 1 
i 9.225863 132.2566 0.5378755 99 79.50742 0 0.5128761 0 0 4095 1 
i 2.784594 132.7461 0.7171673 47 70.08587 0 0.1895731 0 0 4095 1 
i 2.96863 132.7461 0.7171673 47 70.38776 0 0.1988104 0 0 4095 1 
i 3.091321 132.7461 0.7171673 44 70.58901 0 0.2049685 0 0 4095 1 
i 3.152666 132.7461 0.7171673 50 70.68964 0 0.2080476 0 0 4095 1 
i 3.336703 132.7461 0.7171673 43 70.99153 0 0.2172848 0 0 4095 1 
i 3.398048 132.7461 0.7171673 44 71.09216 0 0.2203639 0 0 4095 1 
i 3.520739 132.7461 0.7171673 43 71.29342 0 0.226522 0 0 4095 1 
i 3.704775 132.7461 0.7171673 38 71.5953 0 0.2357593 0 0 4095 1 
i 3.827466 132.7461 0.7171673 53 71.79656 0 0.2419174 0 0 4095 1 
i 3.888811 132.7461 0.7171673 54 71.89719 0 0.2449965 0 0 4095 1 
i 4.011502 132.7461 0.7171673 53 72.09845 0 0.2511547 0 0 4095 1 
i 4.195539 132.7461 0.7171673 48 72.40034 0 0.2603919 0 0 4095 1 
i 4.256884 132.7461 0.7171673 54 72.50096 0 0.263471 0 0 4095 1 
i 4.44092 132.7461 0.7171673 54 72.80285 0 0.2727082 0 0 4095 1 
i 4.563611 132.7461 0.7171673 57 73.00411 0 0.2788663 0 0 4095 1 
i 4.624956 132.7461 0.7171673 59 73.10474 0 0.2819454 0 0 4095 1 
i 6.88916 132.7461 0.7171673 59 70.08587 0 0.3955913 0 0 4095 1 
i 7.073196 132.7461 0.7171673 59 70.38776 0 0.4048286 0 0 4095 1 
i 7.195887 132.7461 0.7171673 56 70.58901 0 0.4109867 0 0 4095 1 
i 7.257232 132.7461 0.7171673 62 70.68964 0 0.4140658 0 0 4095 1 
i 7.441269 132.7461 0.7171673 55 70.99153 0 0.423303 0 0 4095 1 
i 7.502614 132.7461 0.7171673 56 71.09216 0 0.4263821 0 0 4095 1 
i 7.625305 132.7461 0.7171673 55 71.29342 0 0.4325402 0 0 4095 1 
i 7.809341 132.7461 0.7171673 50 71.5953 0 0.4417775 0 0 4095 1 
i 7.932032 132.7461 0.7171673 65 71.79656 0 0.4479356 0 0 4095 1 
i 7.993377 132.7461 0.7171673 66 71.89719 0 0.4510147 0 0 4095 1 
i 8.116068 132.7461 0.7171673 60 72.09845 0 0.4571728 0 0 4095 1 
i 8.300105 132.7461 0.7171673 60 72.40034 0 0.4664101 0 0 4095 1 
i 8.36145 132.7461 0.7171673 66 72.50096 0 0.4694892 0 0 4095 1 
i 8.545486 132.7461 0.7171673 66 72.80285 0 0.4787264 0 0 4095 1 
i 8.668177 132.7461 0.7171673 69 73.00411 0 0.4848845 0 0 4095 1 
i 8.729522 132.7461 0.7171673 71 73.10474 0 0.4879636 0 0 4095 1 
i 1 133.0259 0.5378755 51 70.09459 0 0.1 0 0 4095 1 
i 2.104217 133.0259 0.5378755 64 71.90591 0 0.1554234 0 0 4095 1 
i 5.104566 133.0259 0.5378755 63 70.09459 0 0.3060182 0 0 4095 1 
i 6.208784 133.0259 0.9766719 76 71.90591 0 0.3614416 0 0 4095 1 
i 6.721854 133.2854 0.7171673 71 79.19681 0 0.3871938 0 0 4095 1 
i 7.457999 133.2854 0.7171673 83 80.40436 0 0.4241428 0 0 4095 1 
i 7.58069 133.2854 0.7171673 84 80.60562 0 0.4303009 0 0 4095 1 
i 10.45835 133.2854 0.7171673 83 78.59304 0 0.5747376 0 0 4095 1 
i 10.82642 133.2854 0.7171673 83 79.19681 0 0.593212 0 0 4095 1 
i 11.56257 133.2854 0.7171673 95 80.40436 0 0.630161 0 0 4095 1 
i 11.68526 133.2854 0.7171673 96 80.60562 0 0.6363191 0 0 4095 1 
i 2.784594 133.4359 0.5378755 53 70.10331 0 0.1895731 0 0 4095 1 
i 3.091321 133.4359 0.5378755 59 70.60646 0 0.2049685 0 0 4095 1 
i 6.88916 133.4359 0.5378755 65 70.10331 0 0.3955913 0 0 4095 1 
i 7.195887 133.4359 0.5378755 71 70.60646 0 0.4109867 0 0 4095 1 
i 4.569188 133.765 0.5378755 86 78.60109 0 0.2791463 0 0 4095 1 
i 5.182642 133.765 0.5378755 87 79.60738 0 0.309937 0 0 4095 1 
i 8.673754 133.765 0.5378755 98 78.60109 0 0.4851645 0 0 4095 1 
i 9.287208 133.765 0.727057 99 79.60738 0 0.5159552 0 0 4095 1 
i 1 134.492 0.5378755 52 70.09392 0 0.1 0 0 4095 1 
i 1.184036 134.492 0.5378755 48 70.39581 0 0.1092372 0 0 4095 1 
i 2.042872 134.492 0.5378755 62 71.80461 0 0.1523443 0 0 4095 1 
i 2.104217 134.492 0.5378755 64 71.90524 0 0.1554234 0 0 4095 1 
i 5.104566 134.492 0.5378755 60 70.09392 0 0.3060182 0 0 4095 1 
i 5.288602 134.492 0.5378755 60 70.39581 0 0.3152554 0 0 4095 1 
i 6.147438 134.492 0.8461497 74 71.80461 0 0.3583625 0 0 4095 1 
i 6.208784 134.492 0.8461497 76 71.90524 0 0.3614416 0 0 4095 1 
i 6.660509 134.621 0.7171673 70 79.09551 0 0.3841148 0 0 4095 1 
i 6.721854 134.621 0.7171673 68 79.19614 0 0.3871938 0 0 4095 1 
i 7.396654 134.621 0.7171673 86 80.30306 0 0.4210637 0 0 4095 1 
i 7.457999 134.621 0.7171673 80 80.40369 0 0.4241428 0 0 4095 1 
i 7.58069 134.621 0.7171673 86 80.60495 0 0.4303009 0 0 4095 1 
i 7.764726 134.621 0.7171673 86 80.90683 0 0.4395381 0 0 4095 1 
i 10.45835 134.621 0.7171673 80 78.59237 0 0.5747376 0 0 4095 1 
i 10.64238 134.621 0.7171673 85 78.89426 0 0.5839748 0 0 4095 1 
i 10.76507 134.621 0.7171673 82 79.09551 0 0.590133 0 0 4095 1 
i 10.82642 134.621 0.7171673 80 79.19614 0 0.593212 0 0 4095 1 
i 11.50122 134.621 0.7171673 98 80.30306 0 0.6270819 0 0 4095 1 
i 11.56257 134.621 0.7171673 92 80.40369 0 0.630161 0 0 4095 1 
i 11.68526 134.621 0.7171673 98 80.60495 0 0.6363191 0 0 4095 1 
i 11.86929 134.621 0.7171673 98 80.90683 0 0.6455563 0 0 4095 1 
i 2.784594 135.0129 0.5378755 44 70.10264 0 0.1895731 0 0 4095 1 
i 3.152666 135.0129 0.5378755 44 70.70642 0 0.2080476 0 0 4095 1 
i 6.88916 135.0129 0.5378755 56 70.10264 0 0.3955913 0 0 4095 1 
i 7.257232 135.0129 0.5378755 56 70.70642 0 0.4140658 0 0 4095 1 
i 4.569188 135.1673 0.5378755 86 78.60042 0 0.2791463 0 0 4095 1 
i 4.753224 135.1673 0.5378755 81 78.90231 0 0.2883835 0 0 4095 1 
i 5.121297 135.1673 0.5378755 90 79.50608 0 0.3068579 0 0 4095 1 
i 5.182642 135.1673 0.5378755 92 79.60671 0 0.309937 0 0 4095 1 
i 8.673754 135.1673 0.5378755 93 78.60042 0 0.4851645 0 0 4095 1 
i 8.85779 135.1673 0.5378755 93 78.90231 0 0.4944017 0 0 4095 1 
i 9.225863 135.1673 0.5378755 102 79.50608 0 0.5128761 0 0 4095 1 
i 9.287208 135.1673 1.012503 99 79.60671 0 0.5159552 0 0 4095 1 
i 1 136.1798 0.5378755 49 70.09325 0 0.1 0 0 4095 1 
i 2.226908 136.1798 0.5378755 64 72.10583 0 0.1615815 0 0 4095 1 
i 5.104566 136.1798 0.5378755 61 70.09325 0 0.3060182 0 0 4095 1 
i 6.331474 136.1798 0.5378755 76 72.10583 0 0.3675997 0 0 4095 1 
i 2.784594 136.479 0.5378755 39 70.10197 0 0.1895731 0 0 4095 1 
i 2.96863 136.479 0.5378755 39 70.40386 0 0.1988104 0 0 4095 1 
i 3.091321 136.479 0.5378755 38 70.60512 0 0.2049685 0 0 4095 1 
i 3.152666 136.479 0.5378755 36 70.70574 0 0.2080476 0 0 4095 1 
i 6.88916 136.479 0.5378755 51 70.10197 0 0.3955913 0 0 4095 1 
i 7.073196 136.479 0.5378755 51 70.40386 0 0.4048286 0 0 4095 1 
i 7.195887 136.479 0.5378755 50 70.60512 0 0.4109867 0 0 4095 1 
i 7.257232 136.479 0.5378755 44 70.70574 0 0.4140658 0 0 4095 1 
i 6.353782 136.4801 0.7171673 74 78.5917 0 0.3687194 0 0 4095 1 
i 7.826072 136.4801 0.7171673 86 81.00679 0 0.4426172 0 0 4095 1 
i 10.45835 136.4801 0.7171673 86 78.5917 0 0.5747376 0 0 4095 1 
i 11.93064 136.4801 0.7171673 98 81.00679 0 0.6486354 0 0 4095 1 
i 4.569188 136.7817 0.5378755 87 78.59975 0 0.2791463 0 0 4095 1 
i 5.305333 136.7817 0.5378755 92 79.8073 0 0.3160952 0 0 4095 1 
i 8.673754 136.7817 0.5378755 99 78.59975 0 0.4851645 0 0 4095 1 
i 9.409899 136.7817 0.864183 104 79.8073 0 0.5221134 0 0 4095 1 
i 1 137.6459 0.5378755 49 70.09258 0 0.1 0 0 4095 1 
i 1.306727 137.6459 0.5378755 48 70.59572 0 0.1153954 0 0 4095 1 
i 2.042872 137.6459 0.5378755 59 71.80327 0 0.1523443 0 0 4095 1 
i 2.226908 137.6459 0.5378755 64 72.10516 0 0.1615815 0 0 4095 1 
i 5.104566 137.6459 0.5378755 61 70.09258 0 0.3060182 0 0 4095 1 
i 5.411293 137.6459 0.5378755 55 70.59572 0 0.3214136 0 0 4095 1 
i 6.147438 137.6459 0.9536621 71 71.80327 0 0.3583625 0 0 4095 1 
i 6.331474 137.6459 0.5378755 76 72.10516 0 0.3675997 0 0 4095 1 
i 6.353782 137.8824 0.7171673 74 78.59103 0 0.3687194 0 0 4095 1 
i 7.396654 137.8824 0.7171673 81 80.30172 0 0.4210637 0 0 4095 1 
i 7.826072 137.8824 0.7171673 87 81.00612 0 0.4426172 0 0 4095 1 
i 10.45835 137.8824 0.7171673 86 78.59103 0 0.5747376 0 0 4095 1 
i 11.01046 137.8824 0.7171673 83 79.49669 0 0.6024493 0 0 4095 1 
i 11.50122 137.8824 0.7171673 93 80.30172 0 0.6270819 0 0 4095 1 
i 11.93064 137.8824 0.7171673 99 81.00612 0 0.6486354 0 0 4095 1 
i 4.569188 138.1841 0.5378755 87 78.59908 0 0.2791463 0 0 4095 1 
i 4.875915 138.1841 0.5378755 81 79.10222 0 0.2945416 0 0 4095 1 
i 5.121297 138.1841 0.5378755 87 79.50474 0 0.3068579 0 0 4095 1 
i 5.305333 138.1841 0.5378755 92 79.80662 0 0.3160952 0 0 4095 1 
i 8.673754 138.1841 0.5378755 99 78.59908 0 0.4851645 0 0 4095 1 
i 8.980481 138.1841 0.5378755 93 79.10222 0 0.5005598 0 0 4095 1 
i 9.225863 138.1841 0.5378755 99 79.50474 0 0.5128761 0 0 4095 1 
i 9.409899 138.1841 0.5378755 104 79.80662 0 0.5221134 0 0 4095 1 
i 2.784594 138.5197 0.5378755 50 70.1013 0 0.1895731 0 0 4095 1 
i 6.88916 138.5197 0.5378908 62 70.1013 0 0.3955913 0 0 4095 1 
i 6.353782 139.0576 0.5378755 80 78.6078 0 0.3687194 0 0 4095 1 
i 10.45835 139.0576 0.5378755 87 78.6078 0 0.5747376 0 0 4095 1 
i 1 139.1478 0.5378755 52 70.09191 0 0.1 0 0 4095 1 
i 1.368072 139.1478 0.5378755 43 70.69568 0 0.1184745 0 0 4095 1 
i 2.104217 139.1478 0.5378755 59 71.90323 0 0.1554234 0 0 4095 1 
i 2.226908 139.1478 0.5378755 62 72.10449 0 0.1615815 0 0 4095 1 
i 5.104566 139.1478 0.5378755 60 70.09191 0 0.3060182 0 0 4095 1 
i 5.472639 139.1478 0.5378755 55 70.69568 0 0.3244927 0 0 4095 1 
i 6.208784 139.1478 0.5378755 71 71.90323 0 0.3614416 0 0 4095 1 
i 6.331474 139.1478 0.5378755 74 72.10449 0 0.3675997 0 0 4095 1 
i 6.353782 139.319 0.7171673 77 78.59036 0 0.3687194 0 0 4095 1 
i 6.967236 139.319 0.7171673 71 79.59665 0 0.3995101 0 0 4095 1 
i 7.457999 139.319 0.7171673 81 80.40168 0 0.4241428 0 0 4095 1 
i 7.826072 139.319 0.7171673 84 81.00545 0 0.4426172 0 0 4095 1 
i 10.45835 139.319 0.7171673 89 78.59036 0 0.5747376 0 0 4095 1 
i 11.0718 139.319 0.7171673 83 79.59665 0 0.6055283 0 0 4095 1 
i 11.56257 139.319 0.7171673 93 80.40168 0 0.630161 0 0 4095 1 
i 11.93064 139.319 0.7171673 96 81.00545 0 0.6486354 0 0 4095 1 
i 4.569188 139.6207 0.5378755 86 78.59841 0 0.2791463 0 0 4095 1 
i 4.93726 139.6207 0.5378755 86 79.20218 0 0.2976207 0 0 4095 1 
i 5.182642 139.6207 0.5378755 87 79.6047 0 0.309937 0 0 4095 1 
i 5.305333 139.6207 0.5378755 90 79.80595 0 0.3160952 0 0 4095 1 
i 8.673754 139.6207 0.5378755 98 78.59841 0 0.4851645 0 0 4095 1 
i 9.041826 139.6207 0.5378755 93 79.20218 0 0.5036389 0 0 4095 1 
i 9.287208 139.6207 0.5378755 99 79.6047 0 0.5159552 0 0 4095 1 
i 9.409899 139.6207 0.5378755 102 79.80595 0 0.5221134 0 0 4095 1 
i 2.784594 140.0591 0.5378755 39 70.10063 0 0.1895731 0 0 4095 1 
i 3.336703 140.0591 0.5378755 32 71.00629 0 0.2172848 0 0 4095 1 
i 6.88916 140.0591 0.5378755 51 70.10063 0 0.3955913 0 0 4095 1 
i 7.441269 140.0591 0.5378755 39 71.00629 0 0.423303 0 0 4095 1 
i 1 140.5441 0.5378755 49 70.09124 0 0.1 0 0 4095 1 
i 1.184036 140.5441 0.5378755 49 70.39312 0 0.1092372 0 0 4095 1 
i 1.306727 140.5441 0.5378755 48 70.59438 0 0.1153954 0 0 4095 1 
i 1.368072 140.5441 0.5378755 45 70.69501 0 0.1184745 0 0 4095 1 
i 2.042872 140.5441 0.5378755 64 71.80193 0 0.1523443 0 0 4095 1 
i 2.104217 140.5441 0.5378755 61 71.90256 0 0.1554234 0 0 4095 1 
i 2.226908 140.5441 0.5378755 64 72.10382 0 0.1615815 0 0 4095 1 
i 2.410945 140.5441 0.5378755 64 72.4057 0 0.1708188 0 0 4095 1 
i 5.104566 140.5441 0.5378755 61 70.09124 0 0.3060182 0 0 4095 1 
i 5.288602 140.5441 0.5378755 61 70.39312 0 0.3152554 0 0 4095 1 
i 5.411293 140.5441 0.5378755 60 70.59438 0 0.3214136 0 0 4095 1 
i 5.472639 140.5441 0.5378755 57 70.69501 0 0.3244927 0 0 4095 1 
i 6.147438 140.5441 0.5975161 76 71.80193 0 0.3583625 0 0 4095 1 
i 6.208784 140.5441 0.5378755 73 71.90256 0 0.3614416 0 0 4095 1 
i 6.331474 140.5441 0.5378755 76 72.10382 0 0.3675997 0 0 4095 1 
i 6.515511 140.5441 0.5378755 76 72.4057 0 0.3768369 0 0 4095 1 
i 10.45835 140.6037 0.5378755 84 78.60713 0 0.5747376 0 0 4095 1 
i 6.353782 140.6546 0.7171673 74 78.58969 0 0.3687194 0 0 4095 1 
i 6.537818 140.6546 0.7171673 79 78.89157 0 0.3779566 0 0 4095 1 
i 6.905891 140.6546 0.7171673 70 79.49535 0 0.3964311 0 0 4095 1 
i 6.967236 140.6546 0.7171673 68 79.59597 0 0.3995101 0 0 4095 1 
i 7.396654 140.6546 0.7171673 80 80.30038 0 0.4210637 0 0 4095 1 
i 7.457999 140.6546 0.7171673 78 80.40101 0 0.4241428 0 0 4095 1 
i 7.826072 140.6546 0.7171673 86 81.00478 0 0.4426172 0 0 4095 1 
i 8.010108 140.6546 0.7171673 86 81.30667 0 0.4518544 0 0 4095 1 
i 10.45835 140.6546 0.7171673 86 78.58969 0 0.5747376 0 0 4095 1 
i 10.64238 140.6546 0.7171673 91 78.89157 0 0.5839748 0 0 4095 1 
i 11.01046 140.6546 0.7171673 82 79.49535 0 0.6024493 0 0 4095 1 
i 11.0718 140.6546 0.7171673 80 79.59597 0 0.6055283 0 0 4095 1 
i 11.50122 140.6546 0.7171673 92 80.30038 0 0.6270819 0 0 4095 1 
i 11.56257 140.6546 0.7171673 90 80.40101 0 0.630161 0 0 4095 1 
i 11.93064 140.6546 0.7171673 98 81.00478 0 0.6486354 0 0 4095 1 
i 12.11467 140.6546 0.7171673 98 81.30667 0 0.6578726 0 0 4095 1 
i 4.569188 140.9562 0.5378755 87 78.59774 0 0.2791463 0 0 4095 1 
i 4.753224 140.9562 0.5378755 87 78.89962 0 0.2883835 0 0 4095 1 
i 4.875915 140.9562 0.5378755 86 79.10088 0 0.2945416 0 0 4095 1 
i 4.93726 140.9562 0.5378755 87 79.20151 0 0.2976207 0 0 4095 1 
i 5.121297 140.9562 0.5378755 92 79.5034 0 0.3068579 0 0 4095 1 
i 5.182642 140.9562 0.5378755 89 79.60403 0 0.309937 0 0 4095 1 
i 5.305333 140.9562 0.5378755 92 79.80528 0 0.3160952 0 0 4095 1 
i 5.489369 140.9562 0.5378755 92 80.10717 0 0.3253324 0 0 4095 1 
i 8.673754 140.9562 0.5378755 99 78.59774 0 0.4851645 0 0 4095 1 
i 8.85779 140.9562 0.5378755 99 78.89962 0 0.4944017 0 0 4095 1 
i 8.980481 140.9562 0.5378755 98 79.10088 0 0.5005598 0 0 4095 1 
i 9.041826 140.9562 0.5378755 99 79.20151 0 0.5036389 0 0 4095 1 
i 9.225863 140.9562 0.5378755 99 79.5034 0 0.5128761 0 0 4095 1 
i 9.287208 140.9562 0.5378755 101 79.60403 0 0.5159552 0 0 4095 1 
i 9.409899 140.9562 0.5378755 104 79.80528 0 0.5221134 0 0 4095 1 
i 9.593935 140.9562 0.6798408 104 80.10717 0 0.5313506 0 0 4095 1 
i 2.784594 141.6361 0.5378755 53 70.09996 0 0.1895731 0 0 4095 1 
i 3.398048 141.6361 0.5378755 63 71.10625 0 0.2203639 0 0 4095 1 
i 6.88916 141.6361 0.5378755 62 70.09996 0 0.3955913 0 0 4095 1 
i 7.502614 141.6361 0.5514402 75 71.10625 0 0.4263821 0 0 4095 1 
i 6.353782 142.1875 0.5378755 74 78.60646 0 0.3687194 0 0 4095 1 
i 10.45835 142.1875 0.5378755 86 78.60646 0 0.5747376 0 0 4095 1 
i 6.353782 142.1921 0.7171673 74 78.58901 0 0.3687194 0 0 4095 1 
i 7.089927 142.1921 0.7171673 71 79.79656 0 0.4056683 0 0 4095 1 
i 7.58069 142.1921 0.7171673 81 80.60159 0 0.4303009 0 0 4095 1 
i 7.826072 142.1921 0.7171673 87 81.00411 0 0.4426172 0 0 4095 1 
i 10.45835 142.1921 0.7171673 86 78.58901 0 0.5747376 0 0 4095 1 
i 11.19449 142.1921 0.7171673 83 79.79656 0 0.6116865 0 0 4095 1 
i 11.68526 142.1921 0.7171673 93 80.60159 0 0.6363191 0 0 4095 1 
i 11.93064 142.1921 0.7171673 95 81.00411 0 0.6486354 0 0 4095 1 
i 1 142.4876 0.5378755 51 70.09057 0 0.1 0 0 4095 1 
i 2.47229 142.4876 0.5378755 64 72.50566 0 0.1738978 0 0 4095 1 
i 5.104566 142.4876 0.5378755 63 70.09057 0 0.3060182 0 0 4095 1 
i 6.576856 142.4876 0.6145456 76 72.50566 0 0.379916 0 0 4095 1 
i 2.784594 143.1022 0.5378755 50 70.09929 0 0.1895731 0 0 4095 1 
i 3.336703 143.1022 0.5378755 50 71.00495 0 0.2172848 0 0 4095 1 
i 6.88916 143.1022 0.5378755 57 70.09929 0 0.3955913 0 0 4095 1 
i 7.073196 143.1022 0.5378755 57 70.40117 0 0.4048286 0 0 4095 1 
i 7.441269 143.1022 0.5378755 62 71.00495 0 0.423303 0 0 4095 1 
i 7.502614 143.1022 0.5378755 63 71.10558 0 0.4263821 0 0 4095 1 
i 4.569188 143.4546 0.5378755 79 78.59706 0 0.2791463 0 0 4095 1 
i 8.673754 143.4546 0.5378755 91 78.59706 0 0.4851645 0 0 4095 1 
i 6.353782 143.5277 0.7171673 73 78.58834 0 0.3687194 0 0 4095 1 
i 6.660509 143.5277 0.7171673 79 79.09149 0 0.3841148 0 0 4095 1 
i 6.905891 143.5277 0.9639273 73 79.494 0 0.3964311 0 0 4095 1 
i 7.089927 143.5277 0.7171673 68 79.79589 0 0.4056683 0 0 4095 1 
i 7.396654 143.5277 0.7171673 83 80.29904 0 0.4210637 0 0 4095 1 
i 7.58069 143.5277 0.7171673 78 80.60092 0 0.4303009 0 0 4095 1 
i 7.826072 143.5277 0.7171673 84 81.00344 0 0.4426172 0 0 4095 1 
i 8.132799 143.5277 0.7171673 86 81.50658 0 0.4580126 0 0 4095 1 
i 10.45835 143.5277 0.7171673 85 78.58834 0 0.5747376 0 0 4095 1 
i 10.76507 143.5277 0.7171673 91 79.09149 0 0.590133 0 0 4095 1 
i 11.01046 143.5277 0.7171673 85 79.494 0 0.6024493 0 0 4095 1 
i 11.19449 143.5277 0.7171673 80 79.79589 0 0.6116865 0 0 4095 1 
i 11.50122 143.5277 0.7171673 95 80.29904 0 0.6270819 0 0 4095 1 
i 11.68526 143.5277 0.7171673 90 80.60092 0 0.6363191 0 0 4095 1 
i 11.93064 143.5277 0.7171673 92 81.00344 0 0.6486354 0 0 4095 1 
i 12.23736 143.5277 0.7171673 98 81.50658 0 0.6640308 0 0 4095 1 
i 6.353782 143.66 0.5378755 83 78.60579 0 0.3687194 0 0 4095 1 
i 6.537818 143.66 0.5378755 87 78.90767 0 0.3779566 0 0 4095 1 
i 10.45835 143.66 0.5378755 95 78.60579 0 0.5747376 0 0 4095 1 
i 10.64238 143.66 0.5378755 99 78.90767 0 0.5839748 0 0 4095 1 
i 1 143.9537 0.5378755 52 70.0899 0 0.1 0 0 4095 1 
i 1.552109 143.9537 0.5378755 48 70.99556 0 0.1277117 0 0 4095 1 
i 2.042872 143.9537 0.5378755 58 71.80059 0 0.1523443 0 0 4095 1 
i 2.47229 143.9537 0.5378755 64 72.50499 0 0.1738978 0 0 4095 1 
i 5.104566 143.9537 0.5378755 64 70.0899 0 0.3060182 0 0 4095 1 
i 5.656675 143.9537 0.5378755 55 70.99556 0 0.3337299 0 0 4095 1 
i 6.147438 143.9537 0.8362484 70 71.80059 0 0.3583625 0 0 4095 1 
i 2.784594 144.79 0.5378755 39 70.09862 0 0.1895731 0 0 4095 1 
i 3.520739 144.79 0.5378755 32 71.30616 0 0.226522 0 0 4095 1 
i 6.88916 144.79 0.5378755 51 70.09862 0 0.3955913 0 0 4095 1 
i 7.625305 144.79 0.5378755 44 71.30616 0 0.4325402 0 0 4095 1 
i 6.353782 144.8958 0.7171673 74 78.58767 0 0.3687194 0 0 4095 1 
i 6.721854 144.8958 0.7171673 79 79.19145 0 0.3871938 0 0 4095 1 
i 6.967236 144.8958 1.097633 73 79.59396 0 0.3995101 0 0 4095 1 
i 7.089927 144.8958 0.7171673 70 79.79522 0 0.4056683 0 0 4095 1 
i 7.457999 144.8958 0.7171673 83 80.39899 0 0.4241428 0 0 4095 1 
i 7.58069 144.8958 0.7171673 80 80.60025 0 0.4303009 0 0 4095 1 
i 7.826072 144.8958 0.7171673 86 81.00277 0 0.4426172 0 0 4095 1 
i 8.194144 144.8958 0.7171673 86 81.60654 0 0.4610917 0 0 4095 1 
i 10.45835 144.8958 0.7171673 86 78.58767 0 0.5747376 0 0 4095 1 
i 10.82642 144.8958 0.7171673 91 79.19145 0 0.593212 0 0 4095 1 
i 11.0718 144.8958 0.7171673 85 79.59396 0 0.6055283 0 0 4095 1 
i 11.19449 144.8958 0.7171673 82 79.79522 0 0.6116865 0 0 4095 1 
i 11.56257 144.8958 0.7171673 95 80.39899 0 0.630161 0 0 4095 1 
i 11.68526 144.8958 0.7171673 92 80.60025 0 0.6363191 0 0 4095 1 
i 11.93064 144.8958 0.7171673 98 81.00277 0 0.6486354 0 0 4095 1 
i 12.29871 144.8958 0.7171673 98 81.60654 0 0.6671099 0 0 4095 1 
i 4.569188 144.927 0.5378755 78 78.59639 0 0.2791463 0 0 4095 1 
i 5.61206 144.927 0.5378755 88 80.30709 0 0.3314906 0 0 4095 1 
i 8.673754 144.927 0.5378755 90 78.59639 0 0.4851645 0 0 4095 1 
i 9.716626 144.927 0.5378755 100 80.30709 0 0.5375087 0 0 4095 1 
i 6.353782 145.3551 0.5378755 68 78.60512 0 0.3687194 0 0 4095 1 
i 10.45835 145.3551 0.5378755 80 78.60512 0 0.5747376 0 0 4095 1 
i 1 145.4556 0.5378755 54 70.08922 0 0.1 0 0 4095 1 
i 1.613454 145.4556 0.5378755 43 71.09551 0 0.1307908 0 0 4095 1 
i 2.104217 145.4556 0.5378755 58 71.90055 0 0.1554234 0 0 4095 1 
i 2.47229 145.4556 0.5378755 62 72.50432 0 0.1738978 0 0 4095 1 
i 5.104566 145.4556 0.5378755 66 70.08922 0 0.3060182 0 0 4095 1 
i 5.71802 145.4556 0.5378755 55 71.09551 0 0.336809 0 0 4095 1 
i 6.208784 145.4556 0.71222 70 71.90055 0 0.3614416 0 0 4095 1 
i 6.353782 146.1678 1.22194 74 78.587 0 0.3687194 0 0 4095 1 
i 6.537818 146.1678 1.22194 74 78.88889 0 0.3779566 0 0 4095 1 
i 6.660509 146.1678 0.7171673 77 79.09015 0 0.3841148 0 0 4095 1 
i 6.721854 146.1678 0.7171673 79 79.19078 0 0.3871938 0 0 4095 1 
i 6.905891 146.1678 0.7171673 71 79.49266 0 0.3964311 0 0 4095 1 
i 6.967236 146.1678 0.7171673 73 79.59329 0 0.3995101 0 0 4095 1 
i 7.089927 146.1678 0.7171673 71 79.79455 0 0.4056683 0 0 4095 1 
i 7.273963 146.1678 0.7171673 71 80.09644 0 0.4149055 0 0 4095 1 
i 7.396654 146.1678 0.7171673 81 80.29769 0 0.4210637 0 0 4095 1 
i 7.457999 146.1678 0.7171673 83 80.39832 0 0.4241428 0 0 4095 1 
i 7.58069 146.1678 0.7171673 81 80.59958 0 0.4303009 0 0 4095 1 
i 7.764726 146.1678 0.7171673 77 80.90147 0 0.4395381 0 0 4095 1 
i 7.826072 146.1678 0.7171673 87 81.0021 0 0.4426172 0 0 4095 1 
i 8.010108 146.1678 0.7171673 83 81.30398 0 0.4518544 0 0 4095 1 
i 8.132799 146.1678 0.7171673 84 81.50524 0 0.4580126 0 0 4095 1 
i 8.194144 146.1678 0.7171673 87 81.60587 0 0.4610917 0 0 4095 1 
i 10.45835 146.1678 0.7171673 86 78.587 0 0.5747376 0 0 4095 1 
i 10.64238 146.1678 0.7171673 86 78.88889 0 0.5839748 0 0 4095 1 
i 10.76507 146.1678 0.7171673 89 79.09015 0 0.590133 0 0 4095 1 
i 10.82642 146.1678 0.7171673 91 79.19078 0 0.593212 0 0 4095 1 
i 11.01046 146.1678 0.7171673 83 79.49266 0 0.6024493 0 0 4095 1 
i 11.0718 146.1678 0.7171673 85 79.59329 0 0.6055283 0 0 4095 1 
i 11.19449 146.1678 0.7171673 83 79.79455 0 0.6116865 0 0 4095 1 
i 11.37853 146.1678 0.7171673 79 80.09644 0 0.6209237 0 0 4095 1 
i 11.50122 146.1678 0.7171673 93 80.29769 0 0.6270819 0 0 4095 1 
i 11.56257 146.1678 0.7171673 95 80.39832 0 0.630161 0 0 4095 1 
i 11.68526 146.1678 0.7171673 93 80.59958 0 0.6363191 0 0 4095 1 
i 11.86929 146.1678 0.7171673 89 80.90147 0 0.6455563 0 0 4095 1 
i 11.93064 146.1678 0.7171673 99 81.0021 0 0.6486354 0 0 4095 1 
i 12.11467 146.1678 0.7171673 95 81.30398 0 0.6578726 0 0 4095 1 
i 12.23736 146.1678 0.7171673 96 81.50524 0 0.6640308 0 0 4095 1 
i 12.29871 146.1678 0.7171673 99 81.60587 0 0.6671099 0 0 4095 1 
i 2.784594 146.2561 0.5378755 56 70.09795 0 0.1895731 0 0 4095 1 
i 3.091321 146.2561 0.5378755 54 70.60109 0 0.2049685 0 0 4095 1 
i 3.336703 146.2561 0.5378755 63 71.00361 0 0.2172848 0 0 4095 1 
i 3.520739 146.2561 0.5378755 68 71.30549 0 0.226522 0 0 4095 1 
i 6.88916 146.2561 0.5378755 68 70.09795 0 0.3955913 0 0 4095 1 
i 7.195887 146.2561 0.5378755 66 70.60109 0 0.4109867 0 0 4095 1 
i 7.441269 146.2561 0.5378755 72 71.00361 0 0.423303 0 0 4095 1 
i 7.625305 146.2561 0.5378755 80 71.30549 0 0.4325402 0 0 4095 1 
i 4.569188 146.4354 0.5378755 79 78.59572 0 0.2791463 0 0 4095 1 
i 5.673405 146.4354 0.5378755 88 80.40704 0 0.3345696 0 0 4095 1 
i 8.673754 146.4354 0.5378755 91 78.59572 0 0.4851645 0 0 4095 1 
i 9.777971 146.4354 0.5378755 100 80.40704 0 0.5405878 0 0 4095 1 
i 6.353782 146.8276 0.5378755 81 78.60444 0 0.3687194 0 0 4095 1 
i 6.660509 146.8276 0.5378755 87 79.10759 0 0.3841148 0 0 4095 1 
i 10.45835 146.8276 0.5378755 93 78.60444 0 0.5747376 0 0 4095 1 
i 10.76507 146.8276 0.5378755 99 79.10759 0 0.590133 0 0 4095 1 
i 1 146.8519 0.5378755 55 70.08855 0 0.1 0 0 4095 1 
i 1.184036 146.8519 0.5378755 55 70.39044 0 0.1092372 0 0 4095 1 
i 1.552109 146.8519 0.5378755 48 70.99421 0 0.1277117 0 0 4095 1 
i 1.613454 146.8519 0.5378755 49 71.09484 0 0.1307908 0 0 4095 1 
i 2.042872 146.8519 0.5378755 58 71.79925 0 0.1523443 0 0 4095 1 
i 2.104217 146.8519 0.5378755 55 71.89987 0 0.1554234 0 0 4095 1 
i 2.47229 146.8519 0.5378755 64 72.50365 0 0.1738978 0 0 4095 1 
i 2.656326 146.8519 0.5378755 64 72.80553 0 0.1831351 0 0 4095 1 
i 5.104566 146.8519 0.5378755 63 70.08855 0 0.3060182 0 0 4095 1 
i 5.288602 146.8519 0.5378755 67 70.39044 0 0.3152554 0 0 4095 1 
i 5.656675 146.8519 0.5378755 60 70.99421 0 0.3337299 0 0 4095 1 
i 5.71802 146.8519 0.5378755 57 71.09484 0 0.336809 0 0 4095 1 
i 6.147438 146.8519 0.5378755 70 71.79925 0 0.3583625 0 0 4095 1 
i 6.208784 146.8519 0.9060626 67 71.89987 0 0.3614416 0 0 4095 1 
i 2.784594 147.7579 0.5378755 42 70.09727 0 0.1895731 0 0 4095 1 
i 3.152666 147.7579 0.5378755 45 70.70105 0 0.2080476 0 0 4095 1 
i 3.398048 147.7579 0.5378755 39 71.10356 0 0.2203639 0 0 4095 1 
i 3.520739 147.7579 0.5378755 38 71.30482 0 0.226522 0 0 4095 1 
i 6.88916 147.7579 0.5378755 54 70.09727 0 0.3955913 0 0 4095 1 
i 7.257232 147.7579 0.5378755 54 70.70105 0 0.4140658 0 0 4095 1 
i 7.502614 147.7579 0.5378755 51 71.10356 0 0.4263821 0 0 4095 1 
i 7.625305 147.7579 0.5378755 45 71.30482 0 0.4325402 0 0 4095 1 
i 4.569188 147.8378 0.5378755 79 78.59505 0 0.2791463 0 0 4095 1 
i 4.753224 147.8378 0.5378755 76 78.89694 0 0.2883835 0 0 4095 1 
i 5.61206 147.8378 0.5378755 89 80.30574 0 0.3314906 0 0 4095 1 
i 5.673405 147.8378 0.5378755 92 80.40637 0 0.3345696 0 0 4095 1 
i 8.673754 147.8378 0.5378755 91 78.59505 0 0.4851645 0 0 4095 1 
i 8.85779 147.8378 0.5378755 88 78.89694 0 0.4944017 0 0 4095 1 
i 9.716626 147.8378 0.5378755 101 80.30574 0 0.5375087 0 0 4095 1 
i 9.777971 147.8378 0.5378755 100 80.40637 0 0.5405878 0 0 4095 1 
i 6.353782 148.336 0.5378755 75 78.60377 0 0.3687194 0 0 4095 1 
i 10.45835 148.336 0.5378755 87 78.60377 0 0.5747376 0 0 4095 1 
i 10.82642 148.336 0.5378755 87 79.20755 0 0.593212 0 0 4095 1 
i 1 148.4593 0.5378755 52 70.08788 0 0.1 0 0 4095 1 
i 1.736145 148.4593 0.5378755 48 71.29543 0 0.1369489 0 0 4095 1 
i 2.226908 148.4593 0.5378755 58 72.10046 0 0.1615815 0 0 4095 1 
i 2.47229 148.4593 0.5378755 64 72.50298 0 0.1738978 0 0 4095 1 
i 5.104566 148.4593 0.5378755 64 70.08788 0 0.3060182 0 0 4095 1 
i 5.840711 148.4593 0.5378755 55 71.29543 0 0.3429671 0 0 4095 1 
i 6.331474 148.4593 0.5378755 70 72.10046 0 0.3675997 0 0 4095 1 
i 6.576856 148.4593 0.6949171 76 72.50298 0 0.379916 0 0 4095 1 
i 2.784594 149.1542 0.5378755 44 70.0966 0 0.1895731 0 0 4095 1 
i 2.96863 149.1542 0.5378755 39 70.39849 0 0.1988104 0 0 4095 1 
i 3.091321 149.1542 0.5378755 41 70.59975 0 0.2049685 0 0 4095 1 
i 3.152666 149.1542 0.5378755 44 70.70038 0 0.2080476 0 0 4095 1 
i 3.336703 149.1542 0.5378755 39 71.00226 0 0.2172848 0 0 4095 1 
i 3.398048 149.1542 0.5378755 38 71.10289 0 0.2203639 0 0 4095 1 
i 3.520739 149.1542 0.5378755 39 71.30415 0 0.226522 0 0 4095 1 
i 3.704775 149.1542 0.5378755 39 71.60604 0 0.2357593 0 0 4095 1 
i 6.88916 149.1542 0.5378755 51 70.0966 0 0.3955913 0 0 4095 1 
i 7.073196 149.1542 0.5378755 51 70.39849 0 0.4048286 0 0 4095 1 
i 7.195887 149.1542 0.5378755 53 70.59975 0 0.4109867 0 0 4095 1 
i 7.257232 149.1542 0.5378755 56 70.70038 0 0.4140658 0 0 4095 1 
i 7.441269 149.1542 0.5378755 51 71.00226 0 0.423303 0 0 4095 1 
i 7.502614 149.1542 0.5378755 50 71.10289 0 0.4263821 0 0 4095 1 
i 7.625305 149.1542 0.5378755 51 71.30415 0 0.4325402 0 0 4095 1 
i 7.809341 149.1542 0.5378755 51 71.60604 0 0.4417775 0 0 4095 1 
i 4.569188 149.4522 0.5378755 81 78.59438 0 0.2791463 0 0 4095 1 
i 5.796096 149.4522 0.5378755 91 80.60696 0 0.3407278 0 0 4095 1 
i 8.673754 149.4522 0.5378755 90 78.59438 0 0.4851645 0 0 4095 1 
i 9.900662 149.4522 0.5378755 103 80.60696 0 0.546746 0 0 4095 1 
i 6.353782 149.7383 0.655115 68 78.6031 0 0.3687194 0 0 4095 1 
i 6.537818 149.7383 0.5378755 68 78.90499 0 0.3779566 0 0 4095 1 
i 6.660509 149.7383 0.5378755 66 79.10625 0 0.3841148 0 0 4095 1 
i 6.721854 149.7383 0.5378755 63 79.20688 0 0.3871938 0 0 4095 1 
i 10.45835 149.7383 0.5378755 80 78.6031 0 0.5747376 0 0 4095 1 
i 10.64238 149.7383 0.5378755 80 78.90499 0 0.5839748 0 0 4095 1 
i 10.76507 149.7383 0.5378755 78 79.10625 0 0.590133 0 0 4095 1 
i 10.82642 149.7383 0.5378755 75 79.20688 0 0.593212 0 0 4095 1 
i 1 149.8556 0.5378755 54 70.08721 0 0.1 0 0 4095 1 
i 1.306727 149.8556 0.5378755 55 70.59036 0 0.1153954 0 0 4095 1 
i 1.552109 149.8556 0.5378755 49 70.99287 0 0.1277117 0 0 4095 1 
i 1.736145 149.8556 0.5378755 49 71.29476 0 0.1369489 0 0 4095 1 
i 2.042872 149.8556 0.5378755 59 71.7979 0 0.1523443 0 0 4095 1 
i 2.226908 149.8556 0.5378755 55 72.09979 0 0.1615815 0 0 4095 1 
i 2.47229 149.8556 0.5378755 61 72.50231 0 0.1738978 0 0 4095 1 
i 2.779017 149.8556 0.5378755 64 73.00545 0 0.1892932 0 0 4095 1 
i 5.104566 149.8556 0.5378755 61 70.08721 0 0.3060182 0 0 4095 1 
i 5.411293 149.8556 0.5378755 67 70.59036 0 0.3214136 0 0 4095 1 
i 5.656675 149.8556 0.5378755 61 70.99287 0 0.3337299 0 0 4095 1 
i 5.840711 149.8556 0.5378755 57 71.29476 0 0.3429671 0 0 4095 1 
i 6.147438 149.8556 0.5378755 71 71.7979 0 0.3583625 0 0 4095 1 
i 6.576856 149.8556 0.5378755 73 72.50231 0 0.379916 0 0 4095 1 
i 6.883583 149.8556 0.9989668 76 73.00545 0 0.3953114 0 0 4095 1 
i 4.569188 150.8545 0.5378755 78 78.59371 0 0.2791463 0 0 4095 1 
i 4.875915 150.8545 0.5378755 76 79.09686 0 0.2945416 0 0 4095 1 
i 5.61206 150.8545 0.5378755 88 80.3044 0 0.3314906 0 0 4095 1 
i 5.796096 150.8545 0.5378755 92 80.60629 0 0.3407278 0 0 4095 1 
i 8.673754 150.8545 0.5378755 90 78.59371 0 0.4851645 0 0 4095 1 
i 8.980481 150.8545 0.5378755 88 79.09686 0 0.5005598 0 0 4095 1 
i 9.716626 150.8545 0.5378755 100 80.3044 0 0.5375087 0 0 4095 1 
i 9.900662 150.8545 0.5378755 104 80.60629 0 0.546746 0 0 4095 1 
i 1 151.2859 0.5378755 51 70.08654 0 0.1 0 0 4095 1 
i 1.368072 151.2859 0.5378755 55 70.69031 0 0.1184745 0 0 4095 1 
i 1.613454 151.2859 0.5378755 49 71.09283 0 0.1307908 0 0 4095 1 
i 1.736145 151.2859 0.5378755 48 71.29409 0 0.1369489 0 0 4095 1 
i 2.104217 151.2859 0.5378755 59 71.89786 0 0.1554234 0 0 4095 1 
i 2.226908 151.2859 0.5378755 58 72.09912 0 0.1615815 0 0 4095 1 
i 2.47229 151.2859 0.5378755 64 72.50164 0 0.1738978 0 0 4095 1 
i 2.840362 151.2859 0.5378755 64 73.10541 0 0.1923723 0 0 4095 1 
i 5.104566 151.2859 0.5378755 63 70.08654 0 0.3060182 0 0 4095 1 
i 5.472639 151.2859 0.5378755 67 70.69031 0 0.3244927 0 0 4095 1 
i 5.71802 151.2859 0.5378755 61 71.09283 0 0.336809 0 0 4095 1 
i 5.840711 151.2859 0.5378755 60 71.29409 0 0.3429671 0 0 4095 1 
i 6.208784 151.2859 0.5378755 71 71.89786 0 0.3614416 0 0 4095 1 
i 6.331474 151.2859 0.5378755 70 72.09912 0 0.3675997 0 0 4095 1 
i 6.576856 151.2859 0.5378755 76 72.50164 0 0.379916 0 0 4095 1 
i 6.944929 151.2859 0.5378755 76 73.10541 0 0.3983905 0 0 4095 1 
i 6.353782 151.6904 0.5378755 81 78.60243 0 0.3687194 0 0 4095 1 
i 10.45835 151.6904 0.5378755 90 78.60243 0 0.5747376 0 0 4095 1 
i 2.784594 151.7661 0.5378755 48 70.09593 0 0.1895731 0 0 4095 1 
i 6.88916 151.7661 0.5378755 55 70.09593 0 0.3955913 0 0 4095 1 
i 4.569188 152.2911 0.5378755 79 78.59304 0 0.2791463 0 0 4095 1 
i 4.93726 152.2911 0.5378755 76 79.19681 0 0.2976207 0 0 4095 1 
i 5.673405 152.2911 0.5378755 88 80.40436 0 0.3345696 0 0 4095 1 
i 5.796096 152.2911 0.5378755 89 80.60562 0 0.3407278 0 0 4095 1 
i 8.673754 152.2911 0.5378755 91 78.59304 0 0.4851645 0 0 4095 1 
i 9.041826 152.2911 0.5378755 88 79.19681 0 0.5036389 0 0 4095 1 
i 9.777971 152.2911 0.5378755 100 80.40436 0 0.5405878 0 0 4095 1 
i 9.900662 152.2911 0.5378755 101 80.60562 0 0.546746 0 0 4095 1 
i 1 152.6157 0.5378755 52 70.08587 0 0.1 0 0 4095 1 
i 1.184036 152.6157 0.5378755 52 70.38776 0 0.1092372 0 0 4095 1 
i 1.306727 152.6157 0.5378755 54 70.58901 0 0.1153954 0 0 4095 1 
i 1.368072 152.6157 0.5378755 55 70.68964 0 0.1184745 0 0 4095 1 
i 1.552109 152.6157 0.5378755 48 70.99153 0 0.1277117 0 0 4095 1 
i 1.613454 152.6157 0.5378755 49 71.09216 0 0.1307908 0 0 4095 1 
i 1.736145 152.6157 0.5378755 48 71.29342 0 0.1369489 0 0 4095 1 
i 1.920181 152.6157 0.5378755 43 71.5953 0 0.1461861 0 0 4095 1 
i 2.042872 152.6157 0.5378755 58 71.79656 0 0.1523443 0 0 4095 1 
i 2.104217 152.6157 0.5378755 59 71.89719 0 0.1554234 0 0 4095 1 
i 2.226908 152.6157 0.5378755 58 72.09845 0 0.1615815 0 0 4095 1 
i 2.410945 152.6157 0.5378755 53 72.40034 0 0.1708188 0 0 4095 1 
i 2.47229 152.6157 0.5378755 64 72.50096 0 0.1738978 0 0 4095 1 
i 2.656326 152.6157 0.5378755 64 72.80285 0 0.1831351 0 0 4095 1 
i 2.779017 152.6157 0.5378755 62 73.00411 0 0.1892932 0 0 4095 1 
i 2.840362 152.6157 0.5378755 64 73.10474 0 0.1923723 0 0 4095 1 
i 5.104566 152.6157 0.5378755 64 70.08587 0 0.3060182 0 0 4095 1 
i 5.288602 152.6157 0.5378755 64 70.38776 0 0.3152554 0 0 4095 1 
i 5.411293 152.6157 0.5378755 66 70.58901 0 0.3214136 0 0 4095 1 
i 5.472639 152.6157 0.5378755 67 70.68964 0 0.3244927 0 0 4095 1 
i 5.656675 152.6157 0.5378755 60 70.99153 0 0.3337299 0 0 4095 1 
i 5.71802 152.6157 0.5378755 61 71.09216 0 0.336809 0 0 4095 1 
i 5.840711 152.6157 0.5378755 55 71.29342 0 0.3429671 0 0 4095 1 
i 6.024747 152.6157 0.5378755 55 71.5953 0 0.3522043 0 0 4095 1 
i 6.147438 152.6157 0.5378755 70 71.79656 0 0.3583625 0 0 4095 1 
i 6.208784 152.6157 0.5378755 71 71.89719 0 0.3614416 0 0 4095 1 
i 6.331474 152.6157 0.5378755 70 72.09845 0 0.3675997 0 0 4095 1 
i 6.515511 152.6157 0.5378755 65 72.40034 0 0.3768369 0 0 4095 1 
i 6.576856 152.6157 0.5378755 76 72.50096 0 0.379916 0 0 4095 1 
i 6.760892 152.6157 0.5378755 71 72.80285 0 0.3891533 0 0 4095 1 
i 6.883583 152.6157 0.5378755 74 73.00411 0 0.3953114 0 0 4095 1 
i 6.944929 152.6157 0.5471087 76 73.10474 0 0.3983905 0 0 4095 1 
i 6.353782 153.1628 0.5378755 71 78.60176 0 0.3687194 0 0 4095 1 
i 6.905891 153.1628 0.5378755 59 79.50742 0 0.3964311 0 0 4095 1 
i 10.45835 153.1628 0.5378755 80 78.60176 0 0.5747376 0 0 4095 1 
i 11.01046 153.1628 0.5378755 71 79.50742 0 0.6024493 0 0 4095 1 
i 2.784594 153.3055 0.5378755 49 70.09526 0 0.1895731 0 0 4095 1 
i 3.827466 153.3055 0.5378755 40 71.80595 0 0.2419174 0 0 4095 1 
i 6.88916 153.3055 0.5378755 61 70.09526 0 0.3955913 0 0 4095 1 
i 7.932032 153.3055 0.5378755 52 71.80595 0 0.4479356 0 0 4095 1 
i 4.569188 153.6267 0.5378755 78 78.59237 0 0.2791463 0 0 4095 1 
i 4.753224 153.6267 0.5378755 78 78.89426 0 0.2883835 0 0 4095 1 
i 4.875915 153.6267 0.5378755 75 79.09551 0 0.2945416 0 0 4095 1 
i 4.93726 153.6267 0.5378755 78 79.19614 0 0.2976207 0 0 4095 1 
i 5.61206 153.6267 0.5378755 91 80.30306 0 0.3314906 0 0 4095 1 
i 5.673405 153.6267 0.5378755 89 80.40369 0 0.3345696 0 0 4095 1 
i 5.796096 153.6267 0.5378755 91 80.60495 0 0.3407278 0 0 4095 1 
i 5.980132 153.6267 0.5378755 91 80.90683 0 0.349965 0 0 4095 1 
i 8.673754 153.6267 0.5378755 90 78.59237 0 0.4851645 0 0 4095 1 
i 8.85779 153.6267 0.5378755 90 78.89426 0 0.4944017 0 0 4095 1 
i 8.980481 153.6267 0.5378755 87 79.09551 0 0.5005598 0 0 4095 1 
i 9.041826 153.6267 0.5378755 90 79.19614 0 0.5036389 0 0 4095 1 
i 9.716626 153.6267 0.5378755 100 80.30306 0 0.5375087 0 0 4095 1 
i 9.777971 153.6267 0.5378755 101 80.40369 0 0.5405878 0 0 4095 1 
i 9.900662 153.6267 0.5378755 103 80.60495 0 0.546746 0 0 4095 1 
i 10.0847 153.6267 1.044528 103 80.90683 0 0.5559832 0 0 4095 1 
i 6.353782 154.6712 0.5378755 81 78.60109 0 0.3687194 0 0 4095 1 
i 6.967236 154.6712 0.5378755 87 79.60738 0 0.3995101 0 0 4095 1 
i 10.45835 154.6712 0.5378755 93 78.60109 0 0.5747376 0 0 4095 1 
i 11.0718 154.6712 0.5378755 99 79.60738 0 0.6055283 0 0 4095 1 
i 2.784594 154.8825 0.5378755 43 70.09459 0 0.1895731 0 0 4095 1 
i 3.888811 154.8825 0.5378755 64 71.90591 0 0.2449965 0 0 4095 1 
i 6.88916 154.8825 0.5378755 55 70.09459 0 0.3955913 0 0 4095 1 
i 7.993377 154.8825 0.6032869 76 71.90591 0 0.4510147 0 0 4095 1 
i 4.569188 155.4857 0.5378755 79 78.5917 0 0.2791463 0 0 4095 1 
i 6.041478 155.4857 0.5378755 91 81.00679 0 0.3530441 0 0 4095 1 
i 8.673754 155.4857 0.5378755 91 78.5917 0 0.4851645 0 0 4095 1 
i 10.14604 155.4857 0.5878263 103 81.00679 0 0.5590623 0 0 4095 1 
i 6.353782 156.0736 0.5378755 78 78.60042 0 0.3687194 0 0 4095 1 
i 6.537818 156.0736 0.5378755 78 78.90231 0 0.3779566 0 0 4095 1 
i 6.905891 156.0736 0.5378755 78 79.50608 0 0.3964311 0 0 4095 1 
i 6.967236 156.0736 0.5378755 80 79.60671 0 0.3995101 0 0 4095 1 
i 10.45835 156.0736 0.5378755 90 78.60042 0 0.5747376 0 0 4095 1 
i 11.01046 156.0736 0.5378755 90 79.50608 0 0.6024493 0 0 4095 1 
i 2.784594 156.3486 0.5378755 52 70.09392 0 0.1895731 0 0 4095 1 
i 2.96863 156.3486 0.5378755 55 70.39581 0 0.1988104 0 0 4095 1 
i 3.827466 156.3486 0.5378755 34 71.80461 0 0.2419174 0 0 4095 1 
i 3.888811 156.3486 0.5378755 32 71.90524 0 0.2449965 0 0 4095 1 
i 6.88916 156.3486 0.5378755 64 70.09392 0 0.3955913 0 0 4095 1 
i 7.073196 156.3486 0.5378755 64 70.39581 0 0.4048286 0 0 4095 1 
i 7.932032 156.3486 0.5378755 46 71.80461 0 0.4479356 0 0 4095 1 
i 7.993377 156.3486 0.5395435 44 71.90524 0 0.4510147 0 0 4095 1 
i 4.569188 156.8881 0.5378755 79 78.59103 0 0.2791463 0 0 4095 1 
i 5.121297 156.8881 0.5378755 76 79.49669 0 0.3068579 0 0 4095 1 
i 5.61206 156.8881 0.5378755 86 80.30172 0 0.3314906 0 0 4095 1 
i 6.041478 156.8881 0.5378755 92 81.00612 0 0.3530441 0 0 4095 1 
i 8.673754 156.8881 0.5378755 91 78.59103 0 0.4851645 0 0 4095 1 
i 9.225863 156.8881 0.5378755 88 79.49669 0 0.5128761 0 0 4095 1 
i 9.716626 156.8881 0.5378755 98 80.30172 0 0.5375087 0 0 4095 1 
i 10.14604 156.8881 0.7998897 104 81.00612 0 0.5590623 0 0 4095 1 
i 6.353782 157.688 0.5378755 68 78.59975 0 0.3687194 0 0 4095 1 
i 7.089927 157.688 0.5378755 63 79.8073 0 0.4056683 0 0 4095 1 
i 10.45835 157.688 0.5378755 80 78.59975 0 0.5747376 0 0 4095 1 
i 11.19449 157.688 0.5378755 75 79.8073 0 0.6116865 0 0 4095 1 
i 2.784594 158.0364 0.5378755 45 70.09325 0 0.1895731 0 0 4095 1 
i 4.011502 158.0364 0.5378755 55 72.10583 0 0.2511547 0 0 4095 1 
i 6.88916 158.0364 0.5378755 57 70.09325 0 0.3955913 0 0 4095 1 
i 8.116068 158.0364 0.5378755 67 72.10583 0 0.4571728 0 0 4095 1 
i 4.569188 158.3247 0.5378755 82 78.59036 0 0.2791463 0 0 4095 1 
i 5.182642 158.3247 0.5378755 76 79.59665 0 0.309937 0 0 4095 1 
i 5.673405 158.3247 0.5378755 86 80.40168 0 0.3345696 0 0 4095 1 
i 6.041478 158.3247 0.5378755 89 81.00545 0 0.3530441 0 0 4095 1 
i 8.673754 158.3247 0.5378755 94 78.59036 0 0.4851645 0 0 4095 1 
i 9.287208 158.3247 0.5378755 88 79.59665 0 0.5159552 0 0 4095 1 
i 9.777971 158.3247 0.5378755 98 80.40168 0 0.5405878 0 0 4095 1 
i 10.14604 158.3247 0.765686 101 81.00545 0 0.5590623 0 0 4095 1 
i 6.353782 159.0903 0.5378755 87 78.59908 0 0.3687194 0 0 4095 1 
i 6.660509 159.0903 0.5378755 81 79.10222 0 0.3841148 0 0 4095 1 
i 6.905891 159.0903 0.5378755 92 79.50474 0 0.3964311 0 0 4095 1 
i 7.089927 159.0903 0.5378755 96 79.80662 0 0.4056683 0 0 4095 1 
i 10.45835 159.0903 0.5378755 99 78.59908 0 0.5747376 0 0 4095 1 
i 10.76507 159.0903 0.5378755 93 79.10222 0 0.590133 0 0 4095 1 
i 11.01046 159.0903 0.5378755 104 79.50474 0 0.6024493 0 0 4095 1 
i 11.19449 159.0903 0.5378755 108 79.80662 0 0.6116865 0 0 4095 1 
i 2.784594 159.5025 0.5378755 46 70.09258 0 0.1895731 0 0 4095 1 
i 3.091321 159.5025 0.5378755 43 70.59572 0 0.2049685 0 0 4095 1 
i 3.827466 159.5025 0.5378755 56 71.80327 0 0.2419174 0 0 4095 1 
i 4.011502 159.5025 0.5378755 59 72.10516 0 0.2511547 0 0 4095 1 
i 6.88916 159.5025 0.5378755 58 70.09258 0 0.3955913 0 0 4095 1 
i 7.195887 159.5025 0.5378755 52 70.59572 0 0.4109867 0 0 4095 1 
i 7.932032 159.5025 0.5378755 68 71.80327 0 0.4479356 0 0 4095 1 
i 8.116068 159.5025 0.5378755 68 72.10516 0 0.4571728 0 0 4095 1 
i 4.569188 159.6602 0.5378755 79 78.58969 0 0.2791463 0 0 4095 1 
i 4.753224 159.6602 0.5378755 79 78.89157 0 0.2883835 0 0 4095 1 
i 5.121297 159.6602 0.5378755 75 79.49535 0 0.3068579 0 0 4095 1 
i 5.182642 159.6602 0.5378755 78 79.59597 0 0.309937 0 0 4095 1 
i 5.61206 159.6602 0.5378755 85 80.30038 0 0.3314906 0 0 4095 1 
i 5.673405 159.6602 0.5378755 88 80.40101 0 0.3345696 0 0 4095 1 
i 6.041478 159.6602 0.5378755 91 81.00478 0 0.3530441 0 0 4095 1 
i 6.225514 159.6602 0.5378755 91 81.30667 0 0.3622813 0 0 4095 1 
i 8.673754 159.6602 0.5378755 91 78.58969 0 0.4851645 0 0 4095 1 
i 8.85779 159.6602 0.5378755 91 78.89157 0 0.4944017 0 0 4095 1 
i 9.225863 159.6602 0.5378755 87 79.49535 0 0.5128761 0 0 4095 1 
i 9.287208 159.6602 0.5378755 90 79.59597 0 0.5159552 0 0 4095 1 
i 9.716626 159.6602 0.5378755 97 80.30038 0 0.5375087 0 0 4095 1 
i 9.777971 159.6602 0.5378755 100 80.40101 0 0.5405878 0 0 4095 1 
i 10.14604 159.6602 0.5378755 103 81.00478 0 0.5590623 0 0 4095 1 
i 10.33008 159.6602 0.8666686 103 81.30667 0 0.5682995 0 0 4095 1 
i 6.353782 160.5269 0.5378755 69 78.59841 0 0.3687194 0 0 4095 1 
i 6.721854 160.5269 0.5378755 74 79.20218 0 0.3871938 0 0 4095 1 
i 6.967236 160.5269 0.5378755 68 79.6047 0 0.3995101 0 0 4095 1 
i 7.089927 160.5269 0.5378755 66 79.80595 0 0.4056683 0 0 4095 1 
i 10.45835 160.5269 0.5378755 81 78.59841 0 0.5747376 0 0 4095 1 
i 10.82642 160.5269 0.5378755 86 79.20218 0 0.593212 0 0 4095 1 
i 11.0718 160.5269 0.5378755 80 79.6047 0 0.6055283 0 0 4095 1 
i 11.19449 160.5269 0.5378755 78 79.80595 0 0.6116865 0 0 4095 1 
i 2.784594 161.0043 0.5378755 52 70.09191 0 0.1895731 0 0 4095 1 
i 3.152666 161.0043 0.5378755 55 70.69568 0 0.2080476 0 0 4095 1 
i 3.888811 161.0043 0.5378755 32 71.90323 0 0.2449965 0 0 4095 1 
i 4.011502 161.0043 0.5378755 26 72.10449 0 0.2511547 0 0 4095 1 
i 6.88916 161.0043 0.5378755 64 70.09191 0 0.3955913 0 0 4095 1 
i 7.257232 161.0043 0.5378755 67 70.69568 0 0.4140658 0 0 4095 1 
i 7.993377 161.0043 0.5378755 44 71.90323 0 0.4510147 0 0 4095 1 
i 8.116068 161.0043 0.5378755 38 72.10449 0 0.4571728 0 0 4095 1 
i 4.569188 161.1978 0.5378755 79 78.58901 0 0.2791463 0 0 4095 1 
i 5.305333 161.1978 0.5378755 76 79.79656 0 0.3160952 0 0 4095 1 
i 5.796096 161.1978 0.5378755 86 80.60159 0 0.3407278 0 0 4095 1 
i 6.041478 161.1978 0.5378755 88 81.00411 0 0.3530441 0 0 4095 1 
i 8.673754 161.1978 0.5378755 91 78.58901 0 0.4851645 0 0 4095 1 
i 9.409899 161.1978 0.5378755 88 79.79656 0 0.5221134 0 0 4095 1 
i 9.900662 161.1978 0.5378755 98 80.60159 0 0.546746 0 0 4095 1 
i 10.14604 161.1978 0.6647034 100 81.00411 0 0.5590623 0 0 4095 1 
i 6.353782 161.8625 0.5378755 71 78.59774 0 0.3687194 0 0 4095 1 
i 6.537818 161.8625 0.5378755 68 78.89962 0 0.3779566 0 0 4095 1 
i 6.660509 161.8625 0.5378755 69 79.10088 0 0.3841148 0 0 4095 1 
i 6.721854 161.8625 0.5378755 75 79.20151 0 0.3871938 0 0 4095 1 
i 6.905891 161.8625 0.5378755 68 79.5034 0 0.3964311 0 0 4095 1 
i 6.967236 161.8625 0.5378755 69 79.60403 0 0.3995101 0 0 4095 1 
i 7.089927 161.8625 0.5378755 68 79.80528 0 0.4056683 0 0 4095 1 
i 7.273963 161.8625 0.5378755 63 80.10717 0 0.4149055 0 0 4095 1 
i 10.45835 161.8625 0.5378755 83 78.59774 0 0.5747376 0 0 4095 1 
i 10.64238 161.8625 0.5378755 80 78.89962 0 0.5839748 0 0 4095 1 
i 10.76507 161.8625 0.5378755 81 79.10088 0 0.590133 0 0 4095 1 
i 10.82642 161.8625 0.5378755 87 79.20151 0 0.593212 0 0 4095 1 
i 11.01046 161.8625 0.5378755 80 79.5034 0 0.6024493 0 0 4095 1 
i 11.0718 161.8625 0.5378755 77 79.60403 0 0.6055283 0 0 4095 1 
i 11.19449 161.8625 0.5378755 75 79.80528 0 0.6116865 0 0 4095 1 
i 11.37853 161.8625 0.5381178 75 80.10717 0 0.6209237 0 0 4095 1 
i 2.784594 162.4006 0.5378755 42 70.09124 0 0.1895731 0 0 4095 1 
i 2.96863 162.4006 0.5378755 45 70.39312 0 0.1988104 0 0 4095 1 
i 3.091321 162.4006 0.5378755 43 70.59438 0 0.2049685 0 0 4095 1 
i 3.152666 162.4006 0.5378755 42 70.69501 0 0.2080476 0 0 4095 1 
i 3.827466 162.4006 0.5378755 64 71.80193 0 0.2419174 0 0 4095 1 
i 3.888811 162.4006 0.5378755 58 71.90256 0 0.2449965 0 0 4095 1 
i 4.011502 162.4006 0.5378755 64 72.10382 0 0.2511547 0 0 4095 1 
i 4.195539 162.4006 0.5378755 64 72.4057 0 0.2603919 0 0 4095 1 
i 6.88916 162.4006 0.5378755 54 70.09124 0 0.3955913 0 0 4095 1 
i 7.073196 162.4006 0.5378755 57 70.39312 0 0.4048286 0 0 4095 1 
i 7.195887 162.4006 0.5378755 51 70.59438 0 0.4109867 0 0 4095 1 
i 7.257232 162.4006 0.5378755 54 70.69501 0 0.4140658 0 0 4095 1 
i 7.932032 162.4006 0.5378755 71 71.80193 0 0.4479356 0 0 4095 1 
i 7.993377 162.4006 0.5378755 70 71.90256 0 0.4510147 0 0 4095 1 
i 8.116068 162.4006 0.5378755 76 72.10382 0 0.4571728 0 0 4095 1 
i 8.300105 162.4006 0.5378755 76 72.4057 0 0.4664101 0 0 4095 1 
i 4.569188 162.5333 0.5378755 81 78.58834 0 0.2791463 0 0 4095 1 
i 4.875915 162.5333 0.5378755 79 79.09149 0 0.2945416 0 0 4095 1 
i 5.121297 162.5333 0.5378755 78 79.494 0 0.3068579 0 0 4095 1 
i 5.305333 162.5333 0.5378755 78 79.79589 0 0.3160952 0 0 4095 1 
i 5.61206 162.5333 0.5378755 88 80.29904 0 0.3314906 0 0 4095 1 
i 5.796096 162.5333 0.5378755 88 80.60092 0 0.3407278 0 0 4095 1 
i 6.041478 162.5333 0.5378755 89 81.00344 0 0.3530441 0 0 4095 1 
i 6.348205 162.5333 0.5378755 91 81.50658 0 0.3684395 0 0 4095 1 
i 8.673754 162.5333 0.5378755 93 78.58834 0 0.4851645 0 0 4095 1 
i 8.980481 162.5333 0.5378755 91 79.09149 0 0.5005598 0 0 4095 1 
i 9.225863 162.5333 0.5378755 90 79.494 0 0.5128761 0 0 4095 1 
i 9.409899 162.5333 0.5378755 90 79.79589 0 0.5221134 0 0 4095 1 
i 9.716626 162.5333 0.5378755 100 80.29904 0 0.5375087 0 0 4095 1 
i 9.900662 162.5333 0.5378755 100 80.60092 0 0.546746 0 0 4095 1 
i 10.14604 162.5333 0.5378755 101 81.00344 0 0.5590623 0 0 4095 1 
i 10.45277 162.5333 1.368151 103 81.50658 0 0.5744577 0 0 4095 1 
i 4.569188 163.9015 0.5378755 79 78.58767 0 0.2791463 0 0 4095 1 
i 4.93726 163.9015 0.5378755 79 79.19145 0 0.2976207 0 0 4095 1 
i 5.182642 163.9015 0.5378755 78 79.59396 0 0.309937 0 0 4095 1 
i 5.305333 163.9015 0.5378755 75 79.79522 0 0.3160952 0 0 4095 1 
i 5.673405 163.9015 0.5378755 88 80.39899 0 0.3345696 0 0 4095 1 
i 5.796096 163.9015 0.5378755 85 80.60025 0 0.3407278 0 0 4095 1 
i 6.041478 163.9015 0.5378755 91 81.00277 0 0.3530441 0 0 4095 1 
i 6.40955 163.9015 0.5378755 91 81.60654 0 0.3715185 0 0 4095 1 
i 8.673754 163.9015 0.5378755 91 78.58767 0 0.4851645 0 0 4095 1 
i 9.041826 163.9015 0.5378755 91 79.19145 0 0.5036389 0 0 4095 1 
i 9.287208 163.9015 0.5378755 90 79.59396 0 0.5159552 0 0 4095 1 
i 9.409899 163.9015 0.5378755 87 79.79522 0 0.5221134 0 0 4095 1 
i 9.777971 163.9015 0.5378755 100 80.39899 0 0.5405878 0 0 4095 1 
i 9.900662 163.9015 0.5378755 97 80.60025 0 0.546746 0 0 4095 1 
i 10.14604 163.9015 0.5378755 100 81.00277 0 0.5590623 0 0 4095 1 
i 10.51412 163.9015 0.5378755 103 81.60654 0 0.5775367 0 0 4095 1 
i 2.784594 164.3442 0.5378755 43 70.09057 0 0.1895731 0 0 4095 1 
i 4.256884 164.3442 0.5378755 40 72.50566 0 0.263471 0 0 4095 1 
i 6.88916 164.3442 0.5378755 55 70.09057 0 0.3955913 0 0 4095 1 
i 8.36145 164.3442 0.5378755 52 72.50566 0 0.4694892 0 0 4095 1 
i 6.353782 164.3608 0.5378755 76 78.59706 0 0.3687194 0 0 4095 1 
i 10.45835 164.3608 0.8126761 88 78.59706 0 0.5747376 0 0 4095 1 
i 4.569188 165.1735 0.5378755 79 78.587 0 0.2791463 0 0 4095 1 
i 4.753224 165.1735 0.5378755 79 78.88889 0 0.2883835 0 0 4095 1 
i 4.875915 165.1735 0.5378755 82 79.09015 0 0.2945416 0 0 4095 1 
i 4.93726 165.1735 0.5378755 79 79.19078 0 0.2976207 0 0 4095 1 
i 5.121297 165.1735 0.5378755 79 79.49266 0 0.3068579 0 0 4095 1 
i 5.182642 165.1735 0.5378755 78 79.59329 0 0.309937 0 0 4095 1 
i 5.305333 165.1735 0.5378755 76 79.79455 0 0.3160952 0 0 4095 1 
i 5.489369 165.1735 0.5378755 76 80.09644 0 0.3253324 0 0 4095 1 
i 5.61206 165.1735 0.5378755 86 80.29769 0 0.3314906 0 0 4095 1 
i 5.673405 165.1735 0.5378755 88 80.39832 0 0.3345696 0 0 4095 1 
i 5.796096 165.1735 0.5378755 86 80.59958 0 0.3407278 0 0 4095 1 
i 5.980132 165.1735 0.5378755 86 80.90147 0 0.349965 0 0 4095 1 
i 6.041478 165.1735 0.5378755 88 81.0021 0 0.3530441 0 0 4095 1 
i 6.225514 165.1735 0.5378755 88 81.30398 0 0.3622813 0 0 4095 1 
i 6.348205 165.1735 0.5378755 89 81.50524 0 0.3684395 0 0 4095 1 
i 6.40955 165.1735 0.5378755 92 81.60587 0 0.3715185 0 0 4095 1 
i 8.673754 165.1735 0.5378755 91 78.587 0 0.4851645 0 0 4095 1 
i 8.85779 165.1735 0.5378755 91 78.88889 0 0.4944017 0 0 4095 1 
i 8.980481 165.1735 0.5378755 94 79.09015 0 0.5005598 0 0 4095 1 
i 9.041826 165.1735 0.5378755 91 79.19078 0 0.5036389 0 0 4095 1 
i 9.225863 165.1735 0.5378755 88 79.49266 0 0.5128761 0 0 4095 1 
i 9.287208 165.1735 0.5378755 90 79.59329 0 0.5159552 0 0 4095 1 
i 9.409899 165.1735 0.5378755 88 79.79455 0 0.5221134 0 0 4095 1 
i 9.593935 165.1735 0.5378755 88 80.09644 0 0.5313506 0 0 4095 1 
i 9.716626 165.1735 0.5378755 98 80.29769 0 0.5375087 0 0 4095 1 
i 9.777971 165.1735 0.5378755 100 80.39832 0 0.5405878 0 0 4095 1 
i 9.900662 165.1735 0.5378755 98 80.59958 0 0.546746 0 0 4095 1 
i 10.0847 165.1735 0.5378755 94 80.90147 0 0.5559832 0 0 4095 1 
i 10.14604 165.1735 0.5378755 100 81.0021 0 0.5590623 0 0 4095 1 
i 10.33008 165.1735 0.5378755 100 81.30398 0 0.5682995 0 0 4095 1 
i 10.45277 165.1735 0.5378755 101 81.50524 0 0.5744577 0 0 4095 1 
i 10.51412 165.1735 0.6367742 104 81.60587 0 0.5775367 0 0 4095 1 
i 2.784594 165.8103 0.5378755 43 70.0899 0 0.1895731 0 0 4095 1 
i 3.336703 165.8103 0.5378755 52 70.99556 0 0.2172848 0 0 4095 1 
i 3.827466 165.8103 0.5378755 41 71.80059 0 0.2419174 0 0 4095 1 
i 4.256884 165.8103 0.5378755 40 72.50499 0 0.263471 0 0 4095 1 
i 6.88916 165.8103 0.5378755 55 70.0899 0 0.3955913 0 0 4095 1 
i 7.441269 165.8103 0.5378755 64 70.99556 0 0.423303 0 0 4095 1 
i 7.932032 165.8103 0.5378755 53 71.80059 0 0.4479356 0 0 4095 1 
i 8.36145 165.8103 0.5378755 52 72.50499 0 0.4694892 0 0 4095 1 
i 6.353782 165.8333 0.5378755 78 78.59639 0 0.3687194 0 0 4095 1 
i 7.396654 165.8333 0.5378755 67 80.30709 0 0.4210637 0 0 4095 1 
i 10.45835 165.8333 0.5378755 90 78.59639 0 0.5747376 0 0 4095 1 
i 11.50122 165.8333 1.478834 79 80.30709 0 0.6270819 0 0 4095 1 
i 2.784594 167.3121 0.5378755 49 70.08922 0 0.1895731 0 0 4095 1 
i 3.398048 167.3121 0.5378755 36 71.09551 0 0.2203639 0 0 4095 1 
i 3.888811 167.3121 0.5378755 53 71.90055 0 0.2449965 0 0 4095 1 
i 4.256884 167.3121 0.5378755 65 72.50432 0 0.263471 0 0 4095 1 
i 6.88916 167.3121 0.5378755 61 70.08922 0 0.3955913 0 0 4095 1 
i 7.502614 167.3121 0.5378755 48 71.09551 0 0.4263821 0 0 4095 1 
i 7.993377 167.3121 0.5378755 65 71.90055 0 0.4510147 0 0 4095 1 
i 8.36145 167.3121 0.5378755 77 72.50432 0 0.4694892 0 0 4095 1 
i 6.353782 167.3417 0.5378755 72 78.59572 0 0.3687194 0 0 4095 1 
i 7.457999 167.3417 0.5378755 91 80.40704 0 0.4241428 0 0 4095 1 
i 10.45835 167.3417 0.5378755 84 78.59572 0 0.5747376 0 0 4095 1 
i 11.56257 167.3417 1.366732 103 80.40704 0 0.630161 0 0 4095 1 
i 2.784594 168.7084 0.5378755 43 70.08855 0 0.1895731 0 0 4095 1 
i 2.96863 168.7084 0.5378755 43 70.39044 0 0.1988104 0 0 4095 1 
i 3.336703 168.7084 0.5378755 51 70.99421 0 0.2172848 0 0 4095 1 
i 3.398048 168.7084 0.5378755 54 71.09484 0 0.2203639 0 0 4095 1 
i 3.827466 168.7084 0.5378755 37 71.79925 0 0.2419174 0 0 4095 1 
i 3.888811 168.7084 0.5378755 40 71.89987 0 0.2449965 0 0 4095 1 
i 4.256884 168.7084 0.5378755 31 72.50365 0 0.263471 0 0 4095 1 
i 4.44092 168.7084 0.5378755 31 72.80553 0 0.2727082 0 0 4095 1 
i 6.88916 168.7084 0.5378755 55 70.08855 0 0.3955913 0 0 4095 1 
i 7.073196 168.7084 0.5378755 55 70.39044 0 0.4048286 0 0 4095 1 
i 7.441269 168.7084 0.5378755 63 70.99421 0 0.423303 0 0 4095 1 
i 7.502614 168.7084 0.5378755 66 71.09484 0 0.4263821 0 0 4095 1 
i 7.932032 168.7084 0.5378755 49 71.79925 0 0.4479356 0 0 4095 1 
i 7.993377 168.7084 0.5378755 52 71.89987 0 0.4510147 0 0 4095 1 
i 8.36145 168.7084 0.5378755 43 72.50365 0 0.4694892 0 0 4095 1 
i 8.545486 168.7084 0.5378755 40 72.80553 0 0.4787264 0 0 4095 1 
i 6.353782 168.744 0.5378755 79 78.59505 0 0.3687194 0 0 4095 1 
i 6.537818 168.744 0.5378755 79 78.89694 0 0.3779566 0 0 4095 1 
i 7.396654 168.744 0.5378755 62 80.30574 0 0.4210637 0 0 4095 1 
i 7.457999 168.744 0.5378755 59 80.40637 0 0.4241428 0 0 4095 1 
i 10.45835 168.744 0.5378755 91 78.59505 0 0.5747376 0 0 4095 1 
i 10.64238 168.744 0.5378755 91 78.89694 0 0.5839748 0 0 4095 1 
i 11.50122 168.744 0.5378755 74 80.30574 0 0.6270819 0 0 4095 1 
i 11.56257 168.744 1.571807 71 80.40637 0 0.630161 0 0 4095 1 
i 2.784594 170.3158 0.5378755 43 70.08788 0 0.1895731 0 0 4095 1 
i 3.520739 170.3158 0.5378755 43 71.29543 0 0.226522 0 0 4095 1 
i 4.011502 170.3158 0.5378755 50 72.10046 0 0.2511547 0 0 4095 1 
i 6.88916 170.3158 0.5378755 55 70.08788 0 0.3955913 0 0 4095 1 
i 7.625305 170.3158 0.5378755 55 71.29543 0 0.4325402 0 0 4095 1 
i 8.116068 170.3158 0.5378755 58 72.10046 0 0.4571728 0 0 4095 1 
i 8.36145 170.3158 0.5378755 64 72.50298 0 0.4694892 0 0 4095 1 
i 6.353782 170.3584 0.5378755 73 78.59438 0 0.3687194 0 0 4095 1 
i 7.58069 170.3584 0.5378755 83 80.60696 0 0.4303009 0 0 4095 1 
i 10.45835 170.3584 0.5378755 85 78.59438 0 0.5747376 0 0 4095 1 
i 11.68526 170.3584 1.353672 95 80.60696 0 0.6363191 0 0 4095 1 
i 2.784594 171.7121 0.5378755 45 70.08721 0 0.1895731 0 0 4095 1 
i 3.091321 171.7121 0.5378755 51 70.59036 0 0.2049685 0 0 4095 1 
i 3.336703 171.7121 0.5378755 45 70.99287 0 0.2172848 0 0 4095 1 
i 3.520739 171.7121 0.5378755 37 71.29476 0 0.226522 0 0 4095 1 
i 3.827466 171.7121 0.5378755 59 71.7979 0 0.2419174 0 0 4095 1 
i 4.011502 171.7121 0.5378755 55 72.09979 0 0.2511547 0 0 4095 1 
i 4.256884 171.7121 0.5378755 61 72.50231 0 0.263471 0 0 4095 1 
i 4.563611 171.7121 0.5378755 67 73.00545 0 0.2788663 0 0 4095 1 
i 6.88916 171.7121 0.5378755 57 70.08721 0 0.3955913 0 0 4095 1 
i 7.195887 171.7121 0.5378755 63 70.59036 0 0.4109867 0 0 4095 1 
i 7.441269 171.7121 0.5378755 54 70.99287 0 0.423303 0 0 4095 1 
i 7.625305 171.7121 0.5378755 49 71.29476 0 0.4325402 0 0 4095 1 
i 7.932032 171.7121 0.5378755 71 71.7979 0 0.4479356 0 0 4095 1 
i 8.116068 171.7121 0.5378755 64 72.09979 0 0.4571728 0 0 4095 1 
i 8.36145 171.7121 0.5378755 73 72.50231 0 0.4694892 0 0 4095 1 
i 8.668177 171.7121 0.5378755 79 73.00545 0 0.4848845 0 0 4095 1 
i 6.353782 171.7608 0.5378755 73 78.59371 0 0.3687194 0 0 4095 1 
i 6.660509 171.7608 0.5378755 67 79.09686 0 0.3841148 0 0 4095 1 
i 7.396654 171.7608 0.5378755 83 80.3044 0 0.4210637 0 0 4095 1 
i 7.58069 171.7608 0.5378755 88 80.60629 0 0.4303009 0 0 4095 1 
i 10.45835 171.7608 0.5378755 85 78.59371 0 0.5747376 0 0 4095 1 
i 10.76507 171.7608 0.5378755 79 79.09686 0 0.590133 0 0 4095 1 
i 11.50122 171.7608 0.5378755 95 80.3044 0 0.6270819 0 0 4095 1 
i 11.68526 171.7608 1.381657 100 80.60629 0 0.6363191 0 0 4095 1 
i 2.784594 173.1424 0.5378755 43 70.08654 0 0.1895731 0 0 4095 1 
i 3.152666 173.1424 0.5378755 43 70.69031 0 0.2080476 0 0 4095 1 
i 3.398048 173.1424 0.5378755 49 71.09283 0 0.2203639 0 0 4095 1 
i 3.520739 173.1424 0.5378755 55 71.29409 0 0.226522 0 0 4095 1 
i 3.888811 173.1424 0.5378755 31 71.89786 0 0.2449965 0 0 4095 1 
i 4.011502 173.1424 0.5378755 37 72.09912 0 0.2511547 0 0 4095 1 
i 4.256884 173.1424 0.5378755 28 72.50164 0 0.263471 0 0 4095 1 
i 4.624956 173.1424 0.5378755 28 73.10541 0 0.2819454 0 0 4095 1 
i 6.88916 173.1424 0.5378755 55 70.08654 0 0.3955913 0 0 4095 1 
i 7.257232 173.1424 0.5378755 51 70.69031 0 0.4140658 0 0 4095 1 
i 7.502614 173.1424 0.5378755 61 71.09283 0 0.4263821 0 0 4095 1 
i 7.625305 173.1424 0.5378755 67 71.29409 0 0.4325402 0 0 4095 1 
i 7.993377 173.1424 0.5378755 43 71.89786 0 0.4510147 0 0 4095 1 
i 8.116068 173.1424 0.5378755 49 72.09912 0 0.4571728 0 0 4095 1 
i 8.36145 173.1424 0.5378755 40 72.50164 0 0.4694892 0 0 4095 1 
i 8.729522 173.1424 0.5378755 40 73.10541 0 0.4879636 0 0 4095 1 
i 6.353782 173.1973 0.5378755 79 78.59304 0 0.3687194 0 0 4095 1 
i 6.721854 173.1973 0.5378755 88 79.19681 0 0.3871938 0 0 4095 1 
i 7.457999 173.1973 0.5378755 64 80.40436 0 0.4241428 0 0 4095 1 
i 7.58069 173.1973 0.5378755 53 80.60562 0 0.4303009 0 0 4095 1 
i 10.45835 173.1973 0.5378755 91 78.59304 0 0.5747376 0 0 4095 1 
i 10.82642 173.1973 0.5378755 96 79.19681 0 0.593212 0 0 4095 1 
i 11.56257 173.1973 0.5378755 76 80.40436 0 0.630161 0 0 4095 1 
i 11.68526 173.1973 1.274893 65 80.60562 0 0.6363191 0 0 4095 1 
i 2.784594 174.4722 0.5378755 43 70.08587 0 0.1895731 0 0 4095 1 
i 3.091321 174.4722 0.5378755 46 70.58901 0 0.2049685 0 0 4095 1 
i 3.336703 174.4722 0.5378755 43 70.99153 0 0.2172848 0 0 4095 1 
i 3.827466 174.4722 0.5378755 50 71.79656 0 0.2419174 0 0 4095 1 
i 4.011502 174.4722 0.5378755 50 72.09845 0 0.2511547 0 0 4095 1 
i 4.195539 174.4722 0.5378755 46 72.40034 0 0.2603919 0 0 4095 1 
i 4.563611 174.4722 0.5378755 50 73.00411 0 0.2788663 0 0 4095 1 
i 6.88916 174.4722 0.5378755 55 70.08587 0 0.3955913 0 0 4095 1 
i 7.073196 174.4722 0.5378755 55 70.38776 0 0.4048286 0 0 4095 1 
i 7.195887 174.4722 0.5378755 58 70.58901 0 0.4109867 0 0 4095 1 
i 7.993377 174.4722 0.5378755 64 71.89719 0 0.4510147 0 0 4095 1 
i 8.116068 174.4722 0.5378755 58 72.09845 0 0.4571728 0 0 4095 1 
i 8.36145 174.4722 0.5378755 64 72.50096 0 0.4694892 0 0 4095 1 
i 6.353782 174.5329 0.5378755 73 78.59237 0 0.3687194 0 0 4095 1 
i 6.537818 174.5329 0.5378755 73 78.89426 0 0.3779566 0 0 4095 1 
i 6.660509 174.5329 0.5378755 67 79.09551 0 0.3841148 0 0 4095 1 
i 6.721854 174.5329 0.5378755 69 79.19614 0 0.3871938 0 0 4095 1 
i 7.396654 174.5329 0.5378755 88 80.30306 0 0.4210637 0 0 4095 1 
i 7.457999 174.5329 0.5378755 85 80.40369 0 0.4241428 0 0 4095 1 
i 7.58069 174.5329 0.5378755 91 80.60495 0 0.4303009 0 0 4095 1 
i 7.764726 174.5329 0.5378755 91 80.90683 0 0.4395381 0 0 4095 1 
i 10.45835 174.5329 0.5378755 81 78.59237 0 0.5747376 0 0 4095 1 
i 10.64238 174.5329 0.5378755 85 78.89426 0 0.5839748 0 0 4095 1 
i 10.76507 174.5329 0.5378755 79 79.09551 0 0.590133 0 0 4095 1 
i 10.82642 174.5329 0.5378755 81 79.19614 0 0.593212 0 0 4095 1 
i 11.50122 174.5329 0.5378755 100 80.30306 0 0.6270819 0 0 4095 1 
i 11.56257 174.5329 0.5378755 97 80.40369 0 0.630161 0 0 4095 1 
i 11.68526 174.5329 0.5378755 100 80.60495 0 0.6363191 0 0 4095 1 
i 11.86929 174.5329 1.859057 103 80.90683 0 0.6455563 0 0 4095 1 
i 6.353782 176.392 0.5378755 75 78.5917 0 0.3687194 0 0 4095 1 
i 7.826072 176.392 0.5378755 67 81.00679 0 0.4426172 0 0 4095 1 
i 10.45835 176.392 0.5378755 87 78.5917 0 0.5747376 0 0 4095 1 
i 11.93064 176.392 1.402355 76 81.00679 0 0.6486354 0 0 4095 1 
i 6.353782 177.7943 0.5378755 76 78.59103 0 0.3687194 0 0 4095 1 
i 6.905891 177.7943 0.5378755 79 79.49669 0 0.3964311 0 0 4095 1 
i 7.396654 177.7943 0.5378755 74 80.30172 0 0.4210637 0 0 4095 1 
i 7.826072 177.7943 0.5378755 68 81.00612 0 0.4426172 0 0 4095 1 
i 10.45835 177.7943 0.5378755 88 78.59103 0 0.5747376 0 0 4095 1 
i 11.01046 177.7943 0.5378755 91 79.49669 0 0.6024493 0 0 4095 1 
i 11.50122 177.7943 0.5378755 82 80.30172 0 0.6270819 0 0 4095 1 
i 11.93064 177.7943 1.436559 80 81.00612 0 0.6486354 0 0 4095 1 
i 6.353782 179.2309 0.5378755 78 78.59036 0 0.3687194 0 0 4095 1 
i 6.967236 179.2309 0.5378755 64 79.59665 0 0.3995101 0 0 4095 1 
i 7.457999 179.2309 0.5378755 86 80.40168 0 0.4241428 0 0 4095 1 
i 7.826072 179.2309 0.5378755 94 81.00545 0 0.4426172 0 0 4095 1 
i 10.45835 179.2309 0.5378755 90 78.59036 0 0.5747376 0 0 4095 1 
i 11.0718 179.2309 0.5378755 76 79.59665 0 0.6055283 0 0 4095 1 
i 11.56257 179.2309 0.5378755 94 80.40168 0 0.630161 0 0 4095 1 
i 11.93064 179.2309 1.335576 106 81.00545 0 0.6486354 0 0 4095 1 
i 6.353782 180.5665 0.5378755 72 78.58969 0 0.3687194 0 0 4095 1 
i 6.537818 180.5665 0.5378755 72 78.89157 0 0.3779566 0 0 4095 1 
i 6.905891 180.5665 0.5378755 79 79.49535 0 0.3964311 0 0 4095 1 
i 6.967236 180.5665 0.5378755 81 79.59597 0 0.3995101 0 0 4095 1 
i 7.396654 180.5665 0.5378755 70 80.30038 0 0.4210637 0 0 4095 1 
i 7.457999 180.5665 0.5378755 71 80.40101 0 0.4241428 0 0 4095 1 
i 7.826072 180.5665 0.5378755 64 81.00478 0 0.4426172 0 0 4095 1 
i 8.010108 180.5665 0.5378755 59 81.30667 0 0.4518544 0 0 4095 1 
i 10.45835 180.5665 0.5378755 84 78.58969 0 0.5747376 0 0 4095 1 
i 10.64238 180.5665 0.5378755 79 78.89157 0 0.5839748 0 0 4095 1 
i 11.01046 180.5665 0.5378755 91 79.49535 0 0.6024493 0 0 4095 1 
i 11.0718 180.5665 0.5378755 93 79.59597 0 0.6055283 0 0 4095 1 
i 11.50122 180.5665 0.5378755 77 80.30038 0 0.6270819 0 0 4095 1 
i 11.56257 180.5665 0.5378755 79 80.40101 0 0.630161 0 0 4095 1 
i 11.93064 180.5665 0.5378755 71 81.00478 0 0.6486354 0 0 4095 1 
i 12.11467 180.5665 1.537542 71 81.30667 0 0.6578726 0 0 4095 1 
i 6.353782 182.104 0.5378755 76 78.58901 0 0.3687194 0 0 4095 1 
i 7.089927 182.104 0.5378755 76 79.79656 0 0.4056683 0 0 4095 1 
i 7.58069 182.104 0.5378755 77 80.60159 0 0.4303009 0 0 4095 1 
i 7.826072 182.104 0.5378755 76 81.00411 0 0.4426172 0 0 4095 1 
i 10.45835 182.104 0.5378755 88 78.58901 0 0.5747376 0 0 4095 1 
i 11.19449 182.104 0.5378755 88 79.79656 0 0.6116865 0 0 4095 1 
i 11.68526 182.104 1.335576 89 80.60159 0 0.6363191 0 0 4095 1 
i 6.353782 183.4396 0.5378755 73 78.58834 0 0.3687194 0 0 4095 1 
i 6.660509 183.4396 0.5378755 79 79.09149 0 0.3841148 0 0 4095 1 
i 6.905891 183.4396 0.5378755 73 79.494 0 0.3964311 0 0 4095 1 
i 7.089927 183.4396 0.5378755 66 79.79589 0 0.4056683 0 0 4095 1 
i 7.396654 183.4396 0.5378755 88 80.29904 0 0.4210637 0 0 4095 1 
i 7.58069 183.4396 0.5378755 83 80.60092 0 0.4303009 0 0 4095 1 
i 7.826072 183.4396 0.5378755 89 81.00344 0 0.4426172 0 0 4095 1 
i 8.132799 183.4396 0.5378755 95 81.50658 0 0.4580126 0 0 4095 1 
i 10.45835 183.4396 0.5378755 85 78.58834 0 0.5747376 0 0 4095 1 
i 10.76507 183.4396 0.5378755 91 79.09149 0 0.590133 0 0 4095 1 
i 11.01046 183.4396 0.5378755 85 79.494 0 0.6024493 0 0 4095 1 
i 11.19449 183.4396 0.5378755 78 79.79589 0 0.6116865 0 0 4095 1 
i 11.50122 183.4396 0.5378755 100 80.29904 0 0.6270819 0 0 4095 1 
i 11.68526 183.4396 0.5378755 95 80.60092 0 0.6363191 0 0 4095 1 
i 11.93064 183.4396 0.5378755 101 81.00344 0 0.6486354 0 0 4095 1 
i 12.23736 183.4396 0.5378755 107 81.50658 0 0.6640308 0 0 4095 1 
i 2.784594 183.7293 0.7171673 51 70.06373 0 0.1895731 0 0 4095 1 
i 10.99373 183.7293 1.078444 70 70.06373 0 0.6016095 0 0 4095 1 
i 6.353782 184.8077 0.5378755 75 78.58767 0 0.3687194 0 0 4095 1 
i 6.721854 184.8077 0.5378755 67 79.19145 0 0.3871938 0 0 4095 1 
i 6.967236 184.8077 0.5378755 78 79.59396 0 0.3995101 0 0 4095 1 
i 7.089927 184.8077 0.5378755 84 79.79522 0 0.4056683 0 0 4095 1 
i 7.457999 184.8077 0.5378755 64 80.39899 0 0.4241428 0 0 4095 1 
i 7.58069 184.8077 0.5378755 65 80.60025 0 0.4303009 0 0 4095 1 
i 7.826072 184.8077 0.5378755 55 81.00277 0 0.4426172 0 0 4095 1 
i 8.194144 184.8077 0.5378755 52 81.60654 0 0.4610917 0 0 4095 1 
i 10.45835 184.8077 0.5378755 87 78.58767 0 0.5747376 0 0 4095 1 
i 10.82642 184.8077 0.5378755 79 79.19145 0 0.593212 0 0 4095 1 
i 11.0718 184.8077 0.5378755 90 79.59396 0 0.6055283 0 0 4095 1 
i 11.19449 184.8077 0.5378755 91 79.79522 0 0.6116865 0 0 4095 1 
i 11.56257 184.8077 0.5378755 76 80.39899 0 0.630161 0 0 4095 1 
i 11.68526 184.8077 0.5378755 77 80.60025 0 0.6363191 0 0 4095 1 
i 11.93064 184.8077 0.5378755 67 81.00277 0 0.6486354 0 0 4095 1 
i 12.29871 184.8077 0.5379296 64 81.60654 0 0.6671099 0 0 4095 1 
i 2.784594 185.3457 0.7171673 51 70.06306 0 0.1895731 0 0 4095 1 
i 10.99373 185.3457 0.734048 75 70.06306 0 0.6016095 0 0 4095 1 
i 6.353782 186.0797 0.5378755 76 78.587 0 0.3687194 0 0 4095 1 
i 6.537818 186.0797 0.5378755 76 78.88889 0 0.3779566 0 0 4095 1 
i 7.089927 186.0797 0.5378755 76 79.79455 0 0.4056683 0 0 4095 1 
i 7.396654 186.0797 0.5378755 77 80.29769 0 0.4210637 0 0 4095 1 
i 7.457999 186.0797 0.5378755 76 80.39832 0 0.4241428 0 0 4095 1 
i 8.010108 186.0797 0.5378755 76 81.30398 0 0.4518544 0 0 4095 1 
i 10.45835 186.0797 0.5378755 88 78.587 0 0.5747376 0 0 4095 1 
i 11.01046 186.0797 0.5378755 88 79.49266 0 0.6024493 0 0 4095 1 
i 11.0718 186.0797 0.5378755 85 79.59329 0 0.6055283 0 0 4095 1 
i 11.50122 186.0797 0.5378755 89 80.29769 0 0.6270819 0 0 4095 1 
i 12.11467 186.0797 0.5378755 88 81.30398 0 0.6578726 0 0 4095 1 
i 12.23736 186.0797 0.9217496 89 81.50524 0 0.6640308 0 0 4095 1 
i 2.784594 187.0015 0.7171673 49 70.06239 0 0.1895731 0 0 4095 1 
i 10.99373 187.0015 1.539404 73 70.06239 0 0.6016095 0 0 4095 1 
i 2.784594 188.5409 0.7171673 51 70.06172 0 0.1895731 0 0 4095 1 
i 2.96863 188.5409 0.7171673 51 70.36361 0 0.1988104 0 0 4095 1 
i 10.99373 188.5409 0.7171673 75 70.06172 0 0.6016095 0 0 4095 1 
i 11.17776 188.5409 1.772191 75 70.36361 0 0.6108467 0 0 4095 1 
i 2.784594 190.3131 0.7171673 51 70.06105 0 0.1895731 0 0 4095 1 
i 10.99373 190.3131 1.539404 75 70.06105 0 0.6016095 0 0 4095 1 
i 2.784594 191.8525 0.7171673 48 70.06038 0 0.1895731 0 0 4095 1 
i 3.091321 191.8525 0.7171673 54 70.56352 0 0.2049685 0 0 4095 1 
i 10.99373 191.8525 0.7171673 72 70.06038 0 0.6016095 0 0 4095 1 
i 11.30045 191.8525 1.44734 78 70.56352 0 0.6170049 0 0 4095 1 
i 4.569188 193.2998 0.7171673 63 74.3143 0 0.2791463 0 0 4095 1 
i 12.77832 193.2998 0.7171673 87 74.3143 0 0.6911826 0 0 4095 1 
i 2.784594 193.4294 0.7171673 51 70.05971 0 0.1895731 0 0 4095 1 
i 3.152666 193.4294 0.7171673 54 70.66348 0 0.2080476 0 0 4095 1 
i 10.99373 193.4294 0.7171673 75 70.05971 0 0.6016095 0 0 4095 1 
i 11.3618 193.4294 1.416486 78 70.66348 0 0.620084 0 0 4095 1 
i 4.569188 194.8459 0.7171673 63 74.31363 0 0.2791463 0 0 4095 1 
i 12.77832 194.8459 0.7171673 87 74.31363 0 0.6911826 0 0 4095 1 
i 2.784594 194.8955 0.7171673 51 70.05904 0 0.1895731 0 0 4095 1 
i 2.96863 194.8955 0.7171673 51 70.36092 0 0.1988104 0 0 4095 1 
i 3.091321 194.8955 0.7171673 52 70.56218 0 0.2049685 0 0 4095 1 
i 3.152666 194.8955 0.7171673 55 70.66281 0 0.2080476 0 0 4095 1 
i 10.99373 194.8955 0.7171673 75 70.05904 0 0.6016095 0 0 4095 1 
i 11.17776 194.8955 0.7171673 75 70.36092 0 0.6108467 0 0 4095 1 
i 11.30045 194.8955 0.7171673 76 70.56218 0 0.6170049 0 0 4095 1 
i 11.3618 194.8955 1.534194 79 70.66281 0 0.620084 0 0 4095 1 
i 4.569188 196.4297 0.7171673 64 74.31296 0 0.2791463 0 0 4095 1 
i 12.77832 196.4297 0.7171673 85 74.31296 0 0.6911826 0 0 4095 1 
i 2.784594 196.9363 0.7171673 49 70.05836 0 0.1895731 0 0 4095 1 
i 10.99373 196.9363 0.9659292 73 70.05836 0 0.6016095 0 0 4095 1 
i 4.569188 197.9022 0.7171673 66 74.31229 0 0.2791463 0 0 4095 1 
i 4.753224 197.9022 0.7171673 66 74.61417 0 0.2883835 0 0 4095 1 
i 12.77832 197.9022 0.7171673 87 74.31229 0 0.6911826 0 0 4095 1 
i 12.96236 197.9022 0.7171673 90 74.61417 0 0.7004199 0 0 4095 1 
i 2.784594 198.4757 0.7171673 51 70.05769 0 0.1895731 0 0 4095 1 
i 3.336703 198.4757 0.7171673 54 70.96335 0 0.2172848 0 0 4095 1 
i 10.99373 198.4757 0.7171673 75 70.05769 0 0.6016095 0 0 4095 1 
i 11.54583 198.4757 1.121665 78 70.96335 0 0.6293212 0 0 4095 1 
i 4.569188 199.5973 0.7171673 63 74.31161 0 0.2791463 0 0 4095 1 
i 12.77832 199.5973 0.7171673 87 74.31161 0 0.6911826 0 0 4095 1 
i 2.784594 200.0526 0.7171673 48 70.05702 0 0.1895731 0 0 4095 1 
i 3.398048 200.0526 0.7171673 54 71.06331 0 0.2203639 0 0 4095 1 
i 10.99373 200.0526 0.7171673 72 70.05702 0 0.6016095 0 0 4095 1 
i 11.60718 200.0526 1.017188 78 71.06331 0 0.6324003 0 0 4095 1 
i 4.569188 201.0698 0.7171673 64 74.31094 0 0.2791463 0 0 4095 1 
i 4.875915 201.0698 0.7171673 66 74.81409 0 0.2945416 0 0 4095 1 
i 12.77832 201.0698 0.7171673 88 74.31094 0 0.6911826 0 0 4095 1 
i 13.08505 201.0698 0.7171673 90 74.81409 0 0.706578 0 0 4095 1 
i 2.784594 201.5187 0.7171673 49 70.05635 0 0.1895731 0 0 4095 1 
i 2.96863 201.5187 0.7171673 49 70.35824 0 0.1988104 0 0 4095 1 
i 3.336703 201.5187 0.7171673 57 70.96201 0 0.2172848 0 0 4095 1 
i 3.398048 201.5187 0.7171673 55 71.06264 0 0.2203639 0 0 4095 1 
i 10.99373 201.5187 0.7171673 73 70.05635 0 0.6016095 0 0 4095 1 
i 11.17776 201.5187 0.7171673 69 70.35824 0 0.6108467 0 0 4095 1 
i 11.54583 201.5187 0.7171673 76 70.96201 0 0.6293212 0 0 4095 1 
i 11.60718 201.5187 1.059477 79 71.06264 0 0.6324003 0 0 4095 1 
i 4.569188 202.5782 0.7171673 66 74.31027 0 0.2791463 0 0 4095 1 
i 4.93726 202.5782 0.7171673 70 74.91405 0 0.2976207 0 0 4095 1 
i 12.77832 202.5782 0.7171673 90 74.31027 0 0.6911826 0 0 4095 1 
i 13.14639 202.5782 0.7171673 90 74.91405 0 0.7096571 0 0 4095 1 
i 2.784594 203.2065 0.7171673 51 70.05568 0 0.1895731 0 0 4095 1 
i 3.520739 203.2065 0.7171673 58 71.26323 0 0.226522 0 0 4095 1 
i 10.99373 203.2065 0.7171673 75 70.05568 0 0.6016095 0 0 4095 1 
i 11.72987 203.2065 0.7171673 78 71.26323 0 0.6385584 0 0 4095 1 
i 1 203.5989 0.5378755 51 70.06373 0 0.1 0 0 4095 1 
i 9.209132 203.5989 0.5378755 75 70.06373 0 0.5120364 0 0 4095 1 
i 4.569188 203.9805 0.7171673 67 74.3096 0 0.2791463 0 0 4095 1 
i 4.753224 203.9805 0.7171673 67 74.61149 0 0.2883835 0 0 4095 1 
i 4.875915 203.9805 0.7171673 69 74.81275 0 0.2945416 0 0 4095 1 
i 4.93726 203.9805 0.7171673 70 74.91338 0 0.2976207 0 0 4095 1 
i 12.77832 203.9805 0.7171673 91 74.3096 0 0.6911826 0 0 4095 1 
i 12.96236 203.9805 0.7171673 87 74.61149 0 0.7004199 0 0 4095 1 
i 13.08505 203.9805 0.7171673 93 74.81275 0 0.706578 0 0 4095 1 
i 13.14639 203.9805 0.7171673 91 74.91338 0 0.7096571 0 0 4095 1 
i 2.784594 204.6726 0.7171673 51 70.05501 0 0.1895731 0 0 4095 1 
i 3.091321 204.6726 0.7171673 49 70.55816 0 0.2049685 0 0 4095 1 
i 3.336703 204.6726 0.7171673 55 70.96067 0 0.2172848 0 0 4095 1 
i 3.520739 204.6726 0.7171673 58 71.26256 0 0.226522 0 0 4095 1 
i 10.99373 204.6726 0.7171673 75 70.05501 0 0.6016095 0 0 4095 1 
i 11.30045 204.6726 0.7171673 73 70.55816 0 0.6170049 0 0 4095 1 
i 11.54583 204.6726 0.7171673 79 70.96067 0 0.6293212 0 0 4095 1 
i 11.72987 204.6726 0.7171673 79 71.26256 0 0.6385584 0 0 4095 1 
i 1 205.2152 0.5378755 56 70.06306 0 0.1 0 0 4095 1 
i 9.209132 205.2152 0.7173066 80 70.06306 0 0.5120364 0 0 4095 1 
i 4.569188 205.9325 0.7171673 64 74.30893 0 0.2791463 0 0 4095 1 
i 12.77832 205.9325 0.7171673 85 74.30893 0 0.6911826 0 0 4095 1 
i 2.784594 206.1745 0.7171673 52 70.05434 0 0.1895731 0 0 4095 1 
i 3.152666 206.1745 0.7171673 49 70.65811 0 0.2080476 0 0 4095 1 
i 3.398048 206.1745 0.7171673 55 71.06063 0 0.2203639 0 0 4095 1 
i 3.520739 206.1745 0.7171673 57 71.26189 0 0.226522 0 0 4095 1 
i 10.99373 206.1745 0.7171673 76 70.05434 0 0.6016095 0 0 4095 1 
i 11.3618 206.1745 0.7171673 73 70.65811 0 0.620084 0 0 4095 1 
i 11.60718 206.1745 0.7171673 79 71.06063 0 0.6324003 0 0 4095 1 
i 11.72987 206.1745 0.7171673 81 71.26189 0 0.6385584 0 0 4095 1 
i 1 206.871 0.5378755 54 70.06239 0 0.1 0 0 4095 1 
i 9.209132 206.871 0.5378755 78 70.06239 0 0.5120364 0 0 4095 1 
i 4.569188 207.405 0.7171673 63 74.30826 0 0.2791463 0 0 4095 1 
i 5.121297 207.405 0.7171673 70 75.21392 0 0.3068579 0 0 4095 1 
i 12.77832 207.405 0.7171673 87 74.30826 0 0.6911826 0 0 4095 1 
i 13.33043 207.405 0.7171673 90 75.21392 0 0.7188943 0 0 4095 1 
i 2.784594 207.5707 0.7171673 54 70.05367 0 0.1895731 0 0 4095 1 
i 2.96863 207.5707 0.7171673 54 70.35556 0 0.1988104 0 0 4095 1 
i 3.091321 207.5707 0.7171673 52 70.55681 0 0.2049685 0 0 4095 1 
i 3.152666 207.5707 0.7171673 51 70.65744 0 0.2080476 0 0 4095 1 
i 3.336703 207.5707 0.7171673 54 70.95933 0 0.2172848 0 0 4095 1 
i 3.398048 207.5707 0.7171673 57 71.05996 0 0.2203639 0 0 4095 1 
i 3.520739 207.5707 0.7171673 58 71.26122 0 0.226522 0 0 4095 1 
i 3.704775 207.5707 0.7171673 58 71.5631 0 0.2357593 0 0 4095 1 
i 10.99373 207.5707 0.7171673 75 70.05367 0 0.6016095 0 0 4095 1 
i 11.17776 207.5707 0.7171673 78 70.35556 0 0.6108467 0 0 4095 1 
i 11.30045 207.5707 0.7171673 76 70.55681 0 0.6170049 0 0 4095 1 
i 11.3618 207.5707 0.7171673 75 70.65744 0 0.620084 0 0 4095 1 
i 11.54583 207.5707 0.7171673 78 70.95933 0 0.6293212 0 0 4095 1 
i 11.60718 207.5707 0.7171673 76 71.05996 0 0.6324003 0 0 4095 1 
i 11.72987 207.5707 0.7171673 78 71.26122 0 0.6385584 0 0 4095 1 
i 11.91391 207.5707 0.8396948 82 71.5631 0 0.6477957 0 0 4095 1 
i 1 208.4104 0.5378755 56 70.06172 0 0.1 0 0 4095 1 
i 1.184036 208.4104 0.5378755 56 70.36361 0 0.1092372 0 0 4095 1 
i 9.209132 208.4104 0.5378755 80 70.06172 0 0.5120364 0 0 4095 1 
i 9.393168 208.4104 0.5378755 80 70.36361 0 0.5212736 0 0 4095 1 
i 4.569188 208.9134 0.7171673 64 74.30759 0 0.2791463 0 0 4095 1 
i 5.182642 208.9134 0.7171673 70 75.31388 0 0.309937 0 0 4095 1 
i 12.77832 208.9134 0.7171673 88 74.30759 0 0.6911826 0 0 4095 1 
i 13.39177 208.9134 1.269226 94 75.31388 0 0.7219734 0 0 4095 1 
i 1 210.1826 0.5378755 56 70.06105 0 0.1 0 0 4095 1 
i 2.784594 210.1826 0.7171673 47 70.053 0 0.1895731 0 0 4095 1 
i 9.209132 210.1826 0.5378755 80 70.06105 0 0.5120364 0 0 4095 1 
i 10.99373 210.1826 0.7171673 71 70.053 0 0.6016095 0 0 4095 1 
i 4.569188 210.3158 0.7171673 64 74.30692 0 0.2791463 0 0 4095 1 
i 4.753224 210.3158 0.7171673 64 74.60881 0 0.2883835 0 0 4095 1 
i 5.121297 210.3158 0.7171673 69 75.21258 0 0.3068579 0 0 4095 1 
i 5.182642 210.3158 0.7171673 70 75.31321 0 0.309937 0 0 4095 1 
i 12.77832 210.3158 0.7171673 88 74.30692 0 0.6911826 0 0 4095 1 
i 12.96236 210.3158 0.7171673 85 74.60881 0 0.7004199 0 0 4095 1 
i 13.33043 210.3158 0.7171673 93 75.21258 0 0.7188943 0 0 4095 1 
i 13.39177 210.3158 1.406274 94 75.31321 0 0.7219734 0 0 4095 1 
i 1 211.722 0.5378755 57 70.06038 0 0.1 0 0 4095 1 
i 1.306727 211.722 0.5378755 59 70.56352 0 0.1153954 0 0 4095 1 
i 2.784594 211.722 0.7171673 44 70.05233 0 0.1895731 0 0 4095 1 
i 3.827466 211.722 0.7171673 54 71.76302 0 0.2419174 0 0 4095 1 
i 9.209132 211.722 0.5378755 77 70.06038 0 0.5120364 0 0 4095 1 
i 9.515859 211.722 0.5378755 83 70.56352 0 0.5274318 0 0 4095 1 
i 10.99373 211.722 0.7171673 68 70.05233 0 0.6016095 0 0 4095 1 
i 12.0366 211.722 0.7171673 78 71.76302 0 0.6539538 0 0 4095 1 
i 4.569188 211.9302 0.7171673 66 74.30625 0 0.2791463 0 0 4095 1 
i 5.305333 211.9302 0.7171673 70 75.51379 0 0.3160952 0 0 4095 1 
i 12.77832 211.9302 0.7171673 90 74.30625 0 0.6911826 0 0 4095 1 
i 13.51446 211.9302 0.7171673 94 75.51379 0 0.7281316 0 0 4095 1 
i 2.784594 212.3055 0.5378755 68 74.3143 0 0.1895731 0 0 4095 1 
i 10.99373 212.3055 0.9935046 92 74.3143 0 0.6016095 0 0 4095 1 
i 1 213.299 0.5378755 56 70.05971 0 0.1 0 0 4095 1 
i 1.368072 213.299 0.5378755 63 70.66348 0 0.1184745 0 0 4095 1 
i 2.784594 213.299 0.7171673 46 70.05166 0 0.1895731 0 0 4095 1 
i 3.888811 213.299 0.7171673 54 71.86298 0 0.2449965 0 0 4095 1 
i 9.209132 213.299 0.5378755 80 70.05971 0 0.5120364 0 0 4095 1 
i 9.577205 213.299 0.5378755 83 70.66348 0 0.5305108 0 0 4095 1 
i 10.99373 213.299 0.7171673 67 70.05166 0 0.6016095 0 0 4095 1 
i 12.09794 213.299 0.7171673 78 71.86298 0 0.6570329 0 0 4095 1 
i 4.569188 213.3325 0.7171673 67 74.30558 0 0.2791463 0 0 4095 1 
i 4.875915 213.3325 0.7171673 64 74.80872 0 0.2945416 0 0 4095 1 
i 5.121297 213.3325 0.7171673 67 75.21124 0 0.3068579 0 0 4095 1 
i 5.305333 213.3325 0.7171673 70 75.51312 0 0.3160952 0 0 4095 1 
i 12.77832 213.3325 0.7171673 91 74.30558 0 0.6911826 0 0 4095 1 
i 13.08505 213.3325 0.7171673 85 74.80872 0 0.706578 0 0 4095 1 
i 13.33043 213.3325 0.7171673 91 75.21124 0 0.7188943 0 0 4095 1 
i 13.51446 213.3325 0.7171673 94 75.51312 0 0.7281316 0 0 4095 1 
i 2.784594 213.8516 0.5378755 68 74.31363 0 0.1895731 0 0 4095 1 
i 10.99373 213.8516 0.9135066 92 74.31363 0 0.6016095 0 0 4095 1 
i 1 214.7651 0.5378755 56 70.05904 0 0.1 0 0 4095 1 
i 1.184036 214.7651 0.5378755 56 70.36092 0 0.1092372 0 0 4095 1 
i 1.306727 214.7651 0.5378755 57 70.56218 0 0.1153954 0 0 4095 1 
i 1.368072 214.7651 0.5378755 60 70.66281 0 0.1184745 0 0 4095 1 
i 2.784594 214.7651 0.7171673 43 70.05099 0 0.1895731 0 0 4095 1 
i 2.96863 214.7651 0.7171673 43 70.35287 0 0.1988104 0 0 4095 1 
i 3.827466 214.7651 0.7171673 57 71.76168 0 0.2419174 0 0 4095 1 
i 3.888811 214.7651 0.7171673 54 71.86231 0 0.2449965 0 0 4095 1 
i 9.209132 214.7651 0.5378755 80 70.05904 0 0.5120364 0 0 4095 1 
i 9.393168 214.7651 0.5378755 80 70.36092 0 0.5212736 0 0 4095 1 
i 9.515859 214.7651 0.5378755 81 70.56218 0 0.5274318 0 0 4095 1 
i 9.577205 214.7651 0.5378755 80 70.66281 0 0.5305108 0 0 4095 1 
i 10.99373 214.7651 0.7171673 67 70.05099 0 0.6016095 0 0 4095 1 
i 11.17776 214.7651 0.7171673 67 70.35287 0 0.6108467 0 0 4095 1 
i 12.0366 214.7651 0.7171673 77 71.76168 0 0.6539538 0 0 4095 1 
i 12.09794 214.7651 0.7171673 78 71.86231 0 0.6570329 0 0 4095 1 
i 4.569188 214.7691 0.7171673 64 74.30491 0 0.2791463 0 0 4095 1 
i 4.93726 214.7691 0.7171673 64 74.90868 0 0.2976207 0 0 4095 1 
i 5.182642 214.7691 0.7171673 70 75.31119 0 0.309937 0 0 4095 1 
i 5.305333 214.7691 0.7171673 69 75.51245 0 0.3160952 0 0 4095 1 
i 12.77832 214.7691 0.7171673 88 74.30491 0 0.6911826 0 0 4095 1 
i 13.14639 214.7691 0.7171673 88 74.90868 0 0.7096571 0 0 4095 1 
i 13.39177 214.7691 0.7171673 91 75.31119 0 0.7219734 0 0 4095 1 
i 13.51446 214.7691 0.7171673 93 75.51245 0 0.7281316 0 0 4095 1 
i 2.784594 215.4354 0.5378755 69 74.31296 0 0.1895731 0 0 4095 1 
i 10.99373 215.4354 0.6692867 93 74.31296 0 0.6016095 0 0 4095 1 
i 4.569188 216.1047 0.7171673 66 74.30423 0 0.2791463 0 0 4095 1 
i 4.753224 216.1047 0.7171673 66 74.60612 0 0.2883835 0 0 4095 1 
i 4.875915 216.1047 0.7171673 64 74.80738 0 0.2945416 0 0 4095 1 
i 4.93726 216.1047 0.7171673 66 74.90801 0 0.2976207 0 0 4095 1 
i 5.121297 216.1047 0.7171673 70 75.2099 0 0.3068579 0 0 4095 1 
i 5.182642 216.1047 0.7171673 69 75.31052 0 0.309937 0 0 4095 1 
i 5.305333 216.1047 0.7171673 75 75.51178 0 0.3160952 0 0 4095 1 
i 5.489369 216.1047 0.7171673 75 75.81367 0 0.3253324 0 0 4095 1 
i 12.77832 216.1047 0.7171673 90 74.30423 0 0.6911826 0 0 4095 1 
i 12.96236 216.1047 0.7171673 90 74.60612 0 0.7004199 0 0 4095 1 
i 13.08505 216.1047 0.7171673 88 74.80738 0 0.706578 0 0 4095 1 
i 13.14639 216.1047 0.7171673 87 74.90801 0 0.7096571 0 0 4095 1 
i 13.33043 216.1047 0.7171673 94 75.2099 0 0.7188943 0 0 4095 1 
i 13.39177 216.1047 0.7171673 93 75.31052 0 0.7219734 0 0 4095 1 
i 13.51446 216.1047 0.7171673 94 75.51178 0 0.7281316 0 0 4095 1 
i 13.6985 216.1047 0.7171673 99 75.81367 0 0.7373688 0 0 4095 1 
i 2.784594 216.4529 0.7171673 44 70.05031 0 0.1895731 0 0 4095 1 
i 4.011502 216.4529 0.7171673 59 72.06289 0 0.2511547 0 0 4095 1 
i 10.99373 216.4529 0.7171673 68 70.05031 0 0.6016095 0 0 4095 1 
i 12.22063 216.4529 0.7171673 78 72.06289 0 0.663191 0 0 4095 1 
i 1 216.8058 0.5378755 54 70.05836 0 0.1 0 0 4095 1 
i 9.209132 216.8058 0.5378755 78 70.05836 0 0.5120364 0 0 4095 1 
i 2.784594 216.9079 0.5378755 71 74.31229 0 0.1895731 0 0 4095 1 
i 2.96863 216.9079 0.5378755 75 74.61417 0 0.1988104 0 0 4095 1 
i 10.99373 216.9079 0.5378755 95 74.31229 0 0.6016095 0 0 4095 1 
i 11.17776 216.9079 1.011127 95 74.61417 0 0.6108467 0 0 4095 1 
i 2.784594 217.919 0.7171673 44 70.04964 0 0.1895731 0 0 4095 1 
i 3.091321 217.919 0.7171673 43 70.55279 0 0.2049685 0 0 4095 1 
i 3.827466 217.919 0.7171673 54 71.76034 0 0.2419174 0 0 4095 1 
i 4.011502 217.919 0.7171673 59 72.06222 0 0.2511547 0 0 4095 1 
i 10.99373 217.919 0.7171673 68 70.04964 0 0.6016095 0 0 4095 1 
i 11.30045 217.919 0.7171673 67 70.55279 0 0.6170049 0 0 4095 1 
i 12.0366 217.919 0.7171673 78 71.76034 0 0.6539538 0 0 4095 1 
i 12.22063 217.919 0.7171673 78 72.06222 0 0.663191 0 0 4095 1 
i 1 218.3452 0.5378755 56 70.05769 0 0.1 0 0 4095 1 
i 1.552109 218.3452 0.5378755 63 70.96335 0 0.1277117 0 0 4095 1 
i 9.209132 218.3452 0.5378755 80 70.05769 0 0.5120364 0 0 4095 1 
i 9.761241 218.3452 0.5378755 83 70.96335 0 0.5397481 0 0 4095 1 
i 2.784594 218.603 0.5378755 68 74.31161 0 0.1895731 0 0 4095 1 
i 4.569188 218.603 0.7171673 62 74.30356 0 0.2791463 0 0 4095 1 
i 10.99373 218.603 0.5378755 92 74.31161 0 0.6016095 0 0 4095 1 
i 12.77832 218.603 0.8178449 83 74.30356 0 0.6911826 0 0 4095 1 
i 2.784594 219.4208 0.7171673 43 70.04897 0 0.1895731 0 0 4095 1 
i 3.152666 219.4208 0.7171673 43 70.65275 0 0.2080476 0 0 4095 1 
i 3.888811 219.4208 0.7171673 54 71.86029 0 0.2449965 0 0 4095 1 
i 4.011502 219.4208 0.7171673 57 72.06155 0 0.2511547 0 0 4095 1 
i 10.99373 219.4208 0.7171673 67 70.04897 0 0.6016095 0 0 4095 1 
i 11.3618 219.4208 0.7171673 62 70.65275 0 0.620084 0 0 4095 1 
i 12.09794 219.4208 0.7171673 78 71.86029 0 0.6570329 0 0 4095 1 
i 12.22063 219.4208 0.7171673 81 72.06155 0 0.663191 0 0 4095 1 
i 1 219.9222 0.5378755 57 70.05702 0 0.1 0 0 4095 1 
i 1.613454 219.9222 0.5378755 63 71.06331 0 0.1307908 0 0 4095 1 
i 9.209132 219.9222 0.5378755 77 70.05702 0 0.5120364 0 0 4095 1 
i 9.822586 219.9222 0.5378755 87 71.06331 0 0.5428272 0 0 4095 1 
i 2.784594 220.0755 0.5378755 69 74.31094 0 0.1895731 0 0 4095 1 
i 3.091321 220.0755 0.5378755 75 74.81409 0 0.2049685 0 0 4095 1 
i 4.569188 220.0755 0.7171673 56 74.30289 0 0.2791463 0 0 4095 1 
i 5.61206 220.0755 0.7171673 71 76.01358 0 0.3314906 0 0 4095 1 
i 10.99373 220.0755 0.5378755 93 74.31094 0 0.6016095 0 0 4095 1 
i 11.30045 220.0755 0.5378755 99 74.81409 0 0.6170049 0 0 4095 1 
i 12.77832 220.0755 0.7171673 80 74.30289 0 0.6911826 0 0 4095 1 
i 13.82119 220.0755 0.7416563 90 76.01358 0 0.7435269 0 0 4095 1 
i 2.784594 220.8171 0.7171673 44 70.0483 0 0.1895731 0 0 4095 1 
i 2.96863 220.8171 0.7171673 44 70.35019 0 0.1988104 0 0 4095 1 
i 3.091321 220.8171 0.7171673 43 70.55145 0 0.2049685 0 0 4095 1 
i 3.152666 220.8171 0.7171673 40 70.65208 0 0.2080476 0 0 4095 1 
i 3.827466 220.8171 0.7171673 54 71.75899 0 0.2419174 0 0 4095 1 
i 3.888811 220.8171 0.7171673 56 71.85962 0 0.2449965 0 0 4095 1 
i 4.011502 220.8171 0.7171673 59 72.06088 0 0.2511547 0 0 4095 1 
i 4.195539 220.8171 0.7171673 59 72.36277 0 0.2603919 0 0 4095 1 
i 10.99373 220.8171 0.7171673 68 70.0483 0 0.6016095 0 0 4095 1 
i 11.17776 220.8171 0.7171673 68 70.35019 0 0.6108467 0 0 4095 1 
i 11.30045 220.8171 0.7171673 67 70.55145 0 0.6170049 0 0 4095 1 
i 11.3618 220.8171 0.7171673 64 70.65208 0 0.620084 0 0 4095 1 
i 12.0366 220.8171 0.7171673 78 71.75899 0 0.6539538 0 0 4095 1 
i 12.09794 220.8171 0.7171673 77 71.85962 0 0.6570329 0 0 4095 1 
i 12.22063 220.8171 0.7171673 78 72.06088 0 0.663191 0 0 4095 1 
i 12.40467 220.8171 0.7171673 83 72.36277 0 0.6724283 0 0 4095 1 
i 1 221.3883 0.5378755 54 70.05635 0 0.1 0 0 4095 1 
i 1.184036 221.3883 0.5378755 54 70.35824 0 0.1092372 0 0 4095 1 
i 1.552109 221.3883 0.5378755 62 70.96201 0 0.1277117 0 0 4095 1 
i 1.613454 221.3883 0.5378755 60 71.06264 0 0.1307908 0 0 4095 1 
i 9.209132 221.3883 0.5378755 78 70.05635 0 0.5120364 0 0 4095 1 
i 9.393168 221.3883 0.5378755 78 70.35824 0 0.5212736 0 0 4095 1 
i 9.761241 221.3883 0.5378755 81 70.96201 0 0.5397481 0 0 4095 1 
i 9.822586 221.3883 0.5378755 84 71.06264 0 0.5428272 0 0 4095 1 
i 2.784594 221.5839 0.5378755 75 74.31027 0 0.1895731 0 0 4095 1 
i 3.152666 221.5839 0.5378755 75 74.91405 0 0.2080476 0 0 4095 1 
i 4.569188 221.5839 0.7171673 58 74.30222 0 0.2791463 0 0 4095 1 
i 5.673405 221.5839 0.7171673 71 76.11354 0 0.3345696 0 0 4095 1 
i 10.99373 221.5839 0.5378755 95 74.31027 0 0.6016095 0 0 4095 1 
i 11.3618 221.5839 0.5378755 99 74.91405 0 0.620084 0 0 4095 1 
i 12.77832 221.5839 0.7171673 82 74.30222 0 0.6911826 0 0 4095 1 
i 13.88254 221.5839 1.176829 95 76.11354 0 0.746606 0 0 4095 1 
i 2.784594 222.7607 0.7171673 46 70.04763 0 0.1895731 0 0 4095 1 
i 4.256884 222.7607 0.9426934 59 72.46273 0 0.263471 0 0 4095 1 
i 10.99373 222.7607 0.7171673 70 70.04763 0 0.6016095 0 0 4095 1 
i 12.46602 222.7607 0.9426934 78 72.46273 0 0.6755073 0 0 4095 1 
i 2.784594 222.9862 0.5378755 72 74.3096 0 0.1895731 0 0 4095 1 
i 2.96863 222.9862 0.5378755 68 74.61149 0 0.1988104 0 0 4095 1 
i 3.091321 222.9862 0.5378755 74 74.81275 0 0.2049685 0 0 4095 1 
i 3.152666 222.9862 0.5378755 75 74.91338 0 0.2080476 0 0 4095 1 
i 4.569188 222.9862 0.7171673 59 74.30155 0 0.2791463 0 0 4095 1 
i 5.61206 222.9862 0.7171673 69 76.01224 0 0.3314906 0 0 4095 1 
i 5.673405 222.9862 0.7171673 71 76.11287 0 0.3345696 0 0 4095 1 
i 10.99373 222.9862 0.5378755 92 74.3096 0 0.6016095 0 0 4095 1 
i 11.17776 222.9862 0.5378755 92 74.61149 0 0.6108467 0 0 4095 1 
i 11.30045 222.9862 0.5378755 98 74.81275 0 0.6170049 0 0 4095 1 
i 11.3618 222.9862 0.5378755 96 74.91338 0 0.620084 0 0 4095 1 
i 12.77832 222.9862 0.7171673 83 74.30155 0 0.6911826 0 0 4095 1 
i 13.82119 222.9862 0.7171673 93 76.01224 0 0.7435269 0 0 4095 1 
i 13.88254 222.9862 0.7171673 95 76.11287 0 0.746606 0 0 4095 1 
i 1 223.0761 0.5378755 56 70.05568 0 0.1 0 0 4095 1 
i 1.736145 223.0761 0.5378755 63 71.26323 0 0.1369489 0 0 4095 1 
i 9.209132 223.0761 0.5378755 80 70.05568 0 0.5120364 0 0 4095 1 
i 9.945277 223.0761 1.150709 87 71.26323 0 0.5489853 0 0 4095 1 
i 2.784594 224.2268 0.7171673 50 70.04696 0 0.1895731 0 0 4095 1 
i 3.336703 224.2268 0.7171673 43 70.95262 0 0.2172848 0 0 4095 1 
i 3.827466 224.2268 0.7171673 53 71.75765 0 0.2419174 0 0 4095 1 
i 4.256884 224.2268 0.7171673 59 72.46205 0 0.263471 0 0 4095 1 
i 10.99373 224.2268 0.7171673 71 70.04696 0 0.6016095 0 0 4095 1 
i 11.54583 224.2268 0.7171673 67 70.95262 0 0.6293212 0 0 4095 1 
i 12.0366 224.2268 0.7171673 72 71.75765 0 0.6539538 0 0 4095 1 
i 12.46602 224.2268 0.7171673 78 72.46205 0 0.6755073 0 0 4095 1 
i 1 224.5422 0.5378755 56 70.05501 0 0.1 0 0 4095 1 
i 1.306727 224.5422 0.5378755 54 70.55816 0 0.1153954 0 0 4095 1 
i 1.552109 224.5422 0.5378755 56 70.96067 0 0.1277117 0 0 4095 1 
i 1.736145 224.5422 0.5378755 63 71.26256 0 0.1369489 0 0 4095 1 
i 9.209132 224.5422 0.5378755 80 70.05501 0 0.5120364 0 0 4095 1 
i 9.515859 224.5422 0.5378755 78 70.55816 0 0.5274318 0 0 4095 1 
i 9.761241 224.5422 0.5378755 80 70.96067 0 0.5397481 0 0 4095 1 
i 9.945277 224.5422 0.5378755 84 71.26256 0 0.5489853 0 0 4095 1 
i 4.569188 224.6006 0.7171673 56 74.30088 0 0.2791463 0 0 4095 1 
i 5.796096 224.6006 0.7171673 71 76.31346 0 0.3407278 0 0 4095 1 
i 12.77832 224.6006 0.7171673 80 74.30088 0 0.6911826 0 0 4095 1 
i 14.00523 224.6006 0.7171673 95 76.31346 0 0.7527642 0 0 4095 1 
i 2.784594 224.9382 0.5378755 69 74.30893 0 0.1895731 0 0 4095 1 
i 10.99373 224.9382 0.5378755 93 74.30893 0 0.6016095 0 0 4095 1 
i 2.784594 225.4554 0.5378755 51 70.06373 0 0.1895731 0 0 4095 1 
i 10.99373 225.4554 0.5378755 75 70.06373 0 0.6016095 0 0 4095 1 
i 2.784594 225.7286 0.7171673 44 70.04629 0 0.1895731 0 0 4095 1 
i 3.398048 225.7286 0.7171673 43 71.05258 0 0.2203639 0 0 4095 1 
i 3.888811 225.7286 0.7171673 53 71.85761 0 0.2449965 0 0 4095 1 
i 4.256884 225.7286 0.7171673 57 72.46138 0 0.263471 0 0 4095 1 
i 10.99373 225.7286 0.7171673 68 70.04629 0 0.6016095 0 0 4095 1 
i 11.60718 225.7286 0.7171673 62 71.05258 0 0.6324003 0 0 4095 1 
i 12.09794 225.7286 0.7171673 72 71.85761 0 0.6570329 0 0 4095 1 
i 12.46602 225.7286 0.7171673 81 72.46138 0 0.6755073 0 0 4095 1 
i 4.569188 226.003 0.7171673 56 74.30021 0 0.2791463 0 0 4095 1 
i 4.875915 226.003 0.7171673 55 74.80335 0 0.2945416 0 0 4095 1 
i 5.61206 226.003 0.7171673 66 76.0109 0 0.3314906 0 0 4095 1 
i 5.796096 226.003 0.7171673 71 76.31279 0 0.3407278 0 0 4095 1 
i 12.77832 226.003 0.7171673 80 74.30021 0 0.6911826 0 0 4095 1 
i 13.08505 226.003 0.7171673 79 74.80335 0 0.706578 0 0 4095 1 
i 13.82119 226.003 0.7171673 90 76.0109 0 0.7435269 0 0 4095 1 
i 14.00523 226.003 0.7171673 95 76.31279 0 0.7527642 0 0 4095 1 
i 1 226.044 0.5378755 57 70.05434 0 0.1 0 0 4095 1 
i 1.368072 226.044 0.5378755 54 70.65811 0 0.1184745 0 0 4095 1 
i 1.613454 226.044 0.5378755 60 71.06063 0 0.1307908 0 0 4095 1 
i 1.736145 226.044 0.5378755 62 71.26189 0 0.1369489 0 0 4095 1 
i 9.209132 226.044 0.5378755 81 70.05434 0 0.5120364 0 0 4095 1 
i 9.577205 226.044 0.5378755 78 70.65811 0 0.5305108 0 0 4095 1 
i 9.822586 226.044 0.5378755 80 71.06063 0 0.5428272 0 0 4095 1 
i 9.945277 226.044 0.5378755 86 71.26189 0 0.5489853 0 0 4095 1 
i 2.784594 226.4107 0.5378755 68 74.30826 0 0.1895731 0 0 4095 1 
i 3.336703 226.4107 0.5378755 75 75.21392 0 0.2172848 0 0 4095 1 
i 10.99373 226.4107 0.5378755 92 74.30826 0 0.6016095 0 0 4095 1 
i 11.54583 226.4107 0.6610718 99 75.21392 0 0.6293212 0 0 4095 1 
i 2.784594 227.0718 0.5378755 44 70.06306 0 0.1895731 0 0 4095 1 
i 10.99373 227.0718 0.5378755 68 70.06306 0 0.6016095 0 0 4095 1 
i 2.784594 227.1249 0.7171673 50 70.04562 0 0.1895731 0 0 4095 1 
i 2.96863 227.1249 0.7171673 50 70.34751 0 0.1988104 0 0 4095 1 
i 3.336703 227.1249 0.7171673 43 70.95128 0 0.2172848 0 0 4095 1 
i 3.398048 227.1249 0.7171673 40 71.05191 0 0.2203639 0 0 4095 1 
i 3.827466 227.1249 0.7171673 53 71.75631 0 0.2419174 0 0 4095 1 
i 3.888811 227.1249 0.7171673 50 71.85694 0 0.2449965 0 0 4095 1 
i 4.256884 227.1249 0.7171673 59 72.46071 0 0.263471 0 0 4095 1 
i 4.44092 227.1249 0.7171673 59 72.7626 0 0.2727082 0 0 4095 1 
i 10.99373 227.1249 0.7171673 70 70.04562 0 0.6016095 0 0 4095 1 
i 11.17776 227.1249 0.7171673 74 70.34751 0 0.6108467 0 0 4095 1 
i 11.54583 227.1249 0.7171673 67 70.95128 0 0.6293212 0 0 4095 1 
i 11.60718 227.1249 0.7171673 64 71.05191 0 0.6324003 0 0 4095 1 
i 12.0366 227.1249 0.7171673 77 71.75631 0 0.6539538 0 0 4095 1 
i 12.09794 227.1249 0.7171673 74 71.85694 0 0.6570329 0 0 4095 1 
i 12.46602 227.1249 0.7171673 78 72.46071 0 0.6755073 0 0 4095 1 
i 12.65005 227.1249 0.7171673 83 72.7626 0 0.6847446 0 0 4095 1 
i 4.569188 227.4395 0.7171673 59 74.29954 0 0.2791463 0 0 4095 1 
i 4.93726 227.4395 0.7171673 55 74.90331 0 0.2976207 0 0 4095 1 
i 5.673405 227.4395 0.7171673 71 76.11086 0 0.3345696 0 0 4095 1 
i 5.796096 227.4395 0.7171673 69 76.31212 0 0.3407278 0 0 4095 1 
i 12.77832 227.4395 0.7171673 83 74.29954 0 0.6911826 0 0 4095 1 
i 13.14639 227.4395 0.7171673 79 74.90331 0 0.7096571 0 0 4095 1 
i 13.88254 227.4395 0.7171673 90 76.11086 0 0.746606 0 0 4095 1 
i 14.00523 227.4395 0.7171673 93 76.31212 0 0.7527642 0 0 4095 1 
i 1 227.4403 0.5378755 59 70.05367 0 0.1 0 0 4095 1 
i 1.184036 227.4403 0.5378755 59 70.35556 0 0.1092372 0 0 4095 1 
i 1.306727 227.4403 0.5378755 57 70.55681 0 0.1153954 0 0 4095 1 
i 1.368072 227.4403 0.5378755 56 70.65744 0 0.1184745 0 0 4095 1 
i 1.552109 227.4403 0.5378755 63 70.95933 0 0.1277117 0 0 4095 1 
i 1.613454 227.4403 0.5378755 62 71.05996 0 0.1307908 0 0 4095 1 
i 1.736145 227.4403 0.5378755 63 71.26122 0 0.1369489 0 0 4095 1 
i 1.920181 227.4403 0.5378755 63 71.5631 0 0.1461861 0 0 4095 1 
i 9.209132 227.4403 0.5378755 80 70.05367 0 0.5120364 0 0 4095 1 
i 9.393168 227.4403 0.5378755 83 70.35556 0 0.5212736 0 0 4095 1 
i 9.515859 227.4403 0.5378755 81 70.55681 0 0.5274318 0 0 4095 1 
i 9.577205 227.4403 0.5378755 80 70.65744 0 0.5305108 0 0 4095 1 
i 9.761241 227.4403 0.5378755 87 70.95933 0 0.5397481 0 0 4095 1 
i 9.822586 227.4403 0.5378755 81 71.05996 0 0.5428272 0 0 4095 1 
i 9.945277 227.4403 0.5378755 87 71.26122 0 0.5489853 0 0 4095 1 
i 10.12931 227.4403 0.5378755 87 71.5631 0 0.5582225 0 0 4095 1 
i 2.784594 227.9191 0.5378755 69 74.30759 0 0.1895731 0 0 4095 1 
i 3.398048 227.9191 0.5378755 75 75.31388 0 0.2203639 0 0 4095 1 
i 10.99373 227.9191 0.5378755 93 74.30759 0 0.6016095 0 0 4095 1 
i 11.60718 227.9191 0.8084824 99 75.31388 0 0.6324003 0 0 4095 1 
i 2.784594 228.7276 0.5378755 45 70.06239 0 0.1895731 0 0 4095 1 
i 10.99373 228.7276 0.5378755 69 70.06239 0 0.6016095 0 0 4095 1 
i 2.784594 228.7324 0.7171673 47 70.04495 0 0.1895731 0 0 4095 1 
i 3.520739 228.7324 0.7171673 43 71.25249 0 0.226522 0 0 4095 1 
i 4.011502 228.7324 0.7171673 53 72.05753 0 0.2511547 0 0 4095 1 
i 4.256884 228.7324 0.7599326 54 72.46004 0 0.263471 0 0 4095 1 
i 10.99373 228.7324 0.7171673 71 70.04495 0 0.6016095 0 0 4095 1 
i 11.72987 228.7324 0.7171673 62 71.25249 0 0.6385584 0 0 4095 1 
i 12.22063 228.7324 0.7171673 72 72.05753 0 0.663191 0 0 4095 1 
i 12.46602 228.7324 0.7171673 78 72.46004 0 0.6755073 0 0 4095 1 
i 4.569188 228.7751 0.7171673 56 74.29887 0 0.2791463 0 0 4095 1 
i 4.753224 228.7751 0.7171673 56 74.60075 0 0.2883835 0 0 4095 1 
i 4.875915 228.7751 0.7171673 58 74.80201 0 0.2945416 0 0 4095 1 
i 5.61206 228.7751 0.7171673 71 76.00956 0 0.3314906 0 0 4095 1 
i 5.673405 228.7751 0.7171673 68 76.11019 0 0.3345696 0 0 4095 1 
i 5.796096 228.7751 0.7171673 74 76.31145 0 0.3407278 0 0 4095 1 
i 5.980132 228.7751 0.7171673 74 76.61333 0 0.349965 0 0 4095 1 
i 12.77832 228.7751 0.7171673 80 74.29887 0 0.6911826 0 0 4095 1 
i 12.96236 228.7751 0.7171673 80 74.60075 0 0.7004199 0 0 4095 1 
i 13.08505 228.7751 0.7171673 79 74.80201 0 0.706578 0 0 4095 1 
i 13.14639 228.7751 0.7171673 76 74.90264 0 0.7096571 0 0 4095 1 
i 13.82119 228.7751 0.7171673 95 76.00956 0 0.7435269 0 0 4095 1 
i 13.88254 228.7751 0.7171673 92 76.11019 0 0.746606 0 0 4095 1 
i 14.00523 228.7751 0.7171673 95 76.31145 0 0.7527642 0 0 4095 1 
i 14.18926 228.7751 0.7171673 98 76.61333 0 0.7620014 0 0 4095 1 
i 2.784594 229.3214 0.5378755 69 74.30692 0 0.1895731 0 0 4095 1 
i 2.96863 229.3214 0.5378755 69 74.60881 0 0.1988104 0 0 4095 1 
i 3.336703 229.3214 0.5378755 74 75.21258 0 0.2172848 0 0 4095 1 
i 3.398048 229.3214 0.5378755 75 75.31321 0 0.2203639 0 0 4095 1 
i 10.99373 229.3214 0.5378755 93 74.30692 0 0.6016095 0 0 4095 1 
i 11.17776 229.3214 0.5378755 90 74.60881 0 0.6108467 0 0 4095 1 
i 11.54583 229.3214 0.5378755 98 75.21258 0 0.6293212 0 0 4095 1 
i 11.60718 229.3214 0.7307651 99 75.31321 0 0.6324003 0 0 4095 1 
i 1 230.0522 0.5378755 52 70.053 0 0.1 0 0 4095 1 
i 9.209132 230.0522 0.5378755 76 70.053 0 0.5120364 0 0 4095 1 
i 2.784594 230.1286 0.7171673 44 70.04428 0 0.1895731 0 0 4095 1 
i 3.091321 230.1286 0.7171673 50 70.54742 0 0.2049685 0 0 4095 1 
i 3.336703 230.1286 0.7171673 44 70.94994 0 0.2172848 0 0 4095 1 
i 3.520739 230.1286 0.7171673 40 71.25182 0 0.226522 0 0 4095 1 
i 3.827466 230.1286 0.7171673 54 71.75497 0 0.2419174 0 0 4095 1 
i 4.011502 230.1286 0.7171673 50 72.05686 0 0.2511547 0 0 4095 1 
i 4.256884 230.1286 0.7171673 56 72.45937 0 0.263471 0 0 4095 1 
i 4.563611 230.1286 0.7171673 59 72.96252 0 0.2788663 0 0 4095 1 
i 10.99373 230.1286 0.7171673 68 70.04428 0 0.6016095 0 0 4095 1 
i 11.30045 230.1286 0.7171673 74 70.54742 0 0.6170049 0 0 4095 1 
i 11.54583 230.1286 0.7171673 68 70.94994 0 0.6293212 0 0 4095 1 
i 11.72987 230.1286 0.7171673 64 71.25182 0 0.6385584 0 0 4095 1 
i 12.0366 230.1286 0.7171673 78 71.75497 0 0.6539538 0 0 4095 1 
i 12.22063 230.1286 0.7171673 74 72.05686 0 0.663191 0 0 4095 1 
i 12.46602 230.1286 0.7171673 77 72.45937 0 0.6755073 0 0 4095 1 
i 12.77274 230.1286 0.7171673 83 72.96252 0 0.6909027 0 0 4095 1 
i 2.784594 230.267 0.5378755 56 70.06172 0 0.1895731 0 0 4095 1 
i 2.96863 230.267 0.5378755 56 70.36361 0 0.1988104 0 0 4095 1 
i 10.99373 230.267 0.5378755 75 70.06172 0 0.6016095 0 0 4095 1 
i 11.17776 230.267 0.5378755 80 70.36361 0 0.6108467 0 0 4095 1 
i 4.569188 230.6342 0.7171673 62 74.2982 0 0.2791463 0 0 4095 1 
i 6.041478 230.6342 0.7171673 71 76.71329 0 0.3530441 0 0 4095 1 
i 12.77832 230.6342 0.7171673 86 74.2982 0 0.6911826 0 0 4095 1 
i 14.25061 230.6342 0.7171673 95 76.71329 0 0.7650805 0 0 4095 1 
i 2.784594 230.9359 0.5378755 75 74.30625 0 0.1895731 0 0 4095 1 
i 3.520739 230.9359 0.5378755 75 75.51379 0 0.226522 0 0 4095 1 
i 10.99373 230.9359 0.5378755 95 74.30625 0 0.6016095 0 0 4095 1 
i 11.72987 230.9359 0.6231246 99 75.51379 0 0.6385584 0 0 4095 1 
i 2.784594 231.559 0.7171673 46 70.04361 0 0.1895731 0 0 4095 1 
i 3.152666 231.559 0.7171673 50 70.64738 0 0.2080476 0 0 4095 1 
i 3.398048 231.559 0.7171673 44 71.0499 0 0.2203639 0 0 4095 1 
i 3.520739 231.559 0.7171673 43 71.25115 0 0.226522 0 0 4095 1 
i 3.888811 231.559 0.7171673 54 71.85493 0 0.2449965 0 0 4095 1 
i 4.011502 231.559 0.7171673 53 72.05618 0 0.2511547 0 0 4095 1 
i 4.256884 231.559 0.7171673 54 72.4587 0 0.263471 0 0 4095 1 
i 4.624956 231.559 0.7171673 59 73.06247 0 0.2819454 0 0 4095 1 
i 10.99373 231.559 0.7171673 70 70.04361 0 0.6016095 0 0 4095 1 
i 11.3618 231.559 0.7171673 74 70.64738 0 0.620084 0 0 4095 1 
i 11.60718 231.559 0.7171673 68 71.0499 0 0.6324003 0 0 4095 1 
i 11.72987 231.559 0.7171673 67 71.25115 0 0.6385584 0 0 4095 1 
i 12.09794 231.559 0.7171673 78 71.85493 0 0.6570329 0 0 4095 1 
i 12.22063 231.559 0.7171673 72 72.05618 0 0.663191 0 0 4095 1 
i 12.46602 231.559 0.7171673 78 72.4587 0 0.6755073 0 0 4095 1 
i 12.83409 231.559 0.7171673 83 73.06247 0 0.6939818 0 0 4095 1 
i 1 231.5916 0.5378755 49 70.05233 0 0.1 0 0 4095 1 
i 2.042872 231.5916 0.5378755 64 71.76302 0 0.1523443 0 0 4095 1 
i 9.209132 231.5916 0.5378755 73 70.05233 0 0.5120364 0 0 4095 1 
i 10.252 231.5916 0.5378755 83 71.76302 0 0.5643807 0 0 4095 1 
i 4.569188 232.0365 0.7171673 62 74.29753 0 0.2791463 0 0 4095 1 
i 5.121297 232.0365 0.7171673 55 75.20319 0 0.3068579 0 0 4095 1 
i 5.61206 232.0365 0.7171673 65 76.00822 0 0.3314906 0 0 4095 1 
i 6.041478 232.0365 0.7171673 71 76.71262 0 0.3530441 0 0 4095 1 
i 12.77832 232.0365 0.7171673 86 74.29753 0 0.6911826 0 0 4095 1 
i 13.33043 232.0365 0.7171673 79 75.20319 0 0.7188943 0 0 4095 1 
i 13.82119 232.0365 0.7171673 89 76.00822 0 0.7435269 0 0 4095 1 
i 14.25061 232.0365 0.7171673 95 76.71262 0 0.7650805 0 0 4095 1 
i 2.784594 232.0392 0.5378755 39 70.06105 0 0.1895731 0 0 4095 1 
i 10.99373 232.0392 0.5378755 63 70.06105 0 0.6016095 0 0 4095 1 
i 2.784594 232.3382 0.5378755 72 74.30558 0 0.1895731 0 0 4095 1 
i 3.091321 232.3382 0.5378755 69 74.80872 0 0.2049685 0 0 4095 1 
i 3.336703 232.3382 0.5378755 72 75.21124 0 0.2172848 0 0 4095 1 
i 3.520739 232.3382 0.5378755 75 75.51312 0 0.226522 0 0 4095 1 
i 10.99373 232.3382 0.5378755 92 74.30558 0 0.6016095 0 0 4095 1 
i 11.30045 232.3382 0.5378755 93 74.80872 0 0.6170049 0 0 4095 1 
i 11.54583 232.3382 0.5378755 96 75.21124 0 0.6293212 0 0 4095 1 
i 11.72987 232.3382 0.5505641 99 75.51312 0 0.6385584 0 0 4095 1 
i 2.784594 232.8888 0.7171673 47 70.04294 0 0.1895731 0 0 4095 1 
i 2.96863 232.8888 0.7171673 47 70.34482 0 0.1988104 0 0 4095 1 
i 3.091321 232.8888 0.7171673 49 70.54608 0 0.2049685 0 0 4095 1 
i 3.152666 232.8888 0.7171673 50 70.64671 0 0.2080476 0 0 4095 1 
i 3.336703 232.8888 0.7171673 43 70.9486 0 0.2172848 0 0 4095 1 
i 3.398048 232.8888 0.7171673 44 71.04922 0 0.2203639 0 0 4095 1 
i 3.520739 232.8888 0.7171673 43 71.25048 0 0.226522 0 0 4095 1 
i 3.704775 232.8888 0.7171673 38 71.55237 0 0.2357593 0 0 4095 1 
i 3.827466 232.8888 0.7171673 53 71.75363 0 0.2419174 0 0 4095 1 
i 3.888811 232.8888 0.7171673 54 71.85426 0 0.2449965 0 0 4095 1 
i 4.011502 232.8888 0.7171673 53 72.05551 0 0.2511547 0 0 4095 1 
i 4.195539 232.8888 0.7171673 48 72.3574 0 0.2603919 0 0 4095 1 
i 4.256884 232.8888 0.7171673 54 72.45803 0 0.263471 0 0 4095 1 
i 4.44092 232.8888 0.7171673 54 72.75992 0 0.2727082 0 0 4095 1 
i 4.563611 232.8888 0.7171673 57 72.96117 0 0.2788663 0 0 4095 1 
i 4.624956 232.8888 0.7171673 59 73.0618 0 0.2819454 0 0 4095 1 
i 10.99373 232.8888 0.7171673 71 70.04294 0 0.6016095 0 0 4095 1 
i 11.17776 232.8888 0.7171673 67 70.34482 0 0.6108467 0 0 4095 1 
i 11.30045 232.8888 0.7171673 68 70.54608 0 0.6170049 0 0 4095 1 
i 11.3618 232.8888 0.7171673 74 70.64671 0 0.620084 0 0 4095 1 
i 11.54583 232.8888 0.7171673 67 70.9486 0 0.6293212 0 0 4095 1 
i 11.60718 232.8888 0.7171673 68 71.04922 0 0.6324003 0 0 4095 1 
i 11.72987 232.8888 0.7171673 67 71.25048 0 0.6385584 0 0 4095 1 
i 11.91391 232.8888 0.7171673 62 71.55237 0 0.6477957 0 0 4095 1 
i 12.0366 232.8888 0.7171673 77 71.75363 0 0.6539538 0 0 4095 1 
i 12.09794 232.8888 0.7171673 75 71.85426 0 0.6570329 0 0 4095 1 
i 12.22063 232.8888 0.7171673 72 72.05551 0 0.663191 0 0 4095 1 
i 12.40467 232.8888 0.7171673 72 72.3574 0 0.6724283 0 0 4095 1 
i 12.46602 232.8888 0.7171673 78 72.45803 0 0.6755073 0 0 4095 1 
i 12.65005 232.8888 0.7171673 78 72.75992 0 0.6847446 0 0 4095 1 
i 12.77274 232.8888 0.7171673 81 72.96117 0 0.6909027 0 0 4095 1 
i 12.83409 232.8888 0.7171673 83 73.0618 0 0.6939818 0 0 4095 1 
i 1 233.1686 0.5378755 51 70.05166 0 0.1 0 0 4095 1 
i 2.104217 233.1686 0.5378755 64 71.86298 0 0.1554234 0 0 4095 1 
i 9.209132 233.1686 0.5378755 75 70.05166 0 0.5120364 0 0 4095 1 
i 10.31335 233.1686 0.5378755 88 71.86298 0 0.5674598 0 0 4095 1 
i 4.569188 233.2117 0.5378755 63 74.3143 0 0.2791463 0 0 4095 1 
i 12.77832 233.2117 0.5378755 87 74.3143 0 0.6911826 0 0 4095 1 
i 4.569188 233.4731 0.7171673 61 74.29686 0 0.2791463 0 0 4095 1 
i 5.182642 233.4731 0.7171673 55 75.30314 0 0.309937 0 0 4095 1 
i 5.673405 233.4731 0.7171673 65 76.10818 0 0.3345696 0 0 4095 1 
i 6.041478 233.4731 0.7171673 69 76.71195 0 0.3530441 0 0 4095 1 
i 12.77832 233.4731 0.7171673 85 74.29686 0 0.6911826 0 0 4095 1 
i 13.39177 233.4731 0.7171673 79 75.30314 0 0.7219734 0 0 4095 1 
i 13.88254 233.4731 0.7171673 89 76.10818 0 0.746606 0 0 4095 1 
i 14.25061 233.4731 0.7171673 93 76.71195 0 0.7650805 0 0 4095 1 
i 2.784594 233.5786 0.5378755 53 70.06038 0 0.1895731 0 0 4095 1 
i 3.091321 233.5786 0.5378755 59 70.56352 0 0.2049685 0 0 4095 1 
i 10.99373 233.5786 0.5378755 77 70.06038 0 0.6016095 0 0 4095 1 
i 11.30045 233.5786 0.5378755 83 70.56352 0 0.6170049 0 0 4095 1 
i 2.784594 233.7748 0.5378755 74 74.30491 0 0.1895731 0 0 4095 1 
i 3.152666 233.7748 0.5378755 69 74.90868 0 0.2080476 0 0 4095 1 
i 3.398048 233.7748 0.5378755 75 75.31119 0 0.2203639 0 0 4095 1 
i 3.520739 233.7748 0.5378755 78 75.51245 0 0.226522 0 0 4095 1 
i 10.99373 233.7748 0.5378755 93 74.30491 0 0.6016095 0 0 4095 1 
i 11.3618 233.7748 0.5378755 93 74.90868 0 0.620084 0 0 4095 1 
i 11.60718 233.7748 0.5378755 96 75.31119 0 0.6324003 0 0 4095 1 
i 11.72987 233.7748 0.8598844 98 75.51245 0 0.6385584 0 0 4095 1 
i 1 234.6347 0.5378755 52 70.05099 0 0.1 0 0 4095 1 
i 1.184036 234.6347 0.5378755 48 70.35287 0 0.1092372 0 0 4095 1 
i 2.042872 234.6347 0.5378755 62 71.76168 0 0.1523443 0 0 4095 1 
i 2.104217 234.6347 0.5378755 64 71.86231 0 0.1554234 0 0 4095 1 
i 9.209132 234.6347 0.5378755 72 70.05099 0 0.5120364 0 0 4095 1 
i 9.393168 234.6347 0.5378755 72 70.35287 0 0.5212736 0 0 4095 1 
i 10.252 234.6347 0.5378755 82 71.76168 0 0.5643807 0 0 4095 1 
i 10.31335 234.6347 0.5378755 88 71.86231 0 0.5674598 0 0 4095 1 
i 4.569188 234.7578 0.5378755 56 74.31363 0 0.2791463 0 0 4095 1 
i 12.77832 234.7578 0.5378755 80 74.31363 0 0.6911826 0 0 4095 1 
i 4.569188 234.8087 0.7171673 62 74.29618 0 0.2791463 0 0 4095 1 
i 4.753224 234.8087 0.7171673 62 74.59807 0 0.2883835 0 0 4095 1 
i 5.121297 234.8087 0.7171673 58 75.20184 0 0.3068579 0 0 4095 1 
i 5.182642 234.8087 0.7171673 56 75.30247 0 0.309937 0 0 4095 1 
i 5.61206 234.8087 0.7171673 65 76.00688 0 0.3314906 0 0 4095 1 
i 5.673405 234.8087 0.7171673 66 76.10751 0 0.3345696 0 0 4095 1 
i 6.041478 234.8087 0.7171673 74 76.71128 0 0.3530441 0 0 4095 1 
i 6.225514 234.8087 0.7171673 74 77.01317 0 0.3622813 0 0 4095 1 
i 12.77832 234.8087 0.7171673 86 74.29618 0 0.6911826 0 0 4095 1 
i 12.96236 234.8087 0.7171673 86 74.59807 0 0.7004199 0 0 4095 1 
i 13.33043 234.8087 0.7171673 79 75.20184 0 0.7188943 0 0 4095 1 
i 13.39177 234.8087 0.7171673 76 75.30247 0 0.7219734 0 0 4095 1 
i 13.82119 234.8087 0.7171673 89 76.00688 0 0.7435269 0 0 4095 1 
i 13.88254 234.8087 0.7171673 86 76.10751 0 0.746606 0 0 4095 1 
i 14.25061 234.8087 0.7171673 95 76.71128 0 0.7650805 0 0 4095 1 
i 14.43465 234.8087 0.7171673 98 77.01317 0 0.7743177 0 0 4095 1 
i 2.784594 235.1104 0.5378755 75 74.30423 0 0.1895731 0 0 4095 1 
i 2.96863 235.1104 0.5378755 75 74.60612 0 0.1988104 0 0 4095 1 
i 3.091321 235.1104 0.5378755 69 74.80738 0 0.2049685 0 0 4095 1 
i 3.152666 235.1104 0.5378755 71 74.90801 0 0.2080476 0 0 4095 1 
i 3.336703 235.1104 0.5378755 75 75.2099 0 0.2172848 0 0 4095 1 
i 3.398048 235.1104 0.5378755 74 75.31052 0 0.2203639 0 0 4095 1 
i 3.520739 235.1104 0.5378755 75 75.51178 0 0.226522 0 0 4095 1 
i 3.704775 235.1104 0.5378755 80 75.81367 0 0.2357593 0 0 4095 1 
i 10.99373 235.1104 0.5378755 95 74.30423 0 0.6016095 0 0 4095 1 
i 11.17776 235.1104 0.5378755 99 74.60612 0 0.6108467 0 0 4095 1 
i 11.30045 235.1104 0.5378755 93 74.80738 0 0.6170049 0 0 4095 1 
i 11.3618 235.1104 0.5378755 92 74.90801 0 0.620084 0 0 4095 1 
i 11.54583 235.1104 0.5378755 99 75.2099 0 0.6293212 0 0 4095 1 
i 11.60718 235.1104 0.5378755 98 75.31052 0 0.6324003 0 0 4095 1 
i 11.72987 235.1104 0.5378755 99 75.51178 0 0.6385584 0 0 4095 1 
i 11.91391 235.1104 0.5378755 99 75.81367 0 0.6477957 0 0 4095 1 
i 2.784594 235.1555 0.5378755 44 70.05971 0 0.1895731 0 0 4095 1 
i 3.152666 235.1555 0.5378755 44 70.66348 0 0.2080476 0 0 4095 1 
i 10.99373 235.1555 0.5378755 68 70.05971 0 0.6016095 0 0 4095 1 
i 11.3618 235.1555 1.166943 68 70.66348 0 0.620084 0 0 4095 1 
i 1 236.3225 0.5378755 49 70.05031 0 0.1 0 0 4095 1 
i 2.226908 236.3225 0.5378755 64 72.06289 0 0.1615815 0 0 4095 1 
i 9.209132 236.3225 0.5378755 73 70.05031 0 0.5120364 0 0 4095 1 
i 10.43604 236.3225 0.5378755 88 72.06289 0 0.5736179 0 0 4095 1 
i 4.569188 236.3416 0.5378755 62 74.31296 0 0.2791463 0 0 4095 1 
i 12.77832 236.3416 0.5378755 86 74.31296 0 0.6911826 0 0 4095 1 
i 4.569188 236.3462 0.7171673 62 74.29551 0 0.2791463 0 0 4095 1 
i 5.305333 236.3462 0.7171673 55 75.50306 0 0.3160952 0 0 4095 1 
i 5.796096 236.3462 0.7171673 65 76.30809 0 0.3407278 0 0 4095 1 
i 6.041478 236.3462 0.7171673 71 76.71061 0 0.3530441 0 0 4095 1 
i 12.77832 236.3462 0.7171673 83 74.29551 0 0.6911826 0 0 4095 1 
i 13.51446 236.3462 0.7171673 79 75.50306 0 0.7281316 0 0 4095 1 
i 14.00523 236.3462 0.7171673 89 76.30809 0 0.7527642 0 0 4095 1 
i 14.25061 236.3462 0.7171673 95 76.71061 0 0.7650805 0 0 4095 1 
i 2.784594 236.6216 0.5378755 39 70.05904 0 0.1895731 0 0 4095 1 
i 2.96863 236.6216 0.5378755 39 70.36092 0 0.1988104 0 0 4095 1 
i 3.091321 236.6216 0.5378755 38 70.56218 0 0.2049685 0 0 4095 1 
i 3.152666 236.6216 0.5378755 36 70.66281 0 0.2080476 0 0 4095 1 
i 10.99373 236.6216 0.5378755 63 70.05904 0 0.6016095 0 0 4095 1 
i 11.17776 236.6216 0.5378755 63 70.36092 0 0.6108467 0 0 4095 1 
i 11.30045 236.6216 0.5378755 62 70.56218 0 0.6170049 0 0 4095 1 
i 11.3618 236.6216 0.987061 56 70.66281 0 0.620084 0 0 4095 1 
i 2.784594 237.6087 0.5378755 67 74.30356 0 0.1895731 0 0 4095 1 
i 10.99373 237.6087 0.5378755 88 74.30356 0 0.6016095 0 0 4095 1 
i 4.569188 237.6818 0.7171673 61 74.29484 0 0.2791463 0 0 4095 1 
i 4.875915 237.6818 0.7171673 62 74.79799 0 0.2945416 0 0 4095 1 
i 5.121297 237.6818 0.7171673 56 75.2005 0 0.3068579 0 0 4095 1 
i 5.305333 237.6818 0.7171673 56 75.50239 0 0.3160952 0 0 4095 1 
i 5.61206 237.6818 0.7171673 66 76.00553 0 0.3314906 0 0 4095 1 
i 5.796096 237.6818 0.7171673 66 76.30742 0 0.3407278 0 0 4095 1 
i 6.041478 237.6818 0.7171673 68 76.70994 0 0.3530441 0 0 4095 1 
i 6.348205 237.6818 0.7171673 74 77.21308 0 0.3684395 0 0 4095 1 
i 12.77832 237.6818 0.7171673 80 74.29484 0 0.6911826 0 0 4095 1 
i 13.08505 237.6818 0.7171673 86 74.79799 0 0.706578 0 0 4095 1 
i 13.33043 237.6818 0.7171673 80 75.2005 0 0.7188943 0 0 4095 1 
i 13.51446 237.6818 0.7171673 76 75.50239 0 0.7281316 0 0 4095 1 
i 13.82119 237.6818 0.7171673 90 76.00553 0 0.7435269 0 0 4095 1 
i 14.00523 237.6818 0.7171673 86 76.30742 0 0.7527642 0 0 4095 1 
i 14.25061 237.6818 0.7171673 92 76.70994 0 0.7650805 0 0 4095 1 
i 14.55734 237.6818 0.7171673 98 77.21308 0 0.7804759 0 0 4095 1 
i 1 237.7886 0.5378755 49 70.04964 0 0.1 0 0 4095 1 
i 1.306727 237.7886 0.5378755 48 70.55279 0 0.1153954 0 0 4095 1 
i 2.042872 237.7886 0.5378755 59 71.76034 0 0.1523443 0 0 4095 1 
i 2.226908 237.7886 0.5378755 64 72.06222 0 0.1615815 0 0 4095 1 
i 9.209132 237.7886 0.5378755 73 70.04964 0 0.5120364 0 0 4095 1 
i 9.515859 237.7886 0.5378755 67 70.55279 0 0.5274318 0 0 4095 1 
i 10.252 237.7886 0.5378755 83 71.76034 0 0.5643807 0 0 4095 1 
i 10.43604 237.7886 0.5378755 88 72.06222 0 0.5736179 0 0 4095 1 
i 4.569188 237.8141 0.5378755 68 74.31229 0 0.2791463 0 0 4095 1 
i 4.753224 237.8141 0.5378755 71 74.61417 0 0.2883835 0 0 4095 1 
i 12.77832 237.8141 0.5378755 92 74.31229 0 0.6911826 0 0 4095 1 
i 12.96236 237.8141 0.8482489 92 74.61417 0 0.7004199 0 0 4095 1 
i 2.784594 238.6624 0.5378755 50 70.05836 0 0.1895731 0 0 4095 1 
i 10.99373 238.6624 0.5378755 74 70.05836 0 0.6016095 0 0 4095 1 
i 4.569188 239.0499 0.7171673 62 74.29417 0 0.2791463 0 0 4095 1 
i 4.93726 239.0499 0.7171673 62 74.89795 0 0.2976207 0 0 4095 1 
i 5.182642 239.0499 0.7171673 56 75.30046 0 0.309937 0 0 4095 1 
i 5.305333 239.0499 0.7171673 55 75.50172 0 0.3160952 0 0 4095 1 
i 5.673405 239.0499 0.7171673 66 76.10549 0 0.3345696 0 0 4095 1 
i 5.796096 239.0499 0.7171673 65 76.30675 0 0.3407278 0 0 4095 1 
i 6.041478 239.0499 0.7171673 71 76.70927 0 0.3530441 0 0 4095 1 
i 6.40955 239.0499 0.7171673 74 77.31304 0 0.3715185 0 0 4095 1 
i 12.77832 239.0499 0.7171673 86 74.29417 0 0.6911826 0 0 4095 1 
i 13.14639 239.0499 0.7171673 86 74.89795 0 0.7096571 0 0 4095 1 
i 13.39177 239.0499 0.7171673 80 75.30046 0 0.7219734 0 0 4095 1 
i 13.51446 239.0499 0.7171673 79 75.50172 0 0.7281316 0 0 4095 1 
i 13.88254 239.0499 0.7171673 90 76.10549 0 0.746606 0 0 4095 1 
i 14.00523 239.0499 0.7171673 89 76.30675 0 0.7527642 0 0 4095 1 
i 14.25061 239.0499 0.7171673 95 76.70927 0 0.7650805 0 0 4095 1 
i 14.61868 239.0499 0.7171673 98 77.31304 0 0.7835549 0 0 4095 1 
i 2.784594 239.0811 0.5378755 66 74.30289 0 0.1895731 0 0 4095 1 
i 3.827466 239.0811 0.5378755 76 76.01358 0 0.2419174 0 0 4095 1 
i 10.99373 239.0811 0.5378755 90 74.30289 0 0.6016095 0 0 4095 1 
i 12.0366 239.0811 0.5378755 100 76.01358 0 0.6539538 0 0 4095 1 
i 1 239.2904 0.5378755 52 70.04897 0 0.1 0 0 4095 1 
i 1.368072 239.2904 0.5378755 48 70.65275 0 0.1184745 0 0 4095 1 
i 2.104217 239.2904 0.5378755 59 71.86029 0 0.1554234 0 0 4095 1 
i 2.226908 239.2904 0.5378755 62 72.06155 0 0.1615815 0 0 4095 1 
i 9.209132 239.2904 0.5378755 72 70.04897 0 0.5120364 0 0 4095 1 
i 9.577205 239.2904 0.5378755 67 70.65275 0 0.5305108 0 0 4095 1 
i 10.31335 239.2904 0.5378755 83 71.86029 0 0.5674598 0 0 4095 1 
i 10.43604 239.2904 0.5378755 86 72.06155 0 0.5736179 0 0 4095 1 
i 4.569188 239.5092 0.5378755 56 74.31161 0 0.2791463 0 0 4095 1 
i 12.77832 239.5092 0.6925129 80 74.31161 0 0.6911826 0 0 4095 1 
i 2.784594 240.2018 0.5378755 44 70.05769 0 0.1895731 0 0 4095 1 
i 3.336703 240.2018 0.5378755 32 70.96335 0 0.2172848 0 0 4095 1 
i 10.99373 240.2018 0.5378755 63 70.05769 0 0.6016095 0 0 4095 1 
i 11.54583 240.2018 0.5378755 51 70.96335 0 0.6293212 0 0 4095 1 
i 4.569188 240.3219 0.7171673 62 74.2935 0 0.2791463 0 0 4095 1 
i 4.753224 240.3219 0.7171673 59 74.59539 0 0.2883835 0 0 4095 1 
i 4.875915 240.3219 0.7171673 61 74.79665 0 0.2945416 0 0 4095 1 
i 4.93726 240.3219 0.7171673 62 74.89727 0 0.2976207 0 0 4095 1 
i 5.121297 240.3219 0.7171673 59 75.19916 0 0.3068579 0 0 4095 1 
i 5.182642 240.3219 0.7171673 56 75.29979 0 0.309937 0 0 4095 1 
i 5.305333 240.3219 0.7171673 55 75.50105 0 0.3160952 0 0 4095 1 
i 5.489369 240.3219 0.7171673 55 75.80294 0 0.3253324 0 0 4095 1 
i 5.61206 240.3219 0.7171673 65 76.00419 0 0.3314906 0 0 4095 1 
i 5.673405 240.3219 0.7171673 66 76.10482 0 0.3345696 0 0 4095 1 
i 5.796096 240.3219 0.7171673 65 76.30608 0 0.3407278 0 0 4095 1 
i 5.980132 240.3219 0.7171673 65 76.60797 0 0.349965 0 0 4095 1 
i 6.041478 240.3219 0.7171673 71 76.7086 0 0.3530441 0 0 4095 1 
i 6.225514 240.3219 0.7171673 71 77.01048 0 0.3622813 0 0 4095 1 
i 6.348205 240.3219 0.7171673 69 77.21174 0 0.3684395 0 0 4095 1 
i 6.40955 240.3219 0.7171673 75 77.31237 0 0.3715185 0 0 4095 1 
i 12.77832 240.3219 0.7171673 86 74.2935 0 0.6911826 0 0 4095 1 
i 12.96236 240.3219 0.7171673 83 74.59539 0 0.7004199 0 0 4095 1 
i 13.08505 240.3219 0.7171673 85 74.79665 0 0.706578 0 0 4095 1 
i 13.14639 240.3219 0.7171673 86 74.89727 0 0.7096571 0 0 4095 1 
i 13.33043 240.3219 0.7171673 79 75.19916 0 0.7188943 0 0 4095 1 
i 13.39177 240.3219 0.7171673 80 75.29979 0 0.7219734 0 0 4095 1 
i 13.51446 240.3219 0.7171673 79 75.50105 0 0.7281316 0 0 4095 1 
i 13.6985 240.3219 0.7171673 79 75.80294 0 0.7373688 0 0 4095 1 
i 13.82119 240.3219 0.7171673 89 76.00419 0 0.7435269 0 0 4095 1 
i 13.88254 240.3219 0.7171673 90 76.10482 0 0.746606 0 0 4095 1 
i 14.00523 240.3219 0.7171673 89 76.30608 0 0.7527642 0 0 4095 1 
i 14.18926 240.3219 0.7171673 89 76.60797 0 0.7620014 0 0 4095 1 
i 14.25061 240.3219 0.7171673 95 76.7086 0 0.7650805 0 0 4095 1 
i 14.43465 240.3219 0.7171673 90 77.01048 0 0.7743177 0 0 4095 1 
i 14.55734 240.3219 0.7171673 93 77.21174 0 0.7804759 0 0 4095 1 
i 14.61868 240.3219 0.7171673 95 77.31237 0 0.7835549 0 0 4095 1 
i 2.784594 240.5895 0.5378755 63 74.30222 0 0.1895731 0 0 4095 1 
i 3.888811 240.5895 0.5378755 76 76.11354 0 0.2449965 0 0 4095 1 
i 10.99373 240.5895 0.5378755 87 74.30222 0 0.6016095 0 0 4095 1 
i 12.09794 240.5895 0.5378755 100 76.11354 0 0.6570329 0 0 4095 1 
i 1 240.6867 0.5378755 49 70.0483 0 0.1 0 0 4095 1 
i 1.184036 240.6867 0.5378755 49 70.35019 0 0.1092372 0 0 4095 1 
i 1.306727 240.6867 0.5378755 48 70.55145 0 0.1153954 0 0 4095 1 
i 1.368072 240.6867 0.5378755 49 70.65208 0 0.1184745 0 0 4095 1 
i 2.042872 240.6867 0.5378755 64 71.75899 0 0.1523443 0 0 4095 1 
i 2.104217 240.6867 0.5378755 61 71.85962 0 0.1554234 0 0 4095 1 
i 2.226908 240.6867 0.5378755 64 72.06088 0 0.1615815 0 0 4095 1 
i 2.410945 240.6867 0.5378755 64 72.36277 0 0.1708188 0 0 4095 1 
i 9.209132 240.6867 0.5378755 73 70.0483 0 0.5120364 0 0 4095 1 
i 9.393168 240.6867 0.5378755 73 70.35019 0 0.5212736 0 0 4095 1 
i 9.515859 240.6867 0.5378755 72 70.55145 0 0.5274318 0 0 4095 1 
i 9.577205 240.6867 0.5378755 69 70.65208 0 0.5305108 0 0 4095 1 
i 10.252 240.6867 0.5378755 88 71.75899 0 0.5643807 0 0 4095 1 
i 10.31335 240.6867 0.5378755 82 71.85962 0 0.5674598 0 0 4095 1 
i 10.43604 240.6867 0.5378755 88 72.06088 0 0.5736179 0 0 4095 1 
i 10.62008 240.6867 0.5378755 88 72.36277 0 0.5828551 0 0 4095 1 
i 4.569188 240.9817 0.5378755 69 74.31094 0 0.2791463 0 0 4095 1 
i 4.875915 240.9817 0.5378755 75 74.81409 0 0.2945416 0 0 4095 1 
i 12.77832 240.9817 0.5378755 89 74.31094 0 0.6911826 0 0 4095 1 
i 13.08505 240.9817 0.7969899 99 74.81409 0 0.706578 0 0 4095 1 
i 2.784594 241.7787 0.5378755 53 70.05702 0 0.1895731 0 0 4095 1 
i 3.398048 241.7787 0.5378755 63 71.06331 0 0.2203639 0 0 4095 1 
i 10.99373 241.7787 0.5378755 74 70.05702 0 0.6016095 0 0 4095 1 
i 11.60718 241.7787 0.5378755 83 71.06331 0 0.6324003 0 0 4095 1 
i 2.784594 241.9919 0.5378755 64 74.30155 0 0.1895731 0 0 4095 1 
i 2.96863 241.9919 0.5378755 64 74.60344 0 0.1988104 0 0 4095 1 
i 3.827466 241.9919 0.5378755 74 76.01224 0 0.2419174 0 0 4095 1 
i 3.888811 241.9919 0.5378755 76 76.11287 0 0.2449965 0 0 4095 1 
i 10.99373 241.9919 0.5378755 88 74.30155 0 0.6016095 0 0 4095 1 
i 11.17776 241.9919 0.5378755 88 74.60344 0 0.6108467 0 0 4095 1 
i 12.0366 241.9919 0.5378755 98 76.01224 0 0.6539538 0 0 4095 1 
i 12.09794 241.9919 0.5378755 100 76.11287 0 0.6570329 0 0 4095 1 
i 4.569188 242.4901 0.5378755 59 74.31027 0 0.2791463 0 0 4095 1 
i 4.93726 242.4901 0.5378755 59 74.91405 0 0.2976207 0 0 4095 1 
i 12.77832 242.4901 0.5378755 83 74.31027 0 0.6911826 0 0 4095 1 
i 13.14639 242.4901 0.5378755 80 74.91405 0 0.7096571 0 0 4095 1 
i 1 242.6303 0.5378755 51 70.04763 0 0.1 0 0 4095 1 
i 2.47229 242.6303 0.5378755 64 72.46273 0 0.1738978 0 0 4095 1 
i 9.209132 242.6303 0.5378755 75 70.04763 0 0.5120364 0 0 4095 1 
i 10.68142 242.6303 0.6145456 88 72.46273 0 0.5859342 0 0 4095 1 
i 2.784594 243.2448 0.5378755 50 70.05635 0 0.1895731 0 0 4095 1 
i 3.336703 243.2448 0.5378755 50 70.96201 0 0.2172848 0 0 4095 1 
i 10.99373 243.2448 0.5378755 69 70.05635 0 0.6016095 0 0 4095 1 
i 11.17776 243.2448 0.5378755 69 70.35824 0 0.6108467 0 0 4095 1 
i 11.54583 243.2448 0.5378755 74 70.96201 0 0.6293212 0 0 4095 1 
i 2.784594 243.6063 0.5378755 66 74.30088 0 0.1895731 0 0 4095 1 
i 4.011502 243.6063 0.5378755 76 76.31346 0 0.2511547 0 0 4095 1 
i 10.99373 243.6063 0.5378755 90 74.30088 0 0.6016095 0 0 4095 1 
i 12.22063 243.6063 0.5378755 100 76.31346 0 0.663191 0 0 4095 1 
i 4.569188 243.8925 0.5378755 51 74.3096 0 0.2791463 0 0 4095 1 
i 4.753224 243.8925 0.5378755 56 74.61149 0 0.2883835 0 0 4095 1 
i 4.875915 243.8925 0.5378755 54 74.81275 0 0.2945416 0 0 4095 1 
i 4.93726 243.8925 0.5378755 51 74.91338 0 0.2976207 0 0 4095 1 
i 12.77832 243.8925 0.5378755 75 74.3096 0 0.6911826 0 0 4095 1 
i 12.96236 243.8925 0.5378755 80 74.61149 0 0.7004199 0 0 4095 1 
i 13.08505 243.8925 0.5378755 74 74.81275 0 0.706578 0 0 4095 1 
i 13.14639 243.8925 0.5378755 72 74.91338 0 0.7096571 0 0 4095 1 
i 1 244.0964 0.5378755 52 70.04696 0 0.1 0 0 4095 1 
i 1.552109 244.0964 0.5378755 48 70.95262 0 0.1277117 0 0 4095 1 
i 2.042872 244.0964 0.5378755 58 71.75765 0 0.1523443 0 0 4095 1 
i 2.47229 244.0964 0.5378755 64 72.46205 0 0.1738978 0 0 4095 1 
i 9.209132 244.0964 0.5378755 76 70.04696 0 0.5120364 0 0 4095 1 
i 9.761241 244.0964 0.5378755 67 70.95262 0 0.5397481 0 0 4095 1 
i 10.252 244.0964 0.5378755 82 71.75765 0 0.5643807 0 0 4095 1 
i 10.68142 244.0964 0.8362484 88 72.46205 0 0.5859342 0 0 4095 1 
i 2.784594 244.9326 0.5378755 39 70.05568 0 0.1895731 0 0 4095 1 
i 3.520739 244.9326 0.5378755 32 71.26323 0 0.226522 0 0 4095 1 
i 10.99373 244.9326 0.5378755 63 70.05568 0 0.6016095 0 0 4095 1 
i 11.72987 244.9326 0.5378755 56 71.26323 0 0.6385584 0 0 4095 1 
i 2.784594 245.0087 0.5378755 66 74.30021 0 0.1895731 0 0 4095 1 
i 3.091321 245.0087 0.5378755 64 74.80335 0 0.2049685 0 0 4095 1 
i 3.827466 245.0087 0.5378755 76 76.0109 0 0.2419174 0 0 4095 1 
i 4.011502 245.0087 0.5378755 76 76.31279 0 0.2511547 0 0 4095 1 
i 10.99373 245.0087 0.5378755 90 74.30021 0 0.6016095 0 0 4095 1 
i 11.30045 245.0087 0.5378755 84 74.80335 0 0.6170049 0 0 4095 1 
i 12.0366 245.0087 0.5378755 100 76.0109 0 0.6539538 0 0 4095 1 
i 12.22063 245.0087 0.5895501 100 76.31279 0 0.663191 0 0 4095 1 
i 1 245.5982 0.5378755 54 70.04629 0 0.1 0 0 4095 1 
i 1.613454 245.5982 0.5378755 48 71.05258 0 0.1307908 0 0 4095 1 
i 2.104217 245.5982 0.5378755 58 71.85761 0 0.1554234 0 0 4095 1 
i 2.47229 245.5982 0.5378755 62 72.46138 0 0.1738978 0 0 4095 1 
i 9.209132 245.5982 0.5378755 78 70.04629 0 0.5120364 0 0 4095 1 
i 9.822586 245.5982 0.5378755 67 71.05258 0 0.5428272 0 0 4095 1 
i 10.31335 245.5982 0.5378755 77 71.85761 0 0.5674598 0 0 4095 1 
i 10.68142 245.5982 0.5378755 86 72.46138 0 0.5859342 0 0 4095 1 
i 4.569188 245.8445 0.5378755 66 74.30893 0 0.2791463 0 0 4095 1 
i 12.77832 245.8445 0.5542363 90 74.30893 0 0.6911826 0 0 4095 1 
i 2.784594 246.3987 0.5378755 56 70.05501 0 0.1895731 0 0 4095 1 
i 3.091321 246.3987 0.5378755 54 70.55816 0 0.2049685 0 0 4095 1 
i 3.336703 246.3987 0.5843945 63 70.96067 0 0.2172848 0 0 4095 1 
i 3.520739 246.3987 0.5378755 68 71.26256 0 0.226522 0 0 4095 1 
i 10.99373 246.3987 0.5378755 80 70.05501 0 0.6016095 0 0 4095 1 
i 11.30045 246.3987 0.5378755 78 70.55816 0 0.6170049 0 0 4095 1 
i 11.54583 246.3987 0.5843945 84 70.96067 0 0.6293212 0 0 4095 1 
i 11.72987 246.3987 0.5378755 92 71.26256 0 0.6385584 0 0 4095 1 
i 2.784594 246.4452 0.5378755 64 74.29954 0 0.1895731 0 0 4095 1 
i 3.888811 246.4452 0.5378755 76 76.11086 0 0.2449965 0 0 4095 1 
i 4.011502 246.4452 0.5378755 77 76.31212 0 0.2511547 0 0 4095 1 
i 10.99373 246.4452 0.5378755 88 74.29954 0 0.6016095 0 0 4095 1 
i 12.09794 246.4452 0.5378755 100 76.11086 0 0.6570329 0 0 4095 1 
i 12.22063 246.4452 0.5492756 98 76.31212 0 0.663191 0 0 4095 1 
i 1 246.9945 0.5378755 55 70.04562 0 0.1 0 0 4095 1 
i 1.184036 246.9945 0.5378755 55 70.34751 0 0.1092372 0 0 4095 1 
i 1.552109 246.9945 0.5378755 48 70.95128 0 0.1277117 0 0 4095 1 
i 1.613454 246.9945 0.5378755 49 71.05191 0 0.1307908 0 0 4095 1 
i 2.042872 246.9945 0.5378755 58 71.75631 0 0.1523443 0 0 4095 1 
i 2.104217 246.9945 0.5378755 55 71.85694 0 0.1554234 0 0 4095 1 
i 2.47229 246.9945 0.5378755 64 72.46071 0 0.1738978 0 0 4095 1 
i 2.656326 246.9945 0.5378755 64 72.7626 0 0.1831351 0 0 4095 1 
i 9.209132 246.9945 0.5378755 75 70.04562 0 0.5120364 0 0 4095 1 
i 9.393168 246.9945 0.5378755 79 70.34751 0 0.5212736 0 0 4095 1 
i 9.761241 246.9945 0.5378755 72 70.95128 0 0.5397481 0 0 4095 1 
i 9.822586 246.9945 0.5378755 69 71.05191 0 0.5428272 0 0 4095 1 
i 10.252 246.9945 0.5378755 82 71.75631 0 0.5643807 0 0 4095 1 
i 10.31335 246.9945 0.5378755 79 71.85694 0 0.5674598 0 0 4095 1 
i 10.68142 246.9945 0.5378755 88 72.46071 0 0.5859342 0 0 4095 1 
i 10.86546 246.9945 0.5378755 88 72.7626 0 0.5951714 0 0 4095 1 
i 4.569188 247.3169 0.5378755 56 74.30826 0 0.2791463 0 0 4095 1 
i 5.121297 247.3169 0.5378755 44 75.21392 0 0.3068579 0 0 4095 1 
i 12.77832 247.3169 0.5378755 80 74.30826 0 0.6911826 0 0 4095 1 
i 13.33043 247.3169 0.5378755 68 75.21392 0 0.7188943 0 0 4095 1 
i 2.784594 247.7808 0.5378755 66 74.29887 0 0.1895731 0 0 4095 1 
i 2.96863 247.7808 0.5378755 66 74.60075 0 0.1988104 0 0 4095 1 
i 3.091321 247.7808 0.5378755 63 74.80201 0 0.2049685 0 0 4095 1 
i 3.152666 247.7808 0.5378755 61 74.90264 0 0.2080476 0 0 4095 1 
i 3.827466 247.7808 0.5378755 76 76.00956 0 0.2419174 0 0 4095 1 
i 3.888811 247.7808 0.5378755 73 76.11019 0 0.2449965 0 0 4095 1 
i 4.011502 247.7808 0.5378755 76 76.31145 0 0.2511547 0 0 4095 1 
i 4.195539 247.7808 0.5378755 79 76.61333 0 0.2603919 0 0 4095 1 
i 10.99373 247.7808 0.5378755 85 74.29887 0 0.6016095 0 0 4095 1 
i 11.17776 247.7808 0.5378755 90 74.60075 0 0.6108467 0 0 4095 1 
i 11.30045 247.7808 0.5378755 87 74.80201 0 0.6170049 0 0 4095 1 
i 11.3618 247.7808 0.5378755 85 74.90264 0 0.620084 0 0 4095 1 
i 12.0366 247.7808 0.5378755 100 76.00956 0 0.6539538 0 0 4095 1 
i 12.09794 247.7808 0.5378755 97 76.11019 0 0.6570329 0 0 4095 1 
i 12.22063 247.7808 0.5378755 100 76.31145 0 0.663191 0 0 4095 1 
i 12.40467 247.7808 0.5378755 100 76.61333 0 0.6724283 0 0 4095 1 
i 2.784594 247.9006 0.5378755 42 70.05434 0 0.1895731 0 0 4095 1 
i 3.152666 247.9006 0.5378755 45 70.65811 0 0.2080476 0 0 4095 1 
i 3.398048 247.9006 0.5378755 39 71.06063 0 0.2203639 0 0 4095 1 
i 3.520739 247.9006 0.5378755 38 71.26189 0 0.226522 0 0 4095 1 
i 10.99373 247.9006 0.5378755 66 70.05434 0 0.6016095 0 0 4095 1 
i 11.3618 247.9006 0.5378755 66 70.65811 0 0.620084 0 0 4095 1 
i 11.60718 247.9006 0.5378755 60 71.06063 0 0.6324003 0 0 4095 1 
i 11.72987 247.9006 0.7013673 57 71.26189 0 0.6385584 0 0 4095 1 
i 1 248.6019 0.5378755 52 70.04495 0 0.1 0 0 4095 1 
i 1.736145 248.6019 0.5378755 48 71.25249 0 0.1369489 0 0 4095 1 
i 2.226908 248.6019 0.5378755 58 72.05753 0 0.1615815 0 0 4095 1 
i 2.47229 248.6019 0.5378755 64 72.46004 0 0.1738978 0 0 4095 1 
i 9.209132 248.6019 0.5378755 76 70.04495 0 0.5120364 0 0 4095 1 
i 9.945277 248.6019 0.5378755 67 71.25249 0 0.5489853 0 0 4095 1 
i 10.43604 248.6019 0.5378755 77 72.05753 0 0.5736179 0 0 4095 1 
i 10.68142 248.6019 0.5378755 83 72.46004 0 0.5859342 0 0 4095 1 
i 4.569188 248.8253 0.5378755 65 74.30759 0 0.2791463 0 0 4095 1 
i 5.182642 248.8253 0.5378755 75 75.31388 0 0.309937 0 0 4095 1 
i 12.77832 248.8253 0.5378755 89 74.30759 0 0.6911826 0 0 4095 1 
i 13.39177 248.8253 0.5378755 99 75.31388 0 0.7219734 0 0 4095 1 
i 2.784594 249.2968 0.5378755 44 70.05367 0 0.1895731 0 0 4095 1 
i 2.96863 249.2968 0.5378755 39 70.35556 0 0.1988104 0 0 4095 1 
i 3.091321 249.2968 0.5378755 41 70.55681 0 0.2049685 0 0 4095 1 
i 3.152666 249.2968 0.5378755 44 70.65744 0 0.2080476 0 0 4095 1 
i 3.336703 249.2968 0.5378755 39 70.95933 0 0.2172848 0 0 4095 1 
i 3.398048 249.2968 0.5378755 41 71.05996 0 0.2203639 0 0 4095 1 
i 3.520739 249.2968 0.5378755 39 71.26122 0 0.226522 0 0 4095 1 
i 3.704775 249.2968 0.5378755 39 71.5631 0 0.2357593 0 0 4095 1 
i 10.99373 249.2968 0.5378755 63 70.05367 0 0.6016095 0 0 4095 1 
i 11.17776 249.2968 0.5378755 63 70.35556 0 0.6108467 0 0 4095 1 
i 11.30045 249.2968 0.5378755 65 70.55681 0 0.6170049 0 0 4095 1 
i 11.3618 249.2968 0.5378755 68 70.65744 0 0.620084 0 0 4095 1 
i 11.54583 249.2968 0.5378755 63 70.95933 0 0.6293212 0 0 4095 1 
i 11.60718 249.2968 0.5378755 62 71.05996 0 0.6324003 0 0 4095 1 
i 11.72987 249.2968 0.5378755 63 71.26122 0 0.6385584 0 0 4095 1 
i 11.91391 249.2968 0.5378755 59 71.5631 0 0.6477957 0 0 4095 1 
i 2.784594 249.6399 0.5378755 67 74.2982 0 0.1895731 0 0 4095 1 
i 4.256884 249.6399 0.5378755 76 76.71329 0 0.263471 0 0 4095 1 
i 10.99373 249.6399 0.5378755 91 74.2982 0 0.6016095 0 0 4095 1 
i 12.46602 249.6399 0.5378755 100 76.71329 0 0.6755073 0 0 4095 1 
i 1 249.9982 0.5378755 54 70.04428 0 0.1 0 0 4095 1 
i 1.306727 249.9982 0.5378755 55 70.54742 0 0.1153954 0 0 4095 1 
i 1.552109 249.9982 0.5378755 49 70.94994 0 0.1277117 0 0 4095 1 
i 1.736145 249.9982 0.5378755 49 71.25182 0 0.1369489 0 0 4095 1 
i 2.042872 249.9982 0.5378755 59 71.75497 0 0.1523443 0 0 4095 1 
i 2.226908 249.9982 0.5378755 55 72.05686 0 0.1615815 0 0 4095 1 
i 2.47229 249.9982 0.5378755 61 72.45937 0 0.1738978 0 0 4095 1 
i 2.779017 249.9982 0.5378755 64 72.96252 0 0.1892932 0 0 4095 1 
i 9.209132 249.9982 0.5378755 73 70.04428 0 0.5120364 0 0 4095 1 
i 9.515859 249.9982 0.5378755 79 70.54742 0 0.5274318 0 0 4095 1 
i 9.761241 249.9982 0.5378755 73 70.94994 0 0.5397481 0 0 4095 1 
i 9.945277 249.9982 0.5378755 69 71.25182 0 0.5489853 0 0 4095 1 
i 10.252 249.9982 0.5378755 83 71.75497 0 0.5643807 0 0 4095 1 
i 10.43604 249.9982 0.5378755 79 72.05686 0 0.5736179 0 0 4095 1 
i 10.68142 249.9982 0.5378755 82 72.45937 0 0.5859342 0 0 4095 1 
i 10.98815 249.9982 0.5378755 88 72.96252 0 0.6013296 0 0 4095 1 
i 4.569188 250.2277 0.5378755 62 74.30692 0 0.2791463 0 0 4095 1 
i 5.121297 250.2277 0.5378755 66 75.21258 0 0.3068579 0 0 4095 1 
i 5.182642 250.2277 0.5378755 63 75.31321 0 0.309937 0 0 4095 1 
i 12.77832 250.2277 0.5378755 86 74.30692 0 0.6911826 0 0 4095 1 
i 13.33043 250.2277 0.5378755 86 75.21258 0 0.7188943 0 0 4095 1 
i 13.39177 250.2277 0.814529 87 75.31321 0 0.7219734 0 0 4095 1 
i 2.784594 251.0422 0.5378755 67 74.29753 0 0.1895731 0 0 4095 1 
i 3.336703 251.0422 0.5378755 64 75.20319 0 0.2172848 0 0 4095 1 
i 3.827466 251.0422 0.5378755 70 76.00822 0 0.2419174 0 0 4095 1 
i 4.256884 251.0422 0.5378755 76 76.71262 0 0.263471 0 0 4095 1 
i 10.99373 251.0422 0.5378755 91 74.29753 0 0.6016095 0 0 4095 1 
i 11.54583 251.0422 0.5378755 84 75.20319 0 0.6293212 0 0 4095 1 
i 12.0366 251.0422 0.5378755 94 76.00822 0 0.6539538 0 0 4095 1 
i 12.46602 251.0422 0.5378755 100 76.71262 0 0.6755073 0 0 4095 1 
i 1 251.4286 0.5378755 51 70.04361 0 0.1 0 0 4095 1 
i 1.368072 251.4286 0.5378755 55 70.64738 0 0.1184745 0 0 4095 1 
i 1.613454 251.4286 0.5378755 49 71.0499 0 0.1307908 0 0 4095 1 
i 1.736145 251.4286 0.5378755 48 71.25115 0 0.1369489 0 0 4095 1 
i 2.104217 251.4286 0.5378755 59 71.85493 0 0.1554234 0 0 4095 1 
i 2.226908 251.4286 0.5378755 58 72.05618 0 0.1615815 0 0 4095 1 
i 2.47229 251.4286 0.5378755 64 72.4587 0 0.1738978 0 0 4095 1 
i 2.840362 251.4286 0.5378755 64 73.06247 0 0.1923723 0 0 4095 1 
i 9.209132 251.4286 0.5378755 75 70.04361 0 0.5120364 0 0 4095 1 
i 9.577205 251.4286 0.5378755 79 70.64738 0 0.5305108 0 0 4095 1 
i 9.822586 251.4286 0.5378755 73 71.0499 0 0.5428272 0 0 4095 1 
i 9.945277 251.4286 0.5378755 67 71.25115 0 0.5489853 0 0 4095 1 
i 10.31335 251.4286 0.5378755 83 71.85493 0 0.5674598 0 0 4095 1 
i 10.43604 251.4286 0.5378755 82 72.05618 0 0.5736179 0 0 4095 1 
i 10.68142 251.4286 0.5378755 88 72.4587 0 0.5859342 0 0 4095 1 
i 11.04949 251.4286 0.5378755 88 73.06247 0 0.6044087 0 0 4095 1 
i 4.569188 251.8421 0.5378755 56 74.30625 0 0.2791463 0 0 4095 1 
i 5.305333 251.8421 0.5378755 47 75.51379 0 0.3160952 0 0 4095 1 
i 12.77832 251.8421 0.5378755 75 74.30625 0 0.6911826 0 0 4095 1 
i 13.51446 251.8421 0.5378755 71 75.51379 0 0.7281316 0 0 4095 1 
i 2.784594 251.9087 0.5378755 48 70.053 0 0.1895731 0 0 4095 1 
i 10.99373 251.9087 0.5700391 67 70.053 0 0.6016095 0 0 4095 1 
i 2.784594 252.4788 0.5378755 66 74.29686 0 0.1895731 0 0 4095 1 
i 3.398048 252.4788 0.5378755 64 75.30314 0 0.2203639 0 0 4095 1 
i 3.888811 252.4788 0.5378755 70 76.10818 0 0.2449965 0 0 4095 1 
i 4.256884 252.4788 0.5378755 77 76.71195 0 0.263471 0 0 4095 1 
i 10.99373 252.4788 0.5378755 90 74.29686 0 0.6016095 0 0 4095 1 
i 11.60718 252.4788 0.5378755 84 75.30314 0 0.6324003 0 0 4095 1 
i 12.09794 252.4788 0.5378755 94 76.10818 0 0.6570329 0 0 4095 1 
i 12.46602 252.4788 0.5378755 98 76.71195 0 0.6755073 0 0 4095 1 
i 1 252.7583 0.5378755 52 70.04294 0 0.1 0 0 4095 1 
i 1.184036 252.7583 0.5378755 52 70.34482 0 0.1092372 0 0 4095 1 
i 1.306727 252.7583 0.5378755 54 70.54608 0 0.1153954 0 0 4095 1 
i 1.368072 252.7583 0.5378755 55 70.64671 0 0.1184745 0 0 4095 1 
i 1.552109 252.7583 0.5378755 48 70.9486 0 0.1277117 0 0 4095 1 
i 1.613454 252.7583 0.5378755 49 71.04922 0 0.1307908 0 0 4095 1 
i 1.736145 252.7583 0.5378755 48 71.25048 0 0.1369489 0 0 4095 1 
i 1.920181 252.7583 0.5378755 43 71.55237 0 0.1461861 0 0 4095 1 
i 2.042872 252.7583 0.5378755 58 71.75363 0 0.1523443 0 0 4095 1 
i 2.104217 252.7583 0.5378755 59 71.85426 0 0.1554234 0 0 4095 1 
i 2.226908 252.7583 0.5378755 58 72.05551 0 0.1615815 0 0 4095 1 
i 2.410945 252.7583 0.5378755 58 72.3574 0 0.1708188 0 0 4095 1 
i 2.47229 252.7583 0.5378755 64 72.45803 0 0.1738978 0 0 4095 1 
i 2.656326 252.7583 0.5378755 64 72.75992 0 0.1831351 0 0 4095 1 
i 2.779017 252.7583 0.5378755 62 72.96117 0 0.1892932 0 0 4095 1 
i 2.840362 252.7583 0.5378755 64 73.0618 0 0.1923723 0 0 4095 1 
i 9.209132 252.7583 0.5378755 76 70.04294 0 0.5120364 0 0 4095 1 
i 9.393168 252.7583 0.5378755 76 70.34482 0 0.5212736 0 0 4095 1 
i 9.515859 252.7583 0.5378755 78 70.54608 0 0.5274318 0 0 4095 1 
i 9.577205 252.7583 0.5378755 76 70.64671 0 0.5305108 0 0 4095 1 
i 9.761241 252.7583 0.5378755 72 70.9486 0 0.5397481 0 0 4095 1 
i 9.822586 252.7583 0.5378755 73 71.04922 0 0.5428272 0 0 4095 1 
i 9.945277 252.7583 0.5378755 67 71.25048 0 0.5489853 0 0 4095 1 
i 10.12931 252.7583 0.5378755 67 71.55237 0 0.5582225 0 0 4095 1 
i 10.252 252.7583 0.5378755 82 71.75363 0 0.5643807 0 0 4095 1 
i 10.31335 252.7583 0.5378755 83 71.85426 0 0.5674598 0 0 4095 1 
i 10.43604 252.7583 0.5378755 82 72.05551 0 0.5736179 0 0 4095 1 
i 10.62008 252.7583 0.5378755 77 72.3574 0 0.5828551 0 0 4095 1 
i 10.68142 252.7583 0.5378755 88 72.45803 0 0.5859342 0 0 4095 1 
i 10.86546 252.7583 0.5378755 83 72.75992 0 0.5951714 0 0 4095 1 
i 10.98815 252.7583 0.5378755 86 72.96117 0 0.6013296 0 0 4095 1 
i 11.04949 252.7583 0.5378755 88 73.0618 0 0.6044087 0 0 4095 1 
i 4.569188 253.2445 0.5378755 72 74.30558 0 0.2791463 0 0 4095 1 
i 4.875915 253.2445 0.5378755 66 74.80872 0 0.2945416 0 0 4095 1 
i 5.121297 253.2445 0.5378755 75 75.21124 0 0.3068579 0 0 4095 1 
i 5.305333 253.2445 0.5378755 80 75.51312 0 0.3160952 0 0 4095 1 
i 12.77832 253.2445 0.5378755 96 74.30558 0 0.6911826 0 0 4095 1 
i 13.08505 253.2445 0.5378755 90 74.80872 0 0.706578 0 0 4095 1 
i 13.33043 253.2445 0.5378755 99 75.21124 0 0.7188943 0 0 4095 1 
i 13.51446 253.2445 0.5378755 104 75.51312 0 0.7281316 0 0 4095 1 
i 2.784594 253.4481 0.5378755 49 70.05233 0 0.1895731 0 0 4095 1 
i 3.827466 253.4481 0.5378755 40 71.76302 0 0.2419174 0 0 4095 1 
i 10.99373 253.4481 0.5378755 73 70.05233 0 0.6016095 0 0 4095 1 
i 12.0366 253.4481 0.5378755 64 71.76302 0 0.6539538 0 0 4095 1 
i 2.784594 253.8143 0.5378755 67 74.29618 0 0.1895731 0 0 4095 1 
i 2.96863 253.8143 0.5378755 67 74.59807 0 0.1988104 0 0 4095 1 
i 3.336703 253.8143 0.5378755 63 75.20184 0 0.2172848 0 0 4095 1 
i 3.398048 253.8143 0.5378755 61 75.30247 0 0.2203639 0 0 4095 1 
i 3.827466 253.8143 0.5378755 73 76.00688 0 0.2419174 0 0 4095 1 
i 3.888811 253.8143 0.5378755 71 76.10751 0 0.2449965 0 0 4095 1 
i 4.256884 253.8143 0.5378755 76 76.71128 0 0.263471 0 0 4095 1 
i 4.44092 253.8143 0.5378755 79 77.01317 0 0.2727082 0 0 4095 1 
i 10.99373 253.8143 0.5378755 91 74.29618 0 0.6016095 0 0 4095 1 
i 11.17776 253.8143 0.5378755 91 74.59807 0 0.6108467 0 0 4095 1 
i 11.54583 253.8143 0.5378755 87 75.20184 0 0.6293212 0 0 4095 1 
i 11.60718 253.8143 0.5378755 85 75.30247 0 0.6324003 0 0 4095 1 
i 12.0366 253.8143 0.5378755 94 76.00688 0 0.6539538 0 0 4095 1 
i 12.09794 253.8143 0.5378755 91 76.10751 0 0.6570329 0 0 4095 1 
i 12.46602 253.8143 0.5378755 100 76.71128 0 0.6755073 0 0 4095 1 
i 12.65005 253.8143 0.8666686 100 77.01317 0 0.6847446 0 0 4095 1 
i 4.569188 254.681 0.5378755 54 74.30491 0 0.2791463 0 0 4095 1 
i 4.93726 254.681 0.5378755 57 74.90868 0 0.2976207 0 0 4095 1 
i 5.182642 254.681 0.5378755 51 75.31119 0 0.309937 0 0 4095 1 
i 5.305333 254.681 0.5378755 50 75.51245 0 0.3160952 0 0 4095 1 
i 12.77832 254.681 0.5378755 78 74.30491 0 0.6911826 0 0 4095 1 
i 13.14639 254.681 0.5378755 81 74.90868 0 0.7096571 0 0 4095 1 
i 13.39177 254.681 0.5378755 75 75.31119 0 0.7219734 0 0 4095 1 
i 13.51446 254.681 0.5378755 74 75.51245 0 0.7281316 0 0 4095 1 
i 2.784594 255.0251 0.5378755 43 70.05166 0 0.1895731 0 0 4095 1 
i 3.888811 255.0251 0.5378755 64 71.86298 0 0.2449965 0 0 4095 1 
i 10.99373 255.0251 0.5378755 67 70.05166 0 0.6016095 0 0 4095 1 
i 12.09794 255.0251 0.5378755 88 71.86298 0 0.6570329 0 0 4095 1 
i 2.784594 255.3519 0.5378755 67 74.29551 0 0.1895731 0 0 4095 1 
i 3.520739 255.3519 0.5378755 64 75.50306 0 0.226522 0 0 4095 1 
i 4.011502 255.3519 0.5378755 70 76.30809 0 0.2511547 0 0 4095 1 
i 4.256884 255.3519 0.5378755 76 76.71061 0 0.263471 0 0 4095 1 
i 10.99373 255.3519 0.5378755 88 74.29551 0 0.6016095 0 0 4095 1 
i 11.72987 255.3519 0.5378755 84 75.50306 0 0.6385584 0 0 4095 1 
i 12.22063 255.3519 0.5378755 94 76.30809 0 0.663191 0 0 4095 1 
i 12.46602 255.3519 0.6647034 100 76.71061 0 0.6755073 0 0 4095 1 
i 4.569188 256.0166 0.5378755 56 74.30423 0 0.2791463 0 0 4095 1 
i 4.753224 256.0166 0.5378755 56 74.60612 0 0.2883835 0 0 4095 1 
i 4.875915 256.0166 0.5378755 57 74.80738 0 0.2945416 0 0 4095 1 
i 4.93726 256.0166 0.5378755 59 74.90801 0 0.2976207 0 0 4095 1 
i 5.121297 256.0166 0.5378755 51 75.2099 0 0.3068579 0 0 4095 1 
i 5.182642 256.0166 0.5378755 53 75.31052 0 0.309937 0 0 4095 1 
i 5.305333 256.0166 0.5378755 51 75.51178 0 0.3160952 0 0 4095 1 
i 5.489369 256.0166 0.5378755 51 75.81367 0 0.3253324 0 0 4095 1 
i 12.77832 256.0166 0.5378755 80 74.30423 0 0.6911826 0 0 4095 1 
i 12.96236 256.0166 0.5378755 80 74.60612 0 0.7004199 0 0 4095 1 
i 13.08505 256.0166 0.5378755 81 74.80738 0 0.706578 0 0 4095 1 
i 13.14639 256.0166 0.5378755 80 74.90801 0 0.7096571 0 0 4095 1 
i 13.33043 256.0166 0.5378755 75 75.2099 0 0.7188943 0 0 4095 1 
i 13.39177 256.0166 0.5378755 77 75.31052 0 0.7219734 0 0 4095 1 
i 13.51446 256.0166 0.5378755 75 75.51178 0 0.7281316 0 0 4095 1 
i 13.6985 256.0166 0.5378755 75 75.81367 0 0.7373688 0 0 4095 1 
i 2.784594 256.4912 0.5378755 52 70.05099 0 0.1895731 0 0 4095 1 
i 2.96863 256.4912 0.5378755 55 70.35287 0 0.1988104 0 0 4095 1 
i 3.827466 256.4912 0.5378755 34 71.76168 0 0.2419174 0 0 4095 1 
i 3.888811 256.4912 0.5378755 32 71.86231 0 0.2449965 0 0 4095 1 
i 10.99373 256.4912 0.5378755 76 70.05099 0 0.6016095 0 0 4095 1 
i 11.17776 256.4912 0.5378755 76 70.35287 0 0.6108467 0 0 4095 1 
i 12.0366 256.4912 0.5378755 58 71.76168 0 0.6539538 0 0 4095 1 
i 12.09794 256.4912 0.5378755 56 71.86231 0 0.6570329 0 0 4095 1 
i 2.784594 256.6875 0.5378755 66 74.29484 0 0.1895731 0 0 4095 1 
i 3.091321 256.6875 0.5378755 67 74.79799 0 0.2049685 0 0 4095 1 
i 3.336703 256.6875 0.5378755 66 75.2005 0 0.2172848 0 0 4095 1 
i 3.520739 256.6875 0.5378755 61 75.50239 0 0.226522 0 0 4095 1 
i 3.827466 256.6875 0.5378755 76 76.00553 0 0.2419174 0 0 4095 1 
i 4.011502 256.6875 0.5378755 71 76.30742 0 0.2511547 0 0 4095 1 
i 4.256884 256.6875 0.5378755 73 76.70994 0 0.263471 0 0 4095 1 
i 4.563611 256.6875 0.5378755 79 77.21308 0 0.2788663 0 0 4095 1 
i 10.99373 256.6875 0.5378755 90 74.29484 0 0.6016095 0 0 4095 1 
i 11.30045 256.6875 0.5378755 91 74.79799 0 0.6170049 0 0 4095 1 
i 11.54583 256.6875 0.5378755 90 75.2005 0 0.6293212 0 0 4095 1 
i 11.72987 256.6875 0.5378755 85 75.50239 0 0.6385584 0 0 4095 1 
i 12.0366 256.6875 0.5378755 100 76.00553 0 0.6539538 0 0 4095 1 
i 12.22063 256.6875 0.5378755 91 76.30742 0 0.663191 0 0 4095 1 
i 12.46602 256.6875 0.5378755 97 76.70994 0 0.6755073 0 0 4095 1 
i 12.77274 256.6875 1.368151 100 77.21308 0 0.6909027 0 0 4095 1 
i 2.784594 258.0556 0.5378755 67 74.29417 0 0.1895731 0 0 4095 1 
i 3.152666 258.0556 0.5378755 67 74.89795 0 0.2080476 0 0 4095 1 
i 3.398048 258.0556 0.5378755 66 75.30046 0 0.2203639 0 0 4095 1 
i 3.520739 258.0556 0.5378755 63 75.50172 0 0.226522 0 0 4095 1 
i 3.888811 258.0556 0.5378755 76 76.10549 0 0.2449965 0 0 4095 1 
i 4.011502 258.0556 0.5378755 70 76.30675 0 0.2511547 0 0 4095 1 
i 4.256884 258.0556 0.5378755 76 76.70927 0 0.263471 0 0 4095 1 
i 4.624956 258.0556 0.5378755 79 77.31304 0 0.2819454 0 0 4095 1 
i 10.99373 258.0556 0.5378755 91 74.29417 0 0.6016095 0 0 4095 1 
i 11.3618 258.0556 0.5378755 91 74.89795 0 0.620084 0 0 4095 1 
i 11.60718 258.0556 0.5378755 90 75.30046 0 0.6324003 0 0 4095 1 
i 11.72987 258.0556 0.5378755 87 75.50172 0 0.6385584 0 0 4095 1 
i 12.09794 258.0556 0.5378755 100 76.10549 0 0.6570329 0 0 4095 1 
i 12.22063 258.0556 0.5378755 94 76.30675 0 0.663191 0 0 4095 1 
i 12.46602 258.0556 0.5378755 100 76.70927 0 0.6755073 0 0 4095 1 
i 12.83409 258.0556 0.5378755 100 77.31304 0 0.6939818 0 0 4095 1 
i 2.784594 258.179 0.5378755 45 70.05031 0 0.1895731 0 0 4095 1 
i 4.011502 258.179 0.5378755 55 72.06289 0 0.2511547 0 0 4095 1 
i 10.99373 258.179 0.5378755 69 70.05031 0 0.6016095 0 0 4095 1 
i 12.22063 258.179 0.5378755 79 72.06289 0 0.663191 0 0 4095 1 
i 4.569188 258.5149 0.5378755 64 74.30356 0 0.2791463 0 0 4095 1 
i 12.77832 258.5149 0.8126761 84 74.30356 0 0.6911826 0 0 4095 1 
i 2.784594 259.3276 0.5378755 67 74.2935 0 0.1895731 0 0 4095 1 
i 2.96863 259.3276 0.5378755 64 74.59539 0 0.1988104 0 0 4095 1 
i 3.091321 259.3276 0.5378755 70 74.79665 0 0.2049685 0 0 4095 1 
i 3.152666 259.3276 0.5378755 67 74.89727 0 0.2080476 0 0 4095 1 
i 3.336703 259.3276 0.5378755 64 75.19916 0 0.2172848 0 0 4095 1 
i 3.398048 259.3276 0.5378755 66 75.29979 0 0.2203639 0 0 4095 1 
i 3.520739 259.3276 0.5378755 64 75.50105 0 0.226522 0 0 4095 1 
i 3.704775 259.3276 0.5378755 60 75.80294 0 0.2357593 0 0 4095 1 
i 3.827466 259.3276 0.5378755 74 76.00419 0 0.2419174 0 0 4095 1 
i 3.888811 259.3276 0.5378755 76 76.10482 0 0.2449965 0 0 4095 1 
i 4.011502 259.3276 0.5378755 70 76.30608 0 0.2511547 0 0 4095 1 
i 4.195539 259.3276 0.5378755 70 76.60797 0 0.2603919 0 0 4095 1 
i 4.256884 259.3276 0.5378755 76 76.7086 0 0.263471 0 0 4095 1 
i 4.44092 259.3276 0.5378755 76 77.01048 0 0.2727082 0 0 4095 1 
i 4.563611 259.3276 0.5378755 77 77.21174 0 0.2788663 0 0 4095 1 
i 4.624956 259.3276 0.5378755 76 77.31237 0 0.2819454 0 0 4095 1 
i 10.99373 259.3276 0.5378755 91 74.2935 0 0.6016095 0 0 4095 1 
i 11.17776 259.3276 0.5378755 88 74.59539 0 0.6108467 0 0 4095 1 
i 11.30045 259.3276 0.5378755 90 74.79665 0 0.6170049 0 0 4095 1 
i 11.3618 259.3276 0.5378755 91 74.89727 0 0.620084 0 0 4095 1 
i 11.54583 259.3276 0.5378755 88 75.19916 0 0.6293212 0 0 4095 1 
i 11.60718 259.3276 0.5378755 85 75.29979 0 0.6324003 0 0 4095 1 
i 11.72987 259.3276 0.5378755 84 75.50105 0 0.6385584 0 0 4095 1 
i 11.91391 259.3276 0.5378755 84 75.80294 0 0.6477957 0 0 4095 1 
i 12.0366 259.3276 0.5378755 94 76.00419 0 0.6539538 0 0 4095 1 
i 12.09794 259.3276 0.5378755 100 76.10482 0 0.6570329 0 0 4095 1 
i 12.22063 259.3276 0.5378755 94 76.30608 0 0.663191 0 0 4095 1 
i 12.40467 259.3276 0.5378755 94 76.60797 0 0.6724283 0 0 4095 1 
i 12.46602 259.3276 0.5378755 100 76.7086 0 0.6755073 0 0 4095 1 
i 12.65005 259.3276 0.5378755 100 77.01048 0 0.6847446 0 0 4095 1 
i 12.77274 259.3276 0.5378755 98 77.21174 0 0.6909027 0 0 4095 1 
i 12.83409 259.3276 0.5378755 100 77.31237 0 0.6939818 0 0 4095 1 
i 2.784594 259.6451 0.5378755 46 70.04964 0 0.1895731 0 0 4095 1 
i 3.091321 259.6451 0.5378755 43 70.55279 0 0.2049685 0 0 4095 1 
i 3.827466 259.6451 0.5378755 56 71.76034 0 0.2419174 0 0 4095 1 
i 4.011502 259.6451 0.5378755 59 72.06222 0 0.2511547 0 0 4095 1 
i 10.99373 259.6451 0.5378755 70 70.04964 0 0.6016095 0 0 4095 1 
i 11.30045 259.6451 0.5378755 64 70.55279 0 0.6170049 0 0 4095 1 
i 12.0366 259.6451 0.5378755 80 71.76034 0 0.6539538 0 0 4095 1 
i 12.22063 259.6451 0.5378755 80 72.06222 0 0.663191 0 0 4095 1 
i 4.569188 259.9874 0.5378755 61 74.30289 0 0.2791463 0 0 4095 1 
i 5.61206 259.9874 0.5378755 55 76.01358 0 0.3314906 0 0 4095 1 
i 12.77832 259.9874 0.5378755 85 74.30289 0 0.6911826 0 0 4095 1 
i 13.82119 259.9874 1.15955 76 76.01358 0 0.7435269 0 0 4095 1 
i 2.784594 261.1469 0.5378755 52 70.04897 0 0.1895731 0 0 4095 1 
i 3.152666 261.1469 0.5378755 55 70.65275 0 0.2080476 0 0 4095 1 
i 3.888811 261.1469 0.5378755 32 71.86029 0 0.2449965 0 0 4095 1 
i 4.011502 261.1469 0.5378755 26 72.06155 0 0.2511547 0 0 4095 1 
i 10.99373 261.1469 0.5378755 76 70.04897 0 0.6016095 0 0 4095 1 
i 11.3618 261.1469 0.5378755 79 70.65275 0 0.620084 0 0 4095 1 
i 12.09794 261.1469 0.5378755 56 71.86029 0 0.6570329 0 0 4095 1 
i 12.22063 261.1469 0.5378755 50 72.06155 0 0.663191 0 0 4095 1 
i 4.569188 261.4958 0.5378755 55 74.30222 0 0.2791463 0 0 4095 1 
i 5.673405 261.4958 0.5378755 79 76.11354 0 0.3345696 0 0 4095 1 
i 12.77832 261.4958 0.5378755 79 74.30222 0 0.6911826 0 0 4095 1 
i 13.88254 261.4958 1.047447 103 76.11354 0 0.746606 0 0 4095 1 
i 2.784594 262.5432 0.5378755 42 70.0483 0 0.1895731 0 0 4095 1 
i 2.96863 262.5432 0.5378755 45 70.35019 0 0.1988104 0 0 4095 1 
i 3.091321 262.5432 0.5378755 43 70.55145 0 0.2049685 0 0 4095 1 
i 3.152666 262.5432 0.5378755 42 70.65208 0 0.2080476 0 0 4095 1 
i 3.827466 262.5432 0.5378755 64 71.75899 0 0.2419174 0 0 4095 1 
i 3.888811 262.5432 0.5378755 58 71.85962 0 0.2449965 0 0 4095 1 
i 4.011502 262.5432 0.5378755 64 72.06088 0 0.2511547 0 0 4095 1 
i 4.195539 262.5432 0.5378755 64 72.36277 0 0.2603919 0 0 4095 1 
i 10.99373 262.5432 0.5378755 66 70.0483 0 0.6016095 0 0 4095 1 
i 11.17776 262.5432 0.5378755 69 70.35019 0 0.6108467 0 0 4095 1 
i 11.30045 262.5432 0.5378755 63 70.55145 0 0.6170049 0 0 4095 1 
i 11.3618 262.5432 0.5378755 61 70.65208 0 0.620084 0 0 4095 1 
i 12.0366 262.5432 0.5378755 83 71.75899 0 0.6539538 0 0 4095 1 
i 12.09794 262.5432 0.5378755 82 71.85962 0 0.6570329 0 0 4095 1 
i 12.22063 262.5432 0.5378755 88 72.06088 0 0.663191 0 0 4095 1 
i 12.40467 262.5432 0.5378755 88 72.36277 0 0.6724283 0 0 4095 1 
i 4.569188 262.8981 0.5378755 67 74.30155 0 0.2791463 0 0 4095 1 
i 4.753224 262.8981 0.5378755 67 74.60344 0 0.2883835 0 0 4095 1 
i 5.61206 262.8981 0.5378755 46 76.01224 0 0.3314906 0 0 4095 1 
i 5.673405 262.8981 0.5378755 44 76.11287 0 0.3345696 0 0 4095 1 
i 12.77832 262.8981 0.5378755 88 74.30155 0 0.6911826 0 0 4095 1 
i 12.96236 262.8981 0.5378755 91 74.60344 0 0.7004199 0 0 4095 1 
i 13.82119 262.8981 0.5378755 70 76.01224 0 0.7435269 0 0 4095 1 
i 13.88254 262.8981 1.588652 68 76.11287 0 0.746606 0 0 4095 1 
i 2.784594 264.4868 0.5378755 43 70.04763 0 0.1895731 0 0 4095 1 
i 4.256884 264.4868 0.5378755 40 72.46273 0 0.263471 0 0 4095 1 
i 10.99373 264.4868 0.5378755 67 70.04763 0 0.6016095 0 0 4095 1 
i 12.46602 264.4868 0.5378755 64 72.46273 0 0.6755073 0 0 4095 1 
i 4.569188 264.5126 0.5378755 61 74.30088 0 0.2791463 0 0 4095 1 
i 5.796096 264.5126 0.5378755 67 76.31346 0 0.3407278 0 0 4095 1 
i 12.77832 264.5126 0.5378755 81 74.30088 0 0.6911826 0 0 4095 1 
i 14.00523 264.5126 1.402355 91 76.31346 0 0.7527642 0 0 4095 1 
i 4.569188 265.9149 0.5378755 61 74.30021 0 0.2791463 0 0 4095 1 
i 4.875915 265.9149 0.5378755 55 74.80335 0 0.2945416 0 0 4095 1 
i 5.61206 265.9149 0.5378755 68 76.0109 0 0.3314906 0 0 4095 1 
i 5.796096 265.9149 0.5378755 76 76.31279 0 0.3407278 0 0 4095 1 
i 12.77832 265.9149 0.5378755 82 74.30021 0 0.6911826 0 0 4095 1 
i 13.08505 265.9149 0.5378755 79 74.80335 0 0.706578 0 0 4095 1 
i 13.82119 265.9149 0.5378755 92 76.0109 0 0.7435269 0 0 4095 1 
i 14.00523 265.9149 0.5378755 95 76.31279 0 0.7527642 0 0 4095 1 
i 2.784594 265.9529 0.5378755 43 70.04696 0 0.1895731 0 0 4095 1 
i 3.336703 265.9529 0.5378755 52 70.95262 0 0.2172848 0 0 4095 1 
i 3.827466 265.9529 0.5378755 41 71.75765 0 0.2419174 0 0 4095 1 
i 4.256884 265.9529 0.5378755 40 72.46205 0 0.263471 0 0 4095 1 
i 10.99373 265.9529 0.5378755 67 70.04696 0 0.6016095 0 0 4095 1 
i 11.54583 265.9529 0.5378755 76 70.95262 0 0.6293212 0 0 4095 1 
i 12.0366 265.9529 0.5378755 65 71.75765 0 0.6539538 0 0 4095 1 
i 12.46602 265.9529 1.398582 64 72.46205 0 0.6755073 0 0 4095 1 
i 4.569188 267.3515 0.6411504 67 74.29954 0 0.2791463 0 0 4095 1 
i 4.93726 267.3515 0.5378755 72 74.90331 0 0.2976207 0 0 4095 1 
i 5.673405 267.3515 0.5378755 47 76.11086 0 0.3345696 0 0 4095 1 
i 5.796096 267.3515 0.5378755 41 76.31212 0 0.3407278 0 0 4095 1 
i 12.77832 267.3515 0.6411504 91 74.29954 0 0.6911826 0 0 4095 1 
i 13.14639 267.3515 0.5378755 91 74.90331 0 0.7096571 0 0 4095 1 
i 13.88254 267.3515 0.5378755 68 76.11086 0 0.746606 0 0 4095 1 
i 14.00523 267.3515 0.5378755 65 76.31212 0 0.7527642 0 0 4095 1 
i 2.784594 267.4547 0.5378755 49 70.04629 0 0.1895731 0 0 4095 1 
i 3.398048 267.4547 0.5378755 36 71.05258 0 0.2203639 0 0 4095 1 
i 3.888811 267.4547 0.5378755 53 71.85761 0 0.2449965 0 0 4095 1 
i 10.99373 267.4547 0.5378755 70 70.04629 0 0.6016095 0 0 4095 1 
i 11.60718 267.4547 0.5378755 60 71.05258 0 0.6324003 0 0 4095 1 
i 12.09794 267.4547 1.232302 77 71.85761 0 0.6570329 0 0 4095 1 
i 4.569188 268.687 0.5378755 57 74.29887 0 0.2791463 0 0 4095 1 
i 4.753224 268.687 0.5378755 57 74.60075 0 0.2883835 0 0 4095 1 
i 4.875915 268.687 0.5378755 55 74.80201 0 0.2945416 0 0 4095 1 
i 4.93726 268.687 0.5378755 54 74.90264 0 0.2976207 0 0 4095 1 
i 5.61206 268.687 0.5378755 76 76.00956 0 0.3314906 0 0 4095 1 
i 5.673405 268.687 0.5378755 73 76.11019 0 0.3345696 0 0 4095 1 
i 5.796096 268.687 0.5378755 76 76.31145 0 0.3407278 0 0 4095 1 
i 5.980132 268.687 0.5378755 76 76.61333 0 0.349965 0 0 4095 1 
i 12.77832 268.687 0.5378755 81 74.29887 0 0.6911826 0 0 4095 1 
i 12.96236 268.687 0.5378755 81 74.60075 0 0.7004199 0 0 4095 1 
i 13.08505 268.687 0.5378755 79 74.80201 0 0.706578 0 0 4095 1 
i 13.14639 268.687 0.5378755 78 74.90264 0 0.7096571 0 0 4095 1 
i 13.82119 268.687 0.5378755 100 76.00956 0 0.7435269 0 0 4095 1 
i 13.88254 268.687 0.5378755 94 76.11019 0 0.746606 0 0 4095 1 
i 14.00523 268.687 0.5378755 100 76.31145 0 0.7527642 0 0 4095 1 
i 14.18926 268.687 0.5378755 100 76.61333 0 0.7620014 0 0 4095 1 
i 2.784594 268.851 0.5378755 43 70.04562 0 0.1895731 0 0 4095 1 
i 2.96863 268.851 0.5378755 43 70.34751 0 0.1988104 0 0 4095 1 
i 3.336703 268.851 0.5378755 51 70.95128 0 0.2172848 0 0 4095 1 
i 3.398048 268.851 0.5378755 54 71.05191 0 0.2203639 0 0 4095 1 
i 3.827466 268.851 0.5378755 37 71.75631 0 0.2419174 0 0 4095 1 
i 3.888811 268.851 0.5378755 40 71.85694 0 0.2449965 0 0 4095 1 
i 4.256884 268.851 0.5378755 31 72.46071 0 0.263471 0 0 4095 1 
i 4.44092 268.851 0.5378755 31 72.7626 0 0.2727082 0 0 4095 1 
i 10.99373 268.851 0.5378755 67 70.04562 0 0.6016095 0 0 4095 1 
i 11.17776 268.851 0.5378755 67 70.34751 0 0.6108467 0 0 4095 1 
i 11.54583 268.851 0.5378755 75 70.95128 0 0.6293212 0 0 4095 1 
i 11.60718 268.851 0.5378755 78 71.05191 0 0.6324003 0 0 4095 1 
i 12.0366 268.851 0.5378755 61 71.75631 0 0.6539538 0 0 4095 1 
i 12.09794 268.851 0.5378755 64 71.85694 0 0.6570329 0 0 4095 1 
i 12.46602 268.851 0.5378755 55 72.46071 0 0.6755073 0 0 4095 1 
i 12.65005 268.851 1.397635 52 72.7626 0 0.6847446 0 0 4095 1 
i 2.784594 270.2487 0.7171673 51 70.0208 0 0.1895731 0 0 4095 1 
i 6.88916 270.2487 0.7171673 58 70.0208 0 0.3955913 0 0 4095 1 
i 10.99373 270.2487 0.7171673 70 70.0208 0 0.6016095 0 0 4095 1 
i 15.09829 270.2487 0.7171673 82 70.0208 0 0.8076277 0 0 4095 1 
i 2.784594 270.4585 0.5378755 43 70.04495 0 0.1895731 0 0 4095 1 
i 3.520739 270.4585 0.5378755 43 71.25249 0 0.226522 0 0 4095 1 
i 4.011502 270.4585 0.5378755 50 72.05753 0 0.2511547 0 0 4095 1 
i 4.256884 270.4585 0.5378755 52 72.46004 0 0.263471 0 0 4095 1 
i 10.99373 270.4585 0.5378755 67 70.04495 0 0.6016095 0 0 4095 1 
i 11.72987 270.4585 0.5378755 67 71.25249 0 0.6385584 0 0 4095 1 
i 12.22063 270.4585 0.5378755 70 72.05753 0 0.663191 0 0 4095 1 
i 12.46602 270.4585 0.5378755 76 72.46004 0 0.6755073 0 0 4095 1 
i 4.569188 270.5461 0.5378755 60 74.2982 0 0.2791463 0 0 4095 1 
i 6.041478 270.5461 0.5378755 52 76.71329 0 0.3530441 0 0 4095 1 
i 12.77832 270.5461 0.5378755 84 74.2982 0 0.6911826 0 0 4095 1 
i 14.25061 270.5461 1.30864 76 76.71329 0 0.7650805 0 0 4095 1 
i 2.784594 271.8547 0.5378755 45 70.04428 0 0.1895731 0 0 4095 1 
i 3.091321 271.8547 0.5378755 51 70.54742 0 0.2049685 0 0 4095 1 
i 3.336703 271.8547 0.5378755 45 70.94994 0 0.2172848 0 0 4095 1 
i 3.520739 271.8547 0.5378755 37 71.25182 0 0.226522 0 0 4095 1 
i 3.827466 271.8547 0.5378755 59 71.75497 0 0.2419174 0 0 4095 1 
i 4.011502 271.8547 0.5378755 55 72.05686 0 0.2511547 0 0 4095 1 
i 4.256884 271.8547 0.5378755 61 72.45937 0 0.263471 0 0 4095 1 
i 4.563611 271.8547 0.5378755 67 72.96252 0 0.2788663 0 0 4095 1 
i 10.99373 271.8547 0.5378755 69 70.04428 0 0.6016095 0 0 4095 1 
i 11.30045 271.8547 0.5378755 75 70.54742 0 0.6170049 0 0 4095 1 
i 11.54583 271.8547 0.5378755 66 70.94994 0 0.6293212 0 0 4095 1 
i 11.72987 271.8547 0.5378755 61 71.25182 0 0.6385584 0 0 4095 1 
i 12.0366 271.8547 0.5378755 83 71.75497 0 0.6539538 0 0 4095 1 
i 12.22063 271.8547 0.5378755 76 72.05686 0 0.663191 0 0 4095 1 
i 12.46602 271.8547 0.5378755 85 72.45937 0 0.6755073 0 0 4095 1 
i 12.77274 271.8547 0.5378755 91 72.96252 0 0.6909027 0 0 4095 1 
i 2.784594 271.942 0.7171673 51 70.02013 0 0.1895731 0 0 4095 1 
i 6.88916 271.942 0.7171673 63 70.02013 0 0.3955913 0 0 4095 1 
i 10.99373 271.942 0.7171673 75 70.02013 0 0.6016095 0 0 4095 1 
i 15.09829 271.942 0.7171673 82 70.02013 0 0.8076277 0 0 4095 1 
i 4.569188 271.9485 0.5378755 60 74.29753 0 0.2791463 0 0 4095 1 
i 5.121297 271.9485 0.5378755 64 75.20319 0 0.3068579 0 0 4095 1 
i 5.61206 271.9485 0.5378755 58 76.00822 0 0.3314906 0 0 4095 1 
i 6.041478 271.9485 0.5378755 52 76.71262 0 0.3530441 0 0 4095 1 
i 12.77832 271.9485 0.5378755 79 74.29753 0 0.6911826 0 0 4095 1 
i 13.33043 271.9485 0.5378755 88 75.20319 0 0.7188943 0 0 4095 1 
i 13.82119 271.9485 0.5378755 82 76.00822 0 0.7435269 0 0 4095 1 
i 14.25061 271.9485 1.336625 76 76.71262 0 0.7650805 0 0 4095 1 
i 2.784594 273.2851 0.5378755 43 70.04361 0 0.1895731 0 0 4095 1 
i 3.152666 273.2851 0.5378755 43 70.64738 0 0.2080476 0 0 4095 1 
i 3.398048 273.2851 0.5378755 49 71.0499 0 0.2203639 0 0 4095 1 
i 3.520739 273.2851 0.5378755 55 71.25115 0 0.226522 0 0 4095 1 
i 3.888811 273.2851 0.5378755 31 71.85493 0 0.2449965 0 0 4095 1 
i 4.011502 273.2851 0.5378755 37 72.05618 0 0.2511547 0 0 4095 1 
i 4.256884 273.2851 0.5378755 28 72.4587 0 0.263471 0 0 4095 1 
i 4.624956 273.2851 0.5378755 28 73.06247 0 0.2819454 0 0 4095 1 
i 10.99373 273.2851 0.5378755 67 70.04361 0 0.6016095 0 0 4095 1 
i 11.3618 273.2851 0.5378755 63 70.64738 0 0.620084 0 0 4095 1 
i 11.60718 273.2851 0.5378755 73 71.0499 0 0.6324003 0 0 4095 1 
i 11.72987 273.2851 0.5378755 79 71.25115 0 0.6385584 0 0 4095 1 
i 12.09794 273.2851 0.5378755 55 71.85493 0 0.6570329 0 0 4095 1 
i 12.22063 273.2851 0.5378755 61 72.05618 0 0.663191 0 0 4095 1 
i 12.46602 273.2851 0.5378755 52 72.4587 0 0.6755073 0 0 4095 1 
i 12.83409 273.2851 0.5378755 52 73.06247 0 0.6939818 0 0 4095 1 
i 4.569188 273.385 0.5378755 61 74.29686 0 0.2791463 0 0 4095 1 
i 5.182642 273.385 0.5378755 52 75.30314 0 0.309937 0 0 4095 1 
i 5.673405 273.385 0.5378755 70 76.10818 0 0.3345696 0 0 4095 1 
i 6.041478 273.385 0.5378755 82 76.71195 0 0.3530441 0 0 4095 1 
i 12.77832 273.385 0.5378755 85 74.29686 0 0.6911826 0 0 4095 1 
i 13.39177 273.385 0.5378755 76 75.30314 0 0.7219734 0 0 4095 1 
i 13.88254 273.385 0.5378755 94 76.10818 0 0.746606 0 0 4095 1 
i 14.25061 273.385 0.5378755 106 76.71195 0 0.7650805 0 0 4095 1 
i 2.784594 273.6767 0.7171673 49 70.01945 0 0.1895731 0 0 4095 1 
i 6.88916 273.6767 0.7171673 61 70.01945 0 0.3955913 0 0 4095 1 
i 10.99373 273.6767 0.7171673 73 70.01945 0 0.6016095 0 0 4095 1 
i 15.09829 273.6767 0.9382255 85 70.01945 0 0.8076277 0 0 4095 1 
i 2.784594 274.6149 0.5378755 43 70.04294 0 0.1895731 0 0 4095 1 
i 3.091321 274.6149 0.5378755 46 70.54608 0 0.2049685 0 0 4095 1 
i 3.520739 274.6149 0.5378755 43 71.25048 0 0.226522 0 0 4095 1 
i 3.827466 274.6149 0.5378755 50 71.75363 0 0.2419174 0 0 4095 1 
i 4.011502 274.6149 0.5378755 50 72.05551 0 0.2511547 0 0 4095 1 
i 4.563611 274.6149 0.5378755 50 72.96117 0 0.2788663 0 0 4095 1 
i 10.99373 274.6149 0.5378755 67 70.04294 0 0.6016095 0 0 4095 1 
i 11.17776 274.6149 0.5378755 67 70.34482 0 0.6108467 0 0 4095 1 
i 11.72987 274.6149 0.5378755 67 71.25048 0 0.6385584 0 0 4095 1 
i 12.0366 274.6149 0.5378755 70 71.75363 0 0.6539538 0 0 4095 1 
i 12.77274 274.6149 0.5378755 74 72.96117 0 0.6909027 0 0 4095 1 
i 4.569188 274.7206 0.5378755 55 74.29618 0 0.2791463 0 0 4095 1 
i 4.753224 274.7206 0.5378755 55 74.59807 0 0.2883835 0 0 4095 1 
i 5.121297 274.7206 0.5378755 67 75.20184 0 0.3068579 0 0 4095 1 
i 5.182642 274.7206 0.5378755 69 75.30247 0 0.309937 0 0 4095 1 
i 5.61206 274.7206 0.5378755 53 76.00688 0 0.3314906 0 0 4095 1 
i 5.673405 274.7206 0.5378755 55 76.10751 0 0.3345696 0 0 4095 1 
i 6.041478 274.7206 0.5378755 47 76.71128 0 0.3530441 0 0 4095 1 
i 6.225514 274.7206 0.5378755 43 77.01317 0 0.3622813 0 0 4095 1 
i 12.77832 274.7206 0.5378755 79 74.29618 0 0.6911826 0 0 4095 1 
i 12.96236 274.7206 0.5378755 79 74.59807 0 0.7004199 0 0 4095 1 
i 13.33043 274.7206 0.5378755 91 75.20184 0 0.7188943 0 0 4095 1 
i 13.39177 274.7206 0.5378755 93 75.30247 0 0.7219734 0 0 4095 1 
i 13.82119 274.7206 0.5378755 77 76.00688 0 0.7435269 0 0 4095 1 
i 13.88254 274.7206 0.5378755 79 76.10751 0 0.746606 0 0 4095 1 
i 14.25061 274.7206 0.5378755 67 76.71128 0 0.7650805 0 0 4095 1 
i 14.43465 274.7206 0.5687673 67 77.01317 0 0.7743177 0 0 4095 1 
i 2.784594 275.2894 0.7171673 51 70.01878 0 0.1895731 0 0 4095 1 
i 2.96863 275.2894 0.7171673 51 70.32067 0 0.1988104 0 0 4095 1 
i 6.88916 275.2894 0.7171673 63 70.01878 0 0.3955913 0 0 4095 1 
i 7.073196 275.2894 0.7171673 63 70.32067 0 0.4048286 0 0 4095 1 
i 10.99373 275.2894 0.7171673 75 70.01878 0 0.6016095 0 0 4095 1 
i 11.17776 275.2894 0.7171673 75 70.32067 0 0.6108467 0 0 4095 1 
i 15.09829 275.2894 0.7171673 87 70.01878 0 0.8076277 0 0 4095 1 
i 15.28233 275.2894 0.9687744 87 70.32067 0 0.8168649 0 0 4095 1 
i 4.569188 276.2581 0.5378755 60 74.29551 0 0.2791463 0 0 4095 1 
i 5.305333 276.2581 0.5378755 60 75.50306 0 0.3160952 0 0 4095 1 
i 5.796096 276.2581 0.5378755 62 76.30809 0 0.3407278 0 0 4095 1 
i 6.041478 276.2581 0.5378755 64 76.71061 0 0.3530441 0 0 4095 1 
i 12.77832 276.2581 0.5378755 84 74.29551 0 0.6911826 0 0 4095 1 
i 13.51446 276.2581 0.5378755 84 75.50306 0 0.7281316 0 0 4095 1 
i 14.00523 276.2581 0.5378755 86 76.30809 0 0.7527642 0 0 4095 1 
i 14.25061 276.2581 0.8878072 88 76.71061 0 0.7650805 0 0 4095 1 
i 2.784594 277.1459 0.7171673 51 70.01811 0 0.1895731 0 0 4095 1 
i 6.88916 277.1459 0.7171673 63 70.01811 0 0.3955913 0 0 4095 1 
i 10.99373 277.1459 0.7171673 75 70.01811 0 0.6016095 0 0 4095 1 
i 15.09829 277.1459 0.7171673 87 70.01811 0 0.8076277 0 0 4095 1 
i 4.569188 277.5937 0.5378755 61 74.29484 0 0.2791463 0 0 4095 1 
i 4.875915 277.5937 0.5378755 67 74.79799 0 0.2945416 0 0 4095 1 
i 5.121297 277.5937 0.5378755 57 75.2005 0 0.3068579 0 0 4095 1 
i 5.305333 277.5937 0.5378755 54 75.50239 0 0.3160952 0 0 4095 1 
i 5.61206 277.5937 0.5378755 76 76.00553 0 0.3314906 0 0 4095 1 
i 5.796096 277.5937 0.5378755 67 76.30742 0 0.3407278 0 0 4095 1 
i 6.041478 277.5937 0.5378755 77 76.70994 0 0.3530441 0 0 4095 1 
i 6.348205 277.5937 0.5378755 79 77.21308 0 0.3684395 0 0 4095 1 
i 12.77832 277.5937 0.5378755 85 74.29484 0 0.6911826 0 0 4095 1 
i 13.08505 277.5937 0.5378755 87 74.79799 0 0.706578 0 0 4095 1 
i 13.33043 277.5937 0.5378755 81 75.2005 0 0.7188943 0 0 4095 1 
i 13.51446 277.5937 0.5378755 78 75.50239 0 0.7281316 0 0 4095 1 
i 13.82119 277.5937 0.5378755 100 76.00553 0 0.7435269 0 0 4095 1 
i 14.00523 277.5937 0.5378755 91 76.30742 0 0.7527642 0 0 4095 1 
i 14.25061 277.5937 0.5378755 97 76.70994 0 0.7650805 0 0 4095 1 
i 14.55734 277.5937 1.164939 103 77.21308 0 0.7804759 0 0 4095 1 
i 2.784594 278.7586 0.7171673 52 70.01744 0 0.1895731 0 0 4095 1 
i 3.091321 278.7586 0.7171673 54 70.52059 0 0.2049685 0 0 4095 1 
i 6.88916 278.7586 0.7171673 60 70.01744 0 0.3955913 0 0 4095 1 
i 7.195887 278.7586 0.7171673 66 70.52059 0 0.4109867 0 0 4095 1 
i 10.99373 278.7586 0.7171673 72 70.01744 0 0.6016095 0 0 4095 1 
i 11.30045 278.7586 0.7171673 78 70.52059 0 0.6170049 0 0 4095 1 
i 15.09829 278.7586 0.7171673 84 70.01744 0 0.8076277 0 0 4095 1 
i 15.40502 278.7586 0.7171673 87 70.52059 0 0.8230231 0 0 4095 1 
i 4.569188 278.9619 0.5378755 60 74.29417 0 0.2791463 0 0 4095 1 
i 4.93726 278.9619 0.5378755 55 74.89795 0 0.2976207 0 0 4095 1 
i 5.182642 278.9619 0.5378755 66 75.30046 0 0.309937 0 0 4095 1 
i 5.305333 278.9619 0.5378755 67 75.50172 0 0.3160952 0 0 4095 1 
i 5.673405 278.9619 0.5378755 52 76.10549 0 0.3345696 0 0 4095 1 
i 5.796096 278.9619 0.5378755 53 76.30675 0 0.3407278 0 0 4095 1 
i 6.041478 278.9619 0.5378755 43 76.70927 0 0.3530441 0 0 4095 1 
i 6.40955 278.9619 0.5378755 40 77.31304 0 0.3715185 0 0 4095 1 
i 12.77832 278.9619 0.5378755 84 74.29417 0 0.6911826 0 0 4095 1 
i 13.14639 278.9619 0.5378755 79 74.89795 0 0.7096571 0 0 4095 1 
i 13.39177 278.9619 0.5378755 90 75.30046 0 0.7219734 0 0 4095 1 
i 13.51446 278.9619 0.5378755 91 75.50172 0 0.7281316 0 0 4095 1 
i 13.88254 278.9619 0.5378755 71 76.10549 0 0.746606 0 0 4095 1 
i 14.00523 278.9619 0.5378755 73 76.30675 0 0.7527642 0 0 4095 1 
i 14.25061 278.9619 0.5378755 67 76.70927 0 0.7650805 0 0 4095 1 
i 14.61868 278.9619 1.271978 64 77.31304 0 0.7835549 0 0 4095 1 
i 4.569188 280.2338 0.5378755 60 74.2935 0 0.2791463 0 0 4095 1 
i 4.875915 280.2338 0.5378755 61 74.79665 0 0.2945416 0 0 4095 1 
i 5.121297 280.2338 0.5378755 60 75.19916 0 0.3068579 0 0 4095 1 
i 5.489369 280.2338 0.5378755 60 75.80294 0 0.3253324 0 0 4095 1 
i 5.61206 280.2338 0.5378755 62 76.00419 0 0.3314906 0 0 4095 1 
i 6.041478 280.2338 0.5378755 64 76.7086 0 0.3530441 0 0 4095 1 
i 12.77832 280.2338 0.5378755 84 74.2935 0 0.6911826 0 0 4095 1 
i 13.08505 280.2338 0.5378755 85 74.79665 0 0.706578 0 0 4095 1 
i 13.33043 280.2338 0.5378755 84 75.19916 0 0.7188943 0 0 4095 1 
i 13.6985 280.2338 0.5378755 79 75.80294 0 0.7373688 0 0 4095 1 
i 14.00523 280.2338 0.5378755 86 76.30608 0 0.7527642 0 0 4095 1 
i 14.25061 280.2338 0.5378755 88 76.7086 0 0.7650805 0 0 4095 1 
i 2.784594 280.4107 0.7171673 51 70.01677 0 0.1895731 0 0 4095 1 
i 3.152666 280.4107 0.7171673 54 70.62055 0 0.2080476 0 0 4095 1 
i 6.88916 280.4107 0.7171673 63 70.01677 0 0.3955913 0 0 4095 1 
i 7.257232 280.4107 0.7171673 66 70.62055 0 0.4140658 0 0 4095 1 
i 10.99373 280.4107 0.7171673 75 70.01677 0 0.6016095 0 0 4095 1 
i 11.3618 280.4107 0.7171673 78 70.62055 0 0.620084 0 0 4095 1 
i 15.09829 280.4107 0.7171673 87 70.01677 0 0.8076277 0 0 4095 1 
i 15.46636 280.4107 1.535913 90 70.62055 0 0.8261022 0 0 4095 1 
i 2.784594 281.9466 0.7171673 51 70.0161 0 0.1895731 0 0 4095 1 
i 2.96863 281.9466 0.7171673 51 70.31799 0 0.1988104 0 0 4095 1 
i 3.091321 281.9466 0.7171673 52 70.51925 0 0.2049685 0 0 4095 1 
i 3.152666 281.9466 0.7171673 55 70.61987 0 0.2080476 0 0 4095 1 
i 6.88916 281.9466 0.7171673 63 70.0161 0 0.3955913 0 0 4095 1 
i 7.073196 281.9466 0.7171673 63 70.31799 0 0.4048286 0 0 4095 1 
i 7.195887 281.9466 0.7171673 64 70.51925 0 0.4109867 0 0 4095 1 
i 7.257232 281.9466 0.7171673 67 70.61987 0 0.4140658 0 0 4095 1 
i 10.99373 281.9466 0.7171673 75 70.0161 0 0.6016095 0 0 4095 1 
i 11.17776 281.9466 0.7171673 75 70.31799 0 0.6108467 0 0 4095 1 
i 11.30045 281.9466 0.7171673 76 70.51925 0 0.6170049 0 0 4095 1 
i 11.3618 281.9466 0.7171673 79 70.61987 0 0.620084 0 0 4095 1 
i 15.09829 281.9466 0.7171673 87 70.0161 0 0.8076277 0 0 4095 1 
i 15.28233 281.9466 0.7171673 87 70.31799 0 0.8168649 0 0 4095 1 
i 15.40502 281.9466 0.7171673 88 70.51925 0 0.8230231 0 0 4095 1 
i 15.46636 281.9466 2.137916 91 70.61987 0 0.8261022 0 0 4095 1 
i 2.784594 284.0845 0.7171673 49 70.01543 0 0.1895731 0 0 4095 1 
i 6.88916 284.0845 0.7171673 61 70.01543 0 0.3955913 0 0 4095 1 
i 10.99373 284.0845 0.7171673 73 70.01543 0 0.6016095 0 0 4095 1 
i 15.09829 284.0845 1.612709 85 70.01543 0 0.8076277 0 0 4095 1 
i 2.784594 285.6972 0.7171673 51 70.01476 0 0.1895731 0 0 4095 1 
i 3.336703 285.6972 0.7171673 54 70.92042 0 0.2172848 0 0 4095 1 
i 6.88916 285.6972 0.7171673 63 70.01476 0 0.3955913 0 0 4095 1 
i 7.441269 285.6972 0.7171673 66 70.92042 0 0.423303 0 0 4095 1 
i 10.99373 285.6972 0.7171673 75 70.01476 0 0.6016095 0 0 4095 1 
i 11.54583 285.6972 0.7171673 78 70.92042 0 0.6293212 0 0 4095 1 
i 15.09829 285.6972 0.7171673 87 70.01476 0 0.8076277 0 0 4095 1 
i 15.6504 285.6972 1.652043 90 70.92042 0 0.8353394 0 0 4095 1 
i 2.784594 287.3493 0.7171673 48 70.01409 0 0.1895731 0 0 4095 1 
i 3.398048 287.3493 0.7171673 54 71.02038 0 0.2203639 0 0 4095 1 
i 6.88916 287.3493 0.7171673 60 70.01409 0 0.3955913 0 0 4095 1 
i 7.502614 287.3493 0.7171673 66 71.02038 0 0.4263821 0 0 4095 1 
i 10.99373 287.3493 0.7171673 72 70.01409 0 0.6016095 0 0 4095 1 
i 11.60718 287.3493 0.7171673 78 71.02038 0 0.6324003 0 0 4095 1 
i 15.09829 287.3493 0.7171673 84 70.01409 0 0.8076277 0 0 4095 1 
i 15.71175 287.3493 1.535913 90 71.02038 0 0.8384185 0 0 4095 1 
i 2.784594 288.8852 0.7171673 49 70.01342 0 0.1895731 0 0 4095 1 
i 2.96863 288.8852 0.7171673 49 70.3153 0 0.1988104 0 0 4095 1 
i 3.336703 288.8852 0.7171673 57 70.91908 0 0.2172848 0 0 4095 1 
i 3.398048 288.8852 0.7171673 55 71.01971 0 0.2203639 0 0 4095 1 
i 6.88916 288.8852 0.7171673 61 70.01342 0 0.3955913 0 0 4095 1 
i 7.073196 288.8852 0.7171673 61 70.3153 0 0.4048286 0 0 4095 1 
i 7.441269 288.8852 0.7171673 69 70.91908 0 0.423303 0 0 4095 1 
i 7.502614 288.8852 0.7171673 67 71.01971 0 0.4263821 0 0 4095 1 
i 10.99373 288.8852 0.7171673 73 70.01342 0 0.6016095 0 0 4095 1 
i 11.17776 288.8852 0.7171673 73 70.3153 0 0.6108467 0 0 4095 1 
i 11.54583 288.8852 0.7171673 76 70.91908 0 0.6293212 0 0 4095 1 
i 11.60718 288.8852 0.7171673 79 71.01971 0 0.6324003 0 0 4095 1 
i 15.09829 288.8852 0.7171673 85 70.01342 0 0.8076277 0 0 4095 1 
i 15.28233 288.8852 0.7171673 81 70.3153 0 0.8168649 0 0 4095 1 
i 15.6504 288.8852 0.7171673 88 70.91908 0 0.8353394 0 0 4095 1 
i 15.71175 288.8852 1.768173 91 71.01971 0 0.8384185 0 0 4095 1 
i 2.784594 290.6534 0.7171673 51 70.01275 0 0.1895731 0 0 4095 1 
i 3.520739 290.6534 0.7171673 58 71.22029 0 0.226522 0 0 4095 1 
i 6.88916 290.6534 0.7171673 63 70.01275 0 0.3955913 0 0 4095 1 
i 7.625305 290.6534 0.7171673 66 71.22029 0 0.4325402 0 0 4095 1 
i 10.99373 290.6534 0.7171673 75 70.01275 0 0.6016095 0 0 4095 1 
i 11.72987 290.6534 0.7171673 78 71.22029 0 0.6385584 0 0 4095 1 
i 15.09829 290.6534 0.7171673 87 70.01275 0 0.8076277 0 0 4095 1 
i 15.83444 290.6534 0.7171673 90 71.22029 0 0.8445766 0 0 4095 1 
i 1 291.0644 0.5378755 56 70.0208 0 0.1 0 0 4095 1 
i 5.104566 291.0644 0.5378755 63 70.0208 0 0.3060182 0 0 4095 1 
i 9.209132 291.0644 0.5378755 75 70.0208 0 0.5120364 0 0 4095 1 
i 13.3137 291.0644 1.124869 87 70.0208 0 0.7180546 0 0 4095 1 
i 2.784594 292.1893 0.7171673 55 70.01208 0 0.1895731 0 0 4095 1 
i 3.091321 292.1893 0.7171673 49 70.51522 0 0.2049685 0 0 4095 1 
i 3.336703 292.1893 0.7171673 55 70.91774 0 0.2172848 0 0 4095 1 
i 3.520739 292.1893 0.7171673 58 71.21962 0 0.226522 0 0 4095 1 
i 6.88916 292.1893 0.7171673 63 70.01208 0 0.3955913 0 0 4095 1 
i 7.195887 292.1893 0.7171673 61 70.51522 0 0.4109867 0 0 4095 1 
i 7.441269 292.1893 0.7171673 67 70.91774 0 0.423303 0 0 4095 1 
i 7.625305 292.1893 0.7171673 70 71.21962 0 0.4325402 0 0 4095 1 
i 10.99373 292.1893 0.7171673 75 70.01208 0 0.6016095 0 0 4095 1 
i 11.30045 292.1893 0.7171673 73 70.51522 0 0.6170049 0 0 4095 1 
i 11.54583 292.1893 0.7171673 79 70.91774 0 0.6293212 0 0 4095 1 
i 11.72987 292.1893 0.7171673 79 71.21962 0 0.6385584 0 0 4095 1 
i 15.09829 292.1893 0.7171673 87 70.01208 0 0.8076277 0 0 4095 1 
i 15.40502 292.1893 0.7171673 85 70.51522 0 0.8230231 0 0 4095 1 
i 15.6504 292.1893 0.7171673 91 70.91774 0 0.8353394 0 0 4095 1 
i 15.83444 292.1893 0.7171673 91 71.21962 0 0.8445766 0 0 4095 1 
i 1 292.7577 0.5378755 56 70.02013 0 0.1 0 0 4095 1 
i 5.104566 292.7577 0.5378755 68 70.02013 0 0.3060182 0 0 4095 1 
i 9.209132 292.7577 0.5378755 80 70.02013 0 0.5120364 0 0 4095 1 
i 13.3137 292.7577 1.004899 87 70.02013 0 0.7180546 0 0 4095 1 
i 2.784594 293.7626 0.7171673 52 70.0114 0 0.1895731 0 0 4095 1 
i 3.152666 293.7626 0.7171673 49 70.61518 0 0.2080476 0 0 4095 1 
i 3.398048 293.7626 0.7171673 55 71.01769 0 0.2203639 0 0 4095 1 
i 3.520739 293.7626 0.7171673 57 71.21895 0 0.226522 0 0 4095 1 
i 6.88916 293.7626 0.7171673 64 70.0114 0 0.3955913 0 0 4095 1 
i 7.257232 293.7626 0.7171673 61 70.61518 0 0.4140658 0 0 4095 1 
i 7.502614 293.7626 0.7171673 67 71.01769 0 0.4263821 0 0 4095 1 
i 7.625305 293.7626 0.7171673 69 71.21895 0 0.4325402 0 0 4095 1 
i 10.99373 293.7626 0.7171673 76 70.0114 0 0.6016095 0 0 4095 1 
i 11.3618 293.7626 0.7171673 73 70.61518 0 0.620084 0 0 4095 1 
i 11.60718 293.7626 0.7171673 79 71.01769 0 0.6324003 0 0 4095 1 
i 11.72987 293.7626 0.7171673 81 71.21895 0 0.6385584 0 0 4095 1 
i 15.09829 293.7626 0.7171673 88 70.0114 0 0.8076277 0 0 4095 1 
i 15.46636 293.7626 0.7171673 85 70.61518 0 0.8261022 0 0 4095 1 
i 15.71175 293.7626 0.7171673 91 71.01769 0 0.8384185 0 0 4095 1 
i 15.83444 293.7626 0.7297459 93 71.21895 0 0.8445766 0 0 4095 1 
i 1 294.4924 0.5378755 54 70.01945 0 0.1 0 0 4095 1 
i 5.104566 294.4924 0.5378755 66 70.01945 0 0.3060182 0 0 4095 1 
i 9.209132 294.4924 0.5378755 78 70.01945 0 0.5120364 0 0 4095 1 
i 13.3137 294.4924 0.7330282 90 70.01945 0 0.7180546 0 0 4095 1 
i 2.784594 295.2254 0.7171673 54 70.01073 0 0.1895731 0 0 4095 1 
i 2.96863 295.2254 0.7171673 54 70.31262 0 0.1988104 0 0 4095 1 
i 3.091321 295.2254 0.7171673 52 70.51388 0 0.2049685 0 0 4095 1 
i 3.152666 295.2254 0.7171673 51 70.61451 0 0.2080476 0 0 4095 1 
i 3.336703 295.2254 0.7171673 54 70.91639 0 0.2172848 0 0 4095 1 
i 3.398048 295.2254 0.7171673 57 71.01702 0 0.2203639 0 0 4095 1 
i 3.520739 295.2254 0.7171673 58 71.21828 0 0.226522 0 0 4095 1 
i 3.704775 295.2254 0.7171673 58 71.52017 0 0.2357593 0 0 4095 1 
i 6.88916 295.2254 0.7171673 63 70.01073 0 0.3955913 0 0 4095 1 
i 7.073196 295.2254 0.7171673 66 70.31262 0 0.4048286 0 0 4095 1 
i 7.195887 295.2254 0.7171673 64 70.51388 0 0.4109867 0 0 4095 1 
i 7.257232 295.2254 0.7171673 63 70.61451 0 0.4140658 0 0 4095 1 
i 7.441269 295.2254 0.7171673 66 70.91639 0 0.423303 0 0 4095 1 
i 7.502614 295.2254 0.7171673 69 71.01702 0 0.4263821 0 0 4095 1 
i 7.625305 295.2254 0.7171673 70 71.21828 0 0.4325402 0 0 4095 1 
i 7.809341 295.2254 0.7171673 70 71.52017 0 0.4417775 0 0 4095 1 
i 10.99373 295.2254 0.7171673 75 70.01073 0 0.6016095 0 0 4095 1 
i 11.17776 295.2254 0.7171673 78 70.31262 0 0.6108467 0 0 4095 1 
i 11.30045 295.2254 0.7171673 76 70.51388 0 0.6170049 0 0 4095 1 
i 11.3618 295.2254 0.7171673 75 70.61451 0 0.620084 0 0 4095 1 
i 11.54583 295.2254 0.7171673 78 70.91639 0 0.6293212 0 0 4095 1 
i 11.60718 295.2254 0.7171673 76 71.01702 0 0.6324003 0 0 4095 1 
i 11.72987 295.2254 0.7171673 82 71.21828 0 0.6385584 0 0 4095 1 
i 11.91391 295.2254 0.7171673 82 71.52017 0 0.6477957 0 0 4095 1 
i 15.09829 295.2254 0.7171673 87 70.01073 0 0.8076277 0 0 4095 1 
i 15.28233 295.2254 0.7171673 90 70.31262 0 0.8168649 0 0 4095 1 
i 15.40502 295.2254 0.7171673 84 70.51388 0 0.8230231 0 0 4095 1 
i 15.46636 295.2254 0.7171673 87 70.61451 0 0.8261022 0 0 4095 1 
i 15.6504 295.2254 0.7171673 90 70.91639 0 0.8353394 0 0 4095 1 
i 15.71175 295.2254 0.7171673 88 71.01702 0 0.8384185 0 0 4095 1 
i 15.83444 295.2254 0.7171673 90 71.21828 0 0.8445766 0 0 4095 1 
i 16.01847 295.2254 0.8796803 94 71.52017 0 0.8538139 0 0 4095 1 
i 1 296.1051 0.5378755 56 70.01878 0 0.1 0 0 4095 1 
i 1.184036 296.1051 0.5378755 59 70.32067 0 0.1092372 0 0 4095 1 
i 5.104566 296.1051 0.5378755 68 70.01878 0 0.3060182 0 0 4095 1 
i 5.288602 296.1051 0.5378755 68 70.32067 0 0.3152554 0 0 4095 1 
i 9.209132 296.1051 0.5378755 80 70.01878 0 0.5120364 0 0 4095 1 
i 9.393168 296.1051 0.5378755 80 70.32067 0 0.5212736 0 0 4095 1 
i 13.3137 296.1051 0.5378755 92 70.01878 0 0.7180546 0 0 4095 1 
i 13.49773 296.1051 1.856582 92 70.32067 0 0.7272918 0 0 4095 1 
i 2.784594 297.9617 0.7171673 47 70.01006 0 0.1895731 0 0 4095 1 
i 6.88916 297.9617 0.7171673 59 70.01006 0 0.3955913 0 0 4095 1 
i 10.99373 297.9617 0.7171673 71 70.01006 0 0.6016095 0 0 4095 1 
i 15.09829 297.9617 0.7171673 79 70.01006 0 0.8076277 0 0 4095 1 
i 1 297.9617 0.5378755 56 70.01811 0 0.1 0 0 4095 1 
i 5.104566 297.9617 0.5378755 68 70.01811 0 0.3060182 0 0 4095 1 
i 9.209132 297.9617 0.5378755 80 70.01811 0 0.5120364 0 0 4095 1 
i 13.3137 297.9617 1.612709 92 70.01811 0 0.7180546 0 0 4095 1 
i 1 299.5744 0.5378755 57 70.01744 0 0.1 0 0 4095 1 
i 1.306727 299.5744 0.5378755 59 70.52059 0 0.1153954 0 0 4095 1 
i 2.784594 299.5744 0.7171673 44 70.00939 0 0.1895731 0 0 4095 1 
i 3.827466 299.5744 0.7171673 54 71.72008 0 0.2419174 0 0 4095 1 
i 5.104566 299.5744 0.5378755 69 70.01744 0 0.3060182 0 0 4095 1 
i 5.411293 299.5744 0.5378755 71 70.52059 0 0.3214136 0 0 4095 1 
i 6.88916 299.5744 0.7171673 56 70.00939 0 0.3955913 0 0 4095 1 
i 7.932032 299.5744 0.7171673 66 71.72008 0 0.4479356 0 0 4095 1 
i 9.209132 299.5744 0.5378755 77 70.01744 0 0.5120364 0 0 4095 1 
i 9.515859 299.5744 0.5378755 83 70.52059 0 0.5274318 0 0 4095 1 
i 10.99373 299.5744 0.7171673 68 70.00939 0 0.6016095 0 0 4095 1 
i 12.0366 299.5744 0.7171673 78 71.72008 0 0.6539538 0 0 4095 1 
i 13.3137 299.5744 0.5378755 89 70.01744 0 0.7180546 0 0 4095 1 
i 13.62043 299.5744 0.5378755 95 70.52059 0 0.73345 0 0 4095 1 
i 15.09829 299.5744 0.7171673 80 70.00939 0 0.8076277 0 0 4095 1 
i 16.14116 299.5744 1.652043 90 71.72008 0 0.859972 0 0 4095 1 
i 1 301.2264 0.5378755 59 70.01677 0 0.1 0 0 4095 1 
i 1.368072 301.2264 0.5378755 63 70.62055 0 0.1184745 0 0 4095 1 
i 2.784594 301.2264 0.7171673 46 70.00872 0 0.1895731 0 0 4095 1 
i 3.888811 301.2264 0.7171673 54 71.82004 0 0.2449965 0 0 4095 1 
i 5.104566 301.2264 0.5378755 68 70.01677 0 0.3060182 0 0 4095 1 
i 5.472639 301.2264 0.5378755 71 70.62055 0 0.3244927 0 0 4095 1 
i 6.88916 301.2264 0.7171673 55 70.00872 0 0.3955913 0 0 4095 1 
i 7.993377 301.2264 0.7171673 66 71.82004 0 0.4510147 0 0 4095 1 
i 9.209132 301.2264 0.5378755 80 70.01677 0 0.5120364 0 0 4095 1 
i 9.577205 301.2264 0.5378755 83 70.62055 0 0.5305108 0 0 4095 1 
i 10.99373 301.2264 0.7171673 67 70.00872 0 0.6016095 0 0 4095 1 
i 12.09794 301.2264 0.7171673 78 71.82004 0 0.6570329 0 0 4095 1 
i 13.3137 301.2264 0.5378755 92 70.01677 0 0.7180546 0 0 4095 1 
i 13.68177 301.2264 0.5378755 95 70.62055 0 0.736529 0 0 4095 1 
i 15.09829 301.2264 0.7171673 79 70.00872 0 0.8076277 0 0 4095 1 
i 16.20251 301.2264 1.535913 90 71.82004 0 0.8630511 0 0 4095 1 
i 1 302.7623 0.5378755 56 70.0161 0 0.1 0 0 4095 1 
i 1.184036 302.7623 0.5378755 56 70.31799 0 0.1092372 0 0 4095 1 
i 1.306727 302.7623 0.5378755 57 70.51925 0 0.1153954 0 0 4095 1 
i 1.368072 302.7623 0.5378755 60 70.61987 0 0.1184745 0 0 4095 1 
i 2.784594 302.7623 0.7171673 43 70.00805 0 0.1895731 0 0 4095 1 
i 2.96863 302.7623 0.7171673 43 70.30994 0 0.1988104 0 0 4095 1 
i 3.827466 302.7623 0.7171673 57 71.71874 0 0.2419174 0 0 4095 1 
i 3.888811 302.7623 0.7171673 54 71.81937 0 0.2449965 0 0 4095 1 
i 5.104566 302.7623 0.5378755 68 70.0161 0 0.3060182 0 0 4095 1 
i 5.288602 302.7623 0.5378755 68 70.31799 0 0.3152554 0 0 4095 1 
i 5.411293 302.7623 0.5378755 69 70.51925 0 0.3214136 0 0 4095 1 
i 5.472639 302.7623 0.5378755 72 70.61987 0 0.3244927 0 0 4095 1 
i 6.88916 302.7623 0.7171673 55 70.00805 0 0.3955913 0 0 4095 1 
i 7.073196 302.7623 0.7171673 55 70.30994 0 0.4048286 0 0 4095 1 
i 7.932032 302.7623 0.7171673 69 71.71874 0 0.4479356 0 0 4095 1 
i 7.993377 302.7623 0.7171673 66 71.81937 0 0.4510147 0 0 4095 1 
i 9.209132 302.7623 0.5378755 80 70.0161 0 0.5120364 0 0 4095 1 
i 9.393168 302.7623 0.5378755 80 70.31799 0 0.5212736 0 0 4095 1 
i 9.515859 302.7623 0.5378755 81 70.51925 0 0.5274318 0 0 4095 1 
i 9.577205 302.7623 0.5378755 80 70.61987 0 0.5305108 0 0 4095 1 
i 10.99373 302.7623 0.7171673 67 70.00805 0 0.6016095 0 0 4095 1 
i 11.17776 302.7623 0.7171673 67 70.30994 0 0.6108467 0 0 4095 1 
i 12.0366 302.7623 0.7171673 77 71.71874 0 0.6539538 0 0 4095 1 
i 12.09794 302.7623 0.7171673 78 71.81937 0 0.6570329 0 0 4095 1 
i 13.3137 302.7623 0.5378755 92 70.0161 0 0.7180546 0 0 4095 1 
i 13.49773 302.7623 0.5378755 92 70.31799 0 0.7272918 0 0 4095 1 
i 13.62043 302.7623 0.5378755 93 70.51925 0 0.73345 0 0 4095 1 
i 13.68177 302.7623 0.5378755 92 70.61987 0 0.736529 0 0 4095 1 
i 15.09829 302.7623 0.7171673 79 70.00805 0 0.8076277 0 0 4095 1 
i 15.28233 302.7623 0.7171673 79 70.30994 0 0.8168649 0 0 4095 1 
i 16.14116 302.7623 0.7171673 89 71.71874 0 0.859972 0 0 4095 1 
i 16.20251 302.7623 1.768173 90 71.81937 0 0.8630511 0 0 4095 1 
i 2.784594 304.5305 0.7171673 44 70.00738 0 0.1895731 0 0 4095 1 
i 4.011502 304.5305 0.7171673 59 72.01996 0 0.2511547 0 0 4095 1 
i 6.88916 304.5305 0.7171673 56 70.00738 0 0.3955913 0 0 4095 1 
i 8.116068 304.5305 0.7171673 66 72.01996 0 0.4571728 0 0 4095 1 
i 10.99373 304.5305 0.7171673 68 70.00738 0 0.6016095 0 0 4095 1 
i 12.22063 304.5305 0.7171673 78 72.01996 0 0.663191 0 0 4095 1 
i 15.09829 304.5305 0.7171673 80 70.00738 0 0.8076277 0 0 4095 1 
i 16.3252 304.5305 0.7171673 90 72.01996 0 0.8692092 0 0 4095 1 
i 1 304.9003 0.5378755 54 70.01543 0 0.1 0 0 4095 1 
i 5.104566 304.9003 0.5378755 66 70.01543 0 0.3060182 0 0 4095 1 
i 9.209132 304.9003 0.5378755 78 70.01543 0 0.5120364 0 0 4095 1 
i 13.3137 304.9003 1.16617 90 70.01543 0 0.7180546 0 0 4095 1 
i 2.784594 306.0664 0.7171673 44 70.00671 0 0.1895731 0 0 4095 1 
i 3.091321 306.0664 0.7171673 43 70.50985 0 0.2049685 0 0 4095 1 
i 3.827466 306.0664 0.7171673 54 71.7174 0 0.2419174 0 0 4095 1 
i 4.011502 306.0664 0.7171673 59 72.01929 0 0.2511547 0 0 4095 1 
i 6.88916 306.0664 0.7171673 56 70.00671 0 0.3955913 0 0 4095 1 
i 7.195887 306.0664 0.7171673 55 70.50985 0 0.4109867 0 0 4095 1 
i 7.932032 306.0664 0.7171673 66 71.7174 0 0.4479356 0 0 4095 1 
i 8.116068 306.0664 0.7171673 71 72.01929 0 0.4571728 0 0 4095 1 
i 10.99373 306.0664 0.7171673 68 70.00671 0 0.6016095 0 0 4095 1 
i 11.30045 306.0664 0.7171673 67 70.50985 0 0.6170049 0 0 4095 1 
i 12.0366 306.0664 0.7171673 78 71.7174 0 0.6539538 0 0 4095 1 
i 12.22063 306.0664 0.7171673 78 72.01929 0 0.663191 0 0 4095 1 
i 15.09829 306.0664 0.7171673 80 70.00671 0 0.8076277 0 0 4095 1 
i 15.40502 306.0664 0.7171673 74 70.50985 0 0.8230231 0 0 4095 1 
i 16.14116 306.0664 0.7171673 87 71.7174 0 0.859972 0 0 4095 1 
i 16.3252 306.0664 0.7171673 90 72.01929 0 0.8692092 0 0 4095 1 
i 1 306.513 0.5378755 56 70.01476 0 0.1 0 0 4095 1 
i 1.552109 306.513 0.5378755 63 70.92042 0 0.1277117 0 0 4095 1 
i 5.104566 306.513 0.5378755 68 70.01476 0 0.3060182 0 0 4095 1 
i 5.656675 306.513 0.5378755 75 70.92042 0 0.3337299 0 0 4095 1 
i 9.209132 306.513 0.5378755 80 70.01476 0 0.5120364 0 0 4095 1 
i 9.761241 306.513 0.5378755 83 70.92042 0 0.5397481 0 0 4095 1 
i 13.3137 306.513 0.5378755 92 70.01476 0 0.7180546 0 0 4095 1 
i 13.86581 306.513 1.126836 95 70.92042 0 0.7457663 0 0 4095 1 
i 2.784594 307.6398 0.7171673 43 70.00604 0 0.1895731 0 0 4095 1 
i 3.152666 307.6398 0.7171673 43 70.60981 0 0.2080476 0 0 4095 1 
i 3.888811 307.6398 0.7171673 54 71.81736 0 0.2449965 0 0 4095 1 
i 4.011502 307.6398 0.7171673 57 72.01862 0 0.2511547 0 0 4095 1 
i 6.88916 307.6398 0.7171673 55 70.00604 0 0.3955913 0 0 4095 1 
i 7.257232 307.6398 0.7171673 55 70.60981 0 0.4140658 0 0 4095 1 
i 7.993377 307.6398 0.7171673 66 71.81736 0 0.4510147 0 0 4095 1 
i 8.116068 307.6398 0.7171673 69 72.01862 0 0.4571728 0 0 4095 1 
i 10.99373 307.6398 0.7171673 67 70.00604 0 0.6016095 0 0 4095 1 
i 11.3618 307.6398 0.7171673 62 70.60981 0 0.620084 0 0 4095 1 
i 12.09794 307.6398 0.7171673 78 71.81736 0 0.6570329 0 0 4095 1 
i 12.22063 307.6398 0.7171673 81 72.01862 0 0.663191 0 0 4095 1 
i 15.09829 307.6398 0.7171673 79 70.00604 0 0.8076277 0 0 4095 1 
i 15.46636 307.6398 0.7171673 74 70.60981 0 0.8261022 0 0 4095 1 
i 16.20251 307.6398 0.7171673 90 71.81736 0 0.8630511 0 0 4095 1 
i 16.3252 307.6398 0.7171673 93 72.01862 0 0.8692092 0 0 4095 1 
i 1 308.165 0.5378755 57 70.01409 0 0.1 0 0 4095 1 
i 1.613454 308.165 0.5378755 63 71.02038 0 0.1307908 0 0 4095 1 
i 5.104566 308.165 0.5378755 65 70.01409 0 0.3060182 0 0 4095 1 
i 5.71802 308.165 0.5378755 75 71.02038 0 0.336809 0 0 4095 1 
i 9.209132 308.165 0.5378755 77 70.01409 0 0.5120364 0 0 4095 1 
i 9.822586 308.165 0.5378755 87 71.02038 0 0.5428272 0 0 4095 1 
i 13.3137 308.165 0.5378755 89 70.01409 0 0.7180546 0 0 4095 1 
i 13.92715 308.165 0.9375669 99 71.02038 0 0.7488453 0 0 4095 1 
i 2.784594 309.1026 0.7171673 44 70.00537 0 0.1895731 0 0 4095 1 
i 2.96863 309.1026 0.7171673 44 70.30725 0 0.1988104 0 0 4095 1 
i 3.091321 309.1026 0.7171673 43 70.50851 0 0.2049685 0 0 4095 1 
i 3.152666 309.1026 0.7171673 40 70.60914 0 0.2080476 0 0 4095 1 
i 3.827466 309.1026 0.7171673 54 71.71606 0 0.2419174 0 0 4095 1 
i 3.888811 309.1026 0.7171673 56 71.81669 0 0.2449965 0 0 4095 1 
i 4.011502 309.1026 0.7171673 59 72.01795 0 0.2511547 0 0 4095 1 
i 4.195539 309.1026 0.7171673 59 72.31983 0 0.2603919 0 0 4095 1 
i 6.88916 309.1026 0.7171673 56 70.00537 0 0.3955913 0 0 4095 1 
i 7.073196 309.1026 0.7171673 56 70.30725 0 0.4048286 0 0 4095 1 
i 7.195887 309.1026 0.7171673 55 70.50851 0 0.4109867 0 0 4095 1 
i 7.257232 309.1026 0.7171673 52 70.60914 0 0.4140658 0 0 4095 1 
i 7.932032 309.1026 0.7171673 66 71.71606 0 0.4479356 0 0 4095 1 
i 7.993377 309.1026 0.7171673 68 71.81669 0 0.4510147 0 0 4095 1 
i 8.116068 309.1026 0.7171673 71 72.01795 0 0.4571728 0 0 4095 1 
i 8.300105 309.1026 0.7171673 71 72.31983 0 0.4664101 0 0 4095 1 
i 10.99373 309.1026 0.7171673 68 70.00537 0 0.6016095 0 0 4095 1 
i 11.17776 309.1026 0.7171673 68 70.30725 0 0.6108467 0 0 4095 1 
i 11.30045 309.1026 0.7171673 67 70.50851 0 0.6170049 0 0 4095 1 
i 11.3618 309.1026 0.7171673 64 70.60914 0 0.620084 0 0 4095 1 
i 12.0366 309.1026 0.7171673 78 71.71606 0 0.6539538 0 0 4095 1 
i 12.09794 309.1026 0.7171673 77 71.81669 0 0.6570329 0 0 4095 1 
i 12.22063 309.1026 0.7171673 83 72.01795 0 0.663191 0 0 4095 1 
i 12.40467 309.1026 0.7171673 83 72.31983 0 0.6724283 0 0 4095 1 
i 15.09829 309.1026 0.7171673 76 70.00537 0 0.8076277 0 0 4095 1 
i 15.28233 309.1026 0.7171673 80 70.30725 0 0.8168649 0 0 4095 1 
i 15.40502 309.1026 0.7171673 79 70.50851 0 0.8230231 0 0 4095 1 
i 15.46636 309.1026 0.7171673 76 70.60914 0 0.8261022 0 0 4095 1 
i 16.14116 309.1026 0.7171673 90 71.71606 0 0.859972 0 0 4095 1 
i 16.20251 309.1026 0.7171673 89 71.81669 0 0.8630511 0 0 4095 1 
i 16.3252 309.1026 0.7171673 90 72.01795 0 0.8692092 0 0 4095 1 
i 16.50924 309.1026 0.7171673 95 72.31983 0 0.8784465 0 0 4095 1 
i 1 309.7009 0.5378755 54 70.01342 0 0.1 0 0 4095 1 
i 1.184036 309.7009 0.5378755 54 70.3153 0 0.1092372 0 0 4095 1 
i 1.552109 309.7009 0.5378755 62 70.91908 0 0.1277117 0 0 4095 1 
i 1.613454 309.7009 0.5378755 60 71.01971 0 0.1307908 0 0 4095 1 
i 5.104566 309.7009 0.5378755 66 70.01342 0 0.3060182 0 0 4095 1 
i 5.288602 309.7009 0.5378755 66 70.3153 0 0.3152554 0 0 4095 1 
i 5.656675 309.7009 0.5378755 74 70.91908 0 0.3337299 0 0 4095 1 
i 5.71802 309.7009 0.5378755 72 71.01971 0 0.336809 0 0 4095 1 
i 9.209132 309.7009 0.5378755 78 70.01342 0 0.5120364 0 0 4095 1 
i 9.393168 309.7009 0.5378755 78 70.3153 0 0.5212736 0 0 4095 1 
i 9.761241 309.7009 0.5378755 81 70.91908 0 0.5397481 0 0 4095 1 
i 9.822586 309.7009 0.5378755 84 71.01971 0 0.5428272 0 0 4095 1 
i 13.3137 309.7009 0.5378755 90 70.01342 0 0.7180546 0 0 4095 1 
i 13.49773 309.7009 0.5378755 90 70.3153 0 0.7272918 0 0 4095 1 
i 13.86581 309.7009 0.5378755 93 70.91908 0 0.7457663 0 0 4095 1 
i 13.92715 309.7009 1.437764 96 71.01971 0 0.7488453 0 0 4095 1 
i 2.784594 311.1387 0.7171673 46 70.0047 0 0.1895731 0 0 4095 1 
i 4.256884 311.1387 0.7171673 59 72.41979 0 0.263471 0 0 4095 1 
i 6.88916 311.1387 0.7171673 58 70.0047 0 0.3955913 0 0 4095 1 
i 8.36145 311.1387 0.7171673 66 72.41979 0 0.4694892 0 0 4095 1 
i 10.99373 311.1387 0.7171673 70 70.0047 0 0.6016095 0 0 4095 1 
i 12.46602 311.1387 0.7171673 78 72.41979 0 0.6755073 0 0 4095 1 
i 15.09829 311.1387 0.7171673 82 70.0047 0 0.8076277 0 0 4095 1 
i 16.57058 311.1387 0.7171673 90 72.41979 0 0.8815255 0 0 4095 1 
i 1 311.4691 0.5378755 59 70.01275 0 0.1 0 0 4095 1 
i 1.736145 311.4691 0.5378755 63 71.22029 0 0.1369489 0 0 4095 1 
i 5.104566 311.4691 0.5378755 68 70.01275 0 0.3060182 0 0 4095 1 
i 5.840711 311.4691 0.5378755 75 71.22029 0 0.3429671 0 0 4095 1 
i 9.209132 311.4691 0.5378755 80 70.01275 0 0.5120364 0 0 4095 1 
i 9.945277 311.4691 0.5378755 87 71.22029 0 0.5489853 0 0 4095 1 
i 13.3137 311.4691 0.5378755 92 70.01275 0 0.7180546 0 0 4095 1 
i 14.04984 311.4691 1.205504 99 71.22029 0 0.7550035 0 0 4095 1 
i 2.784594 312.6746 0.7171673 50 70.00403 0 0.1895731 0 0 4095 1 
i 3.336703 312.6746 0.7171673 43 70.90969 0 0.2172848 0 0 4095 1 
i 3.827466 312.6746 0.7171673 53 71.71472 0 0.2419174 0 0 4095 1 
i 4.256884 312.6746 0.7171673 59 72.41912 0 0.263471 0 0 4095 1 
i 6.88916 312.6746 0.7171673 59 70.00403 0 0.3955913 0 0 4095 1 
i 7.441269 312.6746 0.7171673 55 70.90969 0 0.423303 0 0 4095 1 
i 7.932032 312.6746 0.7171673 65 71.71472 0 0.4479356 0 0 4095 1 
i 8.36145 312.6746 0.7171673 71 72.41912 0 0.4694892 0 0 4095 1 
i 10.99373 312.6746 0.7171673 71 70.00403 0 0.6016095 0 0 4095 1 
i 11.54583 312.6746 0.7171673 67 70.90969 0 0.6293212 0 0 4095 1 
i 12.0366 312.6746 0.7171673 72 71.71472 0 0.6539538 0 0 4095 1 
i 12.46602 312.6746 0.7171673 78 72.41912 0 0.6755073 0 0 4095 1 
i 15.09829 312.6746 0.7171673 83 70.00403 0 0.8076277 0 0 4095 1 
i 15.6504 312.6746 0.7171673 74 70.90969 0 0.8353394 0 0 4095 1 
i 16.14116 312.6746 0.7171673 84 71.71472 0 0.859972 0 0 4095 1 
i 16.57058 312.6746 0.7171673 90 72.41912 0 0.8815255 0 0 4095 1 
i 1 313.005 0.5378755 56 70.01208 0 0.1 0 0 4095 1 
i 1.306727 313.005 0.5378755 54 70.51522 0 0.1153954 0 0 4095 1 
i 1.552109 313.005 0.5378755 56 70.91774 0 0.1277117 0 0 4095 1 
i 1.736145 313.005 0.5378755 63 71.21962 0 0.1369489 0 0 4095 1 
i 5.104566 313.005 0.5378755 68 70.01208 0 0.3060182 0 0 4095 1 
i 5.411293 313.005 0.5378755 66 70.51522 0 0.3214136 0 0 4095 1 
i 5.656675 313.005 0.5378755 68 70.91774 0 0.3337299 0 0 4095 1 
i 5.840711 313.005 0.5378755 75 71.21962 0 0.3429671 0 0 4095 1 
i 9.209132 313.005 0.5378755 80 70.01208 0 0.5120364 0 0 4095 1 
i 9.515859 313.005 0.5378755 78 70.51522 0 0.5274318 0 0 4095 1 
i 9.761241 313.005 0.5378755 80 70.91774 0 0.5397481 0 0 4095 1 
i 9.945277 313.005 0.5378755 84 71.21962 0 0.5489853 0 0 4095 1 
i 13.3137 313.005 0.5378755 92 70.01208 0 0.7180546 0 0 4095 1 
i 13.62043 313.005 0.5378755 90 70.51522 0 0.73345 0 0 4095 1 
i 13.86581 313.005 0.5378755 92 70.91774 0 0.7457663 0 0 4095 1 
i 14.04984 313.005 0.9567052 96 71.21962 0 0.7550035 0 0 4095 1 
i 2.784594 313.9617 0.5378755 51 70.0208 0 0.1895731 0 0 4095 1 
i 6.88916 313.9617 0.5378755 63 70.0208 0 0.3955913 0 0 4095 1 
i 10.99373 313.9617 0.5378755 75 70.0208 0 0.6016095 0 0 4095 1 
i 15.09829 313.9617 0.5378755 87 70.0208 0 0.8076277 0 0 4095 1 
i 2.784594 314.248 0.7171673 44 70.00335 0 0.1895731 0 0 4095 1 
i 3.398048 314.248 0.7171673 43 71.00964 0 0.2203639 0 0 4095 1 
i 3.888811 314.248 0.7171673 53 71.81468 0 0.2449965 0 0 4095 1 
i 4.256884 314.248 0.7171673 57 72.41845 0 0.263471 0 0 4095 1 
i 6.88916 314.248 0.7171673 56 70.00335 0 0.3955913 0 0 4095 1 
i 7.502614 314.248 0.7171673 55 71.00964 0 0.4263821 0 0 4095 1 
i 7.993377 314.248 0.7171673 60 71.81468 0 0.4510147 0 0 4095 1 
i 8.36145 314.248 0.7171673 69 72.41845 0 0.4694892 0 0 4095 1 
i 10.99373 314.248 0.7171673 68 70.00335 0 0.6016095 0 0 4095 1 
i 11.60718 314.248 0.7171673 62 71.00964 0 0.6324003 0 0 4095 1 
i 12.09794 314.248 0.7171673 72 71.81468 0 0.6570329 0 0 4095 1 
i 12.46602 314.248 0.7171673 81 72.41845 0 0.6755073 0 0 4095 1 
i 15.09829 314.248 0.7171673 80 70.00335 0 0.8076277 0 0 4095 1 
i 15.71175 314.248 0.7171673 74 71.00964 0 0.8384185 0 0 4095 1 
i 16.20251 314.248 0.7171673 84 71.81468 0 0.8630511 0 0 4095 1 
i 16.57058 314.248 0.7171673 93 72.41845 0 0.8815255 0 0 4095 1 
i 1 314.5784 0.5378755 57 70.0114 0 0.1 0 0 4095 1 
i 1.368072 314.5784 0.5378755 54 70.61518 0 0.1184745 0 0 4095 1 
i 1.613454 314.5784 0.5378755 60 71.01769 0 0.1307908 0 0 4095 1 
i 1.736145 314.5784 0.5378755 62 71.21895 0 0.1369489 0 0 4095 1 
i 5.104566 314.5784 0.5378755 69 70.0114 0 0.3060182 0 0 4095 1 
i 5.472639 314.5784 0.5378755 66 70.61518 0 0.3244927 0 0 4095 1 
i 5.71802 314.5784 0.5378755 68 71.01769 0 0.336809 0 0 4095 1 
i 5.840711 314.5784 0.5378755 74 71.21895 0 0.3429671 0 0 4095 1 
i 9.209132 314.5784 0.5378755 81 70.0114 0 0.5120364 0 0 4095 1 
i 9.577205 314.5784 0.5378755 78 70.61518 0 0.5305108 0 0 4095 1 
i 9.822586 314.5784 0.5378755 80 71.01769 0 0.5428272 0 0 4095 1 
i 9.945277 314.5784 0.5378755 86 71.21895 0 0.5489853 0 0 4095 1 
i 13.3137 314.5784 0.5378755 93 70.0114 0 0.7180546 0 0 4095 1 
i 13.68177 314.5784 0.5378755 90 70.61518 0 0.736529 0 0 4095 1 
i 13.92715 314.5784 0.5378755 92 71.01769 0 0.7488453 0 0 4095 1 
i 14.04984 314.5784 1.076675 98 71.21895 0 0.7550035 0 0 4095 1 
i 2.784594 315.6551 0.5378755 44 70.02013 0 0.1895731 0 0 4095 1 
i 6.88916 315.6551 0.5378755 56 70.02013 0 0.3955913 0 0 4095 1 
i 10.99373 315.6551 0.5378755 68 70.02013 0 0.6016095 0 0 4095 1 
i 15.09829 315.6551 0.5378755 80 70.02013 0 0.8076277 0 0 4095 1 
i 2.784594 315.7108 0.7171673 50 70.00268 0 0.1895731 0 0 4095 1 
i 2.96863 315.7108 0.7171673 50 70.30457 0 0.1988104 0 0 4095 1 
i 3.336703 315.7108 0.7171673 43 70.90834 0 0.2172848 0 0 4095 1 
i 3.398048 315.7108 0.7171673 40 71.00897 0 0.2203639 0 0 4095 1 
i 3.827466 315.7108 0.7171673 53 71.71338 0 0.2419174 0 0 4095 1 
i 3.888811 315.7108 0.7171673 50 71.814 0 0.2449965 0 0 4095 1 
i 4.256884 315.7108 0.7171673 59 72.41778 0 0.263471 0 0 4095 1 
i 4.44092 315.7108 0.7171673 59 72.71966 0 0.2727082 0 0 4095 1 
i 6.88916 315.7108 0.7171673 62 70.00268 0 0.3955913 0 0 4095 1 
i 7.073196 315.7108 0.7171673 62 70.30457 0 0.4048286 0 0 4095 1 
i 7.441269 315.7108 0.7171673 55 70.90834 0 0.423303 0 0 4095 1 
i 7.502614 315.7108 0.7171673 52 71.00897 0 0.4263821 0 0 4095 1 
i 7.932032 315.7108 0.7171673 65 71.71338 0 0.4479356 0 0 4095 1 
i 7.993377 315.7108 0.7171673 62 71.814 0 0.4510147 0 0 4095 1 
i 8.36145 315.7108 0.7171673 71 72.41778 0 0.4694892 0 0 4095 1 
i 8.545486 315.7108 0.7171673 71 72.71966 0 0.4787264 0 0 4095 1 
i 10.99373 315.7108 0.7171673 70 70.00268 0 0.6016095 0 0 4095 1 
i 11.17776 315.7108 0.7171673 74 70.30457 0 0.6108467 0 0 4095 1 
i 11.54583 315.7108 0.7171673 67 70.90834 0 0.6293212 0 0 4095 1 
i 11.60718 315.7108 0.7171673 64 71.00897 0 0.6324003 0 0 4095 1 
i 12.0366 315.7108 0.7171673 77 71.71338 0 0.6539538 0 0 4095 1 
i 12.09794 315.7108 0.7171673 74 71.814 0 0.6570329 0 0 4095 1 
i 12.46602 315.7108 0.7171673 78 72.41778 0 0.6755073 0 0 4095 1 
i 12.65005 315.7108 0.7171673 83 72.71966 0 0.6847446 0 0 4095 1 
i 15.09829 315.7108 0.7171673 82 70.00268 0 0.8076277 0 0 4095 1 
i 15.28233 315.7108 0.7171673 86 70.30457 0 0.8168649 0 0 4095 1 
i 15.6504 315.7108 0.7171673 79 70.90834 0 0.8353394 0 0 4095 1 
i 15.71175 315.7108 0.7171673 76 71.00897 0 0.8384185 0 0 4095 1 
i 16.14116 315.7108 0.7171673 84 71.71338 0 0.859972 0 0 4095 1 
i 16.20251 315.7108 0.7171673 86 71.814 0 0.8630511 0 0 4095 1 
i 16.57058 315.7108 0.7171673 90 72.41778 0 0.8815255 0 0 4095 1 
i 16.75462 315.7108 0.7171673 95 72.71966 0 0.8907628 0 0 4095 1 
i 1 316.0412 0.5378755 59 70.01073 0 0.1 0 0 4095 1 
i 1.184036 316.0412 0.5378755 59 70.31262 0 0.1092372 0 0 4095 1 
i 1.306727 316.0412 0.5378755 57 70.51388 0 0.1153954 0 0 4095 1 
i 1.368072 316.0412 0.5378755 56 70.61451 0 0.1184745 0 0 4095 1 
i 1.552109 316.0412 0.5378755 63 70.91639 0 0.1277117 0 0 4095 1 
i 1.613454 316.0412 0.5378755 62 71.01702 0 0.1307908 0 0 4095 1 
i 1.736145 316.0412 0.5378755 63 71.21828 0 0.1369489 0 0 4095 1 
i 1.920181 316.0412 0.5378755 63 71.52017 0 0.1461861 0 0 4095 1 
i 5.104566 316.0412 0.5378755 71 70.01073 0 0.3060182 0 0 4095 1 
i 5.288602 316.0412 0.5378755 71 70.31262 0 0.3152554 0 0 4095 1 
i 5.411293 316.0412 0.5378755 69 70.51388 0 0.3214136 0 0 4095 1 
i 5.472639 316.0412 0.5378755 68 70.61451 0 0.3244927 0 0 4095 1 
i 5.656675 316.0412 0.5378755 75 70.91639 0 0.3337299 0 0 4095 1 
i 5.71802 316.0412 0.5378755 74 71.01702 0 0.336809 0 0 4095 1 
i 5.840711 316.0412 0.5378755 75 71.21828 0 0.3429671 0 0 4095 1 
i 6.024747 316.0412 0.5378755 75 71.52017 0 0.3522043 0 0 4095 1 
i 9.209132 316.0412 0.5378755 80 70.01073 0 0.5120364 0 0 4095 1 
i 9.393168 316.0412 0.5378755 83 70.31262 0 0.5212736 0 0 4095 1 
i 9.515859 316.0412 0.5378755 81 70.51388 0 0.5274318 0 0 4095 1 
i 9.577205 316.0412 0.5378755 80 70.61451 0 0.5305108 0 0 4095 1 
i 9.761241 316.0412 0.5378755 87 70.91639 0 0.5397481 0 0 4095 1 
i 9.822586 316.0412 0.5378755 81 71.01702 0 0.5428272 0 0 4095 1 
i 9.945277 316.0412 0.5378755 87 71.21828 0 0.5489853 0 0 4095 1 
i 10.12931 316.0412 0.5378755 87 71.52017 0 0.5582225 0 0 4095 1 
i 13.3137 316.0412 0.5378755 92 70.01073 0 0.7180546 0 0 4095 1 
i 13.49773 316.0412 0.5378755 95 70.31262 0 0.7272918 0 0 4095 1 
i 13.62043 316.0412 0.5378755 93 70.51388 0 0.73345 0 0 4095 1 
i 13.68177 316.0412 0.5378755 92 70.61451 0 0.736529 0 0 4095 1 
i 13.86581 316.0412 0.5378755 99 70.91639 0 0.7457663 0 0 4095 1 
i 13.92715 316.0412 0.5378755 93 71.01702 0 0.7488453 0 0 4095 1 
i 14.04984 316.0412 0.5378755 99 71.21828 0 0.7550035 0 0 4095 1 
i 14.23388 316.0412 1.348546 99 71.52017 0 0.7642407 0 0 4095 1 
i 2.784594 317.3897 0.5378755 45 70.01945 0 0.1895731 0 0 4095 1 
i 6.88916 317.3897 0.7221871 57 70.01945 0 0.3955913 0 0 4095 1 
i 10.99373 317.3897 0.5378755 69 70.01945 0 0.6016095 0 0 4095 1 
i 15.09829 317.3897 0.7221871 81 70.01945 0 0.8076277 0 0 4095 1 
i 2.784594 317.3947 0.7171673 47 70.00201 0 0.1895731 0 0 4095 1 
i 3.520739 317.3947 0.7171673 43 71.20956 0 0.226522 0 0 4095 1 
i 4.011502 317.3947 0.7171673 53 72.01459 0 0.2511547 0 0 4095 1 
i 4.256884 317.3947 0.7171673 54 72.41711 0 0.263471 0 0 4095 1 
i 7.625305 317.3947 0.7171673 55 71.20956 0 0.4325402 0 0 4095 1 
i 8.116068 317.3947 0.7171673 60 72.01459 0 0.4571728 0 0 4095 1 
i 8.36145 317.3947 0.7171673 66 72.41711 0 0.4694892 0 0 4095 1 
i 10.99373 317.3947 0.7171673 71 70.00201 0 0.6016095 0 0 4095 1 
i 11.72987 317.3947 0.7171673 62 71.20956 0 0.6385584 0 0 4095 1 
i 12.22063 317.3947 0.7171673 72 72.01459 0 0.663191 0 0 4095 1 
i 12.46602 317.3947 0.7171673 78 72.41711 0 0.6755073 0 0 4095 1 
i 15.83444 317.3947 0.7171673 74 71.20956 0 0.8445766 0 0 4095 1 
i 16.3252 317.3947 0.7171673 84 72.01459 0 0.8692092 0 0 4095 1 
i 16.57058 317.3947 1.382696 90 72.41711 0 0.8815255 0 0 4095 1 
i 1 318.7774 0.5378755 52 70.01006 0 0.1 0 0 4095 1 
i 5.104566 318.7774 0.5378755 64 70.01006 0 0.3060182 0 0 4095 1 
i 9.209132 318.7774 0.5378755 76 70.01006 0 0.5120364 0 0 4095 1 
i 13.3137 318.7774 0.5378755 88 70.01006 0 0.7180546 0 0 4095 1 
i 2.784594 318.8575 0.7171673 44 70.00134 0 0.1895731 0 0 4095 1 
i 3.091321 318.8575 0.7171673 50 70.50449 0 0.2049685 0 0 4095 1 
i 3.336703 318.8575 0.7171673 44 70.907 0 0.2172848 0 0 4095 1 
i 3.520739 318.8575 0.7171673 40 71.20889 0 0.226522 0 0 4095 1 
i 3.827466 318.8575 0.7171673 54 71.71203 0 0.2419174 0 0 4095 1 
i 4.011502 318.8575 0.7171673 50 72.01392 0 0.2511547 0 0 4095 1 
i 4.256884 318.8575 0.7171673 56 72.41644 0 0.263471 0 0 4095 1 
i 4.563611 318.8575 0.7171673 59 72.91958 0 0.2788663 0 0 4095 1 
i 6.88916 318.8575 0.7171673 56 70.00134 0 0.3955913 0 0 4095 1 
i 7.195887 318.8575 0.7171673 62 70.50449 0 0.4109867 0 0 4095 1 
i 7.441269 318.8575 0.7171673 56 70.907 0 0.423303 0 0 4095 1 
i 7.625305 318.8575 0.7171673 52 71.20889 0 0.4325402 0 0 4095 1 
i 7.932032 318.8575 0.7171673 66 71.71203 0 0.4479356 0 0 4095 1 
i 8.116068 318.8575 0.7171673 62 72.01392 0 0.4571728 0 0 4095 1 
i 8.36145 318.8575 0.7171673 68 72.41644 0 0.4694892 0 0 4095 1 
i 8.668177 318.8575 0.7171673 71 72.91958 0 0.4848845 0 0 4095 1 
i 10.99373 318.8575 0.7171673 68 70.00134 0 0.6016095 0 0 4095 1 
i 11.30045 318.8575 0.7171673 74 70.50449 0 0.6170049 0 0 4095 1 
i 11.54583 318.8575 0.7171673 68 70.907 0 0.6293212 0 0 4095 1 
i 11.72987 318.8575 0.7171673 64 71.20889 0 0.6385584 0 0 4095 1 
i 12.0366 318.8575 0.7171673 78 71.71203 0 0.6539538 0 0 4095 1 
i 12.22063 318.8575 0.7171673 74 72.01392 0 0.663191 0 0 4095 1 
i 12.46602 318.8575 0.7171673 77 72.41644 0 0.6755073 0 0 4095 1 
i 12.77274 318.8575 0.7171673 83 72.91958 0 0.6909027 0 0 4095 1 
i 15.09829 318.8575 0.7171673 80 70.00134 0 0.8076277 0 0 4095 1 
i 15.40502 318.8575 0.7171673 86 70.50449 0 0.8230231 0 0 4095 1 
i 15.6504 318.8575 0.7171673 80 70.907 0 0.8353394 0 0 4095 1 
i 15.83444 318.8575 0.7171673 76 71.20889 0 0.8445766 0 0 4095 1 
i 16.14116 318.8575 0.7171673 86 71.71203 0 0.859972 0 0 4095 1 
i 16.3252 318.8575 0.7171673 86 72.01392 0 0.8692092 0 0 4095 1 
i 16.57058 318.8575 0.7171673 89 72.41644 0 0.8815255 0 0 4095 1 
i 16.87731 318.8575 0.7171673 95 72.91958 0 0.8969209 0 0 4095 1 
i 2.784594 319.0024 0.5378755 56 70.01878 0 0.1895731 0 0 4095 1 
i 2.96863 319.0024 0.5378755 56 70.32067 0 0.1988104 0 0 4095 1 
i 6.88916 319.0024 0.5378755 68 70.01878 0 0.3955913 0 0 4095 1 
i 7.073196 319.0024 0.5378755 68 70.32067 0 0.4048286 0 0 4095 1 
i 10.99373 319.0024 0.5378755 75 70.01878 0 0.6016095 0 0 4095 1 
i 11.17776 319.0024 0.5378755 80 70.32067 0 0.6108467 0 0 4095 1 
i 15.09829 319.0024 0.5378755 87 70.01878 0 0.8076277 0 0 4095 1 
i 15.28233 319.0024 1.353537 92 70.32067 0 0.8168649 0 0 4095 1 
i 2.784594 320.356 0.7171673 46 70.00067 0 0.1895731 0 0 4095 1 
i 3.152666 320.356 0.7171673 50 70.60444 0 0.2080476 0 0 4095 1 
i 3.398048 320.356 0.7171673 44 71.00696 0 0.2203639 0 0 4095 1 
i 3.520739 320.356 0.7171673 43 71.20822 0 0.226522 0 0 4095 1 
i 3.888811 320.356 0.7171673 54 71.81199 0 0.2449965 0 0 4095 1 
i 4.011502 320.356 0.7171673 53 72.01325 0 0.2511547 0 0 4095 1 
i 4.256884 320.356 0.7171673 54 72.41577 0 0.263471 0 0 4095 1 
i 4.624956 320.356 0.7171673 59 73.01954 0 0.2819454 0 0 4095 1 
i 6.88916 320.356 0.7171673 58 70.00067 0 0.3955913 0 0 4095 1 
i 7.257232 320.356 0.7171673 62 70.60444 0 0.4140658 0 0 4095 1 
i 7.502614 320.356 0.7171673 56 71.00696 0 0.4263821 0 0 4095 1 
i 7.625305 320.356 0.7171673 55 71.20822 0 0.4325402 0 0 4095 1 
i 7.993377 320.356 0.7171673 66 71.81199 0 0.4510147 0 0 4095 1 
i 8.116068 320.356 0.7171673 65 72.01325 0 0.4571728 0 0 4095 1 
i 8.36145 320.356 0.7171673 66 72.41577 0 0.4694892 0 0 4095 1 
i 8.729522 320.356 0.7171673 71 73.01954 0 0.4879636 0 0 4095 1 
i 10.99373 320.356 0.7171673 70 70.00067 0 0.6016095 0 0 4095 1 
i 11.3618 320.356 0.7171673 74 70.60444 0 0.620084 0 0 4095 1 
i 11.60718 320.356 0.7171673 68 71.00696 0 0.6324003 0 0 4095 1 
i 11.72987 320.356 0.7171673 67 71.20822 0 0.6385584 0 0 4095 1 
i 12.09794 320.356 0.7171673 78 71.81199 0 0.6570329 0 0 4095 1 
i 12.22063 320.356 0.7171673 77 72.01325 0 0.663191 0 0 4095 1 
i 12.46602 320.356 0.7171673 78 72.41577 0 0.6755073 0 0 4095 1 
i 12.83409 320.356 0.7171673 83 73.01954 0 0.6939818 0 0 4095 1 
i 15.09829 320.356 0.7171673 82 70.00067 0 0.8076277 0 0 4095 1 
i 15.46636 320.356 0.7171673 86 70.60444 0 0.8261022 0 0 4095 1 
i 15.71175 320.356 0.7171673 80 71.00696 0 0.8384185 0 0 4095 1 
i 15.83444 320.356 0.7171673 79 71.20822 0 0.8445766 0 0 4095 1 
i 16.20251 320.356 0.7171673 86 71.81199 0 0.8630511 0 0 4095 1 
i 16.3252 320.356 0.7171673 84 72.01325 0 0.8692092 0 0 4095 1 
i 16.57058 320.356 0.7171673 90 72.41577 0 0.8815255 0 0 4095 1 
i 16.93865 320.356 0.7171673 95 73.01954 0 0.9 0 0 4095 1 
i 1 320.3901 0.5378755 49 70.00939 0 0.1 0 0 4095 1 
i 2.042872 320.3901 0.5378755 64 71.72008 0 0.1523443 0 0 4095 1 
i 5.104566 320.3901 0.5378755 61 70.00939 0 0.3060182 0 0 4095 1 
i 6.147438 320.3901 0.5378755 76 71.72008 0 0.3583625 0 0 4095 1 
i 9.209132 320.3901 0.5378755 73 70.00939 0 0.5120364 0 0 4095 1 
i 10.252 320.3901 0.5378755 83 71.72008 0 0.5643807 0 0 4095 1 
i 13.3137 320.3901 0.5378755 85 70.00939 0 0.7180546 0 0 4095 1 
i 14.35657 320.3901 0.5378755 95 71.72008 0 0.7703989 0 0 4095 1 
i 2.784594 320.859 0.5378755 39 70.01811 0 0.1895731 0 0 4095 1 
i 6.88916 320.859 0.5378755 51 70.01811 0 0.3955913 0 0 4095 1 
i 10.99373 320.859 0.5378755 63 70.01811 0 0.6016095 0 0 4095 1 
i 15.09829 320.859 0.8900738 75 70.01811 0 0.8076277 0 0 4095 1 
i 2.784594 321.7491 0.7171673 47 70 0 0.1895731 0 0 4095 1 
i 2.96863 321.7491 0.7171673 47 70.30189 0 0.1988104 0 0 4095 1 
i 3.091321 321.7491 0.7171673 49 70.50314 0 0.2049685 0 0 4095 1 
i 3.152666 321.7491 0.7171673 50 70.60377 0 0.2080476 0 0 4095 1 
i 3.336703 321.7491 0.7171673 43 70.90566 0 0.2172848 0 0 4095 1 
i 3.398048 321.7491 0.7171673 44 71.00629 0 0.2203639 0 0 4095 1 
i 3.520739 321.7491 0.7171673 43 71.20755 0 0.226522 0 0 4095 1 
i 3.704775 321.7491 0.7171673 43 71.50943 0 0.2357593 0 0 4095 1 
i 3.827466 321.7491 0.7171673 53 71.71069 0 0.2419174 0 0 4095 1 
i 3.888811 321.7491 0.7171673 54 71.81132 0 0.2449965 0 0 4095 1 
i 4.011502 321.7491 0.7171673 53 72.01258 0 0.2511547 0 0 4095 1 
i 4.195539 321.7491 0.7171673 48 72.31447 0 0.2603919 0 0 4095 1 
i 4.256884 321.7491 0.7171673 54 72.41509 0 0.263471 0 0 4095 1 
i 4.44092 321.7491 0.7171673 54 72.71698 0 0.2727082 0 0 4095 1 
i 4.563611 321.7491 0.7171673 57 72.91824 0 0.2788663 0 0 4095 1 
i 4.624956 321.7491 0.7171673 59 73.01887 0 0.2819454 0 0 4095 1 
i 6.88916 321.7491 0.7171673 59 70 0 0.3955913 0 0 4095 1 
i 7.073196 321.7491 0.7171673 59 70.30189 0 0.4048286 0 0 4095 1 
i 7.195887 321.7491 0.7171673 56 70.50314 0 0.4109867 0 0 4095 1 
i 7.257232 321.7491 0.7171673 62 70.60377 0 0.4140658 0 0 4095 1 
i 7.441269 321.7491 0.7171673 55 70.90566 0 0.423303 0 0 4095 1 
i 7.502614 321.7491 0.7171673 56 71.00629 0 0.4263821 0 0 4095 1 
i 7.625305 321.7491 0.7171673 55 71.20755 0 0.4325402 0 0 4095 1 
i 7.809341 321.7491 0.7171673 50 71.50943 0 0.4417775 0 0 4095 1 
i 7.932032 321.7491 0.7171673 65 71.71069 0 0.4479356 0 0 4095 1 
i 7.993377 321.7491 0.7171673 66 71.81132 0 0.4510147 0 0 4095 1 
i 8.116068 321.7491 0.7171673 65 72.01258 0 0.4571728 0 0 4095 1 
i 8.300105 321.7491 0.7171673 60 72.31447 0 0.4664101 0 0 4095 1 
i 8.36145 321.7491 0.7171673 66 72.41509 0 0.4694892 0 0 4095 1 
i 8.545486 321.7491 0.7171673 66 72.71698 0 0.4787264 0 0 4095 1 
i 8.668177 321.7491 0.7171673 69 72.91824 0 0.4848845 0 0 4095 1 
i 8.729522 321.7491 0.7171673 71 73.01887 0 0.4879636 0 0 4095 1 
i 10.99373 321.7491 0.7171673 71 70 0 0.6016095 0 0 4095 1 
i 11.17776 321.7491 0.7171673 67 70.30189 0 0.6108467 0 0 4095 1 
i 11.30045 321.7491 0.7171673 68 70.50314 0 0.6170049 0 0 4095 1 
i 11.3618 321.7491 0.7171673 74 70.60377 0 0.620084 0 0 4095 1 
i 11.54583 321.7491 0.7171673 67 70.90566 0 0.6293212 0 0 4095 1 
i 11.60718 321.7491 0.7171673 68 71.00629 0 0.6324003 0 0 4095 1 
i 11.72987 321.7491 0.7171673 67 71.20755 0 0.6385584 0 0 4095 1 
i 11.91391 321.7491 0.7171673 62 71.50943 0 0.6477957 0 0 4095 1 
i 12.0366 321.7491 0.7171673 77 71.71069 0 0.6539538 0 0 4095 1 
i 12.09794 321.7491 0.7171673 78 71.81132 0 0.6570329 0 0 4095 1 
i 12.22063 321.7491 0.7171673 72 72.01258 0 0.663191 0 0 4095 1 
i 12.40467 321.7491 0.7171673 72 72.31447 0 0.6724283 0 0 4095 1 
i 12.46602 321.7491 0.7171673 78 72.41509 0 0.6755073 0 0 4095 1 
i 12.65005 321.7491 0.7171673 78 72.71698 0 0.6847446 0 0 4095 1 
i 12.77274 321.7491 0.7171673 81 72.91824 0 0.6909027 0 0 4095 1 
i 12.83409 321.7491 0.7171673 83 73.01887 0 0.6939818 0 0 4095 1 
i 15.09829 321.7491 0.7171673 83 70 0 0.8076277 0 0 4095 1 
i 15.28233 321.7491 0.7171673 79 70.30189 0 0.8168649 0 0 4095 1 
i 15.40502 321.7491 0.7171673 80 70.50314 0 0.8230231 0 0 4095 1 
i 15.46636 321.7491 0.7171673 83 70.60377 0 0.8261022 0 0 4095 1 
i 15.6504 321.7491 0.7171673 79 70.90566 0 0.8353394 0 0 4095 1 
i 15.71175 321.7491 0.7171673 80 71.00629 0 0.8384185 0 0 4095 1 
i 15.83444 321.7491 0.7171673 74 71.20755 0 0.8445766 0 0 4095 1 
i 16.01847 321.7491 0.7171673 74 71.50943 0 0.8538139 0 0 4095 1 
i 16.14116 321.7491 0.7171673 89 71.71069 0 0.859972 0 0 4095 1 
i 16.20251 321.7491 0.7171673 87 71.81132 0 0.8630511 0 0 4095 1 
i 16.3252 321.7491 0.7171673 84 72.01258 0 0.8692092 0 0 4095 1 
i 16.50924 321.7491 0.7171673 84 72.31447 0 0.8784465 0 0 4095 1 
i 16.57058 321.7491 0.7171673 90 72.41509 0 0.8815255 0 0 4095 1 
i 16.75462 321.7491 0.7171673 90 72.71698 0 0.8907628 0 0 4095 1 
i 16.87731 321.7491 0.7171673 93 72.91824 0 0.8969209 0 0 4095 1 
i 16.93865 321.7491 0.7171673 95 73.01887 0 0.9 0 0 4095 1 
i 1 322.0422 0.5378755 51 70.00872 0 0.1 0 0 4095 1 
i 2.104217 322.0422 0.5378755 64 71.82004 0 0.1554234 0 0 4095 1 
i 5.104566 322.0422 0.5378755 63 70.00872 0 0.3060182 0 0 4095 1 
i 6.208784 322.0422 0.5378755 76 71.82004 0 0.3614416 0 0 4095 1 
i 9.209132 322.0422 0.5378755 75 70.00872 0 0.5120364 0 0 4095 1 
i 10.31335 322.0422 0.5378755 88 71.82004 0 0.5674598 0 0 4095 1 
i 13.3137 322.0422 0.5378755 84 70.00872 0 0.7180546 0 0 4095 1 
i 14.41792 322.0422 0.5378755 100 71.82004 0 0.773478 0 0 4095 1 
i 2.784594 322.4717 0.5378755 53 70.01744 0 0.1895731 0 0 4095 1 
i 3.091321 322.4717 0.5378755 59 70.52059 0 0.2049685 0 0 4095 1 
i 6.88916 322.4717 0.5378755 65 70.01744 0 0.3955913 0 0 4095 1 
i 7.195887 322.4717 0.5378755 71 70.52059 0 0.4109867 0 0 4095 1 
i 10.99373 322.4717 0.5378755 77 70.01744 0 0.6016095 0 0 4095 1 
i 11.30045 322.4717 0.5378755 83 70.52059 0 0.6170049 0 0 4095 1 
i 15.09829 322.4717 0.5378755 89 70.01744 0 0.8076277 0 0 4095 1 
i 15.40502 322.4717 1.106382 92 70.52059 0 0.8230231 0 0 4095 1 
i 1 323.5781 0.5378755 52 70.00805 0 0.1 0 0 4095 1 
i 1.184036 323.5781 0.5378755 48 70.30994 0 0.1092372 0 0 4095 1 
i 2.042872 323.5781 0.5378755 62 71.71874 0 0.1523443 0 0 4095 1 
i 2.104217 323.5781 0.5378755 64 71.81937 0 0.1554234 0 0 4095 1 
i 5.104566 323.5781 0.5378755 60 70.00805 0 0.3060182 0 0 4095 1 
i 5.288602 323.5781 0.5378755 60 70.30994 0 0.3152554 0 0 4095 1 
i 6.147438 323.5781 0.5378755 74 71.71874 0 0.3583625 0 0 4095 1 
i 6.208784 323.5781 0.5378755 76 71.81937 0 0.3614416 0 0 4095 1 
i 9.209132 323.5781 0.5378755 72 70.00805 0 0.5120364 0 0 4095 1 
i 9.393168 323.5781 0.5378755 72 70.30994 0 0.5212736 0 0 4095 1 
i 10.252 323.5781 0.5378755 82 71.71874 0 0.5643807 0 0 4095 1 
i 10.31335 323.5781 0.5378755 88 71.81937 0 0.5674598 0 0 4095 1 
i 13.3137 323.5781 0.5378755 84 70.00805 0 0.7180546 0 0 4095 1 
i 13.49773 323.5781 0.5378755 79 70.30994 0 0.7272918 0 0 4095 1 
i 14.35657 323.5781 0.5378755 94 71.71874 0 0.7703989 0 0 4095 1 
i 14.41792 323.5781 0.5456611 100 71.81937 0 0.773478 0 0 4095 1 
i 2.784594 324.1237 0.5378755 44 70.01677 0 0.1895731 0 0 4095 1 
i 3.152666 324.1237 0.5378755 44 70.62055 0 0.2080476 0 0 4095 1 
i 6.88916 324.1237 0.5378755 56 70.01677 0 0.3955913 0 0 4095 1 
i 7.257232 324.1237 0.5378755 56 70.62055 0 0.4140658 0 0 4095 1 
i 10.99373 324.1237 0.5378755 68 70.01677 0 0.6016095 0 0 4095 1 
i 11.3618 324.1237 0.5378755 68 70.62055 0 0.620084 0 0 4095 1 
i 15.09829 324.1237 0.5378755 80 70.01677 0 0.8076277 0 0 4095 1 
i 15.46636 324.1237 1.222512 80 70.62055 0 0.8261022 0 0 4095 1 
i 1 325.3463 0.5378755 49 70.00738 0 0.1 0 0 4095 1 
i 2.226908 325.3463 0.5378755 64 72.01996 0 0.1615815 0 0 4095 1 
i 5.104566 325.3463 0.5378755 61 70.00738 0 0.3060182 0 0 4095 1 
i 6.331474 325.3463 0.5378755 76 72.01996 0 0.3675997 0 0 4095 1 
i 9.209132 325.3463 0.5378755 73 70.00738 0 0.5120364 0 0 4095 1 
i 10.43604 325.3463 0.5378755 88 72.01996 0 0.5736179 0 0 4095 1 
i 13.3137 325.3463 0.5378755 85 70.00738 0 0.7180546 0 0 4095 1 
i 14.54061 325.3463 0.5378755 100 72.01996 0 0.7796361 0 0 4095 1 
i 2.784594 325.6597 0.5378755 39 70.0161 0 0.1895731 0 0 4095 1 
i 2.96863 325.6597 0.5378755 39 70.31799 0 0.1988104 0 0 4095 1 
i 3.091321 325.6597 0.5378755 38 70.51925 0 0.2049685 0 0 4095 1 
i 3.152666 325.6597 0.5378755 36 70.61987 0 0.2080476 0 0 4095 1 
i 6.88916 325.6597 0.5378755 51 70.0161 0 0.3955913 0 0 4095 1 
i 7.073196 325.6597 0.5378755 51 70.31799 0 0.4048286 0 0 4095 1 
i 7.195887 325.6597 0.5378755 50 70.51925 0 0.4109867 0 0 4095 1 
i 7.257232 325.6597 0.5378755 48 70.61987 0 0.4140658 0 0 4095 1 
i 10.99373 325.6597 0.5378755 63 70.0161 0 0.6016095 0 0 4095 1 
i 11.17776 325.6597 0.5378755 63 70.31799 0 0.6108467 0 0 4095 1 
i 11.30045 325.6597 0.5378755 62 70.51925 0 0.6170049 0 0 4095 1 
i 11.3618 325.6597 0.5378755 56 70.61987 0 0.620084 0 0 4095 1 
i 15.09829 325.6597 0.5378755 75 70.0161 0 0.8076277 0 0 4095 1 
i 15.28233 325.6597 0.5378755 75 70.31799 0 0.8168649 0 0 4095 1 
i 15.40502 325.6597 0.5378755 74 70.51925 0 0.8230231 0 0 4095 1 
i 15.46636 325.6597 1.222512 68 70.61987 0 0.8261022 0 0 4095 1 
i 1 326.8822 0.5378755 49 70.00671 0 0.1 0 0 4095 1 
i 1.306727 326.8822 0.5378755 48 70.50985 0 0.1153954 0 0 4095 1 
i 2.042872 326.8822 0.5378755 59 71.7174 0 0.1523443 0 0 4095 1 
i 2.226908 326.8822 0.5378755 64 72.01929 0 0.1615815 0 0 4095 1 
i 5.104566 326.8822 0.5378755 61 70.00671 0 0.3060182 0 0 4095 1 
i 5.411293 326.8822 0.5378755 60 70.50985 0 0.3214136 0 0 4095 1 
i 6.147438 326.8822 0.5378755 71 71.7174 0 0.3583625 0 0 4095 1 
i 6.331474 326.8822 0.5378755 76 72.01929 0 0.3675997 0 0 4095 1 
i 9.209132 326.8822 0.5378755 73 70.00671 0 0.5120364 0 0 4095 1 
i 9.515859 326.8822 0.5378755 67 70.50985 0 0.5274318 0 0 4095 1 
i 10.252 326.8822 0.5378755 83 71.7174 0 0.5643807 0 0 4095 1 
i 10.43604 326.8822 0.5378755 88 72.01929 0 0.5736179 0 0 4095 1 
i 13.3137 326.8822 0.5378755 85 70.00671 0 0.7180546 0 0 4095 1 
i 13.62043 326.8822 0.5378755 79 70.50985 0 0.73345 0 0 4095 1 
i 14.35657 326.8822 0.5378755 95 71.7174 0 0.7703989 0 0 4095 1 
i 14.54061 326.8822 0.9154041 100 72.01929 0 0.7796361 0 0 4095 1 
i 2.784594 327.7976 0.5378755 50 70.01543 0 0.1895731 0 0 4095 1 
i 6.88916 327.7976 0.5378755 62 70.01543 0 0.3955913 0 0 4095 1 
i 10.99373 327.7976 0.5378755 74 70.01543 0 0.6016095 0 0 4095 1 
i 15.09829 327.7976 0.6579701 86 70.01543 0 0.8076277 0 0 4095 1 
i 1 328.4555 0.5378755 52 70.00604 0 0.1 0 0 4095 1 
i 1.368072 328.4555 0.5378755 48 70.60981 0 0.1184745 0 0 4095 1 
i 2.104217 328.4555 0.5378755 64 71.81736 0 0.1554234 0 0 4095 1 
i 2.226908 328.4555 0.5378755 62 72.01862 0 0.1615815 0 0 4095 1 
i 5.104566 328.4555 0.5378755 60 70.00604 0 0.3060182 0 0 4095 1 
i 5.472639 328.4555 0.5378755 55 70.60981 0 0.3244927 0 0 4095 1 
i 6.208784 328.4555 0.5378755 71 71.81736 0 0.3614416 0 0 4095 1 
i 6.331474 328.4555 0.5378755 74 72.01862 0 0.3675997 0 0 4095 1 
i 9.209132 328.4555 0.5378755 72 70.00604 0 0.5120364 0 0 4095 1 
i 9.577205 328.4555 0.5378755 67 70.60981 0 0.5305108 0 0 4095 1 
i 10.31335 328.4555 0.5378755 83 71.81736 0 0.5674598 0 0 4095 1 
i 10.43604 328.4555 0.5378755 86 72.01862 0 0.5736179 0 0 4095 1 
i 13.3137 328.4555 0.5378755 84 70.00604 0 0.7180546 0 0 4095 1 
i 13.68177 328.4555 0.5378755 79 70.60981 0 0.736529 0 0 4095 1 
i 14.41792 328.4555 0.5378755 95 71.81736 0 0.773478 0 0 4095 1 
i 14.54061 328.4555 0.9547384 98 72.01862 0 0.7796361 0 0 4095 1 
i 2.784594 329.4103 0.5378755 44 70.01476 0 0.1895731 0 0 4095 1 
i 3.336703 329.4103 0.5378755 32 70.92042 0 0.2172848 0 0 4095 1 
i 6.88916 329.4103 0.5378755 51 70.01476 0 0.3955913 0 0 4095 1 
i 7.441269 329.4103 0.5378755 39 70.92042 0 0.423303 0 0 4095 1 
i 10.99373 329.4103 0.5378755 63 70.01476 0 0.6016095 0 0 4095 1 
i 11.54583 329.4103 0.5378755 51 70.92042 0 0.6293212 0 0 4095 1 
i 15.09829 329.4103 0.5378755 75 70.01476 0 0.8076277 0 0 4095 1 
i 15.6504 329.4103 0.5378755 63 70.92042 0 0.8353394 0 0 4095 1 
i 1 329.9183 0.5378755 49 70.00537 0 0.1 0 0 4095 1 
i 1.184036 329.9183 0.5378755 49 70.30725 0 0.1092372 0 0 4095 1 
i 1.306727 329.9183 0.5378755 48 70.50851 0 0.1153954 0 0 4095 1 
i 1.368072 329.9183 0.5378755 49 70.60914 0 0.1184745 0 0 4095 1 
i 2.042872 329.9183 0.5378755 64 71.71606 0 0.1523443 0 0 4095 1 
i 2.104217 329.9183 0.5378755 61 71.81669 0 0.1554234 0 0 4095 1 
i 2.226908 329.9183 0.5378755 64 72.01795 0 0.1615815 0 0 4095 1 
i 2.410945 329.9183 0.5378755 64 72.31983 0 0.1708188 0 0 4095 1 
i 5.104566 329.9183 0.5378755 61 70.00537 0 0.3060182 0 0 4095 1 
i 5.288602 329.9183 0.5378755 61 70.30725 0 0.3152554 0 0 4095 1 
i 5.411293 329.9183 0.5378755 60 70.50851 0 0.3214136 0 0 4095 1 
i 5.472639 329.9183 0.5378755 57 70.60914 0 0.3244927 0 0 4095 1 
i 6.147438 329.9183 0.5378755 76 71.71606 0 0.3583625 0 0 4095 1 
i 6.208784 329.9183 0.5378755 73 71.81669 0 0.3614416 0 0 4095 1 
i 6.331474 329.9183 0.5378755 76 72.01795 0 0.3675997 0 0 4095 1 
i 6.515511 329.9183 0.5378755 76 72.31983 0 0.3768369 0 0 4095 1 
i 9.209132 329.9183 0.5378755 73 70.00537 0 0.5120364 0 0 4095 1 
i 9.393168 329.9183 0.5378755 73 70.30725 0 0.5212736 0 0 4095 1 
i 9.515859 329.9183 0.5378755 72 70.50851 0 0.5274318 0 0 4095 1 
i 9.577205 329.9183 0.5378755 69 70.60914 0 0.5305108 0 0 4095 1 
i 10.252 329.9183 0.5378755 88 71.71606 0 0.5643807 0 0 4095 1 
i 10.31335 329.9183 0.5378755 82 71.81669 0 0.5674598 0 0 4095 1 
i 10.43604 329.9183 0.5378755 88 72.01795 0 0.5736179 0 0 4095 1 
i 10.62008 329.9183 0.5378755 88 72.31983 0 0.5828551 0 0 4095 1 
i 13.3137 329.9183 0.5378755 85 70.00537 0 0.7180546 0 0 4095 1 
i 13.49773 329.9183 0.5378755 85 70.30725 0 0.7272918 0 0 4095 1 
i 13.62043 329.9183 0.5378755 79 70.50851 0 0.73345 0 0 4095 1 
i 13.68177 329.9183 0.5378755 81 70.60914 0 0.736529 0 0 4095 1 
i 14.35657 329.9183 0.5378755 100 71.71606 0 0.7703989 0 0 4095 1 
i 14.41792 329.9183 0.5378755 94 71.81669 0 0.773478 0 0 4095 1 
i 14.54061 329.9183 0.5378755 100 72.01795 0 0.7796361 0 0 4095 1 
i 14.72464 329.9183 1.144007 100 72.31983 0 0.7888733 0 0 4095 1 
i 2.784594 331.0623 0.5378755 53 70.01409 0 0.1895731 0 0 4095 1 
i 3.398048 331.0623 0.5378755 63 71.02038 0 0.2203639 0 0 4095 1 
i 6.88916 331.0623 0.5378755 65 70.01409 0 0.3955913 0 0 4095 1 
i 7.502614 331.0623 0.5378755 75 71.02038 0 0.4263821 0 0 4095 1 
i 10.99373 331.0623 0.5378755 74 70.01409 0 0.6016095 0 0 4095 1 
i 11.60718 331.0623 0.5378755 83 71.02038 0 0.6324003 0 0 4095 1 
i 15.09829 331.0623 0.5378755 86 70.01409 0 0.8076277 0 0 4095 1 
i 15.71175 331.0623 0.8921032 95 71.02038 0 0.8384185 0 0 4095 1 
i 1 331.9544 0.5378755 51 70.0047 0 0.1 0 0 4095 1 
i 2.47229 331.9544 0.5378755 64 72.41979 0 0.1738978 0 0 4095 1 
i 5.104566 331.9544 0.5378755 63 70.0047 0 0.3060182 0 0 4095 1 
i 6.576856 331.9544 0.5378755 76 72.41979 0 0.379916 0 0 4095 1 
i 9.209132 331.9544 0.5378755 75 70.0047 0 0.5120364 0 0 4095 1 
i 10.68142 331.9544 0.5378755 88 72.41979 0 0.5859342 0 0 4095 1 
i 13.3137 331.9544 0.5378755 87 70.0047 0 0.7180546 0 0 4095 1 
i 14.78599 331.9544 0.6438097 100 72.41979 0 0.7919524 0 0 4095 1 
i 2.784594 332.5982 0.5378755 50 70.01342 0 0.1895731 0 0 4095 1 
i 3.336703 332.5982 0.5378755 50 70.91908 0 0.2172848 0 0 4095 1 
i 6.88916 332.5982 0.5378755 62 70.01342 0 0.3955913 0 0 4095 1 
i 7.073196 332.5982 0.5378755 57 70.3153 0 0.4048286 0 0 4095 1 
i 7.441269 332.5982 0.5378755 62 70.91908 0 0.423303 0 0 4095 1 
i 10.99373 332.5982 0.5378755 69 70.01342 0 0.6016095 0 0 4095 1 
i 11.17776 332.5982 0.5378755 69 70.3153 0 0.6108467 0 0 4095 1 
i 11.54583 332.5982 0.5378755 74 70.91908 0 0.6293212 0 0 4095 1 
i 15.09829 332.5982 0.5378755 81 70.01342 0 0.8076277 0 0 4095 1 
i 15.28233 332.5982 0.5378755 81 70.3153 0 0.8168649 0 0 4095 1 
i 15.6504 332.5982 0.8921032 86 70.91908 0 0.8353394 0 0 4095 1 
i 1 333.4903 0.5378755 55 70.00403 0 0.1 0 0 4095 1 
i 1.552109 333.4903 0.5378755 48 70.90969 0 0.1277117 0 0 4095 1 
i 2.042872 333.4903 0.5378755 58 71.71472 0 0.1523443 0 0 4095 1 
i 2.47229 333.4903 0.5378755 64 72.41912 0 0.1738978 0 0 4095 1 
i 5.104566 333.4903 0.5378755 64 70.00403 0 0.3060182 0 0 4095 1 
i 5.656675 333.4903 0.5378755 60 70.90969 0 0.3337299 0 0 4095 1 
i 6.147438 333.4903 0.5378755 70 71.71472 0 0.3583625 0 0 4095 1 
i 6.576856 333.4903 0.5378755 76 72.41912 0 0.379916 0 0 4095 1 
i 9.209132 333.4903 0.5378755 76 70.00403 0 0.5120364 0 0 4095 1 
i 9.761241 333.4903 0.5378755 67 70.90969 0 0.5397481 0 0 4095 1 
i 10.252 333.4903 0.5378755 82 71.71472 0 0.5643807 0 0 4095 1 
i 10.68142 333.4903 0.5378755 88 72.41912 0 0.5859342 0 0 4095 1 
i 13.3137 333.4903 0.5378755 88 70.00403 0 0.7180546 0 0 4095 1 
i 13.86581 333.4903 0.5378755 79 70.90969 0 0.7457663 0 0 4095 1 
i 14.35657 333.4903 0.5378755 89 71.71472 0 0.7703989 0 0 4095 1 
i 14.78599 333.4903 0.8760697 100 72.41912 0 0.7919524 0 0 4095 1 
i 2.784594 334.3664 0.5378755 39 70.01275 0 0.1895731 0 0 4095 1 
i 3.520739 334.3664 0.5378755 32 71.22029 0 0.226522 0 0 4095 1 
i 6.88916 334.3664 0.5378755 51 70.01275 0 0.3955913 0 0 4095 1 
i 7.625305 334.3664 0.5378755 44 71.22029 0 0.4325402 0 0 4095 1 
i 10.99373 334.3664 0.5378755 63 70.01275 0 0.6016095 0 0 4095 1 
i 11.72987 334.3664 0.5378755 56 71.22029 0 0.6385584 0 0 4095 1 
i 15.09829 334.3664 0.5378755 75 70.01275 0 0.8076277 0 0 4095 1 
i 15.83444 334.3664 0.6973044 68 71.22029 0 0.8445766 0 0 4095 1 
i 1 335.0637 0.5378755 54 70.00335 0 0.1 0 0 4095 1 
i 1.613454 335.0637 0.5378755 48 71.00964 0 0.1307908 0 0 4095 1 
i 2.104217 335.0637 0.5378755 58 71.81468 0 0.1554234 0 0 4095 1 
i 2.47229 335.0637 0.5378755 62 72.41845 0 0.1738978 0 0 4095 1 
i 5.104566 335.0637 0.5378755 66 70.00335 0 0.3060182 0 0 4095 1 
i 5.71802 335.0637 0.5378755 55 71.00964 0 0.336809 0 0 4095 1 
i 6.208784 335.0637 0.5378755 70 71.81468 0 0.3614416 0 0 4095 1 
i 6.576856 335.0637 0.5378755 74 72.41845 0 0.379916 0 0 4095 1 
i 9.209132 335.0637 0.5378755 78 70.00335 0 0.5120364 0 0 4095 1 
i 9.822586 335.0637 0.5378755 67 71.00964 0 0.5428272 0 0 4095 1 
i 10.31335 335.0637 0.5378755 77 71.81468 0 0.5674598 0 0 4095 1 
i 10.68142 335.0637 0.5378755 86 72.41845 0 0.5859342 0 0 4095 1 
i 13.3137 335.0637 0.5378755 90 70.00335 0 0.7180546 0 0 4095 1 
i 13.92715 335.0637 0.5378755 79 71.00964 0 0.7488453 0 0 4095 1 
i 14.41792 335.0637 0.5378755 89 71.81468 0 0.773478 0 0 4095 1 
i 14.78599 335.0637 0.8386084 98 72.41845 0 0.7919524 0 0 4095 1 
i 2.784594 335.9023 0.5378755 56 70.01208 0 0.1895731 0 0 4095 1 
i 3.091321 335.9023 0.5378755 54 70.51522 0 0.2049685 0 0 4095 1 
i 3.336703 335.9023 0.5378755 63 70.91774 0 0.2172848 0 0 4095 1 
i 3.520739 335.9023 0.5378755 68 71.21962 0 0.226522 0 0 4095 1 
i 6.88916 335.9023 0.5378755 68 70.01208 0 0.3955913 0 0 4095 1 
i 7.195887 335.9023 0.5378755 66 70.51522 0 0.4109867 0 0 4095 1 
i 7.441269 335.9023 0.5378755 75 70.91774 0 0.423303 0 0 4095 1 
i 7.625305 335.9023 0.5378755 80 71.21962 0 0.4325402 0 0 4095 1 
i 10.99373 335.9023 0.5378755 80 70.01208 0 0.6016095 0 0 4095 1 
i 11.30045 335.9023 0.5378755 78 70.51522 0 0.6170049 0 0 4095 1 
i 11.54583 335.9023 0.5378755 84 70.91774 0 0.6293212 0 0 4095 1 
i 11.72987 335.9023 0.5378755 92 71.21962 0 0.6385584 0 0 4095 1 
i 15.09829 335.9023 0.5378755 92 70.01208 0 0.8076277 0 0 4095 1 
i 15.40502 335.9023 0.5378755 86 70.51522 0 0.8230231 0 0 4095 1 
i 15.6504 335.9023 0.5378755 96 70.91774 0 0.8353394 0 0 4095 1 
i 15.83444 335.9023 0.6241657 104 71.21962 0 0.8445766 0 0 4095 1 
i 1 336.5265 0.5378755 55 70.00268 0 0.1 0 0 4095 1 
i 1.184036 336.5265 0.5378755 55 70.30457 0 0.1092372 0 0 4095 1 
i 1.552109 336.5265 0.5378755 48 70.90834 0 0.1277117 0 0 4095 1 
i 1.613454 336.5265 0.5378755 49 71.00897 0 0.1307908 0 0 4095 1 
i 2.042872 336.5265 0.5378755 58 71.71338 0 0.1523443 0 0 4095 1 
i 2.104217 336.5265 0.5378755 55 71.814 0 0.1554234 0 0 4095 1 
i 2.47229 336.5265 0.5378755 64 72.41778 0 0.1738978 0 0 4095 1 
i 2.656326 336.5265 0.5378755 64 72.71966 0 0.1831351 0 0 4095 1 
i 5.104566 336.5265 0.5378755 63 70.00268 0 0.3060182 0 0 4095 1 
i 5.288602 336.5265 0.5378755 67 70.30457 0 0.3152554 0 0 4095 1 
i 5.656675 336.5265 0.5378755 60 70.90834 0 0.3337299 0 0 4095 1 
i 5.71802 336.5265 0.5378755 57 71.00897 0 0.336809 0 0 4095 1 
i 6.147438 336.5265 0.5378755 70 71.71338 0 0.3583625 0 0 4095 1 
i 6.208784 336.5265 0.5378755 67 71.814 0 0.3614416 0 0 4095 1 
i 6.576856 336.5265 0.5378755 76 72.41778 0 0.379916 0 0 4095 1 
i 6.760892 336.5265 0.5378755 76 72.71966 0 0.3891533 0 0 4095 1 
i 9.209132 336.5265 0.5378755 75 70.00268 0 0.5120364 0 0 4095 1 
i 9.393168 336.5265 0.5378755 79 70.30457 0 0.5212736 0 0 4095 1 
i 9.761241 336.5265 0.5378755 72 70.90834 0 0.5397481 0 0 4095 1 
i 9.822586 336.5265 0.5378755 69 71.00897 0 0.5428272 0 0 4095 1 
i 10.252 336.5265 0.5378755 82 71.71338 0 0.5643807 0 0 4095 1 
i 10.31335 336.5265 0.5378755 79 71.814 0 0.5674598 0 0 4095 1 
i 10.68142 336.5265 0.5378755 88 72.41778 0 0.5859342 0 0 4095 1 
i 10.86546 336.5265 0.5378755 88 72.71966 0 0.5951714 0 0 4095 1 
i 13.3137 336.5265 0.5378755 87 70.00268 0 0.7180546 0 0 4095 1 
i 13.49773 336.5265 0.5378755 87 70.30457 0 0.7272918 0 0 4095 1 
i 13.86581 336.5265 0.5378755 79 70.90834 0 0.7457663 0 0 4095 1 
i 13.92715 336.5265 0.5378755 81 71.00897 0 0.7488453 0 0 4095 1 
i 14.35657 336.5265 0.5378755 94 71.71338 0 0.7703989 0 0 4095 1 
i 14.41792 336.5265 0.5378755 91 71.814 0 0.773478 0 0 4095 1 
i 14.78599 336.5265 0.5378755 100 72.41778 0 0.7919524 0 0 4095 1 
i 14.97002 336.5265 0.9492084 100 72.71966 0 0.8011896 0 0 4095 1 
i 2.784594 337.4757 0.5378755 42 70.0114 0 0.1895731 0 0 4095 1 
i 3.152666 337.4757 0.5378755 45 70.61518 0 0.2080476 0 0 4095 1 
i 3.398048 337.4757 0.5378755 39 71.01769 0 0.2203639 0 0 4095 1 
i 3.520739 337.4757 0.5378755 38 71.21895 0 0.226522 0 0 4095 1 
i 6.88916 337.4757 0.5378755 54 70.0114 0 0.3955913 0 0 4095 1 
i 7.257232 337.4757 0.5378755 54 70.61518 0 0.4140658 0 0 4095 1 
i 7.502614 337.4757 0.5378755 51 71.01769 0 0.4263821 0 0 4095 1 
i 7.625305 337.4757 0.5378755 50 71.21895 0 0.4325402 0 0 4095 1 
i 10.99373 337.4757 0.5378755 66 70.0114 0 0.6016095 0 0 4095 1 
i 11.3618 337.4757 0.5378755 66 70.61518 0 0.620084 0 0 4095 1 
i 11.60718 337.4757 0.5378755 63 71.01769 0 0.6324003 0 0 4095 1 
i 11.72987 337.4757 0.5378755 57 71.21895 0 0.6385584 0 0 4095 1 
i 15.09829 337.4757 0.5378755 78 70.0114 0 0.8076277 0 0 4095 1 
i 15.46636 337.4757 0.5378755 78 70.61518 0 0.8261022 0 0 4095 1 
i 15.71175 337.4757 0.5378755 72 71.01769 0 0.8384185 0 0 4095 1 
i 15.83444 337.4757 0.7347657 69 71.21895 0 0.8445766 0 0 4095 1 
i 1 338.2105 0.5378755 52 70.00201 0 0.1 0 0 4095 1 
i 1.736145 338.2105 0.5378755 48 71.20956 0 0.1369489 0 0 4095 1 
i 2.226908 338.2105 0.5378755 58 72.01459 0 0.1615815 0 0 4095 1 
i 2.47229 338.2105 0.5378755 64 72.41711 0 0.1738978 0 0 4095 1 
i 5.104566 338.2105 0.5378755 64 70.00201 0 0.3060182 0 0 4095 1 
i 5.840711 338.2105 0.5378755 55 71.20956 0 0.3429671 0 0 4095 1 
i 6.331474 338.2105 0.5378755 70 72.01459 0 0.3675997 0 0 4095 1 
i 6.576856 338.2105 0.5378755 76 72.41711 0 0.379916 0 0 4095 1 
i 9.209132 338.2105 0.5378755 76 70.00201 0 0.5120364 0 0 4095 1 
i 9.945277 338.2105 0.5378755 67 71.20956 0 0.5489853 0 0 4095 1 
i 10.43604 338.2105 0.5378755 77 72.01459 0 0.5736179 0 0 4095 1 
i 10.68142 338.2105 0.5378755 88 72.41711 0 0.5859342 0 0 4095 1 
i 13.3137 338.2105 0.5378755 88 70.00201 0 0.7180546 0 0 4095 1 
i 14.04984 338.2105 0.5378755 79 71.20956 0 0.7550035 0 0 4095 1 
i 14.54061 338.2105 0.5378755 89 72.01459 0 0.7796361 0 0 4095 1 
i 14.78599 338.2105 0.7280084 95 72.41711 0 0.7919524 0 0 4095 1 
i 2.784594 338.9385 0.5378755 44 70.01073 0 0.1895731 0 0 4095 1 
i 2.96863 338.9385 0.5378755 39 70.31262 0 0.1988104 0 0 4095 1 
i 3.091321 338.9385 0.5378755 41 70.51388 0 0.2049685 0 0 4095 1 
i 3.152666 338.9385 0.5378755 44 70.61451 0 0.2080476 0 0 4095 1 
i 3.336703 338.9385 0.5378755 39 70.91639 0 0.2172848 0 0 4095 1 
i 3.398048 338.9385 0.5378755 41 71.01702 0 0.2203639 0 0 4095 1 
i 3.520739 338.9385 0.5378755 39 71.21828 0 0.226522 0 0 4095 1 
i 3.704775 338.9385 0.5378755 39 71.52017 0 0.2357593 0 0 4095 1 
i 6.88916 338.9385 0.5378755 51 70.01073 0 0.3955913 0 0 4095 1 
i 7.073196 338.9385 0.5378755 51 70.31262 0 0.4048286 0 0 4095 1 
i 7.195887 338.9385 0.5378755 53 70.51388 0 0.4109867 0 0 4095 1 
i 7.257232 338.9385 0.5378755 56 70.61451 0 0.4140658 0 0 4095 1 
i 7.441269 338.9385 0.5378755 51 70.91639 0 0.423303 0 0 4095 1 
i 7.502614 338.9385 0.5378755 50 71.01702 0 0.4263821 0 0 4095 1 
i 7.625305 338.9385 0.5378755 51 71.21828 0 0.4325402 0 0 4095 1 
i 7.809341 338.9385 0.5378755 51 71.52017 0 0.4417775 0 0 4095 1 
i 10.99373 338.9385 0.5378755 63 70.01073 0 0.6016095 0 0 4095 1 
i 11.17776 338.9385 0.5378755 63 70.31262 0 0.6108467 0 0 4095 1 
i 11.30045 338.9385 0.5378755 65 70.51388 0 0.6170049 0 0 4095 1 
i 11.3618 338.9385 0.5378755 68 70.61451 0 0.620084 0 0 4095 1 
i 11.54583 338.9385 0.5378755 63 70.91639 0 0.6293212 0 0 4095 1 
i 11.60718 338.9385 0.5378755 62 71.01702 0 0.6324003 0 0 4095 1 
i 11.72987 338.9385 0.5378755 63 71.21828 0 0.6385584 0 0 4095 1 
i 11.91391 338.9385 0.5378755 63 71.52017 0 0.6477957 0 0 4095 1 
i 15.09829 338.9385 0.5378755 75 70.01073 0 0.8076277 0 0 4095 1 
i 15.28233 338.9385 0.5378755 75 70.31262 0 0.8168649 0 0 4095 1 
i 15.40502 338.9385 0.5378755 77 70.51388 0 0.8230231 0 0 4095 1 
i 15.46636 338.9385 0.5378755 80 70.61451 0 0.8261022 0 0 4095 1 
i 15.6504 338.9385 0.5378755 75 70.91639 0 0.8353394 0 0 4095 1 
i 15.71175 338.9385 0.5378755 74 71.01702 0 0.8384185 0 0 4095 1 
i 15.83444 338.9385 0.5378755 75 71.21828 0 0.8445766 0 0 4095 1 
i 16.01847 338.9385 0.7347657 71 71.52017 0 0.8538139 0 0 4095 1 
i 1 339.6732 0.5378755 54 70.00134 0 0.1 0 0 4095 1 
i 1.306727 339.6732 0.5378755 55 70.50449 0 0.1153954 0 0 4095 1 
i 1.552109 339.6732 0.5378755 49 70.907 0 0.1277117 0 0 4095 1 
i 1.736145 339.6732 0.5378755 49 71.20889 0 0.1369489 0 0 4095 1 
i 2.042872 339.6732 0.5378755 59 71.71203 0 0.1523443 0 0 4095 1 
i 2.226908 339.6732 0.5378755 55 72.01392 0 0.1615815 0 0 4095 1 
i 2.47229 339.6732 0.5378755 61 72.41644 0 0.1738978 0 0 4095 1 
i 2.779017 339.6732 0.5378755 64 72.91958 0 0.1892932 0 0 4095 1 
i 5.104566 339.6732 0.5378755 66 70.00134 0 0.3060182 0 0 4095 1 
i 5.411293 339.6732 0.5378755 67 70.50449 0 0.3214136 0 0 4095 1 
i 5.656675 339.6732 0.5378755 61 70.907 0 0.3337299 0 0 4095 1 
i 5.840711 339.6732 0.5378755 57 71.20889 0 0.3429671 0 0 4095 1 
i 6.147438 339.6732 0.5378755 71 71.71203 0 0.3583625 0 0 4095 1 
i 6.331474 339.6732 0.5378755 67 72.01392 0 0.3675997 0 0 4095 1 
i 6.576856 339.6732 0.5378755 73 72.41644 0 0.379916 0 0 4095 1 
i 6.883583 339.6732 0.5378755 76 72.91958 0 0.3953114 0 0 4095 1 
i 9.209132 339.6732 0.5378755 73 70.00134 0 0.5120364 0 0 4095 1 
i 9.515859 339.6732 0.5378755 79 70.50449 0 0.5274318 0 0 4095 1 
i 9.761241 339.6732 0.5378755 73 70.907 0 0.5397481 0 0 4095 1 
i 9.945277 339.6732 0.5378755 69 71.20889 0 0.5489853 0 0 4095 1 
i 10.252 339.6732 0.5378755 83 71.71203 0 0.5643807 0 0 4095 1 
i 10.43604 339.6732 0.5378755 79 72.01392 0 0.5736179 0 0 4095 1 
i 10.68142 339.6732 0.5378755 85 72.41644 0 0.5859342 0 0 4095 1 
i 10.98815 339.6732 0.5378755 88 72.91958 0 0.6013296 0 0 4095 1 
i 13.3137 339.6732 0.5378755 85 70.00134 0 0.7180546 0 0 4095 1 
i 13.62043 339.6732 0.5378755 87 70.50449 0 0.73345 0 0 4095 1 
i 13.86581 339.6732 0.5378755 85 70.907 0 0.7457663 0 0 4095 1 
i 14.04984 339.6732 0.5378755 81 71.20889 0 0.7550035 0 0 4095 1 
i 14.35657 339.6732 0.5378755 95 71.71203 0 0.7703989 0 0 4095 1 
i 14.54061 339.6732 0.5378755 91 72.01392 0 0.7796361 0 0 4095 1 
i 14.78599 339.6732 0.5378755 94 72.41644 0 0.7919524 0 0 4095 1 
i 15.09272 339.6732 1.498452 100 72.91958 0 0.8073478 0 0 4095 1 
i 1 341.1717 0.5378755 51 70.00067 0 0.1 0 0 4095 1 
i 1.368072 341.1717 0.5378755 55 70.60444 0 0.1184745 0 0 4095 1 
i 1.613454 341.1717 0.5378755 49 71.00696 0 0.1307908 0 0 4095 1 
i 1.736145 341.1717 0.5378755 48 71.20822 0 0.1369489 0 0 4095 1 
i 2.104217 341.1717 0.5378755 59 71.81199 0 0.1554234 0 0 4095 1 
i 2.226908 341.1717 0.5378755 58 72.01325 0 0.1615815 0 0 4095 1 
i 2.47229 341.1717 0.5378755 64 72.41577 0 0.1738978 0 0 4095 1 
i 2.840362 341.1717 0.5378755 64 73.01954 0 0.1923723 0 0 4095 1 
i 5.104566 341.1717 0.5378755 63 70.00067 0 0.3060182 0 0 4095 1 
i 5.472639 341.1717 0.5378755 67 70.60444 0 0.3244927 0 0 4095 1 
i 5.71802 341.1717 0.5378755 61 71.00696 0 0.336809 0 0 4095 1 
i 5.840711 341.1717 0.5378755 60 71.20822 0 0.3429671 0 0 4095 1 
i 6.208784 341.1717 0.5378755 71 71.81199 0 0.3614416 0 0 4095 1 
i 6.331474 341.1717 0.5378755 70 72.01325 0 0.3675997 0 0 4095 1 
i 6.576856 341.1717 0.5378755 76 72.41577 0 0.379916 0 0 4095 1 
i 6.944929 341.1717 0.5378755 76 73.01954 0 0.3983905 0 0 4095 1 
i 9.209132 341.1717 0.5378755 75 70.00067 0 0.5120364 0 0 4095 1 
i 9.577205 341.1717 0.5378755 79 70.60444 0 0.5305108 0 0 4095 1 
i 9.822586 341.1717 0.5378755 73 71.00696 0 0.5428272 0 0 4095 1 
i 9.945277 341.1717 0.5378755 72 71.20822 0 0.5489853 0 0 4095 1 
i 10.31335 341.1717 0.5378755 83 71.81199 0 0.5674598 0 0 4095 1 
i 10.43604 341.1717 0.5378755 82 72.01325 0 0.5736179 0 0 4095 1 
i 10.68142 341.1717 0.5378755 88 72.41577 0 0.5859342 0 0 4095 1 
i 11.04949 341.1717 0.5378755 88 73.01954 0 0.6044087 0 0 4095 1 
i 13.3137 341.1717 0.5378755 87 70.00067 0 0.7180546 0 0 4095 1 
i 13.68177 341.1717 0.5378755 87 70.60444 0 0.736529 0 0 4095 1 
i 13.92715 341.1717 0.5378755 85 71.00696 0 0.7488453 0 0 4095 1 
i 14.04984 341.1717 0.5378755 79 71.20822 0 0.7550035 0 0 4095 1 
i 14.41792 341.1717 0.5378755 95 71.81199 0 0.773478 0 0 4095 1 
i 14.54061 341.1717 0.5378755 94 72.01325 0 0.7796361 0 0 4095 1 
i 14.78599 341.1717 0.5378755 100 72.41577 0 0.7919524 0 0 4095 1 
i 15.15406 341.1717 0.5378755 100 73.01954 0 0.8104269 0 0 4095 1 
i 2.784594 341.6747 0.5378755 48 70.01006 0 0.1895731 0 0 4095 1 
i 6.88916 341.6747 0.5378755 55 70.01006 0 0.3955913 0 0 4095 1 
i 10.99373 341.6747 0.5378755 67 70.01006 0 0.6016095 0 0 4095 1 
i 15.09829 341.6747 0.8900738 79 70.01006 0 0.8076277 0 0 4095 1 
i 1 342.5648 0.5378755 52 70 0 0.1 0 0 4095 1 
i 1.184036 342.5648 0.5378755 52 70.30189 0 0.1092372 0 0 4095 1 
i 1.306727 342.5648 0.5378755 54 70.50314 0 0.1153954 0 0 4095 1 
i 1.368072 342.5648 0.5378755 55 70.60377 0 0.1184745 0 0 4095 1 
i 1.552109 342.5648 0.5378755 48 70.90566 0 0.1277117 0 0 4095 1 
i 1.613454 342.5648 0.5378755 49 71.00629 0 0.1307908 0 0 4095 1 
i 1.736145 342.5648 0.5378755 48 71.20755 0 0.1369489 0 0 4095 1 
i 1.920181 342.5648 0.5378755 43 71.50943 0 0.1461861 0 0 4095 1 
i 2.042872 342.5648 0.5378755 58 71.71069 0 0.1523443 0 0 4095 1 
i 2.104217 342.5648 0.5378755 59 71.81132 0 0.1554234 0 0 4095 1 
i 2.226908 342.5648 0.5378755 58 72.01258 0 0.1615815 0 0 4095 1 
i 2.410945 342.5648 0.5378755 58 72.31447 0 0.1708188 0 0 4095 1 
i 2.47229 342.5648 0.5378755 64 72.41509 0 0.1738978 0 0 4095 1 
i 2.656326 342.5648 0.5378755 64 72.71698 0 0.1831351 0 0 4095 1 
i 2.779017 342.5648 0.5378755 62 72.91824 0 0.1892932 0 0 4095 1 
i 2.840362 342.5648 0.5378755 64 73.01887 0 0.1923723 0 0 4095 1 
i 5.104566 342.5648 0.5378755 64 70 0 0.3060182 0 0 4095 1 
i 5.288602 342.5648 0.5378755 64 70.30189 0 0.3152554 0 0 4095 1 
i 5.411293 342.5648 0.5378755 66 70.50314 0 0.3214136 0 0 4095 1 
i 5.472639 342.5648 0.5378755 67 70.60377 0 0.3244927 0 0 4095 1 
i 5.656675 342.5648 0.5378755 60 70.90566 0 0.3337299 0 0 4095 1 
i 5.71802 342.5648 0.5378755 61 71.00629 0 0.336809 0 0 4095 1 
i 5.840711 342.5648 0.5378755 60 71.20755 0 0.3429671 0 0 4095 1 
i 6.024747 342.5648 0.5378755 55 71.50943 0 0.3522043 0 0 4095 1 
i 6.147438 342.5648 0.5378755 70 71.71069 0 0.3583625 0 0 4095 1 
i 6.208784 342.5648 0.5378755 71 71.81132 0 0.3614416 0 0 4095 1 
i 6.331474 342.5648 0.5378755 70 72.01258 0 0.3675997 0 0 4095 1 
i 6.515511 342.5648 0.5378755 65 72.31447 0 0.3768369 0 0 4095 1 
i 6.576856 342.5648 0.5378755 76 72.41509 0 0.379916 0 0 4095 1 
i 6.760892 342.5648 0.5378755 71 72.71698 0 0.3891533 0 0 4095 1 
i 6.883583 342.5648 0.5378755 74 72.91824 0 0.3953114 0 0 4095 1 
i 6.944929 342.5648 0.5378755 76 73.01887 0 0.3983905 0 0 4095 1 
i 9.209132 342.5648 0.5378755 76 70 0 0.5120364 0 0 4095 1 
i 9.393168 342.5648 0.5378755 76 70.30189 0 0.5212736 0 0 4095 1 
i 9.515859 342.5648 0.5378755 78 70.50314 0 0.5274318 0 0 4095 1 
i 9.577205 342.5648 0.5378755 79 70.60377 0 0.5305108 0 0 4095 1 
i 9.761241 342.5648 0.5378755 72 70.90566 0 0.5397481 0 0 4095 1 
i 9.822586 342.5648 0.5378755 73 71.00629 0 0.5428272 0 0 4095 1 
i 9.945277 342.5648 0.5378755 67 71.20755 0 0.5489853 0 0 4095 1 
i 10.12931 342.5648 0.5378755 67 71.50943 0 0.5582225 0 0 4095 1 
i 10.252 342.5648 0.5378755 82 71.71069 0 0.5643807 0 0 4095 1 
i 10.31335 342.5648 0.5378755 83 71.81132 0 0.5674598 0 0 4095 1 
i 10.43604 342.5648 0.5378755 82 72.01258 0 0.5736179 0 0 4095 1 
i 10.62008 342.5648 0.5378755 77 72.31447 0 0.5828551 0 0 4095 1 
i 10.68142 342.5648 0.5378755 88 72.41509 0 0.5859342 0 0 4095 1 
i 10.86546 342.5648 0.5378755 83 72.71698 0 0.5951714 0 0 4095 1 
i 10.98815 342.5648 0.5378755 86 72.91824 0 0.6013296 0 0 4095 1 
i 11.04949 342.5648 0.5378755 88 73.01887 0 0.6044087 0 0 4095 1 
i 13.3137 342.5648 0.5378755 88 70 0 0.7180546 0 0 4095 1 
i 13.49773 342.5648 0.5378755 88 70.30189 0 0.7272918 0 0 4095 1 
i 13.62043 342.5648 0.5378755 90 70.50314 0 0.73345 0 0 4095 1 
i 13.68177 342.5648 0.5378755 88 70.60377 0 0.736529 0 0 4095 1 
i 13.86581 342.5648 0.5378755 84 70.90566 0 0.7457663 0 0 4095 1 
i 13.92715 342.5648 0.5378755 85 71.00629 0 0.7488453 0 0 4095 1 
i 14.04984 342.5648 0.5378755 79 71.20755 0 0.7550035 0 0 4095 1 
i 14.23388 342.5648 0.5378755 79 71.50943 0 0.7642407 0 0 4095 1 
i 14.35657 342.5648 0.5378755 94 71.71069 0 0.7703989 0 0 4095 1 
i 14.41792 342.5648 0.5378755 92 71.81132 0 0.773478 0 0 4095 1 
i 14.54061 342.5648 0.5378755 89 72.01258 0 0.7796361 0 0 4095 1 
i 14.72464 342.5648 0.5378755 89 72.31447 0 0.7888733 0 0 4095 1 
i 14.78599 342.5648 0.5378755 95 72.41509 0 0.7919524 0 0 4095 1 
i 14.97002 342.5648 0.5378755 95 72.71698 0 0.8011896 0 0 4095 1 
i 15.09272 342.5648 0.5378755 98 72.91824 0 0.8073478 0 0 4095 1 
i 15.15406 342.5648 0.7226347 100 73.01887 0 0.8104269 0 0 4095 1 
i 2.784594 343.2874 0.5378755 49 70.00939 0 0.1895731 0 0 4095 1 
i 3.827466 343.2874 0.5378755 40 71.72008 0 0.2419174 0 0 4095 1 
i 6.88916 343.2874 0.5378755 61 70.00939 0 0.3955913 0 0 4095 1 
i 7.932032 343.2874 0.5378755 52 71.72008 0 0.4479356 0 0 4095 1 
i 10.99373 343.2874 0.5378755 73 70.00939 0 0.6016095 0 0 4095 1 
i 12.0366 343.2874 0.5378755 64 71.72008 0 0.6539538 0 0 4095 1 
i 15.09829 343.2874 0.5378755 81 70.00939 0 0.8076277 0 0 4095 1 
i 16.14116 343.2874 1.652043 76 71.72008 0 0.859972 0 0 4095 1 
i 2.784594 344.9395 0.5378755 43 70.00872 0 0.1895731 0 0 4095 1 
i 3.888811 344.9395 0.5378755 64 71.82004 0 0.2449965 0 0 4095 1 
i 6.88916 344.9395 0.5378755 55 70.00872 0 0.3955913 0 0 4095 1 
i 7.993377 344.9395 0.5378755 76 71.82004 0 0.4510147 0 0 4095 1 
i 10.99373 344.9395 0.5378755 67 70.00872 0 0.6016095 0 0 4095 1 
i 12.09794 344.9395 0.5378755 88 71.82004 0 0.6570329 0 0 4095 1 
i 15.09829 344.9395 0.5378755 79 70.00872 0 0.8076277 0 0 4095 1 
i 16.20251 344.9395 1.535913 100 71.82004 0 0.8630511 0 0 4095 1 
i 2.784594 346.4754 0.5378755 52 70.00805 0 0.1895731 0 0 4095 1 
i 2.96863 346.4754 0.5378755 55 70.30994 0 0.1988104 0 0 4095 1 
i 3.827466 346.4754 0.5378755 34 71.71874 0 0.2419174 0 0 4095 1 
i 3.888811 346.4754 0.5378755 32 71.81937 0 0.2449965 0 0 4095 1 
i 6.88916 346.4754 0.5378755 64 70.00805 0 0.3955913 0 0 4095 1 
i 7.073196 346.4754 0.5378755 67 70.30994 0 0.4048286 0 0 4095 1 
i 7.932032 346.4754 0.5378755 46 71.71874 0 0.4479356 0 0 4095 1 
i 7.993377 346.4754 0.5378755 44 71.81937 0 0.4510147 0 0 4095 1 
i 10.99373 346.4754 0.5378755 76 70.00805 0 0.6016095 0 0 4095 1 
i 11.17776 346.4754 0.5378755 76 70.30994 0 0.6108467 0 0 4095 1 
i 12.0366 346.4754 0.5378755 58 71.71874 0 0.6539538 0 0 4095 1 
i 12.09794 346.4754 0.5378755 56 71.81937 0 0.6570329 0 0 4095 1 
i 15.09829 346.4754 0.5378755 88 70.00805 0 0.8076277 0 0 4095 1 
i 15.28233 346.4754 0.5378755 88 70.30994 0 0.8168649 0 0 4095 1 
i 16.14116 346.4754 0.5378755 65 71.71874 0 0.859972 0 0 4095 1 
i 16.20251 346.4754 1.768173 64 71.81937 0 0.8630511 0 0 4095 1 
i 2.784594 348.2436 0.5378755 45 70.00738 0 0.1895731 0 0 4095 1 
i 4.011502 348.2436 0.5378755 55 72.01996 0 0.2511547 0 0 4095 1 
i 6.88916 348.2436 0.5378755 57 70.00738 0 0.3955913 0 0 4095 1 
i 8.116068 348.2436 0.5378755 67 72.01996 0 0.4571728 0 0 4095 1 
i 10.99373 348.2436 0.5378755 69 70.00738 0 0.6016095 0 0 4095 1 
i 12.22063 348.2436 0.5378755 79 72.01996 0 0.663191 0 0 4095 1 
i 15.09829 348.2436 0.5378755 81 70.00738 0 0.8076277 0 0 4095 1 
i 16.3252 348.2436 1.535913 91 72.01996 0 0.8692092 0 0 4095 1 
i 2.784594 349.7795 0.5378755 46 70.00671 0 0.1895731 0 0 4095 1 
i 3.091321 349.7795 0.5378755 43 70.50985 0 0.2049685 0 0 4095 1 
i 3.827466 349.7795 0.5378755 56 71.7174 0 0.2419174 0 0 4095 1 
i 4.011502 349.7795 0.5378755 59 72.01929 0 0.2511547 0 0 4095 1 
i 6.88916 349.7795 0.5378755 58 70.00671 0 0.3955913 0 0 4095 1 
i 7.195887 349.7795 0.5378755 55 70.50985 0 0.4109867 0 0 4095 1 
i 7.932032 349.7795 0.5378755 68 71.7174 0 0.4479356 0 0 4095 1 
i 8.116068 349.7795 0.5378755 71 72.01929 0 0.4571728 0 0 4095 1 
i 10.99373 349.7795 0.5378755 70 70.00671 0 0.6016095 0 0 4095 1 
i 11.30045 349.7795 0.5378755 64 70.50985 0 0.6170049 0 0 4095 1 
i 12.0366 349.7795 0.5378755 80 71.7174 0 0.6539538 0 0 4095 1 
i 12.22063 349.7795 0.5378755 80 72.01929 0 0.663191 0 0 4095 1 
i 15.09829 349.7795 0.5378755 82 70.00671 0 0.8076277 0 0 4095 1 
i 15.40502 349.7795 0.5378755 76 70.50985 0 0.8230231 0 0 4095 1 
i 16.14116 349.7795 0.5378755 88 71.7174 0 0.859972 0 0 4095 1 
i 16.3252 349.7795 1.573374 92 72.01929 0 0.8692092 0 0 4095 1 
i 2.784594 351.3529 0.5378755 52 70.00604 0 0.1895731 0 0 4095 1 
i 3.152666 351.3529 0.5378755 55 70.60981 0 0.2080476 0 0 4095 1 
i 3.888811 351.3529 0.5378755 32 71.81736 0 0.2449965 0 0 4095 1 
i 4.011502 351.3529 0.5378755 26 72.01862 0 0.2511547 0 0 4095 1 
i 6.88916 351.3529 0.5378755 64 70.00604 0 0.3955913 0 0 4095 1 
i 7.257232 351.3529 0.5378755 67 70.60981 0 0.4140658 0 0 4095 1 
i 7.993377 351.3529 0.5378755 44 71.81736 0 0.4510147 0 0 4095 1 
i 8.116068 351.3529 0.5378755 38 72.01862 0 0.4571728 0 0 4095 1 
i 10.99373 351.3529 0.5378755 76 70.00604 0 0.6016095 0 0 4095 1 
i 11.3618 351.3529 0.5378755 79 70.60981 0 0.620084 0 0 4095 1 
i 12.09794 351.3529 0.5378755 56 71.81736 0 0.6570329 0 0 4095 1 
i 12.22063 351.3529 0.5378755 50 72.01862 0 0.663191 0 0 4095 1 
i 15.09829 351.3529 0.5378755 88 70.00604 0 0.8076277 0 0 4095 1 
i 15.46636 351.3529 0.5378755 91 70.60981 0 0.8261022 0 0 4095 1 
i 16.20251 351.3529 0.5378755 68 71.81736 0 0.8630511 0 0 4095 1 
i 16.3252 351.3529 1.462774 62 72.01862 0 0.8692092 0 0 4095 1 
i 2.784594 352.8156 0.5378755 45 70.00537 0 0.1895731 0 0 4095 1 
i 2.96863 352.8156 0.5378755 45 70.30725 0 0.1988104 0 0 4095 1 
i 3.091321 352.8156 0.5378755 43 70.50851 0 0.2049685 0 0 4095 1 
i 3.152666 352.8156 0.5378755 42 70.60914 0 0.2080476 0 0 4095 1 
i 3.827466 352.8156 0.5378755 64 71.71606 0 0.2419174 0 0 4095 1 
i 3.888811 352.8156 0.5378755 58 71.81669 0 0.2449965 0 0 4095 1 
i 4.011502 352.8156 0.5378755 64 72.01795 0 0.2511547 0 0 4095 1 
i 4.195539 352.8156 0.5378755 64 72.31983 0 0.2603919 0 0 4095 1 
i 6.88916 352.8156 0.5378755 54 70.00537 0 0.3955913 0 0 4095 1 
i 7.073196 352.8156 0.5378755 57 70.30725 0 0.4048286 0 0 4095 1 
i 7.195887 352.8156 0.5378755 55 70.50851 0 0.4109867 0 0 4095 1 
i 7.257232 352.8156 0.5378755 54 70.60914 0 0.4140658 0 0 4095 1 
i 7.932032 352.8156 0.5378755 71 71.71606 0 0.4479356 0 0 4095 1 
i 7.993377 352.8156 0.5378755 70 71.81669 0 0.4510147 0 0 4095 1 
i 8.116068 352.8156 0.5378755 76 72.01795 0 0.4571728 0 0 4095 1 
i 8.300105 352.8156 0.5378755 76 72.31983 0 0.4664101 0 0 4095 1 
i 10.99373 352.8156 0.5378755 66 70.00537 0 0.6016095 0 0 4095 1 
i 11.17776 352.8156 0.5378755 69 70.30725 0 0.6108467 0 0 4095 1 
i 11.30045 352.8156 0.5378755 63 70.50851 0 0.6170049 0 0 4095 1 
i 11.3618 352.8156 0.5378755 61 70.60914 0 0.620084 0 0 4095 1 
i 12.0366 352.8156 0.5378755 83 71.71606 0 0.6539538 0 0 4095 1 
i 12.09794 352.8156 0.5378755 82 71.81669 0 0.6570329 0 0 4095 1 
i 12.22063 352.8156 0.5378755 88 72.01795 0 0.663191 0 0 4095 1 
i 12.40467 352.8156 0.5378755 88 72.31983 0 0.6724283 0 0 4095 1 
i 15.09829 352.8156 0.5378755 78 70.00537 0 0.8076277 0 0 4095 1 
i 15.28233 352.8156 0.5378755 81 70.30725 0 0.8168649 0 0 4095 1 
i 15.40502 352.8156 0.5378755 75 70.50851 0 0.8230231 0 0 4095 1 
i 15.46636 352.8156 0.5378755 73 70.60914 0 0.8261022 0 0 4095 1 
i 16.14116 352.8156 0.5378755 95 71.71606 0 0.859972 0 0 4095 1 
i 16.20251 352.8156 0.5378755 94 71.81669 0 0.8630511 0 0 4095 1 
i 16.3252 352.8156 0.5378755 100 72.01795 0 0.8692092 0 0 4095 1 
i 16.50924 352.8156 2.03611 100 72.31983 0 0.8784465 0 0 4095 1 
i 2.784594 354.8517 0.5378755 43 70.0047 0 0.1895731 0 0 4095 1 
i 4.256884 354.8517 0.5378755 40 72.41979 0 0.263471 0 0 4095 1 
i 6.88916 354.8517 0.5378755 55 70.0047 0 0.3955913 0 0 4095 1 
i 8.36145 354.8517 0.5378755 52 72.41979 0 0.4694892 0 0 4095 1 
i 10.99373 354.8517 0.5378755 67 70.0047 0 0.6016095 0 0 4095 1 
i 12.46602 354.8517 0.5378755 64 72.41979 0 0.6755073 0 0 4095 1 
i 15.09829 354.8517 0.5378755 79 70.0047 0 0.8076277 0 0 4095 1 
i 16.57058 354.8517 1.535913 76 72.41979 0 0.8815255 0 0 4095 1 
i 2.784594 356.3877 0.5378755 43 70.00403 0 0.1895731 0 0 4095 1 
i 3.336703 356.3877 0.5378755 52 70.90969 0 0.2172848 0 0 4095 1 
i 3.827466 356.3877 0.5378755 41 71.71472 0 0.2419174 0 0 4095 1 
i 4.256884 356.3877 0.5378755 40 72.41912 0 0.263471 0 0 4095 1 
i 6.88916 356.3877 0.5378755 55 70.00403 0 0.3955913 0 0 4095 1 
i 7.441269 356.3877 0.5378755 64 70.90969 0 0.423303 0 0 4095 1 
i 7.932032 356.3877 0.5378755 53 71.71472 0 0.4479356 0 0 4095 1 
i 8.36145 356.3877 0.5378755 52 72.41912 0 0.4694892 0 0 4095 1 
i 10.99373 356.3877 0.5378755 67 70.00403 0 0.6016095 0 0 4095 1 
i 11.54583 356.3877 0.5378755 76 70.90969 0 0.6293212 0 0 4095 1 
i 12.0366 356.3877 0.5378755 65 71.71472 0 0.6539538 0 0 4095 1 
i 12.46602 356.3877 0.5378755 64 72.41912 0 0.6755073 0 0 4095 1 
i 15.09829 356.3877 0.5378755 79 70.00403 0 0.8076277 0 0 4095 1 
i 15.6504 356.3877 0.5378755 88 70.90969 0 0.8353394 0 0 4095 1 
i 16.14116 356.3877 0.5378755 77 71.71472 0 0.859972 0 0 4095 1 
i 16.57058 356.3877 1.573374 76 72.41912 0 0.8815255 0 0 4095 1 
i 2.784594 357.961 0.5378755 49 70.00335 0 0.1895731 0 0 4095 1 
i 3.398048 357.961 0.5378755 36 71.00964 0 0.2203639 0 0 4095 1 
i 3.888811 357.961 0.5378755 53 71.81468 0 0.2449965 0 0 4095 1 
i 4.256884 357.961 0.5378755 65 72.41845 0 0.263471 0 0 4095 1 
i 6.88916 357.961 0.5378755 61 70.00335 0 0.3955913 0 0 4095 1 
i 7.502614 357.961 0.5378755 48 71.00964 0 0.4263821 0 0 4095 1 
i 7.993377 357.961 0.5378755 65 71.81468 0 0.4510147 0 0 4095 1 
i 8.36145 357.961 0.5378755 77 72.41845 0 0.4694892 0 0 4095 1 
i 10.99373 357.961 0.5378755 73 70.00335 0 0.6016095 0 0 4095 1 
i 11.60718 357.961 0.5378755 60 71.00964 0 0.6324003 0 0 4095 1 
i 12.09794 357.961 0.5378755 77 71.81468 0 0.6570329 0 0 4095 1 
i 12.46602 357.961 0.5378755 89 72.41845 0 0.6755073 0 0 4095 1 
i 15.09829 357.961 0.5378755 82 70.00335 0 0.8076277 0 0 4095 1 
i 15.71175 357.961 0.5378755 72 71.00964 0 0.8384185 0 0 4095 1 
i 16.20251 357.961 0.5378755 89 71.81468 0 0.8630511 0 0 4095 1 
i 16.57058 357.961 1.462774 101 72.41845 0 0.8815255 0 0 4095 1 
i 2.784594 359.4238 0.5378755 43 70.00268 0 0.1895731 0 0 4095 1 
i 2.96863 359.4238 0.5378755 43 70.30457 0 0.1988104 0 0 4095 1 
i 3.336703 359.4238 0.5378755 51 70.90834 0 0.2172848 0 0 4095 1 
i 3.398048 359.4238 0.5378755 54 71.00897 0 0.2203639 0 0 4095 1 
i 3.827466 359.4238 0.5378755 41 71.71338 0 0.2419174 0 0 4095 1 
i 3.888811 359.4238 0.5378755 40 71.814 0 0.2449965 0 0 4095 1 
i 4.256884 359.4238 0.5378755 31 72.41778 0 0.263471 0 0 4095 1 
i 4.44092 359.4238 0.5378755 31 72.71966 0 0.2727082 0 0 4095 1 
i 6.88916 359.4238 0.5378755 55 70.00268 0 0.3955913 0 0 4095 1 
i 7.073196 359.4238 0.5378755 55 70.30457 0 0.4048286 0 0 4095 1 
i 7.441269 359.4238 0.5378755 63 70.90834 0 0.423303 0 0 4095 1 
i 7.502614 359.4238 0.5378755 66 71.00897 0 0.4263821 0 0 4095 1 
i 7.932032 359.4238 0.5378755 49 71.71338 0 0.4479356 0 0 4095 1 
i 7.993377 359.4238 0.5378755 52 71.814 0 0.4510147 0 0 4095 1 
i 8.36145 359.4238 0.5378755 43 72.41778 0 0.4694892 0 0 4095 1 
i 8.545486 359.4238 0.5378755 40 72.71966 0 0.4787264 0 0 4095 1 
i 10.99373 359.4238 0.5378755 67 70.00268 0 0.6016095 0 0 4095 1 
i 11.17776 359.4238 0.5378755 67 70.30457 0 0.6108467 0 0 4095 1 
i 11.54583 359.4238 0.5378755 75 70.90834 0 0.6293212 0 0 4095 1 
i 11.60718 359.4238 0.5378755 78 71.00897 0 0.6324003 0 0 4095 1 
i 12.0366 359.4238 0.5378755 61 71.71338 0 0.6539538 0 0 4095 1 
i 12.09794 359.4238 0.5378755 64 71.814 0 0.6570329 0 0 4095 1 
i 12.46602 359.4238 0.5378755 55 72.41778 0 0.6755073 0 0 4095 1 
i 12.65005 359.4238 0.5378755 52 72.71966 0 0.6847446 0 0 4095 1 
i 15.09829 359.4238 0.5378755 79 70.00268 0 0.8076277 0 0 4095 1 
i 15.28233 359.4238 0.5378755 79 70.30457 0 0.8168649 0 0 4095 1 
i 15.6504 359.4238 0.5378755 87 70.90834 0 0.8353394 0 0 4095 1 
i 15.71175 359.4238 0.5378755 90 71.00897 0 0.8384185 0 0 4095 1 
i 16.14116 359.4238 0.5378755 73 71.71338 0 0.859972 0 0 4095 1 
i 16.20251 359.4238 0.5378755 76 71.814 0 0.8630511 0 0 4095 1 
i 16.57058 359.4238 0.5378755 67 72.41778 0 0.8815255 0 0 4095 1 
i 16.75462 359.4238 1.683974 64 72.71966 0 0.8907628 0 0 4095 1 
i 2.784594 361.1078 0.5378755 43 70.00201 0 0.1895731 0 0 4095 1 
i 3.520739 361.1078 0.5378755 43 71.20956 0 0.226522 0 0 4095 1 
i 4.011502 361.1078 0.5378755 50 72.01459 0 0.2511547 0 0 4095 1 
i 4.256884 361.1078 0.5378755 52 72.41711 0 0.263471 0 0 4095 1 
i 6.88916 361.1078 0.5378755 55 70.00201 0 0.3955913 0 0 4095 1 
i 7.625305 361.1078 0.5378755 55 71.20956 0 0.4325402 0 0 4095 1 
i 8.116068 361.1078 0.5378755 58 72.01459 0 0.4571728 0 0 4095 1 
i 8.36145 361.1078 0.5378755 64 72.41711 0 0.4694892 0 0 4095 1 
i 10.99373 361.1078 0.5378755 67 70.00201 0 0.6016095 0 0 4095 1 
i 11.72987 361.1078 0.5378755 67 71.20956 0 0.6385584 0 0 4095 1 
i 12.22063 361.1078 0.5378755 70 72.01459 0 0.663191 0 0 4095 1 
i 12.46602 361.1078 0.5378755 76 72.41711 0 0.6755073 0 0 4095 1 
i 15.09829 361.1078 0.5378755 79 70.00201 0 0.8076277 0 0 4095 1 
i 15.83444 361.1078 0.5378755 79 71.20956 0 0.8445766 0 0 4095 1 
i 16.3252 361.1078 0.5378755 82 72.01459 0 0.8692092 0 0 4095 1 
i 16.57058 361.1078 1.462774 83 72.41711 0 0.8815255 0 0 4095 1 
i 2.784594 362.5706 0.5378755 45 70.00134 0 0.1895731 0 0 4095 1 
i 3.091321 362.5706 0.5378755 51 70.50449 0 0.2049685 0 0 4095 1 
i 3.336703 362.5706 0.5378755 45 70.907 0 0.2172848 0 0 4095 1 
i 3.520739 362.5706 0.5378755 37 71.20889 0 0.226522 0 0 4095 1 
i 3.827466 362.5706 0.5378755 59 71.71203 0 0.2419174 0 0 4095 1 
i 4.011502 362.5706 0.5378755 55 72.01392 0 0.2511547 0 0 4095 1 
i 4.256884 362.5706 0.5378755 61 72.41644 0 0.263471 0 0 4095 1 
i 4.563611 362.5706 0.5378755 67 72.91958 0 0.2788663 0 0 4095 1 
i 6.88916 362.5706 0.5378755 57 70.00134 0 0.3955913 0 0 4095 1 
i 7.195887 362.5706 0.5378755 63 70.50449 0 0.4109867 0 0 4095 1 
i 7.441269 362.5706 0.5378755 54 70.907 0 0.423303 0 0 4095 1 
i 7.625305 362.5706 0.5378755 49 71.20889 0 0.4325402 0 0 4095 1 
i 7.932032 362.5706 0.5378755 71 71.71203 0 0.4479356 0 0 4095 1 
i 8.116068 362.5706 0.5378755 67 72.01392 0 0.4571728 0 0 4095 1 
i 8.36145 362.5706 0.5378755 73 72.41644 0 0.4694892 0 0 4095 1 
i 8.668177 362.5706 0.5378755 79 72.91958 0 0.4848845 0 0 4095 1 
i 10.99373 362.5706 0.5378755 69 70.00134 0 0.6016095 0 0 4095 1 
i 11.30045 362.5706 0.5378755 75 70.50449 0 0.6170049 0 0 4095 1 
i 11.54583 362.5706 0.5378755 66 70.907 0 0.6293212 0 0 4095 1 
i 11.72987 362.5706 0.5378755 61 71.20889 0 0.6385584 0 0 4095 1 
i 12.0366 362.5706 0.5378755 83 71.71203 0 0.6539538 0 0 4095 1 
i 12.22063 362.5706 0.5378755 76 72.01392 0 0.663191 0 0 4095 1 
i 12.46602 362.5706 0.5378755 85 72.41644 0 0.6755073 0 0 4095 1 
i 12.77274 362.5706 0.5378755 91 72.91958 0 0.6909027 0 0 4095 1 
i 15.09829 362.5706 0.5378755 81 70.00134 0 0.8076277 0 0 4095 1 
i 15.40502 362.5706 0.5378755 87 70.50449 0 0.8230231 0 0 4095 1 
i 15.6504 362.5706 0.5378755 78 70.907 0 0.8353394 0 0 4095 1 
i 15.83444 362.5706 0.5378755 73 71.20889 0 0.8445766 0 0 4095 1 
i 16.14116 362.5706 0.5378755 95 71.71203 0 0.859972 0 0 4095 1 
i 16.3252 362.5706 0.5378755 88 72.01392 0 0.8692092 0 0 4095 1 
i 16.57058 362.5706 0.5378755 97 72.41644 0 0.8815255 0 0 4095 1 
i 16.87731 362.5706 1.498452 100 72.91958 0 0.8969209 0 0 4095 1 
i 2.784594 364.069 0.5378755 43 70.00067 0 0.1895731 0 0 4095 1 
i 3.152666 364.069 0.5378755 43 70.60444 0 0.2080476 0 0 4095 1 
i 3.398048 364.069 0.5378755 49 71.00696 0 0.2203639 0 0 4095 1 
i 3.520739 364.069 0.5378755 55 71.20822 0 0.226522 0 0 4095 1 
i 3.888811 364.069 0.5378755 31 71.81199 0 0.2449965 0 0 4095 1 
i 4.011502 364.069 0.5378755 37 72.01325 0 0.2511547 0 0 4095 1 
i 4.256884 364.069 0.5378755 28 72.41577 0 0.263471 0 0 4095 1 
i 4.624956 364.069 0.5378755 28 73.01954 0 0.2819454 0 0 4095 1 
i 6.88916 364.069 0.5378755 55 70.00067 0 0.3955913 0 0 4095 1 
i 7.257232 364.069 0.5378755 55 70.60444 0 0.4140658 0 0 4095 1 
i 7.502614 364.069 0.5378755 61 71.00696 0 0.4263821 0 0 4095 1 
i 7.625305 364.069 0.5378755 67 71.20822 0 0.4325402 0 0 4095 1 
i 7.993377 364.069 0.5378755 43 71.81199 0 0.4510147 0 0 4095 1 
i 8.116068 364.069 0.5378755 49 72.01325 0 0.4571728 0 0 4095 1 
i 8.36145 364.069 0.5378755 40 72.41577 0 0.4694892 0 0 4095 1 
i 8.729522 364.069 0.5378755 40 73.01954 0 0.4879636 0 0 4095 1 
i 10.99373 364.069 0.5378755 67 70.00067 0 0.6016095 0 0 4095 1 
i 11.3618 364.069 0.5378755 63 70.60444 0 0.620084 0 0 4095 1 
i 11.60718 364.069 0.5378755 73 71.00696 0 0.6324003 0 0 4095 1 
i 11.72987 364.069 0.5378755 79 71.20822 0 0.6385584 0 0 4095 1 
i 12.09794 364.069 0.5378755 55 71.81199 0 0.6570329 0 0 4095 1 
i 12.22063 364.069 0.5378755 61 72.01325 0 0.663191 0 0 4095 1 
i 12.46602 364.069 0.5378755 52 72.41577 0 0.6755073 0 0 4095 1 
i 12.83409 364.069 0.5378755 52 73.01954 0 0.6939818 0 0 4095 1 
i 15.09829 364.069 0.5378755 79 70.00067 0 0.8076277 0 0 4095 1 
i 15.46636 364.069 0.5378755 75 70.60444 0 0.8261022 0 0 4095 1 
i 15.71175 364.069 0.5378755 85 71.00696 0 0.8384185 0 0 4095 1 
i 15.83444 364.069 0.5378755 91 71.20822 0 0.8445766 0 0 4095 1 
i 16.20251 364.069 0.5378755 67 71.81199 0 0.8630511 0 0 4095 1 
i 16.3252 364.069 0.5378755 73 72.01325 0 0.8692092 0 0 4095 1 
i 16.57058 364.069 0.5378755 64 72.41577 0 0.8815255 0 0 4095 1 
i 16.93865 364.069 1.393118 59 73.01954 0 0.9 0 0 4095 1 
i 2.784594 365.4621 0.5378755 43 70 0 0.1895731 0 0 4095 1 
i 3.091321 365.4621 0.5378755 46 70.50314 0 0.2049685 0 0 4095 1 
i 3.152666 365.4621 0.5378755 48 70.60377 0 0.2080476 0 0 4095 1 
i 3.704775 365.4621 0.5378755 43 71.50943 0 0.2357593 0 0 4095 1 
i 4.011502 365.4621 0.5378755 50 72.01258 0 0.2511547 0 0 4095 1 
i 4.256884 365.4621 0.5378755 52 72.41509 0 0.263471 0 0 4095 1 
i 6.88916 365.4621 0.5378755 55 70 0 0.3955913 0 0 4095 1 
i 7.073196 365.4621 0.5378755 55 70.30189 0 0.4048286 0 0 4095 1 
i 7.441269 365.4621 0.5378755 55 70.90566 0 0.423303 0 0 4095 1 
i 7.932032 365.4621 0.5378755 62 71.71069 0 0.4479356 0 0 4095 1 
i 8.116068 365.4621 0.5378755 58 72.01258 0 0.4571728 0 0 4095 1 
i 8.36145 365.4621 0.5378755 64 72.41509 0 0.4694892 0 0 4095 1 
i 10.99373 365.4621 0.5378755 67 70 0 0.6016095 0 0 4095 1 
i 11.17776 365.4621 0.5378755 67 70.30189 0 0.6108467 0 0 4095 1 
i 11.3618 365.4621 0.5378755 67 70.60377 0 0.620084 0 0 4095 1 
i 11.91391 365.4621 0.5378755 67 71.50943 0 0.6477957 0 0 4095 1 
i 12.0366 365.4621 0.5378755 70 71.71069 0 0.6539538 0 0 4095 1 
i 12.46602 365.4621 0.5378755 76 72.41509 0 0.6755073 0 0 4095 1 
i 15.09829 365.4621 0.5378755 79 70 0 0.8076277 0 0 4095 1 
i 15.6504 365.4621 0.5378755 79 70.90566 0 0.8353394 0 0 4095 1 
i 16.01847 365.4621 0.5378755 79 71.50943 0 0.8538139 0 0 4095 1 
i 16.14116 365.4621 0.5378755 82 71.71069 0 0.859972 0 0 4095 1 
i 16.3252 365.4621 0.5378755 82 72.01258 0 0.8692092 0 0 4095 1 

</CsScore>
        </CsoundSynthesizer>
    