module _register32(clk, d,q);// module name is _register32
	input clk;// 1bit input signal clk
	input [31:0] d;// 32bit input signal d
	output [31:0] q;// 32bit input signal q
	
	
	_register8 u0_register8 (.clk(clk), .d(d[7:0]), .q(q[7:0])); //instance name is  u0_register8, use _register8 module
	_register8 u1_register8 (.clk(clk), .d(d[15:8]), .q(q[15:8]));//instance name is  u1_register8, use _register8 module
	_register8 u2_register8 (.clk(clk), .d(d[23:16]), .q(q[23:16]));//instance name is  u2_register8, use _register8 module
	_register8 u3_register8 (.clk(clk), .d(d[31:24]), .q(q[31:24]));//instance name is  u3_register8, use _register8 module
	
endmodule // endmodule
