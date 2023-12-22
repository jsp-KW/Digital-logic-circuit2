module mx8(a,b,c,d,e,f,g,h,s2,s1,s0,y); 
	input a, b, c, d, e, f, g, h; // 1bit input  a,b,c,d,e,f,g,h
	input s2, s1, s0; // 1bit input  s2, s1, s0
	output y; // 1bit output y
	
	wire w0, w1, w2, w3, w4, w5; // 1 bit wire w0, w1, w2, w3, w4, w5
	
	mx2 u0_mx2(.d0(a), .d1(b), .s(s0), .y(w0)); //instance name u0_mx2, use mx2 module
	mx2 u1_mx2(.d0(c), .d1(d), .s(s0), .y(w1)); //instance name u1_mx2, use mx2 module 
	mx2 u2_mx2(.d0(e), .d1(f), .s(s0), .y(w2)); //instance name u2_mx2, use mx2 module
	mx2 u3_mx2(.d0(g), .d1(h), .s(s0), .y(w3)); //instance name u3_mx2, use mx2 module 
	mx2 u4_mx2(.d0(w0), .d1(w1), .s(s1), .y(w4)); //instance name u4_mx2, use mx2 module 
	mx2 u5_mx2(.d0(w2), .d1(w3), .s(s1), .y(w5)); //instance name u5_mx2, use mx2 module
	mx2 u6_mx2(.d0(w4), .d1(w5), .s(s2), .y(y)); //instance name u6_mx2, use mx2 module
	
endmodule 
