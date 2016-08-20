`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:44:20 07/30/2016 
// Design Name: 
// Module Name:    MUX_BUS 
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
module MUX_BUS(Select, DataM, InstM, PC, R, S, T, U, AC, BUS);
	input	[2:0]  Select;
	input	[15:0]  AC, R, S, T, U;
	input [7:0]  PC,DataM, InstM;
	output reg [15:0] BUS;
	always@(Select or PC or R or S or T or U or AC or DataM or InstM) begin
		case(Select)
			3'd0: BUS <= {8'b00000000,DataM};
			3'd1: BUS <= {8'b00000000,InstM};
			3'd2: BUS <= {8'b00000000,PC};
			3'd3: BUS <= R;
			3'd4: BUS <= S;
			3'd5: BUS <= T;
			3'd6: BUS <= U;
			3'd7: BUS <= AC;
		endcase
	end
endmodule
