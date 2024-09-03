<CsoundSynthesizer>
<CsOptions>
; Select audio/midi flags here according to platform
-odac -Q3 -M3  ;;;realtime audio out and midi in and out
;-iadc    ;;;uncomment -iadc if realtime audio input is needed too
; For Non-realtime ouput leave only the line below:
; -o outkc.wav -W ;;; for file output any platform
</CsOptions>
<CsInstruments>

; Required settings for WebAudio:

sr = 48000
ksmps = 128
nchnls = 2
nchnls_i = 1

; sr = 44100
; ksmps = 32
; nchnls = 2

instr 1

ikey init 60 
ivel  init 80

kcut linseg 100, .5, 20		;vary controller in .5 second
kbrt = int(kcut)		;whole numbers only
outkc 1, 74, kbrt, 0, 127	;controller 74 (= brightness)
midion 1, ikey, ivel		;of external synth

endin
</CsInstruments>
<CsScore>
f0 30	;runs 30 seconds

e
</CsScore>
</CsoundSynthesizer>
