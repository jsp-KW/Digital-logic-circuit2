module rca_clk (clk, a,b,ci,co,s);// module name rca_clk
	input clk;// input 1bit clk
	input [31:0] a,b;// input 32bit a,b
	input ci;// input 1bit ci
	
	output co;// 1bit output co
	output [31:0] s; // 32bit output s
	
	reg [31:0] reg_a, reg_b, reg_s; //register 32bit reg_a,reg_b,reg_s
	reg reg_ci, reg_co;// register reg_ci, reg_co
	
	wire [31:0] wire_s; // wire 32bit wire_s
	wire wire_co; // wire 1bit wire_co
	 
	always@(posedge clk) // clock rising edge
	begin
		reg_a  <=a; //store a value to reg_a
		reg_b  <=b ; // store b value to reg_b
		reg_ci <=ci; // store ci value to _reg_ci
		reg_s  <= wire_s; // store wire_s value to reg_s
		reg_co <= wire_co; // store wire_co value to reg_co
	end
	
	// instance name u0_rca32 , use rca32 module
	rca32 u0_rca32 (.a(reg_a), .b(reg_b), .ci(reg_ci), .s(wire_s), .co(wire_co));
	
	assign s = reg_s; // reg_s value assign to s
	assign co = reg_co;// reg_co value assign to co
	
endmodule
	