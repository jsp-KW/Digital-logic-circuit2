module _dff_r_en(clk, reset_n, en, d, q);// moudle name is _dff_r_en

	input clk, reset_n, en, d; // 1bit input
	output reg q;// 1bit output reg
	//when clock rising edge, reset_n is negedge..doing
	always @(posedge clk or negedge reset_n)
		begin
			if(reset_n==0 ) q<=1'b0; // reset_n ==0, q =0;
			else if (en)  q<=d; //en ==1
			else 	q<=q;// else.
			
		end
endmodule

