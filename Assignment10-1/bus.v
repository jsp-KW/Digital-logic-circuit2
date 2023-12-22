//top module name is bus
module bus(clk, reset_n, m0_req, m0_wr, m0_address, m0_dout, m1_req, m1_wr, m1_address, m1_dout, s0_dout, s1_dout, m0_grant, m1_grant, m_din, s0_sel, s1_sel, s_address, s_wr, s_din);
 
	 input clk, reset_n; //1bit input
	 input m0_req, m0_wr; // 1bit input
	 input [7:0] m0_address; //8bit input
	 input [31:0] m0_dout; // 32bit input
	 
	 input m1_req, m1_wr; //1bit input
	 input [7:0] m1_address;// 8bit input
	 input [31:0] m1_dout;// 32bit input
	 
	 input [31:0] s0_dout, s1_dout; //32 bit input
	 
	 output m0_grant, m1_grant, s0_sel, s1_sel, s_wr; // 1bit output
	 output [7:0] s_address; //8bit output
	 output [31:0] m_din, s_din; // 32bit output
	 
	 wire [1:0] mux3_signal; //22bit wire
	 
	 //instance module
	 
	
	 //Arbiter instance module
    bus_arbit int_bus_arb (.clk(clk), .reset_n(reset_n), .m0_req(m0_req), .m1_req(m1_req), .m0_grant(m0_grant), .m1_grant(m1_grant));
	
	 //Address decoder instance module
	 bus_addr ins_bus_addr (.addr(s_address), .s0_sel(s0_sel), .s1_sel(s1_sel));
	 
	 //mux instance module
	 mux2 ins_mux2 (.s(m1_grant), .d0(m0_wr), .d1(m1_wr), .y(s_wr));
	 mux2_8bit ins_mux2_8 (.s(m1_grant), .d0(m0_address), .d1(m1_address), .y(s_address)); 
	 mux2_32bit ins_mux2_32 (.s(m1_grant), .d0(m0_dout) , .d1(m1_dout), .y(s_din));
	
	//2bit d flip flop instance module
	 dff_2bit_r  ins_dff_2 (.clk(clk), .reset_n(reset_n), .d({s0_sel, s1_sel}), . q(mux3_signal));
	 
	 //32bit 3 input mux instance module
	 mux3_32bit ins_mux3_32 (.s(mux3_signal), .d0(32'h0), .d1(s0_dout), .d2(s1_dout), .y(m_din));
	 
	
	 
endmodule

 