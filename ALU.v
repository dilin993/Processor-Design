`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:59:29 07/30/2016 
// Design Name: 
// Module Name:    ALU 
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
module ALU(ALUA, ALUB, OP, ALUR, Z);
	input [15:0] ALUA;
	input	[15:0] ALUB;
	input	[3:0]	 OP;
	output reg[15:0] ALUR;
	output	 Z;

	parameter A=4'd0, B=4'd1, ADD=4'd2, SUB=4'd3, INAC=4'd4, CLAC=4'd5, ASHFT=4'd6, BSHFT=4'd7, DIV2=4'd8, MUL2=4'd9, AandB=4'd10, AorB=4'd11, AxorB=4'd12, notA=4'd13;
	
	always@(OP or ALUA or ALUB)
	begin
		case (OP)
			A: 	begin
						ALUR=ALUA;
					end
			
			B: 	begin
						ALUR=ALUB;
					end
					
			ADD: 	begin 
						ALUR=ALUA+ALUB;
					end
					
			SUB:  begin
						ALUR =ALUA-ALUB;
					end

			INAC: begin
						ALUR =ALUA+16'd1;
					end

			CLAC: begin
						ALUR = 16'b0;
					end
			
			ASHFT:begin
						ALUR =ALUA<<8;
					end
			
			BSHFT:begin
						ALUR =ALUB<<8;
					end
					
			DIV2:	begin
						ALUR =ALUA>>1;
					end
			
			MUL2: begin
						ALUR =ALUA<<1;
					end
			
			AandB:begin
						ALUR=ALUA&ALUB;
					end
			
			AorB:	begin
						ALUR=ALUA|ALUB;
					end
			
			AxorB:begin
						ALUR=((~ALUA&ALUB)|(~ALUB&ALUA));	//XOR
					end
					
			notA: begin
						ALUR=~ALUA;
					end
			
			default: 
					begin
						ALUR = ALUA;
					end
		endcase
	end
	
	assign Z=(ALUR==16'd0)?1'b1:1'b0;
endmodule
