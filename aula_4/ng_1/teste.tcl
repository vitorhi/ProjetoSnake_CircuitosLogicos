
#cd X:/psi3451/aula_3/fa_3

#vlib work
#vmap work work

#vcom -reportprogress 300 -work work X:/psi3451/aula_3/fa_3/full_adder_3.vhd

#vsim -gui work.full_adder

#vsim -gui -voptargs=+acc work.full_adder

add wave /*
force pos_neg 0
force one_num_gen 0
run 50ns

force pos_neg 0
force one_num_gen 1
run 50ns

force pos_neg 1
force one_num_gen 0
run 50ns

force pos_neg 1
force one_num_gen 1
run 50ns