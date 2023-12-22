module mux2(s,d0,d1,y);// module name is mux2

	input d0,d1; // input 1bit signal
	input s;//input 1bit signal
	output y;//output 1bit signal
	

	assign y = (s==1'b0) ? d0 :d1;
	
endmodule
