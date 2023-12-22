// No carry out full adder module fa_v2

module fa_v2(a,b,ci,s); //module name fa_v2
	input a,b,ci; // input 1bit signal a,b,ci
	output s;// output 1bit signal s;
	wire w0;// wire 1bit w0
	
	// two xor module instance 
	
	_xor2 x1 (.a(a), .b(b), .y(w0)); // instance module name x1, use xor2
	_xor2 x2 (.a(w0), .b(ci), .y(s)); // instance module name x2, use xor2

endmodule
