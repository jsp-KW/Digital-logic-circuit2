module o_logic (Q1,Q0,La,Lb);// module name is o_logic, output logic
	input Q1, Q0;// input 1bit
	output [1:0] La, Lb;// 2bit output
	
	// instance module..
	// 2 input and + inverter, inverter, 2 input and gate
	
	wire w0;
	
	// make La1
	assign La[1] = Q1;
	// make La0
	_inv inv_la0(.a(Q1), .y(w0));
	_and2 and_la0(.a(w0), .b(Q0), .y(La[0]));
	// make Lb1
	_inv inv_lb1(.a(Q1), .y(Lb[1]));
	//make Lb0
	_and2 and_lb0(.a(Q1), .b(Q0), .y(Lb[0]));
	
endmodule
