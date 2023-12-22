

//4bit carry look ahead adder module
module modified_cla4(a,b,ci,s,co);

   input [3:0] a,b;   //4bit size input
   input ci;         //1bit size input
   output [3:0] s;   //4bit size output
   output co;         //1bit size output
   
   wire [2:0] c;      //3bit size wire
   
   /* connect four fa and clb 4bit */
   fa_v2 U0_fa_v2(a[0],b[0],ci,s[0]);         //fa_v2 instance
   fa_v2 U1_fa_v2(a[1],b[1],c[0],s[1]);      //fa_v2 instance
   fa_v2 U2_fa_v2(a[2],b[2],c[1],s[2]);      //fa_v2 instance
   fa_v2 U3_fa_v2(a[3],b[3],c[2],s[3]);      //fa_v2 instance
   modified_clb4 U4(a,b,ci,c[0],c[1],c[2],co);      //clb4 instance
   
endmodule