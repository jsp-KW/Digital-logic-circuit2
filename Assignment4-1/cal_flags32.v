module cal_flags32(op,result,co_add,co_prev_add,c,n,z,v);

	input [2:0] op; //3bit input op
	input [31:0] result; //32bit input result 
	input co_add,co_prev_add; //1bit input co_add,co_prev_add

	output c,n,z,v; // 1bit output c,n,z,v

	assign c =(op[2:1]!=2'b11)? 1'b0: co_add; // op[2:1] != 2'b11, assign 0 to c, assign co_add to c 
	assign n = result[31]; // assign result[31] msb value to n
	assign z = (result==32'b0)? 1'b1: 1'b0; //result==0, assign 1 to z, !=0 assign 0 to z
	assign v = (op[2:1]!= 2'b11)? 1'b0: co_add ^ co_prev_add;// 3bit op !=11, assign 0 to v, =11, assign xor operation

endmodule
 