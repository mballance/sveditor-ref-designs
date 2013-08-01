// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs_rxio_sync_decoder.v
// Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
// 4150 Network Circle, Santa Clara, California 95054, U.S.A.
//
// * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; version 2 of the License.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
// 
// For the avoidance of doubt, and except that if any non-GPL license 
// choice is available it will apply instead, Sun elects to use only 
// the General Public License version 2 (GPLv2) at this time for any 
// software where a choice of GPL license versions is made 
// available with the language indicating that GPLv2 or any later version 
// may be used, or where a choice of which version of the GPL is applied is 
// otherwise unspecified. 
//
// Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
// CA 95054 USA or visit www.sun.com if you need additional information or 
// have any questions. 
// 
// ========== Copyright Header End ============================================
// ****************************************************************
//
//   Sun Proprietary/Confidential: Internal Use Only
//
// ****************************************************************
//   Design: IB Physical Interface Core
//    Block: IB 10b8b Decoder
//   Author: Carlos Castil 
//   
//   Module: xpcs_rxio_sync_decoder
//     File: xpcs_rxio_sync_decoder.v
//
//   Description: This block performs 10b8b decoding on incomming
//		  symbols.
//
//
//   Revision History
//   ------------------------------------------------------------
//      Ver   Date      Comments
//   ------------------------------------------------------------
//      1.0   9/24/02   Created
// ****************************************************************



module xpcs_rxio_sync_decoder (
		rx_lane_clk,
		rx_lane_reset,
		rx_symbol,

		byte,
		special,
		error);


input		rx_lane_clk;		// rx_lane_clk, 250 MHz
input		rx_lane_reset;

input	[9:0]	rx_symbol;		// receive encoded 10 bit data

output	[7:0]	byte;			// decoded data byte
output		special;		// decoded special characters
output		error;			// decoded error

// Wires and Regs which are not flops

wire		noneof6;
wire		oneof6;
wire		twoof6;
wire		threeof6;
wire		fourof6;
wire		fiveof6;
wire		sixof6;			//no. of 1#s in data[9:4]
wire		noneof4;
wire		oneof4;
wire		twoof4;
wire		threeof4;
wire		fourof4;		//no. of 1#s in data[3:0]
wire		pos_disp;
wire		newRD;			// running disparity signals
reg	[7:0]	deco1_fcn;
reg	[3:0]	deco2_fcn;

// Regs which are flops

reg	[9:0]	symbol;
reg		RDreg;			// running disparity register

// Register symbol input

always @ (posedge rx_lane_clk)
  if (rx_lane_reset)
    symbol <=  10'b0000000000;
  else
    symbol <=  rx_symbol;

// Register to hold running disparity

always @ (posedge rx_lane_clk)
  if (rx_lane_reset)
    RDreg <=  1'b0;
  else
    RDreg <=  pos_disp;


// Instead just drive outputs

assign byte    = {deco2_fcn[3:1],deco1_fcn[7:3]};
assign special = deco1_fcn[0];

// Error Legend:   Disparity   |  Decode      |  Decode
assign error   = (deco1_fcn[1] | deco2_fcn[0] | deco1_fcn[2]);

// Running disparity calculator

assign	noneof4 = ~(symbol[0] | symbol[1] | symbol[2] | symbol[3]);

assign	fourof4 = (symbol[0] & symbol[1] & symbol[2] & symbol[3]);

assign	threeof4 = ((symbol[0]^symbol[1]) & (~(symbol[2]^symbol[3]) &
		   (symbol[2]&symbol[3]))) | ((symbol[2]^symbol[3]) & 
		   (~(symbol[0]^symbol[1]) & (symbol[0]&symbol[1])));
		
assign	oneof4 = ((~symbol[0]^~symbol[1]) & (~(~symbol[2]^~symbol[3]) & 
		 (~symbol[2]&~symbol[3]))) | ((~symbol[2]^~symbol[3]) & 
		 (~(~symbol[0]^~symbol[1]) & (~symbol[0]&~symbol[1])));
		
assign	twoof4 = ((symbol[0]^symbol[1]) & (symbol[2]^symbol[3])) | ((symbol[0]&symbol[1]) ^ (symbol[2]&symbol[3]));
		
assign	noneof6 = ~(symbol[4] | symbol[5] | symbol[6] | symbol[7] | symbol[8] | symbol[9]);
		
assign	sixof6 = (symbol[4] & symbol[5] & symbol[6] & symbol[7] & symbol[8] & symbol[9]);
		
assign	fiveof6 = ( (((symbol[4]^symbol[5]) & (~(symbol[6]^symbol[7]) & 
		(symbol[6]&symbol[7]))) | ((symbol[6]^symbol[7]) & 
		(~(symbol[4]^symbol[5]) & (symbol[4]&symbol[5])))) & 
		(symbol[8] & symbol[9]) ) | ((symbol[4] & symbol[5] & 
		symbol[6] & symbol[7]) & (symbol[8] ^ symbol[9]));
		
assign	oneof6 = ( (((~symbol[4]^~symbol[5]) & (~(~symbol[6]^~symbol[7]) & 
		(~symbol[6]&~symbol[7]))) | ((~symbol[6]^~symbol[7]) & 
		(~(~symbol[4]^~symbol[5]) & (~symbol[4]&~symbol[5])))) &
		(~symbol[8] & ~symbol[9]) ) |
		((~symbol[4] & ~symbol[5] & ~symbol[6] & ~symbol[7]) & (~symbol[8] ^ ~symbol[9]));
		
assign	fourof6 = ( (((symbol[4]^symbol[5]) & (symbol[6]^symbol[7])) | 
		((symbol[4]&symbol[5]) ^ (symbol[6]&symbol[7]))) & 
		(symbol[8] & symbol[9]) ) |	( (((symbol[4]^symbol[5]) & 
		(~(symbol[6]^symbol[7]) & (symbol[6]&symbol[7]))) | 
		((symbol[6]^symbol[7]) & (~(symbol[4]^symbol[5]) & 
		(symbol[4]&symbol[5])))) & (symbol[8] ^ symbol[9]) ) |
		( (symbol[4] & symbol[5] & symbol[6] & symbol[7]) & 
		(~(symbol[8]|symbol[9])) );
		
assign	twoof6 = ( (((~symbol[4]^~symbol[5]) & (~symbol[6]^~symbol[7])) | 
		((~symbol[4]&~symbol[5]) ^ (~symbol[6]&~symbol[7]))) & 
		(~symbol[8] & ~symbol[9]) ) | ( (((~symbol[4]^~symbol[5]) & 
		(~(~symbol[6]^~symbol[7]) & (~symbol[6]&~symbol[7]))) 
                       | ((~symbol[6]^~symbol[7]) & (~(~symbol[4]^~symbol[5]) & 
		(~symbol[4]&~symbol[5])))) & (~symbol[8] ^ ~symbol[9]) ) | 
                       ( (~symbol[4] & ~symbol[5] & ~symbol[6] & ~symbol[7]) & 
		(~(~symbol[8]|~symbol[9])) );
		
assign	threeof6 = ( (((~symbol[4]^~symbol[5]) & (~(~symbol[6]^~symbol[7]) & 
		(~symbol[6]&~symbol[7]))) | ((~symbol[6]^~symbol[7]) & 
		(~(~symbol[4]^~symbol[5]) & (~symbol[4]&~symbol[5])))) & 
		(symbol[8] & symbol[9]) ) |	( (((symbol[4]^symbol[5]) & 
		(symbol[6]^symbol[7])) | 
		((symbol[4]&symbol[5]) ^ (symbol[6]&symbol[7]))) & 
		(symbol[8] ^ symbol[9]) ) |	( (((symbol[4]^symbol[5]) & 
		(~(symbol[6]^symbol[7]) & (symbol[6]&symbol[7])))
                       |  ((symbol[6]^symbol[7]) & (~(symbol[4]^symbol[5]) & 
		(symbol[6]&symbol[7])))) & ( ~(symbol[8] | symbol[9])) );
		
assign	newRD = ((noneof6 | oneof6 | twoof6) | 
		(threeof6 & (symbol[9:4]==6'b111000))) ? 1'b0 :
		((fourof6 | fiveof6 | sixof6) | (threeof6 & 
		(symbol[9:4]==6'b000111))) ? 1'b1 : RDreg;
		
assign	pos_disp =  ((noneof4 | oneof4) | (twoof4 & 
		(symbol[3:0]==4'b1100))) ? 1'b0 : ((threeof4 | fourof4)
		| (twoof4 & (symbol[3:0]==4'b0011))) ? 1'b1 : newRD;

// 6b5b decode on most significant bits of rx_10bdata
// ~RDreg means that you can only get this code if the beginning
//  running disparity is one.  So if zero, error is flagged.
// RDreg means that you can only get this code if the beginning
//  running disparity is zero.  So if one, error is flagged.
// 1'b0 means that this code can be received whether the 
//  running disparity is zero or one.  So no check is done.
//
// The function output is:
// deco1_fcn = {decodata[4:0], dec_err1, rderr, Kchar}

always @ (symbol or RDreg)
  case (symbol[9:4]) 	//synopsys parallel_case full_case
    /* D0  + */ 6'b011000: deco1_fcn = {5'b00000, 1'b0, !RDreg, 1'b0};
    /* D0  - */ 6'b100111: deco1_fcn = {5'b00000, 1'b0, RDreg,  1'b0};
    /* D1  + */ 6'b100010: deco1_fcn = {5'b00001, 1'b0, !RDreg, 1'b0};
    /* D1  - */ 6'b011101: deco1_fcn = {5'b00001, 1'b0, RDreg,  1'b0};
    /* D2  + */ 6'b010010: deco1_fcn = {5'b00010, 1'b0, !RDreg, 1'b0};
    /* D2  - */ 6'b101101: deco1_fcn = {5'b00010, 1'b0, RDreg,  1'b0};
    /* D3  0 */ 6'b110001: deco1_fcn = {5'b00011, 1'b0, 1'b0,   1'b0};
    /* D4  + */ 6'b001010: deco1_fcn = {5'b00100, 1'b0, !RDreg, 1'b0};
    /* D4  - */ 6'b110101: deco1_fcn = {5'b00100, 1'b0, RDreg,  1'b0};
    /* D5  0 */ 6'b101001: deco1_fcn = {5'b00101, 1'b0, 1'b0,   1'b0};
    /* D6  0 */ 6'b011001: deco1_fcn = {5'b00110, 1'b0, 1'b0,   1'b0};
    /* D7  + */ 6'b000111: deco1_fcn = {5'b00111, 1'b0, !RDreg, 1'b0};
    /* D7  - */ 6'b111000: deco1_fcn = {5'b00111, 1'b0, RDreg,  1'b0};
    /* D8  + */ 6'b000110: deco1_fcn = {5'b01000, 1'b0, !RDreg, 1'b0};
    /* D8  - */ 6'b111001: deco1_fcn = {5'b01000, 1'b0, RDreg,  1'b0};
    /* D9  0 */ 6'b100101: deco1_fcn = {5'b01001, 1'b0, 1'b0,   1'b0};
    /* D10 0 */ 6'b010101: deco1_fcn = {5'b01010, 1'b0, 1'b0,   1'b0};
    /* D11 0 */ 6'b110100: deco1_fcn = {5'b01011, 1'b0, 1'b0,   1'b0};// Has Weird AX 7 
    /* D12 0 */ 6'b001101: deco1_fcn = {5'b01100, 1'b0, 1'b0,   1'b0};
    /* D13 0 */ 6'b101100: deco1_fcn = {5'b01101, 1'b0, 1'b0,   1'b0};// Has Weird AX 7 
    /* D14 0 */ 6'b011100: deco1_fcn = {5'b01110, 1'b0, 1'b0,   1'b0};// Has Weird AX 7 
    /* D15 + */ 6'b101000: deco1_fcn = {5'b01111, 1'b0, !RDreg, 1'b0};
    /* D15 - */ 6'b010111: deco1_fcn = {5'b01111, 1'b0, RDreg,  1'b0};
    /* D16 + */ 6'b100100: deco1_fcn = {5'b10000, 1'b0, !RDreg, 1'b0};
    /* D16 - */ 6'b011011: deco1_fcn = {5'b10000, 1'b0, RDreg,  1'b0};
    /* D17 0 */ 6'b100011: deco1_fcn = {5'b10001, 1'b0, 1'b0,   1'b0};// Has Weird AX 7
    /* D18 0 */ 6'b010011: deco1_fcn = {5'b10010, 1'b0, 1'b0,   1'b0};// Has Weird AX 7
    /* D19 0 */ 6'b110010: deco1_fcn = {5'b10011, 1'b0, 1'b0,   1'b0};
    /* D20 0 */ 6'b001011: deco1_fcn = {5'b10100, 1'b0, 1'b0,   1'b0};// Has Weird 7
    /* D21 0 */ 6'b101010: deco1_fcn = {5'b10101, 1'b0, 1'b0,   1'b0};
    /* D22 0 */ 6'b011010: deco1_fcn = {5'b10110, 1'b0, 1'b0,   1'b0};
    /* D23 + */ 6'b000101: deco1_fcn = {5'b10111, 1'b0, !RDreg, (symbol[3:0]==4'b0111)};// PAD (23.7)
    /* D23 - */ 6'b111010: deco1_fcn = {5'b10111, 1'b0, RDreg,  (symbol[3:0]==4'b1000)};// PAD (23.7)
    /* D24 + */ 6'b001100: deco1_fcn = {5'b11000, 1'b0, !RDreg, 1'b0};
    /* D24 - */ 6'b110011: deco1_fcn = {5'b11000, 1'b0, RDreg,  1'b0};
    /* D25 0 */ 6'b100110: deco1_fcn = {5'b11001, 1'b0, 1'b0,   1'b0};
    /* D26 0 */ 6'b010110: deco1_fcn = {5'b11010, 1'b0, 1'b0,   1'b0};
    /* D27 + */ 6'b001001: deco1_fcn = {5'b11011, 1'b0, !RDreg, (symbol[3:0]==4'b0111)};// SDP (27.7)
    /* D27 - */ 6'b110110: deco1_fcn = {5'b11011, 1'b0, RDreg,  (symbol[3:0]==4'b1000)};// SDP (27.7)

    /* D28 0 */ 6'b001110: deco1_fcn = {5'b11100, 1'b0, 1'b0,   1'b0};

    /* D29 + */ 6'b010001: deco1_fcn = {5'b11101, 1'b0, !RDreg, (symbol[3:0]==4'b0111)};// EGP (29.7)
    /* D29 - */ 6'b101110: deco1_fcn = {5'b11101, 1'b0, RDreg,  (symbol[3:0]==4'b1000)};// EGP (29.7)

    /* D30 + */ 6'b100001: deco1_fcn = {5'b11110, 1'b0, !RDreg, (symbol[3:0]==4'b0111)};// EBP (30.7) 
    /* D30 - */ 6'b011110: deco1_fcn = {5'b11110, 1'b0, RDreg,  (symbol[3:0]==4'b1000)};// EBP (30.7) 

    /* D31 + */ 6'b010100: deco1_fcn = {5'b11111, 1'b0, !RDreg, 1'b0};
    /* D31 - */ 6'b101011: deco1_fcn = {5'b11111, 1'b0, RDreg,  1'b0};

    // COM (28.5) SLP (28.2) ALG (28.3) SEQ (28.4) SKP (28.0)  ALL OTHERS 1,6,7 are decode errors

    /* K28 + */	6'b110000: deco1_fcn = {5'b11100, 1'b0, !RDreg, 1'b1};

    // COM (28.5) SLP (28.2) ALG (28.3) SEQ (28.4) SKP (28.0)  ALL OTHERS 1,6,7 are decode errors

    /* K28 - */	6'b001111: deco1_fcn = {5'b11100, 1'b0, RDreg,  1'b1}; 

                  default: deco1_fcn = {5'b00000, 1'b1, 1'b0,   1'b0}; // dec_err1
  endcase	

// 4b3b decode on least significant bits of rx_10bdata
// deco2_fcn = {decodata[7:5], error }
  
always @ (symbol or newRD or deco1_fcn)
  case ({deco1_fcn[0],newRD,symbol[3:0]}) //synopsys parallel_case full_case

    /* NS Dx.0 + */ 6'b010100: deco2_fcn = {3'b000, 1'b0};
    /* NS Dx.0 - */ 6'b001011: deco2_fcn = {3'b000, 1'b0};
    /* SS Dx.0 + */ 6'b110100: deco2_fcn = {3'b000, 1'b0}; // K28.0 
    /* SS Dx.0 - */ 6'b101011: deco2_fcn = {3'b000, 1'b0}; // K28.0
    
    /* NS Dx.1 + */ 6'b011001: deco2_fcn = {3'b001, 1'b0};
    /* NS Dx.1 - */ 6'b001001: deco2_fcn = {3'b001, 1'b0};
    /* SS Dx.1 + */ 6'b111001: deco2_fcn = {3'b001, 1'b0}; // Reserved Symbol Link Error 
    /* SS Dx.1 - */ 6'b100110: deco2_fcn = {3'b001, 1'b0}; // Reserved Symbol Link Error 

    /* NS Dx.2 + */ 6'b010101: deco2_fcn = {3'b010, 1'b0};
    /* NS Dx.2 - */ 6'b000101: deco2_fcn = {3'b010, 1'b0};
    /* SS Dx.2 + */ 6'b110101: deco2_fcn = {3'b010, 1'b0}; // K28.2
    /* SS Dx.2 - */ 6'b101010: deco2_fcn = {3'b010, 1'b0}; // K28.2
 
    /* NS Dx.3 + */ 6'b010011: deco2_fcn = {3'b011, 1'b0};
    /* NS Dx.3 - */ 6'b001100: deco2_fcn = {3'b011, 1'b0};
    /* SS Dx.3 + */ 6'b110011: deco2_fcn = {3'b011, 1'b0}; // K28.3
    /* SS Dx.3 - */ 6'b101100: deco2_fcn = {3'b011, 1'b0}; // K28.3
       
    /* NS Dx.4 + */ 6'b010010: deco2_fcn = {3'b100, 1'b0};
    /* NS Dx.4 - */ 6'b001101: deco2_fcn = {3'b100, 1'b0};
    /* SS Dx.4 + */ 6'b110010: deco2_fcn = {3'b100, 1'b0}; // K28.4  
    /* SS Dx.4 - */ 6'b101101: deco2_fcn = {3'b100, 1'b0}; // K28.4  

    /* NS Dx.5 + */ 6'b011010: deco2_fcn = {3'b101, 1'b0};
    /* NS Dx.5 - */ 6'b001010: deco2_fcn = {3'b101, 1'b0};
    /* SS Dx.5 + */ 6'b111010: deco2_fcn = {3'b101, 1'b0}; // K28.5
    /* SS Dx.5 - */ 6'b100101: deco2_fcn = {3'b101, 1'b0}; // K28.5
    
    /* NS Dx.6 + */ 6'b010110: deco2_fcn = {3'b110, 1'b0};
    /* NS Dx.6 - */ 6'b000110: deco2_fcn = {3'b110, 1'b0};
    /* SS Dx.6 + */ 6'b110110: deco2_fcn = {3'b110, 1'b0}; // Reserved Symbol Link Error
    /* SS Dx.6 - */ 6'b101001: deco2_fcn = {3'b110, 1'b0}; // Reserved Symbol Link Error
    
    /* NS Dx.7 + */ 6'b010001: deco2_fcn = {3'b111, 1'b0};
    /* NS Dx.7 - */ 6'b001110: deco2_fcn = {3'b111, 1'b0};
    /* NS Ax.7 + */ 6'b011000: deco2_fcn = {3'b111, 1'b0};
    /* NS Ax.7 - */ 6'b000111: deco2_fcn = {3'b111, 1'b0};
    /* SS Ax.7 + */ 6'b111000: deco2_fcn = {3'b111, 1'b0}; // 23,27,29,30.7
    /* SS Ax.7 - */ 6'b100111: deco2_fcn = {3'b111, 1'b0}; // 23,27,29,30.7
    
                      default: deco2_fcn = {3'b000, 1'b1}; // ERROR 
  endcase

endmodule
