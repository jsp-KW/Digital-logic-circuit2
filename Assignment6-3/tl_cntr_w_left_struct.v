// module name is tl_cntr_w_left_struct.. 
module tl_cntr_w_left_struct(clk, reset_n, Ta,Tal, Tb, Tbl, La, Lb);

	input clk, reset_n, Ta, Tal, Tb, Tbl;// 1bit input
	
	output [1:0] La,Lb;// 2bit output 
	
	// use _register3_r module instance name is _register3_reset
	_register3_r register3_reset(.clk(clk), .reset_n(reset_n), .D2(D2), .D1(D1), .D0(D0), .Q2(Q2), .Q1(Q1), .Q0(Q0));
	
	//	ns_logic module instance name is next_state_logic
	ns_logic next_state_logic (.Ta(Ta), .Tb(Tb), .Tal(Tal), .Tbl(Tbl), .Q2(Q2), .Q1(Q1), .Q0(Q0), .D2(D2), .D1(D1), .D0(D0));

	//	o_logic module instance name is output_logic
	o_logic output_logic(.Q2(Q2), .Q1(Q1), .Q0(Q0), .La(La), .Lb(Lb));
endmodule
