`timescale 1ns/100ps 
module tb_register8_r; // test bench module name is  tb_register8_r
	reg clk, reset_n; //1bit input
	reg [7:0] d;// 8bit input
	wire [7:0] q; // 8bit output
	
	// instance name is test, use _register8_r
	_register8_r test (clk,reset_n,d,q);
	
	always begin
		#5  clk = ~clk; // set clock
	end
	
	initial begin// start verificate
		clk =1;  reset_n =0; d=8'b00001111; #20;

		d=8'b11110000; #10; 
		
		reset_n =1;//reset off
		 
		d=8'b00011111; #10;
		
		reset_n =0; #15; //reset on
		
		reset_n =1; #20; // reset off
		
		reset_n =0; #10; // reset on
		
		
	end
	
	
endmodule

