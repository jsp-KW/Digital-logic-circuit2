
`timescale 1ns/100ps //set timescale, unit/precision

module tb_rca32; // module name, tb_cla32
	reg [31:0] tb_a, tb_b; // register 32bit tb_a, tb_b
	reg tb_ci; // register 1bit tb_ci
	wire [31:0] tb_s; // 32bit wire tb_s
	wire tb_co; // 1bit wire tb_co

	
	rca32  test_cla32(.co(tb_co), .s(tb_s), .a(tb_a), .b(tb_b), .ci(tb_ci)); // use cla32 module
	
	initial begin // verificate testcase
		tb_a=32'h00000000; tb_b=32'h00000000; tb_ci=1'b1; #10; // testcase, check first carry in
		tb_a=32'h00000001; tb_b=32'h00000000; tb_ci=1'b0; #10; //testcase, sum is correct?
		tb_a=32'h00000001; tb_b=32'h00000001; tb_ci=1'b0; #10; // testcase, carry is correctly occur?
		tb_a=32'hffffffff; tb_b=32'h00000000; tb_ci=1'b1; #10; // testcase, 32bit over, is correctly carry out occur?
		tb_a=32'b01010101010101010101010101010101; tb_b=32'b10101010101010101010101010101010; tb_ci=1'b0; #10; // test case all bits are 1
		tb_a=32'b01010101010101010101010101010101; tb_b=32'b10101010101010101010101010101010; tb_ci=1'b1; #10; // test case carry out, s occur)
	
		
	end 
endmodule 