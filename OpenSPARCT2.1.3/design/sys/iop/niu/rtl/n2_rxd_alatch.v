// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_rxd_alatch.v
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
 * File Name    : n2_rxd_alatch.v
 * Author Name  : John Lo
 * Description  : This is n2 specific. To latch the incoming 
 *                receive side serdes data to help on fixing
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
 
module n2_rxd_alatch ( /*AUTOARG*/
   // Outputs
   xrx_code_group, rx_code_group, 
   // Inputs
   tcu_scan_en, rx_nbclk, rbc0_d, rbc0_c, rbc0_b, rbc0_a, 
   esr_mac_rxd
   );

   input           tcu_scan_en;
   input 	   rx_nbclk;
   input 	   rbc0_d;
   input 	   rbc0_c;
   input 	   rbc0_b;
   input 	   rbc0_a;
   input  [39:0]   esr_mac_rxd;
   output [39:0]   xrx_code_group;
   output [9:0]    rx_code_group;


// vlint flag_unmatched_port_connect_in_inst off
// vlint flag_null_instance_port off
// xpcs
cl_a1_alatch_4x xrx_alatch_39 ( .q(xrx_code_group[39]), .so(), .d(esr_mac_rxd[39]), .l1clk(rbc0_d), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_38 ( .q(xrx_code_group[38]), .so(), .d(esr_mac_rxd[38]), .l1clk(rbc0_d), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_37 ( .q(xrx_code_group[37]), .so(), .d(esr_mac_rxd[37]), .l1clk(rbc0_d), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_36 ( .q(xrx_code_group[36]), .so(), .d(esr_mac_rxd[36]), .l1clk(rbc0_d), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_35 ( .q(xrx_code_group[35]), .so(), .d(esr_mac_rxd[35]), .l1clk(rbc0_d), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_34 ( .q(xrx_code_group[34]), .so(), .d(esr_mac_rxd[34]), .l1clk(rbc0_d), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_33 ( .q(xrx_code_group[33]), .so(), .d(esr_mac_rxd[33]), .l1clk(rbc0_d), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_32 ( .q(xrx_code_group[32]), .so(), .d(esr_mac_rxd[32]), .l1clk(rbc0_d), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_31 ( .q(xrx_code_group[31]), .so(), .d(esr_mac_rxd[31]), .l1clk(rbc0_d), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_30 ( .q(xrx_code_group[30]), .so(), .d(esr_mac_rxd[30]), .l1clk(rbc0_d), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_29 ( .q(xrx_code_group[29]), .so(), .d(esr_mac_rxd[29]), .l1clk(rbc0_c), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_28 ( .q(xrx_code_group[28]), .so(), .d(esr_mac_rxd[28]), .l1clk(rbc0_c), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_27 ( .q(xrx_code_group[27]), .so(), .d(esr_mac_rxd[27]), .l1clk(rbc0_c), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_26 ( .q(xrx_code_group[26]), .so(), .d(esr_mac_rxd[26]), .l1clk(rbc0_c), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_25 ( .q(xrx_code_group[25]), .so(), .d(esr_mac_rxd[25]), .l1clk(rbc0_c), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_24 ( .q(xrx_code_group[24]), .so(), .d(esr_mac_rxd[24]), .l1clk(rbc0_c), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_23 ( .q(xrx_code_group[23]), .so(), .d(esr_mac_rxd[23]), .l1clk(rbc0_c), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_22 ( .q(xrx_code_group[22]), .so(), .d(esr_mac_rxd[22]), .l1clk(rbc0_c), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_21 ( .q(xrx_code_group[21]), .so(), .d(esr_mac_rxd[21]), .l1clk(rbc0_c), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_20 ( .q(xrx_code_group[20]), .so(), .d(esr_mac_rxd[20]), .l1clk(rbc0_c), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_19 ( .q(xrx_code_group[19]), .so(), .d(esr_mac_rxd[19]), .l1clk(rbc0_b), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_18 ( .q(xrx_code_group[18]), .so(), .d(esr_mac_rxd[18]), .l1clk(rbc0_b), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_17 ( .q(xrx_code_group[17]), .so(), .d(esr_mac_rxd[17]), .l1clk(rbc0_b), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_16 ( .q(xrx_code_group[16]), .so(), .d(esr_mac_rxd[16]), .l1clk(rbc0_b), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_15 ( .q(xrx_code_group[15]), .so(), .d(esr_mac_rxd[15]), .l1clk(rbc0_b), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_14 ( .q(xrx_code_group[14]), .so(), .d(esr_mac_rxd[14]), .l1clk(rbc0_b), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_13 ( .q(xrx_code_group[13]), .so(), .d(esr_mac_rxd[13]), .l1clk(rbc0_b), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_12 ( .q(xrx_code_group[12]), .so(), .d(esr_mac_rxd[12]), .l1clk(rbc0_b), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_11 ( .q(xrx_code_group[11]), .so(), .d(esr_mac_rxd[11]), .l1clk(rbc0_b), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_10 ( .q(xrx_code_group[10]), .so(), .d(esr_mac_rxd[10]), .l1clk(rbc0_b), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_9  ( .q(xrx_code_group[9 ]), .so(), .d(esr_mac_rxd[9 ]), .l1clk(rbc0_a), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_8  ( .q(xrx_code_group[8 ]), .so(), .d(esr_mac_rxd[8 ]), .l1clk(rbc0_a), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_7  ( .q(xrx_code_group[7 ]), .so(), .d(esr_mac_rxd[7 ]), .l1clk(rbc0_a), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_6  ( .q(xrx_code_group[6 ]), .so(), .d(esr_mac_rxd[6 ]), .l1clk(rbc0_a), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_5  ( .q(xrx_code_group[5 ]), .so(), .d(esr_mac_rxd[5 ]), .l1clk(rbc0_a), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_4  ( .q(xrx_code_group[4 ]), .so(), .d(esr_mac_rxd[4 ]), .l1clk(rbc0_a), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_3  ( .q(xrx_code_group[3 ]), .so(), .d(esr_mac_rxd[3 ]), .l1clk(rbc0_a), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_2  ( .q(xrx_code_group[2 ]), .so(), .d(esr_mac_rxd[2 ]), .l1clk(rbc0_a), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_1  ( .q(xrx_code_group[1 ]), .so(), .d(esr_mac_rxd[1 ]), .l1clk(rbc0_a), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x xrx_alatch_0  ( .q(xrx_code_group[0 ]), .so(), .d(esr_mac_rxd[0 ]), .l1clk(rbc0_a), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );

// pcs
cl_a1_alatch_4x  rx_alatch_9  ( .q( rx_code_group[9 ]), .so(), .d(esr_mac_rxd[9 ]), .l1clk(rx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x  rx_alatch_8  ( .q( rx_code_group[8 ]), .so(), .d(esr_mac_rxd[8 ]), .l1clk(rx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x  rx_alatch_7  ( .q( rx_code_group[7 ]), .so(), .d(esr_mac_rxd[7 ]), .l1clk(rx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x  rx_alatch_6  ( .q( rx_code_group[6 ]), .so(), .d(esr_mac_rxd[6 ]), .l1clk(rx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x  rx_alatch_5  ( .q( rx_code_group[5 ]), .so(), .d(esr_mac_rxd[5 ]), .l1clk(rx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x  rx_alatch_4  ( .q( rx_code_group[4 ]), .so(), .d(esr_mac_rxd[4 ]), .l1clk(rx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x  rx_alatch_3  ( .q( rx_code_group[3 ]), .so(), .d(esr_mac_rxd[3 ]), .l1clk(rx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x  rx_alatch_2  ( .q( rx_code_group[2 ]), .so(), .d(esr_mac_rxd[2 ]), .l1clk(rx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x  rx_alatch_1  ( .q( rx_code_group[1 ]), .so(), .d(esr_mac_rxd[1 ]), .l1clk(rx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );
cl_a1_alatch_4x  rx_alatch_0  ( .q( rx_code_group[0 ]), .so(), .d(esr_mac_rxd[0 ]), .l1clk(rx_nbclk), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .se(tcu_scan_en) );

// vlint flag_null_instance_port on
// vlint flag_unmatched_port_connect_in_inst on


endmodule // n2_rxd_alatch

