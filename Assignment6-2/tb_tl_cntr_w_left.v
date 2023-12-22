`timescale 1ns/100ps

// testbench module name is tb_tl_cntr_w_left
module tb_tl_cntr_w_left;

   reg clk,reset_n,Ta,Tb,Tal,Tbl; // 1bit reg
   wire [1:0]La,Lb;            //2 bit wire
   
   tl_cntr_w_left test_tl_cntr_w_left (clk,reset_n,Ta,Tb,Tal,Tbl,La,Lb);      //test module, use tb_tl_cntr_w_left_struct
   
   //make clock
   always begin
		#10; clk=~clk;
   end
   
   initial begin // start verification
      // reset_n is 0, and init all inputs
      clk=0; reset_n=0; Ta=0; Tb=0; Tal=0; Tbl=0;
      
      // reset_n is 1
      #20; reset_n=1;
      #20; Ta=1; 
      #20; Ta=0; Tal=1; 
      #20; Tal=0; Tb=1;
      #20; Tb=0; Tbl=1;
      #20; Tbl=0;
      
      //reset_n is 0
      #30; reset_n=0;
      
end
endmodule
