`timescale 1ns/100ps 

//testbench module name is  tb_register2_r_async
module tb_register2_r_async;

  reg D1, D0, clk, reset_n; // 1bit reg 
  wire Q1, Q0;// 1bit wire

  // module instance name is test, use  _register2_r_async
   _register2_r_async test (.D1(D1), .D0(D0), .clk(clk), .reset_n(reset_n), .Q1(Q1), .Q0(Q0));

	always begin // making clock
		clk = ~clk; #5;
		end
		
	initial begin // start test verificate.
    D1 = 0;
    D0 = 0;
    clk = 0;
    reset_n = 0;
    // if reset_n =0, q1q0 = 00
    #10;   

    D1 = 1; D0 = 0; #10;

    D1 = 0; D0 = 1;
    #10;
	 
	 
    D1 = 1; D0 = 1;
    #10;
	 
	 //reset_n =1 , q1q0 = d1d0 value same

	 reset_n =1;
    D1 = 1; D0 = 0;#10;

    
	 D1 = 0; D0 = 1;
    #10;

	 
    D1 = 1; D0 = 1;
    #10;


	 end 
endmodule
