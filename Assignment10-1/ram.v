module ram(clk, cen, wen, addr, din, dout); //module name is ram
	input clk,cen,wen; // 1bit input signal
	input [4:0] addr; // 5bit input signal
	input [31:0] din;//32bit input signal
	output reg [31:0] dout; // 32bit output reg
	 
	reg [31:0] mem [0:31]; //reg 
	integer i; //integer
	
	//init 0
	initial begin
		for ( i=0; i<32; i= i+1) begin
			mem[i] = 32'b0;
		end
	end
	
	// clock posedge clk
	//read/write perfomance
	always@ (posedge clk) begin
		
		if (cen == 1'b1 && wen ==1'b1) begin //write
			mem[addr] <= din; 
			dout <= 32'b0;
		end
		
		else if (cen == 1'b1 && wen ==1'b0)  // read
			dout <= mem[addr];
			
		else if (cen == 1'b0) 
			dout <= 32'b0;
	end

	
endmodule
