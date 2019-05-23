transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {X:/psi3451/aula_10/fsm_main_3/fonte/fsm_main.vhd}

vcom -93 -work work {X:/psi3451/aula_10/fsm_main_3/tb1/clock_generator.vhd}
vcom -93 -work work {X:/psi3451/aula_10/fsm_main_3/tb1/stimuli_fsm_main.vhd}
vcom -93 -work work {X:/psi3451/aula_10/fsm_main_3/tb1/testbench_fsm_main.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L cycloneii -L rtl_work -L work -voptargs="+acc" tb_fsm_main_seq_2

add wave *
view structure
view signals
run 2 us
