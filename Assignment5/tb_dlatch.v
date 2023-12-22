`timescale 1ns/100ps

module tb_dlatch; // testbench module name is tb_dlatch
	reg clk;// 1 bit reg clk 
	reg tb_d;// 1bit reg tb_d
	wire tb_q, tb_q_bar; // 1bit wire tb_q, tb_q_bar
	
	// module instance name is u0_dlatch, use _dlatch module
	_dlatch u0_dlatch (.clk(clk), .d(tb_d), .q(tb_q), .q_bar(tb_q_bar));
	
	//clock setting
	
	always begin
	
		#10 clk = ~clk;
	end
	
	//testcaset for dlatch module
	initial begin // testcase start
		#10 clk =0; tb_d=0;
		#4 tb_d=1;
		#4 tb_d=0;
		#4 tb_d=1;
		#4 tb_d=0;
		#4 tb_d=1;
		#4 tb_d=0;
		#4 tb_d=1;
		#4 tb_d=0;
		#4 tb_d=1;
		#4 tb_d=0;
		#4 tb_d=1;
		#4 tb_d=0;
		
		#20 $stop; //finish verification
	end// testcase finish..
endmodule
