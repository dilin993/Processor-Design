`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:37:03 08/21/2016
// Design Name:   cpu_top
// Module Name:   D:/Processor-Design/CPU_test_bench.v
// Project Name:  ProcessorDesign_8_9
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_test_bench;

	localparam PERIOD = 10;
	
	// Inputs
	reg clk_in;
	reg enable;
	reg reset;
	wire [7:0] dout_data_ram;
	wire [7:0] dout_inst_ram;

	// Outputs
	wire data_w;
	wire [15:0] addr_data_ram;
	wire [7:0] din_data_ram;
	wire inst_w;
	wire [7:0] addr_inst_ram;
	wire finish;
	wire[15:0] R_OUT;
	wire[15:0] S_OUT;
	wire[15:0] AC_OUT;

	// Instantiate the Unit Under Test (UUT)
	cpu_top uut (
		.clk_in(clk_in), 
		.enable(enable), 
		.reset(reset), 
		.data_w(data_w), 
		.addr_data_ram(addr_data_ram), 
		.din_data_ram(din_data_ram), 
		.dout_data_ram(dout_data_ram), 
		.inst_w(inst_w), 
		.addr_inst_ram(addr_inst_ram), 
		.dout_inst_ram(dout_inst_ram), 
		.finish(finish),
		.OUT_R(R_OUT),
		.OUT_S(S_OUT),
		.OUT_AC(AC_OUT)
	);
	
	// Instantiate data ram
	data_ram_test data_ram (
    .clk_in(clk_in), 
    .data_w(data_w), 
    .addr(addr_data_ram), 
    .din(din_data_ram), 
    .dout(dout_data_ram)
    );
	 
	 
	 
	// Instantiate the instruction ram
	inst_ram_test inst_ram (
    .clk_in(clk_in), 
    .inst_w(inst_w), 
    .addr(addr_inst_ram), 
    .dout(dout_inst_ram)
    );
	 
	 always #(PERIOD/2) clk_in = ~clk_in;

	initial begin
		// Initialize Inputs
		clk_in = 0;
		enable = 0;
		reset = 1;
		
		#(4*PERIOD);
		
		enable = 1;
		reset = 0;
		
		#(100*PERIOD);
		$finish;
	end
      
endmodule

