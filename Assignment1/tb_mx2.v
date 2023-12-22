`timescale 1ns/100ps // timescale definition

/*test moduel tb_mx2 definite */

module tb_mx2; 

	reg tb_d0,tb_d1,tb_s; // create input signal 
	wire tb_y; // store result value 
	
	/*mx2 instance my_mx2 create*/
	mx2 my_mx2(.d0(tb_d0), .d1(tb_d1), .s(tb_s), .y(tb_y));
	
	
	initial begin // same meaning  {} in c langauage
	
				tb_d0 = 0; tb_d1 = 0; tb_s = 0;  // d0 selected, 0
		#10;	tb_d0 = 0; tb_d1 = 1; tb_s = 0; // d0 selected, 0
		#10;	tb_d0 = 1; tb_d1 = 0; tb_s = 0; // d0 selected, 1
		#10;  tb_d0 = 1; tb_d1 = 1; tb_s = 0;  // d0 selected, 1
		
		#10;  tb_d0 = 0; tb_d1 = 0; tb_s = 1;  // d1 selected, 0
		#10;  tb_d0 = 0; tb_d1 = 1; tb_s = 1; // d1 selected, 1
		#10;  tb_d0 = 1; tb_d1 = 0; tb_s = 1; // d1 selected, 0
		#10;  tb_d0 = 1; tb_d1 = 1; tb_s = 1;  // d1 selected, 1
		
		#10;
		
		end

endmodule 

