module mx2_32bits(d0,d1,s,y);

input [31:0] d0, d1; // 32bit input d0, d1
input s; // 1bit input s
output [31:0] y; // 32bit output y

assign y=(s==0)?d0:d1; // s==0, assign d0 , s!=0, assign d1

endmodule 
