module _register8 (clk, d, q);// module name is _register8

	input clk; // 1bit input signal clk
	input [7:0] d;// 8bit input signal d
	input [7:0] q;// 8bit input signal q
	
	
	
	_dff u0_dff (.clk(clk), .d(d[0]), .q(q[0])); // instance name is u0_dff, use _dff module
	_dff u1_dff (.clk(clk), .d(d[1]), .q(q[1])); // instance name is u1_dff, use _dff module
	_dff u2_dff (.clk(clk), .d(d[2]), .q(q[2]));// instance name is u2_dff, use _dff module
	_dff u3_dff (.clk(clk), .d(d[3]), .q(q[3]));// instance name is u3_dff, use _dff module
	_dff u4_dff (.clk(clk), .d(d[4]), .q(q[4]));// instance name is u4_dff, use _dff module
	_dff u5_dff (.clk(clk), .d(d[5]), .q(q[5]));// instance name is u5_dff, use _dff module
	_dff u6_dff (.clk(clk), .d(d[6]), .q(q[6]));// instance name is u6_dff, use _dff module
	_dff u7_dff (.clk(clk), .d(d[7]), .q(q[7]));// instance name is u7_dff, use _dff module
	
endmodule
