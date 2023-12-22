
//Top module

module fifo (clk, reset_n, rd_en,wr_en, d_in, d_out, full, empty, wr_ack, wr_err, rd_ack, rd_err, data_count);
	input clk, reset_n, rd_en, wr_en; // 1bit input signal clk, reset_n, rd_en, wr_en 
	input [31:0] d_in; // input 32bit signal d_in
	
	output [31:0] d_out; // ouput 32bit signal d_out
	output full, empty, wr_ack, wr_err, rd_ack, rd_err; // 1bit output signal
	output [3:0] data_count; //4bit output signal data_count
	
	wire [2:0] next_state_result; //3 bit wire
	wire [2:0] next_head_result;// 3ibt wire
	wire [2:0] next_tail_result;// 3bit wire
	
	wire [2:0] ns_next_state;// 3bit wire
	
	wire cal_we, cal_re; // 1bit wire, accesss register file input
	wire [2:0] cal_head, cal_tail; // 3bit wire
	
	wire [3:0] cal_data_count;// 4bit wire
	wire [31:0] register_file_result; // 32bit wire
	wire [31:0] mx2_result; // 32bit wire
	
	//sub module instance to do

		// fifo_ns, module instance name is fifo_next_instance
		fifo_ns fifo_next_instance (.wr_en (wr_en), .rd_en(rd_en), .state (next_state_result), .data_count(data_count),.next_state(ns_next_state));
	
	
		//module instance name is fifo_state, fifo_data_count, fifo_head, fifo_tail
		//locate in center, get result of fifo_ns and fifo_cal_address, and connect to output logic and register file
	
		_register3_r fifo_state (.clk(clk), .reset_n (reset_n) , .d(ns_next_state), .q(next_state_result));
		_register4_r fifo_data_count (.clk(clk), .reset_n(reset_n),. d(cal_data_count), .q(data_count));
		_register3_r fifo_head(.clk(clk) ,.reset_n(reset_n), .d(cal_head), .q(next_head_result));
		_register3_r fifo_tail(.clk(clk), .reset_n(reset_n), .d(cal_tail), .q(next_tail_result));
		
		// fifo_cal, module instance name is fifo_cal_instance
		fifo_cal_addr fifo_cal_instance(.state(ns_next_state), .head(next_head_result), .tail(next_tail_result), .data_count(data_count), .we(cal_we), .re(cal_re), .next_head(cal_head), .next_tail(cal_tail), .next_data_count(cal_data_count));
		
		// fifo_out, module instance name is fifo_out_instance
		fifo_out fifo_out_instance(.state(next_state_result), .data_count(data_count), .full(full), .empty(empty), .wr_ack(wr_ack), .wr_err(wr_err), .rd_ack(rd_ack), .rd_err(rd_err));
		
	
		
		// register_file, module instance name is fifo_reg_file
		Register_file fifo_reg_file (.clk(clk), .reset_n(reset_n), .we(cal_we), .wAddr(next_tail_result), .rAddr(next_head_result), .wData(d_in), .rData(register_file_result));
		
		//mx2_32bits, module instance name is fifo_mx2_32
		mx2_32bits fifo_mx2_32 ( .s(cal_re), .d0(32'h0), .d1(register_file_result), .y(mx2_result));
		
		
		//_register4_r
		// compute output, module instance name is fifo_out_register
		
		register32_r_en fifo_out_register (.clk (clk), .reset_n(reset_n), .en(1'b1),.d(mx2_result), .q(d_out));
		
		
		
		
	
	
endmodule

