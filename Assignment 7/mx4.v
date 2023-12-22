module mx4(y,d0,d1,d2,d3,s);// module name is mx4
	input d0,d1,d2,d3;// 1bit input signal
	input [1:0] s;// 2bit output signal 
	output y; //1bit otuput signal
	
	wire w1,w2;
	// module instance name is u0 u1 u2, use mx2 module
	mx2 u0(.d0(d0), .d1(d1), .s(s[0]), .y(w1));
	mx2 u1(.d0(d2), .d1(d3), .s(s[0]), .y(w2));
	mx2 u2(.d0(w1), .d1(w2), .s(s[1]), .y(y));
	
endmodule
