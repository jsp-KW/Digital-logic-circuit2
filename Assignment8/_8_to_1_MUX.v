module  _8_to_1_MUX (a,b,c,d,e,f,g,h, sel, d_out);// 8 to 1 mux
	input [31:0] a,b,c,d,e,f,g,h;// input 32bit
	input [2:0] sel;// 3bit input
	output reg [31:0] d_out; // 32bit output reg
	
	
	//sel, a,b,c,d,e,f,g,h 
	always @(sel, a,b,c,d,e,f,g,h) 
		begin
			case (sel)
			3'b000: d_out = a; // 000
			3'b001: d_out = b; // 001
			3'b010: d_out = c; // 010
			3'b011: d_out = d; // 011
			3'b100: d_out = e; // 100
			3'b101: d_out = f; // 101
			3'b110: d_out = g; // 110
			3'b111: d_out = h; // 111
			
			default : d_out = 32'hx; //x
		endcase
	end
endmodule
