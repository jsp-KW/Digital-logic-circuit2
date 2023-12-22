`timescale 1ns/100ps

module tb_o_logic; // testbench module name is tb_o_logic

  reg Q1, Q0;// 1bit reg Q1,Q0
  wire [1:0] La, Lb;// 2bit wire La, Lb

  //instance name is test0, use o_logic
  o_logic test0 (.Q1(Q1), .Q0(Q0), .La(La), .Lb(Lb));

  initial begin // verificate testcase..
    Q1 = 0;
    Q0 = 0;  #5; // La Lb  0010  

    Q1 = 0;
    Q0 = 1; #5; // La Lb = 0110

    Q1 = 1;
    Q0 = 0;#5; // La Lb = 1000

    Q1 = 1;
    Q0 = 1;#5; // La Lb = 1001

    $finish;// finish the simulation
  end

endmodule
