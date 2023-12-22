`timescale 1ns/100ps

module tb_ns_logic;// testbench module name is tb_ns_logic
	reg Ta, Tb, Q1, Q0; // 1bit reg
	wire D1, D0;// 1bit wire
	
	//instance name is test_ns, use ns_logic
	ns_logic test_ns (.Ta(Ta), .Tb(Tb), .Q1(Q1), .Q0(Q0), .D1(D1), .D0(D0));

	
	initial begin // start verificate testcases
	
	// q1q0 00 
	
	Q1 =0; Q0 = 0;
	// d1d0= 01
	Ta =0; Tb = 0; #10;
	Ta =0; Tb = 1; #10;
	//d1d0 =00 
	Ta =1; Tb = 0; #10;
	Ta =1; Tb = 1; #10;
	
	//d1d0 =10, q1q0 01
	Q1 =0; Q0 =1; 	
	Ta =0; Tb = 0; #10;
	Ta =0; Tb = 1; #10;
	Ta =1; Tb = 0; #10;
	Ta =1; Tb = 1; #10;
	
	//d1d0 =11, q1q0 10
	Q1=1; Q0=0;
	Ta=1; Tb=0; #10;
	Ta=0; Tb=0;  #10;
	
	//d1d0 =10, q1q0 =10
	Q1 =1; Q0 =0;
	Ta =1; Tb = 1; #10;
	Ta =0; Tb = 1; #10;
	
	//d1d0 =00, q1q0 =11
	Q1 =1; Q0 =1;
	Ta =0; Tb = 0; #10;
	Ta =0; Tb = 1; #10;
	Ta =1; Tb = 0; #10;
	Ta =1; Tb = 1; #10;
	
	end
endmodule
