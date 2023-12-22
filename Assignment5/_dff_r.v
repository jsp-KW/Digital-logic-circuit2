module _dff_r(clk, reset_n, d,q);// module name _dff_r,

	input clk, reset_n, d;// input signal, clk, reset_n, d
	output q;// output signal q
	
	wire w_d; // 1bit wire w_d
	
	// module instance,module instance name is u0and2, u1dff, use and2, _dff module
	_and2 u0and2(.a(d), .b(reset_n), .y(w_d));
	_dff  u1dff (.clk(clk), .d(w_d), .q(q));
	
endmodule
