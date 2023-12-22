transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment6-2 {C:/intelFPGA_lite/18.1/Assignment6-2/tl_cntr_w_left.v}

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment6-2 {C:/intelFPGA_lite/18.1/Assignment6-2/tb_tl_cntr_w_left.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_tl_cntr_w_left

add wave *
view structure
view signals
run -all
