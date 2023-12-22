module read_operation (Addr, Data,  from_reg0, from_reg1, from_reg2, from_reg3, 
from_reg4, from_reg5, from_reg6, from_reg7); // module name is read_operation

	input [31:0] from_reg0, from_reg1, from_reg2, from_reg3, from_reg4, from_reg5,
				from_reg6, from_reg7; // 32bit input from_reg0~7
				
	input [2:0] Addr; // 3bit input
	output [31:0] Data; // 32bit output

	// use _8_to_1_MUX module, instance name is  u0
	_8_to_1_MUX u0 (from_reg0,from_reg1,from_reg2,from_reg3,from_reg4,from_reg5,from_reg6,from_reg7, Addr,Data);
	
endmodule
