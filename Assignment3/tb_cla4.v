`timescale 1ns/100ps// set timescale 1ns/100ps

module tb_cla4; // testbench module name tb_rca4
	reg[3:0] tb_a, tb_b; // 3bit reg 
	reg tb_ci;// 1bit reg
	wire [3:0] tb_s; // 3bit wire
	wire tb_co;// 1bit wire
	
	// instance module name test_rca4, use rca4 module
	cla4 test_cla4(.a(tb_a), .b(tb_b), .ci(tb_ci), .co(tb_co), .s(tb_s));
	
	// directed Verification case ,detail in report 
	
	initial begin 
			  tb_a = 4'b0001; tb_b = 4'b0001; tb_ci = 1'b0; //  carry in 0, check s value co value is correct, case 1,2 check cla adder operate add bits properly.
		#10; tb_a = 4'b0001; tb_b = 4'b0001; tb_ci = 1'b1; //  carry in 1, check s value, co value, is correct,
		
		
		#10; tb_a = 4'b1010; tb_b = 4'b0101; tb_ci = 1'b0; // check all bit value is 1111, carry_in is 0
		#10; tb_a = 4'b1111; tb_b = 4'b0000; tb_ci = 1'b1; // check overflow in cla4
		// unsigned signed case add
		
			
		#10; tb_a=4'b1001; tb_b =4'b0010; tb_ci = 1'b0; //check positive add negative bits
		#10; tb_a=4'b1011; tb_b =4'b1010; tb_ci = 1'b0; //check negativebits add negative bitsoverflow occur, SUM =5, carry_out =1
		#10; tb_a=4'b1001; tb_b =4'b0010; tb_ci = 1'b1; // if ci =1,  test case
		#10; tb_a=4'b1011; tb_b =4'b1010; tb_ci = 1'b1; // if ci =1 , test case
		#10; 
	end
endmodule 
