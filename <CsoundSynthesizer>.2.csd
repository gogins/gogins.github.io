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
          
i 2.784594 1 2.26007 47 70.1496 0 0.1 0 0 0 1 
i 2.845939 1.825735 3.767132 49 70.24956 0 0.1 0 0 0 1 
i 2.907285 3.406269 0.7171673 50 70.34952 0 0.1 0 0 0 1 
i 2.845939 4.8757 0.7171673 50 70.24822 0 0.1 0 0 0 1 
i 2.907285 4.8757 1.434335 51 70.34885 0 0.1 0 0 0 1 
i 2.96863 5.592867 1.691637 52 70.44948 0 0.1 0 0 0 1 
i 2.784594 7.284504 2.186598 49 70.14692 0 0.1 0 0 0 1 
i 2.845939 8.036768 1.434335 50 70.24688 0 0.1 0 0 0 1 
i 3.029976 8.036768 2.222438 53 70.54876 0 0.1 0 0 0 1 
i 2.907285 9.542038 0.7171673 50 70.34683 0 0.1 0 0 0 1 
i 4.569188 10.13549 0.7171673 62 74.40017 0 0.1 0 0 0 1 
i 2.784594 10.25921 0.7171673 52 70.14558 0 0.1 0 0 0 1 
i 3.152666 10.25921 2.116625 54 70.74935 0 0.1 0 0 0 1 
i 4.630533 10.89414 1.434335 63 74.50013 0 0.1 0 0 0 1 
i 2.845939 10.9415 1.434335 53 70.24553 0 0.1 0 0 0 1 
i 2.907285 10.9415 1.434335 51 70.34616 0 0.1 0 0 0 1 
i 3.214012 10.9415 0.7171673 55 70.84931 0 0.1 0 0 0 1 
i 2.784594 11.65866 1.464458 52 70.14491 0 0.1 0 0 0 1 
i 4.691879 12.40595 0.7171673 65 74.60008 0 0.1 0 0 0 1 
i 3.275357 12.88947 0.7171673 54 70.94927 0 0.1 0 0 0 1 
i 4.569188 13.12312 0.7171673 63 74.39883 0 0.1 0 0 0 1 
i 2.784594 13.60664 0.7171673 49 70.14423 0 0.1 0 0 0 1 
i 4.630533 13.8115 0.7171673 64 74.49878 0 0.1 0 0 0 1 
i 4.691879 13.8115 1.434335 65 74.59941 0 0.1 0 0 0 1 
i 2.845939 14.3589 0.7171673 48 70.24419 0 0.1 0 0 0 1 
i 3.275357 14.3589 0.7171673 54 70.9486 0 0.1 0 0 0 1 
i 4.753224 14.52866 0.7171673 66 74.70004 0 0.1 0 0 0 1 
i 2.784594 15.07607 0.7171673 49 70.14356 0 0.1 0 0 0 1 
i 3.336703 15.07607 0.7171673 55 71.04922 0 0.1 0 0 0 1 
i 4.81457 15.42958 0.7171673 66 74.8 0 0.1 0 0 0 1 
i 2.907285 15.86417 0.7171673 48 70.34415 0 0.1 0 0 0 1 
i 3.275357 15.86417 0.7171673 54 70.94792 0 0.1 0 0 0 1 
i 4.569188 16.14675 2.12271 64 74.39748 0 0.1 0 0 0 1 
i 2.784594 16.58134 1.399458 50 70.14289 0 0.1 0 0 0 1 
i 3.398048 16.58134 0.7171673 56 71.14918 0 0.1 0 0 0 1 
i 4.81457 16.83513 0.7171673 67 74.79933 0 0.1 0 0 0 1 
i 2.907285 17.26363 1.434335 49 70.34348 0 0.1 0 0 0 1 
i 3.275357 17.26363 1.434335 55 70.94725 0 0.1 0 0 0 1 
i 3.459394 17.26363 0.7171673 57 71.24914 0 0.1 0 0 0 1 
i 4.875915 17.55229 0.7171673 68 74.89996 0 0.1 0 0 0 1 
i 2.96863 17.9808 0.7171673 48 70.44411 0 0.1 0 0 0 1 
i 3.398048 17.9808 0.7171673 56 71.14851 0 0.1 0 0 0 1 
i 4.691879 18.27495 0.7171673 65 74.5974 0 0.1 0 0 0 1 
i 4.81457 18.27495 0.7171673 67 74.79866 0 0.1 0 0 0 1 
i 3.029976 18.87472 0.7171673 49 70.54407 0 0.1 0 0 0 1 
i 3.275357 18.87472 0.7171673 54 70.94658 0 0.1 0 0 0 1 
i 4.569188 18.99212 2.055779 66 74.39614 0 0.1 0 0 0 1 
i 4.93726 18.99212 2.055779 68 74.99992 0 0.1 0 0 0 1 
i 2.784594 19.59188 0.7171673 52 70.14155 0 0.1 0 0 0 1 
i 3.520739 19.59188 0.7171673 56 71.3491 0 0.1 0 0 0 1 
i 4.630533 19.61356 0.7171673 67 74.4961 0 0.1 0 0 0 1 
i 4.998606 19.61356 1.434335 69 75.09987 0 0.1 0 0 0 1 
i 1 19.96641 0.5378755 53 70.1496 0 0.1 0 0 0 1 
i 6.353782 20.14975 0.7171673 76 78.65073 0 0.1 0 0 0 1 
i 2.845939 20.27417 0.7171673 53 70.24151 0 0.1 0 0 0 1 
i 3.029976 20.27417 0.7171673 50 70.5434 0 0.1 0 0 0 1 
i 3.275357 20.27417 1.434335 54 70.94591 0 0.1 0 0 0 1 
i 3.582084 20.27417 1.434335 57 71.44906 0 0.1 0 0 0 1 
i 4.753224 20.33073 0.7171673 65 74.69736 0 0.1 0 0 0 1 
i 6.415127 20.9084 0.7171673 78 78.75069 0 0.1 0 0 0 1 
i 1.061345 20.97143 0.5378755 55 70.24956 0 0.1 0 0 0 1 
i 2.784594 20.99134 0.7171673 52 70.14088 0 0.1 0 0 0 1 
i 3.091321 20.99134 0.7171673 49 70.64403 0 0.1 0 0 0 1 
i 5.059951 21.47684 0.7171673 68 75.19983 0 0.1 0 0 0 1 
i 1 21.50931 0.5378755 54 70.14893 0 0.1 0 0 0 1 
i 6.353782 21.62557 0.7171673 77 78.65006 0 0.1 0 0 0 1 
i 2.907285 21.70776 0.7171673 53 70.34147 0 0.1 0 0 0 1 
i 3.029976 21.70776 0.7171673 51 70.54273 0 0.1 0 0 0 1 
i 3.275357 21.70776 0.7171673 55 70.94524 0 0.1 0 0 0 1 
i 3.64343 21.70776 0.7171673 58 71.54901 0 0.1 0 0 0 1 
i 4.569188 22.19401 2.12271 63 74.3948 0 0.1 0 0 0 1 
i 6.476473 22.42022 0.7171673 79 78.85065 0 0.1 0 0 0 1 
i 2.784594 22.42493 2.049984 52 70.14021 0 0.1 0 0 0 1 
i 3.152666 22.42493 1.332817 49 70.74398 0 0.1 0 0 0 1 
i 3.398048 22.42493 2.049984 54 71.1465 0 0.1 0 0 0 1 
i 3.520739 22.42493 0.7171673 56 71.34776 0 0.1 0 0 0 1 
i 1.122691 22.55197 0.5378755 56 70.34952 0 0.1 0 0 0 1 
i 5.059951 22.88239 1.434335 69 75.19916 0 0.1 0 0 0 1 
i 2.907285 23.04058 0.7171673 53 70.3408 0 0.1 0 0 0 1 
i 3.029976 23.04058 1.434335 51 70.54205 0 0.1 0 0 0 1 
i 3.275357 23.04058 1.434335 55 70.94457 0 0.1 0 0 0 1 
i 3.582084 23.04058 1.434335 57 71.44771 0 0.1 0 0 0 1 
i 3.64343 23.04058 1.434335 58 71.54834 0 0.1 0 0 0 1 
i 1 23.08984 0.5378755 55 70.14826 0 0.1 0 0 0 1 
i 6.353782 23.13738 0.7171673 77 78.64939 0 0.1 0 0 0 1 
i 3.152666 23.75775 0.7171673 50 70.74331 0 0.1 0 0 0 1 
i 3.336703 23.75775 0.7171673 56 71.0452 0 0.1 0 0 0 1 
i 6.415127 23.82576 0.7171673 78 78.74935 0 0.1 0 0 0 1 
i 6.476473 23.82576 0.7171673 80 78.84998 0 0.1 0 0 0 1 
i 1.061345 24.0214 1.075751 56 70.24822 0 0.1 0 0 0 1 
i 1.122691 24.0214 1.075751 57 70.34885 0 0.1 0 0 0 1 
i 4.691879 24.32221 0.7171673 63 74.59472 0 0.1 0 0 0 1 
i 5.059951 24.32221 0.7171673 69 75.19849 0 0.1 0 0 0 1 
i 6.353782 24.54293 0.7171673 79 78.64872 0 0.1 0 0 0 1 
i 6.537818 24.54293 0.7171673 80 78.95061 0 0.1 0 0 0 1 
i 4.569188 25.03938 2.055779 64 74.39346 0 0.1 0 0 0 1 
i 5.182642 25.03938 2.055779 70 75.39975 0 0.1 0 0 0 1 
i 6.599163 25.44385 0.7171673 81 79.05057 0 0.1 0 0 0 1 
i 3.766121 25.53374 0.7171673 53 71.74893 0 0.1 0 0 0 1 
i 4.691879 25.66082 0.7171673 63 74.59405 0 0.1 0 0 0 1 
i 5.243987 25.66082 0.7171673 71 75.49971 0 0.1 0 0 0 1 
i 1.245382 25.71304 0.5378755 57 70.54943 0 0.1 0 0 0 1 
i 6.353782 26.16101 1.405542 78 78.64805 0 0.1 0 0 0 1 
i 1 26.25091 0.5378755 55 70.14692 0 0.1 0 0 0 1 
i 2.784594 26.25091 0.7171673 45 70.13887 0 0.1 0 0 0 1 
i 4.753224 26.37799 0.7171673 62 74.69468 0 0.1 0 0 0 1 
i 5.121297 26.37799 0.7171673 69 75.29845 0 0.1 0 0 0 1 
i 6.599163 26.84939 0.7171673 81 79.0499 0 0.1 0 0 0 1 
i 2.845939 27.00318 1.434335 44 70.23883 0 0.1 0 0 0 1 
i 3.766121 27.00318 0.7171673 54 71.74826 0 0.1 0 0 0 1 
i 1.061345 27.18247 0.5378755 55 70.24688 0 0.1 0 0 0 1 
i 1.245382 27.18247 0.5378755 58 70.54876 0 0.1 0 0 0 1 
i 4.81457 27.20186 0.7171673 63 74.79463 0 0.1 0 0 0 1 
i 5.059951 27.20186 0.7171673 68 75.19715 0 0.1 0 0 0 1 
i 6.353782 27.56656 0.7171673 79 78.64738 0 0.1 0 0 0 1 
i 6.660509 27.56656 0.7171673 82 79.15052 0 0.1 0 0 0 1 
i 1 27.72034 0.5378755 56 70.14625 0 0.1 0 0 0 1 
i 1.306727 27.72034 0.5378755 59 70.64939 0 0.1 0 0 0 1 
i 3.827466 27.72034 0.7171673 55 71.84889 0 0.1 0 0 0 1 
i 4.569188 27.91903 0.7171673 66 74.39212 0 0.1 0 0 0 1 
i 5.305333 27.91903 0.7171673 71 75.59966 0 0.1 0 0 0 1 
i 2.784594 28.27727 0.5378755 67 74.40017 0 0.1 0 0 0 1 
i 6.476473 28.28921 0.7171673 79 78.84797 0 0.1 0 0 0 1 
i 6.599163 28.28921 0.7171673 81 79.04922 0 0.1 0 0 0 1 
i 2.907285 28.50845 0.7171673 43 70.33878 0 0.1 0 0 0 1 
i 3.766121 28.50845 0.7171673 54 71.74759 0 0.1 0 0 0 1 
i 4.630533 28.54047 0.7171673 67 74.49208 0 0.1 0 0 0 1 
i 4.81457 28.54047 0.7171673 64 74.79396 0 0.1 0 0 0 1 
i 5.059951 28.54047 0.7171673 69 75.19648 0 0.1 0 0 0 1 
i 5.366678 28.54047 0.7171673 72 75.69962 0 0.1 0 0 0 1 
i 1.122691 28.68774 0.5378755 56 70.34683 0 0.1 0 0 0 1 
i 1.245382 28.68774 0.5378755 58 70.54809 0 0.1 0 0 0 1 
i 8.138376 28.88804 0.7171673 90 82.9013 0 0.1 0 0 0 1 
i 6.353782 29.00638 1.338612 80 78.64671 0 0.1 0 0 0 1 
i 6.721854 29.00638 0.7171673 83 79.25048 0 0.1 0 0 0 1 
i 2.845939 29.21521 1.075751 69 74.50013 0 0.1 0 0 0 1 
i 1 29.22561 0.5378755 57 70.14558 0 0.1 0 0 0 1 
i 1.368072 29.22561 0.5378755 59 70.74935 0 0.1 0 0 0 1 
i 2.784594 29.22561 1.399458 44 70.13753 0 0.1 0 0 0 1 
i 3.888811 29.22561 0.7171673 56 71.94885 0 0.1 0 0 0 1 
i 4.569188 29.25764 0.7171673 66 74.39145 0 0.1 0 0 0 1 
i 4.875915 29.25764 0.7171673 63 74.89459 0 0.1 0 0 0 1 
i 5.121297 29.25764 0.7171673 68 75.29711 0 0.1 0 0 0 1 
i 5.305333 29.25764 0.7171673 71 75.59899 0 0.1 0 0 0 1 
i 8.199721 29.58253 0.7171673 92 83.00126 0 0.1 0 0 0 1 
i 6.415127 29.62783 1.434335 81 78.74667 0 0.1 0 0 0 1 
i 6.599163 29.62783 1.434335 82 79.04855 0 0.1 0 0 0 1 
i 6.7832 29.62783 0.7171673 84 79.35044 0 0.1 0 0 0 1 
i 2.907285 29.9079 1.434335 43 70.33811 0 0.1 0 0 0 1 
i 3.766121 29.9079 1.434335 55 71.74692 0 0.1 0 0 0 1 
i 3.950157 29.9079 0.7171673 57 72.04881 0 0.1 0 0 0 1 
i 4.691879 29.91173 0.7171673 67 74.59203 0 0.1 0 0 0 1 
i 4.81457 29.91173 0.7171673 65 74.79329 0 0.1 0 0 0 1 
i 5.059951 29.91173 0.7171673 70 75.19581 0 0.1 0 0 0 1 
i 5.428024 29.91173 0.7171673 72 75.79958 0 0.1 0 0 0 1 
i 1.061345 30.0872 0.5378755 58 70.24553 0 0.1 0 0 0 1 
i 1.122691 30.0872 1.075751 57 70.34616 0 0.1 0 0 0 1 
i 1.245382 30.0872 1.075751 59 70.54742 0 0.1 0 0 0 1 
i 1.429418 30.0872 1.075751 60 70.84931 0 0.1 0 0 0 1 
i 8.138376 30.29969 0.7171673 91 82.90063 0 0.1 0 0 0 1 
i 6.537818 30.34499 0.7171673 79 78.94792 0 0.1 0 0 0 1 
i 6.721854 30.34499 0.7171673 83 79.24981 0 0.1 0 0 0 1 
i 1.184036 30.62507 0.5378755 56 70.44679 0 0.1 0 0 0 1 
i 2.96863 30.62507 0.7171673 42 70.43874 0 0.1 0 0 0 1 
i 3.888811 30.62507 0.7171673 56 71.94818 0 0.1 0 0 0 1 
i 4.569188 30.6289 1.992036 66 74.39078 0 0.1 0 0 0 1 
i 4.93726 30.6289 1.992036 64 74.99455 0 0.1 0 0 0 1 
i 5.182642 30.6289 1.992036 68 75.39706 0 0.1 0 0 0 1 
i 5.305333 30.6289 1.992036 71 75.59832 0 0.1 0 0 0 1 
i 2.907285 30.72703 0.5378755 70 74.60008 0 0.1 0 0 0 1 
i 8.261067 31.02861 0.7171673 93 83.10122 0 0.1 0 0 0 1 
i 4.691879 31.1866 1.434335 67 74.59136 0 0.1 0 0 0 1 
i 4.81457 31.1866 0.7171673 65 74.79262 0 0.1 0 0 0 1 
i 5.059951 31.1866 1.434335 70 75.19514 0 0.1 0 0 0 1 
i 5.428024 31.1866 0.7171673 72 75.79891 0 0.1 0 0 0 1 
i 2.784594 31.2649 0.5378755 69 74.39883 0 0.1 0 0 0 1 
i 6.844545 31.49111 0.7171673 82 79.4504 0 0.1 0 0 0 1 
i 3.029976 31.51899 0.7171673 42 70.5387 0 0.1 0 0 0 1 
i 3.766121 31.51899 0.7171673 54 71.74625 0 0.1 0 0 0 1 
i 8.138376 31.74578 0.7171673 92 82.89996 0 0.1 0 0 0 1 
i 5.182642 31.90377 0.7171673 69 75.39639 0 0.1 0 0 0 1 
i 5.489369 31.90377 0.7171673 73 75.89954 0 0.1 0 0 0 1 
i 1.490763 32.03517 0.5378755 59 70.94927 0 0.1 0 0 0 1 
i 2.845939 32.13257 1.075751 70 74.49878 0 0.1 0 0 0 1 
i 2.907285 32.13257 1.075751 71 74.59941 0 0.1 0 0 0 1 
i 6.353782 32.20828 0.7171673 78 78.64537 0 0.1 0 0 0 1 
i 2.784594 32.23615 1.399458 45 70.13618 0 0.1 0 0 0 1 
i 4.011502 32.23615 0.7171673 56 72.14876 0 0.1 0 0 0 1 
i 8.199721 32.37304 1.434335 93 82.99992 0 0.1 0 0 0 1 
i 8.261067 32.37304 0.7171673 94 83.10055 0 0.1 0 0 0 1 
i 1 32.57305 0.5378755 55 70.14423 0 0.1 0 0 0 1 
i 6.415127 32.89665 1.434335 77 78.74532 0 0.1 0 0 0 1 
i 6.844545 32.89665 1.434335 83 79.44973 0 0.1 0 0 0 1 
i 3.029976 32.91844 0.7171673 42 70.53803 0 0.1 0 0 0 1 
i 3.766121 32.91844 1.434335 54 71.74558 0 0.1 0 0 0 1 
i 4.072848 32.91844 1.434335 57 72.24872 0 0.1 0 0 0 1 
i 8.322412 33.09021 0.7171673 95 83.20117 0 0.1 0 0 0 1 
i 1.061345 33.5046 0.5378755 54 70.24419 0 0.1 0 0 0 1 
i 1.490763 33.5046 0.5378755 60 70.9486 0 0.1 0 0 0 1 
i 5.550715 33.57137 0.7171673 68 75.9995 0 0.1 0 0 0 1 
i 2.784594 33.63561 0.7171673 44 70.13551 0 0.1 0 0 0 1 
i 3.091321 33.63561 0.7171673 41 70.63866 0 0.1 0 0 0 1 
i 3.029976 33.75066 0.5378755 72 74.8 0 0.1 0 0 0 1 
i 8.383757 33.92078 0.7171673 95 83.30113 0 0.1 0 0 0 1 
i 1 34.04248 0.5378755 55 70.14356 0 0.1 0 0 0 1 
i 1.552109 34.04248 0.5378755 60 71.04922 0 0.1 0 0 0 1 
i 2.784594 34.28853 0.5378755 69 74.39748 0 0.1 0 0 0 1 
i 4.569188 34.28853 0.7171673 60 74.38943 0 0.1 0 0 0 1 
i 6.476473 34.33647 0.7171673 77 78.84528 0 0.1 0 0 0 1 
i 6.844545 34.33647 0.7171673 83 79.44906 0 0.1 0 0 0 1 
i 2.907285 34.35204 0.7171673 45 70.3361 0 0.1 0 0 0 1 
i 3.029976 34.35204 0.7171673 42 70.53736 0 0.1 0 0 0 1 
i 3.766121 34.35204 0.7171673 55 71.74491 0 0.1 0 0 0 1 
i 4.134193 34.35204 0.7171673 58 72.34868 0 0.1 0 0 0 1 
i 8.138376 34.63795 1.344432 92 82.89862 0 0.1 0 0 0 1 
i 4.630533 34.97691 0.7171673 58 74.48939 0 0.1 0 0 0 1 
i 5.550715 34.97691 0.7171673 68 75.99883 0 0.1 0 0 0 1 
i 1.122691 35.00987 0.5378755 54 70.34415 0 0.1 0 0 0 1 
i 1.490763 35.00987 0.5378755 60 70.94792 0 0.1 0 0 0 1 
i 6.353782 35.05364 2.055779 78 78.64403 0 0.1 0 0 0 1 
i 6.967236 35.05364 1.338612 84 79.65031 0 0.1 0 0 0 1 
i 2.784594 35.0692 2.049984 43 70.13484 0 0.1 0 0 0 1 
i 3.152666 35.0692 0.7171673 41 70.73862 0 0.1 0 0 0 1 
i 3.888811 35.0692 1.332817 54 71.94616 0 0.1 0 0 0 1 
i 4.011502 35.0692 0.7171673 56 72.14742 0 0.1 0 0 0 1 
i 2.845939 35.1562 0.5378755 69 74.49744 0 0.1 0 0 0 1 
i 3.029976 35.1562 0.5378755 72 74.79933 0 0.1 0 0 0 1 
i 8.383757 35.26521 2.09439 96 83.30046 0 0.1 0 0 0 1 
i 1 35.54775 0.5378755 55 70.14289 0 0.1 0 0 0 1 
i 1.613454 35.54775 0.5378755 61 71.14918 0 0.1 0 0 0 1 
i 6.476473 35.67509 0.7171673 77 78.84461 0 0.1 0 0 0 1 
i 7.028581 35.67509 1.434335 85 79.75027 0 0.1 0 0 0 1 
i 2.907285 35.68485 1.434335 44 70.33543 0 0.1 0 0 0 1 
i 3.029976 35.68485 1.434335 42 70.53669 0 0.1 0 0 0 1 
i 3.214012 35.68485 0.7171673 40 70.83857 0 0.1 0 0 0 1 
i 3.766121 35.68485 1.434335 55 71.74423 0 0.1 0 0 0 1 
i 4.072848 35.68485 1.434335 57 72.24738 0 0.1 0 0 0 1 
i 4.134193 35.68485 1.434335 58 72.34801 0 0.1 0 0 0 1 
i 2.784594 35.69408 0.5378755 70 74.39681 0 0.1 0 0 0 1 
i 3.091321 35.69408 0.5378755 73 74.89996 0 0.1 0 0 0 1 
i 4.569188 35.69408 0.7171673 59 74.38876 0 0.1 0 0 0 1 
i 5.61206 35.69408 0.7171673 69 76.09945 0 0.1 0 0 0 1 
i 8.138376 35.98238 1.377223 93 82.89795 0 0.1 0 0 0 1 
i 6.537818 36.39225 0.7171673 77 78.94524 0 0.1 0 0 0 1 
i 6.905891 36.39225 0.7171673 83 79.54901 0 0.1 0 0 0 1 
i 3.152666 36.40202 0.7171673 41 70.73795 0 0.1 0 0 0 1 
i 3.827466 36.40202 0.7171673 56 71.84486 0 0.1 0 0 0 1 
i 1.061345 36.40933 0.5378755 56 70.24285 0 0.1 0 0 0 1 
i 1.122691 36.40933 1.075751 54 70.34348 0 0.1 0 0 0 1 
i 1.490763 36.40933 0.5378755 61 70.94725 0 0.1 0 0 0 1 
i 1.6748 36.40933 0.5378755 62 71.24914 0 0.1 0 0 0 1 
i 4.691879 36.41673 0.7171673 57 74.58935 0 0.1 0 0 0 1 
i 5.550715 36.41673 0.7171673 68 75.99816 0 0.1 0 0 0 1 
i 2.907285 36.59602 0.5378755 70 74.5974 0 0.1 0 0 0 1 
i 3.029976 36.59602 0.5378755 72 74.79866 0 0.1 0 0 0 1 
i 1 36.94721 0.5378755 55 70.14222 0 0.1 0 0 0 1 
i 1.552109 36.94721 0.5378755 60 71.04788 0 0.1 0 0 0 1 
i 1.613454 36.94721 0.5378755 61 71.14851 0 0.1 0 0 0 1 
i 2.784594 37.1339 0.5378755 71 74.39614 0 0.1 0 0 0 1 
i 3.152666 37.1339 0.5378755 74 74.99992 0 0.1 0 0 0 1 
i 4.569188 37.1339 0.7171673 59 74.38809 0 0.1 0 0 0 1 
i 5.673405 37.1339 2.055779 70 76.19941 0 0.1 0 0 0 1 
i 6.599163 37.21612 0.7171673 78 79.0452 0 0.1 0 0 0 1 
i 6.844545 37.21612 0.7171673 82 79.44771 0 0.1 0 0 0 1 
i 8.138376 37.3596 1.997579 95 82.89727 0 0.1 0 0 0 1 
i 8.506448 37.3596 0.7171673 97 83.50105 0 0.1 0 0 0 1 
i 3.275357 37.54007 0.7171673 42 70.93853 0 0.1 0 0 0 1 
i 3.766121 37.54007 0.7171673 52 71.74356 0 0.1 0 0 0 1 
i 4.630533 37.75534 1.434335 58 74.48805 0 0.1 0 0 0 1 
i 4.691879 37.75534 0.7171673 57 74.58868 0 0.1 0 0 0 1 
i 5.734751 37.75534 0.7171673 71 76.29937 0 0.1 0 0 0 1 
i 8.261067 37.92285 1.434335 94 83.09786 0 0.1 0 0 0 1 
i 8.383757 37.92285 0.7171673 97 83.29912 0 0.1 0 0 0 1 
i 8.567794 37.92285 0.7171673 98 83.60101 0 0.1 0 0 0 1 
i 6.353782 37.93329 0.7171673 80 78.64268 0 0.1 0 0 0 1 
i 7.089927 37.93329 0.7171673 85 79.85023 0 0.1 0 0 0 1 
i 2.845939 37.93464 1.075751 72 74.4961 0 0.1 0 0 0 1 
i 2.907285 37.93464 1.075751 71 74.59673 0 0.1 0 0 0 1 
i 3.029976 37.93464 1.075751 73 74.79799 0 0.1 0 0 0 1 
i 3.214012 37.93464 1.075751 74 75.09987 0 0.1 0 0 0 1 
i 1.245382 38.02041 0.5378755 55 70.54407 0 0.1 0 0 0 1 
i 1.490763 38.02041 0.5378755 59 70.94658 0 0.1 0 0 0 1 
i 2.784594 38.25724 0.7171673 47 70.1335 0 0.1 0 0 0 1 
i 4.256884 38.25724 0.7171673 56 72.5486 0 0.1 0 0 0 1 
i 4.569188 38.29153 0.5378755 82 78.65073 0 0.1 0 0 0 1 
i 4.753224 38.47251 0.7171673 56 74.68931 0 0.1 0 0 0 1 
i 5.61206 38.47251 0.7171673 69 76.09811 0 0.1 0 0 0 1 
i 6.415127 38.55473 1.434335 81 78.74264 0 0.1 0 0 0 1 
i 6.599163 38.55473 0.7171673 78 79.04453 0 0.1 0 0 0 1 
i 6.844545 38.55473 0.7171673 83 79.44704 0 0.1 0 0 0 1 
i 7.151272 38.55473 0.7171673 86 79.95019 0 0.1 0 0 0 1 
i 1 38.55829 0.5378755 57 70.14155 0 0.1 0 0 0 1 
i 1.736145 38.55829 0.5378755 61 71.3491 0 0.1 0 0 0 1 
i 8.445103 38.64001 0.7171673 96 83.39975 0 0.1 0 0 0 1 
i 8.506448 38.64001 0.7171673 97 83.50038 0 0.1 0 0 0 1 
i 2.845939 38.93953 0.7171673 48 70.23346 0 0.1 0 0 0 1 
i 3.275357 38.93953 0.7171673 42 70.93786 0 0.1 0 0 0 1 
i 3.766121 38.93953 1.434335 51 71.74289 0 0.1 0 0 0 1 
i 4.318229 38.93953 1.434335 57 72.64855 0 0.1 0 0 0 1 
i 4.630533 39.22948 1.075751 83 78.75069 0 0.1 0 0 0 1 
i 6.660509 39.2719 0.7171673 77 79.14516 0 0.1 0 0 0 1 
i 6.905891 39.2719 0.7171673 82 79.54767 0 0.1 0 0 0 1 
i 7.089927 39.2719 0.7171673 85 79.84956 0 0.1 0 0 0 1 
i 4.81457 39.29638 0.7171673 57 74.78927 0 0.1 0 0 0 1 
i 5.550715 39.29638 0.7171673 68 75.99681 0 0.1 0 0 0 1 
i 1.061345 39.41987 1.075751 58 70.24151 0 0.1 0 0 0 1 
i 1.245382 39.41987 1.075751 55 70.5434 0 0.1 0 0 0 1 
i 1.490763 39.41987 0.5378755 59 70.94591 0 0.1 0 0 0 1 
i 1.79749 39.41987 1.075751 62 71.44906 0 0.1 0 0 0 1 
i 2.784594 39.65669 0.7171673 47 70.13283 0 0.1 0 0 0 1 
i 3.336703 39.65669 0.7171673 41 71.03849 0 0.1 0 0 0 1 
i 8.629139 39.70512 0.7171673 96 83.70096 0 0.1 0 0 0 1 
i 3.275357 39.79792 0.5378755 73 75.19983 0 0.1 0 0 0 1 
i 6.476473 39.926 0.7171673 82 78.8426 0 0.1 0 0 0 1 
i 6.599163 39.926 0.7171673 79 79.04386 0 0.1 0 0 0 1 
i 6.844545 39.926 0.7171673 84 79.44637 0 0.1 0 0 0 1 
i 7.212618 39.926 0.7171673 86 80.05015 0 0.1 0 0 0 1 
i 1.552109 39.95775 0.5378755 59 71.04654 0 0.1 0 0 0 1 
i 4.569188 40.01355 2.709873 59 74.38675 0 0.1 0 0 0 1 
i 5.796096 40.01355 0.7171673 71 76.39933 0 0.1 0 0 0 1 
i 2.784594 40.33579 0.5378755 69 74.3948 0 0.1 0 0 0 1 
i 2.907285 40.37312 0.7171673 48 70.33342 0 0.1 0 0 0 1 
i 3.275357 40.37312 0.7171673 42 70.93719 0 0.1 0 0 0 1 
i 3.766121 40.37312 0.7171673 52 71.74222 0 0.1 0 0 0 1 
i 4.379575 40.37312 0.7171673 58 72.74851 0 0.1 0 0 0 1 
i 8.138376 40.42228 0.7171673 92 82.89593 0 0.1 0 0 0 1 
i 4.81457 40.63499 1.434335 56 74.7886 0 0.1 0 0 0 1 
i 5.550715 40.63499 1.434335 68 75.99614 0 0.1 0 0 0 1 
i 5.857442 40.63499 0.7171673 72 76.49929 0 0.1 0 0 0 1 
i 6.353782 40.64316 1.274868 80 78.64134 0 0.1 0 0 0 1 
i 6.721854 40.64316 1.274868 78 79.24512 0 0.1 0 0 0 1 
i 6.967236 40.64316 1.992036 83 79.64763 0 0.1 0 0 0 1 
i 7.089927 40.64316 1.992036 85 79.84889 0 0.1 0 0 0 1 
i 4.691879 40.74129 0.5378755 84 78.85065 0 0.1 0 0 0 1 
i 2.784594 40.82946 0.5378755 49 70.1496 0 0.1 0 0 0 1 
i 1.122691 40.85346 0.5378755 58 70.34147 0 0.1 0 0 0 1 
i 1.245382 40.85346 0.5378755 56 70.54273 0 0.1 0 0 0 1 
i 1.490763 40.85346 0.5378755 61 70.94524 0 0.1 0 0 0 1 
i 1.858836 40.85346 0.5378755 63 71.54901 0 0.1 0 0 0 1 
i 8.199721 41.04955 0.7171673 91 82.99589 0 0.1 0 0 0 1 
i 8.629139 41.04955 0.7171673 97 83.70029 0 0.1 0 0 0 1 
i 2.784594 41.09029 1.332817 47 70.13216 0 0.1 0 0 0 1 
i 3.398048 41.09029 0.7171673 41 71.13845 0 0.1 0 0 0 1 
i 3.888811 41.09029 2.049984 50 71.94348 0 0.1 0 0 0 1 
i 4.256884 41.09029 0.7171673 56 72.54725 0 0.1 0 0 0 1 
i 6.476473 41.20086 0.7171673 82 78.84193 0 0.1 0 0 0 1 
i 6.599163 41.20086 1.434335 79 79.04319 0 0.1 0 0 0 1 
i 6.844545 41.20086 0.7171673 84 79.4457 0 0.1 0 0 0 1 
i 7.212618 41.20086 1.434335 86 80.04948 0 0.1 0 0 0 1 
i 2.845939 41.20346 0.5378755 68 74.49476 0 0.1 0 0 0 1 
i 3.275357 41.20346 1.075751 74 75.19916 0 0.1 0 0 0 1 
i 4.569188 41.27917 0.5378755 83 78.64939 0 0.1 0 0 0 1 
i 5.796096 41.35216 0.7171673 71 76.39866 0 0.1 0 0 0 1 
i 1 41.39134 0.5378755 57 70.14021 0 0.1 0 0 0 1 
i 1.368072 41.39134 0.5378755 55 70.74398 0 0.1 0 0 0 1 
i 1.613454 41.39134 0.5378755 59 71.1465 0 0.1 0 0 0 1 
i 1.736145 41.39134 0.5378755 61 71.34776 0 0.1 0 0 0 1 
i 2.907285 41.70593 1.434335 48 70.33275 0 0.1 0 0 0 1 
i 3.275357 41.70593 1.434335 42 70.93652 0 0.1 0 0 0 1 
i 3.459394 41.70593 0.7171673 40 71.23841 0 0.1 0 0 0 1 
i 3.766121 41.70593 0.7171673 51 71.74155 0 0.1 0 0 0 1 
i 4.318229 41.70593 1.434335 57 72.64721 0 0.1 0 0 0 1 
i 4.379575 41.70593 1.434335 58 72.74784 0 0.1 0 0 0 1 
i 2.784594 41.74134 0.5378755 69 74.39413 0 0.1 0 0 0 1 
i 8.138376 41.76672 0.7171673 92 82.89526 0 0.1 0 0 0 1 
i 8.690484 41.76672 0.7171673 98 83.80092 0 0.1 0 0 0 1 
i 2.845939 41.83448 1.075751 44 70.24956 0 0.1 0 0 0 1 
i 6.353782 41.91803 0.7171673 81 78.64067 0 0.1 0 0 0 1 
i 6.537818 41.91803 0.7171673 82 78.94256 0 0.1 0 0 0 1 
i 6.660509 41.91803 0.7171673 80 79.14382 0 0.1 0 0 0 1 
i 7.273963 41.91803 0.7171673 87 80.1501 0 0.1 0 0 0 1 
i 4.81457 42.00625 0.7171673 57 74.78792 0 0.1 0 0 0 1 
i 5.550715 42.00625 0.7171673 70 75.99547 0 0.1 0 0 0 1 
i 5.918787 42.00625 0.7171673 72 76.59925 0 0.1 0 0 0 1 
i 4.630533 42.14683 0.5378755 84 78.74935 0 0.1 0 0 0 1 
i 4.691879 42.14683 1.075751 85 78.84998 0 0.1 0 0 0 1 
i 1.061345 42.18628 1.075751 57 70.24017 0 0.1 0 0 0 1 
i 1.122691 42.18628 1.075751 58 70.3408 0 0.1 0 0 0 1 
i 1.245382 42.18628 1.075751 56 70.54205 0 0.1 0 0 0 1 
i 1.429418 42.18628 0.5378755 55 70.84394 0 0.1 0 0 0 1 
i 1.490763 42.18628 0.5378755 60 70.94457 0 0.1 0 0 0 1 
i 1.6748 42.18628 0.5378755 59 71.24646 0 0.1 0 0 0 1 
i 1.79749 42.18628 1.075751 62 71.44771 0 0.1 0 0 0 1 
i 1.858836 42.18628 1.075751 63 71.54834 0 0.1 0 0 0 1 
i 2.96863 42.4231 0.7171673 49 70.43338 0 0.1 0 0 0 1 
i 3.398048 42.4231 0.7171673 41 71.13778 0 0.1 0 0 0 1 
i 3.827466 42.4231 0.7171673 52 71.84218 0 0.1 0 0 0 1 
i 8.261067 42.42677 0.7171673 91 83.09585 0 0.1 0 0 0 1 
i 8.629139 42.42677 0.7171673 97 83.69962 0 0.1 0 0 0 1 
i 2.907285 42.64328 0.5378755 68 74.59472 0 0.1 0 0 0 1 
i 3.275357 42.64328 0.5378755 74 75.19849 0 0.1 0 0 0 1 
i 4.753224 42.68471 0.5378755 86 78.95061 0 0.1 0 0 0 1 
i 4.569188 42.72342 3.284031 58 74.38541 0 0.1 0 0 0 1 
i 4.93726 42.72342 1.992036 55 74.98918 0 0.1 0 0 0 1 
i 5.673405 42.72342 1.274868 68 76.19673 0 0.1 0 0 0 1 
i 5.796096 42.72342 1.992036 71 76.39799 0 0.1 0 0 0 1 
i 1.184036 42.72416 0.5378755 59 70.44143 0 0.1 0 0 0 1 
i 1.552109 42.72416 0.5378755 61 71.0452 0 0.1 0 0 0 1 
i 1.613454 42.72416 0.5378755 60 71.14583 0 0.1 0 0 0 1 
i 8.138376 43.14394 1.280411 93 82.89459 0 0.1 0 0 0 1 
i 8.75183 43.14394 1.997579 99 83.90088 0 0.1 0 0 0 1 
i 2.784594 43.18116 0.5378755 70 74.39346 0 0.1 0 0 0 1 
i 3.398048 43.18116 0.5378755 75 75.39975 0 0.1 0 0 0 1 
i 3.029976 43.2403 0.7171673 48 70.53333 0 0.1 0 0 0 1 
i 3.275357 43.2403 0.7171673 44 70.93585 0 0.1 0 0 0 1 
i 3.766121 43.2403 0.7171673 53 71.74088 0 0.1 0 0 0 1 
i 4.630533 43.28112 0.7171673 57 74.48537 0 0.1 0 0 0 1 
i 4.81457 43.28112 1.434335 56 74.78725 0 0.1 0 0 0 1 
i 5.550715 43.28112 1.434335 70 75.9948 0 0.1 0 0 0 1 
i 5.918787 43.28112 0.7171673 72 76.59857 0 0.1 0 0 0 1 
i 2.907285 43.41502 1.259617 46 70.34952 0 0.1 0 0 0 1 
i 7.335308 43.58563 0.7171673 82 80.25006 0 0.1 0 0 0 1 
i 8.261067 43.70718 1.434335 92 83.09518 0 0.1 0 0 0 1 
i 8.629139 43.70718 1.434335 98 83.69895 0 0.1 0 0 0 1 
i 4.81457 43.76492 0.5378755 86 79.05057 0 0.1 0 0 0 1 
i 3.520739 43.95747 0.7171673 41 71.33836 0 0.1 0 0 0 1 
i 4.011502 43.95747 2.698142 50 72.1434 0 0.1 0 0 0 1 
i 4.256884 43.95747 0.7171673 55 72.54591 0 0.1 0 0 0 1 
i 2.845939 43.9819 0.5378755 70 74.49342 0 0.1 0 0 0 1 
i 2.907285 43.9819 1.075751 69 74.59405 0 0.1 0 0 0 1 
i 3.275357 43.9819 1.075751 75 75.19782 0 0.1 0 0 0 1 
i 3.459394 43.9819 0.5378755 76 75.49971 0 0.1 0 0 0 1 
i 4.753224 43.99829 0.7171673 59 74.68662 0 0.1 0 0 0 1 
i 5.673405 43.99829 0.7171673 69 76.19606 0 0.1 0 0 0 1 
i 5.980132 43.99829 0.7171673 73 76.6992 0 0.1 0 0 0 1 
i 4.569188 44.3028 0.5378755 84 78.64805 0 0.1 0 0 0 1 
i 6.353782 44.3028 0.7171673 74 78.64 0 0.1 0 0 0 1 
i 8.322412 44.42435 0.7171673 91 83.19581 0 0.1 0 0 0 1 
i 2.96863 44.51977 0.5378755 68 74.69468 0 0.1 0 0 0 1 
i 3.336703 44.51977 0.5378755 74 75.29845 0 0.1 0 0 0 1 
i 2.845939 44.57312 0.7171673 45 70.23078 0 0.1 0 0 0 1 
i 3.029976 44.57312 0.7171673 48 70.53266 0 0.1 0 0 0 1 
i 3.275357 44.57312 1.434335 44 70.93518 0 0.1 0 0 0 1 
i 3.582084 44.57312 0.7171673 40 71.43832 0 0.1 0 0 0 1 
i 3.766121 44.57312 0.7171673 53 71.74021 0 0.1 0 0 0 1 
i 4.318229 44.57312 4.069009 54 72.64587 0 0.1 0 0 0 1 
i 1.981527 44.67944 0.5378755 59 71.74893 0 0.1 0 0 0 1 
i 2.845939 44.88445 0.5378755 53 70.24822 0 0.1 0 0 0 1 
i 2.907285 44.88445 0.5378755 55 70.34885 0 0.1 0 0 0 1 
i 6.415127 44.99117 0.7171673 72 78.73996 0 0.1 0 0 0 1 
i 7.335308 44.99117 1.434335 83 80.24939 0 0.1 0 0 0 1 
i 5.059951 45.05568 0.7171673 57 75.1891 0 0.1 0 0 0 1 
i 5.550715 45.05568 0.7171673 66 75.99413 0 0.1 0 0 0 1 
i 4.630533 45.17046 1.075751 84 78.74801 0 0.1 0 0 0 1 
i 4.81457 45.17046 1.075751 87 79.0499 0 0.1 0 0 0 1 
i 8.383757 45.18122 0.7171673 92 83.29577 0 0.1 0 0 0 1 
i 8.629139 45.18122 0.7171673 97 83.69828 0 0.1 0 0 0 1 
i 1 45.21732 0.5378755 51 70.13887 0 0.1 0 0 0 1 
i 2.784594 45.29028 0.7171673 46 70.13015 0 0.1 0 0 0 1 
i 3.091321 45.29028 0.7171673 49 70.63329 0 0.1 0 0 0 1 
i 3.520739 45.29028 0.7171673 41 71.33769 0 0.1 0 0 0 1 
i 4.256884 45.29028 0.7171673 55 72.54524 0 0.1 0 0 0 1 
i 2.784594 45.42232 0.5378755 54 70.14759 0 0.1 0 0 0 1 
i 2.96863 45.42232 0.5378755 56 70.44948 0 0.1 0 0 0 1 
i 3.029976 45.52293 0.5378755 69 74.79463 0 0.1 0 0 0 1 
i 3.275357 45.52293 0.5378755 73 75.19715 0 0.1 0 0 0 1 
i 6.353782 45.70834 0.7171673 73 78.63933 0 0.1 0 0 0 1 
i 4.569188 45.77284 0.7171673 61 74.38407 0 0.1 0 0 0 1 
i 6.041478 45.77284 0.7171673 71 76.79916 0 0.1 0 0 0 1 
i 8.138376 45.89838 0.7171673 95 82.89325 0 0.1 0 0 0 1 
i 8.874521 45.89838 0.7171673 99 84.1008 0 0.1 0 0 0 1 
i 2.907285 45.93844 0.7171673 45 70.33073 0 0.1 0 0 0 1 
i 3.029976 45.93844 0.7171673 47 70.53199 0 0.1 0 0 0 1 
i 3.275357 45.93844 0.7171673 43 70.93451 0 0.1 0 0 0 1 
i 3.64343 45.93844 0.7171673 40 71.53828 0 0.1 0 0 0 1 
i 3.766121 45.93844 0.7171673 52 71.73954 0 0.1 0 0 0 1 
i 4.502266 45.93844 0.7171673 57 72.94709 0 0.1 0 0 0 1 
i 2.784594 46.06081 0.5378755 71 74.39212 0 0.1 0 0 0 1 
i 3.520739 46.06081 0.5378755 76 75.59966 0 0.1 0 0 0 1 
i 1.061345 46.14888 0.5378755 50 70.23883 0 0.1 0 0 0 1 
i 1.981527 46.14888 0.5378755 59 71.74826 0 0.1 0 0 0 1 
i 6.353782 46.24105 0.5378755 96 82.9013 0 0.1 0 0 0 1 
i 4.630533 46.39429 1.434335 62 74.48403 0 0.1 0 0 0 1 
i 5.059951 46.39429 1.434335 56 75.18843 0 0.1 0 0 0 1 
i 5.550715 46.39429 0.7171673 66 75.99346 0 0.1 0 0 0 1 
i 6.102823 46.39429 0.7538753 72 76.89912 0 0.1 0 0 0 1 
i 7.335308 46.431 0.7171673 83 80.24872 0 0.1 0 0 0 1 
i 8.199721 46.46163 0.7171673 96 82.99321 0 0.1 0 0 0 1 
i 8.383757 46.46163 1.434335 92 83.29509 0 0.1 0 0 0 1 
i 8.629139 46.46163 0.7171673 97 83.69761 0 0.1 0 0 0 1 
i 8.935866 46.46163 1.434335 100 84.20075 0 0.1 0 0 0 1 
i 3.029976 46.57609 0.5378755 35 70.54943 0 0.1 0 0 0 1 
i 4.691879 46.61029 0.5378755 84 78.84797 0 0.1 0 0 0 1 
i 4.81457 46.61029 0.5378755 87 79.04922 0 0.1 0 0 0 1 
i 2.784594 46.65561 0.7171673 46 70.12948 0 0.1 0 0 0 1 
i 3.152666 46.65561 1.269349 49 70.73325 0 0.1 0 0 0 1 
i 3.398048 46.65561 1.986517 44 71.13577 0 0.1 0 0 0 1 
i 3.520739 46.65561 1.269349 42 71.33702 0 0.1 0 0 0 1 
i 4.011502 46.65561 1.986517 51 72.14205 0 0.1 0 0 0 1 
i 4.256884 46.65561 1.269349 56 72.54457 0 0.1 0 0 0 1 
i 4.624956 46.65561 1.986517 58 73.14834 0 0.1 0 0 0 1 
i 1 46.68675 0.5378755 51 70.1382 0 0.1 0 0 0 1 
i 2.042872 46.68675 0.5378755 60 71.84889 0 0.1 0 0 0 1 
i 2.845939 46.86154 1.075751 72 74.49208 0 0.1 0 0 0 1 
i 3.029976 46.86154 1.075751 69 74.79396 0 0.1 0 0 0 1 
i 3.275357 46.86154 0.5378755 74 75.19648 0 0.1 0 0 0 1 
i 3.582084 46.86154 0.5378755 77 75.69962 0 0.1 0 0 0 1 
i 5.61206 47.11145 0.7171673 65 76.09409 0 0.1 0 0 0 1 
i 6.041478 47.11145 3.363297 71 76.79849 0 0.1 0 0 0 1 
i 2.784594 47.11396 0.5378755 41 70.14692 0 0.1 0 0 0 1 
i 6.415127 47.11483 0.5378755 98 83.00126 0 0.1 0 0 0 1 
i 4.569188 47.14816 0.5378755 86 78.64671 0 0.1 0 0 0 1 
i 4.93726 47.14816 0.5378755 88 79.25048 0 0.1 0 0 0 1 
i 6.353782 47.14816 0.7171673 73 78.63866 0 0.1 0 0 0 1 
i 7.457999 47.14816 2.055779 84 80.44998 0 0.1 0 0 0 1 
i 8.138376 47.1788 0.7171673 95 82.89258 0 0.1 0 0 0 1 
i 8.690484 47.1788 0.7171673 96 83.79824 0 0.1 0 0 0 1 
i 2.845939 47.20779 1.434335 47 70.22943 0 0.1 0 0 0 1 
i 2.907285 47.20779 1.434335 45 70.33006 0 0.1 0 0 0 1 
i 3.029976 47.20779 1.434335 48 70.53132 0 0.1 0 0 0 1 
i 3.275357 47.20779 1.434335 43 70.93384 0 0.1 0 0 0 1 
i 3.64343 47.20779 1.434335 41 71.53761 0 0.1 0 0 0 1 
i 3.766121 47.20779 1.434335 53 71.73887 0 0.1 0 0 0 1 
i 4.134193 47.20779 1.434335 50 72.34264 0 0.1 0 0 0 1 
i 4.379575 47.20779 1.434335 55 72.74516 0 0.1 0 0 0 1 
i 4.502266 47.20779 1.434335 57 72.94642 0 0.1 0 0 0 1 
i 3.336703 47.39942 0.5378755 73 75.29711 0 0.1 0 0 0 1 
i 3.520739 47.39942 0.5378755 76 75.59899 0 0.1 0 0 0 1 
i 6.353782 47.6527 0.5378755 97 82.90063 0 0.1 0 0 0 1 
i 1.122691 47.65415 0.5378755 49 70.33878 0 0.1 0 0 0 1 
i 1.981527 47.65415 0.5378755 59 71.74759 0 0.1 0 0 0 1 
i 4.691879 47.76555 1.005555 63 74.58398 0 0.1 0 0 0 1 
i 5.550715 47.76555 0.7171673 66 75.99279 0 0.1 0 0 0 1 
i 6.164169 47.76555 1.992036 72 76.99908 0 0.1 0 0 0 1 
i 7.519345 47.76961 0.7171673 85 80.54994 0 0.1 0 0 0 1 
i 8.261067 47.77327 0.7171673 96 83.09317 0 0.1 0 0 0 1 
i 8.383757 47.77327 1.434335 94 83.29442 0 0.1 0 0 0 1 
i 8.629139 47.77327 0.7171673 98 83.69694 0 0.1 0 0 0 1 
i 8.997212 47.77327 0.7171673 101 84.30071 0 0.1 0 0 0 1 
i 2.784594 47.92496 0.7171673 46 70.12881 0 0.1 0 0 0 1 
i 3.704775 47.92496 0.7171673 40 71.63824 0 0.1 0 0 0 1 
i 3.827466 47.92496 0.7171673 52 71.8395 0 0.1 0 0 0 1 
i 4.630533 47.9489 1.075751 87 78.74667 0 0.1 0 0 0 1 
i 4.691879 47.9489 1.075751 85 78.8473 0 0.1 0 0 0 1 
i 4.81457 47.9489 1.075751 88 79.04855 0 0.1 0 0 0 1 
i 4.998606 47.9489 0.5378755 89 79.35044 0 0.1 0 0 0 1 
i 2.845939 48.04552 0.5378755 52 70.24688 0 0.1 0 0 0 1 
i 3.029976 48.04552 0.5378755 57 70.54876 0 0.1 0 0 0 1 
i 1 48.19202 0.5378755 51 70.13753 0 0.1 0 0 0 1 
i 2.104217 48.19202 0.5378755 61 71.94885 0 0.1 0 0 0 1 
i 2.907285 48.23281 0.5378755 73 74.59203 0 0.1 0 0 0 1 
i 3.029976 48.23281 1.075751 71 74.79329 0 0.1 0 0 0 1 
i 3.275357 48.23281 0.5378755 75 75.19581 0 0.1 0 0 0 1 
i 3.64343 48.23281 0.5378755 77 75.79958 0 0.1 0 0 0 1 
i 4.569188 48.48272 1.274868 61 74.38273 0 0.1 0 0 0 1 
i 5.182642 48.48272 1.992036 55 75.38901 0 0.1 0 0 0 1 
i 5.673405 48.48272 1.992036 65 76.19405 0 0.1 0 0 0 1 
i 4.569188 48.48677 0.5378755 86 78.64604 0 0.1 0 0 0 1 
i 6.537818 48.48677 0.7171673 71 78.93987 0 0.1 0 0 0 1 
i 7.396654 48.48677 0.7171673 83 80.34868 0 0.1 0 0 0 1 
i 8.506448 48.49044 1.219439 92 83.49568 0 0.1 0 0 0 1 
i 8.75183 48.49044 1.219439 97 83.8982 0 0.1 0 0 0 1 
i 8.874521 48.49044 1.936607 99 84.09945 0 0.1 0 0 0 1 
i 6.476473 48.56091 0.5378755 99 83.10122 0 0.1 0 0 0 1 
i 2.784594 48.58339 0.5378755 53 70.14625 0 0.1 0 0 0 1 
i 3.091321 48.58339 0.5378755 58 70.64939 0 0.1 0 0 0 1 
i 3.152666 48.77068 0.5378755 69 74.99455 0 0.1 0 0 0 1 
i 3.398048 48.77068 0.5378755 74 75.39706 0 0.1 0 0 0 1 
i 3.520739 48.77068 0.5378755 76 75.59832 0 0.1 0 0 0 1 
i 8.199721 48.99271 1.434335 95 82.99187 0 0.1 0 0 0 1 
i 8.261067 48.99271 1.434335 96 83.09249 0 0.1 0 0 0 1 
i 8.383757 48.99271 0.7171673 93 83.29375 0 0.1 0 0 0 1 
i 8.629139 48.99271 1.434335 98 83.69627 0 0.1 0 0 0 1 
i 8.997212 48.99271 1.434335 101 84.30004 0 0.1 0 0 0 1 
i 4.691879 49.04042 1.434335 63 74.58331 0 0.1 0 0 0 1 
i 5.059951 49.04042 1.434335 56 75.18709 0 0.1 0 0 0 1 
i 5.734751 49.04042 0.7171673 64 76.294 0 0.1 0 0 0 1 
i 1.061345 49.0536 0.5378755 50 70.23748 0 0.1 0 0 0 1 
i 1.122691 49.0536 1.075751 49 70.33811 0 0.1 0 0 0 1 
i 1.981527 49.0536 1.075751 60 71.74692 0 0.1 0 0 0 1 
i 2.165563 49.0536 0.5378755 62 72.04881 0 0.1 0 0 0 1 
i 6.353782 49.09879 0.5378755 97 82.89996 0 0.1 0 0 0 1 
i 4.630533 49.17117 0.5378755 58 74.50013 0 0.1 0 0 0 1 
i 6.599163 49.31064 0.7171673 71 79.03983 0 0.1 0 0 0 1 
i 7.335308 49.31064 0.7171673 82 80.24738 0 0.1 0 0 0 1 
i 2.845939 49.50767 1.075751 72 74.49073 0 0.1 0 0 0 1 
i 2.907285 49.50767 1.075751 73 74.59136 0 0.1 0 0 0 1 
i 3.029976 49.50767 1.075751 70 74.79262 0 0.1 0 0 0 1 
i 3.214012 49.50767 0.5378755 69 75.09451 0 0.1 0 0 0 1 
i 3.275357 49.50767 1.075751 75 75.19514 0 0.1 0 0 0 1 
i 3.459394 49.50767 1.075751 74 75.49702 0 0.1 0 0 0 1 
i 3.582084 49.50767 1.075751 76 75.69828 0 0.1 0 0 0 1 
i 3.64343 49.50767 1.075751 77 75.79891 0 0.1 0 0 0 1 
i 2.907285 49.55079 1.075751 45 70.34683 0 0.1 0 0 0 1 
i 3.029976 49.55079 1.075751 44 70.54809 0 0.1 0 0 0 1 
i 1.184036 49.59148 0.5378755 48 70.43874 0 0.1 0 0 0 1 
i 2.104217 49.59148 0.5378755 61 71.94818 0 0.1 0 0 0 1 
i 4.569188 49.70905 0.5378755 59 74.3995 0 0.1 0 0 0 1 
i 8.445103 49.70988 0.7171673 94 83.39438 0 0.1 0 0 0 1 
i 8.506448 49.70988 0.7171673 93 83.49501 0 0.1 0 0 0 1 
i 8.874521 49.70988 0.7171673 100 84.09878 0 0.1 0 0 0 1 
i 4.569188 49.75758 0.7171673 62 74.38205 0 0.1 0 0 0 1 
i 5.61206 49.75758 0.7171673 66 76.09275 0 0.1 0 0 0 1 
i 6.225514 49.75758 0.9873939 73 77.09904 0 0.1 0 0 0 1 
i 5.059951 49.81218 0.5378755 87 79.4504 0 0.1 0 0 0 1 
i 6.415127 49.90534 0.5378755 98 82.99992 0 0.1 0 0 0 1 
i 6.476473 49.90534 1.075751 99 83.10055 0 0.1 0 0 0 1 
i 7.58069 50.02781 0.7171673 85 80.6499 0 0.1 0 0 0 1 
i 3.091321 50.04555 0.5378755 71 74.89325 0 0.1 0 0 0 1 
i 4.569188 50.35006 0.5378755 83 78.64537 0 0.1 0 0 0 1 
i 6.537818 50.44322 0.5378755 100 83.20117 0 0.1 0 0 0 1 
i 4.81457 50.50807 0.7171673 63 74.7839 0 0.1 0 0 0 1 
i 5.059951 50.50807 0.7171673 58 75.18642 0 0.1 0 0 0 1 
i 5.550715 50.50807 0.7171673 67 75.99145 0 0.1 0 0 0 1 
i 6.28686 50.50807 0.7171673 72 77.19899 0 0.1 0 0 0 1 
i 6.415127 50.64926 0.7171673 74 78.73727 0 0.1 0 0 0 1 
i 6.599163 50.64926 1.434335 70 79.03916 0 0.1 0 0 0 1 
i 7.335308 50.64926 0.7171673 83 80.24671 0 0.1 0 0 0 1 
i 7.642036 50.64926 0.7171673 86 80.74985 0 0.1 0 0 0 1 
i 1.245382 50.66469 0.5378755 49 70.5387 0 0.1 0 0 0 1 
i 1.981527 50.66469 0.5378755 59 71.74625 0 0.1 0 0 0 1 
i 4.691879 50.68299 0.5378755 60 74.60008 0 0.1 0 0 0 1 
i 2.845939 50.95024 0.5378755 38 70.24553 0 0.1 0 0 0 1 
i 2.907285 50.95024 1.075751 40 70.34616 0 0.1 0 0 0 1 
i 3.029976 50.95024 1.075751 37 70.54742 0 0.1 0 0 0 1 
i 3.214012 50.95024 0.5378755 35 70.84931 0 0.1 0 0 0 1 
i 1 51.20256 0.5378755 51 70.13618 0 0.1 0 0 0 1 
i 2.226908 51.20256 0.5378755 61 72.14876 0 0.1 0 0 0 1 
i 4.630533 51.21772 1.075751 83 78.74532 0 0.1 0 0 0 1 
i 5.059951 51.21772 0.5378755 88 79.44973 0 0.1 0 0 0 1 
i 4.569188 51.22086 0.5378755 61 74.39883 0 0.1 0 0 0 1 
i 4.569188 51.22524 0.7171673 60 74.38138 0 0.1 0 0 0 1 
i 5.305333 51.22524 2.580831 55 75.58893 0 0.1 0 0 0 1 
i 5.796096 51.22524 0.7171673 65 76.39396 0 0.1 0 0 0 1 
i 6.041478 51.22524 2.580831 69 76.79648 0 0.1 0 0 0 1 
i 9.119902 51.27379 0.7171673 96 84.50063 0 0.1 0 0 0 1 
i 6.353782 51.36642 1.850851 73 78.63665 0 0.1 0 0 0 1 
i 7.396654 51.36642 0.7171673 82 80.34734 0 0.1 0 0 0 1 
i 7.58069 51.36642 0.7171673 85 80.64922 0 0.1 0 0 0 1 
i 6.599163 51.45308 0.5378755 100 83.30113 0 0.1 0 0 0 1 
i 2.784594 51.48812 0.5378755 39 70.14491 0 0.1 0 0 0 1 
i 3.152666 51.48812 0.5378755 36 70.74868 0 0.1 0 0 0 1 
i 5.121297 51.7556 0.5378755 89 79.55036 0 0.1 0 0 0 1 
i 4.630533 51.78294 0.7171673 59 74.48134 0 0.1 0 0 0 1 
i 4.81457 51.78294 1.434335 63 74.78323 0 0.1 0 0 0 1 
i 5.059951 51.78294 1.434335 58 75.18574 0 0.1 0 0 0 1 
i 5.550715 51.78294 0.7171673 67 75.99078 0 0.1 0 0 0 1 
i 5.857442 51.78294 0.7171673 64 76.49392 0 0.1 0 0 0 1 
i 6.28686 51.78294 0.7171673 72 77.19832 0 0.1 0 0 0 1 
i 3.766121 51.89244 0.5378755 73 75.9995 0 0.1 0 0 0 1 
i 6.353782 51.99096 0.5378755 98 82.89862 0 0.1 0 0 0 1 
i 8.138376 51.99096 0.7171673 88 82.89057 0 0.1 0 0 0 1 
i 6.599163 52.02052 0.7171673 71 79.03849 0 0.1 0 0 0 1 
i 7.335308 52.02052 0.7171673 84 80.24604 0 0.1 0 0 0 1 
i 7.703381 52.02052 0.7171673 86 80.84981 0 0.1 0 0 0 1 
i 1.061345 52.06414 1.075751 51 70.23614 0 0.1 0 0 0 1 
i 1.245382 52.06414 1.075751 48 70.53803 0 0.1 0 0 0 1 
i 1.981527 52.06414 1.075751 59 71.74558 0 0.1 0 0 0 1 
i 2.288254 52.06414 1.075751 62 72.24872 0 0.1 0 0 0 1 
i 4.630533 52.08853 0.5378755 67 74.49878 0 0.1 0 0 0 1 
i 4.691879 52.08853 0.5378755 69 74.59941 0 0.1 0 0 0 1 
i 2.784594 52.43031 0.5378755 66 74.38943 0 0.1 0 0 0 1 
i 4.569188 52.50011 0.7171673 60 74.38071 0 0.1 0 0 0 1 
i 5.61206 52.50011 0.7171673 68 76.0914 0 0.1 0 0 0 1 
i 5.796096 52.50011 0.7171673 65 76.39329 0 0.1 0 0 0 1 
i 8.199721 52.61822 3.374802 87 82.99052 0 0.1 0 0 0 1 
i 9.119902 52.61822 0.7171673 97 84.49996 0 0.1 0 0 0 1 
i 4.569188 52.6264 0.5378755 68 74.39816 0 0.1 0 0 0 1 
i 4.753224 52.6264 0.5378755 70 74.70004 0 0.1 0 0 0 1 
i 4.691879 52.65755 0.5378755 83 78.84528 0 0.1 0 0 0 1 
i 5.059951 52.65755 0.5378755 88 79.44906 0 0.1 0 0 0 1 
i 6.353782 52.73768 2.999713 72 78.63597 0 0.1 0 0 0 1 
i 6.721854 52.73768 1.992036 69 79.23975 0 0.1 0 0 0 1 
i 7.457999 52.73768 0.7171673 83 80.4473 0 0.1 0 0 0 1 
i 7.58069 52.73768 1.274868 85 80.64855 0 0.1 0 0 0 1 
i 6.415127 52.79751 0.5378755 98 82.99857 0 0.1 0 0 0 1 
i 6.599163 52.79751 1.075751 101 83.30046 0 0.1 0 0 0 1 
i 3.275357 52.89822 0.5378755 57 70.94927 0 0.1 0 0 0 1 
i 4.691879 53.0889 0.7171673 59 74.5813 0 0.1 0 0 0 1 
i 4.81457 53.0889 0.7171673 62 74.78256 0 0.1 0 0 0 1 
i 5.059951 53.0889 0.7171673 57 75.18507 0 0.1 0 0 0 1 
i 5.550715 53.0889 0.7171673 66 75.9901 0 0.1 0 0 0 1 
i 5.918787 53.0889 0.7171673 64 76.59388 0 0.1 0 0 0 1 
i 6.28686 53.0889 0.9236505 71 77.19765 0 0.1 0 0 0 1 
i 4.569188 53.19542 0.5378755 84 78.64403 0 0.1 0 0 0 1 
i 5.182642 53.19542 0.5378755 89 79.65031 0 0.1 0 0 0 1 
i 6.599163 53.29538 0.7171673 70 79.03782 0 0.1 0 0 0 1 
i 7.335308 53.29538 1.434335 84 80.24537 0 0.1 0 0 0 1 
i 7.519345 53.29538 0.7171673 83 80.54725 0 0.1 0 0 0 1 
i 7.703381 53.29538 1.434335 86 80.84914 0 0.1 0 0 0 1 
i 2.845939 53.29798 0.5378755 64 74.48939 0 0.1 0 0 0 1 
i 3.766121 53.29798 1.075751 74 75.99883 0 0.1 0 0 0 1 
i 6.353782 53.33539 0.5378755 99 82.89795 0 0.1 0 0 0 1 
i 9.181248 53.33539 0.7171673 98 84.60059 0 0.1 0 0 0 1 
i 2.784594 53.4361 0.5378755 51 70.14423 0 0.1 0 0 0 1 
i 1.122691 53.49774 0.5378755 51 70.3361 0 0.1 0 0 0 1 
i 1.245382 53.49774 1.075751 49 70.53736 0 0.1 0 0 0 1 
i 1.981527 53.49774 1.075751 61 71.74491 0 0.1 0 0 0 1 
i 2.349599 53.49774 0.5378755 63 72.34868 0 0.1 0 0 0 1 
i 4.81457 53.70662 0.5378755 50 74.8 0 0.1 0 0 0 1 
i 4.569188 53.80607 1.21416 61 74.38004 0 0.1 0 0 0 1 
i 4.93726 53.80607 1.931328 63 74.98382 0 0.1 0 0 0 1 
i 5.182642 53.80607 0.7171673 58 75.38633 0 0.1 0 0 0 1 
i 5.305333 53.80607 1.931328 56 75.58759 0 0.1 0 0 0 1 
i 5.673405 53.80607 1.21416 68 76.19136 0 0.1 0 0 0 1 
i 5.796096 53.80607 0.7171673 65 76.39262 0 0.1 0 0 0 1 
i 6.041478 53.80607 1.931328 70 76.79514 0 0.1 0 0 0 1 
i 6.40955 53.80607 1.21416 73 77.39891 0 0.1 0 0 0 1 
i 2.784594 53.83586 0.5378755 65 74.38876 0 0.1 0 0 0 1 
i 9.119902 53.99544 0.7171673 97 84.49929 0 0.1 0 0 0 1 
i 4.630533 53.99616 1.075751 84 78.74398 0 0.1 0 0 0 1 
i 4.691879 53.99616 0.5378755 83 78.84461 0 0.1 0 0 0 1 
i 5.059951 53.99616 1.075751 89 79.44839 0 0.1 0 0 0 1 
i 5.243987 53.99616 1.075751 90 79.75027 0 0.1 0 0 0 1 
i 6.537818 54.01255 0.7171673 73 78.93719 0 0.1 0 0 0 1 
i 6.660509 54.01255 0.7171673 71 79.13845 0 0.1 0 0 0 1 
i 7.457999 54.01255 0.7171673 83 80.44662 0 0.1 0 0 0 1 
i 1.368072 54.03561 0.5378755 47 70.73862 0 0.1 0 0 0 1 
i 2.104217 54.03561 0.5378755 59 71.94616 0 0.1 0 0 0 1 
i 6.476473 54.17473 0.5378755 99 83.09853 0 0.1 0 0 0 1 
i 6.599163 54.17473 0.5378755 101 83.29979 0 0.1 0 0 0 1 
i 4.569188 54.24449 0.7757362 55 74.39748 0 0.1 0 0 0 1 
i 4.691879 54.30306 1.434335 60 74.58063 0 0.1 0 0 0 1 
i 4.81457 54.30306 1.434335 62 74.78189 0 0.1 0 0 0 1 
i 5.059951 54.30306 1.434335 57 75.1844 0 0.1 0 0 0 1 
i 5.243987 54.30306 1.434335 59 75.48629 0 0.1 0 0 0 1 
i 5.550715 54.30306 1.434335 67 75.98943 0 0.1 0 0 0 1 
i 5.857442 54.30306 1.434335 66 76.49258 0 0.1 0 0 0 1 
i 5.918787 54.30306 1.434335 64 76.59321 0 0.1 0 0 0 1 
i 6.164169 54.30306 1.434335 69 76.99572 0 0.1 0 0 0 1 
i 2.845939 54.36765 0.5378755 43 70.24419 0 0.1 0 0 0 1 
i 3.275357 54.36765 0.5378755 31 70.9486 0 0.1 0 0 0 1 
i 4.753224 54.53404 0.5378755 82 78.94524 0 0.1 0 0 0 1 
i 6.353782 54.71261 0.5378755 100 82.89727 0 0.1 0 0 0 1 
i 6.721854 54.71261 0.5378755 102 83.50105 0 0.1 0 0 0 1 
i 9.242593 54.71261 1.997579 98 84.70055 0 0.1 0 0 0 1 
i 2.907285 54.73781 0.5378755 64 74.58935 0 0.1 0 0 0 1 
i 3.766121 54.73781 0.5378755 74 75.99816 0 0.1 0 0 0 1 
i 1.061345 54.83055 1.075751 49 70.2348 0 0.1 0 0 0 1 
i 1.122691 54.83055 0.5378755 50 70.33543 0 0.1 0 0 0 1 
i 1.245382 54.83055 1.075751 48 70.53669 0 0.1 0 0 0 1 
i 1.429418 54.83055 1.075751 47 70.83857 0 0.1 0 0 0 1 
i 1.981527 54.83055 1.075751 60 71.74423 0 0.1 0 0 0 1 
i 2.165563 54.83055 0.5378755 59 72.04612 0 0.1 0 0 0 1 
i 2.288254 54.83055 1.075751 62 72.24738 0 0.1 0 0 0 1 
i 2.349599 54.83055 1.075751 63 72.34801 0 0.1 0 0 0 1 
i 2.784594 54.90553 0.5378755 41 70.14356 0 0.1 0 0 0 1 
i 3.336703 54.90553 0.5378755 29 71.04922 0 0.1 0 0 0 1 
i 5.182642 55.02023 0.7171673 58 75.38566 0 0.1 0 0 0 1 
i 5.489369 55.02023 0.7171673 54 75.88881 0 0.1 0 0 0 1 
i 5.796096 55.02023 0.7171673 65 76.39195 0 0.1 0 0 0 1 
i 6.348205 55.02023 0.7171673 71 77.29761 0 0.1 0 0 0 1 
i 6.844545 55.06994 0.7171673 71 79.43966 0 0.1 0 0 0 1 
i 7.335308 55.06994 0.7171673 80 80.2447 0 0.1 0 0 0 1 
i 4.630533 55.11216 0.5378755 67 74.49744 0 0.1 0 0 0 1 
i 4.81457 55.11216 0.5378755 72 74.79933 0 0.1 0 0 0 1 
i 2.784594 55.27568 0.5378755 65 74.38809 0 0.1 0 0 0 1 
i 3.888811 55.27568 0.5378755 75 76.19941 0 0.1 0 0 0 1 
i 8.261067 55.27585 1.849864 86 83.08981 0 0.1 0 0 0 1 
i 9.303939 55.27585 1.434335 99 84.8005 0 0.1 0 0 0 1 
i 1.184036 55.36843 0.5378755 51 70.43606 0 0.1 0 0 0 1 
i 2.042872 55.36843 0.5378755 61 71.84486 0 0.1 0 0 0 1 
i 6.415127 55.45515 0.5378755 101 82.99723 0 0.1 0 0 0 1 
i 6.476473 55.45515 1.075751 100 83.09786 0 0.1 0 0 0 1 
i 6.599163 55.45515 1.075751 102 83.29912 0 0.1 0 0 0 1 
i 6.7832 55.45515 0.5378755 103 83.60101 0 0.1 0 0 0 1 
i 4.81457 55.5372 0.5378755 83 79.0452 0 0.1 0 0 0 1 
i 5.059951 55.5372 0.5378755 88 79.44771 0 0.1 0 0 0 1 
i 4.569188 55.65004 0.5378755 68 74.39681 0 0.1 0 0 0 1 
i 4.875915 55.65004 0.5378755 73 74.89996 0 0.1 0 0 0 1 
i 6.353782 55.78711 0.7171673 75 78.63463 0 0.1 0 0 0 1 
i 7.826072 55.78711 0.9230824 85 81.04973 0 0.1 0 0 0 1 
i 2.907285 55.87292 0.5378755 50 70.34415 0 0.1 0 0 0 1 
i 3.275357 55.87292 0.5378755 58 70.94792 0 0.1 0 0 0 1 
i 6.537818 55.99302 0.5378755 99 83.19849 0 0.1 0 0 0 1 
i 6.660509 55.99302 0.5378755 101 83.39975 0 0.1 0 0 0 1 
i 4.569188 56.07507 0.5378755 86 78.64268 0 0.1 0 0 0 1 
i 5.305333 56.07507 0.5378755 90 79.85023 0 0.1 0 0 0 1 
i 2.845939 56.07642 1.075751 64 74.48805 0 0.1 0 0 0 1 
i 2.907285 56.07642 1.075751 63 74.58868 0 0.1 0 0 0 1 
i 3.766121 56.07642 1.075751 75 75.99748 0 0.1 0 0 0 1 
i 3.950157 56.07642 0.5378755 76 76.29937 0 0.1 0 0 0 1 
i 6.415127 56.40855 1.434335 76 78.73459 0 0.1 0 0 0 1 
i 6.844545 56.40855 1.434335 70 79.43899 0 0.1 0 0 0 1 
i 7.335308 56.40855 0.7171673 80 80.24403 0 0.1 0 0 0 1 
i 2.784594 56.4108 0.5378755 52 70.14289 0 0.1 0 0 0 1 
i 3.398048 56.4108 0.5378755 60 71.14918 0 0.1 0 0 0 1 
i 4.691879 56.55198 0.5378755 60 74.5974 0 0.1 0 0 0 1 
i 4.81457 56.55198 1.075751 59 74.79866 0 0.1 0 0 0 1 
i 3.827466 56.61429 0.5378755 74 76.09811 0 0.1 0 0 0 1 
i 1.490763 56.68577 0.5378755 49 70.93853 0 0.1 0 0 0 1 
i 1.981527 56.68577 0.5378755 57 71.74356 0 0.1 0 0 0 1 
i 8.383757 56.74989 1.092997 85 83.2904 0 0.1 0 0 0 1 
i 9.119902 56.74989 0.7171673 97 84.49795 0 0.1 0 0 0 1 
i 4.630533 56.87581 1.075751 87 78.74264 0 0.1 0 0 0 1 
i 4.81457 56.87581 0.5378755 84 79.04453 0 0.1 0 0 0 1 
i 5.059951 56.87581 0.5378755 88 79.44704 0 0.1 0 0 0 1 
i 5.366678 56.87581 0.5378755 91 79.95019 0 0.1 0 0 0 1 
i 4.93726 57.08986 0.5378755 58 74.99992 0 0.1 0 0 0 1 
i 7.396654 57.12572 0.7171673 79 80.34465 0 0.1 0 0 0 1 
i 1 57.22364 0.5378755 53 70.1335 0 0.1 0 0 0 1 
i 2.47229 57.22364 0.5378755 61 72.5486 0 0.1 0 0 0 1 
i 6.844545 57.23742 0.5378755 102 83.70096 0 0.1 0 0 0 1 
i 2.845939 57.27238 1.075751 48 70.24285 0 0.1 0 0 0 1 
i 3.275357 57.27238 1.075751 50 70.94725 0 0.1 0 0 0 1 
i 4.569188 57.41368 0.5378755 86 78.64201 0 0.1 0 0 0 1 
i 4.875915 57.41368 0.5378755 83 79.14516 0 0.1 0 0 0 1 
i 5.305333 57.41368 0.5378755 90 79.84956 0 0.1 0 0 0 1 
i 8.138376 57.46706 1.280411 88 82.88788 0 0.1 0 0 0 1 
i 9.365284 57.46706 0.7171673 99 84.90046 0 0.1 0 0 0 1 
i 3.029976 57.61745 0.5378755 63 74.78927 0 0.1 0 0 0 1 
i 3.766121 57.61745 0.5378755 73 75.99681 0 0.1 0 0 0 1 
i 6.353782 57.77529 0.5378755 97 82.89593 0 0.1 0 0 0 1 
i 6.476473 57.77981 0.7171673 77 78.83455 0 0.1 0 0 0 1 
i 6.844545 57.77981 0.7171673 71 79.43832 0 0.1 0 0 0 1 
i 7.335308 57.77981 0.7171673 80 80.24335 0 0.1 0 0 0 1 
i 7.948763 57.77981 0.7171673 86 81.24964 0 0.1 0 0 0 1 
i 2.96863 57.81026 0.5378755 47 70.44411 0 0.1 0 0 0 1 
i 4.630533 57.8906 1.075751 52 74.4961 0 0.1 0 0 0 1 
i 4.691879 57.8906 0.5378755 54 74.59673 0 0.1 0 0 0 1 
i 4.81457 57.8906 0.5378755 51 74.79799 0 0.1 0 0 0 1 
i 4.998606 57.8906 0.5378755 49 75.09987 0 0.1 0 0 0 1 
i 8.383757 58.0303 2.028808 85 83.28973 0 0.1 0 0 0 1 
i 9.119902 58.0303 0.7171673 97 84.49727 0 0.1 0 0 0 1 
i 9.426629 58.0303 1.434335 100 85.00042 0 0.1 0 0 0 1 
i 1.061345 58.08523 0.5378755 54 70.23346 0 0.1 0 0 0 1 
i 1.490763 58.08523 0.5378755 48 70.93786 0 0.1 0 0 0 1 
i 1.981527 58.08523 0.5378755 57 71.74289 0 0.1 0 0 0 1 
i 2.533635 58.08523 0.5378755 62 72.64855 0 0.1 0 0 0 1 
i 2.784594 58.15533 0.5378755 65 74.38675 0 0.1 0 0 0 1 
i 4.011502 58.15533 0.5378755 76 76.39933 0 0.1 0 0 0 1 
i 4.691879 58.24707 0.5378755 87 78.8426 0 0.1 0 0 0 1 
i 4.81457 58.24707 0.5378755 85 79.04386 0 0.1 0 0 0 1 
i 5.059951 58.24707 0.5378755 89 79.44637 0 0.1 0 0 0 1 
i 5.428024 58.24707 0.5378755 91 80.05015 0 0.1 0 0 0 1 
i 6.353782 58.24749 0.5378755 78 78.65073 0 0.1 0 0 0 1 
i 4.569188 58.42847 0.5378755 53 74.39547 0 0.1 0 0 0 1 
i 4.753224 58.42847 0.5378755 55 74.69736 0 0.1 0 0 0 1 
i 4.93726 58.42847 0.5378755 50 74.99925 0 0.1 0 0 0 1 
i 6.353782 58.49698 0.7171673 75 78.63329 0 0.1 0 0 0 1 
i 6.967236 58.49698 1.992036 69 79.63958 0 0.1 0 0 0 1 
i 7.457999 58.49698 1.992036 79 80.44461 0 0.1 0 0 0 1 
i 6.415127 58.58185 1.075751 97 82.99589 0 0.1 0 0 0 1 
i 6.844545 58.58185 0.5378755 102 83.70029 0 0.1 0 0 0 1 
i 1 58.6231 0.5378755 53 70.13283 0 0.1 0 0 0 1 
i 1.552109 58.6231 0.5378755 48 71.03849 0 0.1 0 0 0 1 
i 2.042872 58.6231 0.5378755 56 71.84352 0 0.1 0 0 0 1 
i 2.47229 58.6231 0.5378755 62 72.54792 0 0.1 0 0 0 1 
i 8.138376 58.74747 1.741548 87 82.88721 0 0.1 0 0 0 1 
i 8.445103 58.74747 0.7171673 84 83.39036 0 0.1 0 0 0 1 
i 9.181248 58.74747 0.7171673 96 84.5979 0 0.1 0 0 0 1 
i 4.569188 58.78494 0.5378755 86 78.64134 0 0.1 0 0 0 1 
i 4.93726 58.78494 0.5378755 84 79.24512 0 0.1 0 0 0 1 
i 5.182642 58.78494 0.5378755 88 79.64763 0 0.1 0 0 0 1 
i 5.305333 58.78494 0.5378755 90 79.84889 0 0.1 0 0 0 1 
i 3.029976 58.88346 0.5378755 43 70.54407 0 0.1 0 0 0 1 
i 3.275357 58.88346 0.5378755 36 70.94658 0 0.1 0 0 0 1 
i 2.845939 58.95607 1.075751 65 74.48671 0 0.1 0 0 0 1 
i 3.029976 58.95607 1.075751 62 74.7886 0 0.1 0 0 0 1 
i 3.766121 58.95607 0.5378755 74 75.99614 0 0.1 0 0 0 1 
i 4.072848 58.95607 0.5378755 77 76.49929 0 0.1 0 0 0 1 
i 6.415127 59.05468 1.434335 76 78.73325 0 0.1 0 0 0 1 
i 6.476473 59.05468 0.7171673 77 78.83388 0 0.1 0 0 0 1 
i 6.844545 59.05468 0.7171673 70 79.43765 0 0.1 0 0 0 1 
i 7.519345 59.05468 0.7171673 78 80.54457 0 0.1 0 0 0 1 
i 7.948763 59.05468 3.459689 86 81.24897 0 0.1 0 0 0 1 
i 6.905891 59.11972 0.5378755 103 83.80092 0 0.1 0 0 0 1 
i 6.415127 59.18544 0.5378755 72 78.75069 0 0.1 0 0 0 1 
i 9.119902 59.34194 0.7171673 98 84.4966 0 0.1 0 0 0 1 
i 9.487975 59.34194 0.7171673 101 85.10038 0 0.1 0 0 0 1 
i 2.784594 59.42134 0.5378755 39 70.14155 0 0.1 0 0 0 1 
i 3.520739 59.42134 0.5378755 33 71.3491 0 0.1 0 0 0 1 
i 3.827466 59.49394 0.5378755 73 76.09677 0 0.1 0 0 0 1 
i 4.011502 59.49394 0.5378755 76 76.39866 0 0.1 0 0 0 1 
i 1.122691 59.51882 0.5378755 54 70.33342 0 0.1 0 0 0 1 
i 1.490763 59.51882 0.5378755 49 70.93719 0 0.1 0 0 0 1 
i 1.981527 59.51882 0.5378755 57 71.74222 0 0.1 0 0 0 1 
i 2.594981 59.51882 0.5378755 63 72.74851 0 0.1 0 0 0 1 
i 4.630533 59.52194 1.075751 86 78.7413 0 0.1 0 0 0 1 
i 4.691879 59.52194 1.075751 87 78.84193 0 0.1 0 0 0 1 
i 4.81457 59.52194 1.075751 85 79.04319 0 0.1 0 0 0 1 
i 4.998606 59.52194 1.075751 84 79.34507 0 0.1 0 0 0 1 
i 5.059951 59.52194 1.075751 89 79.4457 0 0.1 0 0 0 1 
i 5.243987 59.52194 0.5378755 88 79.74759 0 0.1 0 0 0 1 
i 5.366678 59.52194 1.075751 90 79.94885 0 0.1 0 0 0 1 
i 5.428024 59.52194 1.075751 91 80.04948 0 0.1 0 0 0 1 
i 6.353782 59.72331 0.5378755 73 78.65006 0 0.1 0 0 0 1 
i 5.059951 59.75388 0.5378755 72 75.19983 0 0.1 0 0 0 1 
i 6.537818 59.77185 0.7171673 77 78.93451 0 0.1 0 0 0 1 
i 6.905891 59.77185 0.7171673 71 79.53828 0 0.1 0 0 0 1 
i 7.396654 59.77185 0.7171673 80 80.34331 0 0.1 0 0 0 1 
i 6.476473 59.95907 0.5378755 97 83.09585 0 0.1 0 0 0 1 
i 6.844545 59.95907 0.5378755 102 83.69962 0 0.1 0 0 0 1 
i 1 60.05669 0.5378755 53 70.13216 0 0.1 0 0 0 1 
i 1.613454 60.05669 0.5378755 47 71.13845 0 0.1 0 0 0 1 
i 2.104217 60.05669 0.5378755 56 71.94348 0 0.1 0 0 0 1 
i 2.47229 60.05669 0.5378755 61 72.54725 0 0.1 0 0 0 1 
i 8.506448 60.05911 0.7171673 84 83.49031 0 0.1 0 0 0 1 
i 9.242593 60.05911 1.219439 97 84.69786 0 0.1 0 0 0 1 
i 9.365284 60.05911 1.936607 99 84.89912 0 0.1 0 0 0 1 
i 5.489369 60.05981 0.5378755 92 80.1501 0 0.1 0 0 0 1 
i 2.845939 60.28292 0.5378755 60 70.24151 0 0.1 0 0 0 1 
i 3.029976 60.28292 0.5378755 54 70.5434 0 0.1 0 0 0 1 
i 3.275357 60.28292 2.640953 63 70.94591 0 0.1 0 0 0 1 
i 3.582084 60.28292 0.5378755 69 71.44906 0 0.1 0 0 0 1 
i 4.569188 60.29175 0.5378755 65 74.3948 0 0.1 0 0 0 1 
i 2.907285 60.32733 0.5378755 65 74.58667 0 0.1 0 0 0 1 
i 3.766121 60.32733 0.5378755 75 75.99547 0 0.1 0 0 0 1 
i 4.134193 60.32733 0.5378755 77 76.59925 0 0.1 0 0 0 1 
i 6.353782 60.49695 0.5378755 98 82.89459 0 0.1 0 0 0 1 
i 6.967236 60.49695 0.5378755 104 83.90088 0 0.1 0 0 0 1 
i 6.599163 60.52233 0.7171673 77 79.03447 0 0.1 0 0 0 1 
i 6.844545 60.52233 0.7171673 72 79.43698 0 0.1 0 0 0 1 
i 7.335308 60.52233 0.7171673 82 80.24201 0 0.1 0 0 0 1 
i 8.261067 60.56138 1.434335 87 83.08713 0 0.1 0 0 0 1 
i 8.383757 60.56138 1.395288 84 83.28839 0 0.1 0 0 0 1 
i 8.567794 60.56138 0.7171673 83 83.59027 0 0.1 0 0 0 1 
i 9.119902 60.56138 1.434335 98 84.49593 0 0.1 0 0 0 1 
i 9.487975 60.56138 0.7171673 101 85.09971 0 0.1 0 0 0 1 
i 6.476473 60.69725 1.075751 75 78.85065 0 0.1 0 0 0 1 
i 2.784594 60.8208 0.5378755 59 70.14088 0 0.1 0 0 0 1 
i 3.091321 60.8208 0.5378755 52 70.64403 0 0.1 0 0 0 1 
i 3.336703 60.8208 0.58228 62 71.04654 0 0.1 0 0 0 1 
i 3.520739 60.8208 0.5378755 68 71.34843 0 0.1 0 0 0 1 
i 1.061345 60.85163 1.075751 53 70.23212 0 0.1 0 0 0 1 
i 1.122691 60.85163 0.5378755 54 70.33275 0 0.1 0 0 0 1 
i 1.490763 60.85163 0.5378755 48 70.93652 0 0.1 0 0 0 1 
i 1.6748 60.85163 1.075751 47 71.23841 0 0.1 0 0 0 1 
i 1.981527 60.85163 1.075751 56 71.74155 0 0.1 0 0 0 1 
i 2.165563 60.85163 0.5378755 55 72.04344 0 0.1 0 0 0 1 
i 2.784594 60.8652 0.5378755 64 74.38541 0 0.1 0 0 0 1 
i 3.888811 60.8652 0.5378755 73 76.19673 0 0.1 0 0 0 1 
i 4.011502 60.8652 0.5378755 76 76.39799 0 0.1 0 0 0 1 
i 4.630533 61.15942 0.5378755 57 74.49476 0 0.1 0 0 0 1 
i 5.059951 61.15942 0.5378755 45 75.19916 0 0.1 0 0 0 1 
i 6.415127 61.23948 1.075751 98 82.99455 0 0.1 0 0 0 1 
i 6.476473 61.23948 0.5378755 97 83.09518 0 0.1 0 0 0 1 
i 6.844545 61.23948 1.075751 103 83.69895 0 0.1 0 0 0 1 
i 7.028581 61.23948 1.075751 104 84.00084 0 0.1 0 0 0 1 
i 6.353782 61.2395 2.580831 74 78.63195 0 0.1 0 0 0 1 
i 7.089927 61.2395 0.7171673 70 79.8395 0 0.1 0 0 0 1 
i 7.58069 61.2395 0.7171673 79 80.64453 0 0.1 0 0 0 1 
i 8.445103 61.27855 0.7171673 85 83.38901 0 0.1 0 0 0 1 
i 8.506448 61.27855 0.7171673 84 83.48964 0 0.1 0 0 0 1 
i 9.365284 61.27855 0.7171673 100 84.89845 0 0.1 0 0 0 1 
i 9.54932 61.27855 0.7171673 101 85.20034 0 0.1 0 0 0 1 
i 1.184036 61.38951 0.5378755 55 70.43338 0 0.1 0 0 0 1 
i 1.552109 61.38951 0.5378755 48 71.03715 0 0.1 0 0 0 1 
i 2.042872 61.38951 0.5378755 57 71.84218 0 0.1 0 0 0 1 
i 2.47229 61.38951 0.5378755 62 72.54658 0 0.1 0 0 0 1 
i 2.907285 61.60219 1.075751 64 74.586 0 0.1 0 0 0 1 
i 3.029976 61.60219 1.075751 62 74.78725 0 0.1 0 0 0 1 
i 3.214012 61.60219 0.5378755 61 75.08914 0 0.1 0 0 0 1 
i 3.766121 61.60219 1.075751 75 75.9948 0 0.1 0 0 0 1 
i 3.950157 61.60219 1.075751 74 76.29669 0 0.1 0 0 0 1 
i 4.072848 61.60219 1.075751 76 76.49795 0 0.1 0 0 0 1 
i 4.134193 61.60219 1.075751 77 76.59857 0 0.1 0 0 0 1 
i 4.569188 61.6973 0.5378755 56 74.39413 0 0.1 0 0 0 1 
i 5.121297 61.6973 0.5378755 44 75.29979 0 0.1 0 0 0 1 
i 2.907285 61.71651 0.5378755 39 70.34147 0 0.1 0 0 0 1 
i 3.029976 61.71651 0.5378755 42 70.54273 0 0.1 0 0 0 1 
i 3.275357 61.71651 0.5378755 37 70.94524 0 0.1 0 0 0 1 
i 3.64343 61.71651 0.5378755 34 71.54901 0 0.1 0 0 0 1 
i 6.537818 61.77736 0.5378755 97 83.19581 0 0.1 0 0 0 1 
i 6.599163 61.7972 1.434335 77 79.03379 0 0.1 0 0 0 1 
i 6.844545 61.7972 0.7171673 72 79.43631 0 0.1 0 0 0 1 
i 7.151272 61.7972 0.7171673 69 79.93945 0 0.1 0 0 0 1 
i 7.335308 61.7972 1.434335 82 80.24134 0 0.1 0 0 0 1 
i 7.642036 61.7972 0.7171673 78 80.74449 0 0.1 0 0 0 1 
i 7.887417 61.7972 0.7171673 83 81.147 0 0.1 0 0 0 1 
i 5.550715 61.9067 0.5378755 87 80.25006 0 0.1 0 0 0 1 
i 6.415127 62.10279 0.5378755 81 78.74935 0 0.1 0 0 0 1 
i 6.476473 62.10279 0.5378755 83 78.84998 0 0.1 0 0 0 1 
i 2.96863 62.14007 0.5378755 65 74.68662 0 0.1 0 0 0 1 
i 2.784594 62.25439 0.5378755 41 70.14021 0 0.1 0 0 0 1 
i 3.152666 62.25439 0.5378755 43 70.74398 0 0.1 0 0 0 1 
i 3.398048 62.25439 0.5378755 38 71.1465 0 0.1 0 0 0 1 
i 3.520739 62.25439 0.5378755 36 71.34776 0 0.1 0 0 0 1 
i 8.629139 62.25878 0.7171673 85 83.69023 0 0.1 0 0 0 1 
i 9.119902 62.25878 0.7171673 95 84.49526 0 0.1 0 0 0 1 
i 1.245382 62.386 0.5378755 54 70.53333 0 0.1 0 0 0 1 
i 1.490763 62.386 0.5378755 50 70.93585 0 0.1 0 0 0 1 
i 1.981527 62.386 0.5378755 58 71.74088 0 0.1 0 0 0 1 
i 4.569188 62.44458 0.5378755 80 78.64 0 0.1 0 0 0 1 
i 6.905891 62.51437 0.7171673 73 79.53694 0 0.1 0 0 0 1 
i 7.089927 62.51437 0.7171673 70 79.83883 0 0.1 0 0 0 1 
i 7.58069 62.51437 0.7171673 79 80.64386 0 0.1 0 0 0 1 
i 7.826072 62.51437 0.7171673 84 81.04637 0 0.1 0 0 0 1 
i 8.132799 62.51437 0.7171673 87 81.54952 0 0.1 0 0 0 1 
i 4.691879 62.59924 0.5378755 64 74.59472 0 0.1 0 0 0 1 
i 5.059951 62.59924 0.5378755 72 75.19849 0 0.1 0 0 0 1 
i 6.353782 62.64067 0.5378755 82 78.64872 0 0.1 0 0 0 1 
i 6.537818 62.64067 0.5378755 84 78.95061 0 0.1 0 0 0 1 
i 6.599163 62.71352 0.5378755 98 83.29577 0 0.1 0 0 0 1 
i 6.844545 62.71352 0.5378755 102 83.69828 0 0.1 0 0 0 1 
i 1 62.92387 0.5378755 52 70.13082 0 0.1 0 0 0 1 
i 1.736145 62.92387 0.5378755 47 71.33836 0 0.1 0 0 0 1 
i 2.226908 62.92387 0.5378755 56 72.1434 0 0.1 0 0 0 1 
i 2.47229 62.92387 0.5378755 60 72.54591 0 0.1 0 0 0 1 
i 8.138376 62.97595 0.7171673 90 82.8852 0 0.1 0 0 0 1 
i 9.610666 62.97595 0.7171673 99 85.30029 0 0.1 0 0 0 1 
i 2.845939 63.04933 1.075751 42 70.24017 0 0.1 0 0 0 1 
i 2.907285 63.04933 1.075751 41 70.3408 0 0.1 0 0 0 1 
i 3.029976 63.04933 1.075751 43 70.54205 0 0.1 0 0 0 1 
i 3.214012 63.04933 0.5378755 44 70.84394 0 0.1 0 0 0 1 
i 3.275357 63.04933 1.075751 39 70.94457 0 0.1 0 0 0 1 
i 3.459394 63.04933 1.075751 40 71.24646 0 0.1 0 0 0 1 
i 3.582084 63.04933 0.5378755 38 71.44771 0 0.1 0 0 0 1 
i 3.64343 63.04933 1.075751 37 71.54834 0 0.1 0 0 0 1 
i 6.599163 63.10316 0.7171673 76 79.03312 0 0.1 0 0 0 1 
i 6.844545 63.10316 0.7171673 71 79.43564 0 0.1 0 0 0 1 
i 7.212618 63.10316 0.7171673 69 80.03941 0 0.1 0 0 0 1 
i 7.335308 63.10316 0.7171673 81 80.24067 0 0.1 0 0 0 1 
i 7.703381 63.10316 0.7171673 78 80.84444 0 0.1 0 0 0 1 
i 7.948763 63.10316 0.7171673 83 81.24696 0 0.1 0 0 0 1 
i 8.071453 63.10316 0.7171673 85 81.44822 0 0.1 0 0 0 1 
i 4.569188 63.13712 0.5378755 66 74.39346 0 0.1 0 0 0 1 
i 5.182642 63.13712 0.5378755 74 75.39975 0 0.1 0 0 0 1 
i 6.353782 63.25139 0.5378755 100 82.89325 0 0.1 0 0 0 1 
i 7.089927 63.25139 0.5378755 104 84.1008 0 0.1 0 0 0 1 
i 4.630533 63.31225 1.075751 79 78.73996 0 0.1 0 0 0 1 
i 5.550715 63.31225 1.075751 88 80.24939 0 0.1 0 0 0 1 
i 3.275357 63.37675 1.876487 63 75.1891 0 0.1 0 0 0 1 
i 3.766121 63.37675 0.5378755 71 75.99413 0 0.1 0 0 0 1 
i 8.199721 63.53919 0.7171673 91 82.98516 0 0.1 0 0 0 1 
i 8.629139 63.53919 0.7171673 85 83.68956 0 0.1 0 0 0 1 
i 9.119902 63.53919 1.434335 94 84.49459 0 0.1 0 0 0 1 
i 9.672011 63.53919 1.434335 100 85.40025 0 0.1 0 0 0 1 
i 3.336703 63.5872 0.5378755 38 71.0452 0 0.1 0 0 0 1 
i 3.704775 63.5872 0.5378755 36 71.64897 0 0.1 0 0 0 1 
i 1.061345 63.71882 0.5378755 51 70.23078 0 0.1 0 0 0 1 
i 1.245382 63.71882 0.5378755 54 70.53266 0 0.1 0 0 0 1 
i 1.490763 63.71882 0.5378755 50 70.93518 0 0.1 0 0 0 1 
i 1.79749 63.71882 1.075751 47 71.43832 0 0.1 0 0 0 1 
i 1.981527 63.71882 0.5378755 58 71.74021 0 0.1 0 0 0 1 
i 2.288254 63.71882 0.5378755 55 72.24335 0 0.1 0 0 0 1 
i 2.533635 63.71882 0.5378755 60 72.64587 0 0.1 0 0 0 1 
i 6.599163 63.72088 0.5378755 64 79.05057 0 0.1 0 0 0 1 
i 6.353782 63.82033 1.931328 75 78.63061 0 0.1 0 0 0 1 
i 6.721854 63.82033 0.7171673 77 79.23438 0 0.1 0 0 0 1 
i 6.967236 63.82033 1.931328 73 79.6369 0 0.1 0 0 0 1 
i 7.089927 63.82033 0.7171673 70 79.83816 0 0.1 0 0 0 1 
i 7.457999 63.82033 0.7171673 82 80.44193 0 0.1 0 0 0 1 
i 7.58069 63.82033 1.21416 80 80.64319 0 0.1 0 0 0 1 
i 7.826072 63.82033 0.7171673 84 81.0457 0 0.1 0 0 0 1 
i 8.194144 63.82033 1.21416 87 81.64948 0 0.1 0 0 0 1 
i 2.784594 63.91462 0.5378755 67 74.38407 0 0.1 0 0 0 1 
i 4.256884 63.91462 0.5378755 76 76.79916 0 0.1 0 0 0 1 
i 4.630533 63.93786 1.075751 62 74.49342 0 0.1 0 0 0 1 
i 5.059951 63.93786 1.075751 64 75.19782 0 0.1 0 0 0 1 
i 5.243987 63.93786 0.5378755 65 75.49971 0 0.1 0 0 0 1 
i 6.415127 63.99393 0.5378755 101 82.99321 0 0.1 0 0 0 1 
i 6.599163 63.99393 0.5378755 98 83.29509 0 0.1 0 0 0 1 
i 6.844545 63.99393 1.075751 102 83.69761 0 0.1 0 0 0 1 
i 7.151272 63.99393 1.075751 105 84.20075 0 0.1 0 0 0 1 
i 8.138376 64.25636 0.7171673 90 82.88453 0 0.1 0 0 0 1 
i 8.690484 64.25636 0.7171673 84 83.79019 0 0.1 0 0 0 1 
i 1 64.25669 0.5378755 52 70.13015 0 0.1 0 0 0 1 
i 1.306727 64.25669 0.5378755 55 70.63329 0 0.1 0 0 0 1 
i 1.552109 64.25669 0.5378755 50 71.03581 0 0.1 0 0 0 1 
i 2.042872 64.25669 0.5378755 59 71.84084 0 0.1 0 0 0 1 
i 2.226908 64.25669 0.5378755 56 72.14273 0 0.1 0 0 0 1 
i 2.47229 64.25669 0.5378755 60 72.54524 0 0.1 0 0 0 1 
i 6.353782 64.25876 0.5378755 69 78.64805 0 0.1 0 0 0 1 
i 6.476473 64.31733 0.7171673 74 78.83119 0 0.1 0 0 0 1 
i 6.599163 64.31733 1.434335 76 79.03245 0 0.1 0 0 0 1 
i 6.7832 64.31733 0.7171673 78 79.33434 0 0.1 0 0 0 1 
i 6.844545 64.31733 1.434335 72 79.43497 0 0.1 0 0 0 1 
i 7.151272 64.31733 1.434335 71 79.93811 0 0.1 0 0 0 1 
i 7.212618 64.31733 1.434335 69 80.03874 0 0.1 0 0 0 1 
i 7.335308 64.31733 1.434335 81 80.24 0 0.1 0 0 0 1 
i 7.519345 64.31733 0.7171673 82 80.54189 0 0.1 0 0 0 1 
i 7.703381 64.31733 1.434335 79 80.84377 0 0.1 0 0 0 1 
i 7.887417 64.31733 1.434335 85 81.14566 0 0.1 0 0 0 1 
i 7.948763 64.31733 1.434335 83 81.24629 0 0.1 0 0 0 1 
i 8.071453 64.31733 1.434335 86 81.44755 0 0.1 0 0 0 1 
i 6.353782 64.5318 0.5378755 100 82.89258 0 0.1 0 0 0 1 
i 6.660509 64.5318 0.5378755 97 83.39572 0 0.1 0 0 0 1 
i 2.845939 64.71536 0.5378755 68 74.48403 0 0.1 0 0 0 1 
i 3.766121 64.71536 1.075751 71 75.99346 0 0.1 0 0 0 1 
i 4.318229 64.71536 0.5378755 77 76.89912 0 0.1 0 0 0 1 
i 4.691879 64.75207 0.5378755 78 78.83992 0 0.1 0 0 0 1 
i 5.550715 64.75207 0.5378755 88 80.24872 0 0.1 0 0 0 1 
i 8.261067 64.85083 0.7171673 91 83.08512 0 0.1 0 0 0 1 
i 8.629139 64.85083 0.7171673 85 83.68889 0 0.1 0 0 0 1 
i 9.119902 64.85083 0.7171673 95 84.49392 0 0.1 0 0 0 1 
i 9.733357 64.85083 0.7171673 101 85.50021 0 0.1 0 0 0 1 
i 6.721854 65.03449 0.7171673 77 79.23371 0 0.1 0 0 0 1 
i 7.089927 65.03449 0.7171673 70 79.83748 0 0.1 0 0 0 1 
i 7.457999 65.03449 0.7171673 82 80.44126 0 0.1 0 0 0 1 
i 7.764726 65.03449 0.7171673 78 80.9444 0 0.1 0 0 0 1 
i 7.826072 65.03449 0.7171673 84 81.04503 0 0.1 0 0 0 1 
i 1.122691 65.08414 0.5378755 51 70.33073 0 0.1 0 0 0 1 
i 1.245382 65.08414 0.5378755 53 70.53199 0 0.1 0 0 0 1 
i 1.490763 65.08414 0.5378755 49 70.93451 0 0.1 0 0 0 1 
i 1.858836 65.08414 0.5378755 47 71.53828 0 0.1 0 0 0 1 
i 1.981527 65.08414 0.5378755 58 71.73954 0 0.1 0 0 0 1 
i 2.349599 65.08414 0.5378755 55 72.34331 0 0.1 0 0 0 1 
i 2.594981 65.08414 0.5378755 60 72.74583 0 0.1 0 0 0 1 
i 2.717672 65.08414 0.7069708 62 72.94709 0 0.1 0 0 0 1 
i 6.415127 65.12642 0.5378755 81 78.74801 0 0.1 0 0 0 1 
i 6.599163 65.12642 0.5378755 86 79.0499 0 0.1 0 0 0 1 
i 2.784594 65.25324 0.5378755 67 74.3834 0 0.1 0 0 0 1 
i 4.256884 65.25324 0.5378755 76 76.79849 0 0.1 0 0 0 1 
i 4.569188 65.28994 0.5378755 79 78.63866 0 0.1 0 0 0 1 
i 5.673405 65.28994 0.5378755 89 80.44998 0 0.1 0 0 0 1 
i 6.476473 65.30557 0.5378755 101 83.09317 0 0.1 0 0 0 1 
i 6.599163 65.30557 0.5378755 99 83.29442 0 0.1 0 0 0 1 
i 6.844545 65.30557 0.5378755 103 83.69694 0 0.1 0 0 0 1 
i 7.212618 65.30557 0.5378755 106 84.30071 0 0.1 0 0 0 1 
i 8.138376 65.32936 0.5378755 92 82.9013 0 0.1 0 0 0 1 
i 4.81457 65.47889 0.5378755 57 74.79463 0 0.1 0 0 0 1 
i 5.059951 65.47889 0.5378755 51 75.19715 0 0.1 0 0 0 1 
i 3.766121 65.54249 0.5378755 42 71.74893 0 0.1 0 0 0 1 
i 8.138376 65.568 1.219439 90 82.88386 0 0.1 0 0 0 1 
i 8.75183 65.568 1.936607 84 83.89015 0 0.1 0 0 0 1 
i 9.242593 65.568 1.936607 93 84.69518 0 0.1 0 0 0 1 
i 9.610666 65.568 1.219439 99 85.29895 0 0.1 0 0 0 1 
i 1 65.62202 0.5378755 52 70.12948 0 0.1 0 0 0 1 
i 1.368072 65.62202 0.5378755 55 70.73325 0 0.1 0 0 0 1 
i 1.613454 65.62202 0.5378755 50 71.13577 0 0.1 0 0 0 1 
i 1.736145 65.62202 0.5378755 48 71.33702 0 0.1 0 0 0 1 
i 2.104217 65.62202 0.5378755 59 71.9408 0 0.1 0 0 0 1 
i 2.226908 65.62202 0.5378755 57 72.14205 0 0.1 0 0 0 1 
i 2.47229 65.62202 0.5378755 61 72.54457 0 0.1 0 0 0 1 
i 2.840362 65.62202 1.807225 63 73.14834 0 0.1 0 0 0 1 
i 6.353782 65.6643 0.5378755 82 78.64738 0 0.1 0 0 0 1 
i 6.660509 65.6643 0.5378755 87 79.15052 0 0.1 0 0 0 1 
i 6.353782 65.84344 0.5378755 100 82.89191 0 0.1 0 0 0 1 
i 6.721854 65.84344 0.5378755 98 83.49568 0 0.1 0 0 0 1 
i 6.967236 65.84344 0.5378755 102 83.8982 0 0.1 0 0 0 1 
i 7.089927 65.84344 0.5378755 104 84.09945 0 0.1 0 0 0 1 
i 4.569188 66.01677 0.5378755 53 74.39212 0 0.1 0 0 0 1 
i 5.305333 66.01677 0.5378755 47 75.59966 0 0.1 0 0 0 1 
i 8.261067 66.07027 2.12101 91 83.08444 0 0.1 0 0 0 1 
i 8.813175 66.07027 0.7171673 83 83.9901 0 0.1 0 0 0 1 
i 9.119902 66.07027 1.434335 94 84.49325 0 0.1 0 0 0 1 
i 9.733357 66.07027 2.12101 101 85.49954 0 0.1 0 0 0 1 
i 2.784594 66.08037 0.5378755 47 70.13887 0 0.1 0 0 0 1 
i 2.907285 66.08662 0.5378755 68 74.58398 0 0.1 0 0 0 1 
i 3.766121 66.08662 0.5378755 71 75.99279 0 0.1 0 0 0 1 
i 4.379575 66.08662 0.5378755 77 76.99908 0 0.1 0 0 0 1 
i 4.630533 66.09068 0.5378755 79 78.73862 0 0.1 0 0 0 1 
i 4.691879 66.09068 1.264699 77 78.83925 0 0.1 0 0 0 1 
i 5.550715 66.09068 0.5378755 89 80.24805 0 0.1 0 0 0 1 
i 5.734751 66.09068 1.075751 90 80.54994 0 0.1 0 0 0 1 
i 8.199721 66.20314 1.075751 87 83.00126 0 0.1 0 0 0 1 
i 1.061345 66.35349 1.075751 53 70.22943 0 0.1 0 0 0 1 
i 1.122691 66.35349 1.075751 52 70.33006 0 0.1 0 0 0 1 
i 1.245382 66.35349 1.075751 54 70.53132 0 0.1 0 0 0 1 
i 1.429418 66.35349 0.5378755 55 70.83321 0 0.1 0 0 0 1 
i 1.490763 66.35349 0.5378755 49 70.93384 0 0.1 0 0 0 1 
i 1.6748 66.35349 1.075751 50 71.23572 0 0.1 0 0 0 1 
i 1.79749 66.35349 1.075751 48 71.43698 0 0.1 0 0 0 1 
i 1.858836 66.35349 1.075751 47 71.53761 0 0.1 0 0 0 1 
i 1.981527 66.35349 1.075751 58 71.73887 0 0.1 0 0 0 1 
i 2.165563 66.35349 0.5378755 59 72.04075 0 0.1 0 0 0 1 
i 2.288254 66.35349 1.075751 57 72.24201 0 0.1 0 0 0 1 
i 2.349599 66.35349 1.075751 56 72.34264 0 0.1 0 0 0 1 
i 2.533635 66.35349 0.5378755 61 72.64453 0 0.1 0 0 0 1 
i 2.594981 66.35349 1.075751 60 72.74516 0 0.1 0 0 0 1 
i 2.717672 66.35349 2.083751 62 72.94642 0 0.1 0 0 0 1 
i 6.415127 66.52501 0.5378755 100 82.99187 0 0.1 0 0 0 1 
i 6.476473 66.52501 1.075751 101 83.09249 0 0.1 0 0 0 1 
i 6.599163 66.52501 0.5378755 99 83.29375 0 0.1 0 0 0 1 
i 6.7832 66.52501 1.075751 98 83.59564 0 0.1 0 0 0 1 
i 6.844545 66.52501 1.075751 103 83.69627 0 0.1 0 0 0 1 
i 7.028581 66.52501 1.075751 102 83.99816 0 0.1 0 0 0 1 
i 7.151272 66.52501 1.075751 104 84.19941 0 0.1 0 0 0 1 
i 7.212618 66.52501 1.075751 105 84.30004 0 0.1 0 0 0 1 
i 6.476473 66.56625 0.5378755 74 78.84797 0 0.1 0 0 0 1 
i 6.599163 66.56625 0.5378755 73 79.04922 0 0.1 0 0 0 1 
i 2.784594 66.6245 0.5378755 67 74.38273 0 0.1 0 0 0 1 
i 3.888811 66.6245 0.5378755 70 76.19405 0 0.1 0 0 0 1 
i 4.256884 66.6245 0.5378755 76 76.79782 0 0.1 0 0 0 1 
i 4.569188 66.62856 0.5378755 78 78.63799 0 0.1 0 0 0 1 
i 5.61206 66.62856 0.5378755 88 80.34868 0 0.1 0 0 0 1 
i 8.322412 66.78744 0.7171673 92 83.18507 0 0.1 0 0 0 1 
i 8.690484 66.78744 0.7171673 85 83.78885 0 0.1 0 0 0 1 
i 9.610666 66.78744 0.7171673 100 85.29828 0 0.1 0 0 0 1 
i 4.630533 66.8175 0.5378755 74 74.49208 0 0.1 0 0 0 1 
i 4.81457 66.8175 0.5378755 68 74.79396 0 0.1 0 0 0 1 
i 5.366678 66.8175 0.5378755 83 75.69962 0 0.1 0 0 0 1 
i 1.184036 66.89137 0.5378755 51 70.43069 0 0.1 0 0 0 1 
i 1.552109 66.89137 0.5378755 49 71.03447 0 0.1 0 0 0 1 
i 2.410945 66.89137 0.5378755 55 72.44327 0 0.1 0 0 0 1 
i 2.47229 66.89137 0.5378755 61 72.5439 0 0.1 0 0 0 1 
i 2.845939 67.01192 0.5378755 49 70.23883 0 0.1 0 0 0 1 
i 3.766121 67.01192 0.5378755 40 71.74826 0 0.1 0 0 0 1 
i 6.660509 67.06288 0.5378755 100 83.39438 0 0.1 0 0 0 1 
i 7.273963 67.06288 0.5378755 106 84.40067 0 0.1 0 0 0 1 
i 6.353782 67.10412 0.5378755 73 78.64671 0 0.1 0 0 0 1 
i 6.721854 67.10412 0.5378755 72 79.25048 0 0.1 0 0 0 1 
i 4.569188 67.35538 0.5378755 73 74.39145 0 0.1 0 0 0 1 
i 4.875915 67.35538 0.5378755 67 74.89459 0 0.1 0 0 0 1 
i 5.121297 67.35538 0.5378755 76 75.29711 0 0.1 0 0 0 1 
i 5.305333 67.35538 0.5378755 82 75.59899 0 0.1 0 0 0 1 
i 2.845939 67.36149 0.5378755 67 74.48268 0 0.1 0 0 0 1 
i 2.907285 67.36149 1.075751 68 74.58331 0 0.1 0 0 0 1 
i 3.459394 67.36149 0.5378755 61 75.48897 0 0.1 0 0 0 1 
i 3.766121 67.36149 1.075751 71 75.99212 0 0.1 0 0 0 1 
i 3.950157 67.36149 1.075751 70 76.294 0 0.1 0 0 0 1 
i 4.318229 67.36149 1.075751 76 76.89778 0 0.1 0 0 0 1 
i 4.379575 67.36149 1.075751 77 76.99841 0 0.1 0 0 0 1 
i 8.629139 67.47411 0.7171673 86 83.68755 0 0.1 0 0 0 1 
i 9.119902 67.47411 0.7171673 96 84.49258 0 0.1 0 0 0 1 
i 2.784594 67.5498 0.5378755 48 70.1382 0 0.1 0 0 0 1 
i 3.827466 67.5498 0.5378755 39 71.84889 0 0.1 0 0 0 1 
i 4.81457 67.63172 0.5378755 77 79.03983 0 0.1 0 0 0 1 
i 5.550715 67.63172 0.5378755 88 80.24738 0 0.1 0 0 0 1 
i 8.261067 67.64922 1.075751 89 83.10122 0 0.1 0 0 0 1 
i 2.96863 67.89937 0.5378755 69 74.68394 0 0.1 0 0 0 1 
i 3.336703 67.89937 0.5378755 63 75.28771 0 0.1 0 0 0 1 
i 6.415127 67.90486 1.075751 67 78.74667 0 0.1 0 0 0 1 
i 6.476473 67.90486 0.5378755 68 78.8473 0 0.1 0 0 0 1 
i 6.599163 67.90486 0.5378755 65 79.04855 0 0.1 0 0 0 1 
i 6.7832 67.90486 0.5378755 63 79.35044 0 0.1 0 0 0 1 
i 4.569188 68.16959 0.5378755 79 78.63732 0 0.1 0 0 0 1 
i 5.796096 68.16959 0.5378755 90 80.6499 0 0.1 0 0 0 1 
i 4.691879 68.18876 0.5378755 54 74.59203 0 0.1 0 0 0 1 
i 4.81457 68.18876 0.5378755 56 74.79329 0 0.1 0 0 0 1 
i 5.059951 68.18876 0.5378755 51 75.19581 0 0.1 0 0 0 1 
i 5.428024 68.18876 0.5378755 48 75.79958 0 0.1 0 0 0 1 
i 8.138376 68.19128 2.468621 88 82.88252 0 0.1 0 0 0 1 
i 8.874521 68.19128 0.7171673 84 84.09006 0 0.1 0 0 0 1 
i 9.365284 68.19128 2.468621 93 84.89509 0 0.1 0 0 0 1 
i 9.610666 68.19128 0.7171673 98 85.29761 0 0.1 0 0 0 1 
i 6.537818 68.44273 0.5378755 69 78.94792 0 0.1 0 0 0 1 
i 6.660509 68.44273 0.5378755 66 79.14918 0 0.1 0 0 0 1 
i 6.721854 68.44273 0.5378755 64 79.24981 0 0.1 0 0 0 1 
i 2.907285 68.51719 0.5378755 41 70.33878 0 0.1 0 0 0 1 
i 3.766121 68.51719 0.5378755 62 71.74759 0 0.1 0 0 0 1 
i 8.383757 68.69355 0.7171673 91 83.28436 0 0.1 0 0 0 1 
i 8.629139 68.69355 0.7171673 86 83.68688 0 0.1 0 0 0 1 
i 8.935866 68.69355 0.7171673 83 84.19002 0 0.1 0 0 0 1 
i 9.119902 68.69355 1.434335 96 84.49191 0 0.1 0 0 0 1 
i 9.672011 68.69355 0.7171673 97 85.39757 0 0.1 0 0 0 1 
i 9.856047 68.69355 0.7171673 100 85.69945 0 0.1 0 0 0 1 
i 4.569188 68.72664 0.5378755 55 74.39078 0 0.1 0 0 0 1 
i 4.93726 68.72664 0.5378755 58 74.99455 0 0.1 0 0 0 1 
i 5.182642 68.72664 0.5378755 52 75.39706 0 0.1 0 0 0 1 
i 5.305333 68.72664 0.5378755 50 75.59832 0 0.1 0 0 0 1 
i 7.335308 68.80609 0.5378755 101 84.50063 0 0.1 0 0 0 1 
i 3.029976 68.82914 0.5378755 68 74.7839 0 0.1 0 0 0 1 
i 3.275357 68.82914 0.5378755 64 75.18642 0 0.1 0 0 0 1 
i 3.766121 68.82914 0.5378755 73 75.99145 0 0.1 0 0 0 1 
i 4.502266 68.82914 0.6790605 77 77.19899 0 0.1 0 0 0 1 
i 4.630533 68.97033 0.5378755 80 78.73727 0 0.1 0 0 0 1 
i 5.550715 68.97033 0.5378755 88 80.24671 0 0.1 0 0 0 1 
i 5.857442 68.97033 0.5378755 91 80.74985 0 0.1 0 0 0 1 
i 8.199721 68.99365 1.075751 96 82.99992 0 0.1 0 0 0 1 
i 8.261067 68.99365 0.5378755 97 83.10055 0 0.1 0 0 0 1 
i 2.784594 69.05507 0.5378755 44 70.13753 0 0.1 0 0 0 1 
i 3.888811 69.05507 0.5378755 65 71.94885 0 0.1 0 0 0 1 
i 6.353782 69.34396 0.5378755 94 82.89057 0 0.1 0 0 0 1 
i 2.784594 69.36702 0.5378755 66 74.38138 0 0.1 0 0 0 1 
i 3.520739 69.36702 0.5378755 62 75.58893 0 0.1 0 0 0 1 
i 4.011502 69.36702 0.5378755 70 76.39396 0 0.1 0 0 0 1 
i 4.256884 69.36702 0.5378755 74 76.79648 0 0.1 0 0 0 1 
i 8.445103 69.41072 0.7171673 92 83.38499 0 0.1 0 0 0 1 
i 8.690484 69.41072 0.7171673 87 83.78751 0 0.1 0 0 0 1 
i 8.874521 69.41072 0.7171673 84 84.08939 0 0.1 0 0 0 1 
i 9.610666 69.41072 0.7171673 98 85.29694 0 0.1 0 0 0 1 
i 9.917393 69.41072 0.7171673 101 85.80008 0 0.1 0 0 0 1 
i 4.630533 69.46363 1.075751 56 74.49073 0 0.1 0 0 0 1 
i 4.691879 69.46363 1.075751 55 74.59136 0 0.1 0 0 0 1 
i 4.81457 69.46363 1.075751 57 74.79262 0 0.1 0 0 0 1 
i 4.998606 69.46363 1.075751 58 75.09451 0 0.1 0 0 0 1 
i 5.059951 69.46363 1.075751 53 75.19514 0 0.1 0 0 0 1 
i 5.243987 69.46363 1.075751 54 75.49702 0 0.1 0 0 0 1 
i 5.366678 69.46363 1.075751 52 75.69828 0 0.1 0 0 0 1 
i 5.428024 69.46363 1.075751 51 75.79891 0 0.1 0 0 0 1 
i 4.569188 69.5082 0.5378755 79 78.63665 0 0.1 0 0 0 1 
i 4.875915 69.5082 0.5378755 76 79.13979 0 0.1 0 0 0 1 
i 5.61206 69.5082 0.5378755 87 80.34734 0 0.1 0 0 0 1 
i 5.796096 69.5082 0.5378755 90 80.64922 0 0.1 0 0 0 1 
i 8.322412 69.53153 0.5378755 98 83.20117 0 0.1 0 0 0 1 
i 6.844545 69.76814 0.5378755 86 79.4504 0 0.1 0 0 0 1 
i 2.845939 69.91665 0.5378755 51 70.23748 0 0.1 0 0 0 1 
i 2.907285 69.91665 0.5378755 53 70.33811 0 0.1 0 0 0 1 
i 3.766121 69.91665 0.5378755 32 71.74692 0 0.1 0 0 0 1 
i 3.950157 69.91665 0.5378755 30 72.04881 0 0.1 0 0 0 1 
i 8.383757 69.94274 0.7171673 90 83.28369 0 0.1 0 0 0 1 
i 8.629139 69.94274 0.7171673 86 83.68621 0 0.1 0 0 0 1 
i 8.997212 69.94274 0.7171673 83 84.28998 0 0.1 0 0 0 1 
i 9.119902 69.94274 0.7171673 95 84.49124 0 0.1 0 0 0 1 
i 9.733357 69.94274 0.7171673 97 85.49753 0 0.1 0 0 0 1 
i 9.856047 69.94274 0.7171673 100 85.69878 0 0.1 0 0 0 1 
i 2.845939 70.10401 1.075751 65 74.48134 0 0.1 0 0 0 1 
i 3.029976 70.10401 0.5378755 68 74.78323 0 0.1 0 0 0 1 
i 3.275357 70.10401 0.5378755 64 75.18574 0 0.1 0 0 0 1 
i 3.582084 70.10401 0.5378755 61 75.68889 0 0.1 0 0 0 1 
i 3.766121 70.10401 1.075751 73 75.99078 0 0.1 0 0 0 1 
i 4.072848 70.10401 1.075751 70 76.49392 0 0.1 0 0 0 1 
i 4.318229 70.10401 1.075751 74 76.89644 0 0.1 0 0 0 1 
i 4.502266 70.10401 1.075751 77 77.19832 0 0.1 0 0 0 1 
i 6.415127 70.15052 1.075751 93 82.99052 0 0.1 0 0 0 1 
i 7.335308 70.15052 0.5378755 102 84.49996 0 0.1 0 0 0 1 
i 6.353782 70.30602 0.5378755 79 78.64537 0 0.1 0 0 0 1 
i 4.691879 70.34159 0.5378755 79 78.83723 0 0.1 0 0 0 1 
i 5.550715 70.34159 0.5378755 89 80.24604 0 0.1 0 0 0 1 
i 5.918787 70.34159 0.5378755 91 80.84981 0 0.1 0 0 0 1 
i 2.784594 70.45453 0.5378755 52 70.13686 0 0.1 0 0 0 1 
i 2.96863 70.45453 0.5378755 54 70.43874 0 0.1 0 0 0 1 
i 3.827466 70.45453 0.5378755 33 71.84755 0 0.1 0 0 0 1 
i 3.888811 70.45453 0.5378755 31 71.94818 0 0.1 0 0 0 1 
i 8.383757 70.54139 0.5378755 78 83.30113 0 0.1 0 0 0 1 
i 2.784594 70.64189 0.5378755 66 74.38071 0 0.1 0 0 0 1 
i 3.091321 70.64189 0.5378755 69 74.88386 0 0.1 0 0 0 1 
i 3.520739 70.64189 0.5378755 62 75.58826 0 0.1 0 0 0 1 
i 8.138376 70.6599 1.878538 89 82.88117 0 0.1 0 0 0 1 
i 8.506448 70.6599 1.161371 92 83.48495 0 0.1 0 0 0 1 
i 8.75183 70.6599 1.878538 87 83.88746 0 0.1 0 0 0 1 
i 8.874521 70.6599 1.878538 85 84.08872 0 0.1 0 0 0 1 
i 9.242593 70.6599 0.7171673 96 84.69249 0 0.1 0 0 0 1 
i 9.365284 70.6599 1.878538 94 84.89375 0 0.1 0 0 0 1 
i 9.610666 70.6599 1.878538 99 85.29627 0 0.1 0 0 0 1 
i 9.978738 70.6599 1.878538 101 85.90004 0 0.1 0 0 0 1 
i 7.396654 70.6884 0.5378755 103 84.60059 0 0.1 0 0 0 1 
i 4.569188 70.87947 0.5378755 78 78.63597 0 0.1 0 0 0 1 
i 4.93726 70.87947 2.820421 76 79.23975 0 0.1 0 0 0 1 
i 5.673405 70.87947 0.5378755 88 80.4473 0 0.1 0 0 0 1 
i 5.796096 70.87947 0.5378755 90 80.64855 0 0.1 0 0 0 1 
i 8.138376 71.07926 0.5378755 83 82.89862 0 0.1 0 0 0 1 
i 8.261067 71.10411 1.434335 88 83.08176 0 0.1 0 0 0 1 
i 8.383757 71.10411 0.7171673 91 83.28302 0 0.1 0 0 0 1 
i 8.629139 71.10411 0.7171673 86 83.68553 0 0.1 0 0 0 1 
i 8.997212 71.10411 1.434335 84 84.28931 0 0.1 0 0 0 1 
i 9.119902 71.10411 1.434335 95 84.49057 0 0.1 0 0 0 1 
i 9.303939 71.10411 0.7171673 97 84.79245 0 0.1 0 0 0 1 
i 9.487975 71.10411 0.7171673 93 85.09434 0 0.1 0 0 0 1 
i 9.733357 71.10411 1.434335 98 85.49686 0 0.1 0 0 0 1 
i 9.856047 71.10411 0.7171673 100 85.69811 0 0.1 0 0 0 1 
i 6.415127 71.17368 0.5378755 71 78.74532 0 0.1 0 0 0 1 
i 6.844545 71.17368 0.5378755 59 79.44973 0 0.1 0 0 0 1 
i 2.907285 71.40997 1.075751 65 74.5813 0 0.1 0 0 0 1 
i 3.029976 71.40997 0.5378755 68 74.78256 0 0.1 0 0 0 1 
i 3.275357 71.40997 0.5378755 63 75.18507 0 0.1 0 0 0 1 
i 3.64343 71.40997 0.5378755 61 75.78885 0 0.1 0 0 0 1 
i 3.766121 71.40997 0.5378755 72 75.9901 0 0.1 0 0 0 1 
i 4.134193 71.40997 0.5378755 70 76.59388 0 0.1 0 0 0 1 
i 4.379575 71.40997 0.5378755 74 76.99639 0 0.1 0 0 0 1 
i 3.029976 71.52774 0.5378755 44 70.5387 0 0.1 0 0 0 1 
i 3.766121 71.52774 0.5378755 53 71.74625 0 0.1 0 0 0 1 
i 6.476473 71.52774 0.5378755 92 83.09048 0 0.1 0 0 0 1 
i 7.335308 71.52774 0.5378755 102 84.49929 0 0.1 0 0 0 1 
i 4.630533 71.61646 1.545553 78 78.73593 0 0.1 0 0 0 1 
i 4.691879 71.61646 1.075751 79 78.83656 0 0.1 0 0 0 1 
i 4.998606 71.61646 0.5378755 75 79.33971 0 0.1 0 0 0 1 
i 5.550715 71.61646 0.5378755 89 80.24537 0 0.1 0 0 0 1 
i 5.734751 71.61646 1.075751 88 80.54725 0 0.1 0 0 0 1 
i 5.857442 71.61646 1.075751 90 80.74851 0 0.1 0 0 0 1 
i 5.918787 71.61646 1.075751 91 80.84914 0 0.1 0 0 0 1 
i 6.353782 71.71156 0.5378755 70 78.6447 0 0.1 0 0 0 1 
i 6.905891 71.71156 0.5378755 58 79.55036 0 0.1 0 0 0 1 
i 8.445103 71.82127 0.7171673 90 83.38365 0 0.1 0 0 0 1 
i 8.506448 71.82127 0.7171673 91 83.48428 0 0.1 0 0 0 1 
i 9.058557 71.82127 0.7171673 83 84.38994 0 0.1 0 0 0 1 
i 9.242593 71.82127 0.7171673 96 84.69182 0 0.1 0 0 0 1 
i 9.54932 71.82127 0.7171673 92 85.19497 0 0.1 0 0 0 1 
i 9.794702 71.82127 0.7171673 97 85.59748 0 0.1 0 0 0 1 
i 5.550715 71.8484 0.5378755 56 75.9995 0 0.1 0 0 0 1 
i 8.199721 71.88582 0.5378755 95 82.99857 0 0.1 0 0 0 1 
i 8.383757 71.88582 0.5378755 100 83.30046 0 0.1 0 0 0 1 
i 2.784594 71.94785 0.5378755 67 74.38004 0 0.1 0 0 0 1 
i 3.152666 71.94785 0.5378755 69 74.98382 0 0.1 0 0 0 1 
i 3.520739 71.94785 0.5378755 62 75.58759 0 0.1 0 0 0 1 
i 3.888811 71.94785 0.5378755 73 76.19136 0 0.1 0 0 0 1 
i 4.011502 71.94785 0.5378755 71 76.39262 0 0.1 0 0 0 1 
i 4.256884 71.94785 0.5378755 75 76.79514 0 0.1 0 0 0 1 
i 4.624956 71.94785 0.7443586 77 77.39891 0 0.1 0 0 0 1 
i 2.784594 72.06561 0.5378755 46 70.13618 0 0.1 0 0 0 1 
i 4.011502 72.06561 0.5378755 55 72.14876 0 0.1 0 0 0 1 
i 6.353782 72.06562 0.5378755 93 82.88922 0 0.1 0 0 0 1 
i 7.457999 72.06562 0.5378755 104 84.70055 0 0.1 0 0 0 1 
i 5.980132 72.15433 0.5378755 92 80.94977 0 0.1 0 0 0 1 
i 4.569188 72.38627 0.5378755 62 74.38943 0 0.1 0 0 0 1 
i 8.138376 72.4237 0.5378755 96 82.89795 0 0.1 0 0 0 1 
i 8.445103 72.4237 0.5378755 101 83.40109 0 0.1 0 0 0 1 
i 6.476473 72.61351 0.5378755 78 78.84528 0 0.1 0 0 0 1 
i 6.844545 72.61351 0.5378755 87 79.44906 0 0.1 0 0 0 1 
i 2.845939 72.62414 1.075751 67 74.48 0 0.1 0 0 0 1 
i 2.907285 72.62414 1.075751 66 74.58063 0 0.1 0 0 0 1 
i 3.029976 72.62414 1.075751 68 74.78189 0 0.1 0 0 0 1 
i 3.214012 72.62414 0.5378755 69 75.08377 0 0.1 0 0 0 1 
i 3.275357 72.62414 1.075751 64 75.1844 0 0.1 0 0 0 1 
i 3.459394 72.62414 1.075751 65 75.48629 0 0.1 0 0 0 1 
i 3.582084 72.62414 0.5378755 63 75.68755 0 0.1 0 0 0 1 
i 3.64343 72.62414 1.075751 61 75.78818 0 0.1 0 0 0 1 
i 3.766121 72.62414 1.075751 72 75.98943 0 0.1 0 0 0 1 
i 3.950157 72.62414 1.075751 73 76.29132 0 0.1 0 0 0 1 
i 4.072848 72.62414 1.075751 71 76.49258 0 0.1 0 0 0 1 
i 4.134193 72.62414 1.075751 70 76.59321 0 0.1 0 0 0 1 
i 4.318229 72.62414 1.075751 75 76.89509 0 0.1 0 0 0 1 
i 4.379575 72.62414 1.075751 74 76.99572 0 0.1 0 0 0 1 
i 6.415127 72.80815 0.5378755 93 82.98918 0 0.1 0 0 0 1 
i 6.476473 72.80815 1.075751 92 83.08981 0 0.1 0 0 0 1 
i 7.335308 72.80815 1.075751 103 84.49862 0 0.1 0 0 0 1 
i 7.519345 72.80815 0.5378755 104 84.8005 0 0.1 0 0 0 1 
i 2.845939 72.92719 0.5378755 46 70.23614 0 0.1 0 0 0 1 
i 3.029976 72.92719 1.075751 42 70.53803 0 0.1 0 0 0 1 
i 3.766121 72.92719 0.5378755 55 71.74558 0 0.1 0 0 0 1 
i 4.072848 72.92719 1.075751 58 72.24872 0 0.1 0 0 0 1 
i 6.353782 73.15138 0.5378755 80 78.64403 0 0.1 0 0 0 1 
i 6.967236 73.15138 0.5378755 89 79.65031 0 0.1 0 0 0 1 
i 3.336703 73.16201 0.5378755 63 75.28503 0 0.1 0 0 0 1 
i 3.520739 73.16201 0.5378755 62 75.58692 0 0.1 0 0 0 1 
i 4.624956 73.16201 0.7668774 77 77.39824 0 0.1 0 0 0 1 
i 4.630533 73.25394 1.075751 63 74.48939 0 0.1 0 0 0 1 
i 5.550715 73.25394 0.5378755 54 75.99883 0 0.1 0 0 0 1 
i 8.261067 73.26304 1.075751 88 83.09853 0 0.1 0 0 0 1 
i 8.383757 73.26304 0.5378755 87 83.29979 0 0.1 0 0 0 1 
i 6.537818 73.34603 0.5378755 91 83.19044 0 0.1 0 0 0 1 
i 7.457999 73.34603 0.5378755 104 84.69987 0 0.1 0 0 0 1 
i 5.550715 73.39101 0.5378755 86 80.2447 0 0.1 0 0 0 1 
i 2.784594 73.46507 0.5378755 45 70.13551 0 0.1 0 0 0 1 
i 3.827466 73.46507 0.5378755 54 71.84621 0 0.1 0 0 0 1 
i 5.61206 73.79182 0.5378755 53 76.09945 0 0.1 0 0 0 1 
i 8.506448 73.80092 0.5378755 87 83.50105 0 0.1 0 0 0 1 
i 4.569188 73.92889 0.5378755 81 78.63463 0 0.1 0 0 0 1 
i 6.041478 73.92889 0.5378755 90 81.04973 0 0.1 0 0 0 1 
i 6.415127 73.95212 0.5378755 77 78.74398 0 0.1 0 0 0 1 
i 6.476473 73.95212 1.279521 76 78.84461 0 0.1 0 0 0 1 
i 6.844545 73.95212 1.075751 78 79.44839 0 0.1 0 0 0 1 
i 7.028581 73.95212 1.075751 79 79.75027 0 0.1 0 0 0 1 
i 6.599163 74.28219 0.5378755 91 83.2904 0 0.1 0 0 0 1 
i 7.335308 74.28219 0.5378755 102 84.49795 0 0.1 0 0 0 1 
i 2.907285 74.36078 0.5378755 50 70.3361 0 0.1 0 0 0 1 
i 3.029976 74.36078 0.5378755 55 70.53736 0 0.1 0 0 0 1 
i 3.766121 74.36078 0.5378755 29 71.74491 0 0.1 0 0 0 1 
i 4.134193 74.36078 0.5378755 24 72.34868 0 0.1 0 0 0 1 
i 6.537818 74.48999 0.5378755 76 78.94524 0 0.1 0 0 0 1 
i 8.199721 74.54346 0.5378755 81 82.99723 0 0.1 0 0 0 1 
i 8.261067 74.54346 1.075751 83 83.09786 0 0.1 0 0 0 1 
i 8.383757 74.54346 0.5378755 79 83.29912 0 0.1 0 0 0 1 
i 8.567794 74.54346 0.5378755 78 83.60101 0 0.1 0 0 0 1 
i 4.691879 74.69377 0.5378755 55 74.58935 0 0.1 0 0 0 1 
i 4.630533 74.72962 1.075751 82 78.73459 0 0.1 0 0 0 1 
i 5.059951 74.72962 0.5378755 77 79.43899 0 0.1 0 0 0 1 
i 5.550715 74.72962 1.075751 85 80.24403 0 0.1 0 0 0 1 
i 6.102823 74.72962 0.5378755 91 81.14969 0 0.1 0 0 0 1 
i 6.353782 74.82006 0.5378755 94 82.88788 0 0.1 0 0 0 1 
i 7.58069 74.82006 0.5378755 104 84.90046 0 0.1 0 0 0 1 
i 2.784594 74.89866 0.5378755 53 70.13484 0 0.1 0 0 0 1 
i 3.152666 74.89866 0.5378755 57 70.73862 0 0.1 0 0 0 1 
i 3.888811 74.89866 0.5378755 31 71.94616 0 0.1 0 0 0 1 
i 4.011502 74.89866 0.5378755 27 72.14742 0 0.1 0 0 0 1 
i 8.138376 75.08133 0.5378755 82 82.8966 0 0.1 0 0 0 1 
i 8.445103 75.08133 0.5378755 80 83.39975 0 0.1 0 0 0 1 
i 8.506448 75.08133 0.5378755 79 83.50038 0 0.1 0 0 0 1 
i 4.569188 75.23164 0.5378755 58 74.38809 0 0.1 0 0 0 1 
i 5.673405 75.23164 0.5378755 79 76.19941 0 0.1 0 0 0 1 
i 5.121297 75.2675 0.5378755 76 79.53962 0 0.1 0 0 0 1 
i 6.041478 75.2675 0.5378755 90 81.04906 0 0.1 0 0 0 1 
i 6.599163 75.49316 0.5378755 71 79.0452 0 0.1 0 0 0 1 
i 6.844545 75.49316 0.5378755 65 79.44771 0 0.1 0 0 0 1 
i 6.415127 75.5626 0.5378755 94 82.98784 0 0.1 0 0 0 1 
i 6.599163 75.5626 0.5378755 91 83.28973 0 0.1 0 0 0 1 
i 7.335308 75.5626 1.075751 102 84.49727 0 0.1 0 0 0 1 
i 7.642036 75.5626 1.075751 105 85.00042 0 0.1 0 0 0 1 
i 2.845939 75.6936 1.075751 42 70.2348 0 0.1 0 0 0 1 
i 2.907285 75.6936 0.5378755 44 70.33543 0 0.1 0 0 0 1 
i 3.029976 75.6936 0.5378755 41 70.53669 0 0.1 0 0 0 1 
i 3.214012 75.6936 0.5378755 39 70.83857 0 0.1 0 0 0 1 
i 3.766121 75.6936 1.075751 59 71.74423 0 0.1 0 0 0 1 
i 3.950157 75.6936 0.5378755 57 72.04612 0 0.1 0 0 0 1 
i 4.072848 75.6936 0.5378755 60 72.24738 0 0.1 0 0 0 1 
i 4.134193 75.6936 1.075751 62 72.34801 0 0.1 0 0 0 1 
i 6.353782 76.03103 0.5378755 68 78.64268 0 0.1 0 0 0 1 
i 7.089927 76.03103 0.5378755 61 79.85023 0 0.1 0 0 0 1 
i 4.630533 76.03238 0.5378755 65 74.48805 0 0.1 0 0 0 1 
i 4.691879 76.03238 0.5378755 67 74.58868 0 0.1 0 0 0 1 
i 5.550715 76.03238 0.5378755 46 75.99748 0 0.1 0 0 0 1 
i 5.734751 76.03238 0.5378755 44 76.29937 0 0.1 0 0 0 1 
i 6.353782 76.10048 0.5378755 93 82.88721 0 0.1 0 0 0 1 
i 6.660509 76.10048 0.5378755 90 83.39036 0 0.1 0 0 0 1 
i 4.691879 76.10089 0.5378755 83 78.83455 0 0.1 0 0 0 1 
i 5.059951 76.10089 0.5378755 77 79.43832 0 0.1 0 0 0 1 
i 5.550715 76.10089 0.5378755 86 80.24335 0 0.1 0 0 0 1 
i 6.164169 76.10089 0.5378755 91 81.24964 0 0.1 0 0 0 1 
i 2.784594 76.23148 0.5378755 43 70.13417 0 0.1 0 0 0 1 
i 2.96863 76.23148 0.5378755 45 70.43606 0 0.1 0 0 0 1 
i 3.152666 76.23148 0.5378755 40 70.73795 0 0.1 0 0 0 1 
i 3.888811 76.23148 0.5378755 58 71.94549 0 0.1 0 0 0 1 
i 4.011502 76.23148 0.5378755 61 72.14675 0 0.1 0 0 0 1 
i 8.629139 76.32573 0.5378755 100 83.70096 0 0.1 0 0 0 1 
i 4.569188 76.57025 0.5378755 66 74.38742 0 0.1 0 0 0 1 
i 4.753224 76.57025 0.5378755 68 74.68931 0 0.1 0 0 0 1 
i 5.61206 76.57025 0.5378755 47 76.09811 0 0.1 0 0 0 1 
i 5.673405 76.57025 0.5378755 45 76.19874 0 0.1 0 0 0 1 
i 4.569188 76.63876 0.5378755 81 78.63329 0 0.1 0 0 0 1 
i 5.182642 76.63876 0.5378755 76 79.63958 0 0.1 0 0 0 1 
i 5.673405 76.63876 0.5378755 84 80.44461 0 0.1 0 0 0 1 
i 6.041478 76.63876 0.5378755 90 81.04839 0 0.1 0 0 0 1 
i 6.415127 76.83177 0.5378755 88 78.74264 0 0.1 0 0 0 1 
i 6.599163 76.83177 0.5378755 82 79.04453 0 0.1 0 0 0 1 
i 6.844545 76.83177 0.5803494 91 79.44704 0 0.1 0 0 0 1 
i 7.151272 76.83177 0.5378755 98 79.95019 0 0.1 0 0 0 1 
i 8.138376 76.8636 0.5378755 94 82.89593 0 0.1 0 0 0 1 
i 6.476473 76.87424 0.5378755 94 83.0878 0 0.1 0 0 0 1 
i 7.335308 76.87424 0.5378755 103 84.4966 0 0.1 0 0 0 1 
i 7.703381 76.87424 0.5378755 105 85.10038 0 0.1 0 0 0 1 
i 6.353782 77.36964 0.5378755 87 78.64201 0 0.1 0 0 0 1 
i 6.660509 77.36964 0.5378755 81 79.14516 0 0.1 0 0 0 1 
i 6.905891 77.36964 0.5803494 90 79.54767 0 0.1 0 0 0 1 
i 7.089927 77.36964 0.5378755 97 79.84956 0 0.1 0 0 0 1 
i 4.630533 77.37575 1.075751 82 78.73325 0 0.1 0 0 0 1 
i 4.691879 77.37575 1.075751 83 78.83388 0 0.1 0 0 0 1 
i 5.059951 77.37575 1.075751 76 79.43765 0 0.1 0 0 0 1 
i 5.243987 77.37575 0.5378755 75 79.73954 0 0.1 0 0 0 1 
i 5.550715 77.37575 0.5378755 85 80.24268 0 0.1 0 0 0 1 
i 5.734751 77.37575 1.075751 84 80.54457 0 0.1 0 0 0 1 
i 6.102823 77.37575 0.5378755 90 81.14834 0 0.1 0 0 0 1 
i 6.164169 77.37575 1.075751 91 81.24897 0 0.1 0 0 0 1 
i 6.353782 77.41212 1.757315 92 82.88654 0 0.1 0 0 0 1 
i 7.457999 77.41212 0.5378755 102 84.69786 0 0.1 0 0 0 1 
i 7.58069 77.41212 0.5378755 104 84.89912 0 0.1 0 0 0 1 
i 3.275357 77.54882 0.5378755 50 70.93853 0 0.1 0 0 0 1 
i 3.766121 77.54882 0.5378755 42 71.74356 0 0.1 0 0 0 1 
i 4.81457 77.57341 0.5378755 58 74.78927 0 0.1 0 0 0 1 
i 5.550715 77.57341 0.5378755 67 75.99681 0 0.1 0 0 0 1 
i 8.199721 77.67016 0.5378755 85 82.99589 0 0.1 0 0 0 1 
i 8.629139 77.67016 0.5378755 73 83.70029 0 0.1 0 0 0 1 
i 5.121297 77.91363 0.5378755 77 79.53828 0 0.1 0 0 0 1 
i 5.61206 77.91363 0.5378755 86 80.34331 0 0.1 0 0 0 1 
i 2.784594 78.08669 0.5378755 46 70.1335 0 0.1 0 0 0 1 
i 4.256884 78.08669 0.5378755 37 72.5486 0 0.1 0 0 0 1 
i 6.476473 78.09368 0.5378755 93 83.08713 0 0.1 0 0 0 1 
i 6.599163 78.09368 1.075751 91 83.28839 0 0.1 0 0 0 1 
i 6.7832 78.09368 1.075751 90 83.59027 0 0.1 0 0 0 1 
i 7.335308 78.09368 1.075751 103 84.49593 0 0.1 0 0 0 1 
i 7.519345 78.09368 0.5378755 102 84.79782 0 0.1 0 0 0 1 
i 7.642036 78.09368 0.5378755 104 84.99908 0 0.1 0 0 0 1 
i 7.703381 78.09368 1.075751 105 85.09971 0 0.1 0 0 0 1 
i 4.569188 78.11129 0.5378755 60 74.38675 0 0.1 0 0 0 1 
i 5.796096 78.11129 0.5378755 69 76.39933 0 0.1 0 0 0 1 
i 6.476473 78.20303 0.5378755 68 78.8426 0 0.1 0 0 0 1 
i 6.599163 78.20303 0.5378755 70 79.04386 0 0.1 0 0 0 1 
i 6.844545 78.20303 0.5378755 65 79.44637 0 0.1 0 0 0 1 
i 7.212618 78.20303 0.5378755 63 80.05015 0 0.1 0 0 0 1 
i 8.138376 78.20803 0.5378755 84 82.89526 0 0.1 0 0 0 1 
i 8.690484 78.20803 0.5378755 72 83.80092 0 0.1 0 0 0 1 
i 6.537818 78.63156 0.5378755 93 83.18776 0 0.1 0 0 0 1 
i 7.396654 78.63156 0.5378755 104 84.59656 0 0.1 0 0 0 1 
i 7.764726 78.63156 0.5378755 106 85.20034 0 0.1 0 0 0 1 
i 6.353782 78.7409 1.274868 69 78.64134 0 0.1 0 0 0 1 
i 6.721854 78.7409 0.5378755 72 79.24512 0 0.1 0 0 0 1 
i 6.967236 78.7409 0.5378755 67 79.64763 0 0.1 0 0 0 1 
i 7.089927 78.7409 0.5378755 64 79.84889 0 0.1 0 0 0 1 
i 4.81457 78.84341 0.5378755 83 79.03447 0 0.1 0 0 0 1 
i 5.059951 78.84341 0.5378755 78 79.43698 0 0.1 0 0 0 1 
i 5.550715 78.84341 0.5378755 87 80.24201 0 0.1 0 0 0 1 
i 6.28686 78.84341 0.5378755 91 81.44956 0 0.1 0 0 0 1 
i 4.630533 78.91202 0.5378755 60 74.48671 0 0.1 0 0 0 1 
i 4.81457 78.91202 0.5378755 57 74.7886 0 0.1 0 0 0 1 
i 5.857442 78.91202 0.5378755 73 76.49929 0 0.1 0 0 0 1 
i 2.845939 78.94828 0.5378755 45 70.23346 0 0.1 0 0 0 1 
i 3.275357 78.94828 0.5378755 50 70.93786 0 0.1 0 0 0 1 
i 3.766121 78.94828 0.5378755 42 71.74289 0 0.1 0 0 0 1 
i 4.318229 78.94828 0.5378755 37 72.64855 0 0.1 0 0 0 1 
i 8.261067 79.04738 0.5378755 93 83.09585 0 0.1 0 0 0 1 
i 8.629139 79.04738 0.5378755 101 83.69962 0 0.1 0 0 0 1 
i 4.569188 79.38128 0.5378755 80 78.63195 0 0.1 0 0 0 1 
i 5.305333 79.38128 0.5378755 76 79.8395 0 0.1 0 0 0 1 
i 5.796096 79.38128 0.5378755 84 80.64453 0 0.1 0 0 0 1 
i 6.041478 79.38128 0.5378755 89 81.04704 0 0.1 0 0 0 1 
i 4.569188 79.4499 0.5378755 59 74.38608 0 0.1 0 0 0 1 
i 4.875915 79.4499 0.5378755 56 74.88922 0 0.1 0 0 0 1 
i 5.796096 79.4499 0.5378755 72 76.39866 0 0.1 0 0 0 1 
i 6.415127 79.4779 1.075751 70 78.7413 0 0.1 0 0 0 1 
i 6.599163 79.4779 1.075751 71 79.04319 0 0.1 0 0 0 1 
i 6.7832 79.4779 1.075751 72 79.34507 0 0.1 0 0 0 1 
i 6.844545 79.4779 1.075751 67 79.4457 0 0.1 0 0 0 1 
i 7.028581 79.4779 1.075751 68 79.74759 0 0.1 0 0 0 1 
i 7.151272 79.4779 1.075751 66 79.94885 0 0.1 0 0 0 1 
i 7.212618 79.4779 1.075751 65 80.04948 0 0.1 0 0 0 1 
i 2.784594 79.48615 0.5378755 46 70.13283 0 0.1 0 0 0 1 
i 3.336703 79.48615 0.5378755 51 71.03849 0 0.1 0 0 0 1 
i 3.827466 79.48615 0.5378755 43 71.84352 0 0.1 0 0 0 1 
i 4.256884 79.48615 0.5378755 38 72.54792 0 0.1 0 0 0 1 
i 8.138376 79.58526 0.5378755 95 82.89459 0 0.1 0 0 0 1 
i 8.75183 79.58526 0.5378755 103 83.90088 0 0.1 0 0 0 1 
i 6.844545 79.79108 0.5378755 91 83.69023 0 0.1 0 0 0 1 
i 7.335308 79.79108 0.5378755 100 84.49526 0 0.1 0 0 0 1 
i 6.537818 80.01577 0.5378755 69 78.94256 0 0.1 0 0 0 1 
i 4.630533 80.11828 1.075751 80 78.73191 0 0.1 0 0 0 1 
i 4.81457 80.11828 1.075751 83 79.03379 0 0.1 0 0 0 1 
i 5.059951 80.11828 0.5378755 78 79.43631 0 0.1 0 0 0 1 
i 5.366678 80.11828 0.5378755 75 79.93945 0 0.1 0 0 0 1 
i 5.550715 80.11828 1.075751 87 80.24134 0 0.1 0 0 0 1 
i 5.857442 80.11828 1.075751 84 80.74449 0 0.1 0 0 0 1 
i 6.102823 80.11828 0.5378755 88 81.147 0 0.1 0 0 0 1 
i 6.28686 80.11828 0.5378755 91 81.44889 0 0.1 0 0 0 1 
i 4.691879 80.28329 0.5378755 64 74.58667 0 0.1 0 0 0 1 
i 4.81457 80.28329 0.5378755 69 74.78792 0 0.1 0 0 0 1 
i 5.550715 80.28329 0.5378755 43 75.99547 0 0.1 0 0 0 1 
i 5.918787 80.28329 0.5378755 38 76.59925 0 0.1 0 0 0 1 
i 8.199721 80.32779 1.075751 91 82.99455 0 0.1 0 0 0 1 
i 8.629139 80.32779 1.075751 93 83.69895 0 0.1 0 0 0 1 
i 6.353782 80.32896 0.5378755 96 82.8852 0 0.1 0 0 0 1 
i 7.826072 80.32896 0.5378755 104 85.30029 0 0.1 0 0 0 1 
i 2.907285 80.38187 0.5378755 51 70.33342 0 0.1 0 0 0 1 
i 3.275357 80.38187 0.5378755 39 70.93719 0 0.1 0 0 0 1 
i 3.766121 80.38187 0.5378755 58 71.74222 0 0.1 0 0 0 1 
i 4.379575 80.38187 0.5378755 69 72.74851 0 0.1 0 0 0 1 
i 5.121297 80.65615 0.5378755 79 79.53694 0 0.1 0 0 0 1 
i 5.305333 80.65615 0.5378755 76 79.83883 0 0.1 0 0 0 1 
i 6.041478 80.65615 0.5378755 89 81.04637 0 0.1 0 0 0 1 
i 6.348205 80.65615 0.5378755 92 81.54952 0 0.1 0 0 0 1 
i 4.569188 80.82116 0.5378755 67 74.38541 0 0.1 0 0 0 1 
i 4.93726 80.82116 0.5378755 72 74.98918 0 0.1 0 0 0 1 
i 5.673405 80.82116 0.5378755 46 76.19673 0 0.1 0 0 0 1 
i 5.796096 80.82116 0.5378755 41 76.39799 0 0.1 0 0 0 1 
i 8.322412 80.86567 0.5378755 90 83.19581 0 0.1 0 0 0 1 
i 2.784594 80.91974 0.5378755 48 70.13216 0 0.1 0 0 0 1 
i 3.398048 80.91974 0.5378755 37 71.13845 0 0.1 0 0 0 1 
i 3.888811 80.91974 0.5378755 55 71.94348 0 0.1 0 0 0 1 
i 4.256884 80.91974 0.5378755 66 72.54725 0 0.1 0 0 0 1 
i 6.415127 81.07149 0.5378755 97 82.98516 0 0.1 0 0 0 1 
i 6.844545 81.07149 1.075751 91 83.68956 0 0.1 0 0 0 1 
i 7.335308 81.07149 0.5378755 100 84.49459 0 0.1 0 0 0 1 
i 7.887417 81.07149 1.075751 105 85.40025 0 0.1 0 0 0 1 
i 4.691879 81.42424 0.5378755 80 78.83187 0 0.1 0 0 0 1 
i 4.81457 81.42424 0.5378755 82 79.03312 0 0.1 0 0 0 1 
i 5.059951 81.42424 0.5378755 78 79.43564 0 0.1 0 0 0 1 
i 5.428024 81.42424 0.5378755 75 80.03941 0 0.1 0 0 0 1 
i 5.550715 81.42424 0.5378755 86 80.24067 0 0.1 0 0 0 1 
i 5.918787 81.42424 0.5378755 84 80.84444 0 0.1 0 0 0 1 
i 6.164169 81.42424 0.5378755 88 81.24696 0 0.1 0 0 0 1 
i 6.28686 81.42424 1.075751 90 81.44822 0 0.1 0 0 0 1 
i 4.630533 81.55815 1.075751 57 74.48537 0 0.1 0 0 0 1 
i 4.691879 81.55815 0.5378755 58 74.586 0 0.1 0 0 0 1 
i 4.81457 81.55815 0.5378755 55 74.78725 0 0.1 0 0 0 1 
i 4.998606 81.55815 1.075751 54 75.08914 0 0.1 0 0 0 1 
i 5.550715 81.55815 0.5378755 73 75.9948 0 0.1 0 0 0 1 
i 5.734751 81.55815 0.5378755 71 76.29669 0 0.1 0 0 0 1 
i 5.857442 81.55815 1.075751 74 76.49795 0 0.1 0 0 0 1 
i 5.918787 81.55815 0.5378755 76 76.59857 0 0.1 0 0 0 1 
i 6.353782 81.60937 0.5378755 96 82.88453 0 0.1 0 0 0 1 
i 7.396654 81.60937 0.5378755 99 84.59522 0 0.1 0 0 0 1 
i 2.845939 81.71468 0.5378755 46 70.23212 0 0.1 0 0 0 1 
i 2.907285 81.71468 0.5378755 44 70.33275 0 0.1 0 0 0 1 
i 3.275357 81.71468 1.075751 53 70.93652 0 0.1 0 0 0 1 
i 3.459394 81.71468 0.5378755 55 71.23841 0 0.1 0 0 0 1 
i 3.766121 81.71468 0.5378755 40 71.74155 0 0.1 0 0 0 1 
i 3.950157 81.71468 0.5378755 42 72.04344 0 0.1 0 0 0 1 
i 4.318229 81.71468 0.5378755 32 72.64721 0 0.1 0 0 0 1 
i 4.379575 81.71468 1.075751 30 72.74784 0 0.1 0 0 0 1 
i 8.383757 81.80183 0.5378755 86 83.29577 0 0.1 0 0 0 1 
i 8.629139 81.80183 0.5378755 79 83.69828 0 0.1 0 0 0 1 
i 7.335308 81.86266 0.5378755 70 80.25006 0 0.1 0 0 0 1 
i 4.569188 81.96211 0.5378755 81 78.63061 0 0.1 0 0 0 1 
i 4.93726 81.96211 0.5378755 83 79.23438 0 0.1 0 0 0 1 
i 5.182642 81.96211 0.5378755 79 79.6369 0 0.1 0 0 0 1 
i 5.305333 81.96211 0.5378755 77 79.83816 0 0.1 0 0 0 1 
i 5.673405 81.96211 0.5378755 87 80.44193 0 0.1 0 0 0 1 
i 5.796096 81.96211 0.5378755 85 80.64319 0 0.1 0 0 0 1 
i 6.40955 81.96211 0.5378755 92 81.64948 0 0.1 0 0 0 1 
i 4.753224 82.09603 0.5378755 59 74.68662 0 0.1 0 0 0 1 
i 4.875915 82.09603 0.5378755 56 74.88788 0 0.1 0 0 0 1 
i 5.673405 82.09603 0.5378755 72 76.19606 0 0.1 0 0 0 1 
i 5.796096 82.09603 0.5378755 75 76.39732 0 0.1 0 0 0 1 
i 5.980132 82.09603 0.5378755 77 76.6992 0 0.1 0 0 0 1 
i 2.784594 82.25256 0.5378755 45 70.13149 0 0.1 0 0 0 1 
i 2.96863 82.25256 0.5378755 43 70.43338 0 0.1 0 0 0 1 
i 3.398048 82.25256 0.5378755 54 71.13778 0 0.1 0 0 0 1 
i 3.827466 82.25256 0.5378755 39 71.84218 0 0.1 0 0 0 1 
i 3.888811 82.25256 0.5378755 41 71.94281 0 0.1 0 0 0 1 
i 4.256884 82.25256 0.5378755 31 72.54658 0 0.1 0 0 0 1 
i 8.138376 82.3397 0.5378755 82 82.89325 0 0.1 0 0 0 1 
i 8.874521 82.3397 0.5378755 76 84.1008 0 0.1 0 0 0 1 
i 6.476473 82.38313 0.5378755 97 83.08512 0 0.1 0 0 0 1 
i 6.844545 82.38313 0.5378755 91 83.68889 0 0.1 0 0 0 1 
i 7.335308 82.38313 0.5378755 100 84.49392 0 0.1 0 0 0 1 
i 7.948763 82.38313 0.5378755 105 85.50021 0 0.1 0 0 0 1 
i 6.353782 82.40054 0.5378755 76 78.64 0 0.1 0 0 0 1 
i 4.630533 82.6384 1.075751 81 78.73057 0 0.1 0 0 0 1 
i 4.691879 82.6384 1.075751 80 78.83119 0 0.1 0 0 0 1 
i 4.81457 82.6384 1.075751 82 79.03245 0 0.1 0 0 0 1 
i 4.998606 82.6384 1.075751 83 79.33434 0 0.1 0 0 0 1 
i 5.059951 82.6384 1.075751 78 79.43497 0 0.1 0 0 0 1 
i 5.243987 82.6384 0.5378755 79 79.73686 0 0.1 0 0 0 1 
i 5.366678 82.6384 1.075751 77 79.93811 0 0.1 0 0 0 1 
i 5.428024 82.6384 1.075751 76 80.03874 0 0.1 0 0 0 1 
i 5.550715 82.6384 1.075751 86 80.24 0 0.1 0 0 0 1 
i 5.734751 82.6384 1.075751 88 80.54189 0 0.1 0 0 0 1 
i 5.857442 82.6384 1.075751 85 80.74314 0 0.1 0 0 0 1 
i 5.918787 82.6384 1.075751 84 80.84377 0 0.1 0 0 0 1 
i 6.102823 82.6384 1.075751 90 81.14566 0 0.1 0 0 0 1 
i 6.164169 82.6384 1.075751 89 81.24629 0 0.1 0 0 0 1 
i 6.28686 82.6384 1.075751 91 81.44755 0 0.1 0 0 0 1 
i 6.470896 82.6384 0.5378755 92 81.74943 0 0.1 0 0 0 1 
i 6.353782 82.92101 0.5378755 96 82.88386 0 0.1 0 0 0 1 
i 6.967236 82.92101 0.5378755 90 83.89015 0 0.1 0 0 0 1 
i 7.457999 82.92101 0.5378755 99 84.69518 0 0.1 0 0 0 1 
i 7.826072 82.92101 0.5378755 104 85.29895 0 0.1 0 0 0 1 
i 8.199721 83.08224 0.5378755 103 82.99321 0 0.1 0 0 0 1 
i 8.383757 83.08224 0.5378755 96 83.29509 0 0.1 0 0 0 1 
i 8.629139 83.08224 0.5378755 106 83.69761 0 0.1 0 0 0 1 
i 8.935866 83.08224 0.5378755 112 84.20075 0 0.1 0 0 0 1 
i 5.489369 83.17627 0.5378755 75 80.13937 0 0.1 0 0 0 1 
i 5.673405 83.17627 0.5378755 87 80.44126 0 0.1 0 0 0 1 
i 3.029976 83.24905 1.075751 47 70.53333 0 0.1 0 0 0 1 
i 3.275357 83.24905 0.5378755 46 70.93585 0 0.1 0 0 0 1 
i 3.766121 83.24905 1.075751 48 71.74088 0 0.1 0 0 0 1 
i 4.502266 83.24905 0.5378755 49 72.94843 0 0.1 0 0 0 1 
i 6.415127 83.2682 1.075751 77 78.73996 0 0.1 0 0 0 1 
i 7.335308 83.2682 1.075751 68 80.24939 0 0.1 0 0 0 1 
i 5.059951 83.33271 0.5378755 65 75.1891 0 0.1 0 0 0 1 
i 5.550715 83.33271 0.5378755 56 75.99413 0 0.1 0 0 0 1 
i 6.88916 83.58666 0.7171673 59 70.10667 0 0.1 0 0 0 1 
i 6.415127 83.60257 1.075751 96 82.98382 0 0.1 0 0 0 1 
i 6.476473 83.60257 0.5378755 97 83.08444 0 0.1 0 0 0 1 
i 6.844545 83.60257 1.075751 91 83.68822 0 0.1 0 0 0 1 
i 7.028581 83.60257 1.075751 90 83.9901 0 0.1 0 0 0 1 
i 7.335308 83.60257 1.075751 99 84.49325 0 0.1 0 0 0 1 
i 7.519345 83.60257 0.5378755 98 84.79514 0 0.1 0 0 0 1 
i 7.887417 83.60257 0.5378755 104 85.39891 0 0.1 0 0 0 1 
i 7.948763 83.60257 1.075751 105 85.49954 0 0.1 0 0 0 1 
i 8.138376 83.62011 0.5378755 101 82.89258 0 0.1 0 0 0 1 
i 8.445103 83.62011 0.5378755 95 83.39572 0 0.1 0 0 0 1 
i 8.690484 83.62011 0.5378755 104 83.79824 0 0.1 0 0 0 1 
i 8.874521 83.62011 0.5378755 111 84.10013 0 0.1 0 0 0 1 
i 3.520739 83.78692 0.5378755 46 71.33836 0 0.1 0 0 0 1 
i 4.569188 83.87058 0.5378755 60 74.38407 0 0.1 0 0 0 1 
i 6.041478 83.87058 0.5378755 52 76.79916 0 0.1 0 0 0 1 
i 6.537818 84.14045 0.5378755 97 83.18507 0 0.1 0 0 0 1 
i 7.396654 84.14045 0.5378755 100 84.59388 0 0.1 0 0 0 1 
i 8.010108 84.14045 0.5378755 106 85.60017 0 0.1 0 0 0 1 
i 8.261067 84.39388 0.5378755 82 83.09317 0 0.1 0 0 0 1 
i 8.383757 84.39388 0.5378755 85 83.29442 0 0.1 0 0 0 1 
i 8.629139 84.39388 0.5378755 79 83.69694 0 0.1 0 0 0 1 
i 8.997212 84.39388 0.5378755 77 84.30071 0 0.1 0 0 0 1 
i 2.845939 84.48587 1.434335 49 70.20662 0 0.1 0 0 0 1 
i 6.950505 84.48587 0.7171673 61 70.20662 0 0.1 0 0 0 1 
i 2.845939 84.58187 0.5378755 45 70.23078 0 0.1 0 0 0 1 
i 3.029976 84.58187 0.5378755 50 70.53266 0 0.1 0 0 0 1 
i 3.275357 84.58187 0.5378755 43 70.93518 0 0.1 0 0 0 1 
i 3.582084 84.58187 0.5378755 37 71.43832 0 0.1 0 0 0 1 
i 3.766121 84.58187 0.5378755 58 71.74021 0 0.1 0 0 0 1 
i 4.072848 84.58187 0.5378755 53 72.24335 0 0.1 0 0 0 1 
i 4.318229 84.58187 0.5378755 60 72.64587 0 0.1 0 0 0 1 
i 4.502266 84.58187 0.5378755 66 72.94776 0 0.1 0 0 0 1 
i 4.630533 84.67132 1.075751 60 74.48403 0 0.1 0 0 0 1 
i 5.059951 84.67132 1.075751 65 75.18843 0 0.1 0 0 0 1 
i 5.550715 84.67132 1.075751 57 75.99346 0 0.1 0 0 0 1 
i 6.102823 84.67132 1.075751 52 76.89912 0 0.1 0 0 0 1 
i 6.476473 84.70803 0.5378755 69 78.83992 0 0.1 0 0 0 1 
i 7.335308 84.70803 0.5378755 90 80.24872 0 0.1 0 0 0 1 
i 8.138376 84.93175 0.5378755 84 82.89191 0 0.1 0 0 0 1 
i 8.506448 84.93175 0.5378755 86 83.49568 0 0.1 0 0 0 1 
i 8.75183 84.93175 0.5378755 81 83.8982 0 0.1 0 0 0 1 
i 8.874521 84.93175 0.5378755 78 84.09945 0 0.1 0 0 0 1 
i 6.599163 85.00641 0.5378755 97 83.28503 0 0.1 0 0 0 1 
i 6.844545 85.00641 0.7773652 93 83.68755 0 0.1 0 0 0 1 
i 7.335308 85.00641 0.5378755 101 84.49258 0 0.1 0 0 0 1 
i 8.071453 85.00641 0.5378755 105 85.70013 0 0.1 0 0 0 1 
i 2.784594 85.11974 0.5378755 46 70.13015 0 0.1 0 0 0 1 
i 3.091321 85.11974 0.5378755 51 70.63329 0 0.1 0 0 0 1 
i 3.336703 85.11974 0.5378755 44 71.03581 0 0.1 0 0 0 1 
i 3.520739 85.11974 0.5378755 38 71.33769 0 0.1 0 0 0 1 
i 3.827466 85.11974 0.5378755 59 71.84084 0 0.1 0 0 0 1 
i 4.011502 85.11974 0.5378755 54 72.14273 0 0.1 0 0 0 1 
i 4.256884 85.11974 0.5378755 61 72.54524 0 0.1 0 0 0 1 
i 4.563611 85.11974 0.5378755 67 73.04839 0 0.1 0 0 0 1 
i 6.88916 85.20304 0.7171673 60 70.106 0 0.1 0 0 0 1 
i 6.353782 85.2459 0.5378755 72 78.63866 0 0.1 0 0 0 1 
i 6.353782 85.54429 0.5378755 94 82.88252 0 0.1 0 0 0 1 
i 7.089927 85.54429 0.5378755 90 84.09006 0 0.1 0 0 0 1 
i 7.58069 85.54429 0.5378755 99 84.89509 0 0.1 0 0 0 1 
i 7.826072 85.54429 0.5378755 103 85.29761 0 0.1 0 0 0 1 
i 8.199721 85.61332 1.075751 85 82.99187 0 0.1 0 0 0 1 
i 8.261067 85.61332 1.075751 84 83.09249 0 0.1 0 0 0 1 
i 8.383757 85.61332 0.5378755 86 83.29375 0 0.1 0 0 0 1 
i 8.567794 85.61332 0.5378755 87 83.59564 0 0.1 0 0 0 1 
i 8.629139 85.61332 1.075751 82 83.69627 0 0.1 0 0 0 1 
i 8.813175 85.61332 0.5378755 83 83.99816 0 0.1 0 0 0 1 
i 8.935866 85.61332 1.075751 81 84.19941 0 0.1 0 0 0 1 
i 8.997212 85.61332 1.075751 80 84.30004 0 0.1 0 0 0 1 
i 2.907285 85.94719 0.5378755 49 70.33073 0 0.1 0 0 0 1 
i 3.029976 85.94719 0.5378755 44 70.53199 0 0.1 0 0 0 1 
i 3.275357 85.94719 0.5378755 53 70.93451 0 0.1 0 0 0 1 
i 3.64343 85.94719 0.5378755 58 71.53828 0 0.1 0 0 0 1 
i 3.766121 85.94719 0.5378755 36 71.73954 0 0.1 0 0 0 1 
i 4.134193 85.94719 0.5378755 40 72.34331 0 0.1 0 0 0 1 
i 4.379575 85.94719 0.5378755 31 72.74583 0 0.1 0 0 0 1 
i 4.502266 85.94719 0.5378755 27 72.94709 0 0.1 0 0 0 1 
i 4.691879 86.04258 0.5378755 65 74.58398 0 0.1 0 0 0 1 
i 5.059951 86.04258 0.5378755 54 75.18776 0 0.1 0 0 0 1 
i 5.550715 86.04258 0.5378755 72 75.99279 0 0.1 0 0 0 1 
i 6.164169 86.04258 0.5378755 83 76.99908 0 0.1 0 0 0 1 
i 6.415127 86.04664 0.5378755 79 78.73862 0 0.1 0 0 0 1 
i 6.476473 86.04664 1.071692 81 78.83925 0 0.1 0 0 0 1 
i 7.335308 86.04664 0.5378755 60 80.24805 0 0.1 0 0 0 1 
i 7.519345 86.04664 0.5378755 58 80.54994 0 0.1 0 0 0 1 
i 2.907285 86.14167 0.7171673 50 70.30658 0 0.1 0 0 0 1 
i 7.011851 86.14167 0.7171673 62 70.30658 0 0.1 0 0 0 1 
i 8.322412 86.15119 0.5378755 83 83.19312 0 0.1 0 0 0 1 
i 8.506448 86.15119 0.5378755 86 83.49501 0 0.1 0 0 0 1 
i 9.058557 86.15119 0.5378755 79 84.40067 0 0.1 0 0 0 1 
i 6.415127 86.22585 1.075751 94 82.98247 0 0.1 0 0 0 1 
i 6.599163 86.22585 1.075751 97 83.28436 0 0.1 0 0 0 1 
i 6.844545 86.22585 1.075751 93 83.68688 0 0.1 0 0 0 1 
i 7.151272 86.22585 1.075751 90 84.19002 0 0.1 0 0 0 1 
i 7.335308 86.22585 0.5378755 101 84.49191 0 0.1 0 0 0 1 
i 7.642036 86.22585 0.5378755 98 84.99505 0 0.1 0 0 0 1 
i 7.887417 86.22585 1.075751 103 85.39757 0 0.1 0 0 0 1 
i 8.071453 86.22585 0.5378755 105 85.69945 0 0.1 0 0 0 1 
i 2.784594 86.48507 0.5378755 46 70.12948 0 0.1 0 0 0 1 
i 3.152666 86.48507 0.5378755 42 70.73325 0 0.1 0 0 0 1 
i 3.398048 86.48507 0.5378755 51 71.13577 0 0.1 0 0 0 1 
i 3.520739 86.48507 0.5378755 55 71.33702 0 0.1 0 0 0 1 
i 3.888811 86.48507 0.5378755 33 71.9408 0 0.1 0 0 0 1 
i 4.011502 86.48507 0.5378755 37 72.14205 0 0.1 0 0 0 1 
i 4.256884 86.48507 0.5378755 29 72.54457 0 0.1 0 0 0 1 
i 4.624956 86.48507 0.5378755 24 73.14834 0 0.1 0 0 0 1 
i 4.569188 86.58046 0.5378755 62 74.38273 0 0.1 0 0 0 1 
i 5.182642 86.58046 0.5378755 51 75.38901 0 0.1 0 0 0 1 
i 5.673405 86.58046 0.5378755 69 76.19405 0 0.1 0 0 0 1 
i 6.353782 86.58452 0.5378755 80 78.63799 0 0.1 0 0 0 1 
i 6.537818 86.58452 0.5378755 82 78.93987 0 0.1 0 0 0 1 
i 7.396654 86.58452 0.9914874 61 80.34868 0 0.1 0 0 0 1 
i 7.457999 86.58452 0.5378755 59 80.44931 0 0.1 0 0 0 1 
i 7.396654 86.76373 0.5378755 102 84.59254 0 0.1 0 0 0 1 
i 7.58069 86.76373 0.5378755 99 84.89442 0 0.1 0 0 0 1 
i 8.132799 86.76373 0.5378755 106 85.80008 0 0.1 0 0 0 1 
i 2.784594 86.85884 0.7171673 49 70.10532 0 0.1 0 0 0 1 
i 2.845939 87.21654 1.075751 47 70.22943 0 0.1 0 0 0 1 
i 3.275357 87.21654 1.075751 46 70.93384 0 0.1 0 0 0 1 
i 3.582084 87.21654 1.075751 46 71.43698 0 0.1 0 0 0 1 
i 3.766121 87.21654 1.075751 48 71.73887 0 0.1 0 0 0 1 
i 4.134193 87.21654 1.075751 47 72.34264 0 0.1 0 0 0 1 
i 4.502266 87.21654 1.075751 49 72.94642 0 0.1 0 0 0 1 
i 4.630533 87.31745 0.5378755 60 74.48268 0 0.1 0 0 0 1 
i 4.691879 87.31745 0.5378755 58 74.58331 0 0.1 0 0 0 1 
i 5.059951 87.31745 0.5378755 68 75.18709 0 0.1 0 0 0 1 
i 5.243987 87.31745 1.075751 69 75.48897 0 0.1 0 0 0 1 
i 5.550715 87.31745 0.5378755 54 75.99212 0 0.1 0 0 0 1 
i 5.734751 87.31745 0.5378755 56 76.294 0 0.1 0 0 0 1 
i 6.102823 87.31745 0.5378755 46 76.89778 0 0.1 0 0 0 1 
i 6.164169 87.31745 1.075751 45 76.99841 0 0.1 0 0 0 1 
i 6.476473 87.47504 0.5378755 94 83.08243 0 0.1 0 0 0 1 
i 6.599163 87.47504 0.5378755 96 83.28369 0 0.1 0 0 0 1 
i 6.844545 87.47504 0.5378755 92 83.68621 0 0.1 0 0 0 1 
i 7.212618 87.47504 0.5378755 90 84.28998 0 0.1 0 0 0 1 
i 7.335308 87.47504 0.5378755 100 84.49124 0 0.1 0 0 0 1 
i 7.703381 87.47504 0.5378755 98 85.09501 0 0.1 0 0 0 1 
i 7.948763 87.47504 0.5378755 103 85.49753 0 0.1 0 0 0 1 
i 8.071453 87.47504 0.5378755 105 85.69878 0 0.1 0 0 0 1 
i 6.599163 87.58768 0.5378755 72 79.03983 0 0.1 0 0 0 1 
i 7.335308 87.58768 0.5378755 81 80.24738 0 0.1 0 0 0 1 
i 2.845939 87.68107 0.7171673 50 70.20528 0 0.1 0 0 0 1 
i 2.907285 87.68107 1.434335 51 70.30591 0 0.1 0 0 0 1 
i 6.950505 87.68107 1.434335 62 70.20528 0 0.1 0 0 0 1 
i 7.011851 87.68107 1.434335 63 70.30591 0 0.1 0 0 0 1 
i 4.563611 87.75441 0.5378755 48 73.04704 0 0.1 0 0 0 1 
i 4.569188 87.85533 0.5378755 59 74.38205 0 0.1 0 0 0 1 
i 4.753224 87.85533 0.5378755 57 74.68394 0 0.1 0 0 0 1 
i 5.121297 87.85533 0.5378755 67 75.28771 0 0.1 0 0 0 1 
i 5.61206 87.85533 0.5378755 53 76.09275 0 0.1 0 0 0 1 
i 5.673405 87.85533 0.5378755 55 76.19338 0 0.1 0 0 0 1 
i 6.225514 87.85533 0.5378755 44 77.09904 0 0.1 0 0 0 1 
i 9.119902 87.8944 0.5378755 85 84.50063 0 0.1 0 0 0 1 
i 6.353782 88.01291 0.5378755 95 82.88117 0 0.1 0 0 0 1 
i 6.721854 88.01291 0.5378755 97 83.48495 0 0.1 0 0 0 1 
i 6.967236 88.01291 0.5378755 93 83.88746 0 0.1 0 0 0 1 
i 7.089927 88.01291 0.5378755 91 84.08872 0 0.1 0 0 0 1 
i 7.457999 88.01291 0.5378755 102 84.69249 0 0.1 0 0 0 1 
i 7.58069 88.01291 0.5378755 100 84.89375 0 0.1 0 0 0 1 
i 7.826072 88.01291 0.5378755 104 85.29627 0 0.1 0 0 0 1 
i 8.194144 88.01291 0.5378755 106 85.90004 0 0.1 0 0 0 1 
i 6.353782 88.12555 0.5378755 74 78.63732 0 0.1 0 0 0 1 
i 7.58069 88.12555 0.5378755 83 80.6499 0 0.1 0 0 0 1 
i 2.96863 88.39824 0.7171673 52 70.40654 0 0.1 0 0 0 1 
i 8.138376 88.43227 0.5378755 90 82.89057 0 0.1 0 0 0 1 
i 6.415127 88.63641 1.075751 95 82.98113 0 0.1 0 0 0 1 
i 6.476473 88.63641 0.5378755 94 83.08176 0 0.1 0 0 0 1 
i 6.599163 88.63641 1.075751 96 83.28302 0 0.1 0 0 0 1 
i 6.7832 88.63641 0.5378755 98 83.58491 0 0.1 0 0 0 1 
i 6.844545 88.63641 1.075751 92 83.68553 0 0.1 0 0 0 1 
i 7.028581 88.63641 1.075751 93 83.98742 0 0.1 0 0 0 1 
i 7.151272 88.63641 1.075751 91 84.18868 0 0.1 0 0 0 1 
i 7.212618 88.63641 1.075751 90 84.28931 0 0.1 0 0 0 1 
i 7.335308 88.63641 1.075751 101 84.49057 0 0.1 0 0 0 1 
i 7.519345 88.63641 1.075751 102 84.79245 0 0.1 0 0 0 1 
i 7.642036 88.63641 0.5378755 100 84.99371 0 0.1 0 0 0 1 
i 7.703381 88.63641 1.075751 99 85.09434 0 0.1 0 0 0 1 
i 7.887417 88.63641 1.075751 104 85.39623 0 0.1 0 0 0 1 
i 7.948763 88.63641 1.075751 103 85.49686 0 0.1 0 0 0 1 
i 8.071453 88.63641 0.5378755 105 85.69811 0 0.1 0 0 0 1 
i 8.25549 88.63641 1.075751 106 86 0 0.1 0 0 0 1 
i 4.81457 88.7851 1.075751 61 74.7839 0 0.1 0 0 0 1 
i 5.550715 88.7851 1.075751 62 75.99145 0 0.1 0 0 0 1 
i 6.28686 88.7851 1.075751 63 77.19899 0 0.1 0 0 0 1 
i 6.415127 88.92629 1.075751 74 78.73727 0 0.1 0 0 0 1 
i 6.599163 88.92629 0.5378755 71 79.03916 0 0.1 0 0 0 1 
i 7.335308 88.92629 0.5378755 84 80.24671 0 0.1 0 0 0 1 
i 7.642036 88.92629 0.5378755 87 80.74985 0 0.1 0 0 0 1 
i 6.537818 89.17428 0.5378755 94 83.18239 0 0.1 0 0 0 1 
i 6.721854 89.17428 0.5378755 97 83.48428 0 0.1 0 0 0 1 
i 7.396654 89.17428 0.5378755 100 84.59119 0 0.1 0 0 0 1 
i 7.764726 89.17428 0.5378755 98 85.19497 0 0.1 0 0 0 1 
i 8.199721 89.23883 0.5378755 92 82.99052 0 0.1 0 0 0 1 
i 9.119902 89.23883 1.075751 82 84.49996 0 0.1 0 0 0 1 
i 5.305333 89.32298 0.5378755 60 75.58893 0 0.1 0 0 0 1 
i 3.029976 89.45326 0.7171673 52 70.5065 0 0.1 0 0 0 1 
i 7.134542 89.45326 0.7171673 64 70.5065 0 0.1 0 0 0 1 
i 6.660509 89.46416 0.5378755 70 79.13979 0 0.1 0 0 0 1 
i 7.396654 89.46416 0.5378755 83 80.34734 0 0.1 0 0 0 1 
i 7.58069 89.46416 0.5378755 86 80.64922 0 0.1 0 0 0 1 
i 8.138376 89.77671 0.5378755 91 82.8899 0 0.1 0 0 0 1 
i 4.630533 90.05997 0.5378755 59 74.48134 0 0.1 0 0 0 1 
i 4.81457 90.05997 0.5378755 64 74.78323 0 0.1 0 0 0 1 
i 5.059951 90.05997 0.5378755 57 75.18574 0 0.1 0 0 0 1 
i 5.366678 90.05997 0.5378755 52 75.68889 0 0.1 0 0 0 1 
i 5.550715 90.05997 0.5378755 72 75.99078 0 0.1 0 0 0 1 
i 5.857442 90.05997 0.5378755 67 76.49392 0 0.1 0 0 0 1 
i 6.102823 90.05997 0.5378755 75 76.89644 0 0.1 0 0 0 1 
i 6.28686 90.05997 0.5378755 80 77.19832 0 0.1 0 0 0 1 
i 2.784594 90.17043 0.7171673 49 70.10398 0 0.1 0 0 0 1 
i 6.88916 90.17043 0.7171673 61 70.10398 0 0.1 0 0 0 1 
i 6.476473 90.29755 0.5378755 78 78.83723 0 0.1 0 0 0 1 
i 6.599163 90.29755 0.5378755 83 79.03849 0 0.1 0 0 0 1 
i 7.335308 90.29755 0.5378755 57 80.24604 0 0.1 0 0 0 1 
i 7.703381 90.29755 0.5378755 53 80.84981 0 0.1 0 0 0 1 
i 4.569188 90.59785 0.5378755 60 74.38071 0 0.1 0 0 0 1 
i 4.875915 90.59785 0.5378755 65 74.88386 0 0.1 0 0 0 1 
i 5.121297 90.59785 0.5378755 58 75.28637 0 0.1 0 0 0 1 
i 5.305333 90.59785 0.5378755 53 75.58826 0 0.1 0 0 0 1 
i 5.61206 90.59785 0.5378755 73 76.0914 0 0.1 0 0 0 1 
i 5.796096 90.59785 0.5378755 68 76.39329 0 0.1 0 0 0 1 
i 6.041478 90.59785 0.5378755 76 76.79581 0 0.1 0 0 0 1 
i 6.348205 90.59785 0.775453 81 77.29895 0 0.1 0 0 0 1 
i 8.261067 90.61605 0.5378755 84 83.09048 0 0.1 0 0 0 1 
i 9.119902 90.61605 0.5378755 105 84.49929 0 0.1 0 0 0 1 
i 6.721854 90.83542 0.5378755 86 79.23975 0 0.1 0 0 0 1 
i 7.457999 90.83542 0.5378755 60 80.4473 0 0.1 0 0 0 1 
i 7.58069 90.83542 0.5378755 55 80.64855 0 0.1 0 0 0 1 
i 2.845939 90.99267 1.434335 50 70.20394 0 0.1 0 0 0 1 
i 3.029976 90.99267 1.434335 53 70.50583 0 0.1 0 0 0 1 
i 6.950505 90.99267 0.7171673 61 70.20394 0 0.1 0 0 0 1 
i 7.134542 90.99267 0.7171673 64 70.50583 0 0.1 0 0 0 1 
i 8.138376 91.15393 0.9563651 86 82.88922 0 0.1 0 0 0 1 
i 9.242593 91.15393 0.5378755 107 84.70055 0 0.1 0 0 0 1 
i 4.691879 91.36593 0.5378755 63 74.5813 0 0.1 0 0 0 1 
i 4.81457 91.36593 0.5378755 59 74.78256 0 0.1 0 0 0 1 
i 5.059951 91.36593 0.5378755 68 75.18507 0 0.1 0 0 0 1 
i 5.428024 91.36593 0.5378755 72 75.78885 0 0.1 0 0 0 1 
i 5.550715 91.36593 0.5378755 50 75.9901 0 0.1 0 0 0 1 
i 5.918787 91.36593 0.5378755 54 76.59388 0 0.1 0 0 0 1 
i 6.164169 91.36593 0.5378755 46 76.99639 0 0.1 0 0 0 1 
i 6.28686 91.36593 0.5378755 41 77.19765 0 0.1 0 0 0 1 
i 6.415127 91.57242 0.5378755 71 78.73593 0 0.1 0 0 0 1 
i 6.476473 91.57242 1.075751 72 78.83656 0 0.1 0 0 0 1 
i 6.599163 91.57242 1.075751 69 79.03782 0 0.1 0 0 0 1 
i 6.7832 91.57242 0.5378755 68 79.33971 0 0.1 0 0 0 1 
i 7.335308 91.57242 0.5378755 87 80.24537 0 0.1 0 0 0 1 
i 7.642036 91.57242 1.075751 89 80.74851 0 0.1 0 0 0 1 
i 7.703381 91.57242 0.5378755 90 80.84914 0 0.1 0 0 0 1 
i 6.88916 91.70983 0.7171673 62 70.10331 0 0.1 0 0 0 1 
i 7.195887 91.70983 0.7171673 65 70.60646 0 0.1 0 0 0 1 
i 8.199721 91.89646 0.5378755 94 82.98918 0 0.1 0 0 0 1 
i 8.261067 91.89646 1.075751 95 83.08981 0 0.1 0 0 0 1 
i 9.119902 91.89646 0.5378755 74 84.49862 0 0.1 0 0 0 1 
i 9.303939 91.89646 0.5378755 72 84.8005 0 0.1 0 0 0 1 
i 4.569188 91.90381 0.5378755 61 74.38004 0 0.1 0 0 0 1 
i 4.93726 91.90381 0.5378755 56 74.98382 0 0.1 0 0 0 1 
i 5.182642 91.90381 0.5378755 65 75.38633 0 0.1 0 0 0 1 
i 5.305333 91.90381 0.5378755 69 75.58759 0 0.1 0 0 0 1 
i 5.673405 91.90381 0.5378755 47 76.19136 0 0.1 0 0 0 1 
i 5.796096 91.90381 0.5378755 52 76.39262 0 0.1 0 0 0 1 
i 6.041478 91.90381 0.5378755 43 76.79514 0 0.1 0 0 0 1 
i 6.40955 91.90381 0.5378755 39 77.39891 0 0.1 0 0 0 1 
i 6.537818 92.11029 0.5378755 73 78.93719 0 0.1 0 0 0 1 
i 6.660509 92.11029 0.5378755 70 79.13845 0 0.1 0 0 0 1 
i 7.396654 92.11029 0.5378755 88 80.346 0 0.1 0 0 0 1 
i 7.457999 92.11029 0.5378755 86 80.44662 0 0.1 0 0 0 1 
i 7.764726 92.11029 0.5378755 91 80.94977 0 0.1 0 0 0 1 
i 8.322412 92.43434 0.5378755 96 83.19044 0 0.1 0 0 0 1 
i 9.181248 92.43434 0.5378755 75 84.59925 0 0.1 0 0 0 1 
i 9.242593 92.43434 0.5378755 73 84.69987 0 0.1 0 0 0 1 
i 2.907285 92.56962 0.7171673 50 70.3039 0 0.1 0 0 0 1 
i 3.029976 92.56962 0.7171673 53 70.50516 0 0.1 0 0 0 1 
i 7.011851 92.56962 0.7171673 62 70.3039 0 0.1 0 0 0 1 
i 7.134542 92.56962 0.7171673 64 70.50516 0 0.1 0 0 0 1 
i 4.630533 92.58009 1.075751 61 74.48 0 0.1 0 0 0 1 
i 4.998606 92.58009 0.5378755 62 75.08377 0 0.1 0 0 0 1 
i 5.366678 92.58009 1.075751 60 75.68755 0 0.1 0 0 0 1 
i 5.550715 92.58009 1.075751 62 75.98943 0 0.1 0 0 0 1 
i 6.102823 92.58009 1.075751 63 76.89509 0 0.1 0 0 0 1 
i 2.784594 93.28678 0.7171673 52 70.10264 0 0.1 0 0 0 1 
i 3.152666 93.28678 0.7171673 54 70.70642 0 0.1 0 0 0 1 
i 6.88916 93.28678 0.7171673 63 70.10264 0 0.1 0 0 0 1 
i 7.257232 93.28678 0.7171673 66 70.70642 0 0.1 0 0 0 1 
i 6.844545 93.34697 0.5378755 79 79.43966 0 0.1 0 0 0 1 
i 7.335308 93.34697 0.5378755 70 80.2447 0 0.1 0 0 0 1 
i 8.383757 93.3705 0.5378755 87 83.2904 0 0.1 0 0 0 1 
i 9.119902 93.3705 0.5378755 95 84.49795 0 0.1 0 0 0 1 
i 6.353782 93.88485 0.5378755 75 78.63463 0 0.1 0 0 0 1 
i 7.826072 93.88485 0.5378755 66 81.04973 0 0.1 0 0 0 1 
i 8.138376 93.90837 0.5378755 89 82.88788 0 0.1 0 0 0 1 
i 9.365284 93.90837 0.5378755 97 84.90046 0 0.1 0 0 0 1 
i 2.845939 94.03572 1.434335 53 70.2026 0 0.1 0 0 0 1 
i 2.907285 94.03572 1.434335 52 70.30323 0 0.1 0 0 0 1 
i 3.029976 94.03572 0.7171673 54 70.50449 0 0.1 0 0 0 1 
i 3.214012 94.03572 1.434335 55 70.80637 0 0.1 0 0 0 1 
i 6.950505 94.03572 1.434335 64 70.2026 0 0.1 0 0 0 1 
i 7.011851 94.03572 1.434335 63 70.30323 0 0.1 0 0 0 1 
i 7.134542 94.03572 1.434335 65 70.50449 0 0.1 0 0 0 1 
i 7.318578 94.03572 0.7171673 67 70.80637 0 0.1 0 0 0 1 
i 8.199721 94.65091 0.5378755 89 82.98784 0 0.1 0 0 0 1 
i 8.383757 94.65091 1.075751 85 83.28973 0 0.1 0 0 0 1 
i 9.119902 94.65091 0.5378755 98 84.49727 0 0.1 0 0 0 1 
i 9.426629 94.65091 0.5378755 101 85.00042 0 0.1 0 0 0 1 
i 6.415127 94.68558 1.075751 74 78.73459 0 0.1 0 0 0 1 
i 6.844545 94.68558 1.075751 79 79.43899 0 0.1 0 0 0 1 
i 7.335308 94.68558 0.5378755 71 80.24403 0 0.1 0 0 0 1 
i 7.887417 94.68558 1.075751 66 81.14969 0 0.1 0 0 0 1 
i 2.96863 94.75288 0.7171673 51 70.40386 0 0.1 0 0 0 1 
i 7.257232 94.75288 0.7171673 66 70.70574 0 0.1 0 0 0 1 
i 8.138376 95.18879 0.5378755 88 82.88721 0 0.1 0 0 0 1 
i 9.181248 95.18879 0.5378755 97 84.5979 0 0.1 0 0 0 1 
i 9.365284 95.18879 0.5378755 100 84.89979 0 0.1 0 0 0 1 
i 7.396654 95.22346 1.276966 72 80.34465 0 0.1 0 0 0 1 
i 8.261067 95.96255 0.5378755 93 83.0878 0 0.1 0 0 0 1 
i 8.383757 95.96255 0.5378755 97 83.28906 0 0.1 0 0 0 1 
i 9.119902 95.96255 0.5378755 71 84.4966 0 0.1 0 0 0 1 
i 9.487975 95.96255 0.5378755 67 85.10038 0 0.1 0 0 0 1 
i 6.476473 96.05685 0.5378755 79 78.83455 0 0.1 0 0 0 1 
i 6.844545 96.05685 0.5378755 68 79.43832 0 0.1 0 0 0 1 
i 7.335308 96.05685 0.5378755 86 80.24335 0 0.1 0 0 0 1 
i 7.948763 96.05685 0.5378755 98 81.24964 0 0.1 0 0 0 1 
i 3.275357 96.07645 0.7171673 54 70.90633 0 0.1 0 0 0 1 
i 7.379923 96.07645 1.056142 65 70.90633 0 0.1 0 0 0 1 
i 8.138376 96.50043 0.63217 95 82.88654 0 0.1 0 0 0 1 
i 8.506448 96.50043 0.5378755 100 83.49031 0 0.1 0 0 0 1 
i 9.242593 96.50043 0.5378755 74 84.69786 0 0.1 0 0 0 1 
i 9.365284 96.50043 0.5378755 70 84.89912 0 0.1 0 0 0 1 
i 6.353782 96.59472 0.5378755 77 78.63329 0 0.1 0 0 0 1 
i 7.457999 96.59472 0.5378755 83 80.44461 0 0.1 0 0 0 1 
i 2.784594 96.79362 0.7171673 49 70.1013 0 0.1 0 0 0 1 
i 6.88916 96.79362 0.7171673 61 70.1013 0 0.1 0 0 0 1 
i 8.199721 97.18199 0.5378755 85 82.9865 0 0.1 0 0 0 1 
i 8.261067 97.18199 1.075751 87 83.08713 0 0.1 0 0 0 1 
i 8.383757 97.18199 1.075751 84 83.28839 0 0.1 0 0 0 1 
i 8.567794 97.18199 0.5378755 82 83.59027 0 0.1 0 0 0 1 
i 9.119902 97.18199 1.075751 101 84.49593 0 0.1 0 0 0 1 
i 9.303939 97.18199 0.5378755 100 84.79782 0 0.1 0 0 0 1 
i 9.426629 97.18199 0.5378755 103 84.99908 0 0.1 0 0 0 1 
i 9.487975 97.18199 1.075751 104 85.09971 0 0.1 0 0 0 1 
i 6.415127 97.33171 0.5378755 74 78.73325 0 0.1 0 0 0 1 
i 6.476473 97.33171 0.5378755 72 78.83388 0 0.1 0 0 0 1 
i 6.844545 97.33171 0.5378755 82 79.43765 0 0.1 0 0 0 1 
i 7.028581 97.33171 0.5378755 84 79.73954 0 0.1 0 0 0 1 
i 7.335308 97.33171 1.075751 69 80.24268 0 0.1 0 0 0 1 
i 7.519345 97.33171 0.5378755 70 80.54457 0 0.1 0 0 0 1 
i 7.887417 97.33171 0.5378755 61 81.14834 0 0.1 0 0 0 1 
i 7.948763 97.33171 0.5378755 59 81.24897 0 0.1 0 0 0 1 
i 2.845939 97.61586 0.7171673 48 70.20126 0 0.1 0 0 0 1 
i 3.275357 97.61586 0.7171673 54 70.90566 0 0.1 0 0 0 1 
i 6.950505 97.61586 0.7171673 60 70.20126 0 0.1 0 0 0 1 
i 7.379923 97.61586 0.7171673 66 70.90566 0 0.1 0 0 0 1 
i 8.138376 97.71987 0.5378755 86 82.88587 0 0.1 0 0 0 1 
i 8.506448 97.71987 0.5378755 83 83.48964 0 0.1 0 0 0 1 
i 9.181248 97.71987 0.5378755 102 84.59656 0 0.1 0 0 0 1 
i 9.54932 97.71987 0.5378755 105 85.20034 0 0.1 0 0 0 1 
i 6.353782 97.86959 0.5378755 73 78.63262 0 0.1 0 0 0 1 
i 6.537818 97.86959 0.5378755 72 78.93451 0 0.1 0 0 0 1 
i 6.905891 97.86959 0.5378755 81 79.53828 0 0.1 0 0 0 1 
i 6.967236 97.86959 0.5378755 83 79.63891 0 0.1 0 0 0 1 
i 7.396654 97.86959 0.5378755 68 80.34331 0 0.1 0 0 0 1 
i 7.826072 97.86959 0.5378755 60 81.04771 0 0.1 0 0 0 1 
i 8.010108 97.86959 0.5378755 58 81.3496 0 0.1 0 0 0 1 
i 2.784594 98.33302 0.7171673 49 70.10063 0 0.1 0 0 0 1 
i 3.336703 98.33302 0.7171673 55 71.00629 0 0.1 0 0 0 1 
i 6.88916 98.33302 0.7171673 61 70.10063 0 0.1 0 0 0 1 
i 7.441269 98.33302 0.7171673 67 71.00629 0 0.1 0 0 0 1 
i 6.599163 98.79937 0.5378755 76 79.03447 0 0.1 0 0 0 1 
i 6.844545 98.79937 1.075751 75 79.43698 0 0.1 0 0 0 1 
i 7.335308 98.79937 0.5378755 77 80.24201 0 0.1 0 0 0 1 
i 8.071453 98.79937 1.075751 77 81.44956 0 0.1 0 0 0 1 
i 8.629139 98.87939 0.5378755 93 83.69023 0 0.1 0 0 0 1 
i 9.119902 98.87939 0.5378755 84 84.49526 0 0.1 0 0 0 1 
i 6.353782 99.14569 0.7171673 76 78.6078 0 0.1 0 0 0 1 
i 10.45835 99.14569 0.7171673 87 78.6078 0 0.1 0 0 0 1 
i 2.907285 99.19281 0.7171673 48 70.30122 0 0.1 0 0 0 1 
i 3.275357 99.19281 0.7171673 54 70.90499 0 0.1 0 0 0 1 
i 7.011851 99.19281 0.7171673 60 70.30122 0 0.1 0 0 0 1 
i 7.379923 99.19281 0.7171673 66 70.90499 0 0.1 0 0 0 1 
i 6.353782 99.33724 0.5378755 75 78.63195 0 0.1 0 0 0 1 
i 7.58069 99.33724 0.5378755 76 80.64453 0 0.1 0 0 0 1 
i 8.138376 99.41727 0.5378755 89 82.8852 0 0.1 0 0 0 1 
i 9.610666 99.41727 0.5378755 80 85.30029 0 0.1 0 0 0 1 
i 2.784594 99.90997 0.7171673 50 70.09996 0 0.1 0 0 0 1 
i 3.398048 99.90997 0.7171673 56 71.10625 0 0.1 0 0 0 1 
i 6.88916 99.90997 0.7171673 61 70.09996 0 0.1 0 0 0 1 
i 7.502614 99.90997 0.7171673 67 71.10625 0 0.1 0 0 0 1 
i 6.415127 99.97462 0.7171673 78 78.70776 0 0.1 0 0 0 1 
i 10.51969 99.97462 0.7171673 89 78.70776 0 0.1 0 0 0 1 
i 6.415127 100.0742 0.5378755 74 78.73191 0 0.1 0 0 0 1 
i 6.599163 100.0742 0.5378755 79 79.03379 0 0.1 0 0 0 1 
i 6.844545 100.0742 0.5378755 71 79.43631 0 0.1 0 0 0 1 
i 7.151272 100.0742 0.5378755 66 79.93945 0 0.1 0 0 0 1 
i 7.335308 100.0742 0.5378755 86 80.24134 0 0.1 0 0 0 1 
i 7.642036 100.0742 0.5378755 81 80.74449 0 0.1 0 0 0 1 
i 7.887417 100.0742 0.5378755 89 81.147 0 0.1 0 0 0 1 
i 8.071453 100.0742 0.5378755 94 81.44889 0 0.1 0 0 0 1 
i 8.199721 100.1598 0.5378755 88 82.98516 0 0.1 0 0 0 1 
i 8.629139 100.1598 0.5378755 93 83.68956 0 0.1 0 0 0 1 
i 9.119902 100.1598 0.5378755 85 84.49459 0 0.1 0 0 0 1 
i 9.672011 100.1598 0.5378755 80 85.40025 0 0.1 0 0 0 1 
i 6.353782 100.6121 0.5378755 75 78.63128 0 0.1 0 0 0 1 
i 6.660509 100.6121 0.5378755 80 79.13442 0 0.1 0 0 0 1 
i 6.905891 100.6121 0.5378755 72 79.53694 0 0.1 0 0 0 1 
i 7.089927 100.6121 1.48113 67 79.83883 0 0.1 0 0 0 1 
i 7.396654 100.6121 0.5378755 87 80.34197 0 0.1 0 0 0 1 
i 7.58069 100.6121 0.5378755 82 80.64386 0 0.1 0 0 0 1 
i 7.826072 100.6121 0.5378755 90 81.04637 0 0.1 0 0 0 1 
i 8.132799 100.6121 0.5378755 95 81.54952 0 0.1 0 0 0 1 
i 2.845939 100.6589 0.7171673 50 70.19992 0 0.1 0 0 0 1 
i 2.907285 100.6589 1.434335 49 70.30055 0 0.1 0 0 0 1 
i 3.275357 100.6589 1.434335 56 70.90432 0 0.1 0 0 0 1 
i 3.459394 100.6589 0.7171673 57 71.20621 0 0.1 0 0 0 1 
i 6.950505 100.6589 0.7171673 62 70.19992 0 0.1 0 0 0 1 
i 7.011851 100.6589 1.434335 60 70.30055 0 0.1 0 0 0 1 
i 7.56396 100.6589 1.434335 68 71.20621 0 0.1 0 0 0 1 
i 6.353782 100.6918 1.226287 77 78.60713 0 0.1 0 0 0 1 
i 10.45835 100.6918 0.7171673 89 78.60713 0 0.1 0 0 0 1 
i 8.138376 100.6977 0.5378755 89 82.88453 0 0.1 0 0 0 1 
i 8.690484 100.6977 0.5378755 94 83.79019 0 0.1 0 0 0 1 
i 9.181248 100.6977 0.5378755 86 84.59522 0 0.1 0 0 0 1 
i 9.610666 100.6977 1.395564 81 85.29962 0 0.1 0 0 0 1 
i 2.96863 101.3761 0.7171673 48 70.40117 0 0.1 0 0 0 1 
i 3.336703 101.3761 0.7171673 55 71.00495 0 0.1 0 0 0 1 
i 6.88916 101.3761 0.7171673 61 70.09929 0 0.1 0 0 0 1 
i 6.599163 101.3802 0.5378755 73 79.03312 0 0.1 0 0 0 1 
i 6.844545 101.3802 0.5378755 82 79.43564 0 0.1 0 0 0 1 
i 7.212618 101.3802 0.5378755 86 80.03941 0 0.1 0 0 0 1 
i 7.335308 101.3802 0.5378755 64 80.24067 0 0.1 0 0 0 1 
i 7.703381 101.3802 0.5378755 69 80.84444 0 0.1 0 0 0 1 
i 7.948763 101.3802 0.5378755 60 81.24696 0 0.1 0 0 0 1 
i 8.071453 101.3802 0.5378755 55 81.44822 0 0.1 0 0 0 1 
i 8.261067 101.4714 0.5378755 94 83.08512 0 0.1 0 0 0 1 
i 8.629139 101.4714 0.5378755 82 83.68889 0 0.1 0 0 0 1 
i 9.119902 101.4714 0.5378755 100 84.49392 0 0.1 0 0 0 1 
i 9.733357 101.4714 0.5378755 112 85.50021 0 0.1 0 0 0 1 
i 6.476473 101.5584 0.7171673 79 78.80771 0 0.1 0 0 0 1 
i 10.58104 101.5584 0.7171673 91 78.80771 0 0.1 0 0 0 1 
i 6.353782 101.9181 0.5378755 75 78.63061 0 0.1 0 0 0 1 
i 6.721854 101.9181 0.5378755 70 79.23438 0 0.1 0 0 0 1 
i 6.967236 101.9181 0.5378755 79 79.6369 0 0.1 0 0 0 1 
i 7.089927 101.9181 0.5378755 84 79.83816 0 0.1 0 0 0 1 
i 7.457999 101.9181 0.5378755 62 80.44193 0 0.1 0 0 0 1 
i 7.58069 101.9181 0.5378755 66 80.64319 0 0.1 0 0 0 1 
i 7.826072 101.9181 0.5378755 57 81.0457 0 0.1 0 0 0 1 
i 8.194144 101.9181 0.5378755 53 81.64948 0 0.1 0 0 0 1 
i 8.138376 102.0093 0.5378755 91 82.88386 0 0.1 0 0 0 1 
i 8.75183 102.0093 0.5378755 80 83.89015 0 0.1 0 0 0 1 
i 9.242593 102.0093 0.5378755 98 84.69518 0 0.1 0 0 0 1 
i 9.610666 102.0093 0.5378755 109 85.29895 0 0.1 0 0 0 1 
i 6.353782 102.2756 0.7171673 78 78.60646 0 0.1 0 0 0 1 
i 10.45835 102.2756 0.7171673 89 78.60646 0 0.1 0 0 0 1 
i 3.029976 102.3467 0.7171673 49 70.50113 0 0.1 0 0 0 1 
i 3.275357 102.3467 0.7171673 54 70.90365 0 0.1 0 0 0 1 
i 7.134542 102.3467 0.7171673 61 70.50113 0 0.1 0 0 0 1 
i 7.379923 102.3467 0.7171673 65 70.90365 0 0.1 0 0 0 1 
i 6.415127 102.5944 1.075751 75 78.73057 0 0.1 0 0 0 1 
i 6.599163 102.5944 1.075751 76 79.03245 0 0.1 0 0 0 1 
i 6.844545 102.5944 1.075751 75 79.43497 0 0.1 0 0 0 1 
i 7.519345 102.5944 1.075751 77 80.54189 0 0.1 0 0 0 1 
i 7.642036 102.5944 1.075751 76 80.74314 0 0.1 0 0 0 1 
i 8.199721 102.6909 1.075751 88 82.98382 0 0.1 0 0 0 1 
i 8.261067 102.6909 0.5378755 87 83.08444 0 0.1 0 0 0 1 
i 8.629139 102.6909 0.5378755 96 83.68822 0 0.1 0 0 0 1 
i 8.813175 102.6909 0.5378755 98 83.9901 0 0.1 0 0 0 1 
i 9.119902 102.6909 0.5378755 83 84.49325 0 0.1 0 0 0 1 
i 9.303939 102.6909 0.5378755 85 84.79514 0 0.1 0 0 0 1 
i 9.672011 102.6909 0.5378755 75 85.39891 0 0.1 0 0 0 1 
i 9.733357 102.6909 0.5378755 73 85.49954 0 0.1 0 0 0 1 
i 6.415127 103.0309 1.434335 79 78.70642 0 0.1 0 0 0 1 
i 6.476473 103.0309 0.7171673 80 78.80704 0 0.1 0 0 0 1 
i 10.51969 103.0309 0.7171673 90 78.70642 0 0.1 0 0 0 1 
i 10.58104 103.0309 0.7171673 91 78.80704 0 0.1 0 0 0 1 
i 2.784594 103.0639 0.7171673 52 70.09862 0 0.1 0 0 0 1 
i 3.520739 103.0639 0.7171673 57 71.30616 0 0.1 0 0 0 1 
i 6.88916 103.0639 0.7171673 63 70.09862 0 0.1 0 0 0 1 
i 7.625305 103.0639 0.7171673 68 71.30616 0 0.1 0 0 0 1 
i 7.273963 103.1322 0.5378755 74 80.13937 0 0.1 0 0 0 1 
i 8.322412 103.2288 0.5378755 86 83.18507 0 0.1 0 0 0 1 
i 8.690484 103.2288 0.5378755 95 83.78885 0 0.1 0 0 0 1 
i 8.75183 103.2288 0.5378755 97 83.88948 0 0.1 0 0 0 1 
i 9.181248 103.2288 0.5378755 82 84.59388 0 0.1 0 0 0 1 
i 9.242593 103.2288 0.5378755 84 84.69451 0 0.1 0 0 0 1 
i 9.610666 103.2288 0.5378755 74 85.29828 0 0.1 0 0 0 1 
i 9.794702 103.2288 0.5378755 72 85.60017 0 0.1 0 0 0 1 
i 1 103.4562 0.5378755 53 70.10667 0 0.1 0 0 0 1 
i 5.104566 103.4562 0.5378755 65 70.10667 0 0.1 0 0 0 1 
i 6.537818 103.7481 0.7171673 80 78.90767 0 0.1 0 0 0 1 
i 10.45835 103.7481 0.7171673 91 78.60579 0 0.1 0 0 0 1 
i 10.64238 103.7481 0.7171673 92 78.90767 0 0.1 0 0 0 1 
i 2.845939 103.8128 0.7171673 53 70.19857 0 0.1 0 0 0 1 
i 3.029976 103.8128 0.7171673 50 70.50046 0 0.1 0 0 0 1 
i 3.275357 103.8128 1.434335 54 70.90298 0 0.1 0 0 0 1 
i 3.582084 103.8128 0.7171673 58 71.40612 0 0.1 0 0 0 1 
i 6.950505 103.8128 1.434335 64 70.19857 0 0.1 0 0 0 1 
i 7.134542 103.8128 1.434335 61 70.50046 0 0.1 0 0 0 1 
i 7.379923 103.8128 0.7171673 66 70.90298 0 0.1 0 0 0 1 
i 7.68665 103.8128 0.7171673 69 71.40612 0 0.1 0 0 0 1 
i 8.383757 104.0947 1.075751 90 83.28503 0 0.1 0 0 0 1 
i 8.629139 104.0947 1.075751 89 83.68755 0 0.1 0 0 0 1 
i 9.119902 104.0947 0.5378755 91 84.49258 0 0.1 0 0 0 1 
i 9.856047 104.0947 0.5378755 92 85.70013 0 0.1 0 0 0 1 
i 2.784594 104.53 0.7171673 52 70.09795 0 0.1 0 0 0 1 
i 3.091321 104.53 0.7171673 49 70.60109 0 0.1 0 0 0 1 
i 3.520739 104.53 0.7171673 57 71.30549 0 0.1 0 0 0 1 
i 7.441269 104.53 0.7171673 65 71.00361 0 0.1 0 0 0 1 
i 7.625305 104.53 0.7171673 68 71.30549 0 0.1 0 0 0 1 
i 1.061345 104.5347 0.5378755 55 70.20662 0 0.1 0 0 0 1 
i 5.165911 104.5347 1.075751 66 70.20662 0 0.1 0 0 0 1 
i 9.365284 104.6326 0.5378755 90 84.89509 0 0.1 0 0 0 1 
i 9.610666 104.6326 0.5378755 91 85.29761 0 0.1 0 0 0 1 
i 6.599163 104.726 0.7171673 81 79.00763 0 0.1 0 0 0 1 
i 10.70373 104.726 0.7171673 92 79.00763 0 0.1 0 0 0 1 
i 1 105.0726 0.5378755 54 70.106 0 0.1 0 0 0 1 
i 8.199721 105.3142 0.5378755 88 82.98247 0 0.1 0 0 0 1 
i 8.383757 105.3142 0.5378755 93 83.28436 0 0.1 0 0 0 1 
i 8.629139 105.3142 0.5378755 85 83.68688 0 0.1 0 0 0 1 
i 8.935866 105.3142 0.5378755 80 84.19002 0 0.1 0 0 0 1 
i 9.119902 105.3142 0.5378755 101 84.49191 0 0.1 0 0 0 1 
i 9.426629 105.3142 0.5378755 96 84.99505 0 0.1 0 0 0 1 
i 9.672011 105.3142 0.5378755 103 85.39757 0 0.1 0 0 0 1 
i 9.856047 105.3142 0.5378755 108 85.69945 0 0.1 0 0 0 1 
i 2.907285 105.3147 0.7171673 53 70.29853 0 0.1 0 0 0 1 
i 3.029976 105.3147 0.7171673 51 70.49979 0 0.1 0 0 0 1 
i 3.275357 105.3147 0.7171673 56 70.90231 0 0.1 0 0 0 1 
i 3.64343 105.3147 0.7171673 58 71.50608 0 0.1 0 0 0 1 
i 7.011851 105.3147 0.7171673 65 70.29853 0 0.1 0 0 0 1 
i 7.134542 105.3147 0.7171673 62 70.49979 0 0.1 0 0 0 1 
i 7.379923 105.3147 0.7171673 67 70.90231 0 0.1 0 0 0 1 
i 7.747996 105.3147 0.7171673 69 71.50608 0 0.1 0 0 0 1 
i 6.353782 105.4432 0.7171673 78 78.60512 0 0.1 0 0 0 1 
i 10.45835 105.4432 0.7171673 90 78.60512 0 0.1 0 0 0 1 
i 8.138376 105.852 0.5378755 89 82.88184 0 0.1 0 0 0 1 
i 8.445103 105.852 0.5378755 94 83.38499 0 0.1 0 0 0 1 
i 8.690484 105.852 0.5378755 86 83.78751 0 0.1 0 0 0 1 
i 8.874521 105.852 0.5378755 81 84.08939 0 0.1 0 0 0 1 
i 9.181248 105.852 0.5378755 102 84.59254 0 0.1 0 0 0 1 
i 9.365284 105.852 0.5378755 97 84.89442 0 0.1 0 0 0 1 
i 9.610666 105.852 0.5378755 104 85.29694 0 0.1 0 0 0 1 
i 9.917393 105.852 0.5378755 109 85.80008 0 0.1 0 0 0 1 
i 2.784594 106.0318 1.396284 52 70.09727 0 0.1 0 0 0 1 
i 3.152666 106.0318 0.7171673 49 70.70105 0 0.1 0 0 0 1 
i 3.398048 106.0318 2.113452 54 71.10356 0 0.1 0 0 0 1 
i 3.520739 106.0318 2.113452 57 71.30482 0 0.1 0 0 0 1 
i 6.88916 106.0318 2.113452 63 70.09727 0 0.1 0 0 0 1 
i 7.257232 106.0318 1.396284 61 70.70105 0 0.1 0 0 0 1 
i 7.502614 106.0318 2.113452 66 71.10356 0 0.1 0 0 0 1 
i 7.625305 106.0318 1.396284 68 71.30482 0 0.1 0 0 0 1 
i 1.122691 106.1905 0.5378755 56 70.30658 0 0.1 0 0 0 1 
i 5.227257 106.1905 0.5378755 68 70.30658 0 0.1 0 0 0 1 
i 6.415127 106.1985 0.7171673 78 78.70507 0 0.1 0 0 0 1 
i 6.599163 106.1985 0.7171673 81 79.00696 0 0.1 0 0 0 1 
i 10.51969 106.1985 0.7171673 90 78.70507 0 0.1 0 0 0 1 
i 10.70373 106.1985 1.434335 93 79.00696 0 0.1 0 0 0 1 
i 8.261067 106.5633 0.5378755 92 83.08243 0 0.1 0 0 0 1 
i 8.383757 106.5633 0.5378755 87 83.28369 0 0.1 0 0 0 1 
i 8.629139 106.5633 0.5378755 96 83.68621 0 0.1 0 0 0 1 
i 8.997212 106.5633 0.5378755 101 84.28998 0 0.1 0 0 0 1 
i 9.119902 106.5633 0.5378755 78 84.49124 0 0.1 0 0 0 1 
i 9.487975 106.5633 0.5378755 83 85.09501 0 0.1 0 0 0 1 
i 9.733357 106.5633 0.5378755 74 85.49753 0 0.1 0 0 0 1 
i 9.856047 106.5633 0.5378755 70 85.69878 0 0.1 0 0 0 1 
i 2.907285 106.7109 1.434335 53 70.29786 0 0.1 0 0 0 1 
i 3.029976 106.7109 1.434335 51 70.49912 0 0.1 0 0 0 1 
i 3.214012 106.7109 1.434335 50 70.80101 0 0.1 0 0 0 1 
i 3.275357 106.7109 1.434335 55 70.90164 0 0.1 0 0 0 1 
i 3.64343 106.7109 1.434335 58 71.50541 0 0.1 0 0 0 1 
i 7.011851 106.7109 1.434335 65 70.29786 0 0.1 0 0 0 1 
i 7.134542 106.7109 1.434335 62 70.49912 0 0.1 0 0 0 1 
i 7.379923 106.7109 0.7171673 67 70.90164 0 0.1 0 0 0 1 
i 7.747996 106.7109 1.434335 69 71.50541 0 0.1 0 0 0 1 
i 1 106.7284 0.5378755 55 70.10532 0 0.1 0 0 0 1 
i 5.104566 106.7284 0.5378755 66 70.10532 0 0.1 0 0 0 1 
i 6.353782 106.9157 0.7171673 79 78.60444 0 0.1 0 0 0 1 
i 6.660509 106.9157 0.7171673 82 79.10759 0 0.1 0 0 0 1 
i 10.45835 106.9157 0.7171673 90 78.60444 0 0.1 0 0 0 1 
i 8.138376 107.1012 0.5378755 89 82.88117 0 0.1 0 0 0 1 
i 8.506448 107.1012 0.5378755 85 83.48495 0 0.1 0 0 0 1 
i 8.75183 107.1012 0.5378755 93 83.88746 0 0.1 0 0 0 1 
i 8.874521 107.1012 0.5378755 98 84.08872 0 0.1 0 0 0 1 
i 9.242593 107.1012 0.5378755 76 84.69249 0 0.1 0 0 0 1 
i 9.365284 107.1012 0.5378755 80 84.89375 0 0.1 0 0 0 1 
i 9.610666 107.1012 0.5378755 71 85.29627 0 0.1 0 0 0 1 
i 9.978738 107.1012 0.5378755 67 85.90004 0 0.1 0 0 0 1 
i 3.336703 107.4281 0.7171673 56 71.00226 0 0.1 0 0 0 1 
i 6.88916 107.4281 0.7171673 64 70.0966 0 0.1 0 0 0 1 
i 7.441269 107.4281 0.7171673 68 71.00226 0 0.1 0 0 0 1 
i 7.809341 107.4281 0.7171673 70 71.60604 0 0.1 0 0 0 1 
i 6.476473 107.7069 0.7171673 79 78.80503 0 0.1 0 0 0 1 
i 6.599163 107.7069 0.7171673 81 79.00629 0 0.1 0 0 0 1 
i 10.58104 107.7069 0.7171673 91 78.80503 0 0.1 0 0 0 1 
i 10.70373 107.7069 0.7171673 93 79.00629 0 0.1 0 0 0 1 
i 8.199721 107.7247 1.075751 90 82.98113 0 0.1 0 0 0 1 
i 8.567794 107.7247 1.075751 90 83.58491 0 0.1 0 0 0 1 
i 8.629139 107.7247 1.075751 89 83.68553 0 0.1 0 0 0 1 
i 9.119902 107.7247 1.075751 91 84.49057 0 0.1 0 0 0 1 
i 9.672011 107.7247 1.075751 91 85.39623 0 0.1 0 0 0 1 
i 10.04008 107.7247 0.5378755 92 86 0 0.1 0 0 0 1 
i 1.061345 107.7299 1.075751 56 70.20528 0 0.1 0 0 0 1 
i 1.122691 107.7299 1.075751 57 70.30591 0 0.1 0 0 0 1 
i 5.165911 107.7299 0.5378755 67 70.20528 0 0.1 0 0 0 1 
i 5.227257 107.7299 1.075751 68 70.30591 0 0.1 0 0 0 1 
i 8.322412 108.2626 0.5378755 89 83.18239 0 0.1 0 0 0 1 
i 9.54932 108.2626 0.5378755 90 85.19497 0 0.1 0 0 0 1 
i 5.288602 108.2678 0.5378755 69 70.40654 0 0.1 0 0 0 1 
i 6.353782 108.4241 1.402355 80 78.60377 0 0.1 0 0 0 1 
i 6.721854 108.4241 2.119523 83 79.20755 0 0.1 0 0 0 1 
i 10.45835 108.4241 0.7171673 92 78.60377 0 0.1 0 0 0 1 
i 10.82642 108.4241 1.402355 94 79.20755 0 0.1 0 0 0 1 
i 6.415127 109.1093 1.434335 81 78.70373 0 0.1 0 0 0 1 
i 6.7832 109.1093 0.7171673 84 79.30751 0 0.1 0 0 0 1 
i 10.51969 109.1093 1.434335 93 78.70373 0 0.1 0 0 0 1 
i 10.58104 109.1093 0.7171673 92 78.80436 0 0.1 0 0 0 1 
i 10.88777 109.1093 1.434335 95 79.30751 0 0.1 0 0 0 1 
i 3.766121 109.3228 0.7171673 54 71.706 0 0.1 0 0 0 1 
i 7.870687 109.3228 0.7171673 65 71.706 0 0.1 0 0 0 1 
i 1.245382 109.5021 0.5378755 58 70.5065 0 0.1 0 0 0 1 
i 5.349948 109.5021 0.5378755 69 70.5065 0 0.1 0 0 0 1 
i 6.537818 109.8264 0.7171673 80 78.90499 0 0.1 0 0 0 1 
i 6.660509 109.8264 0.7171673 82 79.10625 0 0.1 0 0 0 1 
i 10.45835 109.8264 0.7171673 92 78.6031 0 0.1 0 0 0 1 
i 10.64238 109.8264 0.7171673 91 78.90499 0 0.1 0 0 0 1 
i 2.784594 110.04 0.7171673 45 70.09593 0 0.1 0 0 0 1 
i 6.88916 110.04 0.7171673 57 70.09593 0 0.1 0 0 0 1 
i 1 110.04 0.5378755 55 70.10398 0 0.1 0 0 0 1 
i 5.104566 110.04 2.077279 67 70.10398 0 0.1 0 0 0 1 
i 2.845939 110.8622 0.7171673 44 70.19589 0 0.1 0 0 0 1 
i 3.766121 110.8622 0.7171673 54 71.70532 0 0.1 0 0 0 1 
i 6.950505 110.8622 0.7171673 55 70.19589 0 0.1 0 0 0 1 
i 7.870687 110.8622 1.434335 66 71.70532 0 0.1 0 0 0 1 
i 1.061345 111.0415 0.5378755 55 70.20394 0 0.1 0 0 0 1 
i 1.245382 111.0415 0.5378755 58 70.50583 0 0.1 0 0 0 1 
i 5.349948 111.0415 1.075751 70 70.50583 0 0.1 0 0 0 1 
i 6.844545 111.0613 0.7171673 82 79.40746 0 0.1 0 0 0 1 
i 10.94911 111.0613 0.7171673 94 79.40746 0 0.1 0 0 0 1 
i 1 111.5794 0.5378755 56 70.10331 0 0.1 0 0 0 1 
i 1.306727 111.5794 0.5378755 59 70.60646 0 0.1 0 0 0 1 
i 2.784594 111.5794 0.7171673 45 70.09526 0 0.1 0 0 0 1 
i 3.827466 111.5794 0.7171673 55 71.80595 0 0.1 0 0 0 1 
i 6.88916 111.5794 0.7171673 56 70.09526 0 0.1 0 0 0 1 
i 6.353782 111.7784 0.7171673 78 78.60243 0 0.1 0 0 0 1 
i 10.45835 111.7784 0.7171673 89 78.60243 0 0.1 0 0 0 1 
i 2.907285 112.4392 0.7171673 43 70.29585 0 0.1 0 0 0 1 
i 3.766121 112.4392 0.7171673 54 71.70465 0 0.1 0 0 0 1 
i 7.011851 112.4392 0.7171673 55 70.29585 0 0.1 0 0 0 1 
i 7.870687 112.4392 0.7171673 66 71.70465 0 0.1 0 0 0 1 
i 6.415127 112.5337 0.7171673 77 78.70239 0 0.1 0 0 0 1 
i 6.844545 112.5337 0.7171673 83 79.40679 0 0.1 0 0 0 1 
i 10.51969 112.5337 0.7171673 89 78.70239 0 0.1 0 0 0 1 
i 10.94911 112.5337 0.7171673 94 79.40679 0 0.1 0 0 0 1 
i 1.122691 112.6185 0.5378755 56 70.3039 0 0.1 0 0 0 1 
i 1.245382 112.6185 0.5378755 58 70.50516 0 0.1 0 0 0 1 
i 5.227257 112.6185 0.5378755 68 70.3039 0 0.1 0 0 0 1 
i 5.349948 112.6185 0.5378755 70 70.50516 0 0.1 0 0 0 1 
i 1 113.1564 0.5378755 57 70.10264 0 0.1 0 0 0 1 
i 1.368072 113.1564 0.5378755 59 70.70642 0 0.1 0 0 0 1 
i 2.784594 113.1564 0.7171673 45 70.09459 0 0.1 0 0 0 1 
i 3.888811 113.1564 0.7171673 56 71.90591 0 0.1 0 0 0 1 
i 5.104566 113.1564 0.5378755 69 70.10264 0 0.1 0 0 0 1 
i 5.472639 113.1564 0.5378755 71 70.70642 0 0.1 0 0 0 1 
i 6.88916 113.1564 0.7171673 56 70.09459 0 0.1 0 0 0 1 
i 7.993377 113.1564 0.7171673 67 71.90591 0 0.1 0 0 0 1 
i 6.353782 113.2509 0.7171673 78 78.60176 0 0.1 0 0 0 1 
i 6.905891 113.2509 0.7171673 84 79.50742 0 0.1 0 0 0 1 
i 10.45835 113.2509 0.7171673 89 78.60176 0 0.1 0 0 0 1 
i 11.01046 113.2509 0.7171673 95 79.50742 0 0.1 0 0 0 1 
i 2.845939 113.9053 0.7171673 44 70.19455 0 0.1 0 0 0 1 
i 2.907285 113.9053 1.434335 43 70.29518 0 0.1 0 0 0 1 
i 3.766121 113.9053 1.434335 56 71.70398 0 0.1 0 0 0 1 
i 3.950157 113.9053 0.7171673 57 72.00587 0 0.1 0 0 0 1 
i 6.950505 113.9053 1.434335 55 70.19455 0 0.1 0 0 0 1 
i 7.011851 113.9053 1.434335 54 70.29518 0 0.1 0 0 0 1 
i 7.870687 113.9053 0.7171673 67 71.70398 0 0.1 0 0 0 1 
i 8.054723 113.9053 1.434335 68 72.00587 0 0.1 0 0 0 1 
i 6.476473 114.0421 0.7171673 77 78.80235 0 0.1 0 0 0 1 
i 6.844545 114.0421 0.7171673 83 79.40612 0 0.1 0 0 0 1 
i 10.58104 114.0421 0.7171673 89 78.80235 0 0.1 0 0 0 1 
i 10.94911 114.0421 0.7171673 94 79.40612 0 0.1 0 0 0 1 
i 1.061345 114.0846 1.075751 58 70.2026 0 0.1 0 0 0 1 
i 1.122691 114.0846 1.075751 57 70.30323 0 0.1 0 0 0 1 
i 1.245382 114.0846 1.075751 59 70.50449 0 0.1 0 0 0 1 
i 1.429418 114.0846 1.075751 60 70.80637 0 0.1 0 0 0 1 
i 5.165911 114.0846 1.075751 70 70.2026 0 0.1 0 0 0 1 
i 5.227257 114.0846 1.075751 69 70.30323 0 0.1 0 0 0 1 
i 5.349948 114.0846 1.075751 71 70.50449 0 0.1 0 0 0 1 
i 5.533984 114.0846 0.5378755 72 70.80637 0 0.1 0 0 0 1 
i 2.96863 114.6225 0.7171673 42 70.39581 0 0.1 0 0 0 1 
i 3.827466 114.6225 0.7171673 55 71.80461 0 0.1 0 0 0 1 
i 5.288602 114.6225 0.5378755 68 70.40386 0 0.1 0 0 0 1 
i 7.932032 114.6225 0.7171673 66 71.80461 0 0.1 0 0 0 1 
i 6.353782 114.7593 0.7171673 78 78.60109 0 0.1 0 0 0 1 
i 6.967236 114.7593 2.119523 84 79.60738 0 0.1 0 0 0 1 
i 10.45835 114.7593 0.7171673 90 78.60109 0 0.1 0 0 0 1 
i 11.0718 114.7593 2.119523 96 79.60738 0 0.1 0 0 0 1 
i 6.415127 115.4445 0.7171673 79 78.70105 0 0.1 0 0 0 1 
i 6.476473 115.4445 0.7171673 77 78.80168 0 0.1 0 0 0 1 
i 7.028581 115.4445 1.434335 85 79.70734 0 0.1 0 0 0 1 
i 10.51969 115.4445 0.7171673 90 78.70105 0 0.1 0 0 0 1 
i 10.58104 115.4445 0.7171673 89 78.80168 0 0.1 0 0 0 1 
i 11.13315 115.4445 0.7171673 97 79.70734 0 0.1 0 0 0 1 
i 3.029976 115.5931 0.7171673 42 70.49577 0 0.1 0 0 0 1 
i 3.766121 115.5931 0.7171673 54 71.70331 0 0.1 0 0 0 1 
i 7.134542 115.5931 0.7171673 54 70.49577 0 0.1 0 0 0 1 
i 7.870687 115.5931 0.7171673 65 71.70331 0 0.1 0 0 0 1 
i 1.490763 116.1253 0.5378755 59 70.90633 0 0.1 0 0 0 1 
i 5.595329 116.1253 0.5378755 70 70.90633 0 0.1 0 0 0 1 
i 6.353782 116.1616 0.7171673 78 78.60042 0 0.1 0 0 0 1 
i 6.537818 116.1616 0.7171673 77 78.90231 0 0.1 0 0 0 1 
i 10.45835 116.1616 0.7171673 89 78.60042 0 0.1 0 0 0 1 
i 10.64238 116.1616 0.7171673 88 78.90231 0 0.1 0 0 0 1 
i 11.01046 116.1616 0.7171673 95 79.50608 0 0.1 0 0 0 1 
i 2.784594 116.3103 0.7171673 45 70.09325 0 0.1 0 0 0 1 
i 4.011502 116.3103 0.7171673 57 72.10583 0 0.1 0 0 0 1 
i 6.88916 116.3103 0.7171673 56 70.09325 0 0.1 0 0 0 1 
i 8.116068 116.3103 0.7171673 68 72.10583 0 0.1 0 0 0 1 
i 1 116.6632 0.5378755 55 70.1013 0 0.1 0 0 0 1 
i 5.104566 116.6632 0.5378755 66 70.1013 0 0.1 0 0 0 1 
i 6.599163 117.0589 0.7171673 78 79.00226 0 0.1 0 0 0 1 
i 6.844545 117.0589 0.7171673 83 79.40478 0 0.1 0 0 0 1 
i 10.70373 117.0589 0.7171673 89 79.00226 0 0.1 0 0 0 1 
i 10.94911 117.0589 0.7171673 94 79.40478 0 0.1 0 0 0 1 
i 2.845939 117.0592 1.434335 45 70.19321 0 0.1 0 0 0 1 
i 3.029976 117.0592 0.7171673 42 70.49509 0 0.1 0 0 0 1 
i 3.766121 117.0592 1.434335 54 71.70264 0 0.1 0 0 0 1 
i 4.072848 117.0592 1.434335 57 72.20579 0 0.1 0 0 0 1 
i 6.950505 117.0592 0.7171673 57 70.19321 0 0.1 0 0 0 1 
i 7.134542 117.0592 1.434335 53 70.49509 0 0.1 0 0 0 1 
i 7.870687 117.0592 0.7171673 66 71.70264 0 0.1 0 0 0 1 
i 8.177414 117.0592 0.7171673 69 72.20579 0 0.1 0 0 0 1 
i 1.061345 117.6647 0.5378755 54 70.20126 0 0.1 0 0 0 1 
i 1.490763 117.6647 0.5378755 60 70.90566 0 0.1 0 0 0 1 
i 5.165911 117.6647 1.075751 66 70.20126 0 0.1 0 0 0 1 
i 5.595329 117.6647 0.5378755 71 70.90566 0 0.1 0 0 0 1 
i 6.353782 117.7761 0.7171673 80 78.59975 0 0.1 0 0 0 1 
i 7.089927 117.7761 0.7171673 85 79.8073 0 0.1 0 0 0 1 
i 10.45835 117.7761 0.7171673 92 78.59975 0 0.1 0 0 0 1 
i 11.19449 117.7761 0.7171673 97 79.8073 0 0.1 0 0 0 1 
i 3.091321 117.7764 0.7171673 41 70.59572 0 0.1 0 0 0 1 
i 6.88916 117.7764 0.7171673 56 70.09258 0 0.1 0 0 0 1 
i 7.932032 117.7764 0.7171673 65 71.80327 0 0.1 0 0 0 1 
i 8.116068 117.7764 0.7171673 68 72.10516 0 0.1 0 0 0 1 
i 4.569188 118.1514 0.5378755 82 78.6078 0 0.1 0 0 0 1 
i 8.673754 118.1514 0.5378755 93 78.6078 0 0.1 0 0 0 1 
i 1 118.2026 0.5378755 55 70.10063 0 0.1 0 0 0 1 
i 1.552109 118.2026 0.5378755 60 71.00629 0 0.1 0 0 0 1 
i 5.656675 118.2026 0.5378755 72 71.00629 0 0.1 0 0 0 1 
i 6.415127 118.4613 1.434335 81 78.69971 0 0.1 0 0 0 1 
i 6.599163 118.4613 1.434335 78 79.00159 0 0.1 0 0 0 1 
i 6.844545 118.4613 0.7171673 83 79.40411 0 0.1 0 0 0 1 
i 7.151272 118.4613 1.434335 86 79.90725 0 0.1 0 0 0 1 
i 10.51969 118.4613 0.7171673 93 78.69971 0 0.1 0 0 0 1 
i 10.70373 118.4613 0.7171673 90 79.00159 0 0.1 0 0 0 1 
i 10.94911 118.4613 1.434335 94 79.40411 0 0.1 0 0 0 1 
i 11.25584 118.4613 0.7171673 98 79.90725 0 0.1 0 0 0 1 
i 2.907285 118.561 0.7171673 45 70.29317 0 0.1 0 0 0 1 
i 3.029976 118.561 0.7171673 42 70.49442 0 0.1 0 0 0 1 
i 3.766121 118.561 1.434335 56 71.70197 0 0.1 0 0 0 1 
i 4.134193 118.561 0.7171673 58 72.30574 0 0.1 0 0 0 1 
i 7.011851 118.561 0.7171673 56 70.29317 0 0.1 0 0 0 1 
i 7.134542 118.561 0.7171673 54 70.49442 0 0.1 0 0 0 1 
i 7.870687 118.561 0.7171673 67 71.70197 0 0.1 0 0 0 1 
i 8.238759 118.561 0.7171673 69 72.30574 0 0.1 0 0 0 1 
i 4.630533 119.1596 1.075751 83 78.70776 0 0.1 0 0 0 1 
i 8.735099 119.1596 0.5378755 95 78.70776 0 0.1 0 0 0 1 
i 6.905891 119.1784 0.7171673 82 79.50474 0 0.1 0 0 0 1 
i 10.45835 119.1784 0.7171673 92 78.59908 0 0.1 0 0 0 1 
i 10.76507 119.1784 0.7171673 89 79.10222 0 0.1 0 0 0 1 
i 11.19449 119.1784 0.7171673 97 79.80662 0 0.1 0 0 0 1 
i 1.122691 119.2417 0.5378755 54 70.30122 0 0.1 0 0 0 1 
i 1.490763 119.2417 0.5378755 60 70.90499 0 0.1 0 0 0 1 
i 5.227257 119.2417 0.5378755 66 70.30122 0 0.1 0 0 0 1 
i 5.595329 119.2417 0.5378755 71 70.90499 0 0.1 0 0 0 1 
i 2.784594 119.2782 2.113452 43 70.09191 0 0.1 0 0 0 1 
i 3.152666 119.2782 0.7171673 41 70.69568 0 0.1 0 0 0 1 
i 3.888811 119.2782 1.396284 54 71.90323 0 0.1 0 0 0 1 
i 6.88916 119.2782 2.113452 55 70.09191 0 0.1 0 0 0 1 
i 7.257232 119.2782 2.113452 53 70.69568 0 0.1 0 0 0 1 
i 7.993377 119.2782 2.113452 66 71.90323 0 0.1 0 0 0 1 
i 8.116068 119.2782 2.113452 68 72.10449 0 0.1 0 0 0 1 
i 8.673754 119.6975 0.5378755 94 78.60713 0 0.1 0 0 0 1 
i 1 119.7795 0.5378755 55 70.09996 0 0.1 0 0 0 1 
i 1.613454 119.7795 0.5378755 61 71.10625 0 0.1 0 0 0 1 
i 5.104566 119.7795 0.5378755 67 70.09996 0 0.1 0 0 0 1 
i 5.71802 119.7795 0.5378755 72 71.10625 0 0.1 0 0 0 1 
i 6.476473 119.8978 0.7171673 82 78.79966 0 0.1 0 0 0 1 
i 6.599163 119.8978 0.7171673 79 79.00092 0 0.1 0 0 0 1 
i 6.844545 119.8978 0.7171673 84 79.40344 0 0.1 0 0 0 1 
i 7.212618 119.8978 0.7171673 86 80.00721 0 0.1 0 0 0 1 
i 10.58104 119.8978 0.7171673 93 78.79966 0 0.1 0 0 0 1 
i 10.70373 119.8978 0.7171673 91 79.00092 0 0.1 0 0 0 1 
i 10.94911 119.8978 0.7171673 96 79.40344 0 0.1 0 0 0 1 
i 11.31718 119.8978 0.7171673 98 80.00721 0 0.1 0 0 0 1 
i 2.907285 119.9573 0.7171673 44 70.29249 0 0.1 0 0 0 1 
i 3.029976 119.9573 1.434335 42 70.49375 0 0.1 0 0 0 1 
i 3.214012 119.9573 0.7171673 40 70.79564 0 0.1 0 0 0 1 
i 3.766121 119.9573 1.434335 55 71.7013 0 0.1 0 0 0 1 
i 4.072848 119.9573 1.434335 57 72.20444 0 0.1 0 0 0 1 
i 4.134193 119.9573 1.434335 58 72.30507 0 0.1 0 0 0 1 
i 6.950505 119.9573 1.434335 54 70.19187 0 0.1 0 0 0 1 
i 7.318578 119.9573 0.7171673 52 70.79564 0 0.1 0 0 0 1 
i 7.870687 119.9573 0.7171673 67 71.7013 0 0.1 0 0 0 1 
i 8.238759 119.9573 1.434335 69 72.30507 0 0.1 0 0 0 1 
i 6.353782 120.615 0.7171673 80 78.59841 0 0.1 0 0 0 1 
i 6.721854 120.615 1.335576 78 79.20218 0 0.1 0 0 0 1 
i 6.967236 120.615 2.052744 83 79.6047 0 0.1 0 0 0 1 
i 7.089927 120.615 2.052744 85 79.80595 0 0.1 0 0 0 1 
i 10.45835 120.615 0.7171673 92 78.59841 0 0.1 0 0 0 1 
i 10.82642 120.615 0.7171673 89 79.20218 0 0.1 0 0 0 1 
i 11.0718 120.615 2.052744 94 79.6047 0 0.1 0 0 0 1 
i 11.19449 120.615 2.052744 97 79.80595 0 0.1 0 0 0 1 
i 2.96863 120.6745 0.7171673 45 70.39312 0 0.1 0 0 0 1 
i 3.152666 120.6745 0.7171673 41 70.69501 0 0.1 0 0 0 1 
i 3.827466 120.6745 0.7171673 56 71.80193 0 0.1 0 0 0 1 
i 7.073196 120.6745 0.7171673 56 70.39312 0 0.1 0 0 0 1 
i 8.300105 120.6745 0.7171673 70 72.4057 0 0.1 0 0 0 1 
i 1.061345 120.7078 0.5378755 56 70.19992 0 0.1 0 0 0 1 
i 1.122691 120.7078 1.075751 55 70.30055 0 0.1 0 0 0 1 
i 1.490763 120.7078 0.5378755 61 70.90432 0 0.1 0 0 0 1 
i 1.6748 120.7078 0.5378755 62 71.20621 0 0.1 0 0 0 1 
i 5.165911 120.7078 1.075751 67 70.19992 0 0.1 0 0 0 1 
i 5.227257 120.7078 1.075751 66 70.30055 0 0.1 0 0 0 1 
i 5.595329 120.7078 1.075751 72 70.90432 0 0.1 0 0 0 1 
i 5.779366 120.7078 1.075751 73 71.20621 0 0.1 0 0 0 1 
i 4.691879 120.7434 0.5378755 85 78.80771 0 0.1 0 0 0 1 
i 8.796445 120.7434 0.5378755 96 78.80771 0 0.1 0 0 0 1 
i 6.415127 121.2334 1.434335 81 78.69836 0 0.1 0 0 0 1 
i 6.476473 121.2334 0.7171673 82 78.79899 0 0.1 0 0 0 1 
i 6.599163 121.2334 1.434335 79 79.00025 0 0.1 0 0 0 1 
i 6.844545 121.2334 0.7171673 84 79.40277 0 0.1 0 0 0 1 
i 7.212618 121.2334 1.434335 86 80.00654 0 0.1 0 0 0 1 
i 10.51969 121.2334 0.7171673 92 78.69836 0 0.1 0 0 0 1 
i 10.58104 121.2334 0.7171673 93 78.79899 0 0.1 0 0 0 1 
i 10.70373 121.2334 1.434335 91 79.00025 0 0.1 0 0 0 1 
i 10.88777 121.2334 1.434335 90 79.30214 0 0.1 0 0 0 1 
i 10.94911 121.2334 1.434335 96 79.40277 0 0.1 0 0 0 1 
i 11.31718 121.2334 1.434335 98 80.00654 0 0.1 0 0 0 1 
i 1.184036 121.2456 0.5378755 54 70.40117 0 0.1 0 0 0 1 
i 1.552109 121.2456 0.5378755 60 71.00495 0 0.1 0 0 0 1 
i 1.613454 121.2456 0.5378755 61 71.10558 0 0.1 0 0 0 1 
i 4.569188 121.2813 0.5378755 83 78.60646 0 0.1 0 0 0 1 
i 8.673754 121.2813 1.336786 95 78.60646 0 0.1 0 0 0 1 
i 3.275357 121.9009 0.7171673 42 70.8956 0 0.1 0 0 0 1 
i 3.766121 121.9009 0.7171673 52 71.70063 0 0.1 0 0 0 1 
i 7.379923 121.9009 0.7171673 54 70.8956 0 0.1 0 0 0 1 
i 7.870687 121.9009 0.7171673 63 71.70063 0 0.1 0 0 0 1 
i 6.537818 121.9506 0.7171673 82 78.89962 0 0.1 0 0 0 1 
i 6.660509 121.9506 0.7171673 80 79.10088 0 0.1 0 0 0 1 
i 7.273963 121.9506 0.7171673 87 80.10717 0 0.1 0 0 0 1 
i 10.45835 121.9506 0.7171673 93 78.59774 0 0.1 0 0 0 1 
i 11.0718 121.9506 0.7171673 95 79.60403 0 0.1 0 0 0 1 
i 4.630533 122.2159 0.5378755 84 78.70642 0 0.1 0 0 0 1 
i 4.691879 122.2159 1.075751 85 78.80704 0 0.1 0 0 0 1 
i 8.735099 122.2159 1.075751 96 78.70642 0 0.1 0 0 0 1 
i 8.796445 122.2159 1.075751 97 78.80704 0 0.1 0 0 0 1 
i 1.245382 122.3956 0.5378755 55 70.50113 0 0.1 0 0 0 1 
i 1.490763 122.3956 0.5378755 59 70.90365 0 0.1 0 0 0 1 
i 5.349948 122.3956 0.5378755 66 70.50113 0 0.1 0 0 0 1 
i 5.595329 122.3956 0.5378755 71 70.90365 0 0.1 0 0 0 1 
i 2.784594 122.6181 0.7171673 47 70.09057 0 0.1 0 0 0 1 
i 4.256884 122.6181 0.7171673 56 72.50566 0 0.1 0 0 0 1 
i 6.88916 122.6181 0.7171673 59 70.09057 0 0.1 0 0 0 1 
i 8.36145 122.6181 0.7171673 68 72.50566 0 0.1 0 0 0 1 
i 4.753224 122.7537 0.5378755 86 78.90767 0 0.1 0 0 0 1 
i 1 122.9334 0.5378755 57 70.09862 0 0.1 0 0 0 1 
i 1.736145 122.9334 0.5378755 62 71.30616 0 0.1 0 0 0 1 
i 5.104566 122.9334 0.5378755 69 70.09862 0 0.1 0 0 0 1 
i 5.840711 122.9334 0.5378755 73 71.30616 0 0.1 0 0 0 1 
i 2.845939 123.367 0.7171673 48 70.19052 0 0.1 0 0 0 1 
i 3.275357 123.367 0.7171673 42 70.89493 0 0.1 0 0 0 1 
i 3.766121 123.367 1.434335 51 71.69996 0 0.1 0 0 0 1 
i 4.318229 123.367 1.434335 57 72.60562 0 0.1 0 0 0 1 
i 6.950505 123.367 0.7171673 60 70.19052 0 0.1 0 0 0 1 
i 7.379923 123.367 0.7171673 54 70.89493 0 0.1 0 0 0 1 
i 7.870687 123.367 0.7171673 63 71.69996 0 0.1 0 0 0 1 
i 8.422795 123.367 0.7171673 69 72.60562 0 0.1 0 0 0 1 
i 7.335308 123.7317 0.7171673 82 80.20713 0 0.1 0 0 0 1 
i 11.43987 123.7317 0.7171673 94 80.20713 0 0.1 0 0 0 1 
i 1.061345 123.8617 1.075751 58 70.19857 0 0.1 0 0 0 1 
i 1.245382 123.8617 1.075751 55 70.50046 0 0.1 0 0 0 1 
i 1.490763 123.8617 0.5378755 60 70.90298 0 0.1 0 0 0 1 
i 1.79749 123.8617 1.075751 62 71.40612 0 0.1 0 0 0 1 
i 5.165911 123.8617 0.5378755 70 70.19857 0 0.1 0 0 0 1 
i 5.349948 123.8617 0.5378755 67 70.50046 0 0.1 0 0 0 1 
i 5.595329 123.8617 1.075751 71 70.90298 0 0.1 0 0 0 1 
i 5.902056 123.8617 0.5378755 74 71.40612 0 0.1 0 0 0 1 
i 4.81457 123.911 0.5378755 86 79.00763 0 0.1 0 0 0 1 
i 8.919136 123.911 0.5378755 98 79.00763 0 0.1 0 0 0 1 
i 2.784594 124.0842 0.7171673 47 70.0899 0 0.1 0 0 0 1 
i 3.336703 124.0842 0.7171673 41 70.99556 0 0.1 0 0 0 1 
i 6.88916 124.0842 0.7171673 59 70.0899 0 0.1 0 0 0 1 
i 7.441269 124.0842 0.7171673 53 70.99556 0 0.1 0 0 0 1 
i 7.932032 124.0842 0.7171673 62 71.80059 0 0.1 0 0 0 1 
i 8.36145 124.0842 0.7171673 68 72.50499 0 0.1 0 0 0 1 
i 1.552109 124.3995 0.5378755 59 71.00361 0 0.1 0 0 0 1 
i 5.104566 124.3995 0.5378755 69 70.09795 0 0.1 0 0 0 1 
i 5.411293 124.3995 0.5378755 66 70.60109 0 0.1 0 0 0 1 
i 5.840711 124.3995 0.5378755 73 71.30549 0 0.1 0 0 0 1 
i 6.353782 124.4489 0.7171673 74 78.59706 0 0.1 0 0 0 1 
i 10.45835 124.4489 0.7171673 85 78.59706 0 0.1 0 0 0 1 
i 4.569188 124.4489 0.5378755 84 78.60512 0 0.1 0 0 0 1 
i 8.673754 124.4489 0.5378755 95 78.60512 0 0.1 0 0 0 1 
i 2.907285 124.8688 0.7171673 48 70.29048 0 0.1 0 0 0 1 
i 3.275357 124.8688 0.7171673 42 70.89426 0 0.1 0 0 0 1 
i 3.766121 124.8688 0.7171673 52 71.69929 0 0.1 0 0 0 1 
i 4.379575 124.8688 0.7171673 58 72.70558 0 0.1 0 0 0 1 
i 7.011851 124.8688 0.7171673 60 70.29048 0 0.1 0 0 0 1 
i 7.379923 124.8688 0.7171673 54 70.89426 0 0.1 0 0 0 1 
i 7.870687 124.8688 0.7171673 63 71.69929 0 0.1 0 0 0 1 
i 8.484141 124.8688 0.7171673 69 72.70558 0 0.1 0 0 0 1 
i 6.415127 125.2042 1.434335 73 78.69702 0 0.1 0 0 0 1 
i 7.335308 125.2042 1.434335 83 80.20646 0 0.1 0 0 0 1 
i 10.51969 125.2042 0.7171673 84 78.69702 0 0.1 0 0 0 1 
i 11.43987 125.2042 0.7171673 94 80.20646 0 0.1 0 0 0 1 
i 2.784594 125.3128 0.5378755 49 70.10667 0 0.1 0 0 0 1 
i 6.88916 125.3128 0.5378755 61 70.10667 0 0.1 0 0 0 1 
i 1.122691 125.3635 0.5378755 59 70.29853 0 0.1 0 0 0 1 
i 1.245382 125.3635 0.5378755 56 70.49979 0 0.1 0 0 0 1 
i 1.490763 125.3635 0.5378755 61 70.90231 0 0.1 0 0 0 1 
i 1.858836 125.3635 0.5378755 63 71.50608 0 0.1 0 0 0 1 
i 5.227257 125.3635 0.5378755 70 70.29853 0 0.1 0 0 0 1 
i 5.349948 125.3635 0.5378755 68 70.49979 0 0.1 0 0 0 1 
i 5.595329 125.3635 0.5378755 72 70.90231 0 0.1 0 0 0 1 
i 5.963402 125.3635 0.5378755 74 71.50608 0 0.1 0 0 0 1 
i 4.630533 125.3835 1.075751 84 78.70507 0 0.1 0 0 0 1 
i 4.81457 125.3835 1.075751 87 79.00696 0 0.1 0 0 0 1 
i 8.735099 125.3835 0.5378755 95 78.70507 0 0.1 0 0 0 1 
i 8.919136 125.3835 0.5378755 98 79.00696 0 0.1 0 0 0 1 
i 2.784594 125.586 1.396284 47 70.08922 0 0.1 0 0 0 1 
i 3.398048 125.586 0.7171673 41 71.09551 0 0.1 0 0 0 1 
i 3.888811 125.586 2.113452 50 71.90055 0 0.1 0 0 0 1 
i 4.256884 125.586 0.7171673 56 72.50432 0 0.1 0 0 0 1 
i 6.88916 125.586 2.113452 59 70.08922 0 0.1 0 0 0 1 
i 7.502614 125.586 0.7171673 53 71.09551 0 0.1 0 0 0 1 
i 7.993377 125.586 0.7171673 62 71.90055 0 0.1 0 0 0 1 
i 8.36145 125.586 1.396284 68 72.50432 0 0.1 0 0 0 1 
i 1 125.9014 0.5378755 57 70.09727 0 0.1 0 0 0 1 
i 1.368072 125.9014 0.5378755 55 70.70105 0 0.1 0 0 0 1 
i 1.613454 125.9014 0.5378755 59 71.10356 0 0.1 0 0 0 1 
i 1.736145 125.9014 0.5378755 62 71.30482 0 0.1 0 0 0 1 
i 5.104566 125.9014 0.5378755 69 70.09727 0 0.1 0 0 0 1 
i 5.472639 125.9014 0.5378755 67 70.70105 0 0.1 0 0 0 1 
i 5.71802 125.9014 0.5378755 71 71.10356 0 0.1 0 0 0 1 
i 8.673754 125.9214 0.5378755 96 78.60444 0 0.1 0 0 0 1 
i 8.980481 125.9214 0.5378755 99 79.10759 0 0.1 0 0 0 1 
i 10.45835 125.9214 0.7171673 85 78.59639 0 0.1 0 0 0 1 
i 11.50122 125.9214 0.7171673 95 80.30709 0 0.1 0 0 0 1 
i 2.907285 126.2651 1.434335 48 70.28981 0 0.1 0 0 0 1 
i 3.275357 126.2651 1.434335 42 70.89358 0 0.1 0 0 0 1 
i 3.459394 126.2651 0.7171673 40 71.19547 0 0.1 0 0 0 1 
i 3.766121 126.2651 0.7171673 51 71.69862 0 0.1 0 0 0 1 
i 4.318229 126.2651 1.434335 57 72.60428 0 0.1 0 0 0 1 
i 4.379575 126.2651 1.434335 58 72.70491 0 0.1 0 0 0 1 
i 7.011851 126.2651 1.434335 60 70.28981 0 0.1 0 0 0 1 
i 7.379923 126.2651 0.7171673 53 70.89358 0 0.1 0 0 0 1 
i 7.56396 126.2651 0.7171673 52 71.19547 0 0.1 0 0 0 1 
i 7.870687 126.2651 1.434335 63 71.69862 0 0.1 0 0 0 1 
i 8.054723 126.2651 0.7171673 61 72.0005 0 0.1 0 0 0 1 
i 8.484141 126.2651 1.434335 69 72.70491 0 0.1 0 0 0 1 
i 2.845939 126.3913 0.5378755 44 70.20662 0 0.1 0 0 0 1 
i 6.950505 126.3913 0.5378755 55 70.20662 0 0.1 0 0 0 1 
i 6.476473 126.7126 1.122986 72 78.79698 0 0.1 0 0 0 1 
i 7.335308 126.7126 0.7171673 83 80.20579 0 0.1 0 0 0 1 
i 10.58104 126.7126 0.7171673 83 78.79698 0 0.1 0 0 0 1 
i 11.43987 126.7126 0.7171673 94 80.20579 0 0.1 0 0 0 1 
i 1.061345 126.7598 1.075751 57 70.19723 0 0.1 0 0 0 1 
i 1.122691 126.7598 1.075751 58 70.29786 0 0.1 0 0 0 1 
i 1.245382 126.7598 1.075751 56 70.49912 0 0.1 0 0 0 1 
i 1.429418 126.7598 0.5378755 55 70.80101 0 0.1 0 0 0 1 
i 1.490763 126.7598 0.5378755 61 70.90164 0 0.1 0 0 0 1 
i 1.6748 126.7598 1.075751 60 71.20352 0 0.1 0 0 0 1 
i 1.79749 126.7598 1.075751 62 71.40478 0 0.1 0 0 0 1 
i 1.858836 126.7598 1.075751 63 71.50541 0 0.1 0 0 0 1 
i 5.165911 126.7598 1.075751 69 70.19723 0 0.1 0 0 0 1 
i 5.227257 126.7598 0.5378755 70 70.29786 0 0.1 0 0 0 1 
i 5.349948 126.7598 1.075751 68 70.49912 0 0.1 0 0 0 1 
i 5.533984 126.7598 0.5378755 67 70.80101 0 0.1 0 0 0 1 
i 5.779366 126.7598 0.5378755 71 71.20352 0 0.1 0 0 0 1 
i 5.902056 126.7598 2.072287 73 71.40478 0 0.1 0 0 0 1 
i 5.963402 126.7598 1.075751 74 71.50541 0 0.1 0 0 0 1 
i 4.691879 126.8919 0.5378755 85 78.80503 0 0.1 0 0 0 1 
i 4.81457 126.8919 0.5378755 87 79.00629 0 0.1 0 0 0 1 
i 8.796445 126.8919 0.5378755 96 78.80503 0 0.1 0 0 0 1 
i 8.919136 126.8919 0.5378755 98 79.00629 0 0.1 0 0 0 1 
i 2.784594 126.9291 0.5378755 45 70.106 0 0.1 0 0 0 1 
i 6.88916 126.9291 0.5378755 56 70.106 0 0.1 0 0 0 1 
i 2.96863 126.9823 0.7171673 49 70.39044 0 0.1 0 0 0 1 
i 3.398048 126.9823 0.7171673 41 71.09484 0 0.1 0 0 0 1 
i 3.827466 126.9823 0.7171673 52 71.79925 0 0.1 0 0 0 1 
i 7.441269 126.9823 0.7171673 54 70.99421 0 0.1 0 0 0 1 
i 7.502614 126.9823 0.7171673 53 71.09484 0 0.1 0 0 0 1 
i 7.993377 126.9823 0.7171673 62 71.89987 0 0.1 0 0 0 1 
i 8.545486 126.9823 0.7171673 70 72.80553 0 0.1 0 0 0 1 
i 1.184036 127.2977 0.5378755 59 70.39849 0 0.1 0 0 0 1 
i 1.552109 127.2977 0.5378755 61 71.00226 0 0.1 0 0 0 1 
i 5.288602 127.2977 0.5378755 71 70.39849 0 0.1 0 0 0 1 
i 5.472639 127.2977 0.5378755 67 70.70038 0 0.1 0 0 0 1 
i 6.024747 127.2977 0.5378755 75 71.60604 0 0.1 0 0 0 1 
i 4.569188 127.4297 0.5378755 86 78.60377 0 0.1 0 0 0 1 
i 4.93726 127.4297 0.5378755 88 79.20755 0 0.1 0 0 0 1 
i 7.457999 127.4297 1.402355 84 80.40704 0 0.1 0 0 0 1 
i 8.673754 127.4297 0.5378755 97 78.60377 0 0.1 0 0 0 1 
i 9.041826 127.4297 0.5378755 100 79.20755 0 0.1 0 0 0 1 
i 10.45835 127.4297 0.7171673 85 78.59572 0 0.1 0 0 0 1 
i 11.56257 127.4297 0.7171673 96 80.40704 0 0.1 0 0 0 1 
i 3.029976 127.8726 0.7171673 48 70.4904 0 0.1 0 0 0 1 
i 3.275357 127.8726 0.7171673 44 70.89291 0 0.1 0 0 0 1 
i 3.766121 127.8726 0.7171673 53 71.69795 0 0.1 0 0 0 1 
i 4.502266 127.8726 0.7171673 58 72.90549 0 0.1 0 0 0 1 
i 7.134542 127.8726 0.7171673 60 70.4904 0 0.1 0 0 0 1 
i 7.379923 127.8726 0.7171673 55 70.89291 0 0.1 0 0 0 1 
i 7.870687 127.8726 0.7171673 65 71.69795 0 0.1 0 0 0 1 
i 8.606832 127.8726 0.7171673 69 72.90549 0 0.1 0 0 0 1 
i 2.907285 128.0471 1.259834 46 70.30658 0 0.1 0 0 0 1 
i 7.011851 128.0471 1.075751 58 70.30658 0 0.1 0 0 0 1 
i 6.476473 128.1149 0.7171673 71 78.79631 0 0.1 0 0 0 1 
i 7.519345 128.1149 0.7171673 85 80.507 0 0.1 0 0 0 1 
i 10.51969 128.1149 0.7171673 84 78.69568 0 0.1 0 0 0 1 
i 10.58104 128.1149 0.7171673 83 78.79631 0 0.1 0 0 0 1 
i 11.43987 128.1149 0.7171673 96 80.20512 0 0.1 0 0 0 1 
i 11.62391 128.1149 0.7171673 97 80.507 0 0.1 0 0 0 1 
i 4.630533 128.2942 1.075751 87 78.70373 0 0.1 0 0 0 1 
i 4.691879 128.2942 1.075751 86 78.80436 0 0.1 0 0 0 1 
i 4.81457 128.2942 1.075751 88 79.00562 0 0.1 0 0 0 1 
i 4.998606 128.2942 0.5378755 89 79.30751 0 0.1 0 0 0 1 
i 8.735099 128.2942 1.075751 98 78.70373 0 0.1 0 0 0 1 
i 8.796445 128.2942 1.075751 97 78.80436 0 0.1 0 0 0 1 
i 8.919136 128.2942 1.075751 99 79.00562 0 0.1 0 0 0 1 
i 9.103172 128.2942 1.075751 100 79.30751 0 0.1 0 0 0 1 
i 3.520739 128.5897 0.7171673 41 71.29543 0 0.1 0 0 0 1 
i 4.011502 128.5897 0.7171673 51 72.10046 0 0.1 0 0 0 1 
i 4.256884 128.5897 2.826625 55 72.50298 0 0.1 0 0 0 1 
i 6.88916 128.5897 2.826625 57 70.08788 0 0.1 0 0 0 1 
i 7.625305 128.5897 0.7171673 53 71.29543 0 0.1 0 0 0 1 
i 8.116068 128.5897 0.7171673 62 72.10046 0 0.1 0 0 0 1 
i 8.36145 128.5897 0.7171673 67 72.50298 0 0.1 0 0 0 1 
i 4.753224 128.8321 0.5378755 85 78.90499 0 0.1 0 0 0 1 
i 6.353782 128.8321 0.7171673 72 78.59505 0 0.1 0 0 0 1 
i 6.537818 128.8321 0.7171673 71 78.89694 0 0.1 0 0 0 1 
i 7.396654 128.8321 0.7171673 83 80.30574 0 0.1 0 0 0 1 
i 7.457999 128.8321 0.7171673 85 80.40637 0 0.1 0 0 0 1 
i 10.45835 128.8321 0.7171673 83 78.59505 0 0.1 0 0 0 1 
i 10.64238 128.8321 0.7171673 82 78.89694 0 0.1 0 0 0 1 
i 11.50122 128.8321 0.7171673 95 80.30574 0 0.1 0 0 0 1 
i 11.56257 128.8321 0.7171673 96 80.40637 0 0.1 0 0 0 1 
i 2.845939 129.2688 0.7171673 45 70.18784 0 0.1 0 0 0 1 
i 3.029976 129.2688 0.7171673 48 70.48973 0 0.1 0 0 0 1 
i 3.275357 129.2688 1.434335 44 70.89224 0 0.1 0 0 0 1 
i 3.582084 129.2688 0.7171673 40 71.39539 0 0.1 0 0 0 1 
i 3.766121 129.2688 0.7171673 53 71.69727 0 0.1 0 0 0 1 
i 4.072848 129.2688 0.7171673 50 72.20042 0 0.1 0 0 0 1 
i 4.502266 129.2688 1.434335 58 72.90482 0 0.1 0 0 0 1 
i 7.134542 129.2688 1.434335 60 70.48973 0 0.1 0 0 0 1 
i 7.379923 129.2688 0.7171673 55 70.89224 0 0.1 0 0 0 1 
i 7.68665 129.2688 0.7171673 52 71.39539 0 0.1 0 0 0 1 
i 7.870687 129.2688 1.434335 65 71.69727 0 0.1 0 0 0 1 
i 8.177414 129.2688 0.7171673 61 72.20042 0 0.1 0 0 0 1 
i 8.422795 129.2688 0.7171673 66 72.60294 0 0.1 0 0 0 1 
i 8.606832 129.2688 0.7171673 69 72.90482 0 0.1 0 0 0 1 
i 1.981527 129.3717 0.5378755 59 71.706 0 0.1 0 0 0 1 
i 6.086093 129.3717 0.5378755 70 71.706 0 0.1 0 0 0 1 
i 2.845939 129.5865 0.5378755 53 70.20528 0 0.1 0 0 0 1 
i 2.907285 129.5865 0.5378755 55 70.30591 0 0.1 0 0 0 1 
i 6.950505 129.5865 0.5378755 64 70.20528 0 0.1 0 0 0 1 
i 7.011851 129.5865 0.5378755 66 70.30591 0 0.1 0 0 0 1 
i 6.599163 129.7293 0.7171673 71 78.9969 0 0.1 0 0 0 1 
i 7.335308 129.7293 0.7171673 82 80.20444 0 0.1 0 0 0 1 
i 10.70373 129.7293 0.7171673 82 78.9969 0 0.1 0 0 0 1 
i 11.43987 129.7293 0.7171673 94 80.20444 0 0.1 0 0 0 1 
i 1 129.9096 0.5378755 51 70.09593 0 0.1 0 0 0 1 
i 5.104566 129.9096 0.5378755 63 70.09593 0 0.1 0 0 0 1 
i 2.784594 129.986 0.7171673 46 70.08721 0 0.1 0 0 0 1 
i 3.091321 129.986 0.7171673 49 70.59036 0 0.1 0 0 0 1 
i 3.520739 129.986 1.43034 41 71.29476 0 0.1 0 0 0 1 
i 3.827466 129.986 0.7171673 54 71.7979 0 0.1 0 0 0 1 
i 4.011502 129.986 0.7171673 51 72.09979 0 0.1 0 0 0 1 
i 7.441269 129.986 0.7171673 56 70.99287 0 0.1 0 0 0 1 
i 7.625305 129.986 0.7171673 53 71.29476 0 0.1 0 0 0 1 
i 8.116068 129.986 0.7171673 62 72.09979 0 0.1 0 0 0 1 
i 8.36145 129.986 0.7171673 67 72.50231 0 0.1 0 0 0 1 
i 8.668177 129.986 0.7171673 70 73.00545 0 0.1 0 0 0 1 
i 2.784594 130.1243 0.5378755 54 70.10465 0 0.1 0 0 0 1 
i 2.96863 130.1243 0.5378755 56 70.40654 0 0.1 0 0 0 1 
i 6.88916 130.1243 0.5378755 65 70.10465 0 0.1 0 0 0 1 
i 7.073196 130.1243 0.5378755 67 70.40654 0 0.1 0 0 0 1 
i 5.059951 130.2462 0.5378755 87 79.40746 0 0.1 0 0 0 1 
i 9.164517 130.2462 0.5378755 99 79.40746 0 0.1 0 0 0 1 
i 6.353782 130.4465 1.402355 74 78.59438 0 0.1 0 0 0 1 
i 7.58069 130.4465 0.7171673 85 80.60696 0 0.1 0 0 0 1 
i 10.45835 130.4465 0.7171673 85 78.59438 0 0.1 0 0 0 1 
i 11.68526 130.4465 0.7171673 97 80.60696 0 0.1 0 0 0 1 
i 2.907285 130.6992 0.7171673 45 70.2878 0 0.1 0 0 0 1 
i 3.029976 130.6992 0.7171673 48 70.48906 0 0.1 0 0 0 1 
i 3.275357 130.6992 0.7171673 43 70.89157 0 0.1 0 0 0 1 
i 3.766121 130.6992 0.7171673 52 71.6966 0 0.1 0 0 0 1 
i 4.134193 130.6992 0.7171673 50 72.30038 0 0.1 0 0 0 1 
i 4.502266 130.6992 0.7171673 57 72.90415 0 0.1 0 0 0 1 
i 7.134542 130.6992 0.7171673 59 70.48906 0 0.1 0 0 0 1 
i 7.379923 130.6992 0.7171673 54 70.89157 0 0.1 0 0 0 1 
i 7.747996 130.6992 0.7171673 52 71.49535 0 0.1 0 0 0 1 
i 7.870687 130.6992 0.7171673 64 71.6966 0 0.1 0 0 0 1 
i 8.238759 130.6992 0.7171673 61 72.30038 0 0.1 0 0 0 1 
i 8.484141 130.6992 0.7171673 66 72.70289 0 0.1 0 0 0 1 
i 8.606832 130.6992 0.7171673 68 72.90415 0 0.1 0 0 0 1 
i 4.569188 130.7841 0.5378755 83 78.60243 0 0.1 0 0 0 1 
i 8.673754 130.7841 0.5378755 95 78.60243 0 0.1 0 0 0 1 
i 1.061345 130.9111 0.5378755 50 70.19589 0 0.1 0 0 0 1 
i 1.981527 130.9111 1.075751 60 71.70532 0 0.1 0 0 0 1 
i 5.165911 130.9111 1.075751 62 70.19589 0 0.1 0 0 0 1 
i 6.086093 130.9111 0.5378755 71 71.70532 0 0.1 0 0 0 1 
i 6.599163 131.1317 0.7171673 71 78.99623 0 0.1 0 0 0 1 
i 7.335308 131.1317 0.7171673 83 80.20377 0 0.1 0 0 0 1 
i 7.642036 131.1317 0.7171673 86 80.70692 0 0.1 0 0 0 1 
i 10.51969 131.1317 0.7171673 85 78.69434 0 0.1 0 0 0 1 
i 10.70373 131.1317 0.7171673 82 78.99623 0 0.1 0 0 0 1 
i 11.43987 131.1317 0.7171673 94 80.20377 0 0.1 0 0 0 1 
i 11.7466 131.1317 0.7171673 98 80.70692 0 0.1 0 0 0 1 
i 3.029976 131.3587 0.5378755 36 70.5065 0 0.1 0 0 0 1 
i 7.134542 131.3587 0.5378755 47 70.5065 0 0.1 0 0 0 1 
i 2.784594 131.4164 2.046962 47 70.08654 0 0.1 0 0 0 1 
i 3.152666 131.4164 2.046962 49 70.69031 0 0.1 0 0 0 1 
i 3.398048 131.4164 2.046962 44 71.09283 0 0.1 0 0 0 1 
i 3.520739 131.4164 1.329795 42 71.29409 0 0.1 0 0 0 1 
i 3.888811 131.4164 2.046962 54 71.89786 0 0.1 0 0 0 1 
i 4.011502 131.4164 0.7171673 51 72.09912 0 0.1 0 0 0 1 
i 4.256884 131.4164 2.046962 56 72.50164 0 0.1 0 0 0 1 
i 4.624956 131.4164 0.7171673 58 73.10541 0 0.1 0 0 0 1 
i 6.88916 131.4164 2.046962 58 70.08654 0 0.1 0 0 0 1 
i 7.257232 131.4164 0.7171673 60 70.69031 0 0.1 0 0 0 1 
i 7.502614 131.4164 1.329795 56 71.09283 0 0.1 0 0 0 1 
i 7.625305 131.4164 0.7171673 53 71.29409 0 0.1 0 0 0 1 
i 7.993377 131.4164 2.046962 65 71.89786 0 0.1 0 0 0 1 
i 8.116068 131.4164 1.329795 63 72.09912 0 0.1 0 0 0 1 
i 8.36145 131.4164 1.329795 68 72.50164 0 0.1 0 0 0 1 
i 8.729522 131.4164 1.329795 70 73.10541 0 0.1 0 0 0 1 
i 1 131.449 0.5378755 51 70.09526 0 0.1 0 0 0 1 
i 6.147438 131.449 0.5378755 72 71.80595 0 0.1 0 0 0 1 
i 4.630533 131.7187 1.075751 83 78.70239 0 0.1 0 0 0 1 
i 5.059951 131.7187 0.5378755 88 79.40679 0 0.1 0 0 0 1 
i 8.735099 131.7187 0.5378755 94 78.70239 0 0.1 0 0 0 1 
i 9.164517 131.7187 1.075751 100 79.40679 0 0.1 0 0 0 1 
i 6.353782 131.8489 0.7171673 73 78.59371 0 0.1 0 0 0 1 
i 6.660509 131.8489 0.7171673 70 79.09686 0 0.1 0 0 0 1 
i 7.396654 131.8489 0.7171673 82 80.3044 0 0.1 0 0 0 1 
i 7.58069 131.8489 0.7171673 85 80.60629 0 0.1 0 0 0 1 
i 10.45835 131.8489 0.7171673 85 78.59371 0 0.1 0 0 0 1 
i 10.76507 131.8489 0.7171673 81 79.09686 0 0.1 0 0 0 1 
i 11.50122 131.8489 0.7171673 94 80.3044 0 0.1 0 0 0 1 
i 11.68526 131.8489 0.7171673 97 80.60629 0 0.1 0 0 0 1 
i 2.784594 131.8965 0.5378755 41 70.10398 0 0.1 0 0 0 1 
i 6.88916 131.8965 0.5378755 52 70.10398 0 0.1 0 0 0 1 
i 2.907285 132.029 1.434335 46 70.28713 0 0.1 0 0 0 1 
i 3.029976 132.029 0.7171673 48 70.48839 0 0.1 0 0 0 1 
i 3.275357 132.029 1.434335 43 70.8909 0 0.1 0 0 0 1 
i 3.64343 132.029 1.434335 41 71.49468 0 0.1 0 0 0 1 
i 3.766121 132.029 1.434335 53 71.69593 0 0.1 0 0 0 1 
i 4.072848 132.029 1.434335 52 72.19908 0 0.1 0 0 0 1 
i 4.134193 132.029 1.434335 50 72.29971 0 0.1 0 0 0 1 
i 4.379575 132.029 0.7171673 55 72.70222 0 0.1 0 0 0 1 
i 4.502266 132.029 1.434335 57 72.90348 0 0.1 0 0 0 1 
i 4.686302 132.029 0.7171673 59 73.20537 0 0.1 0 0 0 1 
i 7.011851 132.029 1.434335 57 70.28713 0 0.1 0 0 0 1 
i 7.134542 132.029 1.434335 59 70.48839 0 0.1 0 0 0 1 
i 7.318578 132.029 0.7171673 61 70.79027 0 0.1 0 0 0 1 
i 7.379923 132.029 0.7171673 55 70.8909 0 0.1 0 0 0 1 
i 7.68665 132.029 0.7171673 54 71.39405 0 0.1 0 0 0 1 
i 7.747996 132.029 1.434335 52 71.49468 0 0.1 0 0 0 1 
i 7.870687 132.029 1.434335 64 71.69593 0 0.1 0 0 0 1 
i 8.238759 132.029 1.434335 62 72.29971 0 0.1 0 0 0 1 
i 8.484141 132.029 1.434335 67 72.70222 0 0.1 0 0 0 1 
i 8.606832 132.029 1.434335 69 72.90348 0 0.1 0 0 0 1 
i 5.121297 132.2566 0.5378755 89 79.50742 0 0.1 0 0 0 1 
i 8.673754 132.2566 0.5378755 95 78.60176 0 0.1 0 0 0 1 
i 1.122691 132.488 0.5378755 49 70.29585 0 0.1 0 0 0 1 
i 1.981527 132.488 0.5378755 60 71.70465 0 0.1 0 0 0 1 
i 5.227257 132.488 0.5378755 61 70.29585 0 0.1 0 0 0 1 
i 6.086093 132.488 0.5378755 71 71.70465 0 0.1 0 0 0 1 
i 6.476473 132.5683 0.7171673 73 78.7943 0 0.1 0 0 0 1 
i 6.599163 132.5683 0.7171673 71 78.99556 0 0.1 0 0 0 1 
i 7.335308 132.5683 0.7171673 84 80.2031 0 0.1 0 0 0 1 
i 7.703381 132.5683 0.7171673 86 80.80688 0 0.1 0 0 0 1 
i 10.58104 132.5683 0.7171673 85 78.7943 0 0.1 0 0 0 1 
i 10.70373 132.5683 0.7171673 82 78.99556 0 0.1 0 0 0 1 
i 11.43987 132.5683 0.7171673 96 80.2031 0 0.1 0 0 0 1 
i 11.80795 132.5683 0.7171673 98 80.80688 0 0.1 0 0 0 1 
i 2.96863 132.7461 0.7171673 45 70.38776 0 0.1 0 0 0 1 
i 3.704775 132.7461 0.7171673 40 71.5953 0 0.1 0 0 0 1 
i 4.011502 132.7461 0.7171673 51 72.09845 0 0.1 0 0 0 1 
i 4.624956 132.7461 0.7171673 58 73.10474 0 0.1 0 0 0 1 
i 7.257232 132.7461 0.7171673 60 70.68964 0 0.1 0 0 0 1 
i 7.441269 132.7461 0.7171673 54 70.99153 0 0.1 0 0 0 1 
i 7.502614 132.7461 0.7171673 55 71.09216 0 0.1 0 0 0 1 
i 7.625305 132.7461 0.7171673 53 71.29342 0 0.1 0 0 0 1 
i 8.300105 132.7461 0.7171673 61 72.40034 0 0.1 0 0 0 1 
i 8.545486 132.7461 0.7171673 66 72.80285 0 0.1 0 0 0 1 
i 8.668177 132.7461 0.7171673 68 73.00411 0 0.1 0 0 0 1 
i 2.845939 132.8981 0.5378755 52 70.20394 0 0.1 0 0 0 1 
i 3.029976 132.8981 0.5378755 58 70.50583 0 0.1 0 0 0 1 
i 6.950505 132.8981 0.5378755 64 70.20394 0 0.1 0 0 0 1 
i 7.134542 132.8981 0.5378755 69 70.50583 0 0.1 0 0 0 1 
i 1 133.0259 0.5378755 51 70.09459 0 0.1 0 0 0 1 
i 2.104217 133.0259 0.5378755 61 71.90591 0 0.1 0 0 0 1 
i 5.104566 133.0259 0.5378755 62 70.09459 0 0.1 0 0 0 1 
i 6.208784 133.0259 2.312248 72 71.90591 0 0.1 0 0 0 1 
i 4.691879 133.2271 0.5378755 83 78.80235 0 0.1 0 0 0 1 
i 5.059951 133.2271 0.5378755 88 79.40612 0 0.1 0 0 0 1 
i 8.796445 133.2271 0.5378755 94 78.80235 0 0.1 0 0 0 1 
i 9.164517 133.2271 0.5378755 100 79.40612 0 0.1 0 0 0 1 
i 6.721854 133.2854 2.052744 70 79.19681 0 0.1 0 0 0 1 
i 7.457999 133.2854 0.7171673 83 80.40436 0 0.1 0 0 0 1 
i 7.58069 133.2854 1.335576 85 80.60562 0 0.1 0 0 0 1 
i 10.45835 133.2854 0.7171673 83 78.59304 0 0.1 0 0 0 1 
i 10.82642 133.2854 2.052744 81 79.19681 0 0.1 0 0 0 1 
i 11.56257 133.2854 1.335576 94 80.40436 0 0.1 0 0 0 1 
i 11.68526 133.2854 2.052744 97 80.60562 0 0.1 0 0 0 1 
i 2.784594 133.4359 0.5378755 53 70.10331 0 0.1 0 0 0 1 
i 3.091321 133.4359 0.5378755 59 70.60646 0 0.1 0 0 0 1 
i 6.88916 133.4359 0.5378755 65 70.10331 0 0.1 0 0 0 1 
i 4.569188 133.765 0.5378755 84 78.60109 0 0.1 0 0 0 1 
i 5.182642 133.765 0.5378755 89 79.60738 0 0.1 0 0 0 1 
i 8.673754 133.765 0.5378755 96 78.60109 0 0.1 0 0 0 1 
i 9.287208 133.765 0.5378755 101 79.60738 0 0.1 0 0 0 1 
i 6.415127 133.9038 0.7171673 71 78.693 0 0.1 0 0 0 1 
i 6.476473 133.9038 1.12606 73 78.79363 0 0.1 0 0 0 1 
i 6.7832 133.9038 0.7171673 69 79.29677 0 0.1 0 0 0 1 
i 7.335308 133.9038 0.7171673 84 80.20243 0 0.1 0 0 0 1 
i 7.519345 133.9038 0.7171673 83 80.50432 0 0.1 0 0 0 1 
i 7.703381 133.9038 1.434335 86 80.80621 0 0.1 0 0 0 1 
i 10.51969 133.9038 0.7171673 83 78.693 0 0.1 0 0 0 1 
i 10.58104 133.9038 0.7171673 84 78.79363 0 0.1 0 0 0 1 
i 10.70373 133.9038 1.434335 82 78.99488 0 0.1 0 0 0 1 
i 11.43987 133.9038 0.7171673 96 80.20243 0 0.1 0 0 0 1 
i 11.80795 133.9038 1.434335 98 80.80621 0 0.1 0 0 0 1 
i 1.061345 133.9541 1.075751 50 70.19455 0 0.1 0 0 0 1 
i 1.122691 133.9541 1.075751 49 70.29518 0 0.1 0 0 0 1 
i 1.981527 133.9541 1.075751 61 71.70398 0 0.1 0 0 0 1 
i 2.165563 133.9541 0.5378755 62 72.00587 0 0.1 0 0 0 1 
i 5.165911 133.9541 0.5378755 62 70.19455 0 0.1 0 0 0 1 
i 5.227257 133.9541 1.075751 61 70.29518 0 0.1 0 0 0 1 
i 2.907285 134.475 1.075751 45 70.3039 0 0.1 0 0 0 1 
i 7.011851 134.475 0.5378755 57 70.3039 0 0.1 0 0 0 1 
i 7.134542 134.475 1.075751 56 70.50516 0 0.1 0 0 0 1 
i 2.042872 134.492 0.5378755 60 71.80461 0 0.1 0 0 0 1 
i 5.288602 134.492 0.5378755 60 70.39581 0 0.1 0 0 0 1 
i 6.537818 134.621 0.7171673 73 78.89426 0 0.1 0 0 0 1 
i 6.660509 134.621 0.7171673 71 79.09551 0 0.1 0 0 0 1 
i 7.396654 134.621 0.7171673 85 80.30306 0 0.1 0 0 0 1 
i 7.457999 134.621 0.7171673 83 80.40369 0 0.1 0 0 0 1 
i 7.764726 134.621 0.7171673 87 80.90683 0 0.1 0 0 0 1 
i 10.45835 134.621 0.7171673 83 78.59237 0 0.1 0 0 0 1 
i 10.64238 134.621 0.7171673 85 78.89426 0 0.1 0 0 0 1 
i 11.50122 134.621 0.7171673 96 80.30306 0 0.1 0 0 0 1 
i 11.56257 134.621 0.7171673 95 80.40369 0 0.1 0 0 0 1 
i 4.630533 134.6294 1.075751 84 78.70105 0 0.1 0 0 0 1 
i 4.691879 134.6294 1.075751 83 78.80168 0 0.1 0 0 0 1 
i 5.059951 134.6294 1.075751 89 79.40545 0 0.1 0 0 0 1 
i 5.243987 134.6294 1.075751 90 79.70734 0 0.1 0 0 0 1 
i 8.735099 134.6294 0.5378755 96 78.70105 0 0.1 0 0 0 1 
i 8.796445 134.6294 1.075751 95 78.80168 0 0.1 0 0 0 1 
i 9.164517 134.6294 1.075751 101 79.40545 0 0.1 0 0 0 1 
i 9.348554 134.6294 0.5378755 102 79.70734 0 0.1 0 0 0 1 
i 3.152666 135.0129 0.5378755 44 70.70642 0 0.1 0 0 0 1 
i 8.85779 135.1673 0.5378755 94 78.90231 0 0.1 0 0 0 1 
i 9.225863 135.1673 0.5378755 100 79.50608 0 0.1 0 0 0 1 
i 1.245382 135.6419 0.5378755 49 70.49577 0 0.1 0 0 0 1 
i 1.981527 135.6419 0.5378755 59 71.70331 0 0.1 0 0 0 1 
i 5.349948 135.6419 0.5378755 60 70.49577 0 0.1 0 0 0 1 
i 6.086093 135.6419 0.5378755 71 71.70331 0 0.1 0 0 0 1 
i 6.844545 135.7629 0.7171673 71 79.39673 0 0.1 0 0 0 1 
i 7.335308 135.7629 0.7171673 80 80.20176 0 0.1 0 0 0 1 
i 10.94911 135.7629 0.7171673 82 79.39673 0 0.1 0 0 0 1 
i 11.43987 135.7629 0.7171673 92 80.20176 0 0.1 0 0 0 1 
i 2.845939 135.9411 0.5378755 38 70.2026 0 0.1 0 0 0 1 
i 2.907285 135.9411 0.5378755 40 70.30323 0 0.1 0 0 0 1 
i 3.029976 135.9411 1.075751 37 70.50449 0 0.1 0 0 0 1 
i 3.214012 135.9411 0.5378755 35 70.80637 0 0.1 0 0 0 1 
i 6.950505 135.9411 0.5378755 50 70.2026 0 0.1 0 0 0 1 
i 7.011851 135.9411 1.075751 51 70.30323 0 0.1 0 0 0 1 
i 7.134542 135.9411 0.5378755 48 70.50449 0 0.1 0 0 0 1 
i 7.318578 135.9411 1.075751 47 70.80637 0 0.1 0 0 0 1 
i 1 136.1798 0.5378755 51 70.09325 0 0.1 0 0 0 1 
i 2.226908 136.1798 0.5378755 62 72.10583 0 0.1 0 0 0 1 
i 5.104566 136.1798 0.5378755 63 70.09325 0 0.1 0 0 0 1 
i 6.331474 136.1798 0.5378755 73 72.10583 0 0.1 0 0 0 1 
i 4.81457 136.2439 0.5378755 84 79.00226 0 0.1 0 0 0 1 
i 5.059951 136.2439 0.5378755 88 79.40478 0 0.1 0 0 0 1 
i 8.919136 136.2439 0.5378755 95 79.00226 0 0.1 0 0 0 1 
i 9.164517 136.2439 0.5378755 99 79.40478 0 0.1 0 0 0 1 
i 2.784594 136.479 0.5378755 39 70.10197 0 0.1 0 0 0 1 
i 2.96863 136.479 0.5378755 41 70.40386 0 0.1 0 0 0 1 
i 3.152666 136.479 0.5378755 36 70.70574 0 0.1 0 0 0 1 
i 7.073196 136.479 0.5378755 52 70.40386 0 0.1 0 0 0 1 
i 7.195887 136.479 0.5378755 49 70.60512 0 0.1 0 0 0 1 
i 6.353782 136.4801 0.7171673 76 78.5917 0 0.1 0 0 0 1 
i 7.826072 136.4801 0.7171673 85 81.00679 0 0.1 0 0 0 1 
i 10.45835 136.4801 0.7171673 87 78.5917 0 0.1 0 0 0 1 
i 11.93064 136.4801 0.7171673 96 81.00679 0 0.1 0 0 0 1 
i 4.569188 136.7817 0.5378755 86 78.59975 0 0.1 0 0 0 1 
i 5.305333 136.7817 0.5378755 90 79.8073 0 0.1 0 0 0 1 
i 8.673754 136.7817 0.5378755 97 78.59975 0 0.1 0 0 0 1 
i 9.409899 136.7817 0.5378755 102 79.8073 0 0.1 0 0 0 1 
i 1.061345 137.108 1.075751 51 70.19321 0 0.1 0 0 0 1 
i 1.245382 137.108 1.075751 48 70.49509 0 0.1 0 0 0 1 
i 1.981527 137.108 0.5378755 60 71.70264 0 0.1 0 0 0 1 
i 2.288254 137.108 1.075751 62 72.20579 0 0.1 0 0 0 1 
i 5.165911 137.108 0.5378755 63 70.19321 0 0.1 0 0 0 1 
i 5.349948 137.108 0.5378755 60 70.49509 0 0.1 0 0 0 1 
i 6.086093 137.108 0.5378755 71 71.70264 0 0.1 0 0 0 1 
i 6.39282 137.108 0.5378755 74 72.20579 0 0.1 0 0 0 1 
i 6.415127 137.1653 0.7171673 77 78.69166 0 0.1 0 0 0 1 
i 6.844545 137.1653 0.7171673 71 79.39606 0 0.1 0 0 0 1 
i 7.335308 137.1653 0.7171673 80 80.20109 0 0.1 0 0 0 1 
i 7.887417 137.1653 0.7171673 86 81.10675 0 0.1 0 0 0 1 
i 10.51969 137.1653 0.7171673 88 78.69166 0 0.1 0 0 0 1 
i 10.94911 137.1653 1.434335 82 79.39606 0 0.1 0 0 0 1 
i 11.43987 137.1653 0.7171673 92 80.20109 0 0.1 0 0 0 1 
i 11.99198 137.1653 1.434335 97 81.10675 0 0.1 0 0 0 1 
i 2.042872 137.6459 0.5378755 59 71.80327 0 0.1 0 0 0 1 
i 5.104566 137.6459 0.5378755 62 70.09258 0 0.1 0 0 0 1 
i 5.411293 137.6459 0.5378755 59 70.59572 0 0.1 0 0 0 1 
i 6.147438 137.6459 0.5378755 70 71.80327 0 0.1 0 0 0 1 
i 6.331474 137.6459 0.5378755 73 72.10516 0 0.1 0 0 0 1 
i 4.630533 137.6462 0.5378755 87 78.69971 0 0.1 0 0 0 1 
i 4.81457 137.6462 0.5378755 84 79.00159 0 0.1 0 0 0 1 
i 5.059951 137.6462 1.075751 88 79.40411 0 0.1 0 0 0 1 
i 5.366678 137.6462 0.5378755 91 79.90725 0 0.1 0 0 0 1 
i 8.735099 137.6462 1.075751 98 78.69971 0 0.1 0 0 0 1 
i 8.919136 137.6462 1.075751 95 79.00159 0 0.1 0 0 0 1 
i 9.164517 137.6462 0.5378755 100 79.40411 0 0.1 0 0 0 1 
i 9.471244 137.6462 0.5378755 103 79.90725 0 0.1 0 0 0 1 
i 6.353782 137.8824 0.7171673 76 78.59103 0 0.1 0 0 0 1 
i 6.905891 137.8824 0.7171673 70 79.49669 0 0.1 0 0 0 1 
i 7.396654 137.8824 0.7171673 79 80.30172 0 0.1 0 0 0 1 
i 7.826072 137.8824 0.7171673 85 81.00612 0 0.1 0 0 0 1 
i 10.45835 137.8824 0.7171673 87 78.59103 0 0.1 0 0 0 1 
i 11.50122 137.8824 0.7171673 91 80.30172 0 0.1 0 0 0 1 
i 3.275357 137.9818 0.5378755 58 70.90633 0 0.1 0 0 0 1 
i 7.379923 137.9818 0.5378755 69 70.90633 0 0.1 0 0 0 1 
i 4.569188 138.1841 0.5378755 86 78.59908 0 0.1 0 0 0 1 
i 4.875915 138.1841 0.5378755 83 79.10222 0 0.1 0 0 0 1 
i 5.305333 138.1841 0.5378755 90 79.80662 0 0.1 0 0 0 1 
i 9.225863 138.1841 0.5378755 99 79.50474 0 0.1 0 0 0 1 
i 9.409899 138.1841 0.5378755 102 79.80662 0 0.1 0 0 0 1 
i 2.784594 138.5197 0.5378755 51 70.1013 0 0.1 0 0 0 1 
i 6.88916 138.5197 0.5378755 62 70.1013 0 0.1 0 0 0 1 
i 6.476473 138.6018 0.7171673 77 78.79161 0 0.1 0 0 0 1 
i 6.844545 138.6018 0.7171673 71 79.39539 0 0.1 0 0 0 1 
i 7.335308 138.6018 0.7171673 80 80.20042 0 0.1 0 0 0 1 
i 7.948763 138.6018 0.7171673 86 81.20671 0 0.1 0 0 0 1 
i 10.58104 138.6018 0.7171673 88 78.79161 0 0.1 0 0 0 1 
i 10.94911 138.6018 0.7171673 83 79.39539 0 0.1 0 0 0 1 
i 11.43987 138.6018 0.7171673 92 80.20042 0 0.1 0 0 0 1 
i 12.05333 138.6018 0.7171673 98 81.20671 0 0.1 0 0 0 1 
i 1.122691 138.6099 0.5378755 51 70.29317 0 0.1 0 0 0 1 
i 1.245382 138.6099 0.5378755 49 70.49442 0 0.1 0 0 0 1 
i 1.981527 138.6099 1.075751 61 71.70197 0 0.1 0 0 0 1 
i 2.349599 138.6099 0.5378755 63 72.30574 0 0.1 0 0 0 1 
i 5.227257 138.6099 0.5378755 62 70.29317 0 0.1 0 0 0 1 
i 5.349948 138.6099 0.5378755 60 70.49442 0 0.1 0 0 0 1 
i 6.086093 138.6099 0.5378755 72 71.70197 0 0.1 0 0 0 1 
i 6.454165 138.6099 0.5378755 74 72.30574 0 0.1 0 0 0 1 
i 6.353782 139.0576 0.5378755 78 78.6078 0 0.1 0 0 0 1 
i 10.45835 139.0576 0.5378755 89 78.6078 0 0.1 0 0 0 1 
i 4.691879 139.0828 0.5378755 87 78.79966 0 0.1 0 0 0 1 
i 4.81457 139.0828 0.5378755 85 79.00092 0 0.1 0 0 0 1 
i 5.059951 139.0828 0.5378755 89 79.40344 0 0.1 0 0 0 1 
i 5.428024 139.0828 0.5378755 91 80.00721 0 0.1 0 0 0 1 
i 8.796445 139.0828 1.075751 99 78.79966 0 0.1 0 0 0 1 
i 8.919136 139.0828 0.5378755 96 79.00092 0 0.1 0 0 0 1 
i 9.164517 139.0828 0.5378755 101 79.40344 0 0.1 0 0 0 1 
i 9.53259 139.0828 0.5378755 103 80.00721 0 0.1 0 0 0 1 
i 1 139.1478 0.5378755 50 70.09191 0 0.1 0 0 0 1 
i 1.368072 139.1478 0.5378755 47 70.69568 0 0.1 0 0 0 1 
i 2.104217 139.1478 0.5378755 59 71.90323 0 0.1 0 0 0 1 
i 5.104566 139.1478 0.5378755 61 70.09191 0 0.1 0 0 0 1 
i 5.472639 139.1478 0.5378755 59 70.69568 0 0.1 0 0 0 1 
i 6.208784 139.1478 0.5378755 71 71.90323 0 0.1 0 0 0 1 
i 6.331474 139.1478 0.5378755 73 72.10449 0 0.1 0 0 0 1 
i 6.353782 139.319 2.052744 76 78.59036 0 0.1 0 0 0 1 
i 6.967236 139.319 2.317095 70 79.59665 0 0.1 0 0 0 1 
i 7.457999 139.319 0.7171673 79 80.40168 0 0.1 0 0 0 1 
i 7.826072 139.319 1.335576 85 81.00545 0 0.1 0 0 0 1 
i 10.45835 139.319 0.7171673 87 78.59036 0 0.1 0 0 0 1 
i 11.0718 139.319 2.052744 81 79.59665 0 0.1 0 0 0 1 
i 11.56257 139.319 0.7171673 91 80.40168 0 0.1 0 0 0 1 
i 11.93064 139.319 0.7171673 96 81.00545 0 0.1 0 0 0 1 
i 2.845939 139.5212 0.5378755 43 70.20126 0 0.1 0 0 0 1 
i 3.275357 139.5212 0.5378755 31 70.90566 0 0.1 0 0 0 1 
i 6.950505 139.5212 0.5378755 54 70.20126 0 0.1 0 0 0 1 
i 7.379923 139.5212 0.5378755 42 70.90566 0 0.1 0 0 0 1 
i 4.569188 139.6207 0.5378755 86 78.59841 0 0.1 0 0 0 1 
i 4.93726 139.6207 0.5378755 84 79.20218 0 0.1 0 0 0 1 
i 5.182642 139.6207 0.5378755 88 79.6047 0 0.1 0 0 0 1 
i 5.305333 139.6207 0.5378755 90 79.80595 0 0.1 0 0 0 1 
i 8.673754 139.6207 0.5378755 97 78.59841 0 0.1 0 0 0 1 
i 9.041826 139.6207 0.5378755 95 79.20218 0 0.1 0 0 0 1 
i 9.409899 139.6207 0.5378755 102 79.80595 0 0.1 0 0 0 1 
i 6.476473 139.9374 0.7171673 77 78.79094 0 0.1 0 0 0 1 
i 7.028581 139.9374 0.7171673 69 79.6966 0 0.1 0 0 0 1 
i 7.335308 139.9374 1.434335 80 80.19975 0 0.1 0 0 0 1 
i 7.519345 139.9374 0.7171673 78 80.50164 0 0.1 0 0 0 1 
i 7.948763 139.9374 1.434335 86 81.20604 0 0.1 0 0 0 1 
i 10.51969 139.9374 0.7171673 87 78.69031 0 0.1 0 0 0 1 
i 10.58104 139.9374 0.7171673 88 78.79094 0 0.1 0 0 0 1 
i 10.94911 139.9374 1.434335 82 79.39472 0 0.1 0 0 0 1 
i 11.43987 139.9374 0.7171673 91 80.19975 0 0.1 0 0 0 1 
i 11.62391 139.9374 0.7171673 90 80.50164 0 0.1 0 0 0 1 
i 11.99198 139.9374 1.434335 97 81.10541 0 0.1 0 0 0 1 
i 12.05333 139.9374 1.434335 98 81.20604 0 0.1 0 0 0 1 
i 1.061345 140.0062 1.075751 49 70.19187 0 0.1 0 0 0 1 
i 1.122691 140.0062 1.075751 50 70.29249 0 0.1 0 0 0 1 
i 1.245382 140.0062 0.5378755 48 70.49375 0 0.1 0 0 0 1 
i 1.429418 140.0062 1.075751 47 70.79564 0 0.1 0 0 0 1 
i 1.981527 140.0062 1.075751 61 71.7013 0 0.1 0 0 0 1 
i 2.165563 140.0062 1.075751 60 72.00319 0 0.1 0 0 0 1 
i 2.288254 140.0062 1.075751 62 72.20444 0 0.1 0 0 0 1 
i 2.349599 140.0062 1.075751 63 72.30507 0 0.1 0 0 0 1 
i 5.165911 140.0062 1.075751 61 70.19187 0 0.1 0 0 0 1 
i 5.227257 140.0062 1.075751 62 70.29249 0 0.1 0 0 0 1 
i 5.349948 140.0062 1.075751 60 70.49375 0 0.1 0 0 0 1 
i 5.533984 140.0062 0.5378755 58 70.79564 0 0.1 0 0 0 1 
i 6.086093 140.0062 1.075751 72 71.7013 0 0.1 0 0 0 1 
i 6.270129 140.0062 0.5378755 71 72.00319 0 0.1 0 0 0 1 
i 6.39282 140.0062 1.135392 73 72.20444 0 0.1 0 0 0 1 
i 6.454165 140.0062 1.075751 74 72.30507 0 0.1 0 0 0 1 
i 2.784594 140.0591 0.5378755 41 70.10063 0 0.1 0 0 0 1 
i 3.336703 140.0591 0.5378755 30 71.00629 0 0.1 0 0 0 1 
i 6.88916 140.0591 0.5378755 53 70.10063 0 0.1 0 0 0 1 
i 7.441269 140.0591 0.5378755 41 71.00629 0 0.1 0 0 0 1 
i 10.51969 140.0658 0.5378755 84 78.70776 0 0.1 0 0 0 1 
i 4.630533 140.4184 1.075751 86 78.69836 0 0.1 0 0 0 1 
i 4.691879 140.4184 0.5378755 87 78.79899 0 0.1 0 0 0 1 
i 4.81457 140.4184 1.075751 85 79.00025 0 0.1 0 0 0 1 
i 4.998606 140.4184 1.075751 84 79.30214 0 0.1 0 0 0 1 
i 5.059951 140.4184 1.075751 89 79.40277 0 0.1 0 0 0 1 
i 5.243987 140.4184 1.075751 88 79.70465 0 0.1 0 0 0 1 
i 5.366678 140.4184 1.075751 90 79.90591 0 0.1 0 0 0 1 
i 5.428024 140.4184 1.075751 91 80.00654 0 0.1 0 0 0 1 
i 8.735099 140.4184 1.075751 97 78.69836 0 0.1 0 0 0 1 
i 8.796445 140.4184 1.075751 99 78.79899 0 0.1 0 0 0 1 
i 8.919136 140.4184 1.075751 96 79.00025 0 0.1 0 0 0 1 
i 9.103172 140.4184 0.5378755 95 79.30214 0 0.1 0 0 0 1 
i 9.164517 140.4184 1.075751 101 79.40277 0 0.1 0 0 0 1 
i 9.348554 140.4184 1.075751 100 79.70465 0 0.1 0 0 0 1 
i 9.471244 140.4184 1.075751 102 79.90591 0 0.1 0 0 0 1 
i 9.53259 140.4184 1.075751 103 80.00654 0 0.1 0 0 0 1 
i 1.184036 140.5441 0.5378755 51 70.39312 0 0.1 0 0 0 1 
i 5.472639 140.5441 0.5378755 59 70.69501 0 0.1 0 0 0 1 
i 6.515511 140.5441 0.5378755 75 72.4057 0 0.1 0 0 0 1 
i 10.45835 140.6037 0.5378755 85 78.60713 0 0.1 0 0 0 1 
i 6.537818 140.6546 0.7171673 78 78.89157 0 0.1 0 0 0 1 
i 6.905891 140.6546 0.7171673 71 79.49535 0 0.1 0 0 0 1 
i 7.457999 140.6546 0.7171673 79 80.40101 0 0.1 0 0 0 1 
i 8.010108 140.6546 0.7171673 87 81.30667 0 0.1 0 0 0 1 
i 10.45835 140.6546 0.7171673 88 78.58969 0 0.1 0 0 0 1 
i 10.64238 140.6546 0.7171673 89 78.89157 0 0.1 0 0 0 1 
i 11.50122 140.6546 0.7171673 92 80.30038 0 0.1 0 0 0 1 
i 11.56257 140.6546 0.7171673 91 80.40101 0 0.1 0 0 0 1 
i 5.489369 140.9562 0.5378755 92 80.10717 0 0.1 0 0 0 1 
i 8.673754 140.9562 0.5378755 98 78.59774 0 0.1 0 0 0 1 
i 2.907285 141.0982 0.5378755 50 70.30122 0 0.1 0 0 0 1 
i 3.275357 141.0982 0.5378755 58 70.90499 0 0.1 0 0 0 1 
i 7.011851 141.0982 0.5378755 61 70.30122 0 0.1 0 0 0 1 
i 6.599163 141.4749 0.7171673 77 78.99153 0 0.1 0 0 0 1 
i 6.844545 141.4749 0.7171673 72 79.39405 0 0.1 0 0 0 1 
i 7.335308 141.4749 0.7171673 82 80.19908 0 0.1 0 0 0 1 
i 8.071453 141.4749 0.7171673 86 81.40662 0 0.1 0 0 0 1 
i 10.70373 141.4749 0.7171673 88 78.99153 0 0.1 0 0 0 1 
i 10.94911 141.4749 0.7171673 84 79.39405 0 0.1 0 0 0 1 
i 11.43987 141.4749 0.7171673 93 80.19908 0 0.1 0 0 0 1 
i 12.17602 141.4749 0.7171673 98 81.40662 0 0.1 0 0 0 1 
i 2.784594 141.6361 0.5378755 52 70.09996 0 0.1 0 0 0 1 
i 3.398048 141.6361 0.5378755 60 71.10625 0 0.1 0 0 0 1 
i 6.88916 141.6361 0.5378755 63 70.09996 0 0.1 0 0 0 1 
i 7.502614 141.6361 0.5378755 72 71.10625 0 0.1 0 0 0 1 
i 6.476473 141.6496 1.075751 75 78.80771 0 0.1 0 0 0 1 
i 10.58104 141.6496 0.5378755 86 78.80771 0 0.1 0 0 0 1 
i 1.490763 141.9498 0.5378755 49 70.8956 0 0.1 0 0 0 1 
i 1.981527 141.9498 0.5378755 57 71.70063 0 0.1 0 0 0 1 
i 5.595329 141.9498 0.5378755 60 70.8956 0 0.1 0 0 0 1 
i 6.086093 141.9498 0.5378755 69 71.70063 0 0.1 0 0 0 1 
i 10.45835 142.1875 0.5378755 87 78.60646 0 0.1 0 0 0 1 
i 6.353782 142.1921 2.703728 74 78.58901 0 0.1 0 0 0 1 
i 7.089927 142.1921 0.7171673 70 79.79656 0 0.1 0 0 0 1 
i 7.58069 142.1921 0.7171673 79 80.60159 0 0.1 0 0 0 1 
i 7.826072 142.1921 0.7171673 84 81.00411 0 0.1 0 0 0 1 
i 10.45835 142.1921 0.7171673 86 78.58901 0 0.1 0 0 0 1 
i 11.19449 142.1921 2.703728 81 79.79656 0 0.1 0 0 0 1 
i 11.68526 142.1921 0.7171673 91 80.60159 0 0.1 0 0 0 1 
i 11.93064 142.1921 2.703728 95 81.00411 0 0.1 0 0 0 1 
i 1 142.4876 0.5378755 53 70.09057 0 0.1 0 0 0 1 
i 2.47229 142.4876 0.5378755 61 72.50566 0 0.1 0 0 0 1 
i 5.104566 142.4876 0.5378755 64 70.09057 0 0.1 0 0 0 1 
i 6.576856 142.4876 0.5378755 73 72.50566 0 0.1 0 0 0 1 
i 2.845939 142.5643 1.075751 48 70.19992 0 0.1 0 0 0 1 
i 3.275357 142.5643 1.075751 50 70.90432 0 0.1 0 0 0 1 
i 6.950505 142.5643 0.5378755 60 70.19992 0 0.1 0 0 0 1 
i 7.011851 142.5643 1.075751 59 70.30055 0 0.1 0 0 0 1 
i 7.379923 142.5643 0.5378755 62 70.90432 0 0.1 0 0 0 1 
i 7.56396 142.5643 1.075751 62 71.20621 0 0.1 0 0 0 1 
i 6.599163 142.8105 0.7171673 77 78.99086 0 0.1 0 0 0 1 
i 6.844545 142.8105 0.7171673 72 79.39338 0 0.1 0 0 0 1 
i 7.151272 142.8105 0.7171673 69 79.89652 0 0.1 0 0 0 1 
i 7.335308 142.8105 1.434335 82 80.19841 0 0.1 0 0 0 1 
i 7.642036 142.8105 0.7171673 78 80.70155 0 0.1 0 0 0 1 
i 7.887417 142.8105 0.7171673 83 81.10407 0 0.1 0 0 0 1 
i 8.071453 142.8105 0.7171673 86 81.40595 0 0.1 0 0 0 1 
i 10.51969 142.8105 0.7171673 85 78.68897 0 0.1 0 0 0 1 
i 10.70373 142.8105 0.7171673 88 78.99086 0 0.1 0 0 0 1 
i 10.94911 142.8105 1.434335 84 79.39338 0 0.1 0 0 0 1 
i 11.43987 142.8105 0.8494806 93 80.19841 0 0.1 0 0 0 1 
i 11.7466 142.8105 0.7171673 90 80.70155 0 0.1 0 0 0 1 
i 12.17602 142.8105 1.434335 98 81.40595 0 0.1 0 0 0 1 
i 5.550715 142.9167 0.5378755 87 80.20713 0 0.1 0 0 0 1 
i 9.655281 142.9167 0.5378755 99 80.20713 0 0.1 0 0 0 1 
i 7.441269 143.1022 0.5378755 61 71.00495 0 0.1 0 0 0 1 
i 6.415127 143.1221 0.5378755 81 78.70642 0 0.1 0 0 0 1 
i 6.476473 143.1221 0.5378755 83 78.80704 0 0.1 0 0 0 1 
i 10.58104 143.1221 0.5378755 95 78.80704 0 0.1 0 0 0 1 
i 1.061345 143.4158 0.5378755 54 70.19052 0 0.1 0 0 0 1 
i 1.490763 143.4158 0.5378755 48 70.89493 0 0.1 0 0 0 1 
i 1.981527 143.4158 0.5378755 57 71.69996 0 0.1 0 0 0 1 
i 2.533635 143.4158 0.5378755 62 72.60562 0 0.1 0 0 0 1 
i 5.165911 143.4158 1.075751 65 70.19052 0 0.1 0 0 0 1 
i 5.595329 143.4158 0.5378755 60 70.89493 0 0.1 0 0 0 1 
i 6.086093 143.4158 1.075751 68 71.69996 0 0.1 0 0 0 1 
i 6.638201 143.4158 0.5378755 74 72.60562 0 0.1 0 0 0 1 
i 4.569188 143.4546 0.5378755 80 78.59706 0 0.1 0 0 0 1 
i 8.673754 143.4546 0.5378755 91 78.59706 0 0.1 0 0 0 1 
i 6.660509 143.5277 0.7171673 78 79.09149 0 0.1 0 0 0 1 
i 6.905891 143.5277 0.9639273 73 79.494 0 0.1 0 0 0 1 
i 7.089927 143.5277 0.7171673 70 79.79589 0 0.1 0 0 0 1 
i 7.58069 143.5277 0.7171673 79 80.60092 0 0.1 0 0 0 1 
i 7.826072 143.5277 0.7171673 84 81.00344 0 0.1 0 0 0 1 
i 8.132799 143.5277 0.7171673 87 81.50658 0 0.1 0 0 0 1 
i 10.45835 143.5277 0.7171673 86 78.58834 0 0.1 0 0 0 1 
i 10.76507 143.5277 0.7171673 89 79.09149 0 0.1 0 0 0 1 
i 11.50122 143.5277 0.7171673 94 80.29904 0 0.1 0 0 0 1 
i 11.68526 143.5277 0.7171673 91 80.60092 0 0.1 0 0 0 1 
i 6.353782 143.66 0.5378755 82 78.60579 0 0.1 0 0 0 1 
i 6.537818 143.66 0.5378755 84 78.90767 0 0.1 0 0 0 1 
i 10.45835 143.66 0.5378755 94 78.60579 0 0.1 0 0 0 1 
i 10.64238 143.66 0.5378755 96 78.90767 0 0.1 0 0 0 1 
i 1 143.9537 0.5378755 53 70.0899 0 0.1 0 0 0 1 
i 1.552109 143.9537 0.5378755 48 70.99556 0 0.1 0 0 0 1 
i 2.042872 143.9537 0.5378755 56 71.80059 0 0.1 0 0 0 1 
i 2.47229 143.9537 0.5378755 62 72.50499 0 0.1 0 0 0 1 
i 5.656675 143.9537 0.5378755 59 70.99556 0 0.1 0 0 0 1 
i 6.599163 144.1787 0.7171673 76 78.99019 0 0.1 0 0 0 1 
i 6.844545 144.1787 0.7171673 71 79.3927 0 0.1 0 0 0 1 
i 7.212618 144.1787 0.7171673 69 79.99648 0 0.1 0 0 0 1 
i 7.335308 144.1787 0.7171673 81 80.19774 0 0.1 0 0 0 1 
i 7.703381 144.1787 0.7171673 78 80.80151 0 0.1 0 0 0 1 
i 7.948763 144.1787 0.7171673 83 81.20403 0 0.1 0 0 0 1 
i 8.071453 144.1787 0.7171673 86 81.40528 0 0.1 0 0 0 1 
i 10.58104 144.1787 0.7171673 85 78.78893 0 0.1 0 0 0 1 
i 10.70373 144.1787 0.7171673 88 78.99019 0 0.1 0 0 0 1 
i 10.94911 144.1787 0.7171673 83 79.3927 0 0.1 0 0 0 1 
i 11.43987 144.1787 0.7171673 92 80.19774 0 0.1 0 0 0 1 
i 11.80795 144.1787 0.7171673 90 80.80151 0 0.1 0 0 0 1 
i 12.17602 144.1787 0.7171673 97 81.40528 0 0.1 0 0 0 1 
i 3.029976 144.2521 0.5378755 43 70.50113 0 0.1 0 0 0 1 
i 3.275357 144.2521 0.5378755 36 70.90365 0 0.1 0 0 0 1 
i 7.134542 144.2521 0.5378755 54 70.50113 0 0.1 0 0 0 1 
i 7.379923 144.2521 0.5378755 48 70.90365 0 0.1 0 0 0 1 
i 4.630533 144.3892 1.075751 79 78.69702 0 0.1 0 0 0 1 
i 5.550715 144.3892 0.5378755 88 80.20646 0 0.1 0 0 0 1 
i 8.735099 144.3892 0.5378755 90 78.69702 0 0.1 0 0 0 1 
i 9.655281 144.3892 1.075751 100 80.20646 0 0.1 0 0 0 1 
i 2.784594 144.79 0.5378755 39 70.09862 0 0.1 0 0 0 1 
i 3.520739 144.79 0.5378755 33 71.30616 0 0.1 0 0 0 1 
i 6.88916 144.79 0.5378755 51 70.09862 0 0.1 0 0 0 1 
i 7.625305 144.79 0.5378755 44 71.30616 0 0.1 0 0 0 1 
i 6.599163 144.8172 0.5378755 64 79.00763 0 0.1 0 0 0 1 
i 10.70373 144.8172 0.5378755 76 79.00763 0 0.1 0 0 0 1 
i 6.353782 144.8958 1.989145 75 78.58767 0 0.1 0 0 0 1 
i 6.721854 144.8958 1.271978 78 79.19145 0 0.1 0 0 0 1 
i 6.967236 144.8958 1.097633 73 79.59396 0 0.1 0 0 0 1 
i 7.089927 144.8958 0.7171673 70 79.79522 0 0.1 0 0 0 1 
i 7.457999 144.8958 0.7171673 82 80.39899 0 0.1 0 0 0 1 
i 7.58069 144.8958 1.271978 80 80.60025 0 0.1 0 0 0 1 
i 7.826072 144.8958 1.989145 85 81.00277 0 0.1 0 0 0 1 
i 8.194144 144.8958 1.989145 87 81.60654 0 0.1 0 0 0 1 
i 10.45835 144.8958 0.7171673 87 78.58767 0 0.1 0 0 0 1 
i 10.82642 144.8958 1.989145 89 79.19145 0 0.1 0 0 0 1 
i 11.0718 144.8958 1.989145 84 79.59396 0 0.1 0 0 0 1 
i 11.19449 144.8958 1.989145 82 79.79522 0 0.1 0 0 0 1 
i 11.56257 144.8958 1.989145 94 80.39899 0 0.1 0 0 0 1 
i 11.68526 144.8958 0.7171673 91 80.60025 0 0.1 0 0 0 1 
i 11.93064 144.8958 1.989145 96 81.00277 0 0.1 0 0 0 1 
i 12.29871 144.8958 0.7171673 98 81.60654 0 0.1 0 0 0 1 
i 1.122691 144.9177 0.5378755 54 70.29048 0 0.1 0 0 0 1 
i 1.490763 144.9177 0.5378755 49 70.89426 0 0.1 0 0 0 1 
i 1.981527 144.9177 0.5378755 57 71.69929 0 0.1 0 0 0 1 
i 2.594981 144.9177 0.5378755 63 72.70558 0 0.1 0 0 0 1 
i 5.227257 144.9177 0.5378755 66 70.29048 0 0.1 0 0 0 1 
i 5.595329 144.9177 0.5378755 60 70.89426 0 0.1 0 0 0 1 
i 6.086093 144.9177 0.9752949 69 71.69929 0 0.1 0 0 0 1 
i 6.699547 144.9177 0.5378755 74 72.70558 0 0.1 0 0 0 1 
i 5.61206 144.927 0.5378755 89 80.30709 0 0.1 0 0 0 1 
i 8.673754 144.927 0.5378755 91 78.59639 0 0.1 0 0 0 1 
i 10.45835 145.3551 0.5378755 81 78.60512 0 0.1 0 0 0 1 
i 6.476473 145.4506 0.7171673 74 78.78826 0 0.1 0 0 0 1 
i 6.599163 145.4506 1.434335 77 78.98952 0 0.1 0 0 0 1 
i 6.844545 145.4506 1.434335 72 79.39203 0 0.1 0 0 0 1 
i 7.151272 145.4506 1.434335 71 79.89518 0 0.1 0 0 0 1 
i 7.212618 145.4506 1.434335 69 79.99581 0 0.1 0 0 0 1 
i 7.335308 145.4506 1.434335 81 80.19706 0 0.1 0 0 0 1 
i 7.519345 145.4506 0.7171673 82 80.49895 0 0.1 0 0 0 1 
i 7.703381 145.4506 1.434335 79 80.80084 0 0.1 0 0 0 1 
i 7.948763 145.4506 1.434335 84 81.20335 0 0.1 0 0 0 1 
i 8.071453 145.4506 0.7171673 86 81.40461 0 0.1 0 0 0 1 
i 10.51969 145.4506 1.434335 87 78.68763 0 0.1 0 0 0 1 
i 10.58104 145.4506 0.7171673 86 78.78826 0 0.1 0 0 0 1 
i 10.70373 145.4506 0.7171673 88 78.98952 0 0.1 0 0 0 1 
i 10.94911 145.4506 1.434335 83 79.39203 0 0.1 0 0 0 1 
i 11.31718 145.4506 0.7171673 81 79.99581 0 0.1 0 0 0 1 
i 11.43987 145.4506 0.7171673 93 80.19706 0 0.1 0 0 0 1 
i 11.7466 145.4506 1.434335 92 80.70021 0 0.1 0 0 0 1 
i 11.80795 145.4506 1.434335 90 80.80084 0 0.1 0 0 0 1 
i 12.05333 145.4506 0.7171673 95 81.20335 0 0.1 0 0 0 1 
i 12.17602 145.4506 1.434335 97 81.40461 0 0.1 0 0 0 1 
i 12.36006 145.4506 0.7171673 99 81.7065 0 0.1 0 0 0 1 
i 1 145.4556 0.5378755 53 70.08922 0 0.1 0 0 0 1 
i 1.613454 145.4556 0.5378755 47 71.09551 0 0.1 0 0 0 1 
i 2.104217 145.4556 0.5378755 56 71.90055 0 0.1 0 0 0 1 
i 2.47229 145.4556 0.5378755 61 72.50432 0 0.1 0 0 0 1 
i 5.104566 145.4556 0.5378755 64 70.08922 0 0.1 0 0 0 1 
i 5.71802 145.4556 0.5378755 59 71.09551 0 0.1 0 0 0 1 
i 6.208784 145.4556 0.5378755 68 71.90055 0 0.1 0 0 0 1 
i 2.845939 145.7182 0.5378755 60 70.19857 0 0.1 0 0 0 1 
i 3.029976 145.7182 0.5378755 54 70.50046 0 0.1 0 0 0 1 
i 3.275357 145.7182 0.5378755 63 70.90298 0 0.1 0 0 0 1 
i 3.582084 145.7182 0.5378755 69 71.40612 0 0.1 0 0 0 1 
i 7.134542 145.7182 0.5378755 65 70.50046 0 0.1 0 0 0 1 
i 7.379923 145.7182 1.671546 74 70.90298 0 0.1 0 0 0 1 
i 7.68665 145.7182 0.5378755 81 71.40612 0 0.1 0 0 0 1 
i 4.691879 145.8975 0.5378755 78 78.79698 0 0.1 0 0 0 1 
i 5.550715 145.8975 0.5378755 88 80.20579 0 0.1 0 0 0 1 
i 8.796445 145.8975 0.5378755 89 78.79698 0 0.1 0 0 0 1 
i 9.655281 145.8975 0.5378755 100 80.20579 0 0.1 0 0 0 1 
i 6.660509 146.1678 0.7171673 76 79.09015 0 0.1 0 0 0 1 
i 7.089927 146.1678 0.6261453 70 79.79455 0 0.1 0 0 0 1 
i 7.457999 146.1678 0.7171673 82 80.39832 0 0.1 0 0 0 1 
i 7.764726 146.1678 0.7171673 78 80.90147 0 0.1 0 0 0 1 
i 8.010108 146.1678 0.7171673 83 81.30398 0 0.1 0 0 0 1 
i 10.45835 146.1678 0.7171673 86 78.587 0 0.1 0 0 0 1 
i 10.64238 146.1678 0.7171673 85 78.88889 0 0.1 0 0 0 1 
i 11.37853 146.1678 0.7171673 80 80.09644 0 0.1 0 0 0 1 
i 11.56257 146.1678 0.7171673 93 80.39832 0 0.1 0 0 0 1 
i 11.68526 146.1678 0.7171673 91 80.59958 0 0.1 0 0 0 1 
i 12.29871 146.1678 0.7171673 98 81.60587 0 0.1 0 0 0 1 
i 2.784594 146.2561 0.5378755 59 70.09795 0 0.1 0 0 0 1 
i 3.091321 146.2561 0.5378755 52 70.60109 0 0.1 0 0 0 1 
i 3.336703 146.2561 0.5957946 62 71.00361 0 0.1 0 0 0 1 
i 3.520739 146.2561 0.5378755 68 71.30549 0 0.1 0 0 0 1 
i 7.195887 146.2561 0.5378755 64 70.60109 0 0.1 0 0 0 1 
i 7.441269 146.2561 0.5957946 73 71.00361 0 0.1 0 0 0 1 
i 7.625305 146.2561 0.5378755 80 71.30549 0 0.1 0 0 0 1 
i 6.415127 146.2897 0.5378755 81 78.70507 0 0.1 0 0 0 1 
i 6.599163 146.2897 0.5378755 86 79.00696 0 0.1 0 0 0 1 
i 10.51969 146.2897 0.5378755 92 78.70507 0 0.1 0 0 0 1 
i 10.70373 146.2897 0.5378755 98 79.00696 0 0.1 0 0 0 1 
i 1.061345 146.314 0.5378755 53 70.18918 0 0.1 0 0 0 1 
i 1.122691 146.314 1.075751 54 70.28981 0 0.1 0 0 0 1 
i 1.490763 146.314 0.5378755 48 70.89358 0 0.1 0 0 0 1 
i 1.6748 146.314 0.5378755 47 71.19547 0 0.1 0 0 0 1 
i 1.981527 146.314 1.075751 57 71.69862 0 0.1 0 0 0 1 
i 2.165563 146.314 1.075751 56 72.0005 0 0.1 0 0 0 1 
i 2.594981 146.314 1.075751 63 72.70491 0 0.1 0 0 0 1 
i 5.165911 146.314 1.075751 65 70.18918 0 0.1 0 0 0 1 
i 5.227257 146.314 1.075751 66 70.28981 0 0.1 0 0 0 1 
i 5.595329 146.314 1.075751 60 70.89358 0 0.1 0 0 0 1 
i 5.779366 146.314 0.5378755 58 71.19547 0 0.1 0 0 0 1 
i 6.086093 146.314 1.075751 68 71.69862 0 0.1 0 0 0 1 
i 6.270129 146.314 0.5378755 67 72.0005 0 0.1 0 0 0 1 
i 4.569188 146.4354 0.5378755 79 78.59572 0 0.1 0 0 0 1 
i 5.673405 146.4354 0.5378755 89 80.40704 0 0.1 0 0 0 1 
i 8.673754 146.4354 0.5378755 91 78.59572 0 0.1 0 0 0 1 
i 9.777971 146.4354 0.5378755 101 80.40704 0 0.1 0 0 0 1 
i 6.353782 146.8276 0.5378755 82 78.60444 0 0.1 0 0 0 1 
i 6.660509 146.8276 0.5378755 87 79.10759 0 0.1 0 0 0 1 
i 10.45835 146.8276 0.5378755 93 78.60444 0 0.1 0 0 0 1 
i 10.76507 146.8276 0.5378755 99 79.10759 0 0.1 0 0 0 1 
i 1.184036 146.8519 0.5378755 55 70.39044 0 0.1 0 0 0 1 
i 1.552109 146.8519 0.5378755 49 70.99421 0 0.1 0 0 0 1 
i 1.613454 146.8519 0.5378755 48 71.09484 0 0.1 0 0 0 1 
i 2.47229 146.8519 0.5378755 62 72.50365 0 0.1 0 0 0 1 
i 5.71802 146.8519 0.5378755 59 71.09484 0 0.1 0 0 0 1 
i 6.147438 146.8519 0.5378755 69 71.79925 0 0.1 0 0 0 1 
i 6.760892 146.8519 0.5378755 75 72.80553 0 0.1 0 0 0 1 
i 2.907285 147.2201 0.5378755 39 70.29853 0 0.1 0 0 0 1 
i 3.029976 147.2201 0.5378755 42 70.49979 0 0.1 0 0 0 1 
i 3.275357 147.2201 0.5378755 37 70.90231 0 0.1 0 0 0 1 
i 3.64343 147.2201 0.5378755 34 71.50608 0 0.1 0 0 0 1 
i 7.011851 147.2201 0.5378755 51 70.29853 0 0.1 0 0 0 1 
i 7.134542 147.2201 0.5378755 53 70.49979 0 0.1 0 0 0 1 
i 7.379923 147.2201 0.5378755 48 70.90231 0 0.1 0 0 0 1 
i 7.747996 147.2201 0.5378755 46 71.50608 0 0.1 0 0 0 1 
i 4.630533 147.2999 0.5378755 79 78.69568 0 0.1 0 0 0 1 
i 4.691879 147.2999 1.075751 78 78.79631 0 0.1 0 0 0 1 
i 5.550715 147.2999 1.075751 89 80.20512 0 0.1 0 0 0 1 
i 5.734751 147.2999 1.075751 90 80.507 0 0.1 0 0 0 1 
i 8.735099 147.2999 1.075751 90 78.69568 0 0.1 0 0 0 1 
i 8.796445 147.2999 1.075751 89 78.79631 0 0.1 0 0 0 1 
i 9.655281 147.2999 1.075751 101 80.20512 0 0.1 0 0 0 1 
i 9.839317 147.2999 0.5378755 102 80.507 0 0.1 0 0 0 1 
i 2.784594 147.7579 0.5378755 41 70.09727 0 0.1 0 0 0 1 
i 3.152666 147.7579 0.5378755 44 70.70105 0 0.1 0 0 0 1 
i 3.398048 147.7579 0.5378755 38 71.10356 0 0.1 0 0 0 1 
i 3.520739 147.7579 0.5378755 36 71.30482 0 0.1 0 0 0 1 
i 6.88916 147.7579 0.5378755 52 70.09727 0 0.1 0 0 0 1 
i 7.257232 147.7579 0.5378755 55 70.70105 0 0.1 0 0 0 1 
i 7.502614 147.7579 0.5378755 50 71.10356 0 0.1 0 0 0 1 
i 7.625305 147.7579 0.5378755 47 71.30482 0 0.1 0 0 0 1 
i 6.476473 147.7981 0.5378755 74 78.80503 0 0.1 0 0 0 1 
i 6.599163 147.7981 1.075751 73 79.00629 0 0.1 0 0 0 1 
i 10.58104 147.7981 0.5378755 85 78.80503 0 0.1 0 0 0 1 
i 4.753224 147.8378 0.5378755 77 78.89694 0 0.1 0 0 0 1 
i 9.716626 147.8378 0.5378755 100 80.30574 0 0.1 0 0 0 1 
i 1.245382 147.9214 0.5378755 54 70.4904 0 0.1 0 0 0 1 
i 1.490763 147.9214 0.5378755 50 70.89291 0 0.1 0 0 0 1 
i 1.981527 147.9214 0.5378755 58 71.69795 0 0.1 0 0 0 1 
i 2.717672 147.9214 0.5378755 63 72.90549 0 0.1 0 0 0 1 
i 5.349948 147.9214 0.5378755 66 70.4904 0 0.1 0 0 0 1 
i 5.595329 147.9214 0.5378755 61 70.89291 0 0.1 0 0 0 1 
i 6.086093 147.9214 0.5378755 70 71.69795 0 0.1 0 0 0 1 
i 6.822238 147.9214 0.5378755 74 72.90549 0 0.1 0 0 0 1 
i 6.353782 148.336 0.5378755 73 78.60377 0 0.1 0 0 0 1 
i 10.45835 148.336 0.5378755 85 78.60377 0 0.1 0 0 0 1 
i 10.82642 148.336 0.5378755 84 79.20755 0 0.1 0 0 0 1 
i 1 148.4593 0.5378755 52 70.08788 0 0.1 0 0 0 1 
i 1.736145 148.4593 0.5378755 48 71.29543 0 0.1 0 0 0 1 
i 2.226908 148.4593 0.5378755 56 72.10046 0 0.1 0 0 0 1 
i 2.47229 148.4593 0.5378755 60 72.50298 0 0.1 0 0 0 1 
i 5.104566 148.4593 0.5378755 63 70.08788 0 0.1 0 0 0 1 
i 5.840711 148.4593 0.5378755 59 71.29543 0 0.1 0 0 0 1 
i 6.331474 148.4593 0.5378755 68 72.10046 0 0.1 0 0 0 1 
i 6.576856 148.4593 0.5378755 72 72.50298 0 0.1 0 0 0 1 
i 2.845939 148.6163 1.075751 42 70.19723 0 0.1 0 0 0 1 
i 2.907285 148.6163 0.5378755 41 70.29786 0 0.1 0 0 0 1 
i 3.029976 148.6163 1.075751 43 70.49912 0 0.1 0 0 0 1 
i 3.214012 148.6163 1.075751 44 70.80101 0 0.1 0 0 0 1 
i 3.275357 148.6163 1.075751 39 70.90164 0 0.1 0 0 0 1 
i 3.459394 148.6163 1.075751 40 71.20352 0 0.1 0 0 0 1 
i 3.582084 148.6163 0.5378755 38 71.40478 0 0.1 0 0 0 1 
i 3.64343 148.6163 1.075751 37 71.50541 0 0.1 0 0 0 1 
i 6.950505 148.6163 1.075751 54 70.19723 0 0.1 0 0 0 1 
i 7.011851 148.6163 1.075751 52 70.29786 0 0.1 0 0 0 1 
i 7.134542 148.6163 1.075751 55 70.49912 0 0.1 0 0 0 1 
i 7.318578 148.6163 0.5378755 56 70.80101 0 0.1 0 0 0 1 
i 7.379923 148.6163 1.075751 50 70.90164 0 0.1 0 0 0 1 
i 7.56396 148.6163 1.075751 51 71.20352 0 0.1 0 0 0 1 
i 7.68665 148.6163 1.075751 49 71.40478 0 0.1 0 0 0 1 
i 7.747996 148.6163 1.075751 48 71.50541 0 0.1 0 0 0 1 
i 4.81457 148.9143 0.5378755 77 78.9969 0 0.1 0 0 0 1 
i 5.550715 148.9143 0.5378755 88 80.20444 0 0.1 0 0 0 1 
i 8.919136 148.9143 0.5378755 89 78.9969 0 0.1 0 0 0 1 
i 9.655281 148.9143 0.5378755 99 80.20444 0 0.1 0 0 0 1 
i 3.336703 149.1542 0.5378755 38 71.00226 0 0.1 0 0 0 1 
i 3.704775 149.1542 0.5378755 36 71.60604 0 0.1 0 0 0 1 
i 6.88916 149.1542 0.5378755 53 70.0966 0 0.1 0 0 0 1 
i 6.415127 149.2005 0.655115 67 78.70373 0 0.1 0 0 0 1 
i 6.476473 149.2005 1.192991 68 78.80436 0 0.1 0 0 0 1 
i 6.599163 149.2005 0.5378755 65 79.00562 0 0.1 0 0 0 1 
i 6.7832 149.2005 1.075751 64 79.30751 0 0.1 0 0 0 1 
i 10.51969 149.2005 0.5378755 78 78.70373 0 0.1 0 0 0 1 
i 10.58104 149.2005 0.5378755 80 78.80436 0 0.1 0 0 0 1 
i 10.70373 149.2005 1.075751 77 79.00562 0 0.1 0 0 0 1 
i 10.88777 149.2005 0.5378755 75 79.30751 0 0.1 0 0 0 1 
i 1.061345 149.3177 0.5378755 51 70.18784 0 0.1 0 0 0 1 
i 1.245382 149.3177 0.5378755 54 70.48973 0 0.1 0 0 0 1 
i 1.490763 149.3177 0.5378755 50 70.89224 0 0.1 0 0 0 1 
i 1.79749 149.3177 0.5378755 47 71.39539 0 0.1 0 0 0 1 
i 1.981527 149.3177 0.5378755 58 71.69727 0 0.1 0 0 0 1 
i 2.288254 149.3177 1.075751 56 72.20042 0 0.1 0 0 0 1 
i 2.533635 149.3177 0.5378755 60 72.60294 0 0.1 0 0 0 1 
i 2.717672 149.3177 1.075751 63 72.90482 0 0.1 0 0 0 1 
i 5.165911 149.3177 1.075751 63 70.18784 0 0.1 0 0 0 1 
i 5.349948 149.3177 1.075751 66 70.48973 0 0.1 0 0 0 1 
i 5.595329 149.3177 0.5378755 61 70.89224 0 0.1 0 0 0 1 
i 5.902056 149.3177 0.5378755 58 71.39539 0 0.1 0 0 0 1 
i 6.086093 149.3177 1.075751 70 71.69727 0 0.1 0 0 0 1 
i 6.638201 149.3177 0.5378755 71 72.60294 0 0.1 0 0 0 1 
i 6.822238 149.3177 0.5378755 74 72.90482 0 0.1 0 0 0 1 
i 4.569188 149.4522 0.5378755 80 78.59438 0 0.1 0 0 0 1 
i 5.796096 149.4522 0.5378755 90 80.60696 0 0.1 0 0 0 1 
i 8.673754 149.4522 0.5378755 91 78.59438 0 0.1 0 0 0 1 
i 9.900662 149.4522 0.5378755 102 80.60696 0 0.1 0 0 0 1 
i 6.537818 149.7383 0.5378755 69 78.90499 0 0.1 0 0 0 1 
i 6.660509 149.7383 0.5378755 66 79.10625 0 0.1 0 0 0 1 
i 10.45835 149.7383 0.5378755 79 78.6031 0 0.1 0 0 0 1 
i 10.64238 149.7383 0.5378755 81 78.90499 0 0.1 0 0 0 1 
i 10.82642 149.7383 0.5378755 76 79.20688 0 0.1 0 0 0 1 
i 1 149.8556 0.5378755 52 70.08721 0 0.1 0 0 0 1 
i 1.306727 149.8556 0.5378755 55 70.59036 0 0.1 0 0 0 1 
i 1.552109 149.8556 0.5378755 50 70.99287 0 0.1 0 0 0 1 
i 1.736145 149.8556 0.5378755 48 71.29476 0 0.1 0 0 0 1 
i 2.042872 149.8556 0.5378755 59 71.7979 0 0.1 0 0 0 1 
i 2.47229 149.8556 0.5378755 60 72.50231 0 0.1 0 0 0 1 
i 5.656675 149.8556 0.5378755 62 70.99287 0 0.1 0 0 0 1 
i 5.840711 149.8556 0.5378755 59 71.29476 0 0.1 0 0 0 1 
i 6.576856 149.8556 0.5378755 72 72.50231 0 0.1 0 0 0 1 
i 6.883583 149.8556 0.5378755 75 73.00545 0 0.1 0 0 0 1 
i 4.630533 150.3167 0.5378755 80 78.69434 0 0.1 0 0 0 1 
i 4.81457 150.3167 0.5378755 77 78.99623 0 0.1 0 0 0 1 
i 5.550715 150.3167 1.075751 88 80.20377 0 0.1 0 0 0 1 
i 5.857442 150.3167 0.5378755 91 80.70692 0 0.1 0 0 0 1 
i 8.735099 150.3167 1.075751 91 78.69434 0 0.1 0 0 0 1 
i 8.919136 150.3167 1.075751 88 78.99623 0 0.1 0 0 0 1 
i 9.655281 150.3167 0.5378755 100 80.20377 0 0.1 0 0 0 1 
i 9.962008 150.3167 1.075751 102 80.70692 0 0.1 0 0 0 1 
i 1.122691 150.748 0.5378755 51 70.2878 0 0.1 0 0 0 1 
i 1.245382 150.748 1.075751 53 70.48906 0 0.1 0 0 0 1 
i 1.490763 150.748 0.5378755 49 70.89157 0 0.1 0 0 0 1 
i 1.858836 150.748 0.5378755 47 71.49535 0 0.1 0 0 0 1 
i 1.981527 150.748 0.5378755 58 71.6966 0 0.1 0 0 0 1 
i 2.349599 150.748 0.5378755 56 72.30038 0 0.1 0 0 0 1 
i 2.594981 150.748 0.5378755 60 72.70289 0 0.1 0 0 0 1 
i 2.717672 150.748 0.5378755 62 72.90415 0 0.1 0 0 0 1 
i 5.227257 150.748 0.5378755 63 70.2878 0 0.1 0 0 0 1 
i 5.349948 150.748 0.5378755 65 70.48906 0 0.1 0 0 0 1 
i 5.595329 150.748 0.5378755 61 70.89157 0 0.1 0 0 0 1 
i 5.963402 150.748 0.5378755 58 71.49535 0 0.1 0 0 0 1 
i 6.086093 150.748 0.5378755 69 71.6966 0 0.1 0 0 0 1 
i 6.454165 150.748 0.5378755 67 72.30038 0 0.1 0 0 0 1 
i 6.699547 150.748 0.5378755 71 72.70289 0 0.1 0 0 0 1 
i 6.822238 150.748 1.075751 73 72.90415 0 0.1 0 0 0 1 
i 4.569188 150.8545 0.5378755 79 78.59371 0 0.1 0 0 0 1 
i 4.875915 150.8545 0.5378755 76 79.09686 0 0.1 0 0 0 1 
i 5.796096 150.8545 0.5378755 90 80.60629 0 0.1 0 0 0 1 
i 9.716626 150.8545 0.5378755 99 80.3044 0 0.1 0 0 0 1 
i 6.844545 151.1525 0.5378755 86 79.40746 0 0.1 0 0 0 1 
i 10.94911 151.1525 0.5378755 98 79.40746 0 0.1 0 0 0 1 
i 3.766121 151.2282 0.5378755 42 71.706 0 0.1 0 0 0 1 
i 7.870687 151.2282 0.5378755 54 71.706 0 0.1 0 0 0 1 
i 1.368072 151.2859 0.5378755 55 70.69031 0 0.1 0 0 0 1 
i 1.613454 151.2859 0.5378755 50 71.09283 0 0.1 0 0 0 1 
i 1.736145 151.2859 0.5378755 48 71.29409 0 0.1 0 0 0 1 
i 2.104217 151.2859 0.5378755 59 71.89786 0 0.1 0 0 0 1 
i 2.226908 151.2859 0.5378755 57 72.09912 0 0.1 0 0 0 1 
i 2.47229 151.2859 0.5378755 61 72.50164 0 0.1 0 0 0 1 
i 2.840362 151.2859 0.5378755 63 73.10541 0 0.1 0 0 0 1 
i 5.104566 151.2859 0.5378755 64 70.08654 0 0.1 0 0 0 1 
i 5.472639 151.2859 0.5378755 66 70.69031 0 0.1 0 0 0 1 
i 5.71802 151.2859 0.5378755 62 71.09283 0 0.1 0 0 0 1 
i 5.840711 151.2859 0.5378755 60 71.29409 0 0.1 0 0 0 1 
i 6.208784 151.2859 0.5378755 70 71.89786 0 0.1 0 0 0 1 
i 6.331474 151.2859 0.5378755 68 72.09912 0 0.1 0 0 0 1 
i 6.944929 151.2859 0.5378755 75 73.10541 0 0.1 0 0 0 1 
i 6.353782 151.6904 0.5378755 80 78.60243 0 0.1 0 0 0 1 
i 10.45835 151.6904 0.5378755 91 78.60243 0 0.1 0 0 0 1 
i 4.691879 151.7532 0.5378755 79 78.7943 0 0.1 0 0 0 1 
i 4.81457 151.7532 0.5378755 77 78.99556 0 0.1 0 0 0 1 
i 5.550715 151.7532 0.5378755 89 80.2031 0 0.1 0 0 0 1 
i 5.918787 151.7532 0.5378755 91 80.80688 0 0.1 0 0 0 1 
i 8.796445 151.7532 0.5378755 91 78.7943 0 0.1 0 0 0 1 
i 8.919136 151.7532 0.5378755 89 78.99556 0 0.1 0 0 0 1 
i 9.655281 151.7532 0.5378755 101 80.2031 0 0.1 0 0 0 1 
i 10.02335 151.7532 0.5378755 103 80.80688 0 0.1 0 0 0 1 
i 2.784594 151.7661 0.5378755 48 70.09593 0 0.1 0 0 0 1 
i 6.88916 151.7661 0.5378755 59 70.09593 0 0.1 0 0 0 1 
i 1.061345 152.0778 1.075751 53 70.1865 0 0.1 0 0 0 1 
i 1.122691 152.0778 1.075751 52 70.28713 0 0.1 0 0 0 1 
i 1.245382 152.0778 1.075751 54 70.48839 0 0.1 0 0 0 1 
i 1.429418 152.0778 0.5378755 55 70.79027 0 0.1 0 0 0 1 
i 1.490763 152.0778 0.5378755 49 70.8909 0 0.1 0 0 0 1 
i 1.6748 152.0778 0.5378755 51 71.19279 0 0.1 0 0 0 1 
i 1.79749 152.0778 1.075751 48 71.39405 0 0.1 0 0 0 1 
i 1.858836 152.0778 1.075751 47 71.49468 0 0.1 0 0 0 1 
i 1.981527 152.0778 1.075751 58 71.69593 0 0.1 0 0 0 1 
i 2.165563 152.0778 1.075751 59 71.99782 0 0.1 0 0 0 1 
i 2.288254 152.0778 0.5378755 57 72.19908 0 0.1 0 0 0 1 
i 2.349599 152.0778 1.075751 56 72.29971 0 0.1 0 0 0 1 
i 2.533635 152.0778 0.5378755 61 72.60159 0 0.1 0 0 0 1 
i 2.594981 152.0778 1.075751 60 72.70222 0 0.1 0 0 0 1 
i 2.717672 152.0778 1.075751 62 72.90348 0 0.1 0 0 0 1 
i 2.901708 152.0778 1.075751 63 73.20537 0 0.1 0 0 0 1 
i 5.165911 152.0778 1.075751 64 70.1865 0 0.1 0 0 0 1 
i 5.227257 152.0778 1.075751 63 70.28713 0 0.1 0 0 0 1 
i 5.349948 152.0778 1.075751 65 70.48839 0 0.1 0 0 0 1 
i 5.533984 152.0778 0.5378755 66 70.79027 0 0.1 0 0 0 1 
i 5.595329 152.0778 0.5378755 61 70.8909 0 0.1 0 0 0 1 
i 5.779366 152.0778 1.075751 62 71.19279 0 0.1 0 0 0 1 
i 5.902056 152.0778 1.075751 60 71.39405 0 0.1 0 0 0 1 
i 5.963402 152.0778 1.075751 59 71.49468 0 0.1 0 0 0 1 
i 6.086093 152.0778 1.075751 70 71.69593 0 0.1 0 0 0 1 
i 6.270129 152.0778 0.5378755 71 71.99782 0 0.1 0 0 0 1 
i 6.39282 152.0778 1.075751 68 72.19908 0 0.1 0 0 0 1 
i 6.454165 152.0778 0.5378755 67 72.29971 0 0.1 0 0 0 1 
i 6.638201 152.0778 1.075751 73 72.60159 0 0.1 0 0 0 1 
i 6.699547 152.0778 1.075751 72 72.70222 0 0.1 0 0 0 1 
i 6.822238 152.0778 1.075751 74 72.90348 0 0.1 0 0 0 1 
i 7.006274 152.0778 0.5378755 75 73.20537 0 0.1 0 0 0 1 
i 4.569188 152.2911 0.5378755 78 78.59304 0 0.1 0 0 0 1 
i 4.93726 152.2911 0.5378755 76 79.19681 0 0.1 0 0 0 1 
i 5.673405 152.2911 0.5378755 88 80.40436 0 0.1 0 0 0 1 
i 5.796096 152.2911 0.5378755 90 80.60562 0 0.1 0 0 0 1 
i 8.673754 152.2911 0.5378755 90 78.59304 0 0.1 0 0 0 1 
i 9.041826 152.2911 0.5378755 87 79.19681 0 0.1 0 0 0 1 
i 9.777971 152.2911 0.5378755 99 80.40436 0 0.1 0 0 0 1 
i 9.900662 152.2911 0.5378755 102 80.60562 0 0.1 0 0 0 1 
i 1.184036 152.6157 0.5378755 51 70.38776 0 0.1 0 0 0 1 
i 1.552109 152.6157 0.5378755 49 70.99153 0 0.1 0 0 0 1 
i 1.613454 152.6157 0.5378755 50 71.09216 0 0.1 0 0 0 1 
i 2.410945 152.6157 0.5378755 55 72.40034 0 0.1 0 0 0 1 
i 2.47229 152.6157 0.5378755 61 72.50096 0 0.1 0 0 0 1 
i 5.472639 152.6157 0.5378755 66 70.68964 0 0.1 0 0 0 1 
i 6.024747 152.6157 0.5378755 58 71.5953 0 0.1 0 0 0 1 
i 6.147438 152.6157 0.5378755 69 71.79656 0 0.1 0 0 0 1 
i 6.515511 152.6157 0.5378755 67 72.40034 0 0.1 0 0 0 1 
i 6.760892 152.6157 0.5378755 71 72.80285 0 0.1 0 0 0 1 
i 6.415127 152.6249 0.5378755 71 78.70239 0 0.1 0 0 0 1 
i 6.844545 152.6249 0.5378755 59 79.40679 0 0.1 0 0 0 1 
i 10.51969 152.6249 0.5378755 83 78.70239 0 0.1 0 0 0 1 
i 10.94911 152.6249 0.5378755 71 79.40679 0 0.1 0 0 0 1 
i 2.845939 152.7676 1.075751 49 70.19589 0 0.1 0 0 0 1 
i 3.766121 152.7676 0.5378755 40 71.70532 0 0.1 0 0 0 1 
i 6.950505 152.7676 0.5378755 61 70.19589 0 0.1 0 0 0 1 
i 7.870687 152.7676 1.075751 51 71.70532 0 0.1 0 0 0 1 
i 4.630533 153.0888 1.075751 78 78.693 0 0.1 0 0 0 1 
i 4.691879 153.0888 1.075751 79 78.79363 0 0.1 0 0 0 1 
i 4.81457 153.0888 1.075751 77 78.99488 0 0.1 0 0 0 1 
i 4.998606 153.0888 0.5378755 75 79.29677 0 0.1 0 0 0 1 
i 5.550715 153.0888 1.075751 89 80.20243 0 0.1 0 0 0 1 
i 5.734751 153.0888 0.5378755 88 80.50432 0 0.1 0 0 0 1 
i 5.857442 153.0888 1.075751 90 80.70558 0 0.1 0 0 0 1 
i 5.918787 153.0888 1.075751 91 80.80621 0 0.1 0 0 0 1 
i 8.735099 153.0888 1.075751 89 78.693 0 0.1 0 0 0 1 
i 8.796445 153.0888 1.075751 90 78.79363 0 0.1 0 0 0 1 
i 8.919136 153.0888 1.075751 88 78.99488 0 0.1 0 0 0 1 
i 9.103172 153.0888 0.5378755 87 79.29677 0 0.1 0 0 0 1 
i 9.655281 153.0888 1.075751 101 80.20243 0 0.1 0 0 0 1 
i 9.839317 153.0888 1.075751 100 80.50432 0 0.1 0 0 0 1 
i 9.962008 153.0888 1.075751 102 80.70558 0 0.1 0 0 0 1 
i 10.02335 153.0888 1.075751 103 80.80621 0 0.1 0 0 0 1 
i 6.353782 153.1628 0.5378755 70 78.60176 0 0.1 0 0 0 1 
i 6.905891 153.1628 0.5378755 58 79.50742 0 0.1 0 0 0 1 
i 10.45835 153.1628 0.5378755 81 78.60176 0 0.1 0 0 0 1 
i 11.01046 153.1628 0.5378755 70 79.50742 0 0.1 0 0 0 1 
i 3.827466 153.3055 0.5378755 39 71.80595 0 0.1 0 0 0 1 
i 6.88916 153.3055 0.5378755 60 70.09526 0 0.1 0 0 0 1 
i 4.93726 153.6267 0.5378755 76 79.19614 0 0.1 0 0 0 1 
i 5.980132 153.6267 0.5378755 92 80.90683 0 0.1 0 0 0 1 
i 8.85779 153.6267 0.5378755 91 78.89426 0 0.1 0 0 0 1 
i 6.476473 154.1333 0.5378755 79 78.80235 0 0.1 0 0 0 1 
i 6.844545 154.1333 0.5378755 87 79.40612 0 0.1 0 0 0 1 
i 10.58104 154.1333 0.5378755 90 78.80235 0 0.1 0 0 0 1 
i 10.94911 154.1333 0.5378755 98 79.40612 0 0.1 0 0 0 1 
i 2.907285 154.3446 0.5378755 41 70.29585 0 0.1 0 0 0 1 
i 3.766121 154.3446 0.5378755 62 71.70465 0 0.1 0 0 0 1 
i 7.011851 154.3446 0.5378755 53 70.29585 0 0.1 0 0 0 1 
i 7.870687 154.3446 0.5378755 74 71.70465 0 0.1 0 0 0 1 
i 6.353782 154.6712 0.5378755 80 78.60109 0 0.1 0 0 0 1 
i 6.967236 154.6712 0.5378755 89 79.60738 0 0.1 0 0 0 1 
i 10.45835 154.6712 0.5378755 92 78.60109 0 0.1 0 0 0 1 
i 11.0718 154.6712 0.5378755 100 79.60738 0 0.1 0 0 0 1 
i 2.784594 154.8825 0.5378755 44 70.09459 0 0.1 0 0 0 1 
i 3.888811 154.8825 0.5378755 65 71.90591 0 0.1 0 0 0 1 
i 6.88916 154.8825 0.5378755 55 70.09459 0 0.1 0 0 0 1 
i 7.993377 154.8825 0.5378755 76 71.90591 0 0.1 0 0 0 1 
i 5.059951 154.9479 0.5378755 77 79.39673 0 0.1 0 0 0 1 
i 5.550715 154.9479 0.5378755 86 80.20176 0 0.1 0 0 0 1 
i 9.164517 154.9479 0.5378755 89 79.39673 0 0.1 0 0 0 1 
i 9.655281 154.9479 0.5378755 97 80.20176 0 0.1 0 0 0 1 
i 4.569188 155.4857 0.5378755 81 78.5917 0 0.1 0 0 0 1 
i 6.041478 155.4857 0.5378755 90 81.00679 0 0.1 0 0 0 1 
i 8.673754 155.4857 0.5378755 93 78.5917 0 0.1 0 0 0 1 
i 10.14604 155.4857 0.5378755 102 81.00679 0 0.1 0 0 0 1 
i 6.415127 155.5357 1.075751 77 78.70105 0 0.1 0 0 0 1 
i 6.476473 155.5357 0.5378755 76 78.80168 0 0.1 0 0 0 1 
i 6.844545 155.5357 1.075751 79 79.40545 0 0.1 0 0 0 1 
i 10.51969 155.5357 1.075751 88 78.70105 0 0.1 0 0 0 1 
i 10.94911 155.5357 1.075751 90 79.40545 0 0.1 0 0 0 1 
i 2.845939 155.8107 0.5378755 51 70.19455 0 0.1 0 0 0 1 
i 2.907285 155.8107 0.5378755 53 70.29518 0 0.1 0 0 0 1 
i 3.766121 155.8107 0.5378755 32 71.70398 0 0.1 0 0 0 1 
i 3.950157 155.8107 0.5378755 30 72.00587 0 0.1 0 0 0 1 
i 6.950505 155.8107 0.5378755 62 70.19455 0 0.1 0 0 0 1 
i 7.011851 155.8107 0.5378755 64 70.29518 0 0.1 0 0 0 1 
i 7.870687 155.8107 0.5378755 43 71.70398 0 0.1 0 0 0 1 
i 8.054723 155.8107 0.5378755 41 72.00587 0 0.1 0 0 0 1 
i 6.537818 156.0736 0.5378755 76 78.90231 0 0.1 0 0 0 1 
i 6.905891 156.0736 0.5378755 78 79.50608 0 0.1 0 0 0 1 
i 10.45835 156.0736 0.5378755 88 78.60042 0 0.1 0 0 0 1 
i 2.784594 156.3486 0.5378755 52 70.09392 0 0.1 0 0 0 1 
i 2.96863 156.3486 0.5378755 54 70.39581 0 0.1 0 0 0 1 
i 3.827466 156.3486 0.5378755 33 71.80461 0 0.1 0 0 0 1 
i 3.888811 156.3486 0.5378755 31 71.90524 0 0.1 0 0 0 1 
i 6.88916 156.3486 0.5378755 63 70.09392 0 0.1 0 0 0 1 
i 7.073196 156.3486 0.5378755 65 70.39581 0 0.1 0 0 0 1 
i 7.932032 156.3486 0.5378755 44 71.80461 0 0.1 0 0 0 1 
i 7.993377 156.3486 0.5378755 42 71.90524 0 0.1 0 0 0 1 
i 4.630533 156.3502 1.075751 82 78.69166 0 0.1 0 0 0 1 
i 5.059951 156.3502 0.5378755 77 79.39606 0 0.1 0 0 0 1 
i 5.550715 156.3502 1.075751 85 80.20109 0 0.1 0 0 0 1 
i 6.102823 156.3502 0.5378755 91 81.10675 0 0.1 0 0 0 1 
i 8.735099 156.3502 0.5378755 94 78.69166 0 0.1 0 0 0 1 
i 9.164517 156.3502 1.075751 88 79.39606 0 0.1 0 0 0 1 
i 9.655281 156.3502 0.5378755 97 80.20109 0 0.1 0 0 0 1 
i 10.20739 156.3502 1.075751 102 81.10675 0 0.1 0 0 0 1 
i 5.121297 156.8881 0.5378755 76 79.49669 0 0.1 0 0 0 1 
i 6.041478 156.8881 0.5378755 90 81.00612 0 0.1 0 0 0 1 
i 8.673754 156.8881 0.5378755 93 78.59103 0 0.1 0 0 0 1 
i 9.716626 156.8881 0.5378755 96 80.30172 0 0.1 0 0 0 1 
i 6.599163 157.1501 0.5378755 71 79.00226 0 0.1 0 0 0 1 
i 6.844545 157.1501 0.5378755 65 79.40478 0 0.1 0 0 0 1 
i 10.70373 157.1501 0.5378755 83 79.00226 0 0.1 0 0 0 1 
i 10.94911 157.1501 0.5378755 76 79.40478 0 0.1 0 0 0 1 
i 3.029976 157.4985 0.5378755 44 70.49577 0 0.1 0 0 0 1 
i 3.766121 157.4985 0.5378755 53 71.70331 0 0.1 0 0 0 1 
i 7.134542 157.4985 0.5378755 55 70.49577 0 0.1 0 0 0 1 
i 7.870687 157.4985 0.5378755 64 71.70331 0 0.1 0 0 0 1 
i 6.353782 157.688 0.5378755 68 78.59975 0 0.1 0 0 0 1 
i 7.089927 157.688 0.5378755 61 79.8073 0 0.1 0 0 0 1 
i 10.45835 157.688 0.5378755 79 78.59975 0 0.1 0 0 0 1 
i 11.19449 157.688 0.5378755 73 79.8073 0 0.1 0 0 0 1 
i 4.691879 157.7868 0.5378755 83 78.79161 0 0.1 0 0 0 1 
i 5.059951 157.7868 0.5378755 77 79.39539 0 0.1 0 0 0 1 
i 5.550715 157.7868 0.5378755 86 80.20042 0 0.1 0 0 0 1 
i 6.164169 157.7868 0.5378755 91 81.20671 0 0.1 0 0 0 1 
i 8.796445 157.7868 0.5378755 94 78.79161 0 0.1 0 0 0 1 
i 9.164517 157.7868 0.5378755 89 79.39539 0 0.1 0 0 0 1 
i 9.655281 157.7868 0.5378755 97 80.20042 0 0.1 0 0 0 1 
i 10.26873 157.7868 0.5378755 103 81.20671 0 0.1 0 0 0 1 
i 2.784594 158.0364 0.5378755 46 70.09325 0 0.1 0 0 0 1 
i 4.011502 158.0364 0.5378755 55 72.10583 0 0.1 0 0 0 1 
i 6.88916 158.0364 0.5378755 57 70.09325 0 0.1 0 0 0 1 
i 8.116068 158.0364 0.5378755 66 72.10583 0 0.1 0 0 0 1 
i 4.569188 158.3247 0.5378755 81 78.59036 0 0.1 0 0 0 1 
i 5.182642 158.3247 0.5378755 76 79.59665 0 0.1 0 0 0 1 
i 5.673405 158.3247 0.5378755 85 80.40168 0 0.1 0 0 0 1 
i 6.041478 158.3247 0.5378755 90 81.00545 0 0.1 0 0 0 1 
i 8.673754 158.3247 0.5378755 93 78.59036 0 0.1 0 0 0 1 
i 9.287208 158.3247 0.5378755 88 79.59665 0 0.1 0 0 0 1 
i 9.777971 158.3247 0.5378755 96 80.40168 0 0.1 0 0 0 1 
i 10.14604 158.3247 0.5378755 102 81.00545 0 0.1 0 0 0 1 
i 6.415127 158.5525 0.5378755 89 78.69971 0 0.1 0 0 0 1 
i 6.599163 158.5525 0.5378755 82 79.00159 0 0.1 0 0 0 1 
i 6.844545 158.5525 0.5378755 92 79.40411 0 0.1 0 0 0 1 
i 7.151272 158.5525 0.5378755 98 79.90725 0 0.1 0 0 0 1 
i 10.51969 158.5525 0.5378755 100 78.69971 0 0.1 0 0 0 1 
i 10.70373 158.5525 0.5378755 94 79.00159 0 0.1 0 0 0 1 
i 10.94911 158.5525 0.5378755 103 79.40411 0 0.1 0 0 0 1 
i 11.25584 158.5525 0.5378755 109 79.90725 0 0.1 0 0 0 1 
i 2.845939 158.9646 0.5378755 46 70.19321 0 0.1 0 0 0 1 
i 3.029976 158.9646 0.5378755 43 70.49509 0 0.1 0 0 0 1 
i 3.766121 158.9646 1.075751 55 71.70264 0 0.1 0 0 0 1 
i 4.072848 158.9646 1.075751 58 72.20579 0 0.1 0 0 0 1 
i 6.950505 158.9646 1.075751 57 70.19321 0 0.1 0 0 0 1 
i 7.134542 158.9646 0.5378755 54 70.49509 0 0.1 0 0 0 1 
i 7.870687 158.9646 0.5378755 67 71.70264 0 0.1 0 0 0 1 
i 8.177414 158.9646 0.5378755 70 72.20579 0 0.1 0 0 0 1 
i 6.353782 159.0903 0.5378755 87 78.59908 0 0.1 0 0 0 1 
i 6.660509 159.0903 0.5378755 81 79.10222 0 0.1 0 0 0 1 
i 6.905891 159.0903 0.5378755 90 79.50474 0 0.1 0 0 0 1 
i 7.089927 159.0903 0.5378755 97 79.80662 0 0.1 0 0 0 1 
i 10.45835 159.0903 0.5378755 99 78.59908 0 0.1 0 0 0 1 
i 10.76507 159.0903 0.5378755 92 79.10222 0 0.1 0 0 0 1 
i 11.01046 159.0903 0.5378755 102 79.50474 0 0.1 0 0 0 1 
i 11.19449 159.0903 0.5378755 108 79.80662 0 0.1 0 0 0 1 
i 4.630533 159.1224 1.075751 82 78.69031 0 0.1 0 0 0 1 
i 4.691879 159.1224 1.075751 83 78.79094 0 0.1 0 0 0 1 
i 5.059951 159.1224 1.075751 77 79.39472 0 0.1 0 0 0 1 
i 5.243987 159.1224 1.075751 76 79.6966 0 0.1 0 0 0 1 
i 5.550715 159.1224 1.075751 85 80.19975 0 0.1 0 0 0 1 
i 5.734751 159.1224 0.5378755 84 80.50164 0 0.1 0 0 0 1 
i 6.102823 159.1224 0.5378755 90 81.10541 0 0.1 0 0 0 1 
i 6.164169 159.1224 1.075751 91 81.20604 0 0.1 0 0 0 1 
i 8.735099 159.1224 0.5378755 93 78.69031 0 0.1 0 0 0 1 
i 8.796445 159.1224 1.075751 94 78.79094 0 0.1 0 0 0 1 
i 9.164517 159.1224 1.075751 88 79.39472 0 0.1 0 0 0 1 
i 9.348554 159.1224 0.5378755 87 79.6966 0 0.1 0 0 0 1 
i 9.655281 159.1224 1.075751 97 80.19975 0 0.1 0 0 0 1 
i 9.839317 159.1224 1.075751 96 80.50164 0 0.1 0 0 0 1 
i 10.20739 159.1224 1.075751 102 81.10541 0 0.1 0 0 0 1 
i 10.26873 159.1224 1.075751 103 81.20604 0 0.1 0 0 0 1 
i 2.784594 159.5025 0.5378755 45 70.09258 0 0.1 0 0 0 1 
i 3.091321 159.5025 0.5378755 42 70.59572 0 0.1 0 0 0 1 
i 7.195887 159.5025 0.5378755 53 70.59572 0 0.1 0 0 0 1 
i 7.932032 159.5025 0.5378755 66 71.80327 0 0.1 0 0 0 1 
i 8.116068 159.5025 0.5378755 69 72.10516 0 0.1 0 0 0 1 
i 5.61206 159.6602 0.5378755 86 80.30038 0 0.1 0 0 0 1 
i 6.225514 159.6602 0.5378755 92 81.30667 0 0.1 0 0 0 1 
i 8.85779 159.6602 0.5378755 95 78.89157 0 0.1 0 0 0 1 
i 9.225863 159.6602 0.5378755 89 79.49535 0 0.1 0 0 0 1 
i 6.476473 159.989 0.5378755 68 78.79966 0 0.1 0 0 0 1 
i 6.599163 159.989 0.5378755 71 79.00092 0 0.1 0 0 0 1 
i 6.844545 159.989 0.5378755 65 79.40344 0 0.1 0 0 0 1 
i 7.212618 159.989 0.5378755 63 80.00721 0 0.1 0 0 0 1 
i 10.58104 159.989 0.5378755 79 78.79966 0 0.1 0 0 0 1 
i 10.70373 159.989 0.5378755 82 79.00092 0 0.1 0 0 0 1 
i 10.94911 159.989 0.5378755 77 79.40344 0 0.1 0 0 0 1 
i 11.31718 159.989 0.5378755 74 80.00721 0 0.1 0 0 0 1 
i 2.907285 160.4664 0.5378755 50 70.29317 0 0.1 0 0 0 1 
i 3.029976 160.4664 0.5378755 55 70.49442 0 0.1 0 0 0 1 
i 3.766121 160.4664 0.5378755 29 71.70197 0 0.1 0 0 0 1 
i 4.134193 160.4664 0.5378755 24 72.30574 0 0.1 0 0 0 1 
i 7.011851 160.4664 0.5378755 61 70.29317 0 0.1 0 0 0 1 
i 7.134542 160.4664 0.5378755 66 70.49442 0 0.1 0 0 0 1 
i 7.870687 160.4664 0.5378755 40 71.70197 0 0.1 0 0 0 1 
i 8.238759 160.4664 0.5378755 36 72.30574 0 0.1 0 0 0 1 
i 6.353782 160.5269 0.5378755 69 78.59841 0 0.1 0 0 0 1 
i 6.721854 160.5269 0.5378755 72 79.20218 0 0.1 0 0 0 1 
i 6.967236 160.5269 0.5378755 67 79.6047 0 0.1 0 0 0 1 
i 7.089927 160.5269 1.015285 64 79.80595 0 0.1 0 0 0 1 
i 10.45835 160.5269 0.5378755 81 78.59841 0 0.1 0 0 0 1 
i 10.82642 160.5269 0.5378755 84 79.20218 0 0.1 0 0 0 1 
i 11.0718 160.5269 0.5378755 78 79.6047 0 0.1 0 0 0 1 
i 11.19449 160.5269 0.5378755 76 79.80595 0 0.1 0 0 0 1 
i 4.81457 160.6599 0.5378755 83 78.99153 0 0.1 0 0 0 1 
i 5.059951 160.6599 0.5378755 78 79.39405 0 0.1 0 0 0 1 
i 5.550715 160.6599 0.5378755 87 80.19908 0 0.1 0 0 0 1 
i 6.28686 160.6599 0.5378755 91 81.40662 0 0.1 0 0 0 1 
i 8.919136 160.6599 0.5378755 94 78.99153 0 0.1 0 0 0 1 
i 9.164517 160.6599 0.5378755 90 79.39405 0 0.1 0 0 0 1 
i 9.655281 160.6599 0.5378755 98 80.19908 0 0.1 0 0 0 1 
i 10.39143 160.6599 0.5378755 103 81.40662 0 0.1 0 0 0 1 
i 2.784594 161.0043 0.5378755 53 70.09191 0 0.1 0 0 0 1 
i 3.152666 161.0043 0.5378755 57 70.69568 0 0.1 0 0 0 1 
i 3.888811 161.0043 0.5378755 32 71.90323 0 0.1 0 0 0 1 
i 4.011502 161.0043 0.5378755 27 72.10449 0 0.1 0 0 0 1 
i 7.257232 161.0043 1.396042 69 70.69568 0 0.1 0 0 0 1 
i 7.993377 161.0043 0.5378755 43 71.90323 0 0.1 0 0 0 1 
i 8.116068 161.0043 0.5378755 38 72.10449 0 0.1 0 0 0 1 
i 4.569188 161.1978 0.5378755 80 78.58901 0 0.1 0 0 0 1 
i 5.305333 161.1978 0.5378755 76 79.79656 0 0.1 0 0 0 1 
i 5.796096 161.1978 0.5378755 85 80.60159 0 0.1 0 0 0 1 
i 6.041478 161.1978 0.5378755 89 81.00411 0 0.1 0 0 0 1 
i 8.673754 161.1978 0.5378755 92 78.58901 0 0.1 0 0 0 1 
i 9.409899 161.1978 0.5378755 88 79.79656 0 0.1 0 0 0 1 
i 9.900662 161.1978 0.5378755 96 80.60159 0 0.1 0 0 0 1 
i 10.14604 161.1978 0.5378755 100 81.00411 0 0.1 0 0 0 1 
i 6.415127 161.3246 0.5378755 71 78.69836 0 0.1 0 0 0 1 
i 6.476473 161.3246 1.075751 70 78.79899 0 0.1 0 0 0 1 
i 6.599163 161.3246 1.075751 72 79.00025 0 0.1 0 0 0 1 
i 6.7832 161.3246 0.5378755 73 79.30214 0 0.1 0 0 0 1 
i 6.844545 161.3246 1.075751 67 79.40277 0 0.1 0 0 0 1 
i 7.151272 161.3246 1.075751 66 79.90591 0 0.1 0 0 0 1 
i 7.212618 161.3246 1.075751 65 80.00654 0 0.1 0 0 0 1 
i 10.51969 161.3246 0.5378755 82 78.69836 0 0.1 0 0 0 1 
i 10.58104 161.3246 1.075751 81 78.79899 0 0.1 0 0 0 1 
i 10.70373 161.3246 1.075751 83 79.00025 0 0.1 0 0 0 1 
i 10.88777 161.3246 1.075751 84 79.30214 0 0.1 0 0 0 1 
i 10.94911 161.3246 1.075751 79 79.40277 0 0.1 0 0 0 1 
i 11.13315 161.3246 0.5378755 80 79.70465 0 0.1 0 0 0 1 
i 11.25584 161.3246 1.075751 78 79.90591 0 0.1 0 0 0 1 
i 11.31718 161.3246 1.075751 77 80.00654 0 0.1 0 0 0 1 
i 6.660509 161.8625 0.5378755 71 79.10088 0 0.1 0 0 0 1 
i 6.967236 161.8625 0.5378755 68 79.60403 0 0.1 0 0 0 1 
i 10.45835 161.8625 0.5378755 82 78.59774 0 0.1 0 0 0 1 
i 11.37853 161.8625 0.5378755 76 80.10717 0 0.1 0 0 0 1 
i 2.845939 161.8627 1.075751 42 70.19187 0 0.1 0 0 0 1 
i 2.907285 161.8627 0.5378755 44 70.29249 0 0.1 0 0 0 1 
i 3.029976 161.8627 0.5378755 41 70.49375 0 0.1 0 0 0 1 
i 3.214012 161.8627 0.5378755 39 70.79564 0 0.1 0 0 0 1 
i 3.766121 161.8627 0.5378755 59 71.7013 0 0.1 0 0 0 1 
i 3.950157 161.8627 0.5378755 57 72.00319 0 0.1 0 0 0 1 
i 4.072848 161.8627 1.075751 60 72.20444 0 0.1 0 0 0 1 
i 4.134193 161.8627 0.5378755 62 72.30507 0 0.1 0 0 0 1 
i 6.950505 161.8627 0.5378755 54 70.19187 0 0.1 0 0 0 1 
i 7.011851 161.8627 1.075751 55 70.29249 0 0.1 0 0 0 1 
i 7.134542 161.8627 1.075751 52 70.49375 0 0.1 0 0 0 1 
i 7.318578 161.8627 0.5378755 51 70.79564 0 0.1 0 0 0 1 
i 7.870687 161.8627 1.075751 70 71.7013 0 0.1 0 0 0 1 
i 8.054723 161.8627 0.5378755 69 72.00319 0 0.1 0 0 0 1 
i 8.177414 161.8627 0.5378755 72 72.20444 0 0.1 0 0 0 1 
i 8.238759 161.8627 1.075751 73 72.30507 0 0.1 0 0 0 1 
i 4.630533 161.9955 1.075751 80 78.68897 0 0.1 0 0 0 1 
i 4.81457 161.9955 1.075751 83 78.99086 0 0.1 0 0 0 1 
i 5.059951 161.9955 0.5378755 78 79.39338 0 0.1 0 0 0 1 
i 5.366678 161.9955 1.075751 76 79.89652 0 0.1 0 0 0 1 
i 5.550715 161.9955 0.5378755 87 80.19841 0 0.1 0 0 0 1 
i 5.857442 161.9955 0.5378755 84 80.70155 0 0.1 0 0 0 1 
i 6.102823 161.9955 1.075751 88 81.10407 0 0.1 0 0 0 1 
i 6.28686 161.9955 0.5378755 91 81.40595 0 0.1 0 0 0 1 
i 8.735099 161.9955 0.5378755 91 78.68897 0 0.1 0 0 0 1 
i 8.919136 161.9955 0.5378755 94 78.99086 0 0.1 0 0 0 1 
i 9.164517 161.9955 1.075751 90 79.39338 0 0.1 0 0 0 1 
i 9.471244 161.9955 0.5378755 87 79.89652 0 0.1 0 0 0 1 
i 9.655281 161.9955 0.5378755 98 80.19841 0 0.1 0 0 0 1 
i 9.962008 161.9955 1.075751 96 80.70155 0 0.1 0 0 0 1 
i 10.20739 161.9955 1.075751 100 81.10407 0 0.1 0 0 0 1 
i 10.39143 161.9955 1.075751 103 81.40595 0 0.1 0 0 0 1 
i 2.784594 162.4006 0.5378755 43 70.09124 0 0.1 0 0 0 1 
i 2.96863 162.4006 0.5378755 45 70.39312 0 0.1 0 0 0 1 
i 3.152666 162.4006 0.5378755 40 70.69501 0 0.1 0 0 0 1 
i 3.888811 162.4006 0.5378755 58 71.90256 0 0.1 0 0 0 1 
i 4.011502 162.4006 0.5378755 61 72.10382 0 0.1 0 0 0 1 
i 4.195539 162.4006 0.5378755 63 72.4057 0 0.1 0 0 0 1 
i 7.073196 162.4006 0.5378755 56 70.39312 0 0.1 0 0 0 1 
i 7.195887 162.4006 0.5378755 53 70.59438 0 0.1 0 0 0 1 
i 7.932032 162.4006 0.5378755 71 71.80193 0 0.1 0 0 0 1 
i 8.300105 162.4006 0.5378755 74 72.4057 0 0.1 0 0 0 1 
i 5.121297 162.5333 0.5378755 79 79.494 0 0.1 0 0 0 1 
i 5.796096 162.5333 0.5378755 85 80.60092 0 0.1 0 0 0 1 
i 6.041478 162.5333 0.5378755 89 81.00344 0 0.1 0 0 0 1 
i 6.348205 162.5333 0.5378755 92 81.50658 0 0.1 0 0 0 1 
i 8.673754 162.5333 0.5378755 92 78.58834 0 0.1 0 0 0 1 
i 8.980481 162.5333 0.5378755 95 79.09149 0 0.1 0 0 0 1 
i 9.409899 162.5333 0.5378755 88 79.79589 0 0.1 0 0 0 1 
i 9.716626 162.5333 1.906027 99 80.29904 0 0.1 0 0 0 1 
i 4.691879 163.3636 0.5378755 80 78.78893 0 0.1 0 0 0 1 
i 4.81457 163.3636 0.5378755 82 78.99019 0 0.1 0 0 0 1 
i 5.059951 163.3636 0.5378755 78 79.3927 0 0.1 0 0 0 1 
i 5.428024 163.3636 0.5378755 76 79.99648 0 0.1 0 0 0 1 
i 5.550715 163.3636 0.5378755 86 80.19774 0 0.1 0 0 0 1 
i 5.918787 163.3636 0.5378755 84 80.80151 0 0.1 0 0 0 1 
i 6.164169 163.3636 1.075751 88 81.20403 0 0.1 0 0 0 1 
i 6.28686 163.3636 0.5378755 91 81.40528 0 0.1 0 0 0 1 
i 8.796445 163.3636 0.5378755 91 78.78893 0 0.1 0 0 0 1 
i 8.919136 163.3636 1.075751 93 78.99019 0 0.1 0 0 0 1 
i 9.164517 163.3636 0.5378755 89 79.3927 0 0.1 0 0 0 1 
i 9.53259 163.3636 0.5378755 87 79.99648 0 0.1 0 0 0 1 
i 9.655281 163.3636 0.5378755 98 80.19774 0 0.1 0 0 0 1 
i 10.02335 163.3636 0.5378755 96 80.80151 0 0.1 0 0 0 1 
i 10.26873 163.3636 0.5378755 100 81.20403 0 0.1 0 0 0 1 
i 10.39143 163.3636 0.5378755 102 81.40528 0 0.1 0 0 0 1 
i 3.275357 163.8063 0.5378755 51 70.8956 0 0.1 0 0 0 1 
i 3.766121 163.8063 0.5378755 42 71.70063 0 0.1 0 0 0 1 
i 7.379923 163.8063 0.5378755 62 70.8956 0 0.1 0 0 0 1 
i 7.870687 163.8063 0.5378755 53 71.70063 0 0.1 0 0 0 1 
i 7.335308 163.8229 0.5378755 71 80.20713 0 0.1 0 0 0 1 
i 11.43987 163.8229 0.5378755 82 80.20713 0 0.1 0 0 0 1 
i 4.569188 163.9015 0.5378755 81 78.58767 0 0.1 0 0 0 1 
i 4.93726 163.9015 0.5378755 83 79.19145 0 0.1 0 0 0 1 
i 5.182642 163.9015 0.5378755 79 79.59396 0 0.1 0 0 0 1 
i 5.305333 163.9015 0.5378755 77 79.79522 0 0.1 0 0 0 1 
i 5.796096 163.9015 0.5378755 85 80.60025 0 0.1 0 0 0 1 
i 6.041478 163.9015 0.5378755 90 81.00277 0 0.1 0 0 0 1 
i 6.40955 163.9015 0.5378755 92 81.60654 0 0.1 0 0 0 1 
i 9.041826 163.9015 0.5378755 95 79.19145 0 0.1 0 0 0 1 
i 9.287208 163.9015 0.5378755 90 79.59396 0 0.1 0 0 0 1 
i 9.409899 163.9015 0.5378755 88 79.79522 0 0.1 0 0 0 1 
i 9.900662 163.9015 0.5378755 97 80.60025 0 0.1 0 0 0 1 
i 10.14604 163.9015 0.5378755 101 81.00277 0 0.1 0 0 0 1 
i 10.51412 163.9015 0.5378755 103 81.60654 0 0.1 0 0 0 1 
i 2.784594 164.3442 0.5378755 46 70.09057 0 0.1 0 0 0 1 
i 4.256884 164.3442 0.5378755 37 72.50566 0 0.1 0 0 0 1 
i 6.88916 164.3442 0.5378755 58 70.09057 0 0.1 0 0 0 1 
i 8.36145 164.3442 0.5378755 49 72.50566 0 0.1 0 0 0 1 
i 6.353782 164.3608 0.5378755 76 78.59706 0 0.1 0 0 0 1 
i 10.45835 164.3608 0.5378755 88 78.59706 0 0.1 0 0 0 1 
i 4.630533 164.6356 1.075751 81 78.68763 0 0.1 0 0 0 1 
i 4.691879 164.6356 1.075751 80 78.78826 0 0.1 0 0 0 1 
i 4.81457 164.6356 1.075751 82 78.98952 0 0.1 0 0 0 1 
i 4.998606 164.6356 1.075751 83 79.2914 0 0.1 0 0 0 1 
i 5.059951 164.6356 1.075751 78 79.39203 0 0.1 0 0 0 1 
i 5.243987 164.6356 1.075751 79 79.69392 0 0.1 0 0 0 1 
i 5.366678 164.6356 0.5378755 77 79.89518 0 0.1 0 0 0 1 
i 5.428024 164.6356 1.075751 76 79.99581 0 0.1 0 0 0 1 
i 5.550715 164.6356 1.075751 87 80.19706 0 0.1 0 0 0 1 
i 5.734751 164.6356 1.075751 88 80.49895 0 0.1 0 0 0 1 
i 5.857442 164.6356 1.075751 86 80.70021 0 0.1 0 0 0 1 
i 5.918787 164.6356 1.075751 84 80.80084 0 0.1 0 0 0 1 
i 6.102823 164.6356 1.075751 90 81.10273 0 0.1 0 0 0 1 
i 6.164169 164.6356 1.075751 89 81.20335 0 0.1 0 0 0 1 
i 6.28686 164.6356 1.075751 91 81.40461 0 0.1 0 0 0 1 
i 6.470896 164.6356 0.5378755 92 81.7065 0 0.1 0 0 0 1 
i 8.735099 164.6356 1.075751 93 78.68763 0 0.1 0 0 0 1 
i 8.796445 164.6356 1.075751 92 78.78826 0 0.1 0 0 0 1 
i 8.919136 164.6356 1.075751 94 78.98952 0 0.1 0 0 0 1 
i 9.103172 164.6356 0.5378755 95 79.2914 0 0.1 0 0 0 1 
i 9.164517 164.6356 1.075751 90 79.39203 0 0.1 0 0 0 1 
i 9.348554 164.6356 1.075751 91 79.69392 0 0.1 0 0 0 1 
i 9.471244 164.6356 1.075751 88 79.89518 0 0.1 0 0 0 1 
i 9.53259 164.6356 1.075751 87 79.99581 0 0.1 0 0 0 1 
i 9.655281 164.6356 1.075751 98 80.19706 0 0.1 0 0 0 1 
i 9.839317 164.6356 1.075751 99 80.49895 0 0.1 0 0 0 1 
i 9.962008 164.6356 0.5378755 97 80.70021 0 0.1 0 0 0 1 
i 10.02335 164.6356 1.075751 96 80.80084 0 0.1 0 0 0 1 
i 10.20739 164.6356 1.075751 101 81.10273 0 0.1 0 0 0 1 
i 10.26873 164.6356 1.075751 100 81.20335 0 0.1 0 0 0 1 
i 10.39143 164.6356 1.075751 102 81.40461 0 0.1 0 0 0 1 
i 10.57546 164.6356 1.075751 103 81.7065 0 0.1 0 0 0 1 
i 5.489369 165.1735 0.5378755 75 80.09644 0 0.1 0 0 0 1 
i 5.796096 165.1735 0.5378755 85 80.59958 0 0.1 0 0 0 1 
i 9.225863 165.1735 0.5378755 89 79.49266 0 0.1 0 0 0 1 
i 10.0847 165.1735 0.5378755 95 80.90147 0 0.1 0 0 0 1 
i 2.845939 165.2724 1.075751 46 70.19052 0 0.1 0 0 0 1 
i 3.275357 165.2724 1.075751 51 70.89493 0 0.1 0 0 0 1 
i 3.766121 165.2724 1.075751 43 71.69996 0 0.1 0 0 0 1 
i 4.318229 165.2724 1.075751 38 72.60562 0 0.1 0 0 0 1 
i 6.950505 165.2724 0.5378755 57 70.19052 0 0.1 0 0 0 1 
i 7.379923 165.2724 0.5378755 62 70.89493 0 0.1 0 0 0 1 
i 7.870687 165.2724 0.5378755 54 71.69996 0 0.1 0 0 0 1 
i 8.422795 165.2724 0.5378755 49 72.60562 0 0.1 0 0 0 1 
i 6.415127 165.2954 0.5378755 78 78.69702 0 0.1 0 0 0 1 
i 7.335308 165.2954 1.075751 68 80.20646 0 0.1 0 0 0 1 
i 10.51969 165.2954 0.5378755 89 78.69702 0 0.1 0 0 0 1 
i 11.43987 165.2954 0.5378755 80 80.20646 0 0.1 0 0 0 1 
i 6.88916 165.8103 0.5378755 58 70.0899 0 0.1 0 0 0 1 
i 7.441269 165.8103 0.5378755 63 70.99556 0 0.1 0 0 0 1 
i 7.932032 165.8103 0.5378755 55 71.80059 0 0.1 0 0 0 1 
i 8.36145 165.8103 0.5378755 50 72.50499 0 0.1 0 0 0 1 
i 6.353782 165.8333 0.5378755 77 78.59639 0 0.1 0 0 0 1 
i 10.45835 165.8333 0.5378755 89 78.59639 0 0.1 0 0 0 1 
i 11.50122 165.8333 1.478834 79 80.30709 0 0.1 0 0 0 1 
i 2.907285 166.7742 0.5378755 51 70.29048 0 0.1 0 0 0 1 
i 3.275357 166.7742 0.5378755 40 70.89426 0 0.1 0 0 0 1 
i 3.766121 166.7742 0.5378755 58 71.69929 0 0.1 0 0 0 1 
i 4.379575 166.7742 0.5378755 69 72.70558 0 0.1 0 0 0 1 
i 7.011851 166.7742 0.5378755 63 70.29048 0 0.1 0 0 0 1 
i 7.379923 166.7742 0.5378755 51 70.89426 0 0.1 0 0 0 1 
i 7.870687 166.7742 0.5378755 69 71.69929 0 0.1 0 0 0 1 
i 8.484141 166.7742 0.5378755 81 72.70558 0 0.1 0 0 0 1 
i 6.476473 166.8038 0.5378755 70 78.79698 0 0.1 0 0 0 1 
i 7.335308 166.8038 0.5378755 91 80.20579 0 0.1 0 0 0 1 
i 10.58104 166.8038 0.5378755 81 78.79698 0 0.1 0 0 0 1 
i 11.43987 166.8038 0.5378755 102 80.20579 0 0.1 0 0 0 1 
i 2.784594 167.3121 0.5378755 48 70.08922 0 0.1 0 0 0 1 
i 3.398048 167.3121 0.5378755 37 71.09551 0 0.1 0 0 0 1 
i 3.888811 167.3121 0.5378755 55 71.90055 0 0.1 0 0 0 1 
i 4.256884 167.3121 0.5378755 67 72.50432 0 0.1 0 0 0 1 
i 6.88916 167.3121 0.5378755 60 70.08922 0 0.1 0 0 0 1 
i 7.502614 167.3121 0.5378755 48 71.09551 0 0.1 0 0 0 1 
i 7.993377 167.3121 0.5378755 67 71.90055 0 0.1 0 0 0 1 
i 8.36145 167.3121 0.5378755 78 72.50432 0 0.1 0 0 0 1 
i 6.353782 167.3417 0.5378755 72 78.59572 0 0.1 0 0 0 1 
i 7.457999 167.3417 0.5378755 93 80.40704 0 0.1 0 0 0 1 
i 10.45835 167.3417 0.5378755 84 78.59572 0 0.1 0 0 0 1 
i 11.56257 167.3417 1.366732 105 80.40704 0 0.1 0 0 0 1 
i 2.845939 168.1705 0.5378755 46 70.18918 0 0.1 0 0 0 1 
i 2.907285 168.1705 0.5378755 44 70.28981 0 0.1 0 0 0 1 
i 3.275357 168.1705 1.075751 54 70.89358 0 0.1 0 0 0 1 
i 3.459394 168.1705 0.5378755 55 71.19547 0 0.1 0 0 0 1 
i 3.766121 168.1705 0.5378755 40 71.69862 0 0.1 0 0 0 1 
i 3.950157 168.1705 0.5378755 42 72.0005 0 0.1 0 0 0 1 
i 4.318229 168.1705 0.5378755 32 72.60428 0 0.1 0 0 0 1 
i 4.379575 168.1705 1.075751 31 72.70491 0 0.1 0 0 0 1 
i 6.950505 168.1705 0.5378755 57 70.18918 0 0.1 0 0 0 1 
i 7.011851 168.1705 1.075751 55 70.28981 0 0.1 0 0 0 1 
i 7.379923 168.1705 0.5378755 65 70.89358 0 0.1 0 0 0 1 
i 7.56396 168.1705 0.5378755 67 71.19547 0 0.1 0 0 0 1 
i 7.870687 168.1705 1.075751 52 71.69862 0 0.1 0 0 0 1 
i 8.054723 168.1705 0.5378755 53 72.0005 0 0.1 0 0 0 1 
i 8.422795 168.1705 0.5378755 44 72.60428 0 0.1 0 0 0 1 
i 8.484141 168.1705 0.5378755 42 72.70491 0 0.1 0 0 0 1 
i 6.415127 168.2061 0.5378755 79 78.69568 0 0.1 0 0 0 1 
i 6.476473 168.2061 0.5378755 81 78.79631 0 0.1 0 0 0 1 
i 7.335308 168.2061 0.5378755 60 80.20512 0 0.1 0 0 0 1 
i 7.519345 168.2061 0.5378755 58 80.507 0 0.1 0 0 0 1 
i 10.51969 168.2061 0.5378755 91 78.69568 0 0.1 0 0 0 1 
i 10.58104 168.2061 0.5378755 93 78.79631 0 0.1 0 0 0 1 
i 11.43987 168.2061 0.5378755 72 80.20512 0 0.1 0 0 0 1 
i 11.62391 168.2061 0.5378755 70 80.507 0 0.1 0 0 0 1 
i 2.784594 168.7084 0.5378755 45 70.08855 0 0.1 0 0 0 1 
i 2.96863 168.7084 0.5378755 43 70.39044 0 0.1 0 0 0 1 
i 3.336703 168.7084 0.5378755 53 70.99421 0 0.1 0 0 0 1 
i 3.827466 168.7084 0.5378755 39 71.79925 0 0.1 0 0 0 1 
i 3.888811 168.7084 0.5378755 41 71.89987 0 0.1 0 0 0 1 
i 4.44092 168.7084 0.5378755 30 72.80553 0 0.1 0 0 0 1 
i 6.88916 168.7084 0.5378755 56 70.08855 0 0.1 0 0 0 1 
i 7.441269 168.7084 0.5378755 64 70.99421 0 0.1 0 0 0 1 
i 7.502614 168.7084 0.5378755 66 71.09484 0 0.1 0 0 0 1 
i 7.932032 168.7084 0.5378755 51 71.79925 0 0.1 0 0 0 1 
i 8.36145 168.7084 0.5378755 43 72.50365 0 0.1 0 0 0 1 
i 8.545486 168.7084 0.5378755 41 72.80553 0 0.1 0 0 0 1 
i 6.353782 168.744 0.5378755 80 78.59505 0 0.1 0 0 0 1 
i 6.537818 168.744 0.5378755 82 78.89694 0 0.1 0 0 0 1 
i 7.396654 168.744 0.5378755 61 80.30574 0 0.1 0 0 0 1 
i 7.457999 168.744 0.5378755 59 80.40637 0 0.1 0 0 0 1 
i 10.45835 168.744 0.5378755 92 78.59505 0 0.1 0 0 0 1 
i 10.64238 168.744 0.5378755 94 78.89694 0 0.1 0 0 0 1 
i 11.50122 168.744 0.5378755 73 80.30574 0 0.1 0 0 0 1 
i 11.56257 168.744 2.109682 71 80.40637 0 0.1 0 0 0 1 
i 3.029976 169.7779 1.075751 47 70.4904 0 0.1 0 0 0 1 
i 3.766121 169.7779 1.075751 48 71.69795 0 0.1 0 0 0 1 
i 4.502266 169.7779 0.5378755 49 72.90549 0 0.1 0 0 0 1 
i 7.134542 169.7779 0.5378755 59 70.4904 0 0.1 0 0 0 1 
i 7.379923 169.7779 1.075751 58 70.89291 0 0.1 0 0 0 1 
i 7.870687 169.7779 1.075751 60 71.69795 0 0.1 0 0 0 1 
i 8.606832 169.7779 0.5378755 60 72.90549 0 0.1 0 0 0 1 
i 6.599163 169.8206 0.5378755 73 78.9969 0 0.1 0 0 0 1 
i 7.335308 169.8206 0.5378755 81 80.20444 0 0.1 0 0 0 1 
i 10.70373 169.8206 0.5378755 84 78.9969 0 0.1 0 0 0 1 
i 11.43987 169.8206 0.5378755 93 80.20444 0 0.1 0 0 0 1 
i 3.520739 170.3158 0.5378755 46 71.29543 0 0.1 0 0 0 1 
i 7.625305 170.3158 0.5378755 58 71.29543 0 0.1 0 0 0 1 
i 8.116068 170.3158 0.5378755 59 72.10046 0 0.1 0 0 0 1 
i 6.353782 170.3584 0.5378755 75 78.59438 0 0.1 0 0 0 1 
i 7.58069 170.3584 0.5378755 83 80.60696 0 0.1 0 0 0 1 
i 10.45835 170.3584 0.5378755 86 78.59438 0 0.1 0 0 0 1 
i 11.68526 170.3584 1.353672 95 80.60696 0 0.1 0 0 0 1 
i 2.845939 171.1742 0.5378755 45 70.18784 0 0.1 0 0 0 1 
i 3.029976 171.1742 0.5378755 50 70.48973 0 0.1 0 0 0 1 
i 3.275357 171.1742 0.5378755 43 70.89224 0 0.1 0 0 0 1 
i 3.582084 171.1742 1.075751 38 71.39539 0 0.1 0 0 0 1 
i 3.766121 171.1742 0.5378755 58 71.69727 0 0.1 0 0 0 1 
i 4.072848 171.1742 0.5378755 53 72.20042 0 0.1 0 0 0 1 
i 4.318229 171.1742 0.5378755 60 72.60294 0 0.1 0 0 0 1 
i 4.502266 171.1742 0.5378755 66 72.90482 0 0.1 0 0 0 1 
i 6.950505 171.1742 0.5378755 57 70.18784 0 0.1 0 0 0 1 
i 7.134542 171.1742 0.5378755 62 70.48973 0 0.1 0 0 0 1 
i 7.379923 171.1742 0.5378755 54 70.89224 0 0.1 0 0 0 1 
i 7.68665 171.1742 0.5378755 49 71.39539 0 0.1 0 0 0 1 
i 7.870687 171.1742 1.075751 70 71.69727 0 0.1 0 0 0 1 
i 8.177414 171.1742 0.5378755 64 72.20042 0 0.1 0 0 0 1 
i 8.422795 171.1742 0.5378755 72 72.60294 0 0.1 0 0 0 1 
i 8.606832 171.1742 0.5378755 77 72.90482 0 0.1 0 0 0 1 
i 6.415127 171.2229 1.075751 74 78.69434 0 0.1 0 0 0 1 
i 6.599163 171.2229 1.075751 71 78.99623 0 0.1 0 0 0 1 
i 7.335308 171.2229 0.5378755 84 80.20377 0 0.1 0 0 0 1 
i 7.642036 171.2229 0.5378755 87 80.70692 0 0.1 0 0 0 1 
i 10.51969 171.2229 0.5378755 86 78.69434 0 0.1 0 0 0 1 
i 10.70373 171.2229 0.5378755 83 78.99623 0 0.1 0 0 0 1 
i 11.43987 171.2229 0.5378755 95 80.20377 0 0.1 0 0 0 1 
i 11.7466 171.2229 1.075751 98 80.70692 0 0.1 0 0 0 1 
i 2.784594 171.7121 0.5378755 46 70.08721 0 0.1 0 0 0 1 
i 3.091321 171.7121 0.5378755 51 70.59036 0 0.1 0 0 0 1 
i 3.336703 171.7121 0.5378755 44 70.99287 0 0.1 0 0 0 1 
i 3.827466 171.7121 0.5378755 59 71.7979 0 0.1 0 0 0 1 
i 4.011502 171.7121 0.5378755 54 72.09979 0 0.1 0 0 0 1 
i 4.256884 171.7121 0.5378755 61 72.50231 0 0.1 0 0 0 1 
i 4.563611 171.7121 0.5378755 67 73.00545 0 0.1 0 0 0 1 
i 6.88916 171.7121 0.5378755 58 70.08721 0 0.1 0 0 0 1 
i 7.195887 171.7121 0.5378755 63 70.59036 0 0.1 0 0 0 1 
i 7.441269 171.7121 0.5378755 55 70.99287 0 0.1 0 0 0 1 
i 7.625305 171.7121 0.5378755 50 71.29476 0 0.1 0 0 0 1 
i 8.116068 171.7121 0.5378755 65 72.09979 0 0.1 0 0 0 1 
i 8.36145 171.7121 0.5378755 73 72.50231 0 0.1 0 0 0 1 
i 8.668177 171.7121 0.5378755 78 73.00545 0 0.1 0 0 0 1 
i 7.396654 171.7608 0.5378755 83 80.3044 0 0.1 0 0 0 1 
i 7.58069 171.7608 0.5378755 86 80.60629 0 0.1 0 0 0 1 
i 10.45835 171.7608 0.5378755 85 78.59371 0 0.1 0 0 0 1 
i 10.76507 171.7608 0.5378755 82 79.09686 0 0.1 0 0 0 1 
i 11.50122 171.7608 1.381657 95 80.3044 0 0.1 0 0 0 1 
i 2.907285 172.6046 0.5378755 49 70.2878 0 0.1 0 0 0 1 
i 3.029976 172.6046 0.5378755 45 70.48906 0 0.1 0 0 0 1 
i 3.275357 172.6046 0.5378755 53 70.89157 0 0.1 0 0 0 1 
i 3.64343 172.6046 0.5378755 58 71.49535 0 0.1 0 0 0 1 
i 3.766121 172.6046 0.5378755 36 71.6966 0 0.1 0 0 0 1 
i 4.134193 172.6046 0.5378755 40 72.30038 0 0.1 0 0 0 1 
i 4.379575 172.6046 0.5378755 31 72.70289 0 0.1 0 0 0 1 
i 4.502266 172.6046 0.5378755 27 72.90415 0 0.1 0 0 0 1 
i 7.011851 172.6046 0.5378755 61 70.2878 0 0.1 0 0 0 1 
i 7.134542 172.6046 0.5378755 56 70.48906 0 0.1 0 0 0 1 
i 7.379923 172.6046 0.5378755 65 70.89157 0 0.1 0 0 0 1 
i 7.747996 172.6046 0.5378755 69 71.49535 0 0.1 0 0 0 1 
i 7.870687 172.6046 0.5378755 47 71.6966 0 0.1 0 0 0 1 
i 8.238759 172.6046 0.5378755 52 72.30038 0 0.1 0 0 0 1 
i 8.484141 172.6046 0.5378755 43 72.70289 0 0.1 0 0 0 1 
i 8.606832 172.6046 0.5378755 38 72.90415 0 0.1 0 0 0 1 
i 6.476473 172.6595 0.5378755 79 78.7943 0 0.1 0 0 0 1 
i 6.599163 172.6595 0.5378755 83 78.99556 0 0.1 0 0 0 1 
i 7.335308 172.6595 0.5378755 57 80.2031 0 0.1 0 0 0 1 
i 7.703381 172.6595 0.5378755 53 80.80688 0 0.1 0 0 0 1 
i 10.58104 172.6595 0.5378755 90 78.7943 0 0.1 0 0 0 1 
i 10.70373 172.6595 0.5378755 95 78.99556 0 0.1 0 0 0 1 
i 11.43987 172.6595 0.5378755 69 80.2031 0 0.1 0 0 0 1 
i 11.80795 172.6595 0.5378755 64 80.80688 0 0.1 0 0 0 1 
i 2.784594 173.1424 0.5378755 46 70.08654 0 0.1 0 0 0 1 
i 3.152666 173.1424 0.5378755 42 70.69031 0 0.1 0 0 0 1 
i 3.398048 173.1424 0.5378755 51 71.09283 0 0.1 0 0 0 1 
i 3.520739 173.1424 0.5378755 55 71.29409 0 0.1 0 0 0 1 
i 3.888811 173.1424 0.5378755 33 71.89786 0 0.1 0 0 0 1 
i 4.011502 173.1424 0.5378755 38 72.09912 0 0.1 0 0 0 1 
i 4.256884 173.1424 0.5378755 29 72.50164 0 0.1 0 0 0 1 
i 4.624956 173.1424 0.5378755 24 73.10541 0 0.1 0 0 0 1 
i 6.88916 173.1424 0.5378755 58 70.08654 0 0.1 0 0 0 1 
i 7.257232 173.1424 0.5378755 53 70.69031 0 0.1 0 0 0 1 
i 7.502614 173.1424 0.5378755 62 71.09283 0 0.1 0 0 0 1 
i 7.625305 173.1424 0.5378755 67 71.29409 0 0.1 0 0 0 1 
i 7.993377 173.1424 0.5378755 45 71.89786 0 0.1 0 0 0 1 
i 8.116068 173.1424 0.5378755 49 72.09912 0 0.1 0 0 0 1 
i 8.36145 173.1424 0.5378755 40 72.50164 0 0.1 0 0 0 1 
i 8.729522 173.1424 0.5378755 36 73.10541 0 0.1 0 0 0 1 
i 6.353782 173.1973 0.5378755 81 78.59304 0 0.1 0 0 0 1 
i 6.721854 173.1973 0.5378755 86 79.19681 0 0.1 0 0 0 1 
i 7.457999 173.1973 0.5378755 60 80.40436 0 0.1 0 0 0 1 
i 7.58069 173.1973 0.5378755 55 80.60562 0 0.1 0 0 0 1 
i 10.45835 173.1973 0.5378755 93 78.59304 0 0.1 0 0 0 1 
i 10.82642 173.1973 0.5378755 97 79.19681 0 0.1 0 0 0 1 
i 11.56257 173.1973 0.5378755 72 80.40436 0 0.1 0 0 0 1 
i 11.68526 173.1973 1.812768 67 80.60562 0 0.1 0 0 0 1 
i 2.845939 173.9344 1.075751 47 70.1865 0 0.1 0 0 0 1 
i 3.582084 173.9344 1.075751 46 71.39405 0 0.1 0 0 0 1 
i 3.766121 173.9344 1.075751 48 71.69593 0 0.1 0 0 0 1 
i 4.502266 173.9344 1.075751 49 72.90348 0 0.1 0 0 0 1 
i 6.950505 173.9344 1.075751 59 70.1865 0 0.1 0 0 0 1 
i 7.011851 173.9344 1.075751 58 70.28713 0 0.1 0 0 0 1 
i 7.56396 173.9344 1.075751 58 71.19279 0 0.1 0 0 0 1 
i 7.870687 173.9344 1.075751 59 71.69593 0 0.1 0 0 0 1 
i 8.054723 173.9344 1.075751 60 71.99782 0 0.1 0 0 0 1 
i 8.606832 173.9344 1.075751 60 72.90348 0 0.1 0 0 0 1 
i 6.415127 173.9951 0.5378755 71 78.693 0 0.1 0 0 0 1 
i 6.476473 173.9951 0.5378755 73 78.79363 0 0.1 0 0 0 1 
i 6.599163 173.9951 1.075751 70 78.99488 0 0.1 0 0 0 1 
i 6.7832 173.9951 0.5378755 68 79.29677 0 0.1 0 0 0 1 
i 7.335308 173.9951 1.075751 87 80.20243 0 0.1 0 0 0 1 
i 7.519345 173.9951 0.5378755 86 80.50432 0 0.1 0 0 0 1 
i 7.642036 173.9951 0.5378755 89 80.70558 0 0.1 0 0 0 1 
i 7.703381 173.9951 1.075751 90 80.80621 0 0.1 0 0 0 1 
i 10.51969 173.9951 0.5378755 83 78.693 0 0.1 0 0 0 1 
i 10.58104 173.9951 0.5378755 84 78.79363 0 0.1 0 0 0 1 
i 10.70373 173.9951 0.5378755 81 78.99488 0 0.1 0 0 0 1 
i 10.88777 173.9951 1.075751 80 79.29677 0 0.1 0 0 0 1 
i 11.43987 173.9951 0.5378755 99 80.20243 0 0.1 0 0 0 1 
i 11.62391 173.9951 0.5378755 97 80.50432 0 0.1 0 0 0 1 
i 11.7466 173.9951 1.075751 100 80.70558 0 0.1 0 0 0 1 
i 11.80795 173.9951 0.5378755 102 80.80621 0 0.1 0 0 0 1 
i 3.336703 174.4722 0.5378755 46 70.99153 0 0.1 0 0 0 1 
i 4.195539 174.4722 0.5378755 47 72.40034 0 0.1 0 0 0 1 
i 6.353782 174.5329 0.5378755 72 78.59237 0 0.1 0 0 0 1 
i 6.537818 174.5329 0.5378755 73 78.89426 0 0.1 0 0 0 1 
i 6.721854 174.5329 0.5378755 69 79.19614 0 0.1 0 0 0 1 
i 7.396654 174.5329 0.5378755 88 80.30306 0 0.1 0 0 0 1 
i 7.764726 174.5329 0.5378755 91 80.90683 0 0.1 0 0 0 1 
i 10.45835 174.5329 0.5378755 83 78.59237 0 0.1 0 0 0 1 
i 10.64238 174.5329 0.5378755 85 78.89426 0 0.1 0 0 0 1 
i 10.76507 174.5329 0.5378755 82 79.09551 0 0.1 0 0 0 1 
i 11.56257 174.5329 0.5378755 98 80.40369 0 0.1 0 0 0 1 
i 11.68526 174.5329 0.5378755 101 80.60495 0 0.1 0 0 0 1 
i 11.86929 174.5329 1.859057 103 80.90683 0 0.1 0 0 0 1 
i 6.844545 175.8541 0.5378755 79 79.39673 0 0.1 0 0 0 1 
i 7.335308 175.8541 0.5378755 70 80.20176 0 0.1 0 0 0 1 
i 10.94911 175.8541 0.5378755 91 79.39673 0 0.1 0 0 0 1 
i 11.43987 175.8541 0.5378755 82 80.20176 0 0.1 0 0 0 1 
i 6.353782 176.392 0.5378755 75 78.5917 0 0.1 0 0 0 1 
i 7.826072 176.392 0.5378755 66 81.00679 0 0.1 0 0 0 1 
i 10.45835 176.392 0.5378755 86 78.5917 0 0.1 0 0 0 1 
i 11.93064 176.392 1.402355 77 81.00679 0 0.1 0 0 0 1 
i 6.415127 177.2565 0.5378755 74 78.69166 0 0.1 0 0 0 1 
i 6.844545 177.2565 0.5378755 79 79.39606 0 0.1 0 0 0 1 
i 7.335308 177.2565 0.5378755 71 80.20109 0 0.1 0 0 0 1 
i 7.887417 177.2565 0.5378755 66 81.10675 0 0.1 0 0 0 1 
i 10.51969 177.2565 0.5378755 86 78.69166 0 0.1 0 0 0 1 
i 10.94911 177.2565 1.075751 91 79.39606 0 0.1 0 0 0 1 
i 11.43987 177.2565 0.5378755 83 80.20109 0 0.1 0 0 0 1 
i 11.99198 177.2565 1.075751 78 81.10675 0 0.1 0 0 0 1 
i 6.353782 177.7943 0.5378755 75 78.59103 0 0.1 0 0 0 1 
i 6.905891 177.7943 0.5378755 80 79.49669 0 0.1 0 0 0 1 
i 7.396654 177.7943 0.5378755 72 80.30172 0 0.1 0 0 0 1 
i 7.826072 177.7943 0.5378755 67 81.00612 0 0.1 0 0 0 1 
i 10.45835 177.7943 0.5378755 86 78.59103 0 0.1 0 0 0 1 
i 11.50122 177.7943 1.436559 83 80.30172 0 0.1 0 0 0 1 
i 6.476473 178.693 0.5378755 80 78.79161 0 0.1 0 0 0 1 
i 6.844545 178.693 0.5378755 68 79.39539 0 0.1 0 0 0 1 
i 7.335308 178.693 0.5378755 86 80.20042 0 0.1 0 0 0 1 
i 7.948763 178.693 0.5378755 98 81.20671 0 0.1 0 0 0 1 
i 10.58104 178.693 0.5378755 91 78.79161 0 0.1 0 0 0 1 
i 10.94911 178.693 0.5378755 80 79.39539 0 0.1 0 0 0 1 
i 11.43987 178.693 0.5378755 98 80.20042 0 0.1 0 0 0 1 
i 12.05333 178.693 0.5378755 109 81.20671 0 0.1 0 0 0 1 
i 6.353782 179.2309 0.5378755 77 78.59036 0 0.1 0 0 0 1 
i 6.967236 179.2309 0.5378755 65 79.59665 0 0.1 0 0 0 1 
i 7.457999 179.2309 0.5378755 84 80.40168 0 0.1 0 0 0 1 
i 7.826072 179.2309 0.5378755 95 81.00545 0 0.1 0 0 0 1 
i 10.45835 179.2309 0.5378755 88 78.59036 0 0.1 0 0 0 1 
i 11.0718 179.2309 0.5378755 77 79.59665 0 0.1 0 0 0 1 
i 11.56257 179.2309 0.5378755 95 80.40168 0 0.1 0 0 0 1 
i 11.93064 179.2309 1.335576 107 81.00545 0 0.1 0 0 0 1 
i 6.415127 180.0286 0.5378755 74 78.69031 0 0.1 0 0 0 1 
i 6.476473 180.0286 1.075751 73 78.79094 0 0.1 0 0 0 1 
i 6.844545 180.0286 0.5378755 82 79.39472 0 0.1 0 0 0 1 
i 7.028581 180.0286 0.5378755 84 79.6966 0 0.1 0 0 0 1 
i 7.335308 180.0286 0.5378755 69 80.19975 0 0.1 0 0 0 1 
i 7.519345 180.0286 0.5378755 70 80.50164 0 0.1 0 0 0 1 
i 7.887417 180.0286 0.5378755 61 81.10541 0 0.1 0 0 0 1 
i 7.948763 180.0286 0.5378755 59 81.20604 0 0.1 0 0 0 1 
i 10.51969 180.0286 0.5378755 86 78.69031 0 0.1 0 0 0 1 
i 10.58104 180.0286 0.5378755 84 78.79094 0 0.1 0 0 0 1 
i 10.94911 180.0286 1.075751 94 79.39472 0 0.1 0 0 0 1 
i 11.13315 180.0286 0.5378755 95 79.6966 0 0.1 0 0 0 1 
i 11.43987 180.0286 0.5378755 80 80.19975 0 0.1 0 0 0 1 
i 11.62391 180.0286 0.5378755 82 80.50164 0 0.1 0 0 0 1 
i 11.99198 180.0286 0.5378755 72 81.10541 0 0.1 0 0 0 1 
i 12.05333 180.0286 1.075751 71 81.20604 0 0.1 0 0 0 1 
i 6.537818 180.5665 0.5378755 72 78.89157 0 0.1 0 0 0 1 
i 6.905891 180.5665 0.5378755 81 79.49535 0 0.1 0 0 0 1 
i 6.967236 180.5665 0.5378755 83 79.59597 0 0.1 0 0 0 1 
i 7.396654 180.5665 0.5378755 68 80.30038 0 0.1 0 0 0 1 
i 7.457999 180.5665 0.5378755 70 80.40101 0 0.1 0 0 0 1 
i 7.826072 180.5665 0.5378755 60 81.00478 0 0.1 0 0 0 1 
i 8.010108 180.5665 0.5378755 58 81.30667 0 0.1 0 0 0 1 
i 10.45835 180.5665 0.5378755 85 78.58969 0 0.1 0 0 0 1 
i 10.64238 180.5665 0.5378755 83 78.89157 0 0.1 0 0 0 1 
i 11.01046 180.5665 0.5378755 93 79.49535 0 0.1 0 0 0 1 
i 11.50122 180.5665 0.5378755 79 80.30038 0 0.1 0 0 0 1 
i 11.56257 180.5665 0.5378755 81 80.40101 0 0.1 0 0 0 1 
i 12.11467 180.5665 1.537542 70 81.30667 0 0.1 0 0 0 1 
i 6.599163 181.5661 0.5378755 76 78.99153 0 0.1 0 0 0 1 
i 6.844545 181.5661 1.075751 75 79.39405 0 0.1 0 0 0 1 
i 7.335308 181.5661 0.5378755 77 80.19908 0 0.1 0 0 0 1 
i 8.071453 181.5661 1.075751 77 81.40662 0 0.1 0 0 0 1 
i 10.70373 181.5661 0.5378755 87 78.99153 0 0.1 0 0 0 1 
i 11.43987 181.5661 0.5378755 88 80.19908 0 0.1 0 0 0 1 
i 12.17602 181.5661 0.5378755 89 81.40662 0 0.1 0 0 0 1 
i 6.353782 182.104 0.5378755 75 78.58901 0 0.1 0 0 0 1 
i 7.58069 182.104 0.5378755 76 80.60159 0 0.1 0 0 0 1 
i 10.45835 182.104 0.5378755 87 78.58901 0 0.1 0 0 0 1 
i 11.19449 182.104 0.5378755 86 79.79656 0 0.1 0 0 0 1 
i 11.68526 182.104 1.335576 88 80.60159 0 0.1 0 0 0 1 
i 6.415127 182.9017 0.5378755 74 78.68897 0 0.1 0 0 0 1 
i 6.599163 182.9017 0.5378755 79 78.99086 0 0.1 0 0 0 1 
i 6.844545 182.9017 0.5378755 71 79.39338 0 0.1 0 0 0 1 
i 7.151272 182.9017 0.5378755 66 79.89652 0 0.1 0 0 0 1 
i 7.335308 182.9017 0.5378755 87 80.19841 0 0.1 0 0 0 1 
i 7.642036 182.9017 0.5378755 81 80.70155 0 0.1 0 0 0 1 
i 7.887417 182.9017 0.5378755 89 81.10407 0 0.1 0 0 0 1 
i 8.071453 182.9017 0.5378755 94 81.40595 0 0.1 0 0 0 1 
i 10.51969 182.9017 0.5378755 85 78.68897 0 0.1 0 0 0 1 
i 10.70373 182.9017 0.5378755 90 78.99086 0 0.1 0 0 0 1 
i 10.94911 182.9017 0.5378755 83 79.39338 0 0.1 0 0 0 1 
i 11.25584 182.9017 0.5378755 78 79.89652 0 0.1 0 0 0 1 
i 11.43987 182.9017 0.5378755 98 80.19841 0 0.1 0 0 0 1 
i 11.7466 182.9017 0.5378755 93 80.70155 0 0.1 0 0 0 1 
i 11.99198 182.9017 0.5378755 101 81.10407 0 0.1 0 0 0 1 
i 12.17602 182.9017 0.5378755 106 81.40595 0 0.1 0 0 0 1 
i 6.353782 183.4396 0.5378755 75 78.58834 0 0.1 0 0 0 1 
i 6.660509 183.4396 0.5378755 80 79.09149 0 0.1 0 0 0 1 
i 6.905891 183.4396 0.5378755 72 79.494 0 0.1 0 0 0 1 
i 7.089927 183.4396 0.5378755 67 79.79589 0 0.1 0 0 0 1 
i 7.396654 183.4396 0.5378755 88 80.29904 0 0.1 0 0 0 1 
i 7.58069 183.4396 0.5378755 82 80.60092 0 0.1 0 0 0 1 
i 7.826072 183.4396 0.5378755 90 81.00344 0 0.1 0 0 0 1 
i 8.132799 183.4396 0.5378755 95 81.50658 0 0.1 0 0 0 1 
i 10.45835 183.4396 0.5378755 86 78.58834 0 0.1 0 0 0 1 
i 10.76507 183.4396 0.5378755 91 79.09149 0 0.1 0 0 0 1 
i 11.01046 183.4396 0.5378755 84 79.494 0 0.1 0 0 0 1 
i 11.19449 183.4396 0.5378755 79 79.79589 0 0.1 0 0 0 1 
i 11.50122 183.4396 0.5378755 99 80.29904 0 0.1 0 0 0 1 
i 11.68526 183.4396 0.5378755 94 80.60092 0 0.1 0 0 0 1 
i 11.93064 183.4396 0.5378755 102 81.00344 0 0.1 0 0 0 1 
i 12.23736 183.4396 0.5378755 107 81.50658 0 0.1 0 0 0 1 
i 2.784594 183.7293 0.7171673 48 70.06373 0 0.1 0 0 0 1 
i 10.99373 183.7293 0.7171673 71 70.06373 0 0.1 0 0 0 1 
i 6.476473 184.2699 0.5378755 78 78.78893 0 0.1 0 0 0 1 
i 6.599163 184.2699 0.5378755 73 78.99019 0 0.1 0 0 0 1 
i 6.844545 184.2699 0.5378755 82 79.3927 0 0.1 0 0 0 1 
i 7.212618 184.2699 0.5378755 86 79.99648 0 0.1 0 0 0 1 
i 7.335308 184.2699 0.5378755 64 80.19774 0 0.1 0 0 0 1 
i 7.703381 184.2699 0.5378755 69 80.80151 0 0.1 0 0 0 1 
i 7.948763 184.2699 0.5378755 60 81.20403 0 0.1 0 0 0 1 
i 8.071453 184.2699 0.5378755 56 81.40528 0 0.1 0 0 0 1 
i 10.58104 184.2699 0.5378755 89 78.78893 0 0.1 0 0 0 1 
i 10.70373 184.2699 0.5378755 85 78.99019 0 0.1 0 0 0 1 
i 10.94911 184.2699 0.5378755 93 79.3927 0 0.1 0 0 0 1 
i 11.31718 184.2699 0.5378755 98 79.99648 0 0.1 0 0 0 1 
i 11.43987 184.2699 0.5378755 76 80.19774 0 0.1 0 0 0 1 
i 11.80795 184.2699 0.5378755 80 80.80151 0 0.1 0 0 0 1 
i 12.05333 184.2699 0.5378755 71 81.20403 0 0.1 0 0 0 1 
i 12.17602 184.2699 0.5378755 67 81.40528 0 0.1 0 0 0 1 
i 2.845939 184.6285 1.434335 49 70.16369 0 0.1 0 0 0 1 
i 11.05507 184.6285 1.434335 72 70.16369 0 0.1 0 0 0 1 
i 6.353782 184.8077 0.5378755 75 78.58767 0 0.1 0 0 0 1 
i 6.721854 184.8077 0.5378755 71 79.19145 0 0.1 0 0 0 1 
i 6.967236 184.8077 0.5378755 79 79.59396 0 0.1 0 0 0 1 
i 7.089927 184.8077 0.5378755 84 79.79522 0 0.1 0 0 0 1 
i 7.457999 184.8077 0.5378755 62 80.39899 0 0.1 0 0 0 1 
i 7.58069 184.8077 0.5378755 66 80.60025 0 0.1 0 0 0 1 
i 7.826072 184.8077 0.5378755 57 81.00277 0 0.1 0 0 0 1 
i 8.194144 184.8077 0.5378755 53 81.60654 0 0.1 0 0 0 1 
i 10.45835 184.8077 0.5378755 86 78.58767 0 0.1 0 0 0 1 
i 10.82642 184.8077 0.5378755 82 79.19145 0 0.1 0 0 0 1 
i 11.0718 184.8077 0.5378755 91 79.59396 0 0.1 0 0 0 1 
i 11.19449 184.8077 0.5378755 95 79.79522 0 0.1 0 0 0 1 
i 11.56257 184.8077 0.5378755 73 80.39899 0 0.1 0 0 0 1 
i 11.68526 184.8077 0.5378755 78 80.60025 0 0.1 0 0 0 1 
i 11.93064 184.8077 0.5378755 69 81.00277 0 0.1 0 0 0 1 
i 12.29871 184.8077 1.809853 64 81.60654 0 0.1 0 0 0 1 
i 6.415127 185.5418 1.075751 76 78.68763 0 0.1 0 0 0 1 
i 6.476473 185.5418 0.5378755 75 78.78826 0 0.1 0 0 0 1 
i 6.599163 185.5418 1.075751 76 78.98952 0 0.1 0 0 0 1 
i 6.844545 185.5418 1.075751 75 79.39203 0 0.1 0 0 0 1 
i 7.519345 185.5418 1.075751 77 80.49895 0 0.1 0 0 0 1 
i 7.642036 185.5418 1.075751 76 80.70021 0 0.1 0 0 0 1 
i 10.51969 185.5418 1.075751 87 78.68763 0 0.1 0 0 0 1 
i 11.25584 185.5418 1.075751 86 79.89518 0 0.1 0 0 0 1 
i 11.43987 185.5418 0.5378755 88 80.19706 0 0.1 0 0 0 1 
i 11.62391 185.5418 1.075751 88 80.49895 0 0.1 0 0 0 1 
i 11.99198 185.5418 1.075751 89 81.10273 0 0.1 0 0 0 1 
i 7.457999 186.0797 0.5378755 77 80.39832 0 0.1 0 0 0 1 
i 10.45835 186.0797 0.5378755 87 78.587 0 0.1 0 0 0 1 
i 2.907285 186.2843 0.7171673 51 70.26365 0 0.1 0 0 0 1 
i 11.11642 186.2843 0.7171673 74 70.26365 0 0.1 0 0 0 1 
i 2.784594 187.0015 0.7171673 49 70.06239 0 0.1 0 0 0 1 
i 10.99373 187.0015 1.539404 72 70.06239 0 0.1 0 0 0 1 
i 2.845939 187.8237 0.7171673 50 70.16235 0 0.1 0 0 0 1 
i 2.907285 187.8237 1.434335 51 70.26298 0 0.1 0 0 0 1 
i 11.05507 187.8237 0.7171673 73 70.16235 0 0.1 0 0 0 1 
i 11.11642 187.8237 1.434335 74 70.26298 0 0.1 0 0 0 1 
i 2.96863 188.5409 0.7171673 52 70.36361 0 0.1 0 0 0 1 
i 11.17776 188.5409 1.772191 75 70.36361 0 0.1 0 0 0 1 
i 3.029976 189.5959 0.7171673 52 70.46356 0 0.1 0 0 0 1 
i 2.784594 190.3131 0.7171673 50 70.06105 0 0.1 0 0 0 1 
i 10.99373 190.3131 2.256571 73 70.06105 0 0.1 0 0 0 1 
i 2.845939 191.1353 1.434335 50 70.16101 0 0.1 0 0 0 1 
i 3.029976 191.1353 0.7171673 53 70.46289 0 0.1 0 0 0 1 
i 11.23911 191.1353 0.7171673 76 70.46289 0 0.1 0 0 0 1 
i 3.091321 191.8525 0.7171673 54 70.56352 0 0.1 0 0 0 1 
i 11.30045 191.8525 2.294117 77 70.56352 0 0.1 0 0 0 1 
i 2.907285 192.7123 0.7171673 51 70.26096 0 0.1 0 0 0 1 
i 3.029976 192.7123 0.7171673 53 70.46222 0 0.1 0 0 0 1 
i 11.11642 192.7123 0.7171673 74 70.26096 0 0.1 0 0 0 1 
i 11.23911 192.7123 0.7171673 76 70.46222 0 0.1 0 0 0 1 
i 4.569188 193.2998 0.7171673 62 74.3143 0 0.1 0 0 0 1 
i 12.77832 193.2998 0.7171673 85 74.3143 0 0.1 0 0 0 1 
i 2.784594 193.4294 0.7171673 52 70.05971 0 0.1 0 0 0 1 
i 3.152666 193.4294 0.7171673 54 70.66348 0 0.1 0 0 0 1 
i 10.99373 193.4294 0.7171673 75 70.05971 0 0.1 0 0 0 1 
i 4.630533 194.1287 0.7171673 64 74.41426 0 0.1 0 0 0 1 
i 12.83967 194.1287 0.7171673 87 74.41426 0 0.1 0 0 0 1 
i 2.845939 194.1784 1.434335 53 70.15966 0 0.1 0 0 0 1 
i 2.907285 194.1784 1.434335 52 70.26029 0 0.1 0 0 0 1 
i 3.029976 194.1784 0.7171673 54 70.46155 0 0.1 0 0 0 1 
i 3.214012 194.1784 1.434335 55 70.76344 0 0.1 0 0 0 1 
i 11.05507 194.1784 1.434335 76 70.15966 0 0.1 0 0 0 1 
i 11.11642 194.1784 1.434335 75 70.26029 0 0.1 0 0 0 1 
i 11.23911 194.1784 0.7171673 77 70.46155 0 0.1 0 0 0 1 
i 11.42314 194.1784 1.434335 78 70.76344 0 0.1 0 0 0 1 
i 4.569188 194.8459 0.7171673 63 74.31363 0 0.1 0 0 0 1 
i 12.77832 194.8459 0.7171673 86 74.31363 0 0.1 0 0 0 1 
i 2.96863 194.8955 0.7171673 51 70.36092 0 0.1 0 0 0 1 
i 11.17776 194.8955 1.534194 74 70.36092 0 0.1 0 0 0 1 
i 4.691879 195.7125 0.7171673 65 74.51421 0 0.1 0 0 0 1 
i 12.90101 195.7125 0.7171673 88 74.51421 0 0.1 0 0 0 1 
i 3.275357 196.2191 0.7171673 54 70.8634 0 0.1 0 0 0 1 
i 11.48449 196.2191 0.7171673 77 70.8634 0 0.1 0 0 0 1 
i 4.569188 196.4297 0.7171673 63 74.31296 0 0.1 0 0 0 1 
i 12.77832 196.4297 0.7171673 86 74.31296 0 0.1 0 0 0 1 
i 2.784594 196.9363 0.7171673 49 70.05836 0 0.1 0 0 0 1 
i 10.99373 196.9363 0.7171673 72 70.05836 0 0.1 0 0 0 1 
i 4.630533 197.185 0.7171673 64 74.41291 0 0.1 0 0 0 1 
i 4.691879 197.185 1.434335 66 74.51354 0 0.1 0 0 0 1 
i 12.83967 197.185 0.7171673 87 74.41291 0 0.1 0 0 0 1 
i 12.90101 197.185 1.434335 89 74.51354 0 0.1 0 0 0 1 
i 2.845939 197.7585 1.434335 49 70.15832 0 0.1 0 0 0 1 
i 3.275357 197.7585 1.434335 55 70.86273 0 0.1 0 0 0 1 
i 11.05507 197.7585 1.434335 72 70.15832 0 0.1 0 0 0 1 
i 11.48449 197.7585 0.7171673 78 70.86273 0 0.1 0 0 0 1 
i 4.569188 197.9022 0.7171673 65 74.31229 0 0.1 0 0 0 1 
i 12.77832 197.9022 0.7171673 88 74.31229 0 0.1 0 0 0 1 
i 11.54583 198.4757 0.7171673 78 70.96335 0 0.1 0 0 0 1 
i 4.81457 198.8802 0.7171673 66 74.71413 0 0.1 0 0 0 1 
i 13.0237 198.8802 0.7171673 89 74.71413 0 0.1 0 0 0 1 
i 2.907285 199.3354 0.7171673 49 70.25828 0 0.1 0 0 0 1 
i 3.275357 199.3354 0.7171673 55 70.86205 0 0.1 0 0 0 1 
i 11.11642 199.3354 0.7171673 72 70.25828 0 0.1 0 0 0 1 
i 11.48449 199.3354 0.7171673 78 70.86205 0 0.1 0 0 0 1 
i 4.569188 199.5973 0.7171673 64 74.31161 0 0.1 0 0 0 1 
i 12.77832 199.5973 0.7171673 87 74.31161 0 0.1 0 0 0 1 
i 2.784594 200.0526 0.7171673 50 70.05702 0 0.1 0 0 0 1 
i 3.398048 200.0526 0.7171673 56 71.06331 0 0.1 0 0 0 1 
i 10.99373 200.0526 0.7171673 73 70.05702 0 0.1 0 0 0 1 
i 11.60718 200.0526 0.7171673 79 71.06331 0 0.1 0 0 0 1 
i 4.630533 200.3526 0.7171673 64 74.41157 0 0.1 0 0 0 1 
i 4.81457 200.3526 0.7171673 67 74.71346 0 0.1 0 0 0 1 
i 12.83967 200.3526 0.7171673 87 74.41157 0 0.1 0 0 0 1 
i 13.0237 200.3526 0.7171673 90 74.71346 0 0.1 0 0 0 1 
i 2.845939 200.8015 1.434335 50 70.15698 0 0.1 0 0 0 1 
i 2.907285 200.8015 0.7171673 49 70.25761 0 0.1 0 0 0 1 
i 3.275357 200.8015 1.434335 56 70.86138 0 0.1 0 0 0 1 
i 3.459394 200.8015 0.7171673 57 71.16327 0 0.1 0 0 0 1 
i 11.05507 200.8015 1.434335 73 70.15698 0 0.1 0 0 0 1 
i 11.11642 200.8015 0.7171673 72 70.25761 0 0.1 0 0 0 1 
i 11.48449 200.8015 0.7171673 79 70.86138 0 0.1 0 0 0 1 
i 11.66853 200.8015 0.7171673 80 71.16327 0 0.1 0 0 0 1 
i 4.569188 201.0698 0.7171673 65 74.31094 0 0.1 0 0 0 1 
i 4.875915 201.0698 0.7171673 68 74.81409 0 0.1 0 0 0 1 
i 12.77832 201.0698 0.7171673 88 74.31094 0 0.1 0 0 0 1 
i 13.08505 201.0698 0.7171673 91 74.81409 0 0.1 0 0 0 1 
i 2.96863 201.5187 0.7171673 48 70.35824 0 0.1 0 0 0 1 
i 3.336703 201.5187 0.7171673 55 70.96201 0 0.1 0 0 0 1 
i 11.17776 201.5187 0.7171673 71 70.35824 0 0.1 0 0 0 1 
i 11.54583 201.5187 0.7171673 78 70.96201 0 0.1 0 0 0 1 
i 11.60718 201.5187 0.7171673 79 71.06264 0 0.1 0 0 0 1 
i 4.691879 201.861 0.7171673 65 74.51153 0 0.1 0 0 0 1 
i 4.81457 201.861 0.7171673 67 74.71279 0 0.1 0 0 0 1 
i 12.90101 201.861 0.7171673 88 74.51153 0 0.1 0 0 0 1 
i 13.0237 201.861 0.7171673 90 74.71279 0 0.1 0 0 0 1 
i 3.029976 202.4893 0.7171673 49 70.4582 0 0.1 0 0 0 1 
i 3.275357 202.4893 0.7171673 54 70.86071 0 0.1 0 0 0 1 
i 11.23911 202.4893 0.7171673 72 70.4582 0 0.1 0 0 0 1 
i 11.48449 202.4893 0.7171673 77 70.86071 0 0.1 0 0 0 1 
i 4.569188 202.5782 1.402355 66 74.31027 0 0.1 0 0 0 1 
i 4.93726 202.5782 0.7171673 69 74.91405 0 0.1 0 0 0 1 
i 12.77832 202.5782 1.402355 89 74.31027 0 0.1 0 0 0 1 
i 13.14639 202.5782 0.7171673 92 74.91405 0 0.1 0 0 0 1 
i 2.784594 203.2065 0.7171673 52 70.05568 0 0.1 0 0 0 1 
i 3.520739 203.2065 0.7171673 57 71.26323 0 0.1 0 0 0 1 
i 10.99373 203.2065 0.7171673 75 70.05568 0 0.1 0 0 0 1 
i 11.72987 203.2065 0.7171673 80 71.26323 0 0.1 0 0 0 1 
i 4.630533 203.2634 1.434335 67 74.41023 0 0.1 0 0 0 1 
i 4.81457 203.2634 1.434335 68 74.71212 0 0.1 0 0 0 1 
i 4.998606 203.2634 0.7171673 70 75.014 0 0.1 0 0 0 1 
i 12.83967 203.2634 1.434335 90 74.41023 0 0.1 0 0 0 1 
i 13.0237 203.2634 1.434335 91 74.71212 0 0.1 0 0 0 1 
i 13.20774 203.2634 0.7171673 93 75.014 0 0.1 0 0 0 1 
i 1 203.5989 0.5378755 53 70.06373 0 0.1 0 0 0 1 
i 9.209132 203.5989 0.5378755 76 70.06373 0 0.1 0 0 0 1 
i 2.845939 203.9554 0.7171673 53 70.15564 0 0.1 0 0 0 1 
i 3.029976 203.9554 0.7171673 50 70.45753 0 0.1 0 0 0 1 
i 3.275357 203.9554 0.7171673 55 70.86004 0 0.1 0 0 0 1 
i 3.582084 203.9554 0.7171673 58 71.36319 0 0.1 0 0 0 1 
i 11.05507 203.9554 0.7171673 76 70.15564 0 0.1 0 0 0 1 
i 11.23911 203.9554 0.7171673 73 70.45753 0 0.1 0 0 0 1 
i 11.48449 203.9554 0.7171673 78 70.86004 0 0.1 0 0 0 1 
i 11.79122 203.9554 0.7171673 81 71.36319 0 0.1 0 0 0 1 
i 4.753224 203.9805 0.7171673 65 74.61149 0 0.1 0 0 0 1 
i 4.93726 203.9805 0.7171673 69 74.91338 0 0.1 0 0 0 1 
i 12.96236 203.9805 0.7171673 88 74.61149 0 0.1 0 0 0 1 
i 13.14639 203.9805 0.7171673 92 74.91338 0 0.1 0 0 0 1 
i 2.784594 204.6726 0.7171673 52 70.05501 0 0.1 0 0 0 1 
i 3.091321 204.6726 0.7171673 49 70.55816 0 0.1 0 0 0 1 
i 3.336703 204.6726 0.7171673 54 70.96067 0 0.1 0 0 0 1 
i 3.520739 204.6726 0.7171673 57 71.26256 0 0.1 0 0 0 1 
i 10.99373 204.6726 0.7171673 75 70.05501 0 0.1 0 0 0 1 
i 11.30045 204.6726 0.7171673 72 70.55816 0 0.1 0 0 0 1 
i 11.54583 204.6726 0.7171673 77 70.96067 0 0.1 0 0 0 1 
i 11.72987 204.6726 0.7171673 80 71.26256 0 0.1 0 0 0 1 
i 1.061345 204.6774 1.075751 55 70.16369 0 0.1 0 0 0 1 
i 9.270478 204.6774 1.075751 78 70.16369 0 0.1 0 0 0 1 
i 5.059951 205.2154 0.7171673 68 75.11396 0 0.1 0 0 0 1 
i 13.26908 205.2154 0.7171673 91 75.11396 0 0.1 0 0 0 1 
i 2.907285 205.4573 0.7171673 53 70.2556 0 0.1 0 0 0 1 
i 3.029976 205.4573 0.7171673 51 70.45686 0 0.1 0 0 0 1 
i 3.275357 205.4573 0.7171673 56 70.85937 0 0.1 0 0 0 1 
i 3.64343 205.4573 0.7171673 58 71.46314 0 0.1 0 0 0 1 
i 11.11642 205.4573 0.7171673 76 70.2556 0 0.1 0 0 0 1 
i 11.23911 205.4573 0.7171673 74 70.45686 0 0.1 0 0 0 1 
i 11.48449 205.4573 0.7171673 79 70.85937 0 0.1 0 0 0 1 
i 11.85256 205.4573 0.7171673 81 71.46314 0 0.1 0 0 0 1 
i 4.569188 205.9325 0.7171673 63 74.30893 0 0.1 0 0 0 1 
i 12.77832 205.9325 0.7171673 86 74.30893 0 0.1 0 0 0 1 
i 2.784594 206.1745 2.113452 52 70.05434 0 0.1 0 0 0 1 
i 3.152666 206.1745 2.113452 50 70.65811 0 0.1 0 0 0 1 
i 3.398048 206.1745 2.113452 54 71.06063 0 0.1 0 0 0 1 
i 3.520739 206.1745 2.113452 57 71.26189 0 0.1 0 0 0 1 
i 10.99373 206.1745 2.113452 75 70.05434 0 0.1 0 0 0 1 
i 11.3618 206.1745 2.113452 73 70.65811 0 0.1 0 0 0 1 
i 11.60718 206.1745 1.396284 77 71.06063 0 0.1 0 0 0 1 
i 11.72987 206.1745 2.113452 80 71.26189 0 0.1 0 0 0 1 
i 1.122691 206.3332 0.5378755 56 70.26365 0 0.1 0 0 0 1 
i 9.331823 206.3332 0.5378755 79 70.26365 0 0.1 0 0 0 1 
i 4.630533 206.6879 1.434335 63 74.40889 0 0.1 0 0 0 1 
i 5.059951 206.6879 1.434335 69 75.11329 0 0.1 0 0 0 1 
i 12.83967 206.6879 1.434335 86 74.40889 0 0.1 0 0 0 1 
i 13.26908 206.6879 1.434335 92 75.11329 0 0.1 0 0 0 1 
i 2.907285 206.8536 1.434335 53 70.25493 0 0.1 0 0 0 1 
i 3.029976 206.8536 0.7171673 51 70.45618 0 0.1 0 0 0 1 
i 3.275357 206.8536 1.434335 56 70.8587 0 0.1 0 0 0 1 
i 3.64343 206.8536 0.7171673 58 71.46247 0 0.1 0 0 0 1 
i 11.11642 206.8536 1.434335 76 70.25493 0 0.1 0 0 0 1 
i 11.23911 206.8536 0.7171673 74 70.45618 0 0.1 0 0 0 1 
i 11.48449 206.8536 0.7171673 79 70.8587 0 0.1 0 0 0 1 
i 11.85256 206.8536 0.7171673 81 71.46247 0 0.1 0 0 0 1 
i 1 206.871 0.5378755 55 70.06239 0 0.1 0 0 0 1 
i 9.209132 206.871 1.416876 78 70.06239 0 0.1 0 0 0 1 
i 3.398048 207.5707 0.7171673 55 71.05996 0 0.1 0 0 0 1 
i 3.704775 207.5707 0.7171673 59 71.5631 0 0.1 0 0 0 1 
i 11.17776 207.5707 0.7171673 77 70.35556 0 0.1 0 0 0 1 
i 11.54583 207.5707 0.7171673 79 70.95933 0 0.1 0 0 0 1 
i 11.60718 207.5707 0.7171673 78 71.05996 0 0.1 0 0 0 1 
i 11.91391 207.5707 0.7171673 82 71.5631 0 0.1 0 0 0 1 
i 1.061345 207.8726 1.075751 56 70.16235 0 0.1 0 0 0 1 
i 1.122691 207.8726 1.075751 57 70.26298 0 0.1 0 0 0 1 
i 9.270478 207.8726 1.075751 79 70.16235 0 0.1 0 0 0 1 
i 9.331823 207.8726 1.075751 80 70.26298 0 0.1 0 0 0 1 
i 4.691879 208.1962 0.7171673 63 74.50885 0 0.1 0 0 0 1 
i 5.059951 208.1962 0.7171673 69 75.11262 0 0.1 0 0 0 1 
i 12.90101 208.1962 0.7171673 86 74.50885 0 0.1 0 0 0 1 
i 13.26908 208.1962 0.7171673 92 75.11262 0 0.1 0 0 0 1 
i 4.569188 208.9134 2.119523 64 74.30759 0 0.1 0 0 0 1 
i 5.182642 208.9134 1.402355 70 75.31388 0 0.1 0 0 0 1 
i 12.77832 208.9134 2.119523 87 74.30759 0 0.1 0 0 0 1 
i 13.39177 208.9134 1.402355 93 75.31388 0 0.1 0 0 0 1 
i 3.766121 209.4655 0.7171673 54 71.66306 0 0.1 0 0 0 1 
i 11.97525 209.4655 0.7171673 77 71.66306 0 0.1 0 0 0 1 
i 4.691879 209.5986 1.434335 63 74.50818 0 0.1 0 0 0 1 
i 5.243987 209.5986 1.434335 71 75.41384 0 0.1 0 0 0 1 
i 12.90101 209.5986 1.434335 86 74.50818 0 0.1 0 0 0 1 
i 13.45312 209.5986 1.434335 94 75.41384 0 0.1 0 0 0 1 
i 1.245382 209.6448 0.5378755 58 70.46356 0 0.1 0 0 0 1 
i 9.454514 209.6448 0.5378755 81 70.46356 0 0.1 0 0 0 1 
i 1 210.1826 0.5378755 55 70.06105 0 0.1 0 0 0 1 
i 2.784594 210.1826 0.7171673 46 70.053 0 0.1 0 0 0 1 
i 9.209132 210.1826 0.5378755 78 70.06105 0 0.1 0 0 0 1 
i 10.99373 210.1826 0.7171673 69 70.053 0 0.1 0 0 0 1 
i 5.121297 210.3158 0.7171673 69 75.21258 0 0.1 0 0 0 1 
i 13.33043 210.3158 0.7171673 92 75.21258 0 0.1 0 0 0 1 
i 2.845939 211.0049 0.7171673 44 70.15296 0 0.1 0 0 0 1 
i 3.766121 211.0049 0.7171673 54 71.66239 0 0.1 0 0 0 1 
i 11.05507 211.0049 0.7171673 67 70.15296 0 0.1 0 0 0 1 
i 11.97525 211.0049 0.7171673 77 71.66239 0 0.1 0 0 0 1 
i 1.061345 211.1842 0.5378755 55 70.16101 0 0.1 0 0 0 1 
i 1.245382 211.1842 0.5378755 58 70.46289 0 0.1 0 0 0 1 
i 9.270478 211.1842 0.5378755 78 70.16101 0 0.1 0 0 0 1 
i 9.454514 211.1842 0.5378755 81 70.46289 0 0.1 0 0 0 1 
i 4.81457 211.213 0.7171673 64 74.70876 0 0.1 0 0 0 1 
i 5.059951 211.213 0.7171673 68 75.11128 0 0.1 0 0 0 1 
i 13.0237 211.213 0.7171673 87 74.70876 0 0.1 0 0 0 1 
i 13.26908 211.213 0.7171673 91 75.11128 0 0.1 0 0 0 1 
i 1 211.722 0.5378755 56 70.06038 0 0.1 0 0 0 1 
i 1.306727 211.722 0.5378755 59 70.56352 0 0.1 0 0 0 1 
i 2.784594 211.722 0.7171673 45 70.05233 0 0.1 0 0 0 1 
i 3.827466 211.722 0.7171673 55 71.76302 0 0.1 0 0 0 1 
i 9.209132 211.722 0.5378755 79 70.06038 0 0.1 0 0 0 1 
i 9.515859 211.722 0.5378755 82 70.56352 0 0.1 0 0 0 1 
i 10.99373 211.722 0.7171673 68 70.05233 0 0.1 0 0 0 1 
i 12.0366 211.722 0.7171673 78 71.76302 0 0.1 0 0 0 1 
i 4.569188 211.9302 0.7171673 66 74.30625 0 0.1 0 0 0 1 
i 5.305333 211.9302 0.7171673 71 75.51379 0 0.1 0 0 0 1 
i 12.77832 211.9302 0.7171673 89 74.30625 0 0.1 0 0 0 1 
i 13.51446 211.9302 0.7171673 94 75.51379 0 0.1 0 0 0 1 
i 2.784594 212.3055 0.5378755 68 74.3143 0 0.1 0 0 0 1 
i 10.99373 212.3055 0.5378755 91 74.3143 0 0.1 0 0 0 1 
i 2.907285 212.5818 0.7171673 43 70.25291 0 0.1 0 0 0 1 
i 3.766121 212.5818 0.7171673 54 71.66172 0 0.1 0 0 0 1 
i 11.11642 212.5818 0.7171673 66 70.25291 0 0.1 0 0 0 1 
i 11.97525 212.5818 0.7171673 77 71.66172 0 0.1 0 0 0 1 
i 4.630533 212.6154 1.434335 67 74.40621 0 0.1 0 0 0 1 
i 4.81457 212.6154 0.7171673 64 74.70809 0 0.1 0 0 0 1 
i 5.059951 212.6154 0.7171673 69 75.11061 0 0.1 0 0 0 1 
i 5.366678 212.6154 0.7171673 72 75.61375 0 0.1 0 0 0 1 
i 12.83967 212.6154 1.434335 90 74.40621 0 0.1 0 0 0 1 
i 13.0237 212.6154 0.7171673 87 74.70809 0 0.1 0 0 0 1 
i 13.26908 212.6154 0.7171673 92 75.11061 0 0.1 0 0 0 1 
i 13.57581 212.6154 0.7171673 95 75.61375 0 0.1 0 0 0 1 
i 1.122691 212.7611 0.5378755 56 70.26096 0 0.1 0 0 0 1 
i 1.245382 212.7611 0.5378755 58 70.46222 0 0.1 0 0 0 1 
i 9.331823 212.7611 0.5378755 79 70.26096 0 0.1 0 0 0 1 
i 9.454514 212.7611 0.5378755 81 70.46222 0 0.1 0 0 0 1 
i 1 213.299 0.5378755 57 70.05971 0 0.1 0 0 0 1 
i 1.368072 213.299 0.5378755 60 70.66348 0 0.1 0 0 0 1 
i 2.784594 213.299 0.7171673 45 70.05166 0 0.1 0 0 0 1 
i 3.888811 213.299 0.7171673 56 71.86298 0 0.1 0 0 0 1 
i 9.209132 213.299 0.5378755 80 70.05971 0 0.1 0 0 0 1 
i 9.577205 213.299 0.5378755 83 70.66348 0 0.1 0 0 0 1 
i 10.99373 213.299 0.7171673 68 70.05166 0 0.1 0 0 0 1 
i 12.09794 213.299 0.7171673 79 71.86298 0 0.1 0 0 0 1 
i 2.845939 213.3137 1.075751 69 74.41426 0 0.1 0 0 0 1 
i 11.05507 213.3137 1.075751 92 74.41426 0 0.1 0 0 0 1 
i 4.875915 213.3325 0.7171673 63 74.80872 0 0.1 0 0 0 1 
i 5.121297 213.3325 0.7171673 68 75.21124 0 0.1 0 0 0 1 
i 5.305333 213.3325 0.7171673 71 75.51312 0 0.1 0 0 0 1 
i 13.08505 213.3325 0.7171673 86 74.80872 0 0.1 0 0 0 1 
i 13.33043 213.3325 0.7171673 91 75.21124 0 0.1 0 0 0 1 
i 13.51446 213.3325 0.7171673 94 75.51312 0 0.1 0 0 0 1 
i 2.845939 214.0479 1.434335 44 70.15161 0 0.1 0 0 0 1 
i 2.907285 214.0479 0.7171673 43 70.25224 0 0.1 0 0 0 1 
i 3.766121 214.0479 1.434335 56 71.66105 0 0.1 0 0 0 1 
i 3.950157 214.0479 0.7171673 57 71.96294 0 0.1 0 0 0 1 
i 11.05507 214.0479 1.434335 67 70.15161 0 0.1 0 0 0 1 
i 11.11642 214.0479 0.7171673 66 70.25224 0 0.1 0 0 0 1 
i 11.97525 214.0479 1.434335 79 71.66105 0 0.1 0 0 0 1 
i 12.15929 214.0479 0.7171673 80 71.96294 0 0.1 0 0 0 1 
i 4.691879 214.0519 0.7171673 68 74.50616 0 0.1 0 0 0 1 
i 4.81457 214.0519 0.7171673 65 74.70742 0 0.1 0 0 0 1 
i 5.059951 214.0519 0.7171673 70 75.10994 0 0.1 0 0 0 1 
i 5.428024 214.0519 0.7171673 72 75.71371 0 0.1 0 0 0 1 
i 12.90101 214.0519 0.7171673 91 74.50616 0 0.1 0 0 0 1 
i 13.0237 214.0519 0.7171673 88 74.70742 0 0.1 0 0 0 1 
i 13.26908 214.0519 0.7171673 93 75.10994 0 0.1 0 0 0 1 
i 13.63716 214.0519 0.7171673 95 75.71371 0 0.1 0 0 0 1 
i 1.061345 214.2272 1.075751 58 70.15966 0 0.1 0 0 0 1 
i 1.122691 214.2272 1.075751 57 70.26029 0 0.1 0 0 0 1 
i 1.245382 214.2272 1.075751 59 70.46155 0 0.1 0 0 0 1 
i 1.429418 214.2272 1.075751 60 70.76344 0 0.1 0 0 0 1 
i 9.270478 214.2272 1.075751 81 70.15966 0 0.1 0 0 0 1 
i 9.331823 214.2272 1.075751 80 70.26029 0 0.1 0 0 0 1 
i 9.454514 214.2272 0.5378755 82 70.46155 0 0.1 0 0 0 1 
i 9.63855 214.2272 1.075751 83 70.76344 0 0.1 0 0 0 1 
i 2.96863 214.7651 0.7171673 42 70.35287 0 0.1 0 0 0 1 
i 3.827466 214.7651 0.7171673 55 71.76168 0 0.1 0 0 0 1 
i 9.515859 214.7651 0.5378755 82 70.56218 0 0.1 0 0 0 1 
i 11.17776 214.7651 0.7171673 65 70.35287 0 0.1 0 0 0 1 
i 12.0366 214.7651 0.7171673 78 71.76168 0 0.1 0 0 0 1 
i 4.569188 214.7691 2.052744 66 74.30491 0 0.1 0 0 0 1 
i 4.93726 214.7691 1.335576 64 74.90868 0 0.1 0 0 0 1 
i 5.182642 214.7691 2.052744 69 75.31119 0 0.1 0 0 0 1 
i 5.305333 214.7691 2.052744 71 75.51245 0 0.1 0 0 0 1 
i 12.77832 214.7691 2.052744 89 74.30491 0 0.1 0 0 0 1 
i 13.14639 214.7691 1.335576 87 74.90868 0 0.1 0 0 0 1 
i 13.39177 214.7691 2.052744 92 75.31119 0 0.1 0 0 0 1 
i 13.51446 214.7691 1.335576 94 75.51245 0 0.1 0 0 0 1 
i 2.907285 214.8975 0.5378755 70 74.51421 0 0.1 0 0 0 1 
i 11.11642 214.8975 0.5378755 93 74.51421 0 0.1 0 0 0 1 
i 4.691879 215.3875 1.434335 68 74.50549 0 0.1 0 0 0 1 
i 4.81457 215.3875 1.434335 65 74.70675 0 0.1 0 0 0 1 
i 5.059951 215.3875 0.7171673 70 75.10927 0 0.1 0 0 0 1 
i 5.428024 215.3875 1.434335 72 75.71304 0 0.1 0 0 0 1 
i 12.90101 215.3875 1.434335 91 74.50549 0 0.1 0 0 0 1 
i 13.0237 215.3875 1.434335 88 74.70675 0 0.1 0 0 0 1 
i 13.26908 215.3875 0.7171673 93 75.10927 0 0.1 0 0 0 1 
i 13.63716 215.3875 1.434335 95 75.71304 0 0.1 0 0 0 1 
i 2.784594 215.4354 0.5378755 69 74.31296 0 0.1 0 0 0 1 
i 10.99373 215.4354 0.5378755 92 74.31296 0 0.1 0 0 0 1 
i 3.029976 215.7357 0.7171673 43 70.45283 0 0.1 0 0 0 1 
i 3.766121 215.7357 0.7171673 54 71.66038 0 0.1 0 0 0 1 
i 11.23911 215.7357 0.7171673 66 70.45283 0 0.1 0 0 0 1 
i 11.97525 215.7357 0.7171673 77 71.66038 0 0.1 0 0 0 1 
i 4.569188 216.1047 0.7171673 67 74.30423 0 0.1 0 0 0 1 
i 5.489369 216.1047 0.7171673 73 75.81367 0 0.1 0 0 0 1 
i 12.77832 216.1047 0.7171673 90 74.30423 0 0.1 0 0 0 1 
i 13.33043 216.1047 0.7171673 94 75.2099 0 0.1 0 0 0 1 
i 13.6985 216.1047 0.7171673 96 75.81367 0 0.1 0 0 0 1 
i 1.490763 216.268 0.5378755 59 70.8634 0 0.1 0 0 0 1 
i 9.699895 216.268 0.5378755 82 70.8634 0 0.1 0 0 0 1 
i 2.845939 216.37 0.5378755 70 74.41291 0 0.1 0 0 0 1 
i 2.907285 216.37 1.075751 71 74.51354 0 0.1 0 0 0 1 
i 11.05507 216.37 0.5378755 93 74.41291 0 0.1 0 0 0 1 
i 11.11642 216.37 1.075751 94 74.51354 0 0.1 0 0 0 1 
i 2.784594 216.4529 0.7171673 45 70.05031 0 0.1 0 0 0 1 
i 4.011502 216.4529 0.7171673 57 72.06289 0 0.1 0 0 0 1 
i 10.99373 216.4529 0.7171673 68 70.05031 0 0.1 0 0 0 1 
i 12.22063 216.4529 0.7171673 80 72.06289 0 0.1 0 0 0 1 
i 1 216.8058 0.5378755 55 70.05836 0 0.1 0 0 0 1 
i 9.209132 216.8058 0.5378755 78 70.05836 0 0.1 0 0 0 1 
i 2.96863 216.9079 0.5378755 72 74.61417 0 0.1 0 0 0 1 
i 11.17776 216.9079 0.5378755 95 74.61417 0 0.1 0 0 0 1 
i 2.845939 217.2018 1.434335 45 70.15027 0 0.1 0 0 0 1 
i 3.029976 217.2018 1.434335 42 70.45216 0 0.1 0 0 0 1 
i 3.766121 217.2018 1.434335 54 71.65971 0 0.1 0 0 0 1 
i 4.072848 217.2018 0.7171673 58 72.16285 0 0.1 0 0 0 1 
i 11.05507 217.2018 1.434335 68 70.15027 0 0.1 0 0 0 1 
i 11.23911 217.2018 1.434335 65 70.45216 0 0.1 0 0 0 1 
i 11.97525 217.2018 1.434335 77 71.65971 0 0.1 0 0 0 1 
i 12.28198 217.2018 0.7171673 81 72.16285 0 0.1 0 0 0 1 
i 1.061345 217.8074 0.5378755 54 70.15832 0 0.1 0 0 0 1 
i 1.490763 217.8074 0.5378755 60 70.86273 0 0.1 0 0 0 1 
i 9.270478 217.8074 0.5378755 77 70.15832 0 0.1 0 0 0 1 
i 9.699895 217.8074 1.075751 83 70.86273 0 0.1 0 0 0 1 
i 5.550715 217.8858 0.7171673 68 75.91363 0 0.1 0 0 0 1 
i 13.75985 217.8858 0.7171673 91 75.91363 0 0.1 0 0 0 1 
i 4.011502 217.919 0.7171673 57 72.06222 0 0.1 0 0 0 1 
i 12.22063 217.919 0.7171673 80 72.06222 0 0.1 0 0 0 1 
i 3.029976 218.0651 0.5378755 72 74.71413 0 0.1 0 0 0 1 
i 11.23911 218.0651 0.5378755 95 74.71413 0 0.1 0 0 0 1 
i 1 218.3452 0.5378755 55 70.05769 0 0.1 0 0 0 1 
i 1.552109 218.3452 0.5378755 60 70.96335 0 0.1 0 0 0 1 
i 9.209132 218.3452 0.5378755 78 70.05769 0 0.1 0 0 0 1 
i 2.784594 218.603 0.5378755 70 74.31161 0 0.1 0 0 0 1 
i 4.569188 218.603 0.7171673 60 74.30356 0 0.1 0 0 0 1 
i 10.99373 218.603 0.5378755 93 74.31161 0 0.1 0 0 0 1 
i 12.77832 218.603 0.7171673 83 74.30356 0 0.1 0 0 0 1 
i 2.907285 218.7037 0.7171673 45 70.25023 0 0.1 0 0 0 1 
i 3.029976 218.7037 0.7171673 43 70.45149 0 0.1 0 0 0 1 
i 3.766121 218.7037 0.7171673 56 71.65904 0 0.1 0 0 0 1 
i 4.134193 218.7037 0.7171673 58 72.26281 0 0.1 0 0 0 1 
i 11.11642 218.7037 0.7171673 68 70.25023 0 0.1 0 0 0 1 
i 11.23911 218.7037 0.7171673 66 70.45149 0 0.1 0 0 0 1 
i 11.97525 218.7037 0.7171673 79 71.65904 0 0.1 0 0 0 1 
i 12.34333 218.7037 0.7171673 81 72.26281 0 0.1 0 0 0 1 
i 4.630533 219.3583 0.7171673 58 74.40352 0 0.1 0 0 0 1 
i 5.550715 219.3583 1.434335 69 75.91296 0 0.1 0 0 0 1 
i 12.83967 219.3583 0.7171673 81 74.40352 0 0.1 0 0 0 1 
i 13.75985 219.3583 1.434335 92 75.91296 0 0.1 0 0 0 1 
i 1.122691 219.3843 0.5378755 54 70.25828 0 0.1 0 0 0 1 
i 1.490763 219.3843 0.5378755 60 70.86205 0 0.1 0 0 0 1 
i 9.331823 219.3843 0.5378755 77 70.25828 0 0.1 0 0 0 1 
i 9.699895 219.3843 0.5378755 83 70.86205 0 0.1 0 0 0 1 
i 2.784594 219.4208 2.113452 44 70.04897 0 0.1 0 0 0 1 
i 3.152666 219.4208 2.113452 41 70.65275 0 0.1 0 0 0 1 
i 3.888811 219.4208 1.396284 54 71.86029 0 0.1 0 0 0 1 
i 4.011502 219.4208 2.113452 57 72.06155 0 0.1 0 0 0 1 
i 10.99373 219.4208 2.113452 67 70.04897 0 0.1 0 0 0 1 
i 11.3618 219.4208 2.113452 64 70.65275 0 0.1 0 0 0 1 
i 12.09794 219.4208 1.396284 77 71.86029 0 0.1 0 0 0 1 
i 12.22063 219.4208 2.113452 80 72.06155 0 0.1 0 0 0 1 
i 2.845939 219.5376 1.075751 70 74.41157 0 0.1 0 0 0 1 
i 3.029976 219.5376 1.075751 73 74.71346 0 0.1 0 0 0 1 
i 11.05507 219.5376 1.075751 93 74.41157 0 0.1 0 0 0 1 
i 11.23911 219.5376 1.075751 96 74.71346 0 0.1 0 0 0 1 
i 1 219.9222 0.5378755 56 70.05702 0 0.1 0 0 0 1 
i 1.613454 219.9222 0.5378755 61 71.06331 0 0.1 0 0 0 1 
i 9.209132 219.9222 0.5378755 79 70.05702 0 0.1 0 0 0 1 
i 9.822586 219.9222 0.5378755 84 71.06331 0 0.1 0 0 0 1 
i 4.569188 220.0755 0.7171673 59 74.30289 0 0.1 0 0 0 1 
i 12.77832 220.0755 0.7171673 82 74.30289 0 0.1 0 0 0 1 
i 2.845939 220.1 0.7171673 43 70.14893 0 0.1 0 0 0 1 
i 3.029976 220.1 1.434335 42 70.45082 0 0.1 0 0 0 1 
i 3.766121 220.1 1.434335 56 71.65836 0 0.1 0 0 0 1 
i 4.134193 220.1 0.7171673 58 72.26214 0 0.1 0 0 0 1 
i 11.05507 220.1 0.7171673 66 70.14893 0 0.1 0 0 0 1 
i 11.23911 220.1 1.434335 65 70.45082 0 0.1 0 0 0 1 
i 11.97525 220.1 1.434335 79 71.65836 0 0.1 0 0 0 1 
i 12.34333 220.1 0.7171673 81 72.26214 0 0.1 0 0 0 1 
i 2.96863 220.8171 0.7171673 45 70.35019 0 0.1 0 0 0 1 
i 3.888811 220.8171 0.7171673 55 71.85962 0 0.1 0 0 0 1 
i 4.195539 220.8171 0.7171673 59 72.36277 0 0.1 0 0 0 1 
i 11.17776 220.8171 0.7171673 68 70.35019 0 0.1 0 0 0 1 
i 12.09794 220.8171 0.7171673 78 71.85962 0 0.1 0 0 0 1 
i 12.40467 220.8171 0.7171673 82 72.36277 0 0.1 0 0 0 1 
i 1.061345 220.8504 0.5378755 56 70.15698 0 0.1 0 0 0 1 
i 1.122691 220.8504 1.075751 55 70.25761 0 0.1 0 0 0 1 
i 1.490763 220.8504 0.5378755 61 70.86138 0 0.1 0 0 0 1 
i 1.6748 220.8504 0.5378755 62 71.16327 0 0.1 0 0 0 1 
i 9.270478 220.8504 0.5378755 79 70.15698 0 0.1 0 0 0 1 
i 9.331823 220.8504 1.075751 78 70.25761 0 0.1 0 0 0 1 
i 9.699895 220.8504 1.075751 84 70.86138 0 0.1 0 0 0 1 
i 9.883932 220.8504 0.5378755 85 71.16327 0 0.1 0 0 0 1 
i 4.691879 220.8667 0.7171673 58 74.50348 0 0.1 0 0 0 1 
i 5.550715 220.8667 0.7171673 69 75.91229 0 0.1 0 0 0 1 
i 12.90101 220.8667 0.7171673 81 74.50348 0 0.1 0 0 0 1 
i 13.75985 220.8667 0.7171673 92 75.91229 0 0.1 0 0 0 1 
i 2.907285 221.046 0.5378755 70 74.51153 0 0.1 0 0 0 1 
i 3.029976 221.046 0.5378755 73 74.71279 0 0.1 0 0 0 1 
i 11.11642 221.046 0.5378755 93 74.51153 0 0.1 0 0 0 1 
i 11.23911 221.046 0.5378755 96 74.71279 0 0.1 0 0 0 1 
i 1.184036 221.3883 0.5378755 54 70.35824 0 0.1 0 0 0 1 
i 1.552109 221.3883 0.5378755 60 70.96201 0 0.1 0 0 0 1 
i 1.613454 221.3883 0.5378755 61 71.06264 0 0.1 0 0 0 1 
i 9.393168 221.3883 0.5378755 77 70.35824 0 0.1 0 0 0 1 
i 9.761241 221.3883 0.5378755 83 70.96201 0 0.1 0 0 0 1 
i 2.784594 221.5839 0.5378755 72 74.31027 0 0.1 0 0 0 1 
i 3.152666 221.5839 0.5378755 74 74.91405 0 0.1 0 0 0 1 
i 4.569188 221.5839 0.7171673 59 74.30222 0 0.1 0 0 0 1 
i 5.673405 221.5839 2.119523 70 76.11354 0 0.1 0 0 0 1 
i 10.99373 221.5839 0.5378755 95 74.31027 0 0.1 0 0 0 1 
i 11.3618 221.5839 0.5378755 97 74.91405 0 0.1 0 0 0 1 
i 12.77832 221.5839 0.7171673 82 74.30222 0 0.1 0 0 0 1 
i 13.88254 221.5839 2.119523 93 76.11354 0 0.1 0 0 0 1 
i 3.275357 222.0435 0.7171673 43 70.85266 0 0.1 0 0 0 1 
i 3.766121 222.0435 0.7171673 52 71.65769 0 0.1 0 0 0 1 
i 11.48449 222.0435 0.7171673 66 70.85266 0 0.1 0 0 0 1 
i 11.97525 222.0435 0.7171673 75 71.65769 0 0.1 0 0 0 1 
i 4.630533 222.269 1.434335 58 74.40218 0 0.1 0 0 0 1 
i 4.691879 222.269 1.434335 57 74.50281 0 0.1 0 0 0 1 
i 5.734751 222.269 0.7171673 71 76.2135 0 0.1 0 0 0 1 
i 12.83967 222.269 1.95774 81 74.40218 0 0.1 0 0 0 1 
i 12.90101 222.269 1.434335 80 74.50281 0 0.1 0 0 0 1 
i 13.94388 222.269 0.7171673 94 76.2135 0 0.1 0 0 0 1 
i 2.845939 222.4483 1.075751 73 74.41023 0 0.1 0 0 0 1 
i 2.907285 222.4483 1.075751 71 74.51086 0 0.1 0 0 0 1 
i 3.029976 222.4483 1.075751 74 74.71212 0 0.1 0 0 0 1 
i 3.214012 222.4483 0.5378755 75 75.014 0 0.1 0 0 0 1 
i 11.05507 222.4483 1.075751 96 74.41023 0 0.1 0 0 0 1 
i 11.11642 222.4483 1.075751 94 74.51086 0 0.1 0 0 0 1 
i 11.23911 222.4483 1.075751 97 74.71212 0 0.1 0 0 0 1 
i 11.42314 222.4483 0.5378755 98 75.014 0 0.1 0 0 0 1 
i 1.245382 222.5382 0.5378755 55 70.4582 0 0.1 0 0 0 1 
i 1.490763 222.5382 0.5378755 59 70.86071 0 0.1 0 0 0 1 
i 9.454514 222.5382 0.5378755 78 70.4582 0 0.1 0 0 0 1 
i 9.699895 222.5382 0.5378755 82 70.86071 0 0.1 0 0 0 1 
i 2.784594 222.7607 0.7171673 47 70.04763 0 0.1 0 0 0 1 
i 4.256884 222.7607 0.7171673 57 72.46273 0 0.1 0 0 0 1 
i 10.99373 222.7607 0.7171673 70 70.04763 0 0.1 0 0 0 1 
i 12.46602 222.7607 0.7171673 80 72.46273 0 0.1 0 0 0 1 
i 2.784594 222.9862 0.5378755 72 74.3096 0 0.1 0 0 0 1 
i 5.61206 222.9862 0.7171673 69 76.01224 0 0.1 0 0 0 1 
i 10.99373 222.9862 0.5378755 95 74.3096 0 0.1 0 0 0 1 
i 13.82119 222.9862 0.7171673 92 76.01224 0 0.1 0 0 0 1 
i 1 223.0761 0.5378755 57 70.05568 0 0.1 0 0 0 1 
i 1.736145 223.0761 0.5378755 62 71.26323 0 0.1 0 0 0 1 
i 9.209132 223.0761 0.5378755 80 70.05568 0 0.1 0 0 0 1 
i 9.945277 223.0761 0.5378755 85 71.26323 0 0.1 0 0 0 1 
i 2.845939 223.5096 1.434335 48 70.14759 0 0.1 0 0 0 1 
i 3.275357 223.5096 1.434335 42 70.85199 0 0.1 0 0 0 1 
i 3.766121 223.5096 0.7171673 52 71.65702 0 0.1 0 0 0 1 
i 4.318229 223.5096 0.7171673 58 72.56268 0 0.1 0 0 0 1 
i 11.05507 223.5096 1.434335 71 70.14759 0 0.1 0 0 0 1 
i 11.48449 223.5096 0.7171673 65 70.85199 0 0.1 0 0 0 1 
i 11.97525 223.5096 0.7171673 75 71.65702 0 0.1 0 0 0 1 
i 4.81457 223.8835 0.7171673 57 74.7034 0 0.1 0 0 0 1 
i 5.550715 223.8835 0.7171673 68 75.91094 0 0.1 0 0 0 1 
i 13.0237 223.8835 0.7171673 80 74.7034 0 0.1 0 0 0 1 
i 13.75985 223.8835 0.7171673 91 75.91094 0 0.1 0 0 0 1 
i 1.061345 224.0043 1.075751 58 70.15564 0 0.1 0 0 0 1 
i 1.245382 224.0043 1.075751 55 70.45753 0 0.1 0 0 0 1 
i 1.490763 224.0043 0.5378755 60 70.86004 0 0.1 0 0 0 1 
i 1.79749 224.0043 0.5378755 63 71.36319 0 0.1 0 0 0 1 
i 9.270478 224.0043 1.075751 81 70.15564 0 0.1 0 0 0 1 
i 9.454514 224.0043 0.5378755 78 70.45753 0 0.1 0 0 0 1 
i 9.699895 224.0043 0.5378755 83 70.86004 0 0.1 0 0 0 1 
i 10.00662 224.0043 0.5378755 86 71.36319 0 0.1 0 0 0 1 
i 3.827466 224.2268 0.7171673 51 71.75765 0 0.1 0 0 0 1 
i 4.256884 224.2268 0.7171673 57 72.46205 0 0.1 0 0 0 1 
i 11.54583 224.2268 0.7171673 65 70.95262 0 0.1 0 0 0 1 
i 12.0366 224.2268 0.7171673 74 71.75765 0 0.1 0 0 0 1 
i 12.46602 224.2268 0.7171673 80 72.46205 0 0.1 0 0 0 1 
i 3.275357 224.4004 0.5378755 73 75.11396 0 0.1 0 0 0 1 
i 11.48449 224.4004 0.5378755 96 75.11396 0 0.1 0 0 0 1 
i 1.552109 224.5422 0.5378755 59 70.96067 0 0.1 0 0 0 1 
i 1.736145 224.5422 0.5378755 62 71.26256 0 0.1 0 0 0 1 
i 9.515859 224.5422 0.5378755 78 70.55816 0 0.1 0 0 0 1 
i 9.761241 224.5422 0.5378755 82 70.96067 0 0.1 0 0 0 1 
i 9.945277 224.5422 0.5378755 85 71.26256 0 0.1 0 0 0 1 
i 4.569188 224.6006 0.7171673 59 74.30088 0 0.1 0 0 0 1 
i 5.796096 224.6006 0.7171673 71 76.31346 0 0.1 0 0 0 1 
i 12.77832 224.6006 0.7171673 82 74.30088 0 0.1 0 0 0 1 
i 14.00523 224.6006 0.7171673 94 76.31346 0 0.1 0 0 0 1 
i 2.784594 224.9382 0.5378755 69 74.30893 0 0.1 0 0 0 1 
i 10.99373 224.9382 0.5378755 92 74.30893 0 0.1 0 0 0 1 
i 2.907285 225.0115 0.9817942 49 70.24755 0 0.1 0 0 0 1 
i 3.275357 225.0115 0.7171673 43 70.85132 0 0.1 0 0 0 1 
i 3.766121 225.0115 0.7171673 52 71.65635 0 0.1 0 0 0 1 
i 4.379575 225.0115 0.7171673 58 72.66264 0 0.1 0 0 0 1 
i 11.11642 225.0115 0.9817942 72 70.24755 0 0.1 0 0 0 1 
i 11.48449 225.0115 0.7171673 66 70.85132 0 0.1 0 0 0 1 
i 11.97525 225.0115 0.7171673 75 71.65635 0 0.1 0 0 0 1 
i 12.58871 225.0115 0.7171673 81 72.66264 0 0.1 0 0 0 1 
i 4.630533 225.2858 0.7171673 60 74.40084 0 0.1 0 0 0 1 
i 4.81457 225.2858 1.434335 56 74.70273 0 0.1 0 0 0 1 
i 5.550715 225.2858 0.7171673 69 75.91027 0 0.1 0 0 0 1 
i 5.857442 225.2858 0.7171673 72 76.41342 0 0.1 0 0 0 1 
i 12.83967 225.2858 0.7171673 83 74.40084 0 0.1 0 0 0 1 
i 13.0237 225.2858 1.434335 79 74.70273 0 0.1 0 0 0 1 
i 13.75985 225.2858 0.7171673 92 75.91027 0 0.1 0 0 0 1 
i 14.06657 225.2858 0.7171673 95 76.41342 0 0.1 0 0 0 1 
i 1.122691 225.5062 0.5378755 59 70.2556 0 0.1 0 0 0 1 
i 1.245382 225.5062 1.075751 57 70.45686 0 0.1 0 0 0 1 
i 1.490763 225.5062 0.5378755 61 70.85937 0 0.1 0 0 0 1 
i 1.858836 225.5062 0.5378755 63 71.46314 0 0.1 0 0 0 1 
i 9.331823 225.5062 0.5378755 82 70.2556 0 0.1 0 0 0 1 
i 9.454514 225.5062 1.075751 80 70.45686 0 0.1 0 0 0 1 
i 9.699895 225.5062 0.5378755 84 70.85937 0 0.1 0 0 0 1 
i 10.06797 225.5062 0.5378755 86 71.46314 0 0.1 0 0 0 1 
i 2.784594 225.7286 1.396284 47 70.04629 0 0.1 0 0 0 1 
i 3.398048 225.7286 2.113452 41 71.05258 0 0.1 0 0 0 1 
i 3.888811 225.7286 2.113452 51 71.85761 0 0.1 0 0 0 1 
i 4.256884 225.7286 2.113452 57 72.46138 0 0.1 0 0 0 1 
i 10.99373 225.7286 1.396284 70 70.04629 0 0.1 0 0 0 1 
i 11.60718 225.7286 2.113452 64 71.05258 0 0.1 0 0 0 1 
i 12.09794 225.7286 2.113452 74 71.85761 0 0.1 0 0 0 1 
i 12.46602 225.7286 0.7171673 80 72.46138 0 0.1 0 0 0 1 
i 2.845939 225.8728 1.075751 69 74.40889 0 0.1 0 0 0 1 
i 3.275357 225.8728 0.5378755 74 75.11329 0 0.1 0 0 0 1 
i 11.05507 225.8728 1.075751 92 74.40889 0 0.1 0 0 0 1 
i 11.48449 225.8728 0.5378755 97 75.11329 0 0.1 0 0 0 1 
i 4.569188 226.003 0.7171673 59 74.30021 0 0.1 0 0 0 1 
i 5.61206 226.003 0.7171673 68 76.0109 0 0.1 0 0 0 1 
i 5.796096 226.003 0.7171673 71 76.31279 0 0.1 0 0 0 1 
i 12.77832 226.003 0.7171673 82 74.30021 0 0.1 0 0 0 1 
i 13.82119 226.003 0.7171673 91 76.0109 0 0.1 0 0 0 1 
i 14.00523 226.003 0.7171673 94 76.31279 0 0.1 0 0 0 1 
i 1.368072 226.044 0.5378755 55 70.65811 0 0.1 0 0 0 1 
i 1.613454 226.044 0.5378755 60 71.06063 0 0.1 0 0 0 1 
i 1.736145 226.044 0.5378755 62 71.26189 0 0.1 0 0 0 1 
i 9.577205 226.044 0.5378755 78 70.65811 0 0.1 0 0 0 1 
i 9.822586 226.044 0.5378755 83 71.06063 0 0.1 0 0 0 1 
i 9.945277 226.044 0.5378755 85 71.26189 0 0.1 0 0 0 1 
i 2.907285 226.4078 1.434335 49 70.24688 0 0.1 0 0 0 1 
i 3.275357 226.4078 1.434335 42 70.85065 0 0.1 0 0 0 1 
i 3.950157 226.4078 0.7171673 50 71.95757 0 0.1 0 0 0 1 
i 4.379575 226.4078 0.7171673 58 72.66197 0 0.1 0 0 0 1 
i 11.11642 226.4078 1.434335 72 70.24688 0 0.1 0 0 0 1 
i 11.48449 226.4078 0.7171673 65 70.85065 0 0.1 0 0 0 1 
i 12.15929 226.4078 0.7171673 73 71.95757 0 0.1 0 0 0 1 
i 12.52736 226.4078 1.031786 80 72.56134 0 0.1 0 0 0 1 
i 12.58871 226.4078 0.7171673 81 72.66197 0 0.1 0 0 0 1 
i 3.336703 226.4107 0.5378755 75 75.21392 0 0.1 0 0 0 1 
i 11.54583 226.4107 0.5378755 98 75.21392 0 0.1 0 0 0 1 
i 2.845939 226.5339 0.5378755 44 70.16369 0 0.1 0 0 0 1 
i 11.05507 226.5339 0.5378755 67 70.16369 0 0.1 0 0 0 1 
i 4.691879 226.7224 0.7171673 59 74.5008 0 0.1 0 0 0 1 
i 4.81457 226.7224 0.7171673 57 74.70205 0 0.1 0 0 0 1 
i 5.550715 226.7224 0.7171673 70 75.9096 0 0.1 0 0 0 1 
i 5.918787 226.7224 0.7171673 72 76.51338 0 0.1 0 0 0 1 
i 12.90101 226.7224 1.119716 82 74.5008 0 0.1 0 0 0 1 
i 13.75985 226.7224 0.7171673 93 75.9096 0 0.1 0 0 0 1 
i 14.12792 226.7224 0.7171673 95 76.51338 0 0.1 0 0 0 1 
i 1.061345 226.9024 1.075751 58 70.1543 0 0.1 0 0 0 1 
i 1.122691 226.9024 1.075751 59 70.25493 0 0.1 0 0 0 1 
i 1.245382 226.9024 1.075751 56 70.45618 0 0.1 0 0 0 1 
i 1.429418 226.9024 0.5378755 55 70.75807 0 0.1 0 0 0 1 
i 1.490763 226.9024 0.5378755 61 70.8587 0 0.1 0 0 0 1 
i 1.6748 226.9024 1.075751 60 71.16059 0 0.1 0 0 0 1 
i 1.79749 226.9024 1.075751 62 71.36184 0 0.1 0 0 0 1 
i 1.858836 226.9024 1.075751 63 71.46247 0 0.1 0 0 0 1 
i 9.270478 226.9024 1.075751 81 70.1543 0 0.1 0 0 0 1 
i 9.331823 226.9024 1.075751 82 70.25493 0 0.1 0 0 0 1 
i 9.454514 226.9024 0.5378755 79 70.45618 0 0.1 0 0 0 1 
i 9.63855 226.9024 0.5378755 78 70.75807 0 0.1 0 0 0 1 
i 9.699895 226.9024 1.075751 84 70.8587 0 0.1 0 0 0 1 
i 9.883932 226.9024 1.075751 83 71.16059 0 0.1 0 0 0 1 
i 10.00662 226.9024 1.075751 85 71.36184 0 0.1 0 0 0 1 
i 10.06797 226.9024 1.075751 86 71.46247 0 0.1 0 0 0 1 
i 2.784594 227.0718 0.5378755 45 70.06306 0 0.1 0 0 0 1 
i 10.99373 227.0718 0.5378755 68 70.06306 0 0.1 0 0 0 1 
i 2.784594 227.1249 0.7171673 48 70.04562 0 0.1 0 0 0 1 
i 3.827466 227.1249 0.7171673 52 71.75631 0 0.1 0 0 0 1 
i 4.44092 227.1249 0.7171673 59 72.7626 0 0.1 0 0 0 1 
i 10.99373 227.1249 0.7171673 71 70.04562 0 0.1 0 0 0 1 
i 11.54583 227.1249 0.7171673 65 70.95128 0 0.1 0 0 0 1 
i 12.0366 227.1249 0.7171673 75 71.75631 0 0.1 0 0 0 1 
i 12.46602 227.1249 0.7171673 80 72.46071 0 0.1 0 0 0 1 
i 2.907285 227.3812 0.5378755 69 74.50885 0 0.1 0 0 0 1 
i 3.275357 227.3812 0.5378755 74 75.11262 0 0.1 0 0 0 1 
i 11.11642 227.3812 0.5378755 92 74.50885 0 0.1 0 0 0 1 
i 11.48449 227.3812 0.5378755 97 75.11262 0 0.1 0 0 0 1 
i 4.569188 227.4395 2.689096 58 74.29954 0 0.1 0 0 0 1 
i 4.93726 227.4395 2.052744 55 74.90331 0 0.1 0 0 0 1 
i 5.673405 227.4395 2.052744 69 76.11086 0 0.1 0 0 0 1 
i 5.796096 227.4395 1.335576 71 76.31212 0 0.1 0 0 0 1 
i 12.77832 227.4395 2.689096 81 74.29954 0 0.1 0 0 0 1 
i 13.14639 227.4395 2.689096 78 74.90331 0 0.1 0 0 0 1 
i 13.88254 227.4395 2.052744 92 76.11086 0 0.1 0 0 0 1 
i 14.00523 227.4395 1.335576 94 76.31212 0 0.1 0 0 0 1 
i 1.306727 227.4403 0.5378755 57 70.55681 0 0.1 0 0 0 1 
i 1.552109 227.4403 0.5378755 61 70.95933 0 0.1 0 0 0 1 
i 9.515859 227.4403 0.5378755 80 70.55681 0 0.1 0 0 0 1 
i 9.577205 227.4403 0.5378755 79 70.65744 0 0.1 0 0 0 1 
i 2.784594 227.9191 0.5378755 70 74.30759 0 0.1 0 0 0 1 
i 3.398048 227.9191 0.5378755 75 75.31388 0 0.1 0 0 0 1 
i 10.99373 227.9191 0.5378755 93 74.30759 0 0.1 0 0 0 1 
i 11.60718 227.9191 0.5378755 98 75.31388 0 0.1 0 0 0 1 
i 3.029976 228.0152 0.7171673 49 70.44746 0 0.1 0 0 0 1 
i 3.275357 228.0152 0.7171673 44 70.84998 0 0.1 0 0 0 1 
i 3.766121 228.0152 0.7171673 53 71.65501 0 0.1 0 0 0 1 
i 11.23911 228.0152 0.7171673 72 70.44746 0 0.1 0 0 0 1 
i 11.48449 228.0152 0.7171673 67 70.84998 0 0.1 0 0 0 1 
i 11.97525 228.0152 0.7171673 76 71.65501 0 0.1 0 0 0 1 
i 4.630533 228.058 1.434335 57 74.3995 0 0.1 0 0 0 1 
i 4.81457 228.058 0.7171673 56 74.70138 0 0.1 0 0 0 1 
i 5.550715 228.058 1.434335 70 75.90893 0 0.1 0 0 0 1 
i 5.918787 228.058 1.434335 72 76.5127 0 0.1 0 0 0 1 
i 12.83967 228.058 1.434335 80 74.3995 0 0.1 0 0 0 1 
i 13.0237 228.058 0.7171673 79 74.70138 0 0.1 0 0 0 1 
i 13.75985 228.058 1.434335 93 75.90893 0 0.1 0 0 0 1 
i 14.12792 228.058 1.434335 95 76.5127 0 0.1 0 0 0 1 
i 2.907285 228.1897 0.5378755 46 70.26365 0 0.1 0 0 0 1 
i 11.11642 228.1897 0.5378755 69 70.26365 0 0.1 0 0 0 1 
i 2.784594 228.7276 0.5378755 47 70.06239 0 0.1 0 0 0 1 
i 10.99373 228.7276 0.5378755 70 70.06239 0 0.1 0 0 0 1 
i 2.784594 228.7324 0.7171673 46 70.04495 0 0.1 0 0 0 1 
i 3.520739 228.7324 2.826625 41 71.25249 0 0.1 0 0 0 1 
i 4.011502 228.7324 0.7171673 51 72.05753 0 0.1 0 0 0 1 
i 4.256884 228.7324 2.826625 55 72.46004 0 0.1 0 0 0 1 
i 10.99373 228.7324 0.7171673 69 70.04495 0 0.1 0 0 0 1 
i 11.72987 228.7324 2.826625 64 71.25249 0 0.1 0 0 0 1 
i 12.22063 228.7324 0.7171673 74 72.05753 0 0.1 0 0 0 1 
i 12.46602 228.7324 0.7171673 78 72.46004 0 0.1 0 0 0 1 
i 4.753224 228.7751 0.7171673 59 74.60075 0 0.1 0 0 0 1 
i 5.980132 228.7751 0.7171673 73 76.61333 0 0.1 0 0 0 1 
i 12.96236 228.7751 0.7171673 82 74.60075 0 0.1 0 0 0 1 
i 14.18926 228.7751 0.7171673 96 76.61333 0 0.1 0 0 0 1 
i 2.845939 228.7836 1.075751 70 74.40755 0 0.1 0 0 0 1 
i 2.907285 228.7836 0.5378755 69 74.50818 0 0.1 0 0 0 1 
i 3.275357 228.7836 1.075751 75 75.11195 0 0.1 0 0 0 1 
i 3.459394 228.7836 1.075751 76 75.41384 0 0.1 0 0 0 1 
i 11.05507 228.7836 1.075751 93 74.40755 0 0.1 0 0 0 1 
i 11.11642 228.7836 0.5378755 92 74.50818 0 0.1 0 0 0 1 
i 11.48449 228.7836 0.5378755 98 75.11195 0 0.1 0 0 0 1 
i 11.66853 228.7836 1.075751 99 75.41384 0 0.1 0 0 0 1 
i 2.96863 229.3214 0.5378755 68 74.60881 0 0.1 0 0 0 1 
i 11.17776 229.3214 0.5378755 91 74.60881 0 0.1 0 0 0 1 
i 11.54583 229.3214 0.5378755 98 75.21258 0 0.1 0 0 0 1 
i 2.845939 229.4115 0.7171673 45 70.14491 0 0.1 0 0 0 1 
i 3.029976 229.4115 1.434335 49 70.44679 0 0.1 0 0 0 1 
i 3.275357 229.4115 1.434335 44 70.84931 0 0.1 0 0 0 1 
i 3.766121 229.4115 0.7171673 53 71.65434 0 0.1 0 0 0 1 
i 4.072848 229.4115 0.7171673 50 72.15748 0 0.1 0 0 0 1 
i 11.05507 229.4115 0.7171673 68 70.14491 0 0.1 0 0 0 1 
i 11.23911 229.4115 1.434335 72 70.44679 0 0.1 0 0 0 1 
i 11.48449 229.4115 0.7171673 67 70.84931 0 0.1 0 0 0 1 
i 11.97525 229.4115 0.7171673 76 71.65434 0 0.1 0 0 0 1 
i 12.28198 229.4115 0.7171673 73 72.15748 0 0.1 0 0 0 1 
i 1.981527 229.5143 0.5378755 59 71.66306 0 0.1 0 0 0 1 
i 10.19066 229.5143 0.5378755 82 71.66306 0 0.1 0 0 0 1 
i 2.845939 229.7291 0.5378755 53 70.16235 0 0.1 0 0 0 1 
i 2.907285 229.7291 0.5378755 55 70.26298 0 0.1 0 0 0 1 
i 11.05507 229.7291 0.5378755 76 70.16235 0 0.1 0 0 0 1 
i 11.11642 229.7291 0.5378755 78 70.26298 0 0.1 0 0 0 1 
i 5.059951 229.917 0.7171673 57 75.10323 0 0.1 0 0 0 1 
i 5.550715 229.917 0.7171673 66 75.90826 0 0.1 0 0 0 1 
i 13.26908 229.917 0.7171673 80 75.10323 0 0.1 0 0 0 1 
i 13.75985 229.917 0.7171673 89 75.90826 0 0.1 0 0 0 1 
i 1 230.0522 0.5378755 52 70.053 0 0.1 0 0 0 1 
i 9.209132 230.0522 0.5378755 75 70.053 0 0.1 0 0 0 1 
i 2.784594 230.1286 0.7171673 46 70.04428 0 0.1 0 0 0 1 
i 3.827466 230.1286 0.7171673 54 71.75497 0 0.1 0 0 0 1 
i 4.011502 230.1286 0.7171673 51 72.05686 0 0.1 0 0 0 1 
i 4.563611 230.1286 0.7171673 59 72.96252 0 0.1 0 0 0 1 
i 10.99373 230.1286 0.7171673 69 70.04428 0 0.1 0 0 0 1 
i 11.54583 230.1286 0.7171673 67 70.94994 0 0.1 0 0 0 1 
i 12.0366 230.1286 0.7171673 77 71.75497 0 0.1 0 0 0 1 
i 12.22063 230.1286 0.7171673 74 72.05686 0 0.1 0 0 0 1 
i 12.46602 230.1286 0.7171673 78 72.45937 0 0.1 0 0 0 1 
i 12.77274 230.1286 0.7171673 82 72.96252 0 0.1 0 0 0 1 
i 2.784594 230.267 0.5378755 54 70.06172 0 0.1 0 0 0 1 
i 2.96863 230.267 0.5378755 56 70.36361 0 0.1 0 0 0 1 
i 10.99373 230.267 0.5378755 77 70.06172 0 0.1 0 0 0 1 
i 11.17776 230.267 0.5378755 79 70.36361 0 0.1 0 0 0 1 
i 3.029976 230.398 0.5378755 69 74.70876 0 0.1 0 0 0 1 
i 3.275357 230.398 0.5378755 74 75.11128 0 0.1 0 0 0 1 
i 11.23911 230.398 0.5378755 92 74.70876 0 0.1 0 0 0 1 
i 11.48449 230.398 0.5378755 97 75.11128 0 0.1 0 0 0 1 
i 4.569188 230.6342 0.7171673 61 74.2982 0 0.1 0 0 0 1 
i 6.041478 230.6342 0.7171673 71 76.71329 0 0.1 0 0 0 1 
i 12.77832 230.6342 0.7171673 84 74.2982 0 0.1 0 0 0 1 
i 14.25061 230.6342 0.7171673 94 76.71329 0 0.1 0 0 0 1 
i 2.907285 230.8418 0.7171673 45 70.24486 0 0.1 0 0 0 1 
i 3.029976 230.8418 0.7171673 48 70.44612 0 0.1 0 0 0 1 
i 3.275357 230.8418 0.7171673 43 70.84864 0 0.1 0 0 0 1 
i 3.766121 230.8418 0.7171673 52 71.65367 0 0.1 0 0 0 1 
i 4.134193 230.8418 0.7171673 50 72.25744 0 0.1 0 0 0 1 
i 4.502266 230.8418 0.7171673 57 72.86122 0 0.1 0 0 0 1 
i 11.11642 230.8418 0.7171673 68 70.24486 0 0.1 0 0 0 1 
i 11.23911 230.8418 0.7171673 71 70.44612 0 0.1 0 0 0 1 
i 11.48449 230.8418 0.7171673 66 70.84864 0 0.1 0 0 0 1 
i 11.97525 230.8418 0.7171673 75 71.65367 0 0.1 0 0 0 1 
i 12.34333 230.8418 0.7171673 73 72.25744 0 0.1 0 0 0 1 
i 12.58871 230.8418 0.7171673 78 72.65996 0 0.1 0 0 0 1 
i 12.7114 230.8418 0.7171673 80 72.86122 0 0.1 0 0 0 1 
i 2.784594 230.9359 0.5378755 72 74.30625 0 0.1 0 0 0 1 
i 3.520739 230.9359 0.5378755 76 75.51379 0 0.1 0 0 0 1 
i 10.99373 230.9359 0.5378755 95 74.30625 0 0.1 0 0 0 1 
i 11.72987 230.9359 0.5378755 99 75.51379 0 0.1 0 0 0 1 
i 1.061345 231.0537 0.5378755 50 70.15296 0 0.1 0 0 0 1 
i 1.981527 231.0537 1.075751 60 71.66239 0 0.1 0 0 0 1 
i 9.270478 231.0537 0.5378755 73 70.15296 0 0.1 0 0 0 1 
i 10.19066 231.0537 1.075751 83 71.66239 0 0.1 0 0 0 1 
i 4.630533 231.3194 1.434335 62 74.39816 0 0.1 0 0 0 1 
i 5.059951 231.3194 1.434335 56 75.10256 0 0.1 0 0 0 1 
i 5.550715 231.3194 0.7171673 66 75.90759 0 0.1 0 0 0 1 
i 6.102823 231.3194 0.7171673 72 76.81325 0 0.1 0 0 0 1 
i 12.83967 231.3194 1.434335 85 74.39816 0 0.1 0 0 0 1 
i 13.26908 231.3194 1.569409 79 75.10256 0 0.1 0 0 0 1 
i 13.75985 231.3194 0.7171673 89 75.90759 0 0.1 0 0 0 1 
i 14.31196 231.3194 0.7171673 95 76.81325 0 0.1 0 0 0 1 
i 3.029976 231.5013 0.5378755 36 70.46356 0 0.1 0 0 0 1 
i 11.23911 231.5013 0.5378755 59 70.46356 0 0.1 0 0 0 1 
i 2.784594 231.559 1.329795 47 70.04361 0 0.1 0 0 0 1 
i 3.152666 231.559 2.046962 49 70.64738 0 0.1 0 0 0 1 
i 3.398048 231.559 0.7171673 44 71.0499 0 0.1 0 0 0 1 
i 3.520739 231.559 2.046962 42 71.25115 0 0.1 0 0 0 1 
i 3.888811 231.559 1.329795 54 71.85493 0 0.1 0 0 0 1 
i 4.011502 231.559 0.7171673 51 72.05618 0 0.1 0 0 0 1 
i 4.256884 231.559 2.046962 56 72.4587 0 0.1 0 0 0 1 
i 4.624956 231.559 1.329795 59 73.06247 0 0.1 0 0 0 1 
i 10.99373 231.559 1.329795 70 70.04361 0 0.1 0 0 0 1 
i 11.3618 231.559 2.046962 72 70.64738 0 0.1 0 0 0 1 
i 11.60718 231.559 0.7171673 67 71.0499 0 0.1 0 0 0 1 
i 11.72987 231.559 2.046962 65 71.25115 0 0.1 0 0 0 1 
i 12.09794 231.559 1.329795 77 71.85493 0 0.1 0 0 0 1 
i 12.22063 231.559 0.7171673 74 72.05618 0 0.1 0 0 0 1 
i 12.46602 231.559 0.7171673 79 72.4587 0 0.1 0 0 0 1 
i 12.83409 231.559 1.329795 82 73.06247 0 0.1 0 0 0 1 
i 1 231.5916 0.5378755 51 70.05233 0 0.1 0 0 0 1 
i 9.209132 231.5916 0.5378755 74 70.05233 0 0.1 0 0 0 1 
i 2.845939 231.8003 1.075751 73 74.40621 0 0.1 0 0 0 1 
i 3.029976 231.8003 0.5378755 70 74.70809 0 0.1 0 0 0 1 
i 3.275357 231.8003 0.5378755 74 75.11061 0 0.1 0 0 0 1 
i 3.582084 231.8003 0.5378755 77 75.61375 0 0.1 0 0 0 1 
i 11.05507 231.8003 0.5378755 96 74.40621 0 0.1 0 0 0 1 
i 11.23911 231.8003 0.5378755 93 74.70809 0 0.1 0 0 0 1 
i 11.48449 231.8003 0.5378755 97 75.11061 0 0.1 0 0 0 1 
i 11.79122 231.8003 0.5378755 100 75.61375 0 0.1 0 0 0 1 
i 5.61206 232.0365 0.7171673 65 76.00822 0 0.1 0 0 0 1 
i 6.041478 232.0365 0.7171673 71 76.71262 0 0.1 0 0 0 1 
i 13.82119 232.0365 0.7171673 88 76.00822 0 0.1 0 0 0 1 
i 14.25061 232.0365 0.7171673 94 76.71262 0 0.1 0 0 0 1 
i 2.784594 232.0392 0.5378755 41 70.06105 0 0.1 0 0 0 1 
i 10.99373 232.0392 0.5378755 64 70.06105 0 0.1 0 0 0 1 
i 2.907285 232.1716 1.434335 46 70.24419 0 0.1 0 0 0 1 
i 3.029976 232.1716 1.434335 48 70.44545 0 0.1 0 0 0 1 
i 3.275357 232.1716 1.434335 43 70.84797 0 0.1 0 0 0 1 
i 3.459394 232.1716 1.434335 45 71.14985 0 0.1 0 0 0 1 
i 3.64343 232.1716 0.7171673 41 71.45174 0 0.1 0 0 0 1 
i 3.766121 232.1716 1.434335 53 71.653 0 0.1 0 0 0 1 
i 4.072848 232.1716 1.434335 52 72.15614 0 0.1 0 0 0 1 
i 4.134193 232.1716 1.434335 50 72.25677 0 0.1 0 0 0 1 
i 4.379575 232.1716 1.434335 55 72.65929 0 0.1 0 0 0 1 
i 4.502266 232.1716 1.434335 58 72.86055 0 0.1 0 0 0 1 
i 11.11642 232.1716 1.434335 69 70.24419 0 0.1 0 0 0 1 
i 11.23911 232.1716 1.434335 71 70.44545 0 0.1 0 0 0 1 
i 11.48449 232.1716 0.7171673 66 70.84797 0 0.1 0 0 0 1 
i 11.66853 232.1716 0.7171673 68 71.14985 0 0.1 0 0 0 1 
i 11.85256 232.1716 0.7171673 64 71.45174 0 0.1 0 0 0 1 
i 11.97525 232.1716 1.434335 76 71.653 0 0.1 0 0 0 1 
i 12.28198 232.1716 1.434335 75 72.15614 0 0.1 0 0 0 1 
i 12.34333 232.1716 1.434335 73 72.25677 0 0.1 0 0 0 1 
i 12.58871 232.1716 3.354229 78 72.65929 0 0.1 0 0 0 1 
i 12.7114 232.1716 1.434335 81 72.86055 0 0.1 0 0 0 1 
i 2.784594 232.3382 0.5378755 72 74.30558 0 0.1 0 0 0 1 
i 3.091321 232.3382 0.5378755 69 74.80872 0 0.1 0 0 0 1 
i 3.520739 232.3382 0.5378755 76 75.51312 0 0.1 0 0 0 1 
i 10.99373 232.3382 0.5378755 95 74.30558 0 0.1 0 0 0 1 
i 11.30045 232.3382 0.5378755 92 74.80872 0 0.1 0 0 0 1 
i 11.54583 232.3382 0.5378755 96 75.21124 0 0.1 0 0 0 1 
i 11.72987 232.3382 0.5378755 99 75.51312 0 0.1 0 0 0 1 
i 1.122691 232.6307 0.5378755 50 70.25291 0 0.1 0 0 0 1 
i 1.981527 232.6307 0.5378755 60 71.66172 0 0.1 0 0 0 1 
i 9.331823 232.6307 0.5378755 73 70.25291 0 0.1 0 0 0 1 
i 10.19066 232.6307 0.5378755 83 71.66172 0 0.1 0 0 0 1 
i 4.691879 232.7559 0.7171673 63 74.49811 0 0.1 0 0 0 1 
i 5.059951 232.7559 0.8500171 57 75.10189 0 0.1 0 0 0 1 
i 5.550715 232.7559 0.7171673 66 75.90692 0 0.1 0 0 0 1 
i 6.164169 232.7559 0.7171673 72 76.91321 0 0.1 0 0 0 1 
i 12.90101 232.7559 0.7171673 86 74.49811 0 0.1 0 0 0 1 
i 13.26908 232.7559 0.8500171 80 75.10189 0 0.1 0 0 0 1 
i 13.75985 232.7559 0.7171673 89 75.90692 0 0.1 0 0 0 1 
i 14.3733 232.7559 0.7171673 95 76.91321 0 0.1 0 0 0 1 
i 3.398048 232.8888 0.7171673 44 71.04922 0 0.1 0 0 0 1 
i 3.704775 232.8888 0.7171673 40 71.55237 0 0.1 0 0 0 1 
i 4.011502 232.8888 0.7171673 51 72.05551 0 0.1 0 0 0 1 
i 11.17776 232.8888 0.7171673 68 70.34482 0 0.1 0 0 0 1 
i 11.54583 232.8888 0.7171673 66 70.9486 0 0.1 0 0 0 1 
i 11.60718 232.8888 0.7171673 67 71.04922 0 0.1 0 0 0 1 
i 11.91391 232.8888 0.7171673 63 71.55237 0 0.1 0 0 0 1 
i 12.22063 232.8888 0.7171673 74 72.05551 0 0.1 0 0 0 1 
i 12.46602 232.8888 0.7171673 79 72.45803 0 0.1 0 0 0 1 
i 2.845939 233.0407 0.5378755 53 70.16101 0 0.1 0 0 0 1 
i 3.029976 233.0407 0.5378755 58 70.46289 0 0.1 0 0 0 1 
i 11.05507 233.0407 0.5378755 76 70.16101 0 0.1 0 0 0 1 
i 11.23911 233.0407 0.5378755 81 70.46289 0 0.1 0 0 0 1 
i 1 233.1686 0.5378755 51 70.05166 0 0.1 0 0 0 1 
i 2.104217 233.1686 0.5378755 61 71.86298 0 0.1 0 0 0 1 
i 9.209132 233.1686 0.5378755 74 70.05166 0 0.1 0 0 0 1 
i 10.31335 233.1686 0.5378755 84 71.86298 0 0.1 0 0 0 1 
i 4.569188 233.2117 0.5378755 64 74.3143 0 0.1 0 0 0 1 
i 12.77832 233.2117 0.5378755 87 74.3143 0 0.1 0 0 0 1 
i 2.907285 233.2369 0.5378755 73 74.50616 0 0.1 0 0 0 1 
i 3.029976 233.2369 0.5378755 71 74.70742 0 0.1 0 0 0 1 
i 3.275357 233.2369 0.5378755 75 75.10994 0 0.1 0 0 0 1 
i 3.64343 233.2369 0.5378755 77 75.71371 0 0.1 0 0 0 1 
i 11.11642 233.2369 0.5378755 96 74.50616 0 0.1 0 0 0 1 
i 11.23911 233.2369 0.5378755 94 74.70742 0 0.1 0 0 0 1 
i 11.48449 233.2369 0.5378755 98 75.10994 0 0.1 0 0 0 1 
i 11.85256 233.2369 0.5378755 100 75.71371 0 0.1 0 0 0 1 
i 4.569188 233.4731 0.7171673 61 74.29686 0 0.1 0 0 0 1 
i 5.182642 233.4731 2.052744 55 75.30314 0 0.1 0 0 0 1 
i 5.673405 233.4731 2.052744 65 76.10818 0 0.1 0 0 0 1 
i 6.041478 233.4731 1.335576 71 76.71195 0 0.1 0 0 0 1 
i 12.77832 233.4731 0.7171673 84 74.29686 0 0.1 0 0 0 1 
i 13.88254 233.4731 2.052744 88 76.10818 0 0.1 0 0 0 1 
i 14.25061 233.4731 1.335576 94 76.71195 0 0.1 0 0 0 1 
i 2.784594 233.5786 0.5378755 54 70.06038 0 0.1 0 0 0 1 
i 3.091321 233.5786 0.5378755 59 70.56352 0 0.1 0 0 0 1 
i 10.99373 233.5786 0.5378755 77 70.06038 0 0.1 0 0 0 1 
i 11.30045 233.5786 0.5378755 82 70.56352 0 0.1 0 0 0 1 
i 2.784594 233.7748 0.5378755 72 74.30491 0 0.1 0 0 0 1 
i 3.152666 233.7748 0.5378755 70 74.90868 0 0.1 0 0 0 1 
i 3.398048 233.7748 0.5378755 74 75.31119 0 0.1 0 0 0 1 
i 3.520739 233.7748 0.5378755 76 75.51245 0 0.1 0 0 0 1 
i 10.99373 233.7748 0.5378755 95 74.30491 0 0.1 0 0 0 1 
i 11.3618 233.7748 0.5378755 93 74.90868 0 0.1 0 0 0 1 
i 11.60718 233.7748 0.5378755 97 75.31119 0 0.1 0 0 0 1 
i 11.72987 233.7748 0.5378755 99 75.51245 0 0.1 0 0 0 1 
i 4.630533 234.0915 1.434335 62 74.39681 0 0.1 0 0 0 1 
i 4.691879 234.0915 1.434335 63 74.49744 0 0.1 0 0 0 1 
i 5.059951 234.0915 0.7171673 56 75.10122 0 0.1 0 0 0 1 
i 5.734751 234.0915 0.7171673 64 76.20813 0 0.1 0 0 0 1 
i 6.164169 234.0915 1.434335 72 76.91254 0 0.1 0 0 0 1 
i 12.83967 234.0915 1.434335 85 74.39681 0 0.1 0 0 0 1 
i 12.90101 234.0915 1.434335 86 74.49744 0 0.1 0 0 0 1 
i 13.26908 234.0915 0.7171673 79 75.10122 0 0.1 0 0 0 1 
i 13.94388 234.0915 0.7171673 87 76.20813 0 0.1 0 0 0 1 
i 14.3733 234.0915 1.434335 95 76.91254 0 0.1 0 0 0 1 
i 1.061345 234.0968 1.075751 50 70.15161 0 0.1 0 0 0 1 
i 1.122691 234.0968 1.075751 49 70.25224 0 0.1 0 0 0 1 
i 1.981527 234.0968 1.075751 61 71.66105 0 0.1 0 0 0 1 
i 2.165563 234.0968 0.5378755 62 71.96294 0 0.1 0 0 0 1 
i 9.270478 234.0968 1.075751 73 70.15161 0 0.1 0 0 0 1 
i 9.331823 234.0968 1.075751 72 70.25224 0 0.1 0 0 0 1 
i 10.19066 234.0968 1.075751 84 71.66105 0 0.1 0 0 0 1 
i 10.3747 234.0968 0.5378755 85 71.96294 0 0.1 0 0 0 1 
i 4.630533 234.2199 0.5378755 58 74.41426 0 0.1 0 0 0 1 
i 12.83967 234.2199 0.5378755 81 74.41426 0 0.1 0 0 0 1 
i 2.845939 234.5725 1.075751 72 74.40486 0 0.1 0 0 0 1 
i 2.907285 234.5725 1.075751 73 74.50549 0 0.1 0 0 0 1 
i 3.029976 234.5725 1.075751 71 74.70675 0 0.1 0 0 0 1 
i 3.214012 234.5725 1.075751 70 75.00864 0 0.1 0 0 0 1 
i 3.275357 234.5725 0.5378755 75 75.10927 0 0.1 0 0 0 1 
i 3.459394 234.5725 1.075751 74 75.41115 0 0.1 0 0 0 1 
i 3.582084 234.5725 0.5378755 76 75.61241 0 0.1 0 0 0 1 
i 3.64343 234.5725 1.075751 77 75.71304 0 0.1 0 0 0 1 
i 11.05507 234.5725 1.075751 95 74.40486 0 0.1 0 0 0 1 
i 11.11642 234.5725 1.075751 96 74.50549 0 0.1 0 0 0 1 
i 11.23911 234.5725 1.075751 94 74.70675 0 0.1 0 0 0 1 
i 11.42314 234.5725 1.075751 93 75.00864 0 0.1 0 0 0 1 
i 11.48449 234.5725 0.5378755 98 75.10927 0 0.1 0 0 0 1 
i 11.66853 234.5725 1.075751 97 75.41115 0 0.1 0 0 0 1 
i 11.79122 234.5725 1.075751 99 75.61241 0 0.1 0 0 0 1 
i 11.85256 234.5725 1.075751 100 75.71304 0 0.1 0 0 0 1 
i 2.907285 234.6176 0.5378755 46 70.26096 0 0.1 0 0 0 1 
i 3.029976 234.6176 1.075751 45 70.46222 0 0.1 0 0 0 1 
i 11.11642 234.6176 0.5378755 69 70.26096 0 0.1 0 0 0 1 
i 11.23911 234.6176 1.075751 68 70.46222 0 0.1 0 0 0 1 
i 2.042872 234.6347 0.5378755 60 71.76168 0 0.1 0 0 0 1 
i 10.252 234.6347 0.5378755 83 71.76168 0 0.1 0 0 0 1 
i 4.569188 234.7578 0.5378755 59 74.31363 0 0.1 0 0 0 1 
i 12.77832 234.7578 0.5378755 82 74.31363 0 0.1 0 0 0 1 
i 5.121297 234.8087 0.7171673 57 75.20184 0 0.1 0 0 0 1 
i 5.61206 234.8087 0.7171673 66 76.00688 0 0.1 0 0 0 1 
i 6.225514 234.8087 0.7171673 73 77.01317 0 0.1 0 0 0 1 
i 13.33043 234.8087 0.7171673 80 75.20184 0 0.1 0 0 0 1 
i 13.82119 234.8087 0.7171673 89 76.00688 0 0.1 0 0 0 1 
i 14.43465 234.8087 0.7171673 96 77.01317 0 0.1 0 0 0 1 
i 3.336703 235.1104 0.5378755 76 75.2099 0 0.1 0 0 0 1 
i 3.704775 235.1104 0.5378755 78 75.81367 0 0.1 0 0 0 1 
i 11.91391 235.1104 0.5378755 101 75.81367 0 0.1 0 0 0 1 
i 3.152666 235.1555 0.5378755 44 70.66348 0 0.1 0 0 0 1 
i 11.3618 235.1555 0.5378755 67 70.66348 0 0.1 0 0 0 1 
i 4.81457 235.629 0.7171673 63 74.69803 0 0.1 0 0 0 1 
i 5.059951 235.629 0.7171673 58 75.10055 0 0.1 0 0 0 1 
i 5.550715 235.629 0.7171673 68 75.90558 0 0.1 0 0 0 1 
i 6.28686 235.629 0.7171673 72 77.11312 0 0.1 0 0 0 1 
i 13.0237 235.629 0.7171673 86 74.69803 0 0.1 0 0 0 1 
i 13.26908 235.629 0.7171673 81 75.10055 0 0.1 0 0 0 1 
i 13.75985 235.629 0.7171673 91 75.90558 0 0.1 0 0 0 1 
i 14.49599 235.629 0.7171673 95 77.11312 0 0.1 0 0 0 1 
i 1.245382 235.7846 0.5378755 49 70.45283 0 0.1 0 0 0 1 
i 1.981527 235.7846 0.5378755 59 71.66038 0 0.1 0 0 0 1 
i 9.454514 235.7846 0.5378755 72 70.45283 0 0.1 0 0 0 1 
i 10.19066 235.7846 0.5378755 82 71.66038 0 0.1 0 0 0 1 
i 4.691879 235.8038 1.075751 61 74.51421 0 0.1 0 0 0 1 
i 12.90101 235.8038 1.075751 84 74.51421 0 0.1 0 0 0 1 
i 2.845939 236.0837 1.075751 38 70.15966 0 0.1 0 0 0 1 
i 2.907285 236.0837 0.5378755 40 70.26029 0 0.1 0 0 0 1 
i 3.029976 236.0837 0.5378755 37 70.46155 0 0.1 0 0 0 1 
i 3.214012 236.0837 0.5378755 35 70.76344 0 0.1 0 0 0 1 
i 11.05507 236.0837 1.075751 61 70.15966 0 0.1 0 0 0 1 
i 11.11642 236.0837 0.5378755 63 70.26029 0 0.1 0 0 0 1 
i 11.23911 236.0837 0.5378755 60 70.46155 0 0.1 0 0 0 1 
i 11.42314 236.0837 0.5378755 58 70.76344 0 0.1 0 0 0 1 
i 1 236.3225 0.5378755 51 70.05031 0 0.1 0 0 0 1 
i 2.226908 236.3225 0.5378755 62 72.06289 0 0.1 0 0 0 1 
i 9.209132 236.3225 0.5378755 74 70.05031 0 0.1 0 0 0 1 
i 10.43604 236.3225 0.5378755 85 72.06289 0 0.1 0 0 0 1 
i 4.569188 236.3462 2.703728 60 74.29551 0 0.1 0 0 0 1 
i 5.305333 236.3462 1.335576 55 75.50306 0 0.1 0 0 0 1 
i 5.796096 236.3462 0.7171673 65 76.30809 0 0.1 0 0 0 1 
i 6.041478 236.3462 0.7171673 70 76.71061 0 0.1 0 0 0 1 
i 12.77832 236.3462 2.703728 83 74.29551 0 0.1 0 0 0 1 
i 13.51446 236.3462 2.703728 78 75.50306 0 0.1 0 0 0 1 
i 14.00523 236.3462 0.7171673 88 76.30809 0 0.1 0 0 0 1 
i 14.25061 236.3462 0.7171673 93 76.71061 0 0.1 0 0 0 1 
i 2.784594 236.6216 0.5378755 39 70.05904 0 0.1 0 0 0 1 
i 2.96863 236.6216 0.5378755 41 70.36092 0 0.1 0 0 0 1 
i 3.152666 236.6216 0.5378755 36 70.66281 0 0.1 0 0 0 1 
i 10.99373 236.6216 0.5378755 62 70.05904 0 0.1 0 0 0 1 
i 11.17776 236.6216 0.5378755 64 70.36092 0 0.1 0 0 0 1 
i 11.3618 236.6216 0.5378755 59 70.66281 0 0.1 0 0 0 1 
i 4.81457 236.9646 1.434335 63 74.69736 0 0.1 0 0 0 1 
i 5.059951 236.9646 0.7171673 58 75.09987 0 0.1 0 0 0 1 
i 5.550715 236.9646 1.434335 68 75.90491 0 0.1 0 0 0 1 
i 5.857442 236.9646 0.7171673 64 76.40805 0 0.1 0 0 0 1 
i 6.102823 236.9646 0.7171673 69 76.81057 0 0.1 0 0 0 1 
i 6.28686 236.9646 0.7171673 72 77.11245 0 0.1 0 0 0 1 
i 13.0237 236.9646 1.434335 86 74.69736 0 0.1 0 0 0 1 
i 13.26908 236.9646 0.7171673 81 75.09987 0 0.1 0 0 0 1 
i 13.75985 236.9646 0.7171673 90 75.90491 0 0.1 0 0 0 1 
i 14.06657 236.9646 0.7171673 87 76.40805 0 0.1 0 0 0 1 
i 14.31196 236.9646 0.7171673 92 76.81057 0 0.1 0 0 0 1 
i 14.49599 236.9646 0.7171673 95 77.11245 0 0.1 0 0 0 1 
i 3.766121 237.0708 0.5378755 73 75.91363 0 0.1 0 0 0 1 
i 11.97525 237.0708 0.5378755 96 75.91363 0 0.1 0 0 0 1 
i 1.061345 237.2507 1.075751 51 70.15027 0 0.1 0 0 0 1 
i 1.245382 237.2507 1.075751 48 70.45216 0 0.1 0 0 0 1 
i 1.981527 237.2507 0.5378755 60 71.65971 0 0.1 0 0 0 1 
i 2.288254 237.2507 0.5378755 63 72.16285 0 0.1 0 0 0 1 
i 9.270478 237.2507 1.075751 74 70.15027 0 0.1 0 0 0 1 
i 9.454514 237.2507 0.5378755 71 70.45216 0 0.1 0 0 0 1 
i 10.19066 237.2507 0.5378755 83 71.65971 0 0.1 0 0 0 1 
i 10.49739 237.2507 0.5378755 86 72.16285 0 0.1 0 0 0 1 
i 4.630533 237.2762 0.5378755 67 74.41291 0 0.1 0 0 0 1 
i 4.691879 237.2762 0.5378755 69 74.51354 0 0.1 0 0 0 1 
i 12.83967 237.2762 0.5378755 90 74.41291 0 0.1 0 0 0 1 
i 12.90101 237.2762 0.5378755 92 74.51354 0 0.1 0 0 0 1 
i 2.784594 237.6087 0.5378755 66 74.30356 0 0.1 0 0 0 1 
i 10.99373 237.6087 0.5378755 89 74.30356 0 0.1 0 0 0 1 
i 5.121297 237.6818 0.7171673 59 75.2005 0 0.1 0 0 0 1 
i 5.305333 237.6818 0.7171673 56 75.50239 0 0.1 0 0 0 1 
i 5.796096 237.6818 0.7171673 65 76.30742 0 0.1 0 0 0 1 
i 6.041478 237.6818 0.7171673 70 76.70994 0 0.1 0 0 0 1 
i 6.348205 237.6818 0.7171673 73 77.21308 0 0.1 0 0 0 1 
i 13.33043 237.6818 0.7171673 82 75.2005 0 0.1 0 0 0 1 
i 13.82119 237.6818 0.7171673 91 76.00553 0 0.1 0 0 0 1 
i 14.00523 237.6818 0.7171673 88 76.30742 0 0.1 0 0 0 1 
i 14.25061 237.6818 0.7171673 93 76.70994 0 0.1 0 0 0 1 
i 14.55734 237.6818 0.7171673 96 77.21308 0 0.1 0 0 0 1 
i 2.042872 237.7886 0.5378755 59 71.76034 0 0.1 0 0 0 1 
i 2.226908 237.7886 0.5378755 62 72.06222 0 0.1 0 0 0 1 
i 9.515859 237.7886 0.5378755 71 70.55279 0 0.1 0 0 0 1 
i 10.252 237.7886 0.5378755 82 71.76034 0 0.1 0 0 0 1 
i 10.43604 237.7886 0.5378755 85 72.06222 0 0.1 0 0 0 1 
i 4.569188 237.8141 0.5378755 68 74.31229 0 0.1 0 0 0 1 
i 4.753224 237.8141 0.5378755 70 74.61417 0 0.1 0 0 0 1 
i 12.77832 237.8141 0.5378755 91 74.31229 0 0.1 0 0 0 1 
i 12.96236 237.8141 0.5378755 93 74.61417 0 0.1 0 0 0 1 
i 3.275357 238.1245 0.5378755 58 70.8634 0 0.1 0 0 0 1 
i 11.48449 238.1245 0.5378755 81 70.8634 0 0.1 0 0 0 1 
i 4.81457 238.3328 0.7171673 62 74.69669 0 0.1 0 0 0 1 
i 5.059951 238.3328 0.7171673 57 75.0992 0 0.1 0 0 0 1 
i 5.428024 238.3328 0.7171673 55 75.70298 0 0.1 0 0 0 1 
i 5.550715 238.3328 0.7171673 67 75.90423 0 0.1 0 0 0 1 
i 5.918787 238.3328 0.7171673 64 76.50801 0 0.1 0 0 0 1 
i 6.164169 238.3328 0.7171673 69 76.91052 0 0.1 0 0 0 1 
i 6.28686 238.3328 0.7171673 71 77.11178 0 0.1 0 0 0 1 
i 13.0237 238.3328 0.7171673 85 74.69669 0 0.1 0 0 0 1 
i 13.26908 238.3328 0.7171673 80 75.0992 0 0.1 0 0 0 1 
i 13.75985 238.3328 0.7171673 90 75.90423 0 0.1 0 0 0 1 
i 14.12792 238.3328 0.7171673 87 76.50801 0 0.1 0 0 0 1 
i 14.3733 238.3328 0.7171673 92 76.91052 0 0.1 0 0 0 1 
i 14.49599 238.3328 0.7171673 94 77.11178 0 0.1 0 0 0 1 
i 2.845939 238.5433 1.075751 65 74.40352 0 0.1 0 0 0 1 
i 3.766121 238.5433 1.075751 74 75.91296 0 0.1 0 0 0 1 
i 11.05507 238.5433 1.075751 88 74.40352 0 0.1 0 0 0 1 
i 11.97525 238.5433 1.075751 97 75.91296 0 0.1 0 0 0 1 
i 2.784594 238.6624 0.5378755 51 70.05836 0 0.1 0 0 0 1 
i 10.99373 238.6624 0.5378755 74 70.05836 0 0.1 0 0 0 1 
i 1.122691 238.7525 0.5378755 51 70.25023 0 0.1 0 0 0 1 
i 1.245382 238.7525 0.5378755 49 70.45149 0 0.1 0 0 0 1 
i 1.981527 238.7525 0.5378755 61 71.65904 0 0.1 0 0 0 1 
i 2.349599 238.7525 0.5378755 63 72.26281 0 0.1 0 0 0 1 
i 9.331823 238.7525 0.5378755 74 70.25023 0 0.1 0 0 0 1 
i 9.454514 238.7525 0.5378755 72 70.45149 0 0.1 0 0 0 1 
i 10.19066 238.7525 0.5378755 84 71.65904 0 0.1 0 0 0 1 
i 10.55873 238.7525 0.5378755 86 72.26281 0 0.1 0 0 0 1 
i 4.81457 238.9714 0.5378755 50 74.71413 0 0.1 0 0 0 1 
i 13.0237 238.9714 0.5378755 73 74.71413 0 0.1 0 0 0 1 
i 4.569188 239.0499 1.989145 61 74.29417 0 0.1 0 0 0 1 
i 4.93726 239.0499 0.7171673 63 74.89795 0 0.1 0 0 0 1 
i 5.182642 239.0499 1.989145 59 75.30046 0 0.1 0 0 0 1 
i 5.305333 239.0499 0.7171673 56 75.50172 0 0.1 0 0 0 1 
i 5.673405 239.0499 1.989145 68 76.10549 0 0.1 0 0 0 1 
i 5.796096 239.0499 1.989145 66 76.30675 0 0.1 0 0 0 1 
i 6.041478 239.0499 0.7171673 70 76.70927 0 0.1 0 0 0 1 
i 6.40955 239.0499 1.271978 73 77.31304 0 0.1 0 0 0 1 
i 12.77832 239.0499 1.989145 84 74.29417 0 0.1 0 0 0 1 
i 13.14639 239.0499 0.7171673 86 74.89795 0 0.1 0 0 0 1 
i 13.39177 239.0499 1.989145 82 75.30046 0 0.1 0 0 0 1 
i 13.51446 239.0499 0.7171673 79 75.50172 0 0.1 0 0 0 1 
i 13.88254 239.0499 1.989145 91 76.10549 0 0.1 0 0 0 1 
i 14.00523 239.0499 1.989145 89 76.30675 0 0.1 0 0 0 1 
i 14.25061 239.0499 0.7171673 93 76.70927 0 0.1 0 0 0 1 
i 14.61868 239.0499 1.271978 96 77.31304 0 0.1 0 0 0 1 
i 1 239.2904 0.5378755 50 70.04897 0 0.1 0 0 0 1 
i 1.368072 239.2904 0.5378755 48 70.65275 0 0.1 0 0 0 1 
i 2.104217 239.2904 0.5378755 59 71.86029 0 0.1 0 0 0 1 
i 2.226908 239.2904 0.5378755 62 72.06155 0 0.1 0 0 0 1 
i 9.209132 239.2904 0.5378755 73 70.04897 0 0.1 0 0 0 1 
i 9.577205 239.2904 0.5378755 71 70.65275 0 0.1 0 0 0 1 
i 10.31335 239.2904 0.5378755 82 71.86029 0 0.1 0 0 0 1 
i 10.43604 239.2904 0.5378755 85 72.06155 0 0.1 0 0 0 1 
i 4.569188 239.5092 1.529843 55 74.31161 0 0.1 0 0 0 1 
i 12.77832 239.5092 0.5378755 78 74.31161 0 0.1 0 0 0 1 
i 4.691879 239.6048 0.7171673 60 74.49476 0 0.1 0 0 0 1 
i 4.81457 239.6048 1.434335 62 74.69602 0 0.1 0 0 0 1 
i 4.998606 239.6048 0.7171673 64 74.9979 0 0.1 0 0 0 1 
i 5.059951 239.6048 1.434335 58 75.09853 0 0.1 0 0 0 1 
i 5.366678 239.6048 1.434335 57 75.60168 0 0.1 0 0 0 1 
i 5.550715 239.6048 0.7171673 67 75.90356 0 0.1 0 0 0 1 
i 5.918787 239.6048 1.434335 65 76.50734 0 0.1 0 0 0 1 
i 6.102823 239.6048 1.434335 71 76.80922 0 0.1 0 0 0 1 
i 6.164169 239.6048 1.434335 69 76.90985 0 0.1 0 0 0 1 
i 6.28686 239.6048 1.434335 72 77.11111 0 0.1 0 0 0 1 
i 12.90101 239.6048 0.7171673 83 74.49476 0 0.1 0 0 0 1 
i 13.0237 239.6048 1.434335 85 74.69602 0 0.1 0 0 0 1 
i 13.20774 239.6048 0.7171673 87 74.9979 0 0.1 0 0 0 1 
i 13.26908 239.6048 1.434335 81 75.09853 0 0.1 0 0 0 1 
i 13.57581 239.6048 0.7171673 80 75.60168 0 0.1 0 0 0 1 
i 13.63716 239.6048 1.434335 78 75.70231 0 0.1 0 0 0 1 
i 13.75985 239.6048 0.7171673 90 75.90356 0 0.1 0 0 0 1 
i 14.12792 239.6048 1.434335 88 76.50734 0 0.1 0 0 0 1 
i 14.31196 239.6048 0.7171673 94 76.80922 0 0.1 0 0 0 1 
i 14.3733 239.6048 1.434335 92 76.90985 0 0.1 0 0 0 1 
i 14.49599 239.6048 0.7171673 95 77.11111 0 0.1 0 0 0 1 
i 2.845939 239.6639 0.5378755 43 70.15832 0 0.1 0 0 0 1 
i 3.275357 239.6639 0.5378755 31 70.86273 0 0.1 0 0 0 1 
i 11.05507 239.6639 0.5378755 66 70.15832 0 0.1 0 0 0 1 
i 11.48449 239.6639 0.5378755 54 70.86273 0 0.1 0 0 0 1 
i 2.907285 240.0517 0.5378755 64 74.50348 0 0.1 0 0 0 1 
i 3.766121 240.0517 0.5378755 74 75.91229 0 0.1 0 0 0 1 
i 11.11642 240.0517 0.5378755 87 74.50348 0 0.1 0 0 0 1 
i 11.97525 240.0517 0.5378755 97 75.91229 0 0.1 0 0 0 1 
i 1.061345 240.1488 1.075751 49 70.14893 0 0.1 0 0 0 1 
i 1.122691 240.1488 1.075751 50 70.24956 0 0.1 0 0 0 1 
i 1.245382 240.1488 1.075751 48 70.45082 0 0.1 0 0 0 1 
i 1.429418 240.1488 0.5378755 47 70.7527 0 0.1 0 0 0 1 
i 1.981527 240.1488 1.075751 61 71.65836 0 0.1 0 0 0 1 
i 2.165563 240.1488 1.075751 60 71.96025 0 0.1 0 0 0 1 
i 2.288254 240.1488 1.075751 62 72.16151 0 0.1 0 0 0 1 
i 2.349599 240.1488 1.075751 63 72.26214 0 0.1 0 0 0 1 
i 9.270478 240.1488 0.5378755 72 70.14893 0 0.1 0 0 0 1 
i 9.331823 240.1488 1.075751 73 70.24956 0 0.1 0 0 0 1 
i 9.454514 240.1488 0.5378755 71 70.45082 0 0.1 0 0 0 1 
i 9.63855 240.1488 0.5378755 70 70.7527 0 0.1 0 0 0 1 
i 10.19066 240.1488 1.075751 84 71.65836 0 0.1 0 0 0 1 
i 10.3747 240.1488 1.075751 83 71.96025 0 0.1 0 0 0 1 
i 10.49739 240.1488 1.075751 85 72.16151 0 0.1 0 0 0 1 
i 10.55873 240.1488 1.075751 86 72.26214 0 0.1 0 0 0 1 
i 2.784594 240.2018 0.5378755 42 70.05769 0 0.1 0 0 0 1 
i 3.336703 240.2018 0.5378755 30 70.96335 0 0.1 0 0 0 1 
i 10.99373 240.2018 0.5378755 65 70.05769 0 0.1 0 0 0 1 
i 11.54583 240.2018 0.5378755 53 70.96335 0 0.1 0 0 0 1 
i 4.93726 240.3219 0.7171673 63 74.89727 0 0.1 0 0 0 1 
i 5.305333 240.3219 0.7171673 56 75.50105 0 0.1 0 0 0 1 
i 5.980132 240.3219 0.7171673 64 76.60797 0 0.1 0 0 0 1 
i 6.041478 240.3219 0.7171673 70 76.7086 0 0.1 0 0 0 1 
i 13.14639 240.3219 0.7171673 86 74.89727 0 0.1 0 0 0 1 
i 13.33043 240.3219 0.7171673 80 75.19916 0 0.1 0 0 0 1 
i 13.51446 240.3219 0.7171673 79 75.50105 0 0.1 0 0 0 1 
i 14.18926 240.3219 0.7171673 87 76.60797 0 0.1 0 0 0 1 
i 14.25061 240.3219 0.7171673 93 76.7086 0 0.1 0 0 0 1 
i 14.55734 240.3219 0.7171673 94 77.21174 0 0.1 0 0 0 1 
i 14.61868 240.3219 0.7171673 95 77.31237 0 0.1 0 0 0 1 
i 4.630533 240.4438 0.5378755 67 74.41157 0 0.1 0 0 0 1 
i 4.81457 240.4438 0.5378755 72 74.71346 0 0.1 0 0 0 1 
i 12.83967 240.4438 0.5378755 90 74.41157 0 0.1 0 0 0 1 
i 13.0237 240.4438 0.5378755 95 74.71346 0 0.1 0 0 0 1 
i 2.784594 240.5895 0.5378755 65 74.30222 0 0.1 0 0 0 1 
i 3.888811 240.5895 0.5378755 75 76.11354 0 0.1 0 0 0 1 
i 10.99373 240.5895 0.5378755 88 74.30222 0 0.1 0 0 0 1 
i 12.09794 240.5895 0.5378755 98 76.11354 0 0.1 0 0 0 1 
i 1.184036 240.6867 0.5378755 51 70.35019 0 0.1 0 0 0 1 
i 9.393168 240.6867 0.5378755 74 70.35019 0 0.1 0 0 0 1 
i 9.515859 240.6867 0.5378755 72 70.55145 0 0.1 0 0 0 1 
i 9.577205 240.6867 0.5378755 71 70.65208 0 0.1 0 0 0 1 
i 4.569188 240.9817 0.5378755 68 74.31094 0 0.1 0 0 0 1 
i 4.875915 240.9817 0.5378755 73 74.81409 0 0.1 0 0 0 1 
i 12.77832 240.9817 0.5378755 91 74.31094 0 0.1 0 0 0 1 
i 13.08505 240.9817 0.5378755 96 74.81409 0 0.1 0 0 0 1 
i 2.907285 241.2408 0.5378755 50 70.25828 0 0.1 0 0 0 1 
i 3.275357 241.2408 0.5378755 58 70.86205 0 0.1 0 0 0 1 
i 11.11642 241.2408 0.5378755 73 70.25828 0 0.1 0 0 0 1 
i 11.48449 241.2408 0.5378755 81 70.86205 0 0.1 0 0 0 1 
i 2.845939 241.454 0.5378755 65 74.40218 0 0.1 0 0 0 1 
i 2.907285 241.454 1.075751 63 74.50281 0 0.1 0 0 0 1 
i 3.766121 241.454 0.5378755 75 75.91161 0 0.1 0 0 0 1 
i 3.950157 241.454 1.075751 76 76.2135 0 0.1 0 0 0 1 
i 11.05507 241.454 0.5378755 88 74.40218 0 0.1 0 0 0 1 
i 11.11642 241.454 1.075751 86 74.50281 0 0.1 0 0 0 1 
i 11.97525 241.454 0.5378755 98 75.91161 0 0.1 0 0 0 1 
i 12.15929 241.454 1.075751 99 76.2135 0 0.1 0 0 0 1 
i 2.784594 241.7787 0.5378755 52 70.05702 0 0.1 0 0 0 1 
i 3.398048 241.7787 0.5378755 60 71.06331 0 0.1 0 0 0 1 
i 10.99373 241.7787 0.5378755 75 70.05702 0 0.1 0 0 0 1 
i 11.60718 241.7787 0.5378755 83 71.06331 0 0.1 0 0 0 1 
i 4.691879 241.9522 0.5378755 60 74.51153 0 0.1 0 0 0 1 
i 4.81457 241.9522 1.075751 59 74.71279 0 0.1 0 0 0 1 
i 12.90101 241.9522 0.5378755 83 74.51153 0 0.1 0 0 0 1 
i 13.0237 241.9522 1.075751 82 74.71279 0 0.1 0 0 0 1 
i 2.784594 241.9919 0.5378755 64 74.30155 0 0.1 0 0 0 1 
i 3.827466 241.9919 0.5378755 74 76.01224 0 0.1 0 0 0 1 
i 10.99373 241.9919 0.5378755 87 74.30155 0 0.1 0 0 0 1 
i 12.0366 241.9919 0.5378755 97 76.01224 0 0.1 0 0 0 1 
i 1.490763 242.0924 0.5378755 49 70.85266 0 0.1 0 0 0 1 
i 1.981527 242.0924 0.5378755 57 71.65769 0 0.1 0 0 0 1 
i 9.699895 242.0924 0.5378755 72 70.85266 0 0.1 0 0 0 1 
i 10.19066 242.0924 0.5378755 80 71.65769 0 0.1 0 0 0 1 
i 4.93726 242.4901 0.5378755 58 74.91405 0 0.1 0 0 0 1 
i 13.14639 242.4901 0.5378755 81 74.91405 0 0.1 0 0 0 1 
i 1 242.6303 0.5378755 53 70.04763 0 0.1 0 0 0 1 
i 2.47229 242.6303 0.5378755 62 72.46273 0 0.1 0 0 0 1 
i 9.209132 242.6303 0.5378755 76 70.04763 0 0.1 0 0 0 1 
i 10.68142 242.6303 0.5378755 85 72.46273 0 0.1 0 0 0 1 
i 2.845939 242.7069 1.075751 48 70.15698 0 0.1 0 0 0 1 
i 3.275357 242.7069 1.075751 50 70.86138 0 0.1 0 0 0 1 
i 3.459394 242.7069 0.5378755 51 71.16327 0 0.1 0 0 0 1 
i 11.05507 242.7069 1.075751 71 70.15698 0 0.1 0 0 0 1 
i 11.48449 242.7069 0.5378755 73 70.86138 0 0.1 0 0 0 1 
i 11.66853 242.7069 0.5378755 74 71.16327 0 0.1 0 0 0 1 
i 3.029976 243.0684 1.027924 63 74.7034 0 0.1 0 0 0 1 
i 3.766121 243.0684 0.5378755 74 75.91094 0 0.1 0 0 0 1 
i 11.23911 243.0684 1.027924 86 74.7034 0 0.1 0 0 0 1 
i 11.97525 243.0684 0.5378755 97 75.91094 0 0.1 0 0 0 1 
i 11.54583 243.2448 0.5378755 73 70.96201 0 0.1 0 0 0 1 
i 4.630533 243.3546 1.075751 53 74.41023 0 0.1 0 0 0 1 
i 4.691879 243.3546 0.5378755 54 74.51086 0 0.1 0 0 0 1 
i 4.81457 243.3546 0.5378755 51 74.71212 0 0.1 0 0 0 1 
i 4.998606 243.3546 0.5378755 49 75.014 0 0.1 0 0 0 1 
i 12.83967 243.3546 1.075751 76 74.41023 0 0.1 0 0 0 1 
i 12.90101 243.3546 0.5378755 77 74.51086 0 0.1 0 0 0 1 
i 13.0237 243.3546 0.5378755 74 74.71212 0 0.1 0 0 0 1 
i 13.20774 243.3546 0.5378755 72 75.014 0 0.1 0 0 0 1 
i 1.061345 243.5585 0.5378755 54 70.14759 0 0.1 0 0 0 1 
i 1.490763 243.5585 0.5378755 49 70.85199 0 0.1 0 0 0 1 
i 1.981527 243.5585 1.075751 57 71.65702 0 0.1 0 0 0 1 
i 9.270478 243.5585 0.5378755 77 70.14759 0 0.1 0 0 0 1 
i 9.699895 243.5585 0.5378755 72 70.85199 0 0.1 0 0 0 1 
i 10.19066 243.5585 1.075751 80 71.65702 0 0.1 0 0 0 1 
i 2.784594 243.6063 0.5378755 65 74.30088 0 0.1 0 0 0 1 
i 4.011502 243.6063 0.5378755 76 76.31346 0 0.1 0 0 0 1 
i 10.99373 243.6063 0.5378755 88 74.30088 0 0.1 0 0 0 1 
i 12.22063 243.6063 0.5378755 99 76.31346 0 0.1 0 0 0 1 
i 4.753224 243.8925 0.5378755 55 74.61149 0 0.1 0 0 0 1 
i 4.875915 243.8925 0.5378755 52 74.81275 0 0.1 0 0 0 1 
i 4.93726 243.8925 0.5378755 50 74.91338 0 0.1 0 0 0 1 
i 12.96236 243.8925 0.5378755 78 74.61149 0 0.1 0 0 0 1 
i 13.08505 243.8925 0.5378755 75 74.81275 0 0.1 0 0 0 1 
i 13.14639 243.8925 0.5378755 73 74.91338 0 0.1 0 0 0 1 
i 1 244.0964 0.5378755 53 70.04696 0 0.1 0 0 0 1 
i 1.552109 244.0964 0.5378755 48 70.95262 0 0.1 0 0 0 1 
i 2.47229 244.0964 0.5378755 62 72.46205 0 0.1 0 0 0 1 
i 9.209132 244.0964 0.5378755 76 70.04696 0 0.1 0 0 0 1 
i 9.761241 244.0964 0.5378755 71 70.95262 0 0.1 0 0 0 1 
i 10.68142 244.0964 0.5378755 85 72.46205 0 0.1 0 0 0 1 
i 3.029976 244.3947 0.5378755 43 70.4582 0 0.1 0 0 0 1 
i 3.275357 244.3947 0.5378755 37 70.86071 0 0.1 0 0 0 1 
i 11.23911 244.3947 0.5378755 66 70.4582 0 0.1 0 0 0 1 
i 11.48449 244.3947 0.5378755 60 70.86071 0 0.1 0 0 0 1 
i 2.845939 244.4708 0.5378755 66 74.40084 0 0.1 0 0 0 1 
i 3.029976 244.4708 0.5378755 63 74.70273 0 0.1 0 0 0 1 
i 3.766121 244.4708 0.5378755 74 75.91027 0 0.1 0 0 0 1 
i 4.072848 244.4708 0.5378755 77 76.41342 0 0.1 0 0 0 1 
i 11.05507 244.4708 0.5378755 89 74.40084 0 0.1 0 0 0 1 
i 11.23911 244.4708 0.5378755 86 74.70273 0 0.1 0 0 0 1 
i 11.97525 244.4708 0.5378755 97 75.91027 0 0.1 0 0 0 1 
i 12.28198 244.4708 0.5378755 100 76.41342 0 0.1 0 0 0 1 
i 2.784594 244.9326 0.5378755 39 70.05568 0 0.1 0 0 0 1 
i 3.520739 244.9326 0.5378755 33 71.26323 0 0.1 0 0 0 1 
i 10.99373 244.9326 0.5378755 62 70.05568 0 0.1 0 0 0 1 
i 11.72987 244.9326 0.5378755 56 71.26323 0 0.1 0 0 0 1 
i 2.784594 245.0087 0.5378755 65 74.30021 0 0.1 0 0 0 1 
i 3.091321 245.0087 0.5378755 62 74.80335 0 0.1 0 0 0 1 
i 3.827466 245.0087 0.5378755 73 76.0109 0 0.1 0 0 0 1 
i 4.011502 245.0087 0.5378755 76 76.31279 0 0.1 0 0 0 1 
i 10.99373 245.0087 0.5378755 88 74.30021 0 0.1 0 0 0 1 
i 11.30045 245.0087 0.5378755 85 74.80335 0 0.1 0 0 0 1 
i 12.0366 245.0087 0.5378755 96 76.0109 0 0.1 0 0 0 1 
i 12.22063 245.0087 0.5378755 99 76.31279 0 0.1 0 0 0 1 
i 1.122691 245.0603 0.5378755 54 70.24755 0 0.1 0 0 0 1 
i 1.490763 245.0603 0.5378755 49 70.85132 0 0.1 0 0 0 1 
i 1.981527 245.0603 0.5378755 57 71.65635 0 0.1 0 0 0 1 
i 2.594981 245.0603 0.5378755 63 72.66264 0 0.1 0 0 0 1 
i 9.331823 245.0603 0.5378755 77 70.24755 0 0.1 0 0 0 1 
i 9.699895 245.0603 0.5378755 72 70.85132 0 0.1 0 0 0 1 
i 10.19066 245.0603 0.5378755 80 71.65635 0 0.1 0 0 0 1 
i 10.80411 245.0603 0.5378755 86 72.66264 0 0.1 0 0 0 1 
i 5.059951 245.3066 0.5378755 72 75.11396 0 0.1 0 0 0 1 
i 13.26908 245.3066 0.5378755 95 75.11396 0 0.1 0 0 0 1 
i 1 245.5982 0.5378755 53 70.04629 0 0.1 0 0 0 1 
i 1.613454 245.5982 0.5378755 48 71.05258 0 0.1 0 0 0 1 
i 2.104217 245.5982 0.5378755 56 71.85761 0 0.1 0 0 0 1 
i 2.47229 245.5982 0.5378755 62 72.46138 0 0.1 0 0 0 1 
i 9.209132 245.5982 0.5378755 76 70.04629 0 0.1 0 0 0 1 
i 9.822586 245.5982 0.5378755 71 71.05258 0 0.1 0 0 0 1 
i 10.31335 245.5982 0.5378755 79 71.85761 0 0.1 0 0 0 1 
i 10.68142 245.5982 0.5378755 85 72.46138 0 0.1 0 0 0 1 
i 4.569188 245.8445 0.5378755 65 74.30893 0 0.1 0 0 0 1 
i 12.77832 245.8445 0.5378755 88 74.30893 0 0.1 0 0 0 1 
i 2.845939 245.8608 0.5378755 60 70.15564 0 0.1 0 0 0 1 
i 3.029976 245.8608 0.5378755 54 70.45753 0 0.1 0 0 0 1 
i 3.275357 245.8608 0.5843945 63 70.86004 0 0.1 0 0 0 1 
i 3.582084 245.8608 0.5378755 69 71.36319 0 0.1 0 0 0 1 
i 11.05507 245.8608 0.5378755 83 70.15564 0 0.1 0 0 0 1 
i 11.23911 245.8608 0.5378755 77 70.45753 0 0.1 0 0 0 1 
i 11.48449 245.8608 0.5843945 86 70.86004 0 0.1 0 0 0 1 
i 11.79122 245.8608 0.5378755 92 71.36319 0 0.1 0 0 0 1 
i 2.907285 245.9073 0.5378755 65 74.5008 0 0.1 0 0 0 1 
i 3.766121 245.9073 0.5378755 75 75.9096 0 0.1 0 0 0 1 
i 4.134193 245.9073 0.5378755 77 76.51338 0 0.1 0 0 0 1 
i 11.11642 245.9073 0.5378755 88 74.5008 0 0.1 0 0 0 1 
i 11.97525 245.9073 0.5378755 98 75.9096 0 0.1 0 0 0 1 
i 12.34333 245.9073 0.5378755 100 76.51338 0 0.1 0 0 0 1 
i 2.784594 246.3987 0.5378755 59 70.05501 0 0.1 0 0 0 1 
i 3.091321 246.3987 0.5378755 53 70.55816 0 0.1 0 0 0 1 
i 3.336703 246.3987 0.5957946 62 70.96067 0 0.1 0 0 0 1 
i 3.520739 246.3987 0.5378755 68 71.26256 0 0.1 0 0 0 1 
i 10.99373 246.3987 0.5378755 82 70.05501 0 0.1 0 0 0 1 
i 11.30045 246.3987 0.5378755 76 70.55816 0 0.1 0 0 0 1 
i 11.54583 246.3987 0.5378755 85 70.96067 0 0.1 0 0 0 1 
i 11.72987 246.3987 0.5378755 91 71.26256 0 0.1 0 0 0 1 
i 2.784594 246.4452 0.5378755 64 74.29954 0 0.1 0 0 0 1 
i 3.888811 246.4452 0.5378755 74 76.11086 0 0.1 0 0 0 1 
i 4.011502 246.4452 0.5378755 76 76.31212 0 0.1 0 0 0 1 
i 10.99373 246.4452 0.5378755 87 74.29954 0 0.1 0 0 0 1 
i 11.3618 246.4452 1.873452 85 74.90331 0 0.1 0 0 0 1 
i 12.09794 246.4452 0.5378755 97 76.11086 0 0.1 0 0 0 1 
i 12.22063 246.4452 0.5378755 99 76.31212 0 0.1 0 0 0 1 
i 1.061345 246.4566 0.5378755 53 70.14625 0 0.1 0 0 0 1 
i 1.122691 246.4566 1.075751 54 70.24688 0 0.1 0 0 0 1 
i 1.490763 246.4566 0.5378755 48 70.85065 0 0.1 0 0 0 1 
i 1.6748 246.4566 0.5378755 47 71.15254 0 0.1 0 0 0 1 
i 1.981527 246.4566 1.075751 57 71.65568 0 0.1 0 0 0 1 
i 2.165563 246.4566 1.075751 56 71.95757 0 0.1 0 0 0 1 
i 2.594981 246.4566 2.145305 63 72.66197 0 0.1 0 0 0 1 
i 9.270478 246.4566 0.5378755 76 70.14625 0 0.1 0 0 0 1 
i 9.331823 246.4566 1.075751 77 70.24688 0 0.1 0 0 0 1 
i 9.699895 246.4566 1.075751 71 70.85065 0 0.1 0 0 0 1 
i 9.883932 246.4566 0.5378755 70 71.15254 0 0.1 0 0 0 1 
i 10.19066 246.4566 1.075751 80 71.65568 0 0.1 0 0 0 1 
i 10.3747 246.4566 1.075751 79 71.95757 0 0.1 0 0 0 1 
i 10.80411 246.4566 2.145305 86 72.66197 0 0.1 0 0 0 1 
i 4.630533 246.7791 0.5378755 57 74.40889 0 0.1 0 0 0 1 
i 5.059951 246.7791 0.5378755 45 75.11329 0 0.1 0 0 0 1 
i 12.83967 246.7791 0.5378755 80 74.40889 0 0.1 0 0 0 1 
i 13.26908 246.7791 0.5378755 68 75.11329 0 0.1 0 0 0 1 
i 1.184036 246.9945 0.5378755 55 70.34751 0 0.1 0 0 0 1 
i 1.552109 246.9945 0.5378755 49 70.95128 0 0.1 0 0 0 1 
i 1.613454 246.9945 0.5378755 48 71.05191 0 0.1 0 0 0 1 
i 2.47229 246.9945 0.5378755 62 72.46071 0 0.1 0 0 0 1 
i 9.393168 246.9945 0.5378755 78 70.34751 0 0.1 0 0 0 1 
i 9.761241 246.9945 0.5378755 72 70.95128 0 0.1 0 0 0 1 
i 2.907285 247.2429 1.075751 65 74.50013 0 0.1 0 0 0 1 
i 3.029976 247.2429 1.075751 62 74.70138 0 0.1 0 0 0 1 
i 3.214012 247.2429 0.5378755 61 75.00327 0 0.1 0 0 0 1 
i 3.766121 247.2429 0.5378755 75 75.90893 0 0.1 0 0 0 1 
i 3.950157 247.2429 1.075751 74 76.21082 0 0.1 0 0 0 1 
i 4.072848 247.2429 1.075751 76 76.41208 0 0.1 0 0 0 1 
i 4.134193 247.2429 1.075751 77 76.5127 0 0.1 0 0 0 1 
i 11.11642 247.2429 1.075751 88 74.50013 0 0.1 0 0 0 1 
i 11.42314 247.2429 0.5378755 84 75.00327 0 0.1 0 0 0 1 
i 11.97525 247.2429 0.5378755 98 75.90893 0 0.1 0 0 0 1 
i 12.15929 247.2429 1.075751 97 76.21082 0 0.1 0 0 0 1 
i 12.28198 247.2429 1.075751 99 76.41208 0 0.1 0 0 0 1 
i 12.34333 247.2429 1.075751 100 76.5127 0 0.1 0 0 0 1 
i 4.569188 247.3169 0.5378755 56 74.30826 0 0.1 0 0 0 1 
i 5.121297 247.3169 0.5378755 44 75.21392 0 0.1 0 0 0 1 
i 12.77832 247.3169 0.5378755 79 74.30826 0 0.1 0 0 0 1 
i 13.33043 247.3169 0.5378755 67 75.21392 0 0.1 0 0 0 1 
i 2.907285 247.3627 0.5378755 40 70.2556 0 0.1 0 0 0 1 
i 3.029976 247.3627 0.5378755 42 70.45686 0 0.1 0 0 0 1 
i 3.275357 247.3627 0.5378755 37 70.85937 0 0.1 0 0 0 1 
i 3.64343 247.3627 0.5378755 34 71.46314 0 0.1 0 0 0 1 
i 11.11642 247.3627 0.5378755 63 70.2556 0 0.1 0 0 0 1 
i 11.23911 247.3627 0.5378755 65 70.45686 0 0.1 0 0 0 1 
i 11.48449 247.3627 0.5378755 60 70.85937 0 0.1 0 0 0 1 
i 11.85256 247.3627 0.5378755 57 71.46314 0 0.1 0 0 0 1 
i 2.784594 247.7808 0.5378755 64 74.29887 0 0.1 0 0 0 1 
i 4.195539 247.7808 0.5378755 78 76.61333 0 0.1 0 0 0 1 
i 10.99373 247.7808 0.5378755 87 74.29887 0 0.1 0 0 0 1 
i 12.40467 247.7808 0.5378755 101 76.61333 0 0.1 0 0 0 1 
i 2.784594 247.9006 0.5378755 41 70.05434 0 0.1 0 0 0 1 
i 3.152666 247.9006 0.5378755 44 70.65811 0 0.1 0 0 0 1 
i 3.398048 247.9006 0.5378755 38 71.06063 0 0.1 0 0 0 1 
i 3.520739 247.9006 0.5378755 36 71.26189 0 0.1 0 0 0 1 
i 10.99373 247.9006 0.5378755 64 70.05434 0 0.1 0 0 0 1 
i 11.3618 247.9006 0.5378755 67 70.65811 0 0.1 0 0 0 1 
i 11.60718 247.9006 0.5378755 61 71.06063 0 0.1 0 0 0 1 
i 11.72987 247.9006 0.5378755 59 71.26189 0 0.1 0 0 0 1 
i 1.245382 248.0641 0.5378755 54 70.44746 0 0.1 0 0 0 1 
i 1.490763 248.0641 0.5378755 50 70.84998 0 0.1 0 0 0 1 
i 1.981527 248.0641 0.5378755 59 71.65501 0 0.1 0 0 0 1 
i 9.454514 248.0641 0.5378755 77 70.44746 0 0.1 0 0 0 1 
i 9.699895 248.0641 0.5378755 73 70.84998 0 0.1 0 0 0 1 
i 10.19066 248.0641 0.5378755 82 71.65501 0 0.1 0 0 0 1 
i 4.691879 248.2875 0.5378755 64 74.50885 0 0.1 0 0 0 1 
i 5.059951 248.2875 0.5378755 73 75.11262 0 0.1 0 0 0 1 
i 12.90101 248.2875 0.5378755 87 74.50885 0 0.1 0 0 0 1 
i 13.26908 248.2875 0.5378755 96 75.11262 0 0.1 0 0 0 1 
i 1 248.6019 0.5378755 52 70.04495 0 0.1 0 0 0 1 
i 1.736145 248.6019 0.5378755 48 71.25249 0 0.1 0 0 0 1 
i 2.226908 248.6019 0.5378755 56 72.05753 0 0.1 0 0 0 1 
i 2.47229 248.6019 0.5378755 60 72.46004 0 0.1 0 0 0 1 
i 9.209132 248.6019 0.5378755 75 70.04495 0 0.1 0 0 0 1 
i 9.945277 248.6019 0.5378755 71 71.25249 0 0.1 0 0 0 1 
i 10.43604 248.6019 0.5378755 79 72.05753 0 0.1 0 0 0 1 
i 10.68142 248.6019 0.5378755 83 72.46004 0 0.1 0 0 0 1 
i 2.845939 248.759 1.075751 42 70.1543 0 0.1 0 0 0 1 
i 2.907285 248.759 1.075751 41 70.25493 0 0.1 0 0 0 1 
i 3.029976 248.759 1.075751 43 70.45618 0 0.1 0 0 0 1 
i 3.214012 248.759 1.075751 44 70.75807 0 0.1 0 0 0 1 
i 3.275357 248.759 1.075751 39 70.8587 0 0.1 0 0 0 1 
i 3.459394 248.759 1.075751 40 71.16059 0 0.1 0 0 0 1 
i 3.582084 248.759 1.075751 38 71.36184 0 0.1 0 0 0 1 
i 3.64343 248.759 0.5378755 37 71.46247 0 0.1 0 0 0 1 
i 11.05507 248.759 1.075751 65 70.1543 0 0.1 0 0 0 1 
i 11.11642 248.759 1.075751 64 70.25493 0 0.1 0 0 0 1 
i 11.23911 248.759 1.075751 66 70.45618 0 0.1 0 0 0 1 
i 11.42314 248.759 1.075751 67 70.75807 0 0.1 0 0 0 1 
i 11.48449 248.759 0.5378755 62 70.8587 0 0.1 0 0 0 1 
i 11.66853 248.759 1.075751 63 71.16059 0 0.1 0 0 0 1 
i 11.79122 248.759 1.075751 61 71.36184 0 0.1 0 0 0 1 
i 11.85256 248.759 0.5378755 60 71.46247 0 0.1 0 0 0 1 
i 4.569188 248.8253 0.5378755 66 74.30759 0 0.1 0 0 0 1 
i 5.182642 248.8253 0.5378755 75 75.31388 0 0.1 0 0 0 1 
i 12.77832 248.8253 0.5378755 89 74.30759 0 0.1 0 0 0 1 
i 13.39177 248.8253 0.5378755 98 75.31388 0 0.1 0 0 0 1 
i 3.275357 249.102 1.940231 63 75.10323 0 0.1 0 0 0 1 
i 3.766121 249.102 0.5378755 72 75.90826 0 0.1 0 0 0 1 
i 11.48449 249.102 1.940231 86 75.10323 0 0.1 0 0 0 1 
i 11.97525 249.102 0.5378755 95 75.90826 0 0.1 0 0 0 1 
i 3.704775 249.2968 0.5378755 36 71.5631 0 0.1 0 0 0 1 
i 11.54583 249.2968 0.5378755 62 70.95933 0 0.1 0 0 0 1 
i 11.91391 249.2968 0.5378755 59 71.5631 0 0.1 0 0 0 1 
i 1.061345 249.4603 0.5378755 51 70.14491 0 0.1 0 0 0 1 
i 1.245382 249.4603 0.5378755 54 70.44679 0 0.1 0 0 0 1 
i 1.490763 249.4603 0.5378755 50 70.84931 0 0.1 0 0 0 1 
i 1.79749 249.4603 0.5378755 47 71.35245 0 0.1 0 0 0 1 
i 1.981527 249.4603 1.075751 59 71.65434 0 0.1 0 0 0 1 
i 2.288254 249.4603 1.075751 56 72.15748 0 0.1 0 0 0 1 
i 2.533635 249.4603 0.5378755 60 72.56 0 0.1 0 0 0 1 
i 9.270478 249.4603 0.5378755 74 70.14491 0 0.1 0 0 0 1 
i 9.454514 249.4603 0.5378755 77 70.44679 0 0.1 0 0 0 1 
i 9.699895 249.4603 0.5378755 73 70.84931 0 0.1 0 0 0 1 
i 10.00662 249.4603 0.5378755 70 71.35245 0 0.1 0 0 0 1 
i 10.19066 249.4603 1.075751 82 71.65434 0 0.1 0 0 0 1 
i 10.49739 249.4603 1.075751 79 72.15748 0 0.1 0 0 0 1 
i 10.74277 249.4603 1.075751 83 72.56 0 0.1 0 0 0 1 
i 2.784594 249.6399 0.5378755 67 74.2982 0 0.1 0 0 0 1 
i 4.256884 249.6399 0.5378755 76 76.71329 0 0.1 0 0 0 1 
i 10.99373 249.6399 0.5378755 90 74.2982 0 0.1 0 0 0 1 
i 12.46602 249.6399 0.5378755 99 76.71329 0 0.1 0 0 0 1 
i 4.630533 249.6898 0.5378755 63 74.40755 0 0.1 0 0 0 1 
i 4.691879 249.6898 1.075751 62 74.50818 0 0.1 0 0 0 1 
i 5.059951 249.6898 1.075751 64 75.11195 0 0.1 0 0 0 1 
i 5.243987 249.6898 1.075751 65 75.41384 0 0.1 0 0 0 1 
i 12.83967 249.6898 0.5378755 86 74.40755 0 0.1 0 0 0 1 
i 12.90101 249.6898 1.075751 85 74.50818 0 0.1 0 0 0 1 
i 13.26908 249.6898 1.075751 87 75.11195 0 0.1 0 0 0 1 
i 13.45312 249.6898 1.075751 88 75.41384 0 0.1 0 0 0 1 
i 1 249.9982 0.5378755 52 70.04428 0 0.1 0 0 0 1 
i 1.306727 249.9982 0.5378755 55 70.54742 0 0.1 0 0 0 1 
i 1.552109 249.9982 0.5378755 51 70.94994 0 0.1 0 0 0 1 
i 1.736145 249.9982 0.5378755 48 71.25182 0 0.1 0 0 0 1 
i 2.47229 249.9982 0.5378755 60 72.45937 0 0.1 0 0 0 1 
i 9.209132 249.9982 0.5378755 75 70.04428 0 0.1 0 0 0 1 
i 9.515859 249.9982 0.5378755 78 70.54742 0 0.1 0 0 0 1 
i 9.761241 249.9982 0.5378755 74 70.94994 0 0.1 0 0 0 1 
i 9.945277 249.9982 0.5378755 71 71.25182 0 0.1 0 0 0 1 
i 2.845939 250.5043 1.075751 68 74.39816 0 0.1 0 0 0 1 
i 3.766121 250.5043 1.075751 71 75.90759 0 0.1 0 0 0 1 
i 4.318229 250.5043 0.5378755 77 76.81325 0 0.1 0 0 0 1 
i 11.05507 250.5043 1.075751 91 74.39816 0 0.1 0 0 0 1 
i 11.97525 250.5043 1.075751 94 75.90759 0 0.1 0 0 0 1 
i 12.52736 250.5043 0.5378755 100 76.81325 0 0.1 0 0 0 1 
i 1.122691 250.8907 0.5378755 51 70.24486 0 0.1 0 0 0 1 
i 1.245382 250.8907 0.5378755 54 70.44612 0 0.1 0 0 0 1 
i 1.490763 250.8907 0.5378755 49 70.84864 0 0.1 0 0 0 1 
i 1.858836 250.8907 0.5378755 47 71.45241 0 0.1 0 0 0 1 
i 1.981527 250.8907 0.5378755 58 71.65367 0 0.1 0 0 0 1 
i 2.349599 250.8907 0.5378755 56 72.25744 0 0.1 0 0 0 1 
i 2.594981 250.8907 0.5378755 60 72.65996 0 0.1 0 0 0 1 
i 2.717672 250.8907 0.6894098 62 72.86122 0 0.1 0 0 0 1 
i 9.331823 250.8907 0.5378755 74 70.24486 0 0.1 0 0 0 1 
i 9.454514 250.8907 0.5378755 77 70.44612 0 0.1 0 0 0 1 
i 9.699895 250.8907 0.5378755 72 70.84864 0 0.1 0 0 0 1 
i 10.06797 250.8907 0.5378755 70 71.45241 0 0.1 0 0 0 1 
i 10.19066 250.8907 0.5378755 81 71.65367 0 0.1 0 0 0 1 
i 10.55873 250.8907 0.5378755 79 72.25744 0 0.1 0 0 0 1 
i 10.80411 250.8907 0.5378755 83 72.65996 0 0.1 0 0 0 1 
i 10.9268 250.8907 0.5378755 85 72.86122 0 0.1 0 0 0 1 
i 4.256884 251.0422 0.5378755 76 76.71262 0 0.1 0 0 0 1 
i 11.54583 251.0422 0.5378755 85 75.20319 0 0.1 0 0 0 1 
i 12.46602 251.0422 0.5378755 99 76.71262 0 0.1 0 0 0 1 
i 4.81457 251.3042 0.5378755 57 74.70876 0 0.1 0 0 0 1 
i 5.059951 251.3042 0.5378755 51 75.11128 0 0.1 0 0 0 1 
i 13.0237 251.3042 0.5378755 80 74.70876 0 0.1 0 0 0 1 
i 13.26908 251.3042 0.5378755 74 75.11128 0 0.1 0 0 0 1 
i 3.766121 251.3709 0.5378755 42 71.66306 0 0.1 0 0 0 1 
i 11.97525 251.3709 0.5378755 65 71.66306 0 0.1 0 0 0 1 
i 1 251.4286 0.5378755 53 70.04361 0 0.1 0 0 0 1 
i 1.368072 251.4286 0.5378755 55 70.64738 0 0.1 0 0 0 1 
i 1.613454 251.4286 0.5378755 51 71.0499 0 0.1 0 0 0 1 
i 1.736145 251.4286 0.5378755 48 71.25115 0 0.1 0 0 0 1 
i 2.104217 251.4286 0.5378755 59 71.85493 0 0.1 0 0 0 1 
i 2.226908 251.4286 0.5378755 57 72.05618 0 0.1 0 0 0 1 
i 2.47229 251.4286 0.5378755 61 72.4587 0 0.1 0 0 0 1 
i 2.840362 251.4286 1.050218 63 73.06247 0 0.1 0 0 0 1 
i 9.209132 251.4286 0.5378755 76 70.04361 0 0.1 0 0 0 1 
i 9.577205 251.4286 0.5378755 78 70.64738 0 0.1 0 0 0 1 
i 9.822586 251.4286 0.5378755 74 71.0499 0 0.1 0 0 0 1 
i 9.945277 251.4286 0.5378755 71 71.25115 0 0.1 0 0 0 1 
i 10.31335 251.4286 0.5378755 82 71.85493 0 0.1 0 0 0 1 
i 10.43604 251.4286 0.5378755 80 72.05618 0 0.1 0 0 0 1 
i 10.68142 251.4286 0.5378755 84 72.4587 0 0.1 0 0 0 1 
i 11.04949 251.4286 1.050218 86 73.06247 0 0.1 0 0 0 1 
i 4.569188 251.8421 0.5378755 54 74.30625 0 0.1 0 0 0 1 
i 5.305333 251.8421 0.5378755 47 75.51379 0 0.1 0 0 0 1 
i 12.77832 251.8421 0.5378755 77 74.30625 0 0.1 0 0 0 1 
i 13.51446 251.8421 0.5378755 70 75.51379 0 0.1 0 0 0 1 
i 2.784594 251.9087 0.5378755 48 70.053 0 0.1 0 0 0 1 
i 10.99373 251.9087 0.5378755 71 70.053 0 0.1 0 0 0 1 
i 2.907285 251.9409 0.5378755 69 74.49811 0 0.1 0 0 0 1 
i 3.766121 251.9409 0.5378755 72 75.90692 0 0.1 0 0 0 1 
i 4.379575 251.9409 0.5378755 77 76.91321 0 0.1 0 0 0 1 
i 11.11642 251.9409 0.5378755 92 74.49811 0 0.1 0 0 0 1 
i 11.97525 251.9409 0.5378755 95 75.90692 0 0.1 0 0 0 1 
i 12.58871 251.9409 0.5378755 100 76.91321 0 0.1 0 0 0 1 
i 1.061345 252.2205 1.075751 53 70.14356 0 0.1 0 0 0 1 
i 1.122691 252.2205 1.075751 52 70.24419 0 0.1 0 0 0 1 
i 1.245382 252.2205 1.075751 54 70.44545 0 0.1 0 0 0 1 
i 1.429418 252.2205 0.5378755 55 70.74734 0 0.1 0 0 0 1 
i 1.490763 252.2205 0.5378755 50 70.84797 0 0.1 0 0 0 1 
i 1.6748 252.2205 0.5378755 51 71.14985 0 0.1 0 0 0 1 
i 1.79749 252.2205 1.075751 49 71.35111 0 0.1 0 0 0 1 
i 1.858836 252.2205 1.075751 47 71.45174 0 0.1 0 0 0 1 
i 1.981527 252.2205 1.075751 58 71.653 0 0.1 0 0 0 1 
i 2.165563 252.2205 1.075751 59 71.95488 0 0.1 0 0 0 1 
i 2.288254 252.2205 1.075751 57 72.15614 0 0.1 0 0 0 1 
i 2.349599 252.2205 1.075751 56 72.25677 0 0.1 0 0 0 1 
i 2.533635 252.2205 0.5378755 61 72.55866 0 0.1 0 0 0 1 
i 2.594981 252.2205 1.075751 60 72.65929 0 0.1 0 0 0 1 
i 2.717672 252.2205 2.131751 62 72.86055 0 0.1 0 0 0 1 
i 2.901708 252.2205 0.5378755 64 73.16243 0 0.1 0 0 0 1 
i 9.270478 252.2205 0.5378755 76 70.14356 0 0.1 0 0 0 1 
i 9.331823 252.2205 1.075751 75 70.24419 0 0.1 0 0 0 1 
i 9.454514 252.2205 0.5378755 77 70.44545 0 0.1 0 0 0 1 
i 9.63855 252.2205 0.5378755 78 70.74734 0 0.1 0 0 0 1 
i 9.699895 252.2205 1.075751 73 70.84797 0 0.1 0 0 0 1 
i 9.883932 252.2205 0.5378755 74 71.14985 0 0.1 0 0 0 1 
i 10.00662 252.2205 1.075751 72 71.35111 0 0.1 0 0 0 1 
i 10.06797 252.2205 1.075751 70 71.45174 0 0.1 0 0 0 1 
i 10.19066 252.2205 1.075751 81 71.653 0 0.1 0 0 0 1 
i 10.3747 252.2205 1.075751 82 71.95488 0 0.1 0 0 0 1 
i 10.49739 252.2205 1.075751 80 72.15614 0 0.1 0 0 0 1 
i 10.55873 252.2205 1.075751 79 72.25677 0 0.1 0 0 0 1 
i 10.74277 252.2205 1.075751 84 72.55866 0 0.1 0 0 0 1 
i 10.80411 252.2205 1.075751 83 72.65929 0 0.1 0 0 0 1 
i 10.9268 252.2205 1.593875 85 72.86055 0 0.1 0 0 0 1 
i 11.11084 252.2205 0.5378755 87 73.16243 0 0.1 0 0 0 1 
i 2.784594 252.4788 0.5378755 67 74.29686 0 0.1 0 0 0 1 
i 3.888811 252.4788 0.5378755 70 76.10818 0 0.1 0 0 0 1 
i 4.256884 252.4788 0.5378755 76 76.71195 0 0.1 0 0 0 1 
i 10.99373 252.4788 0.5378755 90 74.29686 0 0.1 0 0 0 1 
i 11.60718 252.4788 0.5378755 85 75.30314 0 0.1 0 0 0 1 
i 12.09794 252.4788 0.5378755 93 76.10818 0 0.1 0 0 0 1 
i 12.46602 252.4788 0.5378755 99 76.71195 0 0.1 0 0 0 1 
i 4.630533 252.7066 0.5378755 74 74.40621 0 0.1 0 0 0 1 
i 4.81457 252.7066 0.5378755 68 74.70809 0 0.1 0 0 0 1 
i 5.059951 252.7066 0.5378755 77 75.11061 0 0.1 0 0 0 1 
i 5.366678 252.7066 0.5378755 84 75.61375 0 0.1 0 0 0 1 
i 12.83967 252.7066 0.5378755 97 74.40621 0 0.1 0 0 0 1 
i 13.0237 252.7066 0.5378755 91 74.70809 0 0.1 0 0 0 1 
i 13.26908 252.7066 0.5378755 100 75.11061 0 0.1 0 0 0 1 
i 13.57581 252.7066 0.5378755 107 75.61375 0 0.1 0 0 0 1 
i 1.184036 252.7583 0.5378755 51 70.34482 0 0.1 0 0 0 1 
i 1.613454 252.7583 0.5378755 50 71.04922 0 0.1 0 0 0 1 
i 1.736145 252.7583 0.5378755 48 71.25048 0 0.1 0 0 0 1 
i 2.47229 252.7583 0.5378755 61 72.45803 0 0.1 0 0 0 1 
i 2.840362 252.7583 0.5378755 63 73.0618 0 0.1 0 0 0 1 
i 9.393168 252.7583 0.5378755 74 70.34482 0 0.1 0 0 0 1 
i 9.515859 252.7583 0.5378755 76 70.54608 0 0.1 0 0 0 1 
i 9.577205 252.7583 0.5378755 77 70.64671 0 0.1 0 0 0 1 
i 9.945277 252.7583 0.5378755 71 71.25048 0 0.1 0 0 0 1 
i 11.04949 252.7583 0.5378755 86 73.0618 0 0.1 0 0 0 1 
i 2.845939 252.9103 1.075751 49 70.15296 0 0.1 0 0 0 1 
i 3.766121 252.9103 0.5378755 40 71.66239 0 0.1 0 0 0 1 
i 11.05507 252.9103 1.075751 72 70.15296 0 0.1 0 0 0 1 
i 11.97525 252.9103 0.5378755 63 71.66239 0 0.1 0 0 0 1 
i 4.569188 253.2445 0.5378755 73 74.30558 0 0.1 0 0 0 1 
i 4.875915 253.2445 0.5378755 67 74.80872 0 0.1 0 0 0 1 
i 5.121297 253.2445 0.5378755 76 75.21124 0 0.1 0 0 0 1 
i 5.305333 253.2445 0.5378755 83 75.51312 0 0.1 0 0 0 1 
i 12.77832 253.2445 0.5378755 96 74.30558 0 0.1 0 0 0 1 
i 13.08505 253.2445 0.5378755 90 74.80872 0 0.1 0 0 0 1 
i 13.33043 253.2445 0.5698905 99 75.21124 0 0.1 0 0 0 1 
i 13.51446 253.2445 0.5378755 106 75.51312 0 0.1 0 0 0 1 
i 2.845939 253.2765 0.5378755 67 74.39681 0 0.1 0 0 0 1 
i 2.907285 253.2765 1.075751 69 74.49744 0 0.1 0 0 0 1 
i 3.459394 253.2765 0.5378755 61 75.4031 0 0.1 0 0 0 1 
i 3.766121 253.2765 0.5378755 71 75.90625 0 0.1 0 0 0 1 
i 3.950157 253.2765 1.075751 70 76.20813 0 0.1 0 0 0 1 
i 4.318229 253.2765 0.5378755 76 76.81191 0 0.1 0 0 0 1 
i 4.379575 253.2765 1.075751 77 76.91254 0 0.1 0 0 0 1 
i 11.05507 253.2765 0.5378755 90 74.39681 0 0.1 0 0 0 1 
i 11.11642 253.2765 1.075751 92 74.49744 0 0.1 0 0 0 1 
i 11.66853 253.2765 0.5378755 84 75.4031 0 0.1 0 0 0 1 
i 11.97525 253.2765 0.5378755 94 75.90625 0 0.1 0 0 0 1 
i 12.15929 253.2765 1.075751 93 76.20813 0 0.1 0 0 0 1 
i 12.58871 253.2765 0.5378755 100 76.91254 0 0.1 0 0 0 1 
i 3.827466 253.4481 0.5378755 39 71.76302 0 0.1 0 0 0 1 
i 12.0366 253.4481 0.5378755 62 71.76302 0 0.1 0 0 0 1 
i 2.784594 253.8143 0.5378755 68 74.29618 0 0.1 0 0 0 1 
i 3.336703 253.8143 0.5378755 63 75.20184 0 0.1 0 0 0 1 
i 3.827466 253.8143 0.5378755 72 76.00688 0 0.1 0 0 0 1 
i 4.44092 253.8143 0.5378755 78 77.01317 0 0.1 0 0 0 1 
i 10.99373 253.8143 0.5378755 91 74.29618 0 0.1 0 0 0 1 
i 11.54583 253.8143 0.5378755 86 75.20184 0 0.1 0 0 0 1 
i 11.60718 253.8143 0.5378755 85 75.30247 0 0.1 0 0 0 1 
i 12.0366 253.8143 0.5378755 95 76.00688 0 0.1 0 0 0 1 
i 12.46602 253.8143 0.5378755 100 76.71128 0 0.1 0 0 0 1 
i 12.65005 253.8143 0.5378755 101 77.01317 0 0.1 0 0 0 1 
i 4.691879 254.1431 0.5378755 54 74.50616 0 0.1 0 0 0 1 
i 4.81457 254.1431 0.5378755 56 74.70742 0 0.1 0 0 0 1 
i 5.059951 254.1431 0.5378755 51 75.10994 0 0.1 0 0 0 1 
i 5.428024 254.1431 0.5378755 49 75.71371 0 0.1 0 0 0 1 
i 12.90101 254.1431 0.5378755 77 74.50616 0 0.1 0 0 0 1 
i 13.0237 254.1431 0.5378755 79 74.70742 0 0.1 0 0 0 1 
i 13.26908 254.1431 0.5378755 74 75.10994 0 0.1 0 0 0 1 
i 13.63716 254.1431 0.5378755 72 75.71371 0 0.1 0 0 0 1 
i 2.907285 254.4872 0.5378755 41 70.25291 0 0.1 0 0 0 1 
i 3.766121 254.4872 0.5378755 62 71.66172 0 0.1 0 0 0 1 
i 11.11642 254.4872 0.5378755 64 70.25291 0 0.1 0 0 0 1 
i 11.97525 254.4872 0.5378755 85 71.66172 0 0.1 0 0 0 1 
i 4.569188 254.681 0.5378755 55 74.30491 0 0.1 0 0 0 1 
i 4.93726 254.681 0.5378755 58 74.90868 0 0.1 0 0 0 1 
i 5.182642 254.681 0.5378755 53 75.31119 0 0.1 0 0 0 1 
i 5.305333 254.681 0.5378755 50 75.51245 0 0.1 0 0 0 1 
i 12.77832 254.681 0.5378755 78 74.30491 0 0.1 0 0 0 1 
i 13.14639 254.681 0.5378755 81 74.90868 0 0.1 0 0 0 1 
i 13.39177 254.681 0.5378755 76 75.31119 0 0.1 0 0 0 1 
i 13.51446 254.681 0.5378755 73 75.51245 0 0.1 0 0 0 1 
i 3.029976 254.814 0.5378755 69 74.69803 0 0.1 0 0 0 1 
i 3.275357 254.814 0.5378755 64 75.10055 0 0.1 0 0 0 1 
i 3.766121 254.814 0.5378755 73 75.90558 0 0.1 0 0 0 1 
i 4.502266 254.814 0.5378755 77 77.11312 0 0.1 0 0 0 1 
i 11.23911 254.814 0.5378755 92 74.69803 0 0.1 0 0 0 1 
i 11.48449 254.814 0.5378755 87 75.10055 0 0.1 0 0 0 1 
i 11.97525 254.814 0.5378755 96 75.90558 0 0.1 0 0 0 1 
i 12.7114 254.814 0.5378755 100 77.11312 0 0.1 0 0 0 1 
i 2.784594 255.0251 0.5378755 44 70.05166 0 0.1 0 0 0 1 
i 3.888811 255.0251 0.5378755 65 71.86298 0 0.1 0 0 0 1 
i 10.99373 255.0251 0.5378755 67 70.05166 0 0.1 0 0 0 1 
i 12.09794 255.0251 0.5378755 88 71.86298 0 0.1 0 0 0 1 
i 2.784594 255.3519 0.5378755 66 74.29551 0 0.1 0 0 0 1 
i 3.520739 255.3519 0.5378755 62 75.50306 0 0.1 0 0 0 1 
i 4.011502 255.3519 0.5378755 70 76.30809 0 0.1 0 0 0 1 
i 4.256884 255.3519 0.5378755 75 76.71061 0 0.1 0 0 0 1 
i 10.99373 255.3519 0.5378755 89 74.29551 0 0.1 0 0 0 1 
i 11.72987 255.3519 0.5378755 85 75.50306 0 0.1 0 0 0 1 
i 12.22063 255.3519 0.5378755 93 76.30809 0 0.1 0 0 0 1 
i 12.46602 255.3519 0.5378755 98 76.71061 0 0.1 0 0 0 1 
i 4.630533 255.4787 1.075751 56 74.40486 0 0.1 0 0 0 1 
i 4.691879 255.4787 1.075751 55 74.50549 0 0.1 0 0 0 1 
i 4.81457 255.4787 1.075751 57 74.70675 0 0.1 0 0 0 1 
i 4.998606 255.4787 1.075751 58 75.00864 0 0.1 0 0 0 1 
i 5.059951 255.4787 1.075751 53 75.10927 0 0.1 0 0 0 1 
i 5.243987 255.4787 1.075751 54 75.41115 0 0.1 0 0 0 1 
i 5.366678 255.4787 1.075751 52 75.61241 0 0.1 0 0 0 1 
i 5.428024 255.4787 1.075751 51 75.71304 0 0.1 0 0 0 1 
i 12.83967 255.4787 1.075751 79 74.40486 0 0.1 0 0 0 1 
i 12.90101 255.4787 1.075751 78 74.50549 0 0.1 0 0 0 1 
i 13.0237 255.4787 1.075751 80 74.70675 0 0.1 0 0 0 1 
i 13.20774 255.4787 1.075751 81 75.00864 0 0.1 0 0 0 1 
i 13.26908 255.4787 1.075751 76 75.10927 0 0.1 0 0 0 1 
i 13.45312 255.4787 1.075751 77 75.41115 0 0.1 0 0 0 1 
i 13.57581 255.4787 1.075751 75 75.61241 0 0.1 0 0 0 1 
i 13.63716 255.4787 1.075751 74 75.71304 0 0.1 0 0 0 1 
i 2.845939 255.9533 0.5378755 51 70.15161 0 0.1 0 0 0 1 
i 2.907285 255.9533 0.5378755 53 70.25224 0 0.1 0 0 0 1 
i 3.766121 255.9533 0.5378755 32 71.66105 0 0.1 0 0 0 1 
i 3.950157 255.9533 0.5378755 30 71.96294 0 0.1 0 0 0 1 
i 11.05507 255.9533 0.5378755 74 70.15161 0 0.1 0 0 0 1 
i 11.11642 255.9533 0.5378755 76 70.25224 0 0.1 0 0 0 1 
i 11.97525 255.9533 0.5378755 55 71.66105 0 0.1 0 0 0 1 
i 12.15929 255.9533 0.5378755 53 71.96294 0 0.1 0 0 0 1 
i 2.845939 256.1496 1.075751 66 74.39547 0 0.1 0 0 0 1 
i 3.029976 256.1496 1.075751 69 74.69736 0 0.1 0 0 0 1 
i 3.275357 256.1496 0.5378755 64 75.09987 0 0.1 0 0 0 1 
i 3.582084 256.1496 0.5378755 61 75.60302 0 0.1 0 0 0 1 
i 3.766121 256.1496 1.075751 73 75.90491 0 0.1 0 0 0 1 
i 4.072848 256.1496 1.075751 70 76.40805 0 0.1 0 0 0 1 
i 4.318229 256.1496 0.5378755 74 76.81057 0 0.1 0 0 0 1 
i 4.502266 256.1496 0.5378755 77 77.11245 0 0.1 0 0 0 1 
i 11.05507 256.1496 1.075751 89 74.39547 0 0.1 0 0 0 1 
i 11.23911 256.1496 1.075751 92 74.69736 0 0.1 0 0 0 1 
i 11.48449 256.1496 0.5378755 87 75.09987 0 0.1 0 0 0 1 
i 11.79122 256.1496 0.5378755 84 75.60302 0 0.1 0 0 0 1 
i 11.97525 256.1496 1.075751 96 75.90491 0 0.1 0 0 0 1 
i 12.28198 256.1496 1.075751 93 76.40805 0 0.1 0 0 0 1 
i 12.52736 256.1496 0.5378755 97 76.81057 0 0.1 0 0 0 1 
i 12.7114 256.1496 0.5378755 100 77.11245 0 0.1 0 0 0 1 
i 2.784594 256.4912 0.5378755 52 70.05099 0 0.1 0 0 0 1 
i 2.96863 256.4912 0.5378755 54 70.35287 0 0.1 0 0 0 1 
i 3.827466 256.4912 0.5378755 33 71.76168 0 0.1 0 0 0 1 
i 3.888811 256.4912 0.5378755 31 71.86231 0 0.1 0 0 0 1 
i 10.99373 256.4912 0.5378755 75 70.05099 0 0.1 0 0 0 1 
i 11.17776 256.4912 0.5378755 77 70.35287 0 0.1 0 0 0 1 
i 12.0366 256.4912 0.5378755 56 71.76168 0 0.1 0 0 0 1 
i 12.09794 256.4912 0.5378755 54 71.86231 0 0.1 0 0 0 1 
i 3.336703 256.6875 0.5378755 65 75.2005 0 0.1 0 0 0 1 
i 3.520739 256.6875 0.5378755 62 75.50239 0 0.1 0 0 0 1 
i 4.256884 256.6875 0.5378755 75 76.70994 0 0.1 0 0 0 1 
i 4.563611 256.6875 0.5378755 78 77.21308 0 0.1 0 0 0 1 
i 11.54583 256.6875 0.5378755 88 75.2005 0 0.1 0 0 0 1 
i 11.72987 256.6875 0.5378755 85 75.50239 0 0.1 0 0 0 1 
i 12.46602 256.6875 0.5378755 98 76.70994 0 0.1 0 0 0 1 
i 12.77274 256.6875 1.906027 101 77.21308 0 0.1 0 0 0 1 
i 2.907285 257.5177 0.5378755 66 74.49543 0 0.1 0 0 0 1 
i 3.029976 257.5177 0.5378755 68 74.69669 0 0.1 0 0 0 1 
i 3.275357 257.5177 0.5378755 64 75.0992 0 0.1 0 0 0 1 
i 3.64343 257.5177 0.5378755 61 75.70298 0 0.1 0 0 0 1 
i 3.766121 257.5177 0.5378755 72 75.90423 0 0.1 0 0 0 1 
i 4.134193 257.5177 0.5378755 70 76.50801 0 0.1 0 0 0 1 
i 4.379575 257.5177 0.5378755 74 76.91052 0 0.1 0 0 0 1 
i 4.502266 257.5177 0.5378755 76 77.11178 0 0.1 0 0 0 1 
i 11.11642 257.5177 0.5378755 89 74.49543 0 0.1 0 0 0 1 
i 11.23911 257.5177 0.5378755 91 74.69669 0 0.1 0 0 0 1 
i 11.48449 257.5177 0.5378755 87 75.0992 0 0.1 0 0 0 1 
i 11.85256 257.5177 0.5378755 84 75.70298 0 0.1 0 0 0 1 
i 11.97525 257.5177 0.5378755 95 75.90423 0 0.1 0 0 0 1 
i 12.34333 257.5177 0.5378755 93 76.50801 0 0.1 0 0 0 1 
i 12.58871 257.5177 0.5378755 97 76.91052 0 0.1 0 0 0 1 
i 12.7114 257.5177 0.5378755 99 77.11178 0 0.1 0 0 0 1 
i 3.029976 257.6411 0.5378755 44 70.45283 0 0.1 0 0 0 1 
i 3.766121 257.6411 0.5378755 53 71.66038 0 0.1 0 0 0 1 
i 11.23911 257.6411 0.5378755 67 70.45283 0 0.1 0 0 0 1 
i 11.97525 257.6411 0.5378755 76 71.66038 0 0.1 0 0 0 1 
i 5.550715 257.977 0.5378755 56 75.91363 0 0.1 0 0 0 1 
i 13.75985 257.977 0.5378755 79 75.91363 0 0.1 0 0 0 1 
i 2.784594 258.0556 0.5378755 67 74.29417 0 0.1 0 0 0 1 
i 3.152666 258.0556 0.5378755 69 74.89795 0 0.1 0 0 0 1 
i 3.398048 258.0556 0.5378755 65 75.30046 0 0.1 0 0 0 1 
i 3.520739 258.0556 0.5378755 63 75.50172 0 0.1 0 0 0 1 
i 3.888811 258.0556 0.5378755 73 76.10549 0 0.1 0 0 0 1 
i 4.011502 258.0556 0.5378755 71 76.30675 0 0.1 0 0 0 1 
i 4.256884 258.0556 0.5378755 76 76.70927 0 0.1 0 0 0 1 
i 4.624956 258.0556 0.5378755 78 77.31304 0 0.1 0 0 0 1 
i 10.99373 258.0556 0.5378755 90 74.29417 0 0.1 0 0 0 1 
i 11.3618 258.0556 0.5378755 92 74.89795 0 0.1 0 0 0 1 
i 11.60718 258.0556 0.5378755 88 75.30046 0 0.1 0 0 0 1 
i 11.72987 258.0556 0.5378755 86 75.50172 0 0.1 0 0 0 1 
i 12.09794 258.0556 0.5378755 96 76.10549 0 0.1 0 0 0 1 
i 12.22063 258.0556 0.5378755 94 76.30675 0 0.1 0 0 0 1 
i 12.46602 258.0556 0.5378755 99 76.70927 0 0.1 0 0 0 1 
i 2.784594 258.179 0.5378755 46 70.05031 0 0.1 0 0 0 1 
i 4.011502 258.179 0.5378755 55 72.06289 0 0.1 0 0 0 1 
i 10.99373 258.179 0.5378755 69 70.05031 0 0.1 0 0 0 1 
i 12.22063 258.179 0.5378755 78 72.06289 0 0.1 0 0 0 1 
i 4.569188 258.5149 0.5378755 62 74.30356 0 0.1 0 0 0 1 
i 12.77832 258.5149 0.5378755 85 74.30356 0 0.1 0 0 0 1 
i 2.845939 258.7897 1.075751 67 74.39413 0 0.1 0 0 0 1 
i 2.907285 258.7897 0.5378755 66 74.49476 0 0.1 0 0 0 1 
i 3.029976 258.7897 1.075751 68 74.69602 0 0.1 0 0 0 1 
i 3.214012 258.7897 1.075751 69 74.9979 0 0.1 0 0 0 1 
i 3.275357 258.7897 1.075751 64 75.09853 0 0.1 0 0 0 1 
i 3.459394 258.7897 1.075751 65 75.40042 0 0.1 0 0 0 1 
i 3.582084 258.7897 0.5378755 63 75.60168 0 0.1 0 0 0 1 
i 3.64343 258.7897 1.075751 62 75.70231 0 0.1 0 0 0 1 
i 3.766121 258.7897 1.075751 72 75.90356 0 0.1 0 0 0 1 
i 3.950157 258.7897 1.075751 74 76.20545 0 0.1 0 0 0 1 
i 4.072848 258.7897 1.075751 71 76.40671 0 0.1 0 0 0 1 
i 4.134193 258.7897 1.075751 70 76.50734 0 0.1 0 0 0 1 
i 4.318229 258.7897 0.5378755 76 76.80922 0 0.1 0 0 0 1 
i 4.379575 258.7897 1.075751 75 76.90985 0 0.1 0 0 0 1 
i 4.502266 258.7897 1.075751 77 77.11111 0 0.1 0 0 0 1 
i 4.686302 258.7897 0.5378755 78 77.413 0 0.1 0 0 0 1 
i 11.05507 258.7897 1.075751 90 74.39413 0 0.1 0 0 0 1 
i 11.11642 258.7897 0.5378755 89 74.49476 0 0.1 0 0 0 1 
i 11.23911 258.7897 1.075751 91 74.69602 0 0.1 0 0 0 1 
i 11.42314 258.7897 1.075751 92 74.9979 0 0.1 0 0 0 1 
i 11.48449 258.7897 0.5378755 87 75.09853 0 0.1 0 0 0 1 
i 11.66853 258.7897 0.5378755 88 75.40042 0 0.1 0 0 0 1 
i 11.79122 258.7897 1.075751 86 75.60168 0 0.1 0 0 0 1 
i 11.85256 258.7897 1.075751 85 75.70231 0 0.1 0 0 0 1 
i 11.97525 258.7897 1.075751 95 75.90356 0 0.1 0 0 0 1 
i 12.15929 258.7897 0.5378755 97 76.20545 0 0.1 0 0 0 1 
i 12.28198 258.7897 1.075751 94 76.40671 0 0.1 0 0 0 1 
i 12.34333 258.7897 1.075751 93 76.50734 0 0.1 0 0 0 1 
i 12.52736 258.7897 1.075751 99 76.80922 0 0.1 0 0 0 1 
i 12.58871 258.7897 0.5378755 98 76.90985 0 0.1 0 0 0 1 
i 12.7114 258.7897 1.075751 100 77.11111 0 0.1 0 0 0 1 
i 12.89543 258.7897 0.5378755 101 77.413 0 0.1 0 0 0 1 
i 2.845939 259.1072 0.5378755 46 70.15027 0 0.1 0 0 0 1 
i 3.029976 259.1072 0.5378755 43 70.45216 0 0.1 0 0 0 1 
i 3.766121 259.1072 1.075751 55 71.65971 0 0.1 0 0 0 1 
i 4.072848 259.1072 0.5378755 59 72.16285 0 0.1 0 0 0 1 
i 11.05507 259.1072 0.5378755 69 70.15027 0 0.1 0 0 0 1 
i 11.23911 259.1072 0.5378755 66 70.45216 0 0.1 0 0 0 1 
i 11.97525 259.1072 1.075751 78 71.65971 0 0.1 0 0 0 1 
i 12.28198 259.1072 0.5378755 82 72.16285 0 0.1 0 0 0 1 
i 3.336703 259.3276 0.5378755 63 75.19916 0 0.1 0 0 0 1 
i 3.704775 259.3276 0.5378755 61 75.80294 0 0.1 0 0 0 1 
i 3.888811 259.3276 0.5378755 73 76.10482 0 0.1 0 0 0 1 
i 4.563611 259.3276 0.5378755 76 77.21174 0 0.1 0 0 0 1 
i 11.17776 259.3276 0.5378755 88 74.59539 0 0.1 0 0 0 1 
i 11.60718 259.3276 0.5378755 87 75.29979 0 0.1 0 0 0 1 
i 11.91391 259.3276 0.5378755 84 75.80294 0 0.1 0 0 0 1 
i 12.09794 259.3276 0.5378755 96 76.10482 0 0.1 0 0 0 1 
i 12.46602 259.3276 0.5378755 98 76.7086 0 0.1 0 0 0 1 
i 12.65005 259.3276 0.5378755 97 77.01048 0 0.1 0 0 0 1 
i 4.630533 259.4495 1.075751 63 74.40352 0 0.1 0 0 0 1 
i 5.550715 259.4495 1.075751 54 75.91296 0 0.1 0 0 0 1 
i 12.83967 259.4495 1.075751 86 74.40352 0 0.1 0 0 0 1 
i 13.75985 259.4495 1.075751 77 75.91296 0 0.1 0 0 0 1 
i 2.784594 259.6451 0.5378755 45 70.04964 0 0.1 0 0 0 1 
i 3.091321 259.6451 0.5378755 42 70.55279 0 0.1 0 0 0 1 
i 4.011502 259.6451 0.5378755 58 72.06222 0 0.1 0 0 0 1 
i 10.99373 259.6451 0.5378755 68 70.04964 0 0.1 0 0 0 1 
i 11.30045 259.6451 0.5378755 65 70.55279 0 0.1 0 0 0 1 
i 12.22063 259.6451 1.501857 81 72.06222 0 0.1 0 0 0 1 
i 2.907285 260.6091 0.5378755 50 70.25023 0 0.1 0 0 0 1 
i 3.029976 260.6091 0.5378755 55 70.45149 0 0.1 0 0 0 1 
i 3.766121 260.6091 0.5378755 29 71.65904 0 0.1 0 0 0 1 
i 4.134193 260.6091 0.5378755 24 72.26281 0 0.1 0 0 0 1 
i 11.11642 260.6091 0.5378755 73 70.25023 0 0.1 0 0 0 1 
i 11.23911 260.6091 0.5378755 78 70.45149 0 0.1 0 0 0 1 
i 11.97525 260.6091 0.5378755 52 71.65904 0 0.1 0 0 0 1 
i 12.34333 260.6091 0.5378755 47 72.26281 0 0.1 0 0 0 1 
i 4.691879 260.9579 0.5378755 55 74.50348 0 0.1 0 0 0 1 
i 5.550715 260.9579 0.5378755 76 75.91229 0 0.1 0 0 0 1 
i 12.90101 260.9579 0.5378755 78 74.50348 0 0.1 0 0 0 1 
i 13.75985 260.9579 0.5378755 99 75.91229 0 0.1 0 0 0 1 
i 2.784594 261.1469 0.5378755 53 70.04897 0 0.1 0 0 0 1 
i 3.152666 261.1469 0.5378755 58 70.65275 0 0.1 0 0 0 1 
i 3.888811 261.1469 0.5378755 32 71.86029 0 0.1 0 0 0 1 
i 4.011502 261.1469 0.5378755 27 72.06155 0 0.1 0 0 0 1 
i 10.99373 261.1469 0.5378755 76 70.04897 0 0.1 0 0 0 1 
i 11.3618 261.1469 0.5378755 81 70.65275 0 0.1 0 0 0 1 
i 12.09794 261.1469 0.5378755 55 71.86029 0 0.1 0 0 0 1 
i 12.22063 261.1469 0.5378755 50 72.06155 0 0.1 0 0 0 1 
i 4.569188 261.4958 0.5378755 58 74.30222 0 0.1 0 0 0 1 
i 5.673405 261.4958 0.5378755 79 76.11354 0 0.1 0 0 0 1 
i 12.77832 261.4958 0.5378755 81 74.30222 0 0.1 0 0 0 1 
i 13.88254 261.4958 0.5378755 102 76.11354 0 0.1 0 0 0 1 
i 2.845939 262.0054 1.075751 43 70.14893 0 0.1 0 0 0 1 
i 2.907285 262.0054 0.5378755 44 70.24956 0 0.1 0 0 0 1 
i 3.029976 262.0054 0.5378755 41 70.45082 0 0.1 0 0 0 1 
i 3.214012 262.0054 1.075751 40 70.7527 0 0.1 0 0 0 1 
i 3.766121 262.0054 0.5378755 59 71.65836 0 0.1 0 0 0 1 
i 3.950157 262.0054 0.5378755 57 71.96025 0 0.1 0 0 0 1 
i 4.072848 262.0054 1.075751 60 72.16151 0 0.1 0 0 0 1 
i 4.134193 262.0054 0.5378755 62 72.26214 0 0.1 0 0 0 1 
i 11.05507 262.0054 1.075751 66 70.14893 0 0.1 0 0 0 1 
i 11.11642 262.0054 0.5378755 67 70.24956 0 0.1 0 0 0 1 
i 11.23911 262.0054 0.5378755 64 70.45082 0 0.1 0 0 0 1 
i 11.42314 262.0054 1.075751 63 70.7527 0 0.1 0 0 0 1 
i 11.97525 262.0054 0.5378755 82 71.65836 0 0.1 0 0 0 1 
i 12.15929 262.0054 0.5378755 80 71.96025 0 0.1 0 0 0 1 
i 12.28198 262.0054 1.075751 83 72.16151 0 0.1 0 0 0 1 
i 12.34333 262.0054 0.5378755 85 72.26214 0 0.1 0 0 0 1 
i 4.630533 262.3603 0.5378755 65 74.40218 0 0.1 0 0 0 1 
i 4.691879 262.3603 0.5378755 67 74.50281 0 0.1 0 0 0 1 
i 5.550715 262.3603 0.5378755 46 75.91161 0 0.1 0 0 0 1 
i 5.734751 262.3603 0.5378755 44 76.2135 0 0.1 0 0 0 1 
i 12.83967 262.3603 0.5378755 88 74.40218 0 0.1 0 0 0 1 
i 12.90101 262.3603 0.5378755 90 74.50281 0 0.1 0 0 0 1 
i 13.75985 262.3603 0.5378755 69 75.91161 0 0.1 0 0 0 1 
i 13.94388 262.3603 0.5378755 67 76.2135 0 0.1 0 0 0 1 
i 2.96863 262.5432 0.5378755 45 70.35019 0 0.1 0 0 0 1 
i 3.091321 262.5432 0.5378755 42 70.55145 0 0.1 0 0 0 1 
i 3.888811 262.5432 0.5378755 58 71.85962 0 0.1 0 0 0 1 
i 4.011502 262.5432 0.5378755 61 72.06088 0 0.1 0 0 0 1 
i 4.195539 262.5432 0.5378755 63 72.36277 0 0.1 0 0 0 1 
i 11.17776 262.5432 0.5378755 68 70.35019 0 0.1 0 0 0 1 
i 11.30045 262.5432 0.5378755 65 70.55145 0 0.1 0 0 0 1 
i 12.09794 262.5432 0.5378755 81 71.85962 0 0.1 0 0 0 1 
i 12.22063 262.5432 0.5378755 84 72.06088 0 0.1 0 0 0 1 
i 12.40467 262.5432 0.5378755 86 72.36277 0 0.1 0 0 0 1 
i 4.569188 262.8981 0.5378755 66 74.30155 0 0.1 0 0 0 1 
i 4.753224 262.8981 0.5378755 68 74.60344 0 0.1 0 0 0 1 
i 5.61206 262.8981 0.5378755 47 76.01224 0 0.1 0 0 0 1 
i 5.673405 262.8981 0.5378755 45 76.11287 0 0.1 0 0 0 1 
i 12.77832 262.8981 0.5378755 89 74.30155 0 0.1 0 0 0 1 
i 12.96236 262.8981 0.5378755 91 74.60344 0 0.1 0 0 0 1 
i 13.82119 262.8981 0.5378755 70 76.01224 0 0.1 0 0 0 1 
i 13.88254 262.8981 1.588652 68 76.11287 0 0.1 0 0 0 1 
i 3.275357 263.9489 0.5378755 51 70.85266 0 0.1 0 0 0 1 
i 3.766121 263.9489 0.5378755 42 71.65769 0 0.1 0 0 0 1 
i 11.48449 263.9489 0.5378755 74 70.85266 0 0.1 0 0 0 1 
i 11.97525 263.9489 0.5378755 65 71.65769 0 0.1 0 0 0 1 
i 4.81457 263.9747 0.5378755 58 74.7034 0 0.1 0 0 0 1 
i 5.550715 263.9747 0.5378755 67 75.91094 0 0.1 0 0 0 1 
i 13.0237 263.9747 0.5378755 81 74.7034 0 0.1 0 0 0 1 
i 13.75985 263.9747 0.5378755 90 75.91094 0 0.1 0 0 0 1 
i 2.784594 264.4868 0.5378755 46 70.04763 0 0.1 0 0 0 1 
i 4.256884 264.4868 0.5378755 38 72.46273 0 0.1 0 0 0 1 
i 10.99373 264.4868 0.5378755 69 70.04763 0 0.1 0 0 0 1 
i 12.46602 264.4868 0.5378755 61 72.46273 0 0.1 0 0 0 1 
i 4.569188 264.5126 0.5378755 60 74.30088 0 0.1 0 0 0 1 
i 5.796096 264.5126 0.5378755 69 76.31346 0 0.1 0 0 0 1 
i 12.77832 264.5126 0.5378755 83 74.30088 0 0.1 0 0 0 1 
i 14.00523 264.5126 1.940231 92 76.31346 0 0.1 0 0 0 1 
i 4.630533 265.377 1.075751 60 74.40084 0 0.1 0 0 0 1 
i 4.81457 265.377 0.5378755 57 74.70273 0 0.1 0 0 0 1 
i 5.550715 265.377 0.5378755 70 75.91027 0 0.1 0 0 0 1 
i 5.857442 265.377 0.5378755 73 76.41342 0 0.1 0 0 0 1 
i 12.83967 265.377 1.075751 83 74.40084 0 0.1 0 0 0 1 
i 13.0237 265.377 0.5378755 80 74.70273 0 0.1 0 0 0 1 
i 13.75985 265.377 0.5378755 93 75.91027 0 0.1 0 0 0 1 
i 14.06657 265.377 0.5378755 96 76.41342 0 0.1 0 0 0 1 
i 2.845939 265.415 1.075751 46 70.14759 0 0.1 0 0 0 1 
i 3.275357 265.415 1.075751 51 70.85199 0 0.1 0 0 0 1 
i 3.766121 265.415 1.075751 43 71.65702 0 0.1 0 0 0 1 
i 4.318229 265.415 1.075751 38 72.56268 0 0.1 0 0 0 1 
i 11.05507 265.415 1.075751 69 70.14759 0 0.1 0 0 0 1 
i 11.48449 265.415 0.5378755 74 70.85199 0 0.1 0 0 0 1 
i 11.97525 265.415 1.075751 66 71.65702 0 0.1 0 0 0 1 
i 12.52736 265.415 0.5378755 61 72.56268 0 0.1 0 0 0 1 
i 4.875915 265.9149 0.5378755 56 74.80335 0 0.1 0 0 0 1 
i 5.61206 265.9149 0.5378755 69 76.0109 0 0.1 0 0 0 1 
i 5.796096 265.9149 0.5378755 72 76.31279 0 0.1 0 0 0 1 
i 13.08505 265.9149 0.5378755 79 74.80335 0 0.1 0 0 0 1 
i 14.00523 265.9149 0.5378755 95 76.31279 0 0.1 0 0 0 1 
i 11.54583 265.9529 0.5378755 74 70.95262 0 0.1 0 0 0 1 
i 12.46602 265.9529 1.398582 61 72.46205 0 0.1 0 0 0 1 
i 4.691879 266.8136 0.5378755 64 74.5008 0 0.1 0 0 0 1 
i 4.81457 266.8136 0.5378755 69 74.70205 0 0.1 0 0 0 1 
i 5.550715 266.8136 0.5378755 43 75.9096 0 0.1 0 0 0 1 
i 5.918787 266.8136 0.5378755 39 76.51338 0 0.1 0 0 0 1 
i 12.90101 266.8136 0.5378755 87 74.5008 0 0.1 0 0 0 1 
i 13.0237 266.8136 0.6411504 92 74.70205 0 0.1 0 0 0 1 
i 13.75985 266.8136 0.5378755 66 75.9096 0 0.1 0 0 0 1 
i 14.12792 266.8136 0.5378755 62 76.51338 0 0.1 0 0 0 1 
i 2.907285 266.9169 0.5378755 51 70.24755 0 0.1 0 0 0 1 
i 3.275357 266.9169 0.5378755 40 70.85132 0 0.1 0 0 0 1 
i 3.766121 266.9169 0.5378755 58 71.65635 0 0.1 0 0 0 1 
i 4.379575 266.9169 0.5378755 69 72.66264 0 0.1 0 0 0 1 
i 11.11642 266.9169 0.5378755 74 70.24755 0 0.1 0 0 0 1 
i 11.48449 266.9169 0.5378755 63 70.85132 0 0.1 0 0 0 1 
i 11.97525 266.9169 0.5378755 81 71.65635 0 0.1 0 0 0 1 
i 4.569188 267.3515 0.5378755 67 74.29954 0 0.1 0 0 0 1 
i 4.93726 267.3515 0.5378755 72 74.90331 0 0.1 0 0 0 1 
i 5.673405 267.3515 0.5378755 46 76.11086 0 0.1 0 0 0 1 
i 5.796096 267.3515 0.5378755 41 76.31212 0 0.1 0 0 0 1 
i 12.77832 267.3515 0.5378755 90 74.29954 0 0.1 0 0 0 1 
i 13.14639 267.3515 0.5378755 95 74.90331 0 0.1 0 0 0 1 
i 13.88254 267.3515 0.5378755 69 76.11086 0 0.1 0 0 0 1 
i 14.00523 267.3515 0.5378755 64 76.31212 0 0.1 0 0 0 1 
i 2.784594 267.4547 0.5378755 48 70.04629 0 0.1 0 0 0 1 
i 3.398048 267.4547 0.5378755 37 71.05258 0 0.1 0 0 0 1 
i 3.888811 267.4547 0.5378755 55 71.85761 0 0.1 0 0 0 1 
i 4.256884 267.4547 0.5378755 67 72.46138 0 0.1 0 0 0 1 
i 10.99373 267.4547 0.5378755 71 70.04629 0 0.1 0 0 0 1 
i 11.60718 267.4547 0.5378755 60 71.05258 0 0.1 0 0 0 1 
i 12.09794 267.4547 0.5378755 78 71.85761 0 0.1 0 0 0 1 
i 12.46602 267.4547 1.232302 90 72.46138 0 0.1 0 0 0 1 
i 4.630533 268.1492 0.5378755 57 74.3995 0 0.1 0 0 0 1 
i 4.691879 268.1492 1.075751 58 74.50013 0 0.1 0 0 0 1 
i 4.81457 268.1492 1.075751 55 74.70138 0 0.1 0 0 0 1 
i 4.998606 268.1492 0.5378755 54 75.00327 0 0.1 0 0 0 1 
i 5.550715 268.1492 0.5378755 73 75.90893 0 0.1 0 0 0 1 
i 5.734751 268.1492 1.075751 72 76.21082 0 0.1 0 0 0 1 
i 5.857442 268.1492 1.075751 75 76.41208 0 0.1 0 0 0 1 
i 5.918787 268.1492 0.5378755 76 76.5127 0 0.1 0 0 0 1 
i 12.83967 268.1492 0.5378755 80 74.3995 0 0.1 0 0 0 1 
i 12.90101 268.1492 1.075751 81 74.50013 0 0.1 0 0 0 1 
i 13.0237 268.1492 1.075751 78 74.70138 0 0.1 0 0 0 1 
i 13.20774 268.1492 0.5378755 77 75.00327 0 0.1 0 0 0 1 
i 13.75985 268.1492 0.5378755 96 75.90893 0 0.1 0 0 0 1 
i 13.94388 268.1492 1.075751 95 76.21082 0 0.1 0 0 0 1 
i 14.06657 268.1492 1.075751 98 76.41208 0 0.1 0 0 0 1 
i 14.12792 268.1492 0.5378755 99 76.5127 0 0.1 0 0 0 1 
i 2.845939 268.3132 0.5378755 46 70.14625 0 0.1 0 0 0 1 
i 2.907285 268.3132 0.5378755 44 70.24688 0 0.1 0 0 0 1 
i 3.275357 268.3132 0.5378755 54 70.85065 0 0.1 0 0 0 1 
i 3.459394 268.3132 1.075751 55 71.15254 0 0.1 0 0 0 1 
i 3.766121 268.3132 0.5378755 40 71.65568 0 0.1 0 0 0 1 
i 3.950157 268.3132 0.5378755 42 71.95757 0 0.1 0 0 0 1 
i 4.318229 268.3132 0.5378755 32 72.56134 0 0.1 0 0 0 1 
i 4.379575 268.3132 1.075751 31 72.66197 0 0.1 0 0 0 1 
i 11.05507 268.3132 0.5378755 69 70.14625 0 0.1 0 0 0 1 
i 11.11642 268.3132 0.5378755 67 70.24688 0 0.1 0 0 0 1 
i 11.48449 268.3132 0.5378755 77 70.85065 0 0.1 0 0 0 1 
i 11.66853 268.3132 1.075751 78 71.15254 0 0.1 0 0 0 1 
i 11.97525 268.3132 0.5378755 63 71.65568 0 0.1 0 0 0 1 
i 12.15929 268.3132 0.5378755 65 71.95757 0 0.1 0 0 0 1 
i 12.52736 268.3132 0.5378755 55 72.56134 0 0.1 0 0 0 1 
i 12.58871 268.3132 0.5378755 54 72.66197 0 0.1 0 0 0 1 
i 4.753224 268.687 0.5378755 59 74.60075 0 0.1 0 0 0 1 
i 4.875915 268.687 0.5378755 56 74.80201 0 0.1 0 0 0 1 
i 5.61206 268.687 0.5378755 74 76.00956 0 0.1 0 0 0 1 
i 5.980132 268.687 0.5378755 77 76.61333 0 0.1 0 0 0 1 
i 12.96236 268.687 0.5378755 82 74.60075 0 0.1 0 0 0 1 
i 13.08505 268.687 0.5378755 79 74.80201 0 0.1 0 0 0 1 
i 13.82119 268.687 0.5378755 97 76.00956 0 0.1 0 0 0 1 
i 14.18926 268.687 0.5378755 100 76.61333 0 0.1 0 0 0 1 
i 2.784594 268.851 0.5378755 45 70.04562 0 0.1 0 0 0 1 
i 2.96863 268.851 0.5378755 43 70.34751 0 0.1 0 0 0 1 
i 3.336703 268.851 0.5378755 53 70.95128 0 0.1 0 0 0 1 
i 3.827466 268.851 0.5378755 39 71.75631 0 0.1 0 0 0 1 
i 3.888811 268.851 0.5378755 41 71.85694 0 0.1 0 0 0 1 
i 4.44092 268.851 0.5378755 30 72.7626 0 0.1 0 0 0 1 
i 10.99373 268.851 0.5378755 68 70.04562 0 0.1 0 0 0 1 
i 11.17776 268.851 0.5378755 66 70.34751 0 0.1 0 0 0 1 
i 11.54583 268.851 0.5378755 76 70.95128 0 0.1 0 0 0 1 
i 12.0366 268.851 0.5378755 62 71.75631 0 0.1 0 0 0 1 
i 12.09794 268.851 0.5378755 64 71.85694 0 0.1 0 0 0 1 
i 12.46602 268.851 0.5378755 54 72.46071 0 0.1 0 0 0 1 
i 12.65005 268.851 2.145305 53 72.7626 0 0.1 0 0 0 1 
i 3.029976 269.9206 1.075751 47 70.44746 0 0.1 0 0 0 1 
i 3.766121 269.9206 1.075751 48 71.65501 0 0.1 0 0 0 1 
i 4.502266 269.9206 0.5378755 49 72.86256 0 0.1 0 0 0 1 
i 11.23911 269.9206 1.075751 70 70.44746 0 0.1 0 0 0 1 
i 11.97525 269.9206 1.075751 71 71.65501 0 0.1 0 0 0 1 
i 12.7114 269.9206 0.5378755 72 72.86256 0 0.1 0 0 0 1 
i 5.059951 270.0082 0.5378755 65 75.10323 0 0.1 0 0 0 1 
i 5.550715 270.0082 0.5378755 56 75.90826 0 0.1 0 0 0 1 
i 13.26908 270.0082 0.5378755 88 75.10323 0 0.1 0 0 0 1 
i 13.75985 270.0082 0.5378755 79 75.90826 0 0.1 0 0 0 1 
i 2.784594 270.2487 0.7171673 48 70.0208 0 0.1 0 0 0 1 
i 6.88916 270.2487 0.7171673 59 70.0208 0 0.1 0 0 0 1 
i 10.99373 270.2487 0.7171673 71 70.0208 0 0.1 0 0 0 1 
i 15.09829 270.2487 0.7171673 82 70.0208 0 0.1 0 0 0 1 
i 3.520739 270.4585 0.5378755 46 71.25249 0 0.1 0 0 0 1 
i 4.256884 270.4585 0.5378755 49 72.46004 0 0.1 0 0 0 1 
i 11.72987 270.4585 0.5378755 69 71.25249 0 0.1 0 0 0 1 
i 12.46602 270.4585 0.5378755 72 72.46004 0 0.1 0 0 0 1 
i 4.569188 270.5461 0.5378755 61 74.2982 0 0.1 0 0 0 1 
i 6.041478 270.5461 0.5378755 52 76.71329 0 0.1 0 0 0 1 
i 12.77832 270.5461 0.5378755 84 74.2982 0 0.1 0 0 0 1 
i 14.25061 270.5461 1.940231 75 76.71329 0 0.1 0 0 0 1 
i 2.845939 271.2248 0.6299029 50 70.12075 0 0.1 0 0 0 1 
i 6.950505 271.2248 0.7171673 61 70.12075 0 0.1 0 0 0 1 
i 11.05507 271.2248 0.6299029 73 70.12075 0 0.1 0 0 0 1 
i 15.15964 271.2248 0.7171673 84 70.12075 0 0.1 0 0 0 1 
i 2.845939 271.3169 0.5378755 45 70.14491 0 0.1 0 0 0 1 
i 3.275357 271.3169 0.5378755 43 70.84931 0 0.1 0 0 0 1 
i 3.582084 271.3169 0.5378755 38 71.35245 0 0.1 0 0 0 1 
i 3.766121 271.3169 0.5378755 58 71.65434 0 0.1 0 0 0 1 
i 4.072848 271.3169 0.5378755 53 72.15748 0 0.1 0 0 0 1 
i 4.318229 271.3169 0.5378755 61 72.56 0 0.1 0 0 0 1 
i 4.502266 271.3169 0.5378755 66 72.86189 0 0.1 0 0 0 1 
i 11.05507 271.3169 0.5378755 68 70.14491 0 0.1 0 0 0 1 
i 11.48449 271.3169 0.5378755 66 70.84931 0 0.1 0 0 0 1 
i 11.79122 271.3169 0.5378755 61 71.35245 0 0.1 0 0 0 1 
i 11.97525 271.3169 0.5378755 81 71.65434 0 0.1 0 0 0 1 
i 12.28198 271.3169 0.5378755 76 72.15748 0 0.1 0 0 0 1 
i 12.52736 271.3169 0.5378755 84 72.56 0 0.1 0 0 0 1 
i 12.7114 271.3169 0.5378755 89 72.86189 0 0.1 0 0 0 1 
i 4.630533 271.4106 1.075751 60 74.39816 0 0.1 0 0 0 1 
i 5.059951 271.4106 1.075751 65 75.10256 0 0.1 0 0 0 1 
i 5.550715 271.4106 0.5378755 57 75.90759 0 0.1 0 0 0 1 
i 6.102823 271.4106 1.075751 52 76.81325 0 0.1 0 0 0 1 
i 12.83967 271.4106 1.075751 83 74.39816 0 0.1 0 0 0 1 
i 13.26908 271.4106 1.075751 88 75.10256 0 0.1 0 0 0 1 
i 13.75985 271.4106 0.5378755 80 75.90759 0 0.1 0 0 0 1 
i 2.784594 271.8547 0.5378755 46 70.04428 0 0.1 0 0 0 1 
i 3.091321 271.8547 0.5378755 51 70.54742 0 0.1 0 0 0 1 
i 3.336703 271.8547 0.5378755 44 70.94994 0 0.1 0 0 0 1 
i 3.520739 271.8547 0.5378755 39 71.25182 0 0.1 0 0 0 1 
i 3.827466 271.8547 0.5378755 59 71.75497 0 0.1 0 0 0 1 
i 4.011502 271.8547 0.5378755 54 72.05686 0 0.1 0 0 0 1 
i 4.256884 271.8547 0.5378755 62 72.45937 0 0.1 0 0 0 1 
i 4.563611 271.8547 0.5378755 67 72.96252 0 0.1 0 0 0 1 
i 10.99373 271.8547 0.5378755 69 70.04428 0 0.1 0 0 0 1 
i 11.30045 271.8547 0.5378755 74 70.54742 0 0.1 0 0 0 1 
i 11.54583 271.8547 0.5378755 67 70.94994 0 0.1 0 0 0 1 
i 11.72987 271.8547 0.5378755 62 71.25182 0 0.1 0 0 0 1 
i 12.0366 271.8547 0.5378755 82 71.75497 0 0.1 0 0 0 1 
i 12.22063 271.8547 0.5378755 77 72.05686 0 0.1 0 0 0 1 
i 12.46602 271.8547 0.5378755 85 72.45937 0 0.1 0 0 0 1 
i 12.77274 271.8547 0.5378755 90 72.96252 0 0.1 0 0 0 1 
i 2.784594 271.942 0.7171673 49 70.02013 0 0.1 0 0 0 1 
i 6.88916 271.942 0.7171673 60 70.02013 0 0.1 0 0 0 1 
i 10.99373 271.942 0.7171673 72 70.02013 0 0.1 0 0 0 1 
i 15.09829 271.942 0.7171673 83 70.02013 0 0.1 0 0 0 1 
i 5.61206 271.9485 0.5378755 58 76.00822 0 0.1 0 0 0 1 
i 13.82119 271.9485 1.336625 81 76.00822 0 0.1 0 0 0 1 
i 2.907285 272.7472 0.5378755 49 70.24486 0 0.1 0 0 0 1 
i 3.029976 272.7472 0.5378755 45 70.44612 0 0.1 0 0 0 1 
i 3.275357 272.7472 0.5378755 54 70.84864 0 0.1 0 0 0 1 
i 3.64343 272.7472 0.5378755 58 71.45241 0 0.1 0 0 0 1 
i 3.766121 272.7472 0.5378755 36 71.65367 0 0.1 0 0 0 1 
i 4.134193 272.7472 0.5378755 40 72.25744 0 0.1 0 0 0 1 
i 4.379575 272.7472 0.5378755 32 72.65996 0 0.1 0 0 0 1 
i 4.502266 272.7472 0.5378755 27 72.86122 0 0.1 0 0 0 1 
i 11.11642 272.7472 0.5378755 72 70.24486 0 0.1 0 0 0 1 
i 11.23911 272.7472 0.5378755 68 70.44612 0 0.1 0 0 0 1 
i 11.48449 272.7472 0.5378755 77 70.84864 0 0.1 0 0 0 1 
i 11.85256 272.7472 0.5378755 81 71.45241 0 0.1 0 0 0 1 
i 11.97525 272.7472 0.5378755 59 71.65367 0 0.1 0 0 0 1 
i 12.34333 272.7472 0.5378755 63 72.25744 0 0.1 0 0 0 1 
i 12.58871 272.7472 0.5378755 55 72.65996 0 0.1 0 0 0 1 
i 12.7114 272.7472 0.5378755 50 72.86122 0 0.1 0 0 0 1 
i 4.691879 272.8471 0.5378755 65 74.49811 0 0.1 0 0 0 1 
i 5.059951 272.8471 0.5378755 54 75.10189 0 0.1 0 0 0 1 
i 5.550715 272.8471 0.5378755 72 75.90692 0 0.1 0 0 0 1 
i 6.164169 272.8471 0.5378755 84 76.91321 0 0.1 0 0 0 1 
i 12.90101 272.8471 0.5378755 88 74.49811 0 0.1 0 0 0 1 
i 13.26908 272.8471 0.5378755 77 75.10189 0 0.1 0 0 0 1 
i 13.75985 272.8471 0.5378755 95 75.90692 0 0.1 0 0 0 1 
i 14.3733 272.8471 0.5378755 107 76.91321 0 0.1 0 0 0 1 
i 2.907285 272.9595 0.8634735 51 70.22071 0 0.1 0 0 0 1 
i 7.011851 272.9595 0.7171673 62 70.22071 0 0.1 0 0 0 1 
i 11.11642 272.9595 0.7171673 74 70.22071 0 0.1 0 0 0 1 
i 15.22098 272.9595 0.7171673 85 70.22071 0 0.1 0 0 0 1 
i 2.784594 273.2851 0.5378755 47 70.04361 0 0.1 0 0 0 1 
i 3.152666 273.2851 0.5378755 42 70.64738 0 0.1 0 0 0 1 
i 3.520739 273.2851 0.5378755 55 71.25115 0 0.1 0 0 0 1 
i 3.888811 273.2851 0.5378755 33 71.85493 0 0.1 0 0 0 1 
i 4.011502 273.2851 0.5378755 38 72.05618 0 0.1 0 0 0 1 
i 4.256884 273.2851 0.5378755 29 72.4587 0 0.1 0 0 0 1 
i 4.624956 273.2851 0.5378755 25 73.06247 0 0.1 0 0 0 1 
i 10.99373 273.2851 0.5378755 70 70.04361 0 0.1 0 0 0 1 
i 11.3618 273.2851 0.5378755 65 70.64738 0 0.1 0 0 0 1 
i 11.60718 273.2851 0.5378755 74 71.0499 0 0.1 0 0 0 1 
i 11.72987 273.2851 0.5378755 78 71.25115 0 0.1 0 0 0 1 
i 12.09794 273.2851 0.5378755 56 71.85493 0 0.1 0 0 0 1 
i 12.22063 273.2851 0.5378755 61 72.05618 0 0.1 0 0 0 1 
i 12.46602 273.2851 0.5378755 52 72.4587 0 0.1 0 0 0 1 
i 12.83409 273.2851 0.5378755 48 73.06247 0 0.1 0 0 0 1 
i 4.569188 273.385 0.5378755 63 74.29686 0 0.1 0 0 0 1 
i 5.182642 273.385 0.5378755 51 75.30314 0 0.1 0 0 0 1 
i 5.673405 273.385 0.5378755 69 76.10818 0 0.1 0 0 0 1 
i 6.041478 273.385 0.5378755 81 76.71195 0 0.1 0 0 0 1 
i 12.77832 273.385 0.5378755 86 74.29686 0 0.1 0 0 0 1 
i 13.39177 273.385 0.5378755 74 75.30314 0 0.1 0 0 0 1 
i 13.88254 273.385 0.5378755 92 76.10818 0 0.1 0 0 0 1 
i 14.25061 273.385 0.5378755 104 76.71195 0 0.1 0 0 0 1 
i 2.784594 273.6767 0.7171673 49 70.01945 0 0.1 0 0 0 1 
i 6.88916 273.6767 0.7171673 61 70.01945 0 0.1 0 0 0 1 
i 10.99373 273.6767 0.7171673 72 70.01945 0 0.1 0 0 0 1 
i 15.09829 273.6767 0.7171673 84 70.01945 0 0.1 0 0 0 1 
i 2.845939 274.077 1.075751 47 70.14356 0 0.1 0 0 0 1 
i 3.214012 274.077 0.5378755 48 70.74734 0 0.1 0 0 0 1 
i 3.582084 274.077 1.075751 46 71.35111 0 0.1 0 0 0 1 
i 3.766121 274.077 1.075751 48 71.653 0 0.1 0 0 0 1 
i 4.318229 274.077 0.5378755 49 72.55866 0 0.1 0 0 0 1 
i 4.502266 274.077 1.075751 49 72.86055 0 0.1 0 0 0 1 
i 11.05507 274.077 1.075751 70 70.14356 0 0.1 0 0 0 1 
i 11.42314 274.077 0.5378755 71 70.74734 0 0.1 0 0 0 1 
i 11.66853 274.077 1.075751 70 71.14985 0 0.1 0 0 0 1 
i 11.79122 274.077 1.075751 69 71.35111 0 0.1 0 0 0 1 
i 11.97525 274.077 1.075751 71 71.653 0 0.1 0 0 0 1 
i 12.52736 274.077 1.075751 72 72.55866 0 0.1 0 0 0 1 
i 12.58871 274.077 1.075751 71 72.65929 0 0.1 0 0 0 1 
i 4.630533 274.1827 0.5378755 60 74.39681 0 0.1 0 0 0 1 
i 4.691879 274.1827 1.075751 58 74.49744 0 0.1 0 0 0 1 
i 5.059951 274.1827 0.5378755 68 75.10122 0 0.1 0 0 0 1 
i 5.243987 274.1827 0.5378755 70 75.4031 0 0.1 0 0 0 1 
i 5.550715 274.1827 1.075751 55 75.90625 0 0.1 0 0 0 1 
i 5.734751 274.1827 0.5378755 56 76.20813 0 0.1 0 0 0 1 
i 6.102823 274.1827 0.5378755 47 76.81191 0 0.1 0 0 0 1 
i 6.164169 274.1827 0.5378755 45 76.91254 0 0.1 0 0 0 1 
i 12.83967 274.1827 0.5378755 83 74.39681 0 0.1 0 0 0 1 
i 12.90101 274.1827 1.075751 81 74.49744 0 0.1 0 0 0 1 
i 13.26908 274.1827 0.5378755 91 75.10122 0 0.1 0 0 0 1 
i 13.45312 274.1827 0.5378755 93 75.4031 0 0.1 0 0 0 1 
i 13.75985 274.1827 1.075751 78 75.90625 0 0.1 0 0 0 1 
i 13.94388 274.1827 0.5378755 79 76.20813 0 0.1 0 0 0 1 
i 14.31196 274.1827 0.5378755 70 76.81191 0 0.1 0 0 0 1 
i 14.3733 274.1827 0.5378755 68 76.91254 0 0.1 0 0 0 1 
i 2.845939 274.5722 0.7171673 50 70.11941 0 0.1 0 0 0 1 
i 2.907285 274.5722 1.434335 51 70.22004 0 0.1 0 0 0 1 
i 6.950505 274.5722 1.434335 62 70.11941 0 0.1 0 0 0 1 
i 7.011851 274.5722 0.7171673 63 70.22004 0 0.1 0 0 0 1 
i 11.05507 274.5722 0.7171673 73 70.11941 0 0.1 0 0 0 1 
i 11.11642 274.5722 1.434335 74 70.22004 0 0.1 0 0 0 1 
i 15.15964 274.5722 1.434335 85 70.11941 0 0.1 0 0 0 1 
i 15.22098 274.5722 0.7171673 86 70.22004 0 0.1 0 0 0 1 
i 4.569188 274.7206 0.5378755 59 74.29618 0 0.1 0 0 0 1 
i 5.121297 274.7206 0.5378755 67 75.20184 0 0.1 0 0 0 1 
i 5.182642 274.7206 0.5378755 69 75.30247 0 0.1 0 0 0 1 
i 5.61206 274.7206 0.5378755 54 76.00688 0 0.1 0 0 0 1 
i 6.041478 274.7206 0.5378755 46 76.71128 0 0.1 0 0 0 1 
i 6.225514 274.7206 0.5378755 44 77.01317 0 0.1 0 0 0 1 
i 12.77832 274.7206 0.5378755 82 74.29618 0 0.1 0 0 0 1 
i 13.33043 274.7206 0.5378755 90 75.20184 0 0.1 0 0 0 1 
i 13.39177 274.7206 0.5378755 92 75.30247 0 0.1 0 0 0 1 
i 13.82119 274.7206 0.5378755 77 76.00688 0 0.1 0 0 0 1 
i 14.25061 274.7206 0.5378755 69 76.71128 0 0.1 0 0 0 1 
i 14.43465 274.7206 1.285935 67 77.01317 0 0.1 0 0 0 1 
i 2.96863 275.2894 0.7171673 52 70.32067 0 0.1 0 0 0 1 
i 7.073196 275.2894 0.7171673 64 70.32067 0 0.1 0 0 0 1 
i 11.17776 275.2894 0.7171673 75 70.32067 0 0.1 0 0 0 1 
i 15.28233 275.2894 0.7171673 87 70.32067 0 0.1 0 0 0 1 
i 4.81457 275.7203 0.5378755 62 74.69803 0 0.1 0 0 0 1 
i 5.059951 275.7203 1.075751 61 75.10055 0 0.1 0 0 0 1 
i 5.550715 275.7203 1.075751 62 75.90558 0 0.1 0 0 0 1 
i 6.28686 275.7203 1.075751 63 77.11312 0 0.1 0 0 0 1 
i 13.0237 275.7203 0.5378755 85 74.69803 0 0.1 0 0 0 1 
i 13.26908 275.7203 1.075751 84 75.10055 0 0.1 0 0 0 1 
i 13.75985 275.7203 1.075751 85 75.90558 0 0.1 0 0 0 1 
i 14.49599 275.7203 1.075751 86 77.11312 0 0.1 0 0 0 1 
i 13.51446 276.2581 0.5378755 84 75.50306 0 0.1 0 0 0 1 
i 3.029976 276.4288 0.7171673 52 70.42063 0 0.1 0 0 0 1 
i 7.134542 276.4288 0.7171673 64 70.42063 0 0.1 0 0 0 1 
i 11.23911 276.4288 0.7171673 75 70.42063 0 0.1 0 0 0 1 
i 15.34367 276.4288 0.7171673 87 70.42063 0 0.1 0 0 0 1 
i 4.630533 277.0558 0.5378755 60 74.39547 0 0.1 0 0 0 1 
i 4.81457 277.0558 0.5378755 65 74.69736 0 0.1 0 0 0 1 
i 5.059951 277.0558 0.5378755 57 75.09987 0 0.1 0 0 0 1 
i 5.366678 277.0558 0.5378755 52 75.60302 0 0.1 0 0 0 1 
i 5.550715 277.0558 0.5378755 72 75.90491 0 0.1 0 0 0 1 
i 5.857442 277.0558 0.5378755 67 76.40805 0 0.1 0 0 0 1 
i 6.102823 277.0558 0.5378755 75 76.81057 0 0.1 0 0 0 1 
i 6.28686 277.0558 0.5378755 80 77.11245 0 0.1 0 0 0 1 
i 12.83967 277.0558 0.5378755 83 74.39547 0 0.1 0 0 0 1 
i 13.0237 277.0558 0.5378755 88 74.69736 0 0.1 0 0 0 1 
i 13.26908 277.0558 0.5378755 80 75.09987 0 0.1 0 0 0 1 
i 13.57581 277.0558 0.5378755 75 75.60302 0 0.1 0 0 0 1 
i 13.75985 277.0558 0.5378755 95 75.90491 0 0.1 0 0 0 1 
i 14.06657 277.0558 0.5378755 90 76.40805 0 0.1 0 0 0 1 
i 14.31196 277.0558 0.5378755 98 76.81057 0 0.1 0 0 0 1 
i 14.49599 277.0558 0.5378755 103 77.11245 0 0.1 0 0 0 1 
i 2.784594 277.1459 0.7171673 50 70.01811 0 0.1 0 0 0 1 
i 6.88916 277.1459 0.7171673 61 70.01811 0 0.1 0 0 0 1 
i 10.99373 277.1459 0.7171673 73 70.01811 0 0.1 0 0 0 1 
i 15.09829 277.1459 0.7171673 84 70.01811 0 0.1 0 0 0 1 
i 4.569188 277.5937 0.5378755 61 74.29484 0 0.1 0 0 0 1 
i 4.875915 277.5937 0.5378755 66 74.79799 0 0.1 0 0 0 1 
i 5.121297 277.5937 0.5378755 58 75.2005 0 0.1 0 0 0 1 
i 5.305333 277.5937 0.5378755 53 75.50239 0 0.1 0 0 0 1 
i 5.61206 277.5937 0.5378755 73 76.00553 0 0.1 0 0 0 1 
i 5.796096 277.5937 0.5378755 68 76.30742 0 0.1 0 0 0 1 
i 6.041478 277.5937 0.5378755 76 76.70994 0 0.1 0 0 0 1 
i 6.348205 277.5937 0.5378755 81 77.21308 0 0.1 0 0 0 1 
i 12.77832 277.5937 0.5378755 84 74.29484 0 0.1 0 0 0 1 
i 13.08505 277.5937 0.5378755 89 74.79799 0 0.1 0 0 0 1 
i 13.33043 277.5937 0.5378755 81 75.2005 0 0.1 0 0 0 1 
i 13.51446 277.5937 0.5378755 76 75.50239 0 0.1 0 0 0 1 
i 13.82119 277.5937 0.5378755 96 76.00553 0 0.1 0 0 0 1 
i 14.00523 277.5937 0.5378755 91 76.30742 0 0.1 0 0 0 1 
i 14.25061 277.5937 0.5378755 99 76.70994 0 0.1 0 0 0 1 
i 14.55734 277.5937 0.5378755 104 77.21308 0 0.1 0 0 0 1 
i 2.845939 278.0415 0.7171673 50 70.11807 0 0.1 0 0 0 1 
i 3.029976 278.0415 0.7171673 53 70.41996 0 0.1 0 0 0 1 
i 6.950505 278.0415 0.7171673 61 70.11807 0 0.1 0 0 0 1 
i 7.134542 278.0415 1.434335 65 70.41996 0 0.1 0 0 0 1 
i 11.05507 278.0415 0.7171673 73 70.11807 0 0.1 0 0 0 1 
i 11.23911 278.0415 0.7171673 76 70.41996 0 0.1 0 0 0 1 
i 15.15964 278.0415 0.7171673 84 70.11807 0 0.1 0 0 0 1 
i 15.34367 278.0415 1.434335 88 70.41996 0 0.1 0 0 0 1 
i 4.691879 278.424 0.5378755 63 74.49543 0 0.1 0 0 0 1 
i 4.81457 278.424 0.5378755 59 74.69669 0 0.1 0 0 0 1 
i 5.059951 278.424 0.5378755 68 75.0992 0 0.1 0 0 0 1 
i 5.428024 278.424 0.5378755 72 75.70298 0 0.1 0 0 0 1 
i 5.550715 278.424 0.5378755 50 75.90423 0 0.1 0 0 0 1 
i 5.918787 278.424 0.5378755 55 76.50801 0 0.1 0 0 0 1 
i 6.164169 278.424 0.5378755 46 76.91052 0 0.1 0 0 0 1 
i 6.28686 278.424 0.5378755 41 77.11178 0 0.1 0 0 0 1 
i 12.90101 278.424 0.5378755 86 74.49543 0 0.1 0 0 0 1 
i 13.0237 278.424 0.5378755 82 74.69669 0 0.1 0 0 0 1 
i 13.26908 278.424 0.5378755 91 75.0992 0 0.1 0 0 0 1 
i 13.63716 278.424 0.5378755 95 75.70298 0 0.1 0 0 0 1 
i 13.75985 278.424 0.5378755 73 75.90423 0 0.1 0 0 0 1 
i 14.12792 278.424 0.5378755 78 76.50801 0 0.1 0 0 0 1 
i 14.3733 278.424 0.5378755 69 76.91052 0 0.1 0 0 0 1 
i 14.49599 278.424 0.5378755 64 77.11178 0 0.1 0 0 0 1 
i 2.784594 278.7586 0.7171673 51 70.01744 0 0.1 0 0 0 1 
i 3.091321 278.7586 0.7171673 54 70.52059 0 0.1 0 0 0 1 
i 6.88916 278.7586 0.7171673 62 70.01744 0 0.1 0 0 0 1 
i 10.99373 278.7586 0.7171673 74 70.01744 0 0.1 0 0 0 1 
i 11.30045 278.7586 0.7171673 77 70.52059 0 0.1 0 0 0 1 
i 15.09829 278.7586 0.7171673 85 70.01744 0 0.1 0 0 0 1 
i 4.569188 278.9619 0.5378755 61 74.29417 0 0.1 0 0 0 1 
i 4.93726 278.9619 0.5378755 56 74.89795 0 0.1 0 0 0 1 
i 5.182642 278.9619 0.5378755 65 75.30046 0 0.1 0 0 0 1 
i 5.305333 278.9619 0.5378755 70 75.50172 0 0.1 0 0 0 1 
i 5.673405 278.9619 0.5378755 48 76.10549 0 0.1 0 0 0 1 
i 5.796096 278.9619 0.5378755 52 76.30675 0 0.1 0 0 0 1 
i 6.041478 278.9619 0.5378755 43 76.70927 0 0.1 0 0 0 1 
i 6.40955 278.9619 0.5378755 39 77.31304 0 0.1 0 0 0 1 
i 12.77832 278.9619 0.5378755 84 74.29417 0 0.1 0 0 0 1 
i 13.14639 278.9619 0.5378755 79 74.89795 0 0.1 0 0 0 1 
i 13.39177 278.9619 0.5378755 88 75.30046 0 0.1 0 0 0 1 
i 13.51446 278.9619 0.5378755 93 75.50172 0 0.1 0 0 0 1 
i 13.88254 278.9619 0.5378755 71 76.10549 0 0.1 0 0 0 1 
i 14.00523 278.9619 0.5378755 75 76.30675 0 0.1 0 0 0 1 
i 14.25061 278.9619 0.5378755 66 76.70927 0 0.1 0 0 0 1 
i 14.61868 278.9619 1.448831 62 77.31304 0 0.1 0 0 0 1 
i 2.907285 279.6935 0.7171673 51 70.21803 0 0.1 0 0 0 1 
i 3.029976 279.6935 0.7171673 53 70.41929 0 0.1 0 0 0 1 
i 7.011851 279.6935 0.7171673 62 70.21803 0 0.1 0 0 0 1 
i 7.134542 279.6935 0.7171673 65 70.41929 0 0.1 0 0 0 1 
i 11.11642 279.6935 0.7171673 74 70.21803 0 0.1 0 0 0 1 
i 11.23911 279.6935 0.7171673 76 70.41929 0 0.1 0 0 0 1 
i 15.22098 279.6935 0.7171673 85 70.21803 0 0.1 0 0 0 1 
i 15.34367 279.6935 0.7171673 88 70.41929 0 0.1 0 0 0 1 
i 4.630533 279.696 1.075751 61 74.39413 0 0.1 0 0 0 1 
i 4.81457 279.696 1.075751 62 74.69602 0 0.1 0 0 0 1 
i 5.550715 279.696 1.075751 62 75.90356 0 0.1 0 0 0 1 
i 5.734751 279.696 1.075751 63 76.20545 0 0.1 0 0 0 1 
i 12.83967 279.696 1.075751 84 74.39413 0 0.1 0 0 0 1 
i 13.0237 279.696 1.075751 85 74.69602 0 0.1 0 0 0 1 
i 13.57581 279.696 1.075751 84 75.60168 0 0.1 0 0 0 1 
i 13.75985 279.696 1.075751 85 75.90356 0 0.1 0 0 0 1 
i 13.94388 279.696 1.075751 86 76.20545 0 0.1 0 0 0 1 
i 14.68003 279.696 1.075751 86 77.413 0 0.1 0 0 0 1 
i 5.489369 280.2338 0.5378755 60 75.80294 0 0.1 0 0 0 1 
i 13.6985 280.2338 0.5378755 83 75.80294 0 0.1 0 0 0 1 
i 2.784594 280.4107 0.7171673 52 70.01677 0 0.1 0 0 0 1 
i 3.152666 280.4107 0.7171673 54 70.62055 0 0.1 0 0 0 1 
i 6.88916 280.4107 0.7171673 64 70.01677 0 0.1 0 0 0 1 
i 7.257232 280.4107 0.7171673 66 70.62055 0 0.1 0 0 0 1 
i 10.99373 280.4107 0.7171673 75 70.01677 0 0.1 0 0 0 1 
i 11.3618 280.4107 0.7171673 77 70.62055 0 0.1 0 0 0 1 
i 15.09829 280.4107 0.7171673 87 70.01677 0 0.1 0 0 0 1 
i 15.46636 280.4107 2.25308 89 70.62055 0 0.1 0 0 0 1 
i 2.845939 281.2294 0.7171673 53 70.11673 0 0.1 0 0 0 1 
i 2.907285 281.2294 1.434335 52 70.21736 0 0.1 0 0 0 1 
i 3.029976 281.2294 1.434335 54 70.41862 0 0.1 0 0 0 1 
i 3.214012 281.2294 1.434335 55 70.7205 0 0.1 0 0 0 1 
i 6.950505 281.2294 1.434335 65 70.11673 0 0.1 0 0 0 1 
i 7.011851 281.2294 1.434335 63 70.21736 0 0.1 0 0 0 1 
i 7.134542 281.2294 1.434335 66 70.41862 0 0.1 0 0 0 1 
i 7.318578 281.2294 0.7171673 67 70.7205 0 0.1 0 0 0 1 
i 11.05507 281.2294 0.7171673 76 70.11673 0 0.1 0 0 0 1 
i 11.11642 281.2294 1.434335 75 70.21736 0 0.1 0 0 0 1 
i 11.23911 281.2294 1.434335 77 70.41862 0 0.1 0 0 0 1 
i 11.42314 281.2294 1.434335 78 70.7205 0 0.1 0 0 0 1 
i 15.15964 281.2294 1.434335 88 70.11673 0 0.1 0 0 0 1 
i 15.22098 281.2294 1.434335 86 70.21736 0 0.1 0 0 0 1 
i 15.52771 281.2294 0.7171673 90 70.7205 0 0.1 0 0 0 1 
i 2.96863 281.9466 0.7171673 51 70.31799 0 0.1 0 0 0 1 
i 6.88916 281.9466 0.7171673 64 70.0161 0 0.1 0 0 0 1 
i 11.17776 281.9466 0.7171673 74 70.31799 0 0.1 0 0 0 1 
i 15.09829 281.9466 2.137916 87 70.0161 0 0.1 0 0 0 1 
i 3.275357 283.3674 0.7171673 54 70.82046 0 0.1 0 0 0 1 
i 7.379923 283.3674 0.7171673 65 70.82046 0 0.1 0 0 0 1 
i 11.48449 283.3674 0.7171673 77 70.82046 0 0.1 0 0 0 1 
i 15.58906 283.3674 0.7171673 88 70.82046 0 0.1 0 0 0 1 
i 2.784594 284.0845 0.7171673 49 70.01543 0 0.1 0 0 0 1 
i 6.88916 284.0845 0.7171673 61 70.01543 0 0.1 0 0 0 1 
i 10.99373 284.0845 0.7171673 72 70.01543 0 0.1 0 0 0 1 
i 15.09829 284.0845 2.329876 84 70.01543 0 0.1 0 0 0 1 
i 2.845939 284.9801 1.434335 49 70.11539 0 0.1 0 0 0 1 
i 3.275357 284.9801 1.434335 55 70.81979 0 0.1 0 0 0 1 
i 6.950505 284.9801 0.7171673 60 70.11539 0 0.1 0 0 0 1 
i 7.379923 284.9801 0.7171673 66 70.81979 0 0.1 0 0 0 1 
i 11.05507 284.9801 1.434335 72 70.11539 0 0.1 0 0 0 1 
i 11.48449 284.9801 0.7171673 78 70.81979 0 0.1 0 0 0 1 
i 15.15964 284.9801 0.7171673 83 70.11539 0 0.1 0 0 0 1 
i 15.58906 284.9801 0.7171673 89 70.81979 0 0.1 0 0 0 1 
i 6.88916 285.6972 0.7171673 61 70.01476 0 0.1 0 0 0 1 
i 7.441269 285.6972 0.7171673 67 70.92042 0 0.1 0 0 0 1 
i 11.54583 285.6972 0.7171673 78 70.92042 0 0.1 0 0 0 1 
i 15.6504 285.6972 1.652043 90 70.92042 0 0.1 0 0 0 1 
i 2.907285 286.6321 0.7171673 49 70.21535 0 0.1 0 0 0 1 
i 3.275357 286.6321 0.7171673 55 70.81912 0 0.1 0 0 0 1 
i 7.011851 286.6321 0.7171673 60 70.21535 0 0.1 0 0 0 1 
i 7.379923 286.6321 0.7171673 66 70.81912 0 0.1 0 0 0 1 
i 11.11642 286.6321 0.7171673 72 70.21535 0 0.1 0 0 0 1 
i 11.48449 286.6321 0.7171673 78 70.81912 0 0.1 0 0 0 1 
i 15.22098 286.6321 0.7171673 83 70.21535 0 0.1 0 0 0 1 
i 15.58906 286.6321 0.7171673 89 70.81912 0 0.1 0 0 0 1 
i 2.784594 287.3493 0.7171673 50 70.01409 0 0.1 0 0 0 1 
i 3.398048 287.3493 0.7171673 56 71.02038 0 0.1 0 0 0 1 
i 6.88916 287.3493 0.7171673 62 70.01409 0 0.1 0 0 0 1 
i 7.502614 287.3493 0.7171673 68 71.02038 0 0.1 0 0 0 1 
i 10.99373 287.3493 0.7171673 73 70.01409 0 0.1 0 0 0 1 
i 11.60718 287.3493 0.7171673 79 71.02038 0 0.1 0 0 0 1 
i 15.09829 287.3493 0.7171673 85 70.01409 0 0.1 0 0 0 1 
i 15.71175 287.3493 4.021253 91 71.02038 0 0.1 0 0 0 1 
i 2.845939 288.168 1.434335 50 70.11405 0 0.1 0 0 0 1 
i 2.907285 288.168 1.434335 49 70.21468 0 0.1 0 0 0 1 
i 3.275357 288.168 1.434335 56 70.81845 0 0.1 0 0 0 1 
i 3.459394 288.168 0.7171673 57 71.12034 0 0.1 0 0 0 1 
i 6.950505 288.168 0.7171673 62 70.11405 0 0.1 0 0 0 1 
i 7.011851 288.168 1.434335 61 70.21468 0 0.1 0 0 0 1 
i 7.379923 288.168 1.434335 67 70.81845 0 0.1 0 0 0 1 
i 7.56396 288.168 0.7171673 69 71.12034 0 0.1 0 0 0 1 
i 11.05507 288.168 1.434335 73 70.11405 0 0.1 0 0 0 1 
i 11.11642 288.168 1.434335 72 70.21468 0 0.1 0 0 0 1 
i 11.48449 288.168 0.7171673 79 70.81845 0 0.1 0 0 0 1 
i 11.66853 288.168 0.7171673 80 71.12034 0 0.1 0 0 0 1 
i 15.15964 288.168 0.7171673 85 70.11405 0 0.1 0 0 0 1 
i 15.22098 288.168 1.434335 84 70.21468 0 0.1 0 0 0 1 
i 15.58906 288.168 1.434335 90 70.81845 0 0.1 0 0 0 1 
i 15.77309 288.168 0.7171673 92 71.12034 0 0.1 0 0 0 1 
i 3.336703 288.8852 0.7171673 55 70.91908 0 0.1 0 0 0 1 
i 7.073196 288.8852 0.7171673 60 70.3153 0 0.1 0 0 0 1 
i 7.502614 288.8852 0.7171673 68 71.01971 0 0.1 0 0 0 1 
i 11.54583 288.8852 0.7171673 78 70.91908 0 0.1 0 0 0 1 
i 11.60718 288.8852 0.7171673 79 71.01971 0 0.1 0 0 0 1 
i 15.28233 288.8852 0.7171673 83 70.3153 0 0.1 0 0 0 1 
i 3.029976 289.9362 0.7171673 50 70.41526 0 0.1 0 0 0 1 
i 3.275357 289.9362 0.7171673 54 70.81778 0 0.1 0 0 0 1 
i 7.134542 289.9362 0.7171673 61 70.41526 0 0.1 0 0 0 1 
i 7.379923 289.9362 0.7171673 66 70.81778 0 0.1 0 0 0 1 
i 11.23911 289.9362 0.7171673 73 70.41526 0 0.1 0 0 0 1 
i 11.48449 289.9362 0.7171673 77 70.81778 0 0.1 0 0 0 1 
i 15.34367 289.9362 0.7171673 84 70.41526 0 0.1 0 0 0 1 
i 15.58906 289.9362 0.7171673 89 70.81778 0 0.1 0 0 0 1 
i 2.784594 290.6534 0.7171673 52 70.01275 0 0.1 0 0 0 1 
i 3.520739 290.6534 0.7171673 57 71.22029 0 0.1 0 0 0 1 
i 6.88916 290.6534 0.7171673 64 70.01275 0 0.1 0 0 0 1 
i 7.625305 290.6534 0.7171673 68 71.22029 0 0.1 0 0 0 1 
i 10.99373 290.6534 0.7171673 75 70.01275 0 0.1 0 0 0 1 
i 11.72987 290.6534 0.7171673 80 71.22029 0 0.1 0 0 0 1 
i 15.09829 290.6534 0.7171673 87 70.01275 0 0.1 0 0 0 1 
i 1 291.0644 0.5378755 54 70.0208 0 0.1 0 0 0 1 
i 5.104566 291.0644 0.5378755 65 70.0208 0 0.1 0 0 0 1 
i 9.209132 291.0644 0.5378755 77 70.0208 0 0.1 0 0 0 1 
i 13.3137 291.0644 0.5378755 88 70.0208 0 0.1 0 0 0 1 
i 2.845939 291.4721 1.434335 53 70.1127 0 0.1 0 0 0 1 
i 3.029976 291.4721 0.7171673 50 70.41459 0 0.1 0 0 0 1 
i 3.275357 291.4721 0.7171673 55 70.81711 0 0.1 0 0 0 1 
i 3.582084 291.4721 0.7171673 58 71.32025 0 0.1 0 0 0 1 
i 6.950505 291.4721 0.7171673 65 70.1127 0 0.1 0 0 0 1 
i 7.134542 291.4721 1.434335 61 70.41459 0 0.1 0 0 0 1 
i 7.379923 291.4721 1.434335 66 70.81711 0 0.1 0 0 0 1 
i 7.68665 291.4721 1.434335 69 71.32025 0 0.1 0 0 0 1 
i 11.05507 291.4721 1.434335 76 70.1127 0 0.1 0 0 0 1 
i 11.23911 291.4721 0.7171673 73 70.41459 0 0.1 0 0 0 1 
i 11.48449 291.4721 0.7171673 78 70.81711 0 0.1 0 0 0 1 
i 11.79122 291.4721 0.7171673 81 71.32025 0 0.1 0 0 0 1 
i 15.15964 291.4721 0.7171673 88 70.1127 0 0.1 0 0 0 1 
i 15.34367 291.4721 1.434335 84 70.41459 0 0.1 0 0 0 1 
i 15.58906 291.4721 1.434335 89 70.81711 0 0.1 0 0 0 1 
i 15.89578 291.4721 1.434335 92 71.32025 0 0.1 0 0 0 1 
i 3.091321 292.1893 0.7171673 49 70.51522 0 0.1 0 0 0 1 
i 3.336703 292.1893 0.7171673 54 70.91774 0 0.1 0 0 0 1 
i 3.520739 292.1893 0.7171673 57 71.21962 0 0.1 0 0 0 1 
i 6.88916 292.1893 0.7171673 64 70.01208 0 0.1 0 0 0 1 
i 11.30045 292.1893 0.7171673 72 70.51522 0 0.1 0 0 0 1 
i 11.54583 292.1893 0.7171673 77 70.91774 0 0.1 0 0 0 1 
i 11.72987 292.1893 0.7171673 80 71.21962 0 0.1 0 0 0 1 
i 15.09829 292.1893 0.7171673 87 70.01208 0 0.1 0 0 0 1 
i 1.061345 292.2199 1.075751 55 70.12075 0 0.1 0 0 0 1 
i 5.165911 292.2199 0.5378755 67 70.12075 0 0.1 0 0 0 1 
i 9.270478 292.2199 1.075751 78 70.12075 0 0.1 0 0 0 1 
i 13.37504 292.2199 0.5378755 90 70.12075 0 0.1 0 0 0 1 
i 5.104566 292.7577 0.5378755 66 70.02013 0 0.1 0 0 0 1 
i 13.3137 292.7577 0.5378755 89 70.02013 0 0.1 0 0 0 1 
i 2.907285 293.0455 0.7171673 53 70.21266 0 0.1 0 0 0 1 
i 3.029976 293.0455 0.7171673 51 70.41392 0 0.1 0 0 0 1 
i 3.275357 293.0455 0.7171673 56 70.81644 0 0.1 0 0 0 1 
i 3.64343 293.0455 0.7171673 58 71.42021 0 0.1 0 0 0 1 
i 7.011851 293.0455 0.7171673 65 70.21266 0 0.1 0 0 0 1 
i 7.134542 293.0455 0.7171673 63 70.41392 0 0.1 0 0 0 1 
i 7.379923 293.0455 0.7171673 67 70.81644 0 0.1 0 0 0 1 
i 7.747996 293.0455 0.7171673 70 71.42021 0 0.1 0 0 0 1 
i 11.11642 293.0455 0.7171673 76 70.21266 0 0.1 0 0 0 1 
i 11.23911 293.0455 0.7171673 74 70.41392 0 0.1 0 0 0 1 
i 11.48449 293.0455 0.7171673 79 70.81644 0 0.1 0 0 0 1 
i 11.85256 293.0455 0.7171673 81 71.42021 0 0.1 0 0 0 1 
i 15.22098 293.0455 0.7171673 88 70.21266 0 0.1 0 0 0 1 
i 15.34367 293.0455 0.7171673 86 70.41392 0 0.1 0 0 0 1 
i 15.58906 293.0455 0.7171673 90 70.81644 0 0.1 0 0 0 1 
i 15.95713 293.0455 0.7171673 93 71.42021 0 0.1 0 0 0 1 
i 2.784594 293.7626 0.7171673 52 70.0114 0 0.1 0 0 0 1 
i 3.152666 293.7626 0.7171673 50 70.61518 0 0.1 0 0 0 1 
i 3.398048 293.7626 0.7171673 54 71.01769 0 0.1 0 0 0 1 
i 3.520739 293.7626 0.7171673 57 71.21895 0 0.1 0 0 0 1 
i 6.88916 293.7626 0.7171673 64 70.0114 0 0.1 0 0 0 1 
i 7.257232 293.7626 0.7171673 61 70.61518 0 0.1 0 0 0 1 
i 7.502614 293.7626 0.7171673 66 71.01769 0 0.1 0 0 0 1 
i 7.625305 293.7626 0.7171673 68 71.21895 0 0.1 0 0 0 1 
i 10.99373 293.7626 0.7171673 75 70.0114 0 0.1 0 0 0 1 
i 11.3618 293.7626 0.7171673 73 70.61518 0 0.1 0 0 0 1 
i 11.60718 293.7626 0.7171673 77 71.01769 0 0.1 0 0 0 1 
i 11.72987 293.7626 0.7171673 80 71.21895 0 0.1 0 0 0 1 
i 15.09829 293.7626 0.7171673 87 70.0114 0 0.1 0 0 0 1 
i 15.46636 293.7626 0.7171673 84 70.61518 0 0.1 0 0 0 1 
i 15.71175 293.7626 0.7171673 89 71.01769 0 0.1 0 0 0 1 
i 15.83444 293.7626 0.7171673 91 71.21895 0 0.1 0 0 0 1 
i 1.122691 293.9545 0.5378755 56 70.22071 0 0.1 0 0 0 1 
i 5.227257 293.9545 0.5378755 68 70.22071 0 0.1 0 0 0 1 
i 9.331823 293.9545 0.5378755 79 70.22071 0 0.1 0 0 0 1 
i 13.43639 293.9545 0.5378755 91 70.22071 0 0.1 0 0 0 1 
i 1 294.4924 0.5378755 55 70.01945 0 0.1 0 0 0 1 
i 5.104566 294.4924 0.5378755 67 70.01945 0 0.1 0 0 0 1 
i 9.209132 294.4924 0.5378755 78 70.01945 0 0.1 0 0 0 1 
i 13.3137 294.4924 0.5378755 90 70.01945 0 0.1 0 0 0 1 
i 2.845939 294.5083 1.434335 52 70.11136 0 0.1 0 0 0 1 
i 2.907285 294.5083 1.434335 53 70.21199 0 0.1 0 0 0 1 
i 3.029976 294.5083 0.7171673 51 70.41325 0 0.1 0 0 0 1 
i 3.214012 294.5083 1.434335 50 70.71514 0 0.1 0 0 0 1 
i 3.275357 294.5083 1.434335 56 70.81577 0 0.1 0 0 0 1 
i 3.459394 294.5083 1.434335 55 71.11765 0 0.1 0 0 0 1 
i 3.582084 294.5083 0.7171673 57 71.31891 0 0.1 0 0 0 1 
i 3.64343 294.5083 1.434335 58 71.41954 0 0.1 0 0 0 1 
i 6.950505 294.5083 1.434335 64 70.11136 0 0.1 0 0 0 1 
i 7.011851 294.5083 0.7171673 65 70.21199 0 0.1 0 0 0 1 
i 7.134542 294.5083 1.434335 63 70.41325 0 0.1 0 0 0 1 
i 7.318578 294.5083 0.7171673 61 70.71514 0 0.1 0 0 0 1 
i 7.379923 294.5083 0.7171673 67 70.81577 0 0.1 0 0 0 1 
i 7.56396 294.5083 0.7171673 66 71.11765 0 0.1 0 0 0 1 
i 7.68665 294.5083 0.7171673 68 71.31891 0 0.1 0 0 0 1 
i 7.747996 294.5083 1.434335 70 71.41954 0 0.1 0 0 0 1 
i 11.05507 294.5083 1.434335 75 70.11136 0 0.1 0 0 0 1 
i 11.11642 294.5083 1.434335 76 70.21199 0 0.1 0 0 0 1 
i 11.23911 294.5083 0.7171673 74 70.41325 0 0.1 0 0 0 1 
i 11.42314 294.5083 1.434335 73 70.71514 0 0.1 0 0 0 1 
i 11.48449 294.5083 0.7171673 79 70.81577 0 0.1 0 0 0 1 
i 11.66853 294.5083 1.434335 78 71.11765 0 0.1 0 0 0 1 
i 11.79122 294.5083 0.7171673 80 71.31891 0 0.1 0 0 0 1 
i 11.85256 294.5083 1.434335 81 71.41954 0 0.1 0 0 0 1 
i 15.15964 294.5083 1.434335 87 70.11136 0 0.1 0 0 0 1 
i 15.22098 294.5083 0.7171673 88 70.21199 0 0.1 0 0 0 1 
i 15.34367 294.5083 1.434335 86 70.41325 0 0.1 0 0 0 1 
i 15.52771 294.5083 0.7171673 84 70.71514 0 0.1 0 0 0 1 
i 15.58906 294.5083 1.434335 90 70.81577 0 0.1 0 0 0 1 
i 15.77309 294.5083 0.7171673 89 71.11765 0 0.1 0 0 0 1 
i 15.89578 294.5083 1.434335 91 71.31891 0 0.1 0 0 0 1 
i 15.95713 294.5083 1.434335 93 71.41954 0 0.1 0 0 0 1 
i 2.96863 295.2254 0.7171673 54 70.31262 0 0.1 0 0 0 1 
i 3.704775 295.2254 0.7171673 59 71.52017 0 0.1 0 0 0 1 
i 7.073196 295.2254 0.7171673 66 70.31262 0 0.1 0 0 0 1 
i 7.257232 295.2254 0.7171673 62 70.61451 0 0.1 0 0 0 1 
i 7.441269 295.2254 0.7171673 68 70.91639 0 0.1 0 0 0 1 
i 7.502614 295.2254 0.7171673 67 71.01702 0 0.1 0 0 0 1 
i 7.625305 295.2254 0.7171673 69 71.21828 0 0.1 0 0 0 1 
i 11.17776 295.2254 0.7171673 77 70.31262 0 0.1 0 0 0 1 
i 11.54583 295.2254 0.7171673 79 70.91639 0 0.1 0 0 0 1 
i 11.91391 295.2254 0.7171673 82 71.52017 0 0.1 0 0 0 1 
i 15.28233 295.2254 0.7171673 89 70.31262 0 0.1 0 0 0 1 
i 15.46636 295.2254 0.7171673 85 70.61451 0 0.1 0 0 0 1 
i 15.83444 295.2254 0.7171673 92 71.21828 0 0.1 0 0 0 1 
i 1.061345 295.5672 1.075751 56 70.11941 0 0.1 0 0 0 1 
i 1.122691 295.5672 0.5378755 57 70.22004 0 0.1 0 0 0 1 
i 5.165911 295.5672 0.5378755 67 70.11941 0 0.1 0 0 0 1 
i 5.227257 295.5672 1.075751 68 70.22004 0 0.1 0 0 0 1 
i 9.270478 295.5672 1.075751 79 70.11941 0 0.1 0 0 0 1 
i 9.331823 295.5672 0.5378755 80 70.22004 0 0.1 0 0 0 1 
i 13.37504 295.5672 0.5378755 90 70.11941 0 0.1 0 0 0 1 
i 13.43639 295.5672 1.075751 91 70.22004 0 0.1 0 0 0 1 
i 1.184036 296.1051 0.5378755 58 70.32067 0 0.1 0 0 0 1 
i 5.288602 296.1051 0.5378755 69 70.32067 0 0.1 0 0 0 1 
i 9.393168 296.1051 0.5378755 81 70.32067 0 0.1 0 0 0 1 
i 13.49773 296.1051 1.856582 92 70.32067 0 0.1 0 0 0 1 
i 3.766121 297.2445 0.7171673 54 71.62013 0 0.1 0 0 0 1 
i 7.870687 297.2445 0.7171673 65 71.62013 0 0.1 0 0 0 1 
i 11.97525 297.2445 0.7171673 77 71.62013 0 0.1 0 0 0 1 
i 16.07982 297.2445 0.7171673 88 71.62013 0 0.1 0 0 0 1 
i 1.245382 297.4238 0.5378755 58 70.42063 0 0.1 0 0 0 1 
i 5.349948 297.4238 0.5378755 69 70.42063 0 0.1 0 0 0 1 
i 9.454514 297.4238 0.5378755 81 70.42063 0 0.1 0 0 0 1 
i 13.55908 297.4238 0.5378755 92 70.42063 0 0.1 0 0 0 1 
i 2.784594 297.9617 0.7171673 46 70.01006 0 0.1 0 0 0 1 
i 6.88916 297.9617 0.7171673 57 70.01006 0 0.1 0 0 0 1 
i 10.99373 297.9617 0.7171673 69 70.01006 0 0.1 0 0 0 1 
i 15.09829 297.9617 0.7171673 80 70.01006 0 0.1 0 0 0 1 
i 1 297.9617 0.5378755 55 70.01811 0 0.1 0 0 0 1 
i 5.104566 297.9617 0.5378755 67 70.01811 0 0.1 0 0 0 1 
i 9.209132 297.9617 0.5378755 78 70.01811 0 0.1 0 0 0 1 
i 13.3137 297.9617 1.612709 90 70.01811 0 0.1 0 0 0 1 
i 2.845939 298.8572 0.7171673 44 70.11002 0 0.1 0 0 0 1 
i 3.766121 298.8572 1.434335 55 71.61945 0 0.1 0 0 0 1 
i 6.950505 298.8572 1.434335 56 70.11002 0 0.1 0 0 0 1 
i 7.870687 298.8572 0.7171673 66 71.61945 0 0.1 0 0 0 1 
i 11.05507 298.8572 0.7171673 67 70.11002 0 0.1 0 0 0 1 
i 11.97525 298.8572 1.434335 78 71.61945 0 0.1 0 0 0 1 
i 15.15964 298.8572 1.434335 79 70.11002 0 0.1 0 0 0 1 
i 16.07982 298.8572 0.7171673 89 71.61945 0 0.1 0 0 0 1 
i 1.061345 299.0365 1.075751 56 70.11807 0 0.1 0 0 0 1 
i 1.245382 299.0365 0.5378755 58 70.41996 0 0.1 0 0 0 1 
i 5.165911 299.0365 0.5378755 67 70.11807 0 0.1 0 0 0 1 
i 5.349948 299.0365 0.5378755 70 70.41996 0 0.1 0 0 0 1 
i 9.270478 299.0365 1.075751 79 70.11807 0 0.1 0 0 0 1 
i 9.454514 299.0365 0.5378755 81 70.41996 0 0.1 0 0 0 1 
i 13.55908 299.0365 0.5378755 93 70.41996 0 0.1 0 0 0 1 
i 1.306727 299.5744 0.5378755 59 70.52059 0 0.1 0 0 0 1 
i 2.784594 299.5744 0.7171673 45 70.00939 0 0.1 0 0 0 1 
i 5.104566 299.5744 0.5378755 68 70.01744 0 0.1 0 0 0 1 
i 5.411293 299.5744 0.5378755 71 70.52059 0 0.1 0 0 0 1 
i 7.932032 299.5744 0.7171673 67 71.72008 0 0.1 0 0 0 1 
i 9.515859 299.5744 0.5378755 82 70.52059 0 0.1 0 0 0 1 
i 10.99373 299.5744 0.7171673 68 70.00939 0 0.1 0 0 0 1 
i 13.3137 299.5744 0.5378755 91 70.01744 0 0.1 0 0 0 1 
i 13.62043 299.5744 0.5378755 94 70.52059 0 0.1 0 0 0 1 
i 16.14116 299.5744 3.905123 90 71.72008 0 0.1 0 0 0 1 
i 2.907285 300.5093 0.7171673 43 70.20998 0 0.1 0 0 0 1 
i 3.766121 300.5093 0.7171673 55 71.61878 0 0.1 0 0 0 1 
i 7.011851 300.5093 0.7171673 55 70.20998 0 0.1 0 0 0 1 
i 7.870687 300.5093 0.7171673 66 71.61878 0 0.1 0 0 0 1 
i 11.11642 300.5093 0.7171673 66 70.20998 0 0.1 0 0 0 1 
i 11.97525 300.5093 0.7171673 78 71.61878 0 0.1 0 0 0 1 
i 15.22098 300.5093 0.7171673 78 70.20998 0 0.1 0 0 0 1 
i 16.07982 300.5093 0.7171673 89 71.61878 0 0.1 0 0 0 1 
i 1.122691 300.6886 0.5378755 56 70.21803 0 0.1 0 0 0 1 
i 1.245382 300.6886 1.075751 58 70.41929 0 0.1 0 0 0 1 
i 5.227257 300.6886 0.5378755 68 70.21803 0 0.1 0 0 0 1 
i 5.349948 300.6886 0.5378755 70 70.41929 0 0.1 0 0 0 1 
i 9.331823 300.6886 0.5378755 79 70.21803 0 0.1 0 0 0 1 
i 9.454514 300.6886 1.075751 81 70.41929 0 0.1 0 0 0 1 
i 13.43639 300.6886 0.5378755 91 70.21803 0 0.1 0 0 0 1 
i 13.55908 300.6886 0.5378755 93 70.41929 0 0.1 0 0 0 1 
i 1.368072 301.2264 0.5378755 60 70.62055 0 0.1 0 0 0 1 
i 2.784594 301.2264 0.7171673 45 70.00872 0 0.1 0 0 0 1 
i 3.888811 301.2264 0.7171673 56 71.82004 0 0.1 0 0 0 1 
i 5.104566 301.2264 0.5378755 69 70.01677 0 0.1 0 0 0 1 
i 5.472639 301.2264 0.5378755 71 70.62055 0 0.1 0 0 0 1 
i 6.88916 301.2264 0.7171673 56 70.00872 0 0.1 0 0 0 1 
i 7.993377 301.2264 0.7171673 67 71.82004 0 0.1 0 0 0 1 
i 9.577205 301.2264 0.5378755 83 70.62055 0 0.1 0 0 0 1 
i 10.99373 301.2264 0.7171673 68 70.00872 0 0.1 0 0 0 1 
i 12.09794 301.2264 0.7171673 79 71.82004 0 0.1 0 0 0 1 
i 13.3137 301.2264 0.5378755 92 70.01677 0 0.1 0 0 0 1 
i 13.68177 301.2264 0.5378755 94 70.62055 0 0.1 0 0 0 1 
i 15.09829 301.2264 0.7171673 79 70.00872 0 0.1 0 0 0 1 
i 2.845939 302.0452 1.434335 44 70.10868 0 0.1 0 0 0 1 
i 2.907285 302.0452 0.7171673 43 70.20931 0 0.1 0 0 0 1 
i 3.766121 302.0452 1.434335 56 71.61811 0 0.1 0 0 0 1 
i 3.950157 302.0452 0.7171673 57 71.92 0 0.1 0 0 0 1 
i 6.950505 302.0452 0.7171673 56 70.10868 0 0.1 0 0 0 1 
i 7.011851 302.0452 1.434335 55 70.20931 0 0.1 0 0 0 1 
i 7.870687 302.0452 1.434335 67 71.61811 0 0.1 0 0 0 1 
i 8.054723 302.0452 1.434335 68 71.92 0 0.1 0 0 0 1 
i 11.05507 302.0452 1.434335 67 70.10868 0 0.1 0 0 0 1 
i 11.11642 302.0452 0.7171673 66 70.20931 0 0.1 0 0 0 1 
i 11.97525 302.0452 1.434335 79 71.61811 0 0.1 0 0 0 1 
i 12.15929 302.0452 0.7171673 80 71.92 0 0.1 0 0 0 1 
i 15.15964 302.0452 0.7171673 79 70.10868 0 0.1 0 0 0 1 
i 15.22098 302.0452 1.434335 78 70.20931 0 0.1 0 0 0 1 
i 16.26386 302.0452 1.434335 91 71.92 0 0.1 0 0 0 1 
i 1.061345 302.2245 1.075751 58 70.11673 0 0.1 0 0 0 1 
i 1.122691 302.2245 1.075751 57 70.21736 0 0.1 0 0 0 1 
i 1.245382 302.2245 1.075751 59 70.41862 0 0.1 0 0 0 1 
i 1.429418 302.2245 0.5378755 61 70.7205 0 0.1 0 0 0 1 
i 5.165911 302.2245 1.075751 70 70.11673 0 0.1 0 0 0 1 
i 5.227257 302.2245 1.075751 69 70.21736 0 0.1 0 0 0 1 
i 5.349948 302.2245 0.5378755 71 70.41862 0 0.1 0 0 0 1 
i 5.533984 302.2245 0.5378755 72 70.7205 0 0.1 0 0 0 1 
i 9.270478 302.2245 1.075751 81 70.11673 0 0.1 0 0 0 1 
i 9.331823 302.2245 1.075751 80 70.21736 0 0.1 0 0 0 1 
i 9.454514 302.2245 0.5378755 82 70.41862 0 0.1 0 0 0 1 
i 9.63855 302.2245 0.5378755 84 70.7205 0 0.1 0 0 0 1 
i 13.37504 302.2245 0.5378755 93 70.11673 0 0.1 0 0 0 1 
i 13.43639 302.2245 1.075751 92 70.21736 0 0.1 0 0 0 1 
i 13.55908 302.2245 0.5378755 94 70.41862 0 0.1 0 0 0 1 
i 13.74312 302.2245 1.075751 95 70.7205 0 0.1 0 0 0 1 
i 1.368072 302.7623 0.5378755 60 70.61987 0 0.1 0 0 0 1 
i 2.96863 302.7623 0.7171673 42 70.30994 0 0.1 0 0 0 1 
i 3.827466 302.7623 0.7171673 55 71.71874 0 0.1 0 0 0 1 
i 5.288602 302.7623 0.5378755 68 70.31799 0 0.1 0 0 0 1 
i 5.472639 302.7623 0.5378755 72 70.61987 0 0.1 0 0 0 1 
i 7.073196 302.7623 0.7171673 54 70.30994 0 0.1 0 0 0 1 
i 9.515859 302.7623 0.5378755 82 70.51925 0 0.1 0 0 0 1 
i 9.577205 302.7623 0.5378755 83 70.61987 0 0.1 0 0 0 1 
i 11.17776 302.7623 0.7171673 65 70.30994 0 0.1 0 0 0 1 
i 12.0366 302.7623 0.7171673 78 71.71874 0 0.1 0 0 0 1 
i 13.49773 302.7623 0.5378755 91 70.31799 0 0.1 0 0 0 1 
i 13.62043 302.7623 0.5378755 93 70.51925 0 0.1 0 0 0 1 
i 15.28233 302.7623 1.768173 77 70.30994 0 0.1 0 0 0 1 
i 3.029976 303.8134 0.7171673 43 70.4099 0 0.1 0 0 0 1 
i 3.766121 303.8134 0.7171673 54 71.61744 0 0.1 0 0 0 1 
i 7.134542 303.8134 0.7171673 54 70.4099 0 0.1 0 0 0 1 
i 7.870687 303.8134 0.7171673 66 71.61744 0 0.1 0 0 0 1 
i 11.23911 303.8134 0.7171673 66 70.4099 0 0.1 0 0 0 1 
i 11.97525 303.8134 0.7171673 77 71.61744 0 0.1 0 0 0 1 
i 16.07982 303.8134 0.7171673 89 71.61744 0 0.1 0 0 0 1 
i 1.490763 304.3624 0.5378755 59 70.82046 0 0.1 0 0 0 1 
i 5.595329 304.3624 0.5378755 71 70.82046 0 0.1 0 0 0 1 
i 9.699895 304.3624 0.5378755 82 70.82046 0 0.1 0 0 0 1 
i 13.80446 304.3624 0.5378755 94 70.82046 0 0.1 0 0 0 1 
i 2.784594 304.5305 0.7171673 45 70.00738 0 0.1 0 0 0 1 
i 4.011502 304.5305 0.7171673 57 72.01996 0 0.1 0 0 0 1 
i 6.88916 304.5305 0.7171673 57 70.00738 0 0.1 0 0 0 1 
i 8.116068 304.5305 0.7171673 68 72.01996 0 0.1 0 0 0 1 
i 10.99373 304.5305 0.7171673 68 70.00738 0 0.1 0 0 0 1 
i 12.22063 304.5305 0.7171673 80 72.01996 0 0.1 0 0 0 1 
i 15.09829 304.5305 0.7171673 80 70.00738 0 0.1 0 0 0 1 
i 16.3252 304.5305 0.7171673 91 72.01996 0 0.1 0 0 0 1 
i 1 304.9003 0.5378755 55 70.01543 0 0.1 0 0 0 1 
i 5.104566 304.9003 0.5378755 67 70.01543 0 0.1 0 0 0 1 
i 9.209132 304.9003 0.5378755 78 70.01543 0 0.1 0 0 0 1 
i 13.3137 304.9003 0.5378755 90 70.01543 0 0.1 0 0 0 1 
i 2.845939 305.3493 1.434335 45 70.10734 0 0.1 0 0 0 1 
i 3.029976 305.3493 1.434335 42 70.40922 0 0.1 0 0 0 1 
i 3.766121 305.3493 0.7171673 55 71.61677 0 0.1 0 0 0 1 
i 4.072848 305.3493 0.7171673 58 72.11992 0 0.1 0 0 0 1 
i 6.950505 305.3493 0.7171673 57 70.10734 0 0.1 0 0 0 1 
i 7.134542 305.3493 0.7171673 54 70.40922 0 0.1 0 0 0 1 
i 7.870687 305.3493 0.7171673 66 71.61677 0 0.1 0 0 0 1 
i 8.177414 305.3493 1.434335 69 72.11992 0 0.1 0 0 0 1 
i 11.05507 305.3493 1.434335 68 70.10734 0 0.1 0 0 0 1 
i 11.23911 305.3493 1.434335 65 70.40922 0 0.1 0 0 0 1 
i 11.97525 305.3493 0.7171673 78 71.61677 0 0.1 0 0 0 1 
i 12.28198 305.3493 0.7171673 81 72.11992 0 0.1 0 0 0 1 
i 15.15964 305.3493 0.7171673 80 70.10734 0 0.1 0 0 0 1 
i 15.34367 305.3493 0.7171673 77 70.40922 0 0.1 0 0 0 1 
i 16.07982 305.3493 0.7171673 89 71.61677 0 0.1 0 0 0 1 
i 16.38655 305.3493 1.434335 92 72.11992 0 0.1 0 0 0 1 
i 1.061345 305.9751 0.5378755 54 70.11539 0 0.1 0 0 0 1 
i 1.490763 305.9751 0.5378755 60 70.81979 0 0.1 0 0 0 1 
i 5.165911 305.9751 0.5378755 66 70.11539 0 0.1 0 0 0 1 
i 5.595329 305.9751 0.5378755 71 70.81979 0 0.1 0 0 0 1 
i 9.270478 305.9751 0.5378755 77 70.11539 0 0.1 0 0 0 1 
i 9.699895 305.9751 1.075751 83 70.81979 0 0.1 0 0 0 1 
i 13.37504 305.9751 0.5378755 89 70.11539 0 0.1 0 0 0 1 
i 13.80446 305.9751 0.5378755 94 70.81979 0 0.1 0 0 0 1 
i 3.827466 306.0664 0.7171673 54 71.7174 0 0.1 0 0 0 1 
i 4.011502 306.0664 0.7171673 57 72.01929 0 0.1 0 0 0 1 
i 6.88916 306.0664 0.7171673 56 70.00671 0 0.1 0 0 0 1 
i 7.195887 306.0664 0.7171673 53 70.50985 0 0.1 0 0 0 1 
i 7.932032 306.0664 0.7171673 65 71.7174 0 0.1 0 0 0 1 
i 12.0366 306.0664 0.7171673 77 71.7174 0 0.1 0 0 0 1 
i 12.22063 306.0664 0.7171673 80 72.01929 0 0.1 0 0 0 1 
i 15.09829 306.0664 0.7171673 79 70.00671 0 0.1 0 0 0 1 
i 15.40502 306.0664 0.7171673 76 70.50985 0 0.1 0 0 0 1 
i 16.14116 306.0664 0.7171673 88 71.7174 0 0.1 0 0 0 1 
i 1 306.513 0.5378755 55 70.01476 0 0.1 0 0 0 1 
i 1.552109 306.513 0.5378755 60 70.92042 0 0.1 0 0 0 1 
i 5.104566 306.513 0.5378755 67 70.01476 0 0.1 0 0 0 1 
i 5.656675 306.513 0.5378755 72 70.92042 0 0.1 0 0 0 1 
i 9.209132 306.513 0.5378755 78 70.01476 0 0.1 0 0 0 1 
i 13.3137 306.513 0.5378755 90 70.01476 0 0.1 0 0 0 1 
i 13.86581 306.513 0.5378755 95 70.92042 0 0.1 0 0 0 1 
i 2.907285 306.9226 0.7171673 45 70.2073 0 0.1 0 0 0 1 
i 3.029976 306.9226 0.7171673 43 70.40855 0 0.1 0 0 0 1 
i 3.766121 306.9226 0.7171673 56 71.6161 0 0.1 0 0 0 1 
i 4.134193 306.9226 0.7171673 58 72.21987 0 0.1 0 0 0 1 
i 7.011851 306.9226 0.7171673 57 70.2073 0 0.1 0 0 0 1 
i 7.134542 306.9226 0.7171673 54 70.40855 0 0.1 0 0 0 1 
i 7.870687 306.9226 0.7171673 67 71.6161 0 0.1 0 0 0 1 
i 8.238759 306.9226 0.7171673 70 72.21987 0 0.1 0 0 0 1 
i 11.11642 306.9226 0.7171673 68 70.2073 0 0.1 0 0 0 1 
i 11.23911 306.9226 0.7171673 66 70.40855 0 0.1 0 0 0 1 
i 11.97525 306.9226 0.7171673 79 71.6161 0 0.1 0 0 0 1 
i 12.34333 306.9226 0.7171673 81 72.21987 0 0.1 0 0 0 1 
i 15.22098 306.9226 0.7171673 80 70.2073 0 0.1 0 0 0 1 
i 15.34367 306.9226 0.7171673 77 70.40855 0 0.1 0 0 0 1 
i 16.07982 306.9226 0.7171673 90 71.6161 0 0.1 0 0 0 1 
i 16.44789 306.9226 0.7171673 93 72.21987 0 0.1 0 0 0 1 
i 1.122691 307.6271 0.5378755 54 70.21535 0 0.1 0 0 0 1 
i 1.490763 307.6271 0.5378755 60 70.81912 0 0.1 0 0 0 1 
i 5.227257 307.6271 0.5378755 66 70.21535 0 0.1 0 0 0 1 
i 5.595329 307.6271 0.5378755 71 70.81912 0 0.1 0 0 0 1 
i 9.331823 307.6271 0.5378755 77 70.21535 0 0.1 0 0 0 1 
i 9.699895 307.6271 0.5378755 83 70.81912 0 0.1 0 0 0 1 
i 13.43639 307.6271 0.5378755 89 70.21535 0 0.1 0 0 0 1 
i 13.80446 307.6271 0.5378755 94 70.81912 0 0.1 0 0 0 1 
i 2.784594 307.6398 0.7171673 44 70.00604 0 0.1 0 0 0 1 
i 3.152666 307.6398 0.7171673 41 70.60981 0 0.1 0 0 0 1 
i 3.888811 307.6398 0.7171673 54 71.81736 0 0.1 0 0 0 1 
i 4.011502 307.6398 0.7171673 57 72.01862 0 0.1 0 0 0 1 
i 6.88916 307.6398 0.7171673 55 70.00604 0 0.1 0 0 0 1 
i 7.257232 307.6398 0.7171673 53 70.60981 0 0.1 0 0 0 1 
i 7.993377 307.6398 0.7171673 66 71.81736 0 0.1 0 0 0 1 
i 8.116068 307.6398 0.7171673 68 72.01862 0 0.1 0 0 0 1 
i 10.99373 307.6398 0.7171673 67 70.00604 0 0.1 0 0 0 1 
i 11.3618 307.6398 0.7171673 64 70.60981 0 0.1 0 0 0 1 
i 12.09794 307.6398 0.7171673 77 71.81736 0 0.1 0 0 0 1 
i 12.22063 307.6398 0.7171673 80 72.01862 0 0.1 0 0 0 1 
i 15.09829 307.6398 0.7171673 78 70.00604 0 0.1 0 0 0 1 
i 15.46636 307.6398 0.7171673 76 70.60981 0 0.1 0 0 0 1 
i 16.20251 307.6398 0.7171673 89 71.81736 0 0.1 0 0 0 1 
i 16.3252 307.6398 0.7171673 91 72.01862 0 0.1 0 0 0 1 
i 1 308.165 0.5378755 56 70.01409 0 0.1 0 0 0 1 
i 1.613454 308.165 0.5378755 61 71.02038 0 0.1 0 0 0 1 
i 5.104566 308.165 0.5378755 67 70.01409 0 0.1 0 0 0 1 
i 5.71802 308.165 0.5378755 73 71.02038 0 0.1 0 0 0 1 
i 9.209132 308.165 0.5378755 79 70.01409 0 0.1 0 0 0 1 
i 9.822586 308.165 0.5378755 84 71.02038 0 0.1 0 0 0 1 
i 13.3137 308.165 0.5378755 90 70.01409 0 0.1 0 0 0 1 
i 13.92715 308.165 0.5378755 96 71.02038 0 0.1 0 0 0 1 
i 2.845939 308.3854 1.434335 43 70.106 0 0.1 0 0 0 1 
i 2.907285 308.3854 1.434335 44 70.20662 0 0.1 0 0 0 1 
i 3.029976 308.3854 0.7171673 42 70.40788 0 0.1 0 0 0 1 
i 3.214012 308.3854 1.434335 41 70.70977 0 0.1 0 0 0 1 
i 3.766121 308.3854 1.434335 56 71.61543 0 0.1 0 0 0 1 
i 3.950157 308.3854 1.434335 55 71.91732 0 0.1 0 0 0 1 
i 4.072848 308.3854 0.7171673 57 72.11857 0 0.1 0 0 0 1 
i 4.134193 308.3854 1.434335 58 72.2192 0 0.1 0 0 0 1 
i 6.950505 308.3854 1.434335 55 70.106 0 0.1 0 0 0 1 
i 7.011851 308.3854 1.434335 56 70.20662 0 0.1 0 0 0 1 
i 7.134542 308.3854 1.434335 53 70.40788 0 0.1 0 0 0 1 
i 7.318578 308.3854 0.7171673 52 70.70977 0 0.1 0 0 0 1 
i 7.870687 308.3854 1.434335 67 71.61543 0 0.1 0 0 0 1 
i 8.054723 308.3854 0.7171673 66 71.91732 0 0.1 0 0 0 1 
i 8.177414 308.3854 1.434335 68 72.11857 0 0.1 0 0 0 1 
i 8.238759 308.3854 1.434335 70 72.2192 0 0.1 0 0 0 1 
i 11.05507 308.3854 1.434335 66 70.106 0 0.1 0 0 0 1 
i 11.11642 308.3854 1.434335 67 70.20662 0 0.1 0 0 0 1 
i 11.23911 308.3854 0.7171673 65 70.40788 0 0.1 0 0 0 1 
i 11.42314 308.3854 1.434335 64 70.70977 0 0.1 0 0 0 1 
i 11.97525 308.3854 1.434335 79 71.61543 0 0.1 0 0 0 1 
i 12.15929 308.3854 1.434335 78 71.91732 0 0.1 0 0 0 1 
i 12.28198 308.3854 0.7171673 80 72.11857 0 0.1 0 0 0 1 
i 12.34333 308.3854 1.434335 81 72.2192 0 0.1 0 0 0 1 
i 15.15964 308.3854 1.434335 78 70.106 0 0.1 0 0 0 1 
i 15.22098 308.3854 1.434335 79 70.20662 0 0.1 0 0 0 1 
i 15.34367 308.3854 1.434335 76 70.40788 0 0.1 0 0 0 1 
i 15.52771 308.3854 0.7171673 75 70.70977 0 0.1 0 0 0 1 
i 16.07982 308.3854 1.434335 90 71.61543 0 0.1 0 0 0 1 
i 16.26386 308.3854 0.7171673 89 71.91732 0 0.1 0 0 0 1 
i 16.38655 308.3854 1.434335 91 72.11857 0 0.1 0 0 0 1 
i 16.44789 308.3854 0.7171673 93 72.2192 0 0.1 0 0 0 1 
i 2.96863 309.1026 0.7171673 45 70.30725 0 0.1 0 0 0 1 
i 4.195539 309.1026 0.7171673 59 72.31983 0 0.1 0 0 0 1 
i 7.195887 309.1026 0.7171673 54 70.50851 0 0.1 0 0 0 1 
i 8.116068 309.1026 0.7171673 69 72.01795 0 0.1 0 0 0 1 
i 11.17776 309.1026 0.7171673 68 70.30725 0 0.1 0 0 0 1 
i 12.40467 309.1026 0.7171673 82 72.31983 0 0.1 0 0 0 1 
i 15.40502 309.1026 0.7171673 77 70.50851 0 0.1 0 0 0 1 
i 16.3252 309.1026 0.7171673 92 72.01795 0 0.1 0 0 0 1 
i 16.50924 309.1026 0.7171673 93 72.31983 0 0.1 0 0 0 1 
i 1.061345 309.1631 0.5378755 56 70.11405 0 0.1 0 0 0 1 
i 1.122691 309.1631 1.075751 55 70.21468 0 0.1 0 0 0 1 
i 1.490763 309.1631 0.5378755 61 70.81845 0 0.1 0 0 0 1 
i 1.6748 309.1631 0.5378755 62 71.12034 0 0.1 0 0 0 1 
i 5.165911 309.1631 1.075751 67 70.11405 0 0.1 0 0 0 1 
i 5.227257 309.1631 1.075751 66 70.21468 0 0.1 0 0 0 1 
i 5.595329 309.1631 1.075751 72 70.81845 0 0.1 0 0 0 1 
i 5.779366 309.1631 0.5378755 74 71.12034 0 0.1 0 0 0 1 
i 9.270478 309.1631 0.5378755 79 70.11405 0 0.1 0 0 0 1 
i 9.331823 309.1631 1.075751 78 70.21468 0 0.1 0 0 0 1 
i 9.699895 309.1631 1.075751 84 70.81845 0 0.1 0 0 0 1 
i 9.883932 309.1631 0.5378755 85 71.12034 0 0.1 0 0 0 1 
i 13.37504 309.1631 1.075751 90 70.11405 0 0.1 0 0 0 1 
i 13.43639 309.1631 1.075751 89 70.21468 0 0.1 0 0 0 1 
i 13.80446 309.1631 1.075751 95 70.81845 0 0.1 0 0 0 1 
i 13.9885 309.1631 0.5378755 97 71.12034 0 0.1 0 0 0 1 
i 1.184036 309.7009 0.5378755 54 70.3153 0 0.1 0 0 0 1 
i 1.552109 309.7009 0.5378755 60 70.91908 0 0.1 0 0 0 1 
i 1.613454 309.7009 0.5378755 61 71.01971 0 0.1 0 0 0 1 
i 5.71802 309.7009 0.5378755 73 71.01971 0 0.1 0 0 0 1 
i 9.393168 309.7009 0.5378755 77 70.3153 0 0.1 0 0 0 1 
i 9.761241 309.7009 0.5378755 83 70.91908 0 0.1 0 0 0 1 
i 13.92715 309.7009 1.437764 96 71.01971 0 0.1 0 0 0 1 
i 3.275357 310.4215 0.7171673 43 70.80973 0 0.1 0 0 0 1 
i 3.766121 310.4215 0.7171673 52 71.61476 0 0.1 0 0 0 1 
i 7.379923 310.4215 0.7171673 54 70.80973 0 0.1 0 0 0 1 
i 7.870687 310.4215 0.7171673 64 71.61476 0 0.1 0 0 0 1 
i 11.48449 310.4215 0.7171673 66 70.80973 0 0.1 0 0 0 1 
i 11.97525 310.4215 0.7171673 75 71.61476 0 0.1 0 0 0 1 
i 15.58906 310.4215 0.7171673 77 70.80973 0 0.1 0 0 0 1 
i 16.07982 310.4215 0.7171673 87 71.61476 0 0.1 0 0 0 1 
i 1.245382 310.9312 0.5378755 55 70.41526 0 0.1 0 0 0 1 
i 1.490763 310.9312 0.5378755 60 70.81778 0 0.1 0 0 0 1 
i 5.349948 310.9312 0.5378755 67 70.41526 0 0.1 0 0 0 1 
i 5.595329 310.9312 0.5378755 71 70.81778 0 0.1 0 0 0 1 
i 9.454514 310.9312 0.5378755 78 70.41526 0 0.1 0 0 0 1 
i 9.699895 310.9312 0.5378755 83 70.81778 0 0.1 0 0 0 1 
i 13.55908 310.9312 0.5378755 90 70.41526 0 0.1 0 0 0 1 
i 13.80446 310.9312 0.5378755 94 70.81778 0 0.1 0 0 0 1 
i 2.784594 311.1387 0.7171673 47 70.0047 0 0.1 0 0 0 1 
i 4.256884 311.1387 0.7171673 57 72.41979 0 0.1 0 0 0 1 
i 6.88916 311.1387 0.7171673 59 70.0047 0 0.1 0 0 0 1 
i 8.36145 311.1387 0.7171673 68 72.41979 0 0.1 0 0 0 1 
i 10.99373 311.1387 0.7171673 70 70.0047 0 0.1 0 0 0 1 
i 12.46602 311.1387 0.7171673 80 72.41979 0 0.1 0 0 0 1 
i 15.09829 311.1387 0.7171673 82 70.0047 0 0.1 0 0 0 1 
i 16.57058 311.1387 0.7171673 91 72.41979 0 0.1 0 0 0 1 
i 1 311.4691 0.5378755 58 70.01275 0 0.1 0 0 0 1 
i 1.736145 311.4691 0.5378755 62 71.22029 0 0.1 0 0 0 1 
i 5.104566 311.4691 0.5378755 69 70.01275 0 0.1 0 0 0 1 
i 5.840711 311.4691 0.5378755 73 71.22029 0 0.1 0 0 0 1 
i 9.209132 311.4691 0.5378755 81 70.01275 0 0.1 0 0 0 1 
i 9.945277 311.4691 0.5378755 85 71.22029 0 0.1 0 0 0 1 
i 13.3137 311.4691 0.5378755 92 70.01275 0 0.1 0 0 0 1 
i 14.04984 311.4691 0.5378755 96 71.22029 0 0.1 0 0 0 1 
i 2.845939 311.9574 1.434335 48 70.10465 0 0.1 0 0 0 1 
i 3.275357 311.9574 1.434335 42 70.80906 0 0.1 0 0 0 1 
i 3.766121 311.9574 0.7171673 52 71.61409 0 0.1 0 0 0 1 
i 4.318229 311.9574 0.7171673 58 72.51975 0 0.1 0 0 0 1 
i 6.950505 311.9574 0.7171673 60 70.10465 0 0.1 0 0 0 1 
i 7.379923 311.9574 0.7171673 54 70.80906 0 0.1 0 0 0 1 
i 7.870687 311.9574 1.434335 63 71.61409 0 0.1 0 0 0 1 
i 8.422795 311.9574 1.434335 69 72.51975 0 0.1 0 0 0 1 
i 11.05507 311.9574 1.434335 71 70.10465 0 0.1 0 0 0 1 
i 11.48449 311.9574 0.7171673 65 70.80906 0 0.1 0 0 0 1 
i 11.97525 311.9574 0.7171673 75 71.61409 0 0.1 0 0 0 1 
i 12.52736 311.9574 0.7171673 81 72.51975 0 0.1 0 0 0 1 
i 15.15964 311.9574 0.7171673 83 70.10465 0 0.1 0 0 0 1 
i 15.58906 311.9574 0.7171673 77 70.80906 0 0.1 0 0 0 1 
i 16.07982 311.9574 1.434335 86 71.61409 0 0.1 0 0 0 1 
i 16.63193 311.9574 1.434335 92 72.51975 0 0.1 0 0 0 1 
i 1.061345 312.4671 1.075751 58 70.1127 0 0.1 0 0 0 1 
i 1.245382 312.4671 0.5378755 56 70.41459 0 0.1 0 0 0 1 
i 1.490763 312.4671 0.5378755 60 70.81711 0 0.1 0 0 0 1 
i 1.79749 312.4671 0.5378755 63 71.32025 0 0.1 0 0 0 1 
i 5.165911 312.4671 0.5378755 70 70.1127 0 0.1 0 0 0 1 
i 5.349948 312.4671 1.075751 67 70.41459 0 0.1 0 0 0 1 
i 5.595329 312.4671 1.075751 71 70.81711 0 0.1 0 0 0 1 
i 5.902056 312.4671 1.075751 74 71.32025 0 0.1 0 0 0 1 
i 9.270478 312.4671 1.075751 81 70.1127 0 0.1 0 0 0 1 
i 9.454514 312.4671 0.5378755 79 70.41459 0 0.1 0 0 0 1 
i 9.699895 312.4671 0.5378755 83 70.81711 0 0.1 0 0 0 1 
i 10.00662 312.4671 0.5378755 86 71.32025 0 0.1 0 0 0 1 
i 13.37504 312.4671 0.5378755 93 70.1127 0 0.1 0 0 0 1 
i 13.55908 312.4671 1.075751 90 70.41459 0 0.1 0 0 0 1 
i 13.80446 312.4671 1.075751 94 70.81711 0 0.1 0 0 0 1 
i 14.11119 312.4671 1.075751 97 71.32025 0 0.1 0 0 0 1 
i 3.827466 312.6746 0.7171673 51 71.71472 0 0.1 0 0 0 1 
i 4.256884 312.6746 0.7171673 57 72.41912 0 0.1 0 0 0 1 
i 6.88916 312.6746 0.7171673 59 70.00403 0 0.1 0 0 0 1 
i 7.441269 312.6746 0.7171673 53 70.90969 0 0.1 0 0 0 1 
i 11.54583 312.6746 0.7171673 65 70.90969 0 0.1 0 0 0 1 
i 12.0366 312.6746 0.7171673 74 71.71472 0 0.1 0 0 0 1 
i 12.46602 312.6746 0.7171673 80 72.41912 0 0.1 0 0 0 1 
i 15.09829 312.6746 0.7171673 82 70.00403 0 0.1 0 0 0 1 
i 15.6504 312.6746 0.7171673 76 70.90969 0 0.1 0 0 0 1 
i 1.306727 313.005 0.5378755 55 70.51522 0 0.1 0 0 0 1 
i 1.552109 313.005 0.5378755 59 70.91774 0 0.1 0 0 0 1 
i 1.736145 313.005 0.5378755 62 71.21962 0 0.1 0 0 0 1 
i 5.104566 313.005 0.5378755 69 70.01208 0 0.1 0 0 0 1 
i 9.515859 313.005 0.5378755 78 70.51522 0 0.1 0 0 0 1 
i 9.761241 313.005 0.5378755 82 70.91774 0 0.1 0 0 0 1 
i 9.945277 313.005 0.5378755 85 71.21962 0 0.1 0 0 0 1 
i 13.3137 313.005 0.5378755 92 70.01208 0 0.1 0 0 0 1 
i 2.907285 313.5308 0.9687823 49 70.20461 0 0.1 0 0 0 1 
i 3.275357 313.5308 0.7171673 43 70.80839 0 0.1 0 0 0 1 
i 3.766121 313.5308 0.7171673 52 71.61342 0 0.1 0 0 0 1 
i 4.379575 313.5308 0.7171673 58 72.61971 0 0.1 0 0 0 1 
i 7.011851 313.5308 0.7171673 60 70.20461 0 0.1 0 0 0 1 
i 7.379923 313.5308 0.7171673 54 70.80839 0 0.1 0 0 0 1 
i 7.870687 313.5308 0.7171673 64 71.61342 0 0.1 0 0 0 1 
i 8.484141 313.5308 0.7171673 70 72.61971 0 0.1 0 0 0 1 
i 11.11642 313.5308 0.9687823 72 70.20461 0 0.1 0 0 0 1 
i 11.48449 313.5308 0.7171673 66 70.80839 0 0.1 0 0 0 1 
i 11.97525 313.5308 0.7171673 75 71.61342 0 0.1 0 0 0 1 
i 12.58871 313.5308 0.7171673 81 72.61971 0 0.1 0 0 0 1 
i 15.22098 313.5308 0.7171673 83 70.20461 0 0.1 0 0 0 1 
i 15.58906 313.5308 0.7171673 77 70.80839 0 0.1 0 0 0 1 
i 16.07982 313.5308 0.7171673 87 71.61342 0 0.1 0 0 0 1 
i 16.69327 313.5308 0.7171673 93 72.61971 0 0.1 0 0 0 1 
i 6.88916 313.9617 0.5378755 61 70.0208 0 0.1 0 0 0 1 
i 15.09829 313.9617 0.5378755 84 70.0208 0 0.1 0 0 0 1 
i 1.122691 314.0405 0.5378755 59 70.21266 0 0.1 0 0 0 1 
i 1.245382 314.0405 0.5378755 57 70.41392 0 0.1 0 0 0 1 
i 1.490763 314.0405 0.5378755 61 70.81644 0 0.1 0 0 0 1 
i 1.858836 314.0405 0.5378755 63 71.42021 0 0.1 0 0 0 1 
i 5.227257 314.0405 0.5378755 70 70.21266 0 0.1 0 0 0 1 
i 5.349948 314.0405 0.5378755 68 70.41392 0 0.1 0 0 0 1 
i 5.595329 314.0405 0.5378755 72 70.81644 0 0.1 0 0 0 1 
i 5.963402 314.0405 0.5378755 75 71.42021 0 0.1 0 0 0 1 
i 9.331823 314.0405 0.5378755 82 70.21266 0 0.1 0 0 0 1 
i 9.454514 314.0405 0.5378755 80 70.41392 0 0.1 0 0 0 1 
i 9.699895 314.0405 0.5378755 84 70.81644 0 0.1 0 0 0 1 
i 10.06797 314.0405 0.5378755 86 71.42021 0 0.1 0 0 0 1 
i 13.43639 314.0405 0.5378755 93 70.21266 0 0.1 0 0 0 1 
i 13.55908 314.0405 0.5378755 91 70.41392 0 0.1 0 0 0 1 
i 13.80446 314.0405 0.5378755 95 70.81644 0 0.1 0 0 0 1 
i 14.17253 314.0405 0.5378755 98 71.42021 0 0.1 0 0 0 1 
i 2.784594 314.248 0.7171673 47 70.00335 0 0.1 0 0 0 1 
i 3.398048 314.248 0.7171673 41 71.00964 0 0.1 0 0 0 1 
i 3.888811 314.248 0.7171673 51 71.81468 0 0.1 0 0 0 1 
i 4.256884 314.248 0.7171673 57 72.41845 0 0.1 0 0 0 1 
i 6.88916 314.248 0.7171673 59 70.00335 0 0.1 0 0 0 1 
i 7.502614 314.248 0.7171673 53 71.00964 0 0.1 0 0 0 1 
i 7.993377 314.248 0.7171673 62 71.81468 0 0.1 0 0 0 1 
i 8.36145 314.248 0.7171673 68 72.41845 0 0.1 0 0 0 1 
i 10.99373 314.248 0.7171673 70 70.00335 0 0.1 0 0 0 1 
i 11.60718 314.248 0.7171673 64 71.00964 0 0.1 0 0 0 1 
i 12.09794 314.248 0.7171673 74 71.81468 0 0.1 0 0 0 1 
i 12.46602 314.248 0.7171673 80 72.41845 0 0.1 0 0 0 1 
i 15.09829 314.248 0.7171673 82 70.00335 0 0.1 0 0 0 1 
i 15.71175 314.248 0.7171673 76 71.00964 0 0.1 0 0 0 1 
i 16.20251 314.248 0.7171673 85 71.81468 0 0.1 0 0 0 1 
i 16.57058 314.248 0.7171673 91 72.41845 0 0.1 0 0 0 1 
i 1 314.5784 0.5378755 58 70.0114 0 0.1 0 0 0 1 
i 1.368072 314.5784 0.5378755 55 70.61518 0 0.1 0 0 0 1 
i 1.613454 314.5784 0.5378755 60 71.01769 0 0.1 0 0 0 1 
i 1.736145 314.5784 0.5378755 62 71.21895 0 0.1 0 0 0 1 
i 5.104566 314.5784 0.5378755 69 70.0114 0 0.1 0 0 0 1 
i 5.472639 314.5784 0.5378755 67 70.61518 0 0.1 0 0 0 1 
i 5.71802 314.5784 0.5378755 71 71.01769 0 0.1 0 0 0 1 
i 5.840711 314.5784 0.5378755 73 71.21895 0 0.1 0 0 0 1 
i 9.209132 314.5784 0.5378755 81 70.0114 0 0.1 0 0 0 1 
i 9.577205 314.5784 0.5378755 78 70.61518 0 0.1 0 0 0 1 
i 9.822586 314.5784 0.5378755 83 71.01769 0 0.1 0 0 0 1 
i 9.945277 314.5784 0.5378755 85 71.21895 0 0.1 0 0 0 1 
i 13.3137 314.5784 0.5378755 92 70.0114 0 0.1 0 0 0 1 
i 13.68177 314.5784 0.5378755 90 70.61518 0 0.1 0 0 0 1 
i 13.92715 314.5784 0.5378755 94 71.01769 0 0.1 0 0 0 1 
i 14.04984 314.5784 0.5378755 96 71.21895 0 0.1 0 0 0 1 
i 2.845939 314.9936 0.7171673 47 70.10331 0 0.1 0 0 0 1 
i 2.907285 314.9936 1.434335 49 70.20394 0 0.1 0 0 0 1 
i 3.275357 314.9936 0.7171673 42 70.80771 0 0.1 0 0 0 1 
i 3.459394 314.9936 1.434335 41 71.1096 0 0.1 0 0 0 1 
i 3.766121 314.9936 1.434335 51 71.61275 0 0.1 0 0 0 1 
i 3.950157 314.9936 0.7171673 50 71.91463 0 0.1 0 0 0 1 
i 4.318229 314.9936 0.7171673 57 72.51841 0 0.1 0 0 0 1 
i 4.379575 314.9936 1.434335 58 72.61904 0 0.1 0 0 0 1 
i 6.950505 314.9936 0.7171673 59 70.10331 0 0.1 0 0 0 1 
i 7.011851 314.9936 1.434335 60 70.20394 0 0.1 0 0 0 1 
i 7.379923 314.9936 0.7171673 53 70.80771 0 0.1 0 0 0 1 
i 7.56396 314.9936 0.7171673 52 71.1096 0 0.1 0 0 0 1 
i 7.870687 314.9936 1.434335 63 71.61275 0 0.1 0 0 0 1 
i 8.054723 314.9936 1.434335 62 71.91463 0 0.1 0 0 0 1 
i 8.422795 314.9936 0.7171673 68 72.51841 0 0.1 0 0 0 1 
i 8.484141 314.9936 0.7171673 70 72.61904 0 0.1 0 0 0 1 
i 11.05507 314.9936 0.7171673 70 70.10331 0 0.1 0 0 0 1 
i 11.11642 314.9936 1.434335 72 70.20394 0 0.1 0 0 0 1 
i 11.48449 314.9936 0.7171673 65 70.80771 0 0.1 0 0 0 1 
i 11.66853 314.9936 1.434335 64 71.1096 0 0.1 0 0 0 1 
i 11.97525 314.9936 1.434335 74 71.61275 0 0.1 0 0 0 1 
i 12.15929 314.9936 0.7171673 73 71.91463 0 0.1 0 0 0 1 
i 12.52736 314.9936 0.7171673 80 72.51841 0 0.1 0 0 0 1 
i 12.58871 314.9936 0.7171673 81 72.61904 0 0.1 0 0 0 1 
i 15.15964 314.9936 0.7171673 82 70.10331 0 0.1 0 0 0 1 
i 15.22098 314.9936 1.434335 83 70.20394 0 0.1 0 0 0 1 
i 15.58906 314.9936 1.434335 76 70.80771 0 0.1 0 0 0 1 
i 15.77309 314.9936 0.7171673 75 71.1096 0 0.1 0 0 0 1 
i 16.07982 314.9936 1.434335 86 71.61275 0 0.1 0 0 0 1 
i 16.26386 314.9936 1.434335 85 71.91463 0 0.1 0 0 0 1 
i 16.63193 314.9936 0.7171673 91 72.51841 0 0.1 0 0 0 1 
i 16.69327 314.9936 1.434335 93 72.61904 0 0.1 0 0 0 1 
i 2.845939 315.1172 0.5378755 44 70.12075 0 0.1 0 0 0 1 
i 6.950505 315.1172 1.075751 56 70.12075 0 0.1 0 0 0 1 
i 11.05507 315.1172 0.5378755 67 70.12075 0 0.1 0 0 0 1 
i 15.15964 315.1172 1.075751 79 70.12075 0 0.1 0 0 0 1 
i 1.061345 315.5033 1.075751 58 70.11136 0 0.1 0 0 0 1 
i 1.122691 315.5033 1.075751 59 70.21199 0 0.1 0 0 0 1 
i 1.245382 315.5033 1.075751 57 70.41325 0 0.1 0 0 0 1 
i 1.429418 315.5033 1.075751 56 70.71514 0 0.1 0 0 0 1 
i 1.490763 315.5033 0.5378755 61 70.81577 0 0.1 0 0 0 1 
i 1.6748 315.5033 1.075751 60 71.11765 0 0.1 0 0 0 1 
i 1.79749 315.5033 1.075751 62 71.31891 0 0.1 0 0 0 1 
i 1.858836 315.5033 0.5378755 63 71.41954 0 0.1 0 0 0 1 
i 5.165911 315.5033 1.075751 69 70.11136 0 0.1 0 0 0 1 
i 5.227257 315.5033 1.075751 70 70.21199 0 0.1 0 0 0 1 
i 5.349948 315.5033 1.075751 68 70.41325 0 0.1 0 0 0 1 
i 5.533984 315.5033 0.5378755 67 70.71514 0 0.1 0 0 0 1 
i 5.595329 315.5033 1.075751 72 70.81577 0 0.1 0 0 0 1 
i 5.779366 315.5033 0.5378755 71 71.11765 0 0.1 0 0 0 1 
i 5.902056 315.5033 1.075751 73 71.31891 0 0.1 0 0 0 1 
i 5.963402 315.5033 1.075751 75 71.41954 0 0.1 0 0 0 1 
i 9.270478 315.5033 1.075751 81 70.11136 0 0.1 0 0 0 1 
i 9.331823 315.5033 1.075751 82 70.21199 0 0.1 0 0 0 1 
i 9.454514 315.5033 0.5378755 80 70.41325 0 0.1 0 0 0 1 
i 9.63855 315.5033 1.075751 79 70.71514 0 0.1 0 0 0 1 
i 9.699895 315.5033 1.075751 84 70.81577 0 0.1 0 0 0 1 
i 9.883932 315.5033 1.075751 83 71.11765 0 0.1 0 0 0 1 
i 10.00662 315.5033 1.075751 85 71.31891 0 0.1 0 0 0 1 
i 10.06797 315.5033 0.5378755 86 71.41954 0 0.1 0 0 0 1 
i 13.37504 315.5033 0.5378755 92 70.11136 0 0.1 0 0 0 1 
i 13.43639 315.5033 1.075751 93 70.21199 0 0.1 0 0 0 1 
i 13.55908 315.5033 1.075751 91 70.41325 0 0.1 0 0 0 1 
i 13.74312 315.5033 0.5378755 90 70.71514 0 0.1 0 0 0 1 
i 13.80446 315.5033 1.075751 95 70.81577 0 0.1 0 0 0 1 
i 13.9885 315.5033 0.5378755 94 71.11765 0 0.1 0 0 0 1 
i 14.11119 315.5033 1.075751 96 71.31891 0 0.1 0 0 0 1 
i 14.17253 315.5033 1.075751 98 71.41954 0 0.1 0 0 0 1 
i 2.784594 315.6551 0.5378755 45 70.02013 0 0.1 0 0 0 1 
i 10.99373 315.6551 0.5378755 68 70.02013 0 0.1 0 0 0 1 
i 2.784594 315.7108 0.7171673 48 70.00268 0 0.1 0 0 0 1 
i 3.336703 315.7108 0.7171673 43 70.90834 0 0.1 0 0 0 1 
i 3.827466 315.7108 0.7171673 52 71.71338 0 0.1 0 0 0 1 
i 4.44092 315.7108 0.7171673 59 72.71966 0 0.1 0 0 0 1 
i 7.073196 315.7108 0.7171673 61 70.30457 0 0.1 0 0 0 1 
i 7.441269 315.7108 0.7171673 54 70.90834 0 0.1 0 0 0 1 
i 7.502614 315.7108 0.7171673 53 71.00897 0 0.1 0 0 0 1 
i 8.36145 315.7108 0.7171673 69 72.41778 0 0.1 0 0 0 1 
i 8.545486 315.7108 0.7171673 70 72.71966 0 0.1 0 0 0 1 
i 10.99373 315.7108 0.7171673 71 70.00268 0 0.1 0 0 0 1 
i 11.54583 315.7108 0.7171673 66 70.90834 0 0.1 0 0 0 1 
i 12.0366 315.7108 0.7171673 75 71.71338 0 0.1 0 0 0 1 
i 12.46602 315.7108 0.7171673 80 72.41778 0 0.1 0 0 0 1 
i 12.65005 315.7108 0.7171673 82 72.71966 0 0.1 0 0 0 1 
i 15.28233 315.7108 0.7171673 84 70.30457 0 0.1 0 0 0 1 
i 15.6504 315.7108 0.7171673 77 70.90834 0 0.1 0 0 0 1 
i 16.57058 315.7108 0.7171673 92 72.41778 0 0.1 0 0 0 1 
i 1.552109 316.0412 0.5378755 61 70.91639 0 0.1 0 0 0 1 
i 1.920181 316.0412 0.5378755 64 71.52017 0 0.1 0 0 0 1 
i 5.288602 316.0412 0.5378755 71 70.31262 0 0.1 0 0 0 1 
i 5.840711 316.0412 0.5378755 74 71.21828 0 0.1 0 0 0 1 
i 9.515859 316.0412 0.5378755 80 70.51388 0 0.1 0 0 0 1 
i 10.12931 316.0412 0.5378755 87 71.52017 0 0.1 0 0 0 1 
i 13.49773 316.0412 0.5378755 94 70.31262 0 0.1 0 0 0 1 
i 13.62043 316.0412 0.5378755 92 70.51388 0 0.1 0 0 0 1 
i 14.04984 316.0412 1.353566 97 71.21828 0 0.1 0 0 0 1 
i 3.029976 316.6776 0.7171673 49 70.40453 0 0.1 0 0 0 1 
i 3.275357 316.6776 0.7171673 44 70.80704 0 0.1 0 0 0 1 
i 3.766121 316.6776 0.7171673 53 71.61208 0 0.1 0 0 0 1 
i 4.502266 316.6776 0.7171673 58 72.81962 0 0.1 0 0 0 1 
i 7.134542 316.6776 0.7171673 60 70.40453 0 0.1 0 0 0 1 
i 7.379923 316.6776 0.7171673 55 70.80704 0 0.1 0 0 0 1 
i 7.870687 316.6776 0.7171673 65 71.61208 0 0.1 0 0 0 1 
i 8.606832 316.6776 0.7171673 70 72.81962 0 0.1 0 0 0 1 
i 11.23911 316.6776 0.7171673 72 70.40453 0 0.1 0 0 0 1 
i 11.48449 316.6776 0.7171673 67 70.80704 0 0.1 0 0 0 1 
i 11.97525 316.6776 0.7171673 76 71.61208 0 0.1 0 0 0 1 
i 12.7114 316.6776 0.7171673 81 72.81962 0 0.1 0 0 0 1 
i 15.34367 316.6776 0.7171673 83 70.40453 0 0.1 0 0 0 1 
i 15.58906 316.6776 0.7171673 78 70.80704 0 0.1 0 0 0 1 
i 16.07982 316.6776 0.7171673 88 71.61208 0 0.1 0 0 0 1 
i 16.81596 316.6776 0.7171673 93 72.81962 0 0.1 0 0 0 1 
i 2.907285 316.8518 0.5378755 46 70.22071 0 0.1 0 0 0 1 
i 7.011851 316.8518 1.260063 58 70.22071 0 0.1 0 0 0 1 
i 11.11642 316.8518 0.5378755 69 70.22071 0 0.1 0 0 0 1 
i 15.22098 316.8518 1.260063 81 70.22071 0 0.1 0 0 0 1 
i 2.784594 317.3897 0.5378755 47 70.01945 0 0.1 0 0 0 1 
i 10.99373 317.3897 0.5378755 70 70.01945 0 0.1 0 0 0 1 
i 2.784594 317.3947 0.7171673 46 70.00201 0 0.1 0 0 0 1 
i 3.520739 317.3947 0.7171673 41 71.20956 0 0.1 0 0 0 1 
i 4.011502 317.3947 0.7171673 51 72.01459 0 0.1 0 0 0 1 
i 4.256884 317.3947 0.7171673 55 72.41711 0 0.1 0 0 0 1 
i 7.625305 317.3947 0.7171673 53 71.20956 0 0.1 0 0 0 1 
i 8.116068 317.3947 0.7171673 62 72.01459 0 0.1 0 0 0 1 
i 8.36145 317.3947 0.7171673 67 72.41711 0 0.1 0 0 0 1 
i 10.99373 317.3947 0.7171673 69 70.00201 0 0.1 0 0 0 1 
i 11.72987 317.3947 0.7171673 64 71.20956 0 0.1 0 0 0 1 
i 12.22063 317.3947 0.7171673 74 72.01459 0 0.1 0 0 0 1 
i 12.46602 317.3947 0.7171673 78 72.41711 0 0.1 0 0 0 1 
i 15.83444 317.3947 0.7171673 76 71.20956 0 0.1 0 0 0 1 
i 16.3252 317.3947 0.7171673 85 72.01459 0 0.1 0 0 0 1 
i 16.57058 317.3947 2.179941 90 72.41711 0 0.1 0 0 0 1 
i 2.845939 318.1403 1.434335 45 70.10197 0 0.1 0 0 0 1 
i 3.029976 318.1403 1.434335 49 70.40386 0 0.1 0 0 0 1 
i 3.275357 318.1403 0.7171673 44 70.80637 0 0.1 0 0 0 1 
i 3.582084 318.1403 1.434335 41 71.30952 0 0.1 0 0 0 1 
i 3.766121 318.1403 0.7171673 53 71.6114 0 0.1 0 0 0 1 
i 4.072848 318.1403 0.7171673 50 72.11455 0 0.1 0 0 0 1 
i 4.318229 318.1403 1.434335 55 72.51706 0 0.1 0 0 0 1 
i 4.502266 318.1403 0.7171673 58 72.81895 0 0.1 0 0 0 1 
i 6.950505 318.1403 0.7171673 57 70.10197 0 0.1 0 0 0 1 
i 7.134542 318.1403 0.7171673 60 70.40386 0 0.1 0 0 0 1 
i 7.379923 318.1403 0.7171673 55 70.80637 0 0.1 0 0 0 1 
i 7.68665 318.1403 0.7171673 52 71.30952 0 0.1 0 0 0 1 
i 7.870687 318.1403 1.434335 65 71.6114 0 0.1 0 0 0 1 
i 8.177414 318.1403 1.434335 62 72.11455 0 0.1 0 0 0 1 
i 8.422795 318.1403 0.7171673 66 72.51706 0 0.1 0 0 0 1 
i 8.606832 318.1403 1.434335 70 72.81895 0 0.1 0 0 0 1 
i 11.05507 318.1403 0.7171673 68 70.10197 0 0.1 0 0 0 1 
i 11.23911 318.1403 1.434335 72 70.40386 0 0.1 0 0 0 1 
i 11.48449 318.1403 0.7171673 67 70.80637 0 0.1 0 0 0 1 
i 11.79122 318.1403 1.434335 64 71.30952 0 0.1 0 0 0 1 
i 11.97525 318.1403 0.7171673 76 71.6114 0 0.1 0 0 0 1 
i 12.28198 318.1403 0.7171673 73 72.11455 0 0.1 0 0 0 1 
i 12.52736 318.1403 0.7171673 78 72.51706 0 0.1 0 0 0 1 
i 12.7114 318.1403 0.7171673 81 72.81895 0 0.1 0 0 0 1 
i 15.15964 318.1403 0.7171673 80 70.10197 0 0.1 0 0 0 1 
i 15.34367 318.1403 0.7171673 83 70.40386 0 0.1 0 0 0 1 
i 15.58906 318.1403 0.7171673 78 70.80637 0 0.1 0 0 0 1 
i 15.89578 318.1403 0.7171673 75 71.30952 0 0.1 0 0 0 1 
i 16.07982 318.1403 1.434335 88 71.6114 0 0.1 0 0 0 1 
i 16.38655 318.1403 1.434335 85 72.11455 0 0.1 0 0 0 1 
i 16.63193 318.1403 0.7171673 89 72.51706 0 0.1 0 0 0 1 
i 16.81596 318.1403 1.434335 93 72.81895 0 0.1 0 0 0 1 
i 1.981527 318.2395 0.5378755 59 71.62013 0 0.1 0 0 0 1 
i 6.086093 318.2395 0.5378755 71 71.62013 0 0.1 0 0 0 1 
i 10.19066 318.2395 0.5378755 82 71.62013 0 0.1 0 0 0 1 
i 14.29522 318.2395 0.5378755 94 71.62013 0 0.1 0 0 0 1 
i 2.845939 318.4645 0.5378755 53 70.11941 0 0.1 0 0 0 1 
i 2.907285 318.4645 0.5378755 55 70.22004 0 0.1 0 0 0 1 
i 6.950505 318.4645 0.5378755 65 70.11941 0 0.1 0 0 0 1 
i 7.011851 318.4645 1.075751 66 70.22004 0 0.1 0 0 0 1 
i 11.05507 318.4645 0.5378755 76 70.11941 0 0.1 0 0 0 1 
i 11.11642 318.4645 0.5378755 78 70.22004 0 0.1 0 0 0 1 
i 15.15964 318.4645 0.5378755 88 70.11941 0 0.1 0 0 0 1 
i 15.22098 318.4645 1.075751 89 70.22004 0 0.1 0 0 0 1 
i 1 318.7774 0.5378755 52 70.01006 0 0.1 0 0 0 1 
i 5.104566 318.7774 0.5378755 63 70.01006 0 0.1 0 0 0 1 
i 9.209132 318.7774 0.5378755 75 70.01006 0 0.1 0 0 0 1 
i 13.3137 318.7774 0.5378755 86 70.01006 0 0.1 0 0 0 1 
i 2.784594 318.8575 0.7171673 46 70.00134 0 0.1 0 0 0 1 
i 3.827466 318.8575 0.7171673 54 71.71203 0 0.1 0 0 0 1 
i 4.011502 318.8575 0.7171673 51 72.01392 0 0.1 0 0 0 1 
i 4.563611 318.8575 0.7171673 59 72.91958 0 0.1 0 0 0 1 
i 6.88916 318.8575 0.7171673 58 70.00134 0 0.1 0 0 0 1 
i 7.195887 318.8575 0.7171673 61 70.50449 0 0.1 0 0 0 1 
i 7.441269 318.8575 0.7171673 56 70.907 0 0.1 0 0 0 1 
i 7.625305 318.8575 0.7171673 53 71.20889 0 0.1 0 0 0 1 
i 8.36145 318.8575 0.7171673 67 72.41644 0 0.1 0 0 0 1 
i 10.99373 318.8575 0.7171673 69 70.00134 0 0.1 0 0 0 1 
i 11.54583 318.8575 0.7171673 68 70.907 0 0.1 0 0 0 1 
i 12.0366 318.8575 0.7171673 77 71.71203 0 0.1 0 0 0 1 
i 12.22063 318.8575 0.7171673 74 72.01392 0 0.1 0 0 0 1 
i 12.46602 318.8575 0.7171673 78 72.41644 0 0.1 0 0 0 1 
i 12.77274 318.8575 0.7171673 82 72.91958 0 0.1 0 0 0 1 
i 15.09829 318.8575 0.7171673 81 70.00134 0 0.1 0 0 0 1 
i 15.40502 318.8575 0.7171673 84 70.50449 0 0.1 0 0 0 1 
i 15.6504 318.8575 0.7171673 79 70.907 0 0.1 0 0 0 1 
i 15.83444 318.8575 0.7171673 76 71.20889 0 0.1 0 0 0 1 
i 2.784594 319.0024 0.5378755 54 70.01878 0 0.1 0 0 0 1 
i 2.96863 319.0024 0.5378755 56 70.32067 0 0.1 0 0 0 1 
i 7.073196 319.0024 0.5378755 67 70.32067 0 0.1 0 0 0 1 
i 10.99373 319.0024 0.5378755 77 70.01878 0 0.1 0 0 0 1 
i 11.17776 319.0024 0.5378755 79 70.32067 0 0.1 0 0 0 1 
i 15.28233 319.0024 3.463823 90 70.32067 0 0.1 0 0 0 1 
i 2.907285 319.6388 2.827453 45 70.20193 0 0.1 0 0 0 1 
i 3.029976 319.6388 0.7171673 48 70.40319 0 0.1 0 0 0 1 
i 3.275357 319.6388 0.7171673 43 70.8057 0 0.1 0 0 0 1 
i 3.64343 319.6388 0.7171673 41 71.40948 0 0.1 0 0 0 1 
i 3.766121 319.6388 0.7171673 53 71.61073 0 0.1 0 0 0 1 
i 4.134193 319.6388 0.7171673 50 72.21451 0 0.1 0 0 0 1 
i 4.379575 319.6388 0.7171673 55 72.61702 0 0.1 0 0 0 1 
i 4.502266 319.6388 0.7171673 57 72.81828 0 0.1 0 0 0 1 
i 7.011851 319.6388 0.7171673 57 70.20193 0 0.1 0 0 0 1 
i 7.134542 319.6388 0.7171673 59 70.40319 0 0.1 0 0 0 1 
i 7.379923 319.6388 0.7171673 55 70.8057 0 0.1 0 0 0 1 
i 7.747996 319.6388 0.7171673 52 71.40948 0 0.1 0 0 0 1 
i 7.870687 319.6388 0.7171673 64 71.61073 0 0.1 0 0 0 1 
i 8.238759 319.6388 0.7171673 62 72.21451 0 0.1 0 0 0 1 
i 8.484141 319.6388 0.7171673 66 72.61702 0 0.1 0 0 0 1 
i 8.606832 319.6388 0.7171673 69 72.81828 0 0.1 0 0 0 1 
i 11.11642 319.6388 0.7171673 68 70.20193 0 0.1 0 0 0 1 
i 11.23911 319.6388 0.7171673 71 70.40319 0 0.1 0 0 0 1 
i 11.48449 319.6388 0.7171673 66 70.8057 0 0.1 0 0 0 1 
i 11.85256 319.6388 0.7171673 64 71.40948 0 0.1 0 0 0 1 
i 11.97525 319.6388 0.7171673 76 71.61073 0 0.1 0 0 0 1 
i 12.34333 319.6388 0.7171673 73 72.21451 0 0.1 0 0 0 1 
i 12.58871 319.6388 0.7171673 78 72.61702 0 0.1 0 0 0 1 
i 12.7114 319.6388 0.7171673 80 72.81828 0 0.1 0 0 0 1 
i 15.22098 319.6388 0.7171673 80 70.20193 0 0.1 0 0 0 1 
i 15.34367 319.6388 0.7171673 82 70.40319 0 0.1 0 0 0 1 
i 15.58906 319.6388 0.7171673 78 70.8057 0 0.1 0 0 0 1 
i 15.95713 319.6388 0.7171673 75 71.40948 0 0.1 0 0 0 1 
i 16.07982 319.6388 0.7171673 87 71.61073 0 0.1 0 0 0 1 
i 16.44789 319.6388 0.7171673 85 72.21451 0 0.1 0 0 0 1 
i 16.69327 319.6388 0.7171673 89 72.61702 0 0.1 0 0 0 1 
i 16.81596 319.6388 0.7171673 92 72.81828 0 0.1 0 0 0 1 
i 1.061345 319.8523 0.5378755 50 70.11002 0 0.1 0 0 0 1 
i 1.981527 319.8523 1.075751 60 71.61945 0 0.1 0 0 0 1 
i 5.165911 319.8523 1.075751 62 70.11002 0 0.1 0 0 0 1 
i 6.086093 319.8523 0.5378755 71 71.61945 0 0.1 0 0 0 1 
i 9.270478 319.8523 0.5378755 73 70.11002 0 0.1 0 0 0 1 
i 10.19066 319.8523 1.075751 83 71.61945 0 0.1 0 0 0 1 
i 13.37504 319.8523 1.075751 85 70.11002 0 0.1 0 0 0 1 
i 14.29522 319.8523 0.5378755 94 71.61945 0 0.1 0 0 0 1 
i 3.029976 320.3211 0.5378755 36 70.42063 0 0.1 0 0 0 1 
i 7.134542 320.3211 0.5378755 47 70.42063 0 0.1 0 0 0 1 
i 11.23911 320.3211 0.5378755 59 70.42063 0 0.1 0 0 0 1 
i 15.34367 320.3211 0.5378755 70 70.42063 0 0.1 0 0 0 1 
i 2.784594 320.356 1.393118 47 70.00067 0 0.1 0 0 0 1 
i 3.152666 320.356 2.110286 49 70.60444 0 0.1 0 0 0 1 
i 3.520739 320.356 2.110286 42 71.20822 0 0.1 0 0 0 1 
i 3.888811 320.356 2.110286 54 71.81199 0 0.1 0 0 0 1 
i 4.011502 320.356 2.110286 52 72.01325 0 0.1 0 0 0 1 
i 4.256884 320.356 2.110286 56 72.41577 0 0.1 0 0 0 1 
i 4.624956 320.356 1.393118 59 73.01954 0 0.1 0 0 0 1 
i 6.88916 320.356 0.7171673 58 70.00067 0 0.1 0 0 0 1 
i 7.257232 320.356 1.393118 61 70.60444 0 0.1 0 0 0 1 
i 7.502614 320.356 2.110286 56 71.00696 0 0.1 0 0 0 1 
i 7.625305 320.356 1.393118 54 71.20822 0 0.1 0 0 0 1 
i 7.993377 320.356 0.7171673 65 71.81199 0 0.1 0 0 0 1 
i 8.116068 320.356 2.110286 63 72.01325 0 0.1 0 0 0 1 
i 8.36145 320.356 1.393118 68 72.41577 0 0.1 0 0 0 1 
i 8.729522 320.356 2.110286 70 73.01954 0 0.1 0 0 0 1 
i 10.99373 320.356 1.393118 70 70.00067 0 0.1 0 0 0 1 
i 11.3618 320.356 2.110286 72 70.60444 0 0.1 0 0 0 1 
i 11.60718 320.356 1.393118 68 71.00696 0 0.1 0 0 0 1 
i 11.72987 320.356 2.110286 65 71.20822 0 0.1 0 0 0 1 
i 12.09794 320.356 2.110286 77 71.81199 0 0.1 0 0 0 1 
i 12.22063 320.356 2.110286 75 72.01325 0 0.1 0 0 0 1 
i 12.46602 320.356 0.7171673 79 72.41577 0 0.1 0 0 0 1 
i 12.83409 320.356 1.393118 82 73.01954 0 0.1 0 0 0 1 
i 15.09829 320.356 0.7171673 81 70.00067 0 0.1 0 0 0 1 
i 15.46636 320.356 0.7171673 84 70.60444 0 0.1 0 0 0 1 
i 15.71175 320.356 2.110286 79 71.00696 0 0.1 0 0 0 1 
i 15.83444 320.356 2.110286 77 71.20822 0 0.1 0 0 0 1 
i 16.20251 320.356 0.7171673 88 71.81199 0 0.1 0 0 0 1 
i 16.3252 320.356 2.110286 86 72.01325 0 0.1 0 0 0 1 
i 16.57058 320.356 1.393118 91 72.41577 0 0.1 0 0 0 1 
i 16.93865 320.356 2.110286 93 73.01954 0 0.1 0 0 0 1 
i 1 320.3901 0.5378755 51 70.00939 0 0.1 0 0 0 1 
i 6.147438 320.3901 0.5378755 72 71.72008 0 0.1 0 0 0 1 
i 9.209132 320.3901 0.5378755 74 70.00939 0 0.1 0 0 0 1 
i 14.35657 320.3901 0.5378755 95 71.72008 0 0.1 0 0 0 1 
i 2.784594 320.859 0.5378755 41 70.01811 0 0.1 0 0 0 1 
i 6.88916 320.859 0.5378755 52 70.01811 0 0.1 0 0 0 1 
i 10.99373 320.859 0.5378755 64 70.01811 0 0.1 0 0 0 1 
i 15.09829 320.859 0.5378755 75 70.01811 0 0.1 0 0 0 1 
i 2.907285 321.0319 1.434335 46 70.20126 0 0.1 0 0 0 1 
i 3.029976 321.0319 1.434335 48 70.40252 0 0.1 0 0 0 1 
i 3.275357 321.0319 1.434335 44 70.80503 0 0.1 0 0 0 1 
i 3.64343 321.0319 1.434335 41 71.40881 0 0.1 0 0 0 1 
i 3.766121 321.0319 0.7171673 53 71.61006 0 0.1 0 0 0 1 
i 4.134193 321.0319 1.434335 51 72.21384 0 0.1 0 0 0 1 
i 4.379575 321.0319 1.434335 55 72.61635 0 0.1 0 0 0 1 
i 4.502266 321.0319 1.434335 58 72.81761 0 0.1 0 0 0 1 
i 6.950505 321.0319 1.434335 59 70.10063 0 0.1 0 0 0 1 
i 7.011851 321.0319 1.434335 57 70.20126 0 0.1 0 0 0 1 
i 7.134542 321.0319 1.434335 60 70.40252 0 0.1 0 0 0 1 
i 7.379923 321.0319 0.7171673 55 70.80503 0 0.1 0 0 0 1 
i 7.747996 321.0319 1.434335 53 71.40881 0 0.1 0 0 0 1 
i 7.870687 321.0319 1.434335 64 71.61006 0 0.1 0 0 0 1 
i 8.054723 321.0319 0.7171673 66 71.91195 0 0.1 0 0 0 1 
i 8.238759 321.0319 1.434335 62 72.21384 0 0.1 0 0 0 1 
i 8.484141 321.0319 1.434335 67 72.61635 0 0.1 0 0 0 1 
i 8.606832 321.0319 1.434335 69 72.81761 0 0.1 0 0 0 1 
i 11.11642 321.0319 1.434335 69 70.20126 0 0.1 0 0 0 1 
i 11.23911 321.0319 1.434335 71 70.40252 0 0.1 0 0 0 1 
i 11.48449 321.0319 0.7171673 67 70.80503 0 0.1 0 0 0 1 
i 11.85256 321.0319 1.434335 64 71.40881 0 0.1 0 0 0 1 
i 11.97525 321.0319 0.7171673 76 71.61006 0 0.1 0 0 0 1 
i 12.34333 321.0319 1.434335 74 72.21384 0 0.1 0 0 0 1 
i 12.52736 321.0319 0.7171673 79 72.51572 0 0.1 0 0 0 1 
i 12.58871 321.0319 1.434335 78 72.61635 0 0.1 0 0 0 1 
i 12.7114 321.0319 1.434335 81 72.81761 0 0.1 0 0 0 1 
i 15.15964 321.0319 1.434335 82 70.10063 0 0.1 0 0 0 1 
i 15.22098 321.0319 1.434335 80 70.20126 0 0.1 0 0 0 1 
i 15.34367 321.0319 1.434335 83 70.40252 0 0.1 0 0 0 1 
i 15.52771 321.0319 0.7171673 84 70.7044 0 0.1 0 0 0 1 
i 15.58906 321.0319 0.7171673 78 70.80503 0 0.1 0 0 0 1 
i 15.95713 321.0319 1.434335 76 71.40881 0 0.1 0 0 0 1 
i 16.07982 321.0319 1.434335 87 71.61006 0 0.1 0 0 0 1 
i 16.26386 321.0319 0.7171673 89 71.91195 0 0.1 0 0 0 1 
i 16.44789 321.0319 0.7171673 85 72.21384 0 0.1 0 0 0 1 
i 16.69327 321.0319 1.434335 90 72.61635 0 0.1 0 0 0 1 
i 16.81596 321.0319 1.434335 92 72.81761 0 0.1 0 0 0 1 
i 1.122691 321.5043 0.5378755 50 70.20998 0 0.1 0 0 0 1 
i 1.981527 321.5043 0.5378755 60 71.61878 0 0.1 0 0 0 1 
i 5.227257 321.5043 0.5378755 61 70.20998 0 0.1 0 0 0 1 
i 6.086093 321.5043 0.5378755 71 71.61878 0 0.1 0 0 0 1 
i 9.331823 321.5043 0.5378755 73 70.20998 0 0.1 0 0 0 1 
i 10.19066 321.5043 0.5378755 83 71.61878 0 0.1 0 0 0 1 
i 13.43639 321.5043 0.5378755 84 70.20998 0 0.1 0 0 0 1 
i 14.29522 321.5043 0.5378755 94 71.61878 0 0.1 0 0 0 1 
i 3.336703 321.7491 0.7171673 43 70.90566 0 0.1 0 0 0 1 
i 4.195539 321.7491 0.7171673 50 72.31447 0 0.1 0 0 0 1 
i 4.563611 321.7491 0.7171673 57 72.91824 0 0.1 0 0 0 1 
i 6.88916 321.7491 0.7171673 58 70 0 0.1 0 0 0 1 
i 7.441269 321.7491 0.7171673 54 70.90566 0 0.1 0 0 0 1 
i 7.809341 321.7491 0.7171673 52 71.50943 0 0.1 0 0 0 1 
i 7.993377 321.7491 0.7171673 65 71.81132 0 0.1 0 0 0 1 
i 8.545486 321.7491 0.7171673 66 72.71698 0 0.1 0 0 0 1 
i 11.17776 321.7491 0.7171673 68 70.30189 0 0.1 0 0 0 1 
i 11.54583 321.7491 0.7171673 66 70.90566 0 0.1 0 0 0 1 
i 11.60718 321.7491 0.7171673 67 71.00629 0 0.1 0 0 0 1 
i 12.40467 321.7491 0.7171673 73 72.31447 0 0.1 0 0 0 1 
i 12.46602 321.7491 0.7171673 79 72.41509 0 0.1 0 0 0 1 
i 12.77274 321.7491 0.7171673 80 72.91824 0 0.1 0 0 0 1 
i 15.09829 321.7491 0.7171673 81 70 0 0.1 0 0 0 1 
i 16.01847 321.7491 0.7171673 75 71.50943 0 0.1 0 0 0 1 
i 16.20251 321.7491 0.7171673 88 71.81132 0 0.1 0 0 0 1 
i 16.50924 321.7491 0.7171673 84 72.31447 0 0.1 0 0 0 1 
i 16.75462 321.7491 0.7171673 89 72.71698 0 0.1 0 0 0 1 
i 2.845939 321.9338 0.5378755 53 70.11807 0 0.1 0 0 0 1 
i 3.029976 321.9338 0.5378755 58 70.41996 0 0.1 0 0 0 1 
i 6.950505 321.9338 0.5378755 64 70.11807 0 0.1 0 0 0 1 
i 7.134542 321.9338 0.5378755 69 70.41996 0 0.1 0 0 0 1 
i 11.05507 321.9338 0.5378755 76 70.11807 0 0.1 0 0 0 1 
i 11.23911 321.9338 0.5378755 81 70.41996 0 0.1 0 0 0 1 
i 15.15964 321.9338 0.5378755 87 70.11807 0 0.1 0 0 0 1 
i 15.34367 321.9338 0.5378755 92 70.41996 0 0.1 0 0 0 1 
i 1 322.0422 0.5378755 51 70.00872 0 0.1 0 0 0 1 
i 2.104217 322.0422 0.5378755 61 71.82004 0 0.1 0 0 0 1 
i 5.104566 322.0422 0.5378755 62 70.00872 0 0.1 0 0 0 1 
i 6.208784 322.0422 0.5378755 73 71.82004 0 0.1 0 0 0 1 
i 9.209132 322.0422 0.5378755 74 70.00872 0 0.1 0 0 0 1 
i 10.31335 322.0422 0.5378755 84 71.82004 0 0.1 0 0 0 1 
i 13.3137 322.0422 0.5378755 85 70.00872 0 0.1 0 0 0 1 
i 14.41792 322.0422 0.5378755 96 71.82004 0 0.1 0 0 0 1 
i 2.784594 322.4717 0.5378755 54 70.01744 0 0.1 0 0 0 1 
i 3.091321 322.4717 0.5378755 59 70.52059 0 0.1 0 0 0 1 
i 6.88916 322.4717 0.5378755 65 70.01744 0 0.1 0 0 0 1 
i 7.195887 322.4717 0.5378755 70 70.52059 0 0.1 0 0 0 1 
i 10.99373 322.4717 0.5378755 77 70.01744 0 0.1 0 0 0 1 
i 11.30045 322.4717 0.5378755 82 70.52059 0 0.1 0 0 0 1 
i 15.09829 322.4717 0.5378755 88 70.01744 0 0.1 0 0 0 1 
i 15.40502 322.4717 1.644257 93 70.52059 0 0.1 0 0 0 1 
i 1.061345 323.0402 1.075751 50 70.10868 0 0.1 0 0 0 1 
i 1.122691 323.0402 1.075751 49 70.20931 0 0.1 0 0 0 1 
i 1.981527 323.0402 1.075751 61 71.61811 0 0.1 0 0 0 1 
i 2.165563 323.0402 0.5378755 62 71.92 0 0.1 0 0 0 1 
i 5.165911 323.0402 0.5378755 62 70.10868 0 0.1 0 0 0 1 
i 5.227257 323.0402 1.075751 61 70.20931 0 0.1 0 0 0 1 
i 6.086093 323.0402 1.075751 72 71.61811 0 0.1 0 0 0 1 
i 6.270129 323.0402 1.075751 73 71.92 0 0.1 0 0 0 1 
i 9.270478 323.0402 1.075751 73 70.10868 0 0.1 0 0 0 1 
i 9.331823 323.0402 1.075751 72 70.20931 0 0.1 0 0 0 1 
i 10.19066 323.0402 1.075751 84 71.61811 0 0.1 0 0 0 1 
i 10.3747 323.0402 0.5378755 85 71.92 0 0.1 0 0 0 1 
i 13.37504 323.0402 0.5378755 85 70.10868 0 0.1 0 0 0 1 
i 13.43639 323.0402 1.075751 84 70.20931 0 0.1 0 0 0 1 
i 14.29522 323.0402 1.075751 95 71.61811 0 0.1 0 0 0 1 
i 14.47926 323.0402 1.075751 96 71.92 0 0.1 0 0 0 1 
i 2.042872 323.5781 0.5378755 60 71.71874 0 0.1 0 0 0 1 
i 5.288602 323.5781 0.5378755 60 70.30994 0 0.1 0 0 0 1 
i 10.252 323.5781 0.5378755 83 71.71874 0 0.1 0 0 0 1 
i 13.49773 323.5781 0.5378755 83 70.30994 0 0.1 0 0 0 1 
i 2.907285 323.5859 0.5378755 46 70.21803 0 0.1 0 0 0 1 
i 3.029976 323.5859 1.075751 45 70.41929 0 0.1 0 0 0 1 
i 7.011851 323.5859 1.075751 57 70.21803 0 0.1 0 0 0 1 
i 7.134542 323.5859 1.075751 56 70.41929 0 0.1 0 0 0 1 
i 11.11642 323.5859 0.5378755 69 70.21803 0 0.1 0 0 0 1 
i 11.23911 323.5859 1.075751 68 70.41929 0 0.1 0 0 0 1 
i 15.22098 323.5859 1.075751 80 70.21803 0 0.1 0 0 0 1 
i 15.34367 323.5859 1.075751 79 70.41929 0 0.1 0 0 0 1 
i 3.152666 324.1237 0.5378755 44 70.62055 0 0.1 0 0 0 1 
i 11.3618 324.1237 1.222512 67 70.62055 0 0.1 0 0 0 1 
i 1.245382 324.8084 0.5378755 49 70.4099 0 0.1 0 0 0 1 
i 1.981527 324.8084 0.5378755 59 71.61744 0 0.1 0 0 0 1 
i 5.349948 324.8084 0.5378755 60 70.4099 0 0.1 0 0 0 1 
i 6.086093 324.8084 0.5378755 71 71.61744 0 0.1 0 0 0 1 
i 9.454514 324.8084 0.5378755 72 70.4099 0 0.1 0 0 0 1 
i 10.19066 324.8084 0.5378755 82 71.61744 0 0.1 0 0 0 1 
i 13.55908 324.8084 0.5378755 83 70.4099 0 0.1 0 0 0 1 
i 14.29522 324.8084 0.5378755 94 71.61744 0 0.1 0 0 0 1 
i 2.845939 325.1218 1.075751 38 70.11673 0 0.1 0 0 0 1 
i 2.907285 325.1218 0.5378755 40 70.21736 0 0.1 0 0 0 1 
i 3.029976 325.1218 0.5378755 37 70.41862 0 0.1 0 0 0 1 
i 3.214012 325.1218 0.5378755 35 70.7205 0 0.1 0 0 0 1 
i 6.950505 325.1218 0.5378755 50 70.11673 0 0.1 0 0 0 1 
i 7.011851 325.1218 1.075751 52 70.21736 0 0.1 0 0 0 1 
i 7.134542 325.1218 1.075751 48 70.41862 0 0.1 0 0 0 1 
i 7.318578 325.1218 0.5378755 47 70.7205 0 0.1 0 0 0 1 
i 11.05507 325.1218 1.075751 61 70.11673 0 0.1 0 0 0 1 
i 11.11642 325.1218 0.5378755 63 70.21736 0 0.1 0 0 0 1 
i 11.23911 325.1218 0.5378755 60 70.41862 0 0.1 0 0 0 1 
i 11.42314 325.1218 0.5378755 58 70.7205 0 0.1 0 0 0 1 
i 15.15964 325.1218 0.5378755 73 70.11673 0 0.1 0 0 0 1 
i 15.22098 325.1218 1.075751 75 70.21736 0 0.1 0 0 0 1 
i 15.34367 325.1218 1.075751 71 70.41862 0 0.1 0 0 0 1 
i 15.52771 325.1218 0.5378755 70 70.7205 0 0.1 0 0 0 1 
i 1 325.3463 0.5378755 51 70.00738 0 0.1 0 0 0 1 
i 2.226908 325.3463 0.5378755 62 72.01996 0 0.1 0 0 0 1 
i 5.104566 325.3463 0.5378755 63 70.00738 0 0.1 0 0 0 1 
i 6.331474 325.3463 0.5378755 73 72.01996 0 0.1 0 0 0 1 
i 9.209132 325.3463 0.5378755 74 70.00738 0 0.1 0 0 0 1 
i 10.43604 325.3463 0.5378755 85 72.01996 0 0.1 0 0 0 1 
i 13.3137 325.3463 0.5378755 86 70.00738 0 0.1 0 0 0 1 
i 14.54061 325.3463 0.5378755 96 72.01996 0 0.1 0 0 0 1 
i 2.784594 325.6597 0.5378755 39 70.0161 0 0.1 0 0 0 1 
i 2.96863 325.6597 0.5378755 41 70.31799 0 0.1 0 0 0 1 
i 3.152666 325.6597 0.5378755 36 70.61987 0 0.1 0 0 0 1 
i 6.88916 325.6597 0.5378755 51 70.0161 0 0.1 0 0 0 1 
i 7.195887 325.6597 0.5378755 49 70.51925 0 0.1 0 0 0 1 
i 10.99373 325.6597 0.5378755 62 70.0161 0 0.1 0 0 0 1 
i 11.17776 325.6597 0.5378755 64 70.31799 0 0.1 0 0 0 1 
i 11.3618 325.6597 0.5378755 59 70.61987 0 0.1 0 0 0 1 
i 15.09829 325.6597 0.5378755 74 70.0161 0 0.1 0 0 0 1 
i 15.40502 325.6597 1.760387 72 70.51925 0 0.1 0 0 0 1 
i 1.061345 326.3443 1.075751 51 70.10734 0 0.1 0 0 0 1 
i 1.245382 326.3443 0.5378755 49 70.40922 0 0.1 0 0 0 1 
i 1.981527 326.3443 0.5378755 60 71.61677 0 0.1 0 0 0 1 
i 2.288254 326.3443 0.5378755 63 72.11992 0 0.1 0 0 0 1 
i 5.165911 326.3443 0.5378755 63 70.10734 0 0.1 0 0 0 1 
i 5.349948 326.3443 1.075751 60 70.40922 0 0.1 0 0 0 1 
i 6.086093 326.3443 1.075751 71 71.61677 0 0.1 0 0 0 1 
i 6.39282 326.3443 1.075751 74 72.11992 0 0.1 0 0 0 1 
i 9.270478 326.3443 1.075751 74 70.10734 0 0.1 0 0 0 1 
i 9.454514 326.3443 0.5378755 72 70.40922 0 0.1 0 0 0 1 
i 10.19066 326.3443 0.5378755 83 71.61677 0 0.1 0 0 0 1 
i 10.49739 326.3443 0.5378755 86 72.11992 0 0.1 0 0 0 1 
i 13.37504 326.3443 0.5378755 86 70.10734 0 0.1 0 0 0 1 
i 13.55908 326.3443 1.075751 83 70.40922 0 0.1 0 0 0 1 
i 14.29522 326.3443 1.075751 94 71.61677 0 0.1 0 0 0 1 
i 14.60195 326.3443 1.075751 97 72.11992 0 0.1 0 0 0 1 
i 1.306727 326.8822 0.5378755 48 70.50985 0 0.1 0 0 0 1 
i 2.042872 326.8822 0.5378755 59 71.7174 0 0.1 0 0 0 1 
i 2.226908 326.8822 0.5378755 62 72.01929 0 0.1 0 0 0 1 
i 5.104566 326.8822 0.5378755 62 70.00671 0 0.1 0 0 0 1 
i 9.515859 326.8822 0.5378755 71 70.50985 0 0.1 0 0 0 1 
i 10.252 326.8822 0.5378755 82 71.7174 0 0.1 0 0 0 1 
i 10.43604 326.8822 0.5378755 85 72.01929 0 0.1 0 0 0 1 
i 13.3137 326.8822 0.5378755 85 70.00671 0 0.1 0 0 0 1 
i 3.275357 327.2597 0.5378755 58 70.82046 0 0.1 0 0 0 1 
i 7.379923 327.2597 0.5378755 69 70.82046 0 0.1 0 0 0 1 
i 11.48449 327.2597 0.5378755 81 70.82046 0 0.1 0 0 0 1 
i 15.58906 327.2597 0.5378755 92 70.82046 0 0.1 0 0 0 1 
i 2.784594 327.7976 0.5378755 51 70.01543 0 0.1 0 0 0 1 
i 6.88916 327.7976 0.5378755 63 70.01543 0 0.1 0 0 0 1 
i 10.99373 327.7976 0.5378755 74 70.01543 0 0.1 0 0 0 1 
i 15.09829 327.7976 0.5378755 86 70.01543 0 0.1 0 0 0 1 
i 1.122691 327.9177 0.5378755 51 70.2073 0 0.1 0 0 0 1 
i 1.245382 327.9177 0.5378755 49 70.40855 0 0.1 0 0 0 1 
i 1.981527 327.9177 0.5378755 61 71.6161 0 0.1 0 0 0 1 
i 2.349599 327.9177 0.5378755 63 72.21987 0 0.1 0 0 0 1 
i 5.227257 327.9177 0.5378755 63 70.2073 0 0.1 0 0 0 1 
i 5.349948 327.9177 0.5378755 60 70.40855 0 0.1 0 0 0 1 
i 6.086093 327.9177 0.5378755 72 71.6161 0 0.1 0 0 0 1 
i 6.454165 327.9177 0.5378755 75 72.21987 0 0.1 0 0 0 1 
i 9.331823 327.9177 0.5378755 74 70.2073 0 0.1 0 0 0 1 
i 9.454514 327.9177 0.5378755 72 70.40855 0 0.1 0 0 0 1 
i 10.19066 327.9177 0.5378755 84 71.6161 0 0.1 0 0 0 1 
i 10.55873 327.9177 0.5378755 86 72.21987 0 0.1 0 0 0 1 
i 13.43639 327.9177 0.5378755 86 70.2073 0 0.1 0 0 0 1 
i 13.55908 327.9177 0.5378755 83 70.40855 0 0.1 0 0 0 1 
i 14.29522 327.9177 0.5378755 95 71.6161 0 0.1 0 0 0 1 
i 14.6633 327.9177 0.5378755 98 72.21987 0 0.1 0 0 0 1 
i 1 328.4555 0.5378755 50 70.00604 0 0.1 0 0 0 1 
i 1.368072 328.4555 0.5378755 48 70.60981 0 0.1 0 0 0 1 
i 2.104217 328.4555 0.5378755 60 71.81736 0 0.1 0 0 0 1 
i 2.226908 328.4555 0.5378755 62 72.01862 0 0.1 0 0 0 1 
i 5.104566 328.4555 0.5378755 61 70.00604 0 0.1 0 0 0 1 
i 5.472639 328.4555 0.5378755 59 70.60981 0 0.1 0 0 0 1 
i 6.208784 328.4555 0.5378755 71 71.81736 0 0.1 0 0 0 1 
i 6.331474 328.4555 0.5378755 73 72.01862 0 0.1 0 0 0 1 
i 9.209132 328.4555 0.5378755 73 70.00604 0 0.1 0 0 0 1 
i 9.577205 328.4555 0.5378755 71 70.60981 0 0.1 0 0 0 1 
i 10.31335 328.4555 0.5378755 83 71.81736 0 0.1 0 0 0 1 
i 10.43604 328.4555 0.5378755 85 72.01862 0 0.1 0 0 0 1 
i 13.3137 328.4555 0.5378755 84 70.00604 0 0.1 0 0 0 1 
i 13.68177 328.4555 0.5378755 82 70.60981 0 0.1 0 0 0 1 
i 14.41792 328.4555 0.5378755 94 71.81736 0 0.1 0 0 0 1 
i 14.54061 328.4555 0.5378755 96 72.01862 0 0.1 0 0 0 1 
i 2.845939 328.8724 0.5378755 43 70.11539 0 0.1 0 0 0 1 
i 3.275357 328.8724 0.5378755 31 70.81979 0 0.1 0 0 0 1 
i 6.950505 328.8724 0.5378755 54 70.11539 0 0.1 0 0 0 1 
i 7.379923 328.8724 0.5378755 42 70.81979 0 0.1 0 0 0 1 
i 11.05507 328.8724 0.5378755 66 70.11539 0 0.1 0 0 0 1 
i 11.48449 328.8724 0.5378755 54 70.81979 0 0.1 0 0 0 1 
i 15.15964 328.8724 0.5378755 77 70.11539 0 0.1 0 0 0 1 
i 15.58906 328.8724 0.5378755 65 70.81979 0 0.1 0 0 0 1 
i 1.061345 329.3804 1.075751 49 70.106 0 0.1 0 0 0 1 
i 1.122691 329.3804 1.075751 50 70.20662 0 0.1 0 0 0 1 
i 1.245382 329.3804 1.075751 48 70.40788 0 0.1 0 0 0 1 
i 1.429418 329.3804 0.5378755 47 70.70977 0 0.1 0 0 0 1 
i 1.981527 329.3804 1.075751 61 71.61543 0 0.1 0 0 0 1 
i 2.165563 329.3804 1.075751 60 71.91732 0 0.1 0 0 0 1 
i 2.288254 329.3804 1.075751 62 72.11857 0 0.1 0 0 0 1 
i 2.349599 329.3804 0.5378755 63 72.2192 0 0.1 0 0 0 1 
i 5.165911 329.3804 1.075751 61 70.106 0 0.1 0 0 0 1 
i 5.227257 329.3804 1.075751 62 70.20662 0 0.1 0 0 0 1 
i 5.349948 329.3804 1.075751 60 70.40788 0 0.1 0 0 0 1 
i 5.533984 329.3804 0.5378755 59 70.70977 0 0.1 0 0 0 1 
i 6.086093 329.3804 1.075751 72 71.61543 0 0.1 0 0 0 1 
i 6.270129 329.3804 0.5378755 71 71.91732 0 0.1 0 0 0 1 
i 6.39282 329.3804 1.075751 73 72.11857 0 0.1 0 0 0 1 
i 6.454165 329.3804 1.075751 74 72.2192 0 0.1 0 0 0 1 
i 9.270478 329.3804 0.5378755 72 70.106 0 0.1 0 0 0 1 
i 9.331823 329.3804 1.075751 73 70.20662 0 0.1 0 0 0 1 
i 9.454514 329.3804 0.5378755 71 70.40788 0 0.1 0 0 0 1 
i 9.63855 329.3804 0.5378755 70 70.70977 0 0.1 0 0 0 1 
i 10.19066 329.3804 1.075751 84 71.61543 0 0.1 0 0 0 1 
i 10.3747 329.3804 1.075751 83 71.91732 0 0.1 0 0 0 1 
i 10.49739 329.3804 1.075751 85 72.11857 0 0.1 0 0 0 1 
i 10.55873 329.3804 0.5378755 86 72.2192 0 0.1 0 0 0 1 
i 13.37504 329.3804 1.075751 84 70.106 0 0.1 0 0 0 1 
i 13.43639 329.3804 1.075751 85 70.20662 0 0.1 0 0 0 1 
i 13.55908 329.3804 1.075751 83 70.40788 0 0.1 0 0 0 1 
i 13.74312 329.3804 1.075751 82 70.70977 0 0.1 0 0 0 1 
i 14.29522 329.3804 1.075751 95 71.61543 0 0.1 0 0 0 1 
i 14.47926 329.3804 0.5378755 94 71.91732 0 0.1 0 0 0 1 
i 14.60195 329.3804 0.5378755 96 72.11857 0 0.1 0 0 0 1 
i 14.6633 329.3804 1.075751 97 72.2192 0 0.1 0 0 0 1 
i 2.784594 329.4103 0.5378755 42 70.01476 0 0.1 0 0 0 1 
i 3.336703 329.4103 0.5378755 30 70.92042 0 0.1 0 0 0 1 
i 6.88916 329.4103 0.5378755 53 70.01476 0 0.1 0 0 0 1 
i 7.441269 329.4103 0.5378755 41 70.92042 0 0.1 0 0 0 1 
i 10.99373 329.4103 0.5378755 65 70.01476 0 0.1 0 0 0 1 
i 11.54583 329.4103 0.5378755 53 70.92042 0 0.1 0 0 0 1 
i 15.09829 329.4103 0.5378755 76 70.01476 0 0.1 0 0 0 1 
i 15.6504 329.4103 0.5378755 64 70.92042 0 0.1 0 0 0 1 
i 1.184036 329.9183 0.5378755 51 70.30725 0 0.1 0 0 0 1 
i 2.410945 329.9183 0.5378755 64 72.31983 0 0.1 0 0 0 1 
i 5.472639 329.9183 0.5378755 59 70.60914 0 0.1 0 0 0 1 
i 6.515511 329.9183 0.5378755 75 72.31983 0 0.1 0 0 0 1 
i 9.393168 329.9183 0.5378755 74 70.30725 0 0.1 0 0 0 1 
i 9.515859 329.9183 0.5378755 72 70.50851 0 0.1 0 0 0 1 
i 9.577205 329.9183 0.5378755 71 70.60914 0 0.1 0 0 0 1 
i 10.62008 329.9183 0.5378755 87 72.31983 0 0.1 0 0 0 1 
i 14.35657 329.9183 0.5378755 96 71.71606 0 0.1 0 0 0 1 
i 14.72464 329.9183 1.144007 98 72.31983 0 0.1 0 0 0 1 
i 2.907285 330.5245 0.5378755 50 70.21535 0 0.1 0 0 0 1 
i 3.275357 330.5245 0.5378755 58 70.81912 0 0.1 0 0 0 1 
i 7.011851 330.5245 0.5378755 62 70.21535 0 0.1 0 0 0 1 
i 7.379923 330.5245 0.5378755 70 70.81912 0 0.1 0 0 0 1 
i 11.11642 330.5245 0.5378755 73 70.21535 0 0.1 0 0 0 1 
i 11.48449 330.5245 0.5378755 81 70.81912 0 0.1 0 0 0 1 
i 15.22098 330.5245 0.5378755 85 70.21535 0 0.1 0 0 0 1 
i 15.58906 330.5245 0.5378755 93 70.81912 0 0.1 0 0 0 1 
i 2.784594 331.0623 0.5378755 52 70.01409 0 0.1 0 0 0 1 
i 3.398048 331.0623 0.5378755 60 71.02038 0 0.1 0 0 0 1 
i 6.88916 331.0623 0.5378755 64 70.01409 0 0.1 0 0 0 1 
i 7.502614 331.0623 0.5378755 72 71.02038 0 0.1 0 0 0 1 
i 10.99373 331.0623 0.5378755 75 70.01409 0 0.1 0 0 0 1 
i 11.60718 331.0623 0.5378755 83 71.02038 0 0.1 0 0 0 1 
i 15.09829 331.0623 0.5378755 87 70.01409 0 0.1 0 0 0 1 
i 15.71175 331.0623 0.5378755 95 71.02038 0 0.1 0 0 0 1 
i 1.490763 331.4166 0.5378755 49 70.80973 0 0.1 0 0 0 1 
i 1.981527 331.4166 0.5378755 58 71.61476 0 0.1 0 0 0 1 
i 5.595329 331.4166 0.5378755 61 70.80973 0 0.1 0 0 0 1 
i 6.086093 331.4166 0.5378755 69 71.61476 0 0.1 0 0 0 1 
i 9.699895 331.4166 0.5378755 72 70.80973 0 0.1 0 0 0 1 
i 10.19066 331.4166 0.5378755 81 71.61476 0 0.1 0 0 0 1 
i 13.80446 331.4166 0.5378755 84 70.80973 0 0.1 0 0 0 1 
i 14.29522 331.4166 0.5378755 92 71.61476 0 0.1 0 0 0 1 
i 1 331.9544 0.5378755 53 70.0047 0 0.1 0 0 0 1 
i 2.47229 331.9544 0.5378755 62 72.41979 0 0.1 0 0 0 1 
i 5.104566 331.9544 0.5378755 65 70.0047 0 0.1 0 0 0 1 
i 6.576856 331.9544 0.5378755 73 72.41979 0 0.1 0 0 0 1 
i 9.209132 331.9544 0.5378755 76 70.0047 0 0.1 0 0 0 1 
i 10.68142 331.9544 0.5378755 85 72.41979 0 0.1 0 0 0 1 
i 13.3137 331.9544 0.5378755 88 70.0047 0 0.1 0 0 0 1 
i 14.78599 331.9544 0.5378755 96 72.41979 0 0.1 0 0 0 1 
i 2.845939 332.0604 1.075751 48 70.11405 0 0.1 0 0 0 1 
i 3.275357 332.0604 1.075751 50 70.81845 0 0.1 0 0 0 1 
i 3.459394 332.0604 0.5378755 51 71.12034 0 0.1 0 0 0 1 
i 6.950505 332.0604 1.075751 60 70.11405 0 0.1 0 0 0 1 
i 7.379923 332.0604 1.075751 62 70.81845 0 0.1 0 0 0 1 
i 7.56396 332.0604 1.075751 62 71.12034 0 0.1 0 0 0 1 
i 11.05507 332.0604 1.075751 71 70.11405 0 0.1 0 0 0 1 
i 11.48449 332.0604 0.5378755 73 70.81845 0 0.1 0 0 0 1 
i 11.66853 332.0604 0.5378755 74 71.12034 0 0.1 0 0 0 1 
i 15.15964 332.0604 1.075751 83 70.11405 0 0.1 0 0 0 1 
i 15.58906 332.0604 1.075751 85 70.81845 0 0.1 0 0 0 1 
i 7.073196 332.5982 0.5378755 59 70.3153 0 0.1 0 0 0 1 
i 11.54583 332.5982 0.5378755 73 70.91908 0 0.1 0 0 0 1 
i 15.28233 332.5982 0.5378755 82 70.3153 0 0.1 0 0 0 1 
i 1.061345 332.9525 1.075751 54 70.10465 0 0.1 0 0 0 1 
i 1.490763 332.9525 0.5378755 49 70.80906 0 0.1 0 0 0 1 
i 1.981527 332.9525 1.075751 57 71.61409 0 0.1 0 0 0 1 
i 2.533635 332.9525 0.5378755 63 72.51975 0 0.1 0 0 0 1 
i 5.165911 332.9525 0.5378755 66 70.10465 0 0.1 0 0 0 1 
i 5.595329 332.9525 1.075751 60 70.80906 0 0.1 0 0 0 1 
i 6.086093 332.9525 0.5378755 69 71.61409 0 0.1 0 0 0 1 
i 6.638201 332.9525 1.075751 74 72.51975 0 0.1 0 0 0 1 
i 9.270478 332.9525 1.075751 77 70.10465 0 0.1 0 0 0 1 
i 9.699895 332.9525 0.5378755 72 70.80906 0 0.1 0 0 0 1 
i 10.19066 332.9525 1.075751 80 71.61409 0 0.1 0 0 0 1 
i 10.74277 332.9525 0.5378755 86 72.51975 0 0.1 0 0 0 1 
i 13.37504 332.9525 0.5378755 89 70.10465 0 0.1 0 0 0 1 
i 13.80446 332.9525 1.075751 83 70.80906 0 0.1 0 0 0 1 
i 14.29522 332.9525 0.5378755 92 71.61409 0 0.1 0 0 0 1 
i 14.84733 332.9525 1.075751 97 72.51975 0 0.1 0 0 0 1 
i 1.552109 333.4903 0.5378755 48 70.90969 0 0.1 0 0 0 1 
i 2.47229 333.4903 0.5378755 62 72.41912 0 0.1 0 0 0 1 
i 5.104566 333.4903 0.5378755 65 70.00403 0 0.1 0 0 0 1 
i 6.147438 333.4903 0.5378755 68 71.71472 0 0.1 0 0 0 1 
i 9.761241 333.4903 0.5378755 71 70.90969 0 0.1 0 0 0 1 
i 10.68142 333.4903 0.5378755 85 72.41912 0 0.1 0 0 0 1 
i 13.3137 333.4903 0.5378755 88 70.00403 0 0.1 0 0 0 1 
i 14.35657 333.4903 0.5378755 91 71.71472 0 0.1 0 0 0 1 
i 3.029976 333.8285 0.5378755 43 70.41526 0 0.1 0 0 0 1 
i 3.275357 333.8285 0.5378755 37 70.81778 0 0.1 0 0 0 1 
i 7.134542 333.8285 0.5378755 55 70.41526 0 0.1 0 0 0 1 
i 7.379923 333.8285 0.5378755 48 70.81778 0 0.1 0 0 0 1 
i 11.23911 333.8285 0.5378755 66 70.41526 0 0.1 0 0 0 1 
i 11.48449 333.8285 0.5378755 60 70.81778 0 0.1 0 0 0 1 
i 15.34367 333.8285 0.5378755 78 70.41526 0 0.1 0 0 0 1 
i 15.58906 333.8285 0.5378755 71 70.81778 0 0.1 0 0 0 1 
i 2.784594 334.3664 0.5378755 40 70.01275 0 0.1 0 0 0 1 
i 3.520739 334.3664 0.5378755 33 71.22029 0 0.1 0 0 0 1 
i 6.88916 334.3664 0.5378755 51 70.01275 0 0.1 0 0 0 1 
i 7.625305 334.3664 0.5378755 45 71.22029 0 0.1 0 0 0 1 
i 10.99373 334.3664 0.5378755 63 70.01275 0 0.1 0 0 0 1 
i 11.72987 334.3664 0.5378755 56 71.22029 0 0.1 0 0 0 1 
i 15.09829 334.3664 0.5378755 74 70.01275 0 0.1 0 0 0 1 
i 15.83444 334.3664 0.5378755 68 71.22029 0 0.1 0 0 0 1 
i 1.122691 334.5258 0.5378755 54 70.20461 0 0.1 0 0 0 1 
i 1.490763 334.5258 0.5378755 49 70.80839 0 0.1 0 0 0 1 
i 1.981527 334.5258 0.5378755 58 71.61342 0 0.1 0 0 0 1 
i 2.594981 334.5258 0.5378755 63 72.61971 0 0.1 0 0 0 1 
i 5.227257 334.5258 0.5378755 66 70.20461 0 0.1 0 0 0 1 
i 5.595329 334.5258 0.5378755 61 70.80839 0 0.1 0 0 0 1 
i 6.086093 334.5258 0.5378755 69 71.61342 0 0.1 0 0 0 1 
i 6.699547 334.5258 0.5378755 75 72.61971 0 0.1 0 0 0 1 
i 9.331823 334.5258 0.5378755 77 70.20461 0 0.1 0 0 0 1 
i 9.699895 334.5258 0.5378755 72 70.80839 0 0.1 0 0 0 1 
i 10.19066 334.5258 0.5378755 81 71.61342 0 0.1 0 0 0 1 
i 10.80411 334.5258 0.5378755 86 72.61971 0 0.1 0 0 0 1 
i 13.43639 334.5258 0.5378755 89 70.20461 0 0.1 0 0 0 1 
i 13.80446 334.5258 0.5378755 84 70.80839 0 0.1 0 0 0 1 
i 14.29522 334.5258 0.5378755 92 71.61342 0 0.1 0 0 0 1 
i 14.90868 334.5258 0.5378755 98 72.61971 0 0.1 0 0 0 1 
i 1 335.0637 0.5378755 53 70.00335 0 0.1 0 0 0 1 
i 1.613454 335.0637 0.5378755 48 71.00964 0 0.1 0 0 0 1 
i 2.104217 335.0637 0.5378755 56 71.81468 0 0.1 0 0 0 1 
i 2.47229 335.0637 0.5378755 62 72.41845 0 0.1 0 0 0 1 
i 5.104566 335.0637 0.5378755 65 70.00335 0 0.1 0 0 0 1 
i 5.71802 335.0637 0.5378755 59 71.00964 0 0.1 0 0 0 1 
i 6.208784 335.0637 0.5378755 68 71.81468 0 0.1 0 0 0 1 
i 6.576856 335.0637 0.5378755 73 72.41845 0 0.1 0 0 0 1 
i 9.209132 335.0637 0.5378755 76 70.00335 0 0.1 0 0 0 1 
i 9.822586 335.0637 0.5378755 71 71.00964 0 0.1 0 0 0 1 
i 10.31335 335.0637 0.5378755 79 71.81468 0 0.1 0 0 0 1 
i 10.68142 335.0637 0.5378755 85 72.41845 0 0.1 0 0 0 1 
i 13.3137 335.0637 0.5378755 88 70.00335 0 0.1 0 0 0 1 
i 13.92715 335.0637 0.5378755 82 71.00964 0 0.1 0 0 0 1 
i 14.41792 335.0637 0.5378755 91 71.81468 0 0.1 0 0 0 1 
i 14.78599 335.0637 0.5378755 96 72.41845 0 0.1 0 0 0 1 
i 2.845939 335.3645 0.5378755 60 70.1127 0 0.1 0 0 0 1 
i 3.029976 335.3645 0.5378755 54 70.41459 0 0.1 0 0 0 1 
i 3.275357 335.3645 0.5378755 63 70.81711 0 0.1 0 0 0 1 
i 3.582084 335.3645 0.5378755 70 71.32025 0 0.1 0 0 0 1 
i 6.950505 335.3645 0.5378755 72 70.1127 0 0.1 0 0 0 1 
i 7.134542 335.3645 0.5378755 65 70.41459 0 0.1 0 0 0 1 
i 7.379923 335.3645 0.5378755 75 70.81711 0 0.1 0 0 0 1 
i 7.68665 335.3645 0.5378755 81 71.32025 0 0.1 0 0 0 1 
i 11.05507 335.3645 0.5378755 83 70.1127 0 0.1 0 0 0 1 
i 11.23911 335.3645 0.5378755 77 70.41459 0 0.1 0 0 0 1 
i 11.48449 335.3645 0.5378755 86 70.81711 0 0.1 0 0 0 1 
i 11.79122 335.3645 0.5378755 93 71.32025 0 0.1 0 0 0 1 
i 15.15964 335.3645 0.5378755 95 70.1127 0 0.1 0 0 0 1 
i 15.34367 335.3645 0.5378755 88 70.41459 0 0.1 0 0 0 1 
i 15.58906 335.3645 0.5378755 98 70.81711 0 0.1 0 0 0 1 
i 15.89578 335.3645 0.5378755 104 71.32025 0 0.1 0 0 0 1 
i 2.784594 335.9023 0.5378755 59 70.01208 0 0.1 0 0 0 1 
i 3.091321 335.9023 0.5378755 53 70.51522 0 0.1 0 0 0 1 
i 3.336703 335.9023 0.6241657 62 70.91774 0 0.1 0 0 0 1 
i 3.520739 335.9023 0.5378755 68 71.21962 0 0.1 0 0 0 1 
i 6.88916 335.9023 0.5378755 71 70.01208 0 0.1 0 0 0 1 
i 7.195887 335.9023 0.5378755 64 70.51522 0 0.1 0 0 0 1 
i 7.441269 335.9023 1.162041 74 70.91774 0 0.1 0 0 0 1 
i 7.625305 335.9023 0.5378755 80 71.21962 0 0.1 0 0 0 1 
i 10.99373 335.9023 0.5378755 82 70.01208 0 0.1 0 0 0 1 
i 11.30045 335.9023 0.5378755 76 70.51522 0 0.1 0 0 0 1 
i 11.54583 335.9023 0.5378755 85 70.91774 0 0.1 0 0 0 1 
i 11.72987 335.9023 0.5378755 91 71.21962 0 0.1 0 0 0 1 
i 15.09829 335.9023 0.5378755 94 70.01208 0 0.1 0 0 0 1 
i 15.40502 335.9023 0.5378755 87 70.51522 0 0.1 0 0 0 1 
i 15.6504 335.9023 0.5378755 97 70.91774 0 0.1 0 0 0 1 
i 15.83444 335.9023 0.5378755 103 71.21962 0 0.1 0 0 0 1 
i 1.061345 335.9886 0.5378755 53 70.10331 0 0.1 0 0 0 1 
i 1.122691 335.9886 1.075751 54 70.20394 0 0.1 0 0 0 1 
i 1.490763 335.9886 0.5378755 48 70.80771 0 0.1 0 0 0 1 
i 1.6748 335.9886 0.5378755 47 71.1096 0 0.1 0 0 0 1 
i 1.981527 335.9886 1.075751 57 71.61275 0 0.1 0 0 0 1 
i 2.165563 335.9886 1.075751 56 71.91463 0 0.1 0 0 0 1 
i 2.594981 335.9886 0.5378755 63 72.61904 0 0.1 0 0 0 1 
i 5.165911 335.9886 1.075751 65 70.10331 0 0.1 0 0 0 1 
i 5.227257 335.9886 1.075751 66 70.20394 0 0.1 0 0 0 1 
i 5.595329 335.9886 1.075751 60 70.80771 0 0.1 0 0 0 1 
i 5.779366 335.9886 1.075751 59 71.1096 0 0.1 0 0 0 1 
i 6.086093 335.9886 1.075751 68 71.61275 0 0.1 0 0 0 1 
i 6.270129 335.9886 0.5378755 67 71.91463 0 0.1 0 0 0 1 
i 6.638201 335.9886 0.5378755 73 72.51841 0 0.1 0 0 0 1 
i 9.270478 335.9886 0.5378755 76 70.10331 0 0.1 0 0 0 1 
i 9.331823 335.9886 1.075751 77 70.20394 0 0.1 0 0 0 1 
i 9.699895 335.9886 1.075751 71 70.80771 0 0.1 0 0 0 1 
i 9.883932 335.9886 0.5378755 70 71.1096 0 0.1 0 0 0 1 
i 10.19066 335.9886 1.075751 80 71.61275 0 0.1 0 0 0 1 
i 10.3747 335.9886 1.075751 79 71.91463 0 0.1 0 0 0 1 
i 10.74277 335.9886 1.075751 85 72.51841 0 0.1 0 0 0 1 
i 10.80411 335.9886 0.5378755 86 72.61904 0 0.1 0 0 0 1 
i 13.37504 335.9886 1.075751 88 70.10331 0 0.1 0 0 0 1 
i 13.43639 335.9886 1.075751 89 70.20394 0 0.1 0 0 0 1 
i 13.80446 335.9886 1.075751 83 70.80771 0 0.1 0 0 0 1 
i 13.9885 335.9886 1.075751 82 71.1096 0 0.1 0 0 0 1 
i 14.29522 335.9886 1.075751 91 71.61275 0 0.1 0 0 0 1 
i 14.47926 335.9886 0.5378755 90 71.91463 0 0.1 0 0 0 1 
i 14.84733 335.9886 0.5378755 96 72.51841 0 0.1 0 0 0 1 
i 14.90868 335.9886 1.075751 97 72.61904 0 0.1 0 0 0 1 
i 1.184036 336.5265 0.5378755 55 70.30457 0 0.1 0 0 0 1 
i 1.552109 336.5265 0.5378755 49 70.90834 0 0.1 0 0 0 1 
i 1.613454 336.5265 0.5378755 48 71.00897 0 0.1 0 0 0 1 
i 2.47229 336.5265 0.5378755 62 72.41778 0 0.1 0 0 0 1 
i 2.656326 336.5265 0.5378755 64 72.71966 0 0.1 0 0 0 1 
i 6.147438 336.5265 0.5378755 69 71.71338 0 0.1 0 0 0 1 
i 6.760892 336.5265 0.5378755 75 72.71966 0 0.1 0 0 0 1 
i 9.393168 336.5265 0.5378755 78 70.30457 0 0.1 0 0 0 1 
i 9.761241 336.5265 0.5378755 72 70.90834 0 0.1 0 0 0 1 
i 10.86546 336.5265 0.5378755 87 72.71966 0 0.1 0 0 0 1 
i 14.35657 336.5265 0.5378755 92 71.71338 0 0.1 0 0 0 1 
i 14.97002 336.5265 0.5378755 98 72.71966 0 0.1 0 0 0 1 
i 2.907285 336.9378 0.5378755 40 70.21266 0 0.1 0 0 0 1 
i 3.029976 336.9378 0.5378755 42 70.41392 0 0.1 0 0 0 1 
i 3.275357 336.9378 0.5378755 37 70.81644 0 0.1 0 0 0 1 
i 3.64343 336.9378 0.5378755 34 71.42021 0 0.1 0 0 0 1 
i 7.011851 336.9378 0.5378755 51 70.21266 0 0.1 0 0 0 1 
i 7.134542 336.9378 0.5378755 54 70.41392 0 0.1 0 0 0 1 
i 7.379923 336.9378 0.5378755 49 70.81644 0 0.1 0 0 0 1 
i 7.747996 336.9378 0.5378755 46 71.42021 0 0.1 0 0 0 1 
i 11.11642 336.9378 0.5378755 63 70.21266 0 0.1 0 0 0 1 
i 11.23911 336.9378 0.5378755 65 70.41392 0 0.1 0 0 0 1 
i 11.48449 336.9378 0.5378755 60 70.81644 0 0.1 0 0 0 1 
i 11.85256 336.9378 0.5378755 57 71.42021 0 0.1 0 0 0 1 
i 15.22098 336.9378 0.5378755 74 70.21266 0 0.1 0 0 0 1 
i 15.34367 336.9378 0.5378755 77 70.41392 0 0.1 0 0 0 1 
i 15.58906 336.9378 0.5378755 72 70.81644 0 0.1 0 0 0 1 
i 15.95713 336.9378 0.5378755 69 71.42021 0 0.1 0 0 0 1 
i 2.784594 337.4757 0.5378755 41 70.0114 0 0.1 0 0 0 1 
i 3.152666 337.4757 0.5378755 44 70.61518 0 0.1 0 0 0 1 
i 3.398048 337.4757 0.5378755 39 71.01769 0 0.1 0 0 0 1 
i 3.520739 337.4757 0.5378755 36 71.21895 0 0.1 0 0 0 1 
i 6.88916 337.4757 0.5378755 53 70.0114 0 0.1 0 0 0 1 
i 7.257232 337.4757 0.5378755 55 70.61518 0 0.1 0 0 0 1 
i 7.502614 337.4757 0.5378755 50 71.01769 0 0.1 0 0 0 1 
i 7.625305 337.4757 0.5378755 48 71.21895 0 0.1 0 0 0 1 
i 10.99373 337.4757 0.5378755 64 70.0114 0 0.1 0 0 0 1 
i 11.3618 337.4757 0.5378755 67 70.61518 0 0.1 0 0 0 1 
i 11.60718 337.4757 0.5378755 62 71.01769 0 0.1 0 0 0 1 
i 11.72987 337.4757 0.5378755 59 71.21895 0 0.1 0 0 0 1 
i 15.09829 337.4757 0.5378755 76 70.0114 0 0.1 0 0 0 1 
i 15.46636 337.4757 0.5378755 78 70.61518 0 0.1 0 0 0 1 
i 15.71175 337.4757 0.5378755 73 71.01769 0 0.1 0 0 0 1 
i 15.83444 337.4757 0.5378755 71 71.21895 0 0.1 0 0 0 1 
i 1.245382 337.6726 0.5378755 54 70.40453 0 0.1 0 0 0 1 
i 1.490763 337.6726 0.5378755 50 70.80704 0 0.1 0 0 0 1 
i 1.981527 337.6726 0.5378755 59 71.61208 0 0.1 0 0 0 1 
i 2.717672 337.6726 0.5378755 63 72.81962 0 0.1 0 0 0 1 
i 5.349948 337.6726 0.5378755 66 70.40453 0 0.1 0 0 0 1 
i 5.595329 337.6726 0.5378755 62 70.80704 0 0.1 0 0 0 1 
i 6.086093 337.6726 0.5378755 70 71.61208 0 0.1 0 0 0 1 
i 6.822238 337.6726 0.5378755 74 72.81962 0 0.1 0 0 0 1 
i 9.454514 337.6726 0.5378755 77 70.40453 0 0.1 0 0 0 1 
i 9.699895 337.6726 0.5378755 73 70.80704 0 0.1 0 0 0 1 
i 10.19066 337.6726 0.5378755 82 71.61208 0 0.1 0 0 0 1 
i 10.9268 337.6726 0.5378755 86 72.81962 0 0.1 0 0 0 1 
i 13.55908 337.6726 0.5378755 89 70.40453 0 0.1 0 0 0 1 
i 13.80446 337.6726 0.5378755 85 70.80704 0 0.1 0 0 0 1 
i 14.29522 337.6726 0.5378755 93 71.61208 0 0.1 0 0 0 1 
i 15.03137 337.6726 0.5378755 97 72.81962 0 0.1 0 0 0 1 
i 1 338.2105 0.5378755 52 70.00201 0 0.1 0 0 0 1 
i 1.736145 338.2105 0.5378755 48 71.20956 0 0.1 0 0 0 1 
i 2.226908 338.2105 0.5378755 56 72.01459 0 0.1 0 0 0 1 
i 2.47229 338.2105 0.5378755 61 72.41711 0 0.1 0 0 0 1 
i 5.104566 338.2105 0.5378755 64 70.00201 0 0.1 0 0 0 1 
i 5.840711 338.2105 0.5378755 59 71.20956 0 0.1 0 0 0 1 
i 6.331474 338.2105 0.5378755 68 72.01459 0 0.1 0 0 0 1 
i 6.576856 338.2105 0.5378755 72 72.41711 0 0.1 0 0 0 1 
i 9.209132 338.2105 0.5378755 75 70.00201 0 0.1 0 0 0 1 
i 9.945277 338.2105 0.5378755 71 71.20956 0 0.1 0 0 0 1 
i 10.43604 338.2105 0.5378755 79 72.01459 0 0.1 0 0 0 1 
i 10.68142 338.2105 0.5378755 84 72.41711 0 0.1 0 0 0 1 
i 13.3137 338.2105 0.5378755 87 70.00201 0 0.1 0 0 0 1 
i 14.04984 338.2105 0.5378755 82 71.20956 0 0.1 0 0 0 1 
i 14.54061 338.2105 0.5378755 91 72.01459 0 0.1 0 0 0 1 
i 14.78599 338.2105 0.5378755 95 72.41711 0 0.1 0 0 0 1 
i 2.845939 338.4006 1.075751 42 70.11136 0 0.1 0 0 0 1 
i 2.907285 338.4006 1.075751 41 70.21199 0 0.1 0 0 0 1 
i 3.029976 338.4006 1.075751 43 70.41325 0 0.1 0 0 0 1 
i 3.214012 338.4006 1.075751 44 70.71514 0 0.1 0 0 0 1 
i 3.275357 338.4006 1.075751 39 70.81577 0 0.1 0 0 0 1 
i 3.459394 338.4006 1.075751 40 71.11765 0 0.1 0 0 0 1 
i 3.582084 338.4006 1.075751 38 71.31891 0 0.1 0 0 0 1 
i 3.64343 338.4006 1.075751 37 71.41954 0 0.1 0 0 0 1 
i 6.950505 338.4006 1.075751 54 70.11136 0 0.1 0 0 0 1 
i 7.011851 338.4006 1.075751 53 70.21199 0 0.1 0 0 0 1 
i 7.134542 338.4006 1.075751 55 70.41325 0 0.1 0 0 0 1 
i 7.318578 338.4006 0.5378755 56 70.71514 0 0.1 0 0 0 1 
i 7.379923 338.4006 0.5378755 51 70.81577 0 0.1 0 0 0 1 
i 7.56396 338.4006 0.5378755 52 71.11765 0 0.1 0 0 0 1 
i 7.68665 338.4006 0.5378755 50 71.31891 0 0.1 0 0 0 1 
i 7.747996 338.4006 1.075751 49 71.41954 0 0.1 0 0 0 1 
i 11.05507 338.4006 1.075751 65 70.11136 0 0.1 0 0 0 1 
i 11.11642 338.4006 1.075751 64 70.21199 0 0.1 0 0 0 1 
i 11.23911 338.4006 1.075751 66 70.41325 0 0.1 0 0 0 1 
i 11.42314 338.4006 1.075751 67 70.71514 0 0.1 0 0 0 1 
i 11.48449 338.4006 0.5378755 62 70.81577 0 0.1 0 0 0 1 
i 11.66853 338.4006 1.075751 63 71.11765 0 0.1 0 0 0 1 
i 11.79122 338.4006 1.075751 61 71.31891 0 0.1 0 0 0 1 
i 11.85256 338.4006 1.075751 60 71.41954 0 0.1 0 0 0 1 
i 15.15964 338.4006 1.075751 77 70.11136 0 0.1 0 0 0 1 
i 15.22098 338.4006 1.075751 76 70.21199 0 0.1 0 0 0 1 
i 15.34367 338.4006 1.075751 78 70.41325 0 0.1 0 0 0 1 
i 15.52771 338.4006 0.5378755 79 70.71514 0 0.1 0 0 0 1 
i 15.58906 338.4006 1.075751 74 70.81577 0 0.1 0 0 0 1 
i 15.77309 338.4006 0.5378755 75 71.11765 0 0.1 0 0 0 1 
i 15.89578 338.4006 1.075751 73 71.31891 0 0.1 0 0 0 1 
i 15.95713 338.4006 1.075751 72 71.41954 0 0.1 0 0 0 1 
i 7.073196 338.9385 0.5378755 52 70.31262 0 0.1 0 0 0 1 
i 7.441269 338.9385 0.5378755 50 70.91639 0 0.1 0 0 0 1 
i 7.502614 338.9385 0.5378755 51 71.01702 0 0.1 0 0 0 1 
i 7.809341 338.9385 0.5378755 48 71.52017 0 0.1 0 0 0 1 
i 11.54583 338.9385 0.5378755 62 70.91639 0 0.1 0 0 0 1 
i 15.28233 338.9385 0.5378755 75 70.31262 0 0.1 0 0 0 1 
i 16.01847 338.9385 0.5378755 71 71.52017 0 0.1 0 0 0 1 
i 1.061345 339.1354 1.075751 52 70.10197 0 0.1 0 0 0 1 
i 1.245382 339.1354 0.5378755 54 70.40386 0 0.1 0 0 0 1 
i 1.490763 339.1354 0.5378755 50 70.80637 0 0.1 0 0 0 1 
i 1.79749 339.1354 0.5378755 47 71.30952 0 0.1 0 0 0 1 
i 1.981527 339.1354 1.075751 59 71.6114 0 0.1 0 0 0 1 
i 2.288254 339.1354 1.075751 56 72.11455 0 0.1 0 0 0 1 
i 2.533635 339.1354 0.5378755 60 72.51706 0 0.1 0 0 0 1 
i 2.717672 339.1354 0.5378755 63 72.81895 0 0.1 0 0 0 1 
i 5.165911 339.1354 0.5378755 63 70.10197 0 0.1 0 0 0 1 
i 5.349948 339.1354 1.075751 66 70.40386 0 0.1 0 0 0 1 
i 5.595329 339.1354 1.075751 62 70.80637 0 0.1 0 0 0 1 
i 5.902056 339.1354 1.075751 59 71.30952 0 0.1 0 0 0 1 
i 6.086093 339.1354 0.5378755 70 71.6114 0 0.1 0 0 0 1 
i 6.39282 339.1354 0.5378755 67 72.11455 0 0.1 0 0 0 1 
i 6.638201 339.1354 1.075751 72 72.51706 0 0.1 0 0 0 1 
i 6.822238 339.1354 0.5378755 74 72.81895 0 0.1 0 0 0 1 
i 9.270478 339.1354 1.075751 75 70.10197 0 0.1 0 0 0 1 
i 9.454514 339.1354 0.5378755 77 70.40386 0 0.1 0 0 0 1 
i 9.699895 339.1354 0.5378755 73 70.80637 0 0.1 0 0 0 1 
i 10.00662 339.1354 0.5378755 70 71.30952 0 0.1 0 0 0 1 
i 10.19066 339.1354 1.075751 82 71.6114 0 0.1 0 0 0 1 
i 10.49739 339.1354 1.075751 79 72.11455 0 0.1 0 0 0 1 
i 10.74277 339.1354 0.5378755 83 72.51706 0 0.1 0 0 0 1 
i 10.9268 339.1354 0.5378755 86 72.81895 0 0.1 0 0 0 1 
i 13.37504 339.1354 0.5378755 86 70.10197 0 0.1 0 0 0 1 
i 13.55908 339.1354 1.075751 89 70.40386 0 0.1 0 0 0 1 
i 13.80446 339.1354 1.075751 85 70.80637 0 0.1 0 0 0 1 
i 14.11119 339.1354 1.075751 82 71.30952 0 0.1 0 0 0 1 
i 14.29522 339.1354 0.5378755 93 71.6114 0 0.1 0 0 0 1 
i 14.60195 339.1354 0.5378755 90 72.11455 0 0.1 0 0 0 1 
i 14.84733 339.1354 1.075751 95 72.51706 0 0.1 0 0 0 1 
i 15.03137 339.1354 0.5378755 97 72.81895 0 0.1 0 0 0 1 
i 1.306727 339.6732 0.5378755 55 70.50449 0 0.1 0 0 0 1 
i 1.552109 339.6732 0.5378755 51 70.907 0 0.1 0 0 0 1 
i 1.736145 339.6732 0.5378755 48 71.20889 0 0.1 0 0 0 1 
i 2.47229 339.6732 0.5378755 61 72.41644 0 0.1 0 0 0 1 
i 2.779017 339.6732 0.5378755 64 72.91958 0 0.1 0 0 0 1 
i 5.104566 339.6732 0.5378755 64 70.00134 0 0.1 0 0 0 1 
i 6.147438 339.6732 0.5378755 71 71.71203 0 0.1 0 0 0 1 
i 6.331474 339.6732 0.5378755 68 72.01392 0 0.1 0 0 0 1 
i 6.883583 339.6732 0.5378755 75 72.91958 0 0.1 0 0 0 1 
i 9.515859 339.6732 0.5378755 78 70.50449 0 0.1 0 0 0 1 
i 9.761241 339.6732 0.5378755 74 70.907 0 0.1 0 0 0 1 
i 9.945277 339.6732 0.5378755 71 71.20889 0 0.1 0 0 0 1 
i 10.68142 339.6732 0.5378755 84 72.41644 0 0.1 0 0 0 1 
i 10.98815 339.6732 0.5378755 87 72.91958 0 0.1 0 0 0 1 
i 13.3137 339.6732 0.5378755 87 70.00134 0 0.1 0 0 0 1 
i 14.35657 339.6732 0.5378755 94 71.71203 0 0.1 0 0 0 1 
i 14.54061 339.6732 0.5378755 91 72.01392 0 0.1 0 0 0 1 
i 15.09272 339.6732 2.036327 98 72.91958 0 0.1 0 0 0 1 
i 1.122691 340.6338 0.5378755 52 70.20193 0 0.1 0 0 0 1 
i 1.245382 340.6338 0.5378755 54 70.40319 0 0.1 0 0 0 1 
i 1.490763 340.6338 0.5378755 49 70.8057 0 0.1 0 0 0 1 
i 1.858836 340.6338 0.5378755 47 71.40948 0 0.1 0 0 0 1 
i 1.981527 340.6338 0.5378755 58 71.61073 0 0.1 0 0 0 1 
i 2.349599 340.6338 0.5378755 56 72.21451 0 0.1 0 0 0 1 
i 2.594981 340.6338 0.5378755 60 72.61702 0 0.1 0 0 0 1 
i 2.717672 340.6338 0.5378755 62 72.81828 0 0.1 0 0 0 1 
i 5.227257 340.6338 0.5378755 63 70.20193 0 0.1 0 0 0 1 
i 5.349948 340.6338 0.5378755 65 70.40319 0 0.1 0 0 0 1 
i 5.595329 340.6338 0.5378755 61 70.8057 0 0.1 0 0 0 1 
i 5.963402 340.6338 0.5378755 59 71.40948 0 0.1 0 0 0 1 
i 6.086093 340.6338 1.075751 69 71.61073 0 0.1 0 0 0 1 
i 6.454165 340.6338 0.5378755 67 72.21451 0 0.1 0 0 0 1 
i 6.699547 340.6338 0.5378755 72 72.61702 0 0.1 0 0 0 1 
i 6.822238 340.6338 0.5378755 74 72.81828 0 0.1 0 0 0 1 
i 9.331823 340.6338 0.5378755 75 70.20193 0 0.1 0 0 0 1 
i 9.454514 340.6338 0.5378755 77 70.40319 0 0.1 0 0 0 1 
i 9.699895 340.6338 1.075751 72 70.8057 0 0.1 0 0 0 1 
i 10.06797 340.6338 0.5378755 70 71.40948 0 0.1 0 0 0 1 
i 10.19066 340.6338 0.5378755 81 71.61073 0 0.1 0 0 0 1 
i 10.55873 340.6338 0.5378755 79 72.21451 0 0.1 0 0 0 1 
i 10.80411 340.6338 0.5378755 83 72.61702 0 0.1 0 0 0 1 
i 10.9268 340.6338 0.5378755 85 72.81828 0 0.1 0 0 0 1 
i 13.43639 340.6338 0.5378755 86 70.20193 0 0.1 0 0 0 1 
i 13.55908 340.6338 0.5378755 88 70.40319 0 0.1 0 0 0 1 
i 13.80446 340.6338 0.5378755 84 70.8057 0 0.1 0 0 0 1 
i 14.17253 340.6338 0.5378755 82 71.40948 0 0.1 0 0 0 1 
i 14.29522 340.6338 0.5378755 92 71.61073 0 0.1 0 0 0 1 
i 14.6633 340.6338 0.5378755 90 72.21451 0 0.1 0 0 0 1 
i 14.90868 340.6338 0.5378755 95 72.61702 0 0.1 0 0 0 1 
i 15.03137 340.6338 0.5378755 97 72.81828 0 0.1 0 0 0 1 
i 3.766121 341.1369 0.5378755 42 71.62013 0 0.1 0 0 0 1 
i 7.870687 341.1369 0.5378755 54 71.62013 0 0.1 0 0 0 1 
i 11.97525 341.1369 0.5378755 65 71.62013 0 0.1 0 0 0 1 
i 16.07982 341.1369 0.5378755 77 71.62013 0 0.1 0 0 0 1 
i 1 341.1717 0.5378755 53 70.00067 0 0.1 0 0 0 1 
i 1.368072 341.1717 0.5378755 55 70.60444 0 0.1 0 0 0 1 
i 1.613454 341.1717 0.5378755 51 71.00696 0 0.1 0 0 0 1 
i 1.736145 341.1717 0.5378755 49 71.20822 0 0.1 0 0 0 1 
i 2.104217 341.1717 0.5378755 59 71.81199 0 0.1 0 0 0 1 
i 2.226908 341.1717 0.5378755 57 72.01325 0 0.1 0 0 0 1 
i 2.47229 341.1717 0.5378755 61 72.41577 0 0.1 0 0 0 1 
i 2.840362 341.1717 0.5378755 64 73.01954 0 0.1 0 0 0 1 
i 5.104566 341.1717 0.5378755 64 70.00067 0 0.1 0 0 0 1 
i 5.472639 341.1717 0.5378755 66 70.60444 0 0.1 0 0 0 1 
i 5.71802 341.1717 0.5378755 62 71.00696 0 0.1 0 0 0 1 
i 5.840711 341.1717 0.5378755 60 71.20822 0 0.1 0 0 0 1 
i 6.208784 341.1717 0.5378755 71 71.81199 0 0.1 0 0 0 1 
i 6.576856 341.1717 0.5378755 73 72.41577 0 0.1 0 0 0 1 
i 6.944929 341.1717 0.5378755 75 73.01954 0 0.1 0 0 0 1 
i 9.209132 341.1717 0.5378755 76 70.00067 0 0.1 0 0 0 1 
i 9.577205 341.1717 0.5378755 78 70.60444 0 0.1 0 0 0 1 
i 9.822586 341.1717 0.5378755 74 71.00696 0 0.1 0 0 0 1 
i 10.31335 341.1717 0.5378755 82 71.81199 0 0.1 0 0 0 1 
i 10.43604 341.1717 0.5378755 80 72.01325 0 0.1 0 0 0 1 
i 10.68142 341.1717 0.5378755 84 72.41577 0 0.1 0 0 0 1 
i 11.04949 341.1717 0.5378755 87 73.01954 0 0.1 0 0 0 1 
i 13.3137 341.1717 0.5378755 87 70.00067 0 0.1 0 0 0 1 
i 13.68177 341.1717 0.5378755 89 70.60444 0 0.1 0 0 0 1 
i 13.92715 341.1717 0.5378755 85 71.00696 0 0.1 0 0 0 1 
i 14.04984 341.1717 0.5378755 83 71.20822 0 0.1 0 0 0 1 
i 14.41792 341.1717 0.5378755 94 71.81199 0 0.1 0 0 0 1 
i 14.54061 341.1717 0.5378755 92 72.01325 0 0.1 0 0 0 1 
i 14.78599 341.1717 0.5378755 96 72.41577 0 0.1 0 0 0 1 
i 2.784594 341.6747 0.5378755 48 70.01006 0 0.1 0 0 0 1 
i 6.88916 341.6747 0.5378755 59 70.01006 0 0.1 0 0 0 1 
i 10.99373 341.6747 0.5378755 71 70.01006 0 0.1 0 0 0 1 
i 15.09829 341.6747 0.5378755 82 70.01006 0 0.1 0 0 0 1 
i 1.061345 342.0269 1.075751 53 70.10063 0 0.1 0 0 0 1 
i 1.122691 342.0269 1.075751 52 70.20126 0 0.1 0 0 0 1 
i 1.245382 342.0269 0.5378755 54 70.40252 0 0.1 0 0 0 1 
i 1.429418 342.0269 1.075751 55 70.7044 0 0.1 0 0 0 1 
i 1.490763 342.0269 0.5378755 50 70.80503 0 0.1 0 0 0 1 
i 1.6748 342.0269 0.5378755 51 71.10692 0 0.1 0 0 0 1 
i 1.79749 342.0269 1.075751 49 71.30818 0 0.1 0 0 0 1 
i 1.858836 342.0269 1.075751 48 71.40881 0 0.1 0 0 0 1 
i 1.981527 342.0269 1.075751 58 71.61006 0 0.1 0 0 0 1 
i 2.165563 342.0269 1.075751 59 71.91195 0 0.1 0 0 0 1 
i 2.288254 342.0269 1.075751 57 72.11321 0 0.1 0 0 0 1 
i 2.349599 342.0269 1.075751 56 72.21384 0 0.1 0 0 0 1 
i 2.533635 342.0269 1.075751 62 72.51572 0 0.1 0 0 0 1 
i 2.594981 342.0269 1.075751 60 72.61635 0 0.1 0 0 0 1 
i 2.717672 342.0269 1.075751 63 72.81761 0 0.1 0 0 0 1 
i 2.901708 342.0269 0.5378755 64 73.1195 0 0.1 0 0 0 1 
i 5.165911 342.0269 1.075751 64 70.10063 0 0.1 0 0 0 1 
i 5.227257 342.0269 1.075751 63 70.20126 0 0.1 0 0 0 1 
i 5.349948 342.0269 1.075751 66 70.40252 0 0.1 0 0 0 1 
i 5.533984 342.0269 0.5378755 67 70.7044 0 0.1 0 0 0 1 
i 5.595329 342.0269 1.075751 61 70.80503 0 0.1 0 0 0 1 
i 5.779366 342.0269 1.075751 62 71.10692 0 0.1 0 0 0 1 
i 5.902056 342.0269 1.075751 60 71.30818 0 0.1 0 0 0 1 
i 5.963402 342.0269 1.075751 59 71.40881 0 0.1 0 0 0 1 
i 6.086093 342.0269 1.075751 70 71.61006 0 0.1 0 0 0 1 
i 6.270129 342.0269 0.5378755 71 71.91195 0 0.1 0 0 0 1 
i 6.39282 342.0269 1.075751 69 72.11321 0 0.1 0 0 0 1 
i 6.454165 342.0269 1.075751 68 72.21384 0 0.1 0 0 0 1 
i 6.638201 342.0269 0.5378755 73 72.51572 0 0.1 0 0 0 1 
i 6.699547 342.0269 1.075751 72 72.61635 0 0.1 0 0 0 1 
i 6.822238 342.0269 1.075751 74 72.81761 0 0.1 0 0 0 1 
i 7.006274 342.0269 1.075751 75 73.1195 0 0.1 0 0 0 1 
i 9.270478 342.0269 0.5378755 76 70.10063 0 0.1 0 0 0 1 
i 9.331823 342.0269 1.075751 75 70.20126 0 0.1 0 0 0 1 
i 9.454514 342.0269 0.5378755 77 70.40252 0 0.1 0 0 0 1 
i 9.63855 342.0269 1.075751 78 70.7044 0 0.1 0 0 0 1 
i 9.699895 342.0269 1.075751 73 70.80503 0 0.1 0 0 0 1 
i 9.883932 342.0269 0.5378755 74 71.10692 0 0.1 0 0 0 1 
i 10.00662 342.0269 1.075751 72 71.30818 0 0.1 0 0 0 1 
i 10.06797 342.0269 1.075751 71 71.40881 0 0.1 0 0 0 1 
i 10.19066 342.0269 1.075751 81 71.61006 0 0.1 0 0 0 1 
i 10.3747 342.0269 1.075751 82 71.91195 0 0.1 0 0 0 1 
i 10.49739 342.0269 1.075751 80 72.11321 0 0.1 0 0 0 1 
i 10.55873 342.0269 1.075751 79 72.21384 0 0.1 0 0 0 1 
i 10.74277 342.0269 1.075751 85 72.51572 0 0.1 0 0 0 1 
i 10.80411 342.0269 1.075751 83 72.61635 0 0.1 0 0 0 1 
i 10.9268 342.0269 1.075751 86 72.81761 0 0.1 0 0 0 1 
i 11.11084 342.0269 0.5378755 87 73.1195 0 0.1 0 0 0 1 
i 13.37504 342.0269 1.075751 87 70.10063 0 0.1 0 0 0 1 
i 13.43639 342.0269 1.075751 86 70.20126 0 0.1 0 0 0 1 
i 13.55908 342.0269 1.075751 89 70.40252 0 0.1 0 0 0 1 
i 13.74312 342.0269 0.5378755 90 70.7044 0 0.1 0 0 0 1 
i 13.80446 342.0269 1.075751 84 70.80503 0 0.1 0 0 0 1 
i 13.9885 342.0269 1.075751 85 71.10692 0 0.1 0 0 0 1 
i 14.11119 342.0269 1.075751 83 71.30818 0 0.1 0 0 0 1 
i 14.17253 342.0269 1.075751 82 71.40881 0 0.1 0 0 0 1 
i 14.29522 342.0269 1.075751 93 71.61006 0 0.1 0 0 0 1 
i 14.47926 342.0269 0.5378755 94 71.91195 0 0.1 0 0 0 1 
i 14.60195 342.0269 0.5378755 92 72.11321 0 0.1 0 0 0 1 
i 14.6633 342.0269 1.075751 91 72.21384 0 0.1 0 0 0 1 
i 14.84733 342.0269 0.5378755 96 72.51572 0 0.1 0 0 0 1 
i 14.90868 342.0269 1.075751 95 72.61635 0 0.1 0 0 0 1 
i 15.03137 342.0269 1.075751 97 72.81761 0 0.1 0 0 0 1 
i 15.21541 342.0269 1.075751 98 73.1195 0 0.1 0 0 0 1 
i 1.184036 342.5648 0.5378755 51 70.30189 0 0.1 0 0 0 1 
i 1.613454 342.5648 0.5378755 50 71.00629 0 0.1 0 0 0 1 
i 1.920181 342.5648 0.5378755 47 71.50943 0 0.1 0 0 0 1 
i 2.47229 342.5648 0.5378755 61 72.41509 0 0.1 0 0 0 1 
i 5.411293 342.5648 0.5378755 65 70.50314 0 0.1 0 0 0 1 
i 6.515511 342.5648 0.5378755 67 72.31447 0 0.1 0 0 0 1 
i 6.760892 342.5648 0.5378755 71 72.71698 0 0.1 0 0 0 1 
i 9.393168 342.5648 0.5378755 74 70.30189 0 0.1 0 0 0 1 
i 9.515859 342.5648 0.5378755 76 70.50314 0 0.1 0 0 0 1 
i 10.12931 342.5648 0.5378755 70 71.50943 0 0.1 0 0 0 1 
i 10.68142 342.5648 0.5378755 84 72.41509 0 0.1 0 0 0 1 
i 13.62043 342.5648 0.5378755 88 70.50314 0 0.1 0 0 0 1 
i 14.35657 342.5648 0.5378755 92 71.71069 0 0.1 0 0 0 1 
i 14.72464 342.5648 0.5378755 90 72.31447 0 0.1 0 0 0 1 
i 14.97002 342.5648 0.5378755 94 72.71698 0 0.1 0 0 0 1 
i 2.845939 342.7496 1.075751 49 70.11002 0 0.1 0 0 0 1 
i 3.766121 342.7496 0.5378755 40 71.61945 0 0.1 0 0 0 1 
i 6.950505 342.7496 0.5378755 61 70.11002 0 0.1 0 0 0 1 
i 7.870687 342.7496 0.5378755 52 71.61945 0 0.1 0 0 0 1 
i 11.05507 342.7496 1.075751 72 70.11002 0 0.1 0 0 0 1 
i 11.97525 342.7496 0.5378755 63 71.61945 0 0.1 0 0 0 1 
i 15.15964 342.7496 0.5378755 84 70.11002 0 0.1 0 0 0 1 
i 16.07982 342.7496 0.5378755 75 71.61945 0 0.1 0 0 0 1 
i 3.827466 343.2874 0.5378755 39 71.72008 0 0.1 0 0 0 1 
i 6.88916 343.2874 0.5378755 60 70.00939 0 0.1 0 0 0 1 
i 7.932032 343.2874 0.5378755 51 71.72008 0 0.1 0 0 0 1 
i 12.0366 343.2874 0.5378755 62 71.72008 0 0.1 0 0 0 1 
i 15.09829 343.2874 0.5378755 83 70.00939 0 0.1 0 0 0 1 
i 16.14116 343.2874 1.652043 74 71.72008 0 0.1 0 0 0 1 
i 2.907285 344.4016 0.5378755 41 70.20998 0 0.1 0 0 0 1 
i 3.766121 344.4016 0.5378755 62 71.61878 0 0.1 0 0 0 1 
i 7.011851 344.4016 0.5378755 53 70.20998 0 0.1 0 0 0 1 
i 7.870687 344.4016 0.5378755 74 71.61878 0 0.1 0 0 0 1 
i 11.11642 344.4016 0.5378755 64 70.20998 0 0.1 0 0 0 1 
i 11.97525 344.4016 0.5378755 85 71.61878 0 0.1 0 0 0 1 
i 15.22098 344.4016 0.5378755 76 70.20998 0 0.1 0 0 0 1 
i 16.07982 344.4016 0.5378755 97 71.61878 0 0.1 0 0 0 1 
i 2.784594 344.9395 0.5378755 44 70.00872 0 0.1 0 0 0 1 
i 3.888811 344.9395 0.5378755 65 71.82004 0 0.1 0 0 0 1 
i 6.88916 344.9395 0.5378755 55 70.00872 0 0.1 0 0 0 1 
i 7.993377 344.9395 0.5378755 76 71.82004 0 0.1 0 0 0 1 
i 10.99373 344.9395 0.5378755 67 70.00872 0 0.1 0 0 0 1 
i 12.09794 344.9395 0.5378755 88 71.82004 0 0.1 0 0 0 1 
i 15.09829 344.9395 0.5378755 78 70.00872 0 0.1 0 0 0 1 
i 16.20251 344.9395 1.535913 99 71.82004 0 0.1 0 0 0 1 
i 2.845939 345.9375 0.5378755 51 70.10868 0 0.1 0 0 0 1 
i 2.907285 345.9375 0.5378755 53 70.20931 0 0.1 0 0 0 1 
i 3.766121 345.9375 0.5378755 32 71.61811 0 0.1 0 0 0 1 
i 3.950157 345.9375 0.5378755 30 71.92 0 0.1 0 0 0 1 
i 6.950505 345.9375 0.5378755 63 70.10868 0 0.1 0 0 0 1 
i 7.011851 345.9375 0.5378755 65 70.20931 0 0.1 0 0 0 1 
i 7.870687 345.9375 0.5378755 43 71.61811 0 0.1 0 0 0 1 
i 8.054723 345.9375 0.5378755 41 71.92 0 0.1 0 0 0 1 
i 11.05507 345.9375 0.5378755 74 70.10868 0 0.1 0 0 0 1 
i 11.11642 345.9375 0.5378755 76 70.20931 0 0.1 0 0 0 1 
i 11.97525 345.9375 0.5378755 55 71.61811 0 0.1 0 0 0 1 
i 12.15929 345.9375 0.5378755 53 71.92 0 0.1 0 0 0 1 
i 15.15964 345.9375 0.5378755 86 70.10868 0 0.1 0 0 0 1 
i 15.22098 345.9375 0.5378755 88 70.20931 0 0.1 0 0 0 1 
i 16.07982 345.9375 0.5378755 66 71.61811 0 0.1 0 0 0 1 
i 16.26386 345.9375 0.5378755 64 71.92 0 0.1 0 0 0 1 
i 2.784594 346.4754 0.5378755 52 70.00805 0 0.1 0 0 0 1 
i 2.96863 346.4754 0.5378755 54 70.30994 0 0.1 0 0 0 1 
i 3.827466 346.4754 0.5378755 33 71.71874 0 0.1 0 0 0 1 
i 3.888811 346.4754 0.5378755 31 71.81937 0 0.1 0 0 0 1 
i 6.88916 346.4754 0.5378755 64 70.00805 0 0.1 0 0 0 1 
i 7.073196 346.4754 0.5378755 66 70.30994 0 0.1 0 0 0 1 
i 7.932032 346.4754 0.5378755 44 71.71874 0 0.1 0 0 0 1 
i 7.993377 346.4754 0.5378755 42 71.81937 0 0.1 0 0 0 1 
i 10.99373 346.4754 0.5378755 75 70.00805 0 0.1 0 0 0 1 
i 11.17776 346.4754 0.5378755 77 70.30994 0 0.1 0 0 0 1 
i 12.0366 346.4754 0.5378755 56 71.71874 0 0.1 0 0 0 1 
i 12.09794 346.4754 0.5378755 54 71.81937 0 0.1 0 0 0 1 
i 15.09829 346.4754 0.5378755 87 70.00805 0 0.1 0 0 0 1 
i 15.28233 346.4754 0.5378755 89 70.30994 0 0.1 0 0 0 1 
i 16.14116 346.4754 0.5378755 67 71.71874 0 0.1 0 0 0 1 
i 16.20251 346.4754 1.768173 65 71.81937 0 0.1 0 0 0 1 
i 3.029976 347.7057 0.5378755 44 70.4099 0 0.1 0 0 0 1 
i 3.766121 347.7057 0.5378755 53 71.61744 0 0.1 0 0 0 1 
i 7.134542 347.7057 0.5378755 56 70.4099 0 0.1 0 0 0 1 
i 7.870687 347.7057 0.5378755 65 71.61744 0 0.1 0 0 0 1 
i 11.23911 347.7057 0.5378755 67 70.4099 0 0.1 0 0 0 1 
i 11.97525 347.7057 0.5378755 76 71.61744 0 0.1 0 0 0 1 
i 15.34367 347.7057 0.5378755 79 70.4099 0 0.1 0 0 0 1 
i 16.07982 347.7057 0.5378755 88 71.61744 0 0.1 0 0 0 1 
i 2.784594 348.2436 0.5378755 46 70.00738 0 0.1 0 0 0 1 
i 4.011502 348.2436 0.5378755 55 72.01996 0 0.1 0 0 0 1 
i 6.88916 348.2436 0.5378755 58 70.00738 0 0.1 0 0 0 1 
i 8.116068 348.2436 0.5378755 67 72.01996 0 0.1 0 0 0 1 
i 10.99373 348.2436 0.5378755 69 70.00738 0 0.1 0 0 0 1 
i 12.22063 348.2436 0.5378755 78 72.01996 0 0.1 0 0 0 1 
i 15.09829 348.2436 0.5378755 81 70.00738 0 0.1 0 0 0 1 
i 16.3252 348.2436 1.535913 90 72.01996 0 0.1 0 0 0 1 
i 2.845939 349.2416 0.5378755 46 70.10734 0 0.1 0 0 0 1 
i 3.029976 349.2416 0.5378755 43 70.40922 0 0.1 0 0 0 1 
i 3.766121 349.2416 1.075751 55 71.61677 0 0.1 0 0 0 1 
i 4.072848 349.2416 0.5378755 59 72.11992 0 0.1 0 0 0 1 
i 6.950505 349.2416 0.5378755 58 70.10734 0 0.1 0 0 0 1 
i 7.134542 349.2416 1.075751 54 70.40922 0 0.1 0 0 0 1 
i 7.870687 349.2416 0.5378755 67 71.61677 0 0.1 0 0 0 1 
i 8.177414 349.2416 1.075751 70 72.11992 0 0.1 0 0 0 1 
i 11.05507 349.2416 0.5378755 69 70.10734 0 0.1 0 0 0 1 
i 11.23911 349.2416 0.5378755 66 70.40922 0 0.1 0 0 0 1 
i 11.97525 349.2416 1.075751 78 71.61677 0 0.1 0 0 0 1 
i 12.28198 349.2416 0.5378755 82 72.11992 0 0.1 0 0 0 1 
i 15.15964 349.2416 0.5378755 81 70.10734 0 0.1 0 0 0 1 
i 15.34367 349.2416 1.075751 77 70.40922 0 0.1 0 0 0 1 
i 16.38655 349.2416 1.075751 93 72.11992 0 0.1 0 0 0 1 
i 2.784594 349.7795 0.5378755 45 70.00671 0 0.1 0 0 0 1 
i 3.091321 349.7795 0.5378755 42 70.50985 0 0.1 0 0 0 1 
i 4.011502 349.7795 0.5378755 58 72.01929 0 0.1 0 0 0 1 
i 6.88916 349.7795 0.5378755 57 70.00671 0 0.1 0 0 0 1 
i 7.932032 349.7795 0.5378755 66 71.7174 0 0.1 0 0 0 1 
i 10.99373 349.7795 0.5378755 68 70.00671 0 0.1 0 0 0 1 
i 11.30045 349.7795 0.5378755 65 70.50985 0 0.1 0 0 0 1 
i 12.22063 349.7795 0.5378755 81 72.01929 0 0.1 0 0 0 1 
i 15.09829 349.7795 0.5378755 80 70.00671 0 0.1 0 0 0 1 
i 16.14116 349.7795 1.573374 89 71.7174 0 0.1 0 0 0 1 
i 2.907285 350.815 0.5378755 50 70.2073 0 0.1 0 0 0 1 
i 3.029976 350.815 0.5378755 55 70.40855 0 0.1 0 0 0 1 
i 3.766121 350.815 0.5378755 29 71.6161 0 0.1 0 0 0 1 
i 4.134193 350.815 0.5378755 24 72.21987 0 0.1 0 0 0 1 
i 7.011851 350.815 0.5378755 62 70.2073 0 0.1 0 0 0 1 
i 7.134542 350.815 0.5378755 66 70.40855 0 0.1 0 0 0 1 
i 7.870687 350.815 0.5378755 41 71.6161 0 0.1 0 0 0 1 
i 8.238759 350.815 0.5378755 36 72.21987 0 0.1 0 0 0 1 
i 11.11642 350.815 0.5378755 73 70.2073 0 0.1 0 0 0 1 
i 11.23911 350.815 0.5378755 78 70.40855 0 0.1 0 0 0 1 
i 11.97525 350.815 0.5378755 52 71.6161 0 0.1 0 0 0 1 
i 12.34333 350.815 0.5378755 47 72.21987 0 0.1 0 0 0 1 
i 15.22098 350.815 0.5378755 85 70.2073 0 0.1 0 0 0 1 
i 15.34367 350.815 0.5378755 89 70.40855 0 0.1 0 0 0 1 
i 16.07982 350.815 0.5378755 64 71.6161 0 0.1 0 0 0 1 
i 16.44789 350.815 0.5378755 59 72.21987 0 0.1 0 0 0 1 
i 2.784594 351.3529 0.5378755 53 70.00604 0 0.1 0 0 0 1 
i 3.152666 351.3529 0.5378755 58 70.60981 0 0.1 0 0 0 1 
i 3.888811 351.3529 0.5378755 32 71.81736 0 0.1 0 0 0 1 
i 4.011502 351.3529 0.5378755 27 72.01862 0 0.1 0 0 0 1 
i 6.88916 351.3529 0.5378755 65 70.00604 0 0.1 0 0 0 1 
i 7.257232 351.3529 0.5378755 69 70.60981 0 0.1 0 0 0 1 
i 7.993377 351.3529 0.5378755 43 71.81736 0 0.1 0 0 0 1 
i 8.116068 351.3529 0.5378755 39 72.01862 0 0.1 0 0 0 1 
i 10.99373 351.3529 0.5378755 76 70.00604 0 0.1 0 0 0 1 
i 11.3618 351.3529 0.5378755 81 70.60981 0 0.1 0 0 0 1 
i 12.09794 351.3529 0.5378755 55 71.81736 0 0.1 0 0 0 1 
i 12.22063 351.3529 0.5378755 50 72.01862 0 0.1 0 0 0 1 
i 15.09829 351.3529 0.5378755 88 70.00604 0 0.1 0 0 0 1 
i 15.46636 351.3529 0.5378755 92 70.60981 0 0.1 0 0 0 1 
i 16.20251 351.3529 0.5378755 66 71.81736 0 0.1 0 0 0 1 
i 16.3252 351.3529 1.462774 62 72.01862 0 0.1 0 0 0 1 
i 2.845939 352.2778 0.5378755 43 70.106 0 0.1 0 0 0 1 
i 2.907285 352.2778 1.075751 44 70.20662 0 0.1 0 0 0 1 
i 3.029976 352.2778 0.5378755 41 70.40788 0 0.1 0 0 0 1 
i 3.214012 352.2778 1.075751 40 70.70977 0 0.1 0 0 0 1 
i 3.766121 352.2778 0.5378755 59 71.61543 0 0.1 0 0 0 1 
i 3.950157 352.2778 1.075751 58 71.91732 0 0.1 0 0 0 1 
i 4.072848 352.2778 1.075751 61 72.11857 0 0.1 0 0 0 1 
i 4.134193 352.2778 0.5378755 62 72.2192 0 0.1 0 0 0 1 
i 6.950505 352.2778 1.075751 54 70.106 0 0.1 0 0 0 1 
i 7.011851 352.2778 0.5378755 56 70.20662 0 0.1 0 0 0 1 
i 7.134542 352.2778 0.5378755 53 70.40788 0 0.1 0 0 0 1 
i 7.318578 352.2778 0.5378755 51 70.70977 0 0.1 0 0 0 1 
i 7.870687 352.2778 1.075751 71 71.61543 0 0.1 0 0 0 1 
i 8.054723 352.2778 0.5378755 69 71.91732 0 0.1 0 0 0 1 
i 8.177414 352.2778 0.5378755 72 72.11857 0 0.1 0 0 0 1 
i 8.238759 352.2778 1.075751 74 72.2192 0 0.1 0 0 0 1 
i 11.05507 352.2778 0.5378755 66 70.106 0 0.1 0 0 0 1 
i 11.11642 352.2778 1.075751 67 70.20662 0 0.1 0 0 0 1 
i 11.23911 352.2778 0.5378755 64 70.40788 0 0.1 0 0 0 1 
i 11.42314 352.2778 1.075751 63 70.70977 0 0.1 0 0 0 1 
i 11.97525 352.2778 0.5378755 82 71.61543 0 0.1 0 0 0 1 
i 12.15929 352.2778 1.075751 81 71.91732 0 0.1 0 0 0 1 
i 12.28198 352.2778 1.075751 84 72.11857 0 0.1 0 0 0 1 
i 12.34333 352.2778 0.5378755 85 72.2192 0 0.1 0 0 0 1 
i 15.15964 352.2778 1.075751 77 70.106 0 0.1 0 0 0 1 
i 15.22098 352.2778 0.5378755 79 70.20662 0 0.1 0 0 0 1 
i 15.34367 352.2778 0.5378755 76 70.40788 0 0.1 0 0 0 1 
i 15.52771 352.2778 0.5378755 74 70.70977 0 0.1 0 0 0 1 
i 16.07982 352.2778 1.075751 94 71.61543 0 0.1 0 0 0 1 
i 16.26386 352.2778 0.5378755 92 71.91732 0 0.1 0 0 0 1 
i 16.38655 352.2778 0.5378755 95 72.11857 0 0.1 0 0 0 1 
i 16.44789 352.2778 0.5378755 97 72.2192 0 0.1 0 0 0 1 
i 2.96863 352.8156 0.5378755 45 70.30725 0 0.1 0 0 0 1 
i 3.091321 352.8156 0.5378755 42 70.50851 0 0.1 0 0 0 1 
i 3.827466 352.8156 0.5378755 60 71.71606 0 0.1 0 0 0 1 
i 4.195539 352.8156 0.5378755 63 72.31983 0 0.1 0 0 0 1 
i 6.88916 352.8156 0.5378755 55 70.00537 0 0.1 0 0 0 1 
i 7.073196 352.8156 0.5378755 57 70.30725 0 0.1 0 0 0 1 
i 7.257232 352.8156 0.5378755 52 70.60914 0 0.1 0 0 0 1 
i 7.993377 352.8156 0.5378755 70 71.81669 0 0.1 0 0 0 1 
i 8.116068 352.8156 0.5378755 73 72.01795 0 0.1 0 0 0 1 
i 11.17776 352.8156 0.5378755 68 70.30725 0 0.1 0 0 0 1 
i 11.30045 352.8156 0.5378755 65 70.50851 0 0.1 0 0 0 1 
i 12.0366 352.8156 0.5378755 83 71.71606 0 0.1 0 0 0 1 
i 12.40467 352.8156 0.5378755 86 72.31983 0 0.1 0 0 0 1 
i 15.09829 352.8156 0.5378755 78 70.00537 0 0.1 0 0 0 1 
i 15.28233 352.8156 0.5378755 80 70.30725 0 0.1 0 0 0 1 
i 15.46636 352.8156 0.5378755 75 70.60914 0 0.1 0 0 0 1 
i 16.20251 352.8156 0.5378755 93 71.81669 0 0.1 0 0 0 1 
i 16.3252 352.8156 0.5378755 96 72.01795 0 0.1 0 0 0 1 
i 16.50924 352.8156 2.03611 97 72.31983 0 0.1 0 0 0 1 
i 3.275357 354.3139 0.5378755 51 70.80973 0 0.1 0 0 0 1 
i 3.766121 354.3139 0.5378755 42 71.61476 0 0.1 0 0 0 1 
i 7.379923 354.3139 0.5378755 62 70.80973 0 0.1 0 0 0 1 
i 7.870687 354.3139 0.5378755 53 71.61476 0 0.1 0 0 0 1 
i 11.48449 354.3139 0.5378755 74 70.80973 0 0.1 0 0 0 1 
i 11.97525 354.3139 0.5378755 65 71.61476 0 0.1 0 0 0 1 
i 15.58906 354.3139 0.5378755 85 70.80973 0 0.1 0 0 0 1 
i 16.07982 354.3139 0.5378755 76 71.61476 0 0.1 0 0 0 1 
i 2.784594 354.8517 0.5378755 47 70.0047 0 0.1 0 0 0 1 
i 4.256884 354.8517 0.5378755 38 72.41979 0 0.1 0 0 0 1 
i 6.88916 354.8517 0.5378755 58 70.0047 0 0.1 0 0 0 1 
i 8.36145 354.8517 0.5378755 49 72.41979 0 0.1 0 0 0 1 
i 10.99373 354.8517 0.5378755 70 70.0047 0 0.1 0 0 0 1 
i 12.46602 354.8517 0.5378755 61 72.41979 0 0.1 0 0 0 1 
i 15.09829 354.8517 0.5378755 81 70.0047 0 0.1 0 0 0 1 
i 16.57058 354.8517 1.535913 72 72.41979 0 0.1 0 0 0 1 
i 2.845939 355.8498 1.075751 46 70.10465 0 0.1 0 0 0 1 
i 3.275357 355.8498 1.075751 51 70.80906 0 0.1 0 0 0 1 
i 3.766121 355.8498 1.075751 43 71.61409 0 0.1 0 0 0 1 
i 4.318229 355.8498 1.075751 38 72.51975 0 0.1 0 0 0 1 
i 6.950505 355.8498 0.5378755 57 70.10465 0 0.1 0 0 0 1 
i 7.379923 355.8498 0.5378755 62 70.80906 0 0.1 0 0 0 1 
i 7.870687 355.8498 0.5378755 54 71.61409 0 0.1 0 0 0 1 
i 8.422795 355.8498 0.5378755 49 72.51975 0 0.1 0 0 0 1 
i 11.05507 355.8498 1.075751 69 70.10465 0 0.1 0 0 0 1 
i 11.48449 355.8498 0.5378755 74 70.80906 0 0.1 0 0 0 1 
i 11.97525 355.8498 1.075751 66 71.61409 0 0.1 0 0 0 1 
i 12.52736 355.8498 0.5378755 61 72.51975 0 0.1 0 0 0 1 
i 15.15964 355.8498 0.5378755 80 70.10465 0 0.1 0 0 0 1 
i 15.58906 355.8498 0.5378755 85 70.80906 0 0.1 0 0 0 1 
i 16.07982 355.8498 0.5378755 77 71.61409 0 0.1 0 0 0 1 
i 6.88916 356.3877 0.5378755 58 70.00403 0 0.1 0 0 0 1 
i 7.441269 356.3877 0.5378755 63 70.90969 0 0.1 0 0 0 1 
i 7.932032 356.3877 0.5378755 55 71.71472 0 0.1 0 0 0 1 
i 8.36145 356.3877 0.5378755 50 72.41912 0 0.1 0 0 0 1 
i 11.54583 356.3877 0.5378755 74 70.90969 0 0.1 0 0 0 1 
i 12.46602 356.3877 0.5378755 61 72.41912 0 0.1 0 0 0 1 
i 15.09829 356.3877 0.5378755 81 70.00403 0 0.1 0 0 0 1 
i 15.6504 356.3877 0.5378755 86 70.90969 0 0.1 0 0 0 1 
i 16.14116 356.3877 0.5378755 78 71.71472 0 0.1 0 0 0 1 
i 16.57058 356.3877 1.573374 73 72.41912 0 0.1 0 0 0 1 
i 2.907285 357.4232 0.5378755 51 70.20461 0 0.1 0 0 0 1 
i 3.275357 357.4232 0.5378755 40 70.80839 0 0.1 0 0 0 1 
i 3.766121 357.4232 0.5378755 58 71.61342 0 0.1 0 0 0 1 
i 4.379575 357.4232 0.5378755 70 72.61971 0 0.1 0 0 0 1 
i 7.011851 357.4232 0.5378755 63 70.20461 0 0.1 0 0 0 1 
i 7.379923 357.4232 0.5378755 51 70.80839 0 0.1 0 0 0 1 
i 7.870687 357.4232 0.5378755 69 71.61342 0 0.1 0 0 0 1 
i 8.484141 357.4232 0.5378755 81 72.61971 0 0.1 0 0 0 1 
i 11.11642 357.4232 0.5378755 74 70.20461 0 0.1 0 0 0 1 
i 11.48449 357.4232 0.5378755 63 70.80839 0 0.1 0 0 0 1 
i 11.97525 357.4232 0.5378755 81 71.61342 0 0.1 0 0 0 1 
i 12.58871 357.4232 0.5378755 93 72.61971 0 0.1 0 0 0 1 
i 15.22098 357.4232 0.5378755 86 70.20461 0 0.1 0 0 0 1 
i 15.58906 357.4232 0.5378755 74 70.80839 0 0.1 0 0 0 1 
i 16.07982 357.4232 0.5378755 92 71.61342 0 0.1 0 0 0 1 
i 16.69327 357.4232 0.5378755 104 72.61971 0 0.1 0 0 0 1 
i 2.784594 357.961 0.5378755 49 70.00335 0 0.1 0 0 0 1 
i 3.398048 357.961 0.5378755 37 71.00964 0 0.1 0 0 0 1 
i 3.888811 357.961 0.5378755 55 71.81468 0 0.1 0 0 0 1 
i 4.256884 357.961 0.5378755 67 72.41845 0 0.1 0 0 0 1 
i 6.88916 357.961 0.5378755 60 70.00335 0 0.1 0 0 0 1 
i 7.502614 357.961 0.5378755 49 71.00964 0 0.1 0 0 0 1 
i 7.993377 357.961 0.5378755 67 71.81468 0 0.1 0 0 0 1 
i 8.36145 357.961 0.5378755 78 72.41845 0 0.1 0 0 0 1 
i 10.99373 357.961 0.5378755 72 70.00335 0 0.1 0 0 0 1 
i 11.60718 357.961 0.5378755 60 71.00964 0 0.1 0 0 0 1 
i 12.09794 357.961 0.5378755 78 71.81468 0 0.1 0 0 0 1 
i 12.46602 357.961 0.5378755 90 72.41845 0 0.1 0 0 0 1 
i 15.09829 357.961 0.5378755 83 70.00335 0 0.1 0 0 0 1 
i 15.71175 357.961 0.5378755 72 71.00964 0 0.1 0 0 0 1 
i 16.20251 357.961 0.5378755 90 71.81468 0 0.1 0 0 0 1 
i 16.57058 357.961 1.462774 101 72.41845 0 0.1 0 0 0 1 
i 2.845939 358.8859 0.5378755 46 70.10331 0 0.1 0 0 0 1 
i 2.907285 358.8859 0.5378755 44 70.20394 0 0.1 0 0 0 1 
i 3.275357 358.8859 0.5378755 54 70.80771 0 0.1 0 0 0 1 
i 3.459394 358.8859 0.5378755 56 71.1096 0 0.1 0 0 0 1 
i 3.766121 358.8859 1.075751 40 71.61275 0 0.1 0 0 0 1 
i 3.950157 358.8859 0.5378755 42 71.91463 0 0.1 0 0 0 1 
i 4.318229 358.8859 1.075751 32 72.51841 0 0.1 0 0 0 1 
i 4.379575 358.8859 0.5378755 31 72.61904 0 0.1 0 0 0 1 
i 6.950505 358.8859 1.075751 57 70.10331 0 0.1 0 0 0 1 
i 7.011851 358.8859 0.5378755 56 70.20394 0 0.1 0 0 0 1 
i 7.379923 358.8859 1.075751 65 70.80771 0 0.1 0 0 0 1 
i 7.56396 358.8859 0.5378755 67 71.1096 0 0.1 0 0 0 1 
i 7.870687 358.8859 0.5378755 52 71.61275 0 0.1 0 0 0 1 
i 8.054723 358.8859 0.5378755 54 71.91463 0 0.1 0 0 0 1 
i 8.422795 358.8859 0.5378755 44 72.51841 0 0.1 0 0 0 1 
i 8.484141 358.8859 0.5378755 42 72.61904 0 0.1 0 0 0 1 
i 11.05507 358.8859 0.5378755 69 70.10331 0 0.1 0 0 0 1 
i 11.11642 358.8859 0.5378755 67 70.20394 0 0.1 0 0 0 1 
i 11.48449 358.8859 0.5378755 77 70.80771 0 0.1 0 0 0 1 
i 11.66853 358.8859 0.5378755 79 71.1096 0 0.1 0 0 0 1 
i 11.97525 358.8859 1.075751 63 71.61275 0 0.1 0 0 0 1 
i 12.15929 358.8859 0.5378755 65 71.91463 0 0.1 0 0 0 1 
i 12.52736 358.8859 0.5378755 55 72.51841 0 0.1 0 0 0 1 
i 12.58871 358.8859 0.5378755 54 72.61904 0 0.1 0 0 0 1 
i 15.15964 358.8859 1.075751 80 70.10331 0 0.1 0 0 0 1 
i 15.22098 358.8859 0.5378755 79 70.20394 0 0.1 0 0 0 1 
i 15.58906 358.8859 1.075751 88 70.80771 0 0.1 0 0 0 1 
i 15.77309 358.8859 0.5378755 90 71.1096 0 0.1 0 0 0 1 
i 16.07982 358.8859 0.5378755 75 71.61275 0 0.1 0 0 0 1 
i 16.26386 358.8859 0.5378755 77 71.91463 0 0.1 0 0 0 1 
i 16.63193 358.8859 0.5378755 67 72.51841 0 0.1 0 0 0 1 
i 16.69327 358.8859 0.5378755 65 72.61904 0 0.1 0 0 0 1 
i 2.784594 359.4238 0.5378755 45 70.00268 0 0.1 0 0 0 1 
i 2.96863 359.4238 0.5378755 43 70.30457 0 0.1 0 0 0 1 
i 3.336703 359.4238 0.5378755 53 70.90834 0 0.1 0 0 0 1 
i 3.398048 359.4238 0.5378755 55 71.00897 0 0.1 0 0 0 1 
i 3.888811 359.4238 0.5378755 41 71.814 0 0.1 0 0 0 1 
i 4.44092 359.4238 0.5378755 30 72.71966 0 0.1 0 0 0 1 
i 7.073196 359.4238 0.5378755 55 70.30457 0 0.1 0 0 0 1 
i 7.502614 359.4238 0.5378755 66 71.00897 0 0.1 0 0 0 1 
i 7.932032 359.4238 0.5378755 51 71.71338 0 0.1 0 0 0 1 
i 7.993377 359.4238 0.5378755 53 71.814 0 0.1 0 0 0 1 
i 8.36145 359.4238 0.5378755 43 72.41778 0 0.1 0 0 0 1 
i 8.545486 359.4238 0.5378755 41 72.71966 0 0.1 0 0 0 1 
i 10.99373 359.4238 0.5378755 68 70.00268 0 0.1 0 0 0 1 
i 11.17776 359.4238 0.5378755 66 70.30457 0 0.1 0 0 0 1 
i 11.54583 359.4238 0.5378755 76 70.90834 0 0.1 0 0 0 1 
i 11.60718 359.4238 0.5378755 78 71.00897 0 0.1 0 0 0 1 
i 12.09794 359.4238 0.5378755 64 71.814 0 0.1 0 0 0 1 
i 12.46602 359.4238 0.5378755 55 72.41778 0 0.1 0 0 0 1 
i 12.65005 359.4238 0.5378755 53 72.71966 0 0.1 0 0 0 1 
i 15.28233 359.4238 0.5378755 78 70.30457 0 0.1 0 0 0 1 
i 15.71175 359.4238 0.5378755 89 71.00897 0 0.1 0 0 0 1 
i 16.14116 359.4238 0.5378755 74 71.71338 0 0.1 0 0 0 1 
i 16.20251 359.4238 0.5378755 76 71.814 0 0.1 0 0 0 1 
i 16.57058 359.4238 0.5378755 66 72.41778 0 0.1 0 0 0 1 
i 16.75462 359.4238 1.683974 64 72.71966 0 0.1 0 0 0 1 
i 3.029976 360.5699 0.5378755 48 70.40453 0 0.1 0 0 0 1 
i 3.275357 360.5699 1.075751 47 70.80704 0 0.1 0 0 0 1 
i 3.766121 360.5699 1.075751 48 71.61208 0 0.1 0 0 0 1 
i 4.502266 360.5699 0.5378755 49 72.81962 0 0.1 0 0 0 1 
i 7.134542 360.5699 1.075751 59 70.40453 0 0.1 0 0 0 1 
i 7.379923 360.5699 0.5378755 58 70.80704 0 0.1 0 0 0 1 
i 7.870687 360.5699 1.075751 60 71.61208 0 0.1 0 0 0 1 
i 8.606832 360.5699 0.5378755 61 72.81962 0 0.1 0 0 0 1 
i 11.23911 360.5699 0.5378755 71 70.40453 0 0.1 0 0 0 1 
i 11.48449 360.5699 1.075751 70 70.80704 0 0.1 0 0 0 1 
i 11.97525 360.5699 1.075751 71 71.61208 0 0.1 0 0 0 1 
i 12.7114 360.5699 0.5378755 72 72.81962 0 0.1 0 0 0 1 
i 15.34367 360.5699 1.075751 82 70.40453 0 0.1 0 0 0 1 
i 15.58906 360.5699 1.075751 81 70.80704 0 0.1 0 0 0 1 
i 16.07982 360.5699 0.5378755 83 71.61208 0 0.1 0 0 0 1 
i 16.81596 360.5699 0.5378755 84 72.81962 0 0.1 0 0 0 1 
i 3.520739 361.1078 0.5378755 46 71.20956 0 0.1 0 0 0 1 
i 4.256884 361.1078 0.5378755 49 72.41711 0 0.1 0 0 0 1 
i 7.625305 361.1078 0.5378755 58 71.20956 0 0.1 0 0 0 1 
i 8.116068 361.1078 0.5378755 59 72.01459 0 0.1 0 0 0 1 
i 11.72987 361.1078 0.5378755 69 71.20956 0 0.1 0 0 0 1 
i 12.46602 361.1078 0.5378755 72 72.41711 0 0.1 0 0 0 1 
i 16.3252 361.1078 0.5378755 82 72.01459 0 0.1 0 0 0 1 
i 16.57058 361.1078 1.462774 83 72.41711 0 0.1 0 0 0 1 
i 2.845939 362.0327 0.5378755 45 70.10197 0 0.1 0 0 0 1 
i 3.029976 362.0327 0.5378755 51 70.40386 0 0.1 0 0 0 1 
i 3.275357 362.0327 0.5378755 43 70.80637 0 0.1 0 0 0 1 
i 3.582084 362.0327 0.5378755 38 71.30952 0 0.1 0 0 0 1 
i 3.766121 362.0327 0.5378755 58 71.6114 0 0.1 0 0 0 1 
i 4.072848 362.0327 0.5378755 53 72.11455 0 0.1 0 0 0 1 
i 4.318229 362.0327 0.5378755 61 72.51706 0 0.1 0 0 0 1 
i 4.502266 362.0327 0.5378755 66 72.81895 0 0.1 0 0 0 1 
i 6.950505 362.0327 0.5378755 57 70.10197 0 0.1 0 0 0 1 
i 7.134542 362.0327 0.5378755 62 70.40386 0 0.1 0 0 0 1 
i 7.379923 362.0327 0.5378755 54 70.80637 0 0.1 0 0 0 1 
i 7.68665 362.0327 0.5378755 49 71.30952 0 0.1 0 0 0 1 
i 7.870687 362.0327 0.5378755 70 71.6114 0 0.1 0 0 0 1 
i 8.177414 362.0327 0.5378755 65 72.11455 0 0.1 0 0 0 1 
i 8.422795 362.0327 0.5378755 72 72.51706 0 0.1 0 0 0 1 
i 8.606832 362.0327 0.5378755 77 72.81895 0 0.1 0 0 0 1 
i 11.05507 362.0327 0.5378755 68 70.10197 0 0.1 0 0 0 1 
i 11.23911 362.0327 0.5378755 74 70.40386 0 0.1 0 0 0 1 
i 11.48449 362.0327 0.5378755 66 70.80637 0 0.1 0 0 0 1 
i 11.79122 362.0327 0.5378755 61 71.30952 0 0.1 0 0 0 1 
i 11.97525 362.0327 0.5378755 81 71.6114 0 0.1 0 0 0 1 
i 12.28198 362.0327 0.5378755 76 72.11455 0 0.1 0 0 0 1 
i 12.52736 362.0327 0.5378755 84 72.51706 0 0.1 0 0 0 1 
i 12.7114 362.0327 0.5378755 89 72.81895 0 0.1 0 0 0 1 
i 15.15964 362.0327 0.5378755 80 70.10197 0 0.1 0 0 0 1 
i 15.34367 362.0327 0.5378755 85 70.40386 0 0.1 0 0 0 1 
i 15.58906 362.0327 0.5378755 77 70.80637 0 0.1 0 0 0 1 
i 15.89578 362.0327 0.5378755 72 71.30952 0 0.1 0 0 0 1 
i 16.07982 362.0327 0.5378755 93 71.6114 0 0.1 0 0 0 1 
i 16.38655 362.0327 0.5378755 88 72.11455 0 0.1 0 0 0 1 
i 16.63193 362.0327 0.5378755 95 72.51706 0 0.1 0 0 0 1 
i 16.81596 362.0327 0.5378755 100 72.81895 0 0.1 0 0 0 1 
i 2.784594 362.5706 0.5378755 46 70.00134 0 0.1 0 0 0 1 
i 3.091321 362.5706 0.5378755 52 70.50449 0 0.1 0 0 0 1 
i 3.336703 362.5706 0.5378755 44 70.907 0 0.1 0 0 0 1 
i 3.520739 362.5706 0.5378755 39 71.20889 0 0.1 0 0 0 1 
i 3.827466 362.5706 0.5378755 59 71.71203 0 0.1 0 0 0 1 
i 4.011502 362.5706 0.5378755 54 72.01392 0 0.1 0 0 0 1 
i 4.256884 362.5706 0.5378755 62 72.41644 0 0.1 0 0 0 1 
i 4.563611 362.5706 0.5378755 67 72.91958 0 0.1 0 0 0 1 
i 6.88916 362.5706 0.5378755 58 70.00134 0 0.1 0 0 0 1 
i 7.195887 362.5706 0.5378755 63 70.50449 0 0.1 0 0 0 1 
i 7.441269 362.5706 0.5378755 55 70.907 0 0.1 0 0 0 1 
i 7.625305 362.5706 0.5378755 50 71.20889 0 0.1 0 0 0 1 
i 7.932032 362.5706 0.5378755 71 71.71203 0 0.1 0 0 0 1 
i 8.116068 362.5706 0.5378755 66 72.01392 0 0.1 0 0 0 1 
i 8.36145 362.5706 0.5378755 73 72.41644 0 0.1 0 0 0 1 
i 8.668177 362.5706 0.5378755 78 72.91958 0 0.1 0 0 0 1 
i 10.99373 362.5706 0.5378755 69 70.00134 0 0.1 0 0 0 1 
i 11.30045 362.5706 0.5378755 75 70.50449 0 0.1 0 0 0 1 
i 11.54583 362.5706 0.5378755 67 70.907 0 0.1 0 0 0 1 
i 11.72987 362.5706 0.5378755 62 71.20889 0 0.1 0 0 0 1 
i 12.0366 362.5706 0.5378755 82 71.71203 0 0.1 0 0 0 1 
i 12.22063 362.5706 0.5378755 77 72.01392 0 0.1 0 0 0 1 
i 12.46602 362.5706 0.5378755 85 72.41644 0 0.1 0 0 0 1 
i 12.77274 362.5706 0.5378755 90 72.91958 0 0.1 0 0 0 1 
i 15.09829 362.5706 0.5378755 81 70.00134 0 0.1 0 0 0 1 
i 15.40502 362.5706 0.5378755 86 70.50449 0 0.1 0 0 0 1 
i 15.6504 362.5706 0.5378755 78 70.907 0 0.1 0 0 0 1 
i 15.83444 362.5706 0.5378755 73 71.20889 0 0.1 0 0 0 1 
i 16.14116 362.5706 0.5378755 94 71.71203 0 0.1 0 0 0 1 
i 16.3252 362.5706 0.5378755 89 72.01392 0 0.1 0 0 0 1 
i 16.57058 362.5706 0.5378755 96 72.41644 0 0.1 0 0 0 1 
i 16.87731 362.5706 1.498452 101 72.91958 0 0.1 0 0 0 1 
i 2.907285 363.5311 0.5378755 49 70.20193 0 0.1 0 0 0 1 
i 3.029976 363.5311 0.5378755 45 70.40319 0 0.1 0 0 0 1 
i 3.275357 363.5311 0.5378755 54 70.8057 0 0.1 0 0 0 1 
i 3.64343 363.5311 0.5378755 58 71.40948 0 0.1 0 0 0 1 
i 3.766121 363.5311 0.5378755 36 71.61073 0 0.1 0 0 0 1 
i 4.134193 363.5311 0.5378755 40 72.21451 0 0.1 0 0 0 1 
i 4.379575 363.5311 0.5378755 32 72.61702 0 0.1 0 0 0 1 
i 4.502266 363.5311 0.5378755 27 72.81828 0 0.1 0 0 0 1 
i 7.011851 363.5311 0.5378755 61 70.20193 0 0.1 0 0 0 1 
i 7.134542 363.5311 0.5378755 56 70.40319 0 0.1 0 0 0 1 
i 7.379923 363.5311 0.5378755 65 70.8057 0 0.1 0 0 0 1 
i 7.747996 363.5311 0.5378755 70 71.40948 0 0.1 0 0 0 1 
i 7.870687 363.5311 0.5378755 48 71.61073 0 0.1 0 0 0 1 
i 8.238759 363.5311 0.5378755 52 72.21451 0 0.1 0 0 0 1 
i 8.484141 363.5311 0.5378755 43 72.61702 0 0.1 0 0 0 1 
i 8.606832 363.5311 0.5378755 39 72.81828 0 0.1 0 0 0 1 
i 11.11642 363.5311 0.5378755 72 70.20193 0 0.1 0 0 0 1 
i 11.23911 363.5311 0.5378755 68 70.40319 0 0.1 0 0 0 1 
i 11.48449 363.5311 0.5378755 77 70.8057 0 0.1 0 0 0 1 
i 11.85256 363.5311 0.5378755 81 71.40948 0 0.1 0 0 0 1 
i 11.97525 363.5311 0.5378755 59 71.61073 0 0.1 0 0 0 1 
i 12.34333 363.5311 0.5378755 63 72.21451 0 0.1 0 0 0 1 
i 12.58871 363.5311 0.5378755 55 72.61702 0 0.1 0 0 0 1 
i 12.7114 363.5311 0.5378755 50 72.81828 0 0.1 0 0 0 1 
i 15.22098 363.5311 0.5378755 84 70.20193 0 0.1 0 0 0 1 
i 15.34367 363.5311 0.5378755 79 70.40319 0 0.1 0 0 0 1 
i 15.58906 363.5311 0.5378755 88 70.8057 0 0.1 0 0 0 1 
i 15.95713 363.5311 0.5378755 93 71.40948 0 0.1 0 0 0 1 
i 16.07982 363.5311 0.5378755 71 71.61073 0 0.1 0 0 0 1 
i 16.44789 363.5311 0.5378755 75 72.21451 0 0.1 0 0 0 1 
i 16.69327 363.5311 0.5378755 66 72.61702 0 0.1 0 0 0 1 
i 16.81596 363.5311 0.5378755 62 72.81828 0 0.1 0 0 0 1 
i 2.784594 364.069 0.5378755 47 70.00067 0 0.1 0 0 0 1 
i 3.152666 364.069 0.5378755 42 70.60444 0 0.1 0 0 0 1 
i 3.398048 364.069 0.5378755 51 71.00696 0 0.1 0 0 0 1 
i 3.520739 364.069 0.5378755 55 71.20822 0 0.1 0 0 0 1 
i 3.888811 364.069 0.5378755 33 71.81199 0 0.1 0 0 0 1 
i 4.011502 364.069 0.5378755 38 72.01325 0 0.1 0 0 0 1 
i 4.256884 364.069 0.5378755 29 72.41577 0 0.1 0 0 0 1 
i 4.624956 364.069 0.5378755 25 73.01954 0 0.1 0 0 0 1 
i 6.88916 364.069 0.5378755 58 70.00067 0 0.1 0 0 0 1 
i 7.257232 364.069 0.5378755 54 70.60444 0 0.1 0 0 0 1 
i 7.502614 364.069 0.5378755 63 71.00696 0 0.1 0 0 0 1 
i 7.625305 364.069 0.5378755 67 71.20822 0 0.1 0 0 0 1 
i 7.993377 364.069 0.5378755 45 71.81199 0 0.1 0 0 0 1 
i 8.116068 364.069 0.5378755 49 72.01325 0 0.1 0 0 0 1 
i 8.36145 364.069 0.5378755 41 72.41577 0 0.1 0 0 0 1 
i 8.729522 364.069 0.5378755 36 73.01954 0 0.1 0 0 0 1 
i 10.99373 364.069 0.5378755 70 70.00067 0 0.1 0 0 0 1 
i 11.3618 364.069 0.5378755 65 70.60444 0 0.1 0 0 0 1 
i 11.60718 364.069 0.5378755 74 71.00696 0 0.1 0 0 0 1 
i 11.72987 364.069 0.5378755 78 71.20822 0 0.1 0 0 0 1 
i 12.09794 364.069 0.5378755 56 71.81199 0 0.1 0 0 0 1 
i 12.22063 364.069 0.5378755 61 72.01325 0 0.1 0 0 0 1 
i 12.46602 364.069 0.5378755 52 72.41577 0 0.1 0 0 0 1 
i 12.83409 364.069 0.5378755 48 73.01954 0 0.1 0 0 0 1 
i 15.09829 364.069 0.5378755 81 70.00067 0 0.1 0 0 0 1 
i 15.46636 364.069 0.5378755 77 70.60444 0 0.1 0 0 0 1 
i 15.71175 364.069 0.5378755 86 71.00696 0 0.1 0 0 0 1 
i 15.83444 364.069 0.5378755 90 71.20822 0 0.1 0 0 0 1 
i 16.20251 364.069 0.5378755 68 71.81199 0 0.1 0 0 0 1 
i 16.3252 364.069 0.5378755 72 72.01325 0 0.1 0 0 0 1 
i 16.57058 364.069 0.5378755 64 72.41577 0 0.1 0 0 0 1 
i 16.93865 364.069 1.930994 59 73.01954 0 0.1 0 0 0 1 
i 2.845939 364.9242 1.075751 47 70.10063 0 0.1 0 0 0 1 
i 3.214012 364.9242 1.075751 48 70.7044 0 0.1 0 0 0 1 
i 3.582084 364.9242 1.075751 47 71.30818 0 0.1 0 0 0 1 
i 3.64343 364.9242 1.075751 46 71.40881 0 0.1 0 0 0 1 
i 3.766121 364.9242 1.075751 48 71.61006 0 0.1 0 0 0 1 
i 4.318229 364.9242 1.075751 49 72.51572 0 0.1 0 0 0 1 
i 4.502266 364.9242 1.075751 49 72.81761 0 0.1 0 0 0 1 
i 6.950505 364.9242 1.075751 59 70.10063 0 0.1 0 0 0 1 
i 7.379923 364.9242 1.075751 58 70.80503 0 0.1 0 0 0 1 
i 7.56396 364.9242 1.075751 58 71.10692 0 0.1 0 0 0 1 
i 7.870687 364.9242 1.075751 60 71.61006 0 0.1 0 0 0 1 
i 8.238759 364.9242 1.075751 59 72.21384 0 0.1 0 0 0 1 
i 8.606832 364.9242 1.075751 60 72.81761 0 0.1 0 0 0 1 
i 8.790868 364.9242 0.5378755 61 73.1195 0 0.1 0 0 0 1 
i 11.05507 364.9242 1.075751 70 70.10063 0 0.1 0 0 0 1 
i 11.42314 364.9242 1.075751 71 70.7044 0 0.1 0 0 0 1 
i 11.66853 364.9242 1.075751 70 71.10692 0 0.1 0 0 0 1 
i 11.85256 364.9242 1.075751 69 71.40881 0 0.1 0 0 0 1 
i 11.97525 364.9242 1.075751 71 71.61006 0 0.1 0 0 0 1 
i 12.52736 364.9242 1.075751 72 72.51572 0 0.1 0 0 0 1 
i 15.15964 364.9242 1.075751 82 70.10063 0 0.1 0 0 0 1 
i 15.52771 364.9242 1.075751 82 70.7044 0 0.1 0 0 0 1 
i 15.58906 364.9242 1.075751 81 70.80503 0 0.1 0 0 0 1 
i 16.07982 364.9242 1.075751 83 71.61006 0 0.1 0 0 0 1 
i 16.63193 364.9242 1.075751 83 72.51572 0 0.1 0 0 0 1 
i 17 364.9242 0.5378755 84 73.1195 0 0.1 0 0 0 1 
i 12.46602 365.4621 0.5378755 72 72.41509 0 0.1 0 0 0 1 
i 12.65005 365.4621 0.5378755 71 72.71698 0 0.1 0 0 0 1 
i 16.50924 365.4621 0.5378755 82 72.31447 0 0.1 0 0 0 1 

</CsScore>
        </CsoundSynthesizer>
    