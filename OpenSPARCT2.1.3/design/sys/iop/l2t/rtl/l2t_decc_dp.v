// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_decc_dp.v
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
module l2t_decc_dp (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  decc_ret_data_c7, 
  decc_arbdp_data_c8, 
  decc_ret_diag_data_c7, 
  decc_lda_syndrome_c9, 
  deccck_dword_sel_c7, 
  deccck_muxsel_diag_out_c7, 
  oqu_l2_miss_c7, 
  oqu_uerr_ack_c7, 
  oqu_cerr_ack_c7, 
  oqu_imiss_hit_c8, 
  rtn_err_field_c7, 
  filbuf_spc_corr_err_c6, 
  filbuf_spc_rd_vld_c6, 
  filbuf_spc_uncorr_err_c6, 
  tag_spc_rd_vld_c6, 
  mbist_dmo_data_out, 
  csr_error_ceen, 
  csr_error_nceen, 
  deccck_uncorr_err_c8, 
  deccck_corr_err_c8, 
  deccck_notdata_err_c8, 
  deccdp_decck_uncorr_err_c7, 
  deccdp_decck_corr_err_c7, 
  l2d_l2t_decc_c6, 
  l2clk, 
  tcu_muxtest, 
  tcu_dectest, 
  scan_in, 
  scan_out, 
  mbist_l2data_fail, 
  mbist_write_data, 
  mbist_l2d_write, 
  tagd_evict_tag_c3, 
  tcu_l2t_tag_or_data_sel);
wire stop;
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire muxtst;
wire test;
wire [5:0] decc_check0_c7_n;
wire [5:0] decc_check1_c7_n;
wire [5:0] decc_check2_c7_n;
wire [5:0] decc_check3_c7_n;
wire [5:0] decc_check0_c7;
wire [5:0] decc_check1_c7;
wire [5:0] decc_check2_c7;
wire [5:0] decc_check3_c7;
wire ce_check0_1;
wire ce_check0_2;
wire ce_check0_3;
wire ce_check1_1;
wire ce_check1_2;
wire ce_check1_3;
wire ce_check2_1;
wire ce_check2_2;
wire ce_check2_3;
wire ce_check3_1;
wire ce_check3_2;
wire ce_check3_3;
wire check0_all_ones_n;
wire check1_all_ones_n;
wire check2_all_ones_n;
wire check3_all_ones_n;
wire check0_all_ones;
wire check1_all_ones;
wire check2_all_ones;
wire check3_all_ones;
wire [3:0] corr_err_c7;
wire decc_parity0_c7_n;
wire decc_parity1_c7_n;
wire decc_parity2_c7_n;
wire decc_parity3_c7_n;
wire data_corr_err_c8;
wire corr_err_c7_0_2;
wire corr_err_c7_1_3;
wire data_corr_err_c7;
wire data_notdata_err_c7_3;
wire data_notdata_err_c7_2;
wire data_notdata_err_c7_1;
wire data_notdata_err_c7_0;
wire filbuf_spc_rd_vld_c7;
wire data_notdata_err_c7_a;
wire decc_parity0_c7;
wire decc_parity1_c7;
wire data_notdata_err_c7_b;
wire decc_parity2_c7;
wire decc_parity3_c7;
wire data_notdata_err_c7;
wire compute0_ue_0_1_2;
wire compute0_ue_3_4_5;
wire compute1_ue_0_1_2;
wire compute1_ue_3_4_5;
wire compute2_ue_0_1_2;
wire compute2_ue_3_4_5;
wire compute3_ue_0_1_2;
wire compute3_ue_3_4_5;
wire compute0_ue_n;
wire compute1_ue_n;
wire compute2_ue_n;
wire compute3_ue_n;
wire uncorr_err_c7_0;
wire uncorr_err_c7_1;
wire uncorr_err_c7_2;
wire uncorr_err_c7_3;
wire filbuf_spc_rd_vld_c7_n;
wire compute3_ue;
wire compute2_ue;
wire compute1_ue;
wire compute0_ue;
wire uncorr_err_c7_0_2;
wire uncorr_err_c7_1_3;
wire uncorr_err_c7_0_2_n;
wire uncorr_err_c7_1_3_n;
wire data_uncorr_err_c7;
wire tag_spc_rd_vld_c7;
wire filbuf_spc_uncorr_err_c7;
wire filbuf_spc_corr_err_c7;
wire tag_spc_rd_vld_c7_n;
wire filbuf_spc_uncorr_err_c7_n;
wire filbuf_spc_corr_err_c7_n;
wire tag_fb_spc_rd_ce_c7;
wire [1:0] opt_c7terms_n;
wire error_ceen_d1;
wire [1:0] opt_c7terms;
wire tag_fb_spc_rd_ue_c7;
wire error_nceen_d1;
wire [1:0] ret_err_c7_uece_n;
wire [1:0] ret_err_c7_uece;
wire ret_err_c7_nd_n;
wire [2:1] ret_err_c7;
wire [0:0] ret_err_c7_n;
wire ret_err_c7_nd;
wire oqu_cerr_ack_c7_or_ret_err_c7_nd_n;
wire rtn_err_field_c7_1_n;
wire ret_err_c8_1;
wire [27:0] retbuf_ret_ecc_c7;
wire [127:0] retbuf_ret_data_c7;
wire ff_data_rtn_c8_127_96_scanin;
wire ff_data_rtn_c8_127_96_scanout;
wire ff_data_rtn_c8_95_64_scanin;
wire ff_data_rtn_c8_95_64_scanout;
wire ff_data_rtn_c8_63_32_scanin;
wire ff_data_rtn_c8_63_32_scanout;
wire ff_data_rtn_c8_31_0_scanin;
wire ff_data_rtn_c8_31_0_scanout;
wire ff_error_synd_c8_scanin;
wire ff_error_synd_c8_scanout;
wire ff_lda_syndrome_c9_scanin;
wire ff_lda_syndrome_c9_scanout;
wire mbist_l2data_fail0;
wire [7:0] mbist_write_data_c6;
wire mbist_l2data_fail1;
wire mbist_l2data_fail_fnl;
wire mbist_l2data_fail_w;
wire mbist_l2d_write_c6_n;
wire mbist_l2d_write_c6;
wire ff_fame_mbist_flops_0_scanin;
wire ff_fame_mbist_flops_0_scanout;
wire [7:0] mbist_write_data_c4;
wire [7:0] mbist_write_data_c5;
wire [7:0] mbist_write_data_c52;
wire mbist_l2d_write_c3;
wire mbist_l2d_write_c4;
wire mbist_l2d_write_c5;
wire mbist_l2d_write_c52;
wire ff_fame_mbist_flops_scanin;
wire ff_fame_mbist_flops_scanout;
wire [7:0] mbist_write_data_c1;
wire [7:0] mbist_write_data_c2;
wire mbist_l2d_write_c1;
wire mbist_l2d_write_c2;
wire [7:0] mbist_write_data_c3;
wire [127:0] ret_data_c7_buf;
wire [27:0] ret_ecc_c7_buf;
wire [127:0] ret_data_c6;
wire [27:0] ret_ecc_c6;
wire ff_data_rtn_c7_1split1_scanin;
wire ff_data_rtn_c7_1split1_scanout;
wire ff_data_rtn_c7_1split2_scanin;
wire ff_data_rtn_c7_1split2_scanout;
wire ff_data_rtn_c7_1split3_scanin;
wire ff_data_rtn_c7_1split3_scanout;
wire ff_data_rtn_c7_1split4_scanin;
wire ff_data_rtn_c7_1split4_scanout;
 

 input tcu_pce_ov;
 input tcu_aclk;
 input tcu_bclk;
 input tcu_scan_en;
 input tcu_clk_stop;
 
output	[127:0]	decc_ret_data_c7;     // data to oque 
output	[63:0]	decc_arbdp_data_c8; // data to arbdat 
output	[38:0]	decc_ret_diag_data_c7 ; // diagnostic data 
output	[27:0]	decc_lda_syndrome_c9;     // to csr block 
 
 
// from and to decc 
//input	deccck_sel_higher_word_c7; 
//input	deccck_sel_higher_dword_c7; 
input	deccck_dword_sel_c7; 
input	[3:0] deccck_muxsel_diag_out_c7;

//output	[2:0] 	deccck_ret_err_c7;
input           oqu_l2_miss_c7 ; // NEW_PIN  
input           oqu_uerr_ack_c7; // asynchronous uncorr err  
input           oqu_cerr_ack_c7; // asynchronous corr err  
input		oqu_imiss_hit_c8;
output	[2:0]	rtn_err_field_c7;

input		filbuf_spc_corr_err_c6;
input		filbuf_spc_rd_vld_c6;
input		filbuf_spc_uncorr_err_c6;
input		tag_spc_rd_vld_c6;

//input		filbuf_spc_corr_err_c7;
//input		filbuf_spc_rd_vld_c7;
//input		filbuf_spc_uncorr_err_c7;
//input		tag_spc_rd_vld_c7;
////////////////////////////////////////////


output	[38:0]	mbist_dmo_data_out;
input		csr_error_ceen;
input		csr_error_nceen;

output		deccck_uncorr_err_c8;        // an uncorr err has happenned Unqual
output		deccck_corr_err_c8;        // a correctable err has happened
output		deccck_notdata_err_c8;        // a notdata err has happened

output	[3:0]	deccdp_decck_uncorr_err_c7;        // an uncorr err has happenned Unqual
output	[3:0]	deccdp_decck_corr_err_c7;        // a correctable err has happened
 
//////////////////////////////////////////////////////////////////////////////////////////

//input	[127:0]	retbuf_ret_data_c7; 
//input	[27:0]	retbuf_ret_ecc_c7; 

input   [155:0]  l2d_l2t_decc_c6; 

 
input		l2clk; 
input		tcu_muxtest; 
input		tcu_dectest; 
input 		scan_in; 
output 		scan_out; 
output		mbist_l2data_fail;
input	[7:0]	mbist_write_data;
input		mbist_l2d_write;

input	[27:0]  tagd_evict_tag_c3;
input		tcu_l2t_tag_or_data_sel;

assign stop = tcu_clk_stop;
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;
assign muxtst = tcu_muxtest;
assign test = tcu_dectest;
 
wire	[127:0]	corr_data_c7; 
wire	[38:0]	data_word0_c7; 
wire	[38:0]	data_word1_c7; 
wire	[38:0]	data_word2_c7; 
wire	[38:0]	data_word3_c7; 
 
wire	[38:0]	left_diag_out_c7; 
wire	[38:0]	rgt_diag_out_c7; 
 
wire	[127:0]	decc_ret_data_c8; // data to oque 
 
wire	[27:0]	error_synd_c7; 
wire	[27:0]	error_synd_c8; 
 
wire	dword_sel_c8; 
wire	[3:0]	uncorr_err_c7_n;

///////////////////////////////////////////////////////////////////////////////////////////////// 
///////////////////////////////////////////////////////////////////////////////////////////////// 
///////////////////////////////////////////////////////////////////////////////////////////////// 
///////////////////////////////////////////////////////////////////////////////////////////////// 
///////////////////////////////////////////////////////////////////////////////////////////////// 
///////////////////////////////////////////////////////////////////////////////////////////////// 
///////////////////////////////////////////////////////////////////////////////////////////////// 
///////////////////////////////////////////////////////////////////////////////////////////////// 
///////////////////////////////////////////////////////////////////////////////////////////////// 
///////////////////////////////////////////////////////////////////////////////////////////////// 
///////////////////////////////////////////////////////////////////////////////////////////////// 
///////////////////////////////////////////////////////////////////////////////////////////////// 
//assign  corr_err_c7[0]   =  decc_parity0_c7  & ~(decc_check0_c7[5:0] == 6'b111111);
//assign  corr_err_c7[1]   =  decc_parity1_c7  & ~(decc_check1_c7[5:0] == 6'b111111);
//assign  corr_err_c7[2]   =  decc_parity2_c7  & ~(decc_check2_c7[5:0] == 6'b111111);
//assign  corr_err_c7[3]   =  decc_parity3_c7  & ~(decc_check3_c7[5:0] == 6'b111111);
//assign  deccdp_decck_corr_err_c7[3:0] =  corr_err_c7[3:0]; 	

l2t_decc_dp_inv_macro__dinv_32x__stack_32r__width_24 inv_checkbits 
	(
	.dout	({decc_check0_c7_n[5:0],decc_check1_c7_n[5:0],decc_check2_c7_n[5:0],decc_check3_c7_n[5:0]}),
	.din	({decc_check0_c7[5:0],decc_check1_c7[5:0],decc_check2_c7[5:0],decc_check3_c7[5:0]})
	);

l2t_decc_dp_nor_macro__dnor_16x__ports_2__width_3 nor_ce_check0_1 
      (
      .dout   ({ce_check0_1,        ce_check0_2,	ce_check0_3}),
      .din0   ({decc_check0_c7_n[0],decc_check0_c7_n[2],decc_check0_c7_n[4]}),
      .din1   ({decc_check0_c7_n[1],decc_check0_c7_n[3],decc_check0_c7_n[5]})
      );

l2t_decc_dp_nor_macro__dnor_16x__ports_2__width_3 nor_ce_check1_1 
      (
      .dout   ({ce_check1_1,        ce_check1_2,        ce_check1_3}),
      .din0   ({decc_check1_c7_n[0],decc_check1_c7_n[2],decc_check1_c7_n[4]}),
      .din1   ({decc_check1_c7_n[1],decc_check1_c7_n[3],decc_check1_c7_n[5]})
      );

l2t_decc_dp_nor_macro__dnor_16x__ports_2__width_3 nor_ce_check2_1 
      (
      .dout   ({ce_check2_1,        ce_check2_2,        ce_check2_3}),
      .din0   ({decc_check2_c7_n[0],decc_check2_c7_n[2],decc_check2_c7_n[4]}),
      .din1   ({decc_check2_c7_n[1],decc_check2_c7_n[3],decc_check2_c7_n[5]})
      );

l2t_decc_dp_nor_macro__dnor_16x__ports_2__width_3 nor_ce_check3_1 
      (
      .dout   ({ce_check3_1,        ce_check3_2,        ce_check3_3}),
      .din0   ({decc_check3_c7_n[0],decc_check3_c7_n[2],decc_check3_c7_n[4]}),
      .din1   ({decc_check3_c7_n[1],decc_check3_c7_n[3],decc_check3_c7_n[5]})
      );

l2t_decc_dp_nand_macro__dnand_24x__ports_3__width_4 nand_ce_check0_2 
      (
      .dout   ({check0_all_ones_n,check1_all_ones_n,check2_all_ones_n,check3_all_ones_n}),
      .din0   ({ce_check0_1,	  ce_check1_1,	    ce_check2_1,      ce_check3_1      }),
      .din1   ({ce_check0_2,	  ce_check1_2,	    ce_check2_2,      ce_check3_2      }),
      .din2   ({ce_check0_3,	  ce_check1_3,	    ce_check2_3,      ce_check3_3      })
      );


l2t_decc_dp_inv_macro__dinv_32x__width_4 inv_deccdp_decck_corr_err_c7 
      (
      .din   ({check0_all_ones_n,check1_all_ones_n,check2_all_ones_n,check3_all_ones_n}),
      .dout  ({check0_all_ones,check1_all_ones,check2_all_ones,check3_all_ones})
      );

l2t_decc_dp_nor_macro__dnor_16x__width_4 nor_corr_err_c7  
	(
	.dout	({corr_err_c7[0],corr_err_c7[1],corr_err_c7[2],corr_err_c7[3]}),
	.din0	({check0_all_ones,check1_all_ones,check2_all_ones,check3_all_ones}),
	.din1	({decc_parity0_c7_n,decc_parity1_c7_n,decc_parity2_c7_n,decc_parity3_c7_n})
	);

l2t_decc_dp_buff_macro__dbuff_32x__width_5 buff_deccdp_decck_corr_err_c7 
      (
      .dout   ({deccck_corr_err_c8,deccdp_decck_corr_err_c7[3:0]}),
      .din    ({data_corr_err_c8,corr_err_c7[3:0]})
      );

l2t_decc_dp_nor_macro__dnor_16x__width_2 nor_corr_err_c7_0_to_3 
	(
	.dout	({corr_err_c7_0_2,corr_err_c7_1_3}),
	.din0	({corr_err_c7[0] ,corr_err_c7[1] }),
	.din1	({corr_err_c7[2] ,corr_err_c7[3] })
	);

l2t_decc_dp_nand_macro__dnand_24x__width_1 nand_data_corr_err_c7 
	(
	.dout	(data_corr_err_c7),
	.din0	(corr_err_c7_0_2),
	.din1	(corr_err_c7_1_3)
	);


////////////////////////////////////////////////////////////////////////////////////////////////////////
//assign deccck_corr_err_c8 = data_corr_err_c8; 
//	// BS 03/18/04 : taking out deccck_corr_err_c8 to gate off cas and 
//      // swap/ldstub stores updates in case of Correctable Error as part
//      // of new requirment for RAS in N2 to retry the atomics on a CE.
//      // because of the retry, the update for the store should not happen
//      // in L2. 
////////////////////////////////////////////////////////////////////////////////////////////////////////
// in case the Notdata is detected on a sparc read of the Fill buffer itself, should
// treat it as UE . this is because a UE trap has not been issued yet, as the
// read of the fill buffer is happening before the fill. 
//
//assign  data_notdata_err_c7 =  (decc_parity0_c7 & data_notdata_err_c7_0)|  
//                               (decc_parity1_c7 & data_notdata_err_c7_1) |
//                               (decc_parity2_c7 & data_notdata_err_c7_2) |
//                               (decc_parity3_c7 & data_notdata_err_c7_3);

l2t_decc_dp_nor_macro__dnor_16x__ports_2__width_4 nor_data_notdata_err_c7_0to3 
	(
	.dout	({data_notdata_err_c7_3,data_notdata_err_c7_2,data_notdata_err_c7_1,data_notdata_err_c7_0}),
	.din0	({check3_all_ones_n,    check2_all_ones_n,    check1_all_ones_n,    check0_all_ones_n}),
	.din1	({filbuf_spc_rd_vld_c7, filbuf_spc_rd_vld_c7, filbuf_spc_rd_vld_c7, filbuf_spc_rd_vld_c7})
	);


cl_u1_aoi22_8x aoi_data_notdata_err_c7_a
      (
      .out    (data_notdata_err_c7_a),
      .in00   (decc_parity0_c7),
      .in01   (data_notdata_err_c7_0),
      .in10   (decc_parity1_c7),
      .in11   (data_notdata_err_c7_1)
      );



cl_u1_aoi22_8x aoi_data_notdata_err_c7_b
      ( 
      .out    (data_notdata_err_c7_b),
      .in00   (decc_parity2_c7),
      .in01   (data_notdata_err_c7_2),
      .in10   (decc_parity3_c7),
      .in11   (data_notdata_err_c7_3)
      );

l2t_decc_dp_nand_macro__dnand_24x__width_1 nand_data_notdata_err_c7 
	(
	.dout	(data_notdata_err_c7),
	.din0	(data_notdata_err_c7_a),
	.din1	(data_notdata_err_c7_b)
	);

///////////////////////////////////////////////////////////////////////////////////////////////////
//assign  uncorr_err_c7[0] = (|(decc_check0_c7[5:0]) & ~decc_parity0_c7) |
//                           (({decc_parity0_c7,decc_check0_c7[5:0]} == 7'b1111111) & filbuf_spc_rd_vld_c7) ;
//assign  uncorr_err_c7[1] = (|(decc_check1_c7[5:0]) & ~decc_parity1_c7)  |
//                           (({decc_parity1_c7,decc_check1_c7[5:0]} == 7'b1111111) & filbuf_spc_rd_vld_c7);
//assign  uncorr_err_c7[2] = (|(decc_check2_c7[5:0]) & ~decc_parity2_c7) |
//                           (({decc_parity2_c7,decc_check2_c7[5:0]} == 7'b1111111) & filbuf_spc_rd_vld_c7) ;
//assign  uncorr_err_c7[3] = (|(decc_check3_c7[5:0]) & ~decc_parity3_c7) |
//                           (({decc_parity3_c7,decc_check3_c7[5:0]} == 7'b1111111) & filbuf_spc_rd_vld_c7) ;

l2t_decc_dp_nand_macro__dnand_16x__ports_3__width_8 nand_checkbits_for_ue 
	(
	.dout	({compute0_ue_0_1_2, 	compute0_ue_3_4_5,
		  compute1_ue_0_1_2,    compute1_ue_3_4_5,
		  compute2_ue_0_1_2,    compute2_ue_3_4_5,
		  compute3_ue_0_1_2,    compute3_ue_3_4_5}),
	.din0	({decc_check0_c7_n[0],  decc_check0_c7_n[3],
		  decc_check1_c7_n[0],  decc_check1_c7_n[3],
		  decc_check2_c7_n[0],  decc_check2_c7_n[3],
		  decc_check3_c7_n[0],  decc_check3_c7_n[3]}),
	.din1	({decc_check0_c7_n[1],  decc_check0_c7_n[4],
		  decc_check1_c7_n[1],  decc_check1_c7_n[4],
		  decc_check2_c7_n[1],  decc_check2_c7_n[4],
		  decc_check3_c7_n[1],  decc_check3_c7_n[4]}),
	.din2	({decc_check0_c7_n[2],  decc_check0_c7_n[5],
		  decc_check1_c7_n[2],  decc_check1_c7_n[5],
		  decc_check2_c7_n[2],  decc_check2_c7_n[5],
		  decc_check3_c7_n[2],  decc_check3_c7_n[5]})
	);

cl_u1_oai12_16x  oai_compute0_ue_term1 
      (
      .out    (compute0_ue_n),
      .in00   (compute0_ue_0_1_2),
      .in01   (compute0_ue_3_4_5),
      .in10   (decc_parity0_c7_n)
      );

cl_u1_oai12_16x  oai_compute1_ue_term1 
      ( 
      .out    (compute1_ue_n),
      .in00   (compute1_ue_0_1_2),
      .in01   (compute1_ue_3_4_5),
      .in10   (decc_parity1_c7_n)
      );

cl_u1_oai12_16x  oai_compute2_ue_term1 
      ( 
      .out    (compute2_ue_n),
      .in00   (compute2_ue_0_1_2),
      .in01   (compute2_ue_3_4_5),
      .in10   (decc_parity2_c7_n)
      );

cl_u1_oai12_16x  oai_compute3_ue_term1 
      ( 
      .out    (compute3_ue_n),
      .in00   (compute3_ue_0_1_2),
      .in01   (compute3_ue_3_4_5),
      .in10   (decc_parity3_c7_n)
      );

l2t_decc_dp_nor_macro__dnor_16x__width_4 nor_uncorr_err_c7_0123	
	(
	.dout	({uncorr_err_c7_0,uncorr_err_c7_1,uncorr_err_c7_2,uncorr_err_c7_3}),
	.din0	({check0_all_ones_n,check1_all_ones_n,check2_all_ones_n,check3_all_ones_n}),
	.din1	({4{filbuf_spc_rd_vld_c7_n}})
	);

l2t_decc_dp_inv_macro__dinv_32x__width_4 inv_computed_ue_signals 
	(
	.dout	({compute3_ue,compute2_ue,compute1_ue,compute0_ue}),
	.din	({compute3_ue_n,compute2_ue_n,compute1_ue_n,compute0_ue_n})
	);

cl_u1_aoi12_16x  aoi_uncorr_err_c7_bit0
      ( 
      .out    (uncorr_err_c7_n[0]),
      .in00   (decc_parity0_c7),
      .in01   (uncorr_err_c7_0),
      .in10   (compute0_ue)
      );

cl_u1_aoi12_16x  aoi_uncorr_err_c7_bit1 
      (
      .out    (uncorr_err_c7_n[1]),
      .in00   (decc_parity1_c7),
      .in01   (uncorr_err_c7_1),
      .in10   (compute1_ue)
      );
cl_u1_aoi12_16x  aoi_uncorr_err_c7_bit2 
      (
      .out    (uncorr_err_c7_n[2]),
      .in00   (decc_parity2_c7),
      .in01   (uncorr_err_c7_2),
      .in10   (compute2_ue)
      );
cl_u1_aoi12_16x  aoi_uncorr_err_c7_bit3 
      (
      .out    (uncorr_err_c7_n[3]),
      .in00   (decc_parity3_c7),
      .in01   (uncorr_err_c7_3),
      .in10   (compute3_ue)
      );


l2t_decc_dp_inv_macro__dinv_32x__width_4 inv_uncorr_err_c7 
	(
	.dout	(deccdp_decck_uncorr_err_c7[3:0]),
	.din	(uncorr_err_c7_n[3:0])
	);

///////////////////////////////////////////////////////////////////////////////////////////////////
//assign  deccdp_decck_uncorr_err_c7[3:0] =  uncorr_err_c7[3:0] ;

l2t_decc_dp_nand_macro__dnand_16x__width_2 nand_uncorr_err_c7_0_to_3 
        (
        .dout   ({uncorr_err_c7_0_2,uncorr_err_c7_1_3}),
        .din0   ({uncorr_err_c7_n[0] ,uncorr_err_c7_n[1]}),
        .din1   ({uncorr_err_c7_n[2] ,uncorr_err_c7_n[3]})
        );

l2t_decc_dp_inv_macro__dinv_24x__stack_2r__width_2 inv_uncorr_err_c7_0_2_n 
	(
	.dout	({uncorr_err_c7_0_2_n,uncorr_err_c7_1_3_n}),
	.din	({uncorr_err_c7_0_2,uncorr_err_c7_1_3})
	);

l2t_decc_dp_nand_macro__dnand_32x__width_1 nand_data_uncorr_err_c7 
        (
        .dout   (data_uncorr_err_c7),
        .din0   (uncorr_err_c7_0_2_n),
        .din1   (uncorr_err_c7_1_3_n)
        );


///////////////////////////////////////////////////////////////////////////////////////////////////
// AOI = 20ps
//
//assign opt_c7terms[0] = ((tag_spc_rd_vld_c7 | filbuf_spc_rd_vld_c7 | filbuf_spc_corr_err_c7 )
//				 & error_ceen_d1 );
//assign opt_c7terms[1] = ((tag_spc_rd_vld_c7 | filbuf_spc_rd_vld_c7 | filbuf_spc_uncorr_err_c7 )
//				 & error_nceen_d1 );
//

l2t_decc_dp_inv_macro__dinv_32x__width_4 inv_filbuf_spc_rd_vld_c7 
	(
	.din({tag_spc_rd_vld_c7,filbuf_spc_uncorr_err_c7,
		filbuf_spc_corr_err_c7,filbuf_spc_rd_vld_c7}),
	.dout({tag_spc_rd_vld_c7_n,filbuf_spc_uncorr_err_c7_n,
		filbuf_spc_corr_err_c7_n,filbuf_spc_rd_vld_c7_n})
	);


//msffi_macro ff_opt_c7terms  (width=4,dmsffi=32x)
//	(
//	.dout_l	({tag_spc_rd_vld_c7_n,filbuf_spc_rd_vld_c7_n,
//		 filbuf_spc_corr_err_c7_n,filbuf_spc_uncorr_err_c7_n}),
//	.din	({tag_spc_rd_vld_c6,filbuf_spc_rd_vld_c6,
//		 filbuf_spc_corr_err_c6,filbuf_spc_uncorr_err_c6}),
//	.scan_in(ff_opt_c7terms_scanin),
//	.scan_out(ff_opt_c7terms_scanout),
//	.clk	(l2clk),
//	.en	(1'b1),
//	);


l2t_decc_dp_nand_macro__ports_3__width_1 nand_opt_terms_bit0_1  
	(
	.dout	(tag_fb_spc_rd_ce_c7),
	.din0	(tag_spc_rd_vld_c7_n),
	.din1	(filbuf_spc_rd_vld_c7_n),
	.din2	(filbuf_spc_corr_err_c7_n)
	);


l2t_decc_dp_nand_macro__dnand_16x__width_1 nand_opt_c7terms_bit0_2 
	(
	.dout	(opt_c7terms_n[0]),
	.din0	(tag_fb_spc_rd_ce_c7),
	.din1	(error_ceen_d1)
	);

l2t_decc_dp_inv_macro__dinv_32x__width_2 inv_opt_c7terms_bit0   
	(
	.dout	(opt_c7terms[1:0]),
	.din	(opt_c7terms_n[1:0])
	);

l2t_decc_dp_nand_macro__ports_3__width_1 nand_opt_terms_bit1_2  
        (
        .dout   (tag_fb_spc_rd_ue_c7),
        .din0   (tag_spc_rd_vld_c7_n),
        .din1   (filbuf_spc_rd_vld_c7_n),
        .din2   (filbuf_spc_uncorr_err_c7_n)
        );

l2t_decc_dp_nand_macro__dnand_16x__width_1 nand_opt_c7terms_bit1_2 
        (
        .dout   (opt_c7terms_n[1]),
        .din0   (tag_fb_spc_rd_ue_c7),
        .din1   (error_nceen_d1)
        );


///////////////////////////////////////////////////////////////////////////////////////////////////
//assign  ret_err_c7_uece[0] = (data_corr_err_c7   | filbuf_spc_corr_err_c7)  & opt_c7terms[0];
//assign  ret_err_c7_uece[1] = (data_uncorr_err_c7 | filbuf_spc_uncorr_err_c7) & opt_c7terms[1];

cl_u1_oai12_16x  oai_ret_err_c7_uece_bit0
      (
      .out    (ret_err_c7_uece_n[0]),
      .in00   (data_corr_err_c7),
      .in01   (filbuf_spc_corr_err_c7),
      .in10   (opt_c7terms[0])
      );

cl_u1_oai12_16x  oai_ret_err_c7_uece_bit1
      (
      .out    (ret_err_c7_uece_n[1]),
      .in00   (data_uncorr_err_c7),
      .in01   (filbuf_spc_uncorr_err_c7),
      .in10   (opt_c7terms[1])
      );


l2t_decc_dp_inv_macro__dinv_32x__width_2 inv_ret_err_c7_uece 
	(
	.dout	(ret_err_c7_uece[1:0]),
	.din	(ret_err_c7_uece_n[1:0])
	);



/////////////////////////////////////////////////////////////////////////////////////////////////////

//assign ret_err_c7_nd = ~(~(tag_spc_rd_vld_c7 & error_nceen_d1 & data_notdata_err_c7));

l2t_decc_dp_nand_macro__dnand_16x__ports_3__width_1 nand_ret_err_c7_nd 
	(
	.dout	(ret_err_c7_nd_n),
	.din0	(tag_spc_rd_vld_c7),
	.din1	(error_nceen_d1),
	.din2	(data_notdata_err_c7)
	);

//assign ret_err_c7_nd = ~ret_err_c7_nd_n;


///////////////////////////////////////////////////////////////////////////////////////////////////

//assign ret_err_c7[0] = (ret_err_c7_uece[0] & ~ret_err_c7_uece[1]) | ret_err_c7_nd;
//assign ret_err_c7[1] =  ret_err_c7_uece[1] | ret_err_c7_nd[0];

assign ret_err_c7[2] = 1'b0 ;  // RSVD 

l2t_decc_dp_nand_macro__width_1 nand_ret_err_c7_bit1  
	(
	.dout	(ret_err_c7[1]),
	.din0	(ret_err_c7_uece_n[1]),
	.din1	(ret_err_c7_nd_n)
	);

//cl_u1_aoi12_16x  aoi_ret_err_c7_bit0
//      ( 
//      .out    (ret_err_c7_n[0]),
//      .in00   (ret_err_c7_uece[0]),
//      .in01   (ret_err_c7_uece_n[1]),
//      .in10   (1'b0)
//      );

//assign  ret_err_c7_n[0] = ~(ret_err_c7_uece[0] & ret_err_c7_uece_n[1]);

l2t_decc_dp_nand_macro__dnand_32x__ports_2__width_1 nand_ret_err_c7_n_bit0 
	(
      	.dout   (ret_err_c7_n[0]),
      	.din0   (ret_err_c7_uece[0]),
      	.din1   (ret_err_c7_uece_n[1])
      	);

l2t_decc_dp_inv_macro__dinv_32x__width_1 inv_oqu_cerr_ack_c7_n 
	(
	.dout (ret_err_c7_nd),
	.din (ret_err_c7_nd_n)
	);

//assign rtn_err_field_c7[0] = oqu_cerr_ack_c7 | ret_err_c7_n[0] | ret_err_c7_nd;
//nand_macro nand_rtn_err_field_c7	(width=1,ports=3,dnand=24x)
//	(
//	.dout	(rtn_err_field_c7[0]),
//	.din0	(oqu_cerr_ack_c7_n),
//	.din1	(ret_err_c7_nd_n),
//	.din2	(ret_err_c7_n[0])
//	);


l2t_decc_dp_nor_macro__dnor_16x__width_1 nor_cerr_nd 
	(
	.dout	(oqu_cerr_ack_c7_or_ret_err_c7_nd_n),
	.din0	(oqu_cerr_ack_c7),
	.din1	(ret_err_c7_nd)
	);

l2t_decc_dp_nand_macro__dnand_32x__ports_2__width_1 nand_rtn_err_field_c7      
	(
      	.dout   (rtn_err_field_c7[0]),
      	.din0   (oqu_cerr_ack_c7_or_ret_err_c7_nd_n),
      	.din1   (ret_err_c7_n[0])
      	);




cl_u1_aoi12_16x  aoi_rtn_err_field_c7_1_slice 
      (
      .out    (rtn_err_field_c7_1_n),
      .in00   (ret_err_c8_1),
      .in01   (oqu_imiss_hit_c8),
      .in10   (oqu_uerr_ack_c7)
      );


//assign rtn_err_field_c7[1] = oqu_uerr_ack_c7 | (ret_err_c8_1 & oqu_imiss_hit_c8) | 
//				ret_err_c7_uece[1] | ret_err_c7_nd[0] ;
//assign rtn_err_field_c7[1] = ~rtn_err_field_c7_1_n | ret_err_c7_uece[1] | ret_err_c7_nd[0] ;

l2t_decc_dp_nand_macro__dnand_24x__ports_3__width_1 nand_rtn_err_field_c7_bit1	
	(
	.dout	(rtn_err_field_c7[1]),
	.din0	(rtn_err_field_c7_1_n),
	.din1	(ret_err_c7_uece_n[1]),
	.din2	(ret_err_c7_nd_n)
	);
//assign rtn_err_field_c7[2] = oqu_l2_miss_c7;
l2t_decc_dp_buff_macro__dbuff_32x__width_1 buff_rtn_err_field_c7_bit2	
	(
	.dout	(rtn_err_field_c7[2]),
	.din	(oqu_l2_miss_c7)
	);




/////////////////////////////////////////////////////////////////////////////////////////////////////
//
//msff_macro ff_all_err_signals (width=6,stack=10r,dmsff=32x)
//	(
//	.scan_in(ff_all_err_signals_scanin),
//	.scan_out(ff_all_err_signals_scanout),
//	.dout	({ret_err_c8_1,error_ceen_d1,error_nceen_d1,deccck_uncorr_err_c8,
//			data_corr_err_c8,deccck_notdata_err_c8}),
//	.din	({ret_err_c7[1],csr_error_ceen,csr_error_nceen,data_uncorr_err_c7,
//			data_corr_err_c7,data_notdata_err_c7}),
//	.en	(1'b1),
//	.clk	(l2clk)
//	);
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 
/////////////////////////////////////////////////////////////////////////////////////////////////// 
/////////////////////////////////////////////////////////////////////////////////////////////////// 
/////////////////////////////////////////////////////////////////////////////////////////////////// 
/////////////////////////////////////////////////////////////////////////////////////////////////// 
/////////////////////////////////////////////////////////////////////////////////////////////////// 
/////////////////////////////////////////////////////////////////////////////////////////////////// 

 
l2t_ecc39a_dp  bit117_155 
 	(
	.dout	(corr_data_c7[127:96]), 
	.cflag	(decc_check3_c7[5:0]), 
  	.pflag	(decc_parity3_c7), 
  	.pflag_n(decc_parity3_c7_n), 
  	.parity	(retbuf_ret_ecc_c7[27:21]), 
  	.din	(retbuf_ret_data_c7[127:96]) 
  	); 
 
// msb to the left, arrange this flop in 4 rows. 
l2t_decc_dp_msff_macro__dmsff_32x__stack_32r__width_32 ff_data_rtn_c8_127_96 
        (
	.scan_in(ff_data_rtn_c8_127_96_scanin),
	.scan_out(ff_data_rtn_c8_127_96_scanout),
	.din 	(corr_data_c7[127:96]),	// For example, 96,100,104 .. belong to the same row 
        .clk 	(l2clk), 
        .dout	(decc_ret_data_c8[127:96]), 
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	
	
 // interleave the bits 
        ); 
 
l2t_ecc39a_dp  bit78_116 
 	(
	.dout	(corr_data_c7[95:64]), 
	.cflag	(decc_check2_c7[5:0]), 
  	.pflag	(decc_parity2_c7), 
  	.pflag_n(decc_parity2_c7_n), 
  	.parity	(retbuf_ret_ecc_c7[20:14]), 
  	.din	(retbuf_ret_data_c7[95:64]) 
  	); 
 
// msb to the left , arrange this flop in 4 rows.
l2t_decc_dp_msff_macro__dmsff_32x__stack_32r__width_32 ff_data_rtn_c8_95_64 
         (
	.scan_in(ff_data_rtn_c8_95_64_scanin),
	.scan_out(ff_data_rtn_c8_95_64_scanout),
	.din 	(corr_data_c7[95:64]),	// For example, 64,68,8 .. belong to the same row 
        .clk 	(l2clk), 
        .dout	(decc_ret_data_c8[95:64]),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	
	
 // interleave the bits 
         ) ; 
 
l2t_ecc39a_dp  bit39_77 
 (.dout(corr_data_c7[63:32]), 
  .cflag(decc_check1_c7[5:0]), 
  .pflag(decc_parity1_c7), 
  .pflag_n(decc_parity1_c7_n), 
  .parity(retbuf_ret_ecc_c7[13:7]), 
  .din(retbuf_ret_data_c7[63:32]) 
  ) ; 
 
// msb to the left, arrange this flop in 4 rows. 
l2t_decc_dp_msff_macro__dmsff_32x__stack_32r__width_32 ff_data_rtn_c8_63_32 
        (
	.scan_in(ff_data_rtn_c8_63_32_scanin),
	.scan_out(ff_data_rtn_c8_63_32_scanout),
	.din 	(corr_data_c7[63:32]),	// For example, 32,36,40 .. belong to the same row 
        .clk 	(l2clk), 
        .dout	(decc_ret_data_c8[63:32]),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
	
	
 // interleave the bits 
        ) ; 
 
l2t_ecc39a_dp  bit0_38 
 (.dout   (corr_data_c7[31:0]), 
  .cflag  (decc_check0_c7[5:0]), 
  .pflag  (decc_parity0_c7), 
  .pflag_n(decc_parity0_c7_n), 
  .parity (retbuf_ret_ecc_c7[6:0]), 
  .din    (retbuf_ret_data_c7[31:0]) 
  ) ; 
 
// msb to the left, arrange this flop in 4 rows. 
l2t_decc_dp_msff_macro__dmsff_32x__stack_32r__width_32 ff_data_rtn_c8_31_0 
             (
		.scan_in(ff_data_rtn_c8_31_0_scanin),
		.scan_out(ff_data_rtn_c8_31_0_scanout),
		.din 	(corr_data_c7[31:0]),	// For example, 32,36,40 .. belong to the same row 
               	.clk 	(l2clk), 
               	.dout	(decc_ret_data_c8[31:0]),
		.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
		
		
 // interleave the bits 
              ) ; 
 
 
////////////////////////// 
// SYNDROME to csr. 
////////////////////////// 
assign  error_synd_c7 = {decc_parity3_c7,decc_check3_c7[5:0], decc_parity2_c7,decc_check2_c7[5:0],		 
                         decc_parity1_c7,decc_check1_c7[5:0], decc_parity0_c7,decc_check0_c7[5:0]} ; 
 

l2t_decc_dp_msff_macro__dmsff_32x__stack_38r__width_38 ff_error_synd_c8 
               (
		.scan_in(ff_error_synd_c8_scanin),
		.scan_out(ff_error_synd_c8_scanout),
		.dout ({tag_spc_rd_vld_c7,filbuf_spc_rd_vld_c7,filbuf_spc_corr_err_c7,
			filbuf_spc_uncorr_err_c7,ret_err_c8_1,error_ceen_d1,error_nceen_d1,
			deccck_uncorr_err_c8,data_corr_err_c8,deccck_notdata_err_c8,
		        error_synd_c8[27:0]}), 
		.clk (l2clk), 
               	.din({tag_spc_rd_vld_c6,filbuf_spc_rd_vld_c6,filbuf_spc_corr_err_c6,
		      filbuf_spc_uncorr_err_c6,ret_err_c7[1],csr_error_ceen,csr_error_nceen,
		      data_uncorr_err_c7,data_corr_err_c7,data_notdata_err_c7,error_synd_c7[27:0]}),
		.en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
               ) ; 
 
l2t_decc_dp_msff_macro__dmsff_32x__dmsff_32x__stack_30r__width_29 ff_lda_syndrome_c9 
               (
		.scan_in(ff_lda_syndrome_c9_scanin),
		.scan_out(ff_lda_syndrome_c9_scanout),
		.din 	({deccck_dword_sel_c7,error_synd_c8[27:0]}), 
                .clk 	(l2clk), 
                .dout	({dword_sel_c8,decc_lda_syndrome_c9[27:0]}),
		.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
              ) ; 
 
//inv_macro inv_added (width=1)
//        (
//         .dout   (dword_sel_c8_n),
//         .din    (dword_sel_c8)
//         );
 
l2t_decc_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_32r__width_32 ret_mux 
              (.dout (decc_arbdp_data_c8[63:32]), 
               .din0  (decc_ret_data_c8[63:32]),    
               .din1  (decc_ret_data_c8[127:96]),  
		.sel0 (dword_sel_c8)
	//	.sel1 (dword_sel_c8) 
              ) ; 

l2t_decc_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_32r__width_32 ret_mux1 
              (.dout (decc_arbdp_data_c8[31:0]),
               .din0  (decc_ret_data_c8[31:0]),    
               .din1  (decc_ret_data_c8[95:64]),  
		.sel0 (dword_sel_c8)
		//.sel0 (dword_sel_c8_n)
              ) ;
 
assign data_word1_c7 = {retbuf_ret_data_c7[95:64], retbuf_ret_ecc_c7[20:14]} ; 
assign data_word0_c7 = {retbuf_ret_data_c7[127:96],retbuf_ret_ecc_c7[27:21]} ; 


//inv_macro mux_rgt_diag_inv_slice (width=1) 
//        (
//        .dout   (deccck_sel_higher_word_c7_n),
//        .din    (deccck_sel_higher_word_c7)
//        );
// 
//mux_macro mux_left_diag_out (width=39,ports=2,mux=aonpe,stack=39r,dmux=8x)
//             (
//		.dout  (left_diag_out_c7[38:0]), 
//		.din0  (data_word0_c7[38:0]),  
//		.sel0  (deccck_sel_higher_word_c7_n), 
//		.din1  (data_word1_c7[38:0]),  
//		.sel1  (deccck_sel_higher_word_c7) 
//              ) ; 
// 
assign data_word3_c7 = {retbuf_ret_data_c7[31:0],  retbuf_ret_ecc_c7[6:0]} ; 
assign data_word2_c7 = {retbuf_ret_data_c7[63:32], retbuf_ret_ecc_c7[13:7]} ; 
 
//
//mux_macro mux_rgt_diag_out (width=39,ports=2,mux=aonpe,stack=39r,dmux=8x)
//              (
//		.dout  (rgt_diag_out_c7[38:0]), 
//		.din0  (data_word2_c7[38:0]),  
//                .din1  (data_word3_c7[38:0]),  
//		.sel0  (deccck_sel_higher_word_c7_n), 
//		.sel1  (deccck_sel_higher_word_c7) 
//              ) ; 
// 
//inv_macro mux_diag_out_inv_slice (width=1) 
//	(
//	.dout	(deccck_sel_higher_dword_c7_n),
//	.din	(deccck_sel_higher_dword_c7)
//	);
//
//mux_macro mux_diag_out (width=39,ports=2,mux=aonpe,stack=39r,dmux=8x)
//              (
//		.dout (decc_ret_diag_data_c7[38:0]), 
//		.din0  (left_diag_out_c7[38:0]),  
//               	.din1  (rgt_diag_out_c7[38:0]),   
//		.sel0 (deccck_sel_higher_dword_c7_n), 
//		.sel1 (deccck_sel_higher_dword_c7) 
//              ) ; 

l2t_decc_dp_mux_macro__dmux_32x__mux_pgpe__ports_4__stack_39r__width_39 mux_diag_out  // ATPG cleanup
              (
              .dout (decc_ret_diag_data_c7[38:0]),
              .din0  (data_word0_c7[38:0]),
              .din1  (data_word1_c7[38:0]),
              .din2  (data_word2_c7[38:0]),
              .din3  (data_word3_c7[38:0]),
              .sel0  (deccck_muxsel_diag_out_c7[0]),
              .sel1  (deccck_muxsel_diag_out_c7[1]),
              .sel2  (deccck_muxsel_diag_out_c7[2]),
  .muxtst(muxtst),
  .test(test)
              ) ;

l2t_decc_dp_mux_macro__mux_aope__ports_2__stack_39r__width_39  mux_data_tag_dmo_data 
        (
        .dout   (mbist_dmo_data_out[38:0]),
        .din0   ({11'b0,tagd_evict_tag_c3[27:0]}),
        .din1   (decc_ret_diag_data_c7[38:0]),
        .sel0   (tcu_l2t_tag_or_data_sel)
        );

l2t_decc_dp_cmp_macro__width_8 cmp_mbist_data0	
	(
	.dout	(mbist_l2data_fail0),
	.din0	({1'b0,decc_ret_diag_data_c7[38:32]}),
	.din1	({1'b0,mbist_write_data_c6[6:0]})
	);

l2t_decc_dp_cmp_macro__width_32 cmp_mbist_data1       
        (
        .dout   (mbist_l2data_fail1),
        .din0   (decc_ret_diag_data_c7[31:0]),
        .din1   ({4{mbist_write_data_c6[7:0]}})
        );

//assign mbist_l2data_fail = mbist_l2data_fail0 & mbist_l2data_fail1;

l2t_decc_dp_and_macro__width_1 and_mbist_l2data_fail 
	(
	.dout	(mbist_l2data_fail_fnl),
	.din0	(mbist_l2data_fail0),
	.din1	(mbist_l2data_fail1)
	);

l2t_decc_dp_mux_macro__mux_aonpe__stack_2r__width_1 mux_mbist_fail 
	(
	.dout	(mbist_l2data_fail_w),
	.din0	(mbist_l2data_fail_fnl),
	.din1	(1'b1),
	.sel0	(mbist_l2d_write_c6_n),
	.sel1	(mbist_l2d_write_c6)
	);

l2t_decc_dp_inv_macro__dinv_32x__width_1 inv_mbist_l2d_write_c7 
	(
	.dout	(mbist_l2d_write_c6_n),
	.din	(mbist_l2d_write_c6)
	);

l2t_decc_dp_msff_macro__dmsff_32x__stack_38r__width_29 ff_fame_mbist_flops_0 
               (
                .scan_in(ff_fame_mbist_flops_0_scanin),
                .scan_out(ff_fame_mbist_flops_0_scanout),
                .din ({ mbist_write_data_c4[7:0],
			mbist_write_data_c5[7:0],
			mbist_write_data_c52[7:0],
			mbist_l2data_fail_w,
			mbist_l2d_write_c3,
			mbist_l2d_write_c4,
			mbist_l2d_write_c5,
			mbist_l2d_write_c52}),
                .clk (l2clk), 
                .dout({ mbist_write_data_c5[7:0],
                        mbist_write_data_c52[7:0],
			mbist_write_data_c6[7:0],
			mbist_l2data_fail,
                        mbist_l2d_write_c4,
			mbist_l2d_write_c5,
			mbist_l2d_write_c52,
			mbist_l2d_write_c6}),
                .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
               ) ; 



l2t_decc_dp_msff_macro__dmsff_32x__stack_39r__width_35 ff_fame_mbist_flops 
               (
                .scan_in(ff_fame_mbist_flops_scanin),
                .scan_out(ff_fame_mbist_flops_scanout),
                .din ({ mbist_write_data[7:0],
                        mbist_write_data_c1[7:0],
                        mbist_write_data_c2[7:0],
			mbist_l2d_write,
                        mbist_l2d_write_c1,
                        mbist_l2d_write_c2,
                        mbist_write_data_c3[7:0]}),
                .clk (l2clk),
                .dout({ mbist_write_data_c1[7:0],
                        mbist_write_data_c2[7:0],
                        mbist_write_data_c3[7:0],
			mbist_l2d_write_c1,
                        mbist_l2d_write_c2,
                        mbist_l2d_write_c3,
                        mbist_write_data_c4[7:0]}),
                .en(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
               ) ;




/////////////////////////////////////////////////////////////////////////
// Added invertors to drive to output que                              //
/////////////////////////////////////////////////////////////////////////
assign decc_ret_data_c7[127:0] = corr_data_c7[127:0] ;



////////////////////////////////////////


assign 	retbuf_ret_data_c7[127:0] = ret_data_c7_buf[127:0];
assign  retbuf_ret_ecc_c7[27:0]	= ret_ecc_c7_buf[27:0];
assign  {ret_data_c6[31:0],   ret_ecc_c6[6:0]}   = l2d_l2t_decc_c6[38:0]; 
assign  {ret_data_c6[63:32],  ret_ecc_c6[13:7]}  = l2d_l2t_decc_c6[77:39]; 
assign  {ret_data_c6[95:64],  ret_ecc_c6[20:14]} = l2d_l2t_decc_c6[116:78]; 
assign  {ret_data_c6[127:96], ret_ecc_c6[27:21]} = l2d_l2t_decc_c6[155:117]; 
 
// arrange these flops in 16 rows and 10 columns 
// row0 ->{ data[2:0],ecc[6:0]} 
// row1 ->{ data[12:3]} 
// row2 ->{ data[22:13]} 
// row3 ->{ data[31:23]} 
// and so 0n. Buffer the outputs of each  
// bit with a 40x buffer/inverter. 

l2t_decc_dp_msff_macro__dmsff_32x__stack_39r__width_39 ff_data_rtn_c7_1split1 
              (	
		.scan_in(ff_data_rtn_c7_1split1_scanin),
		.scan_out(ff_data_rtn_c7_1split1_scanout),
		.dout	({ret_ecc_c7_buf[27:21],ret_data_c7_buf[127:96]}), 
               	.din	({ret_ecc_c6[27:21],ret_data_c6[127:96]}), 
               	.clk	(l2clk), 
               	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
              ) ; 

l2t_decc_dp_msff_macro__dmsff_32x__stack_39r__width_39 ff_data_rtn_c7_1split2 
              (
                .scan_in(ff_data_rtn_c7_1split2_scanin),
                .scan_out(ff_data_rtn_c7_1split2_scanout),
                .dout   ({ret_ecc_c7_buf[20:14],ret_data_c7_buf[95:64]}),
                .din    ({ret_ecc_c6[20:14],ret_data_c6[95:64]}),
                .clk    (l2clk),
                .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;

l2t_decc_dp_msff_macro__dmsff_32x__stack_39r__width_39 ff_data_rtn_c7_1split3 
              (
                .scan_in(ff_data_rtn_c7_1split3_scanin),
                .scan_out(ff_data_rtn_c7_1split3_scanout),
                .dout   ({ret_ecc_c7_buf[13:7],ret_data_c7_buf[63:32]}),
                .din    ({ret_ecc_c6[13:7],ret_data_c6[63:32]}),
                .clk    (l2clk),
                .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;

l2t_decc_dp_msff_macro__dmsff_32x__stack_39r__width_39 ff_data_rtn_c7_1split4 
              (
                .scan_in(ff_data_rtn_c7_1split4_scanin),
                .scan_out(ff_data_rtn_c7_1split4_scanout),
                .dout   ({ret_ecc_c7_buf[6:0],ret_data_c7_buf[31:0]}),
                .din    ({ret_ecc_c6[6:0],ret_data_c6[31:0]}),
                .clk    (l2clk),
                .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
              ) ;


// fixscan start:
assign ff_data_rtn_c8_127_96_scanin = scan_in                  ;
assign ff_data_rtn_c8_95_64_scanin = ff_data_rtn_c8_127_96_scanout;
assign ff_data_rtn_c8_63_32_scanin = ff_data_rtn_c8_95_64_scanout;
assign ff_data_rtn_c8_31_0_scanin = ff_data_rtn_c8_63_32_scanout;
assign ff_error_synd_c8_scanin   = ff_data_rtn_c8_31_0_scanout;
assign ff_lda_syndrome_c9_scanin = ff_error_synd_c8_scanout ;
assign ff_fame_mbist_flops_0_scanin = ff_lda_syndrome_c9_scanout;
assign ff_fame_mbist_flops_scanin = ff_fame_mbist_flops_0_scanout;
assign ff_data_rtn_c7_1split1_scanin = ff_fame_mbist_flops_scanout;
assign ff_data_rtn_c7_1split2_scanin = ff_data_rtn_c7_1split1_scanout;
assign ff_data_rtn_c7_1split3_scanin = ff_data_rtn_c7_1split2_scanout;
assign ff_data_rtn_c7_1split4_scanin = ff_data_rtn_c7_1split3_scanout;
assign scan_out                  = ff_data_rtn_c7_1split4_scanout;
// fixscan end:
endmodule 


//
//   invert macro
//
//





module l2t_decc_dp_inv_macro__dinv_32x__stack_32r__width_24 (
  din, 
  dout);
  input [23:0] din;
  output [23:0] dout;






inv #(24)  d0_0 (
.in(din[23:0]),
.out(dout[23:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module l2t_decc_dp_nor_macro__dnor_16x__ports_2__width_3 (
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





module l2t_decc_dp_nand_macro__dnand_24x__ports_3__width_4 (
  din0, 
  din1, 
  din2, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  input [3:0] din2;
  output [3:0] dout;






nand3 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.in2(din2[3:0]),
.out(dout[3:0])
);









endmodule





//
//   invert macro
//
//





module l2t_decc_dp_inv_macro__dinv_32x__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






inv #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module l2t_decc_dp_nor_macro__dnor_16x__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






nor2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);







endmodule





//
//   buff macro
//
//





module l2t_decc_dp_buff_macro__dbuff_32x__width_5 (
  din, 
  dout);
  input [4:0] din;
  output [4:0] dout;






buff #(5)  d0_0 (
.in(din[4:0]),
.out(dout[4:0])
);








endmodule





//
//   nor macro for ports = 2,3
//
//





module l2t_decc_dp_nor_macro__dnor_16x__width_2 (
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





//
//   nand macro for ports = 2,3,4
//
//





module l2t_decc_dp_nand_macro__dnand_24x__width_1 (
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
//   nor macro for ports = 2,3
//
//





module l2t_decc_dp_nor_macro__dnor_16x__ports_2__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






nor2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);







endmodule





//
//   nand macro for ports = 2,3,4
//
//





module l2t_decc_dp_nand_macro__dnand_16x__ports_3__width_8 (
  din0, 
  din1, 
  din2, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  input [7:0] din2;
  output [7:0] dout;






nand3 #(8)  d0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.in2(din2[7:0]),
.out(dout[7:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module l2t_decc_dp_nand_macro__dnand_16x__width_2 (
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





//
//   invert macro
//
//





module l2t_decc_dp_inv_macro__dinv_24x__stack_2r__width_2 (
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
//   nand macro for ports = 2,3,4
//
//





module l2t_decc_dp_nand_macro__dnand_32x__width_1 (
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





module l2t_decc_dp_nand_macro__ports_3__width_1 (
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





//
//   nand macro for ports = 2,3,4
//
//





module l2t_decc_dp_nand_macro__dnand_16x__width_1 (
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
//   invert macro
//
//





module l2t_decc_dp_inv_macro__dinv_32x__width_2 (
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
//   nand macro for ports = 2,3,4
//
//





module l2t_decc_dp_nand_macro__dnand_16x__ports_3__width_1 (
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





//
//   nand macro for ports = 2,3,4
//
//





module l2t_decc_dp_nand_macro__width_1 (
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





module l2t_decc_dp_nand_macro__dnand_32x__ports_2__width_1 (
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
//   invert macro
//
//





module l2t_decc_dp_inv_macro__dinv_32x__width_1 (
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
//   nor macro for ports = 2,3
//
//





module l2t_decc_dp_nor_macro__dnor_16x__width_1 (
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





//
//   nand macro for ports = 2,3,4
//
//





module l2t_decc_dp_nand_macro__dnand_24x__ports_3__width_1 (
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





//
//   buff macro
//
//





module l2t_decc_dp_buff_macro__dbuff_32x__width_1 (
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
//   xor macro for ports = 2,3
//
//





module l2t_decc_dp_xor_macro__dxor_16x__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;





xor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module l2t_decc_dp_xor_macro__dxor_16x__ports_2__width_1 (
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
//   parity macro (even parity)
//
//





module l2t_decc_dp_prty_macro__dprty_8x__width_32 (
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





module l2t_decc_dp_prty_macro__dprty_8x__width_8 (
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
//   invert macro
//
//





module l2t_decc_dp_inv_macro__dinv_8x__width_2 (
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
//   nand macro for ports = 2,3,4
//
//





module l2t_decc_dp_nand_macro__dnand_32x__width_3 (
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





module l2t_decc_dp_nor_macro__ports_2__width_1 (
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





//
//   xor macro for ports = 2,3
//
//





module l2t_decc_dp_xor_macro__dxor_16x__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output [31:0] dout;





xor2 #(32)  d0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout[31:0])
);








endmodule









// any PARAMS parms go into naming of macro

module l2t_decc_dp_msff_macro__dmsff_32x__stack_32r__width_32 (
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

module l2t_decc_dp_msff_macro__dmsff_32x__stack_38r__width_38 (
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
wire [36:0] so;

  input [37:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [37:0] dout;


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
dff #(38)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[37:0]),
.si({scan_in,so[36:0]}),
.so({so[36:0],scan_out}),
.q(dout[37:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module l2t_decc_dp_msff_macro__dmsff_32x__dmsff_32x__stack_30r__width_29 (
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

module l2t_decc_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_32r__width_32 (
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


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_decc_dp_mux_macro__dmux_32x__mux_pgpe__ports_4__stack_39r__width_39 (
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

  input [38:0] din0;
  input [38:0] din1;
  input [38:0] din2;
  input [38:0] din3;
  input sel0;
  input sel1;
  input sel2;
  input muxtst;
  input test;
  output [38:0] dout;





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

mux4 #(39)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[38:0]),
  .in1(din1[38:0]),
  .in2(din2[38:0]),
  .in3(din3[38:0]),
.dout(dout[38:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_decc_dp_mux_macro__mux_aope__ports_2__stack_39r__width_39 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [38:0] din0;
  input [38:0] din1;
  input sel0;
  output [38:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(39)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[38:0]),
  .in1(din1[38:0]),
.dout(dout[38:0])
);









  



endmodule


//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_decc_dp_cmp_macro__width_8 (
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





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module l2t_decc_dp_cmp_macro__width_32 (
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
//   and macro for ports = 2,3,4
//
//





module l2t_decc_dp_and_macro__width_1 (
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

module l2t_decc_dp_mux_macro__mux_aonpe__stack_2r__width_1 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [0:0] din0;
  input sel0;
  input [0:0] din1;
  input sel1;
  output [0:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(1)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[0:0]),
  .in1(din1[0:0]),
.dout(dout[0:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_decc_dp_msff_macro__dmsff_32x__stack_38r__width_29 (
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













// any PARAMS parms go into naming of macro

module l2t_decc_dp_msff_macro__dmsff_32x__stack_39r__width_35 (
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













// any PARAMS parms go into naming of macro

module l2t_decc_dp_msff_macro__dmsff_32x__stack_39r__width_39 (
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
wire [37:0] so;

  input [38:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [38:0] dout;


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
dff #(39)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[38:0]),
.si({scan_in,so[37:0]}),
.so({so[37:0],scan_out}),
.q(dout[38:0])
);




















endmodule








