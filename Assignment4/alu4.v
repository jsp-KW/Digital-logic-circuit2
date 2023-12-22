module alu4(a,b,op,result,c,n,z,v); 
	
	input[3:0] a,b; // 4bit input a,b
	input[2:0] op; // 3bit input op
	
	output[3:0] result; // 4bit output result
	output c,n,z,v; // 1bit ouput  c, n, z, v 
	
	wire[3:0] w_add_b; // 4bit wire w_add_b
	wire[3:0] w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_add; // 4bit wire w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_add
	wire c3_add, co_add; // 1bit wire c3_add, co_add
	
	_inv_4bits u0(.a(a), .y(w_not_a)); // use _inv_4bits module
	_inv_4bits u1(.a(b), .y(w_not_b)); // use _inv_4bits module
	_and2_4bits u2(.a(a),.b(b),.y(w_and)); // use _and2_4bits module
	_or2_4bits u3(.a(a),.b(b),.y(w_or)); // use _or2_4bits module
	_xor2_4bits u4(.a(a),.b(b),.y(w_xor)); //// use _xor2_4bits module
	_xnor2_4bits u5(.a(a),.b(b),.y(w_xnor)); // // use _xnor2_4bits module
	
	
	mx2_4bits u6(.d0(b), .d1(w_not_b), .s(op[0]), .y(w_add_b)); // MUX use mx2_4bits module
	cla4_ov u7(.a(a), .b(w_add_b), .ci(op[0]), .s(w_add), .c3(c3_add), .co(co_add)); // Adder, use cla4_ov module
	mx8_4bits u8(.a(w_not_a), .b(w_not_b), .c(w_and), .d(w_or), .e(w_xor), .f(w_xnor),.g(w_add), .h(w_add), .s2(op[2]), .s1(op[1]), .s0(op[0]), .y(result)); // 8-to-1 MUX

	
	cal_flags4 u9(.op(op), .result(result), .co_add(co_add), .c3_add(c3_add), .c(c), .n(n), .z(z), .v(v)); // setting flags, use cal_flags4 module

endmodule
	
	
	