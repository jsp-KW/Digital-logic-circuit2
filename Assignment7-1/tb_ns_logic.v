`timescale 1ns/100ps
module tb_ns_logic; // testbench module name tb_ns_logic

	reg tb_inc, tb_load; // 1bit reg
	reg [2:0] tb_state; // 3bit reg 
	wire [2:0] tb_next_state; // 2bit wire
	
	ns_logic	test(.load(tb_load), .inc(tb_inc), .state(tb_state), .next_state(tb_next_state)); // testbench for ns_logic module
	
	initial //start verificate 
		begin 
		
			tb_state=3'b000; tb_load=0; tb_inc=1; #10; // IDLE -> INC 010
			 
			 
			tb_state=3'b010; tb_inc=1; #10; // INC -> INC2 011

			
			tb_state=3'b011; tb_inc=0;  #10; // INC2 -> DEC 100
			
			
			tb_state=3'b100; tb_inc=0; #10; // DEC-> DEC2 101
			
			
			tb_state=3'b101; tb_inc=0; #10; // DEC2-> DEC 100
			
			tb_load=1; #10; // DEC2->LOAD 001
		
		$stop; // stop
		end 
endmodule 