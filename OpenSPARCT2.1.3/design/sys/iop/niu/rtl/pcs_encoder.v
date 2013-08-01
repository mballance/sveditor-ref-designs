// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcs_encoder.v
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
// @(#)pcs_encoder.v	1.1G
/**********************************************************************/
/* Project Name  :  CASSINI                                           */
/* Module Name   :  PCS Encoder Block				      */
/* Description   :  The encoder block does the 8b10b encoding of data */
/*		    and control characters.  The encoder_sel signal   */
/*		    specifies the special characters to be outputted  */
/*		    for the transmit stream.  			      */
/*    								      */
/* Assumptions   : none.					      */
/*    								      */
/* Parent module : pcs_tx_dpath.v                                     */
/* Child modules : none.					      */
/* Author Name   : Linda Chen                                         */
/* Date Created  : 10/24/96                                           */
/*                                                                    */
/*              Copyright (c) 1994, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */ 
/* Modifications : none yet                                           */
/* Synthesis Notes : none yet                                         */
/**********************************************************************/

`include  "pcs_define.h"

module pcs_encoder (tx_8b_enc_in,		// inputs
		encoder_sel,special_enc_in,pos_disp,		
	
		tx_10b_enc_out);			// outputs

input	[7:0] 	tx_8b_enc_in;		// incoming byte
input   [3:0]	encoder_sel;		// used for special characters
input		special_enc_in;		// marks special characters
input		pos_disp;		// running disparity of last data

output	[9:0] 	tx_10b_enc_out;		// outgoing 10 bits encoded

/*
** Call of function for encoder
*/
assign 	tx_10b_enc_out = encoder_fn(special_enc_in,
		encoder_sel,tx_8b_enc_in, pos_disp);

/*
** Function to encode 8b to 10b data
*/
function [9:0] encoder_fn;
	input		special_char;		
	input [3:0]  	encoder_sel;
	input [7:0] 	tx_8b_enc_in;
	input		RDreg;

  if (~special_char)	
   	case (tx_8b_enc_in[7:0]) //synopsys parallel_case full_case infer_mux
				//if RD-, choose 1st, if RD+ choose 2nd
	8'h00: encoder_fn = !RDreg ? 10'b1001110100 : 10'b0110001011;
	8'h01: encoder_fn = !RDreg ? 10'b0111010100 : 10'b1000101011;
	8'h02: encoder_fn = !RDreg ? 10'b1011010100 : 10'b0100101011;
	8'h03: encoder_fn = !RDreg ? 10'b1100011011 : 10'b1100010100;

	8'h04: encoder_fn = !RDreg ? 10'b1101010100 : 10'b0010101011;
	8'h05: encoder_fn = !RDreg ? 10'b1010011011 : 10'b1010010100;
	8'h06: encoder_fn = !RDreg ? 10'b0110011011 : 10'b0110010100;
	8'h07: encoder_fn = !RDreg ? 10'b1110001011 : 10'b0001110100;

	8'h08: encoder_fn = !RDreg ? 10'b1110010100 : 10'b0001101011;
	8'h09: encoder_fn = !RDreg ? 10'b1001011011 : 10'b1001010100;
	8'h0a: encoder_fn = !RDreg ? 10'b0101011011 : 10'b0101010100;
	8'h0b: encoder_fn = !RDreg ? 10'b1101001011 : 10'b1101000100;

	8'h0c: encoder_fn = !RDreg ? 10'b0011011011 : 10'b0011010100;
	8'h0d: encoder_fn = !RDreg ? 10'b1011001011 : 10'b1011000100;
	8'h0e: encoder_fn = !RDreg ? 10'b0111001011 : 10'b0111000100;
	8'h0f: encoder_fn = !RDreg ? 10'b0101110100 : 10'b1010001011;

	8'h10: encoder_fn = !RDreg ? 10'b0110110100 : 10'b1001001011;
	8'h11: encoder_fn = !RDreg ? 10'b1000111011 : 10'b1000110100;
	8'h12: encoder_fn = !RDreg ? 10'b0100111011 : 10'b0100110100;
	8'h13: encoder_fn = !RDreg ? 10'b1100101011 : 10'b1100100100;

	8'h14: encoder_fn = !RDreg ? 10'b0010111011 : 10'b0010110100;
	8'h15: encoder_fn = !RDreg ? 10'b1010101011 : 10'b1010100100;
	8'h16: encoder_fn = !RDreg ? 10'b0110101011 : 10'b0110100100;
	8'h17: encoder_fn = !RDreg ? 10'b1110100100 : 10'b0001011011;

	8'h18: encoder_fn = !RDreg ? 10'b1100110100 : 10'b0011001011;
	8'h19: encoder_fn = !RDreg ? 10'b1001101011 : 10'b1001100100;
	8'h1a: encoder_fn = !RDreg ? 10'b0101101011 : 10'b0101100100;
	8'h1b: encoder_fn = !RDreg ? 10'b1101100100 : 10'b0010011011;

	8'h1c: encoder_fn = !RDreg ? 10'b0011101011 : 10'b0011100100;
	8'h1d: encoder_fn = !RDreg ? 10'b1011100100 : 10'b0100011011;
	8'h1e: encoder_fn = !RDreg ? 10'b0111100100 : 10'b1000011011;
	8'h1f: encoder_fn = !RDreg ? 10'b1010110100 : 10'b0101001011;

	8'h20: encoder_fn = !RDreg ? 10'b1001111001 : 10'b0110001001;
	8'h21: encoder_fn = !RDreg ? 10'b0111011001 : 10'b1000101001;
	8'h22: encoder_fn = !RDreg ? 10'b1011011001 : 10'b0100101001;
	8'h23: encoder_fn = 10'b1100011001;

	8'h24: encoder_fn = !RDreg ? 10'b1101011001 : 10'b0010101001;
	8'h25: encoder_fn = 10'b1010011001;
	8'h26: encoder_fn = 10'b0110011001;
	8'h27: encoder_fn = !RDreg ? 10'b1110001001 : 10'b0001111001;

	8'h28: encoder_fn = !RDreg ? 10'b1110011001 : 10'b0001101001;
	8'h29: encoder_fn = 10'b1001011001;
	8'h2a: encoder_fn = 10'b0101011001;
	8'h2b: encoder_fn = 10'b1101001001;

	8'h2c: encoder_fn = 10'b0011011001;
	8'h2d: encoder_fn = 10'b1011001001;
	8'h2e: encoder_fn = 10'b0111001001;
	8'h2f: encoder_fn = !RDreg ? 10'b0101111001 : 10'b1010001001;

	8'h30: encoder_fn = !RDreg ? 10'b0110111001 : 10'b1001001001;
	8'h31: encoder_fn = 10'b1000111001;
	8'h32: encoder_fn = 10'b0100111001;
	8'h33: encoder_fn = 10'b1100101001;

	8'h34: encoder_fn = 10'b0010111001;
	8'h35: encoder_fn = 10'b1010101001;
	8'h36: encoder_fn = 10'b0110101001;
	8'h37: encoder_fn = !RDreg ? 10'b1110101001 : 10'b0001011001;

	8'h38: encoder_fn = !RDreg ? 10'b1100111001 : 10'b0011001001;
	8'h39: encoder_fn = 10'b1001101001;
	8'h3a: encoder_fn = 10'b0101101001;
	8'h3b: encoder_fn = !RDreg ? 10'b1101101001 : 10'b0010011001;

	8'h3c: encoder_fn = 10'b0011101001;
	8'h3d: encoder_fn = !RDreg ? 10'b1011101001 : 10'b0100011001;
	8'h3e: encoder_fn = !RDreg ? 10'b0111101001 : 10'b1000011001;
	8'h3f: encoder_fn = !RDreg ? 10'b1010111001 : 10'b0101001001;

	8'h40: encoder_fn = !RDreg ? 10'b1001110101 : 10'b0110000101;
	8'h41: encoder_fn = !RDreg ? 10'b0111010101 : 10'b1000100101;
	8'h42: encoder_fn = !RDreg ? 10'b1011010101 : 10'b0100100101;
	8'h43: encoder_fn = !RDreg ? 10'b1100010101 : 10'b1100010101;

	8'h44: encoder_fn = !RDreg ? 10'b1101010101 : 10'b0010100101;
	8'h45: encoder_fn = 10'b1010010101;
	8'h46: encoder_fn = 10'b0110010101;
	8'h47: encoder_fn = !RDreg ? 10'b1110000101 : 10'b0001110101;

	8'h48: encoder_fn = !RDreg ? 10'b1110010101 : 10'b0001100101;
	8'h49: encoder_fn = 10'b1001010101;
	8'h4a: encoder_fn = 10'b0101010101;
	8'h4b: encoder_fn = 10'b1101000101;

	8'h4c: encoder_fn = 10'b0011010101;
	8'h4d: encoder_fn = 10'b1011000101;
	8'h4e: encoder_fn = 10'b0111000101;
	8'h4f: encoder_fn = !RDreg ? 10'b0101110101 : 10'b1010000101;

	8'h50: encoder_fn = !RDreg ? 10'b0110110101 : 10'b1001000101;
	8'h51: encoder_fn = 10'b1000110101;
	8'h52: encoder_fn = 10'b0100110101;
	8'h53: encoder_fn = 10'b1100100101;

	8'h54: encoder_fn = 10'b0010110101;
	8'h55: encoder_fn = 10'b1010100101;
	8'h56: encoder_fn = 10'b0110100101;
	8'h57: encoder_fn = !RDreg ? 10'b1110100101 : 10'b0001010101;

	8'h58: encoder_fn = !RDreg ? 10'b1100110101 : 10'b0011000101;
	8'h59: encoder_fn = 10'b1001100101;
	8'h5a: encoder_fn = 10'b0101100101;
	8'h5b: encoder_fn = !RDreg ? 10'b1101100101 : 10'b0010010101;

	8'h5c: encoder_fn = 10'b0011100101;
	8'h5d: encoder_fn = !RDreg ? 10'b1011100101 : 10'b0100010101;
	8'h5e: encoder_fn = !RDreg ? 10'b0111100101 : 10'b1000010101;
	8'h5f: encoder_fn = !RDreg ? 10'b1010110101 : 10'b0101000101;

	8'h60: encoder_fn = !RDreg ? 10'b1001110011 : 10'b0110001100;
	8'h61: encoder_fn = !RDreg ? 10'b0111010011 : 10'b1000101100;
	8'h62: encoder_fn = !RDreg ? 10'b1011010011 : 10'b0100101100;
	8'h63: encoder_fn = !RDreg ? 10'b1100011100 : 10'b1100010011;

	8'h64: encoder_fn = !RDreg ? 10'b1101010011 : 10'b0010101100;
	8'h65: encoder_fn = !RDreg ? 10'b1010011100 : 10'b1010010011;
	8'h66: encoder_fn = !RDreg ? 10'b0110011100 : 10'b0110010011;
	8'h67: encoder_fn = !RDreg ? 10'b1110001100 : 10'b0001110011;

	8'h68: encoder_fn = !RDreg ? 10'b1110010011 : 10'b0001101100;
	8'h69: encoder_fn = !RDreg ? 10'b1001011100 : 10'b1001010011;
	8'h6a: encoder_fn = !RDreg ? 10'b0101011100 : 10'b0101010011;
	8'h6b: encoder_fn = !RDreg ? 10'b1101001100 : 10'b1101000011;

	8'h6c: encoder_fn = !RDreg ? 10'b0011011100 : 10'b0011010011;
	8'h6d: encoder_fn = !RDreg ? 10'b1011001100 : 10'b1011000011;
	8'h6e: encoder_fn = !RDreg ? 10'b0111001100 : 10'b0111000011;
	8'h6f: encoder_fn = !RDreg ? 10'b0101110011 : 10'b1010001100;

	8'h70: encoder_fn = !RDreg ? 10'b0110110011 : 10'b1001001100;
	8'h71: encoder_fn = !RDreg ? 10'b1000111100 : 10'b1000110011;
	8'h72: encoder_fn = !RDreg ? 10'b0100111100 : 10'b0100110011;
	8'h73: encoder_fn = !RDreg ? 10'b1100101100 : 10'b1100100011;

	8'h74: encoder_fn = !RDreg ? 10'b0010111100 : 10'b0010110011;
	8'h75: encoder_fn = !RDreg ? 10'b1010101100 : 10'b1010100011;
	8'h76: encoder_fn = !RDreg ? 10'b0110101100 : 10'b0110100011;
	8'h77: encoder_fn = !RDreg ? 10'b1110100011 : 10'b0001011100;

	8'h78: encoder_fn = !RDreg ? 10'b1100110011 : 10'b0011001100;
	8'h79: encoder_fn = !RDreg ? 10'b1001101100 : 10'b1001100011;
	8'h7a: encoder_fn = !RDreg ? 10'b0101101100 : 10'b0101100011;
	8'h7b: encoder_fn = !RDreg ? 10'b1101100011 : 10'b0010011100;

	8'h7c: encoder_fn = !RDreg ? 10'b0011101100 : 10'b0011100011;
	8'h7d: encoder_fn = !RDreg ? 10'b1011100011 : 10'b0100011100;
	8'h7e: encoder_fn = !RDreg ? 10'b0111100011 : 10'b1000011100;
	8'h7f: encoder_fn = !RDreg ? 10'b1010110011 : 10'b0101001100;

	8'h80: encoder_fn = !RDreg ? 10'b1001110010 : 10'b0110001101;
	8'h81: encoder_fn = !RDreg ? 10'b0111010010 : 10'b1000101101;
	8'h82: encoder_fn = !RDreg ? 10'b1011010010 : 10'b0100101101;
	8'h83: encoder_fn = !RDreg ? 10'b1100011101 : 10'b1100010010;

	8'h84: encoder_fn = !RDreg ? 10'b1101010010 : 10'b0010101101;
	8'h85: encoder_fn = !RDreg ? 10'b1010011101 : 10'b1010010010;
	8'h86: encoder_fn = !RDreg ? 10'b0110011101 : 10'b0110010010;
	8'h87: encoder_fn = !RDreg ? 10'b1110001101 : 10'b0001110010;

	8'h88: encoder_fn = !RDreg ? 10'b1110010010 : 10'b0001101101;
	8'h89: encoder_fn = !RDreg ? 10'b1001011101 : 10'b1001010010;
	8'h8a: encoder_fn = !RDreg ? 10'b0101011101 : 10'b0101010010;
	8'h8b: encoder_fn = !RDreg ? 10'b1101001101 : 10'b1101000010;

	8'h8c: encoder_fn = !RDreg ? 10'b0011011101 : 10'b0011010010;
	8'h8d: encoder_fn = !RDreg ? 10'b1011001101 : 10'b1011000010;
	8'h8e: encoder_fn = !RDreg ? 10'b0111001101 : 10'b0111000010;
	8'h8f: encoder_fn = !RDreg ? 10'b0101110010 : 10'b1010001101;

	8'h90: encoder_fn = !RDreg ? 10'b0110110010 : 10'b1001001101;
	8'h91: encoder_fn = !RDreg ? 10'b1000111101 : 10'b1000110010;
	8'h92: encoder_fn = !RDreg ? 10'b0100111101 : 10'b0100110010;
	8'h93: encoder_fn = !RDreg ? 10'b1100101101 : 10'b1100100010;

	8'h94: encoder_fn = !RDreg ? 10'b0010111101 : 10'b0010110010;
	8'h95: encoder_fn = !RDreg ? 10'b1010101101 : 10'b1010100010;
	8'h96: encoder_fn = !RDreg ? 10'b0110101101 : 10'b0110100010;
	8'h97: encoder_fn = !RDreg ? 10'b1110100010 : 10'b0001011101;
	
	8'h98: encoder_fn = !RDreg ? 10'b1100110010 : 10'b0011001101;
	8'h99: encoder_fn = !RDreg ? 10'b1001101101 : 10'b1001100010;
	8'h9a: encoder_fn = !RDreg ? 10'b0101101101 : 10'b0101100010;
	8'h9b: encoder_fn = !RDreg ? 10'b1101100010 : 10'b0010011101;

	8'h9c: encoder_fn = !RDreg ? 10'b0011101101 : 10'b0011100010;
	8'h9d: encoder_fn = !RDreg ? 10'b1011100010 : 10'b0100011101;
	8'h9e: encoder_fn = !RDreg ? 10'b0111100010 : 10'b1000011101;
	8'h9f: encoder_fn = !RDreg ? 10'b1010110010 : 10'b0101001101;

	8'ha0: encoder_fn = !RDreg ? 10'b1001111010 : 10'b0110001010;
	8'ha1: encoder_fn = !RDreg ? 10'b0111011010 : 10'b1000101010;
	8'ha2: encoder_fn = !RDreg ? 10'b1011011010 : 10'b0100101010;
	8'ha3: encoder_fn = !RDreg ? 10'b1100011010 : 10'b1100011010;

	8'ha4: encoder_fn = !RDreg ? 10'b1101011010 : 10'b0010101010;
	8'ha5: encoder_fn = 10'b1010011010;
	8'ha6: encoder_fn = 10'b0110011010;
 	8'ha7: encoder_fn = !RDreg ? 10'b1110001010 : 10'b0001111010;

	8'ha8: encoder_fn = !RDreg ? 10'b1110011010 : 10'b0001101010;
	8'ha9: encoder_fn = 10'b1001011010;
	8'haa: encoder_fn = 10'b0101011010;
	8'hab: encoder_fn = 10'b1101001010;

	8'hac: encoder_fn = 10'b0011011010;
	8'had: encoder_fn = 10'b1011001010;
	8'hae: encoder_fn = 10'b0111001010;
	8'haf: encoder_fn = !RDreg ? 10'b0101111010 : 10'b1010001010;

	8'hb0: encoder_fn = !RDreg ? 10'b0110111010 : 10'b1001001010;
	8'hb1: encoder_fn = 10'b1000111010;
	8'hb2: encoder_fn = 10'b0100111010;
	8'hb3: encoder_fn = 10'b1100101010;

	8'hb4: encoder_fn = 10'b0010111010;
	8'hb5: encoder_fn = 10'b1010101010;
	8'hb6: encoder_fn = 10'b0110101010;
	8'hb7: encoder_fn = !RDreg ? 10'b1110101010 : 10'b0001011010;
	
	8'hb8: encoder_fn = !RDreg ? 10'b1100111010 : 10'b0011001010;
	8'hb9: encoder_fn = 10'b1001101010;
	8'hba: encoder_fn = 10'b0101101010;
	8'hbb: encoder_fn = !RDreg ? 10'b1101101010 : 10'b0010011010;

	8'hbc: encoder_fn = 10'b0011101010;
	8'hbd: encoder_fn = !RDreg ? 10'b1011101010 : 10'b0100011010;
	8'hbe: encoder_fn = !RDreg ? 10'b0111101010 : 10'b1000011010;
	8'hbf: encoder_fn = !RDreg ? 10'b1010111010 : 10'b0101001010;

	8'hc0: encoder_fn = !RDreg ? 10'b1001110110 : 10'b0110000110;
	8'hc1: encoder_fn = !RDreg ? 10'b0111010110 : 10'b1000100110;
	8'hc2: encoder_fn = !RDreg ? 10'b1011010110 : 10'b0100100110;
	8'hc3: encoder_fn = 10'b1100010110;

	8'hc4: encoder_fn = !RDreg ? 10'b1101010110 : 10'b0010100110;
	8'hc5: encoder_fn = 10'b1010010110;
	8'hc6: encoder_fn = 10'b0110010110;
	8'hc7: encoder_fn = !RDreg ? 10'b1110000110 : 10'b0001110110;

	8'hc8: encoder_fn = !RDreg ? 10'b1110010110 : 10'b0001100110;
	8'hc9: encoder_fn = 10'b1001010110;
	8'hca: encoder_fn = 10'b0101010110;
	8'hcb: encoder_fn = 10'b1101000110;

	8'hcc: encoder_fn = 10'b0011010110;
	8'hcd: encoder_fn = 10'b1011000110;
	8'hce: encoder_fn = 10'b0111000110;
	8'hcf: encoder_fn = !RDreg ? 10'b0101110110 : 10'b1010000110;

	8'hd0: encoder_fn = !RDreg ? 10'b0110110110 : 10'b1001000110;
	8'hd1: encoder_fn = 10'b1000110110;
	8'hd2: encoder_fn = 10'b0100110110;
	8'hd3: encoder_fn = 10'b1100100110;
	
	8'hd4: encoder_fn = 10'b0010110110;
	8'hd5: encoder_fn = 10'b1010100110;
	8'hd6: encoder_fn = 10'b0110100110;
	8'hd7: encoder_fn = !RDreg ? 10'b1110100110 : 10'b0001010110;

	8'hd8: encoder_fn = !RDreg ? 10'b1100110110 : 10'b0011000110;
	8'hd9: encoder_fn = 10'b1001100110;
	8'hda: encoder_fn = 10'b0101100110;
	8'hdb: encoder_fn = !RDreg ? 10'b1101100110 : 10'b0010010110;

	8'hdc: encoder_fn = 10'b0011100110;
	8'hdd: encoder_fn = !RDreg ? 10'b1011100110 : 10'b0100010110;
	8'hde: encoder_fn = !RDreg ? 10'b0111100110 : 10'b1000010110;
	8'hdf: encoder_fn = !RDreg ? 10'b1010110110 : 10'b0101000110;

	8'he0: encoder_fn = !RDreg ? 10'b1001110001 : 10'b0110001110;
	8'he1: encoder_fn = !RDreg ? 10'b0111010001 : 10'b1000101110;
	8'he2: encoder_fn = !RDreg ? 10'b1011010001 : 10'b0100101110;
	8'he3: encoder_fn = !RDreg ? 10'b1100011110 : 10'b1100010001;

	8'he4: encoder_fn = !RDreg ? 10'b1101010001 : 10'b0010101110;
	8'he5: encoder_fn = !RDreg ? 10'b1010011110 : 10'b1010010001;
	8'he6: encoder_fn = !RDreg ? 10'b0110011110 : 10'b0110010001;
	8'he7: encoder_fn = !RDreg ? 10'b1110001110 : 10'b0001110001;

	8'he8: encoder_fn = !RDreg ? 10'b1110010001 : 10'b0001101110;
	8'he9: encoder_fn = !RDreg ? 10'b1001011110 : 10'b1001010001;
	8'hea: encoder_fn = !RDreg ? 10'b0101011110 : 10'b0101010001;
	8'heb: encoder_fn = !RDreg ? 10'b1101001110 : 10'b1101001000;

	8'hec: encoder_fn = !RDreg ? 10'b0011011110 : 10'b0011010001;
	8'hed: encoder_fn = !RDreg ? 10'b1011001110 : 10'b1011001000;
	8'hee: encoder_fn = !RDreg ? 10'b0111001110 : 10'b0111001000;
	8'hef: encoder_fn = !RDreg ? 10'b0101110001 : 10'b1010001110;

	8'hf0: encoder_fn = !RDreg ? 10'b0110110001 : 10'b1001001110;
	8'hf1: encoder_fn = !RDreg ? 10'b1000110111 : 10'b1000110001;
	8'hf2: encoder_fn = !RDreg ? 10'b0100110111 : 10'b0100110001;
	8'hf3: encoder_fn = !RDreg ? 10'b1100101110 : 10'b1100100001;
	
	8'hf4: encoder_fn = !RDreg ? 10'b0010110111 : 10'b0010110001;
	8'hf5: encoder_fn = !RDreg ? 10'b1010101110 : 10'b1010100001;
	8'hf6: encoder_fn = !RDreg ? 10'b0110101110 : 10'b0110100001;
	8'hf7: encoder_fn = !RDreg ? 10'b1110100001 : 10'b0001011110;
	
	8'hf8: encoder_fn = !RDreg ? 10'b1100110001 : 10'b0011001110;
	8'hf9: encoder_fn = !RDreg ? 10'b1001101110 : 10'b1001100001;
	8'hfa: encoder_fn = !RDreg ? 10'b0101101110 : 10'b0101100001;
	8'hfb: encoder_fn = !RDreg ? 10'b1101100001 : 10'b0010011110;

	8'hfc: encoder_fn = !RDreg ? 10'b0011101110 : 10'b0011100001;
	8'hfd: encoder_fn = !RDreg ? 10'b1011100001 : 10'b0100011110;
	8'hfe: encoder_fn = !RDreg ? 10'b0111100001 : 10'b1000011110;
	8'hff: encoder_fn = !RDreg ? 10'b1010110001 : 10'b0101001110;

	endcase	
     else 
	case (encoder_sel) // synopsys full_case parallel_case infer_mux
	`PCS_ENC_K285 :	// 4'h0	- K28.5
		encoder_fn = !RDreg ? 10'b0011111010 : 10'b1100000101;	
	`PCS_ENC_IDLE2 :  	// 4'h1 - D16.2
		encoder_fn = !RDreg ? 10'b0110110101 : 10'b1001000101;
	`PCS_ENC_SOP :		// 4'h2 - K27.7
		encoder_fn = !RDreg ? 10'b1101101000 : 10'b0010010111;	
	`PCS_ENC_T_CHAR :	// 4'h4 - K29.7
		encoder_fn = !RDreg ? 10'b1011101000 : 10'b0100010111;	
	`PCS_ENC_R_CHAR :	// 4'h5 - K23.7
		encoder_fn = !RDreg ? 10'b1110101000 : 10'b0001010111;	
	`PCS_ENC_IDLE1 : 	// 4'h6 - D5.6
		encoder_fn = 10'b1010010110;
	`PCS_ENC_H_CHAR : 	// 4'h7 - K30.7
		encoder_fn = !RDreg ? 10'b0111101000 : 10'b1000010111;
	`PCS_ENC_LINK_CONFA : 	// 4'h8 - D21.5
		encoder_fn = 10'b1010101010;
	`PCS_ENC_LINK_CONFB :	// 4'h9 - D2.2
		encoder_fn = !RDreg ? 10'b1011010101 : 10'b0100100101;
	endcase
	endfunction

endmodule	



