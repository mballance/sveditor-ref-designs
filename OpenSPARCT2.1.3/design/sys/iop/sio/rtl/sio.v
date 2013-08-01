// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sio.v
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
`define SIO_L2SIO_J_BIT            31
`define SIO_L2SIO_CTGECC_MSB_BIT   30
`define SIO_L2SIO_CTGECC_LSB_BIT   25
`define SIO_L2SIO_RASUE_BIT           24
`define SIO_L2SIO_O_BIT            23
`define SIO_L2SIO_P_BIT            22
`define SIO_L2SIO_E_BIT            21
`define SIO_L2SIO_S_BIT            20
`define SIO_L2SIO_CBA2_BIT         19
`define SIO_L2SIO_CBA1_BIT         18
`define SIO_L2SIO_CBA0_BIT         17
`define SIO_L2SIO_R_BIT            16

`define RF_RDEN_OFFSTATE            1'b1

/* 2 per L2 bank, or 16 instances in SIO */
/* Write fast, Read fast */
`define SIO_OLD_RF_DATAWIDTH          32
`define SIO_OLD_RF_ADDRWIDTH           5
`define SIO_OLD_RF_DEPTH              32

/* 2 per IO device, or 4 instances in SIO */
/* Write fast, Read slow */
/* only using 68 out of 72 bits now */
`define SIO_OPD_DATA_RF_DATAWIDTH     72
`define SIO_OPD_DATA_RF_ADDRWIDTH      6
`define SIO_OPD_DATA_RF_DEPTH         64

/* 1 per IO device, or 2 instances in SIO */	       	       
/* Write fast, Read slow */
/* Logically use 18 bits wide and 16 entries */
/* Memory compiled sync fifo - with input flops, without output flops */

`define SIO_OPD_HDR_RF_DATAWIDTH      18
`define SIO_OPD_HDR_RF_ADDRWIDTH       4
`define SIO_OPD_HDR_RF_DEPTH          16



module sio (
  gclk, 
  ccu_io_out, 
  tcu_dbr_gateoff, 
  tcu_scan_en, 
  tcu_muxtest, 
  tcu_dectest, 
  tcu_mbist_user_mode, 
  scan_in, 
  tcu_pce_ov_in, 
  tcu_sio_clk_stop, 
  tcu_sio_io_clk_stop, 
  tcu_div_bypass, 
  cluster_arst_l, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_array_wr_inhibit, 
  tcu_atpg_mode, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  scan_out, 
  sio_tcu_vld, 
  sio_tcu_data, 
  tcu_sio_mbist_start, 
  tcu_mbist_bisi_en, 
  sio_tcu_mbist_done, 
  sio_tcu_mbist_fail, 
  tcu_sio_mbist_scan_in, 
  sio_tcu_mbist_scan_out, 
  ccu_io_cmp_sync_en, 
  ccu_cmp_io_sync_en, 
  l2b0_sio_ctag_vld, 
  l2b0_sio_data, 
  l2b0_sio_parity, 
  l2b0_sio_ue_err, 
  l2b1_sio_ctag_vld, 
  l2b1_sio_data, 
  l2b1_sio_parity, 
  l2b1_sio_ue_err, 
  l2b2_sio_ctag_vld, 
  l2b2_sio_data, 
  l2b2_sio_parity, 
  l2b2_sio_ue_err, 
  l2b3_sio_ctag_vld, 
  l2b3_sio_data, 
  l2b3_sio_parity, 
  l2b3_sio_ue_err, 
  l2b4_sio_ctag_vld, 
  l2b4_sio_data, 
  l2b4_sio_parity, 
  l2b4_sio_ue_err, 
  l2b5_sio_ctag_vld, 
  l2b5_sio_data, 
  l2b5_sio_parity, 
  l2b5_sio_ue_err, 
  l2b6_sio_ctag_vld, 
  l2b6_sio_data, 
  l2b6_sio_parity, 
  l2b6_sio_ue_err, 
  l2b7_sio_ctag_vld, 
  l2b7_sio_data, 
  l2b7_sio_parity, 
  l2b7_sio_ue_err, 
  niu_sio_dq, 
  sio_niu_hdr_vld, 
  sio_niu_datareq, 
  sio_niu_data, 
  sio_niu_parity, 
  sio_dmu_hdr_vld, 
  sio_dmu_data, 
  sio_dmu_parity, 
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
  sio_sii_olc7_ilc7_dequeue, 
  sio_ncu_ctag_ue, 
  sio_ncu_ctag_ce, 
  ncu_sio_ctag_cei, 
  ncu_sio_ctag_uei, 
  ncu_sio_d_pei);
wire tcu_pce_ov;
wire pce_ov;
wire rd_pce;
wire wr_pce;
wire bist_clk_mux_sel;
wire sio_mb1_run;
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
wire tcu_wr_inhibit;
wire l2b0_sio_ctag_vld_r;
wire [31:0] l2b0_sio_data_r;
wire [1:0] l2b0_sio_parity_r;
wire l2b0_sio_ue_err_r;
wire opcs0_ncu_ctag_ue;
wire opcs0_ncu_ctag_ce;
wire sio_ncu_d_pe_unused;
wire opcs0_ncu_d_pe;
wire tcu_sio_mb0_start;
wire tcu_sio_mb1_start;
wire sio_mb0_done;
wire sio_mb0_fail;
wire sio_mb1_fail;
wire sio_mb1_done;
wire tie_low;
wire [127:0] opds0_packet_data;
wire [127:0] opds1_packet_data;
wire [7:0] opds0_packet_parity;
wire [7:0] opds1_packet_parity;
wire [1:0] opcs_packet_req;
wire [1:0] opcs_packet_datareq;
wire sio_dmu_datareq_unused;
wire [1:0] opcs_packet_flowmode_vld;
wire [1:0] opcs_packet_ack_in;
wire [7:0] l2sio_v_bits;
wire l2b7_sio_ctag_vld_r;
wire l2b6_sio_ctag_vld_r;
wire l2b5_sio_ctag_vld_r;
wire l2b4_sio_ctag_vld_r;
wire l2b3_sio_ctag_vld_r;
wire l2b2_sio_ctag_vld_r;
wire l2b1_sio_ctag_vld_r;
wire [7:0] l2sio_j_bits;
wire [31:0] l2b7_sio_data_r;
wire [31:0] l2b6_sio_data_r;
wire [31:0] l2b5_sio_data_r;
wire [31:0] l2b4_sio_data_r;
wire [31:0] l2b3_sio_data_r;
wire [31:0] l2b2_sio_data_r;
wire [31:0] l2b1_sio_data_r;
wire [7:0] l2sio_r_bits;
wire [7:0] l2sio_o_bits;
wire [7:0] l2sio_s_bits;
wire sio_mb0_run;
wire [4:0] sio_mb0_old_addr;
wire [7:0] sio_mb0_wdata;
wire sio_mb0_sel_l1;
wire sio_mb0_sel_l2;
wire sio_mb0_old0x_wr_en;
wire sio_mb0_old0x_rd_en;
wire sio_mb0_old1x_wr_en;
wire sio_mb0_old1x_rd_en;
wire sio_mb0_old2x_wr_en;
wire sio_mb0_old2x_rd_en;
wire sio_mb0_old3x_wr_en;
wire sio_mb0_old3x_rd_en;
wire sio_mb0_old4x_wr_en;
wire sio_mb0_old4x_rd_en;
wire sio_mb0_old5x_wr_en;
wire sio_mb0_old5x_rd_en;
wire sio_mb0_old6x_wr_en;
wire sio_mb0_old6x_rd_en;
wire sio_mb0_old7x_wr_en;
wire sio_mb0_old7x_rd_en;
wire mb0_scanout;
wire l2clk;
wire mb0_scanin;
wire aclk;
wire bclk;
wire [67:0] read_data_top;
wire [67:0] read_data_bot;
wire [5:0] sio_mb1_addr;
wire [7:0] sio_mb1_wdata;
wire sio_mb1_opddq00_wr_en;
wire sio_mb1_opddq00_rd_en;
wire sio_mb1_opddq01_wr_en;
wire sio_mb1_opddq01_rd_en;
wire sio_mb1_opddq10_wr_en;
wire sio_mb1_opddq10_rd_en;
wire sio_mb1_opddq11_wr_en;
wire sio_mb1_opddq11_rd_en;
wire sio_mb1_opdhq0_wr_en;
wire sio_mb1_opdhq0_rd_en;
wire sio_mb1_opdhq1_wr_en;
wire sio_mb1_opdhq1_rd_en;
wire sio_mb1_opdhq_sel;
wire sio_mb1_opddq0_sel;
wire sio_mb1_opddq1_sel;
wire mb1_scanout;
wire iol2clk;
wire mb1_scanin;
wire [71:0] opds0_read_data;
wire [71:0] opds1_read_data;
wire [33:0] olddq00_dout;
wire olddq00_scanout;
wire [4:0] old_olddq00_waddr;
wire old_olddq00_wr_en;
wire [4:0] old_olddq00_raddr;
wire old_olddq00_rd_en;
wire [33:0] old_olddq00_din;
wire olddq00_scanin;
wire array_wr_inhibit_cmp;
wire [33:0] olddq01_dout;
wire olddq01_scanout;
wire [4:0] old_olddq01_waddr;
wire old_olddq01_wr_en;
wire [4:0] old_olddq01_raddr;
wire old_olddq01_rd_en;
wire [33:0] old_olddq01_din;
wire olddq01_scanin;
wire oldhq0_dout_r_bit;
wire oldhq0_dout_s_bit;
wire [64:0] old0_opd_data;
wire old0_opcc_jtag;
wire old0_scanout;
wire olc_oldue0_check_clrerr;
wire olc_oldue0_check_en;
wire [3:0] olc_oldue0_wr_en;
wire [1:0] olc_oldue0_rd_addr;
wire olc_old0_selhdr;
wire olc_oldue0_selfwd;
wire olc_oldue_pass_late_ue0;
wire [3:0] olc_oldhq0_wr_en;
wire [1:0] olc_oldhq0_rd_addr;
wire ojc_old0_jtagsr_en;
wire [1:0] ojc_old0_wr_en;
wire olc_old_olddq00_wr_en;
wire olc_old_olddq00_rd_en;
wire [4:0] olc_old_olddq00_waddr;
wire [4:0] olc_old_olddq00_raddr;
wire olc_old_olddq01_wr_en;
wire olc_old_olddq01_rd_en;
wire [4:0] olc_old_olddq01_waddr;
wire [4:0] olc_old_olddq01_raddr;
wire old0_scanin;
wire olc0_opcc_req;
wire ojc0_opcc_sync;
wire ojc0_opcc_ack;
wire olc0_scanout;
wire opcc_olc0_gnt;
wire olc0_scanin;
wire [1:0] l2b1_sio_parity_r;
wire l2b1_sio_ue_err_r;
wire stg1_scanout;
wire stg1_scanin;
wire [33:0] olddq10_dout;
wire olddq10_scanout;
wire [4:0] old_olddq10_waddr;
wire old_olddq10_wr_en;
wire [4:0] old_olddq10_raddr;
wire old_olddq10_rd_en;
wire [33:0] old_olddq10_din;
wire olddq10_scanin;
wire [33:0] olddq11_dout;
wire olddq11_scanout;
wire [4:0] old_olddq11_waddr;
wire old_olddq11_wr_en;
wire [4:0] old_olddq11_raddr;
wire old_olddq11_rd_en;
wire [33:0] old_olddq11_din;
wire olddq11_scanin;
wire oldhq1_dout_r_bit;
wire oldhq1_dout_s_bit;
wire [64:0] old1_opd_data;
wire old1_opcc_jtag;
wire old1_scanout;
wire olc_oldue1_check_clrerr;
wire olc_oldue1_check_en;
wire [3:0] olc_oldue1_wr_en;
wire [1:0] olc_oldue1_rd_addr;
wire olc_old1_selhdr;
wire olc_oldue1_selfwd;
wire olc_oldue_pass_late_ue1;
wire [3:0] olc_oldhq1_wr_en;
wire [1:0] olc_oldhq1_rd_addr;
wire ojc_old1_jtagsr_en;
wire [1:0] ojc_old1_wr_en;
wire olc_old_olddq10_wr_en;
wire olc_old_olddq10_rd_en;
wire [4:0] olc_old_olddq10_waddr;
wire [4:0] olc_old_olddq10_raddr;
wire olc_old_olddq11_wr_en;
wire olc_old_olddq11_rd_en;
wire [4:0] olc_old_olddq11_waddr;
wire [4:0] olc_old_olddq11_raddr;
wire old1_scanin;
wire olc1_opcc_req;
wire ojc1_opcc_sync;
wire ojc1_opcc_ack;
wire olc1_scanout;
wire opcc_olc1_gnt;
wire olc1_scanin;
wire [1:0] l2b2_sio_parity_r;
wire l2b2_sio_ue_err_r;
wire stg2_scanout;
wire stg2_scanin;
wire [33:0] olddq20_dout;
wire olddq20_scanout;
wire [4:0] old_olddq20_waddr;
wire old_olddq20_wr_en;
wire [4:0] old_olddq20_raddr;
wire old_olddq20_rd_en;
wire [33:0] old_olddq20_din;
wire olddq20_scanin;
wire [33:0] olddq21_dout;
wire olddq21_scanout;
wire [4:0] old_olddq21_waddr;
wire old_olddq21_wr_en;
wire [4:0] old_olddq21_raddr;
wire old_olddq21_rd_en;
wire [33:0] old_olddq21_din;
wire olddq21_scanin;
wire oldhq2_dout_r_bit;
wire oldhq2_dout_s_bit;
wire [64:0] old2_opd_data;
wire old2_opcc_jtag;
wire old2_scanout;
wire olc_oldue2_check_clrerr;
wire olc_oldue2_check_en;
wire [3:0] olc_oldue2_wr_en;
wire [1:0] olc_oldue2_rd_addr;
wire olc_old2_selhdr;
wire olc_oldue2_selfwd;
wire olc_oldue_pass_late_ue2;
wire [3:0] olc_oldhq2_wr_en;
wire [1:0] olc_oldhq2_rd_addr;
wire ojc_old2_jtagsr_en;
wire [1:0] ojc_old2_wr_en;
wire olc_old_olddq20_wr_en;
wire olc_old_olddq20_rd_en;
wire [4:0] olc_old_olddq20_waddr;
wire [4:0] olc_old_olddq20_raddr;
wire olc_old_olddq21_wr_en;
wire olc_old_olddq21_rd_en;
wire [4:0] olc_old_olddq21_waddr;
wire [4:0] olc_old_olddq21_raddr;
wire old2_scanin;
wire olc2_opcc_req;
wire ojc2_opcc_sync;
wire ojc2_opcc_ack;
wire olc2_scanout;
wire opcc_olc2_gnt;
wire olc2_scanin;
wire [1:0] l2b3_sio_parity_r;
wire l2b3_sio_ue_err_r;
wire stg3_scanout;
wire stg3_scanin;
wire [33:0] olddq30_dout;
wire olddq30_scanout;
wire [4:0] old_olddq30_waddr;
wire old_olddq30_wr_en;
wire [4:0] old_olddq30_raddr;
wire old_olddq30_rd_en;
wire [33:0] old_olddq30_din;
wire olddq30_scanin;
wire [33:0] olddq31_dout;
wire olddq31_scanout;
wire [4:0] old_olddq31_waddr;
wire old_olddq31_wr_en;
wire [4:0] old_olddq31_raddr;
wire old_olddq31_rd_en;
wire [33:0] old_olddq31_din;
wire olddq31_scanin;
wire oldhq3_dout_r_bit;
wire oldhq3_dout_s_bit;
wire [64:0] old3_opd_data;
wire old3_opcc_jtag;
wire old3_scanout;
wire olc_oldue3_check_clrerr;
wire olc_oldue3_check_en;
wire [3:0] olc_oldue3_wr_en;
wire [1:0] olc_oldue3_rd_addr;
wire olc_old3_selhdr;
wire olc_oldue3_selfwd;
wire olc_oldue_pass_late_ue3;
wire [3:0] olc_oldhq3_wr_en;
wire [1:0] olc_oldhq3_rd_addr;
wire ojc_old3_jtagsr_en;
wire [1:0] ojc_old3_wr_en;
wire olc_old_olddq30_wr_en;
wire olc_old_olddq30_rd_en;
wire [4:0] olc_old_olddq30_waddr;
wire [4:0] olc_old_olddq30_raddr;
wire olc_old_olddq31_wr_en;
wire olc_old_olddq31_rd_en;
wire [4:0] olc_old_olddq31_waddr;
wire [4:0] olc_old_olddq31_raddr;
wire old3_scanin;
wire olc3_opcc_req;
wire ojc3_opcc_sync;
wire ojc3_opcc_ack;
wire olc3_scanout;
wire opcc_olc3_gnt;
wire olc3_scanin;
wire [1:0] l2b4_sio_parity_r;
wire l2b4_sio_ue_err_r;
wire stg4_scanout;
wire stg4_scanin;
wire [33:0] olddq40_dout;
wire olddq40_scanout;
wire [4:0] old_olddq40_waddr;
wire old_olddq40_wr_en;
wire [4:0] old_olddq40_raddr;
wire old_olddq40_rd_en;
wire [33:0] old_olddq40_din;
wire olddq40_scanin;
wire [33:0] olddq41_dout;
wire olddq41_scanout;
wire [4:0] old_olddq41_waddr;
wire old_olddq41_wr_en;
wire [4:0] old_olddq41_raddr;
wire old_olddq41_rd_en;
wire [33:0] old_olddq41_din;
wire olddq41_scanin;
wire oldhq4_dout_r_bit;
wire oldhq4_dout_s_bit;
wire [64:0] old4_opd_data;
wire old4_opcc_jtag;
wire old4_scanout;
wire olc_oldue4_check_clrerr;
wire olc_oldue4_check_en;
wire [3:0] olc_oldue4_wr_en;
wire [1:0] olc_oldue4_rd_addr;
wire olc_old4_selhdr;
wire olc_oldue4_selfwd;
wire olc_oldue_pass_late_ue4;
wire [3:0] olc_oldhq4_wr_en;
wire [1:0] olc_oldhq4_rd_addr;
wire ojc_old4_jtagsr_en;
wire [1:0] ojc_old4_wr_en;
wire olc_old_olddq40_wr_en;
wire olc_old_olddq40_rd_en;
wire [4:0] olc_old_olddq40_waddr;
wire [4:0] olc_old_olddq40_raddr;
wire olc_old_olddq41_wr_en;
wire olc_old_olddq41_rd_en;
wire [4:0] olc_old_olddq41_waddr;
wire [4:0] olc_old_olddq41_raddr;
wire old4_scanin;
wire olc4_opcc_req;
wire ojc4_opcc_sync;
wire ojc4_opcc_ack;
wire olc4_scanout;
wire opcc_olc4_gnt;
wire olc4_scanin;
wire [1:0] l2b5_sio_parity_r;
wire l2b5_sio_ue_err_r;
wire stg5_scanout;
wire stg5_scanin;
wire [33:0] olddq50_dout;
wire olddq50_scanout;
wire [4:0] old_olddq50_waddr;
wire old_olddq50_wr_en;
wire [4:0] old_olddq50_raddr;
wire old_olddq50_rd_en;
wire [33:0] old_olddq50_din;
wire olddq50_scanin;
wire [33:0] olddq51_dout;
wire olddq51_scanout;
wire [4:0] old_olddq51_waddr;
wire old_olddq51_wr_en;
wire [4:0] old_olddq51_raddr;
wire old_olddq51_rd_en;
wire [33:0] old_olddq51_din;
wire olddq51_scanin;
wire oldhq5_dout_r_bit;
wire oldhq5_dout_s_bit;
wire [64:0] old5_opd_data;
wire old5_opcc_jtag;
wire old5_scanout;
wire olc_oldue5_check_clrerr;
wire olc_oldue5_check_en;
wire [3:0] olc_oldue5_wr_en;
wire [1:0] olc_oldue5_rd_addr;
wire olc_old5_selhdr;
wire olc_oldue5_selfwd;
wire olc_oldue_pass_late_ue5;
wire [3:0] olc_oldhq5_wr_en;
wire [1:0] olc_oldhq5_rd_addr;
wire ojc_old5_jtagsr_en;
wire [1:0] ojc_old5_wr_en;
wire olc_old_olddq50_wr_en;
wire olc_old_olddq50_rd_en;
wire [4:0] olc_old_olddq50_waddr;
wire [4:0] olc_old_olddq50_raddr;
wire olc_old_olddq51_wr_en;
wire olc_old_olddq51_rd_en;
wire [4:0] olc_old_olddq51_waddr;
wire [4:0] olc_old_olddq51_raddr;
wire old5_scanin;
wire olc5_opcc_req;
wire ojc5_opcc_sync;
wire ojc5_opcc_ack;
wire olc5_scanout;
wire opcc_olc5_gnt;
wire olc5_scanin;
wire [1:0] l2b6_sio_parity_r;
wire l2b6_sio_ue_err_r;
wire stg6_scanout;
wire stg6_scanin;
wire [33:0] olddq60_dout;
wire olddq60_scanout;
wire [4:0] old_olddq60_waddr;
wire old_olddq60_wr_en;
wire [4:0] old_olddq60_raddr;
wire old_olddq60_rd_en;
wire [33:0] old_olddq60_din;
wire olddq60_scanin;
wire [33:0] olddq61_dout;
wire olddq61_scanout;
wire [4:0] old_olddq61_waddr;
wire old_olddq61_wr_en;
wire [4:0] old_olddq61_raddr;
wire old_olddq61_rd_en;
wire [33:0] old_olddq61_din;
wire olddq61_scanin;
wire oldhq6_dout_r_bit;
wire oldhq6_dout_s_bit;
wire [64:0] old6_opd_data;
wire old6_opcc_jtag;
wire old6_scanout;
wire olc_oldue6_check_clrerr;
wire olc_oldue6_check_en;
wire [3:0] olc_oldue6_wr_en;
wire [1:0] olc_oldue6_rd_addr;
wire olc_old6_selhdr;
wire olc_oldue6_selfwd;
wire olc_oldue_pass_late_ue6;
wire [3:0] olc_oldhq6_wr_en;
wire [1:0] olc_oldhq6_rd_addr;
wire ojc_old6_jtagsr_en;
wire [1:0] ojc_old6_wr_en;
wire olc_old_olddq60_wr_en;
wire olc_old_olddq60_rd_en;
wire [4:0] olc_old_olddq60_waddr;
wire [4:0] olc_old_olddq60_raddr;
wire olc_old_olddq61_wr_en;
wire olc_old_olddq61_rd_en;
wire [4:0] olc_old_olddq61_waddr;
wire [4:0] olc_old_olddq61_raddr;
wire old6_scanin;
wire olc6_opcc_req;
wire ojc6_opcc_sync;
wire ojc6_opcc_ack;
wire olc6_scanout;
wire opcc_olc6_gnt;
wire olc6_scanin;
wire [1:0] l2b7_sio_parity_r;
wire l2b7_sio_ue_err_r;
wire stg7_scanout;
wire stg7_scanin;
wire [33:0] olddq70_dout;
wire olddq70_scanout;
wire [4:0] old_olddq70_waddr;
wire old_olddq70_wr_en;
wire [4:0] old_olddq70_raddr;
wire old_olddq70_rd_en;
wire [33:0] old_olddq70_din;
wire olddq70_scanin;
wire [33:0] olddq71_dout;
wire olddq71_scanout;
wire [4:0] old_olddq71_waddr;
wire old_olddq71_wr_en;
wire [4:0] old_olddq71_raddr;
wire old_olddq71_rd_en;
wire [33:0] old_olddq71_din;
wire olddq71_scanin;
wire oldhq7_dout_r_bit;
wire oldhq7_dout_s_bit;
wire [64:0] old7_opd_data;
wire old7_opcc_jtag;
wire old7_scanout;
wire olc_oldue7_check_clrerr;
wire olc_oldue7_check_en;
wire [3:0] olc_oldue7_wr_en;
wire [1:0] olc_oldue7_rd_addr;
wire olc_old7_selhdr;
wire olc_oldue7_selfwd;
wire olc_oldue_pass_late_ue7;
wire [3:0] olc_oldhq7_wr_en;
wire [1:0] olc_oldhq7_rd_addr;
wire ojc_old7_jtagsr_en;
wire [1:0] ojc_old7_wr_en;
wire olc_old_olddq70_wr_en;
wire olc_old_olddq70_rd_en;
wire [4:0] olc_old_olddq70_waddr;
wire [4:0] olc_old_olddq70_raddr;
wire olc_old_olddq71_wr_en;
wire olc_old_olddq71_rd_en;
wire [4:0] olc_old_olddq71_waddr;
wire [4:0] olc_old_olddq71_raddr;
wire old7_scanin;
wire olc7_opcc_req;
wire ojc7_opcc_sync;
wire ojc7_opcc_ack;
wire olc7_scanout;
wire opcc_olc7_gnt;
wire olc7_scanin;
wire [63:0] opdc_bank_data_opc1;
wire [63:0] opdc_mb1bank_data_opc1;
wire [7:0] opdc_mb1bank_parity_opc1;
wire opdc_opddq00_wr_en;
wire opdc_opddq01_wr_en;
wire opdc_opdhq0_wr_en;
wire opdc_opddq10_wr_en;
wire opdc_opddq11_wr_en;
wire opdc_opdhq1_wr_en;
wire [5:0] opdc_opddq00_wr_addr;
wire [5:0] opdc_opddq01_wr_addr;
wire [3:0] opdc_opdhq0_wr_addr;
wire [5:0] opdc_opddq10_wr_addr;
wire [5:0] opdc_opddq11_wr_addr;
wire [3:0] opdc_opdhq1_wr_addr;
wire opdc_scanout;
wire opcc_opdc_gnt0_opc0;
wire opcc_opdc_gnt2_opc0;
wire opcc_opdc_gnt4_opc0;
wire opcc_opdc_gnt6_opc0;
wire opcc_opdc_gnt01_opc1;
wire opcc_opdc_gnt45_opc1;
wire opcc_opdc_gnt0123_opc1;
wire opcc_opddq00_wr_en;
wire opcc_opddq01_wr_en;
wire opcc_opddq10_wr_en;
wire opcc_opddq11_wr_en;
wire opcc_opdhq0_wr_en;
wire opcc_opdhq1_wr_en;
wire [5:0] opcc_opddq00_wr_addr;
wire [5:0] opcc_opddq01_wr_addr;
wire [3:0] opcc_opdhq0_wr_addr;
wire [5:0] opcc_opddq10_wr_addr;
wire [5:0] opcc_opddq11_wr_addr;
wire [3:0] opcc_opdhq1_wr_addr;
wire opdc_scanin;
wire [7:0] opddq00_pout;
wire [63:0] opddq00_dout;
wire opddq00_scanout;
wire [5:0] opds_opddq00_rd_addr;
wire opds_opddq00_rd_en;
wire opddq00_scanin;
wire array_wr_inhibit;
wire [7:0] opddq01_pout;
wire [63:0] opddq01_dout;
wire opddq01_scanout;
wire [5:0] opds_opddq01_rd_addr;
wire opds_opddq01_rd_en;
wire opddq01_scanin;
wire [7:0] opddq10_pout;
wire [63:0] opddq10_dout;
wire opddq10_scanout;
wire [5:0] opds_opddq10_rd_addr;
wire opds_opddq10_rd_en;
wire opddq10_scanin;
wire [7:0] opddq11_pout;
wire [63:0] opddq11_dout;
wire opddq11_scanout;
wire [5:0] opds_opddq11_rd_addr;
wire opds_opddq11_rd_en;
wire opddq11_scanin;
wire [31:0] opdhq0_dout;
wire opdhq0_scanout;
wire [3:0] opds_opdhq0_rd_addr;
wire opds_opdhq0_rd_en;
wire opdhq0_scanin;
wire [31:0] opdhq1_dout;
wire opdhq1_scanout;
wire [3:0] opds_opdhq1_rd_addr;
wire opds_opdhq1_rd_en;
wire opdhq1_scanin;
wire [7:0] parity_result0;
wire opds0_scanout;
wire [63:0] opcs_new_opdhqx0_1;
wire [63:0] opcs_new_opdhqx0_0;
wire opcs_opds0_reloadhdr;
wire opcs_opds0_selhdr;
wire opcs_opddq00_rd_en;
wire opcs_opddq01_rd_en;
wire opcs_opdhq0_rd_en;
wire [5:0] opcs_opddq00_rd_addr;
wire [5:0] opcs_opddq01_rd_addr;
wire [3:0] opcs_opdhq0_rd_addr;
wire opds0_scanin;
wire [7:0] parity_result1;
wire opds1_scanout;
wire [63:0] opcs_new_opdhqx1_1;
wire [63:0] opcs_new_opdhqx1_0;
wire opcs_opds1_reloadhdr;
wire opcs_opds1_selhdr;
wire opcs_opddq10_rd_en;
wire opcs_opddq11_rd_en;
wire opcs_opdhq1_rd_en;
wire [5:0] opcs_opddq10_rd_addr;
wire [5:0] opcs_opddq11_rd_addr;
wire [3:0] opcs_opdhq1_rd_addr;
wire opds1_scanin;
wire [6:0] opcc_opcs_opddq00_wr_addr;
wire [6:0] opcc_opcs_opddq10_wr_addr;
wire [6:0] opcc_opcs_opddq01_wr_addr;
wire [6:0] opcc_opcs_opddq11_wr_addr;
wire [4:0] opcc_opcs_opdhq0_wr_addr;
wire [4:0] opcc_opcs_opdhq1_wr_addr;
wire opcc_scanout;
wire array_wr_inhibit_io;
wire cmp_io_sync_en_in;
wire io_cmp_sync_en_in;
wire [4:0] opcs_opcc_opdhq0_rd_addr;
wire [4:0] opcs_opcc_opdhq1_rd_addr;
wire opcc_scanin;
wire opcs0_scanout;
wire opcs1_ncu_ctag_ue;
wire opcs1_ncu_ctag_ce;
wire opcs1_ncu_d_pe;
wire opcs0_scanin;
wire opcs1_scanout;
wire opcs1_scanin;
wire clkgen_sio_cmp_scanout;
wire cmpclkgen_aclk_wmr_unused;
wire cmpclkgen_wmr_protect_unused;
wire clkgen_cmp_wmr_unused;
wire clkgen_cmp_por_unused;
wire clkgen_sio_cmp_scanin;
wire clkgen_sio_io_scanout;
wire ioclkgen_aclk_wmr_unused;
wire ioclkgen_pce_ov_unused;
wire ioclkgen_wmr_protect_unused;
wire clkgen_io_wmr_unused;
wire clkgen_io_por_unused;
wire ioclkgen_cmp_slow_sync_en_unused;
wire ioclkgen_slow_cmp_sync_en_unused;
wire clkgen_sio_io_scanin;


   input	gclk;                  // cmp clock
   input 	ccu_io_out;                  // io clock
   input 	tcu_dbr_gateoff;                  // io clock
   input 	tcu_scan_en;
   input 	tcu_muxtest;
   input 	tcu_dectest;
   input 	tcu_mbist_user_mode;
   input 	scan_in;
   input 	tcu_pce_ov_in;		// scan signals
   input 	tcu_sio_clk_stop;   // clock stop for Fast Clk for L2 tags, Crossbar,  SIU, NCU.
   input        tcu_sio_io_clk_stop;
   input        tcu_div_bypass;
   input        cluster_arst_l;
 	
   input 	tcu_aclk;
   input 	tcu_bclk;
   input 	tcu_array_wr_inhibit;
//   input       tcu_wr_inhibit;
   input         tcu_atpg_mode;
   input 	tcu_se_scancollar_in;
   input 	tcu_se_scancollar_out;
   output 	scan_out;

   // ================== JTAG_RAS =============
   output       sio_tcu_vld;    // assert for jtag read return valid
   output       sio_tcu_data;   // bit 0 is transfered on first cycle...63 on last cycle
   // ================== JTAG_RAS =============

   // ================== MBIST ================
   input [1:0] 	tcu_sio_mbist_start;
   input 	tcu_mbist_bisi_en;
   output [1:0] sio_tcu_mbist_done;
   output [1:0] sio_tcu_mbist_fail;
   input 	tcu_sio_mbist_scan_in;
   output 	sio_tcu_mbist_scan_out;
   // ================== MBIST ================   

   input 	ccu_io_cmp_sync_en; // active high - ok to cross from IO to CMP clock domain
   input 	ccu_cmp_io_sync_en; // active high - ok to cross from CMP to IO clock domain
   
   // ================== L2_0 =================
   input 	l2b0_sio_ctag_vld;	//PINDEF:TOP  // Response valid from L2 to SIO
   input [31:0] l2b0_sio_data;		//PINDEF:TOP  // Response packet from L2 to SIO
   input [1:0] 	l2b0_sio_parity;	//PINDEF:TOP  // Response packet parity from L2 to SIO
   input 	l2b0_sio_ue_err;	//PINDEF:TOP  // Response packet Uncorrectable Err from L2 to SIO
   
   // ================== L2_0 =================
   
   
   // ================== L2_1 =================
   input 	l2b1_sio_ctag_vld;	//PINDEF:TOP   // Response valid from L2 to SIO
   input [31:0] l2b1_sio_data;		//PINDEF:TOP   // Response packet from L2 to SIO
   input [1:0] 	l2b1_sio_parity;	//PINDEF:TOP   // Response packet parity from L2 to SIO
   input 	l2b1_sio_ue_err;	//PINDEF:TOP   // Response packet Uncorrectable Err from L2 to SIO
   
   // ================== L2_1 =================
   
   // ================== L2_2 =================
   input 	l2b2_sio_ctag_vld;	//PINDEF:TOP	// Response valid from L2 to SIO
   input [31:0] l2b2_sio_data;		//PINDEF:TOP	// Response packet from L2 to SIO
   input [1:0] 	l2b2_sio_parity;	//PINDEF:TOP	// Response packet parity from L2 to SIO
   input 	l2b2_sio_ue_err;	//PINDEF:TOP	// Response packet Uncorrectable Err from L2 to SIO
   
   // ================== L2_2 =================
   
   // ================== L2_3 =================
   input 	l2b3_sio_ctag_vld;	//PINDEF:TOP	// Response valid from L2 to SIO
   input [31:0] l2b3_sio_data;		//PINDEF:TOP	// Response packet from L2 to SIO
   input [1:0] 	l2b3_sio_parity;	//PINDEF:TOP	// Response packet parity from L2 to SIO
   input 	l2b3_sio_ue_err;	//PINDEF:TOP	// Response packet Uncorrectable Err from L2 to SIO
   
   // ================== L2_3 =================
   
   // ================== L2_4 =================
   input 	l2b4_sio_ctag_vld;	//PINDEF:RIGHT	// Response valid from L2 to SIO
   input [31:0] l2b4_sio_data;		//PINDEF:RIGHT	// Response packet from L2 to SIO
   input [1:0] 	l2b4_sio_parity;	//PINDEF:RIGHT	// Response packet parity from L2 to SIO
   input 	l2b4_sio_ue_err;	//PINDEF:RIGHT	// Response packet Uncorrectable Err from L2 to SIO
   
   // ================== L2_4 =================
   
   // ================== L2_5 =================
   input 	l2b5_sio_ctag_vld;	//PINDEF:RIGHT	// Response valid from L2 to SIO
   input [31:0] l2b5_sio_data;		//PINDEF:RIGHT	// Response packet from L2 to SIO
   input [1:0] 	l2b5_sio_parity;	//PINDEF:RIGHT	// Response packet parity from L2 to SIO
   input 	l2b5_sio_ue_err;	//PINDEF:RIGHT	// Response packet Uncorrectable Err from L2 to SIO
   
   // ================== L2_5 =================
   
   // ================== L2_6 =================
   input 	l2b6_sio_ctag_vld;	//PINDEF:RIGHT	      // Response valid from L2 to SIO
   input [31:0] l2b6_sio_data;		//PINDEF:RIGHT	      // Response packet from L2 to SIO
   input [1:0] 	l2b6_sio_parity;	//PINDEF:RIGHT	      // Response packet parity from L2 to SIO
   input 	l2b6_sio_ue_err;	//PINDEF:RIGHT	      // Response packet Uncorrectable Err from L2 to SIO
   
   // ================== L2_6 =================
   
   // ================== L2_7 =================
   input 	l2b7_sio_ctag_vld;	//PINDEF:RIGHT	      // Response valid from L2 to SIO
   input [31:0] l2b7_sio_data;		//PINDEF:RIGHT	      // Response packet from L2 to SIO
   input [1:0] 	l2b7_sio_parity;	//PINDEF:RIGHT	      // Response packet parity from L2 to SIO
   input 	l2b7_sio_ue_err;	//PINDEF:RIGHT	      // Response packet Uncorrectable Err from L2 to SIO
   
   // ================== L2_7 =================
   
   
   // ================== NIU  =================
   input        niu_sio_dq;             //PINDEF:BOT  // flow control or credit return signal from NIU to SIO
   
   output 	sio_niu_hdr_vld;	//PINDEF:BOT  // SIO requesting to send packet to Ethernet
   output 	sio_niu_datareq;	//PINDEF:BOT  // Valid during header phase only - 1=current request is a read data return
   output [127:0] sio_niu_data;		//PINDEF:BOT  // Packet from SIO to Ethernet
   output [7:0]   sio_niu_parity;	//PINDEF:BOT  // Packet parity from SIO to Ethernet
   // ================== NIU  =================
 
 
   // ================== DMU  =================
   output 	  sio_dmu_hdr_vld;	//PINDEF:BOT  // SIO requesting to send DMA/Fl/Int packet to DMU
//   output 	  sio_dmu_datareq;	//PINDEF:BOT  // Valid during header phase only - 1=current request is a read data return

   output [127:0] sio_dmu_data;		//PINDEF:BOT  // Packet from SIO to DMU
   output [7:0]   sio_dmu_parity;	//PINDEF:BOT  // Packet parity from SIO to DMU
   // ================== DMU  =================

   // ================= SIO IN <-> SIO OUT ====
   output 	  sio_sii_opcc_ipcc_niu_by_deq; // PINDEF:LEFT
   output [3:0]   sio_sii_opcc_ipcc_niu_by_cnt;	// PINDEF:LEFT
   output 	  sio_sii_opcc_ipcc_niu_or_deq;	// PINDEF:LEFT
   					                 
   output 	  sio_sii_opcc_ipcc_dmu_by_deq;	  // PINDEF:LEFT
   output [3:0]   sio_sii_opcc_ipcc_dmu_by_cnt;	  // PINDEF:LEFT
   output 	  sio_sii_opcc_ipcc_dmu_or_deq;	  // PINDEF:LEFT
   
   output 	  sio_sii_olc0_ilc0_dequeue; // PINDEF: LEFT // SIO L2 Ctl 0 deq'd an request entry
   output 	  sio_sii_olc1_ilc1_dequeue; // PINDEF: LEFT // SIO L2 Ctl 1 deq'd an request entry
   output 	  sio_sii_olc2_ilc2_dequeue; // PINDEF: LEFT // SIO L2 Ctl 2 deq'd an request entry
   output 	  sio_sii_olc3_ilc3_dequeue; // PINDEF: LEFT // SIO L2 Ctl 3 deq'd an request entry
   output 	  sio_sii_olc4_ilc4_dequeue; // PINDEF: LEFT // SIO L2 Ctl 4 deq'd an request entry
   output 	  sio_sii_olc5_ilc5_dequeue; // PINDEF: LEFT // SIO L2 Ctl 5 deq'd an request entry
   output 	  sio_sii_olc6_ilc6_dequeue; // PINDEF: LEFT // SIO L2 Ctl 6 deq'd an request entry
   output 	  sio_sii_olc7_ilc7_dequeue; // PINDEF: LEFT // SIO L2 Ctl 7 deq'd an request entry
   
   // ================= SIO IN <-> SIO OUT ====


   output 	  sio_ncu_ctag_ue;
   output 	  sio_ncu_ctag_ce;
//   output 	  sio_ncu_d_pe;
   input 	  ncu_sio_ctag_cei;
   input 	  ncu_sio_ctag_uei;
   input 	  ncu_sio_d_pei;

//   assign 	  sio_ncu_d_pe			= 1'b0;
//   assign 	  sio_dmu_datareq		= 1'b0;
   assign	   tcu_pce_ov			= pce_ov;
   assign	   rd_pce			= 1'b1;
   assign	   wr_pce			= 1'b1;
   assign	   bist_clk_mux_sel		= sio_mb1_run;
//   assign          tcu_div_bypass               = 1'b0;         // bypasses clk divider to mux in ext clk
   assign          cluster_div_en               = 1'b0;         // if enabled, l2clk is divided down
   assign          ccu_slow_cmp_sync_en         = ccu_io_cmp_sync_en;
   assign          ccu_cmp_slow_sync_en         = ccu_cmp_io_sync_en;

   assign          rst_wmr_protect              = 1'b0;         // if enabled, l2clk is divided down
   assign          rst_wmr_                     = 1'b0;         // if enabled, l2clk is divided down
   assign          rst_por_                     = 1'b0;         // if enabled, l2clk is divided down

   assign          clk_ext                      = 1'b0;         // if enabled, l2clk is divided down

   assign          ccu_soc4cmp_clk_stop         = 1'b0;         // if enabled, l2clk is divided down
   assign          ccu_soc6io_clk_stop          = 1'b0;         // if enabled, l2clk is divided down
//   assign          cluster_arst_l               = 1'b0;         // if enabled, l2clk is divided down
   assign          ccu_serdes_dtm               = 1'b0;         // if enabled, l2clk is divided down
   assign          tcu_wr_inhibit               = tcu_array_wr_inhibit;



   //FOR STAGGING FLOPS REQUIREMENTS, L20 is not flop inside sio

   assign	  l2b0_sio_ctag_vld_r = l2b0_sio_ctag_vld;
   assign	  l2b0_sio_data_r[31:0] = l2b0_sio_data[31:0];
   assign	  l2b0_sio_parity_r[1:0] = l2b0_sio_parity[1:0];
   assign	  l2b0_sio_ue_err_r = l2b0_sio_ue_err;

   assign 	  sio_ncu_ctag_ue = opcs0_ncu_ctag_ue;
   assign 	  sio_ncu_ctag_ce = opcs0_ncu_ctag_ce;
   assign 	  sio_ncu_d_pe_unused = opcs0_ncu_d_pe;


   assign	  tcu_sio_mb0_start = tcu_sio_mbist_start[0];
   assign	  tcu_sio_mb1_start = tcu_sio_mbist_start[1];
   assign	  sio_tcu_mbist_done[0] = sio_mb0_done;
   assign	  sio_tcu_mbist_fail[0] = sio_mb0_fail;
   assign	  sio_tcu_mbist_fail[1]	= sio_mb1_fail;
   assign	  sio_tcu_mbist_done[1]	= sio_mb1_done;
   assign	  tie_low		= 1'b0;

   // WIRING from OPD
   assign sio_dmu_data[127:0] = opds0_packet_data[127:0];
   assign sio_niu_data[127:0] = opds1_packet_data[127:0];
   assign sio_dmu_parity[7:0] = opds0_packet_parity[7:0];
   assign sio_niu_parity[7:0] = opds1_packet_parity[7:0];

   // bit 1 is for niu, bit 0 is for dmu
   assign sio_niu_hdr_vld = opcs_packet_req[1];
   assign sio_niu_datareq = opcs_packet_datareq[1];
   assign sio_dmu_hdr_vld = opcs_packet_req[0];
   assign sio_dmu_datareq_unused = opcs_packet_datareq[0];

// temporarily disable flow control until SAT and niu is ready
   assign opcs_packet_flowmode_vld[1:0] = 2'b10; // 1 = flow control mode is active - should be a static signal

//   assign opcs_packet_flowmode_vld[1:0] = 2'b00; // 1 = flow control mode is active - should be a static signal
   assign opcs_packet_ack_in[1:0] = {niu_sio_dq, 1'b0}; // if flowmode_vld=1, if count_vld, this is a release of a credit, otherwise, this means stop

   assign l2sio_v_bits[7:0] = {l2b7_sio_ctag_vld_r, 
			       l2b6_sio_ctag_vld_r, 
			       l2b5_sio_ctag_vld_r, 
			       l2b4_sio_ctag_vld_r, 
			       l2b3_sio_ctag_vld_r, 
			       l2b2_sio_ctag_vld_r, 
			       l2b1_sio_ctag_vld_r, 
			       l2b0_sio_ctag_vld_r};
   
   assign l2sio_j_bits[7:0] = {l2b7_sio_data_r[`SIO_L2SIO_J_BIT],
     		  	       l2b6_sio_data_r[`SIO_L2SIO_J_BIT],
     		  	       l2b5_sio_data_r[`SIO_L2SIO_J_BIT],
     		  	       l2b4_sio_data_r[`SIO_L2SIO_J_BIT],
     		  	       l2b3_sio_data_r[`SIO_L2SIO_J_BIT],
     		  	       l2b2_sio_data_r[`SIO_L2SIO_J_BIT],
     		  	       l2b1_sio_data_r[`SIO_L2SIO_J_BIT],
     		  	       l2b0_sio_data_r[`SIO_L2SIO_J_BIT]};
   
   assign l2sio_r_bits[7:0] = {l2b7_sio_data_r[`SIO_L2SIO_R_BIT],
     		  	       l2b6_sio_data_r[`SIO_L2SIO_R_BIT],
     		  	       l2b5_sio_data_r[`SIO_L2SIO_R_BIT],
     		  	       l2b4_sio_data_r[`SIO_L2SIO_R_BIT],
     		  	       l2b3_sio_data_r[`SIO_L2SIO_R_BIT],
     		  	       l2b2_sio_data_r[`SIO_L2SIO_R_BIT],
     		  	       l2b1_sio_data_r[`SIO_L2SIO_R_BIT],
     		  	       l2b0_sio_data_r[`SIO_L2SIO_R_BIT]};
   assign l2sio_o_bits[7:0] = {l2b7_sio_data_r[`SIO_L2SIO_O_BIT],
     		  	       l2b6_sio_data_r[`SIO_L2SIO_O_BIT],
     		  	       l2b5_sio_data_r[`SIO_L2SIO_O_BIT],
     		  	       l2b4_sio_data_r[`SIO_L2SIO_O_BIT],
     		  	       l2b3_sio_data_r[`SIO_L2SIO_O_BIT],
     		  	       l2b2_sio_data_r[`SIO_L2SIO_O_BIT],
     		  	       l2b1_sio_data_r[`SIO_L2SIO_O_BIT],
     		  	       l2b0_sio_data_r[`SIO_L2SIO_O_BIT]};
   
  assign l2sio_s_bits[7:0] = {l2b7_sio_data_r[`SIO_L2SIO_S_BIT],
     		  	       l2b6_sio_data_r[`SIO_L2SIO_S_BIT],
     		  	       l2b5_sio_data_r[`SIO_L2SIO_S_BIT],
     		  	       l2b4_sio_data_r[`SIO_L2SIO_S_BIT],
     		  	       l2b3_sio_data_r[`SIO_L2SIO_S_BIT],
     		  	       l2b2_sio_data_r[`SIO_L2SIO_S_BIT],
     		  	       l2b1_sio_data_r[`SIO_L2SIO_S_BIT],
     		  	       l2b0_sio_data_r[`SIO_L2SIO_S_BIT]};

   sio_mb0_ctl mb0 (/*AUTOINST*/
		    // Outputs
		    .sio_mb0_run	(sio_mb0_run),
		    .sio_mb0_old_addr	(sio_mb0_old_addr[4:0]),
		    .sio_mb0_wdata	(sio_mb0_wdata[7:0]),
		    .sio_mb0_sel_l1	(sio_mb0_sel_l1),
		    .sio_mb0_sel_l2	(sio_mb0_sel_l2),
		    .sio_mb0_old0x_wr_en(sio_mb0_old0x_wr_en),
		    .sio_mb0_old0x_rd_en(sio_mb0_old0x_rd_en),
		    .sio_mb0_old1x_wr_en(sio_mb0_old1x_wr_en),
		    .sio_mb0_old1x_rd_en(sio_mb0_old1x_rd_en),
		    .sio_mb0_old2x_wr_en(sio_mb0_old2x_wr_en),
		    .sio_mb0_old2x_rd_en(sio_mb0_old2x_rd_en),
		    .sio_mb0_old3x_wr_en(sio_mb0_old3x_wr_en),
		    .sio_mb0_old3x_rd_en(sio_mb0_old3x_rd_en),
		    .sio_mb0_old4x_wr_en(sio_mb0_old4x_wr_en),
		    .sio_mb0_old4x_rd_en(sio_mb0_old4x_rd_en),
		    .sio_mb0_old5x_wr_en(sio_mb0_old5x_wr_en),
		    .sio_mb0_old5x_rd_en(sio_mb0_old5x_rd_en),
		    .sio_mb0_old6x_wr_en(sio_mb0_old6x_wr_en),
		    .sio_mb0_old6x_rd_en(sio_mb0_old6x_rd_en),
		    .sio_mb0_old7x_wr_en(sio_mb0_old7x_wr_en),
		    .sio_mb0_old7x_rd_en(sio_mb0_old7x_rd_en),
		    .sio_mb0_done	(sio_mb0_done),
		    .sio_mb0_fail	(sio_mb0_fail),
		    .scan_out		(mb0_scanout),		 // Templated
		    // Inputs
		    .l2clk		(l2clk),
		    .tcu_scan_en	(tcu_scan_en),
		    .scan_in		(mb0_scanin),		 // Templated
		    .tcu_aclk		(aclk),			 // Templated
		    .tcu_bclk		(bclk),			 // Templated
		    .tcu_pce_ov		(tcu_pce_ov),
		    .tcu_clk_stop	(ccu_soc4cmp_clk_stop),	 // Templated
		    .tcu_sio_mb0_start	(tcu_sio_mb0_start),
		    .sio_mb0_bisi_mode	(tcu_mbist_bisi_en),	 // Templated
		    .sio_mb0_user_mode	(tcu_mbist_user_mode),	 // Templated
		    .read_data_top	(read_data_top[67:0]),
		    .read_data_bot	(read_data_bot[67:0]));
   
   sio_mb1_ctl mb1 (/*AUTOINST*/
		    // Outputs
		    .sio_mb1_run	(sio_mb1_run),		 // Templated
		    .sio_mb1_addr	(sio_mb1_addr[5:0]),	 // Templated
		    .sio_mb1_wdata	(sio_mb1_wdata[7:0]),	 // Templated
		    .sio_mb1_opddq00_wr_en(sio_mb1_opddq00_wr_en), // Templated
		    .sio_mb1_opddq00_rd_en(sio_mb1_opddq00_rd_en), // Templated
		    .sio_mb1_opddq01_wr_en(sio_mb1_opddq01_wr_en), // Templated
		    .sio_mb1_opddq01_rd_en(sio_mb1_opddq01_rd_en), // Templated
		    .sio_mb1_opddq10_wr_en(sio_mb1_opddq10_wr_en), // Templated
		    .sio_mb1_opddq10_rd_en(sio_mb1_opddq10_rd_en), // Templated
		    .sio_mb1_opddq11_wr_en(sio_mb1_opddq11_wr_en), // Templated
		    .sio_mb1_opddq11_rd_en(sio_mb1_opddq11_rd_en), // Templated
		    .sio_mb1_opdhq0_wr_en(sio_mb1_opdhq0_wr_en ), // Templated
		    .sio_mb1_opdhq0_rd_en(sio_mb1_opdhq0_rd_en ), // Templated
		    .sio_mb1_opdhq1_wr_en(sio_mb1_opdhq1_wr_en ), // Templated
		    .sio_mb1_opdhq1_rd_en(sio_mb1_opdhq1_rd_en ), // Templated
		    .sio_mb1_opdhq_sel	(sio_mb1_opdhq_sel    ), // Templated
		    .sio_mb1_opddq0_sel	(sio_mb1_opddq0_sel   ), // Templated
		    .sio_mb1_opddq1_sel	(sio_mb1_opddq1_sel   ), // Templated
		    .sio_mb1_done	(sio_mb1_done),		 // Templated
		    .sio_mb1_fail	(sio_mb1_fail),		 // Templated
		    .scan_out		(mb1_scanout),		 // Templated
		    // Inputs
		    .iol2clk		(iol2clk),		 // Templated
		    .tcu_scan_en	(tcu_scan_en),		 // Templated
		    .scan_in		(mb1_scanin),		 // Templated
		    .tcu_aclk		(aclk),			 // Templated
		    .tcu_bclk		(bclk),			 // Templated
		    .tcu_pce_ov		(tcu_pce_ov),		 // Templated
		    .tcu_clk_stop	(ccu_soc6io_clk_stop),	 // Templated
		    .tcu_sio_mb1_start	(tcu_sio_mb1_start),	 // Templated
		    .sio_mb1_bisi_mode	(tcu_mbist_bisi_en),	 // Templated
		    .sio_mb1_user_mode	(tcu_mbist_user_mode),	 // Templated
		    .opd0_read_data	(opds0_read_data[71:0]), // Templated
		    .opd1_read_data	(opds1_read_data[71:0])); // Templated
   
   
// ========= Outbound L2 bank 0 ========

   n2_com_dp_32x34_cust      olddq00 (/*AUTOINST*/
				      // Outputs
				      .dout(olddq00_dout[33:0]), // Templated
				      .scan_out(olddq00_scanout), // Templated
				      // Inputs
				      .wr_adr(old_olddq00_waddr[4:0]), // Templated
				      .wr_en(old_olddq00_wr_en), // Templated
				      .rd_adr(old_olddq00_raddr[4:0]), // Templated
				      .rd_en(old_olddq00_rd_en), // Templated
				      .din(old_olddq00_din[33:0]), // Templated
				      .rdclk(l2clk),		 // Templated
				      .wrclk(l2clk),		 // Templated
				      .scan_in(olddq00_scanin),	 // Templated
				      .tcu_pce_ov(tcu_pce_ov),
				      .tcu_aclk(aclk),		 // Templated
				      .tcu_bclk(bclk),		 // Templated
				      .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				      .tcu_se_scancollar_in(tcu_se_scancollar_in),
				      .tcu_se_scancollar_out(tcu_se_scancollar_out),
				      .bist_clk_mux_sel(tie_low), // Templated
				      .rd_pce(rd_pce),		 // Templated
				      .wr_pce(wr_pce));		 // Templated


   n2_com_dp_32x34_cust      olddq01 (/*AUTOINST*/
				      // Outputs
				      .dout(olddq01_dout[33:0]), // Templated
				      .scan_out(olddq01_scanout), // Templated
				      // Inputs
				      .wr_adr(old_olddq01_waddr[4:0]), // Templated
				      .wr_en(old_olddq01_wr_en), // Templated
				      .rd_adr(old_olddq01_raddr[4:0]), // Templated
				      .rd_en(old_olddq01_rd_en), // Templated
				      .din(old_olddq01_din[33:0]), // Templated
				      .rdclk(l2clk),		 // Templated
				      .wrclk(l2clk),		 // Templated
				      .scan_in(olddq01_scanin),	 // Templated
				      .tcu_pce_ov(tcu_pce_ov),
				      .tcu_aclk(aclk),		 // Templated
				      .tcu_bclk(bclk),		 // Templated
				      .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				      .tcu_se_scancollar_in(tcu_se_scancollar_in),
				      .tcu_se_scancollar_out(tcu_se_scancollar_out),
				      .bist_clk_mux_sel(tie_low), // Templated
				      .rd_pce(rd_pce),		 // Templated
				      .wr_pce(wr_pce));		 // Templated


   sio_old_dp           old0   (/*AUTOINST*/
				// Outputs
				.oldhq_dout_r_bit(oldhq0_dout_r_bit), // Templated
				.oldhq_dout_s_bit(oldhq0_dout_s_bit), // Templated
				.old_opd_data(old0_opd_data[64:0]), // Templated
				.old_opcc_jtag(old0_opcc_jtag),	 // Templated
				.old_olddqx0_wr_en(old_olddq00_wr_en), // Templated
				.old_olddqx0_rd_en(old_olddq00_rd_en), // Templated
				.old_olddqx0_waddr(old_olddq00_waddr[4:0]), // Templated
				.old_olddqx0_raddr(old_olddq00_raddr[4:0]), // Templated
				.old_olddqx0_din(old_olddq00_din[33:0]), // Templated
				.old_olddqx1_wr_en(old_olddq01_wr_en), // Templated
				.old_olddqx1_rd_en(old_olddq01_rd_en), // Templated
				.old_olddqx1_waddr(old_olddq01_waddr[4:0]), // Templated
				.old_olddqx1_raddr(old_olddq01_raddr[4:0]), // Templated
				.old_olddqx1_din(old_olddq01_din[33:0]), // Templated
				.scan_out(old0_scanout),	 // Templated
				// Inputs
				.l2clk	(l2clk),
				.din	(l2b0_sio_data_r[31:0]), // Templated
				.parity	(l2b0_sio_parity_r[1:0]), // Templated
				.ue	(l2b0_sio_ue_err_r),	 // Templated
				.olc_oldue_check_clrerr(olc_oldue0_check_clrerr), // Templated
				.olc_oldue_check_en(olc_oldue0_check_en), // Templated
				.olc_oldue_wr_en(olc_oldue0_wr_en[3:0]), // Templated
				.olc_oldue_rd_addr(olc_oldue0_rd_addr[1:0]), // Templated
				.olddq0_dout(olddq00_dout[33:0]), // Templated
				.olddq1_dout(olddq01_dout[33:0]), // Templated
				.olc_old_selhdr(olc_old0_selhdr), // Templated
				.olc_oldue_selfwd(olc_oldue0_selfwd), // Templated
				.olc_oldue_pass_late_ue(olc_oldue_pass_late_ue0), // Templated
				.olc_oldhq_wr_en(olc_oldhq0_wr_en[3:0]), // Templated
				.olc_oldhq_rd_addr(olc_oldhq0_rd_addr[1:0]), // Templated
				.oldhq_din({l2b0_sio_data_r[`SIO_L2SIO_CTGECC_MSB_BIT : `SIO_L2SIO_CTGECC_LSB_BIT], l2b0_sio_data_r[`SIO_L2SIO_E_BIT], l2b0_sio_data_r[`SIO_L2SIO_R_BIT], l2b0_sio_data_r[`SIO_L2SIO_S_BIT], l2b0_sio_data_r[15:0]}), // Templated
				.ojc_old_jtagsr_en(ojc_old0_jtagsr_en), // Templated
				.ojc_old_wr_en(ojc_old0_wr_en[1:0]), // Templated
				.sio_mbi_run(sio_mb0_run),	 // Templated
				.sio_mbi_old_addr(sio_mb0_old_addr[4:0]), // Templated
				.sio_mbi_old_wdata(sio_mb0_wdata[7:0]), // Templated
				.sio_mbi_oldx_wr_en(sio_mb0_old0x_wr_en), // Templated
				.sio_mbi_oldx_rd_en(sio_mb0_old0x_rd_en), // Templated
				.olc_old_olddqx0_wr_en(olc_old_olddq00_wr_en), // Templated
				.olc_old_olddqx0_rd_en(olc_old_olddq00_rd_en), // Templated
				.olc_old_olddqx0_waddr(olc_old_olddq00_waddr[4:0]), // Templated
				.olc_old_olddqx0_raddr(olc_old_olddq00_raddr[4:0]), // Templated
				.olc_old_olddqx1_wr_en(olc_old_olddq01_wr_en), // Templated
				.olc_old_olddqx1_rd_en(olc_old_olddq01_rd_en), // Templated
				.olc_old_olddqx1_waddr(olc_old_olddq01_waddr[4:0]), // Templated
				.olc_old_olddqx1_raddr(olc_old_olddq01_raddr[4:0]), // Templated
				.tcu_muxtest(tcu_muxtest),
				.tcu_dectest(tcu_dectest),
				.tcu_scan_en(tcu_scan_en),
				.scan_in(old0_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated
   

   sio_olc_ctl          olc0   (/*AUTOINST*/
				// Outputs
				.olc_oldue_check_clrerr(olc_oldue0_check_clrerr), // Templated
				.olc_oldue_check_en(olc_oldue0_check_en), // Templated
				.olc_oldue_wr_en(olc_oldue0_wr_en[3:0]), // Templated
				.olc_oldue_rd_addr(olc_oldue0_rd_addr[1:0]), // Templated
				.olc_oldue_selfwd(olc_oldue0_selfwd), // Templated
				.olc_oldue_pass_late_ue(olc_oldue_pass_late_ue0), // Templated
				.olc_old_selhdr(olc_old0_selhdr), // Templated
				.olc_oldhq_wr_en(olc_oldhq0_wr_en[3:0]), // Templated
				.olc_oldhq_rd_addr(olc_oldhq0_rd_addr[1:0]), // Templated
				.olc_olddq0_wr_en(olc_old_olddq00_wr_en), // Templated
				.olc_olddq0_wr_addr(olc_old_olddq00_waddr[4:0]), // Templated
				.olc_olddq0_rd_en(olc_old_olddq00_rd_en), // Templated
				.olc_olddq0_rd_addr(olc_old_olddq00_raddr[4:0]), // Templated
				.olc_olddq1_wr_en(olc_old_olddq01_wr_en), // Templated
				.olc_olddq1_wr_addr(olc_old_olddq01_waddr[4:0]), // Templated
				.olc_olddq1_rd_en(olc_old_olddq01_rd_en), // Templated
				.olc_olddq1_rd_addr(olc_old_olddq01_raddr[4:0]), // Templated
				.olc_opcc_req(olc0_opcc_req),	 // Templated
				.sio_sii_olc_ilc_dequeue(sio_sii_olc0_ilc0_dequeue), // Templated
				.ojc_old_wr_en(ojc_old0_wr_en[1:0]), // Templated
				.ojc_old_jtagsr_en(ojc_old0_jtagsr_en), // Templated
				.ojc_opcc_sync(ojc0_opcc_sync),	 // Templated
				.ojc_opcc_ack(ojc0_opcc_ack),	 // Templated
				.scan_out(olc0_scanout),	 // Templated
				// Inputs
				.l2clk	(l2clk),
				.l2sio_v_bit(l2b0_sio_ctag_vld_r), // Templated
				.l2sio_r_bit(l2b0_sio_data_r[`SIO_L2SIO_R_BIT]), // Templated
				.l2sio_p_bit(l2b0_sio_data_r[`SIO_L2SIO_P_BIT]), // Templated
				.l2sio_j_bit(l2b0_sio_data_r[`SIO_L2SIO_J_BIT]), // Templated
				.l2b_sio_ue_err_r(l2b0_sio_ue_err_r), // Templated
				.opcc_olc_gnt(opcc_olc0_gnt),	 // Templated
				.tcu_scan_en(tcu_scan_en),
				.scan_in(olc0_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated

// ========= Outbound L2 bank 0 ========

// ========= Outbound L2 bank 1 ========

   sio_stg1_dp		     stg1   (/*AUTOINST*/
				     // Outputs
				     .l2b_sio_data_r(l2b1_sio_data_r[31:0]), // Templated
				     .l2b_sio_parity_r(l2b1_sio_parity_r[1:0]), // Templated
				     .l2b_sio_ue_err_r(l2b1_sio_ue_err_r), // Templated
				     .l2b_sio_ctag_vld_r(l2b1_sio_ctag_vld_r), // Templated
				     .scan_out(stg1_scanout),	 // Templated
				     // Inputs
				     .l2clk(l2clk),
				     .l2b_sio_data(l2b1_sio_data[31:0]), // Templated
				     .l2b_sio_parity(l2b1_sio_parity[1:0]), // Templated
				     .l2b_sio_ue_err(l2b1_sio_ue_err), // Templated
				     .l2b_sio_ctag_vld(l2b1_sio_ctag_vld), // Templated
				     .tcu_muxtest(tcu_muxtest),
				     .tcu_dectest(tcu_dectest),
				     .tcu_scan_en(tcu_scan_en),
				     .scan_in(stg1_scanin),	 // Templated
				     .tcu_aclk(aclk),		 // Templated
				     .tcu_bclk(bclk),		 // Templated
				     .tcu_pce_ov(tcu_pce_ov),
				     .tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated

   n2_com_dp_32x34_cust      olddq10 (/*AUTOINST*/
				      // Outputs
				      .dout(olddq10_dout[33:0]), // Templated
				      .scan_out(olddq10_scanout), // Templated
				      // Inputs
				      .wr_adr(old_olddq10_waddr[4:0]), // Templated
				      .wr_en(old_olddq10_wr_en), // Templated
				      .rd_adr(old_olddq10_raddr[4:0]), // Templated
				      .rd_en(old_olddq10_rd_en), // Templated
				      .din(old_olddq10_din[33:0]), // Templated
				      .rdclk(l2clk),		 // Templated
				      .wrclk(l2clk),		 // Templated
				      .scan_in(olddq10_scanin),	 // Templated
				      .tcu_pce_ov(tcu_pce_ov),
				      .tcu_aclk(aclk),		 // Templated
				      .tcu_bclk(bclk),		 // Templated
				      .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				      .tcu_se_scancollar_in(tcu_se_scancollar_in),
				      .tcu_se_scancollar_out(tcu_se_scancollar_out),
				      .bist_clk_mux_sel(tie_low), // Templated
				      .rd_pce(rd_pce),		 // Templated
				      .wr_pce(wr_pce));		 // Templated


   n2_com_dp_32x34_cust      olddq11 (/*AUTOINST*/
				      // Outputs
				      .dout(olddq11_dout[33:0]), // Templated
				      .scan_out(olddq11_scanout), // Templated
				      // Inputs
				      .wr_adr(old_olddq11_waddr[4:0]), // Templated
				      .wr_en(old_olddq11_wr_en), // Templated
				      .rd_adr(old_olddq11_raddr[4:0]), // Templated
				      .rd_en(old_olddq11_rd_en), // Templated
				      .din(old_olddq11_din[33:0]), // Templated
				      .rdclk(l2clk),		 // Templated
				      .wrclk(l2clk),		 // Templated
				      .scan_in(olddq11_scanin),	 // Templated
				      .tcu_pce_ov(tcu_pce_ov),
				      .tcu_aclk(aclk),		 // Templated
				      .tcu_bclk(bclk),		 // Templated
				      .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				      .tcu_se_scancollar_in(tcu_se_scancollar_in),
				      .tcu_se_scancollar_out(tcu_se_scancollar_out),
				      .bist_clk_mux_sel(tie_low), // Templated
				      .rd_pce(rd_pce),		 // Templated
				      .wr_pce(wr_pce));		 // Templated


   sio_old_dp           old1   (/*AUTOINST*/
				// Outputs
				.oldhq_dout_r_bit(oldhq1_dout_r_bit), // Templated
				.oldhq_dout_s_bit(oldhq1_dout_s_bit), // Templated
				.old_opd_data(old1_opd_data[64:0]), // Templated
				.old_opcc_jtag(old1_opcc_jtag),	 // Templated
				.old_olddqx0_wr_en(old_olddq10_wr_en), // Templated
				.old_olddqx0_rd_en(old_olddq10_rd_en), // Templated
				.old_olddqx0_waddr(old_olddq10_waddr[4:0]), // Templated
				.old_olddqx0_raddr(old_olddq10_raddr[4:0]), // Templated
				.old_olddqx0_din(old_olddq10_din[33:0]), // Templated
				.old_olddqx1_wr_en(old_olddq11_wr_en), // Templated
				.old_olddqx1_rd_en(old_olddq11_rd_en), // Templated
				.old_olddqx1_waddr(old_olddq11_waddr[4:0]), // Templated
				.old_olddqx1_raddr(old_olddq11_raddr[4:0]), // Templated
				.old_olddqx1_din(old_olddq11_din[33:0]), // Templated
				.scan_out(old1_scanout),	 // Templated
				// Inputs
				.l2clk	(l2clk),
				.din	(l2b1_sio_data_r[31:0]), // Templated
				.parity	(l2b1_sio_parity_r[1:0]), // Templated
				.ue	(l2b1_sio_ue_err_r),	 // Templated
				.olc_oldue_check_clrerr(olc_oldue1_check_clrerr), // Templated
				.olc_oldue_check_en(olc_oldue1_check_en), // Templated
				.olc_oldue_wr_en(olc_oldue1_wr_en[3:0]), // Templated
				.olc_oldue_rd_addr(olc_oldue1_rd_addr[1:0]), // Templated
				.olddq0_dout(olddq10_dout[33:0]), // Templated
				.olddq1_dout(olddq11_dout[33:0]), // Templated
				.olc_old_selhdr(olc_old1_selhdr), // Templated
				.olc_oldue_selfwd(olc_oldue1_selfwd), // Templated
				.olc_oldue_pass_late_ue(olc_oldue_pass_late_ue1), // Templated
				.olc_oldhq_wr_en(olc_oldhq1_wr_en[3:0]), // Templated
				.olc_oldhq_rd_addr(olc_oldhq1_rd_addr[1:0]), // Templated
				.oldhq_din({l2b1_sio_data_r[`SIO_L2SIO_CTGECC_MSB_BIT : `SIO_L2SIO_CTGECC_LSB_BIT], l2b1_sio_data_r[`SIO_L2SIO_E_BIT], l2b1_sio_data_r[`SIO_L2SIO_R_BIT], l2b1_sio_data_r[`SIO_L2SIO_S_BIT], l2b1_sio_data_r[15:0]}), // Templated
				.ojc_old_jtagsr_en(ojc_old1_jtagsr_en), // Templated
				.ojc_old_wr_en(ojc_old1_wr_en[1:0]), // Templated
				.sio_mbi_run(sio_mb0_run),	 // Templated
				.sio_mbi_old_addr(sio_mb0_old_addr[4:0]), // Templated
				.sio_mbi_old_wdata(sio_mb0_wdata[7:0]), // Templated
				.sio_mbi_oldx_wr_en(sio_mb0_old1x_wr_en), // Templated
				.sio_mbi_oldx_rd_en(sio_mb0_old1x_rd_en), // Templated
				.olc_old_olddqx0_wr_en(olc_old_olddq10_wr_en), // Templated
				.olc_old_olddqx0_rd_en(olc_old_olddq10_rd_en), // Templated
				.olc_old_olddqx0_waddr(olc_old_olddq10_waddr[4:0]), // Templated
				.olc_old_olddqx0_raddr(olc_old_olddq10_raddr[4:0]), // Templated
				.olc_old_olddqx1_wr_en(olc_old_olddq11_wr_en), // Templated
				.olc_old_olddqx1_rd_en(olc_old_olddq11_rd_en), // Templated
				.olc_old_olddqx1_waddr(olc_old_olddq11_waddr[4:0]), // Templated
				.olc_old_olddqx1_raddr(olc_old_olddq11_raddr[4:0]), // Templated
				.tcu_muxtest(tcu_muxtest),
				.tcu_dectest(tcu_dectest),
				.tcu_scan_en(tcu_scan_en),
				.scan_in(old1_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated
   

   sio_olc_ctl          olc1   (/*AUTOINST*/
				// Outputs
				.olc_oldue_check_clrerr(olc_oldue1_check_clrerr), // Templated
				.olc_oldue_check_en(olc_oldue1_check_en), // Templated
				.olc_oldue_wr_en(olc_oldue1_wr_en[3:0]), // Templated
				.olc_oldue_rd_addr(olc_oldue1_rd_addr[1:0]), // Templated
				.olc_oldue_selfwd(olc_oldue1_selfwd), // Templated
				.olc_oldue_pass_late_ue(olc_oldue_pass_late_ue1), // Templated
				.olc_old_selhdr(olc_old1_selhdr), // Templated
				.olc_oldhq_wr_en(olc_oldhq1_wr_en[3:0]), // Templated
				.olc_oldhq_rd_addr(olc_oldhq1_rd_addr[1:0]), // Templated
				.olc_olddq0_wr_en(olc_old_olddq10_wr_en), // Templated
				.olc_olddq0_wr_addr(olc_old_olddq10_waddr[4:0]), // Templated
				.olc_olddq0_rd_en(olc_old_olddq10_rd_en), // Templated
				.olc_olddq0_rd_addr(olc_old_olddq10_raddr[4:0]), // Templated
				.olc_olddq1_wr_en(olc_old_olddq11_wr_en), // Templated
				.olc_olddq1_wr_addr(olc_old_olddq11_waddr[4:0]), // Templated
				.olc_olddq1_rd_en(olc_old_olddq11_rd_en), // Templated
				.olc_olddq1_rd_addr(olc_old_olddq11_raddr[4:0]), // Templated
				.olc_opcc_req(olc1_opcc_req),	 // Templated
				.sio_sii_olc_ilc_dequeue(sio_sii_olc1_ilc1_dequeue), // Templated
				.ojc_old_wr_en(ojc_old1_wr_en[1:0]), // Templated
				.ojc_old_jtagsr_en(ojc_old1_jtagsr_en), // Templated
				.ojc_opcc_sync(ojc1_opcc_sync),	 // Templated
				.ojc_opcc_ack(ojc1_opcc_ack),	 // Templated
				.scan_out(olc1_scanout),	 // Templated
				// Inputs
				.l2clk	(l2clk),
				.l2sio_v_bit(l2b1_sio_ctag_vld_r), // Templated
				.l2sio_r_bit(l2b1_sio_data_r[`SIO_L2SIO_R_BIT]), // Templated
				.l2sio_p_bit(l2b1_sio_data_r[`SIO_L2SIO_P_BIT]), // Templated
				.l2sio_j_bit(l2b1_sio_data_r[`SIO_L2SIO_J_BIT]), // Templated
				.l2b_sio_ue_err_r(l2b1_sio_ue_err_r), // Templated
				.opcc_olc_gnt(opcc_olc1_gnt),	 // Templated
				.tcu_scan_en(tcu_scan_en),
				.scan_in(olc1_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated

// ========= Outbound L2 bank 1 ========

// ========= Outbound L2 bank 2 ========
   sio_stg1_dp		     stg2   (/*AUTOINST*/
				     // Outputs
				     .l2b_sio_data_r(l2b2_sio_data_r[31:0]), // Templated
				     .l2b_sio_parity_r(l2b2_sio_parity_r[1:0]), // Templated
				     .l2b_sio_ue_err_r(l2b2_sio_ue_err_r), // Templated
				     .l2b_sio_ctag_vld_r(l2b2_sio_ctag_vld_r), // Templated
				     .scan_out(stg2_scanout),	 // Templated
				     // Inputs
				     .l2clk(l2clk),
				     .l2b_sio_data(l2b2_sio_data[31:0]), // Templated
				     .l2b_sio_parity(l2b2_sio_parity[1:0]), // Templated
				     .l2b_sio_ue_err(l2b2_sio_ue_err), // Templated
				     .l2b_sio_ctag_vld(l2b2_sio_ctag_vld), // Templated
				     .tcu_muxtest(tcu_muxtest),
				     .tcu_dectest(tcu_dectest),
				     .tcu_scan_en(tcu_scan_en),
				     .scan_in(stg2_scanin),	 // Templated
				     .tcu_aclk(aclk),		 // Templated
				     .tcu_bclk(bclk),		 // Templated
				     .tcu_pce_ov(tcu_pce_ov),
				     .tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated

   n2_com_dp_32x34_cust      olddq20 (/*AUTOINST*/
				      // Outputs
				      .dout(olddq20_dout[33:0]), // Templated
				      .scan_out(olddq20_scanout), // Templated
				      // Inputs
				      .wr_adr(old_olddq20_waddr[4:0]), // Templated
				      .wr_en(old_olddq20_wr_en), // Templated
				      .rd_adr(old_olddq20_raddr[4:0]), // Templated
				      .rd_en(old_olddq20_rd_en), // Templated
				      .din(old_olddq20_din[33:0]), // Templated
				      .rdclk(l2clk),		 // Templated
				      .wrclk(l2clk),		 // Templated
				      .scan_in(olddq20_scanin),	 // Templated
				      .tcu_pce_ov(tcu_pce_ov),
				      .tcu_aclk(aclk),		 // Templated
				      .tcu_bclk(bclk),		 // Templated
				      .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				      .tcu_se_scancollar_in(tcu_se_scancollar_in),
				      .tcu_se_scancollar_out(tcu_se_scancollar_out),
				      .bist_clk_mux_sel(tie_low), // Templated
				      .rd_pce(rd_pce),		 // Templated
				      .wr_pce(wr_pce));		 // Templated


   n2_com_dp_32x34_cust      olddq21 (/*AUTOINST*/
				      // Outputs
				      .dout(olddq21_dout[33:0]), // Templated
				      .scan_out(olddq21_scanout), // Templated
				      // Inputs
				      .wr_adr(old_olddq21_waddr[4:0]), // Templated
				      .wr_en(old_olddq21_wr_en), // Templated
				      .rd_adr(old_olddq21_raddr[4:0]), // Templated
				      .rd_en(old_olddq21_rd_en), // Templated
				      .din(old_olddq21_din[33:0]), // Templated
				      .rdclk(l2clk),		 // Templated
				      .wrclk(l2clk),		 // Templated
				      .scan_in(olddq21_scanin),	 // Templated
				      .tcu_pce_ov(tcu_pce_ov),
				      .tcu_aclk(aclk),		 // Templated
				      .tcu_bclk(bclk),		 // Templated
				      .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				      .tcu_se_scancollar_in(tcu_se_scancollar_in),
				      .tcu_se_scancollar_out(tcu_se_scancollar_out),
				      .bist_clk_mux_sel(tie_low), // Templated
				      .rd_pce(rd_pce),		 // Templated
				      .wr_pce(wr_pce));		 // Templated


   sio_old_dp           old2   (/*AUTOINST*/
				// Outputs
				.oldhq_dout_r_bit(oldhq2_dout_r_bit), // Templated
				.oldhq_dout_s_bit(oldhq2_dout_s_bit), // Templated
				.old_opd_data(old2_opd_data[64:0]), // Templated
				.old_opcc_jtag(old2_opcc_jtag),	 // Templated
				.old_olddqx0_wr_en(old_olddq20_wr_en), // Templated
				.old_olddqx0_rd_en(old_olddq20_rd_en), // Templated
				.old_olddqx0_waddr(old_olddq20_waddr[4:0]), // Templated
				.old_olddqx0_raddr(old_olddq20_raddr[4:0]), // Templated
				.old_olddqx0_din(old_olddq20_din[33:0]), // Templated
				.old_olddqx1_wr_en(old_olddq21_wr_en), // Templated
				.old_olddqx1_rd_en(old_olddq21_rd_en), // Templated
				.old_olddqx1_waddr(old_olddq21_waddr[4:0]), // Templated
				.old_olddqx1_raddr(old_olddq21_raddr[4:0]), // Templated
				.old_olddqx1_din(old_olddq21_din[33:0]), // Templated
				.scan_out(old2_scanout),	 // Templated
				// Inputs
				.l2clk	(l2clk),
				.din	(l2b2_sio_data_r[31:0]), // Templated
				.parity	(l2b2_sio_parity_r[1:0]), // Templated
				.ue	(l2b2_sio_ue_err_r),	 // Templated
				.olc_oldue_check_clrerr(olc_oldue2_check_clrerr), // Templated
				.olc_oldue_check_en(olc_oldue2_check_en), // Templated
				.olc_oldue_wr_en(olc_oldue2_wr_en[3:0]), // Templated
				.olc_oldue_rd_addr(olc_oldue2_rd_addr[1:0]), // Templated
				.olddq0_dout(olddq20_dout[33:0]), // Templated
				.olddq1_dout(olddq21_dout[33:0]), // Templated
				.olc_old_selhdr(olc_old2_selhdr), // Templated
				.olc_oldue_selfwd(olc_oldue2_selfwd), // Templated
				.olc_oldue_pass_late_ue(olc_oldue_pass_late_ue2), // Templated
				.olc_oldhq_wr_en(olc_oldhq2_wr_en[3:0]), // Templated
				.olc_oldhq_rd_addr(olc_oldhq2_rd_addr[1:0]), // Templated
				.oldhq_din({l2b2_sio_data_r[`SIO_L2SIO_CTGECC_MSB_BIT : `SIO_L2SIO_CTGECC_LSB_BIT], l2b2_sio_data_r[`SIO_L2SIO_E_BIT], l2b2_sio_data_r[`SIO_L2SIO_R_BIT], l2b2_sio_data_r[`SIO_L2SIO_S_BIT], l2b2_sio_data_r[15:0]}), // Templated
				.ojc_old_jtagsr_en(ojc_old2_jtagsr_en), // Templated
				.ojc_old_wr_en(ojc_old2_wr_en[1:0]), // Templated
				.sio_mbi_run(sio_mb0_run),	 // Templated
				.sio_mbi_old_addr(sio_mb0_old_addr[4:0]), // Templated
				.sio_mbi_old_wdata(sio_mb0_wdata[7:0]), // Templated
				.sio_mbi_oldx_wr_en(sio_mb0_old2x_wr_en), // Templated
				.sio_mbi_oldx_rd_en(sio_mb0_old2x_rd_en), // Templated
				.olc_old_olddqx0_wr_en(olc_old_olddq20_wr_en), // Templated
				.olc_old_olddqx0_rd_en(olc_old_olddq20_rd_en), // Templated
				.olc_old_olddqx0_waddr(olc_old_olddq20_waddr[4:0]), // Templated
				.olc_old_olddqx0_raddr(olc_old_olddq20_raddr[4:0]), // Templated
				.olc_old_olddqx1_wr_en(olc_old_olddq21_wr_en), // Templated
				.olc_old_olddqx1_rd_en(olc_old_olddq21_rd_en), // Templated
				.olc_old_olddqx1_waddr(olc_old_olddq21_waddr[4:0]), // Templated
				.olc_old_olddqx1_raddr(olc_old_olddq21_raddr[4:0]), // Templated
				.tcu_muxtest(tcu_muxtest),
				.tcu_dectest(tcu_dectest),
				.tcu_scan_en(tcu_scan_en),
				.scan_in(old2_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated
   

   sio_olc_ctl          olc2   (/*AUTOINST*/
				// Outputs
				.olc_oldue_check_clrerr(olc_oldue2_check_clrerr), // Templated
				.olc_oldue_check_en(olc_oldue2_check_en), // Templated
				.olc_oldue_wr_en(olc_oldue2_wr_en[3:0]), // Templated
				.olc_oldue_rd_addr(olc_oldue2_rd_addr[1:0]), // Templated
				.olc_oldue_selfwd(olc_oldue2_selfwd), // Templated
				.olc_oldue_pass_late_ue(olc_oldue_pass_late_ue2), // Templated
				.olc_old_selhdr(olc_old2_selhdr), // Templated
				.olc_oldhq_wr_en(olc_oldhq2_wr_en[3:0]), // Templated
				.olc_oldhq_rd_addr(olc_oldhq2_rd_addr[1:0]), // Templated
				.olc_olddq0_wr_en(olc_old_olddq20_wr_en), // Templated
				.olc_olddq0_wr_addr(olc_old_olddq20_waddr[4:0]), // Templated
				.olc_olddq0_rd_en(olc_old_olddq20_rd_en), // Templated
				.olc_olddq0_rd_addr(olc_old_olddq20_raddr[4:0]), // Templated
				.olc_olddq1_wr_en(olc_old_olddq21_wr_en), // Templated
				.olc_olddq1_wr_addr(olc_old_olddq21_waddr[4:0]), // Templated
				.olc_olddq1_rd_en(olc_old_olddq21_rd_en), // Templated
				.olc_olddq1_rd_addr(olc_old_olddq21_raddr[4:0]), // Templated
				.olc_opcc_req(olc2_opcc_req),	 // Templated
				.sio_sii_olc_ilc_dequeue(sio_sii_olc2_ilc2_dequeue), // Templated
				.ojc_old_wr_en(ojc_old2_wr_en[1:0]), // Templated
				.ojc_old_jtagsr_en(ojc_old2_jtagsr_en), // Templated
				.ojc_opcc_sync(ojc2_opcc_sync),	 // Templated
				.ojc_opcc_ack(ojc2_opcc_ack),	 // Templated
				.scan_out(olc2_scanout),	 // Templated
				// Inputs
				.l2clk	(l2clk),
				.l2sio_v_bit(l2b2_sio_ctag_vld_r), // Templated
				.l2sio_r_bit(l2b2_sio_data_r[`SIO_L2SIO_R_BIT]), // Templated
				.l2sio_p_bit(l2b2_sio_data_r[`SIO_L2SIO_P_BIT]), // Templated
				.l2sio_j_bit(l2b2_sio_data_r[`SIO_L2SIO_J_BIT]), // Templated
				.l2b_sio_ue_err_r(l2b2_sio_ue_err_r), // Templated
				.opcc_olc_gnt(opcc_olc2_gnt),	 // Templated
				.tcu_scan_en(tcu_scan_en),
				.scan_in(olc2_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated

// ========= Outbound L2 bank 2 ========

// ========= Outbound L2 bank 3 ========
   sio_stg1_dp		     stg3   (/*AUTOINST*/
				     // Outputs
				     .l2b_sio_data_r(l2b3_sio_data_r[31:0]), // Templated
				     .l2b_sio_parity_r(l2b3_sio_parity_r[1:0]), // Templated
				     .l2b_sio_ue_err_r(l2b3_sio_ue_err_r), // Templated
				     .l2b_sio_ctag_vld_r(l2b3_sio_ctag_vld_r), // Templated
				     .scan_out(stg3_scanout),	 // Templated
				     // Inputs
				     .l2clk(l2clk),
				     .l2b_sio_data(l2b3_sio_data[31:0]), // Templated
				     .l2b_sio_parity(l2b3_sio_parity[1:0]), // Templated
				     .l2b_sio_ue_err(l2b3_sio_ue_err), // Templated
				     .l2b_sio_ctag_vld(l2b3_sio_ctag_vld), // Templated
				     .tcu_muxtest(tcu_muxtest),
				     .tcu_dectest(tcu_dectest),
				     .tcu_scan_en(tcu_scan_en),
				     .scan_in(stg3_scanin),	 // Templated
				     .tcu_aclk(aclk),		 // Templated
				     .tcu_bclk(bclk),		 // Templated
				     .tcu_pce_ov(tcu_pce_ov),
				     .tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated

   n2_com_dp_32x34_cust      olddq30 (/*AUTOINST*/
				      // Outputs
				      .dout(olddq30_dout[33:0]), // Templated
				      .scan_out(olddq30_scanout), // Templated
				      // Inputs
				      .wr_adr(old_olddq30_waddr[4:0]), // Templated
				      .wr_en(old_olddq30_wr_en), // Templated
				      .rd_adr(old_olddq30_raddr[4:0]), // Templated
				      .rd_en(old_olddq30_rd_en), // Templated
				      .din(old_olddq30_din[33:0]), // Templated
				      .rdclk(l2clk),		 // Templated
				      .wrclk(l2clk),		 // Templated
				      .scan_in(olddq30_scanin),	 // Templated
				      .tcu_pce_ov(tcu_pce_ov),
				      .tcu_aclk(aclk),		 // Templated
				      .tcu_bclk(bclk),		 // Templated
				      .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				      .tcu_se_scancollar_in(tcu_se_scancollar_in),
				      .tcu_se_scancollar_out(tcu_se_scancollar_out),
				      .bist_clk_mux_sel(tie_low), // Templated
				      .rd_pce(rd_pce),		 // Templated
				      .wr_pce(wr_pce));		 // Templated


   n2_com_dp_32x34_cust      olddq31 (/*AUTOINST*/
				      // Outputs
				      .dout(olddq31_dout[33:0]), // Templated
				      .scan_out(olddq31_scanout), // Templated
				      // Inputs
				      .wr_adr(old_olddq31_waddr[4:0]), // Templated
				      .wr_en(old_olddq31_wr_en), // Templated
				      .rd_adr(old_olddq31_raddr[4:0]), // Templated
				      .rd_en(old_olddq31_rd_en), // Templated
				      .din(old_olddq31_din[33:0]), // Templated
				      .rdclk(l2clk),		 // Templated
				      .wrclk(l2clk),		 // Templated
				      .scan_in(olddq31_scanin),	 // Templated
				      .tcu_pce_ov(tcu_pce_ov),
				      .tcu_aclk(aclk),		 // Templated
				      .tcu_bclk(bclk),		 // Templated
				      .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				      .tcu_se_scancollar_in(tcu_se_scancollar_in),
				      .tcu_se_scancollar_out(tcu_se_scancollar_out),
				      .bist_clk_mux_sel(tie_low), // Templated
				      .rd_pce(rd_pce),		 // Templated
				      .wr_pce(wr_pce));		 // Templated


   sio_old_dp           old3   (/*AUTOINST*/
				// Outputs
				.oldhq_dout_r_bit(oldhq3_dout_r_bit), // Templated
				.oldhq_dout_s_bit(oldhq3_dout_s_bit), // Templated
				.old_opd_data(old3_opd_data[64:0]), // Templated
				.old_opcc_jtag(old3_opcc_jtag),	 // Templated
				.old_olddqx0_wr_en(old_olddq30_wr_en), // Templated
				.old_olddqx0_rd_en(old_olddq30_rd_en), // Templated
				.old_olddqx0_waddr(old_olddq30_waddr[4:0]), // Templated
				.old_olddqx0_raddr(old_olddq30_raddr[4:0]), // Templated
				.old_olddqx0_din(old_olddq30_din[33:0]), // Templated
				.old_olddqx1_wr_en(old_olddq31_wr_en), // Templated
				.old_olddqx1_rd_en(old_olddq31_rd_en), // Templated
				.old_olddqx1_waddr(old_olddq31_waddr[4:0]), // Templated
				.old_olddqx1_raddr(old_olddq31_raddr[4:0]), // Templated
				.old_olddqx1_din(old_olddq31_din[33:0]), // Templated
				.scan_out(old3_scanout),	 // Templated
				// Inputs
				.l2clk	(l2clk),
				.din	(l2b3_sio_data_r[31:0]), // Templated
				.parity	(l2b3_sio_parity_r[1:0]), // Templated
				.ue	(l2b3_sio_ue_err_r),	 // Templated
				.olc_oldue_check_clrerr(olc_oldue3_check_clrerr), // Templated
				.olc_oldue_check_en(olc_oldue3_check_en), // Templated
				.olc_oldue_wr_en(olc_oldue3_wr_en[3:0]), // Templated
				.olc_oldue_rd_addr(olc_oldue3_rd_addr[1:0]), // Templated
				.olddq0_dout(olddq30_dout[33:0]), // Templated
				.olddq1_dout(olddq31_dout[33:0]), // Templated
				.olc_old_selhdr(olc_old3_selhdr), // Templated
				.olc_oldue_selfwd(olc_oldue3_selfwd), // Templated
				.olc_oldue_pass_late_ue(olc_oldue_pass_late_ue3), // Templated
				.olc_oldhq_wr_en(olc_oldhq3_wr_en[3:0]), // Templated
				.olc_oldhq_rd_addr(olc_oldhq3_rd_addr[1:0]), // Templated
				.oldhq_din({l2b3_sio_data_r[`SIO_L2SIO_CTGECC_MSB_BIT : `SIO_L2SIO_CTGECC_LSB_BIT], l2b3_sio_data_r[`SIO_L2SIO_E_BIT], l2b3_sio_data_r[`SIO_L2SIO_R_BIT], l2b3_sio_data_r[`SIO_L2SIO_S_BIT], l2b3_sio_data_r[15:0]}), // Templated
				.ojc_old_jtagsr_en(ojc_old3_jtagsr_en), // Templated
				.ojc_old_wr_en(ojc_old3_wr_en[1:0]), // Templated
				.sio_mbi_run(sio_mb0_run),	 // Templated
				.sio_mbi_old_addr(sio_mb0_old_addr[4:0]), // Templated
				.sio_mbi_old_wdata(sio_mb0_wdata[7:0]), // Templated
				.sio_mbi_oldx_wr_en(sio_mb0_old3x_wr_en), // Templated
				.sio_mbi_oldx_rd_en(sio_mb0_old3x_rd_en), // Templated
				.olc_old_olddqx0_wr_en(olc_old_olddq30_wr_en), // Templated
				.olc_old_olddqx0_rd_en(olc_old_olddq30_rd_en), // Templated
				.olc_old_olddqx0_waddr(olc_old_olddq30_waddr[4:0]), // Templated
				.olc_old_olddqx0_raddr(olc_old_olddq30_raddr[4:0]), // Templated
				.olc_old_olddqx1_wr_en(olc_old_olddq31_wr_en), // Templated
				.olc_old_olddqx1_rd_en(olc_old_olddq31_rd_en), // Templated
				.olc_old_olddqx1_waddr(olc_old_olddq31_waddr[4:0]), // Templated
				.olc_old_olddqx1_raddr(olc_old_olddq31_raddr[4:0]), // Templated
				.tcu_muxtest(tcu_muxtest),
				.tcu_dectest(tcu_dectest),
				.tcu_scan_en(tcu_scan_en),
				.scan_in(old3_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated
   

   sio_olc_ctl          olc3   (/*AUTOINST*/
				// Outputs
				.olc_oldue_check_clrerr(olc_oldue3_check_clrerr), // Templated
				.olc_oldue_check_en(olc_oldue3_check_en), // Templated
				.olc_oldue_wr_en(olc_oldue3_wr_en[3:0]), // Templated
				.olc_oldue_rd_addr(olc_oldue3_rd_addr[1:0]), // Templated
				.olc_oldue_selfwd(olc_oldue3_selfwd), // Templated
				.olc_oldue_pass_late_ue(olc_oldue_pass_late_ue3), // Templated
				.olc_old_selhdr(olc_old3_selhdr), // Templated
				.olc_oldhq_wr_en(olc_oldhq3_wr_en[3:0]), // Templated
				.olc_oldhq_rd_addr(olc_oldhq3_rd_addr[1:0]), // Templated
				.olc_olddq0_wr_en(olc_old_olddq30_wr_en), // Templated
				.olc_olddq0_wr_addr(olc_old_olddq30_waddr[4:0]), // Templated
				.olc_olddq0_rd_en(olc_old_olddq30_rd_en), // Templated
				.olc_olddq0_rd_addr(olc_old_olddq30_raddr[4:0]), // Templated
				.olc_olddq1_wr_en(olc_old_olddq31_wr_en), // Templated
				.olc_olddq1_wr_addr(olc_old_olddq31_waddr[4:0]), // Templated
				.olc_olddq1_rd_en(olc_old_olddq31_rd_en), // Templated
				.olc_olddq1_rd_addr(olc_old_olddq31_raddr[4:0]), // Templated
				.olc_opcc_req(olc3_opcc_req),	 // Templated
				.sio_sii_olc_ilc_dequeue(sio_sii_olc3_ilc3_dequeue), // Templated
				.ojc_old_wr_en(ojc_old3_wr_en[1:0]), // Templated
				.ojc_old_jtagsr_en(ojc_old3_jtagsr_en), // Templated
				.ojc_opcc_sync(ojc3_opcc_sync),	 // Templated
				.ojc_opcc_ack(ojc3_opcc_ack),	 // Templated
				.scan_out(olc3_scanout),	 // Templated
				// Inputs
				.l2clk	(l2clk),
				.l2sio_v_bit(l2b3_sio_ctag_vld_r), // Templated
				.l2sio_r_bit(l2b3_sio_data_r[`SIO_L2SIO_R_BIT]), // Templated
				.l2sio_p_bit(l2b3_sio_data_r[`SIO_L2SIO_P_BIT]), // Templated
				.l2sio_j_bit(l2b3_sio_data_r[`SIO_L2SIO_J_BIT]), // Templated
				.l2b_sio_ue_err_r(l2b3_sio_ue_err_r), // Templated
				.opcc_olc_gnt(opcc_olc3_gnt),	 // Templated
				.tcu_scan_en(tcu_scan_en),
				.scan_in(olc3_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated

// ========= Outbound L2 bank 3 ========

// ========= Outbound L2 bank 4 ========
   sio_stg1_dp		     stg4   (/*AUTOINST*/
				     // Outputs
				     .l2b_sio_data_r(l2b4_sio_data_r[31:0]), // Templated
				     .l2b_sio_parity_r(l2b4_sio_parity_r[1:0]), // Templated
				     .l2b_sio_ue_err_r(l2b4_sio_ue_err_r), // Templated
				     .l2b_sio_ctag_vld_r(l2b4_sio_ctag_vld_r), // Templated
				     .scan_out(stg4_scanout),	 // Templated
				     // Inputs
				     .l2clk(l2clk),
				     .l2b_sio_data(l2b4_sio_data[31:0]), // Templated
				     .l2b_sio_parity(l2b4_sio_parity[1:0]), // Templated
				     .l2b_sio_ue_err(l2b4_sio_ue_err), // Templated
				     .l2b_sio_ctag_vld(l2b4_sio_ctag_vld), // Templated
				     .tcu_muxtest(tcu_muxtest),
				     .tcu_dectest(tcu_dectest),
				     .tcu_scan_en(tcu_scan_en),
				     .scan_in(stg4_scanin),	 // Templated
				     .tcu_aclk(aclk),		 // Templated
				     .tcu_bclk(bclk),		 // Templated
				     .tcu_pce_ov(tcu_pce_ov),
				     .tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated

   n2_com_dp_32x34_cust      olddq40 (/*AUTOINST*/
				      // Outputs
				      .dout(olddq40_dout[33:0]), // Templated
				      .scan_out(olddq40_scanout), // Templated
				      // Inputs
				      .wr_adr(old_olddq40_waddr[4:0]), // Templated
				      .wr_en(old_olddq40_wr_en), // Templated
				      .rd_adr(old_olddq40_raddr[4:0]), // Templated
				      .rd_en(old_olddq40_rd_en), // Templated
				      .din(old_olddq40_din[33:0]), // Templated
				      .rdclk(l2clk),		 // Templated
				      .wrclk(l2clk),		 // Templated
				      .scan_in(olddq40_scanin),	 // Templated
				      .tcu_pce_ov(tcu_pce_ov),
				      .tcu_aclk(aclk),		 // Templated
				      .tcu_bclk(bclk),		 // Templated
				      .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				      .tcu_se_scancollar_in(tcu_se_scancollar_in),
				      .tcu_se_scancollar_out(tcu_se_scancollar_out),
				      .bist_clk_mux_sel(tie_low), // Templated
				      .rd_pce(rd_pce),		 // Templated
				      .wr_pce(wr_pce));		 // Templated


   n2_com_dp_32x34_cust      olddq41 (/*AUTOINST*/
				      // Outputs
				      .dout(olddq41_dout[33:0]), // Templated
				      .scan_out(olddq41_scanout), // Templated
				      // Inputs
				      .wr_adr(old_olddq41_waddr[4:0]), // Templated
				      .wr_en(old_olddq41_wr_en), // Templated
				      .rd_adr(old_olddq41_raddr[4:0]), // Templated
				      .rd_en(old_olddq41_rd_en), // Templated
				      .din(old_olddq41_din[33:0]), // Templated
				      .rdclk(l2clk),		 // Templated
				      .wrclk(l2clk),		 // Templated
				      .scan_in(olddq41_scanin),	 // Templated
				      .tcu_pce_ov(tcu_pce_ov),
				      .tcu_aclk(aclk),		 // Templated
				      .tcu_bclk(bclk),		 // Templated
				      .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				      .tcu_se_scancollar_in(tcu_se_scancollar_in),
				      .tcu_se_scancollar_out(tcu_se_scancollar_out),
				      .bist_clk_mux_sel(tie_low), // Templated
				      .rd_pce(rd_pce),		 // Templated
				      .wr_pce(wr_pce));		 // Templated


   sio_old_dp           old4   (/*AUTOINST*/
				// Outputs
				.oldhq_dout_r_bit(oldhq4_dout_r_bit), // Templated
				.oldhq_dout_s_bit(oldhq4_dout_s_bit), // Templated
				.old_opd_data(old4_opd_data[64:0]), // Templated
				.old_opcc_jtag(old4_opcc_jtag),	 // Templated
				.old_olddqx0_wr_en(old_olddq40_wr_en), // Templated
				.old_olddqx0_rd_en(old_olddq40_rd_en), // Templated
				.old_olddqx0_waddr(old_olddq40_waddr[4:0]), // Templated
				.old_olddqx0_raddr(old_olddq40_raddr[4:0]), // Templated
				.old_olddqx0_din(old_olddq40_din[33:0]), // Templated
				.old_olddqx1_wr_en(old_olddq41_wr_en), // Templated
				.old_olddqx1_rd_en(old_olddq41_rd_en), // Templated
				.old_olddqx1_waddr(old_olddq41_waddr[4:0]), // Templated
				.old_olddqx1_raddr(old_olddq41_raddr[4:0]), // Templated
				.old_olddqx1_din(old_olddq41_din[33:0]), // Templated
				.scan_out(old4_scanout),	 // Templated
				// Inputs
				.l2clk	(l2clk),
				.din	(l2b4_sio_data_r[31:0]), // Templated
				.parity	(l2b4_sio_parity_r[1:0]), // Templated
				.ue	(l2b4_sio_ue_err_r),	 // Templated
				.olc_oldue_check_clrerr(olc_oldue4_check_clrerr), // Templated
				.olc_oldue_check_en(olc_oldue4_check_en), // Templated
				.olc_oldue_wr_en(olc_oldue4_wr_en[3:0]), // Templated
				.olc_oldue_rd_addr(olc_oldue4_rd_addr[1:0]), // Templated
				.olddq0_dout(olddq40_dout[33:0]), // Templated
				.olddq1_dout(olddq41_dout[33:0]), // Templated
				.olc_old_selhdr(olc_old4_selhdr), // Templated
				.olc_oldue_selfwd(olc_oldue4_selfwd), // Templated
				.olc_oldue_pass_late_ue(olc_oldue_pass_late_ue4), // Templated
				.olc_oldhq_wr_en(olc_oldhq4_wr_en[3:0]), // Templated
				.olc_oldhq_rd_addr(olc_oldhq4_rd_addr[1:0]), // Templated
				.oldhq_din({l2b4_sio_data_r[`SIO_L2SIO_CTGECC_MSB_BIT : `SIO_L2SIO_CTGECC_LSB_BIT], l2b4_sio_data_r[`SIO_L2SIO_E_BIT], l2b4_sio_data_r[`SIO_L2SIO_R_BIT], l2b4_sio_data_r[`SIO_L2SIO_S_BIT], l2b4_sio_data_r[15:0]}), // Templated
				.ojc_old_jtagsr_en(ojc_old4_jtagsr_en), // Templated
				.ojc_old_wr_en(ojc_old4_wr_en[1:0]), // Templated
				.sio_mbi_run(sio_mb0_run),	 // Templated
				.sio_mbi_old_addr(sio_mb0_old_addr[4:0]), // Templated
				.sio_mbi_old_wdata(sio_mb0_wdata[7:0]), // Templated
				.sio_mbi_oldx_wr_en(sio_mb0_old4x_wr_en), // Templated
				.sio_mbi_oldx_rd_en(sio_mb0_old4x_rd_en), // Templated
				.olc_old_olddqx0_wr_en(olc_old_olddq40_wr_en), // Templated
				.olc_old_olddqx0_rd_en(olc_old_olddq40_rd_en), // Templated
				.olc_old_olddqx0_waddr(olc_old_olddq40_waddr[4:0]), // Templated
				.olc_old_olddqx0_raddr(olc_old_olddq40_raddr[4:0]), // Templated
				.olc_old_olddqx1_wr_en(olc_old_olddq41_wr_en), // Templated
				.olc_old_olddqx1_rd_en(olc_old_olddq41_rd_en), // Templated
				.olc_old_olddqx1_waddr(olc_old_olddq41_waddr[4:0]), // Templated
				.olc_old_olddqx1_raddr(olc_old_olddq41_raddr[4:0]), // Templated
				.tcu_muxtest(tcu_muxtest),
				.tcu_dectest(tcu_dectest),
				.tcu_scan_en(tcu_scan_en),
				.scan_in(old4_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated
   

   sio_olc_ctl          olc4   (/*AUTOINST*/
				// Outputs
				.olc_oldue_check_clrerr(olc_oldue4_check_clrerr), // Templated
				.olc_oldue_check_en(olc_oldue4_check_en), // Templated
				.olc_oldue_wr_en(olc_oldue4_wr_en[3:0]), // Templated
				.olc_oldue_rd_addr(olc_oldue4_rd_addr[1:0]), // Templated
				.olc_oldue_selfwd(olc_oldue4_selfwd), // Templated
				.olc_oldue_pass_late_ue(olc_oldue_pass_late_ue4), // Templated
				.olc_old_selhdr(olc_old4_selhdr), // Templated
				.olc_oldhq_wr_en(olc_oldhq4_wr_en[3:0]), // Templated
				.olc_oldhq_rd_addr(olc_oldhq4_rd_addr[1:0]), // Templated
				.olc_olddq0_wr_en(olc_old_olddq40_wr_en), // Templated
				.olc_olddq0_wr_addr(olc_old_olddq40_waddr[4:0]), // Templated
				.olc_olddq0_rd_en(olc_old_olddq40_rd_en), // Templated
				.olc_olddq0_rd_addr(olc_old_olddq40_raddr[4:0]), // Templated
				.olc_olddq1_wr_en(olc_old_olddq41_wr_en), // Templated
				.olc_olddq1_wr_addr(olc_old_olddq41_waddr[4:0]), // Templated
				.olc_olddq1_rd_en(olc_old_olddq41_rd_en), // Templated
				.olc_olddq1_rd_addr(olc_old_olddq41_raddr[4:0]), // Templated
				.olc_opcc_req(olc4_opcc_req),	 // Templated
				.sio_sii_olc_ilc_dequeue(sio_sii_olc4_ilc4_dequeue), // Templated
				.ojc_old_wr_en(ojc_old4_wr_en[1:0]), // Templated
				.ojc_old_jtagsr_en(ojc_old4_jtagsr_en), // Templated
				.ojc_opcc_sync(ojc4_opcc_sync),	 // Templated
				.ojc_opcc_ack(ojc4_opcc_ack),	 // Templated
				.scan_out(olc4_scanout),	 // Templated
				// Inputs
				.l2clk	(l2clk),
				.l2sio_v_bit(l2b4_sio_ctag_vld_r), // Templated
				.l2sio_r_bit(l2b4_sio_data_r[`SIO_L2SIO_R_BIT]), // Templated
				.l2sio_p_bit(l2b4_sio_data_r[`SIO_L2SIO_P_BIT]), // Templated
				.l2sio_j_bit(l2b4_sio_data_r[`SIO_L2SIO_J_BIT]), // Templated
				.l2b_sio_ue_err_r(l2b4_sio_ue_err_r), // Templated
				.opcc_olc_gnt(opcc_olc4_gnt),	 // Templated
				.tcu_scan_en(tcu_scan_en),
				.scan_in(olc4_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated

// ========= Outbound L2 bank 4 ========

// ========= Outbound L2 bank 5 ========
   sio_stg2_dp		     stg5   (/*AUTOINST*/
				     // Outputs
				     .l2b_sio_data_r(l2b5_sio_data_r[31:0]), // Templated
				     .l2b_sio_parity_r(l2b5_sio_parity_r[1:0]), // Templated
				     .l2b_sio_ue_err_r(l2b5_sio_ue_err_r), // Templated
				     .l2b_sio_ctag_vld_r(l2b5_sio_ctag_vld_r), // Templated
				     .scan_out(stg5_scanout),	 // Templated
				     // Inputs
				     .l2clk(l2clk),
				     .l2b_sio_data(l2b5_sio_data[31:0]), // Templated
				     .l2b_sio_parity(l2b5_sio_parity[1:0]), // Templated
				     .l2b_sio_ue_err(l2b5_sio_ue_err), // Templated
				     .l2b_sio_ctag_vld(l2b5_sio_ctag_vld), // Templated
				     .tcu_muxtest(tcu_muxtest),
				     .tcu_dectest(tcu_dectest),
				     .tcu_scan_en(tcu_scan_en),
				     .scan_in(stg5_scanin),	 // Templated
				     .tcu_aclk(aclk),		 // Templated
				     .tcu_bclk(bclk),		 // Templated
				     .tcu_pce_ov(tcu_pce_ov),
				     .tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated

   n2_com_dp_32x34_cust      olddq50 (/*AUTOINST*/
				      // Outputs
				      .dout(olddq50_dout[33:0]), // Templated
				      .scan_out(olddq50_scanout), // Templated
				      // Inputs
				      .wr_adr(old_olddq50_waddr[4:0]), // Templated
				      .wr_en(old_olddq50_wr_en), // Templated
				      .rd_adr(old_olddq50_raddr[4:0]), // Templated
				      .rd_en(old_olddq50_rd_en), // Templated
				      .din(old_olddq50_din[33:0]), // Templated
				      .rdclk(l2clk),		 // Templated
				      .wrclk(l2clk),		 // Templated
				      .scan_in(olddq50_scanin),	 // Templated
				      .tcu_pce_ov(tcu_pce_ov),
				      .tcu_aclk(aclk),		 // Templated
				      .tcu_bclk(bclk),		 // Templated
				      .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				      .tcu_se_scancollar_in(tcu_se_scancollar_in),
				      .tcu_se_scancollar_out(tcu_se_scancollar_out),
				      .bist_clk_mux_sel(tie_low), // Templated
				      .rd_pce(rd_pce),		 // Templated
				      .wr_pce(wr_pce));		 // Templated


   n2_com_dp_32x34_cust      olddq51 (/*AUTOINST*/
				      // Outputs
				      .dout(olddq51_dout[33:0]), // Templated
				      .scan_out(olddq51_scanout), // Templated
				      // Inputs
				      .wr_adr(old_olddq51_waddr[4:0]), // Templated
				      .wr_en(old_olddq51_wr_en), // Templated
				      .rd_adr(old_olddq51_raddr[4:0]), // Templated
				      .rd_en(old_olddq51_rd_en), // Templated
				      .din(old_olddq51_din[33:0]), // Templated
				      .rdclk(l2clk),		 // Templated
				      .wrclk(l2clk),		 // Templated
				      .scan_in(olddq51_scanin),	 // Templated
				      .tcu_pce_ov(tcu_pce_ov),
				      .tcu_aclk(aclk),		 // Templated
				      .tcu_bclk(bclk),		 // Templated
				      .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				      .tcu_se_scancollar_in(tcu_se_scancollar_in),
				      .tcu_se_scancollar_out(tcu_se_scancollar_out),
				      .bist_clk_mux_sel(tie_low), // Templated
				      .rd_pce(rd_pce),		 // Templated
				      .wr_pce(wr_pce));		 // Templated


   sio_old_dp           old5   (/*AUTOINST*/
				// Outputs
				.oldhq_dout_r_bit(oldhq5_dout_r_bit), // Templated
				.oldhq_dout_s_bit(oldhq5_dout_s_bit), // Templated
				.old_opd_data(old5_opd_data[64:0]), // Templated
				.old_opcc_jtag(old5_opcc_jtag),	 // Templated
				.old_olddqx0_wr_en(old_olddq50_wr_en), // Templated
				.old_olddqx0_rd_en(old_olddq50_rd_en), // Templated
				.old_olddqx0_waddr(old_olddq50_waddr[4:0]), // Templated
				.old_olddqx0_raddr(old_olddq50_raddr[4:0]), // Templated
				.old_olddqx0_din(old_olddq50_din[33:0]), // Templated
				.old_olddqx1_wr_en(old_olddq51_wr_en), // Templated
				.old_olddqx1_rd_en(old_olddq51_rd_en), // Templated
				.old_olddqx1_waddr(old_olddq51_waddr[4:0]), // Templated
				.old_olddqx1_raddr(old_olddq51_raddr[4:0]), // Templated
				.old_olddqx1_din(old_olddq51_din[33:0]), // Templated
				.scan_out(old5_scanout),	 // Templated
				// Inputs
				.l2clk	(l2clk),
				.din	(l2b5_sio_data_r[31:0]), // Templated
				.parity	(l2b5_sio_parity_r[1:0]), // Templated
				.ue	(l2b5_sio_ue_err_r),	 // Templated
				.olc_oldue_check_clrerr(olc_oldue5_check_clrerr), // Templated
				.olc_oldue_check_en(olc_oldue5_check_en), // Templated
				.olc_oldue_wr_en(olc_oldue5_wr_en[3:0]), // Templated
				.olc_oldue_rd_addr(olc_oldue5_rd_addr[1:0]), // Templated
				.olddq0_dout(olddq50_dout[33:0]), // Templated
				.olddq1_dout(olddq51_dout[33:0]), // Templated
				.olc_old_selhdr(olc_old5_selhdr), // Templated
				.olc_oldue_selfwd(olc_oldue5_selfwd), // Templated
				.olc_oldue_pass_late_ue(olc_oldue_pass_late_ue5), // Templated
				.olc_oldhq_wr_en(olc_oldhq5_wr_en[3:0]), // Templated
				.olc_oldhq_rd_addr(olc_oldhq5_rd_addr[1:0]), // Templated
				.oldhq_din({l2b5_sio_data_r[`SIO_L2SIO_CTGECC_MSB_BIT : `SIO_L2SIO_CTGECC_LSB_BIT], l2b5_sio_data_r[`SIO_L2SIO_E_BIT], l2b5_sio_data_r[`SIO_L2SIO_R_BIT], l2b5_sio_data_r[`SIO_L2SIO_S_BIT], l2b5_sio_data_r[15:0]}), // Templated
				.ojc_old_jtagsr_en(ojc_old5_jtagsr_en), // Templated
				.ojc_old_wr_en(ojc_old5_wr_en[1:0]), // Templated
				.sio_mbi_run(sio_mb0_run),	 // Templated
				.sio_mbi_old_addr(sio_mb0_old_addr[4:0]), // Templated
				.sio_mbi_old_wdata(sio_mb0_wdata[7:0]), // Templated
				.sio_mbi_oldx_wr_en(sio_mb0_old5x_wr_en), // Templated
				.sio_mbi_oldx_rd_en(sio_mb0_old5x_rd_en), // Templated
				.olc_old_olddqx0_wr_en(olc_old_olddq50_wr_en), // Templated
				.olc_old_olddqx0_rd_en(olc_old_olddq50_rd_en), // Templated
				.olc_old_olddqx0_waddr(olc_old_olddq50_waddr[4:0]), // Templated
				.olc_old_olddqx0_raddr(olc_old_olddq50_raddr[4:0]), // Templated
				.olc_old_olddqx1_wr_en(olc_old_olddq51_wr_en), // Templated
				.olc_old_olddqx1_rd_en(olc_old_olddq51_rd_en), // Templated
				.olc_old_olddqx1_waddr(olc_old_olddq51_waddr[4:0]), // Templated
				.olc_old_olddqx1_raddr(olc_old_olddq51_raddr[4:0]), // Templated
				.tcu_muxtest(tcu_muxtest),
				.tcu_dectest(tcu_dectest),
				.tcu_scan_en(tcu_scan_en),
				.scan_in(old5_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated
   

   sio_olc_ctl          olc5   (/*AUTOINST*/
				// Outputs
				.olc_oldue_check_clrerr(olc_oldue5_check_clrerr), // Templated
				.olc_oldue_check_en(olc_oldue5_check_en), // Templated
				.olc_oldue_wr_en(olc_oldue5_wr_en[3:0]), // Templated
				.olc_oldue_rd_addr(olc_oldue5_rd_addr[1:0]), // Templated
				.olc_oldue_selfwd(olc_oldue5_selfwd), // Templated
				.olc_oldue_pass_late_ue(olc_oldue_pass_late_ue5), // Templated
				.olc_old_selhdr(olc_old5_selhdr), // Templated
				.olc_oldhq_wr_en(olc_oldhq5_wr_en[3:0]), // Templated
				.olc_oldhq_rd_addr(olc_oldhq5_rd_addr[1:0]), // Templated
				.olc_olddq0_wr_en(olc_old_olddq50_wr_en), // Templated
				.olc_olddq0_wr_addr(olc_old_olddq50_waddr[4:0]), // Templated
				.olc_olddq0_rd_en(olc_old_olddq50_rd_en), // Templated
				.olc_olddq0_rd_addr(olc_old_olddq50_raddr[4:0]), // Templated
				.olc_olddq1_wr_en(olc_old_olddq51_wr_en), // Templated
				.olc_olddq1_wr_addr(olc_old_olddq51_waddr[4:0]), // Templated
				.olc_olddq1_rd_en(olc_old_olddq51_rd_en), // Templated
				.olc_olddq1_rd_addr(olc_old_olddq51_raddr[4:0]), // Templated
				.olc_opcc_req(olc5_opcc_req),	 // Templated
				.sio_sii_olc_ilc_dequeue(sio_sii_olc5_ilc5_dequeue), // Templated
				.ojc_old_wr_en(ojc_old5_wr_en[1:0]), // Templated
				.ojc_old_jtagsr_en(ojc_old5_jtagsr_en), // Templated
				.ojc_opcc_sync(ojc5_opcc_sync),	 // Templated
				.ojc_opcc_ack(ojc5_opcc_ack),	 // Templated
				.scan_out(olc5_scanout),	 // Templated
				// Inputs
				.l2clk	(l2clk),
				.l2sio_v_bit(l2b5_sio_ctag_vld_r), // Templated
				.l2sio_r_bit(l2b5_sio_data_r[`SIO_L2SIO_R_BIT]), // Templated
				.l2sio_p_bit(l2b5_sio_data_r[`SIO_L2SIO_P_BIT]), // Templated
				.l2sio_j_bit(l2b5_sio_data_r[`SIO_L2SIO_J_BIT]), // Templated
				.l2b_sio_ue_err_r(l2b5_sio_ue_err_r), // Templated
				.opcc_olc_gnt(opcc_olc5_gnt),	 // Templated
				.tcu_scan_en(tcu_scan_en),
				.scan_in(olc5_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated

// ========= Outbound L2 bank 5 ========

// ========= Outbound L2 bank 6 ========
   sio_stg2_dp		     stg6   (/*AUTOINST*/
				     // Outputs
				     .l2b_sio_data_r(l2b6_sio_data_r[31:0]), // Templated
				     .l2b_sio_parity_r(l2b6_sio_parity_r[1:0]), // Templated
				     .l2b_sio_ue_err_r(l2b6_sio_ue_err_r), // Templated
				     .l2b_sio_ctag_vld_r(l2b6_sio_ctag_vld_r), // Templated
				     .scan_out(stg6_scanout),	 // Templated
				     // Inputs
				     .l2clk(l2clk),
				     .l2b_sio_data(l2b6_sio_data[31:0]), // Templated
				     .l2b_sio_parity(l2b6_sio_parity[1:0]), // Templated
				     .l2b_sio_ue_err(l2b6_sio_ue_err), // Templated
				     .l2b_sio_ctag_vld(l2b6_sio_ctag_vld), // Templated
				     .tcu_muxtest(tcu_muxtest),
				     .tcu_dectest(tcu_dectest),
				     .tcu_scan_en(tcu_scan_en),
				     .scan_in(stg6_scanin),	 // Templated
				     .tcu_aclk(aclk),		 // Templated
				     .tcu_bclk(bclk),		 // Templated
				     .tcu_pce_ov(tcu_pce_ov),
				     .tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated

   n2_com_dp_32x34_cust      olddq60 (/*AUTOINST*/
				      // Outputs
				      .dout(olddq60_dout[33:0]), // Templated
				      .scan_out(olddq60_scanout), // Templated
				      // Inputs
				      .wr_adr(old_olddq60_waddr[4:0]), // Templated
				      .wr_en(old_olddq60_wr_en), // Templated
				      .rd_adr(old_olddq60_raddr[4:0]), // Templated
				      .rd_en(old_olddq60_rd_en), // Templated
				      .din(old_olddq60_din[33:0]), // Templated
				      .rdclk(l2clk),		 // Templated
				      .wrclk(l2clk),		 // Templated
				      .scan_in(olddq60_scanin),	 // Templated
				      .tcu_pce_ov(tcu_pce_ov),
				      .tcu_aclk(aclk),		 // Templated
				      .tcu_bclk(bclk),		 // Templated
				      .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				      .tcu_se_scancollar_in(tcu_se_scancollar_in),
				      .tcu_se_scancollar_out(tcu_se_scancollar_out),
				      .bist_clk_mux_sel(tie_low), // Templated
				      .rd_pce(rd_pce),		 // Templated
				      .wr_pce(wr_pce));		 // Templated


   n2_com_dp_32x34_cust      olddq61 (/*AUTOINST*/
				      // Outputs
				      .dout(olddq61_dout[33:0]), // Templated
				      .scan_out(olddq61_scanout), // Templated
				      // Inputs
				      .wr_adr(old_olddq61_waddr[4:0]), // Templated
				      .wr_en(old_olddq61_wr_en), // Templated
				      .rd_adr(old_olddq61_raddr[4:0]), // Templated
				      .rd_en(old_olddq61_rd_en), // Templated
				      .din(old_olddq61_din[33:0]), // Templated
				      .rdclk(l2clk),		 // Templated
				      .wrclk(l2clk),		 // Templated
				      .scan_in(olddq61_scanin),	 // Templated
				      .tcu_pce_ov(tcu_pce_ov),
				      .tcu_aclk(aclk),		 // Templated
				      .tcu_bclk(bclk),		 // Templated
				      .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				      .tcu_se_scancollar_in(tcu_se_scancollar_in),
				      .tcu_se_scancollar_out(tcu_se_scancollar_out),
				      .bist_clk_mux_sel(tie_low), // Templated
				      .rd_pce(rd_pce),		 // Templated
				      .wr_pce(wr_pce));		 // Templated


   sio_old_dp           old6   (/*AUTOINST*/
				// Outputs
				.oldhq_dout_r_bit(oldhq6_dout_r_bit), // Templated
				.oldhq_dout_s_bit(oldhq6_dout_s_bit), // Templated
				.old_opd_data(old6_opd_data[64:0]), // Templated
				.old_opcc_jtag(old6_opcc_jtag),	 // Templated
				.old_olddqx0_wr_en(old_olddq60_wr_en), // Templated
				.old_olddqx0_rd_en(old_olddq60_rd_en), // Templated
				.old_olddqx0_waddr(old_olddq60_waddr[4:0]), // Templated
				.old_olddqx0_raddr(old_olddq60_raddr[4:0]), // Templated
				.old_olddqx0_din(old_olddq60_din[33:0]), // Templated
				.old_olddqx1_wr_en(old_olddq61_wr_en), // Templated
				.old_olddqx1_rd_en(old_olddq61_rd_en), // Templated
				.old_olddqx1_waddr(old_olddq61_waddr[4:0]), // Templated
				.old_olddqx1_raddr(old_olddq61_raddr[4:0]), // Templated
				.old_olddqx1_din(old_olddq61_din[33:0]), // Templated
				.scan_out(old6_scanout),	 // Templated
				// Inputs
				.l2clk	(l2clk),
				.din	(l2b6_sio_data_r[31:0]), // Templated
				.parity	(l2b6_sio_parity_r[1:0]), // Templated
				.ue	(l2b6_sio_ue_err_r),	 // Templated
				.olc_oldue_check_clrerr(olc_oldue6_check_clrerr), // Templated
				.olc_oldue_check_en(olc_oldue6_check_en), // Templated
				.olc_oldue_wr_en(olc_oldue6_wr_en[3:0]), // Templated
				.olc_oldue_rd_addr(olc_oldue6_rd_addr[1:0]), // Templated
				.olddq0_dout(olddq60_dout[33:0]), // Templated
				.olddq1_dout(olddq61_dout[33:0]), // Templated
				.olc_old_selhdr(olc_old6_selhdr), // Templated
				.olc_oldue_selfwd(olc_oldue6_selfwd), // Templated
				.olc_oldue_pass_late_ue(olc_oldue_pass_late_ue6), // Templated
				.olc_oldhq_wr_en(olc_oldhq6_wr_en[3:0]), // Templated
				.olc_oldhq_rd_addr(olc_oldhq6_rd_addr[1:0]), // Templated
				.oldhq_din({l2b6_sio_data_r[`SIO_L2SIO_CTGECC_MSB_BIT : `SIO_L2SIO_CTGECC_LSB_BIT], l2b6_sio_data_r[`SIO_L2SIO_E_BIT], l2b6_sio_data_r[`SIO_L2SIO_R_BIT], l2b6_sio_data_r[`SIO_L2SIO_S_BIT], l2b6_sio_data_r[15:0]}), // Templated
				.ojc_old_jtagsr_en(ojc_old6_jtagsr_en), // Templated
				.ojc_old_wr_en(ojc_old6_wr_en[1:0]), // Templated
				.sio_mbi_run(sio_mb0_run),	 // Templated
				.sio_mbi_old_addr(sio_mb0_old_addr[4:0]), // Templated
				.sio_mbi_old_wdata(sio_mb0_wdata[7:0]), // Templated
				.sio_mbi_oldx_wr_en(sio_mb0_old6x_wr_en), // Templated
				.sio_mbi_oldx_rd_en(sio_mb0_old6x_rd_en), // Templated
				.olc_old_olddqx0_wr_en(olc_old_olddq60_wr_en), // Templated
				.olc_old_olddqx0_rd_en(olc_old_olddq60_rd_en), // Templated
				.olc_old_olddqx0_waddr(olc_old_olddq60_waddr[4:0]), // Templated
				.olc_old_olddqx0_raddr(olc_old_olddq60_raddr[4:0]), // Templated
				.olc_old_olddqx1_wr_en(olc_old_olddq61_wr_en), // Templated
				.olc_old_olddqx1_rd_en(olc_old_olddq61_rd_en), // Templated
				.olc_old_olddqx1_waddr(olc_old_olddq61_waddr[4:0]), // Templated
				.olc_old_olddqx1_raddr(olc_old_olddq61_raddr[4:0]), // Templated
				.tcu_muxtest(tcu_muxtest),
				.tcu_dectest(tcu_dectest),
				.tcu_scan_en(tcu_scan_en),
				.scan_in(old6_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated
   

   sio_olc_ctl          olc6   (/*AUTOINST*/
				// Outputs
				.olc_oldue_check_clrerr(olc_oldue6_check_clrerr), // Templated
				.olc_oldue_check_en(olc_oldue6_check_en), // Templated
				.olc_oldue_wr_en(olc_oldue6_wr_en[3:0]), // Templated
				.olc_oldue_rd_addr(olc_oldue6_rd_addr[1:0]), // Templated
				.olc_oldue_selfwd(olc_oldue6_selfwd), // Templated
				.olc_oldue_pass_late_ue(olc_oldue_pass_late_ue6), // Templated
				.olc_old_selhdr(olc_old6_selhdr), // Templated
				.olc_oldhq_wr_en(olc_oldhq6_wr_en[3:0]), // Templated
				.olc_oldhq_rd_addr(olc_oldhq6_rd_addr[1:0]), // Templated
				.olc_olddq0_wr_en(olc_old_olddq60_wr_en), // Templated
				.olc_olddq0_wr_addr(olc_old_olddq60_waddr[4:0]), // Templated
				.olc_olddq0_rd_en(olc_old_olddq60_rd_en), // Templated
				.olc_olddq0_rd_addr(olc_old_olddq60_raddr[4:0]), // Templated
				.olc_olddq1_wr_en(olc_old_olddq61_wr_en), // Templated
				.olc_olddq1_wr_addr(olc_old_olddq61_waddr[4:0]), // Templated
				.olc_olddq1_rd_en(olc_old_olddq61_rd_en), // Templated
				.olc_olddq1_rd_addr(olc_old_olddq61_raddr[4:0]), // Templated
				.olc_opcc_req(olc6_opcc_req),	 // Templated
				.sio_sii_olc_ilc_dequeue(sio_sii_olc6_ilc6_dequeue), // Templated
				.ojc_old_wr_en(ojc_old6_wr_en[1:0]), // Templated
				.ojc_old_jtagsr_en(ojc_old6_jtagsr_en), // Templated
				.ojc_opcc_sync(ojc6_opcc_sync),	 // Templated
				.ojc_opcc_ack(ojc6_opcc_ack),	 // Templated
				.scan_out(olc6_scanout),	 // Templated
				// Inputs
				.l2clk	(l2clk),
				.l2sio_v_bit(l2b6_sio_ctag_vld_r), // Templated
				.l2sio_r_bit(l2b6_sio_data_r[`SIO_L2SIO_R_BIT]), // Templated
				.l2sio_p_bit(l2b6_sio_data_r[`SIO_L2SIO_P_BIT]), // Templated
				.l2sio_j_bit(l2b6_sio_data_r[`SIO_L2SIO_J_BIT]), // Templated
				.l2b_sio_ue_err_r(l2b6_sio_ue_err_r), // Templated
				.opcc_olc_gnt(opcc_olc6_gnt),	 // Templated
				.tcu_scan_en(tcu_scan_en),
				.scan_in(olc6_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated

// ========= Outbound L2 bank 6 ========

// ========= Outbound L2 bank 7 ========
   sio_stg2_dp		     stg7   (/*AUTOINST*/
				     // Outputs
				     .l2b_sio_data_r(l2b7_sio_data_r[31:0]), // Templated
				     .l2b_sio_parity_r(l2b7_sio_parity_r[1:0]), // Templated
				     .l2b_sio_ue_err_r(l2b7_sio_ue_err_r), // Templated
				     .l2b_sio_ctag_vld_r(l2b7_sio_ctag_vld_r), // Templated
				     .scan_out(stg7_scanout),	 // Templated
				     // Inputs
				     .l2clk(l2clk),
				     .l2b_sio_data(l2b7_sio_data[31:0]), // Templated
				     .l2b_sio_parity(l2b7_sio_parity[1:0]), // Templated
				     .l2b_sio_ue_err(l2b7_sio_ue_err), // Templated
				     .l2b_sio_ctag_vld(l2b7_sio_ctag_vld), // Templated
				     .tcu_muxtest(tcu_muxtest),
				     .tcu_dectest(tcu_dectest),
				     .tcu_scan_en(tcu_scan_en),
				     .scan_in(stg7_scanin),	 // Templated
				     .tcu_aclk(aclk),		 // Templated
				     .tcu_bclk(bclk),		 // Templated
				     .tcu_pce_ov(tcu_pce_ov),
				     .tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated

   n2_com_dp_32x34_cust      olddq70 (/*AUTOINST*/
				      // Outputs
				      .dout(olddq70_dout[33:0]), // Templated
				      .scan_out(olddq70_scanout), // Templated
				      // Inputs
				      .wr_adr(old_olddq70_waddr[4:0]), // Templated
				      .wr_en(old_olddq70_wr_en), // Templated
				      .rd_adr(old_olddq70_raddr[4:0]), // Templated
				      .rd_en(old_olddq70_rd_en), // Templated
				      .din(old_olddq70_din[33:0]), // Templated
				      .rdclk(l2clk),		 // Templated
				      .wrclk(l2clk),		 // Templated
				      .scan_in(olddq70_scanin),	 // Templated
				      .tcu_pce_ov(tcu_pce_ov),
				      .tcu_aclk(aclk),		 // Templated
				      .tcu_bclk(bclk),		 // Templated
				      .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				      .tcu_se_scancollar_in(tcu_se_scancollar_in),
				      .tcu_se_scancollar_out(tcu_se_scancollar_out),
				      .bist_clk_mux_sel(tie_low), // Templated
				      .rd_pce(rd_pce),		 // Templated
				      .wr_pce(wr_pce));		 // Templated


   n2_com_dp_32x34_cust      olddq71 (/*AUTOINST*/
				      // Outputs
				      .dout(olddq71_dout[33:0]), // Templated
				      .scan_out(olddq71_scanout), // Templated
				      // Inputs
				      .wr_adr(old_olddq71_waddr[4:0]), // Templated
				      .wr_en(old_olddq71_wr_en), // Templated
				      .rd_adr(old_olddq71_raddr[4:0]), // Templated
				      .rd_en(old_olddq71_rd_en), // Templated
				      .din(old_olddq71_din[33:0]), // Templated
				      .rdclk(l2clk),		 // Templated
				      .wrclk(l2clk),		 // Templated
				      .scan_in(olddq71_scanin),	 // Templated
				      .tcu_pce_ov(tcu_pce_ov),
				      .tcu_aclk(aclk),		 // Templated
				      .tcu_bclk(bclk),		 // Templated
				      .tcu_array_wr_inhibit(array_wr_inhibit_cmp), // Templated
				      .tcu_se_scancollar_in(tcu_se_scancollar_in),
				      .tcu_se_scancollar_out(tcu_se_scancollar_out),
				      .bist_clk_mux_sel(tie_low), // Templated
				      .rd_pce(rd_pce),		 // Templated
				      .wr_pce(wr_pce));		 // Templated


   sio_old_dp           old7   (/*AUTOINST*/
				// Outputs
				.oldhq_dout_r_bit(oldhq7_dout_r_bit), // Templated
				.oldhq_dout_s_bit(oldhq7_dout_s_bit), // Templated
				.old_opd_data(old7_opd_data[64:0]), // Templated
				.old_opcc_jtag(old7_opcc_jtag),	 // Templated
				.old_olddqx0_wr_en(old_olddq70_wr_en), // Templated
				.old_olddqx0_rd_en(old_olddq70_rd_en), // Templated
				.old_olddqx0_waddr(old_olddq70_waddr[4:0]), // Templated
				.old_olddqx0_raddr(old_olddq70_raddr[4:0]), // Templated
				.old_olddqx0_din(old_olddq70_din[33:0]), // Templated
				.old_olddqx1_wr_en(old_olddq71_wr_en), // Templated
				.old_olddqx1_rd_en(old_olddq71_rd_en), // Templated
				.old_olddqx1_waddr(old_olddq71_waddr[4:0]), // Templated
				.old_olddqx1_raddr(old_olddq71_raddr[4:0]), // Templated
				.old_olddqx1_din(old_olddq71_din[33:0]), // Templated
				.scan_out(old7_scanout),	 // Templated
				// Inputs
				.l2clk	(l2clk),
				.din	(l2b7_sio_data_r[31:0]), // Templated
				.parity	(l2b7_sio_parity_r[1:0]), // Templated
				.ue	(l2b7_sio_ue_err_r),	 // Templated
				.olc_oldue_check_clrerr(olc_oldue7_check_clrerr), // Templated
				.olc_oldue_check_en(olc_oldue7_check_en), // Templated
				.olc_oldue_wr_en(olc_oldue7_wr_en[3:0]), // Templated
				.olc_oldue_rd_addr(olc_oldue7_rd_addr[1:0]), // Templated
				.olddq0_dout(olddq70_dout[33:0]), // Templated
				.olddq1_dout(olddq71_dout[33:0]), // Templated
				.olc_old_selhdr(olc_old7_selhdr), // Templated
				.olc_oldue_selfwd(olc_oldue7_selfwd), // Templated
				.olc_oldue_pass_late_ue(olc_oldue_pass_late_ue7), // Templated
				.olc_oldhq_wr_en(olc_oldhq7_wr_en[3:0]), // Templated
				.olc_oldhq_rd_addr(olc_oldhq7_rd_addr[1:0]), // Templated
				.oldhq_din({l2b7_sio_data_r[`SIO_L2SIO_CTGECC_MSB_BIT : `SIO_L2SIO_CTGECC_LSB_BIT], l2b7_sio_data_r[`SIO_L2SIO_E_BIT], l2b7_sio_data_r[`SIO_L2SIO_R_BIT], l2b7_sio_data_r[`SIO_L2SIO_S_BIT], l2b7_sio_data_r[15:0]}), // Templated
				.ojc_old_jtagsr_en(ojc_old7_jtagsr_en), // Templated
				.ojc_old_wr_en(ojc_old7_wr_en[1:0]), // Templated
				.sio_mbi_run(sio_mb0_run),	 // Templated
				.sio_mbi_old_addr(sio_mb0_old_addr[4:0]), // Templated
				.sio_mbi_old_wdata(sio_mb0_wdata[7:0]), // Templated
				.sio_mbi_oldx_wr_en(sio_mb0_old7x_wr_en), // Templated
				.sio_mbi_oldx_rd_en(sio_mb0_old7x_rd_en), // Templated
				.olc_old_olddqx0_wr_en(olc_old_olddq70_wr_en), // Templated
				.olc_old_olddqx0_rd_en(olc_old_olddq70_rd_en), // Templated
				.olc_old_olddqx0_waddr(olc_old_olddq70_waddr[4:0]), // Templated
				.olc_old_olddqx0_raddr(olc_old_olddq70_raddr[4:0]), // Templated
				.olc_old_olddqx1_wr_en(olc_old_olddq71_wr_en), // Templated
				.olc_old_olddqx1_rd_en(olc_old_olddq71_rd_en), // Templated
				.olc_old_olddqx1_waddr(olc_old_olddq71_waddr[4:0]), // Templated
				.olc_old_olddqx1_raddr(olc_old_olddq71_raddr[4:0]), // Templated
				.tcu_muxtest(tcu_muxtest),
				.tcu_dectest(tcu_dectest),
				.tcu_scan_en(tcu_scan_en),
				.scan_in(old7_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated
   

   sio_olc_ctl          olc7   (/*AUTOINST*/
				// Outputs
				.olc_oldue_check_clrerr(olc_oldue7_check_clrerr), // Templated
				.olc_oldue_check_en(olc_oldue7_check_en), // Templated
				.olc_oldue_wr_en(olc_oldue7_wr_en[3:0]), // Templated
				.olc_oldue_rd_addr(olc_oldue7_rd_addr[1:0]), // Templated
				.olc_oldue_selfwd(olc_oldue7_selfwd), // Templated
				.olc_oldue_pass_late_ue(olc_oldue_pass_late_ue7), // Templated
				.olc_old_selhdr(olc_old7_selhdr), // Templated
				.olc_oldhq_wr_en(olc_oldhq7_wr_en[3:0]), // Templated
				.olc_oldhq_rd_addr(olc_oldhq7_rd_addr[1:0]), // Templated
				.olc_olddq0_wr_en(olc_old_olddq70_wr_en), // Templated
				.olc_olddq0_wr_addr(olc_old_olddq70_waddr[4:0]), // Templated
				.olc_olddq0_rd_en(olc_old_olddq70_rd_en), // Templated
				.olc_olddq0_rd_addr(olc_old_olddq70_raddr[4:0]), // Templated
				.olc_olddq1_wr_en(olc_old_olddq71_wr_en), // Templated
				.olc_olddq1_wr_addr(olc_old_olddq71_waddr[4:0]), // Templated
				.olc_olddq1_rd_en(olc_old_olddq71_rd_en), // Templated
				.olc_olddq1_rd_addr(olc_old_olddq71_raddr[4:0]), // Templated
				.olc_opcc_req(olc7_opcc_req),	 // Templated
				.sio_sii_olc_ilc_dequeue(sio_sii_olc7_ilc7_dequeue), // Templated
				.ojc_old_wr_en(ojc_old7_wr_en[1:0]), // Templated
				.ojc_old_jtagsr_en(ojc_old7_jtagsr_en), // Templated
				.ojc_opcc_sync(ojc7_opcc_sync),	 // Templated
				.ojc_opcc_ack(ojc7_opcc_ack),	 // Templated
				.scan_out(olc7_scanout),	 // Templated
				// Inputs
				.l2clk	(l2clk),
				.l2sio_v_bit(l2b7_sio_ctag_vld_r), // Templated
				.l2sio_r_bit(l2b7_sio_data_r[`SIO_L2SIO_R_BIT]), // Templated
				.l2sio_p_bit(l2b7_sio_data_r[`SIO_L2SIO_P_BIT]), // Templated
				.l2sio_j_bit(l2b7_sio_data_r[`SIO_L2SIO_J_BIT]), // Templated
				.l2b_sio_ue_err_r(l2b7_sio_ue_err_r), // Templated
				.opcc_olc_gnt(opcc_olc7_gnt),	 // Templated
				.tcu_scan_en(tcu_scan_en),
				.scan_in(olc7_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated

// ========= Outbound L2 bank 7 ========



   // Controller In IO Domain
// ========= Outbound Packet to DMU/NIU ========
   // Miscellaneous muxes and datapath elements BEFORE REGISTER FILE
   sio_opdc_dp          opdc   (/*AUTOINST*/
				// Outputs
				.opdc_bank_data_opc1(opdc_bank_data_opc1[63:0]),
				.read_data_top(read_data_top[67:0]),
				.read_data_bot(read_data_bot[67:0]),
				.opdc_mb1bank_data_opc1(opdc_mb1bank_data_opc1[63:0]),
				.opdc_mb1bank_parity_opc1(opdc_mb1bank_parity_opc1[7:0]),
				.opdc_opddq00_wr_en(opdc_opddq00_wr_en),
				.opdc_opddq01_wr_en(opdc_opddq01_wr_en),
				.opdc_opdhq0_wr_en(opdc_opdhq0_wr_en),
				.opdc_opddq10_wr_en(opdc_opddq10_wr_en),
				.opdc_opddq11_wr_en(opdc_opddq11_wr_en),
				.opdc_opdhq1_wr_en(opdc_opdhq1_wr_en),
				.opdc_opddq00_wr_addr(opdc_opddq00_wr_addr[5:0]),
				.opdc_opddq01_wr_addr(opdc_opddq01_wr_addr[5:0]),
				.opdc_opdhq0_wr_addr(opdc_opdhq0_wr_addr[3:0]),
				.opdc_opddq10_wr_addr(opdc_opddq10_wr_addr[5:0]),
				.opdc_opddq11_wr_addr(opdc_opddq11_wr_addr[5:0]),
				.opdc_opdhq1_wr_addr(opdc_opdhq1_wr_addr[3:0]),
				.scan_out(opdc_scanout),	 // Templated
				// Inputs
				.l2clk	(l2clk),
				.old0_opd_data(old0_opd_data[64:0]),
				.old1_opd_data(old1_opd_data[64:0]),
				.old2_opd_data(old2_opd_data[64:0]),
				.old3_opd_data(old3_opd_data[64:0]),
				.old4_opd_data(old4_opd_data[64:0]),
				.old5_opd_data(old5_opd_data[64:0]),
				.old6_opd_data(old6_opd_data[64:0]),
				.old7_opd_data(old7_opd_data[64:0]),
				.opcc_opdc_gnt0_opc0(opcc_opdc_gnt0_opc0),
				.opcc_opdc_gnt2_opc0(opcc_opdc_gnt2_opc0),
				.opcc_opdc_gnt4_opc0(opcc_opdc_gnt4_opc0),
				.opcc_opdc_gnt6_opc0(opcc_opdc_gnt6_opc0),
				.opcc_opdc_gnt01_opc1(opcc_opdc_gnt01_opc1),
				.opcc_opdc_gnt45_opc1(opcc_opdc_gnt45_opc1),
				.opcc_opdc_gnt0123_opc1(opcc_opdc_gnt0123_opc1),
				.olddq0_dout({olddq00_dout[33:0],olddq01_dout[33:0]}), // Templated
				.olddq1_dout({olddq10_dout[33:0],olddq11_dout[33:0]}), // Templated
				.olddq2_dout({olddq20_dout[33:0],olddq21_dout[33:0]}), // Templated
				.olddq3_dout({olddq30_dout[33:0],olddq31_dout[33:0]}), // Templated
				.olddq4_dout({olddq40_dout[33:0],olddq41_dout[33:0]}), // Templated
				.olddq5_dout({olddq50_dout[33:0],olddq51_dout[33:0]}), // Templated
				.olddq6_dout({olddq60_dout[33:0],olddq61_dout[33:0]}), // Templated
				.olddq7_dout({olddq70_dout[33:0],olddq71_dout[33:0]}), // Templated
				.sio_mb0_sel_l1(sio_mb0_sel_l1),
				.sio_mb0_sel_l2(sio_mb0_sel_l2),
				.sio_mb1_run(sio_mb1_run),
				.sio_mb1_wdata(sio_mb1_wdata[7:0]),
				.sio_mb1_addr(sio_mb1_addr[5:0]),
				.opcc_opddq00_wr_en(opcc_opddq00_wr_en),
				.opcc_opddq01_wr_en(opcc_opddq01_wr_en),
				.opcc_opddq10_wr_en(opcc_opddq10_wr_en),
				.opcc_opddq11_wr_en(opcc_opddq11_wr_en),
				.opcc_opdhq0_wr_en(opcc_opdhq0_wr_en),
				.opcc_opdhq1_wr_en(opcc_opdhq1_wr_en),
				.sio_mb1_opddq00_wr_en(sio_mb1_opddq00_wr_en),
				.sio_mb1_opddq01_wr_en(sio_mb1_opddq01_wr_en),
				.sio_mb1_opdhq0_wr_en(sio_mb1_opdhq0_wr_en),
				.sio_mb1_opddq10_wr_en(sio_mb1_opddq10_wr_en),
				.sio_mb1_opddq11_wr_en(sio_mb1_opddq11_wr_en),
				.sio_mb1_opdhq1_wr_en(sio_mb1_opdhq1_wr_en),
				.opcc_opddq00_wr_addr(opcc_opddq00_wr_addr[5:0]),
				.opcc_opddq01_wr_addr(opcc_opddq01_wr_addr[5:0]),
				.opcc_opdhq0_wr_addr(opcc_opdhq0_wr_addr[3:0]),
				.opcc_opddq10_wr_addr(opcc_opddq10_wr_addr[5:0]),
				.opcc_opddq11_wr_addr(opcc_opddq11_wr_addr[5:0]),
				.opcc_opdhq1_wr_addr(opcc_opdhq1_wr_addr[3:0]),
				.tcu_muxtest(tcu_muxtest),
				.tcu_dectest(tcu_dectest),
				.tcu_scan_en(tcu_scan_en),
				.scan_in(opdc_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated

   // DMU : L2 Parity[7:0], DataPayload[127:64] wCrS1r1d64w72 - 16 cacheline entries 
   n2_com_dp_64x72s_cust opddq00 (/*AUTOINST*/
				  // Outputs
				  .dout	({opddq00_pout[7:0], opddq00_dout[63:0]}), // Templated
				  .scan_out(opddq00_scanout),	 // Templated
				  // Inputs
				  .wr_adr(opdc_opddq00_wr_addr[5:0]), // Templated
				  .wr_en(opdc_opddq00_wr_en),	 // Templated
				  .rd_adr(opds_opddq00_rd_addr[5:0]), // Templated
				  .rd_en(opds_opddq00_rd_en),	 // Templated
				  .din	({opdc_mb1bank_parity_opc1[7:0], opdc_mb1bank_data_opc1[63:0]}), // Templated
				  .rdclk(iol2clk),		 // Templated
				  .wrclk(l2clk),		 // Templated
				  .scan_in(opddq00_scanin),	 // Templated
				  .tcu_pce_ov(tcu_pce_ov),
				  .tcu_aclk(aclk),		 // Templated
				  .tcu_bclk(bclk),		 // Templated
				  .tcu_array_wr_inhibit(array_wr_inhibit), // Templated
				  .tcu_se_scancollar_in(tcu_se_scancollar_in),
				  .tcu_se_scancollar_out(tcu_se_scancollar_out),
				  .bist_clk_mux_sel(bist_clk_mux_sel), // Templated
				  .rd_pce(rd_pce),		 // Templated
				  .wr_pce(wr_pce));		 // Templated
               
   // DMU : L2 Parity[7:0], DataPayload[127:64] wCrS1r1d64w72 - 16 cacheline entries 
   n2_com_dp_64x72s_cust opddq01 (/*AUTOINST*/
				  // Outputs
				  .dout	({opddq01_pout[7:0], opddq01_dout[63:0]}), // Templated
				  .scan_out(opddq01_scanout),	 // Templated
				  // Inputs
				  .wr_adr(opdc_opddq01_wr_addr[5:0]), // Templated
				  .wr_en(opdc_opddq01_wr_en),	 // Templated
				  .rd_adr(opds_opddq01_rd_addr[5:0]), // Templated
				  .rd_en(opds_opddq01_rd_en),	 // Templated
				  .din	({opdc_mb1bank_parity_opc1[7:0], opdc_mb1bank_data_opc1[63:0]}), // Templated
				  .rdclk(iol2clk),		 // Templated
				  .wrclk(l2clk),		 // Templated
				  .scan_in(opddq01_scanin),	 // Templated
				  .tcu_pce_ov(tcu_pce_ov),
				  .tcu_aclk(aclk),		 // Templated
				  .tcu_bclk(bclk),		 // Templated
				  .tcu_array_wr_inhibit(array_wr_inhibit), // Templated
				  .tcu_se_scancollar_in(tcu_se_scancollar_in),
				  .tcu_se_scancollar_out(tcu_se_scancollar_out),
				  .bist_clk_mux_sel(bist_clk_mux_sel), // Templated
				  .rd_pce(rd_pce),		 // Templated
				  .wr_pce(wr_pce));		 // Templated
               
   // NIU : L2 Parity[7:0], DataPayload[127:64] wCrS1r1d64w72 - 16 cacheline entries 
   n2_com_dp_64x72s_cust opddq10 (/*AUTOINST*/
				  // Outputs
				  .dout	({opddq10_pout[7:0], opddq10_dout[63:0]}), // Templated
				  .scan_out(opddq10_scanout),	 // Templated
				  // Inputs
				  .wr_adr(opdc_opddq10_wr_addr[5:0]), // Templated
				  .wr_en(opdc_opddq10_wr_en),	 // Templated
				  .rd_adr(opds_opddq10_rd_addr[5:0]), // Templated
				  .rd_en(opds_opddq10_rd_en),	 // Templated
				  .din	({opdc_mb1bank_parity_opc1[7:0], opdc_mb1bank_data_opc1[63:0]}), // Templated
				  .rdclk(iol2clk),		 // Templated
				  .wrclk(l2clk),		 // Templated
				  .scan_in(opddq10_scanin),	 // Templated
				  .tcu_pce_ov(tcu_pce_ov),
				  .tcu_aclk(aclk),		 // Templated
				  .tcu_bclk(bclk),		 // Templated
				  .tcu_array_wr_inhibit(array_wr_inhibit), // Templated
				  .tcu_se_scancollar_in(tcu_se_scancollar_in),
				  .tcu_se_scancollar_out(tcu_se_scancollar_out),
				  .bist_clk_mux_sel(bist_clk_mux_sel), // Templated
				  .rd_pce(rd_pce),		 // Templated
				  .wr_pce(wr_pce));		 // Templated
               
   // NIU : L2 Parity[7:0], DataPayload[127:64] wCrS1r1d64w72 - 16 cacheline entries 
   n2_com_dp_64x72s_cust opddq11 (/*AUTOINST*/
				  // Outputs
				  .dout	({opddq11_pout[7:0], opddq11_dout[63:0]}), // Templated
				  .scan_out(opddq11_scanout),	 // Templated
				  // Inputs
				  .wr_adr(opdc_opddq11_wr_addr[5:0]), // Templated
				  .wr_en(opdc_opddq11_wr_en),	 // Templated
				  .rd_adr(opds_opddq11_rd_addr[5:0]), // Templated
				  .rd_en(opds_opddq11_rd_en),	 // Templated
				  .din	({opdc_mb1bank_parity_opc1[7:0], opdc_mb1bank_data_opc1[63:0]}), // Templated
				  .rdclk(iol2clk),		 // Templated
				  .wrclk(l2clk),		 // Templated
				  .scan_in(opddq11_scanin),	 // Templated
				  .tcu_pce_ov(tcu_pce_ov),
				  .tcu_aclk(aclk),		 // Templated
				  .tcu_bclk(bclk),		 // Templated
				  .tcu_array_wr_inhibit(array_wr_inhibit), // Templated
				  .tcu_se_scancollar_in(tcu_se_scancollar_in),
				  .tcu_se_scancollar_out(tcu_se_scancollar_out),
				  .bist_clk_mux_sel(bist_clk_mux_sel), // Templated
				  .rd_pce(rd_pce),		 // Templated
				  .wr_pce(wr_pce));		 // Templated

   // DMU L2 Header[31:0]        wCrS1r1d16x32w - 16 entries used
   n2_com_dp_16x32s_cust  opdhq0 (/*AUTOINST*/
				  // Outputs
				  .dout	(opdhq0_dout[31:0]),	 // Templated
				  .scan_out(opdhq0_scanout),	 // Templated
				  // Inputs
				  .wr_adr({opdc_opdhq0_wr_addr[3:0]}), // Templated
				  .wr_en(opdc_opdhq0_wr_en),	 // Templated
				  .rd_adr({opds_opdhq0_rd_addr[3:0]}), // Templated
				  .rd_en(opds_opdhq0_rd_en),	 // Templated
				  .din	(opdc_mb1bank_data_opc1[31:0]), // Templated
				  .rdclk(iol2clk),		 // Templated
				  .wrclk(l2clk),		 // Templated
				  .scan_in(opdhq0_scanin),	 // Templated
				  .tcu_pce_ov(tcu_pce_ov),
				  .tcu_aclk(aclk),		 // Templated
				  .tcu_bclk(bclk),		 // Templated
				  .tcu_array_wr_inhibit(array_wr_inhibit), // Templated
				  .tcu_se_scancollar_in(tcu_se_scancollar_in),
				  .bist_clk_mux_sel(bist_clk_mux_sel), // Templated
				  .rd_pce(rd_pce),		 // Templated
				  .wr_pce(wr_pce));		 // Templated
              
   // NIU L2 Header[31:0]        wCrS1r1d16x32 - 16 entries used
   n2_com_dp_16x32s_cust  opdhq1 (/*AUTOINST*/
				  // Outputs
				  .dout	(opdhq1_dout[31:0]),	 // Templated
				  .scan_out(opdhq1_scanout),	 // Templated
				  // Inputs
				  .wr_adr({opdc_opdhq1_wr_addr[3:0]}), // Templated
				  .wr_en(opdc_opdhq1_wr_en),	 // Templated
				  .rd_adr({opds_opdhq1_rd_addr[3:0]}), // Templated
				  .rd_en(opds_opdhq1_rd_en),	 // Templated
				  .din	(opdc_mb1bank_data_opc1[31:0]), // Templated
				  .rdclk(iol2clk),		 // Templated
				  .wrclk(l2clk),		 // Templated
				  .scan_in(opdhq1_scanin),	 // Templated
				  .tcu_pce_ov(tcu_pce_ov),
				  .tcu_aclk(aclk),		 // Templated
				  .tcu_bclk(bclk),		 // Templated
				  .tcu_array_wr_inhibit(array_wr_inhibit), // Templated
				  .tcu_se_scancollar_in(tcu_se_scancollar_in),
				  .bist_clk_mux_sel(bist_clk_mux_sel), // Templated
				  .rd_pce(rd_pce),		 // Templated
				  .wr_pce(wr_pce));		 // Templated


   // For SIO->DMU Miscellaneous muxes and datapath elements 
   sio_opds_dp          opds0  (/*AUTOINST*/
				// Outputs
				.opds_packet_data(opds0_packet_data[127:0]), // Templated
				.opds_packet_parity(opds0_packet_parity[7:0]), // Templated
				.opds_read_data(opds0_read_data[71:0]), // Templated
				.opds_opddq0_rd_en(opds_opddq00_rd_en), // Templated
				.opds_opddq1_rd_en(opds_opddq01_rd_en), // Templated
				.opds_opdhq_rd_en(opds_opdhq0_rd_en), // Templated
				.opds_opddq0_rd_addr(opds_opddq00_rd_addr[5:0]), // Templated
				.opds_opddq1_rd_addr(opds_opddq01_rd_addr[5:0]), // Templated
				.opds_opdhq_rd_addr(opds_opdhq0_rd_addr[3:0]), // Templated
				.parity_result(parity_result0[7:0]), // Templated
				.scan_out(opds0_scanout),	 // Templated
				// Inputs
				.opddqx0_dout(opddq00_dout[63:0]), // Templated
				.opddqx1_dout(opddq01_dout[63:0]), // Templated
				.opddqx0_pout(opddq00_pout[7:0]), // Templated
				.opddqx1_pout(opddq01_pout[7:0]), // Templated
				.opdhqx_dout(opdhq0_dout[31:0]), // Templated
				.opcs_new_opdhqx1(opcs_new_opdhqx0_1[63:0]), // Templated
				.opcs_new_opdhqx0(opcs_new_opdhqx0_0[63:0]), // Templated
				.ncu_sio_d_pei(ncu_sio_d_pei),
				.opcs_opds_reloadhdr(opcs_opds0_reloadhdr), // Templated
				.opcs_opds_selhdr(opcs_opds0_selhdr), // Templated
				.sio_mb1_opdhq_sel(sio_mb1_opdhq_sel    ), // Templated
				.sio_mb1_opddq0_sel(sio_mb1_opddq0_sel   ), // Templated
				.sio_mb1_opddq1_sel(sio_mb1_opddq1_sel   ), // Templated
				.sio_mb1_run(sio_mb1_run),
				.opcs_opddq0_rd_en(opcs_opddq00_rd_en), // Templated
				.opcs_opddq1_rd_en(opcs_opddq01_rd_en), // Templated
				.opcs_opdhq_rd_en(opcs_opdhq0_rd_en), // Templated
				.mb1_opddq0_rd_en(sio_mb1_opddq00_rd_en), // Templated
				.mb1_opddq1_rd_en(sio_mb1_opddq01_rd_en), // Templated
				.mb1_opdhq_rd_en(sio_mb1_opdhq0_rd_en), // Templated
				.opcs_opddq0_rd_addr(opcs_opddq00_rd_addr[5:0]), // Templated
				.opcs_opddq1_rd_addr(opcs_opddq01_rd_addr[5:0]), // Templated
				.opcs_opdhq_rd_addr(opcs_opdhq0_rd_addr[3:0]), // Templated
				.mb1_opddq0_rd_addr(sio_mb1_addr[5:0]), // Templated
				.mb1_opddq1_rd_addr(sio_mb1_addr[5:0]), // Templated
				.mb1_opdhq_rd_addr(sio_mb1_addr[3:0]), // Templated
				.iol2clk(iol2clk),
				.tcu_scan_en(tcu_scan_en),
				.scan_in(opds0_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc6io_clk_stop)); // Templated

   // For SIO->NIU Miscellaneous muxes and datapath elements 
   sio_opds_dp          opds1  (/*AUTOINST*/
				// Outputs
				.opds_packet_data(opds1_packet_data[127:0]), // Templated
				.opds_packet_parity(opds1_packet_parity[7:0]), // Templated
				.opds_read_data(opds1_read_data[71:0]), // Templated
				.opds_opddq0_rd_en(opds_opddq10_rd_en), // Templated
				.opds_opddq1_rd_en(opds_opddq11_rd_en), // Templated
				.opds_opdhq_rd_en(opds_opdhq1_rd_en), // Templated
				.opds_opddq0_rd_addr(opds_opddq10_rd_addr[5:0]), // Templated
				.opds_opddq1_rd_addr(opds_opddq11_rd_addr[5:0]), // Templated
				.opds_opdhq_rd_addr(opds_opdhq1_rd_addr[3:0]), // Templated
				.parity_result(parity_result1[7:0]), // Templated
				.scan_out(opds1_scanout),	 // Templated
				// Inputs
				.opddqx0_dout(opddq10_dout[63:0]), // Templated
				.opddqx1_dout(opddq11_dout[63:0]), // Templated
				.opddqx0_pout(opddq10_pout[7:0]), // Templated
				.opddqx1_pout(opddq11_pout[7:0]), // Templated
				.opdhqx_dout(opdhq1_dout[31:0]), // Templated
				.opcs_new_opdhqx1(opcs_new_opdhqx1_1[63:0]), // Templated
				.opcs_new_opdhqx0(opcs_new_opdhqx1_0[63:0]), // Templated
				.ncu_sio_d_pei(ncu_sio_d_pei),
				.opcs_opds_reloadhdr(opcs_opds1_reloadhdr), // Templated
				.opcs_opds_selhdr(opcs_opds1_selhdr), // Templated
				.sio_mb1_opdhq_sel(sio_mb1_opdhq_sel    ), // Templated
				.sio_mb1_opddq0_sel(sio_mb1_opddq0_sel   ), // Templated
				.sio_mb1_opddq1_sel(sio_mb1_opddq1_sel   ), // Templated
				.sio_mb1_run(sio_mb1_run),
				.opcs_opddq0_rd_en(opcs_opddq10_rd_en), // Templated
				.opcs_opddq1_rd_en(opcs_opddq11_rd_en), // Templated
				.opcs_opdhq_rd_en(opcs_opdhq1_rd_en), // Templated
				.mb1_opddq0_rd_en(sio_mb1_opddq10_rd_en), // Templated
				.mb1_opddq1_rd_en(sio_mb1_opddq11_rd_en), // Templated
				.mb1_opdhq_rd_en(sio_mb1_opdhq1_rd_en), // Templated
				.opcs_opddq0_rd_addr(opcs_opddq10_rd_addr[5:0]), // Templated
				.opcs_opddq1_rd_addr(opcs_opddq11_rd_addr[5:0]), // Templated
				.opcs_opdhq_rd_addr(opcs_opdhq1_rd_addr[3:0]), // Templated
				.mb1_opddq0_rd_addr(sio_mb1_addr[5:0]), // Templated
				.mb1_opddq1_rd_addr(sio_mb1_addr[5:0]), // Templated
				.mb1_opdhq_rd_addr(sio_mb1_addr[3:0]), // Templated
				.iol2clk(iol2clk),
				.tcu_scan_en(tcu_scan_en),
				.scan_in(opds1_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc6io_clk_stop)); // Templated

   // Controller In Core Domain
   sio_opcc_ctl         opcc   (/*AUTOINST*/
				// Outputs
				.sio_tcu_vld(sio_tcu_vld),
				.sio_tcu_data(sio_tcu_data),
				.sio_sii_opcc_ipcc_niu_by_deq(sio_sii_opcc_ipcc_niu_by_deq),
				.sio_sii_opcc_ipcc_niu_by_cnt(sio_sii_opcc_ipcc_niu_by_cnt[3:0]),
				.sio_sii_opcc_ipcc_niu_or_deq(sio_sii_opcc_ipcc_niu_or_deq),
				.sio_sii_opcc_ipcc_dmu_by_deq(sio_sii_opcc_ipcc_dmu_by_deq),
				.sio_sii_opcc_ipcc_dmu_by_cnt(sio_sii_opcc_ipcc_dmu_by_cnt[3:0]),
				.sio_sii_opcc_ipcc_dmu_or_deq(sio_sii_opcc_ipcc_dmu_or_deq),
				.array_wr_inhibit(array_wr_inhibit),
				.opcc_olc0_gnt(opcc_olc0_gnt             ), // Templated
				.opcc_olc1_gnt(opcc_olc1_gnt             ), // Templated
				.opcc_olc2_gnt(opcc_olc2_gnt             ), // Templated
				.opcc_olc3_gnt(opcc_olc3_gnt             ), // Templated
				.opcc_olc4_gnt(opcc_olc4_gnt             ), // Templated
				.opcc_olc5_gnt(opcc_olc5_gnt             ), // Templated
				.opcc_olc6_gnt(opcc_olc6_gnt             ), // Templated
				.opcc_olc7_gnt(opcc_olc7_gnt             ), // Templated
				.opcc_opdc_gnt0_opc0(opcc_opdc_gnt0_opc0       ), // Templated
				.opcc_opdc_gnt2_opc0(opcc_opdc_gnt2_opc0       ), // Templated
				.opcc_opdc_gnt4_opc0(opcc_opdc_gnt4_opc0       ), // Templated
				.opcc_opdc_gnt6_opc0(opcc_opdc_gnt6_opc0       ), // Templated
				.opcc_opdc_gnt01_opc1(opcc_opdc_gnt01_opc1      ), // Templated
				.opcc_opdc_gnt45_opc1(opcc_opdc_gnt45_opc1      ), // Templated
				.opcc_opdc_gnt0123_opc1(opcc_opdc_gnt0123_opc1    ), // Templated
				.opcc_opddq00_wr_addr(opcc_opddq00_wr_addr[5:0]), // Templated
				.opcc_opddq10_wr_addr(opcc_opddq10_wr_addr[5:0]), // Templated
				.opcc_opddq01_wr_addr(opcc_opddq01_wr_addr[5:0]), // Templated
				.opcc_opddq11_wr_addr(opcc_opddq11_wr_addr[5:0]), // Templated
				.opcc_opdhq0_wr_addr(opcc_opdhq0_wr_addr[3:0]), // Templated
				.opcc_opdhq1_wr_addr(opcc_opdhq1_wr_addr[3:0]), // Templated
				.opcc_opddq00_wr_en(opcc_opddq00_wr_en), // Templated
				.opcc_opddq10_wr_en(opcc_opddq10_wr_en), // Templated
				.opcc_opddq01_wr_en(opcc_opddq01_wr_en), // Templated
				.opcc_opddq11_wr_en(opcc_opddq11_wr_en), // Templated
				.opcc_opdhq0_wr_en(opcc_opdhq0_wr_en), // Templated
				.opcc_opdhq1_wr_en(opcc_opdhq1_wr_en), // Templated
				.opcc_opcs_opddq00_wr_addr(opcc_opcs_opddq00_wr_addr[6:0]), // Templated
				.opcc_opcs_opddq10_wr_addr(opcc_opcs_opddq10_wr_addr[6:0]), // Templated
				.opcc_opcs_opddq01_wr_addr(opcc_opcs_opddq01_wr_addr[6:0]), // Templated
				.opcc_opcs_opddq11_wr_addr(opcc_opcs_opddq11_wr_addr[6:0]), // Templated
				.opcc_opcs_opdhq0_wr_addr(opcc_opcs_opdhq0_wr_addr[4:0]), // Templated
				.opcc_opcs_opdhq1_wr_addr(opcc_opcs_opdhq1_wr_addr[4:0]), // Templated
				.scan_out(opcc_scanout),	 // Templated
				// Inputs
				.l2clk	(l2clk),
				.olc0_opcc_req(olc0_opcc_req             ), // Templated
				.olc1_opcc_req(olc1_opcc_req             ), // Templated
				.olc2_opcc_req(olc2_opcc_req             ), // Templated
				.olc3_opcc_req(olc3_opcc_req             ), // Templated
				.olc4_opcc_req(olc4_opcc_req             ), // Templated
				.olc5_opcc_req(olc5_opcc_req             ), // Templated
				.olc6_opcc_req(olc6_opcc_req             ), // Templated
				.olc7_opcc_req(olc7_opcc_req             ), // Templated
				.olc0_opcc_dmureq(oldhq0_dout_s_bit), // Templated
				.olc1_opcc_dmureq(oldhq1_dout_s_bit), // Templated
				.olc2_opcc_dmureq(oldhq2_dout_s_bit), // Templated
				.olc3_opcc_dmureq(oldhq3_dout_s_bit), // Templated
				.olc4_opcc_dmureq(oldhq4_dout_s_bit), // Templated
				.olc5_opcc_dmureq(oldhq5_dout_s_bit), // Templated
				.olc6_opcc_dmureq(oldhq6_dout_s_bit), // Templated
				.olc7_opcc_dmureq(oldhq7_dout_s_bit), // Templated
				.olc0_opcc_datareq(oldhq0_dout_r_bit         ), // Templated
				.olc1_opcc_datareq(oldhq1_dout_r_bit         ), // Templated
				.olc2_opcc_datareq(oldhq2_dout_r_bit         ), // Templated
				.olc3_opcc_datareq(oldhq3_dout_r_bit         ), // Templated
				.olc4_opcc_datareq(oldhq4_dout_r_bit         ), // Templated
				.olc5_opcc_datareq(oldhq5_dout_r_bit         ), // Templated
				.olc6_opcc_datareq(oldhq6_dout_r_bit         ), // Templated
				.olc7_opcc_datareq(oldhq7_dout_r_bit         ), // Templated
				.l2sio_v_bits(l2sio_v_bits[7:0]),
				.l2sio_j_bits(l2sio_j_bits[7:0]),
				.l2sio_r_bits(l2sio_r_bits[7:0]),
				.l2sio_o_bits(l2sio_o_bits[7:0]),
				.l2sio_s_bits(l2sio_s_bits[7:0]),
				.ojc0_opcc_sync(ojc0_opcc_sync),
				.ojc1_opcc_sync(ojc1_opcc_sync),
				.ojc2_opcc_sync(ojc2_opcc_sync),
				.ojc3_opcc_sync(ojc3_opcc_sync),
				.ojc4_opcc_sync(ojc4_opcc_sync),
				.ojc5_opcc_sync(ojc5_opcc_sync),
				.ojc6_opcc_sync(ojc6_opcc_sync),
				.ojc7_opcc_sync(ojc7_opcc_sync),
				.ojc0_opcc_ack(ojc0_opcc_ack),
				.ojc1_opcc_ack(ojc1_opcc_ack),
				.ojc2_opcc_ack(ojc2_opcc_ack),
				.ojc3_opcc_ack(ojc3_opcc_ack),
				.ojc4_opcc_ack(ojc4_opcc_ack),
				.ojc5_opcc_ack(ojc5_opcc_ack),
				.ojc6_opcc_ack(ojc6_opcc_ack),
				.ojc7_opcc_ack(ojc7_opcc_ack),
				.old0_opcc_jtag(old0_opcc_jtag),
				.old1_opcc_jtag(old1_opcc_jtag),
				.old2_opcc_jtag(old2_opcc_jtag),
				.old3_opcc_jtag(old3_opcc_jtag),
				.old4_opcc_jtag(old4_opcc_jtag),
				.old5_opcc_jtag(old5_opcc_jtag),
				.old6_opcc_jtag(old6_opcc_jtag),
				.old7_opcc_jtag(old7_opcc_jtag),
				.array_wr_inhibit_cmp(array_wr_inhibit_cmp),
				.array_wr_inhibit_io(array_wr_inhibit_io),
				.cmp_io_sync_en_in(cmp_io_sync_en_in),
				.io_cmp_sync_en_in(io_cmp_sync_en_in),
				.opcs_opcc_opdhq0_rd_addr(opcs_opcc_opdhq0_rd_addr[4:0]), // Templated
				.opcs_opcc_opdhq1_rd_addr(opcs_opcc_opdhq1_rd_addr[4:0]), // Templated
				.tcu_scan_en(tcu_scan_en),
				.scan_in(opcc_scanin),		 // Templated
				.tcu_aclk(aclk),		 // Templated
				.tcu_bclk(bclk),		 // Templated
				.tcu_pce_ov(tcu_pce_ov),
				.tcu_clk_stop(ccu_soc4cmp_clk_stop)); // Templated
   

   // For SIO->DMU Controller In IO Domain
   sio_opcs_ctl         opcs0   (/*AUTOINST*/
				 // Outputs
				 .opcs_ncu_ctag_ue(opcs0_ncu_ctag_ue), // Templated
				 .opcs_ncu_ctag_ce(opcs0_ncu_ctag_ce), // Templated
				 .opcs_ncu_d_pe(opcs0_ncu_d_pe), // Templated
				 .opcs_new_opdhqx1(opcs_new_opdhqx0_1[63:0]), // Templated
				 .opcs_new_opdhqx0(opcs_new_opdhqx0_0[63:0]), // Templated
				 .opcs_opcc_opdhqx_rd_addr(opcs_opcc_opdhq0_rd_addr[4:0]), // Templated
				 .opcs_packet_req(opcs_packet_req[0]), // Templated
				 .opcs_packet_datareq(opcs_packet_datareq[0]), // Templated
				 .opcs_opddqx0_rd_addr(opcs_opddq00_rd_addr[5:0]), // Templated
				 .opcs_opddqx1_rd_addr(opcs_opddq01_rd_addr[5:0]), // Templated
				 .opcs_opdhqx_rd_addr(opcs_opdhq0_rd_addr[3:0]), // Templated
				 .opcs_opddqx0_rd_en(opcs_opddq00_rd_en), // Templated
				 .opcs_opddqx1_rd_en(opcs_opddq01_rd_en), // Templated
				 .opcs_opdhqx_rd_en(opcs_opdhq0_rd_en), // Templated
				 .opcs_opds_reloadhdr(opcs_opds0_reloadhdr), // Templated
				 .opcs_opds_selhdr(opcs_opds0_selhdr), // Templated
				 .scan_out(opcs0_scanout),	 // Templated
				 // Inputs
				 .iol2clk(iol2clk),
				 .ncu_sio_ctag_cei(ncu_sio_ctag_cei),
				 .ncu_sio_ctag_uei(ncu_sio_ctag_uei),
				 .sibling_is_elder_flag(1'b0),	 // Templated
				 .sibling_ncu_ctag_ue(opcs1_ncu_ctag_ue), // Templated
				 .sibling_ncu_ctag_ce(opcs1_ncu_ctag_ce), // Templated
				 .sibling_ncu_d_pe(opcs1_ncu_d_pe), // Templated
				 .opcc_opcs_opddqx0_wr_addr(opcc_opcs_opddq00_wr_addr[6:0]), // Templated
				 .opcc_opcs_opddqx1_wr_addr(opcc_opcs_opddq01_wr_addr[6:0]), // Templated
				 .opcc_opcs_opdhqx_wr_addr(opcc_opcs_opdhq0_wr_addr[4:0]), // Templated
				 .opdhqx_dout(opdhq0_dout[31:0]), // Templated
				 .parity_result(parity_result0[7:0]), // Templated
				 .opcs_packet_flowmode_vld(opcs_packet_flowmode_vld[0]), // Templated
				 .opcs_packet_ack_in(opcs_packet_ack_in[0]), // Templated
				 .tcu_scan_en(tcu_scan_en),
				 .scan_in(opcs0_scanin),	 // Templated
				 .tcu_aclk(aclk),		 // Templated
				 .tcu_bclk(bclk),		 // Templated
				 .tcu_pce_ov(tcu_pce_ov),
				 .tcu_clk_stop(ccu_soc6io_clk_stop), // Templated
				 .tcu_dbr_gateoff(tcu_dbr_gateoff));

   // For SIO->NIU Controller In IO Domain
   sio_opcs_ctl         opcs1   (/*AUTOINST*/
				 // Outputs
				 .opcs_ncu_ctag_ue(opcs1_ncu_ctag_ue), // Templated
				 .opcs_ncu_ctag_ce(opcs1_ncu_ctag_ce), // Templated
				 .opcs_ncu_d_pe(opcs1_ncu_d_pe), // Templated
				 .opcs_new_opdhqx1(opcs_new_opdhqx1_1[63:0]), // Templated
				 .opcs_new_opdhqx0(opcs_new_opdhqx1_0[63:0]), // Templated
				 .opcs_opcc_opdhqx_rd_addr(opcs_opcc_opdhq1_rd_addr[4:0]), // Templated
				 .opcs_packet_req(opcs_packet_req[1]), // Templated
				 .opcs_packet_datareq(opcs_packet_datareq[1]), // Templated
				 .opcs_opddqx0_rd_addr(opcs_opddq10_rd_addr[5:0]), // Templated
				 .opcs_opddqx1_rd_addr(opcs_opddq11_rd_addr[5:0]), // Templated
				 .opcs_opdhqx_rd_addr(opcs_opdhq1_rd_addr[3:0]), // Templated
				 .opcs_opddqx0_rd_en(opcs_opddq10_rd_en), // Templated
				 .opcs_opddqx1_rd_en(opcs_opddq11_rd_en), // Templated
				 .opcs_opdhqx_rd_en(opcs_opdhq1_rd_en), // Templated
				 .opcs_opds_reloadhdr(opcs_opds1_reloadhdr), // Templated
				 .opcs_opds_selhdr(opcs_opds1_selhdr), // Templated
				 .scan_out(opcs1_scanout),	 // Templated
				 // Inputs
				 .iol2clk(iol2clk),
				 .ncu_sio_ctag_cei(ncu_sio_ctag_cei),
				 .ncu_sio_ctag_uei(ncu_sio_ctag_uei),
				 .sibling_is_elder_flag(1'b1),	 // Templated
				 .sibling_ncu_ctag_ue(opcs0_ncu_ctag_ue), // Templated
				 .sibling_ncu_ctag_ce(opcs0_ncu_ctag_ce), // Templated
				 .sibling_ncu_d_pe(opcs0_ncu_d_pe), // Templated
				 .opcc_opcs_opddqx0_wr_addr(opcc_opcs_opddq10_wr_addr[6:0]), // Templated
				 .opcc_opcs_opddqx1_wr_addr(opcc_opcs_opddq11_wr_addr[6:0]), // Templated
				 .opcc_opcs_opdhqx_wr_addr(opcc_opcs_opdhq1_wr_addr[4:0]), // Templated
				 .opdhqx_dout(opdhq1_dout[31:0]), // Templated
				 .parity_result(parity_result1[7:0]), // Templated
				 .opcs_packet_flowmode_vld(opcs_packet_flowmode_vld[1]), // Templated
				 .opcs_packet_ack_in(opcs_packet_ack_in[1]), // Templated
				 .tcu_scan_en(tcu_scan_en),
				 .scan_in(opcs1_scanin),	 // Templated
				 .tcu_aclk(aclk),		 // Templated
				 .tcu_bclk(bclk),		 // Templated
				 .tcu_pce_ov(tcu_pce_ov),
				 .tcu_clk_stop(ccu_soc6io_clk_stop), // Templated
				 .tcu_dbr_gateoff(tcu_dbr_gateoff));
   
// ========= Outbound Packet to DMU/NIU ========

clkgen_sio_cmp	clkgen_cmp ( /*AUTOINST*/
			    // Outputs
			    .l2clk	(l2clk),
			    .aclk	(aclk),
			    .bclk	(bclk),
			    .scan_out	(clkgen_sio_cmp_scanout), // Templated
			    .aclk_wmr	(cmpclkgen_aclk_wmr_unused), // Templated
			    .pce_ov	(pce_ov),
			    .wmr_protect(cmpclkgen_wmr_protect_unused), // Templated
			    .wmr_	(clkgen_cmp_wmr_unused), // Templated
			    .por_	(clkgen_cmp_por_unused), // Templated
			    .cmp_slow_sync_en(cmp_io_sync_en_in), // Templated
			    .slow_cmp_sync_en(io_cmp_sync_en_in), // Templated
			    .array_wr_inhibit(array_wr_inhibit_cmp), // Templated
			    // Inputs
			    .tcu_atpg_mode(tcu_atpg_mode),
			    .tcu_wr_inhibit(tcu_wr_inhibit),
			    .tcu_clk_stop(tcu_sio_clk_stop),	 // Templated
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
			    .tcu_scan_en(tcu_scan_en),
			    .scan_in	(clkgen_sio_cmp_scanin), // Templated
			    .tcu_aclk	(tcu_aclk),
			    .tcu_bclk	(tcu_bclk));

clkgen_sio_io	clkgen_io ( /*AUTOINST*/
			   // Outputs
			   .l2clk	(iol2clk),		 // Templated
			   .aclk	(),			 // Templated
			   .bclk	(),			 // Templated
			   .scan_out	(clkgen_sio_io_scanout), // Templated
			   .aclk_wmr	(ioclkgen_aclk_wmr_unused), // Templated
			   .pce_ov	(ioclkgen_pce_ov_unused), // Templated
			   .wmr_protect	(ioclkgen_wmr_protect_unused), // Templated
			   .wmr_	(clkgen_io_wmr_unused),	 // Templated
			   .por_	(clkgen_io_por_unused),	 // Templated
			   .cmp_slow_sync_en(ioclkgen_cmp_slow_sync_en_unused), // Templated
			   .slow_cmp_sync_en(ioclkgen_slow_cmp_sync_en_unused), // Templated
			   .array_wr_inhibit(array_wr_inhibit_io), // Templated
			   // Inputs
			   .tcu_atpg_mode(tcu_atpg_mode),
			   .tcu_wr_inhibit(tcu_wr_inhibit),
			   .tcu_clk_stop(tcu_sio_io_clk_stop),	 // Templated
			   .tcu_pce_ov	(tcu_pce_ov_in),	 // Templated
			   .rst_wmr_protect(rst_wmr_protect),
			   .rst_wmr_	(rst_wmr_),
			   .rst_por_	(rst_por_),
			   .ccu_cmp_slow_sync_en(ccu_cmp_slow_sync_en),
			   .ccu_slow_cmp_sync_en(ccu_slow_cmp_sync_en),
			   .tcu_div_bypass(tcu_div_bypass),
			   .ccu_div_ph	(ccu_io_out),		 // Templated
			   .cluster_div_en(1'b1),		 // Templated
			   .gclk	(gclk),
			   .cluster_arst_l(cluster_arst_l),
			   .ccu_serdes_dtm(ccu_serdes_dtm),
			   .clk_ext	(clk_ext),
			   .tcu_scan_en	(tcu_scan_en),
			   .scan_in	(clkgen_sio_io_scanin),	 // Templated
			   .tcu_aclk	(tcu_aclk),
			   .tcu_bclk	(tcu_bclk));

// =============== VERILOG-MODE AUTO TEMPLATES

   /*

    sio_mb0_ctl AUTO_TEMPLATE (
                             .tcu_clk_stop (ccu_soc4cmp_clk_stop),
                             .tcu_aclk (aclk),
                             .tcu_bclk (bclk),
    			     .scan_in (mb0_scanin),
    			     .scan_out (mb0_scanout),
                             .sio_mb0_userdata_mode (1'b0),
                             .sio_mb0_bisi_mode (tcu_mbist_bisi_en),
                             .sio_mb0_loop_mode (1'b0),
                             .sio_mb0_loop_on_address (1'b0),
                             .sio_mb0_stop_on_fail (1'b0),                             
                             .sio_mb0_stop_on_next_fail (1'b0),
			     .sio_mb0_user_mode(tcu_mbist_user_mode),
                                );

   sio_mb1_ctl AUTO_TEMPLATE (
		    .sio_mb1_run	(sio_mb1_run),
		    .sio_mb1_addr	(sio_mb1_addr[5:0]),
		    .sio_mb1_wdata	(sio_mb1_wdata[7:0]),
		    .sio_mb1_opddq00_wr_en(sio_mb1_opddq00_wr_en),
		    .sio_mb1_opddq00_rd_en(sio_mb1_opddq00_rd_en),
		    .sio_mb1_opddq01_wr_en(sio_mb1_opddq01_wr_en),
		    .sio_mb1_opddq01_rd_en(sio_mb1_opddq01_rd_en),
		    .sio_mb1_opddq10_wr_en(sio_mb1_opddq10_wr_en),
		    .sio_mb1_opddq10_rd_en(sio_mb1_opddq10_rd_en),
		    .sio_mb1_opddq11_wr_en(sio_mb1_opddq11_wr_en),
		    .sio_mb1_opddq11_rd_en(sio_mb1_opddq11_rd_en),
		    .sio_mb1_opdhq0_wr_en (sio_mb1_opdhq0_wr_en ),
		    .sio_mb1_opdhq0_rd_en (sio_mb1_opdhq0_rd_en ),
		    .sio_mb1_opdhq1_wr_en (sio_mb1_opdhq1_wr_en ),
		    .sio_mb1_opdhq1_rd_en (sio_mb1_opdhq1_rd_en ),
		    .sio_mb1_opdhq_sel    (sio_mb1_opdhq_sel    ),
		    .sio_mb1_opddq0_sel   (sio_mb1_opddq0_sel   ),       
		    .sio_mb1_opddq1_sel   (sio_mb1_opddq1_sel   ),       
		    .sio_mb1_done	(sio_mb1_done),
		    .sio_mb1_fail	(sio_mb1_fail),
		    .scan_out		(mb1_scanout),
		    // Inputs
		    .iol2clk		(iol2clk),
		    .tcu_scan_en	(tcu_scan_en),
		    .scan_in		(mb1_scanin),
		    .tcu_aclk		(aclk),
		    .tcu_bclk		(bclk),
		    .tcu_pce_ov		(tcu_pce_ov),
		    .tcu_clk_stop	(ccu_soc6io_clk_stop),
		    .tcu_sio_mb1_start	(tcu_sio_mb1_start),
	            .sio_mb1_user_mode(tcu_mbist_user_mode),
		    .sio_mb1_bisi_mode	(tcu_mbist_bisi_en),
		    .sio_mb1_loop_on_address(1'b0),
		    .sio_mb1_stop_on_fail(1'b0),
		    .sio_mb1_stop_on_next_fail(1'b0),
		    .opd0_read_data	(opds0_read_data[71:0]),
		    .opd1_read_data	(opds1_read_data[71:0]));




    n2_com_dp_32x34_cust AUTO_TEMPLATE (     // DataPayload wCrC1r1w34x32d - 4 entries of 64B
                             .tcu_aclk (aclk),
                             .tcu_bclk (bclk),
			     .wrclk (l2clk),     
			     .rdclk (l2clk),
			     .rd_pce (rd_pce),
			     .wr_pce (wr_pce),
			     .bist_clk_mux_sel(tie_low),
			     .tcu_array_wr_inhibit(array_wr_inhibit_cmp),
			     .din   (old_olddq@_din[33:0]),
			     .wr_adr (old_olddq@_waddr[4:0]),
			     .wr_en   (old_olddq@_wr_en), 
			     .rd_adr (old_olddq@_raddr[4:0]),
			     .rd_en   (old_olddq@_rd_en),
    			     .scan_in (olddq@_scanin),
    			     .scan_out (olddq@_scanout),
			     .dout  (olddq@_dout[33:0]),
		      );                       
    

    sio_stg1_dp AUTO_TEMPLATE (
                             .tcu_clk_stop (ccu_soc4cmp_clk_stop),
                             .tcu_aclk (aclk),
                             .tcu_bclk (bclk),
			     .l2b_sio_ctag_vld(l2b@_sio_ctag_vld),
			     .l2b_sio_data(l2b@_sio_data[31:0]),
			     .l2b_sio_parity(l2b@_sio_parity[1:0]),
			     .l2b_sio_ue_err(l2b@_sio_ue_err),
				//output
			     .l2b_sio_ctag_vld_r(l2b@_sio_ctag_vld_r),
			     .l2b_sio_data_r(l2b@_sio_data_r[31:0]),
			     .l2b_sio_parity_r(l2b@_sio_parity_r[1:0]),
			     .l2b_sio_ue_err_r(l2b@_sio_ue_err_r),
			     .scan_in(stg@_scanin),
			     .scan_out(stg@_scanout),

		     );

    sio_stg2_dp AUTO_TEMPLATE (
                             .tcu_clk_stop (ccu_soc4cmp_clk_stop),
                             .tcu_aclk (aclk),
                             .tcu_bclk (bclk),
			     .l2b_sio_ctag_vld(l2b@_sio_ctag_vld),
			     .l2b_sio_data(l2b@_sio_data[31:0]),
			     .l2b_sio_parity(l2b@_sio_parity[1:0]),
			     .l2b_sio_ue_err(l2b@_sio_ue_err),
				//output
			     .l2b_sio_ctag_vld_r(l2b@_sio_ctag_vld_r),
			     .l2b_sio_data_r(l2b@_sio_data_r[31:0]),
			     .l2b_sio_parity_r(l2b@_sio_parity_r[1:0]),
			     .l2b_sio_ue_err_r(l2b@_sio_ue_err_r),
			     .scan_in(stg@_scanin),
			     .scan_out(stg@_scanout),

		     );


    sio_old_dp AUTO_TEMPLATE (   // Miscellaneous muxes and header queue datapath elements
                        .tcu_clk_stop (ccu_soc4cmp_clk_stop),
                             .tcu_aclk (aclk),
                             .tcu_bclk (bclk),
			.ojc_old_jtagsr_en  (ojc_old@_jtagsr_en),
			.ojc_old_wr_en      (ojc_old@_wr_en[1:0]),
			.din (l2b@_sio_data_r[31:0]),
			.parity (l2b@_sio_parity_r[1:0]),
			.ue (l2b@_sio_ue_err_r),
			.olc_oldue_check_clrerr (olc_oldue@_check_clrerr),
			.olc_oldue_check_en     (olc_oldue@_check_en),
			.olc_oldue_wr_en        (olc_oldue@_wr_en[3:0]),
			.olc_oldue_rd_addr      (olc_oldue@_rd_addr[1:0]),

			.old_opcc_jtag(old@_opcc_jtag),    

    			.oldhq_dout_r_bit     (oldhq@_dout_r_bit),
			.oldhq_dout_s_bit     (oldhq@_dout_s_bit),
			.olddq0_dout          (olddq@0_dout[33:0]),
			.olddq1_dout          (olddq@1_dout[33:0]),
			.olc_old_selhdr       (olc_old@_selhdr),
     		  	.olc_oldue_selfwd       (olc_oldue@_selfwd),
			.old_opd_data         (old@_opd_data[64:0]),
			.olc_oldhq_wr_en      (olc_oldhq@_wr_en[3:0]),
			.olc_oldhq_rd_addr    (olc_oldhq@_rd_addr[1:0]),
			.oldhq_din            ({l2b@_sio_data_r[`SIO_L2SIO_CTGECC_MSB_BIT : `SIO_L2SIO_CTGECC_LSB_BIT], l2b@_sio_data_r[`SIO_L2SIO_E_BIT], l2b@_sio_data_r[`SIO_L2SIO_R_BIT], l2b@_sio_data_r[`SIO_L2SIO_S_BIT], l2b@_sio_data_r[15:0]}),

			.sio_mbi_run(sio_mb0_run),    
			.sio_mbi_old_addr(sio_mb0_old_addr[4:0]),
			.sio_mbi_old_wdata(sio_mb0_wdata[7:0]),
			.sio_mbi_oldx_wr_en(sio_mb0_old@x_wr_en),
			.sio_mbi_oldx_rd_en(sio_mb0_old@x_rd_en),
    			
			.olc_old_olddqx0_wr_en(olc_old_olddq@0_wr_en),
			.olc_old_olddqx0_rd_en(olc_old_olddq@0_rd_en),
			.olc_old_olddqx0_waddr(olc_old_olddq@0_waddr[4:0]),
			.olc_old_olddqx0_raddr(olc_old_olddq@0_raddr[4:0]),
			
    			.olc_old_olddqx1_wr_en(olc_old_olddq@1_wr_en),
			.olc_old_olddqx1_rd_en(olc_old_olddq@1_rd_en),
			.olc_old_olddqx1_waddr(olc_old_olddq@1_waddr[4:0]),
			.olc_old_olddqx1_raddr(olc_old_olddq@1_raddr[4:0]),
			
			.old_olddqx0_wr_en(old_olddq@0_wr_en),
			.old_olddqx0_rd_en(old_olddq@0_rd_en),
			.old_olddqx0_waddr(old_olddq@0_waddr[4:0]),
			.old_olddqx0_raddr(old_olddq@0_raddr[4:0]),
			.old_olddqx0_din(old_olddq@0_din[33:0]),
			.old_olddqx1_wr_en(old_olddq@1_wr_en),
			.old_olddqx1_rd_en(old_olddq@1_rd_en),
			.old_olddqx1_waddr(old_olddq@1_waddr[4:0]),
			.old_olddqx1_raddr(old_olddq@1_raddr[4:0]),
			.old_olddqx1_din(old_olddq@1_din[33:0]),
			.olc_oldue_pass_late_ue(olc_oldue_pass_late_ue@),

			.scan_in             (old@_scanin),
			.scan_out             (old@_scanout),
 		      );

     sio_olc_ctl AUTO_TEMPLATE (        // Controller In Core Domain                 
                        .tcu_clk_stop (ccu_soc4cmp_clk_stop),
                             .tcu_aclk (aclk),
                             .tcu_bclk (bclk),
     		  	.olc_oldue_check_clrerr (olc_oldue@_check_clrerr),
     		  	.olc_oldue_check_en     (olc_oldue@_check_en),
     		  	.olc_oldue_wr_en        (olc_oldue@_wr_en[3:0]),
     		  	.olc_oldue_rd_addr      (olc_oldue@_rd_addr[1:0]),
     		  	.olc_oldue_selfwd       (olc_oldue@_selfwd),
     		  	.olc_oldue_pass_late_ue (olc_oldue@_pass_late_ue),
     		  	.olc_old_selhdr       (olc_old@_selhdr),
     		  	.olc_oldhq_wr_en      (olc_oldhq@_wr_en[3:0]),
       		  	.olc_oldhq_rd_addr    (olc_oldhq@_rd_addr[1:0]),
 			.olc_oldue_pass_late_ue(olc_oldue_pass_late_ue@),



			.olc_olddq0_wr_addr   (olc_old_olddq@0_waddr[4:0]),
			.olc_olddq0_wr_en     (olc_old_olddq@0_wr_en),  
			.olc_olddq0_rd_addr   (olc_old_olddq@0_raddr[4:0]),
			.olc_olddq0_rd_en     (olc_old_olddq@0_rd_en),  
			.olc_olddq1_wr_addr   (olc_old_olddq@1_waddr[4:0]),
			.olc_olddq1_wr_en     (olc_old_olddq@1_wr_en),  
			.olc_olddq1_rd_addr   (olc_old_olddq@1_raddr[4:0]),
			.olc_olddq1_rd_en     (olc_old_olddq@1_rd_en),


     		  	.ojc_old_wr_en        (ojc_old@_wr_en[1:0]),
     		  	.ojc_old_jtagsr_en    (ojc_old@_jtagsr_en),

			.ojc_opcc_sync        (ojc@_opcc_sync),
			.ojc_opcc_ack         (ojc@_opcc_ack),

			.l2b_sio_ue_err_r     (l2b@_sio_ue_err_r),
     		  	.l2sio_v_bit          (l2b@_sio_ctag_vld_r),
     		  	.l2sio_j_bit          (l2b@_sio_data_r[`SIO_L2SIO_J_BIT]),
     		  	.l2sio_r_bit          (l2b@_sio_data_r[`SIO_L2SIO_R_BIT]),
     		  	.l2sio_p_bit          (l2b@_sio_data_r[`SIO_L2SIO_P_BIT]),
			.oldhq_dout_s_bit     (oldhq@_dout_s_bit),
			.olc_opcc_req         (olc@_opcc_req),
			.olc_opcc_datareq     (olc@_opcc_datareq),
			.opcc_olc_gnt         (opcc_olc@_gnt),
			.sio_sii_olc_ilc_dequeue      (sio_sii_olc@_ilc@_dequeue),

     		  	.scan_in             (olc@_scanin),
     		  	.scan_out             (olc@_scanout),
		      );




     sio_opcc_ctl AUTO_TEMPLATE (        // Controller In Core Domain                 
                        .tcu_clk_stop (ccu_soc4cmp_clk_stop),
                             .tcu_aclk (aclk),
                             .tcu_bclk (bclk),
			.olc0_opcc_req		(olc0_opcc_req             ), 
			.olc1_opcc_req		(olc1_opcc_req             ), 
			.olc2_opcc_req		(olc2_opcc_req             ), 
			.olc3_opcc_req		(olc3_opcc_req             ), 
			.olc4_opcc_req		(olc4_opcc_req             ), 
			.olc5_opcc_req		(olc5_opcc_req             ), 
			.olc6_opcc_req		(olc6_opcc_req             ), 
			.olc7_opcc_req		(olc7_opcc_req             ), 

			.olc0_opcc_dmureq	(oldhq0_dout_s_bit),
			.olc1_opcc_dmureq	(oldhq1_dout_s_bit),
			.olc2_opcc_dmureq	(oldhq2_dout_s_bit),	
			.olc3_opcc_dmureq	(oldhq3_dout_s_bit),	
			.olc4_opcc_dmureq	(oldhq4_dout_s_bit),	
			.olc5_opcc_dmureq	(oldhq5_dout_s_bit),	
			.olc6_opcc_dmureq	(oldhq6_dout_s_bit),	
			.olc7_opcc_dmureq	(oldhq7_dout_s_bit),	

			.olc0_opcc_datareq	(oldhq0_dout_r_bit         ), 
			.olc1_opcc_datareq	(oldhq1_dout_r_bit         ), 
			.olc2_opcc_datareq	(oldhq2_dout_r_bit         ), 
			.olc3_opcc_datareq	(oldhq3_dout_r_bit         ), 
			.olc4_opcc_datareq	(oldhq4_dout_r_bit         ), 
			.olc5_opcc_datareq	(oldhq5_dout_r_bit         ), 
			.olc6_opcc_datareq	(oldhq6_dout_r_bit         ), 
			.olc7_opcc_datareq	(oldhq7_dout_r_bit         ), 

			.opcc_olc0_gnt          (opcc_olc0_gnt             ), 
			.opcc_olc1_gnt          (opcc_olc1_gnt             ), 
			.opcc_olc2_gnt          (opcc_olc2_gnt             ), 
			.opcc_olc3_gnt          (opcc_olc3_gnt             ), 
			.opcc_olc4_gnt          (opcc_olc4_gnt             ), 
			.opcc_olc5_gnt          (opcc_olc5_gnt             ), 
			.opcc_olc6_gnt          (opcc_olc6_gnt             ), 
			.opcc_olc7_gnt          (opcc_olc7_gnt             ), 

			.opcc_opdc_gnt0_opc0    (opcc_opdc_gnt0_opc0       ), 
			.opcc_opdc_gnt2_opc0    (opcc_opdc_gnt2_opc0       ), 
			.opcc_opdc_gnt4_opc0    (opcc_opdc_gnt4_opc0       ), 
			.opcc_opdc_gnt6_opc0    (opcc_opdc_gnt6_opc0       ), 
			.opcc_opdc_gnt01_opc1   (opcc_opdc_gnt01_opc1      ), 
			.opcc_opdc_gnt45_opc1   (opcc_opdc_gnt45_opc1      ),	 
			.opcc_opdc_gnt0123_opc1 (opcc_opdc_gnt0123_opc1    ),

                        .opcc_opddq00_wr_addr   (opcc_opddq00_wr_addr[5:0]),
                        .opcc_opddq10_wr_addr   (opcc_opddq10_wr_addr[5:0]),
      	                .opcc_opddq01_wr_addr   (opcc_opddq01_wr_addr[5:0]),
      	                .opcc_opddq11_wr_addr   (opcc_opddq11_wr_addr[5:0]),
   			       
      	                .opcc_opdhq0_wr_addr    (opcc_opdhq0_wr_addr[3:0]),
      	                .opcc_opdhq1_wr_addr    (opcc_opdhq1_wr_addr[3:0]),
   
   	                .opcc_opddq00_wr_en     (opcc_opddq00_wr_en),
   	                .opcc_opddq10_wr_en     (opcc_opddq10_wr_en),
   	                .opcc_opddq01_wr_en     (opcc_opddq01_wr_en),
   	                .opcc_opddq11_wr_en     (opcc_opddq11_wr_en),
   	                .opcc_opdhq0_wr_en      (opcc_opdhq0_wr_en),
   	                .opcc_opdhq1_wr_en      (opcc_opdhq1_wr_en),

                        .cmp_io_sync_en              (cmp_io_sync_en),
                        .opcc_opcs_opddq00_wr_addr   (opcc_opcs_opddq00_wr_addr[6:0]),
                        .opcc_opcs_opddq10_wr_addr   (opcc_opcs_opddq10_wr_addr[6:0]),
      	                .opcc_opcs_opddq01_wr_addr   (opcc_opcs_opddq01_wr_addr[6:0]),
      	                .opcc_opcs_opddq11_wr_addr   (opcc_opcs_opddq11_wr_addr[6:0]),
      	                .opcc_opcs_opdhq0_wr_addr    (opcc_opcs_opdhq0_wr_addr[4:0]),
      	                .opcc_opcs_opdhq1_wr_addr    (opcc_opcs_opdhq1_wr_addr[4:0]),
                        .io_cmp_sync_en              (io_cmp_sync_en),
      	                .opcs_opcc_opdhq0_rd_addr    (opcs_opcc_opdhq0_rd_addr[4:0]),
      	                .opcs_opcc_opdhq1_rd_addr    (opcs_opcc_opdhq1_rd_addr[4:0]),

			.scan_in               (opcc_scanin),	
			.scan_out               (opcc_scanout),				 
 			 );

     sio_opcs_ctl AUTO_TEMPLATE (        // Controller In Core Domain                 
                        .tcu_clk_stop (ccu_soc6io_clk_stop),
                             .tcu_aclk (aclk),
                             .tcu_bclk (bclk),
                        .opcs_packet_flowmode_vld (opcs_packet_flowmode_vld[@]),
                        .opcs_packet_ack_in (opcs_packet_ack_in[@]),

			.opcs_packet_req        (opcs_packet_req[@]),    
			.opcs_packet_datareq    (opcs_packet_datareq[@]),

                        .opcs_opddqx0_rd_addr   (opcs_opddq@0_rd_addr[5:0]),
      	                .opcs_opddqx1_rd_addr   (opcs_opddq@1_rd_addr[5:0]),
   			       
      	                .opcs_opdhqx_rd_addr    (opcs_opdhq@_rd_addr[3:0]),

   
   	                .opcs_opddqx0_rd_en     (opcs_opddq@0_rd_en),
   	                .opcs_opddqx1_rd_en     (opcs_opddq@1_rd_en),
   	                .opcs_opdhqx_rd_en      (opcs_opdhq@_rd_en),

      	                .opcs_opcc_opdhqx_rd_addr    (opcs_opcc_opdhq@_rd_addr[4:0]),

                        .opcc_opcs_opddqx0_wr_addr   (opcc_opcs_opddq@0_wr_addr[6:0]),
                        .opcc_opcs_opddqx1_wr_addr   (opcc_opcs_opddq@1_wr_addr[6:0]),
      	                .opcc_opcs_opdhqx_wr_addr    (opcc_opcs_opdhq@_wr_addr[4:0]),
                         .opcs_new_opdhqx0           (opcs_new_opdhqx@_0[63:0]),
                         .opcs_new_opdhqx1           (opcs_new_opdhqx@_1[63:0]),


			
                        .opdhqx_dout                (opdhq@_dout[31:0]),
                        .opcs_opds_reloadhdr        (opcs_opds@_reloadhdr),
                        .opcs_opds_selhdr           (opcs_opds@_selhdr),
                        .opcs_ncu_ctag_ue           (opcs@_ncu_ctag_ue),
                        .opcs_ncu_ctag_ce           (opcs@_ncu_ctag_ce),
                        .opcs_ncu_d_pe              (opcs@_ncu_d_pe),
                        .parity_result              (parity_result@[7:0]),

                        .sibling_is_elder_flag      (1'b@),
                        .sibling_ncu_ctag_ue        (opcs@"(- 1 @)"_ncu_ctag_ue),
                        .sibling_ncu_ctag_ce        (opcs@"(- 1 @)"_ncu_ctag_ce),
                        .sibling_ncu_d_pe           (opcs@"(- 1 @)"_ncu_d_pe),    


			.scan_in               (opcs@_scanin),
			.scan_out               (opcs@_scanout),				 
 			 );


    sio_opdc_dp AUTO_TEMPLATE (
                        .tcu_clk_stop (ccu_soc4cmp_clk_stop),
                             .tcu_aclk (aclk),
                             .tcu_bclk (bclk),
                        .olddq0_dout({olddq00_dout[33:0],olddq01_dout[33:0]}),
                        .olddq1_dout({olddq10_dout[33:0],olddq11_dout[33:0]}),
                        .olddq2_dout({olddq20_dout[33:0],olddq21_dout[33:0]}),
                        .olddq3_dout({olddq30_dout[33:0],olddq31_dout[33:0]}),
                        .olddq4_dout({olddq40_dout[33:0],olddq41_dout[33:0]}),
                        .olddq5_dout({olddq50_dout[33:0],olddq51_dout[33:0]}),
                        .olddq6_dout({olddq60_dout[33:0],olddq61_dout[33:0]}),
                        .olddq7_dout({olddq70_dout[33:0],olddq71_dout[33:0]}),

                        .scan_in               (opdc_scanin),
                        .scan_out               (opdc_scanout),
                         );

    sio_opds_dp AUTO_TEMPLATE (
                         .tcu_clk_stop (ccu_soc6io_clk_stop),
                             .tcu_aclk (aclk),
                             .tcu_bclk (bclk),
                         .opds_packet_data           (opds@_packet_data[127:0]),
                         .opds_packet_parity         (opds@_packet_parity[7:0]),
                         .opddqx0_dout               (opddq@0_dout[63:0]),
                         .opddqx1_dout               (opddq@1_dout[63:0]),
                         .opdhqx_dout                (opdhq@_dout[31:0]),
                         .opddqx0_pout               (opddq@0_pout[7:0]),
                         .opddqx1_pout               (opddq@1_pout[7:0]),
                         .opcs_opds_reloadhdr        (opcs_opds@_reloadhdr),
                         .opcs_opds_selhdr           (opcs_opds@_selhdr),
                         .opcs_opds_parityerr        (opcs_opds@_parityerr),
                         .parity_result        	     (parity_result@[7:0]),

			 .opcs_new_opdhqx0	     (opcs_new_opdhqx@_0[63:0]),
			 .opcs_new_opdhqx1	     (opcs_new_opdhqx@_1[63:0]),
                         .opds_read_data(opds@_read_data[71:0]),
                         .sio_mb1_opdhq_sel    (sio_mb1_opdhq_sel    ),
                         .sio_mb1_opddq0_sel   (sio_mb1_opddq0_sel   ),       
		         .sio_mb1_opddq1_sel   (sio_mb1_opddq1_sel   ),       


                        .opds_opddq0_rd_en(opds_opddq@0_rd_en),
			.opds_opddq1_rd_en(opds_opddq@1_rd_en),
			.opds_opdhq_rd_en(opds_opdhq@_rd_en),
			.opds_opddq0_rd_addr(opds_opddq@0_rd_addr[5:0]),
			.opds_opddq1_rd_addr(opds_opddq@1_rd_addr[5:0]),
 		        .opds_opdhq_rd_addr(opds_opdhq@_rd_addr[3:0]),

			.opcs_opddq0_rd_en(opcs_opddq@0_rd_en),
			.opcs_opddq1_rd_en(opcs_opddq@1_rd_en),
			.opcs_opdhq_rd_en(opcs_opdhq@_rd_en),
			.mb1_opddq0_rd_en(sio_mb1_opddq@0_rd_en),
			.mb1_opddq1_rd_en(sio_mb1_opddq@1_rd_en),
			.mb1_opdhq_rd_en(sio_mb1_opdhq@_rd_en),
			.opcs_opddq0_rd_addr(opcs_opddq@0_rd_addr[5:0]),
			.opcs_opddq1_rd_addr(opcs_opddq@1_rd_addr[5:0]),
			.opcs_opdhq_rd_addr(opcs_opdhq@_rd_addr[3:0]),
			.mb1_opddq0_rd_addr(sio_mb1_addr[5:0]),
			.mb1_opddq1_rd_addr(sio_mb1_addr[5:0]),
			.mb1_opdhq_rd_addr(sio_mb1_addr[3:0]),

                         .scan_in                    (opds@_scanin),
                         .scan_out                   (opds@_scanout),
                         );

    n2_com_dp_64x72s_cust AUTO_TEMPLATE (           // wCrS1r1d64w72 - upper 8 bits for parity storage, data portion : 64d is equal to 16x64B
                             .tcu_aclk (aclk),
                             .tcu_bclk (bclk),
			     .rd_pce (rd_pce),
			     .wr_pce (wr_pce),
			     .bist_clk_mux_sel(bist_clk_mux_sel),
			     .tcu_array_wr_inhibit(array_wr_inhibit),
			     .wrclk (l2clk),     
			     .rdclk (iol2clk),  
			     .wr_en (opdc_opddq@_wr_en),
			     .wr_adr (opdc_opddq@_wr_addr[5:0]),
			     .rd_adr (opds_opddq@_rd_addr[5:0]),
			     .rd_en (opds_opddq@_rd_en),
			     .din   ({opdc_mb1bank_parity_opc1[7:0], opdc_mb1bank_data_opc1[63:0]}),
   			     .scan_in (opddq@_scanin),
   			     .scan_out (opddq@_scanout),
			     .dout ({opddq@_pout[7:0], opddq@_dout[63:0]}),
                      );

    n2_com_dp_16x32s_cust  AUTO_TEMPLATE (        //  wCrS1r1d16x32w - 16 entries used,
                             .tcu_aclk (aclk),
                             .tcu_bclk (bclk),
			     .rd_pce (rd_pce),
			     .wr_pce (wr_pce),
			     .bist_clk_mux_sel(bist_clk_mux_sel),
			     .tcu_array_wr_inhibit(array_wr_inhibit),
			     .wrclk (l2clk),     
			     .rdclk (iol2clk),     
			     .wr_en (opdc_opdhq@_wr_en),
			     .wr_adr ({opdc_opdhq@_wr_addr[3:0]}),
			     .din   (opdc_mb1bank_data_opc1[31:0]),
			     .rd_adr ({opds_opdhq@_rd_addr[3:0]}),
			     .rd_en (opds_opdhq@_rd_en),
			     .scan_in (opdhq@_scanin),
			     .scan_out (opdhq@_scanout),
			     .dout (opdhq@_dout[31:0]),  
                        );

clkgen_sio_cmp AUTO_TEMPLATE  (
                                .scan_in       (clkgen_sio_cmp_scanin),
                                .scan_out       (clkgen_sio_cmp_scanout),
                                .tcu_clk_stop(tcu_sio_clk_stop),
                                .ccu_div_ph(1'b1),
                                .cluster_div_en(1'b0),
                                .tcu_pce_ov(tcu_pce_ov_in),

                                //output
				.wmr_protect	(cmpclkgen_wmr_protect_unused),
				.aclk_wmr	(cmpclkgen_aclk_wmr_unused),
                                .cmp_slow_sync_en   (cmp_io_sync_en_in),
                                .slow_cmp_sync_en   (io_cmp_sync_en_in),
                                .array_wr_inhibit (array_wr_inhibit_cmp),
                  //            .clk_stop (ccu_soc4cmp_clk_stop),
                            	.wmr_       (clkgen_cmp_wmr_unused),
                            	.por_       (clkgen_cmp_por_unused),


                           );

clkgen_sio_io AUTO_TEMPLATE  (
                                .scan_in       (clkgen_sio_io_scanin),
                                .scan_out       (clkgen_sio_io_scanout),
                                .tcu_clk_stop(tcu_sio_io_clk_stop),
                                .ccu_div_ph(ccu_io_out),
                                .cluster_div_en(1'b1),
                                .tcu_pce_ov(tcu_pce_ov_in),
				.aclk(),
				.bclk(),

                                //output
				.wmr_protect	(ioclkgen_wmr_protect_unused),
				.pce_ov		(ioclkgen_pce_ov_unused),
				.aclk_wmr	(ioclkgen_aclk_wmr_unused),
                                .cmp_slow_sync_en   (ioclkgen_cmp_slow_sync_en_unused),
                                .slow_cmp_sync_en   (ioclkgen_slow_cmp_sync_en_unused),
                                .array_wr_inhibit (array_wr_inhibit_io),
                   //             .clk_stop (ccu_soc6io_clk_stop),
                                .l2clk (iol2clk),
                            	.wmr_       (clkgen_io_wmr_unused),
                            	.por_       (clkgen_io_por_unused),

                           );

              
    */

//verilog-library-directories:("." "/import/n2-svl-localdir1/pc83620/n2cdmspp/design/" "/import/n2-svl-localdir1/pc83620/n2cdmspp/design/sio/rtl/")

// =============== VERILOG-MODE AUTO TEMPLATES

   
// scan start:
assign mb0_scanin                = tcu_sio_mbist_scan_in    ; 
assign mb1_scanin                = mb0_scanout              ;
assign sio_tcu_mbist_scan_out    = mb1_scanout              ;

assign old0_scanin               = scan_in                  ;
assign old1_scanin               = old0_scanout             ;
assign old2_scanin               = old1_scanout             ;
assign old3_scanin               = old2_scanout             ;
assign old4_scanin               = old3_scanout             ;
assign old5_scanin               = old4_scanout             ;
assign old6_scanin               = old5_scanout             ;
assign old7_scanin               = old6_scanout             ;

assign olc0_scanin               = old7_scanout             ;
assign olc1_scanin               = olc0_scanout             ;
assign olc2_scanin               = olc1_scanout             ;
assign olc3_scanin               = olc2_scanout             ;
assign olc4_scanin               = olc3_scanout             ;
assign olc5_scanin               = olc4_scanout             ;
assign olc6_scanin               = olc5_scanout             ;
assign olc7_scanin               = olc6_scanout             ;

assign olddq00_scanin             = olc7_scanout            ;
assign olddq10_scanin             = olddq00_scanout         ;
assign olddq20_scanin             = olddq10_scanout         ;
assign olddq30_scanin             = olddq20_scanout         ;
assign olddq40_scanin             = olddq30_scanout         ;
assign olddq50_scanin             = olddq40_scanout         ;
assign olddq60_scanin             = olddq50_scanout         ;
assign olddq70_scanin             = olddq60_scanout         ;

assign olddq01_scanin             = olddq70_scanout         ;
assign olddq11_scanin             = olddq01_scanout         ;
assign olddq21_scanin             = olddq11_scanout         ;
assign olddq31_scanin             = olddq21_scanout         ;
assign olddq41_scanin             = olddq31_scanout         ;
assign olddq51_scanin             = olddq41_scanout         ;
assign olddq61_scanin             = olddq51_scanout         ;
assign olddq71_scanin             = olddq61_scanout         ;

assign opcc_scanin               = olddq71_scanout          ;
assign opcs0_scanin              = opcc_scanout             ;
assign opcs1_scanin              = opcs0_scanout            ;

assign opdc_scanin               = opcs1_scanout            ;
assign opds0_scanin              = opdc_scanout             ;
assign opds1_scanin              = opds0_scanout            ;
assign opddq00_scanin            = opds1_scanout            ;
assign opddq01_scanin            = opddq00_scanout          ;
assign opddq10_scanin            = opddq01_scanout          ;
assign opddq11_scanin            = opddq10_scanout          ;
assign opdhq0_scanin             = opddq11_scanout          ;
assign opdhq1_scanin             = opdhq0_scanout           ;
assign clkgen_sio_cmp_scanin     = opdhq1_scanout           ;
assign clkgen_sio_io_scanin     = clkgen_sio_cmp_scanout   ;
assign stg1_scanin                  = clkgen_sio_io_scanout           ;
assign stg2_scanin                  = stg1_scanout           ;
assign stg3_scanin                  = stg2_scanout           ;
assign stg4_scanin                  = stg3_scanout           ;
assign stg5_scanin                  = stg4_scanout           ;
assign stg6_scanin                  = stg5_scanout           ;
assign stg7_scanin                  = stg6_scanout           ;
assign scan_out                  = stg7_scanout           ;
// scan end
endmodule


