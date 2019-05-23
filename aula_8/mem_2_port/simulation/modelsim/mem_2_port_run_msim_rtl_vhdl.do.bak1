transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {X:/psi3451/aula_8/mem_2_port/mem_2_port.vhd}

vcom -93 -work work {X:/psi3451/aula_8/mem_2_port/testbench_mem_2-port.vhd}
vcom -93 -work work {X:/psi3451/aula_8/mem_2_port/stimuli_mem_2-port.vhd}
vcom -93 -work work {X:/psi3451/aula_8/mem_2_port/mem_2_port.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc" testbench_mem_2_port

add wave *
view structure
view signals
run 100 ns
