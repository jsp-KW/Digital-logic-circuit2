`timescale 1ns/100ps // setting time scale

module tb_dff_en; // testbench module name is tb_dff_en
    reg tb_clk, tb_en, tb_d;// 1bit reg tb_clk, tb_en, tb_d
    wire tb_q;// 1bit wire tb_q

	 //module instance 
	 // instance name is test_en, use _dff_en module
    _dff_en test_en (.clk(tb_clk), .en(tb_en), .d(tb_d), .q(tb_q));

	 // clock setting
    always begin
        #3 tb_clk = ~tb_clk; 
	 end

   initial begin
    tb_clk = 0; // input init
    tb_en = 0; // tb_en =0
    tb_d = 0;   // tb_d=0

    // Activate the flip-flop and change the d value 
    #1 tb_en = 1; // Enable flip-flop
    #1 tb_d = 1;
    #1 tb_d = 0; 
    #1 tb_d = 1; 
    #1 tb_d = 0; 

    #2 tb_en = 0; // Disable flip-flop
    #1 tb_d = 1;
    #1 tb_d = 1;
	 
    #2 tb_en = 1; // Enable flip-flop
    #1 tb_d = 0; 
    #1 tb_d = 0; 
	 #2 tb_en = 1; 
    #1 tb_d = 1; 
    #1 tb_d = 1;

    
    #20 $stop;
end

endmodule
