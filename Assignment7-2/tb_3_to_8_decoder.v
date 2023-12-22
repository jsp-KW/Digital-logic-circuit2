`timescale 1ns/100ps 
module tb_3_to_8_decoder; // testbench module name  is tb_3_to_8_decoder
	reg [2:0] tb_d; // 3bit reg 
	wire [7:0] tb_q; // 8bit wire 
	
	_3_to_8_decoder test(.d(tb_d), .q(tb_q)); // use _3_to_8_decoder module

	initial 
		begin 
			// check  all 8 case.. 
			
	    	tb_d=3'b000; #10;
			
			tb_d=3'b001; #10;
			
			tb_d=3'b010; #10;
			
			tb_d=3'b011; #10;
			
			tb_d=3'b100; #10;
			
			tb_d=3'b101; #10;
			
			tb_d=3'b110; #10;
			
			tb_d=3'b111; #10;
			
			
		end 
endmodule 
