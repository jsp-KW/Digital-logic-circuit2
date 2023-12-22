module register32_r_en (clk, reset_n, en, d, q); // module name is register32_r_en

	input clk, reset_n, en; // 1bit input
	input [31:0] d; // 32bit input
	output reg [31:0] q;// 32 bit output reg q
	
	
	always@(posedge clk or negedge reset_n) //when rising edge clk, reset_n falling edge
	
	begin 
		if(reset_n ==0)  q<=32'b0; // reset on.. 0
		else if (en)     q<=d; // enable on.. q update d
		else q<=q; // else not update
		
	end
endmodule
