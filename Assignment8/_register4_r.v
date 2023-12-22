

module _register4_r (clk,reset_n, d, q);// module name is _register4_r

	input clk, reset_n; //1bit input
	input [3:0] d;// 4bit input
	output [3:0] q;// 4bit output
	
	// instance module name is u0,u1,u2
	// use _dff_r module
	
	_dff_r u0 (clk,reset_n,d[0],q[0]);
	
	_dff_r u1 (clk,reset_n,d[1],q[1]);
	
	_dff_r u2 (clk,reset_n,d[2],q[2]);
		
	_dff_r u3 (clk,reset_n,d[3],q[3]);
	
endmodule

