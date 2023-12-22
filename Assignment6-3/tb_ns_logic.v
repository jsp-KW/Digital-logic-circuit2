`timescale 1ns/100ps

//next state logic
module tb_ns_logic; // testbench module name is tb_ns_logic;
   
   reg Ta,Tb,Tal,Tbl,Q2,Q1,Q0;      //1 bit reg
   wire D2,D1,D0;                     //1 bit size wire
   
   ns_logic U0_ns_logic(.Ta(Ta),.Tb(Tb),.Tal(Tal),.Tbl(Tbl),.Q2(Q2),.Q1(Q1),.Q0(Q0),.D2(D2),.D1(D1),.D0(D0));      //test module, use ns_logic
   
	// start verificate..
   
   initial begin
      //s0 start..
      Ta=1; Tb=0; Tal=0;Tbl=0; 
		Q2=0; Q1=0; Q0=0;#10; // comeback s0
		
      #10; Q2=0; Q1=0; Q0=0;
		Ta=0; //go s1
      
		//s1
      #10; Q2=0; Q1=0; Q0=1; //s2
		
      
      //s2, TaTalTbTbl x1xx -> come back s2
		//s2, TaTalTbTbl x0xx -> go s3
		
      #10; Q2=0; Q1=1; Q0=0; Ta=0;Tal=1;
      #10; Q2=0; Q1=1; Q0=0; Tal=0;
      
		
		// s3->s4 don'care set
		#10; Q2=0; Q1=1; Q0=1;
      
      //s4 ->s4  Tb =1, come back
		//s4 ->s5  Tb=0, go s5
      #10; Q2=1; Q1=0; Q0=0; Tb=1;
      #10; Q2=1; Q1=0; Q0=0; Tb=0;
      
      //s5 ->s6 don't care set
      #10; Q2=1; Q1=0; Q0=1;
      
      //s6 ->s6 Tbl = 1 
		//s6 ->s7 Tbl = 0
      #10; Q2=1; Q1=1; Q0=0; Tbl=1;
      #10; Q2=1; Q1=1; Q0=0; Tbl=0;
      
      //s7->s0 dont'care set , check don't care is ok to anything value setting
      #10; Q2=1; Q1=1; Q0=1;
		Ta=0; Tb=0; Tal=0; Tbl=0;
		#10;
		
      
   end
   
endmodule
