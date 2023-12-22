`timescale 1ns/100ps
module tb_multiplier; //testbench module name is tb_multiplier
	reg tb_clk, tb_reset_n; //1bit reg 
	reg [63:0] tb_multiplier;// 64bit reg
	reg [63:0] tb_multiplicand; // 64bit reg
	reg tb_op_start, tb_op_clear; // 1bit reg 
	wire 	tb_op_done; // 1bit wire
	wire	[127:0] result; // 128bit wire
	
	
	parameter STEP = 10; //step =10

	//instance of multiplier
	multiplier test_multiplier(.clk(tb_clk),.reset_n(tb_reset_n),.multiplier(tb_multiplier), .multiplicand(tb_multiplicand),.op_start(tb_op_start),.op_clear(tb_op_clear),.op_done(tb_op_done),.result(result));
								
	always #(STEP/2) tb_clk = ~tb_clk;//clock setting
									
	initial begin
		tb_clk = 0; tb_reset_n=0; tb_op_start=0; tb_op_clear=0;  tb_multiplier=64'h0; tb_multiplicand=64'h0;
		#1000;tb_reset_n =1;
		
		#3; tb_multiplier = 13; tb_multiplicand = 15;
		#5; tb_op_clear = 0; tb_op_start = 1;
		
		#1000; tb_op_clear = 1;
		#3; tb_multiplier = -15; tb_multiplicand = -13;
		#5; tb_op_clear = 0; tb_op_start = 1;
	
		#1000; tb_op_clear = 1;
		#5; tb_multiplier = 22; tb_multiplicand = -3;
		#5; tb_op_clear = 0; tb_op_start = 1;
		
		#1000; tb_op_clear = 1;
		#10; tb_multiplier = -14; tb_multiplicand = 14;
		#5; tb_op_clear = 0; tb_op_start = 1;
		
		#1000; $stop;
	end

endmodule