transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -sv -work work +incdir+. {bcd.svo}

vlog -vlog01compat -work work +incdir+/home/manuel/fpga/bcd {/home/manuel/fpga/bcd/bcd_tb.v}

vsim -t 1ps -L altera_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L gate_work -L work -voptargs="+acc"  bcd_tb

add wave *
view structure
view signals
run -all
