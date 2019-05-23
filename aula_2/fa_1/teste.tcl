# Reading C:/modeltech64_10.1d/tcl/vsim/pref.tcl 
# //  ModelSim SE-64 10.1d Nov  1 2012 
# //
# //  Copyright 1991-2012 Mentor Graphics Corporation
# //  All Rights Reserved.
# //
# //  THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION
# //  WHICH IS THE PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS
# //  LICENSORS AND IS SUBJECT TO LICENSE TERMS.
# //


add wave /*
run 100ns
run 100ns
run 100ns
run 100ns
force a_in 0
force b_in 1
force c_in 0
run 100ns
force -freeze a_in 1 0, 0 {10 ns} -r 20
restart
force -freeze a_in 1 0, 0 {10 ns} -r 20
run 100ns
run 100ns
# Causality operation skipped due to absense of debug database file

