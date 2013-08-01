// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fgu_fgd_dp.v
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
module fgu_fgd_dp (
  fad_rs1_fmt_fx1, 
  fad_rs2_fmt_fx1, 
  fgd_rngl_cdbus_3f, 
  fgd_result_fx5, 
  vis_clken, 
  coreon_clken, 
  fac_fgx_abs_fx2, 
  fac_fgx_neg_fx2, 
  fac_fgx_logical_fx2, 
  fac_fgx_expand_fx2, 
  fac_fgx_merge_fx2, 
  fac_fgx_align_fx2, 
  fac_fgx_shuffle_fx2, 
  fac_fgx_pack16_fx2, 
  fac_fgx_pack32_fx2, 
  fac_fgx_packfix_fx2, 
  fac_fgx_pdist_fx1, 
  fac_fgx_popc_fx2, 
  fac_fgx_pack_sel_fx2, 
  fac_opf_fx2, 
  fac_gsr_asr_tid_fx2, 
  fac_tid_fx2, 
  fac_rng_fprs, 
  fac_rng_rd_fprs_4f, 
  fac_rng_rd_gsr_4f, 
  fec_r1_ecc_fx1, 
  fac_rng_rd_ecc_4f, 
  fac_rng_rd_or_wr_3f, 
  asi_clken, 
  fgd_gsr_asr_mask_fx4_b31, 
  fpc_gsr0_mask_sel_fx3, 
  fpc_gsr1_mask_sel_fx3, 
  fpc_gsr2_mask_sel_fx3, 
  fpc_gsr3_mask_sel_fx3, 
  fpc_gsr4_mask_sel_fx3, 
  fpc_gsr5_mask_sel_fx3, 
  fpc_gsr6_mask_sel_fx3, 
  fpc_gsr7_mask_sel_fx3, 
  fpc_gsr_scale_fx4, 
  fpc_gsr_align_fx4, 
  fpc_gsr_asr_11bits_fx4, 
  exu_fgu_gsr_m, 
  l2clk, 
  scan_in, 
  spc_aclk_wmr, 
  wmr_scan_in, 
  lb_scan_en_wmr, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_dectest, 
  tcu_muxtest, 
  tcu_scan_en, 
  scan_out, 
  wmr_scan_out, 
  in_rngl_cdbus);
wire stop;
wire test;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire fx2_rs1_scanin;
wire fx2_rs1_scanout;
wire [63:0] rs1_fx2;
wire fx2_rs2_scanin;
wire fx2_rs2_scanout;
wire [63:0] rs2_fx2;
wire fx2_gsr_scanin;
wire fx2_gsr_scanout;
wire [31:0] gsr_fx2;
wire fgx_pdist_fx3;
wire fgx_popc_fx3;
wire [11:0] pdist_rs3_fx2;
wire popc_byte7a_cout_fx2;
wire popc_byte7a_carry_fx2;
wire popc_byte7a_sum_fx2;
wire popc_byte7b_cout_fx2;
wire popc_byte7b_carry_fx2;
wire popc_byte7b_sum_fx2;
wire popc_byte7c_cout_fx2;
wire popc_byte7c_carry_fx2;
wire popc_byte7c_sum_fx2;
wire [3:0] popc_byte7_sum_fx2;
wire popc_b7_unused;
wire popc_byte6a_cout_fx2;
wire popc_byte6a_carry_fx2;
wire popc_byte6a_sum_fx2;
wire popc_byte6b_cout_fx2;
wire popc_byte6b_carry_fx2;
wire popc_byte6b_sum_fx2;
wire popc_byte6c_cout_fx2;
wire popc_byte6c_carry_fx2;
wire popc_byte6c_sum_fx2;
wire [3:0] popc_byte6_sum_fx2;
wire popc_b6_unused;
wire popc_byte5a_cout_fx2;
wire popc_byte5a_carry_fx2;
wire popc_byte5a_sum_fx2;
wire popc_byte5b_cout_fx2;
wire popc_byte5b_carry_fx2;
wire popc_byte5b_sum_fx2;
wire popc_byte5c_cout_fx2;
wire popc_byte5c_carry_fx2;
wire popc_byte5c_sum_fx2;
wire [3:0] popc_byte5_sum_fx2;
wire popc_b5_unused;
wire popc_byte4a_cout_fx2;
wire popc_byte4a_carry_fx2;
wire popc_byte4a_sum_fx2;
wire popc_byte4b_cout_fx2;
wire popc_byte4b_carry_fx2;
wire popc_byte4b_sum_fx2;
wire popc_byte4c_cout_fx2;
wire popc_byte4c_carry_fx2;
wire popc_byte4c_sum_fx2;
wire [3:0] popc_byte4_sum_fx2;
wire popc_b4_unused;
wire popc_byte3a_cout_fx2;
wire popc_byte3a_carry_fx2;
wire popc_byte3a_sum_fx2;
wire popc_byte3b_cout_fx2;
wire popc_byte3b_carry_fx2;
wire popc_byte3b_sum_fx2;
wire popc_byte3c_cout_fx2;
wire popc_byte3c_carry_fx2;
wire popc_byte3c_sum_fx2;
wire [3:0] popc_byte3_sum_fx2;
wire popc_b3_unused;
wire popc_byte2a_cout_fx2;
wire popc_byte2a_carry_fx2;
wire popc_byte2a_sum_fx2;
wire popc_byte2b_cout_fx2;
wire popc_byte2b_carry_fx2;
wire popc_byte2b_sum_fx2;
wire popc_byte2c_cout_fx2;
wire popc_byte2c_carry_fx2;
wire popc_byte2c_sum_fx2;
wire [3:0] popc_byte2_sum_fx2;
wire popc_b2_unused;
wire popc_byte1a_cout_fx2;
wire popc_byte1a_carry_fx2;
wire popc_byte1a_sum_fx2;
wire popc_byte1b_cout_fx2;
wire popc_byte1b_carry_fx2;
wire popc_byte1b_sum_fx2;
wire popc_byte1c_cout_fx2;
wire popc_byte1c_carry_fx2;
wire popc_byte1c_sum_fx2;
wire [3:0] popc_byte1_sum_fx2;
wire popc_b1_unused;
wire popc_byte0a_cout_fx2;
wire popc_byte0a_carry_fx2;
wire popc_byte0a_sum_fx2;
wire popc_byte0b_cout_fx2;
wire popc_byte0b_carry_fx2;
wire popc_byte0b_sum_fx2;
wire popc_byte0c_cout_fx2;
wire popc_byte0c_carry_fx2;
wire popc_byte0c_sum_fx2;
wire [3:0] popc_byte0_sum_fx2;
wire popc_b0_unused;
wire fx3_rs1_scanin;
wire fx3_rs1_scanout;
wire [63:0] rs1_fx3;
wire [63:0] rs10_fx3;
wire fx3_rs2_scanin;
wire fx3_rs2_scanout;
wire [63:0] rs2_fx3;
wire [63:0] rs20_fx3;
wire fx3_gsr_mask_scanin;
wire fx3_gsr_mask_scanout;
wire [31:0] gsr_mask_fx3;
wire fx3_popc_scanin;
wire fx3_popc_scanout;
wire [3:0] popc_byte0_sum_fx3;
wire [3:0] popc_byte1_sum_fx3;
wire [3:0] popc_byte2_sum_fx3;
wire [3:0] popc_byte3_sum_fx3;
wire [3:0] popc_byte4_sum_fx3;
wire [3:0] popc_byte5_sum_fx3;
wire [3:0] popc_byte6_sum_fx3;
wire [3:0] popc_byte7_sum_fx3;
wire fx3_ctl_scanin;
wire fx3_ctl_scanout;
wire fgx_pdist_fx2;
wire fgx_pack_sel_fx3;
wire fgx_abs_fx3;
wire fgx_neg_fx3;
wire fgx_logical_fx3;
wire fgx_expand_fx3;
wire fgx_merge_fx3;
wire fgx_align_fx3;
wire fgx_shuffle_fx3;
wire fgx_pack16_fx3;
wire fgx_pack32_fx3;
wire fgx_packfix_fx3;
wire [4:1] opf_fx3;
wire fgx_pdist_fx4;
wire fgx_popc_fx4;
wire fgx_pack_sel_fx4;
wire [11:0] pdist_rs3_fx3;
wire [63:0] rs101_fx3;
wire [63:0] rs201_fx3;
wire [63:0] rs201_fx3_;
wire [63:0] rs101_fx3_;
wire [4:1] opf1_fx3;
wire [4:1] opf0_fx3;
wire [63:0] logical_int0_fx3;
wire [63:0] logical_int1_fx3;
wire [63:0] logical_int2_fx3;
wire [63:0] logical_int3_fx3;
wire [63:0] logical_result_fx3;
wire [31:0] gsr_mask0_fx4;
wire [63:0] rs1_shuf_fx3;
wire [63:0] rs2_shuf_fx3;
wire [63:0] shuf_result_fx3;
wire [63:0] align_result_fx3;
wire rs2_sign63_neg_fx3;
wire rs2_sign63_res_fx3;
wire fx4_simp_scanin;
wire fx4_simp_scanout;
wire [63:0] simp_result_fx4;
wire fgx_pack16_fx3_;
wire sh16_sel_fx3;
wire [63:0] shift16_fx3;
wire [23:0] gate16_fx3;
wire [63:0] shift04_fx3;
wire [5:0] gate04_fx3;
wire [63:7] shift01_fx3;
wire [6:0] pack_01_d2_unused;
wire [6:0] pack_01_d0_unused;
wire pack_sign63_fx3;
wire [15:0] clip16_c3_fx3;
wire [27:0] clip04_c3_fx3;
wire [30:0] clip01_c3_fx3;
wire [11:0] clip04_c2_fx3;
wire [14:0] clip01_c2_fx3;
wire pack_sign31_fx3;
wire [15:0] clip16_c1_fx3;
wire [27:0] clip04_c1_fx3;
wire [30:0] clip01_c1_fx3;
wire [11:0] clip04_c0_fx3;
wire [14:0] clip01_c0_fx3;
wire [63:0] pdist_amb_fx3;
wire pdist_amb_cout0_fx3;
wire pdist_amb_cout1_fx3;
wire pdist_amb_cout2_fx3;
wire pdist_amb_cout3_fx3;
wire pdist_amb_cout4_fx3;
wire pdist_amb_cout5_fx3;
wire pdist_amb_cout6_fx3;
wire pdist_amb_cout7_fx3;
wire [63:0] pdist_bma_fx3;
wire pdist_bma0_unused;
wire pdist_bma1_unused;
wire pdist_bma2_unused;
wire pdist_bma3_unused;
wire pdist_bma4_unused;
wire pdist_bma5_unused;
wire pdist_bma6_unused;
wire pdist_bma7_unused;
wire [63:0] pdist_mux_fx3;
wire pdist_42csa_cout0_fx3;
wire [8:1] pdist_42csa_carry0_fx3;
wire [7:0] pdist_42csa_sum0_fx3;
wire pdist_42csa_cout1_fx3;
wire [8:1] pdist_42csa_carry1_fx3;
wire [7:0] pdist_42csa_sum1_fx3;
wire fx4_rs1_scanin;
wire fx4_rs1_scanout;
wire [55:0] rs1_fx4;
wire fx4_shift_scanin;
wire fx4_shift_scanout;
wire [63:7] shift01_fx4;
wire fx4_clipa_scanin;
wire fx4_clipa_scanout;
wire [30:0] clip01_c3_fx4;
wire [30:0] clip01_c1_fx4;
wire fx4_clipb_scanin;
wire fx4_clipb_scanout;
wire rs2_fx4_b63;
wire rs2_fx4_b47;
wire [14:0] clip01_c2_fx4;
wire [14:0] clip01_c0_fx4;
wire rs2_fx4_b31;
wire rs2_fx4_b15;
wire fgx_packfix_fx4;
wire fgx_pack32_fx4;
wire fgx_pack16_fx4;
wire fx4_pdist_scanin;
wire fx4_pdist_scanout;
wire [33:0] pdist_42csa_data_fx4;
wire fx4_gsrtid_scanin;
wire fx4_gsrtid_scanout;
wire [2:0] gsr_asr_tid_fx3;
wire [2:0] tid_fx3;
wire fx4_gsr0mask_wmr_scanin;
wire fx4_gsr0mask_wmr_scanout;
wire [63:0] in_rngl_cdbus_3f;
wire [31:0] gsr0_mask_fx4;
wire fx4_gsr1mask_wmr_scanin;
wire fx4_gsr1mask_wmr_scanout;
wire [31:0] gsr1_mask_fx4;
wire fx4_gsr2mask_wmr_scanin;
wire fx4_gsr2mask_wmr_scanout;
wire [31:0] gsr2_mask_fx4;
wire fx4_gsr3mask_wmr_scanin;
wire fx4_gsr3mask_wmr_scanout;
wire [31:0] gsr3_mask_fx4;
wire fx4_gsr4mask_wmr_scanin;
wire fx4_gsr4mask_wmr_scanout;
wire [31:0] gsr4_mask_fx4;
wire fx4_gsr5mask_wmr_scanin;
wire fx4_gsr5mask_wmr_scanout;
wire [31:0] gsr5_mask_fx4;
wire fx4_gsr6mask_wmr_scanin;
wire fx4_gsr6mask_wmr_scanout;
wire [31:0] gsr6_mask_fx4;
wire fx4_gsr7mask_wmr_scanin;
wire fx4_gsr7mask_wmr_scanout;
wire [31:0] gsr7_mask_fx4;
wire [31:0] gsr_mask_fx4;
wire tcu_muxtest_a_rep0;
wire [30:0] gsr_asr_mask_fx4;
wire pack_b01_gt255_fx4_;
wire pack_b01_lt32768_fx4_;
wire pack_b23_gt255_fx4_;
wire pack_b45_gt255_fx4_;
wire pack_b45_lt32768_fx4_;
wire pack_b67_gt255_fx4_;
wire pack_b01_gt255_fx4;
wire pack_b01_lt32768_fx4;
wire pack_b23_gt255_fx4;
wire pack_b45_gt255_fx4;
wire pack_b45_lt32768_fx4;
wire pack_b67_gt255_fx4;
wire rs2_fx4_b63_;
wire rs2_fx4_b31_;
wire packfix_hi_lt32768_fx4;
wire packfix_lo_lt32768_fx4;
wire packfix_hi_gt32767_fx4;
wire packfix_lo_gt32767_fx4;
wire pack_b3_sign_fx4;
wire pack_b3_gt255_fx4;
wire [63:32] pack_result_fx4;
wire [7:0] pack_result_fx4_b7_0;
wire pdist_42csa_cout2_fx4;
wire [9:1] pdist_42csa_carry2_fx4;
wire [8:0] pdist_42csa_sum2_fx4;
wire [10:1] pdist_32csa_carry_fx4;
wire [9:0] pdist_32csa_sum_fx4;
wire q_pdist_rs3_fx3_b11;
wire [63:0] pdist_sum_fx4;
wire pdist_cout_fx4;
wire [12:0] pdist_inc_unused;
wire fx5_res_scanin;
wire fx5_res_scanout;
wire in_rng1_1f_scanin;
wire in_rng1_1f_scanout;
wire [63:0] in_rngl_cdbus_1f;
wire in_rng0_1f_scanin;
wire in_rng0_1f_scanout;
wire in_rng1_2f_scanin;
wire in_rng1_2f_scanout;
wire [63:0] in_rngl_cdbus_2f;
wire in_rng0_2f_scanin;
wire in_rng0_2f_scanout;
wire in_rng1_3f_scanin;
wire in_rng1_3f_scanout;
wire in_rng0_3f_scanin;
wire in_rng0_3f_scanout;
wire tcu_muxtest_b_rep0;
wire tcu_muxtest_c_rep0;



// ----------------------------------------------------------------------------
// Interface with FAD
// ----------------------------------------------------------------------------

input   [63:0] fad_rs1_fmt_fx1;        // rs1 formatted
input   [63:0] fad_rs2_fmt_fx1;        // rs2 formatted

output  [62:0] fgd_rngl_cdbus_3f;

// ----------------------------------------------------------------------------
// Interface with FPF
// ----------------------------------------------------------------------------

output  [63:0] fgd_result_fx5;         // FGX result

// ----------------------------------------------------------------------------
// Interface with FAC
// ----------------------------------------------------------------------------

input          vis_clken;              // vis clken
input          coreon_clken;           // controls all "free running" flops

input          fac_fgx_abs_fx2;        // FABS
input          fac_fgx_neg_fx2;        // FNEG
input          fac_fgx_logical_fx2;    // logical instructions
input          fac_fgx_expand_fx2;     // FEXPAND
input          fac_fgx_merge_fx2;      // FPMERGE
input          fac_fgx_align_fx2;      // FALIGNDATA
input          fac_fgx_shuffle_fx2;    // BSHUFFLE
input          fac_fgx_pack16_fx2;     // FPACK16
input          fac_fgx_pack32_fx2;     // FPACK32
input          fac_fgx_packfix_fx2;    // FPACKFIX
input          fac_fgx_pdist_fx1;      // PDIST
input          fac_fgx_popc_fx2;       // POPC

input          fac_fgx_pack_sel_fx2;   // FPACK16,FPACK32,FPACKFIX

input    [4:1] fac_opf_fx2;            // instr opf field
input    [2:0] fac_gsr_asr_tid_fx2;
input    [2:0] fac_tid_fx2;

input    [2:0] fac_rng_fprs;           // ASR FPRS read data
input          fac_rng_rd_fprs_4f;     // ASR FPRS read
input          fac_rng_rd_gsr_4f;      // ASR GSR  read
input   [13:0] fec_r1_ecc_fx1;         // ASI FRF ECC read data
input          fac_rng_rd_ecc_4f;      // ASI FRF ECC read
input          fac_rng_rd_or_wr_3f;    // ASR/ASI GSR/FPRS/FRF_ECC rd or wr decoded

input          asi_clken;              // asi clken: controls ASI ring stage flops

output         fgd_gsr_asr_mask_fx4_b31;

// ----------------------------------------------------------------------------
// Interface with FPC
// ----------------------------------------------------------------------------

input    [1:0] fpc_gsr0_mask_sel_fx3;
input    [1:0] fpc_gsr1_mask_sel_fx3;
input    [1:0] fpc_gsr2_mask_sel_fx3;
input    [1:0] fpc_gsr3_mask_sel_fx3;
input    [1:0] fpc_gsr4_mask_sel_fx3;
input    [1:0] fpc_gsr5_mask_sel_fx3;
input    [1:0] fpc_gsr6_mask_sel_fx3;
input    [1:0] fpc_gsr7_mask_sel_fx3;
input    [4:0] fpc_gsr_scale_fx4;
input    [2:0] fpc_gsr_align_fx4;
input   [10:0] fpc_gsr_asr_11bits_fx4;

// ----------------------------------------------------------------------------
// Interface with EXU
// ----------------------------------------------------------------------------

input   [31:0] exu_fgu_gsr_m;          // GSR.align data:
                                       //   [31:3] = don't care
                                       //   [2:0]  = GSR.align
                                       //   GSR.mask data:
                                       //   [31:0] = GSR.mask

// ----------------------------------------------------------------------------
// Global Signals
// ----------------------------------------------------------------------------

input          l2clk;                  // clock input
input  	       scan_in;
input          spc_aclk_wmr;
input          wmr_scan_in;
input          lb_scan_en_wmr;
input  	       tcu_pce_ov;		// scan signals
input  	       spc_aclk;
input  	       spc_bclk;
input 	       tcu_dectest;
input          tcu_muxtest;
input          tcu_scan_en;
output 	       scan_out;
output         wmr_scan_out;
input   [63:0] in_rngl_cdbus;          // ASI local ring


// scan renames
assign stop   = 1'b0;
assign test   = tcu_dectest;
// end scan

fgu_fgd_dp_buff_macro__dbuff_32x__rep_1__width_4 test_rep0  (
  .din ({tcu_scan_en, tcu_pce_ov, spc_aclk, spc_bclk}),
  .dout({se,          pce_ov,     siclk,    soclk   })
  );


// ----------------------------------------------------------------------------
//                               FX2 stage
// ----------------------------------------------------------------------------

fgu_fgd_dp_msff_macro__width_64 fx2_rs1  (
  .scan_in(fx2_rs1_scanin),
  .scan_out(fx2_rs1_scanout),
  .clk (l2clk),
  .en  (vis_clken),
  .din (fad_rs1_fmt_fx1[63:0]),
  .dout(    rs1_fx2[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__width_64 fx2_rs2  (
  .scan_in(fx2_rs2_scanin),
  .scan_out(fx2_rs2_scanout),
  .clk (l2clk),
  .en  (vis_clken),
  .din (fad_rs2_fmt_fx1[63:0]),
  .dout(    rs2_fx2[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__stack_32l__width_32 fx2_gsr  (
  .scan_in(fx2_gsr_scanin),
  .scan_out(fx2_gsr_scanout),
  .clk (l2clk),
  .en  (vis_clken),
  .din (exu_fgu_gsr_m[31:0]  ),
  .dout(        gsr_fx2[31:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 pdist_rs3  ( 
  .din0(rs2_fx2[11:0]),
  .din1(12'b0),
  .sel0(fgx_pdist_fx3),  // since rs3 data skips a stage, selects skip a stage
  .sel1(fgx_popc_fx3),
  .dout(pdist_rs3_fx2[11:0])
  );

// ------------------------------------
// uniquie POPC frontend (fx2)
// ------------------------------------

//------
// byte7
//------

fgu_fgd_dp_csa42_macro__width_1 popc_b7a  (
  .i0   (rs2_fx2[0]),
  .i1   (rs2_fx2[1]),
  .i2   (rs2_fx2[2]),
  .i3   (rs2_fx2[3]),
  .cin  (1'b0       ),
  .cout (popc_byte7a_cout_fx2 ), 
  .carry(popc_byte7a_carry_fx2),
  .sum  (popc_byte7a_sum_fx2  )  
  );

fgu_fgd_dp_csa42_macro__width_1 popc_b7b  (
  .i0   (rs2_fx2[4]),
  .i1   (rs2_fx2[5]),
  .i2   (rs2_fx2[6]),
  .i3   (rs2_fx2[7]),
  .cin  (1'b0       ),
  .cout (popc_byte7b_cout_fx2 ), 
  .carry(popc_byte7b_carry_fx2),
  .sum  (popc_byte7b_sum_fx2  )  
  );

fgu_fgd_dp_csa42_macro__width_1 popc_b7c  (
  .i0   (popc_byte7a_cout_fx2 ),
  .i1   (popc_byte7a_carry_fx2),
  .i2   (popc_byte7b_cout_fx2 ),
  .i3   (popc_byte7b_carry_fx2),
  .cin  (1'b0                 ),
  .cout (popc_byte7c_cout_fx2 ), 
  .carry(popc_byte7c_carry_fx2),
  .sum  (popc_byte7c_sum_fx2  )  
  );

fgu_fgd_dp_cla_macro__width_4 popc_b7  (  // 0in maximum -val 8 -var {popc_b7_unused, popc_byte7_sum_fx2[3:0]}
  .din0({1'b0, popc_byte7c_carry_fx2, popc_byte7c_sum_fx2, popc_byte7a_sum_fx2}),
  .din1({1'b0, popc_byte7c_cout_fx2 , 1'b0               , popc_byte7b_sum_fx2}),
  .cin (1'b0),
  .dout(popc_byte7_sum_fx2[3:0]),
  .cout(popc_b7_unused         )
  );

//------
// byte6
//------

fgu_fgd_dp_csa42_macro__width_1 popc_b6a  (
  .i0   (rs2_fx2[8]),
  .i1   (rs2_fx2[9]),
  .i2   (rs2_fx2[10]),
  .i3   (rs2_fx2[11]),
  .cin  (1'b0       ),
  .cout (popc_byte6a_cout_fx2 ), 
  .carry(popc_byte6a_carry_fx2),
  .sum  (popc_byte6a_sum_fx2  )  
  );

fgu_fgd_dp_csa42_macro__width_1 popc_b6b  (
  .i0   (rs2_fx2[12]),
  .i1   (rs2_fx2[13]),
  .i2   (rs2_fx2[14]),
  .i3   (rs2_fx2[15]),
  .cin  (1'b0       ),
  .cout (popc_byte6b_cout_fx2 ), 
  .carry(popc_byte6b_carry_fx2),
  .sum  (popc_byte6b_sum_fx2  )  
  );

fgu_fgd_dp_csa42_macro__width_1 popc_b6c  (
  .i0   (popc_byte6a_cout_fx2 ),
  .i1   (popc_byte6a_carry_fx2),
  .i2   (popc_byte6b_cout_fx2 ),
  .i3   (popc_byte6b_carry_fx2),
  .cin  (1'b0                 ),
  .cout (popc_byte6c_cout_fx2 ), 
  .carry(popc_byte6c_carry_fx2),
  .sum  (popc_byte6c_sum_fx2  )  
  );

fgu_fgd_dp_cla_macro__width_4 popc_b6  (  // 0in maximum -val 8 -var {popc_b6_unused, popc_byte6_sum_fx2[3:0]}
  .din0({1'b0, popc_byte6c_carry_fx2, popc_byte6c_sum_fx2, popc_byte6a_sum_fx2}),
  .din1({1'b0, popc_byte6c_cout_fx2 , 1'b0               , popc_byte6b_sum_fx2}),
  .cin (1'b0),
  .dout(popc_byte6_sum_fx2[3:0]),
  .cout(popc_b6_unused         )
  );

//------
// byte5
//------

fgu_fgd_dp_csa42_macro__width_1 popc_b5a  (
  .i0   (rs2_fx2[16]),
  .i1   (rs2_fx2[17]),
  .i2   (rs2_fx2[18]),
  .i3   (rs2_fx2[19]),
  .cin  (1'b0       ),
  .cout (popc_byte5a_cout_fx2 ), 
  .carry(popc_byte5a_carry_fx2),
  .sum  (popc_byte5a_sum_fx2  )  
  );

fgu_fgd_dp_csa42_macro__width_1 popc_b5b  (
  .i0   (rs2_fx2[20]),
  .i1   (rs2_fx2[21]),
  .i2   (rs2_fx2[22]),
  .i3   (rs2_fx2[23]),
  .cin  (1'b0       ),
  .cout (popc_byte5b_cout_fx2 ), 
  .carry(popc_byte5b_carry_fx2),
  .sum  (popc_byte5b_sum_fx2  )  
  );

fgu_fgd_dp_csa42_macro__width_1 popc_b5c  (
  .i0   (popc_byte5a_cout_fx2 ),
  .i1   (popc_byte5a_carry_fx2),
  .i2   (popc_byte5b_cout_fx2 ),
  .i3   (popc_byte5b_carry_fx2),
  .cin  (1'b0                 ),
  .cout (popc_byte5c_cout_fx2 ), 
  .carry(popc_byte5c_carry_fx2),
  .sum  (popc_byte5c_sum_fx2  )  
  );

fgu_fgd_dp_cla_macro__width_4 popc_b5  (  // 0in maximum -val 8 -var {popc_b5_unused, popc_byte5_sum_fx2[3:0]}
  .din0({1'b0, popc_byte5c_carry_fx2, popc_byte5c_sum_fx2, popc_byte5a_sum_fx2}),
  .din1({1'b0, popc_byte5c_cout_fx2 , 1'b0               , popc_byte5b_sum_fx2}),
  .cin (1'b0),
  .dout(popc_byte5_sum_fx2[3:0]),
  .cout(popc_b5_unused         )
  );

//------
// byte4
//------

fgu_fgd_dp_csa42_macro__width_1 popc_b4a  (
  .i0   (rs2_fx2[24]),
  .i1   (rs2_fx2[25]),
  .i2   (rs2_fx2[26]),
  .i3   (rs2_fx2[27]),
  .cin  (1'b0       ),
  .cout (popc_byte4a_cout_fx2 ), 
  .carry(popc_byte4a_carry_fx2),
  .sum  (popc_byte4a_sum_fx2  )  
  );

fgu_fgd_dp_csa42_macro__width_1 popc_b4b  (
  .i0   (rs2_fx2[28]),
  .i1   (rs2_fx2[29]),
  .i2   (rs2_fx2[30]),
  .i3   (rs2_fx2[31]),
  .cin  (1'b0       ),
  .cout (popc_byte4b_cout_fx2 ), 
  .carry(popc_byte4b_carry_fx2),
  .sum  (popc_byte4b_sum_fx2  )  
  );

fgu_fgd_dp_csa42_macro__width_1 popc_b4c  (
  .i0   (popc_byte4a_cout_fx2 ),
  .i1   (popc_byte4a_carry_fx2),
  .i2   (popc_byte4b_cout_fx2 ),
  .i3   (popc_byte4b_carry_fx2),
  .cin  (1'b0                 ),
  .cout (popc_byte4c_cout_fx2 ), 
  .carry(popc_byte4c_carry_fx2),
  .sum  (popc_byte4c_sum_fx2  )  
  );

fgu_fgd_dp_cla_macro__width_4 popc_b4  (  // 0in maximum -val 8 -var {popc_b4_unused, popc_byte4_sum_fx2[3:0]}
  .din0({1'b0, popc_byte4c_carry_fx2, popc_byte4c_sum_fx2, popc_byte4a_sum_fx2}),
  .din1({1'b0, popc_byte4c_cout_fx2 , 1'b0               , popc_byte4b_sum_fx2}),
  .cin (1'b0),
  .dout(popc_byte4_sum_fx2[3:0]),
  .cout(popc_b4_unused         )
  );

//------
// byte3
//------

fgu_fgd_dp_csa42_macro__width_1 popc_b3a  (
  .i0   (rs2_fx2[32]),
  .i1   (rs2_fx2[33]),
  .i2   (rs2_fx2[34]),
  .i3   (rs2_fx2[35]),
  .cin  (1'b0       ),
  .cout (popc_byte3a_cout_fx2 ), 
  .carry(popc_byte3a_carry_fx2),
  .sum  (popc_byte3a_sum_fx2  )  
  );

fgu_fgd_dp_csa42_macro__width_1 popc_b3b  (
  .i0   (rs2_fx2[36]),
  .i1   (rs2_fx2[37]),
  .i2   (rs2_fx2[38]),
  .i3   (rs2_fx2[39]),
  .cin  (1'b0       ),
  .cout (popc_byte3b_cout_fx2 ), 
  .carry(popc_byte3b_carry_fx2),
  .sum  (popc_byte3b_sum_fx2  )  
  );

fgu_fgd_dp_csa42_macro__width_1 popc_b3c  (
  .i0   (popc_byte3a_cout_fx2 ),
  .i1   (popc_byte3a_carry_fx2),
  .i2   (popc_byte3b_cout_fx2 ),
  .i3   (popc_byte3b_carry_fx2),
  .cin  (1'b0                 ),
  .cout (popc_byte3c_cout_fx2 ), 
  .carry(popc_byte3c_carry_fx2),
  .sum  (popc_byte3c_sum_fx2  )  
  );

fgu_fgd_dp_cla_macro__width_4 popc_b3  (  // 0in maximum -val 8 -var {popc_b3_unused, popc_byte3_sum_fx2[3:0]}
  .din0({1'b0, popc_byte3c_carry_fx2, popc_byte3c_sum_fx2, popc_byte3a_sum_fx2}),
  .din1({1'b0, popc_byte3c_cout_fx2 , 1'b0               , popc_byte3b_sum_fx2}),
  .cin (1'b0),
  .dout(popc_byte3_sum_fx2[3:0]),
  .cout(popc_b3_unused         )
  );

//------
// byte2
//------

fgu_fgd_dp_csa42_macro__width_1 popc_b2a  (
  .i0   (rs2_fx2[40]),
  .i1   (rs2_fx2[41]),
  .i2   (rs2_fx2[42]),
  .i3   (rs2_fx2[43]),
  .cin  (1'b0       ),
  .cout (popc_byte2a_cout_fx2 ), 
  .carry(popc_byte2a_carry_fx2),
  .sum  (popc_byte2a_sum_fx2  )  
  );

fgu_fgd_dp_csa42_macro__width_1 popc_b2b  (
  .i0   (rs2_fx2[44]),
  .i1   (rs2_fx2[45]),
  .i2   (rs2_fx2[46]),
  .i3   (rs2_fx2[47]),
  .cin  (1'b0       ),
  .cout (popc_byte2b_cout_fx2 ), 
  .carry(popc_byte2b_carry_fx2),
  .sum  (popc_byte2b_sum_fx2  )  
  );

fgu_fgd_dp_csa42_macro__width_1 popc_b2c  (
  .i0   (popc_byte2a_cout_fx2 ),
  .i1   (popc_byte2a_carry_fx2),
  .i2   (popc_byte2b_cout_fx2 ),
  .i3   (popc_byte2b_carry_fx2),
  .cin  (1'b0                 ),
  .cout (popc_byte2c_cout_fx2 ), 
  .carry(popc_byte2c_carry_fx2),
  .sum  (popc_byte2c_sum_fx2  )  
  );

fgu_fgd_dp_cla_macro__width_4 popc_b2  (  // 0in maximum -val 8 -var {popc_b2_unused, popc_byte2_sum_fx2[3:0]}
  .din0({1'b0, popc_byte2c_carry_fx2, popc_byte2c_sum_fx2, popc_byte2a_sum_fx2}),
  .din1({1'b0, popc_byte2c_cout_fx2 , 1'b0               , popc_byte2b_sum_fx2}),
  .cin (1'b0),
  .dout(popc_byte2_sum_fx2[3:0]),
  .cout(popc_b2_unused         )
  );

//------
// byte1
//------

fgu_fgd_dp_csa42_macro__width_1 popc_b1a  (
  .i0   (rs2_fx2[48]),
  .i1   (rs2_fx2[49]),
  .i2   (rs2_fx2[50]),
  .i3   (rs2_fx2[51]),
  .cin  (1'b0       ),
  .cout (popc_byte1a_cout_fx2 ), 
  .carry(popc_byte1a_carry_fx2),
  .sum  (popc_byte1a_sum_fx2  )  
  );

fgu_fgd_dp_csa42_macro__width_1 popc_b1b  (
  .i0   (rs2_fx2[52]),
  .i1   (rs2_fx2[53]),
  .i2   (rs2_fx2[54]),
  .i3   (rs2_fx2[55]),
  .cin  (1'b0       ),
  .cout (popc_byte1b_cout_fx2 ), 
  .carry(popc_byte1b_carry_fx2),
  .sum  (popc_byte1b_sum_fx2  )  
  );

fgu_fgd_dp_csa42_macro__width_1 popc_b1c  (
  .i0   (popc_byte1a_cout_fx2 ),
  .i1   (popc_byte1a_carry_fx2),
  .i2   (popc_byte1b_cout_fx2 ),
  .i3   (popc_byte1b_carry_fx2),
  .cin  (1'b0                 ),
  .cout (popc_byte1c_cout_fx2 ), 
  .carry(popc_byte1c_carry_fx2),
  .sum  (popc_byte1c_sum_fx2  )  
  );

fgu_fgd_dp_cla_macro__width_4 popc_b1  (  // 0in maximum -val 8 -var {popc_b1_unused, popc_byte1_sum_fx2[3:0]}
  .din0({1'b0, popc_byte1c_carry_fx2, popc_byte1c_sum_fx2, popc_byte1a_sum_fx2}),
  .din1({1'b0, popc_byte1c_cout_fx2 , 1'b0               , popc_byte1b_sum_fx2}),
  .cin (1'b0),
  .dout(popc_byte1_sum_fx2[3:0]),
  .cout(popc_b1_unused         )
  );

//------
// byte0
//------

fgu_fgd_dp_csa42_macro__width_1 popc_b0a  (
  .i0   (rs2_fx2[56]),
  .i1   (rs2_fx2[57]),
  .i2   (rs2_fx2[58]),
  .i3   (rs2_fx2[59]),
  .cin  (1'b0       ),
  .cout (popc_byte0a_cout_fx2 ), 
  .carry(popc_byte0a_carry_fx2),
  .sum  (popc_byte0a_sum_fx2  )  
  );

fgu_fgd_dp_csa42_macro__width_1 popc_b0b  (
  .i0   (rs2_fx2[60]),
  .i1   (rs2_fx2[61]),
  .i2   (rs2_fx2[62]),
  .i3   (rs2_fx2[63]),
  .cin  (1'b0       ),
  .cout (popc_byte0b_cout_fx2 ), 
  .carry(popc_byte0b_carry_fx2),
  .sum  (popc_byte0b_sum_fx2  )  
  );

fgu_fgd_dp_csa42_macro__width_1 popc_b0c  (
  .i0   (popc_byte0a_cout_fx2 ),
  .i1   (popc_byte0a_carry_fx2),
  .i2   (popc_byte0b_cout_fx2 ),
  .i3   (popc_byte0b_carry_fx2),
  .cin  (1'b0                 ),
  .cout (popc_byte0c_cout_fx2 ), 
  .carry(popc_byte0c_carry_fx2),
  .sum  (popc_byte0c_sum_fx2  )  
  );

fgu_fgd_dp_cla_macro__width_4 popc_b0  (  // 0in maximum -val 8 -var {popc_b0_unused, popc_byte0_sum_fx2[3:0]}
  .din0({1'b0, popc_byte0c_carry_fx2, popc_byte0c_sum_fx2, popc_byte0a_sum_fx2}),
  .din1({1'b0, popc_byte0c_cout_fx2 , 1'b0               , popc_byte0b_sum_fx2}),
  .cin (1'b0),
  .dout(popc_byte0_sum_fx2[3:0]),
  .cout(popc_b0_unused         )
  );


// ----------------------------------------------------------------------------
//                               FX3 stage
// ----------------------------------------------------------------------------

fgu_fgd_dp_msff_macro__width_64 fx3_rs1  (
  .scan_in(fx3_rs1_scanin),
  .scan_out(fx3_rs1_scanout),
  .clk (l2clk),
  .en  (vis_clken),
  .din (rs1_fx2[63:0]),
  .dout(rs1_fx3[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_buff_macro__width_64 buf_rs1  (
  .din (rs1_fx3[63:0] ),
  .dout(rs10_fx3[63:0])
  );

fgu_fgd_dp_msff_macro__minbuff_1__width_64 fx3_rs2  (
  .scan_in(fx3_rs2_scanin),
  .scan_out(fx3_rs2_scanout),
  .clk (l2clk),
  .en  (vis_clken),
  .din (rs2_fx2[63:0]),
  .dout(rs2_fx3[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_buff_macro__width_64 buf_rs2  (
  .din (rs2_fx3[63:0] ),
  .dout(rs20_fx3[63:0])
  );

fgu_fgd_dp_msff_macro__stack_32l__width_32 fx3_gsr_mask  (
  .scan_in(fx3_gsr_mask_scanin),
  .scan_out(fx3_gsr_mask_scanout),
  .clk (l2clk),
  .en  (vis_clken),
  .din (gsr_fx2[31:0]),
  .dout(gsr_mask_fx3[31:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__width_32 fx3_popc  (
  .scan_in(fx3_popc_scanin),
  .scan_out(fx3_popc_scanout),
  .clk (l2clk),
  .en  (vis_clken),
  .din ({popc_byte0_sum_fx2[3:0],
         popc_byte1_sum_fx2[3:0],
         popc_byte2_sum_fx2[3:0],
         popc_byte3_sum_fx2[3:0],
         popc_byte4_sum_fx2[3:0],
         popc_byte5_sum_fx2[3:0],
         popc_byte6_sum_fx2[3:0],
         popc_byte7_sum_fx2[3:0]}),
  .dout({popc_byte0_sum_fx3[3:0],
         popc_byte1_sum_fx3[3:0],
         popc_byte2_sum_fx3[3:0],
         popc_byte3_sum_fx3[3:0],
         popc_byte4_sum_fx3[3:0],
         popc_byte5_sum_fx3[3:0],
         popc_byte6_sum_fx3[3:0],
         popc_byte7_sum_fx3[3:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__width_33 fx3_ctl  (
  .scan_in(fx3_ctl_scanin),
  .scan_out(fx3_ctl_scanout),
  .clk (l2clk),
  .en  (vis_clken),
  .din ({fac_fgx_abs_fx2,
         fac_fgx_neg_fx2,
         fac_fgx_logical_fx2,
         fac_fgx_expand_fx2,
         fac_fgx_merge_fx2,
         fac_fgx_align_fx2,
         fac_fgx_shuffle_fx2,
         fac_fgx_pack16_fx2,
         fac_fgx_pack32_fx2,
         fac_fgx_packfix_fx2,
         fac_fgx_pdist_fx1,
             fgx_pdist_fx2,
         fac_fgx_popc_fx2,
         fac_fgx_pack_sel_fx2,
         fac_opf_fx2[4:1],
             fgx_pdist_fx3,
             fgx_popc_fx3,
             fgx_pack_sel_fx3,
             pdist_rs3_fx2[11:0]}),
  .dout({    fgx_abs_fx3,
             fgx_neg_fx3,
             fgx_logical_fx3,
             fgx_expand_fx3,
             fgx_merge_fx3,
             fgx_align_fx3,
             fgx_shuffle_fx3,
             fgx_pack16_fx3,
             fgx_pack32_fx3,
             fgx_packfix_fx3,
             fgx_pdist_fx2,
             fgx_pdist_fx3,
             fgx_popc_fx3,
             fgx_pack_sel_fx3,
             opf_fx3[4:1],
             fgx_pdist_fx4,
             fgx_popc_fx4,
             fgx_pack_sel_fx4,
             pdist_rs3_fx3[11:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );


// ----------------------------------------------------------------------------
// Logical operations:
//
// Instr        opf bit: 4321               rs1   rs2
// --------------------------               sel1  sel0       out
// FZERO,    FZEROS      0000               -------------------------
// FNOR,     FNORS       0001                0     0      in0: opf[1]
// FANDNOT2, FANDNOT2S   0010                0     1      in1: opf[3]
// FNOT2,    FNOT2S      0011                1     0      in2: opf[2]
// FANDNOT1, FANDNOT1S   0100                1     1      in3: opf[4]
// FNOT1,    FNOT1S      0101
// FXOR,     FXORS       0110
// FNAND,    FNANDS      0111
// FAND,     FANDS       1000
// FXNOR,    FXNORS      1001
// FSRC1,    FSRC1S      1010
// FORNOT2,  FORNOT2S    1011
// FSRC2,    FSRC2S      1100
// FORNOT1,  FORNOT1S    1101
// FOR,      FORS        1110
// FONE,     FONES       1111
//
// Logical instr are implemented with a 4:1 mux structure built from a
// nand-nand (and-or) gate organization.
//
// ----------------------------------------------------------------------------

fgu_fgd_dp_buff_macro__width_64 buf_rs101  (
  .din (rs1_fx3[63:0]  ),
  .dout(rs101_fx3[63:0])
  );

fgu_fgd_dp_buff_macro__width_64 buf_rs201  (
  .din (rs2_fx3[63:0]  ),
  .dout(rs201_fx3[63:0])
  );

fgu_fgd_dp_inv_macro__width_64 inv_rs2  (
  .din (rs201_fx3[63:0] ),
  .dout(rs201_fx3_[63:0]) 
  );

fgu_fgd_dp_inv_macro__width_64 inv_rs1  (
  .din (rs101_fx3[63:0] ),
  .dout(rs101_fx3_[63:0]) 
  );

fgu_fgd_dp_buff_macro__width_8 buf_opf  (
  .din ({opf_fx3[4:1], opf_fx3[4:1] }),
  .dout({opf1_fx3[4:1],opf0_fx3[4:1]})
  );

fgu_fgd_dp_nand_macro__ports_3__width_64 log_00  (
  .din0(rs101_fx3_[63:0]),
  .din1(rs201_fx3_[63:0]),
  .din2({{32{opf1_fx3[1]}},{32{opf0_fx3[1]}}}),
  .dout(logical_int0_fx3[63:0]) 
  );

fgu_fgd_dp_nand_macro__ports_3__width_64 log_01  (
  .din0(rs101_fx3_[63:0]),
  .din1(rs201_fx3[63:0] ),
  .din2({{32{opf1_fx3[3]}},{32{opf0_fx3[3]}}}),
  .dout(logical_int1_fx3[63:0]) 
  );

fgu_fgd_dp_nand_macro__ports_3__width_64 log_02  (
  .din0(rs101_fx3[63:0] ),
  .din1(rs201_fx3_[63:0]),
  .din2({{32{opf1_fx3[2]}},{32{opf0_fx3[2]}}}),
  .dout(logical_int2_fx3[63:0]) 
  );

fgu_fgd_dp_nand_macro__ports_3__width_64 log_03  (
  .din0(rs101_fx3[63:0]),
  .din1(rs201_fx3[63:0]),
  .din2({{32{opf1_fx3[4]}},{32{opf0_fx3[4]}}}),
  .dout(logical_int3_fx3[63:0]) 
  );

fgu_fgd_dp_nand_macro__ports_4__width_64 log_04  (
  .din0(logical_int0_fx3[63:0]),
  .din1(logical_int1_fx3[63:0]),
  .din2(logical_int2_fx3[63:0]),
  .din3(logical_int3_fx3[63:0]),
  .dout(logical_result_fx3[63:0]) 
  );

// ------------------------------------
// bshuffle rs1 and rs2 byte muxes
// ------------------------------------

fgu_fgd_dp_mux_macro__mux_aodec__ports_8__width_8 shuf1_b0  (
  .din0(rs10_fx3[63:56]),
  .din1(rs10_fx3[55:48]),
  .din2(rs10_fx3[47:40]),
  .din3(rs10_fx3[39:32]),
  .din4(rs10_fx3[31:24]),
  .din5(rs10_fx3[23:16]),
  .din6(rs10_fx3[15:8]),
  .din7(rs10_fx3[7:0]),
  .sel(gsr_mask0_fx4[30:28]),
  .dout(rs1_shuf_fx3[63:56]) 
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_8__width_8 shuf1_b1  (
  .din0(rs10_fx3[63:56]),
  .din1(rs10_fx3[55:48]),
  .din2(rs10_fx3[47:40]),
  .din3(rs10_fx3[39:32]),
  .din4(rs10_fx3[31:24]),
  .din5(rs10_fx3[23:16]),
  .din6(rs10_fx3[15:8]),
  .din7(rs10_fx3[7:0]),
  .sel(gsr_mask0_fx4[26:24]),
  .dout(rs1_shuf_fx3[55:48]) 
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_8__width_8 shuf1_b2  (
  .din0(rs10_fx3[63:56]),
  .din1(rs10_fx3[55:48]),
  .din2(rs10_fx3[47:40]),
  .din3(rs10_fx3[39:32]),
  .din4(rs10_fx3[31:24]),
  .din5(rs10_fx3[23:16]),
  .din6(rs10_fx3[15:8]),
  .din7(rs10_fx3[7:0]),
  .sel(gsr_mask0_fx4[22:20]),
  .dout(rs1_shuf_fx3[47:40]) 
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_8__width_8 shuf1_b3  (
  .din0(rs10_fx3[63:56]),
  .din1(rs10_fx3[55:48]),
  .din2(rs10_fx3[47:40]),
  .din3(rs10_fx3[39:32]),
  .din4(rs10_fx3[31:24]),
  .din5(rs10_fx3[23:16]),
  .din6(rs10_fx3[15:8]),
  .din7(rs10_fx3[7:0]),
  .sel(gsr_mask0_fx4[18:16]),
  .dout(rs1_shuf_fx3[39:32]) 
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_8__width_8 shuf1_b4  (
  .din0(rs10_fx3[63:56]),
  .din1(rs10_fx3[55:48]),
  .din2(rs10_fx3[47:40]),
  .din3(rs10_fx3[39:32]),
  .din4(rs10_fx3[31:24]),
  .din5(rs10_fx3[23:16]),
  .din6(rs10_fx3[15:8]),
  .din7(rs10_fx3[7:0]),
  .sel(gsr_mask0_fx4[14:12]),
  .dout(rs1_shuf_fx3[31:24]) 
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_8__width_8 shuf1_b5  (
  .din0(rs10_fx3[63:56]),
  .din1(rs10_fx3[55:48]),
  .din2(rs10_fx3[47:40]),
  .din3(rs10_fx3[39:32]),
  .din4(rs10_fx3[31:24]),
  .din5(rs10_fx3[23:16]),
  .din6(rs10_fx3[15:8]),
  .din7(rs10_fx3[7:0]),
  .sel(gsr_mask0_fx4[10:8]),
  .dout(rs1_shuf_fx3[23:16]) 
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_8__width_8 shuf1_b6  (
  .din0(rs10_fx3[63:56]),
  .din1(rs10_fx3[55:48]),
  .din2(rs10_fx3[47:40]),
  .din3(rs10_fx3[39:32]),
  .din4(rs10_fx3[31:24]),
  .din5(rs10_fx3[23:16]),
  .din6(rs10_fx3[15:8]),
  .din7(rs10_fx3[7:0]),
  .sel(gsr_mask0_fx4[6:4]),
  .dout(rs1_shuf_fx3[15:8]) 
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_8__width_8 shuf1_b7  (
  .din0(rs10_fx3[63:56]),
  .din1(rs10_fx3[55:48]),
  .din2(rs10_fx3[47:40]),
  .din3(rs10_fx3[39:32]),
  .din4(rs10_fx3[31:24]),
  .din5(rs10_fx3[23:16]),
  .din6(rs10_fx3[15:8]),
  .din7(rs10_fx3[7:0]),
  .sel(gsr_mask0_fx4[2:0]),
  .dout(rs1_shuf_fx3[7:0]) 
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_8__width_8 shuf2_b0  (
  .din0(rs20_fx3[63:56]),
  .din1(rs20_fx3[55:48]),
  .din2(rs20_fx3[47:40]),
  .din3(rs20_fx3[39:32]),
  .din4(rs20_fx3[31:24]),
  .din5(rs20_fx3[23:16]),
  .din6(rs20_fx3[15:8]),
  .din7(rs20_fx3[7:0]),
  .sel(gsr_mask0_fx4[30:28]),
  .dout(rs2_shuf_fx3[63:56]) 
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_8__width_8 shuf2_b1  (
  .din0(rs20_fx3[63:56]),
  .din1(rs20_fx3[55:48]),
  .din2(rs20_fx3[47:40]),
  .din3(rs20_fx3[39:32]),
  .din4(rs20_fx3[31:24]),
  .din5(rs20_fx3[23:16]),
  .din6(rs20_fx3[15:8]),
  .din7(rs20_fx3[7:0]),
  .sel(gsr_mask0_fx4[26:24]),
  .dout(rs2_shuf_fx3[55:48]) 
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_8__width_8 shuf2_b2  (
  .din0(rs20_fx3[63:56]),
  .din1(rs20_fx3[55:48]),
  .din2(rs20_fx3[47:40]),
  .din3(rs20_fx3[39:32]),
  .din4(rs20_fx3[31:24]),
  .din5(rs20_fx3[23:16]),
  .din6(rs20_fx3[15:8]),
  .din7(rs20_fx3[7:0]),
  .sel(gsr_mask0_fx4[22:20]),
  .dout(rs2_shuf_fx3[47:40]) 
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_8__width_8 shuf2_b3  (
  .din0(rs20_fx3[63:56]),
  .din1(rs20_fx3[55:48]),
  .din2(rs20_fx3[47:40]),
  .din3(rs20_fx3[39:32]),
  .din4(rs20_fx3[31:24]),
  .din5(rs20_fx3[23:16]),
  .din6(rs20_fx3[15:8]),
  .din7(rs20_fx3[7:0]),
  .sel(gsr_mask0_fx4[18:16]),
  .dout(rs2_shuf_fx3[39:32]) 
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_8__width_8 shuf2_b4  (
  .din0(rs20_fx3[63:56]),
  .din1(rs20_fx3[55:48]),
  .din2(rs20_fx3[47:40]),
  .din3(rs20_fx3[39:32]),
  .din4(rs20_fx3[31:24]),
  .din5(rs20_fx3[23:16]),
  .din6(rs20_fx3[15:8]),
  .din7(rs20_fx3[7:0]),
  .sel(gsr_mask0_fx4[14:12]),
  .dout(rs2_shuf_fx3[31:24]) 
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_8__width_8 shuf2_b5  (
  .din0(rs20_fx3[63:56]),
  .din1(rs20_fx3[55:48]),
  .din2(rs20_fx3[47:40]),
  .din3(rs20_fx3[39:32]),
  .din4(rs20_fx3[31:24]),
  .din5(rs20_fx3[23:16]),
  .din6(rs20_fx3[15:8]),
  .din7(rs20_fx3[7:0]),
  .sel(gsr_mask0_fx4[10:8]),
  .dout(rs2_shuf_fx3[23:16]) 
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_8__width_8 shuf2_b6  (
  .din0(rs20_fx3[63:56]),
  .din1(rs20_fx3[55:48]),
  .din2(rs20_fx3[47:40]),
  .din3(rs20_fx3[39:32]),
  .din4(rs20_fx3[31:24]),
  .din5(rs20_fx3[23:16]),
  .din6(rs20_fx3[15:8]),
  .din7(rs20_fx3[7:0]),
  .sel(gsr_mask0_fx4[6:4]),
  .dout(rs2_shuf_fx3[15:8]) 
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_8__width_8 shuf2_b7  (
  .din0(rs20_fx3[63:56]),
  .din1(rs20_fx3[55:48]),
  .din2(rs20_fx3[47:40]),
  .din3(rs20_fx3[39:32]),
  .din4(rs20_fx3[31:24]),
  .din5(rs20_fx3[23:16]),
  .din6(rs20_fx3[15:8]),
  .din7(rs20_fx3[7:0]),
  .sel(gsr_mask0_fx4[2:0]),
  .dout(rs2_shuf_fx3[7:0]) 
  );

// ------------------------------------
// bshuffle result muxes
// ------------------------------------

fgu_fgd_dp_mux_macro__mux_pgpe__ports_2__width_8 bres_b0  (
  .din0(rs2_shuf_fx3[63:56]),
  .din1(rs1_shuf_fx3[63:56]),
  .sel0(gsr_mask0_fx4[31]),
  .dout(shuf_result_fx3[63:56]) 
  );

fgu_fgd_dp_mux_macro__mux_pgpe__ports_2__width_8 bres_b1  (
  .din0(rs2_shuf_fx3[55:48]),
  .din1(rs1_shuf_fx3[55:48]),
  .sel0(gsr_mask0_fx4[27]),
  .dout(shuf_result_fx3[55:48]) 
  );

fgu_fgd_dp_mux_macro__mux_pgpe__ports_2__width_8 bres_b2  (
  .din0(rs2_shuf_fx3[47:40]),
  .din1(rs1_shuf_fx3[47:40]),
  .sel0(gsr_mask0_fx4[23]),
  .dout(shuf_result_fx3[47:40]) 
  );

fgu_fgd_dp_mux_macro__mux_pgpe__ports_2__width_8 bres_b3  (
  .din0(rs2_shuf_fx3[39:32]),
  .din1(rs1_shuf_fx3[39:32]),
  .sel0(gsr_mask0_fx4[19]),
  .dout(shuf_result_fx3[39:32]) 
  );

fgu_fgd_dp_mux_macro__mux_pgpe__ports_2__width_8 bres_b4  (
  .din0(rs2_shuf_fx3[31:24]),
  .din1(rs1_shuf_fx3[31:24]),
  .sel0(gsr_mask0_fx4[15]),
  .dout(shuf_result_fx3[31:24]) 
  );

fgu_fgd_dp_mux_macro__mux_pgpe__ports_2__width_8 bres_b5  (
  .din0(rs2_shuf_fx3[23:16]),
  .din1(rs1_shuf_fx3[23:16]),
  .sel0(gsr_mask0_fx4[11]),
  .dout(shuf_result_fx3[23:16]) 
  );

fgu_fgd_dp_mux_macro__mux_pgpe__ports_2__width_8 bres_b6  (
  .din0(rs2_shuf_fx3[15:8]),
  .din1(rs1_shuf_fx3[15:8]),
  .sel0(gsr_mask0_fx4[7]),
  .dout(shuf_result_fx3[15:8]) 
  );

fgu_fgd_dp_mux_macro__mux_pgpe__ports_2__width_8 bres_b7  (
  .din0(rs2_shuf_fx3[7:0]),
  .din1(rs1_shuf_fx3[7:0]),
  .sel0(gsr_mask0_fx4[3]),
  .dout(shuf_result_fx3[7:0]) 
  );

// ------------------------------------
// faligndata mux
// ------------------------------------

fgu_fgd_dp_mux_macro__mux_aodec__ports_8__width_64 align  (
  .din0(rs10_fx3[63:0]),
  .din1({rs10_fx3[55:0],rs20_fx3[63:56]}),
  .din2({rs10_fx3[47:0],rs20_fx3[63:48]}),
  .din3({rs10_fx3[39:0],rs20_fx3[63:40]}),
  .din4({rs10_fx3[31:0],rs20_fx3[63:32]}),
  .din5({rs10_fx3[23:0],rs20_fx3[63:24]}),
  .din6({rs10_fx3[15:0],rs20_fx3[63:16]}),
  .din7({rs10_fx3[7:0], rs20_fx3[63:8] }),
  .sel (fpc_gsr_align_fx4[2:0]),
  .dout(align_result_fx3[63:0]) 
  );

// ------------------------------------
// generate sign bit for FNEG, FABS
// ------------------------------------

fgu_fgd_dp_xnor_macro__ports_2__width_1 sign63a  (
  .din0(fgx_neg_fx3),  // negate sign bit
  .din1(rs20_fx3[63]),
  .dout(rs2_sign63_neg_fx3)
  );

fgu_fgd_dp_nor_macro__ports_2__width_1 sign63b  (
  .din0(fgx_abs_fx3),  // clear sign bit
  .din1(rs2_sign63_neg_fx3),
  .dout(rs2_sign63_res_fx3)
  );

// ------------------------------------
// simple instruction intermediate result mux
// ------------------------------------

fgu_fgd_dp_msff_macro__mux_aope__ports_6__width_64 fx4_simp  (
  .scan_in(fx4_simp_scanin),
  .scan_out(fx4_simp_scanout),
  .clk (l2clk),
  .en  (vis_clken),
  .din0(logical_result_fx3[63:0]),
  .din1({4'b0000,rs201_fx3[63:56],4'b0000,
         4'b0000,rs201_fx3[55:48],4'b0000,
         4'b0000,rs201_fx3[47:40],4'b0000,
         4'b0000,rs201_fx3[39:32],4'b0000 }),
  .din2({rs101_fx3[63:56],rs201_fx3[63:56],rs101_fx3[55:48],rs201_fx3[55:48],
         rs101_fx3[47:40],rs201_fx3[47:40],rs101_fx3[39:32],rs201_fx3[39:32] }),
  .din3(align_result_fx3[63:0]),
  .din4(shuf_result_fx3[63:0]),
  .din5({rs2_sign63_res_fx3,rs201_fx3[62:0]}),
  .sel0(fgx_logical_fx3),
  .sel1(fgx_expand_fx3),
  .sel2(fgx_merge_fx3),
  .sel3(fgx_align_fx3),
  .sel4(fgx_shuffle_fx3),
                           // else: FMOV(uncond/cond), FABS, FNEG
  .dout(simp_result_fx4[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ------------------------------------
// fpack left shifter (data result)
// partitioned into four 16b shifters: [63:48],[47:32],[31:16],[15:00]
// FPACK{16,32},FPACKFIX
// ------------------------------------

fgu_fgd_dp_inv_macro__width_1 ipack16  (
  .din (fgx_pack16_fx3 ),
  .dout(fgx_pack16_fx3_)
  );

fgu_fgd_dp_nand_macro__ports_2__width_1 gsr4  (
  .din0(fpc_gsr_scale_fx4[4]),
  .din1(fgx_pack16_fx3_),  // ignore gsr_scale_fx4[4] if FPACK16
  .dout(sh16_sel_fx3)
  );

// ------------------------------------
// fpack data result
// bits [63:32]
// ------------------------------------

fgu_fgd_dp_mux_macro__mux_aope__ports_2__width_32 pack_16_d3d2  (
  .din0( rs201_fx3[63:32]        ),   
  .din1({rs201_fx3[47:32], 16'b0}),  
  .sel0(sh16_sel_fx3),        // shift 0,16 bits
  .dout(shift16_fx3[63:32])
  );

fgu_fgd_dp_and_macro__ports_2__width_12 gate16d3  (
  .din0(shift16_fx3[47:36]),
  .din1({12{fgx_pack16_fx3_}}),
  .dout(gate16_fx3[23:12])
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_16 pack_04_d3  ( 
  .din0( shift16_fx3[63:48]                    ),
  .din1({shift16_fx3[59:48], gate16_fx3[23:20]}), 
  .din2({shift16_fx3[55:48], gate16_fx3[23:16]}),
  .din3({shift16_fx3[51:48], gate16_fx3[23:12]}),
  .sel (fpc_gsr_scale_fx4[3:2]),  // shift 0,4,8,12 bits
  .dout(shift04_fx3[63:48])
  );

fgu_fgd_dp_and_macro__ports_2__width_3 gate04d3  (
  .din0(shift04_fx3[47:45]),
  .din1({3{fgx_pack16_fx3_}}),
  .dout(gate04_fx3[5:3])
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_16 pack_01_d3  ( 
  .din0( shift04_fx3[63:48]                    ), 
  .din1({shift04_fx3[62:48], gate04_fx3[5:5]}), 
  .din2({shift04_fx3[61:48], gate04_fx3[5:4]}), 
  .din3({shift04_fx3[60:48], gate04_fx3[5:3]}),  
  .sel (fpc_gsr_scale_fx4[1:0]),  // shift 0,1,2,3 bits
  .dout(shift01_fx3[63:48])
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_16 pack_04_d2  ( 
  .din0( shift16_fx3[47:32]        ),
  .din1({shift16_fx3[43:32],  4'b0}), 
  .din2({shift16_fx3[39:32],  8'b0}),
  .din3({shift16_fx3[35:32], 12'b0}),
  .sel (fpc_gsr_scale_fx4[3:2]),  // shift 0,4,8,12 bits
  .dout(shift04_fx3[47:32])
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_16 pack_01_d2  ( 
  .din0( shift04_fx3[47:32]       ), 
  .din1({shift04_fx3[46:32], 1'b0}),
  .din2({shift04_fx3[45:32], 2'b0}), 
  .din3({shift04_fx3[44:32], 3'b0}),  
  .sel (fpc_gsr_scale_fx4[1:0]),  // shift 0,1,2,3 bits
  .dout({shift01_fx3[47:39], pack_01_d2_unused[6:0]})
  );

// ------------------------------------
// fpack data result
// bits [31:00]
// ------------------------------------

fgu_fgd_dp_mux_macro__mux_aope__ports_2__width_32 pack_16_d1d0  (
  .din0( rs201_fx3[31:0]        ),
  .din1({rs201_fx3[15:0], 16'b0}),  
  .sel0(sh16_sel_fx3),        // shift 0,16 bits
  .dout(shift16_fx3[31:0])
  );

fgu_fgd_dp_and_macro__ports_2__width_12 gate16d1  (
  .din0(shift16_fx3[15:4]),
  .din1({12{fgx_pack16_fx3_}}),
  .dout(gate16_fx3[11:0])
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_16 pack_04_d1  ( 
  .din0( shift16_fx3[31:16]                    ),
  .din1({shift16_fx3[27:16], gate16_fx3[11:8]}), 
  .din2({shift16_fx3[23:16], gate16_fx3[11:4]}),
  .din3({shift16_fx3[19:16], gate16_fx3[11:0]}),
  .sel (fpc_gsr_scale_fx4[3:2]),  // shift 0,4,8,12 bits
  .dout(shift04_fx3[31:16])
  );

fgu_fgd_dp_and_macro__ports_2__width_3 gate04d1  (
  .din0(shift04_fx3[15:13]),
  .din1({3{fgx_pack16_fx3_}}),
  .dout(gate04_fx3[2:0])
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_16 pack_01_d1  ( 
  .din0( shift04_fx3[31:16]                    ),
  .din1({shift04_fx3[30:16], gate04_fx3[2:2]}), 
  .din2({shift04_fx3[29:16], gate04_fx3[2:1]}), 
  .din3({shift04_fx3[28:16], gate04_fx3[2:0]}),  
  .sel (fpc_gsr_scale_fx4[1:0]),  // shift 0,1,2,3 bits
  .dout(shift01_fx3[31:16])
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_16 pack_04_d0  ( 
  .din0( shift16_fx3[15:0]        ),
  .din1({shift16_fx3[11:0],  4'b0}), 
  .din2({shift16_fx3[7:0],  8'b0}),
  .din3({shift16_fx3[3:0], 12'b0}),
  .sel (fpc_gsr_scale_fx4[3:2]),  // shift 0,4,8,12 bits
  .dout(shift04_fx3[15:0])
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_16 pack_01_d0  ( 
  .din0( shift04_fx3[15:0]       ),
  .din1({shift04_fx3[14:0], 1'b0}),
  .din2({shift04_fx3[13:0], 2'b0}), 
  .din3({shift04_fx3[12:0], 3'b0}),  
  .sel (fpc_gsr_scale_fx4[1:0]),  // shift 0,1,2,3 bits
  .dout({shift01_fx3[15:7], pack_01_d0_unused[6:0]})
  );

// ------------------------------------
// fpack collection of shifted off (clipping) data
// used to determine if const data output is required
// FPACK{16,32},FPACKFIX
// ------------------------------------

// ------------------------------------
// fpack clipping result
// bits [63:32]
// ------------------------------------

fgu_fgd_dp_and_macro__ports_2__width_1 packsign63  (
  .din0(rs201_fx3[63]),
  .din1(fgx_packfix_fx3),
  .dout(pack_sign63_fx3)
  );

fgu_fgd_dp_mux_macro__mux_aope__ports_2__width_16 pack_16_c3c2  (
  .din0({16{pack_sign63_fx3}}),   
  .din1(rs201_fx3[63:48]),  
  .sel0(sh16_sel_fx3),        // shift 0,16 bits
  .dout(clip16_c3_fx3[15:0])
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_28 pack_04_c3  ( 
  .din0({{12{pack_sign63_fx3}}, clip16_c3_fx3[15:0]                    }),
  .din1({{ 8{pack_sign63_fx3}}, clip16_c3_fx3[15:0], shift16_fx3[63:60]}), 
  .din2({{ 4{pack_sign63_fx3}}, clip16_c3_fx3[15:0], shift16_fx3[63:56]}),
  .din3({                       clip16_c3_fx3[15:0], shift16_fx3[63:52]}),
  .sel (fpc_gsr_scale_fx4[3:2]),  // shift 0,4,8,12 bits
  .dout(clip04_c3_fx3[27:0])
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_31 pack_01_c3  ( 
  .din0({{3{pack_sign63_fx3}}, clip04_c3_fx3[27:0]                    }), 
  .din1({{2{pack_sign63_fx3}}, clip04_c3_fx3[27:0], shift04_fx3[63:63]}), 
  .din2({{1{pack_sign63_fx3}}, clip04_c3_fx3[27:0], shift04_fx3[63:62]}), 
  .din3({                      clip04_c3_fx3[27:0], shift04_fx3[63:61]}),  
  .sel (fpc_gsr_scale_fx4[1:0]),  // shift 0,1,2,3 bits
  .dout(clip01_c3_fx3[30:0])
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_12 pack_04_c2  ( 
  .din0( 12'b0                     ),
  .din1({ 8'b0, shift16_fx3[47:44]}), 
  .din2({ 4'b0, shift16_fx3[47:40]}),
  .din3(        shift16_fx3[47:36] ),
  .sel (fpc_gsr_scale_fx4[3:2]),  // shift 0,4,8,12 bits
  .dout(clip04_c2_fx3[11:0])
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_15 pack_01_c2  ( 
  .din0({3'b0, clip04_c2_fx3[11:0]                    }), 
  .din1({2'b0, clip04_c2_fx3[11:0], shift04_fx3[47:47]}),
  .din2({1'b0, clip04_c2_fx3[11:0], shift04_fx3[47:46]}), 
  .din3({      clip04_c2_fx3[11:0], shift04_fx3[47:45]}),  
  .sel (fpc_gsr_scale_fx4[1:0]),  // shift 0,1,2,3 bits
  .dout(clip01_c2_fx3[14:0])
  );

// ------------------------------------
// fpack clipping result
// bits [31:00]
// ------------------------------------

fgu_fgd_dp_and_macro__ports_2__width_1 packsign31  (
  .din0(rs201_fx3[31]),
  .din1(fgx_packfix_fx3),
  .dout(pack_sign31_fx3)
  );

fgu_fgd_dp_mux_macro__mux_aope__ports_2__width_16 pack_16_c1c0  (
  .din0({16{pack_sign31_fx3}}),   
  .din1(rs201_fx3[31:16]),  
  .sel0(sh16_sel_fx3),        // shift 0,16 bits
  .dout(clip16_c1_fx3[15:0])
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_28 pack_04_c1  ( 
  .din0({{12{pack_sign31_fx3}}, clip16_c1_fx3[15:0]                    }),
  .din1({{ 8{pack_sign31_fx3}}, clip16_c1_fx3[15:0], shift16_fx3[31:28]}), 
  .din2({{ 4{pack_sign31_fx3}}, clip16_c1_fx3[15:0], shift16_fx3[31:24]}),
  .din3({                       clip16_c1_fx3[15:0], shift16_fx3[31:20]}),
  .sel (fpc_gsr_scale_fx4[3:2]),  // shift 0,4,8,12 bits
  .dout(clip04_c1_fx3[27:0])
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_31 pack_01_c1  ( 
  .din0({{3{pack_sign31_fx3}}, clip04_c1_fx3[27:0]                    }), 
  .din1({{2{pack_sign31_fx3}}, clip04_c1_fx3[27:0], shift04_fx3[31:31]}), 
  .din2({{1{pack_sign31_fx3}}, clip04_c1_fx3[27:0], shift04_fx3[31:30]}), 
  .din3({                      clip04_c1_fx3[27:0], shift04_fx3[31:29]}),  
  .sel (fpc_gsr_scale_fx4[1:0]),  // shift 0,1,2,3 bits
  .dout(clip01_c1_fx3[30:0])
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_12 pack_04_c0  ( 
  .din0( 12'b0                     ),
  .din1({ 8'b0, shift16_fx3[15:12]}), 
  .din2({ 4'b0, shift16_fx3[15:8]}),
  .din3(        shift16_fx3[15:4] ),
  .sel (fpc_gsr_scale_fx4[3:2]),  // shift 0,4,8,12 bits
  .dout(clip04_c0_fx3[11:0])
  );

fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_15 pack_01_c0  ( 
  .din0({3'b0, clip04_c0_fx3[11:0]                    }), 
  .din1({2'b0, clip04_c0_fx3[11:0], shift04_fx3[15:15]}),
  .din2({1'b0, clip04_c0_fx3[11:0], shift04_fx3[15:14]}), 
  .din3({      clip04_c0_fx3[11:0], shift04_fx3[15:13]}),  
  .sel (fpc_gsr_scale_fx4[1:0]),  // shift 0,1,2,3 bits
  .dout(clip01_c0_fx3[14:0])
  );

// ------------------------------------
// PDIST,POPC
// ------------------------------------

// ------------------------------------
// uniquie PDIST frontend (fx3)
// subtract (rs1 - rs2)
// ------------------------------------

fgu_fgd_dp_cla_macro__width_8 pdist_amb0  (
  .din0(rs101_fx3[63:56] ),
  .din1(rs201_fx3_[63:56]),
  .cin (1'b1),
  .dout(pdist_amb_fx3[63:56]),
  .cout(pdist_amb_cout0_fx3)
  );

fgu_fgd_dp_cla_macro__width_8 pdist_amb1  (
  .din0(rs101_fx3[55:48] ),
  .din1(rs201_fx3_[55:48]),
  .cin (1'b1),
  .dout(pdist_amb_fx3[55:48]),
  .cout(pdist_amb_cout1_fx3)
  );

fgu_fgd_dp_cla_macro__width_8 pdist_amb2  (
  .din0(rs101_fx3[47:40] ),
  .din1(rs201_fx3_[47:40]),
  .cin (1'b1),
  .dout(pdist_amb_fx3[47:40]),
  .cout(pdist_amb_cout2_fx3)
  );

fgu_fgd_dp_cla_macro__width_8 pdist_amb3  (
  .din0(rs101_fx3[39:32] ),
  .din1(rs201_fx3_[39:32]),
  .cin (1'b1),
  .dout(pdist_amb_fx3[39:32]),
  .cout(pdist_amb_cout3_fx3)
  );

fgu_fgd_dp_cla_macro__width_8 pdist_amb4  (
  .din0(rs101_fx3[31:24] ),
  .din1(rs201_fx3_[31:24]),
  .cin (1'b1),
  .dout(pdist_amb_fx3[31:24]),
  .cout(pdist_amb_cout4_fx3)
  );

fgu_fgd_dp_cla_macro__width_8 pdist_amb5  (
  .din0(rs101_fx3[23:16] ),
  .din1(rs201_fx3_[23:16]),
  .cin (1'b1),
  .dout(pdist_amb_fx3[23:16]),
  .cout(pdist_amb_cout5_fx3)
  );

fgu_fgd_dp_cla_macro__width_8 pdist_amb6  (
  .din0(rs101_fx3[15:8] ),
  .din1(rs201_fx3_[15:8]),
  .cin (1'b1),
  .dout(pdist_amb_fx3[15:8]),
  .cout(pdist_amb_cout6_fx3)
  );

fgu_fgd_dp_cla_macro__width_8 pdist_amb7  (
  .din0(rs101_fx3[7:0] ),
  .din1(rs201_fx3_[7:0]),
  .cin (1'b1),
  .dout(pdist_amb_fx3[7:0]),
  .cout(pdist_amb_cout7_fx3)
  );

// ------------------------------------
// uniquie PDIST frontend (fx3)
// subtract (rs2 - rs1)
// ------------------------------------

fgu_fgd_dp_cla_macro__width_8 pdist_bma0  (
  .din0(rs201_fx3[63:56] ),
  .din1(rs101_fx3_[63:56]),
  .cin (1'b1),
  .dout(pdist_bma_fx3[63:56]),
  .cout(pdist_bma0_unused)
  );

fgu_fgd_dp_cla_macro__width_8 pdist_bma1  (
  .din0(rs201_fx3[55:48] ),
  .din1(rs101_fx3_[55:48]),
  .cin (1'b1),
  .dout(pdist_bma_fx3[55:48]),
  .cout(pdist_bma1_unused)
  );

fgu_fgd_dp_cla_macro__width_8 pdist_bma2  (
  .din0(rs201_fx3[47:40] ),
  .din1(rs101_fx3_[47:40]),
  .cin (1'b1),
  .dout(pdist_bma_fx3[47:40]),
  .cout(pdist_bma2_unused)
  );

fgu_fgd_dp_cla_macro__width_8 pdist_bma3  (
  .din0(rs201_fx3[39:32] ),
  .din1(rs101_fx3_[39:32]),
  .cin (1'b1),
  .dout(pdist_bma_fx3[39:32]),
  .cout(pdist_bma3_unused)
  );

fgu_fgd_dp_cla_macro__width_8 pdist_bma4  (
  .din0(rs201_fx3[31:24] ),
  .din1(rs101_fx3_[31:24]),
  .cin (1'b1),
  .dout(pdist_bma_fx3[31:24]),
  .cout(pdist_bma4_unused)
  );

fgu_fgd_dp_cla_macro__width_8 pdist_bma5  (
  .din0(rs201_fx3[23:16] ),
  .din1(rs101_fx3_[23:16]),
  .cin (1'b1),
  .dout(pdist_bma_fx3[23:16]),
  .cout(pdist_bma5_unused)
  );

fgu_fgd_dp_cla_macro__width_8 pdist_bma6  (
  .din0(rs201_fx3[15:8] ),
  .din1(rs101_fx3_[15:8]),
  .cin (1'b1),
  .dout(pdist_bma_fx3[15:8]),
  .cout(pdist_bma6_unused)
  );

fgu_fgd_dp_cla_macro__width_8 pdist_bma7  (
  .din0(rs201_fx3[7:0] ),
  .din1(rs101_fx3_[7:0]),
  .cin (1'b1),
  .dout(pdist_bma_fx3[7:0]),
  .cout(pdist_bma7_unused)
  );

// ------------------------------------
// select PDIST or POPC
// to proceed to the common backend
// ------------------------------------

fgu_fgd_dp_mux_macro__mux_aope__ports_3__width_8 pdist_mux0  (
  .din0({4'b0, popc_byte0_sum_fx3[3:0]}),
  .din1(pdist_amb_fx3[63:56]),
  .din2(pdist_bma_fx3[63:56]),
  .sel0(fgx_popc_fx3),
  .sel1(pdist_amb_cout0_fx3),
  .dout(pdist_mux_fx3[63:56])
  );

fgu_fgd_dp_mux_macro__mux_aope__ports_3__width_8 pdist_mux1  (
  .din0({4'b0, popc_byte1_sum_fx3[3:0]}),
  .din1(pdist_amb_fx3[55:48]),
  .din2(pdist_bma_fx3[55:48]),
  .sel0(fgx_popc_fx3),
  .sel1(pdist_amb_cout1_fx3),
  .dout(pdist_mux_fx3[55:48])
  );

fgu_fgd_dp_mux_macro__mux_aope__ports_3__width_8 pdist_mux2  (
  .din0({4'b0, popc_byte2_sum_fx3[3:0]}),
  .din1(pdist_amb_fx3[47:40]),
  .din2(pdist_bma_fx3[47:40]),
  .sel0(fgx_popc_fx3),
  .sel1(pdist_amb_cout2_fx3),
  .dout(pdist_mux_fx3[47:40])
  );

fgu_fgd_dp_mux_macro__mux_aope__ports_3__width_8 pdist_mux3  (
  .din0({4'b0, popc_byte3_sum_fx3[3:0]}),
  .din1(pdist_amb_fx3[39:32]),
  .din2(pdist_bma_fx3[39:32]),
  .sel0(fgx_popc_fx3),
  .sel1(pdist_amb_cout3_fx3),
  .dout(pdist_mux_fx3[39:32])
  );

fgu_fgd_dp_mux_macro__mux_aope__ports_3__width_8 pdist_mux4  (
  .din0({4'b0, popc_byte4_sum_fx3[3:0]}),
  .din1(pdist_amb_fx3[31:24]),
  .din2(pdist_bma_fx3[31:24]),
  .sel0(fgx_popc_fx3),
  .sel1(pdist_amb_cout4_fx3),
  .dout(pdist_mux_fx3[31:24])
  );

fgu_fgd_dp_mux_macro__mux_aope__ports_3__width_8 pdist_mux5  (
  .din0({4'b0, popc_byte5_sum_fx3[3:0]}),
  .din1(pdist_amb_fx3[23:16]),
  .din2(pdist_bma_fx3[23:16]),
  .sel0(fgx_popc_fx3),
  .sel1(pdist_amb_cout5_fx3),
  .dout(pdist_mux_fx3[23:16])
  );

fgu_fgd_dp_mux_macro__mux_aope__ports_3__width_8 pdist_mux6  (
  .din0({4'b0, popc_byte6_sum_fx3[3:0]}),
  .din1(pdist_amb_fx3[15:8]),
  .din2(pdist_bma_fx3[15:8]),
  .sel0(fgx_popc_fx3),
  .sel1(pdist_amb_cout6_fx3),
  .dout(pdist_mux_fx3[15:8])
  );

fgu_fgd_dp_mux_macro__mux_aope__ports_3__width_8 pdist_mux7  (
  .din0({4'b0, popc_byte7_sum_fx3[3:0]}),
  .din1(pdist_amb_fx3[7:0]),
  .din2(pdist_bma_fx3[7:0]),
  .sel0(fgx_popc_fx3),
  .sel1(pdist_amb_cout7_fx3),
  .dout(pdist_mux_fx3[7:0])
  );

// ------------------------------------
// common PDIST,POPC backend (fx3)
// begin compression of 8 8-bit values
// ------------------------------------

fgu_fgd_dp_csa42_macro__width_8 pdist_42csa_0  (
  .i0   (pdist_mux_fx3[7:0]),
  .i1   (pdist_mux_fx3[15:8]),
  .i2   (pdist_mux_fx3[23:16]),
  .i3   (pdist_mux_fx3[31:24]),
  .cin  (1'b0                ),
  .cout (pdist_42csa_cout0_fx3        ), 
  .carry(pdist_42csa_carry0_fx3[8:1]),
  .sum  (pdist_42csa_sum0_fx3[7:0]  )  
  );

fgu_fgd_dp_csa42_macro__width_8 pdist_42csa_1  (
  .i0   (pdist_mux_fx3[39:32]),
  .i1   (pdist_mux_fx3[47:40]),
  .i2   (pdist_mux_fx3[55:48]),
  .i3   (pdist_mux_fx3[63:56]),
  .cin  (1'b0                ),
  .cout (pdist_42csa_cout1_fx3        ), 
  .carry(pdist_42csa_carry1_fx3[8:1]),
  .sum  (pdist_42csa_sum1_fx3[7:0]  )  
  );

// ----------------------------------------------------------------------------
//                               FX4 stage
// ----------------------------------------------------------------------------

fgu_fgd_dp_msff_macro__width_48 fx4_rs1  (
  .scan_in(fx4_rs1_scanin),
  .scan_out(fx4_rs1_scanout),
  .clk (l2clk),
  .en  (vis_clken),
  .din ({rs101_fx3[55:32], rs101_fx3[23:0]}),
  .dout({rs1_fx4[55:32],   rs1_fx4[23:0] }),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__width_50 fx4_shift  (
  .scan_in(fx4_shift_scanin),
  .scan_out(fx4_shift_scanout),
  .clk (l2clk),
  .en  (vis_clken),
  .din ({shift01_fx3[63:39], shift01_fx3[31:7]}),
  .dout({shift01_fx4[63:39], shift01_fx4[31:7]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__width_62 fx4_clipa  (
  .scan_in(fx4_clipa_scanin),
  .scan_out(fx4_clipa_scanout),
  .clk (l2clk),
  .en  (vis_clken),
  .din ({clip01_c3_fx3[30:0],clip01_c1_fx3[30:0]}),
  .dout({clip01_c3_fx4[30:0],clip01_c1_fx4[30:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__width_37 fx4_clipb  (
  .scan_in(fx4_clipb_scanin),
  .scan_out(fx4_clipb_scanout),
  .clk (l2clk),
  .en  (vis_clken),
  .din ({rs201_fx3[63],
         rs201_fx3[47],
         clip01_c2_fx3[14:0],clip01_c0_fx3[14:0],
         rs201_fx3[31],
         rs201_fx3[15],
         fgx_packfix_fx3,fgx_pack32_fx3,fgx_pack16_fx3}),
  .dout({rs2_fx4_b63,
         rs2_fx4_b47,
         clip01_c2_fx4[14:0],clip01_c0_fx4[14:0],
         rs2_fx4_b31,
         rs2_fx4_b15,
         fgx_packfix_fx4,fgx_pack32_fx4,fgx_pack16_fx4}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__width_34 fx4_pdist  (
  .scan_in(fx4_pdist_scanin),
  .scan_out(fx4_pdist_scanout),
  .clk (l2clk),
  .en  (vis_clken),
  .din ({pdist_42csa_cout0_fx3,
         pdist_42csa_cout1_fx3,
         pdist_42csa_carry0_fx3[8:1],
         pdist_42csa_sum0_fx3[7:0],
         pdist_42csa_carry1_fx3[8:1],
         pdist_42csa_sum1_fx3[7:0]   }),
  .dout( pdist_42csa_data_fx4[33:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)   
  );

// ------------------------------------
// GSR.mask flops, threads 0-7
// ------------------------------------

fgu_fgd_dp_msff_macro__stack_32l__width_6 fx4_gsrtid  (
  .scan_in(fx4_gsrtid_scanin),
  .scan_out(fx4_gsrtid_scanout),
  .clk (l2clk),
  .en  (vis_clken),
  .din ({fac_gsr_asr_tid_fx2[2:0], fac_tid_fx2[2:0]}),
  .dout({    gsr_asr_tid_fx3[2:0],     tid_fx3[2:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__mux_aope__ports_2__stack_32l__width_32 fx4_gsr0mask  (	// FS:wmr_protect
  .scan_in(fx4_gsr0mask_wmr_scanin),
  .scan_out(fx4_gsr0mask_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .se(lb_scan_en_wmr),
  .clk (l2clk),
  .en  (fpc_gsr0_mask_sel_fx3[1]),
  .din0(gsr_mask_fx3[31:0]),
  .din1(in_rngl_cdbus_3f[63:32]),
  .sel0(fpc_gsr0_mask_sel_fx3[0]),
  .dout(gsr0_mask_fx4[31:0]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__mux_aope__ports_2__stack_32l__width_32 fx4_gsr1mask  (	// FS:wmr_protect
  .scan_in(fx4_gsr1mask_wmr_scanin),
  .scan_out(fx4_gsr1mask_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .se(lb_scan_en_wmr),
  .clk (l2clk),
  .en  (fpc_gsr1_mask_sel_fx3[1]),
  .din0(gsr_mask_fx3[31:0]),
  .din1(in_rngl_cdbus_3f[63:32]),
  .sel0(fpc_gsr1_mask_sel_fx3[0]),
  .dout(gsr1_mask_fx4[31:0]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__mux_aope__ports_2__stack_32l__width_32 fx4_gsr2mask  (	// FS:wmr_protect
  .scan_in(fx4_gsr2mask_wmr_scanin),
  .scan_out(fx4_gsr2mask_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .se(lb_scan_en_wmr),
  .clk (l2clk),
  .en  (fpc_gsr2_mask_sel_fx3[1]),
  .din0(gsr_mask_fx3[31:0]),
  .din1(in_rngl_cdbus_3f[63:32]),
  .sel0(fpc_gsr2_mask_sel_fx3[0]),
  .dout(gsr2_mask_fx4[31:0]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__mux_aope__ports_2__stack_32l__width_32 fx4_gsr3mask  (	// FS:wmr_protect
  .scan_in(fx4_gsr3mask_wmr_scanin),
  .scan_out(fx4_gsr3mask_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .se(lb_scan_en_wmr),
  .clk (l2clk),
  .en  (fpc_gsr3_mask_sel_fx3[1]),
  .din0(gsr_mask_fx3[31:0]),
  .din1(in_rngl_cdbus_3f[63:32]),
  .sel0(fpc_gsr3_mask_sel_fx3[0]),
  .dout(gsr3_mask_fx4[31:0]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__mux_aope__ports_2__stack_32l__width_32 fx4_gsr4mask  (	// FS:wmr_protect
  .scan_in(fx4_gsr4mask_wmr_scanin),
  .scan_out(fx4_gsr4mask_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .se(lb_scan_en_wmr),
  .clk (l2clk),
  .en  (fpc_gsr4_mask_sel_fx3[1]),
  .din0(gsr_mask_fx3[31:0]),
  .din1(in_rngl_cdbus_3f[63:32]),
  .sel0(fpc_gsr4_mask_sel_fx3[0]),
  .dout(gsr4_mask_fx4[31:0]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__mux_aope__ports_2__stack_32l__width_32 fx4_gsr5mask  (	// FS:wmr_protect
  .scan_in(fx4_gsr5mask_wmr_scanin),
  .scan_out(fx4_gsr5mask_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .se(lb_scan_en_wmr),
  .clk (l2clk),
  .en  (fpc_gsr5_mask_sel_fx3[1]),
  .din0(gsr_mask_fx3[31:0]),
  .din1(in_rngl_cdbus_3f[63:32]),
  .sel0(fpc_gsr5_mask_sel_fx3[0]),
  .dout(gsr5_mask_fx4[31:0]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__mux_aope__ports_2__stack_32l__width_32 fx4_gsr6mask  (	// FS:wmr_protect
  .scan_in(fx4_gsr6mask_wmr_scanin),
  .scan_out(fx4_gsr6mask_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .se(lb_scan_en_wmr),
  .clk (l2clk),
  .en  (fpc_gsr6_mask_sel_fx3[1]),
  .din0(gsr_mask_fx3[31:0]),
  .din1(in_rngl_cdbus_3f[63:32]),
  .sel0(fpc_gsr6_mask_sel_fx3[0]),
  .dout(gsr6_mask_fx4[31:0]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__mux_aope__ports_2__stack_32l__width_32 fx4_gsr7mask  (	// FS:wmr_protect
  .scan_in(fx4_gsr7mask_wmr_scanin),
  .scan_out(fx4_gsr7mask_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .se(lb_scan_en_wmr),
  .clk (l2clk),
  .en  (fpc_gsr7_mask_sel_fx3[1]),
  .din0(gsr_mask_fx3[31:0]),
  .din1(in_rngl_cdbus_3f[63:32]),
  .sel0(fpc_gsr7_mask_sel_fx3[0]),
  .dout(gsr7_mask_fx4[31:0]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ------------------------------------
// GSR.mask thread 0-7 mux
// ------------------------------------

fgu_fgd_dp_mux_macro__mux_aodec__ports_8__stack_32l__width_32 mux_gsr  (
  .din0(gsr0_mask_fx4[31:0]),
  .din1(gsr1_mask_fx4[31:0]),
  .din2(gsr2_mask_fx4[31:0]),
  .din3(gsr3_mask_fx4[31:0]),
  .din4(gsr4_mask_fx4[31:0]),
  .din5(gsr5_mask_fx4[31:0]),
  .din6(gsr6_mask_fx4[31:0]),
  .din7(gsr7_mask_fx4[31:0]),
  .sel (tid_fx3[2:0]),
  .dout(gsr_mask_fx4[31:0])
  );

fgu_fgd_dp_buff_macro__stack_32l__width_32 buf_gsr  (
  .din (gsr_mask_fx4[31:0]),
  .dout(gsr_mask0_fx4[31:0])
  );

fgu_fgd_dp_buff_macro__dbuff_48x__stack_32l__width_1 muxtest_a_rep0  (
  .din (tcu_muxtest	  ),
  .dout(tcu_muxtest_a_rep0)
  );

fgu_fgd_dp_mux_macro__mux_pgdec__ports_8__stack_32l__width_32 mux_gsrasr  (
  .muxtst(tcu_muxtest_a_rep0),
  .din0(gsr0_mask_fx4[31:0]),
  .din1(gsr1_mask_fx4[31:0]),
  .din2(gsr2_mask_fx4[31:0]),
  .din3(gsr3_mask_fx4[31:0]),
  .din4(gsr4_mask_fx4[31:0]),
  .din5(gsr5_mask_fx4[31:0]),
  .din6(gsr6_mask_fx4[31:0]),
  .din7(gsr7_mask_fx4[31:0]),
  .sel (gsr_asr_tid_fx3[2:0]),
  .dout({fgd_gsr_asr_mask_fx4_b31, gsr_asr_mask_fx4[30:0]}),
  .test(test)
  );

// ------------------------------------
// fpack result const detection
// FPACK{16,32},FPACKFIX
// ------------------------------------

fgu_fgd_dp_zero_macro__width_32 pack_cmp3  (
 .din ({clip01_c3_fx4[30:0],shift01_fx4[63]}),
 .dout(pack_b01_gt255_fx4_)   // FPACK16:  bits [30:15] == 0, not >    255
 );                           // FPACK32:  bits [62:31] == 0, not >    255
                              // FPACKFIX: bits [62:31] == 0, not >  32767

fgu_fgd_dp_cmp_macro__width_32 packfix_cmp3  (
 .din0({clip01_c3_fx4[30:0],shift01_fx4[63]}),
 .din1(32'hffffffff),
 .dout(pack_b01_lt32768_fx4_) // FPACKFIX: bits [62:31] == 1, not < -32768
 ); 

fgu_fgd_dp_zero_macro__width_16 pack_cmp2  (
 .din ({clip01_c2_fx4[14:0],shift01_fx4[47]}),
 .dout(pack_b23_gt255_fx4_)   // FPACK16:  bits [30:15] == 0, not >    255
 );

fgu_fgd_dp_zero_macro__width_32 pack_cmp1  (
 .din ({clip01_c1_fx4[30:0],shift01_fx4[31]}),
 .dout(pack_b45_gt255_fx4_)   // FPACK16:  bits [30:15] == 0, not >    255
 );                           // FPACK32:  bits [62:31] == 0, not >    255
                              // FPACKFIX: bits [62:31] == 0, not >  32767

fgu_fgd_dp_cmp_macro__width_32 packfix_cmp1  (
 .din0({clip01_c1_fx4[30:0],shift01_fx4[31]}),
 .din1(32'hffffffff),
 .dout(pack_b45_lt32768_fx4_) // FPACKFIX: bits [62:31] == 1, not < -32768
 ); 

fgu_fgd_dp_zero_macro__width_16 pack_cmp0  (
 .din ({clip01_c0_fx4[14:0],shift01_fx4[15]}),
 .dout(pack_b67_gt255_fx4_)   // FPACK16:  bits [30:15] == 0, not >    255
 );

fgu_fgd_dp_inv_macro__width_8 ipackcmp  (  // 0in bits_on -max 1 -var {packfix_hi_gt32767_fx4, packfix_hi_lt32768_fx4}; bits_on -max 1 -var {packfix_lo_gt32767_fx4, packfix_lo_lt32768_fx4}
  .din ({pack_b01_gt255_fx4_,
         pack_b01_lt32768_fx4_,
         pack_b23_gt255_fx4_,
         pack_b45_gt255_fx4_,
         pack_b45_lt32768_fx4_,
         pack_b67_gt255_fx4_,
         rs2_fx4_b63,
         rs2_fx4_b31}),
  .dout({pack_b01_gt255_fx4,
         pack_b01_lt32768_fx4,
         pack_b23_gt255_fx4,
         pack_b45_gt255_fx4,
         pack_b45_lt32768_fx4,
         pack_b67_gt255_fx4,
         rs2_fx4_b63_,
         rs2_fx4_b31_})
  );

fgu_fgd_dp_and_macro__ports_3__width_2 packsela  (
  .din0({fgx_packfix_fx4,        fgx_packfix_fx4       }),
  .din1({rs2_fx4_b63,            rs2_fx4_b31           }),  // negative
  .din2({pack_b01_lt32768_fx4,   pack_b45_lt32768_fx4  }),
  .dout({packfix_hi_lt32768_fx4, packfix_lo_lt32768_fx4})
  );

fgu_fgd_dp_and_macro__ports_3__width_2 packselb  (
  .din0({fgx_packfix_fx4,        fgx_packfix_fx4       }),
  .din1({rs2_fx4_b63_,           rs2_fx4_b31_          }),  // positive
  .din2({pack_b01_gt255_fx4,     pack_b45_gt255_fx4    }),
  .dout({packfix_hi_gt32767_fx4, packfix_lo_gt32767_fx4})
  );

fgu_fgd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_2 packselc  ( 
  .din0({rs2_fx4_b15,      pack_b67_gt255_fx4}),
  .din1({rs2_fx4_b63,      pack_b01_gt255_fx4}),
  .sel0(fgx_pack16_fx4),
  .sel1(fgx_pack32_fx4),
  .dout({pack_b3_sign_fx4, pack_b3_gt255_fx4})
  );

// ------------------------------------
// fpack result data/const selection
// FPACK{16,32},FPACKFIX
//
// only FPACK32 64b result updates 32 LSBs
// FPACK16/FPACKFIX 32b result updates 32 MSBs
// ------------------------------------

fgu_fgd_dp_mux_macro__mux_aope__ports_7__width_8 pack_b0  ( 
  .din0(8'h80),               // portion of 16'h8000
  .din1(8'h7f),               // portion of 16'h7fff
  .din2(shift01_fx4[63:56]),  // portion of [63:48]
  .din3(rs1_fx4[55:48]),
  .din4(8'h00),
  .din5(8'hff),
  .din6(shift01_fx4[62:55]),
  .sel0(packfix_hi_lt32768_fx4),
  .sel1(packfix_hi_gt32767_fx4),
  .sel2(fgx_packfix_fx4),
  .sel3(fgx_pack32_fx4),
  .sel4(rs2_fx4_b63),         // negative
  .sel5(pack_b01_gt255_fx4),
  .dout(pack_result_fx4[63:56])
  );

fgu_fgd_dp_mux_macro__mux_aope__ports_7__width_8 pack_b1  ( 
  .din0(8'h00),               // portion of 16'h8000
  .din1(8'hff),               // portion of 16'h7fff
  .din2(shift01_fx4[55:48]),  // portion of [63:48]
  .din3(rs1_fx4[47:40]),
  .din4(8'h00),
  .din5(8'hff),
  .din6(shift01_fx4[46:39]),
  .sel0(packfix_hi_lt32768_fx4),
  .sel1(packfix_hi_gt32767_fx4),
  .sel2(fgx_packfix_fx4),
  .sel3(fgx_pack32_fx4),
  .sel4(rs2_fx4_b47),         // negative
  .sel5(pack_b23_gt255_fx4),
  .dout(pack_result_fx4[55:48])
  );

fgu_fgd_dp_mux_macro__mux_aope__ports_7__width_8 pack_b2  ( 
  .din0(8'h80),               // portion of 16'h8000
  .din1(8'h7f),               // portion of 16'h7fff
  .din2(shift01_fx4[31:24]),  // portion of [31:16]
  .din3(rs1_fx4[39:32]),
  .din4(8'h00),
  .din5(8'hff),
  .din6(shift01_fx4[30:23]),
  .sel0(packfix_lo_lt32768_fx4),
  .sel1(packfix_lo_gt32767_fx4),
  .sel2(fgx_packfix_fx4),
  .sel3(fgx_pack32_fx4),
  .sel4(rs2_fx4_b31),         // negative
  .sel5(pack_b45_gt255_fx4),
  .dout(pack_result_fx4[47:40])
  );

fgu_fgd_dp_mux_macro__mux_aope__ports_7__width_8 pack_b3  ( 
  .din0(8'h00),               // portion of 16'h8000
  .din1(8'hff),               // portion of 16'h7fff
  .din2(shift01_fx4[23:16]),  // portion of [31:16]
  .din3(8'h00),
  .din4(8'hff),
  .din5(shift01_fx4[62:55]),
  .din6(shift01_fx4[14:7]),
  .sel0(packfix_lo_lt32768_fx4),
  .sel1(packfix_lo_gt32767_fx4),
  .sel2(fgx_packfix_fx4),
  .sel3(pack_b3_sign_fx4),    // negative
  .sel4(pack_b3_gt255_fx4),
  .sel5(fgx_pack32_fx4),
  .dout(pack_result_fx4[39:32])
  );

fgu_fgd_dp_mux_macro__mux_aope__ports_3__width_8 pack_lo  ( 
  .din0(8'h00),
  .din1(8'hff),
  .din2(shift01_fx4[30:23]),
  .sel0(rs2_fx4_b31),         // negative
  .sel1(pack_b45_gt255_fx4),
  .dout(pack_result_fx4_b7_0[7:0])
  );

// ------------------------------------
// common PDIST,POPC backend (fx4)
// complete compression of 8 8-bit values (4 8-bit values remain),
// then add to rs3 if PDIST (rs3 arrives one cycle delayed on rs2)
// ------------------------------------

fgu_fgd_dp_csa42_macro__width_9 pdist_42csa_2  (
  .i0   ({      pdist_42csa_data_fx4[31:24], 1'b0              }),
  .i1   ({pdist_42csa_data_fx4[33], pdist_42csa_data_fx4[23:16]}),
  .i2   ({      pdist_42csa_data_fx4[15:8], 1'b0              }),
  .i3   ({pdist_42csa_data_fx4[32], pdist_42csa_data_fx4[7:0]}),
  .cin  ( 1'b0                         ),
  .cout ( pdist_42csa_cout2_fx4        ), 
  .carry( pdist_42csa_carry2_fx4[9:1]),
  .sum  ( pdist_42csa_sum2_fx4[8:0]  )  
  );

fgu_fgd_dp_csa32_macro__width_10 pdist_32csa  (
  .i0   ({                              pdist_rs3_fx3[9:0]}),
  .i1   ({               pdist_42csa_carry2_fx4[9:1], 1'b0}),
  .i2   ({pdist_42csa_cout2_fx4, pdist_42csa_sum2_fx4[8:0]}),
  .carry( pdist_32csa_carry_fx4[10:1]),
  .sum  ( pdist_32csa_sum_fx4[9:0]  )
  );

fgu_fgd_dp_and_macro__ports_2__width_1 pdist_and  (
  .din0(pdist_rs3_fx3[11]),
  .din1(fgx_pdist_fx4),
  .dout(q_pdist_rs3_fx3_b11) 
  );

fgu_fgd_dp_cla_macro__width_12 pdist_cla  (  // 0in maximum -val 64 -var {pdist_cout_fx4, pdist_sum_fx4[11:00]} -active (fgx_popc_fx4 & ~fgx_pdist_fx4)
  .din0({               1'b0,            pdist_32csa_carry_fx4[10:1], 1'b0}),
  .din1({q_pdist_rs3_fx3_b11, pdist_rs3_fx3[10], pdist_32csa_sum_fx4[9:0]}),
  .cin (1'b0),
  .dout(pdist_sum_fx4[11:0]),
  .cout(pdist_cout_fx4      )  // cout not possible if POPC (7-bit result max),
  );                           // cout not possible for any instr but pdist due to qual done on pdist_rs3_fx3[11]

// 0in custom -fire (pdist_cout_fx4 & ~fgx_pdist_fx4)

fgu_fgd_dp_increment_macro__width_64 pdist_inc  (
  .din ({rs201_fx3[63:12], 12'hfff}),
  .cin ( 1'b1                      ),
  .dout({pdist_sum_fx4[63:12], pdist_inc_unused[11:0]}),
  .cout( pdist_inc_unused[12]                         )
  );

// ------------------------------------
// FGD final result mux
// ------------------------------------

fgu_fgd_dp_msff_macro__mux_aope__ports_5__width_64 fx5_res  (
  .scan_in(fx5_res_scanin),
  .scan_out(fx5_res_scanout),
  .clk (l2clk),
  .en  (vis_clken),
  .din0({pack_result_fx4[63:32], rs1_fx4[23:0], pack_result_fx4_b7_0[7:0]}),
  .din1(pdist_sum_fx4[63:0]),
  .din2({rs201_fx3[63:12], pdist_sum_fx4[11:0]}),
  .din3({57'b0, pdist_sum_fx4[6:0]}),
  .din4(simp_result_fx4[63:0]),
  .sel0(fgx_pack_sel_fx4),  // FPACK16,FPACK32,FPACKFIX
  .sel1(pdist_cout_fx4  ),  // PDIST with cout from 12 LSBs
  .sel2(fgx_pdist_fx4   ),  // PDIST
  .sel3(fgx_popc_fx4    ),  // POPC
                            // else: other
  .dout(fgd_result_fx5[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ----------------------------------------------------------------------------
// FGU ASI local ring datapath
// - ASR GSR  access
// - ASR FPRS access
// - ASI FRF ECC access (read only)
// ----------------------------------------------------------------------------

fgu_fgd_dp_msff_macro__stack_32l__width_32 in_rng1_1f  (
  .scan_in(in_rng1_1f_scanin),
  .scan_out(in_rng1_1f_scanout),
  .clk (l2clk),
  .en  (coreon_clken),
  .din (in_rngl_cdbus[63:32]),  // requires free running clk or rng_data_1f[63] en
  .dout(in_rngl_cdbus_1f[63:32]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__stack_32l__width_32 in_rng0_1f  (
  .scan_in(in_rng0_1f_scanin),
  .scan_out(in_rng0_1f_scanout),
  .clk (l2clk),
  .en  (coreon_clken),
  .din (in_rngl_cdbus[31:0]),  // requires free running clk or rng_data_1f[63] en
  .dout(in_rngl_cdbus_1f[31:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__stack_32l__width_32 in_rng1_2f  (
  .scan_in(in_rng1_2f_scanin),
  .scan_out(in_rng1_2f_scanout),
  .clk (l2clk),
  .en  (asi_clken),
  .din (in_rngl_cdbus_1f[63:32]),
  .dout(in_rngl_cdbus_2f[63:32]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__stack_32l__width_32 in_rng0_2f  (
  .scan_in(in_rng0_2f_scanin),
  .scan_out(in_rng0_2f_scanout),
  .clk (l2clk),
  .en  (asi_clken),
  .din (in_rngl_cdbus_1f[31:0]),
  .dout(in_rngl_cdbus_2f[31:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__stack_32l__width_32 in_rng1_3f  (
  .scan_in(in_rng1_3f_scanin),
  .scan_out(in_rng1_3f_scanout),
  .clk (l2clk),
  .en  (asi_clken),
  .din (in_rngl_cdbus_2f[63:32]),
  .dout(in_rngl_cdbus_3f[63:32]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_msff_macro__stack_32l__width_32 in_rng0_3f  (
  .scan_in(in_rng0_3f_scanin),
  .scan_out(in_rng0_3f_scanout),
  .clk (l2clk),
  .en  (asi_clken),
  .din (in_rngl_cdbus_2f[31:0]),
  .dout(in_rngl_cdbus_3f[31:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fgd_dp_buff_macro__dbuff_48x__stack_32l__width_1 muxtest_b_rep0  (
  .din (tcu_muxtest	  ),
  .dout(tcu_muxtest_b_rep0)
  );

fgu_fgd_dp_mux_macro__mux_pgpe__ports_5__stack_32l__width_31 mux_rng1_3f  (
  .muxtst(tcu_muxtest_b_rep0),
  .din0({                            // ASR/ASI GSR/FPRS/FRF_ECC rd or wr   (ctl        )
         1'b1,                       //   set ack
         in_rngl_cdbus_3f[61:56],    //
         8'b0,                       //   clear ASI field (report no exceptions)
         in_rngl_cdbus_3f[47:32]}),  //
  .din1(gsr_asr_mask_fx4[30:0]),     // ASR GSR  read data                  (       data)
  .din2(31'b0),                      // ASR FPRS read data                  (       data)
  .din3(31'b0),                      // ASI FRF ECC read data               (       data)
  .din4(in_rngl_cdbus_3f[62:32]),    // bypass incoming ASI data unmodified (ctl or data)
  .sel0(fac_rng_rd_or_wr_3f),
  .sel1(fac_rng_rd_gsr_4f),
  .sel2(fac_rng_rd_fprs_4f),
  .sel3(fac_rng_rd_ecc_4f),
  .dout(fgd_rngl_cdbus_3f[62:32]),
  .test(test)
  );

fgu_fgd_dp_buff_macro__dbuff_48x__stack_32l__width_1 muxtest_c_rep0  (
  .din (tcu_muxtest	  ),
  .dout(tcu_muxtest_c_rep0)
  );

fgu_fgd_dp_mux_macro__mux_pgpe__ports_4__stack_32l__width_32 mux_rng0_3f  (
  .muxtst(tcu_muxtest_c_rep0),
  .din0({4'b0,                       // ASR GSR read data                   (       data)
         fpc_gsr_asr_11bits_fx4[10],
         fpc_gsr_asr_11bits_fx4[9:8],
         17'b0,
         fpc_gsr_asr_11bits_fx4[7:3],
         fpc_gsr_asr_11bits_fx4[2:0]}),
  .din1({29'b0, fac_rng_fprs[2:0]}), // ASR FPRS read data                  (       data)
  .din2({18'b0, fec_r1_ecc_fx1[13:0]}), // ASI FRF ECC read data            (       data)
  .din3(in_rngl_cdbus_3f[31:0]),     // bypass incoming ASI data unmodified (ctl or data)
                                     // OR
                                     // ASR/ASI GSR/FPRS/FRF_ECC rd or wr   (ctl        )
  .sel0(fac_rng_rd_gsr_4f),
  .sel1(fac_rng_rd_fprs_4f),
  .sel2(fac_rng_rd_ecc_4f),
  .dout(fgd_rngl_cdbus_3f[31:0]),
  .test(test)
  );


// fixscan start:
assign fx2_rs1_scanin            = scan_in                  ;
assign fx2_rs2_scanin            = fx2_rs1_scanout          ;
assign fx2_gsr_scanin            = fx2_rs2_scanout          ;
assign fx3_rs1_scanin            = fx2_gsr_scanout          ;
assign fx3_rs2_scanin            = fx3_rs1_scanout          ;
assign fx3_gsr_mask_scanin       = fx3_rs2_scanout          ;
assign fx3_popc_scanin           = fx3_gsr_mask_scanout     ;
assign fx3_ctl_scanin            = fx3_popc_scanout         ;
assign fx4_simp_scanin           = fx3_ctl_scanout          ;
assign fx4_rs1_scanin            = fx4_simp_scanout         ;
assign fx4_shift_scanin          = fx4_rs1_scanout          ;
assign fx4_clipa_scanin          = fx4_shift_scanout        ;
assign fx4_clipb_scanin          = fx4_clipa_scanout        ;
assign fx4_pdist_scanin          = fx4_clipb_scanout        ;
assign fx4_gsrtid_scanin         = fx4_pdist_scanout        ;
assign fx5_res_scanin            = fx4_gsrtid_scanout       ;
assign in_rng1_1f_scanin         = fx5_res_scanout          ;
assign in_rng0_1f_scanin         = in_rng1_1f_scanout       ;
assign in_rng1_2f_scanin         = in_rng0_1f_scanout       ;
assign in_rng0_2f_scanin         = in_rng1_2f_scanout       ;
assign in_rng1_3f_scanin         = in_rng0_2f_scanout       ;
assign in_rng0_3f_scanin         = in_rng1_3f_scanout       ;
assign scan_out                  = in_rng0_3f_scanout       ;

assign fx4_gsr0mask_wmr_scanin   = wmr_scan_in              ;
assign fx4_gsr1mask_wmr_scanin   = fx4_gsr0mask_wmr_scanout ;
assign fx4_gsr2mask_wmr_scanin   = fx4_gsr1mask_wmr_scanout ;
assign fx4_gsr3mask_wmr_scanin   = fx4_gsr2mask_wmr_scanout ;
assign fx4_gsr4mask_wmr_scanin   = fx4_gsr3mask_wmr_scanout ;
assign fx4_gsr5mask_wmr_scanin   = fx4_gsr4mask_wmr_scanout ;
assign fx4_gsr6mask_wmr_scanin   = fx4_gsr5mask_wmr_scanout ;
assign fx4_gsr7mask_wmr_scanin   = fx4_gsr6mask_wmr_scanout ;
assign wmr_scan_out              = fx4_gsr7mask_wmr_scanout ;
// fixscan end:
endmodule  // fgu_fgd_dp


//
//   buff macro
//
//





module fgu_fgd_dp_buff_macro__dbuff_32x__rep_1__width_4 (
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

module fgu_fgd_dp_msff_macro__width_64 (
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

module fgu_fgd_dp_msff_macro__stack_32l__width_32 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fgd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [11:0] din0;
  input sel0;
  input [11:0] din1;
  input sel1;
  output [11:0] dout;





mux2s #(12)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[11:0]),
  .in1(din1[11:0]),
.dout(dout[11:0])
);









  



endmodule


//
//           4:2 Carry Save Adder
//
//
//     i0 i1 i2 i3 | co | carry  sum
//     ------------|----|-----------
//      0  0  0  0 |  0 |   0    cin
//      0  0  0  1 |  0 |  cin  ~cin
//      0  0  1  0 |  0 |  cin  ~cin
//      0  0  1  1 |  0 |   1    cin
//   
//      0  1  0  0 |  0 |  cin  ~cin
//      0  1  0  1 |  0 |   1    cin
//      0  1  1  0 |  1 |   0    cin
//      0  1  1  1 |  1 |  cin  ~cin
//   
//      1  0  0  0 |  0 |  cin  ~cin
//      1  0  0  1 |  0 |   1    cin
//      1  0  1  0 |  1 |   0    cin
//      1  0  1  1 |  1 |  cin  ~cin
//   
//      1  1  0  0 |  1 |   0    cin
//      1  1  0  1 |  1 |  cin  ~cin
//      1  1  1  0 |  1 |  cin  ~cin
//      1  1  1  1 |  1 |   1    cin


// This circuit looks like a compression of 5 terms down
// to 3 term on an individual bit basis.  However, the fast
// output "co" from bit position "n" is actually the late input
// "cin" on bit position "n+1".  Once a wrapper is written
// around multiple bits, this circuit will give the 
// appearance of compressing 4 inputs down to 2 outputs.





// any PARAMS parms go into naming of macro


module fgu_fgd_dp_csa42_macro__width_1 (
  i0, 
  i1, 
  i2, 
  i3, 
  cin, 
  cout, 
  carry, 
  sum);
  input  [0:0]    i0;
  input  [0:0]    i1;
  input  [0:0]    i2;
  input  [0:0]    i3;
  input              cin;
  output             cout;
  output [0:0]    carry;
  output [0:0]    sum;






csa42 #(1)  d0_0 (
.cin(cin),
.in0(i0[0:0]),
.in1(i1[0:0]),
.in2(i2[0:0]),
.in3(i3[0:0]),
.cout(cout),
.carry(carry[0:0]),
.sum(sum[0:0])
);








endmodule




//
//   cla macro
//
//





module fgu_fgd_dp_cla_macro__width_4 (
  cin, 
  din0, 
  din1, 
  dout, 
  cout);
  input cin;
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;
  output cout;







cla #(4)  m0_0 (
.cin(cin),
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0]),
.cout(cout)
);












endmodule





//
//   buff macro
//
//





module fgu_fgd_dp_buff_macro__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule









// any PARAMS parms go into naming of macro

module fgu_fgd_dp_msff_macro__minbuff_1__width_64 (
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

module fgu_fgd_dp_msff_macro__width_32 (
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













// any PARAMS parms go into naming of macro

module fgu_fgd_dp_msff_macro__width_33 (
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
wire [31:0] so;

  input [32:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [32:0] dout;


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
dff #(33)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[32:0]),
.si({scan_in,so[31:0]}),
.so({so[31:0],scan_out}),
.q(dout[32:0])
);




















endmodule









//
//   invert macro
//
//





module fgu_fgd_dp_inv_macro__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






inv #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);









endmodule





//
//   buff macro
//
//





module fgu_fgd_dp_buff_macro__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






buff #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);








endmodule





//
//   nand macro for ports = 2,3,4
//
//





module fgu_fgd_dp_nand_macro__ports_3__width_64 (
  din0, 
  din1, 
  din2, 
  dout);
  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  output [63:0] dout;






nand3 #(64)  d0_0 (
.in0(din0[63:0]),
.in1(din1[63:0]),
.in2(din2[63:0]),
.out(dout[63:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module fgu_fgd_dp_nand_macro__ports_4__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  dout);
  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  output [63:0] dout;






nand4 #(64)  d0_0 (
.in0(din0[63:0]),
.in1(din1[63:0]),
.in2(din2[63:0]),
.in3(din3[63:0]),
.out(dout[63:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fgd_dp_mux_macro__mux_aodec__ports_8__width_8 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [7:0] din0;
  input [7:0] din1;
  input [7:0] din2;
  input [7:0] din3;
  input [7:0] din4;
  input [7:0] din5;
  input [7:0] din6;
  input [7:0] din7;
  input [2:0] sel;
  output [7:0] dout;





cl_dp1_pdec8_8x  c0_0 (
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

mux8s #(8)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[7:0]),
  .in1(din1[7:0]),
  .in2(din2[7:0]),
  .in3(din3[7:0]),
  .in4(din4[7:0]),
  .in5(din5[7:0]),
  .in6(din6[7:0]),
  .in7(din7[7:0]),
.dout(dout[7:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fgd_dp_mux_macro__mux_pgpe__ports_2__width_8 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [7:0] din0;
  input [7:0] din1;
  input sel0;
  output [7:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(8)  d0_0 (
  .sel(psel1),
  .in0(din0[7:0]),
  .in1(din1[7:0]),
.dout(dout[7:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fgd_dp_mux_macro__mux_aodec__ports_8__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  input [63:0] din4;
  input [63:0] din5;
  input [63:0] din6;
  input [63:0] din7;
  input [2:0] sel;
  output [63:0] dout;





cl_dp1_pdec8_8x  c0_0 (
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

mux8s #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
  .in5(din5[63:0]),
  .in6(din6[63:0]),
  .in7(din7[63:0]),
.dout(dout[63:0])
);









  



endmodule


//
//   xnor macro for ports = 2,3
//
//





module fgu_fgd_dp_xnor_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






xnor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule





//
//   nor macro for ports = 2,3
//
//





module fgu_fgd_dp_nor_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule









// any PARAMS parms go into naming of macro

module fgu_fgd_dp_msff_macro__mux_aope__ports_6__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  sel4, 
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
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;


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




cl_dp1_penc6_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .sel4(sel4),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5)
);

mux6s #(64)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
  .in5(din5[63:0]),
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
//   invert macro
//
//





module fgu_fgd_dp_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module fgu_fgd_dp_nand_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nand2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fgd_dp_mux_macro__mux_aope__ports_2__width_32 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [31:0] din0;
  input [31:0] din1;
  input sel0;
  output [31:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(32)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
.dout(dout[31:0])
);









  



endmodule


//  
//   and macro for ports = 2,3,4
//
//





module fgu_fgd_dp_and_macro__ports_2__width_12 (
  din0, 
  din1, 
  dout);
  input [11:0] din0;
  input [11:0] din1;
  output [11:0] dout;






and2 #(12)  d0_0 (
.in0(din0[11:0]),
.in1(din1[11:0]),
.out(dout[11:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_16 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [15:0] din0;
  input [15:0] din1;
  input [15:0] din2;
  input [15:0] din3;
  input [1:0] sel;
  output [15:0] dout;





cl_dp1_pdec4_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(16)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[15:0]),
  .in1(din1[15:0]),
  .in2(din2[15:0]),
  .in3(din3[15:0]),
.dout(dout[15:0])
);









  



endmodule


//  
//   and macro for ports = 2,3,4
//
//





module fgu_fgd_dp_and_macro__ports_2__width_3 (
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





//  
//   and macro for ports = 2,3,4
//
//





module fgu_fgd_dp_and_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fgd_dp_mux_macro__mux_aope__ports_2__width_16 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [15:0] din0;
  input [15:0] din1;
  input sel0;
  output [15:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(16)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[15:0]),
  .in1(din1[15:0]),
.dout(dout[15:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_28 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [27:0] din0;
  input [27:0] din1;
  input [27:0] din2;
  input [27:0] din3;
  input [1:0] sel;
  output [27:0] dout;





cl_dp1_pdec4_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(28)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[27:0]),
  .in1(din1[27:0]),
  .in2(din2[27:0]),
  .in3(din3[27:0]),
.dout(dout[27:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_31 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [30:0] din0;
  input [30:0] din1;
  input [30:0] din2;
  input [30:0] din3;
  input [1:0] sel;
  output [30:0] dout;





cl_dp1_pdec4_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(31)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[30:0]),
  .in1(din1[30:0]),
  .in2(din2[30:0]),
  .in3(din3[30:0]),
.dout(dout[30:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_12 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [11:0] din0;
  input [11:0] din1;
  input [11:0] din2;
  input [11:0] din3;
  input [1:0] sel;
  output [11:0] dout;





cl_dp1_pdec4_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(12)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[11:0]),
  .in1(din1[11:0]),
  .in2(din2[11:0]),
  .in3(din3[11:0]),
.dout(dout[11:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fgd_dp_mux_macro__mux_aodec__ports_4__width_15 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [14:0] din0;
  input [14:0] din1;
  input [14:0] din2;
  input [14:0] din3;
  input [1:0] sel;
  output [14:0] dout;





cl_dp1_pdec4_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(15)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[14:0]),
  .in1(din1[14:0]),
  .in2(din2[14:0]),
  .in3(din3[14:0]),
.dout(dout[14:0])
);









  



endmodule


//
//   cla macro
//
//





module fgu_fgd_dp_cla_macro__width_8 (
  cin, 
  din0, 
  din1, 
  dout, 
  cout);
  input cin;
  input [7:0] din0;
  input [7:0] din1;
  output [7:0] dout;
  output cout;







cla #(8)  m0_0 (
.cin(cin),
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout[7:0]),
.cout(cout)
);












endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fgd_dp_mux_macro__mux_aope__ports_3__width_8 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [7:0] din0;
  input [7:0] din1;
  input [7:0] din2;
  input sel0;
  input sel1;
  output [7:0] dout;





cl_dp1_penc3_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(8)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[7:0]),
  .in1(din1[7:0]),
  .in2(din2[7:0]),
.dout(dout[7:0])
);









  



endmodule


//
//           4:2 Carry Save Adder
//
//
//     i0 i1 i2 i3 | co | carry  sum
//     ------------|----|-----------
//      0  0  0  0 |  0 |   0    cin
//      0  0  0  1 |  0 |  cin  ~cin
//      0  0  1  0 |  0 |  cin  ~cin
//      0  0  1  1 |  0 |   1    cin
//   
//      0  1  0  0 |  0 |  cin  ~cin
//      0  1  0  1 |  0 |   1    cin
//      0  1  1  0 |  1 |   0    cin
//      0  1  1  1 |  1 |  cin  ~cin
//   
//      1  0  0  0 |  0 |  cin  ~cin
//      1  0  0  1 |  0 |   1    cin
//      1  0  1  0 |  1 |   0    cin
//      1  0  1  1 |  1 |  cin  ~cin
//   
//      1  1  0  0 |  1 |   0    cin
//      1  1  0  1 |  1 |  cin  ~cin
//      1  1  1  0 |  1 |  cin  ~cin
//      1  1  1  1 |  1 |   1    cin


// This circuit looks like a compression of 5 terms down
// to 3 term on an individual bit basis.  However, the fast
// output "co" from bit position "n" is actually the late input
// "cin" on bit position "n+1".  Once a wrapper is written
// around multiple bits, this circuit will give the 
// appearance of compressing 4 inputs down to 2 outputs.





// any PARAMS parms go into naming of macro


module fgu_fgd_dp_csa42_macro__width_8 (
  i0, 
  i1, 
  i2, 
  i3, 
  cin, 
  cout, 
  carry, 
  sum);
  input  [7:0]    i0;
  input  [7:0]    i1;
  input  [7:0]    i2;
  input  [7:0]    i3;
  input              cin;
  output             cout;
  output [7:0]    carry;
  output [7:0]    sum;






csa42 #(8)  d0_0 (
.cin(cin),
.in0(i0[7:0]),
.in1(i1[7:0]),
.in2(i2[7:0]),
.in3(i3[7:0]),
.cout(cout),
.carry(carry[7:0]),
.sum(sum[7:0])
);








endmodule








// any PARAMS parms go into naming of macro

module fgu_fgd_dp_msff_macro__width_48 (
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
wire [46:0] so;

  input [47:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [47:0] dout;


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
dff #(48)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[47:0]),
.si({scan_in,so[46:0]}),
.so({so[46:0],scan_out}),
.q(dout[47:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fgd_dp_msff_macro__width_50 (
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
wire [48:0] so;

  input [49:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [49:0] dout;


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
dff #(50)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[49:0]),
.si({scan_in,so[48:0]}),
.so({so[48:0],scan_out}),
.q(dout[49:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fgd_dp_msff_macro__width_62 (
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
wire [60:0] so;

  input [61:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [61:0] dout;


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
dff #(62)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[61:0]),
.si({scan_in,so[60:0]}),
.so({so[60:0],scan_out}),
.q(dout[61:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fgd_dp_msff_macro__width_37 (
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
wire [35:0] so;

  input [36:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [36:0] dout;


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
dff #(37)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[36:0]),
.si({scan_in,so[35:0]}),
.so({so[35:0],scan_out}),
.q(dout[36:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fgd_dp_msff_macro__width_34 (
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
wire [32:0] so;

  input [33:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [33:0] dout;


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
dff #(34)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[33:0]),
.si({scan_in,so[32:0]}),
.so({so[32:0],scan_out}),
.q(dout[33:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fgd_dp_msff_macro__stack_32l__width_6 (
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
wire [4:0] so;

  input [5:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [5:0] dout;


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
dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fgd_dp_msff_macro__mux_aope__ports_2__stack_32l__width_32 (
  din0, 
  din1, 
  sel0, 
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
wire [31:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [30:0] so;

  input [31:0] din0;
  input [31:0] din1;
  input sel0;


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




cl_dp1_penc2_8x  c1_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(32)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
.dout(muxout[31:0])
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
dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fgd_dp_mux_macro__mux_aodec__ports_8__stack_32l__width_32 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [31:0] din0;
  input [31:0] din1;
  input [31:0] din2;
  input [31:0] din3;
  input [31:0] din4;
  input [31:0] din5;
  input [31:0] din6;
  input [31:0] din7;
  input [2:0] sel;
  output [31:0] dout;





cl_dp1_pdec8_8x  c0_0 (
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

mux8s #(32)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
  .in3(din3[31:0]),
  .in4(din4[31:0]),
  .in5(din5[31:0]),
  .in6(din6[31:0]),
  .in7(din7[31:0]),
.dout(dout[31:0])
);









  



endmodule


//
//   buff macro
//
//





module fgu_fgd_dp_buff_macro__stack_32l__width_32 (
  din, 
  dout);
  input [31:0] din;
  output [31:0] dout;






buff #(32)  d0_0 (
.in(din[31:0]),
.out(dout[31:0])
);








endmodule





//
//   buff macro
//
//





module fgu_fgd_dp_buff_macro__dbuff_48x__stack_32l__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fgd_dp_mux_macro__mux_pgdec__ports_8__stack_32l__width_32 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [31:0] din0;
  input [31:0] din1;
  input [31:0] din2;
  input [31:0] din3;
  input [31:0] din4;
  input [31:0] din5;
  input [31:0] din6;
  input [31:0] din7;
  input [2:0] sel;
  input muxtst;
  input test;
  output [31:0] dout;





cl_dp1_pdec8_8x  c0_0 (
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
 .psel7(psel7),
  .test(test)
);

mux8 #(32)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
  .in3(din3[31:0]),
  .in4(din4[31:0]),
  .in5(din5[31:0]),
  .in6(din6[31:0]),
  .in7(din7[31:0]),
.dout(dout[31:0]),
  .muxtst(muxtst)
);









  



endmodule


//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module fgu_fgd_dp_zero_macro__width_32 (
  din, 
  dout);
  input [31:0] din;
  output dout;






zero #(32)  m0_0 (
.in(din[31:0]),
.out(dout)
);










endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module fgu_fgd_dp_cmp_macro__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output dout;






cmp #(32)  m0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout)
);










endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module fgu_fgd_dp_zero_macro__width_16 (
  din, 
  dout);
  input [15:0] din;
  output dout;






zero #(16)  m0_0 (
.in(din[15:0]),
.out(dout)
);










endmodule





//
//   invert macro
//
//





module fgu_fgd_dp_inv_macro__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






inv #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module fgu_fgd_dp_and_macro__ports_3__width_2 (
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

module fgu_fgd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_2 (
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


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fgd_dp_mux_macro__mux_aope__ports_7__width_8 (
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
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;

  input [7:0] din0;
  input [7:0] din1;
  input [7:0] din2;
  input [7:0] din3;
  input [7:0] din4;
  input [7:0] din5;
  input [7:0] din6;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input sel5;
  output [7:0] dout;





cl_dp1_penc7_8x  c0_0 (
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

mux7s #(8)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .in0(din0[7:0]),
  .in1(din1[7:0]),
  .in2(din2[7:0]),
  .in3(din3[7:0]),
  .in4(din4[7:0]),
  .in5(din5[7:0]),
  .in6(din6[7:0]),
.dout(dout[7:0])
);









  



endmodule


//
//           4:2 Carry Save Adder
//
//
//     i0 i1 i2 i3 | co | carry  sum
//     ------------|----|-----------
//      0  0  0  0 |  0 |   0    cin
//      0  0  0  1 |  0 |  cin  ~cin
//      0  0  1  0 |  0 |  cin  ~cin
//      0  0  1  1 |  0 |   1    cin
//   
//      0  1  0  0 |  0 |  cin  ~cin
//      0  1  0  1 |  0 |   1    cin
//      0  1  1  0 |  1 |   0    cin
//      0  1  1  1 |  1 |  cin  ~cin
//   
//      1  0  0  0 |  0 |  cin  ~cin
//      1  0  0  1 |  0 |   1    cin
//      1  0  1  0 |  1 |   0    cin
//      1  0  1  1 |  1 |  cin  ~cin
//   
//      1  1  0  0 |  1 |   0    cin
//      1  1  0  1 |  1 |  cin  ~cin
//      1  1  1  0 |  1 |  cin  ~cin
//      1  1  1  1 |  1 |   1    cin


// This circuit looks like a compression of 5 terms down
// to 3 term on an individual bit basis.  However, the fast
// output "co" from bit position "n" is actually the late input
// "cin" on bit position "n+1".  Once a wrapper is written
// around multiple bits, this circuit will give the 
// appearance of compressing 4 inputs down to 2 outputs.





// any PARAMS parms go into naming of macro


module fgu_fgd_dp_csa42_macro__width_9 (
  i0, 
  i1, 
  i2, 
  i3, 
  cin, 
  cout, 
  carry, 
  sum);
  input  [8:0]    i0;
  input  [8:0]    i1;
  input  [8:0]    i2;
  input  [8:0]    i3;
  input              cin;
  output             cout;
  output [8:0]    carry;
  output [8:0]    sum;






csa42 #(9)  d0_0 (
.cin(cin),
.in0(i0[8:0]),
.in1(i1[8:0]),
.in2(i2[8:0]),
.in3(i3[8:0]),
.cout(cout),
.carry(carry[8:0]),
.sum(sum[8:0])
);








endmodule




//
//      3:2 Carry Save Adder
//
//




// any PARAMS parms go into naming of macro


module fgu_fgd_dp_csa32_macro__width_10 (
  i0, 
  i1, 
  i2, 
  carry, 
  sum);
  input  [9:0] i0;
  input  [9:0] i1;
  input  [9:0] i2;
  output [9:0] carry;
  output [9:0] sum;






csa32 #(10)  d0_0 (
.in0(i0[9:0]),
.in1(i1[9:0]),
.in2(i2[9:0]),
.carry(carry[9:0]),
.sum(sum[9:0])
);









endmodule


//
//   cla macro
//
//





module fgu_fgd_dp_cla_macro__width_12 (
  cin, 
  din0, 
  din1, 
  dout, 
  cout);
  input cin;
  input [11:0] din0;
  input [11:0] din1;
  output [11:0] dout;
  output cout;







cla #(12)  m0_0 (
.cin(cin),
.in0(din0[11:0]),
.in1(din1[11:0]),
.out(dout[11:0]),
.cout(cout)
);












endmodule





//
//   increment macro 
//
//





module fgu_fgd_dp_increment_macro__width_64 (
  din, 
  cin, 
  dout, 
  cout);
  input [63:0] din;
  input cin;
  output [63:0] dout;
  output cout;






incr #(64)  m0_0 (
.cin(cin),
.in(din[63:0]),
.out(dout[63:0]),
.cout(cout)
);











endmodule









// any PARAMS parms go into naming of macro

module fgu_fgd_dp_msff_macro__mux_aope__ports_5__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
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
  input sel0;
  input sel1;
  input sel2;
  input sel3;


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




cl_dp1_penc5_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4)
);

mux5s #(64)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fgd_dp_mux_macro__mux_pgpe__ports_5__stack_32l__width_31 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;

  input [30:0] din0;
  input [30:0] din1;
  input [30:0] din2;
  input [30:0] din3;
  input [30:0] din4;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input muxtst;
  input test;
  output [30:0] dout;





cl_dp1_penc5_8x  c0_0 (
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
  .test(test)
);

mux5 #(31)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .in0(din0[30:0]),
  .in1(din1[30:0]),
  .in2(din2[30:0]),
  .in3(din3[30:0]),
  .in4(din4[30:0]),
.dout(dout[30:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fgd_dp_mux_macro__mux_pgpe__ports_4__stack_32l__width_32 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel0, 
  sel1, 
  sel2, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [31:0] din0;
  input [31:0] din1;
  input [31:0] din2;
  input [31:0] din3;
  input sel0;
  input sel1;
  input sel2;
  input muxtst;
  input test;
  output [31:0] dout;





cl_dp1_penc4_8x  c0_0 (
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
  .test(test)
);

mux4 #(32)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
  .in3(din3[31:0]),
.dout(dout[31:0]),
  .muxtst(muxtst)
);









  



endmodule

