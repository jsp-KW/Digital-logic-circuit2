`timescale 1ns/100ps 
module tb_mx4; // module name tb_mx4
	reg d0, d1, d2, d3;// 1bit reg
  reg [1:0] s;// 2bit reg
  wire y;// 1bit wire

  // use mx4를module instance name is test 인스턴스화
  mx4 test (y,d0,d1,d2,d3,s);

  
initial 
	begin // verificate mx4 testcase
		
		d0 =1 ; d1 = 0; d2 =0; d3 =0; s=2'b00; #10;// d0 selected
		
		d0 =0 ; d1 = 1; d2 =0; d3 =0; s=2'b01; #10;// d1 selected
		
		d0 =0 ; d1 = 0; d2 =1; d3 =0; s=2'b10; #10;// d2 selected
		
		d0 =0 ; d1 = 0; d2 =0; d3 =1; s=2'b11; #10;// d3 selected
		
		d0 =0 ; d1 = 1; d2 =1; d3 =1; s=2'b00; #10;// d0 selected
		
		d0 =1 ; d1 = 0; d2 =1; d3 =1; s=2'b01; #10;// d1 selected
		
		d0 =1 ; d1 = 1; d2 =0; d3 =1; s=2'b10; #10;// d2 selected
		
		d0 =1 ; d1 = 1; d2 =1; d3 =0; s=2'b11; #10;// d3 selected
		$stop; // stop
	end 
endmodule 