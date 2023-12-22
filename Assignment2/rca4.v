module rca4(a,b,ci,co,s);
	input [3:0] a,b;// input signal 4bit a,b
	input ci;// input ci
	output [3:0] s;// output signal 4bit s
	output co;// output co
	wire [2:0] c;// 3bit wire c
	
	//module instance
	//first instance's co value connects next instance's ci(carry in)
	//and next instance's co value connects next instance's ci too.
	// 4bit rca is can be distinguished by its connected structure
	
	fa _fa0(.a(a[0]), .b(b[0]), .ci(ci), .co(c[0]), .s(s[0])); //instance name _fa0, use fa module
	
	fa _fa1(.a(a[1]), .b(b[1]), .ci(c[0]), .co(c[1]), .s(s[1])); // instance name _fa1, use fa module
	
	fa _fa2(.a(a[2]), .b(b[2]), .ci(c[1]), .co(c[2]) , .s(s[2]));// instance name _fa2, use fa module
	
	fa _fa3(.a(a[3]), .b(b[3]), .ci(c[2]), .co(co) , .s(s[3]));// instance name _fa3, use fa module
	
endmodule
