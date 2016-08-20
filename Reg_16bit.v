`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:13:57 07/30/2016 
// Design Name: 
// Module Name:    Reg_16bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Reg_16bit(clk, load, data_in, data_out);
	input				clk, load;
	input	 [15:0]	data_in;
	output [15:0]	data_out;
	reg	 [15:0]	data=0;		
	always@(posedge clk) if(load) data<=data_in;
	assign data_out = data;
endmodule
