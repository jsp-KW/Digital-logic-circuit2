/* inverter gate module 1 input, 1 output */
module _inv(a,y);
	input a; // input signal a
	output y;// output signal y
	assign y = ~a; // not operation and assign
endmodule


/*nand gate module 2 input, 1 output */
module _nand2(a,b,y);
	input a,b; //input signal a,b
	output y;// output signal b
	assign y = ~(a&b);// nand operation and assign
endmodule


/* and gate module 2 input, 1 output */
module _and2 (a,b,y);
	input a,b; // input signal a,b
	output y; // output signal y
	assign y= a&b; // and operation and assign
endmodule


/*or gate module 2 input, 1 output */
module _or2(a,b,y);
	input a,b; // input signal a,b
	output y;// output signal y
	assign y = a|b; // or operation and assign
endmodule



/* xor gate module (2 inverter, 2 and, 1 or gate) */

module _xor2(a,b,y);
	input a,b;// input signal a,b
	output y; // output signal y
	wire inv_a, inv_b; // 1bit wire, to connect Inverter and And gate
	wire w0,w1;// wire 1 bit , to connect and gate and or gate
	
	// Instance inverter,and, or gate
	//a'b +ab' 
	
	
	_inv _inv1(.a(a), .y(inv_a)); // instance name _inv1, use _inv module
	_inv _inv2(.a(b), .y(inv_b));// instance name _inv2, use _inv module
	
	// and1 -> a'b and2 -> ab'
	_and2 _and1(.a(inv_a), .b(b), .y(w0)); // instance name _and1, use _and2 module
	_and2 _and2(.a(inv_b), .b(a), .y(w1)); // instance name _and2, use _and2 module
	
	
	_or2 _or(.a(w0), .b(w1), .y(y)); // instance name _or, use _or2 module
	
endmodule


