`timescale 1ns/100ps

module tb_read_operation; // testbech module name is tb_read_operation
  reg [31:0] tb_from_reg0, tb_from_reg1, tb_from_reg2, tb_from_reg3, tb_from_reg4, 
  tb_from_reg5, tb_from_reg6, tb_from_reg7; // 32bit reg
  reg [2:0] tb_Addr; // 3bit reg
  wire [31:0] tb_Data; // 32 bit wire
  
  // testbech module instance
  
  read_operation test_read_operation (.Addr(tb_Addr),.Data(tb_Data),.from_reg0(tb_from_reg0),.from_reg1(tb_from_reg1),.from_reg2(tb_from_reg2),.from_reg3(tb_from_reg3),.from_reg4(tb_from_reg4),.from_reg5(tb_from_reg5),.from_reg6(tb_from_reg6),.from_reg7(tb_from_reg7));

  initial begin
			// Initialize from_reg0~7
			// because should be init read data
			 tb_from_reg0 = 32'h1111_1111;
			 tb_from_reg1 = 32'h2222_2222;
			 tb_from_reg2 = 32'h3333_3333;
			 tb_from_reg3 = 32'h4444_4444;
			 tb_from_reg4 = 32'h5555_5555;
			 tb_from_reg5 = 32'h6666_6666;
			 tb_from_reg6 = 32'h7777_7777;
			 tb_from_reg7 = 32'h8888_8888;
  end

  initial begin
    #40; 

			 //Change the address , test all case
			 
			 tb_Addr = 3'b000; #10;
			 
			 tb_Addr = 3'b001; #10;
			 
			 tb_Addr = 3'b010; #10;
			 
			 tb_Addr = 3'b011; #10;
			 
			 tb_Addr = 3'b100; #10;
			 
			 tb_Addr = 3'b101; #10;
			 
			 tb_Addr = 3'b110; #10;
			 
			 tb_Addr = 3'b111; #10;

    $stop; 
  end
endmodule
