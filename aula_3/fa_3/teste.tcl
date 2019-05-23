
#cd X:/psi3451/aula_3/fa_3

#vlib work
#vmap work work

#vcom -reportprogress 300 -work work X:/psi3451/aula_3/fa_3/full_adder_3.vhd

#vsim -gui work.full_adder

#vsim -gui -voptargs=+acc work.full_adder

add wave /*
force a_in 0
force b_in 0
force c_in 0
run 50ns

force a_in 1
force b_in 0
force c_in 0
run 50ns

force a_in 0
force b_in 1
force c_in 0
run 50ns

force a_in 0
force b_in 0
force c_in 1
run 50ns

force a_in 1
force b_in 1
force c_in 0
run 50ns

force a_in 1
force b_in 0
force c_in 1
run 50ns

force a_in 1
force b_in 1
force c_in 1
run 50ns