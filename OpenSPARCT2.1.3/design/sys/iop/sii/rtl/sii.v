// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sii.v
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
`define SII_L2SII_O_BIT            23
`define SII_L2SII_P_BIT            22
`define SII_L2SII_E_BIT            21
`define SII_L2SII_S_BIT            20
`define SII_L2SII_CBA2_BIT         19
`define SII_L2SII_CBA1_BIT         18
`define SII_L2SII_CBA0_BIT         17
`define SII_L2SII_R_BIT            16

`define RF_RDEN_OFFSTATE            1'b1

/* 1 per L2 bank, or 8 instances in SII */
/* Write fast, Read fast */
`define SII_ILD_RF_DATAWIDTH          82
`define SII_ILD_RF_ADDRWIDTH           5
`define SII_ILD_RF_DEPTH              32

/* 1 instances in SII */
/* Write fast, Read slow */
`define SII_IND_RF_DATAWIDTH          72
`define SII_IND_RF_ADDRWIDTH           6
`define SII_IND_RF_DEPTH              48

/* 2 per L2 bank, or 16 instances in SII */
/* Write fast, Read fast */
`define SII_OLD_RF_DATAWIDTH          32
`define SII_OLD_RF_ADDRWIDTH           5
`define SII_OLD_RF_DEPTH              32

/* 1 per IO device, or 2 instances in SII */
/* Write slow, Read fast */
`define SII_IPD_DATA_RF_DATAWIDTH    160
`define SII_IPD_DATA_RF_DATAWIDTH_H  80
`define SII_IPD_DATA_RF_ADDRWIDTH      6
`define SII_IPD_DATA_RF_DEPTH         64

/* 2 per IO device, or 4 instances in SII */
/* Write slow, Read fast */
`define SII_IPD_HDR_RF_DATAWIDTH      72
`define SII_IPD_HDR_RF_ADDRWIDTH       4
`define SII_IPD_HDR_RF_DEPTH          16

/* 2 per IO device, or 4 instances in SII */
/* Write fast, Read slow */
`define SII_OPD_DATA_RF_DATAWIDTH     68
`define SII_OPD_DATA_RF_ADDRWIDTH      6
`define SII_OPD_DATA_RF_DEPTH         64

/* 1 per IO device, or 2 instances in SII */	       	       
/* Write fast, Read slow */
`define SII_OPD_HDR_RF_DATAWIDTH      32
`define SII_OPD_HDR_RF_ADDRWIDTH       4
`define SII_OPD_HDR_RF_DEPTH          16



module sii (
  gclk, 
  ccu_io_out, 
  scan_in, 
  tcu_dbr_gateoff, 
  tcu_atpg_mode, 
  tcu_pce_ov_in, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_muxtest, 
  tcu_dectest, 
  tcu_sii_data, 
  tcu_sii_vld, 
  cluster_arst_l, 
  tcu_div_bypass, 
  tcu_array_wr_inhibit, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  tcu_sii_clk_stop, 
  tcu_sii_io_clk_stop, 
  tcu_mbist_bisi_en, 
  tcu_mbist_user_mode, 
  tcu_sii_mbist_start, 
  tcu_sii_mbist_scan_in, 
  sii_tcu_mbist_done, 
  sii_tcu_mbist_fail, 
  sii_tcu_mbist_scan_out, 
  scan_out, 
  ccu_io_cmp_sync_en, 
  ccu_cmp_io_sync_en, 
  l2t0_sii_iq_dequeue, 
  l2t0_sii_wib_dequeue, 
  sii_l2t0_req_vld, 
  sii_l2t0_req, 
  sii_l2b0_ecc, 
  sii_dbg1_l2t0_req, 
  l2t1_sii_iq_dequeue, 
  l2t1_sii_wib_dequeue, 
  sii_l2t1_req_vld, 
  sii_l2t1_req, 
  sii_l2b1_ecc, 
  sii_dbg1_l2t1_req, 
  l2t2_sii_iq_dequeue, 
  l2t2_sii_wib_dequeue, 
  sii_l2t2_req_vld, 
  sii_l2t2_req, 
  sii_l2b2_ecc, 
  sii_dbg1_l2t2_req, 
  l2t3_sii_iq_dequeue, 
  l2t3_sii_wib_dequeue, 
  sii_l2t3_req_vld, 
  sii_l2t3_req, 
  sii_l2b3_ecc, 
  sii_dbg1_l2t3_req, 
  l2t4_sii_iq_dequeue, 
  l2t4_sii_wib_dequeue, 
  sii_l2t4_req_vld, 
  sii_l2t4_req, 
  sii_l2b4_ecc, 
  sii_dbg1_l2t4_req, 
  l2t5_sii_iq_dequeue, 
  l2t5_sii_wib_dequeue, 
  sii_l2t5_req_vld, 
  sii_l2t5_req, 
  sii_l2b5_ecc, 
  sii_dbg1_l2t5_req, 
  l2t6_sii_iq_dequeue, 
  l2t6_sii_wib_dequeue, 
  sii_l2t6_req_vld, 
  sii_l2t6_req, 
  sii_l2b6_ecc, 
  sii_dbg1_l2t6_req, 
  l2t7_sii_iq_dequeue, 
  l2t7_sii_wib_dequeue, 
  sii_l2t7_req_vld, 
  sii_l2t7_req, 
  sii_l2b7_ecc, 
  sii_dbg1_l2t7_req, 
  ncu_sii_niuctag_uei, 
  ncu_sii_niuctag_cei, 
  ncu_sii_niua_pei, 
  ncu_sii_niud_pei, 
  ncu_sii_dmuctag_uei, 
  ncu_sii_dmuctag_cei, 
  ncu_sii_dmua_pei, 
  ncu_sii_dmud_pei, 
  ncu_sii_gnt, 
  ncu_sii_pm, 
  ncu_sii_ba01, 
  ncu_sii_ba23, 
  ncu_sii_ba45, 
  ncu_sii_ba67, 
  ncu_sii_l2_idx_hash_en, 
  sii_ncu_niuctag_ue, 
  sii_ncu_niuctag_ce, 
  sii_ncu_niua_pe, 
  sii_ncu_niud_pe, 
  sii_ncu_dmuctag_ue, 
  sii_ncu_dmuctag_ce, 
  sii_ncu_dmua_pe, 
  sii_ncu_dmud_pe, 
  sii_ncu_syn_data, 
  sii_ncu_syn_vld, 
  sii_ncu_dparity, 
  sii_ncu_data, 
  sii_ncu_req, 
  niu_sii_hdr_vld, 
  niu_sii_reqbypass, 
  niu_sii_datareq, 
  niu_sii_data, 
  niu_sii_parity, 
  sii_niu_oqdq, 
  sii_niu_bqdq, 
  dmu_sii_hdr_vld, 
  dmu_sii_reqbypass, 
  dmu_sii_datareq, 
  dmu_sii_datareq16, 
  dmu_sii_data, 
  dmu_sii_parity, 
  dmu_sii_be_parity, 
  dmu_sii_be, 
  sii_dmu_wrack_vld, 
  sii_dmu_wrack_tag, 
  sii_dmu_wrack_parity, 
  sio_sii_opcc_ipcc_niu_by_deq, 
  sio_sii_opcc_ipcc_niu_by_cnt, 
  sio_sii_opcc_ipcc_niu_or_deq, 
  sio_sii_opcc_ipcc_dmu_by_deq, 
  sio_sii_opcc_ipcc_dmu_by_cnt, 
  sio_sii_opcc_ipcc_dmu_or_deq, 
  sio_sii_olc0_ilc0_dequeue, 
  sio_sii_olc1_ilc1_dequeue, 
  sio_sii_olc2_ilc2_dequeue, 
  sio_sii_olc3_ilc3_dequeue, 
  sio_sii_olc4_ilc4_dequeue, 
  sio_sii_olc5_ilc5_dequeue, 
  sio_sii_olc6_ilc6_dequeue, 
  sio_sii_olc7_ilc7_dequeue);
wire [3:0] indq_inc_dout_unused;
wire [71:0] indq_inc_dout;
wire [6:0] ipdodq0_dout_unused;
wire [159:0] ipdodq0_dout;
wire [6:0] ipdbdq0_dout_unused;
wire [159:0] ipdbdq0_dout;
wire [6:0] ipdodq1_dout_unused;
wire [159:0] ipdodq1_dout;
wire [6:0] ipdbdq1_dout_unused;
wire [159:0] ipdbdq1_dout;
wire sii_ext0_wrack_parity;
wire sii_niu_wrack_parity_unused;
wire sii_ext1_wrack_parity;
wire niu_sii_datareq16;
wire [15:0] niu_sii_be;
wire niu_sii_be_parity;
wire [3:0] sii_ext1_wrack_tag_unused;
wire [3:0] sii_ext1_wrack_tag;
wire sii_ext1_wrack_vld_unused;
wire sii_ext1_wrack_vld;
wire [71:0] ipcc_ind_data;
wire [89:0] ipcc_data_all3;
wire [89:0] ipcc_data_all_0;
wire [89:0] ipcc_data_all0;
wire [89:0] ipcc_data_all_1;
wire [89:0] ipcc_data_all_2;
wire [89:0] ipcc_data_all_4;
wire [89:0] ipcc_data_all1;
wire [89:0] ipcc_data_all_5;
wire [89:0] ipcc_data_all_6;
wire [89:0] ipcc_data_all2;
wire [89:0] ipcc_data_all_7;
wire [89:0] ipcc_data_all_3;
wire [89:0] ipcc_data_all_0c;
wire [89:0] ipcc_data_all_1c;
wire [89:0] ipcc_data_all_2c;
wire [89:0] ipcc_data_all_3c;
wire [89:0] ipcc_data_all_4c;
wire [89:0] ipcc_data_all_5c;
wire [89:0] ipcc_data_all_6c;
wire [89:0] ipcc_data_all_7c;
wire tcu_sii_mb0_start;
wire sii_mb0_bisi_mode;
wire sii_mb0_fail;
wire sii_mb0_done;
wire tcu_sii_mb1_start;
wire sii_mb1_bisi_mode;
wire sii_mb1_fail;
wire sii_mb1_done;
wire tcu_pce_ov;
wire pce_ov;
wire cluster_div_en;
wire ccu_slow_cmp_sync_en;
wire ccu_cmp_slow_sync_en;
wire rst_wmr_protect;
wire rst_wmr_;
wire rst_por_;
wire clk_ext;
wire ccu_soc4cmp_clk_stop;
wire ccu_soc6io_clk_stop;
wire ccu_serdes_dtm;
wire rd_pce;
wire wr_pce;
wire bist_clk_mux_sel;
wire sii_mb1_run;
wire tie_low;
wire tcu_wr_inhibit;
wire [81:0] ildq_ild_dout0;
wire ildq0_scanout;
wire [4:0] ipcc_ildq_wr_addr0_m;
wire ipcc_ildq_wr_en0_m;
wire [4:0] ilc_ildq_rd_addr0_m;
wire ilc_ildq_rd_en0_m;
wire l2clk;
wire ildq0_scanin;
wire aclk;
wire bclk;
wire array_wr_inhibit_cmp;
wire [63:0] ild_ilc_curhdr0;
wire ild0_scanout;
wire [1:0] sii_mb0_ild0_fail;
wire [1:0] ilc_ild_de_sel0;
wire [3:0] ilc_ild_ldhdr0;
wire [3:0] ilc_ild_addr_h0;
wire [3:0] ilc_ild_addr_lo0;
wire [1:0] ilc_ild_hdr_sel0;
wire [1:0] ilc_ild_cyc_sel0;
wire [63:0] ilc_ild_newhdr0;
wire ild0_scanin;
wire [7:0] sii_mb0_wdata;
wire ilc_ipcc_stop0;
wire ilc_ipcc_dmu_wrm_dq0;
wire ilc_ipcc_niu_wrm_dq0;
wire ilc_ipcc_dmu_wrm0;
wire ilc_ipcc_niu_wrm0;
wire ilc0_scanout;
wire sio_sii_olc0_ilc0_dequeue_r;
wire [4:0] ipcc_ildq_wr_addr0;
wire ipcc_ildq_wr_en0;
wire ipcc_ilc_cmd0;
wire sii_mb0_run;
wire sii_mb0_rd_en;
wire [5:0] sii_mb0_addr;
wire ilc0_scanin;
wire [81:0] ildq_ild_dout1;
wire ildq1_scanout;
wire [4:0] ipcc_ildq_wr_addr1_m;
wire ipcc_ildq_wr_en1_m;
wire [4:0] ilc_ildq_rd_addr1_m;
wire ilc_ildq_rd_en1_m;
wire ildq1_scanin;
wire [63:0] ild_ilc_curhdr1;
wire ild1_scanout;
wire [1:0] sii_mb0_ild1_fail;
wire [1:0] ilc_ild_de_sel1;
wire [3:0] ilc_ild_ldhdr1;
wire [3:0] ilc_ild_addr_h1;
wire [3:0] ilc_ild_addr_lo1;
wire [1:0] ilc_ild_hdr_sel1;
wire [1:0] ilc_ild_cyc_sel1;
wire [63:0] ilc_ild_newhdr1;
wire ild1_scanin;
wire ilc_ipcc_stop1;
wire ilc_ipcc_dmu_wrm_dq1;
wire ilc_ipcc_niu_wrm_dq1;
wire ilc_ipcc_dmu_wrm1;
wire ilc_ipcc_niu_wrm1;
wire ilc1_scanout;
wire sio_sii_olc1_ilc1_dequeue_r;
wire [4:0] ipcc_ildq_wr_addr1;
wire ipcc_ildq_wr_en1;
wire ipcc_ilc_cmd1;
wire ilc1_scanin;
wire [81:0] ildq_ild_dout2;
wire ildq2_scanout;
wire [4:0] ipcc_ildq_wr_addr2_m;
wire ipcc_ildq_wr_en2_m;
wire [4:0] ilc_ildq_rd_addr2_m;
wire ilc_ildq_rd_en2_m;
wire ildq2_scanin;
wire [63:0] ild_ilc_curhdr2;
wire ild2_scanout;
wire [1:0] sii_mb0_ild2_fail;
wire [1:0] ilc_ild_de_sel2;
wire [3:0] ilc_ild_ldhdr2;
wire [3:0] ilc_ild_addr_h2;
wire [3:0] ilc_ild_addr_lo2;
wire [1:0] ilc_ild_hdr_sel2;
wire [1:0] ilc_ild_cyc_sel2;
wire [63:0] ilc_ild_newhdr2;
wire ild2_scanin;
wire ilc_ipcc_stop2;
wire ilc_ipcc_dmu_wrm_dq2;
wire ilc_ipcc_niu_wrm_dq2;
wire ilc_ipcc_dmu_wrm2;
wire ilc_ipcc_niu_wrm2;
wire ilc2_scanout;
wire sio_sii_olc2_ilc2_dequeue_r;
wire [4:0] ipcc_ildq_wr_addr2;
wire ipcc_ildq_wr_en2;
wire ipcc_ilc_cmd2;
wire ilc2_scanin;
wire [81:0] ildq_ild_dout3;
wire ildq3_scanout;
wire [4:0] ipcc_ildq_wr_addr3_m;
wire ipcc_ildq_wr_en3_m;
wire [4:0] ilc_ildq_rd_addr3_m;
wire ilc_ildq_rd_en3_m;
wire ildq3_scanin;
wire [63:0] ild_ilc_curhdr3;
wire ild3_scanout;
wire [1:0] sii_mb0_ild3_fail;
wire [1:0] ilc_ild_de_sel3;
wire [3:0] ilc_ild_ldhdr3;
wire [3:0] ilc_ild_addr_h3;
wire [3:0] ilc_ild_addr_lo3;
wire [1:0] ilc_ild_hdr_sel3;
wire [1:0] ilc_ild_cyc_sel3;
wire [63:0] ilc_ild_newhdr3;
wire ild3_scanin;
wire ilc_ipcc_stop3;
wire ilc_ipcc_dmu_wrm_dq3;
wire ilc_ipcc_niu_wrm_dq3;
wire ilc_ipcc_dmu_wrm3;
wire ilc_ipcc_niu_wrm3;
wire ilc3_scanout;
wire sio_sii_olc3_ilc3_dequeue_r;
wire [4:0] ipcc_ildq_wr_addr3;
wire ipcc_ildq_wr_en3;
wire ipcc_ilc_cmd3;
wire ilc3_scanin;
wire [81:0] ildq_ild_dout4;
wire ildq4_scanout;
wire [4:0] ipcc_ildq_wr_addr4_m;
wire ipcc_ildq_wr_en4_m;
wire [4:0] ilc_ildq_rd_addr4_m;
wire ilc_ildq_rd_en4_m;
wire ildq4_scanin;
wire [63:0] ild_ilc_curhdr4;
wire ild4_scanout;
wire [1:0] sii_mb0_ild4_fail;
wire [1:0] ilc_ild_de_sel4;
wire [3:0] ilc_ild_ldhdr4;
wire [3:0] ilc_ild_addr_h4;
wire [3:0] ilc_ild_addr_lo4;
wire [1:0] ilc_ild_hdr_sel4;
wire [1:0] ilc_ild_cyc_sel4;
wire [63:0] ilc_ild_newhdr4;
wire ild4_scanin;
wire ilc_ipcc_stop4;
wire ilc_ipcc_dmu_wrm_dq4;
wire ilc_ipcc_niu_wrm_dq4;
wire ilc_ipcc_dmu_wrm4;
wire ilc_ipcc_niu_wrm4;
wire ilc4_scanout;
wire sio_sii_olc4_ilc4_dequeue_r;
wire [4:0] ipcc_ildq_wr_addr4;
wire ipcc_ildq_wr_en4;
wire ipcc_ilc_cmd4;
wire ilc4_scanin;
wire [81:0] ildq_ild_dout5;
wire ildq5_scanout;
wire [4:0] ipcc_ildq_wr_addr5_m;
wire ipcc_ildq_wr_en5_m;
wire [4:0] ilc_ildq_rd_addr5_m;
wire ilc_ildq_rd_en5_m;
wire ildq5_scanin;
wire [63:0] ild_ilc_curhdr5;
wire ild5_scanout;
wire [1:0] sii_mb0_ild5_fail;
wire [1:0] ilc_ild_de_sel5;
wire [3:0] ilc_ild_ldhdr5;
wire [3:0] ilc_ild_addr_h5;
wire [3:0] ilc_ild_addr_lo5;
wire [1:0] ilc_ild_hdr_sel5;
wire [1:0] ilc_ild_cyc_sel5;
wire [63:0] ilc_ild_newhdr5;
wire ild5_scanin;
wire ilc_ipcc_stop5;
wire ilc_ipcc_dmu_wrm_dq5;
wire ilc_ipcc_niu_wrm_dq5;
wire ilc_ipcc_dmu_wrm5;
wire ilc_ipcc_niu_wrm5;
wire ilc5_scanout;
wire sio_sii_olc5_ilc5_dequeue_r;
wire [4:0] ipcc_ildq_wr_addr5;
wire ipcc_ildq_wr_en5;
wire ipcc_ilc_cmd5;
wire ilc5_scanin;
wire [81:0] ildq_ild_dout6;
wire ildq6_scanout;
wire [4:0] ipcc_ildq_wr_addr6_m;
wire ipcc_ildq_wr_en6_m;
wire [4:0] ilc_ildq_rd_addr6_m;
wire ilc_ildq_rd_en6_m;
wire ildq6_scanin;
wire [63:0] ild_ilc_curhdr6;
wire ild6_scanout;
wire [1:0] sii_mb0_ild6_fail;
wire [1:0] ilc_ild_de_sel6;
wire [3:0] ilc_ild_ldhdr6;
wire [3:0] ilc_ild_addr_h6;
wire [3:0] ilc_ild_addr_lo6;
wire [1:0] ilc_ild_hdr_sel6;
wire [1:0] ilc_ild_cyc_sel6;
wire [63:0] ilc_ild_newhdr6;
wire ild6_scanin;
wire ilc_ipcc_stop6;
wire ilc_ipcc_dmu_wrm_dq6;
wire ilc_ipcc_niu_wrm_dq6;
wire ilc_ipcc_dmu_wrm6;
wire ilc_ipcc_niu_wrm6;
wire ilc6_scanout;
wire sio_sii_olc6_ilc6_dequeue_r;
wire [4:0] ipcc_ildq_wr_addr6;
wire ipcc_ildq_wr_en6;
wire ipcc_ilc_cmd6;
wire ilc6_scanin;
wire [81:0] ildq_ild_dout7;
wire ildq7_scanout;
wire [4:0] ipcc_ildq_wr_addr7_m;
wire ipcc_ildq_wr_en7_m;
wire [4:0] ilc_ildq_rd_addr7_m;
wire ilc_ildq_rd_en7_m;
wire ildq7_scanin;
wire [63:0] ild_ilc_curhdr7;
wire ild7_scanout;
wire [1:0] sii_mb0_ild7_fail;
wire [1:0] ilc_ild_de_sel7;
wire [3:0] ilc_ild_ldhdr7;
wire [3:0] ilc_ild_addr_h7;
wire [3:0] ilc_ild_addr_lo7;
wire [1:0] ilc_ild_hdr_sel7;
wire [1:0] ilc_ild_cyc_sel7;
wire [63:0] ilc_ild_newhdr7;
wire ild7_scanin;
wire ilc_ipcc_stop7;
wire ilc_ipcc_dmu_wrm_dq7;
wire ilc_ipcc_niu_wrm_dq7;
wire ilc_ipcc_dmu_wrm7;
wire ilc_ipcc_niu_wrm7;
wire ilc7_scanout;
wire sio_sii_olc7_ilc7_dequeue_r;
wire [4:0] ipcc_ildq_wr_addr7;
wire ipcc_ildq_wr_en7;
wire ipcc_ilc_cmd7;
wire ilc7_scanin;
wire indq_scanout;
wire [5:0] ipcc_indq_wr_addr;
wire ipcc_indq_wr_en;
wire [5:0] inc_indq_rd_addr;
wire inc_indq_rd_en;
wire indq_scanin;
wire inc_ipcc_stop;
wire inc_scanout;
wire [1:0] sii_mb0_ind_fail;
wire ipcc_inc_wr_ovfl;
wire cmp_io_sync_en_in;
wire io_cmp_sync_en_in;
wire inc_scanin;
wire sii_mb0_ind_rd_en;
wire array_wr_inhibit;
wire [2:0] data_sel;
wire [4:0] gnt0_r_m;
wire hdr_data_sel;
wire [63:0] newhdr_l2;
wire [63:0] newhdr_nc;
wire [5:0] new_c;
wire data_parity_err;
wire [71:0] tcu_hdr;
wire [63:0] tcu_data;
wire [11:0] tcu_be_par;
wire ipcc_ipcs_dmu_or_go_lv;
wire ipcc_ipcs_dmu_by_go_lv;
wire [3:0] ipcc_ipcs_dmu_or_ptr;
wire [3:0] ipcc_ipcs_dmu_by_ptr;
wire [3:0] ipcc_ipcs_dmu_tag;
wire ipcc_ipcs_wrack_lv;
wire ipcc_ipcs_dmu_wrack_p;
wire ipcc_ipcs_niu_or_go_lv;
wire ipcc_ipcs_niu_by_go_lv;
wire [3:0] ipcc_ipcs_niu_or_ptr;
wire [3:0] ipcc_ipcs_niu_by_ptr;
wire sii_mb1_run_r;
wire [5:0] ipcc_ipdodq0_rd_addr_m;
wire [5:0] ipcc_ipdbdq0_rd_addr_m;
wire [3:0] ipcc_ipdohq0_rd_addr_m;
wire [3:0] ipcc_ipdbhq0_rd_addr_m;
wire ipcc_ipdohq0_rd_en_m;
wire ipcc_ipdbhq0_rd_en_m;
wire ipcc_ipdodq0_rd_en_m;
wire ipcc_ipdbdq0_rd_en_m;
wire [5:0] ipcc_ipdodq1_rd_addr_m;
wire [5:0] ipcc_ipdbdq1_rd_addr_m;
wire [3:0] ipcc_ipdohq1_rd_addr_m;
wire [3:0] ipcc_ipdbhq1_rd_addr_m;
wire ipcc_ipdohq1_rd_en_m;
wire ipcc_ipdbhq1_rd_en_m;
wire ipcc_ipdodq1_rd_en_m;
wire ipcc_ipdbdq1_rd_en_m;
wire ipcc_scanout;
wire array_wr_inhibit_io;
wire sio_sii_opcc_ipcc_dmu_or_deq_r;
wire sio_sii_opcc_ipcc_dmu_by_deq_r;
wire sio_sii_opcc_ipcc_niu_or_deq_r;
wire sio_sii_opcc_ipcc_niu_by_deq_r;
wire [3:0] sio_sii_opcc_ipcc_dmu_by_cnt_r;
wire [3:0] sio_sii_opcc_ipcc_niu_by_cnt_r;
wire [84:0] ipcc_dp_par_data;
wire [71:0] curhdr;
wire [15:0] ipcs_ipcc_dmu_or_dep;
wire [15:0] ipcs_ipcc_dmu_by_dep;
wire [15:0] ipcs_ipcc_niu_or_dep;
wire [15:0] ipcs_ipcc_niu_by_dep;
wire ipcs_ipcc_add_dmu_or;
wire ipcs_ipcc_add_dmu_by;
wire ipcs_ipcc_add_niu_or;
wire ipcs_ipcc_add_niu_by;
wire sii_mb0_wr_en;
wire sii_mb0_ind_wr_en;
wire [3:0] sii_mb1_1of4ipd_sel;
wire sii_mb1_ipd_data_or_hdr_sel;
wire sii_mb1_ipd_data_hibits_sel;
wire [5:0] sii_mb1_addr;
wire sii_mb1_ipdohq0_rd_en;
wire sii_mb1_ipdbhq0_rd_en;
wire sii_mb1_ipdodq0_rd_en;
wire sii_mb1_ipdbdq0_rd_en;
wire sii_mb1_ipdohq1_rd_en;
wire sii_mb1_ipdbhq1_rd_en;
wire sii_mb1_ipdodq1_rd_en;
wire sii_mb1_ipdbdq1_rd_en;
wire [71:0] ipdohq0_dout;
wire [71:0] ipdbhq0_dout;
wire [71:0] ipdohq1_dout;
wire [71:0] ipdbhq1_dout;
wire ipcs_ipdohq0_wr_en;
wire ipcs_ipdbhq0_wr_en;
wire ipcs_ipdodq0_wr_en;
wire ipcs_ipdbdq0_wr_en;
wire [3:0] ipcs_ipdohq0_wr_addr;
wire [3:0] ipcs_ipdbhq0_wr_addr;
wire [5:0] ipcs_ipdodq0_wr_addr;
wire [5:0] ipcs_ipdbdq0_wr_addr;
wire [3:0] ipcs_ipdohq1_wr_addr;
wire [3:0] ipcs_ipdbhq1_wr_addr;
wire [5:0] ipcs_ipdodq1_wr_addr;
wire [5:0] ipcs_ipdbdq1_wr_addr;
wire ipcs_ipdohq1_wr_en;
wire ipcs_ipdbhq1_wr_en;
wire ipcs_ipdodq1_wr_en;
wire ipcs_ipdbdq1_wr_en;
wire ipcc_scanin;
wire dmu_mode0;
wire dmu_mode1;
wire sii_dmu_oqdq_unused;
wire sii_ext0_oqdq;
wire sii_dmu_bqdq_unused;
wire sii_ext0_bqdq;
wire sii_ext1_oqdq;
wire sii_ext1_bqdq;
wire ipcc_ipcs_or_go_lv0;
wire ipcc_ipcs_by_go_lv0;
wire ipcc_ipcs_or_go_lv1;
wire ipcc_ipcs_by_go_lv1;
wire [3:0] ipcc_ipcs_or_ptr0;
wire [3:0] ipcc_ipcs_by_ptr0;
wire [3:0] ipcc_ipcs_or_ptr1;
wire [3:0] ipcc_ipcs_by_ptr1;
wire [15:0] ipcs_ipcc_or_dep0;
wire [15:0] ipcs_ipcc_by_dep0;
wire [15:0] ipcs_ipcc_or_dep1;
wire [15:0] ipcs_ipcc_by_dep1;
wire ipcs_ipcc_add_or0;
wire ipcs_ipcc_add_by0;
wire ipcs_ipcc_add_or1;
wire ipcs_ipcc_add_by1;
wire ncu_sii_ctag_uei0;
wire ncu_sii_ctag_cei0;
wire ncu_sii_a_pei0;
wire ncu_sii_d_pei0;
wire ext0_sii_hdr_vld;
wire ext0_sii_reqbypass;
wire ext0_sii_datareq;
wire ext0_sii_datareq16;
wire [127:0] ext0_sii_data;
wire [15:0] ext0_sii_be;
wire [7:0] ext0_sii_parity;
wire ext0_sii_be_parity;
wire [3:0] sii_ext0_wrack_tag;
wire sii_ext0_wrack_vld;
wire ncu_sii_ctag_uei1;
wire ncu_sii_ctag_cei1;
wire ncu_sii_a_pei1;
wire ncu_sii_d_pei1;
wire ext1_sii_hdr_vld;
wire ext1_sii_reqbypass;
wire ext1_sii_datareq;
wire ext1_sii_datareq16;
wire [127:0] ext1_sii_data;
wire [15:0] ext1_sii_be;
wire [7:0] ext1_sii_parity;
wire ext1_sii_be_parity;
wire [71:0] ipdohq0_din;
wire [71:0] ipdbhq0_din;
wire [159:0] ipdodq0_din;
wire [159:0] ipdbdq0_din;
wire ipcs0_scanout;
wire iol2clk;
wire ipcs0_scanin;
wire sii_mb1_ipdodq0_wr_en;
wire sii_mb1_ipdbdq0_wr_en;
wire sii_mb1_ipdohq0_wr_en;
wire sii_mb1_ipdbhq0_wr_en;
wire [5:0] sii_mb1_wr_addr;
wire [7:0] sii_mb1_wdata;
wire [71:0] ipdohq1_din;
wire [71:0] ipdbhq1_din;
wire [159:0] ipdodq1_din;
wire [159:0] ipdbdq1_din;
wire ipcs1_scanout;
wire ipcs1_scanin;
wire sii_mb1_ipdodq1_wr_en;
wire sii_mb1_ipdbdq1_wr_en;
wire sii_mb1_ipdohq1_wr_en;
wire sii_mb1_ipdbhq1_wr_en;
wire ipdodq0_h_scanin;
wire ipdodq0_h_scanout;
wire ipdodq0_l_scanin;
wire ipdodq0_l_scanout;
wire ipdbdq0_h_scanin;
wire ipdbdq0_h_scanout;
wire ipdbdq0_l_scanin;
wire ipdbdq0_l_scanout;
wire ipdohq0_scanin;
wire ipdohq0_scanout;
wire ipdbhq0_scanin;
wire ipdbhq0_scanout;
wire [77:0] sii_mb1_read_data;
wire ipcc_dp_scanout;
wire ipcc_dp_scanin;
wire mb0_scanout;
wire mb0_scanin;
wire mb1_scanout;
wire mb1_scanin;
wire clkgen_sii_cmp_scanout;
wire cmpclkgen_aclk_wmr_unused;
wire cmpclkgen_wmr_protect_unused;
wire cmpclkgen_wmr_unused;
wire cmpclkgen_por_unused;
wire clkgen_sii_cmp_scanin;
wire ioclkgen_aclk_unused;
wire ioclkgen_bclk_unused;
wire clkgen_sii_io_scanout;
wire ioclkgen_aclk_wmr_unused;
wire ioclkgen_pce_ov_unused;
wire ioclkgen_wmr_protect_unused;
wire ioclkgen_wmr_unused;
wire ioclkgen_por_unused;
wire ioclkgen_cmp_slow_sync_en_unused;
wire ioclkgen_slow_cmp_sync_en_unused;
wire clkgen_sii_io_scanin;
wire stgsio_dp_scanout;
wire stgsio_dp_scanin;
wire ipdodq1_h_scanin;
wire ipdodq1_h_scanout;
wire ipdodq1_l_scanin;
wire ipdodq1_l_scanout;
wire ipdbdq1_h_scanin;
wire ipdbdq1_h_scanout;
wire ipdbdq1_l_scanin;
wire ipdbdq1_l_scanout;
wire ipdohq1_scanin;
wire ipdohq1_scanout;
wire ipdbhq1_scanin;
wire ipdbhq1_scanout;


   input	 gclk;                  // cmp clock
   input	 ccu_io_out;
   input 	 scan_in;
   input 	 tcu_dbr_gateoff;
//   input 	 tcu_wr_inhibit;
   input 	 tcu_atpg_mode;
   input 	 tcu_pce_ov_in;		// scan signals
   input 	 tcu_aclk;
   input 	 tcu_bclk;
   input         tcu_scan_en;	 
   input         tcu_muxtest;	 
   input         tcu_dectest;	 
   input	 tcu_sii_data;
   input	 tcu_sii_vld;
   input	 cluster_arst_l;
   input	 tcu_div_bypass;
   input         tcu_array_wr_inhibit;
   input         tcu_se_scancollar_in;
   input         tcu_se_scancollar_out;
   input	 tcu_sii_clk_stop;
   input	 tcu_sii_io_clk_stop;
   input	 tcu_mbist_bisi_en;
   input	 tcu_mbist_user_mode;
   input  [1:0]	 tcu_sii_mbist_start;
   input	 tcu_sii_mbist_scan_in;
   output [1:0]  sii_tcu_mbist_done;
   output [1:0]  sii_tcu_mbist_fail;
   output        sii_tcu_mbist_scan_out;
   output 	 scan_out;
   
   
   input 	 ccu_io_cmp_sync_en; // active high - ok to cross from IO to CMP clock domain
   input 	 ccu_cmp_io_sync_en; // active high - ok to cross from CMP to IO clock domain
   
   // ================== L2_0 =================
   input 	 l2t0_sii_iq_dequeue;  // PINDEF:TOP  // L2Tag freed a input queue request entry    
   input 	 l2t0_sii_wib_dequeue; // PINDEF:TOP  // L2Tag freed a Write Invalidate Buffer Entry
   output 	 sii_l2t0_req_vld;     // PINDEF:TOP  // Packet valid from SII to L2T
   output [31:0] sii_l2t0_req;	       // PINDEF:TOP  // Packet from SII to L2T
   output [6:0]  sii_l2b0_ecc;	       // PINDEF:TOP  // ECC from SII to L2B
   output [1:0]  sii_dbg1_l2t0_req;	       // debug signal encode the request type
   // ================== L2_0 =================
   
   
   // ================== L2_1 =================
   input 	 l2t1_sii_iq_dequeue;  // PINDEF:TOP  // L2Tag freed a input queue request entry    
   input 	 l2t1_sii_wib_dequeue; // PINDEF:TOP  // L2Tag freed a Write Invalidate Buffer Entry
   output 	 sii_l2t1_req_vld;     // PINDEF:TOP  // Packet valid from SII to L2T               
   output [31:0] sii_l2t1_req;	       // PINDEF:TOP  // Packet from SII to L2T                     
   output [6:0]  sii_l2b1_ecc;	       // PINDEF:TOP  // ECC from SII to L2B                        
   output [1:0]  sii_dbg1_l2t1_req;	       // debug signal encode the request type
   // ================== L2_1 =================
   
   // ================== L2_2 =================
   input 	 l2t2_sii_iq_dequeue;  // PINDEF:TOP  // L2Tag freed a input queue request entry    
   input 	 l2t2_sii_wib_dequeue; // PINDEF:TOP  // L2Tag freed a Write Invalidate Buffer Entry
   output 	 sii_l2t2_req_vld;     // PINDEF:TOP  // Packet valid from SII to L2T               
   output [31:0] sii_l2t2_req;	       // PINDEF:TOP  // Packet from SII to L2T                     
   output [6:0]  sii_l2b2_ecc;	       // PINDEF:TOP  // ECC from SII to L2B                        
   output [1:0]  sii_dbg1_l2t2_req;	       // debug signal encode the request type
   // ================== L2_2 =================
   
   // ================== L2_3 =================
   input 	 l2t3_sii_iq_dequeue;  // PINDEF:TOP  // L2Tag freed a input queue request entry   
   input 	 l2t3_sii_wib_dequeue; // PINDEF:TOP  // L2Tag freed a Write Invalidate Buffer Entry 
   output 	 sii_l2t3_req_vld;     // PINDEF:TOP  // Packet valid from SII to L2T                
   output [31:0] sii_l2t3_req;	       // PINDEF:TOP  // Packet from SII to L2T                      
   output [6:0]  sii_l2b3_ecc;	       // PINDEF:TOP  // ECC from SII to L2B                         
   output [1:0]  sii_dbg1_l2t3_req;	       // debug signal encode the request type
   // ================== L2_3 =================
   
   // ================== L2_4 =================
   input 	 l2t4_sii_iq_dequeue;  // PINDEF:BOT  // L2Tag freed a input queue request entry 
   input 	 l2t4_sii_wib_dequeue; // PINDEF:BOT  // L2Tag freed a Write Invalidate Buffer Entry 
   output 	 sii_l2t4_req_vld;     // PINDEF:BOT  // Packet valid from SII to L2T                
   output [31:0] sii_l2t4_req;	       // PINDEF:BOT  // Packet from SII to L2T                      
   output [6:0]  sii_l2b4_ecc;	       // PINDEF:BOT  // ECC from SII to L2B                         
   output [1:0]  sii_dbg1_l2t4_req;	       // debug signal encode the request type
   // ================== L2_4 =================
   
   // ================== L2_5 =================
   input 	 l2t5_sii_iq_dequeue;  // PINDEF:BOT  // L2Tag freed a input queue request entry    
   input 	 l2t5_sii_wib_dequeue; // PINDEF:BOT  // L2Tag freed a Write Invalidate Buffer Entry 
   output 	 sii_l2t5_req_vld;     // PINDEF:BOT  // Packet valid from SII to L2T                
   output [31:0] sii_l2t5_req;	       // PINDEF:BOT  // Packet from SII to L2T                      
   output [6:0]  sii_l2b5_ecc;	       // PINDEF:BOT  // ECC from SII to L2B                         
   output [1:0]  sii_dbg1_l2t5_req;	       // debug signal encode the request type
   // ================== L2_5 =================
   
   // ================== L2_6 =================
   input 	 l2t6_sii_iq_dequeue;  // PINDEF:BOT  // L2Tag freed a input queue request entry    
   input 	 l2t6_sii_wib_dequeue; // PINDEF:BOT  // L2Tag freed a Write Invalidate Buffer Entry 
   output 	 sii_l2t6_req_vld;     // PINDEF:BOT  // Packet valid from SII to L2T                
   output [31:0] sii_l2t6_req;	       // PINDEF:BOT  // Packet from SII to L2T                      
   output [6:0]  sii_l2b6_ecc;	       // PINDEF:BOT  // ECC from SII to L2B                         
   output [1:0]  sii_dbg1_l2t6_req;	       // debug signal encode the request type
   // ================== L2_6 =================
   
   // ================== L2_7 =================
   input 	 l2t7_sii_iq_dequeue;  // PINDEF:BOT  // L2Tag freed a input queue request entry
   input 	 l2t7_sii_wib_dequeue; // PINDEF:BOT  // L2Tag freed a Write Invalidate Buffer Entry 
   output 	 sii_l2t7_req_vld;     // PINDEF:BOT  // Packet valid from SII to L2T                
   output [31:0] sii_l2t7_req;	       // PINDEF:BOT  // Packet from SII to L2T                      
   output [6:0]  sii_l2b7_ecc;	       // PINDEF:BOT  // ECC from SII to L2B                         
   output [1:0]  sii_dbg1_l2t7_req;	       // debug signal encode the request type
   // ================== L2_7 =================
   
   
   
   // ================== NCU  =================
   input	ncu_sii_niuctag_uei;	// niu ctag uncorrectable error injection 
   input	ncu_sii_niuctag_cei;	// niu ctag correctable error injection
   input	ncu_sii_niua_pei;	// niu address prarity error injection
   input	ncu_sii_niud_pei;	// niu data parity error injection
   input	ncu_sii_dmuctag_uei;	
   input	ncu_sii_dmuctag_cei ;    
   input	ncu_sii_dmua_pei;	
   input	ncu_sii_dmud_pei;

   input 	ncu_sii_gnt;	// PINDEF:LEFT	// Ok to send packet from SII to NCU
   input 	ncu_sii_pm;	// PINDEF:LEFT	// partial mode 
   input 	ncu_sii_ba01;	// PINDEF:LEFT	// partial mode 
   input 	ncu_sii_ba23;	// PINDEF:LEFT	// partial mode 
   input 	ncu_sii_ba45;	// PINDEF:LEFT	// partial mode 
   input 	ncu_sii_ba67;	// PINDEF:LEFT	// partial mode
   input        ncu_sii_l2_idx_hash_en;        // index hashing mode, by default it is 1 	 

   output  	sii_ncu_niuctag_ue;
   output  	sii_ncu_niuctag_ce;
   output  	sii_ncu_niua_pe;
   output  	sii_ncu_niud_pe;
   output  	sii_ncu_dmuctag_ue;
   output  	sii_ncu_dmuctag_ce;
   output  	sii_ncu_dmua_pe;
   output  	sii_ncu_dmud_pe;
   output [3:0]	sii_ncu_syn_data;
   output 	sii_ncu_syn_vld;

   output [1:0]	sii_ncu_dparity;     
   output [31:0] sii_ncu_data;	// PINDEF:LEFT	// Packet (PIO Rd data return/Mondo data) to NCU
   output 	 sii_ncu_req;	// PINDEF:LEFT	// SII requesting to send packet to NCU


   // ================== NCU  =================
 
 
   // ================== NIU  =================
   input 	 niu_sii_hdr_vld;   // PINDEF:BOT  // Ethernet requesting to send packet to SII
   input 	 niu_sii_reqbypass; // PINDEF:BOT  // Ethernet requesting to send packet to bypass queue of SII
   input 	 niu_sii_datareq;   // PINDEF:BOT  // Ethernet requesting to send packet w/data to SII
   input [127:0] niu_sii_data;	    // PINDEF:BOT  // Packet from Ethernet to SII
   input [7:0] 	 niu_sii_parity;    // PINDEF:BOT  // Packet parity from Ethernet to SII
   output 	 sii_niu_oqdq;      // PINDEF:BOT  // Asserted when SII dqs an NIU entry from Ordered Queue
   output 	 sii_niu_bqdq;      // PINDEF:BOT  // Asserted when SII dqs an NIU entry from Bypass Queue 		
   // ================== NIU  =================
   
 
   // ================== DMU  =================
   input 	 dmu_sii_hdr_vld;   // PINDEF:BOT  // DMU requesting to send packet to SII
   input 	 dmu_sii_reqbypass; // PINDEF:BOT  // DMU requesting to send packet to bypass queue of SII
   input 	 dmu_sii_datareq;   // PINDEF:BOT  // DMU requesting to send packet w/data to SII
   input 	 dmu_sii_datareq16; // PINDEF:BOT  // DMU requesting to send packet w/16B only
   input [127:0] dmu_sii_data;	    // PINDEF:BOT  // Packet from DMU to SII
   input [7:0] 	 dmu_sii_parity;    // PINDEF:BOT  // Packet parity from DMU to SII
   input  	 dmu_sii_be_parity;    // PINDEF:BOT  // Packet parity from DMU to SII
   input [15:0]  dmu_sii_be;	    // PINDEF:BOT  // Packet byte enables from DMU to SII
   output        sii_dmu_wrack_vld;
   output[3:0]   sii_dmu_wrack_tag;
   output	 sii_dmu_wrack_parity;
	 
   // 		
   
   // ================== DMU  =================

   // ================= SII IN <-> SII OUT ====
   input 	 sio_sii_opcc_ipcc_niu_by_deq;  // PINDEF:RIGHT
   input [3:0] 	 sio_sii_opcc_ipcc_niu_by_cnt;  // PINDEF:RIGHT
   input 	 sio_sii_opcc_ipcc_niu_or_deq;  // PINDEF:RIGHT
				        
   input 	 sio_sii_opcc_ipcc_dmu_by_deq;  // PINDEF:RIGHT
   input [3:0] 	 sio_sii_opcc_ipcc_dmu_by_cnt;  // PINDEF:RIGHT
   input 	 sio_sii_opcc_ipcc_dmu_or_deq;  // PINDEF:RIGHT

   input         sio_sii_olc0_ilc0_dequeue; // PINDEF:LEFT // SIO L2 Ctl 0 deq'd a read entry
   input         sio_sii_olc1_ilc1_dequeue; // PINDEF:LEFT // SIO L2 Ctl 1 deq'd a read entry
   input         sio_sii_olc2_ilc2_dequeue; // PINDEF:LEFT // SIO L2 Ctl 2 deq'd a read entry
   input         sio_sii_olc3_ilc3_dequeue; // PINDEF:LEFT // SIO L2 Ctl 3 deq'd a read entry
   input         sio_sii_olc4_ilc4_dequeue; // PINDEF:LEFT // SIO L2 Ctl 4 deq'd a read entry
   input         sio_sii_olc5_ilc5_dequeue; // PINDEF:LEFT // SIO L2 Ctl 5 deq'd a read entry
   input         sio_sii_olc6_ilc6_dequeue; // PINDEF:LEFT // SIO L2 Ctl 6 deq'd a read entry
   input         sio_sii_olc7_ilc7_dequeue; // PINDEF:LEFT // SIO L2 Ctl 7 deq'd a read entry
  

       // ================= unused net =====================

   assign 	indq_inc_dout_unused[3:0] = indq_inc_dout[71:68];
   assign 	ipdodq0_dout_unused[6:0] = ipdodq0_dout[159:153];
   assign 	ipdbdq0_dout_unused[6:0] = ipdbdq0_dout[159:153];
   assign 	ipdodq1_dout_unused[6:0] = ipdodq1_dout[159:153];
   assign 	ipdbdq1_dout_unused[6:0] = ipdbdq1_dout[159:153];

       // ================= SII IN <-> SII OUT ====

   assign  	sii_dmu_wrack_parity = sii_ext0_wrack_parity; 
   assign  	sii_niu_wrack_parity_unused = sii_ext1_wrack_parity; 

   // WIRING TO SICLK, SOCLK, PCE_OV
   

   // Tied to zero for NIU unused signals
   assign 	 niu_sii_datareq16                   = 1'b0;
   assign 	 niu_sii_be[15:0]                    = 16'h0000;
   assign 	 niu_sii_be_parity                   = 1'b0;
   assign        sii_ext1_wrack_tag_unused[3:0]      = sii_ext1_wrack_tag[3:0];
   assign        sii_ext1_wrack_vld_unused           = sii_ext1_wrack_vld;

   
   // From IPCC_DP to IPCC
   
   assign	ipcc_ind_data[71:0] = {4'b0000, ipcc_data_all3[81:78], ipcc_data_all3[63:0]};
   assign 	ipcc_data_all_0[89:0] = ipcc_data_all0[89:0] ;
   assign 	ipcc_data_all_1[89:0] = ipcc_data_all0[89:0] ;
   assign 	ipcc_data_all_2[89:0] = ipcc_data_all0[89:0] ;
   assign 	ipcc_data_all_4[89:0] = ipcc_data_all1[89:0] ;
   assign 	ipcc_data_all_5[89:0] = ipcc_data_all1[89:0] ;
   assign 	ipcc_data_all_6[89:0] = ipcc_data_all2[89:0] ;
   assign 	ipcc_data_all_7[89:0] = ipcc_data_all2[89:0] ;
   assign 	ipcc_data_all_3[89:0] = ipcc_data_all2[89:0] ;
   assign       ipcc_data_all_0c[89:0] = ipcc_data_all3[89:0] ;
   assign       ipcc_data_all_1c[89:0] = ipcc_data_all3[89:0] ;
   assign       ipcc_data_all_2c[89:0] = ipcc_data_all3[89:0] ;
   assign       ipcc_data_all_3c[89:0] = ipcc_data_all2[89:0] ;
   assign       ipcc_data_all_4c[89:0] = ipcc_data_all1[89:0] ;
   assign       ipcc_data_all_5c[89:0] = ipcc_data_all1[89:0] ;
   assign       ipcc_data_all_6c[89:0] = ipcc_data_all2[89:0] ;
   assign       ipcc_data_all_7c[89:0] = ipcc_data_all2[89:0] ;

   //    // ================= assing to zero for mbist ====

   assign          tcu_sii_mb0_start		= tcu_sii_mbist_start[0];
   assign          sii_mb0_bisi_mode		= tcu_mbist_bisi_en;
   assign          sii_tcu_mbist_fail[0]	= sii_mb0_fail;
   assign          sii_tcu_mbist_done[0]	= sii_mb0_done;

   assign          tcu_sii_mb1_start		= tcu_sii_mbist_start[1];
   assign          sii_mb1_bisi_mode		= tcu_mbist_bisi_en;
   assign          sii_tcu_mbist_fail[1]	= sii_mb1_fail;
   assign          sii_tcu_mbist_done[1]	= sii_mb1_done;


       // ================= CLK TCU net =====================
//   assign   	   tcu_div_bypass		= 1'b0;         // bypasses clk divider to mux in ext clk
   assign 	   tcu_pce_ov = pce_ov;
   assign   	   cluster_div_en		= 1'b0;         // if enabled, l2clk is divided down
   assign	   ccu_slow_cmp_sync_en		= ccu_io_cmp_sync_en;
   assign	   ccu_cmp_slow_sync_en		= ccu_cmp_io_sync_en;

   assign   	   rst_wmr_protect		= 1'b0;         // if enabled, l2clk is divided down
   assign   	   rst_wmr_			= 1'b0;         // if enabled, l2clk is divided down
   assign   	   rst_por_			= 1'b0;         // if enabled, l2clk is divided down

   assign   	   clk_ext			= 1'b0;         // if enabled, l2clk is divided down

   assign   	   ccu_soc4cmp_clk_stop		= 1'b0;         // if enabled, l2clk is divided down
   assign   	   ccu_soc6io_clk_stop		= 1'b0;         // if enabled, l2clk is divided down
//   assign   	   cluster_arst_l		= 1'b0;         // if enabled, l2clk is divided down
   assign   	   ccu_serdes_dtm		= 1'b0;         // if enabled, l2clk is divided down

   assign	   rd_pce			= 1'b1;
   assign	   wr_pce			= 1'b1;
   assign	   bist_clk_mux_sel		= sii_mb1_run;
   assign	   tie_low		        = 1'b0;

   assign	   tcu_wr_inhibit		= tcu_array_wr_inhibit;

   
// ========= Inbound L2 bank 0 ========
   n2_com_dp_32x82_cust      ildq0 (/*AUTOINST*/
				    // Outputs
				    .dout(ildq_ild_dout0[`SII_ILD_RF_DATAWIDTH - 1:0]), // Templated
				    .scan_out(ildq0_scanout),	 // Templated
				    // Inputs
				    .wr_adr(ipcc_ildq_wr_addr0_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				    .wr_en(ipcc_ildq_wr_en0_m),	 // Templated
				    .rd_adr(ilc_ildq_rd_addr0_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				    .rd_en(ilc_ildq_rd_en0_m),	 // Templated
				    .din(ipcc_data_all_0[`SII_ILD_RF_DATAWIDTH - 1:0] ), // Templated
				    .rdclk(l2clk),		 // Templated
				    .wrclk(l2clk),		 // Templated
				    .scan_in(ildq0_scanin),	 // Templated
				    .tcu_pce_ov(tcu_pce_ov),
				    .tcu_aclk(aclk),		 // Templated
				    .tcu_bclk(bclk),		 // Templated
				    .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				    .tcu_se_scancollar_in(tcu_se_scancollar_in),
				    .tcu_se_scancollar_out(tcu_se_scancollar_out),
				    .bist_clk_mux_sel(tie_low),	 // Templated
				    .rd_pce(rd_pce),
				    .wr_pce(wr_pce));

   sii_ild_dp           ild0   (/*AUTOINST*/
				// Outputs
				.sii_l2t_req(sii_l2t0_req[31:0]), // Templated
				.sii_l2b_ecc(sii_l2b0_ecc[6:0]), // Templated
				.ild_ilc_curhdr(ild_ilc_curhdr0[63:0]), // Templated
				.scan_out(ild0_scanout),	 // Templated
				.sii_mb0_ild_fail(sii_mb0_ild0_fail[1:0]), // Templated
				// Inputs
				.ilc_ild_de_sel(ilc_ild_de_sel0[1:0]), // Templated
				.ilc_ild_ldhdr(ilc_ild_ldhdr0[3:0]), // Templated
				.ilc_ild_addr_h(ilc_ild_addr_h0[3:0]), // Templated
				.ilc_ild_addr_lo(ilc_ild_addr_lo0[3:0]), // Templated
				.ilc_ild_hdr_sel(ilc_ild_hdr_sel0[1:0]), // Templated
				.ilc_ild_cyc_sel(ilc_ild_cyc_sel0[1:0]), // Templated
				.ilc_ild_newhdr(ilc_ild_newhdr0[63:0]), // Templated
				.ildq_ild_dout(ildq_ild_dout0[`SII_ILD_RF_DATAWIDTH - 1:0]), // Templated
				.ipcc_data_out(ipcc_data_all_0[69:0]), // Templated
				.l2clk	(l2clk),
				.scan_in(ild0_scanin),		 // Templated
				.tcu_scan_en(tcu_scan_en),
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop), // Templated
				.sii_mb0_wdata(sii_mb0_wdata[7:0]));
 
   sii_ilc_ctl          ilc0   (/*AUTOINST*/
				// Outputs
				.sii_l2t_req_vld(sii_l2t0_req_vld), // Templated
				.sii_dbg_l2t_req(sii_dbg1_l2t0_req[1:0]), // Templated
				.ilc_ipcc_stop(ilc_ipcc_stop0),	 // Templated
				.ilc_ipcc_dmu_wrm_dq(ilc_ipcc_dmu_wrm_dq0), // Templated
				.ilc_ipcc_niu_wrm_dq(ilc_ipcc_niu_wrm_dq0), // Templated
				.ilc_ipcc_dmu_wrm(ilc_ipcc_dmu_wrm0), // Templated
				.ilc_ipcc_niu_wrm(ilc_ipcc_niu_wrm0), // Templated
				.ilc_ild_de_sel(ilc_ild_de_sel0[1:0]), // Templated
				.ilc_ild_hdr_sel(ilc_ild_hdr_sel0[1:0]), // Templated
				.ilc_ild_cyc_sel(ilc_ild_cyc_sel0[1:0]), // Templated
				.ilc_ild_newhdr(ilc_ild_newhdr0[63:0]), // Templated
				.ilc_ild_ldhdr(ilc_ild_ldhdr0[3:0]), // Templated
				.ilc_ild_addr_h(ilc_ild_addr_h0[3:0]), // Templated
				.ilc_ild_addr_lo(ilc_ild_addr_lo0[3:0]), // Templated
				.ilc_ildq_rd_addr_m(ilc_ildq_rd_addr0_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				.ilc_ildq_rd_en_m(ilc_ildq_rd_en0_m), // Templated
				.scan_out(ilc0_scanout),	 // Templated
				// Inputs
				.l2t_sii_iq_dequeue(l2t0_sii_iq_dequeue), // Templated
				.l2t_sii_wib_dequeue(l2t0_sii_wib_dequeue), // Templated
				.sio_sii_olc_ilc_dequeue_r(sio_sii_olc0_ilc0_dequeue_r), // Templated
				.ipcc_data_58_56({ipcc_data_all_0c[63], ipcc_data_all_0c[59:56]}), // Templated
				.ipcc_ildq_wr_addr(ipcc_ildq_wr_addr0[`SII_ILD_RF_ADDRWIDTH - 1:0]), // Templated
				.ipcc_ildq_wr_en(ipcc_ildq_wr_en0), // Templated
				.ipcc_ilc_be(ipcc_data_all_0c[89:82]), // Templated
				.ipcc_ilc_cmd(ipcc_ilc_cmd0),	 // Templated
				.ild_ilc_curhdr(ild_ilc_curhdr0[63:0]), // Templated
				.sii_mb0_run(sii_mb0_run),
				.sii_mb0_rd_en(sii_mb0_rd_en),
				.sii_mb0_addr(sii_mb0_addr[4:0]),
				.l2clk	(l2clk),		 // Templated
				.scan_in(ilc0_scanin),		 // Templated
				.tcu_scan_en(tcu_scan_en),
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated
 

// ========= Inbound L2 bank 0 ========


// ========= Inbound L2 bank 1 ========
   n2_com_dp_32x82_cust      ildq1 (/*AUTOINST*/
				    // Outputs
				    .dout(ildq_ild_dout1[`SII_ILD_RF_DATAWIDTH - 1:0]), // Templated
				    .scan_out(ildq1_scanout),	 // Templated
				    // Inputs
				    .wr_adr(ipcc_ildq_wr_addr1_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				    .wr_en(ipcc_ildq_wr_en1_m),	 // Templated
				    .rd_adr(ilc_ildq_rd_addr1_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				    .rd_en(ilc_ildq_rd_en1_m),	 // Templated
				    .din(ipcc_data_all_1[`SII_ILD_RF_DATAWIDTH - 1:0] ), // Templated
				    .rdclk(l2clk),		 // Templated
				    .wrclk(l2clk),		 // Templated
				    .scan_in(ildq1_scanin),	 // Templated
				    .tcu_pce_ov(tcu_pce_ov),
				    .tcu_aclk(aclk),		 // Templated
				    .tcu_bclk(bclk),		 // Templated
				    .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				    .tcu_se_scancollar_in(tcu_se_scancollar_in),
				    .tcu_se_scancollar_out(tcu_se_scancollar_out),
				    .bist_clk_mux_sel(tie_low),	 // Templated
				    .rd_pce(rd_pce),
				    .wr_pce(wr_pce));

   sii_ild_dp           ild1   (/*AUTOINST*/
				// Outputs
				.sii_l2t_req(sii_l2t1_req[31:0]), // Templated
				.sii_l2b_ecc(sii_l2b1_ecc[6:0]), // Templated
				.ild_ilc_curhdr(ild_ilc_curhdr1[63:0]), // Templated
				.scan_out(ild1_scanout),	 // Templated
				.sii_mb0_ild_fail(sii_mb0_ild1_fail[1:0]), // Templated
				// Inputs
				.ilc_ild_de_sel(ilc_ild_de_sel1[1:0]), // Templated
				.ilc_ild_ldhdr(ilc_ild_ldhdr1[3:0]), // Templated
				.ilc_ild_addr_h(ilc_ild_addr_h1[3:0]), // Templated
				.ilc_ild_addr_lo(ilc_ild_addr_lo1[3:0]), // Templated
				.ilc_ild_hdr_sel(ilc_ild_hdr_sel1[1:0]), // Templated
				.ilc_ild_cyc_sel(ilc_ild_cyc_sel1[1:0]), // Templated
				.ilc_ild_newhdr(ilc_ild_newhdr1[63:0]), // Templated
				.ildq_ild_dout(ildq_ild_dout1[`SII_ILD_RF_DATAWIDTH - 1:0]), // Templated
				.ipcc_data_out(ipcc_data_all_1[69:0]), // Templated
				.l2clk	(l2clk),
				.scan_in(ild1_scanin),		 // Templated
				.tcu_scan_en(tcu_scan_en),
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop), // Templated
				.sii_mb0_wdata(sii_mb0_wdata[7:0]));
 
   sii_ilc_ctl          ilc1   (/*AUTOINST*/
				// Outputs
				.sii_l2t_req_vld(sii_l2t1_req_vld), // Templated
				.sii_dbg_l2t_req(sii_dbg1_l2t1_req[1:0]), // Templated
				.ilc_ipcc_stop(ilc_ipcc_stop1),	 // Templated
				.ilc_ipcc_dmu_wrm_dq(ilc_ipcc_dmu_wrm_dq1), // Templated
				.ilc_ipcc_niu_wrm_dq(ilc_ipcc_niu_wrm_dq1), // Templated
				.ilc_ipcc_dmu_wrm(ilc_ipcc_dmu_wrm1), // Templated
				.ilc_ipcc_niu_wrm(ilc_ipcc_niu_wrm1), // Templated
				.ilc_ild_de_sel(ilc_ild_de_sel1[1:0]), // Templated
				.ilc_ild_hdr_sel(ilc_ild_hdr_sel1[1:0]), // Templated
				.ilc_ild_cyc_sel(ilc_ild_cyc_sel1[1:0]), // Templated
				.ilc_ild_newhdr(ilc_ild_newhdr1[63:0]), // Templated
				.ilc_ild_ldhdr(ilc_ild_ldhdr1[3:0]), // Templated
				.ilc_ild_addr_h(ilc_ild_addr_h1[3:0]), // Templated
				.ilc_ild_addr_lo(ilc_ild_addr_lo1[3:0]), // Templated
				.ilc_ildq_rd_addr_m(ilc_ildq_rd_addr1_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				.ilc_ildq_rd_en_m(ilc_ildq_rd_en1_m), // Templated
				.scan_out(ilc1_scanout),	 // Templated
				// Inputs
				.l2t_sii_iq_dequeue(l2t1_sii_iq_dequeue), // Templated
				.l2t_sii_wib_dequeue(l2t1_sii_wib_dequeue), // Templated
				.sio_sii_olc_ilc_dequeue_r(sio_sii_olc1_ilc1_dequeue_r), // Templated
				.ipcc_data_58_56({ipcc_data_all_1c[63], ipcc_data_all_1c[59:56]}), // Templated
				.ipcc_ildq_wr_addr(ipcc_ildq_wr_addr1[`SII_ILD_RF_ADDRWIDTH - 1:0]), // Templated
				.ipcc_ildq_wr_en(ipcc_ildq_wr_en1), // Templated
				.ipcc_ilc_be(ipcc_data_all_1c[89:82]), // Templated
				.ipcc_ilc_cmd(ipcc_ilc_cmd1),	 // Templated
				.ild_ilc_curhdr(ild_ilc_curhdr1[63:0]), // Templated
				.sii_mb0_run(sii_mb0_run),
				.sii_mb0_rd_en(sii_mb0_rd_en),
				.sii_mb0_addr(sii_mb0_addr[4:0]),
				.l2clk	(l2clk),		 // Templated
				.scan_in(ilc1_scanin),		 // Templated
				.tcu_scan_en(tcu_scan_en),
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated
 


// ========= Inbound L2 bank 1 ========


// ========= Inbound L2 bank 2 ========
   n2_com_dp_32x82_cust      ildq2 (/*AUTOINST*/
				    // Outputs
				    .dout(ildq_ild_dout2[`SII_ILD_RF_DATAWIDTH - 1:0]), // Templated
				    .scan_out(ildq2_scanout),	 // Templated
				    // Inputs
				    .wr_adr(ipcc_ildq_wr_addr2_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				    .wr_en(ipcc_ildq_wr_en2_m),	 // Templated
				    .rd_adr(ilc_ildq_rd_addr2_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				    .rd_en(ilc_ildq_rd_en2_m),	 // Templated
				    .din(ipcc_data_all_2[`SII_ILD_RF_DATAWIDTH - 1:0] ), // Templated
				    .rdclk(l2clk),		 // Templated
				    .wrclk(l2clk),		 // Templated
				    .scan_in(ildq2_scanin),	 // Templated
				    .tcu_pce_ov(tcu_pce_ov),
				    .tcu_aclk(aclk),		 // Templated
				    .tcu_bclk(bclk),		 // Templated
				    .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				    .tcu_se_scancollar_in(tcu_se_scancollar_in),
				    .tcu_se_scancollar_out(tcu_se_scancollar_out),
				    .bist_clk_mux_sel(tie_low),	 // Templated
				    .rd_pce(rd_pce),
				    .wr_pce(wr_pce));

   sii_ild_dp           ild2   (/*AUTOINST*/
				// Outputs
				.sii_l2t_req(sii_l2t2_req[31:0]), // Templated
				.sii_l2b_ecc(sii_l2b2_ecc[6:0]), // Templated
				.ild_ilc_curhdr(ild_ilc_curhdr2[63:0]), // Templated
				.scan_out(ild2_scanout),	 // Templated
				.sii_mb0_ild_fail(sii_mb0_ild2_fail[1:0]), // Templated
				// Inputs
				.ilc_ild_de_sel(ilc_ild_de_sel2[1:0]), // Templated
				.ilc_ild_ldhdr(ilc_ild_ldhdr2[3:0]), // Templated
				.ilc_ild_addr_h(ilc_ild_addr_h2[3:0]), // Templated
				.ilc_ild_addr_lo(ilc_ild_addr_lo2[3:0]), // Templated
				.ilc_ild_hdr_sel(ilc_ild_hdr_sel2[1:0]), // Templated
				.ilc_ild_cyc_sel(ilc_ild_cyc_sel2[1:0]), // Templated
				.ilc_ild_newhdr(ilc_ild_newhdr2[63:0]), // Templated
				.ildq_ild_dout(ildq_ild_dout2[`SII_ILD_RF_DATAWIDTH - 1:0]), // Templated
				.ipcc_data_out(ipcc_data_all_2[69:0]), // Templated
				.l2clk	(l2clk),
				.scan_in(ild2_scanin),		 // Templated
				.tcu_scan_en(tcu_scan_en),
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop), // Templated
				.sii_mb0_wdata(sii_mb0_wdata[7:0]));
 
   sii_ilc_ctl          ilc2   (/*AUTOINST*/
				// Outputs
				.sii_l2t_req_vld(sii_l2t2_req_vld), // Templated
				.sii_dbg_l2t_req(sii_dbg1_l2t2_req[1:0]), // Templated
				.ilc_ipcc_stop(ilc_ipcc_stop2),	 // Templated
				.ilc_ipcc_dmu_wrm_dq(ilc_ipcc_dmu_wrm_dq2), // Templated
				.ilc_ipcc_niu_wrm_dq(ilc_ipcc_niu_wrm_dq2), // Templated
				.ilc_ipcc_dmu_wrm(ilc_ipcc_dmu_wrm2), // Templated
				.ilc_ipcc_niu_wrm(ilc_ipcc_niu_wrm2), // Templated
				.ilc_ild_de_sel(ilc_ild_de_sel2[1:0]), // Templated
				.ilc_ild_hdr_sel(ilc_ild_hdr_sel2[1:0]), // Templated
				.ilc_ild_cyc_sel(ilc_ild_cyc_sel2[1:0]), // Templated
				.ilc_ild_newhdr(ilc_ild_newhdr2[63:0]), // Templated
				.ilc_ild_ldhdr(ilc_ild_ldhdr2[3:0]), // Templated
				.ilc_ild_addr_h(ilc_ild_addr_h2[3:0]), // Templated
				.ilc_ild_addr_lo(ilc_ild_addr_lo2[3:0]), // Templated
				.ilc_ildq_rd_addr_m(ilc_ildq_rd_addr2_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				.ilc_ildq_rd_en_m(ilc_ildq_rd_en2_m), // Templated
				.scan_out(ilc2_scanout),	 // Templated
				// Inputs
				.l2t_sii_iq_dequeue(l2t2_sii_iq_dequeue), // Templated
				.l2t_sii_wib_dequeue(l2t2_sii_wib_dequeue), // Templated
				.sio_sii_olc_ilc_dequeue_r(sio_sii_olc2_ilc2_dequeue_r), // Templated
				.ipcc_data_58_56({ipcc_data_all_2c[63], ipcc_data_all_2c[59:56]}), // Templated
				.ipcc_ildq_wr_addr(ipcc_ildq_wr_addr2[`SII_ILD_RF_ADDRWIDTH - 1:0]), // Templated
				.ipcc_ildq_wr_en(ipcc_ildq_wr_en2), // Templated
				.ipcc_ilc_be(ipcc_data_all_2c[89:82]), // Templated
				.ipcc_ilc_cmd(ipcc_ilc_cmd2),	 // Templated
				.ild_ilc_curhdr(ild_ilc_curhdr2[63:0]), // Templated
				.sii_mb0_run(sii_mb0_run),
				.sii_mb0_rd_en(sii_mb0_rd_en),
				.sii_mb0_addr(sii_mb0_addr[4:0]),
				.l2clk	(l2clk),		 // Templated
				.scan_in(ilc2_scanin),		 // Templated
				.tcu_scan_en(tcu_scan_en),
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated
 

// ========= Inbound L2 bank 2 ========


// ========= Inbound L2 bank 3 ========
   n2_com_dp_32x82_cust      ildq3 (/*AUTOINST*/
				    // Outputs
				    .dout(ildq_ild_dout3[`SII_ILD_RF_DATAWIDTH - 1:0]), // Templated
				    .scan_out(ildq3_scanout),	 // Templated
				    // Inputs
				    .wr_adr(ipcc_ildq_wr_addr3_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				    .wr_en(ipcc_ildq_wr_en3_m),	 // Templated
				    .rd_adr(ilc_ildq_rd_addr3_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				    .rd_en(ilc_ildq_rd_en3_m),	 // Templated
				    .din(ipcc_data_all_3[`SII_ILD_RF_DATAWIDTH - 1:0] ), // Templated
				    .rdclk(l2clk),		 // Templated
				    .wrclk(l2clk),		 // Templated
				    .scan_in(ildq3_scanin),	 // Templated
				    .tcu_pce_ov(tcu_pce_ov),
				    .tcu_aclk(aclk),		 // Templated
				    .tcu_bclk(bclk),		 // Templated
				    .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				    .tcu_se_scancollar_in(tcu_se_scancollar_in),
				    .tcu_se_scancollar_out(tcu_se_scancollar_out),
				    .bist_clk_mux_sel(tie_low),	 // Templated
				    .rd_pce(rd_pce),
				    .wr_pce(wr_pce));

   sii_ild_dp           ild3   (/*AUTOINST*/
				// Outputs
				.sii_l2t_req(sii_l2t3_req[31:0]), // Templated
				.sii_l2b_ecc(sii_l2b3_ecc[6:0]), // Templated
				.ild_ilc_curhdr(ild_ilc_curhdr3[63:0]), // Templated
				.scan_out(ild3_scanout),	 // Templated
				.sii_mb0_ild_fail(sii_mb0_ild3_fail[1:0]), // Templated
				// Inputs
				.ilc_ild_de_sel(ilc_ild_de_sel3[1:0]), // Templated
				.ilc_ild_ldhdr(ilc_ild_ldhdr3[3:0]), // Templated
				.ilc_ild_addr_h(ilc_ild_addr_h3[3:0]), // Templated
				.ilc_ild_addr_lo(ilc_ild_addr_lo3[3:0]), // Templated
				.ilc_ild_hdr_sel(ilc_ild_hdr_sel3[1:0]), // Templated
				.ilc_ild_cyc_sel(ilc_ild_cyc_sel3[1:0]), // Templated
				.ilc_ild_newhdr(ilc_ild_newhdr3[63:0]), // Templated
				.ildq_ild_dout(ildq_ild_dout3[`SII_ILD_RF_DATAWIDTH - 1:0]), // Templated
				.ipcc_data_out(ipcc_data_all_3[69:0]), // Templated
				.l2clk	(l2clk),
				.scan_in(ild3_scanin),		 // Templated
				.tcu_scan_en(tcu_scan_en),
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop), // Templated
				.sii_mb0_wdata(sii_mb0_wdata[7:0]));
 
   sii_ilc_ctl          ilc3   (/*AUTOINST*/
				// Outputs
				.sii_l2t_req_vld(sii_l2t3_req_vld), // Templated
				.sii_dbg_l2t_req(sii_dbg1_l2t3_req[1:0]), // Templated
				.ilc_ipcc_stop(ilc_ipcc_stop3),	 // Templated
				.ilc_ipcc_dmu_wrm_dq(ilc_ipcc_dmu_wrm_dq3), // Templated
				.ilc_ipcc_niu_wrm_dq(ilc_ipcc_niu_wrm_dq3), // Templated
				.ilc_ipcc_dmu_wrm(ilc_ipcc_dmu_wrm3), // Templated
				.ilc_ipcc_niu_wrm(ilc_ipcc_niu_wrm3), // Templated
				.ilc_ild_de_sel(ilc_ild_de_sel3[1:0]), // Templated
				.ilc_ild_hdr_sel(ilc_ild_hdr_sel3[1:0]), // Templated
				.ilc_ild_cyc_sel(ilc_ild_cyc_sel3[1:0]), // Templated
				.ilc_ild_newhdr(ilc_ild_newhdr3[63:0]), // Templated
				.ilc_ild_ldhdr(ilc_ild_ldhdr3[3:0]), // Templated
				.ilc_ild_addr_h(ilc_ild_addr_h3[3:0]), // Templated
				.ilc_ild_addr_lo(ilc_ild_addr_lo3[3:0]), // Templated
				.ilc_ildq_rd_addr_m(ilc_ildq_rd_addr3_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				.ilc_ildq_rd_en_m(ilc_ildq_rd_en3_m), // Templated
				.scan_out(ilc3_scanout),	 // Templated
				// Inputs
				.l2t_sii_iq_dequeue(l2t3_sii_iq_dequeue), // Templated
				.l2t_sii_wib_dequeue(l2t3_sii_wib_dequeue), // Templated
				.sio_sii_olc_ilc_dequeue_r(sio_sii_olc3_ilc3_dequeue_r), // Templated
				.ipcc_data_58_56({ipcc_data_all_3c[63], ipcc_data_all_3c[59:56]}), // Templated
				.ipcc_ildq_wr_addr(ipcc_ildq_wr_addr3[`SII_ILD_RF_ADDRWIDTH - 1:0]), // Templated
				.ipcc_ildq_wr_en(ipcc_ildq_wr_en3), // Templated
				.ipcc_ilc_be(ipcc_data_all_3c[89:82]), // Templated
				.ipcc_ilc_cmd(ipcc_ilc_cmd3),	 // Templated
				.ild_ilc_curhdr(ild_ilc_curhdr3[63:0]), // Templated
				.sii_mb0_run(sii_mb0_run),
				.sii_mb0_rd_en(sii_mb0_rd_en),
				.sii_mb0_addr(sii_mb0_addr[4:0]),
				.l2clk	(l2clk),		 // Templated
				.scan_in(ilc3_scanin),		 // Templated
				.tcu_scan_en(tcu_scan_en),
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated
 

// ========= Inbound L2 bank 3 ========


// ========= Inbound L2 bank 4 ========
   n2_com_dp_32x82_cust      ildq4 (/*AUTOINST*/
				    // Outputs
				    .dout(ildq_ild_dout4[`SII_ILD_RF_DATAWIDTH - 1:0]), // Templated
				    .scan_out(ildq4_scanout),	 // Templated
				    // Inputs
				    .wr_adr(ipcc_ildq_wr_addr4_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				    .wr_en(ipcc_ildq_wr_en4_m),	 // Templated
				    .rd_adr(ilc_ildq_rd_addr4_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				    .rd_en(ilc_ildq_rd_en4_m),	 // Templated
				    .din(ipcc_data_all_4[`SII_ILD_RF_DATAWIDTH - 1:0] ), // Templated
				    .rdclk(l2clk),		 // Templated
				    .wrclk(l2clk),		 // Templated
				    .scan_in(ildq4_scanin),	 // Templated
				    .tcu_pce_ov(tcu_pce_ov),
				    .tcu_aclk(aclk),		 // Templated
				    .tcu_bclk(bclk),		 // Templated
				    .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				    .tcu_se_scancollar_in(tcu_se_scancollar_in),
				    .tcu_se_scancollar_out(tcu_se_scancollar_out),
				    .bist_clk_mux_sel(tie_low),	 // Templated
				    .rd_pce(rd_pce),
				    .wr_pce(wr_pce));

   sii_ild_dp           ild4   (/*AUTOINST*/
				// Outputs
				.sii_l2t_req(sii_l2t4_req[31:0]), // Templated
				.sii_l2b_ecc(sii_l2b4_ecc[6:0]), // Templated
				.ild_ilc_curhdr(ild_ilc_curhdr4[63:0]), // Templated
				.scan_out(ild4_scanout),	 // Templated
				.sii_mb0_ild_fail(sii_mb0_ild4_fail[1:0]), // Templated
				// Inputs
				.ilc_ild_de_sel(ilc_ild_de_sel4[1:0]), // Templated
				.ilc_ild_ldhdr(ilc_ild_ldhdr4[3:0]), // Templated
				.ilc_ild_addr_h(ilc_ild_addr_h4[3:0]), // Templated
				.ilc_ild_addr_lo(ilc_ild_addr_lo4[3:0]), // Templated
				.ilc_ild_hdr_sel(ilc_ild_hdr_sel4[1:0]), // Templated
				.ilc_ild_cyc_sel(ilc_ild_cyc_sel4[1:0]), // Templated
				.ilc_ild_newhdr(ilc_ild_newhdr4[63:0]), // Templated
				.ildq_ild_dout(ildq_ild_dout4[`SII_ILD_RF_DATAWIDTH - 1:0]), // Templated
				.ipcc_data_out(ipcc_data_all_4[69:0]), // Templated
				.l2clk	(l2clk),
				.scan_in(ild4_scanin),		 // Templated
				.tcu_scan_en(tcu_scan_en),
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop), // Templated
				.sii_mb0_wdata(sii_mb0_wdata[7:0]));
 
   sii_ilc_ctl          ilc4   (/*AUTOINST*/
				// Outputs
				.sii_l2t_req_vld(sii_l2t4_req_vld), // Templated
				.sii_dbg_l2t_req(sii_dbg1_l2t4_req[1:0]), // Templated
				.ilc_ipcc_stop(ilc_ipcc_stop4),	 // Templated
				.ilc_ipcc_dmu_wrm_dq(ilc_ipcc_dmu_wrm_dq4), // Templated
				.ilc_ipcc_niu_wrm_dq(ilc_ipcc_niu_wrm_dq4), // Templated
				.ilc_ipcc_dmu_wrm(ilc_ipcc_dmu_wrm4), // Templated
				.ilc_ipcc_niu_wrm(ilc_ipcc_niu_wrm4), // Templated
				.ilc_ild_de_sel(ilc_ild_de_sel4[1:0]), // Templated
				.ilc_ild_hdr_sel(ilc_ild_hdr_sel4[1:0]), // Templated
				.ilc_ild_cyc_sel(ilc_ild_cyc_sel4[1:0]), // Templated
				.ilc_ild_newhdr(ilc_ild_newhdr4[63:0]), // Templated
				.ilc_ild_ldhdr(ilc_ild_ldhdr4[3:0]), // Templated
				.ilc_ild_addr_h(ilc_ild_addr_h4[3:0]), // Templated
				.ilc_ild_addr_lo(ilc_ild_addr_lo4[3:0]), // Templated
				.ilc_ildq_rd_addr_m(ilc_ildq_rd_addr4_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				.ilc_ildq_rd_en_m(ilc_ildq_rd_en4_m), // Templated
				.scan_out(ilc4_scanout),	 // Templated
				// Inputs
				.l2t_sii_iq_dequeue(l2t4_sii_iq_dequeue), // Templated
				.l2t_sii_wib_dequeue(l2t4_sii_wib_dequeue), // Templated
				.sio_sii_olc_ilc_dequeue_r(sio_sii_olc4_ilc4_dequeue_r), // Templated
				.ipcc_data_58_56({ipcc_data_all_4c[63], ipcc_data_all_4c[59:56]}), // Templated
				.ipcc_ildq_wr_addr(ipcc_ildq_wr_addr4[`SII_ILD_RF_ADDRWIDTH - 1:0]), // Templated
				.ipcc_ildq_wr_en(ipcc_ildq_wr_en4), // Templated
				.ipcc_ilc_be(ipcc_data_all_4c[89:82]), // Templated
				.ipcc_ilc_cmd(ipcc_ilc_cmd4),	 // Templated
				.ild_ilc_curhdr(ild_ilc_curhdr4[63:0]), // Templated
				.sii_mb0_run(sii_mb0_run),
				.sii_mb0_rd_en(sii_mb0_rd_en),
				.sii_mb0_addr(sii_mb0_addr[4:0]),
				.l2clk	(l2clk),		 // Templated
				.scan_in(ilc4_scanin),		 // Templated
				.tcu_scan_en(tcu_scan_en),
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated
 

// ========= Inbound L2 bank 4 ========


// ========= Inbound L2 bank 5 ========
   n2_com_dp_32x82_cust      ildq5 (/*AUTOINST*/
				    // Outputs
				    .dout(ildq_ild_dout5[`SII_ILD_RF_DATAWIDTH - 1:0]), // Templated
				    .scan_out(ildq5_scanout),	 // Templated
				    // Inputs
				    .wr_adr(ipcc_ildq_wr_addr5_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				    .wr_en(ipcc_ildq_wr_en5_m),	 // Templated
				    .rd_adr(ilc_ildq_rd_addr5_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				    .rd_en(ilc_ildq_rd_en5_m),	 // Templated
				    .din(ipcc_data_all_5[`SII_ILD_RF_DATAWIDTH - 1:0] ), // Templated
				    .rdclk(l2clk),		 // Templated
				    .wrclk(l2clk),		 // Templated
				    .scan_in(ildq5_scanin),	 // Templated
				    .tcu_pce_ov(tcu_pce_ov),
				    .tcu_aclk(aclk),		 // Templated
				    .tcu_bclk(bclk),		 // Templated
				    .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				    .tcu_se_scancollar_in(tcu_se_scancollar_in),
				    .tcu_se_scancollar_out(tcu_se_scancollar_out),
				    .bist_clk_mux_sel(tie_low),	 // Templated
				    .rd_pce(rd_pce),
				    .wr_pce(wr_pce));

   sii_ild_dp           ild5   (/*AUTOINST*/
				// Outputs
				.sii_l2t_req(sii_l2t5_req[31:0]), // Templated
				.sii_l2b_ecc(sii_l2b5_ecc[6:0]), // Templated
				.ild_ilc_curhdr(ild_ilc_curhdr5[63:0]), // Templated
				.scan_out(ild5_scanout),	 // Templated
				.sii_mb0_ild_fail(sii_mb0_ild5_fail[1:0]), // Templated
				// Inputs
				.ilc_ild_de_sel(ilc_ild_de_sel5[1:0]), // Templated
				.ilc_ild_ldhdr(ilc_ild_ldhdr5[3:0]), // Templated
				.ilc_ild_addr_h(ilc_ild_addr_h5[3:0]), // Templated
				.ilc_ild_addr_lo(ilc_ild_addr_lo5[3:0]), // Templated
				.ilc_ild_hdr_sel(ilc_ild_hdr_sel5[1:0]), // Templated
				.ilc_ild_cyc_sel(ilc_ild_cyc_sel5[1:0]), // Templated
				.ilc_ild_newhdr(ilc_ild_newhdr5[63:0]), // Templated
				.ildq_ild_dout(ildq_ild_dout5[`SII_ILD_RF_DATAWIDTH - 1:0]), // Templated
				.ipcc_data_out(ipcc_data_all_5[69:0]), // Templated
				.l2clk	(l2clk),
				.scan_in(ild5_scanin),		 // Templated
				.tcu_scan_en(tcu_scan_en),
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop), // Templated
				.sii_mb0_wdata(sii_mb0_wdata[7:0]));

   sii_ilc_ctl          ilc5   (/*AUTOINST*/
				// Outputs
				.sii_l2t_req_vld(sii_l2t5_req_vld), // Templated
				.sii_dbg_l2t_req(sii_dbg1_l2t5_req[1:0]), // Templated
				.ilc_ipcc_stop(ilc_ipcc_stop5),	 // Templated
				.ilc_ipcc_dmu_wrm_dq(ilc_ipcc_dmu_wrm_dq5), // Templated
				.ilc_ipcc_niu_wrm_dq(ilc_ipcc_niu_wrm_dq5), // Templated
				.ilc_ipcc_dmu_wrm(ilc_ipcc_dmu_wrm5), // Templated
				.ilc_ipcc_niu_wrm(ilc_ipcc_niu_wrm5), // Templated
				.ilc_ild_de_sel(ilc_ild_de_sel5[1:0]), // Templated
				.ilc_ild_hdr_sel(ilc_ild_hdr_sel5[1:0]), // Templated
				.ilc_ild_cyc_sel(ilc_ild_cyc_sel5[1:0]), // Templated
				.ilc_ild_newhdr(ilc_ild_newhdr5[63:0]), // Templated
				.ilc_ild_ldhdr(ilc_ild_ldhdr5[3:0]), // Templated
				.ilc_ild_addr_h(ilc_ild_addr_h5[3:0]), // Templated
				.ilc_ild_addr_lo(ilc_ild_addr_lo5[3:0]), // Templated
				.ilc_ildq_rd_addr_m(ilc_ildq_rd_addr5_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				.ilc_ildq_rd_en_m(ilc_ildq_rd_en5_m), // Templated
				.scan_out(ilc5_scanout),	 // Templated
				// Inputs
				.l2t_sii_iq_dequeue(l2t5_sii_iq_dequeue), // Templated
				.l2t_sii_wib_dequeue(l2t5_sii_wib_dequeue), // Templated
				.sio_sii_olc_ilc_dequeue_r(sio_sii_olc5_ilc5_dequeue_r), // Templated
				.ipcc_data_58_56({ipcc_data_all_5c[63], ipcc_data_all_5c[59:56]}), // Templated
				.ipcc_ildq_wr_addr(ipcc_ildq_wr_addr5[`SII_ILD_RF_ADDRWIDTH - 1:0]), // Templated
				.ipcc_ildq_wr_en(ipcc_ildq_wr_en5), // Templated
				.ipcc_ilc_be(ipcc_data_all_5c[89:82]), // Templated
				.ipcc_ilc_cmd(ipcc_ilc_cmd5),	 // Templated
				.ild_ilc_curhdr(ild_ilc_curhdr5[63:0]), // Templated
				.sii_mb0_run(sii_mb0_run),
				.sii_mb0_rd_en(sii_mb0_rd_en),
				.sii_mb0_addr(sii_mb0_addr[4:0]),
				.l2clk	(l2clk),		 // Templated
				.scan_in(ilc5_scanin),		 // Templated
				.tcu_scan_en(tcu_scan_en),
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated
 

// ========= Inbound L2 bank 5 ========


// ========= Inbound L2 bank 6 ========
   n2_com_dp_32x82_cust      ildq6 (/*AUTOINST*/
				    // Outputs
				    .dout(ildq_ild_dout6[`SII_ILD_RF_DATAWIDTH - 1:0]), // Templated
				    .scan_out(ildq6_scanout),	 // Templated
				    // Inputs
				    .wr_adr(ipcc_ildq_wr_addr6_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				    .wr_en(ipcc_ildq_wr_en6_m),	 // Templated
				    .rd_adr(ilc_ildq_rd_addr6_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				    .rd_en(ilc_ildq_rd_en6_m),	 // Templated
				    .din(ipcc_data_all_6[`SII_ILD_RF_DATAWIDTH - 1:0] ), // Templated
				    .rdclk(l2clk),		 // Templated
				    .wrclk(l2clk),		 // Templated
				    .scan_in(ildq6_scanin),	 // Templated
				    .tcu_pce_ov(tcu_pce_ov),
				    .tcu_aclk(aclk),		 // Templated
				    .tcu_bclk(bclk),		 // Templated
				    .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				    .tcu_se_scancollar_in(tcu_se_scancollar_in),
				    .tcu_se_scancollar_out(tcu_se_scancollar_out),
				    .bist_clk_mux_sel(tie_low),	 // Templated
				    .rd_pce(rd_pce),
				    .wr_pce(wr_pce));

   sii_ild_dp           ild6   (/*AUTOINST*/
				// Outputs
				.sii_l2t_req(sii_l2t6_req[31:0]), // Templated
				.sii_l2b_ecc(sii_l2b6_ecc[6:0]), // Templated
				.ild_ilc_curhdr(ild_ilc_curhdr6[63:0]), // Templated
				.scan_out(ild6_scanout),	 // Templated
				.sii_mb0_ild_fail(sii_mb0_ild6_fail[1:0]), // Templated
				// Inputs
				.ilc_ild_de_sel(ilc_ild_de_sel6[1:0]), // Templated
				.ilc_ild_ldhdr(ilc_ild_ldhdr6[3:0]), // Templated
				.ilc_ild_addr_h(ilc_ild_addr_h6[3:0]), // Templated
				.ilc_ild_addr_lo(ilc_ild_addr_lo6[3:0]), // Templated
				.ilc_ild_hdr_sel(ilc_ild_hdr_sel6[1:0]), // Templated
				.ilc_ild_cyc_sel(ilc_ild_cyc_sel6[1:0]), // Templated
				.ilc_ild_newhdr(ilc_ild_newhdr6[63:0]), // Templated
				.ildq_ild_dout(ildq_ild_dout6[`SII_ILD_RF_DATAWIDTH - 1:0]), // Templated
				.ipcc_data_out(ipcc_data_all_6[69:0]), // Templated
				.l2clk	(l2clk),
				.scan_in(ild6_scanin),		 // Templated
				.tcu_scan_en(tcu_scan_en),
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop), // Templated
				.sii_mb0_wdata(sii_mb0_wdata[7:0]));
 
   sii_ilc_ctl          ilc6   (/*AUTOINST*/
				// Outputs
				.sii_l2t_req_vld(sii_l2t6_req_vld), // Templated
				.sii_dbg_l2t_req(sii_dbg1_l2t6_req[1:0]), // Templated
				.ilc_ipcc_stop(ilc_ipcc_stop6),	 // Templated
				.ilc_ipcc_dmu_wrm_dq(ilc_ipcc_dmu_wrm_dq6), // Templated
				.ilc_ipcc_niu_wrm_dq(ilc_ipcc_niu_wrm_dq6), // Templated
				.ilc_ipcc_dmu_wrm(ilc_ipcc_dmu_wrm6), // Templated
				.ilc_ipcc_niu_wrm(ilc_ipcc_niu_wrm6), // Templated
				.ilc_ild_de_sel(ilc_ild_de_sel6[1:0]), // Templated
				.ilc_ild_hdr_sel(ilc_ild_hdr_sel6[1:0]), // Templated
				.ilc_ild_cyc_sel(ilc_ild_cyc_sel6[1:0]), // Templated
				.ilc_ild_newhdr(ilc_ild_newhdr6[63:0]), // Templated
				.ilc_ild_ldhdr(ilc_ild_ldhdr6[3:0]), // Templated
				.ilc_ild_addr_h(ilc_ild_addr_h6[3:0]), // Templated
				.ilc_ild_addr_lo(ilc_ild_addr_lo6[3:0]), // Templated
				.ilc_ildq_rd_addr_m(ilc_ildq_rd_addr6_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				.ilc_ildq_rd_en_m(ilc_ildq_rd_en6_m), // Templated
				.scan_out(ilc6_scanout),	 // Templated
				// Inputs
				.l2t_sii_iq_dequeue(l2t6_sii_iq_dequeue), // Templated
				.l2t_sii_wib_dequeue(l2t6_sii_wib_dequeue), // Templated
				.sio_sii_olc_ilc_dequeue_r(sio_sii_olc6_ilc6_dequeue_r), // Templated
				.ipcc_data_58_56({ipcc_data_all_6c[63], ipcc_data_all_6c[59:56]}), // Templated
				.ipcc_ildq_wr_addr(ipcc_ildq_wr_addr6[`SII_ILD_RF_ADDRWIDTH - 1:0]), // Templated
				.ipcc_ildq_wr_en(ipcc_ildq_wr_en6), // Templated
				.ipcc_ilc_be(ipcc_data_all_6c[89:82]), // Templated
				.ipcc_ilc_cmd(ipcc_ilc_cmd6),	 // Templated
				.ild_ilc_curhdr(ild_ilc_curhdr6[63:0]), // Templated
				.sii_mb0_run(sii_mb0_run),
				.sii_mb0_rd_en(sii_mb0_rd_en),
				.sii_mb0_addr(sii_mb0_addr[4:0]),
				.l2clk	(l2clk),		 // Templated
				.scan_in(ilc6_scanin),		 // Templated
				.tcu_scan_en(tcu_scan_en),
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated
 


// ========= Inbound L2 bank 6 ========


// ========= Inbound L2 bank 7 ========
   n2_com_dp_32x82_cust      ildq7 (/*AUTOINST*/
				    // Outputs
				    .dout(ildq_ild_dout7[`SII_ILD_RF_DATAWIDTH - 1:0]), // Templated
				    .scan_out(ildq7_scanout),	 // Templated
				    // Inputs
				    .wr_adr(ipcc_ildq_wr_addr7_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				    .wr_en(ipcc_ildq_wr_en7_m),	 // Templated
				    .rd_adr(ilc_ildq_rd_addr7_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				    .rd_en(ilc_ildq_rd_en7_m),	 // Templated
				    .din(ipcc_data_all_7[`SII_ILD_RF_DATAWIDTH - 1:0] ), // Templated
				    .rdclk(l2clk),		 // Templated
				    .wrclk(l2clk),		 // Templated
				    .scan_in(ildq7_scanin),	 // Templated
				    .tcu_pce_ov(tcu_pce_ov),
				    .tcu_aclk(aclk),		 // Templated
				    .tcu_bclk(bclk),		 // Templated
				    .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				    .tcu_se_scancollar_in(tcu_se_scancollar_in),
				    .tcu_se_scancollar_out(tcu_se_scancollar_out),
				    .bist_clk_mux_sel(tie_low),	 // Templated
				    .rd_pce(rd_pce),
				    .wr_pce(wr_pce));

   sii_ild_dp           ild7   (/*AUTOINST*/
				// Outputs
				.sii_l2t_req(sii_l2t7_req[31:0]), // Templated
				.sii_l2b_ecc(sii_l2b7_ecc[6:0]), // Templated
				.ild_ilc_curhdr(ild_ilc_curhdr7[63:0]), // Templated
				.scan_out(ild7_scanout),	 // Templated
				.sii_mb0_ild_fail(sii_mb0_ild7_fail[1:0]), // Templated
				// Inputs
				.ilc_ild_de_sel(ilc_ild_de_sel7[1:0]), // Templated
				.ilc_ild_ldhdr(ilc_ild_ldhdr7[3:0]), // Templated
				.ilc_ild_addr_h(ilc_ild_addr_h7[3:0]), // Templated
				.ilc_ild_addr_lo(ilc_ild_addr_lo7[3:0]), // Templated
				.ilc_ild_hdr_sel(ilc_ild_hdr_sel7[1:0]), // Templated
				.ilc_ild_cyc_sel(ilc_ild_cyc_sel7[1:0]), // Templated
				.ilc_ild_newhdr(ilc_ild_newhdr7[63:0]), // Templated
				.ildq_ild_dout(ildq_ild_dout7[`SII_ILD_RF_DATAWIDTH - 1:0]), // Templated
				.ipcc_data_out(ipcc_data_all_7[69:0]), // Templated
				.l2clk	(l2clk),
				.scan_in(ild7_scanin),		 // Templated
				.tcu_scan_en(tcu_scan_en),
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop), // Templated
				.sii_mb0_wdata(sii_mb0_wdata[7:0]));
 
   sii_ilc_ctl          ilc7   (/*AUTOINST*/
				// Outputs
				.sii_l2t_req_vld(sii_l2t7_req_vld), // Templated
				.sii_dbg_l2t_req(sii_dbg1_l2t7_req[1:0]), // Templated
				.ilc_ipcc_stop(ilc_ipcc_stop7),	 // Templated
				.ilc_ipcc_dmu_wrm_dq(ilc_ipcc_dmu_wrm_dq7), // Templated
				.ilc_ipcc_niu_wrm_dq(ilc_ipcc_niu_wrm_dq7), // Templated
				.ilc_ipcc_dmu_wrm(ilc_ipcc_dmu_wrm7), // Templated
				.ilc_ipcc_niu_wrm(ilc_ipcc_niu_wrm7), // Templated
				.ilc_ild_de_sel(ilc_ild_de_sel7[1:0]), // Templated
				.ilc_ild_hdr_sel(ilc_ild_hdr_sel7[1:0]), // Templated
				.ilc_ild_cyc_sel(ilc_ild_cyc_sel7[1:0]), // Templated
				.ilc_ild_newhdr(ilc_ild_newhdr7[63:0]), // Templated
				.ilc_ild_ldhdr(ilc_ild_ldhdr7[3:0]), // Templated
				.ilc_ild_addr_h(ilc_ild_addr_h7[3:0]), // Templated
				.ilc_ild_addr_lo(ilc_ild_addr_lo7[3:0]), // Templated
				.ilc_ildq_rd_addr_m(ilc_ildq_rd_addr7_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), // Templated
				.ilc_ildq_rd_en_m(ilc_ildq_rd_en7_m), // Templated
				.scan_out(ilc7_scanout),	 // Templated
				// Inputs
				.l2t_sii_iq_dequeue(l2t7_sii_iq_dequeue), // Templated
				.l2t_sii_wib_dequeue(l2t7_sii_wib_dequeue), // Templated
				.sio_sii_olc_ilc_dequeue_r(sio_sii_olc7_ilc7_dequeue_r), // Templated
				.ipcc_data_58_56({ipcc_data_all_7c[63], ipcc_data_all_7c[59:56]}), // Templated
				.ipcc_ildq_wr_addr(ipcc_ildq_wr_addr7[`SII_ILD_RF_ADDRWIDTH - 1:0]), // Templated
				.ipcc_ildq_wr_en(ipcc_ildq_wr_en7), // Templated
				.ipcc_ilc_be(ipcc_data_all_7c[89:82]), // Templated
				.ipcc_ilc_cmd(ipcc_ilc_cmd7),	 // Templated
				.ild_ilc_curhdr(ild_ilc_curhdr7[63:0]), // Templated
				.sii_mb0_run(sii_mb0_run),
				.sii_mb0_rd_en(sii_mb0_rd_en),
				.sii_mb0_addr(sii_mb0_addr[4:0]),
				.l2clk	(l2clk),		 // Templated
				.scan_in(ilc7_scanin),		 // Templated
				.tcu_scan_en(tcu_scan_en),
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated
 


// ========= Inbound L2 bank 7 ========



// ========= Inbound NCU ========

   n2_com_dp_64x72_cust     indq  (/*AUTOINST*/
				   // Outputs
				   .dout(indq_inc_dout[`SII_IND_RF_DATAWIDTH - 1:0]), // Templated
				   .scan_out(indq_scanout),	 // Templated
				   // Inputs
				   .wr_adr(ipcc_indq_wr_addr[`SII_IND_RF_ADDRWIDTH - 1:0] ), // Templated
				   .wr_en(ipcc_indq_wr_en),	 // Templated
				   .rd_adr(inc_indq_rd_addr[`SII_IND_RF_ADDRWIDTH - 1:0] ), // Templated
				   .rd_en(inc_indq_rd_en),	 // Templated
				   .din	(ipcc_ind_data[`SII_IND_RF_DATAWIDTH - 1:0] ), // Templated
				   .rdclk(l2clk),		 // Templated
				   .wrclk(l2clk),		 // Templated
				   .scan_in(indq_scanin),	 // Templated
				   .tcu_pce_ov(tcu_pce_ov),
				   .tcu_aclk(aclk),		 // Templated
				   .tcu_bclk(bclk),		 // Templated
				   .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				   .tcu_se_scancollar_in(tcu_se_scancollar_in),
				   .tcu_se_scancollar_out(tcu_se_scancollar_out),
				   .bist_clk_mux_sel(tie_low),	 // Templated
				   .rd_pce(rd_pce),
				   .wr_pce(wr_pce));

   

   sii_inc_ctl          inc   (/*AUTOINST*/
			       // Outputs
			       .sii_ncu_req(sii_ncu_req),
			       .sii_ncu_data(sii_ncu_data[31:0]),
			       .sii_ncu_dparity(sii_ncu_dparity[1:0]),
			       .inc_indq_rd_addr(inc_indq_rd_addr[5:0]),
			       .inc_indq_rd_en(inc_indq_rd_en),
			       .inc_ipcc_stop(inc_ipcc_stop),
			       .scan_out(inc_scanout),		 // Templated
			       .sii_mb0_ind_fail(sii_mb0_ind_fail[1:0]),
			       // Inputs
			       .ncu_sii_gnt(ncu_sii_gnt),
			       .indq_inc_dout(indq_inc_dout[67:0]),
			       .ipcc_indq_wr_addr(ipcc_indq_wr_addr[5:0]),
			       .ipcc_indq_wr_en(ipcc_indq_wr_en),
			       .ipcc_inc_wr_ovfl(ipcc_inc_wr_ovfl),
			       .l2clk	(l2clk),
			       .cmp_io_sync_en_in(cmp_io_sync_en_in),
			       .io_cmp_sync_en_in(io_cmp_sync_en_in),
			       .scan_in	(inc_scanin),		 // Templated
			       .tcu_scan_en(tcu_scan_en),
			       .tcu_aclk(aclk),			 // Templated
			       .tcu_bclk(bclk),			 // Templated
			       .tcu_pce_ov(tcu_pce_ov),
			       .tcu_clk_stop(ccu_soc4cmp_clk_stop), // Templated
			       .sii_mb0_run(sii_mb0_run),
			       .sii_mb0_ind_rd_en(sii_mb0_ind_rd_en),
			       .sii_mb0_addr(sii_mb0_addr[5:0]),
			       .sii_mb0_wdata(sii_mb0_wdata[7:0]));


// ========= Inbound NCU ========


// ========= Inbound Packet from DMU/ENT ========

   // Controller In Core Domain
  
   sii_ipcc_ctl         ipcc   (/*AUTOINST*/
				// Outputs
				.ipcc_ilc_cmd0(ipcc_ilc_cmd0),
				.ipcc_ilc_cmd1(ipcc_ilc_cmd1),
				.ipcc_ilc_cmd2(ipcc_ilc_cmd2),
				.ipcc_ilc_cmd3(ipcc_ilc_cmd3),
				.ipcc_ilc_cmd4(ipcc_ilc_cmd4),
				.ipcc_ilc_cmd5(ipcc_ilc_cmd5),
				.ipcc_ilc_cmd6(ipcc_ilc_cmd6),
				.ipcc_ilc_cmd7(ipcc_ilc_cmd7),
				.array_wr_inhibit(array_wr_inhibit),
				.sii_ncu_niuctag_ue(sii_ncu_niuctag_ue),
				.sii_ncu_niuctag_ce(sii_ncu_niuctag_ce),
				.sii_ncu_niua_pe(sii_ncu_niua_pe),
				.sii_ncu_niud_pe(sii_ncu_niud_pe),
				.sii_ncu_dmuctag_ue(sii_ncu_dmuctag_ue),
				.sii_ncu_dmuctag_ce(sii_ncu_dmuctag_ce),
				.sii_ncu_dmua_pe(sii_ncu_dmua_pe),
				.sii_ncu_dmud_pe(sii_ncu_dmud_pe),
				.sii_ncu_syn_data(sii_ncu_syn_data[3:0]),
				.sii_ncu_syn_vld(sii_ncu_syn_vld),
				.data_sel(data_sel[2:0]),
				.gnt0_r_m(gnt0_r_m[4:0]),
				.hdr_data_sel(hdr_data_sel),
				.newhdr_l2(newhdr_l2[63:0]),
				.newhdr_nc(newhdr_nc[63:0]),
				.new_c	(new_c[5:0]),
				.data_parity_err(data_parity_err),
				.tcu_hdr(tcu_hdr[71:0]),
				.tcu_data(tcu_data[63:0]),
				.tcu_be_par(tcu_be_par[11:0]),
				.ipcc_ipcs_dmu_or_go_lv(ipcc_ipcs_dmu_or_go_lv),
				.ipcc_ipcs_dmu_by_go_lv(ipcc_ipcs_dmu_by_go_lv),
				.ipcc_ipcs_dmu_or_ptr(ipcc_ipcs_dmu_or_ptr[3:0]),
				.ipcc_ipcs_dmu_by_ptr(ipcc_ipcs_dmu_by_ptr[3:0]),
				.ipcc_ipcs_dmu_tag(ipcc_ipcs_dmu_tag[3:0]),
				.ipcc_ipcs_wrack_lv(ipcc_ipcs_wrack_lv),
				.ipcc_ipcs_dmu_wrack_p(ipcc_ipcs_dmu_wrack_p),
				.ipcc_ipcs_niu_or_go_lv(ipcc_ipcs_niu_or_go_lv),
				.ipcc_ipcs_niu_by_go_lv(ipcc_ipcs_niu_by_go_lv),
				.ipcc_ipcs_niu_or_ptr(ipcc_ipcs_niu_or_ptr[3:0]),
				.ipcc_ipcs_niu_by_ptr(ipcc_ipcs_niu_by_ptr[3:0]),
				.sii_mb1_run_r(sii_mb1_run_r),
				.ipcc_ildq_wr_addr0_m(ipcc_ildq_wr_addr0_m[4:0]),
				.ipcc_ildq_wr_addr1_m(ipcc_ildq_wr_addr1_m[4:0]),
				.ipcc_ildq_wr_addr2_m(ipcc_ildq_wr_addr2_m[4:0]),
				.ipcc_ildq_wr_addr3_m(ipcc_ildq_wr_addr3_m[4:0]),
				.ipcc_ildq_wr_addr4_m(ipcc_ildq_wr_addr4_m[4:0]),
				.ipcc_ildq_wr_addr5_m(ipcc_ildq_wr_addr5_m[4:0]),
				.ipcc_ildq_wr_addr6_m(ipcc_ildq_wr_addr6_m[4:0]),
				.ipcc_ildq_wr_addr7_m(ipcc_ildq_wr_addr7_m[4:0]),
				.ipcc_ildq_wr_en0_m(ipcc_ildq_wr_en0_m),
				.ipcc_ildq_wr_en1_m(ipcc_ildq_wr_en1_m),
				.ipcc_ildq_wr_en2_m(ipcc_ildq_wr_en2_m),
				.ipcc_ildq_wr_en3_m(ipcc_ildq_wr_en3_m),
				.ipcc_ildq_wr_en4_m(ipcc_ildq_wr_en4_m),
				.ipcc_ildq_wr_en5_m(ipcc_ildq_wr_en5_m),
				.ipcc_ildq_wr_en6_m(ipcc_ildq_wr_en6_m),
				.ipcc_ildq_wr_en7_m(ipcc_ildq_wr_en7_m),
				.ipcc_ildq_wr_addr0(ipcc_ildq_wr_addr0[4:0]),
				.ipcc_ildq_wr_addr1(ipcc_ildq_wr_addr1[4:0]),
				.ipcc_ildq_wr_addr2(ipcc_ildq_wr_addr2[4:0]),
				.ipcc_ildq_wr_addr3(ipcc_ildq_wr_addr3[4:0]),
				.ipcc_ildq_wr_addr4(ipcc_ildq_wr_addr4[4:0]),
				.ipcc_ildq_wr_addr5(ipcc_ildq_wr_addr5[4:0]),
				.ipcc_ildq_wr_addr6(ipcc_ildq_wr_addr6[4:0]),
				.ipcc_ildq_wr_addr7(ipcc_ildq_wr_addr7[4:0]),
				.ipcc_ildq_wr_en0(ipcc_ildq_wr_en0),
				.ipcc_ildq_wr_en1(ipcc_ildq_wr_en1),
				.ipcc_ildq_wr_en2(ipcc_ildq_wr_en2),
				.ipcc_ildq_wr_en3(ipcc_ildq_wr_en3),
				.ipcc_ildq_wr_en4(ipcc_ildq_wr_en4),
				.ipcc_ildq_wr_en5(ipcc_ildq_wr_en5),
				.ipcc_ildq_wr_en6(ipcc_ildq_wr_en6),
				.ipcc_ildq_wr_en7(ipcc_ildq_wr_en7),
				.ipcc_indq_wr_addr(ipcc_indq_wr_addr[5:0]),
				.ipcc_indq_wr_en(ipcc_indq_wr_en),
				.ipcc_inc_wr_ovfl(ipcc_inc_wr_ovfl),
				.ipcc_ipdodq0_rd_addr_m(ipcc_ipdodq0_rd_addr_m[5:0]),
				.ipcc_ipdbdq0_rd_addr_m(ipcc_ipdbdq0_rd_addr_m[5:0]),
				.ipcc_ipdohq0_rd_addr_m(ipcc_ipdohq0_rd_addr_m[3:0]),
				.ipcc_ipdbhq0_rd_addr_m(ipcc_ipdbhq0_rd_addr_m[3:0]),
				.ipcc_ipdohq0_rd_en_m(ipcc_ipdohq0_rd_en_m),
				.ipcc_ipdbhq0_rd_en_m(ipcc_ipdbhq0_rd_en_m),
				.ipcc_ipdodq0_rd_en_m(ipcc_ipdodq0_rd_en_m),
				.ipcc_ipdbdq0_rd_en_m(ipcc_ipdbdq0_rd_en_m),
				.ipcc_ipdodq1_rd_addr_m(ipcc_ipdodq1_rd_addr_m[5:0]),
				.ipcc_ipdbdq1_rd_addr_m(ipcc_ipdbdq1_rd_addr_m[5:0]),
				.ipcc_ipdohq1_rd_addr_m(ipcc_ipdohq1_rd_addr_m[3:0]),
				.ipcc_ipdbhq1_rd_addr_m(ipcc_ipdbhq1_rd_addr_m[3:0]),
				.ipcc_ipdohq1_rd_en_m(ipcc_ipdohq1_rd_en_m),
				.ipcc_ipdbhq1_rd_en_m(ipcc_ipdbhq1_rd_en_m),
				.ipcc_ipdodq1_rd_en_m(ipcc_ipdodq1_rd_en_m),
				.ipcc_ipdbdq1_rd_en_m(ipcc_ipdbdq1_rd_en_m),
				.scan_out(ipcc_scanout),	 // Templated
				// Inputs
				.ilc_ipcc_stop0(ilc_ipcc_stop0),
				.ilc_ipcc_stop1(ilc_ipcc_stop1),
				.ilc_ipcc_stop2(ilc_ipcc_stop2),
				.ilc_ipcc_stop3(ilc_ipcc_stop3),
				.ilc_ipcc_stop4(ilc_ipcc_stop4),
				.ilc_ipcc_stop5(ilc_ipcc_stop5),
				.ilc_ipcc_stop6(ilc_ipcc_stop6),
				.ilc_ipcc_stop7(ilc_ipcc_stop7),
				.ilc_ipcc_dmu_wrm0(ilc_ipcc_dmu_wrm0),
				.ilc_ipcc_dmu_wrm1(ilc_ipcc_dmu_wrm1),
				.ilc_ipcc_dmu_wrm2(ilc_ipcc_dmu_wrm2),
				.ilc_ipcc_dmu_wrm3(ilc_ipcc_dmu_wrm3),
				.ilc_ipcc_dmu_wrm4(ilc_ipcc_dmu_wrm4),
				.ilc_ipcc_dmu_wrm5(ilc_ipcc_dmu_wrm5),
				.ilc_ipcc_dmu_wrm6(ilc_ipcc_dmu_wrm6),
				.ilc_ipcc_dmu_wrm7(ilc_ipcc_dmu_wrm7),
				.ilc_ipcc_niu_wrm0(ilc_ipcc_niu_wrm0),
				.ilc_ipcc_niu_wrm1(ilc_ipcc_niu_wrm1),
				.ilc_ipcc_niu_wrm2(ilc_ipcc_niu_wrm2),
				.ilc_ipcc_niu_wrm3(ilc_ipcc_niu_wrm3),
				.ilc_ipcc_niu_wrm4(ilc_ipcc_niu_wrm4),
				.ilc_ipcc_niu_wrm5(ilc_ipcc_niu_wrm5),
				.ilc_ipcc_niu_wrm6(ilc_ipcc_niu_wrm6),
				.ilc_ipcc_niu_wrm7(ilc_ipcc_niu_wrm7),
				.ilc_ipcc_dmu_wrm_dq0(ilc_ipcc_dmu_wrm_dq0),
				.ilc_ipcc_dmu_wrm_dq1(ilc_ipcc_dmu_wrm_dq1),
				.ilc_ipcc_dmu_wrm_dq2(ilc_ipcc_dmu_wrm_dq2),
				.ilc_ipcc_dmu_wrm_dq3(ilc_ipcc_dmu_wrm_dq3),
				.ilc_ipcc_dmu_wrm_dq4(ilc_ipcc_dmu_wrm_dq4),
				.ilc_ipcc_dmu_wrm_dq5(ilc_ipcc_dmu_wrm_dq5),
				.ilc_ipcc_dmu_wrm_dq6(ilc_ipcc_dmu_wrm_dq6),
				.ilc_ipcc_dmu_wrm_dq7(ilc_ipcc_dmu_wrm_dq7),
				.ilc_ipcc_niu_wrm_dq0(ilc_ipcc_niu_wrm_dq0),
				.ilc_ipcc_niu_wrm_dq1(ilc_ipcc_niu_wrm_dq1),
				.ilc_ipcc_niu_wrm_dq2(ilc_ipcc_niu_wrm_dq2),
				.ilc_ipcc_niu_wrm_dq3(ilc_ipcc_niu_wrm_dq3),
				.ilc_ipcc_niu_wrm_dq4(ilc_ipcc_niu_wrm_dq4),
				.ilc_ipcc_niu_wrm_dq5(ilc_ipcc_niu_wrm_dq5),
				.ilc_ipcc_niu_wrm_dq6(ilc_ipcc_niu_wrm_dq6),
				.ilc_ipcc_niu_wrm_dq7(ilc_ipcc_niu_wrm_dq7),
				.array_wr_inhibit_cmp(array_wr_inhibit_cmp),
				.array_wr_inhibit_io(array_wr_inhibit_io),
				.inc_ipcc_stop(inc_ipcc_stop),
				.ncu_sii_pm_in(ncu_sii_pm),	 // Templated
				.ncu_sii_ba01_in(ncu_sii_ba01),	 // Templated
				.ncu_sii_ba23_in(ncu_sii_ba23),	 // Templated
				.ncu_sii_ba45_in(ncu_sii_ba45),	 // Templated
				.ncu_sii_ba67_in(ncu_sii_ba67),	 // Templated
				.ncu_sii_l2_idx_hash_en_in(ncu_sii_l2_idx_hash_en), // Templated
				.sio_sii_opcc_ipcc_dmu_or_deq_r(sio_sii_opcc_ipcc_dmu_or_deq_r),
				.sio_sii_opcc_ipcc_dmu_by_deq_r(sio_sii_opcc_ipcc_dmu_by_deq_r),
				.sio_sii_opcc_ipcc_niu_or_deq_r(sio_sii_opcc_ipcc_niu_or_deq_r),
				.sio_sii_opcc_ipcc_niu_by_deq_r(sio_sii_opcc_ipcc_niu_by_deq_r),
				.sio_sii_opcc_ipcc_dmu_by_cnt_r(sio_sii_opcc_ipcc_dmu_by_cnt_r[3:0]),
				.sio_sii_opcc_ipcc_niu_by_cnt_r(sio_sii_opcc_ipcc_niu_by_cnt_r[3:0]),
				.ipcc_dp_par_data(ipcc_dp_par_data[84:0]),
				.curhdr	(curhdr[71:0]),
				.ipcs_ipcc_dmu_or_dep(ipcs_ipcc_dmu_or_dep[15:0]),
				.ipcs_ipcc_dmu_by_dep(ipcs_ipcc_dmu_by_dep[15:0]),
				.ipcs_ipcc_niu_or_dep(ipcs_ipcc_niu_or_dep[15:0]),
				.ipcs_ipcc_niu_by_dep(ipcs_ipcc_niu_by_dep[15:0]),
				.ipcs_ipcc_add_dmu_or(ipcs_ipcc_add_dmu_or),
				.ipcs_ipcc_add_dmu_by(ipcs_ipcc_add_dmu_by),
				.ipcs_ipcc_add_niu_or(ipcs_ipcc_add_niu_or),
				.ipcs_ipcc_add_niu_by(ipcs_ipcc_add_niu_by),
				.sii_mb0_run(sii_mb0_run),
				.sii_mb0_addr(sii_mb0_addr[5:0]),
				.sii_mb0_wr_en(sii_mb0_wr_en),
				.sii_mb0_ind_wr_en(sii_mb0_ind_wr_en),
				.sii_mb1_1of4ipd_sel(sii_mb1_1of4ipd_sel[3:0]),
				.sii_mb1_ipd_data_or_hdr_sel(sii_mb1_ipd_data_or_hdr_sel),
				.sii_mb1_ipd_data_hibits_sel(sii_mb1_ipd_data_hibits_sel),
				.sii_mb1_run(sii_mb1_run),
				.sii_mb1_addr(sii_mb1_addr[5:0]),
				.sii_mb1_ipdohq0_rd_en(sii_mb1_ipdohq0_rd_en),
				.sii_mb1_ipdbhq0_rd_en(sii_mb1_ipdbhq0_rd_en),
				.sii_mb1_ipdodq0_rd_en(sii_mb1_ipdodq0_rd_en),
				.sii_mb1_ipdbdq0_rd_en(sii_mb1_ipdbdq0_rd_en),
				.sii_mb1_ipdohq1_rd_en(sii_mb1_ipdohq1_rd_en),
				.sii_mb1_ipdbhq1_rd_en(sii_mb1_ipdbhq1_rd_en),
				.sii_mb1_ipdodq1_rd_en(sii_mb1_ipdodq1_rd_en),
				.sii_mb1_ipdbdq1_rd_en(sii_mb1_ipdbdq1_rd_en),
				.ipdohq0_dout58(ipdohq0_dout[58]), // Templated
				.ipdbhq0_dout58(ipdbhq0_dout[58]), // Templated
				.ipdohq1_dout58(ipdohq1_dout[58]), // Templated
				.ipdbhq1_dout58(ipdbhq1_dout[58]), // Templated
				.dmu_or_bank_ext(ipdohq0_dout[6:4]), // Templated
				.dmu_by_bank_ext(ipdbhq0_dout[6:4]), // Templated
				.niu_or_bank_ext(ipdohq1_dout[6:4]), // Templated
				.niu_by_bank_ext(ipdbhq1_dout[6:4]), // Templated
				.ipcs_ipdohq0_wr_en(ipcs_ipdohq0_wr_en),
				.ipcs_ipdbhq0_wr_en(ipcs_ipdbhq0_wr_en),
				.ipcs_ipdodq0_wr_en(ipcs_ipdodq0_wr_en),
				.ipcs_ipdbdq0_wr_en(ipcs_ipdbdq0_wr_en),
				.ipcs_ipdohq0_wr_addr(ipcs_ipdohq0_wr_addr[3:0]),
				.ipcs_ipdbhq0_wr_addr(ipcs_ipdbhq0_wr_addr[3:0]),
				.ipcs_ipdodq0_wr_addr(ipcs_ipdodq0_wr_addr[5:0]),
				.ipcs_ipdbdq0_wr_addr(ipcs_ipdbdq0_wr_addr[5:0]),
				.ipcs_ipdohq1_wr_addr(ipcs_ipdohq1_wr_addr[3:0]),
				.ipcs_ipdbhq1_wr_addr(ipcs_ipdbhq1_wr_addr[3:0]),
				.ipcs_ipdodq1_wr_addr(ipcs_ipdodq1_wr_addr[5:0]),
				.ipcs_ipdbdq1_wr_addr(ipcs_ipdbdq1_wr_addr[5:0]),
				.ipcs_ipdohq1_wr_en(ipcs_ipdohq1_wr_en),
				.ipcs_ipdbhq1_wr_en(ipcs_ipdbhq1_wr_en),
				.ipcs_ipdodq1_wr_en(ipcs_ipdodq1_wr_en),
				.ipcs_ipdbdq1_wr_en(ipcs_ipdbdq1_wr_en),
				.l2clk	(l2clk),
				.io_cmp_sync_en_in(io_cmp_sync_en_in),
				.cmp_io_sync_en_in(cmp_io_sync_en_in),
				.scan_in(ipcc_scanin),		 // Templated
				.tcu_scan_en(tcu_scan_en),
				.tcu_sii_data(tcu_sii_data),
				.tcu_sii_vld(tcu_sii_vld),
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated

  // Controller In IO Domain
   assign dmu_mode0    = 1'b1;   // dmu has this bit set to 1
   assign dmu_mode1    = 1'b0;
   assign sii_dmu_oqdq_unused = sii_ext0_oqdq;
   assign sii_dmu_bqdq_unused= sii_ext0_bqdq;
   assign sii_niu_oqdq = sii_ext1_oqdq;
   assign sii_niu_bqdq = sii_ext1_bqdq;   

   assign ipcc_ipcs_or_go_lv0 = ipcc_ipcs_dmu_or_go_lv;
   assign ipcc_ipcs_by_go_lv0 = ipcc_ipcs_dmu_by_go_lv;
   assign ipcc_ipcs_or_go_lv1 = ipcc_ipcs_niu_or_go_lv;
   assign ipcc_ipcs_by_go_lv1 = ipcc_ipcs_niu_by_go_lv;
   assign ipcc_ipcs_or_ptr0[3:0] = ipcc_ipcs_dmu_or_ptr[3:0];
   assign ipcc_ipcs_by_ptr0[3:0] = ipcc_ipcs_dmu_by_ptr[3:0];
   assign ipcc_ipcs_or_ptr1[3:0] = ipcc_ipcs_niu_or_ptr[3:0];
   assign ipcc_ipcs_by_ptr1[3:0] = ipcc_ipcs_niu_by_ptr[3:0];

   assign ipcs_ipcc_dmu_or_dep[15:0] = ipcs_ipcc_or_dep0[15:0];
   assign ipcs_ipcc_dmu_by_dep[15:0] = ipcs_ipcc_by_dep0[15:0];
   assign ipcs_ipcc_niu_or_dep[15:0] = ipcs_ipcc_or_dep1[15:0];
   assign ipcs_ipcc_niu_by_dep[15:0] = ipcs_ipcc_by_dep1[15:0];
   assign ipcs_ipcc_add_dmu_or = ipcs_ipcc_add_or0;
   assign ipcs_ipcc_add_dmu_by = ipcs_ipcc_add_by0;
   assign ipcs_ipcc_add_niu_or = ipcs_ipcc_add_or1;
   assign ipcs_ipcc_add_niu_by = ipcs_ipcc_add_by1;

   assign ncu_sii_ctag_uei0 = ncu_sii_dmuctag_uei;
   assign ncu_sii_ctag_cei0 = ncu_sii_dmuctag_cei;
   assign ncu_sii_a_pei0 = ncu_sii_dmua_pei;
   assign ncu_sii_d_pei0 = ncu_sii_dmud_pei;
   assign ext0_sii_hdr_vld = dmu_sii_hdr_vld;
   assign ext0_sii_reqbypass = dmu_sii_reqbypass;
   assign ext0_sii_datareq = dmu_sii_datareq;
   assign ext0_sii_datareq16 = dmu_sii_datareq16; 
   assign ext0_sii_data[127:0] = dmu_sii_data[127:0]; 
   assign ext0_sii_be[15:0] = dmu_sii_be[15:0];
   assign ext0_sii_parity[7:0] = dmu_sii_parity[7:0];
   assign ext0_sii_be_parity = dmu_sii_be_parity;
   assign sii_dmu_wrack_tag[3:0] = sii_ext0_wrack_tag[3:0];
   assign sii_dmu_wrack_vld      = sii_ext0_wrack_vld; 

   assign ncu_sii_ctag_uei1 = ncu_sii_niuctag_uei;
   assign ncu_sii_ctag_cei1 = ncu_sii_niuctag_cei;
   assign ncu_sii_a_pei1 = ncu_sii_niua_pei;
   assign ncu_sii_d_pei1 = ncu_sii_niud_pei;   
   assign ext1_sii_hdr_vld = niu_sii_hdr_vld;
   assign ext1_sii_reqbypass = niu_sii_reqbypass;
   assign ext1_sii_datareq = niu_sii_datareq;
   assign ext1_sii_datareq16 = niu_sii_datareq16; 
   assign ext1_sii_data[127:0] = niu_sii_data[127:0]; 
   assign ext1_sii_be[15:0] = niu_sii_be[15:0];
   assign ext1_sii_parity[7:0] = niu_sii_parity[7:0];
   assign ext1_sii_be_parity = niu_sii_be_parity;


 
   sii_ipcs_ctl         ipcs0   ( /*AUTOINST*/
				 // Outputs
				 .sii_ext_wrack_tag(sii_ext0_wrack_tag[3:0]), // Templated
				 .sii_ext_wrack_vld(sii_ext0_wrack_vld), // Templated
				 .sii_ext_wrack_parity(sii_ext0_wrack_parity), // Templated
				 .sii_ext_oqdq(sii_ext0_oqdq),	 // Templated
				 .sii_ext_bqdq(sii_ext0_bqdq),	 // Templated
				 .ipcs_ipcc_or_dep(ipcs_ipcc_or_dep0[15:0]), // Templated
				 .ipcs_ipcc_by_dep(ipcs_ipcc_by_dep0[15:0]), // Templated
				 .ipcs_ipcc_add_or(ipcs_ipcc_add_or0), // Templated
				 .ipcs_ipcc_add_by(ipcs_ipcc_add_by0), // Templated
				 .ipdohq_din(ipdohq0_din[`SII_IPD_HDR_RF_DATAWIDTH - 1:0]), // Templated
				 .ipdbhq_din(ipdbhq0_din[`SII_IPD_HDR_RF_DATAWIDTH - 1:0]), // Templated
				 .ipdodq_din(ipdodq0_din[`SII_IPD_DATA_RF_DATAWIDTH - 1:0]), // Templated
				 .ipdbdq_din(ipdbdq0_din[`SII_IPD_DATA_RF_DATAWIDTH - 1:0]), // Templated
				 .ipcs_ipdohq_wr_addr(ipcs_ipdohq0_wr_addr[`SII_IPD_HDR_RF_ADDRWIDTH - 1:0]), // Templated
				 .ipcs_ipdohq_wr_en(ipcs_ipdohq0_wr_en), // Templated
				 .ipcs_ipdbhq_wr_addr(ipcs_ipdbhq0_wr_addr[`SII_IPD_HDR_RF_ADDRWIDTH - 1:0]), // Templated
				 .ipcs_ipdbhq_wr_en(ipcs_ipdbhq0_wr_en), // Templated
				 .ipcs_ipdodq_wr_addr(ipcs_ipdodq0_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH - 1:0]), // Templated
				 .ipcs_ipdodq_wr_en(ipcs_ipdodq0_wr_en), // Templated
				 .ipcs_ipdbdq_wr_addr(ipcs_ipdbdq0_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH - 1:0]), // Templated
				 .ipcs_ipdbdq_wr_en(ipcs_ipdbdq0_wr_en), // Templated
				 .scan_out(ipcs0_scanout),	 // Templated
				 // Inputs
				 .ext_sii_hdr_vld(ext0_sii_hdr_vld), // Templated
				 .ext_sii_reqbypass(ext0_sii_reqbypass), // Templated
				 .ext_sii_datareq(ext0_sii_datareq), // Templated
				 .ext_sii_datareq16(ext0_sii_datareq16), // Templated
				 .ext_sii_data(ext0_sii_data[127:0]), // Templated
				 .ext_sii_be(ext0_sii_be[15:0]), // Templated
				 .ext_sii_parity(ext0_sii_parity[7:0]), // Templated
				 .ext_sii_be_parity(ext0_sii_be_parity), // Templated
				 .ncu_sii_ctag_uei(ncu_sii_ctag_uei0), // Templated
				 .ncu_sii_ctag_cei(ncu_sii_ctag_cei0), // Templated
				 .ncu_sii_a_pei(ncu_sii_a_pei0), // Templated
				 .ncu_sii_d_pei(ncu_sii_d_pei0), // Templated
				 .ipcc_ipcs_or_go_lv(ipcc_ipcs_or_go_lv0), // Templated
				 .ipcc_ipcs_by_go_lv(ipcc_ipcs_by_go_lv0), // Templated
				 .ipcc_ipcs_or_ptr(ipcc_ipcs_or_ptr0[3:0]), // Templated
				 .ipcc_ipcs_by_ptr(ipcc_ipcs_by_ptr0[3:0]), // Templated
				 .ipcc_ipcs_dmu_tag(ipcc_ipcs_dmu_tag[3:0]),
				 .ipcc_ipcs_dmu_wrack_p(ipcc_ipcs_dmu_wrack_p),
				 .ipcc_ipcs_wrack_lv(ipcc_ipcs_wrack_lv),
				 .dmu_mode(dmu_mode0),		 // Templated
				 .iol2clk(iol2clk),
				 .scan_in(ipcs0_scanin),	 // Templated
				 .tcu_scan_en(tcu_scan_en),
				 .tcu_dbr_gateoff(tcu_dbr_gateoff),
				 .tcu_aclk(aclk),		 // Templated
				 .tcu_bclk(bclk),		 // Templated
				 .tcu_pce_ov(tcu_pce_ov),
				 .tcu_clk_stop(ccu_soc6io_clk_stop), // Templated
				 .sii_mb1_ipdodq_wr_en(sii_mb1_ipdodq0_wr_en), // Templated
				 .sii_mb1_ipdbdq_wr_en(sii_mb1_ipdbdq0_wr_en), // Templated
				 .sii_mb1_ipdohq_wr_en(sii_mb1_ipdohq0_wr_en), // Templated
				 .sii_mb1_ipdbhq_wr_en(sii_mb1_ipdbhq0_wr_en), // Templated
				 .sii_mb1_run_r(sii_mb1_run_r),
				 .sii_mb1_wr_addr(sii_mb1_wr_addr[5:0]),
				 .sii_mb1_wdata(sii_mb1_wdata[7:0]));

   
   sii_ipcs_ctl         ipcs1   ( /*AUTOINST*/
				 // Outputs
				 .sii_ext_wrack_tag(sii_ext1_wrack_tag[3:0]), // Templated
				 .sii_ext_wrack_vld(sii_ext1_wrack_vld), // Templated
				 .sii_ext_wrack_parity(sii_ext1_wrack_parity), // Templated
				 .sii_ext_oqdq(sii_ext1_oqdq),	 // Templated
				 .sii_ext_bqdq(sii_ext1_bqdq),	 // Templated
				 .ipcs_ipcc_or_dep(ipcs_ipcc_or_dep1[15:0]), // Templated
				 .ipcs_ipcc_by_dep(ipcs_ipcc_by_dep1[15:0]), // Templated
				 .ipcs_ipcc_add_or(ipcs_ipcc_add_or1), // Templated
				 .ipcs_ipcc_add_by(ipcs_ipcc_add_by1), // Templated
				 .ipdohq_din(ipdohq1_din[`SII_IPD_HDR_RF_DATAWIDTH - 1:0]), // Templated
				 .ipdbhq_din(ipdbhq1_din[`SII_IPD_HDR_RF_DATAWIDTH - 1:0]), // Templated
				 .ipdodq_din(ipdodq1_din[`SII_IPD_DATA_RF_DATAWIDTH - 1:0]), // Templated
				 .ipdbdq_din(ipdbdq1_din[`SII_IPD_DATA_RF_DATAWIDTH - 1:0]), // Templated
				 .ipcs_ipdohq_wr_addr(ipcs_ipdohq1_wr_addr[`SII_IPD_HDR_RF_ADDRWIDTH - 1:0]), // Templated
				 .ipcs_ipdohq_wr_en(ipcs_ipdohq1_wr_en), // Templated
				 .ipcs_ipdbhq_wr_addr(ipcs_ipdbhq1_wr_addr[`SII_IPD_HDR_RF_ADDRWIDTH - 1:0]), // Templated
				 .ipcs_ipdbhq_wr_en(ipcs_ipdbhq1_wr_en), // Templated
				 .ipcs_ipdodq_wr_addr(ipcs_ipdodq1_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH - 1:0]), // Templated
				 .ipcs_ipdodq_wr_en(ipcs_ipdodq1_wr_en), // Templated
				 .ipcs_ipdbdq_wr_addr(ipcs_ipdbdq1_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH - 1:0]), // Templated
				 .ipcs_ipdbdq_wr_en(ipcs_ipdbdq1_wr_en), // Templated
				 .scan_out(ipcs1_scanout),	 // Templated
				 // Inputs
				 .ext_sii_hdr_vld(ext1_sii_hdr_vld), // Templated
				 .ext_sii_reqbypass(ext1_sii_reqbypass), // Templated
				 .ext_sii_datareq(ext1_sii_datareq), // Templated
				 .ext_sii_datareq16(ext1_sii_datareq16), // Templated
				 .ext_sii_data(ext1_sii_data[127:0]), // Templated
				 .ext_sii_be(ext1_sii_be[15:0]), // Templated
				 .ext_sii_parity(ext1_sii_parity[7:0]), // Templated
				 .ext_sii_be_parity(ext1_sii_be_parity), // Templated
				 .ncu_sii_ctag_uei(ncu_sii_ctag_uei1), // Templated
				 .ncu_sii_ctag_cei(ncu_sii_ctag_cei1), // Templated
				 .ncu_sii_a_pei(ncu_sii_a_pei1), // Templated
				 .ncu_sii_d_pei(ncu_sii_d_pei1), // Templated
				 .ipcc_ipcs_or_go_lv(ipcc_ipcs_or_go_lv1), // Templated
				 .ipcc_ipcs_by_go_lv(ipcc_ipcs_by_go_lv1), // Templated
				 .ipcc_ipcs_or_ptr(ipcc_ipcs_or_ptr1[3:0]), // Templated
				 .ipcc_ipcs_by_ptr(ipcc_ipcs_by_ptr1[3:0]), // Templated
				 .ipcc_ipcs_dmu_tag(ipcc_ipcs_dmu_tag[3:0]),
				 .ipcc_ipcs_dmu_wrack_p(ipcc_ipcs_dmu_wrack_p),
				 .ipcc_ipcs_wrack_lv(ipcc_ipcs_wrack_lv),
				 .dmu_mode(dmu_mode1),		 // Templated
				 .iol2clk(iol2clk),
				 .scan_in(ipcs1_scanin),	 // Templated
				 .tcu_scan_en(tcu_scan_en),
				 .tcu_dbr_gateoff(tcu_dbr_gateoff),
				 .tcu_aclk(aclk),		 // Templated
				 .tcu_bclk(bclk),		 // Templated
				 .tcu_pce_ov(tcu_pce_ov),
				 .tcu_clk_stop(ccu_soc6io_clk_stop), // Templated
				 .sii_mb1_ipdodq_wr_en(sii_mb1_ipdodq1_wr_en), // Templated
				 .sii_mb1_ipdbdq_wr_en(sii_mb1_ipdbdq1_wr_en), // Templated
				 .sii_mb1_ipdohq_wr_en(sii_mb1_ipdohq1_wr_en), // Templated
				 .sii_mb1_ipdbhq_wr_en(sii_mb1_ipdbhq1_wr_en), // Templated
				 .sii_mb1_run_r(sii_mb1_run_r),
				 .sii_mb1_wr_addr(sii_mb1_wr_addr[5:0]),
				 .sii_mb1_wdata(sii_mb1_wdata[7:0]));

// ========= Inbound Packet from DMU/ENT ========

// ========= Inbound Packet from DMU ========
   n2_com_dp_64x80_cust ipdodq0_h (           // DMU Ordered DataPayload[127:0],BE[15:0] wSrC1r1w144x64d - 16 entries
			     .scan_in(ipdodq0_h_scanin),
			     .scan_out(ipdodq0_h_scanout),
			     .wrclk (iol2clk),     
			     .rdclk (l2clk),     
			     .din   (ipdodq0_din[`SII_IPD_DATA_RF_DATAWIDTH-1:`SII_IPD_DATA_RF_DATAWIDTH_H] ),
			     .wr_adr (ipcs_ipdodq0_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH-1:0] ),
			     .wr_en (ipcs_ipdodq0_wr_en),
			     .rd_adr (ipcc_ipdodq0_rd_addr_m[`SII_IPD_DATA_RF_ADDRWIDTH-1:0] ),
			     .rd_en (ipcc_ipdodq0_rd_en_m),       
			     .rd_pce (rd_pce),
			     .wr_pce (wr_pce),
			     .bist_clk_mux_sel(bist_clk_mux_sel),
                             .tcu_se_scancollar_in(tcu_se_scancollar_in),
                             .tcu_se_scancollar_out(tcu_se_scancollar_out),
			     .tcu_array_wr_inhibit(array_wr_inhibit),
			     .dout (ipdodq0_dout[`SII_IPD_DATA_RF_DATAWIDTH-1:`SII_IPD_DATA_RF_DATAWIDTH_H]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk)		
		    );
   
   n2_com_dp_64x80_cust ipdodq0_l (           // DMU Ordered DataPayload[127:0],BE[15:0] wSrC1r1w144x64d - 16 entries
			     .scan_in(ipdodq0_l_scanin),
			     .scan_out(ipdodq0_l_scanout),
			     .wrclk (iol2clk),     
			     .rdclk (l2clk),     
			     .din   (ipdodq0_din[`SII_IPD_DATA_RF_DATAWIDTH_H-1:0] ),
			     .wr_adr (ipcs_ipdodq0_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH-1:0] ),
			     .wr_en (ipcs_ipdodq0_wr_en),
			     .rd_adr (ipcc_ipdodq0_rd_addr_m[`SII_IPD_DATA_RF_ADDRWIDTH-1:0] ),
			     .rd_en (ipcc_ipdodq0_rd_en_m),       
			     .rd_pce (rd_pce),
			     .wr_pce (wr_pce),
			     .bist_clk_mux_sel(bist_clk_mux_sel),
                             .tcu_se_scancollar_in(tcu_se_scancollar_in),
                             .tcu_se_scancollar_out(tcu_se_scancollar_out),
			     .tcu_array_wr_inhibit(array_wr_inhibit),
			     .dout (ipdodq0_dout[`SII_IPD_DATA_RF_DATAWIDTH_H-1:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk)		
		    );
   
       	       
       	       
   n2_com_dp_64x80_cust ipdbdq0_h (           // DMU Bypass  DataPayload[127:0],BE[15:0] wSrC1r1w144x64d - 16 entries 
			     .scan_in(ipdbdq0_h_scanin),
			     .scan_out(ipdbdq0_h_scanout),
			     .wrclk (iol2clk),     
			     .rdclk (l2clk),     
			     .din   (ipdbdq0_din[`SII_IPD_DATA_RF_DATAWIDTH-1:`SII_IPD_DATA_RF_DATAWIDTH_H] ), 
			     .wr_adr (ipcs_ipdbdq0_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH-1:0] ), 
			     .wr_en (ipcs_ipdbdq0_wr_en),      
			     .rd_adr (ipcc_ipdbdq0_rd_addr_m[`SII_IPD_DATA_RF_ADDRWIDTH-1:0] ), 
			     .rd_en (ipcc_ipdbdq0_rd_en_m),       
			     .rd_pce (rd_pce),
			     .wr_pce (wr_pce),
			     .bist_clk_mux_sel(bist_clk_mux_sel),
                             .tcu_se_scancollar_in(tcu_se_scancollar_in),
                             .tcu_se_scancollar_out(tcu_se_scancollar_out),
			     .tcu_array_wr_inhibit(array_wr_inhibit),
			     .dout (ipdbdq0_dout[`SII_IPD_DATA_RF_DATAWIDTH-1:`SII_IPD_DATA_RF_DATAWIDTH_H]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk)
                      );
       	       
   n2_com_dp_64x80_cust ipdbdq0_l (           // DMU Bypass  DataPayload[127:0],BE[15:0] wSrC1r1w144x64d - 16 entries 
			     .scan_in(ipdbdq0_l_scanin),
			     .scan_out(ipdbdq0_l_scanout),
			     .wrclk (iol2clk),     
			     .rdclk (l2clk),     
			     .din   (ipdbdq0_din[`SII_IPD_DATA_RF_DATAWIDTH_H-1:0] ), 
			     .wr_adr (ipcs_ipdbdq0_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH-1:0] ), 
			     .wr_en (ipcs_ipdbdq0_wr_en),      
			     .rd_adr (ipcc_ipdbdq0_rd_addr_m[`SII_IPD_DATA_RF_ADDRWIDTH-1:0] ), 
			     .rd_en (ipcc_ipdbdq0_rd_en_m),       
			     .rd_pce (rd_pce),
			     .wr_pce (wr_pce),
			     .bist_clk_mux_sel(bist_clk_mux_sel),
                             .tcu_se_scancollar_in(tcu_se_scancollar_in),
                             .tcu_se_scancollar_out(tcu_se_scancollar_out),
			     .tcu_array_wr_inhibit(array_wr_inhibit),
			     .dout (ipdbdq0_dout[`SII_IPD_DATA_RF_DATAWIDTH_H-1:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk)
                      );
       	       
   n2_com_dp_16x72_cust   ipdohq0 (           // DMU Ordered Header[61:0] wSrC1r1w62x16d - 16 entries
			     .scan_in(ipdohq0_scanin),
			     .scan_out(ipdohq0_scanout),
			     .wrclk (iol2clk),     
			     .rdclk (l2clk),     
			     .din   (ipdohq0_din[`SII_IPD_HDR_RF_DATAWIDTH-1:0] ), 
			     .wr_adr (ipcs_ipdohq0_wr_addr[`SII_IPD_HDR_RF_ADDRWIDTH-1:0] ),  
			     .wr_en (ipcs_ipdohq0_wr_en),
			     .rd_adr (ipcc_ipdohq0_rd_addr_m[`SII_IPD_HDR_RF_ADDRWIDTH-1:0] ),
			     .rd_en ( ipcc_ipdohq0_rd_en_m),      
			     .rd_pce (rd_pce),
			     .wr_pce (wr_pce),
			     .bist_clk_mux_sel(bist_clk_mux_sel),
                             .tcu_se_scancollar_in(tcu_se_scancollar_in),
                             .tcu_se_scancollar_out(tcu_se_scancollar_out),
			     .tcu_array_wr_inhibit(array_wr_inhibit),
			     .dout (ipdohq0_dout[`SII_IPD_HDR_RF_DATAWIDTH-1:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk)
                      );
       	       
   n2_com_dp_16x72_cust  ipdbhq0 (           // DMU Bypass Header[61:0]  wSrC1r1w62x16d - 16 entries
			     .scan_in(ipdbhq0_scanin),
			     .scan_out(ipdbhq0_scanout),
			     .wrclk (iol2clk),     
			     .rdclk (l2clk),     
			     .din   (ipdbhq0_din[`SII_IPD_HDR_RF_DATAWIDTH-1:0] ), 
			     .wr_adr (ipcs_ipdbhq0_wr_addr[`SII_IPD_HDR_RF_ADDRWIDTH-1:0] ), 
			     .wr_en (ipcs_ipdbhq0_wr_en),       
			     .rd_adr (ipcc_ipdbhq0_rd_addr_m[`SII_IPD_HDR_RF_ADDRWIDTH-1:0] ),  
			     .rd_en (ipcc_ipdbhq0_rd_en_m),       
			     .rd_pce (rd_pce),
			     .wr_pce (wr_pce),
			     .bist_clk_mux_sel(bist_clk_mux_sel),
                             .tcu_se_scancollar_in(tcu_se_scancollar_in),
                             .tcu_se_scancollar_out(tcu_se_scancollar_out),
			     .tcu_array_wr_inhibit(array_wr_inhibit),
			     .dout (ipdbhq0_dout[`SII_IPD_HDR_RF_DATAWIDTH-1:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk)
   
                   );


// ========= Inbound Packet from DMU ========
   sii_ipcc_dp ipcc_dp (/*AUTOINST*/
			// Outputs
			.ipcc_data_all0	(ipcc_data_all0[89:0]),
			.ipcc_data_all1	(ipcc_data_all1[89:0]),
			.ipcc_data_all2	(ipcc_data_all2[89:0]),
			.ipcc_data_all3	(ipcc_data_all3[89:0]),
			.sii_mb1_read_data(sii_mb1_read_data[77:0]),
			.ipcc_dp_par_data(ipcc_dp_par_data[84:0]),
			.curhdr		(curhdr[71:0]),
			.scan_out	(ipcc_dp_scanout),	 // Templated
			// Inputs
			.data_sel	(data_sel[2:0]),
			.gnt0_r_m	(gnt0_r_m[4:0]),
			.hdr_data_sel	(hdr_data_sel),
			.new_c		(new_c[5:0]),
			.data_parity_err(data_parity_err),
			.newhdr_l2	(newhdr_l2[63:0]),
			.newhdr_nc	(newhdr_nc[63:0]),
			.ipdohq0_dout	(ipdohq0_dout[71:0]),
			.ipdbhq0_dout	(ipdbhq0_dout[71:0]),
			.ipdohq1_dout	(ipdohq1_dout[71:0]),
			.ipdbhq1_dout	(ipdbhq1_dout[71:0]),
			.ipdodq0_dout	(ipdodq0_dout[152:0]),
			.ipdbdq0_dout	(ipdbdq0_dout[152:0]),
			.ipdodq1_dout	(ipdodq1_dout[152:0]),
			.ipdbdq1_dout	(ipdbdq1_dout[152:0]),
			.tcu_hdr	(tcu_hdr[71:0]),
			.tcu_data	(tcu_data[63:0]),
			.tcu_be_par	(tcu_be_par[11:0]),
			.scan_in	(ipcc_dp_scanin),	 // Templated
			.l2clk		(l2clk),
			.tcu_muxtest	(tcu_muxtest),
			.tcu_dectest	(tcu_dectest),
			.tcu_scan_en	(tcu_scan_en),
			.tcu_aclk	(aclk),			 // Templated
			.tcu_bclk	(bclk),			 // Templated
			.tcu_pce_ov	(tcu_pce_ov),
			.tcu_clk_stop	(ccu_soc4cmp_clk_stop),	 // Templated
			.sii_mb0_wdata	(sii_mb0_wdata[7:0]),
			.sii_mb0_run	(sii_mb0_run));

   sii_mb0_ctl mb0	 (/*AUTOINST*/
			  // Outputs
			  .sii_mb0_run	(sii_mb0_run),
			  .sii_mb0_addr	(sii_mb0_addr[5:0]),
			  .sii_mb0_wdata(sii_mb0_wdata[7:0]),
			  .sii_mb0_wr_en(sii_mb0_wr_en),
			  .sii_mb0_rd_en(sii_mb0_rd_en),
			  .sii_mb0_ind_wr_en(sii_mb0_ind_wr_en),
			  .sii_mb0_ind_rd_en(sii_mb0_ind_rd_en),
			  .sii_mb0_done	(sii_mb0_done),
			  .sii_mb0_fail	(sii_mb0_fail),
			  .scan_out	(mb0_scanout),		 // Templated
			  // Inputs
			  .l2clk	(l2clk),
			  .tcu_scan_en	(tcu_scan_en),
			  .scan_in	(mb0_scanin),		 // Templated
			  .tcu_aclk	(aclk),			 // Templated
			  .tcu_bclk	(bclk),			 // Templated
			  .tcu_pce_ov	(tcu_pce_ov),
			  .tcu_clk_stop	(ccu_soc4cmp_clk_stop),	 // Templated
			  .tcu_sii_mb0_start(tcu_sii_mb0_start),
			  .sii_mb0_bisi_mode(sii_mb0_bisi_mode),
			  .sii_mb0_user_mode(tcu_mbist_user_mode), // Templated
			  .sii_mb0_ild0_fail(sii_mb0_ild0_fail[1:0]),
			  .sii_mb0_ild1_fail(sii_mb0_ild1_fail[1:0]),
			  .sii_mb0_ild2_fail(sii_mb0_ild2_fail[1:0]),
			  .sii_mb0_ild3_fail(sii_mb0_ild3_fail[1:0]),
			  .sii_mb0_ild4_fail(sii_mb0_ild4_fail[1:0]),
			  .sii_mb0_ild5_fail(sii_mb0_ild5_fail[1:0]),
			  .sii_mb0_ild6_fail(sii_mb0_ild6_fail[1:0]),
			  .sii_mb0_ild7_fail(sii_mb0_ild7_fail[1:0]),
			  .sii_mb0_ind_fail(sii_mb0_ind_fail[1:0]));
   

    sii_mb1_ctl mb1 (/*AUTOINST*/
		     // Outputs
		     .sii_mb1_run	(sii_mb1_run),
		     .sii_mb1_addr	(sii_mb1_addr[5:0]),
		     .sii_mb1_wr_addr	(sii_mb1_wr_addr[5:0]),
		     .sii_mb1_1of4ipd_sel(sii_mb1_1of4ipd_sel[3:0]),
		     .sii_mb1_ipd_data_or_hdr_sel(sii_mb1_ipd_data_or_hdr_sel),
		     .sii_mb1_ipd_data_hibits_sel(sii_mb1_ipd_data_hibits_sel),
		     .sii_mb1_wdata	(sii_mb1_wdata[7:0]),
		     .sii_mb1_ipdodq0_wr_en(sii_mb1_ipdodq0_wr_en),
		     .sii_mb1_ipdodq0_rd_en(sii_mb1_ipdodq0_rd_en),
		     .sii_mb1_ipdodq1_wr_en(sii_mb1_ipdodq1_wr_en),
		     .sii_mb1_ipdodq1_rd_en(sii_mb1_ipdodq1_rd_en),
		     .sii_mb1_ipdbdq0_wr_en(sii_mb1_ipdbdq0_wr_en),
		     .sii_mb1_ipdbdq0_rd_en(sii_mb1_ipdbdq0_rd_en),
		     .sii_mb1_ipdbdq1_wr_en(sii_mb1_ipdbdq1_wr_en),
		     .sii_mb1_ipdbdq1_rd_en(sii_mb1_ipdbdq1_rd_en),
		     .sii_mb1_ipdohq0_wr_en(sii_mb1_ipdohq0_wr_en),
		     .sii_mb1_ipdohq0_rd_en(sii_mb1_ipdohq0_rd_en),
		     .sii_mb1_ipdohq1_wr_en(sii_mb1_ipdohq1_wr_en),
		     .sii_mb1_ipdohq1_rd_en(sii_mb1_ipdohq1_rd_en),
		     .sii_mb1_ipdbhq0_wr_en(sii_mb1_ipdbhq0_wr_en),
		     .sii_mb1_ipdbhq0_rd_en(sii_mb1_ipdbhq0_rd_en),
		     .sii_mb1_ipdbhq1_wr_en(sii_mb1_ipdbhq1_wr_en),
		     .sii_mb1_ipdbhq1_rd_en(sii_mb1_ipdbhq1_rd_en),
		     .sii_mb1_done	(sii_mb1_done),
		     .sii_mb1_fail	(sii_mb1_fail),
		     .scan_out		(mb1_scanout),		 // Templated
		     // Inputs
		     .l2clk		(l2clk),
		     .tcu_scan_en	(tcu_scan_en),
		     .scan_in		(mb1_scanin),		 // Templated
		     .tcu_aclk		(aclk),			 // Templated
		     .tcu_bclk		(bclk),			 // Templated
		     .tcu_pce_ov	(tcu_pce_ov),
		     .tcu_clk_stop	(ccu_soc6io_clk_stop),	 // Templated
		     .tcu_sii_mb1_start	(tcu_sii_mb1_start),
		     .sii_mb1_bisi_mode	(sii_mb1_bisi_mode),
		     .sii_mb1_user_mode	(tcu_mbist_user_mode),	 // Templated
		     .sii_mb1_read_data	(sii_mb1_read_data[77:0]));

clkgen_sii_cmp clkgen_cmp ( /*AUTOINST*/
			   // Outputs
			   .l2clk	(l2clk),
			   .aclk	(aclk),
			   .bclk	(bclk),
			   .scan_out	(clkgen_sii_cmp_scanout), // Templated
			   .aclk_wmr	(cmpclkgen_aclk_wmr_unused), // Templated
			   .pce_ov	(pce_ov),
			   .wmr_protect	(cmpclkgen_wmr_protect_unused), // Templated
			   .wmr_	(cmpclkgen_wmr_unused),	 // Templated
			   .por_	(cmpclkgen_por_unused),	 // Templated
			   .cmp_slow_sync_en(cmp_io_sync_en_in), // Templated
			   .slow_cmp_sync_en(io_cmp_sync_en_in), // Templated
			   .array_wr_inhibit(array_wr_inhibit_cmp), // Templated
			   // Inputs
			   .tcu_atpg_mode(tcu_atpg_mode),
			   .tcu_wr_inhibit(tcu_wr_inhibit),
			   .tcu_clk_stop(tcu_sii_clk_stop),	 // Templated
			   .tcu_pce_ov	(tcu_pce_ov_in),	 // Templated
			   .rst_wmr_protect(rst_wmr_protect),
			   .rst_wmr_	(rst_wmr_),
			   .rst_por_	(rst_por_),
			   .ccu_cmp_slow_sync_en(ccu_cmp_slow_sync_en),
			   .ccu_slow_cmp_sync_en(ccu_slow_cmp_sync_en),
			   .tcu_div_bypass(tcu_div_bypass),
			   .ccu_div_ph	(1'b1),			 // Templated
			   .cluster_div_en(1'b0),		 // Templated
			   .gclk	(gclk),
			   .cluster_arst_l(cluster_arst_l),
			   .ccu_serdes_dtm(ccu_serdes_dtm),
			   .clk_ext	(clk_ext),
			   .tcu_scan_en	(tcu_scan_en),
			   .scan_in	(clkgen_sii_cmp_scanin), // Templated
			   .tcu_aclk	(tcu_aclk),
			   .tcu_bclk	(tcu_bclk));

clkgen_sii_io clkgen_io ( /*AUTOINST*/
			 // Outputs
			 .l2clk		(iol2clk),		 // Templated
			 .aclk		(ioclkgen_aclk_unused),	 // Templated
			 .bclk		(ioclkgen_bclk_unused),	 // Templated
			 .scan_out	(clkgen_sii_io_scanout), // Templated
			 .aclk_wmr	(ioclkgen_aclk_wmr_unused), // Templated
			 .pce_ov	(ioclkgen_pce_ov_unused), // Templated
			 .wmr_protect	(ioclkgen_wmr_protect_unused), // Templated
			 .wmr_		(ioclkgen_wmr_unused),	 // Templated
			 .por_		(ioclkgen_por_unused),	 // Templated
			 .cmp_slow_sync_en(ioclkgen_cmp_slow_sync_en_unused), // Templated
			 .slow_cmp_sync_en(ioclkgen_slow_cmp_sync_en_unused), // Templated
			 .array_wr_inhibit(array_wr_inhibit_io), // Templated
			 // Inputs
			 .tcu_atpg_mode	(tcu_atpg_mode),
			 .tcu_wr_inhibit(tcu_wr_inhibit),
			 .tcu_clk_stop	(tcu_sii_io_clk_stop),	 // Templated
			 .tcu_pce_ov	(tcu_pce_ov_in),	 // Templated
			 .rst_wmr_protect(rst_wmr_protect),
			 .rst_wmr_	(rst_wmr_),
			 .rst_por_	(rst_por_),
			 .ccu_cmp_slow_sync_en(ccu_cmp_slow_sync_en),
			 .ccu_slow_cmp_sync_en(ccu_slow_cmp_sync_en),
			 .tcu_div_bypass(tcu_div_bypass),
			 .ccu_div_ph	(ccu_io_out),		 // Templated
			 .cluster_div_en(1'b1),			 // Templated
			 .gclk		(gclk),
			 .cluster_arst_l(cluster_arst_l),
			 .ccu_serdes_dtm(ccu_serdes_dtm),
			 .clk_ext	(clk_ext),
			 .tcu_scan_en	(tcu_scan_en),
			 .scan_in	(clkgen_sii_io_scanin),	 // Templated
			 .tcu_aclk	(tcu_aclk),
			 .tcu_bclk	(tcu_bclk));

sii_stgsio_dp stgsio_dp (/*AUTOINST*/
			 // Outputs
			 .sio_sii_opcc_ipcc_dmu_or_deq_r(sio_sii_opcc_ipcc_dmu_or_deq_r),
			 .sio_sii_opcc_ipcc_dmu_by_deq_r(sio_sii_opcc_ipcc_dmu_by_deq_r),
			 .sio_sii_opcc_ipcc_niu_or_deq_r(sio_sii_opcc_ipcc_niu_or_deq_r),
			 .sio_sii_opcc_ipcc_niu_by_deq_r(sio_sii_opcc_ipcc_niu_by_deq_r),
			 .sio_sii_opcc_ipcc_dmu_by_cnt_r(sio_sii_opcc_ipcc_dmu_by_cnt_r[3:0]),
			 .sio_sii_opcc_ipcc_niu_by_cnt_r(sio_sii_opcc_ipcc_niu_by_cnt_r[3:0]),
			 .sio_sii_olc0_ilc0_dequeue_r(sio_sii_olc0_ilc0_dequeue_r),
			 .sio_sii_olc1_ilc1_dequeue_r(sio_sii_olc1_ilc1_dequeue_r),
			 .sio_sii_olc2_ilc2_dequeue_r(sio_sii_olc2_ilc2_dequeue_r),
			 .sio_sii_olc3_ilc3_dequeue_r(sio_sii_olc3_ilc3_dequeue_r),
			 .sio_sii_olc4_ilc4_dequeue_r(sio_sii_olc4_ilc4_dequeue_r),
			 .sio_sii_olc5_ilc5_dequeue_r(sio_sii_olc5_ilc5_dequeue_r),
			 .sio_sii_olc6_ilc6_dequeue_r(sio_sii_olc6_ilc6_dequeue_r),
			 .sio_sii_olc7_ilc7_dequeue_r(sio_sii_olc7_ilc7_dequeue_r),
			 .scan_out	(stgsio_dp_scanout),	 // Templated
			 // Inputs
			 .l2clk		(l2clk),
			 .sio_sii_opcc_ipcc_dmu_or_deq(sio_sii_opcc_ipcc_dmu_or_deq),
			 .sio_sii_opcc_ipcc_dmu_by_deq(sio_sii_opcc_ipcc_dmu_by_deq),
			 .sio_sii_opcc_ipcc_niu_or_deq(sio_sii_opcc_ipcc_niu_or_deq),
			 .sio_sii_opcc_ipcc_niu_by_deq(sio_sii_opcc_ipcc_niu_by_deq),
			 .sio_sii_opcc_ipcc_dmu_by_cnt(sio_sii_opcc_ipcc_dmu_by_cnt[3:0]),
			 .sio_sii_opcc_ipcc_niu_by_cnt(sio_sii_opcc_ipcc_niu_by_cnt[3:0]),
			 .sio_sii_olc0_ilc0_dequeue(sio_sii_olc0_ilc0_dequeue),
			 .sio_sii_olc1_ilc1_dequeue(sio_sii_olc1_ilc1_dequeue),
			 .sio_sii_olc2_ilc2_dequeue(sio_sii_olc2_ilc2_dequeue),
			 .sio_sii_olc3_ilc3_dequeue(sio_sii_olc3_ilc3_dequeue),
			 .sio_sii_olc4_ilc4_dequeue(sio_sii_olc4_ilc4_dequeue),
			 .sio_sii_olc5_ilc5_dequeue(sio_sii_olc5_ilc5_dequeue),
			 .sio_sii_olc6_ilc6_dequeue(sio_sii_olc6_ilc6_dequeue),
			 .sio_sii_olc7_ilc7_dequeue(sio_sii_olc7_ilc7_dequeue),
			 .tcu_muxtest	(tcu_muxtest),
			 .tcu_dectest	(tcu_dectest),
			 .tcu_scan_en	(tcu_scan_en),
			 .scan_in	(stgsio_dp_scanin),	 // Templated
			 .tcu_aclk	(aclk),			 // Templated
			 .tcu_bclk	(bclk),			 // Templated
			 .tcu_pce_ov	(tcu_pce_ov),
			 .tcu_clk_stop	(ccu_soc4cmp_clk_stop));	 // Templated
   
// ========= Inbound Packet from NIU ========

   n2_com_dp_64x80_cust ipdodq1_h (           // NIU Ordered DataPayload[127:0],BE[15:0] wSrC1r1w144x64d - 16 entries
			     .wrclk (iol2clk),     
			     .rdclk (l2clk),     
			     .din   (ipdodq1_din[`SII_IPD_DATA_RF_DATAWIDTH - 1:`SII_IPD_DATA_RF_DATAWIDTH_H] ), 
			     .wr_adr (ipcs_ipdodq1_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH - 1:0] ), 
			     .wr_en (ipcs_ipdodq1_wr_en),       
			     .rd_adr (ipcc_ipdodq1_rd_addr_m[`SII_IPD_DATA_RF_ADDRWIDTH - 1:0] ),  
			     .rd_en (ipcc_ipdodq1_rd_en_m),       
			     .rd_pce (rd_pce),
			     .wr_pce (wr_pce),
			     .bist_clk_mux_sel(bist_clk_mux_sel),
                             .tcu_se_scancollar_in(tcu_se_scancollar_in),
                             .tcu_se_scancollar_out(tcu_se_scancollar_out),
			     .tcu_array_wr_inhibit(array_wr_inhibit),
                             .scan_in (ipdodq1_h_scanin),
                             .scan_out (ipdodq1_h_scanout),
			     .dout (ipdodq1_dout[`SII_IPD_DATA_RF_DATAWIDTH - 1:`SII_IPD_DATA_RF_DATAWIDTH_H]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk)
					    ) ;
   
   n2_com_dp_64x80_cust ipdodq1_l (           // NIU Ordered DataPayload[127:0],BE[15:0] wSrC1r1w144x64d - 16 entries
			     .wrclk (iol2clk),     
			     .rdclk (l2clk),     
			     .din   (ipdodq1_din[`SII_IPD_DATA_RF_DATAWIDTH_H - 1:0] ), 
			     .wr_adr (ipcs_ipdodq1_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH - 1:0] ), 
			     .wr_en (ipcs_ipdodq1_wr_en),       
			     .rd_adr (ipcc_ipdodq1_rd_addr_m[`SII_IPD_DATA_RF_ADDRWIDTH - 1:0] ),  
			     .rd_en (ipcc_ipdodq1_rd_en_m),       
			     .rd_pce (rd_pce),
			     .wr_pce (wr_pce),
			     .bist_clk_mux_sel(bist_clk_mux_sel),
                             .scan_in (ipdodq1_l_scanin),
                             .scan_out (ipdodq1_l_scanout),
                             .tcu_se_scancollar_in(tcu_se_scancollar_in),
                             .tcu_se_scancollar_out(tcu_se_scancollar_out),
			     .tcu_array_wr_inhibit(array_wr_inhibit),
			     .dout (ipdodq1_dout[`SII_IPD_DATA_RF_DATAWIDTH_H - 1:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk)
					    ) ;
   
   
       	       
   n2_com_dp_64x80_cust ipdbdq1_h (           // NIU Bypass  DataPayload[127:0],BE[15:0] wSrC1r1w144x64d - 16 entries 
			     .wrclk (iol2clk),     
			     .rdclk (l2clk),     
			     .din   (ipdbdq1_din[`SII_IPD_DATA_RF_DATAWIDTH - 1:`SII_IPD_DATA_RF_DATAWIDTH_H] ), 
			     .wr_adr (ipcs_ipdbdq1_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH - 1:0] ),  
			     .wr_en (ipcs_ipdbdq1_wr_en),      
			     .rd_adr (ipcc_ipdbdq1_rd_addr_m[`SII_IPD_DATA_RF_ADDRWIDTH - 1:0] ), 
			     .rd_en (ipcc_ipdbdq1_rd_en_m),      
			     .rd_pce (rd_pce),
			     .wr_pce (wr_pce),
			     .bist_clk_mux_sel(bist_clk_mux_sel),
                             .scan_in (ipdbdq1_h_scanin),
                             .scan_out (ipdbdq1_h_scanout),
                             .tcu_se_scancollar_in(tcu_se_scancollar_in),
                             .tcu_se_scancollar_out(tcu_se_scancollar_out),
			     .tcu_array_wr_inhibit(array_wr_inhibit),
			     .dout (ipdbdq1_dout[`SII_IPD_DATA_RF_DATAWIDTH - 1:`SII_IPD_DATA_RF_DATAWIDTH_H]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk)
                      );
       	       
   n2_com_dp_64x80_cust ipdbdq1_l (           // NIU Bypass  DataPayload[127:0],BE[15:0] wSrC1r1w144x64d - 16 entries 
			     .wrclk (iol2clk),     
			     .rdclk (l2clk),     
			     .din   (ipdbdq1_din[`SII_IPD_DATA_RF_DATAWIDTH_H - 1:0] ), 
			     .wr_adr (ipcs_ipdbdq1_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH - 1:0] ),  
			     .wr_en (ipcs_ipdbdq1_wr_en),      
			     .rd_adr (ipcc_ipdbdq1_rd_addr_m[`SII_IPD_DATA_RF_ADDRWIDTH - 1:0] ), 
			     .rd_en (ipcc_ipdbdq1_rd_en_m),      
			     .rd_pce (rd_pce),
			     .wr_pce (wr_pce),
			     .bist_clk_mux_sel(bist_clk_mux_sel),
                             .tcu_se_scancollar_in(tcu_se_scancollar_in),
                             .tcu_se_scancollar_out(tcu_se_scancollar_out),
			     .tcu_array_wr_inhibit(array_wr_inhibit),
                             .scan_in (ipdbdq1_l_scanin),
                             .scan_out (ipdbdq1_l_scanout),
			     .dout (ipdbdq1_dout[`SII_IPD_DATA_RF_DATAWIDTH_H - 1:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk)
                      );
       	       
   n2_com_dp_16x72_cust  ipdohq1 (           // NIU Ordered Header[61:0] wSrC1r1w62x16d - 16 entries
			     .wrclk (iol2clk),     
			     .rdclk (l2clk),     
			     .din   (ipdohq1_din[`SII_IPD_HDR_RF_DATAWIDTH - 1:0] ), 
			     .wr_adr (ipcs_ipdohq1_wr_addr[`SII_IPD_HDR_RF_ADDRWIDTH - 1:0] ),     
			     .wr_en (ipcs_ipdohq1_wr_en),           
			     .rd_adr (ipcc_ipdohq1_rd_addr_m[`SII_IPD_HDR_RF_ADDRWIDTH - 1:0] ),   
			     .rd_en (ipcc_ipdohq1_rd_en_m),      
			     .rd_pce (rd_pce),
			     .wr_pce (wr_pce),
			     .bist_clk_mux_sel(bist_clk_mux_sel),
                             .tcu_se_scancollar_in(tcu_se_scancollar_in),
                             .tcu_se_scancollar_out(tcu_se_scancollar_out),
			     .tcu_array_wr_inhibit(array_wr_inhibit),
                             .scan_in (ipdohq1_scanin),
                             .scan_out (ipdohq1_scanout),
			     .dout (ipdohq1_dout[`SII_IPD_HDR_RF_DATAWIDTH - 1:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk)
                      );
       	       
   n2_com_dp_16x72_cust  ipdbhq1 (           // NIU Bypass Header[61:0]  wSrC1r1w62x16d - 16 entries
			     .wrclk (iol2clk),     
			     .rdclk (l2clk),     
			     .din   (ipdbhq1_din[`SII_IPD_HDR_RF_DATAWIDTH - 1:0] ), 
			     .wr_adr (ipcs_ipdbhq1_wr_addr[`SII_IPD_HDR_RF_ADDRWIDTH - 1:0] ),     
			     .wr_en (ipcs_ipdbhq1_wr_en),      
			     .rd_adr (ipcc_ipdbhq1_rd_addr_m[`SII_IPD_HDR_RF_ADDRWIDTH - 1:0] ),   
			     .rd_en (ipcc_ipdbhq1_rd_en_m),      
			     .rd_pce (rd_pce),
			     .wr_pce (wr_pce),
			     .bist_clk_mux_sel(bist_clk_mux_sel),
                             .scan_in (ipdbhq1_scanin),
                             .scan_out (ipdbhq1_scanout),
                             .tcu_se_scancollar_in(tcu_se_scancollar_in),
                             .tcu_se_scancollar_out(tcu_se_scancollar_out),
			     .tcu_array_wr_inhibit(array_wr_inhibit),
			     .dout (ipdbhq1_dout[`SII_IPD_HDR_RF_DATAWIDTH - 1:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk)
                      );

// ========= Inbound Packet from NIU ========


// =============== VERILOG-MODE AUTO TEMPLATES

   /*

    n2_com_dp_64x72_cust AUTO_TEMPLATE (           // DataPayload[63:0   ] or header,  wCrS1r1w64x48d - 16 entries
			     .wrclk (l2clk),     
			     .rdclk (l2clk),     
			     .wr_en (ipcc_indq_wr_en),     
			     .wr_adr (ipcc_indq_wr_addr[`SII_IND_RF_ADDRWIDTH - 1:0] ),
			     .rd_adr (inc_indq_rd_addr[`SII_IND_RF_ADDRWIDTH - 1:0] ), 
			     .rd_en (inc_indq_rd_en),    
                             .scan_in (indq_scanin),
                             .scan_out (indq_scanout),
			     .din  (ipcc_ind_data[`SII_IND_RF_DATAWIDTH - 1:0] ), 
			     .dout (indq_inc_dout[`SII_IND_RF_DATAWIDTH - 1:0]),
			     .bist_clk_mux_sel(tie_low),
			     .tcu_aclk(aclk),
			     .tcu_bclk(bclk),
			     .tcu_array_wr_inhibit(array_wr_inhibit_cmp),

                        );    

    n2_com_dp_32x82_cust AUTO_TEMPLATE (           // DataPayload[63:0],ECC[14:0]  wCrC1r1w78x32d - 4 entries 
			     .wrclk (l2clk),     
			     .rdclk (l2clk),     
			     .wr_en (ipcc_ildq_wr_en@_m),     
			     .wr_adr (ipcc_ildq_wr_addr@_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ), 
			     .rd_adr (ilc_ildq_rd_addr@_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ),
			     .rd_en (ilc_ildq_rd_en@_m),
                             .scan_in (ildq@_scanin),
                             .scan_out (ildq@_scanout),
			     .din  (ipcc_data_all_@[`SII_ILD_RF_DATAWIDTH - 1:0] ),
			     .dout (ildq_ild_dout@[`SII_ILD_RF_DATAWIDTH - 1:0]),
			     .bist_clk_mux_sel(tie_low),
			     .tcu_aclk (aclk),
			     .tcu_bclk (bclk),
			     .tcu_array_wr_inhibit(array_wr_inhibit_cmp),
                        );    

    //
    sii_ild_dp AUTO_TEMPLATE   (		// Miscellaneous muxes and datapath elements
                            
                                .sii_l2t_req (sii_l2t@_req[31:0]),
                                .sii_l2b_ecc (sii_l2b@_ecc[6:0]),
				.ild_ilc_curhdr(ild_ilc_curhdr@[63:0]),
                                .sii_mb0_ild_fail(sii_mb0_ild@_fail[1:0]),
                                .scan_out(ild@_scanout),

				// Inputs
                                .scan_in(ild@_scanin),
				.ilc_ild_de_sel(ilc_ild_de_sel@[1:0]),
				.ilc_ild_ldhdr(ilc_ild_ldhdr@[3:0]),
				.ilc_ild_addr_h(ilc_ild_addr_h@[3:0]),
				.ilc_ild_addr_lo(ilc_ild_addr_lo@[3:0]),
				.ilc_ild_hdr_sel(ilc_ild_hdr_sel@[1:0]),
				.ilc_ild_cyc_sel(ilc_ild_cyc_sel@[1:0]),
				.ilc_ild_newhdr(ilc_ild_newhdr@[63:0]),
                                .ipcc_data_out(ipcc_data_all_@[69:0]),
				.ildq_ild_dout(ildq_ild_dout@[`SII_ILD_RF_DATAWIDTH - 1:0]),
				.tcu_clk_stop (ccu_soc4cmp_clk_stop),
				.tcu_aclk     (aclk),
				.tcu_bclk     (bclk),
			
 			 );
    
   
 
    sii_ilc_ctl AUTO_TEMPLATE   (		// Controller In Core Domain
                             .scan_in(AUTO_TEMPLATE_scanin),
                             .scan_out(AUTO_TEMPLATE_scanout),
                             .l2clk (l2clk),
                             .l2t_sii_iq_dequeue (l2t@_sii_iq_dequeue),
                             .l2t_sii_wib_dequeue (l2t@_sii_wib_dequeue),
                             .sii_l2t_req_vld (sii_l2t@_req_vld),
                             .sii_dbg_l2t_req (sii_dbg1_l2t@_req[1:0]),
                             .sio_sii_olc_ilc_dequeue_r (sio_sii_olc@_ilc@_dequeue_r),
                                .ilc_ipcc_stop(ilc_ipcc_stop@),
                                .ilc_ipcc_dmu_wrm_dq(ilc_ipcc_dmu_wrm_dq@),
                                .ilc_ipcc_niu_wrm_dq(ilc_ipcc_niu_wrm_dq@),
                                .ilc_ipcc_dmu_wrm(ilc_ipcc_dmu_wrm@),
                                .ilc_ipcc_niu_wrm(ilc_ipcc_niu_wrm@),
				.ilc_ild_de_sel(ilc_ild_de_sel@[1:0]),
				.ilc_ild_hdr_sel(ilc_ild_hdr_sel@[1:0]),
				.ilc_ild_cyc_sel(ilc_ild_cyc_sel@[1:0]),
				.ilc_ild_newhdr(ilc_ild_newhdr@[63:0]),
				.ilc_ild_ldhdr(ilc_ild_ldhdr@[3:0]),
				.ilc_ild_addr_h(ilc_ild_addr_h@[3:0]),
				.ilc_ild_addr_lo(ilc_ild_addr_lo@[3:0]),
				.ilc_ildq_rd_addr_m(ilc_ildq_rd_addr@_m[`SII_ILD_RF_ADDRWIDTH - 1:0] ),
				.ilc_ildq_rd_en_m(ilc_ildq_rd_en@_m),
                                .scan_out(ilc@_scanout),

				// Inputs
                                .scan_in(ilc@_scanin),
				.ipcc_ildq_wr_addr(ipcc_ildq_wr_addr@[`SII_ILD_RF_ADDRWIDTH - 1:0]),
				.ipcc_ildq_wr_en (ipcc_ildq_wr_en@),
				.ipcc_ilc_cmd(ipcc_ilc_cmd@),
				.ipcc_data_58_56({ipcc_data_all_@c[63], ipcc_data_all_@c[59:56]}),
                                .ipcc_ilc_be(ipcc_data_all_@c[89:82]),
				.ild_ilc_curhdr(ild_ilc_curhdr@[63:0]),
				.tcu_clk_stop (ccu_soc4cmp_clk_stop),
				.tcu_aclk	(aclk),
				.tcu_bclk	(bclk),

 			 );
    
    sii_ipcc_dp AUTO_TEMPLATE   (		
                                 .scan_out (ipcc_dp_scanout),
                                 .scan_in  (ipcc_dp_scanin),
			         .tcu_clk_stop (ccu_soc4cmp_clk_stop),
				 .tcu_aclk 	(aclk),
				 .tcu_bclk 	(bclk),
                                 
             			 );

    sii_inc_ctl AUTO_TEMPLATE   (
                              	 .scan_in (inc_scanin),
                              	 .scan_out (inc_scanout),
			      	 .tcu_clk_stop (ccu_soc4cmp_clk_stop),
                                 .tcu_aclk      (aclk),
                                 .tcu_bclk      (bclk),


                         );
    
    
    sii_ipcc_ctl AUTO_TEMPLATE   (
                              	.scan_in (ipcc_scanin),
                              	.scan_out (ipcc_scanout),
                              	.ipdohq0_dout58(ipdohq0_dout[58]),
                              	.ipdbhq0_dout58(ipdbhq0_dout[58]),
                              	.ipdohq1_dout58(ipdohq1_dout[58]),
                              	.ipdbhq1_dout58(ipdbhq1_dout[58]),
                              	.dmu_or_bank_ext(ipdohq0_dout[6:4]),
                              	.dmu_by_bank_ext(ipdbhq0_dout[6:4]),
                              	.niu_or_bank_ext(ipdohq1_dout[6:4]),
                              	.niu_by_bank_ext(ipdbhq1_dout[6:4]),
				 .ncu_sii_ba01_in  (ncu_sii_ba01),
				 .ncu_sii_ba23_in  (ncu_sii_ba23),
				 .ncu_sii_ba45_in  (ncu_sii_ba45),
				 .ncu_sii_ba67_in  (ncu_sii_ba67),
				 .ncu_sii_pm_in  (ncu_sii_pm),
				 .ncu_sii_l2_idx_hash_en_in  (ncu_sii_l2_idx_hash_en),
			      	.tcu_clk_stop (ccu_soc4cmp_clk_stop),
                                .tcu_aclk      (aclk),
                                .tcu_bclk      (bclk),

    
                         );
   
    sii_ipcs_ctl AUTO_TEMPLATE   (
                            
    				.ipcs_ipcc_or_dep(ipcs_ipcc_or_dep@[15:0]),
				.ipcs_ipcc_by_dep(ipcs_ipcc_by_dep@[15:0]),
				.ipcs_ipcc_add_or(ipcs_ipcc_add_or@),
				.ipcs_ipcc_add_by(ipcs_ipcc_add_by@),
				.ipdohq_din(ipdohq@_din[`SII_IPD_HDR_RF_DATAWIDTH - 1:0]),
				.ipdbhq_din(ipdbhq@_din[`SII_IPD_HDR_RF_DATAWIDTH - 1:0]),
				.ipdodq_din(ipdodq@_din[`SII_IPD_DATA_RF_DATAWIDTH - 1:0]),
				.ipdbdq_din(ipdbdq@_din[`SII_IPD_DATA_RF_DATAWIDTH - 1:0]),
				.ipcs_ipdohq_wr_addr(ipcs_ipdohq@_wr_addr[`SII_IPD_HDR_RF_ADDRWIDTH - 1:0]),
				.ipcs_ipdohq_wr_en(ipcs_ipdohq@_wr_en),
				.ipcs_ipdbhq_wr_addr(ipcs_ipdbhq@_wr_addr[`SII_IPD_HDR_RF_ADDRWIDTH - 1:0]),
				.ipcs_ipdbhq_wr_en(ipcs_ipdbhq@_wr_en),
				.ipcs_ipdodq_wr_addr(ipcs_ipdodq@_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH - 1:0]),
				.ipcs_ipdodq_wr_en(ipcs_ipdodq@_wr_en),
				.ipcs_ipdbdq_wr_addr(ipcs_ipdbdq@_wr_addr[`SII_IPD_DATA_RF_ADDRWIDTH - 1:0]),
				.ipcs_ipdbdq_wr_en(ipcs_ipdbdq@_wr_en),
				.scan_out(ipcs@_scanout),
    
				// Inputs
				.scan_in(ipcs@_scanin),
                                .dmu_mode(dmu_mode@),
				.ext_sii_hdr_vld(ext@_sii_hdr_vld),
				.ext_sii_reqbypass(ext@_sii_reqbypass),
				.ext_sii_datareq(ext@_sii_datareq),
				.ext_sii_datareq16(ext@_sii_datareq16),
				.ext_sii_data(ext@_sii_data[127:0]),
				.ext_sii_be(ext@_sii_be[15:0]),
				.ext_sii_parity(ext@_sii_parity[7:0]),
				.ext_sii_be_parity(ext@_sii_be_parity),
                                .ncu_sii_ctag_uei(ncu_sii_ctag_uei@),
                                .ncu_sii_ctag_cei(ncu_sii_ctag_cei@),
                                .ncu_sii_a_pei(ncu_sii_a_pei@),
                                .ncu_sii_d_pei(ncu_sii_d_pei@), 
                                .sii_ext_wrack_vld(sii_ext@_wrack_vld),
                                .sii_ext_wrack_parity(sii_ext@_wrack_parity),
                                .sii_ext_wrack_tag(sii_ext@_wrack_tag[3:0]),
                                .sii_ext_oqdq(sii_ext@_oqdq),
                                .sii_ext_bqdq(sii_ext@_bqdq),
                                .sii_mb1_ipdohq_wr_en(sii_mb1_ipdohq@_wr_en),
                                .sii_mb1_ipdbhq_wr_en(sii_mb1_ipdbhq@_wr_en),
                                .sii_mb1_ipdodq_wr_en(sii_mb1_ipdodq@_wr_en),
                                .sii_mb1_ipdbdq_wr_en(sii_mb1_ipdbdq@_wr_en),
				.ipcc_ipcs_or_go_lv(ipcc_ipcs_or_go_lv@),
				.ipcc_ipcs_by_go_lv(ipcc_ipcs_by_go_lv@),
				.ipcc_ipcs_or_ptr(ipcc_ipcs_or_ptr@[3:0]),
				.ipcc_ipcs_by_ptr(ipcc_ipcs_by_ptr@[3:0]),        
				.tcu_clk_stop       (ccu_soc6io_clk_stop),
                                .tcu_aclk      (aclk),
                                .tcu_bclk      (bclk),

      
                                );
sii_mb0_ctl AUTO_TEMPLATE  (
                                .scan_in(mb0_scanin),
                                .scan_out (mb0_scanout),
				.tcu_clk_stop       (ccu_soc4cmp_clk_stop),
                                .tcu_aclk      (aclk),
                                .tcu_bclk      (bclk),
				.sii_mb0_user_mode(tcu_mbist_user_mode),
                           );
     
sii_mb1_ctl AUTO_TEMPLATE  (
                                .scan_in(mb1_scanin),
                                .scan_out (mb1_scanout),
				.tcu_clk_stop       (ccu_soc6io_clk_stop),
                                .tcu_aclk      (aclk),
                                .tcu_bclk      (bclk),
				.sii_mb1_user_mode(tcu_mbist_user_mode),
                           );
    
clkgen_sii_cmp AUTO_TEMPLATE  (
				.scan_in  (clkgen_sii_cmp_scanin),
				.scan_out  (clkgen_sii_cmp_scanout),
				.tcu_clk_stop(tcu_sii_clk_stop),
				.ccu_div_ph(1'b1),
				.cluster_div_en(1'b0),
				.tcu_pce_ov(tcu_pce_ov_in),
			
				//output
				.wmr_protect (cmpclkgen_wmr_protect_unused),
				.aclk_wmr (cmpclkgen_aclk_wmr_unused),
				.cmp_slow_sync_en   (cmp_io_sync_en_in),
				.slow_cmp_sync_en   (io_cmp_sync_en_in),
				.array_wr_inhibit (array_wr_inhibit_cmp),
				.wmr_(cmpclkgen_wmr_unused),
				.por_(cmpclkgen_por_unused),
			 	//.clk_stop (ccu_soc4cmp_clk_stop),	
				
                           );

clkgen_sii_io AUTO_TEMPLATE  (
                                .scan_in   (clkgen_sii_io_scanin),
                                .scan_out   (clkgen_sii_io_scanout),
                                .tcu_clk_stop(tcu_sii_io_clk_stop),
				.ccu_div_ph(ccu_io_out),
				.cluster_div_en(1'b1),
				.tcu_pce_ov(tcu_pce_ov_in),
                        
                                //output
				.wmr_protect (ioclkgen_wmr_protect_unused),
				.aclk (ioclkgen_aclk_unused),
				.bclk (ioclkgen_bclk_unused),
				.aclk_wmr (ioclkgen_aclk_wmr_unused),
				.pce_ov (ioclkgen_pce_ov_unused),
				.wmr_(ioclkgen_wmr_unused),
				.por_(ioclkgen_por_unused),
                                .cmp_slow_sync_en   (ioclkgen_cmp_slow_sync_en_unused),
                                .slow_cmp_sync_en   (ioclkgen_slow_cmp_sync_en_unused),
				.array_wr_inhibit (array_wr_inhibit_io),
                                //.clk_stop (ccu_soc6io_clk_stop),
                                .l2clk (iol2clk),

                           );
    
sii_stgsio_dp AUTO_TEMPLATE (
                             .tcu_clk_stop (ccu_soc4cmp_clk_stop),
                             .tcu_aclk (aclk),
                             .tcu_bclk (bclk),
                                //output
                             .scan_in(stgsio_dp_scanin),
                             .scan_out(stgsio_dp_scanout),

                     );

       
    */

   
// =============== VERILOG-MODE AUTO TEMPLATES



// scan start:
assign ildq0_scanin              = scan_in                  ;
assign ild0_scanin               = ildq0_scanout             ;
assign ilc0_scanin               = ild0_scanout             ;
assign ildq1_scanin              = ilc0_scanout             ;
assign ild1_scanin               = ildq1_scanout             ;
assign ilc1_scanin               = ild1_scanout             ;
assign ildq2_scanin              = ilc1_scanout             ;
assign ild2_scanin               = ildq2_scanout             ;
assign ilc2_scanin               = ild2_scanout             ;
assign ildq3_scanin              = ilc2_scanout             ;
assign ild3_scanin               = ildq3_scanout             ;
assign ilc3_scanin               = ild3_scanout             ;


assign indq_scanin               = ilc3_scanout            ;
assign ipdohq0_scanin            = indq_scanout            ;
assign ipdodq0_h_scanin          = ipdohq0_scanout         ;
assign ipdodq0_l_scanin          = ipdodq0_h_scanout       ;
assign ipcs0_scanin              = ipdodq0_l_scanout       ;
assign ipdbdq0_h_scanin          = ipcs0_scanout           ;
assign ipdbdq0_l_scanin          = ipdbdq0_h_scanout           ;

assign ipdbhq0_scanin            = ipdbdq0_l_scanout            ;
assign ipcc_scanin               = ipdbhq0_scanout          ;
assign ipdbhq1_scanin            = ipcc_scanout          ;
assign ipdbdq1_h_scanin          = ipdbhq1_scanout          ;
assign ipdbdq1_l_scanin          = ipdbdq1_h_scanout          ;
assign ipcs1_scanin              = ipdbdq1_l_scanout          ;
assign ipdodq1_h_scanin          = ipcs1_scanout          ;
assign ipdodq1_l_scanin          = ipdodq1_h_scanout          ;
assign ipdohq1_scanin            = ipdodq1_l_scanout          ;
assign inc_scanin                = ipdohq1_scanout          ;

assign ildq4_scanin              = inc_scanout             ;
assign ild4_scanin               = ildq4_scanout             ;
assign ilc4_scanin               = ild4_scanout             ;
assign ildq5_scanin              = ilc4_scanout             ;
assign ild5_scanin               = ildq5_scanout             ;
assign ilc5_scanin               = ild5_scanout             ;
assign ildq6_scanin              = ilc5_scanout             ;
assign ild6_scanin               = ildq6_scanout             ;
assign ilc6_scanin               = ild6_scanout             ;
assign ildq7_scanin              = ilc6_scanout             ;
assign ild7_scanin               = ildq7_scanout             ;
assign ilc7_scanin               = ild7_scanout             ;
assign ipcc_dp_scanin		 = ilc7_scanout		;
assign clkgen_sii_cmp_scanin     = ipcc_dp_scanout          ;
assign clkgen_sii_io_scanin      = clkgen_sii_cmp_scanout          ;
assign stgsio_dp_scanin          = clkgen_sii_io_scanout          ;
assign scan_out                  = stgsio_dp_scanout          ;

assign mb0_scanin                = tcu_sii_mbist_scan_in; 
assign mb1_scanin                = mb0_scanout          ;   
assign sii_tcu_mbist_scan_out    = mb1_scanout          ;

// scan end
endmodule
