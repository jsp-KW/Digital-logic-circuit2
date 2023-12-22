`timescale 1ns/100ps

module tb_8_to_1_MUX; // testbench module name is tb_8_to_1_MUX
  reg [31:0] a, b, c, d, e, f, g, h; // 32bit reg
  reg [2:0] sel;// 3bit reg
  wire [31:0] d_out; // 32bit wire
  
  _8_to_1_MUX test(a,b,c,d,e,f,g,h,sel, d_out); //testbench module instance, use _8_to_1_MUX
  
  
  initial begin
  
    // sel = 000
		 sel = 3'b000;
		 a = 32'h12345678;
		 b = 32'hAAAAAAAA;
		 c = 32'hBBBBBBBB;
		 d = 32'hCCCCCCCC;
		 e = 32'hDDDDDDDD;
		 f = 32'hEEEEEEEE;
		 g = 32'hFFFFFFFF;
		 h = 32'h11111111;
    #10;
		 
		 // sel = 000
		 sel = 3'b000;#10; 
		 
		 // sel = 001
		 sel = 3'b001;#10;
		 
		 //  sel = 010
		 sel = 3'b010; #10;
		 
		 //  sel = 011
		 sel = 3'b011; #10;
		 
		 //  sel = 100
		 sel = 3'b100; #10;
		 
		 // sel = 101
		 sel = 3'b101; #10;
		 
		 //  sel = 110
		 sel = 3'b110; #10;
		 
		 //  sel = 111
		 sel = 3'b111; #10;
    

    $finish;
  end
endmodule
