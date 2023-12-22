`timescale 1ns/100ps // timescale set 1ns/100ps

module tb_fa; //testbench module name tb_fa
	reg tb_a,tb_b,tb_ci;// reg 1bit 
	wire tb_s,tb_co;// wire 1bit 
	
	// instance module name test_fa, use fa module
	
	fa test_fa(.a(tb_a), .b(tb_b), .ci(tb_ci), .s(tb_s), .co(tb_co));
	
	// test case verification 2*2*2 = 8
	initial begin
		// carry in is  0  -> (a,b) (0,0), (0,1) ,(1,0) (1,1)
		tb_a = 0; tb_b = 0; tb_ci = 0; #10; 
		tb_a = 0; tb_b = 1; tb_ci = 0; #10;
		tb_a = 1; tb_b = 0; tb_ci = 0; #10;
		tb_a = 1; tb_b = 1; tb_ci = 0; #10;
		
		// carry in is  1  -> (a,b) (0,0), (0,1) ,(1,0) (1,1)
		
		tb_a = 0; tb_b = 0; tb_ci = 1; #10;
		tb_a = 0; tb_b = 1; tb_ci = 1; #10;
		tb_a = 1; tb_b = 0; tb_ci = 1; #10;
		tb_a = 1; tb_b = 1; tb_ci = 1; #10;		
		$stop;
		
	end
	
endmodule
		
		