// radix 2 module 
module multiplier(clk, reset_n, multiplier, multiplicand, op_start, op_clear, op_done, result);
	
	input clk, reset_n; // 1bit input signal 
	input[63:0] multiplier, multiplicand;// 64bit input signal
	input op_start, op_clear;// 1bit input signal
	output op_done;// 1bit output signal
	
	
	output reg[127:0] result; // output reg 128 bit
	reg [1:0] current_state;// reg 2bit, state is 3
	reg [6:0] current_count;// reg 7bit, count 2^7 64
	
	// wire, to connect sub module instance
	wire[1:0] w_next_state;
	wire[6:0] w_next_count;
	wire[127:0] w_next_result;
	
	
	//state encoding
	parameter IDLE = 2'b00;
	parameter EXEC = 2'b01;
	parameter DONE = 2'b10;

	// when clk is rising edge or reset_n is falling edge
	
	always@ (posedge clk or negedge reset_n) begin
		if (reset_n ==1'b0) begin // reset on
				current_state <= 2'b00;  current_count <= 7'b0000000; result <= 128'h0; 
		end
		
		else begin // reset off
				current_state <= w_next_state; current_count <= w_next_count; result <= w_next_result; 
		end
	end
	
	// module instance, use ns_logic module and cal_logic module
	// to compute next state and calculate multiplication
	ns_logic mul_ns (.op_start(op_start), .op_clear(op_clear), .state(current_state), .count(current_count),.next_state(w_next_state));
	
	cal_output_logic mul_cal (.clk(clk), .reset_n(reset_n), .multiplier(multiplier), .multiplicand(multiplicand), .state(current_state), .count(current_count), .next_count(w_next_count),
	.cal_result (result), .next_cal_result (w_next_result) , .op_done (op_done));

endmodule
