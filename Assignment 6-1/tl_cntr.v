module tl_cntr (clk, reset_n, Ta,Tb, La, Lb);// module name is tl_cntr
	input clk, reset_n, Ta, Tb;// 1bit input clock, reset, Traffic in a, Traffic in b
	output reg[1:0] La, Lb; // 1bit output traffic light La0 La1, Lb0, Lb1
			
	// Encoded states , s0,s1,s2,s3
	parameter S0 = 2'b00;
	parameter S1 = 2'b01;
	parameter S2 = 2'b10;
	parameter S3 = 2'b11;
	
	// Encoded colors for outputs la and lb, green -> yellow ->red
	parameter GREEN = 2'b00;
	parameter YELLOW = 2'b01;
	parameter RED = 2'b10;
	
	// Sequential circuit part 
	reg[1:0] state; 
	reg[1:0] next_state;
	
	// Combinational circuit part
// State transition condition 
	always @ (posedge clk or negedge reset_n) // when posedge , negedge
	
	begin 
		if(reset_n ==1'b0) state <=S0; // when reset on
		else state <= next_state;// else..
	end
	
	// State output generation , // when the state is change by Ta, Tb, state
	always @ (state or Ta or Tb)
	begin
		casex({state, Ta, Tb}) 
			{S0,1'b0, 1'bx}: next_state<= S1;
			{S0,1'b1, 1'bx}: next_state<= S0;
			{S1,1'bx, 1'bx}: next_state<= S2;
			{S2,1'bx, 1'b0}: next_state<= S3;
			{S2,1'bx, 1'b1}: next_state<= S2;
			{S3,1'bx, 1'bx}: next_state<= S0;
			default: next_state <=2'bx;
		endcase
	end
	
	
	always@ (state) // when the La Lb is change.. by La 
		begin
			casex(state)
			S0: begin La=GREEN; Lb = RED; end
			S1: begin La=YELLOW; Lb = RED; end
			S2: begin La=RED; Lb = GREEN; end
			S3: begin La=RED; Lb = YELLOW; end
			default:next_state<=2'bx;
		endcase
	end
	
endmodule
