/*Half Adder module*/
module fa(a,b,ci,s,co); 

	input a,b,ci; // input signal a,b,ci
	output s, co; // output signal s, co
	wire c1,c2,sm; // wire c1, c2, sm
	
	ha _ha1(.a(b), .b(ci), .s(sm), .co(c1)); //instance name _ha1, use half adder module ha
	ha _ha2(.a(a), .b(sm), .s(s), .co(c2)); // instance name _ha2, use half adder module ha
	_or2 _or(.a(c2), .b(c1), .y(co)); // instance name _or2, use _or2 module

endmodule
