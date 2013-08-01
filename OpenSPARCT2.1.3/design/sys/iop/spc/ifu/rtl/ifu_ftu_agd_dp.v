// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_ftu_agd_dp.v
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
module ifu_ftu_agd_dp (
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_muxtest, 
  mbi_addr, 
  mbi_cmpsel, 
  mbi_wdata, 
  mbi_icv_read_en, 
  ftp_thr0_trprdpc_sel_bf, 
  ftp_thr1_trprdpc_sel_bf, 
  ftp_thr2_trprdpc_sel_bf, 
  ftp_thr3_trprdpc_sel_bf, 
  ftp_thr4_trprdpc_sel_bf, 
  ftp_thr5_trprdpc_sel_bf, 
  ftp_thr6_trprdpc_sel_bf, 
  ftp_thr7_trprdpc_sel_bf, 
  agc_thr0_pcf_sel_bf, 
  agc_thr1_pcf_sel_bf, 
  agc_thr2_pcf_sel_bf, 
  agc_thr3_pcf_sel_bf, 
  agc_thr4_pcf_sel_bf, 
  agc_thr5_pcf_sel_bf, 
  agc_thr6_pcf_sel_bf, 
  agc_thr7_pcf_sel_bf, 
  agc_thr0_pcf_sel_last_bf, 
  agc_thr1_pcf_sel_last_bf, 
  agc_thr2_pcf_sel_last_bf, 
  agc_thr3_pcf_sel_last_bf, 
  agc_thr4_pcf_sel_last_bf, 
  agc_thr5_pcf_sel_last_bf, 
  agc_thr6_pcf_sel_last_bf, 
  agc_thr7_pcf_sel_last_bf, 
  ftp_thr0_sel_br_bf, 
  ftp_thr1_sel_br_bf, 
  ftp_thr2_sel_br_bf, 
  ftp_thr3_sel_br_bf, 
  ftp_thr4_sel_br_bf, 
  ftp_thr5_sel_br_bf, 
  ftp_thr6_sel_br_bf, 
  ftp_thr7_sel_br_bf, 
  agc_sel_inv_index, 
  agc_pc_sel_for_c, 
  icv_valid_f, 
  asi_addr_bf, 
  agc_thr0_byp_incr_bit5, 
  agc_thr1_byp_incr_bit5, 
  agc_thr2_byp_incr_bit5, 
  agc_thr3_byp_incr_bit5, 
  agc_thr4_byp_incr_bit5, 
  agc_thr5_byp_incr_bit5, 
  agc_thr6_byp_incr_bit5, 
  agc_thr7_byp_incr_bit5, 
  agc_thr0_byp_pc_update_bf, 
  agc_thr1_byp_pc_update_bf, 
  agc_thr2_byp_pc_update_bf, 
  agc_thr3_byp_pc_update_bf, 
  agc_thr4_byp_pc_update_bf, 
  agc_thr5_byp_pc_update_bf, 
  agc_thr6_byp_pc_update_bf, 
  agc_thr7_byp_pc_update_bf, 
  ftp_new_thr_sel_bf, 
  ftp_ict_data_sel_bf, 
  ftp_pc_sel_am, 
  ftp_pc_sel_tag_part1, 
  ftp_pc_sel_tag_part2, 
  ftp_pc_sel_tag_pc_bot, 
  ftp_pc_sel_tag_pc_top, 
  ftp_any_thr_clken, 
  ftp_sel_icv_mbist_addr, 
  ftp_icaddr_sel_first_mux, 
  tlu_trap_pc_0, 
  tlu_trap_pc_1, 
  itc_va, 
  exu_address0_e, 
  exu_address1_e, 
  tlu_npc_w, 
  cmu_fill_paddr, 
  asi_wr_data, 
  cmu_icache_invalidate_index, 
  cmu_thr0_data_ready, 
  cmu_thr1_data_ready, 
  cmu_thr2_data_ready, 
  cmu_thr3_data_ready, 
  cmu_thr4_data_ready, 
  cmu_thr5_data_ready, 
  cmu_thr6_data_ready, 
  cmu_thr7_data_ready, 
  agd_direct_map_rep_way, 
  agd_itlb_valid_f, 
  agd_itlb_valid_fast_f, 
  agd_itlb_valid_dupl_f, 
  ifu_agd_pc_bf, 
  agd_ict_index_bf, 
  agd_ic_index_bf, 
  agd_icv_windex_bf, 
  ifu_agd_pc_f, 
  agd_thr0_pc_4_2_f, 
  agd_thr1_pc_4_2_f, 
  agd_thr2_pc_4_2_f, 
  agd_thr3_pc_4_2_f, 
  agd_thr4_pc_4_2_f, 
  agd_thr5_pc_4_2_f, 
  agd_thr6_pc_4_2_f, 
  agd_thr7_pc_4_2_f, 
  agd_ict_wrtag_bf, 
  agd_asi_bist_wrdata, 
  agd_mbist_wdata_bf, 
  ftu_paddr, 
  ftu_mbi_icv_fail, 
  agd_va_hole_excp_f, 
  agd_address0_m, 
  agd_address1_m, 
  scan_out);
wire stop;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire br_address0_m_reg0_scanin;
wire br_address0_m_reg0_scanout;
wire [47:0] address0_m;
wire br_address0_m_reg1_scanin;
wire br_address0_m_reg1_scanout;
wire [47:0] address0_m_rep0;
wire br_address1_m_reg0_scanin;
wire br_address1_m_reg0_scanout;
wire [47:0] address1_m;
wire br_address1_m_reg1_scanin;
wire br_address1_m_reg1_scanout;
wire [47:0] address1_m_rep0;
wire [48:0] pc_c;
wire [48:0] thr0_trap_rd_pc_bf;
wire [48:0] thr1_trap_rd_pc_bf;
wire [48:0] thr2_trap_rd_pc_bf;
wire [48:0] thr3_trap_rd_pc_bf;
wire [48:0] thr4_trap_rd_pc_bf;
wire [48:0] thr5_trap_rd_pc_bf;
wire [48:0] thr6_trap_rd_pc_bf;
wire [48:0] thr7_trap_rd_pc_bf;
wire [48:0] curr_thr_pc_bf;
wire [48:0] by_pass_pc_update_bf;
wire [48:0] thr0_pc_f;
wire [48:0] thr0_pc_before_last_bf;
wire [48:0] next_thr0_pc_bf;
wire [48:0] thr1_pc_f;
wire [48:0] thr1_pc_before_last_bf;
wire [48:0] next_thr1_pc_bf;
wire [48:0] thr2_pc_f;
wire [48:0] thr2_pc_before_last_bf;
wire [48:0] next_thr2_pc_bf;
wire [48:0] thr3_pc_f;
wire [48:0] thr3_pc_before_last_bf;
wire [48:0] next_thr3_pc_bf;
wire [48:0] thr4_pc_f;
wire [48:0] thr4_pc_before_last_bf;
wire [48:0] next_thr4_pc_bf;
wire [48:0] thr5_pc_f;
wire [48:0] thr5_pc_before_last_bf;
wire [48:0] next_thr5_pc_bf;
wire [48:0] thr6_pc_f;
wire [48:0] thr6_pc_before_last_bf;
wire [48:0] next_thr6_pc_bf;
wire [48:0] thr7_pc_f;
wire [48:0] thr7_pc_before_last_bf;
wire [48:0] next_thr7_pc_bf;
wire thr0_pc_f_reg_scanin;
wire thr0_pc_f_reg_scanout;
wire thr1_pc_f_reg_scanin;
wire thr1_pc_f_reg_scanout;
wire thr2_pc_f_reg_scanin;
wire thr2_pc_f_reg_scanout;
wire thr3_pc_f_reg_scanin;
wire thr3_pc_f_reg_scanout;
wire thr4_pc_f_reg_scanin;
wire thr4_pc_f_reg_scanout;
wire thr5_pc_f_reg_scanin;
wire thr5_pc_f_reg_scanout;
wire thr6_pc_f_reg_scanin;
wire thr6_pc_f_reg_scanout;
wire thr7_pc_f_reg_scanin;
wire thr7_pc_f_reg_scanout;
wire [48:2] inc_pc_bf;
wire [10:5] curr_thr_pc_crit_bf;
wire [10:5] inc_pc_crit_bf;
wire [48:0] thr0_pc_muxed_f;
wire [48:0] thr1_pc_muxed_f;
wire [48:0] thr2_pc_muxed_f;
wire [48:0] thr3_pc_muxed_f;
wire [48:0] thr4_pc_muxed_f;
wire [48:0] thr5_pc_muxed_f;
wire [48:0] thr6_pc_muxed_f;
wire [48:0] thr7_pc_muxed_f;
wire [48:0] new_thr_pc_bf;
wire tcu_muxtest_rep1;
wire [48:0] next_pc_bf;
wire [47:13] pc_tag_1;
wire [47:13] pc_tag;
wire [47:13] pc_tag_buf;
wire pc_f_reg_scanin;
wire pc_f_reg_scanout;
wire [48:0] pc_f;
wire [1:0] pc_f_unused;
wire pc_f_incr;
wire inc_pc_f_top_data;
wire [1:0] nc_crit_unused;
wire inc_crit_cout_unused;
wire [52:48] pc_f_1_unused;
wire [48:37] inc_pc_bf_top_inc;
wire pc_f_2_unused;
wire [47:47] pc_f_;
wire [52:49] pc_f_3_unused;
wire [48:2] by_pass_pc_addr_to_buf;
wire by_pass_pc_addr_bf_incr_to_buf;
wire [48:2] by_pass_inc_pc_bf;
wire inc_by_pass_pc_addr_bf_top_data;
wire [52:48] by_pass_pc_addr_bf_1_unused;
wire [48:37] by_pass_inc_pc_bf_top_inc;
wire by_pass_pc_addr_bf_2_unused;
wire [48:2] by_pass_pc_addr_bf;
wire [47:47] by_pass_pc_addr_bf_;
wire [52:49] by_pass_pc_addr_bf_3_unused;
wire [5:0] agd_mbist_addr_bf;
wire [2:0] agd_mbist_cmpsel_bf;
wire [10:0] mbist_addr_muxed;
wire tcu_muxtest_rep2;
wire [10:2] curr_thr_pc_bf_del;
wire [39:5] phys_addr_bf;
wire [1:0] agd_ic_index_bf_unused;
wire tcu_muxtest_rep4;
wire mbist_in_reg_scanin;
wire mbist_in_reg_scanout;
wire [7:0] agd_mbist_wdata_f;
wire mbi_icv_read_en_bf;
wire mbi_icv_read_en_f;
wire [7:0] agd_mbist_wdata_c;
wire mbi_icv_read_en_c;
wire [10:6] inv_addr_bf;
wire [48:0] pc_wo_by_pass_c;
wire [48:2] by_pass_pc_addr_f;
wire [48:2] by_pass_pc_addr_c;
wire [48:2] pc_c_to_buf;
wire pc_wo_by_pass_c_reg_scanin;
wire pc_wo_by_pass_c_reg_scanout;
wire by_pass_sel_reg_scanin;
wire by_pass_sel_reg_scanout;
wire [7:0] by_pass_sel_bf;
wire [4:2] by_pass_inc_pc_to_buf;
wire by_pass_pc_f_reg_scanin;
wire by_pass_pc_f_reg_scanout;
wire by_pass_pc_c_reg_scanin;
wire by_pass_pc_c_reg_scanout;
wire phys_addr_bf_reg_scanin;
wire phys_addr_bf_reg_scanout;
wire [3:0] tag_parity;
wire ic_tag_parity;
wire inv_addr_bf_reg_scanin;
wire inv_addr_bf_reg_scanout;
wire [5:5] agd_ic_index_f;
wire [7:0] itlb_valid_dupl_f;
wire tcu_muxtest_rep3;
wire tag_data_29_nand_0;
wire tag_data_29_nand_1;
wire tag_data_29_nand_2;
wire tag_data_29;
wire valid_c_reg_a_scanin;
wire valid_c_reg_a_scanout;
wire [31:0] icv_valid_c;
wire valid_c_reg_b_scanin;
wire valid_c_reg_b_scanout;
wire agd_icv_fail_l;
wire agd_icv_fail;


input tcu_scan_en;
input l2clk;
input scan_in;
input tcu_pce_ov;		// scan signals
input spc_aclk;
input spc_bclk;
input tcu_muxtest;
input [5:0] mbi_addr;
input [2:0] mbi_cmpsel;
input [7:0] mbi_wdata;
input       mbi_icv_read_en;

input [2:0] ftp_thr0_trprdpc_sel_bf;  // 0in bits_on -max 1 
input [2:0] ftp_thr1_trprdpc_sel_bf;  // 0in bits_on -max 1 
input [2:0] ftp_thr2_trprdpc_sel_bf;  // 0in bits_on -max 1 
input [2:0] ftp_thr3_trprdpc_sel_bf;  // 0in bits_on -max 1 
input [2:0] ftp_thr4_trprdpc_sel_bf;  // 0in bits_on -max 1 
input [2:0] ftp_thr5_trprdpc_sel_bf;  // 0in bits_on -max 1 
input [2:0] ftp_thr6_trprdpc_sel_bf;  // 0in bits_on -max 1 
input [2:0] ftp_thr7_trprdpc_sel_bf;  // 0in bits_on -max 1 
            
input [3:0] agc_thr0_pcf_sel_bf;     // 0in one_hot
input [3:0] agc_thr1_pcf_sel_bf;     // 0in one_hot
input [3:0] agc_thr2_pcf_sel_bf;     // 0in one_hot
input [3:0] agc_thr3_pcf_sel_bf;     // 0in one_hot
input [3:0] agc_thr4_pcf_sel_bf;     // 0in one_hot
input [3:0] agc_thr5_pcf_sel_bf;     // 0in one_hot
input [3:0] agc_thr6_pcf_sel_bf;     // 0in one_hot
input [3:0] agc_thr7_pcf_sel_bf;     // 0in one_hot
            
input [1:0] agc_thr0_pcf_sel_last_bf;     // 0in one_hot
input [1:0] agc_thr1_pcf_sel_last_bf;     // 0in one_hot
input [1:0] agc_thr2_pcf_sel_last_bf;     // 0in one_hot
input [1:0] agc_thr3_pcf_sel_last_bf;     // 0in one_hot
input [1:0] agc_thr4_pcf_sel_last_bf;     // 0in one_hot
input [1:0] agc_thr5_pcf_sel_last_bf;     // 0in one_hot
input [1:0] agc_thr6_pcf_sel_last_bf;     // 0in one_hot
input [1:0] agc_thr7_pcf_sel_last_bf;     // 0in one_hot

input       ftp_thr0_sel_br_bf      ;
input       ftp_thr1_sel_br_bf      ;
input       ftp_thr2_sel_br_bf      ;
input       ftp_thr3_sel_br_bf      ;
input       ftp_thr4_sel_br_bf      ;
input       ftp_thr5_sel_br_bf      ;
input       ftp_thr6_sel_br_bf      ;
input       ftp_thr7_sel_br_bf      ;

input [3:0] agc_sel_inv_index;     // 0in bits_on -max 1

input [3:0] agc_pc_sel_for_c;     // 0in bits_on -max 1

input [31:0] icv_valid_f;     
input [39:3] asi_addr_bf;     

input       agc_thr0_byp_incr_bit5 ;
input       agc_thr1_byp_incr_bit5 ;
input       agc_thr2_byp_incr_bit5 ;
input       agc_thr3_byp_incr_bit5 ;
input       agc_thr4_byp_incr_bit5 ;
input       agc_thr5_byp_incr_bit5 ;
input       agc_thr6_byp_incr_bit5 ;
input       agc_thr7_byp_incr_bit5 ;

input [4:2] agc_thr0_byp_pc_update_bf ;
input [4:2] agc_thr1_byp_pc_update_bf ;
input [4:2] agc_thr2_byp_pc_update_bf ;
input [4:2] agc_thr3_byp_pc_update_bf ;
input [4:2] agc_thr4_byp_pc_update_bf ;
input [4:2] agc_thr5_byp_pc_update_bf ;
input [4:2] agc_thr6_byp_pc_update_bf ;
input [4:2] agc_thr7_byp_pc_update_bf ;

input [7:0] ftp_new_thr_sel_bf;
input [2:0] ftp_ict_data_sel_bf; 
input [5:0] ftp_pc_sel_am;
input [2:0] ftp_pc_sel_tag_part1;
input [3:0] ftp_pc_sel_tag_part2;
input [1:0] ftp_pc_sel_tag_pc_bot;
input [1:0] ftp_pc_sel_tag_pc_top;
// input [4:0] agc_pc_sel_am_final;
input       ftp_any_thr_clken;



input       ftp_sel_icv_mbist_addr;
input [4:0] ftp_icaddr_sel_first_mux;
// input [3:0] ftp_icaddr_sel_final_mux;
// input  [4:0] ftp_icaddr_sel_nb0_nb1;
// input  [4:0] ftp_icaddr_sel_b0_nb1;
// input  [4:0] ftp_icaddr_sel_nb0_b1;
// input  [4:0] ftp_icaddr_sel_b0_b1;

// input        dec_nb0_nb1_bf;
// input        dec_b0_nb1_bf;
// input        dec_nb0_b1_bf;
// input        dec_b0_b1_bf;

            
input [47:2] tlu_trap_pc_0;
input [47:2] tlu_trap_pc_1;

input [47:13] itc_va        ;
            
input [47:0] exu_address0_e;
input [47:0] exu_address1_e;
            
input [47:2] tlu_npc_w;
            
input [39:5] cmu_fill_paddr ;
input [32:0] asi_wr_data ;
input [10:6] cmu_icache_invalidate_index ;
input        cmu_thr0_data_ready;
input        cmu_thr1_data_ready;
input        cmu_thr2_data_ready;
input        cmu_thr3_data_ready;
input        cmu_thr4_data_ready;
input        cmu_thr5_data_ready;
input        cmu_thr6_data_ready;
input        cmu_thr7_data_ready;



output [2:0]  agd_direct_map_rep_way;
output [7:0]  agd_itlb_valid_f;
output [7:0]  agd_itlb_valid_fast_f;
output [7:0]  agd_itlb_valid_dupl_f;
output [47:0] ifu_agd_pc_bf ;

output [10:5] agd_ict_index_bf ;
output [10:2] agd_ic_index_bf ;
output [10:6] agd_icv_windex_bf ;

output [47:2] ifu_agd_pc_f ;
output [4:2] agd_thr0_pc_4_2_f ;
output [4:2] agd_thr1_pc_4_2_f ;
output [4:2] agd_thr2_pc_4_2_f ;
output [4:2] agd_thr3_pc_4_2_f ;
output [4:2] agd_thr4_pc_4_2_f ;
output [4:2] agd_thr5_pc_4_2_f ;
output [4:2] agd_thr6_pc_4_2_f ;
output [4:2] agd_thr7_pc_4_2_f ;

output [29:0] agd_ict_wrtag_bf;
output [32:0] agd_asi_bist_wrdata;
output [7:0]  agd_mbist_wdata_bf;
output [12:0] ftu_paddr;

output        ftu_mbi_icv_fail;
output        agd_va_hole_excp_f;

output [4:2]  agd_address0_m ;
output [4:2]  agd_address1_m ;

output scan_out;

// assign pce_ov = tcu_pce_ov;
// assign stop = tcu_clk_stop;
assign stop = 1'b0 ;
// assign siclk = spc_aclk;
// assign soclk = spc_bclk;

ifu_ftu_agd_dp_buff_macro__dbuff_32x__stack_none__width_4 test_rep0  (
  .din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk}),
  .dout({se,pce_ov,siclk,soclk})
);
///////////////////////////////////////////////////////////////////////
// Flop exu_addresses                                                //
///////////////////////////////////////////////////////////////////////
ifu_ftu_agd_dp_msff_macro__stack_24l__width_24 br_address0_m_reg0  (
 .scan_in(br_address0_m_reg0_scanin),
 .scan_out(br_address0_m_reg0_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( exu_address0_e[47:24]),
 .dout( address0_m[47:24]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));
ifu_ftu_agd_dp_msff_macro__stack_24l__width_24 br_address0_m_reg1  (
 .scan_in(br_address0_m_reg1_scanin),
 .scan_out(br_address0_m_reg1_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( exu_address0_e[23:0]),
 .dout( address0_m[23:0]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

ifu_ftu_agd_dp_buff_macro__dbuff_48x__rep_1__stack_50c__width_48 br_address0_m_rep0  (
 .din ( address0_m[47:0]     ),
 .dout( address0_m_rep0[47:0]     ));

// buff_macro br_address0_m_rep01 (width=48,stack=50c,dbuff=32x) (
//  .din ( address0_m_rep0[47:0]     ),
//  .dout( address0_m_rep01[47:0]     ));

ifu_ftu_agd_dp_msff_macro__stack_24l__width_24 br_address1_m_reg0  (
 .scan_in(br_address1_m_reg0_scanin),
 .scan_out(br_address1_m_reg0_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( exu_address1_e[47:24]),
 .dout( address1_m[47:24]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));
ifu_ftu_agd_dp_msff_macro__stack_24l__width_24 br_address1_m_reg1  (
 .scan_in(br_address1_m_reg1_scanin),
 .scan_out(br_address1_m_reg1_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( exu_address1_e[23:0]),
 .dout( address1_m[23:0]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

ifu_ftu_agd_dp_buff_macro__dbuff_48x__rep_1__stack_50c__width_48 br_address1_m_rep0  (
 .din ( address1_m[47:0]     ),
 .dout( address1_m_rep0[47:0]     ));

// buff_macro br_address1_m_rep01 (width=48,stack=50c,dbuff=32x) (
//  .din ( address1_m_rep0[47:0]     ),
//  .dout( address1_m_rep01[47:0]     ));

assign agd_address0_m[4:2] = address0_m_rep0[4:2] ;
assign agd_address1_m[4:2] = address1_m_rep0[4:2] ;
///////////////////////////////////////////////////////////////////////
// First level of redirection muxing for thread_0 to thread_7        //
///////////////////////////////////////////////////////////////////////

ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_3__stack_50c__width_49 thr0_trp_rd_pc_mux  (
 .din0( {1'b0,tlu_trap_pc_0[47:2],2'b00}),      // trap pc from thread_g_0
 .din1( {1'b0,tlu_npc_w[47:2],2'b00}),         // npc at w stage,thread_g_0 
 .din2( pc_c[48:0]),                 // pc  at c stage 
 .sel0( ftp_thr0_trprdpc_sel_bf[0]),
 .sel1( ftp_thr0_trprdpc_sel_bf[1]),
 .sel2( ftp_thr0_trprdpc_sel_bf[2]),
 .dout( thr0_trap_rd_pc_bf[48:0]                               ));


ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_3__stack_50c__width_49 thr1_trp_rd_pc_mux  (
 .din0( {1'b0,tlu_trap_pc_0[47:2],2'b00}),      // trap pc from thread_g_0
 .din1( {1'b0,tlu_npc_w[47:2],2'b00}),         // npc at w stage,thread_g_0 
 .din2( pc_c[48:0]),                 // pc  at c stage 
 .sel0( ftp_thr1_trprdpc_sel_bf[0]),
 .sel1( ftp_thr1_trprdpc_sel_bf[1]),
 .sel2( ftp_thr1_trprdpc_sel_bf[2]),
 .dout( thr1_trap_rd_pc_bf[48:0]                               ));


ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_3__stack_50c__width_49 thr2_trp_rd_pc_mux  (
 .din0( {1'b0,tlu_trap_pc_0[47:2],2'b00}),      // trap pc from thread_g_0
 .din1( {1'b0,tlu_npc_w[47:2],2'b00}),         // npc at w stage,thread_g_0 
 .din2( pc_c[48:0]),                 // pc  at c stage 
 .sel0( ftp_thr2_trprdpc_sel_bf[0]),
 .sel1( ftp_thr2_trprdpc_sel_bf[1]),
 .sel2( ftp_thr2_trprdpc_sel_bf[2]),
 .dout( thr2_trap_rd_pc_bf[48:0]                               ));


ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_3__stack_50c__width_49 thr3_trp_rd_pc_mux  (
 .din0( {1'b0,tlu_trap_pc_0[47:2],2'b00}),      // trap pc from thread_g_0
 .din1( {1'b0,tlu_npc_w[47:2],2'b00}),         // npc at w stage,thread_g_0 
 .din2( pc_c[48:0]),                 // pc  at c stage 
 .sel0( ftp_thr3_trprdpc_sel_bf[0]),
 .sel1( ftp_thr3_trprdpc_sel_bf[1]),
 .sel2( ftp_thr3_trprdpc_sel_bf[2]),
 .dout( thr3_trap_rd_pc_bf[48:0]                               ));


ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_3__stack_50c__width_49 thr4_trp_rd_pc_mux  (
 .din0( {1'b0,tlu_trap_pc_1[47:2],2'b00}),      // trap pc from thread_g_1
 .din1( {1'b0,tlu_npc_w[47:2],2'b00}),         // npc at w stage,thread_g_1 
 .din2( pc_c[48:0]),                 // pc  at c stage 
 .sel0( ftp_thr4_trprdpc_sel_bf[0]),
 .sel1( ftp_thr4_trprdpc_sel_bf[1]),
 .sel2( ftp_thr4_trprdpc_sel_bf[2]),
 .dout( thr4_trap_rd_pc_bf[48:0]                               ));


ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_3__stack_50c__width_49 thr5_trp_rd_pc_mux  (
 .din0( {1'b0,tlu_trap_pc_1[47:2],2'b00}),      // trap pc from thread_g_1
 .din1( {1'b0,tlu_npc_w[47:2],2'b00}),         // npc at w stage,thread_g_1 
 .din2( pc_c[48:0]),                 // pc  at c stage 
 .sel0( ftp_thr5_trprdpc_sel_bf[0]),
 .sel1( ftp_thr5_trprdpc_sel_bf[1]),
 .sel2( ftp_thr5_trprdpc_sel_bf[2]),
 .dout( thr5_trap_rd_pc_bf[48:0]                               ));


ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_3__stack_50c__width_49 thr6_trp_rd_pc_mux  (
 .din0( {1'b0,tlu_trap_pc_1[47:2],2'b00}),      // trap pc from thread_g_1
 .din1( {1'b0,tlu_npc_w[47:2],2'b00}),         // npc at w stage,thread_g_1 
 .din2( pc_c[48:0]),                 // pc  at c stage 
 .sel0( ftp_thr6_trprdpc_sel_bf[0]),
 .sel1( ftp_thr6_trprdpc_sel_bf[1]),
 .sel2( ftp_thr6_trprdpc_sel_bf[2]),
 .dout( thr6_trap_rd_pc_bf[48:0]                               ));

ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_3__stack_50c__width_49 thr7_trp_rd_pc_mux  (
 .din0( {1'b0,tlu_trap_pc_1[47:2],2'b00}),      // trap pc from thread_g_1
 .din1( {1'b0,tlu_npc_w[47:2],2'b00}),         // npc at w stage,thread_g_1 
 .din2( pc_c[48:0]),                 // pc  at c stage 
 .sel0( ftp_thr7_trprdpc_sel_bf[0]),
 .sel1( ftp_thr7_trprdpc_sel_bf[1]),
 .sel2( ftp_thr7_trprdpc_sel_bf[2]),
 .dout( thr7_trap_rd_pc_bf[48:0]                               ));

///////////////////////////////////////////////////////////////////////
// Second level of redirection muxing                                //
///////////////////////////////////////////////////////////////////////
ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_4__stack_50c__width_49 thr0_pc_bf_mux  (
 .din0( thr0_trap_rd_pc_bf[48:0]),       // redirection pc from 1st level of muxing
 .din1( curr_thr_pc_bf[48:0]),           // Current thread incr  pc. 
 .din2( by_pass_pc_update_bf[48:0]),      // select bypass incremented addr. 
 .din3( thr0_pc_f[48:0]),                // Hold the pc_f for the this thread
 .sel0( agc_thr0_pcf_sel_bf[0]),
 .sel1( agc_thr0_pcf_sel_bf[1]),
 .sel2( agc_thr0_pcf_sel_bf[2]),
 .sel3( agc_thr0_pcf_sel_bf[3]),
 .dout( thr0_pc_before_last_bf[48:0]           ));

ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_2__stack_50c__width_49 thr0_pc_bf_last_mux  (
 .din0( {1'b0,address0_m_rep0[47:0]}),    // br misprediction pc from thread_g_0
 .din1( thr0_pc_before_last_bf[48:0]),       // redirection pc from 1st level of muxing
 .sel0( agc_thr0_pcf_sel_last_bf[0]),
 .sel1( agc_thr0_pcf_sel_last_bf[1]),
 .dout( next_thr0_pc_bf[48:0]           ));

ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_4__stack_50c__width_49 thr1_pc_bf_mux  (
 .din0( thr1_trap_rd_pc_bf[48:0]),       // redirection pc from 1st level of muxing
 .din1( curr_thr_pc_bf[48:0]),           // Current thread incr  pc. 
 .din2( by_pass_pc_update_bf[48:0]),         // select bypass incremented addr. 
 .din3( thr1_pc_f[48:0]),                // Hold the pc_f for the this thread
 .sel0( agc_thr1_pcf_sel_bf[0]),
 .sel1( agc_thr1_pcf_sel_bf[1]),
 .sel2( agc_thr1_pcf_sel_bf[2]),
 .sel3( agc_thr1_pcf_sel_bf[3]),
 .dout( thr1_pc_before_last_bf[48:0]           ));

ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_2__stack_50c__width_49 thr1_pc_bf_last_mux  (
 .din0( {1'b0,address0_m_rep0[47:0]}),    // br misprediction pc from thread_g_0
 .din1( thr1_pc_before_last_bf[48:0]),       // redirection pc from 1st level of muxing
 .sel0( agc_thr1_pcf_sel_last_bf[0]),
 .sel1( agc_thr1_pcf_sel_last_bf[1]),
 .dout( next_thr1_pc_bf[48:0]           ));

ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_4__stack_50c__width_49 thr2_pc_bf_mux  (
 .din0( thr2_trap_rd_pc_bf[48:0]),       // redirection pc from 1st level of muxing
 .din1( curr_thr_pc_bf[48:0]),           // Current thread incr  pc. 
 .din2( by_pass_pc_update_bf[48:0]),         // select bypass incremented addr. 
 .din3( thr2_pc_f[48:0]),                // Hold the pc_f for the this thread
 .sel0( agc_thr2_pcf_sel_bf[0]),
 .sel1( agc_thr2_pcf_sel_bf[1]),
 .sel2( agc_thr2_pcf_sel_bf[2]),
 .sel3( agc_thr2_pcf_sel_bf[3]),
 .dout( thr2_pc_before_last_bf[48:0]           ));

ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_2__stack_50c__width_49 thr2_pc_bf_last_mux  (
 .din0( {1'b0,address0_m_rep0[47:0]}),    // br misprediction pc from thread_g_0
 .din1( thr2_pc_before_last_bf[48:0]),       // redirection pc from 1st level of muxing
 .sel0( agc_thr2_pcf_sel_last_bf[0]),
 .sel1( agc_thr2_pcf_sel_last_bf[1]),
 .dout( next_thr2_pc_bf[48:0]           ));

ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_4__stack_50c__width_49 thr3_pc_bf_mux  (
 .din0( thr3_trap_rd_pc_bf[48:0]),       // redirection pc from 1st level of muxing
 .din1( curr_thr_pc_bf[48:0]),           // Current thread incr  pc. 
 .din2( by_pass_pc_update_bf[48:0]),         // select bypass incremented addr. 
 .din3( thr3_pc_f[48:0]),                // Hold the pc_f for the this thread
 .sel0( agc_thr3_pcf_sel_bf[0]),
 .sel1( agc_thr3_pcf_sel_bf[1]),
 .sel2( agc_thr3_pcf_sel_bf[2]),
 .sel3( agc_thr3_pcf_sel_bf[3]),
 .dout( thr3_pc_before_last_bf[48:0]           ));

ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_2__stack_50c__width_49 thr3_pc_bf_last_mux  (
 .din0( {1'b0,address0_m_rep0[47:0]}),    // br misprediction pc from thread_g_0
 .din1( thr3_pc_before_last_bf[48:0]),       // redirection pc from 1st level of muxing
 .sel0( agc_thr3_pcf_sel_last_bf[0]),
 .sel1( agc_thr3_pcf_sel_last_bf[1]),
 .dout( next_thr3_pc_bf[48:0]           ));

ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_4__stack_50c__width_49 thr4_pc_bf_mux  (
 .din0( thr4_trap_rd_pc_bf[48:0]),       // redirection pc from 1st level of muxing
 .din1( curr_thr_pc_bf[48:0]),           // Current thread incr  pc. 
 .din2( by_pass_pc_update_bf[48:0]),         // select bypass incremented addr. 
 .din3( thr4_pc_f[48:0]),                // Hold the pc_f for the this thread
 .sel0( agc_thr4_pcf_sel_bf[0]),
 .sel1( agc_thr4_pcf_sel_bf[1]),
 .sel2( agc_thr4_pcf_sel_bf[2]),
 .sel3( agc_thr4_pcf_sel_bf[3]),
 .dout( thr4_pc_before_last_bf[48:0]           ));

ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_2__stack_50c__width_49 thr4_pc_bf_last_mux  (
 .din0( {1'b0,address1_m_rep0[47:0]}),    // br misprediction pc from thread_g_1
 .din1( thr4_pc_before_last_bf[48:0]),       // redirection pc from 1st level of muxing
 .sel0( agc_thr4_pcf_sel_last_bf[0]),
 .sel1( agc_thr4_pcf_sel_last_bf[1]),
 .dout( next_thr4_pc_bf[48:0]           ));

ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_4__stack_50c__width_49 thr5_pc_bf_mux  (
 .din0( thr5_trap_rd_pc_bf[48:0]),       // redirection pc from 1st level of muxing
 .din1( curr_thr_pc_bf[48:0]),           // Current thread incr  pc. 
 .din2( by_pass_pc_update_bf[48:0]),         // select bypass incremented addr. 
 .din3( thr5_pc_f[48:0]),                // Hold the pc_f for the this thread
 .sel0( agc_thr5_pcf_sel_bf[0]),
 .sel1( agc_thr5_pcf_sel_bf[1]),
 .sel2( agc_thr5_pcf_sel_bf[2]),
 .sel3( agc_thr5_pcf_sel_bf[3]),
 .dout( thr5_pc_before_last_bf[48:0]           ));

ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_2__stack_50c__width_49 thr5_pc_bf_last_mux  (
 .din0( {1'b0,address1_m_rep0[47:0]}),    // br misprediction pc from thread_g_1
 .din1( thr5_pc_before_last_bf[48:0]),       // redirection pc from 1st level of muxing
 .sel0( agc_thr5_pcf_sel_last_bf[0]),
 .sel1( agc_thr5_pcf_sel_last_bf[1]),
 .dout( next_thr5_pc_bf[48:0]           ));

ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_4__stack_50c__width_49 thr6_pc_bf_mux  (
 .din0( thr6_trap_rd_pc_bf[48:0]),       // redirection pc from 1st level of muxing
 .din1( curr_thr_pc_bf[48:0]),           // Current thread incr  pc. 
 .din2( by_pass_pc_update_bf[48:0]),         // select bypass incremented addr. 
 .din3( thr6_pc_f[48:0]),                // Hold the pc_f for the this thread
 .sel0( agc_thr6_pcf_sel_bf[0]),
 .sel1( agc_thr6_pcf_sel_bf[1]),
 .sel2( agc_thr6_pcf_sel_bf[2]),
 .sel3( agc_thr6_pcf_sel_bf[3]),
 .dout( thr6_pc_before_last_bf[48:0]           ));

ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_2__stack_50c__width_49 thr6_pc_bf_last_mux  (
 .din0( {1'b0,address1_m_rep0[47:0]}),    // br misprediction pc from thread_g_1
 .din1( thr6_pc_before_last_bf[48:0]),       // redirection pc from 1st level of muxing
 .sel0( agc_thr6_pcf_sel_last_bf[0]),
 .sel1( agc_thr6_pcf_sel_last_bf[1]),
 .dout( next_thr6_pc_bf[48:0]           ));

ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_4__stack_50c__width_49 thr7_pc_bf_mux  (
 .din0( thr7_trap_rd_pc_bf[48:0]),       // redirection pc from 1st level of muxing
 .din1( curr_thr_pc_bf[48:0]),           // Current thread incr  pc. 
 .din2( by_pass_pc_update_bf[48:0]),         // select bypass incremented addr. 
 .din3( thr7_pc_f[48:0]),                // Hold the pc_f for the this thread
 .sel0( agc_thr7_pcf_sel_bf[0]),
 .sel1( agc_thr7_pcf_sel_bf[1]),
 .sel2( agc_thr7_pcf_sel_bf[2]),
 .sel3( agc_thr7_pcf_sel_bf[3]),
 .dout( thr7_pc_before_last_bf[48:0]           ));


ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_2__stack_50c__width_49 thr7_pc_bf_last_mux  (
 .din0( {1'b0,address1_m_rep0[47:0]}),    // br misprediction pc from thread_g_1
 .din1( thr7_pc_before_last_bf[48:0]),       // redirection pc from 1st level of muxing
 .sel0( agc_thr7_pcf_sel_last_bf[0]),
 .sel1( agc_thr7_pcf_sel_last_bf[1]),
 .dout( next_thr7_pc_bf[48:0]           ));

///////////////////////////////////////////////////////////////////////
// Thread 0 to thread 7 pc_f registers                               //
///////////////////////////////////////////////////////////////////////
ifu_ftu_agd_dp_msff_macro__stack_50c__width_49 thr0_pc_f_reg  (
 .scan_in(thr0_pc_f_reg_scanin),
 .scan_out(thr0_pc_f_reg_scanout),
 .clk ( l2clk                ),
 .en  ( ftp_any_thr_clken                 ),  
 .din ( next_thr0_pc_bf[48:0]),
 .dout( thr0_pc_f[48:0]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));
 
// buff_macro thr0_pc_f_reg_buf (width=49,stack=50c,dbuff=32x) (
//  .din ( thr0_pc_f_to_buf[48:0]     ),
//  .dout( thr0_pc_f[48:0]     ));

assign agd_thr0_pc_4_2_f[4:2] = thr0_pc_f[4:2] ;

ifu_ftu_agd_dp_msff_macro__stack_50c__width_49 thr1_pc_f_reg  (
 .scan_in(thr1_pc_f_reg_scanin),
 .scan_out(thr1_pc_f_reg_scanout),
 .clk ( l2clk                ),
 .en  ( ftp_any_thr_clken                 ),  
 .din ( next_thr1_pc_bf[48:0]),
 .dout( thr1_pc_f[48:0]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

assign agd_thr1_pc_4_2_f[4:2] = thr1_pc_f[4:2] ;


ifu_ftu_agd_dp_msff_macro__stack_50c__width_49 thr2_pc_f_reg  (
 .scan_in(thr2_pc_f_reg_scanin),
 .scan_out(thr2_pc_f_reg_scanout),
 .clk ( l2clk                ),
 .en  ( ftp_any_thr_clken    ),  
 .din ( next_thr2_pc_bf[48:0]),
 .dout( thr2_pc_f[48:0]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

assign agd_thr2_pc_4_2_f[4:2] = thr2_pc_f[4:2] ;


ifu_ftu_agd_dp_msff_macro__stack_50c__width_49 thr3_pc_f_reg  (
 .scan_in(thr3_pc_f_reg_scanin),
 .scan_out(thr3_pc_f_reg_scanout),
 .clk ( l2clk                ),
 .en  ( ftp_any_thr_clken    ),  
 .din ( next_thr3_pc_bf[48:0]),
 .dout( thr3_pc_f[48:0]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

assign agd_thr3_pc_4_2_f[4:2] = thr3_pc_f[4:2] ;


ifu_ftu_agd_dp_msff_macro__stack_50c__width_49 thr4_pc_f_reg  (
 .scan_in(thr4_pc_f_reg_scanin),
 .scan_out(thr4_pc_f_reg_scanout),
 .clk ( l2clk                ),
 .en  ( ftp_any_thr_clken    ),  
 .din ( next_thr4_pc_bf[48:0]),
 .dout( thr4_pc_f[48:0]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

assign agd_thr4_pc_4_2_f[4:2] = thr4_pc_f[4:2] ;


ifu_ftu_agd_dp_msff_macro__stack_50c__width_49 thr5_pc_f_reg  (
 .scan_in(thr5_pc_f_reg_scanin),
 .scan_out(thr5_pc_f_reg_scanout),
 .clk ( l2clk                ),
 .en  ( ftp_any_thr_clken    ),  
 .din ( next_thr5_pc_bf[48:0]),
 .dout( thr5_pc_f[48:0]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

assign agd_thr5_pc_4_2_f[4:2] = thr5_pc_f[4:2] ;


ifu_ftu_agd_dp_msff_macro__stack_50c__width_49 thr6_pc_f_reg  (
 .scan_in(thr6_pc_f_reg_scanin),
 .scan_out(thr6_pc_f_reg_scanout),
 .clk ( l2clk                ),
 .en  ( ftp_any_thr_clken    ),  
 .din ( next_thr6_pc_bf[48:0]),
 .dout( thr6_pc_f[48:0]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

assign agd_thr6_pc_4_2_f[4:2] = thr6_pc_f[4:2] ;

ifu_ftu_agd_dp_msff_macro__stack_50c__width_49 thr7_pc_f_reg  (
 .scan_in(thr7_pc_f_reg_scanin),
 .scan_out(thr7_pc_f_reg_scanout),
 .clk ( l2clk                ),
 .en  ( ftp_any_thr_clken    ),  
 .din ( next_thr7_pc_bf[48:0]),
 .dout( thr7_pc_f[48:0]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

assign agd_thr7_pc_4_2_f[4:2] = thr7_pc_f[4:2] ;

assign curr_thr_pc_bf[48:0] = {inc_pc_bf[48:2], 2'b00} ;
assign curr_thr_pc_crit_bf[10:5] = inc_pc_crit_bf[10:5] ;
///////////////////////////////////////////////////////////////////////
// Mux between the branch address flopped and the thread pc register //
///////////////////////////////////////////////////////////////////////
ifu_ftu_agd_dp_mux_macro__mux_pgpe__ports_2__stack_50c__width_49 thr0_pc_reg_mux  (
 .din0( {1'b0,address0_m_rep0[47:0]}),     // branch address 0 flopped
 .din1( thr0_pc_f[48:0]),      // thread 0 pc_f
 .sel0( ftp_thr0_sel_br_bf),
 .dout( thr0_pc_muxed_f[48:0]         ));

ifu_ftu_agd_dp_mux_macro__mux_pgpe__ports_2__stack_50c__width_49 thr1_pc_reg_mux  (
 .din0( {1'b0,address0_m_rep0[47:0]}),     // branch address 0 flopped
 .din1( thr1_pc_f[48:0]),      // thread 1 pc_f
 .sel0( ftp_thr1_sel_br_bf),
 .dout( thr1_pc_muxed_f[48:0]         ));

ifu_ftu_agd_dp_mux_macro__mux_pgpe__ports_2__stack_50c__width_49 thr2_pc_reg_mux  (
 .din0( {1'b0,address0_m_rep0[47:0]}),     // branch address 0 flopped
 .din1( thr2_pc_f[48:0]),      // thread 2 pc_f
 .sel0( ftp_thr2_sel_br_bf),
 .dout( thr2_pc_muxed_f[48:0]         ));

ifu_ftu_agd_dp_mux_macro__mux_pgpe__ports_2__stack_50c__width_49 thr3_pc_reg_mux  (
 .din0( {1'b0,address0_m_rep0[47:0]}),     // branch address 0 flopped
 .din1( thr3_pc_f[48:0]),      // thread 3 pc_f
 .sel0( ftp_thr3_sel_br_bf),
 .dout( thr3_pc_muxed_f[48:0]         ));

ifu_ftu_agd_dp_mux_macro__mux_pgpe__ports_2__stack_50c__width_49 thr4_pc_reg_mux  (
 .din0( {1'b0,address1_m_rep0[47:0]}),     // branch address 1 flopped
 .din1( thr4_pc_f[48:0]),      // thread 4 pc_f
 .sel0( ftp_thr4_sel_br_bf),
 .dout( thr4_pc_muxed_f[48:0]         ));

ifu_ftu_agd_dp_mux_macro__mux_pgpe__ports_2__stack_50c__width_49 thr5_pc_reg_mux  (
 .din0( {1'b0,address1_m_rep0[47:0]}),     // branch address 1 flopped
 .din1( thr5_pc_f[48:0]),      // thread 5 pc_f
 .sel0( ftp_thr5_sel_br_bf),
 .dout( thr5_pc_muxed_f[48:0]         ));

ifu_ftu_agd_dp_mux_macro__mux_pgpe__ports_2__stack_50c__width_49 thr6_pc_reg_mux  (
 .din0( {1'b0,address1_m_rep0[47:0]}),     // branch address 1 flopped
 .din1( thr6_pc_f[48:0]),      // thread 6 pc_f
 .sel0( ftp_thr6_sel_br_bf),
 .dout( thr6_pc_muxed_f[48:0]         ));

ifu_ftu_agd_dp_mux_macro__mux_pgpe__ports_2__stack_50c__width_49 thr7_pc_reg_mux  (
 .din0( {1'b0,address1_m_rep0[47:0]}),     // branch address 1 flopped
 .din1( thr7_pc_f[48:0]),      // thread 7 pc_f
 .sel0( ftp_thr7_sel_br_bf),
 .dout( thr7_pc_muxed_f[48:0]         ));


///////////////////////////////////////////////////////////////////////
// One mux for all eight PCs from the different threads.             //
///////////////////////////////////////////////////////////////////////

// buff_macro tst_mux_rep0 (width=1,dbuff=48x) (
//  .din ( tcu_muxtest     ),
//  .dout( tcu_muxtest_rep0     ));

ifu_ftu_agd_dp_mux_macro__dmux_8x__mux_aonpe__ports_8__stack_50c__width_49 new_thr_pc_mux  (
 .din0( thr0_pc_muxed_f[48:0]),      // thread 0 pc_f
 .din1( thr1_pc_muxed_f[48:0]),      // thread 1 pc_f
 .din2( thr2_pc_muxed_f[48:0]),      // thread 2 pc_f
 .din3( thr3_pc_muxed_f[48:0]),      // thread 3 pc_f
 .din4( thr4_pc_muxed_f[48:0]),      // thread 4 pc_f
 .din5( thr5_pc_muxed_f[48:0]),      // thread 5 pc_f
 .din6( thr6_pc_muxed_f[48:0]),      // thread 6 pc_f
 .din7( thr7_pc_muxed_f[48:0]),      // thread 7 pc_f
//  .muxtst (tcu_muxtest_rep0),
 .sel0( ftp_new_thr_sel_bf[0]),
 .sel1( ftp_new_thr_sel_bf[1]),
 .sel2( ftp_new_thr_sel_bf[2]),
 .sel3( ftp_new_thr_sel_bf[3]),
 .sel4( ftp_new_thr_sel_bf[4]),
 .sel5( ftp_new_thr_sel_bf[5]),
 .sel6( ftp_new_thr_sel_bf[6]),
 .sel7( ftp_new_thr_sel_bf[7]),
 .dout( new_thr_pc_bf[48:0]         ));

// mux_macro new_thr_pc_crit_mux (width=6,ports=8,mux=aonpe,stack=6l,dmux=8x,buffsel=none) (
//  .din0( thr0_pc_muxed_f[10:5]),      // thread 0 pc_f
//  .din1( thr1_pc_muxed_f[10:5]),      // thread 1 pc_f
//  .din2( thr2_pc_muxed_f[10:5]),      // thread 2 pc_f
//  .din3( thr3_pc_muxed_f[10:5]),      // thread 3 pc_f
//  .din4( thr4_pc_muxed_f[10:5]),      // thread 4 pc_f
//  .din5( thr5_pc_muxed_f[10:5]),      // thread 5 pc_f
//  .din6( thr6_pc_muxed_f[10:5]),      // thread 6 pc_f
//  .din7( thr7_pc_muxed_f[10:5]),      // thread 7 pc_f
//  .sel0( ftp_new_thr_sel_bf[0]),
//  .sel1( ftp_new_thr_sel_bf[1]),
//  .sel2( ftp_new_thr_sel_bf[2]),
//  .sel3( ftp_new_thr_sel_bf[3]),
//  .sel4( ftp_new_thr_sel_bf[4]),
//  .sel5( ftp_new_thr_sel_bf[5]),
//  .sel6( ftp_new_thr_sel_bf[6]),
//  .sel7( ftp_new_thr_sel_bf[7]),
//  .dout( new_thr_pc_crit_bf[10:5]         ));

// buff_macro new_thr_pc_buf (width=49,stack=50c) (
//  .din( new_thr_pc_to_buf[48:0]         ) ,
//  .dout( new_thr_pc_bf[48:0]         ));

///////////////////////////////////////////////////////////////////////
// Final mux for the PC_F                                            //
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

ifu_ftu_agd_dp_buff_macro__dbuff_48x__width_1 tst_mux_rep1  (
 .din ( tcu_muxtest     ),
 .dout( tcu_muxtest_rep1     ));

ifu_ftu_agd_dp_mux_macro__mux_pgnpe__ports_6__stack_50c__width_49 pc_f_am_mux  (
 .din0( new_thr_pc_bf[48:0]),             // new fetch thread pc 
 .din1( curr_thr_pc_bf[48:0]),            // current thread incr pc.  
 .din2( {17'b0, new_thr_pc_bf[31:0]}),    // new fetch thread pc am=1 
 .din3( {17'b0, curr_thr_pc_bf[31:0]}),   // current thread next pc. am=1  
 .din4( {1'b0, itc_va[47:13],13'b0}),     // itlb va address 
 .din5( {1'b0, asi_addr_bf[39:5],13'b0}), // itlb asi=53 translation request 
 .muxtst (tcu_muxtest_rep1),
 .sel0( ftp_pc_sel_am[0]),
 .sel1( ftp_pc_sel_am[1]),
 .sel2( ftp_pc_sel_am[2]),
 .sel3( ftp_pc_sel_am[3]),
 .sel4( ftp_pc_sel_am[4]),
 .sel5( ftp_pc_sel_am[5]),
 .dout( next_pc_bf[48:0]         ));


ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_3__stack_20r__width_19 pc_bf_to_itb_part1  (
 .din0( curr_thr_pc_bf[31:13]),            // current thread incr pc.  
 .din1( itc_va[31:13]),                    // itlb va address 
 .din2( asi_addr_bf[23:5]),                // itlb asi=53 translation request 
 .sel0( ftp_pc_sel_tag_part1[0]),
 .sel1( ftp_pc_sel_tag_part1[1]),
 .sel2( ftp_pc_sel_tag_part1[2]),
 .dout( pc_tag_1[31:13]         ));

ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_4__stack_20c__width_16 pc_bf_to_itb_part2  (
 .din0( curr_thr_pc_bf[47:32]),            // current thread incr pc.  
 .din1( itc_va[47:32]),                    // itlb va address 
 .din2( asi_addr_bf[39:24]),               // itlb asi=53 translation request 
 .din3( 16'h0000),                         // itlb asi=53 translation request 
 .sel0( ftp_pc_sel_tag_part2[0]),
 .sel1( ftp_pc_sel_tag_part2[1]),
 .sel2( ftp_pc_sel_tag_part2[2]),
 .sel3( ftp_pc_sel_tag_part2[3]),
 .dout( pc_tag_1[47:32]         ));

ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_2__stack_20c__width_19 pc_bf_to_itb_bot  (
 .din0( new_thr_pc_bf[31:13]),            // current thread incr pc.  
 .din1( pc_tag_1[31:13]),                 // itlb va address 
 .sel0( ftp_pc_sel_tag_pc_bot[0]),
 .sel1( ftp_pc_sel_tag_pc_bot[1]),
 .dout( pc_tag[31:13]         ));


ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_2__stack_16c__width_16 pc_bf_to_itb_top  (
 .din0( new_thr_pc_bf[47:32]),            // current thread incr pc.  
 .din1( pc_tag_1[47:32]),     // itlb va address 
 .sel0( ftp_pc_sel_tag_pc_top[0]),
 .sel1( ftp_pc_sel_tag_pc_top[1]),
 .dout( pc_tag[47:32]         ));

ifu_ftu_agd_dp_buff_macro__dbuff_40x__rep_1__width_35 pc_tag_buffer  (
  .din ( pc_tag[47:13]         ),
  .dout( pc_tag_buf[47:13]         ));

// mux_macro pc_f_mux (width=49,ports=5,mux=aonpe,stack=50c,dmux=8x) (
//  .din0( next_am_pc_bf[48:0]),             // Normal path 
//  .din1( {1'b0, exu_address0_e[47:0]}),    // br0 misprediction pc am=0 
//  .din2( {17'b0, exu_address0_e[31:0]}),   // br0 target address am=1 
//  .din3( {1'b0, exu_address1_e[47:0]}),    // br1 misprediction pc am=0 
//  .din4( {17'b0, exu_address1_e[31:0]}),   // br1 target address am=1 
//  .sel0( agc_pc_sel_am_final[0]),
//  .sel1( agc_pc_sel_am_final[1]),
//  .sel2( agc_pc_sel_am_final[2]),
//  .sel3( agc_pc_sel_am_final[3]),
//  .sel4( agc_pc_sel_am_final[4]),
//  .dout( next_pc_bf[48:0]         ));

// buff_macro pc_f_mux_buf (width=49,stack=50c) (
//  .din ( next_pc_bf_to_buf[48:0]         ),
//  .dout( next_pc_bf[48:0]         ));

assign ifu_agd_pc_bf[47:0] = {pc_tag_buf[47:13],next_pc_bf[12:0]} ;

///////////////////////////////////////////////////////////////////////
// PC_F (fetch address at F stage)                                   //
///////////////////////////////////////////////////////////////////////
ifu_ftu_agd_dp_msff_macro__stack_50c__width_49 pc_f_reg  (
 .scan_in(pc_f_reg_scanin),
 .scan_out(pc_f_reg_scanout),
 .clk ( l2clk                ),
 .en  ( ftp_any_thr_clken    ),  
 .din ( next_pc_bf[48:0]),
 .dout( pc_f[48:0]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

assign ifu_agd_pc_f[47:2] = pc_f[47:2] ;
assign pc_f_unused[1:0] = pc_f[1:0] ;
assign agd_direct_map_rep_way[2:0] = pc_f[13:11] ;
///////////////////////////////////////////////////////////////////////
// Custom incrementor.                                               //
///////////////////////////////////////////////////////////////////////


////////////////////////////////////////////
// pc_f[47:4] is incremented depending // 
// on the bits [3:0]                      //
////////////////////////////////////////////

// assign inc_pc_bf[4] = (!pc_f[4]);
// assign inc_pc_bf[3] = (!pc_f[4]&pc_f[3]);
// assign inc_pc_bf[2] = (!pc_f[4]&pc_f[2]);
// assign pc_f_incr = (pc_f[4]);

ifu_ftu_agd_dp_inv_macro__stack_2c__width_1 pc_f_incr_b4   (
    .din(pc_f[4]),
    .dout(inc_pc_bf[4])
);

ifu_ftu_agd_dp_and_macro__ports_2__stack_2c__width_1 pc_f_incr_b3    (
    .din0(inc_pc_bf[4]),
    .din1(pc_f[3]),
    .dout(inc_pc_bf[3])
);

ifu_ftu_agd_dp_and_macro__ports_2__stack_2c__width_1 pc_f_incr_b2    (
    .din0(inc_pc_bf[4]),
    .din1(pc_f[2]),
    .dout(inc_pc_bf[2])
);
assign pc_f_incr = pc_f[4] ;


ifu_ftu_agd_dp_increment_macro__dincr_8x__width_32 pc_f_data_32b_inc   (
  .din( pc_f[36:5] ) ,
  .cin(pc_f_incr ) ,
  .dout(inc_pc_bf[36:5] ) ,
  .cout(inc_pc_f_top_data )) ;

ifu_ftu_agd_dp_increment_macro__dincr_8x__width_8 pc_f_data_8b_crit_inc   (
  .din( {2'b00,pc_f[10:5]} ) ,
  .cin(pc_f_incr) ,
  .dout({nc_crit_unused[1:0],inc_pc_crit_bf[10:5]} ) ,
  .cout(inc_crit_cout_unused )) ;

ifu_ftu_agd_dp_increment_macro__dincr_8x__width_16 pc_f_plus_4_16b_at_f   (
  .din( {5'b00000,pc_f[47:37]} ) ,
  .cin(1'b1 ) ,
  .dout({pc_f_1_unused[52:48], inc_pc_bf_top_inc[47:37] }) ,
  .cout(pc_f_2_unused )) ;

// assign inc_pc_bf_top_inc[48] = inc_pc_bf_top_inc[47] & ~pc_f[47] ;
ifu_ftu_agd_dp_inv_macro__stack_2c__width_1 pc_f_b47_l   (
    .din(pc_f[47]),
    .dout(pc_f_[47])
);

ifu_ftu_agd_dp_and_macro__ports_2__stack_2c__width_1 pc_f_incr_b48    (
    .din0(pc_f_[47]),
    .din1(inc_pc_bf_top_inc[47]),
    .dout(inc_pc_bf_top_inc[48])
);




ifu_ftu_agd_dp_mux_macro__mux_pgpe__ports_2__stack_16c__width_16 pc_f_p_plus4_mux  (
 .din0( {4'b0000,inc_pc_bf_top_inc[48:37]}),
 .din1( {4'b0000,pc_f[48:37]}),
 .sel0( inc_pc_f_top_data),
 .dout( {pc_f_3_unused[52:49],inc_pc_bf[48:37]}         ));


ifu_ftu_agd_dp_increment_macro__dincr_8x__width_32 by_p_data_32b_inc   (
  .din( by_pass_pc_addr_to_buf[36:5] ) ,
  .cin(by_pass_pc_addr_bf_incr_to_buf ) ,
  .dout(by_pass_inc_pc_bf[36:5] ) ,
  .cout(inc_by_pass_pc_addr_bf_top_data )) ;

ifu_ftu_agd_dp_increment_macro__dincr_8x__width_16 by_p_pc_plus_4_16b_at_bf   (
  .din( {5'b00000,by_pass_pc_addr_to_buf[47:37]} ) ,
  .cin(1'b1 ) ,
  .dout({by_pass_pc_addr_bf_1_unused[52:48], by_pass_inc_pc_bf_top_inc[47:37] }) ,
  .cout(by_pass_pc_addr_bf_2_unused )) ;

ifu_ftu_agd_dp_inv_macro__stack_2c__width_1 by_pass_pc_f_b47_l   (
    .din(by_pass_pc_addr_bf[47]),
    .dout(by_pass_pc_addr_bf_[47])
);

ifu_ftu_agd_dp_and_macro__ports_2__stack_2c__width_1 by_pass_pc_f_incr_b48    (
    .din0(by_pass_pc_addr_bf_[47]),
    .din1(by_pass_inc_pc_bf_top_inc[47]),
    .dout(by_pass_inc_pc_bf_top_inc[48])
);





ifu_ftu_agd_dp_mux_macro__mux_pgpe__ports_2__stack_16c__width_16 by_p_pc_p_plus4_mux  (
 .din0( {4'b0000,by_pass_inc_pc_bf_top_inc[48:37]}),
 .din1( {5'b00000,by_pass_pc_addr_bf[47:37]}),
 .sel0( inc_by_pass_pc_addr_bf_top_data),
 .dout( {by_pass_pc_addr_bf_3_unused[52:49],by_pass_inc_pc_bf[48:37]}         ));





ifu_ftu_agd_dp_buff_macro__dbuff_32x__rep_1__stack_50c__width_49 by_pass_inc_pc_reg_buf  (
 .din ( {by_pass_inc_pc_bf[48:2],2'b00}     ),
 .dout( by_pass_pc_update_bf[48:0]     ));

//  assign by_pass_pc_update_bf[48:0] = {by_pass_inc_pc_bf[48:2],2'b00} ;


///////////////////////////////////////////////////////////////////////
// Final mux for the ICADDR                                          //
///////////////////////////////////////////////////////////////////////

ifu_ftu_agd_dp_mux_macro__mux_pgpe__ports_2__stack_12c__width_11 mbist_addr_mux  (
 .din0( {agd_mbist_addr_bf[4:0],6'b0}),    // 
 .din1( {agd_mbist_addr_bf[5:0],agd_mbist_cmpsel_bf[2:0],2'b0}),    // 
 .sel0( ftp_sel_icv_mbist_addr),
 .dout( mbist_addr_muxed[10:0]                               ));

ifu_ftu_agd_dp_buff_macro__dbuff_24x__width_1 tst_mux_rep2  (
 .din ( tcu_muxtest     ),
 .dout( tcu_muxtest_rep2     ));

ifu_ftu_agd_dp_buff_macro__minbuff_1__width_9 curr_thr_pc_bf_minbuf  (
 .din ( curr_thr_pc_bf[10:2]),
 .dout( curr_thr_pc_bf_del[10:2])
);

ifu_ftu_agd_dp_mux_macro__mux_pgnpe__ports_5__stack_12c__width_11 icaddr_first_mux  (
 .din0( new_thr_pc_bf[10:0]),             // new fetch thread pc 
 .din1( {curr_thr_pc_bf_del[10:2],2'b00}),// current thread incr pc.  
 .din2( {phys_addr_bf[10:5],5'b00000}),   // Icache fill write index. 
 .din3( {asi_addr_bf[11:3],2'b00}),            // Icache asi  write index. 
 .din4( mbist_addr_muxed[10:0]),    // 
 .muxtst (tcu_muxtest_rep2),
 .sel0( ftp_icaddr_sel_first_mux[0]),
 .sel1( ftp_icaddr_sel_first_mux[1]),
 .sel2( ftp_icaddr_sel_first_mux[2]),
 .sel3( ftp_icaddr_sel_first_mux[3]),
 .sel4( ftp_icaddr_sel_first_mux[4]),
.dout( {agd_ic_index_bf[10:2],agd_ic_index_bf_unused[1:0]}         ));

ifu_ftu_agd_dp_buff_macro__dbuff_24x__width_1 tst_mux_rep4  (
 .din ( tcu_muxtest     ),
 .dout( tcu_muxtest_rep4     ));

ifu_ftu_agd_dp_mux_macro__mux_pgnpe__ports_5__stack_6l__width_6 ict_addr_first_mux  (
 .din0( new_thr_pc_bf[10:5]),             // new fetch thread pc 
 .din1( curr_thr_pc_crit_bf[10:5]),       // current thread incr pc.  
 .din2( phys_addr_bf[10:5]),              // Icache fill write index. 
 .din3( asi_addr_bf[11:6]),               // Icache asi  write index. 
 .din4( agd_mbist_addr_bf[5:0]),          // bist address 
 .muxtst (tcu_muxtest_rep4),
 .sel0( ftp_icaddr_sel_first_mux[0]),
 .sel1( ftp_icaddr_sel_first_mux[1]),
 .sel2( ftp_icaddr_sel_first_mux[2]),
 .sel3( ftp_icaddr_sel_first_mux[3]),
 .sel4( ftp_icaddr_sel_first_mux[4]),
.dout( agd_ict_index_bf[10:5]         ));

ifu_ftu_agd_dp_msff_macro__stack_50c__width_36 mbist_in_reg  (
 .scan_in(mbist_in_reg_scanin),
 .scan_out(mbist_in_reg_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1    ),  
 .din ( {mbi_addr[5:0],mbi_cmpsel[2:0],mbi_wdata[7:0],agd_mbist_wdata_bf[7:0],agd_mbist_wdata_f[7:0],mbi_icv_read_en,
         mbi_icv_read_en_bf, mbi_icv_read_en_f}),
 .dout( {agd_mbist_addr_bf[5:0],agd_mbist_cmpsel_bf[2:0],agd_mbist_wdata_bf[7:0],agd_mbist_wdata_f[7:0],
         agd_mbist_wdata_c[7:0],mbi_icv_read_en_bf,mbi_icv_read_en_f, mbi_icv_read_en_c}     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// mux_macro icaddr_mux (width=11,ports=4,mux=aonpe,stack=12c,dmux=8x) (
//  .din0( agd_ic_index_first_bf[10:0]),   // 
//  .din1( exu_address0_e[10:0]),    //
//  .din2( exu_address1_e[10:0]),    // 
//  .din3( {agd_mbist_addr_bf[8:0],2'b0}),    // 
//  .sel0( ftp_icaddr_sel_final_mux[0]),
//  .sel1( ftp_icaddr_sel_final_mux[1]),
//  .sel2( ftp_icaddr_sel_final_mux[2]),
//  .sel3( ftp_icaddr_sel_final_mux[3]), 
// .dout( {agd_ic_index_bf[10:2],agd_ic_index_bf_unused[1:0]}         ));

///////////////////////////////////////////////////////////////////////
// ICache ADDR Index                                                 // 
///////////////////////////////////////////////////////////////////////


ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_4__stack_12c__width_5 icv_indx_mux  (
 .din0( phys_addr_bf[10:6]),   //
 .din1( inv_addr_bf[10:6] ),    //
 .din2( asi_addr_bf[11:7] ),    //
 .din3( agd_mbist_addr_bf[4:0]),    // 
 .sel0( agc_sel_inv_index[0]),
 .sel1( agc_sel_inv_index[1]),
 .sel2( agc_sel_inv_index[2]),
 .sel3( agc_sel_inv_index[3]),
 .dout( agd_icv_windex_bf[10:6]         ));


//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////
// PC at C stage.                           //
//////////////////////////////////////////////

ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_4__stack_50c__width_47 pc_c_mux  (
 .din0( pc_wo_by_pass_c[48:2]),                            
 .din1( by_pass_pc_addr_bf[48:2]),        
 .din2( by_pass_pc_addr_f[48:2]),        
 .din3( by_pass_pc_addr_c[48:2]),        
 .sel0( agc_pc_sel_for_c[0]),
 .sel1( agc_pc_sel_for_c[1]),
 .sel2( agc_pc_sel_for_c[2]),
 .sel3( agc_pc_sel_for_c[3]),
 .dout( pc_c_to_buf[48:2]         ));

ifu_ftu_agd_dp_buff_macro__stack_50c__width_47 pc_c_mux_buf  (
 .din ( pc_c_to_buf[48:2]         ),
 .dout( pc_c[48:2]         ));

assign pc_c[1:0]  = 2'b00 ;
ifu_ftu_agd_dp_msff_macro__minbuff_1__stack_50c__width_49 pc_wo_by_pass_c_reg  (
 .scan_in(pc_wo_by_pass_c_reg_scanin),
 .scan_out(pc_wo_by_pass_c_reg_scanout),
 .clk ( l2clk                ),
 .en  ( ftp_any_thr_clken    ),  
 .din ({pc_f[48:2],2'b00}),
 .dout(pc_wo_by_pass_c[48:0]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

assign ftu_paddr[12:0] = pc_wo_by_pass_c[12:0];
assign agd_va_hole_excp_f = pc_f[48] ;


//////////////////////////////////////////////
//////////////////////////////////////////////
//////////////////////////////////////////////

ifu_ftu_agd_dp_msff_macro__stack_8c__width_8 by_pass_sel_reg  (
 .scan_in(by_pass_sel_reg_scanin),
 .scan_out(by_pass_sel_reg_scanout),
 .clk ( l2clk                ),
 .en  ( ftp_any_thr_clken    ),  
 .din ({cmu_thr7_data_ready,cmu_thr6_data_ready,cmu_thr5_data_ready,cmu_thr4_data_ready,
        cmu_thr3_data_ready,cmu_thr2_data_ready,cmu_thr1_data_ready,cmu_thr0_data_ready}),
 .dout(by_pass_sel_bf[7:0]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


ifu_ftu_agd_dp_mux_macro__dmux_8x__mux_aonpe__ports_8__stack_52c__width_51 by_pass_pc_mux  (
 .din0( {thr0_pc_f[48:2],agc_thr0_byp_pc_update_bf[4:2],agc_thr0_byp_incr_bit5}),
 .din1( {thr1_pc_f[48:2],agc_thr1_byp_pc_update_bf[4:2],agc_thr1_byp_incr_bit5}),
 .din2( {thr2_pc_f[48:2],agc_thr2_byp_pc_update_bf[4:2],agc_thr2_byp_incr_bit5}),
 .din3( {thr3_pc_f[48:2],agc_thr3_byp_pc_update_bf[4:2],agc_thr3_byp_incr_bit5}),
 .din4( {thr4_pc_f[48:2],agc_thr4_byp_pc_update_bf[4:2],agc_thr4_byp_incr_bit5}),
 .din5( {thr5_pc_f[48:2],agc_thr5_byp_pc_update_bf[4:2],agc_thr5_byp_incr_bit5}),
 .din6( {thr6_pc_f[48:2],agc_thr6_byp_pc_update_bf[4:2],agc_thr6_byp_incr_bit5}),
 .din7( {thr7_pc_f[48:2],agc_thr7_byp_pc_update_bf[4:2],agc_thr7_byp_incr_bit5}),
 .sel0( by_pass_sel_bf[0]),
 .sel1( by_pass_sel_bf[1]),
 .sel2( by_pass_sel_bf[2]),
 .sel3( by_pass_sel_bf[3]),
 .sel4( by_pass_sel_bf[4]),
 .sel5( by_pass_sel_bf[5]),
 .sel6( by_pass_sel_bf[6]),
 .sel7( by_pass_sel_bf[7]),
 .dout( {by_pass_pc_addr_to_buf[48:2],by_pass_inc_pc_to_buf[4:2], by_pass_pc_addr_bf_incr_to_buf}));

// buff_macro by_pass_pc_mux_buf (width=51,stack=52c) (
//  .din ( {by_pass_pc_addr_to_buf[48:2],by_pass_inc_pc_to_buf[4:2], by_pass_pc_addr_bf_incr_to_buf}),
//  .dout( {by_pass_pc_addr_bf[48:2],by_pass_inc_pc_bf[4:2], by_pass_pc_addr_bf_incr}));

ifu_ftu_agd_dp_buff_macro__stack_52c__width_50 by_pass_pc_mux_buf  (
 .din ( {by_pass_pc_addr_to_buf[48:2],by_pass_inc_pc_to_buf[4:2]}),
 .dout( {by_pass_pc_addr_bf[48:2],by_pass_inc_pc_bf[4:2]}));

ifu_ftu_agd_dp_msff_macro__stack_50c__width_47 by_pass_pc_f_reg  (
 .scan_in(by_pass_pc_f_reg_scanin),
 .scan_out(by_pass_pc_f_reg_scanout),
 .clk ( l2clk                ),
 .en  ( ftp_any_thr_clken    ),  
 .din (by_pass_pc_addr_bf[48:2]),
 .dout(by_pass_pc_addr_f[48:2]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


ifu_ftu_agd_dp_msff_macro__stack_50c__width_47 by_pass_pc_c_reg  (
 .scan_in(by_pass_pc_c_reg_scanin),
 .scan_out(by_pass_pc_c_reg_scanout),
 .clk ( l2clk                ),
 .en  ( ftp_any_thr_clken    ),  
 .din (by_pass_pc_addr_f[48:2]),
 .dout(by_pass_pc_addr_c[48:2]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


///////////////////////////////////////////////////////////////////
// Stage the physical address to be written to the IC tags.      //
///////////////////////////////////////////////////////////////////
ifu_ftu_agd_dp_msff_macro__stack_50c__width_35 phys_addr_bf_reg  (
 .scan_in(phys_addr_bf_reg_scanin),
 .scan_out(phys_addr_bf_reg_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1    ),  
 .din (cmu_fill_paddr[39:5]),
 .dout(phys_addr_bf[39:5]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

ifu_ftu_agd_dp_prty_macro__width_8 tag_parity_0_gen  (
        .din    (phys_addr_bf[18:11]),
        .dout   (tag_parity[0])
);

ifu_ftu_agd_dp_prty_macro__width_8 tag_parity_1_gen  (
        .din    (phys_addr_bf[26:19]),
        .dout   (tag_parity[1])
);

ifu_ftu_agd_dp_prty_macro__width_8 tag_parity_2_gen  (
        .din    (phys_addr_bf[34:27]),
        .dout   (tag_parity[2])
);

ifu_ftu_agd_dp_prty_macro__width_8 tag_parity_3_gen  (
        .din    ({3'b000,phys_addr_bf[39:35]}),
        .dout   (tag_parity[3])
);

ifu_ftu_agd_dp_prty_macro__width_4 tag_parity_gen  (
        .din    (tag_parity[3:0]),
        .dout   (ic_tag_parity)
);

ifu_ftu_agd_dp_msff_macro__stack_12c__width_6 inv_addr_bf_reg  (
 .scan_in(inv_addr_bf_reg_scanin),
 .scan_out(inv_addr_bf_reg_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1    ),  
 .din ({cmu_icache_invalidate_index[10:6],agd_ic_index_bf[5]}),
 .dout({inv_addr_bf[10:6],agd_ic_index_f[5]}     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));



ifu_ftu_agd_dp_mux_macro__mux_pgpe__ports_2__stack_8r__width_8 icv_valid_f_mux  (
 .din0( icv_valid_f[15:8]),      // 
 .din1( icv_valid_f[7:0]),      // 
 .sel0( agd_ic_index_f[5]),
 .dout( agd_itlb_valid_f[7:0]                               ));
assign agd_itlb_valid_dupl_f[7:0]  = itlb_valid_dupl_f[7:0] ;

ifu_ftu_agd_dp_mux_macro__mux_pgpe__ports_2__stack_8r__width_8 icv_valid_f_below_icv_mux  (
 .din0( icv_valid_f[15:8]),      // 
 .din1( icv_valid_f[7:0]),      // 
 .sel0( agd_ic_index_f[5]),
 .dout( agd_itlb_valid_fast_f[7:0]                               ));

ifu_ftu_agd_dp_mux_macro__mux_pgpe__ports_2__stack_8r__width_8 icv_valid_f_2_mux  (
 .din0( icv_valid_f[31:24]),      // 
 .din1( icv_valid_f[23:16]),      // 
 .sel0( agd_ic_index_f[5]),
 .dout( itlb_valid_dupl_f[7:0]                               ));

// cmp_macro valid_err_detect (dcmp=8x,width=8) (
//     .dout( agd_ic_valid_err_l_to_buf),
//     .din0( itlb_valid_dupl_f[7:0]),
//     .din1( agd_itlb_valid_f[7:0])
// );

// buff_macro valid_err_detect_buf (width=1,stack=2r) (
//  .din ( agd_ic_valid_err_l_to_buf    ),
//  .dout( agd_ic_valid_err_l    ));

ifu_ftu_agd_dp_buff_macro__dbuff_32x__width_1 tst_mux_rep3  (
 .din ( tcu_muxtest     ),
 .dout( tcu_muxtest_rep3     ));


ifu_ftu_agd_dp_nand_macro__width_1 tag_data_mux_29_nand0  (
    .dout( tag_data_29_nand_0),
    .din0( ic_tag_parity), 
    .din1( ftp_ict_data_sel_bf[0]));

ifu_ftu_agd_dp_nand_macro__width_1 tag_data_mux_29_nand1  (
    .dout( tag_data_29_nand_1),
    .din0( asi_wr_data[29]), 
    .din1( ftp_ict_data_sel_bf[1]));

ifu_ftu_agd_dp_nand_macro__width_1 tag_data_mux_29_nand2  (
    .dout( tag_data_29_nand_2),
    .din0( agd_mbist_wdata_bf[5]), 
    .din1( ftp_ict_data_sel_bf[2]));

ifu_ftu_agd_dp_nand_macro__ports_3__width_1 tag_data_mux_29_nand3  (
    .dout( tag_data_29),
    .din0( tag_data_29_nand_0), 
    .din1( tag_data_29_nand_1), 
    .din2( tag_data_29_nand_2));


ifu_ftu_agd_dp_mux_macro__mux_pgnpe__ports_3__stack_50c__width_33 tag_data_mux  (
 // .din0( {3'b000,ic_tag_parity,phys_addr_bf[39:11]}),      // 
 .din0( {4'b000,phys_addr_bf[39:11]}),      // 
 .din1( asi_wr_data[32:0]),      // 
 .din2( {agd_mbist_wdata_bf[0],agd_mbist_wdata_bf[7:0],agd_mbist_wdata_bf[7:0], agd_mbist_wdata_bf[7:0], agd_mbist_wdata_bf[7:0]}),      // 
 .muxtst (tcu_muxtest_rep3),
 .sel0( ftp_ict_data_sel_bf[0]),
 .sel1( ftp_ict_data_sel_bf[1]),
 .sel2( ftp_ict_data_sel_bf[2]),
 .dout( agd_asi_bist_wrdata[32:0]                               ));

assign agd_ict_wrtag_bf[29:0] ={tag_data_29,agd_asi_bist_wrdata[28:0]} ;


ifu_ftu_agd_dp_msff_macro__minbuff_1__stack_16c__width_16 valid_c_reg_a  (
 .scan_in(valid_c_reg_a_scanin),
 .scan_out(valid_c_reg_a_scanout),
 .clk ( l2clk                ),
 .en  ( ftp_any_thr_clken    ),  
 .din (icv_valid_f[31:16]),
 .dout(icv_valid_c[31:16]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

ifu_ftu_agd_dp_msff_macro__minbuff_1__stack_16c__width_16 valid_c_reg_b  (
 .scan_in(valid_c_reg_b_scanin),
 .scan_out(valid_c_reg_b_scanout),
 .clk ( l2clk                ),
 .en  ( ftp_any_thr_clken    ),  
 .din (icv_valid_f[15:0]),
 .dout(icv_valid_c[15:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

ifu_ftu_agd_dp_cmp_macro__dcmp_8x__width_32 mbi_icv_fail_cmp  (
    .dout( agd_icv_fail_l),
    .din0( icv_valid_c[31:0]),
    .din1( {agd_mbist_wdata_c[7:0],agd_mbist_wdata_c[7:0],agd_mbist_wdata_c[7:0],agd_mbist_wdata_c[7:0]})
);

 ifu_ftu_agd_dp_inv_macro__width_1 icv_fail_inv_macro  (
    .dout( agd_icv_fail), 
    .din(  agd_icv_fail_l)
);

ifu_ftu_agd_dp_and_macro__width_1 icv_fail_and_qual  (
    .dout( ftu_mbi_icv_fail),
    .din0( agd_icv_fail), 
    .din1( mbi_icv_read_en_c));


  
// assign agd_ict_wrtag_bf[29:0] = {ic_tag_parity,phys_addr_bf[39:11]} ;

// assign se = tcu_scan_en ;
// fixscan start:
assign br_address0_m_reg0_scanin = scan_in                  ;
assign br_address0_m_reg1_scanin = br_address0_m_reg0_scanout;
assign br_address1_m_reg0_scanin = br_address0_m_reg1_scanout;
assign br_address1_m_reg1_scanin = br_address1_m_reg0_scanout;
assign thr0_pc_f_reg_scanin      = br_address1_m_reg1_scanout;
assign thr1_pc_f_reg_scanin      = thr0_pc_f_reg_scanout    ;
assign thr2_pc_f_reg_scanin      = thr1_pc_f_reg_scanout    ;
assign thr3_pc_f_reg_scanin      = thr2_pc_f_reg_scanout    ;
assign thr4_pc_f_reg_scanin      = thr3_pc_f_reg_scanout    ;
assign thr5_pc_f_reg_scanin      = thr4_pc_f_reg_scanout    ;
assign thr6_pc_f_reg_scanin      = thr5_pc_f_reg_scanout    ;
assign thr7_pc_f_reg_scanin      = thr6_pc_f_reg_scanout    ;
assign pc_f_reg_scanin           = thr7_pc_f_reg_scanout    ;
assign mbist_in_reg_scanin       = pc_f_reg_scanout         ;
assign pc_wo_by_pass_c_reg_scanin = mbist_in_reg_scanout     ;
assign by_pass_sel_reg_scanin    = pc_wo_by_pass_c_reg_scanout;
assign by_pass_pc_f_reg_scanin   = by_pass_sel_reg_scanout  ;
assign by_pass_pc_c_reg_scanin   = by_pass_pc_f_reg_scanout ;
assign phys_addr_bf_reg_scanin   = by_pass_pc_c_reg_scanout ;
assign inv_addr_bf_reg_scanin    = phys_addr_bf_reg_scanout ;
assign valid_c_reg_a_scanin      = inv_addr_bf_reg_scanout  ;
assign valid_c_reg_b_scanin      = valid_c_reg_a_scanout    ;
assign scan_out                  = valid_c_reg_b_scanout    ;
// fixscan end:
endmodule




//
//   buff macro
//
//





module ifu_ftu_agd_dp_buff_macro__dbuff_32x__stack_none__width_4 (
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

module ifu_ftu_agd_dp_msff_macro__stack_24l__width_24 (
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
wire [22:0] so;

  input [23:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [23:0] dout;


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
dff #(24)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[23:0]),
.si({scan_in,so[22:0]}),
.so({so[22:0],scan_out}),
.q(dout[23:0])
);




















endmodule









//
//   buff macro
//
//





module ifu_ftu_agd_dp_buff_macro__dbuff_48x__rep_1__stack_50c__width_48 (
  din, 
  dout);
  input [47:0] din;
  output [47:0] dout;






buff #(48)  d0_0 (
.in(din[47:0]),
.out(dout[47:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_3__stack_50c__width_49 (
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

  input [48:0] din0;
  input sel0;
  input [48:0] din1;
  input sel1;
  input [48:0] din2;
  input sel2;
  output [48:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(49)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[48:0]),
  .in1(din1[48:0]),
  .in2(din2[48:0]),
.dout(dout[48:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_4__stack_50c__width_49 (
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

  input [48:0] din0;
  input sel0;
  input [48:0] din1;
  input sel1;
  input [48:0] din2;
  input sel2;
  input [48:0] din3;
  input sel3;
  output [48:0] dout;





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
mux4s #(49)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[48:0]),
  .in1(din1[48:0]),
  .in2(din2[48:0]),
  .in3(din3[48:0]),
.dout(dout[48:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_2__stack_50c__width_49 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [48:0] din0;
  input sel0;
  input [48:0] din1;
  input sel1;
  output [48:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(49)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[48:0]),
  .in1(din1[48:0]),
.dout(dout[48:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_msff_macro__stack_50c__width_49 (
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
wire [47:0] so;

  input [48:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [48:0] dout;


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
dff #(49)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[48:0]),
.si({scan_in,so[47:0]}),
.so({so[47:0],scan_out}),
.q(dout[48:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_mux_macro__mux_pgpe__ports_2__stack_50c__width_49 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [48:0] din0;
  input [48:0] din1;
  input sel0;
  output [48:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(49)  d0_0 (
  .sel(psel1),
  .in0(din0[48:0]),
  .in1(din1[48:0]),
.dout(dout[48:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_mux_macro__dmux_8x__mux_aonpe__ports_8__stack_50c__width_49 (
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
  din6, 
  sel6, 
  din7, 
  sel7, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;
wire buffout7;

  input [48:0] din0;
  input sel0;
  input [48:0] din1;
  input sel1;
  input [48:0] din2;
  input sel2;
  input [48:0] din3;
  input sel3;
  input [48:0] din4;
  input sel4;
  input [48:0] din5;
  input sel5;
  input [48:0] din6;
  input sel6;
  input [48:0] din7;
  input sel7;
  output [48:0] dout;





cl_dp1_muxbuff8_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .in6(sel6),
 .in7(sel7),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5),
 .out6(buffout6),
 .out7(buffout7)
);
mux8s #(49)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[48:0]),
  .in1(din1[48:0]),
  .in2(din2[48:0]),
  .in3(din3[48:0]),
  .in4(din4[48:0]),
  .in5(din5[48:0]),
  .in6(din6[48:0]),
  .in7(din7[48:0]),
.dout(dout[48:0])
);









  



endmodule


//
//   buff macro
//
//





module ifu_ftu_agd_dp_buff_macro__dbuff_48x__width_1 (
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

module ifu_ftu_agd_dp_mux_macro__mux_pgnpe__ports_6__stack_50c__width_49 (
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
  muxtst, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;

  input [48:0] din0;
  input sel0;
  input [48:0] din1;
  input sel1;
  input [48:0] din2;
  input sel2;
  input [48:0] din3;
  input sel3;
  input [48:0] din4;
  input sel4;
  input [48:0] din5;
  input sel5;
  input muxtst;
  output [48:0] dout;





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
mux6 #(49)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .in0(din0[48:0]),
  .in1(din1[48:0]),
  .in2(din2[48:0]),
  .in3(din3[48:0]),
  .in4(din4[48:0]),
  .in5(din5[48:0]),
.dout(dout[48:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_3__stack_20r__width_19 (
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

  input [18:0] din0;
  input sel0;
  input [18:0] din1;
  input sel1;
  input [18:0] din2;
  input sel2;
  output [18:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(19)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[18:0]),
  .in1(din1[18:0]),
  .in2(din2[18:0]),
.dout(dout[18:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_4__stack_20c__width_16 (
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

  input [15:0] din0;
  input sel0;
  input [15:0] din1;
  input sel1;
  input [15:0] din2;
  input sel2;
  input [15:0] din3;
  input sel3;
  output [15:0] dout;





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
mux4s #(16)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[15:0]),
  .in1(din1[15:0]),
  .in2(din2[15:0]),
  .in3(din3[15:0]),
.dout(dout[15:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_2__stack_20c__width_19 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [18:0] din0;
  input sel0;
  input [18:0] din1;
  input sel1;
  output [18:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(19)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[18:0]),
  .in1(din1[18:0]),
.dout(dout[18:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_2__stack_16c__width_16 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [15:0] din0;
  input sel0;
  input [15:0] din1;
  input sel1;
  output [15:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(16)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[15:0]),
  .in1(din1[15:0]),
.dout(dout[15:0])
);









  



endmodule


//
//   buff macro
//
//





module ifu_ftu_agd_dp_buff_macro__dbuff_40x__rep_1__width_35 (
  din, 
  dout);
  input [34:0] din;
  output [34:0] dout;






buff #(35)  d0_0 (
.in(din[34:0]),
.out(dout[34:0])
);








endmodule





//
//   invert macro
//
//





module ifu_ftu_agd_dp_inv_macro__stack_2c__width_1 (
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
//   and macro for ports = 2,3,4
//
//





module ifu_ftu_agd_dp_and_macro__ports_2__stack_2c__width_1 (
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





//
//   increment macro 
//
//





module ifu_ftu_agd_dp_increment_macro__dincr_8x__width_32 (
  din, 
  cin, 
  dout, 
  cout);
  input [31:0] din;
  input cin;
  output [31:0] dout;
  output cout;






incr #(32)  m0_0 (
.cin(cin),
.in(din[31:0]),
.out(dout[31:0]),
.cout(cout)
);











endmodule





//
//   increment macro 
//
//





module ifu_ftu_agd_dp_increment_macro__dincr_8x__width_8 (
  din, 
  cin, 
  dout, 
  cout);
  input [7:0] din;
  input cin;
  output [7:0] dout;
  output cout;






incr #(8)  m0_0 (
.cin(cin),
.in(din[7:0]),
.out(dout[7:0]),
.cout(cout)
);











endmodule





//
//   increment macro 
//
//





module ifu_ftu_agd_dp_increment_macro__dincr_8x__width_16 (
  din, 
  cin, 
  dout, 
  cout);
  input [15:0] din;
  input cin;
  output [15:0] dout;
  output cout;






incr #(16)  m0_0 (
.cin(cin),
.in(din[15:0]),
.out(dout[15:0]),
.cout(cout)
);











endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_mux_macro__mux_pgpe__ports_2__stack_16c__width_16 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [15:0] din0;
  input [15:0] din1;
  input sel0;
  output [15:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(16)  d0_0 (
  .sel(psel1),
  .in0(din0[15:0]),
  .in1(din1[15:0]),
.dout(dout[15:0])
);









  



endmodule


//
//   buff macro
//
//





module ifu_ftu_agd_dp_buff_macro__dbuff_32x__rep_1__stack_50c__width_49 (
  din, 
  dout);
  input [48:0] din;
  output [48:0] dout;






buff #(49)  d0_0 (
.in(din[48:0]),
.out(dout[48:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_mux_macro__mux_pgpe__ports_2__stack_12c__width_11 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [10:0] din0;
  input [10:0] din1;
  input sel0;
  output [10:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(11)  d0_0 (
  .sel(psel1),
  .in0(din0[10:0]),
  .in1(din1[10:0]),
.dout(dout[10:0])
);









  



endmodule


//
//   buff macro
//
//





module ifu_ftu_agd_dp_buff_macro__dbuff_24x__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





//
//   buff macro
//
//





module ifu_ftu_agd_dp_buff_macro__minbuff_1__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






buff #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_mux_macro__mux_pgnpe__ports_5__stack_12c__width_11 (
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
  muxtst, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;

  input [10:0] din0;
  input sel0;
  input [10:0] din1;
  input sel1;
  input [10:0] din2;
  input sel2;
  input [10:0] din3;
  input sel3;
  input [10:0] din4;
  input sel4;
  input muxtst;
  output [10:0] dout;





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
mux5 #(11)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .in0(din0[10:0]),
  .in1(din1[10:0]),
  .in2(din2[10:0]),
  .in3(din3[10:0]),
  .in4(din4[10:0]),
.dout(dout[10:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_mux_macro__mux_pgnpe__ports_5__stack_6l__width_6 (
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
  muxtst, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;

  input [5:0] din0;
  input sel0;
  input [5:0] din1;
  input sel1;
  input [5:0] din2;
  input sel2;
  input [5:0] din3;
  input sel3;
  input [5:0] din4;
  input sel4;
  input muxtst;
  output [5:0] dout;





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
mux5 #(6)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .in0(din0[5:0]),
  .in1(din1[5:0]),
  .in2(din2[5:0]),
  .in3(din3[5:0]),
  .in4(din4[5:0]),
.dout(dout[5:0]),
  .muxtst(muxtst)
);









  



endmodule






// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_msff_macro__stack_50c__width_36 (
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
wire [34:0] so;

  input [35:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [35:0] dout;


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
dff #(36)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[35:0]),
.si({scan_in,so[34:0]}),
.so({so[34:0],scan_out}),
.q(dout[35:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_4__stack_12c__width_5 (
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

  input [4:0] din0;
  input sel0;
  input [4:0] din1;
  input sel1;
  input [4:0] din2;
  input sel2;
  input [4:0] din3;
  input sel3;
  output [4:0] dout;





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
mux4s #(5)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[4:0]),
  .in1(din1[4:0]),
  .in2(din2[4:0]),
  .in3(din3[4:0]),
.dout(dout[4:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_mux_macro__mux_aonpe__ports_4__stack_50c__width_47 (
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

  input [46:0] din0;
  input sel0;
  input [46:0] din1;
  input sel1;
  input [46:0] din2;
  input sel2;
  input [46:0] din3;
  input sel3;
  output [46:0] dout;





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
mux4s #(47)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[46:0]),
  .in1(din1[46:0]),
  .in2(din2[46:0]),
  .in3(din3[46:0]),
.dout(dout[46:0])
);









  



endmodule


//
//   buff macro
//
//





module ifu_ftu_agd_dp_buff_macro__stack_50c__width_47 (
  din, 
  dout);
  input [46:0] din;
  output [46:0] dout;






buff #(47)  d0_0 (
.in(din[46:0]),
.out(dout[46:0])
);








endmodule









// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_msff_macro__minbuff_1__stack_50c__width_49 (
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
wire [47:0] so;

  input [48:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [48:0] dout;


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
dff #(49)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[48:0]),
.si({scan_in,so[47:0]}),
.so({so[47:0],scan_out}),
.q(dout[48:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_msff_macro__stack_8c__width_8 (
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
wire [6:0] so;

  input [7:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [7:0] dout;


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
dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_mux_macro__dmux_8x__mux_aonpe__ports_8__stack_52c__width_51 (
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
  din6, 
  sel6, 
  din7, 
  sel7, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;
wire buffout7;

  input [50:0] din0;
  input sel0;
  input [50:0] din1;
  input sel1;
  input [50:0] din2;
  input sel2;
  input [50:0] din3;
  input sel3;
  input [50:0] din4;
  input sel4;
  input [50:0] din5;
  input sel5;
  input [50:0] din6;
  input sel6;
  input [50:0] din7;
  input sel7;
  output [50:0] dout;





cl_dp1_muxbuff8_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .in6(sel6),
 .in7(sel7),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5),
 .out6(buffout6),
 .out7(buffout7)
);
mux8s #(51)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[50:0]),
  .in1(din1[50:0]),
  .in2(din2[50:0]),
  .in3(din3[50:0]),
  .in4(din4[50:0]),
  .in5(din5[50:0]),
  .in6(din6[50:0]),
  .in7(din7[50:0]),
.dout(dout[50:0])
);









  



endmodule


//
//   buff macro
//
//





module ifu_ftu_agd_dp_buff_macro__stack_52c__width_50 (
  din, 
  dout);
  input [49:0] din;
  output [49:0] dout;






buff #(50)  d0_0 (
.in(din[49:0]),
.out(dout[49:0])
);








endmodule









// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_msff_macro__stack_50c__width_47 (
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

module ifu_ftu_agd_dp_msff_macro__stack_50c__width_35 (
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
wire [33:0] so;

  input [34:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [34:0] dout;


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
dff #(35)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[34:0]),
.si({scan_in,so[33:0]}),
.so({so[33:0],scan_out}),
.q(dout[34:0])
);




















endmodule









//
//   parity macro (even parity)
//
//





module ifu_ftu_agd_dp_prty_macro__width_8 (
  din, 
  dout);
  input [7:0] din;
  output dout;







prty #(8)  m0_0 (
.in(din[7:0]),
.out(dout)
);










endmodule





//
//   parity macro (even parity)
//
//





module ifu_ftu_agd_dp_prty_macro__width_4 (
  din, 
  dout);
  input [3:0] din;
  output dout;







prty #(4)  m0_0 (
.in(din[3:0]),
.out(dout)
);










endmodule









// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_msff_macro__stack_12c__width_6 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_mux_macro__mux_pgpe__ports_2__stack_8r__width_8 (
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


//
//   buff macro
//
//





module ifu_ftu_agd_dp_buff_macro__dbuff_32x__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ifu_ftu_agd_dp_nand_macro__width_1 (
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





//
//   nand macro for ports = 2,3,4
//
//





module ifu_ftu_agd_dp_nand_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






nand3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_mux_macro__mux_pgnpe__ports_3__stack_50c__width_33 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  muxtst, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;

  input [32:0] din0;
  input sel0;
  input [32:0] din1;
  input sel1;
  input [32:0] din2;
  input sel2;
  input muxtst;
  output [32:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3 #(33)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[32:0]),
  .in1(din1[32:0]),
  .in2(din2[32:0]),
.dout(dout[32:0]),
  .muxtst(muxtst)
);









  



endmodule






// any PARAMS parms go into naming of macro

module ifu_ftu_agd_dp_msff_macro__minbuff_1__stack_16c__width_16 (
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
wire [14:0] so;

  input [15:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [15:0] dout;


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
dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);




















endmodule









//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module ifu_ftu_agd_dp_cmp_macro__dcmp_8x__width_32 (
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
//   invert macro
//
//





module ifu_ftu_agd_dp_inv_macro__width_1 (
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
//   and macro for ports = 2,3,4
//
//





module ifu_ftu_agd_dp_and_macro__width_1 (
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




