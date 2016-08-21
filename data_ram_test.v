`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:41:26 08/21/2016 
// Design Name: 
// Module Name:    data_ram_test 
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
module data_ram_test(
	input clk_in,
	input data_w,
	input[15:0] addr,
	input[7:0] din,
	output reg[7:0] dout
    );


	reg[7:0] buffer[7:0];
	
	initial begin
		buffer[0] <= 8'd10;
		buffer[1] <= 8'd1;
		buffer[2] <= 8'd2;
		buffer[3] <= 8'd3;
		buffer[4] <= 8'd4;
		buffer[5] <= 8'd5;
		buffer[6] <= 8'd6;
		buffer[7] <= 8'd7;
	end
	
	always@(posedge clk_in) begin
		if(data_w==0) begin
			dout <= buffer[addr[2:0]];
		end
		else begin
			buffer[addr[2:0]] <= din;
		end
	end

endmodule
