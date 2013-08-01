// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs_txio_pcs.v
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
//    Block: IB 8b/10b Encoder
//   Author: Carlos Castil 
//   
//   Module: xpcs_txio_pcs
//     File: xpcs_txio_pcs.v
//
//   Description: This block performs 8b/10b encoding and maintains
//		  a running disparity, as well as special symbol
//		  generation.
//
//   Revision History
//   ------------------------------------------------------------
//      Ver   Date      Comments
//   ------------------------------------------------------------
//      1.0   10/5/99   Originally leveraged from GEM
//      1.1   10/5/99   modified to support IB
//      1.2   10/12/01  modified to support Vega IB
//      1.3   11/14/02  modified to support xpcs ieee 802.3 ae
// ****************************************************************



module xpcs_txio_pcs (
                reset,
		tx_clk,
		
		tx_byte,
		tx_special,
		
		tx_symbol);


input           reset;
input		tx_clk;			// 250 MHz TX clk

input	[7:0] 	tx_byte;		// incoming data byte or code for the special character
input   	tx_special;		// used to select special character generation

output	[9:0] 	tx_symbol;		// outgoing 10 bits encoded

reg     [9:0]	tx_symbol;
reg             RDreg;

wire    [9:0]   tx_symbol_pri;
wire    [9:0]	tx_symbol_sp;

wire            pos_disp_pri;
wire            pos_disp_sp;

// NOTICE: tx_symbol & RDreg need not be reset since they will
// be driven with the special code for NULL at reset!

// Register 10 bit symbol output

 always @ (posedge tx_clk)
   tx_symbol <=  tx_special ? tx_symbol_sp : tx_symbol_pri;

// Register running disparity

  always @ (posedge tx_clk)
    RDreg <= tx_special ? pos_disp_sp : pos_disp_pri;


// Encode data byte

function [10:0] encode_pri;
    input       reset;
    input [7:0] tx_byte;
    input       RDreg;
    reg         pos_disp_pri;
    reg   [9:0] tx_symbol_pri;

    begin
     if (reset)
      begin
       pos_disp_pri  =  1'b0;
       tx_symbol_pri = 10'b0000000000;
      end
     else
      begin
       pos_disp_pri  =  1'b0;
       tx_symbol_pri = 10'b0000000000;

// always @ (tx_byte or RDreg)
        case (tx_byte[7:0])// synopsys parallel_case full_case infer_mux
			   //if RD-, choose 1st, if RD+ choose 2nd
			 
	8'h00: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1001110100 : 10'b0110001011), RDreg};
	8'h01: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111010100 : 10'b1000101011), RDreg};
	8'h02: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011010100 : 10'b0100101011), RDreg};
	8'h03: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1100011011 : 10'b1100010100), !RDreg};

	8'h04: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101010100 : 10'b0010101011), RDreg};
	8'h05: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1010011011 : 10'b1010010100), !RDreg};
	8'h06: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0110011011 : 10'b0110010100), !RDreg};
	8'h07: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110001011 : 10'b0001110100), !RDreg};

	8'h08: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110010100 : 10'b0001101011), RDreg};
	8'h09: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1001011011 : 10'b1001010100), !RDreg};
	8'h0a: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0101011011 : 10'b0101010100), !RDreg};
	8'h0b: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101001011 : 10'b1101000100), !RDreg};

	8'h0c: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0011011011 : 10'b0011010100), !RDreg};
	8'h0d: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011001011 : 10'b1011000100), !RDreg};
	8'h0e: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111001011 : 10'b0111000100), !RDreg};
	8'h0f: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0101110100 : 10'b1010001011), RDreg};

	8'h10: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0110110100 : 10'b1001001011), RDreg};
	8'h11: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1000111011 : 10'b1000110100), !RDreg};
	8'h12: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0100111011 : 10'b0100110100), !RDreg};
	8'h13: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1100101011 : 10'b1100100100), !RDreg};

	8'h14: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0010111011 : 10'b0010110100), !RDreg};
	8'h15: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1010101011 : 10'b1010100100), !RDreg};
	8'h16: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0110101011 : 10'b0110100100), !RDreg};
	8'h17: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110100100 : 10'b0001011011), RDreg};

	8'h18: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1100110100 : 10'b0011001011), RDreg};
	8'h19: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1001101011 : 10'b1001100100), !RDreg};
	8'h1a: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0101101011 : 10'b0101100100), !RDreg};
	8'h1b: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101100100 : 10'b0010011011), RDreg};

	8'h1c: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0011101011 : 10'b0011100100), !RDreg};
	8'h1d: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011100100 : 10'b0100011011), RDreg};
	8'h1e: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111100100 : 10'b1000011011), RDreg};
	8'h1f: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1010110100 : 10'b0101001011), RDreg};

	8'h20: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1001111001 : 10'b0110001001), !RDreg};
	8'h21: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111011001 : 10'b1000101001), !RDreg};
	8'h22: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011011001 : 10'b0100101001), !RDreg};
	8'h23: {tx_symbol_pri, pos_disp_pri} = {(10'b1100011001), RDreg};

	8'h24: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101011001 : 10'b0010101001), !RDreg};
	8'h25: {tx_symbol_pri, pos_disp_pri} = {(10'b1010011001), RDreg};
	8'h26: {tx_symbol_pri, pos_disp_pri} = {(10'b0110011001), RDreg};
	8'h27: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110001001 : 10'b0001111001), RDreg};

	8'h28: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110011001 : 10'b0001101001), !RDreg};
	8'h29: {tx_symbol_pri, pos_disp_pri} = {(10'b1001011001), RDreg};
	8'h2a: {tx_symbol_pri, pos_disp_pri} = {(10'b0101011001), RDreg};
	8'h2b: {tx_symbol_pri, pos_disp_pri} = {(10'b1101001001), RDreg};

	8'h2c: {tx_symbol_pri, pos_disp_pri} = {(10'b0011011001), RDreg};
	8'h2d: {tx_symbol_pri, pos_disp_pri} = {(10'b1011001001), RDreg};
	8'h2e: {tx_symbol_pri, pos_disp_pri} = {(10'b0111001001), RDreg};
	8'h2f: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0101111001 : 10'b1010001001), !RDreg};

	8'h30: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0110111001 : 10'b1001001001), !RDreg};
	8'h31: {tx_symbol_pri, pos_disp_pri} = {(10'b1000111001), RDreg};
	8'h32: {tx_symbol_pri, pos_disp_pri} = {(10'b0100111001), RDreg};
	8'h33: {tx_symbol_pri, pos_disp_pri} = {(10'b1100101001), RDreg};

	8'h34: {tx_symbol_pri, pos_disp_pri} = {(10'b0010111001), RDreg};
	8'h35: {tx_symbol_pri, pos_disp_pri} = {(10'b1010101001), RDreg};
	8'h36: {tx_symbol_pri, pos_disp_pri} = {(10'b0110101001), RDreg};
	8'h37: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110101001 : 10'b0001011001), !RDreg};

	8'h38: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1100111001 : 10'b0011001001), !RDreg};
	8'h39: {tx_symbol_pri, pos_disp_pri} = {(10'b1001101001), RDreg};
	8'h3a: {tx_symbol_pri, pos_disp_pri} = {(10'b0101101001), RDreg};
	8'h3b: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101101001 : 10'b0010011001), !RDreg};

	8'h3c: {tx_symbol_pri, pos_disp_pri} = {(10'b0011101001), RDreg};
	8'h3d: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011101001 : 10'b0100011001), !RDreg};
	8'h3e: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111101001 : 10'b1000011001), !RDreg};
	8'h3f: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1010111001 : 10'b0101001001), !RDreg};

	8'h40: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1001110101 : 10'b0110000101), !RDreg};
	8'h41: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111010101 : 10'b1000100101), !RDreg};
	8'h42: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011010101 : 10'b0100100101), !RDreg};
	8'h43: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1100010101 : 10'b1100010101), RDreg};

	8'h44: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101010101 : 10'b0010100101), !RDreg};
	8'h45: {tx_symbol_pri, pos_disp_pri} = {(10'b1010010101), RDreg};
	8'h46: {tx_symbol_pri, pos_disp_pri} = {(10'b0110010101), RDreg};
	8'h47: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110000101 : 10'b0001110101), RDreg};

	8'h48: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110010101 : 10'b0001100101), !RDreg};
	8'h49: {tx_symbol_pri, pos_disp_pri} = {(10'b1001010101), RDreg};
	8'h4a: {tx_symbol_pri, pos_disp_pri} = {(10'b0101010101), RDreg};
	8'h4b: {tx_symbol_pri, pos_disp_pri} = {(10'b1101000101), RDreg};

	8'h4c: {tx_symbol_pri, pos_disp_pri} = {(10'b0011010101), RDreg};
	8'h4d: {tx_symbol_pri, pos_disp_pri} = {(10'b1011000101), RDreg};
	8'h4e: {tx_symbol_pri, pos_disp_pri} = {(10'b0111000101), RDreg};
	8'h4f: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0101110101 : 10'b1010000101), !RDreg};

	8'h50: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0110110101 : 10'b1001000101), !RDreg};
	8'h51: {tx_symbol_pri, pos_disp_pri} = {(10'b1000110101), RDreg};
	8'h52: {tx_symbol_pri, pos_disp_pri} = {(10'b0100110101), RDreg};
	8'h53: {tx_symbol_pri, pos_disp_pri} = {(10'b1100100101), RDreg};

	8'h54: {tx_symbol_pri, pos_disp_pri} = {(10'b0010110101), RDreg};
	8'h55: {tx_symbol_pri, pos_disp_pri} = {(10'b1010100101), RDreg};
	8'h56: {tx_symbol_pri, pos_disp_pri} = {(10'b0110100101), RDreg};
	8'h57: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110100101 : 10'b0001010101), !RDreg};

	8'h58: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1100110101 : 10'b0011000101), !RDreg};
	8'h59: {tx_symbol_pri, pos_disp_pri} = {(10'b1001100101), RDreg};
	8'h5a: {tx_symbol_pri, pos_disp_pri} = {(10'b0101100101), RDreg};
	8'h5b: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101100101 : 10'b0010010101), !RDreg};

	8'h5c: {tx_symbol_pri, pos_disp_pri} = {(10'b0011100101), RDreg};
	8'h5d: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011100101 : 10'b0100010101), !RDreg};
	8'h5e: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111100101 : 10'b1000010101), !RDreg};
	8'h5f: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1010110101 : 10'b0101000101), !RDreg};

	8'h60: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1001110011 : 10'b0110001100), !RDreg};
	8'h61: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111010011 : 10'b1000101100), !RDreg};
	8'h62: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011010011 : 10'b0100101100), !RDreg};
	8'h63: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1100011100 : 10'b1100010011), RDreg};

	8'h64: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101010011 : 10'b0010101100), !RDreg};
	8'h65: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1010011100 : 10'b1010010011), RDreg};
	8'h66: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0110011100 : 10'b0110010011), RDreg};
	8'h67: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110001100 : 10'b0001110011), RDreg};

	8'h68: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110010011 : 10'b0001101100), !RDreg};
	8'h69: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1001011100 : 10'b1001010011), RDreg};
	8'h6a: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0101011100 : 10'b0101010011), RDreg};
	8'h6b: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101001100 : 10'b1101000011), RDreg};

	8'h6c: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0011011100 : 10'b0011010011), RDreg};
	8'h6d: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011001100 : 10'b1011000011), RDreg};
	8'h6e: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111001100 : 10'b0111000011), RDreg};
	8'h6f: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0101110011 : 10'b1010001100), !RDreg};

	8'h70: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0110110011 : 10'b1001001100), !RDreg};
	8'h71: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1000111100 : 10'b1000110011), RDreg};
	8'h72: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0100111100 : 10'b0100110011), RDreg};
	8'h73: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1100101100 : 10'b1100100011), RDreg};

	8'h74: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0010111100 : 10'b0010110011), RDreg};
	8'h75: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1010101100 : 10'b1010100011), RDreg};
	8'h76: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0110101100 : 10'b0110100011), RDreg};
	8'h77: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110100011 : 10'b0001011100), !RDreg};

	8'h78: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1100110011 : 10'b0011001100), !RDreg};
	8'h79: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1001101100 : 10'b1001100011), RDreg};
	8'h7a: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0101101100 : 10'b0101100011), RDreg};
	8'h7b: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101100011 : 10'b0010011100), !RDreg};

	8'h7c: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0011101100 : 10'b0011100011), RDreg};
	8'h7d: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011100011 : 10'b0100011100), !RDreg};
	8'h7e: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111100011 : 10'b1000011100), !RDreg};
	8'h7f: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1010110011 : 10'b0101001100), !RDreg};

	8'h80: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1001110010 : 10'b0110001101), RDreg};
	8'h81: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111010010 : 10'b1000101101), RDreg};
	8'h82: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011010010 : 10'b0100101101), RDreg};
	8'h83: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1100011101 : 10'b1100010010), !RDreg};

	8'h84: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101010010 : 10'b0010101101), RDreg};
	8'h85: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1010011101 : 10'b1010010010), !RDreg};
	8'h86: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0110011101 : 10'b0110010010), !RDreg};
	8'h87: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110001101 : 10'b0001110010), !RDreg};

	8'h88: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110010010 : 10'b0001101101), RDreg};
	8'h89: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1001011101 : 10'b1001010010), !RDreg};
	8'h8a: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0101011101 : 10'b0101010010), !RDreg};
	8'h8b: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101001101 : 10'b1101000010), !RDreg};

	8'h8c: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0011011101 : 10'b0011010010), !RDreg};
	8'h8d: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011001101 : 10'b1011000010), !RDreg};
	8'h8e: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111001101 : 10'b0111000010), !RDreg};
	8'h8f: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0101110010 : 10'b1010001101), RDreg};

	8'h90: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0110110010 : 10'b1001001101), RDreg};
	8'h91: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1000111101 : 10'b1000110010), !RDreg};
	8'h92: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0100111101 : 10'b0100110010), !RDreg};
	8'h93: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1100101101 : 10'b1100100010), !RDreg};

	8'h94: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0010111101 : 10'b0010110010), !RDreg};
	8'h95: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1010101101 : 10'b1010100010), !RDreg};
	8'h96: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0110101101 : 10'b0110100010), !RDreg};
	8'h97: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110100010 : 10'b0001011101), RDreg};
	
	8'h98: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1100110010 : 10'b0011001101), RDreg};
	8'h99: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1001101101 : 10'b1001100010), !RDreg};
	8'h9a: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0101101101 : 10'b0101100010), !RDreg};
	8'h9b: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101100010 : 10'b0010011101), RDreg};

	8'h9c: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0011101101 : 10'b0011100010), !RDreg};
	8'h9d: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011100010 : 10'b0100011101), RDreg};
	8'h9e: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111100010 : 10'b1000011101), RDreg};
	8'h9f: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1010110010 : 10'b0101001101), RDreg};

	8'ha0: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1001111010 : 10'b0110001010), !RDreg};
	8'ha1: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111011010 : 10'b1000101010), !RDreg};
	8'ha2: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011011010 : 10'b0100101010), !RDreg};
	8'ha3: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1100011010 : 10'b1100011010), RDreg};

	8'ha4: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101011010 : 10'b0010101010), !RDreg};
	8'ha5: {tx_symbol_pri, pos_disp_pri} = {(10'b1010011010), RDreg};
	8'ha6: {tx_symbol_pri, pos_disp_pri} = {(10'b0110011010), RDreg};
 	8'ha7: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110001010 : 10'b0001111010), RDreg};

	8'ha8: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110011010 : 10'b0001101010), !RDreg};
	8'ha9: {tx_symbol_pri, pos_disp_pri} = {(10'b1001011010), RDreg};
	8'haa: {tx_symbol_pri, pos_disp_pri} = {(10'b0101011010), RDreg};
	8'hab: {tx_symbol_pri, pos_disp_pri} = {(10'b1101001010), RDreg};

	8'hac: {tx_symbol_pri, pos_disp_pri} = {(10'b0011011010), RDreg};
	8'had: {tx_symbol_pri, pos_disp_pri} = {(10'b1011001010), RDreg};
	8'hae: {tx_symbol_pri, pos_disp_pri} = {(10'b0111001010), RDreg};
	8'haf: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0101111010 : 10'b1010001010), !RDreg};

	8'hb0: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0110111010 : 10'b1001001010), !RDreg};
	8'hb1: {tx_symbol_pri, pos_disp_pri} = {(10'b1000111010), RDreg};
	8'hb2: {tx_symbol_pri, pos_disp_pri} = {(10'b0100111010), RDreg};
	8'hb3: {tx_symbol_pri, pos_disp_pri} = {(10'b1100101010), RDreg};

	8'hb4: {tx_symbol_pri, pos_disp_pri} = {(10'b0010111010), RDreg};
	8'hb5: {tx_symbol_pri, pos_disp_pri} = {(10'b1010101010), RDreg};
	8'hb6: {tx_symbol_pri, pos_disp_pri} = {(10'b0110101010), RDreg};
	8'hb7: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110101010 : 10'b0001011010), !RDreg};
	
	8'hb8: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1100111010 : 10'b0011001010), !RDreg};
	8'hb9: {tx_symbol_pri, pos_disp_pri} = {(10'b1001101010), RDreg};
	8'hba: {tx_symbol_pri, pos_disp_pri} = {(10'b0101101010), RDreg};
	8'hbb: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101101010 : 10'b0010011010), !RDreg};

	8'hbc: {tx_symbol_pri, pos_disp_pri} = {(10'b0011101010), RDreg};
	8'hbd: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011101010 : 10'b0100011010), !RDreg};
	8'hbe: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111101010 : 10'b1000011010), !RDreg};
	8'hbf: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1010111010 : 10'b0101001010), !RDreg};

	8'hc0: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1001110110 : 10'b0110000110), !RDreg};
	8'hc1: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111010110 : 10'b1000100110), !RDreg};
	8'hc2: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011010110 : 10'b0100100110), !RDreg};
	8'hc3: {tx_symbol_pri, pos_disp_pri} = {(10'b1100010110), RDreg};

	8'hc4: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101010110 : 10'b0010100110), !RDreg};
	8'hc5: {tx_symbol_pri, pos_disp_pri} = {(10'b1010010110), RDreg};
	8'hc6: {tx_symbol_pri, pos_disp_pri} = {(10'b0110010110), RDreg};
	8'hc7: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110000110 : 10'b0001110110), RDreg};

	8'hc8: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110010110 : 10'b0001100110), !RDreg};
	8'hc9: {tx_symbol_pri, pos_disp_pri} = {(10'b1001010110), RDreg};
	8'hca: {tx_symbol_pri, pos_disp_pri} = {(10'b0101010110), RDreg};
	8'hcb: {tx_symbol_pri, pos_disp_pri} = {(10'b1101000110), RDreg};

	8'hcc: {tx_symbol_pri, pos_disp_pri} = {(10'b0011010110), RDreg};
	8'hcd: {tx_symbol_pri, pos_disp_pri} = {(10'b1011000110), RDreg};
	8'hce: {tx_symbol_pri, pos_disp_pri} = {(10'b0111000110), RDreg};
	8'hcf: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0101110110 : 10'b1010000110), !RDreg};

	8'hd0: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0110110110 : 10'b1001000110), !RDreg};
	8'hd1: {tx_symbol_pri, pos_disp_pri} = {(10'b1000110110), RDreg};
	8'hd2: {tx_symbol_pri, pos_disp_pri} = {(10'b0100110110), RDreg};
	8'hd3: {tx_symbol_pri, pos_disp_pri} = {(10'b1100100110), RDreg};
	
	8'hd4: {tx_symbol_pri, pos_disp_pri} = {(10'b0010110110), RDreg};
	8'hd5: {tx_symbol_pri, pos_disp_pri} = {(10'b1010100110), RDreg};
	8'hd6: {tx_symbol_pri, pos_disp_pri} = {(10'b0110100110), RDreg};
	8'hd7: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110100110 : 10'b0001010110), !RDreg};

	8'hd8: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1100110110 : 10'b0011000110), !RDreg};
	8'hd9: {tx_symbol_pri, pos_disp_pri} = {(10'b1001100110), RDreg};
	8'hda: {tx_symbol_pri, pos_disp_pri} = {(10'b0101100110), RDreg};
	8'hdb: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101100110 : 10'b0010010110), !RDreg};

	8'hdc: {tx_symbol_pri, pos_disp_pri} = {(10'b0011100110), RDreg};
	8'hdd: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011100110 : 10'b0100010110), !RDreg};
	8'hde: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111100110 : 10'b1000010110), !RDreg};
	8'hdf: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1010110110 : 10'b0101000110), !RDreg};

	8'he0: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1001110001 : 10'b0110001110), RDreg};
	8'he1: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111010001 : 10'b1000101110), RDreg};
	8'he2: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011010001 : 10'b0100101110), RDreg};
	8'he3: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1100011110 : 10'b1100010001), !RDreg};

	8'he4: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101010001 : 10'b0010101110), RDreg};
	8'he5: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1010011110 : 10'b1010010001), !RDreg};
	8'he6: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0110011110 : 10'b0110010001), !RDreg};
	8'he7: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110001110 : 10'b0001110001), !RDreg};

	8'he8: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110010001 : 10'b0001101110), RDreg};
	8'he9: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1001011110 : 10'b1001010001), !RDreg};
	8'hea: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0101011110 : 10'b0101010001), !RDreg};
	8'heb: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101001110 : 10'b1101001000), !RDreg};

	8'hec: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0011011110 : 10'b0011010001), !RDreg};
	8'hed: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011001110 : 10'b1011001000), !RDreg};
	8'hee: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111001110 : 10'b0111001000), !RDreg};
	8'hef: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0101110001 : 10'b1010001110), RDreg};

	8'hf0: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0110110001 : 10'b1001001110), RDreg};
	8'hf1: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1000110111 : 10'b1000110001), !RDreg};
	8'hf2: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0100110111 : 10'b0100110001), !RDreg};
	8'hf3: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1100101110 : 10'b1100100001), !RDreg};
	
	8'hf4: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0010110111 : 10'b0010110001), !RDreg};
	8'hf5: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1010101110 : 10'b1010100001), !RDreg};
	8'hf6: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0110101110 : 10'b0110100001), !RDreg};
	8'hf7: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1110100001 : 10'b0001011110), RDreg};
	
	8'hf8: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1100110001 : 10'b0011001110), RDreg};
	8'hf9: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1001101110 : 10'b1001100001), !RDreg};
	8'hfa: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0101101110 : 10'b0101100001), !RDreg};
	8'hfb: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1101100001 : 10'b0010011110), RDreg};

	8'hfc: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0011101110 : 10'b0011100001), !RDreg};
	8'hfd: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1011100001 : 10'b0100011110), RDreg};
	8'hfe: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b0111100001 : 10'b1000011110), RDreg};
	8'hff: {tx_symbol_pri, pos_disp_pri} = {(!RDreg ? 10'b1010110001 : 10'b0101001110), RDreg};
//  endcase	

        default      :          // Drive NULL
                {tx_symbol_pri, pos_disp_pri} = {(10'b0000000000), 1'b0};

  endcase

  end  // else

 encode_pri = {tx_symbol_pri, pos_disp_pri};

 end  // function

 endfunction


assign {tx_symbol_pri, pos_disp_pri} = encode_pri(reset, tx_byte, RDreg);


// Encode Control Symbols

function [10:0] encode_sp;
    input       reset;
    input [7:0] tx_byte;
    input       RDreg;
    reg         pos_disp_sp;
    reg   [9:0] tx_symbol_sp;

    begin
     if (reset)
      begin
       pos_disp_sp  =  1'b0;
       tx_symbol_sp = 10'b0000000000;
      end
     else
      begin
       pos_disp_sp  =  1'b0;
       tx_symbol_sp = 10'b0000000000;


// always @ (tx_byte or RDreg)
   case (tx_byte[7:0]) //synopsys full_case parallel_case infer_mux
			   //if RD-, choose 1st, if RD+ choose 2nd

// IB Required Symbols

	`XPCS_ENC_COM :		// K28.5 - COM (Comma, character boundary alignment symbol)
		{tx_symbol_sp, pos_disp_sp} = {(!RDreg ? 10'b0011111010 : 10'b1100000101), !RDreg};	
	`XPCS_ENC_SDP :		// K27.7 - SDP (Start of data packet delimiter)
		{tx_symbol_sp, pos_disp_sp} = {(!RDreg ? 10'b1101101000 : 10'b0010010111), RDreg};
	`XPCS_ENC_SLP :		// K28.2 - SLP (Start of link packet delimiter)
		{tx_symbol_sp, pos_disp_sp} = {(!RDreg ? 10'b0011110101 : 10'b1100001010), !RDreg};
	`XPCS_ENC_EGP :		// K29.7 - EGP (End of good packet delimiter)
		{tx_symbol_sp, pos_disp_sp} = {(!RDreg ? 10'b1011101000 : 10'b0100010111), RDreg};	
	`XPCS_ENC_EBP : 	// K30.7 - EBP (End of bad packet delimiter)
		{tx_symbol_sp, pos_disp_sp} = {(!RDreg ? 10'b0111101000 : 10'b1000010111), RDreg};
	`XPCS_ENC_PAD :		// K23.7 - PAD (Packet padding symbol)
		{tx_symbol_sp, pos_disp_sp} = {(!RDreg ? 10'b1110101000 : 10'b0001010111), RDreg};
	`XPCS_ENC_SKP :		// K28.0 - SKP (Skip symbol)
		{tx_symbol_sp, pos_disp_sp} = {(!RDreg ? 10'b0011110100 : 10'b1100001011), RDreg};
        `XPCS_ENC_ALG :         // K28.3 - ALG (Alignment symbol)
                {tx_symbol_sp, pos_disp_sp} = {(!RDreg ? 10'b0011110011 : 10'b1100001100), !RDreg};
        `XPCS_ENC_SEQ :         // K28.4 - SEQ (Sequence symbol)
                {tx_symbol_sp, pos_disp_sp} = {(!RDreg ? 10'b0011110010 : 10'b1100001101), RDreg};


// Reserved Symbols - Not Needed

/*		
	`XPCS_ENC_RS1 :		// K28.1 - Reserved Symbol #1
		{tx_symbol_sp, pos_disp_sp} = {(!RDreg ? 10'b0011111001 : 10'b1100000110), !RDreg};
	`XPCS_ENC_RS4 :		// K28.6 - Reserved Symbol #4
		{tx_symbol_sp, pos_disp_sp} = {(!RDreg ? 10'b0011110110 : 10'b1100001001), !RDreg};
	`XPCS_ENC_RS5 :		// K28.7 - Reserved Symbol #5
		{tx_symbol_sp, pos_disp_sp} = {(!RDreg ? 10'b0011111000 : 10'b1100000111), RDreg};
*/

// Default Case

	default      :		// Drive NULL
		{tx_symbol_sp, pos_disp_sp} = {(10'b0000000000), 1'b0};
	
  endcase

  end  // else

 encode_sp = {tx_symbol_sp, pos_disp_sp};

 end  // function

 endfunction


assign {tx_symbol_sp , pos_disp_sp } = encode_sp(reset, tx_byte, RDreg);


endmodule	
