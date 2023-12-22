 module ns_logic (load, inc, state, next_state);// module name is ns_logic

	
	//encoded states
   parameter IDLE_STATE=3'b000;
   parameter LOAD_STATE=3'b001;
   parameter INC_STATE =3'b010;
   parameter INC2_STATE=3'b011;
   parameter DEC_STATE= 3'b100;
   parameter DEC2_STATE=3'b101;
   
   input load,inc;         //1 bit size input
   input [2:0] state;      //3 bit size input
   output [2:0] next_state;//3 bit size output
   
   reg [2:0] next_state;

	// definite next_state, by load, inc state
	// get information from state transition diagram
	always @(load, inc, state)
		begin 
			if (load == 1'b1) next_state <= LOAD_STATE; // load=1 is LOAD_STATE
			
			else  // this case can get draw state transition table
				 case ({state, inc})
						
						 {IDLE_STATE, 1'b1}: next_state <= INC_STATE;
						 {IDLE_STATE, 1'b0}: next_state <= DEC_STATE;
						 
						 {LOAD_STATE, 1'b1}: next_state <= INC_STATE;
						 {LOAD_STATE, 1'b0}: next_state <= DEC_STATE;
						 
						 {INC_STATE, 1'b1}:  next_state <= INC2_STATE;
						 {INC_STATE, 1'b0}:  next_state <= DEC_STATE;
						 
						 {INC2_STATE, 1'b1}: next_state <= INC_STATE;
						 {INC2_STATE, 1'b0}: next_state <= DEC_STATE;
						 
						 {DEC_STATE, 1'b1}:  next_state <= INC_STATE;
						 {DEC_STATE, 1'b0}:  next_state <= DEC2_STATE;
						 
						 {DEC2_STATE, 1'b1}: next_state <= INC_STATE;
						 {DEC2_STATE, 1'b0}: next_state <= DEC_STATE;
						 default: next_state = 3'bxxx;
            endcase
				end
	
endmodule


				