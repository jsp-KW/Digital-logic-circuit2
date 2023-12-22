`timescale 1ns/100ps

module tb_ns_logic; //testbench module name is tb_ns_logic

	reg tb_op_start, tb_op_clear,tb_clk; // 1bit reg
	reg[1:0] tb_state;// 2bit reg
	reg [6:0] tb_count; // 7bit reg
	
	wire [1:0] tb_next_state; // 2bit wire
	
	
	//state encoding
	parameter IDLE = 2'b00;
	parameter EXEC = 2'b01;
	parameter DONE = 2'b10;
	
	ns_logic test_ns_logic (.op_start (tb_op_start), .op_clear(tb_op_clear), .state(tb_state), .count(tb_count) , .next_state(tb_next_state));
	
	always #5 tb_clk = ~tb_clk;
	
	initial begin
		tb_clk = 0; tb_op_start = 0; tb_op_clear = 0; tb_state = IDLE; tb_count = 0;
		#5; tb_op_start =1; //EXEC
		#5; tb_op_start =0; tb_op_clear =1; //IDLE
		
		#5; tb_state = EXEC; tb_op_start =0; tb_op_clear = 0; tb_count =50; // EXEC
		#5; tb_count = 63; // DONE
		#5; tb_op_clear = 1; // IDLE
		
		#5; tb_state =DONE; tb_op_clear=0; //DONE
		#5; tb_op_clear =1; //IDLE
	
	end
	
endmodule

	