module ns_logic (Ta, Tb, Q1, Q0, D1, D0); //module name is ns_logic, next state logic

	input Ta, Tb, Q1, Q0; //input 1bit
	output D1, D0;// output 1bit 
	
	wire w0,w1,w2,w3,w4,w5; // using 1bit wire
	
	// inverter module use to compute Q1'Q0'Ta'Tb'
	_inv fir_inv(.a(Q1), .y(w0));
	_inv sec_inv(.a(Q0), .y(w1));
	_inv thr_inv(.a(Ta), .y(w2));
	_inv four_inv(.a(Tb),.y(w3));
	//use _xor2 module, make D1
	_xor2 u0(.a(Q1), .b(Q0), .y(D1));
	//make D0, use and3 2, or2 1
	_and3 u1(.a(w0), .b(w1), .c(w2), .y(w4));
	_and3 u2(.a(Q1), .b(w1), .c(w3), .y(w5));
	_or2 u3(.a(w4), .b(w5), .y(D0));
	
endmodule 

	