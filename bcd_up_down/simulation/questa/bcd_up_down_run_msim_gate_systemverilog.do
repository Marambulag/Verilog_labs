transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -sv -work work +incdir+. {bcd_up_down.svo}

vlog -vlog01compat -work work +incdir+/home/manuel/fpga/bcd_up_down {/home/manuel/fpga/bcd_up_down/counter_div_tb.v}

vsim -t 1ps -L altera_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L gate_work -L work -voptargs="+acc"  counter_div_tb

add wave *
view structure
view signals
run -all
