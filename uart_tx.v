`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dilin Dampahalage
// 
// Create Date:    21:19:16 08/05/2016 
// Design Name: 
// Module Name:    uart_tx 
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
module uart_tx(
	input SEND,
	input[7:0] DATA,
	input CLK,
	output READY,
	output TX
    );

	// Transmitter states
	localparam
	RDY = 2'b01,
	LOAD_BIT = 2'b10,
	SEND_BIT = 2'b11;
	
	localparam BIT_TMR_MAX = 14'd10416; // = (round(100MHz / 9600)) - 1
	localparam BIT_INDEX_MAX = 4'd10;
	
	
	
	// registers
	reg[1:0] txState = RDY; // state of transmitter
	reg[13:0] bitTmr = 0; // tx counter
	wire bitDone;
	reg[3:0] bitIndex;
	reg txBit = 1; 
	reg[9:0] txData; // holds whole frame to be sent (start + data + stop)
	
	
	// next-state logic
	always@(posedge CLK) begin
		case(txState)
		
			RDY : begin
				if(SEND==1) txState <= LOAD_BIT;
			end
			
			LOAD_BIT: begin
				txState <=SEND_BIT;
			end
			
			SEND_BIT : begin
				if(bitDone==1) begin
					if(bitIndex==BIT_INDEX_MAX) 
						txState <= RDY;
					else 
						txState <= LOAD_BIT;
				end
			end
			
			// should never be reached
			default:
				txState <= RDY;
		endcase
	end
	
	
	// bit timming generation
	always@(posedge CLK) begin
		if(txState==RDY) bitTmr <= 0;
		else begin
			if(bitDone==1) 
				bitTmr  <=0;
			else 
				bitTmr <= bitTmr + 1;
		end
	end


	assign bitDone = (bitTmr==BIT_TMR_MAX) ? 1'b1:1'b0;
	
	// bit counting process
	always@(posedge CLK) begin
		if(txState==RDY) 
			bitIndex <= 0;
		else if(txState==LOAD_BIT) 
			bitIndex <= bitIndex + 1;
	end
	
	
	
	// TX data latch process
	always@(posedge CLK) begin
		if(SEND==1)
			txData <= {1'b1,DATA,1'b0}; // start + data + stop
	end
	
	
	// transmit bit process
	always@(posedge CLK) begin
		if(txState==RDY)
			txBit <= 1;
		else if(txState==LOAD_BIT)
			txBit <= txData[bitIndex];
	end
	
	assign TX = txBit;
	
	assign READY = (txState==RDY) ? 1'b1 : 1'b0;
	
endmodule
