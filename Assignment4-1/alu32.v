module alu32(a,b,op,result,c,n,z,v);

	input [31:0] a,b; // 32bit input a, b
	input [2:0] op; // 3bit input op
	output [31:0] result; // 32bit output result
	output c,n,z,v; // 1bit output c,n,z,v(flags)
	wire [31:0] w_add_b; // 32bit wire w_add_b
	wire [31:0] w_not_a,w_not_b, w_and, w_or, w_xor, w_xnor, w_add; // 32bit wire w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_add
	wire co_prev, co_add; // 1bit wire co_prev, co_add

	_inv_32bits _inv_32bits_u0(.a(a),.y(w_not_a)); // instance name _inv_32bits_u0
	_inv_32bits _inv_32bits_u1(.a(b),.y(w_not_b)); // instance name _inv_32bits_u1
	
	_and2_32bits _and2_32bits_u2(.a(a),.b(b),.y(w_and)); // instance name _and2_32bits_u2
	_or2_32bits _or2_32bits_u3(.a(a),.b(b),.y(w_or)); // instance name _or2_32bits_u3
	_xor2_32bits _xor2_32bits_u4(.a(a),.b(b),.y(w_xor)); // instance name _xor2_32bits_u4
	_xnor2_32bits _xnor2_32bits_u5(.a(a),.b(b),.y(w_xnor)); // instance name _xnor2_32bits_u5

	mx2_32bits mx2_32bits_u6(.d0(b),.d1(w_not_b),.s(op[0]),.y(w_add_b)); //instance name mx2_32bits_u6
	
	cla32_ov cla32_ov_u7(.a(a),.b(w_add_b),.ci(op[0]),.s(w_add),.co_prev(co_prev),.co(co_add)); //instance name cla32_ov_u7
	mx8_32bits mx8_32bits_u8(.a(w_not_a),.b(w_not_b),.c(w_and),.d(w_or),.e(w_xor),.f(w_xnor),.g(w_add), .h(w_add),.s2(op[2]), .s1(op[1]), .s0(op[0]), .y(result)); // instance name mx8_32bits_u8
	
	cal_flags32 cal_flags32_u9(.op(op),.result(result),.co_add(co_add),.co_prev_add(co_prev),.c(c),.n(n),.z(z),.v(v)); //instance name cal_flags32_u9

endmodule 
