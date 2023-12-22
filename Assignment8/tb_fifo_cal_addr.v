`timescale 1ns/100ps

module tb_fifo_cal_addr;
  reg [2:0] state;
  reg [2:0] head; 
  reg [2:0] tail;
  reg [3:0] data_count;
  
  wire [2:0] next_head,next_tail;
  wire [3:0] next_data_count;
  wire we, re;

  // Instantiate the fifo_cal_addr module
  fifo_cal_addr test_fifo_cal_addr(
    .state(state),
    .head(head),
    .tail(tail),
    .data_count(data_count),
    .we(we),
    .re(re),
    .next_head(next_head),
    .next_tail(next_tail),
    .next_data_count(next_data_count)
  );
	//state encoding
		parameter INIT 	 =	3'b000;
		parameter NO_OP	 =	3'b001;
		parameter WRITE	 =	3'b010;
		parameter WR_ERROR = 3'b011;
		parameter READ		 = 3'b100;
		parameter RD_ERROR = 3'b101;
  
  // Initial state
  initial begin
    // Test case 1: Transition from INIT to NO_OP
    state = INIT; // INIT state
    head = 3'b000;  // Valid initial values
    tail = 3'b000;
    data_count = 4'b0000;

	 
	 #10; // READ, check read,, we =0, re=1, head+1, tail not change, data_count --
	 state = READ;
	 head = 3'b001;
	 tail= 3'b010;
	 data_count = 4'b0010;
	 
	 #10; // check no_op, head tail 001 011 data 3 in fifo, no change in values.
	 state = NO_OP; // we re 00
    head = 3'b001;
    tail = 3'b011;
    data_count = 4'b0011;
	 
    #10; 
    state =WRITE; // WRITE state, check tail value +, data_count +. not change head
	 head = 3'b001; tail= 3'b010;
	 data_count =4'b0010;
	 

	 
	 #10; // check RD_ERROR STATE,  NO CHANGE VALUES..
	 state = RD_ERROR;
	 head = 3'b001; tail= 3'b010;
	 data_count = 4'b0010;
	
	 #10; // CHECK WR_ERROR STATE, NO CHANGE VALUES
	 state = WR_ERROR;
	 head = 3'b001; tail= 3'b010;
	 data_count = 4'b0010;
	
	
	 #10; // exception check
	 state=3'b111;
	 #10;
    // Finish simulation
    $finish;
  end
endmodule
