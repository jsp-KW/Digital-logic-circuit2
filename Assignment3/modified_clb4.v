
	// c1 = G0 +P0C0;
	// 2input and,  2_input or 1
	
	
	
	// c2 = g1 + p1g0 + p1p0ci
	
	//c3 = g2 + p2c2
	
	//c3 = g2 + p2g1 + p2p1g0 +p2p1p0ci
//	
//  // 4-input and gate
//  _and4 u0_and (.a(p[0]), .b(p[1]), .c(p[2]), .d(p[3]), .y(w[0]));
//  _and2 u1_and (.a(ci), .b(w[0]), .y(w[1]));
//
//  _and2 u2_and (.a(g[0]), .b(p[1]), .y(w[2]));
//  _or2 u3_or (.a(w[2]), .b(g[1]), .y(w[3]));
//  _and2 u4_and (.a(w[3]), .b(p[2]), .y(w[4]));
//  _or2 u5_or (.a(w[4]), .b(g[2]), .y(w[5]));
//  _and2 u6_and (.a(w[5]), .b(p[3]), .y(w[6]));
//  _or2 u7_or (.a(w[6]), .b(g[3]), .y(w[7]));
//
//  _or2 cout_or (.a(w[1]), .b(w[7]), .y(co));




module modified_clb4(a,b,ci,c1,c2,c3,co);
   
   input [3:0]a,b;      //4bit size input
   input ci;            //1bit size input
   output c1,c2,c3,co;   //1bit size output
   
   wire [3:0] p,g;      //4bit size wire
   
   /* 1bit size wire */
   wire w_c1;
   wire [3:0] w_c2;
   wire [5:0] w_c3;
   wire [7:0] w_co;
   
   //generate
   _and2 U00_and2(a[0],b[0],g[0]);         //2 input and instance
   _and2 U01_and2(a[1],b[1],g[1]);         //2 input and instance
   _and2 U02_and2(a[2],b[2],g[2]);         //2 input and instance
   _and2 U03_and2(a[3],b[3],g[3]);         //2 input and instance
   
   //propagate
   _or2 U04_or2(a[0],b[0],p[0]);         //2 input or instance
   _or2 U05_or2(a[1],b[1],p[1]);         //2 input or instance
   _or2 U06_or2(a[2],b[2],p[2]);         //2 input or instance
   _or2 U07_or2(a[3],b[3],p[3]);         //2 input or instance
   
   //c1=g0 + p0ci
      //p0ci
   _and2 U08_and2(p[0],ci,w_c1);         //2 input and instance
   
   _or2 U09_or2(g[0],w_c1,c1);         //2 input or instance
   
   //c2=g1 + p1g0 +p1p0ci
      //p1p0ci
   _and2 U010_and2(p[1],p[0],w_c2[0]);
   _and2 U011_and2(w_c2[0],ci,w_c2[1]);
      //g1 + p1g0
   _and2 U012_and2(p[1],g[0],w_c2[2]);
   _or2 U013_or2(w_c2[2],g[1],w_c2[3]);
   
   _or2 U014_or2(w_c2[1],w_c2[3],c2);
      
   //c3=g2 + p2g1 + p2p1g0 + p2p1p0ci
      //p2p1p0ci
   _and3 U015_and3(p[2],p[1],p[0],w_c3[0]);
   _and2 U016_and2(w_c3[0],ci,w_c3[1]);
      //g2 + p2g1 + p2p1g0
   _and2 U017_and2(p[1],g[0],w_c3[2]);
   _or2 U018_or2(w_c3[2],g[1],w_c3[3]);
   _and2 U019_and2(w_c3[3],p[2],w_c3[4]);
   _or2 U020_or2(w_c3[4],g[2],w_c3[5]);
   
   _or2 U021_or2(w_c3[1],w_c3[5],c3);
      
   //co=g3 + p3g2 + p3p2g1 + p3p2p1g0 + p3p2p1p0ci
      //p3p2p1p0ci
   _and4 U022_and3(p[3],p[2],p[1],p[0],w_co[0]);
   _and2 U023_and2(w_co[0],ci,w_co[1]);
      //g3 + p3g2 + p3p2g1 + p3p2p1g0
   _and2 U024_and2(p[1],g[0],w_co[2]);
   _or2 U025_or2(w_co[2],g[1],w_co[3]);
   _and2 U026_and2(w_co[3],p[2],w_co[4]);
   _or2 U027_or2(w_co[4],g[2],w_co[5]);
   _and2 U028_and2(w_co[5],p[3],w_co[6]);
   _or2 U029_or2(w_co[6],g[3],w_co[7]);
   
   _or2 U030_or2(w_co[1],w_co[7],co);
   
endmodule

   
   