`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:32:47 08/20/2016 
// Design Name: 
// Module Name:    ClockDevider 
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
module ClockDivider (
	input CLK_IN,
	output CLK_OUT
    );

	parameter DIV = 2; // divide the clock by 2^DIV
	reg[DIV-1:0] counter = 0;
	
	always@(posedge CLK_IN) begin
		counter <= counter + 1;
	end
	
	assign CLK_OUT = counter[DIV-1];
	
endmodule
