`timescale 1ns/100ps

module tb_fifo_ns;
   reg wr_en, rd_en; // Input signals
   reg [2:0] state; // Input signal
   reg [3:0] data_count; // Input signal
   wire [2:0] next_state; // Output signal

   // testbench module instance
	// name is test_fifo_ns
   fifo_ns test_fifo_ns(
      .wr_en(wr_en),
      .rd_en(rd_en),
      .state(state),
      .data_count(data_count),
      .next_state(next_state)
   );

	
	// INIT 000
	// NO_OP 001
	// WRITE 010
	// WR_ERROR 011
	// READ 100
	// RD_ERROR 101
	
	//testcase verification//
	initial begin
   wr_en = 0;
   rd_en = 0;
   state = 3'b000; // Initial state
   data_count = 4'b0000; // Initial data count
	#10 state =3'b000; wr_en = 0; rd_en =1; data_count =4'b0000; //RD_ERROR 101
	#10 state =3'b000; wr_en = 1; rd_en =0; data_count =4'b0000; //WRITE 010

	// Test WRITE state transitions
	#10 state = 3'b010; wr_en = 1; rd_en = 1;data_count=4'b0000;	// WRITE -> no_op 001
	#10 state = 3'b010; wr_en = 0; rd_en = 1; data_count= 4'b0111;// WRITE -> READ 100
	#10 state = 3'b010; wr_en = 1; rd_en = 0; data_count =4'b1000; // WRITE -> WRITE_ERROR 011
	#10 state = 3'b010; wr_en = 1; rd_en = 0; data_count= 4'b0111;// WRITE -> WRITE 010

	// Test WR_ERROR state transitions
	#10 state = 3'b011; wr_en = 1; rd_en = 1; // WR_ERROR -> NO_OP  001
	#10 state = 3'b011; wr_en = 1; rd_en = 0; data_count=4'b1000; // WR_ERROR ->WR_ERROR 011
	#10 state = 3'b011; wr_en = 0; rd_en = 1; data_count=4'b1000; // WR_ERROR -> READ 100

	// Test READ state transitions
	#10 state = 3'b100; wr_en = 0; rd_en = 1; data_count =4'b1000;// READ -> READ 100
	#10 state = 3'b100; wr_en = 1; rd_en = 0; data_count=4'b0000; // READ -> WRITE 010
	#10 state = 3'b100; wr_en = 1; rd_en = 1; // READ -> NO_OP 001
	#10 state = 3'b100; wr_en = 0; rd_en = 1; data_count=4'b0000; // READ -> RD_ERROR 101

	// Test RD_ERROR state transitions
	#10 state = 3'b101;wr_en = 1; rd_en = 0; data_count=4'b0000;// RD_ERROR -> WRITE 010
	#10 state = 3'b101;wr_en = 0; rd_en = 1; data_count=4'b0000;// RD_ERROR -> RD_ERROR 101
	#10 state = 3'b101;wr_en = 1; rd_en = 1; // RD_ERROR -> NO_OP 001

	
	
	// Test NO_OP state transitions
	#10 state = 3'b001;wr_en = 0; rd_en = 1; data_count= 4'b0000; // NO_OP -> RD_ERROR 101
	#10 state = 3'b001;wr_en = 1; rd_en = 0; data_count= 4'b1000;// NO_OP -> WR_ERROR 011
	#10 state = 3'b001;wr_en = 1; rd_en = 1; // NO_OP -> NO_OP 001
	#10 state = 3'b001;wr_en = 1; rd_en = 0; data_count=4'b0000; // NO_OP -> WRITE 010
	#10 state = 3'b001;wr_en = 0; rd_en = 1; data_count=4'b0001; // NO_OP -> READ 100
	#10
   $finish;
end

endmodule
