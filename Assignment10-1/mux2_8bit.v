module mux2_8bit(s,d0,d1,y); // module name is mux2_8bit

	input [7:0] d0,d1;// input  8bit signal
	input s;// input 1bit signal
	
	output [7:0] y; //output 8bit signal
	
	assign y = (s==1'b0) ? d0 : d1; 
	
endmodule
