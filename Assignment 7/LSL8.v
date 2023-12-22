module LSL8 (d_in, shamt, d_out); // moudle name is LSL8
	input [7:0] d_in;// 8bit input 
	input [1:0] shamt;//2bit output
	output[7:0] d_out;//8bit output
	
	
	//D7, D6 D5 D4 D3 D2 D1 D0
	// use mx4 module, instance structure
	
	mx4 u7(.d0(d_in[7]),.d1(d_in[6]),.d2(d_in[5]),.d3(d_in[4]),.s(shamt), .y(d_out[7]));
	mx4 u6(.d0(d_in[6]),.d1(d_in[5]),.d2(d_in[4]),.d3(d_in[3]),.s(shamt), .y(d_out[6]));
	
	mx4 u5(.d0(d_in[5]),.d1(d_in[4]),.d2(d_in[3]),.d3(d_in[2]),.s(shamt), .y(d_out[5]));
	mx4 u4(.d0(d_in[4]),.d1(d_in[3]),.d2(d_in[2]),.d3(d_in[1]),.s(shamt), .y(d_out[4]));
	
	
	mx4 u3(.d0(d_in[3]),.d1(d_in[2]),.d2(d_in[1]),.d3(d_in[0]),.s(shamt), .y(d_out[3]));
	mx4 u2(.d0(d_in[2]),.d1(d_in[1]),.d2(d_in[0]),.d3(0),.s(shamt), .y(d_out[2]));
	
	
	mx4 u1(.d0(d_in[1]),.d1(d_in[0]),.d2(0),.d3(0),.s(shamt), .y(d_out[1]));
	mx4 u0(.d0(d_in[0]),.d1(0),.d2(0),.d3(0),.s(shamt), .y(d_out[0]));
	
	
endmodule 