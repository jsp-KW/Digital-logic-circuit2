module _dff_en(clk, en, d, q );// module name is _dff_en
	input clk, en, d;// 1bit input signal clk, en, d
	output q;// 1bit output signal q
	
	wire w_d; // 1bit wire w_d
	
	// module instance
	mx2 u0_mx (.d0(q),.d1(d), .s(en), .y(w_d));// instance name is u0_mx, use mx2
	_dff u1_dff_en (.clk(clk), .d(w_d), .q(q)); // instance name is u1_dff_en, use dff 
	endmodule
	