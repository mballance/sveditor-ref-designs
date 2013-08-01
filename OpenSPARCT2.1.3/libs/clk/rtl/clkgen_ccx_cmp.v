// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: clkgen_ccx_cmp.v
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
`ifndef FPGA
module clkgen_ccx_cmp ( 
	array_wr_inhibit,
	tcu_atpg_mode,
	tcu_wr_inhibit,
	l2clk,
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
	tcu_clk_stop_left,
	tcu_clk_stop_right,
	tcu_pce_ov,
	rst_wmr_protect,
	rst_wmr_,
	rst_por_,
	ccu_cmp_slow_sync_en,
	ccu_slow_cmp_sync_en,
	tcu_div_bypass_left,
	tcu_div_bypass_right,
	ccu_div_ph,
	cluster_div_en,
	gclk_left,
	gclk_right,
	cluster_arst_l_left,
	cluster_arst_l_right,
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
output	l2clk;	// assume we do not need aclk, bclk outputs
output	aclk;	// buffered version of aclk
output	bclk;	// buffered version of bclk
output	scan_out;		// unused as of today - feb 10, 05
output  aclk_wmr;

// pipelined out
output	pce_ov;				// pce override to l1 header
output	wmr_protect;		// warm reset protect
output	wmr_;				// warm reset (active low) 
output	por_;				// power-on-reset 
output	cmp_slow_sync_en;	// cmp->slow clk sync pulse
output	slow_cmp_sync_en;	// slow->cmp clk sync pulse

// ctrl in (for pipelining)
output	array_wr_inhibit;
input	tcu_atpg_mode;
input	tcu_wr_inhibit;
input	tcu_clk_stop_left;
input	tcu_clk_stop_right;
input	tcu_pce_ov;
input	rst_wmr_protect;		
input	rst_wmr_;		
input	rst_por_;
input	ccu_cmp_slow_sync_en;
input	ccu_slow_cmp_sync_en;

// ctrl in (for clock gen) 
// input	tcu_div_bypass;		// bypasses clk divider to mux in ext clk
input tcu_div_bypass_left;
input tcu_div_bypass_right;
input	ccu_div_ph;			// phase signal from ccu (div/4 or div/2)
input   cluster_div_en;		// if enabled, l2clk is divided down 
input cluster_arst_l_left;
input cluster_arst_l_right;

// clock & test in
input	gclk_left;			// global clk - this is either cmp or dr
input	gclk_right;			// global clk - this is either cmp or dr
input 	ccu_serdes_dtm;
input	clk_ext;		// external clk muxed in for ioclk bypass 
input	scan_en;		// unused as of today - feb 10, 05
input	scan_in;		// unused as of today - feb 10, 05
input	tcu_aclk;				
input	tcu_bclk;


// ************************** 
// wire declaration 
// ************************** 
wire	array_wr_inhibit;
wire	tcu_atpg_mode;
wire	tcu_wr_inhibit;
wire	l2clk;	
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
wire	tcu_clk_stop_left;
wire	tcu_clk_stop_right;
wire	tcu_pce_ov;
wire	rst_wmr_protect;
wire	rst_wmr_;
wire	rst_por_;
wire	ccu_cmp_slow_sync_en;
wire	ccu_slow_cmp_sync_en;
wire	tcu_div_bypass_right;
wire	tcu_div_bypass_left;
wire	ccu_div_ph;
wire	cluster_div_en;
wire	gclk_left;
wire	gclk_right;
wire	cluster_arst_l_left;
wire	cluster_arst_l_right;
wire	clk_ext;
wire	ccu_serdes_dtm;
wire	scan_en;				
wire	scan_in;				
wire	tcu_aclk;				
wire	tcu_bclk;

wire	cclk_left;
wire	cclk_right;
	
wire 	scan_tmp;


// ************************** 
// instantiations
// ************************** 

// needs a few edits to cluster header def - mahmud.hassan 
// modified custom cell name for avoiding 
// collision with sparc core and other clusters - mhassan
n2_clk_clstr_hdr_cust xcluster_header_right (
	.gclk (gclk_right),
	.l2clk (l2clk),
	.cluster_arst_l (cluster_arst_l_right),
	.ccu_div_ph (ccu_div_ph),
	.cluster_div_en (cluster_div_en),	
	.tcu_div_bypass (tcu_div_bypass_right),
	// .clk_ext (clk_ext),
	// .ccu_serdes_dtm (ccu_serdes_dtm),
	.scan_in (scan_in),
	.scan_en (scan_en),	// temporary
	.tcu_aclk (tcu_aclk),
	.tcu_bclk (tcu_bclk),
	.ccu_cmp_slow_sync_en (ccu_cmp_slow_sync_en),
	.ccu_slow_cmp_sync_en (ccu_slow_cmp_sync_en),
	.tcu_pce_ov (tcu_pce_ov),
	.tcu_clk_stop (tcu_clk_stop_right),
	.rst_por_ (rst_por_),
	.rst_wmr_ (rst_wmr_),
	.rst_wmr_protect (rst_wmr_protect),
	.aclk_wmr (aclk_wmr),
	.aclk (aclk),
	.bclk (bclk),
	.cmp_slow_sync_en (cmp_slow_sync_en),
	.slow_cmp_sync_en (slow_cmp_sync_en),
	.pce_ov (pce_ov),
	.por_ (por_),
	.wmr_ (wmr_),
	.wmr_protect (wmr_protect),
	.scan_out (scan_out),
	.array_wr_inhibit (array_wr_inhibit),
	.tcu_atpg_mode (tcu_atpg_mode),
	.tcu_wr_inhibit (tcu_wr_inhibit),
	.cclk (cclk_right)
);


n2_clk_clstr_hdr_cust xcluster_header_left (
	.gclk (gclk_left),
	.l2clk (l2clk),
	.cluster_arst_l (cluster_arst_l_left),
	.ccu_div_ph (ccu_div_ph),
	.cluster_div_en (cluster_div_en),	
	.tcu_div_bypass (tcu_div_bypass_left),
	// .clk_ext (1'b0),
	// .ccu_serdes_dtm (1'b0),
	.scan_in (1'b0),
	.scan_en (1'b0),
	.tcu_aclk (1'b0),
	.tcu_bclk (1'b0),
	.ccu_cmp_slow_sync_en (1'b0),
	.ccu_slow_cmp_sync_en (1'b0),
	.tcu_pce_ov (1'b1),
	.tcu_clk_stop (tcu_clk_stop_left),
	.rst_por_ (1'b0),
	.rst_wmr_ (1'b0),
	.rst_wmr_protect (1'b0),
	.aclk_wmr (),
	.aclk (),
	.bclk (),
	.cmp_slow_sync_en (),
	.slow_cmp_sync_en (),
	.pce_ov (),
	.por_ (),
	.wmr_ (),
	.wmr_protect (),
	.scan_out (),
	.array_wr_inhibit (),
	.tcu_atpg_mode (tcu_atpg_mode),
	.tcu_wr_inhibit (1'b0),
	.cclk (cclk_left)
);

// cclk -> l2clk on bottom 
n2_clk_ccx_cmp_cust xbottom (
     .l2clk         (l2clk),
     .cclk_right    (cclk_right),
     .cclk_left 	(cclk_left) 
);


// cclk -> l2clk on top 
n2_clk_ccx_cmp_cust xtop (
     .l2clk         (l2clk),
     .cclk_right    (cclk_right), 
     .cclk_left 	(cclk_left) 
);



endmodule


`endif // `ifndef FPGA

`ifdef FPGA
module clkgen_ccx_cmp(array_wr_inhibit, tcu_atpg_mode, tcu_wr_inhibit, l2clk, 
	aclk, bclk, scan_out, pce_ov, aclk_wmr, wmr_protect, wmr_, por_, 
	cmp_slow_sync_en, slow_cmp_sync_en, tcu_clk_stop_left, 
	tcu_clk_stop_right, tcu_pce_ov, rst_wmr_protect, rst_wmr_, rst_por_, 
	ccu_cmp_slow_sync_en, ccu_slow_cmp_sync_en, tcu_div_bypass_left, 
	tcu_div_bypass_right, ccu_div_ph, cluster_div_en, gclk_left, gclk_right,
	cluster_arst_l_left, cluster_arst_l_right, clk_ext, ccu_serdes_dtm, 
	tcu_aclk, tcu_bclk, scan_en, scan_in);

	output			l2clk;
	output			aclk;
	output			bclk;
	output			scan_out;
	output			aclk_wmr;
	output			pce_ov;
	output			wmr_protect;
	output			wmr_;
	output			por_;
	output			cmp_slow_sync_en;
	output			slow_cmp_sync_en;
	output			array_wr_inhibit;
	input			tcu_atpg_mode;
	input			tcu_wr_inhibit;
	input			tcu_clk_stop_left;
	input			tcu_clk_stop_right;
	input			tcu_pce_ov;
	input			rst_wmr_protect;
	input			rst_wmr_;
	input			rst_por_;
	input			ccu_cmp_slow_sync_en;
	input			ccu_slow_cmp_sync_en;
	input			tcu_div_bypass_left;
	input			tcu_div_bypass_right;
	input			ccu_div_ph;
	input			cluster_div_en;
	input			cluster_arst_l_left;
	input			cluster_arst_l_right;
	input			gclk_left;
	input			gclk_right;
	input			ccu_serdes_dtm;
	input			clk_ext;
	input			scan_en;
	input			scan_in;
	input			tcu_aclk;
	input			tcu_bclk;

	wire			cclk_left;
	wire			cclk_right;
	wire			scan_tmp;

	n2_clk_clstr_hdr_cust xcluster_header_right(
		.gclk				(gclk_right), 
		.l2clk				(l2clk), 
		.cluster_arst_l			(cluster_arst_l_right), 
		.ccu_div_ph			(ccu_div_ph), 
		.cluster_div_en			(cluster_div_en), 
		.tcu_div_bypass			(tcu_div_bypass_right), 
		.scan_in			(scan_in), 
		.scan_en			(scan_en), 
		.tcu_aclk			(tcu_aclk), 
		.tcu_bclk			(tcu_bclk), 
		.ccu_cmp_slow_sync_en		(ccu_cmp_slow_sync_en), 
		.ccu_slow_cmp_sync_en		(ccu_slow_cmp_sync_en), 
		.tcu_pce_ov			(tcu_pce_ov), 
		.tcu_clk_stop			(tcu_clk_stop_right), 
		.rst_por_			(rst_por_), 
		.rst_wmr_			(rst_wmr_), 
		.rst_wmr_protect		(rst_wmr_protect), 
		.aclk_wmr			(aclk_wmr), 
		.aclk				(aclk), 
		.bclk				(bclk), 
		.cmp_slow_sync_en		(cmp_slow_sync_en), 
		.slow_cmp_sync_en		(slow_cmp_sync_en), 
		.pce_ov				(pce_ov), 
		.por_				(por_), 
		.wmr_				(wmr_), 
		.wmr_protect			(wmr_protect), 
		.scan_out			(scan_out), 
		.array_wr_inhibit		(array_wr_inhibit), 
		.tcu_atpg_mode			(tcu_atpg_mode), 
		.tcu_wr_inhibit			(tcu_wr_inhibit), 
		.cclk				(cclk_right));
	n2_clk_clstr_hdr_cust xcluster_header_left(
		.gclk				(gclk_left), 
		.l2clk				(l2clk), 
		.cluster_arst_l			(cluster_arst_l_left), 
		.ccu_div_ph			(ccu_div_ph), 
		.cluster_div_en			(cluster_div_en), 
		.tcu_div_bypass			(tcu_div_bypass_left), 
		.scan_in			(1'b0), 
		.scan_en			(1'b0), 
		.tcu_aclk			(1'b0), 
		.tcu_bclk			(1'b0), 
		.ccu_cmp_slow_sync_en		(1'b0), 
		.ccu_slow_cmp_sync_en		(1'b0), 
		.tcu_pce_ov			(1'b1), 
		.tcu_clk_stop			(tcu_clk_stop_left), 
		.rst_por_			(1'b0), 
		.rst_wmr_			(1'b0), 
		.rst_wmr_protect		(1'b0), 
		.tcu_atpg_mode			(tcu_atpg_mode), 
		.tcu_wr_inhibit			(1'b0), 
		.cclk				(cclk_left));
	n2_clk_ccx_cmp_cust xbottom(
		.l2clk				(l2clk), 
		.cclk_right			(cclk_right), 
		.cclk_left			(cclk_left));
	n2_clk_ccx_cmp_cust xtop(
		.l2clk				(l2clk), 
		.cclk_right			(cclk_right), 
		.cclk_left			(cclk_left));


endmodule

`endif // `ifdef FPGA

