`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:20:12 07/30/2016 
// Design Name: 
// Module Name:    Reg_16bit_inc 
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
module Reg_16bit_inc(clk, load, inc, data_in, data_out);
	input			  clk, load, inc;
	input  [15:0] data_in;
	output [15:0] data_out;
	reg	 [15:0] data = 0;
	always@(posedge clk) begin
		if(load) data<=data_in;
		else if(inc)	data<=data+16'd1;
	end
	assign data_out = data;
endmodule
