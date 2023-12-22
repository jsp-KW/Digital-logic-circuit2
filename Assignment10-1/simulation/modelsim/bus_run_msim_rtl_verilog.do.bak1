transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment10-1 {C:/intelFPGA_lite/18.1/Assignment10-1/mux2.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment10-1 {C:/intelFPGA_lite/18.1/Assignment10-1/mux2_8bit.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment10-1 {C:/intelFPGA_lite/18.1/Assignment10-1/mux2_32bit.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment10-1 {C:/intelFPGA_lite/18.1/Assignment10-1/mux3_32bit.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment10-1 {C:/intelFPGA_lite/18.1/Assignment10-1/bus_addr.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment10-1 {C:/intelFPGA_lite/18.1/Assignment10-1/bus_arbit.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment10-1 {C:/intelFPGA_lite/18.1/Assignment10-1/bus.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment10-1 {C:/intelFPGA_lite/18.1/Assignment10-1/dff_2bit_r.v}

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment10-1 {C:/intelFPGA_lite/18.1/Assignment10-1/tb_bus.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_bus

add wave *
view structure
view signals
run -all
