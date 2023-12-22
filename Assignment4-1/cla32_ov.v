module cla32_ov(a, b, ci, s, co_prev, co);
input [31:0] a, b; //32 bit input a,b
input ci;// 1bit input ci
output [31:0] s; // 32bit output s
output co_prev; // 1bit output co_prev
output co;// 1bit output co

wire c1,c2,c3,c4,c5,c6,c7; // 1bit wire c1,c2,c3,c4,c5,c6,c7

//module instance
	cla4	U0_cla4	(.a(a[3:0]),	.b(b[3:0]),	.ci(ci), .s(s[3:0]),	.co(c1)); // instance name  U0_cla4, use module cla4
	cla4	U1_cla4	(.a(a[7:4]),	.b(b[7:4]),	.ci(c1), .s(s[7:4]),	.co(c2)); // instance name  U1_cla4, use module cla4
	cla4	U2_cla4	(.a(a[11:8]), .b(b[11:8]), .ci(c2), .s(s[11:8]), .co(c3)); // instance name  U2_cla4, use module cla4
	cla4	U3_cla4	(.a(a[15:12]), .b(b[15:12]), .ci(c3), .s(s[15:12]), .co(c4)); // instance name  U3_cla4, use module cla4
	cla4	U4_cla4	(.a(a[19:16]), .b(b[19:16]), .ci(c4), .s(s[19:16]), .co(c5)); // instance name  U4_cla4, use module cla4
	cla4	U5_cla4	(.a(a[23:20]), .b(b[23:20]), .ci(c5), .s(s[23:20]), .co(c6)); // instance name  U5_cla4, use module cla4
	cla4	U6_cla4	(.a(a[27:24]), .b(b[27:24]), .ci(c6), .s(s[27:24]), .co(c7)); // instance name  U6_cla4, use module cla4
	cla4_ov U7_cla4_ov  (.a(a[31:28]), .b(b[31:28]), .ci(c7), .s(s[31:28]), .c3(co_prev),.co(co)); // instance name U7_cla4_ov, use module cla4_ov
	
endmodule
