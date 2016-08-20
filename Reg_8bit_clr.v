`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:43:02 08/09/2016 
// Design Name: 
// Module Name:    Reg_8bit_clr 
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
module Reg_8bit_clr(clk, load,clr,inc, data_in, data_out);
	input		clk, load,clr,inc;
	input 	[7:0] data_in;
	output	[7:0] data_out;
	reg		[7:0] data = 0;
	always@(posedge clk) begin
		if(load) data<=data_in;
		else if(clr) data <= 0;
		else if(inc) data <= data + 1;
	end
	assign data_out = data;
endmodule
