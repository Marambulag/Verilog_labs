transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/manuel/fpga/pwm {/home/manuel/fpga/pwm/pwm.v}

vlog -vlog01compat -work work +incdir+/home/manuel/fpga/pwm {/home/manuel/fpga/pwm/pwm_tb1.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  pwm_tb1

add wave *
view structure
view signals
run -all
