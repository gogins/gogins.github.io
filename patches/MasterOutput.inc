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
    if i_filename_length > 0 then
    prints sprintf("Output filename: %s\n", gS_MasterOutput_filename)
    fout gS_MasterOutput_filename, 18, a_out_left * i_amplitude_adjustment, a_out_right * i_amplitude_adjustment
    endif
    prints "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d\n", nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1)
    gk_MasterOutput_output_level_left = dbfsamp(rms(a_out_left))
    gk_MasterOutput_output_level_right = dbfsamp(rms(a_out_right))
    chnset gk_MasterOutput_output_level_left, "gk_MasterOutput_output_level_left"
    chnset gk_MasterOutput_output_level_right, "gk_MasterOutput_output_level_right"
    printks "%-24s i %9.4f t %9.4f d %9.4f k %9.4f v %9.4f p %9.4f #%3d l%9.4f r%9.4f\n", 1, nstrstr(p1), p1, p2, p3, p4, p5, p7, active(p1), gk_MasterOutput_output_level_left, gk_MasterOutput_output_level_right
    endin
