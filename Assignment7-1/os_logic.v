module os_logic (state, d_in,d_out);
	// module name is os_logic
	
	//state encoded
	parameter IDLE_STATE = 3'b000;
	parameter LOAD_STATE = 3'b001;
	parameter INC_STATE = 3'b010;
	parameter INC2_STATE = 3'b011;
	parameter DEC_STATE = 3'b100;
	parameter DEC2_STATE = 3'b101;
	
	input [2:0] state; //3bit input
	input [7:0] d_in; // 8bit input
	output[7:0] d_out;// 8bit output
	
	reg [7:0] d_out; // 8bit wire
	wire[7:0] d_inc; //8bit wire
	wire[7:0] d_dec; // bit wire
	
	//definite d_out by state with case..
	always @(state) begin
		case (state)
			IDLE_STATE : d_out <=8'h00;
			LOAD_STATE : d_out <=d_in;
			INC_STATE :  d_out <=d_inc;
			INC2_STATE:  d_out <=d_inc;
			DEC_STATE :  d_out <=d_dec;
			DEC2_STATE : d_out <=d_dec;
			default: d_out = 8'hx;
		endcase
	end
	
	// cla instance... use cla8 to compute counter value
	
	cla8 u0 (.a(d_out),.b(8'h00), .ci(1),  .s(d_inc));
	cla8 u1 (.a(d_out),.b(8'hFF), .ci(0),  .s(d_dec));

endmodule
