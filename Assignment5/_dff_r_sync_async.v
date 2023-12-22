module _dff_r_sync_async(clk, reset_n, d, q_sync, q_async);// module name is  _dff_r_sync_async
	input clk, reset_n, d;// 1bit input signal clk, reset_n, d
	output q_sync, q_async;// 1bit output signal q_sync, q_async

	
	// instance module name is U0_dff_r_sync, use _dff_r_sync
	// instance module name is U1_dff_r_async, use _dff_r_async
	
	_dff_r_sync U0_dff_r_sync(.clk(clk), .reset_n(reset_n), .d(d), .q(q_sync));
	_dff_r_async U1_dff_r_async(.clk(clk), .reset_n(reset_n), .d(d), .q(q_async));
	
endmodule




