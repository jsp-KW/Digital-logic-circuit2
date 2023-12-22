`timescale 1ns/100ps //timescale set 1ns/100ps

module tb_ha;// testbench module tb_ha
	reg tb_a; // reg 1bit
	reg tb_b;// reg 1bit
	wire tb_s;// wire 1bit
	wire tb_co;// wire 1bit
	
	// module instance, name test_ha, use module ha
	ha test_ha(.a(tb_a), .b(tb_b), .s(tb_s), .co(tb_co));

	// 2^2 case verification
	
	initial begin
			 tb_a = 0; tb_b = 0; // 0,0 testcase
		#10 tb_a = 0; tb_b = 1;// 0,1 testcase
		#10 tb_a = 1; tb_b = 0; // 1,0 testcase
		#10 tb_a = 1; tb_b = 1; // 1,1 testcase
		#10 $stop;
		
	end
endmodule
