module mx2(d0,d1,s,y); // create Mux Module

	input d0,d1,s; // 1bit input signal d0,d1,s
	wire w0,w1,sb; // wire w0,w1,sb create
	output y;//1 bit output signal y
	
	/*module instance and mapping*/
	_inv iv0(.a(s), .y(sb));            //  create iv0 gate module based on _inv ,dot operation named mapping
	
	_nand2 nd20 (.a(d0), .b(sb), .y(w0)); // create nd20 gate module based on _nand2 nd20		
	_nand2 nd21 (.a(d1), .b(s), .y(w1)); //create nd20 gate module based on _nand2 nd21	
	_nand2 nd22 (.a(w0), .b(w1), .y(y)); // create nd20 gate module based on _nand2 nd22	
	
endmodule // finish definite module
