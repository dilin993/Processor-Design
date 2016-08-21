`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:47:37 08/21/2016 
// Design Name: 
// Module Name:    inst_ram_test 
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
module inst_ram_test(
	input clk_in,
	input inst_w,
	input[15:0] addr,
	output reg[7:0] dout
    );

	reg[7:0] buffer[15:0];
	
	initial begin
		buffer[0] <= 8'd37;
		buffer[1] <= 8'd36;
		buffer[2] <= 8'd36;
		buffer[3] <= 8'd7;
		buffer[4] <= 8'd37;
		buffer[5] <= 8'd11;
		buffer[6] <= 8'd3;
		buffer[7] <= 8'd3;
		buffer[8] <= 8'd3;
		buffer[9] <= 8'd3;
		buffer[10] <= 8'd3;
		buffer[11] <= 8'd3;
		buffer[12] <= 8'd3;
		buffer[13] <= 8'd3;
		buffer[14] <= 8'd3;
		buffer[15] <= 8'd3;
	end
	
	always@(posedge clk_in) begin
		if(inst_w==0) begin
			dout <= buffer[addr[2:0]];
		end
	end
	
endmodule
