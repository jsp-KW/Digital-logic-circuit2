`timescale  1ns/100ps // setting timescale 10ns

module tb_cla_clk; // testbench module name tb_cla_clk
	reg clk;// register clk
	reg [31:0] tb_a, tb_b; // register 32bit tb_a, tb_b
	reg tb_ci;// register tb_ci
	wire [31:0] tb_s_cla;// wire 32bit tb_s_cla
	wire tb_co_cla;// 1bit wire tb_co_cla
	
	parameter STEP = 10; //parameter clk step
	
	cla_clk u0_cla_clk(.clk(clk), .a(tb_a), .b(tb_b), .ci(tb_ci), .s(tb_s_cla), .co(tb_co_cla));
	
	always #(STEP/2) clk = ~clk;//clock period setting
	
	initial begin
		clk = 1'b1;	
		tb_a=32'h00000001; tb_b=32'h00000000; tb_ci=1'b0; #(STEP); //  testcase, check positive edge 
		tb_a=32'h00000001; tb_b=32'h00000001; tb_ci=1'b0; #(STEP); //  testcase, check carry calculate
		tb_a=32'h01010101; tb_b=32'h01010101; tb_ci=1'b1; #(STEP); //  testcase, check all carry out is calculate acurrately
		tb_a=32'h11111111; tb_b=32'h00000001; tb_ci=1'b0; #(STEP); //  testcase, check carry out occur
	   tb_a=32'hffffffff; tb_b=32'h00000000; tb_ci=1'b1; #(STEP); //  testcase, check carry, and s, with carry in
		tb_a=32'hffffffff; tb_b=32'h00000001; tb_ci=1'b0; #(STEP); //  testcase, check carry and s without carry in
		
	end
		
endmodule
