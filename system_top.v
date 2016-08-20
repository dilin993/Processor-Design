`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:30:13 08/12/2016 
// Design Name: 
// Module Name:    system_top 
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
module system_top(
	input CLK,
	input[7:0] SW,
	input RX,
	input RESET,
	input OK,
	output TX,
	output[7:0] LED
	);
	
	
	/************** state definitions *******/
	
	localparam 
	WAKEUP_MODE1 = 2'd0,
	WAKEUP_MODE2 = 2'd1,
	PROGRAM_MODE = 2'd2,
	RUN_MODE = 2'd3;
	
	
	localparam 
	P_IDLE = 4'd0,
	P_START = 4'd1,
	P_START_SEND = 4'd2,
	P_START_RDY_LOW = 4'd3,
	P_START_WAIT_RDY = 4'd4,
	P_SIZE_WAIT = 4'd5,
	P_DATA_WAIT = 4'd6,
	P_DATA_WAIT2 = 4'd7,
	P_DATA_NEXT = 4'd8;
	
	
	localparam
	R_IDLE = 4'd0,
	R_REC_WAIT = 4'd1,
	R_REC_WAIT2 = 4'd2,
	R_REC_NEXT = 4'd3,
	R_REC_DONE = 4'd4,
	R_CPU_START = 4'd5,
	R_CPU_WAIT = 4'd6,
	R_TX_START = 4'd7,
	R_TX_LOAD = 4'd8,
	R_TX_SEND = 4'd9,
	R_TX_RDY_LOW = 4'd10,
	R_TX_RDY_LOW2 = 4'd11,
	R_TX_WAIT_RDY = 4'd12,
	R_DO_NOTHING = 4'd13;
	
	localparam MAX_DATA_ADDR = 16'd65535;
	/****************************************/
	
	/****** Registers and wires *******/
	
	// Top level registers
	reg[1:0] mode=WAKEUP_MODE1;
	reg[3:0] p_state=P_IDLE; // state in program mode
	reg[3:0] r_state=R_IDLE; // state in run mode
	wire btn_reset;
	reg btn_reset_reg=0;
	wire btn_reset_clicked;
	wire btn_ok;
	reg btn_ok_reg=0;
	wire btn_ok_clicked;
	wire rx_done;
	wire[7:0] rx_data;
	reg[7:0] tx_data=0;
	reg tx_send=0;
	wire tx_ready;
	reg[7:0] program_size=0;
	reg[7:0] program_counter=0;
	reg program_complete=0;
	
	// CPU registers
	reg cpu_enable=0;
	
	// CPU wires
	wire cpu_finish;
	
	
	
	// data ram registers
	reg enable_data_a=0;
	reg enable_data_b=0;
	reg[15:0] addr_data_ram_b=0;
	reg[7:0] din_data_ram_b=0; // uart data ram din
	wire[7:0] dout_data_ram_b; // uart data ram dout
	reg data_w_b=0; // uart data ram write enable
	
	
	// data ram wires
	wire[15:0] addr_data_ram_a; // cpu data ram adress
	wire[7:0] din_data_ram_a; // cpu data ram din
	wire[7:0] dout_data_ram_a; // cpu data ram dout
	wire data_w_a; // cpu data ram write enable
	
	
	// inst ram registers
	reg enable_inst_a=0;
	reg enable_inst_b=0;
	reg[7:0] addr_inst_ram_b=0;
	reg[7:0] din_inst_ram_b=0; // uart inst ram din
	wire[7:0] dout_inst_ram_b; // uart inst ram dout
	reg inst_w_b=0; // uart inst ram write enable
	
	
	// inst ram wires
	wire[7:0] addr_inst_ram_a; // cpu inst ram adress
	reg[7:0] din_inst_ram_a=0; // cpu inst ram din, but cpu does not use this
	wire[7:0] dout_inst_ram_a; // cpu inst ram dout
	wire inst_w_a; // cpu inst ram write enable
	
	

	/*********************************/
	
	
	
	
	/********* CPU TOP *****************/
	// Instantiate the cpu_top
	cpu_top instance_name (
		 .clk_in(CLK), 
		 .enable(cpu_enable), 
		 .reset(btn_reset_clicked), 
		 .data_w(data_w_a), 
		 .addr_data_ram(addr_data_ram_a), 
		 .din_data_ram(din_data_ram_a), 
		 .dout_data_ram(dout_data_ram_a), 
		 .inst_w(inst_w_a), 
		 .addr_inst_ram(addr_inst_ram_a), 
		 .dout_inst_ram(dout_inst_ram_a), 
		 .finish(cpu_finish)
	);
	/**********************************/


	/********* Data RAM *****************/
	data_ram dataRAM(
	  .clka(CLK), // input clka
	  .ena(enable_data_a), // input ena
	  .wea(data_w_a), // input [0 : 0] wea
	  .addra(addr_data_ram_a), // input [15 : 0] addra
	  .dina(din_data_ram_a), // input [7 : 0] dina
	  .douta(dout_data_ram_a), // output [7 : 0] douta
	  .clkb(CLK), // input clkb
	  .enb(enable_data_b), // input enb
	  .web(data_w_b), // input [0 : 0] web
	  .addrb(addr_data_ram_b), // input [15 : 0] addrb
	  .dinb(din_data_ram_b), // input [7 : 0] dinb
	  .doutb(dout_data_ram_b) // output [7 : 0] doutb
	);
	/**********************************/
	
	
	/********* inst RAM *****************/
	instruction_ram instRAM (
	  .clka(CLK), // input clka
	  .ena(enable_inst_a), // input ena
	  .wea(inst_w_a), // input [0 : 0] wea
	  .addra(addr_inst_ram_a), // input [7 : 0] addra
	  .dina(din_inst_ram_a), // input [7 : 0] dina
	  .douta(dout_inst_ram_a), // output [7 : 0] douta
	  .clkb(CLK), // input clkb
	  .enb(enable_inst_b), // input enb
	  .web(inst_w_b), // input [0 : 0] web
	  .addrb(addr_inst_ram_b), // input [7 : 0] addrb
	  .dinb(din_inst_ram_b), // input [7 : 0] dinb
	  .doutb(dout_inst_ram_b) // output [7 : 0] doutb
	);
	/**********************************/
	
	
	/**************** RESET BUTTON *****************/
	debounce deb_reset (
    .BTN_I(RESET), 
    .CLK(CLK), 
    .BTN_O(btn_reset)
    );
	 
	always@(posedge CLK) begin
		btn_reset_reg <= btn_reset;
	end
	 
	assign btn_reset_clicked = ((btn_reset_reg==0)&(btn_reset==1)) ? 1'b1:1'b0;
	/************************************************/
	
	
	/**************** OK    BUTTON *****************/
	debounce deb_ok (
    .BTN_I(OK), 
    .CLK(CLK), 
    .BTN_O(btn_ok)
    );
	 
	always@(posedge CLK) begin
		btn_ok_reg <= btn_ok;
	end
	 
	assign btn_ok_clicked = ((btn_ok_reg==0)&(btn_ok==1)) ? 1'b1:1'b0;
	/************************************************/
	
	/**************** RX MODULE ****************/
	// Instantiate RX module
	uart_rx rxMode (
    .CLK(CLK), 
    .RX(RX), 
    .RESET(btn_reset_clicked), 
    .RX_DONE(rx_done), 
    .RX_DATA(rx_data)
    );
	/********************************************/
	
	/**************** TX MODULE ****************/
	// Instantiate TX module
	uart_tx txMode (
    .SEND(tx_send), 
    .DATA(tx_data), 
    .CLK(CLK), 
    .READY(tx_ready), 
    .TX(TX)
    );
	/********************************************/
	
	
	
	
	
	
	
	
	/************************ state machine for device operation **************/
	always@(posedge CLK) begin
	
		if(btn_reset_clicked==1) begin
			mode <= WAKEUP_MODE1;
		end
		
		case(mode)
		
			WAKEUP_MODE1: begin
				mode <= WAKEUP_MODE2;
			end
			
			WAKEUP_MODE2 : begin
				if(SW[0]==0) begin
					mode <= PROGRAM_MODE;
					enable_inst_a <= 0;
					enable_inst_b <= 1;
					enable_data_a <= 0;
					enable_data_b <= 0;
					inst_w_b <= 0;
					cpu_enable <= 0;
					p_state <= P_IDLE;
				end
				
				else begin
					mode <= RUN_MODE;
					enable_inst_a <= 0;
					enable_inst_b <= 0;
					enable_data_a <= 0;
					enable_data_b <= 1;
					data_w_b <= 0;
					cpu_enable <= 0;
					r_state <= R_IDLE;
				end
			end
		endcase
	
		if(mode==PROGRAM_MODE) begin // device in programming mode
			
			case(p_state) 
			
				P_IDLE : begin
					if(btn_ok_clicked==1) begin
						p_state <= P_START;
					end
				end
				
				P_START : begin
					tx_data <= 8'd100;
					p_state <= P_START_SEND;
					program_complete <= 1'b0;
				end
				
				P_START_SEND : begin
					p_state <= P_START_RDY_LOW;
					tx_send <= 1'b1;
				end
				
				P_START_RDY_LOW : begin
					p_state <= P_START_WAIT_RDY;
					tx_send <= 1'b0;
				end
				
				P_START_WAIT_RDY : begin
					if(tx_ready==1)
						p_state <= P_SIZE_WAIT;
				end
				
				P_SIZE_WAIT: begin
					if(rx_done==1) begin
						program_size <= rx_data;
						p_state <= P_DATA_WAIT;
						program_counter <= 0;
					end
				end
				
				P_DATA_WAIT: begin
					if(rx_done==1) begin
						addr_inst_ram_b <= program_counter;
						din_inst_ram_b <= rx_data;
						inst_w_b <= 1;
						p_state <= P_DATA_WAIT2;
					end
				end
				
				P_DATA_WAIT2: begin
					// do nothing, give time for memory write
					p_state <= P_DATA_NEXT;
				end
				
				P_DATA_NEXT: begin
					if(program_counter < (program_size-1'b1)) begin
						program_counter <= program_counter + 1;
						p_state <= P_DATA_WAIT;
					end
					else begin
						program_complete <= 1'b1;
						p_state <= P_IDLE;
					end
						
				end
			endcase
		end
		
		else if(mode==RUN_MODE) begin // device in run mode
			
			case(r_state)
				
				R_IDLE: begin
					addr_data_ram_b <= 0;
					r_state <= R_REC_WAIT;
					data_w_b <= 0;
				end
				
				R_REC_WAIT : begin
					if(rx_done==1) begin
						din_data_ram_b <= rx_data;
						r_state <= R_REC_WAIT2;
						data_w_b <= 1;
					end
					
					else if(btn_ok_clicked==1) begin
						r_state <= R_CPU_START;
					end
				end
				
				R_REC_WAIT2 : begin
					r_state <= R_REC_NEXT;
				end
				
				R_REC_NEXT : begin
					addr_data_ram_b <= addr_data_ram_b + 1;
					r_state <= R_REC_WAIT;
					data_w_b <= 0;
				end
				
				/************ CPU is started ***************/
				R_CPU_START : begin
					enable_inst_a <= 1;
					enable_inst_b <= 0;
					enable_data_a <= 1;
					enable_data_b <= 0;
					data_w_b <= 0;
					cpu_enable <= 1;
					r_state <= R_CPU_WAIT;
				end
				
				R_CPU_WAIT : begin
					if(cpu_finish==1) begin // stop the cpu
						enable_inst_a <= 0;
						enable_inst_b <= 0;
						enable_data_a <= 0;
						enable_data_b <= 1;
						data_w_b <= 0;
						cpu_enable <= 0;
						r_state <= R_TX_START;
					end
				end
				
				
				R_TX_START : begin
					addr_data_ram_b <= 0;
					r_state <= R_TX_LOAD;
				end
				
				R_TX_LOAD : begin
					tx_data <= dout_data_ram_b;
					r_state <= R_TX_SEND;
				end
				
				R_TX_SEND : begin
					tx_send <= 1;
					r_state <= R_TX_RDY_LOW;
				end
				
				R_TX_RDY_LOW : begin
					tx_send <= 0;
					r_state <= R_TX_RDY_LOW2;
				end
				
				R_TX_RDY_LOW2 : begin
					r_state <= R_TX_WAIT_RDY;
				end
				
				R_TX_WAIT_RDY : begin
					if(tx_ready==1) begin
						if(addr_data_ram_b < MAX_DATA_ADDR) begin
							addr_data_ram_b <= addr_data_ram_b + 1;
							r_state <= R_TX_LOAD;
						end
						
						else begin
							r_state <= R_DO_NOTHING;
						end
					end
				end
				
				default : begin
					r_state <= R_DO_NOTHING;
				end
			endcase
			
		end
	end
	/************************ end of state machine for device operation **************/
	
	assign LED[1:0] = mode; 
	assign LED[7:4] = (mode==PROGRAM_MODE) ? p_state:r_state;
	assign LED[3] = cpu_finish;
	assign LED[2] = cpu_enable;
	
	//assign LED = rx_data;
endmodule
