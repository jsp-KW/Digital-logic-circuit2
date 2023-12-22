module mux3_32bit (s,d0,d1,d2,y);// module name is mux3_32bit

	input [31:0] d0,d1,d2; //input 32bit signal
	input [1:0] s;// input 2bit signal
	output [31:0] y;// output 32bit signal

	assign y = (s == 2'b10) ? d2 : (( s == 2'b01) ? d1 : d0);
	
endmodule
