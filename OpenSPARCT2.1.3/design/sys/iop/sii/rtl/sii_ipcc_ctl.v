// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sii_ipcc_ctl.v
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
module	sii_ipcc_ctl (
  ilc_ipcc_stop0, 
  ilc_ipcc_stop1, 
  ilc_ipcc_stop2, 
  ilc_ipcc_stop3, 
  ilc_ipcc_stop4, 
  ilc_ipcc_stop5, 
  ilc_ipcc_stop6, 
  ilc_ipcc_stop7, 
  ilc_ipcc_dmu_wrm0, 
  ilc_ipcc_dmu_wrm1, 
  ilc_ipcc_dmu_wrm2, 
  ilc_ipcc_dmu_wrm3, 
  ilc_ipcc_dmu_wrm4, 
  ilc_ipcc_dmu_wrm5, 
  ilc_ipcc_dmu_wrm6, 
  ilc_ipcc_dmu_wrm7, 
  ilc_ipcc_niu_wrm0, 
  ilc_ipcc_niu_wrm1, 
  ilc_ipcc_niu_wrm2, 
  ilc_ipcc_niu_wrm3, 
  ilc_ipcc_niu_wrm4, 
  ilc_ipcc_niu_wrm5, 
  ilc_ipcc_niu_wrm6, 
  ilc_ipcc_niu_wrm7, 
  ilc_ipcc_dmu_wrm_dq0, 
  ilc_ipcc_dmu_wrm_dq1, 
  ilc_ipcc_dmu_wrm_dq2, 
  ilc_ipcc_dmu_wrm_dq3, 
  ilc_ipcc_dmu_wrm_dq4, 
  ilc_ipcc_dmu_wrm_dq5, 
  ilc_ipcc_dmu_wrm_dq6, 
  ilc_ipcc_dmu_wrm_dq7, 
  ilc_ipcc_niu_wrm_dq0, 
  ilc_ipcc_niu_wrm_dq1, 
  ilc_ipcc_niu_wrm_dq2, 
  ilc_ipcc_niu_wrm_dq3, 
  ilc_ipcc_niu_wrm_dq4, 
  ilc_ipcc_niu_wrm_dq5, 
  ilc_ipcc_niu_wrm_dq6, 
  ilc_ipcc_niu_wrm_dq7, 
  ipcc_ilc_cmd0, 
  ipcc_ilc_cmd1, 
  ipcc_ilc_cmd2, 
  ipcc_ilc_cmd3, 
  ipcc_ilc_cmd4, 
  ipcc_ilc_cmd5, 
  ipcc_ilc_cmd6, 
  ipcc_ilc_cmd7, 
  array_wr_inhibit_cmp, 
  array_wr_inhibit_io, 
  array_wr_inhibit, 
  inc_ipcc_stop, 
  ncu_sii_pm_in, 
  ncu_sii_ba01_in, 
  ncu_sii_ba23_in, 
  ncu_sii_ba45_in, 
  ncu_sii_ba67_in, 
  ncu_sii_l2_idx_hash_en_in, 
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
  sio_sii_opcc_ipcc_dmu_or_deq_r, 
  sio_sii_opcc_ipcc_dmu_by_deq_r, 
  sio_sii_opcc_ipcc_niu_or_deq_r, 
  sio_sii_opcc_ipcc_niu_by_deq_r, 
  sio_sii_opcc_ipcc_dmu_by_cnt_r, 
  sio_sii_opcc_ipcc_niu_by_cnt_r, 
  data_sel, 
  gnt0_r_m, 
  hdr_data_sel, 
  newhdr_l2, 
  newhdr_nc, 
  new_c, 
  data_parity_err, 
  ipcc_dp_par_data, 
  curhdr, 
  tcu_hdr, 
  tcu_data, 
  tcu_be_par, 
  ipcc_ipcs_dmu_or_go_lv, 
  ipcc_ipcs_dmu_by_go_lv, 
  ipcc_ipcs_dmu_or_ptr, 
  ipcc_ipcs_dmu_by_ptr, 
  ipcc_ipcs_dmu_tag, 
  ipcc_ipcs_wrack_lv, 
  ipcc_ipcs_dmu_wrack_p, 
  ipcc_ipcs_niu_or_go_lv, 
  ipcc_ipcs_niu_by_go_lv, 
  ipcc_ipcs_niu_or_ptr, 
  ipcc_ipcs_niu_by_ptr, 
  ipcs_ipcc_dmu_or_dep, 
  ipcs_ipcc_dmu_by_dep, 
  ipcs_ipcc_niu_or_dep, 
  ipcs_ipcc_niu_by_dep, 
  ipcs_ipcc_add_dmu_or, 
  ipcs_ipcc_add_dmu_by, 
  ipcs_ipcc_add_niu_or, 
  ipcs_ipcc_add_niu_by, 
  sii_mb0_run, 
  sii_mb0_addr, 
  sii_mb0_wr_en, 
  sii_mb0_ind_wr_en, 
  sii_mb1_1of4ipd_sel, 
  sii_mb1_ipd_data_or_hdr_sel, 
  sii_mb1_ipd_data_hibits_sel, 
  sii_mb1_run, 
  sii_mb1_run_r, 
  sii_mb1_addr, 
  sii_mb1_ipdohq0_rd_en, 
  sii_mb1_ipdbhq0_rd_en, 
  sii_mb1_ipdodq0_rd_en, 
  sii_mb1_ipdbdq0_rd_en, 
  sii_mb1_ipdohq1_rd_en, 
  sii_mb1_ipdbhq1_rd_en, 
  sii_mb1_ipdodq1_rd_en, 
  sii_mb1_ipdbdq1_rd_en, 
  ipcc_ildq_wr_addr0_m, 
  ipcc_ildq_wr_addr1_m, 
  ipcc_ildq_wr_addr2_m, 
  ipcc_ildq_wr_addr3_m, 
  ipcc_ildq_wr_addr4_m, 
  ipcc_ildq_wr_addr5_m, 
  ipcc_ildq_wr_addr6_m, 
  ipcc_ildq_wr_addr7_m, 
  ipcc_ildq_wr_en0_m, 
  ipcc_ildq_wr_en1_m, 
  ipcc_ildq_wr_en2_m, 
  ipcc_ildq_wr_en3_m, 
  ipcc_ildq_wr_en4_m, 
  ipcc_ildq_wr_en5_m, 
  ipcc_ildq_wr_en6_m, 
  ipcc_ildq_wr_en7_m, 
  ipcc_ildq_wr_addr0, 
  ipcc_ildq_wr_addr1, 
  ipcc_ildq_wr_addr2, 
  ipcc_ildq_wr_addr3, 
  ipcc_ildq_wr_addr4, 
  ipcc_ildq_wr_addr5, 
  ipcc_ildq_wr_addr6, 
  ipcc_ildq_wr_addr7, 
  ipcc_ildq_wr_en0, 
  ipcc_ildq_wr_en1, 
  ipcc_ildq_wr_en2, 
  ipcc_ildq_wr_en3, 
  ipcc_ildq_wr_en4, 
  ipcc_ildq_wr_en5, 
  ipcc_ildq_wr_en6, 
  ipcc_ildq_wr_en7, 
  ipcc_indq_wr_addr, 
  ipcc_indq_wr_en, 
  ipcc_inc_wr_ovfl, 
  ipdohq0_dout58, 
  ipdbhq0_dout58, 
  ipdohq1_dout58, 
  ipdbhq1_dout58, 
  dmu_or_bank_ext, 
  dmu_by_bank_ext, 
  niu_or_bank_ext, 
  niu_by_bank_ext, 
  ipcc_ipdodq0_rd_addr_m, 
  ipcc_ipdbdq0_rd_addr_m, 
  ipcc_ipdohq0_rd_addr_m, 
  ipcc_ipdbhq0_rd_addr_m, 
  ipcc_ipdohq0_rd_en_m, 
  ipcc_ipdbhq0_rd_en_m, 
  ipcc_ipdodq0_rd_en_m, 
  ipcc_ipdbdq0_rd_en_m, 
  ipcs_ipdohq0_wr_en, 
  ipcs_ipdbhq0_wr_en, 
  ipcs_ipdodq0_wr_en, 
  ipcs_ipdbdq0_wr_en, 
  ipcs_ipdohq0_wr_addr, 
  ipcs_ipdbhq0_wr_addr, 
  ipcs_ipdodq0_wr_addr, 
  ipcs_ipdbdq0_wr_addr, 
  ipcc_ipdodq1_rd_addr_m, 
  ipcc_ipdbdq1_rd_addr_m, 
  ipcc_ipdohq1_rd_addr_m, 
  ipcc_ipdbhq1_rd_addr_m, 
  ipcc_ipdohq1_rd_en_m, 
  ipcc_ipdbhq1_rd_en_m, 
  ipcc_ipdodq1_rd_en_m, 
  ipcc_ipdbdq1_rd_en_m, 
  ipcs_ipdohq1_wr_addr, 
  ipcs_ipdbhq1_wr_addr, 
  ipcs_ipdodq1_wr_addr, 
  ipcs_ipdbdq1_wr_addr, 
  ipcs_ipdohq1_wr_en, 
  ipcs_ipdbhq1_wr_en, 
  ipcs_ipdodq1_wr_en, 
  ipcs_ipdbdq1_wr_en, 
  l2clk, 
  io_cmp_sync_en_in, 
  cmp_io_sync_en_in, 
  scan_in, 
  scan_out, 
  tcu_scan_en, 
  tcu_sii_data, 
  tcu_sii_vld, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_clk_stop);
wire se;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire l1clk;
wire reg_gnt_scanin;
wire id_14_unused;
wire [15:0] id;
wire pa37_unused;
wire [37:0] pa;
wire [4:0] tcu_rcv_hdr_63_59_unused;
wire [63:0] tcu_rcv_hdr;
wire [15:0] tcu_rcv_hdr_55_40_unused;
wire [1:0] tcu_rcv_hdr_1_0_unused;
wire sii_mb0_run_r;
wire [5:0] sii_mb0_addr_r;
wire sii_mb0_wr_en_r;
wire sii_mb1_ipdohq0_rd_en_r;
wire ipdohq0_rd_en;
wire sii_mb1_ipdbhq0_rd_en_r;
wire ipdbhq0_rd_en;
wire sii_mb1_ipdodq0_rd_en_r;
wire ipdodq0_rd_en;
wire sii_mb1_ipdbdq0_rd_en_r;
wire ipdbdq0_rd_en;
wire [3:0] ipcs_ipdohq0_wr_addr_sync;
wire [3:0] ipcc_ipdohq0_rd_addr;
wire ipcs_ipdohq0_wr_en_sync;
wire [3:0] ipcs_ipdbhq0_wr_addr_sync;
wire [3:0] ipcc_ipdbhq0_rd_addr;
wire ipcs_ipdbhq0_wr_en_sync;
wire [5:0] ipcs_ipdodq0_wr_addr_sync;
wire [5:0] ipcc_ipdodq0_rd_addr;
wire ipcs_ipdodq0_wr_en_sync;
wire [5:0] ipcs_ipdbdq0_wr_addr_sync;
wire [5:0] ipcc_ipdbdq0_rd_addr;
wire ipcs_ipdbdq0_wr_en_sync;
wire sii_mb1_ipdohq1_rd_en_r;
wire ipdohq1_rd_en;
wire sii_mb1_ipdbhq1_rd_en_r;
wire ipdbhq1_rd_en;
wire sii_mb1_ipdodq1_rd_en_r;
wire ipdodq1_rd_en;
wire sii_mb1_ipdbdq1_rd_en_r;
wire ipdbdq1_rd_en;
wire [3:0] ipcs_ipdohq1_wr_addr_sync;
wire [3:0] ipcc_ipdohq1_rd_addr;
wire ipcs_ipdohq1_wr_en_sync;
wire [3:0] ipcs_ipdbhq1_wr_addr_sync;
wire [3:0] ipcc_ipdbhq1_rd_addr;
wire ipcs_ipdbhq1_wr_en_sync;
wire [5:0] ipcs_ipdodq1_wr_addr_sync;
wire [5:0] ipcc_ipdodq1_rd_addr;
wire ipcs_ipdodq1_wr_en_sync;
wire [5:0] ipcs_ipdbdq1_wr_addr_sync;
wire [5:0] ipcc_ipdbdq1_rd_addr;
wire ipcs_ipdbdq1_wr_en_sync;
wire [5:0] sii_mb1_addr_r;
wire [4:0] gnt0_r;
wire ipcc_ilc_cmd0_l;
wire l2_io;
wire [2:0] curbank_r;
wire ipcc_ilc_cmd1_l;
wire ipcc_ilc_cmd2_l;
wire ipcc_ilc_cmd3_l;
wire ipcc_ilc_cmd4_l;
wire ipcc_ilc_cmd5_l;
wire ipcc_ilc_cmd6_l;
wire ipcc_ilc_cmd7_l;
wire dmu_tag_en;
wire dmu_or_dq;
wire dmu_by_dq;
wire dma_wr;
wire dmu_tag_en_lv;
wire ipcc_ipcs_wrack_lv_pre;
wire [4:0] gnt_r;
wire rd_wr;
wire niu_or_dq;
wire niu_by_dq;
wire dmu_or_dq_lv;
wire ipcc_ipcs_dmu_or_go_lv_pre;
wire dmu_or_go_pulse;
wire dmu_by_dq_lv;
wire ipcc_ipcs_dmu_by_go_lv_pre;
wire dmu_by_go_pulse;
wire niu_or_dq_lv;
wire ipcc_ipcs_niu_or_go_lv_pre;
wire niu_or_go_pulse;
wire niu_by_dq_lv;
wire ipcc_ipcs_niu_by_go_lv_pre;
wire niu_by_go_pulse;
wire high_lo;
wire [4:0] ipcc_ildq_wr_addr0_l;
wire [4:0] ipcc_ildq_wr_addr1_l;
wire [4:0] ipcc_ildq_wr_addr2_l;
wire [4:0] ipcc_ildq_wr_addr3_l;
wire [4:0] ipcc_ildq_wr_addr4_l;
wire [4:0] ipcc_ildq_wr_addr5_l;
wire [4:0] ipcc_ildq_wr_addr6_l;
wire [4:0] ipcc_ildq_wr_addr7_l;
wire ipcc_ildq_wr_en0_l;
wire dma_wr_r;
wire ipcc_ildq_wr_en1_l;
wire ipcc_ildq_wr_en2_l;
wire ipcc_ildq_wr_en3_l;
wire ipcc_ildq_wr_en4_l;
wire ipcc_ildq_wr_en5_l;
wire ipcc_ildq_wr_en6_l;
wire ipcc_ildq_wr_en7_l;
wire tcu_go_l;
wire dmu_wrm_mode;
wire tcu_go_hld;
wire tcu_rcv_end;
wire one_stop;
wire tcu_go;
wire tcu_txfr_start_l;
wire tcu_sii_vld_r;
wire tcu_txfr_start_r;
wire [7:0] tcu_rcv_cnt_l;
wire [7:0] tcu_rcv_cnt;
wire [127:0] tcu_serial_data_l;
wire tcu_sii_data_r;
wire [127:0] tcu_serial_data;
wire [1:0] tcu_a_parity;
wire tcu_cmd_parity;
wire [5:0] tcu_ctag_ecc;
wire intr_for_tcu;
wire l2_io_tcu;
wire tcu_posted;
wire [15:0] tcu_id;
wire [2:0] tcu_dma_err;
wire [3:0] tcu_d_parity;
wire addr_on;
wire [5:0] err_sig_l;
wire sending_r;
wire niud_pe_l;
wire niua_pe_l;
wire niuctag_ue_l;
wire dmud_pe_l;
wire dmua_pe_l;
wire dmuctag_ue_l;
wire sending_l;
wire trigger_synd;
wire [6:0] send_cnt_l;
wire [6:0] send_cnt_r;
wire data_phase;
wire [5:0] err_sig_r;
wire [63:0] syndrome_l;
wire [55:0] err_ctag_pa_r;
wire cmp_io_sync_en;
wire [63:0] syndrome_r;
wire [3:0] sii_ncu_syn_data_l;
wire sii_ncu_syn_vld_l;
wire ipcc_ipcs_dmu_wrack_p_l;
wire ctag_ecc_ue;
wire cmd_parity_err;
wire cur_source;
wire dmuctag_ue_r;
wire dmuctag_ce_l;
wire ctag_ecc_ce;
wire dmuctag_ce_r;
wire addr_parity_err;
wire dmua_pe_r;
wire dmud_pe_r;
wire niuctag_ue_r;
wire niuctag_ce_l;
wire niuctag_ce_r;
wire niua_pe_r;
wire niud_pe_r;
wire jtag;
wire wrm;
wire data_odd_h;
wire data_even_h;
wire data_odd_l;
wire data_even_l;
wire be_parity_err;
wire [67:0] newdata;
wire [15:0] be;
wire be_parity;
wire [5:0] ipcc_indq_wr_addr_r;
wire [5:0] ipcc_indq_wr_addr_l;
wire ipcc_indq_wr_en_r;
wire sii_mb0_ind_wr_en_r;
wire ipcc_indq_wr_en_l;
wire l2_io_r;
wire ipcc_inc_wr_ovfl_l;
wire [3:0] ipcc_ipdohq0_rd_addr_l;
wire [3:0] ipcc_ipdbhq0_rd_addr_l;
wire [5:0] ipcc_ipdodq0_rd_addr_l;
wire [5:0] ipcc_ipdbdq0_rd_addr_l;
wire [3:0] ipcc_ipdohq1_rd_addr_l;
wire [3:0] ipcc_ipdbhq1_rd_addr_l;
wire [5:0] ipcc_ipdodq1_rd_addr_l;
wire [5:0] ipcc_ipdbdq1_rd_addr_l;
wire [4:0] gnt_l;
wire [1:0] arb1_r;
wire arb2_dmu_l;
wire dmu_or_go;
wire dmu_by_go;
wire arb2_niu_l;
wire niu_or_go;
wire niu_by_go;
wire [1:0] arb1_l;
wire [1:0] arb1_hist_r;
wire dmu_hist_r;
wire niu_hist_r;
wire [1:0] arb1_hist_l;
wire dmu_hist_l;
wire niu_hist_l;
wire all_fifo_empty;
wire [4:0] dmu_or_cnt_r;
wire [4:0] dmu_by_cnt_r;
wire [4:0] niu_or_cnt_r;
wire [4:0] niu_by_cnt_r;
wire all_stop;
wire go;
wire add_dmu_or;
wire io_cmp_sync_en;
wire add_dmu_or_pre;
wire add_dmu_by;
wire add_dmu_by_pre;
wire add_niu_or;
wire add_niu_or_pre;
wire add_niu_by;
wire add_niu_by_pre;
wire [4:0] dmu_or_cnt_l;
wire [4:0] dmu_by_cnt_l;
wire [4:0] niu_or_cnt_l;
wire [4:0] niu_by_cnt_l;
wire dmu_or_dep_ok;
wire dmu_by_dep_ok;
wire niu_or_dep_ok;
wire niu_by_dep_ok;
wire dmu_or_wr_inc;
wire dmu_by_wr_inc;
wire niu_or_wr_inc;
wire niu_by_wr_inc;
wire dmu_or_deq;
wire dmu_wrm_end;
wire niu_or_deq;
wire niu_wrm_mode;
wire niu_wrm_end;
wire dmu_wrm_mode_r;
wire niu_wrm_mode_r;
wire [1:0] dmu_or_op;
wire [1:0] dmu_by_op;
wire [1:0] niu_or_op;
wire [1:0] niu_by_op;
wire dmu_or_wr_full;
wire [1:0] dmu_or_wr_cnt_r;
wire [1:0] dmu_or_wr_cnt_l;
wire [3:0] dmu_by_wr_cnt_r;
wire niu_or_wr_full;
wire [1:0] niu_or_wr_cnt_r;
wire [1:0] niu_or_wr_cnt_l;
wire niu_by_wr_full;
wire [3:0] niu_by_wr_cnt_r;
wire [3:0] niu_by_wr_cnt_snap_l;
wire [3:0] niu_by_wr_cnt_snap_r;
wire [3:0] niu_by_wr_cnt_dec;
wire [3:0] dmu_wrm_cnt_r;
wire ilc_dmu_wrm;
wire [3:0] niu_wrm_cnt_r;
wire ilc_niu_wrm;
wire dmu_wrm_inc;
wire niu_wrm_inc;
wire [1:0] dmu_wrm_op;
wire [1:0] niu_wrm_op;
wire [3:0] dmu_wrm_cnt_l;
wire [3:0] niu_wrm_cnt_l;
wire cur_or_by;
wire posted;
wire hdr_err;
wire out_of_bound;
wire timeout;
wire unmap;
wire uncorr;
wire wrm_r;
wire [2:0] curbank;
wire ncu_sii_pm;
wire ncu_sii_l2_idx_hash_en;
wire [4:0] hash1;
wire [1:0] hash2;
wire hdr_cycle;
wire addr_par_odd;
wire addr_par_even;
wire [5:0] c;
wire ncu_sii_ba01;
wire ncu_sii_ba23;
wire ncu_sii_ba45;
wire ncu_sii_ba67;
wire dmu_all_ack;
wire niu_all_ack;
wire [15:0] ipcs_ipcc_dmu_or_dep_sync;
wire [15:0] ipcs_ipcc_dmu_by_dep_sync;
wire [15:0] ipcs_ipcc_niu_or_dep_sync;
wire [15:0] ipcs_ipcc_niu_by_dep_sync;
wire [13:0] cstate_r;
wire arc_start_dec;
wire arc_dec_arb;
wire arc_arb_hdr;
wire arc_hdrdly_data1;
wire arc_hdrdly_rddw;
wire arc_data1_data2;
wire arc_data2_data3;
wire arc_arb_start;
wire reg_gnt_scanout;
wire reg_gnt0_scanin;
wire reg_gnt0_scanout;
wire reg_cstate_scanin;
wire reg_cstate_scanout;
wire reg_err_ctag_pa_scanin;
wire reg_err_ctag_pa_scanout;
wire reg_dma_wr_scanin;
wire reg_dma_wr_scanout;
wire reg_wrm_scanin;
wire reg_wrm_scanout;
wire reg_l2_io_scanin;
wire reg_l2_io_scanout;
wire reg_dmu_or_cnt_scanin;
wire reg_dmu_or_cnt_scanout;
wire reg_dmu_by_cnt_scanin;
wire reg_dmu_by_cnt_scanout;
wire reg_niu_or_cnt_scanin;
wire reg_niu_or_cnt_scanout;
wire reg_niu_by_cnt_scanin;
wire reg_niu_by_cnt_scanout;
wire reg_indq_wr_addr_scanin;
wire reg_indq_wr_addr_scanout;
wire reg_indq_wr_en_scanin;
wire reg_indq_wr_en_scanout;
wire ipcc_indq_wr_en_dly;
wire reg_indq_wr_en_dly_scanin;
wire reg_indq_wr_en_dly_scanout;
wire reg_indq_wr_ovfl_scanin;
wire reg_indq_wr_ovfl_scanout;
wire reg_arb1_scanin;
wire reg_arb1_scanout;
wire reg_dmu_wrm_cnt_scanin;
wire reg_dmu_wrm_cnt_scanout;
wire reg_niu_wrm_cnt_scanin;
wire reg_niu_wrm_cnt_scanout;
wire reg_dmu_or_wr_cnt_scanin;
wire reg_dmu_or_wr_cnt_scanout;
wire reg_dmu_by_wr_cnt_scanin;
wire reg_dmu_by_wr_cnt_scanout;
wire reg_niu_or_wr_cnt_scanin;
wire reg_niu_or_wr_cnt_scanout;
wire reg_niu_by_wr_cnt_scanin;
wire reg_niu_by_wr_cnt_scanout;
wire reg_niu_by_wr_cnt_snap_scanin;
wire reg_niu_by_wr_cnt_snap_scanout;
wire reg_ildq_wr_addr0_scanin;
wire reg_ildq_wr_addr0_scanout;
wire reg_ildq_wr_addr1_scanin;
wire reg_ildq_wr_addr1_scanout;
wire reg_ildq_wr_addr2_scanin;
wire reg_ildq_wr_addr2_scanout;
wire reg_ildq_wr_addr3_scanin;
wire reg_ildq_wr_addr3_scanout;
wire reg_ildq_wr_addr4_scanin;
wire reg_ildq_wr_addr4_scanout;
wire reg_ildq_wr_addr5_scanin;
wire reg_ildq_wr_addr5_scanout;
wire reg_ildq_wr_addr6_scanin;
wire reg_ildq_wr_addr6_scanout;
wire reg_ildq_wr_addr7_scanin;
wire reg_ildq_wr_addr7_scanout;
wire reg_ipdohq0_rd_addr_scanin;
wire reg_ipdohq0_rd_addr_scanout;
wire reg_ipdbhq0_rd_addr_scanin;
wire reg_ipdbhq0_rd_addr_scanout;
wire reg_ipdohq1_rd_addr_scanin;
wire reg_ipdohq1_rd_addr_scanout;
wire reg_ipdbhq1_rd_addr_scanin;
wire reg_ipdbhq1_rd_addr_scanout;
wire reg_ipdodq0_rd_addr_scanin;
wire reg_ipdodq0_rd_addr_scanout;
wire reg_ipdbdq0_rd_addr_scanin;
wire reg_ipdbdq0_rd_addr_scanout;
wire reg_ipdodq1_rd_addr_scanin;
wire reg_ipdodq1_rd_addr_scanout;
wire reg_ipdbdq1_rd_addr_scanin;
wire reg_ipdbdq1_rd_addr_scanout;
wire reg_curbank_scanin;
wire reg_curbank_scanout;
wire reg_dmu_tag_scanin;
wire reg_dmu_tag_scanout;
wire [3:0] ipcc_ipcs_dmu_tag_pre;
wire reg_ipcc_ipcs_dmu_wrack_p_pre_scanin;
wire reg_ipcc_ipcs_dmu_wrack_p_pre_scanout;
wire ipcc_ipcs_dmu_wrack_p_pre;
wire reg_ipcc_ilc_cmd0_scanin;
wire reg_ipcc_ilc_cmd0_scanout;
wire reg_ipcc_ilc_cmd1_scanin;
wire reg_ipcc_ilc_cmd1_scanout;
wire reg_ipcc_ilc_cmd2_scanin;
wire reg_ipcc_ilc_cmd2_scanout;
wire reg_ipcc_ilc_cmd3_scanin;
wire reg_ipcc_ilc_cmd3_scanout;
wire reg_ipcc_ilc_cmd4_scanin;
wire reg_ipcc_ilc_cmd4_scanout;
wire reg_ipcc_ilc_cmd5_scanin;
wire reg_ipcc_ilc_cmd5_scanout;
wire reg_ipcc_ilc_cmd6_scanin;
wire reg_ipcc_ilc_cmd6_scanout;
wire reg_ipcc_ilc_cmd7_scanin;
wire reg_ipcc_ilc_cmd7_scanout;
wire reg_ipcc_ildq_wr_en0_scanin;
wire reg_ipcc_ildq_wr_en0_scanout;
wire reg_ipcc_ildq_wr_en1_scanin;
wire reg_ipcc_ildq_wr_en1_scanout;
wire reg_ipcc_ildq_wr_en2_scanin;
wire reg_ipcc_ildq_wr_en2_scanout;
wire reg_ipcc_ildq_wr_en3_scanin;
wire reg_ipcc_ildq_wr_en3_scanout;
wire reg_ipcc_ildq_wr_en4_scanin;
wire reg_ipcc_ildq_wr_en4_scanout;
wire reg_ipcc_ildq_wr_en5_scanin;
wire reg_ipcc_ildq_wr_en5_scanout;
wire reg_ipcc_ildq_wr_en6_scanin;
wire reg_ipcc_ildq_wr_en6_scanout;
wire reg_ipcc_ildq_wr_en7_scanin;
wire reg_ipcc_ildq_wr_en7_scanout;
wire reg_arb1_hist_scanin;
wire reg_arb1_hist_scanout;
wire reg_dmu_hist_scanin;
wire reg_dmu_hist_scanout;
wire reg_niu_hist_scanin;
wire reg_niu_hist_scanout;
wire reg_syndrome_scanin;
wire reg_syndrome_scanout;
wire reg_sending_scanin;
wire reg_sending_scanout;
wire reg_send_cnt_scanin;
wire reg_send_cnt_scanout;
wire reg_err_sig_scanin;
wire reg_err_sig_scanout;
wire reg_tcu_serial_data_scanin;
wire reg_tcu_serial_data_scanout;
wire reg_tcu_go_scanin;
wire reg_tcu_go_scanout;
wire reg_tcu_rcv_cnt_scanin;
wire reg_tcu_rcv_cnt_scanout;
wire reg_tcu_txfr_start_scanin;
wire reg_tcu_txfr_start_scanout;
wire reg_cmp_io_sync_en_scanin;
wire reg_cmp_io_sync_en_scanout;
wire reg_io_cmp_sync_en_scanin;
wire reg_io_cmp_sync_en_scanout;
wire reg_sii_ncu_syn_data_scanin;
wire reg_sii_ncu_syn_data_scanout;
wire reg_sii_ncu_syn_vld_scanin;
wire reg_sii_ncu_syn_vld_scanout;
wire reg_dmuctag_ue_r_scanin;
wire reg_dmuctag_ue_r_scanout;
wire reg_dmuctag_ue_scanin;
wire reg_dmuctag_ue_scanout;
wire reg_dmuctag_ce_r_scanin;
wire reg_dmuctag_ce_r_scanout;
wire reg_dmuctag_ce_scanin;
wire reg_dmuctag_ce_scanout;
wire reg_dmua_pe_r_scanin;
wire reg_dmua_pe_r_scanout;
wire reg_dmua_pe_scanin;
wire reg_dmua_pe_scanout;
wire reg_dmu_de_r_scanin;
wire reg_dmu_de_r_scanout;
wire reg_dmu_de_scanin;
wire reg_dmu_de_scanout;
wire reg_niuctag_ue_r_scanin;
wire reg_niuctag_ue_r_scanout;
wire reg_niuctag_ue_scanin;
wire reg_niuctag_ue_scanout;
wire reg_niuctag_ce_r_scanin;
wire reg_niuctag_ce_r_scanout;
wire reg_niuctag_ce_scanin;
wire reg_niuctag_ce_scanout;
wire reg_niua_pe_r_scanin;
wire reg_niua_pe_r_scanout;
wire reg_niua_pe_scanin;
wire reg_niua_pe_scanout;
wire reg_niu_de_r_scanin;
wire reg_niu_de_r_scanout;
wire reg_niu_de_scanin;
wire reg_niu_de_scanout;
wire reg_ipcs_ipdohq0_wr_addr_scanin;
wire reg_ipcs_ipdohq0_wr_addr_scanout;
wire reg_ipcs_ipdbhq0_wr_addr_scanin;
wire reg_ipcs_ipdbhq0_wr_addr_scanout;
wire reg_ipcs_ipdodq0_wr_addr_scanin;
wire reg_ipcs_ipdodq0_wr_addr_scanout;
wire reg_ipcs_ipdbdq0_wr_addr_scanin;
wire reg_ipcs_ipdbdq0_wr_addr_scanout;
wire reg_ipcs_ipdohq0_wr_en_scanin;
wire reg_ipcs_ipdohq0_wr_en_scanout;
wire reg_ipcs_ipdbhq0_wr_en_scanin;
wire reg_ipcs_ipdbhq0_wr_en_scanout;
wire reg_ipcs_ipdodq0_wr_en_scanin;
wire reg_ipcs_ipdodq0_wr_en_scanout;
wire reg_ipcs_ipdbdq0_wr_en_scanin;
wire reg_ipcs_ipdbdq0_wr_en_scanout;
wire reg_ipcs_ipdohq1_wr_addr_scanin;
wire reg_ipcs_ipdohq1_wr_addr_scanout;
wire reg_ipcs_ipdbhq1_wr_addr_scanin;
wire reg_ipcs_ipdbhq1_wr_addr_scanout;
wire reg_ipcs_ipdodq1_wr_addr_scanin;
wire reg_ipcs_ipdodq1_wr_addr_scanout;
wire reg_ipcs_ipdbdq1_wr_addr_scanin;
wire reg_ipcs_ipdbdq1_wr_addr_scanout;
wire reg_ipcs_ipdohq1_wr_en_scanin;
wire reg_ipcs_ipdohq1_wr_en_scanout;
wire reg_ipcs_ipdbhq1_wr_en_scanin;
wire reg_ipcs_ipdbhq1_wr_en_scanout;
wire reg_ipcs_ipdodq1_wr_en_scanin;
wire reg_ipcs_ipdodq1_wr_en_scanout;
wire reg_ipcs_ipdbdq1_wr_en_scanin;
wire reg_ipcs_ipdbdq1_wr_en_scanout;
wire reg_ipcs_ipcc_dmu_or_dep_scanin;
wire reg_ipcs_ipcc_dmu_or_dep_scanout;
wire reg_ipcs_ipcc_dmu_by_dep_scanin;
wire reg_ipcs_ipcc_dmu_by_dep_scanout;
wire reg_ipcs_ipcc_niu_or_dep_scanin;
wire reg_ipcs_ipcc_niu_or_dep_scanout;
wire reg_ipcs_ipcc_niu_by_dep_scanin;
wire reg_ipcs_ipcc_niu_by_dep_scanout;
wire reg_add_dmu_or_scanin;
wire reg_add_dmu_or_scanout;
wire reg_add_dmu_by_scanin;
wire reg_add_dmu_by_scanout;
wire reg_add_niu_or_scanin;
wire reg_add_niu_or_scanout;
wire reg_add_niu_by_scanin;
wire reg_add_niu_by_scanout;
wire reg_ncu_sii_pm_scanin;
wire reg_ncu_sii_pm_scanout;
wire reg_ncu_sii_ba01_scanin;
wire reg_ncu_sii_ba01_scanout;
wire reg_ncu_sii_ba23_scanin;
wire reg_ncu_sii_ba23_scanout;
wire reg_ncu_sii_ba45_scanin;
wire reg_ncu_sii_ba45_scanout;
wire reg_ncu_sii_ba67_scanin;
wire reg_ncu_sii_ba67_scanout;
wire reg_ncu_sii_l2_idx_hash_en_scanin;
wire reg_ncu_sii_l2_idx_hash_en_scanout;
wire reg_ipcc_ipcs_dmu_tag_scanin;
wire reg_ipcc_ipcs_dmu_tag_scanout;
wire reg_ipcc_ipcs_wrack_lv_scanin;
wire reg_ipcc_ipcs_wrack_lv_scanout;
wire reg_ipcc_ipcs_dmu_wrack_p_scanin;
wire reg_ipcc_ipcs_dmu_wrack_p_scanout;
wire reg_wrack_lv_scanin;
wire reg_wrack_lv_scanout;
wire reg_dmu_wrm_mode_scanin;
wire reg_dmu_wrm_mode_scanout;
wire reg_niu_wrm_mode_scanin;
wire reg_niu_wrm_mode_scanout;
wire reg_dmu_or_dq_pre_scanin;
wire reg_dmu_or_dq_pre_scanout;
wire reg_dmu_or_dq_scanin;
wire reg_dmu_or_dq_scanout;
wire reg_dmu_by_dq_pre_scanin;
wire reg_dmu_by_dq_pre_scanout;
wire reg_dmu_by_dq_scanin;
wire reg_dmu_by_dq_scanout;
wire reg_niu_or_dq_pre_scanin;
wire reg_niu_or_dq_pre_scanout;
wire reg_niu_or_dq_scanin;
wire reg_niu_or_dq_scanout;
wire reg_niu_by_dq_pre_scanin;
wire reg_niu_by_dq_pre_scanout;
wire reg_niu_by_dq_scanin;
wire reg_niu_by_dq_scanout;
wire reg_sync_dmu_or_rd_ptr_pre_scanin;
wire reg_sync_dmu_or_rd_ptr_pre_scanout;
wire [3:0] ipcc_ipcs_dmu_or_ptr_pre;
wire reg_sync_dmu_or_rd_ptr_scanin;
wire reg_sync_dmu_or_rd_ptr_scanout;
wire reg_sync_dmu_by_rd_ptr_pre_scanin;
wire reg_sync_dmu_by_rd_ptr_pre_scanout;
wire [3:0] ipcc_ipcs_dmu_by_ptr_pre;
wire reg_sync_dmu_by_rd_ptr_scanin;
wire reg_sync_dmu_by_rd_ptr_scanout;
wire reg_sync_niu_or_rd_ptr_pre_scanin;
wire reg_sync_niu_or_rd_ptr_pre_scanout;
wire [3:0] ipcc_ipcs_niu_or_ptr_pre;
wire reg_sync_niu_or_rd_ptr_scanin;
wire reg_sync_niu_or_rd_ptr_scanout;
wire reg_sync_niu_by_rd_ptr_pre_scanin;
wire reg_sync_niu_by_rd_ptr_pre_scanout;
wire [3:0] ipcc_ipcs_niu_by_ptr_pre;
wire reg_sync_niu_by_rd_ptr_scanin;
wire reg_sync_niu_by_rd_ptr_scanout;
wire reg_sii_mb1_run_scanin;
wire reg_sii_mb1_run_scanout;
wire reg_sii_mb1_addr_scanin;
wire reg_sii_mb1_addr_scanout;
wire reg_sii_mb1_ipdohq0_rd_en_scanin;
wire reg_sii_mb1_ipdohq0_rd_en_scanout;
wire reg_sii_mb1_ipdbhq0_rd_en_scanin;
wire reg_sii_mb1_ipdbhq0_rd_en_scanout;
wire reg_sii_mb1_ipdodq0_rd_en_scanin;
wire reg_sii_mb1_ipdodq0_rd_en_scanout;
wire reg_sii_mb1_ipdbdq0_rd_en_scanin;
wire reg_sii_mb1_ipdbdq0_rd_en_scanout;
wire reg_sii_mb1_ipdohq1_rd_en_scanin;
wire reg_sii_mb1_ipdohq1_rd_en_scanout;
wire reg_sii_mb1_ipdbhq1_rd_en_scanin;
wire reg_sii_mb1_ipdbhq1_rd_en_scanout;
wire reg_sii_mb1_ipdodq1_rd_en_scanin;
wire reg_sii_mb1_ipdodq1_rd_en_scanout;
wire reg_sii_mb1_ipdbdq1_rd_en_scanin;
wire reg_sii_mb1_ipdbdq1_rd_en_scanout;
wire reg_sii_mb0_run_scanin;
wire reg_sii_mb0_run_scanout;
wire reg_sii_mb0_addr_scanin;
wire reg_sii_mb0_addr_scanout;
wire reg_sii_mb0_wr_en_scanin;
wire reg_sii_mb0_wr_en_scanout;
wire reg_sii_mb0_ind_wr_en_scanin;
wire reg_sii_mb0_ind_wr_en_scanout;
wire reg_tcu_sii_data_scanin;
wire reg_tcu_sii_data_scanout;
wire reg_tcu_sii_vld_scanin;
wire reg_tcu_sii_vld_scanout;


//------signals b/w ILC-------
input  		ilc_ipcc_stop0;	
input  		ilc_ipcc_stop1;	
input  		ilc_ipcc_stop2;	
input  		ilc_ipcc_stop3;	
input  		ilc_ipcc_stop4;	
input  		ilc_ipcc_stop5;	
input  		ilc_ipcc_stop6;	
input  		ilc_ipcc_stop7;	

input		ilc_ipcc_dmu_wrm0;
input		ilc_ipcc_dmu_wrm1;
input		ilc_ipcc_dmu_wrm2;
input		ilc_ipcc_dmu_wrm3;
input		ilc_ipcc_dmu_wrm4;
input		ilc_ipcc_dmu_wrm5;
input		ilc_ipcc_dmu_wrm6;
input		ilc_ipcc_dmu_wrm7;

input		ilc_ipcc_niu_wrm0;
input		ilc_ipcc_niu_wrm1;
input		ilc_ipcc_niu_wrm2;
input		ilc_ipcc_niu_wrm3;
input		ilc_ipcc_niu_wrm4;
input		ilc_ipcc_niu_wrm5;
input		ilc_ipcc_niu_wrm6;
input		ilc_ipcc_niu_wrm7;

input		ilc_ipcc_dmu_wrm_dq0;
input		ilc_ipcc_dmu_wrm_dq1;
input		ilc_ipcc_dmu_wrm_dq2;
input		ilc_ipcc_dmu_wrm_dq3;
input		ilc_ipcc_dmu_wrm_dq4;
input		ilc_ipcc_dmu_wrm_dq5;
input		ilc_ipcc_dmu_wrm_dq6;
input		ilc_ipcc_dmu_wrm_dq7;

input		ilc_ipcc_niu_wrm_dq0;
input		ilc_ipcc_niu_wrm_dq1;
input		ilc_ipcc_niu_wrm_dq2;
input		ilc_ipcc_niu_wrm_dq3;
input		ilc_ipcc_niu_wrm_dq4;
input		ilc_ipcc_niu_wrm_dq5;
input		ilc_ipcc_niu_wrm_dq6;
input		ilc_ipcc_niu_wrm_dq7;

output		ipcc_ilc_cmd0;
output		ipcc_ilc_cmd1;
output		ipcc_ilc_cmd2;
output		ipcc_ilc_cmd3;
output		ipcc_ilc_cmd4;
output		ipcc_ilc_cmd5;
output		ipcc_ilc_cmd6;
output		ipcc_ilc_cmd7;


//------signals b/w INC-------
input		array_wr_inhibit_cmp;
input		array_wr_inhibit_io;
output		array_wr_inhibit;
input           inc_ipcc_stop;          //l2clk
input           ncu_sii_pm_in;             //partial mode
input           ncu_sii_ba01_in;             //partial mode
input           ncu_sii_ba23_in;             //partial mode
input           ncu_sii_ba45_in;             //partial mode
input           ncu_sii_ba67_in;             //partial mode
input           ncu_sii_l2_idx_hash_en_in;  //index hashing mode, default is 1
output          sii_ncu_niuctag_ue;
output          sii_ncu_niuctag_ce;
output          sii_ncu_niua_pe;
output          sii_ncu_niud_pe;
output          sii_ncu_dmuctag_ue;
output          sii_ncu_dmuctag_ce;
output          sii_ncu_dmua_pe;
output          sii_ncu_dmud_pe;
output  [3:0]	sii_ncu_syn_data;
output          sii_ncu_syn_vld;


//------signals b/w DMU-------
//output          sii_dmu_oqdq;
//output          sii_dmu_bqdq;

//------signals b/w OLCC-------
input           sio_sii_opcc_ipcc_dmu_or_deq_r;          
input           sio_sii_opcc_ipcc_dmu_by_deq_r;          
input           sio_sii_opcc_ipcc_niu_or_deq_r;          
input           sio_sii_opcc_ipcc_niu_by_deq_r;          
input 	[3:0]	sio_sii_opcc_ipcc_dmu_by_cnt_r;
input 	[3:0]	sio_sii_opcc_ipcc_niu_by_cnt_r;

//------signals b/w IPCS_DP -------
output  [2:0]   data_sel;
output  [4:0]   gnt0_r_m;
output          hdr_data_sel;
output	[63:0]	newhdr_l2;
output 	[63:0]	newhdr_nc;
output  [5:0]   new_c;
output		data_parity_err;
input   [84:0]  ipcc_dp_par_data;
input 	[71:0]	curhdr;
output 	[71:0]	tcu_hdr;
output 	[63:0]	tcu_data;
output 	[11:0]	tcu_be_par;

//------signals b/w IPCS -------
output   	ipcc_ipcs_dmu_or_go_lv;	//asserted at the end of transfer
output   	ipcc_ipcs_dmu_by_go_lv;	//when a packet being dequeue
output 	[3:0]  	ipcc_ipcs_dmu_or_ptr;
output 	[3:0]  	ipcc_ipcs_dmu_by_ptr;
output 	[3:0]  	ipcc_ipcs_dmu_tag;	// for dmu to keep track of credit info
output   	ipcc_ipcs_wrack_lv;	//all the *_go will cross clk domain
output   	ipcc_ipcs_dmu_wrack_p;	//all the *_go will cross clk domain
output   	ipcc_ipcs_niu_or_go_lv;	//all the *_go will cross clk domain
output   	ipcc_ipcs_niu_by_go_lv;	//level signal whenever a internal dq pulse created
output 	[3:0]  	ipcc_ipcs_niu_or_ptr;
output 	[3:0]  	ipcc_ipcs_niu_by_ptr;
input  	[15:0] 	ipcs_ipcc_dmu_or_dep;
input  	[15:0] 	ipcs_ipcc_dmu_by_dep;
input  	[15:0] 	ipcs_ipcc_niu_or_dep;
input  	[15:0] 	ipcs_ipcc_niu_by_dep;
input	 	ipcs_ipcc_add_dmu_or;		
input	 	ipcs_ipcc_add_dmu_by;		
input	 	ipcs_ipcc_add_niu_or;		
input	 	ipcs_ipcc_add_niu_by;		

//------ mbist related signal -------
input		sii_mb0_run;
input   [5:0]   sii_mb0_addr;
input         	sii_mb0_wr_en;
input         	sii_mb0_ind_wr_en;

input 	[3:0]  sii_mb1_1of4ipd_sel;
input  	       sii_mb1_ipd_data_or_hdr_sel;
input  	       sii_mb1_ipd_data_hibits_sel;

input		sii_mb1_run;
output		sii_mb1_run_r;
input   [5:0]   sii_mb1_addr;
input         	sii_mb1_ipdohq0_rd_en;
input         	sii_mb1_ipdbhq0_rd_en;
input         	sii_mb1_ipdodq0_rd_en;
input         	sii_mb1_ipdbdq0_rd_en;
input         	sii_mb1_ipdohq1_rd_en;
input         	sii_mb1_ipdbhq1_rd_en;
input         	sii_mb1_ipdodq1_rd_en;
input         	sii_mb1_ipdbdq1_rd_en;


//------ writing to fifo ildq and indq ----
output 	[4:0]	ipcc_ildq_wr_addr0_m;
output 	[4:0]	ipcc_ildq_wr_addr1_m;
output 	[4:0]	ipcc_ildq_wr_addr2_m;
output 	[4:0]	ipcc_ildq_wr_addr3_m;
output 	[4:0]	ipcc_ildq_wr_addr4_m;
output 	[4:0]	ipcc_ildq_wr_addr5_m;
output 	[4:0]	ipcc_ildq_wr_addr6_m;
output 	[4:0]	ipcc_ildq_wr_addr7_m;
output 		ipcc_ildq_wr_en0_m;
output 		ipcc_ildq_wr_en1_m;
output 		ipcc_ildq_wr_en2_m;
output 		ipcc_ildq_wr_en3_m;
output 		ipcc_ildq_wr_en4_m;
output 		ipcc_ildq_wr_en5_m;
output 		ipcc_ildq_wr_en6_m;
output 		ipcc_ildq_wr_en7_m;

output 	[4:0]	ipcc_ildq_wr_addr0;
output 	[4:0]	ipcc_ildq_wr_addr1;
output 	[4:0]	ipcc_ildq_wr_addr2;
output 	[4:0]	ipcc_ildq_wr_addr3;
output 	[4:0]	ipcc_ildq_wr_addr4;
output 	[4:0]	ipcc_ildq_wr_addr5;
output 	[4:0]	ipcc_ildq_wr_addr6;
output 	[4:0]	ipcc_ildq_wr_addr7;
output 		ipcc_ildq_wr_en0;
output 		ipcc_ildq_wr_en1;
output 		ipcc_ildq_wr_en2;
output 		ipcc_ildq_wr_en3;
output 		ipcc_ildq_wr_en4;
output 		ipcc_ildq_wr_en5;
output 		ipcc_ildq_wr_en6;
output 		ipcc_ildq_wr_en7;

output 	[5:0]   ipcc_indq_wr_addr;      //cmp_clk
output 	    	ipcc_indq_wr_en;      //cmp_clk
output          ipcc_inc_wr_ovfl;       //for checking empty/full of fifo

//------ reading from register file ipds -------
input     	ipdohq0_dout58;
input     	ipdbhq0_dout58;
input     	ipdohq1_dout58;
input     	ipdbhq1_dout58;

input  	[2:0]	dmu_or_bank_ext;	
input  	[2:0]	dmu_by_bank_ext;
input  	[2:0]	niu_or_bank_ext;
input  	[2:0]	niu_by_bank_ext;

output	[5:0]	ipcc_ipdodq0_rd_addr_m;	//dmu ordered data queue	
output	[5:0]	ipcc_ipdbdq0_rd_addr_m;	
output	[3:0]	ipcc_ipdohq0_rd_addr_m;	//dmu ordered header queue
output	[3:0]	ipcc_ipdbhq0_rd_addr_m;
output		ipcc_ipdohq0_rd_en_m;
output		ipcc_ipdbhq0_rd_en_m;
output		ipcc_ipdodq0_rd_en_m;
output		ipcc_ipdbdq0_rd_en_m;
input		ipcs_ipdohq0_wr_en;
input		ipcs_ipdbhq0_wr_en;
input		ipcs_ipdodq0_wr_en;
input		ipcs_ipdbdq0_wr_en;
input 	[3:0]	ipcs_ipdohq0_wr_addr;
input 	[3:0]	ipcs_ipdbhq0_wr_addr;
input 	[5:0]	ipcs_ipdodq0_wr_addr;
input 	[5:0]	ipcs_ipdbdq0_wr_addr;

output	[5:0]	ipcc_ipdodq1_rd_addr_m;	//ethernet ordered data queue	
output	[5:0]	ipcc_ipdbdq1_rd_addr_m;	
output	[3:0]	ipcc_ipdohq1_rd_addr_m;	//ethernet ordered header queue
output	[3:0]	ipcc_ipdbhq1_rd_addr_m;
output		ipcc_ipdohq1_rd_en_m;
output		ipcc_ipdbhq1_rd_en_m;
output		ipcc_ipdodq1_rd_en_m;
output		ipcc_ipdbdq1_rd_en_m;
input 	[3:0]	ipcs_ipdohq1_wr_addr;
input 	[3:0]	ipcs_ipdbhq1_wr_addr;
input 	[5:0]	ipcs_ipdodq1_wr_addr;
input 	[5:0]	ipcs_ipdbdq1_wr_addr;
input		ipcs_ipdohq1_wr_en;
input		ipcs_ipdbhq1_wr_en;
input		ipcs_ipdodq1_wr_en;
input		ipcs_ipdbdq1_wr_en;

input		l2clk;
input		io_cmp_sync_en_in;
input		cmp_io_sync_en_in;
input		scan_in ;
output		scan_out;
input        	tcu_scan_en;
input           tcu_sii_data;
input           tcu_sii_vld;
input        	tcu_aclk;
input        	tcu_bclk;
input        	tcu_pce_ov;
input        	tcu_clk_stop;


reg 	[2:0]	data_sel;
reg	[2:0]	partialbank;
reg	[3:0]	niu_by_wr_cnt_l;
reg	[3:0]	dmu_by_wr_cnt_l;

reg  	[2:0]	dmu_or_bank;	
reg  	[2:0]	dmu_by_bank;
reg  	[2:0]	niu_or_bank;
reg  	[2:0]	niu_by_bank;

reg	[15:0]	newid;
reg	[5:0]	new_c;
reg	[5:0]	p;
reg	[5:0]	e;
//************************************************************************
// SCAN CONNECTIONS 
//************************************************************************

   // scan renames
assign 	 	se = tcu_scan_en;
assign 	 	siclk = tcu_aclk;
assign 	 	soclk = tcu_bclk;
assign 	 	pce_ov = tcu_pce_ov;
assign 	 	stop = tcu_clk_stop;
   // end scan


sii_ipcc_ctll1clkhdr_ctl_macro clkgen (
                              .l2clk  (l2clk                  ),
                              .l1en   (1'b1                   ),
                              .l1clk  (l1clk                  ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
                              );
// Spare gate
//spare_ctl_macro spares (num=10) (
//	.scan_in(spares_scanin),
//	.scan_out(spares_scanout),
//	.l1clk	(l1clk)
//);

wire tcu_rcv_end_hld;
wire tcu_rcv_end_r; 
wire si_0;
wire so_0;
wire spare0_flop_unused;
wire spare0_buf_32x_unused;
wire spare0_nand3_8x_unused;
wire spare0_inv_8x_unused;
wire spare0_aoi22_4x_unused;
wire spare0_buf_8x_unused;
wire spare0_oai22_4x_unused;
wire spare0_inv_16x_unused;
wire spare0_nand2_16x_unused;
wire spare0_nor3_4x_unused;
wire spare0_nand2_8x_unused;
wire spare0_buf_16x_unused;
wire spare0_nor2_16x_unused;
wire spare0_inv_32x_unused;
wire si_1;
wire so_1;
wire spare1_flop_unused;
wire spare1_buf_32x_unused;
wire spare1_nand3_8x_unused;
wire spare1_inv_8x_unused;
wire spare1_aoi22_4x_unused;
wire spare1_buf_8x_unused;
wire spare1_oai22_4x_unused;
wire spare1_inv_16x_unused;
wire spare1_nand2_16x_unused;
wire spare1_nor3_4x_unused;
wire spare1_nand2_8x_unused;
wire spare1_buf_16x_unused;
wire spare1_nor2_16x_unused;
wire spare1_inv_32x_unused;
wire si_2;
wire so_2;
wire spare2_flop_unused;
wire spare2_buf_32x_unused;
wire spare2_nand3_8x_unused;
wire spare2_inv_8x_unused;
wire spare2_aoi22_4x_unused;
wire spare2_buf_8x_unused;
wire spare2_oai22_4x_unused;
wire spare2_inv_16x_unused;
wire spare2_nand2_16x_unused;
wire spare2_nor3_4x_unused;
wire spare2_nand2_8x_unused;
wire spare2_buf_16x_unused;
wire spare2_nor2_16x_unused;
wire spare2_inv_32x_unused;
wire si_3;
wire so_3;
wire spare3_flop_unused;
wire spare3_buf_32x_unused;
wire spare3_nand3_8x_unused;
wire spare3_inv_8x_unused;
wire spare3_aoi22_4x_unused;
wire spare3_buf_8x_unused;
wire spare3_oai22_4x_unused;
wire spare3_inv_16x_unused;
wire spare3_nand2_16x_unused;
wire spare3_nor3_4x_unused;
wire spare3_nand2_8x_unused;
wire spare3_buf_16x_unused;
wire spare3_nor2_16x_unused;
wire spare3_inv_32x_unused;
wire si_4;
wire so_4;
wire spare4_flop_unused;
wire spare4_buf_32x_unused;
wire spare4_nand3_8x_unused;
wire spare4_inv_8x_unused;
wire spare4_aoi22_4x_unused;
wire spare4_buf_8x_unused;
wire spare4_oai22_4x_unused;
wire spare4_inv_16x_unused;
wire spare4_nand2_16x_unused;
wire spare4_nor3_4x_unused;
wire spare4_nand2_8x_unused;
wire spare4_buf_16x_unused;
wire spare4_nor2_16x_unused;
wire spare4_inv_32x_unused;
wire si_5;
wire so_5;
wire spare5_buf_32x_unused;
wire spare5_nand3_8x_unused;
wire spare5_inv_8x_unused;
wire spare5_aoi22_4x_unused;
wire spare5_buf_8x_unused;
wire spare5_oai22_4x_unused;
wire spare5_inv_16x_unused;
wire spare5_nand2_16x_unused;
wire spare5_nor3_4x_unused;
wire spare5_nand2_8x_unused;
wire spare5_buf_16x_unused;
wire spare5_nor2_16x_unused;
wire spare5_inv_32x_unused;
wire si_6;
wire so_6;
wire spare6_flop_unused;
wire spare6_buf_32x_unused;
wire spare6_nand3_8x_unused;
wire spare6_inv_8x_unused;
wire spare6_aoi22_4x_unused;
wire spare6_buf_8x_unused;
wire spare6_oai22_4x_unused;
wire spare6_inv_16x_unused;
wire spare6_nand2_16x_unused;
wire spare6_nor3_4x_unused;
wire spare6_nand2_8x_unused;
wire spare6_buf_16x_unused;
wire spare6_nor2_16x_unused;
wire spare6_inv_32x_unused;
wire si_7;
wire so_7;
wire spare7_flop_unused;
wire spare7_buf_32x_unused;
wire spare7_nand3_8x_unused;
wire spare7_inv_8x_unused;
wire spare7_aoi22_4x_unused;
wire spare7_buf_8x_unused;
wire spare7_oai22_4x_unused;
wire spare7_inv_16x_unused;
wire spare7_nand2_16x_unused;
wire spare7_nor3_4x_unused;
wire spare7_nand2_8x_unused;
wire spare7_buf_16x_unused;
wire spare7_nor2_16x_unused;
wire spare7_inv_32x_unused;
wire si_8;
wire so_8;
wire spare8_flop_unused;
wire spare8_buf_32x_unused;
wire spare8_nand3_8x_unused;
wire spare8_inv_8x_unused;
wire spare8_aoi22_4x_unused;
wire spare8_buf_8x_unused;
wire spare8_oai22_4x_unused;
wire spare8_inv_16x_unused;
wire spare8_nand2_16x_unused;
wire spare8_nor3_4x_unused;
wire spare8_nand2_8x_unused;
wire spare8_buf_16x_unused;
wire spare8_nor2_16x_unused;
wire spare8_inv_32x_unused;
wire si_9;
wire so_9;
wire spare9_flop_unused;
wire spare9_buf_32x_unused;
wire spare9_nand3_8x_unused;
wire spare9_inv_8x_unused;
wire spare9_aoi22_4x_unused;
wire spare9_buf_8x_unused;
wire spare9_oai22_4x_unused;
wire spare9_inv_16x_unused;
wire spare9_nand2_16x_unused;
wire spare9_nor3_4x_unused;
wire spare9_nand2_8x_unused;
wire spare9_buf_16x_unused;
wire spare9_nor2_16x_unused;
wire spare9_inv_32x_unused;


cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
                               .q(spare0_flop_unused));
assign si_0 = scan_in;

cl_u1_buf_32x   spare0_buf_32x (.in(1'b1),
                                   .out(spare0_buf_32x_unused));
cl_u1_nand3_8x spare0_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare0_nand3_8x_unused));
cl_u1_inv_8x    spare0_inv_8x (.in(1'b1),
                                  .out(spare0_inv_8x_unused));
cl_u1_aoi22_4x spare0_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_aoi22_4x_unused));
cl_u1_buf_8x    spare0_buf_8x (.in(1'b1),
                                  .out(spare0_buf_8x_unused));
cl_u1_oai22_4x spare0_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_oai22_4x_unused));
cl_u1_inv_16x   spare0_inv_16x (.in(1'b1),
                                   .out(spare0_inv_16x_unused));
cl_u1_nand2_16x spare0_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare0_nand2_16x_unused));
cl_u1_nor3_4x spare0_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare0_nor3_4x_unused));
cl_u1_nand2_8x spare0_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare0_nand2_8x_unused));
cl_u1_buf_16x   spare0_buf_16x (.in(1'b1),
                                   .out(spare0_buf_16x_unused));
cl_u1_nor2_16x spare0_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare0_nor2_16x_unused));
cl_u1_inv_32x   spare0_inv_32x (.in(1'b1),
                                   .out(spare0_inv_32x_unused));

cl_sc1_msff_8x spare1_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_1),
                               .so(so_1),
                               .d(1'b0),
                               .q(spare1_flop_unused));
assign si_1 = so_0;

cl_u1_buf_32x   spare1_buf_32x (.in(1'b1),
                                   .out(spare1_buf_32x_unused));
cl_u1_nand3_8x spare1_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare1_nand3_8x_unused));
cl_u1_inv_8x    spare1_inv_8x (.in(1'b1),
                                  .out(spare1_inv_8x_unused));
cl_u1_aoi22_4x spare1_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_aoi22_4x_unused));
cl_u1_buf_8x    spare1_buf_8x (.in(1'b1),
                                  .out(spare1_buf_8x_unused));
cl_u1_oai22_4x spare1_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_oai22_4x_unused));
cl_u1_inv_16x   spare1_inv_16x (.in(1'b1),
                                   .out(spare1_inv_16x_unused));
cl_u1_nand2_16x spare1_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare1_nand2_16x_unused));
cl_u1_nor3_4x spare1_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare1_nor3_4x_unused));
cl_u1_nand2_8x spare1_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare1_nand2_8x_unused));
cl_u1_buf_16x   spare1_buf_16x (.in(1'b1),
                                   .out(spare1_buf_16x_unused));
cl_u1_nor2_16x spare1_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare1_nor2_16x_unused));
cl_u1_inv_32x   spare1_inv_32x (.in(1'b1),
                                   .out(spare1_inv_32x_unused));

cl_sc1_msff_8x spare2_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_2),
                               .so(so_2),
                               .d(1'b0),
                               .q(spare2_flop_unused));
assign si_2 = so_1;

cl_u1_buf_32x   spare2_buf_32x (.in(1'b1),
                                   .out(spare2_buf_32x_unused));
cl_u1_nand3_8x spare2_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare2_nand3_8x_unused));
cl_u1_inv_8x    spare2_inv_8x (.in(1'b1),
                                  .out(spare2_inv_8x_unused));
cl_u1_aoi22_4x spare2_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_aoi22_4x_unused));
cl_u1_buf_8x    spare2_buf_8x (.in(1'b1),
                                  .out(spare2_buf_8x_unused));
cl_u1_oai22_4x spare2_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_oai22_4x_unused));
cl_u1_inv_16x   spare2_inv_16x (.in(1'b1),
                                   .out(spare2_inv_16x_unused));
cl_u1_nand2_16x spare2_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare2_nand2_16x_unused));
cl_u1_nor3_4x spare2_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare2_nor3_4x_unused));
cl_u1_nand2_8x spare2_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare2_nand2_8x_unused));
cl_u1_buf_16x   spare2_buf_16x (.in(1'b1),
                                   .out(spare2_buf_16x_unused));
cl_u1_nor2_16x spare2_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare2_nor2_16x_unused));
cl_u1_inv_32x   spare2_inv_32x (.in(1'b1),
                                   .out(spare2_inv_32x_unused));

cl_sc1_msff_8x spare3_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_3),
                               .so(so_3),
                               .d(1'b0),
                               .q(spare3_flop_unused));
assign si_3 = so_2;

cl_u1_buf_32x   spare3_buf_32x (.in(1'b1),
                                   .out(spare3_buf_32x_unused));
cl_u1_nand3_8x spare3_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare3_nand3_8x_unused));
cl_u1_inv_8x    spare3_inv_8x (.in(1'b1),
                                  .out(spare3_inv_8x_unused));
cl_u1_aoi22_4x spare3_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_aoi22_4x_unused));
cl_u1_buf_8x    spare3_buf_8x (.in(1'b1),
                                  .out(spare3_buf_8x_unused));
cl_u1_oai22_4x spare3_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_oai22_4x_unused));
cl_u1_inv_16x   spare3_inv_16x (.in(1'b1),
                                   .out(spare3_inv_16x_unused));
cl_u1_nand2_16x spare3_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare3_nand2_16x_unused));
cl_u1_nor3_4x spare3_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare3_nor3_4x_unused));
cl_u1_nand2_8x spare3_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare3_nand2_8x_unused));
cl_u1_buf_16x   spare3_buf_16x (.in(1'b1),
                                   .out(spare3_buf_16x_unused));
cl_u1_nor2_16x spare3_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare3_nor2_16x_unused));
cl_u1_inv_32x   spare3_inv_32x (.in(1'b1),
                                   .out(spare3_inv_32x_unused));

cl_sc1_msff_8x spare4_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_4),
                               .so(so_4),
                               .d(1'b0),
                               .q(spare4_flop_unused));
assign si_4 = so_3;

cl_u1_buf_32x   spare4_buf_32x (.in(1'b1),
                                   .out(spare4_buf_32x_unused));
cl_u1_nand3_8x spare4_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare4_nand3_8x_unused));
cl_u1_inv_8x    spare4_inv_8x (.in(1'b1),
                                  .out(spare4_inv_8x_unused));
cl_u1_aoi22_4x spare4_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_aoi22_4x_unused));
cl_u1_buf_8x    spare4_buf_8x (.in(1'b1),
                                  .out(spare4_buf_8x_unused));
cl_u1_oai22_4x spare4_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_oai22_4x_unused));
cl_u1_inv_16x   spare4_inv_16x (.in(1'b1),
                                   .out(spare4_inv_16x_unused));
cl_u1_nand2_16x spare4_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare4_nand2_16x_unused));
cl_u1_nor3_4x spare4_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare4_nor3_4x_unused));
cl_u1_nand2_8x spare4_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare4_nand2_8x_unused));
cl_u1_buf_16x   spare4_buf_16x (.in(1'b1),
                                   .out(spare4_buf_16x_unused));
cl_u1_nor2_16x spare4_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare4_nor2_16x_unused));
cl_u1_inv_32x   spare4_inv_32x (.in(1'b1),
                                   .out(spare4_inv_32x_unused));

cl_sc1_msff_8x spare5_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_5),
                               .so(so_5),
                               .d(tcu_rcv_end_hld),
                               .q(tcu_rcv_end_r));
assign si_5 = so_4;

cl_u1_buf_32x   spare5_buf_32x (.in(1'b1),
                                   .out(spare5_buf_32x_unused));
cl_u1_nand3_8x spare5_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare5_nand3_8x_unused));
cl_u1_inv_8x    spare5_inv_8x (.in(1'b1),
                                  .out(spare5_inv_8x_unused));
cl_u1_aoi22_4x spare5_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_aoi22_4x_unused));
cl_u1_buf_8x    spare5_buf_8x (.in(1'b1),
                                  .out(spare5_buf_8x_unused));
cl_u1_oai22_4x spare5_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_oai22_4x_unused));
cl_u1_inv_16x   spare5_inv_16x (.in(1'b1),
                                   .out(spare5_inv_16x_unused));
cl_u1_nand2_16x spare5_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare5_nand2_16x_unused));
cl_u1_nor3_4x spare5_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare5_nor3_4x_unused));
cl_u1_nand2_8x spare5_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare5_nand2_8x_unused));
cl_u1_buf_16x   spare5_buf_16x (.in(1'b1),
                                   .out(spare5_buf_16x_unused));
cl_u1_nor2_16x spare5_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare5_nor2_16x_unused));
cl_u1_inv_32x   spare5_inv_32x (.in(1'b1),
                                   .out(spare5_inv_32x_unused));

cl_sc1_msff_8x spare6_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_6),
                               .so(so_6),
                               .d(1'b0),
                               .q(spare6_flop_unused));
assign si_6 = so_5;

cl_u1_buf_32x   spare6_buf_32x (.in(1'b1),
                                   .out(spare6_buf_32x_unused));
cl_u1_nand3_8x spare6_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare6_nand3_8x_unused));
cl_u1_inv_8x    spare6_inv_8x (.in(1'b1),
                                  .out(spare6_inv_8x_unused));
cl_u1_aoi22_4x spare6_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_aoi22_4x_unused));
cl_u1_buf_8x    spare6_buf_8x (.in(1'b1),
                                  .out(spare6_buf_8x_unused));
cl_u1_oai22_4x spare6_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_oai22_4x_unused));
cl_u1_inv_16x   spare6_inv_16x (.in(1'b1),
                                   .out(spare6_inv_16x_unused));
cl_u1_nand2_16x spare6_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare6_nand2_16x_unused));
cl_u1_nor3_4x spare6_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare6_nor3_4x_unused));
cl_u1_nand2_8x spare6_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare6_nand2_8x_unused));
cl_u1_buf_16x   spare6_buf_16x (.in(1'b1),
                                   .out(spare6_buf_16x_unused));
cl_u1_nor2_16x spare6_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare6_nor2_16x_unused));
cl_u1_inv_32x   spare6_inv_32x (.in(1'b1),
                                   .out(spare6_inv_32x_unused));

cl_sc1_msff_8x spare7_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_7),
                               .so(so_7),
                               .d(1'b0),
                               .q(spare7_flop_unused));
assign si_7 = so_6;

cl_u1_buf_32x   spare7_buf_32x (.in(1'b1),
                                   .out(spare7_buf_32x_unused));
cl_u1_nand3_8x spare7_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare7_nand3_8x_unused));
cl_u1_inv_8x    spare7_inv_8x (.in(1'b1),
                                  .out(spare7_inv_8x_unused));
cl_u1_aoi22_4x spare7_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_aoi22_4x_unused));
cl_u1_buf_8x    spare7_buf_8x (.in(1'b1),
                                  .out(spare7_buf_8x_unused));
cl_u1_oai22_4x spare7_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_oai22_4x_unused));
cl_u1_inv_16x   spare7_inv_16x (.in(1'b1),
                                   .out(spare7_inv_16x_unused));
cl_u1_nand2_16x spare7_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare7_nand2_16x_unused));
cl_u1_nor3_4x spare7_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare7_nor3_4x_unused));
cl_u1_nand2_8x spare7_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare7_nand2_8x_unused));
cl_u1_buf_16x   spare7_buf_16x (.in(1'b1),
                                   .out(spare7_buf_16x_unused));
cl_u1_nor2_16x spare7_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare7_nor2_16x_unused));
cl_u1_inv_32x   spare7_inv_32x (.in(1'b1),
                                   .out(spare7_inv_32x_unused));

cl_sc1_msff_8x spare8_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_8),
                               .so(so_8),
                               .d(1'b0),
                               .q(spare8_flop_unused));
assign si_8 = so_7;

cl_u1_buf_32x   spare8_buf_32x (.in(1'b1),
                                   .out(spare8_buf_32x_unused));
cl_u1_nand3_8x spare8_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare8_nand3_8x_unused));
cl_u1_inv_8x    spare8_inv_8x (.in(1'b1),
                                  .out(spare8_inv_8x_unused));
cl_u1_aoi22_4x spare8_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_aoi22_4x_unused));
cl_u1_buf_8x    spare8_buf_8x (.in(1'b1),
                                  .out(spare8_buf_8x_unused));
cl_u1_oai22_4x spare8_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_oai22_4x_unused));
cl_u1_inv_16x   spare8_inv_16x (.in(1'b1),
                                   .out(spare8_inv_16x_unused));
cl_u1_nand2_16x spare8_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare8_nand2_16x_unused));
cl_u1_nor3_4x spare8_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare8_nor3_4x_unused));
cl_u1_nand2_8x spare8_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare8_nand2_8x_unused));
cl_u1_buf_16x   spare8_buf_16x (.in(1'b1),
                                   .out(spare8_buf_16x_unused));
cl_u1_nor2_16x spare8_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare8_nor2_16x_unused));
cl_u1_inv_32x   spare8_inv_32x (.in(1'b1),
                                   .out(spare8_inv_32x_unused));

cl_sc1_msff_8x spare9_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_9),
                               .so(so_9),
                               .d(1'b0),
                               .q(spare9_flop_unused));
assign si_9 = so_8;

cl_u1_buf_32x   spare9_buf_32x (.in(1'b1),
                                   .out(spare9_buf_32x_unused));
cl_u1_nand3_8x spare9_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare9_nand3_8x_unused));
cl_u1_inv_8x    spare9_inv_8x (.in(1'b1),
                                  .out(spare9_inv_8x_unused));
cl_u1_aoi22_4x spare9_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_aoi22_4x_unused));
cl_u1_buf_8x    spare9_buf_8x (.in(1'b1),
                                  .out(spare9_buf_8x_unused));
cl_u1_oai22_4x spare9_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_oai22_4x_unused));
cl_u1_inv_16x   spare9_inv_16x (.in(1'b1),
                                   .out(spare9_inv_16x_unused));
cl_u1_nand2_16x spare9_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare9_nand2_16x_unused));
cl_u1_nor3_4x spare9_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare9_nor3_4x_unused));
cl_u1_nand2_8x spare9_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare9_nand2_8x_unused));
cl_u1_buf_16x   spare9_buf_16x (.in(1'b1),
                                   .out(spare9_buf_16x_unused));
cl_u1_nor2_16x spare9_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare9_nor2_16x_unused));
cl_u1_inv_32x   spare9_inv_32x (.in(1'b1),
                                   .out(spare9_inv_32x_unused));
assign reg_gnt_scanin = so_9;


//************************************************************************
// UNUSED CONNECTIONS 
//************************************************************************
assign 	id_14_unused = id[14];
assign 	pa37_unused = pa[37];
assign 	tcu_rcv_hdr_63_59_unused[4:0] = tcu_rcv_hdr[63:59];
assign 	tcu_rcv_hdr_55_40_unused[15:0] = tcu_rcv_hdr[55:40];
assign 	tcu_rcv_hdr_1_0_unused[1:0] = tcu_rcv_hdr[1:0];
//assign 	parity_err_unused = parity_err;


//************************************************************************
// MBIST SECTION
//************************************************************************
//----------writing to ild -------------------
assign   ipcc_ildq_wr_addr0_m[4:0] = sii_mb0_run_r ? sii_mb0_addr_r[4:0] : ipcc_ildq_wr_addr0[4:0];
assign   ipcc_ildq_wr_addr1_m[4:0] = sii_mb0_run_r ? sii_mb0_addr_r[4:0] : ipcc_ildq_wr_addr1[4:0];
assign   ipcc_ildq_wr_addr2_m[4:0] = sii_mb0_run_r ? sii_mb0_addr_r[4:0] : ipcc_ildq_wr_addr2[4:0];
assign   ipcc_ildq_wr_addr3_m[4:0] = sii_mb0_run_r ? sii_mb0_addr_r[4:0] : ipcc_ildq_wr_addr3[4:0];
assign   ipcc_ildq_wr_addr4_m[4:0] = sii_mb0_run_r ? sii_mb0_addr_r[4:0] : ipcc_ildq_wr_addr4[4:0];
assign   ipcc_ildq_wr_addr5_m[4:0] = sii_mb0_run_r ? sii_mb0_addr_r[4:0] : ipcc_ildq_wr_addr5[4:0];
assign   ipcc_ildq_wr_addr6_m[4:0] = sii_mb0_run_r ? sii_mb0_addr_r[4:0] : ipcc_ildq_wr_addr6[4:0];
assign   ipcc_ildq_wr_addr7_m[4:0] = sii_mb0_run_r ? sii_mb0_addr_r[4:0] : ipcc_ildq_wr_addr7[4:0];
assign   ipcc_ildq_wr_en0_m 	   = sii_mb0_run_r ? sii_mb0_wr_en_r 	 : ipcc_ildq_wr_en0;
assign   ipcc_ildq_wr_en1_m 	   = sii_mb0_run_r ? sii_mb0_wr_en_r 	 : ipcc_ildq_wr_en1;
assign   ipcc_ildq_wr_en2_m 	   = sii_mb0_run_r ? sii_mb0_wr_en_r 	 : ipcc_ildq_wr_en2;
assign   ipcc_ildq_wr_en3_m 	   = sii_mb0_run_r ? sii_mb0_wr_en_r 	 : ipcc_ildq_wr_en3;
assign   ipcc_ildq_wr_en4_m 	   = sii_mb0_run_r ? sii_mb0_wr_en_r 	 : ipcc_ildq_wr_en4;
assign   ipcc_ildq_wr_en5_m 	   = sii_mb0_run_r ? sii_mb0_wr_en_r 	 : ipcc_ildq_wr_en5;
assign   ipcc_ildq_wr_en6_m 	   = sii_mb0_run_r ? sii_mb0_wr_en_r 	 : ipcc_ildq_wr_en6;
assign   ipcc_ildq_wr_en7_m 	   = sii_mb0_run_r ? sii_mb0_wr_en_r 	 : ipcc_ildq_wr_en7;

//------------  reading from all other ipd hdr and data memory-----------
assign   ipcc_ipdohq0_rd_en_m 	   = sii_mb1_run_r ? sii_mb1_ipdohq0_rd_en_r : ipdohq0_rd_en;
assign   ipcc_ipdbhq0_rd_en_m 	   = sii_mb1_run_r ? sii_mb1_ipdbhq0_rd_en_r : ipdbhq0_rd_en;
assign   ipcc_ipdodq0_rd_en_m 	   = sii_mb1_run_r ? sii_mb1_ipdodq0_rd_en_r : ipdodq0_rd_en;
assign   ipcc_ipdbdq0_rd_en_m 	   = sii_mb1_run_r ? sii_mb1_ipdbdq0_rd_en_r : ipdbdq0_rd_en;

assign	 ipdohq0_rd_en		   = (ipcs_ipdohq0_wr_addr_sync[3:0] == ipcc_ipdohq0_rd_addr[3:0]) && ipcs_ipdohq0_wr_en_sync ? 1'b0 : 1'b1; 
assign	 ipdbhq0_rd_en		   = (ipcs_ipdbhq0_wr_addr_sync[3:0] == ipcc_ipdbhq0_rd_addr[3:0]) && ipcs_ipdbhq0_wr_en_sync ? 1'b0 : 1'b1; 
assign	 ipdodq0_rd_en		   = (ipcs_ipdodq0_wr_addr_sync[5:0] == ipcc_ipdodq0_rd_addr[5:0]) && ipcs_ipdodq0_wr_en_sync ? 1'b0 : 1'b1; 
assign	 ipdbdq0_rd_en		   = (ipcs_ipdbdq0_wr_addr_sync[5:0] == ipcc_ipdbdq0_rd_addr[5:0]) && ipcs_ipdbdq0_wr_en_sync ? 1'b0 : 1'b1; 

assign   ipcc_ipdohq1_rd_en_m 	   = sii_mb1_run_r ? sii_mb1_ipdohq1_rd_en_r : ipdohq1_rd_en;
assign   ipcc_ipdbhq1_rd_en_m 	   = sii_mb1_run_r ? sii_mb1_ipdbhq1_rd_en_r : ipdbhq1_rd_en;
assign   ipcc_ipdodq1_rd_en_m 	   = sii_mb1_run_r ? sii_mb1_ipdodq1_rd_en_r : ipdodq1_rd_en;
assign   ipcc_ipdbdq1_rd_en_m 	   = sii_mb1_run_r ? sii_mb1_ipdbdq1_rd_en_r : ipdbdq1_rd_en;

assign	 ipdohq1_rd_en		   = (ipcs_ipdohq1_wr_addr_sync[3:0] == ipcc_ipdohq1_rd_addr[3:0]) && ipcs_ipdohq1_wr_en_sync ? 1'b0 : 1'b1; 
assign	 ipdbhq1_rd_en		   = (ipcs_ipdbhq1_wr_addr_sync[3:0] == ipcc_ipdbhq1_rd_addr[3:0]) && ipcs_ipdbhq1_wr_en_sync ? 1'b0 : 1'b1; 
assign	 ipdodq1_rd_en		   = (ipcs_ipdodq1_wr_addr_sync[5:0] == ipcc_ipdodq1_rd_addr[5:0]) && ipcs_ipdodq1_wr_en_sync ? 1'b0 : 1'b1; 
assign	 ipdbdq1_rd_en		   = (ipcs_ipdbdq1_wr_addr_sync[5:0] == ipcc_ipdbdq1_rd_addr[5:0]) && ipcs_ipdbdq1_wr_en_sync ? 1'b0 : 1'b1; 

assign   ipcc_ipdohq0_rd_addr_m[3:0] 	   = sii_mb1_run_r ? sii_mb1_addr_r[3:0] : ipcc_ipdohq0_rd_addr[3:0];
assign   ipcc_ipdbhq0_rd_addr_m[3:0] 	   = sii_mb1_run_r ? sii_mb1_addr_r[3:0] : ipcc_ipdbhq0_rd_addr[3:0];
assign   ipcc_ipdodq0_rd_addr_m[5:0] 	   = sii_mb1_run_r ? sii_mb1_addr_r[5:0] : ipcc_ipdodq0_rd_addr[5:0];
assign   ipcc_ipdbdq0_rd_addr_m[5:0] 	   = sii_mb1_run_r ? sii_mb1_addr_r[5:0] : ipcc_ipdbdq0_rd_addr[5:0];

assign   ipcc_ipdohq1_rd_addr_m[3:0] 	   = sii_mb1_run_r ? sii_mb1_addr_r[3:0] : ipcc_ipdohq1_rd_addr[3:0];
assign   ipcc_ipdbhq1_rd_addr_m[3:0] 	   = sii_mb1_run_r ? sii_mb1_addr_r[3:0] : ipcc_ipdbhq1_rd_addr[3:0];
assign   ipcc_ipdodq1_rd_addr_m[5:0] 	   = sii_mb1_run_r ? sii_mb1_addr_r[5:0] : ipcc_ipdodq1_rd_addr[5:0];
assign   ipcc_ipdbdq1_rd_addr_m[5:0] 	   = sii_mb1_run_r ? sii_mb1_addr_r[5:0] : ipcc_ipdbdq1_rd_addr[5:0];

assign 	 gnt0_r_m[4:0] 		   = sii_mb1_run_r ? {1'b0, sii_mb1_1of4ipd_sel[3:0]}  : gnt0_r[4:0]; 
//************************************************************************
// STATE DEFINITION 
//************************************************************************

`define		START_ST		14'b00000000000001
`define		DEC_ST			14'b00000000000010
`define		ARB_ST			14'b00000000000100
`define		HDR_ST			14'b00000000001000
`define		HDRDLY_ST		14'b00000000010000
`define		DATA1_ST		14'b00000000100000
`define		DATA2_ST		14'b00000001000000
`define		DATA3_ST		14'b00000010000000
`define		DATA4_ST		14'b00000100000000
`define		DATA5_ST		14'b00001000000000
`define		DATA6_ST		14'b00010000000000
`define		DATA7_ST		14'b00100000000000
`define		DATA8_ST		14'b01000000000000
`define  	RDDW_ST			14'b10000000000000

`define		START		 	0
`define		DEC		 	1
`define		ARB		 	2
`define		HDR		 	3
`define		HDRDLY		 	4
`define		DATA1		 	5
`define		DATA2		 	6	
`define		DATA3		 	7
`define		DATA4		 	8
`define		DATA5		 	9
`define		DATA6		 	10
`define		DATA7		 	11
`define		DATA8		 	12
`define		RDDW		 	13

`define		TCUU		 	4	
`define		DMU_O		 	3
`define		DMU_B		 	2
`define		NIU_O		 	1
`define		NIU_B		 	0

reg [13:0]	nstate_r;

wire [13:0]	nstate;
wire [13:0]	cstate;

// ------- internal signals --------
reg 		dmu_or_l2go;
reg 		dmu_by_l2go;
reg 		niu_or_l2go;
reg 		niu_by_l2go;

reg 		dmu_or_dep;	// dependecy bit of a dmu order queue top entry
reg 		dmu_by_dep;
reg 		niu_or_dep;
reg 		niu_by_dep;


//************************************************************************
//			OUTPUT LOGICS 
//************************************************************************

assign array_wr_inhibit = array_wr_inhibit_cmp & array_wr_inhibit_io;

//------------	signal to indicate start of header  ----------------
// curhdr[6:4] is the bank number
assign 	ipcc_ilc_cmd0_l = cstate[`HDRDLY] && l2_io && (curbank_r[2:0] == 3'b000);
assign  ipcc_ilc_cmd1_l = cstate[`HDRDLY] && l2_io && (curbank_r[2:0] == 3'b001);
assign  ipcc_ilc_cmd2_l = cstate[`HDRDLY] && l2_io && (curbank_r[2:0] == 3'b010);
assign  ipcc_ilc_cmd3_l = cstate[`HDRDLY] && l2_io && (curbank_r[2:0] == 3'b011);
assign  ipcc_ilc_cmd4_l = cstate[`HDRDLY] && l2_io && (curbank_r[2:0] == 3'b100);
assign 	ipcc_ilc_cmd5_l = cstate[`HDRDLY] && l2_io && (curbank_r[2:0] == 3'b101);
assign  ipcc_ilc_cmd6_l = cstate[`HDRDLY] && l2_io && (curbank_r[2:0] == 3'b110);
assign  ipcc_ilc_cmd7_l = cstate[`HDRDLY] && l2_io && (curbank_r[2:0] == 3'b111);

// after sync ff they become ipcc_ipcs_dmu_or_go, ipcc_ipcs_dmu_by_go
// the or_dq, by_dq is the actual time the header + data has been dequeue from ipcc
// while or_go and by_go is when the header is dispatched from the ipd header queue

assign	dmu_tag_en = (dmu_or_dq || dmu_by_dq) & dma_wr;
assign 	dmu_tag_en_lv = dmu_tag_en ^ ipcc_ipcs_wrack_lv_pre;
assign 	dmu_or_dq = gnt_r[`DMU_O] && ((cstate[`HDRDLY] && l2_io && rd_wr) || 
			cstate[`DATA4] || (cstate[`DATA1] && ~dma_wr)); 
assign 	dmu_by_dq = gnt_r[`DMU_B] && ((cstate[`HDRDLY] && l2_io && rd_wr) || 
			cstate[`DATA4] || (cstate[`DATA1] && ~dma_wr)); 
assign 	niu_or_dq = gnt_r[`NIU_O] && ((cstate[`HDRDLY] && l2_io && rd_wr) || 
			cstate[`DATA4] || (cstate[`DATA1] && ~dma_wr)); 
assign 	niu_by_dq = gnt_r[`NIU_B] && ((cstate[`HDRDLY]  && l2_io && rd_wr)|| 
			cstate[`DATA4] || (cstate[`DATA1] && ~dma_wr)); 

// Cross clock domain from fast clock to slow clock, create and level change whenever
// there is a pulse in dequeue signals
assign  dmu_or_dq_lv = ipcc_ipcs_dmu_or_go_lv_pre ^ dmu_or_go_pulse;
assign  dmu_by_dq_lv = ipcc_ipcs_dmu_by_go_lv_pre ^ dmu_by_go_pulse;
assign  niu_or_dq_lv = ipcc_ipcs_niu_or_go_lv_pre ^ niu_or_go_pulse;
assign  niu_by_dq_lv = ipcc_ipcs_niu_by_go_lv_pre ^ niu_by_go_pulse;

//-------------------------------------------------------------
//  Interface signals going to IPCC data paths
//-------------------------------------------------------------

always @ (gnt0_r_m[3:0] or high_lo)
case (1'b1)				//synopsys parallel_case
	gnt0_r_m[`DMU_O]	: data_sel[2:0] = {2'b11, high_lo};	
	gnt0_r_m[`DMU_B]	: data_sel[2:0] = {2'b10, high_lo};	
	gnt0_r_m[`NIU_O]	: data_sel[2:0] = {2'b01, high_lo};	
	gnt0_r_m[`NIU_B]	: data_sel[2:0] = {2'b00, high_lo};	
	default			: data_sel[2:0] = {2'b00, high_lo};
endcase
assign  high_lo		=  sii_mb1_run_r ?  sii_mb1_ipd_data_hibits_sel :
			   (cstate[`HDRDLY] || cstate[`DATA2] ||
                           cstate[`DATA4] || cstate[`DATA6]); 
assign	hdr_data_sel	=  sii_mb1_run_r ? sii_mb1_ipd_data_or_hdr_sel : cstate[`HDRDLY];

//--------------------------going to register file ild -----------------------------------
assign 	ipcc_ildq_wr_addr0_l[4:0]	= ipcc_ildq_wr_en0 ? 
					 ipcc_ildq_wr_addr0[4:0] + 5'h01 : 
					  ipcc_ildq_wr_addr0[4:0];
assign 	ipcc_ildq_wr_addr1_l[4:0]	= ipcc_ildq_wr_en1 ? 
					 ipcc_ildq_wr_addr1[4:0] + 5'h01 : 
					  ipcc_ildq_wr_addr1[4:0];
assign 	ipcc_ildq_wr_addr2_l[4:0]	= ipcc_ildq_wr_en2 ? 
					 ipcc_ildq_wr_addr2[4:0] + 5'h01 : 
					  ipcc_ildq_wr_addr2[4:0];
assign 	ipcc_ildq_wr_addr3_l[4:0]	= ipcc_ildq_wr_en3 ? 
					 ipcc_ildq_wr_addr3[4:0] + 5'h01 : 
					  ipcc_ildq_wr_addr3[4:0];
assign 	ipcc_ildq_wr_addr4_l[4:0]	= ipcc_ildq_wr_en4 ? 
					 ipcc_ildq_wr_addr4[4:0] + 5'h01 : 
					  ipcc_ildq_wr_addr4[4:0];
assign 	ipcc_ildq_wr_addr5_l[4:0]	= ipcc_ildq_wr_en5 ? 
					 ipcc_ildq_wr_addr5[4:0] + 5'h01 : 
					  ipcc_ildq_wr_addr5[4:0];
assign 	ipcc_ildq_wr_addr6_l[4:0]	= ipcc_ildq_wr_en6 ? 
					 ipcc_ildq_wr_addr6[4:0] + 5'h01 : 
					  ipcc_ildq_wr_addr6[4:0];
assign 	ipcc_ildq_wr_addr7_l[4:0]	= ipcc_ildq_wr_en7 ? 
					 ipcc_ildq_wr_addr7[4:0] + 5'h01 : 
					  ipcc_ildq_wr_addr7[4:0];

assign  ipcc_ildq_wr_en0_l	= (curbank_r[2:0] == 3'b000) && dma_wr_r && (cstate[`DATA1] ||
                                          cstate[`DATA2] || cstate[`DATA3] ||
                                          cstate[`DATA4] || cstate[`DATA5] || cstate[`DATA6]
                                          || cstate[`DATA7] || cstate[`DATA8]) ;
assign  ipcc_ildq_wr_en1_l	= (curbank_r[2:0] == 3'b001) && dma_wr_r && (cstate[`DATA1] ||
                                          cstate[`DATA2] || cstate[`DATA3] ||
                                          cstate[`DATA4] || cstate[`DATA5] || cstate[`DATA6]
                                          || cstate[`DATA7] || cstate[`DATA8]) ;
assign  ipcc_ildq_wr_en2_l	= (curbank_r[2:0] == 3'b010) && dma_wr_r && (cstate[`DATA1] ||
                                          cstate[`DATA2] || cstate[`DATA3] ||
                                          cstate[`DATA4] || cstate[`DATA5] || cstate[`DATA6]
                                          || cstate[`DATA7] || cstate[`DATA8]) ;
assign  ipcc_ildq_wr_en3_l	= (curbank_r[2:0] == 3'b011) && dma_wr_r && (cstate[`DATA1] ||
                                          cstate[`DATA2] || cstate[`DATA3] ||
                                          cstate[`DATA4] || cstate[`DATA5] || cstate[`DATA6]
                                          || cstate[`DATA7] || cstate[`DATA8]) ;
assign  ipcc_ildq_wr_en4_l	= (curbank_r[2:0] == 3'b100) && dma_wr_r &&(cstate[`DATA1] ||
                                          cstate[`DATA2] || cstate[`DATA3] ||
                                          cstate[`DATA4] || cstate[`DATA5] || cstate[`DATA6]
                                          || cstate[`DATA7] || cstate[`DATA8]) ;
assign  ipcc_ildq_wr_en5_l	= (curbank_r[2:0] == 3'b101) && dma_wr_r &&(cstate[`DATA1] ||
                                          cstate[`DATA2] || cstate[`DATA3] ||
                                          cstate[`DATA4] || cstate[`DATA5] || cstate[`DATA6]
                                          || cstate[`DATA7] || cstate[`DATA8]) ;
assign  ipcc_ildq_wr_en6_l	= (curbank_r[2:0] == 3'b110) && dma_wr_r &&(cstate[`DATA1] ||
                                          cstate[`DATA2] || cstate[`DATA3] ||
                                          cstate[`DATA4] || cstate[`DATA5] || cstate[`DATA6]
                                          || cstate[`DATA7] || cstate[`DATA8]) ;
assign  ipcc_ildq_wr_en7_l	= (curbank_r[2:0] == 3'b111) && dma_wr_r &&(cstate[`DATA1] ||
                                          cstate[`DATA2] || cstate[`DATA3] ||
                                          cstate[`DATA4] || cstate[`DATA5] || cstate[`DATA6]
                                          || cstate[`DATA7] || cstate[`DATA8]) ;

//-------------------------------------------------------------
//      JTAG ACCESS OF L2 BANKS
//-------------------------------------------------------------

assign tcu_go_l         	= (tcu_rcv_end_r & ~dmu_wrm_mode) ? 1'b1 : gnt_r[4] && cstate[`HDR] ? 1'b0 : tcu_go_hld;
                                   // fix for bug # 118179, dont assert tcu_go if dmu_wrm in progress
assign tcu_rcv_end_hld = tcu_rcv_end ? 1'b1 : ((~dmu_wrm_mode) | (gnt_r[4] && cstate[`HDR])) ? 1'b0 : tcu_rcv_end_r;
                                   // fix for bug # 118179, dont assert tcu_go if dmu_wrm in progress
assign one_stop         =         ilc_ipcc_stop0 | ilc_ipcc_stop1 |  ilc_ipcc_stop2 |
                                  ilc_ipcc_stop3 | ilc_ipcc_stop4  | ilc_ipcc_stop5 |
                                  ilc_ipcc_stop6 | ilc_ipcc_stop7 |
                                  inc_ipcc_stop;
assign tcu_go                   = tcu_go_hld & ~one_stop; // fix for bug 118690, dont assert tcu_go if any of the ild fifos are
                                                          // full
assign tcu_txfr_start_l 	= tcu_sii_vld_r ? 1'b1 : tcu_rcv_end ? 1'b0:
                          	tcu_txfr_start_r;
assign tcu_rcv_cnt_l[7:0] 	= tcu_txfr_start_r || tcu_sii_vld_r ? tcu_rcv_cnt[7:0] + 8'h01 : 8'h00;
assign tcu_rcv_end     		= tcu_rcv_cnt[7];
assign tcu_serial_data_l[127:0] = tcu_txfr_start_l ? {tcu_sii_data_r, tcu_serial_data[127:1]} 
					: tcu_serial_data[127:0];

//-------------------------------
// Compose header
//-------------------------------
assign tcu_a_parity[1:0] = 2'b00;
assign tcu_cmd_parity    = 1'b0;
assign tcu_ctag_ecc[5:0] = 6'h00;
assign intr_for_tcu      = 1'b0;
assign l2_io_tcu         = 1'b1;
assign tcu_posted      	 = 1'b0;
assign tcu_id[15:0]	 = 16'h0000;
assign tcu_dma_err[2:0]	 = 3'b000;
assign tcu_d_parity[3:0] = 4'h0;

//-----------------------------------
// Compose received header and data
//-----------------------------------

assign tcu_rcv_hdr[63:0] = tcu_serial_data[63:0];
assign tcu_data[63:0]    = tcu_serial_data[127:64];

assign addr_on 		= cstate[`HDRDLY] && (tcu_rcv_hdr[5:3] == 3'b000) ||
			  cstate[`DATA1]  && (tcu_rcv_hdr[5:3] == 3'b001) ||
			  cstate[`DATA2]  && (tcu_rcv_hdr[5:3] == 3'b010) ||
			  cstate[`DATA3]  && (tcu_rcv_hdr[5:3] == 3'b011) ||
			  cstate[`DATA4]  && (tcu_rcv_hdr[5:3] == 3'b100) ||
			  cstate[`DATA5]  && (tcu_rcv_hdr[5:3] == 3'b101) ||
			  cstate[`DATA6]  && (tcu_rcv_hdr[5:3] == 3'b110) ||
			  cstate[`DATA7]  && (tcu_rcv_hdr[5:3] == 3'b111) ;

assign tcu_be_par[11:0] = addr_on ? {8'hff, tcu_d_parity[3:0]} : {8'h00, tcu_d_parity[3:0]};


assign tcu_hdr[71:0]    = {tcu_ctag_ecc[5:0], tcu_a_parity[1:0], tcu_cmd_parity, intr_for_tcu, tcu_rcv_hdr[58:56],
                           l2_io_tcu , tcu_posted, tcu_id[15:0], tcu_dma_err[2:0], tcu_rcv_hdr[39:3], 1'b0};


//assign tcu_parity[3]    = tcu_data[63] ^ tcu_data[61] ^ tcu_data[59] ^ tcu_data[57] ^ tcu_data[55] ^ tcu_data[53]
//                         ^tcu_data[51] ^ tcu_data[49] ^ tcu_data[47] ^ tcu_data[45] ^ tcu_data[43] ^ tcu_data[41]
//                         ^tcu_data[39] ^ tcu_data[37] ^ tcu_data[35] ^ ~tcu_data[33] ;

//assign tcu_parity[2]    = tcu_data[62] ^ tcu_data[60] ^ tcu_data[58] ^ tcu_data[56] ^ tcu_data[54] ^ tcu_data[52]
//                         ^tcu_data[50] ^ tcu_data[48] ^ tcu_data[46] ^ tcu_data[44] ^ tcu_data[42] ^ tcu_data[40]
//                         ^tcu_data[38] ^ tcu_data[36] ^ tcu_data[34] ^ ~tcu_data[32] ;

//assign tcu_parity[1]    = tcu_data[31] ^ tcu_data[29] ^ tcu_data[27] ^ tcu_data[25] ^ tcu_data[23] ^ tcu_data[21]
//                         ^tcu_data[19] ^ tcu_data[17] ^ tcu_data[15] ^ tcu_data[13] ^ tcu_data[11] ^ tcu_data[9]
//                         ^tcu_data[7] ^ tcu_data[5] ^ tcu_data[3] ^ ~tcu_data[1] ;

//assign tcu_parity[0]    = tcu_data[30] ^ tcu_data[28] ^ tcu_data[26] ^ tcu_data[24] ^ tcu_data[22] ^ tcu_data[20]
//                         ^tcu_data[18] ^ tcu_data[16] ^ tcu_data[14] ^ tcu_data[12] ^ tcu_data[10] ^ tcu_data[8]
//                         ^tcu_data[6] ^ tcu_data[4] ^ tcu_data[2] ^ ~tcu_data[0] ;

//---------------------------------------------------------------
//    			ERROR REPORT TO NCU
//---------------------------------------------------------------

 assign  err_sig_l[5:0]  = cstate[`START] && ~sending_r ? 6'h00 : {niud_pe_l, niua_pe_l,  niuctag_ue_l,
                          dmud_pe_l, dmua_pe_l,  dmuctag_ue_l};

 assign  sending_l       = trigger_synd ? 1'b1 : (send_cnt_l[6] && ~send_cnt_r[6]) ? 1'b0 : sending_r;
 assign  send_cnt_l[6:0] = send_cnt_r[6] ? 7'h00 : sending_r ? send_cnt_r[6:0] + 7'h01 : send_cnt_r[6:0];

 assign  trigger_synd    = ~sending_r && ( cstate[`RDDW] || cstate[`DATA8] || (cstate[`DATA1] || data_phase))
                         && (| err_sig_r[5:0]);

 assign  syndrome_l[63:0]  =  trigger_synd ? { 2'b00, err_sig_r[5:0], err_ctag_pa_r[55:0]} : cmp_io_sync_en ?
                             {4'b0,syndrome_r[63:4]} : syndrome_r[63:0] ;

 assign  sii_ncu_syn_data_l[3:0]    = sending_r ? syndrome_r[3:0] : 4'b0;
 assign  sii_ncu_syn_vld_l     = sending_r;

 assign  ipcc_ipcs_dmu_wrack_p_l = ~(^ id[14:11]);

 // when data errors happened to packet going to ncu, no error reported
 assign  dmuctag_ue_l  = ( (ctag_ecc_ue || cmd_parity_err ) && cur_source) ? 1'b1 : cmp_io_sync_en ? 1'b0     : dmuctag_ue_r;
 assign  dmuctag_ce_l  = ( ctag_ecc_ce && cur_source) ? 1'b1 : cmp_io_sync_en ? 1'b0     : dmuctag_ce_r;
 assign  dmua_pe_l     = ( addr_parity_err && cur_source) ? 1'b1 : cmp_io_sync_en ? 1'b0 :   dmua_pe_r;
 assign  dmud_pe_l     = ( data_parity_err && l2_io && cur_source) ? 1'b1 : cmp_io_sync_en ? 1'b0 : dmud_pe_r; 

 assign  niuctag_ue_l  = ( (ctag_ecc_ue || cmd_parity_err ) && ~cur_source) ? 1'b1 : cmp_io_sync_en ? 1'b0 : niuctag_ue_r;
 assign  niuctag_ce_l  = (ctag_ecc_ce && ~cur_source) ? 1'b1 : cmp_io_sync_en ? 1'b0 : niuctag_ce_r;
 assign  niua_pe_l     = (addr_parity_err && ~cur_source) ? 1'b1 : cmp_io_sync_en ? 1'b0 : niua_pe_r;
 assign  niud_pe_l     = (data_parity_err && l2_io && ~cur_source) ? 1'b1 : cmp_io_sync_en ? 1'b0 : niud_pe_r;

//-----------------------------------------------------------------
//              ECC AND PARITY CHECK
//-----------------------------------------------------------------
assign  data_phase	 = cstate[`DATA1] || cstate[`DATA2] || cstate[`DATA3] || 
			   cstate[`DATA4] || cstate[`DATA5] || cstate[`DATA6] || 
			   cstate[`DATA7] || cstate[`DATA8] ;
assign  data_parity_err  = jtag ? 1'b0 : ~wrm & data_phase & (~data_odd_h || ~data_even_h || ~data_odd_l 
				|| ~data_even_l || be_parity_err );
assign  newdata[67:0]    = ipcc_dp_par_data[67:0];
assign  be[15:0]    	 = ipcc_dp_par_data[83:68];
assign  be_parity    	 = ipcc_dp_par_data[84];

assign  data_odd_h  = newdata[67] ^ newdata[63]^ newdata[61]^ newdata[59]^ newdata[57]^ newdata[55]^
                            newdata[53]^ newdata[51]^ newdata[49]^ newdata[47]^ newdata[45]^
                            newdata[43]^ newdata[41]^ newdata[39]^ newdata[37]^ newdata[35]^ newdata[33];

assign  data_even_h = newdata[66] ^ newdata[62]^ newdata[60]^ newdata[58]^ newdata[56]^ newdata[54]^
                             newdata[52]^ newdata[50]^ newdata[48]^ newdata[46]^ newdata[44]^
                             newdata[42]^ newdata[40]^ newdata[38]^ newdata[36]^ newdata[34]^ newdata[32];

assign  data_odd_l  = newdata[65] ^ newdata[31]^ newdata[29]^ newdata[27]^ newdata[25]^ newdata[23]^
                            newdata[21]^ newdata[19]^ newdata[17]^ newdata[15]^ newdata[13]^
                            newdata[11]^ newdata[9]^  newdata[7]^  newdata[5]^ newdata[3]^ newdata[1];

assign  data_even_l = newdata[64] ^ newdata[30]^ newdata[28]^ newdata[26]^ newdata[24]^ newdata[22]^
                            newdata[20]^ newdata[18]^ newdata[16]^ newdata[14]^ newdata[12]^
                            newdata[10]^ newdata[8]^  newdata[6]^  newdata[4]^ newdata[2]^ newdata[0];

assign  be_parity_err   = ~  be[15] ^ be[14] ^ be[13] ^ be[12] ^ be[11] ^ be[10] ^ be[9] ^ be[8]
			  ^ be[7] ^ be[6] ^ be[5] ^  be[4] ^ be[3] ^ be[2] ^ be[1] ^ be[0]
			  ^ be_parity && wrm;  
 

//--------------------------going to register file indq-------------------------------------

assign	ipcc_indq_wr_addr[5:0]   = sii_mb0_run_r ? sii_mb0_addr_r[5:0] : ipcc_indq_wr_addr_r[5:0];
assign	ipcc_indq_wr_addr_l[5:0] = ipcc_indq_wr_en_r ? (ipcc_indq_wr_addr_r[5:0] == 6'd47) ? 6'h0 :
				   (ipcc_indq_wr_addr_r[5:0] + 6'h01) : ipcc_indq_wr_addr_r[5:0] ;

assign	ipcc_indq_wr_en   	 = sii_mb0_run_r ? sii_mb0_ind_wr_en_r : ipcc_indq_wr_en_r;
assign 	ipcc_indq_wr_en_l   	 = ~l2_io_r && ((cstate[`HDR] ) || cstate[`HDRDLY]
					 || cstate[`DATA1]) ? 1'b1 : 1'b0;	
assign  ipcc_inc_wr_ovfl_l    	 = ((ipcc_indq_wr_addr_r[5:0] == 6'd47) && ipcc_indq_wr_en_r)
				      ? ~ipcc_inc_wr_ovfl : ipcc_inc_wr_ovfl;       
//--------------------------reading from ipdhq, ipddq-------------------------------------
//--DMU--
assign	dmu_or_go_pulse		= ((cstate[`HDRDLY] && ~l2_io) || (cstate[`HDR] && rd_wr)
                                        || (cstate[`DATA5] && dma_wr)) && gnt_r[`DMU_O];
assign 	ipcc_ipdohq0_rd_addr_l[3:0] = dmu_or_go_pulse ?
				(ipcc_ipdohq0_rd_addr[3:0] + 4'b0001) : ipcc_ipdohq0_rd_addr;   

assign	dmu_by_go_pulse		= ((cstate[`HDRDLY] && ~l2_io) || (cstate[`HDR] && rd_wr )
                                        || (cstate[`DATA5] && dma_wr)) && gnt_r[`DMU_B];
assign 	ipcc_ipdbhq0_rd_addr_l[3:0] = dmu_by_go_pulse ?
				(ipcc_ipdbhq0_rd_addr[3:0] + 4'b0001) : ipcc_ipdbhq0_rd_addr;

assign 	ipcc_ipdodq0_rd_addr_l[5:0] = gnt_r[`DMU_O] && ((~l2_io && cstate[`HDR]) || dma_wr_r  
			   && (cstate[`HDR] || cstate[`DATA1] || cstate[`DATA3] || cstate[`DATA5])) ? 
				(ipcc_ipdodq0_rd_addr[5:0] +
				      6'h01) : ipcc_ipdodq0_rd_addr[5:0];   

assign 	ipcc_ipdbdq0_rd_addr_l[5:0] = gnt_r[`DMU_B] && ((~l2_io && cstate[`HDR]) || dma_wr_r  
                           && (cstate[`HDR] || cstate[`DATA1] || cstate[`DATA3] || cstate[`DATA5])) ? 
				(ipcc_ipdbdq0_rd_addr[5:0] + 6'h01)
                                       : ipcc_ipdbdq0_rd_addr[5:0];
//--NIU--
assign  niu_or_go_pulse		= ((cstate[`HDRDLY] && ~l2_io) || (cstate[`HDR] && rd_wr)
                                        || (cstate[`DATA5] && dma_wr)) && gnt_r[`NIU_O]; 	
assign 	ipcc_ipdohq1_rd_addr_l[3:0] = niu_or_go_pulse ? 
                                (ipcc_ipdohq1_rd_addr[3:0] + 4'b0001) : ipcc_ipdohq1_rd_addr;

assign  niu_by_go_pulse		=  ((cstate[`HDRDLY] && ~l2_io) || (cstate[`HDR] && rd_wr)
                                        || (cstate[`DATA5] && dma_wr)) && gnt_r[`NIU_B];
assign 	ipcc_ipdbhq1_rd_addr_l[3:0] =  niu_by_go_pulse ?
                                (ipcc_ipdbhq1_rd_addr[3:0] + 4'b0001) : ipcc_ipdbhq1_rd_addr;

assign 	ipcc_ipdodq1_rd_addr_l[5:0] =  gnt_r[`NIU_O] && ((~l2_io && cstate[`HDR]) || dma_wr_r  
                           && (cstate[`HDR] || cstate[`DATA1] || cstate[`DATA3] || cstate[`DATA5])) ? 
				(ipcc_ipdodq1_rd_addr[5:0] +
                                      6'h01) : ipcc_ipdodq1_rd_addr[5:0];

assign 	ipcc_ipdbdq1_rd_addr_l[5:0] =  gnt_r[`NIU_B] && ((~l2_io && cstate[`HDR]) || dma_wr_r 
                           && (cstate[`HDR] ||  cstate[`DATA1] || cstate[`DATA3] || cstate[`DATA5])) ? 
				(ipcc_ipdbdq1_rd_addr[5:0] +
                                      6'h01) : ipcc_ipdbdq1_rd_addr[5:0];
			  
//************************************************************************
//		INTERNAL WIRES ASSIGNMENTS	
//************************************************************************
//-------------------------------------------------------------
//			arbitration logics  
//-------------------------------------------------------------
assign  gnt_l[4:0]      = arb1_r[1] ? ( tcu_go ? 5'b10000 :
                                        ((arb2_dmu_l) ?
                                        (dmu_or_go ? 5'b01000 : dmu_by_go ? 5'b00100 :
                                        (arb2_niu_l ? (niu_or_go ? 5'b00010 : niu_by_go ?
                                                        5'b00001 : 5'b00000 ) :
                                                     (niu_by_go ? 5'b00001 : niu_or_go ?
                                                        5'b00010 : 5'b00000))) :
                                        (dmu_by_go ? 5'b00100 : dmu_or_go ? 5'b01000 :
                                        (arb2_niu_l ? (niu_or_go ? 5'b00010 : niu_by_go ?
                                                        5'b00001 : 5'b00000 ) :
                                                     (niu_by_go ? 5'b00001 : niu_or_go ?
                                                        5'b00010 : 5'b00000)))))  :
                        (arb1_r[0] ) ? ((arb2_dmu_l) ?
                                        (dmu_or_go ? 5'b01000 : dmu_by_go ? 5'b00100 :
                                        (arb2_niu_l ? (niu_or_go ? 5'b00010 : niu_by_go ?
                                                        5'b00001 : 
							tcu_go ? 5'b10000 : 5'b00000 ) :
                                                     (niu_by_go ? 5'b00001 : niu_or_go ?
                                                        5'b00010 : 
							tcu_go ? 5'b10000 : 5'b00000))) :
                                        (dmu_by_go ? 5'b00100 : dmu_or_go ? 5'b01000 :
                                        (arb2_niu_l ? (niu_or_go ? 5'b00010 : niu_by_go ?
                                                        5'b00001 : 
							tcu_go ? 5'b10000 : 5'b00000 ) :
                                                     (niu_by_go ? 5'b00001 : niu_or_go ?
                                                        5'b00010 : 
							tcu_go ? 5'b10000 : 5'b00000)))  ) :
                                     ((arb2_niu_l) ?
                                        (niu_or_go ? 5'b00010 : niu_by_go ? 5'b00001 :
                                        (arb2_dmu_l ? (dmu_or_go ? 5'b01000 : dmu_by_go ?
                                                        5'b00100 : 
							tcu_go ? 5'b10000 : 5'b00000) :
                                                      (dmu_by_go ? 5'b00100 : dmu_or_go ?
                                                        5'b01000 : 
							tcu_go ? 5'b10000 : 5'b00000))) :
                                        (niu_by_go ? 5'b00001 : niu_or_go ? 5'b00010 :
                                        (arb2_dmu_l ? (dmu_or_go ? 5'b01000 : dmu_by_go ?
                                                        5'b00100 : 
							tcu_go ? 5'b10000 : 5'b00000) :
                                                      (dmu_by_go ? 5'b00100 : dmu_or_go ?
                                                        5'b01000 : 
							tcu_go ? 5'b10000 : 5'b00000))) );


assign  arb1_l[1:0]     =  (arb1_hist_r[1:0] == 2'b01) ? 2'b00 : 
			   (arb1_hist_r[1:0] == 2'b00) ? 2'b10 : 2'b01;    //01= dmu, 00=niu , 1x=tcu
assign  arb2_dmu_l	= ~dmu_hist_r;

//1= ord, 0=byp
assign  arb2_niu_l	= ~niu_hist_r;

assign	arb1_hist_l[1:0] = (gnt_r[`DMU_O] || gnt_r[`DMU_B]) ? 2'b01 : 	   //01=dmu, 00=niu, 1x=tcu
			  (gnt_r[`NIU_O] || gnt_r[`NIU_B]) ? 2'b00 :
			  (gnt_r[`TCUU]) ? 2'b10 : arb1_hist_r[1:0];
assign	dmu_hist_l 	= gnt_r[`DMU_O] ? 1'b1 : gnt_r[`DMU_B] ? 1'b0 : dmu_hist_r;
assign	niu_hist_l 	= gnt_r[`NIU_O] ? 1'b1 : gnt_r[`NIU_B] ? 1'b0 : niu_hist_r;

//-------------------------------------------------------------
//	Internal Signals assignment		
//-------------------------------------------------------------
assign 	all_fifo_empty 	= (dmu_or_cnt_r[4:0] == 5'h0 ) && (dmu_by_cnt_r[4:0] == 5'h0) &&
				 (niu_or_cnt_r[4:0] == 5'h0 ) && (niu_by_cnt_r[4:0] == 5'h0);
assign 	all_stop       	= ilc_ipcc_stop0 && ilc_ipcc_stop1 && ilc_ipcc_stop2 &&
			  ilc_ipcc_stop3 && ilc_ipcc_stop4 && ilc_ipcc_stop5 &&	
			  ilc_ipcc_stop6 && ilc_ipcc_stop7 && 
 			  inc_ipcc_stop;

assign  go	      	= dmu_or_go || dmu_by_go || niu_or_go || niu_by_go || tcu_go; 

assign	add_dmu_or	= io_cmp_sync_en && add_dmu_or_pre;
assign	add_dmu_by	= io_cmp_sync_en && add_dmu_by_pre;
assign	add_niu_or	= io_cmp_sync_en && add_niu_or_pre;
assign	add_niu_by	= io_cmp_sync_en && add_niu_by_pre;

assign  dmu_or_cnt_l[4:0] = (add_dmu_or && dmu_or_dq) ? dmu_or_cnt_r[4:0] :
			    add_dmu_or ? (dmu_or_cnt_r[4:0] + 5'b00001) :  
			    dmu_or_dq ? (dmu_or_cnt_r[4:0] - 5'b00001)
				 : dmu_or_cnt_r[4:0]; 		 
assign  dmu_by_cnt_l[4:0] = (add_dmu_by && dmu_by_dq) ? dmu_by_cnt_r[4:0] :
			    add_dmu_by ? (dmu_by_cnt_r[4:0] + 5'b00001) : 
                            dmu_by_dq ? (dmu_by_cnt_r[4:0] - 5'b00001)
				 : dmu_by_cnt_r[4:0];   
assign  niu_or_cnt_l[4:0] = (add_niu_or && niu_or_dq) ? niu_or_cnt_r[4:0] :
			    add_niu_or ? (niu_or_cnt_r[4:0] + 5'b00001) :  
                            niu_or_dq ? (niu_or_cnt_r[4:0] - 5'b00001) 
				: niu_or_cnt_r[4:0]; 
assign  niu_by_cnt_l[4:0] = (add_niu_by && niu_by_dq) ? niu_by_cnt_r[4:0] :
			    add_niu_by ? (niu_by_cnt_r[4:0] + 5'b00001) : 
                            niu_by_dq ? (niu_by_cnt_r[4:0] - 5'b00001) 
				: niu_by_cnt_r[4:0]; 


// need to include dependency, IO/L2 go, and count != 0, bit 58 = l2/io 
assign  dmu_or_go	= (dmu_or_cnt_r[4:0] != 5'h0) && ((ipdohq0_dout58 && dmu_or_l2go) ||
			  (~ipdohq0_dout58 && ~inc_ipcc_stop)) && dmu_or_dep_ok;	
assign  dmu_by_go	= (dmu_by_cnt_r[4:0] != 5'h0) && ((ipdbhq0_dout58 && dmu_by_l2go) ||
                          (~ipdbhq0_dout58 && ~inc_ipcc_stop)) && dmu_by_dep_ok;
assign  niu_or_go	= (niu_or_cnt_r[4:0] != 5'h0) && ((ipdohq1_dout58 && niu_or_l2go) ||
                          (~ipdohq1_dout58 && ~inc_ipcc_stop)) && niu_or_dep_ok;
assign  niu_by_go	= (niu_by_cnt_r[4:0] != 5'h0) && ((ipdbhq1_dout58 && niu_by_l2go) ||
                          (~ipdbhq1_dout58 && ~inc_ipcc_stop)) && niu_by_dep_ok;

// counter increment signals 
assign  dmu_or_wr_inc	= gnt_r[`DMU_O] && (dma_wr ) && cstate[`HDRDLY] ;
assign  dmu_by_wr_inc	= gnt_r[`DMU_B] && (dma_wr ) && cstate[`HDRDLY] ;
assign  niu_or_wr_inc	= gnt_r[`NIU_O] && (dma_wr ) && cstate[`HDRDLY] ;
assign  niu_by_wr_inc	= gnt_r[`NIU_B] && (dma_wr ) && cstate[`HDRDLY] ;

// counter decrement signals 
assign  dmu_or_deq	= ~dmu_wrm_mode && sio_sii_opcc_ipcc_dmu_or_deq_r
			   || dmu_wrm_end;
assign  niu_or_deq	= ~niu_wrm_mode && sio_sii_opcc_ipcc_niu_or_deq_r
			   || niu_wrm_end;

// a pulse to decrement the write counter
assign  dmu_wrm_end 	= ~dmu_wrm_mode && dmu_wrm_mode_r; 
assign  niu_wrm_end 	= ~niu_wrm_mode && niu_wrm_mode_r; 

assign  dmu_or_op[1:0] 	= {dmu_or_wr_inc, dmu_or_deq };
assign  dmu_by_op[1:0] 	= {dmu_by_wr_inc, sio_sii_opcc_ipcc_dmu_by_deq_r};
assign  niu_or_op[1:0] 	= {niu_or_wr_inc, niu_or_deq };
assign  niu_by_op[1:0] 	= {niu_by_wr_inc, sio_sii_opcc_ipcc_niu_by_deq_r};

assign  dmu_or_wr_full = & dmu_or_wr_cnt_r[1:0];
assign  dmu_or_wr_cnt_l[1:0] = (dmu_or_op == 2'b01) ? (dmu_or_wr_cnt_r[1:0] - 2'b01) :
			  (dmu_or_op == 2'b10) ? (dmu_or_wr_cnt_r[1:0] + 2'b01) :
			   dmu_or_wr_cnt_r[1:0];

always @ (dmu_by_op[1:0] or dmu_by_wr_cnt_r[3:0] or sio_sii_opcc_ipcc_dmu_by_cnt_r[3:0])

	case (dmu_by_op[1:0])
	2'b01	: dmu_by_wr_cnt_l[3:0] 	= dmu_by_wr_cnt_r[3:0] - sio_sii_opcc_ipcc_dmu_by_cnt_r[3:0];
	2'b10	: dmu_by_wr_cnt_l[3:0] 	= dmu_by_wr_cnt_r[3:0] + 4'b0001;
	2'b11	: dmu_by_wr_cnt_l[3:0] 	= dmu_by_wr_cnt_r[3:0] + 4'b0001 - 
					  sio_sii_opcc_ipcc_dmu_by_cnt_r[3:0];
	2'b00	: dmu_by_wr_cnt_l[3:0]  = dmu_by_wr_cnt_r[3:0];
	endcase
					 
assign  niu_or_wr_full = & niu_or_wr_cnt_r[1:0];
assign  niu_or_wr_cnt_l[1:0]  = (niu_or_op == 2'b01) ? (niu_or_wr_cnt_r[1:0] - 2'b01) :
			  (niu_or_op == 2'b10) ? (niu_or_wr_cnt_r[1:0] + 2'b01) :
			   niu_or_wr_cnt_r[1:0];

assign  niu_by_wr_full =  (niu_by_wr_cnt_r[3:0] == 4'b1000);

always @ (niu_by_op[1:0] or sio_sii_opcc_ipcc_niu_by_cnt_r[3:0] or niu_by_wr_cnt_r[3:0])

	case (niu_by_op[1:0])
	2'b01	: niu_by_wr_cnt_l[3:0] 	= niu_by_wr_cnt_r[3:0] - sio_sii_opcc_ipcc_niu_by_cnt_r[3:0];
	2'b10	: niu_by_wr_cnt_l[3:0] 	= niu_by_wr_cnt_r[3:0] + 4'b0001;
	2'b11	: niu_by_wr_cnt_l[3:0] 	= niu_by_wr_cnt_r[3:0] + 4'b0001 - 
					  sio_sii_opcc_ipcc_niu_by_cnt_r[3:0];
	2'b00	: niu_by_wr_cnt_l[3:0]  = niu_by_wr_cnt_r[3:0];
	endcase
					 
assign  niu_by_wr_cnt_snap_l[3:0] = niu_or_wr_inc ? niu_by_wr_cnt_l[3:0] : 
				    (sio_sii_opcc_ipcc_niu_by_deq_r & (|niu_by_wr_cnt_snap_r[3:0]))
				     ? niu_by_wr_cnt_dec[3:0] :
				     niu_by_wr_cnt_snap_r[3:0];

assign  niu_by_wr_cnt_dec[3:0]    = (niu_by_wr_cnt_snap_r[3:0] > niu_by_wr_cnt_snap_r[3:0]) ?
				      niu_by_wr_cnt_snap_r[3:0] - sio_sii_opcc_ipcc_niu_by_cnt_r[3:0] :
				      4'b0000 ; 
				     
	
//Keep track of write merge, no dequeue should count on the dmu_or_cnt;
assign 	dmu_wrm_mode = | dmu_wrm_cnt_r[3:0] || ilc_dmu_wrm;
assign 	niu_wrm_mode = | niu_wrm_cnt_r[3:0] || ilc_niu_wrm;

assign  ilc_dmu_wrm  =  ilc_ipcc_dmu_wrm0 | ilc_ipcc_dmu_wrm1 | ilc_ipcc_dmu_wrm2 |
			ilc_ipcc_dmu_wrm3 | ilc_ipcc_dmu_wrm4 | ilc_ipcc_dmu_wrm5 |
			ilc_ipcc_dmu_wrm6 | ilc_ipcc_dmu_wrm7;

assign  ilc_niu_wrm  =  ilc_ipcc_niu_wrm0 | ilc_ipcc_niu_wrm1 | ilc_ipcc_niu_wrm2 |
			ilc_ipcc_niu_wrm3 | ilc_ipcc_niu_wrm4 | ilc_ipcc_niu_wrm5 |
			ilc_ipcc_niu_wrm6 | ilc_ipcc_niu_wrm7;

assign  dmu_wrm_inc  =  ilc_ipcc_dmu_wrm_dq0 | ilc_ipcc_dmu_wrm_dq1 | ilc_ipcc_dmu_wrm_dq2 |
			ilc_ipcc_dmu_wrm_dq3 | ilc_ipcc_dmu_wrm_dq4 | ilc_ipcc_dmu_wrm_dq5 |
			ilc_ipcc_dmu_wrm_dq6 | ilc_ipcc_dmu_wrm_dq7;

assign  niu_wrm_inc  =  ilc_ipcc_niu_wrm_dq0 | ilc_ipcc_niu_wrm_dq1 | ilc_ipcc_niu_wrm_dq2 |
			ilc_ipcc_niu_wrm_dq3 | ilc_ipcc_niu_wrm_dq4 | ilc_ipcc_niu_wrm_dq5 |
			ilc_ipcc_niu_wrm_dq6 | ilc_ipcc_niu_wrm_dq7;

assign  dmu_wrm_op[1:0]	   = {dmu_wrm_inc, sio_sii_opcc_ipcc_dmu_or_deq_r && dmu_wrm_mode};
assign  niu_wrm_op[1:0]	   = {niu_wrm_inc, sio_sii_opcc_ipcc_niu_or_deq_r && niu_wrm_mode};

assign  dmu_wrm_cnt_l[3:0] = (dmu_wrm_op == 2'b01) ? (dmu_wrm_cnt_r[3:0] - 4'b0001) :
			  (dmu_wrm_op == 2'b10) ? (dmu_wrm_cnt_r[3:0] + 4'b0001) :
			   dmu_wrm_cnt_r[3:0];
assign  niu_wrm_cnt_l[3:0] = (niu_wrm_op == 2'b01) ? (niu_wrm_cnt_r[3:0] - 4'b0001) :
			  (niu_wrm_op == 2'b10) ? (niu_wrm_cnt_r[3:0] + 4'b0001) :
			   niu_wrm_cnt_r[3:0];

//----------------------------------------------------------------------
// Create new header for ILDq, INDq
//----------------------------------------------------------------------
assign	newhdr_l2[63:0]	= sii_mb1_run_r ? curhdr[63:0] :
				{jtag, cur_or_by, posted, hdr_err, cur_source, curhdr[61:59],   
			   newid[15:0], out_of_bound, pa[36:0], 2'b00}; 
assign  newhdr_nc[63:0] = sii_mb1_run_r ? curhdr[63:0] :
  			  	{32'h00000000, timeout, unmap, uncorr, hdr_err, 
				6'h00, new_c[5:0], newid[15:0]};  
// cmd[2:0] = 001 RDD, 010 WRM , 100 WRI
assign  hdr_err		= cmd_parity_err || addr_parity_err || ctag_ecc_ue;
assign  cur_or_by	= gnt_r[`DMU_O] || gnt_r[`NIU_O];
assign  cur_source      = gnt_r[`DMU_O] || gnt_r[`DMU_B];
assign	dma_wr	       	= l2_io && (curhdr[61] || curhdr[60]);
assign	wrm		= cstate[`ARB] ? (l2_io && curhdr[60]) : wrm_r;
assign 	rd_wr		= curhdr[59]; 		//rd =1 , wr=0
assign  l2_io		= curhdr[58];
assign  posted 		= curhdr[57]; 
assign	id[15:0]	= curhdr[56:41];
assign	timeout		= curhdr[40]; 
assign	unmap		= curhdr[39]; 
assign	uncorr		= curhdr[38]; 
assign  curbank[2:0]	= ~ncu_sii_pm ? curhdr[6:4] : partialbank[2:0];	
assign	jtag		= gnt_r[4]; 

assign	out_of_bound	= hdr_err && ~rd_wr;
//assign	out_of_bound	= hdr_err && ~rd_wr ? 1'b1 : pa[37];
assign  pa[37:0]	= (ncu_sii_l2_idx_hash_en && ~curhdr[37]) ?
			  {curhdr[37:16], hash1[4:0], hash2[1:0], curhdr[8:0] } : curhdr[37:0];
assign  hash1[4:0] 	= curhdr[30:26] ^ curhdr[15:11];
assign  hash2[1:0] 	= curhdr[17:16] ^ curhdr[10:9];

//---------------------------------------
// RAS related changes for HEADER ERRORS
//---------------------------------------
//assign  addr_parity[1:0]	= curhdr[65:64];

assign  hdr_cycle	=  cstate[`HDRDLY];
assign  ctag_ecc_ue     = jtag ? 1'b0 : |e[4:0] && (~e[5] || (e[4:0] > 5'd21)) && hdr_cycle ; 
assign  ctag_ecc_ce     = jtag ? 1'b0 : (e[4:0] <= 5'd21) && e[5] && hdr_cycle;

assign  cmd_parity_err  = jtag ? 1'b0 : hdr_cycle && (~curhdr[63]  ^ curhdr[62] ^ curhdr[61] 
					^ curhdr[60] ^ curhdr[59] ^ curhdr[58])  ;
assign  addr_parity_err = jtag ? 1'b0 : hdr_cycle && (~addr_par_odd || ~addr_par_even)    ;

assign  addr_par_odd    = curhdr[37] ^ curhdr[35] ^ curhdr[33] ^ curhdr[31] ^ curhdr[29] ^ curhdr[27] ^ curhdr[25] ^
                          curhdr[23] ^ curhdr[21] ^ curhdr[19] ^ curhdr[17] ^ curhdr[15] ^ curhdr[13] ^ curhdr[11] ^
                          curhdr[9]  ^ curhdr[7]  ^ curhdr[5]  ^ curhdr[3]  ^ curhdr[1]  ^ curhdr[65] ;

assign  addr_par_even   = curhdr[36] ^ curhdr[34] ^ curhdr[32] ^ curhdr[30] ^ curhdr[28] ^ curhdr[26] ^ curhdr[24] ^
                          curhdr[22] ^ curhdr[20] ^ curhdr[18] ^ curhdr[16] ^ curhdr[14] ^ curhdr[12] ^ curhdr[10] ^
                          curhdr[8]  ^ curhdr[6]  ^ curhdr[4]  ^ curhdr[2]  ^ curhdr[0]  ^ curhdr[64] ;

//----------------------------------------
// CTAG ERROR CORRECTION AND CHECKING
//----------------------------------------
assign	c[5:0]	= curhdr[71:66];

//assign	p[0]	= id[0] ^ id[1] ^ id[3] ^ id[4] ^ id[6] ^ id[8] ^ id[10] ^ id[11] ^id[13] ^ id[15];
//assign	p[1]	= id[0] ^ id[2] ^ id[3] ^ id[5] ^ id[6] ^ id[9] ^ id[10] ^ id[12] ^id[13] ;
//assign	p[2]	= id[1] ^ id[2] ^ id[3] ^ id[7] ^ id[8] ^ id[9] ^ id[10] ^ id[14] ^id[15] ;
//assign	p[3]	= id[4] ^ id[5] ^ id[6] ^ id[7] ^ id[8] ^ id[9] ^ id[10] ;
//assign	p[4]	= id[11] ^ id[12] ^ id[13] ^ id[14] ^ id[15] ;
//assign	p[5]	= id[0] ^ id[1] ^ id[2] ^ id[3] ^ id[4] ^ id[5] ^ id[6] ^ id[7] ^ id[8] ^ id[9] ^ 
//		  id[10] ^ id[11] ^ id[12] ^ id[13] ^ id[14] ^id[15] ^ c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[4];

//assign  e[0]	= p[0] ^ c[0];
//assign  e[1]	= p[1] ^ c[1];
//assign  e[2]	= p[2] ^ c[2];
//assign  e[3]	= p[3] ^ c[3];
//assign  e[4]	= p[4] ^ c[4];
//assign  e[5]	= p[5] ^ c[5];

always @ ( id[15:0] or c[5:0] )
  begin

	p[0]    = id[0] ^ id[1] ^ id[3] ^ id[4] ^ id[6] ^ id[8] ^ id[10] ^ id[11] ^id[13] ^ id[15];
  	p[1]    = id[0] ^ id[2] ^ id[3] ^ id[5] ^ id[6] ^ id[9] ^ id[10] ^ id[12] ^id[13] ;
  	p[2]    = id[1] ^ id[2] ^ id[3] ^ id[7] ^ id[8] ^ id[9] ^ id[10] ^ id[14] ^id[15] ;
  	p[3]    = id[4] ^ id[5] ^ id[6] ^ id[7] ^ id[8] ^ id[9] ^ id[10] ;
  	p[4]    = id[11] ^ id[12] ^ id[13] ^ id[14] ^ id[15] ;
  	p[5]    = id[0] ^ id[1] ^ id[2] ^ id[3] ^ id[4] ^ id[5] ^ id[6] ^ id[7] ^ id[8] ^ id[9] ^
                  id[10] ^ id[11] ^ id[12] ^ id[13] ^ id[14] ^id[15] ^ c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[4];

  	e[0]    = p[0] ^ c[0];
  	e[1]    = p[1] ^ c[1];
  	e[2]    = p[2] ^ c[2];
  	e[3]    = p[3] ^ c[3];
  	e[4]    = p[4] ^ c[4];
  	e[5]    = p[5] ^ c[5];

	new_c[5:0]  = c[5:0];
	newid[15:0] = id[15:0];
	
     if (e[5])
     begin
     case (e[4:0])		//synopsys parallel_case
	5'b00000	: new_c[5] = ~c[5];	
	5'b00001	: new_c[0] = ~c[0];	
	5'b00010	: new_c[1] = ~c[1];	
	5'b00011	: newid[0] = ~id[0];	
	5'b00100	: new_c[2] = ~c[2];	
	5'b00101	: newid[1] = ~id[1];	
	5'b00110	: newid[2] = ~id[2];	
	5'b00111	: newid[3] = ~id[3];	
	5'b01000	: new_c[3] = ~c[3];	
	5'b01001	: newid[4] = ~id[4];	
	5'b01010	: newid[5] = ~id[5];	
	5'b01011	: newid[6] = ~id[6];	
	5'b01100	: newid[7] = ~id[7];	
	5'b01101	: newid[8] = ~id[8];	
	5'b01110	: newid[9] = ~id[9];	
	5'b01111	: newid[10] = ~id[10];	
	5'b10000	: new_c[4] = ~c[4];	
	5'b10001	: newid[11] = ~id[11];	
	5'b10010	: newid[12] = ~id[12];	
	5'b10011	: newid[13] = ~id[13];	
	5'b10100	: newid[14] = ~id[14];	
	5'b10101	: newid[15] = ~id[15];	
	default		: begin
				newid[15:0] = id[15:0] ;
				new_c[5:0]  = c[5:0];
			  end
     endcase
     end

  end
	 

//----------------------
// Partial Bank Mapping
//----------------------

always @ ( ncu_sii_pm or ncu_sii_ba01 or ncu_sii_ba23 or ncu_sii_ba45 or ncu_sii_ba67 
	 	or dmu_or_bank_ext[2:0])
  if (~ncu_sii_pm)
			 dmu_or_bank[2:0] = dmu_or_bank_ext[2:0];
     else
     case ({ncu_sii_ba67, ncu_sii_ba45, ncu_sii_ba23, ncu_sii_ba01})
	4'b0000		: dmu_or_bank[2:0] = {1'b0, 1'b0, dmu_or_bank_ext[0]};		//illegal
	4'b0001		: dmu_or_bank[2:0] = {1'b0, 1'b0, dmu_or_bank_ext[0]};
	4'b0010		: dmu_or_bank[2:0] = {1'b0, 1'b1, dmu_or_bank_ext[0]};
	4'b0011		: dmu_or_bank[2:0] = {1'b0, dmu_or_bank_ext[1], dmu_or_bank_ext[0]};
	4'b0100		: dmu_or_bank[2:0] = {1'b1, 1'b0, dmu_or_bank_ext[0]};
	4'b0101		: dmu_or_bank[2:0] = {dmu_or_bank_ext[1], 1'b0, dmu_or_bank_ext[0]};
	4'b0110		: dmu_or_bank[2:0] = {dmu_or_bank_ext[1], ~dmu_or_bank_ext[1], 
						dmu_or_bank_ext[0]};
	4'b0111		: dmu_or_bank[2:0] = {1'b0, dmu_or_bank_ext[1], dmu_or_bank_ext[0]};	//illegal
	4'b1000		: dmu_or_bank[2:0] = {1'b1, 1'b1, dmu_or_bank_ext[0]};
	4'b1001		: dmu_or_bank[2:0] = {dmu_or_bank_ext[1], dmu_or_bank_ext[1], 
						dmu_or_bank_ext[0]};
// fix bug 110123 / ECO 110283
	4'b1010		: dmu_or_bank[2:0] = {dmu_or_bank_ext[1], 1'b1,dmu_or_bank_ext[0]};
	4'b1011		: dmu_or_bank[2:0] = {1'b0, dmu_or_bank_ext[1], dmu_or_bank_ext[0]};	//illegal
	4'b1100		: dmu_or_bank[2:0] = {1'b1, dmu_or_bank_ext[1], dmu_or_bank_ext[0]};
	4'b1101		: dmu_or_bank[2:0] = {1'b1, dmu_or_bank_ext[1], dmu_or_bank_ext[0]}; 	//illegal
	4'b1110		: dmu_or_bank[2:0] = {1'b1, dmu_or_bank_ext[1], dmu_or_bank_ext[0]};	//illegal
	4'b1111 	: dmu_or_bank[2:0] = dmu_or_bank_ext[2:0]; 
	default		: dmu_or_bank[2:0] = dmu_or_bank_ext[2:0]; 
      endcase

always @ ( ncu_sii_pm or ncu_sii_ba01 or ncu_sii_ba23 or ncu_sii_ba45 or ncu_sii_ba67 
	 	or dmu_by_bank_ext[2:0])
  if (~ncu_sii_pm)
			 dmu_by_bank[2:0] = dmu_by_bank_ext[2:0];
     else
     case ({ncu_sii_ba67, ncu_sii_ba45, ncu_sii_ba23, ncu_sii_ba01})
	4'b0000		: dmu_by_bank[2:0] = {1'b0, 1'b0, dmu_by_bank_ext[0]};		//illegal
	4'b0001		: dmu_by_bank[2:0] = {1'b0, 1'b0, dmu_by_bank_ext[0]};
	4'b0010		: dmu_by_bank[2:0] = {1'b0, 1'b1, dmu_by_bank_ext[0]};
	4'b0011		: dmu_by_bank[2:0] = {1'b0, dmu_by_bank_ext[1], dmu_by_bank_ext[0]};
	4'b0100		: dmu_by_bank[2:0] = {1'b1, 1'b0, dmu_by_bank_ext[0]};
	4'b0101		: dmu_by_bank[2:0] = {dmu_by_bank_ext[1], 1'b0, dmu_by_bank_ext[0]};
	4'b0110		: dmu_by_bank[2:0] = {dmu_by_bank_ext[1], ~dmu_by_bank_ext[1], 
						dmu_by_bank_ext[0]};
	4'b0111		: dmu_by_bank[2:0] = {1'b0, dmu_by_bank_ext[1], dmu_by_bank_ext[0]};	//illegal
	4'b1000		: dmu_by_bank[2:0] = {1'b1, 1'b1, dmu_by_bank_ext[0]};
	4'b1001		: dmu_by_bank[2:0] = {dmu_by_bank_ext[1], dmu_by_bank_ext[1], 
						dmu_by_bank_ext[0]};
// fix bug 110123 / ECO 110283

	4'b1010		: dmu_by_bank[2:0] = {dmu_by_bank_ext[1], 1'b1,dmu_by_bank_ext[0]};
	4'b1011		: dmu_by_bank[2:0] = {1'b0, dmu_by_bank_ext[1], dmu_by_bank_ext[0]};	//illegal
	4'b1100		: dmu_by_bank[2:0] = {1'b1, dmu_by_bank_ext[1], dmu_by_bank_ext[0]};
	4'b1101		: dmu_by_bank[2:0] = {1'b1, dmu_by_bank_ext[1], dmu_by_bank_ext[0]}; 	//illegal
	4'b1110		: dmu_by_bank[2:0] = {1'b1, dmu_by_bank_ext[1], dmu_by_bank_ext[0]};	//illegal
	4'b1111 	: dmu_by_bank[2:0] = dmu_by_bank_ext[2:0]; 
	default		: dmu_by_bank[2:0] = dmu_by_bank_ext[2:0]; 
      endcase

always @ ( ncu_sii_pm or ncu_sii_ba01 or ncu_sii_ba23 or ncu_sii_ba45 or ncu_sii_ba67 
	 	or niu_or_bank_ext[2:0])
  if (~ncu_sii_pm)
			 niu_or_bank[2:0] = niu_or_bank_ext[2:0];
     else
     case ({ncu_sii_ba67, ncu_sii_ba45, ncu_sii_ba23, ncu_sii_ba01})
	4'b0000		: niu_or_bank[2:0] = {1'b0, 1'b0, niu_or_bank_ext[0]};		//illegal
	4'b0001		: niu_or_bank[2:0] = {1'b0, 1'b0, niu_or_bank_ext[0]};
	4'b0010		: niu_or_bank[2:0] = {1'b0, 1'b1, niu_or_bank_ext[0]};
	4'b0011		: niu_or_bank[2:0] = {1'b0, niu_or_bank_ext[1], niu_or_bank_ext[0]};
	4'b0100		: niu_or_bank[2:0] = {1'b1, 1'b0, niu_or_bank_ext[0]};
	4'b0101		: niu_or_bank[2:0] = {niu_or_bank_ext[1], 1'b0, niu_or_bank_ext[0]};
	4'b0110		: niu_or_bank[2:0] = {niu_or_bank_ext[1], ~niu_or_bank_ext[1], 
						niu_or_bank_ext[0]};
	4'b0111		: niu_or_bank[2:0] = {1'b0, niu_or_bank_ext[1], niu_or_bank_ext[0]};	//illegal
	4'b1000		: niu_or_bank[2:0] = {1'b1, 1'b1, niu_or_bank_ext[0]};
	4'b1001		: niu_or_bank[2:0] = {niu_or_bank_ext[1], niu_or_bank_ext[1], 
						niu_or_bank_ext[0]};
// fix bug 110123 / ECO 110283

	4'b1010		: niu_or_bank[2:0] = {niu_or_bank_ext[1], 1'b1,niu_or_bank_ext[0]};
	4'b1011		: niu_or_bank[2:0] = {1'b0, niu_or_bank_ext[1], niu_or_bank_ext[0]};	//illegal
	4'b1100		: niu_or_bank[2:0] = {1'b1, niu_or_bank_ext[1], niu_or_bank_ext[0]};
	4'b1101		: niu_or_bank[2:0] = {1'b1, niu_or_bank_ext[1], niu_or_bank_ext[0]}; 	//illegal
	4'b1110		: niu_or_bank[2:0] = {1'b1, niu_or_bank_ext[1], niu_or_bank_ext[0]};	//illegal
	4'b1111 	: niu_or_bank[2:0] = niu_or_bank_ext[2:0]; 
	default		: niu_or_bank[2:0] = niu_or_bank_ext[2:0]; 
      endcase

always @ ( ncu_sii_pm or ncu_sii_ba01 or ncu_sii_ba23 or ncu_sii_ba45 or ncu_sii_ba67 
	 	or niu_by_bank_ext[2:0])
  if (~ncu_sii_pm)
			 niu_by_bank[2:0] = niu_by_bank_ext[2:0];
     else
     case ({ncu_sii_ba67, ncu_sii_ba45, ncu_sii_ba23, ncu_sii_ba01})
	4'b0000		: niu_by_bank[2:0] = {1'b0, 1'b0, niu_by_bank_ext[0]};		//illegal
	4'b0001		: niu_by_bank[2:0] = {1'b0, 1'b0, niu_by_bank_ext[0]};
	4'b0010		: niu_by_bank[2:0] = {1'b0, 1'b1, niu_by_bank_ext[0]};
	4'b0011		: niu_by_bank[2:0] = {1'b0, niu_by_bank_ext[1], niu_by_bank_ext[0]};
	4'b0100		: niu_by_bank[2:0] = {1'b1, 1'b0, niu_by_bank_ext[0]};
	4'b0101		: niu_by_bank[2:0] = {niu_by_bank_ext[1], 1'b0, niu_by_bank_ext[0]};
	4'b0110		: niu_by_bank[2:0] = {niu_by_bank_ext[1], ~niu_by_bank_ext[1], 
						niu_by_bank_ext[0]};
	4'b0111		: niu_by_bank[2:0] = {1'b0, niu_by_bank_ext[1], niu_by_bank_ext[0]};	//illegal
	4'b1000		: niu_by_bank[2:0] = {1'b1, 1'b1, niu_by_bank_ext[0]};
	4'b1001		: niu_by_bank[2:0] = {niu_by_bank_ext[1], niu_by_bank_ext[1], 
						niu_by_bank_ext[0]};
// fix bug 110123 / ECO 110283

	4'b1010		: niu_by_bank[2:0] = {niu_by_bank_ext[1], 1'b1,niu_by_bank_ext[0]};
	4'b1011		: niu_by_bank[2:0] = {1'b0, niu_by_bank_ext[1], niu_by_bank_ext[0]};	//illegal
	4'b1100		: niu_by_bank[2:0] = {1'b1, niu_by_bank_ext[1], niu_by_bank_ext[0]};
	4'b1101		: niu_by_bank[2:0] = {1'b1, niu_by_bank_ext[1], niu_by_bank_ext[0]}; 	//illegal
	4'b1110		: niu_by_bank[2:0] = {1'b1, niu_by_bank_ext[1], niu_by_bank_ext[0]};	//illegal
	4'b1111 	: niu_by_bank[2:0] = niu_by_bank_ext[2:0]; 
	default		: niu_by_bank[2:0] = niu_by_bank_ext[2:0]; 
      endcase

always @ ( ncu_sii_ba01 or ncu_sii_ba23 or ncu_sii_ba45 or ncu_sii_ba67 or curhdr[6:4])
     case ({ncu_sii_ba67, ncu_sii_ba45, ncu_sii_ba23, ncu_sii_ba01})
	4'b0000		: partialbank[2:0] = {1'b0, 1'b0, curhdr[4]};		//illegal
	4'b0001		: partialbank[2:0] = {1'b0, 1'b0, curhdr[4]};
	4'b0010		: partialbank[2:0] = {1'b0, 1'b1, curhdr[4]};
	4'b0011		: partialbank[2:0] = {1'b0, curhdr[5], curhdr[4]};
	4'b0100		: partialbank[2:0] = {1'b1, 1'b0, curhdr[4]};
	4'b0101		: partialbank[2:0] = {curhdr[5], 1'b0, curhdr[4]};
	4'b0110		: partialbank[2:0] = {curhdr[5], ~curhdr[5], curhdr[4]};
	4'b0111		: partialbank[2:0] = {1'b0, curhdr[5], curhdr[4]};	//illegal
	4'b1000		: partialbank[2:0] = {1'b1, 1'b1, curhdr[4]};
	4'b1001		: partialbank[2:0] = {curhdr[5], curhdr[5], curhdr[4]};

// fix bug 110123 / ECO 110283

	4'b1010		: partialbank[2:0] = {curhdr[5], 1'b1, curhdr[4]};
	4'b1011		: partialbank[2:0] = {1'b0, curhdr[5], curhdr[4]};	//illegal
	4'b1100		: partialbank[2:0] = {1'b1, curhdr[5], curhdr[4]};
	4'b1101		: partialbank[2:0] = {1'b1, curhdr[5], curhdr[4]}; 	//illegal
	4'b1110		: partialbank[2:0] = {1'b1, curhdr[5], curhdr[4]};	//illegal
	4'b1111 	: partialbank[2:0] = curhdr[6:4]; 
	default		: partialbank[2:0] = curhdr[6:4]; 

      endcase


// Parity checking logic for reading out from ipdodq, ipdbdq
//---------------------------------------------------------------------
// Compose the current granted queue's header header and data 
//---------------------------------------------------------------------

//----------------------------------------------------------------------
// *********************************************************************
// For Ordered Queue : 
// -----------------
// DMA Write/Read/Intr/Flush/Read return:
//	1. Wait for corresponding dependence transaction removed from 
//      the Bypass queue (if any).	
//	2. Wait for the bypass queue write counter == 0	
//		---> Read Return dequeue
//	3. Check if the bank# of current transaction == trackid, if yes 
//		---> DMA Wr/Rd and Interrupt dequeue	  
//	4. If no, wait for Ordered write counter == 0,
//		---> Flush, DMA Wr/Rd, Interrupt dequeue
// Note : Flush need to send a return package to the return path
//		 
// *********************************************************************
// For Bypass Queue : 
// -----------------
// All transactions only need to wait for corresponding dependece
// transaction removed from the ordered queue. 
//	
//----------------------------------------------------------------------
// ipdohq0_dout[62] = ??

assign  dmu_or_dep_ok = (dmu_by_wr_cnt_r[3:0] == 4'b0000) && ~dmu_or_dep && ~dmu_or_wr_full && 
			dmu_all_ack ? 1'b1 : 1'b0; 

assign  dmu_all_ack   = (dmu_or_wr_cnt_r[1:0] == 2'b00) && (dmu_wrm_cnt_r[3:0] == 4'b0000);
assign  dmu_by_dep_ok = ~dmu_by_dep & dmu_all_ack;  // TO2.2 ECO - bug #125463

assign  niu_all_ack   = (niu_or_wr_cnt_r[1:0] == 2'b00) && (niu_wrm_cnt_r[3:0] == 4'b0000);

//assign  niu_or_dep_ok = (niu_by_wr_cnt_r[3:0] == 4'b0000) && ~niu_or_dep && ~niu_or_wr_full && 
//			niu_all_ack ? 1'b1 : 1'b0; 
assign  niu_or_dep_ok = (niu_by_wr_cnt_snap_r[3:0] == 4'b0000) && ~niu_or_dep && ~niu_or_wr_full && 
			niu_all_ack ? 1'b1 : 1'b0; 

assign  niu_by_dep_ok = ~niu_by_dep && ~niu_by_wr_full;

always @ (ipcc_ipdohq0_rd_addr[3:0] or ipcs_ipcc_dmu_or_dep_sync[15:0])
    case (ipcc_ipdohq0_rd_addr[3:0]) //synopsys parallel_case full_case
        4'b0000 :       dmu_or_dep = ipcs_ipcc_dmu_or_dep_sync[0];
        4'b0001 :       dmu_or_dep = ipcs_ipcc_dmu_or_dep_sync[1]; 
        4'b0010 :       dmu_or_dep = ipcs_ipcc_dmu_or_dep_sync[2]; 
        4'b0011 :       dmu_or_dep = ipcs_ipcc_dmu_or_dep_sync[3]; 
        4'b0100 :       dmu_or_dep = ipcs_ipcc_dmu_or_dep_sync[4]; 
        4'b0101 :       dmu_or_dep = ipcs_ipcc_dmu_or_dep_sync[5]; 
        4'b0110 :       dmu_or_dep = ipcs_ipcc_dmu_or_dep_sync[6]; 
        4'b0111 :       dmu_or_dep = ipcs_ipcc_dmu_or_dep_sync[7]; 
        4'b1000 :       dmu_or_dep = ipcs_ipcc_dmu_or_dep_sync[8]; 
        4'b1001 :       dmu_or_dep = ipcs_ipcc_dmu_or_dep_sync[9]; 
        4'b1010 :       dmu_or_dep = ipcs_ipcc_dmu_or_dep_sync[10]; 
        4'b1011 :       dmu_or_dep = ipcs_ipcc_dmu_or_dep_sync[11]; 
        4'b1100 :       dmu_or_dep = ipcs_ipcc_dmu_or_dep_sync[12]; 
        4'b1101 :       dmu_or_dep = ipcs_ipcc_dmu_or_dep_sync[13]; 
        4'b1110 :       dmu_or_dep = ipcs_ipcc_dmu_or_dep_sync[14]; 
        4'b1111 :       dmu_or_dep = ipcs_ipcc_dmu_or_dep_sync[15]; 
	default :  	dmu_or_dep = ipcs_ipcc_dmu_or_dep_sync[0]; // 0in < fire -message "ERROR: sii_ipcc dmu_or_dep default case" 	
    endcase

always @ (ipcc_ipdbhq0_rd_addr[3:0] or ipcs_ipcc_dmu_by_dep_sync[15:0])
    case (ipcc_ipdbhq0_rd_addr[3:0]) //synopsys parallel_case full_case
        4'b0000 :       dmu_by_dep = ipcs_ipcc_dmu_by_dep_sync[0];
        4'b0001 :       dmu_by_dep = ipcs_ipcc_dmu_by_dep_sync[1]; 
        4'b0010 :       dmu_by_dep = ipcs_ipcc_dmu_by_dep_sync[2]; 
        4'b0011 :       dmu_by_dep = ipcs_ipcc_dmu_by_dep_sync[3]; 
        4'b0100 :       dmu_by_dep = ipcs_ipcc_dmu_by_dep_sync[4]; 
        4'b0101 :       dmu_by_dep = ipcs_ipcc_dmu_by_dep_sync[5]; 
        4'b0110 :       dmu_by_dep = ipcs_ipcc_dmu_by_dep_sync[6]; 
        4'b0111 :       dmu_by_dep = ipcs_ipcc_dmu_by_dep_sync[7]; 
        4'b1000 :       dmu_by_dep = ipcs_ipcc_dmu_by_dep_sync[8]; 
        4'b1001 :       dmu_by_dep = ipcs_ipcc_dmu_by_dep_sync[9]; 
        4'b1010 :       dmu_by_dep = ipcs_ipcc_dmu_by_dep_sync[10]; 
        4'b1011 :       dmu_by_dep = ipcs_ipcc_dmu_by_dep_sync[11]; 
        4'b1100 :       dmu_by_dep = ipcs_ipcc_dmu_by_dep_sync[12]; 
        4'b1101 :       dmu_by_dep = ipcs_ipcc_dmu_by_dep_sync[13]; 
        4'b1110 :       dmu_by_dep = ipcs_ipcc_dmu_by_dep_sync[14]; 
        4'b1111 :       dmu_by_dep = ipcs_ipcc_dmu_by_dep_sync[15]; 
	default :  	dmu_by_dep = ipcs_ipcc_dmu_by_dep_sync[0]; // 0in < fire -message "ERROR: sii_ipcc dmu_by_dep default case" 	
    endcase

always @ (ipcc_ipdohq1_rd_addr[3:0] or ipcs_ipcc_niu_or_dep_sync[15:0])
    case (ipcc_ipdohq1_rd_addr[3:0])
        4'b0000 :       niu_or_dep = ipcs_ipcc_niu_or_dep_sync[0];
        4'b0001 :       niu_or_dep = ipcs_ipcc_niu_or_dep_sync[1]; 
        4'b0010 :       niu_or_dep = ipcs_ipcc_niu_or_dep_sync[2]; 
        4'b0011 :       niu_or_dep = ipcs_ipcc_niu_or_dep_sync[3]; 
        4'b0100 :       niu_or_dep = ipcs_ipcc_niu_or_dep_sync[4]; 
        4'b0101 :       niu_or_dep = ipcs_ipcc_niu_or_dep_sync[5]; 
        4'b0110 :       niu_or_dep = ipcs_ipcc_niu_or_dep_sync[6]; 
        4'b0111 :       niu_or_dep = ipcs_ipcc_niu_or_dep_sync[7]; 
        4'b1000 :       niu_or_dep = ipcs_ipcc_niu_or_dep_sync[8]; 
        4'b1001 :       niu_or_dep = ipcs_ipcc_niu_or_dep_sync[9]; 
        4'b1010 :       niu_or_dep = ipcs_ipcc_niu_or_dep_sync[10]; 
        4'b1011 :       niu_or_dep = ipcs_ipcc_niu_or_dep_sync[11]; 
        4'b1100 :       niu_or_dep = ipcs_ipcc_niu_or_dep_sync[12]; 
        4'b1101 :       niu_or_dep = ipcs_ipcc_niu_or_dep_sync[13]; 
        4'b1110 :       niu_or_dep = ipcs_ipcc_niu_or_dep_sync[14]; 
        4'b1111 :       niu_or_dep = ipcs_ipcc_niu_or_dep_sync[15]; 
	default :  	niu_or_dep = ipcs_ipcc_niu_or_dep_sync[0]; // 0in < fire -message "ERROR: sii_ipcc niu_or_dep default case" 	
    endcase

always @ (ipcc_ipdbhq1_rd_addr[3:0] or ipcs_ipcc_niu_by_dep_sync[15:0])
    case (ipcc_ipdbhq1_rd_addr[3:0])
        4'b0000 :       niu_by_dep = ipcs_ipcc_niu_by_dep_sync[0];
        4'b0001 :       niu_by_dep = ipcs_ipcc_niu_by_dep_sync[1]; 
        4'b0010 :       niu_by_dep = ipcs_ipcc_niu_by_dep_sync[2]; 
        4'b0011 :       niu_by_dep = ipcs_ipcc_niu_by_dep_sync[3]; 
        4'b0100 :       niu_by_dep = ipcs_ipcc_niu_by_dep_sync[4]; 
        4'b0101 :       niu_by_dep = ipcs_ipcc_niu_by_dep_sync[5]; 
        4'b0110 :       niu_by_dep = ipcs_ipcc_niu_by_dep_sync[6]; 
        4'b0111 :       niu_by_dep = ipcs_ipcc_niu_by_dep_sync[7]; 
        4'b1000 :       niu_by_dep = ipcs_ipcc_niu_by_dep_sync[8]; 
        4'b1001 :       niu_by_dep = ipcs_ipcc_niu_by_dep_sync[9]; 
        4'b1010 :       niu_by_dep = ipcs_ipcc_niu_by_dep_sync[10]; 
        4'b1011 :       niu_by_dep = ipcs_ipcc_niu_by_dep_sync[11]; 
        4'b1100 :       niu_by_dep = ipcs_ipcc_niu_by_dep_sync[12]; 
        4'b1101 :       niu_by_dep = ipcs_ipcc_niu_by_dep_sync[13]; 
        4'b1110 :       niu_by_dep = ipcs_ipcc_niu_by_dep_sync[14]; 
        4'b1111 :       niu_by_dep = ipcs_ipcc_niu_by_dep_sync[15]; 
	default :  	niu_by_dep = ipcs_ipcc_niu_by_dep_sync[0]; // 0in < fire -message "ERROR: sii_ipcc niu_by_dep default case" 	
    endcase


//-------------------------------------------------------------
//  Find out the bank availablility for each queue 
//-------------------------------------------------------------
always @ (dmu_or_bank[2:0] or ilc_ipcc_stop0 or ilc_ipcc_stop1 or 
	  ilc_ipcc_stop2   or ilc_ipcc_stop3 or ilc_ipcc_stop4 or
	  ilc_ipcc_stop5   or ilc_ipcc_stop6 or ilc_ipcc_stop7)
	case (dmu_or_bank[2:0])	//synopsys parallel_case full_case
	3'b000	: dmu_or_l2go	= ~ilc_ipcc_stop0;	
	3'b001	: dmu_or_l2go	= ~ilc_ipcc_stop1;	
	3'b010	: dmu_or_l2go	= ~ilc_ipcc_stop2;	
	3'b011	: dmu_or_l2go	= ~ilc_ipcc_stop3;	
	3'b100	: dmu_or_l2go	= ~ilc_ipcc_stop4;	
	3'b101	: dmu_or_l2go	= ~ilc_ipcc_stop5;	
	3'b110	: dmu_or_l2go	= ~ilc_ipcc_stop6;	
	3'b111	: dmu_or_l2go	= ~ilc_ipcc_stop7;	
	default : begin
			dmu_or_l2go   = ~ilc_ipcc_stop0;
			// 0in < fire -message "ERROR: sii_ipcc dmu_or_l2go default case" 
		  end
	endcase

always @ (dmu_by_bank[2:0] or ilc_ipcc_stop0 or ilc_ipcc_stop1 or 
          ilc_ipcc_stop2   or ilc_ipcc_stop3 or ilc_ipcc_stop4 or
          ilc_ipcc_stop5   or ilc_ipcc_stop6 or ilc_ipcc_stop7)
	case (dmu_by_bank[2:0]) //synopsys parallel_case full_case
	3'b000	: dmu_by_l2go	= ~ilc_ipcc_stop0;	
	3'b001	: dmu_by_l2go	= ~ilc_ipcc_stop1;	
	3'b010	: dmu_by_l2go	= ~ilc_ipcc_stop2;	
	3'b011	: dmu_by_l2go	= ~ilc_ipcc_stop3;	
	3'b100	: dmu_by_l2go	= ~ilc_ipcc_stop4;	
	3'b101	: dmu_by_l2go	= ~ilc_ipcc_stop5;	
	3'b110	: dmu_by_l2go	= ~ilc_ipcc_stop6;	
	3'b111	: dmu_by_l2go	= ~ilc_ipcc_stop7;	
	default : begin
			dmu_by_l2go   = ~ilc_ipcc_stop0;
			// 0in < fire -message "ERROR: sii_ipcc dmu_by_l2go default case"
		  end
	endcase

always @ (niu_or_bank[2:0] or ilc_ipcc_stop0 or ilc_ipcc_stop1 or 
          ilc_ipcc_stop2   or ilc_ipcc_stop3 or ilc_ipcc_stop4 or
          ilc_ipcc_stop5   or ilc_ipcc_stop6 or ilc_ipcc_stop7)
	case (niu_or_bank[2:0]) //synopsys parallel_case full_case
	3'b000	: niu_or_l2go	= ~ilc_ipcc_stop0;	
	3'b001	: niu_or_l2go	= ~ilc_ipcc_stop1;	
	3'b010	: niu_or_l2go	= ~ilc_ipcc_stop2;	
	3'b011	: niu_or_l2go	= ~ilc_ipcc_stop3;	
	3'b100	: niu_or_l2go	= ~ilc_ipcc_stop4;	
	3'b101	: niu_or_l2go	= ~ilc_ipcc_stop5;	
	3'b110	: niu_or_l2go	= ~ilc_ipcc_stop6;	
	3'b111	: niu_or_l2go	= ~ilc_ipcc_stop7;	
	default : begin
			// 0in < fire -message "ERROR: sii_ipcc niu_or_l2go default case" 
			niu_or_l2go   = ~ilc_ipcc_stop0;
		  end
	endcase

always @ (niu_by_bank[2:0] or ilc_ipcc_stop0 or ilc_ipcc_stop1 or 
          ilc_ipcc_stop2   or ilc_ipcc_stop3 or ilc_ipcc_stop4 or
          ilc_ipcc_stop5   or ilc_ipcc_stop6 or ilc_ipcc_stop7)
begin
	case (niu_by_bank[2:0])
	3'b000	: niu_by_l2go	= ~ilc_ipcc_stop0;	
	3'b001	: niu_by_l2go	= ~ilc_ipcc_stop1;	
	3'b010	: niu_by_l2go	= ~ilc_ipcc_stop2;	
	3'b011	: niu_by_l2go	= ~ilc_ipcc_stop3;	
	3'b100	: niu_by_l2go	= ~ilc_ipcc_stop4;	
	3'b101	: niu_by_l2go	= ~ilc_ipcc_stop5;	
	3'b110	: niu_by_l2go	= ~ilc_ipcc_stop6;	
	3'b111	: niu_by_l2go	= ~ilc_ipcc_stop7;	
	default : begin
			niu_by_l2go   = ~ilc_ipcc_stop0;
			// 0in < fire -message "ERROR: sii_ipcc niu_by_l2go default case" 
		  end
	endcase
end

//************************************************************************
// 		STATE TRANSITION SECTION
//************************************************************************

//0in one_hot -var cstate[13:0]
//0in one_hot -var nstate_r[13:0]

assign		nstate = {nstate_r[13:1], ~nstate_r[0]};
assign		cstate = {cstate_r[13:1], ~cstate_r[0]};

assign	arc_start_dec	= cstate[`START] && ~all_fifo_empty && ~all_stop || tcu_go; 
assign	arc_dec_arb	= cstate[`DEC] && |gnt_r[4:0]	; 
assign	arc_arb_hdr	= cstate[`ARB]	&& go & cmp_io_sync_en; 
assign	arc_hdrdly_data1 = cstate[`HDRDLY] 	&& ~(rd_wr && l2_io) ;
assign	arc_hdrdly_rddw	 = cstate[`HDRDLY] 	&& rd_wr && l2_io ;
assign	arc_data1_data2	= cstate[`DATA1] ; 
assign	arc_data2_data3	= cstate[`DATA2] && dma_wr_r && l2_io; 
assign  arc_arb_start   = cstate[`ARB]  && ~go &&  cmp_io_sync_en; 

//assign	arc_data8_dec	= cstate[`DATA8] &&  ~all_fifo_empty && ~all_stop;

always @ (arc_start_dec  	or arc_dec_arb 		or arc_arb_hdr 		or 
	  arc_hdrdly_data1	or arc_data1_data2	or arc_data2_data3 	or 
	  arc_hdrdly_rddw	or arc_arb_start    	or cstate )

	begin
	case (1'b1)			//synopsys parallel_case full_case
		cstate[`START]	: if (arc_start_dec)
					nstate_r = `DEC_ST;
				  else
					nstate_r = `START_ST;
		cstate[`DEC]	: if (arc_dec_arb)
					nstate_r = `ARB_ST;		
				  else
					nstate_r = `START_ST;
		cstate[`ARB]	: if (arc_arb_hdr) 
					nstate_r = `HDR_ST;		
				  else  if (arc_arb_start)
					nstate_r = `START_ST;
				  else
					nstate_r = `ARB_ST;
		cstate[`HDR]	: 	nstate_r = `HDRDLY_ST;		

		cstate[`HDRDLY]	: if (arc_hdrdly_data1)
					nstate_r = `DATA1_ST;
				  else if(arc_hdrdly_rddw)
					nstate_r = `RDDW_ST;
				  else
					nstate_r = `START_ST;
		cstate[`RDDW]	: 	nstate_r = `START_ST;
		cstate[`DATA1]	: if (arc_data1_data2)
					nstate_r = `DATA2_ST;		
				  else
					nstate_r = `START_ST;
		cstate[`DATA2]	: if (arc_data2_data3)
					nstate_r = `DATA3_ST;		
				  else
					nstate_r = `START_ST;
		cstate[`DATA3]	: 
					nstate_r = `DATA4_ST;		
		cstate[`DATA4]	: 
					nstate_r = `DATA5_ST;
		cstate[`DATA5]	: 
					nstate_r = `DATA6_ST;
		cstate[`DATA6]	: 
					nstate_r = `DATA7_ST;
		cstate[`DATA7]	: 
					nstate_r = `DATA8_ST;
		cstate[`DATA8]	: 
					nstate_r = `START_ST;
		default		: begin
					// 0in < fire -message "ERROR: sii_ipcc state machine default case"
					nstate_r = `START_ST;
				  end

	endcase
	end

//************************************************************************
// 			REGISTERS section
//************************************************************************
sii_ipcc_ctlmsff_ctl_macro__en_1__width_5 reg_gnt   // ASYNC reset active low
                                (
					.scan_in(reg_gnt_scanin),
					.scan_out(reg_gnt_scanout),
					.dout(gnt_r[4:0]),
					.en (cstate[`START]),
                                      	.l1clk(l1clk),
                                      	.din(gnt_l[4:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_5 reg_gnt0   // ASYNC reset active low	// duplicate signal for timing 
                                (
					.scan_in(reg_gnt0_scanin),
					.scan_out(reg_gnt0_scanout),
					.dout(gnt0_r[4:0]),
					.en (cstate[`START]),
                                      	.l1clk(l1clk),
                                      	.din(gnt_l[4:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_14 reg_cstate  // ASYNC reset active low
                                (
					.scan_in(reg_cstate_scanin),
					.scan_out(reg_cstate_scanout),
					.dout(cstate_r[13:0]),
                                      	.l1clk(l1clk),
                                      	.din(nstate[13:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_56 reg_err_ctag_pa   // ASYNC reset active low
                                (
                                        .scan_in(reg_err_ctag_pa_scanin),
                                        .scan_out(reg_err_ctag_pa_scanout),
                                        .dout(err_ctag_pa_r[55:0]),
                                        .en (cstate[`HDR]),
                                        .l1clk(l1clk),
                                        .din({curhdr[56:41],curhdr[37:0], 2'b00}),
  .siclk(siclk),
  .soclk(soclk)
                                        );


sii_ipcc_ctlmsff_ctl_macro__width_1 reg_dma_wr  // ASYNC reset active low
                                (
					.scan_in(reg_dma_wr_scanin),
					.scan_out(reg_dma_wr_scanout),
					.dout(dma_wr_r),
                                      	.l1clk(l1clk),
                                      	.din(dma_wr),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_wrm  // ASYNC reset active low
                                (
					.scan_in(reg_wrm_scanin),
					.scan_out(reg_wrm_scanout),
					.dout(wrm_r),
                                      	.l1clk(l1clk),
                                      	.din(wrm),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_l2_io   // ASYNC reset active low
                                (
					.scan_in(reg_l2_io_scanin),
					.scan_out(reg_l2_io_scanout),
					.dout(l2_io_r),
					.en (cstate[`ARB]),
                                      	.l1clk(l1clk),
                                      	.din(l2_io),
  .siclk(siclk),
  .soclk(soclk)
					);


sii_ipcc_ctlmsff_ctl_macro__width_5 reg_dmu_or_cnt  // ASYNC reset active low
                                (
					.scan_in(reg_dmu_or_cnt_scanin),
					.scan_out(reg_dmu_or_cnt_scanout),
					.dout(dmu_or_cnt_r[4:0]),
                                      	.l1clk(l1clk),
                                      	.din(dmu_or_cnt_l[4:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_5 reg_dmu_by_cnt  // ASYNC reset active low
                                (
					.scan_in(reg_dmu_by_cnt_scanin),
					.scan_out(reg_dmu_by_cnt_scanout),
					.dout(dmu_by_cnt_r[4:0]),
                                      	.l1clk(l1clk),
                                      	.din(dmu_by_cnt_l[4:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_5 reg_niu_or_cnt  // ASYNC reset active low
                                (
					.scan_in(reg_niu_or_cnt_scanin),
					.scan_out(reg_niu_or_cnt_scanout),
					.dout(niu_or_cnt_r[4:0]),
                                      	.l1clk(l1clk),
                                      	.din(niu_or_cnt_l[4:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_5 reg_niu_by_cnt  // ASYNC reset active low
                                (
					.scan_in(reg_niu_by_cnt_scanin),
					.scan_out(reg_niu_by_cnt_scanout),
					.dout(niu_by_cnt_r[4:0]),
                                      	.l1clk(l1clk),
                                      	.din(niu_by_cnt_l[4:0]),
  .siclk(siclk),
  .soclk(soclk)
					);


sii_ipcc_ctlmsff_ctl_macro__width_6 reg_indq_wr_addr  // ASYNC reset active low
                                (
					.scan_in(reg_indq_wr_addr_scanin),
					.scan_out(reg_indq_wr_addr_scanout),
					.dout(ipcc_indq_wr_addr_r[5:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_indq_wr_addr_l[5:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

//msff_ctl_macro reg_indq_wr_addr_dly (width=6) // ASYNC reset active low
//                                (
//					.scan_in(reg_indq_wr_addr_dly_scanin),
//					.scan_out(reg_indq_wr_addr_dly_scanout),
//					.dout(ipcc_indq_wr_addr_dly[5:0]),
//                                     	.l1clk(l1clk),
//                                    	.din(ipcc_indq_wr_addr_l[5:0]),
//					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_indq_wr_en  // ASYNC reset active low
                                (
					.scan_in(reg_indq_wr_en_scanin),
					.scan_out(reg_indq_wr_en_scanout),
					.dout(ipcc_indq_wr_en_r),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_indq_wr_en_dly),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_indq_wr_en_dly  // ASYNC reset active low
                                (
					.scan_in(reg_indq_wr_en_dly_scanin),
					.scan_out(reg_indq_wr_en_dly_scanout),
					.dout(ipcc_indq_wr_en_dly),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_indq_wr_en_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_indq_wr_ovfl  // ASYNC reset active low
                                (
					.scan_in(reg_indq_wr_ovfl_scanin),
					.scan_out(reg_indq_wr_ovfl_scanout),
					.dout(ipcc_inc_wr_ovfl),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_inc_wr_ovfl_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_2 reg_arb1  // ASYNC reset active low
                                (
					.scan_in(reg_arb1_scanin),
					.scan_out(reg_arb1_scanout),
					.dout(arb1_r[1:0]),
                                      	.l1clk(l1clk),
			//		.en(arc_dec_arb),
                                      	.din(arb1_l[1:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

//msff_ctl_macro reg_arb2_dmu (width=1, en=1) // ASYNC reset active low
//                                (
//					.scan_in(reg_arb2_dmu_scanin),
//					.scan_out(reg_arb2_dmu_scanout),
//					.dout(arb2_dmu_r),
//                                      	.l1clk(l1clk),
//					.en (arc_dec_arb),
//                                      	.din(arb2_dmu_l),
//					);

//msff_ctl_macro reg_arb2_niu (width=1, en=1) // ASYNC reset active low
//                                (
//					.scan_in(reg_arb2_niu_scanin),
//					.scan_out(reg_arb2_niu_scanout),
//					.dout(arb2_niu_r),
//                                     	.l1clk(l1clk),
//					.en (arc_dec_arb),
//                                      	.din(arb2_niu_l),
//					);

sii_ipcc_ctlmsff_ctl_macro__width_4 reg_dmu_wrm_cnt  // ASYNC reset active low
                                (
					.scan_in(reg_dmu_wrm_cnt_scanin),
					.scan_out(reg_dmu_wrm_cnt_scanout),
					.dout(dmu_wrm_cnt_r[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(dmu_wrm_cnt_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_4 reg_niu_wrm_cnt  // ASYNC reset active low
                                (
					.scan_in(reg_niu_wrm_cnt_scanin),
					.scan_out(reg_niu_wrm_cnt_scanout),
					.dout(niu_wrm_cnt_r[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(niu_wrm_cnt_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_2 reg_dmu_or_wr_cnt  // ASYNC reset active low
                                (
					.scan_in(reg_dmu_or_wr_cnt_scanin),
					.scan_out(reg_dmu_or_wr_cnt_scanout),
					.dout(dmu_or_wr_cnt_r[1:0]),
                                      	.l1clk(l1clk),
                                      	.din(dmu_or_wr_cnt_l[1:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_4 reg_dmu_by_wr_cnt  // ASYNC reset active low
                                (
					.scan_in(reg_dmu_by_wr_cnt_scanin),
					.scan_out(reg_dmu_by_wr_cnt_scanout),
					.dout(dmu_by_wr_cnt_r[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(dmu_by_wr_cnt_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_2 reg_niu_or_wr_cnt  // ASYNC reset active low
                                (
					.scan_in(reg_niu_or_wr_cnt_scanin),
					.scan_out(reg_niu_or_wr_cnt_scanout),
					.dout(niu_or_wr_cnt_r[1:0]),
                                      	.l1clk(l1clk),
                                      	.din(niu_or_wr_cnt_l[1:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_4 reg_niu_by_wr_cnt  // ASYNC reset active low
                                (
					.scan_in(reg_niu_by_wr_cnt_scanin),
					.scan_out(reg_niu_by_wr_cnt_scanout),
					.dout(niu_by_wr_cnt_r[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(niu_by_wr_cnt_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_4 reg_niu_by_wr_cnt_snap  // ASYNC reset active low
                                (
					.scan_in(reg_niu_by_wr_cnt_snap_scanin),
					.scan_out(reg_niu_by_wr_cnt_snap_scanout),
					.dout(niu_by_wr_cnt_snap_r[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(niu_by_wr_cnt_snap_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__dmsff_32x__width_5 reg_ildq_wr_addr0   // ASYNC reset active low
                                (
					.scan_in(reg_ildq_wr_addr0_scanin),
					.scan_out(reg_ildq_wr_addr0_scanout),
					.dout(ipcc_ildq_wr_addr0),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ildq_wr_addr0_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__dmsff_32x__width_5 reg_ildq_wr_addr1   // ASYNC reset active low
                                (
					.scan_in(reg_ildq_wr_addr1_scanin),
					.scan_out(reg_ildq_wr_addr1_scanout),
					.dout(ipcc_ildq_wr_addr1),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ildq_wr_addr1_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__dmsff_32x__width_5 reg_ildq_wr_addr2   // ASYNC reset active low
                                (
					.scan_in(reg_ildq_wr_addr2_scanin),
					.scan_out(reg_ildq_wr_addr2_scanout),
					.dout(ipcc_ildq_wr_addr2),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ildq_wr_addr2_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__dmsff_32x__width_5 reg_ildq_wr_addr3   // ASYNC reset active low
                                (
					.scan_in(reg_ildq_wr_addr3_scanin),
					.scan_out(reg_ildq_wr_addr3_scanout),
					.dout(ipcc_ildq_wr_addr3),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ildq_wr_addr3_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__dmsff_32x__width_5 reg_ildq_wr_addr4   // ASYNC reset active low
                                (
					.scan_in(reg_ildq_wr_addr4_scanin),
					.scan_out(reg_ildq_wr_addr4_scanout),
					.dout(ipcc_ildq_wr_addr4),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ildq_wr_addr4_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__dmsff_32x__width_5 reg_ildq_wr_addr5   // ASYNC reset active low
                                (
					.scan_in(reg_ildq_wr_addr5_scanin),
					.scan_out(reg_ildq_wr_addr5_scanout),
					.dout(ipcc_ildq_wr_addr5),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ildq_wr_addr5_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__dmsff_32x__width_5 reg_ildq_wr_addr6   // ASYNC reset active low
                                (
					.scan_in(reg_ildq_wr_addr6_scanin),
					.scan_out(reg_ildq_wr_addr6_scanout),
					.dout(ipcc_ildq_wr_addr6),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ildq_wr_addr6_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__dmsff_32x__width_5 reg_ildq_wr_addr7   // ASYNC reset active low
                                (
					.scan_in(reg_ildq_wr_addr7_scanin),
					.scan_out(reg_ildq_wr_addr7_scanout),
					.dout(ipcc_ildq_wr_addr7),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ildq_wr_addr7_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_4 reg_ipdohq0_rd_addr  // ASYNC reset active low
                                (
					.scan_in(reg_ipdohq0_rd_addr_scanin),
					.scan_out(reg_ipdohq0_rd_addr_scanout),
					.dout(ipcc_ipdohq0_rd_addr[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ipdohq0_rd_addr_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_4 reg_ipdbhq0_rd_addr  // ASYNC reset active low
                                (
					.scan_in(reg_ipdbhq0_rd_addr_scanin),
					.scan_out(reg_ipdbhq0_rd_addr_scanout),
					.dout(ipcc_ipdbhq0_rd_addr[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ipdbhq0_rd_addr_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_4 reg_ipdohq1_rd_addr  // ASYNC reset active low
                                (
					.scan_in(reg_ipdohq1_rd_addr_scanin),
					.scan_out(reg_ipdohq1_rd_addr_scanout),
					.dout(ipcc_ipdohq1_rd_addr[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ipdohq1_rd_addr_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_4 reg_ipdbhq1_rd_addr  // ASYNC reset active low
                                (
					.scan_in(reg_ipdbhq1_rd_addr_scanin),
					.scan_out(reg_ipdbhq1_rd_addr_scanout),
					.dout(ipcc_ipdbhq1_rd_addr[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ipdbhq1_rd_addr_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_6 reg_ipdodq0_rd_addr  // ASYNC reset active low
                                (
					.scan_in(reg_ipdodq0_rd_addr_scanin),
					.scan_out(reg_ipdodq0_rd_addr_scanout),
					.dout(ipcc_ipdodq0_rd_addr[5:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ipdodq0_rd_addr_l[5:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_6 reg_ipdbdq0_rd_addr  // ASYNC reset active low
                                (
					.scan_in(reg_ipdbdq0_rd_addr_scanin),
					.scan_out(reg_ipdbdq0_rd_addr_scanout),
					.dout(ipcc_ipdbdq0_rd_addr[5:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ipdbdq0_rd_addr_l[5:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_6 reg_ipdodq1_rd_addr  // ASYNC reset active low
                                (
					.scan_in(reg_ipdodq1_rd_addr_scanin),
					.scan_out(reg_ipdodq1_rd_addr_scanout),
					.dout(ipcc_ipdodq1_rd_addr[5:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ipdodq1_rd_addr_l[5:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_6 reg_ipdbdq1_rd_addr  // ASYNC reset active low
                                (
					.scan_in(reg_ipdbdq1_rd_addr_scanin),
					.scan_out(reg_ipdbdq1_rd_addr_scanout),
					.dout(ipcc_ipdbdq1_rd_addr[5:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ipdbdq1_rd_addr_l[5:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_3 reg_curbank   // ASYNC reset active low
                                (
					.scan_in(reg_curbank_scanin),
					.scan_out(reg_curbank_scanout),
					.dout(curbank_r[2:0]),
                                      	.l1clk(l1clk),
					.en(cstate[`ARB]), 
                                      	.din(curbank[2:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_4 reg_dmu_tag   // ASYNC reset active low
                                (
					.scan_in(reg_dmu_tag_scanin),
					.scan_out(reg_dmu_tag_scanout),
					.dout(ipcc_ipcs_dmu_tag_pre[3:0]),
                                      	.l1clk(l1clk),
					.en(dmu_tag_en), 
                                      	.din(id[14:11]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_ipcc_ipcs_dmu_wrack_p_pre   // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ipcs_dmu_wrack_p_pre_scanin),
					.scan_out(reg_ipcc_ipcs_dmu_wrack_p_pre_scanout),
					.dout(ipcc_ipcs_dmu_wrack_p_pre),
                                      	.l1clk(l1clk),
					.en(dmu_tag_en), 
                                      	.din(ipcc_ipcs_dmu_wrack_p_l),
  .siclk(siclk),
  .soclk(soclk)
					);


sii_ipcc_ctlmsff_ctl_macro__width_1 reg_ipcc_ilc_cmd0  // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ilc_cmd0_scanin),
					.scan_out(reg_ipcc_ilc_cmd0_scanout),
					.dout(ipcc_ilc_cmd0),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ilc_cmd0_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_ipcc_ilc_cmd1  // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ilc_cmd1_scanin),
					.scan_out(reg_ipcc_ilc_cmd1_scanout),
					.dout(ipcc_ilc_cmd1),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ilc_cmd1_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_ipcc_ilc_cmd2  // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ilc_cmd2_scanin),
					.scan_out(reg_ipcc_ilc_cmd2_scanout),
					.dout(ipcc_ilc_cmd2),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ilc_cmd2_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_ipcc_ilc_cmd3  // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ilc_cmd3_scanin),
					.scan_out(reg_ipcc_ilc_cmd3_scanout),
					.dout(ipcc_ilc_cmd3),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ilc_cmd3_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_ipcc_ilc_cmd4  // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ilc_cmd4_scanin),
					.scan_out(reg_ipcc_ilc_cmd4_scanout),
					.dout(ipcc_ilc_cmd4),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ilc_cmd4_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_ipcc_ilc_cmd5  // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ilc_cmd5_scanin),
					.scan_out(reg_ipcc_ilc_cmd5_scanout),
					.dout(ipcc_ilc_cmd5),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ilc_cmd5_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_ipcc_ilc_cmd6  // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ilc_cmd6_scanin),
					.scan_out(reg_ipcc_ilc_cmd6_scanout),
					.dout(ipcc_ilc_cmd6),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ilc_cmd6_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_ipcc_ilc_cmd7  // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ilc_cmd7_scanin),
					.scan_out(reg_ipcc_ilc_cmd7_scanout),
					.dout(ipcc_ilc_cmd7),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ilc_cmd7_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_ipcc_ildq_wr_en0  // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ildq_wr_en0_scanin),
					.scan_out(reg_ipcc_ildq_wr_en0_scanout),
					.dout(ipcc_ildq_wr_en0),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ildq_wr_en0_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_ipcc_ildq_wr_en1  // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ildq_wr_en1_scanin),
					.scan_out(reg_ipcc_ildq_wr_en1_scanout),
					.dout(ipcc_ildq_wr_en1),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ildq_wr_en1_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_ipcc_ildq_wr_en2  // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ildq_wr_en2_scanin),
					.scan_out(reg_ipcc_ildq_wr_en2_scanout),
					.dout(ipcc_ildq_wr_en2),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ildq_wr_en2_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_ipcc_ildq_wr_en3  // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ildq_wr_en3_scanin),
					.scan_out(reg_ipcc_ildq_wr_en3_scanout),
					.dout(ipcc_ildq_wr_en3),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ildq_wr_en3_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_ipcc_ildq_wr_en4  // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ildq_wr_en4_scanin),
					.scan_out(reg_ipcc_ildq_wr_en4_scanout),
					.dout(ipcc_ildq_wr_en4),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ildq_wr_en4_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_ipcc_ildq_wr_en5  // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ildq_wr_en5_scanin),
					.scan_out(reg_ipcc_ildq_wr_en5_scanout),
					.dout(ipcc_ildq_wr_en5),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ildq_wr_en5_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_ipcc_ildq_wr_en6  // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ildq_wr_en6_scanin),
					.scan_out(reg_ipcc_ildq_wr_en6_scanout),
					.dout(ipcc_ildq_wr_en6),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ildq_wr_en6_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_ipcc_ildq_wr_en7  // ASYNC reset active low
                                (
					.scan_in(reg_ipcc_ildq_wr_en7_scanin),
					.scan_out(reg_ipcc_ildq_wr_en7_scanout),
					.dout(ipcc_ildq_wr_en7),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ildq_wr_en7_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_2 reg_arb1_hist  // ASYNC reset active low
                                (
                                        .scan_in(reg_arb1_hist_scanin),
                                        .scan_out(reg_arb1_hist_scanout),
                                        .dout(arb1_hist_r[1:0]),
                                        .l1clk(l1clk),
                                        .din(arb1_hist_l[1:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_dmu_hist  // ASYNC reset active low
                                (
                                        .scan_in(reg_dmu_hist_scanin),
                                        .scan_out(reg_dmu_hist_scanout),
                                        .dout(dmu_hist_r),
                                        .l1clk(l1clk),
                                        .din(dmu_hist_l),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_niu_hist  // ASYNC reset active low
                                (
                                        .scan_in(reg_niu_hist_scanin),
                                        .scan_out(reg_niu_hist_scanout),
                                        .dout(niu_hist_r),
                                        .l1clk(l1clk),
                                        .din(niu_hist_l),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__width_64 reg_syndrome  // ASYNC reset active low
                                (
                                        .scan_in(reg_syndrome_scanin),
                                        .scan_out(reg_syndrome_scanout),
                                        .dout(syndrome_r[63:0]),
//                                        .en (cmp_io_sync_en),
                                        .l1clk(l1clk),
                                        .din(syndrome_l[63:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );


sii_ipcc_ctlmsff_ctl_macro__width_1 reg_sending  // ASYNC reset active low
                                (
                                        .scan_in(reg_sending_scanin),
                                        .scan_out(reg_sending_scanout),
                                        .dout(sending_r),
                                        .l1clk(l1clk),
                                        .din(sending_l),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__width_7 reg_send_cnt  // ASYNC reset active low
                                (
                                        .scan_in(reg_send_cnt_scanin),
                                        .scan_out(reg_send_cnt_scanout),
                                        .dout(send_cnt_r[6:0]),
// 					.en (cmp_io_sync_en),
                                        .l1clk(l1clk),
                                        .din(send_cnt_l[6:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__width_6 reg_err_sig  // ASYNC reset active low
                                (
                                        .scan_in(reg_err_sig_scanin),
                                        .scan_out(reg_err_sig_scanout),
                                        .dout(err_sig_r[5:0]),
                                        .l1clk(l1clk),
                                        .din(err_sig_l[5:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__width_128 reg_tcu_serial_data  // ASYNC reset active low
                                (
                                        .scan_in(reg_tcu_serial_data_scanin),
                                        .scan_out(reg_tcu_serial_data_scanout),
                                        .dout(tcu_serial_data[127:0]),
                                        .l1clk(l1clk),
                                        .din(tcu_serial_data_l[127:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_tcu_go  // ASYNC reset active low
                                (
                                        .scan_in(reg_tcu_go_scanin),
                                        .scan_out(reg_tcu_go_scanout),
                                        .dout(tcu_go_hld),
                                        .l1clk(l1clk),
                                        .din(tcu_go_l),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__width_8 reg_tcu_rcv_cnt  // ASYNC reset active low
                                (
                                        .scan_in(reg_tcu_rcv_cnt_scanin),
                                        .scan_out(reg_tcu_rcv_cnt_scanout),
                                        .dout(tcu_rcv_cnt[7:0]),
                                        .l1clk(l1clk),
                                        .din(tcu_rcv_cnt_l[7:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_tcu_txfr_start  // ASYNC reset active low
                                (
                                        .scan_in(reg_tcu_txfr_start_scanin),
                                        .scan_out(reg_tcu_txfr_start_scanout),
                                        .dout(tcu_txfr_start_r),
                                        .l1clk(l1clk),
                                        .din(tcu_txfr_start_l),
  .siclk(siclk),
  .soclk(soclk)
                                        );


//---------------------------------------------------------------------
//	Synchronize between clock domain (cmp -> io)
//---------------------------------------------------------------------
sii_ipcc_ctlmsff_ctl_macro__width_1 reg_cmp_io_sync_en  // ASYNC reset active low
                                (
                                        .scan_in(reg_cmp_io_sync_en_scanin),
                                        .scan_out(reg_cmp_io_sync_en_scanout),
                                        .dout(cmp_io_sync_en),
                                        .l1clk(l1clk),
                                        .din(cmp_io_sync_en_in),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_io_cmp_sync_en  // ASYNC reset active low
                                (
                                        .scan_in(reg_io_cmp_sync_en_scanin),
                                        .scan_out(reg_io_cmp_sync_en_scanout),
                                        .dout(io_cmp_sync_en),
                                        .l1clk(l1clk),
                                        .din(io_cmp_sync_en_in),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__en_1__width_4 reg_sii_ncu_syn_data   // ASYNC reset active low
                                (
                                        .scan_in(reg_sii_ncu_syn_data_scanin),
                                        .scan_out(reg_sii_ncu_syn_data_scanout),
                                        .dout(sii_ncu_syn_data[3:0]),
                                        .en (cmp_io_sync_en),
                                        .l1clk(l1clk),
                                        .din(sii_ncu_syn_data_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_sii_ncu_syn_vld   // ASYNC reset active low
                                (
                                        .scan_in(reg_sii_ncu_syn_vld_scanin),
                                        .scan_out(reg_sii_ncu_syn_vld_scanout),
                                        .dout(sii_ncu_syn_vld),
                                        .en (cmp_io_sync_en),
                                        .l1clk(l1clk),
                                        .din(sii_ncu_syn_vld_l),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_dmuctag_ue_r  // ASYNC reset active low
                                (
					.scan_in(reg_dmuctag_ue_r_scanin),
					.scan_out(reg_dmuctag_ue_r_scanout),
					.dout(dmuctag_ue_r),
                                      	.l1clk(l1clk),
                                      	.din(dmuctag_ue_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_dmuctag_ue   // ASYNC reset active low
                                (
					.scan_in(reg_dmuctag_ue_scanin),
					.scan_out(reg_dmuctag_ue_scanout),
					.dout(sii_ncu_dmuctag_ue),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en), 
                                      	.din(dmuctag_ue_r),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_dmuctag_ce_r  // ASYNC reset active low
                                (
					.scan_in(reg_dmuctag_ce_r_scanin),
					.scan_out(reg_dmuctag_ce_r_scanout),
					.dout(dmuctag_ce_r),
                                      	.l1clk(l1clk),
                                      	.din(dmuctag_ce_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_dmuctag_ce   // ASYNC reset active low
                                (
					.scan_in(reg_dmuctag_ce_scanin),
					.scan_out(reg_dmuctag_ce_scanout),
					.dout(sii_ncu_dmuctag_ce),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en), 
                                      	.din(dmuctag_ce_r),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_dmua_pe_r  // ASYNC reset active low
                                (
					.scan_in(reg_dmua_pe_r_scanin),
					.scan_out(reg_dmua_pe_r_scanout),
					.dout(dmua_pe_r),
                                      	.l1clk(l1clk),
                                      	.din(dmua_pe_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_dmua_pe   // ASYNC reset active low
                                (
					.scan_in(reg_dmua_pe_scanin),
					.scan_out(reg_dmua_pe_scanout),
					.dout(sii_ncu_dmua_pe),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en), 
                                      	.din(dmua_pe_r),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_dmu_de_r  // ASYNC reset active low
                                (
					.scan_in(reg_dmu_de_r_scanin),
					.scan_out(reg_dmu_de_r_scanout),
					.dout(dmud_pe_r),
                                      	.l1clk(l1clk),
                                      	.din(dmud_pe_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_dmu_de   // ASYNC reset active low
                                (
					.scan_in(reg_dmu_de_scanin),
					.scan_out(reg_dmu_de_scanout),
					.dout(sii_ncu_dmud_pe),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en), 
                                      	.din(dmud_pe_r),
  .siclk(siclk),
  .soclk(soclk)
					);
//--

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_niuctag_ue_r  // ASYNC reset active low
                                (
					.scan_in(reg_niuctag_ue_r_scanin),
					.scan_out(reg_niuctag_ue_r_scanout),
					.dout(niuctag_ue_r),
                                      	.l1clk(l1clk),
                                      	.din(niuctag_ue_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_niuctag_ue   // ASYNC reset active low
                                (
					.scan_in(reg_niuctag_ue_scanin),
					.scan_out(reg_niuctag_ue_scanout),
					.dout(sii_ncu_niuctag_ue),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en), 
                                      	.din(niuctag_ue_r),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_niuctag_ce_r  // ASYNC reset active low
                                (
					.scan_in(reg_niuctag_ce_r_scanin),
					.scan_out(reg_niuctag_ce_r_scanout),
					.dout(niuctag_ce_r),
                                      	.l1clk(l1clk),
                                      	.din(niuctag_ce_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_niuctag_ce   // ASYNC reset active low
                                (
					.scan_in(reg_niuctag_ce_scanin),
					.scan_out(reg_niuctag_ce_scanout),
					.dout(sii_ncu_niuctag_ce),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en), 
                                      	.din(niuctag_ce_r),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_niua_pe_r  // ASYNC reset active low
                                (
					.scan_in(reg_niua_pe_r_scanin),
					.scan_out(reg_niua_pe_r_scanout),
					.dout(niua_pe_r),
                                      	.l1clk(l1clk),
                                      	.din(niua_pe_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_niua_pe   // ASYNC reset active low
                                (
					.scan_in(reg_niua_pe_scanin),
					.scan_out(reg_niua_pe_scanout),
					.dout(sii_ncu_niua_pe),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en), 
                                      	.din(niua_pe_r),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_niu_de_r  // ASYNC reset active low
                                (
					.scan_in(reg_niu_de_r_scanin),
					.scan_out(reg_niu_de_r_scanout),
					.dout(niud_pe_r),
                                      	.l1clk(l1clk),
                                      	.din(niud_pe_l),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_niu_de   // ASYNC reset active low
                                (
					.scan_in(reg_niu_de_scanin),
					.scan_out(reg_niu_de_scanout),
					.dout(sii_ncu_niud_pe),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en), 
                                      	.din(niud_pe_r),
  .siclk(siclk),
  .soclk(soclk)
					);


//---------------------------------------------------------------------
//	Synchronize between clock domain (io -> cmp)
//---------------------------------------------------------------------

sii_ipcc_ctlmsff_ctl_macro__en_1__width_4 reg_ipcs_ipdohq0_wr_addr   // ASYNC reset active low
                                (
                                        .scan_in(reg_ipcs_ipdohq0_wr_addr_scanin),
                                        .scan_out(reg_ipcs_ipdohq0_wr_addr_scanout),
                                        .dout(ipcs_ipdohq0_wr_addr_sync[3:0]),
                                        .l1clk(l1clk),
                                        .en(io_cmp_sync_en),
                                        .din(ipcs_ipdohq0_wr_addr[3:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__en_1__width_4 reg_ipcs_ipdbhq0_wr_addr   // ASYNC reset active low
                                (
                                        .scan_in(reg_ipcs_ipdbhq0_wr_addr_scanin),
                                        .scan_out(reg_ipcs_ipdbhq0_wr_addr_scanout),
                                        .dout(ipcs_ipdbhq0_wr_addr_sync[3:0]),
                                        .l1clk(l1clk),
                                        .en(io_cmp_sync_en),
                                        .din(ipcs_ipdbhq0_wr_addr[3:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__en_1__width_6 reg_ipcs_ipdodq0_wr_addr   // ASYNC reset active low
                                (
                                        .scan_in(reg_ipcs_ipdodq0_wr_addr_scanin),
                                        .scan_out(reg_ipcs_ipdodq0_wr_addr_scanout),
                                        .dout(ipcs_ipdodq0_wr_addr_sync[5:0]),
                                        .l1clk(l1clk),
                                        .en(io_cmp_sync_en),
                                        .din(ipcs_ipdodq0_wr_addr[5:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__en_1__width_6 reg_ipcs_ipdbdq0_wr_addr   // ASYNC reset active low
                                (
                                        .scan_in(reg_ipcs_ipdbdq0_wr_addr_scanin),
                                        .scan_out(reg_ipcs_ipdbdq0_wr_addr_scanout),
                                        .dout(ipcs_ipdbdq0_wr_addr_sync[5:0]),
                                        .l1clk(l1clk),
                                        .en(io_cmp_sync_en),
                                        .din(ipcs_ipdbdq0_wr_addr[5:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );


sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_ipcs_ipdohq0_wr_en   // ASYNC reset active low
                                (
                                        .scan_in(reg_ipcs_ipdohq0_wr_en_scanin),
                                        .scan_out(reg_ipcs_ipdohq0_wr_en_scanout),
                                        .dout(ipcs_ipdohq0_wr_en_sync),
                                        .l1clk(l1clk),
                                        .en(io_cmp_sync_en),
                                        .din(ipcs_ipdohq0_wr_en),
  .siclk(siclk),
  .soclk(soclk)
                                        );


sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_ipcs_ipdbhq0_wr_en   // ASYNC reset active low
                                (
                                        .scan_in(reg_ipcs_ipdbhq0_wr_en_scanin),
                                        .scan_out(reg_ipcs_ipdbhq0_wr_en_scanout),
                                        .dout(ipcs_ipdbhq0_wr_en_sync),
                                        .l1clk(l1clk),
                                        .en(io_cmp_sync_en),
                                        .din(ipcs_ipdbhq0_wr_en),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_ipcs_ipdodq0_wr_en   // ASYNC reset active low
                                (
                                        .scan_in(reg_ipcs_ipdodq0_wr_en_scanin),
                                        .scan_out(reg_ipcs_ipdodq0_wr_en_scanout),
                                        .dout(ipcs_ipdodq0_wr_en_sync),
                                        .l1clk(l1clk),
                                        .en(io_cmp_sync_en),
                                        .din(ipcs_ipdodq0_wr_en),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_ipcs_ipdbdq0_wr_en   // ASYNC reset active low
                                (
                                        .scan_in(reg_ipcs_ipdbdq0_wr_en_scanin),
                                        .scan_out(reg_ipcs_ipdbdq0_wr_en_scanout),
                                        .dout(ipcs_ipdbdq0_wr_en_sync),
                                        .l1clk(l1clk),
                                        .en(io_cmp_sync_en),
                                        .din(ipcs_ipdbdq0_wr_en),
  .siclk(siclk),
  .soclk(soclk)
                                        );


sii_ipcc_ctlmsff_ctl_macro__en_1__width_4 reg_ipcs_ipdohq1_wr_addr   // ASYNC reset active low
                                (
                                        .scan_in(reg_ipcs_ipdohq1_wr_addr_scanin),
                                        .scan_out(reg_ipcs_ipdohq1_wr_addr_scanout),
                                        .dout(ipcs_ipdohq1_wr_addr_sync[3:0]),
                                        .l1clk(l1clk),
                                        .en(io_cmp_sync_en),
                                        .din(ipcs_ipdohq1_wr_addr[3:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__en_1__width_4 reg_ipcs_ipdbhq1_wr_addr   // ASYNC reset active low
                                (
                                        .scan_in(reg_ipcs_ipdbhq1_wr_addr_scanin),
                                        .scan_out(reg_ipcs_ipdbhq1_wr_addr_scanout),
                                        .dout(ipcs_ipdbhq1_wr_addr_sync[3:0]),
                                        .l1clk(l1clk),
                                        .en(io_cmp_sync_en),
                                        .din(ipcs_ipdbhq1_wr_addr[3:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__en_1__width_6 reg_ipcs_ipdodq1_wr_addr   // ASYNC reset active low
                                (
                                        .scan_in(reg_ipcs_ipdodq1_wr_addr_scanin),
                                        .scan_out(reg_ipcs_ipdodq1_wr_addr_scanout),
                                        .dout(ipcs_ipdodq1_wr_addr_sync[5:0]),
                                        .l1clk(l1clk),
                                        .en(io_cmp_sync_en),
                                        .din(ipcs_ipdodq1_wr_addr[5:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__en_1__width_6 reg_ipcs_ipdbdq1_wr_addr   // ASYNC reset active low
                                (
                                        .scan_in(reg_ipcs_ipdbdq1_wr_addr_scanin),
                                        .scan_out(reg_ipcs_ipdbdq1_wr_addr_scanout),
                                        .dout(ipcs_ipdbdq1_wr_addr_sync[5:0]),
                                        .l1clk(l1clk),
                                        .en(io_cmp_sync_en),
                                        .din(ipcs_ipdbdq1_wr_addr[5:0]),
  .siclk(siclk),
  .soclk(soclk)
                                        );


sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_ipcs_ipdohq1_wr_en   // ASYNC reset active low
                                (
                                        .scan_in(reg_ipcs_ipdohq1_wr_en_scanin),
                                        .scan_out(reg_ipcs_ipdohq1_wr_en_scanout),
                                        .dout(ipcs_ipdohq1_wr_en_sync),
                                        .l1clk(l1clk),
                                        .en(io_cmp_sync_en),
                                        .din(ipcs_ipdohq1_wr_en),
  .siclk(siclk),
  .soclk(soclk)
                                        );


sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_ipcs_ipdbhq1_wr_en   // ASYNC reset active low
                                (
                                        .scan_in(reg_ipcs_ipdbhq1_wr_en_scanin),
                                        .scan_out(reg_ipcs_ipdbhq1_wr_en_scanout),
                                        .dout(ipcs_ipdbhq1_wr_en_sync),
                                        .l1clk(l1clk),
                                        .en(io_cmp_sync_en),
                                        .din(ipcs_ipdbhq1_wr_en),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_ipcs_ipdodq1_wr_en   // ASYNC reset active low
                                (
                                        .scan_in(reg_ipcs_ipdodq1_wr_en_scanin),
                                        .scan_out(reg_ipcs_ipdodq1_wr_en_scanout),
                                        .dout(ipcs_ipdodq1_wr_en_sync),
                                        .l1clk(l1clk),
                                        .en(io_cmp_sync_en),
                                        .din(ipcs_ipdodq1_wr_en),
  .siclk(siclk),
  .soclk(soclk)
                                        );

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_ipcs_ipdbdq1_wr_en   // ASYNC reset active low
                                (
                                        .scan_in(reg_ipcs_ipdbdq1_wr_en_scanin),
                                        .scan_out(reg_ipcs_ipdbdq1_wr_en_scanout),
                                        .dout(ipcs_ipdbdq1_wr_en_sync),
                                        .l1clk(l1clk),
                                        .en(io_cmp_sync_en),
                                        .din(ipcs_ipdbdq1_wr_en),
  .siclk(siclk),
  .soclk(soclk)
                                        );




sii_ipcc_ctlmsff_ctl_macro__en_1__width_16 reg_ipcs_ipcc_dmu_or_dep   // ASYNC reset active low
                                (
					.scan_in(reg_ipcs_ipcc_dmu_or_dep_scanin),
					.scan_out(reg_ipcs_ipcc_dmu_or_dep_scanout),
					.dout(ipcs_ipcc_dmu_or_dep_sync),
                                      	.l1clk(l1clk),
					.en(io_cmp_sync_en), 
                                      	.din(ipcs_ipcc_dmu_or_dep[15:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_16 reg_ipcs_ipcc_dmu_by_dep   // ASYNC reset active low
                                (
					.scan_in(reg_ipcs_ipcc_dmu_by_dep_scanin),
					.scan_out(reg_ipcs_ipcc_dmu_by_dep_scanout),
					.dout(ipcs_ipcc_dmu_by_dep_sync),
                                      	.l1clk(l1clk),
					.en(io_cmp_sync_en), 
                                      	.din(ipcs_ipcc_dmu_by_dep[15:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_16 reg_ipcs_ipcc_niu_or_dep   // ASYNC reset active low
                                (
					.scan_in(reg_ipcs_ipcc_niu_or_dep_scanin),
					.scan_out(reg_ipcs_ipcc_niu_or_dep_scanout),
					.dout(ipcs_ipcc_niu_or_dep_sync),
                                      	.l1clk(l1clk),
					.en(io_cmp_sync_en), 
                                      	.din(ipcs_ipcc_niu_or_dep[15:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_16 reg_ipcs_ipcc_niu_by_dep   // ASYNC reset active low
                                (
					.scan_in(reg_ipcs_ipcc_niu_by_dep_scanin),
					.scan_out(reg_ipcs_ipcc_niu_by_dep_scanout),
					.dout(ipcs_ipcc_niu_by_dep_sync),
                                      	.l1clk(l1clk),
					.en(io_cmp_sync_en), 
                                      	.din(ipcs_ipcc_niu_by_dep[15:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_add_dmu_or   // ASYNC reset active low
                                (
					.scan_in(reg_add_dmu_or_scanin),
					.scan_out(reg_add_dmu_or_scanout),
					.dout(add_dmu_or_pre),
                                      	.l1clk(l1clk),
					.en(io_cmp_sync_en), 
                                      	.din(ipcs_ipcc_add_dmu_or),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_add_dmu_by   // ASYNC reset active low
                                (
					.scan_in(reg_add_dmu_by_scanin),
					.scan_out(reg_add_dmu_by_scanout),
					.dout(add_dmu_by_pre),
                                      	.l1clk(l1clk),
					.en(io_cmp_sync_en), 
                                      	.din(ipcs_ipcc_add_dmu_by),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_add_niu_or   // ASYNC reset active low
                                (
					.scan_in(reg_add_niu_or_scanin),
					.scan_out(reg_add_niu_or_scanout),
					.dout(add_niu_or_pre),
                                      	.l1clk(l1clk),
					.en(io_cmp_sync_en), 
                                      	.din(ipcs_ipcc_add_niu_or),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_add_niu_by   // ASYNC reset active low
                                (
					.scan_in(reg_add_niu_by_scanin),
					.scan_out(reg_add_niu_by_scanout),
					.dout(add_niu_by_pre),
                                      	.l1clk(l1clk),
					.en(io_cmp_sync_en), 
                                      	.din(ipcs_ipcc_add_niu_by),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_ncu_sii_pm   // ASYNC reset active low
                                (
					.scan_in(reg_ncu_sii_pm_scanin),
					.scan_out(reg_ncu_sii_pm_scanout),
					.dout(ncu_sii_pm),
                                      	.l1clk(l1clk),
					.en(io_cmp_sync_en), 
                                      	.din(ncu_sii_pm_in),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_ncu_sii_ba01   // ASYNC reset active low
                                (
					.scan_in(reg_ncu_sii_ba01_scanin),
					.scan_out(reg_ncu_sii_ba01_scanout),
					.dout(ncu_sii_ba01),
                                      	.l1clk(l1clk),
					.en(io_cmp_sync_en), 
                                      	.din(ncu_sii_ba01_in),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_ncu_sii_ba23   // ASYNC reset active low
                                (
					.scan_in(reg_ncu_sii_ba23_scanin),
					.scan_out(reg_ncu_sii_ba23_scanout),
					.dout(ncu_sii_ba23),
                                      	.l1clk(l1clk),
					.en(io_cmp_sync_en), 
                                      	.din(ncu_sii_ba23_in),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_ncu_sii_ba45   // ASYNC reset active low
                                (
					.scan_in(reg_ncu_sii_ba45_scanin),
					.scan_out(reg_ncu_sii_ba45_scanout),
					.dout(ncu_sii_ba45),
                                      	.l1clk(l1clk),
					.en(io_cmp_sync_en), 
                                      	.din(ncu_sii_ba45_in),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_ncu_sii_ba67   // ASYNC reset active low
                                (
					.scan_in(reg_ncu_sii_ba67_scanin),
					.scan_out(reg_ncu_sii_ba67_scanout),
					.dout(ncu_sii_ba67),
                                      	.l1clk(l1clk),
					.en(io_cmp_sync_en), 
                                      	.din(ncu_sii_ba67_in),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_ncu_sii_l2_idx_hash_en   // ASYNC reset active low
                                (
					.scan_in(reg_ncu_sii_l2_idx_hash_en_scanin),
					.scan_out(reg_ncu_sii_l2_idx_hash_en_scanout),
					.dout(ncu_sii_l2_idx_hash_en),
                                      	.l1clk(l1clk),
					.en(io_cmp_sync_en), 
                                      	.din(ncu_sii_l2_idx_hash_en_in),
  .siclk(siclk),
  .soclk(soclk)
					);

//---------------------------------------------------------------------
//	Synchronize between clock domains (cmp -> io)
//---------------------------------------------------------------------

sii_ipcc_ctlmsff_ctl_macro__en_1__width_4 reg_ipcc_ipcs_dmu_tag   
                                (
					.scan_in(reg_ipcc_ipcs_dmu_tag_scanin),
					.scan_out(reg_ipcc_ipcs_dmu_tag_scanout),
					.dout(ipcc_ipcs_dmu_tag[3:0]),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en),
                                      	.din(ipcc_ipcs_dmu_tag_pre[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_ipcc_ipcs_wrack_lv   
                                (
					.scan_in(reg_ipcc_ipcs_wrack_lv_scanin),
					.scan_out(reg_ipcc_ipcs_wrack_lv_scanout),
					.dout(ipcc_ipcs_wrack_lv),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en),
                                      	.din(ipcc_ipcs_wrack_lv_pre),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_ipcc_ipcs_dmu_wrack_p   
                                (
					.scan_in(reg_ipcc_ipcs_dmu_wrack_p_scanin),
					.scan_out(reg_ipcc_ipcs_dmu_wrack_p_scanout),
					.dout(ipcc_ipcs_dmu_wrack_p),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en),
                                      	.din(ipcc_ipcs_dmu_wrack_p_pre),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_wrack_lv  // ASYNC reset active low
                                (
					.scan_in(reg_wrack_lv_scanin),
					.scan_out(reg_wrack_lv_scanout),
					.dout(ipcc_ipcs_wrack_lv_pre),
                                      	.l1clk(l1clk),
                                      	.din(dmu_tag_en_lv),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_dmu_wrm_mode  // ASYNC reset active low
                                (
					.scan_in(reg_dmu_wrm_mode_scanin),
					.scan_out(reg_dmu_wrm_mode_scanout),
					.dout(dmu_wrm_mode_r),
                                      	.l1clk(l1clk),
                                      	.din(dmu_wrm_mode),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_niu_wrm_mode  // ASYNC reset active low
                                (
					.scan_in(reg_niu_wrm_mode_scanin),
					.scan_out(reg_niu_wrm_mode_scanout),
					.dout(niu_wrm_mode_r),
                                      	.l1clk(l1clk),
                                      	.din(niu_wrm_mode),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_dmu_or_dq_pre  // ASYNC reset active low
                                (
					.scan_in(reg_dmu_or_dq_pre_scanin),
					.scan_out(reg_dmu_or_dq_pre_scanout),
					.dout(ipcc_ipcs_dmu_or_go_lv_pre),
                                      	.l1clk(l1clk),
                                      	.din(dmu_or_dq_lv),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_dmu_or_dq   // ASYNC reset active low
                                (
					.scan_in(reg_dmu_or_dq_scanin),
					.scan_out(reg_dmu_or_dq_scanout),
					.dout(ipcc_ipcs_dmu_or_go_lv),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en),
                                      	.din(ipcc_ipcs_dmu_or_go_lv_pre),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_dmu_by_dq_pre  // ASYNC reset active low
                                (
					.scan_in(reg_dmu_by_dq_pre_scanin),
					.scan_out(reg_dmu_by_dq_pre_scanout),
					.dout(ipcc_ipcs_dmu_by_go_lv_pre),
                                      	.l1clk(l1clk),
                                      	.din(dmu_by_dq_lv),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_dmu_by_dq   // ASYNC reset active low
                                (
					.scan_in(reg_dmu_by_dq_scanin),
					.scan_out(reg_dmu_by_dq_scanout),
					.dout(ipcc_ipcs_dmu_by_go_lv),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en),
                                      	.din(ipcc_ipcs_dmu_by_go_lv_pre),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_niu_or_dq_pre  // ASYNC reset active low
                                (
					.scan_in(reg_niu_or_dq_pre_scanin),
					.scan_out(reg_niu_or_dq_pre_scanout),
					.dout(ipcc_ipcs_niu_or_go_lv_pre),
                                      	.l1clk(l1clk),
                                      	.din(niu_or_dq_lv),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_niu_or_dq   // ASYNC reset active low
                                (
					.scan_in(reg_niu_or_dq_scanin),
					.scan_out(reg_niu_or_dq_scanout),
					.dout(ipcc_ipcs_niu_or_go_lv),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en),
                                      	.din(ipcc_ipcs_niu_or_go_lv_pre),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_niu_by_dq_pre  // ASYNC reset active low
                                (
					.scan_in(reg_niu_by_dq_pre_scanin),
					.scan_out(reg_niu_by_dq_pre_scanout),
					.dout(ipcc_ipcs_niu_by_go_lv_pre),
                                      	.l1clk(l1clk),
                                      	.din(niu_by_dq_lv),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 reg_niu_by_dq   // ASYNC reset active low
                                (
					.scan_in(reg_niu_by_dq_scanin),
					.scan_out(reg_niu_by_dq_scanout),
					.dout(ipcc_ipcs_niu_by_go_lv),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en),
                                      	.din(ipcc_ipcs_niu_by_go_lv_pre),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_4 reg_sync_dmu_or_rd_ptr_pre  // ASYNC reset active low
                                (
					.scan_in(reg_sync_dmu_or_rd_ptr_pre_scanin),
					.scan_out(reg_sync_dmu_or_rd_ptr_pre_scanout),
					.dout(ipcc_ipcs_dmu_or_ptr_pre[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ipdohq0_rd_addr_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_4 reg_sync_dmu_or_rd_ptr   // ASYNC reset active low
                                (
					.scan_in(reg_sync_dmu_or_rd_ptr_scanin),
					.scan_out(reg_sync_dmu_or_rd_ptr_scanout),
					.dout(ipcc_ipcs_dmu_or_ptr[3:0]),
                                      	.l1clk(l1clk),
				        .en(cmp_io_sync_en),
                                      	.din(ipcc_ipcs_dmu_or_ptr_pre[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_4 reg_sync_dmu_by_rd_ptr_pre  // ASYNC reset active low
                                (
					.scan_in(reg_sync_dmu_by_rd_ptr_pre_scanin),
					.scan_out(reg_sync_dmu_by_rd_ptr_pre_scanout),
					.dout(ipcc_ipcs_dmu_by_ptr_pre[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ipdbhq0_rd_addr_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_4 reg_sync_dmu_by_rd_ptr   // ASYNC reset active low
                                (
					.scan_in(reg_sync_dmu_by_rd_ptr_scanin),
					.scan_out(reg_sync_dmu_by_rd_ptr_scanout),
					.dout(ipcc_ipcs_dmu_by_ptr[3:0]),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en), 
                                      	.din(ipcc_ipcs_dmu_by_ptr_pre[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_4 reg_sync_niu_or_rd_ptr_pre  // ASYNC reset active low
                                (
					.scan_in(reg_sync_niu_or_rd_ptr_pre_scanin),
					.scan_out(reg_sync_niu_or_rd_ptr_pre_scanout),
					.dout(ipcc_ipcs_niu_or_ptr_pre[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ipdohq1_rd_addr_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_4 reg_sync_niu_or_rd_ptr   // ASYNC reset active low
                                (
					.scan_in(reg_sync_niu_or_rd_ptr_scanin),
					.scan_out(reg_sync_niu_or_rd_ptr_scanout),
					.dout(ipcc_ipcs_niu_or_ptr[3:0]),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en), 
                                      	.din(ipcc_ipcs_niu_or_ptr_pre[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_4 reg_sync_niu_by_rd_ptr_pre  // ASYNC reset active low
                                (
					.scan_in(reg_sync_niu_by_rd_ptr_pre_scanin),
					.scan_out(reg_sync_niu_by_rd_ptr_pre_scanout),
					.dout(ipcc_ipcs_niu_by_ptr_pre[3:0]),
                                      	.l1clk(l1clk),
                                      	.din(ipcc_ipdbhq1_rd_addr_l[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__en_1__width_4 reg_sync_niu_by_rd_ptr   // ASYNC reset active low
                                (
					.scan_in(reg_sync_niu_by_rd_ptr_scanin),
					.scan_out(reg_sync_niu_by_rd_ptr_scanout),
					.dout(ipcc_ipcs_niu_by_ptr[3:0]),
                                      	.l1clk(l1clk),
					.en(cmp_io_sync_en), 
                                      	.din(ipcc_ipcs_niu_by_ptr_pre[3:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_sii_mb1_run  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb1_run_scanin),
					.scan_out(reg_sii_mb1_run_scanout),
					.dout(sii_mb1_run_r),
                                     	.l1clk(l1clk),
                                    	.din(sii_mb1_run),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_6 reg_sii_mb1_addr  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb1_addr_scanin),
					.scan_out(reg_sii_mb1_addr_scanout),
					.dout(sii_mb1_addr_r[5:0]),
                                     	.l1clk(l1clk),
                                    	.din(sii_mb1_addr[5:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_sii_mb1_ipdohq0_rd_en  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb1_ipdohq0_rd_en_scanin),
					.scan_out(reg_sii_mb1_ipdohq0_rd_en_scanout),
					.dout(sii_mb1_ipdohq0_rd_en_r),
                                     	.l1clk(l1clk),
                                    	.din(sii_mb1_ipdohq0_rd_en),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_sii_mb1_ipdbhq0_rd_en  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb1_ipdbhq0_rd_en_scanin),
					.scan_out(reg_sii_mb1_ipdbhq0_rd_en_scanout),
					.dout(sii_mb1_ipdbhq0_rd_en_r),
                                     	.l1clk(l1clk),
                                    	.din(sii_mb1_ipdbhq0_rd_en),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_sii_mb1_ipdodq0_rd_en  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb1_ipdodq0_rd_en_scanin),
					.scan_out(reg_sii_mb1_ipdodq0_rd_en_scanout),
					.dout(sii_mb1_ipdodq0_rd_en_r),
                                     	.l1clk(l1clk),
                                    	.din(sii_mb1_ipdodq0_rd_en),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_sii_mb1_ipdbdq0_rd_en  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb1_ipdbdq0_rd_en_scanin),
					.scan_out(reg_sii_mb1_ipdbdq0_rd_en_scanout),
					.dout(sii_mb1_ipdbdq0_rd_en_r),
                                     	.l1clk(l1clk),
                                    	.din(sii_mb1_ipdbdq0_rd_en),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_sii_mb1_ipdohq1_rd_en  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb1_ipdohq1_rd_en_scanin),
					.scan_out(reg_sii_mb1_ipdohq1_rd_en_scanout),
					.dout(sii_mb1_ipdohq1_rd_en_r),
                                     	.l1clk(l1clk),
                                    	.din(sii_mb1_ipdohq1_rd_en),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_sii_mb1_ipdbhq1_rd_en  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb1_ipdbhq1_rd_en_scanin),
					.scan_out(reg_sii_mb1_ipdbhq1_rd_en_scanout),
					.dout(sii_mb1_ipdbhq1_rd_en_r),
                                     	.l1clk(l1clk),
                                    	.din(sii_mb1_ipdbhq1_rd_en),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_sii_mb1_ipdodq1_rd_en  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb1_ipdodq1_rd_en_scanin),
					.scan_out(reg_sii_mb1_ipdodq1_rd_en_scanout),
					.dout(sii_mb1_ipdodq1_rd_en_r),
                                     	.l1clk(l1clk),
                                    	.din(sii_mb1_ipdodq1_rd_en),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_sii_mb1_ipdbdq1_rd_en  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb1_ipdbdq1_rd_en_scanin),
					.scan_out(reg_sii_mb1_ipdbdq1_rd_en_scanout),
					.dout(sii_mb1_ipdbdq1_rd_en_r),
                                     	.l1clk(l1clk),
                                    	.din(sii_mb1_ipdbdq1_rd_en),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_sii_mb0_run  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb0_run_scanin),
					.scan_out(reg_sii_mb0_run_scanout),
					.dout(sii_mb0_run_r),
                                      	.l1clk(l1clk),
                                      	.din(sii_mb0_run),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_6 reg_sii_mb0_addr  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb0_addr_scanin),
					.scan_out(reg_sii_mb0_addr_scanout),
					.dout(sii_mb0_addr_r[5:0]),
                                      	.l1clk(l1clk),
                                      	.din(sii_mb0_addr[5:0]),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_sii_mb0_wr_en  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb0_wr_en_scanin),
					.scan_out(reg_sii_mb0_wr_en_scanout),
					.dout(sii_mb0_wr_en_r),
                                      	.l1clk(l1clk),
                                      	.din(sii_mb0_wr_en),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_sii_mb0_ind_wr_en  // ASYNC reset active low
                                (
					.scan_in(reg_sii_mb0_ind_wr_en_scanin),
					.scan_out(reg_sii_mb0_ind_wr_en_scanout),
					.dout(sii_mb0_ind_wr_en_r),
                                      	.l1clk(l1clk),
                                      	.din(sii_mb0_ind_wr_en),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_tcu_sii_data  // ASYNC reset active low
                                (
					.scan_in(reg_tcu_sii_data_scanin),
					.scan_out(reg_tcu_sii_data_scanout),
					.dout(tcu_sii_data_r),
                                      	.l1clk(l1clk),
                                      	.din(tcu_sii_data),
  .siclk(siclk),
  .soclk(soclk)
					);

sii_ipcc_ctlmsff_ctl_macro__width_1 reg_tcu_sii_vld  // ASYNC reset active low
                                (
					.scan_in(reg_tcu_sii_vld_scanin),
					.scan_out(reg_tcu_sii_vld_scanout),
					.dout(tcu_sii_vld_r),
                                      	.l1clk(l1clk),
                                      	.din(tcu_sii_vld),
  .siclk(siclk),
  .soclk(soclk)
					);

// fixscan start:
assign reg_gnt0_scanin           = reg_gnt_scanout          ;
assign reg_cstate_scanin         = reg_gnt0_scanout         ;
assign reg_err_ctag_pa_scanin    = reg_cstate_scanout       ;
assign reg_dma_wr_scanin         = reg_err_ctag_pa_scanout  ;
assign reg_wrm_scanin            = reg_dma_wr_scanout       ;
assign reg_l2_io_scanin          = reg_wrm_scanout          ;
assign reg_dmu_or_cnt_scanin     = reg_l2_io_scanout        ;
assign reg_dmu_by_cnt_scanin     = reg_dmu_or_cnt_scanout   ;
assign reg_niu_or_cnt_scanin     = reg_dmu_by_cnt_scanout   ;
assign reg_niu_by_cnt_scanin     = reg_niu_or_cnt_scanout   ;
assign reg_indq_wr_addr_scanin   = reg_niu_by_cnt_scanout   ;
assign reg_indq_wr_en_scanin     = reg_indq_wr_addr_scanout ;
assign reg_indq_wr_en_dly_scanin = reg_indq_wr_en_scanout   ;
assign reg_indq_wr_ovfl_scanin   = reg_indq_wr_en_dly_scanout;
assign reg_arb1_scanin           = reg_indq_wr_ovfl_scanout ;
assign reg_dmu_wrm_cnt_scanin    = reg_arb1_scanout         ;
assign reg_niu_wrm_cnt_scanin    = reg_dmu_wrm_cnt_scanout  ;
assign reg_dmu_or_wr_cnt_scanin  = reg_niu_wrm_cnt_scanout  ;
assign reg_dmu_by_wr_cnt_scanin  = reg_dmu_or_wr_cnt_scanout;
assign reg_niu_or_wr_cnt_scanin  = reg_dmu_by_wr_cnt_scanout;
assign reg_niu_by_wr_cnt_scanin  = reg_niu_or_wr_cnt_scanout;
assign reg_niu_by_wr_cnt_snap_scanin = reg_niu_by_wr_cnt_scanout;
assign reg_ildq_wr_addr0_scanin  = reg_niu_by_wr_cnt_snap_scanout;
assign reg_ildq_wr_addr1_scanin  = reg_ildq_wr_addr0_scanout;
assign reg_ildq_wr_addr2_scanin  = reg_ildq_wr_addr1_scanout;
assign reg_ildq_wr_addr3_scanin  = reg_ildq_wr_addr2_scanout;
assign reg_ildq_wr_addr4_scanin  = reg_ildq_wr_addr3_scanout;
assign reg_ildq_wr_addr5_scanin  = reg_ildq_wr_addr4_scanout;
assign reg_ildq_wr_addr6_scanin  = reg_ildq_wr_addr5_scanout;
assign reg_ildq_wr_addr7_scanin  = reg_ildq_wr_addr6_scanout;
assign reg_ipdohq0_rd_addr_scanin = reg_ildq_wr_addr7_scanout;
assign reg_ipdbhq0_rd_addr_scanin = reg_ipdohq0_rd_addr_scanout;
assign reg_ipdohq1_rd_addr_scanin = reg_ipdbhq0_rd_addr_scanout;
assign reg_ipdbhq1_rd_addr_scanin = reg_ipdohq1_rd_addr_scanout;
assign reg_ipdodq0_rd_addr_scanin = reg_ipdbhq1_rd_addr_scanout;
assign reg_ipdbdq0_rd_addr_scanin = reg_ipdodq0_rd_addr_scanout;
assign reg_ipdodq1_rd_addr_scanin = reg_ipdbdq0_rd_addr_scanout;
assign reg_ipdbdq1_rd_addr_scanin = reg_ipdodq1_rd_addr_scanout;
assign reg_curbank_scanin        = reg_ipdbdq1_rd_addr_scanout;
assign reg_dmu_tag_scanin        = reg_curbank_scanout      ;
assign reg_ipcc_ipcs_dmu_wrack_p_pre_scanin = reg_dmu_tag_scanout      ;
assign reg_ipcc_ilc_cmd0_scanin  = reg_ipcc_ipcs_dmu_wrack_p_pre_scanout;
assign reg_ipcc_ilc_cmd1_scanin  = reg_ipcc_ilc_cmd0_scanout;
assign reg_ipcc_ilc_cmd2_scanin  = reg_ipcc_ilc_cmd1_scanout;
assign reg_ipcc_ilc_cmd3_scanin  = reg_ipcc_ilc_cmd2_scanout;
assign reg_ipcc_ilc_cmd4_scanin  = reg_ipcc_ilc_cmd3_scanout;
assign reg_ipcc_ilc_cmd5_scanin  = reg_ipcc_ilc_cmd4_scanout;
assign reg_ipcc_ilc_cmd6_scanin  = reg_ipcc_ilc_cmd5_scanout;
assign reg_ipcc_ilc_cmd7_scanin  = reg_ipcc_ilc_cmd6_scanout;
assign reg_ipcc_ildq_wr_en0_scanin = reg_ipcc_ilc_cmd7_scanout;
assign reg_ipcc_ildq_wr_en1_scanin = reg_ipcc_ildq_wr_en0_scanout;
assign reg_ipcc_ildq_wr_en2_scanin = reg_ipcc_ildq_wr_en1_scanout;
assign reg_ipcc_ildq_wr_en3_scanin = reg_ipcc_ildq_wr_en2_scanout;
assign reg_ipcc_ildq_wr_en4_scanin = reg_ipcc_ildq_wr_en3_scanout;
assign reg_ipcc_ildq_wr_en5_scanin = reg_ipcc_ildq_wr_en4_scanout;
assign reg_ipcc_ildq_wr_en6_scanin = reg_ipcc_ildq_wr_en5_scanout;
assign reg_ipcc_ildq_wr_en7_scanin = reg_ipcc_ildq_wr_en6_scanout;
assign reg_arb1_hist_scanin      = reg_ipcc_ildq_wr_en7_scanout;
assign reg_dmu_hist_scanin       = reg_arb1_hist_scanout    ;
assign reg_niu_hist_scanin       = reg_dmu_hist_scanout     ;
assign reg_syndrome_scanin       = reg_niu_hist_scanout     ;
assign reg_sending_scanin        = reg_syndrome_scanout     ;
assign reg_send_cnt_scanin       = reg_sending_scanout      ;
assign reg_err_sig_scanin        = reg_send_cnt_scanout     ;
assign reg_tcu_serial_data_scanin = reg_err_sig_scanout      ;
assign reg_tcu_go_scanin         = reg_tcu_serial_data_scanout;
assign reg_tcu_rcv_cnt_scanin    = reg_tcu_go_scanout       ;
assign reg_tcu_txfr_start_scanin = reg_tcu_rcv_cnt_scanout  ;
assign reg_cmp_io_sync_en_scanin = reg_tcu_txfr_start_scanout;
assign reg_io_cmp_sync_en_scanin = reg_cmp_io_sync_en_scanout;
assign reg_sii_ncu_syn_data_scanin = reg_io_cmp_sync_en_scanout;
assign reg_sii_ncu_syn_vld_scanin = reg_sii_ncu_syn_data_scanout;
assign reg_dmuctag_ue_r_scanin   = reg_sii_ncu_syn_vld_scanout;
assign reg_dmuctag_ue_scanin     = reg_dmuctag_ue_r_scanout ;
assign reg_dmuctag_ce_r_scanin   = reg_dmuctag_ue_scanout   ;
assign reg_dmuctag_ce_scanin     = reg_dmuctag_ce_r_scanout ;
assign reg_dmua_pe_r_scanin      = reg_dmuctag_ce_scanout   ;
assign reg_dmua_pe_scanin        = reg_dmua_pe_r_scanout    ;
assign reg_dmu_de_r_scanin       = reg_dmua_pe_scanout      ;
assign reg_dmu_de_scanin         = reg_dmu_de_r_scanout     ;
assign reg_niuctag_ue_r_scanin   = reg_dmu_de_scanout       ;
assign reg_niuctag_ue_scanin     = reg_niuctag_ue_r_scanout ;
assign reg_niuctag_ce_r_scanin   = reg_niuctag_ue_scanout   ;
assign reg_niuctag_ce_scanin     = reg_niuctag_ce_r_scanout ;
assign reg_niua_pe_r_scanin      = reg_niuctag_ce_scanout   ;
assign reg_niua_pe_scanin        = reg_niua_pe_r_scanout    ;
assign reg_niu_de_r_scanin       = reg_niua_pe_scanout      ;
assign reg_niu_de_scanin         = reg_niu_de_r_scanout     ;
assign reg_ipcs_ipdohq0_wr_addr_scanin = reg_niu_de_scanout       ;
assign reg_ipcs_ipdbhq0_wr_addr_scanin = reg_ipcs_ipdohq0_wr_addr_scanout;
assign reg_ipcs_ipdodq0_wr_addr_scanin = reg_ipcs_ipdbhq0_wr_addr_scanout;
assign reg_ipcs_ipdbdq0_wr_addr_scanin = reg_ipcs_ipdodq0_wr_addr_scanout;
assign reg_ipcs_ipdohq0_wr_en_scanin = reg_ipcs_ipdbdq0_wr_addr_scanout;
assign reg_ipcs_ipdbhq0_wr_en_scanin = reg_ipcs_ipdohq0_wr_en_scanout;
assign reg_ipcs_ipdodq0_wr_en_scanin = reg_ipcs_ipdbhq0_wr_en_scanout;
assign reg_ipcs_ipdbdq0_wr_en_scanin = reg_ipcs_ipdodq0_wr_en_scanout;
assign reg_ipcs_ipdohq1_wr_addr_scanin = reg_ipcs_ipdbdq0_wr_en_scanout;
assign reg_ipcs_ipdbhq1_wr_addr_scanin = reg_ipcs_ipdohq1_wr_addr_scanout;
assign reg_ipcs_ipdodq1_wr_addr_scanin = reg_ipcs_ipdbhq1_wr_addr_scanout;
assign reg_ipcs_ipdbdq1_wr_addr_scanin = reg_ipcs_ipdodq1_wr_addr_scanout;
assign reg_ipcs_ipdohq1_wr_en_scanin = reg_ipcs_ipdbdq1_wr_addr_scanout;
assign reg_ipcs_ipdbhq1_wr_en_scanin = reg_ipcs_ipdohq1_wr_en_scanout;
assign reg_ipcs_ipdodq1_wr_en_scanin = reg_ipcs_ipdbhq1_wr_en_scanout;
assign reg_ipcs_ipdbdq1_wr_en_scanin = reg_ipcs_ipdodq1_wr_en_scanout;
assign reg_ipcs_ipcc_dmu_or_dep_scanin = reg_ipcs_ipdbdq1_wr_en_scanout;
assign reg_ipcs_ipcc_dmu_by_dep_scanin = reg_ipcs_ipcc_dmu_or_dep_scanout;
assign reg_ipcs_ipcc_niu_or_dep_scanin = reg_ipcs_ipcc_dmu_by_dep_scanout;
assign reg_ipcs_ipcc_niu_by_dep_scanin = reg_ipcs_ipcc_niu_or_dep_scanout;
assign reg_add_dmu_or_scanin     = reg_ipcs_ipcc_niu_by_dep_scanout;
assign reg_add_dmu_by_scanin     = reg_add_dmu_or_scanout   ;
assign reg_add_niu_or_scanin     = reg_add_dmu_by_scanout   ;
assign reg_add_niu_by_scanin     = reg_add_niu_or_scanout   ;
assign reg_ncu_sii_pm_scanin     = reg_add_niu_by_scanout   ;
assign reg_ncu_sii_ba01_scanin   = reg_ncu_sii_pm_scanout   ;
assign reg_ncu_sii_ba23_scanin   = reg_ncu_sii_ba01_scanout ;
assign reg_ncu_sii_ba45_scanin   = reg_ncu_sii_ba23_scanout ;
assign reg_ncu_sii_ba67_scanin   = reg_ncu_sii_ba45_scanout ;
assign reg_ncu_sii_l2_idx_hash_en_scanin = reg_ncu_sii_ba67_scanout ;
assign reg_ipcc_ipcs_dmu_tag_scanin = reg_ncu_sii_l2_idx_hash_en_scanout;
assign reg_ipcc_ipcs_wrack_lv_scanin = reg_ipcc_ipcs_dmu_tag_scanout;
assign reg_ipcc_ipcs_dmu_wrack_p_scanin = reg_ipcc_ipcs_wrack_lv_scanout;
assign reg_wrack_lv_scanin       = reg_ipcc_ipcs_dmu_wrack_p_scanout;
assign reg_dmu_wrm_mode_scanin   = reg_wrack_lv_scanout     ;
assign reg_niu_wrm_mode_scanin   = reg_dmu_wrm_mode_scanout ;
assign reg_dmu_or_dq_pre_scanin  = reg_niu_wrm_mode_scanout ;
assign reg_dmu_or_dq_scanin      = reg_dmu_or_dq_pre_scanout;
assign reg_dmu_by_dq_pre_scanin  = reg_dmu_or_dq_scanout    ;
assign reg_dmu_by_dq_scanin      = reg_dmu_by_dq_pre_scanout;
assign reg_niu_or_dq_pre_scanin  = reg_dmu_by_dq_scanout    ;
assign reg_niu_or_dq_scanin      = reg_niu_or_dq_pre_scanout;
assign reg_niu_by_dq_pre_scanin  = reg_niu_or_dq_scanout    ;
assign reg_niu_by_dq_scanin      = reg_niu_by_dq_pre_scanout;
assign reg_sync_dmu_or_rd_ptr_pre_scanin = reg_niu_by_dq_scanout    ;
assign reg_sync_dmu_or_rd_ptr_scanin = reg_sync_dmu_or_rd_ptr_pre_scanout;
assign reg_sync_dmu_by_rd_ptr_pre_scanin = reg_sync_dmu_or_rd_ptr_scanout;
assign reg_sync_dmu_by_rd_ptr_scanin = reg_sync_dmu_by_rd_ptr_pre_scanout;
assign reg_sync_niu_or_rd_ptr_pre_scanin = reg_sync_dmu_by_rd_ptr_scanout;
assign reg_sync_niu_or_rd_ptr_scanin = reg_sync_niu_or_rd_ptr_pre_scanout;
assign reg_sync_niu_by_rd_ptr_pre_scanin = reg_sync_niu_or_rd_ptr_scanout;
assign reg_sync_niu_by_rd_ptr_scanin = reg_sync_niu_by_rd_ptr_pre_scanout;
assign reg_sii_mb1_run_scanin    = reg_sync_niu_by_rd_ptr_scanout;
assign reg_sii_mb1_addr_scanin   = reg_sii_mb1_run_scanout  ;
assign reg_sii_mb1_ipdohq0_rd_en_scanin = reg_sii_mb1_addr_scanout ;
assign reg_sii_mb1_ipdbhq0_rd_en_scanin = reg_sii_mb1_ipdohq0_rd_en_scanout;
assign reg_sii_mb1_ipdodq0_rd_en_scanin = reg_sii_mb1_ipdbhq0_rd_en_scanout;
assign reg_sii_mb1_ipdbdq0_rd_en_scanin = reg_sii_mb1_ipdodq0_rd_en_scanout;
assign reg_sii_mb1_ipdohq1_rd_en_scanin = reg_sii_mb1_ipdbdq0_rd_en_scanout;
assign reg_sii_mb1_ipdbhq1_rd_en_scanin = reg_sii_mb1_ipdohq1_rd_en_scanout;
assign reg_sii_mb1_ipdodq1_rd_en_scanin = reg_sii_mb1_ipdbhq1_rd_en_scanout;
assign reg_sii_mb1_ipdbdq1_rd_en_scanin = reg_sii_mb1_ipdodq1_rd_en_scanout;
assign reg_sii_mb0_run_scanin    = reg_sii_mb1_ipdbdq1_rd_en_scanout;
assign reg_sii_mb0_addr_scanin   = reg_sii_mb0_run_scanout  ;
assign reg_sii_mb0_wr_en_scanin  = reg_sii_mb0_addr_scanout ;
assign reg_sii_mb0_ind_wr_en_scanin = reg_sii_mb0_wr_en_scanout;
assign reg_tcu_sii_data_scanin   = reg_sii_mb0_ind_wr_en_scanout;
assign reg_tcu_sii_vld_scanin    = reg_tcu_sii_data_scanout ;
assign scan_out                  = reg_tcu_sii_vld_scanout  ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module sii_ipcc_ctll1clkhdr_ctl_macro (
  l2clk, 
  l1en, 
  pce_ov, 
  stop, 
  se, 
  l1clk);


  input l2clk;
  input l1en;
  input pce_ov;
  input stop;
  input se;
  output l1clk;



 

cl_sc1_l1hdr_8x c_0 (


   .l2clk(l2clk),
   .pce(l1en),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);



endmodule













// any PARAMS parms go into naming of macro

module sii_ipcc_ctlmsff_ctl_macro__en_1__width_5 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = (din[4:0] & {5{en}}) | (dout[4:0] & ~{5{en}});






dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_ipcc_ctlmsff_ctl_macro__width_14 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [13:0] fdin;
wire [12:0] so;

  input [13:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [13:0] dout;
  output scan_out;
assign fdin[13:0] = din[13:0];






dff #(14)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[13:0]),
.si({scan_in,so[12:0]}),
.so({so[12:0],scan_out}),
.q(dout[13:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_ipcc_ctlmsff_ctl_macro__en_1__width_56 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [55:0] fdin;
wire [54:0] so;

  input [55:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [55:0] dout;
  output scan_out;
assign fdin[55:0] = (din[55:0] & {56{en}}) | (dout[55:0] & ~{56{en}});






dff #(56)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[55:0]),
.si({scan_in,so[54:0]}),
.so({so[54:0],scan_out}),
.q(dout[55:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_ipcc_ctlmsff_ctl_macro__width_1 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_ipcc_ctlmsff_ctl_macro__en_1__width_1 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}}) | (dout[0:0] & ~{1{en}});






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_ipcc_ctlmsff_ctl_macro__width_5 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = din[4:0];






dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_ipcc_ctlmsff_ctl_macro__width_6 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0];






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_ipcc_ctlmsff_ctl_macro__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_ipcc_ctlmsff_ctl_macro__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_ipcc_ctlmsff_ctl_macro__dmsff_32x__width_5 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = din[4:0];






dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_ipcc_ctlmsff_ctl_macro__en_1__width_3 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = (din[2:0] & {3{en}}) | (dout[2:0] & ~{3{en}});






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_ipcc_ctlmsff_ctl_macro__en_1__width_4 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = (din[3:0] & {4{en}}) | (dout[3:0] & ~{4{en}});






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_ipcc_ctlmsff_ctl_macro__width_64 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = din[63:0];






dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_ipcc_ctlmsff_ctl_macro__width_7 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [5:0] so;

  input [6:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = din[6:0];






dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_ipcc_ctlmsff_ctl_macro__width_128 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = din[127:0];






dff #(128)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[127:0]),
.si({scan_in,so[126:0]}),
.so({so[126:0],scan_out}),
.q(dout[127:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_ipcc_ctlmsff_ctl_macro__width_8 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0];






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_ipcc_ctlmsff_ctl_macro__en_1__width_6 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = (din[5:0] & {6{en}}) | (dout[5:0] & ~{6{en}});






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_ipcc_ctlmsff_ctl_macro__en_1__width_16 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = (din[15:0] & {16{en}}) | (dout[15:0] & ~{16{en}});






dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);












endmodule








