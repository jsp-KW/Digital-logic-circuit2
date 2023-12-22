module _dff_r_async(clk, reset_n, d, q);//module name is_dff_r_async
	input clk, reset_n, d;// 1bit input signal clk, reset_n, d
	output q;// 1bit output signal q
	reg q;// 1bit reg q
	
// operate when clk rising edge, or reset_n falling edge
always @(posedge clk or negedge reset_n) 
begin
	if(reset_n ==0) q<= 1'b0; // when reset on, q =0
	else				 q<=d; // else, q has d
	end
endmodule
