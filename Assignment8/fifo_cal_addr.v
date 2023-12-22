// module name is fifo_cal_addr, 
//calculate we,re, next_head, next_tail, next_data_count

module fifo_cal_addr (state, head, tail, data_count, we,re,next_head,next_tail, next_data_count);

	input [2:0] state, head, tail; //3bit input signal
	input [3:0]data_count;// 4bit input signal
	 
	output reg we, re; // 1bit output reg
	output reg [2:0] next_head, next_tail; // 3bit output reg
	output reg [3:0] next_data_count; // 4bit output reg
	
	//state encoding
		parameter INIT 	 =	3'b000;
		parameter NO_OP	 =	3'b001;
		parameter WRITE	 =	3'b010;
		parameter WR_ERROR = 3'b011;
		parameter READ		 = 3'b100;
		parameter RD_ERROR = 3'b101;
		
		
		//define next_head, next_tail, next_data_count, we, re when state is INIT, NO_OP, WRITE, WR_ERROR, READ, RD_ERROR
		always @ (state, head, tail,data_count)  begin
			
			case  (state)
				// head =0, tail =0 , data_count = 0
				INIT: 
						begin
						next_head =0; next_tail =0; next_data_count =0; we = 0; re= 0;
						end
				
				NO_OP: // no change, NO_OP STATE
						begin
							next_head = head; 
							next_tail = tail;
							next_data_count = data_count;
							we = 0; re = 0;
						end 
					
				WRITE: // WRITE STATE,tail++ , data_count ++, we=1
						

							begin
								next_data_count = data_count + 4'b1;
								next_tail = tail+3'b1;
								next_head = head;
								we = 1; re =0;
							end
						
						
				
				WR_ERROR: // WR_ERROR STATE, no change
						begin
							next_head = head; next_tail = tail; next_data_count = data_count; we=0; re=0;
						end
				READ: // READ STATE
				
		
					
					begin
						next_head = head +3'b1; next_tail = tail; 
						next_data_count =  data_count -4'b1;
						we =  0; re =1;
					end
					
					
					
				RD_ERROR: // RD_ERROR STATE, no change
					begin
						next_head = head; next_tail= tail; 
						next_data_count = data_count; we = 0;  re = 0;
					end
					
				default: //Exception handling, the other state...
						begin
							next_head = 3'bx; next_tail = 3'bx; next_data_count = 4'bx; 
							we =0; re =0;
						end
			
			
			
			endcase
			
			
			
			
		end
		
	endmodule
	
	
	