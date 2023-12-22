

//32bit carry look ahead adder with register module
module modified_cla_clk(clk,a,b,ci,s,co);
   
   input clk;               //1bit size input(clock)
   input [31:0] a,b;         //32bit size input
   input ci;               //1bit size input
   output [31:0] s;         //32bit size output
   output co;               //1bit size output
   
   reg [31:0] reg_a,reg_b;   //32bit size reg
   reg reg_ci;               //1bit size reg
   reg [31:0] reg_s;         //32bit size reg
   reg reg_co;               //1bit size reg
   
   wire [31:0] wire_s;      //32bit size wire
   wire wire_co;            //1bit size wire
   
   always@(posedge clk)   //working in posedge
   begin
      reg_a <= a;               //reg_a=a
      reg_b <= b;               //reg_b=b
      reg_ci <= ci;            //reg_ci=ci
      reg_s <= wire_s;         //reg_s=wire_s
      reg_co <= wire_co;         //reg_co=wire_co
      
   end
   
   modified_cla32 U0_cla32(reg_a,reg_b,reg_ci,wire_s,wire_co);   //32-bit cla instance
   
   assign s = reg_s;            //assign s=reg_s
   assign co= reg_co;         //assign co=reg_co
   
endmodule
   
      