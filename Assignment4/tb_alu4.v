`timescale 1ns/100ps 
module tb_alu4; 
   reg [3:0] tb_a,tb_b, tb_result_expected; // 4bit reg tb_a,tb_b, tb_result_expected
   reg [2:0] tb_op;//3bit reg tb_op 
   wire [3:0] tb_result; // 4bit wire tb_result
   wire tb_c,tb_n,tb_z,tb_v; // 1bit wire tb_c,tb_n,tb_z,tb_v
   reg clk, reset; // 1bit reg clk,rest
	reg [31:0] vectornum, errors; //32bit reg vectornum,errors
	reg [14:0] testvectors[100:0]; //15bit reg testvectors, array size 101
	// module instance, use alu4 module
	
	alu4 u0_alu4(.a(tb_a),.b(tb_b),.op(tb_op),.result(tb_result),.c(tb_c),.n(tb_n),.z(tb_z),.v(tb_v)); 
	
	// clock repeat
	always 
	begin 
		clk=1; #5; clk=0; #5; // clk period 5 
	end 
	
	initial 
	begin  //read tv file, in my computer location 
		$readmemb("C:/intelFPGA_lite/18.1/Assignment4/alu4.tv", testvectors); 
		vectornum = 0;errors=0; // assign vector num, assign error
		reset=1; #27; reset=0; // reset off, reset on
	end 
	
	always @(posedge clk) // clk 0->1 positive edge
	begin
		  {tb_a[3:0], tb_b[3:0], tb_op[2:0], tb_result_expected[3:0]}=testvectors[vectornum];  // get testcase to assign input case to input
	end 
	
	always @(negedge clk)  // clk 1->0
	if(~reset) // reset on, check expected result value with result
	begin
		if (tb_result !== tb_result_expected) // if not same, print error
		begin 
			$display("Error: inputs = %b", {tb_a, tb_b, tb_op});
			$display(" outputs = %b (%b expected)", tb_result, tb_result_expected); 
			errors = errors + 1; // error counting
		end 
		vectornum = vectornum+1; //load next case
		
		if(testvectors[vectornum]===4'bx) // finish
		begin 
			$display("%d tests completed with %d errors", vectornum, errors); //error message check
			$finish;
		end 
	end 
endmodule 
