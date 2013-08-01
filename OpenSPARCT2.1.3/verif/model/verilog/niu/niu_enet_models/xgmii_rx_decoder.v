// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xgmii_rx_decoder.v
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
module xgmii_rx_decoder (
		rx_clk,
		rst,

		rx_10bdec_in,

		rx_8bdec_out,
		special);

input		rx_clk;			// rx clk, 250 MHz
input		rst;			// synchronous active low reset

input	[9:0]	rx_10bdec_in;		// receive encoded 10 bit data

output	[7:0]	rx_8bdec_out;		// decoded data byte
output		special;	// decoded special characters & errors


wire	[9:0]	rx_10bdec_int;		// receive encoded 10 bit data


//reg		special;			// running disparity register

reg		RDreg;			// running disparity register
wire		noneof6,
		oneof6,
		twoof6,
		threeof6,
		fourof6,
		fiveof6,
		sixof6;			//no. of 1#s in data[9:4]
wire		noneof4,
		oneof4,
		twoof4,
		threeof4,
		fourof4;		//no. of 1#s in data[3:0]
wire            control;
wire		pos_disp, RD, newRD;	// running disparity signals
reg	[7:0]	deco1_fcn;
reg	[4:0]	deco2_fcn;

// decode data

assign rx_10bdec_int[9:0] = {rx_10bdec_in[0],rx_10bdec_in[1], rx_10bdec_in[2],
                             rx_10bdec_in[3],rx_10bdec_in[4], rx_10bdec_in[5],
                             rx_10bdec_in[6],rx_10bdec_in[7], rx_10bdec_in[8],
                             rx_10bdec_in[9]};

assign rx_8bdec_out = {deco2_fcn[4:2],deco1_fcn[7:3]};
assign special      = deco1_fcn[0];

// Register to hold running disparity

always @ (posedge rx_clk)
  if (rst)
    RDreg <=  1'b0;
  else
    RDreg <=  pos_disp;

// Running disparity calculator

assign	noneof4 = ~(rx_10bdec_int[0] | rx_10bdec_int[1] | rx_10bdec_int[2] | rx_10bdec_int[3]);

assign	fourof4 = (rx_10bdec_int[0] & rx_10bdec_int[1] & rx_10bdec_int[2] & rx_10bdec_int[3]);

assign	threeof4 = ((rx_10bdec_int[0]^rx_10bdec_int[1]) & (~(rx_10bdec_int[2]^rx_10bdec_int[3]) &
		   (rx_10bdec_int[2]&rx_10bdec_int[3]))) | ((rx_10bdec_int[2]^rx_10bdec_int[3]) & 
		   (~(rx_10bdec_int[0]^rx_10bdec_int[1]) & (rx_10bdec_int[0]&rx_10bdec_int[1])));
		
assign	oneof4 = ((~rx_10bdec_int[0]^~rx_10bdec_int[1]) & (~(~rx_10bdec_int[2]^~rx_10bdec_int[3]) & 
		 (~rx_10bdec_int[2]&~rx_10bdec_int[3]))) | ((~rx_10bdec_int[2]^~rx_10bdec_int[3]) & 
		 (~(~rx_10bdec_int[0]^~rx_10bdec_int[1]) & (~rx_10bdec_int[0]&~rx_10bdec_int[1])));
		
assign	twoof4 = ((rx_10bdec_int[0]^rx_10bdec_int[1]) & (rx_10bdec_int[2]^rx_10bdec_int[3])) | ((rx_10bdec_int[0]&rx_10bdec_int[1]) ^ (rx_10bdec_int[2]&rx_10bdec_int[3]));
		
assign	noneof6 = ~(rx_10bdec_int[4] | rx_10bdec_int[5] | rx_10bdec_int[6] | rx_10bdec_int[7] | rx_10bdec_int[8] | rx_10bdec_int[9]);
		
assign	sixof6 = (rx_10bdec_int[4] & rx_10bdec_int[5] & rx_10bdec_int[6] & rx_10bdec_int[7] & rx_10bdec_int[8] & rx_10bdec_int[9]);
		
assign	fiveof6 = ( (((rx_10bdec_int[4]^rx_10bdec_int[5]) & (~(rx_10bdec_int[6]^rx_10bdec_int[7]) & 
		(rx_10bdec_int[6]&rx_10bdec_int[7]))) | ((rx_10bdec_int[6]^rx_10bdec_int[7]) & 
		(~(rx_10bdec_int[4]^rx_10bdec_int[5]) & (rx_10bdec_int[4]&rx_10bdec_int[5])))) & 
		(rx_10bdec_int[8] & rx_10bdec_int[9]) ) | ((rx_10bdec_int[4] & rx_10bdec_int[5] & 
		rx_10bdec_int[6] & rx_10bdec_int[7]) & (rx_10bdec_int[8] ^ rx_10bdec_int[9]));
		
assign	oneof6 = ( (((~rx_10bdec_int[4]^~rx_10bdec_int[5]) & (~(~rx_10bdec_int[6]^~rx_10bdec_int[7]) & 
		(~rx_10bdec_int[6]&~rx_10bdec_int[7]))) | ((~rx_10bdec_int[6]^~rx_10bdec_int[7]) & 
		(~(~rx_10bdec_int[4]^~rx_10bdec_int[5]) & (~rx_10bdec_int[4]&~rx_10bdec_int[5])))) &
		(~rx_10bdec_int[8] & ~rx_10bdec_int[9]) ) |
		((~rx_10bdec_int[4] & ~rx_10bdec_int[5] & ~rx_10bdec_int[6] & ~rx_10bdec_int[7]) & (~rx_10bdec_int[8] ^ ~rx_10bdec_int[9]));
		
assign	fourof6 = ( (((rx_10bdec_int[4]^rx_10bdec_int[5]) & (rx_10bdec_int[6]^rx_10bdec_int[7])) | 
		((rx_10bdec_int[4]&rx_10bdec_int[5]) ^ (rx_10bdec_int[6]&rx_10bdec_int[7]))) & 
		(rx_10bdec_int[8] & rx_10bdec_int[9]) ) |	( (((rx_10bdec_int[4]^rx_10bdec_int[5]) & 
		(~(rx_10bdec_int[6]^rx_10bdec_int[7]) & (rx_10bdec_int[6]&rx_10bdec_int[7]))) | 
		((rx_10bdec_int[6]^rx_10bdec_int[7]) & (~(rx_10bdec_int[4]^rx_10bdec_int[5]) & 
		(rx_10bdec_int[4]&rx_10bdec_int[5])))) & (rx_10bdec_int[8] ^ rx_10bdec_int[9]) ) |
		( (rx_10bdec_int[4] & rx_10bdec_int[5] & rx_10bdec_int[6] & rx_10bdec_int[7]) & 
		(~(rx_10bdec_int[8]|rx_10bdec_int[9])) );
		
assign	twoof6 = ( (((~rx_10bdec_int[4]^~rx_10bdec_int[5]) & (~rx_10bdec_int[6]^~rx_10bdec_int[7])) | 
		((~rx_10bdec_int[4]&~rx_10bdec_int[5]) ^ (~rx_10bdec_int[6]&~rx_10bdec_int[7]))) & 
		(~rx_10bdec_int[8] & ~rx_10bdec_int[9]) ) | ( (((~rx_10bdec_int[4]^~rx_10bdec_int[5]) & 
		(~(~rx_10bdec_int[6]^~rx_10bdec_int[7]) & (~rx_10bdec_int[6]&~rx_10bdec_int[7]))) 
                       | ((~rx_10bdec_int[6]^~rx_10bdec_int[7]) & (~(~rx_10bdec_int[4]^~rx_10bdec_int[5]) & 
		(~rx_10bdec_int[4]&~rx_10bdec_int[5])))) & (~rx_10bdec_int[8] ^ ~rx_10bdec_int[9]) ) | 
                       ( (~rx_10bdec_int[4] & ~rx_10bdec_int[5] & ~rx_10bdec_int[6] & ~rx_10bdec_int[7]) & 
		(~(~rx_10bdec_int[8]|~rx_10bdec_int[9])) );
		
assign	threeof6 = ( (((~rx_10bdec_int[4]^~rx_10bdec_int[5]) & (~(~rx_10bdec_int[6]^~rx_10bdec_int[7]) & 
		(~rx_10bdec_int[6]&~rx_10bdec_int[7]))) | ((~rx_10bdec_int[6]^~rx_10bdec_int[7]) & 
		(~(~rx_10bdec_int[4]^~rx_10bdec_int[5]) & (~rx_10bdec_int[4]&~rx_10bdec_int[5])))) & 
		(rx_10bdec_int[8] & rx_10bdec_int[9]) ) |	( (((rx_10bdec_int[4]^rx_10bdec_int[5]) & 
		(rx_10bdec_int[6]^rx_10bdec_int[7])) | 
		((rx_10bdec_int[4]&rx_10bdec_int[5]) ^ (rx_10bdec_int[6]&rx_10bdec_int[7]))) & 
		(rx_10bdec_int[8] ^ rx_10bdec_int[9]) ) |	( (((rx_10bdec_int[4]^rx_10bdec_int[5]) & 
		(~(rx_10bdec_int[6]^rx_10bdec_int[7]) & (rx_10bdec_int[6]&rx_10bdec_int[7])))
                       |  ((rx_10bdec_int[6]^rx_10bdec_int[7]) & (~(rx_10bdec_int[4]^rx_10bdec_int[5]) & 
		(rx_10bdec_int[6]&rx_10bdec_int[7])))) & ( ~(rx_10bdec_int[8] | rx_10bdec_int[9])) );
		
assign	newRD = ((noneof6 | oneof6 | twoof6) | 
		(threeof6 & (rx_10bdec_int[9:4]==6'b111000))) ? 1'b0 :
		((fourof6 | fiveof6 | sixof6) | (threeof6 & 
		(rx_10bdec_int[9:4]==6'b000111))) ? 1'b1 : RDreg;
		
assign	pos_disp =  ((noneof4 | oneof4) | (twoof4 & 
		(rx_10bdec_int[3:0]==4'b1100))) ? 1'b0 : ((threeof4 | fourof4)
		| (twoof4 & (rx_10bdec_int[3:0]==4'b0011))) ? 1'b1 : newRD;

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

always @ (rx_10bdec_int or RDreg)
  case (rx_10bdec_int[9:4]) 	//####synopsys parallel_case full_case
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
    /* D11 0 */ 6'b110100: deco1_fcn = {5'b01011, 1'b0, 1'b0,   1'b0};
    /* D12 0 */ 6'b001101: deco1_fcn = {5'b01100, 1'b0, 1'b0,   1'b0};
    /* D13 0 */ 6'b101100: deco1_fcn = {5'b01101, 1'b0, 1'b0,   1'b0};
    /* D14 0 */ 6'b011100: deco1_fcn = {5'b01110, 1'b0, 1'b0,   1'b0};
    /* D15 + */ 6'b101000: deco1_fcn = {5'b01111, 1'b0, !RDreg, 1'b0};
    /* D15 - */ 6'b010111: deco1_fcn = {5'b01111, 1'b0, RDreg,  1'b0};
    /* D16 + */ 6'b100100: deco1_fcn = {5'b10000, 1'b0, !RDreg, 1'b0};
    /* D16 - */ 6'b011011: deco1_fcn = {5'b10000, 1'b0, RDreg,  1'b0};
    /* D17 0 */ 6'b100011: deco1_fcn = {5'b10001, 1'b0, 1'b0,   1'b0};
    /* D18 0 */ 6'b010011: deco1_fcn = {5'b10010, 1'b0, 1'b0,   1'b0};
    /* D19 0 */ 6'b110010: deco1_fcn = {5'b10011, 1'b0, 1'b0,   1'b0};
    /* D20 0 */ 6'b001011: deco1_fcn = {5'b10100, 1'b0, 1'b0,   1'b0};
    /* D21 0 */ 6'b101010: deco1_fcn = {5'b10101, 1'b0, 1'b0,   1'b0};
    /* D22 0 */ 6'b011010: deco1_fcn = {5'b10110, 1'b0, 1'b0,   1'b0};
    /* D23 + */ 6'b000101: deco1_fcn = {5'b10111, 1'b0, !RDreg, (rx_10bdec_int[3:0]==4'b0111)};
    /* D23 - */ 6'b111010: deco1_fcn = {5'b10111, 1'b0, RDreg,  (rx_10bdec_int[3:0]==4'b1000)};
    /* D24 + */ 6'b001100: deco1_fcn = {5'b11000, 1'b0, !RDreg, 1'b0};
    /* D24 - */ 6'b110011: deco1_fcn = {5'b11000, 1'b0, RDreg,  1'b0};
    /* D25 0 */ 6'b100110: deco1_fcn = {5'b11001, 1'b0, 1'b0,   1'b0};
    /* D26 0 */ 6'b010110: deco1_fcn = {5'b11010, 1'b0, 1'b0,   1'b0};
    /* D27 + */ 6'b001001: deco1_fcn = {5'b11011, 1'b0, !RDreg, (rx_10bdec_int[3:0]==4'b0111)};
    /* D27 - */ 6'b110110: deco1_fcn = {5'b11011, 1'b0, RDreg,  (rx_10bdec_int[3:0]==4'b1000)};
    /* D28 0 */ 6'b001110: deco1_fcn = {5'b11100, 1'b0, 1'b0,   1'b0};
    /* D29 + */ 6'b010001: deco1_fcn = {5'b11101, 1'b0, !RDreg, (rx_10bdec_int[3:0]==4'b0111)};
    /* D29 - */ 6'b101110: deco1_fcn = {5'b11101, 1'b0, RDreg,  (rx_10bdec_int[3:0]==4'b1000)};
    /* D30 + */ 6'b100001: deco1_fcn = {5'b11110, 1'b0, !RDreg, (rx_10bdec_int[3:0]==4'b0111)};
    /* D30 - */ 6'b011110: deco1_fcn = {5'b11110, 1'b0, RDreg,  (rx_10bdec_int[3:0]==4'b1000)};
    /* D31 + */ 6'b010100: deco1_fcn = {5'b11111, 1'b0, !RDreg, 1'b0};
    /* D31 - */ 6'b101011: deco1_fcn = {5'b11111, 1'b0, RDreg,  1'b0};
    /* K28 + */ 6'b110000: deco1_fcn = {5'b11100, 1'b0, !RDreg, 1'b1};
    /* K28 - */ 6'b001111: deco1_fcn = {5'b11100, 1'b0, RDreg,  1'b1};
    /* K27.7+*/ 6'b001001: deco1_fcn = {5'b11011, 1'b0, !RDreg, (rx_10bdec_int[3:0]==4'b0111) };
    /* K27.7-*/ 6'b110110: deco1_fcn = {5'b11011, 1'b0, RDreg, (rx_10bdec_int[3:0]==1000) };
    /* K29.7+*/ 6'b010001: deco1_fcn = {5'b11101, 1'b0, !RDreg, (rx_10bdec_int[3:0]==4'b0111) };
    /* K29.7-*/ 6'b101110: deco1_fcn = {5'b11101, 1'b0, !RDreg, (rx_10bdec_int[3:0]==4'b1000) };
    /* K30.7+*/ 6'b100001: deco1_fcn = {5'b11110, 1'b0, !RDreg, (rx_10bdec_int[3:0]==4'b0111) };
    /* K30.7-*/ 6'b011110: deco1_fcn = {5'b11110, 1'b0, !RDreg, (rx_10bdec_int[3:0]==4'b1000) };
                  default: deco1_fcn = {5'b00000, 1'b1, 1'b0,   1'b0}; // dec_err1
  endcase	

// 4b3b decode on least significant bits of rx_10bdata
// deco2_fcn = {decodata[7:5], dec_err2, rderr2, }	

always @ (rx_10bdec_int or newRD or deco1_fcn[0])
  case (rx_10bdec_int[3:0]) //####synopsys parallel_case full_case
    /* Dx.0 + */ 4'b0100: deco2_fcn = {3'b000, 1'b0,          !newRD};
    /* Dx.0 - */ 4'b1011: deco2_fcn = {3'b000, 1'b0,          newRD};
    /* Dx.1 0 */ 4'b1001: deco2_fcn = {3'b001, deco1_fcn[0],  1'b0};
    /* Dx.2 0 */ 4'b0101: deco2_fcn = {3'b010, 1'b0,          1'b0};
    /* Dx.3 + */ 4'b0011: deco2_fcn = {3'b011, deco1_fcn[0],  !newRD};
    /* Dx.3 - */ 4'b1100: deco2_fcn = {3'b011, deco1_fcn[0],  newRD};
    /* Dx.4 + */ 4'b0010: deco2_fcn = {3'b100, deco1_fcn[0],  !newRD};
    /* Dx.4 - */ 4'b1101: deco2_fcn = {3'b100, deco1_fcn[0],  newRD};
    /* Dx.5 0 */ 4'b1010: deco2_fcn = {3'b101, 1'b0,          1'b0};
    /* Dx.6 0 */ 4'b0110: deco2_fcn = {3'b110, deco1_fcn[0],  1'b0};
    /* Dx.7 + */ 4'b0001: deco2_fcn = {3'b111, deco1_fcn[0], !newRD};
    /* Dx.7 - */ 4'b1110: deco2_fcn = {3'b111, deco1_fcn[0], newRD};
    /* Ax.7 + */ 4'b1000: deco2_fcn = {3'b111, (rx_10bdec_int[9:4]==6'b110000), !newRD};
    /* Ax.7 - */ 4'b0111: deco2_fcn = {3'b111, (rx_10bdec_int[9:4]==6'b001111), newRD};
                 default: deco2_fcn = {3'b000, 1'b1,          1'b0}; // dec_err2
  endcase

// decode of special characters


/***
  assign control = ((rx_10bdec_int[9:0] == 10'b0011111010) | 
                    (rx_10bdec_int[9:0] == 10'b1100000101) |
                    (rx_10bdec_int[9:0] == 10'b1101101000) |
                    (rx_10bdec_int[9:0] == 10'b0010010111) |
                    (rx_10bdec_int[9:0] == 10'b1011101000) |
                    (rx_10bdec_int[9:0] == 10'b0100010111) |
                    (rx_10bdec_int[9:0] == 10'b0111101000) |
                    (rx_10bdec_int[9:0] == 10'b1000010111) |
                    (rx_10bdec_int[9:0] == 10'b0011110010) |
                    (rx_10bdec_int[9:0] == 10'b1100001101) |
                    (rx_10bdec_int[9:0] == 10'b0011110011) |
                    (rx_10bdec_int[9:0] == 10'b1100001100)); 
 ***/ 

 //assign special = (rst|control) ? 1'b1:1'b0;


/***
always @(rx_10bdec_int )
  begin
 if ((rx_10bdec_int[9:0] == 10'b0011111010)) { 
      special = 1'b1;
 } else{
      special = 1'b0;
 }
 end

always @(rx_10bdec_int or rst)
begin


 if ( (rst) || (rx_10bdec_int[9:0] == 10'b0011111010) || (rx_10bdec_int[9:0] == 10'b1100000101) || (rx_10bdec_int[9:0] == 10'b1101101000) || (rx_10bdec_int[9:0] == 10'b0010010111) || (rx_10bdec_int[9:0] == 10'b1011101000) || (rx_10bdec_int[9:0] == 10'b0100010111) || (rx_10bdec_int[9:0] == 10'b0111101000) || (rx_10bdec_int[9:0] == 10'b1000010111) || (rx_10bdec_int[9:0] == 10'b0011110010) || (rx_10bdec_int[9:0] == 10'b1100001101) || (rx_10bdec_int[9:0] == 10'b0011110011) || (rx_10bdec_int[9:0] == 10'b1100001100) ) { 

        special = 1'b1; 
} 
  else {
        special = 1'b0; 
}
 end
 **/                
                 

endmodule // 

