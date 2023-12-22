`timescale 1ns/100ps 

module tb_register32_r_en;
   reg clk;             // 1bit reg
   reg reset_n;         // 1bit reg
   reg en;              // 1bit reg
   reg [31:0] d;        // 32bit reg
   wire [31:0] q;      // 32 bit wire

   // Instantiate the register32_r_en module
   register32_r_en test (.clk(clk),.reset_n(reset_n),.en(en),.d(d),.q(q));

	
   // Clock 
   always begin
      #5 clk = ~clk;
   end
 
 // start verificate
   initial begin
		clk = 0;reset_n = 0; en = 0;
      d = 32'h1234_1234; #5;
	
		reset_n = 1; // reset off
		
      #5; en = 1; // en on..
		
      #10; d = 32'h4567_789A;

      #10; d = 32'hBCDE_F012;
		
      #10; en = 1; reset_n =0; //reset on..
		
      #10; d = 32'h3456_789A;
		 
      #10;  $finish;
		
   end


   
endmodule


