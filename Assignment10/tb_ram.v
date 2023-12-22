`timescale 1ns/100ps

module tb_ram; // module name is tb_ram
	reg tb_clk,tb_cen, tb_wen; // 1bit reg 
	reg [4:0] tb_addr; //5bit reg
	reg [31:0] tb_din; //32bit reg
	wire [31:0] tb_dout; //32bit wire

	// instance module name is test_ram, use ram module
	ram test_ram(.clk(tb_clk), .cen(tb_cen), .wen(tb_wen), .addr(tb_addr), .din(tb_din), .dout(tb_dout));

	always #5 tb_clk = ~tb_clk; // clock setting

	initial begin
	
		#10; tb_clk=0; tb_cen=0; tb_wen=0; // init
		
		tb_addr=0; tb_din=0; 
		#20; tb_cen=1; tb_wen=1;// write din value to addr 
		
		#10; tb_addr = 1; tb_din = 10;
		#10; tb_addr = 2; tb_din = 20;
		#10; tb_addr = 3; tb_din = 30;
		#10; tb_addr = 4; tb_din = 40;
		#10; tb_addr = 5; tb_din = 50;
		#10; tb_addr = 6; tb_din = 60;
		#10; tb_addr = 7; tb_din = 70;
		#10; tb_addr = 8; tb_din = 80;
		#10; tb_addr = 9; tb_din = 90;
		
		#10; tb_addr = 10; tb_din = 100;
		#10; tb_addr = 11; tb_din = 110;
		#10; tb_addr = 12; tb_din = 120;
		#10; tb_addr = 13; tb_din = 130;
		#10; tb_addr = 14; tb_din = 140;
		#10; tb_addr = 15; tb_din = 150;
		#10; tb_addr = 16; tb_din = 160;
		#10; tb_addr = 17; tb_din = 170;
		#10; tb_addr = 18; tb_din = 180;
		#10; tb_addr = 19; tb_din = 190;
		
		#10; tb_addr = 20; tb_din = 200;
		#10; tb_addr = 21; tb_din = 210;
		#10; tb_addr = 22; tb_din = 220;
		#10; tb_addr = 23; tb_din = 230;
		#10; tb_addr = 24; tb_din = 240;
		#10; tb_addr = 25; tb_din = 250;
		#10; tb_addr = 26; tb_din = 260;
		#10; tb_addr = 27; tb_din = 270;
		#10; tb_addr = 28; tb_din = 280;
		#10; tb_addr = 29; tb_din = 290;
		#10; tb_addr = 30; tb_din = 300;
		#10; tb_addr = 31; tb_din = 310;
		
		//read din value from addr 
		#20; tb_cen = 1;	tb_wen = 0; 		
		
		#10; tb_addr = 0;
		#10; tb_addr = 1;
		#10; tb_addr = 2;
		#10; tb_addr = 3;
		#10; tb_addr = 4;
		#10; tb_addr = 5;
		#10; tb_addr = 6;
		#10; tb_addr = 7;
		#10; tb_addr = 8;
		#10; tb_addr = 9;
		
		#10; tb_addr = 10;
		#10; tb_addr = 11;
		#10; tb_addr = 12;
		#10; tb_addr = 13;
		#10; tb_addr = 14;
		#10; tb_addr = 15;
		#10; tb_addr = 16;
		#10; tb_addr = 17;
		#10; tb_addr = 18;
		#10; tb_addr = 19;
		
		#10; tb_addr = 20;
		#10; tb_addr = 21;
		#10; tb_addr = 22;
		#10; tb_addr = 23;
		#10; tb_addr = 24;
		#10; tb_addr = 25;
		#10; tb_addr = 26;
		#10; tb_addr = 27;
		#10; tb_addr = 28;
		#10; tb_addr = 29;
		#10; tb_addr = 30;
		
		#20; tb_wen=1;	//write again			
		#10; tb_addr = 31; tb_din = 31;
		
		#30; tb_wen= 0; // read 31 value 31 address
		#10; tb_addr = 31;// 31 check , not 310
		
		#100; $finish;
	end
endmodule