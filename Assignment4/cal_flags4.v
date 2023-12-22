module cal_flags4(op,result,co_add,c3_add,c,n,z,v); 
	input [2:0] op; // 3bit input  op
	input [3:0] result; // 4bit output result
	input co_add, c3_add; // 1bit input co_add,c3_add
	output c,n,z,v; // 1bit output  c,n,z,v
	
	assign c=(op[2:1]!=2'b11)?1'b0:co_add; // if op[2:1] is different, assign 1'b0 to c , else assign co_add to c
	assign n=result[3]; // assign n, MSB value
	assign z=(result==4'b0)?1'b1:1'b0; // 4bit 0000, assign 1 to z
	assign v=(op[2:1]!=2'b11)?1'b0:co_add^c3_add; // overflow case, assign v not same 0, same, xor operation

endmodule 
