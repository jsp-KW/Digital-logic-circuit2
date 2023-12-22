transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment8 {C:/intelFPGA_lite/18.1/Assignment8/_dff_r.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment8 {C:/intelFPGA_lite/18.1/Assignment8/register32_8.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment8 {C:/intelFPGA_lite/18.1/Assignment8/gates.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment8 {C:/intelFPGA_lite/18.1/Assignment8/_8_to_1_MUX.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment8 {C:/intelFPGA_lite/18.1/Assignment8/_3_to_8_decoder.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment8 {C:/intelFPGA_lite/18.1/Assignment8/write_operation.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment8 {C:/intelFPGA_lite/18.1/Assignment8/register32_r_en.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment8 {C:/intelFPGA_lite/18.1/Assignment8/Register_file.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment8 {C:/intelFPGA_lite/18.1/Assignment8/read_operation.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment8 {C:/intelFPGA_lite/18.1/Assignment8/fifo.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment8 {C:/intelFPGA_lite/18.1/Assignment8/fifo_out.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment8 {C:/intelFPGA_lite/18.1/Assignment8/fifo_ns.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment8 {C:/intelFPGA_lite/18.1/Assignment8/_register3_r.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment8 {C:/intelFPGA_lite/18.1/Assignment8/mx2_32bits.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment8 {C:/intelFPGA_lite/18.1/Assignment8/_register4_r.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment8 {C:/intelFPGA_lite/18.1/Assignment8/fifo_cal_addr.v}

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/18.1/Assignment8 {C:/intelFPGA_lite/18.1/Assignment8/tb_fifo.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_fifo

add wave *
view structure
view signals
run -all
