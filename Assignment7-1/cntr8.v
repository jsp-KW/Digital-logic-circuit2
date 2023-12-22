module cntr8 (clk, reset_n, load, inc, d_in, d_out, o_state);
// module name is cntr8
	input clk, reset_n, load, inc; //input 1bit 
	input [7:0] d_in;// input 8bit
	
	output [7:0] d_out;// output 8bit
	output [2:0] o_state;// output 3 bit
	
	wire [2:0] next_state;// wire 3bit
	wire [2:0] state; // wire 3bit
	
	
	assign o_state = state; //check
	
	// module instance, name is u1_ns_logic, r3, u2_os_logic
	// use ns_logic, _register3_r, os_logic
	// sub modules..
	
	ns_logic  u1_ns_logic (.load(load), .inc(inc), .state(o_state), .next_state(next_state));
	
	_register3_r r3 (.clk(clk), .reset_n(reset_n), .d(next_state), .q(state));
	
	os_logic u2_os_logic (.d_in(d_in), .state(state), .d_out(d_out));
	
endmodule


	
	