`timescale 1ns/100ps 
module tb_cntr8; // module name tb_cntrt8
	reg tb_clk, tb_reset_n, tb_inc, tb_load; // 1bit reg
	reg [7:0] tb_d_in; // 8bit reg 
	wire [7:0] tb_d_out; // 8bit wire 
	wire [2:0] tb_o_state; // 3bit wire 
	
	cntr8	test(.clk(tb_clk), .reset_n(tb_reset_n), .inc(tb_inc), .load(tb_load), .d_in(tb_d_in), .d_out(tb_d_out), .o_state(tb_o_state)); // testbench for cntr8 module
	
	always #5 tb_clk=~tb_clk; // clk setting
	
	initial //start verificate
		begin
		tb_clk=0; tb_reset_n=0; tb_inc=0; tb_load=0; tb_d_in=8'h01; #10; // initial set
		
		tb_reset_n=1; tb_load=0; tb_inc=1; #50; // inc,inc2  inc inc2 inc
		tb_inc=0; #50; // dec, dec2 dec dec2 dec
		
		tb_d_in = 8'h10; tb_load=1; #10; // LOAD
		$stop; 
		end 
endmodule 