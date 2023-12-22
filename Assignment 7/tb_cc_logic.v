`timescale 1ns/100ps
module tb_cc_logic; // testbench module name tb_cc_logic
	reg tb_clk; // 1bit reg
	reg [2:0] tb_op; // 3bit reg 
	reg [1:0] tb_shamt; // 2bit reg 
	reg [7:0] tb_d_in; // 8bit reg 
	reg [7:0] tb_d_out; // 8bit reg
	wire [7:0] tb_d_next; // 8bit wire 

	//use cc_logic module instance name is test
	cc_logic test(.op(tb_op), .shamt(tb_shamt), .d_in(tb_d_in), .d_out(tb_d_out), .d_next(tb_d_next)); // testbench for cc_logic
	
   always #5 tb_clk=~tb_clk; // set clock

	initial 
	begin // verificate start
		tb_clk=1; // initial setting
		tb_d_in=8'b11111111;
		tb_op=3'b001; tb_d_out=3'b00000000; tb_shamt=2'b11; #10; // LOAD, 11111111
		
		tb_op=3'b010; tb_d_out=3'b01010101; tb_shamt=2'b01; #10; // LSL
		
		tb_op=3'b011; tb_d_out=3'b01010101; tb_shamt=2'b10; #10; // LSR
		
		tb_op=3'b100; tb_d_out=3'b01010101; tb_shamt=2'b11; #10; // ASR
		
		tb_op=3'b000; tb_d_out=3'b11110000; #10;  //NOPE
		

		$stop; 
	end 
endmodule 
