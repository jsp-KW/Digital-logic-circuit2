


//32 bit carry look ahead adder module
module modified_cla32(a,b,ci,s,co);
   
   input [31:0] a,b;      //32bit size input
   input ci;            //1bit size input
   output [31:0] s;      //32bit size output
   output co;            //1bit size output
   
   wire [7:0] c;         //8bit size wire
   
   modified_cla4 U0_cla4(a[3:0],b[3:0],ci,s[3:0],c[0]);                     //cla4 instance
   modified_cla4 U1_cla4(a[7:4],b[7:4],c[0],s[7:4],c[1]);                  //cla4 instance         
   modified_cla4 U2_cla4(a[11:8],b[11:8],c[1],s[11:8],c[2]);               //cla4 instance
   modified_cla4 U3_cla4(a[15:12],b[15:12],c[2],s[15:12],c[3]);            //cla4 instance
   modified_cla4 U4_cla4(a[19:16],b[19:16],c[3],s[19:16],c[4]);            //cla4 instance
   modified_cla4 U5_cla4(a[23:20],b[23:20],c[4],s[23:20],c[5]);            //cla4 instance
   modified_cla4 U6_cla4(a[27:24],b[27:24],c[5],s[27:24],c[6]);            //cla4 instance
   modified_cla4 U7_cla4(a[31:28],b[31:28],c[6],s[31:28],co);               //cla4 instance
   
endmodule