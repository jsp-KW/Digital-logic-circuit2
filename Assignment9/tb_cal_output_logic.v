`timescale 1ns/100ps 

module tb_cal_output_logic; //testbench module name is tb_cal_output_logic

	reg clk, reset_n; //1bit reg
	reg [63:0] multiplier, multiplicand; // 64bit reg
	reg [6:0] count; //7bit reg
	reg [1:0] state; //2bit reg
	reg [127:0] cal_result; // 128bit reg
	
	
	wire op_done; //1bit wire
	wire [6:0] next_count; //7bit wire
	wire [127:0] next_cal_result; //128bit wire
	
	//state encoding
   parameter IDLE = 2'b00;
   parameter EXEC = 2'b01;
   parameter DONE = 2'b10;

	
	// module instance name is  test_cal_output_logic
	cal_output_logic test_cal_output_logic (.clk(clk), . reset_n(reset_n), 
		.multiplier (multiplier), .multiplicand(multiplicand), .count(count),
		.state(state), .cal_result(cal_result), .op_done(op_done), .next_count(next_count),
		.next_cal_result (next_cal_result));
		
	
	always #5 clk = ~clk; //setting clock
	
	initial begin
	 clk = 0;reset_n = 0; 
    multiplier = 1555;
    multiplicand = 131;
    count = 0;
    state = 2'b00;
    cal_result = 128'h0;

   
    
    #10 reset_n = 1;

     // IDLE to EXEC
    #10 state = 2'b01;  
    #20; 
  

     //  EXEC 
     #10 state = 2'b01; // Stay in EXEC
  
     #20; multiplier =100; multiplicand = 120; 
	  
	  #10 state = 2'b01; // Stay in EXEC
  
     #20; 
	  #10 state = 2'b01; // Stay in EXEC
		
     #20; multiplier =115; multiplicand = 1210;count =63; 
	  #10 state = 2'b01; // Stay in EXEC
  
    #20; 
   
    // EXEC to DONE
    #10 state = 2'b10; 
    #20;
    $stop; // Stop simulation
  end
  
  endmodule
  