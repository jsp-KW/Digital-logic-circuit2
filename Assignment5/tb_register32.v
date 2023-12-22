`timescale 1ns/100ps
module tb_register32; // module name tb_register32
	
	reg clk; // 1bit reg clk
	reg [31:0] tb_d; // 32bit reg tb_d
	wire [31:0] tb_q; // 32bit wire tb_q
	
	_register32 test_reg32(.clk(clk), .d(tb_d), .q(tb_q)); // testbench for module _register32
	
	always // set clock period
		begin 
			#5 clk = ~clk;
		end 
	
	initial // start verificate
		begin // begin block
		clk = 0;
		tb_d = 32'h5A5A5A5A; #4; // store hexadecimal value to tb_d
		tb_d = 32'hFFFF0000; #4; // store hexadecimal value to tb_d
		tb_d = 32'h6A6A6A7A; #4; // store hexadecimal value to tb_d
		tb_d = 32'hF1F1F1F1; #4; // store hexadecimal value to tb_d
		tb_d = 32'h11111110; #4; // store hexadecimal value to tb_d
		tb_d = 32'hCDCDCDCD; #4; // store hexadecimal value to tb_d
		tb_d = 32'hDCDCDCDC; #4; // store hexadecimal value to tb_d
		tb_d = 32'hE0E0E0E0; #4; // store hexadecimal value to tb_d
		#3; $stop; 
		end // end block
		
endmodule 
