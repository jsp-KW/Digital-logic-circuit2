transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment7-2 {C:/intelFPGA_lite/18.1/Assignment7-2/_8_to_1_MUX.v}

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment7-2 {C:/intelFPGA_lite/18.1/Assignment7-2/tb_8_to_1_MUX.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_8_to_1_MUX

add wave *
view structure
view signals
run -all
