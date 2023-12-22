module o_logic(Q2,Q1,Q0,La,Lb); // module name o_logic, output logic
	input Q2,Q1,Q0; //input Q2,Q1,Q0
	output [1:0] La,Lb;// output 2bit La, Lb
	wire w1,w2,w3,w4,w5;// 1bit wire
	
	// Q2' Q1', Q0'
	_inv u0(.a(Q2),.y(w1));
	_inv u1(.a(Q1),.y(w2));
	_inv u2(.a(Q0),.y(w3));
	
	//Q1Q0' +Q2 =LA[1]
	_and2 u3(.a(Q1), .b(w3), .y(w4));
	_or2 u4(.a(w4), .b(Q2), .y(La[1]));

	//Q0+Q2= LA[0]
	_or2 u5 (.a(Q0), .b(Q2), .y(La[0]));
	
	//Q2' +Q1Q0'=LB[1]
	_and2 u6(.a(Q1), .b(w3), .y(w5));
	_or2 u7(.a(w1), .b(w5), .y(Lb[1]));
	
	//Q2' + Q0 = LB[0]
	_or2 u8(.a(w1) ,.b(Q0), .y(Lb[0]));
	
endmodule

