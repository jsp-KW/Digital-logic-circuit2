`timescale 1ns/100ps

module tb_bus; // testbench module name is tb_bus

	reg clk, reset_n;//1bit reg
	reg m0_req, m0_wr; //1bit reg
	reg [7:0] m0_address; //8bit reg
	reg [31:0] m0_dout;//32bit reg
	
	reg m1_req, m1_wr;//1bit reg
	reg [7:0] m1_address; // 8bit reg
	reg [31:0] m1_dout; //32bit reg
	
	
	reg [31:0] s0_dout, s1_dout; //32bit reg
  
   wire m0_grant, m1_grant, s0_sel, s1_sel, s_wr; //1bit wire
   wire [7:0] s_address; // 8bit wire
   wire [31:0] m_din, s_din; //32bit wire
  
  //instance module name is test_bus, use bus module
  bus test_bus (.clk(clk), .reset_n(reset_n), .m0_req(m0_req), .m0_wr(m0_wr), .m0_address(m0_address), .m0_dout(m0_dout),
           .m1_req(m1_req), .m1_wr(m1_wr), .m1_address(m1_address), .m1_dout(m1_dout),
           .s0_dout(s0_dout), .s1_dout(s1_dout), .m0_grant(m0_grant), .m1_grant(m1_grant),
           .s0_sel(s0_sel), .s1_sel(s1_sel), .s_address(s_address), .s_wr(s_wr),
           .m_din(m_din), .s_din(s_din));
  
	always #5 clk = ~clk; // clock setting
	
	
	// slave 0 0x00(h00) - 0x1E (h19)
	// slave 1 0x20(h20) - 0x2E (h39)
	initial begin
	//init all signal 
	#0; clk = 1; reset_n =0; m0_req = 0; m0_wr = 0;
	m1_req =0; m1_wr =0; m0_address = 0; m1_address =0;
	m0_dout = 0; m1_dout = 0; s0_dout = 0; s1_dout = 0; 
	
	#10; reset_n = 1; // reset off start
	
	// M0
	#10; m0_req = 1; s0_dout = 1; s1_dout = 2; #10; m0_wr = 1;
	
	#10; m0_address = 8'h01; m0_dout = 32'h00000001;
	#10; m0_address = 8'h02; m0_dout = 32'h00000002;
	#10; m0_address = 8'h20; m0_dout = 32'h00000003;
	#10; m0_address = 8'h21; m0_dout = 32'h00000004;
	
	// M0 
	#10; m1_req = 1; #10; m1_wr = 1; // m1 req 1, but m0_req is 1
	
	#10; m0_address = 8'h01; m0_dout = 32'h0000000A;
	#10; m0_address = 8'h02; m0_dout = 32'h0000000B;
	#10; m0_address = 8'h20; m0_dout = 32'h0000000C;
	#10; m0_address = 8'h21; m0_dout = 32'h0000002D;
	
	
	//M1 
	#10; m0_req = 0; m0_wr = 0; #10; s0_dout = 10; s1_dout = 10;
	
	//slave  0 
	#20; m1_address = 8'h01; m1_dout = 32'hA0A0A0A0;
	#10; m1_address = 8'h02; m1_dout = 32'hB0B0B0B0;
	#10; m1_address = 8'h03; m1_dout = 32'hC0C0C0C0;
	#10; m1_address = 8'h04; m1_dout = 32'hD0D0D0D0;
	
	
	#10; m1_address = 8'h30; m1_dout = 32'hAAAAAAAA;
	#10; m1_address = 8'h31; m1_dout = 32'hBBBBBBBB;
	#10; m1_address = 8'h32; m1_dout = 32'hCCCCCCCC;
	// M1 during m1_req 1
	#10; m0_req = 1; m0_wr = 1; // not selected m0, not change m1 granted
	#10; m0_req = 0;	
	#10; m1_address = 8'h33; m1_dout = 32'hDDDDDDDD;	
	#10; m1_address = 8'h34; m1_dout = 32'hEEEEEEEE;	
	#10; m1_address = 8'h35; m1_dout = 32'hFFFFFFFF;	
	#200; $finish;
	
	end
	
	
endmodule
