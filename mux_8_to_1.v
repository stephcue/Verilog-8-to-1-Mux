`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Design Name: 
// Module Name:    mux_8_to_1 
//
//////////////////////////////////////////////////////////////////////////////////
module mux_8_to_1(a,sel,out); 
	input [7:0] a;
	input [2:0] sel;
	output out;
	wire mux[2:0];
	mux_4_to_1 m1 (a[7:4],sel[1:0],mux_1), 	        
			m2 (a[3:0],sel[1:0],mux_2); 
	mux_2_to_1 m3 (mux_1,mux_2,sel[2],out); 
endmodule

module mux_4_to_1 (a,sel,out); 
	input [3:0] a;
	input [1:0] sel;
	output out;
	wire mux[2:0];
	mux_2_to_1 m1 (a[3],a[2],sel[0],mux_1), 
			m2 (a[1],a[2],sel[0],mux_2),
			m3 (mux_1,mux_2,sel[1],out);
endmodule
	
module mux_2_to_1 (a,b,sel,out); 
	input a,b,sel;
	output out;
	tri out;
	bufif1 (out,a,sel);
	bufif0 (out,b,sel);
endmodule
	