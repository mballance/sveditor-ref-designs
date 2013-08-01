// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs_tx_del.v
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
// %W%G
/**********************************************************************/
/* Project Name  :  GEM                                               	*/
/* Module Name   :  delay_05_						*/
/* Description   :  Delay element to aid in meeting hold requirement    */
/*			to lfsr.					*/
/* Assumptions   :  none						*/
/*									*/
/*									*/
/* Parent module : pcs_lfsr.v						*/
/* Child modules : none                                               	*/
/* Author Name   : Linda Cheng                                         	*/
/* Date Created  : 11/7/97                                           	*/
/*                                                                    	*/
/*              Copyright (c) 1994, Sun Microsystems, Inc.            	*/
/*                   Sun Proprietary and Confidential                 	*/
/*                                                                    	*/ 
/* Modifications : none yet						*/
/* Synthesis Notes :  none yet                                        	*/
/************************************************************************/

module xpcs_tx_del (Z,A);
input [6:0]	A;
output [6:0] 	Z;

DEL1ns DEL1ns_0 (.Z(Z[0]), .A(A[0]));
DEL1ns DEL1ns_1 (.Z(Z[1]), .A(A[1]));
DEL1ns DEL1ns_2 (.Z(Z[2]), .A(A[2]));
DEL1ns DEL1ns_3 (.Z(Z[3]), .A(A[3]));
DEL1ns DEL1ns_4 (.Z(Z[4]), .A(A[4]));
DEL1ns DEL1ns_5 (.Z(Z[5]), .A(A[5]));
DEL1ns DEL1ns_6 (.Z(Z[6]), .A(A[6]));

endmodule
