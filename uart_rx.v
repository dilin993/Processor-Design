`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dilin Dampahalage
// 
// Create Date:    19:29:12 08/06/2016 
// Design Name: 
// Module Name:    uart_rx 
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
module uart_rx(
	input CLK,
	input RX,
	input RESET,
	output RX_DONE,
	output[7:0] RX_DATA
    );

	/* Receiver states */
	localparam
	IDLE=3'd1,
	START_BIT=3'd2,
	DATA_BIT=3'd3,
	RX_COMPLETE=3'd4;
	
	/**Timming Constants**/
	localparam BIT_LENGTH = 14'd10416; // (round(100MHz / 9600)) - 1
	localparam BIT_CENTER = BIT_LENGTH/2;
	localparam MAX_INDEX = 4'd8; // stop bit is also considered as data bit
	
	/** Registers **/
	reg[MAX_INDEX:0] data=0;
	reg[3:0] bitIndex;
	reg[13:0] counter;
	reg[2:0] state=IDLE; // state of the receiver
	reg start_ok;
	reg rx_done;
	
	
	always@(posedge CLK) begin
		if(RESET==1)
			state <= IDLE;
		case(state)
			
			IDLE:begin
				if(RX==0) begin // RX goes low marks the start of the frame
					counter <= 0;
					start_ok <= 0;
					state <= START_BIT;
				end
				rx_done <= 1'b0;
			end
			
			
			
			
			START_BIT:begin
			
				if(counter==BIT_LENGTH) begin
					if(start_ok==1) begin
						state <= DATA_BIT;
						bitIndex <= 0;
					end
					
					else
						state <= IDLE; // failed to detect start bit
					counter <= 0;
				end
				
				else begin
					if(counter==BIT_CENTER) begin
						if(RX==0)
							start_ok <= 1; // start bit is correctly detected
					end
					counter <= counter + 1;
				end
			end
			
			
			
			
			DATA_BIT:begin
				if(counter==BIT_LENGTH) begin
					if(bitIndex>MAX_INDEX)
						state <= RX_COMPLETE;
					else begin
						bitIndex <= bitIndex + 1;
						state <= DATA_BIT;
					end
					counter <= 0;
				end
				
				else begin
					if(counter==BIT_CENTER) begin
						data[bitIndex] <= RX; // sample the signle at bit center
					end
					counter <= counter + 1;
				end
			end
			
			RX_COMPLETE:begin
				rx_done <= 1'b1;
				state <= IDLE;
			end
			
		endcase
	end
	
	assign RX_DATA = data[7:0];
	assign RX_DONE = rx_done;
endmodule
