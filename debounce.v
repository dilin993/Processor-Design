`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:17:14 08/05/2016 
// Design Name: 
// Module Name:    debounce 
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
module debounce(
	input BTN_I,
	input CLK,
	output BTN_O
    );


	localparam CNT_MAX = 16'd65535; // maximum count
	
	reg[15:0] count = 0;
	reg btn_reg = 0;
	
	always@(posedge CLK) begin
		if(count==CNT_MAX)
			btn_reg <= ~btn_reg;
	end
	
	always@(posedge CLK) begin
		if(btn_reg ^ BTN_I) begin
			if(count==CNT_MAX)
				count <=0;
			else
				count <= count + 1;
		end
		
		else
			count <= 0;
	end


	assign BTN_O = btn_reg;
endmodule
