module _dlatch(clk,d,q,q_bar); // module name _dlatch
	input clk;// input clock signal
	input d;// input data signal
	output q, q_bar; // output signals q, q_bar
	reg q;//reg q, store value temporarilly
	
	always@(clk or d) // clk, d has 1 , triggered
		begin
			if(clk==1) q<=d; // clk ==1, q updates d
		end
		
	assign q_bar = ~q; // assign not operation q to q_bar

endmodule
