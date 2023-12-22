
// make 8bit register to store 8bit
module _register8_r (clk, reset_n, d,q); // module name is  _register8_r
	input clk, reset_n; //1bit input
	input [7:0] d;// 8bit input
	output [7:0] q; // 8bit output
	
	
	//use _dff_r module, instance name is  u0~u7
	_dff_r u0(clk,reset_n, d[0] ,q[0]); 
	_dff_r u1(clk,reset_n, d[1] ,q[1]);
	_dff_r u2(clk,reset_n, d[2] ,q[2]);
	_dff_r u3(clk,reset_n, d[3] ,q[3]);
	_dff_r u4(clk,reset_n, d[4] ,q[4]);
	_dff_r u5(clk,reset_n, d[5] ,q[5]);
	_dff_r u6(clk,reset_n, d[6] ,q[6]);
	_dff_r u7(clk,reset_n, d[7] ,q[7]);
	
endmodule

