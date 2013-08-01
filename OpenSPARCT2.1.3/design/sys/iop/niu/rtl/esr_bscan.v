// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: esr_bscan.v
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
////////////////////////////////////////////////////////////////////////////
//
//
//    Released:           1/16/05
//    Contacts:           john.lo@sun.com / carlos.castil@sun.com
//    Description:        Boundary scan logic for N2 MAC Serdes 
//    Block Type:         Boundary Scan
//    Chip Name:          
//    Unit Name:         
//    Module:            
//    Where Instantiated: 
//
//
//  (c) 2005 Sun Microsystems, Inc.
//      Sun Proprietary/Confidential
//      Internal use only.
//
//  All rights reserved. No part of this design may be reproduced stored
//  in a retrieval system, or transmitted, in any form or by any means,
//  electronic, mechanical, photocopying, recording, or otherwise, without
//  prior written permission of Sun Microsystems, Inc.
//
///////////////////////////////////////////////////////////////////////////////


module esr_bscan ( 
                  peu_mac_sbs_input,
                  mac_mcu_3_sbs_output,

                  tcu_sbs_scan_en,
                  tcu_sbs_aclk,
                  tcu_sbs_bclk,
                  tcu_sbs_clk,
                  tcu_sbs_uclk,

                  tcu_sbs_acmode,
                  tcu_sbs_actestsignal,

                  // from hedwig.v
	          BSRXP0_0,
	          BSRXP1_0,
	          BSRXP2_0,
	          BSRXP3_0,
	          BSRXN0_0,
	          BSRXN1_0,
	          BSRXN2_0,
	          BSRXN3_0,
	          BSRXP0_1,
	          BSRXP1_1,
	          BSRXP2_1,
	          BSRXP3_1,
	          BSRXN0_1,
	          BSRXN1_1,
	          BSRXN2_1,
	          BSRXN3_1,

                  cfgtx0_0_17,    // to hedwig
                  cfgtx1_0_17,    // to hedwig
                  cfgtx2_0_17,    // to hedwig
                  cfgtx3_0_17,    // to hedwig

                  cfgtx0_1_17,    // to hedwig
                  cfgtx1_1_17,    // to hedwig
                  cfgtx2_1_17,    // to hedwig
                  cfgtx3_1_17,    // to hedwig

                  cfgrx0_0_b25_b24, // to hedwig
                  cfgrx1_0_b25_b24, // to hedwig
                  cfgrx2_0_b25_b24, // to hedwig
                  cfgrx3_0_b25_b24, // to hedwig

                  cfgrx0_1_b25_b24, // to hedwig
                  cfgrx1_1_b25_b24, // to hedwig
                  cfgrx2_1_b25_b24, // to hedwig
                  cfgrx3_1_b25_b24  // to hedwig
);


   input   peu_mac_sbs_input;
   output  mac_mcu_3_sbs_output;

   input  tcu_sbs_scan_en;     // from tcu
   input  tcu_sbs_aclk;        // from tcu
   input  tcu_sbs_bclk;        // from tcu
   input  tcu_sbs_clk;         // from tcu
   input  tcu_sbs_uclk;        // from tcu

   input  tcu_sbs_acmode;       // from tcu
   input  tcu_sbs_actestsignal; // from tcu

                                   // to esr_bscan.v
   input 			  BSRXP0_0;
   input 			  BSRXP1_0;
   input 			  BSRXP2_0;
   input 			  BSRXP3_0;
   input 			  BSRXN0_0;
   input 			  BSRXN1_0;
   input 			  BSRXN2_0;
   input 			  BSRXN3_0;
   input 			  BSRXP0_1;
   input 			  BSRXP1_1;
   input 			  BSRXP2_1;
   input 			  BSRXP3_1;
   input 			  BSRXN0_1;
   input 			  BSRXN1_1;
   input 			  BSRXN2_1;
   input 			  BSRXN3_1;

   output                         cfgtx0_0_17;      // to hedwig
   output                         cfgtx1_0_17;      // to hedwig
   output                         cfgtx2_0_17;      // to hedwig
   output                         cfgtx3_0_17;      // to hedwig

   output                         cfgtx0_1_17;      // to hedwig
   output                         cfgtx1_1_17;      // to hedwig
   output                         cfgtx2_1_17;      // to hedwig
   output                         cfgtx3_1_17;      // to hedwig

   output    [1:0]                cfgrx0_0_b25_b24; // to hedwig
   output    [1:0]                cfgrx1_0_b25_b24; // to hedwig
   output    [1:0]                cfgrx2_0_b25_b24; // to hedwig
   output    [1:0]                cfgrx3_0_b25_b24; // to hedwig

   output    [1:0]                cfgrx0_1_b25_b24; // to hedwig
   output    [1:0]                cfgrx1_1_b25_b24; // to hedwig
   output    [1:0]                cfgrx2_1_b25_b24; // to hedwig
   output    [1:0]                cfgrx3_1_b25_b24; // to hedwig

wire siclk;
wire soclk;
wire l1clk;

wire bs_tx_0_0;
wire bs_rxp_0_0;
wire bs_rxn_0_0;

wire bs_tx_1_0;
wire bs_rxp_1_0;
wire bs_rxn_1_0;

wire bs_tx_2_0;
wire bs_rxp_2_0;
wire bs_rxn_2_0;

wire bs_tx_3_0;
wire bs_rxp_3_0;
wire bs_rxn_3_0;

wire bs_tx_0_1;
wire bs_rxp_0_1;
wire bs_rxn_0_1;

wire bs_tx_1_1;
wire bs_rxp_1_1;
wire bs_rxn_1_1;

wire bs_tx_2_1;
wire bs_rxp_2_1;
wire bs_rxn_2_1;

wire bs_tx_3_1;
wire bs_rxp_3_1;
wire bs_rxn_3_1;

// According to Sungabe's spec, the following signals are required to float.
// vlint flag_net_has_no_load            off
// vlint flag_dangling_net_within_module off
wire float0;
wire float1;
wire float2;
wire float3;
wire float4;
wire float5;
wire float6;
wire float7;
wire float8;
wire float9;
wire float10;
wire float11;
wire float12;
wire float13;
wire float14;
wire float15;
// vlint flag_net_has_no_load            on
// vlint flag_dangling_net_within_module on


// /////////////////////////////////////////////////////////////////////////////
// Scan Renames
// /////////////////////////////////////////////////////////////////////////////

assign siclk  = tcu_sbs_aclk;
assign soclk  = tcu_sbs_bclk;

////////////////////////////////////////////////////////////////////////////////
// Clock header
// /////////////////////////////////////////////////////////////////////////////

cl_a1_l1hdr_8x clkgen (

   .l2clk    (tcu_sbs_clk),
   .pce      (1'b1),
   .l1clk    (l1clk),
   .se       (tcu_sbs_scan_en),
   .pce_ov   (1'b1),
   .stop     (1'b0)
);

// /////////////////////////////////////////////////////////////////////////////
// Boundary Scan Initialization per IEEE 1149.6
// /////////////////////////////////////////////////////////////////////////////

assign cfgrx0_0_b25_b24 = {bs_rxn_0_0,bs_rxp_0_0};
assign cfgrx1_0_b25_b24 = {bs_rxn_1_0,bs_rxp_1_0};
assign cfgrx2_0_b25_b24 = {bs_rxn_2_0,bs_rxp_2_0};
assign cfgrx3_0_b25_b24 = {bs_rxn_3_0,bs_rxp_3_0};

assign cfgrx0_1_b25_b24 = {bs_rxn_0_1,bs_rxp_0_1};
assign cfgrx1_1_b25_b24 = {bs_rxn_1_1,bs_rxp_1_1};
assign cfgrx2_1_b25_b24 = {bs_rxn_2_1,bs_rxp_2_1};
assign cfgrx3_1_b25_b24 = {bs_rxn_3_1,bs_rxp_3_1};

// /////////////////////////////////////////////////////////////////////////////
// Boundary Scan Output 
// /////////////////////////////////////////////////////////////////////////////

assign mac_mcu_3_sbs_output = bs_rxn_3_1;

// /////////////////////////////////////////////////////////////////////////////
// Port 0 Channel 0 Boundary scan cells 
// /////////////////////////////////////////////////////////////////////////////


cl_a1_bsac_cell_4x inst_bstx_0_0 ( 
                              .q         (cfgtx0_0_17), 
                              .so        (bs_tx_0_0), 
                              .d         (1'b0), 
                              .l1clk     (1'b1), 
                              .si        (peu_mac_sbs_input), 
                              .siclk     (siclk), 
                              .soclk     (soclk), 
                              .updateclk (tcu_sbs_uclk),
                              .ac_mode   (tcu_sbs_acmode),
                              .ac_test_signal (tcu_sbs_actestsignal) );

// vlint flag_null_instance_port off
cl_a1_msffjtag_4x inst_bsrxp_0_0 (
                              .q	 (float0),
                              .so	 (bs_rxp_0_0),
                              .d	 (BSRXP0_0),
                              .l1clk	 (l1clk),
                              .si	 (bs_tx_0_0),
                              .siclk	 (siclk),
                              .soclk	 (soclk),
                              .reset	 (1'b0),
                              .updateclk (tcu_sbs_uclk) );
// vlint flag_null_instance_port on
   
// vlint flag_null_instance_port off
cl_a1_msffjtag_4x inst_bsrxn_0_0 (
                              .q	 (float1),
                              .so	 (bs_rxn_0_0),
                              .d	 (BSRXN0_0),
                              .l1clk	 (l1clk),
                              .si	 (bs_rxp_0_0),
                              .siclk	 (siclk),
                              .soclk	 (soclk),
                              .reset	 (1'b0),
                              .updateclk (tcu_sbs_uclk) );
// vlint flag_null_instance_port on

// /////////////////////////////////////////////////////////////////////////////
// Port 0 Channel 1 Boundary scan cells
// /////////////////////////////////////////////////////////////////////////////

cl_a1_bsac_cell_4x inst_bstx_1_0 (
                              .q         (cfgtx1_0_17),
                              .so        (bs_tx_1_0),
                              .d         (1'b0),
                              .l1clk     (1'b1),
                              .si        (bs_rxn_0_0),
                              .siclk     (siclk),
                              .soclk     (soclk),
                              .updateclk (tcu_sbs_uclk),
                              .ac_mode   (tcu_sbs_acmode),
                              .ac_test_signal (tcu_sbs_actestsignal) );

// vlint flag_null_instance_port off
cl_a1_msffjtag_4x inst_bsrxp_1_0 (
                              .q         (float2),
                              .so        (bs_rxp_1_0),
                              .d         (BSRXP1_0),
                              .l1clk     (l1clk),
                              .si        (bs_tx_1_0),
                              .siclk     (siclk),
                              .soclk     (soclk),
                              .reset     (1'b0),
                              .updateclk (tcu_sbs_uclk) );
// vlint flag_null_instance_port on
   
// vlint flag_null_instance_port off
cl_a1_msffjtag_4x inst_bsrxn_1_0 (
                              .q         (float3),
                              .so        (bs_rxn_1_0),
                              .d         (BSRXN1_0),
                              .l1clk     (l1clk),
                              .si        (bs_rxp_1_0),
                              .siclk     (siclk),
                              .soclk     (soclk),
                              .reset     (1'b0),
                              .updateclk (tcu_sbs_uclk) );
// vlint flag_null_instance_port on
   
// /////////////////////////////////////////////////////////////////////////////
// Port 0 Channel 2 Boundary scan cells
// /////////////////////////////////////////////////////////////////////////////

cl_a1_bsac_cell_4x inst_bstx_2_0 (
                              .q         (cfgtx2_0_17),
                              .so        (bs_tx_2_0),
                              .d         (1'b0),
                              .l1clk     (1'b1),
                              .si        (bs_rxn_1_0),
                              .siclk     (siclk),
                              .soclk     (soclk),
                              .updateclk (tcu_sbs_uclk),
                              .ac_mode   (tcu_sbs_acmode),
                              .ac_test_signal (tcu_sbs_actestsignal) );

// vlint flag_null_instance_port off
cl_a1_msffjtag_4x inst_bsrxp_2_0 (
                              .q         (float4),
                              .so        (bs_rxp_2_0),
                              .d         (BSRXP2_0),
                              .l1clk     (l1clk),
                              .si        (bs_tx_2_0),
                              .siclk     (siclk),
                              .soclk     (soclk),
                              .reset     (1'b0),
                              .updateclk (tcu_sbs_uclk) );
// vlint flag_null_instance_port on
   
// vlint flag_null_instance_port off
cl_a1_msffjtag_4x inst_bsrxn_2_0 (
                              .q         (float5),
                              .so        (bs_rxn_2_0),
                              .d         (BSRXN2_0),
                              .l1clk     (l1clk),
                              .si        (bs_rxp_2_0),
                              .siclk     (siclk),
                              .soclk     (soclk),
                              .reset     (1'b0),
                              .updateclk (tcu_sbs_uclk) );
// vlint flag_null_instance_port on
   

// /////////////////////////////////////////////////////////////////////////////
// Port 0 Channel 3 Boundary scan cells
// /////////////////////////////////////////////////////////////////////////////

cl_a1_bsac_cell_4x inst_bstx_3_0 (
                              .q         (cfgtx3_0_17),
                              .so        (bs_tx_3_0),
                              .d         (1'b0),
                              .l1clk     (1'b1),
                              .si        (bs_rxn_2_0),
                              .siclk     (siclk),
                              .soclk     (soclk),
                              .updateclk (tcu_sbs_uclk),
                              .ac_mode   (tcu_sbs_acmode),
                              .ac_test_signal (tcu_sbs_actestsignal) );

// vlint flag_null_instance_port off
cl_a1_msffjtag_4x inst_bsrxp_3_0 (
                              .q         (float6),
                              .so        (bs_rxp_3_0),
                              .d         (BSRXP3_0),
                              .l1clk     (l1clk),
                              .si        (bs_tx_3_0),
                              .siclk     (siclk),
                              .soclk     (soclk),
                              .reset     (1'b0),
                              .updateclk (tcu_sbs_uclk) );
// vlint flag_null_instance_port on
   
// vlint flag_null_instance_port off
cl_a1_msffjtag_4x inst_bsrxn_3_0 (
                              .q         (float7),
                              .so        (bs_rxn_3_0),
                              .d         (BSRXN3_0),
                              .l1clk     (l1clk),
                              .si        (bs_rxp_3_0),
                              .siclk     (siclk),
                              .soclk     (soclk),
                              .reset     (1'b0),
                              .updateclk (tcu_sbs_uclk) );
// vlint flag_null_instance_port on
   
// /////////////////////////////////////////////////////////////////////////////
// Port 1 Channel 0 Boundary scan cells 
// /////////////////////////////////////////////////////////////////////////////


cl_a1_bsac_cell_4x inst_bstx_0_1 ( 
                              .q         (cfgtx0_1_17), 
                              .so        (bs_tx_0_1), 
                              .d         (1'b0), 
                              .l1clk     (1'b1), 
                              .si        (bs_rxn_3_0), 
                              .siclk     (siclk), 
                              .soclk     (soclk), 
                              .updateclk (tcu_sbs_uclk),
                              .ac_mode   (tcu_sbs_acmode),
                              .ac_test_signal (tcu_sbs_actestsignal) );

// vlint flag_null_instance_port off
cl_a1_msffjtag_4x inst_bsrxp_0_1 (
                              .q	 (float8),
                              .so	 (bs_rxp_0_1),
                              .d	 (BSRXP0_1),
                              .l1clk	 (l1clk),
                              .si	 (bs_tx_0_1),
                              .siclk	 (siclk),
                              .soclk	 (soclk),
                              .reset	 (1'b0),
                              .updateclk (tcu_sbs_uclk) );
// vlint flag_null_instance_port on
   
// vlint flag_null_instance_port off
cl_a1_msffjtag_4x inst_bsrxn_0_1 (
                              .q	 (float9),
                              .so	 (bs_rxn_0_1),
                              .d	 (BSRXN0_1),
                              .l1clk	 (l1clk),
                              .si	 (bs_rxp_0_1),
                              .siclk	 (siclk),
                              .soclk	 (soclk),
                              .reset	 (1'b0),
                              .updateclk (tcu_sbs_uclk) );
// vlint flag_null_instance_port on
   

// /////////////////////////////////////////////////////////////////////////////
// Port 1 Channel 1 Boundary scan cells
// /////////////////////////////////////////////////////////////////////////////

cl_a1_bsac_cell_4x inst_bstx_1_1 (
                              .q         (cfgtx1_1_17),
                              .so        (bs_tx_1_1),
                              .d         (1'b0),
                              .l1clk     (1'b1),
                              .si        (bs_rxn_0_1),
                              .siclk     (siclk),
                              .soclk     (soclk),
                              .updateclk (tcu_sbs_uclk),
                              .ac_mode   (tcu_sbs_acmode),
                              .ac_test_signal (tcu_sbs_actestsignal) );

// vlint flag_null_instance_port off
cl_a1_msffjtag_4x inst_bsrxp_1_1 (
                              .q         (float10),
                              .so        (bs_rxp_1_1),
                              .d         (BSRXP1_1),
                              .l1clk     (l1clk),
                              .si        (bs_tx_1_1),
                              .siclk     (siclk),
                              .soclk     (soclk),
                              .reset     (1'b0),
                              .updateclk (tcu_sbs_uclk) );
// vlint flag_null_instance_port on
   
// vlint flag_null_instance_port off
cl_a1_msffjtag_4x inst_bsrxn_1_1 (
                              .q         (float11),
                              .so        (bs_rxn_1_1),
                              .d         (BSRXN1_1),
                              .l1clk     (l1clk),
                              .si        (bs_rxp_1_1),
                              .siclk     (siclk),
                              .soclk     (soclk),
                              .reset     (1'b0),
                              .updateclk (tcu_sbs_uclk) );
// vlint flag_null_instance_port on
   
// /////////////////////////////////////////////////////////////////////////////
// Port 1 Channel 2 Boundary scan cells
// /////////////////////////////////////////////////////////////////////////////

cl_a1_bsac_cell_4x inst_bstx_2_1 (
                              .q         (cfgtx2_1_17),
                              .so        (bs_tx_2_1),
                              .d         (1'b0),
                              .l1clk     (1'b1),
                              .si        (bs_rxn_1_1),
                              .siclk     (siclk),
                              .soclk     (soclk),
                              .updateclk (tcu_sbs_uclk),
                              .ac_mode   (tcu_sbs_acmode),
                              .ac_test_signal (tcu_sbs_actestsignal) );

// vlint flag_null_instance_port off
cl_a1_msffjtag_4x inst_bsrxp_2_1 (
                              .q         (float12),
                              .so        (bs_rxp_2_1),
                              .d         (BSRXP2_1),
                              .l1clk     (l1clk),
                              .si        (bs_tx_2_1),
                              .siclk     (siclk),
                              .soclk     (soclk),
                              .reset     (1'b0),
                              .updateclk (tcu_sbs_uclk) );
// vlint flag_null_instance_port on
   
// vlint flag_null_instance_port off
cl_a1_msffjtag_4x inst_bsrxn_2_1 (
                              .q         (float13),
                              .so        (bs_rxn_2_1),
                              .d         (BSRXN2_1),
                              .l1clk     (l1clk),
                              .si        (bs_rxp_2_1),
                              .siclk     (siclk),
                              .soclk     (soclk),
                              .reset     (1'b0),
                              .updateclk (tcu_sbs_uclk) );
// vlint flag_null_instance_port on
   

// /////////////////////////////////////////////////////////////////////////////
// Port 1 Channel 3 Boundary scan cells
// /////////////////////////////////////////////////////////////////////////////

cl_a1_bsac_cell_4x inst_bstx_3_1 (
                              .q         (cfgtx3_1_17),
                              .so        (bs_tx_3_1),
                              .d         (1'b0),
                              .l1clk     (1'b1),
                              .si        (bs_rxn_2_1),
                              .siclk     (siclk),
                              .soclk     (soclk),
                              .updateclk (tcu_sbs_uclk),
                              .ac_mode   (tcu_sbs_acmode),
                              .ac_test_signal (tcu_sbs_actestsignal) );

// vlint flag_null_instance_port off
cl_a1_msffjtag_4x inst_bsrxp_3_1 (
                              .q         (float14),
                              .so        (bs_rxp_3_1),
                              .d         (BSRXP3_1),
                              .l1clk     (l1clk),
                              .si        (bs_tx_3_1),
                              .siclk     (siclk),
                              .soclk     (soclk),
                              .reset     (1'b0),
                              .updateclk (tcu_sbs_uclk) );
// vlint flag_null_instance_port on
   
// vlint flag_null_instance_port off
cl_a1_msffjtag_4x inst_bsrxn_3_1 (
                              .q         (float15),
                              .so        (bs_rxn_3_1),
                              .d         (BSRXN3_1),
                              .l1clk     (l1clk),
                              .si        (bs_rxp_3_1),
                              .siclk     (siclk),
                              .soclk     (soclk),
                              .reset     (1'b0),
                              .updateclk (tcu_sbs_uclk) );
// vlint flag_null_instance_port on



endmodule // esr_bscan

