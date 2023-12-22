module cla8(a,b,ci,s,co); // module name is cla8

// inc ==0 or inc ==1 calculate result value 

	input[7:0]  a,b; // 8bit input
	input ci;// 1bit input
	
	output [7:0] s;// 8bit output
	output co; // 1bit output
	
	wire c1;// 1bit wire
	
	// use cla4 module instance name u0 u1
	cla4 u0 (.a(a[3:0]), .b(b[3:0]), .ci(ci), .s(s[3:0]), .co(c1));
	cla4 u1 (.a(a[7:4]), .b(b[7:4]), .ci(c1), .s(s[7:4]), .co(co));
	
	
endmodule

