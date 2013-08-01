// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_txd_blatch.v
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
/*%W%	%G%*/

/*****************************************************************
 *
 * File Name    : n2_txd_blatch.v
 * Author Name  : John Lo
 * Description  : This is n2 specific. To latch the outgoing 
 *                transmit side data to serdes to help on fixing
 *                the hold time issue.
 * 
 * Parent Module: sphy_dpath2
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 8/29/05
 * 
 * Design Notes:
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *

 * Synthesis Notes: 
 * 
 * 
 ****************************************************************/
 
module n2_txd_blatch ( /*AUTOARG*/
   // Outputs
   xtx_code_group_reg_latch, tx_code_group_latch, 
   // Inputs
   tx_nbclk, tx_clk_312mhz, xtx_code_group_reg, tx_code_group
   );

   input 	   tx_nbclk;
   input 	   tx_clk_312mhz;
   input  [39:0]   xtx_code_group_reg;
   input  [9:0]    tx_code_group;
   output [39:0]   xtx_code_group_reg_latch;
   output [9:0]    tx_code_group_latch;


// vlint flag_unmatched_port_connect_in_inst off
// vlint flag_null_instance_port off
// xpcs
cl_a1_blatch_4x xtx_blatch_39 ( .latout(xtx_code_group_reg_latch[39]), .so(), .d(xtx_code_group_reg[39]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_38 ( .latout(xtx_code_group_reg_latch[38]), .so(), .d(xtx_code_group_reg[38]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_37 ( .latout(xtx_code_group_reg_latch[37]), .so(), .d(xtx_code_group_reg[37]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_36 ( .latout(xtx_code_group_reg_latch[36]), .so(), .d(xtx_code_group_reg[36]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_35 ( .latout(xtx_code_group_reg_latch[35]), .so(), .d(xtx_code_group_reg[35]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_34 ( .latout(xtx_code_group_reg_latch[34]), .so(), .d(xtx_code_group_reg[34]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_33 ( .latout(xtx_code_group_reg_latch[33]), .so(), .d(xtx_code_group_reg[33]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_32 ( .latout(xtx_code_group_reg_latch[32]), .so(), .d(xtx_code_group_reg[32]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_31 ( .latout(xtx_code_group_reg_latch[31]), .so(), .d(xtx_code_group_reg[31]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_30 ( .latout(xtx_code_group_reg_latch[30]), .so(), .d(xtx_code_group_reg[30]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_29 ( .latout(xtx_code_group_reg_latch[29]), .so(), .d(xtx_code_group_reg[29]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_28 ( .latout(xtx_code_group_reg_latch[28]), .so(), .d(xtx_code_group_reg[28]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_27 ( .latout(xtx_code_group_reg_latch[27]), .so(), .d(xtx_code_group_reg[27]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_26 ( .latout(xtx_code_group_reg_latch[26]), .so(), .d(xtx_code_group_reg[26]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_25 ( .latout(xtx_code_group_reg_latch[25]), .so(), .d(xtx_code_group_reg[25]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_24 ( .latout(xtx_code_group_reg_latch[24]), .so(), .d(xtx_code_group_reg[24]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_23 ( .latout(xtx_code_group_reg_latch[23]), .so(), .d(xtx_code_group_reg[23]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_22 ( .latout(xtx_code_group_reg_latch[22]), .so(), .d(xtx_code_group_reg[22]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_21 ( .latout(xtx_code_group_reg_latch[21]), .so(), .d(xtx_code_group_reg[21]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_20 ( .latout(xtx_code_group_reg_latch[20]), .so(), .d(xtx_code_group_reg[20]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_19 ( .latout(xtx_code_group_reg_latch[19]), .so(), .d(xtx_code_group_reg[19]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_18 ( .latout(xtx_code_group_reg_latch[18]), .so(), .d(xtx_code_group_reg[18]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_17 ( .latout(xtx_code_group_reg_latch[17]), .so(), .d(xtx_code_group_reg[17]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_16 ( .latout(xtx_code_group_reg_latch[16]), .so(), .d(xtx_code_group_reg[16]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_15 ( .latout(xtx_code_group_reg_latch[15]), .so(), .d(xtx_code_group_reg[15]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_14 ( .latout(xtx_code_group_reg_latch[14]), .so(), .d(xtx_code_group_reg[14]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_13 ( .latout(xtx_code_group_reg_latch[13]), .so(), .d(xtx_code_group_reg[13]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_12 ( .latout(xtx_code_group_reg_latch[12]), .so(), .d(xtx_code_group_reg[12]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_11 ( .latout(xtx_code_group_reg_latch[11]), .so(), .d(xtx_code_group_reg[11]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_10 ( .latout(xtx_code_group_reg_latch[10]), .so(), .d(xtx_code_group_reg[10]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_9  ( .latout(xtx_code_group_reg_latch[9 ]), .so(), .d(xtx_code_group_reg[9 ]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_8  ( .latout(xtx_code_group_reg_latch[8 ]), .so(), .d(xtx_code_group_reg[8 ]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_7  ( .latout(xtx_code_group_reg_latch[7 ]), .so(), .d(xtx_code_group_reg[7 ]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_6  ( .latout(xtx_code_group_reg_latch[6 ]), .so(), .d(xtx_code_group_reg[6 ]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_5  ( .latout(xtx_code_group_reg_latch[5 ]), .so(), .d(xtx_code_group_reg[5 ]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_4  ( .latout(xtx_code_group_reg_latch[4 ]), .so(), .d(xtx_code_group_reg[4 ]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_3  ( .latout(xtx_code_group_reg_latch[3 ]), .so(), .d(xtx_code_group_reg[3 ]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_2  ( .latout(xtx_code_group_reg_latch[2 ]), .so(), .d(xtx_code_group_reg[2 ]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_1  ( .latout(xtx_code_group_reg_latch[1 ]), .so(), .d(xtx_code_group_reg[1 ]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x xtx_blatch_0  ( .latout(xtx_code_group_reg_latch[0 ]), .so(), .d(xtx_code_group_reg[0 ]), .l1clk(tx_clk_312mhz), .si(1'b0), .siclk(1'b0), .soclk(1'b0));

// pcs
cl_a1_blatch_4x  tx_blatch_9  ( .latout( tx_code_group_latch[9 ]), .so(), .d(tx_code_group[9 ]), .l1clk(tx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x  tx_blatch_8  ( .latout( tx_code_group_latch[8 ]), .so(), .d(tx_code_group[8 ]), .l1clk(tx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x  tx_blatch_7  ( .latout( tx_code_group_latch[7 ]), .so(), .d(tx_code_group[7 ]), .l1clk(tx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x  tx_blatch_6  ( .latout( tx_code_group_latch[6 ]), .so(), .d(tx_code_group[6 ]), .l1clk(tx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x  tx_blatch_5  ( .latout( tx_code_group_latch[5 ]), .so(), .d(tx_code_group[5 ]), .l1clk(tx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x  tx_blatch_4  ( .latout( tx_code_group_latch[4 ]), .so(), .d(tx_code_group[4 ]), .l1clk(tx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x  tx_blatch_3  ( .latout( tx_code_group_latch[3 ]), .so(), .d(tx_code_group[3 ]), .l1clk(tx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x  tx_blatch_2  ( .latout( tx_code_group_latch[2 ]), .so(), .d(tx_code_group[2 ]), .l1clk(tx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x  tx_blatch_1  ( .latout( tx_code_group_latch[1 ]), .so(), .d(tx_code_group[1 ]), .l1clk(tx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0));
cl_a1_blatch_4x  tx_blatch_0  ( .latout( tx_code_group_latch[0 ]), .so(), .d(tx_code_group[0 ]), .l1clk(tx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0));

// vlint flag_null_instance_port on
// vlint flag_unmatched_port_connect_in_inst on

endmodule // n2_txd_blatch

