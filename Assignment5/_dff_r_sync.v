module _dff_r_sync(clk, reset_n, d, q);// module name is _dff_r_sync
	input clk, reset_n, d;// 1bit input signal clk, reset_n, d
	output q;// 1bit output signal q
	reg q;// 1bit reg q
	
	
always @(posedge clk)  // clk when rising edge..do
begin
	 if(reset_n ==0) q<= 1'b0; // reset ==0 , output q 0
	 else 			  q<= d;  // else q d
	 end// end
	 
endmodule
