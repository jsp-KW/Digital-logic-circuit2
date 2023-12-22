`timescale 1ns/100ps // timescale setting

module tb_dff_r_sync_async;// testbench module name is tb_dff_r_sync_async
  reg clk, reset_n, d;// 1bit reg clk, reset_n, d 
  wire q_sync, q_async;// 1bit wire q_sync, q_async
  
  // instance module name is U0_dff_r_sync, use _dff_r_sync module
  
  // instance module name is U1_dff_r_async, use _dff_r_async module
  _dff_r_sync U0_dff_r_sync(.clk(clk), .reset_n(reset_n), .d(d), .q(q_sync));
  _dff_r_async U1_dff_r_async(.clk(clk), .reset_n(reset_n), .d(d), .q(q_async));

  always #10 clk = ~clk; //clk period set

  initial begin
   // initialize data input
    clk = 0;// clk init
    reset_n = 1; //reset_n =1 setting
    d = 0;
    #5 d = 0;
    #5 d = 1;
    #5 d = 0;
    #5 d = 1;
	 // reset_n =0 setting
    reset_n = 0;
    d = 1;
    #5 d = 0;
    #5 d = 1;
	 #5 d = 0;
    #5 d = 1;
	 

    //reset_n =1 setting
    reset_n = 1;

 
    #5 d = 0;
    #5 d = 1;
	 #5 d = 0;
	 #5 d = 1;
	 
    $stop; // finish simulation
  end
endmodule
