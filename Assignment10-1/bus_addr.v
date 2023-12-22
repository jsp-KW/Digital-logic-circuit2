module bus_addr(addr, s0_sel, s1_sel);  // module name is bus_addr

//M0_address[7:0] or M1_address [7:0], select signal is input
//output is S0_sel~S1_sel
	input [7:0] addr; // input 8bit signal
	output reg s0_sel, s1_sel; // output reg


	//when change addr
	always@ (addr) begin
	
	if((addr>=8'h00) && (addr<8'h20))//0x00<= slave 0 <= 0x1F
			{s0_sel, s1_sel} = 2'b10;
			
		else if((addr>=8'h20)&&(addr<8'h40))//0x20<= slave 1 <=0x3F
			{s0_sel, s1_sel} = 2'b01;
			
		else
			{s0_sel, s1_sel} = 2'b00;
	end
		
endmodule

	