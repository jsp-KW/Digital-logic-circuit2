`timescale 1ns/100ps
module tb_blocking_and_nonblocking;

  reg clk;
  reg a;
  wire b_blocking, c_blocking;
  wire b_nonblocking, c_nonblocking;

  // Instantiate the module under test
  blocking_and_nonblocking uut (
    .clk(clk),
    .a(a),
    .b(b_blocking),
    .c(c_blocking),
    .d(b_nonblocking),
    .e(c_nonblocking)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Test stimulus
  initial begin
    clk = 0;
    a = 0;
	 repeat (10) begin
      a = 1; #10;
      a = 0; #10;
    end

    end

endmodule
