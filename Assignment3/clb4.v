module clb4 (a,b,ci,c1,c2,c3,co);
	input [3:0] a,b; //4bit input a,b
	input ci;// 1bit input ci -> first carry in
	output c1,c2,c3,co;// 1bit output c1 c2 c3 co
	wire [3:0] g,p; //4bit wire g, p
	//wire signal that propatate result and generate result
	wire w0_c1;
	wire w0_c2, w1_c2;
	wire w0_c3, w1_c3, w2_c3;
	wire w0_co, w1_co, w2_co, w3_co;
	
	// generate  Gi = AiBi
	//4 instance two input and gate instance
	_and2 and0 (.a(a[0]), .b(b[0]), .y(g[0]));
	_and2 and1 (.a(a[1]), .b(b[1]), .y(g[1]));
	_and2 and2 (.a(a[2]), .b(b[2]), .y(g[2]));
	_and2 and3 (.a(a[3]), .b(b[3]), .y(g[3]));
	
	// propagate Pi = Ai + Bi
	// 4 instance two input or gate instance
	_or2 or0 (.a(a[0]), .b(b[0]), .y(p[0]));
 	_or2 or1 (.a(a[1]), .b(b[1]), .y(p[1]));
	_or2 or2 (.a(a[2]), .b(b[2]), .y(p[2]));
	_or2 or3 (.a(a[3]), .b(b[3]), .y(p[3]));
	
	// c1 = G0 +P0C0;
	// 2input and,  2_input or 1 instance
	_and2 c1_and(.a(p[0]), .b(ci), .y(w0_c1));
	_or2  c1_or (.a(g[0]), .b(w0_c1), .y(c1));
	
	
	// c2 = g1 + p1g0 + p1p0ci
	// 2 input and gate, 3 input and gate,  3input or gate instance
	_and2 c2_and2(.a(p[1]), .b(g[0]), .y(w0_c2));
	_and3 c2_and3(.a(p[1]), .b(p[0]), .c(ci), .y(w1_c2));
	_or3 c2_or3(.a(g[1]), .b(w0_c2), .c(w1_c2), .y(c2));
	
	//c3 = g2 + p2c2
	//c3 = g2 + p2g1 + p2p1g0 +p2p1p0ci
	// 2 input, 3 input, 4input and gate, 4 input or gate instance
	_and2 c3_and2(.a(p[2]), .b(g[1]), .y(w0_c3));
	_and3 c3_and3(.a(p[2]), .b(p[1]), .c(g[0]), .y(w1_c3));
	_and4 c3_and4(.a(p[2]), .b(p[1]), .c(p[0]), .d(ci),.y(w2_c3));
   _or4 c3_or4(.a(g[2]), .b(w0_c3), .c(w1_c3), .d(w2_c3), .y(c3));
	
	// co = g3 + p3g2 + p3p2g1 + p3p2p1g0 + p3p2p1p0ci
	//2 input, 3 input, 4input, 5input and gate, 5 input or gate instance
	_and2 co_and2(.a(p[3]), .b(g[2]), .y(w0_co));
	_and3 co_and3(.a(p[3]), .b(p[2]), .c(g[1]), .y(w1_co));
	_and4 co_and4(.a(p[3]), .b(p[2]), .c(p[1]), .d(g[0]), .y(w2_co));
	_and5 co_and5(.a(p[3]), .b(p[2]), .c(p[1]), .d(p[0]), .e(ci), .y(w3_co));
	_or5 co_or5(.a(g[3]), .b(w0_co), .c(w1_co), .d(w2_co), .e(w3_co), .y(co));
	

endmodule

