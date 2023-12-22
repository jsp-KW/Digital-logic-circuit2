`timescale 1ns/100ps

//combinational logic circuit

module tb_o_logic; //testbench module name is tb_o_logic
   
   reg Q2,Q1,Q0;      //1 bit reg
   wire [1:0] La,Lb;      //2 bit wire
   
   o_logic test(.Q2(Q2),.Q1(Q1),.Q0(Q0),.La(La),.Lb(Lb));      //test module
   
   initial begin // output encoded table testcase verificate
             Q2=0;Q1=0;Q0=0; // s0 0011
      #10;   Q2=0;Q1=0;Q0=1; // s1 0111
      #10;   Q2=0;Q1=1;Q0=0; // s2 1011
      #10;   Q2=0;Q1=1;Q0=1; // s3 0111
      #10;   Q2=1;Q1=0;Q0=0; // s4 1100
      #10;   Q2=1;Q1=0;Q0=1; // s5 1101
      #10;   Q2=1;Q1=1;Q0=0; // s6 1110
      #10;   Q2=1;Q1=1;Q0=1; // s7 1101
      #10;
   end
   
endmodule
