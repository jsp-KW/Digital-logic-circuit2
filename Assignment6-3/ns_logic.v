
// module name ns_logic
// next state logic
module ns_logic (Ta,Tb,Tal,Tbl, Q2,Q1,Q0,D2,D1,D0);

	input Ta,Tb,Tal,Tbl, Q2,Q1,Q0; //1bit input 
	output D2,D1,D0; //1bit output
	
	// inverter output//
	
	wire q2_b,q1_b,q0_b;
	wire Ta_b,Tb_b,Tal_b, Tbl_b;
	
	// D2 1bit wire
	wire D2_w0, D2_w1, D2_w2;
	
	// D1 1bit wire
	wire D1_w0;
	
	// D0 1bit wire
	wire D0_w0, D0_w1, D0_w2,D0_w3;
	
	
	// wire compute, use inverter module..
	_inv Q2_bar(Q2, q2_b);
	_inv Q1_bar(Q1, q1_b);
	_inv Q0_bar(Q0, q0_b);
	
	_inv ta_bar(Ta, Ta_b);
	_inv tb_bar(Tb, Tb_b);
	_inv tal_bar(Tal, Tal_b);
	_inv tbl_bar(Tbl, Tbl_b);
	// 
	
	
	// D2,  Q2'Q1Q0 + Q2Q1' +Q2Q1Q0'
	// make D2 equation
	_and3 d2_u0(q2_b,Q1,Q0,D2_w0);
	_and2 d2_u1(Q2,q1_b,D2_w1);
	_and3 d2_u2(Q2,Q1,q0_b, D2_w2);
	_or3  d2_u3(D2_w0,D2_w1,D2_w2, D2);
	
	
	// D1, Q1 xor Q0
	// make D1 equation
	_xor2 d1_u0(Q1,Q0,D1);
	
	// D0, Q2'Q1'Q0'Ta' + Q2'Q1Q0'Tal' +Q2Q1'Q0'Tb' + Q2Q1Q0'Tbl'
	// make D0 equation
	_and4 d0_u0 (q2_b, q1_b, q0_b, Ta_b, D0_w0);
	_and4 d0_u1 (q2_b, Q1, q0_b, Tal_b, D0_w1);
	_and4 d0_u2 (Q2,q1_b,q0_b,Tb_b, D0_w2);
	_and4 d0_u3 (Q2,Q1,q0_b,Tbl_b,D0_w3);
	_or4 d0_u4 (D0_w0, D0_w1, D0_w2, D0_w3, D0);
	
endmodule
