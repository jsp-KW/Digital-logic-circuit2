`timescale 1ns/100ps 

//testbench module name is tb_fifo
module tb_fifo;
   
   reg clk,reset_n,rd_en,wr_en; // 1bit reg
   reg [31:0] d_in;// 32bit reg
   wire [31:0] d_out;// 32bit wire
   wire full,empty,wr_ack,wr_err,rd_ack,rd_err; //1bit wire
   wire [3:0] data_count; //4bit wire
   
   //clock setting
   always begin
      #10; clk=~clk;
   end
   
	// module instance, use fifo module, name is test_fifo
   fifo test_fifo(clk,reset_n,rd_en,wr_en,d_in,d_out,full,empty,wr_ack,wr_err,rd_ack,rd_err,data_count);      //test module
   
	// verificate testcase
	
   initial begin
      clk=0; reset_n=0; rd_en=0; wr_en=0; d_in=32'h0;
      
		#15; reset_n=1; #20; rd_en=1; // read
		
		//write
      #20; rd_en=0; wr_en=1; d_in=32'hAAAAAAAA;
      #20; d_in=32'hBBBBBBBB;
      #20; d_in=32'hCCCCCCCC;
      #20; d_in=32'hDDDDDDDD;
      #20; d_in=32'hEEEEEEEE;
      #20; d_in=32'hFFFFFFFF;
      #20; d_in=32'hABABABAB;
      #20; d_in=32'hACACACAC; 
		
		#20; wr_en=0; // stop write, check data_count, full
		
      #20; d_in=32'hADADADAD;// no
  
      #30; rd_en=1; // read
		
      #20; rd_en=0; wr_en=1; //can write?
      #20; d_in=32'hCCCCCCCC;
		
      #20; rd_en=1; wr_en=0;
      
		#20; rd_en=1; // read
		
		#20; rd_en=1; // read
		
		#20; rd_en=1; // read
		
		#20; rd_en=1; // read
		
		#20; rd_en=1; // read
		
		#20; rd_en=1; // read
		
		
		#30; reset_n=0;
		
      
      
   end
endmodule
   
   