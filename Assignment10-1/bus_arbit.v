module bus_arbit(clk, reset_n, m0_req,m1_req, m0_grant, m1_grant); //module name is bus_arbit
	
	input clk,reset_n,m0_req, m1_req; //1bit input
	
	output reg m0_grant, m1_grant; //1bit output reg
	
	
	reg state, next_state; // 1bit reg
	
	
	
	// state encoding
	parameter M0 = 1'b0;
	parameter M1 = 1'b1;
	
	// decide state value
	always @(posedge clk or negedge reset_n) begin
		if (~reset_n) state <= M0;
		else state <= next_state;
	end
	
	//~reset_n -> m0 grant;
	
	always @(posedge clk) begin
		 if (~reset_n) begin  // if reset  on
				next_state <= M0; //M0
		 end
		 else if ((m0_req == 1'b0 && m1_req ==0) ||m0_req ==1) begin
				next_state  <= M0; //M0
		 end
		 
		 else if (m0_req ==1'b0 && m1_req == 1'b1 ) begin
		 
				next_state <= M1; //M1
		 end
		
		 else if (m1_req ==1'b1) begin
				next_state <= M1;//M1
		 end 
		
		 else if (m1_req ==1'b0) begin
				next_state <= M0;// M0
		 end
		 
		 else begin
			   next_state <=M0; //M0
		 end
		
	
end

//decide m0_grant , m1_grant
	
	always @(posedge clk)
begin
		case (state)
			M0: begin
				m0_grant <= 1; m1_grant <= 0; //decide grant value  M0
			end
			
			M1: begin
				m0_grant <= 0; m1_grant <=1; //decide grant value M1
		
			end
			
				default: begin
					m0_grant <= 1'bx ; m1_grant <=1'bx;
			end
		endcase
	end
	
endmodule

