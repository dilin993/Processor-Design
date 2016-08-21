`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:52:15 08/09/2016 
// Design Name: 
// Module Name:    cpu_top 
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
module cpu_top(
	input clk_in,
	input enable, // this signal disable clock signal
	input reset, // clear pc & reset state machine
	output data_w, // data ram write enable
	output[15:0] addr_data_ram, // data memory 16bit address
	output[7:0]  din_data_ram,
	input[7:0] dout_data_ram,
	output inst_w, // instruction ram write enable
	output[7:0] addr_inst_ram, // instruction memory 8bit address
	//output[7:0]  din_inst_ram, ***not in use since instructions are never changed by cpu
	input[7:0] dout_inst_ram,
	output finish, // Signal to stop the cpu
	output[15:0] OUT_R,
	output[15:0] OUT_S,
	output[15:0] OUT_AC
    );
	 
	 /* wire definitions */
	 wire[15:0] BUS;
	 //wire[15:0] AR_OUT; not needed
	 wire[7:0] PC_OUT;
	 wire[7:0] IR_OUT;
	 wire[15:0] R_OUT;
	 wire[15:0] S_OUT;
	 wire[15:0] T_OUT;
	 wire[15:0] U_OUT;
	 wire[15:0] AC_OUT;
	 wire[15:0] ALU_OUT;
	 wire[7:0] REG_LOAD;
	 wire[2:0] MUX_SEL;
	 wire[3:0] ALU_SEL;
	 wire PC_INC;
	 wire Z;
	 wire clk;
	 /*******************/



	/*********AR**************/
	Reg_16bit AR (
    .clk(clk), 
    .load(REG_LOAD[0]), 
    .data_in(BUS), 
    .data_out(addr_data_ram)
    );
	 /*************************/
	 
	 
	 
	 /*********PC**************/
	Reg_8bit_clr PC (
    .clk(clk), 
    .load(REG_LOAD[2]), 
    .clr(reset), 
	 .inc(PC_INC),
    .data_in(BUS[7:0]), 
    .data_out(PC_OUT)
    );
	 assign addr_inst_ram = PC_OUT;
	/*************************/
	
	
	
	/*********IR**************/
	Reg_8bit IR (
    .clk(clk), 
    .load(REG_LOAD[7]),  
    .data_in(BUS[7:0]), 
    .data_out(IR_OUT)
    );
	/*************************/
	
	
	
	/*********R**************/
	Reg_16bit R (
    .clk(clk), 
    .load(REG_LOAD[3]), 
    .data_in(BUS), 
    .data_out(R_OUT)
    );
	 assign OUT_R = R_OUT;
	 /*************************/
	 
	 
	 
	 /*********S**************/
	Reg_16bit S (
    .clk(clk), 
    .load(REG_LOAD[4]), 
    .data_in(BUS), 
    .data_out(S_OUT)
    );
	 assign OUT_S = S_OUT;
	 /*************************/
	 
	 
	 
	 /*********T**************/
	Reg_16bit T (
    .clk(clk), 
    .load(REG_LOAD[5]), 
    .data_in(BUS), 
    .data_out(T_OUT)
    );
	 /*************************/
	 
	 
	 
	 /*********U**************/
	Reg_16bit U (
    .clk(clk), 
    .load(REG_LOAD[6]), 
    .data_in(BUS), 
    .data_out(U_OUT)
    );
	 /*************************/
	 
	 
	 
	 /*********AC**************/
	Reg_16bit AC (
    .clk(clk), 
    .load(REG_LOAD[1]), 
    .data_in(ALU_OUT), 
    .data_out(AC_OUT)
    );
	 assign OUT_AC = AC_OUT;
	 /*************************/
	 
	 
	 
	 
	 
	 /********* MUX **************/
	MUX_BUS MUX_B (
    .Select(MUX_SEL), 
    .DataM(dout_data_ram), 
    .InstM(dout_inst_ram), 
    .PC(PC_OUT), 
    .R(R_OUT), 
    .S(S_OUT), 
    .T(T_OUT), 
    .U(U_OUT), 
    .AC(AC_OUT), 
    .BUS(BUS)
    );
	 /***************************/
	 
	 
	 
	/********* ALU **************/
	ALU ALU16 (
    .ALUA(AC_OUT), 
    .ALUB(BUS), 
    .OP(ALU_SEL), 
    .ALUR(ALU_OUT), 
    .Z(Z)
    );
	/***************************/

	
	
	/********* STATE MACHINE **************/
	state_machine STATEMACHINE (
    .CLK(clk), 
	 .RESET(reset),
    .Z(Z), 
    .IR(IR_OUT), 
    .PCINC(PC_INC), 
    .FINISH(finish), 
    .D_W(data_w), 
    .I_W(inst_w), 
    .ALU_SEL(ALU_SEL), 
    .B_SEL(MUX_SEL), 
    .REG_LOAD(REG_LOAD)
    );
	/************************************/
	 
	 
	 assign clk = enable ? clk_in:1'b0;
	 
	 assign din_data_ram = BUS[7:0];
endmodule
