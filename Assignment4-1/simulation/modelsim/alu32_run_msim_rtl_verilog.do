transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment4-1 {C:/intelFPGA_lite/18.1/Assignment4-1/blocking_and_nonblocking.v}

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment4-1 {C:/intelFPGA_lite/18.1/Assignment4-1/tb_blocking_and_nonblocking.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_blocking_and_nonblocking

add wave *
view structure
view signals
run -all
