/* inverter gate module 1 input, 1 output */
module _inv(a,y);
	input a; // input signal a
	output y;// output signal y
	assign y = ~a; // not operation and assign
endmodule


/*nand gate module 2 input, 1 output */
module _nand2(a,b,y);
	input a,b; //input signal a,b
	output y;// output signal b
	assign y = ~(a&b);// nand operation and assign
endmodule


/* and gate module 2 input, 1 output */
module _and2 (a,b,y);
	input a,b; // input signal a,b
	output y; // output signal y
	assign y= a&b; // and operation and assign
endmodule


/*or gate module 2 input, 1 output */
module _or2(a,b,y);
	input a,b; // input signal a,b
	output y;// output signal y
	assign y = a|b; // or operation and assign
endmodule



/* xor gate module (2 inverter, 2 and, 1 or gate) */

module _xor2(a,b,y);
	input a,b;// input signal a,b
	output y; // output signal y
	wire inv_a, inv_b; // 1bit wire, to connect Inverter and And gate
	wire w0,w1;// wire 1 bit , to connect and gate and or gate
	
	// Instance inverter,and, or gate
	//a'b +ab' 
	
	
	_inv _inv1(.a(a), .y(inv_a)); // instance name _inv1, use _inv module
	_inv _inv2(.a(b), .y(inv_b));// instance name _inv2, use _inv module
	
	// and1 -> a'b and2 -> ab'
	_and2 _and1(.a(inv_a), .b(b), .y(w0)); // instance name _and1, use _and2 module
	_and2 _and2(.a(inv_b), .b(a), .y(w1)); // instance name _and2, use _and2 module
	
	
	_or2 _or(.a(w0), .b(w1), .y(y)); // instance name _or, use _or2 module
	
endmodule


/* 3 input and gate module */

module _and3 (a,b,c,y);
	input a,b,c;// input signal a,b,c
	output y;// output signal y
	assign y = a&b&c;// a and b and c  operation and assign
endmodule 


/* 4 input and gate module */

module _and4(a,b,c,d,y);
	input a,b,c,d; // input signal a,b,c,d
	output y;// output signal y
	assign y = a&b&c&d; // a and b and c and d operation and assign 
endmodule


/*5 input and gate module */

module _and5(a,b,c,d,e,y);
	input a,b,c,d,e;// input signal a,b,c,d,e
	output y;// output signal y
	assign y = a&b&c&d&e;// a and b and c and d and e  operation and assign
endmodule


/*3 input or gate module*/
module _or3(a,b,c,y);
	input a,b,c;// input signal a,b,c
	output y;// output signal y
	assign y = a|b|c;// a or b or c operation and assign
endmodule

/*4 input or gate module*/
module _or4(a,b,c,d,y);
	input a,b,c,d;// input signal a,b,c,d
	output y;// output signal y
	assign y = a|b|c|d;// a or b or c or d operation and assign
endmodule

/*5 input or gate module*/
module _or5(a,b,c,d,e,y);
	input a,b,c,d,e;// input signal a,b,c,d,e
	output y;// output signal y
	assign y = a|b|c|d|e; // a or b or c or d operation and assign
endmodule


// 4bit inverter
module _inv_4bits(a,y); 
input [3:0] a; // 4bit input signal a
output [3:0] y; // 4bit ouput signal y
assign y=~a; // assign y to ~a
endmodule 

// 4bit 2 input and
module _and2_4bits(a,b,y); 
input [3:0] a,b; // 4bit input signal a, b
output [3:0] y; // 4bit ouput signal y
assign y=a&b; // assign y, a and b
endmodule 

// 4bit 2 input or
module _or2_4bits(a,b,y); 
input [3:0] a,b; // 4bit input signal a, b
output [3:0] y; // 4bit ouput signal y
assign y=a|b; // assgin y,  a|b
endmodule 

// 4bit 2 input xor
module _xor2_4bits(a,b,y); 
input [3:0] a,b; // 4bit input signal a, b
output [3:0] y; // 4bit output signal y
_xor2 U0_xor2(.a(a[0]), .b(b[0]), .y(y[0])); // instance name  U0_xor2, use _xor2 module
_xor2 U1_xor2(.a(a[1]), .b(b[1]), .y(y[1])); // instance name  U1_xor2, use _xor2 module
_xor2 U2_xor2(.a(a[2]), .b(b[2]), .y(y[2])); // instance name  U2_xor2, use _xor2 module
_xor2 U3_xor2(.a(a[3]), .b(b[3]), .y(y[3])); // instance name  U3_xor2, use _xor2 module
endmodule 

// 4bit 2 input xnor
module _xnor2_4bits(a,b,y); 
input [3:0] a,b; // 4bit input signal a, b
output [3:0] y; // 4bit output signal y
wire [3:0] w; // 4bit wire w
_xor2_4bits U0_xor2_4bits(.a(a), .b(b), .y(w)); // instance name U0_xor2_4bits, use _xor2_4bits  module
_inv_4bits U1_inv_4bits(.a(w), .y(y)); //  instance name  U1_inv_4bits ,use  _inv_4bits module
endmodule 


/*32bits 2 input inv, and, or , xor, nxor gate module*/

module _inv_32bits(a,y); 
input [31:0] a; // 32 bit input a
output [31:0] y; // 32bit output y
assign y=~a; // not operation, assign to y
endmodule 

module _and2_32bits(a,b,y);
input [31:0] a,b; // 32bit input  a, b
output [31:0] y; // 32bit output  y
assign y=a&b; // and operation, assign to y
endmodule 

module _or2_32bits(a,b,y); 
input [31:0] a,b; // 32bit input  a, b
output [31:0] y; // 32bit output  y
assign y=a|b; // assign a|b to y
endmodule 

module _xor2_32bits(a, b, y); 
input [31:0] a, b; // 32bit input  a, b
output [31:0] y; // 32bit output  y

_xor2_4bits xor2_0(.a(a[3:0]), .b(b[3:0]), .y(y[3:0])); // instance name  xor2_0, use _xor2_4bits module
_xor2_4bits xor2_1(.a(a[7:4]), .b(b[7:4]), .y(y[7:4])); // instance name  xor2_1, use _xor2_4bits module
_xor2_4bits xor2_2(.a(a[11:8]), .b(b[11:8]), .y(y[11:8])); // instance name  xor2_2, use _xor2_4bits module
_xor2_4bits xor2_3(.a(a[15:12]), .b(b[15:12]), .y(y[15:12]));  // instance name  xor2_3, use _xor2_4bits module
_xor2_4bits xor2_4(.a(a[19:16]), .b(b[19:16]), .y(y[19:16])); // instance name  xor2_4, use _xor2_4bits module
_xor2_4bits xor2_5(.a(a[23:20]), .b(b[23:20]), .y(y[23:20])); // instance name  xor2_5, use _xor2_4bits module
_xor2_4bits xor2_6(.a(a[27:24]), .b(b[27:24]), .y(y[27:24])); // instance name  xor2_6, use _xor2_4bits module
_xor2_4bits xor2_7(.a(a[31:28]), .b(b[31:28]), .y(y[31:28])); // instance name  xor2_7, use _xor2_4bits module
endmodule 

module _xnor2_32bits(a, b, y); 
input [31:0] a, b; // 32bit input  a, b
output [31:0] y; // 32bit output  y
_xnor2_4bits xnor2_0(.a(a[3:0]), .b(b[3:0]), .y(y[3:0])); //instance name xnor2_0,use module _xnor2_4bits,
_xnor2_4bits xnor2_1(.a(a[7:4]), .b(b[7:4]), .y(y[7:4]));//instance name xnor2_1,use module _xnor2_4bits,
_xnor2_4bits xnor2_2(.a(a[11:8]), .b(b[11:8]), .y(y[11:8])); //instance name xnor2_2,use module _xnor2_4bits,
_xnor2_4bits xnor2_3(.a(a[15:12]), .b(b[15:12]), .y(y[15:12])); //instance name xnor2_3,use module _xnor2_4bits,
_xnor2_4bits xnor2_4(.a(a[19:16]), .b(b[19:16]), .y(y[19:16]));//instance name xnor2_4,use module _xnor2_4bits,
_xnor2_4bits xnor2_5(.a(a[23:20]), .b(b[23:20]), .y(y[23:20]));//instance name xnor2_5,use module _xnor2_4bits,
_xnor2_4bits xnor2_6(.a(a[27:24]), .b(b[27:24]), .y(y[27:24])); //instance name xnor2_6,use module _xnor2_4bits,
_xnor2_4bits xnor2_7(.a(a[31:28]), .b(b[31:28]), .y(y[31:28])); //instance name xnor2_7,use module _xnor2_4bits,

endmodule


module _inv_64bits(a,y); 
input [63:0] a; // 64 bit input a
output [63:0] y; // 64bit output y
assign y=~a; // not operation, assign to y
endmodule 

