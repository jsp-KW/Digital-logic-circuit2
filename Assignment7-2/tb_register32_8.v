`timescale 1ns/100ps

module tb_register32_8; // testbench module name is tb_register32_8

  reg tb_clk, tb_reset_n; // 1bit reg 
	reg [7:0] tb_en; // 8 bit reg 
	reg [31:0] tb_d_in; // 32bit reg 
	
	wire [31:0] tb_d_out0, tb_d_out1, tb_d_out2, tb_d_out3, tb_d_out4, tb_d_out5, tb_d_out6, tb_d_out7; // 32bit wire 
	
	// use register32_8 module, instance name is test
	register32_8 test(.clk(tb_clk), .reset_n(tb_reset_n), .en(tb_en), .d_in(tb_d_in), .d_out0(tb_d_out0), .d_out1(tb_d_out1), 
	.d_out2(tb_d_out2), .d_out3(tb_d_out3), .d_out4(tb_d_out4), .d_out5(tb_d_out5), .d_out6(tb_d_out6), .d_out7(tb_d_out7)); 
	
	//clock setting
	
	always 
		begin 
		#5 tb_clk = ~tb_clk;
		end 

	initial 
		begin // test verificate
			tb_clk =1;
			tb_reset_n = 0; tb_en = 8'h0; tb_d_in = 32'h0; #10; // init
			tb_reset_n = 1; #10;
			
         tb_en[0] = 1; tb_d_in = 32'h0000_0001; #10; // 1
         tb_en[1] = 1; tb_en[0] = 0; tb_d_in = 32'h0000_0002; #10; // 2
         tb_en[2] = 1; tb_en[1] = 0; tb_d_in = 32'h0000_0003; #10; // 3
         tb_en[3] = 1; tb_en[2] = 0; tb_d_in = 32'h0000_0004; #10; // 4
         tb_en[4] = 1; tb_en[3] = 0; tb_d_in = 32'h0000_0005; #10; // 5
         tb_en[5] = 1; tb_en[4] = 0; tb_d_in = 32'h0000_0006; #10; // 6
         tb_en[6] = 1; tb_en[5] = 0; tb_d_in = 32'h0000_0007; #10; // 7
         tb_en[7] = 1; tb_en[6] = 0; tb_d_in = 32'h0000_0008; #10; // 8
			
			tb_en[8] = 1; tb_d_in = 32'h0000_0008; #10; // 8
         tb_en[7] = 1; tb_en[8] = 0; tb_d_in = 32'h0000_0007; #10; // 7
         tb_en[6] = 1; tb_en[7] = 0; tb_d_in = 32'h0000_0006; #10; // 6
         tb_en[5] = 1; tb_en[6] = 0; tb_d_in = 32'h0000_0005; #10; // 5
         tb_en[4] = 1; tb_en[5] = 0; tb_d_in = 32'h0000_0004; #10; // 4
         tb_en[3] = 1; tb_en[4] = 0; tb_d_in = 32'h0000_0003; #10; // 3
         tb_en[2] = 1; tb_en[3] = 0; tb_d_in = 32'h0000_0002; #10; // 2
         tb_en[1] = 1; tb_en[2] = 0; tb_d_in = 32'h0000_0001; #10; // 1
			
         $stop; 
   end

  

endmodule

