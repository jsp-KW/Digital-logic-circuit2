module Register_file (clk, reset_n, we, wAddr, rAddr, wData, rData);
// top module name is Register_file

	input clk, reset_n, we; // 1bit input clk, reset_n, we
	input [2:0] wAddr; // 3bit wAddr
	input [2:0] rAddr; // 3bit rAddr
	input [31:0] wData; // 32bit wData
	output [31:0] rData; // 32bit rData
	
	wire [7:0] to_reg; // 8bit to_reg
	wire [31:0] from_reg [7:0]; // 32bit wire 8
	
	// 3 sub module instance..
	// use register32_8, write_operation, read_operation.
	
	register32_8 sub_register32_8 (.d_in(wData), .reset_n(reset_n), .clk(clk), .en(to_reg), .d_out0(from_reg[0]), .d_out1(from_reg[1]), .d_out2(from_reg[2]) , .d_out3(from_reg[3]), .d_out4(from_reg[4]),.d_out5(from_reg[5]), .d_out6(from_reg[6]), .d_out7(from_reg[7]));
	
	write_operation sub_write_operation(we,wAddr,to_reg);
	
	read_operation sub_read_operation(rAddr, rData,from_reg[0],from_reg[1],from_reg[2],from_reg[3], from_reg[4],from_reg[5],from_reg[6],from_reg[7]);
	
endmodule

