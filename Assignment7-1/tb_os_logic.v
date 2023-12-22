`timescale 1ns/100ps 
module tb_os_logic; // testbench module name tb_cntrt8

	reg tb_inc; // 1bit reg 
	reg [7:0] tb_d_in; // 8bit reg 
	reg [2:0] tb_state; // 3bit reg 
	
	
	wire [7:0] tb_d_out; // 3bit wire 
	
	
	os_logic	test(.state(tb_state), .d_in(tb_d_in), .d_out(tb_d_out)); // testbench for os_logic module
	
	initial //start verificate
		begin 
		tb_state=3'b000; tb_inc=1; tb_d_in=1; #10; // IDLE -> INC
		
		tb_state=3'b010; tb_inc=1; #10; // INC -> INC2
		
		tb_state=3'b011; tb_inc=0;  #10; // INC2 -> DEC
		
		tb_state=3'b100; tb_inc=0; #10; // DEC->DEC2
		
		tb_state=3'b101; tb_inc=0; #10; //DEC2->DEC
		
		$stop; // stop
		end 
endmodule 