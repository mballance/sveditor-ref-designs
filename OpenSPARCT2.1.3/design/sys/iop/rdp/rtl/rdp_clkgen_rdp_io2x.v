// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rdp_clkgen_rdp_io2x.v
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
///////////////////////////
//	This file is a wrapper instantiating the cluster
//	headers and 1 l1clk header
////////////////////////////////
module rdp_clkgen_rdp_io2x (
	array_wr_inhibit,
	tcu_atpg_mode,
	tcu_wr_inhibit,

	io2xl2clk,
	aclk,
	bclk,
	scan_out,
	aclk_wmr,
	pce_ov,
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
	cluster_arst_l,		// New 
	ccu_cmp_slow_sync_en,
	ccu_slow_cmp_sync_en,
	// ccu_serdes_dtm,
	tcu_div_bypass,
	ccu_div_ph,
	cluster_div_en,
	gclk,
	// clk_ext,
	tcu_aclk,
	tcu_bclk,
	tcu_scan_en,
	scan_in
);

// **************************
// port declaration
// **************************

// clock & test out
output	io2xl2clk;	// assume we do not need aclk, bclk outputs
output	aclk;	// buffered version of aclk
output	bclk;	// buffered version of bclk
output	scan_out;	// unused as of today - feb 10, 05

// pipelined out
output	aclk_wmr;			// New
output	pce_ov;				// pce override to l1 header
output	wmr_protect;		// warm reset protect
output	wmr_;				// warm reset (active low)
output	por_;				// power-on-reset
output	cmp_slow_sync_en;	// cmp->slow clk sync pulse
output	slow_cmp_sync_en;	// slow->cmp clk sync pulse

// ctrl in (for pipelining)
output	array_wr_inhibit;	// New
input	tcu_atpg_mode;		// New
input	tcu_wr_inhibit;		// New
input	tcu_clk_stop;
input	tcu_pce_ov;
input	rst_wmr_protect;
input	rst_wmr_;
input	rst_por_;
input	cluster_arst_l;	
input	ccu_cmp_slow_sync_en;
input	ccu_slow_cmp_sync_en;
// input	ccu_serdes_dtm;

// ctrl in (for clock gen)
input	tcu_div_bypass;		// bypasses clk divider to mux in ext clk
input	ccu_div_ph;			// phase signal from ccu (div/4 or div/2)
input	cluster_div_en;		// if enabled, l2clk is divided down

// clock & test in
input	gclk;			// global clk - this is either cmp or dr
// input	clk_ext;		// external clk muxed in for ioclk bypass
input	tcu_scan_en;		// unused as of today - feb 10, 05
input	scan_in;		// unused as of today - feb 10, 05
input	tcu_aclk;
input	tcu_bclk;

// **************************
// wire declaration
// **************************
//wire	l2clk;
wire	aclk;
wire	bclk;
wire	scan_out;
wire	aclk_wmr;
wire	pce_ov;
wire	wmr_protect;
wire	wmr_;
wire	por_;
wire	cmp_slow_sync_en;
wire	slow_cmp_sync_en;
wire	tcu_clk_stop;
wire	tcu_pce_ov;
wire	rst_wmr_protect;
wire	rst_wmr_;
wire	rst_por_;
wire	cluster_arst_l;
wire	ccu_cmp_slow_sync_en;
wire	ccu_slow_cmp_sync_en;
// wire	ccu_serdes_dtm;
wire	tcu_div_bypass;
wire	ccu_div_ph;
wire	cluster_div_en;
wire	gclk;
// wire	clk_ext;
wire	tcu_scan_en;				// tie-low, unused as of today - feb 10, 05
wire	scan_in;				// tie-low, unused as of today - feb 10, 05
wire	tcu_aclk;
wire	tcu_bclk;
wire	io2xl2clk;

////////////////////////////////////
// cluster Header
////////////////////////////////////

clkgen_rdp_io2x clkgen_rdp_io2x (
    .array_wr_inhibit	  (array_wr_inhibit),
    .tcu_atpg_mode	  (tcu_atpg_mode),
    .tcu_wr_inhibit       (tcu_wr_inhibit),

    .l2clk		  (io2xl2clk),
    .aclk		  (aclk),
    .bclk		  (bclk),
    .scan_out		  (scan_out),
    .aclk_wmr		  (aclk_wmr),
    .pce_ov		  (pce_ov),
    .wmr_protect	  (wmr_protect),
    .wmr_		  (wmr_),
    .por_		  (por_),
    .cmp_slow_sync_en	  (cmp_slow_sync_en),
    .slow_cmp_sync_en	  (slow_cmp_sync_en),
    .tcu_clk_stop	  (tcu_clk_stop),
    .tcu_pce_ov		  (tcu_pce_ov),
    .rst_wmr_protect	  (rst_wmr_protect),
    .rst_wmr_		  (rst_wmr_),
    .rst_por_		  (rst_por_),
    .cluster_arst_l	  (cluster_arst_l),
    .ccu_cmp_slow_sync_en (ccu_cmp_slow_sync_en),
    .ccu_slow_cmp_sync_en (ccu_slow_cmp_sync_en),
    .ccu_serdes_dtm	  (1'b0),
    .tcu_div_bypass	  (tcu_div_bypass),
    .ccu_div_ph		  (ccu_div_ph),
    .cluster_div_en	  (cluster_div_en),
    .gclk		  (gclk),
    .clk_ext		  (1'b0),
    .scan_en		  (tcu_scan_en),
    .scan_in		  (scan_in),
    .tcu_aclk		  (tcu_aclk),
    .tcu_bclk		  (tcu_bclk)
    );

////////////////////////////////////
// l1clk Header
/////////////////////////////////////
//cl_a1_l1hdr_12x iol2clk_cl_a1_l1hdr_12x	(
	//.l2clk	(io2xl2clk),
	//.se	(tcu_scan_en),
	//.pce    (1'b1),
        //.pce_ov	(pce_ov),
	//.stop   (tcu_clk_stop),
	//.l1clk  (l2clk)
		//);

endmodule
