module ASR8 (d_in, shamt, d_out) ; // module name is ASR8

	input [7:0] d_in; //8 bit input 
	input [1:0] shamt;//2 bit input
	output [7:0] d_out;// 8bit output
	
	// module instance, use mx4 module
	
	mx4 asr_u7(.d0(d_in[7]), .d1(d_in[7]), .d2(d_in[7]), .d3(d_in[7]), .s(shamt), .y(d_out[7]));
	
	mx4 asr_u6(.d0(d_in[6]), .d1(d_in[7]), .d2(d_in[7]), .d3(d_in[7]), .s(shamt), .y(d_out[6]));
	
	mx4 asr_u5(.d0(d_in[5]), .d1(d_in[6]), .d2(d_in[7]), .d3(d_in[7]), .s(shamt), .y(d_out[5]));
	
	mx4 asr_u4(.d0(d_in[4]), .d1(d_in[5]), .d2(d_in[6]), .d3(d_in[7]), .s(shamt), .y(d_out[4]));
	
	mx4 asr_u3(.d0(d_in[3]), .d1(d_in[4]), .d2(d_in[5]), .d3(d_in[6]), .s(shamt), .y(d_out[3]));
	
	mx4 asr_u2(.d0(d_in[2]), .d1(d_in[3]), .d2(d_in[4]), .d3(d_in[5]), .s(shamt), .y(d_out[2]));
	
	mx4 asr_u1(.d0(d_in[1]), .d1(d_in[2]), .d2(d_in[3]), .d3(d_in[4]), .s(shamt), .y(d_out[1]));
	
	mx4 asr_u0(.d0(d_in[0]), .d1(d_in[1]), .d2(d_in[2]), .d3(d_in[3]), .s(shamt), .y(d_out[0]));
	
endmodule
