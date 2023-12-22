module cla4 (a,b,ci,s,co);// module name cla4
	input [3:0] a,b;// 4bit input signal a,b
	input ci;// 1bit input signal ci
	output[3:0] s;// 4bit output signal s
	output co;// 1bit output signal co
	
	wire [2:0] c; //3bit carry wire
	
	
	fa_v2 U0_fa_v2 (.a(a[0]),  .b(b[0]) , .ci(ci), .s(s[0])); // instance name U0_fa_v2, use fa_v2 module
	fa_v2 U1_fa_v2 (.a(a[1]), .b(b[1]), .ci(c[0]), .s(s[1])); // instance name U1_fa_v2, use fa_v2 module
	fa_v2 U2_fa_v2 (.a(a[2]), .b(b[2]), .ci(c[1]), .s(s[2])); // instance name U2_fa_v2, use fa_v2 module
	fa_v2 U3_fa_v2 (.a(a[3]), .b(b[3]), .ci (c[2]), .s(s[3])); // instance name U3_fa_v2, use fa_v2 module
	clb4	U4_clb (.a(a[3:0]), .b(b[3:0]), .ci(ci), .co(co), .c1(c[0]), .c2(c[1]), .c3(c[2])); // instance name U4_clb, use clb4 module


endmodule 

