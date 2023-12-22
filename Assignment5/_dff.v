module _dff(clk,d,q,q_bar); // module name is _dff
	input clk,d;// input signal clk, d
	output q, q_bar;// output signal q, q_bar
	wire clk_bar, w_q;// wire clk_bar w_q
	
	
	_inv u0_inv(.a(clk),.y(clk_bar)); // instance name is u0_inv, use inverter gate module
	_dlatch u1_dlatch(.clk(clk_bar),.d(d),.q(w_q));// instance name is u1_dlatch, use _dlatch module
	_dlatch u2_dlatch(.clk(clk), .d(w_q), .q(q), .q_bar(q_bar)); // instance name is u2_dlatch, use _dlatch module	
	


endmodule
