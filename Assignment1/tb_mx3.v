`timescale 1ns/100ps

module tb_mx3;
   reg d0,d1,s;
   wire y;
   
   mx2 mx(.d0(d0),.d1(d1),.s(s),.y(y));
   
   initial begin
      d0=0; d1=0; s=0;
      #10;   d0=0; d1=0; s=1;
      #10;   d0=0; d1=1; s=0;
      #10;   d0=0; d1=1; s=1;
      #10;   d0=1; d1=0; s=0;
      #10;   d0=1; d1=0; s=1;
      #10;   d0=1; d1=1; s=0;
      #10;   d0=1; d1=1; s=1;
   end
endmodule