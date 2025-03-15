transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/manuel/fpga/password {/home/manuel/fpga/password/display.v}
vlog -vlog01compat -work work +incdir+/home/manuel/fpga/password {/home/manuel/fpga/password/top_psw.v}
vlog -vlog01compat -work work +incdir+/home/manuel/fpga/password {/home/manuel/fpga/password/debouncer.v}
vlog -vlog01compat -work work +incdir+/home/manuel/fpga/password {/home/manuel/fpga/password/password.v}
vlog -vlog01compat -work work +incdir+/home/manuel/fpga/password {/home/manuel/fpga/password/edge.v}

vlog -vlog01compat -work work +incdir+/home/manuel/fpga/password {/home/manuel/fpga/password/tb_top_psw.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_top_psw

add wave *
view structure
view signals
run -all
