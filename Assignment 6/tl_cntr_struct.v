module tl_cntr_struct (clk, reset_n, Ta, Tb, La, Lb); // module name is tl_cntr_struct
	input clk, reset_n, Ta, Tb;// 1bit input signals
	output [1:0] La, Lb;// 2ibt output signals
	wire D1,D0,Q1,Q0;// 1bit wires
	//ns_logic, instance name is cntr_ns_logic
	
	ns_logic cntr_ns_logic (.Q1(Q1), .Q0(Q0), .Ta(Ta), .Tb(Tb), .D1(D1), .D0(D0));
	
	//_register2_r_async, instance name is  cntr_reg
	_register2_r_async cntr_reg(.D1(D1), .D0(D0), .clk(clk), .reset_n(reset_n), .Q1(Q1), .Q0(Q0));
	//o_logic, instance name is cntr_output
	o_logic cntr_output (.Q1(Q1), .Q0(Q0), .La(La), .Lb(Lb));
	
endmodule
