`timescale 1ns/100ps

module tb_dff; // testbench module name is tb_dff
	reg tb_clk;// 1bit reg tb_clk
	reg tb_d;// 1bit reg tb_d
	
	wire tb_q, tb_qbar; // 1bit wire  tb_q, tb_qbar
	
	// module instance name is testdff, use _dff
	_dff testdff (.clk(tb_clk), .d(tb_d), .q(tb_q), .q_bar(tb_qbar));
	
	// clock setting
	always begin
				#10 tb_clk = ~tb_clk;
			end
	initial begin // testcase verificate
			tb_clk = 0;tb_d=0;
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
			
			end // end testcase verification
endmodule
