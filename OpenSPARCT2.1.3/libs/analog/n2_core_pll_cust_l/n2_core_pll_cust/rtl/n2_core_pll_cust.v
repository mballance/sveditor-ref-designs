// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_core_pll_cust.v
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
// ------------------------------------------------------------------
// Tuesday Sep 20,2005 at 06:09:15 PM PDT
//
// Directory: /import/n2-emir5/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_cust/netlists
// /import/datools/release/tools/sno,1.2.10 \
//   -CELL n2_core_pll_cust \
//   -LIB n2_core_pll_cust_l \
//   -NOSPECIALVDDOVSSO \
//   -VERILOGLIBS \
//   -AUDITFILE /import/n2-emir5/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_cust/verification/audit/n2_core_pll_cust.sno.audit
// ------------------------------------------------------------------


//
// some preprocessors imported from rtl for convenience - mh157021
//

// define clock stretch amount  
`define PLL_BASE_STR_AMT 40

// enable for pll to track feedback
// ***WARNING!!!!*** Make sure timescale is set to 1 xs / 1xs 
// ***WARNING!!!!*** The feedback tracking mechanism relies on quantization 
// ***WARNING!!!!*** to perform correction. Otherwise set FDBK_TRACKING to off 
// `define FDBK_TRACKING 
// `timescale 1 ps / 1 ps

// pll phase debug option	
// `ifdef PLL_PH_DEBUG

`define PLL_LOCK_CNT 3'b011 

// needed to use normal cl_u1 library elements
`define LIB


// ================================================================== 
// mh157021: PLL TOP LEVEL MODULE DEFINITION
// ================================================================== 


// 
//  Last Modified: Thursday Sep  1,2005 at 10:28:18 AM PDT
//  

// module n2_core_pll_cust(sel_l2clk_fbk ,dr_stretch_a ,pll_clk_out_l ,
//      dr_clk_out_l ,pll_clamp_fltr ,dr_ext_clk ,ccu_serdes_dtm ,
//      pll_char_out ,pll_sys_clk ,dr_sel_a ,pll_ext_clk ,vreg_selbg_l ,
//      dr_sdel ,pll_clk_out ,l2clk ,pll_sdel ,dft_rst_a_l ,pll_char_in ,
//      pll_arst_l ,vdd_hv15 ,dr_clk_out ,pll_stretch_a ,pll_sel_a ,
//      pll_div4 ,pll_bypass ,pll_div3 ,pll_div1 ,pll_div2 ,
//      ccu_rst_ref_buf2 ,ccu_rst_sys_clk ,pll_testmode );
// output [1:0]	pll_char_out ;
// input [1:0]	pll_sys_clk ;
// input [1:0]	dr_sel_a ;
// input [1:0]	dr_sdel ;
// input [1:0]	pll_sdel ;
// input [1:0]	pll_sel_a ;
// input [6:0]	pll_div4 ;
// input [5:0]	pll_div3 ;
// input [5:0]	pll_div1 ;
// input [5:0]	pll_div2 ;
// output		pll_clk_out_l ;
// output		dr_clk_out_l ;
// output		pll_clk_out ;
// output		dr_clk_out ;
// output		ccu_rst_ref_buf2 ;
// output		ccu_rst_sys_clk ;
// input		sel_l2clk_fbk ;
// input		dr_stretch_a ;
// input		pll_clamp_fltr ;
// input		dr_ext_clk ;
// input		ccu_serdes_dtm ;
// input		pll_ext_clk ;
// input		vreg_selbg_l ;
// input		l2clk ;
// input		dft_rst_a_l ;
// input		pll_char_in ;
// input		pll_arst_l ;
// input		vdd_hv15 ;
// input		pll_stretch_a ;
// input		pll_bypass ;
// input		pll_testmode ;
// supply1		vdd ;
// wire vss = 1'b0;
//  
// wire [9:0]	net0210 ;
// wire		pll_jtag_lock_everlose ;
// wire		fast_l ;
// wire		ref_ck ;
// wire		l1clk_buf ;
// wire		net0189 ;
// wire		fast_buf ;
// wire		vco2_clk ;
// wire		slow_buf ;
// wire		vdd_reg ;
// wire		ref ;
// wire		pll_lock_pulse ;
// wire		pfd_reset ;
// wire		pll_lock_dyn ;
// wire		vco8_clk ;
// wire		net0131 ;
// wire		net0132 ;
// wire		bypass_clk ;
// wire		net0136 ;
// wire		slow ;
// wire		fb ;
// wire		net0144 ;
// wire		fast ;
// wire		net159 ;
// wire		fb_ck ;
// wire		net163 ;
// wire		div_ck3 ;
// wire		vco_clk ;
// wire		dr_clk ;
// wire		fltr ;
// wire		slow_l ;
// wire		vco_out ;
// wire		net0172 ;
// 
// n2_core_pll_inv_32x_cust pll_clk_inv_inst (  // missing instance - mh157021
//       .vdd_reg         (vdd ),
//       .out             (pll_clk_out_l ),
//       .in              (net0144) );
// n2_core_pll_inv_32x_cust dr_clk_inv_inst (    // missing instance - mh157021
//       .vdd_reg         (vdd ),
//       .out             (dr_clk_out_l ),
//       .in              (dr_clk) );
// n2_core_pll_vco_sum_cust x2 (
//      .cktree_drv      (vco_out ),
//      .vco_clk         (vco_clk ),
//      .vdd_reg         (vdd_reg ),
//      .vco_out         (vco_out ),
//      .slow            (slow ),
//      .slow_l          (slow_l ),
//      .fast            (fast ),
//      .fltr            (fltr ),
//      .fast_l          (fast_l ) );
// n2_core_pll_vdd_xing_buf_4x_cust x3 (
//      .vdd_reg         (vdd_reg ),
//      .out             (net0172 ),
//      .in              (pll_clamp_fltr ) );
// n2_core_pll_m1_cust x4 (
//      .vdd_reg         (vdd_reg ) );
// n2_core_pll_inv_100x_cust x5 (
//       .vdd_reg         (vdd ),
//       .out             (dr_clk_out ),
//       .in              (net0131 ) );
// n2_core_pll_tpm3_all_cust x6 (
//      .pll_div3        ({pll_div3 } ),
//      .pll_sdel        ({pll_sdel } ),
//      .pll_sel_a       ({pll_sel_a } ),
//      .dr_sdel         ({dr_sdel } ),
//      .dr_sel_a        ({dr_sel_a } ),
//      .pll_div4        ({pll_div4 } ),
//      .pll_stretch_a   (pll_stretch_a ),
//      .ccu_serdes_dtm  (ccu_serdes_dtm ),
//      .dr_ext_clk      (dr_ext_clk ),
//      .volb            (~vco_out ),
//      .pll_clk_out_l   (net0132 ),
//      .pll_bypass_clk_en (pll_bypass ),
//      .pll_arst_l      (timed_pll_arst_l),	// worked around non-deterministic reset - mh157021
//      .dr_clk_out      (dr_clk ),
//      .pll_bypass_clk  (bypass_clk ),
//      .pll_clk_out     (net0144 ),
//      .dr_clk_out_l    (net0131 ),
//      .dr_stretch_a    (dr_stretch_a ),
//      .pll_testmode    (pll_testmode ),
// 	 .dc_clk		  (dc_clk), 			// unused -same polarity as volb
//      .vco8_clk        (vco8_clk ),
//      .vco2_clk        (vco2_clk ),
//      .pll_ext_clk     (pll_ext_clk ),
//      .dft_rst_a_l     (dft_rst_a_l ) );
// n2_vreg_cust x7 (
//      .i50n            ({net0210[0] ,net0210[1] ,net0210[2] ,net0210[3] ,
//             net0210[4] ,net0210[5] ,net0210[6] ,net0210[7] ,net0210[8] ,
//             net0210[9] } ),
//      .v1p1reg_lowv    (vdd_reg ),
//      .vdd_hv15        (vdd_hv15 ),
//      .vref            (net0189 ),
//      .vrefb           (net0136 ),
//      .selbg_l         (vreg_selbg_l ) );
// n2_core_pll_inv_1x_cust x8 (
//      .vdd_reg         (vdd ),
//      .out             (net163 ),
//      .in              (pll_arst_l ) );
// n2_core_pll_vdd_xing_buf_4x_cust x9 (
//      .vdd_reg         (vdd_reg ),
//      .out             (net159 ),
//      .in              (net163 ) );
// n2_core_pll_charc_cust xcharc (
//      .pll_charc_out   ({pll_char_out } ),
//      .arst_l          (pll_arst_l ),
//      .testmode        (pll_testmode ),
//      .dr_clk_out      (dr_clk ),
//      .ccu_rst_ref_buf2 (ccu_rst_ref_buf2 ),
//      .ccu_rst_sys_clk (ccu_rst_sys_clk ),
//      .lock            (pll_lock_dyn ),
//      .fb_clk_l        (fb_ck ),
//      .pll_charc_in    (pll_char_in ),
//      .ref_clk_l       (ref_ck ),
//      .fast            (fast_buf ),
//      .slow            (slow_buf ),
//      .ref             (ref ),
//      .fb              (fb ),
//      .vco_clk         (vco8_clk ),
//      .l1clk           (l1clk_buf ) );
// n2_core_pll_inv_100x_cust x10 (
//       .vdd_reg         (vdd ),
//       .out             (pll_clk_out ),
//       .in              (net0132 ) );
// n2_core_pll_pad_cluster_cust x11 (
//      .pll_sys_clk     ({pll_sys_clk } ),
//      .vdd_hv15        (vdd_hv15 ) );
// n2_core_pll_vrr_cust x0 (
//      .vdd_reg         (vdd_reg ),
//      .fltr_nw         (fltr ),
//      .reset           (net159 ),
//      .fb              (fb ),
//      .div8            (vdd_reg ),
//      .div4            (vdd_reg ),
//      .div_ck          (ref ),
//      .vrr_disbl       (vss ),
//      .clamp_fltr      (net0172 ),
//      .pfd_reset       (pfd_reset ) );
// n2_core_pll_pecl_all_cust x1 (
//      .pll_div1        ({pll_div1 } ),
//      .pll_div2        ({pll_div2 } ),
//      .pll_sys_clk     ({pll_sys_clk } ),
//      .regdivcr        (div_ck3 ),
//      .ref_ck          (ref_ck ),
//      .slow_l          (slow_l ),
//      .fast            (fast ),
//      .fast_l          (fast_l ),
//      .pll_clamp_fltr  (net0172 ),
//      .pll_lock_pulse  (pll_lock_pulse ),
//      .vdd_reg         (vdd_reg ),
//      .fb_ck           (fb_ck ),
//      .l2clk           (l2clk ), 
//      .slow            (slow ),
//      .slow_buf        (slow_buf ),
//      .pll_jtag_lock_everlose (pll_jtag_lock_everlose ),
//      .pll_lock_dyn    (pll_lock_dyn ),
//      .raw_clk_byp     (bypass_clk ),
//      .fast_buf        (fast_buf ),
//      .l2clkc          (vco2_clk ),
//      .testmode        (sel_l2clk_fbk ),
//      .pll_arst_l      (pll_arst_l ),
// 	 .pll_bypass_clk_en  (pll_bypass), // missing connectivity - mh157021
//      .ref             (ref ),
//      .fb              (fb ),
//      .l1clk_buf       (l1clk_buf ),
//      .pfd_reset       (pfd_reset ),
//      .fltr            (fltr ) );
// imaginary_timed_rst imaginary_timed_rst ( 	// added timed reset to resolve d3 reset issue - mh157021
// 	.ref (ref), 
// 	.vco_clk (vco_clk), 
// 	.pll_arst_l (pll_arst_l),
// 	.pll_div2 (pll_div2), 
// 	.timed_pll_arst_l (timed_pll_arst_l)
// );
// endmodule



module n2_core_pll_cust(sel_l2clk_fbk ,dr_stretch_a ,pll_clk_out_l ,
     dr_clk_out_l ,pll_clamp_fltr ,dr_ext_clk ,ccu_serdes_dtm ,
     pll_char_out ,pll_sys_clk ,dr_sel_a ,pll_ext_clk ,vreg_selbg_l ,
     dr_sdel ,pll_clk_out ,l2clk ,pll_sdel ,dft_rst_a_l ,pll_char_in ,
     pll_arst_l ,vdd_hv15 ,dr_clk_out ,pll_stretch_a ,pll_sel_a ,
     pll_div4 ,pll_bypass ,pll_div3 ,pll_div1 ,pll_div2 ,
     ccu_rst_ref_buf2 ,ccu_rst_sys_clk ,pll_testmode );
output [1:0]	pll_char_out ;
input [1:0]	pll_sys_clk ;
input [1:0]	dr_sel_a ;
input [1:0]	dr_sdel ;
input [1:0]	pll_sdel ;
input [1:0]	pll_sel_a ;
input [6:0]	pll_div4 ;
input [5:0]	pll_div3 ;
input [5:0]	pll_div1 ;
input [5:0]	pll_div2 ;
output		pll_clk_out_l ;
output		dr_clk_out_l ;
output		pll_clk_out ;
output		dr_clk_out ;
output		ccu_rst_ref_buf2 ;
output		ccu_rst_sys_clk ;
input		sel_l2clk_fbk ;
input		dr_stretch_a ;
input		pll_clamp_fltr ;
input		dr_ext_clk ;
input		ccu_serdes_dtm ;
input		pll_ext_clk ;
input		vreg_selbg_l ;
input		l2clk ;
input		dft_rst_a_l ;
input		pll_char_in ;
input		pll_arst_l ;
input		vdd_hv15 ;
input		pll_stretch_a ;
input		pll_bypass ;
input		pll_testmode ;

supply1		vdd ;
supply0		vss ;
 
wire [9:0]	net0210 ;
wire		pll_jtag_lock_everlose ;
wire		fast_l ;
wire		ref_ck ;
wire		l1clk_buf ;
wire		net0189 ;
wire		fast_buf ;
wire		vco2_clk ;
wire		slow_buf ;
wire		vdd_reg  = 1'b1;
wire		ref ;
wire		pll_lock_pulse ;
wire		dc_clk ;
wire		pfd_reset ;
wire		pll_lock_dyn ;
wire		vco8_clk ;
wire		net0131 ;
wire		net0132 ;
wire		bypass_clk ;
wire		net0135 ;
wire		net0136 ;
wire		net0139 ;
wire		slow ;
wire		fb ;
wire		net0144 ;
wire		fast ;
wire		net159 ;
wire		fb_ck ;
wire		net0114 ;
wire		net163 ;
wire		div_ck3 ;
wire		net0117 ;
wire		dr_clk ;
wire		fltr ;
wire		net080 ;
wire		slow_l ;
wire		vco_out ;
wire		net0172 ;
 
 
n2_core_pll_vco_sum_cust x2 (
     .dc_clk          (dc_clk ),
     .vdd_reg         (vdd_reg ),
     .volb            (vco_out ),
     .slow            (slow ),
     .slow_l          (slow_l ),
     .fast            (fast ),
     .fltr            (fltr ),
     .fast_l          (fast_l ) );
//n2_core_pll_vdd_xing_buf_4x_cust x3 (
//     .vdd_reg         (vdd_reg ),
//     .out             (net0172 ),
//     .in              (pll_clamp_fltr ) );
//n2_core_pll_m1_cust x4 (
//     .vdd_reg         (vdd_reg ) );
n2_core_pll_inv_100x_cust x5 (
     .vdd_reg         (vdd ),
     .out             (dr_clk_out ),
     .in              (net0131 ) );
n2_core_pll_tpm3_all_cust x6 (
     .pll_div3        ({pll_div3 } ),
     .pll_sdel        ({pll_sdel } ),
     .pll_sel_a       ({pll_sel_a } ),
     .dr_sdel         ({dr_sdel } ),
     .dr_sel_a        ({dr_sel_a } ),
     .pll_div4        ({pll_div4 } ),
     .pll_stretch_a   (pll_stretch_a ),
     .ccu_serdes_dtm  (ccu_serdes_dtm ),
     .dr_ext_clk      (dr_ext_clk ),
     .dc_clk          (dc_clk ),
     .pll_clk_out_l   (net0132 ),
     .pll_bypass_clk_en (pll_bypass ),
//     .pll_arst_l      (pll_arst_l ),
     .pll_arst_l      (timed_pll_arst_l),	// worked around non-deterministic reset - mh157021
     .dr_clk_out      (dr_clk ),
     .pll_bypass_clk  (bypass_clk ),
     .pll_clk_out     (net0144 ),
     .dr_clk_out_l    (net0131 ),
     .dr_stretch_a    (dr_stretch_a ),
     .pll_testmode    (pll_testmode ),
     .vco8_clk        (vco8_clk ),
     .volb            (~vco_out ),
     .vco2_clk        (vco2_clk ),
     .pll_ext_clk     (pll_ext_clk ),
     .dft_rst_a_l     (dft_rst_a_l ) );
//n2_vreg_cust x7 (
//     .i50n            ({net0210[0] ,net0210[1] ,net0210[2] ,net0210[3] ,
//            net0210[4] ,net0210[5] ,net0210[6] ,net0210[7] ,net0210[8] ,
//            net0210[9] } ),
//     .v1p1reg_lowv    (vdd_reg ),
//     .vdd_hv15        (vdd_hv15 ),
//     .vref            (net0189 ),
//     .vrefb           (net0136 ),
//     .selbg_l         (vreg_selbg_l ) );
//terminator i58_3_ (
//     .TERM            (net0210[6] ) );
n2_core_pll_inv_1x_cust x8 (
     .vdd_reg         (vdd ),
     .out             (net163 ),
     .in              (pll_arst_l ) );
n2_core_pll_vdd_xing_buf_4x_cust x9 (
     .vdd_reg         (vdd_reg ),
     .out             (net159 ),
     .in              (net163 ) );
n2_core_pll_charc_cust xcharc (
     .pll_charc_out   ({pll_char_out } ),
     .arst_l          (pll_arst_l ),
     .ccu_rst_ref_buf2_l (net0139 ),
     .testmode        (pll_testmode ),
     .dr_clk_out      (dr_clk ),
     .ccu_rst_sys_clk (ccu_rst_sys_clk ),
     .lock            (pll_lock_dyn ),
     .fb_clk_l        (fb_ck ),
     .pll_charc_in    (pll_char_in ),
     .ref_clk_l       (ref_ck ),
     .fast            (fast_buf ),
     .slow            (slow_buf ),
     .ref             (ref ),
     .fb              (fb ),
     .vco_clk         (vco8_clk ),
     .l1clk           (l1clk_buf ) );
//terminator i58_4_ (
//     .TERM            (net0210[5] ) );
n2_core_pll_inv_100x_cust x10 (
     .vdd_reg         (vdd ),
     .out             (pll_clk_out ),
     .in              (net0132 ) );
//n2_core_pll_pad_cluster_cust x11 (
//     .pll_sys_clk     ({pll_sys_clk } ),
//     .vdd_hv15        (vdd_hv15 ) );
//terminator i30 (
//     .TERM            (pll_lock_pulse ) );
//n2_core_pll_inv_1x_cust x12 (
//     .vdd_reg         (vdd_reg ),
//     .out             (net0135 ),
//     .in              (vss ) );
//n2_core_pll_inv_1x_cust x13 (
//     .vdd_reg         (vdd_reg ),
//     .out             (net080 ),
//     .in              (vss ) );
n2_core_pll_inv_32x_cust x14 (
     .vdd_reg         (vdd ),
     .out             (pll_clk_out_l ),
     .in              (net0144 ) );
n2_core_pll_inv_32x_cust x15 (
     .vdd_reg         (vdd ),
     .out             (dr_clk_out_l ),
     .in              (dr_clk ) );
n2_core_pll_inv_4x_cust x16 (
     .vdd_reg         (vdd_reg ),
     .out             (net0117 ),
     .in              (net0172 ) );
n2_core_pll_inv_8x_cust x17 (
     .vdd_reg         (vdd_reg ),
     .out             (net0114 ),
     .in              (net0117 ) );
n2_core_pll_inv_32x_cust x18 (
     .vdd_reg         (vdd ),
     .out             (ccu_rst_ref_buf2 ),
     .in              (net0139 ) );
//terminator i58_5_ (
//     .TERM            (net0210[4] ) );
//terminator i58_6_ (
//     .TERM            (net0210[3] ) );
//terminator i52 (
//     .TERM            (div_ck3 ) );
//terminator i53 (
//     .TERM            (net0189 ) );
//terminator i54 (
//     .TERM            (net0136 ) );
//terminator i55 (
//     .TERM            (pll_jtag_lock_everlose ) );
//terminator i58_7_ (
//     .TERM            (net0210[2] ) );
//pfet_thox m0 (
//     .B               (vdd ),
//     .G               (vss ),
//     .D               (vdd ),
//     .S               (vdd ) );
//terminator i58_0_ (
//     .TERM            (net0210[9] ) );
//terminator i58_8_ (
//     .TERM            (net0210[1] ) );
//terminator i58_1_ (
//     .TERM            (net0210[8] ) );
//terminator i58_9_ (
//     .TERM            (net0210[0] ) );
//terminator i58_2_ (
//     .TERM            (net0210[7] ) );
//n2_core_pll_vrr_cust x0 (
//     .vdd_reg         (vdd_reg ),
//     .fltr_nw         (fltr ),
//     .reset           (net159 ),
//     .fb              (fb ),
//     .div8            (net0135 ),
//     .div4            (net080 ),
//     .div_ck          (ref ),
//     .vrr_disbl       (vss ),
//     .clamp_fltr      (net0114 ),
//     .pfd_reset       (pfd_reset ) );
n2_core_pll_pecl_all_cust x1 (
     .pll_div1        ({pll_div1 } ),
     .pll_div2        ({pll_div2 } ),
     .pll_sys_clk     ({pll_sys_clk } ),
     .regdivcr        (div_ck3 ),
     .ref_ck          (ref_ck ),
     .slow_l          (slow_l ),
     .fast            (fast ),
     .fast_l          (fast_l ),
     .pll_clamp_fltr  (net0114 ),
     .pll_lock_pulse  (pll_lock_pulse ),
     .vdd_reg         (vdd_reg ),
     .fb_ck           (fb_ck ),
     .pll_bypass_clk_en (pll_bypass ),
     .ccu_serdes_dtm  (ccu_serdes_dtm ),
     .l2clk           (l2clk ),
     .slow            (slow ),
     .slow_buf        (slow_buf ),
     .pll_jtag_lock_everlose (pll_jtag_lock_everlose ),
     .pll_lock_dyn    (pll_lock_dyn ),
     .raw_clk_byp     (bypass_clk ),
     .fast_buf        (fast_buf ),
     .l2clkc          (vco2_clk ),
     .testmode        (sel_l2clk_fbk ),
     .pll_arst_l      (pll_arst_l ),
     .ref             (ref ),
     .fb              (fb ),
     .l1clk_buf       (l1clk_buf ),
     .pfd_reset       (pfd_reset ),
     .fltr            (fltr ) );
imaginary_timed_rst imaginary_timed_rst ( 	// added timed reset to resolve d3 reset issue - mh157021
	.ref (ref), 
	.vco_clk (vco_out), 
	.pll_arst_l (pll_arst_l),
	.pll_div2 (pll_div2), 
	.timed_pll_arst_l (timed_pll_arst_l)
);

endmodule

// ================================================================== 
// mh157021: PLL LOWER LEVEL MODULE DEFINITIONS
// ================================================================== 


//  mh157021:  instance #0 (n2_core_pll_vco_sum_cust)
// 
//  Last Modified: Friday Aug 26,2005 at 03:22:07 PM PDT
//  

// module n2_core_pll_vco_sum_cust(cktree_drv ,vco_clk ,vdd_reg ,vco_out ,
//      slow ,slow_l ,fast ,fltr ,fast_l );
// 
// output		vco_clk ;
// output		vco_out ;
// input		cktree_drv ;
// input		vdd_reg ;
// input		slow ;
// input		slow_l ;
// input		fast ;
// input		fltr ;
// input		fast_l ;

module n2_core_pll_vco_sum_cust(dc_clk,volb,vdd_reg,
     slow ,slow_l ,fast ,fltr ,fast_l );

output		volb ;
input		dc_clk ;
input		vdd_reg ;
input		slow ;
input		slow_l ;
input		fast ;
input		fltr ;
input		fast_l ;

// mh157021: implemented as a dummy mod if needed 
assign volb = fast;
 
endmodule


//  mh157021:  instance #1, #7 (n2_core_pll_vdd_xing_buf_4x_cust)
// 
//  Last Modified: Friday Aug 26,2005 at 03:22:12 PM PDT
//  

module n2_core_pll_vdd_xing_buf_4x_cust(vdd_reg ,out ,in );
output		out ;
input		vdd_reg ;
input		in ;
wire vss = 1'b0;
 
assign out = in;

endmodule


//  mh157021:  instance #2 (n2_core_pll_m1_cust)
// 
//  Last Modified: Friday Aug 26,2005 at 03:20:48 PM PDT
//  

module n2_core_pll_m1_cust(vdd_reg );
input		vdd_reg ;
wire vss = 1'b0;
 
endmodule


//  mh157021:  instance #3, #9 (n2_core_pll_inv_100x_cust)
// 
//  Last Modified: Friday Aug 26,2005 at 03:20:26 PM PDT
//  

module n2_core_pll_inv_100x_cust(vdd_reg ,out ,in );
output		out ;
input		vdd_reg ;
input		in ;
wire vss = 1'b0;
 
    assign out = ~in;
 
endmodule


//  mh157021:  instance #5 (n2_vreg_cust)
// 
//  Last Modified: Friday Aug 26,2005 at 03:22:43 PM PDT
//  

module n2_vreg_cust(v1p1reg_lowv ,vdd_hv15 ,vref ,vrefb ,i50n ,selbg_l
      );
output [9:0] i50n ;
output		v1p1reg_lowv ;
output		vref ;
output		vrefb ;
input		vdd_hv15 ;
input		selbg_l ;
wire vss = 1'b0;
 
wire [9:0] i50n ;
wire [3:0]	i25 ;
wire		vgate_lowv ;
wire		net70 ;
wire		i5m ;
wire		vmid ;
wire		vrefr ;

assign v1p1reg_lowv  = 1'b1;
assign i50n = 10'b0;
assign vref = 1'b1;
assign vrefb = 1'b1;

endmodule



//  mh157021:  instance #8 (n2_core_pll_charc_cust)
// 
//  

module n2_core_pll_charc_cust(arst_l ,ccu_rst_ref_buf2_l ,testmode ,
     dr_clk_out ,ccu_rst_sys_clk ,lock ,pll_charc_out ,fb_clk_l ,
     pll_charc_in ,ref_clk_l ,fast ,slow ,ref ,fb ,vco_clk ,l1clk );
output [1:0]	pll_charc_out ;
output		ccu_rst_ref_buf2_l ;
output		ccu_rst_sys_clk ;
input		arst_l ;
input		testmode ;
input		dr_clk_out ;
input		lock ;
input		fb_clk_l ;
input		pll_charc_in ;
input		ref_clk_l ;
input		fast ;
input		slow ;
input		ref ;
input		fb ;
input		vco_clk ;
input		l1clk ;
supply1		vdd ;
 
wire [7:0]	aoa1a2_ ;
wire [9:0]	mxin ;
wire [3:0]	a3a4_ ;
wire [1:0]	a5_ ;
wire		\mxbuf[1] ;
wire		\mxbuf[9] ;
wire		out_bot ;
wire		mux_out1 ;
wire		mux_out2 ;
wire		net76 ;
wire		net77 ;
wire		clk_fall1 ;
wire		clk_fall2 ;
wire		\mxbuf[2] ;
wire		clk_fall3 ;
wire		clk_fall4 ;
wire		net224 ;
wire		out_top ;
wire		net227 ;
wire		\mxbuf[4] ;
wire		net238 ;
wire		reset ;
wire		net0232 ;
wire		a0 ;
wire		l1clk_vcoclk ;
wire		a1 ;
wire		a2 ;
wire		a3 ;
wire		net251 ;
wire		a4 ;
wire		net252 ;
wire		\mxbuf[6] ;
wire		a5 ;
wire		a6_0 ;
wire		out_cnt1 ;
wire		a6 ;
wire		a6_1 ;
wire		a7 ;
wire		\mxbuf[7] ;
wire		l1clk_vcoclk_l ;
wire		net169 ;
wire		clk_rise1 ;
wire		clk_rise2 ;
wire		clk_rise3 ;
wire		clk_rise4 ;
wire		\mxbuf[0] ;
wire		net174 ;
wire		\mxbuf[8] ;
wire		l1clk_vco_clk ;
wire		l1clk_vcoclk_div4 ;
 
 
n2_core_pll_div4_new_cust x2 (
     .clk             (l1clk_vcoclk ),
     .arst_l          (testmode ),
     .clk_div_out     (l1clk_vcoclk_div4 ) );
n2_core_pll_charc_decoder_cust x3 (
     .a5_out          ({a5_ } ),
     .a6_out          ({a6_1 ,a6_0 } ),
     .a3a4            ({a3a4_ } ),
     .aoa1a2          ({aoa1a2_ } ),
     .a6              (a6 ),
     .a5              (a5 ),
     .a4              (a4 ),
     .a3              (a3 ),
     .a2              (a2 ),
     .a1              (a1 ),
     .a0              (a0 ) );
n2_core_pll_mux8_8x_cust x4 (
     .sel0            (aoa1a2_[0] ),
     .in2             (mxin[2] ),
     .sel2            (aoa1a2_[2] ),
     .sel5            (aoa1a2_[5] ),
     .in4             (mxin[4] ),
     .sel7            (aoa1a2_[7] ),
     .sel4            (aoa1a2_[4] ),
     .in1             (mxin[9] ),
     .dout            (out_bot ),
     .in0             (mxin[0] ),
     .sel6            (aoa1a2_[6] ),
     .in5             (mxin[5] ),
     .in7             (mxin[7] ),
     .sel3            (aoa1a2_[3] ),
     .sel1            (aoa1a2_[1] ),
     .in3             (mxin[3] ),
     .in6             (mxin[6] ) );
n2_core_pll_mux2_8x_cust x5 (
     .in0             (mxin[8] ),
     .sel0            (a5_[0] ),
     .dout            (l1clk_vcoclk ),
     .sel1            (a5_[1] ),
     .in1             (mxin[1] ) );
n2_core_pll_mux2_8x_cust x6 (
     .in0             (out_bot ),
     .sel0            (a6_0 ),
     .dout            (net169 ),
     .sel1            (a6_1 ),
     .in1             (mux_out2 ) );
n2_core_pll_mux2_8x_cust x7 (
     .in0             (out_top ),
     .sel0            (a6_0 ),
     .dout            (net174 ),
     .sel1            (a6_1 ),
     .in1             (mux_out1 ) );
//terminator ia_4_ (
//     .TERM            (\mxbuf[6] ) );
n2_core_pll_buf_16x_cust x42_7_ (
     .vdd_reg         (vdd ),
     .out             (\mxbuf[9] ),
     .in              (mxin[9] ) );
n2_core_pll_buf_16x_cust x44_3_ (
     .vdd_reg         (vdd ),
     .out             (mxin[3] ),
     .in              (ref_clk_l ) );
//terminator ia_5_ (
//     .TERM            (\mxbuf[7] ) );
n2_core_pll_buf_16x_cust x42_0_ (
     .vdd_reg         (vdd ),
     .out             (\mxbuf[0] ),
     .in              (mxin[0] ) );
n2_core_pll_buf_16x_cust x44_4_ (
     .vdd_reg         (vdd ),
     .out             (mxin[4] ),
     .in              (fb ) );
n2_core_pll_4bit_counter_charc_cust x12 (
     .clk             (out_cnt1 ),
     .reset           (net77 ),
     .cnt3            (vdd ),
     .qout_0          (a4 ),
     .qout_1          (a5 ),
     .qout_2          (a6 ),
     .qout_3          (a7 ),
     .count_out       (net252 ),
     .cnt1            (vdd ),
     .cnt2            (vdd ),
     .cnt0            (vdd ) );
n2_core_pll_4bit_counter_charc_cust x15 (
     .clk             (pll_charc_in ),
     .reset           (net77 ),
     .cnt3            (vdd ),
     .qout_0          (a0 ),
     .qout_1          (a1 ),
     .qout_2          (a2 ),
     .qout_3          (a3 ),
     .count_out       (out_cnt1 ),
     .cnt1            (vdd ),
     .cnt2            (vdd ),
     .cnt0            (vdd ) );
n2_core_pll_charc_flops_cust x16 (
     .data_in         (net238 ),
     .clk             (l1clk_vco_clk ),
     .clk_l           (l1clk_vcoclk_l ),
     .clk_rise1       (clk_rise1 ),
     .clk_fall1       (clk_fall1 ),
     .clk_rise2       (clk_rise2 ),
     .clk_fall2       (clk_fall2 ),
     .reset           (net77 ),
     .clk_rise4       (clk_rise4 ),
     .clk_rise3       (clk_rise3 ),
     .clk_fall3       (clk_fall3 ),
     .clk_fall4       (clk_fall4 ) );
n2_core_pll_charc_mux_cust x17 (
     .a3a4_           ({a3a4_ } ),
     .aoa1a2_         ({aoa1a2_ } ),
     .clk_fall2       (clk_fall2 ),
     .clk_fall3       (clk_fall3 ),
     .clk_fall4       (clk_fall4 ),
     .clk_fall1       (clk_fall1 ),
     .clk_rise3       (clk_rise3 ),
     .clk_rise2       (clk_rise2 ),
     .clk_rise4       (clk_rise4 ),
     .clk_rise1       (clk_rise1 ),
     .mux_out1        (mux_out1 ),
     .mux_out2        (mux_out2 ) );
//terminator ia_6_ (
//     .TERM            (\mxbuf[8] ) );
n2_core_pll_buf_16x_cust x42_1_ (
     .vdd_reg         (vdd ),
     .out             (\mxbuf[1] ),
     .in              (mxin[1] ) );
n2_core_pll_buf_16x_cust x44_5_ (
     .vdd_reg         (vdd ),
     .out             (mxin[5] ),
     .in              (ref ) );
//terminator ia_7_ (
//     .TERM            (\mxbuf[9] ) );
n2_core_pll_buf_16x_cust x42_2_ (
     .vdd_reg         (vdd ),
     .out             (\mxbuf[2] ),
     .in              (mxin[2] ) );
n2_core_pll_buf_16x_cust x44_6_ (
     .vdd_reg         (vdd ),
     .out             (mxin[6] ),
     .in              (slow ) );
n2_core_pll_inv_16x_cust x34 (
     .vdd_reg         (vdd ),
     .out             (l1clk_vcoclk_l ),
     .in              (l1clk_vcoclk ) );
n2_core_pll_buf_16x_cust x35 (
     .vdd_reg         (vdd ),
     .out             (l1clk_vco_clk ),
     .in              (l1clk_vcoclk ) );
n2_core_pll_buf_16x_cust x36 (
     .vdd_reg         (vdd ),
     .out             (net238 ),
     .in              (net76 ) );
n2_core_pll_inv_16x_cust x37 (
     .vdd_reg         (vdd ),
     .out             (net224 ),
     .in              (net174 ) );
n2_core_pll_inv_16x_cust x38 (
     .vdd_reg         (vdd ),
     .out             (net227 ),
     .in              (net169 ) );
n2_core_pll_inv_32x_cust x39 (
     .vdd_reg         (vdd ),
     .out             (pll_charc_out[1] ),
     .in              (net224 ) );
//terminator ia_0_ (
//     .TERM            (\mxbuf[0] ) );
n2_core_pll_buf_16x_cust x42_3_ (
     .vdd_reg         (vdd ),
     .out             (\mxbuf[4] ),
     .in              (mxin[4] ) );
n2_core_pll_buf_16x_cust x44_7_ (
     .vdd_reg         (vdd ),
     .out             (mxin[7] ),
     .in              (fast ) );
n2_core_pll_inv_32x_cust x40 (
     .vdd_reg         (vdd ),
     .out             (pll_charc_out[0] ),
     .in              (net227 ) );
n2_core_pll_inv_2x_cust x41 (
     .vdd_reg         (vdd ),
     .out             (reset ),
     .in              (arst_l ) );
n2_core_pll_buf_16x_cust x43 (
     .vdd_reg         (vdd ),
     .out             (net77 ),
     .in              (reset ) );
n2_core_pll_inv_32x_cust x46 (
     .vdd_reg         (vdd ),
     .out             (ccu_rst_ref_buf2_l ),
     .in              (mxin[5] ) );
n2_core_pll_inv_32x_cust x47 (
     .vdd_reg         (vdd ),
     .out             (ccu_rst_sys_clk ),
     .in              (net0232 ) );
n2_core_pll_inv_16x_cust x48 (
     .vdd_reg         (vdd ),
     .out             (net0232 ),
     .in              (mxin[3] ) );
//terminator ia_1_ (
//     .TERM            (\mxbuf[1] ) );
n2_core_pll_buf_16x_cust x42_4_ (
     .vdd_reg         (vdd ),
     .out             (\mxbuf[6] ),
     .in              (mxin[6] ) );
n2_core_pll_buf_16x_cust x44_0_ (
     .vdd_reg         (vdd ),
     .out             (mxin[0] ),
     .in              (lock ) );
n2_core_pll_buf_16x_cust x44_8_ (
     .vdd_reg         (vdd ),
     .out             (mxin[8] ),
     .in              (l1clk ) );
//terminator ix10 (
//     .TERM            (a7 ) );
//terminator ia_2_ (
//     .TERM            (\mxbuf[2] ) );
n2_core_pll_buf_16x_cust x42_5_ (
     .vdd_reg         (vdd ),
     .out             (\mxbuf[7] ),
     .in              (mxin[7] ) );
n2_core_pll_buf_16x_cust x44_1_ (
     .vdd_reg         (vdd ),
     .out             (mxin[1] ),
     .in              (vco_clk ) );
n2_core_pll_buf_16x_cust x44_9_ (
     .vdd_reg         (vdd ),
     .out             (mxin[9] ),
     .in              (dr_clk_out ) );
//terminator ia_3_ (
//     .TERM            (\mxbuf[4] ) );
//terminator ix6 (
//     .TERM            (net251 ) );
//terminator ix7 (
//     .TERM            (net252 ) );
n2_core_pll_buf_16x_cust x42_6_ (
     .vdd_reg         (vdd ),
     .out             (\mxbuf[8] ),
     .in              (mxin[8] ) );
n2_core_pll_buf_16x_cust x44_2_ (
     .vdd_reg         (vdd ),
     .out             (mxin[2] ),
     .in              (fb_clk_l ) );
n2_core_pll_flop_reset_new_cust x0 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (l1clk_vcoclk_div4 ),
     .reset           (net77 ),
     .clk             (l1clk_vcoclk_l ),
     .q_l             (net251 ),
     .q               (net76 ) );
n2_core_pll_mux8_8x_cust x1 (
     .sel0            (aoa1a2_[0] ),
     .in2             (mxin[3] ),
     .sel2            (aoa1a2_[2] ),
     .sel5            (aoa1a2_[5] ),
     .in4             (mxin[5] ),
     .sel7            (aoa1a2_[7] ),
     .sel4            (aoa1a2_[4] ),
     .in1             (mxin[1] ),
     .dout            (out_top ),
     .in0             (mxin[1] ),
     .sel6            (aoa1a2_[6] ),
     .in5             (mxin[4] ),
     .in7             (mxin[6] ),
     .sel3            (aoa1a2_[3] ),
     .sel1            (aoa1a2_[1] ),
     .in3             (mxin[2] ),
     .in6             (mxin[7] ) );
endmodule



//  mh157021:  instance #10 (n2_core_pll_pad_cluster_cust)
// 
//  Last Modified: Friday Aug 26,2005 at 03:21:04 PM PDT
//  

module n2_core_pll_pad_cluster_cust(vdd_hv15 ,pll_sys_clk );
input [1:0]	pll_sys_clk ;
input		vdd_hv15 ;
supply1		vdd ;
 
endmodule



//  mh157021:  instance #11 (n2_core_pll_vrr_cust)
// 
//  Last Modified: Friday Aug 26,2005 at 03:22:17 PM PDT
//  

module n2_core_pll_vrr_cust(vdd_reg ,fltr_nw ,reset ,fb ,div8 ,div4 ,
     div_ck ,vrr_disbl ,clamp_fltr ,pfd_reset );
input		vdd_reg ;
input		reset ;
input		fb ;
input		div8 ;
input		div4 ;
input		div_ck ;
input		vrr_disbl ;
input		clamp_fltr ;
input		pfd_reset ;
inout		fltr_nw ;
wire vss = 1'b0;
 
endmodule



//  mh157021:  instance #12 (n2_core_pll_pecl_all_cust)
// 
//  

module n2_core_pll_pecl_all_cust(regdivcr ,ref_ck ,slow_l ,fast ,fast_l
      ,pll_clamp_fltr ,pll_lock_pulse ,vdd_reg ,fb_ck ,pll_bypass_clk_en
      ,ccu_serdes_dtm ,l2clk ,slow ,slow_buf ,pll_jtag_lock_everlose ,
     pll_lock_dyn ,raw_clk_byp ,fast_buf ,l2clkc ,testmode ,pll_arst_l ,
     pll_div1 ,pll_div2 ,ref ,fb ,pll_sys_clk ,l1clk_buf ,pfd_reset ,
     fltr );
input [5:0]	pll_div1 ;
input [5:0]	pll_div2 ;
input [1:0]	pll_sys_clk ;
output		regdivcr ;
output		ref_ck ;
output		slow_l ;
output		fast ;
output		fast_l ;
output		pll_lock_pulse ;
output		fb_ck ;
output		slow ;
output		slow_buf ;
output		pll_jtag_lock_everlose ;
output		pll_lock_dyn ;
output		raw_clk_byp ;
output		fast_buf ;
output		ref ;
output		fb ;
output		l1clk_buf ;
output		pfd_reset ;
output		fltr ;
input		pll_clamp_fltr ;
input		vdd_reg ;
input		pll_bypass_clk_en ;
input		ccu_serdes_dtm ;
input		l2clk ;
input		l2clkc ;
input		testmode ;
input		pll_arst_l ;
supply1		vdd ;
 
wire [5:0]	net0142 ;
wire [5:0]	net0111 ;
wire [1:0]	arst ;
wire		net0178 ;
wire		l1clk_p ;
wire		net0207 ;
wire		regdiv ;
wire		fb_ckn ;
wire		ref_ck_lock ;
wire		net0164 ;
wire		bypass_clk ;
wire		net0234 ;
wire		net0139 ;
wire		net153 ;
wire		net155 ;
wire		ref_ckn ;
wire		net0110 ;
wire		l1clk ;
wire		l1clk_l ;
wire		net0118 ;
wire		fb_ck_lock ;
wire		l1clk_n ;
wire		net0120 ;
wire		net0122 ;
wire		net0124 ;
 
 
n2_core_pll_pecl_bypass_clk_cust x2 (
     .phase_ck        (bypass_clk ),
     .pecl_p          (pll_sys_clk[0] ),
     .pecl_n          (pll_sys_clk[1] ) );
//n2_core_pll_inv_8x_cust x3 (
//     .vdd_reg         (vdd ),
//     .out             (fb_ck_lock ),
//     .in              (net0118 ) );
//terminator ixop2_5_ (
//     .TERM            (net0142[0] ) );
//n2_core_pll_inv_16x_cust x4 (
//     .vdd_reg         (vdd ),
//     .out             (pll_lock_dyn ),
//     .in              (net0122 ) );
//n2_core_pll_inv_8x_cust x5 (
//     .vdd_reg         (vdd ),
//     .out             (net0207 ),
//     .in              (pll_arst_l ) );
//n2_core_pll_inv_8x_cust x6 (
//     .vdd_reg         (vdd ),
//     .out             (net0178 ),
//     .in              (ref_ck ) );
n2_core_pll_delay_cust xdel1 (
     .vdd_reg         (vdd_reg ),
     .out_delcr       (regdivcr ),
     .in              (pll_arst_l ),
     .out_del         (regdiv ) );
//n2_core_pll_inv_4x_cust x7 (
//     .vdd_reg         (vdd ),
//     .out             (net0122 ),
//     .in              (net0124 ) );
n2_core_pll_tpm_cust x8 (
     .ip              ({pll_div2 } ),
     .op              ({net0142[0] ,net0142[1] ,net0142[2] ,net0142[3] ,
            net0142[4] ,net0142[5] } ),
     .reset           (arst[0] ),
     .vdd_reg         (vdd_reg ),
     .sel             (net0120 ),
     .div_ck_i        (regdiv ),
     .pwr_rst         (arst[1] ),
     .div_ck          (fb ),
     .vco_ck          (fb_ckn ) );
n2_core_pll_inv_16x_cust x9 (
     .vdd_reg         (vdd ),
     .out             (l1clk_buf ),
     .in              (net0139 ) );
n2_core_pll_inv_8x_cust x1_1_ (
     .vdd_reg         (vdd_reg ),
     .out             (arst[1] ),
     .in              (net0164 ) );
//terminator ixop1_0_ (
//     .TERM            (net0111[5] ) );
//n2_core_pll_inv_4x_cust x10 (
//     .vdd_reg         (vdd ),
//     .out             (net0118 ),
//     .in              (fb_ck ) );
//n2_core_pll_inv_32x_cust x11 (
//     .vdd_reg         (vdd ),
//     .out             (ref_ck_lock ),
//     .in              (net0178 ) );
n2_core_pll_pecl_enb_cust x12 (
     .in              (bypass_clk ),
     .out             (raw_clk_byp ),
     .enb1            (ccu_serdes_dtm ),
     .enb0            (pll_bypass_clk_en ) );
n2_core_pll_inv_16x_cust x13 (
     .vdd_reg         (vdd_reg ),
     .out             (l1clk_n ),
     .in              (l1clk ) );
//n2_core_pll_buf_4x_cust x14 (
//     .vdd_reg         (vdd ),
//     .out             (net0234 ),
//     .in              (l1clk ) );
n2_core_pll_buf_4x_cust x15 (
     .vdd_reg         (vdd ),
     .out             (net0139 ),
     .in              (l1clk_l ) );
n2_core_pll_vdd_xing_buf_32x_cust x16 (
     .vdd_reg         (vdd ),
     .out             (fb_ck ),
     .in              (fb_ckn ) );
n2_core_pll_vdd_xing_buf_32x_cust x17 (
     .vdd_reg         (vdd ),
     .out             (ref_ck ),
     .in              (ref_ckn ) );
//terminator ixop1_1_ (
//     .TERM            (net0111[4] ) );
n2_core_pll_vdd_xing_buf_4x_cust x18 (
     .vdd_reg         (vdd_reg ),
     .out             (net0164 ),
     .in              (pll_arst_l ) );
n2_core_pll_inv_16x_cust x19 (
     .vdd_reg         (vdd_reg ),
     .out             (l1clk_p ),
     .in              (l1clk_l ) );
//terminator ixop2_0_ (
//     .TERM            (net0142[5] ) );
//terminator ixop1_2_ (
//     .TERM            (net0111[3] ) );
n2_core_pll_pecl_cust xpcl (
     .vdd_reg         (vdd_reg ),
     .fb_ck           (fb_ckn ),
     .pecl_p          (pll_sys_clk[0] ),
     .pecl_n          (pll_sys_clk[1] ),
     .hdr_p           (l1clk_p ),
     .ref_ck          (ref_ckn ),
     .hdr_n           (l1clk_n ) );
//terminator ixop2_1_ (
//     .TERM            (net0142[4] ) );
//terminator ixop1_3_ (
//     .TERM            (net0111[2] ) );
n2_core_pll_tpm_cust xd1 (
     .ip              ({pll_div1 } ),
     .op              ({net0111[0] ,net0111[1] ,net0111[2] ,net0111[3] ,
            net0111[4] ,net0111[5] } ),
     .reset           (arst[1] ),
     .vdd_reg         (vdd_reg ),
     .sel             (net0110 ),
     .div_ck_i        (regdiv ),
     .pwr_rst         (arst[0] ),
     .div_ck          (ref ),
     .vco_ck          (ref_ckn ) );
//terminator ixop2_2_ (
//     .TERM            (net0142[3] ) );
//terminator ixop1_4_ (
//     .TERM            (net0111[1] ) );
n2_core_pll_se2diff_mux_cust xil1clk_hdr (
     .vdd_reg         (vdd ),
     .in1             (l2clk ),
     .sel             (testmode ),
     .out             (l1clk ),
     .in0             (l2clkc ),
     .out_l           (l1clk_l ) );
//n2_core_pll_pfd_cust xpfd (
//     .vdd_reg         (vdd_reg ),
//     .f_buf           (fast_buf ),
//     .f_buf_l         (net155 ),
//     .fast_l          (fast_l ),
//     .clamp_fltr      (pll_clamp_fltr ),
//     .s_buf           (slow_buf ),
//     .s_buf_l         (net153 ),
//     .slow_l          (slow_l ),
//     .slow            (slow ),
//     .fast            (fast ),
//     .pfd_reset       (pfd_reset ),
//     .fb              (fb ),
//     .ref             (ref ) );
//terminator ixop2_3_ (
//     .TERM            (net0142[2] ) );
//terminator ixop1_5_ (
//     .TERM            (net0111[0] ) );
//terminator i207 (
//     .TERM            (net0234 ) );
//terminator ixop2_4_ (
//     .TERM            (net0142[1] ) );
//terminator ix25 (
//     .TERM            (net0110 ) );
//terminator ix27 (
//     .TERM            (net153 ) );
//terminator ix28 (
//     .TERM            (net155 ) );
n2_core_pll_inv_8x_cust x1_0_ (
     .vdd_reg         (vdd_reg ),
     .out             (arst[0] ),
     .in              (net0164 ) );
//terminator ix8 (
//     .TERM            (net0120 ) );
//n2_core_pll_cp_cust xcp (
//     .slow_l          (slow_l ),
//     .vdd_reg         (vdd_reg ),
//     .slow            (slow ),
//     .fast            (fast ),
//     .fast_l          (fast_l ),
//     .fltr            (fltr ) );
//n2_core_pll_lockdet_cust x0 (
//     .pll_jtag_lock_everlose (pll_jtag_lock_everlose ),
//     .l1clk           (fb_ck_lock ),
//     .pll_lock_dyn    (net0124 ),
//     .reset_in        (net0207 ),
//     .slow            (slow_buf ),
//     .fast            (fast_buf ),
//     .pll_lock_pulse  (pll_lock_pulse ),
//     .ref_ck          (ref_ck_lock ) );
imaginary_vco_gen imaginary_vco_gen (
	 .pll_arst_l (pll_arst_l),
	 .sysclk (ref), 
	 .fdbkclk (fast),
	 .div ({pll_div2[4:0], 1'b1}),	// x2 since D3 == 2 (eff) always
	 .vco_out (fast)
);
endmodule


//  mh157021: lower level module definition (n2_core_pll_inv_2x_cust)
// 
//  Last Modified: Friday Aug 26,2005 at 03:20:31 PM PDT
//  

module n2_core_pll_inv_2x_cust(vdd_reg ,out ,in );
output		out ;
input		vdd_reg ;
input		in ;
wire vss = 1'b0;
 
assign out = ~in; 

endmodule






//  mh157021: lower level module definition (n2_core_pll_mux2_8x_cust)
// 
//  Last Modified: Friday Aug 26,2005 at 03:20:51 PM PDT
//  

module n2_core_pll_mux2_8x_cust(in0 ,sel0 ,dout ,sel1 ,in1 );
output		dout ;
input		in0 ;
input		sel0 ;
input		sel1 ;
input		in1 ;
 
mux2 x1 (
     .sel0 (sel0),
     .sel1 (sel1),
     .in0 (in0),
     .in1 (in1),
     .y (dout) );

endmodule


//  mh157021: lower level module definition (mux2)
module mux2 (in0,in1,sel0,sel1,y);

input sel0,sel1;
input in0,in1;

output y;

reg y; 

always @(sel0 or sel1 or in0 or in1)
begin
  case ( {sel1, sel0} )
    2'b01: y <= in0;
    2'b10: y <= in1;
  endcase
end

endmodule

//  mh157021: lower level module definition (n2_core_pll_mux8_8x_cust)
// 
//  Last Modified: Friday Aug 26,2005 at 03:20:53 PM PDT
//  

module n2_core_pll_mux8_8x_cust(sel0 ,in2 ,sel2 ,sel5 ,in4 ,sel7 ,sel4 ,
     in1 ,dout ,in0 ,sel6 ,in5 ,in7 ,sel3 ,sel1 ,in3 ,in6 );
output		dout ;
input		sel0 ;
input		in2 ;
input		sel2 ;
input		sel5 ;
input		in4 ;
input		sel7 ;
input		sel4 ;
input		in1 ;
input		in0 ;
input		sel6 ;
input		in5 ;
input		in7 ;
input		sel3 ;
input		sel1 ;
input		in3 ;
input		in6 ;
 
mux8 x1 (
     .sel0 (sel0),
     .sel1 (sel1),
     .sel2 (sel2),
     .sel3 (sel3),
     .sel4 (sel4),
     .sel5 (sel5),
     .sel6 (sel6),
     .sel7 (sel7),
     .in0 (in0),
     .in1 (in1),
     .in2 (in2),
     .in3 (in3),
     .in4 (in4),
     .in5 (in5),
     .in6 (in6),
     .in7 (in7),
	 .muxtst (1'b0),  		// compile warning - mh157021 
     .dout (dout) );		// compile error ".y (dout)" - mh157021 

endmodule



//  mh157021: lower level module definition (n2_core_pll_charc_decoder_cust)
// 
//  Last Modified: Friday Aug 26,2005 at 03:19:12 PM PDT
//  

module n2_core_pll_charc_decoder_cust(a5_out ,a6_out ,a6 ,a5 ,a3a4 ,a4 ,
     a3 ,aoa1a2 ,a2 ,a1 ,a0 );
output [1:0]	a5_out ;
output [1:0]	a6_out ;
output [3:0]	a3a4 ;
output [7:0]	aoa1a2 ;
input		a6 ;
input		a5 ;
input		a4 ;
input		a3 ;
input		a2 ;
input		a1 ;
input		a0 ;
supply1		vdd ;
 
wire		net188 ;
wire		net191 ;
wire		net194 ;
wire		net197 ;
wire		a0_buf ;
wire		a1_buf ;
wire		a2_buf ;
wire		a3_buf ;
wire		a4_buf ;
wire		net144 ;
wire		net153 ;
wire		a0_inv ;
wire		a1_inv ;
wire		a2_inv ;
wire		a3_inv ;
wire		a4_inv ;
wire		net179 ;
 
 
n2_core_pll_and3_16x_cust x2 (
     .out             (aoa1a2[2] ),
     .in2             (a0_inv ),
     .in1             (a1_buf ),
     .in0             (a2_inv ) );
n2_core_pll_and3_16x_cust x3 (
     .out             (aoa1a2[3] ),
     .in2             (a0_buf ),
     .in1             (a1_buf ),
     .in0             (a2_inv ) );
n2_core_pll_inv_4x_cust x4 (
     .vdd_reg         (vdd ),
     .out             (net197 ),
     .in              (a0 ) );
n2_core_pll_inv_4x_cust x5 (
     .vdd_reg         (vdd ),
     .out             (net188 ),
     .in              (a3 ) );
n2_core_pll_buf_16x_cust x6 (
     .vdd_reg         (vdd ),
     .out             (a2_buf ),
     .in              (a2 ) );
n2_core_pll_buf_16x_cust x7 (
     .vdd_reg         (vdd ),
     .out             (a3_buf ),
     .in              (a3 ) );
n2_core_pll_and3_16x_cust x8 (
     .out             (aoa1a2[4] ),
     .in2             (a0_inv ),
     .in1             (a1_inv ),
     .in0             (a2_buf ) );
n2_core_pll_and3_16x_cust x9 (
     .out             (aoa1a2[5] ),
     .in2             (a0_buf ),
     .in1             (a1_inv ),
     .in0             (a2_buf ) );
n2_core_pll_and3_16x_cust x10 (
     .out             (aoa1a2[6] ),
     .in2             (a0_inv ),
     .in1             (a1_buf ),
     .in0             (a2_buf ) );
n2_core_pll_and3_16x_cust x11 (
     .out             (aoa1a2[7] ),
     .in2             (a0_buf ),
     .in1             (a1_buf ),
     .in0             (a2_buf ) );
n2_core_pll_and2_16x_cust x12 (
     .out             (a3a4[0] ),
     .in1             (a3_inv ),
     .in0             (a4_inv ) );
n2_core_pll_and2_16x_cust x13 (
     .out             (a3a4[1] ),
     .in1             (a3_buf ),
     .in0             (a4_inv ) );
n2_core_pll_buf_16x_cust x14 (
     .vdd_reg         (vdd ),
     .out             (a1_buf ),
     .in              (a1 ) );
n2_core_pll_buf_16x_cust x15 (
     .vdd_reg         (vdd ),
     .out             (a0_buf ),
     .in              (a0 ) );
n2_core_pll_buf_16x_cust x16 (
     .vdd_reg         (vdd ),
     .out             (a2_inv ),
     .in              (net191 ) );
n2_core_pll_buf_16x_cust x17 (
     .vdd_reg         (vdd ),
     .out             (a1_inv ),
     .in              (net194 ) );
n2_core_pll_buf_16x_cust x18 (
     .vdd_reg         (vdd ),
     .out             (a0_inv ),
     .in              (net197 ) );
n2_core_pll_inv_4x_cust x19 (
     .vdd_reg         (vdd ),
     .out             (net194 ),
     .in              (a1 ) );
n2_core_pll_inv_4x_cust x20 (
     .vdd_reg         (vdd ),
     .out             (net191 ),
     .in              (a2 ) );
n2_core_pll_buf_16x_cust x21 (
     .vdd_reg         (vdd ),
     .out             (a4_buf ),
     .in              (a4 ) );
n2_core_pll_buf_16x_cust x22 (
     .vdd_reg         (vdd ),
     .out             (a4_inv ),
     .in              (net153 ) );
n2_core_pll_buf_16x_cust x23 (
     .vdd_reg         (vdd ),
     .out             (a3_inv ),
     .in              (net188 ) );
n2_core_pll_inv_4x_cust x24 (
     .vdd_reg         (vdd ),
     .out             (net153 ),
     .in              (a4 ) );
n2_core_pll_buf_16x_cust x25 (
     .vdd_reg         (vdd ),
     .out             (a5_out[0] ),
     .in              (net179 ) );
n2_core_pll_and2_16x_cust x26 (
     .out             (a3a4[2] ),
     .in1             (a3_inv ),
     .in0             (a4_buf ) );
n2_core_pll_and2_16x_cust x27 (
     .out             (a3a4[3] ),
     .in1             (a3_buf ),
     .in0             (a4_buf ) );
n2_core_pll_buf_16x_cust x28 (
     .vdd_reg         (vdd ),
     .out             (a6_out[0] ),
     .in              (net144 ) );
n2_core_pll_buf_16x_cust x39 (
     .vdd_reg         (vdd ),
     .out             (a6_out[1] ),
     .in              (a6 ) );
n2_core_pll_buf_16x_cust x40 (
     .vdd_reg         (vdd ),
     .out             (a5_out[1] ),
     .in              (a5 ) );
n2_core_pll_inv_4x_cust x41 (
     .vdd_reg         (vdd ),
     .out             (net144 ),
     .in              (a6 ) );
n2_core_pll_inv_4x_cust x42 (
     .vdd_reg         (vdd ),
     .out             (net179 ),
     .in              (a5 ) );
n2_core_pll_and3_16x_cust x0 (
     .out             (aoa1a2[0] ),
     .in2             (a0_inv ),
     .in1             (a1_inv ),
     .in0             (a2_inv ) );
n2_core_pll_and3_16x_cust x1 (
     .out             (aoa1a2[1] ),
     .in2             (a0_buf ),
     .in1             (a1_inv ),
     .in0             (a2_inv ) );
endmodule


//  mh157021: lower level module definition (n2_core_pll_charc_flops_cust)
// 
//  Last Modified: Friday Aug 26,2005 at 03:19:13 PM PDT
//  

module n2_core_pll_charc_flops_cust(data_in ,clk ,clk_l ,clk_rise1 ,
     clk_fall1 ,clk_rise2 ,clk_fall2 ,reset ,clk_rise4 ,clk_rise3 ,
     clk_fall3 ,clk_fall4 );
output		clk_rise1 ;
output		clk_fall1 ;
output		clk_rise2 ;
output		clk_fall2 ;
output		clk_rise4 ;
output		clk_rise3 ;
output		clk_fall3 ;
output		clk_fall4 ;
input		data_in ;
input		clk ;
input		clk_l ;
input		reset ;
supply1		vdd ;
 
wire		net200 ;
wire		net107 ;
wire		net205 ;
wire		net092 ;
wire		net191 ;
wire		net094 ;
wire		net193 ;
wire		net0186 ;
wire		net213 ;
wire		net116 ;
wire		net214 ;
wire		net88 ;
wire		net221 ;
wire		net227 ;
wire		net229 ;
wire		net130 ;
wire		net231 ;
wire		net233 ;
wire		net137 ;
wire		net235 ;
wire		net237 ;
wire		net239 ;
wire		net142 ;
wire		net241 ;
wire		net243 ;
wire		net245 ;
wire		net247 ;
wire		net149 ;
wire		net249 ;
wire		net151 ;
wire		net255 ;
wire		net256 ;
wire		net158 ;
wire		net257 ;
wire		net0193 ;
wire		net165 ;
wire		net265 ;
wire		net267 ;
wire		net268 ;
wire		net170 ;
wire		net172 ;
wire		net270 ;
wire		net177 ;
wire		net179 ;
wire		net100 ;
 
 
n2_core_pll_flop_reset_new_1x_cust x2 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (data_in ),
     .reset           (net213 ),
     .clk             (clk_l ),
     .q_l             (net172 ),
     .q               (net170 ) );
n2_core_pll_flop_reset_new_1x_cust x3 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net233 ),
     .reset           (net213 ),
     .clk             (clk_l ),
     .q_l             (net165 ),
     .q               (net0193 ) );
n2_core_pll_flop_reset_new_1x_cust x4 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net239 ),
     .reset           (net213 ),
     .clk             (clk_l ),
     .q_l             (net257 ),
     .q               (net142 ) );
n2_core_pll_flop_reset_new_1x_cust x5 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net249 ),
     .reset           (net213 ),
     .clk             (clk ),
     .q_l             (net151 ),
     .q               (net149 ) );
n2_core_pll_flop_reset_new_1x_cust x6 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net231 ),
     .reset           (net213 ),
     .clk             (clk ),
     .q_l             (net158 ),
     .q               (net0186 ) );
n2_core_pll_flop_reset_new_1x_cust x7 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (data_in ),
     .reset           (net213 ),
     .clk             (clk ),
     .q_l             (net179 ),
     .q               (net177 ) );
n2_core_pll_flop_reset_new_1x_cust x8 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (data_in ),
     .reset           (net213 ),
     .clk             (clk ),
     .q_l             (net267 ),
     .q               (net100 ) );
n2_core_pll_flop_reset_new_1x_cust x9 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (data_in ),
     .reset           (net213 ),
     .clk             (clk_l ),
     .q_l             (net268 ),
     .q               (net107 ) );
n2_core_pll_flop_reset_new_1x_cust x10 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net241 ),
     .reset           (net213 ),
     .clk             (clk_l ),
     .q_l             (net116 ),
     .q               (net094 ) );
n2_core_pll_flop_reset_new_1x_cust x11 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net245 ),
     .reset           (net213 ),
     .clk             (clk ),
     .q_l             (net265 ),
     .q               (net092 ) );
n2_core_pll_bufi_4x_cust x12 (
     .vdd_reg         (vdd ),
     .out             (net245 ),
     .in              (net267 ) );
n2_core_pll_bufi_4x_cust x13 (
     .vdd_reg         (vdd ),
     .out             (net247 ),
     .in              (net265 ) );
n2_core_pll_bufi_4x_cust x14 (
     .vdd_reg         (vdd ),
     .out             (net243 ),
     .in              (net116 ) );
n2_core_pll_bufi_4x_cust x15 (
     .vdd_reg         (vdd ),
     .out             (net241 ),
     .in              (net268 ) );
n2_core_pll_bufi_4x_cust x17 (
     .vdd_reg         (vdd ),
     .out             (net229 ),
     .in              (net255 ) );
n2_core_pll_bufi_4x_cust x18 (
     .vdd_reg         (vdd ),
     .out             (net227 ),
     .in              (net193 ) );
n2_core_pll_bufi_4x_cust x19 (
     .vdd_reg         (vdd ),
     .out             (net233 ),
     .in              (net172 ) );
n2_core_pll_bufi_4x_cust x20 (
     .vdd_reg         (vdd ),
     .out             (net231 ),
     .in              (net179 ) );
n2_core_pll_bufi_4x_cust x21 (
     .vdd_reg         (vdd ),
     .out             (net249 ),
     .in              (net158 ) );
n2_core_pll_bufi_4x_cust x22 (
     .vdd_reg         (vdd ),
     .out             (net239 ),
     .in              (net165 ) );
n2_core_pll_bufi_4x_cust x23 (
     .vdd_reg         (vdd ),
     .out             (net237 ),
     .in              (net257 ) );
n2_core_pll_bufi_4x_cust x24 (
     .vdd_reg         (vdd ),
     .out             (net235 ),
     .in              (net151 ) );
n2_core_pll_buf_16x_cust x33 (
     .vdd_reg         (vdd ),
     .out             (net213 ),
     .in              (reset ) );
n2_core_pll_flop_reset_new_cust x34 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net227 ),
     .reset           (net213 ),
     .clk             (clk_l ),
     .q_l             (net256 ),
     .q               (clk_fall2 ) );
n2_core_pll_flop_reset_new_cust x35 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net229 ),
     .reset           (net213 ),
     .clk             (clk ),
     .q_l             (net200 ),
     .q               (clk_rise2 ) );
n2_core_pll_flop_reset_new_cust x37 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (data_in ),
     .reset           (net213 ),
     .clk             (clk_l ),
     .q_l             (net214 ),
     .q               (clk_fall1 ) );
n2_core_pll_flop_reset_new_cust x38 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (data_in ),
     .reset           (net213 ),
     .clk             (clk ),
     .q_l             (net221 ),
     .q               (clk_rise1 ) );
n2_core_pll_flop_reset_new_cust x41 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net247 ),
     .reset           (net213 ),
     .clk             (clk ),
     .q_l             (net88 ),
     .q               (clk_rise3 ) );
n2_core_pll_flop_reset_new_cust x42 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net243 ),
     .reset           (net213 ),
     .clk             (clk_l ),
     .q_l             (net270 ),
     .q               (clk_fall3 ) );
n2_core_pll_flop_reset_new_cust x49 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net237 ),
     .reset           (net213 ),
     .clk             (clk_l ),
     .q_l             (net130 ),
     .q               (clk_fall4 ) );
n2_core_pll_flop_reset_new_cust x50 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (net235 ),
     .reset           (net213 ),
     .clk             (clk ),
     .q_l             (net137 ),
     .q               (clk_rise4 ) );
n2_core_pll_flop_reset_new_1x_cust x0 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (data_in ),
     .reset           (net213 ),
     .clk             (clk ),
     .q_l             (net255 ),
     .q               (net205 ) );
n2_core_pll_flop_reset_new_1x_cust x1 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (data_in ),
     .reset           (net213 ),
     .clk             (clk_l ),
     .q_l             (net193 ),
     .q               (net191 ) );
endmodule

//  mh157021: lower level module definition (n2_core_pll_charc_mux_cust)
// 
//  Last Modified: Friday Aug 26,2005 at 03:19:16 PM PDT
//  

module n2_core_pll_charc_mux_cust(clk_fall2 ,clk_fall3 ,clk_fall4 ,
     clk_fall1 ,clk_rise3 ,clk_rise2 ,clk_rise4 ,clk_rise1 ,mux_out1 ,
     mux_out2 ,a3a4_ ,aoa1a2_ );
input [3:0]	a3a4_ ;
input [7:0]	aoa1a2_ ;
output		mux_out1 ;
output		mux_out2 ;
input		clk_fall2 ;
input		clk_fall3 ;
input		clk_fall4 ;
input		clk_fall1 ;
input		clk_rise3 ;
input		clk_rise2 ;
input		clk_rise4 ;
input		clk_rise1 ;
 
wire [7:0]	mux_in ;
wire [7:0]	mux_in1 ;
 
 
n2_core_pll_mux4_8x_cust x18 (
     .sel2            (a3a4_[2] ),
     .sel3            (a3a4_[3] ),
     .in2             (clk_fall1 ),
     .in3             (clk_rise2 ),
     .sel0            (a3a4_[0] ),
     .sel1            (a3a4_[1] ),
     .dout            (mux_in[0] ),
     .in0             (clk_rise1 ),
     .in1             (clk_rise1 ) );
n2_core_pll_mux4_8x_cust x19 (
     .sel2            (a3a4_[2] ),
     .sel3            (a3a4_[3] ),
     .in2             (clk_rise1 ),
     .in3             (clk_rise1 ),
     .sel0            (a3a4_[0] ),
     .sel1            (a3a4_[1] ),
     .dout            (mux_in1[0] ),
     .in0             (clk_fall1 ),
     .in1             (clk_rise2 ) );
n2_core_pll_mux8_8x_cust x20 (
     .sel0            (aoa1a2_[0] ),
     .in2             (mux_in[2] ),
     .sel2            (aoa1a2_[2] ),
     .sel5            (aoa1a2_[5] ),
     .in4             (mux_in[4] ),
     .sel7            (aoa1a2_[7] ),
     .sel4            (aoa1a2_[4] ),
     .in1             (mux_in[1] ),
     .dout            (mux_out1 ),
     .in0             (mux_in[0] ),
     .sel6            (aoa1a2_[6] ),
     .in5             (mux_in[5] ),
     .in7             (mux_in[7] ),
     .sel3            (aoa1a2_[3] ),
     .sel1            (aoa1a2_[1] ),
     .in3             (mux_in[3] ),
     .in6             (mux_in[6] ) );
n2_core_pll_mux8_8x_cust x21 (
     .sel0            (aoa1a2_[0] ),
     .in2             (mux_in1[2] ),
     .sel2            (aoa1a2_[2] ),
     .sel5            (aoa1a2_[5] ),
     .in4             (mux_in1[4] ),
     .sel7            (aoa1a2_[7] ),
     .sel4            (aoa1a2_[4] ),
     .in1             (mux_in1[1] ),
     .dout            (mux_out2 ),
     .in0             (mux_in1[0] ),
     .sel6            (aoa1a2_[6] ),
     .in5             (mux_in1[5] ),
     .in7             (mux_in1[7] ),
     .sel3            (aoa1a2_[3] ),
     .sel1            (aoa1a2_[1] ),
     .in3             (mux_in1[3] ),
     .in6             (mux_in1[6] ) );
n2_core_pll_mux4_8x_cust x22 (
     .sel2            (a3a4_[2] ),
     .sel3            (a3a4_[3] ),
     .in2             (clk_rise2 ),
     .in3             (clk_fall2 ),
     .sel0            (a3a4_[0] ),
     .sel1            (a3a4_[1] ),
     .dout            (mux_in[1] ),
     .in0             (clk_fall1 ),
     .in1             (clk_fall1 ) );
n2_core_pll_mux4_8x_cust x23 (
     .sel2            (a3a4_[2] ),
     .sel3            (a3a4_[3] ),
     .in2             (clk_fall2 ),
     .in3             (clk_rise3 ),
     .sel0            (a3a4_[0] ),
     .sel1            (a3a4_[1] ),
     .dout            (mux_in[2] ),
     .in0             (clk_rise2 ),
     .in1             (clk_rise2 ) );
n2_core_pll_mux4_8x_cust x24 (
     .sel2            (a3a4_[2] ),
     .sel3            (a3a4_[3] ),
     .in2             (clk_rise3 ),
     .in3             (clk_fall3 ),
     .sel0            (a3a4_[0] ),
     .sel1            (a3a4_[1] ),
     .dout            (mux_in[3] ),
     .in0             (clk_fall2 ),
     .in1             (clk_fall2 ) );
n2_core_pll_mux4_8x_cust x25 (
     .sel2            (a3a4_[2] ),
     .sel3            (a3a4_[3] ),
     .in2             (clk_fall3 ),
     .in3             (clk_rise4 ),
     .sel0            (a3a4_[0] ),
     .sel1            (a3a4_[1] ),
     .dout            (mux_in[4] ),
     .in0             (clk_rise3 ),
     .in1             (clk_rise3 ) );
n2_core_pll_mux4_8x_cust x26 (
     .sel2            (a3a4_[2] ),
     .sel3            (a3a4_[3] ),
     .in2             (clk_rise4 ),
     .in3             (clk_fall4 ),
     .sel0            (a3a4_[0] ),
     .sel1            (a3a4_[1] ),
     .dout            (mux_in[5] ),
     .in0             (clk_fall3 ),
     .in1             (clk_fall3 ) );
n2_core_pll_mux4_8x_cust x27 (
     .sel2            (a3a4_[2] ),
     .sel3            (a3a4_[3] ),
     .in2             (clk_fall4 ),
     .in3             (clk_rise1 ),
     .sel0            (a3a4_[0] ),
     .sel1            (a3a4_[1] ),
     .dout            (mux_in[6] ),
     .in0             (clk_rise4 ),
     .in1             (clk_rise4 ) );
n2_core_pll_mux4_8x_cust x28 (
     .sel2            (a3a4_[2] ),
     .sel3            (a3a4_[3] ),
     .in2             (clk_rise1 ),
     .in3             (clk_fall1 ),
     .sel0            (a3a4_[0] ),
     .sel1            (a3a4_[1] ),
     .dout            (mux_in[7] ),
     .in0             (clk_fall4 ),
     .in1             (clk_fall4 ) );
n2_core_pll_mux4_8x_cust x29 (
     .sel2            (a3a4_[2] ),
     .sel3            (a3a4_[3] ),
     .in2             (clk_fall1 ),
     .in3             (clk_fall1 ),
     .sel0            (a3a4_[0] ),
     .sel1            (a3a4_[1] ),
     .dout            (mux_in1[1] ),
     .in0             (clk_rise2 ),
     .in1             (clk_fall2 ) );
n2_core_pll_mux4_8x_cust x30 (
     .sel2            (a3a4_[2] ),
     .sel3            (a3a4_[3] ),
     .in2             (clk_rise2 ),
     .in3             (clk_rise2 ),
     .sel0            (a3a4_[0] ),
     .sel1            (a3a4_[1] ),
     .dout            (mux_in1[2] ),
     .in0             (clk_fall2 ),
     .in1             (clk_rise3 ) );
n2_core_pll_mux4_8x_cust x31 (
     .sel2            (a3a4_[2] ),
     .sel3            (a3a4_[3] ),
     .in2             (clk_fall2 ),
     .in3             (clk_fall2 ),
     .sel0            (a3a4_[0] ),
     .sel1            (a3a4_[1] ),
     .dout            (mux_in1[3] ),
     .in0             (clk_rise3 ),
     .in1             (clk_fall3 ) );
n2_core_pll_mux4_8x_cust x32 (
     .sel2            (a3a4_[2] ),
     .sel3            (a3a4_[3] ),
     .in2             (clk_rise3 ),
     .in3             (clk_rise3 ),
     .sel0            (a3a4_[0] ),
     .sel1            (a3a4_[1] ),
     .dout            (mux_in1[4] ),
     .in0             (clk_fall3 ),
     .in1             (clk_rise4 ) );
n2_core_pll_mux4_8x_cust x33 (
     .sel2            (a3a4_[2] ),
     .sel3            (a3a4_[3] ),
     .in2             (clk_fall3 ),
     .in3             (clk_fall3 ),
     .sel0            (a3a4_[0] ),
     .sel1            (a3a4_[1] ),
     .dout            (mux_in1[5] ),
     .in0             (clk_rise4 ),
     .in1             (clk_fall4 ) );
n2_core_pll_mux4_8x_cust x34 (
     .sel2            (a3a4_[2] ),
     .sel3            (a3a4_[3] ),
     .in2             (clk_rise4 ),
     .in3             (clk_rise4 ),
     .sel0            (a3a4_[0] ),
     .sel1            (a3a4_[1] ),
     .dout            (mux_in1[6] ),
     .in0             (clk_fall4 ),
     .in1             (clk_rise1 ) );
n2_core_pll_mux4_8x_cust x35 (
     .sel2            (a3a4_[2] ),
     .sel3            (a3a4_[3] ),
     .in2             (clk_fall4 ),
     .in3             (clk_fall4 ),
     .sel0            (a3a4_[0] ),
     .sel1            (a3a4_[1] ),
     .dout            (mux_in1[7] ),
     .in0             (clk_rise1 ),
     .in1             (clk_fall1 ) );
endmodule

//  mh157021: lower level module definition (n2_core_pll_mux4_8x_cust)
// 
//  Last Modified: Friday Aug 26,2005 at 03:20:52 PM PDT
//  

module n2_core_pll_mux4_8x_cust(sel2 ,sel3 ,in2 ,in3 ,sel0 ,sel1 ,dout ,
     in0 ,in1 );
output		dout ;
input		sel2 ;
input		sel3 ;
input		in2 ;
input		in3 ;
input		sel0 ;
input		sel1 ;
input		in0 ;
input		in1 ;
 
mux4 x1 (
     .in0 (in0),
     .in1 (in1),
     .in2 (in2),
     .in3 (in3),
     .sel0 (sel0),
     .sel1 (sel1),
     .sel2 (sel2),
     .sel3 (sel3),
	 .muxtst (1'b0),  // compile warning - mh157021 
     .dout (dout) );		// compile error ".y (dout)" - mh157021 

endmodule



//  mh157021: lower level module definition (n2_core_pll_div4_new_cust)
// 
//  Last Modified: Friday Aug 26,2005 at 03:20:16 PM PDT
//  

module n2_core_pll_div4_new_cust(clk ,arst_l ,clk_div_out );
output		clk_div_out ;
input		clk ;
input		arst_l ;
supply1		vdd ;
 
wire		div4_l ;
wire		clk_div ;
wire		n1 ;
wire		n2 ;
wire		n3 ;
wire		n4 ;
wire		net19 ;
wire		net038 ;
wire		net26 ;
wire		net33 ;
wire		clk_div_l ;
wire		div2_l ;
 
 
n2_core_pll_inv_8x_cust x2 (
     .vdd_reg         (vdd ),
     .out             (clk_div_l ),
     .in              (clk_div ) );
cl_u1_inv_4x x3 (
     .out             (net038 ),
     .in              (arst_l ) );
n2_core_pll_flop_reset_new_cust x4 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (n2 ),
     .reset           (net038 ),
     .clk             (clk ),
     .q_l             (div2_l ),
     .q               (net33 ) );
n2_core_pll_flop_reset_new_cust x5 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (n4 ),
     .reset           (net038 ),
     .clk             (div2_l ),
     .q_l             (div4_l ),
     .q               (net26 ) );
n2_core_pll_flop_reset_new_cust x6 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (div4_l ),
     .reset           (net038 ),
     .clk             (clk ),
     .q_l             (clk_div ),
     .q               (net19 ) );
n2_core_pll_buf_2x_cust x9 (
     .vdd_reg         (vdd ),
     .out             (n2 ),
     .in              (n1 ) );
n2_core_pll_buf_2x_cust x10 (
     .vdd_reg         (vdd ),
     .out             (n3 ),
     .in              (div4_l ) );
n2_core_pll_buf_2x_cust x11 (
     .vdd_reg         (vdd ),
     .out             (n4 ),
     .in              (n3 ) );
n2_core_pll_buf_2x_cust x0 (
     .vdd_reg         (vdd ),
     .out             (n1 ),
     .in              (div2_l ) );
n2_core_pll_inv_32x_cust x1 (
     .vdd_reg         (vdd ),
     .out             (clk_div_out ),
     .in              (clk_div_l ) );
endmodule


//  mh157021: lower level module definition (n2_core_pll_and2_16x_cust)
// 
//  Last Modified: Friday Aug 26,2005 at 03:18:55 PM PDT
//  

module n2_core_pll_and2_16x_cust(out ,in1 ,in0 );
output		out ;
input		in1 ;
input		in0 ;
supply1		vdd ;
wire vss = 1'b0;
 
assign out = in0 & in1;

endmodule

//  mh157021: lower level module definition (n2_core_pll_and3_16x_cust)
// 
//  Last Modified: Friday Aug 26,2005 at 03:18:56 PM PDT
//  

module n2_core_pll_and3_16x_cust(out ,in2 ,in1 ,in0 );
output		out ;
input		in2 ;
input		in1 ;
input		in0 ;
supply1		vdd ;
wire vss = 1'b0;
 
assign out = (in0 & in1 & in2);

endmodule


//  mh157021: lower level module definition (n2_core_pll_bufi_4x_cust)
// 
//  Last Modified: Friday Aug 26,2005 at 03:19:07 PM PDT
//  

module n2_core_pll_bufi_4x_cust(vdd_reg ,out ,in );
output		out ;
input		vdd_reg ;
input		in ;
wire vss = 1'b0;

wire out;
 
assign out = ~in; 

endmodule



// 
//  Last Modified: Friday Aug 26,2005 at 03:18:51 PM PDT
//  

module n2_core_pll_4bit_counter_charc_cust(clk ,reset ,cnt3 ,qout_0 ,
     qout_1 ,qout_2 ,qout_3 ,count_out ,cnt1 ,cnt2 ,cnt0 );
output		qout_0 ;
output		qout_1 ;
output		qout_2 ;
output		qout_3 ;
output		count_out ;
input		clk ;
input		reset ;
input		cnt3 ;
input		cnt1 ;
input		cnt2 ;
input		cnt0 ;
supply1		vdd ;
wire vss = 1'b0;
 
wire		net115 ;
wire		net88 ;
wire		net121 ;
wire		net127 ;
wire		sel ;
wire		net133 ;
wire		nand_out ;
wire		zero_0 ;
wire		zero_1 ;
wire		zero_2 ;
wire		zero_3 ;
wire		sel_b ;
wire		din_0 ;
wire		din_1 ;
wire		din_2 ;
wire		din_3 ;
wire		next_0 ;
wire		next_1 ;
wire		next_2 ;
wire		next_3 ;
 
 
n2_core_pll_flop_reset_new_cust x2 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vss ),
     .d               (din_1 ),
     .reset           (reset ),
     .clk             (clk ),
     .q_l             (qout_1 ),
     .q               (zero_1 ) );
n2_core_pll_tpm_muxa_cust x3 (
     .opb             (net127 ),
     .op              (din_0 ),
     .d0              (next_0 ),
     .d1              (cnt0 ),
     .sel             (sel ),
     .sel_b           (sel_b ) );
n2_core_pll_flop_reset_new_cust x4 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vss ),
     .d               (din_2 ),
     .reset           (reset ),
     .clk             (clk ),
     .q_l             (qout_2 ),
     .q               (zero_2 ) );
n2_core_pll_flop_reset_new_cust x5 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vss ),
     .d               (din_3 ),
     .reset           (reset ),
     .clk             (clk ),
     .q_l             (qout_3 ),
     .q               (zero_3 ) );
n2_core_pll_tpm_muxa_cust x6 (
     .opb             (net133 ),
     .op              (din_1 ),
     .d0              (next_1 ),
     .d1              (cnt1 ),
     .sel             (sel ),
     .sel_b           (sel_b ) );
n2_core_pll_tpm_muxa_cust x7 (
     .opb             (net121 ),
     .op              (din_2 ),
     .d0              (next_2 ),
     .d1              (cnt2 ),
     .sel             (sel ),
     .sel_b           (sel_b ) );
n2_core_pll_tpm_muxa_cust x8 (
     .opb             (net115 ),
     .op              (din_3 ),
     .d0              (next_3 ),
     .d1              (cnt3 ),
     .sel             (sel ),
     .sel_b           (sel_b ) );
n2_core_pll_inv_8x_cust x13 (
     .vdd_reg         (vdd ),
     .out             (sel ),
     .in              (nand_out ) );
n2_core_pll_inv_8x_cust x14 (
     .vdd_reg         (vdd ),
     .out             (sel_b ),
     .in              (net88 ) );
n2_core_pll_buf_8x_cust x15 (
     .vdd_reg         (vdd ),
     .out             (count_out ),
     .in              (nand_out ) );
n2_core_pll_inv_4x_cust x16 (
     .vdd_reg         (vdd ),
     .out             (net88 ),
     .in              (nand_out ) );
n2_core_pll_nand4_4x_cust x18 (
     .in3             (qout_3 ),
     .out             (nand_out ),
     .in2             (qout_2 ),
     .in1             (qout_1 ),
     .in0             (qout_0 ) );
n2_core_pll_flop_reset_new_cust x0 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vss ),
     .d               (din_0 ),
     .reset           (reset ),
     .clk             (clk ),
     .q_l             (qout_0 ),
     .q               (zero_0 ) );
n2_core_pll_4bit_counter_next_cust x1 (
     .q3              (zero_3 ),
     .q0b             (qout_0 ),
     .q3b             (qout_3 ),
     .d3              (next_3 ),
     .q1b             (qout_1 ),
     .q2b             (qout_2 ),
     .d2              (next_2 ),
     .d0              (next_0 ),
     .q2              (zero_2 ),
     .q0              (zero_0 ),
     .q1              (zero_1 ),
     .d1              (next_1 ) );
endmodule



// 
//  Last Modified: Friday Aug 26,2005 at 03:20:59 PM PDT
//  

module n2_core_pll_nand4_4x_cust(in3 ,out ,in2 ,in1 ,in0 );
output		out ;
input		in3 ;
input		in2 ;
input		in1 ;
input		in0 ;
supply1		vdd ;
wire vss = 1'b0;
 
assign out = ~(in0 & in1 & in2 & in3);

endmodule

// 
//  Last Modified: Friday Aug 26,2005 at 03:20:19 PM PDT
//  

module n2_core_pll_flop_reset_new_1x_cust(vdd_reg ,reset_val_l ,d ,reset
      ,clk ,q_l ,q );
output		q_l ;
output		q ;
input		vdd_reg ;
input		reset_val_l ;
input		d ;
input		reset ;
input		clk ;
wire vss = 1'b0;
 
reg 		q;
 
always 
    @( posedge clk or posedge reset )
        if ( reset )
            q <= !reset_val_l;   
        else
            q <= d;

assign q_l = !q;
 
endmodule

// 
//  Last Modified: Tuesday Sep  6,2005 at 02:50:02 PM PDT
//  

module n2_core_pll_4bit_counter_next_cust(q3 ,q0b ,q3b ,d3 ,q1b ,q2b ,d2
      ,d0 ,q2 ,q0 ,q1 ,d1 );
output		d3 ;
output		d2 ;
output		d0 ;
output		d1 ;
input		q3 ;
input		q0b ;
input		q3b ;
input		q1b ;
input		q2b ;
input		q2 ;
input		q0 ;
input		q1 ;
supply1		vdd ;
 
wire		net31 ;
wire		net34 ;
wire		net53 ;
 
 
cl_u1_xnor2_4x x2 (
     .out             (d2 ),
     .in0             (q2b ),
     .in1             (net34 ) );
cl_u1_xnor2_4x x3 (
     .out             (d3 ),
     .in0             (q3b ),
     .in1             (net53 ) );
cl_u1_nor2_2x x4 (
     .out             (net31 ),
     .in1             (vdd ),
     .in0             (q3 ) );
cl_u1_nor2_2x xi45 (
     .out             (net34 ),
     .in1             (q0 ),
     .in0             (q1 ) );
cl_u1_nor3_2x xi46 (
     .out             (net53 ),
     .in2             (q0 ),
     .in1             (q1 ),
     .in0             (q2 ) );
cl_u1_xnor2_4x x0 (
     .out             (d0 ),
     .in0             (q0b ),
     .in1             (vdd ) );
cl_u1_xnor2_4x x1 (
     .out             (d1 ),
     .in0             (q1b ),
     .in1             (q0b ) );
endmodule


// 
//  Last Modified: Friday Aug 26,2005 at 03:21:53 PM PDT
//  

module n2_core_pll_tpm_muxa_cust(opb ,op ,d0 ,d1 ,sel ,sel_b );
output		opb ;
output		op ;
input		d0 ;
input		d1 ;
input		sel ;
input		sel_b ;
supply1		vdd ;
wire vss = 1'b0;

mux2 x1 (
     .sel0 (sel_b),
     .sel1 (sel),
     .in0 (d0),
     .in1 (d1),
     .y (op) );

assign opb = ~op;
 
endmodule



// 
//  Last Modified: Friday Aug 26,2005 at 03:21:16 PM PDT
//  

module n2_core_pll_pecl_cust(vdd_reg ,fb_ck ,pecl_p ,pecl_n ,hdr_p ,
     ref_ck ,hdr_n );
output		fb_ck ;
output		ref_ck ;
input		pecl_p ;
input		pecl_n ;
input		hdr_p ;
input		hdr_n ;
inout		vdd_reg ;
wire vss = 1'b0;

assign ref_ck = pecl_p;
assign fb_ck =  hdr_p;
 
endmodule

// 
//  Last Modified: Friday Aug 26,2005 at 03:21:12 PM PDT
//  

module n2_core_pll_pecl_bypass_clk_cust(phase_ck ,pecl_p ,pecl_n );
output		phase_ck ;
input		pecl_p ;
input		pecl_n ;
supply1		vdd ;
 
assign phase_ck = pecl_p;		// pecl buffer model - mh157021
 
endmodule


// 
//  Last Modified: Friday Aug 26,2005 at 03:21:24 PM PDT
//  

module n2_core_pll_pfd_cust(vdd_reg ,f_buf ,f_buf_l ,fast_l ,clamp_fltr
      ,s_buf ,s_buf_l ,slow_l ,slow ,fast ,pfd_reset ,fb ,ref );
output		f_buf ;
output		f_buf_l ;
output		fast_l ;
output		s_buf ;
output		s_buf_l ;
output		slow_l ;
output		slow ;
output		fast ;
output		pfd_reset ;
input		vdd_reg ;
input		clamp_fltr ;
input		fb ;
input		ref ;
 
endmodule


// 
//  Last Modified: Friday Aug 26,2005 at 03:21:38 PM PDT
//  

module n2_core_pll_se2diff_mux_cust(vdd_reg ,in1 ,sel ,out ,in0 ,out_l
      );
output		out ;
output		out_l ;
input		vdd_reg ;
input		in1 ;
input		sel ;
input		in0 ;
wire vss = 1'b0;

assign out   = sel ? in1 : in0;
assign out_l = ~out; 

endmodule


// 
//  Last Modified: Friday Aug 26,2005 at 03:22:10 PM PDT
//  

module n2_core_pll_vdd_xing_buf_32x_cust(vdd_reg ,out ,in );
output		out ;
input		vdd_reg ;
input		in ;
wire vss = 1'b0;
 
assign out = in;

endmodule


// 
//  Last Modified: Friday Aug 26,2005 at 03:21:47 PM PDT
//  

module n2_core_pll_tpm_cust(reset ,ip ,vdd_reg ,op ,sel ,div_ck_i ,
     pwr_rst ,div_ck ,vco_ck );
output [5:0]	op ;
input [5:0]	ip ;
output		sel ;
output		div_ck ;
input		reset ;
input		vdd_reg ;
input		div_ck_i ;
input		pwr_rst ;
input		vco_ck ;
wire		vss = 1'b0;
 
wire		net183 ;
wire		nz_2 ;
wire		net201 ;
wire		net282 ;
wire		nz_3 ;
wire		nz_4 ;
wire		nz_5 ;
wire		net186 ;
wire		net205 ;
wire		net189 ;
wire		f4q ;
wire		f5d ;
wire		net195 ;
wire		vco_ckb ;
wire		vco_ckd ;
wire		net198 ;
wire		f5q ;
wire		net219 ;
wire		f_gate ;
wire		r_gate ;
wire		reset_d ;
wire		net235 ;
wire		zero_0 ;
wire		net236 ;
wire		zero_1 ;
wire		zero_2 ;
wire		f0d ;
wire		zero_3 ;
wire		zero_4 ;
wire		zero_5 ;
wire		sel_b ;
wire		f0q ;
wire		net147 ;
wire		f1d ;
wire		not_zero ;
wire		net252 ;
wire		net256 ;
wire		net159 ;
wire		f1q ;
wire		f2d ;
wire		nzero_0 ;
wire		nzero_1 ;
wire		net162 ;
wire		nzero_2 ;
wire		nzero_3 ;
wire		nzero_4 ;
wire		nzero_5 ;
wire		f2q ;
wire		next0 ;
wire		next1 ;
wire		next2 ;
wire		next3 ;
wire		f3d ;
wire		next4 ;
wire		next5 ;
wire		net171 ;
wire		nip0 ;
wire		nip1 ;
wire		nip2 ;
wire		nip3 ;
wire		nip4 ;
wire		nip5 ;
wire		net0501 ;
wire		f3q ;
wire		net0502 ;
wire		net0503 ;
wire		net0504 ;
wire		f4d ;
wire		net0505 ;
wire		net0506 ;
wire		nz_0 ;
wire		nz_1 ;
 
 
n2_core_pll_buf_4x_cust x2 (
     .vdd_reg         (vdd_reg ),
     .out             (net205 ),
     .in              (ip[0] ) );
n2_core_pll_buf_16x_cust x4 (
     .vdd_reg         (vdd_reg ),
     .out             (reset_d ),
     .in              (reset ) );
n2_core_pll_tpm_mux_cust x5 (
     .opb             (nzero_0 ),
     .vdd_reg         (vdd_reg ),
     .op              (nz_0 ),
     .d0              (ip[0] ),
     .d1              (nip0 ),
     .sel             (net256 ),
     .sel_b           (net282 ) );
n2_core_pll_buf_8x_cust x6 (
     .vdd_reg         (vdd_reg ),
     .out             (net282 ),
     .in              (pwr_rst ) );
n2_core_pll_inv_8x_cust x7 (
     .vdd_reg         (vdd_reg ),
     .out             (net256 ),
     .in              (pwr_rst ) );
n2_core_pll_buf_4x_cust x8 (
     .vdd_reg         (vdd_reg ),
     .out             (net183 ),
     .in              (ip[1] ) );
n2_core_pll_buf_4x_cust x9 (
     .vdd_reg         (vdd_reg ),
     .out             (net195 ),
     .in              (ip[2] ) );
n2_core_pll_buf_4x_cust x10 (
     .vdd_reg         (vdd_reg ),
     .out             (net159 ),
     .in              (ip[3] ) );
n2_core_pll_buf_4x_cust x11 (
     .vdd_reg         (vdd_reg ),
     .out             (net147 ),
     .in              (ip[4] ) );
n2_core_pll_buf_4x_cust x12 (
     .vdd_reg         (vdd_reg ),
     .out             (net171 ),
     .in              (ip[5] ) );
n2_core_pll_buf_8x_cust x13 (
     .vdd_reg         (vdd_reg ),
     .out             (op[0] ),
     .in              (nip0 ) );
n2_core_pll_buf_8x_cust x14 (
     .vdd_reg         (vdd_reg ),
     .out             (op[1] ),
     .in              (nip1 ) );
n2_core_pll_buf_8x_cust x15 (
     .vdd_reg         (vdd_reg ),
     .out             (op[2] ),
     .in              (nip2 ) );
n2_core_pll_tpm_next_new_cust x16 (
     .vdd_reg         (vdd_reg ),
     .d5              (next5 ),
     .q0b             (zero_0 ),
     .q3b             (zero_3 ),
     .d3              (next3 ),
     .q5b             (zero_5 ),
     .q1b             (zero_1 ),
     .q2b             (zero_2 ),
     .d2              (next2 ),
     .d0              (next0 ),
     .d4              (next4 ),
     .q2              (f2q ),
     .q0              (f0q ),
     .q1              (f1q ),
     .d1              (next1 ),
     .q4b             (zero_4 ) );
n2_core_pll_tpm_mux_cust x17 (
     .opb             (nzero_1 ),
     .vdd_reg         (vdd_reg ),
     .op              (nz_1 ),
     .d0              (ip[1] ),
     .d1              (nip1 ),
     .sel             (net256 ),
     .sel_b           (net282 ) );
n2_core_pll_buf_8x_cust x18 (
     .vdd_reg         (vdd_reg ),
     .out             (op[3] ),
     .in              (nip3 ) );
n2_core_pll_buf_8x_cust x19 (
     .vdd_reg         (vdd_reg ),
     .out             (op[4] ),
     .in              (nip4 ) );
n2_core_pll_buf_8x_cust x20 (
     .vdd_reg         (vdd_reg ),
     .out             (op[5] ),
     .in              (nip5 ) );
n2_core_pll_tpm_mux_cust x23 (
     .opb             (nzero_2 ),
     .vdd_reg         (vdd_reg ),
     .op              (nz_2 ),
     .d0              (ip[2] ),
     .d1              (nip2 ),
     .sel             (net256 ),
     .sel_b           (net282 ) );
n2_core_pll_flop_reset_new_cust x24 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (net205 ),
     .reset           (reset_d ),
     .clk             (div_ck_i ),
     .q_l             (net201 ),
     .q               (nip0 ) );
n2_core_pll_flop_reset_new_cust x25 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (net183 ),
     .reset           (reset_d ),
     .clk             (div_ck_i ),
     .q_l             (net186 ),
     .q               (nip1 ) );
n2_core_pll_tpm_mux_cust x27 (
     .opb             (nzero_3 ),
     .vdd_reg         (vdd_reg ),
     .op              (nz_3 ),
     .d0              (ip[3] ),
     .d1              (nip3 ),
     .sel             (net256 ),
     .sel_b           (net282 ) );
n2_core_pll_tpm_mux_cust x28 (
     .opb             (nzero_4 ),
     .vdd_reg         (vdd_reg ),
     .op              (nz_4 ),
     .d0              (ip[4] ),
     .d1              (nip4 ),
     .sel             (net256 ),
     .sel_b           (net282 ) );
n2_core_pll_tpm_mux_cust x29 (
     .opb             (nzero_5 ),
     .vdd_reg         (vdd_reg ),
     .op              (nz_5 ),
     .d0              (ip[5] ),
     .d1              (nip5 ),
     .sel             (net256 ),
     .sel_b           (net282 ) );
n2_core_pll_flop_reset_new_cust x30 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (net195 ),
     .reset           (reset_d ),
     .clk             (div_ck_i ),
     .q_l             (net198 ),
     .q               (nip2 ) );
n2_core_pll_inv_32x_cust x31 (
     .vdd_reg         (vdd_reg ),
     .out             (vco_ckd ),
     .in              (net252 ) );
n2_core_pll_flop_reset_new_cust x32 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (net159 ),
     .reset           (reset_d ),
     .clk             (div_ck_i ),
     .q_l             (net162 ),
     .q               (nip3 ) );
n2_core_pll_flop_reset_new_cust x33 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (net147 ),
     .reset           (reset_d ),
     .clk             (div_ck_i ),
     .q_l             (net235 ),
     .q               (nip4 ) );
n2_core_pll_flop_reset_new_cust x34 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (net171 ),
     .reset           (reset_d ),
     .clk             (div_ck_i ),
     .q_l             (net236 ),
     .q               (nip5 ) );
n2_core_pll_flop_reset_new_cust x35 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (f0d ),
     .reset           (reset_d ),
     .clk             (vco_ckd ),
     .q_l             (zero_0 ),
     .q               (f0q ) );
n2_core_pll_flop_reset_new_cust x36 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (f1d ),
     .reset           (reset_d ),
     .clk             (vco_ckd ),
     .q_l             (zero_1 ),
     .q               (f1q ) );
n2_core_pll_flop_reset_new_cust x37 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (f2d ),
     .reset           (reset_d ),
     .clk             (vco_ckd ),
     .q_l             (zero_2 ),
     .q               (f2q ) );
n2_core_pll_flop_reset_new_cust x38 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (f3d ),
     .reset           (reset_d ),
     .clk             (vco_ckd ),
     .q_l             (zero_3 ),
     .q               (f3q ) );
n2_core_pll_flop_reset_new_cust x39 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (f4d ),
     .reset           (reset_d ),
     .clk             (vco_ckd ),
     .q_l             (zero_4 ),
     .q               (f4q ) );
n2_core_pll_tpm_zd1_cust x40 (
     .vdd_reg         (vdd_reg ),
     .zero1           (sel ),
     .zero1_b         (sel_b ),
     .q4b             (zero_4 ),
     .q0b             (zero_0 ),
     .q1b             (zero_1 ),
     .q2b             (zero_2 ),
     .q3b             (zero_3 ),
     .q5b             (zero_5 ) );
n2_core_pll_inv_8x_cust x41 (
     .vdd_reg         (vdd_reg ),
     .out             (net252 ),
     .in              (vco_ck ) );
n2_core_pll_flop_reset_new_cust x42 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (f5d ),
     .reset           (reset_d ),
     .clk             (vco_ckd ),
     .q_l             (zero_5 ),
     .q               (f5q ) );
n2_core_pll_flop_reset_new_cust x43 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vss ),
     .d               (sel ),
     .reset           (reset_d ),
     .clk             (vco_ckb ),
     .q_l             (net219 ),
     .q               (r_gate ) );
n2_core_pll_flop_reset_new_cust x44 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (not_zero ),
     .reset           (reset_d ),
     .clk             (vco_ckd ),
     .q_l             (net189 ),
     .q               (f_gate ) );
n2_core_pll_tpm_mux_cust x47 (
     .opb             (net0506 ),
     .vdd_reg         (vdd_reg ),
     .op              (f0d ),
     .d0              (next0 ),
     .d1              (nz_0 ),
     .sel             (sel ),
     .sel_b           (sel_b ) );
n2_core_pll_tpm_mux_cust x48 (
     .opb             (net0505 ),
     .vdd_reg         (vdd_reg ),
     .op              (f1d ),
     .d0              (next1 ),
     .d1              (nz_1 ),
     .sel             (sel ),
     .sel_b           (sel_b ) );
n2_core_pll_tpm_nzd_cust x49 (
     .vdd_reg         (vdd_reg ),
     .q2b             (nzero_2 ),
     .q4b             (nzero_4 ),
     .q3b             (nzero_3 ),
     .zero            (not_zero ),
     .q1b             (nzero_1 ),
     .q0b             (nzero_0 ),
     .q5b             (nzero_5 ) );
n2_core_pll_tpm_mux_cust x50 (
     .opb             (net0504 ),
     .vdd_reg         (vdd_reg ),
     .op              (f2d ),
     .d0              (next2 ),
     .d1              (nz_2 ),
     .sel             (sel ),
     .sel_b           (sel_b ) );
n2_core_pll_tpm_mux_cust x51 (
     .opb             (net0503 ),
     .vdd_reg         (vdd_reg ),
     .op              (f3d ),
     .d0              (next3 ),
     .d1              (nz_3 ),
     .sel             (sel ),
     .sel_b           (sel_b ) );
n2_core_pll_tpm_mux_cust x52 (
     .opb             (net0502 ),
     .vdd_reg         (vdd_reg ),
     .op              (f4d ),
     .d0              (next4 ),
     .d1              (nz_4 ),
     .sel             (sel ),
     .sel_b           (sel_b ) );
n2_core_pll_tpm_mux_cust x53 (
     .opb             (net0501 ),
     .vdd_reg         (vdd_reg ),
     .op              (f5d ),
     .d0              (next5 ),
     .d1              (nz_5 ),
     .sel             (sel ),
     .sel_b           (sel_b ) );
n2_core_pll_tpm_gate_new_cust x0 (
     .r_b             (net219 ),
     .vdd_reg         (vdd_reg ),
     .div_ck          (div_ck ),
     .r               (r_gate ),
     .ck              (vco_ck ),
     .f               (f_gate ) );
n2_core_pll_inv_4x_cust x1 (
     .vdd_reg         (vdd_reg ),
     .out             (vco_ckb ),
     .in              (vco_ckd ) );
endmodule

// 
//  Last Modified: Friday Aug 26,2005 at 03:19:30 PM PDT
//  

module n2_core_pll_cp_cust(slow_l ,vdd_reg ,slow ,fast ,fast_l ,fltr );
output		fltr ;
input		slow_l ;
input		vdd_reg ;
input		slow ;
input		fast ;
input		fast_l ;
 
endmodule


// 
//  Last Modified: Friday Aug 26,2005 at 03:20:12 PM PDT
//  

module n2_core_pll_delay_cust(vdd_reg ,out_delcr ,in ,out_del );
output		out_delcr ;
output		out_del ;
input		vdd_reg ;
input		in ;
supply1		vdd ;
wire vss = 1'b0;
 
assign 	 #1 out_del   = in;
assign 	 #1 out_delcr = ~in;

endmodule


// 
//  Last Modified: Friday Aug 26,2005 at 03:21:49 PM PDT
//  

module n2_core_pll_tpm_gate_new_cust(r_b ,vdd_reg ,div_ck ,r ,ck ,f );
output		div_ck ;
input		r_b ;
input		vdd_reg ;
input		r ;
input		ck ;
input		f ;
wire vss = 1'b0;

//
// special divider modeling - kc 
//

reg div_ck;

always @(ck or r or f or div_ck) begin
  if (ck && r)
    div_ck <= 1'b1;
  else if (~ck && ~f)
    div_ck <= 1'b0;
  else if (ck && ~r && div_ck)
    div_ck <= 1'b0;
  else
    div_ck <= div_ck;
end

endmodule



// 
//  Last Modified: Friday Aug 26,2005 at 03:20:47 PM PDT
//  

module n2_core_pll_lockdet_cust(pll_jtag_lock_everlose ,l1clk ,
     pll_lock_dyn ,reset_in ,slow ,fast ,pll_lock_pulse ,ref_ck );
output		pll_jtag_lock_everlose ;
output		pll_lock_dyn ;
output		pll_lock_pulse ;
input		l1clk ;
input		reset_in ;
input		slow ;
input		fast ;
input		ref_ck ;
supply1		vdd ;
 
endmodule


// 
// wrapper for pll_core - mh157021  
//  

module imaginary_vco_gen (
	pll_arst_l,
	sysclk,
	fdbkclk,
	div,
	vco_out
); 

input pll_arst_l;
input sysclk;
input [5:0] div;
input fdbkclk;
output vco_out;

wire  [5:0] div;
reg   [5:0] div_lat;

reg  		rst_lat; 
wire  sysclk_gated;


// latch the divider value on falling edge of rst
always @(pll_arst_l or div) begin
	if (!pll_arst_l) 
		div_lat <= div;			
end

// zero out sysclk until pll_arst_l is high
/*
always @(pll_arst_l or sysclk) begin
	if (!sysclk)
		rst_lat <= pll_arst_l; 
end	

assign sysclk_gated = rst_lat & sysclk; 
*/
assign sysclk_gated = sysclk; 


pll_core pll_core (
	.pll_arst_l (pll_arst_l),
	.sysclk (sysclk_gated),
	.fdbkclk (fdbkclk),
	.div (div_lat),
	.vco_out (vco_out) 
);
 
endmodule 


// 
// heart of frequency multiplication; imported from rtl model - mh157021  
//  
module pll_core (
	pll_arst_l,
	sysclk,
	fdbkclk,
	div,
	vco_out
);


// *************************
// input/output declaration
// *************************
input 		 pll_arst_l;
input        sysclk;
input 		 fdbkclk;
input [5:0]  div;
output       vco_out;

// synopsys translate_off

// *************************
// wire/reg declaration
// *************************
wire		pll_arst_l;
wire        sysclk;
wire        fdbkclk;
wire [5:0]  div;
wire 		vco_out;
// reg		vco_out;

reg			vco_tmp;
reg			locked;

time t0;
time t1;
time posedge_vco_tmp;
time posedge_fdbkclk;
time ref_per;
time vco_per;
time vco_hi_ph;
time vco_lo_ph;

time insdelay;
integer pulse_cnt;
integer  ph_offset; 
integer  ph_offset_past; 
time adj_delay;
time neg_delay;

integer j;

wire vco_shift;
wire [6:0] mult   = div + 1'b1;
wire [6:0] mult2x = {mult[5:0],1'b0}; 

// testing
reg tmp_clk1;
reg tmp_clk2;
reg tmp_clk3;
reg tmp_clk4;

reg [2:0] lock_cnt;


initial begin
	#0 t0 = 0;
	#0 t1 = 0;
	#0 locked = 0;
	#0 posedge_vco_tmp = 0;
	#0 posedge_fdbkclk = 0;
	#0 insdelay = 0;
	#0 adj_delay = 0;		// initialization
	#0 pulse_cnt = 2;		// initialization
end

// ************************************
// STABLE 
// ************************************
time qnt_err; 

// extract period of ref clk, and vco clk
always @ ( posedge  sysclk ) begin
	t0 = $realtime;
	@(posedge sysclk);
	t1 = $realtime;							
	ref_per = t1 - t0;				// get reference period [ps]
    vco_per = ref_per / (div+1'b1);	// vco period [ps]
	vco_hi_ph = ref_per/(mult2x);
	vco_lo_ph = vco_per - vco_hi_ph; 
	qnt_err = ref_per - (vco_hi_ph+vco_lo_ph)*mult;
end


// generate vco tmp clk - direct multiplication 
always @ ( posedge  sysclk ) begin

// OLD CODE THAT HAD DUTY CYCLE PROBLEMS
/* 
	vco_tmp = 1'b1;
    for ( j = 1; j < pulse_cnt; j = j+1 ) begin
		#(vco_per/2) vco_tmp = 1'b0;
		#(vco_per/2) vco_tmp = 1'b1;
	end
	#(vco_hi_ph) vco_tmp = 1'b0;		// for remaining part of cycle
*/

// DUTY CYCLE CORRECTOR (ONLY FOR EVEN DIVIDERS) 
	vco_tmp = 1'b1;
	for ( j = 1; j < mult; j = j+1 ) begin 	
		#(vco_hi_ph) vco_tmp = 1'b0;  
		if ((j == (mult >> 1))  && (qnt_err != 0)) // internal multiplier for N2 is always even 
			#(j/2);
		#(vco_lo_ph) vco_tmp = 1'b1;  
	end
	#(vco_hi_ph) vco_tmp = 1'b0;		// for remaining part of cycle
end



// *****************************************
// PH MEASURMENT & TRACKING
// *****************************************
// measure phase offset between fdbkclk & vco_tmp 


always @ ( posedge vco_tmp or negedge pll_arst_l ) begin

	if (!pll_arst_l) begin
	
	// clean wash
	
		posedge_vco_tmp = 0;
		posedge_fdbkclk = 0;
		adj_delay = 0;
		insdelay = 0;
		ph_offset_past = 360;

	end else begin

	// begin searching 
		if (locked)
			insdelay = insdelay;
		else begin
			posedge_vco_tmp = $realtime;
			@(posedge fdbkclk );
			posedge_fdbkclk = $realtime;
			insdelay = posedge_fdbkclk - posedge_vco_tmp; 
		end 
		`ifdef PLL_PH_DEBUG
		// DEBUG BEGIN
		ph_offset = (360 * insdelay)/vco_per; 
		if (ph_offset != ph_offset_past) 
			$display ("phase offset changed changed from %d to %d degrees", 
				ph_offset_past, ph_offset ); 
		ph_offset_past = ph_offset;
		// DEBUG END 
		`endif
		while (vco_per <= insdelay) 
			insdelay = insdelay - vco_per ; 
		adj_delay = vco_per - insdelay;		
 	end
end


// switch over to phase locked version so that
// vco_out + global tree delay lines up with 
// reference signal

assign vco_out = locked? vco_shift : vco_tmp; 

always @ (negedge sysclk or negedge pll_arst_l )  begin
	if (!pll_arst_l) begin
		locked <= 1'b0;
		lock_cnt <= 3'b0;
	end else begin
		if (lock_cnt == `PLL_LOCK_CNT ) begin
			locked <= 1'b1;
			lock_cnt <= `PLL_LOCK_CNT; 
		end else begin 
			locked <= 1'b0;
			lock_cnt <= lock_cnt + 1'b1; 
		end
	end
end	

// need cascaded delays to account for large delays 
// with respect to half-cycle of vco 
// the following is guaranteed to work for all delays

`ifdef FDBK_TRACKING 	
	always @ (vco_tmp)  tmp_clk1 = #(adj_delay/4) vco_tmp;
	always @ (tmp_clk1) tmp_clk2 = #(adj_delay/4) tmp_clk1;
	always @ (tmp_clk2) tmp_clk3 = #(adj_delay/4) tmp_clk2;
	always @ (tmp_clk3) tmp_clk4 = #(adj_delay/4) tmp_clk3;
`else 
	always @ (vco_tmp)  tmp_clk1 = vco_tmp;
	always @ (tmp_clk1) tmp_clk2 = tmp_clk1;
	always @ (tmp_clk2) tmp_clk3 = tmp_clk2;
	always @ (tmp_clk3) tmp_clk4 = tmp_clk3;
`endif

assign vco_shift = tmp_clk4;

// synopsys translate_on

endmodule

//
// generate timed reset to resolve d3 reset issue - mh157021
// in real pll, d3 start state does not matter since vco lock
// process will force rising edge alignment automatically 
// however, for digital logic that does not simulate true lock
// need alternate scheme to fake out the auto alignment
// 
module imaginary_timed_rst ( 	
	ref, 
	vco_clk, 
	pll_div2, 
	pll_arst_l,
	timed_pll_arst_l
);

input ref; 
input vco_clk; 
input pll_arst_l;
input [5:0] pll_div2; 
output timed_pll_arst_l;

wire ref; 
wire vco_clk; 
wire pll_arst_l;
wire [5:0] pll_div2; 
wire timed_pll_arst_l;

reg  t0_pll_arst_l;
reg  t1_pll_arst_l;
reg  ref_q;
reg	 ref_pulse;
reg	 [2:0] cnt;

// count reference cycles 
always @(posedge ref or negedge pll_arst_l) begin
	if (!pll_arst_l) 
		cnt <= 3'b0;
	else
		if (cnt == 3'b101) 
			cnt <= 3'b101;
		else 
			cnt <= cnt + 1'b1;
end 

// vco_clk is always even multiple of ref since d3=2, vco_clk = ref * d2 * d3
always @(negedge vco_clk or negedge pll_arst_l) begin
	if (!pll_arst_l) begin 
		ref_q <= 1'b0;
		ref_pulse <= 1'b0;
	end else begin 
		ref_q <= ref; 
		ref_pulse <= ~ref_q & ref;
	end
end

// pulse converted to sticky reset release
always @(posedge vco_clk or negedge pll_arst_l) begin
	if (!pll_arst_l) 
		t0_pll_arst_l <= 1'b0;
	else 
		if (cnt != 3'b101) 
			t0_pll_arst_l <= 1'b0;
		else if (ref_pulse) 
			t0_pll_arst_l <= 1'b1;
		else 
			 t0_pll_arst_l <= t0_pll_arst_l; 
end

// flop the reset release on negedge  
always @(negedge vco_clk or negedge pll_arst_l) begin
	if (!pll_arst_l) 
		t1_pll_arst_l <= 1'b0;
	else 
		t1_pll_arst_l <= t0_pll_arst_l; 
end

assign timed_pll_arst_l = (pll_div2[0]) ? t0_pll_arst_l : t1_pll_arst_l;  

endmodule 


// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_clkmux_sync_cust/rtl/n2_core_pll_clkmux_sync_cust.v
// ==========================================================================
//  mh157021: lower level module definition (n2_core_pll_clkmux_sync_cust)
//
//  Last Modified: Friday Aug 26,2005 at 03:19:25 PM PDT
// 

module n2_core_pll_clkmux_sync_cust(bypass_pll_clk, pll_clk ,arst ,d1 ,d2 ,d1_sync ,
     d2_sync ,d0_sync ,d0 ,d3_sync ,d3 );
output          d1_sync ;
output          d2_sync ;
output          d0_sync ;
output          d3_sync ;
input           bypass_pll_clk ;
input           pll_clk ;
input           arst ;
input           d1 ;
input           d2 ;
input           d0 ;
input           d3 ;
supply1         vdd ;

wire            net089 ;
wire            net111 ;
wire            net112 ;
wire            net113 ;
wire            net114 ;
wire            net0185 ;
wire            net0186 ;
wire            net0187 ;
wire            net0207 ;
wire            net0189 ;
wire            d0_1 ;
wire            d0_2 ;
wire            d1_1 ;
wire            d0_3 ;
wire            d1_2 ;
wire            d0_4 ;
wire            d1_3 ;
wire            d2_1 ;
wire            d1_4 ;
wire            d2_2 ;
wire            d3_1 ;
wire            d2_3 ;
wire            d3_2 ;
wire            d2_4 ;
wire            d3_3 ;
wire            d3_4 ;
wire            clk_dly1 ;
wire            clk_dly2 ;
wire            clk_dly3 ;
wire            clk_dly4 ;
wire            clk_dly5 ;
wire            net054 ;
wire            net057 ;
wire            net0110 ;
wire            net0191 ;
wire            net0192 ;
wire            net56 ;
wire            net0125 ;
wire            net0126 ;
wire            net078 ;
wire            net63 ;

wire bypass_pll_clk_l= ~bypass_pll_clk;	 // compile error fixed - mh157021 

n2_core_pll_flop_reset_new_cust x2 (
     .vdd_reg         (vdd ),
     .reset_val_l     (bypass_pll_clk_l),
     .d               (d2_4 ),
     .reset           (arst ),
     .clk             (clk_dly1 ),
     .q_l             (net0125 ),
     .q               (d2_sync ) );
n2_core_pll_flop_reset_new_cust x3 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (d3_4 ),
     .reset           (arst ),
     .clk             (clk_dly1 ),
     .q_l             (net057 ),
     .q               (d3_sync ) );
n2_core_pll_flop_reset_new_cust x4 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (d1_4 ),
     .reset           (arst ),
     .clk             (clk_dly1 ),
     .q_l             (net0110 ),
     .q               (d1_sync ) );
n2_core_pll_flop_reset_new_cust x5 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (d0_4 ),
     .reset           (arst ),
     .clk             (clk_dly1 ),
     .q_l             (net0192 ),
     .q               (d0_sync ) );
n2_core_pll_flop_reset_new_cust x6 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (d0_3 ),
     .reset           (arst ),
     .clk             (clk_dly2 ),
     .q_l             (net0191 ),
     .q               (d0_4 ) );
n2_core_pll_flop_reset_new_cust x7 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (d1_3 ),
     .reset           (arst ),
     .clk             (clk_dly2 ),
     .q_l             (net089 ),
     .q               (d1_4 ) );
n2_core_pll_flop_reset_new_cust x8 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (d0_1 ),
     .reset           (arst ),
     .clk             (clk_dly4 ),
     .q_l             (net0186 ),
     .q               (d0_2 ) );
n2_core_pll_flop_reset_new_cust x9 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (d1_1 ),
     .reset           (arst ),
     .clk             (clk_dly4 ),
     .q_l             (net0187 ),
     .q               (d1_2 ) );
n2_core_pll_flop_reset_new_cust x10 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (d1_2 ),
     .reset           (arst ),
     .clk             (clk_dly3 ),
     .q_l             (net0189 ),
     .q               (d1_3 ) );
n2_core_pll_flop_reset_new_cust x12 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (d1 ),
     .reset           (arst ),
     .clk             (clk_dly5 ),
     .q_l             (net054 ),
     .q               (d1_1 ) );
n2_core_pll_flop_reset_new_cust x13 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (d0_2 ),
     .reset           (arst ),
     .clk             (clk_dly3 ),
     .q_l             (net0185 ),
     .q               (d0_3 ) );
n2_core_pll_flop_reset_new_cust x14 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (d0 ),
     .reset           (arst ),
     .clk             (clk_dly5 ),
     .q_l             (net0207 ),
     .q               (d0_1 ) );
n2_core_pll_flop_reset_new_cust x18 (
     .vdd_reg         (vdd ),
     .reset_val_l     (bypass_pll_clk_l),
     .d               (d2_2 ),
     .reset           (arst ),
     .clk             (clk_dly3 ),
     .q_l             (net114 ),
     .q               (d2_3 ) );
n2_core_pll_flop_reset_new_cust x19 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (d3_2 ),
     .reset           (arst ),
     .clk             (clk_dly3 ),
     .q_l             (net56 ),
     .q               (d3_3 ) );
n2_core_pll_flop_reset_new_cust x20 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (d3_1 ),
     .reset           (arst ),
     .clk             (clk_dly4 ),
     .q_l             (net112 ),
     .q               (d3_2 ) );
n2_core_pll_flop_reset_new_cust x21 (
     .vdd_reg         (vdd ),
     .reset_val_l     (bypass_pll_clk_l),
     .d               (d2_1 ),
     .reset           (arst ),
     .clk             (clk_dly4 ),
     .q_l             (net113 ),
     .q               (d2_2 ) );
n2_core_pll_flop_reset_new_cust x22 (
     .vdd_reg         (vdd ),
     .reset_val_l     (bypass_pll_clk_l),
     .d               (d2 ),
     .reset           (arst ),
     .clk             (clk_dly5 ),
     .q_l             (net63 ),
     .q               (d2_1 ) );
n2_core_pll_flop_reset_new_cust x23 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (d3 ),
     .reset           (arst ),
     .clk             (clk_dly5 ),
     .q_l             (net111 ),
     .q               (d3_1 ) );
n2_core_pll_clkrep_cust x24 (
     .pll_clk         (pll_clk ),
     .clk_dly3        (clk_dly3 ),
     .clk_dly5        (clk_dly5 ),
     .clk_dly4        (clk_dly4 ),
     .clk_dly2        (clk_dly2 ),
     .clk_dly1        (clk_dly1 ) );
n2_core_pll_flop_reset_new_cust x0 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (d3_3 ),
     .reset           (arst ),
     .clk             (clk_dly2 ),
     .q_l             (net078 ),
     .q               (d3_4 ) );
n2_core_pll_flop_reset_new_cust x1 (
     .vdd_reg         (vdd ),
     .reset_val_l     (bypass_pll_clk_l),
     .d               (d2_3 ),
     .reset           (arst ),
     .clk             (clk_dly2 ),
     .q_l             (net0126 ),
     .q               (d2_4 ) );
endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_flop_reset_new_cust/rtl/n2_core_pll_flop_reset_new_cust.v
// ==========================================================================
//  mh157021: lower level module definition (n2_core_pll_flop_reset_new_cust)
//
//  Last Modified: Friday Aug 26,2005 at 03:20:20 PM PDT
//

module n2_core_pll_flop_reset_new_cust(vdd_reg ,reset_val_l ,d ,reset ,
     clk ,q_l ,q );
output          q_l ;
output          q ;
input           vdd_reg ;
input           reset_val_l ;
input           d ;
input           reset ;
input           clk ;

reg             q;
reg             qb;


/*
always
    @( clk or d or reset )
        if ( reset )
            qb <= !reset_val_l;
        else if ( !clk )
            qb <= d;
        else
            qb <= qb;  


always
    @( clk or reset )
        if ( reset )
            q <= !reset_val_l;
        else if ( clk )
            q <= qb;
        else 
            q <= q;

assign q_l = !q;
*/


always @(posedge clk or posedge reset) begin
	if (reset)
		q <= ~reset_val_l;
	else 
		q <= d; 
end

assign q_l = ~q;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_clkrep_cust/rtl/n2_core_pll_clkrep_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:19:28 PM PDT
//

module n2_core_pll_clkrep_cust(pll_clk ,clk_dly3 ,clk_dly5 ,clk_dly4 ,
     clk_dly2 ,clk_dly1 );
output          clk_dly3 ;
output          clk_dly5 ;
output          clk_dly4 ;
output          clk_dly2 ;
output          clk_dly1 ;
input           pll_clk ;
supply1         vdd ;
wire vss = 1'b0;

assign clk_dly1=pll_clk;
assign clk_dly2=clk_dly1;
assign clk_dly3=clk_dly2;
assign clk_dly4=clk_dly3;
assign clk_dly5=clk_dly4;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_flopderst_16x_cust/rtl/n2_core_pll_flopderst_16x_cust.v
// ==========================================================================
//  mh157021: lower level module definition (n2_core_pll_flopderst_16x_cust)
//
//  Last Modified: Friday Aug 26,2005 at 03:20:22 PM PDT
//

module n2_core_pll_flopderst_16x_cust(q_l ,reset_val ,d ,q ,reset ,clk ,ena );
output          q_l ;
output          q ;
input           reset_val ;
input           d ;
input           reset ;
input           clk ;
input           ena ;

reg             qb_p;
reg             qb_n;
reg             q;

always
    @( clk or d or reset or reset_val )
        if ( reset )
           qb_p <= reset_val;
        else if ( clk )
           qb_p <= d;

always
    @( clk or d or reset or reset_val )
        if ( reset )
           qb_n <= reset_val;
        else if ( !clk )
           qb_n <= d;

always
    @( clk or reset or ena or reset_val )
        if ( reset )
            q <= reset_val;
        else if ( clk && ena )
            q <= qb_n;
        else if ( !clk && !ena )
            q <= qb_p;

assign q_l = !q;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_ckmux_mxdel_diffout_cust/rtl/n2_core_pll_ckmux_mxdel_diffout_cust.v
// ==========================================================================
//  mh157021: lower level module definition (n2_core_pll_ckmux_mxdel_diffout_cust)
//
//  Last Modified: Tuesday Sep 20,2005 at 06:05:05 PM PDT
//

module n2_core_pll_ckmux_mxdel_diffout_cust(ckt_drv_int ,cktree_drv ,
     cktree_drv_l ,pll1_clk ,sel1 ,pll2_clk ,bypass_clk ,sel3 ,d1_clk ,
     pll_sdel ,sel0 ,sel2 );
input [1:0]     pll_sdel ;
output          ckt_drv_int ;
output          cktree_drv ;
output          cktree_drv_l ;
output          d1_clk ;
input           pll1_clk ;
input           sel1 ;
input           pll2_clk ;
input           bypass_clk ;
input           sel3 ;
input           sel0 ;
input           sel2 ;
supply1         vdd ;
wire vss = 1'b0;


mux4k x1 (
     .muxtst (1'b0),
     .in0 (pll1_clk),
     .in1 (d1_clk),
     .in2 (pll2_clk),
     .in3 (bypass_clk),
     .sel0 (sel0),
     .sel1 (sel1),
     .sel2 (sel2),
     .sel3 (sel3),
     .dout (cktree_drv) );


n2_core_pll_clkmux_delay x0 (
     .pll_sdel        ({pll_sdel } ),
     .mux_out         (d1_clk ),
     .d               (pll1_clk ) );

assign cktree_drv_l = ~cktree_drv;      // missing connectivity - mh157021
assign ckt_drv_int=cktree_drv;      // missing connectivity - kcyen

endmodule


// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_clkmux_delay/rtl/decode.v
// ==========================================================================
//  mh157021: lower level module definition (decode)
module decode ( a, d );

input [1:0] a;
output [3:0] d;

reg [3:0] d;

always @(a)
begin
  case (a)
    2'b00: d <= 4'b0001;
    2'b01: d <= 4'b0010;
    2'b10: d <= 4'b0100;
    2'b11: d <= 4'b1000;
  endcase
end

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_buf_4x_cust/rtl/n2_core_pll_buf_4x_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:19:05 PM PDT
//

module n2_core_pll_buf_4x_cust(vdd_reg ,out ,in );
output          out ;
input           vdd_reg ;
input           in ;
wire vss = 1'b0;

assign out = in;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_buf_16x_cust/rtl/n2_core_pll_buf_16x_cust.v
// ==========================================================================
//  mh157021: lower level module definition (n2_core_pll_buf_16x_cust)
//
//  Last Modified: Friday Aug 26,2005 at 03:19:03 PM PDT
//

module n2_core_pll_buf_16x_cust(vdd_reg ,out ,in );
output          out ;
input           vdd_reg ;
input           in ;
wire vss = 1'b0;

assign out = in;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_tpm_mux_cust/rtl/n2_core_pll_tpm_mux_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:21:51 PM PDT
//

module n2_core_pll_tpm_mux_cust(opb ,vdd_reg ,op ,d0 ,d1 ,sel ,sel_b );
output          opb ;
output          op ;
input           vdd_reg ;
input           d0 ;
input           d1 ;
input           sel ;
input           sel_b ;
wire vss = 1'b0;

assign opb = (~(sel & d1))  &  (~(sel_b & d0));
assign op  = ~opb;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_buf_8x_cust/rtl/n2_core_pll_buf_8x_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:19:06 PM PDT
//

module n2_core_pll_buf_8x_cust(vdd_reg ,out ,in );
output          out ;
input           vdd_reg ;
input           in ;
wire vss = 1'b0;

assign out = in;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_inv_8x_cust/rtl/n2_core_pll_inv_8x_cust.v
// ==========================================================================
//  mh157021: lower level module definition (n2_core_pll_inv_8x_cust)
//
//  Last Modified: Friday Aug 26,2005 at 03:20:35 PM PDT
//

module n2_core_pll_inv_8x_cust(vdd_reg ,out ,in );
output          out ;
input           vdd_reg ;
input           in ;
wire vss = 1'b0;

assign out = ~in;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_tpm_next_new_cust/rtl/n2_core_pll_tpm_next_new_cust.v
// ==========================================================================
/*
 File: /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_tpm_next_new_cust/schematic/sch.cdb
 Last Modified: Monday Sep 19,2005 at 12:16:27 PM PDT
 By: ky82615
 */
module n2_core_pll_tpm_next_new_cust(vdd_reg ,d5 ,q0b ,q3b ,d3 ,q5b ,q1b
      ,q2b ,d2 ,d0 ,d4 ,q2 ,q0 ,q1 ,d1 ,q4b );
output		d5 ;
output		d3 ;
output		d2 ;
output		d0 ;
output		d4 ;
output		d1 ;
input		vdd_reg ;
input		q0b ;
input		q3b ;
input		q5b ;
input		q1b ;
input		q2b ;
input		q2 ;
input		q0 ;
input		q1 ;
input		q4b ;
 
wire		net73 ;
wire		net76 ;
wire		net091 ;
wire		net0115 ;
wire		net53 ;
wire		net55 ;
wire		net64 ;
wire		net69 ;
 
 
n2_core_pll_xnor2_4x_new_cust x2 (
     .vdd_reg         (vdd_reg ),
     .out             (d1 ),
     .in0             (q1b ),
     .in1             (q0b ) );
n2_core_pll_xnor2_4x_new_cust x3 (
     .vdd_reg         (vdd_reg ),
     .out             (d2 ),
     .in0             (q2b ),
     .in1             (net76 ) );
n2_core_pll_xnor2_4x_new_cust x4 (
     .vdd_reg         (vdd_reg ),
     .out             (d3 ),
     .in0             (q3b ),
     .in1             (net73 ) );
n2_core_pll_nand2_2x_cust x5 (
     .vdd_reg         (vdd_reg ),
     .out             (net53 ),
     .in1             (q1b ),
     .in0             (q0b ) );
n2_core_pll_nor2_2x_cust x6 (
     .vdd_reg         (vdd_reg ),
     .out             (net76 ),
     .in1             (q1 ),
     .in0             (q0 ) );
n2_core_pll_nor2_2x_cust x7 (
     .vdd_reg         (vdd_reg ),
     .out             (net55 ),
     .in1             (net64 ),
     .in0             (net53 ) );
n2_core_pll_xnor2_4x_new_cust x8 (
     .vdd_reg         (vdd_reg ),
     .out             (d4 ),
     .in0             (q4b ),
     .in1             (net69 ) );
n2_core_pll_xnor2_4x_new_cust x9 (
     .vdd_reg         (vdd_reg ),
     .out             (d5 ),
     .in0             (q5b ),
     .in1             (net55 ) );
n2_core_pll_nand3_2x_cust x13 (
     .vdd_reg         (vdd_reg ),
     .out             (net64 ),
     .in2             (q4b ),
     .in1             (q3b ),
     .in0             (q2b ) );
n2_core_pll_nand2_2x_cust x14 (
     .vdd_reg         (vdd_reg ),
     .out             (net0115 ),
     .in1             (q1b ),
     .in0             (q0b ) );
n2_core_pll_nand2_2x_cust x15 (
     .vdd_reg         (vdd_reg ),
     .out             (net091 ),
     .in1             (q3b ),
     .in0             (q2b ) );
n2_core_pll_nor2_2x_cust x16 (
     .vdd_reg         (vdd_reg ),
     .out             (net69 ),
     .in1             (net091 ),
     .in0             (net0115 ) );
n2_core_pll_nor3_2x_cust x0 (
     .vdd_reg         (vdd_reg ),
     .out             (net73 ),
     .in2             (q2 ),
     .in1             (q1 ),
     .in0             (q0 ) );
n2_core_pll_xnor2_4x_new_cust x1 (
     .vdd_reg         (vdd_reg ),
     .out             (d0 ),
     .in0             (q0b ),
     .in1             (vdd_reg ) );
endmodule


// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_tpm_gate2_cust/rtl/n2_core_pll_tpm_gate2_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:21:48 PM PDT
//

module n2_core_pll_tpm_gate2_cust(vdd_reg ,div_ck ,r ,ck );
output          div_ck ;
input           vdd_reg ;
input           r ;
input           ck ;
wire vss = 1'b0;

reg div_ck;

always @ ( ck or r) begin               // better latch modeling - mh157021
        if ( ck )
                div_ck <= ~r;
end

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_inv_32x_cust/rtl/n2_core_pll_inv_32x_cust.v
// ==========================================================================
//  mh157021: lower level module definition (n2_core_pll_inv_32x_cust)
//
//  Last Modified: Friday Aug 26,2005 at 03:20:33 PM PDT
//

module n2_core_pll_inv_32x_cust(vdd_reg ,out ,in );
output          out ;
input           vdd_reg ;
input           in ;
wire vss = 1'b0;

assign out = ~in;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_tpm_zd1_cust/rtl/n2_core_pll_tpm_zd1_cust.v
// ==========================================================================
/*
 File: /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_tpm_zd1_cust/schematic/sch.cdb
 Last Modified: Monday Sep 19,2005 at 12:15:28 PM PDT
 By: ky82615
 */
module n2_core_pll_tpm_zd1_cust(vdd_reg ,zero1 ,zero1_b ,q4b ,q0b ,q1b ,
     q2b ,q3b ,q5b );
output		zero1 ;
output		zero1_b ;
input		vdd_reg ;
input		q4b ;
input		q0b ;
input		q1b ;
input		q2b ;
input		q3b ;
input		q5b ;
 
wire		net28 ;
wire		net33 ;
wire		net38 ;
 
 
n2_core_pll_nand2_2x_cust x2 (
     .vdd_reg         (vdd_reg ),
     .out             (net33 ),
     .in1             (q1b ),
     .in0             (q2b ) );
n2_core_pll_nor2_4x_cust x3 (
     .vdd_reg         (vdd_reg ),
     .out             (net28 ),
     .in1             (net33 ),
     .in0             (net38 ) );
n2_core_plllvt_nand2_16x_cust x4 (
     .vdd_reg         (vdd_reg ),
     .out             (zero1_b ),
     .in1             (q0b ),
     .in0             (net28 ) );
n2_core_pll_nand3_2x_cust x0 (
     .vdd_reg         (vdd_reg ),
     .out             (net38 ),
     .in2             (q3b ),
     .in1             (q4b ),
     .in0             (q5b ) );
n2_core_pll_inv_16x_a_cust x1 (
     .vdd_reg         (vdd_reg ),
     .out             (zero1 ),
     .in              (zero1_b ) );
endmodule


// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_inv_4x_cust/rtl/n2_core_pll_inv_4x_cust.v
// ==========================================================================
//  mh157021: lower level module definition (n2_core_pll_inv_4x_cust)
//
//  Last Modified: Friday Aug 26,2005 at 03:20:34 PM PDT
//

module n2_core_pll_inv_4x_cust(vdd_reg ,out ,in );
output          out ;
input           vdd_reg ;
input           in ;
wire vss = 1'b0;

assign out = ~in;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_nand2_2x_cust/rtl/n2_core_pll_nand2_2x_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:20:55 PM PDT
//

module n2_core_pll_nand2_2x_cust(vdd_reg ,out ,in1 ,in0 );
output          out ;
input           vdd_reg ;
input           in1 ;
input           in0 ;
wire vss = 1'b0;

assign out = ~(in0 & in1);

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_nor2_4x_cust/rtl/n2_core_pll_nor2_4x_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:21:02 PM PDT
//

module n2_core_pll_nor2_4x_cust(vdd_reg ,out ,in1 ,in0 );
output          out ;
input           vdd_reg ;
input           in1 ;
input           in0 ;
wire vss = 1'b0;

assign out = ~(in0 | in1);

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_plllvt_nand2_16x_cust/rtl/n2_core_plllvt_nand2_16x_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:22:28 PM PDT
//

module n2_core_plllvt_nand2_16x_cust(vdd_reg ,out ,in1 ,in0 );
output          out ;
input           vdd_reg ;
input           in1 ;
input           in0 ;
wire vss = 1'b0;

assign out = ~(in0 & in1);

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_nand3_2x_cust/rtl/n2_core_pll_nand3_2x_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:20:58 PM PDT
//

module n2_core_pll_nand3_2x_cust(vdd_reg ,out ,in2 ,in1 ,in0 );
output          out ;
input           vdd_reg ;
input           in2 ;
input           in1 ;
input           in0 ;
wire vss = 1'b0;

assign out = ~(in0 & in1 & in2);

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_inv_16x_a_cust/rtl/n2_core_pll_inv_16x_a_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:20:27 PM PDT
//

module n2_core_pll_inv_16x_a_cust(vdd_reg ,out ,in );
output          out ;
input           vdd_reg ;
input           in ;
wire vss = 1'b0;

assign out = ~in;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_nor2_2x_cust/rtl/n2_core_pll_nor2_2x_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:21:01 PM PDT
//

module n2_core_pll_nor2_2x_cust(vdd_reg ,out ,in1 ,in0 );
output          out ;
input           vdd_reg ;
input           in1 ;
input           in0 ;
wire vss = 1'b0;

assign out = ~(in0 | in1);

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_nor3_2x_cust/rtl/n2_core_pll_nor3_2x_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:21:03 PM PDT
//

module n2_core_pll_nor3_2x_cust(vdd_reg ,out ,in2 ,in1 ,in0 );
output          out ;
input           vdd_reg ;
input           in2 ;
input           in1 ;
input           in0 ;
wire vss = 1'b0;

assign out = ~(in0 | in1 | in2);

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_tpm_nzd_cust/rtl/n2_core_pll_tpm_nzd_cust.v
// ==========================================================================
/*
 File: /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_tpm_nzd_cust/schematic/sch.cdb
 Last Modified: Monday Sep 19,2005 at 12:10:20 PM PDT
 By: ky82615
 */
module n2_core_pll_tpm_nzd_cust(vdd_reg ,q2b ,q4b ,q3b ,zero ,q1b ,q0b ,
     q5b );
output		zero ;
input		vdd_reg ;
input		q2b ;
input		q4b ;
input		q3b ;
input		q1b ;
input		q0b ;
input		q5b ;
 
wire		net22 ;
wire		net28 ;
wire		net33 ;
 
 
n2_core_pll_nand3_2x_cust x2 (
     .vdd_reg         (vdd_reg ),
     .out             (net28 ),
     .in2             (q2b ),
     .in1             (q1b ),
     .in0             (q0b ) );
n2_core_pll_nand3_2x_cust x3 (
     .vdd_reg         (vdd_reg ),
     .out             (net33 ),
     .in2             (q5b ),
     .in1             (q4b ),
     .in0             (q3b ) );
n2_core_pll_inv_4x_cust x0 (
     .vdd_reg         (vdd_reg ),
     .out             (zero ),
     .in              (net22 ) );
n2_core_pll_nor2_2x_cust x1 (
     .vdd_reg         (vdd_reg ),
     .out             (net22 ),
     .in1             (net33 ),
     .in0             (net28 ) );
endmodule


// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_xnor2_4x_new_cust/rtl/n2_core_pll_xnor2_4x_new_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:22:27 PM PDT
//

module n2_core_pll_xnor2_4x_new_cust(vdd_reg ,out ,in0 ,in1 );
output          out ;
input           vdd_reg ;
input           in0 ;
input           in1 ;
wire vss = 1'b0;

assign out = ~(in0 ^ in1);

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_d4_sync_cust/rtl/n2_core_pll_d4_sync_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:19:55 PM PDT
//

module n2_core_pll_d4_sync_cust(dft_rst_l ,bs_rstps_4 ,bs_rstps_0 ,
     bs_pclk_4 ,bs_pclk_0 );
output          bs_rstps_4 ;
output          bs_rstps_0 ;
input           dft_rst_l ;
input           bs_pclk_4 ;
input           bs_pclk_0 ;
supply1         vdd ;

wire [4:4]      rstp ;
wire            net014 ;
wire            net031 ;
wire            net46 ;


n2_core_pll_flop_reset2_cust x2 (
     .d               (rstp_4 ),
     .clk             (bs_pclk_4 ),
     .q_l             (net46 ),
     .q               (net031 ) );
n2_core_pll_inv1_16x_cust x7 (
     .vdd_reg         (vdd ),
     .out             (bs_rstps_0 ),
     .in              (net014 ) );
n2_core_pll_flop_reset2_cust x0 (
     .d               (dft_rst_l ),
     .clk             (bs_pclk_0 ),
     .q_l             (rstp_4 ),
     .q               (net014 ) );
n2_core_pll_inv1_16x_cust x1 (
     .vdd_reg         (vdd ),
     .out             (bs_rstps_4 ),
     .in              (net46 ) );
endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_fse2diff_out_cust/rtl/n2_core_pll_fse2diff_out_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:20:23 PM PDT
//

module n2_core_pll_fse2diff_out_cust(vdd_reg ,in ,out_l ,out );
output          out_l ;
output          out ;
input           vdd_reg ;
input           in ;
wire vss = 1'b0;

assign out = in;
assign out_l = ~in;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_d4_ctl_cust/rtl/n2_core_pll_d4_ctl_cust.v
// ==========================================================================
/*
 File: /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_d4_ctl_cust/schematic/sch.cdb
 Last Modified: Monday Sep 19,2005 at 12:13:09 PM PDT
 By: ky82615
 */
module n2_core_pll_d4_ctl_cust(cac_l ,csel_l ,pclk ,out_clk ,eq ,in_clk
      ,csel ,rstps ,a );
output [1:1]	csel_l ;
output [1:1]	csel ;
input [4:0]	a ;
output		cac_l ;
output		pclk ;
output		out_clk ;
input		eq ;
input		in_clk ;
input		rstps ;
supply1		vdd ;
wire vss = 1'b0;
 
wire [3:1]	carry ;
wire [1:0]	csel_a1 ;
wire [2:0]	sum ;
wire [1:0]	csel_a1_l ;
wire		net089 ;
wire		mux_clk_l ;
wire		ca2_a1_l ;
wire		net94 ;
wire		net034 ;
wire		net043 ;
wire		net045 ;
wire		rst1 ;
wire		ca2_a1 ;
wire		mux_clk ;
wire		nreset ;
 
 
n2_core_pll_tpm1_cust x2 (
     .ip              ({a[4:2] } ),
     .nreset          (nreset ),
     .ca2_a1          (ca2_a1 ),
     .cac_l           (cac_l ),
     .reset           (rst1 ),
     .sel_l           (mux_clk ),
     .sel             (mux_clk_l ),
     .vco_ck          (in_clk ) );
cl_u1_inv_8x x5 (
     .out             (net034 ),
     .in              (rstps ) );
n2_core_pll_flop_reset1_cust xa_0_ (
     .reset_val_l     (vdd ),
     .d               (sum[0] ),
     .reset           (rst1 ),
     .clk             (mux_clk ),
     .q_l             (csel_a1_l[0] ),
     .q               (csel_a1[0] ) );
n2_core_pll_inv1_32x_cust x6 (
     .out             (rst1 ),
     .in              (net043 ) );
cl_u1_nand2_8x x7 (
     .out             (nreset ),
     .in1             (a[4] ),
     .in0             (net043 ) );
//terminator i22 (
//     .TERM            (ca2_a1_l ) );
//terminator i3 (
//     .TERM            (carry[3] ) );
//terminator i24 (
//     .TERM            (net045 ) );
n2_core_pll_flop_reset1_cust xa_1_ (
     .reset_val_l     (vdd ),
     .d               (sum[1] ),
     .reset           (rst1 ),
     .clk             (mux_clk ),
     .q_l             (csel_a1_l[1] ),
     .q               (csel_a1[1] ) );
cl_u1_nand2_8x x11 (
     .out             (out_clk ),
     .in1             (eq ),
     .in0             (mux_clk_l ) );
n2_core_pll_flop_reset2_cust x13 (
     .d               (net034 ),
     .clk             (in_clk ),
     .q_l             (net045 ),
     .q               (net043 ) );
n2_core_pll_flop_reset1_cust xa_2_ (
     .reset_val_l     (vdd ),
     .d               (sum[2] ),
     .reset           (rst1 ),
     .clk             (mux_clk ),
     .q_l             (ca2_a1_l ),
     .q               (ca2_a1 ) );
n2_core_pll_csa32_cust xb_0_ (
     .in0             (csel_a1[0] ),
     .sum             (sum[0] ),
     .in0_l           (csel_a1_l[0] ),
     .carry           (carry[1] ),
     .in2             (vss ),
     .in1             (a[0] ) );
n2_core_pll_inv1_16x_cust x22 (
     .vdd_reg         (vdd ),
     .out             (pclk ),
     .in              (net94 ) );
n2_core_pll_csa32_cust xb_1_ (
     .in0             (csel_a1[1] ),
     .sum             (sum[1] ),
     .in0_l           (csel_a1_l[1] ),
     .carry           (carry[2] ),
     .in2             (carry[1] ),
     .in1             (a[1] ) );
cl_u1_buf_1x x3_1_ (
     .out             (net089 ),
     .in              (csel_a1[1] ) );
n2_core_pll_csa32_cust xb_2_ (
     .in0             (vss ),
     .sum             (sum[2] ),
     .in0_l           (vdd ),
     .carry           (carry[3] ),
     .in2             (carry[2] ),
     .in1             (vss ) );
n2_core_pll_flop_reset1_cust x0_1_ (
     .reset_val_l     (vdd ),
     .d               (net089 ),
     .reset           (rst1 ),
     .clk             (mux_clk ),
     .q_l             (csel_l[1] ),
     .q               (csel[1] ) );
cl_u1_inv_4x x1 (
     .out             (net94 ),
     .in              (in_clk ) );
endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_d4_mux_cust/rtl/n2_core_pll_d4_mux_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:19:54 PM PDT
//

module n2_core_pll_d4_mux_cust(out_clk ,rstps ,bs_pi_clk_4 ,bs_pi_clk_0 );
input [0:0]     rstps ;
output          out_clk ;
input           bs_pi_clk_4 ;
input           bs_pi_clk_0 ;
supply1         vdd ;
wire vss = 1'b0;

wire            in8_clk_l ;
wire            net032 ;
wire            mux_clk ;
wire            in8_clk ;
wire            net61 ;


//cl_u1_nand2_4x x7 (
//     .out             (mux_clk ),
//     .in1             (bs_pi_clk_4 ),
//     .in0             (bs_pi_clk_0 ) );
cl_u1_nand2_4x x8 (
     .out             (mux_clk ),
     .in1             (bs_pi_clk_0 ),
     .in0             (bs_pi_clk_4 ) );
cl_u1_buf_1x x9 (
     .out             (net61 ),
     .in              (in8_clk_l ) );
n2_core_pll_flop_reset1_cust x17 (
     .reset_val_l     (vss ),
     .d               (net61 ),
     .reset           (rstps[0] ),
     .clk             (mux_clk ),
     .q_l             (in8_clk_l ),
     .q               (in8_clk ) );
n2_core_pll_inv_32x_cust x0 (
     .vdd_reg         (vdd ),
     .out             (out_clk ),
     .in              (net032 ) );
n2_core_pll_inv_8x_cust x1 (
     .vdd_reg         (vdd ),
     .out             (net032 ),
     .in              (in8_clk ) );
endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_flop_reset1_cust/rtl/n2_core_pll_flop_reset1_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:20:17 PM PDT
//

module n2_core_pll_flop_reset1_cust(reset_val_l ,d ,reset ,clk ,q_l ,q
      );
output          q_l ;
output          q ;
input           reset_val_l ;
input           d ;
input           reset ;
input           clk ;
supply1         vdd ;

reg             q;
reg             qb;

/*
always
    @( clk or d or reset )
        if ( reset )
            qb <= !reset_val_l;
        else if ( !clk )
            qb <= d;

always
    @( clk or reset )
        if ( reset )
            q <= !reset_val_l;
        else if ( clk )
            q <= qb;
*/

always @( posedge clk or posedge reset ) begin
	if (reset) 
		q <= ~reset_val_l; 
	else
		q <= d;
end 

assign q_l = !q;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_tpm1_cust/rtl/n2_core_pll_tpm1_cust.v
// ==========================================================================
/*
 File: /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_tpm1_cust/schematic/sch.cdb
 Last Modified: Monday Sep 19,2005 at 12:09:54 PM PDT
 By: ky82615
 */
module n2_core_pll_tpm1_cust(nreset ,ca2_a1 ,cac_l ,reset ,sel_l ,sel ,
     ip ,vco_ck );
input [2:0]	ip ;
output		cac_l ;
output		sel_l ;
output		sel ;
input		nreset ;
input		ca2_a1 ;
input		reset ;
input		vco_ck ;
supply1		vdd ;
wire vss = 1'b0;
 
wire		d3 ;
wire		q0_l ;
wire		q1_l ;
wire		q2_l ;
wire		net75 ;
wire		q3_l ;
wire		vco_ck_l ;
wire		ca3 ;
wire		net121 ;
wire		d22 ;
wire		net128 ;
wire		d22_l ;
wire		net130 ;
wire		net132 ;
wire		net0165 ;
wire		net137 ;
wire		net143 ;
wire		sel1 ;
wire		qa2_l ;
wire		q0 ;
wire		q1 ;
wire		q2 ;
wire		q3 ;
wire		l1clk ;
wire		net173 ;
wire		net174 ;
wire		sel1_q ;
wire		d0 ;
wire		d1 ;
wire		d2 ;
 
 
//terminator i15 (
//     .TERM            (q3 ) );
n2_core_pll_flop_reset2_cust x2 (
     .d               (ca2_a1 ),
     .clk             (vco_ck ),
     .q_l             (net174 ),
     .q               (qa2_l ) );
//terminator i16 (
//     .TERM            (q2 ) );
cl_u1_inv_8x x3 (
     .out             (vco_ck_l ),
     .in              (vco_ck ) );
//terminator i17 (
//     .TERM            (q1 ) );
n2_core_pll_inv1_16x_cust x4 (
     .vdd_reg         (vdd ),
     .out             (d22 ),
     .in              (q0 ) );
n2_core_pll_tpm_mux1_cust x5 (
     .sel_l           (d22_l ),
     .vdd_reg         (vdd ),
     .out_l           (d1 ),
     .d0              (net132 ),
     .d1              (q2_l ),
     .sel             (d22 ) );
n2_core_pll_flop_reset2_cust x6 (
     .d               (sel1 ),
     .clk             (vco_ck_l ),
     .q_l             (net121 ),
     .q               (sel1_q ) );
n2_core_pll_inv_32x_cust x7 (
     .vdd_reg         (vdd ),
     .out             (l1clk ),
     .in              (net137 ) );
n2_core_pll_flop_reset1_cust x8 (
     .reset_val_l     (vss ),
     .d               (d1 ),
     .reset           (reset ),
     .clk             (l1clk ),
     .q_l             (q1_l ),
     .q               (q1 ) );
n2_core_pll_flop_reset2_cust x9 (
     .d               (ca3 ),
     .clk             (vco_ck_l ),
     .q_l             (net173 ),
     .q               (cac_l ) );
//terminator i6 (
//     .TERM            (net121 ) );
//terminator i9 (
//     .TERM            (ip[0] ) );
cl_u1_nand2_8x x10 (
     .out             (ca3 ),
     .in1             (qa2_l ),
     .in0             (sel1 ) );
n2_core_pll_tpm_mux1_cust x11 (
     .sel_l           (d22_l ),
     .vdd_reg         (vdd ),
     .out_l           (d2 ),
     .d0              (vdd ),
     .d1              (q3_l ),
     .sel             (d22 ) );
n2_core_pll_flop_reset1_cust x12 (
     .reset_val_l     (vss ),
     .d               (d3 ),
     .reset           (nreset ),
     .clk             (l1clk ),
     .q_l             (q3_l ),
     .q               (q3 ) );
n2_core_pll_inv1_32x_cust x13 (
     .out             (sel_l ),
     .in              (net143 ) );
cl_u1_nand2_8x x14 (
     .out             (net143 ),
     .in1             (sel1_q ),
     .in0             (vco_ck ) );
cl_u1_inv_1x x15 (
     .out             (net130 ),
     .in              (ip[2] ) );
n2_core_pll_tpm_mux1_cust x16 (
     .sel_l           (d22_l ),
     .vdd_reg         (vdd ),
     .out_l           (d3 ),
     .d0              (ip[0] ),
     .d1              (vss ),
     .sel             (d22 ) );
n2_core_pll_inv1_16x_cust x17 (
     .vdd_reg         (vdd ),
     .out             (d22_l ),
     .in              (q0_l ) );
cl_u1_nand2_2x x18 (
     .out             (net132 ),
     .in1             (net130 ),
     .in0             (net128 ) );
cl_u1_inv_1x x19 (
     .out             (net128 ),
     .in              (ip[0] ) );
cl_u1_inv_1x x20 (
     .out             (net0165 ),
     .in              (ip[1] ) );
n2_core_pll_flop_reset1_cust x22 (
     .reset_val_l     (vss ),
     .d               (d22 ),
     .reset           (reset ),
     .clk             (vco_ck ),
     .q_l             (sel1 ),
     .q               (net75 ) );
n2_core_pll_tpm_mux1_cust x36 (
     .sel_l           (d22_l ),
     .vdd_reg         (vdd ),
     .out_l           (d0 ),
     .d0              (vdd ),
     .d1              (q1_l ),
     .sel             (d22 ) );
n2_core_pll_flop_reset1_cust x45 (
     .reset_val_l     (vss ),
     .d               (d0 ),
     .reset           (reset ),
     .clk             (l1clk ),
     .q_l             (q0_l ),
     .q               (q0 ) );
n2_core_pll_flop_reset1_cust x46 (
     .reset_val_l     (vss ),
     .d               (d2 ),
     .reset           (nreset ),
     .clk             (l1clk ),
     .q_l             (q2_l ),
     .q               (q2 ) );
//terminator ix3 (
//     .TERM            (net174 ) );
//terminator ix8 (
//     .TERM            (net173 ) );
//terminator i10 (
//     .TERM            (net0165 ) );
//terminator i11 (
//     .TERM            (ip[2] ) );
n2_core_pll_nand2_8x_cust x0 (
     .vsup            (vdd ),
     .out             (net137 ),
     .in1             (cac_l ),
     .in0             (vco_ck ) );
n2_core_pll_inv1_16x_cust x1 (
     .vdd_reg         (vdd ),
     .out             (sel ),
     .in              (net75 ) );
endmodule


// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_inv1_32x_cust/rtl/n2_core_pll_inv1_32x_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:20:25 PM PDT
//

module n2_core_pll_inv1_32x_cust(out ,in );
output          out ;
input           in ;
supply1         vdd ;
wire vss = 1'b0;

assign out = ~in;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_flop_reset2_cust/rtl/n2_core_pll_flop_reset2_cust.v
// ==========================================================================
//  mh157021: lower level module definition (n2_core_pll_flop_reset2_cust)
//
//  Last Modified: Tuesday Sep  6,2005 at 02:49:34 PM PDT
//

module n2_core_pll_flop_reset2_cust(d ,clk ,q_l ,q );
output          q_l ;
output          q ;
input           d ;
input           clk ;
supply1         vdd ;

reg             q;
reg             q_b;

/*
always
    @( clk or d )
      if ( !clk )
        q_b <= d;
      else
        q_b <= q_b;

always
    @( clk )
      if ( clk )
        q <= q_b;
      else
        q <= q;
*/
assign q_l = !q;

always @(posedge clk) begin
	q <= d;
end

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_csa32_cust/rtl/n2_core_pll_csa32_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:19:32 PM PDT
//

module n2_core_pll_csa32_cust(in0 ,sum ,in0_l ,carry ,in2 ,in1 );
output          sum ;
output          carry ;
input           in0 ;
input           in0_l ;
input           in2 ;
input           in1 ;

fadd x1 (
    .cin (in0),
    .a (in1),
    .b (in2),
    .s (sum),
    .cout (carry) );

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_csa32_cust/rtl/fadd.v
// ==========================================================================
module fadd ( cin,a,b,s,cout );

  input cin, a, b;
  output s, cout;

  assign s = cin^a^b;
  assign cout = cin&a|cin&b|a&b;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_inv1_16x_cust/rtl/n2_core_pll_inv1_16x_cust.v
// ==========================================================================
//  mh157021: lower level module definition (n2_core_pll_inv1_16x_cust)
//
//  Last Modified: Friday Aug 26,2005 at 03:20:24 PM PDT
//

module n2_core_pll_inv1_16x_cust(vdd_reg ,out ,in );
output          out ;
input           vdd_reg ;
input           in ;
wire vss = 1'b0;

assign out = ~in;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_tpm_mux1_cust/rtl/n2_core_pll_tpm_mux1_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:21:51 PM PDT
//

module n2_core_pll_tpm_mux1_cust(sel_l ,vdd_reg ,out_l ,d0 ,d1 ,sel );
output          out_l ;
input           sel_l ;
input           vdd_reg ;
input           d0 ;
input           d1 ;
input           sel ;
wire vss = 1'b0;

mux2s x1 (
     .sel0 (sel_l),
     .sel1 (sel),
     .in0 (d0),
     .in1 (d1),
     .dout (out) );

assign out_l = ~out;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_nand2_8x_cust/rtl/n2_core_pll_nand2_8x_cust.v
// ==========================================================================
//
//  Last Modified: Friday Aug 26,2005 at 03:20:57 PM PDT
//

module n2_core_pll_nand2_8x_cust(vsup ,out ,in1 ,in0 );
output          out ;
input           vsup ;
input           in1 ;
input           in0 ;
wire vss = 1'b0;

assign out = ~(in0 & in1);

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_div4_cust/rtl/n2_core_pll_div4_cust.v
// ==========================================================================
/*
 File: /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_div4_cust/schematic/sch.cdb
 Last Modified: Monday Sep 19,2005 at 12:12:32 PM PDT
 By: ky82615
 */
module n2_core_pll_div4_cust(clk ,arst_l ,clk_div_out );
output		clk_div_out ;
input		clk ;
input		arst_l ;
supply1		vdd ;
 
wire		div4_l ;
wire		clk_div ;
wire		n1 ;
wire		n2 ;
wire		n3 ;
wire		n4 ;
wire		net19 ;
wire		net038 ;
wire		net26 ;
wire		net33 ;
wire		clk_div_l ;
wire		div2_l ;
 
 
n2_core_pll_inv_8x_cust x2 (
     .vdd_reg         (vdd ),
     .out             (clk_div_l ),
     .in              (clk_div ) );
cl_u1_inv_4x x3 (
     .out             (net038 ),
     .in              (arst_l ) );
n2_core_pll_flop_reset_new_cust x4 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (n2 ),
     .reset           (net038 ),
     .clk             (clk ),
     .q_l             (div2_l ),
     .q               (net33 ) );
n2_core_pll_flop_reset_new_cust x5 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (n4 ),
     .reset           (net038 ),
     .clk             (div2_l ),
     .q_l             (div4_l ),
     .q               (net26 ) );
n2_core_pll_flop_reset_new_cust x6 (
     .vdd_reg         (vdd ),
     .reset_val_l     (vdd ),
     .d               (div4_l ),
     .reset           (net038 ),
     .clk             (clk ),
     .q_l             (clk_div ),
     .q               (net19 ) );
n2_core_pll_buf_2x_cust x9 (
     .vdd_reg         (vdd ),
     .out             (n2 ),
     .in              (n1 ) );
n2_core_pll_buf_2x_cust x10 (
     .vdd_reg         (vdd ),
     .out             (n3 ),
     .in              (div4_l ) );
n2_core_pll_buf_2x_cust x11 (
     .vdd_reg         (vdd ),
     .out             (n4 ),
     .in              (n3 ) );
//terminator ix3 (
//     .TERM            (net33 ) );
//terminator ix4 (
//     .TERM            (net26 ) );
//terminator ix5 (
//     .TERM            (net19 ) );
n2_core_pll_buf_2x_cust x0 (
     .vdd_reg         (vdd ),
     .out             (n1 ),
     .in              (div2_l ) );
n2_core_pll_inv_32x_cust x1 (
     .vdd_reg         (vdd ),
     .out             (clk_div_out ),
     .in              (clk_div_l ) );
endmodule


// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_inv_16x_cust/rtl/n2_core_pll_inv_16x_cust.v
// ==========================================================================
//  mh157021: lower level module definition (n2_core_pll_inv_16x_cust)
//
//  Last Modified: Friday Aug 26,2005 at 03:20:28 PM PDT
//

module n2_core_pll_inv_16x_cust(vdd_reg ,out ,in );
output          out ;
input           vdd_reg ;
input           in ;
wire vss = 1'b0;

assign out = ~in;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_tpm3_cust/rtl/n2_core_pll_tpm3_cust.v
// ==========================================================================
/*
 File: /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_tpm3_cust/schematic/sch.cdb
 Last Modified: Wednesday Oct 12,2005 at 04:19:44 PM PDT
 By: ky82615
 */
module n2_core_pll_tpm3_cust(reset ,ip ,vdd_reg ,op ,sel ,div_ck_i ,
     pwr_rst ,div_ck ,vco_ck );
output [5:0]	op ;
input [5:0]	ip ;
output		sel ;
output		div_ck ;
input		reset ;
input		vdd_reg ;
input		div_ck_i ;
input		pwr_rst ;
input		vco_ck ;
wire vss = 1'b0;
 
wire		net183 ;
wire		nz_2 ;
wire		net201 ;
wire		net282 ;
wire		nz_3 ;
wire		nz_4 ;
wire		nz_5 ;
wire		net186 ;
wire		net205 ;
wire		f4q ;
wire		f5d ;
wire		net195 ;
wire		vco_ckb ;
wire		vco_ckd ;
wire		net198 ;
wire		f5q ;
wire		r_gate ;
wire		reset_d ;
wire		net0362 ;
wire		net235 ;
wire		zero_0 ;
wire		net236 ;
wire		zero_1 ;
wire		zero_2 ;
wire		f0d ;
wire		zero_3 ;
wire		zero_4 ;
wire		zero_5 ;
wire		sel_b ;
wire		f0q ;
wire		net147 ;
wire		f1d ;
wire		net252 ;
wire		net256 ;
wire		net0248 ;
wire		net159 ;
wire		f1q ;
wire		f2d ;
wire		nzero_0 ;
wire		nzero_1 ;
wire		net162 ;
wire		nzero_2 ;
wire		nzero_3 ;
wire		nzero_4 ;
wire		nzero_5 ;
wire		f2q ;
wire		next0 ;
wire		next1 ;
wire		next2 ;
wire		next3 ;
wire		f3d ;
wire		next4 ;
wire		next5 ;
wire		net171 ;
wire		nip0 ;
wire		nip1 ;
wire		nip2 ;
wire		nip3 ;
wire		nip4 ;
wire		nip5 ;
wire		net0501 ;
wire		f3q ;
wire		net0502 ;
wire		net0503 ;
wire		net0504 ;
wire		f4d ;
wire		net0505 ;
wire		net0506 ;
wire		nz_0 ;
wire		nz_1 ;
 
 
n2_core_pll_buf_4x_cust x2 (
     .vdd_reg         (vdd_reg ),
     .out             (net205 ),
     .in              (ip[0] ) );
n2_core_pll_buf_16x_cust x4 (
     .vdd_reg         (vdd_reg ),
     .out             (reset_d ),
     .in              (reset ) );
n2_core_pll_tpm_mux_cust x5 (
     .opb             (nzero_0 ),
     .vdd_reg         (vdd_reg ),
     .op              (nz_0 ),
     .d0              (ip[0] ),
     .d1              (nip0 ),
     .sel             (net256 ),
     .sel_b           (net282 ) );
n2_core_pll_buf_8x_cust x6 (
     .vdd_reg         (vdd_reg ),
     .out             (net282 ),
     .in              (pwr_rst ) );
n2_core_pll_inv_8x_cust x7 (
     .vdd_reg         (vdd_reg ),
     .out             (net256 ),
     .in              (pwr_rst ) );
n2_core_pll_buf_4x_cust x8 (
     .vdd_reg         (vdd_reg ),
     .out             (net183 ),
     .in              (ip[1] ) );
n2_core_pll_buf_4x_cust x9 (
     .vdd_reg         (vdd_reg ),
     .out             (net195 ),
     .in              (ip[2] ) );
n2_core_pll_buf_4x_cust x10 (
     .vdd_reg         (vdd_reg ),
     .out             (net159 ),
     .in              (ip[3] ) );
n2_core_pll_buf_4x_cust x11 (
     .vdd_reg         (vdd_reg ),
     .out             (net147 ),
     .in              (ip[4] ) );
n2_core_pll_buf_4x_cust x12 (
     .vdd_reg         (vdd_reg ),
     .out             (net171 ),
     .in              (ip[5] ) );
n2_core_pll_buf_8x_cust x13 (
     .vdd_reg         (vdd_reg ),
     .out             (op[0] ),
     .in              (nip0 ) );
n2_core_pll_buf_8x_cust x14 (
     .vdd_reg         (vdd_reg ),
     .out             (op[1] ),
     .in              (nip1 ) );
n2_core_pll_buf_8x_cust x15 (
     .vdd_reg         (vdd_reg ),
     .out             (op[2] ),
     .in              (nip2 ) );
n2_core_pll_tpm_next_new_cust x16 (
     .vdd_reg         (vdd_reg ),
     .d5              (next5 ),
     .q0b             (zero_0 ),
     .q3b             (zero_3 ),
     .d3              (next3 ),
     .q5b             (zero_5 ),
     .q1b             (zero_1 ),
     .q2b             (zero_2 ),
     .d2              (next2 ),
     .d0              (next0 ),
     .d4              (next4 ),
     .q2              (f2q ),
     .q0              (f0q ),
     .q1              (f1q ),
     .d1              (next1 ),
     .q4b             (zero_4 ) );
n2_core_pll_tpm_mux_cust x17 (
     .opb             (nzero_1 ),
     .vdd_reg         (vdd_reg ),
     .op              (nz_1 ),
     .d0              (ip[1] ),
     .d1              (nip1 ),
     .sel             (net256 ),
     .sel_b           (net282 ) );
n2_core_pll_buf_8x_cust x18 (
     .vdd_reg         (vdd_reg ),
     .out             (op[3] ),
     .in              (nip3 ) );
n2_core_pll_buf_8x_cust x19 (
     .vdd_reg         (vdd_reg ),
     .out             (op[4] ),
     .in              (nip4 ) );
n2_core_pll_buf_8x_cust x20 (
     .vdd_reg         (vdd_reg ),
     .out             (op[5] ),
     .in              (nip5 ) );
n2_core_pll_tpm_mux_cust x23 (
     .opb             (nzero_2 ),
     .vdd_reg         (vdd_reg ),
     .op              (nz_2 ),
     .d0              (ip[2] ),
     .d1              (nip2 ),
     .sel             (net256 ),
     .sel_b           (net282 ) );
n2_core_pll_tpm_gate2_cust x24 (
     .vdd_reg         (vdd_reg ),
     .div_ck          (div_ck ),
     .r               (r_gate ),
     .ck              (vco_ck ) );
n2_core_pll_flop_reset_new_cust x25 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (net205 ),
     .reset           (reset_d ),
     .clk             (div_ck_i ),
     .q_l             (net201 ),
     .q               (nip0 ) );
n2_core_pll_flop_reset_new_cust x26 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (net183 ),
     .reset           (reset_d ),
     .clk             (div_ck_i ),
     .q_l             (net186 ),
     .q               (nip1 ) );
n2_core_pll_tpm_mux_cust x27 (
     .opb             (nzero_3 ),
     .vdd_reg         (vdd_reg ),
     .op              (nz_3 ),
     .d0              (ip[3] ),
     .d1              (nip3 ),
     .sel             (net256 ),
     .sel_b           (net282 ) );
n2_core_pll_tpm_mux_cust x28 (
     .opb             (nzero_4 ),
     .vdd_reg         (vdd_reg ),
     .op              (nz_4 ),
     .d0              (ip[4] ),
     .d1              (nip4 ),
     .sel             (net256 ),
     .sel_b           (net282 ) );
n2_core_pll_tpm_mux_cust x29 (
     .opb             (nzero_5 ),
     .vdd_reg         (vdd_reg ),
     .op              (nz_5 ),
     .d0              (ip[5] ),
     .d1              (nip5 ),
     .sel             (net256 ),
     .sel_b           (net282 ) );
//terminator i50 (
//     .TERM            (f4q ) );
n2_core_pll_flop_reset_new_cust x30 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (net195 ),
     .reset           (reset_d ),
     .clk             (div_ck_i ),
     .q_l             (net198 ),
     .q               (nip2 ) );
//terminator i51 (
//     .TERM            (f5q ) );
n2_core_pll_inv_32x_cust x31 (
     .vdd_reg         (vdd_reg ),
     .out             (vco_ckd ),
     .in              (net252 ) );
//terminator i52 (
//     .TERM            (net0248 ) );
n2_core_pll_flop_reset_new_cust x32 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (net159 ),
     .reset           (reset_d ),
     .clk             (div_ck_i ),
     .q_l             (net162 ),
     .q               (nip3 ) );
n2_core_pll_flop_reset_new_cust x33 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (net147 ),
     .reset           (reset_d ),
     .clk             (div_ck_i ),
     .q_l             (net235 ),
     .q               (nip4 ) );
//terminator i54 (
//     .TERM            (net236 ) );
n2_core_pll_flop_reset_new_cust x34 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (net171 ),
     .reset           (reset_d ),
     .clk             (div_ck_i ),
     .q_l             (net236 ),
     .q               (nip5 ) );
//terminator i55 (
//     .TERM            (net235 ) );
//terminator i56 (
//     .TERM            (net162 ) );
n2_core_pll_flop_reset_new_cust x36 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (f1d ),
     .reset           (reset_d ),
     .clk             (vco_ckd ),
     .q_l             (zero_1 ),
     .q               (f1q ) );
//terminator i57 (
//     .TERM            (net198 ) );
n2_core_pll_flop_reset_new_cust x37 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (f2d ),
     .reset           (reset_d ),
     .clk             (vco_ckd ),
     .q_l             (zero_2 ),
     .q               (f2q ) );
//terminator i58 (
//     .TERM            (net186 ) );
n2_core_pll_flop_reset_new_cust x38 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (f3d ),
     .reset           (reset_d ),
     .clk             (vco_ckd ),
     .q_l             (zero_3 ),
     .q               (f3q ) );
//terminator i59 (
//     .TERM            (net201 ) );
n2_core_pll_flop_reset_new_cust x39 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (f4d ),
     .reset           (reset_d ),
     .clk             (vco_ckd ),
     .q_l             (zero_4 ),
     .q               (f4q ) );
//terminator i60 (
//     .TERM            (f3q ) );
n2_core_pll_tpm_zd1_cust x40 (
     .vdd_reg         (vdd_reg ),
     .zero1           (sel ),
     .zero1_b         (sel_b ),
     .q4b             (zero_4 ),
     .q0b             (zero_0 ),
     .q1b             (zero_1 ),
     .q2b             (zero_2 ),
     .q3b             (zero_3 ),
     .q5b             (zero_5 ) );
//terminator i61 (
//     .TERM            (net0506 ) );
n2_core_pll_inv_8x_cust x41 (
     .vdd_reg         (vdd_reg ),
     .out             (net252 ),
     .in              (vco_ck ) );
//terminator i62 (
//     .TERM            (net0505 ) );
n2_core_pll_flop_reset_new_cust x42 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (f5d ),
     .reset           (reset_d ),
     .clk             (vco_ckd ),
     .q_l             (zero_5 ),
     .q               (f5q ) );
//terminator i63 (
//     .TERM            (net0504 ) );
n2_core_pll_flop_reset_new_cust x43 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vss ),
     .d               (sel ),
     .reset           (reset_d ),
     .clk             (vco_ckb ),
     .q_l             (r_gate ),
     .q               (net0248 ) );
//terminator i64 (
//     .TERM            (net0503 ) );
n2_core_pll_flop_reset_new_cust x44 (
     .vdd_reg         (vdd_reg ),
     .reset_val_l     (vdd_reg ),
     .d               (f0d ),
     .reset           (reset_d ),
     .clk             (vco_ckd ),
     .q_l             (zero_0 ),
     .q               (f0q ) );
//terminator i65 (
//     .TERM            (net0502 ) );
//terminator i66 (
//     .TERM            (net0501 ) );
n2_core_pll_tpm_mux_cust x47 (
     .opb             (net0506 ),
     .vdd_reg         (vdd_reg ),
     .op              (f0d ),
     .d0              (next0 ),
     .d1              (nz_0 ),
     .sel             (sel ),
     .sel_b           (sel_b ) );
//terminator i68 (
//     .TERM            (net0362 ) );
n2_core_pll_tpm_mux_cust x48 (
     .opb             (net0505 ),
     .vdd_reg         (vdd_reg ),
     .op              (f1d ),
     .d0              (next1 ),
     .d1              (nz_1 ),
     .sel             (sel ),
     .sel_b           (sel_b ) );
n2_core_pll_tpm_nzd_cust x49 (
     .vdd_reg         (vdd_reg ),
     .q2b             (nzero_2 ),
     .q4b             (nzero_4 ),
     .q3b             (nzero_3 ),
     .zero            (net0362 ),
     .q1b             (nzero_1 ),
     .q0b             (nzero_0 ),
     .q5b             (nzero_5 ) );
n2_core_pll_tpm_mux_cust x50 (
     .opb             (net0504 ),
     .vdd_reg         (vdd_reg ),
     .op              (f2d ),
     .d0              (next2 ),
     .d1              (nz_2 ),
     .sel             (sel ),
     .sel_b           (sel_b ) );
n2_core_pll_tpm_mux_cust x51 (
     .opb             (net0503 ),
     .vdd_reg         (vdd_reg ),
     .op              (f3d ),
     .d0              (next3 ),
     .d1              (nz_3 ),
     .sel             (sel ),
     .sel_b           (sel_b ) );
n2_core_pll_tpm_mux_cust x52 (
     .opb             (net0502 ),
     .vdd_reg         (vdd_reg ),
     .op              (f4d ),
     .d0              (next4 ),
     .d1              (nz_4 ),
     .sel             (sel ),
     .sel_b           (sel_b ) );
n2_core_pll_tpm_mux_cust x53 (
     .opb             (net0501 ),
     .vdd_reg         (vdd_reg ),
     .op              (f5d ),
     .d0              (next5 ),
     .d1              (nz_5 ),
     .sel             (sel ),
     .sel_b           (sel_b ) );
n2_core_pll_inv_4x_cust x1 (
     .vdd_reg         (vdd_reg ),
     .out             (vco_ckb ),
     .in              (vco_ckd ) );
endmodule


// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_inv_1x_cust/rtl/n2_core_pll_inv_1x_cust.v
// ==========================================================================
//  mh157021:  instance #6 (n2_core_pll_inv_1x_cust)
//
//  Last Modified: Friday Aug 26,2005 at 03:20:30 PM PDT
//

module n2_core_pll_inv_1x_cust(vdd_reg ,out ,in );
output          out ;
input           vdd_reg ;
input           in ;
wire vss = 1'b0;

assign out = ~in;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_tpm3_sync_cust/rtl/n2_core_pll_tpm3_sync_cust.v
// ==========================================================================
/*
 File: /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_tpm3_sync_cust/schematic/sch.cdb
 Last Modified: Saturday Dec 10,2005 at 07:49:42 PM PST
 By: ky82615
 */
module n2_core_pll_tpm3_sync_cust(dri1_clk ,dft_rst_l ,dc_clk ,d4int_out
      ,ccu_serdes_dtm ,arst_l ,arst ,vco_clk ,pll1_clk ,arst_d_l ,a ,
     rst_l ,rst ,volb );
output [0:0]	rst_l ;
output [1:1]	rst ;
input [2:2]	a ;
output		dc_clk ;
output		d4int_out ;
output		arst ;
output		vco_clk ;
output		arst_d_l ;
input		dri1_clk ;
input		dft_rst_l ;
input		ccu_serdes_dtm ;
input		arst_l ;
input		pll1_clk ;
input		volb ;
supply1		vdd ;
supply0		vss ;
 
wire [1:1]	rstpa ;
wire [1:0]	rstp_l ;
wire [1:1]	rstpb ;
wire [1:0]	rstp ;
wire [1:0]	rstp1 ;
wire [1:0]	net127 ;
wire		net77 ;
wire		net110 ;
wire		net79 ;
wire		net112 ;
wire		net115 ;
wire		net116 ;
wire		net81 ;
wire		net120 ;
wire		vco_clk_d ;
wire		net63 ;
wire		vco_out ;
wire		net69 ;
 
 
assign vco_out = ~volb;
assign dc_clk = ~vco_out;
assign vco_clk = ~dc_clk;

n2_core_pll_inv1_16x_cust x2 (
     .vdd_reg         (vdd ),
     .out             (rstpa[1] ),
     .in              (rstp_l[1] ) );
//terminator ix1_0_ (
//     .TERM            (rstp[0] ) );
n2_core_pll_flop_reset2_cust x5_1_ (
     .d               (rstp1[0] ),
     .clk             (vco_clk_d ),
     .q_l             (net127[0] ),
     .q               (rstp1[1] ) );
n2_core_pll_inv1_16x_cust x8 (
     .vdd_reg         (vdd ),
     .out             (arst ),
     .in              (arst_l ) );
cl_u1_nand2_8x x9 (
     .out             (rst[1] ),
     .in1             (ccu_serdes_dtm ),
     .in0             (net63 ) );
//nmos_lvt mnout (
//     .S               (vss ),
//     .G               (volb ),
//     .D               (vco_out ) );
//nmos mi3 (vco_clk ,vss ,dc_clk  );
//terminator ixa_0_ (
//     .TERM            (net127[1] ) );
//terminator i3 (
//     .TERM            (net81 ) );
//terminator i4 (
//     .TERM            (net112 ) );
n2_core_pll_fse2diff_out_cust x10 (
     .vdd_reg         (vdd ),
     .in              (vco_clk ),
     .out_l           (net81 ),
     .out             (vco_clk_d ) );
cl_u1_inv_4x x11 (
     .out             (net77 ),
     .in              (net69 ) );
n2_core_pll_fse2diff_out_cust x12 (
     .vdd_reg         (vdd ),
     .in              (rstpa[1] ),
     .out_l           (net112 ),
     .out             (rstpb[1] ) );
n2_core_pll_inv1_16x_cust x14 (
     .vdd_reg         (vdd ),
     .out             (arst_d_l ),
     .in              (arst ) );
//terminator ixa_1_ (
//     .TERM            (net127[0] ) );
cl_u1_inv_4x x15 (
     .out             (net79 ),
     .in              (a[2] ) );
cl_u1_inv_2x x16 (
     .out             (net63 ),
     .in              (rstp[1] ) );
n2_core_pll_flop_reset1_cust x17 (
     .reset_val_l     (vdd ),
     .d               (net116 ),
     .reset           (rst[1] ),
     .clk             (dri1_clk ),
     .q_l             (net120 ),
     .q               (net110 ) );
n2_core_pll_flop_reset2_cust xb_0_ (
     .d               (dft_rst_l ),
     .clk             (pll1_clk ),
     .q_l             (rstp[0] ),
     .q               (rstp_l[0] ) );
n2_core_pll_inv1_16x_cust x22 (
     .vdd_reg         (vdd ),
     .out             (rst_l[0] ),
     .in              (net77 ) );
n2_core_pll_flop_reset2_cust xb_1_ (
     .d               (rstp_l[0] ),
     .clk             (vco_clk ),
     .q_l             (rstp[1] ),
     .q               (rstp_l[1] ) );
n2_core_pll_tpm_mux_cust x37 (
     .opb             (net69 ),
     .vdd_reg         (vdd ),
     .op              (net115 ),
     .d0              (rstp1[1] ),
     .d1              (rstp1[0] ),
     .sel             (a[2] ),
     .sel_b           (net79 ) );
//pfet_lvt mpout (
//     .G               (volb ),
//     .S               (vco_out ),
//     .B               (vdd ),
//     .D               (vdd ) );
//pfet m0 (
//     .G               (dc_clk ),
//     .S               (vdd ),
//     .B               (vdd ),
//     .D               (vco_clk ) );
//nmos m1 (dc_clk ,vss ,vco_out  );
//pfet m2 (
//     .G               (vco_out ),
//     .S               (vdd ),
//     .B               (vdd ),
//     .D               (dc_clk ) );
n2_core_pll_flop_reset2_cust x5_0_ (
     .d               (rstpb[1] ),
     .clk             (vco_clk_d ),
     .q_l             (net127[1] ),
     .q               (rstp1[0] ) );
//terminator i10 (
//     .TERM            (net115 ) );
cl_u1_inv_8x x0 (
     .out             (d4int_out ),
     .in              (net110 ) );
cl_u1_buf_1x x1 (
     .out             (net116 ),
     .in              (net120 ) );
endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_d4_frac_cust/rtl/n2_core_pll_d4_frac_cust.v
// ==========================================================================
/*
 File: /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_d4_frac_cust/schematic/sch.cdb
 Last Modified: Saturday Dec 10,2005 at 04:26:42 PM PST
 By: ky82615
 */
module n2_core_pll_d4_frac_cust(dft_rst_l ,vco_clk ,a ,out_clk );
input [4:0]	a ;
output		out_clk ;
input		dft_rst_l ;
input		vco_clk ;
supply1		vdd ;
 
wire		bs_pclk_0 ;
wire		bs_rstps_0 ;
wire		bs_pi_clk_4 ;
wire		bs_cac_l_0 ;
wire		bs_csel_l_1 ;
wire		bs_ph_clk_4 ;
wire		bs_csel_1 ;
wire		bs_csel_l_3 ;
wire		bs_pclk_4 ;
wire		bs_rstps_4 ;
wire		bs_csel_3 ;
wire		bs_pi_clk_0 ;
wire		bs_cac_l_4 ;
wire		bs_ph_clk_0 ;
 
 
n2_core_pll_d4_sync_cust x3 (
     .dft_rst_l       (dft_rst_l ),
     .bs_rstps_4       (bs_rstps_4 ),
     .bs_rstps_0       (bs_rstps_0 ),
     .bs_pclk_4        (bs_pclk_4 ),
     .bs_pclk_0        (bs_pclk_0 ) );
//n2_core_pll_fse2diff_out_cust x1_1_ (
//     .vdd_reg         (vdd ),
//     .in              (vco_clk ),
//     .out_l           (bs_ph_clk_4 ),
//     .out             (bs_ph_clk_0 ) );
n2_core_pll_d4_ctl_cust x2_0_ (
     .csel_l          ({bs_csel_l_1 } ),
     .csel            ({bs_csel_1 } ),
     .a               ({a } ),
     .cac_l           (bs_cac_l_0 ),
     .pclk            (bs_pclk_0 ),
     .out_clk         (bs_pi_clk_0 ),
     .eq              (bs_csel_l_1 ),
     .in_clk          (bs_ph_clk_0 ),
     .rstps           (bs_rstps_0 ) );
//terminator ix6_0_ (
//     .TERM            (\csel[1] ) );
n2_core_pll_d4_ctl_cust x2_1_ (
     .csel_l          ({bs_csel_l_3 } ),
     .csel            ({bs_csel_3 } ),
     .a               ({a } ),
     .cac_l           (bs_cac_l_4 ),
     .pclk            (bs_pclk_4 ),
     .out_clk         (bs_pi_clk_4 ),
     .eq              (bs_csel_3 ),
     .in_clk          (bs_ph_clk_4 ),
     .rstps           (bs_rstps_4 ) );
//terminator ix7_0_ (
//     .TERM            (\csel_l[3] ) );
//terminator ix8_0_ (
//     .TERM            (\cac_l[0] ) );
//terminator ix8_1_ (
//     .TERM            (\cac_l[4] ) );
n2_core_pll_fse2diff_out_cust x1_0_ (
     .vdd_reg         (vdd ),
     .in              (vco_clk ),
     .out_l           (bs_ph_clk_4 ),
     .out             (bs_ph_clk_0 ) );
n2_core_pll_d4_mux_cust x0 (
     .rstps           ({bs_rstps_0 } ),
     .out_clk         (out_clk ),
     .bs_pi_clk_4      (bs_pi_clk_4 ),
     .bs_pi_clk_0      (bs_pi_clk_0 ) );
endmodule


// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_ckmux_cust/rtl/n2_core_pll_ckmux_cust.v
// ==========================================================================
/*
 File: /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_ckmux_cust/schematic/sch.cdb
 Last Modified: Friday Dec  9,2005 at 04:20:36 PM PST
 By: ky82615
 */

`timescale 1 ps/ 1 ps

module n2_core_pll_ckmux_cust(pll_sdel ,ckt_drv_int ,cktree_drv_l ,
     ext_clk ,dft_rst_a_l ,dft_rst_l ,bypass_pll_clk ,psel1 ,psel0 ,
     stretch_a ,async_reset ,cktree_drv ,pll1_clk ,pll_sel ,bypass_clk
      );
input [1:0]	pll_sdel ;
input [1:0]	pll_sel ;
output		ckt_drv_int ;
output		cktree_drv_l ;
output		dft_rst_l ;
output		psel1 ;
output		psel0 ;
output		cktree_drv ;
input		ext_clk ;
input		dft_rst_a_l ;
input		bypass_pll_clk ;
input		stretch_a ;
input		async_reset ;
input		pll1_clk ;
input		bypass_clk ;
supply0		vss ;
 
wire		sel_n0 ;
wire		byp_pll_clk_l ;
wire		sel_n1 ;
wire		net93 ;
wire		pll_sel0_l ;
wire		byp_pll_clk ;
wire		s0_l ;
wire		sel0 ;
wire		sel1 ;
wire		s1_l ;
wire		sel2 ;
wire		sel3 ;
wire		net069 ;
wire		psel0_l ;
wire		psel1_l ;
wire		d1_clk ;
wire		net070 ;
wire		net071 ;
wire		sel_n1_l ;
wire		s0 ;
wire		s1 ;
wire		sel_n0_l ;
wire		sel2_l ;
wire		sel3_l ;
wire		net64 ;

wire net069_orig; 
wire net070_orig;

assign #200 net069 = net069_orig;
assign #200 net070 = net070_orig;
 
cl_u1_nand2_4x x2 (
     .out             (s1_l ),
     .in1             (sel_n1_l ),
     .in0             (sel_n0 ) );
cl_u1_inv_16x x4 (
     .out             (sel3 ),
     .in              (sel3_l ) );
cl_u1_inv_4x x5 (
     .out             (s1 ),
     .in              (s1_l ) );
cl_u1_inv_8x x6 (
     .out             (byp_pll_clk_l ),
     .in              (bypass_pll_clk ) );
cl_u1_inv_1x x7 (
     .out             (pll_sel0_l ),
     .in              (pll_sel[0] ) );
cl_u1_nand2_4x x8 (
     .out             (sel2_l ),
     .in1             (pll_sel[1] ),
     .in0             (pll_sel0_l ) );
n2_core_pll_flopderst_16x_cust xi72 (
     .q_l             (net64 ),
     .reset_val       (byp_pll_clk_l ),
     .d               (s0 ),
     .q               (sel0 ),
     .reset           (async_reset ),
     .clk             (d1_clk ),
     .ena             (net071 ) );
n2_core_pll_flopderst_16x_cust xi74 (
     .q_l             (net93 ),
     .reset_val       (vss ),
     .d               (s1 ),
     .q               (sel1 ),
     .reset           (async_reset ),
     .clk             (d1_clk ),
     .ena             (net071 ) );
n2_core_pll_flopderst_16x_cust xi75 (
     .q_l             (sel_n1_l ),
     .reset_val       (byp_pll_clk ),
     .d               (net069 ),
     .q               (sel_n1 ),
     .reset           (async_reset ),
     .clk             (d1_clk ),
     .ena             (net071 ) );
n2_core_pll_flopderst_16x_cust xi76 (
     .q_l             (sel_n0_l ),
     .reset_val       (byp_pll_clk ),
     .d               (net070 ),
     .q               (sel_n0 ),
     .reset           (async_reset ),
     .clk             (d1_clk ),
     .ena             (net071 ) );
cl_u1_nand2_4x x10 (
     .out             (sel3_l ),
     .in1             (pll_sel[1] ),
     .in0             (pll_sel[0] ) );
cl_u1_inv_16x x11 (
     .out             (sel2 ),
     .in              (sel2_l ) );
cl_u1_inv_8x x16 (
     .out             (psel1 ),
     .in              (psel1_l ) );
cl_u1_inv_2x x22 (
     .out             (psel1_l ),
     .in              (sel1 ) );
cl_u1_inv_2x x23 (
     .out             (psel0_l ),
     .in              (sel0 ) );
cl_u1_inv_8x x24 (
     .out             (psel0 ),
     .in              (psel0_l ) );
cl_u1_inv_8x x26 (
     .out             (byp_pll_clk ),
     .in              (byp_pll_clk_l ) );
cl_u1_inv_4x x27 (
     .out             (s0 ),
     .in              (s0_l ) );
n2_core_pll_ckmux_mxdel_diffout_cust xmxdel (
     .pll_sdel        ({pll_sdel } ),
     .ckt_drv_int     (ckt_drv_int ),
     .cktree_drv      (cktree_drv ),
     .cktree_drv_l    (cktree_drv_l ),
     .pll1_clk        (pll1_clk ),
     .sel1            (sel1 ),
     .pll2_clk        (ext_clk ),
     .bypass_clk      (bypass_clk ),
     .sel3            (sel3 ),
     .d1_clk          (d1_clk ),
     .sel0            (sel0 ),
     .sel2            (sel2 ) );
//terminator ix21 (
//     .TERM            (net93 ) );
//terminator ix25 (
//     .TERM            (net64 ) );
//terminator ix28 (
//     .TERM            (sel_n1 ) );
n2_core_pll_clkmux_sync_cust x0 (
     .bypass_pll_clk  (bypass_pll_clk ),
     .pll_clk         (pll1_clk ),
     .arst            (async_reset ),
     .d1              (pll_sel[0] ),
     .d2              (pll_sel[1] ),
     .d1_sync         (net070_orig ),
     .d2_sync         (net069_orig ),
     .d0_sync         (net071),	
     .d0              (stretch_a ),
     .d3_sync         (dft_rst_l ),
     .d3              (dft_rst_a_l ) );
cl_u1_nand2_1x x1 (
     .out             (s0_l ),
     .in1             (sel_n1_l ),
     .in0             (sel_n0_l ) );


endmodule


// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_buf_2x_cust/rtl/n2_core_pll_buf_2x_cust.v
// ==========================================================================
//  mh157021: lower level module definition (n2_core_pll_buf_2x_cust)
//
//  Last Modified: Friday Aug 26,2005 at 03:19:04 PM PDT
//

module n2_core_pll_buf_2x_cust(vdd_reg ,out ,in );
output          out ;
input           vdd_reg ;
input           in ;
wire vss = 1'b0;

assign out = in;

endmodule

// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_ckmux_mxdel_diffout_cust/rtl/mux4k.v
// ==========================================================================
module  mux4k ( dout, in0,  in1,  in2,  in3,
                     sel0, sel1, sel2, sel3, muxtst );

   parameter                    SIZE = 1;

   output       [SIZE-1:0]      dout;
   input        [SIZE-1:0]      in0;
   input        [SIZE-1:0]      in1;
   input        [SIZE-1:0]      in2;
   input        [SIZE-1:0]      in3;
   input                        sel0;
   input                        sel1;
   input                        sel2;
   input                        sel3;
   input                        muxtst;

   wire              [4:0]      sel = { muxtst, sel3, sel2, sel1, sel0 };

   reg          [SIZE-1:0]      dout;
   always @ ( sel or in0 or in1 or in2 or in3 )
     casex ( sel )
       5'bx0001:                        dout = in0;
       5'bx0010:                        dout = in1;
       5'bx0100:                        dout = in2;
       5'bx1000:                        dout = in3;
       5'b00000:                        dout = { SIZE { 1'bx } };

       default:
              dout = { SIZE { 1'bx } };
     endcase // case( sel )


endmodule // mux4k



module n2_core_pll_byp_enb_cust(sel1 ,in1 ,out1 ,out0 ,in0 ,sel0 );
output		out1 ;
output		out0 ;
input		sel1 ;
input		in1 ;
input		in0 ;
input		sel0 ;
supply1		vdd ;
 
wire		net11 ;
wire		net8 ;
 
 
n2_core_pll_inv_8x_cust x4 (
     .vdd_reg         (vdd ),
     .out             (out1 ),
     .in              (net8 ) );
n2_core_pll_nand2_2x_cust x8 (
     .vdd_reg         (vdd ),
     .out             (net11 ),
     .in1             (sel0 ),
     .in0             (in0 ) );
n2_core_pll_nand2_2x_cust x10 (
     .vdd_reg         (vdd ),
     .out             (net8 ),
     .in1             (sel1 ),
     .in0             (in1 ) );
n2_core_pll_inv_8x_cust x11 (
     .vdd_reg         (vdd ),
     .out             (out0 ),
     .in              (net11 ) );
endmodule



module n2_core_pll_pecl_enb_cust(in ,out ,enb1 ,enb0 );
output		out ;
input		in ;
input		enb1 ;
input		enb0 ;
supply1		vdd ;
 
wire		net10 ;
wire		net12 ;
wire		net8 ;
 
 
n2_core_pll_nand2_4x_cust x12 (
     .vdd_reg         (vdd ),
     .out             (net8 ),
     .in1             (net10 ),
     .in0             (in ) );
n2_core_pll_inv_16x_cust x22 (
     .vdd_reg         (vdd ),
     .out             (out ),
     .in              (net8 ) );
cl_u1_nor2_2x x0 (
     .out             (net12 ),
     .in1             (enb0 ),
     .in0             (enb1 ) );
cl_u1_inv_2x x1 (
     .out             (net10 ),
     .in              (net12 ) );
endmodule


module n2_core_pll_nand2_4x_cust(vdd_reg ,out ,in1 ,in0 );
output          out ;
input           vdd_reg ;
input           in1 ;
input           in0 ;
wire vss = 1'b0;

assign out = ~(in0 & in1);

endmodule

module n2_core_pll_tpm3_all_cust(pll_stretch_a ,ccu_serdes_dtm ,
     dr_ext_clk ,dc_clk ,pll_clk_out_l ,pll_div3 ,pll_sdel ,pll_sel_a ,
     pll_bypass_clk_en ,pll_arst_l ,dr_clk_out ,pll_bypass_clk ,
     pll_clk_out ,dr_clk_out_l ,dr_stretch_a ,pll_testmode ,dr_sdel ,
     vco8_clk ,dr_sel_a ,volb ,vco2_clk ,pll_ext_clk ,pll_div4 ,
     dft_rst_a_l );
input [5:0]	pll_div3 ;
input [1:0]	pll_sdel ;
input [1:0]	pll_sel_a ;
input [1:0]	dr_sdel ;
input [1:0]	dr_sel_a ;
input [6:0]	pll_div4 ;
output		dc_clk ;
output		pll_clk_out_l ;
output		dr_clk_out ;
output		pll_clk_out ;
output		dr_clk_out_l ;
output		vco8_clk ;
output		vco2_clk ;
input		pll_stretch_a ;
input		ccu_serdes_dtm ;
input		dr_ext_clk ;
input		pll_bypass_clk_en ;
input		pll_arst_l ;
input		pll_bypass_clk ;
input		dr_stretch_a ;
input		pll_testmode ;
input		volb ;
input		pll_ext_clk ;
input		dft_rst_a_l ;
supply1		vdd ;
supply0		vss ;
 
wire [1:0]	net077 ;
wire [5:0]	net080 ;
wire [1:1]	rst ;
wire [0:0]	rst_l ;
wire		net088 ;
wire		net0100 ;
wire		net0103 ;
wire		net0104 ;
wire		net095 ;
wire		arst_d_l ;
wire		net096 ;
wire		net097 ;
wire		net098 ;
wire		pll1_clk ;
wire		dr_byp_clk ;
wire		net0153 ;
wire		net042 ;
wire		dr1_clk ;
wire		d4int_out ;
wire		net069 ;
wire		vco_clk ;
wire		pll_byp_clk ;
 
 
n2_core_pll_ckmux_cust x2 (
     .pll_sdel        ({pll_sdel } ),
     .pll_sel         ({pll_sel_a } ),
     .ckt_drv_int     (net0104 ),
     .cktree_drv_l    (pll_clk_out_l ),
     .ext_clk         (pll_ext_clk ),
     .dft_rst_a_l     (vdd ),
     .dft_rst_l       (net0153 ),
     .bypass_pll_clk  (pll_bypass_clk_en ),
     .psel1           (net0103 ),
     .psel0           (net096 ),
     .stretch_a       (pll_stretch_a ),
     .async_reset     (net095 ),
     .cktree_drv      (pll_clk_out ),
     .pll1_clk        (pll1_clk ),
     .bypass_clk      (pll_byp_clk ) );
n2_core_pll_byp_enb_cust x3 (
     .sel1            (ccu_serdes_dtm ),
     .in1             (pll_bypass_clk ),
     .out1            (dr_byp_clk ),
     .out0            (pll_byp_clk ),
     .in0             (pll_bypass_clk ),
     .sel0            (pll_bypass_clk_en ) );
n2_core_pll_ckmux_cust x4 (
     .pll_sdel        ({dr_sdel } ),
     .pll_sel         ({dr_sel_a } ),
     .ckt_drv_int     (net098 ),
     .cktree_drv_l    (dr_clk_out_l ),
     .ext_clk         (dr_ext_clk ),
     .dft_rst_a_l     (vdd ),
     .dft_rst_l       (net097 ),
     .bypass_pll_clk  (ccu_serdes_dtm ),
     .psel1           (net0100 ),
     .psel0           (net042 ),
     .stretch_a       (dr_stretch_a ),
     .async_reset     (net095 ),
     .cktree_drv      (dr_clk_out ),
     .pll1_clk        (dr1_clk ),
     .bypass_clk      (dr_byp_clk ) );
n2_core_pll_div4_cust x5 (
     .clk             (pll1_clk ),
     .arst_l          (pll_testmode ),
     .clk_div_out     (vco8_clk ) );
n2_core_pll_inv_32x_cust x6 (
     .vdd_reg         (vdd ),
     .out             (vco2_clk ),
     .in              (net069 ) );
n2_core_pll_inv_16x_cust x7 (
     .vdd_reg         (vdd ),
     .out             (net069 ),
     .in              (pll1_clk ) );
n2_core_pll_tpm3_cust xd3 (
     .ip              ({pll_div3 } ),
     .op              ({net080[0] ,net080[1] ,net080[2] ,net080[3] ,
            net080[4] ,net080[5] } ),
     .reset           (net095 ),
     .vdd_reg         (vdd ),
     .sel             (net088 ),
     .div_ck_i        (vdd ),
     .pwr_rst         (vdd ),
     .div_ck          (pll1_clk ),
     .vco_ck          (vco_clk ) );
n2_core_pll_inv_1x_cust x11_0_ (
     .vdd_reg         (vdd ),
     .out             (net077[1] ),
     .in              (pll_div4[5] ) );
n2_core_pll_inv_1x_cust x11_1_ (
     .vdd_reg         (vdd ),
     .out             (net077[0] ),
     .in              (pll_div4[6] ) );
n2_core_pll_tpm3_sync_cust x0 (
     .a               ({pll_div4[2] } ),
     .rst_l           ({rst_l[0] } ),
     .rst             ({rst[1] } ),
     .dri1_clk        (vss ),
     .dft_rst_l       (dft_rst_a_l ),
     .dc_clk          (dc_clk ),
     .d4int_out       (d4int_out ),
     .ccu_serdes_dtm  (vss ),
     .arst_l          (pll_arst_l ),
     .arst            (net095 ),
     .vco_clk         (vco_clk ),
     .pll1_clk        (pll1_clk ),
     .arst_d_l        (arst_d_l ),
     .volb            (volb ) );
n2_core_pll_d4_frac_cust x1 (
     .a               ({pll_div4[4:0] } ),
     .dft_rst_l       (rst_l[0] ),
     .vco_clk         (vco_clk ),
     .out_clk         (dr1_clk ) );
endmodule


// ==========================================================================
// /import/n2-analog3/ky82615/n2cdmspp/libs/analog/n2_core_pll_cust_l/n2_core_pll_clkmux_delay/rtl/n2_core_pll_clkmux_delay.v
// ==========================================================================
//  mh157021: lower level module definition (n2_core_pll_clkmux_delay)
//
//  Last Modified: Friday Aug 26,2005 at 03:19:23 PM PDT
//

`timescale 1 ps / 1 ps

module n2_core_pll_clkmux_delay(pll_sdel ,mux_out ,d );
input [1:0]     pll_sdel ;
output          mux_out ;
input           d ;
supply1         vdd ;
wire vss = 1'b0;

wire [3:0] sel;

wire d0, d1, d2, d3;

assign #40 d0 = d;
assign #40 d1 = d0;
assign #40 d2 = d1;
assign #40 d3 = d2;

decode x0 (
     .a (pll_sdel[1:0]),
     .d (sel[3:0]) );


mux4 x1 (
     .muxtst (1'b0),
     .sel0 (sel[0]),
     .sel1 (sel[1]),
     .sel2 (sel[2]),
     .sel3 (sel[3]),
     .in0 (d0),
     .in1 (d1),
     .in2 (d2),
     .in3 (d3),
     .dout (mux_out) );


endmodule
