module _register2_r_async (D1,D0,clk,reset_n, Q1,Q0); // module name is _register2_r_async

	input D1, D0; // input signal D1, D0
	output Q1,Q0;// output signal Q1,Q0
	input clk, reset_n; // input signal clk, reset_n
	// instance module name is state_reg1,2 use _dff_r_async module
	_dff_r_async state_reg1(.clk(clk), .reset_n(reset_n), .d(D1), .q(Q1));
	_dff_r_async state_reg2(.clk(clk), .reset_n(reset_n), .d(D0), .q(Q0));
	
endmodule

	
	
