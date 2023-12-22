`timescale 1ns/100ps

module tb_fifo_out;
   reg [2:0] state; // 3bit input signal
   reg [3:0] data_count; // 4bit input signal
   wire full, empty, wr_ack, wr_err, rd_ack, rd_err;

   // Instantiate the fifo_out module
   fifo_out teset_fifo_out(
      .state(state),
      .data_count(data_count),
      .full(full),
      .empty(empty),
      .wr_ack(wr_ack),
      .wr_err(wr_err),
      .rd_ack(rd_ack),
      .rd_err(rd_err)
   );

   // Initialize signals
   initial begin
      state = 3'b000; // Initial state
      data_count = 4'b0000; // Initial data count

      #10 state = 3'b001; // NO_OP
		#10 state = 3'b010; // WRITE
		#10 state = 3'b011; // WR_ERROR
		#10 state = 3'b100; // READ
		#10 state = 3'b101; // RD_ERROR

		#10 data_count = 4'b0000; // data_count = 0
		#10 data_count = 4'b0001; // data_count = 1
		#10 data_count = 4'b0010; // data_count = 2
		#10 data_count = 4'b0011; // data_count = 3
		#10 data_count = 4'b0100; // data_count = 4
		#10 data_count = 4'b0101; // data_count = 5
		#10 data_count = 4'b0110; // data_count = 6
		#10 data_count = 4'b0111; // data_count = 7
		#10 data_count = 4'b1000; // data_count = 8
      #10
		$finish;
   end
endmodule
