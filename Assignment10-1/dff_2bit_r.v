module dff_2bit_r (clk, reset_n, d, q); // moudle name is dff_2bit_r
	input clk, reset_n;// 1bit input
	input [1:0] d;// 2bit input
	output reg [1:0] q; //2bit output reg
	
	always @(posedge clk or negedge reset_n)
		begin
			if(~reset_n) q<=2'b00; //reset on
			else q<=d;// else case
		
		end
		
endmodule
