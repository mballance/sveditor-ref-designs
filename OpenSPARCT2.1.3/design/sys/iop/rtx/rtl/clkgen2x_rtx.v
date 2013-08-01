// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: clkgen2x_rtx.v
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
//  Filename:	   clkgen2x_rtx.v
//  Description:   Wrapper around clkgen_rtx_io2x which
//                 provides l2clks locally within clusters.
//
//  Primary Contact:	binh.pham@sun.com 
//
//  Revision History
//
/////////////////////////////////////////////////////////////////////////////////////
// `timescale 1ns/1ns

module clkgen2x_rtx (
        l1clk,
        aclk,
        bclk,
        scan_out,
        pce_ov,
        aclk_wmr,
        wmr_protect,
        wmr_,
        por_,
        cmp_slow_sync_en,
        slow_cmp_sync_en,
        tcu_clk_stop,
        tcu_pce_ov,
        rst_wmr_protect,
        rst_wmr_,
        rst_por_,
        ccu_cmp_slow_sync_en,
        ccu_slow_cmp_sync_en,
        tcu_div_bypass,
        ccu_div_ph,
        cluster_div_en,
        gclk,
        cluster_arst_l,
        clk_ext,
        ccu_serdes_dtm,
        tcu_aclk,
        tcu_bclk,
        scan_en,
        scan_in

);

// **************************
// port declaration
// **************************

// clock & test out
output  l1clk;  
output  aclk;   
output  bclk;   
output  scan_out;               
output  aclk_wmr;

// pipelined out
output  pce_ov;                         
output  wmr_protect;            
output  wmr_;                  
output  por_;                           
output  cmp_slow_sync_en;       
output  slow_cmp_sync_en;       

// ctrl in (for pipelining)
input   tcu_clk_stop;
input   tcu_pce_ov;
input   rst_wmr_protect;
input   rst_wmr_;
input   rst_por_;
input   ccu_cmp_slow_sync_en;
input   ccu_slow_cmp_sync_en;

input   tcu_div_bypass;         
input   ccu_div_ph;            
input   cluster_div_en;       

// clock & test in
input   gclk;                
input   cluster_arst_l;
input   ccu_serdes_dtm;
input   clk_ext;            
input   scan_en;           
input   scan_in;          
input   tcu_aclk;
input   tcu_bclk;

wire    io2xl2clk;

cl_a1_l1hdr_8x io_l1hdr (
	.l2clk  (io2xl2clk),
	.se     (scan_en),
	.pce    (1'b1),
	.pce_ov (pce_ov),
	.stop   (tcu_clk_stop),
	.l1clk  (l1clk)
);

clkgen_rtx_io2x clkgen_rtx_io2x (
	.l2clk                 (io2xl2clk),    // outputs
	.aclk                  (aclk),
	.bclk                  (bclk),
	.scan_out              (scan_out),
        .aclk_wmr              (aclk_wmr),
	.pce_ov                (pce_ov),
	.wmr_protect           (wmr_protect),
	.wmr_                  (wmr_),
	.por_                  (por_),
	.cmp_slow_sync_en      (cmp_slow_sync_en),
	.slow_cmp_sync_en      (slow_cmp_sync_en),
	.tcu_clk_stop          (tcu_clk_stop),   // inputs
	.tcu_pce_ov            (tcu_pce_ov),
	.rst_wmr_protect       (rst_wmr_protect),
	.rst_wmr_              (rst_wmr_),
	.rst_por_              (rst_por_),
	.ccu_cmp_slow_sync_en  (ccu_cmp_slow_sync_en),
	.ccu_slow_cmp_sync_en  (ccu_slow_cmp_sync_en),
	.tcu_div_bypass        (tcu_div_bypass),
	.ccu_div_ph            (ccu_div_ph),
	.cluster_div_en        (cluster_div_en),
	.gclk                  (gclk),
        .cluster_arst_l        (cluster_arst_l),
        .ccu_serdes_dtm        (ccu_serdes_dtm),
	.clk_ext               (clk_ext),
	.scan_en               (scan_en), 
	.scan_in               (scan_in),
	.tcu_aclk              (tcu_aclk),
	.tcu_bclk              (tcu_bclk)
);


endmodule // clkgen2x_rtx

