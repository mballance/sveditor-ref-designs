// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fgu_fad_dp.v
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
module fgu_fad_dp (
  dec_frf_r2_addr_d, 
  dec_frf_r1_32b_d, 
  dec_frf_r2_32b_d, 
  dec_frf_r1_odd32b_d, 
  dec_frf_r2_odd32b_d, 
  fgu_fld_fcc_fx3, 
  lsu_fgu_fld_data_b, 
  lsu_fgu_fld_addr_b, 
  lsu_fgu_fld_vld_w, 
  lsu_fgu_fld_b, 
  lsu_fgu_fld_tid_b, 
  lsu_fgu_fld_32b_b, 
  lsu_fgu_fld_odd32b_b, 
  lsu_fgu_fsr_load_b, 
  fgu_lsu_fst_data_fx1, 
  exu_fgu_rs1_e, 
  exu_fgu_rs2_e, 
  fac_frf_r1_addr_e, 
  fac_tid_e, 
  fac_aman_fmt_sel_e, 
  fac_bman_fmt_sel_e, 
  fac_fst_fmt_sel_fx1, 
  fac_exu_src_e, 
  fac_w1_addr_fb, 
  fac_fpd_addr_fb, 
  fac_w1_32b_fb, 
  fac_fpd_32b_fb, 
  fac_w1_odd32b_fb, 
  fac_fpd_odd32b_fb, 
  fac_w1_tid_fb, 
  fac_fpd_tid_fb, 
  fac_fsr0_sel_fw, 
  fac_fsr1_sel_fw, 
  fac_fsr2_sel_fw, 
  fac_fsr3_sel_fw, 
  fac_fsr4_sel_fw, 
  fac_fsr5_sel_fw, 
  fac_fsr6_sel_fw, 
  fac_fsr7_sel_fw, 
  main_clken, 
  asi_clken, 
  coreon_clken, 
  fad_w2_addr_fw1_b4, 
  fad_w2_tid_fw1, 
  fad_w2_vld_fw1, 
  fpc_w1_vld_fb, 
  fpc_w1_ul_vld_fb, 
  fpc_fsr_w1_result_fw, 
  fpc_fsr_w2_result_fw, 
  fpc_fpd_exp_res, 
  fpc_fpd_sign_res, 
  fpc_fpd_const_sel, 
  fpc_fcc_fw, 
  fpc_fpd_ieee_trap_fb, 
  fpc_fpd_unfin_fb, 
  fad_gsr_imirnd_fx1, 
  frf_r1_data_e, 
  frf_r2_data_e, 
  fad_w1_tid_fw, 
  fad_w1_vld_fw, 
  fad_w2_result_fw, 
  fad_w2_addr_fw, 
  fad_w2_tid_fw, 
  fad_w2_vld_fw, 
  fad_nombi_w2_result_fw, 
  fad_r1_byp_hit_fx1, 
  fad_r2_byp_hit_fx1, 
  fad_i_parity_2e_fx1, 
  fad_i_parity_2o_fx1, 
  fad_i_parity_1e_fx1, 
  fad_i_parity_1o_fx1, 
  fpf_w1_result_fb, 
  fad_rs1_fmt_fx1, 
  fad_rs2_fmt_fx1, 
  fad_rs1_fx1, 
  fad_rs2_fx1, 
  fad_r1_odd32b_fx1, 
  fad_fsr_rd_fx1, 
  fad_fsr_tem_fx1, 
  fad_fsr_ns_fx1, 
  fdd_result_rep0, 
  fdc_finish_fltd_early_rep0, 
  fdc_finish_flts_early_rep0, 
  fgd_rngl_cdbus_3f, 
  l2clk, 
  scan_in, 
  spc_aclk_wmr, 
  wmr_scan_in, 
  lb_scan_en_wmr, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  tcu_se_scancollar_out, 
  mbi_run, 
  mbi_frf_write_en, 
  fac_mbist_addr_1f, 
  fec_mbist_wdata_1f, 
  fec_mbist_wdata_3f, 
  fad_mbist_cmp64_fx1, 
  scan_out, 
  wmr_scan_out, 
  fgu_rngl_cdbus);
wire stop;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire e_01_scanin;
wire e_01_scanout;
wire [1:0] fpd_vld_fb;
wire r1_odd32b_e;
wire [4:0] r2_addr_e;
wire r1_byp_hit_e;
wire r2_byp_hit_e;
wire w2_32b_fw;
wire w2_odd32b_fw;
wire [3:0] w2_addr_fw1;
wire [1:0] fpd_vld_fw;
wire [4:0] w1_addr_fw;
wire w1_32b_fw;
wire w1_odd32b_fw;
wire w1_ul_vld_fw;
wire w2_32b_fw1;
wire w2_odd32b_fw1;
wire div_finish_flts_fb;
wire div_finish_fltd_fb;
wire mbist_run_1f;
wire mbist_frf_write_en_1f;
wire [4:0] aman_fmt_sel_fx1;
wire [4:0] bman_fmt_sel_fx1;
wire e_01_extra_scanin;
wire e_01_extra_scanout;
wire [4:0] w2_addr_fb;
wire [2:0] w2_tid_fb;
wire w2_32b_fb;
wire w2_odd32b_fb;
wire [1:0] pre_fld_vld_fb;
wire fld_fw;
wire r1_32b_e;
wire r2_32b_e;
wire r2_odd32b_e;
wire [4:0] w2_addr_fw;
wire [2:0] w2_tid_fw;
wire [1:0] pre_fld_vld_fw;
wire fld_fw1;
wire q2_r1_32b_e;
wire q2_r1_odd32b_e;
wire q3_r2_32b_e;
wire q3_r2_odd32b_e;
wire q6_r1_32b_e;
wire q6_r1_odd32b_e;
wire q7_r2_32b_e;
wire q7_r2_odd32b_e;
wire q8_r2_32b_e;
wire q8_r2_odd32b_e;
wire q9_r1_32b_e;
wire q9_r1_odd32b_e;
wire r1_w1_hit_fb;
wire r1_fld_hit_fb;
wire r1_w1_hit_fw;
wire r1_w2_hit_fw;
wire r1_w2_hit_fw1;
wire r2_w1_hit_fb;
wire r2_fld_hit_fb;
wire r2_w1_hit_fw;
wire r2_w2_hit_fw;
wire r2_w2_hit_fw1;
wire i1_r1_byp_hit_e;
wire i2_r1_byp_hit_e;
wire i1_r2_byp_hit_e;
wire i2_r2_byp_hit_e;
wire fx1_rs1byp_scanin;
wire fx1_rs1byp_scanout;
wire [63:0] w2_result_fw1;
wire [63:0] w1_result_fw;
wire fx1_rs2byp_scanin;
wire fx1_rs2byp_scanout;
wire [27:0] fsr0_fx1;
wire [11:0] fsr0_fttexc_merged_fw;
wire fx1_fsr0_wmr_scanin;
wire fx1_fsr0_wmr_scanout;
wire [27:0] ldfsr_data_fw;
wire [27:0] fsr1_fx1;
wire [11:0] fsr1_fttexc_merged_fw;
wire fx1_fsr1_wmr_scanin;
wire fx1_fsr1_wmr_scanout;
wire [27:0] fsr2_fx1;
wire [11:0] fsr2_fttexc_merged_fw;
wire fx1_fsr2_wmr_scanin;
wire fx1_fsr2_wmr_scanout;
wire [27:0] fsr3_fx1;
wire [11:0] fsr3_fttexc_merged_fw;
wire fx1_fsr3_wmr_scanin;
wire fx1_fsr3_wmr_scanout;
wire [27:0] fsr4_fx1;
wire [11:0] fsr4_fttexc_merged_fw;
wire fx1_fsr4_wmr_scanin;
wire fx1_fsr4_wmr_scanout;
wire [27:0] fsr5_fx1;
wire [11:0] fsr5_fttexc_merged_fw;
wire fx1_fsr5_wmr_scanin;
wire fx1_fsr5_wmr_scanout;
wire [27:0] fsr6_fx1;
wire [11:0] fsr6_fttexc_merged_fw;
wire fx1_fsr6_wmr_scanin;
wire fx1_fsr6_wmr_scanout;
wire [27:0] fsr7_fx1;
wire [11:0] fsr7_fttexc_merged_fw;
wire fx1_fsr7_wmr_scanin;
wire fx1_fsr7_wmr_scanout;
wire flop_rng1_4f_scanin;
wire flop_rng1_4f_scanout;
wire [62:0] rngl_cdbus_4f;
wire flop_rng0_4f_scanin;
wire flop_rng0_4f_scanout;
wire fx1_fsr_scanin;
wire fx1_fsr_scanout;
wire [1:0] fsr_ftt_fx1;
wire [4:0] fsr_aexc_fx1;
wire [4:0] fsr_cexc_fx1;
wire [1:0] fsr_fcc3_fx1;
wire [1:0] fsr_fcc2_fx1;
wire [1:0] fsr_fcc1_fx1;
wire [1:0] fsr_fcc0_fx1;
wire [63:0] rs1_fmt_fx1;
wire [63:0] rs2_fmt_fx1;
wire [63:0] fst_data_fx1;
wire [1:0] pre_fpd_vld_fb;
wire fpd_trap_fb;
wire lsu_fgu_fld_32b_b_;
wire lsu_fgu_fld_odd32b_b_;
wire lsu_fgu_fsr_load_b_;
wire fpd_trap_fb_;
wire fac_fpd_odd32b_fb_;
wire fld_w2_even_en_fb;
wire fld_w2_odd_en_fb;
wire mbist_run_1f_;
wire div_finish_flts_even_fb;
wire div_finish_flts_odd_fb;
wire fpd_vld_odd32b_fb;
wire [62:11] q_fdd_result_rep0;
wire [63:0] w2_result_fb;
wire fw_w2data_scanin;
wire fw_w2data_scanout;
wire fw_w1_scanin;
wire fw_w1_scanout;
wire fw_ldfsr_scanin;
wire fw_ldfsr_scanout;
wire [2:0] i_w2_tid_fw;
wire [4:0] i_w2_addr_fw;
wire fw1_w2data_scanin;
wire fw1_w2data_scanout;



// ----------------------------------------------------------------------------
// Interface with DEC
// ----------------------------------------------------------------------------

input    [4:0] dec_frf_r2_addr_d;
input          dec_frf_r1_32b_d;
input          dec_frf_r2_32b_d;
input          dec_frf_r1_odd32b_d;
input          dec_frf_r2_odd32b_d;

output   [7:0] fgu_fld_fcc_fx3;        // ldfsr fcc data {fcc3[1:0], fcc2[1:0], fcc1[1:0], fcc0[1:0]}

// ----------------------------------------------------------------------------
// Interface with LSU
// ----------------------------------------------------------------------------

input   [63:0] lsu_fgu_fld_data_b;
input    [4:0] lsu_fgu_fld_addr_b;
input          lsu_fgu_fld_vld_w;
input          lsu_fgu_fld_b;
input    [2:0] lsu_fgu_fld_tid_b;
input          lsu_fgu_fld_32b_b;
input          lsu_fgu_fld_odd32b_b;
input          lsu_fgu_fsr_load_b;

output  [63:0] fgu_lsu_fst_data_fx1;

// ----------------------------------------------------------------------------
// Interface with EXU
// ----------------------------------------------------------------------------

input   [63:0] exu_fgu_rs1_e;
input   [63:0] exu_fgu_rs2_e;

// ----------------------------------------------------------------------------
// Interface with FAC
// ----------------------------------------------------------------------------

input    [4:0] fac_frf_r1_addr_e;
input    [2:0] fac_tid_e;
input    [4:0] fac_aman_fmt_sel_e;     // aop mantissa format mux select
input    [4:0] fac_bman_fmt_sel_e;     // bop mantissa format mux select
input    [3:0] fac_fst_fmt_sel_fx1;    // store format mux select
input          fac_exu_src_e;

input    [4:0] fac_w1_addr_fb;         // FRF w1 write addr
input    [4:0] fac_fpd_addr_fb;        // FRF w2 write addr (div/sqrt)
input          fac_w1_32b_fb;          // FRF w1 is 32-bit dest
input          fac_fpd_32b_fb;         // FRF w2 is 32-bit dest (div/sqrt)
input          fac_w1_odd32b_fb;       // FRF w1 is odd 32-bit dest (32 LSBs)
input          fac_fpd_odd32b_fb;      // FRF w2 is odd 32-bit dest (32 LSBs) (div/sqrt)

input    [2:0] fac_w1_tid_fb;          // FRF w1 TID
input    [2:0] fac_fpd_tid_fb;         // FRF w2 TID (div/sqrt)

input    [5:0] fac_fsr0_sel_fw;
input    [5:0] fac_fsr1_sel_fw;
input    [5:0] fac_fsr2_sel_fw;
input    [5:0] fac_fsr3_sel_fw;
input    [5:0] fac_fsr4_sel_fw;
input    [5:0] fac_fsr5_sel_fw;
input    [5:0] fac_fsr6_sel_fw;
input    [5:0] fac_fsr7_sel_fw;

input          main_clken;             // main clken
input          asi_clken;              // asi clken: controls ASI ring stage flops in fgd/fad
input          coreon_clken;           // controls all "free running" flops

output         fad_w2_addr_fw1_b4;     // FRF w2 write addr (LSU->FRF path,
output   [2:0] fad_w2_tid_fw1;         // FRF w2 write TID   delayed to fw1)
output   [1:0] fad_w2_vld_fw1;         // FRF w2 write valid (qualified)

// ----------------------------------------------------------------------------
// Interface with FPC
// ----------------------------------------------------------------------------

input    [1:0] fpc_w1_vld_fb;          // FRF w1 write valid (qualified),            [63:32],[31:0]
input          fpc_w1_ul_vld_fb;       // FRF w1 write valid (qualified),            upper or lower
input   [11:0] fpc_fsr_w1_result_fw;   // FSR w1 write data  {ftt,aexc,cexc}
input   [11:0] fpc_fsr_w2_result_fw;   // FSR w2 write data  {ftt,aexc,cexc}
input   [10:0] fpc_fpd_exp_res;        // FPD exponent result
input          fpc_fpd_sign_res;       // FPD sign result
input    [1:0] fpc_fpd_const_sel;      // 10=ones frac, 01=fdd frac, 00=zero frac
input    [1:0] fpc_fcc_fw;
input          fpc_fpd_ieee_trap_fb;
input          fpc_fpd_unfin_fb;

// ----------------------------------------------------------------------------
// Interface with FSD
// ----------------------------------------------------------------------------

output   [2:0] fad_gsr_imirnd_fx1;     // {GSR.im,GSR.irnd[1:0]}

// ----------------------------------------------------------------------------
// Interface with FRF
// ----------------------------------------------------------------------------

input   [63:0] frf_r1_data_e;          // FRF rs1 read data
input   [63:0] frf_r2_data_e;          // FRF rs2 read data

output   [2:0] fad_w1_tid_fw;          // FRF w1 write TID
output   [1:0] fad_w1_vld_fw;          // FRF w1 write valid (qualified)

output  [63:0] fad_w2_result_fw;       // FRF w2 write data for FRF 
output   [4:0] fad_w2_addr_fw;         // FRF w2 write addr
output   [2:0] fad_w2_tid_fw;          // FRF w2 write TID    (LSU->FRF path,
output   [1:0] fad_w2_vld_fw;          // FRF w2 write valid   delayed to fw)

// ----------------------------------------------------------------------------
// Interface with FEC
// ----------------------------------------------------------------------------

output  [63:0] fad_nombi_w2_result_fw; // FRF w2 write data w/out mbist data muxed in
output         fad_r1_byp_hit_fx1;     // r1 is bypass data
output         fad_r2_byp_hit_fx1;     // r2 is bypass data
output         fad_i_parity_2e_fx1;    // partial ECC check (parity portion), rs2 even
output         fad_i_parity_2o_fx1;    // partial ECC check (parity portion), rs2 odd
output         fad_i_parity_1e_fx1;    // partial ECC check (parity portion), rs1 even
output         fad_i_parity_1o_fx1;    // partial ECC check (parity portion), rs1 odd

// ----------------------------------------------------------------------------
// Interface with FPF
// ----------------------------------------------------------------------------

input   [63:0] fpf_w1_result_fb;       // FPX result
output  [63:0] fad_rs1_fmt_fx1;        // rs1 formatted
output  [63:0] fad_rs2_fmt_fx1;        // rs2 formatted
output  [63:0] fad_rs1_fx1;            // rs1 unformatted
output  [63:0] fad_rs2_fx1;            // rs2 unformatted
output         fad_r1_odd32b_fx1;

output   [1:0] fad_fsr_rd_fx1;
output   [4:0] fad_fsr_tem_fx1;
output         fad_fsr_ns_fx1;

// ----------------------------------------------------------------------------
// Interface with FDD
// ----------------------------------------------------------------------------

input  [62:11] fdd_result_rep0;        // FDD result

// ----------------------------------------------------------------------------
// Interface with FDC
// ----------------------------------------------------------------------------

input 	       fdc_finish_fltd_early_rep0;
input 	       fdc_finish_flts_early_rep0;

// ----------------------------------------------------------------------------
// Interface with FGD
// ----------------------------------------------------------------------------

input   [62:0] fgd_rngl_cdbus_3f;

// ----------------------------------------------------------------------------
// Global Signals
// ----------------------------------------------------------------------------

input          l2clk;                  // clock input
input	       scan_in;
input          spc_aclk_wmr;
input          wmr_scan_in;
input          lb_scan_en_wmr;
input	       tcu_pce_ov;	       // scan signals
input	       spc_aclk;
input	       spc_bclk;
input	       tcu_scan_en;
input          tcu_se_scancollar_out;
input          mbi_run;                // MBIST
input          mbi_frf_write_en;       // MBIST
input    [7:0] fac_mbist_addr_1f;      // MBIST
input    [7:0] fec_mbist_wdata_1f;     // MBIST
input    [7:0] fec_mbist_wdata_3f;     // MBIST

output         fad_mbist_cmp64_fx1;    // MBIST
output	       scan_out;
output         wmr_scan_out;
output  [62:0] fgu_rngl_cdbus;         // ASI local ring

// scan renames
assign stop   = 1'b0;
// end scan

fgu_fad_dp_buff_macro__dbuff_32x__rep_1__width_4 test_rep0  (
  .din ({tcu_scan_en, tcu_pce_ov, spc_aclk, spc_bclk}),
  .dout({se,          pce_ov,     siclk,    soclk   })
  );


// ----------------------------------------------------------------------------
//                               E stage
// ----------------------------------------------------------------------------

fgu_fad_dp_msff_macro__width_47 e_01  (
  .scan_in(e_01_scanin),
  .scan_out(e_01_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din ({fad_w2_vld_fw[1:0],
         fad_w2_addr_fw[3:0],
         fpd_vld_fb[1:0],
         fac_w1_addr_fb[4:0],
         fac_w1_32b_fb,
         fac_w1_odd32b_fb,
         fac_w1_tid_fb[2:0],
         fpc_w1_vld_fb[1:0],
         fpc_w1_ul_vld_fb,
         r1_odd32b_e,
         r2_addr_e[1:0], 
         r2_addr_e[4],
         r1_byp_hit_e,
         r2_byp_hit_e,
         fad_w2_addr_fw[4],
         fad_w2_tid_fw[2:0],
             w2_32b_fw,
             w2_odd32b_fw,
         fdc_finish_flts_early_rep0,
         fdc_finish_fltd_early_rep0,
         mbi_run,
         mbi_frf_write_en,
         fac_aman_fmt_sel_e[4:0],
         fac_bman_fmt_sel_e[4:0]}),
  .dout({fad_w2_vld_fw1[1:0],
             w2_addr_fw1[3:0],
         fpd_vld_fw[1:0],
             w1_addr_fw[4:0],
             w1_32b_fw,
             w1_odd32b_fw,
         fad_w1_tid_fw[2:0],
         fad_w1_vld_fw[1:0],
             w1_ul_vld_fw,
         fad_r1_odd32b_fx1,
         fad_gsr_imirnd_fx1[2:0],
         fad_r1_byp_hit_fx1,
         fad_r2_byp_hit_fx1,
         fad_w2_addr_fw1_b4,
         fad_w2_tid_fw1[2:0],
             w2_32b_fw1,
             w2_odd32b_fw1,
         div_finish_flts_fb,
         div_finish_fltd_fb,
         mbist_run_1f,
         mbist_frf_write_en_1f,
             aman_fmt_sel_fx1[4:0],
             bman_fmt_sel_fx1[4:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fad_dp_msff_macro__width_23 e_01_extra  (
  .scan_in(e_01_extra_scanin),
  .scan_out(e_01_extra_scanout),
  .clk (l2clk),
  .en  (coreon_clken),
  .din ({dec_frf_r2_addr_d[4:0],  // requires free running clk or dec_fgu_decode_d en
         dec_frf_r1_32b_d,        // requires free running clk or dec_fgu_decode_d en
         dec_frf_r2_32b_d,        // requires free running clk or dec_fgu_decode_d en
         dec_frf_r1_odd32b_d,     // requires free running clk or dec_fgu_decode_d en
         dec_frf_r2_odd32b_d,     // requires free running clk or dec_fgu_decode_d en
         w2_addr_fb[4:0],         // requires free running clk
         w2_tid_fb[2:0],          // requires free running clk
         w2_32b_fb,               // requires free running clk
         w2_odd32b_fb,            // requires free running clk
         pre_fld_vld_fb[1:0],     // requires free running clk
         lsu_fgu_fld_b,           // requires free running clk
         fld_fw}),                // requires free running clk
  .dout({        r2_addr_e[4:0],
                 r1_32b_e,
                 r2_32b_e,
                 r1_odd32b_e,
                 r2_odd32b_e,
         w2_addr_fw[4:0],
         w2_tid_fw[2:0],
         w2_32b_fw,
         w2_odd32b_fw,
         pre_fld_vld_fw[1:0],
                 fld_fw,
         fld_fw1}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ------------------------------------
// Bypass detection
//
// ten compares total:
// r1_e == w1_fb
// r1_e == fld_fb
// r1_e == w1_fw
// r1_e == w2_fw
// r1_e == w2_fw1
// r2_e == w1_fb
// r2_e == fld_fb
// r2_e == w1_fw
// r2_e == w2_fw
// r2_e == w2_fw1
// ------------------------------------

// SP->DP bypass is not supported (evil-twin)
// DP->SP bypass is supported only for a DP load bypassing to a SP arith.
//        DP arith. bypassing to SP arith. isn't supported due to IFU considerations.
//
// If 64b result and 32b source then "32b" and "odd32b" signals are don't care,
// force the source "32b" and "odd32b" signals to zero to match the 64b result's
// "32b" and "odd32b" signals

fgu_fad_dp_and_macro__ports_2__width_2 and_q2  (
  .din0({lsu_fgu_fld_32b_b, lsu_fgu_fld_32b_b}),
  .din1({   r1_32b_e,          r1_odd32b_e   }),
  .dout({q2_r1_32b_e,       q2_r1_odd32b_e   })
  );

fgu_fad_dp_and_macro__ports_2__width_2 and_q3  (
  .din0({lsu_fgu_fld_32b_b, lsu_fgu_fld_32b_b}),
  .din1({   r2_32b_e,          r2_odd32b_e   }),
  .dout({q3_r2_32b_e,       q3_r2_odd32b_e   })
  );

fgu_fad_dp_and_macro__ports_2__width_2 and_q6  (
  .din0({w2_32b_fw,   w2_32b_fw     }),
  .din1({   r1_32b_e,    r1_odd32b_e}),
  .dout({q6_r1_32b_e, q6_r1_odd32b_e})
  );

fgu_fad_dp_and_macro__ports_2__width_2 and_q7  (
  .din0({w2_32b_fw,   w2_32b_fw     }),
  .din1({   r2_32b_e,    r2_odd32b_e}),
  .dout({q7_r2_32b_e, q7_r2_odd32b_e})
  );

fgu_fad_dp_and_macro__ports_2__width_2 and_q8  (
  .din0({w2_32b_fw1,   w2_32b_fw1     }),
  .din1({   r2_32b_e,    r2_odd32b_e}),
  .dout({q8_r2_32b_e, q8_r2_odd32b_e})
  );

fgu_fad_dp_and_macro__ports_2__width_2 and_q9  (
  .din0({w2_32b_fw1,   w2_32b_fw1     }),
  .din1({   r1_32b_e,    r1_odd32b_e}),
  .dout({q9_r1_32b_e, q9_r1_odd32b_e})
  );

fgu_fad_dp_cmp_macro__width_12 cmp_r1a  (
  .din0({fac_frf_r1_addr_e[4:0],
         fac_tid_e[2:0],
         r1_32b_e,
         r1_odd32b_e,
         1'b1,
         mbist_run_1f}),
  .din1({fac_w1_addr_fb[4:0],
         fac_w1_tid_fb[2:0],
         fac_w1_32b_fb,
         fac_w1_odd32b_fb,
         fpc_w1_ul_vld_fb,
         1'b0}),
  .dout(r1_w1_hit_fb)
  );

fgu_fad_dp_cmp_macro__width_12 cmp_r1b  (
  .din0({fac_frf_r1_addr_e[4:0],
         fac_tid_e[2:0],
         q2_r1_32b_e,
         q2_r1_odd32b_e,
         1'b1,
         mbist_run_1f}),
  .din1({lsu_fgu_fld_addr_b[4:0],
         lsu_fgu_fld_tid_b[2:0],
         lsu_fgu_fld_32b_b,
         lsu_fgu_fld_odd32b_b,
         lsu_fgu_fld_b,  // load fsr is serializing, can't cause a fld_hit
         1'b0}),
  .dout(r1_fld_hit_fb)
  );

fgu_fad_dp_cmp_macro__width_12 cmp_r1c  (
  .din0({fac_frf_r1_addr_e[4:0],
         fac_tid_e[2:0],
         r1_32b_e,
         r1_odd32b_e,
         1'b1,
         mbist_run_1f}),
  .din1({w1_addr_fw[4:0],
         fad_w1_tid_fw[2:0],
         w1_32b_fw,
         w1_odd32b_fw,
         w1_ul_vld_fw,
         1'b0}),
  .dout(r1_w1_hit_fw)
  );

fgu_fad_dp_cmp_macro__width_12 cmp_r1d  (
  .din0({fac_frf_r1_addr_e[4:0],
         fac_tid_e[2:0],
         q6_r1_32b_e,
         q6_r1_odd32b_e,
         1'b1,
         mbist_run_1f}),
  .din1({fad_w2_addr_fw[4:0],
         fad_w2_tid_fw[2:0],
         w2_32b_fw,
         w2_odd32b_fw,
         fld_fw,   // load fsr is serializing, can't cause a fld_hit
         1'b0}),
  .dout(r1_w2_hit_fw)
  );

fgu_fad_dp_cmp_macro__width_12 cmp_r1e  (
  .din0({fac_frf_r1_addr_e[4:0],
         fac_tid_e[2:0],
         q9_r1_32b_e,
         q9_r1_odd32b_e,
         1'b1,
         mbist_run_1f}),
  .din1({fad_w2_addr_fw1_b4, w2_addr_fw1[3:0],
         fad_w2_tid_fw1[2:0],
         w2_32b_fw1,
         w2_odd32b_fw1,
         fld_fw1,  // load fsr is serializing, can't cause a fld_hit
         1'b0}),
  .dout(r1_w2_hit_fw1)
  );

fgu_fad_dp_cmp_macro__width_12 cmp_r2a  (
  .din0({r2_addr_e[4:0],
         fac_tid_e[2:0],
         r2_32b_e,
         r2_odd32b_e,
         1'b1,
         1'b0}),
  .din1({fac_w1_addr_fb[4:0],
         fac_w1_tid_fb[2:0],
         fac_w1_32b_fb,
         fac_w1_odd32b_fb,
         fpc_w1_ul_vld_fb,
         1'b0}),
  .dout(r2_w1_hit_fb)
  );

fgu_fad_dp_cmp_macro__width_12 cmp_r2b  (
  .din0({r2_addr_e[4:0],
         fac_tid_e[2:0],
         q3_r2_32b_e,
         q3_r2_odd32b_e,
         1'b1,
         1'b0}),
  .din1({lsu_fgu_fld_addr_b[4:0],
         lsu_fgu_fld_tid_b[2:0],
         lsu_fgu_fld_32b_b,
         lsu_fgu_fld_odd32b_b,
         lsu_fgu_fld_b,  // load fsr is serializing, can't cause a fld_hit
         1'b0}),
  .dout(r2_fld_hit_fb)
  );

fgu_fad_dp_cmp_macro__width_12 cmp_r2c  (
  .din0({r2_addr_e[4:0],
         fac_tid_e[2:0],
         r2_32b_e,
         r2_odd32b_e,
         1'b1,
         1'b0}),
  .din1({w1_addr_fw[4:0],
         fad_w1_tid_fw[2:0],
         w1_32b_fw,
         w1_odd32b_fw,
         w1_ul_vld_fw,
         1'b0}),
  .dout(r2_w1_hit_fw)
  );

fgu_fad_dp_cmp_macro__width_12 cmp_r2d  (
  .din0({r2_addr_e[4:0],
         fac_tid_e[2:0],
         q7_r2_32b_e,
         q7_r2_odd32b_e,
         1'b1,
         1'b0}),
  .din1({fad_w2_addr_fw[4:0],
         fad_w2_tid_fw[2:0],
         w2_32b_fw,
         w2_odd32b_fw,
         fld_fw,   // load fsr is serializing, can't cause a fld_hit
         1'b0}),
  .dout(r2_w2_hit_fw)
  );

fgu_fad_dp_cmp_macro__width_12 cmp_r2e  (
  .din0({r2_addr_e[4:0],
         fac_tid_e[2:0],
         q8_r2_32b_e,
         q8_r2_odd32b_e,
         1'b1,
         1'b0}),
  .din1({fad_w2_addr_fw1_b4, w2_addr_fw1[3:0],
         fad_w2_tid_fw1[2:0],
         w2_32b_fw1,
         w2_odd32b_fw1,
         fld_fw1,  // load fsr is serializing, can't cause a fld_hit
         1'b0}),
  .dout(r2_w2_hit_fw1)
  );

fgu_fad_dp_nor_macro__ports_3__width_4 rs_vld0  (
  .din0({r1_fld_hit_fb,   r1_w2_hit_fw1,   r2_fld_hit_fb,   r2_w2_hit_fw1  }),
  .din1({r1_w1_hit_fb,    r1_w1_hit_fw,    r2_w1_hit_fb,    r2_w1_hit_fw   }),
  .din2({r1_w2_hit_fw,    1'b0,            r2_w2_hit_fw,    1'b0           }),
  .dout({i1_r1_byp_hit_e, i2_r1_byp_hit_e, i1_r2_byp_hit_e, i2_r2_byp_hit_e})
  );

fgu_fad_dp_nand_macro__ports_2__width_2 rs_vld1  (
  .din0({i1_r1_byp_hit_e, i1_r2_byp_hit_e}),
  .din1({i2_r1_byp_hit_e, i2_r2_byp_hit_e}),
  .dout({r1_byp_hit_e,    r2_byp_hit_e   })
  );

// ------------------------------------
// Bypass muxes
// ------------------------------------

fgu_fad_dp_msff_macro__dmux_4x__mux_aope__ports_7__width_64 fx1_rs1byp  (
  .scan_in(fx1_rs1byp_scanin),
  .scan_out(fx1_rs1byp_scanout),
  .se  (tcu_se_scancollar_out),
  .clk (l2clk),
  .en  (main_clken),
  .din0(exu_fgu_rs1_e[63:0]),
  .din1(lsu_fgu_fld_data_b[63:0]),
  .din2(fpf_w1_result_fb[63:0]),
  .din3(fad_nombi_w2_result_fw[63:0]),
  .din4(w2_result_fw1[63:0]),
  .din5(w1_result_fw[63:0]),
  .din6(frf_r1_data_e[63:0]),  // functional or MBIST read data
  .sel0(fac_exu_src_e),
  .sel1(r1_fld_hit_fb),
  .sel2(r1_w1_hit_fb),
  .sel3(r1_w2_hit_fw),
  .sel4(r1_w2_hit_fw1),
  .sel5(r1_w1_hit_fw),
  .dout(fad_rs1_fx1[63:0]),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fad_dp_cmp_macro__width_64 cmp_mbist  (
  .din0({8{fec_mbist_wdata_3f[7:0]}}),
  .din1(fad_rs1_fx1[63:0]),
  .dout(fad_mbist_cmp64_fx1)
  );

fgu_fad_dp_msff_macro__dmux_4x__mux_aope__ports_7__width_64 fx1_rs2byp  (
  .scan_in(fx1_rs2byp_scanin),
  .scan_out(fx1_rs2byp_scanout),
  .se  (tcu_se_scancollar_out),
  .clk (l2clk),
  .en  (main_clken),
  .din0(exu_fgu_rs2_e[63:0]),
  .din1(lsu_fgu_fld_data_b[63:0]),
  .din2(fpf_w1_result_fb[63:0]),
  .din3(fad_nombi_w2_result_fw[63:0]),
  .din4(w2_result_fw1[63:0]),
  .din5(w1_result_fw[63:0]),
  .din6(frf_r2_data_e[63:0]),
  .sel0(fac_exu_src_e),
  .sel1(r2_fld_hit_fb),
  .sel2(r2_w1_hit_fb),
  .sel3(r2_w2_hit_fw),
  .sel4(r2_w2_hit_fw1),
  .sel5(r2_w1_hit_fw),
  .dout(fad_rs2_fx1[63:0]),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ------------------------------------
// Begin ECC check for rs1/rs2 here, complete it in FEC
// ------------------------------------

fgu_fad_dp_prty_macro__width_32 ecc_parity_2e  (
  .din (fad_rs2_fx1[63:32]),
  .dout(fad_i_parity_2e_fx1)
  );

fgu_fad_dp_prty_macro__width_32 ecc_parity_2o  (
  .din (fad_rs2_fx1[31:0]),
  .dout(fad_i_parity_2o_fx1)
  );

fgu_fad_dp_prty_macro__width_32 ecc_parity_1e  (
  .din (fad_rs1_fx1[63:32]),
  .dout(fad_i_parity_1e_fx1)
  );

fgu_fad_dp_prty_macro__width_32 ecc_parity_1o  (
  .din (fad_rs1_fx1[31:0]),
  .dout(fad_i_parity_1o_fx1)
  );

// ------------------------------------
// FSR w1,w2,hold mux/flop, threads 0-7
// ------------------------------------

// ----------
// FSR tid0
// ----------

fgu_fad_dp_mux_macro__mux_aonpe__ports_3__stack_32l__width_12 fsr0_in  (
  .din0(fpc_fsr_w1_result_fw[11:0]),     // w1         {ftt,aexc,cexc}
  .din1(fpc_fsr_w2_result_fw[11:0]),     // fdiv/fsqrt {ftt,aexc,cexc}
  .din2({2'b0, fsr0_fx1[17:13], 5'b0}),  // accrued aexc
  .sel0(fac_fsr0_sel_fw[4]),
  .sel1(fac_fsr0_sel_fw[5]),
  .sel2(1'b1),
  .dout(fsr0_fttexc_merged_fw[11:0])
  );

fgu_fad_dp_msff_macro__mux_aodec__ports_8__stack_32l__width_28 fx1_fsr0  (	// FS:wmr_protect
  .scan_in(fx1_fsr0_wmr_scanin),
  .scan_out(fx1_fsr0_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .se(lb_scan_en_wmr),
  .clk (l2clk),
  .en  (fac_fsr0_sel_fw[3]),
  .din0({ldfsr_data_fw[27:26],         // LDFSR:	rd
         ldfsr_data_fw[25:21],         //		tem
         ldfsr_data_fw[20],            //		ns
         fsr0_fx1[19:18],              //		ftt
         ldfsr_data_fw[17:8],          //		aexc,cexc
         fsr0_fx1[7:6],                //		fcc3
         fsr0_fx1[5:4],                //		fcc2
         fsr0_fx1[3:2],                //		fcc1
         ldfsr_data_fw[1:0]}),         //		fcc0
  .din1({ldfsr_data_fw[27:26],         // LDXFSR:	rd
         ldfsr_data_fw[25:21],         //		tem
         ldfsr_data_fw[20],            //		ns
         fsr0_fx1[19:18],	       //		ftt
         ldfsr_data_fw[17:8],          //		aexc,cexc
         ldfsr_data_fw[7:6],           //		fcc3
         ldfsr_data_fw[5:4],           //		fcc2
         ldfsr_data_fw[3:2],           //		fcc1
         ldfsr_data_fw[1:0]}),         //		fcc0
  .din2({fsr0_fx1[27:26],              // ST(X)FSR:	rd
         fsr0_fx1[25:21],	       //		tem
         fsr0_fx1[20],	               //		ns
         fsr0_fttexc_merged_fw[11:10], //		ftt
         fsr0_fx1[17:8],	       //		aexc,cexc
         fsr0_fx1[7:6],	               //		fcc3
         fsr0_fx1[5:4],	               //		fcc2
         fsr0_fx1[3:2],	               //		fcc1
         fsr0_fx1[1:0]}),	       //		fcc0
  .din3({fsr0_fx1[27:26],              // FCMP(E) fcc0: rd
         fsr0_fx1[25:21],              //		tem
         fsr0_fx1[20],		       //		ns
         fsr0_fttexc_merged_fw[11:10], //		ftt
         fsr0_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr0_fx1[7:6],		       //		fcc3
         fsr0_fx1[5:4],		       //		fcc2
         fsr0_fx1[3:2],		       //		fcc1
         fpc_fcc_fw[1:0]}),	       //		fcc0
  .din4({fsr0_fx1[27:26],              // FCMP(E) fcc1: rd
         fsr0_fx1[25:21],              //		tem
         fsr0_fx1[20],		       //		ns
         fsr0_fttexc_merged_fw[11:10], //		ftt
         fsr0_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr0_fx1[7:6],		       //		fcc3
         fsr0_fx1[5:4],	               //		fcc2
         fpc_fcc_fw[1:0],	       //		fcc1
         fsr0_fx1[1:0]}),              //		fcc0
  .din5({fsr0_fx1[27:26],              // FCMP(E) fcc2: rd
         fsr0_fx1[25:21],	       //		tem
         fsr0_fx1[20],		       //		ns
         fsr0_fttexc_merged_fw[11:10], //		ftt
         fsr0_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr0_fx1[7:6],		       //		fcc3
         fpc_fcc_fw[1:0],	       //		fcc2
         fsr0_fx1[3:2],	               //		fcc1
         fsr0_fx1[1:0]}),              //		fcc0
  .din6({fsr0_fx1[27:26],              // FCMP(E) fcc3: rd
         fsr0_fx1[25:21],	       //		tem
         fsr0_fx1[20],	               //		ns
         fsr0_fttexc_merged_fw[11:10], //		ftt
         fsr0_fttexc_merged_fw[9:0],   //		aexc,cexc
         fpc_fcc_fw[1:0],	       //		fcc3
         fsr0_fx1[5:4],		       //		fcc2
         fsr0_fx1[3:2],		       //		fcc1
         fsr0_fx1[1:0]}),              //		fcc0
  .din7({fsr0_fx1[27:26],              // other FPop:   rd
         fsr0_fx1[25:21],	       //		tem
         fsr0_fx1[20],		       //		ns
         fsr0_fttexc_merged_fw[11:10], //		ftt
         fsr0_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr0_fx1[7:6],                //		fcc3
         fsr0_fx1[5:4],		       //		fcc2
         fsr0_fx1[3:2],		       //		fcc1
         fsr0_fx1[1:0]}),              //		fcc0
  .sel (fac_fsr0_sel_fw[2:0]),
  .dout(fsr0_fx1[27:0]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ----------
// FSR tid1
// ----------

fgu_fad_dp_mux_macro__mux_aonpe__ports_3__stack_32l__width_12 fsr1_in  (
  .din0(fpc_fsr_w1_result_fw[11:0]),     // w1         {ftt,aexc,cexc}
  .din1(fpc_fsr_w2_result_fw[11:0]),     // fdiv/fsqrt {ftt,aexc,cexc}
  .din2({2'b0, fsr1_fx1[17:13], 5'b0}),  // accrued aexc
  .sel0(fac_fsr1_sel_fw[4]),
  .sel1(fac_fsr1_sel_fw[5]),
  .sel2(1'b1),
  .dout(fsr1_fttexc_merged_fw[11:0])
  );

fgu_fad_dp_msff_macro__mux_aodec__ports_8__stack_32l__width_28 fx1_fsr1  (	// FS:wmr_protect
  .scan_in(fx1_fsr1_wmr_scanin),
  .scan_out(fx1_fsr1_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .se(lb_scan_en_wmr),
  .clk (l2clk),
  .en  (fac_fsr1_sel_fw[3]),
  .din0({ldfsr_data_fw[27:26],         // LDFSR:	rd
         ldfsr_data_fw[25:21],         //		tem
         ldfsr_data_fw[20],            //		ns
         fsr1_fx1[19:18],              //		ftt
         ldfsr_data_fw[17:8],          //		aexc,cexc
         fsr1_fx1[7:6],                //		fcc3
         fsr1_fx1[5:4],                //		fcc2
         fsr1_fx1[3:2],                //		fcc1
         ldfsr_data_fw[1:0]}),         //		fcc0
  .din1({ldfsr_data_fw[27:26],         // LDXFSR:	rd
         ldfsr_data_fw[25:21],         //		tem
         ldfsr_data_fw[20],            //		ns
         fsr1_fx1[19:18],	       //		ftt
         ldfsr_data_fw[17:8],          //		aexc,cexc
         ldfsr_data_fw[7:6],           //		fcc3
         ldfsr_data_fw[5:4],           //		fcc2
         ldfsr_data_fw[3:2],           //		fcc1
         ldfsr_data_fw[1:0]}),         //		fcc0
  .din2({fsr1_fx1[27:26],              // ST(X)FSR:	rd
         fsr1_fx1[25:21],	       //		tem
         fsr1_fx1[20],	               //		ns
         fsr1_fttexc_merged_fw[11:10], //		ftt
         fsr1_fx1[17:8],	       //		aexc,cexc
         fsr1_fx1[7:6],	               //		fcc3
         fsr1_fx1[5:4],	               //		fcc2
         fsr1_fx1[3:2],	               //		fcc1
         fsr1_fx1[1:0]}),	       //		fcc0
  .din3({fsr1_fx1[27:26],              // FCMP(E) fcc0: rd
         fsr1_fx1[25:21],              //		tem
         fsr1_fx1[20],		       //		ns
         fsr1_fttexc_merged_fw[11:10], //		ftt
         fsr1_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr1_fx1[7:6],		       //		fcc3
         fsr1_fx1[5:4],		       //		fcc2
         fsr1_fx1[3:2],		       //		fcc1
         fpc_fcc_fw[1:0]}),	       //		fcc0
  .din4({fsr1_fx1[27:26],              // FCMP(E) fcc1: rd
         fsr1_fx1[25:21],              //		tem
         fsr1_fx1[20],		       //		ns
         fsr1_fttexc_merged_fw[11:10], //		ftt
         fsr1_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr1_fx1[7:6],		       //		fcc3
         fsr1_fx1[5:4],	               //		fcc2
         fpc_fcc_fw[1:0],	       //		fcc1
         fsr1_fx1[1:0]}),              //		fcc0
  .din5({fsr1_fx1[27:26],              // FCMP(E) fcc2: rd
         fsr1_fx1[25:21],	       //		tem
         fsr1_fx1[20],		       //		ns
         fsr1_fttexc_merged_fw[11:10], //		ftt
         fsr1_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr1_fx1[7:6],		       //		fcc3
         fpc_fcc_fw[1:0],	       //		fcc2
         fsr1_fx1[3:2],	               //		fcc1
         fsr1_fx1[1:0]}),              //		fcc0
  .din6({fsr1_fx1[27:26],              // FCMP(E) fcc3: rd
         fsr1_fx1[25:21],	       //		tem
         fsr1_fx1[20],	               //		ns
         fsr1_fttexc_merged_fw[11:10], //		ftt
         fsr1_fttexc_merged_fw[9:0],   //		aexc,cexc
         fpc_fcc_fw[1:0],	       //		fcc3
         fsr1_fx1[5:4],		       //		fcc2
         fsr1_fx1[3:2],		       //		fcc1
         fsr1_fx1[1:0]}),              //		fcc0
  .din7({fsr1_fx1[27:26],              // other FPop:   rd
         fsr1_fx1[25:21],	       //		tem
         fsr1_fx1[20],		       //		ns
         fsr1_fttexc_merged_fw[11:10], //		ftt
         fsr1_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr1_fx1[7:6],                //		fcc3
         fsr1_fx1[5:4],		       //		fcc2
         fsr1_fx1[3:2],		       //		fcc1
         fsr1_fx1[1:0]}),              //		fcc0
  .sel (fac_fsr1_sel_fw[2:0]),
  .dout(fsr1_fx1[27:0]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ----------
// FSR tid2
// ----------

fgu_fad_dp_mux_macro__mux_aonpe__ports_3__stack_32l__width_12 fsr2_in  (
  .din0(fpc_fsr_w1_result_fw[11:0]),     // w1         {ftt,aexc,cexc}
  .din1(fpc_fsr_w2_result_fw[11:0]),     // fdiv/fsqrt {ftt,aexc,cexc}
  .din2({2'b0, fsr2_fx1[17:13], 5'b0}),  // accrued aexc
  .sel0(fac_fsr2_sel_fw[4]),
  .sel1(fac_fsr2_sel_fw[5]),
  .sel2(1'b1),
  .dout(fsr2_fttexc_merged_fw[11:0])
  );

fgu_fad_dp_msff_macro__mux_aodec__ports_8__stack_32l__width_28 fx1_fsr2  (	// FS:wmr_protect
  .scan_in(fx1_fsr2_wmr_scanin),
  .scan_out(fx1_fsr2_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .se(lb_scan_en_wmr),
  .clk (l2clk),
  .en  (fac_fsr2_sel_fw[3]),
  .din0({ldfsr_data_fw[27:26],         // LDFSR:	rd
         ldfsr_data_fw[25:21],         //		tem
         ldfsr_data_fw[20],            //		ns
         fsr2_fx1[19:18],              //		ftt
         ldfsr_data_fw[17:8],          //		aexc,cexc
         fsr2_fx1[7:6],                //		fcc3
         fsr2_fx1[5:4],                //		fcc2
         fsr2_fx1[3:2],                //		fcc1
         ldfsr_data_fw[1:0]}),         //		fcc0
  .din1({ldfsr_data_fw[27:26],         // LDXFSR:	rd
         ldfsr_data_fw[25:21],         //		tem
         ldfsr_data_fw[20],            //		ns
         fsr2_fx1[19:18],	       //		ftt
         ldfsr_data_fw[17:8],          //		aexc,cexc
         ldfsr_data_fw[7:6],           //		fcc3
         ldfsr_data_fw[5:4],           //		fcc2
         ldfsr_data_fw[3:2],           //		fcc1
         ldfsr_data_fw[1:0]}),         //		fcc0
  .din2({fsr2_fx1[27:26],              // ST(X)FSR:	rd
         fsr2_fx1[25:21],	       //		tem
         fsr2_fx1[20],	               //		ns
         fsr2_fttexc_merged_fw[11:10], //		ftt
         fsr2_fx1[17:8],	       //		aexc,cexc
         fsr2_fx1[7:6],	               //		fcc3
         fsr2_fx1[5:4],	               //		fcc2
         fsr2_fx1[3:2],	               //		fcc1
         fsr2_fx1[1:0]}),	       //		fcc0
  .din3({fsr2_fx1[27:26],              // FCMP(E) fcc0: rd
         fsr2_fx1[25:21],              //		tem
         fsr2_fx1[20],		       //		ns
         fsr2_fttexc_merged_fw[11:10], //		ftt
         fsr2_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr2_fx1[7:6],		       //		fcc3
         fsr2_fx1[5:4],		       //		fcc2
         fsr2_fx1[3:2],		       //		fcc1
         fpc_fcc_fw[1:0]}),	       //		fcc0
  .din4({fsr2_fx1[27:26],              // FCMP(E) fcc1: rd
         fsr2_fx1[25:21],              //		tem
         fsr2_fx1[20],		       //		ns
         fsr2_fttexc_merged_fw[11:10], //		ftt
         fsr2_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr2_fx1[7:6],		       //		fcc3
         fsr2_fx1[5:4],	               //		fcc2
         fpc_fcc_fw[1:0],	       //		fcc1
         fsr2_fx1[1:0]}),              //		fcc0
  .din5({fsr2_fx1[27:26],              // FCMP(E) fcc2: rd
         fsr2_fx1[25:21],	       //		tem
         fsr2_fx1[20],		       //		ns
         fsr2_fttexc_merged_fw[11:10], //		ftt
         fsr2_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr2_fx1[7:6],		       //		fcc3
         fpc_fcc_fw[1:0],	       //		fcc2
         fsr2_fx1[3:2],	               //		fcc1
         fsr2_fx1[1:0]}),              //		fcc0
  .din6({fsr2_fx1[27:26],              // FCMP(E) fcc3: rd
         fsr2_fx1[25:21],	       //		tem
         fsr2_fx1[20],	               //		ns
         fsr2_fttexc_merged_fw[11:10], //		ftt
         fsr2_fttexc_merged_fw[9:0],   //		aexc,cexc
         fpc_fcc_fw[1:0],	       //		fcc3
         fsr2_fx1[5:4],		       //		fcc2
         fsr2_fx1[3:2],		       //		fcc1
         fsr2_fx1[1:0]}),              //		fcc0
  .din7({fsr2_fx1[27:26],              // other FPop:   rd
         fsr2_fx1[25:21],	       //		tem
         fsr2_fx1[20],		       //		ns
         fsr2_fttexc_merged_fw[11:10], //		ftt
         fsr2_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr2_fx1[7:6],                //		fcc3
         fsr2_fx1[5:4],		       //		fcc2
         fsr2_fx1[3:2],		       //		fcc1
         fsr2_fx1[1:0]}),              //		fcc0
  .sel (fac_fsr2_sel_fw[2:0]),
  .dout(fsr2_fx1[27:0]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ----------
// FSR tid3
// ----------

fgu_fad_dp_mux_macro__mux_aonpe__ports_3__stack_32l__width_12 fsr3_in  (
  .din0(fpc_fsr_w1_result_fw[11:0]),     // w1         {ftt,aexc,cexc}
  .din1(fpc_fsr_w2_result_fw[11:0]),     // fdiv/fsqrt {ftt,aexc,cexc}
  .din2({2'b0, fsr3_fx1[17:13], 5'b0}),  // accrued aexc
  .sel0(fac_fsr3_sel_fw[4]),
  .sel1(fac_fsr3_sel_fw[5]),
  .sel2(1'b1),
  .dout(fsr3_fttexc_merged_fw[11:0])
  );

fgu_fad_dp_msff_macro__mux_aodec__ports_8__stack_32l__width_28 fx1_fsr3  (	// FS:wmr_protect
  .scan_in(fx1_fsr3_wmr_scanin),
  .scan_out(fx1_fsr3_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .se(lb_scan_en_wmr),
  .clk (l2clk),
  .en  (fac_fsr3_sel_fw[3]),
  .din0({ldfsr_data_fw[27:26],         // LDFSR:	rd
         ldfsr_data_fw[25:21],         //		tem
         ldfsr_data_fw[20],            //		ns
         fsr3_fx1[19:18],              //		ftt
         ldfsr_data_fw[17:8],          //		aexc,cexc
         fsr3_fx1[7:6],                //		fcc3
         fsr3_fx1[5:4],                //		fcc2
         fsr3_fx1[3:2],                //		fcc1
         ldfsr_data_fw[1:0]}),         //		fcc0
  .din1({ldfsr_data_fw[27:26],         // LDXFSR:	rd
         ldfsr_data_fw[25:21],         //		tem
         ldfsr_data_fw[20],            //		ns
         fsr3_fx1[19:18],	       //		ftt
         ldfsr_data_fw[17:8],          //		aexc,cexc
         ldfsr_data_fw[7:6],           //		fcc3
         ldfsr_data_fw[5:4],           //		fcc2
         ldfsr_data_fw[3:2],           //		fcc1
         ldfsr_data_fw[1:0]}),         //		fcc0
  .din2({fsr3_fx1[27:26],              // ST(X)FSR:	rd
         fsr3_fx1[25:21],	       //		tem
         fsr3_fx1[20],	               //		ns
         fsr3_fttexc_merged_fw[11:10], //		ftt
         fsr3_fx1[17:8],	       //		aexc,cexc
         fsr3_fx1[7:6],	               //		fcc3
         fsr3_fx1[5:4],	               //		fcc2
         fsr3_fx1[3:2],	               //		fcc1
         fsr3_fx1[1:0]}),	       //		fcc0
  .din3({fsr3_fx1[27:26],              // FCMP(E) fcc0: rd
         fsr3_fx1[25:21],              //		tem
         fsr3_fx1[20],		       //		ns
         fsr3_fttexc_merged_fw[11:10], //		ftt
         fsr3_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr3_fx1[7:6],		       //		fcc3
         fsr3_fx1[5:4],		       //		fcc2
         fsr3_fx1[3:2],		       //		fcc1
         fpc_fcc_fw[1:0]}),	       //		fcc0
  .din4({fsr3_fx1[27:26],              // FCMP(E) fcc1: rd
         fsr3_fx1[25:21],              //		tem
         fsr3_fx1[20],		       //		ns
         fsr3_fttexc_merged_fw[11:10], //		ftt
         fsr3_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr3_fx1[7:6],		       //		fcc3
         fsr3_fx1[5:4],	               //		fcc2
         fpc_fcc_fw[1:0],	       //		fcc1
         fsr3_fx1[1:0]}),              //		fcc0
  .din5({fsr3_fx1[27:26],              // FCMP(E) fcc2: rd
         fsr3_fx1[25:21],	       //		tem
         fsr3_fx1[20],		       //		ns
         fsr3_fttexc_merged_fw[11:10], //		ftt
         fsr3_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr3_fx1[7:6],		       //		fcc3
         fpc_fcc_fw[1:0],	       //		fcc2
         fsr3_fx1[3:2],	               //		fcc1
         fsr3_fx1[1:0]}),              //		fcc0
  .din6({fsr3_fx1[27:26],              // FCMP(E) fcc3: rd
         fsr3_fx1[25:21],	       //		tem
         fsr3_fx1[20],	               //		ns
         fsr3_fttexc_merged_fw[11:10], //		ftt
         fsr3_fttexc_merged_fw[9:0],   //		aexc,cexc
         fpc_fcc_fw[1:0],	       //		fcc3
         fsr3_fx1[5:4],		       //		fcc2
         fsr3_fx1[3:2],		       //		fcc1
         fsr3_fx1[1:0]}),              //		fcc0
  .din7({fsr3_fx1[27:26],              // other FPop:   rd
         fsr3_fx1[25:21],	       //		tem
         fsr3_fx1[20],		       //		ns
         fsr3_fttexc_merged_fw[11:10], //		ftt
         fsr3_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr3_fx1[7:6],                //		fcc3
         fsr3_fx1[5:4],		       //		fcc2
         fsr3_fx1[3:2],		       //		fcc1
         fsr3_fx1[1:0]}),              //		fcc0
  .sel (fac_fsr3_sel_fw[2:0]),
  .dout(fsr3_fx1[27:0]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ----------
// FSR tid4
// ----------

fgu_fad_dp_mux_macro__mux_aonpe__ports_3__stack_32l__width_12 fsr4_in  (
  .din0(fpc_fsr_w1_result_fw[11:0]),     // w1         {ftt,aexc,cexc}
  .din1(fpc_fsr_w2_result_fw[11:0]),     // fdiv/fsqrt {ftt,aexc,cexc}
  .din2({2'b0, fsr4_fx1[17:13], 5'b0}),  // accrued aexc
  .sel0(fac_fsr4_sel_fw[4]),
  .sel1(fac_fsr4_sel_fw[5]),
  .sel2(1'b1),
  .dout(fsr4_fttexc_merged_fw[11:0])
  );

fgu_fad_dp_msff_macro__mux_aodec__ports_8__stack_32l__width_28 fx1_fsr4  (	// FS:wmr_protect
  .scan_in(fx1_fsr4_wmr_scanin),
  .scan_out(fx1_fsr4_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .se(lb_scan_en_wmr),
  .clk (l2clk),
  .en  (fac_fsr4_sel_fw[3]),
  .din0({ldfsr_data_fw[27:26],         // LDFSR:	rd
         ldfsr_data_fw[25:21],         //		tem
         ldfsr_data_fw[20],            //		ns
         fsr4_fx1[19:18],              //		ftt
         ldfsr_data_fw[17:8],          //		aexc,cexc
         fsr4_fx1[7:6],                //		fcc3
         fsr4_fx1[5:4],                //		fcc2
         fsr4_fx1[3:2],                //		fcc1
         ldfsr_data_fw[1:0]}),         //		fcc0
  .din1({ldfsr_data_fw[27:26],         // LDXFSR:	rd
         ldfsr_data_fw[25:21],         //		tem
         ldfsr_data_fw[20],            //		ns
         fsr4_fx1[19:18],	       //		ftt
         ldfsr_data_fw[17:8],          //		aexc,cexc
         ldfsr_data_fw[7:6],           //		fcc3
         ldfsr_data_fw[5:4],           //		fcc2
         ldfsr_data_fw[3:2],           //		fcc1
         ldfsr_data_fw[1:0]}),         //		fcc0
  .din2({fsr4_fx1[27:26],              // ST(X)FSR:	rd
         fsr4_fx1[25:21],	       //		tem
         fsr4_fx1[20],	               //		ns
         fsr4_fttexc_merged_fw[11:10], //		ftt
         fsr4_fx1[17:8],	       //		aexc,cexc
         fsr4_fx1[7:6],	               //		fcc3
         fsr4_fx1[5:4],	               //		fcc2
         fsr4_fx1[3:2],	               //		fcc1
         fsr4_fx1[1:0]}),	       //		fcc0
  .din3({fsr4_fx1[27:26],              // FCMP(E) fcc0: rd
         fsr4_fx1[25:21],              //		tem
         fsr4_fx1[20],		       //		ns
         fsr4_fttexc_merged_fw[11:10], //		ftt
         fsr4_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr4_fx1[7:6],		       //		fcc3
         fsr4_fx1[5:4],		       //		fcc2
         fsr4_fx1[3:2],		       //		fcc1
         fpc_fcc_fw[1:0]}),	       //		fcc0
  .din4({fsr4_fx1[27:26],              // FCMP(E) fcc1: rd
         fsr4_fx1[25:21],              //		tem
         fsr4_fx1[20],		       //		ns
         fsr4_fttexc_merged_fw[11:10], //		ftt
         fsr4_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr4_fx1[7:6],		       //		fcc3
         fsr4_fx1[5:4],	               //		fcc2
         fpc_fcc_fw[1:0],	       //		fcc1
         fsr4_fx1[1:0]}),              //		fcc0
  .din5({fsr4_fx1[27:26],              // FCMP(E) fcc2: rd
         fsr4_fx1[25:21],	       //		tem
         fsr4_fx1[20],		       //		ns
         fsr4_fttexc_merged_fw[11:10], //		ftt
         fsr4_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr4_fx1[7:6],		       //		fcc3
         fpc_fcc_fw[1:0],	       //		fcc2
         fsr4_fx1[3:2],	               //		fcc1
         fsr4_fx1[1:0]}),              //		fcc0
  .din6({fsr4_fx1[27:26],              // FCMP(E) fcc3: rd
         fsr4_fx1[25:21],	       //		tem
         fsr4_fx1[20],	               //		ns
         fsr4_fttexc_merged_fw[11:10], //		ftt
         fsr4_fttexc_merged_fw[9:0],   //		aexc,cexc
         fpc_fcc_fw[1:0],	       //		fcc3
         fsr4_fx1[5:4],		       //		fcc2
         fsr4_fx1[3:2],		       //		fcc1
         fsr4_fx1[1:0]}),              //		fcc0
  .din7({fsr4_fx1[27:26],              // other FPop:   rd
         fsr4_fx1[25:21],	       //		tem
         fsr4_fx1[20],		       //		ns
         fsr4_fttexc_merged_fw[11:10], //		ftt
         fsr4_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr4_fx1[7:6],                //		fcc3
         fsr4_fx1[5:4],		       //		fcc2
         fsr4_fx1[3:2],		       //		fcc1
         fsr4_fx1[1:0]}),              //		fcc0
  .sel (fac_fsr4_sel_fw[2:0]),
  .dout(fsr4_fx1[27:0]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ----------
// FSR tid5
// ----------

fgu_fad_dp_mux_macro__mux_aonpe__ports_3__stack_32l__width_12 fsr5_in  (
  .din0(fpc_fsr_w1_result_fw[11:0]),     // w1         {ftt,aexc,cexc}
  .din1(fpc_fsr_w2_result_fw[11:0]),     // fdiv/fsqrt {ftt,aexc,cexc}
  .din2({2'b0, fsr5_fx1[17:13], 5'b0}),  // accrued aexc
  .sel0(fac_fsr5_sel_fw[4]),
  .sel1(fac_fsr5_sel_fw[5]),
  .sel2(1'b1),
  .dout(fsr5_fttexc_merged_fw[11:0])
  );

fgu_fad_dp_msff_macro__mux_aodec__ports_8__stack_32l__width_28 fx1_fsr5  (	// FS:wmr_protect
  .scan_in(fx1_fsr5_wmr_scanin),
  .scan_out(fx1_fsr5_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .se(lb_scan_en_wmr),
  .clk (l2clk),
  .en  (fac_fsr5_sel_fw[3]),
  .din0({ldfsr_data_fw[27:26],         // LDFSR:	rd
         ldfsr_data_fw[25:21],         //		tem
         ldfsr_data_fw[20],            //		ns
         fsr5_fx1[19:18],              //		ftt
         ldfsr_data_fw[17:8],          //		aexc,cexc
         fsr5_fx1[7:6],                //		fcc3
         fsr5_fx1[5:4],                //		fcc2
         fsr5_fx1[3:2],                //		fcc1
         ldfsr_data_fw[1:0]}),         //		fcc0
  .din1({ldfsr_data_fw[27:26],         // LDXFSR:	rd
         ldfsr_data_fw[25:21],         //		tem
         ldfsr_data_fw[20],            //		ns
         fsr5_fx1[19:18],	       //		ftt
         ldfsr_data_fw[17:8],          //		aexc,cexc
         ldfsr_data_fw[7:6],           //		fcc3
         ldfsr_data_fw[5:4],           //		fcc2
         ldfsr_data_fw[3:2],           //		fcc1
         ldfsr_data_fw[1:0]}),         //		fcc0
  .din2({fsr5_fx1[27:26],              // ST(X)FSR:	rd
         fsr5_fx1[25:21],	       //		tem
         fsr5_fx1[20],	               //		ns
         fsr5_fttexc_merged_fw[11:10], //		ftt
         fsr5_fx1[17:8],	       //		aexc,cexc
         fsr5_fx1[7:6],	               //		fcc3
         fsr5_fx1[5:4],	               //		fcc2
         fsr5_fx1[3:2],	               //		fcc1
         fsr5_fx1[1:0]}),	       //		fcc0
  .din3({fsr5_fx1[27:26],              // FCMP(E) fcc0: rd
         fsr5_fx1[25:21],              //		tem
         fsr5_fx1[20],		       //		ns
         fsr5_fttexc_merged_fw[11:10], //		ftt
         fsr5_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr5_fx1[7:6],		       //		fcc3
         fsr5_fx1[5:4],		       //		fcc2
         fsr5_fx1[3:2],		       //		fcc1
         fpc_fcc_fw[1:0]}),	       //		fcc0
  .din4({fsr5_fx1[27:26],              // FCMP(E) fcc1: rd
         fsr5_fx1[25:21],              //		tem
         fsr5_fx1[20],		       //		ns
         fsr5_fttexc_merged_fw[11:10], //		ftt
         fsr5_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr5_fx1[7:6],		       //		fcc3
         fsr5_fx1[5:4],	               //		fcc2
         fpc_fcc_fw[1:0],	       //		fcc1
         fsr5_fx1[1:0]}),              //		fcc0
  .din5({fsr5_fx1[27:26],              // FCMP(E) fcc2: rd
         fsr5_fx1[25:21],	       //		tem
         fsr5_fx1[20],		       //		ns
         fsr5_fttexc_merged_fw[11:10], //		ftt
         fsr5_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr5_fx1[7:6],		       //		fcc3
         fpc_fcc_fw[1:0],	       //		fcc2
         fsr5_fx1[3:2],	               //		fcc1
         fsr5_fx1[1:0]}),              //		fcc0
  .din6({fsr5_fx1[27:26],              // FCMP(E) fcc3: rd
         fsr5_fx1[25:21],	       //		tem
         fsr5_fx1[20],	               //		ns
         fsr5_fttexc_merged_fw[11:10], //		ftt
         fsr5_fttexc_merged_fw[9:0],   //		aexc,cexc
         fpc_fcc_fw[1:0],	       //		fcc3
         fsr5_fx1[5:4],		       //		fcc2
         fsr5_fx1[3:2],		       //		fcc1
         fsr5_fx1[1:0]}),              //		fcc0
  .din7({fsr5_fx1[27:26],              // other FPop:   rd
         fsr5_fx1[25:21],	       //		tem
         fsr5_fx1[20],		       //		ns
         fsr5_fttexc_merged_fw[11:10], //		ftt
         fsr5_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr5_fx1[7:6],                //		fcc3
         fsr5_fx1[5:4],		       //		fcc2
         fsr5_fx1[3:2],		       //		fcc1
         fsr5_fx1[1:0]}),              //		fcc0
  .sel (fac_fsr5_sel_fw[2:0]),
  .dout(fsr5_fx1[27:0]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ----------
// FSR tid6
// ----------

fgu_fad_dp_mux_macro__mux_aonpe__ports_3__stack_32l__width_12 fsr6_in  (
  .din0(fpc_fsr_w1_result_fw[11:0]),     // w1         {ftt,aexc,cexc}
  .din1(fpc_fsr_w2_result_fw[11:0]),     // fdiv/fsqrt {ftt,aexc,cexc}
  .din2({2'b0, fsr6_fx1[17:13], 5'b0}),  // accrued aexc
  .sel0(fac_fsr6_sel_fw[4]),
  .sel1(fac_fsr6_sel_fw[5]),
  .sel2(1'b1),
  .dout(fsr6_fttexc_merged_fw[11:0])
  );

fgu_fad_dp_msff_macro__mux_aodec__ports_8__stack_32l__width_28 fx1_fsr6  (	// FS:wmr_protect
  .scan_in(fx1_fsr6_wmr_scanin),
  .scan_out(fx1_fsr6_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .se(lb_scan_en_wmr),
  .clk (l2clk),
  .en  (fac_fsr6_sel_fw[3]),
  .din0({ldfsr_data_fw[27:26],         // LDFSR:	rd
         ldfsr_data_fw[25:21],         //		tem
         ldfsr_data_fw[20],            //		ns
         fsr6_fx1[19:18],              //		ftt
         ldfsr_data_fw[17:8],          //		aexc,cexc
         fsr6_fx1[7:6],                //		fcc3
         fsr6_fx1[5:4],                //		fcc2
         fsr6_fx1[3:2],                //		fcc1
         ldfsr_data_fw[1:0]}),         //		fcc0
  .din1({ldfsr_data_fw[27:26],         // LDXFSR:	rd
         ldfsr_data_fw[25:21],         //		tem
         ldfsr_data_fw[20],            //		ns
         fsr6_fx1[19:18],	       //		ftt
         ldfsr_data_fw[17:8],          //		aexc,cexc
         ldfsr_data_fw[7:6],           //		fcc3
         ldfsr_data_fw[5:4],           //		fcc2
         ldfsr_data_fw[3:2],           //		fcc1
         ldfsr_data_fw[1:0]}),         //		fcc0
  .din2({fsr6_fx1[27:26],              // ST(X)FSR:	rd
         fsr6_fx1[25:21],	       //		tem
         fsr6_fx1[20],	               //		ns
         fsr6_fttexc_merged_fw[11:10], //		ftt
         fsr6_fx1[17:8],	       //		aexc,cexc
         fsr6_fx1[7:6],	               //		fcc3
         fsr6_fx1[5:4],	               //		fcc2
         fsr6_fx1[3:2],	               //		fcc1
         fsr6_fx1[1:0]}),	       //		fcc0
  .din3({fsr6_fx1[27:26],              // FCMP(E) fcc0: rd
         fsr6_fx1[25:21],              //		tem
         fsr6_fx1[20],		       //		ns
         fsr6_fttexc_merged_fw[11:10], //		ftt
         fsr6_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr6_fx1[7:6],		       //		fcc3
         fsr6_fx1[5:4],		       //		fcc2
         fsr6_fx1[3:2],		       //		fcc1
         fpc_fcc_fw[1:0]}),	       //		fcc0
  .din4({fsr6_fx1[27:26],              // FCMP(E) fcc1: rd
         fsr6_fx1[25:21],              //		tem
         fsr6_fx1[20],		       //		ns
         fsr6_fttexc_merged_fw[11:10], //		ftt
         fsr6_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr6_fx1[7:6],		       //		fcc3
         fsr6_fx1[5:4],	               //		fcc2
         fpc_fcc_fw[1:0],	       //		fcc1
         fsr6_fx1[1:0]}),              //		fcc0
  .din5({fsr6_fx1[27:26],              // FCMP(E) fcc2: rd
         fsr6_fx1[25:21],	       //		tem
         fsr6_fx1[20],		       //		ns
         fsr6_fttexc_merged_fw[11:10], //		ftt
         fsr6_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr6_fx1[7:6],		       //		fcc3
         fpc_fcc_fw[1:0],	       //		fcc2
         fsr6_fx1[3:2],	               //		fcc1
         fsr6_fx1[1:0]}),              //		fcc0
  .din6({fsr6_fx1[27:26],              // FCMP(E) fcc3: rd
         fsr6_fx1[25:21],	       //		tem
         fsr6_fx1[20],	               //		ns
         fsr6_fttexc_merged_fw[11:10], //		ftt
         fsr6_fttexc_merged_fw[9:0],   //		aexc,cexc
         fpc_fcc_fw[1:0],	       //		fcc3
         fsr6_fx1[5:4],		       //		fcc2
         fsr6_fx1[3:2],		       //		fcc1
         fsr6_fx1[1:0]}),              //		fcc0
  .din7({fsr6_fx1[27:26],              // other FPop:   rd
         fsr6_fx1[25:21],	       //		tem
         fsr6_fx1[20],		       //		ns
         fsr6_fttexc_merged_fw[11:10], //		ftt
         fsr6_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr6_fx1[7:6],                //		fcc3
         fsr6_fx1[5:4],		       //		fcc2
         fsr6_fx1[3:2],		       //		fcc1
         fsr6_fx1[1:0]}),              //		fcc0
  .sel (fac_fsr6_sel_fw[2:0]),
  .dout(fsr6_fx1[27:0]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ----------
// FSR tid7
// ----------

fgu_fad_dp_mux_macro__mux_aonpe__ports_3__stack_32l__width_12 fsr7_in  (
  .din0(fpc_fsr_w1_result_fw[11:0]),     // w1         {ftt,aexc,cexc}
  .din1(fpc_fsr_w2_result_fw[11:0]),     // fdiv/fsqrt {ftt,aexc,cexc}
  .din2({2'b0, fsr7_fx1[17:13], 5'b0}),  // accrued aexc
  .sel0(fac_fsr7_sel_fw[4]),
  .sel1(fac_fsr7_sel_fw[5]),
  .sel2(1'b1),
  .dout(fsr7_fttexc_merged_fw[11:0])
  );

fgu_fad_dp_msff_macro__mux_aodec__ports_8__stack_32l__width_28 fx1_fsr7  (	// FS:wmr_protect
  .scan_in(fx1_fsr7_wmr_scanin),
  .scan_out(fx1_fsr7_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .se(lb_scan_en_wmr),
  .clk (l2clk),
  .en  (fac_fsr7_sel_fw[3]),
  .din0({ldfsr_data_fw[27:26],         // LDFSR:	rd
         ldfsr_data_fw[25:21],         //		tem
         ldfsr_data_fw[20],            //		ns
         fsr7_fx1[19:18],              //		ftt
         ldfsr_data_fw[17:8],          //		aexc,cexc
         fsr7_fx1[7:6],                //		fcc3
         fsr7_fx1[5:4],                //		fcc2
         fsr7_fx1[3:2],                //		fcc1
         ldfsr_data_fw[1:0]}),         //		fcc0
  .din1({ldfsr_data_fw[27:26],         // LDXFSR:	rd
         ldfsr_data_fw[25:21],         //		tem
         ldfsr_data_fw[20],            //		ns
         fsr7_fx1[19:18],	       //		ftt
         ldfsr_data_fw[17:8],          //		aexc,cexc
         ldfsr_data_fw[7:6],           //		fcc3
         ldfsr_data_fw[5:4],           //		fcc2
         ldfsr_data_fw[3:2],           //		fcc1
         ldfsr_data_fw[1:0]}),         //		fcc0
  .din2({fsr7_fx1[27:26],              // ST(X)FSR:	rd
         fsr7_fx1[25:21],	       //		tem
         fsr7_fx1[20],	               //		ns
         fsr7_fttexc_merged_fw[11:10], //		ftt
         fsr7_fx1[17:8],	       //		aexc,cexc
         fsr7_fx1[7:6],	               //		fcc3
         fsr7_fx1[5:4],	               //		fcc2
         fsr7_fx1[3:2],	               //		fcc1
         fsr7_fx1[1:0]}),	       //		fcc0
  .din3({fsr7_fx1[27:26],              // FCMP(E) fcc0: rd
         fsr7_fx1[25:21],              //		tem
         fsr7_fx1[20],		       //		ns
         fsr7_fttexc_merged_fw[11:10], //		ftt
         fsr7_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr7_fx1[7:6],		       //		fcc3
         fsr7_fx1[5:4],		       //		fcc2
         fsr7_fx1[3:2],		       //		fcc1
         fpc_fcc_fw[1:0]}),	       //		fcc0
  .din4({fsr7_fx1[27:26],              // FCMP(E) fcc1: rd
         fsr7_fx1[25:21],              //		tem
         fsr7_fx1[20],		       //		ns
         fsr7_fttexc_merged_fw[11:10], //		ftt
         fsr7_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr7_fx1[7:6],		       //		fcc3
         fsr7_fx1[5:4],	               //		fcc2
         fpc_fcc_fw[1:0],	       //		fcc1
         fsr7_fx1[1:0]}),              //		fcc0
  .din5({fsr7_fx1[27:26],              // FCMP(E) fcc2: rd
         fsr7_fx1[25:21],	       //		tem
         fsr7_fx1[20],		       //		ns
         fsr7_fttexc_merged_fw[11:10], //		ftt
         fsr7_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr7_fx1[7:6],		       //		fcc3
         fpc_fcc_fw[1:0],	       //		fcc2
         fsr7_fx1[3:2],	               //		fcc1
         fsr7_fx1[1:0]}),              //		fcc0
  .din6({fsr7_fx1[27:26],              // FCMP(E) fcc3: rd
         fsr7_fx1[25:21],	       //		tem
         fsr7_fx1[20],	               //		ns
         fsr7_fttexc_merged_fw[11:10], //		ftt
         fsr7_fttexc_merged_fw[9:0],   //		aexc,cexc
         fpc_fcc_fw[1:0],	       //		fcc3
         fsr7_fx1[5:4],		       //		fcc2
         fsr7_fx1[3:2],		       //		fcc1
         fsr7_fx1[1:0]}),              //		fcc0
  .din7({fsr7_fx1[27:26],              // other FPop:   rd
         fsr7_fx1[25:21],	       //		tem
         fsr7_fx1[20],		       //		ns
         fsr7_fttexc_merged_fw[11:10], //		ftt
         fsr7_fttexc_merged_fw[9:0],   //		aexc,cexc
         fsr7_fx1[7:6],                //		fcc3
         fsr7_fx1[5:4],		       //		fcc2
         fsr7_fx1[3:2],		       //		fcc1
         fsr7_fx1[1:0]}),              //		fcc0
  .sel (fac_fsr7_sel_fw[2:0]),
  .dout(fsr7_fx1[27:0]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ----------------------------------------------------------------------------
// FGU ASI local ring datapath
// ----------------------------------------------------------------------------

fgu_fad_dp_msff_macro__stack_32l__width_31 flop_rng1_4f  (
  .scan_in(flop_rng1_4f_scanin),
  .scan_out(flop_rng1_4f_scanout),
  .clk (l2clk),
  .en  (asi_clken),
  .din (fgd_rngl_cdbus_3f[62:32]),
  .dout(    rngl_cdbus_4f[62:32]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fad_dp_msff_macro__stack_32l__width_32 flop_rng0_4f  (
  .scan_in(flop_rng0_4f_scanin),
  .scan_out(flop_rng0_4f_scanout),
  .clk (l2clk),
  .en  (asi_clken),
  .din (fgd_rngl_cdbus_3f[31:0]),
  .dout(    rngl_cdbus_4f[31:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fad_dp_buff_macro__rep_1__stack_32l__width_31 buf_rng1  (
  .din (    rngl_cdbus_4f[62:32]),
  .dout(fgu_rngl_cdbus[62:32])
  );

fgu_fad_dp_buff_macro__rep_1__stack_32l__width_32 buf_rng0  (
  .din (    rngl_cdbus_4f[31:0]),
  .dout(fgu_rngl_cdbus[31:0])
  );


// ----------------------------------------------------------------------------
//                               FX1 stage
// ----------------------------------------------------------------------------

// ------------------------------------
// FSR thread 0-7 mux
//
// ST(X)FSR has a presync. All preceeding instrs have completed
// FW+1 before ST(X)FSR reaches FX1.
//
// LD(X)FSR has same presync as ST(X)FSR. LD(X)FSR update of the
// architected FSR is available in FX4. Instrs following LD(X)FSR
// are in E when LD(X)FSR is in FX4.
//
// As a result, the mux below can be a mux/flop and still allow
// correct functionality. Making it a mux/flop helps storefmt timing
// for the ST(X)FSR path.
// ------------------------------------

fgu_fad_dp_msff_macro__mux_aodec__ports_8__stack_32l__width_28 fx1_fsr  (
  .scan_in(fx1_fsr_scanin),
  .scan_out(fx1_fsr_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din0(fsr0_fx1[27:0]),
  .din1(fsr1_fx1[27:0]),
  .din2(fsr2_fx1[27:0]),
  .din3(fsr3_fx1[27:0]),
  .din4(fsr4_fx1[27:0]),
  .din5(fsr5_fx1[27:0]),
  .din6(fsr6_fx1[27:0]),
  .din7(fsr7_fx1[27:0]),
  .sel (fac_tid_e[2:0]),  // ST(X)FSR is in E when mux is selecting the FSR.
                          // Instr following LD(X)FSR is in E when mux is selecting the FSR.
  .dout({fad_fsr_rd_fx1[1:0],     // LD(X)FSR update only
         fad_fsr_tem_fx1[4:0],    // LD(X)FSR update only
         fad_fsr_ns_fx1,          // LD(X)FSR update only
             fsr_ftt_fx1[1:0],    // ST(X)FSR usage only
             fsr_aexc_fx1[4:0],   // ST(X)FSR usage only
             fsr_cexc_fx1[4:0],   // ST(X)FSR usage only
             fsr_fcc3_fx1[1:0],   // STXFSR   usage only
             fsr_fcc2_fx1[1:0],   // STXFSR   usage only
             fsr_fcc1_fx1[1:0],   // STXFSR   usage only
             fsr_fcc0_fx1[1:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)  // ST(X)FSR usage only
  );

// ------------------------------------
// Mantissa format muxes
// ------------------------------------

fgu_fad_dp_mux_macro__mux_aonpe__ports_5__width_64 rs1fmt  (
  .din0({1'b1,fad_rs1_fx1[51:0], 11'b0}),  // DP
  .din1({1'b1,fad_rs1_fx1[22:0], 40'b0}),  // SP odd (rotate)
  .din2({1'b1,fad_rs1_fx1[54:32],40'b0}),  // SP even
  .din3({fad_rs1_fx1[31:0],      32'b0}),  // Word odd (rotate)
  .din4( fad_rs1_fx1[63:0]             ),  // Dblword, Word even
                                           // else: Const 64'b0
  .sel0(aman_fmt_sel_fx1[0]),
  .sel1(aman_fmt_sel_fx1[1]),
  .sel2(aman_fmt_sel_fx1[2]),
  .sel3(aman_fmt_sel_fx1[3]),
  .sel4(aman_fmt_sel_fx1[4]),
  .dout(rs1_fmt_fx1[63:0])
  );

fgu_fad_dp_buff_macro__width_64 buf_rs1fmt  (
  .din (    rs1_fmt_fx1[63:0]),
  .dout(fad_rs1_fmt_fx1[63:0])
  );

fgu_fad_dp_mux_macro__mux_aonpe__ports_5__width_64 rs2fmt  (
  .din0({1'b1,fad_rs2_fx1[51:0], 11'b0}),  // DP
  .din1({1'b1,fad_rs2_fx1[22:0], 40'b0}),  // SP odd (rotate)
  .din2({1'b1,fad_rs2_fx1[54:32],40'b0}),  // SP even
  .din3({fad_rs2_fx1[31:0],      32'b0}),  // Word odd (rotate)
  .din4( fad_rs2_fx1[63:0]             ),  // Dblword, Word even
  .sel0(bman_fmt_sel_fx1[0]),
  .sel1(bman_fmt_sel_fx1[1]),
  .sel2(bman_fmt_sel_fx1[2]),
  .sel3(bman_fmt_sel_fx1[3]),
  .sel4(bman_fmt_sel_fx1[4]),
  .dout(rs2_fmt_fx1[63:0])
  );

fgu_fad_dp_buff_macro__width_64 buf_rs2fmt  (
  .din (    rs2_fmt_fx1[63:0]),
  .dout(fad_rs2_fmt_fx1[63:0])
  );

fgu_fad_dp_mux_macro__mux_aonpe__ports_4__width_64 storefmt  (
  .din0({fad_rs2_fx1[31:0],      32'b0}),  // STF odd (rotate)
  .din1( fad_rs2_fx1[63:0]             ),  // STF even, STDF
  .din2({26'b0,
             fsr_fcc3_fx1[1:0],
             fsr_fcc2_fx1[1:0],
             fsr_fcc1_fx1[1:0],
         fad_fsr_rd_fx1[1:0],
         2'b0,
         fad_fsr_tem_fx1[4:0],
         fad_fsr_ns_fx1,
         2'b0,
         3'b0,                             // FSR.ver    = 3'b0
	 1'b0,                             // FSR.ftt[2] = 1'b0
             fsr_ftt_fx1[1:0],
         2'b0,
             fsr_fcc0_fx1[1:0],
             fsr_aexc_fx1[4:0],
             fsr_cexc_fx1[4:0]
                                      }),  // STXFSR
  .din3({fad_fsr_rd_fx1[1:0],
         2'b0,
         fad_fsr_tem_fx1[4:0],
         fad_fsr_ns_fx1,
         2'b0,
         3'b0,                             // FSR.ver    = 3'b0
	 1'b0,                             // FSR.ftt[2] = 1'b0
             fsr_ftt_fx1[1:0],
         2'b0,
             fsr_fcc0_fx1[1:0],
             fsr_aexc_fx1[4:0],
             fsr_cexc_fx1[4:0],
         32'b0                        }),  // STFSR
  .sel0(fac_fst_fmt_sel_fx1[0]),
  .sel1(fac_fst_fmt_sel_fx1[1]),
  .sel2(fac_fst_fmt_sel_fx1[2]),
  .sel3(fac_fst_fmt_sel_fx1[3]),
  .dout(fst_data_fx1[63:0])                // pwr mgmt: aomux free zeros
  );

fgu_fad_dp_buff_macro__rep_1__width_64 buf_storefmt  (
  .din (        fst_data_fx1[63:0]),
  .dout(fgu_lsu_fst_data_fx1[63:0])
  );


// ----------------------------------------------------------------------------
//                               FB stage
// ----------------------------------------------------------------------------

fgu_fad_dp_mux_macro__mux_aope__ports_3__width_12 w2addr  (
  .din0({fac_fpd_addr_fb[4:0],
         fac_fpd_tid_fb[2:0],
         fac_fpd_32b_fb,
         fac_fpd_odd32b_fb,
         pre_fpd_vld_fb[1:0]}),
  .din1({fac_fpd_addr_fb[4:0],
         fac_fpd_tid_fb[2:0],
         fac_fpd_32b_fb,
         fac_fpd_odd32b_fb,
         pre_fpd_vld_fb[1:0]}),
  .din2({lsu_fgu_fld_addr_b[4:0],
         lsu_fgu_fld_tid_b[2:0],
         lsu_fgu_fld_32b_b,
         lsu_fgu_fld_odd32b_b,
         2'b0}),
  .sel0(div_finish_fltd_fb),
  .sel1(div_finish_flts_fb),
  .dout({w2_addr_fb[4:0],
         w2_tid_fb[2:0],
         w2_32b_fb,
         w2_odd32b_fb,
         fpd_vld_fb[1:0]})
  );

fgu_fad_dp_inv_macro__width_5 inv_vld  (
  .din ({lsu_fgu_fld_32b_b,
         lsu_fgu_fld_odd32b_b,
         lsu_fgu_fsr_load_b,
         fpd_trap_fb,
         fac_fpd_odd32b_fb}),
  .dout({lsu_fgu_fld_32b_b_,
         lsu_fgu_fld_odd32b_b_,
         lsu_fgu_fsr_load_b_,
         fpd_trap_fb_,
         fac_fpd_odd32b_fb_})
  );

fgu_fad_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_1 even_en_ld  ( 
  .din0(lsu_fgu_fld_32b_b    ),
  .din1(lsu_fgu_fld_32b_b_   ),
  .sel0(lsu_fgu_fld_odd32b_b_),
  .sel1(1'b1                 ),
  .dout(fld_w2_even_en_fb    )
  );

fgu_fad_dp_or_macro__ports_2__width_2 odd_en_ld  ( 
  .din0({lsu_fgu_fld_32b_b_,   fpc_fpd_ieee_trap_fb }),
  .din1({lsu_fgu_fld_odd32b_b, fpc_fpd_unfin_fb     }),
  .dout({fld_w2_odd_en_fb,     fpd_trap_fb          })
  );

// 0in custom -fire ((|fad_w2_vld_fw[1:0]) & ($0in_delay((fpc_fpd_ieee_trap_fb | fpc_fpd_unfin_fb),1))) -message "FRF written during FP trap"

// 0in custom -fire ((lsu_fgu_fld_vld_w & ($0in_delay((lsu_fgu_fsr_load_b & (|fpc_w1_vld_fb[1:0]) & (lsu_fgu_fld_tid_b[2:0]==fac_w1_tid_fb[2:0])),1))) | (lsu_fgu_fld_vld_w & ($0in_delay((lsu_fgu_fsr_load_b & (|fad_w1_vld_fw[1:0]) & (lsu_fgu_fld_tid_b[2:0]==fad_w1_tid_fw[2:0])),1)))) -message "LDFSR collision with FPop"

fgu_fad_dp_and_macro__ports_3__width_2 and_vld  (
  .din0({fld_w2_even_en_fb,   fld_w2_odd_en_fb   }),
  .din1({lsu_fgu_fsr_load_b_, lsu_fgu_fsr_load_b_}),
  .din2({mbist_run_1f_,       mbist_run_1f_      }),
  .dout({pre_fld_vld_fb[1],   pre_fld_vld_fb[0]  })
  );

fgu_fad_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_2 fpd_vld  ( 
  .din0({div_finish_fltd_fb,      div_finish_fltd_fb    }),
  .din1({div_finish_flts_even_fb, div_finish_flts_odd_fb}),
  .sel0( fpd_trap_fb_),
  .sel1( fpd_trap_fb_),
  .dout({pre_fpd_vld_fb[1],       pre_fpd_vld_fb[0]     })
  );

fgu_fad_dp_and_macro__ports_2__width_3 fpd_odd  ( 
  .din0({div_finish_flts_fb, div_finish_flts_fb,     div_finish_flts_fb     }),
  .din1({fac_fpd_odd32b_fb,  fac_fpd_odd32b_fb,      fac_fpd_odd32b_fb_     }),
  .dout({fpd_vld_odd32b_fb,  div_finish_flts_odd_fb, div_finish_flts_even_fb})
  );

fgu_fad_dp_mux_macro__mux_aonpe__ports_2__width_52 div_const  (
  .din0(fdd_result_rep0[62:11]),  // FPD mantissa result
  .din1(52'hfffffffffffff),       // FPD mantissa constant result for fdiv overflow (max or inf)
  .sel0(fpc_fpd_const_sel[0]),    // Note: lack of sel0 or sel1 provides free zeros for aomux,
  .sel1(fpc_fpd_const_sel[1]),    //       fdiv underflow constant result is zero
  .dout(q_fdd_result_rep0[62:11])
  );

fgu_fad_dp_mux_macro__mux_aope__ports_4__width_64 mux_w2data  (
  .din0({       fpc_fpd_sign_res, fpc_fpd_exp_res[10:0], q_fdd_result_rep0[62:11]       }),  // FPD result DP
  .din1({32'b0, fpc_fpd_sign_res, fpc_fpd_exp_res[7:0], q_fdd_result_rep0[62:40]       }),  // FPD result SP odd
  .din2({       fpc_fpd_sign_res, fpc_fpd_exp_res[7:0], q_fdd_result_rep0[62:40], 32'b0}),  // FPD result SP even
  .din3(lsu_fgu_fld_data_b[63:0]),
  .sel0(div_finish_fltd_fb),
  .sel1(fpd_vld_odd32b_fb),
  .sel2(div_finish_flts_fb),
  .dout(w2_result_fb[63:0])
  );


// ----------------------------------------------------------------------------
//                               FW stage
// ----------------------------------------------------------------------------

fgu_fad_dp_msff_macro__width_64 fw_w2data  (
  .scan_in(fw_w2data_scanin),
  .scan_out(fw_w2data_scanout),
  .clk (l2clk),
  .en  (coreon_clken),
  .din (          w2_result_fb[63:0]),  // requires free running clk
  .dout(fad_nombi_w2_result_fw[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fad_dp_msff_macro__width_64 fw_w1  (
  .scan_in(fw_w1_scanin),
  .scan_out(fw_w1_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din (fpf_w1_result_fb[63:0]),
  .dout(    w1_result_fw[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fad_dp_msff_macro__stack_32l__width_26 fw_ldfsr  (
  .scan_in(fw_ldfsr_scanin),
  .scan_out(fw_ldfsr_scanout),
  .clk (l2clk),
  .en  (lsu_fgu_fld_b),
  .din ({lsu_fgu_fld_data_b[31:30],    // requires free running clk or lsu_fgu_fld_b en
         lsu_fgu_fld_data_b[27:22],    // requires free running clk or lsu_fgu_fld_b en
         lsu_fgu_fld_data_b[9:0],      // requires free running clk or lsu_fgu_fld_b en
         lsu_fgu_fld_data_b[37:32],    // requires free running clk or lsu_fgu_fld_b en
         lsu_fgu_fld_data_b[11:10]}),  // requires free running clk or lsu_fgu_fld_b en
  .dout({ldfsr_data_fw[27:20], ldfsr_data_fw[17:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

assign  fgu_fld_fcc_fx3[7:0] = ldfsr_data_fw[7:0];

fgu_fad_dp_inv_macro__width_1 inv_mbist_run  (
  .din (mbist_run_1f),
  .dout(mbist_run_1f_)
  );

fgu_fad_dp_mux_macro__buffsel_none__mux_aonpe__ports_3__width_2 w2_vld  ( 
  .din0({pre_fld_vld_fw[1],     pre_fld_vld_fw[0]    }),  // functional, pre qualified with mbist_run_1f_
  .din1({fpd_vld_fw[1],         fpd_vld_fw[0]        }),  // functional
  .din2({mbist_frf_write_en_1f, mbist_frf_write_en_1f}),  // MBIST
  .sel0(lsu_fgu_fld_vld_w),
  .sel1(mbist_run_1f_),
  .sel2(mbist_run_1f),
  .dout({fad_w2_vld_fw[1],      fad_w2_vld_fw[0]     })
  );

fgu_fad_dp_mux_macro__mux_pgpe__ports_2__width_64 mux_w2mbist1  (
  .din0({8{fec_mbist_wdata_1f[7:0]}}),  // MBIST
  .din1(fad_nombi_w2_result_fw[63:0]),  // functional
  .sel0(mbist_run_1f),
  .dout(fad_w2_result_fw[63:0]      )
  );

fgu_fad_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_8 mux_w2mbist2  (
  .din0({fac_mbist_addr_1f[7:5], fac_mbist_addr_1f[4:0]}),  // MBIST
  .din1({w2_tid_fw[2:0],         w2_addr_fw[4:0]       }),  // functional
  .sel0(mbist_run_1f),
  .sel1(mbist_run_1f_),
  .dout({i_w2_tid_fw[2:0],       i_w2_addr_fw[4:0]     })
  );

fgu_fad_dp_buff_macro__width_8 buf_w2mbist2  (
  .din ({  i_w2_tid_fw[2:0],   i_w2_addr_fw[4:0]}),
  .dout({fad_w2_tid_fw[2:0], fad_w2_addr_fw[4:0]})
  );


// ----------------------------------------------------------------------------
//                               FW1 stage
// ----------------------------------------------------------------------------

fgu_fad_dp_msff_macro__minbuff_1__width_64 fw1_w2data  (
  .scan_in(fw1_w2data_scanin),
  .scan_out(fw1_w2data_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din (fad_nombi_w2_result_fw[63:0]),
  .dout(w2_result_fw1[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );


// fixscan start:
assign e_01_scanin               = scan_in                  ;
assign e_01_extra_scanin         = e_01_scanout             ;
assign fx1_rs1byp_scanin         = e_01_extra_scanout       ;
assign fx1_rs2byp_scanin         = fx1_rs1byp_scanout       ;
assign flop_rng1_4f_scanin       = fx1_rs2byp_scanout       ;
assign flop_rng0_4f_scanin       = flop_rng1_4f_scanout     ;
assign fx1_fsr_scanin            = flop_rng0_4f_scanout     ;
assign fw_w2data_scanin          = fx1_fsr_scanout          ;
assign fw_w1_scanin              = fw_w2data_scanout        ;
assign fw_ldfsr_scanin           = fw_w1_scanout            ;
assign fw1_w2data_scanin         = fw_ldfsr_scanout         ;
assign scan_out                  = fw1_w2data_scanout       ;

assign fx1_fsr0_wmr_scanin       = wmr_scan_in              ;
assign fx1_fsr1_wmr_scanin       = fx1_fsr0_wmr_scanout     ;
assign fx1_fsr2_wmr_scanin       = fx1_fsr1_wmr_scanout     ;
assign fx1_fsr3_wmr_scanin       = fx1_fsr2_wmr_scanout     ;
assign fx1_fsr4_wmr_scanin       = fx1_fsr3_wmr_scanout     ;
assign fx1_fsr5_wmr_scanin       = fx1_fsr4_wmr_scanout     ;
assign fx1_fsr6_wmr_scanin       = fx1_fsr5_wmr_scanout     ;
assign fx1_fsr7_wmr_scanin       = fx1_fsr6_wmr_scanout     ;
assign wmr_scan_out              = fx1_fsr7_wmr_scanout     ;
// fixscan end:
endmodule  // fgu_fad_dp



//
//   buff macro
//
//





module fgu_fad_dp_buff_macro__dbuff_32x__rep_1__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule









// any PARAMS parms go into naming of macro

module fgu_fad_dp_msff_macro__width_47 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [45:0] so;

  input [46:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [46:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(47)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[46:0]),
.si({scan_in,so[45:0]}),
.so({so[45:0],scan_out}),
.q(dout[46:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fad_dp_msff_macro__width_23 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [21:0] so;

  input [22:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [22:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(23)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[22:0]),
.si({scan_in,so[21:0]}),
.so({so[21:0],scan_out}),
.q(dout[22:0])
);




















endmodule









//  
//   and macro for ports = 2,3,4
//
//





module fgu_fad_dp_and_macro__ports_2__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






and2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module fgu_fad_dp_cmp_macro__width_12 (
  din0, 
  din1, 
  dout);
  input [11:0] din0;
  input [11:0] din1;
  output dout;






cmp #(12)  m0_0 (
.in0(din0[11:0]),
.in1(din1[11:0]),
.out(dout)
);










endmodule





//
//   nor macro for ports = 2,3
//
//





module fgu_fad_dp_nor_macro__ports_3__width_4 (
  din0, 
  din1, 
  din2, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  input [3:0] din2;
  output [3:0] dout;






nor3 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.in2(din2[3:0]),
.out(dout[3:0])
);







endmodule





//
//   nand macro for ports = 2,3,4
//
//





module fgu_fad_dp_nand_macro__ports_2__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






nand2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule









// any PARAMS parms go into naming of macro

module fgu_fad_dp_msff_macro__dmux_4x__mux_aope__ports_7__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  sel4, 
  sel5, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  input [63:0] din4;
  input [63:0] din5;
  input [63:0] din6;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input sel5;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_penc7_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .sel4(sel4),
 .sel5(sel5),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6)
);

mux7s #(64)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
  .in5(din5[63:0]),
  .in6(din6[63:0]),
.dout(muxout[63:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule









//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module fgu_fad_dp_cmp_macro__width_64 (
  din0, 
  din1, 
  dout);
  input [63:0] din0;
  input [63:0] din1;
  output dout;






cmp #(64)  m0_0 (
.in0(din0[63:0]),
.in1(din1[63:0]),
.out(dout)
);










endmodule





//
//   parity macro (even parity)
//
//





module fgu_fad_dp_prty_macro__width_32 (
  din, 
  dout);
  input [31:0] din;
  output dout;







prty #(32)  m0_0 (
.in(din[31:0]),
.out(dout)
);










endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fad_dp_mux_macro__mux_aonpe__ports_3__stack_32l__width_12 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;

  input [11:0] din0;
  input sel0;
  input [11:0] din1;
  input sel1;
  input [11:0] din2;
  input sel2;
  output [11:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(12)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[11:0]),
  .in1(din1[11:0]),
  .in2(din2[11:0]),
.dout(dout[11:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module fgu_fad_dp_msff_macro__mux_aodec__ports_8__stack_32l__width_28 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;
wire [27:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [26:0] so;

  input [27:0] din0;
  input [27:0] din1;
  input [27:0] din2;
  input [27:0] din3;
  input [27:0] din4;
  input [27:0] din5;
  input [27:0] din6;
  input [27:0] din7;
  input [2:0] sel;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [27:0] dout;


  output scan_out;




cl_dp1_pdec8_8x  c1_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .sel2(sel[2]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7)
);

mux8s #(28)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[27:0]),
  .in1(din1[27:0]),
  .in2(din2[27:0]),
  .in3(din3[27:0]),
  .in4(din4[27:0]),
  .in5(din5[27:0]),
  .in6(din6[27:0]),
  .in7(din7[27:0]),
.dout(muxout[27:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(28)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[27:0]),
.si({scan_in,so[26:0]}),
.so({so[26:0],scan_out}),
.q(dout[27:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fad_dp_msff_macro__stack_32l__width_31 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [29:0] so;

  input [30:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [30:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(31)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[30:0]),
.si({scan_in,so[29:0]}),
.so({so[29:0],scan_out}),
.q(dout[30:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fad_dp_msff_macro__stack_32l__width_32 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [30:0] so;

  input [31:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [31:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);




















endmodule









//
//   buff macro
//
//





module fgu_fad_dp_buff_macro__rep_1__stack_32l__width_31 (
  din, 
  dout);
  input [30:0] din;
  output [30:0] dout;






buff #(31)  d0_0 (
.in(din[30:0]),
.out(dout[30:0])
);








endmodule





//
//   buff macro
//
//





module fgu_fad_dp_buff_macro__rep_1__stack_32l__width_32 (
  din, 
  dout);
  input [31:0] din;
  output [31:0] dout;






buff #(32)  d0_0 (
.in(din[31:0]),
.out(dout[31:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fad_dp_mux_macro__mux_aonpe__ports_5__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  input [63:0] din3;
  input sel3;
  input [63:0] din4;
  input sel4;
  output [63:0] dout;





cl_dp1_muxbuff5_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4)
);
mux5s #(64)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
.dout(dout[63:0])
);









  



endmodule


//
//   buff macro
//
//





module fgu_fad_dp_buff_macro__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fad_dp_mux_macro__mux_aonpe__ports_4__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  input [63:0] din3;
  input sel3;
  output [63:0] dout;





cl_dp1_muxbuff4_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(64)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
.dout(dout[63:0])
);









  



endmodule


//
//   buff macro
//
//





module fgu_fad_dp_buff_macro__rep_1__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fad_dp_mux_macro__mux_aope__ports_3__width_12 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [11:0] din0;
  input [11:0] din1;
  input [11:0] din2;
  input sel0;
  input sel1;
  output [11:0] dout;





cl_dp1_penc3_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(12)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[11:0]),
  .in1(din1[11:0]),
  .in2(din2[11:0]),
.dout(dout[11:0])
);









  



endmodule


//
//   invert macro
//
//





module fgu_fad_dp_inv_macro__width_5 (
  din, 
  dout);
  input [4:0] din;
  output [4:0] dout;






inv #(5)  d0_0 (
.in(din[4:0]),
.out(dout[4:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fad_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_1 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [0:0] din0;
  input sel0;
  input [0:0] din1;
  input sel1;
  output [0:0] dout;





mux2s #(1)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[0:0]),
  .in1(din1[0:0]),
.dout(dout[0:0])
);









  



endmodule


//  
//   or macro for ports = 2,3
//
//





module fgu_fad_dp_or_macro__ports_2__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






or2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module fgu_fad_dp_and_macro__ports_3__width_2 (
  din0, 
  din1, 
  din2, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  input [1:0] din2;
  output [1:0] dout;






and3 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.in2(din2[1:0]),
.out(dout[1:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fad_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_2 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [1:0] din0;
  input sel0;
  input [1:0] din1;
  input sel1;
  output [1:0] dout;





mux2s #(2)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[1:0]),
  .in1(din1[1:0]),
.dout(dout[1:0])
);









  



endmodule


//  
//   and macro for ports = 2,3,4
//
//





module fgu_fad_dp_and_macro__ports_2__width_3 (
  din0, 
  din1, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  output [2:0] dout;






and2 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.out(dout[2:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fad_dp_mux_macro__mux_aonpe__ports_2__width_52 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [51:0] din0;
  input sel0;
  input [51:0] din1;
  input sel1;
  output [51:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(52)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[51:0]),
  .in1(din1[51:0]),
.dout(dout[51:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fad_dp_mux_macro__mux_aope__ports_4__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel0, 
  sel1, 
  sel2, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  input sel0;
  input sel1;
  input sel2;
  output [63:0] dout;





cl_dp1_penc4_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
.dout(dout[63:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module fgu_fad_dp_msff_macro__width_64 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fad_dp_msff_macro__stack_32l__width_26 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [24:0] so;

  input [25:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [25:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(26)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[25:0]),
.si({scan_in,so[24:0]}),
.so({so[24:0],scan_out}),
.q(dout[25:0])
);




















endmodule









//
//   invert macro
//
//





module fgu_fad_dp_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fad_dp_mux_macro__buffsel_none__mux_aonpe__ports_3__width_2 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
  input [1:0] din0;
  input sel0;
  input [1:0] din1;
  input sel1;
  input [1:0] din2;
  input sel2;
  output [1:0] dout;





mux3s #(2)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .sel2(sel2),
  .in0(din0[1:0]),
  .in1(din1[1:0]),
  .in2(din2[1:0]),
.dout(dout[1:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fad_dp_mux_macro__mux_pgpe__ports_2__width_64 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [63:0] din0;
  input [63:0] din1;
  input sel0;
  output [63:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(64)  d0_0 (
  .sel(psel1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(dout[63:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fad_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_8 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [7:0] din0;
  input sel0;
  input [7:0] din1;
  input sel1;
  output [7:0] dout;





mux2s #(8)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[7:0]),
  .in1(din1[7:0]),
.dout(dout[7:0])
);









  



endmodule


//
//   buff macro
//
//





module fgu_fad_dp_buff_macro__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






buff #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);








endmodule









// any PARAMS parms go into naming of macro

module fgu_fad_dp_msff_macro__minbuff_1__width_64 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule








