// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcs_tx_disparity.v
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
// @(#)pcs_tx_disparity.v	1.1G
/**********************************************************************/
/* Project Name  :  CASSINI                                           */
/* Module Name   :  PCS Tx Running Disparity Calculator		      */
/* Description   :  Calculates new running disparity based on	      */
/*		    disparity and incoming data for use by encoder.   */
/*    								      */
/* Assumptions   : none.					      */
/*    								      */
/* Parent module : pcs_decoder.v                                      */
/* Child modules : none.                                              */
/* Author Name   : Linda Chen                                         */
/* Date Created  : 10/21/96                                           */
/*                                                                    */
/*              Copyright (c) 1994, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */ 
/* Modifications : none yet                                           */
/* Synthesis Notes : none yet                                         */
/**********************************************************************/

`include  "pcs_define.h"

module	pcs_tx_disparity (reset_tx, txclk,special_char, tx_enc_sel,// inputs
			  data, RDreg, 	

			  RD);					// outputs

input	reset_tx;		// reset to initial RD to neg
input	txclk;			// 125 MHz Tx clk
input	special_char;		// special char indication
input [3:0] tx_enc_sel;		// encoder control
input	[7:0]	data;		// non-encoded data
input	RDreg;			// running disparity calculated

output	RD;			// running disparity final

wire	rst_reg;		// delayed reset by one clock to init rundisp

assign RD = rst_reg ? 1'b0 : rd_fn (special_char,tx_enc_sel,data,RDreg);

REG #(1) r_rstreg( .din(reset_tx), .clk(txclk), .qout(rst_reg) );

    function rd_fn;
	
    input	special_char;
    input [3:0] tx_enc_sel;
    input [7:0] data;
    input 	RDreg;
    if (!special_char) 
        case (data[7:0])	//synopsys parallel_case full_case

	8'h00: rd_fn = RDreg;
	8'h01: rd_fn = RDreg;
	8'h02: rd_fn = RDreg;
	8'h03: rd_fn = ~RDreg;

	8'h04: rd_fn = RDreg;
	8'h05: rd_fn = ~RDreg;
	8'h06: rd_fn = ~RDreg;
	8'h07: rd_fn = ~RDreg;

	8'h08: rd_fn = RDreg;
	8'h09: rd_fn = ~RDreg;
	8'h0a: rd_fn = ~RDreg;
	8'h0b: rd_fn = ~RDreg;
	
	8'h0c: rd_fn = ~RDreg;
	8'h0d: rd_fn = ~RDreg;
	8'h0e: rd_fn = ~RDreg;
	8'h0f: rd_fn = RDreg;

	8'h10: rd_fn = RDreg;
	8'h11: rd_fn = ~RDreg;
	8'h12: rd_fn = ~RDreg;
	8'h13: rd_fn = ~RDreg;

	8'h14: rd_fn = ~RDreg;
	8'h15: rd_fn = ~RDreg;
	8'h16: rd_fn = ~RDreg;
	8'h17: rd_fn = RDreg;

	8'h18: rd_fn = RDreg;
	8'h19: rd_fn = ~RDreg;
	8'h1a: rd_fn = ~RDreg;
	8'h1b: rd_fn = RDreg;

	8'h1c: rd_fn = ~RDreg;
	8'h1d: rd_fn = RDreg;
	8'h1e: rd_fn = RDreg;
	8'h1f: rd_fn = RDreg;

	8'h20: rd_fn = ~RDreg;
	8'h21: rd_fn = ~RDreg;
	8'h22: rd_fn = ~RDreg;
	8'h23: rd_fn = RDreg;

	8'h24: rd_fn = ~RDreg;
	8'h25: rd_fn = RDreg;
	8'h26: rd_fn = RDreg;
	8'h27: rd_fn = RDreg;

	8'h28: rd_fn = ~RDreg;
	8'h29: rd_fn = RDreg;
	8'h2a: rd_fn = RDreg;
	8'h2b: rd_fn = RDreg;
	
	8'h2c: rd_fn = RDreg;
	8'h2d: rd_fn = RDreg;
	8'h2e: rd_fn = RDreg;
	8'h2f: rd_fn = ~RDreg;

	8'h30: rd_fn = ~RDreg;
	8'h31: rd_fn = RDreg;
	8'h32: rd_fn = RDreg;
	8'h33: rd_fn = RDreg;

	8'h34: rd_fn = RDreg;
	8'h35: rd_fn = RDreg;
	8'h36: rd_fn = RDreg;
	8'h37: rd_fn = ~RDreg;

	8'h38: rd_fn = ~RDreg;
	8'h39: rd_fn = RDreg;
	8'h3a: rd_fn = RDreg;
	8'h3b: rd_fn = ~RDreg;
	
	8'h3c: rd_fn = RDreg;
	8'h3d: rd_fn = ~RDreg;
	8'h3e: rd_fn = ~RDreg;
	8'h3f: rd_fn = ~RDreg;

	8'h40: rd_fn = ~RDreg;
	8'h41: rd_fn = ~RDreg;
	8'h42: rd_fn = ~RDreg;
	8'h43: rd_fn = RDreg;

	8'h44: rd_fn = ~RDreg;
	8'h45: rd_fn = RDreg;
	8'h46: rd_fn = RDreg;
	8'h47: rd_fn = RDreg;

	8'h48: rd_fn = ~RDreg;
	8'h49: rd_fn = RDreg;
	8'h4a: rd_fn = RDreg;
	8'h4b: rd_fn = RDreg;
	
	8'h4c: rd_fn = RDreg;
	8'h4d: rd_fn = RDreg;
	8'h4e: rd_fn = RDreg;
	8'h4f: rd_fn = ~RDreg;

	8'h50: rd_fn = ~RDreg;
	8'h51: rd_fn = RDreg;
	8'h52: rd_fn = RDreg;
	8'h53: rd_fn = RDreg;

	8'h54: rd_fn = RDreg;
	8'h55: rd_fn = RDreg;
	8'h56: rd_fn = RDreg;
	8'h57: rd_fn = ~RDreg;

	8'h58: rd_fn = ~RDreg;
	8'h59: rd_fn = RDreg;
	8'h5a: rd_fn = RDreg;
	8'h5b: rd_fn = ~RDreg;
	
	8'h5c: rd_fn = RDreg;
	8'h5d: rd_fn = ~RDreg;
	8'h5e: rd_fn = ~RDreg;
	8'h5f: rd_fn = ~RDreg;

	8'h60: rd_fn = ~RDreg;
	8'h61: rd_fn = ~RDreg;
	8'h62: rd_fn = ~RDreg;
	8'h63: rd_fn = RDreg;

	8'h64: rd_fn = ~RDreg;
	8'h65: rd_fn = RDreg;
	8'h66: rd_fn = RDreg;
	8'h67: rd_fn = RDreg;

	8'h68: rd_fn = ~RDreg;
	8'h69: rd_fn = RDreg;
	8'h6a: rd_fn = RDreg;
	8'h6b: rd_fn = RDreg;
	
	8'h6c: rd_fn = RDreg;
	8'h6d: rd_fn = RDreg;
	8'h6e: rd_fn = RDreg;
	8'h6f: rd_fn = ~RDreg;

	8'h70: rd_fn = ~RDreg;
	8'h71: rd_fn = RDreg;
	8'h72: rd_fn = RDreg;
	8'h73: rd_fn = RDreg;

	8'h74: rd_fn = RDreg;
	8'h75: rd_fn = RDreg;
	8'h76: rd_fn = RDreg;
	8'h77: rd_fn = ~RDreg;

	8'h78: rd_fn = ~RDreg;
	8'h79: rd_fn = RDreg;
	8'h7a: rd_fn = RDreg;
	8'h7b: rd_fn = ~RDreg;
	
	8'h7c: rd_fn = RDreg;
	8'h7d: rd_fn = ~RDreg;
	8'h7e: rd_fn = ~RDreg;
	8'h7f: rd_fn = ~RDreg;

	8'h80: rd_fn = RDreg;
	8'h81: rd_fn = RDreg;
	8'h82: rd_fn = RDreg;
	8'h83: rd_fn = ~RDreg;

	8'h84: rd_fn = RDreg;
	8'h85: rd_fn = ~RDreg;
	8'h86: rd_fn = ~RDreg;
	8'h87: rd_fn = ~RDreg;

	8'h88: rd_fn = RDreg;
	8'h89: rd_fn = ~RDreg;
	8'h8a: rd_fn = ~RDreg;
	8'h8b: rd_fn = ~RDreg;
	
	8'h8c: rd_fn = ~RDreg;
	8'h8d: rd_fn = ~RDreg;
	8'h8e: rd_fn = ~RDreg;
	8'h8f: rd_fn = RDreg;

	8'h90: rd_fn = RDreg;
	8'h91: rd_fn = ~RDreg;
	8'h92: rd_fn = ~RDreg;
	8'h93: rd_fn = ~RDreg;

	8'h94: rd_fn = ~RDreg;
	8'h95: rd_fn = ~RDreg;
	8'h96: rd_fn = ~RDreg;
	8'h97: rd_fn = RDreg;

	8'h98: rd_fn = RDreg;
	8'h99: rd_fn = ~RDreg;
	8'h9a: rd_fn = ~RDreg;
	8'h9b: rd_fn = RDreg;
	
	8'h9c: rd_fn = ~RDreg;
	8'h9d: rd_fn = RDreg;
	8'h9e: rd_fn = RDreg;
	8'h9f: rd_fn = RDreg;

	8'ha0: rd_fn = ~RDreg;
	8'ha1: rd_fn = ~RDreg;
	8'ha2: rd_fn = ~RDreg;
	8'ha3: rd_fn = RDreg;

	8'ha4: rd_fn = ~RDreg;
	8'ha5: rd_fn = RDreg;
	8'ha6: rd_fn = RDreg;
	8'ha7: rd_fn = RDreg;

	8'ha8: rd_fn = ~RDreg;
	8'ha9: rd_fn = RDreg;
	8'haa: rd_fn = RDreg;
	8'hab: rd_fn = RDreg;
	
	8'hac: rd_fn = RDreg;
	8'had: rd_fn = RDreg;
	8'hae: rd_fn = RDreg;
	8'haf: rd_fn = ~RDreg;

	8'hb0: rd_fn = ~RDreg;
	8'hb1: rd_fn = RDreg;
	8'hb2: rd_fn = RDreg;
	8'hb3: rd_fn = RDreg;

	8'hb4: rd_fn = RDreg;
	8'hb5: rd_fn = RDreg;
	8'hb6: rd_fn = RDreg;
	8'hb7: rd_fn = ~RDreg;

	8'hb8: rd_fn = ~RDreg;
	8'hb9: rd_fn = RDreg;
	8'hba: rd_fn = RDreg;
	8'hbb: rd_fn = ~RDreg;
	
	8'hbc: rd_fn = RDreg;
	8'hbd: rd_fn = ~RDreg;
	8'hbe: rd_fn = ~RDreg;
	8'hbf: rd_fn = ~RDreg;

	8'hc0: rd_fn = ~RDreg;
	8'hc1: rd_fn = ~RDreg;
	8'hc2: rd_fn = ~RDreg;
	8'hc3: rd_fn = RDreg;

	8'hc4: rd_fn = ~RDreg;
	8'hc5: rd_fn = RDreg;
	8'hc6: rd_fn = RDreg;
	8'hc7: rd_fn = RDreg;

	8'hc8: rd_fn = ~RDreg;
	8'hc9: rd_fn = RDreg;
	8'hca: rd_fn = RDreg;
	8'hcb: rd_fn = RDreg;
	
	8'hcc: rd_fn = RDreg;
	8'hcd: rd_fn = RDreg;
	8'hce: rd_fn = RDreg;
	8'hcf: rd_fn = ~RDreg;

	8'hd0: rd_fn = ~RDreg;
	8'hd1: rd_fn = RDreg;
	8'hd2: rd_fn = RDreg;
	8'hd3: rd_fn = RDreg;

	8'hd4: rd_fn = RDreg;
	8'hd5: rd_fn = RDreg;
	8'hd6: rd_fn = RDreg;
	8'hd7: rd_fn = ~RDreg;

	8'hd8: rd_fn = ~RDreg;
	8'hd9: rd_fn = RDreg;
	8'hda: rd_fn = RDreg;
	8'hdb: rd_fn = ~RDreg;
	
	8'hdc: rd_fn = RDreg;
	8'hdd: rd_fn = ~RDreg;
	8'hde: rd_fn = ~RDreg;
	8'hdf: rd_fn = ~RDreg;

	8'he0: rd_fn = RDreg;
	8'he1: rd_fn = RDreg;
	8'he2: rd_fn = RDreg;
	8'he3: rd_fn = ~RDreg;

	8'he4: rd_fn = RDreg;
	8'he5: rd_fn = ~RDreg;
	8'he6: rd_fn = ~RDreg;
	8'he7: rd_fn = ~RDreg;

	8'he8: rd_fn = RDreg;
	8'he9: rd_fn = ~RDreg;
	8'hea: rd_fn = ~RDreg;
	8'heb: rd_fn = ~RDreg;
	
	8'hec: rd_fn = ~RDreg;
	8'hed: rd_fn = ~RDreg;
	8'hee: rd_fn = ~RDreg;
	8'hef: rd_fn = RDreg;

	8'hf0: rd_fn = RDreg;
	8'hf1: rd_fn = ~RDreg;
	8'hf2: rd_fn = ~RDreg;
	8'hf3: rd_fn = ~RDreg;

	8'hf4: rd_fn = ~RDreg;
	8'hf5: rd_fn = ~RDreg;
	8'hf6: rd_fn = ~RDreg;
	8'hf7: rd_fn = RDreg;

	8'hf8: rd_fn = RDreg;
	8'hf9: rd_fn = ~RDreg;
	8'hfa: rd_fn = ~RDreg;
	8'hfb: rd_fn = RDreg;
	
	8'hfc: rd_fn = ~RDreg;
	8'hfd: rd_fn = RDreg;
	8'hfe: rd_fn = RDreg;
	8'hff: rd_fn = RDreg;

        endcase

    else 
	case (tx_enc_sel)	// synopsys parallel_case full_case
	`PCS_ENC_K285 : 	// 4'h0	- K28.5
		 rd_fn = ~RDreg;
	`PCS_ENC_IDLE2 :  	// 4'h1 - D16.2
		 rd_fn = ~RDreg;
	`PCS_ENC_SOP :		// 4'h2 - K27.7
		 rd_fn = RDreg;
	`PCS_ENC_T_CHAR :	// 4'h4 - K29.7
		 rd_fn = RDreg;
	`PCS_ENC_R_CHAR :	// 4'h5 - K23.7
		 rd_fn = RDreg;
	`PCS_ENC_IDLE1 : 	// 4'h6 - D5.6
		 rd_fn = RDreg;
	`PCS_ENC_H_CHAR : 	// 4'h7 - K30.7
		 rd_fn = RDreg; 
	`PCS_ENC_LINK_CONFA : 	// 4'h8 - D21.5
		 rd_fn = RDreg;
	`PCS_ENC_LINK_CONFB :	// 4'h9 - D2.2
		 rd_fn = ~RDreg;
	endcase

   endfunction

endmodule	
