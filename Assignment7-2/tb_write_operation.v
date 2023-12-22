`timescale 1ns/100ps
module tb_write_operation; //testbench module name is  tb_write_operation
	reg tb_we; // 1bit reg 
	reg [2:0] tb_Addr; // 3bit reg
	wire [7:0] tb_wEn; // 8bit wire 
	
	write_operation test (.we(tb_we), .Addr(tb_Addr), .wEn(tb_wEn)); //  use write_operation module.. 

	initial 
		begin // check all case..
			
			tb_we = 1; // we =1, set to write
			tb_Addr = 3'b000; #10; 
			tb_Addr = 3'b001; #10;
			
			tb_we = 0; #10; 	
			tb_Addr = 3'b010; #10;  // not write 010 for address. 00000000
			
			tb_we = 1; // we =1
			tb_Addr = 3'b010; #10; 
			
			tb_Addr = 3'b011; #10; 
			tb_Addr = 3'b100; #10; 
			tb_Addr = 3'b101; #10; 
			tb_Addr = 3'b110; #10; 
			tb_Addr = 3'b111; #10; 
		
			
		end 
endmodule 
