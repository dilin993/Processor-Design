`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:09:25 07/30/2016 
// Design Name: 
// Module Name:    Reg_8bit 
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
module Reg_8bit(clk, load, data_in, data_out);
	input		clk, load;
	input 	[7:0] data_in;
	output	[7:0] data_out;
	reg		[7:0] data = 0;
	always@(posedge clk) if(load) data<=data_in;
	assign data_out = data;
endmodule
