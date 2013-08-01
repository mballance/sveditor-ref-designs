// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcs_decoder.v
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
// @(#)pcs_decoder.v	1.3G
/**********************************************************************/
/* Project Name  :  CASSINI                                           */
/* Module Name   :  PCS Decoder Block				      */
/* Description   :  This block decodes an incoming data stream of     */
/*		    10 bits to 8 bits of data as well as special      */
/*		    characters.  The Fibre channel special characters */
/*		    are called K characters.  They go along with      */
/*		    special data symbols to mark an "ordered set".    */
/*		    The K characters are flagged with kchar and the   */
/*		    the special data characters are flagged also.     */
/*		    Running disparity is calculated on a per clock    */
/*		    regardless of disparity errors. Running disparity */
/*		    and decode errors are flagged.  Kchar and special */
/*		    chararacter flags are not asserted when a decode  */
/*		    error occurs.			      	      */
/*    								      */
/* Assumptions   : none.					      */
/*    								      */
/* Parent module : pcs_rx_dpath.v                                     */
/* Child modules : pcs_rx_disparity.v                                 */
/* Author Name   : Linda Chen                                         */
/* Date Created  : 10/21/96                                           */
/*                                                                    */
/*              Copyright (c) 1994, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */ 
/* Modifications : 						      */
/*		7/22/97 : removed flag got_d_idle_pp, not needed     */
/*		11/14/97: removed if else check for I1 and I2	      */
/*		11/14/97: added decode check for reserved K chars     */
/*		11/14/97: marked unknown kchar as none of the known   */
/*			  ones 					      */
/*		12/9/98 : added detection for characters within 1     */
/*			  bit of K28.5 of correct disparity for       */
/*			  carrier detect generation		      */
/* Synthesis Notes : none yet                                         */
/**********************************************************************/

module pcs_decoder(rx_10bdec_in,rxclk, 			// inputs

		rx_8bdec_out,dec_err_pp,disp_err_pp,  // outputs
		kchar_pp,got_d_linkconf_pp,comma_pp,k285w1_pp);

input 	[9:0] rx_10bdec_in;	// receive encoded 10 bit data
input 	rxclk;			// rxclk, 125 MHz

output 	[7:0] rx_8bdec_out;	// decoded data byte
output	dec_err_pp,		// flag to mark decoding error
	disp_err_pp;		// flag to mark running disparity error
output	kchar_pp;		// flag to mark k character
output	got_d_linkconf_pp;	// flag to mark special char for link conf
output	comma_pp;		// flag to mark comma characters
output	k285w1_pp;		// flag to mark all chars within 1 bit
				// the same as k28.5

wire	dec_err1,dec_err2,	// decode error flags for most/least sig bits
	rderr1, rderr2,		// running disp. flags for most/least sig bits
	RDreg, newRD;   	// running disparity signals
wire	k285w1_p_match,		// find characters within one bit of k28.5
	k285w1_n_match;		// of the right disparity for carrier detect

wire pos_disp;

/*
** Running disparity calculator
*/
pcs_rx_disparity pcs_rx_disparity (rx_10bdec_in, RDreg, newRD, pos_disp);  

/*
** Call of functions to decode most and least significant bits of data
*/
assign 	{rx_8bdec_out[4:0],dec_err1,kchar_pp,//got_d_idle_pp,
		got_d_linkconf_pp,comma_pp,rderr1} = 
			deco1_fcn(rx_10bdec_in,RDreg),
	{rx_8bdec_out[7:5],dec_err2,rderr2} = 
			deco2_fcn(rx_10bdec_in[3:0],newRD,kchar_pp);


assign	dec_err_pp = dec_err1 | dec_err2,
	disp_err_pp = rderr1 | rderr2,
	k285w1_p_match = ((rx_10bdec_in == 10'b110000_0101) ||	
	(rx_10bdec_in == 10'b010000_0101) ||	
	(rx_10bdec_in == 10'b100000_0101) ||	
	(rx_10bdec_in == 10'b111000_0101) ||	
	(rx_10bdec_in == 10'b110100_0101) ||	
	(rx_10bdec_in == 10'b110010_0101) ||	
	(rx_10bdec_in == 10'b110001_0101) ||	
	(rx_10bdec_in == 10'b110000_1101) ||	
	(rx_10bdec_in == 10'b110000_0001) ||	
	(rx_10bdec_in == 10'b110000_0111) ||	
	(rx_10bdec_in == 10'b110000_0100) ),
	k285w1_n_match = ((rx_10bdec_in == 10'b001111_1010) ||
	(rx_10bdec_in == 10'b101111_1010) ||
	(rx_10bdec_in == 10'b011111_1010) ||
	(rx_10bdec_in == 10'b000111_1010) ||
	(rx_10bdec_in == 10'b001011_1010) ||
	(rx_10bdec_in == 10'b001101_1010) ||
	(rx_10bdec_in == 10'b001110_1010) ||
	(rx_10bdec_in == 10'b001111_0010) ||
	(rx_10bdec_in == 10'b001111_1110) ||
	(rx_10bdec_in == 10'b001111_1000) ||
	(rx_10bdec_in == 10'b001111_1011)),
	k285w1_pp = ((k285w1_n_match & ~RDreg) || (k285w1_p_match & RDreg));
	

/*
** Register to hold running disparity
*/
REG #(1) r_run_disp ( .din(pos_disp), .clk(rxclk), .qout(RDreg) );

/*
** Function to do 6b5b decode on most significant bits of rx_10bdata
** ~RDreg means that you can only get this code if the beginning
**  running disparity is one.  So if zero, error is flagged.
** RDreg means that you can only get this code if the beginning
**  running disparity is zero.  So if one, error is flagged.
** 1'b0 means that this code can be received whether the 
**  running disparity is zero or one.  So no check is done.
**
** The function output is:
** {decodata[4:0],dec_err1,kchar,got_d_linkconf_pp,rderr}
*/
function [9:0] deco1_fcn;
		input 	[9:0] rx_data;
		input	RDreg;

		case (rx_data[9:4]) 	//synopsys parallel_case 
			6'b011000: deco1_fcn = {5'b00000,2'b00,1'b0,1'b0,~RDreg};
			6'b100111: deco1_fcn = {5'b00000,2'b00,1'b0,1'b0,RDreg};
			6'b100010: deco1_fcn = {5'b00001,2'b00,1'b0,1'b0,~RDreg};
			6'b011101: deco1_fcn = {5'b00001,2'b00,1'b0,1'b0,RDreg};
	   /* D2 */	6'b010010: if (rx_data[3:0]==4'b0101)	// ConfigB
				deco1_fcn = {5'b00010,2'b00,1'b1,1'b0,~RDreg};
				else deco1_fcn = {5'b00010,2'b00,1'b0,1'b0,~RDreg};
	   /* D2 */	6'b101101: if (rx_data[3:0]==4'b0101)	// ConfigB
				deco1_fcn = {5'b00010,2'b00,1'b1,1'b0,RDreg};
				else deco1_fcn = {5'b00010,2'b00,1'b0,1'b0,RDreg};
       	        	6'b110001: deco1_fcn = {5'b00011,2'b00,1'b0,1'b0,1'b0};
			6'b001010: deco1_fcn = {5'b00100,2'b00,1'b0,1'b0,~RDreg};
			6'b110101: deco1_fcn = {5'b00100,2'b00,1'b0,1'b0,RDreg};
       	   /* D5  */	6'b101001: deco1_fcn = {5'b00101,2'b00,1'b0,1'b0,1'b0}; // I1
			6'b011001: deco1_fcn = {5'b00110,2'b00,1'b0,1'b0,1'b0};
			6'b000111: deco1_fcn = {5'b00111,2'b00,1'b0,1'b0,~RDreg};
			6'b111000: deco1_fcn = {5'b00111,2'b00,1'b0,1'b0,RDreg};
			6'b000110: deco1_fcn = {5'b01000,2'b00,1'b0,1'b0,~RDreg};
			6'b111001: deco1_fcn = {5'b01000,2'b00,1'b0,1'b0,RDreg};
               		6'b100101: deco1_fcn = {5'b01001,2'b00,1'b0,1'b0,1'b0};
	   	 	6'b010101: deco1_fcn = {5'b01010,2'b00,1'b0,1'b0,1'b0};
               		6'b110100: deco1_fcn = {5'b01011,2'b00,1'b0,1'b0,1'b0};
               		6'b001101: deco1_fcn = {5'b01100,2'b00,1'b0,1'b0,1'b0};
               		6'b101100: deco1_fcn = {5'b01101,2'b00,1'b0,1'b0,1'b0};
               		6'b011100: deco1_fcn = {5'b01110,2'b00,1'b0,1'b0,1'b0};
			6'b101000: deco1_fcn = {5'b01111,2'b00,1'b0,1'b0,~RDreg};
			6'b010111: deco1_fcn = {5'b01111,2'b00,1'b0,1'b0,RDreg};
	   /* D16 */	6'b100100: deco1_fcn = {5'b10000,2'b00,1'b0,1'b0,~RDreg}; // I2
	   /* D16 */	6'b011011: deco1_fcn = {5'b10000,2'b00,1'b0,1'b0,RDreg}; // I2
               		6'b100011: deco1_fcn = {5'b10001,2'b00,1'b0,1'b0,1'b0};
               		6'b010011: deco1_fcn = {5'b10010,2'b00,1'b0,1'b0,1'b0};
               		6'b110010: deco1_fcn = {5'b10011,2'b00,1'b0,1'b0,1'b0};
               		6'b001011: deco1_fcn = {5'b10100,2'b00,1'b0,1'b0,1'b0};
           /* D21 */	6'b101010: if (rx_data[3:0]==4'b1010)	// ConfigA
				deco1_fcn = {5'b10101,2'b00,1'b1,1'b0,1'b0};
				else deco1_fcn = {5'b10101,2'b00,1'b0,1'b0,1'b0};
               		6'b011010: deco1_fcn = {5'b10110,2'b00,1'b0,1'b0,1'b0};
           /* D23 */ 	6'b000101: if (rx_data[3:0]==4'b0111)	// R
				deco1_fcn = {5'b00001,2'b01,1'b0,1'b0,~RDreg};
				else deco1_fcn = {5'b10111,2'b00,1'b0,1'b0,~RDreg};
           /* D23 */	6'b111010: if (rx_data[3:0]==4'b1000)	// R
				deco1_fcn = {5'b00001,2'b01,1'b0,1'b0,RDreg};
				else deco1_fcn = {5'b10111,2'b00,1'b0,1'b0,RDreg};
			6'b001100: deco1_fcn = {5'b11000,2'b00,1'b0,1'b0,~RDreg};
			6'b110011: deco1_fcn = {5'b11000,2'b00,1'b0,1'b0,RDreg};
			6'b100110: deco1_fcn = {5'b11001,2'b00,1'b0,1'b0,1'b0};
               		6'b010110: deco1_fcn = {5'b11010,2'b00,1'b0,1'b0,1'b0};
	   /* D27 */    6'b001001: if (rx_data[3:0]==4'b0111)	// S
				deco1_fcn = {5'b00010,2'b01,1'b0,1'b0,~RDreg};
				else deco1_fcn = {5'b11011,2'b00,1'b0,1'b0,~RDreg};
	   /* D27 */    6'b110110: if (rx_data[3:0]==4'b1000)	// S
				deco1_fcn = {5'b00010,2'b01,1'b0,1'b0,RDreg};
				else deco1_fcn = {5'b11011,2'b00,1'b0,1'b0,RDreg};
               		6'b001110: deco1_fcn = {5'b11100,2'b00,1'b0,1'b0,1'b0};
	   /* D29 */	6'b010001: if (rx_data[3:0]==4'b0111)	// T
				deco1_fcn = {5'b00100,2'b01,1'b0,1'b0,~RDreg};
				else deco1_fcn = {5'b11101,2'b00,1'b0,1'b0,~RDreg};
	   /* D29 */ 	6'b101110: if (rx_data[3:0]==4'b1000)	// T
				deco1_fcn = {5'b00100,2'b01,1'b0,1'b0,RDreg};
				else deco1_fcn = {5'b11101,2'b00,1'b0,1'b0,RDreg};
	   /* D30 */	6'b100001: if (rx_data[3:0]==4'b0111)	// H
				deco1_fcn = {5'b01000,2'b01,1'b0,1'b0,~RDreg};
				else deco1_fcn = {5'b11110,2'b00,1'b0,1'b0,~RDreg};
	   /* D30 */	6'b011110: if (rx_data[3:0]==4'b1000)	// H
				deco1_fcn = {5'b01000,2'b01,1'b0,1'b0,RDreg};
				else deco1_fcn = {5'b11110,2'b00,1'b0,1'b0,RDreg};
			6'b010100: deco1_fcn = {5'b11111,2'b00,1'b0,1'b0,~RDreg};
			6'b101011: deco1_fcn = {5'b11111,2'b00,1'b0,1'b0,RDreg};
	   /* K28 */	6'b001111: if (rx_data[3:0]==4'b1010) 
				deco1_fcn = {5'b10000,2'b01,1'b0,1'b1,RDreg};
				else if (rx_data[3:0]==4'b1001)
				deco1_fcn = {5'b00000,2'b01,1'b0,1'b1,RDreg};
				else if (rx_data[3:0]==4'b1000)
				deco1_fcn = {5'b00000,2'b01,1'b0,1'b1,RDreg};
				else deco1_fcn = {5'h0,2'b01,1'b0,1'b0,RDreg};
	   /* K28 */	6'b110000: if (rx_data[3:0]==4'b0101) 
				deco1_fcn = {5'b10000,2'b01,1'b0,1'b1,~RDreg};
				else deco1_fcn = {5'h0,2'b01,1'b0,1'b0,RDreg};
			default: 
				deco1_fcn = {5'h0,2'b10,1'b0,1'b0,1'b0}; // dec_err1
		endcase	
	endfunction

/*
** Function to do 4b3b decode on least significant bits of rx_10bdata
** This decodes and checks K characters properly also.
*/
function [4:0] deco2_fcn;	//{decodata[7:5],dec_err2,rderr2}
		input 	[3:0] rx_data;
		input	newRD, kchar;
			if (kchar)
				deco2_fcn = {3'b111,1'b0,(rx_data[3]^newRD)};
			else
			case (rx_data[3:0]) //synopsys parallel_case 
				4'b1011: deco2_fcn = {3'b000,1'b0,newRD};
				4'b0100: deco2_fcn = {3'b000,1'b0,~newRD};
				4'b1001: deco2_fcn = {3'b001,2'b0};
				4'b0101: deco2_fcn = {3'b010,2'b0};
				4'b1100: deco2_fcn = {3'b011,1'b0,newRD};
				4'b0011: deco2_fcn = {3'b011,1'b0,~newRD};
				4'b1101: deco2_fcn = {3'b100,1'b0,newRD};
				4'b0010: deco2_fcn = {3'b100,1'b0,~newRD};
				4'b1010: deco2_fcn = {3'b101,2'b0};
				4'b0110: deco2_fcn = {3'b110,2'b0};
				4'b1110: deco2_fcn = {3'b111,1'b0,newRD};
				4'b0001: deco2_fcn = {3'b111,1'b0,~newRD};
				4'b1000: deco2_fcn = {3'b111,1'b0,~newRD};
				4'b0111: deco2_fcn = {3'b111,1'b0,newRD};
				default : deco2_fcn[4:0] = 5'b00010;
			endcase
	endfunction

endmodule 	
