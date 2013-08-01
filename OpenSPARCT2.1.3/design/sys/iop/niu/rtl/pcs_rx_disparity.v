// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcs_rx_disparity.v
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
// @(#)pcs_rx_disparity.v	1.1G
/**********************************************************************/
/* Project Name  :  CASSINI                                           */
/* Module Name   :  PCS Running Disparity Calculator		      */
/* Description   :  Calculates new running disparity based on	      */
/*		    disparity for both most significant 6 bits and    */
/*		    least significant 4 bits.  The running disparity  */
/*		    of the most significant 6 bits is called new_RD.  */
/*		    The final running disparity for all 10 bits is    */
/*		    called RD.					      */
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
	
module pcs_rx_disparity	(data, RDreg, 	// inputs
			 newRD, RD);	// outputs

	input	[9:0]	data;	// 8b10b encoded data
	input	RDreg;		// current running disparity

	output	newRD, 		// mid character running disparity	
		RD;		// final value for running disparity

	wire	noneof6, oneof6, twoof6, threeof6, fourof6, fiveof6, sixof6;
					//no. of 1#s in data[9:4]
	wire	noneof4, oneof4, twoof4, threeof4, fourof4;	
					//no. of 1#s in data[3:0]

	assign	noneof4 = ~(data[0] | data[1] | data[2] | data[3]),
		fourof4 = data[0] & data[1] & data[2] & data[3],
		threeof4 = ((data[0]^data[1]) & (~(data[2]^data[3]) & 
			(data[2]&data[3]))) |  ((data[2]^data[3]) & 
			(~(data[0]^data[1]) & (data[0]&data[1]))),
		oneof4 = ((~data[0]^~data[1]) & (~(~data[2]^~data[3]) & 
			(~data[2]&~data[3]))) | ((~data[2]^~data[3]) & 
			(~(~data[0]^~data[1]) & (~data[0]&~data[1]))),
		twoof4 = ((data[0]^data[1]) & (data[2]^data[3])) | 
			((data[0]&data[1]) ^ (data[2]&data[3])),
		noneof6 = ~(data[4] | data[5] | data[6] | data[7] | 
			data[8] | data[9]),
		sixof6 = data[4] & data[5] & data[6] & data[7] & data[8] & 
			data[9],
		fiveof6 = ( (((data[4]^data[5]) & (~(data[6]^data[7]) & 
			(data[6]&data[7]))) | ((data[6]^data[7]) & 
			(~(data[4]^data[5]) & (data[4]&data[5])))) & 
			(data[8] & data[9]) ) | ((data[4] & data[5] & 
			data[6] & data[7]) & (data[8] ^ data[9])),
		oneof6 = ( (((~data[4]^~data[5]) & (~(~data[6]^~data[7]) & 
			(~data[6]&~data[7]))) | ((~data[6]^~data[7]) & 
			(~(~data[4]^~data[5]) & (~data[4]&~data[5])))) 
                        & (~data[8] & ~data[9]) ) | ((~data[4] & ~data[5] & 
			~data[6] & ~data[7]) & (~data[8] ^ ~data[9])),
		fourof6 = ( (((data[4]^data[5]) & (data[6]^data[7])) | 
			((data[4]&data[5]) ^ (data[6]&data[7]))) & 
			(data[8] & data[9]) ) |	( (((data[4]^data[5]) & 
			(~(data[6]^data[7]) & (data[6]&data[7]))) | 
			((data[6]^data[7]) & (~(data[4]^data[5]) & 
			(data[4]&data[5])))) & (data[8] ^ data[9]) ) |
			( (data[4] & data[5] & data[6] & data[7]) & 
			(~(data[8]|data[9])) ),
		twoof6 = ( (((~data[4]^~data[5]) & (~data[6]^~data[7])) | 
			((~data[4]&~data[5]) ^ (~data[6]&~data[7]))) & 
			(~data[8] & ~data[9]) ) | ( (((~data[4]^~data[5]) & 
			(~(~data[6]^~data[7]) & (~data[6]&~data[7]))) 
                        | ((~data[6]^~data[7]) & (~(~data[4]^~data[5]) & 
			(~data[4]&~data[5])))) & (~data[8] ^ ~data[9]) ) | 
                        ( (~data[4] & ~data[5] & ~data[6] & ~data[7]) & 
			(~(~data[8]|~data[9])) ),
		threeof6 = ( (((~data[4]^~data[5]) & (~(~data[6]^~data[7]) & 
			(~data[6]&~data[7]))) | ((~data[6]^~data[7]) & 
			(~(~data[4]^~data[5]) & (~data[4]&~data[5])))) & 
			(data[8] & data[9]) ) |	( (((data[4]^data[5]) & 
			(data[6]^data[7])) | 
			((data[4]&data[5]) ^ (data[6]&data[7]))) & 
			(data[8] ^ data[9]) ) |	( (((data[4]^data[5]) & 
			(~(data[6]^data[7]) & (data[6]&data[7])))
                        |  ((data[6]^data[7]) & (~(data[4]^data[5]) & 
			(data[6]&data[7])))) & ( ~(data[8] | data[9])) ),
		newRD = ((noneof6 | oneof6 | twoof6) | 
			(threeof6 & (data[9:4]==6'b111000))) ? 1'b0 :
			((fourof6 | fiveof6 | sixof6) | (threeof6 & 
			(data[9:4]==6'b000111))) ? 1'b1 : RDreg,
		RD =  ((noneof4 | oneof4) | (twoof4 & 
			(data[3:0]==4'b1100))) ? 1'b0 : ((threeof4 | fourof4)
			| (twoof4 & (data[3:0]==4'b0011))) ? 1'b1 : newRD;

endmodule
