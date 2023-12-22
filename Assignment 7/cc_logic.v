
module cc_logic (op,shamt, d_in, d_out, d_next);// module name is cc_logic

	input [2:0] op; // 3bit, operate
	input [1:0] shamt; // 2bit 0~3 shift
	input [7:0] d_in;// 8bit input
	input [7:0] d_out;// 8bit input
	output reg[7:0] d_next; // 8bit reg output 
	
	
	wire [7:0] d_lsl; //8bit wire
	wire [7:0] d_lsr;// 8bit wire
	wire [7:0] d_asr;// 8bit wire
	
	
	// binary encoding NOP, LOAD, LSL, LSR, ASR
	parameter NOP  = 3'b000;
	parameter LOAD = 3'b001;
	parameter LSL  = 3'b010;
	parameter LSR  = 3'b011;
	parameter ASR  = 3'b100;

	
	//use always@, when argument change 
	always@(op,shamt, d_in, d_out, d_lsl, d_lsr, d_asr)
		begin 
			case(op) // op type.. decide next state
				NOP:d_next <=8'b0;
				LOAD:d_next <=d_in;
				LSL:d_next <=d_lsl;
				LSR:d_next <=d_lsr;
				ASR:d_next <=d_asr;
			
			endcase
		end
		
		// instance module , use LSL8, LSR8, ASR8
		LSL8 lsl8(.d_in(d_out), .shamt(shamt) , .d_out(d_lsl));
		LSR8 lsr8(.d_in(d_out), .shamt(shamt) , .d_out(d_lsr));
		ASR8 asr8(.d_in(d_out), .shamt(shamt) , .d_out(d_asr));

endmodule
		