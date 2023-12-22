module _dff_r(clk, reset_n, d, q); // module name is _dff_r
	input clk, reset_n, d; // 1bit input 
	
	output reg q; // reg output q
	
	always@ (posedge clk or negedge reset_n) // when clk rising edge, reset_n falling edge
	begin
		if(reset_n ==0) q<= 1'b0; // reset_n ==0, q is 0
		else q<=d; //reset_n!=0 ,assign d to q..
		
	end
	
endmodule
