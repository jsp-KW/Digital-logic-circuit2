`timescale 1ns/100ps

module tb_Register_file; // testbench module name is tb_Register_file
  reg tb_clk, tb_reset_n, tb_we; // 1bit reg 
	reg [2:0] tb_wAddr, tb_rAddr; // 3bit reg
	reg [31:0] tb_wData; // 32bit reg
	wire [31:0] tb_rData; // 32bit wire
	
	// use Register_file module for test
	Register_file test(.clk(tb_clk),.reset_n(tb_reset_n),.we(tb_we), .wAddr(tb_wAddr),.wData(tb_wData),.rAddr(tb_rAddr),.rData(tb_rData));

		always begin
			#5 tb_clk=~tb_clk; // clock setting
		
		end
	
	initial 
	begin 
		tb_clk=0; tb_reset_n=0; tb_wAddr=3'b000; tb_rAddr=3'b000; tb_wData=32'h0; tb_we=1; #10; // initialize
		tb_reset_n=1; // active reset_n
		tb_wAddr=3'b001; tb_wData=32'h1; #10; 
		tb_wAddr=3'b010; tb_wData=32'h2; #10; 
		tb_wAddr=3'b011; tb_wData=32'h3; #10; 
		tb_wAddr=3'b100; tb_wData=32'h4; #10; 
		tb_wAddr=3'b101; tb_wData=32'h5; #10; 
		tb_wAddr=3'b110; tb_wData=32'h6; #10; 
		
		tb_we=0; #10; // check write not.. if write operate? error
		tb_wAddr=3'b111; tb_wData=32'h7; #10; 
		
		tb_rAddr=3'b000; #10;
		tb_rAddr=3'b001; #10; 
		tb_rAddr=3'b010; #10;
		tb_rAddr=3'b011; #10; 
		tb_rAddr=3'b100; #10;
		tb_rAddr=3'b101; #10; 
		tb_rAddr=3'b110; #10;
		tb_rAddr=3'b111; #10;  // 111 addresss.. h7 data missing check.
		$stop;
	
	
	end 
endmodule 