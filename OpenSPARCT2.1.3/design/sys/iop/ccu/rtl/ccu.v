// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ccu.v
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
`timescale 1 ps/ 1 ps

module ccu (
	// GCLK Ports 
	gclk,	
	dr_pll_clk,
	cmp_pll_clk ,
	ccu_vco_aligned,
	gclk_aligned,
	gl_ccu_io_out,
	// CCU-NCU Interface,
	ccu_ncu_stall,
	ncu_ccu_vld,
	ncu_ccu_data,
	ncu_ccu_stall,
	ccu_ncu_vld,
	ccu_ncu_data,
	// PLL-Bump Interface,
	pll_sys_clk_p,	
	pll_sys_clk_n,
	pll_vdd,		
	// CCU-RNG Interface,
	rng_arst_l,		
	rng_data,		
	rng_bypass,		
	rng_vcoctrl_sel,
	rng_ch_sel,		
	rng_anlg_sel,	
	// SCAN Related,
	tcu_atpg_mode,
	scan_in,					
	tcu_scan_en,				
	tcu_aclk,
	tcu_bclk,
	scan_out, 					
	// Global Outputs,
	ccu_cmp_io_sync_en,	
	ccu_io_cmp_sync_en,	
	ccu_io2x_sync_en,			
	ccu_dr_sync_en,				
	ccu_io2x_out,	
	ccu_io_out,	
	ccu_serdes_dtm,
	// CCU-MIO Interface,
	ccu_mio_pll_char_out,
	ccu_mio_serdes_dtm,		
	ccu_dbg1_serdes_dtm,	
	mio_pll_testmode,		
	mio_ccu_vreg_selbg_l,	
	mio_ccu_pll_clamp_fltr,	
	mio_ccu_pll_div2,		
	mio_ccu_pll_div4,		
	mio_ccu_pll_trst_l,		
	mio_ccu_pll_char_in,	
	// CCU-TCU Interface,
	gl_ccu_io_clk_stop,	
	gl_ccu_clk_stop,	
	tcu_pce_ov,				
	tcu_ccu_mux_sel, 
	tcu_ccu_ext_cmp_clk,   
	tcu_ccu_ext_dr_clk ,   
	tcu_ccu_clk_stretch,   	// TBD
	// CCU-RST Interface,
	rst_ccu_pll_,		
	rst_ccu_,             
	rst_wmr_protect,
  	ccu_rst_change,			
  	ccu_rst_sys_clk,		
	ccu_rst_sync_stable,
	ccu_sys_cmp_sync_en,	
	ccu_cmp_sys_sync_en,	
	cluster_arst_l
);


// ------------------------------------
// INPUT-OUTPUT DECLARATIONS
// ------------------------------------
 
// GCLK Ports 
input  gclk;		
output dr_pll_clk;		
output cmp_pll_clk ;
output ccu_vco_aligned;
input  gclk_aligned;
input  gl_ccu_io_out;
// CCU-NCU Interface,
output ccu_ncu_stall;
input  ncu_ccu_vld;
input  [3:0] ncu_ccu_data;
input  ncu_ccu_stall;
output ccu_ncu_vld;
output [3:0] ccu_ncu_data;
// PLL-Bump Interface,
input  pll_sys_clk_p;
input  pll_sys_clk_n;
input  pll_vdd;		
// CCU-RNG Interface,
output rng_arst_l;		
input  rng_data;		
output rng_bypass;		
output [1:0] rng_vcoctrl_sel; 
output [1:0] rng_ch_sel;		
output [1:0] rng_anlg_sel;	
// SCAN Related;
input  tcu_atpg_mode;
input  scan_in;	
input  tcu_scan_en;	
input  tcu_aclk; 
input  tcu_bclk; 
output scan_out;	
// Global Outputs,
output ccu_serdes_dtm;
output ccu_cmp_io_sync_en;	
output ccu_io_cmp_sync_en;	
output ccu_io2x_sync_en;	
output ccu_dr_sync_en;	
output ccu_io2x_out;	
output ccu_io_out;	
// CCU-MIO Interface;
output [1:0] ccu_mio_pll_char_out;
output ccu_mio_serdes_dtm;	
output ccu_dbg1_serdes_dtm;	
input mio_pll_testmode;		
input mio_ccu_vreg_selbg_l;	
input mio_ccu_pll_clamp_fltr;	
input [5:0] mio_ccu_pll_div2;
input [6:0] mio_ccu_pll_div4;
input mio_ccu_pll_trst_l;		
input mio_ccu_pll_char_in;	
// CCU-TCU Interface,
input	gl_ccu_io_clk_stop;	
input	gl_ccu_clk_stop;
input	tcu_pce_ov;				
input  [1:0] tcu_ccu_mux_sel; 
input  tcu_ccu_ext_cmp_clk; 
input  tcu_ccu_ext_dr_clk ; 
input  tcu_ccu_clk_stretch; 	// TBD
// CCU-RST Interface,
input  rst_ccu_pll_;
input  rst_ccu_; 
input  rst_wmr_protect;
output ccu_rst_change;	
output ccu_rst_sys_clk;	
output ccu_sys_cmp_sync_en;	
output ccu_cmp_sys_sync_en;	
output ccu_rst_sync_stable;
input  cluster_arst_l;


// ------------------------------------
// EXTERNAL WIRE/REG DECLARATIONS
// ------------------------------------

// GCLK Ports 
wire  gclk;		
wire  dr_pll_clk;		
wire  cmp_pll_clk ;
wire  ccu_vco_aligned;
wire  gclk_aligned;
wire  gl_ccu_io_out;
// CCU-NCU Interface,
wire  ccu_ncu_stall;
wire  ncu_ccu_vld;
wire  [3:0] ncu_ccu_data;
wire  ncu_ccu_stall;
wire  ccu_ncu_vld;
wire  [3:0] ccu_ncu_data;
// PLL-Bump Interface,
wire  pll_sys_clk_p;
wire  pll_sys_clk_n;
wire  pll_vdd;		
// CCU-RNG Interface,
wire  rng_arst_l;		
wire  rng_data;		
wire  rng_bypass;		
wire  [1:0] rng_vcoctrl_sel; 
wire  [1:0] rng_ch_sel;		
wire  [1:0] rng_anlg_sel;	
// SCAN Related;
wire  tcu_atpg_mode;
wire  scan_in;	
wire  tcu_scan_en;	
wire  tcu_aclk; 
wire  tcu_bclk; 
wire  scan_out;	
// Global Outputs,
wire  ccu_serdes_dtm;
wire  ccu_cmp_io_sync_en;	
wire  ccu_io_cmp_sync_en;	
wire  ccu_io2x_sync_en;	
wire  ccu_dr_sync_en;		
wire  ccu_io2x_out;	
wire  ccu_io_out;	
// CCU-MIO Interface;
wire  [1:0] ccu_mio_pll_char_out;
wire  ccu_mio_serdes_dtm;	
wire  ccu_dbg1_serdes_dtm; 	
wire  mio_pll_testmode;		
wire  mio_ccu_vreg_selbg_l;	
wire  mio_ccu_pll_clamp_fltr;	
wire  [5:0] mio_ccu_pll_div2;	
wire  [6:0] mio_ccu_pll_div4;	
wire  mio_ccu_pll_trst_l;	
wire  mio_ccu_pll_char_in;	
// CCU-TCU Interface,
wire	tcu_pce_ov;				
wire  [1:0] tcu_ccu_mux_sel; 
wire  tcu_ccu_ext_cmp_clk; 
wire  tcu_ccu_ext_dr_clk ; 
wire  tcu_ccu_clk_stretch; 	// TBD
// CCU-RST Interface,
wire  rst_ccu_pll_;
wire  rst_ccu_; 
wire  rst_wmr_protect;
wire  ccu_rst_change;	
wire  ccu_rst_sys_clk;	
wire  ccu_sys_cmp_sync_en;	
wire  ccu_cmp_sys_sync_en;	
wire  ccu_rst_sync_stable;
wire  cluster_arst_l;

// ***********************************************
// wires for pll 
// ***********************************************

wire dft_rst_a_l; 
wire pll_bypass;
wire pll_char_in;
wire [5:0] pll_div1;
wire [5:0] pll_div2;
wire [5:0] pll_div3;
wire [6:0] pll_div4;
wire [5:0] pll_div3_lat;
wire [6:0] pll_div4_lat;
wire vdd_hv15;
wire vreg_selbg_l;
wire [1:0] pll_char_out;
wire dr_pll_clk_l;		

// ------------------------------------
// INTERNAL WIRE/REG DECLARATIONS
// ------------------------------------

wire [1:0] align_shift;
wire  [4:0] shift_amt;		
wire	[4:0] dr_shift_amt;


wire l2clk;
wire iol2clk;
wire ref_clk;
wire aligned;
wire io_phase_180;
wire io2x_phase_180;
wire [4:0] ratio;

wire aligned_rst_n;

wire ucb_rd_req_vld;	 
wire ucb_wr_req_vld;	 
wire ucb_ack_busy;		 
wire ucb_req_acpted;	 
wire ucb_rd_ack_vld;	 
wire ucb_rd_nack_vld;	 
wire [5:0] ucb_thr_id_in;
wire [1:0] ucb_buf_id_in;
wire [5:0] ucb_thr_id_out;
wire [1:0] ucb_buf_id_out;
wire [63:0] ucb_data_in;
wire [63:0] ucb_data_out;
wire [39:0] ucb_addr_in;

wire wmr_protect;

wire csr_rst_n; 

wire st_phase_hi;
wire [1:0] st_delay_dr;
wire [1:0] st_delay_cmp;

wire	serdes_dtm1; 
wire	serdes_dtm2;

wire [4:0] io_div;
wire [4:0] io2x_div;

wire io_phase_0;
wire l1clk; 

wire aclk_gated; 
wire bclk_gated;
wire scan_en_gated; 

wire ucb_scan_out;
wire cmp_hdr_scan_out;
wire io_hdr_scan_out;
wire core_scan_out;
wire aligned_rst_n_gated;

wire [5:0] div2;
wire [6:0] div4;
wire ext_dr_clk; 
wire ext_cmp_clk; 
wire pll_arst_l;
wire clamp_fltr;
wire pll_clamp_fltr;
wire char_in;

wire dft_rst_a_l_ungated;
wire pll_dtm;
wire [1:0] dr_sel_a;

wire csr_ucb_rst_n;
wire ucb_rst_n;

// FREEZE FEATURE BEGIN
wire [4:0] io_cmp_shift_amt;
wire dtm8_1;
wire dtm11_1;
wire dtm15_1;
wire jtag_mt_mode;
wire [1:0] pll_sel_a;
// FREEZE FEATURE END

// dtm1 dtm2  mio_dtm dbg1_dtm ccu_serdes_dtm
// 0    0       0       0         0
// 1    0       1       1         1
// 0    1       0       0         1
// 1    1       1       1         1



// FREEZE FEATURE BEGIN
//
// 1.
// phase info for io/cmp sync pulses (starting w/0)
// ================================================
// mode 	ratio	cmp-io 		io-cmp 
// FUNC      4:1 	   1          3 
// DTM 		 8:1 	   4 	      7*
// DTM 		11:1 	   5 	      10*
// DTM 		15:1 	   7 	      14*
//
// * means change
//
// 2.
// tcu_ccu_mux_sel == 00 	functional mode
// tcu_ccu_mux_sel == 01    clk stretch
// tcu_ccu_mux_sel == 10    external clk mode
// tcu_ccu_mux_sel == 11   	debug event macro test 
// 
// ccu interferes w/mux_sel when dtm==1 
// when dtm==1, in dr domain mux_sel is forced to 11.
// when mux_sel == 11 in macro test mode, external clocks are 
// allowed to propagate, and pll mux_sel forced to 10 
// (pll_testmode | atpg_mode) block off ext clks otherwise 
// on the pll, pll_dtm and pll_bypass now 
// needs to be OR'ed w/tcu_ccu_mux_sel[1] 
//
// FREEZE FEATURE END 
ccu_core ccu_core (
	.l1clk (l1clk),
	.rst_ccu_ (rst_ccu_),		// sys_clk domain reset input 
	.aligned (gclk_aligned), 	// (aligned),
	.pll_arst_l (pll_arst_l),	// async pll reset input
	.pll_div3 (pll_div3),
	.pll_div2 (pll_div2),
	.pll_div4 (pll_div4),
	.pll_div4_msb (pll_div4_msb),
	.io2x_phase_180 (io2x_phase_180),
	.io_phase_0 (io_phase_0),
	.io_phase_180(io_phase_180),
	.ccu_sys_cmp_sync_en (ccu_sys_cmp_sync_en),
	.ccu_rst_sync_stable (ccu_rst_sync_stable),
	.ccu_cmp_sys_sync_en (ccu_cmp_sys_sync_en),
	.serdes_dtm1 (serdes_dtm1),
	.serdes_dtm2 (serdes_dtm2),
	.io_div (io_div),
	.io2x_div (io2x_div),
	.ratio (ratio),
//	.ccu_vco_aligned (ccu_vco_aligned),
	.pll_div3_lat (pll_div3_lat),
	.pll_div4_lat (pll_div4_lat),
	.csr_rst_n (csr_ucb_rst_n),	// cmp domain reset for csr/ucb blocks
	.ccu_dbg1_serdes_dtm (ccu_dbg1_serdes_dtm),
	.ccu_mio_serdes_dtm (ccu_mio_serdes_dtm),
	.ccu_io2x_sync_en (ccu_io2x_sync_en),
	.ccu_pre_dr_sync_en (ccu_pre_dr_sync_en),  // new input
	.ccu_dr_sync_en (ccu_dr_sync_en),		// changed to output
	.tcu_atpg_mode(tcu_atpg_mode),
	.scan_in (ucb_scan_out),
	.aclk (aclk_gated),
	.bclk (bclk_gated),
	.scan_out (core_scan_out),
	.rng_arst_l (rng_arst_l),
	.ccu_serdes_dtm_lat (ccu_serdes_dtm),
	.rng_ctl1 (rng_ctl1),
	.rng_ctl2 (rng_ctl2),
	.rng_ctl3 (rng_ctl3),
	.rng_ch_sel (rng_ch_sel),
	.ccu_cmp_io_sync_en (ccu_cmp_io_sync_en),
	.ccu_io_cmp_sync_en (ccu_io_cmp_sync_en),
	.aligned_rst_n (aligned_rst_n),
	.shift_amt (shift_amt),
	.dr_shift_amt (dr_shift_amt)
);



///////////////////////////////////////////////////////////
// ** CMP PLL CLK DOMAIN ** 
///////////////////////////////////////////////////////////

ccu_hm_top ccu_hm_wrapper ( 
	.ref_clk (ref_clk),
	.cmp_pll_clk_l (cmp_pll_clk_l),
	.shift_amt (shift_amt),	
	.dr_shift_amt (dr_shift_amt),
	.rst_n (rst_ccu_),		// arst_msff non-scan flops 
	.rst_out_n (dft_rst_a_l_ungated),	// frac. divider reset out
	.div_msb (pll_div4_msb),
	.pulse_out	 (ccu_vco_aligned) 
);


///////////////////////////////////////////////////////////
// ** L2 CLK DOMAIN ** 
///////////////////////////////////////////////////////////

// ***********************************************
// generate sync pulse for cmp<->dr 
// ***********************************************
ccu_cmp_dr_sync cmp_dr_sync (
	.align_shift (align_shift),
	.align (gclk_aligned), 
	.ccu_serdes_dtm (ccu_serdes_dtm),
	.clk (l1clk),
	.ratio (ratio), 	
	.pulse (ccu_pre_dr_sync_en), 
	.rst_n (aligned_rst_n)		// syncrst_msff scan flops 
);

// ***********************************************
// generate io phase signal from vco clk 
// ***********************************************
ccu_divider gen_io_phase (
	.rst_n (aligned_rst_n_gated),  // arst_msff scan flops 
	.div (io_div),
	.clkin (l1clk),
	.clkout (ccu_io_out),
	.phase_180 (io_phase_180)
);	

// ***********************************************
// generate io2x phase signal from vco clk 
// ***********************************************
ccu_divider gen_io2x_phase (
	.rst_n (aligned_rst_n_gated),  // arst_msff scan flops  
	.div (io2x_div),
	.clkin (l1clk),
	.clkout (ccu_io2x_out),
	.phase_180 (io2x_phase_180)
);	


// ***********************************************
// generate sync pulses for cmp<->io
// ***********************************************
// FREEZE FEATURE BEGIN
assign dtm8_1  = (ccu_serdes_dtm && (ratio == 5'h07));
assign dtm11_1 = (ccu_serdes_dtm && (ratio == 5'h0A));
assign dtm15_1 = (ccu_serdes_dtm && (ratio == 5'h0E));
assign io_cmp_shift_amt = dtm8_1  ? 5'd07 : 		
						  dtm11_1 ? 5'd03 :
						  dtm15_1 ? 5'd09 :
                                    5'd01 ;

ccu_pulse_shift io_cmp_sp_shift (
	.rst_n (aligned_rst_n_gated),   // arst_msff scan flops  
	.clk (l1clk),
	// .shift (5'h01),	
	.shift (io_cmp_shift_amt),  // now depends on func/dtm 	
 	.pulse_in (io_phase_180),
	.pulse_out	 (io_phase_0)
);
// FREEZE FEATURE END



// ***********************************************
// pll signal gating/muxing 
// ***********************************************

assign jtag_mt_mode = &tcu_ccu_mux_sel; // both high
assign ext_dr_clk  = (mio_pll_testmode | tcu_atpg_mode | jtag_mt_mode) & tcu_ccu_ext_dr_clk; 
assign ext_cmp_clk = (mio_pll_testmode | tcu_atpg_mode | jtag_mt_mode) & tcu_ccu_ext_cmp_clk; 
assign div2 =        mio_pll_testmode ? mio_ccu_pll_div2 : pll_div2;
assign div4 =        mio_pll_testmode ? mio_ccu_pll_div4 : pll_div4_lat;
assign pll_arst_l =  (tcu_atpg_mode | jtag_mt_mode) ? 1'b0 : 
					 mio_pll_testmode ? mio_ccu_pll_trst_l : 
                     rst_ccu_pll_;

assign clamp_fltr =  mio_pll_testmode ? mio_ccu_pll_clamp_fltr : pll_clamp_fltr; 
assign char_in =    (mio_pll_testmode & mio_ccu_pll_char_in) | pll_char_in;
assign dft_rst_a_l = ~(tcu_atpg_mode | jtag_mt_mode) & dft_rst_a_l_ungated;
// FREEZE FEATURE BEGIN
// assign pll_bypass = tcu_atpg_mode; // ccu_serdes_dtm ? ccu_serdes_dtm : tcu_ccu_mux_sel[1] ;
// assign pll_dtm = tcu_atpg_mode | ccu_serdes_dtm; 
assign pll_bypass = tcu_atpg_mode | tcu_ccu_mux_sel[1] ;
assign pll_dtm = tcu_atpg_mode | ccu_serdes_dtm | tcu_ccu_mux_sel[1];  
// FREEZE FEATURE END

// atpg_mode has highest priority just in case any of the
// other controls are state based
assign dr_sel_a =  tcu_atpg_mode  ? tcu_ccu_mux_sel : 
                   jtag_mt_mode   ? 2'b10 : 
				   ccu_serdes_dtm ? 2'b11 : 
                   tcu_ccu_mux_sel; 
 
assign pll_sel_a = tcu_atpg_mode  ? tcu_ccu_mux_sel : 
                   jtag_mt_mode   ? 2'b10 :
                   tcu_ccu_mux_sel; 
 

// ***********************************************
// pll instantiation 
// ***********************************************
n2_core_pll_cust ccu_pll (
	.pll_testmode		( mio_pll_testmode ),
	.dft_rst_a_l 		( dft_rst_a_l ),
	.dr_ext_clk 		( ext_dr_clk ), 		// bypass clk (tcu)
	.dr_sdel 			( st_delay_dr ),		// stretch amnt (csr)
	.dr_sel_a 			( dr_sel_a ), 			// mux sel (tcu) or set by dtm or macro test
	.dr_stretch_a 		( st_phase_hi ), 		// stretch hi/lo ph (csr)
	.l2clk 				( cmp_pll_clk ),
	.pll_arst_l 		( pll_arst_l ),			// (rst)
	.pll_bypass 		( pll_bypass ),
	.pll_char_in 		( char_in ),			// (csr | mio)
	.pll_clamp_fltr 	( clamp_fltr ),			// (csr | mio)
	.pll_div1 			( pll_div1 ),			// (csr)
	.pll_div2 			( div2 ),				// (csr | mio)
	.pll_div3 			( pll_div3_lat ),		// (csr)
	.pll_div4 			( div4 ),				// (csr | mio)
	.ccu_serdes_dtm		( pll_dtm ), 			//	ccu_serdes_dtm 
	.pll_ext_clk 		( ext_cmp_clk ), 		// bypass clk (tcu) 
	.pll_sys_clk   		({pll_sys_clk_n,pll_sys_clk_p}), // 0->p, 1->n
	.pll_sdel 			( st_delay_cmp ),		// stretch amnt (csr)
	.pll_sel_a 			( pll_sel_a ), 			// mux sel (tcu) or set by macro test
	.pll_stretch_a 		( st_phase_hi ), 		// stretch hi/lo ph (csr)
	.sel_l2clk_fbk 		( 1'b0 ),				// permanently deselect fdbk
	.vdd_hv15 			( pll_vdd),				// (bump)
	.vreg_selbg_l 		( mio_ccu_vreg_selbg_l ), // (mio)
	.ccu_rst_ref_buf2 	( ref_clk ),			
	.ccu_rst_sys_clk 	( ccu_rst_sys_clk ),
	.dr_clk_out 		( dr_pll_clk ),
	.dr_clk_out_l 		( dr_pll_clk_l ),
	.pll_char_out 		( ccu_mio_pll_char_out ), // to mio - not modeled 
	.pll_clk_out 		( cmp_pll_clk ),
	.pll_clk_out_l 		( cmp_pll_clk_l )
);



// ***********************************************
// clkgen - cmp 
// ***********************************************
clkgen_ccu_cmp clkgen_cmp (
    .l2clk(l2clk),
	.aclk_wmr(),
    .ccu_serdes_dtm(1'b0),
    .aclk(aclk),
    .bclk(bclk),
    .scan_out(cmp_hdr_scan_out),
    .pce_ov(),
    .wmr_protect(wmr_protect),
    .wmr_(),
    .por_(),
    .cmp_slow_sync_en(),
    .slow_cmp_sync_en(),
    .tcu_clk_stop(1'b0),
    .tcu_pce_ov(1'b0),
    .rst_wmr_protect(rst_wmr_protect),
    .rst_wmr_(1'b0),
    .rst_por_(1'b0),
    .ccu_cmp_slow_sync_en(1'b0),
    .ccu_slow_cmp_sync_en(1'b0),
    .tcu_div_bypass(1'b0),
    .ccu_div_ph(1'b1),
    .cluster_div_en(1'b0),
    .gclk(gclk),
    .clk_ext(1'b0),
    .tcu_aclk(tcu_aclk),
    .tcu_bclk(tcu_bclk),
    .scan_en(scan_en_gated),
    .scan_in(scan_in),
	.tcu_atpg_mode(tcu_atpg_mode),
	.tcu_wr_inhibit(1'b0),
	.array_wr_inhibit(),
	.cluster_arst_l (1'b1)
);


// ***********************************************
// clkgen - io
// ***********************************************
clkgen_ccu_io clkgen_io (
    .l2clk(iol2clk),
    .aclk_wmr(),
    .ccu_serdes_dtm(ccu_serdes_dtm),
    .aclk(),
    .bclk(),
    .scan_out (io_hdr_scan_out),
    .pce_ov(),
    .wmr_protect(),
    .wmr_(),
    .por_(),
    .cmp_slow_sync_en(),
    .slow_cmp_sync_en(),
    .tcu_clk_stop(1'b0),
    .tcu_pce_ov(1'b0),
    .rst_wmr_protect(1'b0),
    .rst_wmr_(1'b0),
    .rst_por_(1'b0),
    .ccu_cmp_slow_sync_en(1'b0),
    .ccu_slow_cmp_sync_en(1'b0),
    .tcu_div_bypass(tcu_atpg_mode),
    .ccu_div_ph(gl_ccu_io_out), 
    .cluster_div_en(1'b1),
    .gclk(gclk),
    .clk_ext(1'b0),
    .tcu_aclk(aclk_gated),
    .tcu_bclk(bclk_gated),
    .scan_en(scan_en_gated),
    .scan_in(scan_in),
	.tcu_atpg_mode(tcu_atpg_mode),
	.tcu_wr_inhibit(1'b0),
	.array_wr_inhibit(),
	.cluster_arst_l (1'b1)
);


///////////////////////////////////////////////////////////
// ** IOL2 CLK DOMAIN ** 
///////////////////////////////////////////////////////////

// ***********************************************
// io domain reset generation 
// ***********************************************
ccu_io_rstgen io_rstgen_blk ( 
	.iol2clk( iol2clk ),
	.csr_ucb_rst_n( csr_ucb_rst_n ),
	.tcu_atpg_mode( tcu_atpg_mode ),
	.csr_rst_n( csr_rst_n ),
	.ucb_rst_n( ucb_rst_n )
);


// ***********************************************
// csr block instantiation 
// ***********************************************
ccu_csr csr_blk (
	// ucb connectivity
	.io_clk(iol2clk),
	.wr_req_vld	(ucb_wr_req_vld),
	.addr_in(ucb_addr_in),
	.data_in(ucb_data_in),
	.req_accepted(ucb_req_acpted),	
	.rd_req_vld(ucb_rd_req_vld),		
	.thr_id_in (ucb_thr_id_in),
	.buf_id_in (ucb_buf_id_in),
	.rack_busy(ucb_ack_busy),
	.data_out(ucb_data_out), 	
	.thr_id_out(ucb_thr_id_out),
	.buf_id_out(ucb_buf_id_out),
	.rd_ack_vld(ucb_rd_ack_vld),  
	.rd_nack_vld(ucb_rd_nack_vld),  
	.int_busy(),
	.dev_id (),  
	.int_vld (),
	// other connectivity
	.rst_n (csr_rst_n),       			// arst_msff scan flops 
	.wmr_protect (wmr_protect), 
	.rng_data_in (rng_data),
	.pll_div1 (pll_div1),
	.pll_div2 (pll_div2),
	.pll_div3 (pll_div3),
	.pll_div4 (pll_div4),
	.st_phase_hi ( st_phase_hi ),
	.st_delay_dr  ( st_delay_dr ),
	.st_delay_cmp  ( st_delay_cmp ),
	.serdes_dtm1 (serdes_dtm1),
	.serdes_dtm2 (serdes_dtm2),
	.change 	 ( ccu_rst_change ),
	.align_shift ( align_shift ),
	.pll_char_in ( pll_char_in ),
	.pll_clamp_fltr ( pll_clamp_fltr ),
	// rng  
	.rng_ctl1 (rng_ctl1),
	.rng_ctl2 (rng_ctl2),
	.rng_ctl3 (rng_ctl3),
	.rng_bypass (rng_bypass), 
	.rng_vcoctrl_sel (rng_vcoctrl_sel),	
	.rng_anlg_sel (rng_anlg_sel) 
);

// ***********************************************
// scan gating and muxing 
// ***********************************************

assign aclk_gated = 		 tcu_atpg_mode & aclk;
assign bclk_gated = 		 tcu_atpg_mode & bclk;
assign scan_en_gated = 		 tcu_atpg_mode & tcu_scan_en;
assign aligned_rst_n_gated = tcu_atpg_mode | aligned_rst_n;
assign scan_out = 			 tcu_atpg_mode?core_scan_out:scan_in;

// ***********************************************
// ucb flow ctl instantiation 
// ***********************************************


// the following requires sunv to plain verilog conversion
ccu_ucbflow_ctl ucb (
	// Outputs
	.scan_out	(ucb_scan_out),		 
	.ccu_ncu_stall	(ccu_ncu_stall),	 
	.ccu_ncu_vld	(ccu_ncu_vld),		 
	.ccu_ncu_data	(ccu_ncu_data),	 
	.rd_req_vld	(ucb_rd_req_vld),	 
	.wr_req_vld	(ucb_wr_req_vld),	 
	.thr_id_in	(ucb_thr_id_in),	 
	.buf_id_in	(ucb_buf_id_in),	 
	.addr_in	(ucb_addr_in),	 
	.data_in	(ucb_data_in),	 
	.ack_busy	(ucb_ack_busy),		 
	// Inputs
	.rst_n 		(ucb_rst_n),	// syncrst_msff scan flops 
	.iol2clk	(iol2clk),		 
	.scan_in	(io_hdr_scan_out),		 
	.tcu_pce_ov	(1'b1),		 
	.tcu_clk_stop	(1'b0),		 
	.tcu_aclk	(aclk_gated),		 
	.tcu_bclk	(bclk_gated),		 
	.tcu_scan_en	(scan_en_gated),
	.ncu_ccu_vld	(ncu_ccu_vld),		 
	.ncu_ccu_data	(ncu_ccu_data),	 
	.ncu_ccu_stall	(ncu_ccu_stall),	 
	.req_acpted	(ucb_req_acpted),	 
	.rd_ack_vld	(ucb_rd_ack_vld),	 
	.rd_nack_vld	(ucb_rd_nack_vld),	 
	.thr_id_out	(ucb_thr_id_out),	 
	.buf_id_out	(ucb_buf_id_out),	 
	.data_out	(ucb_data_out)
);	 



// ***********************************************************
// L1 header - l2 clk 
// ***********************************************************
//
cl_a1_l1hdr_8x header_l2clk (
    .l2clk(l2clk),
    .l1clk(l1clk),
    .pce(1'b1),
    .se(1'b0),
    .pce_ov(1'b1),
    .stop(1'b0)
);

endmodule

