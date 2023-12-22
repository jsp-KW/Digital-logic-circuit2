// next state logic module
module ns_logic(op_start, op_clear, count, state, next_state);
	input op_start, op_clear; //1bit input signal
	input[1:0] state;// 2bit input signal 
	input[6:0] count;// 7bit input signal
	
	output reg[1:0] next_state; // output reg, save state

	//state encoding
	parameter IDLE = 2'b00;
	parameter EXEC = 2'b01;
	parameter DONE = 2'b10;
	
	//when op_start, op_clear, count, state is change
	always@(op_start, op_clear, count, state)
	begin
	case(state) 

		IDLE : begin
				if(op_start == 1) next_state <= EXEC; // EXEC
				else if (op_clear ==1) next_state <= IDLE;// IDLE 
				else next_state <= IDLE;// IDLE 
				end
		EXEC : begin
				if(op_clear == 1) next_state <= IDLE; // IDLE
				else if(count == 63)	next_state <= DONE; // finish, DONE STATE
				else next_state <= EXEC;// EXEC 
				end
			
		DONE : begin
				if(op_clear == 1) next_state <= IDLE; // IDLE
				else next_state <= DONE;// DONE STATE
				end
		
		default : begin // THE OTHER STATE
			next_state <= 2'bx;
			end
		endcase
	end
endmodule

		
		
		
			
	