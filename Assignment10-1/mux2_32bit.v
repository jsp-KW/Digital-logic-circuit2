module mux2_32bit (s,d0,d1,y);//module name is mux2_32bits

	input [31:0] d0,d1; //input 32bit signal
	input s;// input 1bit signal
	output [31:0] y;// output 32bit signal
	
	assign y = (s==1'b0) ? d0 : d1;
	
endmodule
