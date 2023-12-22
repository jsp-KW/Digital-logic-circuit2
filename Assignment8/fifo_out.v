// module name is fifo_out
module fifo_out(state, data_count, full, empty, wr_ack, wr_err, rd_ack, rd_err);

	input[2:0] state; // 3bit input signal
	input [3:0] data_count; // 4bit input signal
	
	output reg full, empty, wr_ack, wr_err, rd_ack, rd_err;// 1bit output reg
	
	
		//state encoding
		parameter INIT 	 =	3'b000;
		parameter NO_OP	 =	3'b001;
		parameter WRITE	 =	3'b010;
		parameter WR_ERROR = 3'b011;
		parameter READ		 = 3'b100;
		parameter RD_ERROR = 3'b101;
		
		
		//output, divide by data_count
		
		
		always@(data_count) begin
		
			if (data_count ==8) begin // when data_count ==8, full
					full = 1; empty = 0;
				end
			else if (data_count ==0) begin // when data_count ==0, empty
					full = 0; empty = 1;
				end
				
			else begin 
					full = 0; empty = 0;
			end
			
		end
		
		
		//state output define, decide output signals
		// wr_ack, wr_err, rd_ack, rd_err
		
		always @ (state) 
				begin
			
					case (state)  
							
							INIT :  // when state INIT
									begin 
										wr_ack =0;
										wr_err =0;
										rd_ack =0;
										rd_err =0;
							
									end	
							
							
							NO_OP : // when state  NO_OP
									begin 
										wr_ack =0;
										wr_err =0;
										rd_ack =0;
										rd_err =0;
							
									end
							
							WRITE: // when state WRITE
									begin 
										wr_ack =1;
										wr_err =0;
										rd_ack =0;
										rd_err =0;
							
									end
								
							WR_ERROR : // when state WR_ERROR
									begin 
										wr_ack =0;
										wr_err =1;
										rd_ack =0;
										rd_err =0;
							
									end
							
							READ :// when state READ
									begin 
										wr_ack =0;
										wr_err =0;
										rd_ack =1;
										rd_err =0;
							
									end
							
							RD_ERROR: // when state RD_ERROR
									begin 
										wr_ack =0;
										wr_err =0;
										rd_ack =0;
										rd_err =1;
							
									end
								
							default : // exception state
							
									begin
										wr_ack =1'bx;
										wr_err = 1'bx;
										rd_ack =1'bx;
										rd_err =1'bx;
										
			
									end
									
					endcase
		
		end
		
		
		
		
endmodule

