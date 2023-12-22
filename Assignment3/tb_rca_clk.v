`timescale  1ns/100ps

module tb_rca_clk;//testbench module name
	reg clk;// 1bit reg clk
	reg [31:0] tb_a, tb_b;// 32bit reg tb_a,tb_b
	reg tb_ci;// 1bit reg tb_ci
	wire [31:0] tb_s_rca;// 32bit wire 
	wire tb_co_rca;// 1bit wire
	 
	parameter STEP = 10; // step division
	
	// instance name u0_rca_clk, use rca_clk module
	rca_clk u0_rca_clk(.clk(clk), .a(tb_a), .b(tb_b), .ci(tb_ci), .s(tb_s_rca), .co(tb_co_rca));
	
	always #(STEP/2) clk = ~clk; // clk repeat
	
	initial begin// start testcase
		clk = 1'b1;	
		tb_a=32'h00000001; tb_b=32'h00000000; tb_ci=1'b0; #(STEP); //  testcase, check positive edge 
		tb_a=32'h00000001; tb_b=32'h00000001; tb_ci=1'b0; #(STEP); //  testcase, check carry calculate
		tb_a=32'h01010101; tb_b=32'h01010101; tb_ci=1'b1; #(STEP); //  testcase, check all carry out is calculate acurrately
		tb_a=32'h11111111; tb_b=32'h00000001; tb_ci=1'b0; #(STEP); //  testcase, check carry out occur
	   tb_a=32'hffffffff; tb_b=32'h00000000; tb_ci=1'b1; #(STEP); //  testcase, check carry, and s, with carry in
		tb_a=32'hffffffff; tb_b=32'h00000001; tb_ci=1'b0; #(STEP); //  testcase, check carry and s without carry in
		
	end// end block
		
endmodule
