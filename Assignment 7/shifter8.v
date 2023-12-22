module shifter8 (clk, reset_n, op, shamt, d_in,d_out); // module name is shifter8

	
	// denitie input signal//
	input clk, reset_n;
	
	input [2:0] op; //3bit opcode, what to do
	input [1:0] shamt;// 2 bit input, 2bits -> can range 0~3 shift 
	input [7:0] d_in; // when op LOAD, store value into register
	
	output [7:0] d_out; // 8bit output d_out
	
	wire[7:0] d_next; // 8bit wire
	
	// use cc_logic, _register8_r module.
	cc_logic u0(.op(op), .shamt(shamt), .d_in(d_in), .d_out(d_out), .d_next(d_next));
	_register8_r r8 (.clk(clk), .reset_n(reset_n), .d(d_next),.q(d_out));
	
	
endmodule
