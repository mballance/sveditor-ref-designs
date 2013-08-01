// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_ftu_byp_dp.v
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
module ifu_ftu_byp_dp (
  tcu_scan_en, 
  tcu_se_scancollar_out, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_muxtest, 
  tcu_dectest, 
  mbi_cambist_run, 
  mbi_addr, 
  agd_mbist_wdata_bf, 
  ftp_mbi_icd_read_en_bf, 
  ftp_mbi_ict_read_en_bf, 
  itc_mbi_itb_read_en, 
  cmu_fill_inst0, 
  cmu_fill_inst1, 
  cmu_fill_inst2, 
  cmu_fill_inst3, 
  icd_bus_0_instr_c, 
  icd_bus_1_instr_c, 
  icd_bus_2_instr_c, 
  icd_bus_3_instr_c, 
  agc_instr_bp_sel_c, 
  agc_asi_sel_word_c, 
  agc_sel_tg_data_f, 
  ict_itlb_way_0_tag_f, 
  ict_itlb_way_1_tag_f, 
  ict_itlb_way_2_tag_f, 
  ict_itlb_way_3_tag_f, 
  ict_itlb_way_4_tag_f, 
  ict_itlb_way_5_tag_f, 
  ict_itlb_way_6_tag_f, 
  ict_itlb_way_7_tag_f, 
  itb_tte_data, 
  itb_tte_tag, 
  itb_tte_u_bit, 
  ftu_paddr, 
  itb_cam_hit_c, 
  itb_itb_mhit_c, 
  itb_tte_data_parity, 
  agc_itb_tag_perr_c, 
  itc_itb_data_sz_1, 
  ftp_sel_mbist_itb_cycle0, 
  ftp_sel_mbist_itb_cycle1, 
  ftp_sel_mbist_itb_cycle2, 
  ftp_sel_mbist_itb_cycle3, 
  ftp_sel_itlb_tag_cntx0_c, 
  ftp_sel_itlb_tag_cntx1_c, 
  ftp_sel_itlb_data_c, 
  ftp_sel_itlb_pa_c, 
  ftu_instr_0_c, 
  ftu_instr_1_c, 
  ftu_instr_2_c, 
  ftu_instr_3_c, 
  ic_rd_data, 
  ic_dmo_rd_data, 
  tg_rd_data, 
  it_rd_data, 
  ftu_mbi_ict_fail, 
  ftu_mbi_icd_fail, 
  ftu_mbi_itb_fail, 
  ftu_mbi_tlb_data_cmp, 
  ftu_mbi_tlb_used, 
  ftu_mbi_tlb_valid, 
  ict_itlb_way_0_tag_f_rep0, 
  ict_itlb_way_1_tag_f_rep0, 
  ict_itlb_way_2_tag_f_rep0, 
  ict_itlb_way_3_tag_f_rep0, 
  ict_itlb_way_4_tag_f_rep0, 
  ict_itlb_way_5_tag_f_rep0, 
  ict_itlb_way_6_tag_f_rep0, 
  ict_itlb_way_7_tag_f_rep0, 
  scan_out) ;
wire stop;
wire test;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire by_pass_i0i1_f_reg_scanin;
wire by_pass_i0i1_f_reg_scanout;
wire [32:0] by_pass_instr_1_f;
wire [32:0] by_pass_instr_0_f;
wire by_pass_i2i3_f_reg_scanin;
wire by_pass_i2i3_f_reg_scanout;
wire [32:0] by_pass_instr_3_f;
wire [32:0] by_pass_instr_2_f;
wire by_pass_i0i1_c_reg_scanin;
wire by_pass_i0i1_c_reg_scanout;
wire [32:0] by_pass_instr_1_c;
wire [32:0] by_pass_instr_0_c;
wire by_pass_i2i3_c_reg_scanin;
wire by_pass_i2i3_c_reg_scanout;
wire [32:0] by_pass_instr_3_c;
wire [32:0] by_pass_instr_2_c;
wire tcu_muxtest_rep0;
wire tcu_muxtest_rep1;
wire [32:0] icd_bus_2_instr_reordered_c;
wire [32:0] icd_bus_3_instr_reordered_c;
wire asi_word_muxx_scanin;
wire asi_word_muxx_scanout;
wire asi_tag_mux_scanin;
wire asi_tag_mux_scanout;
wire asi_itlb_mux_scanin;
wire asi_itlb_mux_scanout;
wire itlb_bist_mux_scanin;
wire itlb_bist_mux_scanout;
wire [7:0] mbist_wdata_3_ff;
wire [31:0] itt_itd_cmp_data;
wire [65:0] tag_mbist_wdata;
wire [37:0] data_mbist_wdata;
wire itlb_w_bist_data_mux_scanin;
wire itlb_w_bist_data_mux_scanout;
wire [31:0] mbist_cmp_data_4_ff;
wire bist_data_stage_a_scanin;
wire bist_data_stage_a_scanout;
wire [7:0] mbist_wdata_2_ff;
wire cambist_run_ff;
wire [5:0] mbist_addr_1;
wire bist_data_stage_b_scanin;
wire bist_data_stage_b_scanout;
wire [7:0] mbist_wdata_4_ff;
wire bist_data_stage_dup_b_scanin;
wire bist_data_stage_dup_b_scanout;
wire [7:0] mbist_wdata_4_dup_ff;
wire [5:0] mbist_addr_2;
wire bist_data_stage_c_scanin;
wire bist_data_stage_c_scanout;
wire mbist_itb_read_en_2_ff;
wire mbist_itb_read_en_3_ff;
wire it_mbist_fail_q;
wire mbist_icd_read_en_2_ff;
wire mbist_icd_read_en_3_ff;
wire ict_mbist_fail_q;
wire icd_mbist_fail_q;
wire mbist_ict_read_en_2_ff;
wire [5:0] mbist_addr_3;
wire mbist_itb_read_en_4_ff;
wire mbist_icd_read_en_4_ff;
wire mbist_ict_read_en_3_ff;
wire [5:0] mbist_addr_4;
wire ict_mbist_fail_unq_l;
wire icd_mbist_fail_31_0_l;
wire icd_mbist_fail_32;
wire mbist_it_fail_unq_l;
wire ict_mbist_fail_unq;
wire icd_mbist_fail_31_0;
wire mbist_it_fail_unq;
wire cambist_run_ff_l;
wire sel_mbist_itb_cycle1_l;
wire icd_mbist_fail_unq;
wire mbist_it_read_en;
wire rbit_modify_unused;
wire sel_mbist_itb_cycle1_l_ff;
wire itb_data_for_cam_scanin;
wire itb_data_for_cam_scanout;
wire [5:0] itb_tte_data_1;

        

input tcu_scan_en ;
input tcu_se_scancollar_out ;
input l2clk;
input scan_in;
input tcu_pce_ov;		// scan signals
input spc_aclk;
input spc_bclk;
input tcu_muxtest;
input tcu_dectest;

input       mbi_cambist_run;
input [5:0] mbi_addr;

input [7:0] agd_mbist_wdata_bf;
input       ftp_mbi_icd_read_en_bf;
input       ftp_mbi_ict_read_en_bf;
input       itc_mbi_itb_read_en;
input [32:0] cmu_fill_inst0;
input [32:0] cmu_fill_inst1;
input [32:0] cmu_fill_inst2;
input [32:0] cmu_fill_inst3;
input [32:0] icd_bus_0_instr_c    ;
input [32:0] icd_bus_1_instr_c    ;
input [32:0] icd_bus_2_instr_c    ;
input [32:0] icd_bus_3_instr_c    ;
input [2:0]  agc_instr_bp_sel_c ;
input [3:0]  agc_asi_sel_word_c ;
input [7:0]  agc_sel_tg_data_f;
input [29:0] ict_itlb_way_0_tag_f;
input [29:0] ict_itlb_way_1_tag_f;
input [29:0] ict_itlb_way_2_tag_f;
input [29:0] ict_itlb_way_3_tag_f;
input [29:0] ict_itlb_way_4_tag_f;
input [29:0] ict_itlb_way_5_tag_f;
input [29:0] ict_itlb_way_6_tag_f;
input [29:0] ict_itlb_way_7_tag_f;
input [37:0] itb_tte_data;
input [65:0] itb_tte_tag;
input        itb_tte_u_bit;
input [39:13] ftu_paddr;
input        itb_cam_hit_c;
input        itb_itb_mhit_c;
input        itb_tte_data_parity;
input        agc_itb_tag_perr_c; 
input        itc_itb_data_sz_1;

input       ftp_sel_mbist_itb_cycle0;
input       ftp_sel_mbist_itb_cycle1;
input       ftp_sel_mbist_itb_cycle2;
input       ftp_sel_mbist_itb_cycle3;

input        ftp_sel_itlb_tag_cntx0_c;
input        ftp_sel_itlb_tag_cntx1_c;
input        ftp_sel_itlb_data_c;
input        ftp_sel_itlb_pa_c;


output [32:0] ftu_instr_0_c ;
output [32:0] ftu_instr_1_c ;
output [32:0] ftu_instr_2_c ;
output [32:0] ftu_instr_3_c ;
output [32:0] ic_rd_data    ;
output [32:0] ic_dmo_rd_data;
output [29:0] tg_rd_data    ;
output [63:0] it_rd_data    ;

output 	      ftu_mbi_ict_fail;
output        ftu_mbi_icd_fail ;
output        ftu_mbi_itb_fail ;
output        ftu_mbi_tlb_data_cmp ;
output        ftu_mbi_tlb_used; 
output        ftu_mbi_tlb_valid;

output [28:0] ict_itlb_way_0_tag_f_rep0;
output [28:0] ict_itlb_way_1_tag_f_rep0;
output [28:0] ict_itlb_way_2_tag_f_rep0;
output [28:0] ict_itlb_way_3_tag_f_rep0;
output [28:0] ict_itlb_way_4_tag_f_rep0;
output [28:0] ict_itlb_way_5_tag_f_rep0;
output [28:0] ict_itlb_way_6_tag_f_rep0;
output [28:0] ict_itlb_way_7_tag_f_rep0;

output 	      scan_out;

// TLB TTE defines
`define TAG_CNTX1_HI    65
`define TAG_CNTX1_LO    53
`define TAG_PID_HI      52
`define TAG_PID_LO      50
`define TAG_REAL        49
`define TAG_VA_47_28_HI 48
`define TAG_VA_47_28_LO 29
`define TAG_VA_27_22_HI 28
`define TAG_VA_27_22_LO 23
`define TAG_V           22
`define TAG_VA_21_16_HI 21
`define TAG_VA_21_16_LO 16
`define TAG_VA_15_13_HI 15
`define TAG_VA_15_13_LO 13
`define TAG_CNTX0_HI    12
`define TAG_CNTX0_LO     0

`define TAG_PARITY          37
`define DATA_PARITY         36
`define DATA_PA_39_28_HI    35
`define DATA_PA_39_28_LO    24
`define DATA_PA_27_22_HI    23
`define DATA_PA_27_22_LO    18
`define DATA_VA_27_22_V     17
`define DATA_PA_21_16_HI    16
`define DATA_PA_21_16_LO    11
`define DATA_VA_21_16_V     10
`define DATA_PA_15_13_HI     9
`define DATA_PA_15_13_LO     7
`define DATA_VA_15_13_V      6
`define DATA_NFO             5
`define DATA_IE              4
`define DATA_CP              3
`define DATA_E               2
`define DATA_P               1
`define DATA_W               0

// scan renames
// assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
// assign siclk = spc_aclk;
// assign soclk = spc_bclk;
assign test   = tcu_dectest ;
// end scan

ifu_ftu_byp_dp_buff_macro__dbuff_32x__stack_none__width_4 test_rep0  (
  .din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk}),
  .dout({se,pce_ov,siclk,soclk})
);

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
// Flop the by_pass instructions from CMU
///////////////////////////////////////////////////////////////////////
ifu_ftu_byp_dp_msff_macro__stack_66c__width_66 by_pass_i0i1_f_reg  (
 .scan_in(by_pass_i0i1_f_reg_scanin),
 .scan_out(by_pass_i0i1_f_reg_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( {cmu_fill_inst1[32:0],    cmu_fill_inst0[32:0]}),
 .dout( {by_pass_instr_1_f[32:0], by_pass_instr_0_f[32:0]}     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

//msff_macro by_pass_i1_f_reg (width=33,stack=34c) (
// .scan_in(by_pass_i1_f_reg_scanin),
// .scan_out(by_pass_i1_f_reg_scanout),
// .clk ( l2clk                ),
// .en  ( 1'b1                 ),  
// .din ( cmu_fill_inst1[32:0]),
// .dout( by_pass_instr_1_f[32:0]     ));

ifu_ftu_byp_dp_msff_macro__stack_66c__width_66 by_pass_i2i3_f_reg  (
 .scan_in(by_pass_i2i3_f_reg_scanin),
 .scan_out(by_pass_i2i3_f_reg_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( {cmu_fill_inst3[32:0],   cmu_fill_inst2[32:0]}),
 .dout( {by_pass_instr_3_f[32:0], by_pass_instr_2_f[32:0]}     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

//msff_macro by_pass_i3_f_reg (width=33,stack=34c) (
// .scan_in(by_pass_i3_f_reg_scanin),
// .scan_out(by_pass_i3_f_reg_scanout),
// .clk ( l2clk                ),
// .en  ( 1'b1                 ),  
// .din ( cmu_fill_inst3[32:0]),
// .dout( by_pass_instr_3_f[32:0]     ));

///////////////////////////////////////////////////////////////////////
// The following flops and muxes can be folded into the IC array.    //
///////////////////////////////////////////////////////////////////////

 ifu_ftu_byp_dp_msff_macro__stack_66c__width_66 by_pass_i0i1_c_reg  (
  .scan_in(by_pass_i0i1_c_reg_scanin),
  .scan_out(by_pass_i0i1_c_reg_scanout),
  .clk ( l2clk                ),
  .en  ( 1'b1                 ),  
  .din ( {by_pass_instr_1_f[32:0],by_pass_instr_0_f[32:0]}),
  .dout( {by_pass_instr_1_c[32:0],by_pass_instr_0_c[32:0]}     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// msff_macro by_pass_i1_c_reg (width=33,stack=34c) (
// .scan_in(by_pass_i1_c_reg_scanin),
// .scan_out(by_pass_i1_c_reg_scanout),
// .clk ( l2clk                ),
// .en  ( 1'b1                 ),  
// .din ( by_pass_instr_1_f[32:0]),
// .dout( by_pass_instr_1_c[32:0]     ));

 ifu_ftu_byp_dp_msff_macro__stack_66c__width_66 by_pass_i2i3_c_reg  (
 .scan_in(by_pass_i2i3_c_reg_scanin),
 .scan_out(by_pass_i2i3_c_reg_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( {by_pass_instr_3_f[32:0],by_pass_instr_2_f[32:0]}),
 .dout( {by_pass_instr_3_c[32:0],by_pass_instr_2_c[32:0]}     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// msff_macro by_pass_i3_c_reg (width=33,stack=34c) (
// .scan_in(by_pass_i3_c_reg_scanin),
// .scan_out(by_pass_i3_c_reg_scanout),
// .clk ( l2clk                ),
//.en  ( 1'b1                 ),  
// .din ( by_pass_instr_3_f[32:0]),
// .dout( by_pass_instr_3_c[32:0]     ));

ifu_ftu_byp_dp_buff_macro__dbuff_48x__width_1 tst_mux_rep0  (
 .din ( tcu_muxtest     ),
 .dout( tcu_muxtest_rep0     ));


ifu_ftu_byp_dp_mux_macro__mux_pgpe__ports_4__stack_66c__width_66 inst_01_bp_mux  (
 .din0( {icd_bus_1_instr_c[32:0],icd_bus_0_instr_c[32:0]}), 
 .din1( {by_pass_instr_1_f[32:0],by_pass_instr_0_f[32:0]}),              
 .din2( {by_pass_instr_1_c[32:0],by_pass_instr_0_c[32:0]}),              
 .din3( {cmu_fill_inst1[32:0],cmu_fill_inst0[32:0]}),              
 .muxtst(tcu_muxtest_rep0),
 .sel0( agc_instr_bp_sel_c[0]),
 .sel1( agc_instr_bp_sel_c[1]),
 .sel2( agc_instr_bp_sel_c[2]),
 .dout( {ftu_instr_1_c[32:0],ftu_instr_0_c[32:0]} ),
  .test(test));

//mux_macro inst_1_bp_mux (width=33,ports=5,mux=aonpe,stack=34c) (
// .din0( icd_bus_1_instr_c[32:0]), 
// .din1( 33'h001000000),              
// .din2( cmu_fill_inst1[32:0]),              
// .din3( by_pass_instr_1_f[32:0]),              
// .din4( by_pass_instr_1_c[32:0]),              
// .sel0( agc_instr_bp_sel_c[0]),
// .sel1( agc_instr_bp_sel_c[1]),
// .sel2( agc_instr_bp_sel_c[2]),
// .sel3( agc_instr_bp_sel_c[3]),
// .sel4( agc_instr_bp_sel_c[4]),
// .dout( ftu_instr_1_c[32:0] ));

ifu_ftu_byp_dp_buff_macro__dbuff_48x__width_1 tst_mux_rep1  (
 .din ( tcu_muxtest     ),
 .dout( tcu_muxtest_rep1     ));

ifu_ftu_byp_dp_mux_macro__dmux_8x__mux_pgpe__ports_4__stack_66c__width_66 inst_23_bp_mux  (
 .din0( {icd_bus_3_instr_c[32:0],icd_bus_2_instr_c[32:0]}), 
 .din1( {by_pass_instr_3_f[32:0],by_pass_instr_2_f[32:0]}),              
 .din2( {by_pass_instr_3_c[32:0],by_pass_instr_2_c[32:0]}),              
 .din3( {cmu_fill_inst3[32:0],cmu_fill_inst2[32:0]}),              
 .muxtst(tcu_muxtest_rep1),
 .sel0( agc_instr_bp_sel_c[0]),
 .sel1( agc_instr_bp_sel_c[1]),
 .sel2( agc_instr_bp_sel_c[2]),
 .dout( {ftu_instr_3_c[32:0],ftu_instr_2_c[32:0]} ),
  .test(test));


// buff_macro icd_bus_01_instr_rep0 (width=66,stack=66c,dbuff=48x) (
//   .din ({icd_bus_1_instr_c[32:0],icd_bus_0_instr_c[32:0]}     ),
//   .dout({icd_bus_1_instr_c_rep0[32:0], icd_bus_0_instr_c_rep0[32:0]})
//   );


// buff_macro icd_bus_23_instr_rep0 (width=66,stack=66c,dbuff=48x) (
//   .din ({icd_bus_3_instr_c[32:0], icd_bus_2_instr_c[32:0] }    ),
//   .dout({icd_bus_3_instr_c_rep0[32:0], icd_bus_2_instr_c_rep0[32:0]})
//   );




//mux_macro inst_3_bp_mux (width=33,ports=5,mux=aonpe,stack=34c) (
// .din0( icd_bus_3_instr_c[32:0]), 
// .din1( 33'h001000000),              
// .din2( cmu_fill_inst3[32:0]),              
// .din3( by_pass_instr_3_f[32:0]),              
// .din4( by_pass_instr_3_c[32:0]),              
// .sel0( agc_instr_bp_sel_c[0]),
// .sel1( agc_instr_bp_sel_c[1]),
// .sel2( agc_instr_bp_sel_c[2]),
// .sel3( agc_instr_bp_sel_c[3]),
// .sel4( agc_instr_bp_sel_c[4]),
// .dout( ftu_instr_3_c[32:0] ));

assign icd_bus_2_instr_reordered_c[32:0] = {icd_bus_2_instr_c[0],  icd_bus_2_instr_c[1] ,icd_bus_2_instr_c[2] ,icd_bus_2_instr_c[3],
                                            icd_bus_2_instr_c[4],  icd_bus_2_instr_c[5] ,icd_bus_2_instr_c[6] ,icd_bus_2_instr_c[7],
                                            icd_bus_2_instr_c[8],  icd_bus_2_instr_c[9] ,icd_bus_2_instr_c[10],icd_bus_2_instr_c[11],
                                            icd_bus_2_instr_c[12], icd_bus_2_instr_c[13],icd_bus_2_instr_c[14],icd_bus_2_instr_c[15],
                                            icd_bus_2_instr_c[16], icd_bus_2_instr_c[17],icd_bus_2_instr_c[18],icd_bus_2_instr_c[19],
                                            icd_bus_2_instr_c[20], icd_bus_2_instr_c[21],icd_bus_2_instr_c[22],icd_bus_2_instr_c[23],
                                            icd_bus_2_instr_c[24], icd_bus_2_instr_c[25],icd_bus_2_instr_c[26],icd_bus_2_instr_c[27],
                                            icd_bus_2_instr_c[28], icd_bus_2_instr_c[29],icd_bus_2_instr_c[30],icd_bus_2_instr_c[31],
                                            icd_bus_2_instr_c[32]};

assign icd_bus_3_instr_reordered_c[32:0] = {icd_bus_3_instr_c[0],  icd_bus_3_instr_c[1] ,icd_bus_3_instr_c[2] ,icd_bus_3_instr_c[3],
                                            icd_bus_3_instr_c[4],  icd_bus_3_instr_c[5] ,icd_bus_3_instr_c[6] ,icd_bus_3_instr_c[7],
                                            icd_bus_3_instr_c[8],  icd_bus_3_instr_c[9] ,icd_bus_3_instr_c[10],icd_bus_3_instr_c[11],
                                            icd_bus_3_instr_c[12], icd_bus_3_instr_c[13],icd_bus_3_instr_c[14],icd_bus_3_instr_c[15],
                                            icd_bus_3_instr_c[16], icd_bus_3_instr_c[17],icd_bus_3_instr_c[18],icd_bus_3_instr_c[19],
                                            icd_bus_3_instr_c[20], icd_bus_3_instr_c[21],icd_bus_3_instr_c[22],icd_bus_3_instr_c[23],
                                            icd_bus_3_instr_c[24], icd_bus_3_instr_c[25],icd_bus_3_instr_c[26],icd_bus_3_instr_c[27],
                                            icd_bus_3_instr_c[28], icd_bus_3_instr_c[29],icd_bus_3_instr_c[30],icd_bus_3_instr_c[31],
                                            icd_bus_3_instr_c[32]};

ifu_ftu_byp_dp_msff_macro__mux_aonpe__ports_4__stack_34c__width_33 asi_word_muxx  (
 .scan_in(asi_word_muxx_scanin),
 .scan_out(asi_word_muxx_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .se  ( tcu_se_scancollar_out ) ,
 .din0( icd_bus_0_instr_c[32:0]), 
 .din1( icd_bus_1_instr_c[32:0]), 
 .din2( icd_bus_2_instr_reordered_c[32:0]), 
 .din3( icd_bus_3_instr_reordered_c[32:0]), 
 .sel0( agc_asi_sel_word_c[0]),
 .sel1( agc_asi_sel_word_c[1]),
 .sel2( agc_asi_sel_word_c[2]),
 .sel3( agc_asi_sel_word_c[3]),
 .dout( ic_rd_data[32:0] ),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

ifu_ftu_byp_dp_buff_macro__dbuff_16x__rep_1__stack_34c__width_33 ic_dmo_rd_data_buf  (
     .din (ic_rd_data[32:0]     ),
     .dout(ic_dmo_rd_data[32:0])
   );


ifu_ftu_byp_dp_buff_macro__dbuff_48x__rep_1__stack_30c__width_29 way_0_tag_buff_rep0  (
     .din (ict_itlb_way_0_tag_f[28:0]     ),
     .dout(ict_itlb_way_0_tag_f_rep0[28:0])
   );

ifu_ftu_byp_dp_buff_macro__dbuff_48x__rep_1__stack_30c__width_29 way_1_tag_buff_rep0  (
     .din (ict_itlb_way_1_tag_f[28:0]     ),
     .dout(ict_itlb_way_1_tag_f_rep0[28:0])
   );

ifu_ftu_byp_dp_buff_macro__dbuff_48x__rep_1__stack_30c__width_29 way_2_tag_buff_rep0  (
     .din (ict_itlb_way_2_tag_f[28:0]     ),
     .dout(ict_itlb_way_2_tag_f_rep0[28:0])
   );

ifu_ftu_byp_dp_buff_macro__dbuff_48x__rep_1__stack_30c__width_29 way_3_tag_buff_rep0  (
     .din (ict_itlb_way_3_tag_f[28:0]     ),
     .dout(ict_itlb_way_3_tag_f_rep0[28:0])
   );

ifu_ftu_byp_dp_buff_macro__dbuff_48x__rep_1__stack_30c__width_29 way_4_tag_buff_rep0  (
     .din (ict_itlb_way_4_tag_f[28:0]     ),
     .dout(ict_itlb_way_4_tag_f_rep0[28:0])
   );

ifu_ftu_byp_dp_buff_macro__dbuff_48x__rep_1__stack_30c__width_29 way_5_tag_buff_rep0  (
     .din (ict_itlb_way_5_tag_f[28:0]     ),
     .dout(ict_itlb_way_5_tag_f_rep0[28:0])
   );

ifu_ftu_byp_dp_buff_macro__dbuff_48x__rep_1__stack_30c__width_29 way_6_tag_buff_rep0  (
     .din (ict_itlb_way_6_tag_f[28:0]     ),
     .dout(ict_itlb_way_6_tag_f_rep0[28:0])
   );

ifu_ftu_byp_dp_buff_macro__dbuff_48x__rep_1__stack_30c__width_29 way_7_tag_buff_rep0  (
     .din (ict_itlb_way_7_tag_f[28:0]     ),
     .dout(ict_itlb_way_7_tag_f_rep0[28:0])
   );

ifu_ftu_byp_dp_msff_macro__mux_aonpe__ports_8__stack_32c__width_30 asi_tag_mux  (
 .scan_in(asi_tag_mux_scanin),
 .scan_out(asi_tag_mux_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .se  ( tcu_se_scancollar_out ) ,
 .din0( ict_itlb_way_0_tag_f[29:0]), 
 .din1( ict_itlb_way_1_tag_f[29:0]), 
 .din2( ict_itlb_way_2_tag_f[29:0]), 
 .din3( ict_itlb_way_3_tag_f[29:0]), 
 .din4( ict_itlb_way_4_tag_f[29:0]), 
 .din5( ict_itlb_way_5_tag_f[29:0]), 
 .din6( ict_itlb_way_6_tag_f[29:0]), 
 .din7( ict_itlb_way_7_tag_f[29:0]), 
 .sel0( agc_sel_tg_data_f[0]),
 .sel1( agc_sel_tg_data_f[1]),
 .sel2( agc_sel_tg_data_f[2]),
 .sel3( agc_sel_tg_data_f[3]),
 .sel4( agc_sel_tg_data_f[4]),
 .sel5( agc_sel_tg_data_f[5]),
 .sel6( agc_sel_tg_data_f[6]),
 .sel7( agc_sel_tg_data_f[7]),
 .dout( tg_rd_data[29:0] ),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


// msff_macro itb_cam_hit_reg (width=4) (
//         .scan_in(itb_cam_hit_reg_scanin),
//         .scan_out(itb_cam_hit_reg_scanout),
//         .clk  (l2clk),
//         .en  ( 1'b1                 ),  
//         .din({itb_cam_hit_c,
//               itb_itb_mhit_c,
//               itb_tte_data_parity,
//               agc_itb_tag_perr_c}) ,
//         .dout({cam_hit_p,
//               itb_mhit_p,
//               tte_data_parity_p,
//               itb_tag_perr_p}));


ifu_ftu_byp_dp_msff_macro__minbuff_1__mux_aonpe__ports_4__stack_64c__width_64 asi_itlb_mux  (
.scan_in(asi_itlb_mux_scanin),
.scan_out(asi_itlb_mux_scanout),
.clk ( l2clk                ),
.en  ( 1'b1                 ),  
.se  ( tcu_se_scancollar_out ) ,
.din0   ({itb_tte_tag[`TAG_PID_HI:`TAG_PID_LO],                 // PID
          itb_tte_tag[`TAG_REAL],                               // REAL
          itb_tte_data[`TAG_PARITY],                            // PARITY
          itb_tte_u_bit,                                        // USED
          10'b0,
          itb_tte_tag[`TAG_VA_47_28_HI:`TAG_VA_27_22_LO],
          itb_tte_tag[`TAG_VA_21_16_HI:`TAG_VA_21_16_LO],
          itb_tte_tag[`TAG_VA_15_13_HI:`TAG_VA_15_13_LO],
          itb_tte_tag[`TAG_CNTX0_HI:`TAG_CNTX0_LO]              // context
          }),
.din1   ({itb_tte_tag[`TAG_PID_HI:`TAG_PID_LO],                 // PID
          itb_tte_tag[`TAG_REAL],                               // REAL
          itb_tte_data[`TAG_PARITY],                            // PARITY
          itb_tte_u_bit,                                        // USED
          10'b0,
          itb_tte_tag[`TAG_VA_47_28_HI:`TAG_VA_27_22_LO],
          itb_tte_tag[`TAG_VA_21_16_HI:`TAG_VA_21_16_LO],
          itb_tte_tag[`TAG_VA_15_13_HI:`TAG_VA_15_13_LO],
          itb_tte_tag[`TAG_CNTX1_HI:`TAG_CNTX1_LO]              // context
          }),
.din2   ({itb_tte_tag[`TAG_V],                                  // V
          itb_tte_data[`DATA_NFO],                              // NFO
          itb_tte_data[`DATA_PARITY],                           // PARITY
          5'b0,                                                 // SOFT
          16'b0,
          itb_tte_data[`DATA_PA_39_28_HI:`DATA_PA_39_28_LO],    // PA
          itb_tte_data[`DATA_PA_27_22_HI:`DATA_PA_27_22_LO],
          itb_tte_data[`DATA_PA_21_16_HI:`DATA_PA_21_16_LO],
          itb_tte_data[`DATA_PA_15_13_HI:`DATA_PA_15_13_LO],
          itb_tte_data[`DATA_IE],                               // IE
          itb_tte_data[`DATA_E],                                // E
          itb_tte_data[`DATA_CP],                               // CP
          1'b0,                                                 // CV
          itb_tte_data[`DATA_P],                                // P
          1'b0,                                                 // EP
          itb_tte_data[`DATA_W],                                // W
          3'b0,
          itb_tte_data[`DATA_VA_27_22_V],                       // SZ
          itc_itb_data_sz_1,itb_tte_data[`DATA_VA_15_13_V]      // SZ
           }),
.din3( {itb_cam_hit_c, itb_itb_mhit_c, agc_itb_tag_perr_c, itb_tte_data_parity, 20'b0,ftu_paddr[39:13],13'b0}), 
.sel0( ftp_sel_itlb_tag_cntx0_c),
.sel1( ftp_sel_itlb_tag_cntx1_c),
.sel2( ftp_sel_itlb_data_c),
.sel3( ftp_sel_itlb_pa_c), 
.dout( it_rd_data[63:0] ),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


//     mbist_wdata[68:0] = {    mbist_wdata_bf[1:0], mbist_wdata_bf[7:0],mbist_wdata_bf[7:6],          // [68:56]
//                              mbist_wdata_bf[4:2],                                                   // [55:53]
//                              1'b0,                                                                  // [52]
//                              mbist_wdata_bf[0],{3{mbist_wdata_bf[7:0]}},mbist_wdata_bf[7],          // [51:26]
//                              1'b0,                                                                  // [25]
//                              mbist_wdata_bf[6:0],                                                   // [24:18]
//                              1'b0,                                                                  // [17]
//                              mbist_wdata_bf[7:5],                                                   // [16:14]
//                              1'b0,                                                                  // [13]
//                              mbist_wdata_bf[4:0],mbist_wdata_bf[7:0]};                              // [12:0]
//
//     data_mbist_wdata[37:0] = { mbist_wdata_bf[4:0],mbist_wdata_bf[7:1],                             // [37:26]
//                              1'b0,                                                                  // [25]
//                              mbist_wdata_bf[0],mbist_wdata_bf[7:2],                                 // [24:18]
//                              1'b0,                                                                  // [17]
//                              mbist_wdata_bf[0], mbist_wdata_bf[7:6],                                // [16:14]
//                              1'b0,                                                                  // [13]
//                              mbist_wdata_bf[4:0],mbist_wdata_bf[7:0]};                              // [12:0]
//    
//
//
//   ifu_agd_pc_bf[47:13] = ({itd_tag[51:32],
//                            itd_tag[31:26],
//                            itd_tag[23:18],
//                            itd_tag[16:14]})
//
//  tte_tag[65:0] =       ({itd_tag[68:52],                   // [65:49]  ---> itd_tag[68:52]--> mbist_wdata_bf[2:0], 
//                                                                                               mbist_wdata_bf[7:0],mbist_data[7:6],mbist_data[4:2],1'b0 
//                          ifu_agd_pc_bf[47:22],             // [48:23]  ---> itd_tag[51:26]--> mbist_data[0],{3{mbist_wdata_bf[7:0]}},mbist_wdata_bf[7]
//                          itd_tag[24],                      // [22]     ---> itd_tag[24]-----> mbist_data[6]
//                          ifu_agd_pc_bf[21:16],             // [21:16]  ---> itd_tag[23:18]--> mbist_data[5:0]
//                          ifu_agd_pc_bf[15:13],             // [15:13]  ---> itd_tag[16:14]--> mbist_data[7:5]
//                          itd_tag[12:0]}),                  // [12:0]   ---> itd_tag[12:0]---> mbist_data[4:0],mbist_data[7:0]
//

// TAG_CNTX1_HI    65
// TAG_CNTX1_LO    53
// TAG_PID_HI      52
// TAG_PID_LO      50
// TAG_REAL        49
// TAG_VA_47_28_HI 48
// TAG_VA_47_28_LO 29
// TAG_VA_27_22_HI 28
// TAG_VA_27_22_LO 23
// TAG_V           22
// TAG_VA_21_16_HI 21
// TAG_VA_21_16_LO 16
// TAG_VA_15_13_HI 15
// TAG_VA_15_13_LO 13
// TAG_CNTX0_HI    12
// TAG_CNTX0_LO     0



ifu_ftu_byp_dp_msff_macro__minbuff_1__mux_aonpe__ports_4__stack_32c__width_32 itlb_bist_mux  (
.scan_in(itlb_bist_mux_scanin),
.scan_out(itlb_bist_mux_scanout),
.clk ( l2clk                ),
.en  ( 1'b1                 ),  
.se  ( tcu_se_scancollar_out ) ,
.din0   ( itb_tte_tag[31:0]),
.din1   ( itb_tte_tag[63:32]),
.din2   ( itb_tte_data[31:0] ),
.din3   ( {mbist_wdata_3_ff[7:0],mbist_wdata_3_ff[7:0],mbist_wdata_3_ff[7:1],itb_tte_u_bit,
           itb_tte_tag[65:64],itb_tte_data[37:32]} ),
.sel0   ( ftp_sel_mbist_itb_cycle0),
.sel1   ( ftp_sel_mbist_itb_cycle1),
.sel2   ( ftp_sel_mbist_itb_cycle2),
.sel3   ( ftp_sel_mbist_itb_cycle3),
.dout( itt_itd_cmp_data[31:0] ),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

assign  tag_mbist_wdata[65:0] = ({mbist_wdata_3_ff[1:0],mbist_wdata_3_ff[7:0],mbist_wdata_3_ff[7:5],mbist_wdata_3_ff[4:2],1'b0,  // [65:49]  
                                  mbist_wdata_3_ff[0],{3{mbist_wdata_3_ff[7:0]}},mbist_wdata_3_ff[7],                            // [48:23]
                                  mbist_wdata_3_ff[6],                                                                           // [22]
                                  mbist_wdata_3_ff[5:0],                                                                         // [21:16]
                                  mbist_wdata_3_ff[7:5],                                                                         // [15:13]
                                  mbist_wdata_3_ff[4:0],mbist_wdata_3_ff[7:0] }) ;                                               // [12:0]

assign data_mbist_wdata[37:0] = { mbist_wdata_3_ff[5:0],mbist_wdata_3_ff[7:2],                             // [37:26]
                                mbist_wdata_3_ff[1],                                                       // [25]
                                mbist_wdata_3_ff[0],mbist_wdata_3_ff[7:2],                                 // [24:18]
                                mbist_wdata_3_ff[1],                                                       // [17]
                                mbist_wdata_3_ff[0], mbist_wdata_3_ff[7:6],                                // [16:14]
                                mbist_wdata_3_ff[5],                                                       // [13]
                                mbist_wdata_3_ff[4:0],mbist_wdata_3_ff[7:0]};                              // [12:0]

  
ifu_ftu_byp_dp_msff_macro__mux_aonpe__ports_4__stack_32c__width_32 itlb_w_bist_data_mux  (
.scan_in(itlb_w_bist_data_mux_scanin),
.scan_out(itlb_w_bist_data_mux_scanout),
.clk ( l2clk                ),
.en  ( 1'b1                 ),  
.se  ( tcu_se_scancollar_out ) ,
.din0  ( tag_mbist_wdata[31:0]),
.din1  ( tag_mbist_wdata[63:32]),
.din2  ( data_mbist_wdata[31:0] ),
.din3  ( {mbist_wdata_3_ff[7:0],mbist_wdata_3_ff[7:0],mbist_wdata_3_ff[7:0],
          tag_mbist_wdata[65:64],data_mbist_wdata[37:32]} ),
.sel0  ( ftp_sel_mbist_itb_cycle0),
.sel1  ( ftp_sel_mbist_itb_cycle1),
.sel2  ( ftp_sel_mbist_itb_cycle2),
.sel3  ( ftp_sel_mbist_itb_cycle3),
.dout( mbist_cmp_data_4_ff[31:0] ),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

ifu_ftu_byp_dp_msff_macro__stack_16c__width_16 bist_data_stage_a  (
 .scan_in(bist_data_stage_a_scanin),
 .scan_out(bist_data_stage_a_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din  ({agd_mbist_wdata_bf[7:0],mbist_wdata_2_ff[7:3],mbi_cambist_run,mbi_addr[5:4]}), 
 .dout ({mbist_wdata_2_ff[7:0],  mbist_wdata_3_ff[7:3],cambist_run_ff,mbist_addr_1[5:4]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

ifu_ftu_byp_dp_msff_macro__stack_16c__width_15 bist_data_stage_b  (
 .scan_in(bist_data_stage_b_scanin),
 .scan_out(bist_data_stage_b_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din  ({mbist_wdata_2_ff[2:0],mbist_wdata_3_ff[7:0],mbi_addr[3:0] }), 
 .dout ({mbist_wdata_3_ff[2:0],mbist_wdata_4_ff[7:0],mbist_addr_1[3:0] } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

ifu_ftu_byp_dp_msff_macro__stack_16c__width_14 bist_data_stage_dup_b  (
 .scan_in(bist_data_stage_dup_b_scanin),
 .scan_out(bist_data_stage_dup_b_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din  ({mbist_wdata_3_ff[7:0], mbist_addr_1[5:0] }), 
 .dout ({mbist_wdata_4_dup_ff[7:0], mbist_addr_2[5:0] } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

ifu_ftu_byp_dp_msff_macro__stack_16c__width_16 bist_data_stage_c  (
 .scan_in(bist_data_stage_c_scanin),
 .scan_out(bist_data_stage_c_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din  ({ mbist_itb_read_en_2_ff,mbist_itb_read_en_3_ff,
         it_mbist_fail_q ,ftp_mbi_icd_read_en_bf, mbist_icd_read_en_2_ff,
         mbist_icd_read_en_3_ff, ict_mbist_fail_q,icd_mbist_fail_q,
         itc_mbi_itb_read_en,ftp_mbi_ict_read_en_bf,mbist_ict_read_en_2_ff,mbist_addr_3[4:0] }),
 .dout ({ mbist_itb_read_en_3_ff, mbist_itb_read_en_4_ff,
         ftu_mbi_itb_fail, mbist_icd_read_en_2_ff , mbist_icd_read_en_3_ff, 
         mbist_icd_read_en_4_ff, ftu_mbi_ict_fail,ftu_mbi_icd_fail,
         mbist_itb_read_en_2_ff,mbist_ict_read_en_2_ff,mbist_ict_read_en_3_ff,mbist_addr_4[4:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// mux_macro cmp_data_mux (width=33,ports=2,mux=aonpe,stack=34c) (
//  .din0( {mbist_wdata_3_ff[0],mbist_wdata_3_ff[7:6],tg_rd_data[29:0]}),
//  .din1( ic_rd_data[32:0]),              
//  .sel0( mbist_ict_read_en_3_ff),
//  .sel1( mbist_icd_read_en_4_ff),
//  .dout( ict_icd_cmp_data[32:0] ));

ifu_ftu_byp_dp_cmp_macro__dcmp_8x__width_32 ict_fail_detect  (
    .dout( ict_mbist_fail_unq_l),
    .din0( {mbist_wdata_3_ff[7:0],mbist_wdata_3_ff[7:0],mbist_wdata_3_ff[7:0],mbist_wdata_3_ff[7:0]}),
    .din1( {mbist_wdata_3_ff[7:6],tg_rd_data[29:0]})
);

// mux_macro itb_cmp_data_mux_1 (width=16,ports=2,mux=aope,stack=16c) (
//  .din0( {mbist_wdata_4_ff[7:2],it_rd_data[57:48]}),
//  .din1( it_rd_data[31:16]),              
//  .sel0( cmpsel_4_ff[0]),
//  .dout( itt_itd_cmp_data[31:16] ));

// mux_macro itb_cmp_data_mux_0 (width=16,ports=2,mux=aope,stack=16c) (
//  .din0( it_rd_data[47:32]),
//  .din1( it_rd_data[15:0]),              
//  .sel0( cmpsel_4_ff[0]),
//  .dout( itt_itd_cmp_data[15:0] ));


ifu_ftu_byp_dp_cmp_macro__dcmp_8x__width_32 icd_fail_detect  (
    .dout( icd_mbist_fail_31_0_l),
    .din0( {mbist_wdata_4_dup_ff[7:0],mbist_wdata_4_dup_ff[7:0],mbist_wdata_4_dup_ff[7:0],mbist_wdata_4_dup_ff[7:0]}),
    .din1( ic_rd_data[31:0])
);
ifu_ftu_byp_dp_xor_macro__ports_2__width_1 icd_fail_detect_xnor  (
    .din0( mbist_wdata_4_ff[0]) ,
    .din1( ic_rd_data[32]) ,
    .dout( icd_mbist_fail_32)) ;


ifu_ftu_byp_dp_cmp_macro__dcmp_8x__width_32 it_fail_detect  (
    .dout( mbist_it_fail_unq_l),
    .din0( mbist_cmp_data_4_ff[31:0]),
    .din1( itt_itd_cmp_data[31:0])
);

 ifu_ftu_byp_dp_inv_macro__width_5 ict_fail_macro  (
    .dout( {ict_mbist_fail_unq,icd_mbist_fail_31_0, mbist_it_fail_unq,cambist_run_ff_l,sel_mbist_itb_cycle1_l}), 
    .din(  {ict_mbist_fail_unq_l,icd_mbist_fail_31_0_l, mbist_it_fail_unq_l,cambist_run_ff,ftp_sel_mbist_itb_cycle1})
);

 ifu_ftu_byp_dp_or_macro__ports_2__width_1 icd_final_fail  (
    .din0 (icd_mbist_fail_32),
    .din1 (icd_mbist_fail_31_0) ,
    .dout (icd_mbist_fail_unq)) ;

//  or_macro read_or_macro (width=2,ports=2) (
//     .dout( {mbist_read_en,mbist_it_read_en}), 
//     .din0( {mbist_ict_read_en_3_ff,1'b0}),
//     .din1( {mbist_icd_read_en_4_ff,mbist_itb_read_en_3_ff})
// );

// assign mbist_it_read_en = mbist_itb_read_en_4_ff ;

 ifu_ftu_byp_dp_and_macro__width_5 fail_qual  (
    .dout( {ict_mbist_fail_q,icd_mbist_fail_q,it_mbist_fail_q,mbist_it_read_en,rbit_modify_unused}),
    .din0( {ict_mbist_fail_unq,icd_mbist_fail_unq,mbist_it_fail_unq,cambist_run_ff_l,sel_mbist_itb_cycle1_l_ff}), 
    .din1( {mbist_ict_read_en_3_ff,mbist_icd_read_en_4_ff,mbist_it_read_en,mbist_itb_read_en_4_ff,mbist_wdata_4_ff[1]})) ;


// assign ftu_mbi_icd_fail = ftu_mbi_ict_fail ;

ifu_ftu_byp_dp_msff_macro__minbuff_1__stack_16c__width_16 itb_data_for_cam  (
 .scan_in(itb_data_for_cam_scanin),
 .scan_out(itb_data_for_cam_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din  ({itb_tte_data[5:0] , itb_tte_u_bit , itb_tte_tag[`TAG_V],mbist_addr_2[5:0],sel_mbist_itb_cycle1_l,mbist_addr_3[5]}), 
 .dout ({itb_tte_data_1[5:0], ftu_mbi_tlb_used,   ftu_mbi_tlb_valid,mbist_addr_3[5:0] , sel_mbist_itb_cycle1_l_ff,mbist_addr_4[5]}  ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

ifu_ftu_byp_dp_cmp_macro__width_8 cambist_cmp  (
        .din0   ({2'b0,mbist_addr_4[5:0]}),
        .din1   ({2'b0,itb_tte_data_1[5:0]}),
        .dout   (ftu_mbi_tlb_data_cmp)
);


// assign se = tcu_scan_en ;
// fixscan start:
assign by_pass_i0i1_f_reg_scanin = scan_in                  ;
assign by_pass_i2i3_f_reg_scanin = by_pass_i0i1_f_reg_scanout;
assign by_pass_i0i1_c_reg_scanin = by_pass_i2i3_f_reg_scanout;
assign by_pass_i2i3_c_reg_scanin = by_pass_i0i1_c_reg_scanout;
assign asi_word_muxx_scanin      = by_pass_i2i3_c_reg_scanout;
assign asi_tag_mux_scanin        = asi_word_muxx_scanout    ;
assign asi_itlb_mux_scanin       = asi_tag_mux_scanout      ;
assign itlb_bist_mux_scanin      = asi_itlb_mux_scanout     ;
assign itlb_w_bist_data_mux_scanin = itlb_bist_mux_scanout    ;
assign bist_data_stage_a_scanin  = itlb_w_bist_data_mux_scanout;
assign bist_data_stage_b_scanin  = bist_data_stage_a_scanout;
assign bist_data_stage_dup_b_scanin = bist_data_stage_b_scanout;
assign bist_data_stage_c_scanin  = bist_data_stage_dup_b_scanout;
assign itb_data_for_cam_scanin   = bist_data_stage_c_scanout;
assign scan_out                  = itb_data_for_cam_scanout ;
// fixscan end:
endmodule


//
//   buff macro
//
//





module ifu_ftu_byp_dp_buff_macro__dbuff_32x__stack_none__width_4 (
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

module ifu_ftu_byp_dp_msff_macro__stack_66c__width_66 (
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
wire [64:0] so;

  input [65:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [65:0] dout;


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
dff #(66)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[65:0]),
.si({scan_in,so[64:0]}),
.so({so[64:0],scan_out}),
.q(dout[65:0])
);




















endmodule









//
//   buff macro
//
//





module ifu_ftu_byp_dp_buff_macro__dbuff_48x__width_1 (
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

module ifu_ftu_byp_dp_mux_macro__mux_pgpe__ports_4__stack_66c__width_66 (
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

  input [65:0] din0;
  input [65:0] din1;
  input [65:0] din2;
  input [65:0] din3;
  input sel0;
  input sel1;
  input sel2;
  input muxtst;
  input test;
  output [65:0] dout;





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

mux4 #(66)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[65:0]),
  .in1(din1[65:0]),
  .in2(din2[65:0]),
  .in3(din3[65:0]),
.dout(dout[65:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_byp_dp_mux_macro__dmux_8x__mux_pgpe__ports_4__stack_66c__width_66 (
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

  input [65:0] din0;
  input [65:0] din1;
  input [65:0] din2;
  input [65:0] din3;
  input sel0;
  input sel1;
  input sel2;
  input muxtst;
  input test;
  output [65:0] dout;





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

mux4 #(66)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[65:0]),
  .in1(din1[65:0]),
  .in2(din2[65:0]),
  .in3(din3[65:0]),
.dout(dout[65:0]),
  .muxtst(muxtst)
);









  



endmodule






// any PARAMS parms go into naming of macro

module ifu_ftu_byp_dp_msff_macro__mux_aonpe__ports_4__stack_34c__width_33 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
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
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire [32:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [31:0] so;

  input [32:0] din0;
  input sel0;
  input [32:0] din1;
  input sel1;
  input [32:0] din2;
  input sel2;
  input [32:0] din3;
  input sel3;


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




cl_dp1_muxbuff4_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(33)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[32:0]),
  .in1(din1[32:0]),
  .in2(din2[32:0]),
  .in3(din3[32:0]),
.dout(muxout[32:0])
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
dff #(33)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[32:0]),
.si({scan_in,so[31:0]}),
.so({so[31:0],scan_out}),
.q(dout[32:0])
);




















endmodule









//
//   buff macro
//
//





module ifu_ftu_byp_dp_buff_macro__dbuff_16x__rep_1__stack_34c__width_33 (
  din, 
  dout);
  input [32:0] din;
  output [32:0] dout;






buff #(33)  d0_0 (
.in(din[32:0]),
.out(dout[32:0])
);








endmodule





//
//   buff macro
//
//





module ifu_ftu_byp_dp_buff_macro__dbuff_48x__rep_1__stack_30c__width_29 (
  din, 
  dout);
  input [28:0] din;
  output [28:0] dout;






buff #(29)  d0_0 (
.in(din[28:0]),
.out(dout[28:0])
);








endmodule









// any PARAMS parms go into naming of macro

module ifu_ftu_byp_dp_msff_macro__mux_aonpe__ports_8__stack_32c__width_30 (
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
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;
wire buffout7;
wire [29:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [28:0] so;

  input [29:0] din0;
  input sel0;
  input [29:0] din1;
  input sel1;
  input [29:0] din2;
  input sel2;
  input [29:0] din3;
  input sel3;
  input [29:0] din4;
  input sel4;
  input [29:0] din5;
  input sel5;
  input [29:0] din6;
  input sel6;
  input [29:0] din7;
  input sel7;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [29:0] dout;


  output scan_out;




cl_dp1_muxbuff8_8x  c1_0 (
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
mux8s #(30)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[29:0]),
  .in1(din1[29:0]),
  .in2(din2[29:0]),
  .in3(din3[29:0]),
  .in4(din4[29:0]),
  .in5(din5[29:0]),
  .in6(din6[29:0]),
  .in7(din7[29:0]),
.dout(muxout[29:0])
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
dff #(30)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[29:0]),
.si({scan_in,so[28:0]}),
.so({so[28:0],scan_out}),
.q(dout[29:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module ifu_ftu_byp_dp_msff_macro__minbuff_1__mux_aonpe__ports_4__stack_64c__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
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
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  input [63:0] din3;
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




cl_dp1_muxbuff4_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(64)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
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

module ifu_ftu_byp_dp_msff_macro__minbuff_1__mux_aonpe__ports_4__stack_32c__width_32 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
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
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire [31:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [30:0] so;

  input [31:0] din0;
  input sel0;
  input [31:0] din1;
  input sel1;
  input [31:0] din2;
  input sel2;
  input [31:0] din3;
  input sel3;


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




cl_dp1_muxbuff4_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(32)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
  .in3(din3[31:0]),
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













// any PARAMS parms go into naming of macro

module ifu_ftu_byp_dp_msff_macro__mux_aonpe__ports_4__stack_32c__width_32 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
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
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire [31:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [30:0] so;

  input [31:0] din0;
  input sel0;
  input [31:0] din1;
  input sel1;
  input [31:0] din2;
  input sel2;
  input [31:0] din3;
  input sel3;


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




cl_dp1_muxbuff4_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(32)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
  .in3(din3[31:0]),
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













// any PARAMS parms go into naming of macro

module ifu_ftu_byp_dp_msff_macro__stack_16c__width_16 (
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













// any PARAMS parms go into naming of macro

module ifu_ftu_byp_dp_msff_macro__stack_16c__width_15 (
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
wire [13:0] so;

  input [14:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [14:0] dout;


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
dff #(15)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[14:0]),
.si({scan_in,so[13:0]}),
.so({so[13:0],scan_out}),
.q(dout[14:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module ifu_ftu_byp_dp_msff_macro__stack_16c__width_14 (
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









//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module ifu_ftu_byp_dp_cmp_macro__dcmp_8x__width_32 (
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
//   xor macro for ports = 2,3
//
//





module ifu_ftu_byp_dp_xor_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;





xor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);








endmodule





//
//   invert macro
//
//





module ifu_ftu_byp_dp_inv_macro__width_5 (
  din, 
  dout);
  input [4:0] din;
  output [4:0] dout;






inv #(5)  d0_0 (
.in(din[4:0]),
.out(dout[4:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module ifu_ftu_byp_dp_or_macro__ports_2__width_1 (
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
//   and macro for ports = 2,3,4
//
//





module ifu_ftu_byp_dp_and_macro__width_5 (
  din0, 
  din1, 
  dout);
  input [4:0] din0;
  input [4:0] din1;
  output [4:0] dout;






and2 #(5)  d0_0 (
.in0(din0[4:0]),
.in1(din1[4:0]),
.out(dout[4:0])
);









endmodule









// any PARAMS parms go into naming of macro

module ifu_ftu_byp_dp_msff_macro__minbuff_1__stack_16c__width_16 (
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





module ifu_ftu_byp_dp_cmp_macro__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output dout;






cmp #(8)  m0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout)
);










endmodule




