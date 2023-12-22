module ha(a,b,s,co);
	input a,b;// input a,b
	output s, co;  // output s, carry out co;

	// and gate 1, xor gate 1;	
	
	_and2 CO(.a(a), .b(b), .y(co));// instance name CO, use module _and2
	_xor2 S(.a(a),.b(b), .y(s)); // instance name S, use module _xor2
		
endmodule

