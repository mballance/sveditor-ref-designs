// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fgu_fpf_dp.v
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
module fgu_fpf_dp (
  fad_rs1_fmt_fx1, 
  fad_rs2_fmt_fx1, 
  fad_rs1_fx1, 
  fad_rs2_fx1, 
  fad_r1_odd32b_fx1, 
  fad_fsr_tem_fx1_b4, 
  fpf_w1_result_fb, 
  fgu_exu_result_fx5, 
  fgd_result_fx5, 
  fpc_int_res_sel_fx4, 
  fpc_vis_cmp_result_fx5, 
  fpc_result_sel_fx5, 
  fpc_ovf_if_rcout_fx5, 
  fpc_ma_fmt_sel_fx4, 
  fpc_int_sel_fx5, 
  fpc_fconst_sel_fx5, 
  fpc_fp_cin00_fx2, 
  fpc_cin00_fx2, 
  fpc_cin16_48_fx2, 
  fpc_cin32_fx2, 
  fpc_prop16_48_fx2, 
  fpc_prop32_fx2, 
  fpc_mle_sel_fx2, 
  fpc_mse_sel_fx2, 
  fpc_sign_fx5, 
  fpc_sign_fb, 
  fpc_sp_dest_fx4, 
  fpc_fadd_eac_enable_fx2, 
  fpc_i2f_sel_fx1, 
  fpc_rinc_sel_fx5, 
  fpc_qthenan_fx4, 
  fpc_den2nor_sp_fb, 
  fpc_den2nor_dp_fb, 
  fpf_b_gteq_a_fx2, 
  fpf_b_eq_a_fx2, 
  fpf_hi_aof_fx1, 
  fpf_hi_bof_fx1, 
  fpf_lo_aof_fx1, 
  fpf_lo_bof_fx1, 
  fpf_azf0_fx1, 
  fpf_bzf0_fx1, 
  fpf_aoe0_fx1, 
  fpf_boe0_fx1, 
  fpf_aze0_fx1, 
  fpf_bze0_fx1, 
  fpf_ma_sum_fx4, 
  fpf_ma_cout_fx4, 
  fpf_cmp_swap_blta_fx2, 
  fpf_align_sticky_fx4_l, 
  fpf_byte_unsure_x_sp_fx3, 
  fpf_byte_unsure_x_dp_fx3, 
  fic_norm_eadj_fx5, 
  fic_i2f_align_sel_fx2, 
  fpf_rs2_cmp_din_fx1, 
  fpf_man_se_byte_fx3_b38_32, 
  fpf_man_se_byte_fx3_b6_0, 
  fgu_cmp_fcc_fx3, 
  fgu_cmp_fcc_vld_fx3, 
  fac_tlu_flush_fx3, 
  fac_fpx_sp_dest_fx1, 
  fac_fpx_sp_src_fx1, 
  fac_pre_fcc_vld_fx2, 
  fac_fcmpe_fx1, 
  fac_rs2_rotate_sel_e, 
  fac_i2f_sel_e, 
  fac_force_swap_blta_fx1, 
  fac_force_noswap_blta_fx1, 
  main_clken, 
  fgu_mul_result_fx5, 
  fpy_fp_result_fx4_b63, 
  fdc_finish_int_early, 
  fdd_result, 
  fpf_sa_xor_sb_fx1, 
  fpe_exp_res_fb, 
  fpe_align_sel_fx2, 
  fpf_rcout_fx5, 
  fpf_rcout_fb, 
  fpf_implied_bit_fx5, 
  fec_w1_ecc_inject_fb, 
  fpf_w1_synd_fb, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_dectest, 
  tcu_muxtest, 
  tcu_scan_en, 
  scan_out);
wire stop;
wire test;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire [63:32] rs1_cmp_din_fx1;
wire fad_rs20_fx1_b63;
wire fad_rs20_fx1_b31;
wire [4:0] rs2_rotate_sel_fx1;
wire [63:0] rs2_cmp_din_fx1;
wire [63:0] rs1_cmp_din_fx1_;
wire fac_force_swap_blta_fx1_;
wire [15:0] cmp_bma3_unused;
wire cmp_bma_cout3_fx1;
wire [15:0] cmp_bma2_unused;
wire cmp_bma_cout2_fx1;
wire [15:0] cmp_bma1_unused;
wire cmp_bma_cout1_fx1;
wire [15:0] cmp_bma0_unused;
wire cmp_bma_cout0_fx1;
wire cmp_eq3_fx1;
wire cmp_eq2_fx1;
wire cmp_eq1_fx1;
wire cmp_eq0_fx1;
wire [2:0] cmp_i0_fx1;
wire cmp_eq30_fx1;
wire [2:0] cmp_i1_fx1;
wire cmp_swap_blta_fx1;
wire q_sign_beqa_fx1;
wire [1:0] cmp_i3_fx1;
wire cmp_i4_fx1;
wire cmp_beqa_fx1;
wire azf_fx1;
wire bzf_fx1;
wire bze_fx1;
wire boe_fx1;
wire aze_fx1;
wire aoe_fx1;
wire fpf_azf0_fx1_;
wire fpf_bzf0_fx1_;
wire fac_fpx_sp_src_fx1_;
wire fad_rs1_fmt_fx1_b62_;
wire fad_rs2_fmt_fx1_b62_;
wire [54:52] rs2_exp_qual1_fx1;
wire [54:52] rs1_exp_qual1_fx1;
wire [54:52] rs2_exp_qual0_fx1;
wire [54:52] rs1_exp_qual0_fx1;
wire i_rs1_snan_src_fx1;
wire i_rs2_snan_src_fx1;
wire nan_src_fx1;
wire snan_src_fx1;
wire zero_eq_zero_fx1_;
wire cmp_swap_blta_fx1_;
wire fcmpe_fx1_;
wire [63:63] fpf_rs2_cmp_din_fx1_;
wire cmp_i7_1_fx1;
wire cmp_i8_fx1;
wire cmp_i7_0_fx1;
wire cmp_blta_fx1;
wire cmp_bgta_fx1;
wire fx2_swp_le_scanin;
wire fx2_swp_le_scanout;
wire [63:0] man_le_fx2;
wire fx2_swp_se_scanin;
wire fx2_swp_se_scanout;
wire [63:0] man_se_fx2;
wire fx2_fcc_scanin;
wire fx2_fcc_scanout;
wire [1:0] i2f_sel_fx1;
wire nan_src_fx2;
wire cmp_blta_fx2;
wire cmp_bgta_fx2;
wire zero_eq_zero_fx2_;
wire fcmpe_fx2_;
wire snan_src_fx2;
wire fsr_tem_nvm_fx2;
wire fcmpe_fx2;
wire [3:0] i2f_sel_fx2;
wire sp_dest_fx2;
wire [1:0] fcc_fx2;
wire fcmp_nv_trap_fx2_;
wire fcmpe_nv_trap_fx2_;
wire v9cmp_nv_trap_fx2;
wire [63:0] man_se_byte_fx2;
wire [6:0] man_se_byte_fx2_;
wire [55:0] man_se_fx2_;
wire [6:0] q_man_se_byte_fx2;
wire [55:0] q_man_se_fx2;
wire [5:0] asel_i0_fx2;
wire [5:0] asel_i1_fx2;
wire [5:0] merged_align_sel_fx2;
wire tcu_muxtest_b_rep0;
wire [63:0] man_se_bit_fx2;
wire [63:40] q2_man_se_fx2;
wire [44:38] q2_man_se_byte_fx2;
wire [52:0] man_se_byte_sticky_fx2;
wire [1:0] byte_unsure_x_sp_fx2;
wire [1:0] byte_unsure_x_dp_fx2;
wire tcu_muxtest_c_rep0;
wire [13:0] man_se_bit_sticky_fx2;
wire add_byte_sticky_fx2_l;
wire fx3_mle_scanin;
wire fx3_mle_scanout;
wire [63:0] man_le_fx3;
wire fx3_mse_scanin;
wire fx3_mse_scanout;
wire [63:0] man_se_bit_fx3;
wire fx3_fcc_scanin;
wire fx3_fcc_scanout;
wire ma_cout_fx3;
wire prop32_fx3;
wire align_sticky_fx3_l;
wire fadd_eac_enable_fx3;
wire fp_cin00_fx3;
wire cin00_fx3;
wire cin16_48_fx3;
wire cin32_fx3;
wire prop16_48_fx3;
wire prop32_fx4;
wire mle_sel_fx3;
wire [2:0] mse_sel_fx3;
wire [3:0] pre_fcc_vld_fx3;
wire v9cmp_nv_trap_fx3;
wire add_byte_sticky_fx3_l;
wire [13:0] man_se_bit_sticky_fx3;
wire v9cmp_nv_trap_fx3_;
wire fac_tlu_flush_fx3_;
wire [63:0] man_se_bit_fx3_;
wire [63:0] final_man_le_fx3;
wire tcu_muxtest_d_rep0;
wire [63:0] final_man_se_fx3;
wire final_fp_cin00_fx3;
wire ma16_cout07_fx3;
wire final_cin16_48_i0_fx3;
wire ma16_cout47_fx3;
wire final_cin16_48_i2_fx3;
wire final_cin16_48_i1_fx3;
wire final_cin16_48_i3_fx3;
wire final_cin16_fx3;
wire final_cin48_fx3;
wire [63:0] ma16_sum_fx3;
wire ma16_cout31_unused;
wire ma16_cout63_unused;
wire [63:0] ma64_sum_fx3;
wire fx4_ma64_sum_scanin;
wire fx4_ma64_sum_scanout;
wire fx4_ma16_sum_scanin;
wire fx4_ma16_sum_scanout;
wire [63:0] ma16_sum_fx4;
wire [63:0] final_ma_sum_fx4;
wire [62:62] ma_sum_quiet_fx4;
wire fx5_sum_scanin;
wire fx5_sum_scanout;
wire [63:0] ma_sum_fx5;
wire fx5_ma_fmt_sel_scanin;
wire fx5_ma_fmt_sel_scanout;
wire [5:0] int_res_sel_fx5;
wire [4:0] ma_fmt_sel_fx5;
wire fp_result_fx5_b63;
wire sp_dest_fx5;
wire tcu_muxtest_e_rep0;
wire [63:0] unnorm_inter_res_fx5;
wire tcu_muxtest_f_rep0;
wire [39:11] pad_inc_fx5;
wire tcu_muxtest_g_rep0;
wire [62:4] norm_byte_fx5;
wire tcu_muxtest_h_rep0;
wire [62:11] norm_bit_fx5;
wire [10:0] minc_unused;
wire [51:0] inc_inter_res_fx5;
wire [62:11] nrd_res_fx5;
wire [63:0] int_data_fx5;
wire fb_int_fconst_scanin;
wire fb_int_fconst_scanout;
wire [63:0] int_fconst_res_fb;
wire [63:0] int_result_fx5;
wire [63:0] int_result0_fx5;
wire [4:2] q_result_sel_fx5;
wire fb_nrd_scanin;
wire fb_nrd_scanout;
wire [5:0] result_sel_fb;
wire [62:11] nrd_res_fb;
wire fb_fgd_scanin;
wire fb_fgd_scanout;
wire [63:0] fgd_result_fb;
wire emin_sp_fb;
wire emin_dp_fb;
wire tcu_muxtest_i_rep0;
wire [63:0] w1_result_fb;
wire [13:0] w1_synd_fb;



// ----------------------------------------------------------------------------
// Interface with FAD
// ----------------------------------------------------------------------------

input   [63:0] fad_rs1_fmt_fx1;        // rs1 formatted
input   [63:0] fad_rs2_fmt_fx1;        // rs2 formatted
input   [63:0] fad_rs1_fx1;            // rs1 unformatted
input   [63:0] fad_rs2_fx1;            // rs2 unformatted
input          fad_r1_odd32b_fx1;
input          fad_fsr_tem_fx1_b4;     // NVM

output  [63:0] fpf_w1_result_fb;       // FPX result

// ----------------------------------------------------------------------------
// Interface with EXU
// ----------------------------------------------------------------------------

output  [63:0] fgu_exu_result_fx5;     // FGU result for EXU{1,0}

// ----------------------------------------------------------------------------
// Interface with FGD
// ----------------------------------------------------------------------------

input   [63:0] fgd_result_fx5;         // FGX result

// ----------------------------------------------------------------------------
// Interface with FPC
// ----------------------------------------------------------------------------

input    [5:1] fpc_int_res_sel_fx4;
input    [3:0] fpc_vis_cmp_result_fx5; // vis cmp result data
input    [5:0] fpc_result_sel_fx5;     // result select
input    [1:0] fpc_ovf_if_rcout_fx5;   // result select qualification for rcout
input    [4:0] fpc_ma_fmt_sel_fx4;
input    [3:0] fpc_int_sel_fx5;
input    [4:0] fpc_fconst_sel_fx5;
input          fpc_fp_cin00_fx2;       // main adder control
input          fpc_cin00_fx2;          // main adder control
input          fpc_cin16_48_fx2;       // main adder control
input          fpc_cin32_fx2;          // main adder control
input          fpc_prop16_48_fx2;      // main adder control
input          fpc_prop32_fx2;         // main adder control
input          fpc_mle_sel_fx2;
input    [2:0] fpc_mse_sel_fx2;
input          fpc_sign_fx5;           // result sign
input          fpc_sign_fb;            // result sign
input          fpc_sp_dest_fx4;        // SP result dest
input          fpc_fadd_eac_enable_fx2;
input    [3:2] fpc_i2f_sel_fx1;        // 10=F(i,x)TO(s,d) 2's comp, 01=F(i,x)TO(s,d) not 2's comp
input          fpc_rinc_sel_fx5;
input          fpc_qthenan_fx4;        // quiet the propagating NaN, set frac MSB=1
input          fpc_den2nor_sp_fb;      // denorm intermediate result rounded to norm
input          fpc_den2nor_dp_fb;      // denorm intermediate result rounded to norm
output   [3:0] fpf_b_gteq_a_fx2;       // FCMP (B-A) cout, doesn't account for MSB
output   [3:0] fpf_b_eq_a_fx2;         // FCMP (B=A), doesn't account for MSB
output         fpf_hi_aof_fx1;
output         fpf_hi_bof_fx1;
output         fpf_lo_aof_fx1;
output         fpf_lo_bof_fx1;
output         fpf_azf0_fx1;           // rs1[62:0]==63'b0, must acct for rs1[63]
output         fpf_bzf0_fx1;           // rs2[62:0]==63'b0, must acct for rs2[63]
output         fpf_aoe0_fx1;
output         fpf_boe0_fx1;
output         fpf_aze0_fx1;
output         fpf_bze0_fx1;
output  [63:0] fpf_ma_sum_fx4;         // main adder sum
output         fpf_ma_cout_fx4;        // main adder cout
output         fpf_cmp_swap_blta_fx2;
output         fpf_align_sticky_fx4_l;
output   [1:0] fpf_byte_unsure_x_sp_fx3;
output   [1:0] fpf_byte_unsure_x_dp_fx3;

// ----------------------------------------------------------------------------
// Interface with FIC
// ----------------------------------------------------------------------------

input    [5:0] fic_norm_eadj_fx5;
input    [5:0] fic_i2f_align_sel_fx2;
output  [63:0] fpf_rs2_cmp_din_fx1;    // rt. justified rs2 for F(i,x)TO(s,d)
output [38:32] fpf_man_se_byte_fx3_b38_32;
output   [6:0] fpf_man_se_byte_fx3_b6_0;

// ----------------------------------------------------------------------------
// Interface with DEC
// ----------------------------------------------------------------------------

output   [1:0] fgu_cmp_fcc_fx3;        // fcc data {fcc3, fcc2, fcc1, fcc0}
output   [3:0] fgu_cmp_fcc_vld_fx3;    // fcc data valid

// ----------------------------------------------------------------------------
// Interface with FAC
// ----------------------------------------------------------------------------

input          fac_tlu_flush_fx3;
input          fac_fpx_sp_dest_fx1;    // SP result dest
input          fac_fpx_sp_src_fx1;     // SP source
input    [3:0] fac_pre_fcc_vld_fx2;    // must clear fcc_vld if (nv & TEM) | flush
input          fac_fcmpe_fx1;          // FCMPE, not FCMP
input    [4:0] fac_rs2_rotate_sel_e;   // 00001=odd FiTO(s,d), 00010=even FiTO(s,d), 00100=FiTO(s,d), 01000=rs2_odd32b, 10000=~rs2_odd32b
input    [1:0] fac_i2f_sel_e;          // 01=F(i,x)TO(s,d), 10=~F(i,x)TO(s,d)
input          fac_force_swap_blta_fx1; // force the swap_blta condition
input          fac_force_noswap_blta_fx1; // force the ~swap_blta condition

input          main_clken;             // main clken

// ----------------------------------------------------------------------------
// Interface with FPY
// ----------------------------------------------------------------------------

input   [63:0] fgu_mul_result_fx5;
input 	       fpy_fp_result_fx4_b63;

// ----------------------------------------------------------------------------
// Interface with FDC
// ----------------------------------------------------------------------------

input          fdc_finish_int_early;

// ----------------------------------------------------------------------------
// Interface with FDD
// ----------------------------------------------------------------------------

input   [63:0] fdd_result;
output         fpf_sa_xor_sb_fx1;

// ----------------------------------------------------------------------------
// Interface with FPE
// ----------------------------------------------------------------------------

input   [10:0] fpe_exp_res_fb;
input    [5:0] fpe_align_sel_fx2;
output         fpf_rcout_fx5;
output         fpf_rcout_fb;
output         fpf_implied_bit_fx5;

// ----------------------------------------------------------------------------
// Interface with FEC
// ----------------------------------------------------------------------------

input    [6:0] fec_w1_ecc_inject_fb;   // ECC error injection

// ----------------------------------------------------------------------------
// Interface with FRF
// ----------------------------------------------------------------------------

output  [13:0] fpf_w1_synd_fb;         // ECC generation for w1 result

// ----------------------------------------------------------------------------
// Global Signals
// ----------------------------------------------------------------------------

input          l2clk;                  // clock input
input  	       scan_in;
input  	       tcu_pce_ov;	       // scan signals
input  	       spc_aclk;
input  	       spc_bclk;
input 	       tcu_dectest;
input          tcu_muxtest;
input 	       tcu_scan_en;

output 	       scan_out;

// scan renames
assign stop   = 1'b0;
assign test   = tcu_dectest;
// end scan

fgu_fpf_dp_buff_macro__dbuff_32x__rep_1__width_4 test_rep0  (
  .din ({tcu_scan_en, tcu_pce_ov, spc_aclk, spc_bclk}),
  .dout({se,          pce_ov,     siclk,    soclk   })
  );


// ----------------------------------------------------------------------------
//                               FX1 stage
// ----------------------------------------------------------------------------

// ------------------------------------
// rs1/rs2 compare logic
// - V9 fp compares (generate fcc): FCMP(s,d), FCMPE(s,d)
// - VIS partitioned compares: FCMPEQ(16,32), FCMPGT(16,32), FCMPLE(16,32), FCMPNE(16,32)
// - V9 swap determination
// ------------------------------------

fgu_fpf_dp_mux_macro__mux_pgpe__ports_2__width_32 rs1_rotate  ( 
  .din0(fad_rs1_fx1[31:0]),
  .din1(fad_rs1_fx1[63:32]),
  .sel0(fad_r1_odd32b_fx1),
  .dout(rs1_cmp_din_fx1[63:32])
  );

fgu_fpf_dp_buff_macro__width_2 buf_sign  (
  .din ({fad_rs2_fx1[63],  fad_rs2_fx1[31] }),
  .dout({fad_rs20_fx1_b63, fad_rs20_fx1_b31})
  );

fgu_fpf_dp_mux_macro__dmux_6x__mux_aonpe__ports_4__width_64 rs2_rotate  (
  .din0({{32{fad_rs20_fx1_b31}}, fad_rs2_fx1[31:0]}),  // odd  FiTO(s,d), rt. justified & sign extended rs2
  .din1({{32{fad_rs20_fx1_b63}}, fad_rs2_fx1[63:32]}),  // even FiTO(s,d), rt. justified & sign extended rs2
  .din2({fad_rs2_fx1[31:0], 32'b0}),
  .din3( fad_rs2_fx1[63:0]        ),
  .sel0(rs2_rotate_sel_fx1[0]),
  .sel1(rs2_rotate_sel_fx1[1]),
  .sel2(rs2_rotate_sel_fx1[3]),
  .sel3(rs2_rotate_sel_fx1[4]),
  .dout(    rs2_cmp_din_fx1[63:0])
  );

fgu_fpf_dp_buff_macro__width_64 buf_rs2_rotate  (
  .din (    rs2_cmp_din_fx1[63:0]),
  .dout(fpf_rs2_cmp_din_fx1[63:0])
  );

fgu_fpf_dp_inv_macro__width_64 inv_rs1  (
  .din ({rs1_cmp_din_fx1[63:32], fad_rs1_fx1[31:0]}),
  .dout(rs1_cmp_din_fx1_[63:0]) 
  );

fgu_fpf_dp_cla_macro__width_16 cmp_bma3  (
  .din0({fac_force_swap_blta_fx1_,      rs1_cmp_din_fx1_[62:48]}),  // ignore sign bit for swap calculation
  .din1({fac_force_noswap_blta_fx1, fpf_rs2_cmp_din_fx1[62:48] }),  // ignore sign bit for swap calculation
  .cin (1'b1),
  .dout(cmp_bma3_unused[15:0]),
  .cout(cmp_bma_cout3_fx1)
  );

fgu_fpf_dp_cla_macro__width_16 cmp_bma2  (
  .din0(    rs1_cmp_din_fx1_[47:32]),
  .din1(fpf_rs2_cmp_din_fx1[47:32] ),
  .cin (1'b1),
  .dout(cmp_bma2_unused[15:0]),
  .cout(cmp_bma_cout2_fx1)
  );

fgu_fpf_dp_cla_macro__width_16 cmp_bma1  (
  .din0(rs1_cmp_din_fx1_[31:16]),
  .din1(fad_rs2_fx1[31:16]     ),
  .cin (1'b1),
  .dout(cmp_bma1_unused[15:0]),
  .cout(cmp_bma_cout1_fx1)
  );

fgu_fpf_dp_cla_macro__width_16 cmp_bma0  (
  .din0(rs1_cmp_din_fx1_[15:0]),
  .din1(fad_rs2_fx1[15:0]     ),
  .cin (1'b1),
  .dout(cmp_bma0_unused[15:0]),
  .cout(cmp_bma_cout0_fx1)
  );

fgu_fpf_dp_cmp_macro__width_16 cmp_eq3  (
  .din0({fac_force_swap_blta_fx1,       rs1_cmp_din_fx1[62:48]}),  // ignore sign bit for swap calculation
  .din1({fac_force_noswap_blta_fx1, fpf_rs2_cmp_din_fx1[62:48]}),  // ignore sign bit for swap calculation
  .dout(cmp_eq3_fx1)
  );

fgu_fpf_dp_cmp_macro__width_16 cmp_eq2  (
  .din0(    rs1_cmp_din_fx1[47:32]),
  .din1(fpf_rs2_cmp_din_fx1[47:32]),
  .dout(cmp_eq2_fx1)
  );

fgu_fpf_dp_cmp_macro__width_16 cmp_eq1  (
  .din0(fad_rs1_fx1[31:16]),
  .din1(fad_rs2_fx1[31:16]),
  .dout(cmp_eq1_fx1)
  );

fgu_fpf_dp_cmp_macro__width_16 cmp_eq0  (
  .din0(fad_rs1_fx1[15:0]),
  .din1(fad_rs2_fx1[15:0]),
  .dout(cmp_eq0_fx1)
  );

// ------------------------------------
// V9 swap determination (B<A)
// - doesn't account for sign bits or nan source(s)
// ------------------------------------

fgu_fpf_dp_nor_macro__ports_2__width_3 cmp_i0  (
  .din0({1'b0,              fac_fpx_sp_dest_fx1, fac_fpx_sp_dest_fx1}),
  .din1({cmp_bma_cout2_fx1, cmp_bma_cout1_fx1,   cmp_bma_cout0_fx1  }),
  .dout(cmp_i0_fx1[2:0]) 
  );

fgu_fpf_dp_nand_macro__ports_4__width_4 cmp_i1  (
  .din0({cmp_bma_cout3_fx1, cmp_eq30_fx1,  cmp_eq30_fx1,  cmp_eq30_fx1 }),
  .din1({cmp_i1_fx1[0],     cmp_i0_fx1[2], cmp_eq2_fx1,   cmp_eq2_fx1  }),
  .din2({cmp_i1_fx1[1],     1'b1,          cmp_i0_fx1[1], cmp_eq1_fx1  }),
  .din3({cmp_i1_fx1[2],     1'b1,          1'b1,          cmp_i0_fx1[0]}),
  .dout({cmp_swap_blta_fx1,  // not yet qual w/ sign bits and nan source(s)
         cmp_i1_fx1[2:0]})
  );

// ------------------------------------
// V9 equal determination (A=B)
// - doesn't account nan source(s)
// ------------------------------------

fgu_fpf_dp_xnor_macro__ports_2__width_1 cmp_i2  (
  .din0(    rs1_cmp_din_fx1[63]),
  .din1(fpf_rs2_cmp_din_fx1[63]),
  .dout(q_sign_beqa_fx1) 
  );

fgu_fpf_dp_inv_macro__width_1 div_i1  (
  .din (q_sign_beqa_fx1),
  .dout(fpf_sa_xor_sb_fx1)  // required by fdd
  );

fgu_fpf_dp_or_macro__ports_2__width_2 cmp_i3  (
  .din0({cmp_eq1_fx1,         cmp_eq0_fx1        }),
  .din1({fac_fpx_sp_dest_fx1, fac_fpx_sp_dest_fx1}),
  .dout(cmp_i3_fx1[1:0]) 
  );

fgu_fpf_dp_and_macro__ports_4__width_2 cmp_i4  (
  .din0({cmp_eq2_fx1,  cmp_i3_fx1[0]  }),
  .din1({cmp_eq30_fx1, cmp_i3_fx1[1]  }),
  .din2({1'b1,         cmp_i4_fx1     }),
  .din3({1'b1,         q_sign_beqa_fx1}),
  .dout({cmp_i4_fx1,   cmp_beqa_fx1   })  // not yet qual w/ nan source(s)
  );

// ------------------------------------
// Detect all zeros fraction (OF) (for intermediate denorm round to norm cases only)
//        all zeros fraction (ZF)
//        all ones  exponent (OE)
//        all zeros exponent (ZE)
// for each source (rs1,rs2)
// ------------------------------------

fgu_fpf_dp_cmp_macro__width_32 hi_aof  (
  .din0({fad_rs1_fmt_fx1[62:40], 9'b0}),  // exclude implied bit
  .din1({23'h7fffff,             9'b0}),
  .dout(fpf_hi_aof_fx1)
  );

fgu_fpf_dp_cmp_macro__width_32 hi_bof  (
  .din0({fad_rs2_fmt_fx1[62:40], 9'b0}),  // exclude implied bit
  .din1({23'h7fffff,             9'b0}),
  .dout(fpf_hi_bof_fx1)
  );

fgu_fpf_dp_cmp_macro__width_32 lo_aof  (
  .din0({fad_rs1_fmt_fx1[39:11], 3'b0}),  // exclude implied bit
  .din1({29'h1fffffff,           3'b0}),
  .dout(fpf_lo_aof_fx1)
  );

fgu_fpf_dp_cmp_macro__width_32 lo_bof  (
  .din0({fad_rs2_fmt_fx1[39:11], 3'b0}),  // exclude implied bit
  .din1({29'h1fffffff,           3'b0}),
  .dout(fpf_lo_bof_fx1)
  );

fgu_fpf_dp_zero_macro__width_64 azf  (
  .din ({1'b0, fad_rs1_fmt_fx1[62:0]}),  // exclude implied bit
  .dout(azf_fx1)
  );

fgu_fpf_dp_zero_macro__width_64 bzf  (
  .din ({1'b0, fad_rs2_fmt_fx1[62:0]}),  // exclude implied bit
  .dout(bzf_fx1)
  );

fgu_fpf_dp_buff_macro__width_7 buff_cmp  (
  .din ({    bze_fx1,      boe_fx1,      bzf_fx1,      aze_fx1,      aoe_fx1,      azf_fx1,  cmp_eq3_fx1 }),
  .dout({fpf_bze0_fx1, fpf_boe0_fx1, fpf_bzf0_fx1, fpf_aze0_fx1, fpf_aoe0_fx1, fpf_azf0_fx1, cmp_eq30_fx1})
  );

fgu_fpf_dp_inv_macro__width_6 inv_zf  (
  .din ({fpf_azf0_fx1,
         fpf_bzf0_fx1,
         fac_fpx_sp_src_fx1,
         fac_force_swap_blta_fx1,
         fad_rs1_fmt_fx1[62],
         fad_rs2_fmt_fx1[62]}),
  .dout({fpf_azf0_fx1_,
         fpf_bzf0_fx1_,
         fac_fpx_sp_src_fx1_,
         fac_force_swap_blta_fx1_,
         fad_rs1_fmt_fx1_b62_,
         fad_rs2_fmt_fx1_b62_})
  );

fgu_fpf_dp_or_macro__ports_2__width_6 cmp_i5a  (  // set 3 exponent LSBs to 3'b111 if SP
  .din0({fpf_rs2_cmp_din_fx1[54:52], rs1_cmp_din_fx1[54:52]  }),
  .din1({6{fac_fpx_sp_src_fx1}                               }),
  .dout({rs2_exp_qual1_fx1[54:52],   rs1_exp_qual1_fx1[54:52]}) 
  );

fgu_fpf_dp_cmp_macro__width_12 aoe  (
  .din0({1'b1, rs1_cmp_din_fx1[62:55], rs1_exp_qual1_fx1[54:52]}),
  .din1(12'b111111111111),
  .dout(aoe_fx1)
  );

fgu_fpf_dp_cmp_macro__width_12 boe  (
  .din0({1'b1, fpf_rs2_cmp_din_fx1[62:55], rs2_exp_qual1_fx1[54:52]}),
  .din1(12'b111111111111),
  .dout(boe_fx1)
  );

fgu_fpf_dp_and_macro__ports_2__width_8 cmp_i5b  (  // set 3 exponent LSBs to 3'b000 if SP
  .din0({fpf_rs2_cmp_din_fx1[54:52], rs1_cmp_din_fx1[54:52],   fad_rs1_fmt_fx1_b62_, fad_rs2_fmt_fx1_b62_}),
  .din1({{6{fac_fpx_sp_src_fx1_}},                             fpf_aoe0_fx1,         fpf_boe0_fx1        }),
  .dout({rs2_exp_qual0_fx1[54:52],   rs1_exp_qual0_fx1[54:52], i_rs1_snan_src_fx1,   i_rs2_snan_src_fx1  })
  );

fgu_fpf_dp_zero_macro__width_12 aze  (
  .din ({1'b0, rs1_cmp_din_fx1[62:55], rs1_exp_qual0_fx1[54:52]}),
  .dout(aze_fx1)
  );

fgu_fpf_dp_zero_macro__width_12 bze  (
  .din ({1'b0, fpf_rs2_cmp_din_fx1[62:55], rs2_exp_qual0_fx1[54:52]}),
  .dout(bze_fx1)
  );

fgu_fpf_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_1 nan  ( 
  .din0(fpf_aoe0_fx1),
  .din1(fpf_boe0_fx1),
  .sel0(fpf_azf0_fx1_),
  .sel1(fpf_bzf0_fx1_),
  .dout(nan_src_fx1)
  );

fgu_fpf_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_1 qnan  ( 
  .din0(fpf_azf0_fx1_),
  .din1(fpf_bzf0_fx1_),
  .sel0(i_rs1_snan_src_fx1),
  .sel1(i_rs2_snan_src_fx1),
  .dout(snan_src_fx1)
  );

fgu_fpf_dp_nand_macro__ports_4__width_1 twozeros  (
  .din0(fpf_azf0_fx1),
  .din1(fpf_bzf0_fx1),
  .din2(fpf_aze0_fx1),
  .din3(fpf_bze0_fx1),
  .dout(zero_eq_zero_fx1_)
  );

// ------------------------------------
// V9 fp compares (generate fcc)
// 
// fcc[1:0]  relation
// -------------------
//   00      rs1=rs2 (A=B)
//   01      rs1<rs2 (A<B, B>A)
//   10      rs1>rs2 (A>B, B<A)
//   11      NaN source(s)
//
// first qualify V9 swap determination (swap_blta) with sign bits (Sa,Sb)
// to generate true B<A (blta) for fcc usage
// 
// Sb  Sa  beqa  swap_blta  blta
// -----------------------------
//  0   0    x       0       0
//  0   1    0*      0       0
//  1   0    0*      0       1   (set blta if Sb>Sa)
//  1   1    0       0       1   (flip swap_blta if Sa=Sb=1 & B!=A)
//  1   1    1       0       0
//  0   0    x       1       1
//  0   1    0*      1       0   (clear blta if Sb not >= Sa)
//  1   0    0*      1       1
//  1   1    x       1       0   (flip swap_blta if Sa=Sb=1)
//
// * must be 0 by definition of beqa
// ------------------------------------

fgu_fpf_dp_inv_macro__width_3 cmp_i6  (
  .din ({cmp_swap_blta_fx1,
         fac_fcmpe_fx1,
         fpf_rs2_cmp_din_fx1[63]}),
  .dout({cmp_swap_blta_fx1_,
         fcmpe_fx1_,
         fpf_rs2_cmp_din_fx1_[63]})
  );

fgu_fpf_dp_nand_macro__ports_2__width_3 cmp_i7  (  // equiv function: width=1,ports=2,mux=aonpe,buffsel=none
  .din0({cmp_swap_blta_fx1_, cmp_swap_blta_fx1,    cmp_i7_1_fx1}),
  .din1({cmp_i8_fx1,         rs1_cmp_din_fx1_[63], cmp_i7_0_fx1}),
  .dout({cmp_i7_1_fx1,       cmp_i7_0_fx1,         cmp_blta_fx1})
  );

fgu_fpf_dp_nor_macro__ports_2__width_2 cmp_i8  (
  .din0({cmp_blta_fx1, fpf_rs2_cmp_din_fx1_[63]}),
  .din1({cmp_beqa_fx1, cmp_beqa_fx1        }),
  .dout({cmp_bgta_fx1,      // B>A = ~(B<A) & ~(B=A), not yet qual w/ nan source(s)
         cmp_i8_fx1})
  );

// ------------------------------------
// Mantissa swap muxes
// ------------------------------------

// produce mantissa with larger exp (man_le)

fgu_fpf_dp_msff_macro__mux_aope__ports_2__width_64 fx2_swp_le  (
  .scan_in(fx2_swp_le_scanin),
  .scan_out(fx2_swp_le_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din0(fad_rs1_fmt_fx1[63:0]),
  .din1(fad_rs2_fmt_fx1[63:0]),
  .sel0(cmp_swap_blta_fx1),   // if (B<A) then rs1=man_le
  .dout(man_le_fx2[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// produce mantissa with smaller exp (man_se)
fgu_fpf_dp_msff_macro__mux_aope__ports_3__width_64 fx2_swp_se  (
  .scan_in(fx2_swp_se_scanin),
  .scan_out(fx2_swp_se_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din0(fpf_rs2_cmp_din_fx1[63:0]),
  .din1(fad_rs2_fmt_fx1[63:0]),
  .din2(fad_rs1_fmt_fx1[63:0]),
  .sel0(rs2_rotate_sel_fx1[2]),  // FiTO(s,d) selects rt. justified rs2
  .sel1(cmp_swap_blta_fx1),      // if (B<A) then rs2=man_se
  .dout(man_se_fx2[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ----------------------------------------------------------------------------
//                               FX2 stage
// ----------------------------------------------------------------------------

fgu_fpf_dp_msff_macro__width_29 fx2_fcc  (
  .scan_in(fx2_fcc_scanin),
  .scan_out(fx2_fcc_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din ({cmp_bma_cout3_fx1, cmp_bma_cout2_fx1, cmp_bma_cout1_fx1, cmp_bma_cout0_fx1,
         cmp_eq30_fx1, cmp_eq2_fx1, cmp_eq1_fx1, cmp_eq0_fx1,
         nan_src_fx1, cmp_blta_fx1, cmp_bgta_fx1,
         zero_eq_zero_fx1_,
         fcmpe_fx1_, snan_src_fx1, fad_fsr_tem_fx1_b4, fac_fcmpe_fx1,
         i2f_sel_fx1[1:0], fpc_i2f_sel_fx1[3:2],     cmp_swap_blta_fx1,
         fac_fpx_sp_dest_fx1, fac_i2f_sel_e[1:0], fac_rs2_rotate_sel_e[4:0]}),
  .dout({fpf_b_gteq_a_fx2[3:0],
         fpf_b_eq_a_fx2[3:0],
         nan_src_fx2, cmp_blta_fx2, cmp_bgta_fx2,
         zero_eq_zero_fx2_,
         fcmpe_fx2_, snan_src_fx2, fsr_tem_nvm_fx2,        fcmpe_fx2,
         i2f_sel_fx2[1:0],     i2f_sel_fx2[3:2], fpf_cmp_swap_blta_fx2,
                 sp_dest_fx2,     i2f_sel_fx1[1:0],   rs2_rotate_sel_fx1[4:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ------------------------------------
// generate final V9 fp compares data result and valid
// - clear fcc valid if (nv & TEM)
// - clear fcc valid if flush (handled in FAC)
// ------------------------------------

fgu_fpf_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_2 cmp_fcc  ( 
  .din0({nan_src_fx2,  nan_src_fx2 }),  // NaN source(s) detected
  .din1({cmp_blta_fx2, cmp_bgta_fx2}),  // fcmp data
  .sel0(zero_eq_zero_fx2_),             // must clear fcc[1:0] if A=B=0 (+0=-0)
  .sel1(zero_eq_zero_fx2_),             // must clear fcc[1:0] if A=B=0 (+0=-0)
  .dout(fcc_fx2[1:0])
  );

fgu_fpf_dp_nand_macro__ports_4__width_3 cmp_i10  (
  .din0({fcmpe_fx2_,        fcmpe_fx2,          fcmp_nv_trap_fx2_ }),
  .din1({nan_src_fx2,       nan_src_fx2,        fcmpe_nv_trap_fx2_}),
  .din2({snan_src_fx2,      1'b1,               1'b1              }),
  .din3({fsr_tem_nvm_fx2,   fsr_tem_nvm_fx2,    1'b1              }),
  .dout({fcmp_nv_trap_fx2_, fcmpe_nv_trap_fx2_, v9cmp_nv_trap_fx2 })
  );

// ------------------------------------
// Aligner
//
// Note: i2f uses aligner to perform a left shift
// by organizing the aligner as a rotator.
// If i2f then bring shifted off bits into msb.
// If not i2f then shift 0s into msb.
// ------------------------------------

fgu_fpf_dp_inv_macro__width_63 inv_i2f  (
  .din ({man_se_byte_fx2[6:0],  man_se_fx2[55:0] }),
  .dout({man_se_byte_fx2_[6:0], man_se_fx2_[55:0]})
  );

fgu_fpf_dp_mux_macro__dmux_6x__mux_aonpe__ports_2__width_63 mux_i2f  (
  .din0({  man_se_byte_fx2[6:0],   man_se_fx2[55:0] }),
  .din1({  man_se_byte_fx2_[6:0],  man_se_fx2_[55:0]}),
  .sel0(i2f_sel_fx2[2]),
  .sel1(i2f_sel_fx2[3]),
  .dout({q_man_se_byte_fx2[6:0], q_man_se_fx2[55:0] })
  );

fgu_fpf_dp_nand_macro__ports_2__width_18 asel  (  // equiv function: width=6,ports=2,mux=aonpe,buffsel=none
  .din0({fpe_align_sel_fx2[5:0], fic_i2f_align_sel_fx2[5:0], asel_i0_fx2[5:0]         }),
  .din1({{6{i2f_sel_fx2[1]}},    {6{i2f_sel_fx2[0]}},        asel_i1_fx2[5:0]         }),
  .dout({asel_i0_fx2[5:0],       asel_i1_fx2[5:0],           merged_align_sel_fx2[5:0]})
  );

fgu_fpf_dp_buff_macro__dbuff_48x__width_1 muxtest_b_rep0  (
  .din (tcu_muxtest	  ),
  .dout(tcu_muxtest_b_rep0)
  );

// byte mux
fgu_fpf_dp_mux_macro__mux_pgdec__ports_8__width_64 abyte  (
  .muxtst(tcu_muxtest_b_rep0),
  .din0(                         man_se_fx2[63:0] ),       // shift  0-bits
  .din1({q_man_se_fx2[7:0],     man_se_fx2[63:8]}),       // shift  8-bits
  .din2({q_man_se_fx2[15:0],     man_se_fx2[63:16]}),       // shift 16-bits
  .din3({q_man_se_fx2[23:0],     man_se_fx2[63:24]}),       // shift 24-bits
  .din4({q_man_se_fx2[31:0],     man_se_fx2[63:32]}),       // shift 32-bits
  .din5({q_man_se_fx2[39:0],     man_se_fx2[63:40]}),       // shift 40-bits
  .din6({q_man_se_fx2[47:0],     man_se_fx2[63:48]}),       // shift 48-bits
  .din7({q_man_se_fx2[55:0],     man_se_fx2[63:56]}),       // shift 56-bits
  .sel (merged_align_sel_fx2[5:3]),
  .dout(man_se_byte_fx2[63:0]),
  .test(test)
  );

// bit  mux
fgu_fpf_dp_mux_macro__mux_aodec__ports_8__width_64 abit  (
  .din0(                         man_se_byte_fx2[63:0] ),  // shift  0-bits
  .din1({q_man_se_byte_fx2[0],   man_se_byte_fx2[63:1]}),  // shift  1-bits
  .din2({q_man_se_byte_fx2[1:0], man_se_byte_fx2[63:2]}),  // shift  2-bits
  .din3({q_man_se_byte_fx2[2:0], man_se_byte_fx2[63:3]}),  // shift  3-bits
  .din4({q_man_se_byte_fx2[3:0], man_se_byte_fx2[63:4]}),  // shift  4-bits
  .din5({q_man_se_byte_fx2[4:0], man_se_byte_fx2[63:5]}),  // shift  5-bits
  .din6({q_man_se_byte_fx2[5:0], man_se_byte_fx2[63:6]}),  // shift  6-bits
  .din7({q_man_se_byte_fx2[6:0], man_se_byte_fx2[63:7]}),  // shift  7-bits
  .sel (merged_align_sel_fx2[2:0]),
  .dout(man_se_bit_fx2[63:0])
  );

//--------------------
// Aligner sticky
// - Must not capture G bit
//   SP format 1X.XX G bit is [40]
//   SP format 01.XX G bit is [39]
//   SP format 00.1X G bit is [38]
//   DP format 1X.XX G bit is [11]
//   DP format 01.XX G bit is [10]
//   DP format 00.1X G bit is [09]
//--------------------

fgu_fpf_dp_and_macro__ports_2__width_31 and_abyte_sticky  (
  .din0({   man_se_fx2[63:40],    man_se_byte_fx2[44:38]}),
  .din1({31{sp_dest_fx2}}),
  .dout({q2_man_se_fx2[63:40], q2_man_se_byte_fx2[44:38]})
  );

// byte sticky mux
fgu_fpf_dp_mux_macro__mux_aodec__ports_8__width_57 abyte_sticky  (
//                                                       SP uncertain G bits   DP uncertain G bits   //
  .din0({53'b0,                                          2'b0,                 2'b0             }),  // shift  0-bits
  .din1({41'b0, q2_man_se_fx2[45:40], man_se_fx2[16:11], q2_man_se_fx2[47:46], man_se_fx2[18:17]}),  // shift  8-bits
  .din2({25'b0, q2_man_se_fx2[53:40], man_se_fx2[24:11], q2_man_se_fx2[55:54], man_se_fx2[26:25]}),  // shift 16-bits
  .din3({ 9'b0, q2_man_se_fx2[61:40], man_se_fx2[32:11], q2_man_se_fx2[63:62], man_se_fx2[34:33]}),  // shift 24-bits
  .din4({       q2_man_se_fx2[63:41], man_se_fx2[40:11], 2'b0,                 man_se_fx2[42:41]}),  // shift 32-bits
  .din5({       q2_man_se_fx2[63:49], man_se_fx2[48:11], 2'b0,                 man_se_fx2[50:49]}),  // shift 40-bits
  .din6({       q2_man_se_fx2[63:57], man_se_fx2[56:11], 2'b0,                 man_se_fx2[58:57]}),  // shift 48-bits
  .din7({                             man_se_fx2[63:11], 2'b0,                 2'b0             }),  // shift 56-bits
  .sel (fpe_align_sel_fx2[5:3]),
  .dout({man_se_byte_sticky_fx2[52:0], byte_unsure_x_sp_fx2[1:0], byte_unsure_x_dp_fx2[1:0]})
  );

fgu_fpf_dp_buff_macro__dbuff_32x__width_1 muxtest_c_rep0  (
  .din (tcu_muxtest	  ),
  .dout(tcu_muxtest_c_rep0)
  );

// bit  sticky mux
fgu_fpf_dp_mux_macro__mux_pgdec__ports_8__width_14 abit_sticky  (
  .muxtst(tcu_muxtest_c_rep0),
  .din0( 14'b0                                                    ),  // shift  0-bits
  .din1({12'b0, q2_man_se_byte_fx2[38:38], man_se_byte_fx2[9:9]}),  // shift  1-bits
  .din2({10'b0, q2_man_se_byte_fx2[39:38], man_se_byte_fx2[10:9]}),  // shift  2-bits
  .din3({ 8'b0, q2_man_se_byte_fx2[40:38], man_se_byte_fx2[11:9]}),  // shift  3-bits
  .din4({ 6'b0, q2_man_se_byte_fx2[41:38], man_se_byte_fx2[12:9]}),  // shift  4-bits
  .din5({ 4'b0, q2_man_se_byte_fx2[42:38], man_se_byte_fx2[13:9]}),  // shift  5-bits
  .din6({ 2'b0, q2_man_se_byte_fx2[43:38], man_se_byte_fx2[14:9]}),  // shift  6-bits
  .din7({       q2_man_se_byte_fx2[44:38], man_se_byte_fx2[15:9]}),  // shift  7-bits
  .sel (fpe_align_sel_fx2[2:0]),
  .dout(man_se_bit_sticky_fx2[13:0]),
  .test(test)
  );

fgu_fpf_dp_zero_macro__width_64 cmp_byte_sticky  (
  .din ({11'h000, man_se_byte_sticky_fx2[52:0]}),
  .dout(add_byte_sticky_fx2_l)
  );


// ----------------------------------------------------------------------------
//                               FX3 stage
// ----------------------------------------------------------------------------

fgu_fpf_dp_msff_macro__width_64 fx3_mle  (
  .scan_in(fx3_mle_scanin),
  .scan_out(fx3_mle_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din (man_le_fx2[63:0]),
  .dout(man_le_fx3[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fpf_dp_msff_macro__width_64 fx3_mse  (
  .scan_in(fx3_mse_scanin),
  .scan_out(fx3_mse_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din (man_se_bit_fx2[63:0]),
  .dout(man_se_bit_fx3[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fpf_dp_msff_macro__width_54 fx3_fcc  (
  .scan_in(fx3_fcc_scanin),
  .scan_out(fx3_fcc_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din ({    ma_cout_fx3,
         fpc_fadd_eac_enable_fx2,
         fpc_fp_cin00_fx2,
         fpc_cin00_fx2,
         fpc_cin16_48_fx2,
         fpc_cin32_fx2,
         fpc_prop16_48_fx2,
         fpc_prop32_fx2,
             prop32_fx3,
             man_se_byte_fx2[38:32],
             align_sticky_fx3_l,
                 fcc_fx2[1:0],
         fpc_mle_sel_fx2,
         fpc_mse_sel_fx2[2:0],
         fac_pre_fcc_vld_fx2[3:0],
         v9cmp_nv_trap_fx2,
         add_byte_sticky_fx2_l,
         man_se_bit_sticky_fx2[13:0],
             byte_unsure_x_sp_fx2[1:0],
             byte_unsure_x_dp_fx2[1:0],
             man_se_byte_fx2[6:0]}),
  .dout({fpf_ma_cout_fx4,
             fadd_eac_enable_fx3,
             fp_cin00_fx3,
             cin00_fx3,
             cin16_48_fx3,
             cin32_fx3,
             prop16_48_fx3,
             prop32_fx3,
             prop32_fx4,
         fpf_man_se_byte_fx3_b38_32[38:32],
         fpf_align_sticky_fx4_l,
         fgu_cmp_fcc_fx3[1:0],
             mle_sel_fx3,
             mse_sel_fx3[2:0],
             pre_fcc_vld_fx3[3:0],
         v9cmp_nv_trap_fx3,
         add_byte_sticky_fx3_l,
         man_se_bit_sticky_fx3[13:0],
         fpf_byte_unsure_x_sp_fx3[1:0],
         fpf_byte_unsure_x_dp_fx3[1:0],
         fpf_man_se_byte_fx3_b6_0[6:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fpf_dp_inv_macro__width_2 cmp_i12  (
  .din ({v9cmp_nv_trap_fx3,  fac_tlu_flush_fx3 }),
  .dout({v9cmp_nv_trap_fx3_, fac_tlu_flush_fx3_})
  );

// Note: for timing improvement this and_macro can be changed to a nor_macro,
//       however, be careful to avoid an unwanted assertion of fcc_vld_fx3 right after por 
fgu_fpf_dp_and_macro__ports_3__width_4 cmp_i11  (
  .din0(    pre_fcc_vld_fx3[3:0]  ),
  .din1({4{ v9cmp_nv_trap_fx3_  }}),
  .din2({4{ fac_tlu_flush_fx3_  }}),
  .dout(fgu_cmp_fcc_vld_fx3[3:0]  )
  );

// ------------------------------------
// Mle/Mse format muxes
// ------------------------------------

fgu_fpf_dp_inv_macro__width_64 inv_mse  (
  .din (man_se_bit_fx3[63:0]),
  .dout(man_se_bit_fx3_[63:0])
  );

fgu_fpf_dp_mux_macro__mux_pgpe__ports_2__width_64 mux_mle  (
  .din0(64'b0),
  .din1(man_le_fx3[63:0]),
  .sel0(mle_sel_fx3),
  .dout(final_man_le_fx3[63:0])
  );

fgu_fpf_dp_buff_macro__dbuff_48x__width_1 muxtest_d_rep0  (
  .din (tcu_muxtest	  ),
  .dout(tcu_muxtest_d_rep0)
  );

fgu_fpf_dp_mux_macro__mux_pgpe__ports_4__width_64 mux_mse  (
  .muxtst(tcu_muxtest_d_rep0),
  .din0(64'b0),
  .din1(64'hffffffffffffffff),
  .din2(man_se_bit_fx3_[63:0]),
  .din3(man_se_bit_fx3[63:0]),
  .sel0(mse_sel_fx3[0]),
  .sel1(mse_sel_fx3[1]),
  .sel2(mse_sel_fx3[2]),
  .dout(final_man_se_fx3[63:0]),
  .test(test)
  );

// Note: can optimize to zero detect for improved timing
fgu_fpf_dp_cmp_macro__width_16 cmp_bit_sticky  (
  .din0({1'b1,                1'b1,                  14'b0                      }),
  .din1({fadd_eac_enable_fx3, add_byte_sticky_fx3_l, man_se_bit_sticky_fx3[13:0]}),
  .dout(align_sticky_fx3_l)
  );

fgu_fpf_dp_or_macro__ports_2__width_1 eac  ( 
  .din0(fp_cin00_fx3),
  .din1(align_sticky_fx3_l),
  .dout(final_fp_cin00_fx3)
  );

fgu_fpf_dp_nand_macro__ports_2__width_6 nand_final_cin16_48  ( 
  .din0({ma16_cout07_fx3,       cin16_48_fx3,          final_cin16_48_i0_fx3, ma16_cout47_fx3,       cin16_48_fx3,          final_cin16_48_i2_fx3}),
  .din1({prop16_48_fx3,         1'b1,                  final_cin16_48_i1_fx3, prop16_48_fx3,         1'b1,                  final_cin16_48_i3_fx3}),
  .dout({final_cin16_48_i0_fx3, final_cin16_48_i1_fx3, final_cin16_fx3,       final_cin16_48_i2_fx3, final_cin16_48_i3_fx3, final_cin48_fx3      })
  );

// ------------------------------------
// Main adder
// ------------------------------------

//fgu_ffa_cust ma (
//  .din0      (final_man_se_fx3[63:0]),
//  .din1      (final_man_le_fx3[63:0]),
//  .cin00     (final_fp_cin00_fx3    ),
//  .cin16_48  (    cin16_48_fx3      ),
//  .cin32     (    cin32_fx3         ),
//  .prop16_48 (    prop16_48_fx3     ),
//  .prop32    (    prop32_fx3        ),
//  .dout      (ma_sum_fx3[63:0]      ),
//  .cout64    (ma_cout_fx3           )
//  );

fgu_fpf_dp_cla_macro__width_16 ma16_0  (
  .din0(final_man_se_fx3[15:0]),
  .din1(final_man_le_fx3[15:0]),
  .cin (cin00_fx3),
  .dout(ma16_sum_fx3[15:0]),
  .cout(ma16_cout07_fx3)
  );

fgu_fpf_dp_cla_macro__width_16 ma16_1  (
  .din0(final_man_se_fx3[31:16]),
  .din1(final_man_le_fx3[31:16]),
  .cin (final_cin16_fx3),
  .dout(ma16_sum_fx3[31:16]),
  .cout(ma16_cout31_unused)
  );

fgu_fpf_dp_cla_macro__width_16 ma16_2  (
  .din0(final_man_se_fx3[47:32]),
  .din1(final_man_le_fx3[47:32]),
  .cin (cin32_fx3),
  .dout(ma16_sum_fx3[47:32]),
  .cout(ma16_cout47_fx3)
  );

fgu_fpf_dp_cla_macro__width_16 ma16_3  (
  .din0(final_man_se_fx3[63:48]),
  .din1(final_man_le_fx3[63:48]),
  .cin (final_cin48_fx3),
  .dout(ma16_sum_fx3[63:48]),
  .cout(ma16_cout63_unused)
  );

fgu_fpf_dp_cla_macro__width_64 ma64    (
  .din0(final_man_se_fx3[63:0]),
  .din1(final_man_le_fx3[63:0]),
  .cin (final_fp_cin00_fx3),
  .dout(ma64_sum_fx3[63:0]),
  .cout(ma_cout_fx3)
  );

// ----------------------------------------------------------------------------
//                               FX4 stage
// ----------------------------------------------------------------------------

fgu_fpf_dp_msff_macro__width_64 fx4_ma64_sum  (
  .scan_in(fx4_ma64_sum_scanin),
  .scan_out(fx4_ma64_sum_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din (ma64_sum_fx3[63:0]),
  .dout(fpf_ma_sum_fx4[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fpf_dp_msff_macro__width_64 fx4_ma16_sum  (
  .scan_in(fx4_ma16_sum_scanin),
  .scan_out(fx4_ma16_sum_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din (ma16_sum_fx3[63:0]),
  .dout(ma16_sum_fx4[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fpf_dp_mux_macro__mux_pgpe__ports_2__width_64 mux_ma_sum  (
  .din0(fpf_ma_sum_fx4[63:0]),
  .din1(ma16_sum_fx4[63:0]),
  .sel0(prop32_fx4),
  .dout(final_ma_sum_fx4[63:0])
  );

// ------------------------------------
// quiet the propagating NaN (set frac MSB=1)
// ------------------------------------

fgu_fpf_dp_or_macro__ports_2__width_1 qthenan  (
  .din0(final_ma_sum_fx4[62]),
  .din1(fpc_qthenan_fx4),
  .dout(ma_sum_quiet_fx4[62])
  );

// ----------------------------------------------------------------------------
//                               FX5 stage
// ----------------------------------------------------------------------------

fgu_fpf_dp_msff_macro__width_64 fx5_sum  (
  .scan_in(fx5_sum_scanin),
  .scan_out(fx5_sum_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din ({final_ma_sum_fx4[63], ma_sum_quiet_fx4[62], final_ma_sum_fx4[61:0]}),
  .dout(ma_sum_fx5[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fpf_dp_msff_macro__width_14 fx5_ma_fmt_sel  (
  .scan_in(fx5_ma_fmt_sel_scanin),
  .scan_out(fx5_ma_fmt_sel_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din ({fpf_rcout_fx5, fpc_int_res_sel_fx4[5:1], fdc_finish_int_early, fpc_ma_fmt_sel_fx4[4:0], fpy_fp_result_fx4_b63, fpc_sp_dest_fx4}),
  .dout({fpf_rcout_fb,      int_res_sel_fx5[5:1], int_res_sel_fx5[0],       ma_fmt_sel_fx5[4:0],     fp_result_fx5_b63,     sp_dest_fx5}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ------------------------------------
// Main adder output format mux
// - FPY fmul result enters norm/rnd here
// - SP inc position 40,
//   must pad bits [39:11] to propagate inc cin
// ------------------------------------

fgu_fpf_dp_buff_macro__dbuff_48x__width_1 muxtest_e_rep0  (
  .din (tcu_muxtest	  ),
  .dout(tcu_muxtest_e_rep0)
  );

fgu_fpf_dp_mux_macro__mux_pgpe__ports_7__width_64 ma_fmt  (
  .muxtst(tcu_muxtest_e_rep0),
  .din0({      ma_sum_fx5[62:0], 1'b0          }),
  .din1({1'b1, ma_sum_fx5[63:1]                }),
  .din2(       ma_sum_fx5[63:0]                 ),
  .din3({1'b0, fgu_mul_result_fx5[63:12], 11'b0}),
  .din4({      fgu_mul_result_fx5[63:11], 11'b0}),
  .din5({      fgu_mul_result_fx5[63:11], 11'b0}),
  .din6({      fgu_mul_result_fx5[62:10], 11'b0}),
  .sel0(ma_fmt_sel_fx5[0]                       ),  // fadd/fsub 00.1X
  .sel1(ma_fmt_sel_fx5[1]                       ),  // fadd/fsub 1X.XX
  .sel2(ma_fmt_sel_fx5[2]                       ),  // default for non fmul
  .sel3(ma_fmt_sel_fx5[3]                       ),  // fmul 11.XX, Eint=Emin-2, denorm inter. result may rnd to norm
  .sel4(ma_fmt_sel_fx5[4]                       ),  // fmul 01.XX, Eint=Emin-1, denorm inter. result may rnd to norm
  .sel5(fp_result_fx5_b63                       ),  // fmul 1X.XX
  .dout(unnorm_inter_res_fx5[63:0]              ),
  .test(test)   //       X.XX
  );

fgu_fpf_dp_buff_macro__dbuff_48x__width_1 muxtest_f_rep0  (
  .din (tcu_muxtest	  ),
  .dout(tcu_muxtest_f_rep0)
  );

fgu_fpf_dp_mux_macro__mux_pgpe__ports_8__width_29 ma_fmt_pad  (
  .muxtst(tcu_muxtest_f_rep0),
  .din0({1'b1, 28'hfffffff        }),
  .din1(       ma_sum_fx5[38:10]   ),
  .din2(       ma_sum_fx5[40:12]   ),
  .din3(       ma_sum_fx5[39:11]   ),
  .din4( fgu_mul_result_fx5[40:12] ),
  .din5( fgu_mul_result_fx5[39:11] ),
  .din6( fgu_mul_result_fx5[39:11] ),
  .din7( fgu_mul_result_fx5[38:10] ),
  .sel0(sp_dest_fx5                ),  // SP, pad bits [39:11]
  .sel1(ma_fmt_sel_fx5[0]          ),  // fadd/fsub 00.1X
  .sel2(ma_fmt_sel_fx5[1]          ),  // fadd/fsub 1X.XX
  .sel3(ma_fmt_sel_fx5[2]          ),  // default for non fmul
  .sel4(ma_fmt_sel_fx5[3]          ),  // fmul 11.XX, Eint=Emin-2, denorm inter. result may rnd to norm
  .sel5(ma_fmt_sel_fx5[4]          ),  // fmul 01.XX, Eint=Emin-1, denorm inter. result may rnd to norm
  .sel6(fp_result_fx5_b63          ),  // fmul 1X.XX
  .dout(pad_inc_fx5[39:11]         ),
  .test(test)
  );

// ------------------------------------
// Normalizer
// ------------------------------------

fgu_fpf_dp_buff_macro__dbuff_48x__width_1 muxtest_g_rep0  (
  .din (tcu_muxtest	  ),
  .dout(tcu_muxtest_g_rep0)
  );

// byte mux
fgu_fpf_dp_mux_macro__mux_pgdec__ports_8__width_59 nbyte  (
  .muxtst(tcu_muxtest_g_rep0),
  .din0( unnorm_inter_res_fx5[62:4]        ),  // shift  0-bits
  .din1({unnorm_inter_res_fx5[54:0],  4'b0}),  // shift  8-bits
  .din2({unnorm_inter_res_fx5[46:0], 12'b0}),  // shift 16-bits
  .din3({unnorm_inter_res_fx5[38:0], 20'b0}),  // shift 24-bits
  .din4({unnorm_inter_res_fx5[30:0], 28'b0}),  // shift 32-bits
  .din5({unnorm_inter_res_fx5[22:0], 36'b0}),  // shift 40-bits
  .din6({unnorm_inter_res_fx5[14:0], 44'b0}),  // shift 48-bits
  .din7(                             59'b0 ),  // unused
  .sel (fic_norm_eadj_fx5[5:3]),
  .dout(norm_byte_fx5[62:4]),
  .test(test)
  );

fgu_fpf_dp_buff_macro__dbuff_48x__width_1 muxtest_h_rep0  (
  .din (tcu_muxtest	  ),
  .dout(tcu_muxtest_h_rep0)
  );

// bit  mux
fgu_fpf_dp_mux_macro__mux_pgdec__ports_8__width_52 nbit  (
  .muxtst(tcu_muxtest_h_rep0),
  .din0(norm_byte_fx5[62:11]),  // shift  0-bits
  .din1(norm_byte_fx5[61:10]),  // shift  1-bits
  .din2(norm_byte_fx5[60:9]),  // shift  2-bits
  .din3(norm_byte_fx5[59:8]),  // shift  3-bits
  .din4(norm_byte_fx5[58:7]),  // shift  4-bits
  .din5(norm_byte_fx5[57:6]),  // shift  5-bits
  .din6(norm_byte_fx5[56:5]),  // shift  6-bits
  .din7(norm_byte_fx5[55:4]),  // shift  7-bits
  .sel (fic_norm_eadj_fx5[2:0]),
  .dout(norm_bit_fx5[62:11]),
  .test(test)
  );

// ------------------------------------
// Incrementer
//
// DP inc position 11
// SP inc position 40,
//    must pad bits [39:11] to propagate inc cin
// ------------------------------------

fgu_fpf_dp_increment_macro__width_64 minc  (
  .din ({11'b0, unnorm_inter_res_fx5[63:40], pad_inc_fx5[39:11]}),
  .cin (  1'b1),
  .dout({minc_unused[9:0], fpf_rcout_fx5, fpf_implied_bit_fx5, inc_inter_res_fx5[51:0]}),
  .cout( minc_unused[10])
  );

// ------------------------------------
// Norm/Round selection
// ------------------------------------

fgu_fpf_dp_mux_macro__mux_aope__ports_2__width_52 mux_nrd  (
  .din0(inc_inter_res_fx5[51:0]),
  .din1(norm_bit_fx5[62:11]),
  .sel0(fpc_rinc_sel_fx5),
  .dout(nrd_res_fx5[62:11])
  );

// ------------------------------------
// Integer output constant mux
// - FPY 8x16 result enters here
// ------------------------------------

fgu_fpf_dp_mux_macro__mux_aope__ports_5__width_64 idata  (
  .din0(64'h0000000000000000      ),
  .din1(64'h8000000000000000      ),
  .din2(64'h7fffffffffffffff      ),
  .din3(unnorm_inter_res_fx5[63:0]),  // vis parititioned add, F(s,d)TO(i,x)
  .din4(fgu_mul_result_fx5[63:0]  ),  // vis 8x16
  .sel0(fpc_int_sel_fx5[0]        ),
  .sel1(fpc_int_sel_fx5[1]        ),
  .sel2(fpc_int_sel_fx5[2]        ),
  .sel3(fpc_int_sel_fx5[3]        ),
  .dout(int_data_fx5[63:0]        )
  );

// ------------------------------------
// Integer/Float_Constant mux
// ------------------------------------

fgu_fpf_dp_msff_macro__mux_aope__ports_6__width_64 fb_int_fconst  (
  .scan_in(fb_int_fconst_scanin),
  .scan_out(fb_int_fconst_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din0({fpc_sign_fx5,  8'hff,          55'b0             }),  // SP inf
  .din1({fpc_sign_fx5, 11'b11111111111, 52'b0             }),  // DP inf
  .din2({fpc_sign_fx5,  8'hfe,          55'h7fffffffffffff}),  // SP max
  .din3({fpc_sign_fx5, 11'b11111111110, 52'hfffffffffffff }),  // DP max
  .din4({fpc_sign_fx5, 63'b0                              }),  // SP/DP zero
  .din5( int_data_fx5[63:0]                                ),
  .sel0(fpc_fconst_sel_fx5[0]),
  .sel1(fpc_fconst_sel_fx5[1]),
  .sel2(fpc_fconst_sel_fx5[2]),
  .sel3(fpc_fconst_sel_fx5[3]),
  .sel4(fpc_fconst_sel_fx5[4]),
  .dout(int_fconst_res_fb[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ------------------------------------
// EXU final result mux
// - FPY imul result enters here
// - FDD idiv result enters here
// ------------------------------------

fgu_fpf_dp_mux_macro__mux_aonpe__ports_6__width_64 exu_res  (
  .din0(fdd_result[63:0]                    ),  // idiv     result
  .din1(ma_sum_fx5[63:0]                    ),  // save/restore 64b add result
  .din2({31'b0, ma_sum_fx5[32:0]           }),  // mulscc   result
  .din3({57'b0, fgd_result_fx5[6:0]        }),  // popc     result
  .din4({60'b0, fpc_vis_cmp_result_fx5[3:0]}),  // vis fcmp result
  .din5(fgu_mul_result_fx5[63:0]            ),  // imul     result
  .sel0(int_res_sel_fx5[0]                  ),  // idiv
  .sel1(int_res_sel_fx5[1]                  ),  // save/restore
  .sel2(int_res_sel_fx5[2]                  ),  // mulscc
  .sel3(int_res_sel_fx5[3]                  ),  // popc
  .sel4(int_res_sel_fx5[4]                  ),  // vis fcmp
  .sel5(int_res_sel_fx5[5]                  ),  // imul
  .dout(int_result_fx5[63:0]                )   // pwr mgmt: aomux free zeros
  );

fgu_fpf_dp_buff_macro__width_64 buf_exu_res0  (
  .din (    int_result_fx5[63:0] ),
  .dout(    int_result0_fx5[63:0])
  );

fgu_fpf_dp_buff_macro__rep_1__width_64 buf_exu_res1  (
  .din (    int_result0_fx5[63:0]),
  .dout(fgu_exu_result_fx5[63:0] )
  );

fgu_fpf_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_2 sel_res  ( 
  .din0({fpc_ovf_if_rcout_fx5[1], fpc_ovf_if_rcout_fx5[0]}),
  .din1({fpc_result_sel_fx5[4],   fpc_result_sel_fx5[2]  }),
  .sel0(fpf_rcout_fx5),
  .sel1(1'b1),
  .dout({q_result_sel_fx5[4],     q_result_sel_fx5[2]    })
  );


// ----------------------------------------------------------------------------
//                               FB stage
// ----------------------------------------------------------------------------

fgu_fpf_dp_msff_macro__width_58 fb_nrd  (
  .scan_in(fb_nrd_scanin),
  .scan_out(fb_nrd_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din ({fpc_result_sel_fx5[5], q_result_sel_fx5[4], fpc_result_sel_fx5[3], q_result_sel_fx5[2], fpc_result_sel_fx5[1:0],
         nrd_res_fx5[62:11]}),
  .dout({result_sel_fb[5:0],
         nrd_res_fb[62:11]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fpf_dp_msff_macro__width_64 fb_fgd  (
  .scan_in(fb_fgd_scanin),
  .scan_out(fb_fgd_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din (fgd_result_fx5[63:0]),
  .dout(fgd_result_fb[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

fgu_fpf_dp_or_macro__ports_2__width_2 or_min  (  // force result to min norm if needed
  .din0({fpc_den2nor_sp_fb,     fpc_den2nor_dp_fb    }),
  .din1({int_fconst_res_fb[55], int_fconst_res_fb[52]}),
  .dout({emin_sp_fb,            emin_dp_fb           }) 
  );

fgu_fpf_dp_buff_macro__dbuff_48x__width_1 muxtest_i_rep0  (
  .din (tcu_muxtest       ),
  .dout(tcu_muxtest_i_rep0)
  );

fgu_fpf_dp_mux_macro__mux_pgpe__ports_7__width_64 fb_res  (
  .muxtst(tcu_muxtest_i_rep0),
  .din0({32'b0, fgd_result_fb[63:32]                                          }),
  .din1(        fgd_result_fb[63:0]                                            ),
  .din2({32'b0, int_fconst_res_fb[63:56], emin_sp_fb, int_fconst_res_fb[54:32]}),
  .din3({32'b0, fpc_sign_fb, fpe_exp_res_fb[7:0],  nrd_res_fb[62:40]          }),
  .din4({       int_fconst_res_fb[63:56], emin_sp_fb, int_fconst_res_fb[54:53], emin_dp_fb, int_fconst_res_fb[51:0]}),
  .din5({       fpc_sign_fb, fpe_exp_res_fb[10:0], nrd_res_fb[62:11]          }),
  .din6({       fpc_sign_fb, fpe_exp_res_fb[7:0],  nrd_res_fb[62:40], 32'b0   }),
  .sel0(result_sel_fb[0]),  // FGA               rotate
  .sel1(result_sel_fb[1]),  // FGA
  .sel2(result_sel_fb[2]),  // 32b     int/const rotate
  .sel3(result_sel_fb[3]),  // SP                rotate
  .sel4(result_sel_fb[4]),  // 64b/32b int/const
  .sel5(result_sel_fb[5]),  // DP
                            // else: SP no rotate
  .dout(w1_result_fb[63:0]),
  .test(test)
  );

fgu_fpf_dp_buff_macro__width_64 buf_w1_result  (
  .din (    w1_result_fb[63:0]),
  .dout(fpf_w1_result_fb[63:0])
  );

// ------------------------------------
// ECC generation for w1 result (even word)
// ------------------------------------

fgu_fpf_dp_prty_macro__width_32 ecc_s1e7  (
  .din({1'b0,
  	w1_result_fb[62],
        1'b0,
  	w1_result_fb[60],
        1'b0,
	w1_result_fb[58:57],
        1'b0,
	w1_result_fb[55],
        1'b0,
	w1_result_fb[53],
        1'b0,
	w1_result_fb[51],
        1'b0,
	w1_result_fb[49],
        1'b0,
        w1_result_fb[47],
        1'b0,
	w1_result_fb[45],
        1'b0,
	w1_result_fb[43:42],
        1'b0,
	w1_result_fb[40],
        1'b0,
	w1_result_fb[38],
        1'b0,
	w1_result_fb[36:35],
        fec_w1_ecc_inject_fb[0],
	w1_result_fb[33:32]}),
  .dout(w1_synd_fb[7])
  );

fgu_fpf_dp_prty_macro__width_32 ecc_s1e8  (
  .din({w1_result_fb[63],
        2'b0,
  	w1_result_fb[60:59],
        1'b0,
	w1_result_fb[57:56],
        2'b0,
	w1_result_fb[53:52],
        2'b0,
	w1_result_fb[49:48],
        2'b0,
	w1_result_fb[45:44],
        1'b0,
	w1_result_fb[42:41],
        2'b0,
	w1_result_fb[38:37],
        1'b0,
	w1_result_fb[35:34],
        fec_w1_ecc_inject_fb[1],
	w1_result_fb[32]}),
  .dout(w1_synd_fb[8])
  );

fgu_fpf_dp_prty_macro__width_32 ecc_s1e9  (
  .din({w1_result_fb[63:61],
        3'b0,
	w1_result_fb[57:54],
        4'b0,
	w1_result_fb[49:46],
        3'b0,
	w1_result_fb[42:39],
        3'b0,
	w1_result_fb[35:33],
        fec_w1_ecc_inject_fb[2]}),
  .dout(w1_synd_fb[9])
  );

fgu_fpf_dp_prty_macro__width_16 ecc_s1e10  (
  .din({fec_w1_ecc_inject_fb[3],
	w1_result_fb[57:50],
	w1_result_fb[42:36]}),
  .dout(w1_synd_fb[10])
  );

fgu_fpf_dp_prty_macro__width_16 ecc_s1e11  (
  .din({fec_w1_ecc_inject_fb[4],
	w1_result_fb[57:43]}),
  .dout(w1_synd_fb[11])
  );

fgu_fpf_dp_prty_macro__width_8 ecc_s1e12  (
  .din({w1_result_fb[63:58],
        1'b0,
        fec_w1_ecc_inject_fb[5]}),
  .dout(w1_synd_fb[12])
  );

fgu_fpf_dp_prty_macro__width_32 ecc_s1e13  (
  .din({2'b0,
  	w1_result_fb[61],
        1'b0,
  	w1_result_fb[59:58],
        1'b0,
	w1_result_fb[56:55],
        1'b0,
	w1_result_fb[53],
        2'b0,
	w1_result_fb[50:49],
        2'b0,
	w1_result_fb[46],
        1'b0,
	w1_result_fb[44:42],
        2'b0,
	w1_result_fb[39],
        1'b0,
	w1_result_fb[37:36],
        fec_w1_ecc_inject_fb[6],
	w1_result_fb[34:32]}),
  .dout(w1_synd_fb[13])
  );

fgu_fpf_dp_buff_macro__width_7 buf_ecce  (
  .din (    w1_synd_fb[13:7]),
  .dout(fpf_w1_synd_fb[13:7])
  );

// ------------------------------------
// ECC generation for w1 result (odd word)
// ------------------------------------

fgu_fpf_dp_prty_macro__width_32 ecc_s1o0  (
  .din({fec_w1_ecc_inject_fb[0],
  	w1_result_fb[30],
        1'b0,
  	w1_result_fb[28],
        1'b0,
	w1_result_fb[26:25],
        1'b0,
	w1_result_fb[23],
        1'b0,
	w1_result_fb[21],
        1'b0,
	w1_result_fb[19],
        1'b0,
	w1_result_fb[17],
        1'b0,
        w1_result_fb[15],
        1'b0,
	w1_result_fb[13],
        1'b0,
	w1_result_fb[11:10],
        1'b0,
	w1_result_fb[8],
        1'b0,
	w1_result_fb[6],
        1'b0,
	w1_result_fb[4:3],
        1'b0,
	w1_result_fb[1:0]}),
  .dout(w1_synd_fb[0])
  );

fgu_fpf_dp_prty_macro__width_32 ecc_s1o1  (
  .din({w1_result_fb[31],
        fec_w1_ecc_inject_fb[1],
        1'b0,
  	w1_result_fb[28:27],
        1'b0,
	w1_result_fb[25:24],
        2'b0,
	w1_result_fb[21:20],
        2'b0,
	w1_result_fb[17:16],
        2'b0,
	w1_result_fb[13:12],
        1'b0,
	w1_result_fb[10:9],
        2'b0,
	w1_result_fb[6:5],
        1'b0,
	w1_result_fb[3:2],
        1'b0,
	w1_result_fb[0]}),
  .dout(w1_synd_fb[1])
  );

fgu_fpf_dp_prty_macro__width_32 ecc_s1o2  (
  .din({w1_result_fb[31:29],
        fec_w1_ecc_inject_fb[2],
        2'b0,
	w1_result_fb[25:22],
        4'b0,
	w1_result_fb[17:14],
        3'b0,
	w1_result_fb[10:7],
        3'b0,
	w1_result_fb[3:1],
        1'b0}),
  .dout(w1_synd_fb[2])
  );

fgu_fpf_dp_prty_macro__width_16 ecc_s1o3  (
  .din({fec_w1_ecc_inject_fb[3],
	w1_result_fb[25:18],
	w1_result_fb[10:4]}),
  .dout(w1_synd_fb[3])
  );

fgu_fpf_dp_prty_macro__width_16 ecc_s1o4  (
  .din({fec_w1_ecc_inject_fb[4],
	w1_result_fb[25:11]}),
  .dout(w1_synd_fb[4])
  );

fgu_fpf_dp_prty_macro__width_8 ecc_s1o5  (
  .din({fec_w1_ecc_inject_fb[5],
        1'b0,
        w1_result_fb[31:26]}),
  .dout(w1_synd_fb[5])
  );

fgu_fpf_dp_prty_macro__width_32 ecc_s1o6  (
  .din({fec_w1_ecc_inject_fb[6],
        1'b0,
  	w1_result_fb[29],
        1'b0,
  	w1_result_fb[27:26],
        1'b0,
	w1_result_fb[24:23],
        1'b0,
	w1_result_fb[21],
        2'b0,
	w1_result_fb[18:17],
        2'b0,
	w1_result_fb[14],
        1'b0,
	w1_result_fb[12:10],
        2'b0,
	w1_result_fb[7],
        1'b0,
	w1_result_fb[5:4],
        1'b0,
	w1_result_fb[2:0]}),
  .dout(w1_synd_fb[6])
  );

fgu_fpf_dp_buff_macro__width_7 buf_ecco  (
  .din (    w1_synd_fb[6:0]),
  .dout(fpf_w1_synd_fb[6:0])
  );


// fixscan start:
assign fx2_swp_le_scanin         = scan_in                  ;
assign fx2_swp_se_scanin         = fx2_swp_le_scanout       ;
assign fx2_fcc_scanin            = fx2_swp_se_scanout       ;
assign fx3_mle_scanin            = fx2_fcc_scanout          ;
assign fx3_mse_scanin            = fx3_mle_scanout          ;
assign fx3_fcc_scanin            = fx3_mse_scanout          ;
assign fx4_ma64_sum_scanin       = fx3_fcc_scanout          ;
assign fx4_ma16_sum_scanin       = fx4_ma64_sum_scanout     ;
assign fx5_sum_scanin            = fx4_ma16_sum_scanout     ;
assign fx5_ma_fmt_sel_scanin     = fx5_sum_scanout          ;
assign fb_nrd_scanin             = fx5_ma_fmt_sel_scanout   ;
assign fb_int_fconst_scanin      = fb_nrd_scanout           ;
assign fb_fgd_scanin             = fb_int_fconst_scanout    ;
assign scan_out                  = fb_fgd_scanout           ;
// fixscan end:
endmodule  // fgu_fpf_dp


//
//   buff macro
//
//





module fgu_fpf_dp_buff_macro__dbuff_32x__rep_1__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpf_dp_mux_macro__mux_pgpe__ports_2__width_32 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [31:0] din0;
  input [31:0] din1;
  input sel0;
  output [31:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(32)  d0_0 (
  .sel(psel1),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
.dout(dout[31:0])
);









  



endmodule


//
//   buff macro
//
//





module fgu_fpf_dp_buff_macro__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






buff #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpf_dp_mux_macro__dmux_6x__mux_aonpe__ports_4__width_64 (
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





module fgu_fpf_dp_buff_macro__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule





//
//   invert macro
//
//





module fgu_fpf_dp_inv_macro__width_64 (
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
//   cla macro
//
//





module fgu_fpf_dp_cla_macro__width_16 (
  cin, 
  din0, 
  din1, 
  dout, 
  cout);
  input cin;
  input [15:0] din0;
  input [15:0] din1;
  output [15:0] dout;
  output cout;







cla #(16)  m0_0 (
.cin(cin),
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout[15:0]),
.cout(cout)
);












endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module fgu_fpf_dp_cmp_macro__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output dout;






cmp #(16)  m0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout)
);










endmodule





//
//   nor macro for ports = 2,3
//
//





module fgu_fpf_dp_nor_macro__ports_2__width_3 (
  din0, 
  din1, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  output [2:0] dout;






nor2 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.out(dout[2:0])
);







endmodule





//
//   nand macro for ports = 2,3,4
//
//





module fgu_fpf_dp_nand_macro__ports_4__width_4 (
  din0, 
  din1, 
  din2, 
  din3, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  input [3:0] din2;
  input [3:0] din3;
  output [3:0] dout;






nand4 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.in2(din2[3:0]),
.in3(din3[3:0]),
.out(dout[3:0])
);









endmodule





//
//   xnor macro for ports = 2,3
//
//





module fgu_fpf_dp_xnor_macro__ports_2__width_1 (
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
//   invert macro
//
//





module fgu_fpf_dp_inv_macro__width_1 (
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
//   or macro for ports = 2,3
//
//





module fgu_fpf_dp_or_macro__ports_2__width_2 (
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





module fgu_fpf_dp_and_macro__ports_4__width_2 (
  din0, 
  din1, 
  din2, 
  din3, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  input [1:0] din2;
  input [1:0] din3;
  output [1:0] dout;






and4 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.in2(din2[1:0]),
.in3(din3[1:0]),
.out(dout[1:0])
);









endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module fgu_fpf_dp_cmp_macro__width_32 (
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





module fgu_fpf_dp_zero_macro__width_64 (
  din, 
  dout);
  input [63:0] din;
  output dout;






zero #(64)  m0_0 (
.in(din[63:0]),
.out(dout)
);










endmodule





//
//   buff macro
//
//





module fgu_fpf_dp_buff_macro__width_7 (
  din, 
  dout);
  input [6:0] din;
  output [6:0] dout;






buff #(7)  d0_0 (
.in(din[6:0]),
.out(dout[6:0])
);








endmodule





//
//   invert macro
//
//





module fgu_fpf_dp_inv_macro__width_6 (
  din, 
  dout);
  input [5:0] din;
  output [5:0] dout;






inv #(6)  d0_0 (
.in(din[5:0]),
.out(dout[5:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module fgu_fpf_dp_or_macro__ports_2__width_6 (
  din0, 
  din1, 
  dout);
  input [5:0] din0;
  input [5:0] din1;
  output [5:0] dout;






or2 #(6)  d0_0 (
.in0(din0[5:0]),
.in1(din1[5:0]),
.out(dout[5:0])
);









endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module fgu_fpf_dp_cmp_macro__width_12 (
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
//   and macro for ports = 2,3,4
//
//





module fgu_fpf_dp_and_macro__ports_2__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output [7:0] dout;






and2 #(8)  d0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout[7:0])
);









endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module fgu_fpf_dp_zero_macro__width_12 (
  din, 
  dout);
  input [11:0] din;
  output dout;






zero #(12)  m0_0 (
.in(din[11:0]),
.out(dout)
);










endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpf_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_1 (
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
//   nand macro for ports = 2,3,4
//
//





module fgu_fpf_dp_nand_macro__ports_4__width_1 (
  din0, 
  din1, 
  din2, 
  din3, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  input [0:0] din3;
  output [0:0] dout;






nand4 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.in3(din3[0:0]),
.out(dout[0:0])
);









endmodule





//
//   invert macro
//
//





module fgu_fpf_dp_inv_macro__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






inv #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module fgu_fpf_dp_nand_macro__ports_2__width_3 (
  din0, 
  din1, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  output [2:0] dout;






nand2 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.out(dout[2:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module fgu_fpf_dp_nor_macro__ports_2__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






nor2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);







endmodule









// any PARAMS parms go into naming of macro

module fgu_fpf_dp_msff_macro__mux_aope__ports_2__width_64 (
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
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input [63:0] din1;
  input sel0;


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




cl_dp1_penc2_8x  c1_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(64)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
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













// any PARAMS parms go into naming of macro

module fgu_fpf_dp_msff_macro__mux_aope__ports_3__width_64 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
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
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input sel0;
  input sel1;


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




cl_dp1_penc3_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(64)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
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













// any PARAMS parms go into naming of macro

module fgu_fpf_dp_msff_macro__width_29 (
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
wire [27:0] so;

  input [28:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [28:0] dout;


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
dff #(29)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[28:0]),
.si({scan_in,so[27:0]}),
.so({so[27:0],scan_out}),
.q(dout[28:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpf_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_2 (
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
//   nand macro for ports = 2,3,4
//
//





module fgu_fpf_dp_nand_macro__ports_4__width_3 (
  din0, 
  din1, 
  din2, 
  din3, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  input [2:0] din2;
  input [2:0] din3;
  output [2:0] dout;






nand4 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.in2(din2[2:0]),
.in3(din3[2:0]),
.out(dout[2:0])
);









endmodule





//
//   invert macro
//
//





module fgu_fpf_dp_inv_macro__width_63 (
  din, 
  dout);
  input [62:0] din;
  output [62:0] dout;






inv #(63)  d0_0 (
.in(din[62:0]),
.out(dout[62:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpf_dp_mux_macro__dmux_6x__mux_aonpe__ports_2__width_63 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [62:0] din0;
  input sel0;
  input [62:0] din1;
  input sel1;
  output [62:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(63)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[62:0]),
  .in1(din1[62:0]),
.dout(dout[62:0])
);









  



endmodule


//
//   nand macro for ports = 2,3,4
//
//





module fgu_fpf_dp_nand_macro__ports_2__width_18 (
  din0, 
  din1, 
  dout);
  input [17:0] din0;
  input [17:0] din1;
  output [17:0] dout;






nand2 #(18)  d0_0 (
.in0(din0[17:0]),
.in1(din1[17:0]),
.out(dout[17:0])
);









endmodule





//
//   buff macro
//
//





module fgu_fpf_dp_buff_macro__dbuff_48x__width_1 (
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

module fgu_fpf_dp_mux_macro__mux_pgdec__ports_8__width_64 (
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

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  input [63:0] din4;
  input [63:0] din5;
  input [63:0] din6;
  input [63:0] din7;
  input [2:0] sel;
  input muxtst;
  input test;
  output [63:0] dout;





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

mux8 #(64)  d0_0 (
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
.dout(dout[63:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpf_dp_mux_macro__mux_aodec__ports_8__width_64 (
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
//   and macro for ports = 2,3,4
//
//





module fgu_fpf_dp_and_macro__ports_2__width_31 (
  din0, 
  din1, 
  dout);
  input [30:0] din0;
  input [30:0] din1;
  output [30:0] dout;






and2 #(31)  d0_0 (
.in0(din0[30:0]),
.in1(din1[30:0]),
.out(dout[30:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpf_dp_mux_macro__mux_aodec__ports_8__width_57 (
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

  input [56:0] din0;
  input [56:0] din1;
  input [56:0] din2;
  input [56:0] din3;
  input [56:0] din4;
  input [56:0] din5;
  input [56:0] din6;
  input [56:0] din7;
  input [2:0] sel;
  output [56:0] dout;





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

mux8s #(57)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[56:0]),
  .in1(din1[56:0]),
  .in2(din2[56:0]),
  .in3(din3[56:0]),
  .in4(din4[56:0]),
  .in5(din5[56:0]),
  .in6(din6[56:0]),
  .in7(din7[56:0]),
.dout(dout[56:0])
);









  



endmodule


//
//   buff macro
//
//





module fgu_fpf_dp_buff_macro__dbuff_32x__width_1 (
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

module fgu_fpf_dp_mux_macro__mux_pgdec__ports_8__width_14 (
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

  input [13:0] din0;
  input [13:0] din1;
  input [13:0] din2;
  input [13:0] din3;
  input [13:0] din4;
  input [13:0] din5;
  input [13:0] din6;
  input [13:0] din7;
  input [2:0] sel;
  input muxtst;
  input test;
  output [13:0] dout;





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

mux8 #(14)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[13:0]),
  .in1(din1[13:0]),
  .in2(din2[13:0]),
  .in3(din3[13:0]),
  .in4(din4[13:0]),
  .in5(din5[13:0]),
  .in6(din6[13:0]),
  .in7(din7[13:0]),
.dout(dout[13:0]),
  .muxtst(muxtst)
);









  



endmodule






// any PARAMS parms go into naming of macro

module fgu_fpf_dp_msff_macro__width_64 (
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

module fgu_fpf_dp_msff_macro__width_54 (
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
wire [52:0] so;

  input [53:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [53:0] dout;


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
dff #(54)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[53:0]),
.si({scan_in,so[52:0]}),
.so({so[52:0],scan_out}),
.q(dout[53:0])
);




















endmodule









//
//   invert macro
//
//





module fgu_fpf_dp_inv_macro__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






inv #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module fgu_fpf_dp_and_macro__ports_3__width_4 (
  din0, 
  din1, 
  din2, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  input [3:0] din2;
  output [3:0] dout;






and3 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.in2(din2[3:0]),
.out(dout[3:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpf_dp_mux_macro__mux_pgpe__ports_2__width_64 (
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

module fgu_fpf_dp_mux_macro__mux_pgpe__ports_4__width_64 (
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

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  input sel0;
  input sel1;
  input sel2;
  input muxtst;
  input test;
  output [63:0] dout;





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

mux4 #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
.dout(dout[63:0]),
  .muxtst(muxtst)
);









  



endmodule


//  
//   or macro for ports = 2,3
//
//





module fgu_fpf_dp_or_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module fgu_fpf_dp_nand_macro__ports_2__width_6 (
  din0, 
  din1, 
  dout);
  input [5:0] din0;
  input [5:0] din1;
  output [5:0] dout;






nand2 #(6)  d0_0 (
.in0(din0[5:0]),
.in1(din1[5:0]),
.out(dout[5:0])
);









endmodule





//
//   cla macro
//
//





module fgu_fpf_dp_cla_macro__width_64 (
  cin, 
  din0, 
  din1, 
  dout, 
  cout);
  input cin;
  input [63:0] din0;
  input [63:0] din1;
  output [63:0] dout;
  output cout;







cla #(64)  m0_0 (
.cin(cin),
.in0(din0[63:0]),
.in1(din1[63:0]),
.out(dout[63:0]),
.cout(cout)
);












endmodule









// any PARAMS parms go into naming of macro

module fgu_fpf_dp_msff_macro__width_14 (
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
wire [12:0] so;

  input [13:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [13:0] dout;


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
dff #(14)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[13:0]),
.si({scan_in,so[12:0]}),
.so({so[12:0],scan_out}),
.q(dout[13:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpf_dp_mux_macro__mux_pgpe__ports_7__width_64 (
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
  input muxtst;
  input test;
  output [63:0] dout;





cl_dp1_penc7_8x  c0_0 (
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
 .psel6(psel6),
  .test(test)
);

mux7 #(64)  d0_0 (
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
.dout(dout[63:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpf_dp_mux_macro__mux_pgpe__ports_8__width_29 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  sel4, 
  sel5, 
  sel6, 
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

  input [28:0] din0;
  input [28:0] din1;
  input [28:0] din2;
  input [28:0] din3;
  input [28:0] din4;
  input [28:0] din5;
  input [28:0] din6;
  input [28:0] din7;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input sel5;
  input sel6;
  input muxtst;
  input test;
  output [28:0] dout;





cl_dp1_penc8_8x  c0_0 (
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .sel4(sel4),
 .sel5(sel5),
 .sel6(sel6),
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

mux8 #(29)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[28:0]),
  .in1(din1[28:0]),
  .in2(din2[28:0]),
  .in3(din3[28:0]),
  .in4(din4[28:0]),
  .in5(din5[28:0]),
  .in6(din6[28:0]),
  .in7(din7[28:0]),
.dout(dout[28:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpf_dp_mux_macro__mux_pgdec__ports_8__width_59 (
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

  input [58:0] din0;
  input [58:0] din1;
  input [58:0] din2;
  input [58:0] din3;
  input [58:0] din4;
  input [58:0] din5;
  input [58:0] din6;
  input [58:0] din7;
  input [2:0] sel;
  input muxtst;
  input test;
  output [58:0] dout;





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

mux8 #(59)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[58:0]),
  .in1(din1[58:0]),
  .in2(din2[58:0]),
  .in3(din3[58:0]),
  .in4(din4[58:0]),
  .in5(din5[58:0]),
  .in6(din6[58:0]),
  .in7(din7[58:0]),
.dout(dout[58:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpf_dp_mux_macro__mux_pgdec__ports_8__width_52 (
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

  input [51:0] din0;
  input [51:0] din1;
  input [51:0] din2;
  input [51:0] din3;
  input [51:0] din4;
  input [51:0] din5;
  input [51:0] din6;
  input [51:0] din7;
  input [2:0] sel;
  input muxtst;
  input test;
  output [51:0] dout;





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

mux8 #(52)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[51:0]),
  .in1(din1[51:0]),
  .in2(din2[51:0]),
  .in3(din3[51:0]),
  .in4(din4[51:0]),
  .in5(din5[51:0]),
  .in6(din6[51:0]),
  .in7(din7[51:0]),
.dout(dout[51:0]),
  .muxtst(muxtst)
);









  



endmodule


//
//   increment macro 
//
//





module fgu_fpf_dp_increment_macro__width_64 (
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





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpf_dp_mux_macro__mux_aope__ports_2__width_52 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [51:0] din0;
  input [51:0] din1;
  input sel0;
  output [51:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(52)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[51:0]),
  .in1(din1[51:0]),
.dout(dout[51:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpf_dp_mux_macro__mux_aope__ports_5__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  input [63:0] din4;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  output [63:0] dout;





cl_dp1_penc5_8x  c0_0 (
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

mux5s #(64)  d0_0 (
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
.dout(dout[63:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module fgu_fpf_dp_msff_macro__mux_aope__ports_6__width_64 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpf_dp_mux_macro__mux_aonpe__ports_6__width_64 (
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
  din5, 
  sel5, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;

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
  input [63:0] din5;
  input sel5;
  output [63:0] dout;





cl_dp1_muxbuff6_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5)
);
mux6s #(64)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
  .in5(din5[63:0]),
.dout(dout[63:0])
);









  



endmodule


//
//   buff macro
//
//





module fgu_fpf_dp_buff_macro__rep_1__width_64 (
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

module fgu_fpf_dp_msff_macro__width_58 (
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
wire [56:0] so;

  input [57:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [57:0] dout;


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
dff #(58)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[57:0]),
.si({scan_in,so[56:0]}),
.so({so[56:0],scan_out}),
.q(dout[57:0])
);




















endmodule









//
//   parity macro (even parity)
//
//





module fgu_fpf_dp_prty_macro__width_32 (
  din, 
  dout);
  input [31:0] din;
  output dout;







prty #(32)  m0_0 (
.in(din[31:0]),
.out(dout)
);










endmodule





//
//   parity macro (even parity)
//
//





module fgu_fpf_dp_prty_macro__width_16 (
  din, 
  dout);
  input [15:0] din;
  output dout;







prty #(16)  m0_0 (
.in(din[15:0]),
.out(dout)
);










endmodule





//
//   parity macro (even parity)
//
//





module fgu_fpf_dp_prty_macro__width_8 (
  din, 
  dout);
  input [7:0] din;
  output dout;







prty #(8)  m0_0 (
.in(din[7:0]),
.out(dout)
);










endmodule




