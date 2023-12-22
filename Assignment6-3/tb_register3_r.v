`timescale 1ns/100ps

// testbench module name is tb_register3_r
module tb_register3_r;

   reg clk,reset_n,D2,D1,D0;      //1 bit reg
   wire Q2,Q1,Q0;                  //1 bit wire
   
   _register3_r test(.clk(clk),.reset_n(reset_n),.D2(D2),.D1(D1),.D0(D0),.Q2(Q2),.Q1(Q1),.Q0(Q0));      //test module name is test, use _register3_r module
   
   // clock setting
   always begin
		#10; clk=~clk; // period 10
   end
   
   initial begin 
   //init input value 0..
   clk=0; reset_n=0; D2=0; D1=0; D0=0;
   
   // reset_n=1
   #30;    reset_n=1; // Q2 Q1 Q0 is same D2 D1 D0 when reset off.
   #20;    D2=0; D1=0; D0=1;
   #20;    D2=0; D1=1; D0=0;
   #20;    D2=0; D1=1; D0=1;
   #20;    D2=1; D1=0; D0=0;
   #20;    D2=1; D1=0; D0=1;
   #20;    D2=1; D1=1; D0=0;
   #20;    D2=1; D1=1; D0=1;
   #20;
   //reset_n=0;
   reset_n=0;
	$finish;
   end
endmodule