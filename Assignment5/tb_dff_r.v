`timescale 1ns/100ps // timescale setting

module tb_dff_r;// testbench module name is tb_dff_r

	reg tb_clk, tb_d, tb_reset_n; // 1bit reg tb_clk,tb_d,tb_reset_n
	wire tb_q;// 1bit wire tb_q
	
	// module instance name is test_rdff, use _dff_r module
	_dff_r test_rdff (.clk(tb_clk), .reset_n(tb_reset_n), .d(tb_d), .q(tb_q));

	//clock period setting
	always begin
		#5 tb_clk = ~tb_clk;
			end
			
	initial begin// start verification
		tb_clk = 0; // init clk value
		tb_reset_n = 0;// init reset value
		
		#3 tb_d =0;
		#3 tb_d =1;
		#3 tb_d =0;
		#3 tb_d =1;
		#3 tb_d =0;
		#3 tb_d =1; tb_reset_n = 1; // reset =1 
		#3 tb_d =0;
		#3 tb_d =1;
		#3 tb_d =0;
		#3 tb_d =1;
		#3 tb_d =0;
		#3 tb_d =1; tb_reset_n =0; //reset 0
		#3 tb_d =0;
		#3 tb_d =1;
		#3 tb_d =0;
		#3 tb_d =1;		
		#3 tb_d =0;
		#3 tb_d =1;
		#5 $stop; //stop the simulation
		end// finish verificate testcase
endmodule// endmodule
