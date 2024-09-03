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
          
          gk_Duration_factor init 4.5
          
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
          gk_FMWaterBell_level init 0
          gi_FMWaterBell_attack init 0.002
          gi_FMWaterBell_release init 0.01
          gi_FMWaterBell_sustain init 20
          gi_FMWaterBell_sustain_level init .1
          gk_FMWaterBell_index init .5
          gk_FMWaterBell_crossfade init .5
          gk_FMWaterBell_vibrato_depth init 0.05
          gk_FMWaterBell_vibrato_rate init 6
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
          gk_Phaser_ratio1 init 1
          gk_Phaser_ratio2 init 1/5
          gk_Phaser_index1 init 1.01
          gk_Phaser_index2 init .103
          gk_Phaser_level init 0.5
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
          gk_Droner_partial1 init .5
          gk_Droner_partial2 init .05
          gk_Droner_partial3 init .1
          gk_Droner_partial4 init .2
          gk_Droner_partial5 init .1
          gk_Droner_partial6 init 0
          gk_Droner_partial7 init 0
          gk_Droner_partial8 init 0
          gk_Droner_partial9 init 0
          gk_Droner_partial10 init 0
          gk_Droner_level init 0
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
          gk_Sweeper_britel init .01
          gk_Sweeper_briteh init 5
          gk_Sweeper_britels init .5
          gk_Sweeper_britehs init 1.75
          gk_Sweeper_level init 0
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
          gk_Buzzer_harmonics init 8
          gk_Buzzer_level init 0
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
        gk_Shiner_attack init .0125
        gk_Shiner_release init .0125
        gk_Shiner_level init -23
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
        gk_FMModerate_level init -12
        gk_FMModerate_space_left_to_right chnexport "gk_FMModerate_space_left_to_right", 3
        gk_FMModerate_space_left_to_right init .5
        gi_FMModerate_exponent chnexport "gi_FMModerate_exponent", 3
        gi_FMModerate_exponent init -9

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
        gk_Blower_grainDensity init 40
        gk_Blower_grainDuration init 0.2
        gk_Blower_grainAmplitudeRange init 100
        gk_Blower_grainFrequencyRange init 3
        gk_Blower_attack init 1.5 
        gk_Blower_release init 2
        gk_Blower_level init 0
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
          gk_ZakianFlute_level init 0
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
        
        gk_FilteredSines_level init 0
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
        gk_Guitar_level init 0
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
        
        gk_Harpsichord_level init 0
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
        gk_Kung2_level init 0
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
        gk_Kung4_level init 0
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
        
        gk_SeidelHarmOsc_level init 0
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
        
        gk_TubularBell_level init 0
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
        gk_YiString_level init 0
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
        
        gk_Xing_level init 0
        
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
          
          gk_ReverbSC_feedback init 0.875
          gk_ReverbSC_wet init 0.5
          gi_ReverbSC_delay_modulation init 0.0075
          gk_ReverbSC_frequency_cutoff init 15000
          
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
          
          gk_MasterOutput_level init 0
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
          
i 2.784594 -18.17614 2.26007 47 70.1496 0 0.1 0 0 0 1 
i 2.845939 -17.35041 3.767132 49 70.24956 0 0.1 0 0 0 1 
i 2.907285 -15.76987 0.7171673 50 70.34952 0 0.1 0 0 0 1 
i 2.845939 -14.30044 0.7171673 50 70.24822 0 0.1 0 0 0 1 
i 2.907285 -14.30044 1.434335 51 70.34885 0 0.1 0 0 0 1 
i 2.96863 -13.58327 1.691637 52 70.44948 0 0.1 0 0 0 1 
i 2.784594 -11.89164 2.186598 49 70.14692 0 0.1 0 0 0 1 
i 2.845939 -11.13937 1.434335 50 70.24688 0 0.1 0 0 0 1 
i 3.029976 -11.13937 2.222438 53 70.54876 0 0.1 0 0 0 1 
i 2.907285 -9.634103 0.7171673 50 70.34683 0 0.1 0 0 0 1 
i 4.569188 -9.040654 0.7171673 62 74.40017 0 0.1 0 0 0 1 
i 2.784594 -8.916936 0.7171673 52 70.14558 0 0.1 0 0 0 1 
i 3.152666 -8.916936 2.116625 54 70.74935 0 0.1 0 0 0 1 
i 4.630533 -8.282002 1.434335 63 74.50013 0 0.1 0 0 0 1 
i 2.845939 -8.234645 1.434335 53 70.24553 0 0.1 0 0 0 1 
i 2.907285 -8.234645 1.434335 51 70.34616 0 0.1 0 0 0 1 
i 3.214012 -8.234645 0.7171673 55 70.84931 0 0.1 0 0 0 1 
i 2.784594 -7.517478 1.464458 52 70.14491 0 0.1 0 0 0 1 
i 4.691879 -6.770187 0.7171673 65 74.60008 0 0.1 0 0 0 1 
i 3.275357 -6.286668 0.7171673 54 70.94927 0 0.1 0 0 0 1 
i 4.569188 -6.05302 0.7171673 63 74.39883 0 0.1 0 0 0 1 
i 2.784594 -5.569501 0.7171673 49 70.14423 0 0.1 0 0 0 1 
i 4.630533 -5.364645 0.7171673 64 74.49878 0 0.1 0 0 0 1 
i 4.691879 -5.364645 1.434335 65 74.59941 0 0.1 0 0 0 1 
i 2.845939 -4.817237 0.7171673 48 70.24419 0 0.1 0 0 0 1 
i 3.275357 -4.817237 0.7171673 54 70.9486 0 0.1 0 0 0 1 
i 4.753224 -4.647477 0.7171673 66 74.70004 0 0.1 0 0 0 1 
i 2.784594 -4.10007 0.7171673 49 70.14356 0 0.1 0 0 0 1 
i 3.336703 -4.10007 0.7171673 55 71.04922 0 0.1 0 0 0 1 
i 4.81457 -3.746557 0.7171673 66 74.8 0 0.1 0 0 0 1 
i 2.907285 -3.311967 0.7171673 48 70.34415 0 0.1 0 0 0 1 
i 3.275357 -3.311967 0.7171673 54 70.94792 0 0.1 0 0 0 1 
i 4.569188 -3.02939 2.12271 64 74.39748 0 0.1 0 0 0 1 
i 2.784594 -2.5948 1.399458 50 70.14289 0 0.1 0 0 0 1 
i 3.398048 -2.5948 0.7171673 56 71.14918 0 0.1 0 0 0 1 
i 4.81457 -2.341014 0.7171673 67 74.79933 0 0.1 0 0 0 1 
i 2.907285 -1.912509 1.434335 49 70.34348 0 0.1 0 0 0 1 
i 3.275357 -1.912509 1.434335 55 70.94725 0 0.1 0 0 0 1 
i 3.459394 -1.912509 0.7171673 57 71.24914 0 0.1 0 0 0 1 
i 4.875915 -1.623847 0.7171673 68 74.89996 0 0.1 0 0 0 1 
i 2.96863 -1.195342 0.7171673 48 70.44411 0 0.1 0 0 0 1 
i 3.398048 -1.195342 0.7171673 56 71.14851 0 0.1 0 0 0 1 
i 4.691879 -0.9011905 0.7171673 65 74.5974 0 0.1 0 0 0 1 
i 4.81457 -0.9011905 0.7171673 67 74.79866 0 0.1 0 0 0 1 
i 3.029976 -0.3014259 0.7171673 49 70.54407 0 0.1 0 0 0 1 
i 3.275357 -0.3014259 0.7171673 54 70.94658 0 0.1 0 0 0 1 
i 4.569188 -0.1840232 2.055779 66 74.39614 0 0.1 0 0 0 1 
i 4.93726 -0.1840232 2.055779 68 74.99992 0 0.1 0 0 0 1 
i 2.784594 0.4157414 0.7171673 52 70.14155 0 0.1 0 0 0 1 
i 3.520739 0.4157414 0.7171673 56 71.3491 0 0.1 0 0 0 1 
i 4.630533 0.4374213 0.7171673 67 74.4961 0 0.1 0 0 0 1 
i 4.998606 0.4374213 1.434335 69 75.09987 0 0.1 0 0 0 1 
i 1 0.790267 0.5378755 53 70.1496 0 0.1 0 0 0 1 
i 6.353782 0.9736089 0.7171673 76 78.65073 0 0.1 0 0 0 1 
i 2.845939 1.098032 0.7171673 53 70.24151 0 0.1 0 0 0 1 
i 3.029976 1.098032 0.7171673 50 70.5434 0 0.1 0 0 0 1 
i 3.275357 1.098032 1.434335 54 70.94591 0 0.1 0 0 0 1 
i 3.582084 1.098032 1.434335 57 71.44906 0 0.1 0 0 0 1 
i 4.753224 1.154589 0.7171673 65 74.69736 0 0.1 0 0 0 1 
i 6.415127 1.732261 0.7171673 78 78.75069 0 0.1 0 0 0 1 
i 1.061345 1.795294 0.5378755 55 70.24956 0 0.1 0 0 0 1 
i 2.784594 1.815199 0.7171673 52 70.14088 0 0.1 0 0 0 1 
i 3.091321 1.815199 0.7171673 49 70.64403 0 0.1 0 0 0 1 
i 5.059951 2.300704 0.7171673 68 75.19983 0 0.1 0 0 0 1 
i 1 2.333169 0.5378755 54 70.14893 0 0.1 0 0 0 1 
i 6.353782 2.449428 0.7171673 77 78.65006 0 0.1 0 0 0 1 
i 2.907285 2.531623 0.7171673 53 70.34147 0 0.1 0 0 0 1 
i 3.029976 2.531623 0.7171673 51 70.54273 0 0.1 0 0 0 1 
i 3.275357 2.531623 0.7171673 55 70.94524 0 0.1 0 0 0 1 
i 3.64343 2.531623 0.7171673 58 71.54901 0 0.1 0 0 0 1 
i 4.569188 3.017871 2.12271 63 74.3948 0 0.1 0 0 0 1 
i 6.476473 3.244076 0.7171673 79 78.85065 0 0.1 0 0 0 1 
i 2.784594 3.24879 2.049984 52 70.14021 0 0.1 0 0 0 1 
i 3.152666 3.24879 1.332817 49 70.74398 0 0.1 0 0 0 1 
i 3.398048 3.24879 2.049984 54 71.1465 0 0.1 0 0 0 1 
i 3.520739 3.24879 0.7171673 56 71.34776 0 0.1 0 0 0 1 
i 1.122691 3.375828 0.5378755 56 70.34952 0 0.1 0 0 0 1 
i 5.059951 3.706246 1.434335 69 75.19916 0 0.1 0 0 0 1 
i 2.907285 3.86444 0.7171673 53 70.3408 0 0.1 0 0 0 1 
i 3.029976 3.86444 1.434335 51 70.54205 0 0.1 0 0 0 1 
i 3.275357 3.86444 1.434335 55 70.94457 0 0.1 0 0 0 1 
i 3.582084 3.86444 1.434335 57 71.44771 0 0.1 0 0 0 1 
i 3.64343 3.86444 1.434335 58 71.54834 0 0.1 0 0 0 1 
i 1 3.913703 0.5378755 55 70.14826 0 0.1 0 0 0 1 
i 6.353782 3.961244 0.7171673 77 78.64939 0 0.1 0 0 0 1 
i 3.152666 4.581607 0.7171673 50 70.74331 0 0.1 0 0 0 1 
i 3.336703 4.581607 0.7171673 56 71.0452 0 0.1 0 0 0 1 
i 6.415127 4.649619 0.7171673 78 78.74935 0 0.1 0 0 0 1 
i 6.476473 4.649619 0.7171673 80 78.84998 0 0.1 0 0 0 1 
i 1.061345 4.845258 1.075751 56 70.24822 0 0.1 0 0 0 1 
i 1.122691 4.845258 1.075751 57 70.34885 0 0.1 0 0 0 1 
i 4.691879 5.14607 0.7171673 63 74.59472 0 0.1 0 0 0 1 
i 5.059951 5.14607 0.7171673 69 75.19849 0 0.1 0 0 0 1 
i 6.353782 5.366786 0.7171673 79 78.64872 0 0.1 0 0 0 1 
i 6.537818 5.366786 0.7171673 80 78.95061 0 0.1 0 0 0 1 
i 4.569188 5.863237 2.055779 64 74.39346 0 0.1 0 0 0 1 
i 5.182642 5.863237 2.055779 70 75.39975 0 0.1 0 0 0 1 
i 6.599163 6.267707 0.7171673 81 79.05057 0 0.1 0 0 0 1 
i 3.766121 6.357604 0.7171673 53 71.74893 0 0.1 0 0 0 1 
i 4.691879 6.484682 0.7171673 63 74.59405 0 0.1 0 0 0 1 
i 5.243987 6.484682 0.7171673 71 75.49971 0 0.1 0 0 0 1 
i 1.245382 6.536896 0.5378755 57 70.54943 0 0.1 0 0 0 1 
i 6.353782 6.984874 1.405542 78 78.64805 0 0.1 0 0 0 1 
i 2.784594 7.074771 0.7171673 45 70.13887 0 0.1 0 0 0 1 
i 1 7.074771 0.5378755 55 70.14692 0 0.1 0 0 0 1 
i 4.753224 7.201849 0.7171673 62 74.69468 0 0.1 0 0 0 1 
i 5.121297 7.201849 0.7171673 69 75.29845 0 0.1 0 0 0 1 
i 6.599163 7.673249 0.7171673 81 79.0499 0 0.1 0 0 0 1 
i 2.845939 7.827035 1.434335 44 70.23883 0 0.1 0 0 0 1 
i 3.766121 7.827035 0.7171673 54 71.74826 0 0.1 0 0 0 1 
i 1.061345 8.006326 0.5378755 55 70.24688 0 0.1 0 0 0 1 
i 1.245382 8.006326 0.5378755 58 70.54876 0 0.1 0 0 0 1 
i 4.81457 8.025718 0.7171673 63 74.79463 0 0.1 0 0 0 1 
i 5.059951 8.025718 0.7171673 68 75.19715 0 0.1 0 0 0 1 
i 6.353782 8.390416 0.7171673 79 78.64738 0 0.1 0 0 0 1 
i 6.660509 8.390416 0.7171673 82 79.15052 0 0.1 0 0 0 1 
i 1 8.544202 0.5378755 56 70.14625 0 0.1 0 0 0 1 
i 1.306727 8.544202 0.5378755 59 70.64939 0 0.1 0 0 0 1 
i 3.827466 8.544202 0.7171673 55 71.84889 0 0.1 0 0 0 1 
i 4.569188 8.742885 0.7171673 66 74.39212 0 0.1 0 0 0 1 
i 5.305333 8.742885 0.7171673 71 75.59966 0 0.1 0 0 0 1 
i 2.784594 9.101127 0.5378755 67 74.40017 0 0.1 0 0 0 1 
i 6.476473 9.113073 0.7171673 79 78.84797 0 0.1 0 0 0 1 
i 6.599163 9.113073 0.7171673 81 79.04922 0 0.1 0 0 0 1 
i 2.907285 9.332305 0.7171673 43 70.33878 0 0.1 0 0 0 1 
i 3.766121 9.332305 0.7171673 54 71.74759 0 0.1 0 0 0 1 
i 4.630533 9.36433 0.7171673 67 74.49208 0 0.1 0 0 0 1 
i 4.81457 9.36433 0.7171673 64 74.79396 0 0.1 0 0 0 1 
i 5.059951 9.36433 0.7171673 69 75.19648 0 0.1 0 0 0 1 
i 5.366678 9.36433 0.7171673 72 75.69962 0 0.1 0 0 0 1 
i 1.122691 9.511597 0.5378755 56 70.34683 0 0.1 0 0 0 1 
i 1.245382 9.511597 0.5378755 58 70.54809 0 0.1 0 0 0 1 
i 8.138376 9.7119 0.7171673 90 82.9013 0 0.1 0 0 0 1 
i 6.353782 9.83024 1.338612 80 78.64671 0 0.1 0 0 0 1 
i 6.721854 9.83024 0.7171673 83 79.25048 0 0.1 0 0 0 1 
i 2.845939 10.03907 1.075751 69 74.50013 0 0.1 0 0 0 1 
i 2.784594 10.04947 1.399458 44 70.13753 0 0.1 0 0 0 1 
i 3.888811 10.04947 0.7171673 56 71.94885 0 0.1 0 0 0 1 
i 1 10.04947 0.5378755 57 70.14558 0 0.1 0 0 0 1 
i 1.368072 10.04947 0.5378755 59 70.74935 0 0.1 0 0 0 1 
i 4.569188 10.0815 0.7171673 66 74.39145 0 0.1 0 0 0 1 
i 4.875915 10.0815 0.7171673 63 74.89459 0 0.1 0 0 0 1 
i 5.121297 10.0815 0.7171673 68 75.29711 0 0.1 0 0 0 1 
i 5.305333 10.0815 0.7171673 71 75.59899 0 0.1 0 0 0 1 
i 8.199721 10.40639 0.7171673 92 83.00126 0 0.1 0 0 0 1 
i 6.415127 10.45168 1.434335 81 78.74667 0 0.1 0 0 0 1 
i 6.599163 10.45168 1.434335 82 79.04855 0 0.1 0 0 0 1 
i 6.7832 10.45168 0.7171673 84 79.35044 0 0.1 0 0 0 1 
i 2.907285 10.73176 1.434335 43 70.33811 0 0.1 0 0 0 1 
i 3.766121 10.73176 1.434335 55 71.74692 0 0.1 0 0 0 1 
i 3.950157 10.73176 0.7171673 57 72.04881 0 0.1 0 0 0 1 
i 4.691879 10.73559 0.7171673 67 74.59203 0 0.1 0 0 0 1 
i 4.81457 10.73559 0.7171673 65 74.79329 0 0.1 0 0 0 1 
i 5.059951 10.73559 0.7171673 70 75.19581 0 0.1 0 0 0 1 
i 5.428024 10.73559 0.7171673 72 75.79958 0 0.1 0 0 0 1 
i 1.061345 10.91105 0.5378755 58 70.24553 0 0.1 0 0 0 1 
i 1.122691 10.91105 1.075751 57 70.34616 0 0.1 0 0 0 1 
i 1.245382 10.91105 1.075751 59 70.54742 0 0.1 0 0 0 1 
i 1.429418 10.91105 1.075751 60 70.84931 0 0.1 0 0 0 1 
i 8.138376 11.12355 0.7171673 91 82.90063 0 0.1 0 0 0 1 
i 6.537818 11.16885 0.7171673 79 78.94792 0 0.1 0 0 0 1 
i 6.721854 11.16885 0.7171673 83 79.24981 0 0.1 0 0 0 1 
i 2.96863 11.44893 0.7171673 42 70.43874 0 0.1 0 0 0 1 
i 3.888811 11.44893 0.7171673 56 71.94818 0 0.1 0 0 0 1 
i 1.184036 11.44893 0.5378755 56 70.44679 0 0.1 0 0 0 1 
i 4.569188 11.45276 1.992036 66 74.39078 0 0.1 0 0 0 1 
i 4.93726 11.45276 1.992036 64 74.99455 0 0.1 0 0 0 1 
i 5.182642 11.45276 1.992036 68 75.39706 0 0.1 0 0 0 1 
i 5.305333 11.45276 1.992036 71 75.59832 0 0.1 0 0 0 1 
i 2.907285 11.55089 0.5378755 70 74.60008 0 0.1 0 0 0 1 
i 8.261067 11.85247 0.7171673 93 83.10122 0 0.1 0 0 0 1 
i 4.691879 12.01046 1.434335 67 74.59136 0 0.1 0 0 0 1 
i 4.81457 12.01046 0.7171673 65 74.79262 0 0.1 0 0 0 1 
i 5.059951 12.01046 1.434335 70 75.19514 0 0.1 0 0 0 1 
i 5.428024 12.01046 0.7171673 72 75.79891 0 0.1 0 0 0 1 
i 2.784594 12.08876 0.5378755 69 74.39883 0 0.1 0 0 0 1 
i 6.844545 12.31497 0.7171673 82 79.4504 0 0.1 0 0 0 1 
i 3.029976 12.34285 0.7171673 42 70.5387 0 0.1 0 0 0 1 
i 3.766121 12.34285 0.7171673 54 71.74625 0 0.1 0 0 0 1 
i 8.138376 12.56964 0.7171673 92 82.89996 0 0.1 0 0 0 1 
i 5.182642 12.72763 0.7171673 69 75.39639 0 0.1 0 0 0 1 
i 5.489369 12.72763 0.7171673 73 75.89954 0 0.1 0 0 0 1 
i 1.490763 12.85903 0.5378755 59 70.94927 0 0.1 0 0 0 1 
i 2.845939 12.95643 1.075751 70 74.49878 0 0.1 0 0 0 1 
i 2.907285 12.95643 1.075751 71 74.59941 0 0.1 0 0 0 1 
i 6.353782 13.03213 0.7171673 78 78.64537 0 0.1 0 0 0 1 
i 2.784594 13.06001 1.399458 45 70.13618 0 0.1 0 0 0 1 
i 4.011502 13.06001 0.7171673 56 72.14876 0 0.1 0 0 0 1 
i 8.199721 13.1969 1.434335 93 82.99992 0 0.1 0 0 0 1 
i 8.261067 13.1969 0.7171673 94 83.10055 0 0.1 0 0 0 1 
i 1 13.39691 0.5378755 55 70.14423 0 0.1 0 0 0 1 
i 6.415127 13.72051 1.434335 77 78.74532 0 0.1 0 0 0 1 
i 6.844545 13.72051 1.434335 83 79.44973 0 0.1 0 0 0 1 
i 3.029976 13.7423 0.7171673 42 70.53803 0 0.1 0 0 0 1 
i 3.766121 13.7423 1.434335 54 71.74558 0 0.1 0 0 0 1 
i 4.072848 13.7423 1.434335 57 72.24872 0 0.1 0 0 0 1 
i 8.322412 13.91407 0.7171673 95 83.20117 0 0.1 0 0 0 1 
i 1.061345 14.32846 0.5378755 54 70.24419 0 0.1 0 0 0 1 
i 1.490763 14.32846 0.5378755 60 70.9486 0 0.1 0 0 0 1 
i 5.550715 14.39522 0.7171673 68 75.9995 0 0.1 0 0 0 1 
i 2.784594 14.45947 0.7171673 44 70.13551 0 0.1 0 0 0 1 
i 3.091321 14.45947 0.7171673 41 70.63866 0 0.1 0 0 0 1 
i 3.029976 14.57452 0.5378755 72 74.8 0 0.1 0 0 0 1 
i 8.383757 14.74464 0.7171673 95 83.30113 0 0.1 0 0 0 1 
i 1 14.86634 0.5378755 55 70.14356 0 0.1 0 0 0 1 
i 1.552109 14.86634 0.5378755 60 71.04922 0 0.1 0 0 0 1 
i 4.569188 15.11239 0.7171673 60 74.38943 0 0.1 0 0 0 1 
i 2.784594 15.11239 0.5378755 69 74.39748 0 0.1 0 0 0 1 
i 6.476473 15.16033 0.7171673 77 78.84528 0 0.1 0 0 0 1 
i 6.844545 15.16033 0.7171673 83 79.44906 0 0.1 0 0 0 1 
i 2.907285 15.17589 0.7171673 45 70.3361 0 0.1 0 0 0 1 
i 3.029976 15.17589 0.7171673 42 70.53736 0 0.1 0 0 0 1 
i 3.766121 15.17589 0.7171673 55 71.74491 0 0.1 0 0 0 1 
i 4.134193 15.17589 0.7171673 58 72.34868 0 0.1 0 0 0 1 
i 8.138376 15.46181 1.344432 92 82.89862 0 0.1 0 0 0 1 
i 4.630533 15.80077 0.7171673 58 74.48939 0 0.1 0 0 0 1 
i 5.550715 15.80077 0.7171673 68 75.99883 0 0.1 0 0 0 1 
i 1.122691 15.83373 0.5378755 54 70.34415 0 0.1 0 0 0 1 
i 1.490763 15.83373 0.5378755 60 70.94792 0 0.1 0 0 0 1 
i 6.353782 15.8775 2.055779 78 78.64403 0 0.1 0 0 0 1 
i 6.967236 15.8775 1.338612 84 79.65031 0 0.1 0 0 0 1 
i 2.784594 15.89306 2.049984 43 70.13484 0 0.1 0 0 0 1 
i 3.152666 15.89306 0.7171673 41 70.73862 0 0.1 0 0 0 1 
i 3.888811 15.89306 1.332817 54 71.94616 0 0.1 0 0 0 1 
i 4.011502 15.89306 0.7171673 56 72.14742 0 0.1 0 0 0 1 
i 2.845939 15.98006 0.5378755 69 74.49744 0 0.1 0 0 0 1 
i 3.029976 15.98006 0.5378755 72 74.79933 0 0.1 0 0 0 1 
i 8.383757 16.08907 2.09439 96 83.30046 0 0.1 0 0 0 1 
i 1 16.37161 0.5378755 55 70.14289 0 0.1 0 0 0 1 
i 1.613454 16.37161 0.5378755 61 71.14918 0 0.1 0 0 0 1 
i 6.476473 16.49895 0.7171673 77 78.84461 0 0.1 0 0 0 1 
i 7.028581 16.49895 1.434335 85 79.75027 0 0.1 0 0 0 1 
i 2.907285 16.50871 1.434335 44 70.33543 0 0.1 0 0 0 1 
i 3.029976 16.50871 1.434335 42 70.53669 0 0.1 0 0 0 1 
i 3.214012 16.50871 0.7171673 40 70.83857 0 0.1 0 0 0 1 
i 3.766121 16.50871 1.434335 55 71.74423 0 0.1 0 0 0 1 
i 4.072848 16.50871 1.434335 57 72.24738 0 0.1 0 0 0 1 
i 4.134193 16.50871 1.434335 58 72.34801 0 0.1 0 0 0 1 
i 2.784594 16.51793 0.5378755 70 74.39681 0 0.1 0 0 0 1 
i 3.091321 16.51793 0.5378755 73 74.89996 0 0.1 0 0 0 1 
i 4.569188 16.51793 0.7171673 59 74.38876 0 0.1 0 0 0 1 
i 5.61206 16.51793 0.7171673 69 76.09945 0 0.1 0 0 0 1 
i 8.138376 16.80624 1.377223 93 82.89795 0 0.1 0 0 0 1 
i 6.537818 17.21611 0.7171673 77 78.94524 0 0.1 0 0 0 1 
i 6.905891 17.21611 0.7171673 83 79.54901 0 0.1 0 0 0 1 
i 3.152666 17.22588 0.7171673 41 70.73795 0 0.1 0 0 0 1 
i 3.827466 17.22588 0.7171673 56 71.84486 0 0.1 0 0 0 1 
i 1.061345 17.23319 0.5378755 56 70.24285 0 0.1 0 0 0 1 
i 1.122691 17.23319 1.075751 54 70.34348 0 0.1 0 0 0 1 
i 1.490763 17.23319 0.5378755 61 70.94725 0 0.1 0 0 0 1 
i 1.6748 17.23319 0.5378755 62 71.24914 0 0.1 0 0 0 1 
i 4.691879 17.24059 0.7171673 57 74.58935 0 0.1 0 0 0 1 
i 5.550715 17.24059 0.7171673 68 75.99816 0 0.1 0 0 0 1 
i 2.907285 17.41988 0.5378755 70 74.5974 0 0.1 0 0 0 1 
i 3.029976 17.41988 0.5378755 72 74.79866 0 0.1 0 0 0 1 
i 1 17.77107 0.5378755 55 70.14222 0 0.1 0 0 0 1 
i 1.552109 17.77107 0.5378755 60 71.04788 0 0.1 0 0 0 1 
i 1.613454 17.77107 0.5378755 61 71.14851 0 0.1 0 0 0 1 
i 2.784594 17.95776 0.5378755 71 74.39614 0 0.1 0 0 0 1 
i 3.152666 17.95776 0.5378755 74 74.99992 0 0.1 0 0 0 1 
i 4.569188 17.95776 0.7171673 59 74.38809 0 0.1 0 0 0 1 
i 5.673405 17.95776 2.055779 70 76.19941 0 0.1 0 0 0 1 
i 6.599163 18.03998 0.7171673 78 79.0452 0 0.1 0 0 0 1 
i 6.844545 18.03998 0.7171673 82 79.44771 0 0.1 0 0 0 1 
i 8.138376 18.18346 1.997579 95 82.89727 0 0.1 0 0 0 1 
i 8.506448 18.18346 0.7171673 97 83.50105 0 0.1 0 0 0 1 
i 3.275357 18.36393 0.7171673 42 70.93853 0 0.1 0 0 0 1 
i 3.766121 18.36393 0.7171673 52 71.74356 0 0.1 0 0 0 1 
i 4.630533 18.5792 1.434335 58 74.48805 0 0.1 0 0 0 1 
i 4.691879 18.5792 0.7171673 57 74.58868 0 0.1 0 0 0 1 
i 5.734751 18.5792 0.7171673 71 76.29937 0 0.1 0 0 0 1 
i 8.261067 18.7467 1.434335 94 83.09786 0 0.1 0 0 0 1 
i 8.383757 18.7467 0.7171673 97 83.29912 0 0.1 0 0 0 1 
i 8.567794 18.7467 0.7171673 98 83.60101 0 0.1 0 0 0 1 
i 6.353782 18.75715 0.7171673 80 78.64268 0 0.1 0 0 0 1 
i 7.089927 18.75715 0.7171673 85 79.85023 0 0.1 0 0 0 1 
i 2.845939 18.75849 1.075751 72 74.4961 0 0.1 0 0 0 1 
i 2.907285 18.75849 1.075751 71 74.59673 0 0.1 0 0 0 1 
i 3.029976 18.75849 1.075751 73 74.79799 0 0.1 0 0 0 1 
i 3.214012 18.75849 1.075751 74 75.09987 0 0.1 0 0 0 1 
i 1.245382 18.84427 0.5378755 55 70.54407 0 0.1 0 0 0 1 
i 1.490763 18.84427 0.5378755 59 70.94658 0 0.1 0 0 0 1 
i 2.784594 19.0811 0.7171673 47 70.1335 0 0.1 0 0 0 1 
i 4.256884 19.0811 0.7171673 56 72.5486 0 0.1 0 0 0 1 
i 4.569188 19.11539 0.5378755 82 78.65073 0 0.1 0 0 0 1 
i 4.753224 19.29637 0.7171673 56 74.68931 0 0.1 0 0 0 1 
i 5.61206 19.29637 0.7171673 69 76.09811 0 0.1 0 0 0 1 
i 6.415127 19.37859 1.434335 81 78.74264 0 0.1 0 0 0 1 
i 6.599163 19.37859 0.7171673 78 79.04453 0 0.1 0 0 0 1 
i 6.844545 19.37859 0.7171673 83 79.44704 0 0.1 0 0 0 1 
i 7.151272 19.37859 0.7171673 86 79.95019 0 0.1 0 0 0 1 
i 1 19.38215 0.5378755 57 70.14155 0 0.1 0 0 0 1 
i 1.736145 19.38215 0.5378755 61 71.3491 0 0.1 0 0 0 1 
i 8.445103 19.46387 0.7171673 96 83.39975 0 0.1 0 0 0 1 
i 8.506448 19.46387 0.7171673 97 83.50038 0 0.1 0 0 0 1 
i 2.845939 19.76339 0.7171673 48 70.23346 0 0.1 0 0 0 1 
i 3.275357 19.76339 0.7171673 42 70.93786 0 0.1 0 0 0 1 
i 3.766121 19.76339 1.434335 51 71.74289 0 0.1 0 0 0 1 
i 4.318229 19.76339 1.434335 57 72.64855 0 0.1 0 0 0 1 
i 4.630533 20.05333 1.075751 83 78.75069 0 0.1 0 0 0 1 
i 6.660509 20.09576 0.7171673 77 79.14516 0 0.1 0 0 0 1 
i 6.905891 20.09576 0.7171673 82 79.54767 0 0.1 0 0 0 1 
i 7.089927 20.09576 0.7171673 85 79.84956 0 0.1 0 0 0 1 
i 4.81457 20.12024 0.7171673 57 74.78927 0 0.1 0 0 0 1 
i 5.550715 20.12024 0.7171673 68 75.99681 0 0.1 0 0 0 1 
i 1.061345 20.24373 1.075751 58 70.24151 0 0.1 0 0 0 1 
i 1.245382 20.24373 1.075751 55 70.5434 0 0.1 0 0 0 1 
i 1.490763 20.24373 0.5378755 59 70.94591 0 0.1 0 0 0 1 
i 1.79749 20.24373 1.075751 62 71.44906 0 0.1 0 0 0 1 
i 2.784594 20.48055 0.7171673 47 70.13283 0 0.1 0 0 0 1 
i 3.336703 20.48055 0.7171673 41 71.03849 0 0.1 0 0 0 1 
i 8.629139 20.52897 0.7171673 96 83.70096 0 0.1 0 0 0 1 
i 3.275357 20.62178 0.5378755 73 75.19983 0 0.1 0 0 0 1 
i 6.476473 20.74985 0.7171673 82 78.8426 0 0.1 0 0 0 1 
i 6.599163 20.74985 0.7171673 79 79.04386 0 0.1 0 0 0 1 
i 6.844545 20.74985 0.7171673 84 79.44637 0 0.1 0 0 0 1 
i 7.212618 20.74985 0.7171673 86 80.05015 0 0.1 0 0 0 1 
i 1.552109 20.78161 0.5378755 59 71.04654 0 0.1 0 0 0 1 
i 4.569188 20.83741 2.709873 59 74.38675 0 0.1 0 0 0 1 
i 5.796096 20.83741 0.7171673 71 76.39933 0 0.1 0 0 0 1 
i 2.784594 21.15965 0.5378755 69 74.3948 0 0.1 0 0 0 1 
i 2.907285 21.19698 0.7171673 48 70.33342 0 0.1 0 0 0 1 
i 3.275357 21.19698 0.7171673 42 70.93719 0 0.1 0 0 0 1 
i 3.766121 21.19698 0.7171673 52 71.74222 0 0.1 0 0 0 1 
i 4.379575 21.19698 0.7171673 58 72.74851 0 0.1 0 0 0 1 
i 8.138376 21.24614 0.7171673 92 82.89593 0 0.1 0 0 0 1 
i 4.81457 21.45885 1.434335 56 74.7886 0 0.1 0 0 0 1 
i 5.550715 21.45885 1.434335 68 75.99614 0 0.1 0 0 0 1 
i 5.857442 21.45885 0.7171673 72 76.49929 0 0.1 0 0 0 1 
i 6.353782 21.46702 1.274868 80 78.64134 0 0.1 0 0 0 1 
i 6.721854 21.46702 1.274868 78 79.24512 0 0.1 0 0 0 1 
i 6.967236 21.46702 1.992036 83 79.64763 0 0.1 0 0 0 1 
i 7.089927 21.46702 1.992036 85 79.84889 0 0.1 0 0 0 1 
i 4.691879 21.56515 0.5378755 84 78.85065 0 0.1 0 0 0 1 
i 2.784594 21.65332 0.5378755 49 70.1496 0 0.1 0 0 0 1 
i 1.122691 21.67732 0.5378755 58 70.34147 0 0.1 0 0 0 1 
i 1.245382 21.67732 0.5378755 56 70.54273 0 0.1 0 0 0 1 
i 1.490763 21.67732 0.5378755 61 70.94524 0 0.1 0 0 0 1 
i 1.858836 21.67732 0.5378755 63 71.54901 0 0.1 0 0 0 1 
i 8.199721 21.87341 0.7171673 91 82.99589 0 0.1 0 0 0 1 
i 8.629139 21.87341 0.7171673 97 83.70029 0 0.1 0 0 0 1 
i 2.784594 21.91414 1.332817 47 70.13216 0 0.1 0 0 0 1 
i 3.398048 21.91414 0.7171673 41 71.13845 0 0.1 0 0 0 1 
i 3.888811 21.91414 2.049984 50 71.94348 0 0.1 0 0 0 1 
i 4.256884 21.91414 0.7171673 56 72.54725 0 0.1 0 0 0 1 
i 6.476473 22.02472 0.7171673 82 78.84193 0 0.1 0 0 0 1 
i 6.599163 22.02472 1.434335 79 79.04319 0 0.1 0 0 0 1 
i 6.844545 22.02472 0.7171673 84 79.4457 0 0.1 0 0 0 1 
i 7.212618 22.02472 1.434335 86 80.04948 0 0.1 0 0 0 1 
i 2.845939 22.02732 0.5378755 68 74.49476 0 0.1 0 0 0 1 
i 3.275357 22.02732 1.075751 74 75.19916 0 0.1 0 0 0 1 
i 4.569188 22.10303 0.5378755 83 78.64939 0 0.1 0 0 0 1 
i 5.796096 22.17602 0.7171673 71 76.39866 0 0.1 0 0 0 1 
i 1 22.2152 0.5378755 57 70.14021 0 0.1 0 0 0 1 
i 1.368072 22.2152 0.5378755 55 70.74398 0 0.1 0 0 0 1 
i 1.613454 22.2152 0.5378755 59 71.1465 0 0.1 0 0 0 1 
i 1.736145 22.2152 0.5378755 61 71.34776 0 0.1 0 0 0 1 
i 2.907285 22.52979 1.434335 48 70.33275 0 0.1 0 0 0 1 
i 3.275357 22.52979 1.434335 42 70.93652 0 0.1 0 0 0 1 
i 3.459394 22.52979 0.7171673 40 71.23841 0 0.1 0 0 0 1 
i 3.766121 22.52979 0.7171673 51 71.74155 0 0.1 0 0 0 1 
i 4.318229 22.52979 1.434335 57 72.64721 0 0.1 0 0 0 1 
i 4.379575 22.52979 1.434335 58 72.74784 0 0.1 0 0 0 1 
i 2.784594 22.56519 0.5378755 69 74.39413 0 0.1 0 0 0 1 
i 8.138376 22.59057 0.7171673 92 82.89526 0 0.1 0 0 0 1 
i 8.690484 22.59057 0.7171673 98 83.80092 0 0.1 0 0 0 1 
i 2.845939 22.65834 1.075751 44 70.24956 0 0.1 0 0 0 1 
i 6.353782 22.74189 0.7171673 81 78.64067 0 0.1 0 0 0 1 
i 6.537818 22.74189 0.7171673 82 78.94256 0 0.1 0 0 0 1 
i 6.660509 22.74189 0.7171673 80 79.14382 0 0.1 0 0 0 1 
i 7.273963 22.74189 0.7171673 87 80.1501 0 0.1 0 0 0 1 
i 4.81457 22.83011 0.7171673 57 74.78792 0 0.1 0 0 0 1 
i 5.550715 22.83011 0.7171673 70 75.99547 0 0.1 0 0 0 1 
i 5.918787 22.83011 0.7171673 72 76.59925 0 0.1 0 0 0 1 
i 4.630533 22.97069 0.5378755 84 78.74935 0 0.1 0 0 0 1 
i 4.691879 22.97069 1.075751 85 78.84998 0 0.1 0 0 0 1 
i 1.061345 23.01014 1.075751 57 70.24017 0 0.1 0 0 0 1 
i 1.122691 23.01014 1.075751 58 70.3408 0 0.1 0 0 0 1 
i 1.245382 23.01014 1.075751 56 70.54205 0 0.1 0 0 0 1 
i 1.429418 23.01014 0.5378755 55 70.84394 0 0.1 0 0 0 1 
i 1.490763 23.01014 0.5378755 60 70.94457 0 0.1 0 0 0 1 
i 1.6748 23.01014 0.5378755 59 71.24646 0 0.1 0 0 0 1 
i 1.79749 23.01014 1.075751 62 71.44771 0 0.1 0 0 0 1 
i 1.858836 23.01014 1.075751 63 71.54834 0 0.1 0 0 0 1 
i 2.96863 23.24696 0.7171673 49 70.43338 0 0.1 0 0 0 1 
i 3.398048 23.24696 0.7171673 41 71.13778 0 0.1 0 0 0 1 
i 3.827466 23.24696 0.7171673 52 71.84218 0 0.1 0 0 0 1 
i 8.261067 23.25063 0.7171673 91 83.09585 0 0.1 0 0 0 1 
i 8.629139 23.25063 0.7171673 97 83.69962 0 0.1 0 0 0 1 
i 2.907285 23.46714 0.5378755 68 74.59472 0 0.1 0 0 0 1 
i 3.275357 23.46714 0.5378755 74 75.19849 0 0.1 0 0 0 1 
i 4.753224 23.50857 0.5378755 86 78.95061 0 0.1 0 0 0 1 
i 4.569188 23.54728 3.284031 58 74.38541 0 0.1 0 0 0 1 
i 4.93726 23.54728 1.992036 55 74.98918 0 0.1 0 0 0 1 
i 5.673405 23.54728 1.274868 68 76.19673 0 0.1 0 0 0 1 
i 5.796096 23.54728 1.992036 71 76.39799 0 0.1 0 0 0 1 
i 1.184036 23.54802 0.5378755 59 70.44143 0 0.1 0 0 0 1 
i 1.552109 23.54802 0.5378755 61 71.0452 0 0.1 0 0 0 1 
i 1.613454 23.54802 0.5378755 60 71.14583 0 0.1 0 0 0 1 
i 8.138376 23.9678 1.280411 93 82.89459 0 0.1 0 0 0 1 
i 8.75183 23.9678 1.997579 99 83.90088 0 0.1 0 0 0 1 
i 2.784594 24.00502 0.5378755 70 74.39346 0 0.1 0 0 0 1 
i 3.398048 24.00502 0.5378755 75 75.39975 0 0.1 0 0 0 1 
i 3.029976 24.06416 0.7171673 48 70.53333 0 0.1 0 0 0 1 
i 3.275357 24.06416 0.7171673 44 70.93585 0 0.1 0 0 0 1 
i 3.766121 24.06416 0.7171673 53 71.74088 0 0.1 0 0 0 1 
i 4.630533 24.10498 0.7171673 57 74.48537 0 0.1 0 0 0 1 
i 4.81457 24.10498 1.434335 56 74.78725 0 0.1 0 0 0 1 
i 5.550715 24.10498 1.434335 70 75.9948 0 0.1 0 0 0 1 
i 5.918787 24.10498 0.7171673 72 76.59857 0 0.1 0 0 0 1 
i 2.907285 24.23888 1.259617 46 70.34952 0 0.1 0 0 0 1 
i 7.335308 24.40949 0.7171673 82 80.25006 0 0.1 0 0 0 1 
i 8.261067 24.53104 1.434335 92 83.09518 0 0.1 0 0 0 1 
i 8.629139 24.53104 1.434335 98 83.69895 0 0.1 0 0 0 1 
i 4.81457 24.58878 0.5378755 86 79.05057 0 0.1 0 0 0 1 
i 3.520739 24.78133 0.7171673 41 71.33836 0 0.1 0 0 0 1 
i 4.011502 24.78133 2.698142 50 72.1434 0 0.1 0 0 0 1 
i 4.256884 24.78133 0.7171673 55 72.54591 0 0.1 0 0 0 1 
i 2.845939 24.80576 0.5378755 70 74.49342 0 0.1 0 0 0 1 
i 2.907285 24.80576 1.075751 69 74.59405 0 0.1 0 0 0 1 
i 3.275357 24.80576 1.075751 75 75.19782 0 0.1 0 0 0 1 
i 3.459394 24.80576 0.5378755 76 75.49971 0 0.1 0 0 0 1 
i 4.753224 24.82215 0.7171673 59 74.68662 0 0.1 0 0 0 1 
i 5.673405 24.82215 0.7171673 69 76.19606 0 0.1 0 0 0 1 
i 5.980132 24.82215 0.7171673 73 76.6992 0 0.1 0 0 0 1 
i 4.569188 25.12666 0.5378755 84 78.64805 0 0.1 0 0 0 1 
i 6.353782 25.12666 0.7171673 74 78.64 0 0.1 0 0 0 1 
i 8.322412 25.24821 0.7171673 91 83.19581 0 0.1 0 0 0 1 
i 2.96863 25.34363 0.5378755 68 74.69468 0 0.1 0 0 0 1 
i 3.336703 25.34363 0.5378755 74 75.29845 0 0.1 0 0 0 1 
i 2.845939 25.39698 0.7171673 45 70.23078 0 0.1 0 0 0 1 
i 3.029976 25.39698 0.7171673 48 70.53266 0 0.1 0 0 0 1 
i 3.275357 25.39698 1.434335 44 70.93518 0 0.1 0 0 0 1 
i 3.582084 25.39698 0.7171673 40 71.43832 0 0.1 0 0 0 1 
i 3.766121 25.39698 0.7171673 53 71.74021 0 0.1 0 0 0 1 
i 4.318229 25.39698 4.069009 54 72.64587 0 0.1 0 0 0 1 
i 1.981527 25.5033 0.5378755 59 71.74893 0 0.1 0 0 0 1 
i 2.845939 25.70831 0.5378755 53 70.24822 0 0.1 0 0 0 1 
i 2.907285 25.70831 0.5378755 55 70.34885 0 0.1 0 0 0 1 
i 6.415127 25.81503 0.7171673 72 78.73996 0 0.1 0 0 0 1 
i 7.335308 25.81503 1.434335 83 80.24939 0 0.1 0 0 0 1 
i 5.059951 25.87953 0.7171673 57 75.1891 0 0.1 0 0 0 1 
i 5.550715 25.87953 0.7171673 66 75.99413 0 0.1 0 0 0 1 
i 4.630533 25.99432 1.075751 84 78.74801 0 0.1 0 0 0 1 
i 4.81457 25.99432 1.075751 87 79.0499 0 0.1 0 0 0 1 
i 8.383757 26.00508 0.7171673 92 83.29577 0 0.1 0 0 0 1 
i 8.629139 26.00508 0.7171673 97 83.69828 0 0.1 0 0 0 1 
i 1 26.04118 0.5378755 51 70.13887 0 0.1 0 0 0 1 
i 2.784594 26.11414 0.7171673 46 70.13015 0 0.1 0 0 0 1 
i 3.091321 26.11414 0.7171673 49 70.63329 0 0.1 0 0 0 1 
i 3.520739 26.11414 0.7171673 41 71.33769 0 0.1 0 0 0 1 
i 4.256884 26.11414 0.7171673 55 72.54524 0 0.1 0 0 0 1 
i 2.784594 26.24618 0.5378755 54 70.14759 0 0.1 0 0 0 1 
i 2.96863 26.24618 0.5378755 56 70.44948 0 0.1 0 0 0 1 
i 3.029976 26.34679 0.5378755 69 74.79463 0 0.1 0 0 0 1 
i 3.275357 26.34679 0.5378755 73 75.19715 0 0.1 0 0 0 1 
i 6.353782 26.5322 0.7171673 73 78.63933 0 0.1 0 0 0 1 
i 4.569188 26.5967 0.7171673 61 74.38407 0 0.1 0 0 0 1 
i 6.041478 26.5967 0.7171673 71 76.79916 0 0.1 0 0 0 1 
i 8.138376 26.72224 0.7171673 95 82.89325 0 0.1 0 0 0 1 
i 8.874521 26.72224 0.7171673 99 84.1008 0 0.1 0 0 0 1 
i 2.907285 26.7623 0.7171673 45 70.33073 0 0.1 0 0 0 1 
i 3.029976 26.7623 0.7171673 47 70.53199 0 0.1 0 0 0 1 
i 3.275357 26.7623 0.7171673 43 70.93451 0 0.1 0 0 0 1 
i 3.64343 26.7623 0.7171673 40 71.53828 0 0.1 0 0 0 1 
i 3.766121 26.7623 0.7171673 52 71.73954 0 0.1 0 0 0 1 
i 4.502266 26.7623 0.7171673 57 72.94709 0 0.1 0 0 0 1 
i 2.784594 26.88467 0.5378755 71 74.39212 0 0.1 0 0 0 1 
i 3.520739 26.88467 0.5378755 76 75.59966 0 0.1 0 0 0 1 
i 1.061345 26.97273 0.5378755 50 70.23883 0 0.1 0 0 0 1 
i 1.981527 26.97273 0.5378755 59 71.74826 0 0.1 0 0 0 1 
i 6.353782 27.06491 0.5378755 96 82.9013 0 0.1 0 0 0 1 
i 4.630533 27.21815 1.434335 62 74.48403 0 0.1 0 0 0 1 
i 5.059951 27.21815 1.434335 56 75.18843 0 0.1 0 0 0 1 
i 5.550715 27.21815 0.7171673 66 75.99346 0 0.1 0 0 0 1 
i 6.102823 27.21815 0.7538753 72 76.89912 0 0.1 0 0 0 1 
i 7.335308 27.25485 0.7171673 83 80.24872 0 0.1 0 0 0 1 
i 8.199721 27.28549 0.7171673 96 82.99321 0 0.1 0 0 0 1 
i 8.383757 27.28549 1.434335 92 83.29509 0 0.1 0 0 0 1 
i 8.629139 27.28549 0.7171673 97 83.69761 0 0.1 0 0 0 1 
i 8.935866 27.28549 1.434335 100 84.20075 0 0.1 0 0 0 1 
i 3.029976 27.39994 0.5378755 35 70.54943 0 0.1 0 0 0 1 
i 4.691879 27.43415 0.5378755 84 78.84797 0 0.1 0 0 0 1 
i 4.81457 27.43415 0.5378755 87 79.04922 0 0.1 0 0 0 1 
i 2.784594 27.47947 0.7171673 46 70.12948 0 0.1 0 0 0 1 
i 3.152666 27.47947 1.269349 49 70.73325 0 0.1 0 0 0 1 
i 3.398048 27.47947 1.986517 44 71.13577 0 0.1 0 0 0 1 
i 3.520739 27.47947 1.269349 42 71.33702 0 0.1 0 0 0 1 
i 4.011502 27.47947 1.986517 51 72.14205 0 0.1 0 0 0 1 
i 4.256884 27.47947 1.269349 56 72.54457 0 0.1 0 0 0 1 
i 4.624956 27.47947 1.986517 58 73.14834 0 0.1 0 0 0 1 
i 1 27.51061 0.5378755 51 70.1382 0 0.1 0 0 0 1 
i 2.042872 27.51061 0.5378755 60 71.84889 0 0.1 0 0 0 1 
i 2.845939 27.6854 1.075751 72 74.49208 0 0.1 0 0 0 1 
i 3.029976 27.6854 1.075751 69 74.79396 0 0.1 0 0 0 1 
i 3.275357 27.6854 0.5378755 74 75.19648 0 0.1 0 0 0 1 
i 3.582084 27.6854 0.5378755 77 75.69962 0 0.1 0 0 0 1 
i 5.61206 27.93531 0.7171673 65 76.09409 0 0.1 0 0 0 1 
i 6.041478 27.93531 3.363297 71 76.79849 0 0.1 0 0 0 1 
i 2.784594 27.93782 0.5378755 41 70.14692 0 0.1 0 0 0 1 
i 6.415127 27.93869 0.5378755 98 83.00126 0 0.1 0 0 0 1 
i 4.569188 27.97202 0.5378755 86 78.64671 0 0.1 0 0 0 1 
i 4.93726 27.97202 0.5378755 88 79.25048 0 0.1 0 0 0 1 
i 6.353782 27.97202 0.7171673 73 78.63866 0 0.1 0 0 0 1 
i 7.457999 27.97202 2.055779 84 80.44998 0 0.1 0 0 0 1 
i 8.138376 28.00265 0.7171673 95 82.89258 0 0.1 0 0 0 1 
i 8.690484 28.00265 0.7171673 96 83.79824 0 0.1 0 0 0 1 
i 2.845939 28.03165 1.434335 47 70.22943 0 0.1 0 0 0 1 
i 2.907285 28.03165 1.434335 45 70.33006 0 0.1 0 0 0 1 
i 3.029976 28.03165 1.434335 48 70.53132 0 0.1 0 0 0 1 
i 3.275357 28.03165 1.434335 43 70.93384 0 0.1 0 0 0 1 
i 3.64343 28.03165 1.434335 41 71.53761 0 0.1 0 0 0 1 
i 3.766121 28.03165 1.434335 53 71.73887 0 0.1 0 0 0 1 
i 4.134193 28.03165 1.434335 50 72.34264 0 0.1 0 0 0 1 
i 4.379575 28.03165 1.434335 55 72.74516 0 0.1 0 0 0 1 
i 4.502266 28.03165 1.434335 57 72.94642 0 0.1 0 0 0 1 
i 3.336703 28.22328 0.5378755 73 75.29711 0 0.1 0 0 0 1 
i 3.520739 28.22328 0.5378755 76 75.59899 0 0.1 0 0 0 1 
i 6.353782 28.47656 0.5378755 97 82.90063 0 0.1 0 0 0 1 
i 1.122691 28.478 0.5378755 49 70.33878 0 0.1 0 0 0 1 
i 1.981527 28.478 0.5378755 59 71.74759 0 0.1 0 0 0 1 
i 4.691879 28.58941 1.005555 63 74.58398 0 0.1 0 0 0 1 
i 5.550715 28.58941 0.7171673 66 75.99279 0 0.1 0 0 0 1 
i 6.164169 28.58941 1.992036 72 76.99908 0 0.1 0 0 0 1 
i 7.519345 28.59347 0.7171673 85 80.54994 0 0.1 0 0 0 1 
i 8.261067 28.59713 0.7171673 96 83.09317 0 0.1 0 0 0 1 
i 8.383757 28.59713 1.434335 94 83.29442 0 0.1 0 0 0 1 
i 8.629139 28.59713 0.7171673 98 83.69694 0 0.1 0 0 0 1 
i 8.997212 28.59713 0.7171673 101 84.30071 0 0.1 0 0 0 1 
i 2.784594 28.74882 0.7171673 46 70.12881 0 0.1 0 0 0 1 
i 3.704775 28.74882 0.7171673 40 71.63824 0 0.1 0 0 0 1 
i 3.827466 28.74882 0.7171673 52 71.8395 0 0.1 0 0 0 1 
i 4.630533 28.77276 1.075751 87 78.74667 0 0.1 0 0 0 1 
i 4.691879 28.77276 1.075751 85 78.8473 0 0.1 0 0 0 1 
i 4.81457 28.77276 1.075751 88 79.04855 0 0.1 0 0 0 1 
i 4.998606 28.77276 0.5378755 89 79.35044 0 0.1 0 0 0 1 
i 2.845939 28.86938 0.5378755 52 70.24688 0 0.1 0 0 0 1 
i 3.029976 28.86938 0.5378755 57 70.54876 0 0.1 0 0 0 1 
i 1 29.01588 0.5378755 51 70.13753 0 0.1 0 0 0 1 
i 2.104217 29.01588 0.5378755 61 71.94885 0 0.1 0 0 0 1 
i 2.907285 29.05666 0.5378755 73 74.59203 0 0.1 0 0 0 1 
i 3.029976 29.05666 1.075751 71 74.79329 0 0.1 0 0 0 1 
i 3.275357 29.05666 0.5378755 75 75.19581 0 0.1 0 0 0 1 
i 3.64343 29.05666 0.5378755 77 75.79958 0 0.1 0 0 0 1 
i 4.569188 29.30657 1.274868 61 74.38273 0 0.1 0 0 0 1 
i 5.182642 29.30657 1.992036 55 75.38901 0 0.1 0 0 0 1 
i 5.673405 29.30657 1.992036 65 76.19405 0 0.1 0 0 0 1 
i 6.537818 29.31063 0.7171673 71 78.93987 0 0.1 0 0 0 1 
i 7.396654 29.31063 0.7171673 83 80.34868 0 0.1 0 0 0 1 
i 4.569188 29.31063 0.5378755 86 78.64604 0 0.1 0 0 0 1 
i 8.506448 29.31429 1.219439 92 83.49568 0 0.1 0 0 0 1 
i 8.75183 29.31429 1.219439 97 83.8982 0 0.1 0 0 0 1 
i 8.874521 29.31429 1.936607 99 84.09945 0 0.1 0 0 0 1 
i 6.476473 29.38477 0.5378755 99 83.10122 0 0.1 0 0 0 1 
i 2.784594 29.40725 0.5378755 53 70.14625 0 0.1 0 0 0 1 
i 3.091321 29.40725 0.5378755 58 70.64939 0 0.1 0 0 0 1 
i 3.152666 29.59454 0.5378755 69 74.99455 0 0.1 0 0 0 1 
i 3.398048 29.59454 0.5378755 74 75.39706 0 0.1 0 0 0 1 
i 3.520739 29.59454 0.5378755 76 75.59832 0 0.1 0 0 0 1 
i 8.199721 29.81657 1.434335 95 82.99187 0 0.1 0 0 0 1 
i 8.261067 29.81657 1.434335 96 83.09249 0 0.1 0 0 0 1 
i 8.383757 29.81657 0.7171673 93 83.29375 0 0.1 0 0 0 1 
i 8.629139 29.81657 1.434335 98 83.69627 0 0.1 0 0 0 1 
i 8.997212 29.81657 1.434335 101 84.30004 0 0.1 0 0 0 1 
i 4.691879 29.86428 1.434335 63 74.58331 0 0.1 0 0 0 1 
i 5.059951 29.86428 1.434335 56 75.18709 0 0.1 0 0 0 1 
i 5.734751 29.86428 0.7171673 64 76.294 0 0.1 0 0 0 1 
i 1.061345 29.87746 0.5378755 50 70.23748 0 0.1 0 0 0 1 
i 1.122691 29.87746 1.075751 49 70.33811 0 0.1 0 0 0 1 
i 1.981527 29.87746 1.075751 60 71.74692 0 0.1 0 0 0 1 
i 2.165563 29.87746 0.5378755 62 72.04881 0 0.1 0 0 0 1 
i 6.353782 29.92265 0.5378755 97 82.89996 0 0.1 0 0 0 1 
i 4.630533 29.99503 0.5378755 58 74.50013 0 0.1 0 0 0 1 
i 6.599163 30.1345 0.7171673 71 79.03983 0 0.1 0 0 0 1 
i 7.335308 30.1345 0.7171673 82 80.24738 0 0.1 0 0 0 1 
i 2.845939 30.33153 1.075751 72 74.49073 0 0.1 0 0 0 1 
i 2.907285 30.33153 1.075751 73 74.59136 0 0.1 0 0 0 1 
i 3.029976 30.33153 1.075751 70 74.79262 0 0.1 0 0 0 1 
i 3.214012 30.33153 0.5378755 69 75.09451 0 0.1 0 0 0 1 
i 3.275357 30.33153 1.075751 75 75.19514 0 0.1 0 0 0 1 
i 3.459394 30.33153 1.075751 74 75.49702 0 0.1 0 0 0 1 
i 3.582084 30.33153 1.075751 76 75.69828 0 0.1 0 0 0 1 
i 3.64343 30.33153 1.075751 77 75.79891 0 0.1 0 0 0 1 
i 2.907285 30.37465 1.075751 45 70.34683 0 0.1 0 0 0 1 
i 3.029976 30.37465 1.075751 44 70.54809 0 0.1 0 0 0 1 
i 1.184036 30.41534 0.5378755 48 70.43874 0 0.1 0 0 0 1 
i 2.104217 30.41534 0.5378755 61 71.94818 0 0.1 0 0 0 1 
i 4.569188 30.53291 0.5378755 59 74.3995 0 0.1 0 0 0 1 
i 8.445103 30.53373 0.7171673 94 83.39438 0 0.1 0 0 0 1 
i 8.506448 30.53373 0.7171673 93 83.49501 0 0.1 0 0 0 1 
i 8.874521 30.53373 0.7171673 100 84.09878 0 0.1 0 0 0 1 
i 4.569188 30.58144 0.7171673 62 74.38205 0 0.1 0 0 0 1 
i 5.61206 30.58144 0.7171673 66 76.09275 0 0.1 0 0 0 1 
i 6.225514 30.58144 0.9873939 73 77.09904 0 0.1 0 0 0 1 
i 5.059951 30.63604 0.5378755 87 79.4504 0 0.1 0 0 0 1 
i 6.415127 30.7292 0.5378755 98 82.99992 0 0.1 0 0 0 1 
i 6.476473 30.7292 1.075751 99 83.10055 0 0.1 0 0 0 1 
i 7.58069 30.85167 0.7171673 85 80.6499 0 0.1 0 0 0 1 
i 3.091321 30.86941 0.5378755 71 74.89325 0 0.1 0 0 0 1 
i 4.569188 31.17392 0.5378755 83 78.64537 0 0.1 0 0 0 1 
i 6.537818 31.26708 0.5378755 100 83.20117 0 0.1 0 0 0 1 
i 4.81457 31.33193 0.7171673 63 74.7839 0 0.1 0 0 0 1 
i 5.059951 31.33193 0.7171673 58 75.18642 0 0.1 0 0 0 1 
i 5.550715 31.33193 0.7171673 67 75.99145 0 0.1 0 0 0 1 
i 6.28686 31.33193 0.7171673 72 77.19899 0 0.1 0 0 0 1 
i 6.415127 31.47311 0.7171673 74 78.73727 0 0.1 0 0 0 1 
i 6.599163 31.47311 1.434335 70 79.03916 0 0.1 0 0 0 1 
i 7.335308 31.47311 0.7171673 83 80.24671 0 0.1 0 0 0 1 
i 7.642036 31.47311 0.7171673 86 80.74985 0 0.1 0 0 0 1 
i 1.245382 31.48855 0.5378755 49 70.5387 0 0.1 0 0 0 1 
i 1.981527 31.48855 0.5378755 59 71.74625 0 0.1 0 0 0 1 
i 4.691879 31.50685 0.5378755 60 74.60008 0 0.1 0 0 0 1 
i 2.845939 31.7741 0.5378755 38 70.24553 0 0.1 0 0 0 1 
i 2.907285 31.7741 1.075751 40 70.34616 0 0.1 0 0 0 1 
i 3.029976 31.7741 1.075751 37 70.54742 0 0.1 0 0 0 1 
i 3.214012 31.7741 0.5378755 35 70.84931 0 0.1 0 0 0 1 
i 1 32.02642 0.5378755 51 70.13618 0 0.1 0 0 0 1 
i 2.226908 32.02642 0.5378755 61 72.14876 0 0.1 0 0 0 1 
i 4.630533 32.04158 1.075751 83 78.74532 0 0.1 0 0 0 1 
i 5.059951 32.04158 0.5378755 88 79.44973 0 0.1 0 0 0 1 
i 4.569188 32.04472 0.5378755 61 74.39883 0 0.1 0 0 0 1 
i 4.569188 32.0491 0.7171673 60 74.38138 0 0.1 0 0 0 1 
i 5.305333 32.0491 2.580831 55 75.58893 0 0.1 0 0 0 1 
i 5.796096 32.0491 0.7171673 65 76.39396 0 0.1 0 0 0 1 
i 6.041478 32.0491 2.580831 69 76.79648 0 0.1 0 0 0 1 
i 9.119902 32.09765 0.7171673 96 84.50063 0 0.1 0 0 0 1 
i 6.353782 32.19028 1.850851 73 78.63665 0 0.1 0 0 0 1 
i 7.396654 32.19028 0.7171673 82 80.34734 0 0.1 0 0 0 1 
i 7.58069 32.19028 0.7171673 85 80.64922 0 0.1 0 0 0 1 
i 6.599163 32.27694 0.5378755 100 83.30113 0 0.1 0 0 0 1 
i 2.784594 32.31198 0.5378755 39 70.14491 0 0.1 0 0 0 1 
i 3.152666 32.31198 0.5378755 36 70.74868 0 0.1 0 0 0 1 
i 5.121297 32.57946 0.5378755 89 79.55036 0 0.1 0 0 0 1 
i 4.630533 32.6068 0.7171673 59 74.48134 0 0.1 0 0 0 1 
i 4.81457 32.6068 1.434335 63 74.78323 0 0.1 0 0 0 1 
i 5.059951 32.6068 1.434335 58 75.18574 0 0.1 0 0 0 1 
i 5.550715 32.6068 0.7171673 67 75.99078 0 0.1 0 0 0 1 
i 5.857442 32.6068 0.7171673 64 76.49392 0 0.1 0 0 0 1 
i 6.28686 32.6068 0.7171673 72 77.19832 0 0.1 0 0 0 1 
i 3.766121 32.7163 0.5378755 73 75.9995 0 0.1 0 0 0 1 
i 6.353782 32.81481 0.5378755 98 82.89862 0 0.1 0 0 0 1 
i 8.138376 32.81481 0.7171673 88 82.89057 0 0.1 0 0 0 1 
i 6.599163 32.84438 0.7171673 71 79.03849 0 0.1 0 0 0 1 
i 7.335308 32.84438 0.7171673 84 80.24604 0 0.1 0 0 0 1 
i 7.703381 32.84438 0.7171673 86 80.84981 0 0.1 0 0 0 1 
i 1.061345 32.888 1.075751 51 70.23614 0 0.1 0 0 0 1 
i 1.245382 32.888 1.075751 48 70.53803 0 0.1 0 0 0 1 
i 1.981527 32.888 1.075751 59 71.74558 0 0.1 0 0 0 1 
i 2.288254 32.888 1.075751 62 72.24872 0 0.1 0 0 0 1 
i 4.630533 32.91239 0.5378755 67 74.49878 0 0.1 0 0 0 1 
i 4.691879 32.91239 0.5378755 69 74.59941 0 0.1 0 0 0 1 
i 2.784594 33.25417 0.5378755 66 74.38943 0 0.1 0 0 0 1 
i 4.569188 33.32396 0.7171673 60 74.38071 0 0.1 0 0 0 1 
i 5.61206 33.32396 0.7171673 68 76.0914 0 0.1 0 0 0 1 
i 5.796096 33.32396 0.7171673 65 76.39329 0 0.1 0 0 0 1 
i 8.199721 33.44208 3.374802 87 82.99052 0 0.1 0 0 0 1 
i 9.119902 33.44208 0.7171673 97 84.49996 0 0.1 0 0 0 1 
i 4.569188 33.45026 0.5378755 68 74.39816 0 0.1 0 0 0 1 
i 4.753224 33.45026 0.5378755 70 74.70004 0 0.1 0 0 0 1 
i 4.691879 33.48141 0.5378755 83 78.84528 0 0.1 0 0 0 1 
i 5.059951 33.48141 0.5378755 88 79.44906 0 0.1 0 0 0 1 
i 6.353782 33.56154 2.999713 72 78.63597 0 0.1 0 0 0 1 
i 6.721854 33.56154 1.992036 69 79.23975 0 0.1 0 0 0 1 
i 7.457999 33.56154 0.7171673 83 80.4473 0 0.1 0 0 0 1 
i 7.58069 33.56154 1.274868 85 80.64855 0 0.1 0 0 0 1 
i 6.415127 33.62137 0.5378755 98 82.99857 0 0.1 0 0 0 1 
i 6.599163 33.62137 1.075751 101 83.30046 0 0.1 0 0 0 1 
i 3.275357 33.72208 0.5378755 57 70.94927 0 0.1 0 0 0 1 
i 4.691879 33.91276 0.7171673 59 74.5813 0 0.1 0 0 0 1 
i 4.81457 33.91276 0.7171673 62 74.78256 0 0.1 0 0 0 1 
i 5.059951 33.91276 0.7171673 57 75.18507 0 0.1 0 0 0 1 
i 5.550715 33.91276 0.7171673 66 75.9901 0 0.1 0 0 0 1 
i 5.918787 33.91276 0.7171673 64 76.59388 0 0.1 0 0 0 1 
i 6.28686 33.91276 0.9236505 71 77.19765 0 0.1 0 0 0 1 
i 4.569188 34.01928 0.5378755 84 78.64403 0 0.1 0 0 0 1 
i 5.182642 34.01928 0.5378755 89 79.65031 0 0.1 0 0 0 1 
i 6.599163 34.11924 0.7171673 70 79.03782 0 0.1 0 0 0 1 
i 7.335308 34.11924 1.434335 84 80.24537 0 0.1 0 0 0 1 
i 7.519345 34.11924 0.7171673 83 80.54725 0 0.1 0 0 0 1 
i 7.703381 34.11924 1.434335 86 80.84914 0 0.1 0 0 0 1 
i 2.845939 34.12184 0.5378755 64 74.48939 0 0.1 0 0 0 1 
i 3.766121 34.12184 1.075751 74 75.99883 0 0.1 0 0 0 1 
i 6.353782 34.15925 0.5378755 99 82.89795 0 0.1 0 0 0 1 
i 9.181248 34.15925 0.7171673 98 84.60059 0 0.1 0 0 0 1 
i 2.784594 34.25996 0.5378755 51 70.14423 0 0.1 0 0 0 1 
i 1.122691 34.32159 0.5378755 51 70.3361 0 0.1 0 0 0 1 
i 1.245382 34.32159 1.075751 49 70.53736 0 0.1 0 0 0 1 
i 1.981527 34.32159 1.075751 61 71.74491 0 0.1 0 0 0 1 
i 2.349599 34.32159 0.5378755 63 72.34868 0 0.1 0 0 0 1 
i 4.81457 34.53048 0.5378755 50 74.8 0 0.1 0 0 0 1 
i 4.569188 34.62993 1.21416 61 74.38004 0 0.1 0 0 0 1 
i 4.93726 34.62993 1.931328 63 74.98382 0 0.1 0 0 0 1 
i 5.182642 34.62993 0.7171673 58 75.38633 0 0.1 0 0 0 1 
i 5.305333 34.62993 1.931328 56 75.58759 0 0.1 0 0 0 1 
i 5.673405 34.62993 1.21416 68 76.19136 0 0.1 0 0 0 1 
i 5.796096 34.62993 0.7171673 65 76.39262 0 0.1 0 0 0 1 
i 6.041478 34.62993 1.931328 70 76.79514 0 0.1 0 0 0 1 
i 6.40955 34.62993 1.21416 73 77.39891 0 0.1 0 0 0 1 
i 2.784594 34.65972 0.5378755 65 74.38876 0 0.1 0 0 0 1 
i 9.119902 34.8193 0.7171673 97 84.49929 0 0.1 0 0 0 1 
i 4.630533 34.82002 1.075751 84 78.74398 0 0.1 0 0 0 1 
i 4.691879 34.82002 0.5378755 83 78.84461 0 0.1 0 0 0 1 
i 5.059951 34.82002 1.075751 89 79.44839 0 0.1 0 0 0 1 
i 5.243987 34.82002 1.075751 90 79.75027 0 0.1 0 0 0 1 
i 6.537818 34.83641 0.7171673 73 78.93719 0 0.1 0 0 0 1 
i 6.660509 34.83641 0.7171673 71 79.13845 0 0.1 0 0 0 1 
i 7.457999 34.83641 0.7171673 83 80.44662 0 0.1 0 0 0 1 
i 1.368072 34.85947 0.5378755 47 70.73862 0 0.1 0 0 0 1 
i 2.104217 34.85947 0.5378755 59 71.94616 0 0.1 0 0 0 1 
i 6.476473 34.99859 0.5378755 99 83.09853 0 0.1 0 0 0 1 
i 6.599163 34.99859 0.5378755 101 83.29979 0 0.1 0 0 0 1 
i 4.569188 35.06835 0.7757362 55 74.39748 0 0.1 0 0 0 1 
i 4.691879 35.12692 1.434335 60 74.58063 0 0.1 0 0 0 1 
i 4.81457 35.12692 1.434335 62 74.78189 0 0.1 0 0 0 1 
i 5.059951 35.12692 1.434335 57 75.1844 0 0.1 0 0 0 1 
i 5.243987 35.12692 1.434335 59 75.48629 0 0.1 0 0 0 1 
i 5.550715 35.12692 1.434335 67 75.98943 0 0.1 0 0 0 1 
i 5.857442 35.12692 1.434335 66 76.49258 0 0.1 0 0 0 1 
i 5.918787 35.12692 1.434335 64 76.59321 0 0.1 0 0 0 1 
i 6.164169 35.12692 1.434335 69 76.99572 0 0.1 0 0 0 1 
i 2.845939 35.19151 0.5378755 43 70.24419 0 0.1 0 0 0 1 
i 3.275357 35.19151 0.5378755 31 70.9486 0 0.1 0 0 0 1 
i 4.753224 35.35789 0.5378755 82 78.94524 0 0.1 0 0 0 1 
i 6.353782 35.53647 0.5378755 100 82.89727 0 0.1 0 0 0 1 
i 6.721854 35.53647 0.5378755 102 83.50105 0 0.1 0 0 0 1 
i 9.242593 35.53647 1.997579 98 84.70055 0 0.1 0 0 0 1 
i 2.907285 35.56166 0.5378755 64 74.58935 0 0.1 0 0 0 1 
i 3.766121 35.56166 0.5378755 74 75.99816 0 0.1 0 0 0 1 
i 1.061345 35.65441 1.075751 49 70.2348 0 0.1 0 0 0 1 
i 1.122691 35.65441 0.5378755 50 70.33543 0 0.1 0 0 0 1 
i 1.245382 35.65441 1.075751 48 70.53669 0 0.1 0 0 0 1 
i 1.429418 35.65441 1.075751 47 70.83857 0 0.1 0 0 0 1 
i 1.981527 35.65441 1.075751 60 71.74423 0 0.1 0 0 0 1 
i 2.165563 35.65441 0.5378755 59 72.04612 0 0.1 0 0 0 1 
i 2.288254 35.65441 1.075751 62 72.24738 0 0.1 0 0 0 1 
i 2.349599 35.65441 1.075751 63 72.34801 0 0.1 0 0 0 1 
i 2.784594 35.72939 0.5378755 41 70.14356 0 0.1 0 0 0 1 
i 3.336703 35.72939 0.5378755 29 71.04922 0 0.1 0 0 0 1 
i 5.182642 35.84409 0.7171673 58 75.38566 0 0.1 0 0 0 1 
i 5.489369 35.84409 0.7171673 54 75.88881 0 0.1 0 0 0 1 
i 5.796096 35.84409 0.7171673 65 76.39195 0 0.1 0 0 0 1 
i 6.348205 35.84409 0.7171673 71 77.29761 0 0.1 0 0 0 1 
i 6.844545 35.8938 0.7171673 71 79.43966 0 0.1 0 0 0 1 
i 7.335308 35.8938 0.7171673 80 80.2447 0 0.1 0 0 0 1 
i 4.630533 35.93602 0.5378755 67 74.49744 0 0.1 0 0 0 1 
i 4.81457 35.93602 0.5378755 72 74.79933 0 0.1 0 0 0 1 
i 2.784594 36.09954 0.5378755 65 74.38809 0 0.1 0 0 0 1 
i 3.888811 36.09954 0.5378755 75 76.19941 0 0.1 0 0 0 1 
i 8.261067 36.09971 1.849864 86 83.08981 0 0.1 0 0 0 1 
i 9.303939 36.09971 1.434335 99 84.8005 0 0.1 0 0 0 1 
i 1.184036 36.19229 0.5378755 51 70.43606 0 0.1 0 0 0 1 
i 2.042872 36.19229 0.5378755 61 71.84486 0 0.1 0 0 0 1 
i 6.415127 36.27901 0.5378755 101 82.99723 0 0.1 0 0 0 1 
i 6.476473 36.27901 1.075751 100 83.09786 0 0.1 0 0 0 1 
i 6.599163 36.27901 1.075751 102 83.29912 0 0.1 0 0 0 1 
i 6.7832 36.27901 0.5378755 103 83.60101 0 0.1 0 0 0 1 
i 4.81457 36.36105 0.5378755 83 79.0452 0 0.1 0 0 0 1 
i 5.059951 36.36105 0.5378755 88 79.44771 0 0.1 0 0 0 1 
i 4.569188 36.47389 0.5378755 68 74.39681 0 0.1 0 0 0 1 
i 4.875915 36.47389 0.5378755 73 74.89996 0 0.1 0 0 0 1 
i 6.353782 36.61097 0.7171673 75 78.63463 0 0.1 0 0 0 1 
i 7.826072 36.61097 0.9230824 85 81.04973 0 0.1 0 0 0 1 
i 2.907285 36.69678 0.5378755 50 70.34415 0 0.1 0 0 0 1 
i 3.275357 36.69678 0.5378755 58 70.94792 0 0.1 0 0 0 1 
i 6.537818 36.81688 0.5378755 99 83.19849 0 0.1 0 0 0 1 
i 6.660509 36.81688 0.5378755 101 83.39975 0 0.1 0 0 0 1 
i 4.569188 36.89893 0.5378755 86 78.64268 0 0.1 0 0 0 1 
i 5.305333 36.89893 0.5378755 90 79.85023 0 0.1 0 0 0 1 
i 2.845939 36.90028 1.075751 64 74.48805 0 0.1 0 0 0 1 
i 2.907285 36.90028 1.075751 63 74.58868 0 0.1 0 0 0 1 
i 3.766121 36.90028 1.075751 75 75.99748 0 0.1 0 0 0 1 
i 3.950157 36.90028 0.5378755 76 76.29937 0 0.1 0 0 0 1 
i 6.415127 37.23241 1.434335 76 78.73459 0 0.1 0 0 0 1 
i 6.844545 37.23241 1.434335 70 79.43899 0 0.1 0 0 0 1 
i 7.335308 37.23241 0.7171673 80 80.24403 0 0.1 0 0 0 1 
i 2.784594 37.23466 0.5378755 52 70.14289 0 0.1 0 0 0 1 
i 3.398048 37.23466 0.5378755 60 71.14918 0 0.1 0 0 0 1 
i 4.691879 37.37584 0.5378755 60 74.5974 0 0.1 0 0 0 1 
i 4.81457 37.37584 1.075751 59 74.79866 0 0.1 0 0 0 1 
i 3.827466 37.43815 0.5378755 74 76.09811 0 0.1 0 0 0 1 
i 1.490763 37.50963 0.5378755 49 70.93853 0 0.1 0 0 0 1 
i 1.981527 37.50963 0.5378755 57 71.74356 0 0.1 0 0 0 1 
i 8.383757 37.57375 1.092997 85 83.2904 0 0.1 0 0 0 1 
i 9.119902 37.57375 0.7171673 97 84.49795 0 0.1 0 0 0 1 
i 4.630533 37.69967 1.075751 87 78.74264 0 0.1 0 0 0 1 
i 4.81457 37.69967 0.5378755 84 79.04453 0 0.1 0 0 0 1 
i 5.059951 37.69967 0.5378755 88 79.44704 0 0.1 0 0 0 1 
i 5.366678 37.69967 0.5378755 91 79.95019 0 0.1 0 0 0 1 
i 4.93726 37.91372 0.5378755 58 74.99992 0 0.1 0 0 0 1 
i 7.396654 37.94958 0.7171673 79 80.34465 0 0.1 0 0 0 1 
i 1 38.0475 0.5378755 53 70.1335 0 0.1 0 0 0 1 
i 2.47229 38.0475 0.5378755 61 72.5486 0 0.1 0 0 0 1 
i 6.844545 38.06128 0.5378755 102 83.70096 0 0.1 0 0 0 1 
i 2.845939 38.09624 1.075751 48 70.24285 0 0.1 0 0 0 1 
i 3.275357 38.09624 1.075751 50 70.94725 0 0.1 0 0 0 1 
i 4.569188 38.23754 0.5378755 86 78.64201 0 0.1 0 0 0 1 
i 4.875915 38.23754 0.5378755 83 79.14516 0 0.1 0 0 0 1 
i 5.305333 38.23754 0.5378755 90 79.84956 0 0.1 0 0 0 1 
i 8.138376 38.29092 1.280411 88 82.88788 0 0.1 0 0 0 1 
i 9.365284 38.29092 0.7171673 99 84.90046 0 0.1 0 0 0 1 
i 3.029976 38.44131 0.5378755 63 74.78927 0 0.1 0 0 0 1 
i 3.766121 38.44131 0.5378755 73 75.99681 0 0.1 0 0 0 1 
i 6.353782 38.59915 0.5378755 97 82.89593 0 0.1 0 0 0 1 
i 6.476473 38.60367 0.7171673 77 78.83455 0 0.1 0 0 0 1 
i 6.844545 38.60367 0.7171673 71 79.43832 0 0.1 0 0 0 1 
i 7.335308 38.60367 0.7171673 80 80.24335 0 0.1 0 0 0 1 
i 7.948763 38.60367 0.7171673 86 81.24964 0 0.1 0 0 0 1 
i 2.96863 38.63412 0.5378755 47 70.44411 0 0.1 0 0 0 1 
i 4.630533 38.71445 1.075751 52 74.4961 0 0.1 0 0 0 1 
i 4.691879 38.71445 0.5378755 54 74.59673 0 0.1 0 0 0 1 
i 4.81457 38.71445 0.5378755 51 74.79799 0 0.1 0 0 0 1 
i 4.998606 38.71445 0.5378755 49 75.09987 0 0.1 0 0 0 1 
i 8.383757 38.85416 2.028808 85 83.28973 0 0.1 0 0 0 1 
i 9.119902 38.85416 0.7171673 97 84.49727 0 0.1 0 0 0 1 
i 9.426629 38.85416 1.434335 100 85.00042 0 0.1 0 0 0 1 
i 1.061345 38.90909 0.5378755 54 70.23346 0 0.1 0 0 0 1 
i 1.490763 38.90909 0.5378755 48 70.93786 0 0.1 0 0 0 1 
i 1.981527 38.90909 0.5378755 57 71.74289 0 0.1 0 0 0 1 
i 2.533635 38.90909 0.5378755 62 72.64855 0 0.1 0 0 0 1 
i 2.784594 38.97919 0.5378755 65 74.38675 0 0.1 0 0 0 1 
i 4.011502 38.97919 0.5378755 76 76.39933 0 0.1 0 0 0 1 
i 4.691879 39.07093 0.5378755 87 78.8426 0 0.1 0 0 0 1 
i 4.81457 39.07093 0.5378755 85 79.04386 0 0.1 0 0 0 1 
i 5.059951 39.07093 0.5378755 89 79.44637 0 0.1 0 0 0 1 
i 5.428024 39.07093 0.5378755 91 80.05015 0 0.1 0 0 0 1 
i 6.353782 39.07135 0.5378755 78 78.65073 0 0.1 0 0 0 1 
i 4.569188 39.25233 0.5378755 53 74.39547 0 0.1 0 0 0 1 
i 4.753224 39.25233 0.5378755 55 74.69736 0 0.1 0 0 0 1 
i 4.93726 39.25233 0.5378755 50 74.99925 0 0.1 0 0 0 1 
i 6.353782 39.32084 0.7171673 75 78.63329 0 0.1 0 0 0 1 
i 6.967236 39.32084 1.992036 69 79.63958 0 0.1 0 0 0 1 
i 7.457999 39.32084 1.992036 79 80.44461 0 0.1 0 0 0 1 
i 6.415127 39.40571 1.075751 97 82.99589 0 0.1 0 0 0 1 
i 6.844545 39.40571 0.5378755 102 83.70029 0 0.1 0 0 0 1 
i 1 39.44696 0.5378755 53 70.13283 0 0.1 0 0 0 1 
i 1.552109 39.44696 0.5378755 48 71.03849 0 0.1 0 0 0 1 
i 2.042872 39.44696 0.5378755 56 71.84352 0 0.1 0 0 0 1 
i 2.47229 39.44696 0.5378755 62 72.54792 0 0.1 0 0 0 1 
i 8.138376 39.57133 1.741548 87 82.88721 0 0.1 0 0 0 1 
i 8.445103 39.57133 0.7171673 84 83.39036 0 0.1 0 0 0 1 
i 9.181248 39.57133 0.7171673 96 84.5979 0 0.1 0 0 0 1 
i 4.569188 39.6088 0.5378755 86 78.64134 0 0.1 0 0 0 1 
i 4.93726 39.6088 0.5378755 84 79.24512 0 0.1 0 0 0 1 
i 5.182642 39.6088 0.5378755 88 79.64763 0 0.1 0 0 0 1 
i 5.305333 39.6088 0.5378755 90 79.84889 0 0.1 0 0 0 1 
i 3.029976 39.70732 0.5378755 43 70.54407 0 0.1 0 0 0 1 
i 3.275357 39.70732 0.5378755 36 70.94658 0 0.1 0 0 0 1 
i 2.845939 39.77992 1.075751 65 74.48671 0 0.1 0 0 0 1 
i 3.029976 39.77992 1.075751 62 74.7886 0 0.1 0 0 0 1 
i 3.766121 39.77992 0.5378755 74 75.99614 0 0.1 0 0 0 1 
i 4.072848 39.77992 0.5378755 77 76.49929 0 0.1 0 0 0 1 
i 6.415127 39.87854 1.434335 76 78.73325 0 0.1 0 0 0 1 
i 6.476473 39.87854 0.7171673 77 78.83388 0 0.1 0 0 0 1 
i 6.844545 39.87854 0.7171673 70 79.43765 0 0.1 0 0 0 1 
i 7.519345 39.87854 0.7171673 78 80.54457 0 0.1 0 0 0 1 
i 7.948763 39.87854 3.459689 86 81.24897 0 0.1 0 0 0 1 
i 6.905891 39.94358 0.5378755 103 83.80092 0 0.1 0 0 0 1 
i 6.415127 40.00929 0.5378755 72 78.75069 0 0.1 0 0 0 1 
i 9.119902 40.1658 0.7171673 98 84.4966 0 0.1 0 0 0 1 
i 9.487975 40.1658 0.7171673 101 85.10038 0 0.1 0 0 0 1 
i 2.784594 40.2452 0.5378755 39 70.14155 0 0.1 0 0 0 1 
i 3.520739 40.2452 0.5378755 33 71.3491 0 0.1 0 0 0 1 
i 3.827466 40.3178 0.5378755 73 76.09677 0 0.1 0 0 0 1 
i 4.011502 40.3178 0.5378755 76 76.39866 0 0.1 0 0 0 1 
i 1.122691 40.34268 0.5378755 54 70.33342 0 0.1 0 0 0 1 
i 1.490763 40.34268 0.5378755 49 70.93719 0 0.1 0 0 0 1 
i 1.981527 40.34268 0.5378755 57 71.74222 0 0.1 0 0 0 1 
i 2.594981 40.34268 0.5378755 63 72.74851 0 0.1 0 0 0 1 
i 4.630533 40.3458 1.075751 86 78.7413 0 0.1 0 0 0 1 
i 4.691879 40.3458 1.075751 87 78.84193 0 0.1 0 0 0 1 
i 4.81457 40.3458 1.075751 85 79.04319 0 0.1 0 0 0 1 
i 4.998606 40.3458 1.075751 84 79.34507 0 0.1 0 0 0 1 
i 5.059951 40.3458 1.075751 89 79.4457 0 0.1 0 0 0 1 
i 5.243987 40.3458 0.5378755 88 79.74759 0 0.1 0 0 0 1 
i 5.366678 40.3458 1.075751 90 79.94885 0 0.1 0 0 0 1 
i 5.428024 40.3458 1.075751 91 80.04948 0 0.1 0 0 0 1 
i 6.353782 40.54717 0.5378755 73 78.65006 0 0.1 0 0 0 1 
i 5.059951 40.57774 0.5378755 72 75.19983 0 0.1 0 0 0 1 
i 6.537818 40.59571 0.7171673 77 78.93451 0 0.1 0 0 0 1 
i 6.905891 40.59571 0.7171673 71 79.53828 0 0.1 0 0 0 1 
i 7.396654 40.59571 0.7171673 80 80.34331 0 0.1 0 0 0 1 
i 6.476473 40.78293 0.5378755 97 83.09585 0 0.1 0 0 0 1 
i 6.844545 40.78293 0.5378755 102 83.69962 0 0.1 0 0 0 1 
i 1 40.88055 0.5378755 53 70.13216 0 0.1 0 0 0 1 
i 1.613454 40.88055 0.5378755 47 71.13845 0 0.1 0 0 0 1 
i 2.104217 40.88055 0.5378755 56 71.94348 0 0.1 0 0 0 1 
i 2.47229 40.88055 0.5378755 61 72.54725 0 0.1 0 0 0 1 
i 8.506448 40.88297 0.7171673 84 83.49031 0 0.1 0 0 0 1 
i 9.242593 40.88297 1.219439 97 84.69786 0 0.1 0 0 0 1 
i 9.365284 40.88297 1.936607 99 84.89912 0 0.1 0 0 0 1 
i 5.489369 40.88367 0.5378755 92 80.1501 0 0.1 0 0 0 1 
i 2.845939 41.10678 0.5378755 60 70.24151 0 0.1 0 0 0 1 
i 3.029976 41.10678 0.5378755 54 70.5434 0 0.1 0 0 0 1 
i 3.275357 41.10678 2.640953 63 70.94591 0 0.1 0 0 0 1 
i 3.582084 41.10678 0.5378755 69 71.44906 0 0.1 0 0 0 1 
i 4.569188 41.11561 0.5378755 65 74.3948 0 0.1 0 0 0 1 
i 2.907285 41.15119 0.5378755 65 74.58667 0 0.1 0 0 0 1 
i 3.766121 41.15119 0.5378755 75 75.99547 0 0.1 0 0 0 1 
i 4.134193 41.15119 0.5378755 77 76.59925 0 0.1 0 0 0 1 
i 6.353782 41.32081 0.5378755 98 82.89459 0 0.1 0 0 0 1 
i 6.967236 41.32081 0.5378755 104 83.90088 0 0.1 0 0 0 1 
i 6.599163 41.34619 0.7171673 77 79.03447 0 0.1 0 0 0 1 
i 6.844545 41.34619 0.7171673 72 79.43698 0 0.1 0 0 0 1 
i 7.335308 41.34619 0.7171673 82 80.24201 0 0.1 0 0 0 1 
i 8.261067 41.38524 1.434335 87 83.08713 0 0.1 0 0 0 1 
i 8.383757 41.38524 1.395288 84 83.28839 0 0.1 0 0 0 1 
i 8.567794 41.38524 0.7171673 83 83.59027 0 0.1 0 0 0 1 
i 9.119902 41.38524 1.434335 98 84.49593 0 0.1 0 0 0 1 
i 9.487975 41.38524 0.7171673 101 85.09971 0 0.1 0 0 0 1 
i 6.476473 41.52111 1.075751 75 78.85065 0 0.1 0 0 0 1 
i 2.784594 41.64466 0.5378755 59 70.14088 0 0.1 0 0 0 1 
i 3.091321 41.64466 0.5378755 52 70.64403 0 0.1 0 0 0 1 
i 3.336703 41.64466 0.58228 62 71.04654 0 0.1 0 0 0 1 
i 3.520739 41.64466 0.5378755 68 71.34843 0 0.1 0 0 0 1 
i 1.061345 41.67549 1.075751 53 70.23212 0 0.1 0 0 0 1 
i 1.122691 41.67549 0.5378755 54 70.33275 0 0.1 0 0 0 1 
i 1.490763 41.67549 0.5378755 48 70.93652 0 0.1 0 0 0 1 
i 1.6748 41.67549 1.075751 47 71.23841 0 0.1 0 0 0 1 
i 1.981527 41.67549 1.075751 56 71.74155 0 0.1 0 0 0 1 
i 2.165563 41.67549 0.5378755 55 72.04344 0 0.1 0 0 0 1 
i 2.784594 41.68906 0.5378755 64 74.38541 0 0.1 0 0 0 1 
i 3.888811 41.68906 0.5378755 73 76.19673 0 0.1 0 0 0 1 
i 4.011502 41.68906 0.5378755 76 76.39799 0 0.1 0 0 0 1 
i 4.630533 41.98328 0.5378755 57 74.49476 0 0.1 0 0 0 1 
i 5.059951 41.98328 0.5378755 45 75.19916 0 0.1 0 0 0 1 
i 6.415127 42.06334 1.075751 98 82.99455 0 0.1 0 0 0 1 
i 6.476473 42.06334 0.5378755 97 83.09518 0 0.1 0 0 0 1 
i 6.844545 42.06334 1.075751 103 83.69895 0 0.1 0 0 0 1 
i 7.028581 42.06334 1.075751 104 84.00084 0 0.1 0 0 0 1 
i 6.353782 42.06336 2.580831 74 78.63195 0 0.1 0 0 0 1 
i 7.089927 42.06336 0.7171673 70 79.8395 0 0.1 0 0 0 1 
i 7.58069 42.06336 0.7171673 79 80.64453 0 0.1 0 0 0 1 
i 8.445103 42.10241 0.7171673 85 83.38901 0 0.1 0 0 0 1 
i 8.506448 42.10241 0.7171673 84 83.48964 0 0.1 0 0 0 1 
i 9.365284 42.10241 0.7171673 100 84.89845 0 0.1 0 0 0 1 
i 9.54932 42.10241 0.7171673 101 85.20034 0 0.1 0 0 0 1 
i 1.184036 42.21337 0.5378755 55 70.43338 0 0.1 0 0 0 1 
i 1.552109 42.21337 0.5378755 48 71.03715 0 0.1 0 0 0 1 
i 2.042872 42.21337 0.5378755 57 71.84218 0 0.1 0 0 0 1 
i 2.47229 42.21337 0.5378755 62 72.54658 0 0.1 0 0 0 1 
i 2.907285 42.42605 1.075751 64 74.586 0 0.1 0 0 0 1 
i 3.029976 42.42605 1.075751 62 74.78725 0 0.1 0 0 0 1 
i 3.214012 42.42605 0.5378755 61 75.08914 0 0.1 0 0 0 1 
i 3.766121 42.42605 1.075751 75 75.9948 0 0.1 0 0 0 1 
i 3.950157 42.42605 1.075751 74 76.29669 0 0.1 0 0 0 1 
i 4.072848 42.42605 1.075751 76 76.49795 0 0.1 0 0 0 1 
i 4.134193 42.42605 1.075751 77 76.59857 0 0.1 0 0 0 1 
i 4.569188 42.52115 0.5378755 56 74.39413 0 0.1 0 0 0 1 
i 5.121297 42.52115 0.5378755 44 75.29979 0 0.1 0 0 0 1 
i 2.907285 42.54037 0.5378755 39 70.34147 0 0.1 0 0 0 1 
i 3.029976 42.54037 0.5378755 42 70.54273 0 0.1 0 0 0 1 
i 3.275357 42.54037 0.5378755 37 70.94524 0 0.1 0 0 0 1 
i 3.64343 42.54037 0.5378755 34 71.54901 0 0.1 0 0 0 1 
i 6.537818 42.60122 0.5378755 97 83.19581 0 0.1 0 0 0 1 
i 6.599163 42.62106 1.434335 77 79.03379 0 0.1 0 0 0 1 
i 6.844545 42.62106 0.7171673 72 79.43631 0 0.1 0 0 0 1 
i 7.151272 42.62106 0.7171673 69 79.93945 0 0.1 0 0 0 1 
i 7.335308 42.62106 1.434335 82 80.24134 0 0.1 0 0 0 1 
i 7.642036 42.62106 0.7171673 78 80.74449 0 0.1 0 0 0 1 
i 7.887417 42.62106 0.7171673 83 81.147 0 0.1 0 0 0 1 
i 5.550715 42.73056 0.5378755 87 80.25006 0 0.1 0 0 0 1 
i 6.415127 42.92665 0.5378755 81 78.74935 0 0.1 0 0 0 1 
i 6.476473 42.92665 0.5378755 83 78.84998 0 0.1 0 0 0 1 
i 2.96863 42.96393 0.5378755 65 74.68662 0 0.1 0 0 0 1 
i 2.784594 43.07825 0.5378755 41 70.14021 0 0.1 0 0 0 1 
i 3.152666 43.07825 0.5378755 43 70.74398 0 0.1 0 0 0 1 
i 3.398048 43.07825 0.5378755 38 71.1465 0 0.1 0 0 0 1 
i 3.520739 43.07825 0.5378755 36 71.34776 0 0.1 0 0 0 1 
i 8.629139 43.08264 0.7171673 85 83.69023 0 0.1 0 0 0 1 
i 9.119902 43.08264 0.7171673 95 84.49526 0 0.1 0 0 0 1 
i 1.245382 43.20986 0.5378755 54 70.53333 0 0.1 0 0 0 1 
i 1.490763 43.20986 0.5378755 50 70.93585 0 0.1 0 0 0 1 
i 1.981527 43.20986 0.5378755 58 71.74088 0 0.1 0 0 0 1 
i 4.569188 43.26844 0.5378755 80 78.64 0 0.1 0 0 0 1 
i 6.905891 43.33823 0.7171673 73 79.53694 0 0.1 0 0 0 1 
i 7.089927 43.33823 0.7171673 70 79.83883 0 0.1 0 0 0 1 
i 7.58069 43.33823 0.7171673 79 80.64386 0 0.1 0 0 0 1 
i 7.826072 43.33823 0.7171673 84 81.04637 0 0.1 0 0 0 1 
i 8.132799 43.33823 0.7171673 87 81.54952 0 0.1 0 0 0 1 
i 4.691879 43.4231 0.5378755 64 74.59472 0 0.1 0 0 0 1 
i 5.059951 43.4231 0.5378755 72 75.19849 0 0.1 0 0 0 1 
i 6.353782 43.46453 0.5378755 82 78.64872 0 0.1 0 0 0 1 
i 6.537818 43.46453 0.5378755 84 78.95061 0 0.1 0 0 0 1 
i 6.599163 43.53738 0.5378755 98 83.29577 0 0.1 0 0 0 1 
i 6.844545 43.53738 0.5378755 102 83.69828 0 0.1 0 0 0 1 
i 1 43.74773 0.5378755 52 70.13082 0 0.1 0 0 0 1 
i 1.736145 43.74773 0.5378755 47 71.33836 0 0.1 0 0 0 1 
i 2.226908 43.74773 0.5378755 56 72.1434 0 0.1 0 0 0 1 
i 2.47229 43.74773 0.5378755 60 72.54591 0 0.1 0 0 0 1 
i 8.138376 43.79981 0.7171673 90 82.8852 0 0.1 0 0 0 1 
i 9.610666 43.79981 0.7171673 99 85.30029 0 0.1 0 0 0 1 
i 2.845939 43.87319 1.075751 42 70.24017 0 0.1 0 0 0 1 
i 2.907285 43.87319 1.075751 41 70.3408 0 0.1 0 0 0 1 
i 3.029976 43.87319 1.075751 43 70.54205 0 0.1 0 0 0 1 
i 3.214012 43.87319 0.5378755 44 70.84394 0 0.1 0 0 0 1 
i 3.275357 43.87319 1.075751 39 70.94457 0 0.1 0 0 0 1 
i 3.459394 43.87319 1.075751 40 71.24646 0 0.1 0 0 0 1 
i 3.582084 43.87319 0.5378755 38 71.44771 0 0.1 0 0 0 1 
i 3.64343 43.87319 1.075751 37 71.54834 0 0.1 0 0 0 1 
i 6.599163 43.92702 0.7171673 76 79.03312 0 0.1 0 0 0 1 
i 6.844545 43.92702 0.7171673 71 79.43564 0 0.1 0 0 0 1 
i 7.212618 43.92702 0.7171673 69 80.03941 0 0.1 0 0 0 1 
i 7.335308 43.92702 0.7171673 81 80.24067 0 0.1 0 0 0 1 
i 7.703381 43.92702 0.7171673 78 80.84444 0 0.1 0 0 0 1 
i 7.948763 43.92702 0.7171673 83 81.24696 0 0.1 0 0 0 1 
i 8.071453 43.92702 0.7171673 85 81.44822 0 0.1 0 0 0 1 
i 4.569188 43.96098 0.5378755 66 74.39346 0 0.1 0 0 0 1 
i 5.182642 43.96098 0.5378755 74 75.39975 0 0.1 0 0 0 1 
i 6.353782 44.07525 0.5378755 100 82.89325 0 0.1 0 0 0 1 
i 7.089927 44.07525 0.5378755 104 84.1008 0 0.1 0 0 0 1 
i 4.630533 44.1361 1.075751 79 78.73996 0 0.1 0 0 0 1 
i 5.550715 44.1361 1.075751 88 80.24939 0 0.1 0 0 0 1 
i 3.275357 44.20061 1.876487 63 75.1891 0 0.1 0 0 0 1 
i 3.766121 44.20061 0.5378755 71 75.99413 0 0.1 0 0 0 1 
i 8.199721 44.36305 0.7171673 91 82.98516 0 0.1 0 0 0 1 
i 8.629139 44.36305 0.7171673 85 83.68956 0 0.1 0 0 0 1 
i 9.119902 44.36305 1.434335 94 84.49459 0 0.1 0 0 0 1 
i 9.672011 44.36305 1.434335 100 85.40025 0 0.1 0 0 0 1 
i 3.336703 44.41106 0.5378755 38 71.0452 0 0.1 0 0 0 1 
i 3.704775 44.41106 0.5378755 36 71.64897 0 0.1 0 0 0 1 
i 1.061345 44.54268 0.5378755 51 70.23078 0 0.1 0 0 0 1 
i 1.245382 44.54268 0.5378755 54 70.53266 0 0.1 0 0 0 1 
i 1.490763 44.54268 0.5378755 50 70.93518 0 0.1 0 0 0 1 
i 1.79749 44.54268 1.075751 47 71.43832 0 0.1 0 0 0 1 
i 1.981527 44.54268 0.5378755 58 71.74021 0 0.1 0 0 0 1 
i 2.288254 44.54268 0.5378755 55 72.24335 0 0.1 0 0 0 1 
i 2.533635 44.54268 0.5378755 60 72.64587 0 0.1 0 0 0 1 
i 6.599163 44.54474 0.5378755 64 79.05057 0 0.1 0 0 0 1 
i 6.353782 44.64419 1.931328 75 78.63061 0 0.1 0 0 0 1 
i 6.721854 44.64419 0.7171673 77 79.23438 0 0.1 0 0 0 1 
i 6.967236 44.64419 1.931328 73 79.6369 0 0.1 0 0 0 1 
i 7.089927 44.64419 0.7171673 70 79.83816 0 0.1 0 0 0 1 
i 7.457999 44.64419 0.7171673 82 80.44193 0 0.1 0 0 0 1 
i 7.58069 44.64419 1.21416 80 80.64319 0 0.1 0 0 0 1 
i 7.826072 44.64419 0.7171673 84 81.0457 0 0.1 0 0 0 1 
i 8.194144 44.64419 1.21416 87 81.64948 0 0.1 0 0 0 1 
i 2.784594 44.73848 0.5378755 67 74.38407 0 0.1 0 0 0 1 
i 4.256884 44.73848 0.5378755 76 76.79916 0 0.1 0 0 0 1 
i 4.630533 44.76172 1.075751 62 74.49342 0 0.1 0 0 0 1 
i 5.059951 44.76172 1.075751 64 75.19782 0 0.1 0 0 0 1 
i 5.243987 44.76172 0.5378755 65 75.49971 0 0.1 0 0 0 1 
i 6.415127 44.81779 0.5378755 101 82.99321 0 0.1 0 0 0 1 
i 6.599163 44.81779 0.5378755 98 83.29509 0 0.1 0 0 0 1 
i 6.844545 44.81779 1.075751 102 83.69761 0 0.1 0 0 0 1 
i 7.151272 44.81779 1.075751 105 84.20075 0 0.1 0 0 0 1 
i 8.138376 45.08022 0.7171673 90 82.88453 0 0.1 0 0 0 1 
i 8.690484 45.08022 0.7171673 84 83.79019 0 0.1 0 0 0 1 
i 1 45.08055 0.5378755 52 70.13015 0 0.1 0 0 0 1 
i 1.306727 45.08055 0.5378755 55 70.63329 0 0.1 0 0 0 1 
i 1.552109 45.08055 0.5378755 50 71.03581 0 0.1 0 0 0 1 
i 2.042872 45.08055 0.5378755 59 71.84084 0 0.1 0 0 0 1 
i 2.226908 45.08055 0.5378755 56 72.14273 0 0.1 0 0 0 1 
i 2.47229 45.08055 0.5378755 60 72.54524 0 0.1 0 0 0 1 
i 6.353782 45.08262 0.5378755 69 78.64805 0 0.1 0 0 0 1 
i 6.476473 45.14118 0.7171673 74 78.83119 0 0.1 0 0 0 1 
i 6.599163 45.14118 1.434335 76 79.03245 0 0.1 0 0 0 1 
i 6.7832 45.14118 0.7171673 78 79.33434 0 0.1 0 0 0 1 
i 6.844545 45.14118 1.434335 72 79.43497 0 0.1 0 0 0 1 
i 7.151272 45.14118 1.434335 71 79.93811 0 0.1 0 0 0 1 
i 7.212618 45.14118 1.434335 69 80.03874 0 0.1 0 0 0 1 
i 7.335308 45.14118 1.434335 81 80.24 0 0.1 0 0 0 1 
i 7.519345 45.14118 0.7171673 82 80.54189 0 0.1 0 0 0 1 
i 7.703381 45.14118 1.434335 79 80.84377 0 0.1 0 0 0 1 
i 7.887417 45.14118 1.434335 85 81.14566 0 0.1 0 0 0 1 
i 7.948763 45.14118 1.434335 83 81.24629 0 0.1 0 0 0 1 
i 8.071453 45.14118 1.434335 86 81.44755 0 0.1 0 0 0 1 
i 6.353782 45.35566 0.5378755 100 82.89258 0 0.1 0 0 0 1 
i 6.660509 45.35566 0.5378755 97 83.39572 0 0.1 0 0 0 1 
i 2.845939 45.53922 0.5378755 68 74.48403 0 0.1 0 0 0 1 
i 3.766121 45.53922 1.075751 71 75.99346 0 0.1 0 0 0 1 
i 4.318229 45.53922 0.5378755 77 76.89912 0 0.1 0 0 0 1 
i 4.691879 45.57593 0.5378755 78 78.83992 0 0.1 0 0 0 1 
i 5.550715 45.57593 0.5378755 88 80.24872 0 0.1 0 0 0 1 
i 8.261067 45.67469 0.7171673 91 83.08512 0 0.1 0 0 0 1 
i 8.629139 45.67469 0.7171673 85 83.68889 0 0.1 0 0 0 1 
i 9.119902 45.67469 0.7171673 95 84.49392 0 0.1 0 0 0 1 
i 9.733357 45.67469 0.7171673 101 85.50021 0 0.1 0 0 0 1 
i 6.721854 45.85835 0.7171673 77 79.23371 0 0.1 0 0 0 1 
i 7.089927 45.85835 0.7171673 70 79.83748 0 0.1 0 0 0 1 
i 7.457999 45.85835 0.7171673 82 80.44126 0 0.1 0 0 0 1 
i 7.764726 45.85835 0.7171673 78 80.9444 0 0.1 0 0 0 1 
i 7.826072 45.85835 0.7171673 84 81.04503 0 0.1 0 0 0 1 
i 1.122691 45.908 0.5378755 51 70.33073 0 0.1 0 0 0 1 
i 1.245382 45.908 0.5378755 53 70.53199 0 0.1 0 0 0 1 
i 1.490763 45.908 0.5378755 49 70.93451 0 0.1 0 0 0 1 
i 1.858836 45.908 0.5378755 47 71.53828 0 0.1 0 0 0 1 
i 1.981527 45.908 0.5378755 58 71.73954 0 0.1 0 0 0 1 
i 2.349599 45.908 0.5378755 55 72.34331 0 0.1 0 0 0 1 
i 2.594981 45.908 0.5378755 60 72.74583 0 0.1 0 0 0 1 
i 2.717672 45.908 0.7069708 62 72.94709 0 0.1 0 0 0 1 
i 6.415127 45.95028 0.5378755 81 78.74801 0 0.1 0 0 0 1 
i 6.599163 45.95028 0.5378755 86 79.0499 0 0.1 0 0 0 1 
i 2.784594 46.0771 0.5378755 67 74.3834 0 0.1 0 0 0 1 
i 4.256884 46.0771 0.5378755 76 76.79849 0 0.1 0 0 0 1 
i 4.569188 46.1138 0.5378755 79 78.63866 0 0.1 0 0 0 1 
i 5.673405 46.1138 0.5378755 89 80.44998 0 0.1 0 0 0 1 
i 6.476473 46.12943 0.5378755 101 83.09317 0 0.1 0 0 0 1 
i 6.599163 46.12943 0.5378755 99 83.29442 0 0.1 0 0 0 1 
i 6.844545 46.12943 0.5378755 103 83.69694 0 0.1 0 0 0 1 
i 7.212618 46.12943 0.5378755 106 84.30071 0 0.1 0 0 0 1 
i 8.138376 46.15322 0.5378755 92 82.9013 0 0.1 0 0 0 1 
i 4.81457 46.30275 0.5378755 57 74.79463 0 0.1 0 0 0 1 
i 5.059951 46.30275 0.5378755 51 75.19715 0 0.1 0 0 0 1 
i 3.766121 46.36635 0.5378755 42 71.74893 0 0.1 0 0 0 1 
i 8.138376 46.39186 1.219439 90 82.88386 0 0.1 0 0 0 1 
i 8.75183 46.39186 1.936607 84 83.89015 0 0.1 0 0 0 1 
i 9.242593 46.39186 1.936607 93 84.69518 0 0.1 0 0 0 1 
i 9.610666 46.39186 1.219439 99 85.29895 0 0.1 0 0 0 1 
i 1 46.44588 0.5378755 52 70.12948 0 0.1 0 0 0 1 
i 1.368072 46.44588 0.5378755 55 70.73325 0 0.1 0 0 0 1 
i 1.613454 46.44588 0.5378755 50 71.13577 0 0.1 0 0 0 1 
i 1.736145 46.44588 0.5378755 48 71.33702 0 0.1 0 0 0 1 
i 2.104217 46.44588 0.5378755 59 71.9408 0 0.1 0 0 0 1 
i 2.226908 46.44588 0.5378755 57 72.14205 0 0.1 0 0 0 1 
i 2.47229 46.44588 0.5378755 61 72.54457 0 0.1 0 0 0 1 
i 2.840362 46.44588 1.807225 63 73.14834 0 0.1 0 0 0 1 
i 6.353782 46.48816 0.5378755 82 78.64738 0 0.1 0 0 0 1 
i 6.660509 46.48816 0.5378755 87 79.15052 0 0.1 0 0 0 1 
i 6.353782 46.6673 0.5378755 100 82.89191 0 0.1 0 0 0 1 
i 6.721854 46.6673 0.5378755 98 83.49568 0 0.1 0 0 0 1 
i 6.967236 46.6673 0.5378755 102 83.8982 0 0.1 0 0 0 1 
i 7.089927 46.6673 0.5378755 104 84.09945 0 0.1 0 0 0 1 
i 4.569188 46.84063 0.5378755 53 74.39212 0 0.1 0 0 0 1 
i 5.305333 46.84063 0.5378755 47 75.59966 0 0.1 0 0 0 1 
i 8.261067 46.89413 2.12101 91 83.08444 0 0.1 0 0 0 1 
i 8.813175 46.89413 0.7171673 83 83.9901 0 0.1 0 0 0 1 
i 9.119902 46.89413 1.434335 94 84.49325 0 0.1 0 0 0 1 
i 9.733357 46.89413 2.12101 101 85.49954 0 0.1 0 0 0 1 
i 2.784594 46.90423 0.5378755 47 70.13887 0 0.1 0 0 0 1 
i 2.907285 46.91048 0.5378755 68 74.58398 0 0.1 0 0 0 1 
i 3.766121 46.91048 0.5378755 71 75.99279 0 0.1 0 0 0 1 
i 4.379575 46.91048 0.5378755 77 76.99908 0 0.1 0 0 0 1 
i 4.630533 46.91454 0.5378755 79 78.73862 0 0.1 0 0 0 1 
i 4.691879 46.91454 1.264699 77 78.83925 0 0.1 0 0 0 1 
i 5.550715 46.91454 0.5378755 89 80.24805 0 0.1 0 0 0 1 
i 5.734751 46.91454 1.075751 90 80.54994 0 0.1 0 0 0 1 
i 8.199721 47.027 1.075751 87 83.00126 0 0.1 0 0 0 1 
i 1.061345 47.17735 1.075751 53 70.22943 0 0.1 0 0 0 1 
i 1.122691 47.17735 1.075751 52 70.33006 0 0.1 0 0 0 1 
i 1.245382 47.17735 1.075751 54 70.53132 0 0.1 0 0 0 1 
i 1.429418 47.17735 0.5378755 55 70.83321 0 0.1 0 0 0 1 
i 1.490763 47.17735 0.5378755 49 70.93384 0 0.1 0 0 0 1 
i 1.6748 47.17735 1.075751 50 71.23572 0 0.1 0 0 0 1 
i 1.79749 47.17735 1.075751 48 71.43698 0 0.1 0 0 0 1 
i 1.858836 47.17735 1.075751 47 71.53761 0 0.1 0 0 0 1 
i 1.981527 47.17735 1.075751 58 71.73887 0 0.1 0 0 0 1 
i 2.165563 47.17735 0.5378755 59 72.04075 0 0.1 0 0 0 1 
i 2.288254 47.17735 1.075751 57 72.24201 0 0.1 0 0 0 1 
i 2.349599 47.17735 1.075751 56 72.34264 0 0.1 0 0 0 1 
i 2.533635 47.17735 0.5378755 61 72.64453 0 0.1 0 0 0 1 
i 2.594981 47.17735 1.075751 60 72.74516 0 0.1 0 0 0 1 
i 2.717672 47.17735 2.083751 62 72.94642 0 0.1 0 0 0 1 
i 6.415127 47.34887 0.5378755 100 82.99187 0 0.1 0 0 0 1 
i 6.476473 47.34887 1.075751 101 83.09249 0 0.1 0 0 0 1 
i 6.599163 47.34887 0.5378755 99 83.29375 0 0.1 0 0 0 1 
i 6.7832 47.34887 1.075751 98 83.59564 0 0.1 0 0 0 1 
i 6.844545 47.34887 1.075751 103 83.69627 0 0.1 0 0 0 1 
i 7.028581 47.34887 1.075751 102 83.99816 0 0.1 0 0 0 1 
i 7.151272 47.34887 1.075751 104 84.19941 0 0.1 0 0 0 1 
i 7.212618 47.34887 1.075751 105 84.30004 0 0.1 0 0 0 1 
i 6.476473 47.39011 0.5378755 74 78.84797 0 0.1 0 0 0 1 
i 6.599163 47.39011 0.5378755 73 79.04922 0 0.1 0 0 0 1 
i 2.784594 47.44836 0.5378755 67 74.38273 0 0.1 0 0 0 1 
i 3.888811 47.44836 0.5378755 70 76.19405 0 0.1 0 0 0 1 
i 4.256884 47.44836 0.5378755 76 76.79782 0 0.1 0 0 0 1 
i 4.569188 47.45242 0.5378755 78 78.63799 0 0.1 0 0 0 1 
i 5.61206 47.45242 0.5378755 88 80.34868 0 0.1 0 0 0 1 
i 8.322412 47.6113 0.7171673 92 83.18507 0 0.1 0 0 0 1 
i 8.690484 47.6113 0.7171673 85 83.78885 0 0.1 0 0 0 1 
i 9.610666 47.6113 0.7171673 100 85.29828 0 0.1 0 0 0 1 
i 4.630533 47.64136 0.5378755 74 74.49208 0 0.1 0 0 0 1 
i 4.81457 47.64136 0.5378755 68 74.79396 0 0.1 0 0 0 1 
i 5.366678 47.64136 0.5378755 83 75.69962 0 0.1 0 0 0 1 
i 1.184036 47.71523 0.5378755 51 70.43069 0 0.1 0 0 0 1 
i 1.552109 47.71523 0.5378755 49 71.03447 0 0.1 0 0 0 1 
i 2.410945 47.71523 0.5378755 55 72.44327 0 0.1 0 0 0 1 
i 2.47229 47.71523 0.5378755 61 72.5439 0 0.1 0 0 0 1 
i 2.845939 47.83578 0.5378755 49 70.23883 0 0.1 0 0 0 1 
i 3.766121 47.83578 0.5378755 40 71.74826 0 0.1 0 0 0 1 
i 6.660509 47.88674 0.5378755 100 83.39438 0 0.1 0 0 0 1 
i 7.273963 47.88674 0.5378755 106 84.40067 0 0.1 0 0 0 1 
i 6.353782 47.92798 0.5378755 73 78.64671 0 0.1 0 0 0 1 
i 6.721854 47.92798 0.5378755 72 79.25048 0 0.1 0 0 0 1 
i 4.569188 48.17924 0.5378755 73 74.39145 0 0.1 0 0 0 1 
i 4.875915 48.17924 0.5378755 67 74.89459 0 0.1 0 0 0 1 
i 5.121297 48.17924 0.5378755 76 75.29711 0 0.1 0 0 0 1 
i 5.305333 48.17924 0.5378755 82 75.59899 0 0.1 0 0 0 1 
i 2.845939 48.18535 0.5378755 67 74.48268 0 0.1 0 0 0 1 
i 2.907285 48.18535 1.075751 68 74.58331 0 0.1 0 0 0 1 
i 3.459394 48.18535 0.5378755 61 75.48897 0 0.1 0 0 0 1 
i 3.766121 48.18535 1.075751 71 75.99212 0 0.1 0 0 0 1 
i 3.950157 48.18535 1.075751 70 76.294 0 0.1 0 0 0 1 
i 4.318229 48.18535 1.075751 76 76.89778 0 0.1 0 0 0 1 
i 4.379575 48.18535 1.075751 77 76.99841 0 0.1 0 0 0 1 
i 8.629139 48.29797 0.7171673 86 83.68755 0 0.1 0 0 0 1 
i 9.119902 48.29797 0.7171673 96 84.49258 0 0.1 0 0 0 1 
i 2.784594 48.37366 0.5378755 48 70.1382 0 0.1 0 0 0 1 
i 3.827466 48.37366 0.5378755 39 71.84889 0 0.1 0 0 0 1 
i 4.81457 48.45558 0.5378755 77 79.03983 0 0.1 0 0 0 1 
i 5.550715 48.45558 0.5378755 88 80.24738 0 0.1 0 0 0 1 
i 8.261067 48.47308 1.075751 89 83.10122 0 0.1 0 0 0 1 
i 2.96863 48.72322 0.5378755 69 74.68394 0 0.1 0 0 0 1 
i 3.336703 48.72322 0.5378755 63 75.28771 0 0.1 0 0 0 1 
i 6.415127 48.72872 1.075751 67 78.74667 0 0.1 0 0 0 1 
i 6.476473 48.72872 0.5378755 68 78.8473 0 0.1 0 0 0 1 
i 6.599163 48.72872 0.5378755 65 79.04855 0 0.1 0 0 0 1 
i 6.7832 48.72872 0.5378755 63 79.35044 0 0.1 0 0 0 1 
i 4.569188 48.99345 0.5378755 79 78.63732 0 0.1 0 0 0 1 
i 5.796096 48.99345 0.5378755 90 80.6499 0 0.1 0 0 0 1 
i 4.691879 49.01262 0.5378755 54 74.59203 0 0.1 0 0 0 1 
i 4.81457 49.01262 0.5378755 56 74.79329 0 0.1 0 0 0 1 
i 5.059951 49.01262 0.5378755 51 75.19581 0 0.1 0 0 0 1 
i 5.428024 49.01262 0.5378755 48 75.79958 0 0.1 0 0 0 1 
i 8.138376 49.01514 2.468621 88 82.88252 0 0.1 0 0 0 1 
i 8.874521 49.01514 0.7171673 84 84.09006 0 0.1 0 0 0 1 
i 9.365284 49.01514 2.468621 93 84.89509 0 0.1 0 0 0 1 
i 9.610666 49.01514 0.7171673 98 85.29761 0 0.1 0 0 0 1 
i 6.537818 49.26659 0.5378755 69 78.94792 0 0.1 0 0 0 1 
i 6.660509 49.26659 0.5378755 66 79.14918 0 0.1 0 0 0 1 
i 6.721854 49.26659 0.5378755 64 79.24981 0 0.1 0 0 0 1 
i 2.907285 49.34105 0.5378755 41 70.33878 0 0.1 0 0 0 1 
i 3.766121 49.34105 0.5378755 62 71.74759 0 0.1 0 0 0 1 
i 8.383757 49.51741 0.7171673 91 83.28436 0 0.1 0 0 0 1 
i 8.629139 49.51741 0.7171673 86 83.68688 0 0.1 0 0 0 1 
i 8.935866 49.51741 0.7171673 83 84.19002 0 0.1 0 0 0 1 
i 9.119902 49.51741 1.434335 96 84.49191 0 0.1 0 0 0 1 
i 9.672011 49.51741 0.7171673 97 85.39757 0 0.1 0 0 0 1 
i 9.856047 49.51741 0.7171673 100 85.69945 0 0.1 0 0 0 1 
i 4.569188 49.5505 0.5378755 55 74.39078 0 0.1 0 0 0 1 
i 4.93726 49.5505 0.5378755 58 74.99455 0 0.1 0 0 0 1 
i 5.182642 49.5505 0.5378755 52 75.39706 0 0.1 0 0 0 1 
i 5.305333 49.5505 0.5378755 50 75.59832 0 0.1 0 0 0 1 
i 7.335308 49.62995 0.5378755 101 84.50063 0 0.1 0 0 0 1 
i 3.029976 49.653 0.5378755 68 74.7839 0 0.1 0 0 0 1 
i 3.275357 49.653 0.5378755 64 75.18642 0 0.1 0 0 0 1 
i 3.766121 49.653 0.5378755 73 75.99145 0 0.1 0 0 0 1 
i 4.502266 49.653 0.6790605 77 77.19899 0 0.1 0 0 0 1 
i 4.630533 49.79419 0.5378755 80 78.73727 0 0.1 0 0 0 1 
i 5.550715 49.79419 0.5378755 88 80.24671 0 0.1 0 0 0 1 
i 5.857442 49.79419 0.5378755 91 80.74985 0 0.1 0 0 0 1 
i 8.199721 49.81751 1.075751 96 82.99992 0 0.1 0 0 0 1 
i 8.261067 49.81751 0.5378755 97 83.10055 0 0.1 0 0 0 1 
i 2.784594 49.87893 0.5378755 44 70.13753 0 0.1 0 0 0 1 
i 3.888811 49.87893 0.5378755 65 71.94885 0 0.1 0 0 0 1 
i 6.353782 50.16782 0.5378755 94 82.89057 0 0.1 0 0 0 1 
i 2.784594 50.19088 0.5378755 66 74.38138 0 0.1 0 0 0 1 
i 3.520739 50.19088 0.5378755 62 75.58893 0 0.1 0 0 0 1 
i 4.011502 50.19088 0.5378755 70 76.39396 0 0.1 0 0 0 1 
i 4.256884 50.19088 0.5378755 74 76.79648 0 0.1 0 0 0 1 
i 8.445103 50.23458 0.7171673 92 83.38499 0 0.1 0 0 0 1 
i 8.690484 50.23458 0.7171673 87 83.78751 0 0.1 0 0 0 1 
i 8.874521 50.23458 0.7171673 84 84.08939 0 0.1 0 0 0 1 
i 9.610666 50.23458 0.7171673 98 85.29694 0 0.1 0 0 0 1 
i 9.917393 50.23458 0.7171673 101 85.80008 0 0.1 0 0 0 1 
i 4.630533 50.28749 1.075751 56 74.49073 0 0.1 0 0 0 1 
i 4.691879 50.28749 1.075751 55 74.59136 0 0.1 0 0 0 1 
i 4.81457 50.28749 1.075751 57 74.79262 0 0.1 0 0 0 1 
i 4.998606 50.28749 1.075751 58 75.09451 0 0.1 0 0 0 1 
i 5.059951 50.28749 1.075751 53 75.19514 0 0.1 0 0 0 1 
i 5.243987 50.28749 1.075751 54 75.49702 0 0.1 0 0 0 1 
i 5.366678 50.28749 1.075751 52 75.69828 0 0.1 0 0 0 1 
i 5.428024 50.28749 1.075751 51 75.79891 0 0.1 0 0 0 1 
i 4.569188 50.33206 0.5378755 79 78.63665 0 0.1 0 0 0 1 
i 4.875915 50.33206 0.5378755 76 79.13979 0 0.1 0 0 0 1 
i 5.61206 50.33206 0.5378755 87 80.34734 0 0.1 0 0 0 1 
i 5.796096 50.33206 0.5378755 90 80.64922 0 0.1 0 0 0 1 
i 8.322412 50.35539 0.5378755 98 83.20117 0 0.1 0 0 0 1 
i 6.844545 50.592 0.5378755 86 79.4504 0 0.1 0 0 0 1 
i 2.845939 50.74051 0.5378755 51 70.23748 0 0.1 0 0 0 1 
i 2.907285 50.74051 0.5378755 53 70.33811 0 0.1 0 0 0 1 
i 3.766121 50.74051 0.5378755 32 71.74692 0 0.1 0 0 0 1 
i 3.950157 50.74051 0.5378755 30 72.04881 0 0.1 0 0 0 1 
i 8.383757 50.76659 0.7171673 90 83.28369 0 0.1 0 0 0 1 
i 8.629139 50.76659 0.7171673 86 83.68621 0 0.1 0 0 0 1 
i 8.997212 50.76659 0.7171673 83 84.28998 0 0.1 0 0 0 1 
i 9.119902 50.76659 0.7171673 95 84.49124 0 0.1 0 0 0 1 
i 9.733357 50.76659 0.7171673 97 85.49753 0 0.1 0 0 0 1 
i 9.856047 50.76659 0.7171673 100 85.69878 0 0.1 0 0 0 1 
i 2.845939 50.92787 1.075751 65 74.48134 0 0.1 0 0 0 1 
i 3.029976 50.92787 0.5378755 68 74.78323 0 0.1 0 0 0 1 
i 3.275357 50.92787 0.5378755 64 75.18574 0 0.1 0 0 0 1 
i 3.582084 50.92787 0.5378755 61 75.68889 0 0.1 0 0 0 1 
i 3.766121 50.92787 1.075751 73 75.99078 0 0.1 0 0 0 1 
i 4.072848 50.92787 1.075751 70 76.49392 0 0.1 0 0 0 1 
i 4.318229 50.92787 1.075751 74 76.89644 0 0.1 0 0 0 1 
i 4.502266 50.92787 1.075751 77 77.19832 0 0.1 0 0 0 1 
i 6.415127 50.97438 1.075751 93 82.99052 0 0.1 0 0 0 1 
i 7.335308 50.97438 0.5378755 102 84.49996 0 0.1 0 0 0 1 
i 6.353782 51.12988 0.5378755 79 78.64537 0 0.1 0 0 0 1 
i 4.691879 51.16545 0.5378755 79 78.83723 0 0.1 0 0 0 1 
i 5.550715 51.16545 0.5378755 89 80.24604 0 0.1 0 0 0 1 
i 5.918787 51.16545 0.5378755 91 80.84981 0 0.1 0 0 0 1 
i 2.784594 51.27839 0.5378755 52 70.13686 0 0.1 0 0 0 1 
i 2.96863 51.27839 0.5378755 54 70.43874 0 0.1 0 0 0 1 
i 3.827466 51.27839 0.5378755 33 71.84755 0 0.1 0 0 0 1 
i 3.888811 51.27839 0.5378755 31 71.94818 0 0.1 0 0 0 1 
i 8.383757 51.36525 0.5378755 78 83.30113 0 0.1 0 0 0 1 
i 2.784594 51.46575 0.5378755 66 74.38071 0 0.1 0 0 0 1 
i 3.091321 51.46575 0.5378755 69 74.88386 0 0.1 0 0 0 1 
i 3.520739 51.46575 0.5378755 62 75.58826 0 0.1 0 0 0 1 
i 8.138376 51.48376 1.878538 89 82.88117 0 0.1 0 0 0 1 
i 8.506448 51.48376 1.161371 92 83.48495 0 0.1 0 0 0 1 
i 8.75183 51.48376 1.878538 87 83.88746 0 0.1 0 0 0 1 
i 8.874521 51.48376 1.878538 85 84.08872 0 0.1 0 0 0 1 
i 9.242593 51.48376 0.7171673 96 84.69249 0 0.1 0 0 0 1 
i 9.365284 51.48376 1.878538 94 84.89375 0 0.1 0 0 0 1 
i 9.610666 51.48376 1.878538 99 85.29627 0 0.1 0 0 0 1 
i 9.978738 51.48376 1.878538 101 85.90004 0 0.1 0 0 0 1 
i 7.396654 51.51225 0.5378755 103 84.60059 0 0.1 0 0 0 1 
i 4.569188 51.70332 0.5378755 78 78.63597 0 0.1 0 0 0 1 
i 4.93726 51.70332 2.820421 76 79.23975 0 0.1 0 0 0 1 
i 5.673405 51.70332 0.5378755 88 80.4473 0 0.1 0 0 0 1 
i 5.796096 51.70332 0.5378755 90 80.64855 0 0.1 0 0 0 1 
i 8.138376 51.90312 0.5378755 83 82.89862 0 0.1 0 0 0 1 
i 8.261067 51.92797 1.434335 88 83.08176 0 0.1 0 0 0 1 
i 8.383757 51.92797 0.7171673 91 83.28302 0 0.1 0 0 0 1 
i 8.629139 51.92797 0.7171673 86 83.68553 0 0.1 0 0 0 1 
i 8.997212 51.92797 1.434335 84 84.28931 0 0.1 0 0 0 1 
i 9.119902 51.92797 1.434335 95 84.49057 0 0.1 0 0 0 1 
i 9.303939 51.92797 0.7171673 97 84.79245 0 0.1 0 0 0 1 
i 9.487975 51.92797 0.7171673 93 85.09434 0 0.1 0 0 0 1 
i 9.733357 51.92797 1.434335 98 85.49686 0 0.1 0 0 0 1 
i 9.856047 51.92797 0.7171673 100 85.69811 0 0.1 0 0 0 1 
i 6.415127 51.99754 0.5378755 71 78.74532 0 0.1 0 0 0 1 
i 6.844545 51.99754 0.5378755 59 79.44973 0 0.1 0 0 0 1 
i 2.907285 52.23383 1.075751 65 74.5813 0 0.1 0 0 0 1 
i 3.029976 52.23383 0.5378755 68 74.78256 0 0.1 0 0 0 1 
i 3.275357 52.23383 0.5378755 63 75.18507 0 0.1 0 0 0 1 
i 3.64343 52.23383 0.5378755 61 75.78885 0 0.1 0 0 0 1 
i 3.766121 52.23383 0.5378755 72 75.9901 0 0.1 0 0 0 1 
i 4.134193 52.23383 0.5378755 70 76.59388 0 0.1 0 0 0 1 
i 4.379575 52.23383 0.5378755 74 76.99639 0 0.1 0 0 0 1 
i 3.029976 52.35159 0.5378755 44 70.5387 0 0.1 0 0 0 1 
i 3.766121 52.35159 0.5378755 53 71.74625 0 0.1 0 0 0 1 
i 6.476473 52.3516 0.5378755 92 83.09048 0 0.1 0 0 0 1 
i 7.335308 52.3516 0.5378755 102 84.49929 0 0.1 0 0 0 1 
i 4.630533 52.44032 1.545553 78 78.73593 0 0.1 0 0 0 1 
i 4.691879 52.44032 1.075751 79 78.83656 0 0.1 0 0 0 1 
i 4.998606 52.44032 0.5378755 75 79.33971 0 0.1 0 0 0 1 
i 5.550715 52.44032 0.5378755 89 80.24537 0 0.1 0 0 0 1 
i 5.734751 52.44032 1.075751 88 80.54725 0 0.1 0 0 0 1 
i 5.857442 52.44032 1.075751 90 80.74851 0 0.1 0 0 0 1 
i 5.918787 52.44032 1.075751 91 80.84914 0 0.1 0 0 0 1 
i 6.353782 52.53542 0.5378755 70 78.6447 0 0.1 0 0 0 1 
i 6.905891 52.53542 0.5378755 58 79.55036 0 0.1 0 0 0 1 
i 8.445103 52.64513 0.7171673 90 83.38365 0 0.1 0 0 0 1 
i 8.506448 52.64513 0.7171673 91 83.48428 0 0.1 0 0 0 1 
i 9.058557 52.64513 0.7171673 83 84.38994 0 0.1 0 0 0 1 
i 9.242593 52.64513 0.7171673 96 84.69182 0 0.1 0 0 0 1 
i 9.54932 52.64513 0.7171673 92 85.19497 0 0.1 0 0 0 1 
i 9.794702 52.64513 0.7171673 97 85.59748 0 0.1 0 0 0 1 
i 5.550715 52.67226 0.5378755 56 75.9995 0 0.1 0 0 0 1 
i 8.199721 52.70968 0.5378755 95 82.99857 0 0.1 0 0 0 1 
i 8.383757 52.70968 0.5378755 100 83.30046 0 0.1 0 0 0 1 
i 2.784594 52.77171 0.5378755 67 74.38004 0 0.1 0 0 0 1 
i 3.152666 52.77171 0.5378755 69 74.98382 0 0.1 0 0 0 1 
i 3.520739 52.77171 0.5378755 62 75.58759 0 0.1 0 0 0 1 
i 3.888811 52.77171 0.5378755 73 76.19136 0 0.1 0 0 0 1 
i 4.011502 52.77171 0.5378755 71 76.39262 0 0.1 0 0 0 1 
i 4.256884 52.77171 0.5378755 75 76.79514 0 0.1 0 0 0 1 
i 4.624956 52.77171 0.7443586 77 77.39891 0 0.1 0 0 0 1 
i 2.784594 52.88947 0.5378755 46 70.13618 0 0.1 0 0 0 1 
i 4.011502 52.88947 0.5378755 55 72.14876 0 0.1 0 0 0 1 
i 6.353782 52.88948 0.5378755 93 82.88922 0 0.1 0 0 0 1 
i 7.457999 52.88948 0.5378755 104 84.70055 0 0.1 0 0 0 1 
i 5.980132 52.97819 0.5378755 92 80.94977 0 0.1 0 0 0 1 
i 4.569188 53.21013 0.5378755 62 74.38943 0 0.1 0 0 0 1 
i 8.138376 53.24756 0.5378755 96 82.89795 0 0.1 0 0 0 1 
i 8.445103 53.24756 0.5378755 101 83.40109 0 0.1 0 0 0 1 
i 6.476473 53.43737 0.5378755 78 78.84528 0 0.1 0 0 0 1 
i 6.844545 53.43737 0.5378755 87 79.44906 0 0.1 0 0 0 1 
i 2.845939 53.44799 1.075751 67 74.48 0 0.1 0 0 0 1 
i 2.907285 53.44799 1.075751 66 74.58063 0 0.1 0 0 0 1 
i 3.029976 53.44799 1.075751 68 74.78189 0 0.1 0 0 0 1 
i 3.214012 53.44799 0.5378755 69 75.08377 0 0.1 0 0 0 1 
i 3.275357 53.44799 1.075751 64 75.1844 0 0.1 0 0 0 1 
i 3.459394 53.44799 1.075751 65 75.48629 0 0.1 0 0 0 1 
i 3.582084 53.44799 0.5378755 63 75.68755 0 0.1 0 0 0 1 
i 3.64343 53.44799 1.075751 61 75.78818 0 0.1 0 0 0 1 
i 3.766121 53.44799 1.075751 72 75.98943 0 0.1 0 0 0 1 
i 3.950157 53.44799 1.075751 73 76.29132 0 0.1 0 0 0 1 
i 4.072848 53.44799 1.075751 71 76.49258 0 0.1 0 0 0 1 
i 4.134193 53.44799 1.075751 70 76.59321 0 0.1 0 0 0 1 
i 4.318229 53.44799 1.075751 75 76.89509 0 0.1 0 0 0 1 
i 4.379575 53.44799 1.075751 74 76.99572 0 0.1 0 0 0 1 
i 6.415127 53.63201 0.5378755 93 82.98918 0 0.1 0 0 0 1 
i 6.476473 53.63201 1.075751 92 83.08981 0 0.1 0 0 0 1 
i 7.335308 53.63201 1.075751 103 84.49862 0 0.1 0 0 0 1 
i 7.519345 53.63201 0.5378755 104 84.8005 0 0.1 0 0 0 1 
i 2.845939 53.75105 0.5378755 46 70.23614 0 0.1 0 0 0 1 
i 3.029976 53.75105 1.075751 42 70.53803 0 0.1 0 0 0 1 
i 3.766121 53.75105 0.5378755 55 71.74558 0 0.1 0 0 0 1 
i 4.072848 53.75105 1.075751 58 72.24872 0 0.1 0 0 0 1 
i 6.353782 53.97524 0.5378755 80 78.64403 0 0.1 0 0 0 1 
i 6.967236 53.97524 0.5378755 89 79.65031 0 0.1 0 0 0 1 
i 3.336703 53.98587 0.5378755 63 75.28503 0 0.1 0 0 0 1 
i 3.520739 53.98587 0.5378755 62 75.58692 0 0.1 0 0 0 1 
i 4.624956 53.98587 0.7668774 77 77.39824 0 0.1 0 0 0 1 
i 4.630533 54.0778 1.075751 63 74.48939 0 0.1 0 0 0 1 
i 5.550715 54.0778 0.5378755 54 75.99883 0 0.1 0 0 0 1 
i 8.261067 54.0869 1.075751 88 83.09853 0 0.1 0 0 0 1 
i 8.383757 54.0869 0.5378755 87 83.29979 0 0.1 0 0 0 1 
i 6.537818 54.16989 0.5378755 91 83.19044 0 0.1 0 0 0 1 
i 7.457999 54.16989 0.5378755 104 84.69987 0 0.1 0 0 0 1 
i 5.550715 54.21487 0.5378755 86 80.2447 0 0.1 0 0 0 1 
i 2.784594 54.28893 0.5378755 45 70.13551 0 0.1 0 0 0 1 
i 3.827466 54.28893 0.5378755 54 71.84621 0 0.1 0 0 0 1 
i 5.61206 54.61568 0.5378755 53 76.09945 0 0.1 0 0 0 1 
i 8.506448 54.62478 0.5378755 87 83.50105 0 0.1 0 0 0 1 
i 4.569188 54.75275 0.5378755 81 78.63463 0 0.1 0 0 0 1 
i 6.041478 54.75275 0.5378755 90 81.04973 0 0.1 0 0 0 1 
i 6.415127 54.77598 0.5378755 77 78.74398 0 0.1 0 0 0 1 
i 6.476473 54.77598 1.279521 76 78.84461 0 0.1 0 0 0 1 
i 6.844545 54.77598 1.075751 78 79.44839 0 0.1 0 0 0 1 
i 7.028581 54.77598 1.075751 79 79.75027 0 0.1 0 0 0 1 
i 6.599163 55.10605 0.5378755 91 83.2904 0 0.1 0 0 0 1 
i 7.335308 55.10605 0.5378755 102 84.49795 0 0.1 0 0 0 1 
i 2.907285 55.18464 0.5378755 50 70.3361 0 0.1 0 0 0 1 
i 3.029976 55.18464 0.5378755 55 70.53736 0 0.1 0 0 0 1 
i 3.766121 55.18464 0.5378755 29 71.74491 0 0.1 0 0 0 1 
i 4.134193 55.18464 0.5378755 24 72.34868 0 0.1 0 0 0 1 
i 6.537818 55.31385 0.5378755 76 78.94524 0 0.1 0 0 0 1 
i 8.199721 55.36731 0.5378755 81 82.99723 0 0.1 0 0 0 1 
i 8.261067 55.36731 1.075751 83 83.09786 0 0.1 0 0 0 1 
i 8.383757 55.36731 0.5378755 79 83.29912 0 0.1 0 0 0 1 
i 8.567794 55.36731 0.5378755 78 83.60101 0 0.1 0 0 0 1 
i 4.691879 55.51762 0.5378755 55 74.58935 0 0.1 0 0 0 1 
i 4.630533 55.55348 1.075751 82 78.73459 0 0.1 0 0 0 1 
i 5.059951 55.55348 0.5378755 77 79.43899 0 0.1 0 0 0 1 
i 5.550715 55.55348 1.075751 85 80.24403 0 0.1 0 0 0 1 
i 6.102823 55.55348 0.5378755 91 81.14969 0 0.1 0 0 0 1 
i 6.353782 55.64392 0.5378755 94 82.88788 0 0.1 0 0 0 1 
i 7.58069 55.64392 0.5378755 104 84.90046 0 0.1 0 0 0 1 
i 2.784594 55.72252 0.5378755 53 70.13484 0 0.1 0 0 0 1 
i 3.152666 55.72252 0.5378755 57 70.73862 0 0.1 0 0 0 1 
i 3.888811 55.72252 0.5378755 31 71.94616 0 0.1 0 0 0 1 
i 4.011502 55.72252 0.5378755 27 72.14742 0 0.1 0 0 0 1 
i 8.138376 55.90519 0.5378755 82 82.8966 0 0.1 0 0 0 1 
i 8.445103 55.90519 0.5378755 80 83.39975 0 0.1 0 0 0 1 
i 8.506448 55.90519 0.5378755 79 83.50038 0 0.1 0 0 0 1 
i 4.569188 56.0555 0.5378755 58 74.38809 0 0.1 0 0 0 1 
i 5.673405 56.0555 0.5378755 79 76.19941 0 0.1 0 0 0 1 
i 5.121297 56.09136 0.5378755 76 79.53962 0 0.1 0 0 0 1 
i 6.041478 56.09136 0.5378755 90 81.04906 0 0.1 0 0 0 1 
i 6.599163 56.31701 0.5378755 71 79.0452 0 0.1 0 0 0 1 
i 6.844545 56.31701 0.5378755 65 79.44771 0 0.1 0 0 0 1 
i 6.415127 56.38646 0.5378755 94 82.98784 0 0.1 0 0 0 1 
i 6.599163 56.38646 0.5378755 91 83.28973 0 0.1 0 0 0 1 
i 7.335308 56.38646 1.075751 102 84.49727 0 0.1 0 0 0 1 
i 7.642036 56.38646 1.075751 105 85.00042 0 0.1 0 0 0 1 
i 2.845939 56.51746 1.075751 42 70.2348 0 0.1 0 0 0 1 
i 2.907285 56.51746 0.5378755 44 70.33543 0 0.1 0 0 0 1 
i 3.029976 56.51746 0.5378755 41 70.53669 0 0.1 0 0 0 1 
i 3.214012 56.51746 0.5378755 39 70.83857 0 0.1 0 0 0 1 
i 3.766121 56.51746 1.075751 59 71.74423 0 0.1 0 0 0 1 
i 3.950157 56.51746 0.5378755 57 72.04612 0 0.1 0 0 0 1 
i 4.072848 56.51746 0.5378755 60 72.24738 0 0.1 0 0 0 1 
i 4.134193 56.51746 1.075751 62 72.34801 0 0.1 0 0 0 1 
i 6.353782 56.85489 0.5378755 68 78.64268 0 0.1 0 0 0 1 
i 7.089927 56.85489 0.5378755 61 79.85023 0 0.1 0 0 0 1 
i 4.630533 56.85624 0.5378755 65 74.48805 0 0.1 0 0 0 1 
i 4.691879 56.85624 0.5378755 67 74.58868 0 0.1 0 0 0 1 
i 5.550715 56.85624 0.5378755 46 75.99748 0 0.1 0 0 0 1 
i 5.734751 56.85624 0.5378755 44 76.29937 0 0.1 0 0 0 1 
i 6.353782 56.92433 0.5378755 93 82.88721 0 0.1 0 0 0 1 
i 6.660509 56.92433 0.5378755 90 83.39036 0 0.1 0 0 0 1 
i 4.691879 56.92474 0.5378755 83 78.83455 0 0.1 0 0 0 1 
i 5.059951 56.92474 0.5378755 77 79.43832 0 0.1 0 0 0 1 
i 5.550715 56.92474 0.5378755 86 80.24335 0 0.1 0 0 0 1 
i 6.164169 56.92474 0.5378755 91 81.24964 0 0.1 0 0 0 1 
i 2.784594 57.05534 0.5378755 43 70.13417 0 0.1 0 0 0 1 
i 2.96863 57.05534 0.5378755 45 70.43606 0 0.1 0 0 0 1 
i 3.152666 57.05534 0.5378755 40 70.73795 0 0.1 0 0 0 1 
i 3.888811 57.05534 0.5378755 58 71.94549 0 0.1 0 0 0 1 
i 4.011502 57.05534 0.5378755 61 72.14675 0 0.1 0 0 0 1 
i 8.629139 57.14958 0.5378755 100 83.70096 0 0.1 0 0 0 1 
i 4.569188 57.39411 0.5378755 66 74.38742 0 0.1 0 0 0 1 
i 4.753224 57.39411 0.5378755 68 74.68931 0 0.1 0 0 0 1 
i 5.61206 57.39411 0.5378755 47 76.09811 0 0.1 0 0 0 1 
i 5.673405 57.39411 0.5378755 45 76.19874 0 0.1 0 0 0 1 
i 4.569188 57.46262 0.5378755 81 78.63329 0 0.1 0 0 0 1 
i 5.182642 57.46262 0.5378755 76 79.63958 0 0.1 0 0 0 1 
i 5.673405 57.46262 0.5378755 84 80.44461 0 0.1 0 0 0 1 
i 6.041478 57.46262 0.5378755 90 81.04839 0 0.1 0 0 0 1 
i 6.415127 57.65563 0.5378755 88 78.74264 0 0.1 0 0 0 1 
i 6.599163 57.65563 0.5378755 82 79.04453 0 0.1 0 0 0 1 
i 6.844545 57.65563 0.5803494 91 79.44704 0 0.1 0 0 0 1 
i 7.151272 57.65563 0.5378755 98 79.95019 0 0.1 0 0 0 1 
i 8.138376 57.68746 0.5378755 94 82.89593 0 0.1 0 0 0 1 
i 6.476473 57.6981 0.5378755 94 83.0878 0 0.1 0 0 0 1 
i 7.335308 57.6981 0.5378755 103 84.4966 0 0.1 0 0 0 1 
i 7.703381 57.6981 0.5378755 105 85.10038 0 0.1 0 0 0 1 
i 6.353782 58.1935 0.5378755 87 78.64201 0 0.1 0 0 0 1 
i 6.660509 58.1935 0.5378755 81 79.14516 0 0.1 0 0 0 1 
i 6.905891 58.1935 0.5803494 90 79.54767 0 0.1 0 0 0 1 
i 7.089927 58.1935 0.5378755 97 79.84956 0 0.1 0 0 0 1 
i 4.630533 58.19961 1.075751 82 78.73325 0 0.1 0 0 0 1 
i 4.691879 58.19961 1.075751 83 78.83388 0 0.1 0 0 0 1 
i 5.059951 58.19961 1.075751 76 79.43765 0 0.1 0 0 0 1 
i 5.243987 58.19961 0.5378755 75 79.73954 0 0.1 0 0 0 1 
i 5.550715 58.19961 0.5378755 85 80.24268 0 0.1 0 0 0 1 
i 5.734751 58.19961 1.075751 84 80.54457 0 0.1 0 0 0 1 
i 6.102823 58.19961 0.5378755 90 81.14834 0 0.1 0 0 0 1 
i 6.164169 58.19961 1.075751 91 81.24897 0 0.1 0 0 0 1 
i 6.353782 58.23598 1.757315 92 82.88654 0 0.1 0 0 0 1 
i 7.457999 58.23598 0.5378755 102 84.69786 0 0.1 0 0 0 1 
i 7.58069 58.23598 0.5378755 104 84.89912 0 0.1 0 0 0 1 
i 3.275357 58.37268 0.5378755 50 70.93853 0 0.1 0 0 0 1 
i 3.766121 58.37268 0.5378755 42 71.74356 0 0.1 0 0 0 1 
i 4.81457 58.39727 0.5378755 58 74.78927 0 0.1 0 0 0 1 
i 5.550715 58.39727 0.5378755 67 75.99681 0 0.1 0 0 0 1 
i 8.199721 58.49402 0.5378755 85 82.99589 0 0.1 0 0 0 1 
i 8.629139 58.49402 0.5378755 73 83.70029 0 0.1 0 0 0 1 
i 5.121297 58.73749 0.5378755 77 79.53828 0 0.1 0 0 0 1 
i 5.61206 58.73749 0.5378755 86 80.34331 0 0.1 0 0 0 1 
i 2.784594 58.91055 0.5378755 46 70.1335 0 0.1 0 0 0 1 
i 4.256884 58.91055 0.5378755 37 72.5486 0 0.1 0 0 0 1 
i 6.476473 58.91754 0.5378755 93 83.08713 0 0.1 0 0 0 1 
i 6.599163 58.91754 1.075751 91 83.28839 0 0.1 0 0 0 1 
i 6.7832 58.91754 1.075751 90 83.59027 0 0.1 0 0 0 1 
i 7.335308 58.91754 1.075751 103 84.49593 0 0.1 0 0 0 1 
i 7.519345 58.91754 0.5378755 102 84.79782 0 0.1 0 0 0 1 
i 7.642036 58.91754 0.5378755 104 84.99908 0 0.1 0 0 0 1 
i 7.703381 58.91754 1.075751 105 85.09971 0 0.1 0 0 0 1 
i 4.569188 58.93515 0.5378755 60 74.38675 0 0.1 0 0 0 1 
i 5.796096 58.93515 0.5378755 69 76.39933 0 0.1 0 0 0 1 
i 6.476473 59.02689 0.5378755 68 78.8426 0 0.1 0 0 0 1 
i 6.599163 59.02689 0.5378755 70 79.04386 0 0.1 0 0 0 1 
i 6.844545 59.02689 0.5378755 65 79.44637 0 0.1 0 0 0 1 
i 7.212618 59.02689 0.5378755 63 80.05015 0 0.1 0 0 0 1 
i 8.138376 59.03189 0.5378755 84 82.89526 0 0.1 0 0 0 1 
i 8.690484 59.03189 0.5378755 72 83.80092 0 0.1 0 0 0 1 
i 6.537818 59.45542 0.5378755 93 83.18776 0 0.1 0 0 0 1 
i 7.396654 59.45542 0.5378755 104 84.59656 0 0.1 0 0 0 1 
i 7.764726 59.45542 0.5378755 106 85.20034 0 0.1 0 0 0 1 
i 6.353782 59.56476 1.274868 69 78.64134 0 0.1 0 0 0 1 
i 6.721854 59.56476 0.5378755 72 79.24512 0 0.1 0 0 0 1 
i 6.967236 59.56476 0.5378755 67 79.64763 0 0.1 0 0 0 1 
i 7.089927 59.56476 0.5378755 64 79.84889 0 0.1 0 0 0 1 
i 4.81457 59.66727 0.5378755 83 79.03447 0 0.1 0 0 0 1 
i 5.059951 59.66727 0.5378755 78 79.43698 0 0.1 0 0 0 1 
i 5.550715 59.66727 0.5378755 87 80.24201 0 0.1 0 0 0 1 
i 6.28686 59.66727 0.5378755 91 81.44956 0 0.1 0 0 0 1 
i 4.630533 59.73588 0.5378755 60 74.48671 0 0.1 0 0 0 1 
i 4.81457 59.73588 0.5378755 57 74.7886 0 0.1 0 0 0 1 
i 5.857442 59.73588 0.5378755 73 76.49929 0 0.1 0 0 0 1 
i 2.845939 59.77213 0.5378755 45 70.23346 0 0.1 0 0 0 1 
i 3.275357 59.77213 0.5378755 50 70.93786 0 0.1 0 0 0 1 
i 3.766121 59.77213 0.5378755 42 71.74289 0 0.1 0 0 0 1 
i 4.318229 59.77213 0.5378755 37 72.64855 0 0.1 0 0 0 1 
i 8.261067 59.87124 0.5378755 93 83.09585 0 0.1 0 0 0 1 
i 8.629139 59.87124 0.5378755 101 83.69962 0 0.1 0 0 0 1 
i 4.569188 60.20514 0.5378755 80 78.63195 0 0.1 0 0 0 1 
i 5.305333 60.20514 0.5378755 76 79.8395 0 0.1 0 0 0 1 
i 5.796096 60.20514 0.5378755 84 80.64453 0 0.1 0 0 0 1 
i 6.041478 60.20514 0.5378755 89 81.04704 0 0.1 0 0 0 1 
i 4.569188 60.27376 0.5378755 59 74.38608 0 0.1 0 0 0 1 
i 4.875915 60.27376 0.5378755 56 74.88922 0 0.1 0 0 0 1 
i 5.796096 60.27376 0.5378755 72 76.39866 0 0.1 0 0 0 1 
i 6.415127 60.30176 1.075751 70 78.7413 0 0.1 0 0 0 1 
i 6.599163 60.30176 1.075751 71 79.04319 0 0.1 0 0 0 1 
i 6.7832 60.30176 1.075751 72 79.34507 0 0.1 0 0 0 1 
i 6.844545 60.30176 1.075751 67 79.4457 0 0.1 0 0 0 1 
i 7.028581 60.30176 1.075751 68 79.74759 0 0.1 0 0 0 1 
i 7.151272 60.30176 1.075751 66 79.94885 0 0.1 0 0 0 1 
i 7.212618 60.30176 1.075751 65 80.04948 0 0.1 0 0 0 1 
i 2.784594 60.31001 0.5378755 46 70.13283 0 0.1 0 0 0 1 
i 3.336703 60.31001 0.5378755 51 71.03849 0 0.1 0 0 0 1 
i 3.827466 60.31001 0.5378755 43 71.84352 0 0.1 0 0 0 1 
i 4.256884 60.31001 0.5378755 38 72.54792 0 0.1 0 0 0 1 
i 8.138376 60.40911 0.5378755 95 82.89459 0 0.1 0 0 0 1 
i 8.75183 60.40911 0.5378755 103 83.90088 0 0.1 0 0 0 1 
i 6.844545 60.61494 0.5378755 91 83.69023 0 0.1 0 0 0 1 
i 7.335308 60.61494 0.5378755 100 84.49526 0 0.1 0 0 0 1 
i 6.537818 60.83963 0.5378755 69 78.94256 0 0.1 0 0 0 1 
i 4.630533 60.94213 1.075751 80 78.73191 0 0.1 0 0 0 1 
i 4.81457 60.94213 1.075751 83 79.03379 0 0.1 0 0 0 1 
i 5.059951 60.94213 0.5378755 78 79.43631 0 0.1 0 0 0 1 
i 5.366678 60.94213 0.5378755 75 79.93945 0 0.1 0 0 0 1 
i 5.550715 60.94213 1.075751 87 80.24134 0 0.1 0 0 0 1 
i 5.857442 60.94213 1.075751 84 80.74449 0 0.1 0 0 0 1 
i 6.102823 60.94213 0.5378755 88 81.147 0 0.1 0 0 0 1 
i 6.28686 60.94213 0.5378755 91 81.44889 0 0.1 0 0 0 1 
i 4.691879 61.10714 0.5378755 64 74.58667 0 0.1 0 0 0 1 
i 4.81457 61.10714 0.5378755 69 74.78792 0 0.1 0 0 0 1 
i 5.550715 61.10714 0.5378755 43 75.99547 0 0.1 0 0 0 1 
i 5.918787 61.10714 0.5378755 38 76.59925 0 0.1 0 0 0 1 
i 8.199721 61.15165 1.075751 91 82.99455 0 0.1 0 0 0 1 
i 8.629139 61.15165 1.075751 93 83.69895 0 0.1 0 0 0 1 
i 6.353782 61.15282 0.5378755 96 82.8852 0 0.1 0 0 0 1 
i 7.826072 61.15282 0.5378755 104 85.30029 0 0.1 0 0 0 1 
i 2.907285 61.20573 0.5378755 51 70.33342 0 0.1 0 0 0 1 
i 3.275357 61.20573 0.5378755 39 70.93719 0 0.1 0 0 0 1 
i 3.766121 61.20573 0.5378755 58 71.74222 0 0.1 0 0 0 1 
i 4.379575 61.20573 0.5378755 69 72.74851 0 0.1 0 0 0 1 
i 5.121297 61.48001 0.5378755 79 79.53694 0 0.1 0 0 0 1 
i 5.305333 61.48001 0.5378755 76 79.83883 0 0.1 0 0 0 1 
i 6.041478 61.48001 0.5378755 89 81.04637 0 0.1 0 0 0 1 
i 6.348205 61.48001 0.5378755 92 81.54952 0 0.1 0 0 0 1 
i 4.569188 61.64502 0.5378755 67 74.38541 0 0.1 0 0 0 1 
i 4.93726 61.64502 0.5378755 72 74.98918 0 0.1 0 0 0 1 
i 5.673405 61.64502 0.5378755 46 76.19673 0 0.1 0 0 0 1 
i 5.796096 61.64502 0.5378755 41 76.39799 0 0.1 0 0 0 1 
i 8.322412 61.68953 0.5378755 90 83.19581 0 0.1 0 0 0 1 
i 2.784594 61.7436 0.5378755 48 70.13216 0 0.1 0 0 0 1 
i 3.398048 61.7436 0.5378755 37 71.13845 0 0.1 0 0 0 1 
i 3.888811 61.7436 0.5378755 55 71.94348 0 0.1 0 0 0 1 
i 4.256884 61.7436 0.5378755 66 72.54725 0 0.1 0 0 0 1 
i 6.415127 61.89535 0.5378755 97 82.98516 0 0.1 0 0 0 1 
i 6.844545 61.89535 1.075751 91 83.68956 0 0.1 0 0 0 1 
i 7.335308 61.89535 0.5378755 100 84.49459 0 0.1 0 0 0 1 
i 7.887417 61.89535 1.075751 105 85.40025 0 0.1 0 0 0 1 
i 4.691879 62.2481 0.5378755 80 78.83187 0 0.1 0 0 0 1 
i 4.81457 62.2481 0.5378755 82 79.03312 0 0.1 0 0 0 1 
i 5.059951 62.2481 0.5378755 78 79.43564 0 0.1 0 0 0 1 
i 5.428024 62.2481 0.5378755 75 80.03941 0 0.1 0 0 0 1 
i 5.550715 62.2481 0.5378755 86 80.24067 0 0.1 0 0 0 1 
i 5.918787 62.2481 0.5378755 84 80.84444 0 0.1 0 0 0 1 
i 6.164169 62.2481 0.5378755 88 81.24696 0 0.1 0 0 0 1 
i 6.28686 62.2481 1.075751 90 81.44822 0 0.1 0 0 0 1 
i 4.630533 62.38201 1.075751 57 74.48537 0 0.1 0 0 0 1 
i 4.691879 62.38201 0.5378755 58 74.586 0 0.1 0 0 0 1 
i 4.81457 62.38201 0.5378755 55 74.78725 0 0.1 0 0 0 1 
i 4.998606 62.38201 1.075751 54 75.08914 0 0.1 0 0 0 1 
i 5.550715 62.38201 0.5378755 73 75.9948 0 0.1 0 0 0 1 
i 5.734751 62.38201 0.5378755 71 76.29669 0 0.1 0 0 0 1 
i 5.857442 62.38201 1.075751 74 76.49795 0 0.1 0 0 0 1 
i 5.918787 62.38201 0.5378755 76 76.59857 0 0.1 0 0 0 1 
i 6.353782 62.43323 0.5378755 96 82.88453 0 0.1 0 0 0 1 
i 7.396654 62.43323 0.5378755 99 84.59522 0 0.1 0 0 0 1 
i 2.845939 62.53854 0.5378755 46 70.23212 0 0.1 0 0 0 1 
i 2.907285 62.53854 0.5378755 44 70.33275 0 0.1 0 0 0 1 
i 3.275357 62.53854 1.075751 53 70.93652 0 0.1 0 0 0 1 
i 3.459394 62.53854 0.5378755 55 71.23841 0 0.1 0 0 0 1 
i 3.766121 62.53854 0.5378755 40 71.74155 0 0.1 0 0 0 1 
i 3.950157 62.53854 0.5378755 42 72.04344 0 0.1 0 0 0 1 
i 4.318229 62.53854 0.5378755 32 72.64721 0 0.1 0 0 0 1 
i 4.379575 62.53854 1.075751 30 72.74784 0 0.1 0 0 0 1 
i 8.383757 62.62569 0.5378755 86 83.29577 0 0.1 0 0 0 1 
i 8.629139 62.62569 0.5378755 79 83.69828 0 0.1 0 0 0 1 
i 7.335308 62.68652 0.5378755 70 80.25006 0 0.1 0 0 0 1 
i 4.569188 62.78597 0.5378755 81 78.63061 0 0.1 0 0 0 1 
i 4.93726 62.78597 0.5378755 83 79.23438 0 0.1 0 0 0 1 
i 5.182642 62.78597 0.5378755 79 79.6369 0 0.1 0 0 0 1 
i 5.305333 62.78597 0.5378755 77 79.83816 0 0.1 0 0 0 1 
i 5.673405 62.78597 0.5378755 87 80.44193 0 0.1 0 0 0 1 
i 5.796096 62.78597 0.5378755 85 80.64319 0 0.1 0 0 0 1 
i 6.40955 62.78597 0.5378755 92 81.64948 0 0.1 0 0 0 1 
i 4.753224 62.91989 0.5378755 59 74.68662 0 0.1 0 0 0 1 
i 4.875915 62.91989 0.5378755 56 74.88788 0 0.1 0 0 0 1 
i 5.673405 62.91989 0.5378755 72 76.19606 0 0.1 0 0 0 1 
i 5.796096 62.91989 0.5378755 75 76.39732 0 0.1 0 0 0 1 
i 5.980132 62.91989 0.5378755 77 76.6992 0 0.1 0 0 0 1 
i 2.784594 63.07642 0.5378755 45 70.13149 0 0.1 0 0 0 1 
i 2.96863 63.07642 0.5378755 43 70.43338 0 0.1 0 0 0 1 
i 3.398048 63.07642 0.5378755 54 71.13778 0 0.1 0 0 0 1 
i 3.827466 63.07642 0.5378755 39 71.84218 0 0.1 0 0 0 1 
i 3.888811 63.07642 0.5378755 41 71.94281 0 0.1 0 0 0 1 
i 4.256884 63.07642 0.5378755 31 72.54658 0 0.1 0 0 0 1 
i 8.138376 63.16356 0.5378755 82 82.89325 0 0.1 0 0 0 1 
i 8.874521 63.16356 0.5378755 76 84.1008 0 0.1 0 0 0 1 
i 6.476473 63.20699 0.5378755 97 83.08512 0 0.1 0 0 0 1 
i 6.844545 63.20699 0.5378755 91 83.68889 0 0.1 0 0 0 1 
i 7.335308 63.20699 0.5378755 100 84.49392 0 0.1 0 0 0 1 
i 7.948763 63.20699 0.5378755 105 85.50021 0 0.1 0 0 0 1 
i 6.353782 63.2244 0.5378755 76 78.64 0 0.1 0 0 0 1 
i 4.630533 63.46226 1.075751 81 78.73057 0 0.1 0 0 0 1 
i 4.691879 63.46226 1.075751 80 78.83119 0 0.1 0 0 0 1 
i 4.81457 63.46226 1.075751 82 79.03245 0 0.1 0 0 0 1 
i 4.998606 63.46226 1.075751 83 79.33434 0 0.1 0 0 0 1 
i 5.059951 63.46226 1.075751 78 79.43497 0 0.1 0 0 0 1 
i 5.243987 63.46226 0.5378755 79 79.73686 0 0.1 0 0 0 1 
i 5.366678 63.46226 1.075751 77 79.93811 0 0.1 0 0 0 1 
i 5.428024 63.46226 1.075751 76 80.03874 0 0.1 0 0 0 1 
i 5.550715 63.46226 1.075751 86 80.24 0 0.1 0 0 0 1 
i 5.734751 63.46226 1.075751 88 80.54189 0 0.1 0 0 0 1 
i 5.857442 63.46226 1.075751 85 80.74314 0 0.1 0 0 0 1 
i 5.918787 63.46226 1.075751 84 80.84377 0 0.1 0 0 0 1 
i 6.102823 63.46226 1.075751 90 81.14566 0 0.1 0 0 0 1 
i 6.164169 63.46226 1.075751 89 81.24629 0 0.1 0 0 0 1 
i 6.28686 63.46226 1.075751 91 81.44755 0 0.1 0 0 0 1 
i 6.470896 63.46226 0.5378755 92 81.74943 0 0.1 0 0 0 1 
i 6.353782 63.74487 0.5378755 96 82.88386 0 0.1 0 0 0 1 
i 6.967236 63.74487 0.5378755 90 83.89015 0 0.1 0 0 0 1 
i 7.457999 63.74487 0.5378755 99 84.69518 0 0.1 0 0 0 1 
i 7.826072 63.74487 0.5378755 104 85.29895 0 0.1 0 0 0 1 
i 8.199721 63.9061 0.5378755 103 82.99321 0 0.1 0 0 0 1 
i 8.383757 63.9061 0.5378755 96 83.29509 0 0.1 0 0 0 1 
i 8.629139 63.9061 0.5378755 106 83.69761 0 0.1 0 0 0 1 
i 8.935866 63.9061 0.5378755 112 84.20075 0 0.1 0 0 0 1 
i 5.489369 64.00013 0.5378755 75 80.13937 0 0.1 0 0 0 1 
i 5.673405 64.00013 0.5378755 87 80.44126 0 0.1 0 0 0 1 
i 3.029976 64.07291 1.075751 47 70.53333 0 0.1 0 0 0 1 
i 3.275357 64.07291 0.5378755 46 70.93585 0 0.1 0 0 0 1 
i 3.766121 64.07291 1.075751 48 71.74088 0 0.1 0 0 0 1 
i 4.502266 64.07291 0.5378755 49 72.94843 0 0.1 0 0 0 1 
i 6.415127 64.09206 1.075751 77 78.73996 0 0.1 0 0 0 1 
i 7.335308 64.09206 1.075751 68 80.24939 0 0.1 0 0 0 1 
i 5.059951 64.15657 0.5378755 65 75.1891 0 0.1 0 0 0 1 
i 5.550715 64.15657 0.5378755 56 75.99413 0 0.1 0 0 0 1 
i 6.88916 64.41052 0.7171673 59 70.10667 0 0.1 0 0 0 1 
i 6.415127 64.42643 1.075751 96 82.98382 0 0.1 0 0 0 1 
i 6.476473 64.42643 0.5378755 97 83.08444 0 0.1 0 0 0 1 
i 6.844545 64.42643 1.075751 91 83.68822 0 0.1 0 0 0 1 
i 7.028581 64.42643 1.075751 90 83.9901 0 0.1 0 0 0 1 
i 7.335308 64.42643 1.075751 99 84.49325 0 0.1 0 0 0 1 
i 7.519345 64.42643 0.5378755 98 84.79514 0 0.1 0 0 0 1 
i 7.887417 64.42643 0.5378755 104 85.39891 0 0.1 0 0 0 1 
i 7.948763 64.42643 1.075751 105 85.49954 0 0.1 0 0 0 1 
i 8.138376 64.44397 0.5378755 101 82.89258 0 0.1 0 0 0 1 
i 8.445103 64.44397 0.5378755 95 83.39572 0 0.1 0 0 0 1 
i 8.690484 64.44397 0.5378755 104 83.79824 0 0.1 0 0 0 1 
i 8.874521 64.44397 0.5378755 111 84.10013 0 0.1 0 0 0 1 
i 3.520739 64.61078 0.5378755 46 71.33836 0 0.1 0 0 0 1 
i 4.569188 64.69444 0.5378755 60 74.38407 0 0.1 0 0 0 1 
i 6.041478 64.69444 0.5378755 52 76.79916 0 0.1 0 0 0 1 
i 6.537818 64.96431 0.5378755 97 83.18507 0 0.1 0 0 0 1 
i 7.396654 64.96431 0.5378755 100 84.59388 0 0.1 0 0 0 1 
i 8.010108 64.96431 0.5378755 106 85.60017 0 0.1 0 0 0 1 
i 8.261067 65.21774 0.5378755 82 83.09317 0 0.1 0 0 0 1 
i 8.383757 65.21774 0.5378755 85 83.29442 0 0.1 0 0 0 1 
i 8.629139 65.21774 0.5378755 79 83.69694 0 0.1 0 0 0 1 
i 8.997212 65.21774 0.5378755 77 84.30071 0 0.1 0 0 0 1 
i 2.845939 65.30973 1.434335 49 70.20662 0 0.1 0 0 0 1 
i 6.950505 65.30973 0.7171673 61 70.20662 0 0.1 0 0 0 1 
i 2.845939 65.40572 0.5378755 45 70.23078 0 0.1 0 0 0 1 
i 3.029976 65.40572 0.5378755 50 70.53266 0 0.1 0 0 0 1 
i 3.275357 65.40572 0.5378755 43 70.93518 0 0.1 0 0 0 1 
i 3.582084 65.40572 0.5378755 37 71.43832 0 0.1 0 0 0 1 
i 3.766121 65.40572 0.5378755 58 71.74021 0 0.1 0 0 0 1 
i 4.072848 65.40572 0.5378755 53 72.24335 0 0.1 0 0 0 1 
i 4.318229 65.40572 0.5378755 60 72.64587 0 0.1 0 0 0 1 
i 4.502266 65.40572 0.5378755 66 72.94776 0 0.1 0 0 0 1 
i 4.630533 65.49518 1.075751 60 74.48403 0 0.1 0 0 0 1 
i 5.059951 65.49518 1.075751 65 75.18843 0 0.1 0 0 0 1 
i 5.550715 65.49518 1.075751 57 75.99346 0 0.1 0 0 0 1 
i 6.102823 65.49518 1.075751 52 76.89912 0 0.1 0 0 0 1 
i 6.476473 65.53189 0.5378755 69 78.83992 0 0.1 0 0 0 1 
i 7.335308 65.53189 0.5378755 90 80.24872 0 0.1 0 0 0 1 
i 8.138376 65.75561 0.5378755 84 82.89191 0 0.1 0 0 0 1 
i 8.506448 65.75561 0.5378755 86 83.49568 0 0.1 0 0 0 1 
i 8.75183 65.75561 0.5378755 81 83.8982 0 0.1 0 0 0 1 
i 8.874521 65.75561 0.5378755 78 84.09945 0 0.1 0 0 0 1 
i 6.599163 65.83027 0.5378755 97 83.28503 0 0.1 0 0 0 1 
i 6.844545 65.83027 0.7773652 93 83.68755 0 0.1 0 0 0 1 
i 7.335308 65.83027 0.5378755 101 84.49258 0 0.1 0 0 0 1 
i 8.071453 65.83027 0.5378755 105 85.70013 0 0.1 0 0 0 1 
i 2.784594 65.9436 0.5378755 46 70.13015 0 0.1 0 0 0 1 
i 3.091321 65.9436 0.5378755 51 70.63329 0 0.1 0 0 0 1 
i 3.336703 65.9436 0.5378755 44 71.03581 0 0.1 0 0 0 1 
i 3.520739 65.9436 0.5378755 38 71.33769 0 0.1 0 0 0 1 
i 3.827466 65.9436 0.5378755 59 71.84084 0 0.1 0 0 0 1 
i 4.011502 65.9436 0.5378755 54 72.14273 0 0.1 0 0 0 1 
i 4.256884 65.9436 0.5378755 61 72.54524 0 0.1 0 0 0 1 
i 4.563611 65.9436 0.5378755 67 73.04839 0 0.1 0 0 0 1 
i 6.88916 66.0269 0.7171673 60 70.106 0 0.1 0 0 0 1 
i 6.353782 66.06976 0.5378755 72 78.63866 0 0.1 0 0 0 1 
i 6.353782 66.36815 0.5378755 94 82.88252 0 0.1 0 0 0 1 
i 7.089927 66.36815 0.5378755 90 84.09006 0 0.1 0 0 0 1 
i 7.58069 66.36815 0.5378755 99 84.89509 0 0.1 0 0 0 1 
i 7.826072 66.36815 0.5378755 103 85.29761 0 0.1 0 0 0 1 
i 8.199721 66.43718 1.075751 85 82.99187 0 0.1 0 0 0 1 
i 8.261067 66.43718 1.075751 84 83.09249 0 0.1 0 0 0 1 
i 8.383757 66.43718 0.5378755 86 83.29375 0 0.1 0 0 0 1 
i 8.567794 66.43718 0.5378755 87 83.59564 0 0.1 0 0 0 1 
i 8.629139 66.43718 1.075751 82 83.69627 0 0.1 0 0 0 1 
i 8.813175 66.43718 0.5378755 83 83.99816 0 0.1 0 0 0 1 
i 8.935866 66.43718 1.075751 81 84.19941 0 0.1 0 0 0 1 
i 8.997212 66.43718 1.075751 80 84.30004 0 0.1 0 0 0 1 
i 2.907285 66.77105 0.5378755 49 70.33073 0 0.1 0 0 0 1 
i 3.029976 66.77105 0.5378755 44 70.53199 0 0.1 0 0 0 1 
i 3.275357 66.77105 0.5378755 53 70.93451 0 0.1 0 0 0 1 
i 3.64343 66.77105 0.5378755 58 71.53828 0 0.1 0 0 0 1 
i 3.766121 66.77105 0.5378755 36 71.73954 0 0.1 0 0 0 1 
i 4.134193 66.77105 0.5378755 40 72.34331 0 0.1 0 0 0 1 
i 4.379575 66.77105 0.5378755 31 72.74583 0 0.1 0 0 0 1 
i 4.502266 66.77105 0.5378755 27 72.94709 0 0.1 0 0 0 1 
i 4.691879 66.86644 0.5378755 65 74.58398 0 0.1 0 0 0 1 
i 5.059951 66.86644 0.5378755 54 75.18776 0 0.1 0 0 0 1 
i 5.550715 66.86644 0.5378755 72 75.99279 0 0.1 0 0 0 1 
i 6.164169 66.86644 0.5378755 83 76.99908 0 0.1 0 0 0 1 
i 6.415127 66.8705 0.5378755 79 78.73862 0 0.1 0 0 0 1 
i 6.476473 66.8705 1.071692 81 78.83925 0 0.1 0 0 0 1 
i 7.335308 66.8705 0.5378755 60 80.24805 0 0.1 0 0 0 1 
i 7.519345 66.8705 0.5378755 58 80.54994 0 0.1 0 0 0 1 
i 2.907285 66.96553 0.7171673 50 70.30658 0 0.1 0 0 0 1 
i 7.011851 66.96553 0.7171673 62 70.30658 0 0.1 0 0 0 1 
i 8.322412 66.97505 0.5378755 83 83.19312 0 0.1 0 0 0 1 
i 8.506448 66.97505 0.5378755 86 83.49501 0 0.1 0 0 0 1 
i 9.058557 66.97505 0.5378755 79 84.40067 0 0.1 0 0 0 1 
i 6.415127 67.04971 1.075751 94 82.98247 0 0.1 0 0 0 1 
i 6.599163 67.04971 1.075751 97 83.28436 0 0.1 0 0 0 1 
i 6.844545 67.04971 1.075751 93 83.68688 0 0.1 0 0 0 1 
i 7.151272 67.04971 1.075751 90 84.19002 0 0.1 0 0 0 1 
i 7.335308 67.04971 0.5378755 101 84.49191 0 0.1 0 0 0 1 
i 7.642036 67.04971 0.5378755 98 84.99505 0 0.1 0 0 0 1 
i 7.887417 67.04971 1.075751 103 85.39757 0 0.1 0 0 0 1 
i 8.071453 67.04971 0.5378755 105 85.69945 0 0.1 0 0 0 1 
i 2.784594 67.30892 0.5378755 46 70.12948 0 0.1 0 0 0 1 
i 3.152666 67.30892 0.5378755 42 70.73325 0 0.1 0 0 0 1 
i 3.398048 67.30892 0.5378755 51 71.13577 0 0.1 0 0 0 1 
i 3.520739 67.30892 0.5378755 55 71.33702 0 0.1 0 0 0 1 
i 3.888811 67.30892 0.5378755 33 71.9408 0 0.1 0 0 0 1 
i 4.011502 67.30892 0.5378755 37 72.14205 0 0.1 0 0 0 1 
i 4.256884 67.30892 0.5378755 29 72.54457 0 0.1 0 0 0 1 
i 4.624956 67.30892 0.5378755 24 73.14834 0 0.1 0 0 0 1 
i 4.569188 67.40432 0.5378755 62 74.38273 0 0.1 0 0 0 1 
i 5.182642 67.40432 0.5378755 51 75.38901 0 0.1 0 0 0 1 
i 5.673405 67.40432 0.5378755 69 76.19405 0 0.1 0 0 0 1 
i 6.353782 67.40837 0.5378755 80 78.63799 0 0.1 0 0 0 1 
i 6.537818 67.40837 0.5378755 82 78.93987 0 0.1 0 0 0 1 
i 7.396654 67.40837 0.9914874 61 80.34868 0 0.1 0 0 0 1 
i 7.457999 67.40837 0.5378755 59 80.44931 0 0.1 0 0 0 1 
i 7.396654 67.58759 0.5378755 102 84.59254 0 0.1 0 0 0 1 
i 7.58069 67.58759 0.5378755 99 84.89442 0 0.1 0 0 0 1 
i 8.132799 67.58759 0.5378755 106 85.80008 0 0.1 0 0 0 1 
i 2.784594 67.6827 0.7171673 49 70.10532 0 0.1 0 0 0 1 
i 2.845939 68.0404 1.075751 47 70.22943 0 0.1 0 0 0 1 
i 3.275357 68.0404 1.075751 46 70.93384 0 0.1 0 0 0 1 
i 3.582084 68.0404 1.075751 46 71.43698 0 0.1 0 0 0 1 
i 3.766121 68.0404 1.075751 48 71.73887 0 0.1 0 0 0 1 
i 4.134193 68.0404 1.075751 47 72.34264 0 0.1 0 0 0 1 
i 4.502266 68.0404 1.075751 49 72.94642 0 0.1 0 0 0 1 
i 4.630533 68.14131 0.5378755 60 74.48268 0 0.1 0 0 0 1 
i 4.691879 68.14131 0.5378755 58 74.58331 0 0.1 0 0 0 1 
i 5.059951 68.14131 0.5378755 68 75.18709 0 0.1 0 0 0 1 
i 5.243987 68.14131 1.075751 69 75.48897 0 0.1 0 0 0 1 
i 5.550715 68.14131 0.5378755 54 75.99212 0 0.1 0 0 0 1 
i 5.734751 68.14131 0.5378755 56 76.294 0 0.1 0 0 0 1 
i 6.102823 68.14131 0.5378755 46 76.89778 0 0.1 0 0 0 1 
i 6.164169 68.14131 1.075751 45 76.99841 0 0.1 0 0 0 1 
i 6.476473 68.29889 0.5378755 94 83.08243 0 0.1 0 0 0 1 
i 6.599163 68.29889 0.5378755 96 83.28369 0 0.1 0 0 0 1 
i 6.844545 68.29889 0.5378755 92 83.68621 0 0.1 0 0 0 1 
i 7.212618 68.29889 0.5378755 90 84.28998 0 0.1 0 0 0 1 
i 7.335308 68.29889 0.5378755 100 84.49124 0 0.1 0 0 0 1 
i 7.703381 68.29889 0.5378755 98 85.09501 0 0.1 0 0 0 1 
i 7.948763 68.29889 0.5378755 103 85.49753 0 0.1 0 0 0 1 
i 8.071453 68.29889 0.5378755 105 85.69878 0 0.1 0 0 0 1 
i 6.599163 68.41154 0.5378755 72 79.03983 0 0.1 0 0 0 1 
i 7.335308 68.41154 0.5378755 81 80.24738 0 0.1 0 0 0 1 
i 2.845939 68.50493 0.7171673 50 70.20528 0 0.1 0 0 0 1 
i 2.907285 68.50493 1.434335 51 70.30591 0 0.1 0 0 0 1 
i 6.950505 68.50493 1.434335 62 70.20528 0 0.1 0 0 0 1 
i 7.011851 68.50493 1.434335 63 70.30591 0 0.1 0 0 0 1 
i 4.563611 68.57827 0.5378755 48 73.04704 0 0.1 0 0 0 1 
i 4.569188 68.67918 0.5378755 59 74.38205 0 0.1 0 0 0 1 
i 4.753224 68.67918 0.5378755 57 74.68394 0 0.1 0 0 0 1 
i 5.121297 68.67918 0.5378755 67 75.28771 0 0.1 0 0 0 1 
i 5.61206 68.67918 0.5378755 53 76.09275 0 0.1 0 0 0 1 
i 5.673405 68.67918 0.5378755 55 76.19338 0 0.1 0 0 0 1 
i 6.225514 68.67918 0.5378755 44 77.09904 0 0.1 0 0 0 1 
i 9.119902 68.71826 0.5378755 85 84.50063 0 0.1 0 0 0 1 
i 6.353782 68.83677 0.5378755 95 82.88117 0 0.1 0 0 0 1 
i 6.721854 68.83677 0.5378755 97 83.48495 0 0.1 0 0 0 1 
i 6.967236 68.83677 0.5378755 93 83.88746 0 0.1 0 0 0 1 
i 7.089927 68.83677 0.5378755 91 84.08872 0 0.1 0 0 0 1 
i 7.457999 68.83677 0.5378755 102 84.69249 0 0.1 0 0 0 1 
i 7.58069 68.83677 0.5378755 100 84.89375 0 0.1 0 0 0 1 
i 7.826072 68.83677 0.5378755 104 85.29627 0 0.1 0 0 0 1 
i 8.194144 68.83677 0.5378755 106 85.90004 0 0.1 0 0 0 1 
i 6.353782 68.94941 0.5378755 74 78.63732 0 0.1 0 0 0 1 
i 7.58069 68.94941 0.5378755 83 80.6499 0 0.1 0 0 0 1 
i 2.96863 69.2221 0.7171673 52 70.40654 0 0.1 0 0 0 1 
i 8.138376 69.25613 0.5378755 90 82.89057 0 0.1 0 0 0 1 
i 6.415127 69.46027 1.075751 95 82.98113 0 0.1 0 0 0 1 
i 6.476473 69.46027 0.5378755 94 83.08176 0 0.1 0 0 0 1 
i 6.599163 69.46027 1.075751 96 83.28302 0 0.1 0 0 0 1 
i 6.7832 69.46027 0.5378755 98 83.58491 0 0.1 0 0 0 1 
i 6.844545 69.46027 1.075751 92 83.68553 0 0.1 0 0 0 1 
i 7.028581 69.46027 1.075751 93 83.98742 0 0.1 0 0 0 1 
i 7.151272 69.46027 1.075751 91 84.18868 0 0.1 0 0 0 1 
i 7.212618 69.46027 1.075751 90 84.28931 0 0.1 0 0 0 1 
i 7.335308 69.46027 1.075751 101 84.49057 0 0.1 0 0 0 1 
i 7.519345 69.46027 1.075751 102 84.79245 0 0.1 0 0 0 1 
i 7.642036 69.46027 0.5378755 100 84.99371 0 0.1 0 0 0 1 
i 7.703381 69.46027 1.075751 99 85.09434 0 0.1 0 0 0 1 
i 7.887417 69.46027 1.075751 104 85.39623 0 0.1 0 0 0 1 
i 7.948763 69.46027 1.075751 103 85.49686 0 0.1 0 0 0 1 
i 8.071453 69.46027 0.5378755 105 85.69811 0 0.1 0 0 0 1 
i 8.25549 69.46027 1.075751 106 86 0 0.1 0 0 0 1 
i 4.81457 69.60896 1.075751 61 74.7839 0 0.1 0 0 0 1 
i 5.550715 69.60896 1.075751 62 75.99145 0 0.1 0 0 0 1 
i 6.28686 69.60896 1.075751 63 77.19899 0 0.1 0 0 0 1 
i 6.415127 69.75015 1.075751 74 78.73727 0 0.1 0 0 0 1 
i 6.599163 69.75015 0.5378755 71 79.03916 0 0.1 0 0 0 1 
i 7.335308 69.75015 0.5378755 84 80.24671 0 0.1 0 0 0 1 
i 7.642036 69.75015 0.5378755 87 80.74985 0 0.1 0 0 0 1 
i 6.537818 69.99814 0.5378755 94 83.18239 0 0.1 0 0 0 1 
i 6.721854 69.99814 0.5378755 97 83.48428 0 0.1 0 0 0 1 
i 7.396654 69.99814 0.5378755 100 84.59119 0 0.1 0 0 0 1 
i 7.764726 69.99814 0.5378755 98 85.19497 0 0.1 0 0 0 1 
i 8.199721 70.06269 0.5378755 92 82.99052 0 0.1 0 0 0 1 
i 9.119902 70.06269 1.075751 82 84.49996 0 0.1 0 0 0 1 
i 5.305333 70.14684 0.5378755 60 75.58893 0 0.1 0 0 0 1 
i 3.029976 70.27712 0.7171673 52 70.5065 0 0.1 0 0 0 1 
i 7.134542 70.27712 0.7171673 64 70.5065 0 0.1 0 0 0 1 
i 6.660509 70.28802 0.5378755 70 79.13979 0 0.1 0 0 0 1 
i 7.396654 70.28802 0.5378755 83 80.34734 0 0.1 0 0 0 1 
i 7.58069 70.28802 0.5378755 86 80.64922 0 0.1 0 0 0 1 
i 8.138376 70.60056 0.5378755 91 82.8899 0 0.1 0 0 0 1 
i 4.630533 70.88383 0.5378755 59 74.48134 0 0.1 0 0 0 1 
i 4.81457 70.88383 0.5378755 64 74.78323 0 0.1 0 0 0 1 
i 5.059951 70.88383 0.5378755 57 75.18574 0 0.1 0 0 0 1 
i 5.366678 70.88383 0.5378755 52 75.68889 0 0.1 0 0 0 1 
i 5.550715 70.88383 0.5378755 72 75.99078 0 0.1 0 0 0 1 
i 5.857442 70.88383 0.5378755 67 76.49392 0 0.1 0 0 0 1 
i 6.102823 70.88383 0.5378755 75 76.89644 0 0.1 0 0 0 1 
i 6.28686 70.88383 0.5378755 80 77.19832 0 0.1 0 0 0 1 
i 2.784594 70.99429 0.7171673 49 70.10398 0 0.1 0 0 0 1 
i 6.88916 70.99429 0.7171673 61 70.10398 0 0.1 0 0 0 1 
i 6.476473 71.12141 0.5378755 78 78.83723 0 0.1 0 0 0 1 
i 6.599163 71.12141 0.5378755 83 79.03849 0 0.1 0 0 0 1 
i 7.335308 71.12141 0.5378755 57 80.24604 0 0.1 0 0 0 1 
i 7.703381 71.12141 0.5378755 53 80.84981 0 0.1 0 0 0 1 
i 4.569188 71.42171 0.5378755 60 74.38071 0 0.1 0 0 0 1 
i 4.875915 71.42171 0.5378755 65 74.88386 0 0.1 0 0 0 1 
i 5.121297 71.42171 0.5378755 58 75.28637 0 0.1 0 0 0 1 
i 5.305333 71.42171 0.5378755 53 75.58826 0 0.1 0 0 0 1 
i 5.61206 71.42171 0.5378755 73 76.0914 0 0.1 0 0 0 1 
i 5.796096 71.42171 0.5378755 68 76.39329 0 0.1 0 0 0 1 
i 6.041478 71.42171 0.5378755 76 76.79581 0 0.1 0 0 0 1 
i 6.348205 71.42171 0.775453 81 77.29895 0 0.1 0 0 0 1 
i 8.261067 71.43991 0.5378755 84 83.09048 0 0.1 0 0 0 1 
i 9.119902 71.43991 0.5378755 105 84.49929 0 0.1 0 0 0 1 
i 6.721854 71.65928 0.5378755 86 79.23975 0 0.1 0 0 0 1 
i 7.457999 71.65928 0.5378755 60 80.4473 0 0.1 0 0 0 1 
i 7.58069 71.65928 0.5378755 55 80.64855 0 0.1 0 0 0 1 
i 2.845939 71.81653 1.434335 50 70.20394 0 0.1 0 0 0 1 
i 3.029976 71.81653 1.434335 53 70.50583 0 0.1 0 0 0 1 
i 6.950505 71.81653 0.7171673 61 70.20394 0 0.1 0 0 0 1 
i 7.134542 71.81653 0.7171673 64 70.50583 0 0.1 0 0 0 1 
i 8.138376 71.97779 0.9563651 86 82.88922 0 0.1 0 0 0 1 
i 9.242593 71.97779 0.5378755 107 84.70055 0 0.1 0 0 0 1 
i 4.691879 72.18979 0.5378755 63 74.5813 0 0.1 0 0 0 1 
i 4.81457 72.18979 0.5378755 59 74.78256 0 0.1 0 0 0 1 
i 5.059951 72.18979 0.5378755 68 75.18507 0 0.1 0 0 0 1 
i 5.428024 72.18979 0.5378755 72 75.78885 0 0.1 0 0 0 1 
i 5.550715 72.18979 0.5378755 50 75.9901 0 0.1 0 0 0 1 
i 5.918787 72.18979 0.5378755 54 76.59388 0 0.1 0 0 0 1 
i 6.164169 72.18979 0.5378755 46 76.99639 0 0.1 0 0 0 1 
i 6.28686 72.18979 0.5378755 41 77.19765 0 0.1 0 0 0 1 
i 6.415127 72.39628 0.5378755 71 78.73593 0 0.1 0 0 0 1 
i 6.476473 72.39628 1.075751 72 78.83656 0 0.1 0 0 0 1 
i 6.599163 72.39628 1.075751 69 79.03782 0 0.1 0 0 0 1 
i 6.7832 72.39628 0.5378755 68 79.33971 0 0.1 0 0 0 1 
i 7.335308 72.39628 0.5378755 87 80.24537 0 0.1 0 0 0 1 
i 7.642036 72.39628 1.075751 89 80.74851 0 0.1 0 0 0 1 
i 7.703381 72.39628 0.5378755 90 80.84914 0 0.1 0 0 0 1 
i 6.88916 72.53369 0.7171673 62 70.10331 0 0.1 0 0 0 1 
i 7.195887 72.53369 0.7171673 65 70.60646 0 0.1 0 0 0 1 
i 8.199721 72.72032 0.5378755 94 82.98918 0 0.1 0 0 0 1 
i 8.261067 72.72032 1.075751 95 83.08981 0 0.1 0 0 0 1 
i 9.119902 72.72032 0.5378755 74 84.49862 0 0.1 0 0 0 1 
i 9.303939 72.72032 0.5378755 72 84.8005 0 0.1 0 0 0 1 
i 4.569188 72.72767 0.5378755 61 74.38004 0 0.1 0 0 0 1 
i 4.93726 72.72767 0.5378755 56 74.98382 0 0.1 0 0 0 1 
i 5.182642 72.72767 0.5378755 65 75.38633 0 0.1 0 0 0 1 
i 5.305333 72.72767 0.5378755 69 75.58759 0 0.1 0 0 0 1 
i 5.673405 72.72767 0.5378755 47 76.19136 0 0.1 0 0 0 1 
i 5.796096 72.72767 0.5378755 52 76.39262 0 0.1 0 0 0 1 
i 6.041478 72.72767 0.5378755 43 76.79514 0 0.1 0 0 0 1 
i 6.40955 72.72767 0.5378755 39 77.39891 0 0.1 0 0 0 1 
i 6.537818 72.93415 0.5378755 73 78.93719 0 0.1 0 0 0 1 
i 6.660509 72.93415 0.5378755 70 79.13845 0 0.1 0 0 0 1 
i 7.396654 72.93415 0.5378755 88 80.346 0 0.1 0 0 0 1 
i 7.457999 72.93415 0.5378755 86 80.44662 0 0.1 0 0 0 1 
i 7.764726 72.93415 0.5378755 91 80.94977 0 0.1 0 0 0 1 
i 8.322412 73.2582 0.5378755 96 83.19044 0 0.1 0 0 0 1 
i 9.181248 73.2582 0.5378755 75 84.59925 0 0.1 0 0 0 1 
i 9.242593 73.2582 0.5378755 73 84.69987 0 0.1 0 0 0 1 
i 2.907285 73.39348 0.7171673 50 70.3039 0 0.1 0 0 0 1 
i 3.029976 73.39348 0.7171673 53 70.50516 0 0.1 0 0 0 1 
i 7.011851 73.39348 0.7171673 62 70.3039 0 0.1 0 0 0 1 
i 7.134542 73.39348 0.7171673 64 70.50516 0 0.1 0 0 0 1 
i 4.630533 73.40395 1.075751 61 74.48 0 0.1 0 0 0 1 
i 4.998606 73.40395 0.5378755 62 75.08377 0 0.1 0 0 0 1 
i 5.366678 73.40395 1.075751 60 75.68755 0 0.1 0 0 0 1 
i 5.550715 73.40395 1.075751 62 75.98943 0 0.1 0 0 0 1 
i 6.102823 73.40395 1.075751 63 76.89509 0 0.1 0 0 0 1 
i 2.784594 74.11064 0.7171673 52 70.10264 0 0.1 0 0 0 1 
i 3.152666 74.11064 0.7171673 54 70.70642 0 0.1 0 0 0 1 
i 6.88916 74.11064 0.7171673 63 70.10264 0 0.1 0 0 0 1 
i 7.257232 74.11064 0.7171673 66 70.70642 0 0.1 0 0 0 1 
i 6.844545 74.17083 0.5378755 79 79.43966 0 0.1 0 0 0 1 
i 7.335308 74.17083 0.5378755 70 80.2447 0 0.1 0 0 0 1 
i 8.383757 74.19436 0.5378755 87 83.2904 0 0.1 0 0 0 1 
i 9.119902 74.19436 0.5378755 95 84.49795 0 0.1 0 0 0 1 
i 6.353782 74.70871 0.5378755 75 78.63463 0 0.1 0 0 0 1 
i 7.826072 74.70871 0.5378755 66 81.04973 0 0.1 0 0 0 1 
i 8.138376 74.73223 0.5378755 89 82.88788 0 0.1 0 0 0 1 
i 9.365284 74.73223 0.5378755 97 84.90046 0 0.1 0 0 0 1 
i 2.845939 74.85958 1.434335 53 70.2026 0 0.1 0 0 0 1 
i 2.907285 74.85958 1.434335 52 70.30323 0 0.1 0 0 0 1 
i 3.029976 74.85958 0.7171673 54 70.50449 0 0.1 0 0 0 1 
i 3.214012 74.85958 1.434335 55 70.80637 0 0.1 0 0 0 1 
i 6.950505 74.85958 1.434335 64 70.2026 0 0.1 0 0 0 1 
i 7.011851 74.85958 1.434335 63 70.30323 0 0.1 0 0 0 1 
i 7.134542 74.85958 1.434335 65 70.50449 0 0.1 0 0 0 1 
i 7.318578 74.85958 0.7171673 67 70.80637 0 0.1 0 0 0 1 
i 8.199721 75.47477 0.5378755 89 82.98784 0 0.1 0 0 0 1 
i 8.383757 75.47477 1.075751 85 83.28973 0 0.1 0 0 0 1 
i 9.119902 75.47477 0.5378755 98 84.49727 0 0.1 0 0 0 1 
i 9.426629 75.47477 0.5378755 101 85.00042 0 0.1 0 0 0 1 
i 6.415127 75.50944 1.075751 74 78.73459 0 0.1 0 0 0 1 
i 6.844545 75.50944 1.075751 79 79.43899 0 0.1 0 0 0 1 
i 7.335308 75.50944 0.5378755 71 80.24403 0 0.1 0 0 0 1 
i 7.887417 75.50944 1.075751 66 81.14969 0 0.1 0 0 0 1 
i 2.96863 75.57674 0.7171673 51 70.40386 0 0.1 0 0 0 1 
i 7.257232 75.57674 0.7171673 66 70.70574 0 0.1 0 0 0 1 
i 8.138376 76.01264 0.5378755 88 82.88721 0 0.1 0 0 0 1 
i 9.181248 76.01264 0.5378755 97 84.5979 0 0.1 0 0 0 1 
i 9.365284 76.01264 0.5378755 100 84.89979 0 0.1 0 0 0 1 
i 7.396654 76.04732 1.276966 72 80.34465 0 0.1 0 0 0 1 
i 8.261067 76.78641 0.5378755 93 83.0878 0 0.1 0 0 0 1 
i 8.383757 76.78641 0.5378755 97 83.28906 0 0.1 0 0 0 1 
i 9.119902 76.78641 0.5378755 71 84.4966 0 0.1 0 0 0 1 
i 9.487975 76.78641 0.5378755 67 85.10038 0 0.1 0 0 0 1 
i 6.476473 76.8807 0.5378755 79 78.83455 0 0.1 0 0 0 1 
i 6.844545 76.8807 0.5378755 68 79.43832 0 0.1 0 0 0 1 
i 7.335308 76.8807 0.5378755 86 80.24335 0 0.1 0 0 0 1 
i 7.948763 76.8807 0.5378755 98 81.24964 0 0.1 0 0 0 1 
i 3.275357 76.90031 0.7171673 54 70.90633 0 0.1 0 0 0 1 
i 7.379923 76.90031 1.056142 65 70.90633 0 0.1 0 0 0 1 
i 8.138376 77.32429 0.63217 95 82.88654 0 0.1 0 0 0 1 
i 8.506448 77.32429 0.5378755 100 83.49031 0 0.1 0 0 0 1 
i 9.242593 77.32429 0.5378755 74 84.69786 0 0.1 0 0 0 1 
i 9.365284 77.32429 0.5378755 70 84.89912 0 0.1 0 0 0 1 
i 6.353782 77.41858 0.5378755 77 78.63329 0 0.1 0 0 0 1 
i 7.457999 77.41858 0.5378755 83 80.44461 0 0.1 0 0 0 1 
i 2.784594 77.61748 0.7171673 49 70.1013 0 0.1 0 0 0 1 
i 6.88916 77.61748 0.7171673 61 70.1013 0 0.1 0 0 0 1 
i 8.199721 78.00585 0.5378755 85 82.9865 0 0.1 0 0 0 1 
i 8.261067 78.00585 1.075751 87 83.08713 0 0.1 0 0 0 1 
i 8.383757 78.00585 1.075751 84 83.28839 0 0.1 0 0 0 1 
i 8.567794 78.00585 0.5378755 82 83.59027 0 0.1 0 0 0 1 
i 9.119902 78.00585 1.075751 101 84.49593 0 0.1 0 0 0 1 
i 9.303939 78.00585 0.5378755 100 84.79782 0 0.1 0 0 0 1 
i 9.426629 78.00585 0.5378755 103 84.99908 0 0.1 0 0 0 1 
i 9.487975 78.00585 1.075751 104 85.09971 0 0.1 0 0 0 1 
i 6.415127 78.15557 0.5378755 74 78.73325 0 0.1 0 0 0 1 
i 6.476473 78.15557 0.5378755 72 78.83388 0 0.1 0 0 0 1 
i 6.844545 78.15557 0.5378755 82 79.43765 0 0.1 0 0 0 1 
i 7.028581 78.15557 0.5378755 84 79.73954 0 0.1 0 0 0 1 
i 7.335308 78.15557 1.075751 69 80.24268 0 0.1 0 0 0 1 
i 7.519345 78.15557 0.5378755 70 80.54457 0 0.1 0 0 0 1 
i 7.887417 78.15557 0.5378755 61 81.14834 0 0.1 0 0 0 1 
i 7.948763 78.15557 0.5378755 59 81.24897 0 0.1 0 0 0 1 
i 2.845939 78.43972 0.7171673 48 70.20126 0 0.1 0 0 0 1 
i 3.275357 78.43972 0.7171673 54 70.90566 0 0.1 0 0 0 1 
i 6.950505 78.43972 0.7171673 60 70.20126 0 0.1 0 0 0 1 
i 7.379923 78.43972 0.7171673 66 70.90566 0 0.1 0 0 0 1 
i 8.138376 78.54372 0.5378755 86 82.88587 0 0.1 0 0 0 1 
i 8.506448 78.54372 0.5378755 83 83.48964 0 0.1 0 0 0 1 
i 9.181248 78.54372 0.5378755 102 84.59656 0 0.1 0 0 0 1 
i 9.54932 78.54372 0.5378755 105 85.20034 0 0.1 0 0 0 1 
i 6.353782 78.69345 0.5378755 73 78.63262 0 0.1 0 0 0 1 
i 6.537818 78.69345 0.5378755 72 78.93451 0 0.1 0 0 0 1 
i 6.905891 78.69345 0.5378755 81 79.53828 0 0.1 0 0 0 1 
i 6.967236 78.69345 0.5378755 83 79.63891 0 0.1 0 0 0 1 
i 7.396654 78.69345 0.5378755 68 80.34331 0 0.1 0 0 0 1 
i 7.826072 78.69345 0.5378755 60 81.04771 0 0.1 0 0 0 1 
i 8.010108 78.69345 0.5378755 58 81.3496 0 0.1 0 0 0 1 
i 2.784594 79.15688 0.7171673 49 70.10063 0 0.1 0 0 0 1 
i 3.336703 79.15688 0.7171673 55 71.00629 0 0.1 0 0 0 1 
i 6.88916 79.15688 0.7171673 61 70.10063 0 0.1 0 0 0 1 
i 7.441269 79.15688 0.7171673 67 71.00629 0 0.1 0 0 0 1 
i 6.599163 79.62323 0.5378755 76 79.03447 0 0.1 0 0 0 1 
i 6.844545 79.62323 1.075751 75 79.43698 0 0.1 0 0 0 1 
i 7.335308 79.62323 0.5378755 77 80.24201 0 0.1 0 0 0 1 
i 8.071453 79.62323 1.075751 77 81.44956 0 0.1 0 0 0 1 
i 8.629139 79.70325 0.5378755 93 83.69023 0 0.1 0 0 0 1 
i 9.119902 79.70325 0.5378755 84 84.49526 0 0.1 0 0 0 1 
i 6.353782 79.96955 0.7171673 76 78.6078 0 0.1 0 0 0 1 
i 10.45835 79.96955 0.7171673 87 78.6078 0 0.1 0 0 0 1 
i 2.907285 80.01667 0.7171673 48 70.30122 0 0.1 0 0 0 1 
i 3.275357 80.01667 0.7171673 54 70.90499 0 0.1 0 0 0 1 
i 7.011851 80.01667 0.7171673 60 70.30122 0 0.1 0 0 0 1 
i 7.379923 80.01667 0.7171673 66 70.90499 0 0.1 0 0 0 1 
i 6.353782 80.1611 0.5378755 75 78.63195 0 0.1 0 0 0 1 
i 7.58069 80.1611 0.5378755 76 80.64453 0 0.1 0 0 0 1 
i 8.138376 80.24112 0.5378755 89 82.8852 0 0.1 0 0 0 1 
i 9.610666 80.24112 0.5378755 80 85.30029 0 0.1 0 0 0 1 
i 2.784594 80.73383 0.7171673 50 70.09996 0 0.1 0 0 0 1 
i 3.398048 80.73383 0.7171673 56 71.10625 0 0.1 0 0 0 1 
i 6.88916 80.73383 0.7171673 61 70.09996 0 0.1 0 0 0 1 
i 7.502614 80.73383 0.7171673 67 71.10625 0 0.1 0 0 0 1 
i 6.415127 80.79848 0.7171673 78 78.70776 0 0.1 0 0 0 1 
i 10.51969 80.79848 0.7171673 89 78.70776 0 0.1 0 0 0 1 
i 6.415127 80.89809 0.5378755 74 78.73191 0 0.1 0 0 0 1 
i 6.599163 80.89809 0.5378755 79 79.03379 0 0.1 0 0 0 1 
i 6.844545 80.89809 0.5378755 71 79.43631 0 0.1 0 0 0 1 
i 7.151272 80.89809 0.5378755 66 79.93945 0 0.1 0 0 0 1 
i 7.335308 80.89809 0.5378755 86 80.24134 0 0.1 0 0 0 1 
i 7.642036 80.89809 0.5378755 81 80.74449 0 0.1 0 0 0 1 
i 7.887417 80.89809 0.5378755 89 81.147 0 0.1 0 0 0 1 
i 8.071453 80.89809 0.5378755 94 81.44889 0 0.1 0 0 0 1 
i 8.199721 80.98366 0.5378755 88 82.98516 0 0.1 0 0 0 1 
i 8.629139 80.98366 0.5378755 93 83.68956 0 0.1 0 0 0 1 
i 9.119902 80.98366 0.5378755 85 84.49459 0 0.1 0 0 0 1 
i 9.672011 80.98366 0.5378755 80 85.40025 0 0.1 0 0 0 1 
i 6.353782 81.43597 0.5378755 75 78.63128 0 0.1 0 0 0 1 
i 6.660509 81.43597 0.5378755 80 79.13442 0 0.1 0 0 0 1 
i 6.905891 81.43597 0.5378755 72 79.53694 0 0.1 0 0 0 1 
i 7.089927 81.43597 1.48113 67 79.83883 0 0.1 0 0 0 1 
i 7.396654 81.43597 0.5378755 87 80.34197 0 0.1 0 0 0 1 
i 7.58069 81.43597 0.5378755 82 80.64386 0 0.1 0 0 0 1 
i 7.826072 81.43597 0.5378755 90 81.04637 0 0.1 0 0 0 1 
i 8.132799 81.43597 0.5378755 95 81.54952 0 0.1 0 0 0 1 
i 2.845939 81.48277 0.7171673 50 70.19992 0 0.1 0 0 0 1 
i 2.907285 81.48277 1.434335 49 70.30055 0 0.1 0 0 0 1 
i 3.275357 81.48277 1.434335 56 70.90432 0 0.1 0 0 0 1 
i 3.459394 81.48277 0.7171673 57 71.20621 0 0.1 0 0 0 1 
i 6.950505 81.48277 0.7171673 62 70.19992 0 0.1 0 0 0 1 
i 7.011851 81.48277 1.434335 60 70.30055 0 0.1 0 0 0 1 
i 7.56396 81.48277 1.434335 68 71.20621 0 0.1 0 0 0 1 
i 6.353782 81.51565 1.226287 77 78.60713 0 0.1 0 0 0 1 
i 10.45835 81.51565 0.7171673 89 78.60713 0 0.1 0 0 0 1 
i 8.138376 81.52154 0.5378755 89 82.88453 0 0.1 0 0 0 1 
i 8.690484 81.52154 0.5378755 94 83.79019 0 0.1 0 0 0 1 
i 9.181248 81.52154 0.5378755 86 84.59522 0 0.1 0 0 0 1 
i 9.610666 81.52154 1.395564 81 85.29962 0 0.1 0 0 0 1 
i 2.96863 82.19993 0.7171673 48 70.40117 0 0.1 0 0 0 1 
i 3.336703 82.19993 0.7171673 55 71.00495 0 0.1 0 0 0 1 
i 6.88916 82.19993 0.7171673 61 70.09929 0 0.1 0 0 0 1 
i 6.599163 82.20406 0.5378755 73 79.03312 0 0.1 0 0 0 1 
i 6.844545 82.20406 0.5378755 82 79.43564 0 0.1 0 0 0 1 
i 7.212618 82.20406 0.5378755 86 80.03941 0 0.1 0 0 0 1 
i 7.335308 82.20406 0.5378755 64 80.24067 0 0.1 0 0 0 1 
i 7.703381 82.20406 0.5378755 69 80.84444 0 0.1 0 0 0 1 
i 7.948763 82.20406 0.5378755 60 81.24696 0 0.1 0 0 0 1 
i 8.071453 82.20406 0.5378755 55 81.44822 0 0.1 0 0 0 1 
i 8.261067 82.2953 0.5378755 94 83.08512 0 0.1 0 0 0 1 
i 8.629139 82.2953 0.5378755 82 83.68889 0 0.1 0 0 0 1 
i 9.119902 82.2953 0.5378755 100 84.49392 0 0.1 0 0 0 1 
i 9.733357 82.2953 0.5378755 112 85.50021 0 0.1 0 0 0 1 
i 6.476473 82.38228 0.7171673 79 78.80771 0 0.1 0 0 0 1 
i 10.58104 82.38228 0.7171673 91 78.80771 0 0.1 0 0 0 1 
i 6.353782 82.74193 0.5378755 75 78.63061 0 0.1 0 0 0 1 
i 6.721854 82.74193 0.5378755 70 79.23438 0 0.1 0 0 0 1 
i 6.967236 82.74193 0.5378755 79 79.6369 0 0.1 0 0 0 1 
i 7.089927 82.74193 0.5378755 84 79.83816 0 0.1 0 0 0 1 
i 7.457999 82.74193 0.5378755 62 80.44193 0 0.1 0 0 0 1 
i 7.58069 82.74193 0.5378755 66 80.64319 0 0.1 0 0 0 1 
i 7.826072 82.74193 0.5378755 57 81.0457 0 0.1 0 0 0 1 
i 8.194144 82.74193 0.5378755 53 81.64948 0 0.1 0 0 0 1 
i 8.138376 82.83318 0.5378755 91 82.88386 0 0.1 0 0 0 1 
i 8.75183 82.83318 0.5378755 80 83.89015 0 0.1 0 0 0 1 
i 9.242593 82.83318 0.5378755 98 84.69518 0 0.1 0 0 0 1 
i 9.610666 82.83318 0.5378755 109 85.29895 0 0.1 0 0 0 1 
i 6.353782 83.09945 0.7171673 78 78.60646 0 0.1 0 0 0 1 
i 10.45835 83.09945 0.7171673 89 78.60646 0 0.1 0 0 0 1 
i 3.029976 83.17057 0.7171673 49 70.50113 0 0.1 0 0 0 1 
i 3.275357 83.17057 0.7171673 54 70.90365 0 0.1 0 0 0 1 
i 7.134542 83.17057 0.7171673 61 70.50113 0 0.1 0 0 0 1 
i 7.379923 83.17057 0.7171673 65 70.90365 0 0.1 0 0 0 1 
i 6.415127 83.41822 1.075751 75 78.73057 0 0.1 0 0 0 1 
i 6.599163 83.41822 1.075751 76 79.03245 0 0.1 0 0 0 1 
i 6.844545 83.41822 1.075751 75 79.43497 0 0.1 0 0 0 1 
i 7.519345 83.41822 1.075751 77 80.54189 0 0.1 0 0 0 1 
i 7.642036 83.41822 1.075751 76 80.74314 0 0.1 0 0 0 1 
i 8.199721 83.51474 1.075751 88 82.98382 0 0.1 0 0 0 1 
i 8.261067 83.51474 0.5378755 87 83.08444 0 0.1 0 0 0 1 
i 8.629139 83.51474 0.5378755 96 83.68822 0 0.1 0 0 0 1 
i 8.813175 83.51474 0.5378755 98 83.9901 0 0.1 0 0 0 1 
i 9.119902 83.51474 0.5378755 83 84.49325 0 0.1 0 0 0 1 
i 9.303939 83.51474 0.5378755 85 84.79514 0 0.1 0 0 0 1 
i 9.672011 83.51474 0.5378755 75 85.39891 0 0.1 0 0 0 1 
i 9.733357 83.51474 0.5378755 73 85.49954 0 0.1 0 0 0 1 
i 6.415127 83.85476 1.434335 79 78.70642 0 0.1 0 0 0 1 
i 6.476473 83.85476 0.7171673 80 78.80704 0 0.1 0 0 0 1 
i 10.51969 83.85476 0.7171673 90 78.70642 0 0.1 0 0 0 1 
i 10.58104 83.85476 0.7171673 91 78.80704 0 0.1 0 0 0 1 
i 2.784594 83.88773 0.7171673 52 70.09862 0 0.1 0 0 0 1 
i 3.520739 83.88773 0.7171673 57 71.30616 0 0.1 0 0 0 1 
i 6.88916 83.88773 0.7171673 63 70.09862 0 0.1 0 0 0 1 
i 7.625305 83.88773 0.7171673 68 71.30616 0 0.1 0 0 0 1 
i 7.273963 83.95609 0.5378755 74 80.13937 0 0.1 0 0 0 1 
i 8.322412 84.05262 0.5378755 86 83.18507 0 0.1 0 0 0 1 
i 8.690484 84.05262 0.5378755 95 83.78885 0 0.1 0 0 0 1 
i 8.75183 84.05262 0.5378755 97 83.88948 0 0.1 0 0 0 1 
i 9.181248 84.05262 0.5378755 82 84.59388 0 0.1 0 0 0 1 
i 9.242593 84.05262 0.5378755 84 84.69451 0 0.1 0 0 0 1 
i 9.610666 84.05262 0.5378755 74 85.29828 0 0.1 0 0 0 1 
i 9.794702 84.05262 0.5378755 72 85.60017 0 0.1 0 0 0 1 
i 1 84.28009 0.5378755 53 70.10667 0 0.1 0 0 0 1 
i 5.104566 84.28009 0.5378755 65 70.10667 0 0.1 0 0 0 1 
i 6.537818 84.57193 0.7171673 80 78.90767 0 0.1 0 0 0 1 
i 10.45835 84.57193 0.7171673 91 78.60579 0 0.1 0 0 0 1 
i 10.64238 84.57193 0.7171673 92 78.90767 0 0.1 0 0 0 1 
i 2.845939 84.63667 0.7171673 53 70.19857 0 0.1 0 0 0 1 
i 3.029976 84.63667 0.7171673 50 70.50046 0 0.1 0 0 0 1 
i 3.275357 84.63667 1.434335 54 70.90298 0 0.1 0 0 0 1 
i 3.582084 84.63667 0.7171673 58 71.40612 0 0.1 0 0 0 1 
i 6.950505 84.63667 1.434335 64 70.19857 0 0.1 0 0 0 1 
i 7.134542 84.63667 1.434335 61 70.50046 0 0.1 0 0 0 1 
i 7.379923 84.63667 0.7171673 66 70.90298 0 0.1 0 0 0 1 
i 7.68665 84.63667 0.7171673 69 71.40612 0 0.1 0 0 0 1 
i 8.383757 84.91858 1.075751 90 83.28503 0 0.1 0 0 0 1 
i 8.629139 84.91858 1.075751 89 83.68755 0 0.1 0 0 0 1 
i 9.119902 84.91858 0.5378755 91 84.49258 0 0.1 0 0 0 1 
i 9.856047 84.91858 0.5378755 92 85.70013 0 0.1 0 0 0 1 
i 2.784594 85.35383 0.7171673 52 70.09795 0 0.1 0 0 0 1 
i 3.091321 85.35383 0.7171673 49 70.60109 0 0.1 0 0 0 1 
i 3.520739 85.35383 0.7171673 57 71.30549 0 0.1 0 0 0 1 
i 7.441269 85.35383 0.7171673 65 71.00361 0 0.1 0 0 0 1 
i 7.625305 85.35383 0.7171673 68 71.30549 0 0.1 0 0 0 1 
i 1.061345 85.35859 0.5378755 55 70.20662 0 0.1 0 0 0 1 
i 5.165911 85.35859 1.075751 66 70.20662 0 0.1 0 0 0 1 
i 9.365284 85.45646 0.5378755 90 84.89509 0 0.1 0 0 0 1 
i 9.610666 85.45646 0.5378755 91 85.29761 0 0.1 0 0 0 1 
i 6.599163 85.5499 0.7171673 81 79.00763 0 0.1 0 0 0 1 
i 10.70373 85.5499 0.7171673 92 79.00763 0 0.1 0 0 0 1 
i 1 85.89647 0.5378755 54 70.106 0 0.1 0 0 0 1 
i 8.199721 86.13802 0.5378755 88 82.98247 0 0.1 0 0 0 1 
i 8.383757 86.13802 0.5378755 93 83.28436 0 0.1 0 0 0 1 
i 8.629139 86.13802 0.5378755 85 83.68688 0 0.1 0 0 0 1 
i 8.935866 86.13802 0.5378755 80 84.19002 0 0.1 0 0 0 1 
i 9.119902 86.13802 0.5378755 101 84.49191 0 0.1 0 0 0 1 
i 9.426629 86.13802 0.5378755 96 84.99505 0 0.1 0 0 0 1 
i 9.672011 86.13802 0.5378755 103 85.39757 0 0.1 0 0 0 1 
i 9.856047 86.13802 0.5378755 108 85.69945 0 0.1 0 0 0 1 
i 2.907285 86.13852 0.7171673 53 70.29853 0 0.1 0 0 0 1 
i 3.029976 86.13852 0.7171673 51 70.49979 0 0.1 0 0 0 1 
i 3.275357 86.13852 0.7171673 56 70.90231 0 0.1 0 0 0 1 
i 3.64343 86.13852 0.7171673 58 71.50608 0 0.1 0 0 0 1 
i 7.011851 86.13852 0.7171673 65 70.29853 0 0.1 0 0 0 1 
i 7.134542 86.13852 0.7171673 62 70.49979 0 0.1 0 0 0 1 
i 7.379923 86.13852 0.7171673 67 70.90231 0 0.1 0 0 0 1 
i 7.747996 86.13852 0.7171673 69 71.50608 0 0.1 0 0 0 1 
i 6.353782 86.26706 0.7171673 78 78.60512 0 0.1 0 0 0 1 
i 10.45835 86.26706 0.7171673 90 78.60512 0 0.1 0 0 0 1 
i 8.138376 86.6759 0.5378755 89 82.88184 0 0.1 0 0 0 1 
i 8.445103 86.6759 0.5378755 94 83.38499 0 0.1 0 0 0 1 
i 8.690484 86.6759 0.5378755 86 83.78751 0 0.1 0 0 0 1 
i 8.874521 86.6759 0.5378755 81 84.08939 0 0.1 0 0 0 1 
i 9.181248 86.6759 0.5378755 102 84.59254 0 0.1 0 0 0 1 
i 9.365284 86.6759 0.5378755 97 84.89442 0 0.1 0 0 0 1 
i 9.610666 86.6759 0.5378755 104 85.29694 0 0.1 0 0 0 1 
i 9.917393 86.6759 0.5378755 109 85.80008 0 0.1 0 0 0 1 
i 2.784594 86.85569 1.396284 52 70.09727 0 0.1 0 0 0 1 
i 3.152666 86.85569 0.7171673 49 70.70105 0 0.1 0 0 0 1 
i 3.398048 86.85569 2.113452 54 71.10356 0 0.1 0 0 0 1 
i 3.520739 86.85569 2.113452 57 71.30482 0 0.1 0 0 0 1 
i 6.88916 86.85569 2.113452 63 70.09727 0 0.1 0 0 0 1 
i 7.257232 86.85569 1.396284 61 70.70105 0 0.1 0 0 0 1 
i 7.502614 86.85569 2.113452 66 71.10356 0 0.1 0 0 0 1 
i 7.625305 86.85569 1.396284 68 71.30482 0 0.1 0 0 0 1 
i 1.122691 87.01439 0.5378755 56 70.30658 0 0.1 0 0 0 1 
i 5.227257 87.01439 0.5378755 68 70.30658 0 0.1 0 0 0 1 
i 6.415127 87.02237 0.7171673 78 78.70507 0 0.1 0 0 0 1 
i 6.599163 87.02237 0.7171673 81 79.00696 0 0.1 0 0 0 1 
i 10.51969 87.02237 0.7171673 90 78.70507 0 0.1 0 0 0 1 
i 10.70373 87.02237 1.434335 93 79.00696 0 0.1 0 0 0 1 
i 8.261067 87.3872 0.5378755 92 83.08243 0 0.1 0 0 0 1 
i 8.383757 87.3872 0.5378755 87 83.28369 0 0.1 0 0 0 1 
i 8.629139 87.3872 0.5378755 96 83.68621 0 0.1 0 0 0 1 
i 8.997212 87.3872 0.5378755 101 84.28998 0 0.1 0 0 0 1 
i 9.119902 87.3872 0.5378755 78 84.49124 0 0.1 0 0 0 1 
i 9.487975 87.3872 0.5378755 83 85.09501 0 0.1 0 0 0 1 
i 9.733357 87.3872 0.5378755 74 85.49753 0 0.1 0 0 0 1 
i 9.856047 87.3872 0.5378755 70 85.69878 0 0.1 0 0 0 1 
i 2.907285 87.53481 1.434335 53 70.29786 0 0.1 0 0 0 1 
i 3.029976 87.53481 1.434335 51 70.49912 0 0.1 0 0 0 1 
i 3.214012 87.53481 1.434335 50 70.80101 0 0.1 0 0 0 1 
i 3.275357 87.53481 1.434335 55 70.90164 0 0.1 0 0 0 1 
i 3.64343 87.53481 1.434335 58 71.50541 0 0.1 0 0 0 1 
i 7.011851 87.53481 1.434335 65 70.29786 0 0.1 0 0 0 1 
i 7.134542 87.53481 1.434335 62 70.49912 0 0.1 0 0 0 1 
i 7.379923 87.53481 0.7171673 67 70.90164 0 0.1 0 0 0 1 
i 7.747996 87.53481 1.434335 69 71.50541 0 0.1 0 0 0 1 
i 1 87.55227 0.5378755 55 70.10532 0 0.1 0 0 0 1 
i 5.104566 87.55227 0.5378755 66 70.10532 0 0.1 0 0 0 1 
i 6.353782 87.73954 0.7171673 79 78.60444 0 0.1 0 0 0 1 
i 6.660509 87.73954 0.7171673 82 79.10759 0 0.1 0 0 0 1 
i 10.45835 87.73954 0.7171673 90 78.60444 0 0.1 0 0 0 1 
i 8.138376 87.92508 0.5378755 89 82.88117 0 0.1 0 0 0 1 
i 8.506448 87.92508 0.5378755 85 83.48495 0 0.1 0 0 0 1 
i 8.75183 87.92508 0.5378755 93 83.88746 0 0.1 0 0 0 1 
i 8.874521 87.92508 0.5378755 98 84.08872 0 0.1 0 0 0 1 
i 9.242593 87.92508 0.5378755 76 84.69249 0 0.1 0 0 0 1 
i 9.365284 87.92508 0.5378755 80 84.89375 0 0.1 0 0 0 1 
i 9.610666 87.92508 0.5378755 71 85.29627 0 0.1 0 0 0 1 
i 9.978738 87.92508 0.5378755 67 85.90004 0 0.1 0 0 0 1 
i 3.336703 88.25197 0.7171673 56 71.00226 0 0.1 0 0 0 1 
i 6.88916 88.25197 0.7171673 64 70.0966 0 0.1 0 0 0 1 
i 7.441269 88.25197 0.7171673 68 71.00226 0 0.1 0 0 0 1 
i 7.809341 88.25197 0.7171673 70 71.60604 0 0.1 0 0 0 1 
i 6.476473 88.53076 0.7171673 79 78.80503 0 0.1 0 0 0 1 
i 6.599163 88.53076 0.7171673 81 79.00629 0 0.1 0 0 0 1 
i 10.58104 88.53076 0.7171673 91 78.80503 0 0.1 0 0 0 1 
i 10.70373 88.53076 0.7171673 93 79.00629 0 0.1 0 0 0 1 
i 8.199721 88.54857 1.075751 90 82.98113 0 0.1 0 0 0 1 
i 8.567794 88.54857 1.075751 90 83.58491 0 0.1 0 0 0 1 
i 8.629139 88.54857 1.075751 89 83.68553 0 0.1 0 0 0 1 
i 9.119902 88.54857 1.075751 91 84.49057 0 0.1 0 0 0 1 
i 9.672011 88.54857 1.075751 91 85.39623 0 0.1 0 0 0 1 
i 10.04008 88.54857 0.5378755 92 86 0 0.1 0 0 0 1 
i 1.061345 88.55379 1.075751 56 70.20528 0 0.1 0 0 0 1 
i 1.122691 88.55379 1.075751 57 70.30591 0 0.1 0 0 0 1 
i 5.165911 88.55379 0.5378755 67 70.20528 0 0.1 0 0 0 1 
i 5.227257 88.55379 1.075751 68 70.30591 0 0.1 0 0 0 1 
i 8.322412 89.08645 0.5378755 89 83.18239 0 0.1 0 0 0 1 
i 9.54932 89.08645 0.5378755 90 85.19497 0 0.1 0 0 0 1 
i 5.288602 89.09167 0.5378755 69 70.40654 0 0.1 0 0 0 1 
i 6.353782 89.24792 1.402355 80 78.60377 0 0.1 0 0 0 1 
i 6.721854 89.24792 2.119523 83 79.20755 0 0.1 0 0 0 1 
i 10.45835 89.24792 0.7171673 92 78.60377 0 0.1 0 0 0 1 
i 10.82642 89.24792 1.402355 94 79.20755 0 0.1 0 0 0 1 
i 6.415127 89.93311 1.434335 81 78.70373 0 0.1 0 0 0 1 
i 6.7832 89.93311 0.7171673 84 79.30751 0 0.1 0 0 0 1 
i 10.51969 89.93311 1.434335 93 78.70373 0 0.1 0 0 0 1 
i 10.58104 89.93311 0.7171673 92 78.80436 0 0.1 0 0 0 1 
i 10.88777 89.93311 1.434335 95 79.30751 0 0.1 0 0 0 1 
i 3.766121 90.14669 0.7171673 54 71.706 0 0.1 0 0 0 1 
i 7.870687 90.14669 0.7171673 65 71.706 0 0.1 0 0 0 1 
i 1.245382 90.32598 0.5378755 58 70.5065 0 0.1 0 0 0 1 
i 5.349948 90.32598 0.5378755 69 70.5065 0 0.1 0 0 0 1 
i 6.537818 90.65028 0.7171673 80 78.90499 0 0.1 0 0 0 1 
i 6.660509 90.65028 0.7171673 82 79.10625 0 0.1 0 0 0 1 
i 10.45835 90.65028 0.7171673 92 78.6031 0 0.1 0 0 0 1 
i 10.64238 90.65028 0.7171673 91 78.90499 0 0.1 0 0 0 1 
i 2.784594 90.86386 0.7171673 45 70.09593 0 0.1 0 0 0 1 
i 6.88916 90.86386 0.7171673 57 70.09593 0 0.1 0 0 0 1 
i 1 90.86386 0.5378755 55 70.10398 0 0.1 0 0 0 1 
i 5.104566 90.86386 2.077279 67 70.10398 0 0.1 0 0 0 1 
i 2.845939 91.6861 0.7171673 44 70.19589 0 0.1 0 0 0 1 
i 3.766121 91.6861 0.7171673 54 71.70532 0 0.1 0 0 0 1 
i 6.950505 91.6861 0.7171673 55 70.19589 0 0.1 0 0 0 1 
i 7.870687 91.6861 1.434335 66 71.70532 0 0.1 0 0 0 1 
i 1.061345 91.86539 0.5378755 55 70.20394 0 0.1 0 0 0 1 
i 1.245382 91.86539 0.5378755 58 70.50583 0 0.1 0 0 0 1 
i 5.349948 91.86539 1.075751 70 70.50583 0 0.1 0 0 0 1 
i 6.844545 91.88512 0.7171673 82 79.40746 0 0.1 0 0 0 1 
i 10.94911 91.88512 0.7171673 94 79.40746 0 0.1 0 0 0 1 
i 1 92.40326 0.5378755 56 70.10331 0 0.1 0 0 0 1 
i 1.306727 92.40326 0.5378755 59 70.60646 0 0.1 0 0 0 1 
i 2.784594 92.40326 0.7171673 45 70.09526 0 0.1 0 0 0 1 
i 3.827466 92.40326 0.7171673 55 71.80595 0 0.1 0 0 0 1 
i 6.88916 92.40326 0.7171673 56 70.09526 0 0.1 0 0 0 1 
i 6.353782 92.60229 0.7171673 78 78.60243 0 0.1 0 0 0 1 
i 10.45835 92.60229 0.7171673 89 78.60243 0 0.1 0 0 0 1 
i 2.907285 93.26305 0.7171673 43 70.29585 0 0.1 0 0 0 1 
i 3.766121 93.26305 0.7171673 54 71.70465 0 0.1 0 0 0 1 
i 7.011851 93.26305 0.7171673 55 70.29585 0 0.1 0 0 0 1 
i 7.870687 93.26305 0.7171673 66 71.70465 0 0.1 0 0 0 1 
i 6.415127 93.3576 0.7171673 77 78.70239 0 0.1 0 0 0 1 
i 6.844545 93.3576 0.7171673 83 79.40679 0 0.1 0 0 0 1 
i 10.51969 93.3576 0.7171673 89 78.70239 0 0.1 0 0 0 1 
i 10.94911 93.3576 0.7171673 94 79.40679 0 0.1 0 0 0 1 
i 1.122691 93.44234 0.5378755 56 70.3039 0 0.1 0 0 0 1 
i 1.245382 93.44234 0.5378755 58 70.50516 0 0.1 0 0 0 1 
i 5.227257 93.44234 0.5378755 68 70.3039 0 0.1 0 0 0 1 
i 5.349948 93.44234 0.5378755 70 70.50516 0 0.1 0 0 0 1 
i 1 93.98021 0.5378755 57 70.10264 0 0.1 0 0 0 1 
i 1.368072 93.98021 0.5378755 59 70.70642 0 0.1 0 0 0 1 
i 2.784594 93.98021 0.7171673 45 70.09459 0 0.1 0 0 0 1 
i 3.888811 93.98021 0.7171673 56 71.90591 0 0.1 0 0 0 1 
i 5.104566 93.98021 0.5378755 69 70.10264 0 0.1 0 0 0 1 
i 5.472639 93.98021 0.5378755 71 70.70642 0 0.1 0 0 0 1 
i 6.88916 93.98021 0.7171673 56 70.09459 0 0.1 0 0 0 1 
i 7.993377 93.98021 0.7171673 67 71.90591 0 0.1 0 0 0 1 
i 6.353782 94.07476 0.7171673 78 78.60176 0 0.1 0 0 0 1 
i 6.905891 94.07476 0.7171673 84 79.50742 0 0.1 0 0 0 1 
i 10.45835 94.07476 0.7171673 89 78.60176 0 0.1 0 0 0 1 
i 11.01046 94.07476 0.7171673 95 79.50742 0 0.1 0 0 0 1 
i 2.845939 94.72915 0.7171673 44 70.19455 0 0.1 0 0 0 1 
i 2.907285 94.72915 1.434335 43 70.29518 0 0.1 0 0 0 1 
i 3.766121 94.72915 1.434335 56 71.70398 0 0.1 0 0 0 1 
i 3.950157 94.72915 0.7171673 57 72.00587 0 0.1 0 0 0 1 
i 6.950505 94.72915 1.434335 55 70.19455 0 0.1 0 0 0 1 
i 7.011851 94.72915 1.434335 54 70.29518 0 0.1 0 0 0 1 
i 7.870687 94.72915 0.7171673 67 71.70398 0 0.1 0 0 0 1 
i 8.054723 94.72915 1.434335 68 72.00587 0 0.1 0 0 0 1 
i 6.476473 94.86598 0.7171673 77 78.80235 0 0.1 0 0 0 1 
i 6.844545 94.86598 0.7171673 83 79.40612 0 0.1 0 0 0 1 
i 10.58104 94.86598 0.7171673 89 78.80235 0 0.1 0 0 0 1 
i 10.94911 94.86598 0.7171673 94 79.40612 0 0.1 0 0 0 1 
i 1.061345 94.90844 1.075751 58 70.2026 0 0.1 0 0 0 1 
i 1.122691 94.90844 1.075751 57 70.30323 0 0.1 0 0 0 1 
i 1.245382 94.90844 1.075751 59 70.50449 0 0.1 0 0 0 1 
i 1.429418 94.90844 1.075751 60 70.80637 0 0.1 0 0 0 1 
i 5.165911 94.90844 1.075751 70 70.2026 0 0.1 0 0 0 1 
i 5.227257 94.90844 1.075751 69 70.30323 0 0.1 0 0 0 1 
i 5.349948 94.90844 1.075751 71 70.50449 0 0.1 0 0 0 1 
i 5.533984 94.90844 0.5378755 72 70.80637 0 0.1 0 0 0 1 
i 2.96863 95.44631 0.7171673 42 70.39581 0 0.1 0 0 0 1 
i 3.827466 95.44631 0.7171673 55 71.80461 0 0.1 0 0 0 1 
i 5.288602 95.44631 0.5378755 68 70.40386 0 0.1 0 0 0 1 
i 7.932032 95.44631 0.7171673 66 71.80461 0 0.1 0 0 0 1 
i 6.353782 95.58315 0.7171673 78 78.60109 0 0.1 0 0 0 1 
i 6.967236 95.58315 2.119523 84 79.60738 0 0.1 0 0 0 1 
i 10.45835 95.58315 0.7171673 90 78.60109 0 0.1 0 0 0 1 
i 11.0718 95.58315 2.119523 96 79.60738 0 0.1 0 0 0 1 
i 6.415127 96.26834 0.7171673 79 78.70105 0 0.1 0 0 0 1 
i 6.476473 96.26834 0.7171673 77 78.80168 0 0.1 0 0 0 1 
i 7.028581 96.26834 1.434335 85 79.70734 0 0.1 0 0 0 1 
i 10.51969 96.26834 0.7171673 90 78.70105 0 0.1 0 0 0 1 
i 10.58104 96.26834 0.7171673 89 78.80168 0 0.1 0 0 0 1 
i 11.13315 96.26834 0.7171673 97 79.70734 0 0.1 0 0 0 1 
i 3.029976 96.41695 0.7171673 42 70.49577 0 0.1 0 0 0 1 
i 3.766121 96.41695 0.7171673 54 71.70331 0 0.1 0 0 0 1 
i 7.134542 96.41695 0.7171673 54 70.49577 0 0.1 0 0 0 1 
i 7.870687 96.41695 0.7171673 65 71.70331 0 0.1 0 0 0 1 
i 1.490763 96.94918 0.5378755 59 70.90633 0 0.1 0 0 0 1 
i 5.595329 96.94918 0.5378755 70 70.90633 0 0.1 0 0 0 1 
i 6.353782 96.98551 0.7171673 78 78.60042 0 0.1 0 0 0 1 
i 6.537818 96.98551 0.7171673 77 78.90231 0 0.1 0 0 0 1 
i 10.45835 96.98551 0.7171673 89 78.60042 0 0.1 0 0 0 1 
i 10.64238 96.98551 0.7171673 88 78.90231 0 0.1 0 0 0 1 
i 11.01046 96.98551 0.7171673 95 79.50608 0 0.1 0 0 0 1 
i 2.784594 97.13411 0.7171673 45 70.09325 0 0.1 0 0 0 1 
i 4.011502 97.13411 0.7171673 57 72.10583 0 0.1 0 0 0 1 
i 6.88916 97.13411 0.7171673 56 70.09325 0 0.1 0 0 0 1 
i 8.116068 97.13411 0.7171673 68 72.10583 0 0.1 0 0 0 1 
i 1 97.48705 0.5378755 55 70.1013 0 0.1 0 0 0 1 
i 5.104566 97.48705 0.5378755 66 70.1013 0 0.1 0 0 0 1 
i 6.599163 97.88276 0.7171673 78 79.00226 0 0.1 0 0 0 1 
i 6.844545 97.88276 0.7171673 83 79.40478 0 0.1 0 0 0 1 
i 10.70373 97.88276 0.7171673 89 79.00226 0 0.1 0 0 0 1 
i 10.94911 97.88276 0.7171673 94 79.40478 0 0.1 0 0 0 1 
i 2.845939 97.88305 1.434335 45 70.19321 0 0.1 0 0 0 1 
i 3.029976 97.88305 0.7171673 42 70.49509 0 0.1 0 0 0 1 
i 3.766121 97.88305 1.434335 54 71.70264 0 0.1 0 0 0 1 
i 4.072848 97.88305 1.434335 57 72.20579 0 0.1 0 0 0 1 
i 6.950505 97.88305 0.7171673 57 70.19321 0 0.1 0 0 0 1 
i 7.134542 97.88305 1.434335 53 70.49509 0 0.1 0 0 0 1 
i 7.870687 97.88305 0.7171673 66 71.70264 0 0.1 0 0 0 1 
i 8.177414 97.88305 0.7171673 69 72.20579 0 0.1 0 0 0 1 
i 1.061345 98.48858 0.5378755 54 70.20126 0 0.1 0 0 0 1 
i 1.490763 98.48858 0.5378755 60 70.90566 0 0.1 0 0 0 1 
i 5.165911 98.48858 1.075751 66 70.20126 0 0.1 0 0 0 1 
i 5.595329 98.48858 0.5378755 71 70.90566 0 0.1 0 0 0 1 
i 6.353782 98.59992 0.7171673 80 78.59975 0 0.1 0 0 0 1 
i 7.089927 98.59992 0.7171673 85 79.8073 0 0.1 0 0 0 1 
i 10.45835 98.59992 0.7171673 92 78.59975 0 0.1 0 0 0 1 
i 11.19449 98.59992 0.7171673 97 79.8073 0 0.1 0 0 0 1 
i 3.091321 98.60021 0.7171673 41 70.59572 0 0.1 0 0 0 1 
i 6.88916 98.60021 0.7171673 56 70.09258 0 0.1 0 0 0 1 
i 7.932032 98.60021 0.7171673 65 71.80327 0 0.1 0 0 0 1 
i 8.116068 98.60021 0.7171673 68 72.10516 0 0.1 0 0 0 1 
i 4.569188 98.97523 0.5378755 82 78.6078 0 0.1 0 0 0 1 
i 8.673754 98.97523 0.5378755 93 78.6078 0 0.1 0 0 0 1 
i 1 99.02645 0.5378755 55 70.10063 0 0.1 0 0 0 1 
i 1.552109 99.02645 0.5378755 60 71.00629 0 0.1 0 0 0 1 
i 5.656675 99.02645 0.5378755 72 71.00629 0 0.1 0 0 0 1 
i 6.415127 99.28511 1.434335 81 78.69971 0 0.1 0 0 0 1 
i 6.599163 99.28511 1.434335 78 79.00159 0 0.1 0 0 0 1 
i 6.844545 99.28511 0.7171673 83 79.40411 0 0.1 0 0 0 1 
i 7.151272 99.28511 1.434335 86 79.90725 0 0.1 0 0 0 1 
i 10.51969 99.28511 0.7171673 93 78.69971 0 0.1 0 0 0 1 
i 10.70373 99.28511 0.7171673 90 79.00159 0 0.1 0 0 0 1 
i 10.94911 99.28511 1.434335 94 79.40411 0 0.1 0 0 0 1 
i 11.25584 99.28511 0.7171673 98 79.90725 0 0.1 0 0 0 1 
i 2.907285 99.3849 0.7171673 45 70.29317 0 0.1 0 0 0 1 
i 3.029976 99.3849 0.7171673 42 70.49442 0 0.1 0 0 0 1 
i 3.766121 99.3849 1.434335 56 71.70197 0 0.1 0 0 0 1 
i 4.134193 99.3849 0.7171673 58 72.30574 0 0.1 0 0 0 1 
i 7.011851 99.3849 0.7171673 56 70.29317 0 0.1 0 0 0 1 
i 7.134542 99.3849 0.7171673 54 70.49442 0 0.1 0 0 0 1 
i 7.870687 99.3849 0.7171673 67 71.70197 0 0.1 0 0 0 1 
i 8.238759 99.3849 0.7171673 69 72.30574 0 0.1 0 0 0 1 
i 4.630533 99.98345 1.075751 83 78.70776 0 0.1 0 0 0 1 
i 8.735099 99.98345 0.5378755 95 78.70776 0 0.1 0 0 0 1 
i 6.905891 100.0023 0.7171673 82 79.50474 0 0.1 0 0 0 1 
i 10.45835 100.0023 0.7171673 92 78.59908 0 0.1 0 0 0 1 
i 10.76507 100.0023 0.7171673 89 79.10222 0 0.1 0 0 0 1 
i 11.19449 100.0023 0.7171673 97 79.80662 0 0.1 0 0 0 1 
i 1.122691 100.0655 0.5378755 54 70.30122 0 0.1 0 0 0 1 
i 1.490763 100.0655 0.5378755 60 70.90499 0 0.1 0 0 0 1 
i 5.227257 100.0655 0.5378755 66 70.30122 0 0.1 0 0 0 1 
i 5.595329 100.0655 0.5378755 71 70.90499 0 0.1 0 0 0 1 
i 2.784594 100.1021 2.113452 43 70.09191 0 0.1 0 0 0 1 
i 3.152666 100.1021 0.7171673 41 70.69568 0 0.1 0 0 0 1 
i 3.888811 100.1021 1.396284 54 71.90323 0 0.1 0 0 0 1 
i 6.88916 100.1021 2.113452 55 70.09191 0 0.1 0 0 0 1 
i 7.257232 100.1021 2.113452 53 70.69568 0 0.1 0 0 0 1 
i 7.993377 100.1021 2.113452 66 71.90323 0 0.1 0 0 0 1 
i 8.116068 100.1021 2.113452 68 72.10449 0 0.1 0 0 0 1 
i 8.673754 100.5213 0.5378755 94 78.60713 0 0.1 0 0 0 1 
i 1 100.6034 0.5378755 55 70.09996 0 0.1 0 0 0 1 
i 1.613454 100.6034 0.5378755 61 71.10625 0 0.1 0 0 0 1 
i 5.104566 100.6034 0.5378755 67 70.09996 0 0.1 0 0 0 1 
i 5.71802 100.6034 0.5378755 72 71.10625 0 0.1 0 0 0 1 
i 6.476473 100.7217 0.7171673 82 78.79966 0 0.1 0 0 0 1 
i 6.599163 100.7217 0.7171673 79 79.00092 0 0.1 0 0 0 1 
i 6.844545 100.7217 0.7171673 84 79.40344 0 0.1 0 0 0 1 
i 7.212618 100.7217 0.7171673 86 80.00721 0 0.1 0 0 0 1 
i 10.58104 100.7217 0.7171673 93 78.79966 0 0.1 0 0 0 1 
i 10.70373 100.7217 0.7171673 91 79.00092 0 0.1 0 0 0 1 
i 10.94911 100.7217 0.7171673 96 79.40344 0 0.1 0 0 0 1 
i 11.31718 100.7217 0.7171673 98 80.00721 0 0.1 0 0 0 1 
i 2.907285 100.7812 0.7171673 44 70.29249 0 0.1 0 0 0 1 
i 3.029976 100.7812 1.434335 42 70.49375 0 0.1 0 0 0 1 
i 3.214012 100.7812 0.7171673 40 70.79564 0 0.1 0 0 0 1 
i 3.766121 100.7812 1.434335 55 71.7013 0 0.1 0 0 0 1 
i 4.072848 100.7812 1.434335 57 72.20444 0 0.1 0 0 0 1 
i 4.134193 100.7812 1.434335 58 72.30507 0 0.1 0 0 0 1 
i 6.950505 100.7812 1.434335 54 70.19187 0 0.1 0 0 0 1 
i 7.318578 100.7812 0.7171673 52 70.79564 0 0.1 0 0 0 1 
i 7.870687 100.7812 0.7171673 67 71.7013 0 0.1 0 0 0 1 
i 8.238759 100.7812 1.434335 69 72.30507 0 0.1 0 0 0 1 
i 6.353782 101.4388 0.7171673 80 78.59841 0 0.1 0 0 0 1 
i 6.721854 101.4388 1.335576 78 79.20218 0 0.1 0 0 0 1 
i 6.967236 101.4388 2.052744 83 79.6047 0 0.1 0 0 0 1 
i 7.089927 101.4388 2.052744 85 79.80595 0 0.1 0 0 0 1 
i 10.45835 101.4388 0.7171673 92 78.59841 0 0.1 0 0 0 1 
i 10.82642 101.4388 0.7171673 89 79.20218 0 0.1 0 0 0 1 
i 11.0718 101.4388 2.052744 94 79.6047 0 0.1 0 0 0 1 
i 11.19449 101.4388 2.052744 97 79.80595 0 0.1 0 0 0 1 
i 2.96863 101.4984 0.7171673 45 70.39312 0 0.1 0 0 0 1 
i 3.152666 101.4984 0.7171673 41 70.69501 0 0.1 0 0 0 1 
i 3.827466 101.4984 0.7171673 56 71.80193 0 0.1 0 0 0 1 
i 7.073196 101.4984 0.7171673 56 70.39312 0 0.1 0 0 0 1 
i 8.300105 101.4984 0.7171673 70 72.4057 0 0.1 0 0 0 1 
i 1.061345 101.5316 0.5378755 56 70.19992 0 0.1 0 0 0 1 
i 1.122691 101.5316 1.075751 55 70.30055 0 0.1 0 0 0 1 
i 1.490763 101.5316 0.5378755 61 70.90432 0 0.1 0 0 0 1 
i 1.6748 101.5316 0.5378755 62 71.20621 0 0.1 0 0 0 1 
i 5.165911 101.5316 1.075751 67 70.19992 0 0.1 0 0 0 1 
i 5.227257 101.5316 1.075751 66 70.30055 0 0.1 0 0 0 1 
i 5.595329 101.5316 1.075751 72 70.90432 0 0.1 0 0 0 1 
i 5.779366 101.5316 1.075751 73 71.20621 0 0.1 0 0 0 1 
i 4.691879 101.5673 0.5378755 85 78.80771 0 0.1 0 0 0 1 
i 8.796445 101.5673 0.5378755 96 78.80771 0 0.1 0 0 0 1 
i 6.415127 102.0572 1.434335 81 78.69836 0 0.1 0 0 0 1 
i 6.476473 102.0572 0.7171673 82 78.79899 0 0.1 0 0 0 1 
i 6.599163 102.0572 1.434335 79 79.00025 0 0.1 0 0 0 1 
i 6.844545 102.0572 0.7171673 84 79.40277 0 0.1 0 0 0 1 
i 7.212618 102.0572 1.434335 86 80.00654 0 0.1 0 0 0 1 
i 10.51969 102.0572 0.7171673 92 78.69836 0 0.1 0 0 0 1 
i 10.58104 102.0572 0.7171673 93 78.79899 0 0.1 0 0 0 1 
i 10.70373 102.0572 1.434335 91 79.00025 0 0.1 0 0 0 1 
i 10.88777 102.0572 1.434335 90 79.30214 0 0.1 0 0 0 1 
i 10.94911 102.0572 1.434335 96 79.40277 0 0.1 0 0 0 1 
i 11.31718 102.0572 1.434335 98 80.00654 0 0.1 0 0 0 1 
i 1.184036 102.0695 0.5378755 54 70.40117 0 0.1 0 0 0 1 
i 1.552109 102.0695 0.5378755 60 71.00495 0 0.1 0 0 0 1 
i 1.613454 102.0695 0.5378755 61 71.10558 0 0.1 0 0 0 1 
i 4.569188 102.1051 0.5378755 83 78.60646 0 0.1 0 0 0 1 
i 8.673754 102.1051 1.336786 95 78.60646 0 0.1 0 0 0 1 
i 3.275357 102.7247 0.7171673 42 70.8956 0 0.1 0 0 0 1 
i 3.766121 102.7247 0.7171673 52 71.70063 0 0.1 0 0 0 1 
i 7.379923 102.7247 0.7171673 54 70.8956 0 0.1 0 0 0 1 
i 7.870687 102.7247 0.7171673 63 71.70063 0 0.1 0 0 0 1 
i 6.537818 102.7744 0.7171673 82 78.89962 0 0.1 0 0 0 1 
i 6.660509 102.7744 0.7171673 80 79.10088 0 0.1 0 0 0 1 
i 7.273963 102.7744 0.7171673 87 80.10717 0 0.1 0 0 0 1 
i 10.45835 102.7744 0.7171673 93 78.59774 0 0.1 0 0 0 1 
i 11.0718 102.7744 0.7171673 95 79.60403 0 0.1 0 0 0 1 
i 4.630533 103.0397 0.5378755 84 78.70642 0 0.1 0 0 0 1 
i 4.691879 103.0397 1.075751 85 78.80704 0 0.1 0 0 0 1 
i 8.735099 103.0397 1.075751 96 78.70642 0 0.1 0 0 0 1 
i 8.796445 103.0397 1.075751 97 78.80704 0 0.1 0 0 0 1 
i 1.245382 103.2194 0.5378755 55 70.50113 0 0.1 0 0 0 1 
i 1.490763 103.2194 0.5378755 59 70.90365 0 0.1 0 0 0 1 
i 5.349948 103.2194 0.5378755 66 70.50113 0 0.1 0 0 0 1 
i 5.595329 103.2194 0.5378755 71 70.90365 0 0.1 0 0 0 1 
i 2.784594 103.4419 0.7171673 47 70.09057 0 0.1 0 0 0 1 
i 4.256884 103.4419 0.7171673 56 72.50566 0 0.1 0 0 0 1 
i 6.88916 103.4419 0.7171673 59 70.09057 0 0.1 0 0 0 1 
i 8.36145 103.4419 0.7171673 68 72.50566 0 0.1 0 0 0 1 
i 4.753224 103.5776 0.5378755 86 78.90767 0 0.1 0 0 0 1 
i 1 103.7573 0.5378755 57 70.09862 0 0.1 0 0 0 1 
i 1.736145 103.7573 0.5378755 62 71.30616 0 0.1 0 0 0 1 
i 5.104566 103.7573 0.5378755 69 70.09862 0 0.1 0 0 0 1 
i 5.840711 103.7573 0.5378755 73 71.30616 0 0.1 0 0 0 1 
i 2.845939 104.1908 0.7171673 48 70.19052 0 0.1 0 0 0 1 
i 3.275357 104.1908 0.7171673 42 70.89493 0 0.1 0 0 0 1 
i 3.766121 104.1908 1.434335 51 71.69996 0 0.1 0 0 0 1 
i 4.318229 104.1908 1.434335 57 72.60562 0 0.1 0 0 0 1 
i 6.950505 104.1908 0.7171673 60 70.19052 0 0.1 0 0 0 1 
i 7.379923 104.1908 0.7171673 54 70.89493 0 0.1 0 0 0 1 
i 7.870687 104.1908 0.7171673 63 71.69996 0 0.1 0 0 0 1 
i 8.422795 104.1908 0.7171673 69 72.60562 0 0.1 0 0 0 1 
i 7.335308 104.5556 0.7171673 82 80.20713 0 0.1 0 0 0 1 
i 11.43987 104.5556 0.7171673 94 80.20713 0 0.1 0 0 0 1 
i 1.061345 104.6855 1.075751 58 70.19857 0 0.1 0 0 0 1 
i 1.245382 104.6855 1.075751 55 70.50046 0 0.1 0 0 0 1 
i 1.490763 104.6855 0.5378755 60 70.90298 0 0.1 0 0 0 1 
i 1.79749 104.6855 1.075751 62 71.40612 0 0.1 0 0 0 1 
i 5.165911 104.6855 0.5378755 70 70.19857 0 0.1 0 0 0 1 
i 5.349948 104.6855 0.5378755 67 70.50046 0 0.1 0 0 0 1 
i 5.595329 104.6855 1.075751 71 70.90298 0 0.1 0 0 0 1 
i 5.902056 104.6855 0.5378755 74 71.40612 0 0.1 0 0 0 1 
i 4.81457 104.7349 0.5378755 86 79.00763 0 0.1 0 0 0 1 
i 8.919136 104.7349 0.5378755 98 79.00763 0 0.1 0 0 0 1 
i 2.784594 104.908 0.7171673 47 70.0899 0 0.1 0 0 0 1 
i 3.336703 104.908 0.7171673 41 70.99556 0 0.1 0 0 0 1 
i 6.88916 104.908 0.7171673 59 70.0899 0 0.1 0 0 0 1 
i 7.441269 104.908 0.7171673 53 70.99556 0 0.1 0 0 0 1 
i 7.932032 104.908 0.7171673 62 71.80059 0 0.1 0 0 0 1 
i 8.36145 104.908 0.7171673 68 72.50499 0 0.1 0 0 0 1 
i 1.552109 105.2234 0.5378755 59 71.00361 0 0.1 0 0 0 1 
i 5.104566 105.2234 0.5378755 69 70.09795 0 0.1 0 0 0 1 
i 5.411293 105.2234 0.5378755 66 70.60109 0 0.1 0 0 0 1 
i 5.840711 105.2234 0.5378755 73 71.30549 0 0.1 0 0 0 1 
i 6.353782 105.2727 0.7171673 74 78.59706 0 0.1 0 0 0 1 
i 10.45835 105.2727 0.7171673 85 78.59706 0 0.1 0 0 0 1 
i 4.569188 105.2727 0.5378755 84 78.60512 0 0.1 0 0 0 1 
i 8.673754 105.2727 0.5378755 95 78.60512 0 0.1 0 0 0 1 
i 2.907285 105.6927 0.7171673 48 70.29048 0 0.1 0 0 0 1 
i 3.275357 105.6927 0.7171673 42 70.89426 0 0.1 0 0 0 1 
i 3.766121 105.6927 0.7171673 52 71.69929 0 0.1 0 0 0 1 
i 4.379575 105.6927 0.7171673 58 72.70558 0 0.1 0 0 0 1 
i 7.011851 105.6927 0.7171673 60 70.29048 0 0.1 0 0 0 1 
i 7.379923 105.6927 0.7171673 54 70.89426 0 0.1 0 0 0 1 
i 7.870687 105.6927 0.7171673 63 71.69929 0 0.1 0 0 0 1 
i 8.484141 105.6927 0.7171673 69 72.70558 0 0.1 0 0 0 1 
i 6.415127 106.028 1.434335 73 78.69702 0 0.1 0 0 0 1 
i 7.335308 106.028 1.434335 83 80.20646 0 0.1 0 0 0 1 
i 10.51969 106.028 0.7171673 84 78.69702 0 0.1 0 0 0 1 
i 11.43987 106.028 0.7171673 94 80.20646 0 0.1 0 0 0 1 
i 2.784594 106.1366 0.5378755 49 70.10667 0 0.1 0 0 0 1 
i 6.88916 106.1366 0.5378755 61 70.10667 0 0.1 0 0 0 1 
i 1.122691 106.1874 0.5378755 59 70.29853 0 0.1 0 0 0 1 
i 1.245382 106.1874 0.5378755 56 70.49979 0 0.1 0 0 0 1 
i 1.490763 106.1874 0.5378755 61 70.90231 0 0.1 0 0 0 1 
i 1.858836 106.1874 0.5378755 63 71.50608 0 0.1 0 0 0 1 
i 5.227257 106.1874 0.5378755 70 70.29853 0 0.1 0 0 0 1 
i 5.349948 106.1874 0.5378755 68 70.49979 0 0.1 0 0 0 1 
i 5.595329 106.1874 0.5378755 72 70.90231 0 0.1 0 0 0 1 
i 5.963402 106.1874 0.5378755 74 71.50608 0 0.1 0 0 0 1 
i 4.630533 106.2073 1.075751 84 78.70507 0 0.1 0 0 0 1 
i 4.81457 106.2073 1.075751 87 79.00696 0 0.1 0 0 0 1 
i 8.735099 106.2073 0.5378755 95 78.70507 0 0.1 0 0 0 1 
i 8.919136 106.2073 0.5378755 98 79.00696 0 0.1 0 0 0 1 
i 2.784594 106.4099 1.396284 47 70.08922 0 0.1 0 0 0 1 
i 3.398048 106.4099 0.7171673 41 71.09551 0 0.1 0 0 0 1 
i 3.888811 106.4099 2.113452 50 71.90055 0 0.1 0 0 0 1 
i 4.256884 106.4099 0.7171673 56 72.50432 0 0.1 0 0 0 1 
i 6.88916 106.4099 2.113452 59 70.08922 0 0.1 0 0 0 1 
i 7.502614 106.4099 0.7171673 53 71.09551 0 0.1 0 0 0 1 
i 7.993377 106.4099 0.7171673 62 71.90055 0 0.1 0 0 0 1 
i 8.36145 106.4099 1.396284 68 72.50432 0 0.1 0 0 0 1 
i 1 106.7253 0.5378755 57 70.09727 0 0.1 0 0 0 1 
i 1.368072 106.7253 0.5378755 55 70.70105 0 0.1 0 0 0 1 
i 1.613454 106.7253 0.5378755 59 71.10356 0 0.1 0 0 0 1 
i 1.736145 106.7253 0.5378755 62 71.30482 0 0.1 0 0 0 1 
i 5.104566 106.7253 0.5378755 69 70.09727 0 0.1 0 0 0 1 
i 5.472639 106.7253 0.5378755 67 70.70105 0 0.1 0 0 0 1 
i 5.71802 106.7253 0.5378755 71 71.10356 0 0.1 0 0 0 1 
i 8.673754 106.7452 0.5378755 96 78.60444 0 0.1 0 0 0 1 
i 8.980481 106.7452 0.5378755 99 79.10759 0 0.1 0 0 0 1 
i 10.45835 106.7452 0.7171673 85 78.59639 0 0.1 0 0 0 1 
i 11.50122 106.7452 0.7171673 95 80.30709 0 0.1 0 0 0 1 
i 2.907285 107.089 1.434335 48 70.28981 0 0.1 0 0 0 1 
i 3.275357 107.089 1.434335 42 70.89358 0 0.1 0 0 0 1 
i 3.459394 107.089 0.7171673 40 71.19547 0 0.1 0 0 0 1 
i 3.766121 107.089 0.7171673 51 71.69862 0 0.1 0 0 0 1 
i 4.318229 107.089 1.434335 57 72.60428 0 0.1 0 0 0 1 
i 4.379575 107.089 1.434335 58 72.70491 0 0.1 0 0 0 1 
i 7.011851 107.089 1.434335 60 70.28981 0 0.1 0 0 0 1 
i 7.379923 107.089 0.7171673 53 70.89358 0 0.1 0 0 0 1 
i 7.56396 107.089 0.7171673 52 71.19547 0 0.1 0 0 0 1 
i 7.870687 107.089 1.434335 63 71.69862 0 0.1 0 0 0 1 
i 8.054723 107.089 0.7171673 61 72.0005 0 0.1 0 0 0 1 
i 8.484141 107.089 1.434335 69 72.70491 0 0.1 0 0 0 1 
i 2.845939 107.2151 0.5378755 44 70.20662 0 0.1 0 0 0 1 
i 6.950505 107.2151 0.5378755 55 70.20662 0 0.1 0 0 0 1 
i 6.476473 107.5364 1.122986 72 78.79698 0 0.1 0 0 0 1 
i 7.335308 107.5364 0.7171673 83 80.20579 0 0.1 0 0 0 1 
i 10.58104 107.5364 0.7171673 83 78.79698 0 0.1 0 0 0 1 
i 11.43987 107.5364 0.7171673 94 80.20579 0 0.1 0 0 0 1 
i 1.061345 107.5837 1.075751 57 70.19723 0 0.1 0 0 0 1 
i 1.122691 107.5837 1.075751 58 70.29786 0 0.1 0 0 0 1 
i 1.245382 107.5837 1.075751 56 70.49912 0 0.1 0 0 0 1 
i 1.429418 107.5837 0.5378755 55 70.80101 0 0.1 0 0 0 1 
i 1.490763 107.5837 0.5378755 61 70.90164 0 0.1 0 0 0 1 
i 1.6748 107.5837 1.075751 60 71.20352 0 0.1 0 0 0 1 
i 1.79749 107.5837 1.075751 62 71.40478 0 0.1 0 0 0 1 
i 1.858836 107.5837 1.075751 63 71.50541 0 0.1 0 0 0 1 
i 5.165911 107.5837 1.075751 69 70.19723 0 0.1 0 0 0 1 
i 5.227257 107.5837 0.5378755 70 70.29786 0 0.1 0 0 0 1 
i 5.349948 107.5837 1.075751 68 70.49912 0 0.1 0 0 0 1 
i 5.533984 107.5837 0.5378755 67 70.80101 0 0.1 0 0 0 1 
i 5.779366 107.5837 0.5378755 71 71.20352 0 0.1 0 0 0 1 
i 5.902056 107.5837 2.072287 73 71.40478 0 0.1 0 0 0 1 
i 5.963402 107.5837 1.075751 74 71.50541 0 0.1 0 0 0 1 
i 4.691879 107.7157 0.5378755 85 78.80503 0 0.1 0 0 0 1 
i 4.81457 107.7157 0.5378755 87 79.00629 0 0.1 0 0 0 1 
i 8.796445 107.7157 0.5378755 96 78.80503 0 0.1 0 0 0 1 
i 8.919136 107.7157 0.5378755 98 79.00629 0 0.1 0 0 0 1 
i 2.784594 107.753 0.5378755 45 70.106 0 0.1 0 0 0 1 
i 6.88916 107.753 0.5378755 56 70.106 0 0.1 0 0 0 1 
i 2.96863 107.8062 0.7171673 49 70.39044 0 0.1 0 0 0 1 
i 3.398048 107.8062 0.7171673 41 71.09484 0 0.1 0 0 0 1 
i 3.827466 107.8062 0.7171673 52 71.79925 0 0.1 0 0 0 1 
i 7.441269 107.8062 0.7171673 54 70.99421 0 0.1 0 0 0 1 
i 7.502614 107.8062 0.7171673 53 71.09484 0 0.1 0 0 0 1 
i 7.993377 107.8062 0.7171673 62 71.89987 0 0.1 0 0 0 1 
i 8.545486 107.8062 0.7171673 70 72.80553 0 0.1 0 0 0 1 
i 1.184036 108.1215 0.5378755 59 70.39849 0 0.1 0 0 0 1 
i 1.552109 108.1215 0.5378755 61 71.00226 0 0.1 0 0 0 1 
i 5.288602 108.1215 0.5378755 71 70.39849 0 0.1 0 0 0 1 
i 5.472639 108.1215 0.5378755 67 70.70038 0 0.1 0 0 0 1 
i 6.024747 108.1215 0.5378755 75 71.60604 0 0.1 0 0 0 1 
i 4.569188 108.2536 0.5378755 86 78.60377 0 0.1 0 0 0 1 
i 4.93726 108.2536 0.5378755 88 79.20755 0 0.1 0 0 0 1 
i 7.457999 108.2536 1.402355 84 80.40704 0 0.1 0 0 0 1 
i 8.673754 108.2536 0.5378755 97 78.60377 0 0.1 0 0 0 1 
i 9.041826 108.2536 0.5378755 100 79.20755 0 0.1 0 0 0 1 
i 10.45835 108.2536 0.7171673 85 78.59572 0 0.1 0 0 0 1 
i 11.56257 108.2536 0.7171673 96 80.40704 0 0.1 0 0 0 1 
i 3.029976 108.6964 0.7171673 48 70.4904 0 0.1 0 0 0 1 
i 3.275357 108.6964 0.7171673 44 70.89291 0 0.1 0 0 0 1 
i 3.766121 108.6964 0.7171673 53 71.69795 0 0.1 0 0 0 1 
i 4.502266 108.6964 0.7171673 58 72.90549 0 0.1 0 0 0 1 
i 7.134542 108.6964 0.7171673 60 70.4904 0 0.1 0 0 0 1 
i 7.379923 108.6964 0.7171673 55 70.89291 0 0.1 0 0 0 1 
i 7.870687 108.6964 0.7171673 65 71.69795 0 0.1 0 0 0 1 
i 8.606832 108.6964 0.7171673 69 72.90549 0 0.1 0 0 0 1 
i 2.907285 108.8709 1.259834 46 70.30658 0 0.1 0 0 0 1 
i 7.011851 108.8709 1.075751 58 70.30658 0 0.1 0 0 0 1 
i 6.476473 108.9388 0.7171673 71 78.79631 0 0.1 0 0 0 1 
i 7.519345 108.9388 0.7171673 85 80.507 0 0.1 0 0 0 1 
i 10.51969 108.9388 0.7171673 84 78.69568 0 0.1 0 0 0 1 
i 10.58104 108.9388 0.7171673 83 78.79631 0 0.1 0 0 0 1 
i 11.43987 108.9388 0.7171673 96 80.20512 0 0.1 0 0 0 1 
i 11.62391 108.9388 0.7171673 97 80.507 0 0.1 0 0 0 1 
i 4.630533 109.1181 1.075751 87 78.70373 0 0.1 0 0 0 1 
i 4.691879 109.1181 1.075751 86 78.80436 0 0.1 0 0 0 1 
i 4.81457 109.1181 1.075751 88 79.00562 0 0.1 0 0 0 1 
i 4.998606 109.1181 0.5378755 89 79.30751 0 0.1 0 0 0 1 
i 8.735099 109.1181 1.075751 98 78.70373 0 0.1 0 0 0 1 
i 8.796445 109.1181 1.075751 97 78.80436 0 0.1 0 0 0 1 
i 8.919136 109.1181 1.075751 99 79.00562 0 0.1 0 0 0 1 
i 9.103172 109.1181 1.075751 100 79.30751 0 0.1 0 0 0 1 
i 3.520739 109.4136 0.7171673 41 71.29543 0 0.1 0 0 0 1 
i 4.011502 109.4136 0.7171673 51 72.10046 0 0.1 0 0 0 1 
i 4.256884 109.4136 2.826625 55 72.50298 0 0.1 0 0 0 1 
i 6.88916 109.4136 2.826625 57 70.08788 0 0.1 0 0 0 1 
i 7.625305 109.4136 0.7171673 53 71.29543 0 0.1 0 0 0 1 
i 8.116068 109.4136 0.7171673 62 72.10046 0 0.1 0 0 0 1 
i 8.36145 109.4136 0.7171673 67 72.50298 0 0.1 0 0 0 1 
i 4.753224 109.656 0.5378755 85 78.90499 0 0.1 0 0 0 1 
i 6.353782 109.656 0.7171673 72 78.59505 0 0.1 0 0 0 1 
i 6.537818 109.656 0.7171673 71 78.89694 0 0.1 0 0 0 1 
i 7.396654 109.656 0.7171673 83 80.30574 0 0.1 0 0 0 1 
i 7.457999 109.656 0.7171673 85 80.40637 0 0.1 0 0 0 1 
i 10.45835 109.656 0.7171673 83 78.59505 0 0.1 0 0 0 1 
i 10.64238 109.656 0.7171673 82 78.89694 0 0.1 0 0 0 1 
i 11.50122 109.656 0.7171673 95 80.30574 0 0.1 0 0 0 1 
i 11.56257 109.656 0.7171673 96 80.40637 0 0.1 0 0 0 1 
i 2.845939 110.0927 0.7171673 45 70.18784 0 0.1 0 0 0 1 
i 3.029976 110.0927 0.7171673 48 70.48973 0 0.1 0 0 0 1 
i 3.275357 110.0927 1.434335 44 70.89224 0 0.1 0 0 0 1 
i 3.582084 110.0927 0.7171673 40 71.39539 0 0.1 0 0 0 1 
i 3.766121 110.0927 0.7171673 53 71.69727 0 0.1 0 0 0 1 
i 4.072848 110.0927 0.7171673 50 72.20042 0 0.1 0 0 0 1 
i 4.502266 110.0927 1.434335 58 72.90482 0 0.1 0 0 0 1 
i 7.134542 110.0927 1.434335 60 70.48973 0 0.1 0 0 0 1 
i 7.379923 110.0927 0.7171673 55 70.89224 0 0.1 0 0 0 1 
i 7.68665 110.0927 0.7171673 52 71.39539 0 0.1 0 0 0 1 
i 7.870687 110.0927 1.434335 65 71.69727 0 0.1 0 0 0 1 
i 8.177414 110.0927 0.7171673 61 72.20042 0 0.1 0 0 0 1 
i 8.422795 110.0927 0.7171673 66 72.60294 0 0.1 0 0 0 1 
i 8.606832 110.0927 0.7171673 69 72.90482 0 0.1 0 0 0 1 
i 1.981527 110.1956 0.5378755 59 71.706 0 0.1 0 0 0 1 
i 6.086093 110.1956 0.5378755 70 71.706 0 0.1 0 0 0 1 
i 2.845939 110.4103 0.5378755 53 70.20528 0 0.1 0 0 0 1 
i 2.907285 110.4103 0.5378755 55 70.30591 0 0.1 0 0 0 1 
i 6.950505 110.4103 0.5378755 64 70.20528 0 0.1 0 0 0 1 
i 7.011851 110.4103 0.5378755 66 70.30591 0 0.1 0 0 0 1 
i 6.599163 110.5532 0.7171673 71 78.9969 0 0.1 0 0 0 1 
i 7.335308 110.5532 0.7171673 82 80.20444 0 0.1 0 0 0 1 
i 10.70373 110.5532 0.7171673 82 78.9969 0 0.1 0 0 0 1 
i 11.43987 110.5532 0.7171673 94 80.20444 0 0.1 0 0 0 1 
i 1 110.7334 0.5378755 51 70.09593 0 0.1 0 0 0 1 
i 5.104566 110.7334 0.5378755 63 70.09593 0 0.1 0 0 0 1 
i 2.784594 110.8099 0.7171673 46 70.08721 0 0.1 0 0 0 1 
i 3.091321 110.8099 0.7171673 49 70.59036 0 0.1 0 0 0 1 
i 3.520739 110.8099 1.43034 41 71.29476 0 0.1 0 0 0 1 
i 3.827466 110.8099 0.7171673 54 71.7979 0 0.1 0 0 0 1 
i 4.011502 110.8099 0.7171673 51 72.09979 0 0.1 0 0 0 1 
i 7.441269 110.8099 0.7171673 56 70.99287 0 0.1 0 0 0 1 
i 7.625305 110.8099 0.7171673 53 71.29476 0 0.1 0 0 0 1 
i 8.116068 110.8099 0.7171673 62 72.09979 0 0.1 0 0 0 1 
i 8.36145 110.8099 0.7171673 67 72.50231 0 0.1 0 0 0 1 
i 8.668177 110.8099 0.7171673 70 73.00545 0 0.1 0 0 0 1 
i 2.784594 110.9482 0.5378755 54 70.10465 0 0.1 0 0 0 1 
i 2.96863 110.9482 0.5378755 56 70.40654 0 0.1 0 0 0 1 
i 6.88916 110.9482 0.5378755 65 70.10465 0 0.1 0 0 0 1 
i 7.073196 110.9482 0.5378755 67 70.40654 0 0.1 0 0 0 1 
i 5.059951 111.0701 0.5378755 87 79.40746 0 0.1 0 0 0 1 
i 9.164517 111.0701 0.5378755 99 79.40746 0 0.1 0 0 0 1 
i 6.353782 111.2704 1.402355 74 78.59438 0 0.1 0 0 0 1 
i 7.58069 111.2704 0.7171673 85 80.60696 0 0.1 0 0 0 1 
i 10.45835 111.2704 0.7171673 85 78.59438 0 0.1 0 0 0 1 
i 11.68526 111.2704 0.7171673 97 80.60696 0 0.1 0 0 0 1 
i 2.907285 111.523 0.7171673 45 70.2878 0 0.1 0 0 0 1 
i 3.029976 111.523 0.7171673 48 70.48906 0 0.1 0 0 0 1 
i 3.275357 111.523 0.7171673 43 70.89157 0 0.1 0 0 0 1 
i 3.766121 111.523 0.7171673 52 71.6966 0 0.1 0 0 0 1 
i 4.134193 111.523 0.7171673 50 72.30038 0 0.1 0 0 0 1 
i 4.502266 111.523 0.7171673 57 72.90415 0 0.1 0 0 0 1 
i 7.134542 111.523 0.7171673 59 70.48906 0 0.1 0 0 0 1 
i 7.379923 111.523 0.7171673 54 70.89157 0 0.1 0 0 0 1 
i 7.747996 111.523 0.7171673 52 71.49535 0 0.1 0 0 0 1 
i 7.870687 111.523 0.7171673 64 71.6966 0 0.1 0 0 0 1 
i 8.238759 111.523 0.7171673 61 72.30038 0 0.1 0 0 0 1 
i 8.484141 111.523 0.7171673 66 72.70289 0 0.1 0 0 0 1 
i 8.606832 111.523 0.7171673 68 72.90415 0 0.1 0 0 0 1 
i 4.569188 111.608 0.5378755 83 78.60243 0 0.1 0 0 0 1 
i 8.673754 111.608 0.5378755 95 78.60243 0 0.1 0 0 0 1 
i 1.061345 111.735 0.5378755 50 70.19589 0 0.1 0 0 0 1 
i 1.981527 111.735 1.075751 60 71.70532 0 0.1 0 0 0 1 
i 5.165911 111.735 1.075751 62 70.19589 0 0.1 0 0 0 1 
i 6.086093 111.735 0.5378755 71 71.70532 0 0.1 0 0 0 1 
i 6.599163 111.9556 0.7171673 71 78.99623 0 0.1 0 0 0 1 
i 7.335308 111.9556 0.7171673 83 80.20377 0 0.1 0 0 0 1 
i 7.642036 111.9556 0.7171673 86 80.70692 0 0.1 0 0 0 1 
i 10.51969 111.9556 0.7171673 85 78.69434 0 0.1 0 0 0 1 
i 10.70373 111.9556 0.7171673 82 78.99623 0 0.1 0 0 0 1 
i 11.43987 111.9556 0.7171673 94 80.20377 0 0.1 0 0 0 1 
i 11.7466 111.9556 0.7171673 98 80.70692 0 0.1 0 0 0 1 
i 3.029976 112.1825 0.5378755 36 70.5065 0 0.1 0 0 0 1 
i 7.134542 112.1825 0.5378755 47 70.5065 0 0.1 0 0 0 1 
i 2.784594 112.2402 2.046962 47 70.08654 0 0.1 0 0 0 1 
i 3.152666 112.2402 2.046962 49 70.69031 0 0.1 0 0 0 1 
i 3.398048 112.2402 2.046962 44 71.09283 0 0.1 0 0 0 1 
i 3.520739 112.2402 1.329795 42 71.29409 0 0.1 0 0 0 1 
i 3.888811 112.2402 2.046962 54 71.89786 0 0.1 0 0 0 1 
i 4.011502 112.2402 0.7171673 51 72.09912 0 0.1 0 0 0 1 
i 4.256884 112.2402 2.046962 56 72.50164 0 0.1 0 0 0 1 
i 4.624956 112.2402 0.7171673 58 73.10541 0 0.1 0 0 0 1 
i 6.88916 112.2402 2.046962 58 70.08654 0 0.1 0 0 0 1 
i 7.257232 112.2402 0.7171673 60 70.69031 0 0.1 0 0 0 1 
i 7.502614 112.2402 1.329795 56 71.09283 0 0.1 0 0 0 1 
i 7.625305 112.2402 0.7171673 53 71.29409 0 0.1 0 0 0 1 
i 7.993377 112.2402 2.046962 65 71.89786 0 0.1 0 0 0 1 
i 8.116068 112.2402 1.329795 63 72.09912 0 0.1 0 0 0 1 
i 8.36145 112.2402 1.329795 68 72.50164 0 0.1 0 0 0 1 
i 8.729522 112.2402 1.329795 70 73.10541 0 0.1 0 0 0 1 
i 1 112.2728 0.5378755 51 70.09526 0 0.1 0 0 0 1 
i 6.147438 112.2728 0.5378755 72 71.80595 0 0.1 0 0 0 1 
i 4.630533 112.5426 1.075751 83 78.70239 0 0.1 0 0 0 1 
i 5.059951 112.5426 0.5378755 88 79.40679 0 0.1 0 0 0 1 
i 8.735099 112.5426 0.5378755 94 78.70239 0 0.1 0 0 0 1 
i 9.164517 112.5426 1.075751 100 79.40679 0 0.1 0 0 0 1 
i 6.353782 112.6727 0.7171673 73 78.59371 0 0.1 0 0 0 1 
i 6.660509 112.6727 0.7171673 70 79.09686 0 0.1 0 0 0 1 
i 7.396654 112.6727 0.7171673 82 80.3044 0 0.1 0 0 0 1 
i 7.58069 112.6727 0.7171673 85 80.60629 0 0.1 0 0 0 1 
i 10.45835 112.6727 0.7171673 85 78.59371 0 0.1 0 0 0 1 
i 10.76507 112.6727 0.7171673 81 79.09686 0 0.1 0 0 0 1 
i 11.50122 112.6727 0.7171673 94 80.3044 0 0.1 0 0 0 1 
i 11.68526 112.6727 0.7171673 97 80.60629 0 0.1 0 0 0 1 
i 2.784594 112.7204 0.5378755 41 70.10398 0 0.1 0 0 0 1 
i 6.88916 112.7204 0.5378755 52 70.10398 0 0.1 0 0 0 1 
i 2.907285 112.8528 1.434335 46 70.28713 0 0.1 0 0 0 1 
i 3.029976 112.8528 0.7171673 48 70.48839 0 0.1 0 0 0 1 
i 3.275357 112.8528 1.434335 43 70.8909 0 0.1 0 0 0 1 
i 3.64343 112.8528 1.434335 41 71.49468 0 0.1 0 0 0 1 
i 3.766121 112.8528 1.434335 53 71.69593 0 0.1 0 0 0 1 
i 4.072848 112.8528 1.434335 52 72.19908 0 0.1 0 0 0 1 
i 4.134193 112.8528 1.434335 50 72.29971 0 0.1 0 0 0 1 
i 4.379575 112.8528 0.7171673 55 72.70222 0 0.1 0 0 0 1 
i 4.502266 112.8528 1.434335 57 72.90348 0 0.1 0 0 0 1 
i 4.686302 112.8528 0.7171673 59 73.20537 0 0.1 0 0 0 1 
i 7.011851 112.8528 1.434335 57 70.28713 0 0.1 0 0 0 1 
i 7.134542 112.8528 1.434335 59 70.48839 0 0.1 0 0 0 1 
i 7.318578 112.8528 0.7171673 61 70.79027 0 0.1 0 0 0 1 
i 7.379923 112.8528 0.7171673 55 70.8909 0 0.1 0 0 0 1 
i 7.68665 112.8528 0.7171673 54 71.39405 0 0.1 0 0 0 1 
i 7.747996 112.8528 1.434335 52 71.49468 0 0.1 0 0 0 1 
i 7.870687 112.8528 1.434335 64 71.69593 0 0.1 0 0 0 1 
i 8.238759 112.8528 1.434335 62 72.29971 0 0.1 0 0 0 1 
i 8.484141 112.8528 1.434335 67 72.70222 0 0.1 0 0 0 1 
i 8.606832 112.8528 1.434335 69 72.90348 0 0.1 0 0 0 1 
i 5.121297 113.0804 0.5378755 89 79.50742 0 0.1 0 0 0 1 
i 8.673754 113.0804 0.5378755 95 78.60176 0 0.1 0 0 0 1 
i 1.122691 113.3119 0.5378755 49 70.29585 0 0.1 0 0 0 1 
i 1.981527 113.3119 0.5378755 60 71.70465 0 0.1 0 0 0 1 
i 5.227257 113.3119 0.5378755 61 70.29585 0 0.1 0 0 0 1 
i 6.086093 113.3119 0.5378755 71 71.70465 0 0.1 0 0 0 1 
i 6.476473 113.3921 0.7171673 73 78.7943 0 0.1 0 0 0 1 
i 6.599163 113.3921 0.7171673 71 78.99556 0 0.1 0 0 0 1 
i 7.335308 113.3921 0.7171673 84 80.2031 0 0.1 0 0 0 1 
i 7.703381 113.3921 0.7171673 86 80.80688 0 0.1 0 0 0 1 
i 10.58104 113.3921 0.7171673 85 78.7943 0 0.1 0 0 0 1 
i 10.70373 113.3921 0.7171673 82 78.99556 0 0.1 0 0 0 1 
i 11.43987 113.3921 0.7171673 96 80.2031 0 0.1 0 0 0 1 
i 11.80795 113.3921 0.7171673 98 80.80688 0 0.1 0 0 0 1 
i 2.96863 113.57 0.7171673 45 70.38776 0 0.1 0 0 0 1 
i 3.704775 113.57 0.7171673 40 71.5953 0 0.1 0 0 0 1 
i 4.011502 113.57 0.7171673 51 72.09845 0 0.1 0 0 0 1 
i 4.624956 113.57 0.7171673 58 73.10474 0 0.1 0 0 0 1 
i 7.257232 113.57 0.7171673 60 70.68964 0 0.1 0 0 0 1 
i 7.441269 113.57 0.7171673 54 70.99153 0 0.1 0 0 0 1 
i 7.502614 113.57 0.7171673 55 71.09216 0 0.1 0 0 0 1 
i 7.625305 113.57 0.7171673 53 71.29342 0 0.1 0 0 0 1 
i 8.300105 113.57 0.7171673 61 72.40034 0 0.1 0 0 0 1 
i 8.545486 113.57 0.7171673 66 72.80285 0 0.1 0 0 0 1 
i 8.668177 113.57 0.7171673 68 73.00411 0 0.1 0 0 0 1 
i 2.845939 113.7219 0.5378755 52 70.20394 0 0.1 0 0 0 1 
i 3.029976 113.7219 0.5378755 58 70.50583 0 0.1 0 0 0 1 
i 6.950505 113.7219 0.5378755 64 70.20394 0 0.1 0 0 0 1 
i 7.134542 113.7219 0.5378755 69 70.50583 0 0.1 0 0 0 1 
i 1 113.8498 0.5378755 51 70.09459 0 0.1 0 0 0 1 
i 2.104217 113.8498 0.5378755 61 71.90591 0 0.1 0 0 0 1 
i 5.104566 113.8498 0.5378755 62 70.09459 0 0.1 0 0 0 1 
i 6.208784 113.8498 2.312248 72 71.90591 0 0.1 0 0 0 1 
i 4.691879 114.051 0.5378755 83 78.80235 0 0.1 0 0 0 1 
i 5.059951 114.051 0.5378755 88 79.40612 0 0.1 0 0 0 1 
i 8.796445 114.051 0.5378755 94 78.80235 0 0.1 0 0 0 1 
i 9.164517 114.051 0.5378755 100 79.40612 0 0.1 0 0 0 1 
i 6.721854 114.1093 2.052744 70 79.19681 0 0.1 0 0 0 1 
i 7.457999 114.1093 0.7171673 83 80.40436 0 0.1 0 0 0 1 
i 7.58069 114.1093 1.335576 85 80.60562 0 0.1 0 0 0 1 
i 10.45835 114.1093 0.7171673 83 78.59304 0 0.1 0 0 0 1 
i 10.82642 114.1093 2.052744 81 79.19681 0 0.1 0 0 0 1 
i 11.56257 114.1093 1.335576 94 80.40436 0 0.1 0 0 0 1 
i 11.68526 114.1093 2.052744 97 80.60562 0 0.1 0 0 0 1 
i 2.784594 114.2598 0.5378755 53 70.10331 0 0.1 0 0 0 1 
i 3.091321 114.2598 0.5378755 59 70.60646 0 0.1 0 0 0 1 
i 6.88916 114.2598 0.5378755 65 70.10331 0 0.1 0 0 0 1 
i 4.569188 114.5888 0.5378755 84 78.60109 0 0.1 0 0 0 1 
i 5.182642 114.5888 0.5378755 89 79.60738 0 0.1 0 0 0 1 
i 8.673754 114.5888 0.5378755 96 78.60109 0 0.1 0 0 0 1 
i 9.287208 114.5888 0.5378755 101 79.60738 0 0.1 0 0 0 1 
i 6.415127 114.7277 0.7171673 71 78.693 0 0.1 0 0 0 1 
i 6.476473 114.7277 1.12606 73 78.79363 0 0.1 0 0 0 1 
i 6.7832 114.7277 0.7171673 69 79.29677 0 0.1 0 0 0 1 
i 7.335308 114.7277 0.7171673 84 80.20243 0 0.1 0 0 0 1 
i 7.519345 114.7277 0.7171673 83 80.50432 0 0.1 0 0 0 1 
i 7.703381 114.7277 1.434335 86 80.80621 0 0.1 0 0 0 1 
i 10.51969 114.7277 0.7171673 83 78.693 0 0.1 0 0 0 1 
i 10.58104 114.7277 0.7171673 84 78.79363 0 0.1 0 0 0 1 
i 10.70373 114.7277 1.434335 82 78.99488 0 0.1 0 0 0 1 
i 11.43987 114.7277 0.7171673 96 80.20243 0 0.1 0 0 0 1 
i 11.80795 114.7277 1.434335 98 80.80621 0 0.1 0 0 0 1 
i 1.061345 114.778 1.075751 50 70.19455 0 0.1 0 0 0 1 
i 1.122691 114.778 1.075751 49 70.29518 0 0.1 0 0 0 1 
i 1.981527 114.778 1.075751 61 71.70398 0 0.1 0 0 0 1 
i 2.165563 114.778 0.5378755 62 72.00587 0 0.1 0 0 0 1 
i 5.165911 114.778 0.5378755 62 70.19455 0 0.1 0 0 0 1 
i 5.227257 114.778 1.075751 61 70.29518 0 0.1 0 0 0 1 
i 2.907285 115.2989 1.075751 45 70.3039 0 0.1 0 0 0 1 
i 7.011851 115.2989 0.5378755 57 70.3039 0 0.1 0 0 0 1 
i 7.134542 115.2989 1.075751 56 70.50516 0 0.1 0 0 0 1 
i 2.042872 115.3159 0.5378755 60 71.80461 0 0.1 0 0 0 1 
i 5.288602 115.3159 0.5378755 60 70.39581 0 0.1 0 0 0 1 
i 6.537818 115.4449 0.7171673 73 78.89426 0 0.1 0 0 0 1 
i 6.660509 115.4449 0.7171673 71 79.09551 0 0.1 0 0 0 1 
i 7.396654 115.4449 0.7171673 85 80.30306 0 0.1 0 0 0 1 
i 7.457999 115.4449 0.7171673 83 80.40369 0 0.1 0 0 0 1 
i 7.764726 115.4449 0.7171673 87 80.90683 0 0.1 0 0 0 1 
i 10.45835 115.4449 0.7171673 83 78.59237 0 0.1 0 0 0 1 
i 10.64238 115.4449 0.7171673 85 78.89426 0 0.1 0 0 0 1 
i 11.50122 115.4449 0.7171673 96 80.30306 0 0.1 0 0 0 1 
i 11.56257 115.4449 0.7171673 95 80.40369 0 0.1 0 0 0 1 
i 4.630533 115.4533 1.075751 84 78.70105 0 0.1 0 0 0 1 
i 4.691879 115.4533 1.075751 83 78.80168 0 0.1 0 0 0 1 
i 5.059951 115.4533 1.075751 89 79.40545 0 0.1 0 0 0 1 
i 5.243987 115.4533 1.075751 90 79.70734 0 0.1 0 0 0 1 
i 8.735099 115.4533 0.5378755 96 78.70105 0 0.1 0 0 0 1 
i 8.796445 115.4533 1.075751 95 78.80168 0 0.1 0 0 0 1 
i 9.164517 115.4533 1.075751 101 79.40545 0 0.1 0 0 0 1 
i 9.348554 115.4533 0.5378755 102 79.70734 0 0.1 0 0 0 1 
i 3.152666 115.8367 0.5378755 44 70.70642 0 0.1 0 0 0 1 
i 8.85779 115.9912 0.5378755 94 78.90231 0 0.1 0 0 0 1 
i 9.225863 115.9912 0.5378755 100 79.50608 0 0.1 0 0 0 1 
i 1.245382 116.4658 0.5378755 49 70.49577 0 0.1 0 0 0 1 
i 1.981527 116.4658 0.5378755 59 71.70331 0 0.1 0 0 0 1 
i 5.349948 116.4658 0.5378755 60 70.49577 0 0.1 0 0 0 1 
i 6.086093 116.4658 0.5378755 71 71.70331 0 0.1 0 0 0 1 
i 6.844545 116.5868 0.7171673 71 79.39673 0 0.1 0 0 0 1 
i 7.335308 116.5868 0.7171673 80 80.20176 0 0.1 0 0 0 1 
i 10.94911 116.5868 0.7171673 82 79.39673 0 0.1 0 0 0 1 
i 11.43987 116.5868 0.7171673 92 80.20176 0 0.1 0 0 0 1 
i 2.845939 116.765 0.5378755 38 70.2026 0 0.1 0 0 0 1 
i 2.907285 116.765 0.5378755 40 70.30323 0 0.1 0 0 0 1 
i 3.029976 116.765 1.075751 37 70.50449 0 0.1 0 0 0 1 
i 3.214012 116.765 0.5378755 35 70.80637 0 0.1 0 0 0 1 
i 6.950505 116.765 0.5378755 50 70.2026 0 0.1 0 0 0 1 
i 7.011851 116.765 1.075751 51 70.30323 0 0.1 0 0 0 1 
i 7.134542 116.765 0.5378755 48 70.50449 0 0.1 0 0 0 1 
i 7.318578 116.765 1.075751 47 70.80637 0 0.1 0 0 0 1 
i 1 117.0037 0.5378755 51 70.09325 0 0.1 0 0 0 1 
i 2.226908 117.0037 0.5378755 62 72.10583 0 0.1 0 0 0 1 
i 5.104566 117.0037 0.5378755 63 70.09325 0 0.1 0 0 0 1 
i 6.331474 117.0037 0.5378755 73 72.10583 0 0.1 0 0 0 1 
i 4.81457 117.0677 0.5378755 84 79.00226 0 0.1 0 0 0 1 
i 5.059951 117.0677 0.5378755 88 79.40478 0 0.1 0 0 0 1 
i 8.919136 117.0677 0.5378755 95 79.00226 0 0.1 0 0 0 1 
i 9.164517 117.0677 0.5378755 99 79.40478 0 0.1 0 0 0 1 
i 2.784594 117.3028 0.5378755 39 70.10197 0 0.1 0 0 0 1 
i 2.96863 117.3028 0.5378755 41 70.40386 0 0.1 0 0 0 1 
i 3.152666 117.3028 0.5378755 36 70.70574 0 0.1 0 0 0 1 
i 7.073196 117.3028 0.5378755 52 70.40386 0 0.1 0 0 0 1 
i 7.195887 117.3028 0.5378755 49 70.60512 0 0.1 0 0 0 1 
i 6.353782 117.3039 0.7171673 76 78.5917 0 0.1 0 0 0 1 
i 7.826072 117.3039 0.7171673 85 81.00679 0 0.1 0 0 0 1 
i 10.45835 117.3039 0.7171673 87 78.5917 0 0.1 0 0 0 1 
i 11.93064 117.3039 0.7171673 96 81.00679 0 0.1 0 0 0 1 
i 4.569188 117.6056 0.5378755 86 78.59975 0 0.1 0 0 0 1 
i 5.305333 117.6056 0.5378755 90 79.8073 0 0.1 0 0 0 1 
i 8.673754 117.6056 0.5378755 97 78.59975 0 0.1 0 0 0 1 
i 9.409899 117.6056 0.5378755 102 79.8073 0 0.1 0 0 0 1 
i 1.061345 117.9319 1.075751 51 70.19321 0 0.1 0 0 0 1 
i 1.245382 117.9319 1.075751 48 70.49509 0 0.1 0 0 0 1 
i 1.981527 117.9319 0.5378755 60 71.70264 0 0.1 0 0 0 1 
i 2.288254 117.9319 1.075751 62 72.20579 0 0.1 0 0 0 1 
i 5.165911 117.9319 0.5378755 63 70.19321 0 0.1 0 0 0 1 
i 5.349948 117.9319 0.5378755 60 70.49509 0 0.1 0 0 0 1 
i 6.086093 117.9319 0.5378755 71 71.70264 0 0.1 0 0 0 1 
i 6.39282 117.9319 0.5378755 74 72.20579 0 0.1 0 0 0 1 
i 6.415127 117.9891 0.7171673 77 78.69166 0 0.1 0 0 0 1 
i 6.844545 117.9891 0.7171673 71 79.39606 0 0.1 0 0 0 1 
i 7.335308 117.9891 0.7171673 80 80.20109 0 0.1 0 0 0 1 
i 7.887417 117.9891 0.7171673 86 81.10675 0 0.1 0 0 0 1 
i 10.51969 117.9891 0.7171673 88 78.69166 0 0.1 0 0 0 1 
i 10.94911 117.9891 1.434335 82 79.39606 0 0.1 0 0 0 1 
i 11.43987 117.9891 0.7171673 92 80.20109 0 0.1 0 0 0 1 
i 11.99198 117.9891 1.434335 97 81.10675 0 0.1 0 0 0 1 
i 2.042872 118.4698 0.5378755 59 71.80327 0 0.1 0 0 0 1 
i 5.104566 118.4698 0.5378755 62 70.09258 0 0.1 0 0 0 1 
i 5.411293 118.4698 0.5378755 59 70.59572 0 0.1 0 0 0 1 
i 6.147438 118.4698 0.5378755 70 71.80327 0 0.1 0 0 0 1 
i 6.331474 118.4698 0.5378755 73 72.10516 0 0.1 0 0 0 1 
i 4.630533 118.4701 0.5378755 87 78.69971 0 0.1 0 0 0 1 
i 4.81457 118.4701 0.5378755 84 79.00159 0 0.1 0 0 0 1 
i 5.059951 118.4701 1.075751 88 79.40411 0 0.1 0 0 0 1 
i 5.366678 118.4701 0.5378755 91 79.90725 0 0.1 0 0 0 1 
i 8.735099 118.4701 1.075751 98 78.69971 0 0.1 0 0 0 1 
i 8.919136 118.4701 1.075751 95 79.00159 0 0.1 0 0 0 1 
i 9.164517 118.4701 0.5378755 100 79.40411 0 0.1 0 0 0 1 
i 9.471244 118.4701 0.5378755 103 79.90725 0 0.1 0 0 0 1 
i 6.353782 118.7063 0.7171673 76 78.59103 0 0.1 0 0 0 1 
i 6.905891 118.7063 0.7171673 70 79.49669 0 0.1 0 0 0 1 
i 7.396654 118.7063 0.7171673 79 80.30172 0 0.1 0 0 0 1 
i 7.826072 118.7063 0.7171673 85 81.00612 0 0.1 0 0 0 1 
i 10.45835 118.7063 0.7171673 87 78.59103 0 0.1 0 0 0 1 
i 11.50122 118.7063 0.7171673 91 80.30172 0 0.1 0 0 0 1 
i 3.275357 118.8057 0.5378755 58 70.90633 0 0.1 0 0 0 1 
i 7.379923 118.8057 0.5378755 69 70.90633 0 0.1 0 0 0 1 
i 4.569188 119.008 0.5378755 86 78.59908 0 0.1 0 0 0 1 
i 4.875915 119.008 0.5378755 83 79.10222 0 0.1 0 0 0 1 
i 5.305333 119.008 0.5378755 90 79.80662 0 0.1 0 0 0 1 
i 9.225863 119.008 0.5378755 99 79.50474 0 0.1 0 0 0 1 
i 9.409899 119.008 0.5378755 102 79.80662 0 0.1 0 0 0 1 
i 2.784594 119.3436 0.5378755 51 70.1013 0 0.1 0 0 0 1 
i 6.88916 119.3436 0.5378755 62 70.1013 0 0.1 0 0 0 1 
i 6.476473 119.4257 0.7171673 77 78.79161 0 0.1 0 0 0 1 
i 6.844545 119.4257 0.7171673 71 79.39539 0 0.1 0 0 0 1 
i 7.335308 119.4257 0.7171673 80 80.20042 0 0.1 0 0 0 1 
i 7.948763 119.4257 0.7171673 86 81.20671 0 0.1 0 0 0 1 
i 10.58104 119.4257 0.7171673 88 78.79161 0 0.1 0 0 0 1 
i 10.94911 119.4257 0.7171673 83 79.39539 0 0.1 0 0 0 1 
i 11.43987 119.4257 0.7171673 92 80.20042 0 0.1 0 0 0 1 
i 12.05333 119.4257 0.7171673 98 81.20671 0 0.1 0 0 0 1 
i 1.122691 119.4338 0.5378755 51 70.29317 0 0.1 0 0 0 1 
i 1.245382 119.4338 0.5378755 49 70.49442 0 0.1 0 0 0 1 
i 1.981527 119.4338 1.075751 61 71.70197 0 0.1 0 0 0 1 
i 2.349599 119.4338 0.5378755 63 72.30574 0 0.1 0 0 0 1 
i 5.227257 119.4338 0.5378755 62 70.29317 0 0.1 0 0 0 1 
i 5.349948 119.4338 0.5378755 60 70.49442 0 0.1 0 0 0 1 
i 6.086093 119.4338 0.5378755 72 71.70197 0 0.1 0 0 0 1 
i 6.454165 119.4338 0.5378755 74 72.30574 0 0.1 0 0 0 1 
i 6.353782 119.8815 0.5378755 78 78.6078 0 0.1 0 0 0 1 
i 10.45835 119.8815 0.5378755 89 78.6078 0 0.1 0 0 0 1 
i 4.691879 119.9066 0.5378755 87 78.79966 0 0.1 0 0 0 1 
i 4.81457 119.9066 0.5378755 85 79.00092 0 0.1 0 0 0 1 
i 5.059951 119.9066 0.5378755 89 79.40344 0 0.1 0 0 0 1 
i 5.428024 119.9066 0.5378755 91 80.00721 0 0.1 0 0 0 1 
i 8.796445 119.9066 1.075751 99 78.79966 0 0.1 0 0 0 1 
i 8.919136 119.9066 0.5378755 96 79.00092 0 0.1 0 0 0 1 
i 9.164517 119.9066 0.5378755 101 79.40344 0 0.1 0 0 0 1 
i 9.53259 119.9066 0.5378755 103 80.00721 0 0.1 0 0 0 1 
i 1 119.9716 0.5378755 50 70.09191 0 0.1 0 0 0 1 
i 1.368072 119.9716 0.5378755 47 70.69568 0 0.1 0 0 0 1 
i 2.104217 119.9716 0.5378755 59 71.90323 0 0.1 0 0 0 1 
i 5.104566 119.9716 0.5378755 61 70.09191 0 0.1 0 0 0 1 
i 5.472639 119.9716 0.5378755 59 70.69568 0 0.1 0 0 0 1 
i 6.208784 119.9716 0.5378755 71 71.90323 0 0.1 0 0 0 1 
i 6.331474 119.9716 0.5378755 73 72.10449 0 0.1 0 0 0 1 
i 6.353782 120.1428 2.052744 76 78.59036 0 0.1 0 0 0 1 
i 6.967236 120.1428 2.317095 70 79.59665 0 0.1 0 0 0 1 
i 7.457999 120.1428 0.7171673 79 80.40168 0 0.1 0 0 0 1 
i 7.826072 120.1428 1.335576 85 81.00545 0 0.1 0 0 0 1 
i 10.45835 120.1428 0.7171673 87 78.59036 0 0.1 0 0 0 1 
i 11.0718 120.1428 2.052744 81 79.59665 0 0.1 0 0 0 1 
i 11.56257 120.1428 0.7171673 91 80.40168 0 0.1 0 0 0 1 
i 11.93064 120.1428 0.7171673 96 81.00545 0 0.1 0 0 0 1 
i 2.845939 120.3451 0.5378755 43 70.20126 0 0.1 0 0 0 1 
i 3.275357 120.3451 0.5378755 31 70.90566 0 0.1 0 0 0 1 
i 6.950505 120.3451 0.5378755 54 70.20126 0 0.1 0 0 0 1 
i 7.379923 120.3451 0.5378755 42 70.90566 0 0.1 0 0 0 1 
i 4.569188 120.4445 0.5378755 86 78.59841 0 0.1 0 0 0 1 
i 4.93726 120.4445 0.5378755 84 79.20218 0 0.1 0 0 0 1 
i 5.182642 120.4445 0.5378755 88 79.6047 0 0.1 0 0 0 1 
i 5.305333 120.4445 0.5378755 90 79.80595 0 0.1 0 0 0 1 
i 8.673754 120.4445 0.5378755 97 78.59841 0 0.1 0 0 0 1 
i 9.041826 120.4445 0.5378755 95 79.20218 0 0.1 0 0 0 1 
i 9.409899 120.4445 0.5378755 102 79.80595 0 0.1 0 0 0 1 
i 6.476473 120.7612 0.7171673 77 78.79094 0 0.1 0 0 0 1 
i 7.028581 120.7612 0.7171673 69 79.6966 0 0.1 0 0 0 1 
i 7.335308 120.7612 1.434335 80 80.19975 0 0.1 0 0 0 1 
i 7.519345 120.7612 0.7171673 78 80.50164 0 0.1 0 0 0 1 
i 7.948763 120.7612 1.434335 86 81.20604 0 0.1 0 0 0 1 
i 10.51969 120.7612 0.7171673 87 78.69031 0 0.1 0 0 0 1 
i 10.58104 120.7612 0.7171673 88 78.79094 0 0.1 0 0 0 1 
i 10.94911 120.7612 1.434335 82 79.39472 0 0.1 0 0 0 1 
i 11.43987 120.7612 0.7171673 91 80.19975 0 0.1 0 0 0 1 
i 11.62391 120.7612 0.7171673 90 80.50164 0 0.1 0 0 0 1 
i 11.99198 120.7612 1.434335 97 81.10541 0 0.1 0 0 0 1 
i 12.05333 120.7612 1.434335 98 81.20604 0 0.1 0 0 0 1 
i 1.061345 120.83 1.075751 49 70.19187 0 0.1 0 0 0 1 
i 1.122691 120.83 1.075751 50 70.29249 0 0.1 0 0 0 1 
i 1.245382 120.83 0.5378755 48 70.49375 0 0.1 0 0 0 1 
i 1.429418 120.83 1.075751 47 70.79564 0 0.1 0 0 0 1 
i 1.981527 120.83 1.075751 61 71.7013 0 0.1 0 0 0 1 
i 2.165563 120.83 1.075751 60 72.00319 0 0.1 0 0 0 1 
i 2.288254 120.83 1.075751 62 72.20444 0 0.1 0 0 0 1 
i 2.349599 120.83 1.075751 63 72.30507 0 0.1 0 0 0 1 
i 5.165911 120.83 1.075751 61 70.19187 0 0.1 0 0 0 1 
i 5.227257 120.83 1.075751 62 70.29249 0 0.1 0 0 0 1 
i 5.349948 120.83 1.075751 60 70.49375 0 0.1 0 0 0 1 
i 5.533984 120.83 0.5378755 58 70.79564 0 0.1 0 0 0 1 
i 6.086093 120.83 1.075751 72 71.7013 0 0.1 0 0 0 1 
i 6.270129 120.83 0.5378755 71 72.00319 0 0.1 0 0 0 1 
i 6.39282 120.83 1.135392 73 72.20444 0 0.1 0 0 0 1 
i 6.454165 120.83 1.075751 74 72.30507 0 0.1 0 0 0 1 
i 2.784594 120.883 0.5378755 41 70.10063 0 0.1 0 0 0 1 
i 3.336703 120.883 0.5378755 30 71.00629 0 0.1 0 0 0 1 
i 6.88916 120.883 0.5378755 53 70.10063 0 0.1 0 0 0 1 
i 7.441269 120.883 0.5378755 41 71.00629 0 0.1 0 0 0 1 
i 10.51969 120.8897 0.5378755 84 78.70776 0 0.1 0 0 0 1 
i 4.630533 121.2422 1.075751 86 78.69836 0 0.1 0 0 0 1 
i 4.691879 121.2422 0.5378755 87 78.79899 0 0.1 0 0 0 1 
i 4.81457 121.2422 1.075751 85 79.00025 0 0.1 0 0 0 1 
i 4.998606 121.2422 1.075751 84 79.30214 0 0.1 0 0 0 1 
i 5.059951 121.2422 1.075751 89 79.40277 0 0.1 0 0 0 1 
i 5.243987 121.2422 1.075751 88 79.70465 0 0.1 0 0 0 1 
i 5.366678 121.2422 1.075751 90 79.90591 0 0.1 0 0 0 1 
i 5.428024 121.2422 1.075751 91 80.00654 0 0.1 0 0 0 1 
i 8.735099 121.2422 1.075751 97 78.69836 0 0.1 0 0 0 1 
i 8.796445 121.2422 1.075751 99 78.79899 0 0.1 0 0 0 1 
i 8.919136 121.2422 1.075751 96 79.00025 0 0.1 0 0 0 1 
i 9.103172 121.2422 0.5378755 95 79.30214 0 0.1 0 0 0 1 
i 9.164517 121.2422 1.075751 101 79.40277 0 0.1 0 0 0 1 
i 9.348554 121.2422 1.075751 100 79.70465 0 0.1 0 0 0 1 
i 9.471244 121.2422 1.075751 102 79.90591 0 0.1 0 0 0 1 
i 9.53259 121.2422 1.075751 103 80.00654 0 0.1 0 0 0 1 
i 1.184036 121.3679 0.5378755 51 70.39312 0 0.1 0 0 0 1 
i 5.472639 121.3679 0.5378755 59 70.69501 0 0.1 0 0 0 1 
i 6.515511 121.3679 0.5378755 75 72.4057 0 0.1 0 0 0 1 
i 10.45835 121.4276 0.5378755 85 78.60713 0 0.1 0 0 0 1 
i 6.537818 121.4784 0.7171673 78 78.89157 0 0.1 0 0 0 1 
i 6.905891 121.4784 0.7171673 71 79.49535 0 0.1 0 0 0 1 
i 7.457999 121.4784 0.7171673 79 80.40101 0 0.1 0 0 0 1 
i 8.010108 121.4784 0.7171673 87 81.30667 0 0.1 0 0 0 1 
i 10.45835 121.4784 0.7171673 88 78.58969 0 0.1 0 0 0 1 
i 10.64238 121.4784 0.7171673 89 78.89157 0 0.1 0 0 0 1 
i 11.50122 121.4784 0.7171673 92 80.30038 0 0.1 0 0 0 1 
i 11.56257 121.4784 0.7171673 91 80.40101 0 0.1 0 0 0 1 
i 5.489369 121.7801 0.5378755 92 80.10717 0 0.1 0 0 0 1 
i 8.673754 121.7801 0.5378755 98 78.59774 0 0.1 0 0 0 1 
i 2.907285 121.9221 0.5378755 50 70.30122 0 0.1 0 0 0 1 
i 3.275357 121.9221 0.5378755 58 70.90499 0 0.1 0 0 0 1 
i 7.011851 121.9221 0.5378755 61 70.30122 0 0.1 0 0 0 1 
i 6.599163 122.2988 0.7171673 77 78.99153 0 0.1 0 0 0 1 
i 6.844545 122.2988 0.7171673 72 79.39405 0 0.1 0 0 0 1 
i 7.335308 122.2988 0.7171673 82 80.19908 0 0.1 0 0 0 1 
i 8.071453 122.2988 0.7171673 86 81.40662 0 0.1 0 0 0 1 
i 10.70373 122.2988 0.7171673 88 78.99153 0 0.1 0 0 0 1 
i 10.94911 122.2988 0.7171673 84 79.39405 0 0.1 0 0 0 1 
i 11.43987 122.2988 0.7171673 93 80.19908 0 0.1 0 0 0 1 
i 12.17602 122.2988 0.7171673 98 81.40662 0 0.1 0 0 0 1 
i 2.784594 122.4599 0.5378755 52 70.09996 0 0.1 0 0 0 1 
i 3.398048 122.4599 0.5378755 60 71.10625 0 0.1 0 0 0 1 
i 6.88916 122.4599 0.5378755 63 70.09996 0 0.1 0 0 0 1 
i 7.502614 122.4599 0.5378755 72 71.10625 0 0.1 0 0 0 1 
i 6.476473 122.4735 1.075751 75 78.80771 0 0.1 0 0 0 1 
i 10.58104 122.4735 0.5378755 86 78.80771 0 0.1 0 0 0 1 
i 1.490763 122.7736 0.5378755 49 70.8956 0 0.1 0 0 0 1 
i 1.981527 122.7736 0.5378755 57 71.70063 0 0.1 0 0 0 1 
i 5.595329 122.7736 0.5378755 60 70.8956 0 0.1 0 0 0 1 
i 6.086093 122.7736 0.5378755 69 71.70063 0 0.1 0 0 0 1 
i 10.45835 123.0114 0.5378755 87 78.60646 0 0.1 0 0 0 1 
i 6.353782 123.016 2.703728 74 78.58901 0 0.1 0 0 0 1 
i 7.089927 123.016 0.7171673 70 79.79656 0 0.1 0 0 0 1 
i 7.58069 123.016 0.7171673 79 80.60159 0 0.1 0 0 0 1 
i 7.826072 123.016 0.7171673 84 81.00411 0 0.1 0 0 0 1 
i 10.45835 123.016 0.7171673 86 78.58901 0 0.1 0 0 0 1 
i 11.19449 123.016 2.703728 81 79.79656 0 0.1 0 0 0 1 
i 11.68526 123.016 0.7171673 91 80.60159 0 0.1 0 0 0 1 
i 11.93064 123.016 2.703728 95 81.00411 0 0.1 0 0 0 1 
i 1 123.3115 0.5378755 53 70.09057 0 0.1 0 0 0 1 
i 2.47229 123.3115 0.5378755 61 72.50566 0 0.1 0 0 0 1 
i 5.104566 123.3115 0.5378755 64 70.09057 0 0.1 0 0 0 1 
i 6.576856 123.3115 0.5378755 73 72.50566 0 0.1 0 0 0 1 
i 2.845939 123.3882 1.075751 48 70.19992 0 0.1 0 0 0 1 
i 3.275357 123.3882 1.075751 50 70.90432 0 0.1 0 0 0 1 
i 6.950505 123.3882 0.5378755 60 70.19992 0 0.1 0 0 0 1 
i 7.011851 123.3882 1.075751 59 70.30055 0 0.1 0 0 0 1 
i 7.379923 123.3882 0.5378755 62 70.90432 0 0.1 0 0 0 1 
i 7.56396 123.3882 1.075751 62 71.20621 0 0.1 0 0 0 1 
i 6.599163 123.6344 0.7171673 77 78.99086 0 0.1 0 0 0 1 
i 6.844545 123.6344 0.7171673 72 79.39338 0 0.1 0 0 0 1 
i 7.151272 123.6344 0.7171673 69 79.89652 0 0.1 0 0 0 1 
i 7.335308 123.6344 1.434335 82 80.19841 0 0.1 0 0 0 1 
i 7.642036 123.6344 0.7171673 78 80.70155 0 0.1 0 0 0 1 
i 7.887417 123.6344 0.7171673 83 81.10407 0 0.1 0 0 0 1 
i 8.071453 123.6344 0.7171673 86 81.40595 0 0.1 0 0 0 1 
i 10.51969 123.6344 0.7171673 85 78.68897 0 0.1 0 0 0 1 
i 10.70373 123.6344 0.7171673 88 78.99086 0 0.1 0 0 0 1 
i 10.94911 123.6344 1.434335 84 79.39338 0 0.1 0 0 0 1 
i 11.43987 123.6344 0.8494806 93 80.19841 0 0.1 0 0 0 1 
i 11.7466 123.6344 0.7171673 90 80.70155 0 0.1 0 0 0 1 
i 12.17602 123.6344 1.434335 98 81.40595 0 0.1 0 0 0 1 
i 5.550715 123.7405 0.5378755 87 80.20713 0 0.1 0 0 0 1 
i 9.655281 123.7405 0.5378755 99 80.20713 0 0.1 0 0 0 1 
i 7.441269 123.926 0.5378755 61 71.00495 0 0.1 0 0 0 1 
i 6.415127 123.946 0.5378755 81 78.70642 0 0.1 0 0 0 1 
i 6.476473 123.946 0.5378755 83 78.80704 0 0.1 0 0 0 1 
i 10.58104 123.946 0.5378755 95 78.80704 0 0.1 0 0 0 1 
i 1.061345 124.2397 0.5378755 54 70.19052 0 0.1 0 0 0 1 
i 1.490763 124.2397 0.5378755 48 70.89493 0 0.1 0 0 0 1 
i 1.981527 124.2397 0.5378755 57 71.69996 0 0.1 0 0 0 1 
i 2.533635 124.2397 0.5378755 62 72.60562 0 0.1 0 0 0 1 
i 5.165911 124.2397 1.075751 65 70.19052 0 0.1 0 0 0 1 
i 5.595329 124.2397 0.5378755 60 70.89493 0 0.1 0 0 0 1 
i 6.086093 124.2397 1.075751 68 71.69996 0 0.1 0 0 0 1 
i 6.638201 124.2397 0.5378755 74 72.60562 0 0.1 0 0 0 1 
i 4.569188 124.2784 0.5378755 80 78.59706 0 0.1 0 0 0 1 
i 8.673754 124.2784 0.5378755 91 78.59706 0 0.1 0 0 0 1 
i 6.660509 124.3515 0.7171673 78 79.09149 0 0.1 0 0 0 1 
i 6.905891 124.3515 0.9639273 73 79.494 0 0.1 0 0 0 1 
i 7.089927 124.3515 0.7171673 70 79.79589 0 0.1 0 0 0 1 
i 7.58069 124.3515 0.7171673 79 80.60092 0 0.1 0 0 0 1 
i 7.826072 124.3515 0.7171673 84 81.00344 0 0.1 0 0 0 1 
i 8.132799 124.3515 0.7171673 87 81.50658 0 0.1 0 0 0 1 
i 10.45835 124.3515 0.7171673 86 78.58834 0 0.1 0 0 0 1 
i 10.76507 124.3515 0.7171673 89 79.09149 0 0.1 0 0 0 1 
i 11.50122 124.3515 0.7171673 94 80.29904 0 0.1 0 0 0 1 
i 11.68526 124.3515 0.7171673 91 80.60092 0 0.1 0 0 0 1 
i 6.353782 124.4838 0.5378755 82 78.60579 0 0.1 0 0 0 1 
i 6.537818 124.4838 0.5378755 84 78.90767 0 0.1 0 0 0 1 
i 10.45835 124.4838 0.5378755 94 78.60579 0 0.1 0 0 0 1 
i 10.64238 124.4838 0.5378755 96 78.90767 0 0.1 0 0 0 1 
i 1 124.7776 0.5378755 53 70.0899 0 0.1 0 0 0 1 
i 1.552109 124.7776 0.5378755 48 70.99556 0 0.1 0 0 0 1 
i 2.042872 124.7776 0.5378755 56 71.80059 0 0.1 0 0 0 1 
i 2.47229 124.7776 0.5378755 62 72.50499 0 0.1 0 0 0 1 
i 5.656675 124.7776 0.5378755 59 70.99556 0 0.1 0 0 0 1 
i 6.599163 125.0025 0.7171673 76 78.99019 0 0.1 0 0 0 1 
i 6.844545 125.0025 0.7171673 71 79.3927 0 0.1 0 0 0 1 
i 7.212618 125.0025 0.7171673 69 79.99648 0 0.1 0 0 0 1 
i 7.335308 125.0025 0.7171673 81 80.19774 0 0.1 0 0 0 1 
i 7.703381 125.0025 0.7171673 78 80.80151 0 0.1 0 0 0 1 
i 7.948763 125.0025 0.7171673 83 81.20403 0 0.1 0 0 0 1 
i 8.071453 125.0025 0.7171673 86 81.40528 0 0.1 0 0 0 1 
i 10.58104 125.0025 0.7171673 85 78.78893 0 0.1 0 0 0 1 
i 10.70373 125.0025 0.7171673 88 78.99019 0 0.1 0 0 0 1 
i 10.94911 125.0025 0.7171673 83 79.3927 0 0.1 0 0 0 1 
i 11.43987 125.0025 0.7171673 92 80.19774 0 0.1 0 0 0 1 
i 11.80795 125.0025 0.7171673 90 80.80151 0 0.1 0 0 0 1 
i 12.17602 125.0025 0.7171673 97 81.40528 0 0.1 0 0 0 1 
i 3.029976 125.076 0.5378755 43 70.50113 0 0.1 0 0 0 1 
i 3.275357 125.076 0.5378755 36 70.90365 0 0.1 0 0 0 1 
i 7.134542 125.076 0.5378755 54 70.50113 0 0.1 0 0 0 1 
i 7.379923 125.076 0.5378755 48 70.90365 0 0.1 0 0 0 1 
i 4.630533 125.213 1.075751 79 78.69702 0 0.1 0 0 0 1 
i 5.550715 125.213 0.5378755 88 80.20646 0 0.1 0 0 0 1 
i 8.735099 125.213 0.5378755 90 78.69702 0 0.1 0 0 0 1 
i 9.655281 125.213 1.075751 100 80.20646 0 0.1 0 0 0 1 
i 2.784594 125.6138 0.5378755 39 70.09862 0 0.1 0 0 0 1 
i 3.520739 125.6138 0.5378755 33 71.30616 0 0.1 0 0 0 1 
i 6.88916 125.6138 0.5378755 51 70.09862 0 0.1 0 0 0 1 
i 7.625305 125.6138 0.5378755 44 71.30616 0 0.1 0 0 0 1 
i 6.599163 125.6411 0.5378755 64 79.00763 0 0.1 0 0 0 1 
i 10.70373 125.6411 0.5378755 76 79.00763 0 0.1 0 0 0 1 
i 6.353782 125.7197 1.989145 75 78.58767 0 0.1 0 0 0 1 
i 6.721854 125.7197 1.271978 78 79.19145 0 0.1 0 0 0 1 
i 6.967236 125.7197 1.097633 73 79.59396 0 0.1 0 0 0 1 
i 7.089927 125.7197 0.7171673 70 79.79522 0 0.1 0 0 0 1 
i 7.457999 125.7197 0.7171673 82 80.39899 0 0.1 0 0 0 1 
i 7.58069 125.7197 1.271978 80 80.60025 0 0.1 0 0 0 1 
i 7.826072 125.7197 1.989145 85 81.00277 0 0.1 0 0 0 1 
i 8.194144 125.7197 1.989145 87 81.60654 0 0.1 0 0 0 1 
i 10.45835 125.7197 0.7171673 87 78.58767 0 0.1 0 0 0 1 
i 10.82642 125.7197 1.989145 89 79.19145 0 0.1 0 0 0 1 
i 11.0718 125.7197 1.989145 84 79.59396 0 0.1 0 0 0 1 
i 11.19449 125.7197 1.989145 82 79.79522 0 0.1 0 0 0 1 
i 11.56257 125.7197 1.989145 94 80.39899 0 0.1 0 0 0 1 
i 11.68526 125.7197 0.7171673 91 80.60025 0 0.1 0 0 0 1 
i 11.93064 125.7197 1.989145 96 81.00277 0 0.1 0 0 0 1 
i 12.29871 125.7197 0.7171673 98 81.60654 0 0.1 0 0 0 1 
i 1.122691 125.7416 0.5378755 54 70.29048 0 0.1 0 0 0 1 
i 1.490763 125.7416 0.5378755 49 70.89426 0 0.1 0 0 0 1 
i 1.981527 125.7416 0.5378755 57 71.69929 0 0.1 0 0 0 1 
i 2.594981 125.7416 0.5378755 63 72.70558 0 0.1 0 0 0 1 
i 5.227257 125.7416 0.5378755 66 70.29048 0 0.1 0 0 0 1 
i 5.595329 125.7416 0.5378755 60 70.89426 0 0.1 0 0 0 1 
i 6.086093 125.7416 0.9752949 69 71.69929 0 0.1 0 0 0 1 
i 6.699547 125.7416 0.5378755 74 72.70558 0 0.1 0 0 0 1 
i 5.61206 125.7509 0.5378755 89 80.30709 0 0.1 0 0 0 1 
i 8.673754 125.7509 0.5378755 91 78.59639 0 0.1 0 0 0 1 
i 10.45835 126.179 0.5378755 81 78.60512 0 0.1 0 0 0 1 
i 6.476473 126.2745 0.7171673 74 78.78826 0 0.1 0 0 0 1 
i 6.599163 126.2745 1.434335 77 78.98952 0 0.1 0 0 0 1 
i 6.844545 126.2745 1.434335 72 79.39203 0 0.1 0 0 0 1 
i 7.151272 126.2745 1.434335 71 79.89518 0 0.1 0 0 0 1 
i 7.212618 126.2745 1.434335 69 79.99581 0 0.1 0 0 0 1 
i 7.335308 126.2745 1.434335 81 80.19706 0 0.1 0 0 0 1 
i 7.519345 126.2745 0.7171673 82 80.49895 0 0.1 0 0 0 1 
i 7.703381 126.2745 1.434335 79 80.80084 0 0.1 0 0 0 1 
i 7.948763 126.2745 1.434335 84 81.20335 0 0.1 0 0 0 1 
i 8.071453 126.2745 0.7171673 86 81.40461 0 0.1 0 0 0 1 
i 10.51969 126.2745 1.434335 87 78.68763 0 0.1 0 0 0 1 
i 10.58104 126.2745 0.7171673 86 78.78826 0 0.1 0 0 0 1 
i 10.70373 126.2745 0.7171673 88 78.98952 0 0.1 0 0 0 1 
i 10.94911 126.2745 1.434335 83 79.39203 0 0.1 0 0 0 1 
i 11.31718 126.2745 0.7171673 81 79.99581 0 0.1 0 0 0 1 
i 11.43987 126.2745 0.7171673 93 80.19706 0 0.1 0 0 0 1 
i 11.7466 126.2745 1.434335 92 80.70021 0 0.1 0 0 0 1 
i 11.80795 126.2745 1.434335 90 80.80084 0 0.1 0 0 0 1 
i 12.05333 126.2745 0.7171673 95 81.20335 0 0.1 0 0 0 1 
i 12.17602 126.2745 1.434335 97 81.40461 0 0.1 0 0 0 1 
i 12.36006 126.2745 0.7171673 99 81.7065 0 0.1 0 0 0 1 
i 1 126.2794 0.5378755 53 70.08922 0 0.1 0 0 0 1 
i 1.613454 126.2794 0.5378755 47 71.09551 0 0.1 0 0 0 1 
i 2.104217 126.2794 0.5378755 56 71.90055 0 0.1 0 0 0 1 
i 2.47229 126.2794 0.5378755 61 72.50432 0 0.1 0 0 0 1 
i 5.104566 126.2794 0.5378755 64 70.08922 0 0.1 0 0 0 1 
i 5.71802 126.2794 0.5378755 59 71.09551 0 0.1 0 0 0 1 
i 6.208784 126.2794 0.5378755 68 71.90055 0 0.1 0 0 0 1 
i 2.845939 126.5421 0.5378755 60 70.19857 0 0.1 0 0 0 1 
i 3.029976 126.5421 0.5378755 54 70.50046 0 0.1 0 0 0 1 
i 3.275357 126.5421 0.5378755 63 70.90298 0 0.1 0 0 0 1 
i 3.582084 126.5421 0.5378755 69 71.40612 0 0.1 0 0 0 1 
i 7.134542 126.5421 0.5378755 65 70.50046 0 0.1 0 0 0 1 
i 7.379923 126.5421 1.671546 74 70.90298 0 0.1 0 0 0 1 
i 7.68665 126.5421 0.5378755 81 71.40612 0 0.1 0 0 0 1 
i 4.691879 126.7214 0.5378755 78 78.79698 0 0.1 0 0 0 1 
i 5.550715 126.7214 0.5378755 88 80.20579 0 0.1 0 0 0 1 
i 8.796445 126.7214 0.5378755 89 78.79698 0 0.1 0 0 0 1 
i 9.655281 126.7214 0.5378755 100 80.20579 0 0.1 0 0 0 1 
i 6.660509 126.9917 0.7171673 76 79.09015 0 0.1 0 0 0 1 
i 7.089927 126.9917 0.6261453 70 79.79455 0 0.1 0 0 0 1 
i 7.457999 126.9917 0.7171673 82 80.39832 0 0.1 0 0 0 1 
i 7.764726 126.9917 0.7171673 78 80.90147 0 0.1 0 0 0 1 
i 8.010108 126.9917 0.7171673 83 81.30398 0 0.1 0 0 0 1 
i 10.45835 126.9917 0.7171673 86 78.587 0 0.1 0 0 0 1 
i 10.64238 126.9917 0.7171673 85 78.88889 0 0.1 0 0 0 1 
i 11.37853 126.9917 0.7171673 80 80.09644 0 0.1 0 0 0 1 
i 11.56257 126.9917 0.7171673 93 80.39832 0 0.1 0 0 0 1 
i 11.68526 126.9917 0.7171673 91 80.59958 0 0.1 0 0 0 1 
i 12.29871 126.9917 0.7171673 98 81.60587 0 0.1 0 0 0 1 
i 2.784594 127.0799 0.5378755 59 70.09795 0 0.1 0 0 0 1 
i 3.091321 127.0799 0.5378755 52 70.60109 0 0.1 0 0 0 1 
i 3.336703 127.0799 0.5957946 62 71.00361 0 0.1 0 0 0 1 
i 3.520739 127.0799 0.5378755 68 71.30549 0 0.1 0 0 0 1 
i 7.195887 127.0799 0.5378755 64 70.60109 0 0.1 0 0 0 1 
i 7.441269 127.0799 0.5957946 73 71.00361 0 0.1 0 0 0 1 
i 7.625305 127.0799 0.5378755 80 71.30549 0 0.1 0 0 0 1 
i 6.415127 127.1136 0.5378755 81 78.70507 0 0.1 0 0 0 1 
i 6.599163 127.1136 0.5378755 86 79.00696 0 0.1 0 0 0 1 
i 10.51969 127.1136 0.5378755 92 78.70507 0 0.1 0 0 0 1 
i 10.70373 127.1136 0.5378755 98 79.00696 0 0.1 0 0 0 1 
i 1.061345 127.1378 0.5378755 53 70.18918 0 0.1 0 0 0 1 
i 1.122691 127.1378 1.075751 54 70.28981 0 0.1 0 0 0 1 
i 1.490763 127.1378 0.5378755 48 70.89358 0 0.1 0 0 0 1 
i 1.6748 127.1378 0.5378755 47 71.19547 0 0.1 0 0 0 1 
i 1.981527 127.1378 1.075751 57 71.69862 0 0.1 0 0 0 1 
i 2.165563 127.1378 1.075751 56 72.0005 0 0.1 0 0 0 1 
i 2.594981 127.1378 1.075751 63 72.70491 0 0.1 0 0 0 1 
i 5.165911 127.1378 1.075751 65 70.18918 0 0.1 0 0 0 1 
i 5.227257 127.1378 1.075751 66 70.28981 0 0.1 0 0 0 1 
i 5.595329 127.1378 1.075751 60 70.89358 0 0.1 0 0 0 1 
i 5.779366 127.1378 0.5378755 58 71.19547 0 0.1 0 0 0 1 
i 6.086093 127.1378 1.075751 68 71.69862 0 0.1 0 0 0 1 
i 6.270129 127.1378 0.5378755 67 72.0005 0 0.1 0 0 0 1 
i 4.569188 127.2593 0.5378755 79 78.59572 0 0.1 0 0 0 1 
i 5.673405 127.2593 0.5378755 89 80.40704 0 0.1 0 0 0 1 
i 8.673754 127.2593 0.5378755 91 78.59572 0 0.1 0 0 0 1 
i 9.777971 127.2593 0.5378755 101 80.40704 0 0.1 0 0 0 1 
i 6.353782 127.6515 0.5378755 82 78.60444 0 0.1 0 0 0 1 
i 6.660509 127.6515 0.5378755 87 79.10759 0 0.1 0 0 0 1 
i 10.45835 127.6515 0.5378755 93 78.60444 0 0.1 0 0 0 1 
i 10.76507 127.6515 0.5378755 99 79.10759 0 0.1 0 0 0 1 
i 1.184036 127.6757 0.5378755 55 70.39044 0 0.1 0 0 0 1 
i 1.552109 127.6757 0.5378755 49 70.99421 0 0.1 0 0 0 1 
i 1.613454 127.6757 0.5378755 48 71.09484 0 0.1 0 0 0 1 
i 2.47229 127.6757 0.5378755 62 72.50365 0 0.1 0 0 0 1 
i 5.71802 127.6757 0.5378755 59 71.09484 0 0.1 0 0 0 1 
i 6.147438 127.6757 0.5378755 69 71.79925 0 0.1 0 0 0 1 
i 6.760892 127.6757 0.5378755 75 72.80553 0 0.1 0 0 0 1 
i 2.907285 128.0439 0.5378755 39 70.29853 0 0.1 0 0 0 1 
i 3.029976 128.0439 0.5378755 42 70.49979 0 0.1 0 0 0 1 
i 3.275357 128.0439 0.5378755 37 70.90231 0 0.1 0 0 0 1 
i 3.64343 128.0439 0.5378755 34 71.50608 0 0.1 0 0 0 1 
i 7.011851 128.0439 0.5378755 51 70.29853 0 0.1 0 0 0 1 
i 7.134542 128.0439 0.5378755 53 70.49979 0 0.1 0 0 0 1 
i 7.379923 128.0439 0.5378755 48 70.90231 0 0.1 0 0 0 1 
i 7.747996 128.0439 0.5378755 46 71.50608 0 0.1 0 0 0 1 
i 4.630533 128.1238 0.5378755 79 78.69568 0 0.1 0 0 0 1 
i 4.691879 128.1238 1.075751 78 78.79631 0 0.1 0 0 0 1 
i 5.550715 128.1238 1.075751 89 80.20512 0 0.1 0 0 0 1 
i 5.734751 128.1238 1.075751 90 80.507 0 0.1 0 0 0 1 
i 8.735099 128.1238 1.075751 90 78.69568 0 0.1 0 0 0 1 
i 8.796445 128.1238 1.075751 89 78.79631 0 0.1 0 0 0 1 
i 9.655281 128.1238 1.075751 101 80.20512 0 0.1 0 0 0 1 
i 9.839317 128.1238 0.5378755 102 80.507 0 0.1 0 0 0 1 
i 2.784594 128.5818 0.5378755 41 70.09727 0 0.1 0 0 0 1 
i 3.152666 128.5818 0.5378755 44 70.70105 0 0.1 0 0 0 1 
i 3.398048 128.5818 0.5378755 38 71.10356 0 0.1 0 0 0 1 
i 3.520739 128.5818 0.5378755 36 71.30482 0 0.1 0 0 0 1 
i 6.88916 128.5818 0.5378755 52 70.09727 0 0.1 0 0 0 1 
i 7.257232 128.5818 0.5378755 55 70.70105 0 0.1 0 0 0 1 
i 7.502614 128.5818 0.5378755 50 71.10356 0 0.1 0 0 0 1 
i 7.625305 128.5818 0.5378755 47 71.30482 0 0.1 0 0 0 1 
i 6.476473 128.622 0.5378755 74 78.80503 0 0.1 0 0 0 1 
i 6.599163 128.622 1.075751 73 79.00629 0 0.1 0 0 0 1 
i 10.58104 128.622 0.5378755 85 78.80503 0 0.1 0 0 0 1 
i 4.753224 128.6616 0.5378755 77 78.89694 0 0.1 0 0 0 1 
i 9.716626 128.6616 0.5378755 100 80.30574 0 0.1 0 0 0 1 
i 1.245382 128.7453 0.5378755 54 70.4904 0 0.1 0 0 0 1 
i 1.490763 128.7453 0.5378755 50 70.89291 0 0.1 0 0 0 1 
i 1.981527 128.7453 0.5378755 58 71.69795 0 0.1 0 0 0 1 
i 2.717672 128.7453 0.5378755 63 72.90549 0 0.1 0 0 0 1 
i 5.349948 128.7453 0.5378755 66 70.4904 0 0.1 0 0 0 1 
i 5.595329 128.7453 0.5378755 61 70.89291 0 0.1 0 0 0 1 
i 6.086093 128.7453 0.5378755 70 71.69795 0 0.1 0 0 0 1 
i 6.822238 128.7453 0.5378755 74 72.90549 0 0.1 0 0 0 1 
i 6.353782 129.1598 0.5378755 73 78.60377 0 0.1 0 0 0 1 
i 10.45835 129.1598 0.5378755 85 78.60377 0 0.1 0 0 0 1 
i 10.82642 129.1598 0.5378755 84 79.20755 0 0.1 0 0 0 1 
i 1 129.2832 0.5378755 52 70.08788 0 0.1 0 0 0 1 
i 1.736145 129.2832 0.5378755 48 71.29543 0 0.1 0 0 0 1 
i 2.226908 129.2832 0.5378755 56 72.10046 0 0.1 0 0 0 1 
i 2.47229 129.2832 0.5378755 60 72.50298 0 0.1 0 0 0 1 
i 5.104566 129.2832 0.5378755 63 70.08788 0 0.1 0 0 0 1 
i 5.840711 129.2832 0.5378755 59 71.29543 0 0.1 0 0 0 1 
i 6.331474 129.2832 0.5378755 68 72.10046 0 0.1 0 0 0 1 
i 6.576856 129.2832 0.5378755 72 72.50298 0 0.1 0 0 0 1 
i 2.845939 129.4402 1.075751 42 70.19723 0 0.1 0 0 0 1 
i 2.907285 129.4402 0.5378755 41 70.29786 0 0.1 0 0 0 1 
i 3.029976 129.4402 1.075751 43 70.49912 0 0.1 0 0 0 1 
i 3.214012 129.4402 1.075751 44 70.80101 0 0.1 0 0 0 1 
i 3.275357 129.4402 1.075751 39 70.90164 0 0.1 0 0 0 1 
i 3.459394 129.4402 1.075751 40 71.20352 0 0.1 0 0 0 1 
i 3.582084 129.4402 0.5378755 38 71.40478 0 0.1 0 0 0 1 
i 3.64343 129.4402 1.075751 37 71.50541 0 0.1 0 0 0 1 
i 6.950505 129.4402 1.075751 54 70.19723 0 0.1 0 0 0 1 
i 7.011851 129.4402 1.075751 52 70.29786 0 0.1 0 0 0 1 
i 7.134542 129.4402 1.075751 55 70.49912 0 0.1 0 0 0 1 
i 7.318578 129.4402 0.5378755 56 70.80101 0 0.1 0 0 0 1 
i 7.379923 129.4402 1.075751 50 70.90164 0 0.1 0 0 0 1 
i 7.56396 129.4402 1.075751 51 71.20352 0 0.1 0 0 0 1 
i 7.68665 129.4402 1.075751 49 71.40478 0 0.1 0 0 0 1 
i 7.747996 129.4402 1.075751 48 71.50541 0 0.1 0 0 0 1 
i 4.81457 129.7382 0.5378755 77 78.9969 0 0.1 0 0 0 1 
i 5.550715 129.7382 0.5378755 88 80.20444 0 0.1 0 0 0 1 
i 8.919136 129.7382 0.5378755 89 78.9969 0 0.1 0 0 0 1 
i 9.655281 129.7382 0.5378755 99 80.20444 0 0.1 0 0 0 1 
i 3.336703 129.9781 0.5378755 38 71.00226 0 0.1 0 0 0 1 
i 3.704775 129.9781 0.5378755 36 71.60604 0 0.1 0 0 0 1 
i 6.88916 129.9781 0.5378755 53 70.0966 0 0.1 0 0 0 1 
i 6.415127 130.0243 0.655115 67 78.70373 0 0.1 0 0 0 1 
i 6.476473 130.0243 1.192991 68 78.80436 0 0.1 0 0 0 1 
i 6.599163 130.0243 0.5378755 65 79.00562 0 0.1 0 0 0 1 
i 6.7832 130.0243 1.075751 64 79.30751 0 0.1 0 0 0 1 
i 10.51969 130.0243 0.5378755 78 78.70373 0 0.1 0 0 0 1 
i 10.58104 130.0243 0.5378755 80 78.80436 0 0.1 0 0 0 1 
i 10.70373 130.0243 1.075751 77 79.00562 0 0.1 0 0 0 1 
i 10.88777 130.0243 0.5378755 75 79.30751 0 0.1 0 0 0 1 
i 1.061345 130.1416 0.5378755 51 70.18784 0 0.1 0 0 0 1 
i 1.245382 130.1416 0.5378755 54 70.48973 0 0.1 0 0 0 1 
i 1.490763 130.1416 0.5378755 50 70.89224 0 0.1 0 0 0 1 
i 1.79749 130.1416 0.5378755 47 71.39539 0 0.1 0 0 0 1 
i 1.981527 130.1416 0.5378755 58 71.69727 0 0.1 0 0 0 1 
i 2.288254 130.1416 1.075751 56 72.20042 0 0.1 0 0 0 1 
i 2.533635 130.1416 0.5378755 60 72.60294 0 0.1 0 0 0 1 
i 2.717672 130.1416 1.075751 63 72.90482 0 0.1 0 0 0 1 
i 5.165911 130.1416 1.075751 63 70.18784 0 0.1 0 0 0 1 
i 5.349948 130.1416 1.075751 66 70.48973 0 0.1 0 0 0 1 
i 5.595329 130.1416 0.5378755 61 70.89224 0 0.1 0 0 0 1 
i 5.902056 130.1416 0.5378755 58 71.39539 0 0.1 0 0 0 1 
i 6.086093 130.1416 1.075751 70 71.69727 0 0.1 0 0 0 1 
i 6.638201 130.1416 0.5378755 71 72.60294 0 0.1 0 0 0 1 
i 6.822238 130.1416 0.5378755 74 72.90482 0 0.1 0 0 0 1 
i 4.569188 130.2761 0.5378755 80 78.59438 0 0.1 0 0 0 1 
i 5.796096 130.2761 0.5378755 90 80.60696 0 0.1 0 0 0 1 
i 8.673754 130.2761 0.5378755 91 78.59438 0 0.1 0 0 0 1 
i 9.900662 130.2761 0.5378755 102 80.60696 0 0.1 0 0 0 1 
i 6.537818 130.5622 0.5378755 69 78.90499 0 0.1 0 0 0 1 
i 6.660509 130.5622 0.5378755 66 79.10625 0 0.1 0 0 0 1 
i 10.45835 130.5622 0.5378755 79 78.6031 0 0.1 0 0 0 1 
i 10.64238 130.5622 0.5378755 81 78.90499 0 0.1 0 0 0 1 
i 10.82642 130.5622 0.5378755 76 79.20688 0 0.1 0 0 0 1 
i 1 130.6794 0.5378755 52 70.08721 0 0.1 0 0 0 1 
i 1.306727 130.6794 0.5378755 55 70.59036 0 0.1 0 0 0 1 
i 1.552109 130.6794 0.5378755 50 70.99287 0 0.1 0 0 0 1 
i 1.736145 130.6794 0.5378755 48 71.29476 0 0.1 0 0 0 1 
i 2.042872 130.6794 0.5378755 59 71.7979 0 0.1 0 0 0 1 
i 2.47229 130.6794 0.5378755 60 72.50231 0 0.1 0 0 0 1 
i 5.656675 130.6794 0.5378755 62 70.99287 0 0.1 0 0 0 1 
i 5.840711 130.6794 0.5378755 59 71.29476 0 0.1 0 0 0 1 
i 6.576856 130.6794 0.5378755 72 72.50231 0 0.1 0 0 0 1 
i 6.883583 130.6794 0.5378755 75 73.00545 0 0.1 0 0 0 1 
i 4.630533 131.1405 0.5378755 80 78.69434 0 0.1 0 0 0 1 
i 4.81457 131.1405 0.5378755 77 78.99623 0 0.1 0 0 0 1 
i 5.550715 131.1405 1.075751 88 80.20377 0 0.1 0 0 0 1 
i 5.857442 131.1405 0.5378755 91 80.70692 0 0.1 0 0 0 1 
i 8.735099 131.1405 1.075751 91 78.69434 0 0.1 0 0 0 1 
i 8.919136 131.1405 1.075751 88 78.99623 0 0.1 0 0 0 1 
i 9.655281 131.1405 0.5378755 100 80.20377 0 0.1 0 0 0 1 
i 9.962008 131.1405 1.075751 102 80.70692 0 0.1 0 0 0 1 
i 1.122691 131.5719 0.5378755 51 70.2878 0 0.1 0 0 0 1 
i 1.245382 131.5719 1.075751 53 70.48906 0 0.1 0 0 0 1 
i 1.490763 131.5719 0.5378755 49 70.89157 0 0.1 0 0 0 1 
i 1.858836 131.5719 0.5378755 47 71.49535 0 0.1 0 0 0 1 
i 1.981527 131.5719 0.5378755 58 71.6966 0 0.1 0 0 0 1 
i 2.349599 131.5719 0.5378755 56 72.30038 0 0.1 0 0 0 1 
i 2.594981 131.5719 0.5378755 60 72.70289 0 0.1 0 0 0 1 
i 2.717672 131.5719 0.5378755 62 72.90415 0 0.1 0 0 0 1 
i 5.227257 131.5719 0.5378755 63 70.2878 0 0.1 0 0 0 1 
i 5.349948 131.5719 0.5378755 65 70.48906 0 0.1 0 0 0 1 
i 5.595329 131.5719 0.5378755 61 70.89157 0 0.1 0 0 0 1 
i 5.963402 131.5719 0.5378755 58 71.49535 0 0.1 0 0 0 1 
i 6.086093 131.5719 0.5378755 69 71.6966 0 0.1 0 0 0 1 
i 6.454165 131.5719 0.5378755 67 72.30038 0 0.1 0 0 0 1 
i 6.699547 131.5719 0.5378755 71 72.70289 0 0.1 0 0 0 1 
i 6.822238 131.5719 1.075751 73 72.90415 0 0.1 0 0 0 1 
i 4.569188 131.6784 0.5378755 79 78.59371 0 0.1 0 0 0 1 
i 4.875915 131.6784 0.5378755 76 79.09686 0 0.1 0 0 0 1 
i 5.796096 131.6784 0.5378755 90 80.60629 0 0.1 0 0 0 1 
i 9.716626 131.6784 0.5378755 99 80.3044 0 0.1 0 0 0 1 
i 6.844545 131.9763 0.5378755 86 79.40746 0 0.1 0 0 0 1 
i 10.94911 131.9763 0.5378755 98 79.40746 0 0.1 0 0 0 1 
i 3.766121 132.0521 0.5378755 42 71.706 0 0.1 0 0 0 1 
i 7.870687 132.0521 0.5378755 54 71.706 0 0.1 0 0 0 1 
i 1.368072 132.1098 0.5378755 55 70.69031 0 0.1 0 0 0 1 
i 1.613454 132.1098 0.5378755 50 71.09283 0 0.1 0 0 0 1 
i 1.736145 132.1098 0.5378755 48 71.29409 0 0.1 0 0 0 1 
i 2.104217 132.1098 0.5378755 59 71.89786 0 0.1 0 0 0 1 
i 2.226908 132.1098 0.5378755 57 72.09912 0 0.1 0 0 0 1 
i 2.47229 132.1098 0.5378755 61 72.50164 0 0.1 0 0 0 1 
i 2.840362 132.1098 0.5378755 63 73.10541 0 0.1 0 0 0 1 
i 5.104566 132.1098 0.5378755 64 70.08654 0 0.1 0 0 0 1 
i 5.472639 132.1098 0.5378755 66 70.69031 0 0.1 0 0 0 1 
i 5.71802 132.1098 0.5378755 62 71.09283 0 0.1 0 0 0 1 
i 5.840711 132.1098 0.5378755 60 71.29409 0 0.1 0 0 0 1 
i 6.208784 132.1098 0.5378755 70 71.89786 0 0.1 0 0 0 1 
i 6.331474 132.1098 0.5378755 68 72.09912 0 0.1 0 0 0 1 
i 6.944929 132.1098 0.5378755 75 73.10541 0 0.1 0 0 0 1 
i 6.353782 132.5142 0.5378755 80 78.60243 0 0.1 0 0 0 1 
i 10.45835 132.5142 0.5378755 91 78.60243 0 0.1 0 0 0 1 
i 4.691879 132.5771 0.5378755 79 78.7943 0 0.1 0 0 0 1 
i 4.81457 132.5771 0.5378755 77 78.99556 0 0.1 0 0 0 1 
i 5.550715 132.5771 0.5378755 89 80.2031 0 0.1 0 0 0 1 
i 5.918787 132.5771 0.5378755 91 80.80688 0 0.1 0 0 0 1 
i 8.796445 132.5771 0.5378755 91 78.7943 0 0.1 0 0 0 1 
i 8.919136 132.5771 0.5378755 89 78.99556 0 0.1 0 0 0 1 
i 9.655281 132.5771 0.5378755 101 80.2031 0 0.1 0 0 0 1 
i 10.02335 132.5771 0.5378755 103 80.80688 0 0.1 0 0 0 1 
i 2.784594 132.59 0.5378755 48 70.09593 0 0.1 0 0 0 1 
i 6.88916 132.59 0.5378755 59 70.09593 0 0.1 0 0 0 1 
i 1.061345 132.9017 1.075751 53 70.1865 0 0.1 0 0 0 1 
i 1.122691 132.9017 1.075751 52 70.28713 0 0.1 0 0 0 1 
i 1.245382 132.9017 1.075751 54 70.48839 0 0.1 0 0 0 1 
i 1.429418 132.9017 0.5378755 55 70.79027 0 0.1 0 0 0 1 
i 1.490763 132.9017 0.5378755 49 70.8909 0 0.1 0 0 0 1 
i 1.6748 132.9017 0.5378755 51 71.19279 0 0.1 0 0 0 1 
i 1.79749 132.9017 1.075751 48 71.39405 0 0.1 0 0 0 1 
i 1.858836 132.9017 1.075751 47 71.49468 0 0.1 0 0 0 1 
i 1.981527 132.9017 1.075751 58 71.69593 0 0.1 0 0 0 1 
i 2.165563 132.9017 1.075751 59 71.99782 0 0.1 0 0 0 1 
i 2.288254 132.9017 0.5378755 57 72.19908 0 0.1 0 0 0 1 
i 2.349599 132.9017 1.075751 56 72.29971 0 0.1 0 0 0 1 
i 2.533635 132.9017 0.5378755 61 72.60159 0 0.1 0 0 0 1 
i 2.594981 132.9017 1.075751 60 72.70222 0 0.1 0 0 0 1 
i 2.717672 132.9017 1.075751 62 72.90348 0 0.1 0 0 0 1 
i 2.901708 132.9017 1.075751 63 73.20537 0 0.1 0 0 0 1 
i 5.165911 132.9017 1.075751 64 70.1865 0 0.1 0 0 0 1 
i 5.227257 132.9017 1.075751 63 70.28713 0 0.1 0 0 0 1 
i 5.349948 132.9017 1.075751 65 70.48839 0 0.1 0 0 0 1 
i 5.533984 132.9017 0.5378755 66 70.79027 0 0.1 0 0 0 1 
i 5.595329 132.9017 0.5378755 61 70.8909 0 0.1 0 0 0 1 
i 5.779366 132.9017 1.075751 62 71.19279 0 0.1 0 0 0 1 
i 5.902056 132.9017 1.075751 60 71.39405 0 0.1 0 0 0 1 
i 5.963402 132.9017 1.075751 59 71.49468 0 0.1 0 0 0 1 
i 6.086093 132.9017 1.075751 70 71.69593 0 0.1 0 0 0 1 
i 6.270129 132.9017 0.5378755 71 71.99782 0 0.1 0 0 0 1 
i 6.39282 132.9017 1.075751 68 72.19908 0 0.1 0 0 0 1 
i 6.454165 132.9017 0.5378755 67 72.29971 0 0.1 0 0 0 1 
i 6.638201 132.9017 1.075751 73 72.60159 0 0.1 0 0 0 1 
i 6.699547 132.9017 1.075751 72 72.70222 0 0.1 0 0 0 1 
i 6.822238 132.9017 1.075751 74 72.90348 0 0.1 0 0 0 1 
i 7.006274 132.9017 0.5378755 75 73.20537 0 0.1 0 0 0 1 
i 4.569188 133.115 0.5378755 78 78.59304 0 0.1 0 0 0 1 
i 4.93726 133.115 0.5378755 76 79.19681 0 0.1 0 0 0 1 
i 5.673405 133.115 0.5378755 88 80.40436 0 0.1 0 0 0 1 
i 5.796096 133.115 0.5378755 90 80.60562 0 0.1 0 0 0 1 
i 8.673754 133.115 0.5378755 90 78.59304 0 0.1 0 0 0 1 
i 9.041826 133.115 0.5378755 87 79.19681 0 0.1 0 0 0 1 
i 9.777971 133.115 0.5378755 99 80.40436 0 0.1 0 0 0 1 
i 9.900662 133.115 0.5378755 102 80.60562 0 0.1 0 0 0 1 
i 1.184036 133.4396 0.5378755 51 70.38776 0 0.1 0 0 0 1 
i 1.552109 133.4396 0.5378755 49 70.99153 0 0.1 0 0 0 1 
i 1.613454 133.4396 0.5378755 50 71.09216 0 0.1 0 0 0 1 
i 2.410945 133.4396 0.5378755 55 72.40034 0 0.1 0 0 0 1 
i 2.47229 133.4396 0.5378755 61 72.50096 0 0.1 0 0 0 1 
i 5.472639 133.4396 0.5378755 66 70.68964 0 0.1 0 0 0 1 
i 6.024747 133.4396 0.5378755 58 71.5953 0 0.1 0 0 0 1 
i 6.147438 133.4396 0.5378755 69 71.79656 0 0.1 0 0 0 1 
i 6.515511 133.4396 0.5378755 67 72.40034 0 0.1 0 0 0 1 
i 6.760892 133.4396 0.5378755 71 72.80285 0 0.1 0 0 0 1 
i 6.415127 133.4488 0.5378755 71 78.70239 0 0.1 0 0 0 1 
i 6.844545 133.4488 0.5378755 59 79.40679 0 0.1 0 0 0 1 
i 10.51969 133.4488 0.5378755 83 78.70239 0 0.1 0 0 0 1 
i 10.94911 133.4488 0.5378755 71 79.40679 0 0.1 0 0 0 1 
i 2.845939 133.5915 1.075751 49 70.19589 0 0.1 0 0 0 1 
i 3.766121 133.5915 0.5378755 40 71.70532 0 0.1 0 0 0 1 
i 6.950505 133.5915 0.5378755 61 70.19589 0 0.1 0 0 0 1 
i 7.870687 133.5915 1.075751 51 71.70532 0 0.1 0 0 0 1 
i 4.630533 133.9127 1.075751 78 78.693 0 0.1 0 0 0 1 
i 4.691879 133.9127 1.075751 79 78.79363 0 0.1 0 0 0 1 
i 4.81457 133.9127 1.075751 77 78.99488 0 0.1 0 0 0 1 
i 4.998606 133.9127 0.5378755 75 79.29677 0 0.1 0 0 0 1 
i 5.550715 133.9127 1.075751 89 80.20243 0 0.1 0 0 0 1 
i 5.734751 133.9127 0.5378755 88 80.50432 0 0.1 0 0 0 1 
i 5.857442 133.9127 1.075751 90 80.70558 0 0.1 0 0 0 1 
i 5.918787 133.9127 1.075751 91 80.80621 0 0.1 0 0 0 1 
i 8.735099 133.9127 1.075751 89 78.693 0 0.1 0 0 0 1 
i 8.796445 133.9127 1.075751 90 78.79363 0 0.1 0 0 0 1 
i 8.919136 133.9127 1.075751 88 78.99488 0 0.1 0 0 0 1 
i 9.103172 133.9127 0.5378755 87 79.29677 0 0.1 0 0 0 1 
i 9.655281 133.9127 1.075751 101 80.20243 0 0.1 0 0 0 1 
i 9.839317 133.9127 1.075751 100 80.50432 0 0.1 0 0 0 1 
i 9.962008 133.9127 1.075751 102 80.70558 0 0.1 0 0 0 1 
i 10.02335 133.9127 1.075751 103 80.80621 0 0.1 0 0 0 1 
i 6.353782 133.9867 0.5378755 70 78.60176 0 0.1 0 0 0 1 
i 6.905891 133.9867 0.5378755 58 79.50742 0 0.1 0 0 0 1 
i 10.45835 133.9867 0.5378755 81 78.60176 0 0.1 0 0 0 1 
i 11.01046 133.9867 0.5378755 70 79.50742 0 0.1 0 0 0 1 
i 3.827466 134.1294 0.5378755 39 71.80595 0 0.1 0 0 0 1 
i 6.88916 134.1294 0.5378755 60 70.09526 0 0.1 0 0 0 1 
i 4.93726 134.4505 0.5378755 76 79.19614 0 0.1 0 0 0 1 
i 5.980132 134.4505 0.5378755 92 80.90683 0 0.1 0 0 0 1 
i 8.85779 134.4505 0.5378755 91 78.89426 0 0.1 0 0 0 1 
i 6.476473 134.9572 0.5378755 79 78.80235 0 0.1 0 0 0 1 
i 6.844545 134.9572 0.5378755 87 79.40612 0 0.1 0 0 0 1 
i 10.58104 134.9572 0.5378755 90 78.80235 0 0.1 0 0 0 1 
i 10.94911 134.9572 0.5378755 98 79.40612 0 0.1 0 0 0 1 
i 2.907285 135.1684 0.5378755 41 70.29585 0 0.1 0 0 0 1 
i 3.766121 135.1684 0.5378755 62 71.70465 0 0.1 0 0 0 1 
i 7.011851 135.1684 0.5378755 53 70.29585 0 0.1 0 0 0 1 
i 7.870687 135.1684 0.5378755 74 71.70465 0 0.1 0 0 0 1 
i 6.353782 135.4951 0.5378755 80 78.60109 0 0.1 0 0 0 1 
i 6.967236 135.4951 0.5378755 89 79.60738 0 0.1 0 0 0 1 
i 10.45835 135.4951 0.5378755 92 78.60109 0 0.1 0 0 0 1 
i 11.0718 135.4951 0.5378755 100 79.60738 0 0.1 0 0 0 1 
i 2.784594 135.7063 0.5378755 44 70.09459 0 0.1 0 0 0 1 
i 3.888811 135.7063 0.5378755 65 71.90591 0 0.1 0 0 0 1 
i 6.88916 135.7063 0.5378755 55 70.09459 0 0.1 0 0 0 1 
i 7.993377 135.7063 0.5378755 76 71.90591 0 0.1 0 0 0 1 
i 5.059951 135.7717 0.5378755 77 79.39673 0 0.1 0 0 0 1 
i 5.550715 135.7717 0.5378755 86 80.20176 0 0.1 0 0 0 1 
i 9.164517 135.7717 0.5378755 89 79.39673 0 0.1 0 0 0 1 
i 9.655281 135.7717 0.5378755 97 80.20176 0 0.1 0 0 0 1 
i 4.569188 136.3096 0.5378755 81 78.5917 0 0.1 0 0 0 1 
i 6.041478 136.3096 0.5378755 90 81.00679 0 0.1 0 0 0 1 
i 8.673754 136.3096 0.5378755 93 78.5917 0 0.1 0 0 0 1 
i 10.14604 136.3096 0.5378755 102 81.00679 0 0.1 0 0 0 1 
i 6.415127 136.3595 1.075751 77 78.70105 0 0.1 0 0 0 1 
i 6.476473 136.3595 0.5378755 76 78.80168 0 0.1 0 0 0 1 
i 6.844545 136.3595 1.075751 79 79.40545 0 0.1 0 0 0 1 
i 10.51969 136.3595 1.075751 88 78.70105 0 0.1 0 0 0 1 
i 10.94911 136.3595 1.075751 90 79.40545 0 0.1 0 0 0 1 
i 2.845939 136.6345 0.5378755 51 70.19455 0 0.1 0 0 0 1 
i 2.907285 136.6345 0.5378755 53 70.29518 0 0.1 0 0 0 1 
i 3.766121 136.6345 0.5378755 32 71.70398 0 0.1 0 0 0 1 
i 3.950157 136.6345 0.5378755 30 72.00587 0 0.1 0 0 0 1 
i 6.950505 136.6345 0.5378755 62 70.19455 0 0.1 0 0 0 1 
i 7.011851 136.6345 0.5378755 64 70.29518 0 0.1 0 0 0 1 
i 7.870687 136.6345 0.5378755 43 71.70398 0 0.1 0 0 0 1 
i 8.054723 136.6345 0.5378755 41 72.00587 0 0.1 0 0 0 1 
i 6.537818 136.8974 0.5378755 76 78.90231 0 0.1 0 0 0 1 
i 6.905891 136.8974 0.5378755 78 79.50608 0 0.1 0 0 0 1 
i 10.45835 136.8974 0.5378755 88 78.60042 0 0.1 0 0 0 1 
i 2.784594 137.1724 0.5378755 52 70.09392 0 0.1 0 0 0 1 
i 2.96863 137.1724 0.5378755 54 70.39581 0 0.1 0 0 0 1 
i 3.827466 137.1724 0.5378755 33 71.80461 0 0.1 0 0 0 1 
i 3.888811 137.1724 0.5378755 31 71.90524 0 0.1 0 0 0 1 
i 6.88916 137.1724 0.5378755 63 70.09392 0 0.1 0 0 0 1 
i 7.073196 137.1724 0.5378755 65 70.39581 0 0.1 0 0 0 1 
i 7.932032 137.1724 0.5378755 44 71.80461 0 0.1 0 0 0 1 
i 7.993377 137.1724 0.5378755 42 71.90524 0 0.1 0 0 0 1 
i 4.630533 137.1741 1.075751 82 78.69166 0 0.1 0 0 0 1 
i 5.059951 137.1741 0.5378755 77 79.39606 0 0.1 0 0 0 1 
i 5.550715 137.1741 1.075751 85 80.20109 0 0.1 0 0 0 1 
i 6.102823 137.1741 0.5378755 91 81.10675 0 0.1 0 0 0 1 
i 8.735099 137.1741 0.5378755 94 78.69166 0 0.1 0 0 0 1 
i 9.164517 137.1741 1.075751 88 79.39606 0 0.1 0 0 0 1 
i 9.655281 137.1741 0.5378755 97 80.20109 0 0.1 0 0 0 1 
i 10.20739 137.1741 1.075751 102 81.10675 0 0.1 0 0 0 1 
i 5.121297 137.712 0.5378755 76 79.49669 0 0.1 0 0 0 1 
i 6.041478 137.712 0.5378755 90 81.00612 0 0.1 0 0 0 1 
i 8.673754 137.712 0.5378755 93 78.59103 0 0.1 0 0 0 1 
i 9.716626 137.712 0.5378755 96 80.30172 0 0.1 0 0 0 1 
i 6.599163 137.974 0.5378755 71 79.00226 0 0.1 0 0 0 1 
i 6.844545 137.974 0.5378755 65 79.40478 0 0.1 0 0 0 1 
i 10.70373 137.974 0.5378755 83 79.00226 0 0.1 0 0 0 1 
i 10.94911 137.974 0.5378755 76 79.40478 0 0.1 0 0 0 1 
i 3.029976 138.3223 0.5378755 44 70.49577 0 0.1 0 0 0 1 
i 3.766121 138.3223 0.5378755 53 71.70331 0 0.1 0 0 0 1 
i 7.134542 138.3223 0.5378755 55 70.49577 0 0.1 0 0 0 1 
i 7.870687 138.3223 0.5378755 64 71.70331 0 0.1 0 0 0 1 
i 6.353782 138.5118 0.5378755 68 78.59975 0 0.1 0 0 0 1 
i 7.089927 138.5118 0.5378755 61 79.8073 0 0.1 0 0 0 1 
i 10.45835 138.5118 0.5378755 79 78.59975 0 0.1 0 0 0 1 
i 11.19449 138.5118 0.5378755 73 79.8073 0 0.1 0 0 0 1 
i 4.691879 138.6106 0.5378755 83 78.79161 0 0.1 0 0 0 1 
i 5.059951 138.6106 0.5378755 77 79.39539 0 0.1 0 0 0 1 
i 5.550715 138.6106 0.5378755 86 80.20042 0 0.1 0 0 0 1 
i 6.164169 138.6106 0.5378755 91 81.20671 0 0.1 0 0 0 1 
i 8.796445 138.6106 0.5378755 94 78.79161 0 0.1 0 0 0 1 
i 9.164517 138.6106 0.5378755 89 79.39539 0 0.1 0 0 0 1 
i 9.655281 138.6106 0.5378755 97 80.20042 0 0.1 0 0 0 1 
i 10.26873 138.6106 0.5378755 103 81.20671 0 0.1 0 0 0 1 
i 2.784594 138.8602 0.5378755 46 70.09325 0 0.1 0 0 0 1 
i 4.011502 138.8602 0.5378755 55 72.10583 0 0.1 0 0 0 1 
i 6.88916 138.8602 0.5378755 57 70.09325 0 0.1 0 0 0 1 
i 8.116068 138.8602 0.5378755 66 72.10583 0 0.1 0 0 0 1 
i 4.569188 139.1485 0.5378755 81 78.59036 0 0.1 0 0 0 1 
i 5.182642 139.1485 0.5378755 76 79.59665 0 0.1 0 0 0 1 
i 5.673405 139.1485 0.5378755 85 80.40168 0 0.1 0 0 0 1 
i 6.041478 139.1485 0.5378755 90 81.00545 0 0.1 0 0 0 1 
i 8.673754 139.1485 0.5378755 93 78.59036 0 0.1 0 0 0 1 
i 9.287208 139.1485 0.5378755 88 79.59665 0 0.1 0 0 0 1 
i 9.777971 139.1485 0.5378755 96 80.40168 0 0.1 0 0 0 1 
i 10.14604 139.1485 0.5378755 102 81.00545 0 0.1 0 0 0 1 
i 6.415127 139.3763 0.5378755 89 78.69971 0 0.1 0 0 0 1 
i 6.599163 139.3763 0.5378755 82 79.00159 0 0.1 0 0 0 1 
i 6.844545 139.3763 0.5378755 92 79.40411 0 0.1 0 0 0 1 
i 7.151272 139.3763 0.5378755 98 79.90725 0 0.1 0 0 0 1 
i 10.51969 139.3763 0.5378755 100 78.69971 0 0.1 0 0 0 1 
i 10.70373 139.3763 0.5378755 94 79.00159 0 0.1 0 0 0 1 
i 10.94911 139.3763 0.5378755 103 79.40411 0 0.1 0 0 0 1 
i 11.25584 139.3763 0.5378755 109 79.90725 0 0.1 0 0 0 1 
i 2.845939 139.7884 0.5378755 46 70.19321 0 0.1 0 0 0 1 
i 3.029976 139.7884 0.5378755 43 70.49509 0 0.1 0 0 0 1 
i 3.766121 139.7884 1.075751 55 71.70264 0 0.1 0 0 0 1 
i 4.072848 139.7884 1.075751 58 72.20579 0 0.1 0 0 0 1 
i 6.950505 139.7884 1.075751 57 70.19321 0 0.1 0 0 0 1 
i 7.134542 139.7884 0.5378755 54 70.49509 0 0.1 0 0 0 1 
i 7.870687 139.7884 0.5378755 67 71.70264 0 0.1 0 0 0 1 
i 8.177414 139.7884 0.5378755 70 72.20579 0 0.1 0 0 0 1 
i 6.353782 139.9142 0.5378755 87 78.59908 0 0.1 0 0 0 1 
i 6.660509 139.9142 0.5378755 81 79.10222 0 0.1 0 0 0 1 
i 6.905891 139.9142 0.5378755 90 79.50474 0 0.1 0 0 0 1 
i 7.089927 139.9142 0.5378755 97 79.80662 0 0.1 0 0 0 1 
i 10.45835 139.9142 0.5378755 99 78.59908 0 0.1 0 0 0 1 
i 10.76507 139.9142 0.5378755 92 79.10222 0 0.1 0 0 0 1 
i 11.01046 139.9142 0.5378755 102 79.50474 0 0.1 0 0 0 1 
i 11.19449 139.9142 0.5378755 108 79.80662 0 0.1 0 0 0 1 
i 4.630533 139.9462 1.075751 82 78.69031 0 0.1 0 0 0 1 
i 4.691879 139.9462 1.075751 83 78.79094 0 0.1 0 0 0 1 
i 5.059951 139.9462 1.075751 77 79.39472 0 0.1 0 0 0 1 
i 5.243987 139.9462 1.075751 76 79.6966 0 0.1 0 0 0 1 
i 5.550715 139.9462 1.075751 85 80.19975 0 0.1 0 0 0 1 
i 5.734751 139.9462 0.5378755 84 80.50164 0 0.1 0 0 0 1 
i 6.102823 139.9462 0.5378755 90 81.10541 0 0.1 0 0 0 1 
i 6.164169 139.9462 1.075751 91 81.20604 0 0.1 0 0 0 1 
i 8.735099 139.9462 0.5378755 93 78.69031 0 0.1 0 0 0 1 
i 8.796445 139.9462 1.075751 94 78.79094 0 0.1 0 0 0 1 
i 9.164517 139.9462 1.075751 88 79.39472 0 0.1 0 0 0 1 
i 9.348554 139.9462 0.5378755 87 79.6966 0 0.1 0 0 0 1 
i 9.655281 139.9462 1.075751 97 80.19975 0 0.1 0 0 0 1 
i 9.839317 139.9462 1.075751 96 80.50164 0 0.1 0 0 0 1 
i 10.20739 139.9462 1.075751 102 81.10541 0 0.1 0 0 0 1 
i 10.26873 139.9462 1.075751 103 81.20604 0 0.1 0 0 0 1 
i 2.784594 140.3263 0.5378755 45 70.09258 0 0.1 0 0 0 1 
i 3.091321 140.3263 0.5378755 42 70.59572 0 0.1 0 0 0 1 
i 7.195887 140.3263 0.5378755 53 70.59572 0 0.1 0 0 0 1 
i 7.932032 140.3263 0.5378755 66 71.80327 0 0.1 0 0 0 1 
i 8.116068 140.3263 0.5378755 69 72.10516 0 0.1 0 0 0 1 
i 5.61206 140.4841 0.5378755 86 80.30038 0 0.1 0 0 0 1 
i 6.225514 140.4841 0.5378755 92 81.30667 0 0.1 0 0 0 1 
i 8.85779 140.4841 0.5378755 95 78.89157 0 0.1 0 0 0 1 
i 9.225863 140.4841 0.5378755 89 79.49535 0 0.1 0 0 0 1 
i 6.476473 140.8129 0.5378755 68 78.79966 0 0.1 0 0 0 1 
i 6.599163 140.8129 0.5378755 71 79.00092 0 0.1 0 0 0 1 
i 6.844545 140.8129 0.5378755 65 79.40344 0 0.1 0 0 0 1 
i 7.212618 140.8129 0.5378755 63 80.00721 0 0.1 0 0 0 1 
i 10.58104 140.8129 0.5378755 79 78.79966 0 0.1 0 0 0 1 
i 10.70373 140.8129 0.5378755 82 79.00092 0 0.1 0 0 0 1 
i 10.94911 140.8129 0.5378755 77 79.40344 0 0.1 0 0 0 1 
i 11.31718 140.8129 0.5378755 74 80.00721 0 0.1 0 0 0 1 
i 2.907285 141.2903 0.5378755 50 70.29317 0 0.1 0 0 0 1 
i 3.029976 141.2903 0.5378755 55 70.49442 0 0.1 0 0 0 1 
i 3.766121 141.2903 0.5378755 29 71.70197 0 0.1 0 0 0 1 
i 4.134193 141.2903 0.5378755 24 72.30574 0 0.1 0 0 0 1 
i 7.011851 141.2903 0.5378755 61 70.29317 0 0.1 0 0 0 1 
i 7.134542 141.2903 0.5378755 66 70.49442 0 0.1 0 0 0 1 
i 7.870687 141.2903 0.5378755 40 71.70197 0 0.1 0 0 0 1 
i 8.238759 141.2903 0.5378755 36 72.30574 0 0.1 0 0 0 1 
i 6.353782 141.3508 0.5378755 69 78.59841 0 0.1 0 0 0 1 
i 6.721854 141.3508 0.5378755 72 79.20218 0 0.1 0 0 0 1 
i 6.967236 141.3508 0.5378755 67 79.6047 0 0.1 0 0 0 1 
i 7.089927 141.3508 1.015285 64 79.80595 0 0.1 0 0 0 1 
i 10.45835 141.3508 0.5378755 81 78.59841 0 0.1 0 0 0 1 
i 10.82642 141.3508 0.5378755 84 79.20218 0 0.1 0 0 0 1 
i 11.0718 141.3508 0.5378755 78 79.6047 0 0.1 0 0 0 1 
i 11.19449 141.3508 0.5378755 76 79.80595 0 0.1 0 0 0 1 
i 4.81457 141.4838 0.5378755 83 78.99153 0 0.1 0 0 0 1 
i 5.059951 141.4838 0.5378755 78 79.39405 0 0.1 0 0 0 1 
i 5.550715 141.4838 0.5378755 87 80.19908 0 0.1 0 0 0 1 
i 6.28686 141.4838 0.5378755 91 81.40662 0 0.1 0 0 0 1 
i 8.919136 141.4838 0.5378755 94 78.99153 0 0.1 0 0 0 1 
i 9.164517 141.4838 0.5378755 90 79.39405 0 0.1 0 0 0 1 
i 9.655281 141.4838 0.5378755 98 80.19908 0 0.1 0 0 0 1 
i 10.39143 141.4838 0.5378755 103 81.40662 0 0.1 0 0 0 1 
i 2.784594 141.8282 0.5378755 53 70.09191 0 0.1 0 0 0 1 
i 3.152666 141.8282 0.5378755 57 70.69568 0 0.1 0 0 0 1 
i 3.888811 141.8282 0.5378755 32 71.90323 0 0.1 0 0 0 1 
i 4.011502 141.8282 0.5378755 27 72.10449 0 0.1 0 0 0 1 
i 7.257232 141.8282 1.396042 69 70.69568 0 0.1 0 0 0 1 
i 7.993377 141.8282 0.5378755 43 71.90323 0 0.1 0 0 0 1 
i 8.116068 141.8282 0.5378755 38 72.10449 0 0.1 0 0 0 1 
i 4.569188 142.0216 0.5378755 80 78.58901 0 0.1 0 0 0 1 
i 5.305333 142.0216 0.5378755 76 79.79656 0 0.1 0 0 0 1 
i 5.796096 142.0216 0.5378755 85 80.60159 0 0.1 0 0 0 1 
i 6.041478 142.0216 0.5378755 89 81.00411 0 0.1 0 0 0 1 
i 8.673754 142.0216 0.5378755 92 78.58901 0 0.1 0 0 0 1 
i 9.409899 142.0216 0.5378755 88 79.79656 0 0.1 0 0 0 1 
i 9.900662 142.0216 0.5378755 96 80.60159 0 0.1 0 0 0 1 
i 10.14604 142.0216 0.5378755 100 81.00411 0 0.1 0 0 0 1 
i 6.415127 142.1485 0.5378755 71 78.69836 0 0.1 0 0 0 1 
i 6.476473 142.1485 1.075751 70 78.79899 0 0.1 0 0 0 1 
i 6.599163 142.1485 1.075751 72 79.00025 0 0.1 0 0 0 1 
i 6.7832 142.1485 0.5378755 73 79.30214 0 0.1 0 0 0 1 
i 6.844545 142.1485 1.075751 67 79.40277 0 0.1 0 0 0 1 
i 7.151272 142.1485 1.075751 66 79.90591 0 0.1 0 0 0 1 
i 7.212618 142.1485 1.075751 65 80.00654 0 0.1 0 0 0 1 
i 10.51969 142.1485 0.5378755 82 78.69836 0 0.1 0 0 0 1 
i 10.58104 142.1485 1.075751 81 78.79899 0 0.1 0 0 0 1 
i 10.70373 142.1485 1.075751 83 79.00025 0 0.1 0 0 0 1 
i 10.88777 142.1485 1.075751 84 79.30214 0 0.1 0 0 0 1 
i 10.94911 142.1485 1.075751 79 79.40277 0 0.1 0 0 0 1 
i 11.13315 142.1485 0.5378755 80 79.70465 0 0.1 0 0 0 1 
i 11.25584 142.1485 1.075751 78 79.90591 0 0.1 0 0 0 1 
i 11.31718 142.1485 1.075751 77 80.00654 0 0.1 0 0 0 1 
i 6.660509 142.6863 0.5378755 71 79.10088 0 0.1 0 0 0 1 
i 6.967236 142.6863 0.5378755 68 79.60403 0 0.1 0 0 0 1 
i 10.45835 142.6863 0.5378755 82 78.59774 0 0.1 0 0 0 1 
i 11.37853 142.6863 0.5378755 76 80.10717 0 0.1 0 0 0 1 
i 2.845939 142.6866 1.075751 42 70.19187 0 0.1 0 0 0 1 
i 2.907285 142.6866 0.5378755 44 70.29249 0 0.1 0 0 0 1 
i 3.029976 142.6866 0.5378755 41 70.49375 0 0.1 0 0 0 1 
i 3.214012 142.6866 0.5378755 39 70.79564 0 0.1 0 0 0 1 
i 3.766121 142.6866 0.5378755 59 71.7013 0 0.1 0 0 0 1 
i 3.950157 142.6866 0.5378755 57 72.00319 0 0.1 0 0 0 1 
i 4.072848 142.6866 1.075751 60 72.20444 0 0.1 0 0 0 1 
i 4.134193 142.6866 0.5378755 62 72.30507 0 0.1 0 0 0 1 
i 6.950505 142.6866 0.5378755 54 70.19187 0 0.1 0 0 0 1 
i 7.011851 142.6866 1.075751 55 70.29249 0 0.1 0 0 0 1 
i 7.134542 142.6866 1.075751 52 70.49375 0 0.1 0 0 0 1 
i 7.318578 142.6866 0.5378755 51 70.79564 0 0.1 0 0 0 1 
i 7.870687 142.6866 1.075751 70 71.7013 0 0.1 0 0 0 1 
i 8.054723 142.6866 0.5378755 69 72.00319 0 0.1 0 0 0 1 
i 8.177414 142.6866 0.5378755 72 72.20444 0 0.1 0 0 0 1 
i 8.238759 142.6866 1.075751 73 72.30507 0 0.1 0 0 0 1 
i 4.630533 142.8193 1.075751 80 78.68897 0 0.1 0 0 0 1 
i 4.81457 142.8193 1.075751 83 78.99086 0 0.1 0 0 0 1 
i 5.059951 142.8193 0.5378755 78 79.39338 0 0.1 0 0 0 1 
i 5.366678 142.8193 1.075751 76 79.89652 0 0.1 0 0 0 1 
i 5.550715 142.8193 0.5378755 87 80.19841 0 0.1 0 0 0 1 
i 5.857442 142.8193 0.5378755 84 80.70155 0 0.1 0 0 0 1 
i 6.102823 142.8193 1.075751 88 81.10407 0 0.1 0 0 0 1 
i 6.28686 142.8193 0.5378755 91 81.40595 0 0.1 0 0 0 1 
i 8.735099 142.8193 0.5378755 91 78.68897 0 0.1 0 0 0 1 
i 8.919136 142.8193 0.5378755 94 78.99086 0 0.1 0 0 0 1 
i 9.164517 142.8193 1.075751 90 79.39338 0 0.1 0 0 0 1 
i 9.471244 142.8193 0.5378755 87 79.89652 0 0.1 0 0 0 1 
i 9.655281 142.8193 0.5378755 98 80.19841 0 0.1 0 0 0 1 
i 9.962008 142.8193 1.075751 96 80.70155 0 0.1 0 0 0 1 
i 10.20739 142.8193 1.075751 100 81.10407 0 0.1 0 0 0 1 
i 10.39143 142.8193 1.075751 103 81.40595 0 0.1 0 0 0 1 
i 2.784594 143.2245 0.5378755 43 70.09124 0 0.1 0 0 0 1 
i 2.96863 143.2245 0.5378755 45 70.39312 0 0.1 0 0 0 1 
i 3.152666 143.2245 0.5378755 40 70.69501 0 0.1 0 0 0 1 
i 3.888811 143.2245 0.5378755 58 71.90256 0 0.1 0 0 0 1 
i 4.011502 143.2245 0.5378755 61 72.10382 0 0.1 0 0 0 1 
i 4.195539 143.2245 0.5378755 63 72.4057 0 0.1 0 0 0 1 
i 7.073196 143.2245 0.5378755 56 70.39312 0 0.1 0 0 0 1 
i 7.195887 143.2245 0.5378755 53 70.59438 0 0.1 0 0 0 1 
i 7.932032 143.2245 0.5378755 71 71.80193 0 0.1 0 0 0 1 
i 8.300105 143.2245 0.5378755 74 72.4057 0 0.1 0 0 0 1 
i 5.121297 143.3572 0.5378755 79 79.494 0 0.1 0 0 0 1 
i 5.796096 143.3572 0.5378755 85 80.60092 0 0.1 0 0 0 1 
i 6.041478 143.3572 0.5378755 89 81.00344 0 0.1 0 0 0 1 
i 6.348205 143.3572 0.5378755 92 81.50658 0 0.1 0 0 0 1 
i 8.673754 143.3572 0.5378755 92 78.58834 0 0.1 0 0 0 1 
i 8.980481 143.3572 0.5378755 95 79.09149 0 0.1 0 0 0 1 
i 9.409899 143.3572 0.5378755 88 79.79589 0 0.1 0 0 0 1 
i 9.716626 143.3572 1.906027 99 80.29904 0 0.1 0 0 0 1 
i 4.691879 144.1875 0.5378755 80 78.78893 0 0.1 0 0 0 1 
i 4.81457 144.1875 0.5378755 82 78.99019 0 0.1 0 0 0 1 
i 5.059951 144.1875 0.5378755 78 79.3927 0 0.1 0 0 0 1 
i 5.428024 144.1875 0.5378755 76 79.99648 0 0.1 0 0 0 1 
i 5.550715 144.1875 0.5378755 86 80.19774 0 0.1 0 0 0 1 
i 5.918787 144.1875 0.5378755 84 80.80151 0 0.1 0 0 0 1 
i 6.164169 144.1875 1.075751 88 81.20403 0 0.1 0 0 0 1 
i 6.28686 144.1875 0.5378755 91 81.40528 0 0.1 0 0 0 1 
i 8.796445 144.1875 0.5378755 91 78.78893 0 0.1 0 0 0 1 
i 8.919136 144.1875 1.075751 93 78.99019 0 0.1 0 0 0 1 
i 9.164517 144.1875 0.5378755 89 79.3927 0 0.1 0 0 0 1 
i 9.53259 144.1875 0.5378755 87 79.99648 0 0.1 0 0 0 1 
i 9.655281 144.1875 0.5378755 98 80.19774 0 0.1 0 0 0 1 
i 10.02335 144.1875 0.5378755 96 80.80151 0 0.1 0 0 0 1 
i 10.26873 144.1875 0.5378755 100 81.20403 0 0.1 0 0 0 1 
i 10.39143 144.1875 0.5378755 102 81.40528 0 0.1 0 0 0 1 
i 3.275357 144.6301 0.5378755 51 70.8956 0 0.1 0 0 0 1 
i 3.766121 144.6301 0.5378755 42 71.70063 0 0.1 0 0 0 1 
i 7.379923 144.6301 0.5378755 62 70.8956 0 0.1 0 0 0 1 
i 7.870687 144.6301 0.5378755 53 71.70063 0 0.1 0 0 0 1 
i 7.335308 144.6468 0.5378755 71 80.20713 0 0.1 0 0 0 1 
i 11.43987 144.6468 0.5378755 82 80.20713 0 0.1 0 0 0 1 
i 4.569188 144.7254 0.5378755 81 78.58767 0 0.1 0 0 0 1 
i 4.93726 144.7254 0.5378755 83 79.19145 0 0.1 0 0 0 1 
i 5.182642 144.7254 0.5378755 79 79.59396 0 0.1 0 0 0 1 
i 5.305333 144.7254 0.5378755 77 79.79522 0 0.1 0 0 0 1 
i 5.796096 144.7254 0.5378755 85 80.60025 0 0.1 0 0 0 1 
i 6.041478 144.7254 0.5378755 90 81.00277 0 0.1 0 0 0 1 
i 6.40955 144.7254 0.5378755 92 81.60654 0 0.1 0 0 0 1 
i 9.041826 144.7254 0.5378755 95 79.19145 0 0.1 0 0 0 1 
i 9.287208 144.7254 0.5378755 90 79.59396 0 0.1 0 0 0 1 
i 9.409899 144.7254 0.5378755 88 79.79522 0 0.1 0 0 0 1 
i 9.900662 144.7254 0.5378755 97 80.60025 0 0.1 0 0 0 1 
i 10.14604 144.7254 0.5378755 101 81.00277 0 0.1 0 0 0 1 
i 10.51412 144.7254 0.5378755 103 81.60654 0 0.1 0 0 0 1 
i 2.784594 145.168 0.5378755 46 70.09057 0 0.1 0 0 0 1 
i 4.256884 145.168 0.5378755 37 72.50566 0 0.1 0 0 0 1 
i 6.88916 145.168 0.5378755 58 70.09057 0 0.1 0 0 0 1 
i 8.36145 145.168 0.5378755 49 72.50566 0 0.1 0 0 0 1 
i 6.353782 145.1847 0.5378755 76 78.59706 0 0.1 0 0 0 1 
i 10.45835 145.1847 0.5378755 88 78.59706 0 0.1 0 0 0 1 
i 4.630533 145.4595 1.075751 81 78.68763 0 0.1 0 0 0 1 
i 4.691879 145.4595 1.075751 80 78.78826 0 0.1 0 0 0 1 
i 4.81457 145.4595 1.075751 82 78.98952 0 0.1 0 0 0 1 
i 4.998606 145.4595 1.075751 83 79.2914 0 0.1 0 0 0 1 
i 5.059951 145.4595 1.075751 78 79.39203 0 0.1 0 0 0 1 
i 5.243987 145.4595 1.075751 79 79.69392 0 0.1 0 0 0 1 
i 5.366678 145.4595 0.5378755 77 79.89518 0 0.1 0 0 0 1 
i 5.428024 145.4595 1.075751 76 79.99581 0 0.1 0 0 0 1 
i 5.550715 145.4595 1.075751 87 80.19706 0 0.1 0 0 0 1 
i 5.734751 145.4595 1.075751 88 80.49895 0 0.1 0 0 0 1 
i 5.857442 145.4595 1.075751 86 80.70021 0 0.1 0 0 0 1 
i 5.918787 145.4595 1.075751 84 80.80084 0 0.1 0 0 0 1 
i 6.102823 145.4595 1.075751 90 81.10273 0 0.1 0 0 0 1 
i 6.164169 145.4595 1.075751 89 81.20335 0 0.1 0 0 0 1 
i 6.28686 145.4595 1.075751 91 81.40461 0 0.1 0 0 0 1 
i 6.470896 145.4595 0.5378755 92 81.7065 0 0.1 0 0 0 1 
i 8.735099 145.4595 1.075751 93 78.68763 0 0.1 0 0 0 1 
i 8.796445 145.4595 1.075751 92 78.78826 0 0.1 0 0 0 1 
i 8.919136 145.4595 1.075751 94 78.98952 0 0.1 0 0 0 1 
i 9.103172 145.4595 0.5378755 95 79.2914 0 0.1 0 0 0 1 
i 9.164517 145.4595 1.075751 90 79.39203 0 0.1 0 0 0 1 
i 9.348554 145.4595 1.075751 91 79.69392 0 0.1 0 0 0 1 
i 9.471244 145.4595 1.075751 88 79.89518 0 0.1 0 0 0 1 
i 9.53259 145.4595 1.075751 87 79.99581 0 0.1 0 0 0 1 
i 9.655281 145.4595 1.075751 98 80.19706 0 0.1 0 0 0 1 
i 9.839317 145.4595 1.075751 99 80.49895 0 0.1 0 0 0 1 
i 9.962008 145.4595 0.5378755 97 80.70021 0 0.1 0 0 0 1 
i 10.02335 145.4595 1.075751 96 80.80084 0 0.1 0 0 0 1 
i 10.20739 145.4595 1.075751 101 81.10273 0 0.1 0 0 0 1 
i 10.26873 145.4595 1.075751 100 81.20335 0 0.1 0 0 0 1 
i 10.39143 145.4595 1.075751 102 81.40461 0 0.1 0 0 0 1 
i 10.57546 145.4595 1.075751 103 81.7065 0 0.1 0 0 0 1 
i 5.489369 145.9973 0.5378755 75 80.09644 0 0.1 0 0 0 1 
i 5.796096 145.9973 0.5378755 85 80.59958 0 0.1 0 0 0 1 
i 9.225863 145.9973 0.5378755 89 79.49266 0 0.1 0 0 0 1 
i 10.0847 145.9973 0.5378755 95 80.90147 0 0.1 0 0 0 1 
i 2.845939 146.0962 1.075751 46 70.19052 0 0.1 0 0 0 1 
i 3.275357 146.0962 1.075751 51 70.89493 0 0.1 0 0 0 1 
i 3.766121 146.0962 1.075751 43 71.69996 0 0.1 0 0 0 1 
i 4.318229 146.0962 1.075751 38 72.60562 0 0.1 0 0 0 1 
i 6.950505 146.0962 0.5378755 57 70.19052 0 0.1 0 0 0 1 
i 7.379923 146.0962 0.5378755 62 70.89493 0 0.1 0 0 0 1 
i 7.870687 146.0962 0.5378755 54 71.69996 0 0.1 0 0 0 1 
i 8.422795 146.0962 0.5378755 49 72.60562 0 0.1 0 0 0 1 
i 6.415127 146.1193 0.5378755 78 78.69702 0 0.1 0 0 0 1 
i 7.335308 146.1193 1.075751 68 80.20646 0 0.1 0 0 0 1 
i 10.51969 146.1193 0.5378755 89 78.69702 0 0.1 0 0 0 1 
i 11.43987 146.1193 0.5378755 80 80.20646 0 0.1 0 0 0 1 
i 6.88916 146.6341 0.5378755 58 70.0899 0 0.1 0 0 0 1 
i 7.441269 146.6341 0.5378755 63 70.99556 0 0.1 0 0 0 1 
i 7.932032 146.6341 0.5378755 55 71.80059 0 0.1 0 0 0 1 
i 8.36145 146.6341 0.5378755 50 72.50499 0 0.1 0 0 0 1 
i 6.353782 146.6571 0.5378755 77 78.59639 0 0.1 0 0 0 1 
i 10.45835 146.6571 0.5378755 89 78.59639 0 0.1 0 0 0 1 
i 11.50122 146.6571 1.478834 79 80.30709 0 0.1 0 0 0 1 
i 2.907285 147.5981 0.5378755 51 70.29048 0 0.1 0 0 0 1 
i 3.275357 147.5981 0.5378755 40 70.89426 0 0.1 0 0 0 1 
i 3.766121 147.5981 0.5378755 58 71.69929 0 0.1 0 0 0 1 
i 4.379575 147.5981 0.5378755 69 72.70558 0 0.1 0 0 0 1 
i 7.011851 147.5981 0.5378755 63 70.29048 0 0.1 0 0 0 1 
i 7.379923 147.5981 0.5378755 51 70.89426 0 0.1 0 0 0 1 
i 7.870687 147.5981 0.5378755 69 71.69929 0 0.1 0 0 0 1 
i 8.484141 147.5981 0.5378755 81 72.70558 0 0.1 0 0 0 1 
i 6.476473 147.6276 0.5378755 70 78.79698 0 0.1 0 0 0 1 
i 7.335308 147.6276 0.5378755 91 80.20579 0 0.1 0 0 0 1 
i 10.58104 147.6276 0.5378755 81 78.79698 0 0.1 0 0 0 1 
i 11.43987 147.6276 0.5378755 102 80.20579 0 0.1 0 0 0 1 
i 2.784594 148.136 0.5378755 48 70.08922 0 0.1 0 0 0 1 
i 3.398048 148.136 0.5378755 37 71.09551 0 0.1 0 0 0 1 
i 3.888811 148.136 0.5378755 55 71.90055 0 0.1 0 0 0 1 
i 4.256884 148.136 0.5378755 67 72.50432 0 0.1 0 0 0 1 
i 6.88916 148.136 0.5378755 60 70.08922 0 0.1 0 0 0 1 
i 7.502614 148.136 0.5378755 48 71.09551 0 0.1 0 0 0 1 
i 7.993377 148.136 0.5378755 67 71.90055 0 0.1 0 0 0 1 
i 8.36145 148.136 0.5378755 78 72.50432 0 0.1 0 0 0 1 
i 6.353782 148.1655 0.5378755 72 78.59572 0 0.1 0 0 0 1 
i 7.457999 148.1655 0.5378755 93 80.40704 0 0.1 0 0 0 1 
i 10.45835 148.1655 0.5378755 84 78.59572 0 0.1 0 0 0 1 
i 11.56257 148.1655 1.366732 105 80.40704 0 0.1 0 0 0 1 
i 2.845939 148.9944 0.5378755 46 70.18918 0 0.1 0 0 0 1 
i 2.907285 148.9944 0.5378755 44 70.28981 0 0.1 0 0 0 1 
i 3.275357 148.9944 1.075751 54 70.89358 0 0.1 0 0 0 1 
i 3.459394 148.9944 0.5378755 55 71.19547 0 0.1 0 0 0 1 
i 3.766121 148.9944 0.5378755 40 71.69862 0 0.1 0 0 0 1 
i 3.950157 148.9944 0.5378755 42 72.0005 0 0.1 0 0 0 1 
i 4.318229 148.9944 0.5378755 32 72.60428 0 0.1 0 0 0 1 
i 4.379575 148.9944 1.075751 31 72.70491 0 0.1 0 0 0 1 
i 6.950505 148.9944 0.5378755 57 70.18918 0 0.1 0 0 0 1 
i 7.011851 148.9944 1.075751 55 70.28981 0 0.1 0 0 0 1 
i 7.379923 148.9944 0.5378755 65 70.89358 0 0.1 0 0 0 1 
i 7.56396 148.9944 0.5378755 67 71.19547 0 0.1 0 0 0 1 
i 7.870687 148.9944 1.075751 52 71.69862 0 0.1 0 0 0 1 
i 8.054723 148.9944 0.5378755 53 72.0005 0 0.1 0 0 0 1 
i 8.422795 148.9944 0.5378755 44 72.60428 0 0.1 0 0 0 1 
i 8.484141 148.9944 0.5378755 42 72.70491 0 0.1 0 0 0 1 
i 6.415127 149.03 0.5378755 79 78.69568 0 0.1 0 0 0 1 
i 6.476473 149.03 0.5378755 81 78.79631 0 0.1 0 0 0 1 
i 7.335308 149.03 0.5378755 60 80.20512 0 0.1 0 0 0 1 
i 7.519345 149.03 0.5378755 58 80.507 0 0.1 0 0 0 1 
i 10.51969 149.03 0.5378755 91 78.69568 0 0.1 0 0 0 1 
i 10.58104 149.03 0.5378755 93 78.79631 0 0.1 0 0 0 1 
i 11.43987 149.03 0.5378755 72 80.20512 0 0.1 0 0 0 1 
i 11.62391 149.03 0.5378755 70 80.507 0 0.1 0 0 0 1 
i 2.784594 149.5323 0.5378755 45 70.08855 0 0.1 0 0 0 1 
i 2.96863 149.5323 0.5378755 43 70.39044 0 0.1 0 0 0 1 
i 3.336703 149.5323 0.5378755 53 70.99421 0 0.1 0 0 0 1 
i 3.827466 149.5323 0.5378755 39 71.79925 0 0.1 0 0 0 1 
i 3.888811 149.5323 0.5378755 41 71.89987 0 0.1 0 0 0 1 
i 4.44092 149.5323 0.5378755 30 72.80553 0 0.1 0 0 0 1 
i 6.88916 149.5323 0.5378755 56 70.08855 0 0.1 0 0 0 1 
i 7.441269 149.5323 0.5378755 64 70.99421 0 0.1 0 0 0 1 
i 7.502614 149.5323 0.5378755 66 71.09484 0 0.1 0 0 0 1 
i 7.932032 149.5323 0.5378755 51 71.79925 0 0.1 0 0 0 1 
i 8.36145 149.5323 0.5378755 43 72.50365 0 0.1 0 0 0 1 
i 8.545486 149.5323 0.5378755 41 72.80553 0 0.1 0 0 0 1 
i 6.353782 149.5679 0.5378755 80 78.59505 0 0.1 0 0 0 1 
i 6.537818 149.5679 0.5378755 82 78.89694 0 0.1 0 0 0 1 
i 7.396654 149.5679 0.5378755 61 80.30574 0 0.1 0 0 0 1 
i 7.457999 149.5679 0.5378755 59 80.40637 0 0.1 0 0 0 1 
i 10.45835 149.5679 0.5378755 92 78.59505 0 0.1 0 0 0 1 
i 10.64238 149.5679 0.5378755 94 78.89694 0 0.1 0 0 0 1 
i 11.50122 149.5679 0.5378755 73 80.30574 0 0.1 0 0 0 1 
i 11.56257 149.5679 2.109682 71 80.40637 0 0.1 0 0 0 1 
i 3.029976 150.6018 1.075751 47 70.4904 0 0.1 0 0 0 1 
i 3.766121 150.6018 1.075751 48 71.69795 0 0.1 0 0 0 1 
i 4.502266 150.6018 0.5378755 49 72.90549 0 0.1 0 0 0 1 
i 7.134542 150.6018 0.5378755 59 70.4904 0 0.1 0 0 0 1 
i 7.379923 150.6018 1.075751 58 70.89291 0 0.1 0 0 0 1 
i 7.870687 150.6018 1.075751 60 71.69795 0 0.1 0 0 0 1 
i 8.606832 150.6018 0.5378755 60 72.90549 0 0.1 0 0 0 1 
i 6.599163 150.6444 0.5378755 73 78.9969 0 0.1 0 0 0 1 
i 7.335308 150.6444 0.5378755 81 80.20444 0 0.1 0 0 0 1 
i 10.70373 150.6444 0.5378755 84 78.9969 0 0.1 0 0 0 1 
i 11.43987 150.6444 0.5378755 93 80.20444 0 0.1 0 0 0 1 
i 3.520739 151.1397 0.5378755 46 71.29543 0 0.1 0 0 0 1 
i 7.625305 151.1397 0.5378755 58 71.29543 0 0.1 0 0 0 1 
i 8.116068 151.1397 0.5378755 59 72.10046 0 0.1 0 0 0 1 
i 6.353782 151.1823 0.5378755 75 78.59438 0 0.1 0 0 0 1 
i 7.58069 151.1823 0.5378755 83 80.60696 0 0.1 0 0 0 1 
i 10.45835 151.1823 0.5378755 86 78.59438 0 0.1 0 0 0 1 
i 11.68526 151.1823 1.353672 95 80.60696 0 0.1 0 0 0 1 
i 2.845939 151.9981 0.5378755 45 70.18784 0 0.1 0 0 0 1 
i 3.029976 151.9981 0.5378755 50 70.48973 0 0.1 0 0 0 1 
i 3.275357 151.9981 0.5378755 43 70.89224 0 0.1 0 0 0 1 
i 3.582084 151.9981 1.075751 38 71.39539 0 0.1 0 0 0 1 
i 3.766121 151.9981 0.5378755 58 71.69727 0 0.1 0 0 0 1 
i 4.072848 151.9981 0.5378755 53 72.20042 0 0.1 0 0 0 1 
i 4.318229 151.9981 0.5378755 60 72.60294 0 0.1 0 0 0 1 
i 4.502266 151.9981 0.5378755 66 72.90482 0 0.1 0 0 0 1 
i 6.950505 151.9981 0.5378755 57 70.18784 0 0.1 0 0 0 1 
i 7.134542 151.9981 0.5378755 62 70.48973 0 0.1 0 0 0 1 
i 7.379923 151.9981 0.5378755 54 70.89224 0 0.1 0 0 0 1 
i 7.68665 151.9981 0.5378755 49 71.39539 0 0.1 0 0 0 1 
i 7.870687 151.9981 1.075751 70 71.69727 0 0.1 0 0 0 1 
i 8.177414 151.9981 0.5378755 64 72.20042 0 0.1 0 0 0 1 
i 8.422795 151.9981 0.5378755 72 72.60294 0 0.1 0 0 0 1 
i 8.606832 151.9981 0.5378755 77 72.90482 0 0.1 0 0 0 1 
i 6.415127 152.0468 1.075751 74 78.69434 0 0.1 0 0 0 1 
i 6.599163 152.0468 1.075751 71 78.99623 0 0.1 0 0 0 1 
i 7.335308 152.0468 0.5378755 84 80.20377 0 0.1 0 0 0 1 
i 7.642036 152.0468 0.5378755 87 80.70692 0 0.1 0 0 0 1 
i 10.51969 152.0468 0.5378755 86 78.69434 0 0.1 0 0 0 1 
i 10.70373 152.0468 0.5378755 83 78.99623 0 0.1 0 0 0 1 
i 11.43987 152.0468 0.5378755 95 80.20377 0 0.1 0 0 0 1 
i 11.7466 152.0468 1.075751 98 80.70692 0 0.1 0 0 0 1 
i 2.784594 152.536 0.5378755 46 70.08721 0 0.1 0 0 0 1 
i 3.091321 152.536 0.5378755 51 70.59036 0 0.1 0 0 0 1 
i 3.336703 152.536 0.5378755 44 70.99287 0 0.1 0 0 0 1 
i 3.827466 152.536 0.5378755 59 71.7979 0 0.1 0 0 0 1 
i 4.011502 152.536 0.5378755 54 72.09979 0 0.1 0 0 0 1 
i 4.256884 152.536 0.5378755 61 72.50231 0 0.1 0 0 0 1 
i 4.563611 152.536 0.5378755 67 73.00545 0 0.1 0 0 0 1 
i 6.88916 152.536 0.5378755 58 70.08721 0 0.1 0 0 0 1 
i 7.195887 152.536 0.5378755 63 70.59036 0 0.1 0 0 0 1 
i 7.441269 152.536 0.5378755 55 70.99287 0 0.1 0 0 0 1 
i 7.625305 152.536 0.5378755 50 71.29476 0 0.1 0 0 0 1 
i 8.116068 152.536 0.5378755 65 72.09979 0 0.1 0 0 0 1 
i 8.36145 152.536 0.5378755 73 72.50231 0 0.1 0 0 0 1 
i 8.668177 152.536 0.5378755 78 73.00545 0 0.1 0 0 0 1 
i 7.396654 152.5846 0.5378755 83 80.3044 0 0.1 0 0 0 1 
i 7.58069 152.5846 0.5378755 86 80.60629 0 0.1 0 0 0 1 
i 10.45835 152.5846 0.5378755 85 78.59371 0 0.1 0 0 0 1 
i 10.76507 152.5846 0.5378755 82 79.09686 0 0.1 0 0 0 1 
i 11.50122 152.5846 1.381657 95 80.3044 0 0.1 0 0 0 1 
i 2.907285 153.4284 0.5378755 49 70.2878 0 0.1 0 0 0 1 
i 3.029976 153.4284 0.5378755 45 70.48906 0 0.1 0 0 0 1 
i 3.275357 153.4284 0.5378755 53 70.89157 0 0.1 0 0 0 1 
i 3.64343 153.4284 0.5378755 58 71.49535 0 0.1 0 0 0 1 
i 3.766121 153.4284 0.5378755 36 71.6966 0 0.1 0 0 0 1 
i 4.134193 153.4284 0.5378755 40 72.30038 0 0.1 0 0 0 1 
i 4.379575 153.4284 0.5378755 31 72.70289 0 0.1 0 0 0 1 
i 4.502266 153.4284 0.5378755 27 72.90415 0 0.1 0 0 0 1 
i 7.011851 153.4284 0.5378755 61 70.2878 0 0.1 0 0 0 1 
i 7.134542 153.4284 0.5378755 56 70.48906 0 0.1 0 0 0 1 
i 7.379923 153.4284 0.5378755 65 70.89157 0 0.1 0 0 0 1 
i 7.747996 153.4284 0.5378755 69 71.49535 0 0.1 0 0 0 1 
i 7.870687 153.4284 0.5378755 47 71.6966 0 0.1 0 0 0 1 
i 8.238759 153.4284 0.5378755 52 72.30038 0 0.1 0 0 0 1 
i 8.484141 153.4284 0.5378755 43 72.70289 0 0.1 0 0 0 1 
i 8.606832 153.4284 0.5378755 38 72.90415 0 0.1 0 0 0 1 
i 6.476473 153.4833 0.5378755 79 78.7943 0 0.1 0 0 0 1 
i 6.599163 153.4833 0.5378755 83 78.99556 0 0.1 0 0 0 1 
i 7.335308 153.4833 0.5378755 57 80.2031 0 0.1 0 0 0 1 
i 7.703381 153.4833 0.5378755 53 80.80688 0 0.1 0 0 0 1 
i 10.58104 153.4833 0.5378755 90 78.7943 0 0.1 0 0 0 1 
i 10.70373 153.4833 0.5378755 95 78.99556 0 0.1 0 0 0 1 
i 11.43987 153.4833 0.5378755 69 80.2031 0 0.1 0 0 0 1 
i 11.80795 153.4833 0.5378755 64 80.80688 0 0.1 0 0 0 1 
i 2.784594 153.9663 0.5378755 46 70.08654 0 0.1 0 0 0 1 
i 3.152666 153.9663 0.5378755 42 70.69031 0 0.1 0 0 0 1 
i 3.398048 153.9663 0.5378755 51 71.09283 0 0.1 0 0 0 1 
i 3.520739 153.9663 0.5378755 55 71.29409 0 0.1 0 0 0 1 
i 3.888811 153.9663 0.5378755 33 71.89786 0 0.1 0 0 0 1 
i 4.011502 153.9663 0.5378755 38 72.09912 0 0.1 0 0 0 1 
i 4.256884 153.9663 0.5378755 29 72.50164 0 0.1 0 0 0 1 
i 4.624956 153.9663 0.5378755 24 73.10541 0 0.1 0 0 0 1 
i 6.88916 153.9663 0.5378755 58 70.08654 0 0.1 0 0 0 1 
i 7.257232 153.9663 0.5378755 53 70.69031 0 0.1 0 0 0 1 
i 7.502614 153.9663 0.5378755 62 71.09283 0 0.1 0 0 0 1 
i 7.625305 153.9663 0.5378755 67 71.29409 0 0.1 0 0 0 1 
i 7.993377 153.9663 0.5378755 45 71.89786 0 0.1 0 0 0 1 
i 8.116068 153.9663 0.5378755 49 72.09912 0 0.1 0 0 0 1 
i 8.36145 153.9663 0.5378755 40 72.50164 0 0.1 0 0 0 1 
i 8.729522 153.9663 0.5378755 36 73.10541 0 0.1 0 0 0 1 
i 6.353782 154.0212 0.5378755 81 78.59304 0 0.1 0 0 0 1 
i 6.721854 154.0212 0.5378755 86 79.19681 0 0.1 0 0 0 1 
i 7.457999 154.0212 0.5378755 60 80.40436 0 0.1 0 0 0 1 
i 7.58069 154.0212 0.5378755 55 80.60562 0 0.1 0 0 0 1 
i 10.45835 154.0212 0.5378755 93 78.59304 0 0.1 0 0 0 1 
i 10.82642 154.0212 0.5378755 97 79.19681 0 0.1 0 0 0 1 
i 11.56257 154.0212 0.5378755 72 80.40436 0 0.1 0 0 0 1 
i 11.68526 154.0212 1.812768 67 80.60562 0 0.1 0 0 0 1 
i 2.845939 154.7582 1.075751 47 70.1865 0 0.1 0 0 0 1 
i 3.582084 154.7582 1.075751 46 71.39405 0 0.1 0 0 0 1 
i 3.766121 154.7582 1.075751 48 71.69593 0 0.1 0 0 0 1 
i 4.502266 154.7582 1.075751 49 72.90348 0 0.1 0 0 0 1 
i 6.950505 154.7582 1.075751 59 70.1865 0 0.1 0 0 0 1 
i 7.011851 154.7582 1.075751 58 70.28713 0 0.1 0 0 0 1 
i 7.56396 154.7582 1.075751 58 71.19279 0 0.1 0 0 0 1 
i 7.870687 154.7582 1.075751 59 71.69593 0 0.1 0 0 0 1 
i 8.054723 154.7582 1.075751 60 71.99782 0 0.1 0 0 0 1 
i 8.606832 154.7582 1.075751 60 72.90348 0 0.1 0 0 0 1 
i 6.415127 154.8189 0.5378755 71 78.693 0 0.1 0 0 0 1 
i 6.476473 154.8189 0.5378755 73 78.79363 0 0.1 0 0 0 1 
i 6.599163 154.8189 1.075751 70 78.99488 0 0.1 0 0 0 1 
i 6.7832 154.8189 0.5378755 68 79.29677 0 0.1 0 0 0 1 
i 7.335308 154.8189 1.075751 87 80.20243 0 0.1 0 0 0 1 
i 7.519345 154.8189 0.5378755 86 80.50432 0 0.1 0 0 0 1 
i 7.642036 154.8189 0.5378755 89 80.70558 0 0.1 0 0 0 1 
i 7.703381 154.8189 1.075751 90 80.80621 0 0.1 0 0 0 1 
i 10.51969 154.8189 0.5378755 83 78.693 0 0.1 0 0 0 1 
i 10.58104 154.8189 0.5378755 84 78.79363 0 0.1 0 0 0 1 
i 10.70373 154.8189 0.5378755 81 78.99488 0 0.1 0 0 0 1 
i 10.88777 154.8189 1.075751 80 79.29677 0 0.1 0 0 0 1 
i 11.43987 154.8189 0.5378755 99 80.20243 0 0.1 0 0 0 1 
i 11.62391 154.8189 0.5378755 97 80.50432 0 0.1 0 0 0 1 
i 11.7466 154.8189 1.075751 100 80.70558 0 0.1 0 0 0 1 
i 11.80795 154.8189 0.5378755 102 80.80621 0 0.1 0 0 0 1 
i 3.336703 155.2961 0.5378755 46 70.99153 0 0.1 0 0 0 1 
i 4.195539 155.2961 0.5378755 47 72.40034 0 0.1 0 0 0 1 
i 6.353782 155.3568 0.5378755 72 78.59237 0 0.1 0 0 0 1 
i 6.537818 155.3568 0.5378755 73 78.89426 0 0.1 0 0 0 1 
i 6.721854 155.3568 0.5378755 69 79.19614 0 0.1 0 0 0 1 
i 7.396654 155.3568 0.5378755 88 80.30306 0 0.1 0 0 0 1 
i 7.764726 155.3568 0.5378755 91 80.90683 0 0.1 0 0 0 1 
i 10.45835 155.3568 0.5378755 83 78.59237 0 0.1 0 0 0 1 
i 10.64238 155.3568 0.5378755 85 78.89426 0 0.1 0 0 0 1 
i 10.76507 155.3568 0.5378755 82 79.09551 0 0.1 0 0 0 1 
i 11.56257 155.3568 0.5378755 98 80.40369 0 0.1 0 0 0 1 
i 11.68526 155.3568 0.5378755 101 80.60495 0 0.1 0 0 0 1 
i 11.86929 155.3568 1.859057 103 80.90683 0 0.1 0 0 0 1 
i 6.844545 156.678 0.5378755 79 79.39673 0 0.1 0 0 0 1 
i 7.335308 156.678 0.5378755 70 80.20176 0 0.1 0 0 0 1 
i 10.94911 156.678 0.5378755 91 79.39673 0 0.1 0 0 0 1 
i 11.43987 156.678 0.5378755 82 80.20176 0 0.1 0 0 0 1 
i 6.353782 157.2158 0.5378755 75 78.5917 0 0.1 0 0 0 1 
i 7.826072 157.2158 0.5378755 66 81.00679 0 0.1 0 0 0 1 
i 10.45835 157.2158 0.5378755 86 78.5917 0 0.1 0 0 0 1 
i 11.93064 157.2158 1.402355 77 81.00679 0 0.1 0 0 0 1 
i 6.415127 158.0803 0.5378755 74 78.69166 0 0.1 0 0 0 1 
i 6.844545 158.0803 0.5378755 79 79.39606 0 0.1 0 0 0 1 
i 7.335308 158.0803 0.5378755 71 80.20109 0 0.1 0 0 0 1 
i 7.887417 158.0803 0.5378755 66 81.10675 0 0.1 0 0 0 1 
i 10.51969 158.0803 0.5378755 86 78.69166 0 0.1 0 0 0 1 
i 10.94911 158.0803 1.075751 91 79.39606 0 0.1 0 0 0 1 
i 11.43987 158.0803 0.5378755 83 80.20109 0 0.1 0 0 0 1 
i 11.99198 158.0803 1.075751 78 81.10675 0 0.1 0 0 0 1 
i 6.353782 158.6182 0.5378755 75 78.59103 0 0.1 0 0 0 1 
i 6.905891 158.6182 0.5378755 80 79.49669 0 0.1 0 0 0 1 
i 7.396654 158.6182 0.5378755 72 80.30172 0 0.1 0 0 0 1 
i 7.826072 158.6182 0.5378755 67 81.00612 0 0.1 0 0 0 1 
i 10.45835 158.6182 0.5378755 86 78.59103 0 0.1 0 0 0 1 
i 11.50122 158.6182 1.436559 83 80.30172 0 0.1 0 0 0 1 
i 6.476473 159.5169 0.5378755 80 78.79161 0 0.1 0 0 0 1 
i 6.844545 159.5169 0.5378755 68 79.39539 0 0.1 0 0 0 1 
i 7.335308 159.5169 0.5378755 86 80.20042 0 0.1 0 0 0 1 
i 7.948763 159.5169 0.5378755 98 81.20671 0 0.1 0 0 0 1 
i 10.58104 159.5169 0.5378755 91 78.79161 0 0.1 0 0 0 1 
i 10.94911 159.5169 0.5378755 80 79.39539 0 0.1 0 0 0 1 
i 11.43987 159.5169 0.5378755 98 80.20042 0 0.1 0 0 0 1 
i 12.05333 159.5169 0.5378755 109 81.20671 0 0.1 0 0 0 1 
i 6.353782 160.0548 0.5378755 77 78.59036 0 0.1 0 0 0 1 
i 6.967236 160.0548 0.5378755 65 79.59665 0 0.1 0 0 0 1 
i 7.457999 160.0548 0.5378755 84 80.40168 0 0.1 0 0 0 1 
i 7.826072 160.0548 0.5378755 95 81.00545 0 0.1 0 0 0 1 
i 10.45835 160.0548 0.5378755 88 78.59036 0 0.1 0 0 0 1 
i 11.0718 160.0548 0.5378755 77 79.59665 0 0.1 0 0 0 1 
i 11.56257 160.0548 0.5378755 95 80.40168 0 0.1 0 0 0 1 
i 11.93064 160.0548 1.335576 107 81.00545 0 0.1 0 0 0 1 
i 6.415127 160.8525 0.5378755 74 78.69031 0 0.1 0 0 0 1 
i 6.476473 160.8525 1.075751 73 78.79094 0 0.1 0 0 0 1 
i 6.844545 160.8525 0.5378755 82 79.39472 0 0.1 0 0 0 1 
i 7.028581 160.8525 0.5378755 84 79.6966 0 0.1 0 0 0 1 
i 7.335308 160.8525 0.5378755 69 80.19975 0 0.1 0 0 0 1 
i 7.519345 160.8525 0.5378755 70 80.50164 0 0.1 0 0 0 1 
i 7.887417 160.8525 0.5378755 61 81.10541 0 0.1 0 0 0 1 
i 7.948763 160.8525 0.5378755 59 81.20604 0 0.1 0 0 0 1 
i 10.51969 160.8525 0.5378755 86 78.69031 0 0.1 0 0 0 1 
i 10.58104 160.8525 0.5378755 84 78.79094 0 0.1 0 0 0 1 
i 10.94911 160.8525 1.075751 94 79.39472 0 0.1 0 0 0 1 
i 11.13315 160.8525 0.5378755 95 79.6966 0 0.1 0 0 0 1 
i 11.43987 160.8525 0.5378755 80 80.19975 0 0.1 0 0 0 1 
i 11.62391 160.8525 0.5378755 82 80.50164 0 0.1 0 0 0 1 
i 11.99198 160.8525 0.5378755 72 81.10541 0 0.1 0 0 0 1 
i 12.05333 160.8525 1.075751 71 81.20604 0 0.1 0 0 0 1 
i 6.537818 161.3903 0.5378755 72 78.89157 0 0.1 0 0 0 1 
i 6.905891 161.3903 0.5378755 81 79.49535 0 0.1 0 0 0 1 
i 6.967236 161.3903 0.5378755 83 79.59597 0 0.1 0 0 0 1 
i 7.396654 161.3903 0.5378755 68 80.30038 0 0.1 0 0 0 1 
i 7.457999 161.3903 0.5378755 70 80.40101 0 0.1 0 0 0 1 
i 7.826072 161.3903 0.5378755 60 81.00478 0 0.1 0 0 0 1 
i 8.010108 161.3903 0.5378755 58 81.30667 0 0.1 0 0 0 1 
i 10.45835 161.3903 0.5378755 85 78.58969 0 0.1 0 0 0 1 
i 10.64238 161.3903 0.5378755 83 78.89157 0 0.1 0 0 0 1 
i 11.01046 161.3903 0.5378755 93 79.49535 0 0.1 0 0 0 1 
i 11.50122 161.3903 0.5378755 79 80.30038 0 0.1 0 0 0 1 
i 11.56257 161.3903 0.5378755 81 80.40101 0 0.1 0 0 0 1 
i 12.11467 161.3903 1.537542 70 81.30667 0 0.1 0 0 0 1 
i 6.599163 162.39 0.5378755 76 78.99153 0 0.1 0 0 0 1 
i 6.844545 162.39 1.075751 75 79.39405 0 0.1 0 0 0 1 
i 7.335308 162.39 0.5378755 77 80.19908 0 0.1 0 0 0 1 
i 8.071453 162.39 1.075751 77 81.40662 0 0.1 0 0 0 1 
i 10.70373 162.39 0.5378755 87 78.99153 0 0.1 0 0 0 1 
i 11.43987 162.39 0.5378755 88 80.19908 0 0.1 0 0 0 1 
i 12.17602 162.39 0.5378755 89 81.40662 0 0.1 0 0 0 1 
i 6.353782 162.9279 0.5378755 75 78.58901 0 0.1 0 0 0 1 
i 7.58069 162.9279 0.5378755 76 80.60159 0 0.1 0 0 0 1 
i 10.45835 162.9279 0.5378755 87 78.58901 0 0.1 0 0 0 1 
i 11.19449 162.9279 0.5378755 86 79.79656 0 0.1 0 0 0 1 
i 11.68526 162.9279 1.335576 88 80.60159 0 0.1 0 0 0 1 
i 6.415127 163.7256 0.5378755 74 78.68897 0 0.1 0 0 0 1 
i 6.599163 163.7256 0.5378755 79 78.99086 0 0.1 0 0 0 1 
i 6.844545 163.7256 0.5378755 71 79.39338 0 0.1 0 0 0 1 
i 7.151272 163.7256 0.5378755 66 79.89652 0 0.1 0 0 0 1 
i 7.335308 163.7256 0.5378755 87 80.19841 0 0.1 0 0 0 1 
i 7.642036 163.7256 0.5378755 81 80.70155 0 0.1 0 0 0 1 
i 7.887417 163.7256 0.5378755 89 81.10407 0 0.1 0 0 0 1 
i 8.071453 163.7256 0.5378755 94 81.40595 0 0.1 0 0 0 1 
i 10.51969 163.7256 0.5378755 85 78.68897 0 0.1 0 0 0 1 
i 10.70373 163.7256 0.5378755 90 78.99086 0 0.1 0 0 0 1 
i 10.94911 163.7256 0.5378755 83 79.39338 0 0.1 0 0 0 1 
i 11.25584 163.7256 0.5378755 78 79.89652 0 0.1 0 0 0 1 
i 11.43987 163.7256 0.5378755 98 80.19841 0 0.1 0 0 0 1 
i 11.7466 163.7256 0.5378755 93 80.70155 0 0.1 0 0 0 1 
i 11.99198 163.7256 0.5378755 101 81.10407 0 0.1 0 0 0 1 
i 12.17602 163.7256 0.5378755 106 81.40595 0 0.1 0 0 0 1 
i 6.353782 164.2635 0.5378755 75 78.58834 0 0.1 0 0 0 1 
i 6.660509 164.2635 0.5378755 80 79.09149 0 0.1 0 0 0 1 
i 6.905891 164.2635 0.5378755 72 79.494 0 0.1 0 0 0 1 
i 7.089927 164.2635 0.5378755 67 79.79589 0 0.1 0 0 0 1 
i 7.396654 164.2635 0.5378755 88 80.29904 0 0.1 0 0 0 1 
i 7.58069 164.2635 0.5378755 82 80.60092 0 0.1 0 0 0 1 
i 7.826072 164.2635 0.5378755 90 81.00344 0 0.1 0 0 0 1 
i 8.132799 164.2635 0.5378755 95 81.50658 0 0.1 0 0 0 1 
i 10.45835 164.2635 0.5378755 86 78.58834 0 0.1 0 0 0 1 
i 10.76507 164.2635 0.5378755 91 79.09149 0 0.1 0 0 0 1 
i 11.01046 164.2635 0.5378755 84 79.494 0 0.1 0 0 0 1 
i 11.19449 164.2635 0.5378755 79 79.79589 0 0.1 0 0 0 1 
i 11.50122 164.2635 0.5378755 99 80.29904 0 0.1 0 0 0 1 
i 11.68526 164.2635 0.5378755 94 80.60092 0 0.1 0 0 0 1 
i 11.93064 164.2635 0.5378755 102 81.00344 0 0.1 0 0 0 1 
i 12.23736 164.2635 0.5378755 107 81.50658 0 0.1 0 0 0 1 
i 2.784594 164.5532 0.7171673 48 70.06373 0 0.1 0 0 0 1 
i 10.99373 164.5532 0.7171673 71 70.06373 0 0.1 0 0 0 1 
i 6.476473 165.0937 0.5378755 78 78.78893 0 0.1 0 0 0 1 
i 6.599163 165.0937 0.5378755 73 78.99019 0 0.1 0 0 0 1 
i 6.844545 165.0937 0.5378755 82 79.3927 0 0.1 0 0 0 1 
i 7.212618 165.0937 0.5378755 86 79.99648 0 0.1 0 0 0 1 
i 7.335308 165.0937 0.5378755 64 80.19774 0 0.1 0 0 0 1 
i 7.703381 165.0937 0.5378755 69 80.80151 0 0.1 0 0 0 1 
i 7.948763 165.0937 0.5378755 60 81.20403 0 0.1 0 0 0 1 
i 8.071453 165.0937 0.5378755 56 81.40528 0 0.1 0 0 0 1 
i 10.58104 165.0937 0.5378755 89 78.78893 0 0.1 0 0 0 1 
i 10.70373 165.0937 0.5378755 85 78.99019 0 0.1 0 0 0 1 
i 10.94911 165.0937 0.5378755 93 79.3927 0 0.1 0 0 0 1 
i 11.31718 165.0937 0.5378755 98 79.99648 0 0.1 0 0 0 1 
i 11.43987 165.0937 0.5378755 76 80.19774 0 0.1 0 0 0 1 
i 11.80795 165.0937 0.5378755 80 80.80151 0 0.1 0 0 0 1 
i 12.05333 165.0937 0.5378755 71 81.20403 0 0.1 0 0 0 1 
i 12.17602 165.0937 0.5378755 67 81.40528 0 0.1 0 0 0 1 
i 2.845939 165.4524 1.434335 49 70.16369 0 0.1 0 0 0 1 
i 11.05507 165.4524 1.434335 72 70.16369 0 0.1 0 0 0 1 
i 6.353782 165.6316 0.5378755 75 78.58767 0 0.1 0 0 0 1 
i 6.721854 165.6316 0.5378755 71 79.19145 0 0.1 0 0 0 1 
i 6.967236 165.6316 0.5378755 79 79.59396 0 0.1 0 0 0 1 
i 7.089927 165.6316 0.5378755 84 79.79522 0 0.1 0 0 0 1 
i 7.457999 165.6316 0.5378755 62 80.39899 0 0.1 0 0 0 1 
i 7.58069 165.6316 0.5378755 66 80.60025 0 0.1 0 0 0 1 
i 7.826072 165.6316 0.5378755 57 81.00277 0 0.1 0 0 0 1 
i 8.194144 165.6316 0.5378755 53 81.60654 0 0.1 0 0 0 1 
i 10.45835 165.6316 0.5378755 86 78.58767 0 0.1 0 0 0 1 
i 10.82642 165.6316 0.5378755 82 79.19145 0 0.1 0 0 0 1 
i 11.0718 165.6316 0.5378755 91 79.59396 0 0.1 0 0 0 1 
i 11.19449 165.6316 0.5378755 95 79.79522 0 0.1 0 0 0 1 
i 11.56257 165.6316 0.5378755 73 80.39899 0 0.1 0 0 0 1 
i 11.68526 165.6316 0.5378755 78 80.60025 0 0.1 0 0 0 1 
i 11.93064 165.6316 0.5378755 69 81.00277 0 0.1 0 0 0 1 
i 12.29871 165.6316 1.809853 64 81.60654 0 0.1 0 0 0 1 
i 6.415127 166.3657 1.075751 76 78.68763 0 0.1 0 0 0 1 
i 6.476473 166.3657 0.5378755 75 78.78826 0 0.1 0 0 0 1 
i 6.599163 166.3657 1.075751 76 78.98952 0 0.1 0 0 0 1 
i 6.844545 166.3657 1.075751 75 79.39203 0 0.1 0 0 0 1 
i 7.519345 166.3657 1.075751 77 80.49895 0 0.1 0 0 0 1 
i 7.642036 166.3657 1.075751 76 80.70021 0 0.1 0 0 0 1 
i 10.51969 166.3657 1.075751 87 78.68763 0 0.1 0 0 0 1 
i 11.25584 166.3657 1.075751 86 79.89518 0 0.1 0 0 0 1 
i 11.43987 166.3657 0.5378755 88 80.19706 0 0.1 0 0 0 1 
i 11.62391 166.3657 1.075751 88 80.49895 0 0.1 0 0 0 1 
i 11.99198 166.3657 1.075751 89 81.10273 0 0.1 0 0 0 1 
i 7.457999 166.9036 0.5378755 77 80.39832 0 0.1 0 0 0 1 
i 10.45835 166.9036 0.5378755 87 78.587 0 0.1 0 0 0 1 
i 2.907285 167.1082 0.7171673 51 70.26365 0 0.1 0 0 0 1 
i 11.11642 167.1082 0.7171673 74 70.26365 0 0.1 0 0 0 1 
i 2.784594 167.8253 0.7171673 49 70.06239 0 0.1 0 0 0 1 
i 10.99373 167.8253 1.539404 72 70.06239 0 0.1 0 0 0 1 
i 2.845939 168.6476 0.7171673 50 70.16235 0 0.1 0 0 0 1 
i 2.907285 168.6476 1.434335 51 70.26298 0 0.1 0 0 0 1 
i 11.05507 168.6476 0.7171673 73 70.16235 0 0.1 0 0 0 1 
i 11.11642 168.6476 1.434335 74 70.26298 0 0.1 0 0 0 1 
i 2.96863 169.3647 0.7171673 52 70.36361 0 0.1 0 0 0 1 
i 11.17776 169.3647 1.772191 75 70.36361 0 0.1 0 0 0 1 
i 3.029976 170.4198 0.7171673 52 70.46356 0 0.1 0 0 0 1 
i 2.784594 171.1369 0.7171673 50 70.06105 0 0.1 0 0 0 1 
i 10.99373 171.1369 2.256571 73 70.06105 0 0.1 0 0 0 1 
i 2.845939 171.9592 1.434335 50 70.16101 0 0.1 0 0 0 1 
i 3.029976 171.9592 0.7171673 53 70.46289 0 0.1 0 0 0 1 
i 11.23911 171.9592 0.7171673 76 70.46289 0 0.1 0 0 0 1 
i 3.091321 172.6763 0.7171673 54 70.56352 0 0.1 0 0 0 1 
i 11.30045 172.6763 2.294117 77 70.56352 0 0.1 0 0 0 1 
i 2.907285 173.5361 0.7171673 51 70.26096 0 0.1 0 0 0 1 
i 3.029976 173.5361 0.7171673 53 70.46222 0 0.1 0 0 0 1 
i 11.11642 173.5361 0.7171673 74 70.26096 0 0.1 0 0 0 1 
i 11.23911 173.5361 0.7171673 76 70.46222 0 0.1 0 0 0 1 
i 4.569188 174.1237 0.7171673 62 74.3143 0 0.1 0 0 0 1 
i 12.77832 174.1237 0.7171673 85 74.3143 0 0.1 0 0 0 1 
i 2.784594 174.2533 0.7171673 52 70.05971 0 0.1 0 0 0 1 
i 3.152666 174.2533 0.7171673 54 70.66348 0 0.1 0 0 0 1 
i 10.99373 174.2533 0.7171673 75 70.05971 0 0.1 0 0 0 1 
i 4.630533 174.9526 0.7171673 64 74.41426 0 0.1 0 0 0 1 
i 12.83967 174.9526 0.7171673 87 74.41426 0 0.1 0 0 0 1 
i 2.845939 175.0022 1.434335 53 70.15966 0 0.1 0 0 0 1 
i 2.907285 175.0022 1.434335 52 70.26029 0 0.1 0 0 0 1 
i 3.029976 175.0022 0.7171673 54 70.46155 0 0.1 0 0 0 1 
i 3.214012 175.0022 1.434335 55 70.76344 0 0.1 0 0 0 1 
i 11.05507 175.0022 1.434335 76 70.15966 0 0.1 0 0 0 1 
i 11.11642 175.0022 1.434335 75 70.26029 0 0.1 0 0 0 1 
i 11.23911 175.0022 0.7171673 77 70.46155 0 0.1 0 0 0 1 
i 11.42314 175.0022 1.434335 78 70.76344 0 0.1 0 0 0 1 
i 4.569188 175.6698 0.7171673 63 74.31363 0 0.1 0 0 0 1 
i 12.77832 175.6698 0.7171673 86 74.31363 0 0.1 0 0 0 1 
i 2.96863 175.7194 0.7171673 51 70.36092 0 0.1 0 0 0 1 
i 11.17776 175.7194 1.534194 74 70.36092 0 0.1 0 0 0 1 
i 4.691879 176.5364 0.7171673 65 74.51421 0 0.1 0 0 0 1 
i 12.90101 176.5364 0.7171673 88 74.51421 0 0.1 0 0 0 1 
i 3.275357 177.0429 0.7171673 54 70.8634 0 0.1 0 0 0 1 
i 11.48449 177.0429 0.7171673 77 70.8634 0 0.1 0 0 0 1 
i 4.569188 177.2536 0.7171673 63 74.31296 0 0.1 0 0 0 1 
i 12.77832 177.2536 0.7171673 86 74.31296 0 0.1 0 0 0 1 
i 2.784594 177.7601 0.7171673 49 70.05836 0 0.1 0 0 0 1 
i 10.99373 177.7601 0.7171673 72 70.05836 0 0.1 0 0 0 1 
i 4.630533 178.0089 0.7171673 64 74.41291 0 0.1 0 0 0 1 
i 4.691879 178.0089 1.434335 66 74.51354 0 0.1 0 0 0 1 
i 12.83967 178.0089 0.7171673 87 74.41291 0 0.1 0 0 0 1 
i 12.90101 178.0089 1.434335 89 74.51354 0 0.1 0 0 0 1 
i 2.845939 178.5824 1.434335 49 70.15832 0 0.1 0 0 0 1 
i 3.275357 178.5824 1.434335 55 70.86273 0 0.1 0 0 0 1 
i 11.05507 178.5824 1.434335 72 70.15832 0 0.1 0 0 0 1 
i 11.48449 178.5824 0.7171673 78 70.86273 0 0.1 0 0 0 1 
i 4.569188 178.726 0.7171673 65 74.31229 0 0.1 0 0 0 1 
i 12.77832 178.726 0.7171673 88 74.31229 0 0.1 0 0 0 1 
i 11.54583 179.2995 0.7171673 78 70.96335 0 0.1 0 0 0 1 
i 4.81457 179.704 0.7171673 66 74.71413 0 0.1 0 0 0 1 
i 13.0237 179.704 0.7171673 89 74.71413 0 0.1 0 0 0 1 
i 2.907285 180.1593 0.7171673 49 70.25828 0 0.1 0 0 0 1 
i 3.275357 180.1593 0.7171673 55 70.86205 0 0.1 0 0 0 1 
i 11.11642 180.1593 0.7171673 72 70.25828 0 0.1 0 0 0 1 
i 11.48449 180.1593 0.7171673 78 70.86205 0 0.1 0 0 0 1 
i 4.569188 180.4212 0.7171673 64 74.31161 0 0.1 0 0 0 1 
i 12.77832 180.4212 0.7171673 87 74.31161 0 0.1 0 0 0 1 
i 2.784594 180.8765 0.7171673 50 70.05702 0 0.1 0 0 0 1 
i 3.398048 180.8765 0.7171673 56 71.06331 0 0.1 0 0 0 1 
i 10.99373 180.8765 0.7171673 73 70.05702 0 0.1 0 0 0 1 
i 11.60718 180.8765 0.7171673 79 71.06331 0 0.1 0 0 0 1 
i 4.630533 181.1765 0.7171673 64 74.41157 0 0.1 0 0 0 1 
i 4.81457 181.1765 0.7171673 67 74.71346 0 0.1 0 0 0 1 
i 12.83967 181.1765 0.7171673 87 74.41157 0 0.1 0 0 0 1 
i 13.0237 181.1765 0.7171673 90 74.71346 0 0.1 0 0 0 1 
i 2.845939 181.6254 1.434335 50 70.15698 0 0.1 0 0 0 1 
i 2.907285 181.6254 0.7171673 49 70.25761 0 0.1 0 0 0 1 
i 3.275357 181.6254 1.434335 56 70.86138 0 0.1 0 0 0 1 
i 3.459394 181.6254 0.7171673 57 71.16327 0 0.1 0 0 0 1 
i 11.05507 181.6254 1.434335 73 70.15698 0 0.1 0 0 0 1 
i 11.11642 181.6254 0.7171673 72 70.25761 0 0.1 0 0 0 1 
i 11.48449 181.6254 0.7171673 79 70.86138 0 0.1 0 0 0 1 
i 11.66853 181.6254 0.7171673 80 71.16327 0 0.1 0 0 0 1 
i 4.569188 181.8937 0.7171673 65 74.31094 0 0.1 0 0 0 1 
i 4.875915 181.8937 0.7171673 68 74.81409 0 0.1 0 0 0 1 
i 12.77832 181.8937 0.7171673 88 74.31094 0 0.1 0 0 0 1 
i 13.08505 181.8937 0.7171673 91 74.81409 0 0.1 0 0 0 1 
i 2.96863 182.3426 0.7171673 48 70.35824 0 0.1 0 0 0 1 
i 3.336703 182.3426 0.7171673 55 70.96201 0 0.1 0 0 0 1 
i 11.17776 182.3426 0.7171673 71 70.35824 0 0.1 0 0 0 1 
i 11.54583 182.3426 0.7171673 78 70.96201 0 0.1 0 0 0 1 
i 11.60718 182.3426 0.7171673 79 71.06264 0 0.1 0 0 0 1 
i 4.691879 182.6849 0.7171673 65 74.51153 0 0.1 0 0 0 1 
i 4.81457 182.6849 0.7171673 67 74.71279 0 0.1 0 0 0 1 
i 12.90101 182.6849 0.7171673 88 74.51153 0 0.1 0 0 0 1 
i 13.0237 182.6849 0.7171673 90 74.71279 0 0.1 0 0 0 1 
i 3.029976 183.3132 0.7171673 49 70.4582 0 0.1 0 0 0 1 
i 3.275357 183.3132 0.7171673 54 70.86071 0 0.1 0 0 0 1 
i 11.23911 183.3132 0.7171673 72 70.4582 0 0.1 0 0 0 1 
i 11.48449 183.3132 0.7171673 77 70.86071 0 0.1 0 0 0 1 
i 4.569188 183.402 1.402355 66 74.31027 0 0.1 0 0 0 1 
i 4.93726 183.402 0.7171673 69 74.91405 0 0.1 0 0 0 1 
i 12.77832 183.402 1.402355 89 74.31027 0 0.1 0 0 0 1 
i 13.14639 183.402 0.7171673 92 74.91405 0 0.1 0 0 0 1 
i 2.784594 184.0304 0.7171673 52 70.05568 0 0.1 0 0 0 1 
i 3.520739 184.0304 0.7171673 57 71.26323 0 0.1 0 0 0 1 
i 10.99373 184.0304 0.7171673 75 70.05568 0 0.1 0 0 0 1 
i 11.72987 184.0304 0.7171673 80 71.26323 0 0.1 0 0 0 1 
i 4.630533 184.0872 1.434335 67 74.41023 0 0.1 0 0 0 1 
i 4.81457 184.0872 1.434335 68 74.71212 0 0.1 0 0 0 1 
i 4.998606 184.0872 0.7171673 70 75.014 0 0.1 0 0 0 1 
i 12.83967 184.0872 1.434335 90 74.41023 0 0.1 0 0 0 1 
i 13.0237 184.0872 1.434335 91 74.71212 0 0.1 0 0 0 1 
i 13.20774 184.0872 0.7171673 93 75.014 0 0.1 0 0 0 1 
i 1 184.4227 0.5378755 53 70.06373 0 0.1 0 0 0 1 
i 9.209132 184.4227 0.5378755 76 70.06373 0 0.1 0 0 0 1 
i 2.845939 184.7793 0.7171673 53 70.15564 0 0.1 0 0 0 1 
i 3.029976 184.7793 0.7171673 50 70.45753 0 0.1 0 0 0 1 
i 3.275357 184.7793 0.7171673 55 70.86004 0 0.1 0 0 0 1 
i 3.582084 184.7793 0.7171673 58 71.36319 0 0.1 0 0 0 1 
i 11.05507 184.7793 0.7171673 76 70.15564 0 0.1 0 0 0 1 
i 11.23911 184.7793 0.7171673 73 70.45753 0 0.1 0 0 0 1 
i 11.48449 184.7793 0.7171673 78 70.86004 0 0.1 0 0 0 1 
i 11.79122 184.7793 0.7171673 81 71.36319 0 0.1 0 0 0 1 
i 4.753224 184.8044 0.7171673 65 74.61149 0 0.1 0 0 0 1 
i 4.93726 184.8044 0.7171673 69 74.91338 0 0.1 0 0 0 1 
i 12.96236 184.8044 0.7171673 88 74.61149 0 0.1 0 0 0 1 
i 13.14639 184.8044 0.7171673 92 74.91338 0 0.1 0 0 0 1 
i 2.784594 185.4965 0.7171673 52 70.05501 0 0.1 0 0 0 1 
i 3.091321 185.4965 0.7171673 49 70.55816 0 0.1 0 0 0 1 
i 3.336703 185.4965 0.7171673 54 70.96067 0 0.1 0 0 0 1 
i 3.520739 185.4965 0.7171673 57 71.26256 0 0.1 0 0 0 1 
i 10.99373 185.4965 0.7171673 75 70.05501 0 0.1 0 0 0 1 
i 11.30045 185.4965 0.7171673 72 70.55816 0 0.1 0 0 0 1 
i 11.54583 185.4965 0.7171673 77 70.96067 0 0.1 0 0 0 1 
i 11.72987 185.4965 0.7171673 80 71.26256 0 0.1 0 0 0 1 
i 1.061345 185.5012 1.075751 55 70.16369 0 0.1 0 0 0 1 
i 9.270478 185.5012 1.075751 78 70.16369 0 0.1 0 0 0 1 
i 5.059951 186.0392 0.7171673 68 75.11396 0 0.1 0 0 0 1 
i 13.26908 186.0392 0.7171673 91 75.11396 0 0.1 0 0 0 1 
i 2.907285 186.2812 0.7171673 53 70.2556 0 0.1 0 0 0 1 
i 3.029976 186.2812 0.7171673 51 70.45686 0 0.1 0 0 0 1 
i 3.275357 186.2812 0.7171673 56 70.85937 0 0.1 0 0 0 1 
i 3.64343 186.2812 0.7171673 58 71.46314 0 0.1 0 0 0 1 
i 11.11642 186.2812 0.7171673 76 70.2556 0 0.1 0 0 0 1 
i 11.23911 186.2812 0.7171673 74 70.45686 0 0.1 0 0 0 1 
i 11.48449 186.2812 0.7171673 79 70.85937 0 0.1 0 0 0 1 
i 11.85256 186.2812 0.7171673 81 71.46314 0 0.1 0 0 0 1 
i 4.569188 186.7564 0.7171673 63 74.30893 0 0.1 0 0 0 1 
i 12.77832 186.7564 0.7171673 86 74.30893 0 0.1 0 0 0 1 
i 2.784594 186.9983 2.113452 52 70.05434 0 0.1 0 0 0 1 
i 3.152666 186.9983 2.113452 50 70.65811 0 0.1 0 0 0 1 
i 3.398048 186.9983 2.113452 54 71.06063 0 0.1 0 0 0 1 
i 3.520739 186.9983 2.113452 57 71.26189 0 0.1 0 0 0 1 
i 10.99373 186.9983 2.113452 75 70.05434 0 0.1 0 0 0 1 
i 11.3618 186.9983 2.113452 73 70.65811 0 0.1 0 0 0 1 
i 11.60718 186.9983 1.396284 77 71.06063 0 0.1 0 0 0 1 
i 11.72987 186.9983 2.113452 80 71.26189 0 0.1 0 0 0 1 
i 1.122691 187.157 0.5378755 56 70.26365 0 0.1 0 0 0 1 
i 9.331823 187.157 0.5378755 79 70.26365 0 0.1 0 0 0 1 
i 4.630533 187.5117 1.434335 63 74.40889 0 0.1 0 0 0 1 
i 5.059951 187.5117 1.434335 69 75.11329 0 0.1 0 0 0 1 
i 12.83967 187.5117 1.434335 86 74.40889 0 0.1 0 0 0 1 
i 13.26908 187.5117 1.434335 92 75.11329 0 0.1 0 0 0 1 
i 2.907285 187.6774 1.434335 53 70.25493 0 0.1 0 0 0 1 
i 3.029976 187.6774 0.7171673 51 70.45618 0 0.1 0 0 0 1 
i 3.275357 187.6774 1.434335 56 70.8587 0 0.1 0 0 0 1 
i 3.64343 187.6774 0.7171673 58 71.46247 0 0.1 0 0 0 1 
i 11.11642 187.6774 1.434335 76 70.25493 0 0.1 0 0 0 1 
i 11.23911 187.6774 0.7171673 74 70.45618 0 0.1 0 0 0 1 
i 11.48449 187.6774 0.7171673 79 70.8587 0 0.1 0 0 0 1 
i 11.85256 187.6774 0.7171673 81 71.46247 0 0.1 0 0 0 1 
i 1 187.6949 0.5378755 55 70.06239 0 0.1 0 0 0 1 
i 9.209132 187.6949 1.416876 78 70.06239 0 0.1 0 0 0 1 
i 3.398048 188.3946 0.7171673 55 71.05996 0 0.1 0 0 0 1 
i 3.704775 188.3946 0.7171673 59 71.5631 0 0.1 0 0 0 1 
i 11.17776 188.3946 0.7171673 77 70.35556 0 0.1 0 0 0 1 
i 11.54583 188.3946 0.7171673 79 70.95933 0 0.1 0 0 0 1 
i 11.60718 188.3946 0.7171673 78 71.05996 0 0.1 0 0 0 1 
i 11.91391 188.3946 0.7171673 82 71.5631 0 0.1 0 0 0 1 
i 1.061345 188.6964 1.075751 56 70.16235 0 0.1 0 0 0 1 
i 1.122691 188.6964 1.075751 57 70.26298 0 0.1 0 0 0 1 
i 9.270478 188.6964 1.075751 79 70.16235 0 0.1 0 0 0 1 
i 9.331823 188.6964 1.075751 80 70.26298 0 0.1 0 0 0 1 
i 4.691879 189.0201 0.7171673 63 74.50885 0 0.1 0 0 0 1 
i 5.059951 189.0201 0.7171673 69 75.11262 0 0.1 0 0 0 1 
i 12.90101 189.0201 0.7171673 86 74.50885 0 0.1 0 0 0 1 
i 13.26908 189.0201 0.7171673 92 75.11262 0 0.1 0 0 0 1 
i 4.569188 189.7373 2.119523 64 74.30759 0 0.1 0 0 0 1 
i 5.182642 189.7373 1.402355 70 75.31388 0 0.1 0 0 0 1 
i 12.77832 189.7373 2.119523 87 74.30759 0 0.1 0 0 0 1 
i 13.39177 189.7373 1.402355 93 75.31388 0 0.1 0 0 0 1 
i 3.766121 190.2893 0.7171673 54 71.66306 0 0.1 0 0 0 1 
i 11.97525 190.2893 0.7171673 77 71.66306 0 0.1 0 0 0 1 
i 4.691879 190.4225 1.434335 63 74.50818 0 0.1 0 0 0 1 
i 5.243987 190.4225 1.434335 71 75.41384 0 0.1 0 0 0 1 
i 12.90101 190.4225 1.434335 86 74.50818 0 0.1 0 0 0 1 
i 13.45312 190.4225 1.434335 94 75.41384 0 0.1 0 0 0 1 
i 1.245382 190.4686 0.5378755 58 70.46356 0 0.1 0 0 0 1 
i 9.454514 190.4686 0.5378755 81 70.46356 0 0.1 0 0 0 1 
i 1 191.0065 0.5378755 55 70.06105 0 0.1 0 0 0 1 
i 2.784594 191.0065 0.7171673 46 70.053 0 0.1 0 0 0 1 
i 9.209132 191.0065 0.5378755 78 70.06105 0 0.1 0 0 0 1 
i 10.99373 191.0065 0.7171673 69 70.053 0 0.1 0 0 0 1 
i 5.121297 191.1396 0.7171673 69 75.21258 0 0.1 0 0 0 1 
i 13.33043 191.1396 0.7171673 92 75.21258 0 0.1 0 0 0 1 
i 2.845939 191.8287 0.7171673 44 70.15296 0 0.1 0 0 0 1 
i 3.766121 191.8287 0.7171673 54 71.66239 0 0.1 0 0 0 1 
i 11.05507 191.8287 0.7171673 67 70.15296 0 0.1 0 0 0 1 
i 11.97525 191.8287 0.7171673 77 71.66239 0 0.1 0 0 0 1 
i 1.061345 192.008 0.5378755 55 70.16101 0 0.1 0 0 0 1 
i 1.245382 192.008 0.5378755 58 70.46289 0 0.1 0 0 0 1 
i 9.270478 192.008 0.5378755 78 70.16101 0 0.1 0 0 0 1 
i 9.454514 192.008 0.5378755 81 70.46289 0 0.1 0 0 0 1 
i 4.81457 192.0369 0.7171673 64 74.70876 0 0.1 0 0 0 1 
i 5.059951 192.0369 0.7171673 68 75.11128 0 0.1 0 0 0 1 
i 13.0237 192.0369 0.7171673 87 74.70876 0 0.1 0 0 0 1 
i 13.26908 192.0369 0.7171673 91 75.11128 0 0.1 0 0 0 1 
i 1 192.5459 0.5378755 56 70.06038 0 0.1 0 0 0 1 
i 1.306727 192.5459 0.5378755 59 70.56352 0 0.1 0 0 0 1 
i 2.784594 192.5459 0.7171673 45 70.05233 0 0.1 0 0 0 1 
i 3.827466 192.5459 0.7171673 55 71.76302 0 0.1 0 0 0 1 
i 9.209132 192.5459 0.5378755 79 70.06038 0 0.1 0 0 0 1 
i 9.515859 192.5459 0.5378755 82 70.56352 0 0.1 0 0 0 1 
i 10.99373 192.5459 0.7171673 68 70.05233 0 0.1 0 0 0 1 
i 12.0366 192.5459 0.7171673 78 71.76302 0 0.1 0 0 0 1 
i 4.569188 192.754 0.7171673 66 74.30625 0 0.1 0 0 0 1 
i 5.305333 192.754 0.7171673 71 75.51379 0 0.1 0 0 0 1 
i 12.77832 192.754 0.7171673 89 74.30625 0 0.1 0 0 0 1 
i 13.51446 192.754 0.7171673 94 75.51379 0 0.1 0 0 0 1 
i 2.784594 193.1293 0.5378755 68 74.3143 0 0.1 0 0 0 1 
i 10.99373 193.1293 0.5378755 91 74.3143 0 0.1 0 0 0 1 
i 2.907285 193.4057 0.7171673 43 70.25291 0 0.1 0 0 0 1 
i 3.766121 193.4057 0.7171673 54 71.66172 0 0.1 0 0 0 1 
i 11.11642 193.4057 0.7171673 66 70.25291 0 0.1 0 0 0 1 
i 11.97525 193.4057 0.7171673 77 71.66172 0 0.1 0 0 0 1 
i 4.630533 193.4392 1.434335 67 74.40621 0 0.1 0 0 0 1 
i 4.81457 193.4392 0.7171673 64 74.70809 0 0.1 0 0 0 1 
i 5.059951 193.4392 0.7171673 69 75.11061 0 0.1 0 0 0 1 
i 5.366678 193.4392 0.7171673 72 75.61375 0 0.1 0 0 0 1 
i 12.83967 193.4392 1.434335 90 74.40621 0 0.1 0 0 0 1 
i 13.0237 193.4392 0.7171673 87 74.70809 0 0.1 0 0 0 1 
i 13.26908 193.4392 0.7171673 92 75.11061 0 0.1 0 0 0 1 
i 13.57581 193.4392 0.7171673 95 75.61375 0 0.1 0 0 0 1 
i 1.122691 193.585 0.5378755 56 70.26096 0 0.1 0 0 0 1 
i 1.245382 193.585 0.5378755 58 70.46222 0 0.1 0 0 0 1 
i 9.331823 193.585 0.5378755 79 70.26096 0 0.1 0 0 0 1 
i 9.454514 193.585 0.5378755 81 70.46222 0 0.1 0 0 0 1 
i 1 194.1228 0.5378755 57 70.05971 0 0.1 0 0 0 1 
i 1.368072 194.1228 0.5378755 60 70.66348 0 0.1 0 0 0 1 
i 2.784594 194.1228 0.7171673 45 70.05166 0 0.1 0 0 0 1 
i 3.888811 194.1228 0.7171673 56 71.86298 0 0.1 0 0 0 1 
i 9.209132 194.1228 0.5378755 80 70.05971 0 0.1 0 0 0 1 
i 9.577205 194.1228 0.5378755 83 70.66348 0 0.1 0 0 0 1 
i 10.99373 194.1228 0.7171673 68 70.05166 0 0.1 0 0 0 1 
i 12.09794 194.1228 0.7171673 79 71.86298 0 0.1 0 0 0 1 
i 2.845939 194.1376 1.075751 69 74.41426 0 0.1 0 0 0 1 
i 11.05507 194.1376 1.075751 92 74.41426 0 0.1 0 0 0 1 
i 4.875915 194.1564 0.7171673 63 74.80872 0 0.1 0 0 0 1 
i 5.121297 194.1564 0.7171673 68 75.21124 0 0.1 0 0 0 1 
i 5.305333 194.1564 0.7171673 71 75.51312 0 0.1 0 0 0 1 
i 13.08505 194.1564 0.7171673 86 74.80872 0 0.1 0 0 0 1 
i 13.33043 194.1564 0.7171673 91 75.21124 0 0.1 0 0 0 1 
i 13.51446 194.1564 0.7171673 94 75.51312 0 0.1 0 0 0 1 
i 2.845939 194.8718 1.434335 44 70.15161 0 0.1 0 0 0 1 
i 2.907285 194.8718 0.7171673 43 70.25224 0 0.1 0 0 0 1 
i 3.766121 194.8718 1.434335 56 71.66105 0 0.1 0 0 0 1 
i 3.950157 194.8718 0.7171673 57 71.96294 0 0.1 0 0 0 1 
i 11.05507 194.8718 1.434335 67 70.15161 0 0.1 0 0 0 1 
i 11.11642 194.8718 0.7171673 66 70.25224 0 0.1 0 0 0 1 
i 11.97525 194.8718 1.434335 79 71.66105 0 0.1 0 0 0 1 
i 12.15929 194.8718 0.7171673 80 71.96294 0 0.1 0 0 0 1 
i 4.691879 194.8758 0.7171673 68 74.50616 0 0.1 0 0 0 1 
i 4.81457 194.8758 0.7171673 65 74.70742 0 0.1 0 0 0 1 
i 5.059951 194.8758 0.7171673 70 75.10994 0 0.1 0 0 0 1 
i 5.428024 194.8758 0.7171673 72 75.71371 0 0.1 0 0 0 1 
i 12.90101 194.8758 0.7171673 91 74.50616 0 0.1 0 0 0 1 
i 13.0237 194.8758 0.7171673 88 74.70742 0 0.1 0 0 0 1 
i 13.26908 194.8758 0.7171673 93 75.10994 0 0.1 0 0 0 1 
i 13.63716 194.8758 0.7171673 95 75.71371 0 0.1 0 0 0 1 
i 1.061345 195.0511 1.075751 58 70.15966 0 0.1 0 0 0 1 
i 1.122691 195.0511 1.075751 57 70.26029 0 0.1 0 0 0 1 
i 1.245382 195.0511 1.075751 59 70.46155 0 0.1 0 0 0 1 
i 1.429418 195.0511 1.075751 60 70.76344 0 0.1 0 0 0 1 
i 9.270478 195.0511 1.075751 81 70.15966 0 0.1 0 0 0 1 
i 9.331823 195.0511 1.075751 80 70.26029 0 0.1 0 0 0 1 
i 9.454514 195.0511 0.5378755 82 70.46155 0 0.1 0 0 0 1 
i 9.63855 195.0511 1.075751 83 70.76344 0 0.1 0 0 0 1 
i 2.96863 195.5889 0.7171673 42 70.35287 0 0.1 0 0 0 1 
i 3.827466 195.5889 0.7171673 55 71.76168 0 0.1 0 0 0 1 
i 9.515859 195.5889 0.5378755 82 70.56218 0 0.1 0 0 0 1 
i 11.17776 195.5889 0.7171673 65 70.35287 0 0.1 0 0 0 1 
i 12.0366 195.5889 0.7171673 78 71.76168 0 0.1 0 0 0 1 
i 4.569188 195.593 2.052744 66 74.30491 0 0.1 0 0 0 1 
i 4.93726 195.593 1.335576 64 74.90868 0 0.1 0 0 0 1 
i 5.182642 195.593 2.052744 69 75.31119 0 0.1 0 0 0 1 
i 5.305333 195.593 2.052744 71 75.51245 0 0.1 0 0 0 1 
i 12.77832 195.593 2.052744 89 74.30491 0 0.1 0 0 0 1 
i 13.14639 195.593 1.335576 87 74.90868 0 0.1 0 0 0 1 
i 13.39177 195.593 2.052744 92 75.31119 0 0.1 0 0 0 1 
i 13.51446 195.593 1.335576 94 75.51245 0 0.1 0 0 0 1 
i 2.907285 195.7214 0.5378755 70 74.51421 0 0.1 0 0 0 1 
i 11.11642 195.7214 0.5378755 93 74.51421 0 0.1 0 0 0 1 
i 4.691879 196.2114 1.434335 68 74.50549 0 0.1 0 0 0 1 
i 4.81457 196.2114 1.434335 65 74.70675 0 0.1 0 0 0 1 
i 5.059951 196.2114 0.7171673 70 75.10927 0 0.1 0 0 0 1 
i 5.428024 196.2114 1.434335 72 75.71304 0 0.1 0 0 0 1 
i 12.90101 196.2114 1.434335 91 74.50549 0 0.1 0 0 0 1 
i 13.0237 196.2114 1.434335 88 74.70675 0 0.1 0 0 0 1 
i 13.26908 196.2114 0.7171673 93 75.10927 0 0.1 0 0 0 1 
i 13.63716 196.2114 1.434335 95 75.71304 0 0.1 0 0 0 1 
i 2.784594 196.2592 0.5378755 69 74.31296 0 0.1 0 0 0 1 
i 10.99373 196.2592 0.5378755 92 74.31296 0 0.1 0 0 0 1 
i 3.029976 196.5596 0.7171673 43 70.45283 0 0.1 0 0 0 1 
i 3.766121 196.5596 0.7171673 54 71.66038 0 0.1 0 0 0 1 
i 11.23911 196.5596 0.7171673 66 70.45283 0 0.1 0 0 0 1 
i 11.97525 196.5596 0.7171673 77 71.66038 0 0.1 0 0 0 1 
i 4.569188 196.9285 0.7171673 67 74.30423 0 0.1 0 0 0 1 
i 5.489369 196.9285 0.7171673 73 75.81367 0 0.1 0 0 0 1 
i 12.77832 196.9285 0.7171673 90 74.30423 0 0.1 0 0 0 1 
i 13.33043 196.9285 0.7171673 94 75.2099 0 0.1 0 0 0 1 
i 13.6985 196.9285 0.7171673 96 75.81367 0 0.1 0 0 0 1 
i 1.490763 197.0918 0.5378755 59 70.8634 0 0.1 0 0 0 1 
i 9.699895 197.0918 0.5378755 82 70.8634 0 0.1 0 0 0 1 
i 2.845939 197.1938 0.5378755 70 74.41291 0 0.1 0 0 0 1 
i 2.907285 197.1938 1.075751 71 74.51354 0 0.1 0 0 0 1 
i 11.05507 197.1938 0.5378755 93 74.41291 0 0.1 0 0 0 1 
i 11.11642 197.1938 1.075751 94 74.51354 0 0.1 0 0 0 1 
i 2.784594 197.2767 0.7171673 45 70.05031 0 0.1 0 0 0 1 
i 4.011502 197.2767 0.7171673 57 72.06289 0 0.1 0 0 0 1 
i 10.99373 197.2767 0.7171673 68 70.05031 0 0.1 0 0 0 1 
i 12.22063 197.2767 0.7171673 80 72.06289 0 0.1 0 0 0 1 
i 1 197.6297 0.5378755 55 70.05836 0 0.1 0 0 0 1 
i 9.209132 197.6297 0.5378755 78 70.05836 0 0.1 0 0 0 1 
i 2.96863 197.7317 0.5378755 72 74.61417 0 0.1 0 0 0 1 
i 11.17776 197.7317 0.5378755 95 74.61417 0 0.1 0 0 0 1 
i 2.845939 198.0257 1.434335 45 70.15027 0 0.1 0 0 0 1 
i 3.029976 198.0257 1.434335 42 70.45216 0 0.1 0 0 0 1 
i 3.766121 198.0257 1.434335 54 71.65971 0 0.1 0 0 0 1 
i 4.072848 198.0257 0.7171673 58 72.16285 0 0.1 0 0 0 1 
i 11.05507 198.0257 1.434335 68 70.15027 0 0.1 0 0 0 1 
i 11.23911 198.0257 1.434335 65 70.45216 0 0.1 0 0 0 1 
i 11.97525 198.0257 1.434335 77 71.65971 0 0.1 0 0 0 1 
i 12.28198 198.0257 0.7171673 81 72.16285 0 0.1 0 0 0 1 
i 1.061345 198.6312 0.5378755 54 70.15832 0 0.1 0 0 0 1 
i 1.490763 198.6312 0.5378755 60 70.86273 0 0.1 0 0 0 1 
i 9.270478 198.6312 0.5378755 77 70.15832 0 0.1 0 0 0 1 
i 9.699895 198.6312 1.075751 83 70.86273 0 0.1 0 0 0 1 
i 5.550715 198.7097 0.7171673 68 75.91363 0 0.1 0 0 0 1 
i 13.75985 198.7097 0.7171673 91 75.91363 0 0.1 0 0 0 1 
i 4.011502 198.7428 0.7171673 57 72.06222 0 0.1 0 0 0 1 
i 12.22063 198.7428 0.7171673 80 72.06222 0 0.1 0 0 0 1 
i 3.029976 198.889 0.5378755 72 74.71413 0 0.1 0 0 0 1 
i 11.23911 198.889 0.5378755 95 74.71413 0 0.1 0 0 0 1 
i 1 199.1691 0.5378755 55 70.05769 0 0.1 0 0 0 1 
i 1.552109 199.1691 0.5378755 60 70.96335 0 0.1 0 0 0 1 
i 9.209132 199.1691 0.5378755 78 70.05769 0 0.1 0 0 0 1 
i 2.784594 199.4269 0.5378755 70 74.31161 0 0.1 0 0 0 1 
i 4.569188 199.4269 0.7171673 60 74.30356 0 0.1 0 0 0 1 
i 10.99373 199.4269 0.5378755 93 74.31161 0 0.1 0 0 0 1 
i 12.77832 199.4269 0.7171673 83 74.30356 0 0.1 0 0 0 1 
i 2.907285 199.5275 0.7171673 45 70.25023 0 0.1 0 0 0 1 
i 3.029976 199.5275 0.7171673 43 70.45149 0 0.1 0 0 0 1 
i 3.766121 199.5275 0.7171673 56 71.65904 0 0.1 0 0 0 1 
i 4.134193 199.5275 0.7171673 58 72.26281 0 0.1 0 0 0 1 
i 11.11642 199.5275 0.7171673 68 70.25023 0 0.1 0 0 0 1 
i 11.23911 199.5275 0.7171673 66 70.45149 0 0.1 0 0 0 1 
i 11.97525 199.5275 0.7171673 79 71.65904 0 0.1 0 0 0 1 
i 12.34333 199.5275 0.7171673 81 72.26281 0 0.1 0 0 0 1 
i 4.630533 200.1822 0.7171673 58 74.40352 0 0.1 0 0 0 1 
i 5.550715 200.1822 1.434335 69 75.91296 0 0.1 0 0 0 1 
i 12.83967 200.1822 0.7171673 81 74.40352 0 0.1 0 0 0 1 
i 13.75985 200.1822 1.434335 92 75.91296 0 0.1 0 0 0 1 
i 1.122691 200.2082 0.5378755 54 70.25828 0 0.1 0 0 0 1 
i 1.490763 200.2082 0.5378755 60 70.86205 0 0.1 0 0 0 1 
i 9.331823 200.2082 0.5378755 77 70.25828 0 0.1 0 0 0 1 
i 9.699895 200.2082 0.5378755 83 70.86205 0 0.1 0 0 0 1 
i 2.784594 200.2447 2.113452 44 70.04897 0 0.1 0 0 0 1 
i 3.152666 200.2447 2.113452 41 70.65275 0 0.1 0 0 0 1 
i 3.888811 200.2447 1.396284 54 71.86029 0 0.1 0 0 0 1 
i 4.011502 200.2447 2.113452 57 72.06155 0 0.1 0 0 0 1 
i 10.99373 200.2447 2.113452 67 70.04897 0 0.1 0 0 0 1 
i 11.3618 200.2447 2.113452 64 70.65275 0 0.1 0 0 0 1 
i 12.09794 200.2447 1.396284 77 71.86029 0 0.1 0 0 0 1 
i 12.22063 200.2447 2.113452 80 72.06155 0 0.1 0 0 0 1 
i 2.845939 200.3615 1.075751 70 74.41157 0 0.1 0 0 0 1 
i 3.029976 200.3615 1.075751 73 74.71346 0 0.1 0 0 0 1 
i 11.05507 200.3615 1.075751 93 74.41157 0 0.1 0 0 0 1 
i 11.23911 200.3615 1.075751 96 74.71346 0 0.1 0 0 0 1 
i 1 200.746 0.5378755 56 70.05702 0 0.1 0 0 0 1 
i 1.613454 200.746 0.5378755 61 71.06331 0 0.1 0 0 0 1 
i 9.209132 200.746 0.5378755 79 70.05702 0 0.1 0 0 0 1 
i 9.822586 200.746 0.5378755 84 71.06331 0 0.1 0 0 0 1 
i 4.569188 200.8993 0.7171673 59 74.30289 0 0.1 0 0 0 1 
i 12.77832 200.8993 0.7171673 82 74.30289 0 0.1 0 0 0 1 
i 2.845939 200.9238 0.7171673 43 70.14893 0 0.1 0 0 0 1 
i 3.029976 200.9238 1.434335 42 70.45082 0 0.1 0 0 0 1 
i 3.766121 200.9238 1.434335 56 71.65836 0 0.1 0 0 0 1 
i 4.134193 200.9238 0.7171673 58 72.26214 0 0.1 0 0 0 1 
i 11.05507 200.9238 0.7171673 66 70.14893 0 0.1 0 0 0 1 
i 11.23911 200.9238 1.434335 65 70.45082 0 0.1 0 0 0 1 
i 11.97525 200.9238 1.434335 79 71.65836 0 0.1 0 0 0 1 
i 12.34333 200.9238 0.7171673 81 72.26214 0 0.1 0 0 0 1 
i 2.96863 201.641 0.7171673 45 70.35019 0 0.1 0 0 0 1 
i 3.888811 201.641 0.7171673 55 71.85962 0 0.1 0 0 0 1 
i 4.195539 201.641 0.7171673 59 72.36277 0 0.1 0 0 0 1 
i 11.17776 201.641 0.7171673 68 70.35019 0 0.1 0 0 0 1 
i 12.09794 201.641 0.7171673 78 71.85962 0 0.1 0 0 0 1 
i 12.40467 201.641 0.7171673 82 72.36277 0 0.1 0 0 0 1 
i 1.061345 201.6743 0.5378755 56 70.15698 0 0.1 0 0 0 1 
i 1.122691 201.6743 1.075751 55 70.25761 0 0.1 0 0 0 1 
i 1.490763 201.6743 0.5378755 61 70.86138 0 0.1 0 0 0 1 
i 1.6748 201.6743 0.5378755 62 71.16327 0 0.1 0 0 0 1 
i 9.270478 201.6743 0.5378755 79 70.15698 0 0.1 0 0 0 1 
i 9.331823 201.6743 1.075751 78 70.25761 0 0.1 0 0 0 1 
i 9.699895 201.6743 1.075751 84 70.86138 0 0.1 0 0 0 1 
i 9.883932 201.6743 0.5378755 85 71.16327 0 0.1 0 0 0 1 
i 4.691879 201.6906 0.7171673 58 74.50348 0 0.1 0 0 0 1 
i 5.550715 201.6906 0.7171673 69 75.91229 0 0.1 0 0 0 1 
i 12.90101 201.6906 0.7171673 81 74.50348 0 0.1 0 0 0 1 
i 13.75985 201.6906 0.7171673 92 75.91229 0 0.1 0 0 0 1 
i 2.907285 201.8698 0.5378755 70 74.51153 0 0.1 0 0 0 1 
i 3.029976 201.8698 0.5378755 73 74.71279 0 0.1 0 0 0 1 
i 11.11642 201.8698 0.5378755 93 74.51153 0 0.1 0 0 0 1 
i 11.23911 201.8698 0.5378755 96 74.71279 0 0.1 0 0 0 1 
i 1.184036 202.2121 0.5378755 54 70.35824 0 0.1 0 0 0 1 
i 1.552109 202.2121 0.5378755 60 70.96201 0 0.1 0 0 0 1 
i 1.613454 202.2121 0.5378755 61 71.06264 0 0.1 0 0 0 1 
i 9.393168 202.2121 0.5378755 77 70.35824 0 0.1 0 0 0 1 
i 9.761241 202.2121 0.5378755 83 70.96201 0 0.1 0 0 0 1 
i 2.784594 202.4077 0.5378755 72 74.31027 0 0.1 0 0 0 1 
i 3.152666 202.4077 0.5378755 74 74.91405 0 0.1 0 0 0 1 
i 4.569188 202.4077 0.7171673 59 74.30222 0 0.1 0 0 0 1 
i 5.673405 202.4077 2.119523 70 76.11354 0 0.1 0 0 0 1 
i 10.99373 202.4077 0.5378755 95 74.31027 0 0.1 0 0 0 1 
i 11.3618 202.4077 0.5378755 97 74.91405 0 0.1 0 0 0 1 
i 12.77832 202.4077 0.7171673 82 74.30222 0 0.1 0 0 0 1 
i 13.88254 202.4077 2.119523 93 76.11354 0 0.1 0 0 0 1 
i 3.275357 202.8674 0.7171673 43 70.85266 0 0.1 0 0 0 1 
i 3.766121 202.8674 0.7171673 52 71.65769 0 0.1 0 0 0 1 
i 11.48449 202.8674 0.7171673 66 70.85266 0 0.1 0 0 0 1 
i 11.97525 202.8674 0.7171673 75 71.65769 0 0.1 0 0 0 1 
i 4.630533 203.0929 1.434335 58 74.40218 0 0.1 0 0 0 1 
i 4.691879 203.0929 1.434335 57 74.50281 0 0.1 0 0 0 1 
i 5.734751 203.0929 0.7171673 71 76.2135 0 0.1 0 0 0 1 
i 12.83967 203.0929 1.95774 81 74.40218 0 0.1 0 0 0 1 
i 12.90101 203.0929 1.434335 80 74.50281 0 0.1 0 0 0 1 
i 13.94388 203.0929 0.7171673 94 76.2135 0 0.1 0 0 0 1 
i 2.845939 203.2722 1.075751 73 74.41023 0 0.1 0 0 0 1 
i 2.907285 203.2722 1.075751 71 74.51086 0 0.1 0 0 0 1 
i 3.029976 203.2722 1.075751 74 74.71212 0 0.1 0 0 0 1 
i 3.214012 203.2722 0.5378755 75 75.014 0 0.1 0 0 0 1 
i 11.05507 203.2722 1.075751 96 74.41023 0 0.1 0 0 0 1 
i 11.11642 203.2722 1.075751 94 74.51086 0 0.1 0 0 0 1 
i 11.23911 203.2722 1.075751 97 74.71212 0 0.1 0 0 0 1 
i 11.42314 203.2722 0.5378755 98 75.014 0 0.1 0 0 0 1 
i 1.245382 203.3621 0.5378755 55 70.4582 0 0.1 0 0 0 1 
i 1.490763 203.3621 0.5378755 59 70.86071 0 0.1 0 0 0 1 
i 9.454514 203.3621 0.5378755 78 70.4582 0 0.1 0 0 0 1 
i 9.699895 203.3621 0.5378755 82 70.86071 0 0.1 0 0 0 1 
i 2.784594 203.5845 0.7171673 47 70.04763 0 0.1 0 0 0 1 
i 4.256884 203.5845 0.7171673 57 72.46273 0 0.1 0 0 0 1 
i 10.99373 203.5845 0.7171673 70 70.04763 0 0.1 0 0 0 1 
i 12.46602 203.5845 0.7171673 80 72.46273 0 0.1 0 0 0 1 
i 2.784594 203.8101 0.5378755 72 74.3096 0 0.1 0 0 0 1 
i 5.61206 203.8101 0.7171673 69 76.01224 0 0.1 0 0 0 1 
i 10.99373 203.8101 0.5378755 95 74.3096 0 0.1 0 0 0 1 
i 13.82119 203.8101 0.7171673 92 76.01224 0 0.1 0 0 0 1 
i 1 203.8999 0.5378755 57 70.05568 0 0.1 0 0 0 1 
i 1.736145 203.8999 0.5378755 62 71.26323 0 0.1 0 0 0 1 
i 9.209132 203.8999 0.5378755 80 70.05568 0 0.1 0 0 0 1 
i 9.945277 203.8999 0.5378755 85 71.26323 0 0.1 0 0 0 1 
i 2.845939 204.3335 1.434335 48 70.14759 0 0.1 0 0 0 1 
i 3.275357 204.3335 1.434335 42 70.85199 0 0.1 0 0 0 1 
i 3.766121 204.3335 0.7171673 52 71.65702 0 0.1 0 0 0 1 
i 4.318229 204.3335 0.7171673 58 72.56268 0 0.1 0 0 0 1 
i 11.05507 204.3335 1.434335 71 70.14759 0 0.1 0 0 0 1 
i 11.48449 204.3335 0.7171673 65 70.85199 0 0.1 0 0 0 1 
i 11.97525 204.3335 0.7171673 75 71.65702 0 0.1 0 0 0 1 
i 4.81457 204.7073 0.7171673 57 74.7034 0 0.1 0 0 0 1 
i 5.550715 204.7073 0.7171673 68 75.91094 0 0.1 0 0 0 1 
i 13.0237 204.7073 0.7171673 80 74.7034 0 0.1 0 0 0 1 
i 13.75985 204.7073 0.7171673 91 75.91094 0 0.1 0 0 0 1 
i 1.061345 204.8282 1.075751 58 70.15564 0 0.1 0 0 0 1 
i 1.245382 204.8282 1.075751 55 70.45753 0 0.1 0 0 0 1 
i 1.490763 204.8282 0.5378755 60 70.86004 0 0.1 0 0 0 1 
i 1.79749 204.8282 0.5378755 63 71.36319 0 0.1 0 0 0 1 
i 9.270478 204.8282 1.075751 81 70.15564 0 0.1 0 0 0 1 
i 9.454514 204.8282 0.5378755 78 70.45753 0 0.1 0 0 0 1 
i 9.699895 204.8282 0.5378755 83 70.86004 0 0.1 0 0 0 1 
i 10.00662 204.8282 0.5378755 86 71.36319 0 0.1 0 0 0 1 
i 3.827466 205.0506 0.7171673 51 71.75765 0 0.1 0 0 0 1 
i 4.256884 205.0506 0.7171673 57 72.46205 0 0.1 0 0 0 1 
i 11.54583 205.0506 0.7171673 65 70.95262 0 0.1 0 0 0 1 
i 12.0366 205.0506 0.7171673 74 71.75765 0 0.1 0 0 0 1 
i 12.46602 205.0506 0.7171673 80 72.46205 0 0.1 0 0 0 1 
i 3.275357 205.2242 0.5378755 73 75.11396 0 0.1 0 0 0 1 
i 11.48449 205.2242 0.5378755 96 75.11396 0 0.1 0 0 0 1 
i 1.552109 205.366 0.5378755 59 70.96067 0 0.1 0 0 0 1 
i 1.736145 205.366 0.5378755 62 71.26256 0 0.1 0 0 0 1 
i 9.515859 205.366 0.5378755 78 70.55816 0 0.1 0 0 0 1 
i 9.761241 205.366 0.5378755 82 70.96067 0 0.1 0 0 0 1 
i 9.945277 205.366 0.5378755 85 71.26256 0 0.1 0 0 0 1 
i 4.569188 205.4245 0.7171673 59 74.30088 0 0.1 0 0 0 1 
i 5.796096 205.4245 0.7171673 71 76.31346 0 0.1 0 0 0 1 
i 12.77832 205.4245 0.7171673 82 74.30088 0 0.1 0 0 0 1 
i 14.00523 205.4245 0.7171673 94 76.31346 0 0.1 0 0 0 1 
i 2.784594 205.7621 0.5378755 69 74.30893 0 0.1 0 0 0 1 
i 10.99373 205.7621 0.5378755 92 74.30893 0 0.1 0 0 0 1 
i 2.907285 205.8353 0.9817942 49 70.24755 0 0.1 0 0 0 1 
i 3.275357 205.8353 0.7171673 43 70.85132 0 0.1 0 0 0 1 
i 3.766121 205.8353 0.7171673 52 71.65635 0 0.1 0 0 0 1 
i 4.379575 205.8353 0.7171673 58 72.66264 0 0.1 0 0 0 1 
i 11.11642 205.8353 0.9817942 72 70.24755 0 0.1 0 0 0 1 
i 11.48449 205.8353 0.7171673 66 70.85132 0 0.1 0 0 0 1 
i 11.97525 205.8353 0.7171673 75 71.65635 0 0.1 0 0 0 1 
i 12.58871 205.8353 0.7171673 81 72.66264 0 0.1 0 0 0 1 
i 4.630533 206.1097 0.7171673 60 74.40084 0 0.1 0 0 0 1 
i 4.81457 206.1097 1.434335 56 74.70273 0 0.1 0 0 0 1 
i 5.550715 206.1097 0.7171673 69 75.91027 0 0.1 0 0 0 1 
i 5.857442 206.1097 0.7171673 72 76.41342 0 0.1 0 0 0 1 
i 12.83967 206.1097 0.7171673 83 74.40084 0 0.1 0 0 0 1 
i 13.0237 206.1097 1.434335 79 74.70273 0 0.1 0 0 0 1 
i 13.75985 206.1097 0.7171673 92 75.91027 0 0.1 0 0 0 1 
i 14.06657 206.1097 0.7171673 95 76.41342 0 0.1 0 0 0 1 
i 1.122691 206.33 0.5378755 59 70.2556 0 0.1 0 0 0 1 
i 1.245382 206.33 1.075751 57 70.45686 0 0.1 0 0 0 1 
i 1.490763 206.33 0.5378755 61 70.85937 0 0.1 0 0 0 1 
i 1.858836 206.33 0.5378755 63 71.46314 0 0.1 0 0 0 1 
i 9.331823 206.33 0.5378755 82 70.2556 0 0.1 0 0 0 1 
i 9.454514 206.33 1.075751 80 70.45686 0 0.1 0 0 0 1 
i 9.699895 206.33 0.5378755 84 70.85937 0 0.1 0 0 0 1 
i 10.06797 206.33 0.5378755 86 71.46314 0 0.1 0 0 0 1 
i 2.784594 206.5525 1.396284 47 70.04629 0 0.1 0 0 0 1 
i 3.398048 206.5525 2.113452 41 71.05258 0 0.1 0 0 0 1 
i 3.888811 206.5525 2.113452 51 71.85761 0 0.1 0 0 0 1 
i 4.256884 206.5525 2.113452 57 72.46138 0 0.1 0 0 0 1 
i 10.99373 206.5525 1.396284 70 70.04629 0 0.1 0 0 0 1 
i 11.60718 206.5525 2.113452 64 71.05258 0 0.1 0 0 0 1 
i 12.09794 206.5525 2.113452 74 71.85761 0 0.1 0 0 0 1 
i 12.46602 206.5525 0.7171673 80 72.46138 0 0.1 0 0 0 1 
i 2.845939 206.6967 1.075751 69 74.40889 0 0.1 0 0 0 1 
i 3.275357 206.6967 0.5378755 74 75.11329 0 0.1 0 0 0 1 
i 11.05507 206.6967 1.075751 92 74.40889 0 0.1 0 0 0 1 
i 11.48449 206.6967 0.5378755 97 75.11329 0 0.1 0 0 0 1 
i 4.569188 206.8268 0.7171673 59 74.30021 0 0.1 0 0 0 1 
i 5.61206 206.8268 0.7171673 68 76.0109 0 0.1 0 0 0 1 
i 5.796096 206.8268 0.7171673 71 76.31279 0 0.1 0 0 0 1 
i 12.77832 206.8268 0.7171673 82 74.30021 0 0.1 0 0 0 1 
i 13.82119 206.8268 0.7171673 91 76.0109 0 0.1 0 0 0 1 
i 14.00523 206.8268 0.7171673 94 76.31279 0 0.1 0 0 0 1 
i 1.368072 206.8679 0.5378755 55 70.65811 0 0.1 0 0 0 1 
i 1.613454 206.8679 0.5378755 60 71.06063 0 0.1 0 0 0 1 
i 1.736145 206.8679 0.5378755 62 71.26189 0 0.1 0 0 0 1 
i 9.577205 206.8679 0.5378755 78 70.65811 0 0.1 0 0 0 1 
i 9.822586 206.8679 0.5378755 83 71.06063 0 0.1 0 0 0 1 
i 9.945277 206.8679 0.5378755 85 71.26189 0 0.1 0 0 0 1 
i 2.907285 207.2316 1.434335 49 70.24688 0 0.1 0 0 0 1 
i 3.275357 207.2316 1.434335 42 70.85065 0 0.1 0 0 0 1 
i 3.950157 207.2316 0.7171673 50 71.95757 0 0.1 0 0 0 1 
i 4.379575 207.2316 0.7171673 58 72.66197 0 0.1 0 0 0 1 
i 11.11642 207.2316 1.434335 72 70.24688 0 0.1 0 0 0 1 
i 11.48449 207.2316 0.7171673 65 70.85065 0 0.1 0 0 0 1 
i 12.15929 207.2316 0.7171673 73 71.95757 0 0.1 0 0 0 1 
i 12.52736 207.2316 1.031786 80 72.56134 0 0.1 0 0 0 1 
i 12.58871 207.2316 0.7171673 81 72.66197 0 0.1 0 0 0 1 
i 3.336703 207.2346 0.5378755 75 75.21392 0 0.1 0 0 0 1 
i 11.54583 207.2346 0.5378755 98 75.21392 0 0.1 0 0 0 1 
i 2.845939 207.3578 0.5378755 44 70.16369 0 0.1 0 0 0 1 
i 11.05507 207.3578 0.5378755 67 70.16369 0 0.1 0 0 0 1 
i 4.691879 207.5462 0.7171673 59 74.5008 0 0.1 0 0 0 1 
i 4.81457 207.5462 0.7171673 57 74.70205 0 0.1 0 0 0 1 
i 5.550715 207.5462 0.7171673 70 75.9096 0 0.1 0 0 0 1 
i 5.918787 207.5462 0.7171673 72 76.51338 0 0.1 0 0 0 1 
i 12.90101 207.5462 1.119716 82 74.5008 0 0.1 0 0 0 1 
i 13.75985 207.5462 0.7171673 93 75.9096 0 0.1 0 0 0 1 
i 14.12792 207.5462 0.7171673 95 76.51338 0 0.1 0 0 0 1 
i 1.061345 207.7263 1.075751 58 70.1543 0 0.1 0 0 0 1 
i 1.122691 207.7263 1.075751 59 70.25493 0 0.1 0 0 0 1 
i 1.245382 207.7263 1.075751 56 70.45618 0 0.1 0 0 0 1 
i 1.429418 207.7263 0.5378755 55 70.75807 0 0.1 0 0 0 1 
i 1.490763 207.7263 0.5378755 61 70.8587 0 0.1 0 0 0 1 
i 1.6748 207.7263 1.075751 60 71.16059 0 0.1 0 0 0 1 
i 1.79749 207.7263 1.075751 62 71.36184 0 0.1 0 0 0 1 
i 1.858836 207.7263 1.075751 63 71.46247 0 0.1 0 0 0 1 
i 9.270478 207.7263 1.075751 81 70.1543 0 0.1 0 0 0 1 
i 9.331823 207.7263 1.075751 82 70.25493 0 0.1 0 0 0 1 
i 9.454514 207.7263 0.5378755 79 70.45618 0 0.1 0 0 0 1 
i 9.63855 207.7263 0.5378755 78 70.75807 0 0.1 0 0 0 1 
i 9.699895 207.7263 1.075751 84 70.8587 0 0.1 0 0 0 1 
i 9.883932 207.7263 1.075751 83 71.16059 0 0.1 0 0 0 1 
i 10.00662 207.7263 1.075751 85 71.36184 0 0.1 0 0 0 1 
i 10.06797 207.7263 1.075751 86 71.46247 0 0.1 0 0 0 1 
i 2.784594 207.8956 0.5378755 45 70.06306 0 0.1 0 0 0 1 
i 10.99373 207.8956 0.5378755 68 70.06306 0 0.1 0 0 0 1 
i 2.784594 207.9488 0.7171673 48 70.04562 0 0.1 0 0 0 1 
i 3.827466 207.9488 0.7171673 52 71.75631 0 0.1 0 0 0 1 
i 4.44092 207.9488 0.7171673 59 72.7626 0 0.1 0 0 0 1 
i 10.99373 207.9488 0.7171673 71 70.04562 0 0.1 0 0 0 1 
i 11.54583 207.9488 0.7171673 65 70.95128 0 0.1 0 0 0 1 
i 12.0366 207.9488 0.7171673 75 71.75631 0 0.1 0 0 0 1 
i 12.46602 207.9488 0.7171673 80 72.46071 0 0.1 0 0 0 1 
i 2.907285 208.2051 0.5378755 69 74.50885 0 0.1 0 0 0 1 
i 3.275357 208.2051 0.5378755 74 75.11262 0 0.1 0 0 0 1 
i 11.11642 208.2051 0.5378755 92 74.50885 0 0.1 0 0 0 1 
i 11.48449 208.2051 0.5378755 97 75.11262 0 0.1 0 0 0 1 
i 4.569188 208.2634 2.689096 58 74.29954 0 0.1 0 0 0 1 
i 4.93726 208.2634 2.052744 55 74.90331 0 0.1 0 0 0 1 
i 5.673405 208.2634 2.052744 69 76.11086 0 0.1 0 0 0 1 
i 5.796096 208.2634 1.335576 71 76.31212 0 0.1 0 0 0 1 
i 12.77832 208.2634 2.689096 81 74.29954 0 0.1 0 0 0 1 
i 13.14639 208.2634 2.689096 78 74.90331 0 0.1 0 0 0 1 
i 13.88254 208.2634 2.052744 92 76.11086 0 0.1 0 0 0 1 
i 14.00523 208.2634 1.335576 94 76.31212 0 0.1 0 0 0 1 
i 1.306727 208.2642 0.5378755 57 70.55681 0 0.1 0 0 0 1 
i 1.552109 208.2642 0.5378755 61 70.95933 0 0.1 0 0 0 1 
i 9.515859 208.2642 0.5378755 80 70.55681 0 0.1 0 0 0 1 
i 9.577205 208.2642 0.5378755 79 70.65744 0 0.1 0 0 0 1 
i 2.784594 208.7429 0.5378755 70 74.30759 0 0.1 0 0 0 1 
i 3.398048 208.7429 0.5378755 75 75.31388 0 0.1 0 0 0 1 
i 10.99373 208.7429 0.5378755 93 74.30759 0 0.1 0 0 0 1 
i 11.60718 208.7429 0.5378755 98 75.31388 0 0.1 0 0 0 1 
i 3.029976 208.8391 0.7171673 49 70.44746 0 0.1 0 0 0 1 
i 3.275357 208.8391 0.7171673 44 70.84998 0 0.1 0 0 0 1 
i 3.766121 208.8391 0.7171673 53 71.65501 0 0.1 0 0 0 1 
i 11.23911 208.8391 0.7171673 72 70.44746 0 0.1 0 0 0 1 
i 11.48449 208.8391 0.7171673 67 70.84998 0 0.1 0 0 0 1 
i 11.97525 208.8391 0.7171673 76 71.65501 0 0.1 0 0 0 1 
i 4.630533 208.8818 1.434335 57 74.3995 0 0.1 0 0 0 1 
i 4.81457 208.8818 0.7171673 56 74.70138 0 0.1 0 0 0 1 
i 5.550715 208.8818 1.434335 70 75.90893 0 0.1 0 0 0 1 
i 5.918787 208.8818 1.434335 72 76.5127 0 0.1 0 0 0 1 
i 12.83967 208.8818 1.434335 80 74.3995 0 0.1 0 0 0 1 
i 13.0237 208.8818 0.7171673 79 74.70138 0 0.1 0 0 0 1 
i 13.75985 208.8818 1.434335 93 75.90893 0 0.1 0 0 0 1 
i 14.12792 208.8818 1.434335 95 76.5127 0 0.1 0 0 0 1 
i 2.907285 209.0136 0.5378755 46 70.26365 0 0.1 0 0 0 1 
i 11.11642 209.0136 0.5378755 69 70.26365 0 0.1 0 0 0 1 
i 2.784594 209.5514 0.5378755 47 70.06239 0 0.1 0 0 0 1 
i 10.99373 209.5514 0.5378755 70 70.06239 0 0.1 0 0 0 1 
i 2.784594 209.5562 0.7171673 46 70.04495 0 0.1 0 0 0 1 
i 3.520739 209.5562 2.826625 41 71.25249 0 0.1 0 0 0 1 
i 4.011502 209.5562 0.7171673 51 72.05753 0 0.1 0 0 0 1 
i 4.256884 209.5562 2.826625 55 72.46004 0 0.1 0 0 0 1 
i 10.99373 209.5562 0.7171673 69 70.04495 0 0.1 0 0 0 1 
i 11.72987 209.5562 2.826625 64 71.25249 0 0.1 0 0 0 1 
i 12.22063 209.5562 0.7171673 74 72.05753 0 0.1 0 0 0 1 
i 12.46602 209.5562 0.7171673 78 72.46004 0 0.1 0 0 0 1 
i 4.753224 209.599 0.7171673 59 74.60075 0 0.1 0 0 0 1 
i 5.980132 209.599 0.7171673 73 76.61333 0 0.1 0 0 0 1 
i 12.96236 209.599 0.7171673 82 74.60075 0 0.1 0 0 0 1 
i 14.18926 209.599 0.7171673 96 76.61333 0 0.1 0 0 0 1 
i 2.845939 209.6074 1.075751 70 74.40755 0 0.1 0 0 0 1 
i 2.907285 209.6074 0.5378755 69 74.50818 0 0.1 0 0 0 1 
i 3.275357 209.6074 1.075751 75 75.11195 0 0.1 0 0 0 1 
i 3.459394 209.6074 1.075751 76 75.41384 0 0.1 0 0 0 1 
i 11.05507 209.6074 1.075751 93 74.40755 0 0.1 0 0 0 1 
i 11.11642 209.6074 0.5378755 92 74.50818 0 0.1 0 0 0 1 
i 11.48449 209.6074 0.5378755 98 75.11195 0 0.1 0 0 0 1 
i 11.66853 209.6074 1.075751 99 75.41384 0 0.1 0 0 0 1 
i 2.96863 210.1453 0.5378755 68 74.60881 0 0.1 0 0 0 1 
i 11.17776 210.1453 0.5378755 91 74.60881 0 0.1 0 0 0 1 
i 11.54583 210.1453 0.5378755 98 75.21258 0 0.1 0 0 0 1 
i 2.845939 210.2353 0.7171673 45 70.14491 0 0.1 0 0 0 1 
i 3.029976 210.2353 1.434335 49 70.44679 0 0.1 0 0 0 1 
i 3.275357 210.2353 1.434335 44 70.84931 0 0.1 0 0 0 1 
i 3.766121 210.2353 0.7171673 53 71.65434 0 0.1 0 0 0 1 
i 4.072848 210.2353 0.7171673 50 72.15748 0 0.1 0 0 0 1 
i 11.05507 210.2353 0.7171673 68 70.14491 0 0.1 0 0 0 1 
i 11.23911 210.2353 1.434335 72 70.44679 0 0.1 0 0 0 1 
i 11.48449 210.2353 0.7171673 67 70.84931 0 0.1 0 0 0 1 
i 11.97525 210.2353 0.7171673 76 71.65434 0 0.1 0 0 0 1 
i 12.28198 210.2353 0.7171673 73 72.15748 0 0.1 0 0 0 1 
i 1.981527 210.3382 0.5378755 59 71.66306 0 0.1 0 0 0 1 
i 10.19066 210.3382 0.5378755 82 71.66306 0 0.1 0 0 0 1 
i 2.845939 210.553 0.5378755 53 70.16235 0 0.1 0 0 0 1 
i 2.907285 210.553 0.5378755 55 70.26298 0 0.1 0 0 0 1 
i 11.05507 210.553 0.5378755 76 70.16235 0 0.1 0 0 0 1 
i 11.11642 210.553 0.5378755 78 70.26298 0 0.1 0 0 0 1 
i 5.059951 210.7409 0.7171673 57 75.10323 0 0.1 0 0 0 1 
i 5.550715 210.7409 0.7171673 66 75.90826 0 0.1 0 0 0 1 
i 13.26908 210.7409 0.7171673 80 75.10323 0 0.1 0 0 0 1 
i 13.75985 210.7409 0.7171673 89 75.90826 0 0.1 0 0 0 1 
i 1 210.8761 0.5378755 52 70.053 0 0.1 0 0 0 1 
i 9.209132 210.8761 0.5378755 75 70.053 0 0.1 0 0 0 1 
i 2.784594 210.9525 0.7171673 46 70.04428 0 0.1 0 0 0 1 
i 3.827466 210.9525 0.7171673 54 71.75497 0 0.1 0 0 0 1 
i 4.011502 210.9525 0.7171673 51 72.05686 0 0.1 0 0 0 1 
i 4.563611 210.9525 0.7171673 59 72.96252 0 0.1 0 0 0 1 
i 10.99373 210.9525 0.7171673 69 70.04428 0 0.1 0 0 0 1 
i 11.54583 210.9525 0.7171673 67 70.94994 0 0.1 0 0 0 1 
i 12.0366 210.9525 0.7171673 77 71.75497 0 0.1 0 0 0 1 
i 12.22063 210.9525 0.7171673 74 72.05686 0 0.1 0 0 0 1 
i 12.46602 210.9525 0.7171673 78 72.45937 0 0.1 0 0 0 1 
i 12.77274 210.9525 0.7171673 82 72.96252 0 0.1 0 0 0 1 
i 2.784594 211.0908 0.5378755 54 70.06172 0 0.1 0 0 0 1 
i 2.96863 211.0908 0.5378755 56 70.36361 0 0.1 0 0 0 1 
i 10.99373 211.0908 0.5378755 77 70.06172 0 0.1 0 0 0 1 
i 11.17776 211.0908 0.5378755 79 70.36361 0 0.1 0 0 0 1 
i 3.029976 211.2218 0.5378755 69 74.70876 0 0.1 0 0 0 1 
i 3.275357 211.2218 0.5378755 74 75.11128 0 0.1 0 0 0 1 
i 11.23911 211.2218 0.5378755 92 74.70876 0 0.1 0 0 0 1 
i 11.48449 211.2218 0.5378755 97 75.11128 0 0.1 0 0 0 1 
i 4.569188 211.458 0.7171673 61 74.2982 0 0.1 0 0 0 1 
i 6.041478 211.458 0.7171673 71 76.71329 0 0.1 0 0 0 1 
i 12.77832 211.458 0.7171673 84 74.2982 0 0.1 0 0 0 1 
i 14.25061 211.458 0.7171673 94 76.71329 0 0.1 0 0 0 1 
i 2.907285 211.6657 0.7171673 45 70.24486 0 0.1 0 0 0 1 
i 3.029976 211.6657 0.7171673 48 70.44612 0 0.1 0 0 0 1 
i 3.275357 211.6657 0.7171673 43 70.84864 0 0.1 0 0 0 1 
i 3.766121 211.6657 0.7171673 52 71.65367 0 0.1 0 0 0 1 
i 4.134193 211.6657 0.7171673 50 72.25744 0 0.1 0 0 0 1 
i 4.502266 211.6657 0.7171673 57 72.86122 0 0.1 0 0 0 1 
i 11.11642 211.6657 0.7171673 68 70.24486 0 0.1 0 0 0 1 
i 11.23911 211.6657 0.7171673 71 70.44612 0 0.1 0 0 0 1 
i 11.48449 211.6657 0.7171673 66 70.84864 0 0.1 0 0 0 1 
i 11.97525 211.6657 0.7171673 75 71.65367 0 0.1 0 0 0 1 
i 12.34333 211.6657 0.7171673 73 72.25744 0 0.1 0 0 0 1 
i 12.58871 211.6657 0.7171673 78 72.65996 0 0.1 0 0 0 1 
i 12.7114 211.6657 0.7171673 80 72.86122 0 0.1 0 0 0 1 
i 2.784594 211.7597 0.5378755 72 74.30625 0 0.1 0 0 0 1 
i 3.520739 211.7597 0.5378755 76 75.51379 0 0.1 0 0 0 1 
i 10.99373 211.7597 0.5378755 95 74.30625 0 0.1 0 0 0 1 
i 11.72987 211.7597 0.5378755 99 75.51379 0 0.1 0 0 0 1 
i 1.061345 211.8776 0.5378755 50 70.15296 0 0.1 0 0 0 1 
i 1.981527 211.8776 1.075751 60 71.66239 0 0.1 0 0 0 1 
i 9.270478 211.8776 0.5378755 73 70.15296 0 0.1 0 0 0 1 
i 10.19066 211.8776 1.075751 83 71.66239 0 0.1 0 0 0 1 
i 4.630533 212.1432 1.434335 62 74.39816 0 0.1 0 0 0 1 
i 5.059951 212.1432 1.434335 56 75.10256 0 0.1 0 0 0 1 
i 5.550715 212.1432 0.7171673 66 75.90759 0 0.1 0 0 0 1 
i 6.102823 212.1432 0.7171673 72 76.81325 0 0.1 0 0 0 1 
i 12.83967 212.1432 1.434335 85 74.39816 0 0.1 0 0 0 1 
i 13.26908 212.1432 1.569409 79 75.10256 0 0.1 0 0 0 1 
i 13.75985 212.1432 0.7171673 89 75.90759 0 0.1 0 0 0 1 
i 14.31196 212.1432 0.7171673 95 76.81325 0 0.1 0 0 0 1 
i 3.029976 212.3251 0.5378755 36 70.46356 0 0.1 0 0 0 1 
i 11.23911 212.3251 0.5378755 59 70.46356 0 0.1 0 0 0 1 
i 2.784594 212.3828 1.329795 47 70.04361 0 0.1 0 0 0 1 
i 3.152666 212.3828 2.046962 49 70.64738 0 0.1 0 0 0 1 
i 3.398048 212.3828 0.7171673 44 71.0499 0 0.1 0 0 0 1 
i 3.520739 212.3828 2.046962 42 71.25115 0 0.1 0 0 0 1 
i 3.888811 212.3828 1.329795 54 71.85493 0 0.1 0 0 0 1 
i 4.011502 212.3828 0.7171673 51 72.05618 0 0.1 0 0 0 1 
i 4.256884 212.3828 2.046962 56 72.4587 0 0.1 0 0 0 1 
i 4.624956 212.3828 1.329795 59 73.06247 0 0.1 0 0 0 1 
i 10.99373 212.3828 1.329795 70 70.04361 0 0.1 0 0 0 1 
i 11.3618 212.3828 2.046962 72 70.64738 0 0.1 0 0 0 1 
i 11.60718 212.3828 0.7171673 67 71.0499 0 0.1 0 0 0 1 
i 11.72987 212.3828 2.046962 65 71.25115 0 0.1 0 0 0 1 
i 12.09794 212.3828 1.329795 77 71.85493 0 0.1 0 0 0 1 
i 12.22063 212.3828 0.7171673 74 72.05618 0 0.1 0 0 0 1 
i 12.46602 212.3828 0.7171673 79 72.4587 0 0.1 0 0 0 1 
i 12.83409 212.3828 1.329795 82 73.06247 0 0.1 0 0 0 1 
i 1 212.4155 0.5378755 51 70.05233 0 0.1 0 0 0 1 
i 9.209132 212.4155 0.5378755 74 70.05233 0 0.1 0 0 0 1 
i 2.845939 212.6242 1.075751 73 74.40621 0 0.1 0 0 0 1 
i 3.029976 212.6242 0.5378755 70 74.70809 0 0.1 0 0 0 1 
i 3.275357 212.6242 0.5378755 74 75.11061 0 0.1 0 0 0 1 
i 3.582084 212.6242 0.5378755 77 75.61375 0 0.1 0 0 0 1 
i 11.05507 212.6242 0.5378755 96 74.40621 0 0.1 0 0 0 1 
i 11.23911 212.6242 0.5378755 93 74.70809 0 0.1 0 0 0 1 
i 11.48449 212.6242 0.5378755 97 75.11061 0 0.1 0 0 0 1 
i 11.79122 212.6242 0.5378755 100 75.61375 0 0.1 0 0 0 1 
i 5.61206 212.8604 0.7171673 65 76.00822 0 0.1 0 0 0 1 
i 6.041478 212.8604 0.7171673 71 76.71262 0 0.1 0 0 0 1 
i 13.82119 212.8604 0.7171673 88 76.00822 0 0.1 0 0 0 1 
i 14.25061 212.8604 0.7171673 94 76.71262 0 0.1 0 0 0 1 
i 2.784594 212.863 0.5378755 41 70.06105 0 0.1 0 0 0 1 
i 10.99373 212.863 0.5378755 64 70.06105 0 0.1 0 0 0 1 
i 2.907285 212.9955 1.434335 46 70.24419 0 0.1 0 0 0 1 
i 3.029976 212.9955 1.434335 48 70.44545 0 0.1 0 0 0 1 
i 3.275357 212.9955 1.434335 43 70.84797 0 0.1 0 0 0 1 
i 3.459394 212.9955 1.434335 45 71.14985 0 0.1 0 0 0 1 
i 3.64343 212.9955 0.7171673 41 71.45174 0 0.1 0 0 0 1 
i 3.766121 212.9955 1.434335 53 71.653 0 0.1 0 0 0 1 
i 4.072848 212.9955 1.434335 52 72.15614 0 0.1 0 0 0 1 
i 4.134193 212.9955 1.434335 50 72.25677 0 0.1 0 0 0 1 
i 4.379575 212.9955 1.434335 55 72.65929 0 0.1 0 0 0 1 
i 4.502266 212.9955 1.434335 58 72.86055 0 0.1 0 0 0 1 
i 11.11642 212.9955 1.434335 69 70.24419 0 0.1 0 0 0 1 
i 11.23911 212.9955 1.434335 71 70.44545 0 0.1 0 0 0 1 
i 11.48449 212.9955 0.7171673 66 70.84797 0 0.1 0 0 0 1 
i 11.66853 212.9955 0.7171673 68 71.14985 0 0.1 0 0 0 1 
i 11.85256 212.9955 0.7171673 64 71.45174 0 0.1 0 0 0 1 
i 11.97525 212.9955 1.434335 76 71.653 0 0.1 0 0 0 1 
i 12.28198 212.9955 1.434335 75 72.15614 0 0.1 0 0 0 1 
i 12.34333 212.9955 1.434335 73 72.25677 0 0.1 0 0 0 1 
i 12.58871 212.9955 3.354229 78 72.65929 0 0.1 0 0 0 1 
i 12.7114 212.9955 1.434335 81 72.86055 0 0.1 0 0 0 1 
i 2.784594 213.1621 0.5378755 72 74.30558 0 0.1 0 0 0 1 
i 3.091321 213.1621 0.5378755 69 74.80872 0 0.1 0 0 0 1 
i 3.520739 213.1621 0.5378755 76 75.51312 0 0.1 0 0 0 1 
i 10.99373 213.1621 0.5378755 95 74.30558 0 0.1 0 0 0 1 
i 11.30045 213.1621 0.5378755 92 74.80872 0 0.1 0 0 0 1 
i 11.54583 213.1621 0.5378755 96 75.21124 0 0.1 0 0 0 1 
i 11.72987 213.1621 0.5378755 99 75.51312 0 0.1 0 0 0 1 
i 1.122691 213.4545 0.5378755 50 70.25291 0 0.1 0 0 0 1 
i 1.981527 213.4545 0.5378755 60 71.66172 0 0.1 0 0 0 1 
i 9.331823 213.4545 0.5378755 73 70.25291 0 0.1 0 0 0 1 
i 10.19066 213.4545 0.5378755 83 71.66172 0 0.1 0 0 0 1 
i 4.691879 213.5798 0.7171673 63 74.49811 0 0.1 0 0 0 1 
i 5.059951 213.5798 0.8500171 57 75.10189 0 0.1 0 0 0 1 
i 5.550715 213.5798 0.7171673 66 75.90692 0 0.1 0 0 0 1 
i 6.164169 213.5798 0.7171673 72 76.91321 0 0.1 0 0 0 1 
i 12.90101 213.5798 0.7171673 86 74.49811 0 0.1 0 0 0 1 
i 13.26908 213.5798 0.8500171 80 75.10189 0 0.1 0 0 0 1 
i 13.75985 213.5798 0.7171673 89 75.90692 0 0.1 0 0 0 1 
i 14.3733 213.5798 0.7171673 95 76.91321 0 0.1 0 0 0 1 
i 3.398048 213.7126 0.7171673 44 71.04922 0 0.1 0 0 0 1 
i 3.704775 213.7126 0.7171673 40 71.55237 0 0.1 0 0 0 1 
i 4.011502 213.7126 0.7171673 51 72.05551 0 0.1 0 0 0 1 
i 11.17776 213.7126 0.7171673 68 70.34482 0 0.1 0 0 0 1 
i 11.54583 213.7126 0.7171673 66 70.9486 0 0.1 0 0 0 1 
i 11.60718 213.7126 0.7171673 67 71.04922 0 0.1 0 0 0 1 
i 11.91391 213.7126 0.7171673 63 71.55237 0 0.1 0 0 0 1 
i 12.22063 213.7126 0.7171673 74 72.05551 0 0.1 0 0 0 1 
i 12.46602 213.7126 0.7171673 79 72.45803 0 0.1 0 0 0 1 
i 2.845939 213.8646 0.5378755 53 70.16101 0 0.1 0 0 0 1 
i 3.029976 213.8646 0.5378755 58 70.46289 0 0.1 0 0 0 1 
i 11.05507 213.8646 0.5378755 76 70.16101 0 0.1 0 0 0 1 
i 11.23911 213.8646 0.5378755 81 70.46289 0 0.1 0 0 0 1 
i 1 213.9924 0.5378755 51 70.05166 0 0.1 0 0 0 1 
i 2.104217 213.9924 0.5378755 61 71.86298 0 0.1 0 0 0 1 
i 9.209132 213.9924 0.5378755 74 70.05166 0 0.1 0 0 0 1 
i 10.31335 213.9924 0.5378755 84 71.86298 0 0.1 0 0 0 1 
i 4.569188 214.0356 0.5378755 64 74.3143 0 0.1 0 0 0 1 
i 12.77832 214.0356 0.5378755 87 74.3143 0 0.1 0 0 0 1 
i 2.907285 214.0608 0.5378755 73 74.50616 0 0.1 0 0 0 1 
i 3.029976 214.0608 0.5378755 71 74.70742 0 0.1 0 0 0 1 
i 3.275357 214.0608 0.5378755 75 75.10994 0 0.1 0 0 0 1 
i 3.64343 214.0608 0.5378755 77 75.71371 0 0.1 0 0 0 1 
i 11.11642 214.0608 0.5378755 96 74.50616 0 0.1 0 0 0 1 
i 11.23911 214.0608 0.5378755 94 74.70742 0 0.1 0 0 0 1 
i 11.48449 214.0608 0.5378755 98 75.10994 0 0.1 0 0 0 1 
i 11.85256 214.0608 0.5378755 100 75.71371 0 0.1 0 0 0 1 
i 4.569188 214.297 0.7171673 61 74.29686 0 0.1 0 0 0 1 
i 5.182642 214.297 2.052744 55 75.30314 0 0.1 0 0 0 1 
i 5.673405 214.297 2.052744 65 76.10818 0 0.1 0 0 0 1 
i 6.041478 214.297 1.335576 71 76.71195 0 0.1 0 0 0 1 
i 12.77832 214.297 0.7171673 84 74.29686 0 0.1 0 0 0 1 
i 13.88254 214.297 2.052744 88 76.10818 0 0.1 0 0 0 1 
i 14.25061 214.297 1.335576 94 76.71195 0 0.1 0 0 0 1 
i 2.784594 214.4024 0.5378755 54 70.06038 0 0.1 0 0 0 1 
i 3.091321 214.4024 0.5378755 59 70.56352 0 0.1 0 0 0 1 
i 10.99373 214.4024 0.5378755 77 70.06038 0 0.1 0 0 0 1 
i 11.30045 214.4024 0.5378755 82 70.56352 0 0.1 0 0 0 1 
i 2.784594 214.5986 0.5378755 72 74.30491 0 0.1 0 0 0 1 
i 3.152666 214.5986 0.5378755 70 74.90868 0 0.1 0 0 0 1 
i 3.398048 214.5986 0.5378755 74 75.31119 0 0.1 0 0 0 1 
i 3.520739 214.5986 0.5378755 76 75.51245 0 0.1 0 0 0 1 
i 10.99373 214.5986 0.5378755 95 74.30491 0 0.1 0 0 0 1 
i 11.3618 214.5986 0.5378755 93 74.90868 0 0.1 0 0 0 1 
i 11.60718 214.5986 0.5378755 97 75.31119 0 0.1 0 0 0 1 
i 11.72987 214.5986 0.5378755 99 75.51245 0 0.1 0 0 0 1 
i 4.630533 214.9154 1.434335 62 74.39681 0 0.1 0 0 0 1 
i 4.691879 214.9154 1.434335 63 74.49744 0 0.1 0 0 0 1 
i 5.059951 214.9154 0.7171673 56 75.10122 0 0.1 0 0 0 1 
i 5.734751 214.9154 0.7171673 64 76.20813 0 0.1 0 0 0 1 
i 6.164169 214.9154 1.434335 72 76.91254 0 0.1 0 0 0 1 
i 12.83967 214.9154 1.434335 85 74.39681 0 0.1 0 0 0 1 
i 12.90101 214.9154 1.434335 86 74.49744 0 0.1 0 0 0 1 
i 13.26908 214.9154 0.7171673 79 75.10122 0 0.1 0 0 0 1 
i 13.94388 214.9154 0.7171673 87 76.20813 0 0.1 0 0 0 1 
i 14.3733 214.9154 1.434335 95 76.91254 0 0.1 0 0 0 1 
i 1.061345 214.9206 1.075751 50 70.15161 0 0.1 0 0 0 1 
i 1.122691 214.9206 1.075751 49 70.25224 0 0.1 0 0 0 1 
i 1.981527 214.9206 1.075751 61 71.66105 0 0.1 0 0 0 1 
i 2.165563 214.9206 0.5378755 62 71.96294 0 0.1 0 0 0 1 
i 9.270478 214.9206 1.075751 73 70.15161 0 0.1 0 0 0 1 
i 9.331823 214.9206 1.075751 72 70.25224 0 0.1 0 0 0 1 
i 10.19066 214.9206 1.075751 84 71.66105 0 0.1 0 0 0 1 
i 10.3747 214.9206 0.5378755 85 71.96294 0 0.1 0 0 0 1 
i 4.630533 215.0438 0.5378755 58 74.41426 0 0.1 0 0 0 1 
i 12.83967 215.0438 0.5378755 81 74.41426 0 0.1 0 0 0 1 
i 2.845939 215.3963 1.075751 72 74.40486 0 0.1 0 0 0 1 
i 2.907285 215.3963 1.075751 73 74.50549 0 0.1 0 0 0 1 
i 3.029976 215.3963 1.075751 71 74.70675 0 0.1 0 0 0 1 
i 3.214012 215.3963 1.075751 70 75.00864 0 0.1 0 0 0 1 
i 3.275357 215.3963 0.5378755 75 75.10927 0 0.1 0 0 0 1 
i 3.459394 215.3963 1.075751 74 75.41115 0 0.1 0 0 0 1 
i 3.582084 215.3963 0.5378755 76 75.61241 0 0.1 0 0 0 1 
i 3.64343 215.3963 1.075751 77 75.71304 0 0.1 0 0 0 1 
i 11.05507 215.3963 1.075751 95 74.40486 0 0.1 0 0 0 1 
i 11.11642 215.3963 1.075751 96 74.50549 0 0.1 0 0 0 1 
i 11.23911 215.3963 1.075751 94 74.70675 0 0.1 0 0 0 1 
i 11.42314 215.3963 1.075751 93 75.00864 0 0.1 0 0 0 1 
i 11.48449 215.3963 0.5378755 98 75.10927 0 0.1 0 0 0 1 
i 11.66853 215.3963 1.075751 97 75.41115 0 0.1 0 0 0 1 
i 11.79122 215.3963 1.075751 99 75.61241 0 0.1 0 0 0 1 
i 11.85256 215.3963 1.075751 100 75.71304 0 0.1 0 0 0 1 
i 2.907285 215.4415 0.5378755 46 70.26096 0 0.1 0 0 0 1 
i 3.029976 215.4415 1.075751 45 70.46222 0 0.1 0 0 0 1 
i 11.11642 215.4415 0.5378755 69 70.26096 0 0.1 0 0 0 1 
i 11.23911 215.4415 1.075751 68 70.46222 0 0.1 0 0 0 1 
i 2.042872 215.4585 0.5378755 60 71.76168 0 0.1 0 0 0 1 
i 10.252 215.4585 0.5378755 83 71.76168 0 0.1 0 0 0 1 
i 4.569188 215.5817 0.5378755 59 74.31363 0 0.1 0 0 0 1 
i 12.77832 215.5817 0.5378755 82 74.31363 0 0.1 0 0 0 1 
i 5.121297 215.6325 0.7171673 57 75.20184 0 0.1 0 0 0 1 
i 5.61206 215.6325 0.7171673 66 76.00688 0 0.1 0 0 0 1 
i 6.225514 215.6325 0.7171673 73 77.01317 0 0.1 0 0 0 1 
i 13.33043 215.6325 0.7171673 80 75.20184 0 0.1 0 0 0 1 
i 13.82119 215.6325 0.7171673 89 76.00688 0 0.1 0 0 0 1 
i 14.43465 215.6325 0.7171673 96 77.01317 0 0.1 0 0 0 1 
i 3.336703 215.9342 0.5378755 76 75.2099 0 0.1 0 0 0 1 
i 3.704775 215.9342 0.5378755 78 75.81367 0 0.1 0 0 0 1 
i 11.91391 215.9342 0.5378755 101 75.81367 0 0.1 0 0 0 1 
i 3.152666 215.9794 0.5378755 44 70.66348 0 0.1 0 0 0 1 
i 11.3618 215.9794 0.5378755 67 70.66348 0 0.1 0 0 0 1 
i 4.81457 216.4529 0.7171673 63 74.69803 0 0.1 0 0 0 1 
i 5.059951 216.4529 0.7171673 58 75.10055 0 0.1 0 0 0 1 
i 5.550715 216.4529 0.7171673 68 75.90558 0 0.1 0 0 0 1 
i 6.28686 216.4529 0.7171673 72 77.11312 0 0.1 0 0 0 1 
i 13.0237 216.4529 0.7171673 86 74.69803 0 0.1 0 0 0 1 
i 13.26908 216.4529 0.7171673 81 75.10055 0 0.1 0 0 0 1 
i 13.75985 216.4529 0.7171673 91 75.90558 0 0.1 0 0 0 1 
i 14.49599 216.4529 0.7171673 95 77.11312 0 0.1 0 0 0 1 
i 1.245382 216.6084 0.5378755 49 70.45283 0 0.1 0 0 0 1 
i 1.981527 216.6084 0.5378755 59 71.66038 0 0.1 0 0 0 1 
i 9.454514 216.6084 0.5378755 72 70.45283 0 0.1 0 0 0 1 
i 10.19066 216.6084 0.5378755 82 71.66038 0 0.1 0 0 0 1 
i 4.691879 216.6276 1.075751 61 74.51421 0 0.1 0 0 0 1 
i 12.90101 216.6276 1.075751 84 74.51421 0 0.1 0 0 0 1 
i 2.845939 216.9076 1.075751 38 70.15966 0 0.1 0 0 0 1 
i 2.907285 216.9076 0.5378755 40 70.26029 0 0.1 0 0 0 1 
i 3.029976 216.9076 0.5378755 37 70.46155 0 0.1 0 0 0 1 
i 3.214012 216.9076 0.5378755 35 70.76344 0 0.1 0 0 0 1 
i 11.05507 216.9076 1.075751 61 70.15966 0 0.1 0 0 0 1 
i 11.11642 216.9076 0.5378755 63 70.26029 0 0.1 0 0 0 1 
i 11.23911 216.9076 0.5378755 60 70.46155 0 0.1 0 0 0 1 
i 11.42314 216.9076 0.5378755 58 70.76344 0 0.1 0 0 0 1 
i 1 217.1463 0.5378755 51 70.05031 0 0.1 0 0 0 1 
i 2.226908 217.1463 0.5378755 62 72.06289 0 0.1 0 0 0 1 
i 9.209132 217.1463 0.5378755 74 70.05031 0 0.1 0 0 0 1 
i 10.43604 217.1463 0.5378755 85 72.06289 0 0.1 0 0 0 1 
i 4.569188 217.1701 2.703728 60 74.29551 0 0.1 0 0 0 1 
i 5.305333 217.1701 1.335576 55 75.50306 0 0.1 0 0 0 1 
i 5.796096 217.1701 0.7171673 65 76.30809 0 0.1 0 0 0 1 
i 6.041478 217.1701 0.7171673 70 76.71061 0 0.1 0 0 0 1 
i 12.77832 217.1701 2.703728 83 74.29551 0 0.1 0 0 0 1 
i 13.51446 217.1701 2.703728 78 75.50306 0 0.1 0 0 0 1 
i 14.00523 217.1701 0.7171673 88 76.30809 0 0.1 0 0 0 1 
i 14.25061 217.1701 0.7171673 93 76.71061 0 0.1 0 0 0 1 
i 2.784594 217.4455 0.5378755 39 70.05904 0 0.1 0 0 0 1 
i 2.96863 217.4455 0.5378755 41 70.36092 0 0.1 0 0 0 1 
i 3.152666 217.4455 0.5378755 36 70.66281 0 0.1 0 0 0 1 
i 10.99373 217.4455 0.5378755 62 70.05904 0 0.1 0 0 0 1 
i 11.17776 217.4455 0.5378755 64 70.36092 0 0.1 0 0 0 1 
i 11.3618 217.4455 0.5378755 59 70.66281 0 0.1 0 0 0 1 
i 4.81457 217.7885 1.434335 63 74.69736 0 0.1 0 0 0 1 
i 5.059951 217.7885 0.7171673 58 75.09987 0 0.1 0 0 0 1 
i 5.550715 217.7885 1.434335 68 75.90491 0 0.1 0 0 0 1 
i 5.857442 217.7885 0.7171673 64 76.40805 0 0.1 0 0 0 1 
i 6.102823 217.7885 0.7171673 69 76.81057 0 0.1 0 0 0 1 
i 6.28686 217.7885 0.7171673 72 77.11245 0 0.1 0 0 0 1 
i 13.0237 217.7885 1.434335 86 74.69736 0 0.1 0 0 0 1 
i 13.26908 217.7885 0.7171673 81 75.09987 0 0.1 0 0 0 1 
i 13.75985 217.7885 0.7171673 90 75.90491 0 0.1 0 0 0 1 
i 14.06657 217.7885 0.7171673 87 76.40805 0 0.1 0 0 0 1 
i 14.31196 217.7885 0.7171673 92 76.81057 0 0.1 0 0 0 1 
i 14.49599 217.7885 0.7171673 95 77.11245 0 0.1 0 0 0 1 
i 3.766121 217.8947 0.5378755 73 75.91363 0 0.1 0 0 0 1 
i 11.97525 217.8947 0.5378755 96 75.91363 0 0.1 0 0 0 1 
i 1.061345 218.0745 1.075751 51 70.15027 0 0.1 0 0 0 1 
i 1.245382 218.0745 1.075751 48 70.45216 0 0.1 0 0 0 1 
i 1.981527 218.0745 0.5378755 60 71.65971 0 0.1 0 0 0 1 
i 2.288254 218.0745 0.5378755 63 72.16285 0 0.1 0 0 0 1 
i 9.270478 218.0745 1.075751 74 70.15027 0 0.1 0 0 0 1 
i 9.454514 218.0745 0.5378755 71 70.45216 0 0.1 0 0 0 1 
i 10.19066 218.0745 0.5378755 83 71.65971 0 0.1 0 0 0 1 
i 10.49739 218.0745 0.5378755 86 72.16285 0 0.1 0 0 0 1 
i 4.630533 218.1001 0.5378755 67 74.41291 0 0.1 0 0 0 1 
i 4.691879 218.1001 0.5378755 69 74.51354 0 0.1 0 0 0 1 
i 12.83967 218.1001 0.5378755 90 74.41291 0 0.1 0 0 0 1 
i 12.90101 218.1001 0.5378755 92 74.51354 0 0.1 0 0 0 1 
i 2.784594 218.4325 0.5378755 66 74.30356 0 0.1 0 0 0 1 
i 10.99373 218.4325 0.5378755 89 74.30356 0 0.1 0 0 0 1 
i 5.121297 218.5057 0.7171673 59 75.2005 0 0.1 0 0 0 1 
i 5.305333 218.5057 0.7171673 56 75.50239 0 0.1 0 0 0 1 
i 5.796096 218.5057 0.7171673 65 76.30742 0 0.1 0 0 0 1 
i 6.041478 218.5057 0.7171673 70 76.70994 0 0.1 0 0 0 1 
i 6.348205 218.5057 0.7171673 73 77.21308 0 0.1 0 0 0 1 
i 13.33043 218.5057 0.7171673 82 75.2005 0 0.1 0 0 0 1 
i 13.82119 218.5057 0.7171673 91 76.00553 0 0.1 0 0 0 1 
i 14.00523 218.5057 0.7171673 88 76.30742 0 0.1 0 0 0 1 
i 14.25061 218.5057 0.7171673 93 76.70994 0 0.1 0 0 0 1 
i 14.55734 218.5057 0.7171673 96 77.21308 0 0.1 0 0 0 1 
i 2.042872 218.6124 0.5378755 59 71.76034 0 0.1 0 0 0 1 
i 2.226908 218.6124 0.5378755 62 72.06222 0 0.1 0 0 0 1 
i 9.515859 218.6124 0.5378755 71 70.55279 0 0.1 0 0 0 1 
i 10.252 218.6124 0.5378755 82 71.76034 0 0.1 0 0 0 1 
i 10.43604 218.6124 0.5378755 85 72.06222 0 0.1 0 0 0 1 
i 4.569188 218.638 0.5378755 68 74.31229 0 0.1 0 0 0 1 
i 4.753224 218.638 0.5378755 70 74.61417 0 0.1 0 0 0 1 
i 12.77832 218.638 0.5378755 91 74.31229 0 0.1 0 0 0 1 
i 12.96236 218.638 0.5378755 93 74.61417 0 0.1 0 0 0 1 
i 3.275357 218.9483 0.5378755 58 70.8634 0 0.1 0 0 0 1 
i 11.48449 218.9483 0.5378755 81 70.8634 0 0.1 0 0 0 1 
i 4.81457 219.1566 0.7171673 62 74.69669 0 0.1 0 0 0 1 
i 5.059951 219.1566 0.7171673 57 75.0992 0 0.1 0 0 0 1 
i 5.428024 219.1566 0.7171673 55 75.70298 0 0.1 0 0 0 1 
i 5.550715 219.1566 0.7171673 67 75.90423 0 0.1 0 0 0 1 
i 5.918787 219.1566 0.7171673 64 76.50801 0 0.1 0 0 0 1 
i 6.164169 219.1566 0.7171673 69 76.91052 0 0.1 0 0 0 1 
i 6.28686 219.1566 0.7171673 71 77.11178 0 0.1 0 0 0 1 
i 13.0237 219.1566 0.7171673 85 74.69669 0 0.1 0 0 0 1 
i 13.26908 219.1566 0.7171673 80 75.0992 0 0.1 0 0 0 1 
i 13.75985 219.1566 0.7171673 90 75.90423 0 0.1 0 0 0 1 
i 14.12792 219.1566 0.7171673 87 76.50801 0 0.1 0 0 0 1 
i 14.3733 219.1566 0.7171673 92 76.91052 0 0.1 0 0 0 1 
i 14.49599 219.1566 0.7171673 94 77.11178 0 0.1 0 0 0 1 
i 2.845939 219.3671 1.075751 65 74.40352 0 0.1 0 0 0 1 
i 3.766121 219.3671 1.075751 74 75.91296 0 0.1 0 0 0 1 
i 11.05507 219.3671 1.075751 88 74.40352 0 0.1 0 0 0 1 
i 11.97525 219.3671 1.075751 97 75.91296 0 0.1 0 0 0 1 
i 2.784594 219.4862 0.5378755 51 70.05836 0 0.1 0 0 0 1 
i 10.99373 219.4862 0.5378755 74 70.05836 0 0.1 0 0 0 1 
i 1.122691 219.5764 0.5378755 51 70.25023 0 0.1 0 0 0 1 
i 1.245382 219.5764 0.5378755 49 70.45149 0 0.1 0 0 0 1 
i 1.981527 219.5764 0.5378755 61 71.65904 0 0.1 0 0 0 1 
i 2.349599 219.5764 0.5378755 63 72.26281 0 0.1 0 0 0 1 
i 9.331823 219.5764 0.5378755 74 70.25023 0 0.1 0 0 0 1 
i 9.454514 219.5764 0.5378755 72 70.45149 0 0.1 0 0 0 1 
i 10.19066 219.5764 0.5378755 84 71.65904 0 0.1 0 0 0 1 
i 10.55873 219.5764 0.5378755 86 72.26281 0 0.1 0 0 0 1 
i 4.81457 219.7952 0.5378755 50 74.71413 0 0.1 0 0 0 1 
i 13.0237 219.7952 0.5378755 73 74.71413 0 0.1 0 0 0 1 
i 4.569188 219.8738 1.989145 61 74.29417 0 0.1 0 0 0 1 
i 4.93726 219.8738 0.7171673 63 74.89795 0 0.1 0 0 0 1 
i 5.182642 219.8738 1.989145 59 75.30046 0 0.1 0 0 0 1 
i 5.305333 219.8738 0.7171673 56 75.50172 0 0.1 0 0 0 1 
i 5.673405 219.8738 1.989145 68 76.10549 0 0.1 0 0 0 1 
i 5.796096 219.8738 1.989145 66 76.30675 0 0.1 0 0 0 1 
i 6.041478 219.8738 0.7171673 70 76.70927 0 0.1 0 0 0 1 
i 6.40955 219.8738 1.271978 73 77.31304 0 0.1 0 0 0 1 
i 12.77832 219.8738 1.989145 84 74.29417 0 0.1 0 0 0 1 
i 13.14639 219.8738 0.7171673 86 74.89795 0 0.1 0 0 0 1 
i 13.39177 219.8738 1.989145 82 75.30046 0 0.1 0 0 0 1 
i 13.51446 219.8738 0.7171673 79 75.50172 0 0.1 0 0 0 1 
i 13.88254 219.8738 1.989145 91 76.10549 0 0.1 0 0 0 1 
i 14.00523 219.8738 1.989145 89 76.30675 0 0.1 0 0 0 1 
i 14.25061 219.8738 0.7171673 93 76.70927 0 0.1 0 0 0 1 
i 14.61868 219.8738 1.271978 96 77.31304 0 0.1 0 0 0 1 
i 1 220.1143 0.5378755 50 70.04897 0 0.1 0 0 0 1 
i 1.368072 220.1143 0.5378755 48 70.65275 0 0.1 0 0 0 1 
i 2.104217 220.1143 0.5378755 59 71.86029 0 0.1 0 0 0 1 
i 2.226908 220.1143 0.5378755 62 72.06155 0 0.1 0 0 0 1 
i 9.209132 220.1143 0.5378755 73 70.04897 0 0.1 0 0 0 1 
i 9.577205 220.1143 0.5378755 71 70.65275 0 0.1 0 0 0 1 
i 10.31335 220.1143 0.5378755 82 71.86029 0 0.1 0 0 0 1 
i 10.43604 220.1143 0.5378755 85 72.06155 0 0.1 0 0 0 1 
i 4.569188 220.3331 1.529843 55 74.31161 0 0.1 0 0 0 1 
i 12.77832 220.3331 0.5378755 78 74.31161 0 0.1 0 0 0 1 
i 4.691879 220.4286 0.7171673 60 74.49476 0 0.1 0 0 0 1 
i 4.81457 220.4286 1.434335 62 74.69602 0 0.1 0 0 0 1 
i 4.998606 220.4286 0.7171673 64 74.9979 0 0.1 0 0 0 1 
i 5.059951 220.4286 1.434335 58 75.09853 0 0.1 0 0 0 1 
i 5.366678 220.4286 1.434335 57 75.60168 0 0.1 0 0 0 1 
i 5.550715 220.4286 0.7171673 67 75.90356 0 0.1 0 0 0 1 
i 5.918787 220.4286 1.434335 65 76.50734 0 0.1 0 0 0 1 
i 6.102823 220.4286 1.434335 71 76.80922 0 0.1 0 0 0 1 
i 6.164169 220.4286 1.434335 69 76.90985 0 0.1 0 0 0 1 
i 6.28686 220.4286 1.434335 72 77.11111 0 0.1 0 0 0 1 
i 12.90101 220.4286 0.7171673 83 74.49476 0 0.1 0 0 0 1 
i 13.0237 220.4286 1.434335 85 74.69602 0 0.1 0 0 0 1 
i 13.20774 220.4286 0.7171673 87 74.9979 0 0.1 0 0 0 1 
i 13.26908 220.4286 1.434335 81 75.09853 0 0.1 0 0 0 1 
i 13.57581 220.4286 0.7171673 80 75.60168 0 0.1 0 0 0 1 
i 13.63716 220.4286 1.434335 78 75.70231 0 0.1 0 0 0 1 
i 13.75985 220.4286 0.7171673 90 75.90356 0 0.1 0 0 0 1 
i 14.12792 220.4286 1.434335 88 76.50734 0 0.1 0 0 0 1 
i 14.31196 220.4286 0.7171673 94 76.80922 0 0.1 0 0 0 1 
i 14.3733 220.4286 1.434335 92 76.90985 0 0.1 0 0 0 1 
i 14.49599 220.4286 0.7171673 95 77.11111 0 0.1 0 0 0 1 
i 2.845939 220.4877 0.5378755 43 70.15832 0 0.1 0 0 0 1 
i 3.275357 220.4877 0.5378755 31 70.86273 0 0.1 0 0 0 1 
i 11.05507 220.4877 0.5378755 66 70.15832 0 0.1 0 0 0 1 
i 11.48449 220.4877 0.5378755 54 70.86273 0 0.1 0 0 0 1 
i 2.907285 220.8755 0.5378755 64 74.50348 0 0.1 0 0 0 1 
i 3.766121 220.8755 0.5378755 74 75.91229 0 0.1 0 0 0 1 
i 11.11642 220.8755 0.5378755 87 74.50348 0 0.1 0 0 0 1 
i 11.97525 220.8755 0.5378755 97 75.91229 0 0.1 0 0 0 1 
i 1.061345 220.9727 1.075751 49 70.14893 0 0.1 0 0 0 1 
i 1.122691 220.9727 1.075751 50 70.24956 0 0.1 0 0 0 1 
i 1.245382 220.9727 1.075751 48 70.45082 0 0.1 0 0 0 1 
i 1.429418 220.9727 0.5378755 47 70.7527 0 0.1 0 0 0 1 
i 1.981527 220.9727 1.075751 61 71.65836 0 0.1 0 0 0 1 
i 2.165563 220.9727 1.075751 60 71.96025 0 0.1 0 0 0 1 
i 2.288254 220.9727 1.075751 62 72.16151 0 0.1 0 0 0 1 
i 2.349599 220.9727 1.075751 63 72.26214 0 0.1 0 0 0 1 
i 9.270478 220.9727 0.5378755 72 70.14893 0 0.1 0 0 0 1 
i 9.331823 220.9727 1.075751 73 70.24956 0 0.1 0 0 0 1 
i 9.454514 220.9727 0.5378755 71 70.45082 0 0.1 0 0 0 1 
i 9.63855 220.9727 0.5378755 70 70.7527 0 0.1 0 0 0 1 
i 10.19066 220.9727 1.075751 84 71.65836 0 0.1 0 0 0 1 
i 10.3747 220.9727 1.075751 83 71.96025 0 0.1 0 0 0 1 
i 10.49739 220.9727 1.075751 85 72.16151 0 0.1 0 0 0 1 
i 10.55873 220.9727 1.075751 86 72.26214 0 0.1 0 0 0 1 
i 2.784594 221.0256 0.5378755 42 70.05769 0 0.1 0 0 0 1 
i 3.336703 221.0256 0.5378755 30 70.96335 0 0.1 0 0 0 1 
i 10.99373 221.0256 0.5378755 65 70.05769 0 0.1 0 0 0 1 
i 11.54583 221.0256 0.5378755 53 70.96335 0 0.1 0 0 0 1 
i 4.93726 221.1458 0.7171673 63 74.89727 0 0.1 0 0 0 1 
i 5.305333 221.1458 0.7171673 56 75.50105 0 0.1 0 0 0 1 
i 5.980132 221.1458 0.7171673 64 76.60797 0 0.1 0 0 0 1 
i 6.041478 221.1458 0.7171673 70 76.7086 0 0.1 0 0 0 1 
i 13.14639 221.1458 0.7171673 86 74.89727 0 0.1 0 0 0 1 
i 13.33043 221.1458 0.7171673 80 75.19916 0 0.1 0 0 0 1 
i 13.51446 221.1458 0.7171673 79 75.50105 0 0.1 0 0 0 1 
i 14.18926 221.1458 0.7171673 87 76.60797 0 0.1 0 0 0 1 
i 14.25061 221.1458 0.7171673 93 76.7086 0 0.1 0 0 0 1 
i 14.55734 221.1458 0.7171673 94 77.21174 0 0.1 0 0 0 1 
i 14.61868 221.1458 0.7171673 95 77.31237 0 0.1 0 0 0 1 
i 4.630533 221.2677 0.5378755 67 74.41157 0 0.1 0 0 0 1 
i 4.81457 221.2677 0.5378755 72 74.71346 0 0.1 0 0 0 1 
i 12.83967 221.2677 0.5378755 90 74.41157 0 0.1 0 0 0 1 
i 13.0237 221.2677 0.5378755 95 74.71346 0 0.1 0 0 0 1 
i 2.784594 221.4134 0.5378755 65 74.30222 0 0.1 0 0 0 1 
i 3.888811 221.4134 0.5378755 75 76.11354 0 0.1 0 0 0 1 
i 10.99373 221.4134 0.5378755 88 74.30222 0 0.1 0 0 0 1 
i 12.09794 221.4134 0.5378755 98 76.11354 0 0.1 0 0 0 1 
i 1.184036 221.5106 0.5378755 51 70.35019 0 0.1 0 0 0 1 
i 9.393168 221.5106 0.5378755 74 70.35019 0 0.1 0 0 0 1 
i 9.515859 221.5106 0.5378755 72 70.55145 0 0.1 0 0 0 1 
i 9.577205 221.5106 0.5378755 71 70.65208 0 0.1 0 0 0 1 
i 4.569188 221.8056 0.5378755 68 74.31094 0 0.1 0 0 0 1 
i 4.875915 221.8056 0.5378755 73 74.81409 0 0.1 0 0 0 1 
i 12.77832 221.8056 0.5378755 91 74.31094 0 0.1 0 0 0 1 
i 13.08505 221.8056 0.5378755 96 74.81409 0 0.1 0 0 0 1 
i 2.907285 222.0647 0.5378755 50 70.25828 0 0.1 0 0 0 1 
i 3.275357 222.0647 0.5378755 58 70.86205 0 0.1 0 0 0 1 
i 11.11642 222.0647 0.5378755 73 70.25828 0 0.1 0 0 0 1 
i 11.48449 222.0647 0.5378755 81 70.86205 0 0.1 0 0 0 1 
i 2.845939 222.2779 0.5378755 65 74.40218 0 0.1 0 0 0 1 
i 2.907285 222.2779 1.075751 63 74.50281 0 0.1 0 0 0 1 
i 3.766121 222.2779 0.5378755 75 75.91161 0 0.1 0 0 0 1 
i 3.950157 222.2779 1.075751 76 76.2135 0 0.1 0 0 0 1 
i 11.05507 222.2779 0.5378755 88 74.40218 0 0.1 0 0 0 1 
i 11.11642 222.2779 1.075751 86 74.50281 0 0.1 0 0 0 1 
i 11.97525 222.2779 0.5378755 98 75.91161 0 0.1 0 0 0 1 
i 12.15929 222.2779 1.075751 99 76.2135 0 0.1 0 0 0 1 
i 2.784594 222.6026 0.5378755 52 70.05702 0 0.1 0 0 0 1 
i 3.398048 222.6026 0.5378755 60 71.06331 0 0.1 0 0 0 1 
i 10.99373 222.6026 0.5378755 75 70.05702 0 0.1 0 0 0 1 
i 11.60718 222.6026 0.5378755 83 71.06331 0 0.1 0 0 0 1 
i 4.691879 222.7761 0.5378755 60 74.51153 0 0.1 0 0 0 1 
i 4.81457 222.7761 1.075751 59 74.71279 0 0.1 0 0 0 1 
i 12.90101 222.7761 0.5378755 83 74.51153 0 0.1 0 0 0 1 
i 13.0237 222.7761 1.075751 82 74.71279 0 0.1 0 0 0 1 
i 2.784594 222.8158 0.5378755 64 74.30155 0 0.1 0 0 0 1 
i 3.827466 222.8158 0.5378755 74 76.01224 0 0.1 0 0 0 1 
i 10.99373 222.8158 0.5378755 87 74.30155 0 0.1 0 0 0 1 
i 12.0366 222.8158 0.5378755 97 76.01224 0 0.1 0 0 0 1 
i 1.490763 222.9162 0.5378755 49 70.85266 0 0.1 0 0 0 1 
i 1.981527 222.9162 0.5378755 57 71.65769 0 0.1 0 0 0 1 
i 9.699895 222.9162 0.5378755 72 70.85266 0 0.1 0 0 0 1 
i 10.19066 222.9162 0.5378755 80 71.65769 0 0.1 0 0 0 1 
i 4.93726 223.314 0.5378755 58 74.91405 0 0.1 0 0 0 1 
i 13.14639 223.314 0.5378755 81 74.91405 0 0.1 0 0 0 1 
i 1 223.4541 0.5378755 53 70.04763 0 0.1 0 0 0 1 
i 2.47229 223.4541 0.5378755 62 72.46273 0 0.1 0 0 0 1 
i 9.209132 223.4541 0.5378755 76 70.04763 0 0.1 0 0 0 1 
i 10.68142 223.4541 0.5378755 85 72.46273 0 0.1 0 0 0 1 
i 2.845939 223.5308 1.075751 48 70.15698 0 0.1 0 0 0 1 
i 3.275357 223.5308 1.075751 50 70.86138 0 0.1 0 0 0 1 
i 3.459394 223.5308 0.5378755 51 71.16327 0 0.1 0 0 0 1 
i 11.05507 223.5308 1.075751 71 70.15698 0 0.1 0 0 0 1 
i 11.48449 223.5308 0.5378755 73 70.86138 0 0.1 0 0 0 1 
i 11.66853 223.5308 0.5378755 74 71.16327 0 0.1 0 0 0 1 
i 3.029976 223.8923 1.027924 63 74.7034 0 0.1 0 0 0 1 
i 3.766121 223.8923 0.5378755 74 75.91094 0 0.1 0 0 0 1 
i 11.23911 223.8923 1.027924 86 74.7034 0 0.1 0 0 0 1 
i 11.97525 223.8923 0.5378755 97 75.91094 0 0.1 0 0 0 1 
i 11.54583 224.0687 0.5378755 73 70.96201 0 0.1 0 0 0 1 
i 4.630533 224.1784 1.075751 53 74.41023 0 0.1 0 0 0 1 
i 4.691879 224.1784 0.5378755 54 74.51086 0 0.1 0 0 0 1 
i 4.81457 224.1784 0.5378755 51 74.71212 0 0.1 0 0 0 1 
i 4.998606 224.1784 0.5378755 49 75.014 0 0.1 0 0 0 1 
i 12.83967 224.1784 1.075751 76 74.41023 0 0.1 0 0 0 1 
i 12.90101 224.1784 0.5378755 77 74.51086 0 0.1 0 0 0 1 
i 13.0237 224.1784 0.5378755 74 74.71212 0 0.1 0 0 0 1 
i 13.20774 224.1784 0.5378755 72 75.014 0 0.1 0 0 0 1 
i 1.061345 224.3823 0.5378755 54 70.14759 0 0.1 0 0 0 1 
i 1.490763 224.3823 0.5378755 49 70.85199 0 0.1 0 0 0 1 
i 1.981527 224.3823 1.075751 57 71.65702 0 0.1 0 0 0 1 
i 9.270478 224.3823 0.5378755 77 70.14759 0 0.1 0 0 0 1 
i 9.699895 224.3823 0.5378755 72 70.85199 0 0.1 0 0 0 1 
i 10.19066 224.3823 1.075751 80 71.65702 0 0.1 0 0 0 1 
i 2.784594 224.4302 0.5378755 65 74.30088 0 0.1 0 0 0 1 
i 4.011502 224.4302 0.5378755 76 76.31346 0 0.1 0 0 0 1 
i 10.99373 224.4302 0.5378755 88 74.30088 0 0.1 0 0 0 1 
i 12.22063 224.4302 0.5378755 99 76.31346 0 0.1 0 0 0 1 
i 4.753224 224.7163 0.5378755 55 74.61149 0 0.1 0 0 0 1 
i 4.875915 224.7163 0.5378755 52 74.81275 0 0.1 0 0 0 1 
i 4.93726 224.7163 0.5378755 50 74.91338 0 0.1 0 0 0 1 
i 12.96236 224.7163 0.5378755 78 74.61149 0 0.1 0 0 0 1 
i 13.08505 224.7163 0.5378755 75 74.81275 0 0.1 0 0 0 1 
i 13.14639 224.7163 0.5378755 73 74.91338 0 0.1 0 0 0 1 
i 1 224.9202 0.5378755 53 70.04696 0 0.1 0 0 0 1 
i 1.552109 224.9202 0.5378755 48 70.95262 0 0.1 0 0 0 1 
i 2.47229 224.9202 0.5378755 62 72.46205 0 0.1 0 0 0 1 
i 9.209132 224.9202 0.5378755 76 70.04696 0 0.1 0 0 0 1 
i 9.761241 224.9202 0.5378755 71 70.95262 0 0.1 0 0 0 1 
i 10.68142 224.9202 0.5378755 85 72.46205 0 0.1 0 0 0 1 
i 3.029976 225.2186 0.5378755 43 70.4582 0 0.1 0 0 0 1 
i 3.275357 225.2186 0.5378755 37 70.86071 0 0.1 0 0 0 1 
i 11.23911 225.2186 0.5378755 66 70.4582 0 0.1 0 0 0 1 
i 11.48449 225.2186 0.5378755 60 70.86071 0 0.1 0 0 0 1 
i 2.845939 225.2946 0.5378755 66 74.40084 0 0.1 0 0 0 1 
i 3.029976 225.2946 0.5378755 63 74.70273 0 0.1 0 0 0 1 
i 3.766121 225.2946 0.5378755 74 75.91027 0 0.1 0 0 0 1 
i 4.072848 225.2946 0.5378755 77 76.41342 0 0.1 0 0 0 1 
i 11.05507 225.2946 0.5378755 89 74.40084 0 0.1 0 0 0 1 
i 11.23911 225.2946 0.5378755 86 74.70273 0 0.1 0 0 0 1 
i 11.97525 225.2946 0.5378755 97 75.91027 0 0.1 0 0 0 1 
i 12.28198 225.2946 0.5378755 100 76.41342 0 0.1 0 0 0 1 
i 2.784594 225.7565 0.5378755 39 70.05568 0 0.1 0 0 0 1 
i 3.520739 225.7565 0.5378755 33 71.26323 0 0.1 0 0 0 1 
i 10.99373 225.7565 0.5378755 62 70.05568 0 0.1 0 0 0 1 
i 11.72987 225.7565 0.5378755 56 71.26323 0 0.1 0 0 0 1 
i 2.784594 225.8325 0.5378755 65 74.30021 0 0.1 0 0 0 1 
i 3.091321 225.8325 0.5378755 62 74.80335 0 0.1 0 0 0 1 
i 3.827466 225.8325 0.5378755 73 76.0109 0 0.1 0 0 0 1 
i 4.011502 225.8325 0.5378755 76 76.31279 0 0.1 0 0 0 1 
i 10.99373 225.8325 0.5378755 88 74.30021 0 0.1 0 0 0 1 
i 11.30045 225.8325 0.5378755 85 74.80335 0 0.1 0 0 0 1 
i 12.0366 225.8325 0.5378755 96 76.0109 0 0.1 0 0 0 1 
i 12.22063 225.8325 0.5378755 99 76.31279 0 0.1 0 0 0 1 
i 1.122691 225.8842 0.5378755 54 70.24755 0 0.1 0 0 0 1 
i 1.490763 225.8842 0.5378755 49 70.85132 0 0.1 0 0 0 1 
i 1.981527 225.8842 0.5378755 57 71.65635 0 0.1 0 0 0 1 
i 2.594981 225.8842 0.5378755 63 72.66264 0 0.1 0 0 0 1 
i 9.331823 225.8842 0.5378755 77 70.24755 0 0.1 0 0 0 1 
i 9.699895 225.8842 0.5378755 72 70.85132 0 0.1 0 0 0 1 
i 10.19066 225.8842 0.5378755 80 71.65635 0 0.1 0 0 0 1 
i 10.80411 225.8842 0.5378755 86 72.66264 0 0.1 0 0 0 1 
i 5.059951 226.1305 0.5378755 72 75.11396 0 0.1 0 0 0 1 
i 13.26908 226.1305 0.5378755 95 75.11396 0 0.1 0 0 0 1 
i 1 226.4221 0.5378755 53 70.04629 0 0.1 0 0 0 1 
i 1.613454 226.4221 0.5378755 48 71.05258 0 0.1 0 0 0 1 
i 2.104217 226.4221 0.5378755 56 71.85761 0 0.1 0 0 0 1 
i 2.47229 226.4221 0.5378755 62 72.46138 0 0.1 0 0 0 1 
i 9.209132 226.4221 0.5378755 76 70.04629 0 0.1 0 0 0 1 
i 9.822586 226.4221 0.5378755 71 71.05258 0 0.1 0 0 0 1 
i 10.31335 226.4221 0.5378755 79 71.85761 0 0.1 0 0 0 1 
i 10.68142 226.4221 0.5378755 85 72.46138 0 0.1 0 0 0 1 
i 4.569188 226.6683 0.5378755 65 74.30893 0 0.1 0 0 0 1 
i 12.77832 226.6683 0.5378755 88 74.30893 0 0.1 0 0 0 1 
i 2.845939 226.6847 0.5378755 60 70.15564 0 0.1 0 0 0 1 
i 3.029976 226.6847 0.5378755 54 70.45753 0 0.1 0 0 0 1 
i 3.275357 226.6847 0.5843945 63 70.86004 0 0.1 0 0 0 1 
i 3.582084 226.6847 0.5378755 69 71.36319 0 0.1 0 0 0 1 
i 11.05507 226.6847 0.5378755 83 70.15564 0 0.1 0 0 0 1 
i 11.23911 226.6847 0.5378755 77 70.45753 0 0.1 0 0 0 1 
i 11.48449 226.6847 0.5843945 86 70.86004 0 0.1 0 0 0 1 
i 11.79122 226.6847 0.5378755 92 71.36319 0 0.1 0 0 0 1 
i 2.907285 226.7312 0.5378755 65 74.5008 0 0.1 0 0 0 1 
i 3.766121 226.7312 0.5378755 75 75.9096 0 0.1 0 0 0 1 
i 4.134193 226.7312 0.5378755 77 76.51338 0 0.1 0 0 0 1 
i 11.11642 226.7312 0.5378755 88 74.5008 0 0.1 0 0 0 1 
i 11.97525 226.7312 0.5378755 98 75.9096 0 0.1 0 0 0 1 
i 12.34333 226.7312 0.5378755 100 76.51338 0 0.1 0 0 0 1 
i 2.784594 227.2226 0.5378755 59 70.05501 0 0.1 0 0 0 1 
i 3.091321 227.2226 0.5378755 53 70.55816 0 0.1 0 0 0 1 
i 3.336703 227.2226 0.5957946 62 70.96067 0 0.1 0 0 0 1 
i 3.520739 227.2226 0.5378755 68 71.26256 0 0.1 0 0 0 1 
i 10.99373 227.2226 0.5378755 82 70.05501 0 0.1 0 0 0 1 
i 11.30045 227.2226 0.5378755 76 70.55816 0 0.1 0 0 0 1 
i 11.54583 227.2226 0.5378755 85 70.96067 0 0.1 0 0 0 1 
i 11.72987 227.2226 0.5378755 91 71.26256 0 0.1 0 0 0 1 
i 2.784594 227.2691 0.5378755 64 74.29954 0 0.1 0 0 0 1 
i 3.888811 227.2691 0.5378755 74 76.11086 0 0.1 0 0 0 1 
i 4.011502 227.2691 0.5378755 76 76.31212 0 0.1 0 0 0 1 
i 10.99373 227.2691 0.5378755 87 74.29954 0 0.1 0 0 0 1 
i 11.3618 227.2691 1.873452 85 74.90331 0 0.1 0 0 0 1 
i 12.09794 227.2691 0.5378755 97 76.11086 0 0.1 0 0 0 1 
i 12.22063 227.2691 0.5378755 99 76.31212 0 0.1 0 0 0 1 
i 1.061345 227.2805 0.5378755 53 70.14625 0 0.1 0 0 0 1 
i 1.122691 227.2805 1.075751 54 70.24688 0 0.1 0 0 0 1 
i 1.490763 227.2805 0.5378755 48 70.85065 0 0.1 0 0 0 1 
i 1.6748 227.2805 0.5378755 47 71.15254 0 0.1 0 0 0 1 
i 1.981527 227.2805 1.075751 57 71.65568 0 0.1 0 0 0 1 
i 2.165563 227.2805 1.075751 56 71.95757 0 0.1 0 0 0 1 
i 2.594981 227.2805 2.145305 63 72.66197 0 0.1 0 0 0 1 
i 9.270478 227.2805 0.5378755 76 70.14625 0 0.1 0 0 0 1 
i 9.331823 227.2805 1.075751 77 70.24688 0 0.1 0 0 0 1 
i 9.699895 227.2805 1.075751 71 70.85065 0 0.1 0 0 0 1 
i 9.883932 227.2805 0.5378755 70 71.15254 0 0.1 0 0 0 1 
i 10.19066 227.2805 1.075751 80 71.65568 0 0.1 0 0 0 1 
i 10.3747 227.2805 1.075751 79 71.95757 0 0.1 0 0 0 1 
i 10.80411 227.2805 2.145305 86 72.66197 0 0.1 0 0 0 1 
i 4.630533 227.6029 0.5378755 57 74.40889 0 0.1 0 0 0 1 
i 5.059951 227.6029 0.5378755 45 75.11329 0 0.1 0 0 0 1 
i 12.83967 227.6029 0.5378755 80 74.40889 0 0.1 0 0 0 1 
i 13.26908 227.6029 0.5378755 68 75.11329 0 0.1 0 0 0 1 
i 1.184036 227.8184 0.5378755 55 70.34751 0 0.1 0 0 0 1 
i 1.552109 227.8184 0.5378755 49 70.95128 0 0.1 0 0 0 1 
i 1.613454 227.8184 0.5378755 48 71.05191 0 0.1 0 0 0 1 
i 2.47229 227.8184 0.5378755 62 72.46071 0 0.1 0 0 0 1 
i 9.393168 227.8184 0.5378755 78 70.34751 0 0.1 0 0 0 1 
i 9.761241 227.8184 0.5378755 72 70.95128 0 0.1 0 0 0 1 
i 2.907285 228.0668 1.075751 65 74.50013 0 0.1 0 0 0 1 
i 3.029976 228.0668 1.075751 62 74.70138 0 0.1 0 0 0 1 
i 3.214012 228.0668 0.5378755 61 75.00327 0 0.1 0 0 0 1 
i 3.766121 228.0668 0.5378755 75 75.90893 0 0.1 0 0 0 1 
i 3.950157 228.0668 1.075751 74 76.21082 0 0.1 0 0 0 1 
i 4.072848 228.0668 1.075751 76 76.41208 0 0.1 0 0 0 1 
i 4.134193 228.0668 1.075751 77 76.5127 0 0.1 0 0 0 1 
i 11.11642 228.0668 1.075751 88 74.50013 0 0.1 0 0 0 1 
i 11.42314 228.0668 0.5378755 84 75.00327 0 0.1 0 0 0 1 
i 11.97525 228.0668 0.5378755 98 75.90893 0 0.1 0 0 0 1 
i 12.15929 228.0668 1.075751 97 76.21082 0 0.1 0 0 0 1 
i 12.28198 228.0668 1.075751 99 76.41208 0 0.1 0 0 0 1 
i 12.34333 228.0668 1.075751 100 76.5127 0 0.1 0 0 0 1 
i 4.569188 228.1408 0.5378755 56 74.30826 0 0.1 0 0 0 1 
i 5.121297 228.1408 0.5378755 44 75.21392 0 0.1 0 0 0 1 
i 12.77832 228.1408 0.5378755 79 74.30826 0 0.1 0 0 0 1 
i 13.33043 228.1408 0.5378755 67 75.21392 0 0.1 0 0 0 1 
i 2.907285 228.1865 0.5378755 40 70.2556 0 0.1 0 0 0 1 
i 3.029976 228.1865 0.5378755 42 70.45686 0 0.1 0 0 0 1 
i 3.275357 228.1865 0.5378755 37 70.85937 0 0.1 0 0 0 1 
i 3.64343 228.1865 0.5378755 34 71.46314 0 0.1 0 0 0 1 
i 11.11642 228.1865 0.5378755 63 70.2556 0 0.1 0 0 0 1 
i 11.23911 228.1865 0.5378755 65 70.45686 0 0.1 0 0 0 1 
i 11.48449 228.1865 0.5378755 60 70.85937 0 0.1 0 0 0 1 
i 11.85256 228.1865 0.5378755 57 71.46314 0 0.1 0 0 0 1 
i 2.784594 228.6047 0.5378755 64 74.29887 0 0.1 0 0 0 1 
i 4.195539 228.6047 0.5378755 78 76.61333 0 0.1 0 0 0 1 
i 10.99373 228.6047 0.5378755 87 74.29887 0 0.1 0 0 0 1 
i 12.40467 228.6047 0.5378755 101 76.61333 0 0.1 0 0 0 1 
i 2.784594 228.7244 0.5378755 41 70.05434 0 0.1 0 0 0 1 
i 3.152666 228.7244 0.5378755 44 70.65811 0 0.1 0 0 0 1 
i 3.398048 228.7244 0.5378755 38 71.06063 0 0.1 0 0 0 1 
i 3.520739 228.7244 0.5378755 36 71.26189 0 0.1 0 0 0 1 
i 10.99373 228.7244 0.5378755 64 70.05434 0 0.1 0 0 0 1 
i 11.3618 228.7244 0.5378755 67 70.65811 0 0.1 0 0 0 1 
i 11.60718 228.7244 0.5378755 61 71.06063 0 0.1 0 0 0 1 
i 11.72987 228.7244 0.5378755 59 71.26189 0 0.1 0 0 0 1 
i 1.245382 228.8879 0.5378755 54 70.44746 0 0.1 0 0 0 1 
i 1.490763 228.8879 0.5378755 50 70.84998 0 0.1 0 0 0 1 
i 1.981527 228.8879 0.5378755 59 71.65501 0 0.1 0 0 0 1 
i 9.454514 228.8879 0.5378755 77 70.44746 0 0.1 0 0 0 1 
i 9.699895 228.8879 0.5378755 73 70.84998 0 0.1 0 0 0 1 
i 10.19066 228.8879 0.5378755 82 71.65501 0 0.1 0 0 0 1 
i 4.691879 229.1113 0.5378755 64 74.50885 0 0.1 0 0 0 1 
i 5.059951 229.1113 0.5378755 73 75.11262 0 0.1 0 0 0 1 
i 12.90101 229.1113 0.5378755 87 74.50885 0 0.1 0 0 0 1 
i 13.26908 229.1113 0.5378755 96 75.11262 0 0.1 0 0 0 1 
i 1 229.4258 0.5378755 52 70.04495 0 0.1 0 0 0 1 
i 1.736145 229.4258 0.5378755 48 71.25249 0 0.1 0 0 0 1 
i 2.226908 229.4258 0.5378755 56 72.05753 0 0.1 0 0 0 1 
i 2.47229 229.4258 0.5378755 60 72.46004 0 0.1 0 0 0 1 
i 9.209132 229.4258 0.5378755 75 70.04495 0 0.1 0 0 0 1 
i 9.945277 229.4258 0.5378755 71 71.25249 0 0.1 0 0 0 1 
i 10.43604 229.4258 0.5378755 79 72.05753 0 0.1 0 0 0 1 
i 10.68142 229.4258 0.5378755 83 72.46004 0 0.1 0 0 0 1 
i 2.845939 229.5828 1.075751 42 70.1543 0 0.1 0 0 0 1 
i 2.907285 229.5828 1.075751 41 70.25493 0 0.1 0 0 0 1 
i 3.029976 229.5828 1.075751 43 70.45618 0 0.1 0 0 0 1 
i 3.214012 229.5828 1.075751 44 70.75807 0 0.1 0 0 0 1 
i 3.275357 229.5828 1.075751 39 70.8587 0 0.1 0 0 0 1 
i 3.459394 229.5828 1.075751 40 71.16059 0 0.1 0 0 0 1 
i 3.582084 229.5828 1.075751 38 71.36184 0 0.1 0 0 0 1 
i 3.64343 229.5828 0.5378755 37 71.46247 0 0.1 0 0 0 1 
i 11.05507 229.5828 1.075751 65 70.1543 0 0.1 0 0 0 1 
i 11.11642 229.5828 1.075751 64 70.25493 0 0.1 0 0 0 1 
i 11.23911 229.5828 1.075751 66 70.45618 0 0.1 0 0 0 1 
i 11.42314 229.5828 1.075751 67 70.75807 0 0.1 0 0 0 1 
i 11.48449 229.5828 0.5378755 62 70.8587 0 0.1 0 0 0 1 
i 11.66853 229.5828 1.075751 63 71.16059 0 0.1 0 0 0 1 
i 11.79122 229.5828 1.075751 61 71.36184 0 0.1 0 0 0 1 
i 11.85256 229.5828 0.5378755 60 71.46247 0 0.1 0 0 0 1 
i 4.569188 229.6492 0.5378755 66 74.30759 0 0.1 0 0 0 1 
i 5.182642 229.6492 0.5378755 75 75.31388 0 0.1 0 0 0 1 
i 12.77832 229.6492 0.5378755 89 74.30759 0 0.1 0 0 0 1 
i 13.39177 229.6492 0.5378755 98 75.31388 0 0.1 0 0 0 1 
i 3.275357 229.9258 1.940231 63 75.10323 0 0.1 0 0 0 1 
i 3.766121 229.9258 0.5378755 72 75.90826 0 0.1 0 0 0 1 
i 11.48449 229.9258 1.940231 86 75.10323 0 0.1 0 0 0 1 
i 11.97525 229.9258 0.5378755 95 75.90826 0 0.1 0 0 0 1 
i 3.704775 230.1207 0.5378755 36 71.5631 0 0.1 0 0 0 1 
i 11.54583 230.1207 0.5378755 62 70.95933 0 0.1 0 0 0 1 
i 11.91391 230.1207 0.5378755 59 71.5631 0 0.1 0 0 0 1 
i 1.061345 230.2842 0.5378755 51 70.14491 0 0.1 0 0 0 1 
i 1.245382 230.2842 0.5378755 54 70.44679 0 0.1 0 0 0 1 
i 1.490763 230.2842 0.5378755 50 70.84931 0 0.1 0 0 0 1 
i 1.79749 230.2842 0.5378755 47 71.35245 0 0.1 0 0 0 1 
i 1.981527 230.2842 1.075751 59 71.65434 0 0.1 0 0 0 1 
i 2.288254 230.2842 1.075751 56 72.15748 0 0.1 0 0 0 1 
i 2.533635 230.2842 0.5378755 60 72.56 0 0.1 0 0 0 1 
i 9.270478 230.2842 0.5378755 74 70.14491 0 0.1 0 0 0 1 
i 9.454514 230.2842 0.5378755 77 70.44679 0 0.1 0 0 0 1 
i 9.699895 230.2842 0.5378755 73 70.84931 0 0.1 0 0 0 1 
i 10.00662 230.2842 0.5378755 70 71.35245 0 0.1 0 0 0 1 
i 10.19066 230.2842 1.075751 82 71.65434 0 0.1 0 0 0 1 
i 10.49739 230.2842 1.075751 79 72.15748 0 0.1 0 0 0 1 
i 10.74277 230.2842 1.075751 83 72.56 0 0.1 0 0 0 1 
i 2.784594 230.4637 0.5378755 67 74.2982 0 0.1 0 0 0 1 
i 4.256884 230.4637 0.5378755 76 76.71329 0 0.1 0 0 0 1 
i 10.99373 230.4637 0.5378755 90 74.2982 0 0.1 0 0 0 1 
i 12.46602 230.4637 0.5378755 99 76.71329 0 0.1 0 0 0 1 
i 4.630533 230.5137 0.5378755 63 74.40755 0 0.1 0 0 0 1 
i 4.691879 230.5137 1.075751 62 74.50818 0 0.1 0 0 0 1 
i 5.059951 230.5137 1.075751 64 75.11195 0 0.1 0 0 0 1 
i 5.243987 230.5137 1.075751 65 75.41384 0 0.1 0 0 0 1 
i 12.83967 230.5137 0.5378755 86 74.40755 0 0.1 0 0 0 1 
i 12.90101 230.5137 1.075751 85 74.50818 0 0.1 0 0 0 1 
i 13.26908 230.5137 1.075751 87 75.11195 0 0.1 0 0 0 1 
i 13.45312 230.5137 1.075751 88 75.41384 0 0.1 0 0 0 1 
i 1 230.8221 0.5378755 52 70.04428 0 0.1 0 0 0 1 
i 1.306727 230.8221 0.5378755 55 70.54742 0 0.1 0 0 0 1 
i 1.552109 230.8221 0.5378755 51 70.94994 0 0.1 0 0 0 1 
i 1.736145 230.8221 0.5378755 48 71.25182 0 0.1 0 0 0 1 
i 2.47229 230.8221 0.5378755 60 72.45937 0 0.1 0 0 0 1 
i 9.209132 230.8221 0.5378755 75 70.04428 0 0.1 0 0 0 1 
i 9.515859 230.8221 0.5378755 78 70.54742 0 0.1 0 0 0 1 
i 9.761241 230.8221 0.5378755 74 70.94994 0 0.1 0 0 0 1 
i 9.945277 230.8221 0.5378755 71 71.25182 0 0.1 0 0 0 1 
i 2.845939 231.3282 1.075751 68 74.39816 0 0.1 0 0 0 1 
i 3.766121 231.3282 1.075751 71 75.90759 0 0.1 0 0 0 1 
i 4.318229 231.3282 0.5378755 77 76.81325 0 0.1 0 0 0 1 
i 11.05507 231.3282 1.075751 91 74.39816 0 0.1 0 0 0 1 
i 11.97525 231.3282 1.075751 94 75.90759 0 0.1 0 0 0 1 
i 12.52736 231.3282 0.5378755 100 76.81325 0 0.1 0 0 0 1 
i 1.122691 231.7145 0.5378755 51 70.24486 0 0.1 0 0 0 1 
i 1.245382 231.7145 0.5378755 54 70.44612 0 0.1 0 0 0 1 
i 1.490763 231.7145 0.5378755 49 70.84864 0 0.1 0 0 0 1 
i 1.858836 231.7145 0.5378755 47 71.45241 0 0.1 0 0 0 1 
i 1.981527 231.7145 0.5378755 58 71.65367 0 0.1 0 0 0 1 
i 2.349599 231.7145 0.5378755 56 72.25744 0 0.1 0 0 0 1 
i 2.594981 231.7145 0.5378755 60 72.65996 0 0.1 0 0 0 1 
i 2.717672 231.7145 0.6894098 62 72.86122 0 0.1 0 0 0 1 
i 9.331823 231.7145 0.5378755 74 70.24486 0 0.1 0 0 0 1 
i 9.454514 231.7145 0.5378755 77 70.44612 0 0.1 0 0 0 1 
i 9.699895 231.7145 0.5378755 72 70.84864 0 0.1 0 0 0 1 
i 10.06797 231.7145 0.5378755 70 71.45241 0 0.1 0 0 0 1 
i 10.19066 231.7145 0.5378755 81 71.65367 0 0.1 0 0 0 1 
i 10.55873 231.7145 0.5378755 79 72.25744 0 0.1 0 0 0 1 
i 10.80411 231.7145 0.5378755 83 72.65996 0 0.1 0 0 0 1 
i 10.9268 231.7145 0.5378755 85 72.86122 0 0.1 0 0 0 1 
i 4.256884 231.8661 0.5378755 76 76.71262 0 0.1 0 0 0 1 
i 11.54583 231.8661 0.5378755 85 75.20319 0 0.1 0 0 0 1 
i 12.46602 231.8661 0.5378755 99 76.71262 0 0.1 0 0 0 1 
i 4.81457 232.1281 0.5378755 57 74.70876 0 0.1 0 0 0 1 
i 5.059951 232.1281 0.5378755 51 75.11128 0 0.1 0 0 0 1 
i 13.0237 232.1281 0.5378755 80 74.70876 0 0.1 0 0 0 1 
i 13.26908 232.1281 0.5378755 74 75.11128 0 0.1 0 0 0 1 
i 3.766121 232.1947 0.5378755 42 71.66306 0 0.1 0 0 0 1 
i 11.97525 232.1947 0.5378755 65 71.66306 0 0.1 0 0 0 1 
i 1 232.2524 0.5378755 53 70.04361 0 0.1 0 0 0 1 
i 1.368072 232.2524 0.5378755 55 70.64738 0 0.1 0 0 0 1 
i 1.613454 232.2524 0.5378755 51 71.0499 0 0.1 0 0 0 1 
i 1.736145 232.2524 0.5378755 48 71.25115 0 0.1 0 0 0 1 
i 2.104217 232.2524 0.5378755 59 71.85493 0 0.1 0 0 0 1 
i 2.226908 232.2524 0.5378755 57 72.05618 0 0.1 0 0 0 1 
i 2.47229 232.2524 0.5378755 61 72.4587 0 0.1 0 0 0 1 
i 2.840362 232.2524 1.050218 63 73.06247 0 0.1 0 0 0 1 
i 9.209132 232.2524 0.5378755 76 70.04361 0 0.1 0 0 0 1 
i 9.577205 232.2524 0.5378755 78 70.64738 0 0.1 0 0 0 1 
i 9.822586 232.2524 0.5378755 74 71.0499 0 0.1 0 0 0 1 
i 9.945277 232.2524 0.5378755 71 71.25115 0 0.1 0 0 0 1 
i 10.31335 232.2524 0.5378755 82 71.85493 0 0.1 0 0 0 1 
i 10.43604 232.2524 0.5378755 80 72.05618 0 0.1 0 0 0 1 
i 10.68142 232.2524 0.5378755 84 72.4587 0 0.1 0 0 0 1 
i 11.04949 232.2524 1.050218 86 73.06247 0 0.1 0 0 0 1 
i 4.569188 232.666 0.5378755 54 74.30625 0 0.1 0 0 0 1 
i 5.305333 232.666 0.5378755 47 75.51379 0 0.1 0 0 0 1 
i 12.77832 232.666 0.5378755 77 74.30625 0 0.1 0 0 0 1 
i 13.51446 232.666 0.5378755 70 75.51379 0 0.1 0 0 0 1 
i 2.784594 232.7326 0.5378755 48 70.053 0 0.1 0 0 0 1 
i 10.99373 232.7326 0.5378755 71 70.053 0 0.1 0 0 0 1 
i 2.907285 232.7648 0.5378755 69 74.49811 0 0.1 0 0 0 1 
i 3.766121 232.7648 0.5378755 72 75.90692 0 0.1 0 0 0 1 
i 4.379575 232.7648 0.5378755 77 76.91321 0 0.1 0 0 0 1 
i 11.11642 232.7648 0.5378755 92 74.49811 0 0.1 0 0 0 1 
i 11.97525 232.7648 0.5378755 95 75.90692 0 0.1 0 0 0 1 
i 12.58871 232.7648 0.5378755 100 76.91321 0 0.1 0 0 0 1 
i 1.061345 233.0443 1.075751 53 70.14356 0 0.1 0 0 0 1 
i 1.122691 233.0443 1.075751 52 70.24419 0 0.1 0 0 0 1 
i 1.245382 233.0443 1.075751 54 70.44545 0 0.1 0 0 0 1 
i 1.429418 233.0443 0.5378755 55 70.74734 0 0.1 0 0 0 1 
i 1.490763 233.0443 0.5378755 50 70.84797 0 0.1 0 0 0 1 
i 1.6748 233.0443 0.5378755 51 71.14985 0 0.1 0 0 0 1 
i 1.79749 233.0443 1.075751 49 71.35111 0 0.1 0 0 0 1 
i 1.858836 233.0443 1.075751 47 71.45174 0 0.1 0 0 0 1 
i 1.981527 233.0443 1.075751 58 71.653 0 0.1 0 0 0 1 
i 2.165563 233.0443 1.075751 59 71.95488 0 0.1 0 0 0 1 
i 2.288254 233.0443 1.075751 57 72.15614 0 0.1 0 0 0 1 
i 2.349599 233.0443 1.075751 56 72.25677 0 0.1 0 0 0 1 
i 2.533635 233.0443 0.5378755 61 72.55866 0 0.1 0 0 0 1 
i 2.594981 233.0443 1.075751 60 72.65929 0 0.1 0 0 0 1 
i 2.717672 233.0443 2.131751 62 72.86055 0 0.1 0 0 0 1 
i 2.901708 233.0443 0.5378755 64 73.16243 0 0.1 0 0 0 1 
i 9.270478 233.0443 0.5378755 76 70.14356 0 0.1 0 0 0 1 
i 9.331823 233.0443 1.075751 75 70.24419 0 0.1 0 0 0 1 
i 9.454514 233.0443 0.5378755 77 70.44545 0 0.1 0 0 0 1 
i 9.63855 233.0443 0.5378755 78 70.74734 0 0.1 0 0 0 1 
i 9.699895 233.0443 1.075751 73 70.84797 0 0.1 0 0 0 1 
i 9.883932 233.0443 0.5378755 74 71.14985 0 0.1 0 0 0 1 
i 10.00662 233.0443 1.075751 72 71.35111 0 0.1 0 0 0 1 
i 10.06797 233.0443 1.075751 70 71.45174 0 0.1 0 0 0 1 
i 10.19066 233.0443 1.075751 81 71.653 0 0.1 0 0 0 1 
i 10.3747 233.0443 1.075751 82 71.95488 0 0.1 0 0 0 1 
i 10.49739 233.0443 1.075751 80 72.15614 0 0.1 0 0 0 1 
i 10.55873 233.0443 1.075751 79 72.25677 0 0.1 0 0 0 1 
i 10.74277 233.0443 1.075751 84 72.55866 0 0.1 0 0 0 1 
i 10.80411 233.0443 1.075751 83 72.65929 0 0.1 0 0 0 1 
i 10.9268 233.0443 1.593875 85 72.86055 0 0.1 0 0 0 1 
i 11.11084 233.0443 0.5378755 87 73.16243 0 0.1 0 0 0 1 
i 2.784594 233.3026 0.5378755 67 74.29686 0 0.1 0 0 0 1 
i 3.888811 233.3026 0.5378755 70 76.10818 0 0.1 0 0 0 1 
i 4.256884 233.3026 0.5378755 76 76.71195 0 0.1 0 0 0 1 
i 10.99373 233.3026 0.5378755 90 74.29686 0 0.1 0 0 0 1 
i 11.60718 233.3026 0.5378755 85 75.30314 0 0.1 0 0 0 1 
i 12.09794 233.3026 0.5378755 93 76.10818 0 0.1 0 0 0 1 
i 12.46602 233.3026 0.5378755 99 76.71195 0 0.1 0 0 0 1 
i 4.630533 233.5304 0.5378755 74 74.40621 0 0.1 0 0 0 1 
i 4.81457 233.5304 0.5378755 68 74.70809 0 0.1 0 0 0 1 
i 5.059951 233.5304 0.5378755 77 75.11061 0 0.1 0 0 0 1 
i 5.366678 233.5304 0.5378755 84 75.61375 0 0.1 0 0 0 1 
i 12.83967 233.5304 0.5378755 97 74.40621 0 0.1 0 0 0 1 
i 13.0237 233.5304 0.5378755 91 74.70809 0 0.1 0 0 0 1 
i 13.26908 233.5304 0.5378755 100 75.11061 0 0.1 0 0 0 1 
i 13.57581 233.5304 0.5378755 107 75.61375 0 0.1 0 0 0 1 
i 1.184036 233.5822 0.5378755 51 70.34482 0 0.1 0 0 0 1 
i 1.613454 233.5822 0.5378755 50 71.04922 0 0.1 0 0 0 1 
i 1.736145 233.5822 0.5378755 48 71.25048 0 0.1 0 0 0 1 
i 2.47229 233.5822 0.5378755 61 72.45803 0 0.1 0 0 0 1 
i 2.840362 233.5822 0.5378755 63 73.0618 0 0.1 0 0 0 1 
i 9.393168 233.5822 0.5378755 74 70.34482 0 0.1 0 0 0 1 
i 9.515859 233.5822 0.5378755 76 70.54608 0 0.1 0 0 0 1 
i 9.577205 233.5822 0.5378755 77 70.64671 0 0.1 0 0 0 1 
i 9.945277 233.5822 0.5378755 71 71.25048 0 0.1 0 0 0 1 
i 11.04949 233.5822 0.5378755 86 73.0618 0 0.1 0 0 0 1 
i 2.845939 233.7341 1.075751 49 70.15296 0 0.1 0 0 0 1 
i 3.766121 233.7341 0.5378755 40 71.66239 0 0.1 0 0 0 1 
i 11.05507 233.7341 1.075751 72 70.15296 0 0.1 0 0 0 1 
i 11.97525 233.7341 0.5378755 63 71.66239 0 0.1 0 0 0 1 
i 4.569188 234.0683 0.5378755 73 74.30558 0 0.1 0 0 0 1 
i 4.875915 234.0683 0.5378755 67 74.80872 0 0.1 0 0 0 1 
i 5.121297 234.0683 0.5378755 76 75.21124 0 0.1 0 0 0 1 
i 5.305333 234.0683 0.5378755 83 75.51312 0 0.1 0 0 0 1 
i 12.77832 234.0683 0.5378755 96 74.30558 0 0.1 0 0 0 1 
i 13.08505 234.0683 0.5378755 90 74.80872 0 0.1 0 0 0 1 
i 13.33043 234.0683 0.5698905 99 75.21124 0 0.1 0 0 0 1 
i 13.51446 234.0683 0.5378755 106 75.51312 0 0.1 0 0 0 1 
i 2.845939 234.1003 0.5378755 67 74.39681 0 0.1 0 0 0 1 
i 2.907285 234.1003 1.075751 69 74.49744 0 0.1 0 0 0 1 
i 3.459394 234.1003 0.5378755 61 75.4031 0 0.1 0 0 0 1 
i 3.766121 234.1003 0.5378755 71 75.90625 0 0.1 0 0 0 1 
i 3.950157 234.1003 1.075751 70 76.20813 0 0.1 0 0 0 1 
i 4.318229 234.1003 0.5378755 76 76.81191 0 0.1 0 0 0 1 
i 4.379575 234.1003 1.075751 77 76.91254 0 0.1 0 0 0 1 
i 11.05507 234.1003 0.5378755 90 74.39681 0 0.1 0 0 0 1 
i 11.11642 234.1003 1.075751 92 74.49744 0 0.1 0 0 0 1 
i 11.66853 234.1003 0.5378755 84 75.4031 0 0.1 0 0 0 1 
i 11.97525 234.1003 0.5378755 94 75.90625 0 0.1 0 0 0 1 
i 12.15929 234.1003 1.075751 93 76.20813 0 0.1 0 0 0 1 
i 12.58871 234.1003 0.5378755 100 76.91254 0 0.1 0 0 0 1 
i 3.827466 234.272 0.5378755 39 71.76302 0 0.1 0 0 0 1 
i 12.0366 234.272 0.5378755 62 71.76302 0 0.1 0 0 0 1 
i 2.784594 234.6382 0.5378755 68 74.29618 0 0.1 0 0 0 1 
i 3.336703 234.6382 0.5378755 63 75.20184 0 0.1 0 0 0 1 
i 3.827466 234.6382 0.5378755 72 76.00688 0 0.1 0 0 0 1 
i 4.44092 234.6382 0.5378755 78 77.01317 0 0.1 0 0 0 1 
i 10.99373 234.6382 0.5378755 91 74.29618 0 0.1 0 0 0 1 
i 11.54583 234.6382 0.5378755 86 75.20184 0 0.1 0 0 0 1 
i 11.60718 234.6382 0.5378755 85 75.30247 0 0.1 0 0 0 1 
i 12.0366 234.6382 0.5378755 95 76.00688 0 0.1 0 0 0 1 
i 12.46602 234.6382 0.5378755 100 76.71128 0 0.1 0 0 0 1 
i 12.65005 234.6382 0.5378755 101 77.01317 0 0.1 0 0 0 1 
i 4.691879 234.967 0.5378755 54 74.50616 0 0.1 0 0 0 1 
i 4.81457 234.967 0.5378755 56 74.70742 0 0.1 0 0 0 1 
i 5.059951 234.967 0.5378755 51 75.10994 0 0.1 0 0 0 1 
i 5.428024 234.967 0.5378755 49 75.71371 0 0.1 0 0 0 1 
i 12.90101 234.967 0.5378755 77 74.50616 0 0.1 0 0 0 1 
i 13.0237 234.967 0.5378755 79 74.70742 0 0.1 0 0 0 1 
i 13.26908 234.967 0.5378755 74 75.10994 0 0.1 0 0 0 1 
i 13.63716 234.967 0.5378755 72 75.71371 0 0.1 0 0 0 1 
i 2.907285 235.3111 0.5378755 41 70.25291 0 0.1 0 0 0 1 
i 3.766121 235.3111 0.5378755 62 71.66172 0 0.1 0 0 0 1 
i 11.11642 235.3111 0.5378755 64 70.25291 0 0.1 0 0 0 1 
i 11.97525 235.3111 0.5378755 85 71.66172 0 0.1 0 0 0 1 
i 4.569188 235.5049 0.5378755 55 74.30491 0 0.1 0 0 0 1 
i 4.93726 235.5049 0.5378755 58 74.90868 0 0.1 0 0 0 1 
i 5.182642 235.5049 0.5378755 53 75.31119 0 0.1 0 0 0 1 
i 5.305333 235.5049 0.5378755 50 75.51245 0 0.1 0 0 0 1 
i 12.77832 235.5049 0.5378755 78 74.30491 0 0.1 0 0 0 1 
i 13.14639 235.5049 0.5378755 81 74.90868 0 0.1 0 0 0 1 
i 13.39177 235.5049 0.5378755 76 75.31119 0 0.1 0 0 0 1 
i 13.51446 235.5049 0.5378755 73 75.51245 0 0.1 0 0 0 1 
i 3.029976 235.6379 0.5378755 69 74.69803 0 0.1 0 0 0 1 
i 3.275357 235.6379 0.5378755 64 75.10055 0 0.1 0 0 0 1 
i 3.766121 235.6379 0.5378755 73 75.90558 0 0.1 0 0 0 1 
i 4.502266 235.6379 0.5378755 77 77.11312 0 0.1 0 0 0 1 
i 11.23911 235.6379 0.5378755 92 74.69803 0 0.1 0 0 0 1 
i 11.48449 235.6379 0.5378755 87 75.10055 0 0.1 0 0 0 1 
i 11.97525 235.6379 0.5378755 96 75.90558 0 0.1 0 0 0 1 
i 12.7114 235.6379 0.5378755 100 77.11312 0 0.1 0 0 0 1 
i 2.784594 235.8489 0.5378755 44 70.05166 0 0.1 0 0 0 1 
i 3.888811 235.8489 0.5378755 65 71.86298 0 0.1 0 0 0 1 
i 10.99373 235.8489 0.5378755 67 70.05166 0 0.1 0 0 0 1 
i 12.09794 235.8489 0.5378755 88 71.86298 0 0.1 0 0 0 1 
i 2.784594 236.1757 0.5378755 66 74.29551 0 0.1 0 0 0 1 
i 3.520739 236.1757 0.5378755 62 75.50306 0 0.1 0 0 0 1 
i 4.011502 236.1757 0.5378755 70 76.30809 0 0.1 0 0 0 1 
i 4.256884 236.1757 0.5378755 75 76.71061 0 0.1 0 0 0 1 
i 10.99373 236.1757 0.5378755 89 74.29551 0 0.1 0 0 0 1 
i 11.72987 236.1757 0.5378755 85 75.50306 0 0.1 0 0 0 1 
i 12.22063 236.1757 0.5378755 93 76.30809 0 0.1 0 0 0 1 
i 12.46602 236.1757 0.5378755 98 76.71061 0 0.1 0 0 0 1 
i 4.630533 236.3026 1.075751 56 74.40486 0 0.1 0 0 0 1 
i 4.691879 236.3026 1.075751 55 74.50549 0 0.1 0 0 0 1 
i 4.81457 236.3026 1.075751 57 74.70675 0 0.1 0 0 0 1 
i 4.998606 236.3026 1.075751 58 75.00864 0 0.1 0 0 0 1 
i 5.059951 236.3026 1.075751 53 75.10927 0 0.1 0 0 0 1 
i 5.243987 236.3026 1.075751 54 75.41115 0 0.1 0 0 0 1 
i 5.366678 236.3026 1.075751 52 75.61241 0 0.1 0 0 0 1 
i 5.428024 236.3026 1.075751 51 75.71304 0 0.1 0 0 0 1 
i 12.83967 236.3026 1.075751 79 74.40486 0 0.1 0 0 0 1 
i 12.90101 236.3026 1.075751 78 74.50549 0 0.1 0 0 0 1 
i 13.0237 236.3026 1.075751 80 74.70675 0 0.1 0 0 0 1 
i 13.20774 236.3026 1.075751 81 75.00864 0 0.1 0 0 0 1 
i 13.26908 236.3026 1.075751 76 75.10927 0 0.1 0 0 0 1 
i 13.45312 236.3026 1.075751 77 75.41115 0 0.1 0 0 0 1 
i 13.57581 236.3026 1.075751 75 75.61241 0 0.1 0 0 0 1 
i 13.63716 236.3026 1.075751 74 75.71304 0 0.1 0 0 0 1 
i 2.845939 236.7772 0.5378755 51 70.15161 0 0.1 0 0 0 1 
i 2.907285 236.7772 0.5378755 53 70.25224 0 0.1 0 0 0 1 
i 3.766121 236.7772 0.5378755 32 71.66105 0 0.1 0 0 0 1 
i 3.950157 236.7772 0.5378755 30 71.96294 0 0.1 0 0 0 1 
i 11.05507 236.7772 0.5378755 74 70.15161 0 0.1 0 0 0 1 
i 11.11642 236.7772 0.5378755 76 70.25224 0 0.1 0 0 0 1 
i 11.97525 236.7772 0.5378755 55 71.66105 0 0.1 0 0 0 1 
i 12.15929 236.7772 0.5378755 53 71.96294 0 0.1 0 0 0 1 
i 2.845939 236.9735 1.075751 66 74.39547 0 0.1 0 0 0 1 
i 3.029976 236.9735 1.075751 69 74.69736 0 0.1 0 0 0 1 
i 3.275357 236.9735 0.5378755 64 75.09987 0 0.1 0 0 0 1 
i 3.582084 236.9735 0.5378755 61 75.60302 0 0.1 0 0 0 1 
i 3.766121 236.9735 1.075751 73 75.90491 0 0.1 0 0 0 1 
i 4.072848 236.9735 1.075751 70 76.40805 0 0.1 0 0 0 1 
i 4.318229 236.9735 0.5378755 74 76.81057 0 0.1 0 0 0 1 
i 4.502266 236.9735 0.5378755 77 77.11245 0 0.1 0 0 0 1 
i 11.05507 236.9735 1.075751 89 74.39547 0 0.1 0 0 0 1 
i 11.23911 236.9735 1.075751 92 74.69736 0 0.1 0 0 0 1 
i 11.48449 236.9735 0.5378755 87 75.09987 0 0.1 0 0 0 1 
i 11.79122 236.9735 0.5378755 84 75.60302 0 0.1 0 0 0 1 
i 11.97525 236.9735 1.075751 96 75.90491 0 0.1 0 0 0 1 
i 12.28198 236.9735 1.075751 93 76.40805 0 0.1 0 0 0 1 
i 12.52736 236.9735 0.5378755 97 76.81057 0 0.1 0 0 0 1 
i 12.7114 236.9735 0.5378755 100 77.11245 0 0.1 0 0 0 1 
i 2.784594 237.315 0.5378755 52 70.05099 0 0.1 0 0 0 1 
i 2.96863 237.315 0.5378755 54 70.35287 0 0.1 0 0 0 1 
i 3.827466 237.315 0.5378755 33 71.76168 0 0.1 0 0 0 1 
i 3.888811 237.315 0.5378755 31 71.86231 0 0.1 0 0 0 1 
i 10.99373 237.315 0.5378755 75 70.05099 0 0.1 0 0 0 1 
i 11.17776 237.315 0.5378755 77 70.35287 0 0.1 0 0 0 1 
i 12.0366 237.315 0.5378755 56 71.76168 0 0.1 0 0 0 1 
i 12.09794 237.315 0.5378755 54 71.86231 0 0.1 0 0 0 1 
i 3.336703 237.5113 0.5378755 65 75.2005 0 0.1 0 0 0 1 
i 3.520739 237.5113 0.5378755 62 75.50239 0 0.1 0 0 0 1 
i 4.256884 237.5113 0.5378755 75 76.70994 0 0.1 0 0 0 1 
i 4.563611 237.5113 0.5378755 78 77.21308 0 0.1 0 0 0 1 
i 11.54583 237.5113 0.5378755 88 75.2005 0 0.1 0 0 0 1 
i 11.72987 237.5113 0.5378755 85 75.50239 0 0.1 0 0 0 1 
i 12.46602 237.5113 0.5378755 98 76.70994 0 0.1 0 0 0 1 
i 12.77274 237.5113 1.906027 101 77.21308 0 0.1 0 0 0 1 
i 2.907285 238.3416 0.5378755 66 74.49543 0 0.1 0 0 0 1 
i 3.029976 238.3416 0.5378755 68 74.69669 0 0.1 0 0 0 1 
i 3.275357 238.3416 0.5378755 64 75.0992 0 0.1 0 0 0 1 
i 3.64343 238.3416 0.5378755 61 75.70298 0 0.1 0 0 0 1 
i 3.766121 238.3416 0.5378755 72 75.90423 0 0.1 0 0 0 1 
i 4.134193 238.3416 0.5378755 70 76.50801 0 0.1 0 0 0 1 
i 4.379575 238.3416 0.5378755 74 76.91052 0 0.1 0 0 0 1 
i 4.502266 238.3416 0.5378755 76 77.11178 0 0.1 0 0 0 1 
i 11.11642 238.3416 0.5378755 89 74.49543 0 0.1 0 0 0 1 
i 11.23911 238.3416 0.5378755 91 74.69669 0 0.1 0 0 0 1 
i 11.48449 238.3416 0.5378755 87 75.0992 0 0.1 0 0 0 1 
i 11.85256 238.3416 0.5378755 84 75.70298 0 0.1 0 0 0 1 
i 11.97525 238.3416 0.5378755 95 75.90423 0 0.1 0 0 0 1 
i 12.34333 238.3416 0.5378755 93 76.50801 0 0.1 0 0 0 1 
i 12.58871 238.3416 0.5378755 97 76.91052 0 0.1 0 0 0 1 
i 12.7114 238.3416 0.5378755 99 77.11178 0 0.1 0 0 0 1 
i 3.029976 238.465 0.5378755 44 70.45283 0 0.1 0 0 0 1 
i 3.766121 238.465 0.5378755 53 71.66038 0 0.1 0 0 0 1 
i 11.23911 238.465 0.5378755 67 70.45283 0 0.1 0 0 0 1 
i 11.97525 238.465 0.5378755 76 71.66038 0 0.1 0 0 0 1 
i 5.550715 238.8009 0.5378755 56 75.91363 0 0.1 0 0 0 1 
i 13.75985 238.8009 0.5378755 79 75.91363 0 0.1 0 0 0 1 
i 2.784594 238.8795 0.5378755 67 74.29417 0 0.1 0 0 0 1 
i 3.152666 238.8795 0.5378755 69 74.89795 0 0.1 0 0 0 1 
i 3.398048 238.8795 0.5378755 65 75.30046 0 0.1 0 0 0 1 
i 3.520739 238.8795 0.5378755 63 75.50172 0 0.1 0 0 0 1 
i 3.888811 238.8795 0.5378755 73 76.10549 0 0.1 0 0 0 1 
i 4.011502 238.8795 0.5378755 71 76.30675 0 0.1 0 0 0 1 
i 4.256884 238.8795 0.5378755 76 76.70927 0 0.1 0 0 0 1 
i 4.624956 238.8795 0.5378755 78 77.31304 0 0.1 0 0 0 1 
i 10.99373 238.8795 0.5378755 90 74.29417 0 0.1 0 0 0 1 
i 11.3618 238.8795 0.5378755 92 74.89795 0 0.1 0 0 0 1 
i 11.60718 238.8795 0.5378755 88 75.30046 0 0.1 0 0 0 1 
i 11.72987 238.8795 0.5378755 86 75.50172 0 0.1 0 0 0 1 
i 12.09794 238.8795 0.5378755 96 76.10549 0 0.1 0 0 0 1 
i 12.22063 238.8795 0.5378755 94 76.30675 0 0.1 0 0 0 1 
i 12.46602 238.8795 0.5378755 99 76.70927 0 0.1 0 0 0 1 
i 2.784594 239.0028 0.5378755 46 70.05031 0 0.1 0 0 0 1 
i 4.011502 239.0028 0.5378755 55 72.06289 0 0.1 0 0 0 1 
i 10.99373 239.0028 0.5378755 69 70.05031 0 0.1 0 0 0 1 
i 12.22063 239.0028 0.5378755 78 72.06289 0 0.1 0 0 0 1 
i 4.569188 239.3388 0.5378755 62 74.30356 0 0.1 0 0 0 1 
i 12.77832 239.3388 0.5378755 85 74.30356 0 0.1 0 0 0 1 
i 2.845939 239.6136 1.075751 67 74.39413 0 0.1 0 0 0 1 
i 2.907285 239.6136 0.5378755 66 74.49476 0 0.1 0 0 0 1 
i 3.029976 239.6136 1.075751 68 74.69602 0 0.1 0 0 0 1 
i 3.214012 239.6136 1.075751 69 74.9979 0 0.1 0 0 0 1 
i 3.275357 239.6136 1.075751 64 75.09853 0 0.1 0 0 0 1 
i 3.459394 239.6136 1.075751 65 75.40042 0 0.1 0 0 0 1 
i 3.582084 239.6136 0.5378755 63 75.60168 0 0.1 0 0 0 1 
i 3.64343 239.6136 1.075751 62 75.70231 0 0.1 0 0 0 1 
i 3.766121 239.6136 1.075751 72 75.90356 0 0.1 0 0 0 1 
i 3.950157 239.6136 1.075751 74 76.20545 0 0.1 0 0 0 1 
i 4.072848 239.6136 1.075751 71 76.40671 0 0.1 0 0 0 1 
i 4.134193 239.6136 1.075751 70 76.50734 0 0.1 0 0 0 1 
i 4.318229 239.6136 0.5378755 76 76.80922 0 0.1 0 0 0 1 
i 4.379575 239.6136 1.075751 75 76.90985 0 0.1 0 0 0 1 
i 4.502266 239.6136 1.075751 77 77.11111 0 0.1 0 0 0 1 
i 4.686302 239.6136 0.5378755 78 77.413 0 0.1 0 0 0 1 
i 11.05507 239.6136 1.075751 90 74.39413 0 0.1 0 0 0 1 
i 11.11642 239.6136 0.5378755 89 74.49476 0 0.1 0 0 0 1 
i 11.23911 239.6136 1.075751 91 74.69602 0 0.1 0 0 0 1 
i 11.42314 239.6136 1.075751 92 74.9979 0 0.1 0 0 0 1 
i 11.48449 239.6136 0.5378755 87 75.09853 0 0.1 0 0 0 1 
i 11.66853 239.6136 0.5378755 88 75.40042 0 0.1 0 0 0 1 
i 11.79122 239.6136 1.075751 86 75.60168 0 0.1 0 0 0 1 
i 11.85256 239.6136 1.075751 85 75.70231 0 0.1 0 0 0 1 
i 11.97525 239.6136 1.075751 95 75.90356 0 0.1 0 0 0 1 
i 12.15929 239.6136 0.5378755 97 76.20545 0 0.1 0 0 0 1 
i 12.28198 239.6136 1.075751 94 76.40671 0 0.1 0 0 0 1 
i 12.34333 239.6136 1.075751 93 76.50734 0 0.1 0 0 0 1 
i 12.52736 239.6136 1.075751 99 76.80922 0 0.1 0 0 0 1 
i 12.58871 239.6136 0.5378755 98 76.90985 0 0.1 0 0 0 1 
i 12.7114 239.6136 1.075751 100 77.11111 0 0.1 0 0 0 1 
i 12.89543 239.6136 0.5378755 101 77.413 0 0.1 0 0 0 1 
i 2.845939 239.9311 0.5378755 46 70.15027 0 0.1 0 0 0 1 
i 3.029976 239.9311 0.5378755 43 70.45216 0 0.1 0 0 0 1 
i 3.766121 239.9311 1.075751 55 71.65971 0 0.1 0 0 0 1 
i 4.072848 239.9311 0.5378755 59 72.16285 0 0.1 0 0 0 1 
i 11.05507 239.9311 0.5378755 69 70.15027 0 0.1 0 0 0 1 
i 11.23911 239.9311 0.5378755 66 70.45216 0 0.1 0 0 0 1 
i 11.97525 239.9311 1.075751 78 71.65971 0 0.1 0 0 0 1 
i 12.28198 239.9311 0.5378755 82 72.16285 0 0.1 0 0 0 1 
i 3.336703 240.1515 0.5378755 63 75.19916 0 0.1 0 0 0 1 
i 3.704775 240.1515 0.5378755 61 75.80294 0 0.1 0 0 0 1 
i 3.888811 240.1515 0.5378755 73 76.10482 0 0.1 0 0 0 1 
i 4.563611 240.1515 0.5378755 76 77.21174 0 0.1 0 0 0 1 
i 11.17776 240.1515 0.5378755 88 74.59539 0 0.1 0 0 0 1 
i 11.60718 240.1515 0.5378755 87 75.29979 0 0.1 0 0 0 1 
i 11.91391 240.1515 0.5378755 84 75.80294 0 0.1 0 0 0 1 
i 12.09794 240.1515 0.5378755 96 76.10482 0 0.1 0 0 0 1 
i 12.46602 240.1515 0.5378755 98 76.7086 0 0.1 0 0 0 1 
i 12.65005 240.1515 0.5378755 97 77.01048 0 0.1 0 0 0 1 
i 4.630533 240.2734 1.075751 63 74.40352 0 0.1 0 0 0 1 
i 5.550715 240.2734 1.075751 54 75.91296 0 0.1 0 0 0 1 
i 12.83967 240.2734 1.075751 86 74.40352 0 0.1 0 0 0 1 
i 13.75985 240.2734 1.075751 77 75.91296 0 0.1 0 0 0 1 
i 2.784594 240.4689 0.5378755 45 70.04964 0 0.1 0 0 0 1 
i 3.091321 240.4689 0.5378755 42 70.55279 0 0.1 0 0 0 1 
i 4.011502 240.4689 0.5378755 58 72.06222 0 0.1 0 0 0 1 
i 10.99373 240.4689 0.5378755 68 70.04964 0 0.1 0 0 0 1 
i 11.30045 240.4689 0.5378755 65 70.55279 0 0.1 0 0 0 1 
i 12.22063 240.4689 1.501857 81 72.06222 0 0.1 0 0 0 1 
i 2.907285 241.4329 0.5378755 50 70.25023 0 0.1 0 0 0 1 
i 3.029976 241.4329 0.5378755 55 70.45149 0 0.1 0 0 0 1 
i 3.766121 241.4329 0.5378755 29 71.65904 0 0.1 0 0 0 1 
i 4.134193 241.4329 0.5378755 24 72.26281 0 0.1 0 0 0 1 
i 11.11642 241.4329 0.5378755 73 70.25023 0 0.1 0 0 0 1 
i 11.23911 241.4329 0.5378755 78 70.45149 0 0.1 0 0 0 1 
i 11.97525 241.4329 0.5378755 52 71.65904 0 0.1 0 0 0 1 
i 12.34333 241.4329 0.5378755 47 72.26281 0 0.1 0 0 0 1 
i 4.691879 241.7818 0.5378755 55 74.50348 0 0.1 0 0 0 1 
i 5.550715 241.7818 0.5378755 76 75.91229 0 0.1 0 0 0 1 
i 12.90101 241.7818 0.5378755 78 74.50348 0 0.1 0 0 0 1 
i 13.75985 241.7818 0.5378755 99 75.91229 0 0.1 0 0 0 1 
i 2.784594 241.9708 0.5378755 53 70.04897 0 0.1 0 0 0 1 
i 3.152666 241.9708 0.5378755 58 70.65275 0 0.1 0 0 0 1 
i 3.888811 241.9708 0.5378755 32 71.86029 0 0.1 0 0 0 1 
i 4.011502 241.9708 0.5378755 27 72.06155 0 0.1 0 0 0 1 
i 10.99373 241.9708 0.5378755 76 70.04897 0 0.1 0 0 0 1 
i 11.3618 241.9708 0.5378755 81 70.65275 0 0.1 0 0 0 1 
i 12.09794 241.9708 0.5378755 55 71.86029 0 0.1 0 0 0 1 
i 12.22063 241.9708 0.5378755 50 72.06155 0 0.1 0 0 0 1 
i 4.569188 242.3196 0.5378755 58 74.30222 0 0.1 0 0 0 1 
i 5.673405 242.3196 0.5378755 79 76.11354 0 0.1 0 0 0 1 
i 12.77832 242.3196 0.5378755 81 74.30222 0 0.1 0 0 0 1 
i 13.88254 242.3196 0.5378755 102 76.11354 0 0.1 0 0 0 1 
i 2.845939 242.8292 1.075751 43 70.14893 0 0.1 0 0 0 1 
i 2.907285 242.8292 0.5378755 44 70.24956 0 0.1 0 0 0 1 
i 3.029976 242.8292 0.5378755 41 70.45082 0 0.1 0 0 0 1 
i 3.214012 242.8292 1.075751 40 70.7527 0 0.1 0 0 0 1 
i 3.766121 242.8292 0.5378755 59 71.65836 0 0.1 0 0 0 1 
i 3.950157 242.8292 0.5378755 57 71.96025 0 0.1 0 0 0 1 
i 4.072848 242.8292 1.075751 60 72.16151 0 0.1 0 0 0 1 
i 4.134193 242.8292 0.5378755 62 72.26214 0 0.1 0 0 0 1 
i 11.05507 242.8292 1.075751 66 70.14893 0 0.1 0 0 0 1 
i 11.11642 242.8292 0.5378755 67 70.24956 0 0.1 0 0 0 1 
i 11.23911 242.8292 0.5378755 64 70.45082 0 0.1 0 0 0 1 
i 11.42314 242.8292 1.075751 63 70.7527 0 0.1 0 0 0 1 
i 11.97525 242.8292 0.5378755 82 71.65836 0 0.1 0 0 0 1 
i 12.15929 242.8292 0.5378755 80 71.96025 0 0.1 0 0 0 1 
i 12.28198 242.8292 1.075751 83 72.16151 0 0.1 0 0 0 1 
i 12.34333 242.8292 0.5378755 85 72.26214 0 0.1 0 0 0 1 
i 4.630533 243.1841 0.5378755 65 74.40218 0 0.1 0 0 0 1 
i 4.691879 243.1841 0.5378755 67 74.50281 0 0.1 0 0 0 1 
i 5.550715 243.1841 0.5378755 46 75.91161 0 0.1 0 0 0 1 
i 5.734751 243.1841 0.5378755 44 76.2135 0 0.1 0 0 0 1 
i 12.83967 243.1841 0.5378755 88 74.40218 0 0.1 0 0 0 1 
i 12.90101 243.1841 0.5378755 90 74.50281 0 0.1 0 0 0 1 
i 13.75985 243.1841 0.5378755 69 75.91161 0 0.1 0 0 0 1 
i 13.94388 243.1841 0.5378755 67 76.2135 0 0.1 0 0 0 1 
i 2.96863 243.3671 0.5378755 45 70.35019 0 0.1 0 0 0 1 
i 3.091321 243.3671 0.5378755 42 70.55145 0 0.1 0 0 0 1 
i 3.888811 243.3671 0.5378755 58 71.85962 0 0.1 0 0 0 1 
i 4.011502 243.3671 0.5378755 61 72.06088 0 0.1 0 0 0 1 
i 4.195539 243.3671 0.5378755 63 72.36277 0 0.1 0 0 0 1 
i 11.17776 243.3671 0.5378755 68 70.35019 0 0.1 0 0 0 1 
i 11.30045 243.3671 0.5378755 65 70.55145 0 0.1 0 0 0 1 
i 12.09794 243.3671 0.5378755 81 71.85962 0 0.1 0 0 0 1 
i 12.22063 243.3671 0.5378755 84 72.06088 0 0.1 0 0 0 1 
i 12.40467 243.3671 0.5378755 86 72.36277 0 0.1 0 0 0 1 
i 4.569188 243.722 0.5378755 66 74.30155 0 0.1 0 0 0 1 
i 4.753224 243.722 0.5378755 68 74.60344 0 0.1 0 0 0 1 
i 5.61206 243.722 0.5378755 47 76.01224 0 0.1 0 0 0 1 
i 5.673405 243.722 0.5378755 45 76.11287 0 0.1 0 0 0 1 
i 12.77832 243.722 0.5378755 89 74.30155 0 0.1 0 0 0 1 
i 12.96236 243.722 0.5378755 91 74.60344 0 0.1 0 0 0 1 
i 13.82119 243.722 0.5378755 70 76.01224 0 0.1 0 0 0 1 
i 13.88254 243.722 1.588652 68 76.11287 0 0.1 0 0 0 1 
i 3.275357 244.7728 0.5378755 51 70.85266 0 0.1 0 0 0 1 
i 3.766121 244.7728 0.5378755 42 71.65769 0 0.1 0 0 0 1 
i 11.48449 244.7728 0.5378755 74 70.85266 0 0.1 0 0 0 1 
i 11.97525 244.7728 0.5378755 65 71.65769 0 0.1 0 0 0 1 
i 4.81457 244.7985 0.5378755 58 74.7034 0 0.1 0 0 0 1 
i 5.550715 244.7985 0.5378755 67 75.91094 0 0.1 0 0 0 1 
i 13.0237 244.7985 0.5378755 81 74.7034 0 0.1 0 0 0 1 
i 13.75985 244.7985 0.5378755 90 75.91094 0 0.1 0 0 0 1 
i 2.784594 245.3106 0.5378755 46 70.04763 0 0.1 0 0 0 1 
i 4.256884 245.3106 0.5378755 38 72.46273 0 0.1 0 0 0 1 
i 10.99373 245.3106 0.5378755 69 70.04763 0 0.1 0 0 0 1 
i 12.46602 245.3106 0.5378755 61 72.46273 0 0.1 0 0 0 1 
i 4.569188 245.3364 0.5378755 60 74.30088 0 0.1 0 0 0 1 
i 5.796096 245.3364 0.5378755 69 76.31346 0 0.1 0 0 0 1 
i 12.77832 245.3364 0.5378755 83 74.30088 0 0.1 0 0 0 1 
i 14.00523 245.3364 1.940231 92 76.31346 0 0.1 0 0 0 1 
i 4.630533 246.2009 1.075751 60 74.40084 0 0.1 0 0 0 1 
i 4.81457 246.2009 0.5378755 57 74.70273 0 0.1 0 0 0 1 
i 5.550715 246.2009 0.5378755 70 75.91027 0 0.1 0 0 0 1 
i 5.857442 246.2009 0.5378755 73 76.41342 0 0.1 0 0 0 1 
i 12.83967 246.2009 1.075751 83 74.40084 0 0.1 0 0 0 1 
i 13.0237 246.2009 0.5378755 80 74.70273 0 0.1 0 0 0 1 
i 13.75985 246.2009 0.5378755 93 75.91027 0 0.1 0 0 0 1 
i 14.06657 246.2009 0.5378755 96 76.41342 0 0.1 0 0 0 1 
i 2.845939 246.2389 1.075751 46 70.14759 0 0.1 0 0 0 1 
i 3.275357 246.2389 1.075751 51 70.85199 0 0.1 0 0 0 1 
i 3.766121 246.2389 1.075751 43 71.65702 0 0.1 0 0 0 1 
i 4.318229 246.2389 1.075751 38 72.56268 0 0.1 0 0 0 1 
i 11.05507 246.2389 1.075751 69 70.14759 0 0.1 0 0 0 1 
i 11.48449 246.2389 0.5378755 74 70.85199 0 0.1 0 0 0 1 
i 11.97525 246.2389 1.075751 66 71.65702 0 0.1 0 0 0 1 
i 12.52736 246.2389 0.5378755 61 72.56268 0 0.1 0 0 0 1 
i 4.875915 246.7388 0.5378755 56 74.80335 0 0.1 0 0 0 1 
i 5.61206 246.7388 0.5378755 69 76.0109 0 0.1 0 0 0 1 
i 5.796096 246.7388 0.5378755 72 76.31279 0 0.1 0 0 0 1 
i 13.08505 246.7388 0.5378755 79 74.80335 0 0.1 0 0 0 1 
i 14.00523 246.7388 0.5378755 95 76.31279 0 0.1 0 0 0 1 
i 11.54583 246.7767 0.5378755 74 70.95262 0 0.1 0 0 0 1 
i 12.46602 246.7767 1.398582 61 72.46205 0 0.1 0 0 0 1 
i 4.691879 247.6375 0.5378755 64 74.5008 0 0.1 0 0 0 1 
i 4.81457 247.6375 0.5378755 69 74.70205 0 0.1 0 0 0 1 
i 5.550715 247.6375 0.5378755 43 75.9096 0 0.1 0 0 0 1 
i 5.918787 247.6375 0.5378755 39 76.51338 0 0.1 0 0 0 1 
i 12.90101 247.6375 0.5378755 87 74.5008 0 0.1 0 0 0 1 
i 13.0237 247.6375 0.6411504 92 74.70205 0 0.1 0 0 0 1 
i 13.75985 247.6375 0.5378755 66 75.9096 0 0.1 0 0 0 1 
i 14.12792 247.6375 0.5378755 62 76.51338 0 0.1 0 0 0 1 
i 2.907285 247.7407 0.5378755 51 70.24755 0 0.1 0 0 0 1 
i 3.275357 247.7407 0.5378755 40 70.85132 0 0.1 0 0 0 1 
i 3.766121 247.7407 0.5378755 58 71.65635 0 0.1 0 0 0 1 
i 4.379575 247.7407 0.5378755 69 72.66264 0 0.1 0 0 0 1 
i 11.11642 247.7407 0.5378755 74 70.24755 0 0.1 0 0 0 1 
i 11.48449 247.7407 0.5378755 63 70.85132 0 0.1 0 0 0 1 
i 11.97525 247.7407 0.5378755 81 71.65635 0 0.1 0 0 0 1 
i 4.569188 248.1753 0.5378755 67 74.29954 0 0.1 0 0 0 1 
i 4.93726 248.1753 0.5378755 72 74.90331 0 0.1 0 0 0 1 
i 5.673405 248.1753 0.5378755 46 76.11086 0 0.1 0 0 0 1 
i 5.796096 248.1753 0.5378755 41 76.31212 0 0.1 0 0 0 1 
i 12.77832 248.1753 0.5378755 90 74.29954 0 0.1 0 0 0 1 
i 13.14639 248.1753 0.5378755 95 74.90331 0 0.1 0 0 0 1 
i 13.88254 248.1753 0.5378755 69 76.11086 0 0.1 0 0 0 1 
i 14.00523 248.1753 0.5378755 64 76.31212 0 0.1 0 0 0 1 
i 2.784594 248.2786 0.5378755 48 70.04629 0 0.1 0 0 0 1 
i 3.398048 248.2786 0.5378755 37 71.05258 0 0.1 0 0 0 1 
i 3.888811 248.2786 0.5378755 55 71.85761 0 0.1 0 0 0 1 
i 4.256884 248.2786 0.5378755 67 72.46138 0 0.1 0 0 0 1 
i 10.99373 248.2786 0.5378755 71 70.04629 0 0.1 0 0 0 1 
i 11.60718 248.2786 0.5378755 60 71.05258 0 0.1 0 0 0 1 
i 12.09794 248.2786 0.5378755 78 71.85761 0 0.1 0 0 0 1 
i 12.46602 248.2786 1.232302 90 72.46138 0 0.1 0 0 0 1 
i 4.630533 248.973 0.5378755 57 74.3995 0 0.1 0 0 0 1 
i 4.691879 248.973 1.075751 58 74.50013 0 0.1 0 0 0 1 
i 4.81457 248.973 1.075751 55 74.70138 0 0.1 0 0 0 1 
i 4.998606 248.973 0.5378755 54 75.00327 0 0.1 0 0 0 1 
i 5.550715 248.973 0.5378755 73 75.90893 0 0.1 0 0 0 1 
i 5.734751 248.973 1.075751 72 76.21082 0 0.1 0 0 0 1 
i 5.857442 248.973 1.075751 75 76.41208 0 0.1 0 0 0 1 
i 5.918787 248.973 0.5378755 76 76.5127 0 0.1 0 0 0 1 
i 12.83967 248.973 0.5378755 80 74.3995 0 0.1 0 0 0 1 
i 12.90101 248.973 1.075751 81 74.50013 0 0.1 0 0 0 1 
i 13.0237 248.973 1.075751 78 74.70138 0 0.1 0 0 0 1 
i 13.20774 248.973 0.5378755 77 75.00327 0 0.1 0 0 0 1 
i 13.75985 248.973 0.5378755 96 75.90893 0 0.1 0 0 0 1 
i 13.94388 248.973 1.075751 95 76.21082 0 0.1 0 0 0 1 
i 14.06657 248.973 1.075751 98 76.41208 0 0.1 0 0 0 1 
i 14.12792 248.973 0.5378755 99 76.5127 0 0.1 0 0 0 1 
i 2.845939 249.137 0.5378755 46 70.14625 0 0.1 0 0 0 1 
i 2.907285 249.137 0.5378755 44 70.24688 0 0.1 0 0 0 1 
i 3.275357 249.137 0.5378755 54 70.85065 0 0.1 0 0 0 1 
i 3.459394 249.137 1.075751 55 71.15254 0 0.1 0 0 0 1 
i 3.766121 249.137 0.5378755 40 71.65568 0 0.1 0 0 0 1 
i 3.950157 249.137 0.5378755 42 71.95757 0 0.1 0 0 0 1 
i 4.318229 249.137 0.5378755 32 72.56134 0 0.1 0 0 0 1 
i 4.379575 249.137 1.075751 31 72.66197 0 0.1 0 0 0 1 
i 11.05507 249.137 0.5378755 69 70.14625 0 0.1 0 0 0 1 
i 11.11642 249.137 0.5378755 67 70.24688 0 0.1 0 0 0 1 
i 11.48449 249.137 0.5378755 77 70.85065 0 0.1 0 0 0 1 
i 11.66853 249.137 1.075751 78 71.15254 0 0.1 0 0 0 1 
i 11.97525 249.137 0.5378755 63 71.65568 0 0.1 0 0 0 1 
i 12.15929 249.137 0.5378755 65 71.95757 0 0.1 0 0 0 1 
i 12.52736 249.137 0.5378755 55 72.56134 0 0.1 0 0 0 1 
i 12.58871 249.137 0.5378755 54 72.66197 0 0.1 0 0 0 1 
i 4.753224 249.5109 0.5378755 59 74.60075 0 0.1 0 0 0 1 
i 4.875915 249.5109 0.5378755 56 74.80201 0 0.1 0 0 0 1 
i 5.61206 249.5109 0.5378755 74 76.00956 0 0.1 0 0 0 1 
i 5.980132 249.5109 0.5378755 77 76.61333 0 0.1 0 0 0 1 
i 12.96236 249.5109 0.5378755 82 74.60075 0 0.1 0 0 0 1 
i 13.08505 249.5109 0.5378755 79 74.80201 0 0.1 0 0 0 1 
i 13.82119 249.5109 0.5378755 97 76.00956 0 0.1 0 0 0 1 
i 14.18926 249.5109 0.5378755 100 76.61333 0 0.1 0 0 0 1 
i 2.784594 249.6749 0.5378755 45 70.04562 0 0.1 0 0 0 1 
i 2.96863 249.6749 0.5378755 43 70.34751 0 0.1 0 0 0 1 
i 3.336703 249.6749 0.5378755 53 70.95128 0 0.1 0 0 0 1 
i 3.827466 249.6749 0.5378755 39 71.75631 0 0.1 0 0 0 1 
i 3.888811 249.6749 0.5378755 41 71.85694 0 0.1 0 0 0 1 
i 4.44092 249.6749 0.5378755 30 72.7626 0 0.1 0 0 0 1 
i 10.99373 249.6749 0.5378755 68 70.04562 0 0.1 0 0 0 1 
i 11.17776 249.6749 0.5378755 66 70.34751 0 0.1 0 0 0 1 
i 11.54583 249.6749 0.5378755 76 70.95128 0 0.1 0 0 0 1 
i 12.0366 249.6749 0.5378755 62 71.75631 0 0.1 0 0 0 1 
i 12.09794 249.6749 0.5378755 64 71.85694 0 0.1 0 0 0 1 
i 12.46602 249.6749 0.5378755 54 72.46071 0 0.1 0 0 0 1 
i 12.65005 249.6749 2.145305 53 72.7626 0 0.1 0 0 0 1 
i 3.029976 250.7444 1.075751 47 70.44746 0 0.1 0 0 0 1 
i 3.766121 250.7444 1.075751 48 71.65501 0 0.1 0 0 0 1 
i 4.502266 250.7444 0.5378755 49 72.86256 0 0.1 0 0 0 1 
i 11.23911 250.7444 1.075751 70 70.44746 0 0.1 0 0 0 1 
i 11.97525 250.7444 1.075751 71 71.65501 0 0.1 0 0 0 1 
i 12.7114 250.7444 0.5378755 72 72.86256 0 0.1 0 0 0 1 
i 5.059951 250.8321 0.5378755 65 75.10323 0 0.1 0 0 0 1 
i 5.550715 250.8321 0.5378755 56 75.90826 0 0.1 0 0 0 1 
i 13.26908 250.8321 0.5378755 88 75.10323 0 0.1 0 0 0 1 
i 13.75985 250.8321 0.5378755 79 75.90826 0 0.1 0 0 0 1 
i 2.784594 251.0725 0.7171673 48 70.0208 0 0.1 0 0 0 1 
i 6.88916 251.0725 0.7171673 59 70.0208 0 0.1 0 0 0 1 
i 10.99373 251.0725 0.7171673 71 70.0208 0 0.1 0 0 0 1 
i 15.09829 251.0725 0.7171673 82 70.0208 0 0.1 0 0 0 1 
i 3.520739 251.2823 0.5378755 46 71.25249 0 0.1 0 0 0 1 
i 4.256884 251.2823 0.5378755 49 72.46004 0 0.1 0 0 0 1 
i 11.72987 251.2823 0.5378755 69 71.25249 0 0.1 0 0 0 1 
i 12.46602 251.2823 0.5378755 72 72.46004 0 0.1 0 0 0 1 
i 4.569188 251.37 0.5378755 61 74.2982 0 0.1 0 0 0 1 
i 6.041478 251.37 0.5378755 52 76.71329 0 0.1 0 0 0 1 
i 12.77832 251.37 0.5378755 84 74.2982 0 0.1 0 0 0 1 
i 14.25061 251.37 1.940231 75 76.71329 0 0.1 0 0 0 1 
i 2.845939 252.0487 0.6299029 50 70.12075 0 0.1 0 0 0 1 
i 6.950505 252.0487 0.7171673 61 70.12075 0 0.1 0 0 0 1 
i 11.05507 252.0487 0.6299029 73 70.12075 0 0.1 0 0 0 1 
i 15.15964 252.0487 0.7171673 84 70.12075 0 0.1 0 0 0 1 
i 2.845939 252.1407 0.5378755 45 70.14491 0 0.1 0 0 0 1 
i 3.275357 252.1407 0.5378755 43 70.84931 0 0.1 0 0 0 1 
i 3.582084 252.1407 0.5378755 38 71.35245 0 0.1 0 0 0 1 
i 3.766121 252.1407 0.5378755 58 71.65434 0 0.1 0 0 0 1 
i 4.072848 252.1407 0.5378755 53 72.15748 0 0.1 0 0 0 1 
i 4.318229 252.1407 0.5378755 61 72.56 0 0.1 0 0 0 1 
i 4.502266 252.1407 0.5378755 66 72.86189 0 0.1 0 0 0 1 
i 11.05507 252.1407 0.5378755 68 70.14491 0 0.1 0 0 0 1 
i 11.48449 252.1407 0.5378755 66 70.84931 0 0.1 0 0 0 1 
i 11.79122 252.1407 0.5378755 61 71.35245 0 0.1 0 0 0 1 
i 11.97525 252.1407 0.5378755 81 71.65434 0 0.1 0 0 0 1 
i 12.28198 252.1407 0.5378755 76 72.15748 0 0.1 0 0 0 1 
i 12.52736 252.1407 0.5378755 84 72.56 0 0.1 0 0 0 1 
i 12.7114 252.1407 0.5378755 89 72.86189 0 0.1 0 0 0 1 
i 4.630533 252.2344 1.075751 60 74.39816 0 0.1 0 0 0 1 
i 5.059951 252.2344 1.075751 65 75.10256 0 0.1 0 0 0 1 
i 5.550715 252.2344 0.5378755 57 75.90759 0 0.1 0 0 0 1 
i 6.102823 252.2344 1.075751 52 76.81325 0 0.1 0 0 0 1 
i 12.83967 252.2344 1.075751 83 74.39816 0 0.1 0 0 0 1 
i 13.26908 252.2344 1.075751 88 75.10256 0 0.1 0 0 0 1 
i 13.75985 252.2344 0.5378755 80 75.90759 0 0.1 0 0 0 1 
i 2.784594 252.6786 0.5378755 46 70.04428 0 0.1 0 0 0 1 
i 3.091321 252.6786 0.5378755 51 70.54742 0 0.1 0 0 0 1 
i 3.336703 252.6786 0.5378755 44 70.94994 0 0.1 0 0 0 1 
i 3.520739 252.6786 0.5378755 39 71.25182 0 0.1 0 0 0 1 
i 3.827466 252.6786 0.5378755 59 71.75497 0 0.1 0 0 0 1 
i 4.011502 252.6786 0.5378755 54 72.05686 0 0.1 0 0 0 1 
i 4.256884 252.6786 0.5378755 62 72.45937 0 0.1 0 0 0 1 
i 4.563611 252.6786 0.5378755 67 72.96252 0 0.1 0 0 0 1 
i 10.99373 252.6786 0.5378755 69 70.04428 0 0.1 0 0 0 1 
i 11.30045 252.6786 0.5378755 74 70.54742 0 0.1 0 0 0 1 
i 11.54583 252.6786 0.5378755 67 70.94994 0 0.1 0 0 0 1 
i 11.72987 252.6786 0.5378755 62 71.25182 0 0.1 0 0 0 1 
i 12.0366 252.6786 0.5378755 82 71.75497 0 0.1 0 0 0 1 
i 12.22063 252.6786 0.5378755 77 72.05686 0 0.1 0 0 0 1 
i 12.46602 252.6786 0.5378755 85 72.45937 0 0.1 0 0 0 1 
i 12.77274 252.6786 0.5378755 90 72.96252 0 0.1 0 0 0 1 
i 2.784594 252.7659 0.7171673 49 70.02013 0 0.1 0 0 0 1 
i 6.88916 252.7659 0.7171673 60 70.02013 0 0.1 0 0 0 1 
i 10.99373 252.7659 0.7171673 72 70.02013 0 0.1 0 0 0 1 
i 15.09829 252.7659 0.7171673 83 70.02013 0 0.1 0 0 0 1 
i 5.61206 252.7723 0.5378755 58 76.00822 0 0.1 0 0 0 1 
i 13.82119 252.7723 1.336625 81 76.00822 0 0.1 0 0 0 1 
i 2.907285 253.5711 0.5378755 49 70.24486 0 0.1 0 0 0 1 
i 3.029976 253.5711 0.5378755 45 70.44612 0 0.1 0 0 0 1 
i 3.275357 253.5711 0.5378755 54 70.84864 0 0.1 0 0 0 1 
i 3.64343 253.5711 0.5378755 58 71.45241 0 0.1 0 0 0 1 
i 3.766121 253.5711 0.5378755 36 71.65367 0 0.1 0 0 0 1 
i 4.134193 253.5711 0.5378755 40 72.25744 0 0.1 0 0 0 1 
i 4.379575 253.5711 0.5378755 32 72.65996 0 0.1 0 0 0 1 
i 4.502266 253.5711 0.5378755 27 72.86122 0 0.1 0 0 0 1 
i 11.11642 253.5711 0.5378755 72 70.24486 0 0.1 0 0 0 1 
i 11.23911 253.5711 0.5378755 68 70.44612 0 0.1 0 0 0 1 
i 11.48449 253.5711 0.5378755 77 70.84864 0 0.1 0 0 0 1 
i 11.85256 253.5711 0.5378755 81 71.45241 0 0.1 0 0 0 1 
i 11.97525 253.5711 0.5378755 59 71.65367 0 0.1 0 0 0 1 
i 12.34333 253.5711 0.5378755 63 72.25744 0 0.1 0 0 0 1 
i 12.58871 253.5711 0.5378755 55 72.65996 0 0.1 0 0 0 1 
i 12.7114 253.5711 0.5378755 50 72.86122 0 0.1 0 0 0 1 
i 4.691879 253.671 0.5378755 65 74.49811 0 0.1 0 0 0 1 
i 5.059951 253.671 0.5378755 54 75.10189 0 0.1 0 0 0 1 
i 5.550715 253.671 0.5378755 72 75.90692 0 0.1 0 0 0 1 
i 6.164169 253.671 0.5378755 84 76.91321 0 0.1 0 0 0 1 
i 12.90101 253.671 0.5378755 88 74.49811 0 0.1 0 0 0 1 
i 13.26908 253.671 0.5378755 77 75.10189 0 0.1 0 0 0 1 
i 13.75985 253.671 0.5378755 95 75.90692 0 0.1 0 0 0 1 
i 14.3733 253.671 0.5378755 107 76.91321 0 0.1 0 0 0 1 
i 2.907285 253.7833 0.8634735 51 70.22071 0 0.1 0 0 0 1 
i 7.011851 253.7833 0.7171673 62 70.22071 0 0.1 0 0 0 1 
i 11.11642 253.7833 0.7171673 74 70.22071 0 0.1 0 0 0 1 
i 15.22098 253.7833 0.7171673 85 70.22071 0 0.1 0 0 0 1 
i 2.784594 254.1089 0.5378755 47 70.04361 0 0.1 0 0 0 1 
i 3.152666 254.1089 0.5378755 42 70.64738 0 0.1 0 0 0 1 
i 3.520739 254.1089 0.5378755 55 71.25115 0 0.1 0 0 0 1 
i 3.888811 254.1089 0.5378755 33 71.85493 0 0.1 0 0 0 1 
i 4.011502 254.1089 0.5378755 38 72.05618 0 0.1 0 0 0 1 
i 4.256884 254.1089 0.5378755 29 72.4587 0 0.1 0 0 0 1 
i 4.624956 254.1089 0.5378755 25 73.06247 0 0.1 0 0 0 1 
i 10.99373 254.1089 0.5378755 70 70.04361 0 0.1 0 0 0 1 
i 11.3618 254.1089 0.5378755 65 70.64738 0 0.1 0 0 0 1 
i 11.60718 254.1089 0.5378755 74 71.0499 0 0.1 0 0 0 1 
i 11.72987 254.1089 0.5378755 78 71.25115 0 0.1 0 0 0 1 
i 12.09794 254.1089 0.5378755 56 71.85493 0 0.1 0 0 0 1 
i 12.22063 254.1089 0.5378755 61 72.05618 0 0.1 0 0 0 1 
i 12.46602 254.1089 0.5378755 52 72.4587 0 0.1 0 0 0 1 
i 12.83409 254.1089 0.5378755 48 73.06247 0 0.1 0 0 0 1 
i 4.569188 254.2089 0.5378755 63 74.29686 0 0.1 0 0 0 1 
i 5.182642 254.2089 0.5378755 51 75.30314 0 0.1 0 0 0 1 
i 5.673405 254.2089 0.5378755 69 76.10818 0 0.1 0 0 0 1 
i 6.041478 254.2089 0.5378755 81 76.71195 0 0.1 0 0 0 1 
i 12.77832 254.2089 0.5378755 86 74.29686 0 0.1 0 0 0 1 
i 13.39177 254.2089 0.5378755 74 75.30314 0 0.1 0 0 0 1 
i 13.88254 254.2089 0.5378755 92 76.10818 0 0.1 0 0 0 1 
i 14.25061 254.2089 0.5378755 104 76.71195 0 0.1 0 0 0 1 
i 2.784594 254.5005 0.7171673 49 70.01945 0 0.1 0 0 0 1 
i 6.88916 254.5005 0.7171673 61 70.01945 0 0.1 0 0 0 1 
i 10.99373 254.5005 0.7171673 72 70.01945 0 0.1 0 0 0 1 
i 15.09829 254.5005 0.7171673 84 70.01945 0 0.1 0 0 0 1 
i 2.845939 254.9009 1.075751 47 70.14356 0 0.1 0 0 0 1 
i 3.214012 254.9009 0.5378755 48 70.74734 0 0.1 0 0 0 1 
i 3.582084 254.9009 1.075751 46 71.35111 0 0.1 0 0 0 1 
i 3.766121 254.9009 1.075751 48 71.653 0 0.1 0 0 0 1 
i 4.318229 254.9009 0.5378755 49 72.55866 0 0.1 0 0 0 1 
i 4.502266 254.9009 1.075751 49 72.86055 0 0.1 0 0 0 1 
i 11.05507 254.9009 1.075751 70 70.14356 0 0.1 0 0 0 1 
i 11.42314 254.9009 0.5378755 71 70.74734 0 0.1 0 0 0 1 
i 11.66853 254.9009 1.075751 70 71.14985 0 0.1 0 0 0 1 
i 11.79122 254.9009 1.075751 69 71.35111 0 0.1 0 0 0 1 
i 11.97525 254.9009 1.075751 71 71.653 0 0.1 0 0 0 1 
i 12.52736 254.9009 1.075751 72 72.55866 0 0.1 0 0 0 1 
i 12.58871 254.9009 1.075751 71 72.65929 0 0.1 0 0 0 1 
i 4.630533 255.0066 0.5378755 60 74.39681 0 0.1 0 0 0 1 
i 4.691879 255.0066 1.075751 58 74.49744 0 0.1 0 0 0 1 
i 5.059951 255.0066 0.5378755 68 75.10122 0 0.1 0 0 0 1 
i 5.243987 255.0066 0.5378755 70 75.4031 0 0.1 0 0 0 1 
i 5.550715 255.0066 1.075751 55 75.90625 0 0.1 0 0 0 1 
i 5.734751 255.0066 0.5378755 56 76.20813 0 0.1 0 0 0 1 
i 6.102823 255.0066 0.5378755 47 76.81191 0 0.1 0 0 0 1 
i 6.164169 255.0066 0.5378755 45 76.91254 0 0.1 0 0 0 1 
i 12.83967 255.0066 0.5378755 83 74.39681 0 0.1 0 0 0 1 
i 12.90101 255.0066 1.075751 81 74.49744 0 0.1 0 0 0 1 
i 13.26908 255.0066 0.5378755 91 75.10122 0 0.1 0 0 0 1 
i 13.45312 255.0066 0.5378755 93 75.4031 0 0.1 0 0 0 1 
i 13.75985 255.0066 1.075751 78 75.90625 0 0.1 0 0 0 1 
i 13.94388 255.0066 0.5378755 79 76.20813 0 0.1 0 0 0 1 
i 14.31196 255.0066 0.5378755 70 76.81191 0 0.1 0 0 0 1 
i 14.3733 255.0066 0.5378755 68 76.91254 0 0.1 0 0 0 1 
i 2.845939 255.3961 0.7171673 50 70.11941 0 0.1 0 0 0 1 
i 2.907285 255.3961 1.434335 51 70.22004 0 0.1 0 0 0 1 
i 6.950505 255.3961 1.434335 62 70.11941 0 0.1 0 0 0 1 
i 7.011851 255.3961 0.7171673 63 70.22004 0 0.1 0 0 0 1 
i 11.05507 255.3961 0.7171673 73 70.11941 0 0.1 0 0 0 1 
i 11.11642 255.3961 1.434335 74 70.22004 0 0.1 0 0 0 1 
i 15.15964 255.3961 1.434335 85 70.11941 0 0.1 0 0 0 1 
i 15.22098 255.3961 0.7171673 86 70.22004 0 0.1 0 0 0 1 
i 4.569188 255.5445 0.5378755 59 74.29618 0 0.1 0 0 0 1 
i 5.121297 255.5445 0.5378755 67 75.20184 0 0.1 0 0 0 1 
i 5.182642 255.5445 0.5378755 69 75.30247 0 0.1 0 0 0 1 
i 5.61206 255.5445 0.5378755 54 76.00688 0 0.1 0 0 0 1 
i 6.041478 255.5445 0.5378755 46 76.71128 0 0.1 0 0 0 1 
i 6.225514 255.5445 0.5378755 44 77.01317 0 0.1 0 0 0 1 
i 12.77832 255.5445 0.5378755 82 74.29618 0 0.1 0 0 0 1 
i 13.33043 255.5445 0.5378755 90 75.20184 0 0.1 0 0 0 1 
i 13.39177 255.5445 0.5378755 92 75.30247 0 0.1 0 0 0 1 
i 13.82119 255.5445 0.5378755 77 76.00688 0 0.1 0 0 0 1 
i 14.25061 255.5445 0.5378755 69 76.71128 0 0.1 0 0 0 1 
i 14.43465 255.5445 1.285935 67 77.01317 0 0.1 0 0 0 1 
i 2.96863 256.1132 0.7171673 52 70.32067 0 0.1 0 0 0 1 
i 7.073196 256.1132 0.7171673 64 70.32067 0 0.1 0 0 0 1 
i 11.17776 256.1132 0.7171673 75 70.32067 0 0.1 0 0 0 1 
i 15.28233 256.1132 0.7171673 87 70.32067 0 0.1 0 0 0 1 
i 4.81457 256.5441 0.5378755 62 74.69803 0 0.1 0 0 0 1 
i 5.059951 256.5441 1.075751 61 75.10055 0 0.1 0 0 0 1 
i 5.550715 256.5441 1.075751 62 75.90558 0 0.1 0 0 0 1 
i 6.28686 256.5441 1.075751 63 77.11312 0 0.1 0 0 0 1 
i 13.0237 256.5441 0.5378755 85 74.69803 0 0.1 0 0 0 1 
i 13.26908 256.5441 1.075751 84 75.10055 0 0.1 0 0 0 1 
i 13.75985 256.5441 1.075751 85 75.90558 0 0.1 0 0 0 1 
i 14.49599 256.5441 1.075751 86 77.11312 0 0.1 0 0 0 1 
i 13.51446 257.082 0.5378755 84 75.50306 0 0.1 0 0 0 1 
i 3.029976 257.2526 0.7171673 52 70.42063 0 0.1 0 0 0 1 
i 7.134542 257.2526 0.7171673 64 70.42063 0 0.1 0 0 0 1 
i 11.23911 257.2526 0.7171673 75 70.42063 0 0.1 0 0 0 1 
i 15.34367 257.2526 0.7171673 87 70.42063 0 0.1 0 0 0 1 
i 4.630533 257.8797 0.5378755 60 74.39547 0 0.1 0 0 0 1 
i 4.81457 257.8797 0.5378755 65 74.69736 0 0.1 0 0 0 1 
i 5.059951 257.8797 0.5378755 57 75.09987 0 0.1 0 0 0 1 
i 5.366678 257.8797 0.5378755 52 75.60302 0 0.1 0 0 0 1 
i 5.550715 257.8797 0.5378755 72 75.90491 0 0.1 0 0 0 1 
i 5.857442 257.8797 0.5378755 67 76.40805 0 0.1 0 0 0 1 
i 6.102823 257.8797 0.5378755 75 76.81057 0 0.1 0 0 0 1 
i 6.28686 257.8797 0.5378755 80 77.11245 0 0.1 0 0 0 1 
i 12.83967 257.8797 0.5378755 83 74.39547 0 0.1 0 0 0 1 
i 13.0237 257.8797 0.5378755 88 74.69736 0 0.1 0 0 0 1 
i 13.26908 257.8797 0.5378755 80 75.09987 0 0.1 0 0 0 1 
i 13.57581 257.8797 0.5378755 75 75.60302 0 0.1 0 0 0 1 
i 13.75985 257.8797 0.5378755 95 75.90491 0 0.1 0 0 0 1 
i 14.06657 257.8797 0.5378755 90 76.40805 0 0.1 0 0 0 1 
i 14.31196 257.8797 0.5378755 98 76.81057 0 0.1 0 0 0 1 
i 14.49599 257.8797 0.5378755 103 77.11245 0 0.1 0 0 0 1 
i 2.784594 257.9698 0.7171673 50 70.01811 0 0.1 0 0 0 1 
i 6.88916 257.9698 0.7171673 61 70.01811 0 0.1 0 0 0 1 
i 10.99373 257.9698 0.7171673 73 70.01811 0 0.1 0 0 0 1 
i 15.09829 257.9698 0.7171673 84 70.01811 0 0.1 0 0 0 1 
i 4.569188 258.4176 0.5378755 61 74.29484 0 0.1 0 0 0 1 
i 4.875915 258.4176 0.5378755 66 74.79799 0 0.1 0 0 0 1 
i 5.121297 258.4176 0.5378755 58 75.2005 0 0.1 0 0 0 1 
i 5.305333 258.4176 0.5378755 53 75.50239 0 0.1 0 0 0 1 
i 5.61206 258.4176 0.5378755 73 76.00553 0 0.1 0 0 0 1 
i 5.796096 258.4176 0.5378755 68 76.30742 0 0.1 0 0 0 1 
i 6.041478 258.4176 0.5378755 76 76.70994 0 0.1 0 0 0 1 
i 6.348205 258.4176 0.5378755 81 77.21308 0 0.1 0 0 0 1 
i 12.77832 258.4176 0.5378755 84 74.29484 0 0.1 0 0 0 1 
i 13.08505 258.4176 0.5378755 89 74.79799 0 0.1 0 0 0 1 
i 13.33043 258.4176 0.5378755 81 75.2005 0 0.1 0 0 0 1 
i 13.51446 258.4176 0.5378755 76 75.50239 0 0.1 0 0 0 1 
i 13.82119 258.4176 0.5378755 96 76.00553 0 0.1 0 0 0 1 
i 14.00523 258.4176 0.5378755 91 76.30742 0 0.1 0 0 0 1 
i 14.25061 258.4176 0.5378755 99 76.70994 0 0.1 0 0 0 1 
i 14.55734 258.4176 0.5378755 104 77.21308 0 0.1 0 0 0 1 
i 2.845939 258.8653 0.7171673 50 70.11807 0 0.1 0 0 0 1 
i 3.029976 258.8653 0.7171673 53 70.41996 0 0.1 0 0 0 1 
i 6.950505 258.8653 0.7171673 61 70.11807 0 0.1 0 0 0 1 
i 7.134542 258.8653 1.434335 65 70.41996 0 0.1 0 0 0 1 
i 11.05507 258.8653 0.7171673 73 70.11807 0 0.1 0 0 0 1 
i 11.23911 258.8653 0.7171673 76 70.41996 0 0.1 0 0 0 1 
i 15.15964 258.8653 0.7171673 84 70.11807 0 0.1 0 0 0 1 
i 15.34367 258.8653 1.434335 88 70.41996 0 0.1 0 0 0 1 
i 4.691879 259.2478 0.5378755 63 74.49543 0 0.1 0 0 0 1 
i 4.81457 259.2478 0.5378755 59 74.69669 0 0.1 0 0 0 1 
i 5.059951 259.2478 0.5378755 68 75.0992 0 0.1 0 0 0 1 
i 5.428024 259.2478 0.5378755 72 75.70298 0 0.1 0 0 0 1 
i 5.550715 259.2478 0.5378755 50 75.90423 0 0.1 0 0 0 1 
i 5.918787 259.2478 0.5378755 55 76.50801 0 0.1 0 0 0 1 
i 6.164169 259.2478 0.5378755 46 76.91052 0 0.1 0 0 0 1 
i 6.28686 259.2478 0.5378755 41 77.11178 0 0.1 0 0 0 1 
i 12.90101 259.2478 0.5378755 86 74.49543 0 0.1 0 0 0 1 
i 13.0237 259.2478 0.5378755 82 74.69669 0 0.1 0 0 0 1 
i 13.26908 259.2478 0.5378755 91 75.0992 0 0.1 0 0 0 1 
i 13.63716 259.2478 0.5378755 95 75.70298 0 0.1 0 0 0 1 
i 13.75985 259.2478 0.5378755 73 75.90423 0 0.1 0 0 0 1 
i 14.12792 259.2478 0.5378755 78 76.50801 0 0.1 0 0 0 1 
i 14.3733 259.2478 0.5378755 69 76.91052 0 0.1 0 0 0 1 
i 14.49599 259.2478 0.5378755 64 77.11178 0 0.1 0 0 0 1 
i 2.784594 259.5825 0.7171673 51 70.01744 0 0.1 0 0 0 1 
i 3.091321 259.5825 0.7171673 54 70.52059 0 0.1 0 0 0 1 
i 6.88916 259.5825 0.7171673 62 70.01744 0 0.1 0 0 0 1 
i 10.99373 259.5825 0.7171673 74 70.01744 0 0.1 0 0 0 1 
i 11.30045 259.5825 0.7171673 77 70.52059 0 0.1 0 0 0 1 
i 15.09829 259.5825 0.7171673 85 70.01744 0 0.1 0 0 0 1 
i 4.569188 259.7857 0.5378755 61 74.29417 0 0.1 0 0 0 1 
i 4.93726 259.7857 0.5378755 56 74.89795 0 0.1 0 0 0 1 
i 5.182642 259.7857 0.5378755 65 75.30046 0 0.1 0 0 0 1 
i 5.305333 259.7857 0.5378755 70 75.50172 0 0.1 0 0 0 1 
i 5.673405 259.7857 0.5378755 48 76.10549 0 0.1 0 0 0 1 
i 5.796096 259.7857 0.5378755 52 76.30675 0 0.1 0 0 0 1 
i 6.041478 259.7857 0.5378755 43 76.70927 0 0.1 0 0 0 1 
i 6.40955 259.7857 0.5378755 39 77.31304 0 0.1 0 0 0 1 
i 12.77832 259.7857 0.5378755 84 74.29417 0 0.1 0 0 0 1 
i 13.14639 259.7857 0.5378755 79 74.89795 0 0.1 0 0 0 1 
i 13.39177 259.7857 0.5378755 88 75.30046 0 0.1 0 0 0 1 
i 13.51446 259.7857 0.5378755 93 75.50172 0 0.1 0 0 0 1 
i 13.88254 259.7857 0.5378755 71 76.10549 0 0.1 0 0 0 1 
i 14.00523 259.7857 0.5378755 75 76.30675 0 0.1 0 0 0 1 
i 14.25061 259.7857 0.5378755 66 76.70927 0 0.1 0 0 0 1 
i 14.61868 259.7857 1.448831 62 77.31304 0 0.1 0 0 0 1 
i 2.907285 260.5174 0.7171673 51 70.21803 0 0.1 0 0 0 1 
i 3.029976 260.5174 0.7171673 53 70.41929 0 0.1 0 0 0 1 
i 7.011851 260.5174 0.7171673 62 70.21803 0 0.1 0 0 0 1 
i 7.134542 260.5174 0.7171673 65 70.41929 0 0.1 0 0 0 1 
i 11.11642 260.5174 0.7171673 74 70.21803 0 0.1 0 0 0 1 
i 11.23911 260.5174 0.7171673 76 70.41929 0 0.1 0 0 0 1 
i 15.22098 260.5174 0.7171673 85 70.21803 0 0.1 0 0 0 1 
i 15.34367 260.5174 0.7171673 88 70.41929 0 0.1 0 0 0 1 
i 4.630533 260.5198 1.075751 61 74.39413 0 0.1 0 0 0 1 
i 4.81457 260.5198 1.075751 62 74.69602 0 0.1 0 0 0 1 
i 5.550715 260.5198 1.075751 62 75.90356 0 0.1 0 0 0 1 
i 5.734751 260.5198 1.075751 63 76.20545 0 0.1 0 0 0 1 
i 12.83967 260.5198 1.075751 84 74.39413 0 0.1 0 0 0 1 
i 13.0237 260.5198 1.075751 85 74.69602 0 0.1 0 0 0 1 
i 13.57581 260.5198 1.075751 84 75.60168 0 0.1 0 0 0 1 
i 13.75985 260.5198 1.075751 85 75.90356 0 0.1 0 0 0 1 
i 13.94388 260.5198 1.075751 86 76.20545 0 0.1 0 0 0 1 
i 14.68003 260.5198 1.075751 86 77.413 0 0.1 0 0 0 1 
i 5.489369 261.0577 0.5378755 60 75.80294 0 0.1 0 0 0 1 
i 13.6985 261.0577 0.5378755 83 75.80294 0 0.1 0 0 0 1 
i 2.784594 261.2346 0.7171673 52 70.01677 0 0.1 0 0 0 1 
i 3.152666 261.2346 0.7171673 54 70.62055 0 0.1 0 0 0 1 
i 6.88916 261.2346 0.7171673 64 70.01677 0 0.1 0 0 0 1 
i 7.257232 261.2346 0.7171673 66 70.62055 0 0.1 0 0 0 1 
i 10.99373 261.2346 0.7171673 75 70.01677 0 0.1 0 0 0 1 
i 11.3618 261.2346 0.7171673 77 70.62055 0 0.1 0 0 0 1 
i 15.09829 261.2346 0.7171673 87 70.01677 0 0.1 0 0 0 1 
i 15.46636 261.2346 2.25308 89 70.62055 0 0.1 0 0 0 1 
i 2.845939 262.0533 0.7171673 53 70.11673 0 0.1 0 0 0 1 
i 2.907285 262.0533 1.434335 52 70.21736 0 0.1 0 0 0 1 
i 3.029976 262.0533 1.434335 54 70.41862 0 0.1 0 0 0 1 
i 3.214012 262.0533 1.434335 55 70.7205 0 0.1 0 0 0 1 
i 6.950505 262.0533 1.434335 65 70.11673 0 0.1 0 0 0 1 
i 7.011851 262.0533 1.434335 63 70.21736 0 0.1 0 0 0 1 
i 7.134542 262.0533 1.434335 66 70.41862 0 0.1 0 0 0 1 
i 7.318578 262.0533 0.7171673 67 70.7205 0 0.1 0 0 0 1 
i 11.05507 262.0533 0.7171673 76 70.11673 0 0.1 0 0 0 1 
i 11.11642 262.0533 1.434335 75 70.21736 0 0.1 0 0 0 1 
i 11.23911 262.0533 1.434335 77 70.41862 0 0.1 0 0 0 1 
i 11.42314 262.0533 1.434335 78 70.7205 0 0.1 0 0 0 1 
i 15.15964 262.0533 1.434335 88 70.11673 0 0.1 0 0 0 1 
i 15.22098 262.0533 1.434335 86 70.21736 0 0.1 0 0 0 1 
i 15.52771 262.0533 0.7171673 90 70.7205 0 0.1 0 0 0 1 
i 2.96863 262.7705 0.7171673 51 70.31799 0 0.1 0 0 0 1 
i 6.88916 262.7705 0.7171673 64 70.0161 0 0.1 0 0 0 1 
i 11.17776 262.7705 0.7171673 74 70.31799 0 0.1 0 0 0 1 
i 15.09829 262.7705 2.137916 87 70.0161 0 0.1 0 0 0 1 
i 3.275357 264.1912 0.7171673 54 70.82046 0 0.1 0 0 0 1 
i 7.379923 264.1912 0.7171673 65 70.82046 0 0.1 0 0 0 1 
i 11.48449 264.1912 0.7171673 77 70.82046 0 0.1 0 0 0 1 
i 15.58906 264.1912 0.7171673 88 70.82046 0 0.1 0 0 0 1 
i 2.784594 264.9084 0.7171673 49 70.01543 0 0.1 0 0 0 1 
i 6.88916 264.9084 0.7171673 61 70.01543 0 0.1 0 0 0 1 
i 10.99373 264.9084 0.7171673 72 70.01543 0 0.1 0 0 0 1 
i 15.09829 264.9084 2.329876 84 70.01543 0 0.1 0 0 0 1 
i 2.845939 265.8039 1.434335 49 70.11539 0 0.1 0 0 0 1 
i 3.275357 265.8039 1.434335 55 70.81979 0 0.1 0 0 0 1 
i 6.950505 265.8039 0.7171673 60 70.11539 0 0.1 0 0 0 1 
i 7.379923 265.8039 0.7171673 66 70.81979 0 0.1 0 0 0 1 
i 11.05507 265.8039 1.434335 72 70.11539 0 0.1 0 0 0 1 
i 11.48449 265.8039 0.7171673 78 70.81979 0 0.1 0 0 0 1 
i 15.15964 265.8039 0.7171673 83 70.11539 0 0.1 0 0 0 1 
i 15.58906 265.8039 0.7171673 89 70.81979 0 0.1 0 0 0 1 
i 6.88916 266.5211 0.7171673 61 70.01476 0 0.1 0 0 0 1 
i 7.441269 266.5211 0.7171673 67 70.92042 0 0.1 0 0 0 1 
i 11.54583 266.5211 0.7171673 78 70.92042 0 0.1 0 0 0 1 
i 15.6504 266.5211 1.652043 90 70.92042 0 0.1 0 0 0 1 
i 2.907285 267.456 0.7171673 49 70.21535 0 0.1 0 0 0 1 
i 3.275357 267.456 0.7171673 55 70.81912 0 0.1 0 0 0 1 
i 7.011851 267.456 0.7171673 60 70.21535 0 0.1 0 0 0 1 
i 7.379923 267.456 0.7171673 66 70.81912 0 0.1 0 0 0 1 
i 11.11642 267.456 0.7171673 72 70.21535 0 0.1 0 0 0 1 
i 11.48449 267.456 0.7171673 78 70.81912 0 0.1 0 0 0 1 
i 15.22098 267.456 0.7171673 83 70.21535 0 0.1 0 0 0 1 
i 15.58906 267.456 0.7171673 89 70.81912 0 0.1 0 0 0 1 
i 2.784594 268.1731 0.7171673 50 70.01409 0 0.1 0 0 0 1 
i 3.398048 268.1731 0.7171673 56 71.02038 0 0.1 0 0 0 1 
i 6.88916 268.1731 0.7171673 62 70.01409 0 0.1 0 0 0 1 
i 7.502614 268.1731 0.7171673 68 71.02038 0 0.1 0 0 0 1 
i 10.99373 268.1731 0.7171673 73 70.01409 0 0.1 0 0 0 1 
i 11.60718 268.1731 0.7171673 79 71.02038 0 0.1 0 0 0 1 
i 15.09829 268.1731 0.7171673 85 70.01409 0 0.1 0 0 0 1 
i 15.71175 268.1731 4.021253 91 71.02038 0 0.1 0 0 0 1 
i 2.845939 268.9919 1.434335 50 70.11405 0 0.1 0 0 0 1 
i 2.907285 268.9919 1.434335 49 70.21468 0 0.1 0 0 0 1 
i 3.275357 268.9919 1.434335 56 70.81845 0 0.1 0 0 0 1 
i 3.459394 268.9919 0.7171673 57 71.12034 0 0.1 0 0 0 1 
i 6.950505 268.9919 0.7171673 62 70.11405 0 0.1 0 0 0 1 
i 7.011851 268.9919 1.434335 61 70.21468 0 0.1 0 0 0 1 
i 7.379923 268.9919 1.434335 67 70.81845 0 0.1 0 0 0 1 
i 7.56396 268.9919 0.7171673 69 71.12034 0 0.1 0 0 0 1 
i 11.05507 268.9919 1.434335 73 70.11405 0 0.1 0 0 0 1 
i 11.11642 268.9919 1.434335 72 70.21468 0 0.1 0 0 0 1 
i 11.48449 268.9919 0.7171673 79 70.81845 0 0.1 0 0 0 1 
i 11.66853 268.9919 0.7171673 80 71.12034 0 0.1 0 0 0 1 
i 15.15964 268.9919 0.7171673 85 70.11405 0 0.1 0 0 0 1 
i 15.22098 268.9919 1.434335 84 70.21468 0 0.1 0 0 0 1 
i 15.58906 268.9919 1.434335 90 70.81845 0 0.1 0 0 0 1 
i 15.77309 268.9919 0.7171673 92 71.12034 0 0.1 0 0 0 1 
i 3.336703 269.709 0.7171673 55 70.91908 0 0.1 0 0 0 1 
i 7.073196 269.709 0.7171673 60 70.3153 0 0.1 0 0 0 1 
i 7.502614 269.709 0.7171673 68 71.01971 0 0.1 0 0 0 1 
i 11.54583 269.709 0.7171673 78 70.91908 0 0.1 0 0 0 1 
i 11.60718 269.709 0.7171673 79 71.01971 0 0.1 0 0 0 1 
i 15.28233 269.709 0.7171673 83 70.3153 0 0.1 0 0 0 1 
i 3.029976 270.7601 0.7171673 50 70.41526 0 0.1 0 0 0 1 
i 3.275357 270.7601 0.7171673 54 70.81778 0 0.1 0 0 0 1 
i 7.134542 270.7601 0.7171673 61 70.41526 0 0.1 0 0 0 1 
i 7.379923 270.7601 0.7171673 66 70.81778 0 0.1 0 0 0 1 
i 11.23911 270.7601 0.7171673 73 70.41526 0 0.1 0 0 0 1 
i 11.48449 270.7601 0.7171673 77 70.81778 0 0.1 0 0 0 1 
i 15.34367 270.7601 0.7171673 84 70.41526 0 0.1 0 0 0 1 
i 15.58906 270.7601 0.7171673 89 70.81778 0 0.1 0 0 0 1 
i 2.784594 271.4772 0.7171673 52 70.01275 0 0.1 0 0 0 1 
i 3.520739 271.4772 0.7171673 57 71.22029 0 0.1 0 0 0 1 
i 6.88916 271.4772 0.7171673 64 70.01275 0 0.1 0 0 0 1 
i 7.625305 271.4772 0.7171673 68 71.22029 0 0.1 0 0 0 1 
i 10.99373 271.4772 0.7171673 75 70.01275 0 0.1 0 0 0 1 
i 11.72987 271.4772 0.7171673 80 71.22029 0 0.1 0 0 0 1 
i 15.09829 271.4772 0.7171673 87 70.01275 0 0.1 0 0 0 1 
i 1 271.8883 0.5378755 54 70.0208 0 0.1 0 0 0 1 
i 5.104566 271.8883 0.5378755 65 70.0208 0 0.1 0 0 0 1 
i 9.209132 271.8883 0.5378755 77 70.0208 0 0.1 0 0 0 1 
i 13.3137 271.8883 0.5378755 88 70.0208 0 0.1 0 0 0 1 
i 2.845939 272.296 1.434335 53 70.1127 0 0.1 0 0 0 1 
i 3.029976 272.296 0.7171673 50 70.41459 0 0.1 0 0 0 1 
i 3.275357 272.296 0.7171673 55 70.81711 0 0.1 0 0 0 1 
i 3.582084 272.296 0.7171673 58 71.32025 0 0.1 0 0 0 1 
i 6.950505 272.296 0.7171673 65 70.1127 0 0.1 0 0 0 1 
i 7.134542 272.296 1.434335 61 70.41459 0 0.1 0 0 0 1 
i 7.379923 272.296 1.434335 66 70.81711 0 0.1 0 0 0 1 
i 7.68665 272.296 1.434335 69 71.32025 0 0.1 0 0 0 1 
i 11.05507 272.296 1.434335 76 70.1127 0 0.1 0 0 0 1 
i 11.23911 272.296 0.7171673 73 70.41459 0 0.1 0 0 0 1 
i 11.48449 272.296 0.7171673 78 70.81711 0 0.1 0 0 0 1 
i 11.79122 272.296 0.7171673 81 71.32025 0 0.1 0 0 0 1 
i 15.15964 272.296 0.7171673 88 70.1127 0 0.1 0 0 0 1 
i 15.34367 272.296 1.434335 84 70.41459 0 0.1 0 0 0 1 
i 15.58906 272.296 1.434335 89 70.81711 0 0.1 0 0 0 1 
i 15.89578 272.296 1.434335 92 71.32025 0 0.1 0 0 0 1 
i 3.091321 273.0131 0.7171673 49 70.51522 0 0.1 0 0 0 1 
i 3.336703 273.0131 0.7171673 54 70.91774 0 0.1 0 0 0 1 
i 3.520739 273.0131 0.7171673 57 71.21962 0 0.1 0 0 0 1 
i 6.88916 273.0131 0.7171673 64 70.01208 0 0.1 0 0 0 1 
i 11.30045 273.0131 0.7171673 72 70.51522 0 0.1 0 0 0 1 
i 11.54583 273.0131 0.7171673 77 70.91774 0 0.1 0 0 0 1 
i 11.72987 273.0131 0.7171673 80 71.21962 0 0.1 0 0 0 1 
i 15.09829 273.0131 0.7171673 87 70.01208 0 0.1 0 0 0 1 
i 1.061345 273.0437 1.075751 55 70.12075 0 0.1 0 0 0 1 
i 5.165911 273.0437 0.5378755 67 70.12075 0 0.1 0 0 0 1 
i 9.270478 273.0437 1.075751 78 70.12075 0 0.1 0 0 0 1 
i 13.37504 273.0437 0.5378755 90 70.12075 0 0.1 0 0 0 1 
i 5.104566 273.5816 0.5378755 66 70.02013 0 0.1 0 0 0 1 
i 13.3137 273.5816 0.5378755 89 70.02013 0 0.1 0 0 0 1 
i 2.907285 273.8693 0.7171673 53 70.21266 0 0.1 0 0 0 1 
i 3.029976 273.8693 0.7171673 51 70.41392 0 0.1 0 0 0 1 
i 3.275357 273.8693 0.7171673 56 70.81644 0 0.1 0 0 0 1 
i 3.64343 273.8693 0.7171673 58 71.42021 0 0.1 0 0 0 1 
i 7.011851 273.8693 0.7171673 65 70.21266 0 0.1 0 0 0 1 
i 7.134542 273.8693 0.7171673 63 70.41392 0 0.1 0 0 0 1 
i 7.379923 273.8693 0.7171673 67 70.81644 0 0.1 0 0 0 1 
i 7.747996 273.8693 0.7171673 70 71.42021 0 0.1 0 0 0 1 
i 11.11642 273.8693 0.7171673 76 70.21266 0 0.1 0 0 0 1 
i 11.23911 273.8693 0.7171673 74 70.41392 0 0.1 0 0 0 1 
i 11.48449 273.8693 0.7171673 79 70.81644 0 0.1 0 0 0 1 
i 11.85256 273.8693 0.7171673 81 71.42021 0 0.1 0 0 0 1 
i 15.22098 273.8693 0.7171673 88 70.21266 0 0.1 0 0 0 1 
i 15.34367 273.8693 0.7171673 86 70.41392 0 0.1 0 0 0 1 
i 15.58906 273.8693 0.7171673 90 70.81644 0 0.1 0 0 0 1 
i 15.95713 273.8693 0.7171673 93 71.42021 0 0.1 0 0 0 1 
i 2.784594 274.5865 0.7171673 52 70.0114 0 0.1 0 0 0 1 
i 3.152666 274.5865 0.7171673 50 70.61518 0 0.1 0 0 0 1 
i 3.398048 274.5865 0.7171673 54 71.01769 0 0.1 0 0 0 1 
i 3.520739 274.5865 0.7171673 57 71.21895 0 0.1 0 0 0 1 
i 6.88916 274.5865 0.7171673 64 70.0114 0 0.1 0 0 0 1 
i 7.257232 274.5865 0.7171673 61 70.61518 0 0.1 0 0 0 1 
i 7.502614 274.5865 0.7171673 66 71.01769 0 0.1 0 0 0 1 
i 7.625305 274.5865 0.7171673 68 71.21895 0 0.1 0 0 0 1 
i 10.99373 274.5865 0.7171673 75 70.0114 0 0.1 0 0 0 1 
i 11.3618 274.5865 0.7171673 73 70.61518 0 0.1 0 0 0 1 
i 11.60718 274.5865 0.7171673 77 71.01769 0 0.1 0 0 0 1 
i 11.72987 274.5865 0.7171673 80 71.21895 0 0.1 0 0 0 1 
i 15.09829 274.5865 0.7171673 87 70.0114 0 0.1 0 0 0 1 
i 15.46636 274.5865 0.7171673 84 70.61518 0 0.1 0 0 0 1 
i 15.71175 274.5865 0.7171673 89 71.01769 0 0.1 0 0 0 1 
i 15.83444 274.5865 0.7171673 91 71.21895 0 0.1 0 0 0 1 
i 1.122691 274.7784 0.5378755 56 70.22071 0 0.1 0 0 0 1 
i 5.227257 274.7784 0.5378755 68 70.22071 0 0.1 0 0 0 1 
i 9.331823 274.7784 0.5378755 79 70.22071 0 0.1 0 0 0 1 
i 13.43639 274.7784 0.5378755 91 70.22071 0 0.1 0 0 0 1 
i 1 275.3163 0.5378755 55 70.01945 0 0.1 0 0 0 1 
i 5.104566 275.3163 0.5378755 67 70.01945 0 0.1 0 0 0 1 
i 9.209132 275.3163 0.5378755 78 70.01945 0 0.1 0 0 0 1 
i 13.3137 275.3163 0.5378755 90 70.01945 0 0.1 0 0 0 1 
i 2.845939 275.3321 1.434335 52 70.11136 0 0.1 0 0 0 1 
i 2.907285 275.3321 1.434335 53 70.21199 0 0.1 0 0 0 1 
i 3.029976 275.3321 0.7171673 51 70.41325 0 0.1 0 0 0 1 
i 3.214012 275.3321 1.434335 50 70.71514 0 0.1 0 0 0 1 
i 3.275357 275.3321 1.434335 56 70.81577 0 0.1 0 0 0 1 
i 3.459394 275.3321 1.434335 55 71.11765 0 0.1 0 0 0 1 
i 3.582084 275.3321 0.7171673 57 71.31891 0 0.1 0 0 0 1 
i 3.64343 275.3321 1.434335 58 71.41954 0 0.1 0 0 0 1 
i 6.950505 275.3321 1.434335 64 70.11136 0 0.1 0 0 0 1 
i 7.011851 275.3321 0.7171673 65 70.21199 0 0.1 0 0 0 1 
i 7.134542 275.3321 1.434335 63 70.41325 0 0.1 0 0 0 1 
i 7.318578 275.3321 0.7171673 61 70.71514 0 0.1 0 0 0 1 
i 7.379923 275.3321 0.7171673 67 70.81577 0 0.1 0 0 0 1 
i 7.56396 275.3321 0.7171673 66 71.11765 0 0.1 0 0 0 1 
i 7.68665 275.3321 0.7171673 68 71.31891 0 0.1 0 0 0 1 
i 7.747996 275.3321 1.434335 70 71.41954 0 0.1 0 0 0 1 
i 11.05507 275.3321 1.434335 75 70.11136 0 0.1 0 0 0 1 
i 11.11642 275.3321 1.434335 76 70.21199 0 0.1 0 0 0 1 
i 11.23911 275.3321 0.7171673 74 70.41325 0 0.1 0 0 0 1 
i 11.42314 275.3321 1.434335 73 70.71514 0 0.1 0 0 0 1 
i 11.48449 275.3321 0.7171673 79 70.81577 0 0.1 0 0 0 1 
i 11.66853 275.3321 1.434335 78 71.11765 0 0.1 0 0 0 1 
i 11.79122 275.3321 0.7171673 80 71.31891 0 0.1 0 0 0 1 
i 11.85256 275.3321 1.434335 81 71.41954 0 0.1 0 0 0 1 
i 15.15964 275.3321 1.434335 87 70.11136 0 0.1 0 0 0 1 
i 15.22098 275.3321 0.7171673 88 70.21199 0 0.1 0 0 0 1 
i 15.34367 275.3321 1.434335 86 70.41325 0 0.1 0 0 0 1 
i 15.52771 275.3321 0.7171673 84 70.71514 0 0.1 0 0 0 1 
i 15.58906 275.3321 1.434335 90 70.81577 0 0.1 0 0 0 1 
i 15.77309 275.3321 0.7171673 89 71.11765 0 0.1 0 0 0 1 
i 15.89578 275.3321 1.434335 91 71.31891 0 0.1 0 0 0 1 
i 15.95713 275.3321 1.434335 93 71.41954 0 0.1 0 0 0 1 
i 2.96863 276.0493 0.7171673 54 70.31262 0 0.1 0 0 0 1 
i 3.704775 276.0493 0.7171673 59 71.52017 0 0.1 0 0 0 1 
i 7.073196 276.0493 0.7171673 66 70.31262 0 0.1 0 0 0 1 
i 7.257232 276.0493 0.7171673 62 70.61451 0 0.1 0 0 0 1 
i 7.441269 276.0493 0.7171673 68 70.91639 0 0.1 0 0 0 1 
i 7.502614 276.0493 0.7171673 67 71.01702 0 0.1 0 0 0 1 
i 7.625305 276.0493 0.7171673 69 71.21828 0 0.1 0 0 0 1 
i 11.17776 276.0493 0.7171673 77 70.31262 0 0.1 0 0 0 1 
i 11.54583 276.0493 0.7171673 79 70.91639 0 0.1 0 0 0 1 
i 11.91391 276.0493 0.7171673 82 71.52017 0 0.1 0 0 0 1 
i 15.28233 276.0493 0.7171673 89 70.31262 0 0.1 0 0 0 1 
i 15.46636 276.0493 0.7171673 85 70.61451 0 0.1 0 0 0 1 
i 15.83444 276.0493 0.7171673 92 71.21828 0 0.1 0 0 0 1 
i 1.061345 276.3911 1.075751 56 70.11941 0 0.1 0 0 0 1 
i 1.122691 276.3911 0.5378755 57 70.22004 0 0.1 0 0 0 1 
i 5.165911 276.3911 0.5378755 67 70.11941 0 0.1 0 0 0 1 
i 5.227257 276.3911 1.075751 68 70.22004 0 0.1 0 0 0 1 
i 9.270478 276.3911 1.075751 79 70.11941 0 0.1 0 0 0 1 
i 9.331823 276.3911 0.5378755 80 70.22004 0 0.1 0 0 0 1 
i 13.37504 276.3911 0.5378755 90 70.11941 0 0.1 0 0 0 1 
i 13.43639 276.3911 1.075751 91 70.22004 0 0.1 0 0 0 1 
i 1.184036 276.929 0.5378755 58 70.32067 0 0.1 0 0 0 1 
i 5.288602 276.929 0.5378755 69 70.32067 0 0.1 0 0 0 1 
i 9.393168 276.929 0.5378755 81 70.32067 0 0.1 0 0 0 1 
i 13.49773 276.929 1.856582 92 70.32067 0 0.1 0 0 0 1 
i 3.766121 278.0684 0.7171673 54 71.62013 0 0.1 0 0 0 1 
i 7.870687 278.0684 0.7171673 65 71.62013 0 0.1 0 0 0 1 
i 11.97525 278.0684 0.7171673 77 71.62013 0 0.1 0 0 0 1 
i 16.07982 278.0684 0.7171673 88 71.62013 0 0.1 0 0 0 1 
i 1.245382 278.2477 0.5378755 58 70.42063 0 0.1 0 0 0 1 
i 5.349948 278.2477 0.5378755 69 70.42063 0 0.1 0 0 0 1 
i 9.454514 278.2477 0.5378755 81 70.42063 0 0.1 0 0 0 1 
i 13.55908 278.2477 0.5378755 92 70.42063 0 0.1 0 0 0 1 
i 2.784594 278.7855 0.7171673 46 70.01006 0 0.1 0 0 0 1 
i 6.88916 278.7855 0.7171673 57 70.01006 0 0.1 0 0 0 1 
i 10.99373 278.7855 0.7171673 69 70.01006 0 0.1 0 0 0 1 
i 15.09829 278.7855 0.7171673 80 70.01006 0 0.1 0 0 0 1 
i 1 278.7855 0.5378755 55 70.01811 0 0.1 0 0 0 1 
i 5.104566 278.7855 0.5378755 67 70.01811 0 0.1 0 0 0 1 
i 9.209132 278.7855 0.5378755 78 70.01811 0 0.1 0 0 0 1 
i 13.3137 278.7855 1.612709 90 70.01811 0 0.1 0 0 0 1 
i 2.845939 279.6811 0.7171673 44 70.11002 0 0.1 0 0 0 1 
i 3.766121 279.6811 1.434335 55 71.61945 0 0.1 0 0 0 1 
i 6.950505 279.6811 1.434335 56 70.11002 0 0.1 0 0 0 1 
i 7.870687 279.6811 0.7171673 66 71.61945 0 0.1 0 0 0 1 
i 11.05507 279.6811 0.7171673 67 70.11002 0 0.1 0 0 0 1 
i 11.97525 279.6811 1.434335 78 71.61945 0 0.1 0 0 0 1 
i 15.15964 279.6811 1.434335 79 70.11002 0 0.1 0 0 0 1 
i 16.07982 279.6811 0.7171673 89 71.61945 0 0.1 0 0 0 1 
i 1.061345 279.8604 1.075751 56 70.11807 0 0.1 0 0 0 1 
i 1.245382 279.8604 0.5378755 58 70.41996 0 0.1 0 0 0 1 
i 5.165911 279.8604 0.5378755 67 70.11807 0 0.1 0 0 0 1 
i 5.349948 279.8604 0.5378755 70 70.41996 0 0.1 0 0 0 1 
i 9.270478 279.8604 1.075751 79 70.11807 0 0.1 0 0 0 1 
i 9.454514 279.8604 0.5378755 81 70.41996 0 0.1 0 0 0 1 
i 13.55908 279.8604 0.5378755 93 70.41996 0 0.1 0 0 0 1 
i 1.306727 280.3982 0.5378755 59 70.52059 0 0.1 0 0 0 1 
i 2.784594 280.3982 0.7171673 45 70.00939 0 0.1 0 0 0 1 
i 5.104566 280.3982 0.5378755 68 70.01744 0 0.1 0 0 0 1 
i 5.411293 280.3982 0.5378755 71 70.52059 0 0.1 0 0 0 1 
i 7.932032 280.3982 0.7171673 67 71.72008 0 0.1 0 0 0 1 
i 9.515859 280.3982 0.5378755 82 70.52059 0 0.1 0 0 0 1 
i 10.99373 280.3982 0.7171673 68 70.00939 0 0.1 0 0 0 1 
i 13.3137 280.3982 0.5378755 91 70.01744 0 0.1 0 0 0 1 
i 13.62043 280.3982 0.5378755 94 70.52059 0 0.1 0 0 0 1 
i 16.14116 280.3982 3.905123 90 71.72008 0 0.1 0 0 0 1 
i 2.907285 281.3331 0.7171673 43 70.20998 0 0.1 0 0 0 1 
i 3.766121 281.3331 0.7171673 55 71.61878 0 0.1 0 0 0 1 
i 7.011851 281.3331 0.7171673 55 70.20998 0 0.1 0 0 0 1 
i 7.870687 281.3331 0.7171673 66 71.61878 0 0.1 0 0 0 1 
i 11.11642 281.3331 0.7171673 66 70.20998 0 0.1 0 0 0 1 
i 11.97525 281.3331 0.7171673 78 71.61878 0 0.1 0 0 0 1 
i 15.22098 281.3331 0.7171673 78 70.20998 0 0.1 0 0 0 1 
i 16.07982 281.3331 0.7171673 89 71.61878 0 0.1 0 0 0 1 
i 1.122691 281.5124 0.5378755 56 70.21803 0 0.1 0 0 0 1 
i 1.245382 281.5124 1.075751 58 70.41929 0 0.1 0 0 0 1 
i 5.227257 281.5124 0.5378755 68 70.21803 0 0.1 0 0 0 1 
i 5.349948 281.5124 0.5378755 70 70.41929 0 0.1 0 0 0 1 
i 9.331823 281.5124 0.5378755 79 70.21803 0 0.1 0 0 0 1 
i 9.454514 281.5124 1.075751 81 70.41929 0 0.1 0 0 0 1 
i 13.43639 281.5124 0.5378755 91 70.21803 0 0.1 0 0 0 1 
i 13.55908 281.5124 0.5378755 93 70.41929 0 0.1 0 0 0 1 
i 1.368072 282.0503 0.5378755 60 70.62055 0 0.1 0 0 0 1 
i 2.784594 282.0503 0.7171673 45 70.00872 0 0.1 0 0 0 1 
i 3.888811 282.0503 0.7171673 56 71.82004 0 0.1 0 0 0 1 
i 5.104566 282.0503 0.5378755 69 70.01677 0 0.1 0 0 0 1 
i 5.472639 282.0503 0.5378755 71 70.62055 0 0.1 0 0 0 1 
i 6.88916 282.0503 0.7171673 56 70.00872 0 0.1 0 0 0 1 
i 7.993377 282.0503 0.7171673 67 71.82004 0 0.1 0 0 0 1 
i 9.577205 282.0503 0.5378755 83 70.62055 0 0.1 0 0 0 1 
i 10.99373 282.0503 0.7171673 68 70.00872 0 0.1 0 0 0 1 
i 12.09794 282.0503 0.7171673 79 71.82004 0 0.1 0 0 0 1 
i 13.3137 282.0503 0.5378755 92 70.01677 0 0.1 0 0 0 1 
i 13.68177 282.0503 0.5378755 94 70.62055 0 0.1 0 0 0 1 
i 15.09829 282.0503 0.7171673 79 70.00872 0 0.1 0 0 0 1 
i 2.845939 282.869 1.434335 44 70.10868 0 0.1 0 0 0 1 
i 2.907285 282.869 0.7171673 43 70.20931 0 0.1 0 0 0 1 
i 3.766121 282.869 1.434335 56 71.61811 0 0.1 0 0 0 1 
i 3.950157 282.869 0.7171673 57 71.92 0 0.1 0 0 0 1 
i 6.950505 282.869 0.7171673 56 70.10868 0 0.1 0 0 0 1 
i 7.011851 282.869 1.434335 55 70.20931 0 0.1 0 0 0 1 
i 7.870687 282.869 1.434335 67 71.61811 0 0.1 0 0 0 1 
i 8.054723 282.869 1.434335 68 71.92 0 0.1 0 0 0 1 
i 11.05507 282.869 1.434335 67 70.10868 0 0.1 0 0 0 1 
i 11.11642 282.869 0.7171673 66 70.20931 0 0.1 0 0 0 1 
i 11.97525 282.869 1.434335 79 71.61811 0 0.1 0 0 0 1 
i 12.15929 282.869 0.7171673 80 71.92 0 0.1 0 0 0 1 
i 15.15964 282.869 0.7171673 79 70.10868 0 0.1 0 0 0 1 
i 15.22098 282.869 1.434335 78 70.20931 0 0.1 0 0 0 1 
i 16.26386 282.869 1.434335 91 71.92 0 0.1 0 0 0 1 
i 1.061345 283.0483 1.075751 58 70.11673 0 0.1 0 0 0 1 
i 1.122691 283.0483 1.075751 57 70.21736 0 0.1 0 0 0 1 
i 1.245382 283.0483 1.075751 59 70.41862 0 0.1 0 0 0 1 
i 1.429418 283.0483 0.5378755 61 70.7205 0 0.1 0 0 0 1 
i 5.165911 283.0483 1.075751 70 70.11673 0 0.1 0 0 0 1 
i 5.227257 283.0483 1.075751 69 70.21736 0 0.1 0 0 0 1 
i 5.349948 283.0483 0.5378755 71 70.41862 0 0.1 0 0 0 1 
i 5.533984 283.0483 0.5378755 72 70.7205 0 0.1 0 0 0 1 
i 9.270478 283.0483 1.075751 81 70.11673 0 0.1 0 0 0 1 
i 9.331823 283.0483 1.075751 80 70.21736 0 0.1 0 0 0 1 
i 9.454514 283.0483 0.5378755 82 70.41862 0 0.1 0 0 0 1 
i 9.63855 283.0483 0.5378755 84 70.7205 0 0.1 0 0 0 1 
i 13.37504 283.0483 0.5378755 93 70.11673 0 0.1 0 0 0 1 
i 13.43639 283.0483 1.075751 92 70.21736 0 0.1 0 0 0 1 
i 13.55908 283.0483 0.5378755 94 70.41862 0 0.1 0 0 0 1 
i 13.74312 283.0483 1.075751 95 70.7205 0 0.1 0 0 0 1 
i 1.368072 283.5862 0.5378755 60 70.61987 0 0.1 0 0 0 1 
i 2.96863 283.5862 0.7171673 42 70.30994 0 0.1 0 0 0 1 
i 3.827466 283.5862 0.7171673 55 71.71874 0 0.1 0 0 0 1 
i 5.288602 283.5862 0.5378755 68 70.31799 0 0.1 0 0 0 1 
i 5.472639 283.5862 0.5378755 72 70.61987 0 0.1 0 0 0 1 
i 7.073196 283.5862 0.7171673 54 70.30994 0 0.1 0 0 0 1 
i 9.515859 283.5862 0.5378755 82 70.51925 0 0.1 0 0 0 1 
i 9.577205 283.5862 0.5378755 83 70.61987 0 0.1 0 0 0 1 
i 11.17776 283.5862 0.7171673 65 70.30994 0 0.1 0 0 0 1 
i 12.0366 283.5862 0.7171673 78 71.71874 0 0.1 0 0 0 1 
i 13.49773 283.5862 0.5378755 91 70.31799 0 0.1 0 0 0 1 
i 13.62043 283.5862 0.5378755 93 70.51925 0 0.1 0 0 0 1 
i 15.28233 283.5862 1.768173 77 70.30994 0 0.1 0 0 0 1 
i 3.029976 284.6372 0.7171673 43 70.4099 0 0.1 0 0 0 1 
i 3.766121 284.6372 0.7171673 54 71.61744 0 0.1 0 0 0 1 
i 7.134542 284.6372 0.7171673 54 70.4099 0 0.1 0 0 0 1 
i 7.870687 284.6372 0.7171673 66 71.61744 0 0.1 0 0 0 1 
i 11.23911 284.6372 0.7171673 66 70.4099 0 0.1 0 0 0 1 
i 11.97525 284.6372 0.7171673 77 71.61744 0 0.1 0 0 0 1 
i 16.07982 284.6372 0.7171673 89 71.61744 0 0.1 0 0 0 1 
i 1.490763 285.1862 0.5378755 59 70.82046 0 0.1 0 0 0 1 
i 5.595329 285.1862 0.5378755 71 70.82046 0 0.1 0 0 0 1 
i 9.699895 285.1862 0.5378755 82 70.82046 0 0.1 0 0 0 1 
i 13.80446 285.1862 0.5378755 94 70.82046 0 0.1 0 0 0 1 
i 2.784594 285.3544 0.7171673 45 70.00738 0 0.1 0 0 0 1 
i 4.011502 285.3544 0.7171673 57 72.01996 0 0.1 0 0 0 1 
i 6.88916 285.3544 0.7171673 57 70.00738 0 0.1 0 0 0 1 
i 8.116068 285.3544 0.7171673 68 72.01996 0 0.1 0 0 0 1 
i 10.99373 285.3544 0.7171673 68 70.00738 0 0.1 0 0 0 1 
i 12.22063 285.3544 0.7171673 80 72.01996 0 0.1 0 0 0 1 
i 15.09829 285.3544 0.7171673 80 70.00738 0 0.1 0 0 0 1 
i 16.3252 285.3544 0.7171673 91 72.01996 0 0.1 0 0 0 1 
i 1 285.7241 0.5378755 55 70.01543 0 0.1 0 0 0 1 
i 5.104566 285.7241 0.5378755 67 70.01543 0 0.1 0 0 0 1 
i 9.209132 285.7241 0.5378755 78 70.01543 0 0.1 0 0 0 1 
i 13.3137 285.7241 0.5378755 90 70.01543 0 0.1 0 0 0 1 
i 2.845939 286.1731 1.434335 45 70.10734 0 0.1 0 0 0 1 
i 3.029976 286.1731 1.434335 42 70.40922 0 0.1 0 0 0 1 
i 3.766121 286.1731 0.7171673 55 71.61677 0 0.1 0 0 0 1 
i 4.072848 286.1731 0.7171673 58 72.11992 0 0.1 0 0 0 1 
i 6.950505 286.1731 0.7171673 57 70.10734 0 0.1 0 0 0 1 
i 7.134542 286.1731 0.7171673 54 70.40922 0 0.1 0 0 0 1 
i 7.870687 286.1731 0.7171673 66 71.61677 0 0.1 0 0 0 1 
i 8.177414 286.1731 1.434335 69 72.11992 0 0.1 0 0 0 1 
i 11.05507 286.1731 1.434335 68 70.10734 0 0.1 0 0 0 1 
i 11.23911 286.1731 1.434335 65 70.40922 0 0.1 0 0 0 1 
i 11.97525 286.1731 0.7171673 78 71.61677 0 0.1 0 0 0 1 
i 12.28198 286.1731 0.7171673 81 72.11992 0 0.1 0 0 0 1 
i 15.15964 286.1731 0.7171673 80 70.10734 0 0.1 0 0 0 1 
i 15.34367 286.1731 0.7171673 77 70.40922 0 0.1 0 0 0 1 
i 16.07982 286.1731 0.7171673 89 71.61677 0 0.1 0 0 0 1 
i 16.38655 286.1731 1.434335 92 72.11992 0 0.1 0 0 0 1 
i 1.061345 286.799 0.5378755 54 70.11539 0 0.1 0 0 0 1 
i 1.490763 286.799 0.5378755 60 70.81979 0 0.1 0 0 0 1 
i 5.165911 286.799 0.5378755 66 70.11539 0 0.1 0 0 0 1 
i 5.595329 286.799 0.5378755 71 70.81979 0 0.1 0 0 0 1 
i 9.270478 286.799 0.5378755 77 70.11539 0 0.1 0 0 0 1 
i 9.699895 286.799 1.075751 83 70.81979 0 0.1 0 0 0 1 
i 13.37504 286.799 0.5378755 89 70.11539 0 0.1 0 0 0 1 
i 13.80446 286.799 0.5378755 94 70.81979 0 0.1 0 0 0 1 
i 3.827466 286.8903 0.7171673 54 71.7174 0 0.1 0 0 0 1 
i 4.011502 286.8903 0.7171673 57 72.01929 0 0.1 0 0 0 1 
i 6.88916 286.8903 0.7171673 56 70.00671 0 0.1 0 0 0 1 
i 7.195887 286.8903 0.7171673 53 70.50985 0 0.1 0 0 0 1 
i 7.932032 286.8903 0.7171673 65 71.7174 0 0.1 0 0 0 1 
i 12.0366 286.8903 0.7171673 77 71.7174 0 0.1 0 0 0 1 
i 12.22063 286.8903 0.7171673 80 72.01929 0 0.1 0 0 0 1 
i 15.09829 286.8903 0.7171673 79 70.00671 0 0.1 0 0 0 1 
i 15.40502 286.8903 0.7171673 76 70.50985 0 0.1 0 0 0 1 
i 16.14116 286.8903 0.7171673 88 71.7174 0 0.1 0 0 0 1 
i 1 287.3368 0.5378755 55 70.01476 0 0.1 0 0 0 1 
i 1.552109 287.3368 0.5378755 60 70.92042 0 0.1 0 0 0 1 
i 5.104566 287.3368 0.5378755 67 70.01476 0 0.1 0 0 0 1 
i 5.656675 287.3368 0.5378755 72 70.92042 0 0.1 0 0 0 1 
i 9.209132 287.3368 0.5378755 78 70.01476 0 0.1 0 0 0 1 
i 13.3137 287.3368 0.5378755 90 70.01476 0 0.1 0 0 0 1 
i 13.86581 287.3368 0.5378755 95 70.92042 0 0.1 0 0 0 1 
i 2.907285 287.7465 0.7171673 45 70.2073 0 0.1 0 0 0 1 
i 3.029976 287.7465 0.7171673 43 70.40855 0 0.1 0 0 0 1 
i 3.766121 287.7465 0.7171673 56 71.6161 0 0.1 0 0 0 1 
i 4.134193 287.7465 0.7171673 58 72.21987 0 0.1 0 0 0 1 
i 7.011851 287.7465 0.7171673 57 70.2073 0 0.1 0 0 0 1 
i 7.134542 287.7465 0.7171673 54 70.40855 0 0.1 0 0 0 1 
i 7.870687 287.7465 0.7171673 67 71.6161 0 0.1 0 0 0 1 
i 8.238759 287.7465 0.7171673 70 72.21987 0 0.1 0 0 0 1 
i 11.11642 287.7465 0.7171673 68 70.2073 0 0.1 0 0 0 1 
i 11.23911 287.7465 0.7171673 66 70.40855 0 0.1 0 0 0 1 
i 11.97525 287.7465 0.7171673 79 71.6161 0 0.1 0 0 0 1 
i 12.34333 287.7465 0.7171673 81 72.21987 0 0.1 0 0 0 1 
i 15.22098 287.7465 0.7171673 80 70.2073 0 0.1 0 0 0 1 
i 15.34367 287.7465 0.7171673 77 70.40855 0 0.1 0 0 0 1 
i 16.07982 287.7465 0.7171673 90 71.6161 0 0.1 0 0 0 1 
i 16.44789 287.7465 0.7171673 93 72.21987 0 0.1 0 0 0 1 
i 1.122691 288.451 0.5378755 54 70.21535 0 0.1 0 0 0 1 
i 1.490763 288.451 0.5378755 60 70.81912 0 0.1 0 0 0 1 
i 5.227257 288.451 0.5378755 66 70.21535 0 0.1 0 0 0 1 
i 5.595329 288.451 0.5378755 71 70.81912 0 0.1 0 0 0 1 
i 9.331823 288.451 0.5378755 77 70.21535 0 0.1 0 0 0 1 
i 9.699895 288.451 0.5378755 83 70.81912 0 0.1 0 0 0 1 
i 13.43639 288.451 0.5378755 89 70.21535 0 0.1 0 0 0 1 
i 13.80446 288.451 0.5378755 94 70.81912 0 0.1 0 0 0 1 
i 2.784594 288.4637 0.7171673 44 70.00604 0 0.1 0 0 0 1 
i 3.152666 288.4637 0.7171673 41 70.60981 0 0.1 0 0 0 1 
i 3.888811 288.4637 0.7171673 54 71.81736 0 0.1 0 0 0 1 
i 4.011502 288.4637 0.7171673 57 72.01862 0 0.1 0 0 0 1 
i 6.88916 288.4637 0.7171673 55 70.00604 0 0.1 0 0 0 1 
i 7.257232 288.4637 0.7171673 53 70.60981 0 0.1 0 0 0 1 
i 7.993377 288.4637 0.7171673 66 71.81736 0 0.1 0 0 0 1 
i 8.116068 288.4637 0.7171673 68 72.01862 0 0.1 0 0 0 1 
i 10.99373 288.4637 0.7171673 67 70.00604 0 0.1 0 0 0 1 
i 11.3618 288.4637 0.7171673 64 70.60981 0 0.1 0 0 0 1 
i 12.09794 288.4637 0.7171673 77 71.81736 0 0.1 0 0 0 1 
i 12.22063 288.4637 0.7171673 80 72.01862 0 0.1 0 0 0 1 
i 15.09829 288.4637 0.7171673 78 70.00604 0 0.1 0 0 0 1 
i 15.46636 288.4637 0.7171673 76 70.60981 0 0.1 0 0 0 1 
i 16.20251 288.4637 0.7171673 89 71.81736 0 0.1 0 0 0 1 
i 16.3252 288.4637 0.7171673 91 72.01862 0 0.1 0 0 0 1 
i 1 288.9889 0.5378755 56 70.01409 0 0.1 0 0 0 1 
i 1.613454 288.9889 0.5378755 61 71.02038 0 0.1 0 0 0 1 
i 5.104566 288.9889 0.5378755 67 70.01409 0 0.1 0 0 0 1 
i 5.71802 288.9889 0.5378755 73 71.02038 0 0.1 0 0 0 1 
i 9.209132 288.9889 0.5378755 79 70.01409 0 0.1 0 0 0 1 
i 9.822586 288.9889 0.5378755 84 71.02038 0 0.1 0 0 0 1 
i 13.3137 288.9889 0.5378755 90 70.01409 0 0.1 0 0 0 1 
i 13.92715 288.9889 0.5378755 96 71.02038 0 0.1 0 0 0 1 
i 2.845939 289.2093 1.434335 43 70.106 0 0.1 0 0 0 1 
i 2.907285 289.2093 1.434335 44 70.20662 0 0.1 0 0 0 1 
i 3.029976 289.2093 0.7171673 42 70.40788 0 0.1 0 0 0 1 
i 3.214012 289.2093 1.434335 41 70.70977 0 0.1 0 0 0 1 
i 3.766121 289.2093 1.434335 56 71.61543 0 0.1 0 0 0 1 
i 3.950157 289.2093 1.434335 55 71.91732 0 0.1 0 0 0 1 
i 4.072848 289.2093 0.7171673 57 72.11857 0 0.1 0 0 0 1 
i 4.134193 289.2093 1.434335 58 72.2192 0 0.1 0 0 0 1 
i 6.950505 289.2093 1.434335 55 70.106 0 0.1 0 0 0 1 
i 7.011851 289.2093 1.434335 56 70.20662 0 0.1 0 0 0 1 
i 7.134542 289.2093 1.434335 53 70.40788 0 0.1 0 0 0 1 
i 7.318578 289.2093 0.7171673 52 70.70977 0 0.1 0 0 0 1 
i 7.870687 289.2093 1.434335 67 71.61543 0 0.1 0 0 0 1 
i 8.054723 289.2093 0.7171673 66 71.91732 0 0.1 0 0 0 1 
i 8.177414 289.2093 1.434335 68 72.11857 0 0.1 0 0 0 1 
i 8.238759 289.2093 1.434335 70 72.2192 0 0.1 0 0 0 1 
i 11.05507 289.2093 1.434335 66 70.106 0 0.1 0 0 0 1 
i 11.11642 289.2093 1.434335 67 70.20662 0 0.1 0 0 0 1 
i 11.23911 289.2093 0.7171673 65 70.40788 0 0.1 0 0 0 1 
i 11.42314 289.2093 1.434335 64 70.70977 0 0.1 0 0 0 1 
i 11.97525 289.2093 1.434335 79 71.61543 0 0.1 0 0 0 1 
i 12.15929 289.2093 1.434335 78 71.91732 0 0.1 0 0 0 1 
i 12.28198 289.2093 0.7171673 80 72.11857 0 0.1 0 0 0 1 
i 12.34333 289.2093 1.434335 81 72.2192 0 0.1 0 0 0 1 
i 15.15964 289.2093 1.434335 78 70.106 0 0.1 0 0 0 1 
i 15.22098 289.2093 1.434335 79 70.20662 0 0.1 0 0 0 1 
i 15.34367 289.2093 1.434335 76 70.40788 0 0.1 0 0 0 1 
i 15.52771 289.2093 0.7171673 75 70.70977 0 0.1 0 0 0 1 
i 16.07982 289.2093 1.434335 90 71.61543 0 0.1 0 0 0 1 
i 16.26386 289.2093 0.7171673 89 71.91732 0 0.1 0 0 0 1 
i 16.38655 289.2093 1.434335 91 72.11857 0 0.1 0 0 0 1 
i 16.44789 289.2093 0.7171673 93 72.2192 0 0.1 0 0 0 1 
i 2.96863 289.9264 0.7171673 45 70.30725 0 0.1 0 0 0 1 
i 4.195539 289.9264 0.7171673 59 72.31983 0 0.1 0 0 0 1 
i 7.195887 289.9264 0.7171673 54 70.50851 0 0.1 0 0 0 1 
i 8.116068 289.9264 0.7171673 69 72.01795 0 0.1 0 0 0 1 
i 11.17776 289.9264 0.7171673 68 70.30725 0 0.1 0 0 0 1 
i 12.40467 289.9264 0.7171673 82 72.31983 0 0.1 0 0 0 1 
i 15.40502 289.9264 0.7171673 77 70.50851 0 0.1 0 0 0 1 
i 16.3252 289.9264 0.7171673 92 72.01795 0 0.1 0 0 0 1 
i 16.50924 289.9264 0.7171673 93 72.31983 0 0.1 0 0 0 1 
i 1.061345 289.9869 0.5378755 56 70.11405 0 0.1 0 0 0 1 
i 1.122691 289.9869 1.075751 55 70.21468 0 0.1 0 0 0 1 
i 1.490763 289.9869 0.5378755 61 70.81845 0 0.1 0 0 0 1 
i 1.6748 289.9869 0.5378755 62 71.12034 0 0.1 0 0 0 1 
i 5.165911 289.9869 1.075751 67 70.11405 0 0.1 0 0 0 1 
i 5.227257 289.9869 1.075751 66 70.21468 0 0.1 0 0 0 1 
i 5.595329 289.9869 1.075751 72 70.81845 0 0.1 0 0 0 1 
i 5.779366 289.9869 0.5378755 74 71.12034 0 0.1 0 0 0 1 
i 9.270478 289.9869 0.5378755 79 70.11405 0 0.1 0 0 0 1 
i 9.331823 289.9869 1.075751 78 70.21468 0 0.1 0 0 0 1 
i 9.699895 289.9869 1.075751 84 70.81845 0 0.1 0 0 0 1 
i 9.883932 289.9869 0.5378755 85 71.12034 0 0.1 0 0 0 1 
i 13.37504 289.9869 1.075751 90 70.11405 0 0.1 0 0 0 1 
i 13.43639 289.9869 1.075751 89 70.21468 0 0.1 0 0 0 1 
i 13.80446 289.9869 1.075751 95 70.81845 0 0.1 0 0 0 1 
i 13.9885 289.9869 0.5378755 97 71.12034 0 0.1 0 0 0 1 
i 1.184036 290.5248 0.5378755 54 70.3153 0 0.1 0 0 0 1 
i 1.552109 290.5248 0.5378755 60 70.91908 0 0.1 0 0 0 1 
i 1.613454 290.5248 0.5378755 61 71.01971 0 0.1 0 0 0 1 
i 5.71802 290.5248 0.5378755 73 71.01971 0 0.1 0 0 0 1 
i 9.393168 290.5248 0.5378755 77 70.3153 0 0.1 0 0 0 1 
i 9.761241 290.5248 0.5378755 83 70.91908 0 0.1 0 0 0 1 
i 13.92715 290.5248 1.437764 96 71.01971 0 0.1 0 0 0 1 
i 3.275357 291.2454 0.7171673 43 70.80973 0 0.1 0 0 0 1 
i 3.766121 291.2454 0.7171673 52 71.61476 0 0.1 0 0 0 1 
i 7.379923 291.2454 0.7171673 54 70.80973 0 0.1 0 0 0 1 
i 7.870687 291.2454 0.7171673 64 71.61476 0 0.1 0 0 0 1 
i 11.48449 291.2454 0.7171673 66 70.80973 0 0.1 0 0 0 1 
i 11.97525 291.2454 0.7171673 75 71.61476 0 0.1 0 0 0 1 
i 15.58906 291.2454 0.7171673 77 70.80973 0 0.1 0 0 0 1 
i 16.07982 291.2454 0.7171673 87 71.61476 0 0.1 0 0 0 1 
i 1.245382 291.7551 0.5378755 55 70.41526 0 0.1 0 0 0 1 
i 1.490763 291.7551 0.5378755 60 70.81778 0 0.1 0 0 0 1 
i 5.349948 291.7551 0.5378755 67 70.41526 0 0.1 0 0 0 1 
i 5.595329 291.7551 0.5378755 71 70.81778 0 0.1 0 0 0 1 
i 9.454514 291.7551 0.5378755 78 70.41526 0 0.1 0 0 0 1 
i 9.699895 291.7551 0.5378755 83 70.81778 0 0.1 0 0 0 1 
i 13.55908 291.7551 0.5378755 90 70.41526 0 0.1 0 0 0 1 
i 13.80446 291.7551 0.5378755 94 70.81778 0 0.1 0 0 0 1 
i 2.784594 291.9625 0.7171673 47 70.0047 0 0.1 0 0 0 1 
i 4.256884 291.9625 0.7171673 57 72.41979 0 0.1 0 0 0 1 
i 6.88916 291.9625 0.7171673 59 70.0047 0 0.1 0 0 0 1 
i 8.36145 291.9625 0.7171673 68 72.41979 0 0.1 0 0 0 1 
i 10.99373 291.9625 0.7171673 70 70.0047 0 0.1 0 0 0 1 
i 12.46602 291.9625 0.7171673 80 72.41979 0 0.1 0 0 0 1 
i 15.09829 291.9625 0.7171673 82 70.0047 0 0.1 0 0 0 1 
i 16.57058 291.9625 0.7171673 91 72.41979 0 0.1 0 0 0 1 
i 1 292.293 0.5378755 58 70.01275 0 0.1 0 0 0 1 
i 1.736145 292.293 0.5378755 62 71.22029 0 0.1 0 0 0 1 
i 5.104566 292.293 0.5378755 69 70.01275 0 0.1 0 0 0 1 
i 5.840711 292.293 0.5378755 73 71.22029 0 0.1 0 0 0 1 
i 9.209132 292.293 0.5378755 81 70.01275 0 0.1 0 0 0 1 
i 9.945277 292.293 0.5378755 85 71.22029 0 0.1 0 0 0 1 
i 13.3137 292.293 0.5378755 92 70.01275 0 0.1 0 0 0 1 
i 14.04984 292.293 0.5378755 96 71.22029 0 0.1 0 0 0 1 
i 2.845939 292.7813 1.434335 48 70.10465 0 0.1 0 0 0 1 
i 3.275357 292.7813 1.434335 42 70.80906 0 0.1 0 0 0 1 
i 3.766121 292.7813 0.7171673 52 71.61409 0 0.1 0 0 0 1 
i 4.318229 292.7813 0.7171673 58 72.51975 0 0.1 0 0 0 1 
i 6.950505 292.7813 0.7171673 60 70.10465 0 0.1 0 0 0 1 
i 7.379923 292.7813 0.7171673 54 70.80906 0 0.1 0 0 0 1 
i 7.870687 292.7813 1.434335 63 71.61409 0 0.1 0 0 0 1 
i 8.422795 292.7813 1.434335 69 72.51975 0 0.1 0 0 0 1 
i 11.05507 292.7813 1.434335 71 70.10465 0 0.1 0 0 0 1 
i 11.48449 292.7813 0.7171673 65 70.80906 0 0.1 0 0 0 1 
i 11.97525 292.7813 0.7171673 75 71.61409 0 0.1 0 0 0 1 
i 12.52736 292.7813 0.7171673 81 72.51975 0 0.1 0 0 0 1 
i 15.15964 292.7813 0.7171673 83 70.10465 0 0.1 0 0 0 1 
i 15.58906 292.7813 0.7171673 77 70.80906 0 0.1 0 0 0 1 
i 16.07982 292.7813 1.434335 86 71.61409 0 0.1 0 0 0 1 
i 16.63193 292.7813 1.434335 92 72.51975 0 0.1 0 0 0 1 
i 1.061345 293.291 1.075751 58 70.1127 0 0.1 0 0 0 1 
i 1.245382 293.291 0.5378755 56 70.41459 0 0.1 0 0 0 1 
i 1.490763 293.291 0.5378755 60 70.81711 0 0.1 0 0 0 1 
i 1.79749 293.291 0.5378755 63 71.32025 0 0.1 0 0 0 1 
i 5.165911 293.291 0.5378755 70 70.1127 0 0.1 0 0 0 1 
i 5.349948 293.291 1.075751 67 70.41459 0 0.1 0 0 0 1 
i 5.595329 293.291 1.075751 71 70.81711 0 0.1 0 0 0 1 
i 5.902056 293.291 1.075751 74 71.32025 0 0.1 0 0 0 1 
i 9.270478 293.291 1.075751 81 70.1127 0 0.1 0 0 0 1 
i 9.454514 293.291 0.5378755 79 70.41459 0 0.1 0 0 0 1 
i 9.699895 293.291 0.5378755 83 70.81711 0 0.1 0 0 0 1 
i 10.00662 293.291 0.5378755 86 71.32025 0 0.1 0 0 0 1 
i 13.37504 293.291 0.5378755 93 70.1127 0 0.1 0 0 0 1 
i 13.55908 293.291 1.075751 90 70.41459 0 0.1 0 0 0 1 
i 13.80446 293.291 1.075751 94 70.81711 0 0.1 0 0 0 1 
i 14.11119 293.291 1.075751 97 71.32025 0 0.1 0 0 0 1 
i 3.827466 293.4985 0.7171673 51 71.71472 0 0.1 0 0 0 1 
i 4.256884 293.4985 0.7171673 57 72.41912 0 0.1 0 0 0 1 
i 6.88916 293.4985 0.7171673 59 70.00403 0 0.1 0 0 0 1 
i 7.441269 293.4985 0.7171673 53 70.90969 0 0.1 0 0 0 1 
i 11.54583 293.4985 0.7171673 65 70.90969 0 0.1 0 0 0 1 
i 12.0366 293.4985 0.7171673 74 71.71472 0 0.1 0 0 0 1 
i 12.46602 293.4985 0.7171673 80 72.41912 0 0.1 0 0 0 1 
i 15.09829 293.4985 0.7171673 82 70.00403 0 0.1 0 0 0 1 
i 15.6504 293.4985 0.7171673 76 70.90969 0 0.1 0 0 0 1 
i 1.306727 293.8289 0.5378755 55 70.51522 0 0.1 0 0 0 1 
i 1.552109 293.8289 0.5378755 59 70.91774 0 0.1 0 0 0 1 
i 1.736145 293.8289 0.5378755 62 71.21962 0 0.1 0 0 0 1 
i 5.104566 293.8289 0.5378755 69 70.01208 0 0.1 0 0 0 1 
i 9.515859 293.8289 0.5378755 78 70.51522 0 0.1 0 0 0 1 
i 9.761241 293.8289 0.5378755 82 70.91774 0 0.1 0 0 0 1 
i 9.945277 293.8289 0.5378755 85 71.21962 0 0.1 0 0 0 1 
i 13.3137 293.8289 0.5378755 92 70.01208 0 0.1 0 0 0 1 
i 2.907285 294.3547 0.9687823 49 70.20461 0 0.1 0 0 0 1 
i 3.275357 294.3547 0.7171673 43 70.80839 0 0.1 0 0 0 1 
i 3.766121 294.3547 0.7171673 52 71.61342 0 0.1 0 0 0 1 
i 4.379575 294.3547 0.7171673 58 72.61971 0 0.1 0 0 0 1 
i 7.011851 294.3547 0.7171673 60 70.20461 0 0.1 0 0 0 1 
i 7.379923 294.3547 0.7171673 54 70.80839 0 0.1 0 0 0 1 
i 7.870687 294.3547 0.7171673 64 71.61342 0 0.1 0 0 0 1 
i 8.484141 294.3547 0.7171673 70 72.61971 0 0.1 0 0 0 1 
i 11.11642 294.3547 0.9687823 72 70.20461 0 0.1 0 0 0 1 
i 11.48449 294.3547 0.7171673 66 70.80839 0 0.1 0 0 0 1 
i 11.97525 294.3547 0.7171673 75 71.61342 0 0.1 0 0 0 1 
i 12.58871 294.3547 0.7171673 81 72.61971 0 0.1 0 0 0 1 
i 15.22098 294.3547 0.7171673 83 70.20461 0 0.1 0 0 0 1 
i 15.58906 294.3547 0.7171673 77 70.80839 0 0.1 0 0 0 1 
i 16.07982 294.3547 0.7171673 87 71.61342 0 0.1 0 0 0 1 
i 16.69327 294.3547 0.7171673 93 72.61971 0 0.1 0 0 0 1 
i 6.88916 294.7856 0.5378755 61 70.0208 0 0.1 0 0 0 1 
i 15.09829 294.7856 0.5378755 84 70.0208 0 0.1 0 0 0 1 
i 1.122691 294.8644 0.5378755 59 70.21266 0 0.1 0 0 0 1 
i 1.245382 294.8644 0.5378755 57 70.41392 0 0.1 0 0 0 1 
i 1.490763 294.8644 0.5378755 61 70.81644 0 0.1 0 0 0 1 
i 1.858836 294.8644 0.5378755 63 71.42021 0 0.1 0 0 0 1 
i 5.227257 294.8644 0.5378755 70 70.21266 0 0.1 0 0 0 1 
i 5.349948 294.8644 0.5378755 68 70.41392 0 0.1 0 0 0 1 
i 5.595329 294.8644 0.5378755 72 70.81644 0 0.1 0 0 0 1 
i 5.963402 294.8644 0.5378755 75 71.42021 0 0.1 0 0 0 1 
i 9.331823 294.8644 0.5378755 82 70.21266 0 0.1 0 0 0 1 
i 9.454514 294.8644 0.5378755 80 70.41392 0 0.1 0 0 0 1 
i 9.699895 294.8644 0.5378755 84 70.81644 0 0.1 0 0 0 1 
i 10.06797 294.8644 0.5378755 86 71.42021 0 0.1 0 0 0 1 
i 13.43639 294.8644 0.5378755 93 70.21266 0 0.1 0 0 0 1 
i 13.55908 294.8644 0.5378755 91 70.41392 0 0.1 0 0 0 1 
i 13.80446 294.8644 0.5378755 95 70.81644 0 0.1 0 0 0 1 
i 14.17253 294.8644 0.5378755 98 71.42021 0 0.1 0 0 0 1 
i 2.784594 295.0718 0.7171673 47 70.00335 0 0.1 0 0 0 1 
i 3.398048 295.0718 0.7171673 41 71.00964 0 0.1 0 0 0 1 
i 3.888811 295.0718 0.7171673 51 71.81468 0 0.1 0 0 0 1 
i 4.256884 295.0718 0.7171673 57 72.41845 0 0.1 0 0 0 1 
i 6.88916 295.0718 0.7171673 59 70.00335 0 0.1 0 0 0 1 
i 7.502614 295.0718 0.7171673 53 71.00964 0 0.1 0 0 0 1 
i 7.993377 295.0718 0.7171673 62 71.81468 0 0.1 0 0 0 1 
i 8.36145 295.0718 0.7171673 68 72.41845 0 0.1 0 0 0 1 
i 10.99373 295.0718 0.7171673 70 70.00335 0 0.1 0 0 0 1 
i 11.60718 295.0718 0.7171673 64 71.00964 0 0.1 0 0 0 1 
i 12.09794 295.0718 0.7171673 74 71.81468 0 0.1 0 0 0 1 
i 12.46602 295.0718 0.7171673 80 72.41845 0 0.1 0 0 0 1 
i 15.09829 295.0718 0.7171673 82 70.00335 0 0.1 0 0 0 1 
i 15.71175 295.0718 0.7171673 76 71.00964 0 0.1 0 0 0 1 
i 16.20251 295.0718 0.7171673 85 71.81468 0 0.1 0 0 0 1 
i 16.57058 295.0718 0.7171673 91 72.41845 0 0.1 0 0 0 1 
i 1 295.4022 0.5378755 58 70.0114 0 0.1 0 0 0 1 
i 1.368072 295.4022 0.5378755 55 70.61518 0 0.1 0 0 0 1 
i 1.613454 295.4022 0.5378755 60 71.01769 0 0.1 0 0 0 1 
i 1.736145 295.4022 0.5378755 62 71.21895 0 0.1 0 0 0 1 
i 5.104566 295.4022 0.5378755 69 70.0114 0 0.1 0 0 0 1 
i 5.472639 295.4022 0.5378755 67 70.61518 0 0.1 0 0 0 1 
i 5.71802 295.4022 0.5378755 71 71.01769 0 0.1 0 0 0 1 
i 5.840711 295.4022 0.5378755 73 71.21895 0 0.1 0 0 0 1 
i 9.209132 295.4022 0.5378755 81 70.0114 0 0.1 0 0 0 1 
i 9.577205 295.4022 0.5378755 78 70.61518 0 0.1 0 0 0 1 
i 9.822586 295.4022 0.5378755 83 71.01769 0 0.1 0 0 0 1 
i 9.945277 295.4022 0.5378755 85 71.21895 0 0.1 0 0 0 1 
i 13.3137 295.4022 0.5378755 92 70.0114 0 0.1 0 0 0 1 
i 13.68177 295.4022 0.5378755 90 70.61518 0 0.1 0 0 0 1 
i 13.92715 295.4022 0.5378755 94 71.01769 0 0.1 0 0 0 1 
i 14.04984 295.4022 0.5378755 96 71.21895 0 0.1 0 0 0 1 
i 2.845939 295.8174 0.7171673 47 70.10331 0 0.1 0 0 0 1 
i 2.907285 295.8174 1.434335 49 70.20394 0 0.1 0 0 0 1 
i 3.275357 295.8174 0.7171673 42 70.80771 0 0.1 0 0 0 1 
i 3.459394 295.8174 1.434335 41 71.1096 0 0.1 0 0 0 1 
i 3.766121 295.8174 1.434335 51 71.61275 0 0.1 0 0 0 1 
i 3.950157 295.8174 0.7171673 50 71.91463 0 0.1 0 0 0 1 
i 4.318229 295.8174 0.7171673 57 72.51841 0 0.1 0 0 0 1 
i 4.379575 295.8174 1.434335 58 72.61904 0 0.1 0 0 0 1 
i 6.950505 295.8174 0.7171673 59 70.10331 0 0.1 0 0 0 1 
i 7.011851 295.8174 1.434335 60 70.20394 0 0.1 0 0 0 1 
i 7.379923 295.8174 0.7171673 53 70.80771 0 0.1 0 0 0 1 
i 7.56396 295.8174 0.7171673 52 71.1096 0 0.1 0 0 0 1 
i 7.870687 295.8174 1.434335 63 71.61275 0 0.1 0 0 0 1 
i 8.054723 295.8174 1.434335 62 71.91463 0 0.1 0 0 0 1 
i 8.422795 295.8174 0.7171673 68 72.51841 0 0.1 0 0 0 1 
i 8.484141 295.8174 0.7171673 70 72.61904 0 0.1 0 0 0 1 
i 11.05507 295.8174 0.7171673 70 70.10331 0 0.1 0 0 0 1 
i 11.11642 295.8174 1.434335 72 70.20394 0 0.1 0 0 0 1 
i 11.48449 295.8174 0.7171673 65 70.80771 0 0.1 0 0 0 1 
i 11.66853 295.8174 1.434335 64 71.1096 0 0.1 0 0 0 1 
i 11.97525 295.8174 1.434335 74 71.61275 0 0.1 0 0 0 1 
i 12.15929 295.8174 0.7171673 73 71.91463 0 0.1 0 0 0 1 
i 12.52736 295.8174 0.7171673 80 72.51841 0 0.1 0 0 0 1 
i 12.58871 295.8174 0.7171673 81 72.61904 0 0.1 0 0 0 1 
i 15.15964 295.8174 0.7171673 82 70.10331 0 0.1 0 0 0 1 
i 15.22098 295.8174 1.434335 83 70.20394 0 0.1 0 0 0 1 
i 15.58906 295.8174 1.434335 76 70.80771 0 0.1 0 0 0 1 
i 15.77309 295.8174 0.7171673 75 71.1096 0 0.1 0 0 0 1 
i 16.07982 295.8174 1.434335 86 71.61275 0 0.1 0 0 0 1 
i 16.26386 295.8174 1.434335 85 71.91463 0 0.1 0 0 0 1 
i 16.63193 295.8174 0.7171673 91 72.51841 0 0.1 0 0 0 1 
i 16.69327 295.8174 1.434335 93 72.61904 0 0.1 0 0 0 1 
i 2.845939 295.941 0.5378755 44 70.12075 0 0.1 0 0 0 1 
i 6.950505 295.941 1.075751 56 70.12075 0 0.1 0 0 0 1 
i 11.05507 295.941 0.5378755 67 70.12075 0 0.1 0 0 0 1 
i 15.15964 295.941 1.075751 79 70.12075 0 0.1 0 0 0 1 
i 1.061345 296.3271 1.075751 58 70.11136 0 0.1 0 0 0 1 
i 1.122691 296.3271 1.075751 59 70.21199 0 0.1 0 0 0 1 
i 1.245382 296.3271 1.075751 57 70.41325 0 0.1 0 0 0 1 
i 1.429418 296.3271 1.075751 56 70.71514 0 0.1 0 0 0 1 
i 1.490763 296.3271 0.5378755 61 70.81577 0 0.1 0 0 0 1 
i 1.6748 296.3271 1.075751 60 71.11765 0 0.1 0 0 0 1 
i 1.79749 296.3271 1.075751 62 71.31891 0 0.1 0 0 0 1 
i 1.858836 296.3271 0.5378755 63 71.41954 0 0.1 0 0 0 1 
i 5.165911 296.3271 1.075751 69 70.11136 0 0.1 0 0 0 1 
i 5.227257 296.3271 1.075751 70 70.21199 0 0.1 0 0 0 1 
i 5.349948 296.3271 1.075751 68 70.41325 0 0.1 0 0 0 1 
i 5.533984 296.3271 0.5378755 67 70.71514 0 0.1 0 0 0 1 
i 5.595329 296.3271 1.075751 72 70.81577 0 0.1 0 0 0 1 
i 5.779366 296.3271 0.5378755 71 71.11765 0 0.1 0 0 0 1 
i 5.902056 296.3271 1.075751 73 71.31891 0 0.1 0 0 0 1 
i 5.963402 296.3271 1.075751 75 71.41954 0 0.1 0 0 0 1 
i 9.270478 296.3271 1.075751 81 70.11136 0 0.1 0 0 0 1 
i 9.331823 296.3271 1.075751 82 70.21199 0 0.1 0 0 0 1 
i 9.454514 296.3271 0.5378755 80 70.41325 0 0.1 0 0 0 1 
i 9.63855 296.3271 1.075751 79 70.71514 0 0.1 0 0 0 1 
i 9.699895 296.3271 1.075751 84 70.81577 0 0.1 0 0 0 1 
i 9.883932 296.3271 1.075751 83 71.11765 0 0.1 0 0 0 1 
i 10.00662 296.3271 1.075751 85 71.31891 0 0.1 0 0 0 1 
i 10.06797 296.3271 0.5378755 86 71.41954 0 0.1 0 0 0 1 
i 13.37504 296.3271 0.5378755 92 70.11136 0 0.1 0 0 0 1 
i 13.43639 296.3271 1.075751 93 70.21199 0 0.1 0 0 0 1 
i 13.55908 296.3271 1.075751 91 70.41325 0 0.1 0 0 0 1 
i 13.74312 296.3271 0.5378755 90 70.71514 0 0.1 0 0 0 1 
i 13.80446 296.3271 1.075751 95 70.81577 0 0.1 0 0 0 1 
i 13.9885 296.3271 0.5378755 94 71.11765 0 0.1 0 0 0 1 
i 14.11119 296.3271 1.075751 96 71.31891 0 0.1 0 0 0 1 
i 14.17253 296.3271 1.075751 98 71.41954 0 0.1 0 0 0 1 
i 2.784594 296.4789 0.5378755 45 70.02013 0 0.1 0 0 0 1 
i 10.99373 296.4789 0.5378755 68 70.02013 0 0.1 0 0 0 1 
i 2.784594 296.5346 0.7171673 48 70.00268 0 0.1 0 0 0 1 
i 3.336703 296.5346 0.7171673 43 70.90834 0 0.1 0 0 0 1 
i 3.827466 296.5346 0.7171673 52 71.71338 0 0.1 0 0 0 1 
i 4.44092 296.5346 0.7171673 59 72.71966 0 0.1 0 0 0 1 
i 7.073196 296.5346 0.7171673 61 70.30457 0 0.1 0 0 0 1 
i 7.441269 296.5346 0.7171673 54 70.90834 0 0.1 0 0 0 1 
i 7.502614 296.5346 0.7171673 53 71.00897 0 0.1 0 0 0 1 
i 8.36145 296.5346 0.7171673 69 72.41778 0 0.1 0 0 0 1 
i 8.545486 296.5346 0.7171673 70 72.71966 0 0.1 0 0 0 1 
i 10.99373 296.5346 0.7171673 71 70.00268 0 0.1 0 0 0 1 
i 11.54583 296.5346 0.7171673 66 70.90834 0 0.1 0 0 0 1 
i 12.0366 296.5346 0.7171673 75 71.71338 0 0.1 0 0 0 1 
i 12.46602 296.5346 0.7171673 80 72.41778 0 0.1 0 0 0 1 
i 12.65005 296.5346 0.7171673 82 72.71966 0 0.1 0 0 0 1 
i 15.28233 296.5346 0.7171673 84 70.30457 0 0.1 0 0 0 1 
i 15.6504 296.5346 0.7171673 77 70.90834 0 0.1 0 0 0 1 
i 16.57058 296.5346 0.7171673 92 72.41778 0 0.1 0 0 0 1 
i 1.552109 296.865 0.5378755 61 70.91639 0 0.1 0 0 0 1 
i 1.920181 296.865 0.5378755 64 71.52017 0 0.1 0 0 0 1 
i 5.288602 296.865 0.5378755 71 70.31262 0 0.1 0 0 0 1 
i 5.840711 296.865 0.5378755 74 71.21828 0 0.1 0 0 0 1 
i 9.515859 296.865 0.5378755 80 70.51388 0 0.1 0 0 0 1 
i 10.12931 296.865 0.5378755 87 71.52017 0 0.1 0 0 0 1 
i 13.49773 296.865 0.5378755 94 70.31262 0 0.1 0 0 0 1 
i 13.62043 296.865 0.5378755 92 70.51388 0 0.1 0 0 0 1 
i 14.04984 296.865 1.353566 97 71.21828 0 0.1 0 0 0 1 
i 3.029976 297.5014 0.7171673 49 70.40453 0 0.1 0 0 0 1 
i 3.275357 297.5014 0.7171673 44 70.80704 0 0.1 0 0 0 1 
i 3.766121 297.5014 0.7171673 53 71.61208 0 0.1 0 0 0 1 
i 4.502266 297.5014 0.7171673 58 72.81962 0 0.1 0 0 0 1 
i 7.134542 297.5014 0.7171673 60 70.40453 0 0.1 0 0 0 1 
i 7.379923 297.5014 0.7171673 55 70.80704 0 0.1 0 0 0 1 
i 7.870687 297.5014 0.7171673 65 71.61208 0 0.1 0 0 0 1 
i 8.606832 297.5014 0.7171673 70 72.81962 0 0.1 0 0 0 1 
i 11.23911 297.5014 0.7171673 72 70.40453 0 0.1 0 0 0 1 
i 11.48449 297.5014 0.7171673 67 70.80704 0 0.1 0 0 0 1 
i 11.97525 297.5014 0.7171673 76 71.61208 0 0.1 0 0 0 1 
i 12.7114 297.5014 0.7171673 81 72.81962 0 0.1 0 0 0 1 
i 15.34367 297.5014 0.7171673 83 70.40453 0 0.1 0 0 0 1 
i 15.58906 297.5014 0.7171673 78 70.80704 0 0.1 0 0 0 1 
i 16.07982 297.5014 0.7171673 88 71.61208 0 0.1 0 0 0 1 
i 16.81596 297.5014 0.7171673 93 72.81962 0 0.1 0 0 0 1 
i 2.907285 297.6757 0.5378755 46 70.22071 0 0.1 0 0 0 1 
i 7.011851 297.6757 1.260063 58 70.22071 0 0.1 0 0 0 1 
i 11.11642 297.6757 0.5378755 69 70.22071 0 0.1 0 0 0 1 
i 15.22098 297.6757 1.260063 81 70.22071 0 0.1 0 0 0 1 
i 2.784594 298.2136 0.5378755 47 70.01945 0 0.1 0 0 0 1 
i 10.99373 298.2136 0.5378755 70 70.01945 0 0.1 0 0 0 1 
i 2.784594 298.2186 0.7171673 46 70.00201 0 0.1 0 0 0 1 
i 3.520739 298.2186 0.7171673 41 71.20956 0 0.1 0 0 0 1 
i 4.011502 298.2186 0.7171673 51 72.01459 0 0.1 0 0 0 1 
i 4.256884 298.2186 0.7171673 55 72.41711 0 0.1 0 0 0 1 
i 7.625305 298.2186 0.7171673 53 71.20956 0 0.1 0 0 0 1 
i 8.116068 298.2186 0.7171673 62 72.01459 0 0.1 0 0 0 1 
i 8.36145 298.2186 0.7171673 67 72.41711 0 0.1 0 0 0 1 
i 10.99373 298.2186 0.7171673 69 70.00201 0 0.1 0 0 0 1 
i 11.72987 298.2186 0.7171673 64 71.20956 0 0.1 0 0 0 1 
i 12.22063 298.2186 0.7171673 74 72.01459 0 0.1 0 0 0 1 
i 12.46602 298.2186 0.7171673 78 72.41711 0 0.1 0 0 0 1 
i 15.83444 298.2186 0.7171673 76 71.20956 0 0.1 0 0 0 1 
i 16.3252 298.2186 0.7171673 85 72.01459 0 0.1 0 0 0 1 
i 16.57058 298.2186 2.179941 90 72.41711 0 0.1 0 0 0 1 
i 2.845939 298.9642 1.434335 45 70.10197 0 0.1 0 0 0 1 
i 3.029976 298.9642 1.434335 49 70.40386 0 0.1 0 0 0 1 
i 3.275357 298.9642 0.7171673 44 70.80637 0 0.1 0 0 0 1 
i 3.582084 298.9642 1.434335 41 71.30952 0 0.1 0 0 0 1 
i 3.766121 298.9642 0.7171673 53 71.6114 0 0.1 0 0 0 1 
i 4.072848 298.9642 0.7171673 50 72.11455 0 0.1 0 0 0 1 
i 4.318229 298.9642 1.434335 55 72.51706 0 0.1 0 0 0 1 
i 4.502266 298.9642 0.7171673 58 72.81895 0 0.1 0 0 0 1 
i 6.950505 298.9642 0.7171673 57 70.10197 0 0.1 0 0 0 1 
i 7.134542 298.9642 0.7171673 60 70.40386 0 0.1 0 0 0 1 
i 7.379923 298.9642 0.7171673 55 70.80637 0 0.1 0 0 0 1 
i 7.68665 298.9642 0.7171673 52 71.30952 0 0.1 0 0 0 1 
i 7.870687 298.9642 1.434335 65 71.6114 0 0.1 0 0 0 1 
i 8.177414 298.9642 1.434335 62 72.11455 0 0.1 0 0 0 1 
i 8.422795 298.9642 0.7171673 66 72.51706 0 0.1 0 0 0 1 
i 8.606832 298.9642 1.434335 70 72.81895 0 0.1 0 0 0 1 
i 11.05507 298.9642 0.7171673 68 70.10197 0 0.1 0 0 0 1 
i 11.23911 298.9642 1.434335 72 70.40386 0 0.1 0 0 0 1 
i 11.48449 298.9642 0.7171673 67 70.80637 0 0.1 0 0 0 1 
i 11.79122 298.9642 1.434335 64 71.30952 0 0.1 0 0 0 1 
i 11.97525 298.9642 0.7171673 76 71.6114 0 0.1 0 0 0 1 
i 12.28198 298.9642 0.7171673 73 72.11455 0 0.1 0 0 0 1 
i 12.52736 298.9642 0.7171673 78 72.51706 0 0.1 0 0 0 1 
i 12.7114 298.9642 0.7171673 81 72.81895 0 0.1 0 0 0 1 
i 15.15964 298.9642 0.7171673 80 70.10197 0 0.1 0 0 0 1 
i 15.34367 298.9642 0.7171673 83 70.40386 0 0.1 0 0 0 1 
i 15.58906 298.9642 0.7171673 78 70.80637 0 0.1 0 0 0 1 
i 15.89578 298.9642 0.7171673 75 71.30952 0 0.1 0 0 0 1 
i 16.07982 298.9642 1.434335 88 71.6114 0 0.1 0 0 0 1 
i 16.38655 298.9642 1.434335 85 72.11455 0 0.1 0 0 0 1 
i 16.63193 298.9642 0.7171673 89 72.51706 0 0.1 0 0 0 1 
i 16.81596 298.9642 1.434335 93 72.81895 0 0.1 0 0 0 1 
i 1.981527 299.0634 0.5378755 59 71.62013 0 0.1 0 0 0 1 
i 6.086093 299.0634 0.5378755 71 71.62013 0 0.1 0 0 0 1 
i 10.19066 299.0634 0.5378755 82 71.62013 0 0.1 0 0 0 1 
i 14.29522 299.0634 0.5378755 94 71.62013 0 0.1 0 0 0 1 
i 2.845939 299.2884 0.5378755 53 70.11941 0 0.1 0 0 0 1 
i 2.907285 299.2884 0.5378755 55 70.22004 0 0.1 0 0 0 1 
i 6.950505 299.2884 0.5378755 65 70.11941 0 0.1 0 0 0 1 
i 7.011851 299.2884 1.075751 66 70.22004 0 0.1 0 0 0 1 
i 11.05507 299.2884 0.5378755 76 70.11941 0 0.1 0 0 0 1 
i 11.11642 299.2884 0.5378755 78 70.22004 0 0.1 0 0 0 1 
i 15.15964 299.2884 0.5378755 88 70.11941 0 0.1 0 0 0 1 
i 15.22098 299.2884 1.075751 89 70.22004 0 0.1 0 0 0 1 
i 1 299.6013 0.5378755 52 70.01006 0 0.1 0 0 0 1 
i 5.104566 299.6013 0.5378755 63 70.01006 0 0.1 0 0 0 1 
i 9.209132 299.6013 0.5378755 75 70.01006 0 0.1 0 0 0 1 
i 13.3137 299.6013 0.5378755 86 70.01006 0 0.1 0 0 0 1 
i 2.784594 299.6814 0.7171673 46 70.00134 0 0.1 0 0 0 1 
i 3.827466 299.6814 0.7171673 54 71.71203 0 0.1 0 0 0 1 
i 4.011502 299.6814 0.7171673 51 72.01392 0 0.1 0 0 0 1 
i 4.563611 299.6814 0.7171673 59 72.91958 0 0.1 0 0 0 1 
i 6.88916 299.6814 0.7171673 58 70.00134 0 0.1 0 0 0 1 
i 7.195887 299.6814 0.7171673 61 70.50449 0 0.1 0 0 0 1 
i 7.441269 299.6814 0.7171673 56 70.907 0 0.1 0 0 0 1 
i 7.625305 299.6814 0.7171673 53 71.20889 0 0.1 0 0 0 1 
i 8.36145 299.6814 0.7171673 67 72.41644 0 0.1 0 0 0 1 
i 10.99373 299.6814 0.7171673 69 70.00134 0 0.1 0 0 0 1 
i 11.54583 299.6814 0.7171673 68 70.907 0 0.1 0 0 0 1 
i 12.0366 299.6814 0.7171673 77 71.71203 0 0.1 0 0 0 1 
i 12.22063 299.6814 0.7171673 74 72.01392 0 0.1 0 0 0 1 
i 12.46602 299.6814 0.7171673 78 72.41644 0 0.1 0 0 0 1 
i 12.77274 299.6814 0.7171673 82 72.91958 0 0.1 0 0 0 1 
i 15.09829 299.6814 0.7171673 81 70.00134 0 0.1 0 0 0 1 
i 15.40502 299.6814 0.7171673 84 70.50449 0 0.1 0 0 0 1 
i 15.6504 299.6814 0.7171673 79 70.907 0 0.1 0 0 0 1 
i 15.83444 299.6814 0.7171673 76 71.20889 0 0.1 0 0 0 1 
i 2.784594 299.8263 0.5378755 54 70.01878 0 0.1 0 0 0 1 
i 2.96863 299.8263 0.5378755 56 70.32067 0 0.1 0 0 0 1 
i 7.073196 299.8263 0.5378755 67 70.32067 0 0.1 0 0 0 1 
i 10.99373 299.8263 0.5378755 77 70.01878 0 0.1 0 0 0 1 
i 11.17776 299.8263 0.5378755 79 70.32067 0 0.1 0 0 0 1 
i 15.28233 299.8263 3.463823 90 70.32067 0 0.1 0 0 0 1 
i 2.907285 300.4626 2.827453 45 70.20193 0 0.1 0 0 0 1 
i 3.029976 300.4626 0.7171673 48 70.40319 0 0.1 0 0 0 1 
i 3.275357 300.4626 0.7171673 43 70.8057 0 0.1 0 0 0 1 
i 3.64343 300.4626 0.7171673 41 71.40948 0 0.1 0 0 0 1 
i 3.766121 300.4626 0.7171673 53 71.61073 0 0.1 0 0 0 1 
i 4.134193 300.4626 0.7171673 50 72.21451 0 0.1 0 0 0 1 
i 4.379575 300.4626 0.7171673 55 72.61702 0 0.1 0 0 0 1 
i 4.502266 300.4626 0.7171673 57 72.81828 0 0.1 0 0 0 1 
i 7.011851 300.4626 0.7171673 57 70.20193 0 0.1 0 0 0 1 
i 7.134542 300.4626 0.7171673 59 70.40319 0 0.1 0 0 0 1 
i 7.379923 300.4626 0.7171673 55 70.8057 0 0.1 0 0 0 1 
i 7.747996 300.4626 0.7171673 52 71.40948 0 0.1 0 0 0 1 
i 7.870687 300.4626 0.7171673 64 71.61073 0 0.1 0 0 0 1 
i 8.238759 300.4626 0.7171673 62 72.21451 0 0.1 0 0 0 1 
i 8.484141 300.4626 0.7171673 66 72.61702 0 0.1 0 0 0 1 
i 8.606832 300.4626 0.7171673 69 72.81828 0 0.1 0 0 0 1 
i 11.11642 300.4626 0.7171673 68 70.20193 0 0.1 0 0 0 1 
i 11.23911 300.4626 0.7171673 71 70.40319 0 0.1 0 0 0 1 
i 11.48449 300.4626 0.7171673 66 70.8057 0 0.1 0 0 0 1 
i 11.85256 300.4626 0.7171673 64 71.40948 0 0.1 0 0 0 1 
i 11.97525 300.4626 0.7171673 76 71.61073 0 0.1 0 0 0 1 
i 12.34333 300.4626 0.7171673 73 72.21451 0 0.1 0 0 0 1 
i 12.58871 300.4626 0.7171673 78 72.61702 0 0.1 0 0 0 1 
i 12.7114 300.4626 0.7171673 80 72.81828 0 0.1 0 0 0 1 
i 15.22098 300.4626 0.7171673 80 70.20193 0 0.1 0 0 0 1 
i 15.34367 300.4626 0.7171673 82 70.40319 0 0.1 0 0 0 1 
i 15.58906 300.4626 0.7171673 78 70.8057 0 0.1 0 0 0 1 
i 15.95713 300.4626 0.7171673 75 71.40948 0 0.1 0 0 0 1 
i 16.07982 300.4626 0.7171673 87 71.61073 0 0.1 0 0 0 1 
i 16.44789 300.4626 0.7171673 85 72.21451 0 0.1 0 0 0 1 
i 16.69327 300.4626 0.7171673 89 72.61702 0 0.1 0 0 0 1 
i 16.81596 300.4626 0.7171673 92 72.81828 0 0.1 0 0 0 1 
i 1.061345 300.6761 0.5378755 50 70.11002 0 0.1 0 0 0 1 
i 1.981527 300.6761 1.075751 60 71.61945 0 0.1 0 0 0 1 
i 5.165911 300.6761 1.075751 62 70.11002 0 0.1 0 0 0 1 
i 6.086093 300.6761 0.5378755 71 71.61945 0 0.1 0 0 0 1 
i 9.270478 300.6761 0.5378755 73 70.11002 0 0.1 0 0 0 1 
i 10.19066 300.6761 1.075751 83 71.61945 0 0.1 0 0 0 1 
i 13.37504 300.6761 1.075751 85 70.11002 0 0.1 0 0 0 1 
i 14.29522 300.6761 0.5378755 94 71.61945 0 0.1 0 0 0 1 
i 3.029976 301.145 0.5378755 36 70.42063 0 0.1 0 0 0 1 
i 7.134542 301.145 0.5378755 47 70.42063 0 0.1 0 0 0 1 
i 11.23911 301.145 0.5378755 59 70.42063 0 0.1 0 0 0 1 
i 15.34367 301.145 0.5378755 70 70.42063 0 0.1 0 0 0 1 
i 2.784594 301.1798 1.393118 47 70.00067 0 0.1 0 0 0 1 
i 3.152666 301.1798 2.110286 49 70.60444 0 0.1 0 0 0 1 
i 3.520739 301.1798 2.110286 42 71.20822 0 0.1 0 0 0 1 
i 3.888811 301.1798 2.110286 54 71.81199 0 0.1 0 0 0 1 
i 4.011502 301.1798 2.110286 52 72.01325 0 0.1 0 0 0 1 
i 4.256884 301.1798 2.110286 56 72.41577 0 0.1 0 0 0 1 
i 4.624956 301.1798 1.393118 59 73.01954 0 0.1 0 0 0 1 
i 6.88916 301.1798 0.7171673 58 70.00067 0 0.1 0 0 0 1 
i 7.257232 301.1798 1.393118 61 70.60444 0 0.1 0 0 0 1 
i 7.502614 301.1798 2.110286 56 71.00696 0 0.1 0 0 0 1 
i 7.625305 301.1798 1.393118 54 71.20822 0 0.1 0 0 0 1 
i 7.993377 301.1798 0.7171673 65 71.81199 0 0.1 0 0 0 1 
i 8.116068 301.1798 2.110286 63 72.01325 0 0.1 0 0 0 1 
i 8.36145 301.1798 1.393118 68 72.41577 0 0.1 0 0 0 1 
i 8.729522 301.1798 2.110286 70 73.01954 0 0.1 0 0 0 1 
i 10.99373 301.1798 1.393118 70 70.00067 0 0.1 0 0 0 1 
i 11.3618 301.1798 2.110286 72 70.60444 0 0.1 0 0 0 1 
i 11.60718 301.1798 1.393118 68 71.00696 0 0.1 0 0 0 1 
i 11.72987 301.1798 2.110286 65 71.20822 0 0.1 0 0 0 1 
i 12.09794 301.1798 2.110286 77 71.81199 0 0.1 0 0 0 1 
i 12.22063 301.1798 2.110286 75 72.01325 0 0.1 0 0 0 1 
i 12.46602 301.1798 0.7171673 79 72.41577 0 0.1 0 0 0 1 
i 12.83409 301.1798 1.393118 82 73.01954 0 0.1 0 0 0 1 
i 15.09829 301.1798 0.7171673 81 70.00067 0 0.1 0 0 0 1 
i 15.46636 301.1798 0.7171673 84 70.60444 0 0.1 0 0 0 1 
i 15.71175 301.1798 2.110286 79 71.00696 0 0.1 0 0 0 1 
i 15.83444 301.1798 2.110286 77 71.20822 0 0.1 0 0 0 1 
i 16.20251 301.1798 0.7171673 88 71.81199 0 0.1 0 0 0 1 
i 16.3252 301.1798 2.110286 86 72.01325 0 0.1 0 0 0 1 
i 16.57058 301.1798 1.393118 91 72.41577 0 0.1 0 0 0 1 
i 16.93865 301.1798 2.110286 93 73.01954 0 0.1 0 0 0 1 
i 1 301.214 0.5378755 51 70.00939 0 0.1 0 0 0 1 
i 6.147438 301.214 0.5378755 72 71.72008 0 0.1 0 0 0 1 
i 9.209132 301.214 0.5378755 74 70.00939 0 0.1 0 0 0 1 
i 14.35657 301.214 0.5378755 95 71.72008 0 0.1 0 0 0 1 
i 2.784594 301.6829 0.5378755 41 70.01811 0 0.1 0 0 0 1 
i 6.88916 301.6829 0.5378755 52 70.01811 0 0.1 0 0 0 1 
i 10.99373 301.6829 0.5378755 64 70.01811 0 0.1 0 0 0 1 
i 15.09829 301.6829 0.5378755 75 70.01811 0 0.1 0 0 0 1 
i 2.907285 301.8558 1.434335 46 70.20126 0 0.1 0 0 0 1 
i 3.029976 301.8558 1.434335 48 70.40252 0 0.1 0 0 0 1 
i 3.275357 301.8558 1.434335 44 70.80503 0 0.1 0 0 0 1 
i 3.64343 301.8558 1.434335 41 71.40881 0 0.1 0 0 0 1 
i 3.766121 301.8558 0.7171673 53 71.61006 0 0.1 0 0 0 1 
i 4.134193 301.8558 1.434335 51 72.21384 0 0.1 0 0 0 1 
i 4.379575 301.8558 1.434335 55 72.61635 0 0.1 0 0 0 1 
i 4.502266 301.8558 1.434335 58 72.81761 0 0.1 0 0 0 1 
i 6.950505 301.8558 1.434335 59 70.10063 0 0.1 0 0 0 1 
i 7.011851 301.8558 1.434335 57 70.20126 0 0.1 0 0 0 1 
i 7.134542 301.8558 1.434335 60 70.40252 0 0.1 0 0 0 1 
i 7.379923 301.8558 0.7171673 55 70.80503 0 0.1 0 0 0 1 
i 7.747996 301.8558 1.434335 53 71.40881 0 0.1 0 0 0 1 
i 7.870687 301.8558 1.434335 64 71.61006 0 0.1 0 0 0 1 
i 8.054723 301.8558 0.7171673 66 71.91195 0 0.1 0 0 0 1 
i 8.238759 301.8558 1.434335 62 72.21384 0 0.1 0 0 0 1 
i 8.484141 301.8558 1.434335 67 72.61635 0 0.1 0 0 0 1 
i 8.606832 301.8558 1.434335 69 72.81761 0 0.1 0 0 0 1 
i 11.11642 301.8558 1.434335 69 70.20126 0 0.1 0 0 0 1 
i 11.23911 301.8558 1.434335 71 70.40252 0 0.1 0 0 0 1 
i 11.48449 301.8558 0.7171673 67 70.80503 0 0.1 0 0 0 1 
i 11.85256 301.8558 1.434335 64 71.40881 0 0.1 0 0 0 1 
i 11.97525 301.8558 0.7171673 76 71.61006 0 0.1 0 0 0 1 
i 12.34333 301.8558 1.434335 74 72.21384 0 0.1 0 0 0 1 
i 12.52736 301.8558 0.7171673 79 72.51572 0 0.1 0 0 0 1 
i 12.58871 301.8558 1.434335 78 72.61635 0 0.1 0 0 0 1 
i 12.7114 301.8558 1.434335 81 72.81761 0 0.1 0 0 0 1 
i 15.15964 301.8558 1.434335 82 70.10063 0 0.1 0 0 0 1 
i 15.22098 301.8558 1.434335 80 70.20126 0 0.1 0 0 0 1 
i 15.34367 301.8558 1.434335 83 70.40252 0 0.1 0 0 0 1 
i 15.52771 301.8558 0.7171673 84 70.7044 0 0.1 0 0 0 1 
i 15.58906 301.8558 0.7171673 78 70.80503 0 0.1 0 0 0 1 
i 15.95713 301.8558 1.434335 76 71.40881 0 0.1 0 0 0 1 
i 16.07982 301.8558 1.434335 87 71.61006 0 0.1 0 0 0 1 
i 16.26386 301.8558 0.7171673 89 71.91195 0 0.1 0 0 0 1 
i 16.44789 301.8558 0.7171673 85 72.21384 0 0.1 0 0 0 1 
i 16.69327 301.8558 1.434335 90 72.61635 0 0.1 0 0 0 1 
i 16.81596 301.8558 1.434335 92 72.81761 0 0.1 0 0 0 1 
i 1.122691 302.3282 0.5378755 50 70.20998 0 0.1 0 0 0 1 
i 1.981527 302.3282 0.5378755 60 71.61878 0 0.1 0 0 0 1 
i 5.227257 302.3282 0.5378755 61 70.20998 0 0.1 0 0 0 1 
i 6.086093 302.3282 0.5378755 71 71.61878 0 0.1 0 0 0 1 
i 9.331823 302.3282 0.5378755 73 70.20998 0 0.1 0 0 0 1 
i 10.19066 302.3282 0.5378755 83 71.61878 0 0.1 0 0 0 1 
i 13.43639 302.3282 0.5378755 84 70.20998 0 0.1 0 0 0 1 
i 14.29522 302.3282 0.5378755 94 71.61878 0 0.1 0 0 0 1 
i 3.336703 302.5729 0.7171673 43 70.90566 0 0.1 0 0 0 1 
i 4.195539 302.5729 0.7171673 50 72.31447 0 0.1 0 0 0 1 
i 4.563611 302.5729 0.7171673 57 72.91824 0 0.1 0 0 0 1 
i 6.88916 302.5729 0.7171673 58 70 0 0.1 0 0 0 1 
i 7.441269 302.5729 0.7171673 54 70.90566 0 0.1 0 0 0 1 
i 7.809341 302.5729 0.7171673 52 71.50943 0 0.1 0 0 0 1 
i 7.993377 302.5729 0.7171673 65 71.81132 0 0.1 0 0 0 1 
i 8.545486 302.5729 0.7171673 66 72.71698 0 0.1 0 0 0 1 
i 11.17776 302.5729 0.7171673 68 70.30189 0 0.1 0 0 0 1 
i 11.54583 302.5729 0.7171673 66 70.90566 0 0.1 0 0 0 1 
i 11.60718 302.5729 0.7171673 67 71.00629 0 0.1 0 0 0 1 
i 12.40467 302.5729 0.7171673 73 72.31447 0 0.1 0 0 0 1 
i 12.46602 302.5729 0.7171673 79 72.41509 0 0.1 0 0 0 1 
i 12.77274 302.5729 0.7171673 80 72.91824 0 0.1 0 0 0 1 
i 15.09829 302.5729 0.7171673 81 70 0 0.1 0 0 0 1 
i 16.01847 302.5729 0.7171673 75 71.50943 0 0.1 0 0 0 1 
i 16.20251 302.5729 0.7171673 88 71.81132 0 0.1 0 0 0 1 
i 16.50924 302.5729 0.7171673 84 72.31447 0 0.1 0 0 0 1 
i 16.75462 302.5729 0.7171673 89 72.71698 0 0.1 0 0 0 1 
i 2.845939 302.7577 0.5378755 53 70.11807 0 0.1 0 0 0 1 
i 3.029976 302.7577 0.5378755 58 70.41996 0 0.1 0 0 0 1 
i 6.950505 302.7577 0.5378755 64 70.11807 0 0.1 0 0 0 1 
i 7.134542 302.7577 0.5378755 69 70.41996 0 0.1 0 0 0 1 
i 11.05507 302.7577 0.5378755 76 70.11807 0 0.1 0 0 0 1 
i 11.23911 302.7577 0.5378755 81 70.41996 0 0.1 0 0 0 1 
i 15.15964 302.7577 0.5378755 87 70.11807 0 0.1 0 0 0 1 
i 15.34367 302.7577 0.5378755 92 70.41996 0 0.1 0 0 0 1 
i 1 302.866 0.5378755 51 70.00872 0 0.1 0 0 0 1 
i 2.104217 302.866 0.5378755 61 71.82004 0 0.1 0 0 0 1 
i 5.104566 302.866 0.5378755 62 70.00872 0 0.1 0 0 0 1 
i 6.208784 302.866 0.5378755 73 71.82004 0 0.1 0 0 0 1 
i 9.209132 302.866 0.5378755 74 70.00872 0 0.1 0 0 0 1 
i 10.31335 302.866 0.5378755 84 71.82004 0 0.1 0 0 0 1 
i 13.3137 302.866 0.5378755 85 70.00872 0 0.1 0 0 0 1 
i 14.41792 302.866 0.5378755 96 71.82004 0 0.1 0 0 0 1 
i 2.784594 303.2956 0.5378755 54 70.01744 0 0.1 0 0 0 1 
i 3.091321 303.2956 0.5378755 59 70.52059 0 0.1 0 0 0 1 
i 6.88916 303.2956 0.5378755 65 70.01744 0 0.1 0 0 0 1 
i 7.195887 303.2956 0.5378755 70 70.52059 0 0.1 0 0 0 1 
i 10.99373 303.2956 0.5378755 77 70.01744 0 0.1 0 0 0 1 
i 11.30045 303.2956 0.5378755 82 70.52059 0 0.1 0 0 0 1 
i 15.09829 303.2956 0.5378755 88 70.01744 0 0.1 0 0 0 1 
i 15.40502 303.2956 1.644257 93 70.52059 0 0.1 0 0 0 1 
i 1.061345 303.8641 1.075751 50 70.10868 0 0.1 0 0 0 1 
i 1.122691 303.8641 1.075751 49 70.20931 0 0.1 0 0 0 1 
i 1.981527 303.8641 1.075751 61 71.61811 0 0.1 0 0 0 1 
i 2.165563 303.8641 0.5378755 62 71.92 0 0.1 0 0 0 1 
i 5.165911 303.8641 0.5378755 62 70.10868 0 0.1 0 0 0 1 
i 5.227257 303.8641 1.075751 61 70.20931 0 0.1 0 0 0 1 
i 6.086093 303.8641 1.075751 72 71.61811 0 0.1 0 0 0 1 
i 6.270129 303.8641 1.075751 73 71.92 0 0.1 0 0 0 1 
i 9.270478 303.8641 1.075751 73 70.10868 0 0.1 0 0 0 1 
i 9.331823 303.8641 1.075751 72 70.20931 0 0.1 0 0 0 1 
i 10.19066 303.8641 1.075751 84 71.61811 0 0.1 0 0 0 1 
i 10.3747 303.8641 0.5378755 85 71.92 0 0.1 0 0 0 1 
i 13.37504 303.8641 0.5378755 85 70.10868 0 0.1 0 0 0 1 
i 13.43639 303.8641 1.075751 84 70.20931 0 0.1 0 0 0 1 
i 14.29522 303.8641 1.075751 95 71.61811 0 0.1 0 0 0 1 
i 14.47926 303.8641 1.075751 96 71.92 0 0.1 0 0 0 1 
i 2.042872 304.4019 0.5378755 60 71.71874 0 0.1 0 0 0 1 
i 5.288602 304.4019 0.5378755 60 70.30994 0 0.1 0 0 0 1 
i 10.252 304.4019 0.5378755 83 71.71874 0 0.1 0 0 0 1 
i 13.49773 304.4019 0.5378755 83 70.30994 0 0.1 0 0 0 1 
i 2.907285 304.4097 0.5378755 46 70.21803 0 0.1 0 0 0 1 
i 3.029976 304.4097 1.075751 45 70.41929 0 0.1 0 0 0 1 
i 7.011851 304.4097 1.075751 57 70.21803 0 0.1 0 0 0 1 
i 7.134542 304.4097 1.075751 56 70.41929 0 0.1 0 0 0 1 
i 11.11642 304.4097 0.5378755 69 70.21803 0 0.1 0 0 0 1 
i 11.23911 304.4097 1.075751 68 70.41929 0 0.1 0 0 0 1 
i 15.22098 304.4097 1.075751 80 70.21803 0 0.1 0 0 0 1 
i 15.34367 304.4097 1.075751 79 70.41929 0 0.1 0 0 0 1 
i 3.152666 304.9476 0.5378755 44 70.62055 0 0.1 0 0 0 1 
i 11.3618 304.9476 1.222512 67 70.62055 0 0.1 0 0 0 1 
i 1.245382 305.6322 0.5378755 49 70.4099 0 0.1 0 0 0 1 
i 1.981527 305.6322 0.5378755 59 71.61744 0 0.1 0 0 0 1 
i 5.349948 305.6322 0.5378755 60 70.4099 0 0.1 0 0 0 1 
i 6.086093 305.6322 0.5378755 71 71.61744 0 0.1 0 0 0 1 
i 9.454514 305.6322 0.5378755 72 70.4099 0 0.1 0 0 0 1 
i 10.19066 305.6322 0.5378755 82 71.61744 0 0.1 0 0 0 1 
i 13.55908 305.6322 0.5378755 83 70.4099 0 0.1 0 0 0 1 
i 14.29522 305.6322 0.5378755 94 71.61744 0 0.1 0 0 0 1 
i 2.845939 305.9456 1.075751 38 70.11673 0 0.1 0 0 0 1 
i 2.907285 305.9456 0.5378755 40 70.21736 0 0.1 0 0 0 1 
i 3.029976 305.9456 0.5378755 37 70.41862 0 0.1 0 0 0 1 
i 3.214012 305.9456 0.5378755 35 70.7205 0 0.1 0 0 0 1 
i 6.950505 305.9456 0.5378755 50 70.11673 0 0.1 0 0 0 1 
i 7.011851 305.9456 1.075751 52 70.21736 0 0.1 0 0 0 1 
i 7.134542 305.9456 1.075751 48 70.41862 0 0.1 0 0 0 1 
i 7.318578 305.9456 0.5378755 47 70.7205 0 0.1 0 0 0 1 
i 11.05507 305.9456 1.075751 61 70.11673 0 0.1 0 0 0 1 
i 11.11642 305.9456 0.5378755 63 70.21736 0 0.1 0 0 0 1 
i 11.23911 305.9456 0.5378755 60 70.41862 0 0.1 0 0 0 1 
i 11.42314 305.9456 0.5378755 58 70.7205 0 0.1 0 0 0 1 
i 15.15964 305.9456 0.5378755 73 70.11673 0 0.1 0 0 0 1 
i 15.22098 305.9456 1.075751 75 70.21736 0 0.1 0 0 0 1 
i 15.34367 305.9456 1.075751 71 70.41862 0 0.1 0 0 0 1 
i 15.52771 305.9456 0.5378755 70 70.7205 0 0.1 0 0 0 1 
i 1 306.1701 0.5378755 51 70.00738 0 0.1 0 0 0 1 
i 2.226908 306.1701 0.5378755 62 72.01996 0 0.1 0 0 0 1 
i 5.104566 306.1701 0.5378755 63 70.00738 0 0.1 0 0 0 1 
i 6.331474 306.1701 0.5378755 73 72.01996 0 0.1 0 0 0 1 
i 9.209132 306.1701 0.5378755 74 70.00738 0 0.1 0 0 0 1 
i 10.43604 306.1701 0.5378755 85 72.01996 0 0.1 0 0 0 1 
i 13.3137 306.1701 0.5378755 86 70.00738 0 0.1 0 0 0 1 
i 14.54061 306.1701 0.5378755 96 72.01996 0 0.1 0 0 0 1 
i 2.784594 306.4835 0.5378755 39 70.0161 0 0.1 0 0 0 1 
i 2.96863 306.4835 0.5378755 41 70.31799 0 0.1 0 0 0 1 
i 3.152666 306.4835 0.5378755 36 70.61987 0 0.1 0 0 0 1 
i 6.88916 306.4835 0.5378755 51 70.0161 0 0.1 0 0 0 1 
i 7.195887 306.4835 0.5378755 49 70.51925 0 0.1 0 0 0 1 
i 10.99373 306.4835 0.5378755 62 70.0161 0 0.1 0 0 0 1 
i 11.17776 306.4835 0.5378755 64 70.31799 0 0.1 0 0 0 1 
i 11.3618 306.4835 0.5378755 59 70.61987 0 0.1 0 0 0 1 
i 15.09829 306.4835 0.5378755 74 70.0161 0 0.1 0 0 0 1 
i 15.40502 306.4835 1.760387 72 70.51925 0 0.1 0 0 0 1 
i 1.061345 307.1682 1.075751 51 70.10734 0 0.1 0 0 0 1 
i 1.245382 307.1682 0.5378755 49 70.40922 0 0.1 0 0 0 1 
i 1.981527 307.1682 0.5378755 60 71.61677 0 0.1 0 0 0 1 
i 2.288254 307.1682 0.5378755 63 72.11992 0 0.1 0 0 0 1 
i 5.165911 307.1682 0.5378755 63 70.10734 0 0.1 0 0 0 1 
i 5.349948 307.1682 1.075751 60 70.40922 0 0.1 0 0 0 1 
i 6.086093 307.1682 1.075751 71 71.61677 0 0.1 0 0 0 1 
i 6.39282 307.1682 1.075751 74 72.11992 0 0.1 0 0 0 1 
i 9.270478 307.1682 1.075751 74 70.10734 0 0.1 0 0 0 1 
i 9.454514 307.1682 0.5378755 72 70.40922 0 0.1 0 0 0 1 
i 10.19066 307.1682 0.5378755 83 71.61677 0 0.1 0 0 0 1 
i 10.49739 307.1682 0.5378755 86 72.11992 0 0.1 0 0 0 1 
i 13.37504 307.1682 0.5378755 86 70.10734 0 0.1 0 0 0 1 
i 13.55908 307.1682 1.075751 83 70.40922 0 0.1 0 0 0 1 
i 14.29522 307.1682 1.075751 94 71.61677 0 0.1 0 0 0 1 
i 14.60195 307.1682 1.075751 97 72.11992 0 0.1 0 0 0 1 
i 1.306727 307.706 0.5378755 48 70.50985 0 0.1 0 0 0 1 
i 2.042872 307.706 0.5378755 59 71.7174 0 0.1 0 0 0 1 
i 2.226908 307.706 0.5378755 62 72.01929 0 0.1 0 0 0 1 
i 5.104566 307.706 0.5378755 62 70.00671 0 0.1 0 0 0 1 
i 9.515859 307.706 0.5378755 71 70.50985 0 0.1 0 0 0 1 
i 10.252 307.706 0.5378755 82 71.7174 0 0.1 0 0 0 1 
i 10.43604 307.706 0.5378755 85 72.01929 0 0.1 0 0 0 1 
i 13.3137 307.706 0.5378755 85 70.00671 0 0.1 0 0 0 1 
i 3.275357 308.0836 0.5378755 58 70.82046 0 0.1 0 0 0 1 
i 7.379923 308.0836 0.5378755 69 70.82046 0 0.1 0 0 0 1 
i 11.48449 308.0836 0.5378755 81 70.82046 0 0.1 0 0 0 1 
i 15.58906 308.0836 0.5378755 92 70.82046 0 0.1 0 0 0 1 
i 2.784594 308.6214 0.5378755 51 70.01543 0 0.1 0 0 0 1 
i 6.88916 308.6214 0.5378755 63 70.01543 0 0.1 0 0 0 1 
i 10.99373 308.6214 0.5378755 74 70.01543 0 0.1 0 0 0 1 
i 15.09829 308.6214 0.5378755 86 70.01543 0 0.1 0 0 0 1 
i 1.122691 308.7415 0.5378755 51 70.2073 0 0.1 0 0 0 1 
i 1.245382 308.7415 0.5378755 49 70.40855 0 0.1 0 0 0 1 
i 1.981527 308.7415 0.5378755 61 71.6161 0 0.1 0 0 0 1 
i 2.349599 308.7415 0.5378755 63 72.21987 0 0.1 0 0 0 1 
i 5.227257 308.7415 0.5378755 63 70.2073 0 0.1 0 0 0 1 
i 5.349948 308.7415 0.5378755 60 70.40855 0 0.1 0 0 0 1 
i 6.086093 308.7415 0.5378755 72 71.6161 0 0.1 0 0 0 1 
i 6.454165 308.7415 0.5378755 75 72.21987 0 0.1 0 0 0 1 
i 9.331823 308.7415 0.5378755 74 70.2073 0 0.1 0 0 0 1 
i 9.454514 308.7415 0.5378755 72 70.40855 0 0.1 0 0 0 1 
i 10.19066 308.7415 0.5378755 84 71.6161 0 0.1 0 0 0 1 
i 10.55873 308.7415 0.5378755 86 72.21987 0 0.1 0 0 0 1 
i 13.43639 308.7415 0.5378755 86 70.2073 0 0.1 0 0 0 1 
i 13.55908 308.7415 0.5378755 83 70.40855 0 0.1 0 0 0 1 
i 14.29522 308.7415 0.5378755 95 71.6161 0 0.1 0 0 0 1 
i 14.6633 308.7415 0.5378755 98 72.21987 0 0.1 0 0 0 1 
i 1 309.2794 0.5378755 50 70.00604 0 0.1 0 0 0 1 
i 1.368072 309.2794 0.5378755 48 70.60981 0 0.1 0 0 0 1 
i 2.104217 309.2794 0.5378755 60 71.81736 0 0.1 0 0 0 1 
i 2.226908 309.2794 0.5378755 62 72.01862 0 0.1 0 0 0 1 
i 5.104566 309.2794 0.5378755 61 70.00604 0 0.1 0 0 0 1 
i 5.472639 309.2794 0.5378755 59 70.60981 0 0.1 0 0 0 1 
i 6.208784 309.2794 0.5378755 71 71.81736 0 0.1 0 0 0 1 
i 6.331474 309.2794 0.5378755 73 72.01862 0 0.1 0 0 0 1 
i 9.209132 309.2794 0.5378755 73 70.00604 0 0.1 0 0 0 1 
i 9.577205 309.2794 0.5378755 71 70.60981 0 0.1 0 0 0 1 
i 10.31335 309.2794 0.5378755 83 71.81736 0 0.1 0 0 0 1 
i 10.43604 309.2794 0.5378755 85 72.01862 0 0.1 0 0 0 1 
i 13.3137 309.2794 0.5378755 84 70.00604 0 0.1 0 0 0 1 
i 13.68177 309.2794 0.5378755 82 70.60981 0 0.1 0 0 0 1 
i 14.41792 309.2794 0.5378755 94 71.81736 0 0.1 0 0 0 1 
i 14.54061 309.2794 0.5378755 96 72.01862 0 0.1 0 0 0 1 
i 2.845939 309.6963 0.5378755 43 70.11539 0 0.1 0 0 0 1 
i 3.275357 309.6963 0.5378755 31 70.81979 0 0.1 0 0 0 1 
i 6.950505 309.6963 0.5378755 54 70.11539 0 0.1 0 0 0 1 
i 7.379923 309.6963 0.5378755 42 70.81979 0 0.1 0 0 0 1 
i 11.05507 309.6963 0.5378755 66 70.11539 0 0.1 0 0 0 1 
i 11.48449 309.6963 0.5378755 54 70.81979 0 0.1 0 0 0 1 
i 15.15964 309.6963 0.5378755 77 70.11539 0 0.1 0 0 0 1 
i 15.58906 309.6963 0.5378755 65 70.81979 0 0.1 0 0 0 1 
i 1.061345 310.2043 1.075751 49 70.106 0 0.1 0 0 0 1 
i 1.122691 310.2043 1.075751 50 70.20662 0 0.1 0 0 0 1 
i 1.245382 310.2043 1.075751 48 70.40788 0 0.1 0 0 0 1 
i 1.429418 310.2043 0.5378755 47 70.70977 0 0.1 0 0 0 1 
i 1.981527 310.2043 1.075751 61 71.61543 0 0.1 0 0 0 1 
i 2.165563 310.2043 1.075751 60 71.91732 0 0.1 0 0 0 1 
i 2.288254 310.2043 1.075751 62 72.11857 0 0.1 0 0 0 1 
i 2.349599 310.2043 0.5378755 63 72.2192 0 0.1 0 0 0 1 
i 5.165911 310.2043 1.075751 61 70.106 0 0.1 0 0 0 1 
i 5.227257 310.2043 1.075751 62 70.20662 0 0.1 0 0 0 1 
i 5.349948 310.2043 1.075751 60 70.40788 0 0.1 0 0 0 1 
i 5.533984 310.2043 0.5378755 59 70.70977 0 0.1 0 0 0 1 
i 6.086093 310.2043 1.075751 72 71.61543 0 0.1 0 0 0 1 
i 6.270129 310.2043 0.5378755 71 71.91732 0 0.1 0 0 0 1 
i 6.39282 310.2043 1.075751 73 72.11857 0 0.1 0 0 0 1 
i 6.454165 310.2043 1.075751 74 72.2192 0 0.1 0 0 0 1 
i 9.270478 310.2043 0.5378755 72 70.106 0 0.1 0 0 0 1 
i 9.331823 310.2043 1.075751 73 70.20662 0 0.1 0 0 0 1 
i 9.454514 310.2043 0.5378755 71 70.40788 0 0.1 0 0 0 1 
i 9.63855 310.2043 0.5378755 70 70.70977 0 0.1 0 0 0 1 
i 10.19066 310.2043 1.075751 84 71.61543 0 0.1 0 0 0 1 
i 10.3747 310.2043 1.075751 83 71.91732 0 0.1 0 0 0 1 
i 10.49739 310.2043 1.075751 85 72.11857 0 0.1 0 0 0 1 
i 10.55873 310.2043 0.5378755 86 72.2192 0 0.1 0 0 0 1 
i 13.37504 310.2043 1.075751 84 70.106 0 0.1 0 0 0 1 
i 13.43639 310.2043 1.075751 85 70.20662 0 0.1 0 0 0 1 
i 13.55908 310.2043 1.075751 83 70.40788 0 0.1 0 0 0 1 
i 13.74312 310.2043 1.075751 82 70.70977 0 0.1 0 0 0 1 
i 14.29522 310.2043 1.075751 95 71.61543 0 0.1 0 0 0 1 
i 14.47926 310.2043 0.5378755 94 71.91732 0 0.1 0 0 0 1 
i 14.60195 310.2043 0.5378755 96 72.11857 0 0.1 0 0 0 1 
i 14.6633 310.2043 1.075751 97 72.2192 0 0.1 0 0 0 1 
i 2.784594 310.2341 0.5378755 42 70.01476 0 0.1 0 0 0 1 
i 3.336703 310.2341 0.5378755 30 70.92042 0 0.1 0 0 0 1 
i 6.88916 310.2341 0.5378755 53 70.01476 0 0.1 0 0 0 1 
i 7.441269 310.2341 0.5378755 41 70.92042 0 0.1 0 0 0 1 
i 10.99373 310.2341 0.5378755 65 70.01476 0 0.1 0 0 0 1 
i 11.54583 310.2341 0.5378755 53 70.92042 0 0.1 0 0 0 1 
i 15.09829 310.2341 0.5378755 76 70.01476 0 0.1 0 0 0 1 
i 15.6504 310.2341 0.5378755 64 70.92042 0 0.1 0 0 0 1 
i 1.184036 310.7422 0.5378755 51 70.30725 0 0.1 0 0 0 1 
i 2.410945 310.7422 0.5378755 64 72.31983 0 0.1 0 0 0 1 
i 5.472639 310.7422 0.5378755 59 70.60914 0 0.1 0 0 0 1 
i 6.515511 310.7422 0.5378755 75 72.31983 0 0.1 0 0 0 1 
i 9.393168 310.7422 0.5378755 74 70.30725 0 0.1 0 0 0 1 
i 9.515859 310.7422 0.5378755 72 70.50851 0 0.1 0 0 0 1 
i 9.577205 310.7422 0.5378755 71 70.60914 0 0.1 0 0 0 1 
i 10.62008 310.7422 0.5378755 87 72.31983 0 0.1 0 0 0 1 
i 14.35657 310.7422 0.5378755 96 71.71606 0 0.1 0 0 0 1 
i 14.72464 310.7422 1.144007 98 72.31983 0 0.1 0 0 0 1 
i 2.907285 311.3483 0.5378755 50 70.21535 0 0.1 0 0 0 1 
i 3.275357 311.3483 0.5378755 58 70.81912 0 0.1 0 0 0 1 
i 7.011851 311.3483 0.5378755 62 70.21535 0 0.1 0 0 0 1 
i 7.379923 311.3483 0.5378755 70 70.81912 0 0.1 0 0 0 1 
i 11.11642 311.3483 0.5378755 73 70.21535 0 0.1 0 0 0 1 
i 11.48449 311.3483 0.5378755 81 70.81912 0 0.1 0 0 0 1 
i 15.22098 311.3483 0.5378755 85 70.21535 0 0.1 0 0 0 1 
i 15.58906 311.3483 0.5378755 93 70.81912 0 0.1 0 0 0 1 
i 2.784594 311.8862 0.5378755 52 70.01409 0 0.1 0 0 0 1 
i 3.398048 311.8862 0.5378755 60 71.02038 0 0.1 0 0 0 1 
i 6.88916 311.8862 0.5378755 64 70.01409 0 0.1 0 0 0 1 
i 7.502614 311.8862 0.5378755 72 71.02038 0 0.1 0 0 0 1 
i 10.99373 311.8862 0.5378755 75 70.01409 0 0.1 0 0 0 1 
i 11.60718 311.8862 0.5378755 83 71.02038 0 0.1 0 0 0 1 
i 15.09829 311.8862 0.5378755 87 70.01409 0 0.1 0 0 0 1 
i 15.71175 311.8862 0.5378755 95 71.02038 0 0.1 0 0 0 1 
i 1.490763 312.2404 0.5378755 49 70.80973 0 0.1 0 0 0 1 
i 1.981527 312.2404 0.5378755 58 71.61476 0 0.1 0 0 0 1 
i 5.595329 312.2404 0.5378755 61 70.80973 0 0.1 0 0 0 1 
i 6.086093 312.2404 0.5378755 69 71.61476 0 0.1 0 0 0 1 
i 9.699895 312.2404 0.5378755 72 70.80973 0 0.1 0 0 0 1 
i 10.19066 312.2404 0.5378755 81 71.61476 0 0.1 0 0 0 1 
i 13.80446 312.2404 0.5378755 84 70.80973 0 0.1 0 0 0 1 
i 14.29522 312.2404 0.5378755 92 71.61476 0 0.1 0 0 0 1 
i 1 312.7783 0.5378755 53 70.0047 0 0.1 0 0 0 1 
i 2.47229 312.7783 0.5378755 62 72.41979 0 0.1 0 0 0 1 
i 5.104566 312.7783 0.5378755 65 70.0047 0 0.1 0 0 0 1 
i 6.576856 312.7783 0.5378755 73 72.41979 0 0.1 0 0 0 1 
i 9.209132 312.7783 0.5378755 76 70.0047 0 0.1 0 0 0 1 
i 10.68142 312.7783 0.5378755 85 72.41979 0 0.1 0 0 0 1 
i 13.3137 312.7783 0.5378755 88 70.0047 0 0.1 0 0 0 1 
i 14.78599 312.7783 0.5378755 96 72.41979 0 0.1 0 0 0 1 
i 2.845939 312.8842 1.075751 48 70.11405 0 0.1 0 0 0 1 
i 3.275357 312.8842 1.075751 50 70.81845 0 0.1 0 0 0 1 
i 3.459394 312.8842 0.5378755 51 71.12034 0 0.1 0 0 0 1 
i 6.950505 312.8842 1.075751 60 70.11405 0 0.1 0 0 0 1 
i 7.379923 312.8842 1.075751 62 70.81845 0 0.1 0 0 0 1 
i 7.56396 312.8842 1.075751 62 71.12034 0 0.1 0 0 0 1 
i 11.05507 312.8842 1.075751 71 70.11405 0 0.1 0 0 0 1 
i 11.48449 312.8842 0.5378755 73 70.81845 0 0.1 0 0 0 1 
i 11.66853 312.8842 0.5378755 74 71.12034 0 0.1 0 0 0 1 
i 15.15964 312.8842 1.075751 83 70.11405 0 0.1 0 0 0 1 
i 15.58906 312.8842 1.075751 85 70.81845 0 0.1 0 0 0 1 
i 7.073196 313.4221 0.5378755 59 70.3153 0 0.1 0 0 0 1 
i 11.54583 313.4221 0.5378755 73 70.91908 0 0.1 0 0 0 1 
i 15.28233 313.4221 0.5378755 82 70.3153 0 0.1 0 0 0 1 
i 1.061345 313.7763 1.075751 54 70.10465 0 0.1 0 0 0 1 
i 1.490763 313.7763 0.5378755 49 70.80906 0 0.1 0 0 0 1 
i 1.981527 313.7763 1.075751 57 71.61409 0 0.1 0 0 0 1 
i 2.533635 313.7763 0.5378755 63 72.51975 0 0.1 0 0 0 1 
i 5.165911 313.7763 0.5378755 66 70.10465 0 0.1 0 0 0 1 
i 5.595329 313.7763 1.075751 60 70.80906 0 0.1 0 0 0 1 
i 6.086093 313.7763 0.5378755 69 71.61409 0 0.1 0 0 0 1 
i 6.638201 313.7763 1.075751 74 72.51975 0 0.1 0 0 0 1 
i 9.270478 313.7763 1.075751 77 70.10465 0 0.1 0 0 0 1 
i 9.699895 313.7763 0.5378755 72 70.80906 0 0.1 0 0 0 1 
i 10.19066 313.7763 1.075751 80 71.61409 0 0.1 0 0 0 1 
i 10.74277 313.7763 0.5378755 86 72.51975 0 0.1 0 0 0 1 
i 13.37504 313.7763 0.5378755 89 70.10465 0 0.1 0 0 0 1 
i 13.80446 313.7763 1.075751 83 70.80906 0 0.1 0 0 0 1 
i 14.29522 313.7763 0.5378755 92 71.61409 0 0.1 0 0 0 1 
i 14.84733 313.7763 1.075751 97 72.51975 0 0.1 0 0 0 1 
i 1.552109 314.3142 0.5378755 48 70.90969 0 0.1 0 0 0 1 
i 2.47229 314.3142 0.5378755 62 72.41912 0 0.1 0 0 0 1 
i 5.104566 314.3142 0.5378755 65 70.00403 0 0.1 0 0 0 1 
i 6.147438 314.3142 0.5378755 68 71.71472 0 0.1 0 0 0 1 
i 9.761241 314.3142 0.5378755 71 70.90969 0 0.1 0 0 0 1 
i 10.68142 314.3142 0.5378755 85 72.41912 0 0.1 0 0 0 1 
i 13.3137 314.3142 0.5378755 88 70.00403 0 0.1 0 0 0 1 
i 14.35657 314.3142 0.5378755 91 71.71472 0 0.1 0 0 0 1 
i 3.029976 314.6524 0.5378755 43 70.41526 0 0.1 0 0 0 1 
i 3.275357 314.6524 0.5378755 37 70.81778 0 0.1 0 0 0 1 
i 7.134542 314.6524 0.5378755 55 70.41526 0 0.1 0 0 0 1 
i 7.379923 314.6524 0.5378755 48 70.81778 0 0.1 0 0 0 1 
i 11.23911 314.6524 0.5378755 66 70.41526 0 0.1 0 0 0 1 
i 11.48449 314.6524 0.5378755 60 70.81778 0 0.1 0 0 0 1 
i 15.34367 314.6524 0.5378755 78 70.41526 0 0.1 0 0 0 1 
i 15.58906 314.6524 0.5378755 71 70.81778 0 0.1 0 0 0 1 
i 2.784594 315.1903 0.5378755 40 70.01275 0 0.1 0 0 0 1 
i 3.520739 315.1903 0.5378755 33 71.22029 0 0.1 0 0 0 1 
i 6.88916 315.1903 0.5378755 51 70.01275 0 0.1 0 0 0 1 
i 7.625305 315.1903 0.5378755 45 71.22029 0 0.1 0 0 0 1 
i 10.99373 315.1903 0.5378755 63 70.01275 0 0.1 0 0 0 1 
i 11.72987 315.1903 0.5378755 56 71.22029 0 0.1 0 0 0 1 
i 15.09829 315.1903 0.5378755 74 70.01275 0 0.1 0 0 0 1 
i 15.83444 315.1903 0.5378755 68 71.22029 0 0.1 0 0 0 1 
i 1.122691 315.3497 0.5378755 54 70.20461 0 0.1 0 0 0 1 
i 1.490763 315.3497 0.5378755 49 70.80839 0 0.1 0 0 0 1 
i 1.981527 315.3497 0.5378755 58 71.61342 0 0.1 0 0 0 1 
i 2.594981 315.3497 0.5378755 63 72.61971 0 0.1 0 0 0 1 
i 5.227257 315.3497 0.5378755 66 70.20461 0 0.1 0 0 0 1 
i 5.595329 315.3497 0.5378755 61 70.80839 0 0.1 0 0 0 1 
i 6.086093 315.3497 0.5378755 69 71.61342 0 0.1 0 0 0 1 
i 6.699547 315.3497 0.5378755 75 72.61971 0 0.1 0 0 0 1 
i 9.331823 315.3497 0.5378755 77 70.20461 0 0.1 0 0 0 1 
i 9.699895 315.3497 0.5378755 72 70.80839 0 0.1 0 0 0 1 
i 10.19066 315.3497 0.5378755 81 71.61342 0 0.1 0 0 0 1 
i 10.80411 315.3497 0.5378755 86 72.61971 0 0.1 0 0 0 1 
i 13.43639 315.3497 0.5378755 89 70.20461 0 0.1 0 0 0 1 
i 13.80446 315.3497 0.5378755 84 70.80839 0 0.1 0 0 0 1 
i 14.29522 315.3497 0.5378755 92 71.61342 0 0.1 0 0 0 1 
i 14.90868 315.3497 0.5378755 98 72.61971 0 0.1 0 0 0 1 
i 1 315.8876 0.5378755 53 70.00335 0 0.1 0 0 0 1 
i 1.613454 315.8876 0.5378755 48 71.00964 0 0.1 0 0 0 1 
i 2.104217 315.8876 0.5378755 56 71.81468 0 0.1 0 0 0 1 
i 2.47229 315.8876 0.5378755 62 72.41845 0 0.1 0 0 0 1 
i 5.104566 315.8876 0.5378755 65 70.00335 0 0.1 0 0 0 1 
i 5.71802 315.8876 0.5378755 59 71.00964 0 0.1 0 0 0 1 
i 6.208784 315.8876 0.5378755 68 71.81468 0 0.1 0 0 0 1 
i 6.576856 315.8876 0.5378755 73 72.41845 0 0.1 0 0 0 1 
i 9.209132 315.8876 0.5378755 76 70.00335 0 0.1 0 0 0 1 
i 9.822586 315.8876 0.5378755 71 71.00964 0 0.1 0 0 0 1 
i 10.31335 315.8876 0.5378755 79 71.81468 0 0.1 0 0 0 1 
i 10.68142 315.8876 0.5378755 85 72.41845 0 0.1 0 0 0 1 
i 13.3137 315.8876 0.5378755 88 70.00335 0 0.1 0 0 0 1 
i 13.92715 315.8876 0.5378755 82 71.00964 0 0.1 0 0 0 1 
i 14.41792 315.8876 0.5378755 91 71.81468 0 0.1 0 0 0 1 
i 14.78599 315.8876 0.5378755 96 72.41845 0 0.1 0 0 0 1 
i 2.845939 316.1883 0.5378755 60 70.1127 0 0.1 0 0 0 1 
i 3.029976 316.1883 0.5378755 54 70.41459 0 0.1 0 0 0 1 
i 3.275357 316.1883 0.5378755 63 70.81711 0 0.1 0 0 0 1 
i 3.582084 316.1883 0.5378755 70 71.32025 0 0.1 0 0 0 1 
i 6.950505 316.1883 0.5378755 72 70.1127 0 0.1 0 0 0 1 
i 7.134542 316.1883 0.5378755 65 70.41459 0 0.1 0 0 0 1 
i 7.379923 316.1883 0.5378755 75 70.81711 0 0.1 0 0 0 1 
i 7.68665 316.1883 0.5378755 81 71.32025 0 0.1 0 0 0 1 
i 11.05507 316.1883 0.5378755 83 70.1127 0 0.1 0 0 0 1 
i 11.23911 316.1883 0.5378755 77 70.41459 0 0.1 0 0 0 1 
i 11.48449 316.1883 0.5378755 86 70.81711 0 0.1 0 0 0 1 
i 11.79122 316.1883 0.5378755 93 71.32025 0 0.1 0 0 0 1 
i 15.15964 316.1883 0.5378755 95 70.1127 0 0.1 0 0 0 1 
i 15.34367 316.1883 0.5378755 88 70.41459 0 0.1 0 0 0 1 
i 15.58906 316.1883 0.5378755 98 70.81711 0 0.1 0 0 0 1 
i 15.89578 316.1883 0.5378755 104 71.32025 0 0.1 0 0 0 1 
i 2.784594 316.7262 0.5378755 59 70.01208 0 0.1 0 0 0 1 
i 3.091321 316.7262 0.5378755 53 70.51522 0 0.1 0 0 0 1 
i 3.336703 316.7262 0.6241657 62 70.91774 0 0.1 0 0 0 1 
i 3.520739 316.7262 0.5378755 68 71.21962 0 0.1 0 0 0 1 
i 6.88916 316.7262 0.5378755 71 70.01208 0 0.1 0 0 0 1 
i 7.195887 316.7262 0.5378755 64 70.51522 0 0.1 0 0 0 1 
i 7.441269 316.7262 1.162041 74 70.91774 0 0.1 0 0 0 1 
i 7.625305 316.7262 0.5378755 80 71.21962 0 0.1 0 0 0 1 
i 10.99373 316.7262 0.5378755 82 70.01208 0 0.1 0 0 0 1 
i 11.30045 316.7262 0.5378755 76 70.51522 0 0.1 0 0 0 1 
i 11.54583 316.7262 0.5378755 85 70.91774 0 0.1 0 0 0 1 
i 11.72987 316.7262 0.5378755 91 71.21962 0 0.1 0 0 0 1 
i 15.09829 316.7262 0.5378755 94 70.01208 0 0.1 0 0 0 1 
i 15.40502 316.7262 0.5378755 87 70.51522 0 0.1 0 0 0 1 
i 15.6504 316.7262 0.5378755 97 70.91774 0 0.1 0 0 0 1 
i 15.83444 316.7262 0.5378755 103 71.21962 0 0.1 0 0 0 1 
i 1.061345 316.8125 0.5378755 53 70.10331 0 0.1 0 0 0 1 
i 1.122691 316.8125 1.075751 54 70.20394 0 0.1 0 0 0 1 
i 1.490763 316.8125 0.5378755 48 70.80771 0 0.1 0 0 0 1 
i 1.6748 316.8125 0.5378755 47 71.1096 0 0.1 0 0 0 1 
i 1.981527 316.8125 1.075751 57 71.61275 0 0.1 0 0 0 1 
i 2.165563 316.8125 1.075751 56 71.91463 0 0.1 0 0 0 1 
i 2.594981 316.8125 0.5378755 63 72.61904 0 0.1 0 0 0 1 
i 5.165911 316.8125 1.075751 65 70.10331 0 0.1 0 0 0 1 
i 5.227257 316.8125 1.075751 66 70.20394 0 0.1 0 0 0 1 
i 5.595329 316.8125 1.075751 60 70.80771 0 0.1 0 0 0 1 
i 5.779366 316.8125 1.075751 59 71.1096 0 0.1 0 0 0 1 
i 6.086093 316.8125 1.075751 68 71.61275 0 0.1 0 0 0 1 
i 6.270129 316.8125 0.5378755 67 71.91463 0 0.1 0 0 0 1 
i 6.638201 316.8125 0.5378755 73 72.51841 0 0.1 0 0 0 1 
i 9.270478 316.8125 0.5378755 76 70.10331 0 0.1 0 0 0 1 
i 9.331823 316.8125 1.075751 77 70.20394 0 0.1 0 0 0 1 
i 9.699895 316.8125 1.075751 71 70.80771 0 0.1 0 0 0 1 
i 9.883932 316.8125 0.5378755 70 71.1096 0 0.1 0 0 0 1 
i 10.19066 316.8125 1.075751 80 71.61275 0 0.1 0 0 0 1 
i 10.3747 316.8125 1.075751 79 71.91463 0 0.1 0 0 0 1 
i 10.74277 316.8125 1.075751 85 72.51841 0 0.1 0 0 0 1 
i 10.80411 316.8125 0.5378755 86 72.61904 0 0.1 0 0 0 1 
i 13.37504 316.8125 1.075751 88 70.10331 0 0.1 0 0 0 1 
i 13.43639 316.8125 1.075751 89 70.20394 0 0.1 0 0 0 1 
i 13.80446 316.8125 1.075751 83 70.80771 0 0.1 0 0 0 1 
i 13.9885 316.8125 1.075751 82 71.1096 0 0.1 0 0 0 1 
i 14.29522 316.8125 1.075751 91 71.61275 0 0.1 0 0 0 1 
i 14.47926 316.8125 0.5378755 90 71.91463 0 0.1 0 0 0 1 
i 14.84733 316.8125 0.5378755 96 72.51841 0 0.1 0 0 0 1 
i 14.90868 316.8125 1.075751 97 72.61904 0 0.1 0 0 0 1 
i 1.184036 317.3504 0.5378755 55 70.30457 0 0.1 0 0 0 1 
i 1.552109 317.3504 0.5378755 49 70.90834 0 0.1 0 0 0 1 
i 1.613454 317.3504 0.5378755 48 71.00897 0 0.1 0 0 0 1 
i 2.47229 317.3504 0.5378755 62 72.41778 0 0.1 0 0 0 1 
i 2.656326 317.3504 0.5378755 64 72.71966 0 0.1 0 0 0 1 
i 6.147438 317.3504 0.5378755 69 71.71338 0 0.1 0 0 0 1 
i 6.760892 317.3504 0.5378755 75 72.71966 0 0.1 0 0 0 1 
i 9.393168 317.3504 0.5378755 78 70.30457 0 0.1 0 0 0 1 
i 9.761241 317.3504 0.5378755 72 70.90834 0 0.1 0 0 0 1 
i 10.86546 317.3504 0.5378755 87 72.71966 0 0.1 0 0 0 1 
i 14.35657 317.3504 0.5378755 92 71.71338 0 0.1 0 0 0 1 
i 14.97002 317.3504 0.5378755 98 72.71966 0 0.1 0 0 0 1 
i 2.907285 317.7617 0.5378755 40 70.21266 0 0.1 0 0 0 1 
i 3.029976 317.7617 0.5378755 42 70.41392 0 0.1 0 0 0 1 
i 3.275357 317.7617 0.5378755 37 70.81644 0 0.1 0 0 0 1 
i 3.64343 317.7617 0.5378755 34 71.42021 0 0.1 0 0 0 1 
i 7.011851 317.7617 0.5378755 51 70.21266 0 0.1 0 0 0 1 
i 7.134542 317.7617 0.5378755 54 70.41392 0 0.1 0 0 0 1 
i 7.379923 317.7617 0.5378755 49 70.81644 0 0.1 0 0 0 1 
i 7.747996 317.7617 0.5378755 46 71.42021 0 0.1 0 0 0 1 
i 11.11642 317.7617 0.5378755 63 70.21266 0 0.1 0 0 0 1 
i 11.23911 317.7617 0.5378755 65 70.41392 0 0.1 0 0 0 1 
i 11.48449 317.7617 0.5378755 60 70.81644 0 0.1 0 0 0 1 
i 11.85256 317.7617 0.5378755 57 71.42021 0 0.1 0 0 0 1 
i 15.22098 317.7617 0.5378755 74 70.21266 0 0.1 0 0 0 1 
i 15.34367 317.7617 0.5378755 77 70.41392 0 0.1 0 0 0 1 
i 15.58906 317.7617 0.5378755 72 70.81644 0 0.1 0 0 0 1 
i 15.95713 317.7617 0.5378755 69 71.42021 0 0.1 0 0 0 1 
i 2.784594 318.2996 0.5378755 41 70.0114 0 0.1 0 0 0 1 
i 3.152666 318.2996 0.5378755 44 70.61518 0 0.1 0 0 0 1 
i 3.398048 318.2996 0.5378755 39 71.01769 0 0.1 0 0 0 1 
i 3.520739 318.2996 0.5378755 36 71.21895 0 0.1 0 0 0 1 
i 6.88916 318.2996 0.5378755 53 70.0114 0 0.1 0 0 0 1 
i 7.257232 318.2996 0.5378755 55 70.61518 0 0.1 0 0 0 1 
i 7.502614 318.2996 0.5378755 50 71.01769 0 0.1 0 0 0 1 
i 7.625305 318.2996 0.5378755 48 71.21895 0 0.1 0 0 0 1 
i 10.99373 318.2996 0.5378755 64 70.0114 0 0.1 0 0 0 1 
i 11.3618 318.2996 0.5378755 67 70.61518 0 0.1 0 0 0 1 
i 11.60718 318.2996 0.5378755 62 71.01769 0 0.1 0 0 0 1 
i 11.72987 318.2996 0.5378755 59 71.21895 0 0.1 0 0 0 1 
i 15.09829 318.2996 0.5378755 76 70.0114 0 0.1 0 0 0 1 
i 15.46636 318.2996 0.5378755 78 70.61518 0 0.1 0 0 0 1 
i 15.71175 318.2996 0.5378755 73 71.01769 0 0.1 0 0 0 1 
i 15.83444 318.2996 0.5378755 71 71.21895 0 0.1 0 0 0 1 
i 1.245382 318.4964 0.5378755 54 70.40453 0 0.1 0 0 0 1 
i 1.490763 318.4964 0.5378755 50 70.80704 0 0.1 0 0 0 1 
i 1.981527 318.4964 0.5378755 59 71.61208 0 0.1 0 0 0 1 
i 2.717672 318.4964 0.5378755 63 72.81962 0 0.1 0 0 0 1 
i 5.349948 318.4964 0.5378755 66 70.40453 0 0.1 0 0 0 1 
i 5.595329 318.4964 0.5378755 62 70.80704 0 0.1 0 0 0 1 
i 6.086093 318.4964 0.5378755 70 71.61208 0 0.1 0 0 0 1 
i 6.822238 318.4964 0.5378755 74 72.81962 0 0.1 0 0 0 1 
i 9.454514 318.4964 0.5378755 77 70.40453 0 0.1 0 0 0 1 
i 9.699895 318.4964 0.5378755 73 70.80704 0 0.1 0 0 0 1 
i 10.19066 318.4964 0.5378755 82 71.61208 0 0.1 0 0 0 1 
i 10.9268 318.4964 0.5378755 86 72.81962 0 0.1 0 0 0 1 
i 13.55908 318.4964 0.5378755 89 70.40453 0 0.1 0 0 0 1 
i 13.80446 318.4964 0.5378755 85 70.80704 0 0.1 0 0 0 1 
i 14.29522 318.4964 0.5378755 93 71.61208 0 0.1 0 0 0 1 
i 15.03137 318.4964 0.5378755 97 72.81962 0 0.1 0 0 0 1 
i 1 319.0343 0.5378755 52 70.00201 0 0.1 0 0 0 1 
i 1.736145 319.0343 0.5378755 48 71.20956 0 0.1 0 0 0 1 
i 2.226908 319.0343 0.5378755 56 72.01459 0 0.1 0 0 0 1 
i 2.47229 319.0343 0.5378755 61 72.41711 0 0.1 0 0 0 1 
i 5.104566 319.0343 0.5378755 64 70.00201 0 0.1 0 0 0 1 
i 5.840711 319.0343 0.5378755 59 71.20956 0 0.1 0 0 0 1 
i 6.331474 319.0343 0.5378755 68 72.01459 0 0.1 0 0 0 1 
i 6.576856 319.0343 0.5378755 72 72.41711 0 0.1 0 0 0 1 
i 9.209132 319.0343 0.5378755 75 70.00201 0 0.1 0 0 0 1 
i 9.945277 319.0343 0.5378755 71 71.20956 0 0.1 0 0 0 1 
i 10.43604 319.0343 0.5378755 79 72.01459 0 0.1 0 0 0 1 
i 10.68142 319.0343 0.5378755 84 72.41711 0 0.1 0 0 0 1 
i 13.3137 319.0343 0.5378755 87 70.00201 0 0.1 0 0 0 1 
i 14.04984 319.0343 0.5378755 82 71.20956 0 0.1 0 0 0 1 
i 14.54061 319.0343 0.5378755 91 72.01459 0 0.1 0 0 0 1 
i 14.78599 319.0343 0.5378755 95 72.41711 0 0.1 0 0 0 1 
i 2.845939 319.2245 1.075751 42 70.11136 0 0.1 0 0 0 1 
i 2.907285 319.2245 1.075751 41 70.21199 0 0.1 0 0 0 1 
i 3.029976 319.2245 1.075751 43 70.41325 0 0.1 0 0 0 1 
i 3.214012 319.2245 1.075751 44 70.71514 0 0.1 0 0 0 1 
i 3.275357 319.2245 1.075751 39 70.81577 0 0.1 0 0 0 1 
i 3.459394 319.2245 1.075751 40 71.11765 0 0.1 0 0 0 1 
i 3.582084 319.2245 1.075751 38 71.31891 0 0.1 0 0 0 1 
i 3.64343 319.2245 1.075751 37 71.41954 0 0.1 0 0 0 1 
i 6.950505 319.2245 1.075751 54 70.11136 0 0.1 0 0 0 1 
i 7.011851 319.2245 1.075751 53 70.21199 0 0.1 0 0 0 1 
i 7.134542 319.2245 1.075751 55 70.41325 0 0.1 0 0 0 1 
i 7.318578 319.2245 0.5378755 56 70.71514 0 0.1 0 0 0 1 
i 7.379923 319.2245 0.5378755 51 70.81577 0 0.1 0 0 0 1 
i 7.56396 319.2245 0.5378755 52 71.11765 0 0.1 0 0 0 1 
i 7.68665 319.2245 0.5378755 50 71.31891 0 0.1 0 0 0 1 
i 7.747996 319.2245 1.075751 49 71.41954 0 0.1 0 0 0 1 
i 11.05507 319.2245 1.075751 65 70.11136 0 0.1 0 0 0 1 
i 11.11642 319.2245 1.075751 64 70.21199 0 0.1 0 0 0 1 
i 11.23911 319.2245 1.075751 66 70.41325 0 0.1 0 0 0 1 
i 11.42314 319.2245 1.075751 67 70.71514 0 0.1 0 0 0 1 
i 11.48449 319.2245 0.5378755 62 70.81577 0 0.1 0 0 0 1 
i 11.66853 319.2245 1.075751 63 71.11765 0 0.1 0 0 0 1 
i 11.79122 319.2245 1.075751 61 71.31891 0 0.1 0 0 0 1 
i 11.85256 319.2245 1.075751 60 71.41954 0 0.1 0 0 0 1 
i 15.15964 319.2245 1.075751 77 70.11136 0 0.1 0 0 0 1 
i 15.22098 319.2245 1.075751 76 70.21199 0 0.1 0 0 0 1 
i 15.34367 319.2245 1.075751 78 70.41325 0 0.1 0 0 0 1 
i 15.52771 319.2245 0.5378755 79 70.71514 0 0.1 0 0 0 1 
i 15.58906 319.2245 1.075751 74 70.81577 0 0.1 0 0 0 1 
i 15.77309 319.2245 0.5378755 75 71.11765 0 0.1 0 0 0 1 
i 15.89578 319.2245 1.075751 73 71.31891 0 0.1 0 0 0 1 
i 15.95713 319.2245 1.075751 72 71.41954 0 0.1 0 0 0 1 
i 7.073196 319.7623 0.5378755 52 70.31262 0 0.1 0 0 0 1 
i 7.441269 319.7623 0.5378755 50 70.91639 0 0.1 0 0 0 1 
i 7.502614 319.7623 0.5378755 51 71.01702 0 0.1 0 0 0 1 
i 7.809341 319.7623 0.5378755 48 71.52017 0 0.1 0 0 0 1 
i 11.54583 319.7623 0.5378755 62 70.91639 0 0.1 0 0 0 1 
i 15.28233 319.7623 0.5378755 75 70.31262 0 0.1 0 0 0 1 
i 16.01847 319.7623 0.5378755 71 71.52017 0 0.1 0 0 0 1 
i 1.061345 319.9592 1.075751 52 70.10197 0 0.1 0 0 0 1 
i 1.245382 319.9592 0.5378755 54 70.40386 0 0.1 0 0 0 1 
i 1.490763 319.9592 0.5378755 50 70.80637 0 0.1 0 0 0 1 
i 1.79749 319.9592 0.5378755 47 71.30952 0 0.1 0 0 0 1 
i 1.981527 319.9592 1.075751 59 71.6114 0 0.1 0 0 0 1 
i 2.288254 319.9592 1.075751 56 72.11455 0 0.1 0 0 0 1 
i 2.533635 319.9592 0.5378755 60 72.51706 0 0.1 0 0 0 1 
i 2.717672 319.9592 0.5378755 63 72.81895 0 0.1 0 0 0 1 
i 5.165911 319.9592 0.5378755 63 70.10197 0 0.1 0 0 0 1 
i 5.349948 319.9592 1.075751 66 70.40386 0 0.1 0 0 0 1 
i 5.595329 319.9592 1.075751 62 70.80637 0 0.1 0 0 0 1 
i 5.902056 319.9592 1.075751 59 71.30952 0 0.1 0 0 0 1 
i 6.086093 319.9592 0.5378755 70 71.6114 0 0.1 0 0 0 1 
i 6.39282 319.9592 0.5378755 67 72.11455 0 0.1 0 0 0 1 
i 6.638201 319.9592 1.075751 72 72.51706 0 0.1 0 0 0 1 
i 6.822238 319.9592 0.5378755 74 72.81895 0 0.1 0 0 0 1 
i 9.270478 319.9592 1.075751 75 70.10197 0 0.1 0 0 0 1 
i 9.454514 319.9592 0.5378755 77 70.40386 0 0.1 0 0 0 1 
i 9.699895 319.9592 0.5378755 73 70.80637 0 0.1 0 0 0 1 
i 10.00662 319.9592 0.5378755 70 71.30952 0 0.1 0 0 0 1 
i 10.19066 319.9592 1.075751 82 71.6114 0 0.1 0 0 0 1 
i 10.49739 319.9592 1.075751 79 72.11455 0 0.1 0 0 0 1 
i 10.74277 319.9592 0.5378755 83 72.51706 0 0.1 0 0 0 1 
i 10.9268 319.9592 0.5378755 86 72.81895 0 0.1 0 0 0 1 
i 13.37504 319.9592 0.5378755 86 70.10197 0 0.1 0 0 0 1 
i 13.55908 319.9592 1.075751 89 70.40386 0 0.1 0 0 0 1 
i 13.80446 319.9592 1.075751 85 70.80637 0 0.1 0 0 0 1 
i 14.11119 319.9592 1.075751 82 71.30952 0 0.1 0 0 0 1 
i 14.29522 319.9592 0.5378755 93 71.6114 0 0.1 0 0 0 1 
i 14.60195 319.9592 0.5378755 90 72.11455 0 0.1 0 0 0 1 
i 14.84733 319.9592 1.075751 95 72.51706 0 0.1 0 0 0 1 
i 15.03137 319.9592 0.5378755 97 72.81895 0 0.1 0 0 0 1 
i 1.306727 320.4971 0.5378755 55 70.50449 0 0.1 0 0 0 1 
i 1.552109 320.4971 0.5378755 51 70.907 0 0.1 0 0 0 1 
i 1.736145 320.4971 0.5378755 48 71.20889 0 0.1 0 0 0 1 
i 2.47229 320.4971 0.5378755 61 72.41644 0 0.1 0 0 0 1 
i 2.779017 320.4971 0.5378755 64 72.91958 0 0.1 0 0 0 1 
i 5.104566 320.4971 0.5378755 64 70.00134 0 0.1 0 0 0 1 
i 6.147438 320.4971 0.5378755 71 71.71203 0 0.1 0 0 0 1 
i 6.331474 320.4971 0.5378755 68 72.01392 0 0.1 0 0 0 1 
i 6.883583 320.4971 0.5378755 75 72.91958 0 0.1 0 0 0 1 
i 9.515859 320.4971 0.5378755 78 70.50449 0 0.1 0 0 0 1 
i 9.761241 320.4971 0.5378755 74 70.907 0 0.1 0 0 0 1 
i 9.945277 320.4971 0.5378755 71 71.20889 0 0.1 0 0 0 1 
i 10.68142 320.4971 0.5378755 84 72.41644 0 0.1 0 0 0 1 
i 10.98815 320.4971 0.5378755 87 72.91958 0 0.1 0 0 0 1 
i 13.3137 320.4971 0.5378755 87 70.00134 0 0.1 0 0 0 1 
i 14.35657 320.4971 0.5378755 94 71.71203 0 0.1 0 0 0 1 
i 14.54061 320.4971 0.5378755 91 72.01392 0 0.1 0 0 0 1 
i 15.09272 320.4971 2.036327 98 72.91958 0 0.1 0 0 0 1 
i 1.122691 321.4577 0.5378755 52 70.20193 0 0.1 0 0 0 1 
i 1.245382 321.4577 0.5378755 54 70.40319 0 0.1 0 0 0 1 
i 1.490763 321.4577 0.5378755 49 70.8057 0 0.1 0 0 0 1 
i 1.858836 321.4577 0.5378755 47 71.40948 0 0.1 0 0 0 1 
i 1.981527 321.4577 0.5378755 58 71.61073 0 0.1 0 0 0 1 
i 2.349599 321.4577 0.5378755 56 72.21451 0 0.1 0 0 0 1 
i 2.594981 321.4577 0.5378755 60 72.61702 0 0.1 0 0 0 1 
i 2.717672 321.4577 0.5378755 62 72.81828 0 0.1 0 0 0 1 
i 5.227257 321.4577 0.5378755 63 70.20193 0 0.1 0 0 0 1 
i 5.349948 321.4577 0.5378755 65 70.40319 0 0.1 0 0 0 1 
i 5.595329 321.4577 0.5378755 61 70.8057 0 0.1 0 0 0 1 
i 5.963402 321.4577 0.5378755 59 71.40948 0 0.1 0 0 0 1 
i 6.086093 321.4577 1.075751 69 71.61073 0 0.1 0 0 0 1 
i 6.454165 321.4577 0.5378755 67 72.21451 0 0.1 0 0 0 1 
i 6.699547 321.4577 0.5378755 72 72.61702 0 0.1 0 0 0 1 
i 6.822238 321.4577 0.5378755 74 72.81828 0 0.1 0 0 0 1 
i 9.331823 321.4577 0.5378755 75 70.20193 0 0.1 0 0 0 1 
i 9.454514 321.4577 0.5378755 77 70.40319 0 0.1 0 0 0 1 
i 9.699895 321.4577 1.075751 72 70.8057 0 0.1 0 0 0 1 
i 10.06797 321.4577 0.5378755 70 71.40948 0 0.1 0 0 0 1 
i 10.19066 321.4577 0.5378755 81 71.61073 0 0.1 0 0 0 1 
i 10.55873 321.4577 0.5378755 79 72.21451 0 0.1 0 0 0 1 
i 10.80411 321.4577 0.5378755 83 72.61702 0 0.1 0 0 0 1 
i 10.9268 321.4577 0.5378755 85 72.81828 0 0.1 0 0 0 1 
i 13.43639 321.4577 0.5378755 86 70.20193 0 0.1 0 0 0 1 
i 13.55908 321.4577 0.5378755 88 70.40319 0 0.1 0 0 0 1 
i 13.80446 321.4577 0.5378755 84 70.8057 0 0.1 0 0 0 1 
i 14.17253 321.4577 0.5378755 82 71.40948 0 0.1 0 0 0 1 
i 14.29522 321.4577 0.5378755 92 71.61073 0 0.1 0 0 0 1 
i 14.6633 321.4577 0.5378755 90 72.21451 0 0.1 0 0 0 1 
i 14.90868 321.4577 0.5378755 95 72.61702 0 0.1 0 0 0 1 
i 15.03137 321.4577 0.5378755 97 72.81828 0 0.1 0 0 0 1 
i 3.766121 321.9607 0.5378755 42 71.62013 0 0.1 0 0 0 1 
i 7.870687 321.9607 0.5378755 54 71.62013 0 0.1 0 0 0 1 
i 11.97525 321.9607 0.5378755 65 71.62013 0 0.1 0 0 0 1 
i 16.07982 321.9607 0.5378755 77 71.62013 0 0.1 0 0 0 1 
i 1 321.9956 0.5378755 53 70.00067 0 0.1 0 0 0 1 
i 1.368072 321.9956 0.5378755 55 70.60444 0 0.1 0 0 0 1 
i 1.613454 321.9956 0.5378755 51 71.00696 0 0.1 0 0 0 1 
i 1.736145 321.9956 0.5378755 49 71.20822 0 0.1 0 0 0 1 
i 2.104217 321.9956 0.5378755 59 71.81199 0 0.1 0 0 0 1 
i 2.226908 321.9956 0.5378755 57 72.01325 0 0.1 0 0 0 1 
i 2.47229 321.9956 0.5378755 61 72.41577 0 0.1 0 0 0 1 
i 2.840362 321.9956 0.5378755 64 73.01954 0 0.1 0 0 0 1 
i 5.104566 321.9956 0.5378755 64 70.00067 0 0.1 0 0 0 1 
i 5.472639 321.9956 0.5378755 66 70.60444 0 0.1 0 0 0 1 
i 5.71802 321.9956 0.5378755 62 71.00696 0 0.1 0 0 0 1 
i 5.840711 321.9956 0.5378755 60 71.20822 0 0.1 0 0 0 1 
i 6.208784 321.9956 0.5378755 71 71.81199 0 0.1 0 0 0 1 
i 6.576856 321.9956 0.5378755 73 72.41577 0 0.1 0 0 0 1 
i 6.944929 321.9956 0.5378755 75 73.01954 0 0.1 0 0 0 1 
i 9.209132 321.9956 0.5378755 76 70.00067 0 0.1 0 0 0 1 
i 9.577205 321.9956 0.5378755 78 70.60444 0 0.1 0 0 0 1 
i 9.822586 321.9956 0.5378755 74 71.00696 0 0.1 0 0 0 1 
i 10.31335 321.9956 0.5378755 82 71.81199 0 0.1 0 0 0 1 
i 10.43604 321.9956 0.5378755 80 72.01325 0 0.1 0 0 0 1 
i 10.68142 321.9956 0.5378755 84 72.41577 0 0.1 0 0 0 1 
i 11.04949 321.9956 0.5378755 87 73.01954 0 0.1 0 0 0 1 
i 13.3137 321.9956 0.5378755 87 70.00067 0 0.1 0 0 0 1 
i 13.68177 321.9956 0.5378755 89 70.60444 0 0.1 0 0 0 1 
i 13.92715 321.9956 0.5378755 85 71.00696 0 0.1 0 0 0 1 
i 14.04984 321.9956 0.5378755 83 71.20822 0 0.1 0 0 0 1 
i 14.41792 321.9956 0.5378755 94 71.81199 0 0.1 0 0 0 1 
i 14.54061 321.9956 0.5378755 92 72.01325 0 0.1 0 0 0 1 
i 14.78599 321.9956 0.5378755 96 72.41577 0 0.1 0 0 0 1 
i 2.784594 322.4986 0.5378755 48 70.01006 0 0.1 0 0 0 1 
i 6.88916 322.4986 0.5378755 59 70.01006 0 0.1 0 0 0 1 
i 10.99373 322.4986 0.5378755 71 70.01006 0 0.1 0 0 0 1 
i 15.09829 322.4986 0.5378755 82 70.01006 0 0.1 0 0 0 1 
i 1.061345 322.8508 1.075751 53 70.10063 0 0.1 0 0 0 1 
i 1.122691 322.8508 1.075751 52 70.20126 0 0.1 0 0 0 1 
i 1.245382 322.8508 0.5378755 54 70.40252 0 0.1 0 0 0 1 
i 1.429418 322.8508 1.075751 55 70.7044 0 0.1 0 0 0 1 
i 1.490763 322.8508 0.5378755 50 70.80503 0 0.1 0 0 0 1 
i 1.6748 322.8508 0.5378755 51 71.10692 0 0.1 0 0 0 1 
i 1.79749 322.8508 1.075751 49 71.30818 0 0.1 0 0 0 1 
i 1.858836 322.8508 1.075751 48 71.40881 0 0.1 0 0 0 1 
i 1.981527 322.8508 1.075751 58 71.61006 0 0.1 0 0 0 1 
i 2.165563 322.8508 1.075751 59 71.91195 0 0.1 0 0 0 1 
i 2.288254 322.8508 1.075751 57 72.11321 0 0.1 0 0 0 1 
i 2.349599 322.8508 1.075751 56 72.21384 0 0.1 0 0 0 1 
i 2.533635 322.8508 1.075751 62 72.51572 0 0.1 0 0 0 1 
i 2.594981 322.8508 1.075751 60 72.61635 0 0.1 0 0 0 1 
i 2.717672 322.8508 1.075751 63 72.81761 0 0.1 0 0 0 1 
i 2.901708 322.8508 0.5378755 64 73.1195 0 0.1 0 0 0 1 
i 5.165911 322.8508 1.075751 64 70.10063 0 0.1 0 0 0 1 
i 5.227257 322.8508 1.075751 63 70.20126 0 0.1 0 0 0 1 
i 5.349948 322.8508 1.075751 66 70.40252 0 0.1 0 0 0 1 
i 5.533984 322.8508 0.5378755 67 70.7044 0 0.1 0 0 0 1 
i 5.595329 322.8508 1.075751 61 70.80503 0 0.1 0 0 0 1 
i 5.779366 322.8508 1.075751 62 71.10692 0 0.1 0 0 0 1 
i 5.902056 322.8508 1.075751 60 71.30818 0 0.1 0 0 0 1 
i 5.963402 322.8508 1.075751 59 71.40881 0 0.1 0 0 0 1 
i 6.086093 322.8508 1.075751 70 71.61006 0 0.1 0 0 0 1 
i 6.270129 322.8508 0.5378755 71 71.91195 0 0.1 0 0 0 1 
i 6.39282 322.8508 1.075751 69 72.11321 0 0.1 0 0 0 1 
i 6.454165 322.8508 1.075751 68 72.21384 0 0.1 0 0 0 1 
i 6.638201 322.8508 0.5378755 73 72.51572 0 0.1 0 0 0 1 
i 6.699547 322.8508 1.075751 72 72.61635 0 0.1 0 0 0 1 
i 6.822238 322.8508 1.075751 74 72.81761 0 0.1 0 0 0 1 
i 7.006274 322.8508 1.075751 75 73.1195 0 0.1 0 0 0 1 
i 9.270478 322.8508 0.5378755 76 70.10063 0 0.1 0 0 0 1 
i 9.331823 322.8508 1.075751 75 70.20126 0 0.1 0 0 0 1 
i 9.454514 322.8508 0.5378755 77 70.40252 0 0.1 0 0 0 1 
i 9.63855 322.8508 1.075751 78 70.7044 0 0.1 0 0 0 1 
i 9.699895 322.8508 1.075751 73 70.80503 0 0.1 0 0 0 1 
i 9.883932 322.8508 0.5378755 74 71.10692 0 0.1 0 0 0 1 
i 10.00662 322.8508 1.075751 72 71.30818 0 0.1 0 0 0 1 
i 10.06797 322.8508 1.075751 71 71.40881 0 0.1 0 0 0 1 
i 10.19066 322.8508 1.075751 81 71.61006 0 0.1 0 0 0 1 
i 10.3747 322.8508 1.075751 82 71.91195 0 0.1 0 0 0 1 
i 10.49739 322.8508 1.075751 80 72.11321 0 0.1 0 0 0 1 
i 10.55873 322.8508 1.075751 79 72.21384 0 0.1 0 0 0 1 
i 10.74277 322.8508 1.075751 85 72.51572 0 0.1 0 0 0 1 
i 10.80411 322.8508 1.075751 83 72.61635 0 0.1 0 0 0 1 
i 10.9268 322.8508 1.075751 86 72.81761 0 0.1 0 0 0 1 
i 11.11084 322.8508 0.5378755 87 73.1195 0 0.1 0 0 0 1 
i 13.37504 322.8508 1.075751 87 70.10063 0 0.1 0 0 0 1 
i 13.43639 322.8508 1.075751 86 70.20126 0 0.1 0 0 0 1 
i 13.55908 322.8508 1.075751 89 70.40252 0 0.1 0 0 0 1 
i 13.74312 322.8508 0.5378755 90 70.7044 0 0.1 0 0 0 1 
i 13.80446 322.8508 1.075751 84 70.80503 0 0.1 0 0 0 1 
i 13.9885 322.8508 1.075751 85 71.10692 0 0.1 0 0 0 1 
i 14.11119 322.8508 1.075751 83 71.30818 0 0.1 0 0 0 1 
i 14.17253 322.8508 1.075751 82 71.40881 0 0.1 0 0 0 1 
i 14.29522 322.8508 1.075751 93 71.61006 0 0.1 0 0 0 1 
i 14.47926 322.8508 0.5378755 94 71.91195 0 0.1 0 0 0 1 
i 14.60195 322.8508 0.5378755 92 72.11321 0 0.1 0 0 0 1 
i 14.6633 322.8508 1.075751 91 72.21384 0 0.1 0 0 0 1 
i 14.84733 322.8508 0.5378755 96 72.51572 0 0.1 0 0 0 1 
i 14.90868 322.8508 1.075751 95 72.61635 0 0.1 0 0 0 1 
i 15.03137 322.8508 1.075751 97 72.81761 0 0.1 0 0 0 1 
i 15.21541 322.8508 1.075751 98 73.1195 0 0.1 0 0 0 1 
i 1.184036 323.3887 0.5378755 51 70.30189 0 0.1 0 0 0 1 
i 1.613454 323.3887 0.5378755 50 71.00629 0 0.1 0 0 0 1 
i 1.920181 323.3887 0.5378755 47 71.50943 0 0.1 0 0 0 1 
i 2.47229 323.3887 0.5378755 61 72.41509 0 0.1 0 0 0 1 
i 5.411293 323.3887 0.5378755 65 70.50314 0 0.1 0 0 0 1 
i 6.515511 323.3887 0.5378755 67 72.31447 0 0.1 0 0 0 1 
i 6.760892 323.3887 0.5378755 71 72.71698 0 0.1 0 0 0 1 
i 9.393168 323.3887 0.5378755 74 70.30189 0 0.1 0 0 0 1 
i 9.515859 323.3887 0.5378755 76 70.50314 0 0.1 0 0 0 1 
i 10.12931 323.3887 0.5378755 70 71.50943 0 0.1 0 0 0 1 
i 10.68142 323.3887 0.5378755 84 72.41509 0 0.1 0 0 0 1 
i 13.62043 323.3887 0.5378755 88 70.50314 0 0.1 0 0 0 1 
i 14.35657 323.3887 0.5378755 92 71.71069 0 0.1 0 0 0 1 
i 14.72464 323.3887 0.5378755 90 72.31447 0 0.1 0 0 0 1 
i 14.97002 323.3887 0.5378755 94 72.71698 0 0.1 0 0 0 1 
i 2.845939 323.5734 1.075751 49 70.11002 0 0.1 0 0 0 1 
i 3.766121 323.5734 0.5378755 40 71.61945 0 0.1 0 0 0 1 
i 6.950505 323.5734 0.5378755 61 70.11002 0 0.1 0 0 0 1 
i 7.870687 323.5734 0.5378755 52 71.61945 0 0.1 0 0 0 1 
i 11.05507 323.5734 1.075751 72 70.11002 0 0.1 0 0 0 1 
i 11.97525 323.5734 0.5378755 63 71.61945 0 0.1 0 0 0 1 
i 15.15964 323.5734 0.5378755 84 70.11002 0 0.1 0 0 0 1 
i 16.07982 323.5734 0.5378755 75 71.61945 0 0.1 0 0 0 1 
i 3.827466 324.1113 0.5378755 39 71.72008 0 0.1 0 0 0 1 
i 6.88916 324.1113 0.5378755 60 70.00939 0 0.1 0 0 0 1 
i 7.932032 324.1113 0.5378755 51 71.72008 0 0.1 0 0 0 1 
i 12.0366 324.1113 0.5378755 62 71.72008 0 0.1 0 0 0 1 
i 15.09829 324.1113 0.5378755 83 70.00939 0 0.1 0 0 0 1 
i 16.14116 324.1113 1.652043 74 71.72008 0 0.1 0 0 0 1 
i 2.907285 325.2255 0.5378755 41 70.20998 0 0.1 0 0 0 1 
i 3.766121 325.2255 0.5378755 62 71.61878 0 0.1 0 0 0 1 
i 7.011851 325.2255 0.5378755 53 70.20998 0 0.1 0 0 0 1 
i 7.870687 325.2255 0.5378755 74 71.61878 0 0.1 0 0 0 1 
i 11.11642 325.2255 0.5378755 64 70.20998 0 0.1 0 0 0 1 
i 11.97525 325.2255 0.5378755 85 71.61878 0 0.1 0 0 0 1 
i 15.22098 325.2255 0.5378755 76 70.20998 0 0.1 0 0 0 1 
i 16.07982 325.2255 0.5378755 97 71.61878 0 0.1 0 0 0 1 
i 2.784594 325.7633 0.5378755 44 70.00872 0 0.1 0 0 0 1 
i 3.888811 325.7633 0.5378755 65 71.82004 0 0.1 0 0 0 1 
i 6.88916 325.7633 0.5378755 55 70.00872 0 0.1 0 0 0 1 
i 7.993377 325.7633 0.5378755 76 71.82004 0 0.1 0 0 0 1 
i 10.99373 325.7633 0.5378755 67 70.00872 0 0.1 0 0 0 1 
i 12.09794 325.7633 0.5378755 88 71.82004 0 0.1 0 0 0 1 
i 15.09829 325.7633 0.5378755 78 70.00872 0 0.1 0 0 0 1 
i 16.20251 325.7633 1.535913 99 71.82004 0 0.1 0 0 0 1 
i 2.845939 326.7614 0.5378755 51 70.10868 0 0.1 0 0 0 1 
i 2.907285 326.7614 0.5378755 53 70.20931 0 0.1 0 0 0 1 
i 3.766121 326.7614 0.5378755 32 71.61811 0 0.1 0 0 0 1 
i 3.950157 326.7614 0.5378755 30 71.92 0 0.1 0 0 0 1 
i 6.950505 326.7614 0.5378755 63 70.10868 0 0.1 0 0 0 1 
i 7.011851 326.7614 0.5378755 65 70.20931 0 0.1 0 0 0 1 
i 7.870687 326.7614 0.5378755 43 71.61811 0 0.1 0 0 0 1 
i 8.054723 326.7614 0.5378755 41 71.92 0 0.1 0 0 0 1 
i 11.05507 326.7614 0.5378755 74 70.10868 0 0.1 0 0 0 1 
i 11.11642 326.7614 0.5378755 76 70.20931 0 0.1 0 0 0 1 
i 11.97525 326.7614 0.5378755 55 71.61811 0 0.1 0 0 0 1 
i 12.15929 326.7614 0.5378755 53 71.92 0 0.1 0 0 0 1 
i 15.15964 326.7614 0.5378755 86 70.10868 0 0.1 0 0 0 1 
i 15.22098 326.7614 0.5378755 88 70.20931 0 0.1 0 0 0 1 
i 16.07982 326.7614 0.5378755 66 71.61811 0 0.1 0 0 0 1 
i 16.26386 326.7614 0.5378755 64 71.92 0 0.1 0 0 0 1 
i 2.784594 327.2993 0.5378755 52 70.00805 0 0.1 0 0 0 1 
i 2.96863 327.2993 0.5378755 54 70.30994 0 0.1 0 0 0 1 
i 3.827466 327.2993 0.5378755 33 71.71874 0 0.1 0 0 0 1 
i 3.888811 327.2993 0.5378755 31 71.81937 0 0.1 0 0 0 1 
i 6.88916 327.2993 0.5378755 64 70.00805 0 0.1 0 0 0 1 
i 7.073196 327.2993 0.5378755 66 70.30994 0 0.1 0 0 0 1 
i 7.932032 327.2993 0.5378755 44 71.71874 0 0.1 0 0 0 1 
i 7.993377 327.2993 0.5378755 42 71.81937 0 0.1 0 0 0 1 
i 10.99373 327.2993 0.5378755 75 70.00805 0 0.1 0 0 0 1 
i 11.17776 327.2993 0.5378755 77 70.30994 0 0.1 0 0 0 1 
i 12.0366 327.2993 0.5378755 56 71.71874 0 0.1 0 0 0 1 
i 12.09794 327.2993 0.5378755 54 71.81937 0 0.1 0 0 0 1 
i 15.09829 327.2993 0.5378755 87 70.00805 0 0.1 0 0 0 1 
i 15.28233 327.2993 0.5378755 89 70.30994 0 0.1 0 0 0 1 
i 16.14116 327.2993 0.5378755 67 71.71874 0 0.1 0 0 0 1 
i 16.20251 327.2993 1.768173 65 71.81937 0 0.1 0 0 0 1 
i 3.029976 328.5296 0.5378755 44 70.4099 0 0.1 0 0 0 1 
i 3.766121 328.5296 0.5378755 53 71.61744 0 0.1 0 0 0 1 
i 7.134542 328.5296 0.5378755 56 70.4099 0 0.1 0 0 0 1 
i 7.870687 328.5296 0.5378755 65 71.61744 0 0.1 0 0 0 1 
i 11.23911 328.5296 0.5378755 67 70.4099 0 0.1 0 0 0 1 
i 11.97525 328.5296 0.5378755 76 71.61744 0 0.1 0 0 0 1 
i 15.34367 328.5296 0.5378755 79 70.4099 0 0.1 0 0 0 1 
i 16.07982 328.5296 0.5378755 88 71.61744 0 0.1 0 0 0 1 
i 2.784594 329.0674 0.5378755 46 70.00738 0 0.1 0 0 0 1 
i 4.011502 329.0674 0.5378755 55 72.01996 0 0.1 0 0 0 1 
i 6.88916 329.0674 0.5378755 58 70.00738 0 0.1 0 0 0 1 
i 8.116068 329.0674 0.5378755 67 72.01996 0 0.1 0 0 0 1 
i 10.99373 329.0674 0.5378755 69 70.00738 0 0.1 0 0 0 1 
i 12.22063 329.0674 0.5378755 78 72.01996 0 0.1 0 0 0 1 
i 15.09829 329.0674 0.5378755 81 70.00738 0 0.1 0 0 0 1 
i 16.3252 329.0674 1.535913 90 72.01996 0 0.1 0 0 0 1 
i 2.845939 330.0655 0.5378755 46 70.10734 0 0.1 0 0 0 1 
i 3.029976 330.0655 0.5378755 43 70.40922 0 0.1 0 0 0 1 
i 3.766121 330.0655 1.075751 55 71.61677 0 0.1 0 0 0 1 
i 4.072848 330.0655 0.5378755 59 72.11992 0 0.1 0 0 0 1 
i 6.950505 330.0655 0.5378755 58 70.10734 0 0.1 0 0 0 1 
i 7.134542 330.0655 1.075751 54 70.40922 0 0.1 0 0 0 1 
i 7.870687 330.0655 0.5378755 67 71.61677 0 0.1 0 0 0 1 
i 8.177414 330.0655 1.075751 70 72.11992 0 0.1 0 0 0 1 
i 11.05507 330.0655 0.5378755 69 70.10734 0 0.1 0 0 0 1 
i 11.23911 330.0655 0.5378755 66 70.40922 0 0.1 0 0 0 1 
i 11.97525 330.0655 1.075751 78 71.61677 0 0.1 0 0 0 1 
i 12.28198 330.0655 0.5378755 82 72.11992 0 0.1 0 0 0 1 
i 15.15964 330.0655 0.5378755 81 70.10734 0 0.1 0 0 0 1 
i 15.34367 330.0655 1.075751 77 70.40922 0 0.1 0 0 0 1 
i 16.38655 330.0655 1.075751 93 72.11992 0 0.1 0 0 0 1 
i 2.784594 330.6033 0.5378755 45 70.00671 0 0.1 0 0 0 1 
i 3.091321 330.6033 0.5378755 42 70.50985 0 0.1 0 0 0 1 
i 4.011502 330.6033 0.5378755 58 72.01929 0 0.1 0 0 0 1 
i 6.88916 330.6033 0.5378755 57 70.00671 0 0.1 0 0 0 1 
i 7.932032 330.6033 0.5378755 66 71.7174 0 0.1 0 0 0 1 
i 10.99373 330.6033 0.5378755 68 70.00671 0 0.1 0 0 0 1 
i 11.30045 330.6033 0.5378755 65 70.50985 0 0.1 0 0 0 1 
i 12.22063 330.6033 0.5378755 81 72.01929 0 0.1 0 0 0 1 
i 15.09829 330.6033 0.5378755 80 70.00671 0 0.1 0 0 0 1 
i 16.14116 330.6033 1.573374 89 71.7174 0 0.1 0 0 0 1 
i 2.907285 331.6388 0.5378755 50 70.2073 0 0.1 0 0 0 1 
i 3.029976 331.6388 0.5378755 55 70.40855 0 0.1 0 0 0 1 
i 3.766121 331.6388 0.5378755 29 71.6161 0 0.1 0 0 0 1 
i 4.134193 331.6388 0.5378755 24 72.21987 0 0.1 0 0 0 1 
i 7.011851 331.6388 0.5378755 62 70.2073 0 0.1 0 0 0 1 
i 7.134542 331.6388 0.5378755 66 70.40855 0 0.1 0 0 0 1 
i 7.870687 331.6388 0.5378755 41 71.6161 0 0.1 0 0 0 1 
i 8.238759 331.6388 0.5378755 36 72.21987 0 0.1 0 0 0 1 
i 11.11642 331.6388 0.5378755 73 70.2073 0 0.1 0 0 0 1 
i 11.23911 331.6388 0.5378755 78 70.40855 0 0.1 0 0 0 1 
i 11.97525 331.6388 0.5378755 52 71.6161 0 0.1 0 0 0 1 
i 12.34333 331.6388 0.5378755 47 72.21987 0 0.1 0 0 0 1 
i 15.22098 331.6388 0.5378755 85 70.2073 0 0.1 0 0 0 1 
i 15.34367 331.6388 0.5378755 89 70.40855 0 0.1 0 0 0 1 
i 16.07982 331.6388 0.5378755 64 71.6161 0 0.1 0 0 0 1 
i 16.44789 331.6388 0.5378755 59 72.21987 0 0.1 0 0 0 1 
i 2.784594 332.1767 0.5378755 53 70.00604 0 0.1 0 0 0 1 
i 3.152666 332.1767 0.5378755 58 70.60981 0 0.1 0 0 0 1 
i 3.888811 332.1767 0.5378755 32 71.81736 0 0.1 0 0 0 1 
i 4.011502 332.1767 0.5378755 27 72.01862 0 0.1 0 0 0 1 
i 6.88916 332.1767 0.5378755 65 70.00604 0 0.1 0 0 0 1 
i 7.257232 332.1767 0.5378755 69 70.60981 0 0.1 0 0 0 1 
i 7.993377 332.1767 0.5378755 43 71.81736 0 0.1 0 0 0 1 
i 8.116068 332.1767 0.5378755 39 72.01862 0 0.1 0 0 0 1 
i 10.99373 332.1767 0.5378755 76 70.00604 0 0.1 0 0 0 1 
i 11.3618 332.1767 0.5378755 81 70.60981 0 0.1 0 0 0 1 
i 12.09794 332.1767 0.5378755 55 71.81736 0 0.1 0 0 0 1 
i 12.22063 332.1767 0.5378755 50 72.01862 0 0.1 0 0 0 1 
i 15.09829 332.1767 0.5378755 88 70.00604 0 0.1 0 0 0 1 
i 15.46636 332.1767 0.5378755 92 70.60981 0 0.1 0 0 0 1 
i 16.20251 332.1767 0.5378755 66 71.81736 0 0.1 0 0 0 1 
i 16.3252 332.1767 1.462774 62 72.01862 0 0.1 0 0 0 1 
i 2.845939 333.1016 0.5378755 43 70.106 0 0.1 0 0 0 1 
i 2.907285 333.1016 1.075751 44 70.20662 0 0.1 0 0 0 1 
i 3.029976 333.1016 0.5378755 41 70.40788 0 0.1 0 0 0 1 
i 3.214012 333.1016 1.075751 40 70.70977 0 0.1 0 0 0 1 
i 3.766121 333.1016 0.5378755 59 71.61543 0 0.1 0 0 0 1 
i 3.950157 333.1016 1.075751 58 71.91732 0 0.1 0 0 0 1 
i 4.072848 333.1016 1.075751 61 72.11857 0 0.1 0 0 0 1 
i 4.134193 333.1016 0.5378755 62 72.2192 0 0.1 0 0 0 1 
i 6.950505 333.1016 1.075751 54 70.106 0 0.1 0 0 0 1 
i 7.011851 333.1016 0.5378755 56 70.20662 0 0.1 0 0 0 1 
i 7.134542 333.1016 0.5378755 53 70.40788 0 0.1 0 0 0 1 
i 7.318578 333.1016 0.5378755 51 70.70977 0 0.1 0 0 0 1 
i 7.870687 333.1016 1.075751 71 71.61543 0 0.1 0 0 0 1 
i 8.054723 333.1016 0.5378755 69 71.91732 0 0.1 0 0 0 1 
i 8.177414 333.1016 0.5378755 72 72.11857 0 0.1 0 0 0 1 
i 8.238759 333.1016 1.075751 74 72.2192 0 0.1 0 0 0 1 
i 11.05507 333.1016 0.5378755 66 70.106 0 0.1 0 0 0 1 
i 11.11642 333.1016 1.075751 67 70.20662 0 0.1 0 0 0 1 
i 11.23911 333.1016 0.5378755 64 70.40788 0 0.1 0 0 0 1 
i 11.42314 333.1016 1.075751 63 70.70977 0 0.1 0 0 0 1 
i 11.97525 333.1016 0.5378755 82 71.61543 0 0.1 0 0 0 1 
i 12.15929 333.1016 1.075751 81 71.91732 0 0.1 0 0 0 1 
i 12.28198 333.1016 1.075751 84 72.11857 0 0.1 0 0 0 1 
i 12.34333 333.1016 0.5378755 85 72.2192 0 0.1 0 0 0 1 
i 15.15964 333.1016 1.075751 77 70.106 0 0.1 0 0 0 1 
i 15.22098 333.1016 0.5378755 79 70.20662 0 0.1 0 0 0 1 
i 15.34367 333.1016 0.5378755 76 70.40788 0 0.1 0 0 0 1 
i 15.52771 333.1016 0.5378755 74 70.70977 0 0.1 0 0 0 1 
i 16.07982 333.1016 1.075751 94 71.61543 0 0.1 0 0 0 1 
i 16.26386 333.1016 0.5378755 92 71.91732 0 0.1 0 0 0 1 
i 16.38655 333.1016 0.5378755 95 72.11857 0 0.1 0 0 0 1 
i 16.44789 333.1016 0.5378755 97 72.2192 0 0.1 0 0 0 1 
i 2.96863 333.6395 0.5378755 45 70.30725 0 0.1 0 0 0 1 
i 3.091321 333.6395 0.5378755 42 70.50851 0 0.1 0 0 0 1 
i 3.827466 333.6395 0.5378755 60 71.71606 0 0.1 0 0 0 1 
i 4.195539 333.6395 0.5378755 63 72.31983 0 0.1 0 0 0 1 
i 6.88916 333.6395 0.5378755 55 70.00537 0 0.1 0 0 0 1 
i 7.073196 333.6395 0.5378755 57 70.30725 0 0.1 0 0 0 1 
i 7.257232 333.6395 0.5378755 52 70.60914 0 0.1 0 0 0 1 
i 7.993377 333.6395 0.5378755 70 71.81669 0 0.1 0 0 0 1 
i 8.116068 333.6395 0.5378755 73 72.01795 0 0.1 0 0 0 1 
i 11.17776 333.6395 0.5378755 68 70.30725 0 0.1 0 0 0 1 
i 11.30045 333.6395 0.5378755 65 70.50851 0 0.1 0 0 0 1 
i 12.0366 333.6395 0.5378755 83 71.71606 0 0.1 0 0 0 1 
i 12.40467 333.6395 0.5378755 86 72.31983 0 0.1 0 0 0 1 
i 15.09829 333.6395 0.5378755 78 70.00537 0 0.1 0 0 0 1 
i 15.28233 333.6395 0.5378755 80 70.30725 0 0.1 0 0 0 1 
i 15.46636 333.6395 0.5378755 75 70.60914 0 0.1 0 0 0 1 
i 16.20251 333.6395 0.5378755 93 71.81669 0 0.1 0 0 0 1 
i 16.3252 333.6395 0.5378755 96 72.01795 0 0.1 0 0 0 1 
i 16.50924 333.6395 2.03611 97 72.31983 0 0.1 0 0 0 1 
i 3.275357 335.1377 0.5378755 51 70.80973 0 0.1 0 0 0 1 
i 3.766121 335.1377 0.5378755 42 71.61476 0 0.1 0 0 0 1 
i 7.379923 335.1377 0.5378755 62 70.80973 0 0.1 0 0 0 1 
i 7.870687 335.1377 0.5378755 53 71.61476 0 0.1 0 0 0 1 
i 11.48449 335.1377 0.5378755 74 70.80973 0 0.1 0 0 0 1 
i 11.97525 335.1377 0.5378755 65 71.61476 0 0.1 0 0 0 1 
i 15.58906 335.1377 0.5378755 85 70.80973 0 0.1 0 0 0 1 
i 16.07982 335.1377 0.5378755 76 71.61476 0 0.1 0 0 0 1 
i 2.784594 335.6756 0.5378755 47 70.0047 0 0.1 0 0 0 1 
i 4.256884 335.6756 0.5378755 38 72.41979 0 0.1 0 0 0 1 
i 6.88916 335.6756 0.5378755 58 70.0047 0 0.1 0 0 0 1 
i 8.36145 335.6756 0.5378755 49 72.41979 0 0.1 0 0 0 1 
i 10.99373 335.6756 0.5378755 70 70.0047 0 0.1 0 0 0 1 
i 12.46602 335.6756 0.5378755 61 72.41979 0 0.1 0 0 0 1 
i 15.09829 335.6756 0.5378755 81 70.0047 0 0.1 0 0 0 1 
i 16.57058 335.6756 1.535913 72 72.41979 0 0.1 0 0 0 1 
i 2.845939 336.6736 1.075751 46 70.10465 0 0.1 0 0 0 1 
i 3.275357 336.6736 1.075751 51 70.80906 0 0.1 0 0 0 1 
i 3.766121 336.6736 1.075751 43 71.61409 0 0.1 0 0 0 1 
i 4.318229 336.6736 1.075751 38 72.51975 0 0.1 0 0 0 1 
i 6.950505 336.6736 0.5378755 57 70.10465 0 0.1 0 0 0 1 
i 7.379923 336.6736 0.5378755 62 70.80906 0 0.1 0 0 0 1 
i 7.870687 336.6736 0.5378755 54 71.61409 0 0.1 0 0 0 1 
i 8.422795 336.6736 0.5378755 49 72.51975 0 0.1 0 0 0 1 
i 11.05507 336.6736 1.075751 69 70.10465 0 0.1 0 0 0 1 
i 11.48449 336.6736 0.5378755 74 70.80906 0 0.1 0 0 0 1 
i 11.97525 336.6736 1.075751 66 71.61409 0 0.1 0 0 0 1 
i 12.52736 336.6736 0.5378755 61 72.51975 0 0.1 0 0 0 1 
i 15.15964 336.6736 0.5378755 80 70.10465 0 0.1 0 0 0 1 
i 15.58906 336.6736 0.5378755 85 70.80906 0 0.1 0 0 0 1 
i 16.07982 336.6736 0.5378755 77 71.61409 0 0.1 0 0 0 1 
i 6.88916 337.2115 0.5378755 58 70.00403 0 0.1 0 0 0 1 
i 7.441269 337.2115 0.5378755 63 70.90969 0 0.1 0 0 0 1 
i 7.932032 337.2115 0.5378755 55 71.71472 0 0.1 0 0 0 1 
i 8.36145 337.2115 0.5378755 50 72.41912 0 0.1 0 0 0 1 
i 11.54583 337.2115 0.5378755 74 70.90969 0 0.1 0 0 0 1 
i 12.46602 337.2115 0.5378755 61 72.41912 0 0.1 0 0 0 1 
i 15.09829 337.2115 0.5378755 81 70.00403 0 0.1 0 0 0 1 
i 15.6504 337.2115 0.5378755 86 70.90969 0 0.1 0 0 0 1 
i 16.14116 337.2115 0.5378755 78 71.71472 0 0.1 0 0 0 1 
i 16.57058 337.2115 1.573374 73 72.41912 0 0.1 0 0 0 1 
i 2.907285 338.247 0.5378755 51 70.20461 0 0.1 0 0 0 1 
i 3.275357 338.247 0.5378755 40 70.80839 0 0.1 0 0 0 1 
i 3.766121 338.247 0.5378755 58 71.61342 0 0.1 0 0 0 1 
i 4.379575 338.247 0.5378755 70 72.61971 0 0.1 0 0 0 1 
i 7.011851 338.247 0.5378755 63 70.20461 0 0.1 0 0 0 1 
i 7.379923 338.247 0.5378755 51 70.80839 0 0.1 0 0 0 1 
i 7.870687 338.247 0.5378755 69 71.61342 0 0.1 0 0 0 1 
i 8.484141 338.247 0.5378755 81 72.61971 0 0.1 0 0 0 1 
i 11.11642 338.247 0.5378755 74 70.20461 0 0.1 0 0 0 1 
i 11.48449 338.247 0.5378755 63 70.80839 0 0.1 0 0 0 1 
i 11.97525 338.247 0.5378755 81 71.61342 0 0.1 0 0 0 1 
i 12.58871 338.247 0.5378755 93 72.61971 0 0.1 0 0 0 1 
i 15.22098 338.247 0.5378755 86 70.20461 0 0.1 0 0 0 1 
i 15.58906 338.247 0.5378755 74 70.80839 0 0.1 0 0 0 1 
i 16.07982 338.247 0.5378755 92 71.61342 0 0.1 0 0 0 1 
i 16.69327 338.247 0.5378755 104 72.61971 0 0.1 0 0 0 1 
i 2.784594 338.7849 0.5378755 49 70.00335 0 0.1 0 0 0 1 
i 3.398048 338.7849 0.5378755 37 71.00964 0 0.1 0 0 0 1 
i 3.888811 338.7849 0.5378755 55 71.81468 0 0.1 0 0 0 1 
i 4.256884 338.7849 0.5378755 67 72.41845 0 0.1 0 0 0 1 
i 6.88916 338.7849 0.5378755 60 70.00335 0 0.1 0 0 0 1 
i 7.502614 338.7849 0.5378755 49 71.00964 0 0.1 0 0 0 1 
i 7.993377 338.7849 0.5378755 67 71.81468 0 0.1 0 0 0 1 
i 8.36145 338.7849 0.5378755 78 72.41845 0 0.1 0 0 0 1 
i 10.99373 338.7849 0.5378755 72 70.00335 0 0.1 0 0 0 1 
i 11.60718 338.7849 0.5378755 60 71.00964 0 0.1 0 0 0 1 
i 12.09794 338.7849 0.5378755 78 71.81468 0 0.1 0 0 0 1 
i 12.46602 338.7849 0.5378755 90 72.41845 0 0.1 0 0 0 1 
i 15.09829 338.7849 0.5378755 83 70.00335 0 0.1 0 0 0 1 
i 15.71175 338.7849 0.5378755 72 71.00964 0 0.1 0 0 0 1 
i 16.20251 338.7849 0.5378755 90 71.81468 0 0.1 0 0 0 1 
i 16.57058 338.7849 1.462774 101 72.41845 0 0.1 0 0 0 1 
i 2.845939 339.7098 0.5378755 46 70.10331 0 0.1 0 0 0 1 
i 2.907285 339.7098 0.5378755 44 70.20394 0 0.1 0 0 0 1 
i 3.275357 339.7098 0.5378755 54 70.80771 0 0.1 0 0 0 1 
i 3.459394 339.7098 0.5378755 56 71.1096 0 0.1 0 0 0 1 
i 3.766121 339.7098 1.075751 40 71.61275 0 0.1 0 0 0 1 
i 3.950157 339.7098 0.5378755 42 71.91463 0 0.1 0 0 0 1 
i 4.318229 339.7098 1.075751 32 72.51841 0 0.1 0 0 0 1 
i 4.379575 339.7098 0.5378755 31 72.61904 0 0.1 0 0 0 1 
i 6.950505 339.7098 1.075751 57 70.10331 0 0.1 0 0 0 1 
i 7.011851 339.7098 0.5378755 56 70.20394 0 0.1 0 0 0 1 
i 7.379923 339.7098 1.075751 65 70.80771 0 0.1 0 0 0 1 
i 7.56396 339.7098 0.5378755 67 71.1096 0 0.1 0 0 0 1 
i 7.870687 339.7098 0.5378755 52 71.61275 0 0.1 0 0 0 1 
i 8.054723 339.7098 0.5378755 54 71.91463 0 0.1 0 0 0 1 
i 8.422795 339.7098 0.5378755 44 72.51841 0 0.1 0 0 0 1 
i 8.484141 339.7098 0.5378755 42 72.61904 0 0.1 0 0 0 1 
i 11.05507 339.7098 0.5378755 69 70.10331 0 0.1 0 0 0 1 
i 11.11642 339.7098 0.5378755 67 70.20394 0 0.1 0 0 0 1 
i 11.48449 339.7098 0.5378755 77 70.80771 0 0.1 0 0 0 1 
i 11.66853 339.7098 0.5378755 79 71.1096 0 0.1 0 0 0 1 
i 11.97525 339.7098 1.075751 63 71.61275 0 0.1 0 0 0 1 
i 12.15929 339.7098 0.5378755 65 71.91463 0 0.1 0 0 0 1 
i 12.52736 339.7098 0.5378755 55 72.51841 0 0.1 0 0 0 1 
i 12.58871 339.7098 0.5378755 54 72.61904 0 0.1 0 0 0 1 
i 15.15964 339.7098 1.075751 80 70.10331 0 0.1 0 0 0 1 
i 15.22098 339.7098 0.5378755 79 70.20394 0 0.1 0 0 0 1 
i 15.58906 339.7098 1.075751 88 70.80771 0 0.1 0 0 0 1 
i 15.77309 339.7098 0.5378755 90 71.1096 0 0.1 0 0 0 1 
i 16.07982 339.7098 0.5378755 75 71.61275 0 0.1 0 0 0 1 
i 16.26386 339.7098 0.5378755 77 71.91463 0 0.1 0 0 0 1 
i 16.63193 339.7098 0.5378755 67 72.51841 0 0.1 0 0 0 1 
i 16.69327 339.7098 0.5378755 65 72.61904 0 0.1 0 0 0 1 
i 2.784594 340.2477 0.5378755 45 70.00268 0 0.1 0 0 0 1 
i 2.96863 340.2477 0.5378755 43 70.30457 0 0.1 0 0 0 1 
i 3.336703 340.2477 0.5378755 53 70.90834 0 0.1 0 0 0 1 
i 3.398048 340.2477 0.5378755 55 71.00897 0 0.1 0 0 0 1 
i 3.888811 340.2477 0.5378755 41 71.814 0 0.1 0 0 0 1 
i 4.44092 340.2477 0.5378755 30 72.71966 0 0.1 0 0 0 1 
i 7.073196 340.2477 0.5378755 55 70.30457 0 0.1 0 0 0 1 
i 7.502614 340.2477 0.5378755 66 71.00897 0 0.1 0 0 0 1 
i 7.932032 340.2477 0.5378755 51 71.71338 0 0.1 0 0 0 1 
i 7.993377 340.2477 0.5378755 53 71.814 0 0.1 0 0 0 1 
i 8.36145 340.2477 0.5378755 43 72.41778 0 0.1 0 0 0 1 
i 8.545486 340.2477 0.5378755 41 72.71966 0 0.1 0 0 0 1 
i 10.99373 340.2477 0.5378755 68 70.00268 0 0.1 0 0 0 1 
i 11.17776 340.2477 0.5378755 66 70.30457 0 0.1 0 0 0 1 
i 11.54583 340.2477 0.5378755 76 70.90834 0 0.1 0 0 0 1 
i 11.60718 340.2477 0.5378755 78 71.00897 0 0.1 0 0 0 1 
i 12.09794 340.2477 0.5378755 64 71.814 0 0.1 0 0 0 1 
i 12.46602 340.2477 0.5378755 55 72.41778 0 0.1 0 0 0 1 
i 12.65005 340.2477 0.5378755 53 72.71966 0 0.1 0 0 0 1 
i 15.28233 340.2477 0.5378755 78 70.30457 0 0.1 0 0 0 1 
i 15.71175 340.2477 0.5378755 89 71.00897 0 0.1 0 0 0 1 
i 16.14116 340.2477 0.5378755 74 71.71338 0 0.1 0 0 0 1 
i 16.20251 340.2477 0.5378755 76 71.814 0 0.1 0 0 0 1 
i 16.57058 340.2477 0.5378755 66 72.41778 0 0.1 0 0 0 1 
i 16.75462 340.2477 1.683974 64 72.71966 0 0.1 0 0 0 1 
i 3.029976 341.3938 0.5378755 48 70.40453 0 0.1 0 0 0 1 
i 3.275357 341.3938 1.075751 47 70.80704 0 0.1 0 0 0 1 
i 3.766121 341.3938 1.075751 48 71.61208 0 0.1 0 0 0 1 
i 4.502266 341.3938 0.5378755 49 72.81962 0 0.1 0 0 0 1 
i 7.134542 341.3938 1.075751 59 70.40453 0 0.1 0 0 0 1 
i 7.379923 341.3938 0.5378755 58 70.80704 0 0.1 0 0 0 1 
i 7.870687 341.3938 1.075751 60 71.61208 0 0.1 0 0 0 1 
i 8.606832 341.3938 0.5378755 61 72.81962 0 0.1 0 0 0 1 
i 11.23911 341.3938 0.5378755 71 70.40453 0 0.1 0 0 0 1 
i 11.48449 341.3938 1.075751 70 70.80704 0 0.1 0 0 0 1 
i 11.97525 341.3938 1.075751 71 71.61208 0 0.1 0 0 0 1 
i 12.7114 341.3938 0.5378755 72 72.81962 0 0.1 0 0 0 1 
i 15.34367 341.3938 1.075751 82 70.40453 0 0.1 0 0 0 1 
i 15.58906 341.3938 1.075751 81 70.80704 0 0.1 0 0 0 1 
i 16.07982 341.3938 0.5378755 83 71.61208 0 0.1 0 0 0 1 
i 16.81596 341.3938 0.5378755 84 72.81962 0 0.1 0 0 0 1 
i 3.520739 341.9316 0.5378755 46 71.20956 0 0.1 0 0 0 1 
i 4.256884 341.9316 0.5378755 49 72.41711 0 0.1 0 0 0 1 
i 7.625305 341.9316 0.5378755 58 71.20956 0 0.1 0 0 0 1 
i 8.116068 341.9316 0.5378755 59 72.01459 0 0.1 0 0 0 1 
i 11.72987 341.9316 0.5378755 69 71.20956 0 0.1 0 0 0 1 
i 12.46602 341.9316 0.5378755 72 72.41711 0 0.1 0 0 0 1 
i 16.3252 341.9316 0.5378755 82 72.01459 0 0.1 0 0 0 1 
i 16.57058 341.9316 1.462774 83 72.41711 0 0.1 0 0 0 1 
i 2.845939 342.8565 0.5378755 45 70.10197 0 0.1 0 0 0 1 
i 3.029976 342.8565 0.5378755 51 70.40386 0 0.1 0 0 0 1 
i 3.275357 342.8565 0.5378755 43 70.80637 0 0.1 0 0 0 1 
i 3.582084 342.8565 0.5378755 38 71.30952 0 0.1 0 0 0 1 
i 3.766121 342.8565 0.5378755 58 71.6114 0 0.1 0 0 0 1 
i 4.072848 342.8565 0.5378755 53 72.11455 0 0.1 0 0 0 1 
i 4.318229 342.8565 0.5378755 61 72.51706 0 0.1 0 0 0 1 
i 4.502266 342.8565 0.5378755 66 72.81895 0 0.1 0 0 0 1 
i 6.950505 342.8565 0.5378755 57 70.10197 0 0.1 0 0 0 1 
i 7.134542 342.8565 0.5378755 62 70.40386 0 0.1 0 0 0 1 
i 7.379923 342.8565 0.5378755 54 70.80637 0 0.1 0 0 0 1 
i 7.68665 342.8565 0.5378755 49 71.30952 0 0.1 0 0 0 1 
i 7.870687 342.8565 0.5378755 70 71.6114 0 0.1 0 0 0 1 
i 8.177414 342.8565 0.5378755 65 72.11455 0 0.1 0 0 0 1 
i 8.422795 342.8565 0.5378755 72 72.51706 0 0.1 0 0 0 1 
i 8.606832 342.8565 0.5378755 77 72.81895 0 0.1 0 0 0 1 
i 11.05507 342.8565 0.5378755 68 70.10197 0 0.1 0 0 0 1 
i 11.23911 342.8565 0.5378755 74 70.40386 0 0.1 0 0 0 1 
i 11.48449 342.8565 0.5378755 66 70.80637 0 0.1 0 0 0 1 
i 11.79122 342.8565 0.5378755 61 71.30952 0 0.1 0 0 0 1 
i 11.97525 342.8565 0.5378755 81 71.6114 0 0.1 0 0 0 1 
i 12.28198 342.8565 0.5378755 76 72.11455 0 0.1 0 0 0 1 
i 12.52736 342.8565 0.5378755 84 72.51706 0 0.1 0 0 0 1 
i 12.7114 342.8565 0.5378755 89 72.81895 0 0.1 0 0 0 1 
i 15.15964 342.8565 0.5378755 80 70.10197 0 0.1 0 0 0 1 
i 15.34367 342.8565 0.5378755 85 70.40386 0 0.1 0 0 0 1 
i 15.58906 342.8565 0.5378755 77 70.80637 0 0.1 0 0 0 1 
i 15.89578 342.8565 0.5378755 72 71.30952 0 0.1 0 0 0 1 
i 16.07982 342.8565 0.5378755 93 71.6114 0 0.1 0 0 0 1 
i 16.38655 342.8565 0.5378755 88 72.11455 0 0.1 0 0 0 1 
i 16.63193 342.8565 0.5378755 95 72.51706 0 0.1 0 0 0 1 
i 16.81596 342.8565 0.5378755 100 72.81895 0 0.1 0 0 0 1 
i 2.784594 343.3944 0.5378755 46 70.00134 0 0.1 0 0 0 1 
i 3.091321 343.3944 0.5378755 52 70.50449 0 0.1 0 0 0 1 
i 3.336703 343.3944 0.5378755 44 70.907 0 0.1 0 0 0 1 
i 3.520739 343.3944 0.5378755 39 71.20889 0 0.1 0 0 0 1 
i 3.827466 343.3944 0.5378755 59 71.71203 0 0.1 0 0 0 1 
i 4.011502 343.3944 0.5378755 54 72.01392 0 0.1 0 0 0 1 
i 4.256884 343.3944 0.5378755 62 72.41644 0 0.1 0 0 0 1 
i 4.563611 343.3944 0.5378755 67 72.91958 0 0.1 0 0 0 1 
i 6.88916 343.3944 0.5378755 58 70.00134 0 0.1 0 0 0 1 
i 7.195887 343.3944 0.5378755 63 70.50449 0 0.1 0 0 0 1 
i 7.441269 343.3944 0.5378755 55 70.907 0 0.1 0 0 0 1 
i 7.625305 343.3944 0.5378755 50 71.20889 0 0.1 0 0 0 1 
i 7.932032 343.3944 0.5378755 71 71.71203 0 0.1 0 0 0 1 
i 8.116068 343.3944 0.5378755 66 72.01392 0 0.1 0 0 0 1 
i 8.36145 343.3944 0.5378755 73 72.41644 0 0.1 0 0 0 1 
i 8.668177 343.3944 0.5378755 78 72.91958 0 0.1 0 0 0 1 
i 10.99373 343.3944 0.5378755 69 70.00134 0 0.1 0 0 0 1 
i 11.30045 343.3944 0.5378755 75 70.50449 0 0.1 0 0 0 1 
i 11.54583 343.3944 0.5378755 67 70.907 0 0.1 0 0 0 1 
i 11.72987 343.3944 0.5378755 62 71.20889 0 0.1 0 0 0 1 
i 12.0366 343.3944 0.5378755 82 71.71203 0 0.1 0 0 0 1 
i 12.22063 343.3944 0.5378755 77 72.01392 0 0.1 0 0 0 1 
i 12.46602 343.3944 0.5378755 85 72.41644 0 0.1 0 0 0 1 
i 12.77274 343.3944 0.5378755 90 72.91958 0 0.1 0 0 0 1 
i 15.09829 343.3944 0.5378755 81 70.00134 0 0.1 0 0 0 1 
i 15.40502 343.3944 0.5378755 86 70.50449 0 0.1 0 0 0 1 
i 15.6504 343.3944 0.5378755 78 70.907 0 0.1 0 0 0 1 
i 15.83444 343.3944 0.5378755 73 71.20889 0 0.1 0 0 0 1 
i 16.14116 343.3944 0.5378755 94 71.71203 0 0.1 0 0 0 1 
i 16.3252 343.3944 0.5378755 89 72.01392 0 0.1 0 0 0 1 
i 16.57058 343.3944 0.5378755 96 72.41644 0 0.1 0 0 0 1 
i 16.87731 343.3944 1.498452 101 72.91958 0 0.1 0 0 0 1 
i 2.907285 344.355 0.5378755 49 70.20193 0 0.1 0 0 0 1 
i 3.029976 344.355 0.5378755 45 70.40319 0 0.1 0 0 0 1 
i 3.275357 344.355 0.5378755 54 70.8057 0 0.1 0 0 0 1 
i 3.64343 344.355 0.5378755 58 71.40948 0 0.1 0 0 0 1 
i 3.766121 344.355 0.5378755 36 71.61073 0 0.1 0 0 0 1 
i 4.134193 344.355 0.5378755 40 72.21451 0 0.1 0 0 0 1 
i 4.379575 344.355 0.5378755 32 72.61702 0 0.1 0 0 0 1 
i 4.502266 344.355 0.5378755 27 72.81828 0 0.1 0 0 0 1 
i 7.011851 344.355 0.5378755 61 70.20193 0 0.1 0 0 0 1 
i 7.134542 344.355 0.5378755 56 70.40319 0 0.1 0 0 0 1 
i 7.379923 344.355 0.5378755 65 70.8057 0 0.1 0 0 0 1 
i 7.747996 344.355 0.5378755 70 71.40948 0 0.1 0 0 0 1 
i 7.870687 344.355 0.5378755 48 71.61073 0 0.1 0 0 0 1 
i 8.238759 344.355 0.5378755 52 72.21451 0 0.1 0 0 0 1 
i 8.484141 344.355 0.5378755 43 72.61702 0 0.1 0 0 0 1 
i 8.606832 344.355 0.5378755 39 72.81828 0 0.1 0 0 0 1 
i 11.11642 344.355 0.5378755 72 70.20193 0 0.1 0 0 0 1 
i 11.23911 344.355 0.5378755 68 70.40319 0 0.1 0 0 0 1 
i 11.48449 344.355 0.5378755 77 70.8057 0 0.1 0 0 0 1 
i 11.85256 344.355 0.5378755 81 71.40948 0 0.1 0 0 0 1 
i 11.97525 344.355 0.5378755 59 71.61073 0 0.1 0 0 0 1 
i 12.34333 344.355 0.5378755 63 72.21451 0 0.1 0 0 0 1 
i 12.58871 344.355 0.5378755 55 72.61702 0 0.1 0 0 0 1 
i 12.7114 344.355 0.5378755 50 72.81828 0 0.1 0 0 0 1 
i 15.22098 344.355 0.5378755 84 70.20193 0 0.1 0 0 0 1 
i 15.34367 344.355 0.5378755 79 70.40319 0 0.1 0 0 0 1 
i 15.58906 344.355 0.5378755 88 70.8057 0 0.1 0 0 0 1 
i 15.95713 344.355 0.5378755 93 71.40948 0 0.1 0 0 0 1 
i 16.07982 344.355 0.5378755 71 71.61073 0 0.1 0 0 0 1 
i 16.44789 344.355 0.5378755 75 72.21451 0 0.1 0 0 0 1 
i 16.69327 344.355 0.5378755 66 72.61702 0 0.1 0 0 0 1 
i 16.81596 344.355 0.5378755 62 72.81828 0 0.1 0 0 0 1 
i 2.784594 344.8929 0.5378755 47 70.00067 0 0.1 0 0 0 1 
i 3.152666 344.8929 0.5378755 42 70.60444 0 0.1 0 0 0 1 
i 3.398048 344.8929 0.5378755 51 71.00696 0 0.1 0 0 0 1 
i 3.520739 344.8929 0.5378755 55 71.20822 0 0.1 0 0 0 1 
i 3.888811 344.8929 0.5378755 33 71.81199 0 0.1 0 0 0 1 
i 4.011502 344.8929 0.5378755 38 72.01325 0 0.1 0 0 0 1 
i 4.256884 344.8929 0.5378755 29 72.41577 0 0.1 0 0 0 1 
i 4.624956 344.8929 0.5378755 25 73.01954 0 0.1 0 0 0 1 
i 6.88916 344.8929 0.5378755 58 70.00067 0 0.1 0 0 0 1 
i 7.257232 344.8929 0.5378755 54 70.60444 0 0.1 0 0 0 1 
i 7.502614 344.8929 0.5378755 63 71.00696 0 0.1 0 0 0 1 
i 7.625305 344.8929 0.5378755 67 71.20822 0 0.1 0 0 0 1 
i 7.993377 344.8929 0.5378755 45 71.81199 0 0.1 0 0 0 1 
i 8.116068 344.8929 0.5378755 49 72.01325 0 0.1 0 0 0 1 
i 8.36145 344.8929 0.5378755 41 72.41577 0 0.1 0 0 0 1 
i 8.729522 344.8929 0.5378755 36 73.01954 0 0.1 0 0 0 1 
i 10.99373 344.8929 0.5378755 70 70.00067 0 0.1 0 0 0 1 
i 11.3618 344.8929 0.5378755 65 70.60444 0 0.1 0 0 0 1 
i 11.60718 344.8929 0.5378755 74 71.00696 0 0.1 0 0 0 1 
i 11.72987 344.8929 0.5378755 78 71.20822 0 0.1 0 0 0 1 
i 12.09794 344.8929 0.5378755 56 71.81199 0 0.1 0 0 0 1 
i 12.22063 344.8929 0.5378755 61 72.01325 0 0.1 0 0 0 1 
i 12.46602 344.8929 0.5378755 52 72.41577 0 0.1 0 0 0 1 
i 12.83409 344.8929 0.5378755 48 73.01954 0 0.1 0 0 0 1 
i 15.09829 344.8929 0.5378755 81 70.00067 0 0.1 0 0 0 1 
i 15.46636 344.8929 0.5378755 77 70.60444 0 0.1 0 0 0 1 
i 15.71175 344.8929 0.5378755 86 71.00696 0 0.1 0 0 0 1 
i 15.83444 344.8929 0.5378755 90 71.20822 0 0.1 0 0 0 1 
i 16.20251 344.8929 0.5378755 68 71.81199 0 0.1 0 0 0 1 
i 16.3252 344.8929 0.5378755 72 72.01325 0 0.1 0 0 0 1 
i 16.57058 344.8929 0.5378755 64 72.41577 0 0.1 0 0 0 1 
i 16.93865 344.8929 1.930994 59 73.01954 0 0.1 0 0 0 1 
i 2.845939 345.7481 1.075751 47 70.10063 0 0.1 0 0 0 1 
i 3.214012 345.7481 1.075751 48 70.7044 0 0.1 0 0 0 1 
i 3.582084 345.7481 1.075751 47 71.30818 0 0.1 0 0 0 1 
i 3.64343 345.7481 1.075751 46 71.40881 0 0.1 0 0 0 1 
i 3.766121 345.7481 1.075751 48 71.61006 0 0.1 0 0 0 1 
i 4.318229 345.7481 1.075751 49 72.51572 0 0.1 0 0 0 1 
i 4.502266 345.7481 1.075751 49 72.81761 0 0.1 0 0 0 1 
i 6.950505 345.7481 1.075751 59 70.10063 0 0.1 0 0 0 1 
i 7.379923 345.7481 1.075751 58 70.80503 0 0.1 0 0 0 1 
i 7.56396 345.7481 1.075751 58 71.10692 0 0.1 0 0 0 1 
i 7.870687 345.7481 1.075751 60 71.61006 0 0.1 0 0 0 1 
i 8.238759 345.7481 1.075751 59 72.21384 0 0.1 0 0 0 1 
i 8.606832 345.7481 1.075751 60 72.81761 0 0.1 0 0 0 1 
i 8.790868 345.7481 0.5378755 61 73.1195 0 0.1 0 0 0 1 
i 11.05507 345.7481 1.075751 70 70.10063 0 0.1 0 0 0 1 
i 11.42314 345.7481 1.075751 71 70.7044 0 0.1 0 0 0 1 
i 11.66853 345.7481 1.075751 70 71.10692 0 0.1 0 0 0 1 
i 11.85256 345.7481 1.075751 69 71.40881 0 0.1 0 0 0 1 
i 11.97525 345.7481 1.075751 71 71.61006 0 0.1 0 0 0 1 
i 12.52736 345.7481 1.075751 72 72.51572 0 0.1 0 0 0 1 
i 15.15964 345.7481 1.075751 82 70.10063 0 0.1 0 0 0 1 
i 15.52771 345.7481 1.075751 82 70.7044 0 0.1 0 0 0 1 
i 15.58906 345.7481 1.075751 81 70.80503 0 0.1 0 0 0 1 
i 16.07982 345.7481 1.075751 83 71.61006 0 0.1 0 0 0 1 
i 16.63193 345.7481 1.075751 83 72.51572 0 0.1 0 0 0 1 
i 17 345.7481 0.5378755 84 73.1195 0 0.1 0 0 0 1 
i 12.46602 346.286 0.5378755 72 72.41509 0 0.1 0 0 0 1 
i 12.65005 346.286 0.5378755 71 72.71698 0 0.1 0 0 0 1 
i 16.50924 346.286 0.5378755 82 72.31447 0 0.1 0 0 0 1 

</CsScore>
        </CsoundSynthesizer>
    