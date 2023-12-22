module cla32 (a,b,ci,co,s);// module name cla32
	input [31:0] a,b;// 32bit input signal a,b
	input ci;// 1bit output signal
	output co;// 1bit output signal
	output [31:0] s;// 32bit output signal
	wire [7:0] c;//8 bit internal carry wire signal
	
	/*module instance*/
	
	cla4 U0_cla4 (.a(a[3:0]), .b(b[3:0]) , .ci(ci) , .s(s[3:0]), .co(c[0]));// instance  U0_cla4, use cla4 module
	cla4 U1_cla4 (.a(a[7:4]), .b(b[7:4]) , .ci(c[0]) , .s(s[7:4]), .co(c[1]));// instance U1_cla4, use cla4 module
	cla4 U2_cla4 (.a(a[11:8]), .b(b[11:8]) , .ci(c[1]) , .s(s[11:8]), .co(c[2]));// instance U2_cla4, use cla4 module
	cla4 U3_cla4 (.a(a[15:12]), .b(b[15:12]) , .ci(c[2]) , .s(s[15:12]), .co(c[3]));// instance U3_cla4, use cla4 module
	cla4 U4_cla4 (.a(a[19:16]), .b(b[19:16]) , .ci(c[3]) , .s(s[19:16]), .co(c[4]));// instance U4_cla4, use cla4 module
	cla4 U5_cla4 (.a(a[23:20]), .b(b[23:20]) , .ci(c[4]) , .s(s[23:20]), .co(c[5]));// instance U5_cla4, use cla4 module
	cla4 U6_cla4 (.a(a[27:24]), .b(b[27:24]) , .ci(c[5]) , .s(s[27:24]), .co(c[6]));// instance U6_cla4, use cla4 module
	cla4 U7_cla4 (.a(a[31:28]), .b(b[31:28]) , .ci(c[6]) , .s(s[31:28]), .co(co));// instance U7_cla4, use cla4 module

endmodule

