transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment\ 7 {C:/intelFPGA_lite/18.1/Assignment 7/gates.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment\ 7 {C:/intelFPGA_lite/18.1/Assignment 7/mx2.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment\ 7 {C:/intelFPGA_lite/18.1/Assignment 7/mx4.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment\ 7 {C:/intelFPGA_lite/18.1/Assignment 7/LSL8.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment\ 7 {C:/intelFPGA_lite/18.1/Assignment 7/LSR8.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment\ 7 {C:/intelFPGA_lite/18.1/Assignment 7/ASR8.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment\ 7 {C:/intelFPGA_lite/18.1/Assignment 7/shifter8.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment\ 7 {C:/intelFPGA_lite/18.1/Assignment 7/_dff_r.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment\ 7 {C:/intelFPGA_lite/18.1/Assignment 7/_register8_r.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment\ 7 {C:/intelFPGA_lite/18.1/Assignment 7/cc_logic.v}

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment\ 7 {C:/intelFPGA_lite/18.1/Assignment 7/tb_shifter8.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_shifter8

add wave *
view structure
view signals
run -all
