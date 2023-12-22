module _nand2(a,b,y); // create nand gate module Two Inputs, One Output

	input a,b; 			// create 1bit input signals, definite variable name a,b 
	output y; 			// create 1bit output signal y
	assign y = ~(a & b); 	// assign value to y after NAND operation

endmodule // finish definite module


module _inv(a,y); // create inverter gate Module One Input, One Output

	input a; 		// create 1bit input signal , definite variable a
	output y; 		// create 1bit output variable name definite
	assign y = ~a; // assign value to y after NOT operation
	
endmodule // finish definite module
