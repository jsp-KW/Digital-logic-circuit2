`timescale 1ns/100ps
 
 module tb_cla8; // testbench module name is tb_cla8
 
   reg [7:0] tb_a, tb_b; // 8bit reg
   reg tb_ci; // 1bit reg
   wire [7:0] tb_s; // 8bit wire
   wire tb_co; // 1bit wire

	//use cla8 module,
   cla8 test_cla8(.co(tb_co), .s(tb_s), .a(tb_a), .b(tb_b), .ci(tb_ci));

   initial begin
		// first carry in
      tb_a = 8'h00;
      tb_b = 8'h00;
      tb_ci = 1'b1;
      #10;
		
		// Sum is correct
      tb_a = 8'h01;
      tb_b = 8'h00;
      tb_ci = 1'b0;
      #10;
		
		 // Carry 
      tb_a = 8'h01;
      tb_b = 8'h01;
      tb_ci = 1'b0;
      #10;
		
		
		//Overflow
      tb_a = 8'hFF;
      tb_b = 8'h00;
      tb_ci = 1'b1;
      #10;
		
		
		//  All bits are 1
      tb_a = 8'b01010101;
      tb_b = 8'b10101010;
      tb_ci = 1'b0;
      #10;
		
		// Carry out 
      tb_a = 8'b01010101;
      tb_b = 8'b10101010;
      tb_ci = 1'b1;
      #10;
		
		 $finish;
   end

endmodule
