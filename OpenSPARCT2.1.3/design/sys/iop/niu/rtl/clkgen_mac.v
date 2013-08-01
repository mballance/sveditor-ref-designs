// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: clkgen_mac.v
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
/////////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2003 by Sun Microsystems, Inc.
//
//  All rights reserved. No part of this design may be reproduced,
//  stored in a retrieval system, or transmitted, in any form or by
//  any means, electronic, mechanical, photocopying, recording, or
//  otherwise, without prior written permission of Sun Microsystems,
//  Inc.
//
//  Sun Proprietary/Confidential
//
//  Filename:	   clkgen_mac.v
//  Description:   Wrapper around clkgen_mac_io which
//                 provides l2clks locally within clusters.
//		   Services the IO domain of N2 MAC cluster.
//
//  Primary Contact:	carlos.castil@sun.com / john.lo@sun.com
//
//  Revision History
//  Feb 23,05	carlos.castil	First Draft
//
//  Mar 11,05   carlos.castil   Removed IO_CLK_EXT
//                              Changed input name IO_CLK to gclk 
//                              Changed input name tcu_sel_ext_clk to tcu_div_bypass 
//                              Added scan ports scan_in, scan_out and tcu_scan_en
/////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ns

module clkgen_mac (
	niu_clk,
	aclk,
	bclk,
        niu_reset_l,
	pce_ov,

	tcu_pce_ov,
	tcu_div_bypass,
	tcu_scan_en,

	gl_mac_io_clk_stop,
	gl_mac_io_out,
        gl_mac_,

        tcu_scan_mode,
        tcu_atpg_mode,
        tcu_wr_inhibit,

        tcu_clk_stop,

	cluster_arst_l,

	cmp_gclk_c1_mac,

	tcu_aclk,
	tcu_bclk,

        scan_in,
        scan_out
);

// **************************
// port declaration
// **************************

// clock outputs
output	niu_clk;      // Clock to core logic is output of L1 header
output	aclk;	    // buffered version of aclk
output	bclk;	    // buffered version of bclk

// test signal outputs
output  scan_out;
output  pce_ov;     // buffered version of pce_ov

output  tcu_clk_stop;

// reset output
output  niu_reset_l;

// test inputs
input	tcu_pce_ov;
input   tcu_div_bypass; // bypasses clk divider to mux in ext clk
input   tcu_scan_en;
input   gl_mac_io_clk_stop;
input   scan_in;
input   tcu_wr_inhibit;
input   tcu_atpg_mode;
input   tcu_scan_mode;

// inputs from ccu 
input   gl_mac_io_out;     // phase signal from ccu (div/4 or div/2)

// clock inputs
input	cmp_gclk_c1_mac;		// global clk - this is either cmp or dr
input	tcu_aclk;
input	tcu_bclk;

// reset
input   cluster_arst_l;
input   gl_mac_;


wire pce_ov;
wire wmr_protect;
wire wmr_;
wire niu_reset_l;
wire cmp_slow_sync_en;
wire slow_cmp_sync_en;
wire aclk_wmr;
wire iol2clk;
wire array_wr_inhibit_wire;

assign tcu_clk_stop =  tcu_atpg_mode ? 1'b0 : gl_mac_io_clk_stop; 

cl_a1_l1hdr_8x io_l1hdr (
	                 .l2clk	 (iol2clk),
		         .se	 (tcu_scan_en),
		         .pce	 (1'b1),
		         .pce_ov (pce_ov),
		         .stop	 (1'b0),
		         .l1clk	 (niu_clk)
		        );


clkgen_mac_io clkgen_mac_io (
	.l2clk                 (iol2clk),    // outputs
	.aclk                  (aclk),
	.bclk                  (bclk),
	.scan_out              (scan_out),
	.pce_ov                (pce_ov),
	.aclk_wmr              (aclk_wmr),
	.wmr_protect           (wmr_protect),
	.wmr_                  (wmr_),
	.por_                  (niu_reset_l),
	.cmp_slow_sync_en      (cmp_slow_sync_en),
	.slow_cmp_sync_en      (slow_cmp_sync_en),

//      .tcu_clk_stop          (gl_mac_io_clk_stop),  // inputs
        .tcu_clk_stop	       (tcu_clk_stop),
	.tcu_pce_ov            (tcu_pce_ov),

	.rst_wmr_protect       (1'b0),
	.rst_wmr_              (1'b1),

	.rst_por_              (gl_mac_),

        .array_wr_inhibit      (array_wr_inhibit_wire),

	.ccu_cmp_slow_sync_en  (1'b0 & array_wr_inhibit_wire & aclk_wmr & tcu_scan_mode),
	.ccu_slow_cmp_sync_en  (1'b0 & cmp_slow_sync_en & slow_cmp_sync_en & tcu_scan_mode),

	.tcu_div_bypass        (tcu_div_bypass),
	.ccu_div_ph            (gl_mac_io_out),

        .tcu_atpg_mode         (tcu_atpg_mode),
        .tcu_wr_inhibit        (tcu_wr_inhibit),

	.cluster_div_en        (1'b1),

	.gclk                  (cmp_gclk_c1_mac),
	.clk_ext               (1'b0),

	.cluster_arst_l        (cluster_arst_l),  // new
	.ccu_serdes_dtm        (1'b0),  // new

	.tcu_aclk              (tcu_aclk),
	.tcu_bclk              (tcu_bclk),

	.scan_en               (tcu_scan_en), 
	.scan_in               (scan_in)
);


endmodule // clkgen_mac
