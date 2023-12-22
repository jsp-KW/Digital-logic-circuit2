module register32_8 (clk, reset_n, en, d_in, d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, d_out6, d_out7);

// module name is register32_8

	input clk, reset_n; // 1bit input
	input [7:0] en;// 8bit input
	input [31:0] d_in; // 32bit input
	
	output [31:0] d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, d_out6, d_out7;
	// 32bit output 
	
	// 32bit register 8 instances.. use regiset32_r_en module..
	
	register32_r_en u0(.clk(clk), .reset_n(reset_n), .en(en[0]), .d(d_in), .q(d_out0));
	register32_r_en u1(.clk(clk), .reset_n(reset_n), .en(en[1]), .d(d_in), .q(d_out1));
	register32_r_en u2(.clk(clk), .reset_n(reset_n), .en(en[2]), .d(d_in), .q(d_out2));
	register32_r_en u3(.clk(clk), .reset_n(reset_n), .en(en[3]), .d(d_in), .q(d_out3));
	register32_r_en u4(.clk(clk), .reset_n(reset_n), .en(en[4]), .d(d_in), .q(d_out4));
	register32_r_en u5(.clk(clk), .reset_n(reset_n), .en(en[5]), .d(d_in), .q(d_out5));
	register32_r_en u6(.clk(clk), .reset_n(reset_n), .en(en[6]), .d(d_in), .q(d_out6));
	register32_r_en u7(.clk(clk), .reset_n(reset_n), .en(en[7]), .d(d_in), .q(d_out7));

endmodule
	
	