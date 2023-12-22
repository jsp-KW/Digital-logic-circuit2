module rca32 (a,b,ci,co,s); // module name rca32
	input [31:0] a,b; // 32 bit input signal a,b
	input ci;// 1bit input signal ci
	output co;// 1bit output signal co
	output [31:0] s;// 32 bit output signal s
	wire [7:0] c;// 8bit wire internal carry
	
	
	//instance module
	rca4 u0_rca4 (.a(a[3:0]), .b(b[3:0]), .ci(ci), .co(c[0]), .s(s[3:0])); // instance name u0_rca4,  use rca module
		
	rca4 u1_rca4 (.a(a[7:4]), .b(b[7:4]), .ci(c[0]), .co(c[1]), .s(s[7:4])); // instance name u1_rca4,  use rca module
		
	rca4 u2_rca4 (.a(a[11:8]), .b(b[11:8]), .ci(c[1]), .co(c[2]), .s(s[11:8])); // instance name u2_rca4,  use rca module
		
	rca4 u3_rca4 (.a(a[15:12]), .b(b[15:12]), .ci(c[2]), .co(c[3]), .s(s[15:12])); // instance name u3_rca4,  use rca module
		
	rca4 u4_rca4 (.a(a[19:16]), .b(b[19:16]), .ci(c[3]), .co(c[4]), .s(s[19:16])); // instance name u4_rca4,  use rca module
		
	rca4 u5_rca4 (.a(a[23:20]), .b(b[23:20]), .ci(c[4]), .co(c[5]), .s(s[23:20])); // instance name u5_rca4,  use rca module
		
	rca4 u6_rca4 (.a(a[27:24]), .b(b[27:24]), .ci(c[5]), .co(c[6]), .s(s[27:24])); // instance name u6_rca4,  use rca module
		
	rca4 u7_rca4 (.a(a[31:28]), .b(b[31:28]), .ci(c[6]), .co(co), .s(s[31:28])); // instance name u7_rca4,  use rca module
	
endmodule 

		