`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:14:27 07/30/2016 
// Design Name: 
// Module Name:    state_machine 
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
module state_machine(
	input CLK,
	input RESET,
	input Z,
	input[7:0] IR,
	output reg PCINC,
	output reg FINISH=0,
	output reg D_W = 0,
	output reg I_W = 0,
	output reg[3:0] ALU_SEL,
	output reg[2:0] B_SEL,
	output reg[7:0] REG_LOAD
    );
   
	
	//-----------------PARAMETER DEF------------------ 
	parameter
	FETCH1 = 8'd0,
	FETCH2 = 8'd1,
	FETCH3 = 8'd2,
	FETCH4 = 8'd52,
	
	NOP1 = 8'd3,
	
	LDAC1 = 8'd4,
	LDAC2 = 8'd5,
	LDAC3 = 8'd6,
	
	MVACR1 = 8'd7,
	
	MVACS1 = 8'd8,
	
	MVACT1 = 8'd9,
	
	MVACU1 = 8'd10,
	
	MOVR1 = 8'd11,
	
	MOVS1 = 8'd12,
	
	MOVT1 = 8'd13,
	
	MOVU1 = 8'd14,
	
	ADDR1 = 8'd15,
	
	ADDS1 = 8'd16,
	
	ADDT1 = 8'd17,
	
	ADDU1 = 8'd18,
	
	SUBR1 = 8'd19,
	
	SUBS1 = 8'd20,
	
	SUBT1 = 8'd21,
	
	SUBU1 = 8'd22,
	
	ANDR1 = 8'd23,
	
	ANDS1 = 8'd24,
	
	ANDT1 = 8'd25,
	
	ANDU1 = 8'd26,
	
	ORR1 = 8'd27,
	
	ORS1 = 8'd28,
	
	ORT1 = 8'd29,
	
	ORU1 = 8'd30,
	
	NOT1 = 8'd31,
	
	XORR1 = 8'd32,
	
	XORS1 = 8'd33,
	
	XORT1 = 8'd34,
	
	XORU1 = 8'd35,
	
	INCAC1 = 8'd36,
	
	CLAC1 = 8'd37,
	
	JMPZ1 = 8'd38,
	
	JMPZY1 = 8'd39,
	JMPZY2 = 8'd40,
	JMPZY3 = 8'd41,
	
	JMPZN1 = 8'd42,
	
	JMPNZ1 = 8'd43,
	
	JMPNZY1 = 8'd44,
	JMPNZY2 = 8'd45,
	JMPNZY3 = 8'd46,
	
	JMPNZN1 = 8'd47,
	
	STAC1 = 8'd48,
	STAC2 = 8'd49,
	
	MVACAR1 = 8'd50,
	
	END1 = 8'd51, // FETCH4 is 52
	END2 = 8'd53,
	END3 = 8'd54
	
	;
	
	//----------------------REGISTER---------------------------
	reg [7:0] prev_state;
	reg [7:0] next_state= FETCH1 ;
	
	
	always @ (negedge CLK) begin
		if(RESET==0)
			prev_state = next_state;
		else
			prev_state = FETCH1;
	end
	
	always @ (IR or prev_state or Z) 
		case(prev_state)
			FETCH1: begin						// BB <= Imem
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// Nothing
				B_SEL <= 3'd1;					// IMem to B
				REG_LOAD <= 8'd0;				// Non load
				D_W <= 0;						// Read
				next_state <= FETCH2;
			end
			
			FETCH2: begin						// IR <= BB			
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// Nothing
				B_SEL <= 3'd1;			      // IMem to B
				REG_LOAD <= 8'd128;		   // Load IR
				D_W <= 0;						// Read
				next_state <= FETCH3;
			end
			
			FETCH3: begin						// PC <= PC + 1
				PCINC <= 1;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// Do Nothing
				B_SEL <= 3'd1;
				REG_LOAD <= 8'd0;				// Non load
				D_W <= 0;						// Read
				next_state <= FETCH4;
			end
			
			FETCH4: begin						// Next_state <= IR
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// Do Nothing
				B_SEL <= 3'd1;
				REG_LOAD <= 8'd0;				// Non load
				D_W <= 0;						// Read
				next_state <= IR;
			end
			
			NOP1: begin							// Next_state <= Fetch1
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// Do Nothing
				B_SEL <= 3'd1;
				REG_LOAD <= 8'd0;				// Non load
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			LDAC1: begin						// BB <= Data Mem
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// Do Nothing
				B_SEL <= 3'd0;					// Data Mem
				REG_LOAD <= 8'd0;				// Load none
				D_W <= 0;						// Read
				next_state <= LDAC2;
			end
			
			LDAC2: begin						// BB <= D_Mem
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// Do Nothing
				B_SEL <= 3'd0;					// Data Mem
				REG_LOAD <= 8'd0;				// Load none
				D_W <= 0;						// Read
				next_state <= LDAC3;
			end
			
			LDAC3: begin						// AC <= BB
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd1;				// B
				B_SEL <= 3'd0;					// Load Mem
				REG_LOAD <= 8'd2;				// Load AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			MVACR1: begin						// R <= AC
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// A
				B_SEL <= 3'd7;					// AC
				REG_LOAD <= 8'd8;				// R
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			MVACS1: begin						// S <= AC
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// A
				B_SEL <= 3'd7;					// AC
				REG_LOAD <= 8'd16;				// S
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			MVACT1: begin						// T <= AC
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// A
				B_SEL <= 3'd7;					// AC
				REG_LOAD <= 8'd32;				// T
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			MVACU1: begin						// U <= AC
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// A
				B_SEL <= 3'd7;					// AC
				REG_LOAD <= 8'd64;				// U
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			MOVR1: begin						// AC <= R
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd1;				// B
				B_SEL <= 3'd3;					// R
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			MOVS1: begin						// AC <= S
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd1;				// B
				B_SEL <= 3'd4;					// S
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			MOVT1: begin						// AC <= T
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd1;				// B
				B_SEL <= 3'd5;					// T
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			MOVU1: begin						// AC <= U
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd1;				// B
				B_SEL <= 3'd6;					// U
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			ADDR1: begin						// AC <= AC + R
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd2;				// A + B
				B_SEL <= 3'd3;					// R
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			ADDS1: begin						// AC <= AC + S
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd2;				// A + B
				B_SEL <= 3'd4;					// S
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			ADDT1: begin						// AC <= AC + T
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd2;				// A + B
				B_SEL <= 3'd5;					// T
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			ADDU1: begin						// AC <= AC + U
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd2;				// A + B
				B_SEL <= 3'd6;					// U
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			SUBR1: begin						// AC <= AC - R
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd3;				// A - B
				B_SEL <= 3'd3;					// R
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			SUBS1: begin						// AC <= AC - S
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd3;				// A - B
				B_SEL <= 3'd4;					// S
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			SUBT1: begin						// AC <= AC - T
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd3;				// A - B
				B_SEL <= 3'd5;					// T
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			SUBU1: begin						// AC <= AC - U
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd3;				// A - B
				B_SEL <= 3'd6;					// R
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			ANDR1: begin						// AC <= AC & R
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd9;				// A & B
				B_SEL <= 3'd3;					// R
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			ANDS1: begin						// AC <= AC & S
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd9;				// A & B
				B_SEL <= 3'd4;					// S
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			ANDT1: begin						// AC <= AC & T
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd9;				// A & B
				B_SEL <= 3'd5;					// T
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			ANDU1: begin						// AC <= AC & U
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd9;				// A & B
				B_SEL <= 3'd6;					// R
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			ORR1: begin						// AC <= AC | R
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd10;				// A | B
				B_SEL <= 3'd3;					// R
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			ORS1: begin						// AC <= AC | S
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd10;				// A | B
				B_SEL <= 3'd4;					// S
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			ORT1: begin						// AC <= AC | T
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd10;				// A | B
				B_SEL <= 3'd5;					// T
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			ORU1: begin						// AC <= AC | U
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd10;				// A | B
				B_SEL <= 3'd6;					// R
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			NOT1: begin						// AC <= ~AC
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd12;				// ~A
				B_SEL <= 3'd7;					// AC
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			XORR1: begin						// AC <= AC xor R
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd11;				// A xor B
				B_SEL <= 3'd3;					// R
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			XORS1: begin						// AC <= AC xor S
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd11;				// A xor B
				B_SEL <= 3'd4;					// S
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			XORT1: begin						// AC <= AC xor T
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd11;				// A xor B
				B_SEL <= 3'd5;					// T
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			XORU1: begin						// AC <= AC xor U
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd11;				// A xor B
				B_SEL <= 3'd6;					// R
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			INCAC1: begin						// AC <= AC + 1
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd4;				// A + 1
				B_SEL <= 3'd7;					// AC
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			CLAC1: begin						// AC <= 0
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd5;				// 0
				B_SEL <= 3'd7;					// AC
				REG_LOAD <= 8'd2;				// AC
				D_W <= 0;						// Read
				next_state <= FETCH1;
			end
			
			JMPZ1: begin						// Jump
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// A
				B_SEL <= 3'd7;					// AC
				REG_LOAD <= 8'd0;				// NO LOAD
				D_W <= 0;						// Read
				if(Z)next_state <= JMPZY1; // Zero
				else next_state <= JMPZN1; // Nor Zero
			end
			
			JMPZY1: begin						// PC <= PC + 1
				PCINC <= 1;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// A
				B_SEL <= 3'd1;					// I Mem
				REG_LOAD <= 8'd0;				// NO LOAD
				D_W <= 0;						// Read
				next_state <= JMPZY2; 		
			end
			
			JMPZY2: begin						// Read
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// A
				B_SEL <= 3'd1;					// I Mem
				REG_LOAD <= 8'd0;				// NO LOAD
				D_W <= 0;						// Read
				next_state <= JMPZY3; 		
			end
			
			JMPZY3: begin						// PC <= BB
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// A
				B_SEL <= 3'd1;					// I Mem
				REG_LOAD <= 8'd4;				// PC
				D_W <= 0;						// Read
				next_state <= FETCH1; 		
			end
			
			JMPZN1: begin						// PC <= PC + 1
				PCINC <= 1;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// A
				B_SEL <= 3'd7;					// AC
				REG_LOAD <= 8'd0;				// NO LOAD
				D_W <= 0;						// Read
				next_state <= FETCH1; 		
			end
			
			JMPNZ1: begin						// Jump
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// A
				B_SEL <= 3'd7;					// AC
				REG_LOAD <= 8'd0;				// NO LOAD
				D_W <= 0;						// Read
				if(Z)next_state <= JMPNZN1; // NOT ZERO
				else next_state <= JMPNZY1; // Zero
			end
			
			JMPNZY1: begin						// PC <= PC + 1
				PCINC <= 1;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// A
				B_SEL <= 3'd1;					// I Mem
				REG_LOAD <= 8'd0;				// NO LOAD
				D_W <= 0;						// Read
				next_state <= JMPNZY2; 		
			end
			
			JMPNZY2: begin						// Read
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// A
				B_SEL <= 3'd1;					// I Mem
				REG_LOAD <= 8'd0;				// NO LOAD
				D_W <= 0;						// Read
				next_state <= JMPNZY3; 		
			end
			
			JMPNZY3: begin						// PC <= BB
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// A
				B_SEL <= 3'd1;					// I Mem
				REG_LOAD <= 8'd4;				// PC
				D_W <= 0;						// Read
				next_state <= FETCH1; 		
			end
			
			JMPNZN1: begin						// PC <= PC + 1
				PCINC <= 1;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// A
				B_SEL <= 3'd7;					// AC
				REG_LOAD <= 8'd0;				// NO LOAD
				D_W <= 0;						// Read
				next_state <= FETCH1; 		
			end
			
			STAC1: begin						// M[AR] <= AC
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// A
				B_SEL <= 3'd7;					// AC
				REG_LOAD <= 8'd0;				// NO LOAD
				D_W <= 1;						// WRITE
				next_state <= STAC2; 		
			end
			
			STAC2: begin						// FNISH WRITE
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// A
				B_SEL <= 3'd7;					// AC
				REG_LOAD <= 8'd0;				// NO LOAD
				D_W <= 1;						// WRITE
				next_state <= FETCH1; 		
			end
			
			MVACAR1: begin						// AR <= AC
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// A
				B_SEL <= 3'd7;					// AC
				REG_LOAD <= 8'd1;				// AR
				D_W <= 0;						// READ
				next_state <= FETCH1; 		
			end
			
			END1: begin						// AC <- 0
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd5;				// ALU_out = 0
				B_SEL <= 3'd7;					// BUS = AC
				REG_LOAD <= 8'd2;				// load AC
				D_W <= 0;						// READ
				next_state <= END2; 		
			end
			
			END2: begin						// PC <- AC
				PCINC <= 0;
				FINISH <= 0;
				ALU_SEL <= 4'd0;				// A
				B_SEL <= 3'd7;					// BUS = AC
				REG_LOAD <= 8'd4;				// load PC
				D_W <= 0;						// READ
				next_state <= END3; 		
			end
			
			END3: begin						// Finish
				PCINC <= 0;
				FINISH <= 1;
				ALU_SEL <= 4'd0;				// A
				B_SEL <= 3'd7;					// BUS = AC
				REG_LOAD <= 8'd0;				// no load
				D_W <= 0;						// READ
				next_state <= FETCH1; 		
			end
			
					
	endcase

endmodule