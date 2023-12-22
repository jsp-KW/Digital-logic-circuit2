// module name is fifo_ns
module fifo_ns (wr_en, rd_en, state, data_count, next_state);
	input wr_en, rd_en;// input 1bit signals
	input [2:0] state;// input 3bit signal
	input [3:0] data_count;// input 4bit signal
	
	output reg[2:0]  next_state; // output reg 3bit signal
	
	
	//define next_state with state transition diagram
	
	//state encoding
		parameter INIT 	 =	3'b000;
		parameter NO_OP	 =	3'b001;
		parameter WRITE	 =	3'b010;
		parameter WR_ERROR = 3'b011;
		parameter READ		 = 3'b100;
		parameter RD_ERROR = 3'b101;
		
		
		always @(wr_en, rd_en, state, data_count) begin
	
			case (state) 
		
			
			// if state is INIT
			// next_state : RD_ERROR, NO_OP, WRITE
			
			 INIT : 
				begin
					if (rd_en ==1 && wr_en ==0 && data_count ==0) 
							next_state =  RD_ERROR;
					else if (rd_en==0&& wr_en ==1 && data_count<8)
							next_state =  WRITE;
					else 
						next_state=NO_OP;
					
				end
			
			
			//READ
			//next_state: READ, RD_ERROR, WRITE, NO_OP
			
				READ:
					begin
						if (rd_en ==1 && wr_en ==0 && data_count>0)
							next_state = READ;
						else if (rd_en==1 && wr_en ==0 && data_count==0)
							next_state = RD_ERROR;
						else if (rd_en==0 && wr_en ==1 && data_count<8)
							next_state = WRITE;
						else 
							next_state = NO_OP;
					end
							
			
			// WRITE
			// next_state:WR_ERROR, READ, NO_OP, WRITE
			
				WRITE :
					begin 
						if(rd_en ==1&& wr_en ==0 && data_count >0)
							next_state = READ;
						else if (rd_en ==0 && wr_en ==1 && data_count<8)
							next_state = WRITE;
						else if (rd_en ==0&& wr_en ==1 && data_count ==8)
							next_state = WR_ERROR;
						else
							next_state = NO_OP;
					end
					
			
			//WR_ERROR
			// next_state: WR_ERROR,READ,NO_OP
			
					WR_ERROR :
					begin 
							if (rd_en ==0 && wr_en ==1 && data_count ==8)
								next_state = WR_ERROR;
							else if ( rd_en==1 && wr_en ==0 && data_count<8)
								next_state = READ;
							else 
								next_state = NO_OP;
					end
			
			
			//RD_ERROR
			//next_state: RD_ERROR, WRITE, NO_OP
			
				RD_ERROR : 
					begin
							if (rd_en ==1  && wr_en ==0 && data_count == 0)
								next_state =  RD_ERROR;
							else if (rd_en ==0 && wr_en ==1 && data_count <8)
								next_state = WRITE;
							else 
								next_state = NO_OP;
					
					end
			
			// NO_OP
			// next_state: READ, RD_ERROR,INIT, WRITE, WR_ERROR, 
			
					NO_OP :
						begin
								if (rd_en ==0 && wr_en ==1 &&data_count ==8) 
									next_state = WR_ERROR;
								else if (rd_en==0 && wr_en ==1 && data_count <8)
									next_state = WRITE;
								else if (rd_en ==1 && wr_en ==0 && data_count>0)
									next_state = READ;
									
								else if (rd_en ==1 && wr_en ==0 && data_count ==0)
									next_state = RD_ERROR;
								else
									next_state = NO_OP;
									
						end
						
					default :  next_state = 3'bx;
			
			
			endcase
	end
	
	
endmodule



