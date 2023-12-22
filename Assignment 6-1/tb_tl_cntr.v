`timescale 1ns/100ps

//tl_cntr testbench module
module tb_tl_cntr;
	
	reg tb_clk, tb_reset_n; // reg 1bit
	reg tb_Ta, tb_Tb;// reg 1bit
	
	wire [1:0] tb_La, tb_Lb; // 2 bit wire
	
	// instance name is test, use tl_cntr module
	tl_cntr test (.clk(tb_clk), .reset_n(tb_reset_n), .Ta(tb_Ta), .Tb(tb_Tb), .La(tb_La), .Lb(tb_Lb));
	
	// clock setting
	always 
		begin
			tb_clk = ~tb_clk; #5; 
		end

		 initial begin
      //when reset_n is 0
      tb_clk=0; tb_reset_n=0; tb_Ta=0; tb_Tb=0; // reset is 0.. 
      
      //when reset_n is 1
      #10; tb_reset_n=1;
      #10; tb_Ta=1; // s0
      #10; tb_Ta=0; // s1
      #10; tb_Tb=1;// s2
      #10; tb_Tb=0; // s3
      
		tb_reset_n = 0; //s0 and finish
		$finish;// finish the simulation..
   end

endmodule

		