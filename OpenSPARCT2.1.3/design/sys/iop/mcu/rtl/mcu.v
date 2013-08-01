// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu.v
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
module mcu (
  mcu_fsr0_data, 
  mcu_fsr1_data, 
  mcu_fsr0_cfgpll_enpll, 
  mcu_fsr1_cfgpll_enpll, 
  mcu_fsr01_cfgpll_lb, 
  mcu_fsr01_cfgpll_mpy, 
  mcu_fsr0_cfgrx_enrx, 
  mcu_fsr1_cfgrx_enrx, 
  mcu_fsr0_cfgrx_entest, 
  mcu_fsr1_cfgrx_entest, 
  mcu_fsr0_cfgrx_align, 
  mcu_fsr1_cfgrx_align, 
  mcu_fsr0_cfgrx_invpair, 
  mcu_fsr1_cfgrx_invpair, 
  mcu_fsr01_cfgrx_eq, 
  mcu_fsr01_cfgrx_cdr, 
  mcu_fsr01_cfgrx_term, 
  mcu_fsr0_cfgtx_entx, 
  mcu_fsr1_cfgtx_entx, 
  mcu_fsr0_cfgtx_entest, 
  mcu_fsr1_cfgtx_entest, 
  mcu_fsr0_cfgtx_enidl, 
  mcu_fsr1_cfgtx_enidl, 
  mcu_fsr0_cfgtx_invpair, 
  mcu_fsr1_cfgtx_invpair, 
  mcu_fsr0_cfgtx_bstx, 
  mcu_fsr1_cfgtx_bstx, 
  mcu_fsr01_cfgtx_enftp, 
  mcu_fsr01_cfgtx_de, 
  mcu_fsr01_cfgtx_swing, 
  mcu_fsr01_cfgtx_cm, 
  mcu_fsr01_cfgrtx_rate, 
  mcu_fsr0_testcfg, 
  mcu_fsr1_testcfg, 
  mcu_l2t0_data_vld_r0, 
  mcu_l2t0_rd_ack, 
  mcu_l2t0_scb_mecc_err, 
  mcu_l2t0_scb_secc_err, 
  mcu_l2t0_wr_ack, 
  mcu_l2t0_qword_id_r0, 
  mcu_l2t0_mecc_err_r3, 
  mcu_l2t0_rd_req_id_r0, 
  mcu_l2t0_secc_err_r3, 
  mcu_l2t1_data_vld_r0, 
  mcu_l2t1_rd_ack, 
  mcu_l2t1_scb_mecc_err, 
  mcu_l2t1_scb_secc_err, 
  mcu_l2t1_wr_ack, 
  mcu_l2t1_qword_id_r0, 
  mcu_l2t1_mecc_err_r3, 
  mcu_l2t1_rd_req_id_r0, 
  mcu_l2t1_secc_err_r3, 
  mcu_l2b_data_r3, 
  mcu_l2b_ecc_r3, 
  mcu_pt_sync_out, 
  mcu_ncu_data, 
  mcu_ncu_stall, 
  mcu_ncu_vld, 
  mcu_ncu_ecc, 
  mcu_ncu_fbr, 
  mcu_dbg1_rd_req_in_0, 
  mcu_dbg1_rd_req_in_1, 
  mcu_dbg1_rd_req_out, 
  mcu_dbg1_wr_req_in_0, 
  mcu_dbg1_wr_req_in_1, 
  mcu_dbg1_wr_req_out, 
  mcu_dbg1_mecc_err, 
  mcu_dbg1_secc_err, 
  mcu_dbg1_fbd_err, 
  mcu_dbg1_err_mode, 
  mcu_dbg1_crc21, 
  mcu_dbg1_err_event, 
  fsr0_mcu_rxbclk, 
  fsr1_mcu_rxbclk, 
  fsr0_mcu_data, 
  fsr1_mcu_data, 
  fsr0_mcu_stspll_lock, 
  fsr1_mcu_stspll_lock, 
  fsr0_mcu_stsrx_testfail, 
  fsr1_mcu_stsrx_testfail, 
  fsr0_mcu_stsrx_sync, 
  fsr1_mcu_stsrx_sync, 
  fsr0_mcu_stsrx_losdtct, 
  fsr1_mcu_stsrx_losdtct, 
  fsr0_mcu_stsrx_bsrxp, 
  fsr1_mcu_stsrx_bsrxp, 
  fsr0_mcu_stsrx_bsrxn, 
  fsr1_mcu_stsrx_bsrxn, 
  fsr0_mcu_ststx_testfail, 
  fsr1_mcu_ststx_testfail, 
  ncu_mcu_data, 
  ncu_mcu_stall, 
  ncu_mcu_vld, 
  ncu_mcu_ecci, 
  ncu_mcu_fbui, 
  ncu_mcu_fbri, 
  ncu_mcu_pm, 
  ncu_mcu_ba01, 
  ncu_mcu_ba23, 
  ncu_mcu_ba45, 
  ncu_mcu_ba67, 
  l2b0_mcu_data_mecc_r5, 
  l2b0_mcu_data_vld_r5, 
  l2b0_mcu_wr_data_r5, 
  l2t0_mcu_addr_39to7, 
  l2t0_mcu_addr_5, 
  l2t0_mcu_rd_dummy_req, 
  l2t0_mcu_rd_req, 
  l2t0_mcu_rd_req_id, 
  l2t0_mcu_wr_req, 
  l2b1_mcu_data_mecc_r5, 
  l2b1_mcu_data_vld_r5, 
  l2b1_mcu_wr_data_r5, 
  l2t1_mcu_addr_39to7, 
  l2t1_mcu_addr_5, 
  l2t1_mcu_rd_dummy_req, 
  l2t1_mcu_rd_req, 
  l2t1_mcu_rd_req_id, 
  l2t1_mcu_wr_req, 
  mcu_pt_sync_in0, 
  mcu_pt_sync_in1, 
  mcu_pt_sync_in2, 
  mcu_id, 
  tcu_mbist_bisi_en, 
  tcu_mbist_user_mode, 
  tcu_mcu_mbist_start, 
  mcu_tcu_mbist_done, 
  mcu_tcu_mbist_fail, 
  tcu_mcu_mbist_scan_in, 
  mcu_tcu_mbist_scan_out, 
  tcu_sbs_scan_en, 
  tcu_sbs_aclk, 
  tcu_sbs_bclk, 
  tcu_sbs_clk, 
  tcu_sbs_uclk, 
  mcu_sbs_scan_in, 
  mcu_sbs_scan_out, 
  ccu_dr_sync_en, 
  ccu_io_cmp_sync_en, 
  ccu_cmp_io_sync_en, 
  rst_mcu_selfrsh, 
  rst_wmr_protect, 
  scan_in, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_mcu_clk_stop, 
  tcu_mcu_dr_clk_stop, 
  tcu_mcu_io_clk_stop, 
  tcu_pce_ov, 
  tcu_dectest, 
  tcu_muxtest, 
  tcu_mcu_testmode, 
  tcu_mcu_fbd_clk_stop, 
  tcu_scan_en, 
  tcu_se_scancollar_in, 
  tcu_array_wr_inhibit, 
  tcu_array_bypass, 
  tcu_atpg_mode, 
  scan_out, 
  tcu_div_bypass, 
  ccu_io_out, 
  ccu_serdes_dtm, 
  dr_gclk, 
  gclk);
wire clkgen_cmp_scanin;
wire clkgen_cmp_scanout;
wire l2clk;
wire cmp_io_sync_en;
wire io_cmp_sync_en;
wire cmp_pce_ov;
wire io2x_sync_en_unused;
wire cmp_wmr_unused;
wire cmp_por_unused;
wire cmp_wmr_protect_unused;
wire cmp_aclk_wmr_unused;
wire cmp_array_wr_inhibit;
wire clkgen_dr_scanin;
wire clkgen_dr_scanout;
wire drl2clk;
wire dr_pce_ov;
wire dr_cmp_slow_sync_en_unused;
wire dr_slow_cmp_sync_en_unused;
wire dr_wmr_unused;
wire dr_por_unused;
wire dr_aclk_unused;
wire dr_bclk_unused;
wire aclk_wmr;
wire dr_array_wr_inhibit;
wire clkgen_io_scanin;
wire clkgen_io_scanout;
wire iol2clk;
wire io_pce_ov;
wire io_cmp_slow_sync_en_unused;
wire io_slow_cmp_sync_en_unused;
wire io_wmr_unused;
wire io_por_unused;
wire io_wmr_protect_unused;
wire io_aclk_unused;
wire io_bclk_unused;
wire io_aclk_wmr_unused;
wire io_awi_unused;
wire l2if0_scanin;
wire l2if0_scanout;
wire aclk;
wire bclk;
wire drq0_rdq_free;
wire [7:0] woq0_wdq_entry_free;
wire [3:0] mcu_ucb_rd_req_in_0;
wire mcu_ucb_wr_req_in_0;
wire l2if0_rd_dummy_req;
wire l2if0_rd_dummy_req_addr5;
wire [2:0] l2if0_rd_dummy_req_id;
wire l2if0_rd_dummy_addr_err;
wire rdpctl0_dummy_data_valid;
wire l2if0_mcu_data_mecc;
wire [2:0] l2if0_data_wr_addr;
wire l2if0_wdq_rd_inh;
wire l2if0_wr_req;
wire l2if0_rd_req;
wire [1:0] l2if0_wdq_we;
wire [4:0] l2if0_wdq_wadr;
wire [3:0] l2if0_wdq_in_cntr;
wire l2if0_rd_rank_adr;
wire [2:0] l2if0_rd_dimm_adr;
wire [2:0] l2if0_rd_bank_adr;
wire [14:0] l2if0_rd_ras_adr;
wire [10:0] l2if0_rd_cas_adr;
wire l2if0_rd_addr_err;
wire l2if0_rd_addr_parity;
wire [2:0] l2if0_rd_req_id;
wire l2if0_wr_rank_adr;
wire [2:0] l2if0_wr_dimm_adr;
wire [2:0] l2if0_wr_bank_adr;
wire [14:0] l2if0_wr_ras_adr;
wire [10:0] l2if0_wr_cas_adr;
wire l2if0_wr_addr_err;
wire l2if0_wr_addr_parity;
wire mbist_wdqrf00_wr_en;
wire mbist_wdqrf01_wr_en;
wire [7:0] mbist_wdata;
wire dr_sync_en;
wire l2if1_scanin;
wire l2if1_scanout;
wire drq1_rdq_free;
wire [7:0] woq1_wdq_entry_free;
wire [3:0] mcu_ucb_rd_req_in_1;
wire mcu_ucb_wr_req_in_1;
wire l2if1_rd_dummy_req;
wire l2if1_rd_dummy_req_addr5;
wire [2:0] l2if1_rd_dummy_req_id;
wire l2if1_rd_dummy_addr_err;
wire rdpctl1_dummy_data_valid;
wire l2if1_mcu_data_mecc;
wire [2:0] l2if1_data_wr_addr;
wire l2if1_wdq_rd_inh;
wire l2if1_wr_req;
wire l2if1_rd_req;
wire [1:0] l2if1_wdq_we;
wire [4:0] l2if1_wdq_wadr;
wire [3:0] l2if1_wdq_in_cntr;
wire l2if1_rd_rank_adr;
wire [2:0] l2if1_rd_dimm_adr;
wire [2:0] l2if1_rd_bank_adr;
wire [14:0] l2if1_rd_ras_adr;
wire [10:0] l2if1_rd_cas_adr;
wire l2if1_rd_addr_err;
wire l2if1_rd_addr_parity;
wire [2:0] l2if1_rd_req_id;
wire l2if1_wr_rank_adr;
wire [2:0] l2if1_wr_dimm_adr;
wire [2:0] l2if1_wr_bank_adr;
wire [14:0] l2if1_wr_ras_adr;
wire [10:0] l2if1_wr_cas_adr;
wire l2if1_wr_addr_err;
wire l2if1_wr_addr_parity;
wire mbist_wdqrf10_wr_en;
wire mbist_wdqrf11_wr_en;
wire drif_wmr_scanin;
wire drif_wmr_scanout;
wire drif_scanin;
wire drif_scanout;
wire ucb_scanin;
wire ucb_scanout;
wire ucb_mcu_rd_req_vld;
wire ucb_mcu_wr_req_vld;
wire mcu_ucb_ack_vld;
wire mcu_ucb_nack_vld;
wire [63:0] mcu_ucb_data;
wire rdata_err_intr;
wire rdata_scanin;
wire rdata_scanout;
wire [6:0] wdrqf00_data;
wire wdqrf00_data_mecc;
wire [6:0] wdrqf01_data;
wire wdqrf01_data_mecc;
wire [6:0] wdrqf10_data;
wire wdqrf10_data_mecc;
wire [6:0] wdrqf11_data;
wire wdqrf11_data_mecc;
wire [71:0] mbist_read_data;
wire mcu_l2t0_data_vld_r0_unused;
wire [1:0] mcu_l2t0_qword_id_r0_unused;
wire [2:0] mcu_l2t0_rd_req_id_r0_unused;
wire mcu_l2t1_data_vld_r0_unused;
wire [1:0] mcu_l2t1_qword_id_r0_unused;
wire [2:0] mcu_l2t1_rd_req_id_r0_unused;
wire rdpctl_wmr_scanin;
wire rdpctl_wmr_scanout;
wire rdpctl_scanin;
wire rdpctl_scanout;
wire [63:0] drif_ucb_data;
wire fdout_scanin;
wire fdout_scanout;
wire fdoklu_scanin;
wire fdoklu_scanout;
wire fbdic_wmr_scanin;
wire fbdic_wmr_scanout;
wire fbdic_scanin;
wire fbdic_scanout;
wire fbdtm_scanin;
wire fbdtm_scanout;
wire fbdtm_wmr_scanin;
wire fbdtm_wmr_scanout;
wire [143:0] fbdird0_data;
wire [13:0] fdout0_frame_lock_sync;
wire [13:0] fdout1_frame_lock_sync;
wire crcs_scanin;
wire crcs_scanout;
wire crcn_scanin;
wire crcn_scanout;
wire addrdp_scanin;
wire addrdp_scanout;
wire drq0_rd_adr_queue7_en;
wire drq0_rd_adr_queue6_en;
wire drq0_rd_adr_queue5_en;
wire drq0_rd_adr_queue4_en;
wire drq0_rd_adr_queue3_en;
wire drq0_rd_adr_queue2_en;
wire drq0_rd_adr_queue1_en;
wire drq0_rd_adr_queue0_en;
wire [7:0] drif0_rd_adr_queue_sel;
wire drq0_wr_adr_queue7_en;
wire drq0_wr_adr_queue6_en;
wire drq0_wr_adr_queue5_en;
wire drq0_wr_adr_queue4_en;
wire drq0_wr_adr_queue3_en;
wire drq0_wr_adr_queue2_en;
wire drq0_wr_adr_queue1_en;
wire drq0_wr_adr_queue0_en;
wire addrdp0_rd_wr_adr0_eq;
wire addrdp0_rd_wr_adr1_eq;
wire addrdp0_rd_wr_adr2_eq;
wire addrdp0_rd_wr_adr3_eq;
wire addrdp0_rd_wr_adr4_eq;
wire addrdp0_rd_wr_adr5_eq;
wire addrdp0_rd_wr_adr6_eq;
wire addrdp0_rd_wr_adr7_eq;
wire [1:0] drif0_req_rdwr_addr_sel;
wire drq1_rd_adr_queue7_en;
wire drq1_rd_adr_queue6_en;
wire drq1_rd_adr_queue5_en;
wire drq1_rd_adr_queue4_en;
wire drq1_rd_adr_queue3_en;
wire drq1_rd_adr_queue2_en;
wire drq1_rd_adr_queue1_en;
wire drq1_rd_adr_queue0_en;
wire [7:0] drif1_rd_adr_queue_sel;
wire drq1_wr_adr_queue7_en;
wire drq1_wr_adr_queue6_en;
wire drq1_wr_adr_queue5_en;
wire drq1_wr_adr_queue4_en;
wire drq1_wr_adr_queue3_en;
wire drq1_wr_adr_queue2_en;
wire drq1_wr_adr_queue1_en;
wire drq1_wr_adr_queue0_en;
wire addrdp1_rd_wr_adr0_eq;
wire addrdp1_rd_wr_adr1_eq;
wire addrdp1_rd_wr_adr2_eq;
wire addrdp1_rd_wr_adr3_eq;
wire addrdp1_rd_wr_adr4_eq;
wire addrdp1_rd_wr_adr5_eq;
wire addrdp1_rd_wr_adr6_eq;
wire addrdp1_rd_wr_adr7_eq;
wire [1:0] drif1_req_rdwr_addr_sel;
wire [14:0] addrdp_ras_adr_queue;
wire [10:0] addrdp_cas_adr_queue;
wire [14:0] addrdp_ras_wr1_adr_queue;
wire [10:0] addrdp_cas_wr1_adr_queue;
wire [14:0] addrdp_ras_wr2_adr_queue;
wire [10:0] addrdp_cas_wr2_adr_queue;
wire [2:0] addrdp_rd_req_id_queue;
wire [1:0] drif_rascas_adr_sel;
wire [1:0] drif_rascas_wr1_adr_sel;
wire [1:0] drif_rascas_wr2_adr_sel;
wire [7:0] woq_wr_adr_queue_sel;
wire [7:0] woq_wr1_adr_queue_sel;
wire [7:0] woq_wr2_adr_queue_sel;
wire readdp0_scanin;
wire readdp0_scanout;
wire [1:0] readdp_ecc_single_err;
wire [1:0] readdp_ecc_multi_err;
wire [35:0] readdp0_ecc_loc;
wire drif_fail_over_mode;
wire [34:0] drif_fail_over_mask;
wire [34:0] drif_fail_over_mask_l;
wire [15:0] readdp0_syndrome;
wire [255:0] mcu_scrub_wdata;
wire [255:0] readdp_rddata;
wire [2:0] rdpctl_rddata_en;
wire rdpctl_radr_parity;
wire rdpctl_inj_ecc_err;
wire readdp1_scanin;
wire readdp1_scanout;
wire [35:0] readdp1_ecc_loc;
wire [15:0] readdp1_syndrome;
wire [143:0] fbdird1_data;
wire mcu_gnd_unused;
wire l2rdmx_scanin;
wire l2rdmx_scanout;
wire rdata_ddr_cmp_sync_en;
wire rdata_cmp_ddr_sync_en;
wire [63:0] l2rdmx0_l2wr_data;
wire [63:0] l2rdmx1_l2wr_data;
wire [1:0] rdata_rddata_sel;
wire rdata_pa_err;
wire readdp_l2_secc_err_dly1;
wire readdp_l2_mecc_err_dly1;
wire wrdp_scanin;
wire wrdp_scanout;
wire [127:0] wdq0_wr_data;
wire [127:0] wdq1_wr_data;
wire drif_err_inj_enable;
wire [15:0] drif_err_mask_reg;
wire [3:0] drif_wdata_sel;
wire drif_wadr_parity;
wire drif_l2poison_qw;
wire drif_scrub_rwen;
wire [1:0] drif_io_wdata_sel;
wire [143:0] mcu_ddp_data_out;
wire mbist_run_d1;
wire mbist_sel_hiorlo_72bits_d1;
wire mbist_sel_bank0or1_d1;
wire [11:0] fdout_idle_lfsr;
wire wrdp_idle_lfsr_l_0;
wire [11:0] wrdp_idle_lfsr;
wire [3:0] wrdp_idle_lfsr_0;
wire fbdiwr_scanin;
wire fbdiwr_scanout;
wire [8:0] fbdic0_sb_failover_mask;
wire [8:0] fbdic0_sb_failover_mask_l;
wire [8:0] fbdic1_sb_failover_mask;
wire [8:0] fbdic1_sb_failover_mask_l;
wire fbdird_scanin;
wire fbdird_scanout;
wire fbdic0_nb_failover;
wire fbdic0_nb_failover_l;
wire fbdic1_nb_failover;
wire fbdic1_nb_failover_l;
wire lndskw0_wmr_scanin;
wire lndskw0_wmr_scanout;
wire lndskw0_scanin;
wire lndskw0_scanout;
wire [167:0] fbd0_data;
wire fbdic0_inc_wptr;
wire [13:0] fbdic0_inc_rptr;
wire fbdic0_clr_ptrs;
wire [12:0] fbdic0_nb_failover_mask;
wire [12:0] fbdic0_nb_failover_mask_l;
wire [167:0] lndskw0_data;
wire [13:0] lndskw0_ts0_hdr_match;
wire [11:0] lndskw0_status_parity;
wire [13:0] lndskw0_idle_match;
wire [13:0] lndskw0_alert_match;
wire [11:0] lndskw0_alert_asserted;
wire [11:0] lndskw0_nbde;
wire [23:0] lndskw0_thermal_trip;
wire lndskw1_wmr_scanin;
wire lndskw1_wmr_scanout;
wire lndskw1_scanin;
wire lndskw1_scanout;
wire [167:0] fbd1_data;
wire fbdic1_inc_wptr;
wire [13:0] fbdic1_inc_rptr;
wire fbdic1_clr_ptrs;
wire [12:0] fbdic1_nb_failover_mask;
wire [12:0] fbdic1_nb_failover_mask_l;
wire [167:0] lndskw1_data;
wire [13:0] lndskw1_ts0_hdr_match;
wire [11:0] lndskw1_status_parity;
wire [13:0] lndskw1_idle_match;
wire [13:0] lndskw1_alert_match;
wire [11:0] lndskw1_alert_asserted;
wire [11:0] lndskw1_nbde;
wire [23:0] lndskw1_thermal_trip;
wire fbd0_scanin;
wire fbd0_scanout;
wire [13:0] fbd0_elect_idle;
wire [13:0] fbd0_frame_lock;
wire [13:0] fbd0_testfail;
wire [1:0] fdout0_rptr0;
wire [1:0] fdout0_rptr1;
wire [1:0] fdout0_rptr2;
wire [1:0] fdout0_rptr3;
wire [1:0] fdout0_rptr4;
wire [1:0] fdout0_rptr5;
wire [1:0] fdout0_rptr6;
wire [1:0] fdout0_rptr7;
wire [1:0] fdout0_rptr8;
wire [1:0] fdout0_rptr9;
wire [1:0] fdout0_rptr10;
wire [1:0] fdout0_rptr11;
wire [1:0] fdout0_rptr12;
wire [1:0] fdout0_rptr13;
wire fbd1_scanin;
wire fbd1_scanout;
wire [13:0] fbd1_elect_idle;
wire [13:0] fbd1_frame_lock;
wire [13:0] fbd1_testfail;
wire [1:0] fdout1_rptr0;
wire [1:0] fdout1_rptr1;
wire [1:0] fdout1_rptr2;
wire [1:0] fdout1_rptr3;
wire [1:0] fdout1_rptr4;
wire [1:0] fdout1_rptr5;
wire [1:0] fdout1_rptr6;
wire [1:0] fdout1_rptr7;
wire [1:0] fdout1_rptr8;
wire [1:0] fdout1_rptr9;
wire [1:0] fdout1_rptr10;
wire [1:0] fdout1_rptr11;
wire [1:0] fdout1_rptr12;
wire [1:0] fdout1_rptr13;
wire wdqrf00_scanin;
wire wdqrf00_scanout;
wire mbist_run;
wire array_wr_inhibit;
wire [1:0] rdata0_wdq_rd;
wire [4:0] rdata_wdq_radr;
wire wdqrf01_scanin;
wire wdqrf01_scanout;
wire wdqrf10_scanin;
wire wdqrf10_scanout;
wire [1:0] rdata1_wdq_rd;
wire wdqrf11_scanin;
wire wdqrf11_scanout;
wire mbist_scanin;
wire mbist_scanout;
wire [4:0] mbist_addr;
wire mbist_sel_bank0or1;
wire mbist_sel_hiorlo_72bits;
wire mbist_wdqrf00_rd_en;
wire mbist_wdqrf01_rd_en;
wire mbist_wdqrf10_rd_en;
wire mbist_wdqrf11_rd_en;
wire wmr_protect;
wire drif_stacked_dimm;
wire drif_addr_bank_low_sel;
wire [1:0] drif_mem_type;
wire [2:0] drif_num_dimms;
wire drif_single_channel_mode;
wire rdata_pm_1mcu;
wire rdata_pm_2mcu;
wire drif_branch_disabled;
wire drif_rdata_ack_vld;
wire drif_rdata_nack_vld;
wire [63:0] drif_rdata_data;
wire drif_send_info_val;
wire [19:0] drif_send_info;
wire drif0_wdq_rd;
wire drif1_wdq_rd;
wire [4:0] drif_wdq_radr;
wire [31:0] drif_scrub_addr;
wire drif_ucb_wr_req_vld;
wire drif_ucb_rd_req_vld;
wire [12:0] drif_ucb_addr;
wire drif_err_sts_reg_ld;
wire drif_err_addr_reg_ld;
wire drif_err_cnt_reg_ld;
wire drif_err_loc_reg_ld;
wire drif_err_retry_reg_ld;
wire drif_dbg_trig_reg_ld;
wire [2:0] drif_dram_cmd_a;
wire [15:0] drif_dram_addr_a;
wire [2:0] drif_dram_bank_a;
wire drif_dram_rank_a;
wire [2:0] drif_dram_dimm_a;
wire [2:0] drif_dram_cmd_b;
wire [15:0] drif_dram_addr_b;
wire [2:0] drif_dram_bank_b;
wire drif_dram_rank_b;
wire [2:0] drif_dram_dimm_b;
wire [2:0] drif_dram_cmd_c;
wire [15:0] drif_dram_addr_c;
wire [2:0] drif_dram_bank_c;
wire drif_dram_rank_c;
wire [2:0] drif_dram_dimm_c;
wire drif_wdata_wsn;
wire woq_err_st_wait_free;
wire drif_crc_rd_picked;
wire drif_err_fifo_empty;
wire woq_err_fifo_empty;
wire [1:0] woq_wr_req_out;
wire drif_mcu_error_mode;
wire drif_err_state_crc_fr;
wire drif_mcu_idle;
wire drif_cke_reg;
wire rdata_drif_rd_req_vld;
wire rdata_drif_wr_req_vld;
wire [12:0] rdata_drif_addr;
wire [63:0] rdata_drif_data;
wire rdata_mcu_selfrsh;
wire [35:0] rdpctl_err_addr_reg;
wire [25:0] rdpctl_err_sts_reg;
wire [35:0] rdpctl_err_loc;
wire [15:0] rdpctl_err_cnt;
wire [36:0] rdpctl_err_retry_reg;
wire rdpctl_dbg_trig_enable;
wire rdpctl_kp_lnk_up;
wire rdpctl_mask_err;
wire [1:0] rdpctl_dtm_mask_chnl;
wire rdpctl_dtm_atspeed;
wire [7:0] rdpctl_drq0_clear_ent;
wire [7:0] rdpctl_drq1_clear_ent;
wire rdpctl_scrub_wren;
wire rdpctl_scrub_addrinc_en;
wire l2b0_rd_rank_adr;
wire [2:0] l2b0_rd_dimm_adr;
wire [2:0] l2b0_rd_bank_adr;
wire l2b0_rd_addr_err;
wire l2b0_rd_addr_par;
wire l2b1_rd_rank_adr;
wire [2:0] l2b1_rd_dimm_adr;
wire [2:0] l2b1_rd_bank_adr;
wire l2b1_rd_addr_err;
wire l2b1_rd_addr_par;
wire l2b0_wr_rank_adr;
wire [2:0] l2b0_wr_dimm_adr;
wire [2:0] l2b0_wr_bank_adr;
wire l2b0_wr_addr_err;
wire l2b0_wr_addr_par;
wire l2b1_wr_rank_adr;
wire [2:0] l2b1_wr_dimm_adr;
wire [2:0] l2b1_wr_bank_adr;
wire l2b1_wr_addr_err;
wire l2b1_wr_addr_par;
wire rdpctl_scrub_read_done;
wire rdpctl_err_fifo_enq;
wire [14:0] rdpctl_err_fifo_data;
wire rdpctl_fifo_empty;
wire rdpctl_fifo_full;
wire rdpctl_no_crc_err;
wire rdpctl_crc_err;
wire [65:0] fbdic_ucb_rd_data;
wire fbdic_sync_frame_req_early3;
wire fbdic_sync_frame_req_early2;
wire fbdic_sync_frame_req_early1;
wire fbdic_sync_frame_req;
wire fbdic_scr_frame_req_d4;
wire fbdic_l0_state;
wire [1:0] fbdic_woq_free;
wire fbdic_clear_wrq_ent;
wire fbdic_error_mode;
wire fbdic_l0s_lfsr_stall;
wire fbdic_err_fast_reset_done;
wire fbdic_chnl_reset_error_mode;
wire fbdic_mcu_idle;
wire [4:0] mcu_ucb_rd_request_out;
wire [1:0] mcu_ucb_wr_req_out;
wire mcu_ucb_mecc_err;
wire mcu_ucb_secc_err;
wire mcu_ucb_fbd_err;
wire mcu_ucb_err_mode;
wire mcu_ucb_err_event;
wire [12:0] ucb_mcu_addr;
wire [63:0] ucb_mcu_data;
wire ucb_rdata_selfrsh;
wire ucb_err_ecci;
wire ucb_err_fbui;
wire ucb_err_fbri;
wire ucb_pm;
wire ucb_pm_ba01;
wire ucb_pm_ba23;
wire ucb_pm_ba45;
wire ucb_pm_ba67;
wire rdata_err_fbr;
wire [21:0] fbdiwr_dtm_crc;
wire rdata_serdes_dtm;
wire rdata_err_ecci;
wire rdata_err_fbri;
wire rdata_err_fbui;
wire mbist_run_d1_l;
wire fbdic_err_fbr;
wire rdpctl_l2t0_data_valid;
wire rdpctl_l2t1_data_valid;
wire rdpctl_qword_id;
wire [2:0] rdpctl_rd_req_id;
wire rdpctl_pa_err;
wire rdpctl_scrb0_err_valid;
wire rdpctl_scrb1_err_valid;
wire rdpctl_fbd0_recov_err;
wire rdpctl_fbd1_recov_err;
wire [1:0] rdpctl_fbd_unrecov_err;
wire rdpctl_secc_cnt_intr;
wire fbdic_fbd_error;
wire fbdic_srds_dtm_muxsel;
wire rdpctl_crc_recov_err;
wire rdpctl_crc_unrecov_err;
wire [1:0] rdpctl_dtm_chnl_enable;
wire fbdic_serdes_dtm;
wire fbdic_rddata_vld;
wire fbdic_crc_error;
wire fbdic_chnl_reset_error;
wire fbdic_err_unrecov;
wire fbdic_err_recov;
wire fbdic_cfgrd_crc_error;
wire [119:0] fbdiwr0_data;
wire [119:0] fbdiwr1_data;
wire fbdic_link_cnt_eq_0_d1;
wire fdout_idle_lfsr_l_0;
wire [5:0] fdout_link_cnt;
wire fbdic_link_cnt_en;
wire fbdic_idle_lfsr_reset;
wire [5:0] fbdic_link_cnt_reset;
wire [4:0] fbdic_data_sel;
wire [11:0] fbdic0_ts_data;
wire [11:0] fbdic1_ts_data;
wire [119:0] fbdic_ibist_data;
wire [1:0] fbdic_f;
wire fbdic_f_1_l;
wire fbdic0_chnl_disable;
wire fbdic1_chnl_disable;
wire [23:0] fbdic_a_cmd;
wire [71:0] fbdic_bc_cmd;
wire [1:0] fbdic0_cmd_crc_sel;
wire [2:0] fbdic0_data_crc_sel;
wire fbdic0_sb_failover;
wire fbdic0_sb_failover_l;
wire [1:0] fbdic1_cmd_crc_sel;
wire [2:0] fbdic1_data_crc_sel;
wire fbdic1_sb_failover;
wire fbdic1_sb_failover_l;
wire fbdic_train_state;
wire fbdic_disable_state;
wire fbdic_enable_sync_count;
wire fbdic_sync_frame_req_d1;
wire fbdic_special_cmd;
wire fbdic_special_cmd_l;
wire fbdic_ibrx_data_sel;
wire fbdic_ibrx_data_sel_l;
wire fbdic_rddata_vld_l;
wire rdpctl_kp_lnk_up_clr;
wire [167:40] fbdird_ibrx_data;
wire fbdird_crc_cmp0_0;
wire fbdird_crc_cmp0_1;
wire fbdird_crc_cmp1_0;
wire fbdird_crc_cmp1_1;
wire mcu_gnd;
wire [13:0] crcsc_crc;
wire [9:0] crcscf_crc;
wire [21:0] crcsd0_crc;
wire [9:0] crcsdf0_crc;
wire [21:0] crcsd1_crc;
wire [9:0] crcsdf1_crc;
wire [25:0] bc;
wire [71:0] bd0;
wire [71:0] bd1;
wire [11:0] crcnd_crc0_0;
wire [11:0] crcnd_crc0_1;
wire [11:0] crcnd_crc1_0;
wire [11:0] crcnd_crc1_1;
wire [5:0] crcndf_crc0_0;
wire [5:0] crcndf_crc0_1;
wire [5:0] crcndf_crc1_0;
wire [5:0] crcndf_crc1_1;
wire [71:0] bd00;
wire [71:0] bd01;
wire [71:0] bd10;
wire [71:0] bd11;
wire [14:0] l2b0_rd_ras_adr;
wire [10:0] l2b0_rd_cas_adr;
wire [2:0] l2b0_l2rd_req_id;
wire [14:0] l2b0_wr_ras_adr;
wire [10:0] l2b0_wr_cas_adr;
wire [14:0] l2b1_rd_ras_adr;
wire [10:0] l2b1_rd_cas_adr;
wire [2:0] l2b1_l2rd_req_id;
wire [14:0] l2b1_wr_ras_adr;
wire [10:0] l2b1_wr_cas_adr;


//////////////////////////////
// OUTPUTS
//////////////////////////////
output	[119:0]	mcu_fsr0_data;
output	[119:0]	mcu_fsr1_data;
output		mcu_fsr0_cfgpll_enpll;
output		mcu_fsr1_cfgpll_enpll;
output	[1:0]	mcu_fsr01_cfgpll_lb;
output	[3:0]	mcu_fsr01_cfgpll_mpy;
output		mcu_fsr0_cfgrx_enrx;
output		mcu_fsr1_cfgrx_enrx;
output		mcu_fsr0_cfgrx_entest;
output		mcu_fsr1_cfgrx_entest;
output		mcu_fsr0_cfgrx_align;
output		mcu_fsr1_cfgrx_align;
output	[13:0]	mcu_fsr0_cfgrx_invpair;
output	[13:0]	mcu_fsr1_cfgrx_invpair;
output	[3:0]	mcu_fsr01_cfgrx_eq;
output	[2:0]	mcu_fsr01_cfgrx_cdr;
output	[2:0]	mcu_fsr01_cfgrx_term;
output		mcu_fsr0_cfgtx_entx;
output		mcu_fsr1_cfgtx_entx;
output		mcu_fsr0_cfgtx_entest;
output		mcu_fsr1_cfgtx_entest;
output		mcu_fsr0_cfgtx_enidl;
output		mcu_fsr1_cfgtx_enidl;
output	[9:0]	mcu_fsr0_cfgtx_invpair;
output	[9:0]	mcu_fsr1_cfgtx_invpair;
output	[9:0]	mcu_fsr0_cfgtx_bstx;
output	[9:0]	mcu_fsr1_cfgtx_bstx;
output		mcu_fsr01_cfgtx_enftp;
output	[3:0]	mcu_fsr01_cfgtx_de;
output	[2:0]	mcu_fsr01_cfgtx_swing;
output		mcu_fsr01_cfgtx_cm;
output	[1:0]	mcu_fsr01_cfgrtx_rate;
output	[11:0]	mcu_fsr0_testcfg;
output	[11:0]	mcu_fsr1_testcfg;
output		mcu_l2t0_data_vld_r0;				// PINDEF:RIGHT
output		mcu_l2t0_rd_ack;				// PINDEF:RIGHT
output		mcu_l2t0_scb_mecc_err;				// PINDEF:RIGHT
output		mcu_l2t0_scb_secc_err;				// PINDEF:RIGHT
output		mcu_l2t0_wr_ack;				// PINDEF:RIGHT
output	[1:0]	mcu_l2t0_qword_id_r0;				// PINDEF:RIGHT
output		mcu_l2t0_mecc_err_r3;				// PINDEF:RIGHT
output	[2:0]	mcu_l2t0_rd_req_id_r0;				// PINDEF:RIGHT
output		mcu_l2t0_secc_err_r3;				// PINDEF:RIGHT
output		mcu_l2t1_data_vld_r0;				// PINDEF:RIGHT
output		mcu_l2t1_rd_ack;				// PINDEF:RIGHT
output		mcu_l2t1_scb_mecc_err;				// PINDEF:RIGHT
output		mcu_l2t1_scb_secc_err;				// PINDEF:RIGHT
output		mcu_l2t1_wr_ack;				// PINDEF:RIGHT
output	[1:0]	mcu_l2t1_qword_id_r0;				// PINDEF:RIGHT
output		mcu_l2t1_mecc_err_r3;				// PINDEF:RIGHT
output	[2:0]	mcu_l2t1_rd_req_id_r0;				// PINDEF:RIGHT
output		mcu_l2t1_secc_err_r3;				// PINDEF:RIGHT
output	[127:0]	mcu_l2b_data_r3;				// PINDEF:RIGHT
output	[27:0]	mcu_l2b_ecc_r3;        				// PINDEF:RIGHT
output		mcu_pt_sync_out;				// PINDEF:RIGHT
output	[3:0]	mcu_ncu_data;					// PINDEF:RIGHT
output		mcu_ncu_stall;					// PINDEF:RIGHT
output		mcu_ncu_vld;					// PINDEF:RIGHT
output		mcu_ncu_ecc;
output		mcu_ncu_fbr;
output	[3:0]	mcu_dbg1_rd_req_in_0;
output	[3:0]	mcu_dbg1_rd_req_in_1;
output	[4:0]	mcu_dbg1_rd_req_out;
output		mcu_dbg1_wr_req_in_0;
output		mcu_dbg1_wr_req_in_1;
output	[1:0]	mcu_dbg1_wr_req_out;
output		mcu_dbg1_mecc_err;
output		mcu_dbg1_secc_err;
output		mcu_dbg1_fbd_err;
output		mcu_dbg1_err_mode;
output		mcu_dbg1_crc21;
output		mcu_dbg1_err_event;

//////////////////////////////
// INPUTS
//////////////////////////////
input	[13:0]	fsr0_mcu_rxbclk;
input	[13:0]	fsr1_mcu_rxbclk;
input	[167:0]	fsr0_mcu_data;					// PINDEF:BOT
input	[167:0]	fsr1_mcu_data;					// PINDEF:BOT
input	[2:0]	fsr0_mcu_stspll_lock;
input	[2:0]	fsr1_mcu_stspll_lock;
input	[13:0]	fsr0_mcu_stsrx_testfail;
input	[13:0]	fsr1_mcu_stsrx_testfail;
input	[13:0]	fsr0_mcu_stsrx_sync;
input	[13:0]	fsr1_mcu_stsrx_sync;
input	[13:0]	fsr0_mcu_stsrx_losdtct;
input	[13:0]	fsr1_mcu_stsrx_losdtct;
input	[13:0]	fsr0_mcu_stsrx_bsrxp;
input	[13:0]	fsr1_mcu_stsrx_bsrxp;
input	[13:0]	fsr0_mcu_stsrx_bsrxn;
input	[13:0]	fsr1_mcu_stsrx_bsrxn;
input	[9:0]	fsr0_mcu_ststx_testfail;
input	[9:0]	fsr1_mcu_ststx_testfail;
input	[3:0]	ncu_mcu_data;					// PINDEF:RIGHT
input		ncu_mcu_stall;					// PINDEF:RIGHT
input		ncu_mcu_vld;					// PINDEF:RIGHT
input		ncu_mcu_ecci;
input		ncu_mcu_fbui;
input		ncu_mcu_fbri;
input	        ncu_mcu_pm;
input	        ncu_mcu_ba01;
input	        ncu_mcu_ba23;
input	        ncu_mcu_ba45;
input	        ncu_mcu_ba67;
input		l2b0_mcu_data_mecc_r5;				// PINDEF:RIGHT
input		l2b0_mcu_data_vld_r5;				// PINDEF:RIGHT
input	[63:0]	l2b0_mcu_wr_data_r5;				// PINDEF:RIGHT
input	[39:7]	l2t0_mcu_addr_39to7;				// PINDEF:RIGHT
input		l2t0_mcu_addr_5;				// PINDEF:RIGHT
input		l2t0_mcu_rd_dummy_req;				// PINDEF:RIGHT
input		l2t0_mcu_rd_req;				// PINDEF:RIGHT
input	[2:0]	l2t0_mcu_rd_req_id;				// PINDEF:RIGHT
input		l2t0_mcu_wr_req;				// PINDEF:RIGHT
input		l2b1_mcu_data_mecc_r5;				// PINDEF:RIGHT
input		l2b1_mcu_data_vld_r5;				// PINDEF:RIGHT
input	[63:0]	l2b1_mcu_wr_data_r5;				// PINDEF:RIGHT
input	[39:7]	l2t1_mcu_addr_39to7;				// PINDEF:RIGHT
input		l2t1_mcu_addr_5;				// PINDEF:RIGHT
input		l2t1_mcu_rd_dummy_req;				// PINDEF:RIGHT
input		l2t1_mcu_rd_req;				// PINDEF:RIGHT
input	[2:0]	l2t1_mcu_rd_req_id;				// PINDEF:RIGHT
input		l2t1_mcu_wr_req;				// PINDEF:RIGHT
input		mcu_pt_sync_in0;				// PINDEF:RIGHT
input		mcu_pt_sync_in1;				// PINDEF:RIGHT
input		mcu_pt_sync_in2;				// PINDEF:RIGHT
input	[1:0]	mcu_id;

// MBIST Signals

input		tcu_mbist_bisi_en;
input		tcu_mbist_user_mode;
input		tcu_mcu_mbist_start;
output		mcu_tcu_mbist_done;
output		mcu_tcu_mbist_fail;
input		tcu_mcu_mbist_scan_in;
output		mcu_tcu_mbist_scan_out;

// SERDES scan signals
input		tcu_sbs_scan_en;
input		tcu_sbs_aclk;
input		tcu_sbs_bclk;
input		tcu_sbs_clk;
input		tcu_sbs_uclk;
input		mcu_sbs_scan_in;
output		mcu_sbs_scan_out;

//////////////////////////////
// Global Signals
//////////////////////////////
input		ccu_dr_sync_en;					// PINDEF:RIGHT
input		ccu_io_cmp_sync_en;				// PINDEF:RIGHT
input		ccu_cmp_io_sync_en;				// PINDEF:RIGHT
input	        rst_mcu_selfrsh;   				// PINDEF:RIGHT
input		rst_wmr_protect;				// PINDEF:RIGHT
                                                        	
input		scan_in;					// PINDEF:RIGHT
input		tcu_aclk;					// PINDEF:RIGHT
input		tcu_bclk;					// PINDEF:RIGHT
input		tcu_mcu_clk_stop;				// PINDEF:RIGHT
input		tcu_mcu_dr_clk_stop;				// PINDEF:RIGHT
input		tcu_mcu_io_clk_stop;				// PINDEF:RIGHT
input		tcu_pce_ov;					// PINDEF:RIGHT
input		tcu_dectest; 
input		tcu_muxtest; 
input		tcu_mcu_testmode;
input		tcu_mcu_fbd_clk_stop;
input		tcu_scan_en;
input		tcu_se_scancollar_in;
input		tcu_array_wr_inhibit;
input		tcu_array_bypass;
input		tcu_atpg_mode;
output		scan_out;					// PINDEF:RIGHT
                                                        	
input		tcu_div_bypass;
input	        ccu_io_out;					// PINDEF:RIGHT
input		ccu_serdes_dtm;
input	        dr_gclk;					// PINDEF:RIGHT
input	        gclk;						// PINDEF:RIGHT

////////////////////////////////////////////////////////////

clkgen_mcu_cmp clkgen_cmp (
	.scan_in(clkgen_cmp_scanin),
	.scan_out(clkgen_cmp_scanout),
	.l2clk(l2clk),
	.cmp_slow_sync_en(cmp_io_sync_en),
	.slow_cmp_sync_en(io_cmp_sync_en),
	.tcu_clk_stop(tcu_mcu_clk_stop),
	.pce_ov(cmp_pce_ov),
	.ccu_cmp_slow_sync_en(ccu_cmp_io_sync_en),
	.ccu_slow_cmp_sync_en(ccu_io_cmp_sync_en),
	.ccu_io2x_sync_en(1'b0),
	.io2x_sync_en(io2x_sync_en_unused),
	.tcu_div_bypass(1'b0),
	.ccu_div_ph(1'b0),
	.cluster_div_en(1'b0),
	.rst_wmr_(1'b0),
	.rst_por_(1'b0),
	.wmr_(cmp_wmr_unused),
	.por_(cmp_por_unused),
	.wmr_protect(cmp_wmr_protect_unused),
	.cluster_arst_l(1'b1),
	.gclk(gclk),
	.clk_ext(1'b0),
	.aclk_wmr(cmp_aclk_wmr_unused),
	.scan_en(tcu_scan_en),
	.ccu_serdes_dtm(1'b0),
	.tcu_wr_inhibit(tcu_array_wr_inhibit),
	.array_wr_inhibit(cmp_array_wr_inhibit),
  .tcu_atpg_mode(tcu_atpg_mode),
  .aclk(aclk),
  .bclk(bclk),
  .dr_sync_en(dr_sync_en),
  .tcu_pce_ov(tcu_pce_ov),
  .rst_wmr_protect(rst_wmr_protect),
  .ccu_dr_sync_en(ccu_dr_sync_en),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk)
);

clkgen_mcu_dr clkgen_dr (
	.scan_in(clkgen_dr_scanin),
	.scan_out(clkgen_dr_scanout),
	.l2clk(drl2clk),
	.pce_ov(dr_pce_ov),
	.cmp_slow_sync_en(dr_cmp_slow_sync_en_unused),
	.slow_cmp_sync_en(dr_slow_cmp_sync_en_unused),
	.ccu_cmp_slow_sync_en(1'b0),
	.ccu_slow_cmp_sync_en(1'b0),
	.tcu_clk_stop(tcu_mcu_dr_clk_stop),
	.tcu_div_bypass(1'b0),
	.ccu_div_ph(1'b0),
	.cluster_div_en(1'b0),
	.rst_wmr_(1'b0),
	.rst_por_(1'b0),
	.wmr_(dr_wmr_unused),
	.por_(dr_por_unused),
	.cluster_arst_l(1'b1),
	.gclk(dr_gclk),
	.clk_ext(1'b0),
	.aclk(dr_aclk_unused),
	.bclk(dr_bclk_unused),
	.aclk_wmr(aclk_wmr),
	.scan_en(tcu_scan_en),
	.ccu_serdes_dtm(1'b0),
	.tcu_wr_inhibit(tcu_array_wr_inhibit),
	.array_wr_inhibit(dr_array_wr_inhibit),
  .tcu_atpg_mode(tcu_atpg_mode),
  .wmr_protect(wmr_protect),
  .tcu_pce_ov(tcu_pce_ov),
  .rst_wmr_protect(rst_wmr_protect),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk)
);

clkgen_mcu_io clkgen_io (
	.scan_in(clkgen_io_scanin),
	.scan_out(clkgen_io_scanout),
	.l2clk(iol2clk),
	.pce_ov(io_pce_ov),
	.cmp_slow_sync_en(io_cmp_slow_sync_en_unused),
	.slow_cmp_sync_en(io_slow_cmp_sync_en_unused),
	.ccu_cmp_slow_sync_en(1'b0),
	.ccu_slow_cmp_sync_en(1'b0),
	.tcu_clk_stop(tcu_mcu_io_clk_stop),
	.tcu_div_bypass(tcu_div_bypass),
	.ccu_div_ph(ccu_io_out),
	.cluster_div_en(1'b1),
	.rst_wmr_(1'b0),
	.rst_por_(1'b0),
	.wmr_(io_wmr_unused),
	.por_(io_por_unused),
	.wmr_protect(io_wmr_protect_unused),
	.cluster_arst_l(1'b1),
	.gclk(gclk),
	.clk_ext(1'b0),
	.aclk(io_aclk_unused),
	.bclk(io_bclk_unused),
	.aclk_wmr(io_aclk_wmr_unused),
	.scan_en(tcu_scan_en),
	.ccu_serdes_dtm(1'b0),
	.tcu_wr_inhibit(1'b0),
	.array_wr_inhibit(io_awi_unused),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_pce_ov(tcu_pce_ov),
  .rst_wmr_protect(rst_wmr_protect),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk)
);

mcu_l2if_ctl l2if0 (
	.scan_in(l2if0_scanin),
	.scan_out(l2if0_scanout),
	.l2clk(l2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(cmp_pce_ov),
	.l2t_mcu_rd_req(l2t0_mcu_rd_req),
	.l2t_mcu_rd_dummy_req(l2t0_mcu_rd_dummy_req),
	.l2t_mcu_rd_req_id(l2t0_mcu_rd_req_id[2:0]),
	.l2t_mcu_addr({l2t0_mcu_addr_39to7[39:7],1'b0,l2t0_mcu_addr_5}),
	.l2t_mcu_wr_req(l2t0_mcu_wr_req),
	.l2b_mcu_data_vld(l2b0_mcu_data_vld_r5),
	.l2b_mcu_data_mecc(l2b0_mcu_data_mecc_r5),
	.drq_rdq_free(drq0_rdq_free),
	.woq_wdq_entry_free(woq0_wdq_entry_free[7:0]),
	.mcu_l2t_rd_ack(mcu_l2t0_rd_ack),
	.mcu_l2t_wr_ack(mcu_l2t0_wr_ack),
	.mcu_ucb_rd_req_in ( mcu_ucb_rd_req_in_0[3:0]), // sent to dbg via ucb
	.mcu_ucb_wr_req_in ( mcu_ucb_wr_req_in_0 ), // sent to dbg via ucb
	.l2if_rd_dummy_req(l2if0_rd_dummy_req),
	.l2if_rd_dummy_req_addr5(l2if0_rd_dummy_req_addr5),
	.l2if_rd_dummy_req_id(l2if0_rd_dummy_req_id[2:0]),
	.l2if_rd_dummy_addr_err(l2if0_rd_dummy_addr_err),
	.rdpctl_dummy_data_valid(rdpctl0_dummy_data_valid),
	.l2if_mcu_data_mecc(l2if0_mcu_data_mecc),
	.l2if_data_wr_addr(l2if0_data_wr_addr[2:0]),
	.l2if_wdq_rd_inh(l2if0_wdq_rd_inh),
	.l2if_wr_req(l2if0_wr_req),
	.l2if_rd_req(l2if0_rd_req),
	.l2if_wdq_we(l2if0_wdq_we[1:0]),
	.l2if_wdq_wadr(l2if0_wdq_wadr[4:0]),
	.l2if_wdq_in_cntr(l2if0_wdq_in_cntr[3:0]),
	.l2if_rd_rank_adr(l2if0_rd_rank_adr),
	.l2if_rd_dimm_adr(l2if0_rd_dimm_adr[2:0]),
	.l2if_rd_bank_adr(l2if0_rd_bank_adr[2:0]),
	.l2if_rd_ras_adr(l2if0_rd_ras_adr[14:0]),
	.l2if_rd_cas_adr(l2if0_rd_cas_adr[10:0]),
	.l2if_rd_addr_err(l2if0_rd_addr_err),
	.l2if_rd_addr_parity(l2if0_rd_addr_parity),
	.l2if_rd_req_id(l2if0_rd_req_id[2:0]),
	.l2if_wr_rank_adr(l2if0_wr_rank_adr),
	.l2if_wr_dimm_adr(l2if0_wr_dimm_adr[2:0]),
	.l2if_wr_bank_adr(l2if0_wr_bank_adr[2:0]),
	.l2if_wr_ras_adr(l2if0_wr_ras_adr[14:0]),
	.l2if_wr_cas_adr(l2if0_wr_cas_adr[10:0]),
	.l2if_wr_addr_err(l2if0_wr_addr_err),
	.l2if_wr_addr_parity(l2if0_wr_addr_parity),
	.mbist_wdqrf0_wr_en(mbist_wdqrf00_wr_en),
	.mbist_wdqrf1_wr_en(mbist_wdqrf01_wr_en),
	.mbist_wdata_0(mbist_wdata[0]),
	.ccu_mcu_cmp_ddr_sync_en(dr_sync_en),
	.ccu_mcu_ddr_cmp_sync_en(dr_sync_en),
	.ccu_mcu_cmp_io_sync_en(cmp_io_sync_en),
  .drif_stacked_dimm(drif_stacked_dimm),
  .drif_addr_bank_low_sel(drif_addr_bank_low_sel),
  .drif_mem_type(drif_mem_type[1:0]),
  .drif_num_dimms(drif_num_dimms[2:0]),
  .drif_single_channel_mode(drif_single_channel_mode),
  .rdata_pm_1mcu(rdata_pm_1mcu),
  .rdata_pm_2mcu(rdata_pm_2mcu),
  .mbist_run(mbist_run),
  .mbist_addr(mbist_addr[4:0]),
  .tcu_scan_en(tcu_scan_en)
);

mcu_l2if_ctl l2if1 (
	.scan_in(l2if1_scanin),
	.scan_out(l2if1_scanout),
	.l2clk(l2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(cmp_pce_ov),
	.l2t_mcu_rd_req(l2t1_mcu_rd_req),
	.l2t_mcu_rd_dummy_req(l2t1_mcu_rd_dummy_req),
	.l2t_mcu_rd_req_id(l2t1_mcu_rd_req_id[2:0]),
	.l2t_mcu_addr({l2t1_mcu_addr_39to7[39:7],1'b1,l2t1_mcu_addr_5}),
	.l2t_mcu_wr_req(l2t1_mcu_wr_req),
	.l2b_mcu_data_vld(l2b1_mcu_data_vld_r5),
	.l2b_mcu_data_mecc(l2b1_mcu_data_mecc_r5),
	.drq_rdq_free(drq1_rdq_free),
	.woq_wdq_entry_free(woq1_wdq_entry_free[7:0]),
	.mcu_l2t_rd_ack(mcu_l2t1_rd_ack),
	.mcu_l2t_wr_ack(mcu_l2t1_wr_ack),
	.mcu_ucb_rd_req_in ( mcu_ucb_rd_req_in_1[3:0] ), // sent to dbg via ucb
	.mcu_ucb_wr_req_in ( mcu_ucb_wr_req_in_1 ), // sent to dbg via ucb
	.l2if_rd_dummy_req(l2if1_rd_dummy_req),
	.l2if_rd_dummy_req_addr5(l2if1_rd_dummy_req_addr5),
	.l2if_rd_dummy_req_id(l2if1_rd_dummy_req_id[2:0]),
	.l2if_rd_dummy_addr_err(l2if1_rd_dummy_addr_err),
	.rdpctl_dummy_data_valid(rdpctl1_dummy_data_valid),
	.l2if_mcu_data_mecc(l2if1_mcu_data_mecc),
	.l2if_data_wr_addr(l2if1_data_wr_addr[2:0]),
	.l2if_wdq_rd_inh(l2if1_wdq_rd_inh),
	.l2if_wr_req(l2if1_wr_req),
	.l2if_rd_req(l2if1_rd_req),
	.l2if_wdq_we(l2if1_wdq_we[1:0]),
	.l2if_wdq_wadr(l2if1_wdq_wadr[4:0]),
	.l2if_wdq_in_cntr(l2if1_wdq_in_cntr[3:0]),
	.l2if_rd_rank_adr(l2if1_rd_rank_adr),
	.l2if_rd_dimm_adr(l2if1_rd_dimm_adr[2:0]),
	.l2if_rd_bank_adr(l2if1_rd_bank_adr[2:0]),
	.l2if_rd_ras_adr(l2if1_rd_ras_adr[14:0]),
	.l2if_rd_cas_adr(l2if1_rd_cas_adr[10:0]),
	.l2if_rd_addr_err(l2if1_rd_addr_err),
	.l2if_rd_addr_parity(l2if1_rd_addr_parity),
	.l2if_rd_req_id(l2if1_rd_req_id[2:0]),
	.l2if_wr_rank_adr(l2if1_wr_rank_adr),
	.l2if_wr_dimm_adr(l2if1_wr_dimm_adr[2:0]),
	.l2if_wr_bank_adr(l2if1_wr_bank_adr[2:0]),
	.l2if_wr_ras_adr(l2if1_wr_ras_adr[14:0]),
	.l2if_wr_cas_adr(l2if1_wr_cas_adr[10:0]),
	.l2if_wr_addr_err(l2if1_wr_addr_err),
	.l2if_wr_addr_parity(l2if1_wr_addr_parity),
	.mbist_wdqrf0_wr_en(mbist_wdqrf10_wr_en),
	.mbist_wdqrf1_wr_en(mbist_wdqrf11_wr_en),
	.mbist_wdata_0(mbist_wdata[0]),
	.ccu_mcu_cmp_ddr_sync_en(dr_sync_en),
	.ccu_mcu_ddr_cmp_sync_en(dr_sync_en),
	.ccu_mcu_cmp_io_sync_en(cmp_io_sync_en),
  .drif_stacked_dimm(drif_stacked_dimm),
  .drif_addr_bank_low_sel(drif_addr_bank_low_sel),
  .drif_mem_type(drif_mem_type[1:0]),
  .drif_num_dimms(drif_num_dimms[2:0]),
  .drif_single_channel_mode(drif_single_channel_mode),
  .rdata_pm_1mcu(rdata_pm_1mcu),
  .rdata_pm_2mcu(rdata_pm_2mcu),
  .mbist_run(mbist_run),
  .mbist_addr(mbist_addr[4:0]),
  .tcu_scan_en(tcu_scan_en)
);

mcu_drif_ctl drif ( // FS:wmr_protect
	.wmr_scan_in(drif_wmr_scanin),
	.wmr_scan_out(drif_wmr_scanout),
	.scan_in(drif_scanin),
	.scan_out(drif_scanout),
	.drl2clk(drl2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(dr_pce_ov),
  .drif_fail_over_mode(drif_fail_over_mode),
  .drif_fail_over_mask(drif_fail_over_mask[34:0]),
  .drif_fail_over_mask_l(drif_fail_over_mask_l[34:0]),
  .drq0_rdq_free(drq0_rdq_free),
  .drq1_rdq_free(drq1_rdq_free),
  .woq0_wdq_entry_free(woq0_wdq_entry_free[7:0]),
  .woq1_wdq_entry_free(woq1_wdq_entry_free[7:0]),
  .drif_num_dimms(drif_num_dimms[2:0]),
  .drif_addr_bank_low_sel(drif_addr_bank_low_sel),
  .drif_mem_type(drif_mem_type[1:0]),
  .drif_stacked_dimm(drif_stacked_dimm),
  .drif_single_channel_mode(drif_single_channel_mode),
  .drif_branch_disabled(drif_branch_disabled),
  .drif_wdata_sel(drif_wdata_sel[3:0]),
  .drif_rdata_ack_vld(drif_rdata_ack_vld),
  .drif_rdata_nack_vld(drif_rdata_nack_vld),
  .drif_rdata_data(drif_rdata_data[63:0]),
  .drif_err_inj_enable(drif_err_inj_enable),
  .drif_err_mask_reg(drif_err_mask_reg[15:0]),
  .drif_send_info_val(drif_send_info_val),
  .drif_send_info(drif_send_info[19:0]),
  .drif0_wdq_rd(drif0_wdq_rd),
  .drif1_wdq_rd(drif1_wdq_rd),
  .drif_wdq_radr(drif_wdq_radr[4:0]),
  .drif_rascas_adr_sel(drif_rascas_adr_sel[1:0]),
  .drif_rascas_wr1_adr_sel(drif_rascas_wr1_adr_sel[1:0]),
  .drif_rascas_wr2_adr_sel(drif_rascas_wr2_adr_sel[1:0]),
  .drif_scrub_addr(drif_scrub_addr[31:0]),
  .drq0_rd_adr_queue7_en(drq0_rd_adr_queue7_en),
  .drq0_rd_adr_queue6_en(drq0_rd_adr_queue6_en),
  .drq0_rd_adr_queue5_en(drq0_rd_adr_queue5_en),
  .drq0_rd_adr_queue4_en(drq0_rd_adr_queue4_en),
  .drq0_rd_adr_queue3_en(drq0_rd_adr_queue3_en),
  .drq0_rd_adr_queue2_en(drq0_rd_adr_queue2_en),
  .drq0_rd_adr_queue1_en(drq0_rd_adr_queue1_en),
  .drq0_rd_adr_queue0_en(drq0_rd_adr_queue0_en),
  .drq1_rd_adr_queue7_en(drq1_rd_adr_queue7_en),
  .drq1_rd_adr_queue6_en(drq1_rd_adr_queue6_en),
  .drq1_rd_adr_queue5_en(drq1_rd_adr_queue5_en),
  .drq1_rd_adr_queue4_en(drq1_rd_adr_queue4_en),
  .drq1_rd_adr_queue3_en(drq1_rd_adr_queue3_en),
  .drq1_rd_adr_queue2_en(drq1_rd_adr_queue2_en),
  .drq1_rd_adr_queue1_en(drq1_rd_adr_queue1_en),
  .drq1_rd_adr_queue0_en(drq1_rd_adr_queue0_en),
  .drq0_wr_adr_queue7_en(drq0_wr_adr_queue7_en),
  .drq0_wr_adr_queue6_en(drq0_wr_adr_queue6_en),
  .drq0_wr_adr_queue5_en(drq0_wr_adr_queue5_en),
  .drq0_wr_adr_queue4_en(drq0_wr_adr_queue4_en),
  .drq0_wr_adr_queue3_en(drq0_wr_adr_queue3_en),
  .drq0_wr_adr_queue2_en(drq0_wr_adr_queue2_en),
  .drq0_wr_adr_queue1_en(drq0_wr_adr_queue1_en),
  .drq0_wr_adr_queue0_en(drq0_wr_adr_queue0_en),
  .drq1_wr_adr_queue7_en(drq1_wr_adr_queue7_en),
  .drq1_wr_adr_queue6_en(drq1_wr_adr_queue6_en),
  .drq1_wr_adr_queue5_en(drq1_wr_adr_queue5_en),
  .drq1_wr_adr_queue4_en(drq1_wr_adr_queue4_en),
  .drq1_wr_adr_queue3_en(drq1_wr_adr_queue3_en),
  .drq1_wr_adr_queue2_en(drq1_wr_adr_queue2_en),
  .drq1_wr_adr_queue1_en(drq1_wr_adr_queue1_en),
  .drq1_wr_adr_queue0_en(drq1_wr_adr_queue0_en),
  .drif0_rd_adr_queue_sel(drif0_rd_adr_queue_sel[7:0]),
  .drif1_rd_adr_queue_sel(drif1_rd_adr_queue_sel[7:0]),
  .woq_wr_adr_queue_sel(woq_wr_adr_queue_sel[7:0]),
  .woq_wr1_adr_queue_sel(woq_wr1_adr_queue_sel[7:0]),
  .woq_wr2_adr_queue_sel(woq_wr2_adr_queue_sel[7:0]),
  .drif0_req_rdwr_addr_sel(drif0_req_rdwr_addr_sel[1:0]),
  .drif1_req_rdwr_addr_sel(drif1_req_rdwr_addr_sel[1:0]),
  .drif_l2poison_qw(drif_l2poison_qw),
  .drif_wadr_parity(drif_wadr_parity),
  .mcu_pt_sync_out(mcu_pt_sync_out),
  .drif_scrub_rwen(drif_scrub_rwen),
  .drif_io_wdata_sel(drif_io_wdata_sel[1:0]),
  .drif_ucb_wr_req_vld(drif_ucb_wr_req_vld),
  .drif_ucb_rd_req_vld(drif_ucb_rd_req_vld),
  .drif_ucb_addr(drif_ucb_addr[12:0]),
  .drif_ucb_data(drif_ucb_data[63:0]),
  .drif_err_sts_reg_ld(drif_err_sts_reg_ld),
  .drif_err_addr_reg_ld(drif_err_addr_reg_ld),
  .drif_err_cnt_reg_ld(drif_err_cnt_reg_ld),
  .drif_err_loc_reg_ld(drif_err_loc_reg_ld),
  .drif_err_retry_reg_ld(drif_err_retry_reg_ld),
  .drif_dbg_trig_reg_ld(drif_dbg_trig_reg_ld),
  .drif_dram_cmd_a(drif_dram_cmd_a[2:0]),
  .drif_dram_addr_a(drif_dram_addr_a[15:0]),
  .drif_dram_bank_a(drif_dram_bank_a[2:0]),
  .drif_dram_rank_a(drif_dram_rank_a),
  .drif_dram_dimm_a(drif_dram_dimm_a[2:0]),
  .drif_dram_cmd_b(drif_dram_cmd_b[2:0]),
  .drif_dram_addr_b(drif_dram_addr_b[15:0]),
  .drif_dram_bank_b(drif_dram_bank_b[2:0]),
  .drif_dram_rank_b(drif_dram_rank_b),
  .drif_dram_dimm_b(drif_dram_dimm_b[2:0]),
  .drif_dram_cmd_c(drif_dram_cmd_c[2:0]),
  .drif_dram_addr_c(drif_dram_addr_c[15:0]),
  .drif_dram_bank_c(drif_dram_bank_c[2:0]),
  .drif_dram_rank_c(drif_dram_rank_c),
  .drif_dram_dimm_c(drif_dram_dimm_c[2:0]),
  .drif_wdata_wsn(drif_wdata_wsn),
  .woq_err_st_wait_free(woq_err_st_wait_free),
  .drif_crc_rd_picked(drif_crc_rd_picked),
  .drif_err_fifo_empty(drif_err_fifo_empty),
  .woq_err_fifo_empty(woq_err_fifo_empty),
  .woq_wr_req_out(woq_wr_req_out[1:0]),
  .drif_mcu_error_mode(drif_mcu_error_mode),
  .drif_err_state_crc_fr(drif_err_state_crc_fr),
  .drif_mcu_idle(drif_mcu_idle),
  .drif_cke_reg(drif_cke_reg),
  .rdata_drif_rd_req_vld(rdata_drif_rd_req_vld),
  .rdata_drif_wr_req_vld(rdata_drif_wr_req_vld),
  .rdata_drif_addr(rdata_drif_addr[12:0]),
  .rdata_drif_data(rdata_drif_data[63:0]),
  .rdata_mcu_selfrsh(rdata_mcu_selfrsh),
  .rdpctl_err_addr_reg(rdpctl_err_addr_reg[35:0]),
  .rdpctl_err_sts_reg(rdpctl_err_sts_reg[25:0]),
  .rdpctl_err_loc(rdpctl_err_loc[35:0]),
  .rdpctl_err_cnt(rdpctl_err_cnt[15:0]),
  .rdpctl_err_retry_reg(rdpctl_err_retry_reg[36:0]),
  .rdpctl_dbg_trig_enable(rdpctl_dbg_trig_enable),
  .rdpctl_kp_lnk_up(rdpctl_kp_lnk_up),
  .rdpctl_mask_err(rdpctl_mask_err),
  .rdpctl_dtm_mask_chnl(rdpctl_dtm_mask_chnl[1:0]),
  .rdpctl_dtm_atspeed(rdpctl_dtm_atspeed),
  .rdpctl_drq0_clear_ent(rdpctl_drq0_clear_ent[7:0]),
  .rdpctl_drq1_clear_ent(rdpctl_drq1_clear_ent[7:0]),
  .rdpctl_scrub_wren(rdpctl_scrub_wren),
  .rdpctl_scrub_addrinc_en(rdpctl_scrub_addrinc_en),
  .readdp_ecc_multi_err(readdp_ecc_multi_err[1:0]),
  .addrdp_ras_adr_queue(addrdp_ras_adr_queue[14:0]),
  .addrdp_cas_adr_queue(addrdp_cas_adr_queue[10:0]),
  .addrdp_rd_req_id_queue(addrdp_rd_req_id_queue[2:0]),
  .addrdp_ras_wr1_adr_queue(addrdp_ras_wr1_adr_queue[14:0]),
  .addrdp_cas_wr1_adr_queue(addrdp_cas_wr1_adr_queue[10:0]),
  .addrdp_ras_wr2_adr_queue(addrdp_ras_wr2_adr_queue[14:0]),
  .addrdp_cas_wr2_adr_queue(addrdp_cas_wr2_adr_queue[10:0]),
  .l2b0_rd_rank_adr(l2b0_rd_rank_adr),
  .l2b0_rd_dimm_adr(l2b0_rd_dimm_adr[2:0]),
  .l2b0_rd_bank_adr(l2b0_rd_bank_adr[2:0]),
  .l2b0_rd_addr_err(l2b0_rd_addr_err),
  .l2b0_rd_addr_par(l2b0_rd_addr_par),
  .l2b1_rd_rank_adr(l2b1_rd_rank_adr),
  .l2b1_rd_dimm_adr(l2b1_rd_dimm_adr[2:0]),
  .l2b1_rd_bank_adr(l2b1_rd_bank_adr[2:0]),
  .l2b1_rd_addr_err(l2b1_rd_addr_err),
  .l2b1_rd_addr_par(l2b1_rd_addr_par),
  .l2b0_wr_rank_adr(l2b0_wr_rank_adr),
  .l2b0_wr_dimm_adr(l2b0_wr_dimm_adr[2:0]),
  .l2b0_wr_bank_adr(l2b0_wr_bank_adr[2:0]),
  .l2b0_wr_addr_err(l2b0_wr_addr_err),
  .l2b0_wr_addr_par(l2b0_wr_addr_par),
  .l2b1_wr_rank_adr(l2b1_wr_rank_adr),
  .l2b1_wr_dimm_adr(l2b1_wr_dimm_adr[2:0]),
  .l2b1_wr_bank_adr(l2b1_wr_bank_adr[2:0]),
  .l2b1_wr_addr_err(l2b1_wr_addr_err),
  .l2b1_wr_addr_par(l2b1_wr_addr_par),
  .l2if0_rd_req(l2if0_rd_req),
  .l2if0_wr_req(l2if0_wr_req),
  .l2if0_data_wr_addr(l2if0_data_wr_addr[2:0]),
  .l2if0_wdq_rd_inh(l2if0_wdq_rd_inh),
  .l2if0_wdq_in_cntr(l2if0_wdq_in_cntr[3:0]),
  .l2if1_rd_req(l2if1_rd_req),
  .l2if1_wr_req(l2if1_wr_req),
  .l2if1_data_wr_addr(l2if1_data_wr_addr[2:0]),
  .l2if1_wdq_rd_inh(l2if1_wdq_rd_inh),
  .l2if1_wdq_in_cntr(l2if1_wdq_in_cntr[3:0]),
  .mcu_pt_sync_in0(mcu_pt_sync_in0),
  .mcu_pt_sync_in1(mcu_pt_sync_in1),
  .mcu_pt_sync_in2(mcu_pt_sync_in2),
  .addrdp0_rd_wr_adr0_eq(addrdp0_rd_wr_adr0_eq),
  .addrdp0_rd_wr_adr1_eq(addrdp0_rd_wr_adr1_eq),
  .addrdp0_rd_wr_adr2_eq(addrdp0_rd_wr_adr2_eq),
  .addrdp0_rd_wr_adr3_eq(addrdp0_rd_wr_adr3_eq),
  .addrdp0_rd_wr_adr4_eq(addrdp0_rd_wr_adr4_eq),
  .addrdp0_rd_wr_adr5_eq(addrdp0_rd_wr_adr5_eq),
  .addrdp0_rd_wr_adr6_eq(addrdp0_rd_wr_adr6_eq),
  .addrdp0_rd_wr_adr7_eq(addrdp0_rd_wr_adr7_eq),
  .addrdp1_rd_wr_adr0_eq(addrdp1_rd_wr_adr0_eq),
  .addrdp1_rd_wr_adr1_eq(addrdp1_rd_wr_adr1_eq),
  .addrdp1_rd_wr_adr2_eq(addrdp1_rd_wr_adr2_eq),
  .addrdp1_rd_wr_adr3_eq(addrdp1_rd_wr_adr3_eq),
  .addrdp1_rd_wr_adr4_eq(addrdp1_rd_wr_adr4_eq),
  .addrdp1_rd_wr_adr5_eq(addrdp1_rd_wr_adr5_eq),
  .addrdp1_rd_wr_adr6_eq(addrdp1_rd_wr_adr6_eq),
  .addrdp1_rd_wr_adr7_eq(addrdp1_rd_wr_adr7_eq),
  .rdpctl_scrub_read_done(rdpctl_scrub_read_done),
  .wdqrf00_data_mecc(wdqrf00_data_mecc),
  .wdqrf01_data_mecc(wdqrf01_data_mecc),
  .wdqrf10_data_mecc(wdqrf10_data_mecc),
  .wdqrf11_data_mecc(wdqrf11_data_mecc),
  .rdpctl_err_fifo_enq(rdpctl_err_fifo_enq),
  .rdpctl_err_fifo_data(rdpctl_err_fifo_data[14:0]),
  .rdpctl_fifo_empty(rdpctl_fifo_empty),
  .rdpctl_fifo_full(rdpctl_fifo_full),
  .rdpctl_no_crc_err(rdpctl_no_crc_err),
  .rdpctl_crc_err(rdpctl_crc_err),
  .fbdic_ucb_rd_data(fbdic_ucb_rd_data[65:0]),
  .fbdic_sync_frame_req_early3(fbdic_sync_frame_req_early3),
  .fbdic_sync_frame_req_early2(fbdic_sync_frame_req_early2),
  .fbdic_sync_frame_req_early1(fbdic_sync_frame_req_early1),
  .fbdic_sync_frame_req(fbdic_sync_frame_req),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_woq_free(fbdic_woq_free[1:0]),
  .fbdic_clear_wrq_ent(fbdic_clear_wrq_ent),
  .fbdic_error_mode(fbdic_error_mode),
  .fbdic_l0s_lfsr_stall(fbdic_l0s_lfsr_stall),
  .fbdic_err_fast_reset_done(fbdic_err_fast_reset_done),
  .fbdic_chnl_reset_error_mode(fbdic_chnl_reset_error_mode),
  .fbdic_mcu_idle(fbdic_mcu_idle),
  .aclk_wmr(aclk_wmr),
  .tcu_scan_en(tcu_scan_en),
  .wmr_protect(wmr_protect)
);

mcu_ucb_ctl ucb (
	.scan_in(ucb_scanin),
	.scan_out(ucb_scanout),
	.iol2clk(iol2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(io_pce_ov),
	.ucb_mcu_rd_req_vld0(ucb_mcu_rd_req_vld),
	.ucb_mcu_wr_req_vld0(ucb_mcu_wr_req_vld),
	.mcu_ucb_ack_vld0(mcu_ucb_ack_vld),
	.mcu_ucb_nack_vld0(mcu_ucb_nack_vld),
	.mcu_ucb_data0(mcu_ucb_data[63:0]),
	.rdata_err_intr0(rdata_err_intr),
	.clspine_mcu_selfrsh(rst_mcu_selfrsh),
        .mcu_ucb_rd_req_in_0 (mcu_ucb_rd_req_in_0[3:0]),
        .mcu_ucb_wr_req_in_0 (mcu_ucb_wr_req_in_0),
        .mcu_ucb_rd_req_in_1 (mcu_ucb_rd_req_in_1[3:0]),
        .mcu_ucb_wr_req_in_1 (mcu_ucb_wr_req_in_1),
  .mcu_ucb_rd_request_out(mcu_ucb_rd_request_out[4:0]),
  .mcu_ucb_wr_req_out(mcu_ucb_wr_req_out[1:0]),
  .mcu_ucb_mecc_err(mcu_ucb_mecc_err),
  .mcu_ucb_secc_err(mcu_ucb_secc_err),
  .mcu_ucb_fbd_err(mcu_ucb_fbd_err),
  .mcu_ucb_err_mode(mcu_ucb_err_mode),
  .mcu_ucb_err_event(mcu_ucb_err_event),
  .mcu_dbg1_rd_req_out(mcu_dbg1_rd_req_out[4:0]),
  .mcu_dbg1_wr_req_out(mcu_dbg1_wr_req_out[1:0]),
  .mcu_dbg1_mecc_err(mcu_dbg1_mecc_err),
  .mcu_dbg1_secc_err(mcu_dbg1_secc_err),
  .mcu_dbg1_fbd_err(mcu_dbg1_fbd_err),
  .mcu_dbg1_err_mode(mcu_dbg1_err_mode),
  .mcu_dbg1_err_event(mcu_dbg1_err_event),
  .mcu_dbg1_rd_req_in_0(mcu_dbg1_rd_req_in_0[3:0]),
  .mcu_dbg1_wr_req_in_0(mcu_dbg1_wr_req_in_0),
  .mcu_dbg1_rd_req_in_1(mcu_dbg1_rd_req_in_1[3:0]),
  .mcu_dbg1_wr_req_in_1(mcu_dbg1_wr_req_in_1),
  .mcu_dbg1_crc21(mcu_dbg1_crc21),
  .ucb_mcu_addr(ucb_mcu_addr[12:0]),
  .ucb_mcu_data(ucb_mcu_data[63:0]),
  .ucb_rdata_selfrsh(ucb_rdata_selfrsh),
  .ucb_err_ecci(ucb_err_ecci),
  .ucb_err_fbui(ucb_err_fbui),
  .ucb_err_fbri(ucb_err_fbri),
  .ucb_pm(ucb_pm),
  .ucb_pm_ba01(ucb_pm_ba01),
  .ucb_pm_ba23(ucb_pm_ba23),
  .ucb_pm_ba45(ucb_pm_ba45),
  .ucb_pm_ba67(ucb_pm_ba67),
  .mcu_ncu_vld(mcu_ncu_vld),
  .mcu_ncu_data(mcu_ncu_data[3:0]),
  .mcu_ncu_stall(mcu_ncu_stall),
  .mcu_ncu_ecc(mcu_ncu_ecc),
  .mcu_ncu_fbr(mcu_ncu_fbr),
  .ncu_mcu_vld(ncu_mcu_vld),
  .ncu_mcu_data(ncu_mcu_data[3:0]),
  .ncu_mcu_stall(ncu_mcu_stall),
  .ncu_mcu_ecci(ncu_mcu_ecci),
  .ncu_mcu_fbui(ncu_mcu_fbui),
  .ncu_mcu_fbri(ncu_mcu_fbri),
  .ncu_mcu_pm(ncu_mcu_pm),
  .ncu_mcu_ba01(ncu_mcu_ba01),
  .ncu_mcu_ba23(ncu_mcu_ba23),
  .ncu_mcu_ba45(ncu_mcu_ba45),
  .ncu_mcu_ba67(ncu_mcu_ba67),
  .rdata_err_fbr(rdata_err_fbr),
  .fbdiwr_dtm_crc(fbdiwr_dtm_crc[21:0]),
  .rdata_serdes_dtm(rdata_serdes_dtm),
  .tcu_scan_en(tcu_scan_en)
);

mcu_rdata_ctl rdata (
	.scan_in(rdata_scanin),
	.scan_out(rdata_scanout),
	.l2clk(l2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(cmp_pce_ov),
	.ccu_mcu_cmp_ddr_sync_en(dr_sync_en),
	.ccu_mcu_ddr_cmp_sync_en(dr_sync_en),
	.ccu_mcu_cmp_io_sync_en(cmp_io_sync_en),
	.ccu_mcu_io_cmp_sync_en(io_cmp_sync_en),
	.wdqrf00_data({wdrqf00_data[6:0], wdqrf00_data_mecc}),
	.wdqrf01_data({wdrqf01_data[6:0], wdqrf01_data_mecc}),
	.wdqrf10_data({wdrqf10_data[6:0], wdqrf10_data_mecc}),
	.wdqrf11_data({wdrqf11_data[6:0], wdqrf11_data_mecc}),
	.mbist_read_data(mbist_read_data[71:64]),
	.mcu_l2t0_data_vld_r0(mcu_l2t0_data_vld_r0_unused),
	.mcu_l2t0_qword_id_r0(mcu_l2t0_qword_id_r0_unused[1:0]),
	.mcu_l2t0_rd_req_id_r0(mcu_l2t0_rd_req_id_r0_unused[2:0]),
	.mcu_l2t1_data_vld_r0(mcu_l2t1_data_vld_r0_unused),
	.mcu_l2t1_qword_id_r0(mcu_l2t1_qword_id_r0_unused[1:0]),
	.mcu_l2t1_rd_req_id_r0(mcu_l2t1_rd_req_id_r0_unused[2:0]),
  .mcu_ucb_rd_request_out(mcu_ucb_rd_request_out[4:0]),
  .mcu_ucb_wr_req_out(mcu_ucb_wr_req_out[1:0]),
  .mcu_ucb_mecc_err(mcu_ucb_mecc_err),
  .mcu_ucb_secc_err(mcu_ucb_secc_err),
  .mcu_ucb_fbd_err(mcu_ucb_fbd_err),
  .mcu_ucb_err_mode(mcu_ucb_err_mode),
  .mcu_ucb_err_event(mcu_ucb_err_event),
  .mcu_l2t0_mecc_err_r3(mcu_l2t0_mecc_err_r3),
  .mcu_l2t0_secc_err_r3(mcu_l2t0_secc_err_r3),
  .mcu_l2t0_scb_mecc_err(mcu_l2t0_scb_mecc_err),
  .mcu_l2t0_scb_secc_err(mcu_l2t0_scb_secc_err),
  .mcu_l2t1_mecc_err_r3(mcu_l2t1_mecc_err_r3),
  .mcu_l2t1_secc_err_r3(mcu_l2t1_secc_err_r3),
  .mcu_l2t1_scb_mecc_err(mcu_l2t1_scb_mecc_err),
  .mcu_l2t1_scb_secc_err(mcu_l2t1_scb_secc_err),
  .rdata_drif_rd_req_vld(rdata_drif_rd_req_vld),
  .rdata_drif_wr_req_vld(rdata_drif_wr_req_vld),
  .rdata_drif_addr(rdata_drif_addr[12:0]),
  .rdata_drif_data(rdata_drif_data[63:0]),
  .rdata_mcu_selfrsh(rdata_mcu_selfrsh),
  .rdata_err_ecci(rdata_err_ecci),
  .rdata_err_fbri(rdata_err_fbri),
  .rdata_err_fbui(rdata_err_fbui),
  .mcu_ucb_ack_vld(mcu_ucb_ack_vld),
  .mcu_ucb_nack_vld(mcu_ucb_nack_vld),
  .mcu_ucb_data(mcu_ucb_data[63:0]),
  .rdata_err_intr(rdata_err_intr),
  .rdata_err_fbr(rdata_err_fbr),
  .rdata_cmp_ddr_sync_en(rdata_cmp_ddr_sync_en),
  .rdata_ddr_cmp_sync_en(rdata_ddr_cmp_sync_en),
  .rdata_rddata_sel(rdata_rddata_sel[1:0]),
  .rdata_pa_err(rdata_pa_err),
  .rdata_pm_1mcu(rdata_pm_1mcu),
  .rdata_pm_2mcu(rdata_pm_2mcu),
  .rdata0_wdq_rd(rdata0_wdq_rd[1:0]),
  .rdata1_wdq_rd(rdata1_wdq_rd[1:0]),
  .rdata_wdq_radr(rdata_wdq_radr[4:0]),
  .mbist_run_d1(mbist_run_d1),
  .mbist_run_d1_l(mbist_run_d1_l),
  .mbist_sel_hiorlo_72bits_d1(mbist_sel_hiorlo_72bits_d1),
  .mbist_sel_bank0or1_d1(mbist_sel_bank0or1_d1),
  .rdata_serdes_dtm(rdata_serdes_dtm),
  .ucb_rdata_selfrsh(ucb_rdata_selfrsh),
  .ucb_mcu_rd_req_vld(ucb_mcu_rd_req_vld),
  .ucb_mcu_wr_req_vld(ucb_mcu_wr_req_vld),
  .ucb_mcu_addr(ucb_mcu_addr[12:0]),
  .ucb_mcu_data(ucb_mcu_data[63:0]),
  .ucb_err_ecci(ucb_err_ecci),
  .ucb_err_fbri(ucb_err_fbri),
  .ucb_err_fbui(ucb_err_fbui),
  .drif_rdata_ack_vld(drif_rdata_ack_vld),
  .drif_rdata_nack_vld(drif_rdata_nack_vld),
  .drif_rdata_data(drif_rdata_data[63:0]),
  .fbdic_err_fbr(fbdic_err_fbr),
  .rdpctl_l2t0_data_valid(rdpctl_l2t0_data_valid),
  .rdpctl_l2t1_data_valid(rdpctl_l2t1_data_valid),
  .rdpctl_qword_id(rdpctl_qword_id),
  .rdpctl_rd_req_id(rdpctl_rd_req_id[2:0]),
  .rdpctl_pa_err(rdpctl_pa_err),
  .rdpctl_scrb0_err_valid(rdpctl_scrb0_err_valid),
  .rdpctl_scrb1_err_valid(rdpctl_scrb1_err_valid),
  .rdpctl_fbd0_recov_err(rdpctl_fbd0_recov_err),
  .rdpctl_fbd1_recov_err(rdpctl_fbd1_recov_err),
  .rdpctl_fbd_unrecov_err(rdpctl_fbd_unrecov_err[1:0]),
  .rdpctl_secc_cnt_intr(rdpctl_secc_cnt_intr),
  .rdpctl_dbg_trig_enable(rdpctl_dbg_trig_enable),
  .fbdic_fbd_error(fbdic_fbd_error),
  .drif_mcu_error_mode(drif_mcu_error_mode),
  .woq_wr_req_out(woq_wr_req_out[1:0]),
  .ucb_pm(ucb_pm),
  .ucb_pm_ba01(ucb_pm_ba01),
  .ucb_pm_ba23(ucb_pm_ba23),
  .ucb_pm_ba45(ucb_pm_ba45),
  .ucb_pm_ba67(ucb_pm_ba67),
  .readdp_l2_secc_err_dly1(readdp_l2_secc_err_dly1),
  .readdp_l2_mecc_err_dly1(readdp_l2_mecc_err_dly1),
  .mbist_run(mbist_run),
  .mbist_addr(mbist_addr[4:0]),
  .mbist_sel_bank0or1(mbist_sel_bank0or1),
  .mbist_sel_hiorlo_72bits(mbist_sel_hiorlo_72bits),
  .mbist_wdqrf00_rd_en(mbist_wdqrf00_rd_en),
  .mbist_wdqrf01_rd_en(mbist_wdqrf01_rd_en),
  .mbist_wdqrf10_rd_en(mbist_wdqrf10_rd_en),
  .mbist_wdqrf11_rd_en(mbist_wdqrf11_rd_en),
  .drif0_wdq_rd(drif0_wdq_rd),
  .drif1_wdq_rd(drif1_wdq_rd),
  .drif_wdq_radr(drif_wdq_radr[4:0]),
  .fbdic_srds_dtm_muxsel(fbdic_srds_dtm_muxsel),
  .array_wr_inhibit(array_wr_inhibit),
  .cmp_array_wr_inhibit(cmp_array_wr_inhibit),
  .dr_array_wr_inhibit(dr_array_wr_inhibit),
  .tcu_scan_en(tcu_scan_en)
);

mcu_rdpctl_ctl rdpctl ( // FS:wmr_protect
	.wmr_scan_in(rdpctl_wmr_scanin),
	.wmr_scan_out(rdpctl_wmr_scanout),
	.scan_in(rdpctl_scanin),
	.scan_out(rdpctl_scanout),
	.drl2clk(drl2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(dr_pce_ov),
	.drif_ucb_data_39to0(drif_ucb_data[39:0]),
	.drif_ucb_data_63to54(drif_ucb_data[63:54]),
  .rdpctl_scrub_addrinc_en(rdpctl_scrub_addrinc_en),
  .rdpctl_err_addr_reg(rdpctl_err_addr_reg[35:0]),
  .rdpctl_err_sts_reg(rdpctl_err_sts_reg[25:0]),
  .rdpctl_err_loc(rdpctl_err_loc[35:0]),
  .rdpctl_err_cnt(rdpctl_err_cnt[15:0]),
  .rdpctl_err_retry_reg(rdpctl_err_retry_reg[36:0]),
  .rdpctl_dbg_trig_enable(rdpctl_dbg_trig_enable),
  .rdpctl_drq0_clear_ent(rdpctl_drq0_clear_ent[7:0]),
  .rdpctl_drq1_clear_ent(rdpctl_drq1_clear_ent[7:0]),
  .rdpctl_err_fifo_enq(rdpctl_err_fifo_enq),
  .rdpctl_err_fifo_data(rdpctl_err_fifo_data[14:0]),
  .rdpctl_fifo_empty(rdpctl_fifo_empty),
  .rdpctl_fifo_full(rdpctl_fifo_full),
  .rdpctl_no_crc_err(rdpctl_no_crc_err),
  .rdpctl_crc_err(rdpctl_crc_err),
  .rdpctl_fbd0_recov_err(rdpctl_fbd0_recov_err),
  .rdpctl_fbd1_recov_err(rdpctl_fbd1_recov_err),
  .rdpctl_fbd_unrecov_err(rdpctl_fbd_unrecov_err[1:0]),
  .rdpctl_crc_recov_err(rdpctl_crc_recov_err),
  .rdpctl_crc_unrecov_err(rdpctl_crc_unrecov_err),
  .rdpctl_scrub_read_done(rdpctl_scrub_read_done),
  .rdpctl_scrb0_err_valid(rdpctl_scrb0_err_valid),
  .rdpctl_scrb1_err_valid(rdpctl_scrb1_err_valid),
  .rdpctl_l2t0_data_valid(rdpctl_l2t0_data_valid),
  .rdpctl_l2t1_data_valid(rdpctl_l2t1_data_valid),
  .rdpctl_qword_id(rdpctl_qword_id),
  .rdpctl_rd_req_id(rdpctl_rd_req_id[2:0]),
  .rdpctl_pa_err(rdpctl_pa_err),
  .rdpctl_radr_parity(rdpctl_radr_parity),
  .rdpctl_rddata_en(rdpctl_rddata_en[2:0]),
  .rdpctl_inj_ecc_err(rdpctl_inj_ecc_err),
  .rdpctl0_dummy_data_valid(rdpctl0_dummy_data_valid),
  .rdpctl1_dummy_data_valid(rdpctl1_dummy_data_valid),
  .rdpctl_secc_cnt_intr(rdpctl_secc_cnt_intr),
  .rdpctl_scrub_wren(rdpctl_scrub_wren),
  .rdpctl_mask_err(rdpctl_mask_err),
  .rdpctl_dtm_mask_chnl(rdpctl_dtm_mask_chnl[1:0]),
  .rdpctl_dtm_atspeed(rdpctl_dtm_atspeed),
  .rdpctl_dtm_chnl_enable(rdpctl_dtm_chnl_enable[1:0]),
  .fbdic_serdes_dtm(fbdic_serdes_dtm),
  .fbdic_rddata_vld(fbdic_rddata_vld),
  .fbdic_crc_error(fbdic_crc_error),
  .fbdic_chnl_reset_error(fbdic_chnl_reset_error),
  .drif_err_state_crc_fr(drif_err_state_crc_fr),
  .fbdic_chnl_reset_error_mode(fbdic_chnl_reset_error_mode),
  .fbdic_err_unrecov(fbdic_err_unrecov),
  .fbdic_err_recov(fbdic_err_recov),
  .fbdic_cfgrd_crc_error(fbdic_cfgrd_crc_error),
  .drif_send_info_val(drif_send_info_val),
  .drif_send_info(drif_send_info[19:0]),
  .readdp_ecc_single_err(readdp_ecc_single_err[1:0]),
  .readdp_ecc_multi_err(readdp_ecc_multi_err[1:0]),
  .readdp0_syndrome(readdp0_syndrome[15:0]),
  .readdp1_syndrome(readdp1_syndrome[15:0]),
  .readdp0_ecc_loc(readdp0_ecc_loc[35:0]),
  .readdp1_ecc_loc(readdp1_ecc_loc[35:0]),
  .drif_scrub_addr(drif_scrub_addr[31:0]),
  .mcu_id(mcu_id[1:0]),
  .drif_single_channel_mode(drif_single_channel_mode),
  .l2if0_rd_dummy_req(l2if0_rd_dummy_req),
  .l2if0_rd_dummy_req_addr5(l2if0_rd_dummy_req_addr5),
  .l2if0_rd_dummy_req_id(l2if0_rd_dummy_req_id[2:0]),
  .l2if0_rd_dummy_addr_err(l2if0_rd_dummy_addr_err),
  .l2if1_rd_dummy_req(l2if1_rd_dummy_req),
  .l2if1_rd_dummy_req_addr5(l2if1_rd_dummy_req_addr5),
  .l2if1_rd_dummy_req_id(l2if1_rd_dummy_req_id[2:0]),
  .l2if1_rd_dummy_addr_err(l2if1_rd_dummy_addr_err),
  .drif_err_sts_reg_ld(drif_err_sts_reg_ld),
  .drif_err_addr_reg_ld(drif_err_addr_reg_ld),
  .drif_err_cnt_reg_ld(drif_err_cnt_reg_ld),
  .drif_err_loc_reg_ld(drif_err_loc_reg_ld),
  .drif_err_retry_reg_ld(drif_err_retry_reg_ld),
  .drif_dbg_trig_reg_ld(drif_dbg_trig_reg_ld),
  .rdata_err_ecci(rdata_err_ecci),
  .rdata_pm_1mcu(rdata_pm_1mcu),
  .rdata_pm_2mcu(rdata_pm_2mcu),
  .aclk_wmr(aclk_wmr),
  .tcu_scan_en(tcu_scan_en),
  .wmr_protect(wmr_protect)
);

mcu_fdout_ctl fdout (
	.scan_in(fdout_scanin),
	.scan_out(fdout_scanout),
	.drl2clk(dr_gclk),
	.tcu_aclk(tcu_aclk),
	.tcu_bclk(tcu_bclk),
	.tcu_pce_ov(dr_pce_ov),
  .mcu_fsr0_data(mcu_fsr0_data[119:0]),
  .mcu_fsr1_data(mcu_fsr1_data[119:0]),
  .fbdiwr0_data(fbdiwr0_data[119:0]),
  .fbdiwr1_data(fbdiwr1_data[119:0]),
  .rdpctl_kp_lnk_up(rdpctl_kp_lnk_up),
  .fbdic_link_cnt_eq_0_d1(fbdic_link_cnt_eq_0_d1),
  .tcu_mcu_fbd_clk_stop(tcu_mcu_fbd_clk_stop),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_scan_en(tcu_scan_en),
  .tcu_mcu_testmode(tcu_mcu_testmode)
);

mcu_fdoklu_ctl fdoklu (
	.scan_in(fdoklu_scanin),
	.scan_out(fdoklu_scanout),
	.drl2clk(dr_gclk),
	.tcu_aclk(tcu_aclk),
	.tcu_bclk(tcu_bclk),
	.tcu_pce_ov(dr_pce_ov),
  .fdout0_frame_lock_sync(fdout0_frame_lock_sync[13:0]),
  .fdout1_frame_lock_sync(fdout1_frame_lock_sync[13:0]),
  .fdout0_rptr0(fdout0_rptr0[1:0]),
  .fdout0_rptr1(fdout0_rptr1[1:0]),
  .fdout0_rptr2(fdout0_rptr2[1:0]),
  .fdout0_rptr3(fdout0_rptr3[1:0]),
  .fdout0_rptr4(fdout0_rptr4[1:0]),
  .fdout0_rptr5(fdout0_rptr5[1:0]),
  .fdout0_rptr6(fdout0_rptr6[1:0]),
  .fdout0_rptr7(fdout0_rptr7[1:0]),
  .fdout0_rptr8(fdout0_rptr8[1:0]),
  .fdout0_rptr9(fdout0_rptr9[1:0]),
  .fdout0_rptr10(fdout0_rptr10[1:0]),
  .fdout0_rptr11(fdout0_rptr11[1:0]),
  .fdout0_rptr12(fdout0_rptr12[1:0]),
  .fdout0_rptr13(fdout0_rptr13[1:0]),
  .fdout1_rptr0(fdout1_rptr0[1:0]),
  .fdout1_rptr1(fdout1_rptr1[1:0]),
  .fdout1_rptr2(fdout1_rptr2[1:0]),
  .fdout1_rptr3(fdout1_rptr3[1:0]),
  .fdout1_rptr4(fdout1_rptr4[1:0]),
  .fdout1_rptr5(fdout1_rptr5[1:0]),
  .fdout1_rptr6(fdout1_rptr6[1:0]),
  .fdout1_rptr7(fdout1_rptr7[1:0]),
  .fdout1_rptr8(fdout1_rptr8[1:0]),
  .fdout1_rptr9(fdout1_rptr9[1:0]),
  .fdout1_rptr10(fdout1_rptr10[1:0]),
  .fdout1_rptr11(fdout1_rptr11[1:0]),
  .fdout1_rptr12(fdout1_rptr12[1:0]),
  .fdout1_rptr13(fdout1_rptr13[1:0]),
  .fdout_idle_lfsr(fdout_idle_lfsr[11:0]),
  .fdout_idle_lfsr_l_0(fdout_idle_lfsr_l_0),
  .fdout_link_cnt(fdout_link_cnt[5:0]),
  .fbdic_link_cnt_eq_0_d1(fbdic_link_cnt_eq_0_d1),
  .rdpctl_kp_lnk_up(rdpctl_kp_lnk_up),
  .fbdic_link_cnt_en(fbdic_link_cnt_en),
  .fbdic_idle_lfsr_reset(fbdic_idle_lfsr_reset),
  .fbdic_link_cnt_reset(fbdic_link_cnt_reset[5:0]),
  .fbdic_l0_state(fbdic_l0_state),
  .fbd0_frame_lock(fbd0_frame_lock[13:0]),
  .fbd1_frame_lock(fbd1_frame_lock[13:0]),
  .tcu_mcu_fbd_clk_stop(tcu_mcu_fbd_clk_stop),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_scan_en(tcu_scan_en),
  .tcu_mcu_testmode(tcu_mcu_testmode)
);

mcu_fbdic_ctl fbdic ( // FS:wmr_protect
	.wmr_scan_in(fbdic_wmr_scanin),
	.fbdic_wmr_scanout(fbdic_wmr_scanout),
	.scan_in(fbdic_scanin),
	.scan_out(fbdic_scanout),
	.fbdtm_si(fbdtm_scanin),
	.fbdtm_so(fbdtm_scanout),
	.fbdtm_wmr_si(fbdtm_wmr_scanin),
	.fbdtm_wmr_so(fbdtm_wmr_scanout),
	.drl2clk(drl2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(dr_pce_ov),
	.fbdird0_cnfgreg_data(fbdird0_data[103:72]),
	.fbdird1_cnfgreg_data(fbdird0_data[31:0]),
	.fsr0_mcu_stspll_lock(fsr0_mcu_stspll_lock[2:0]),
	.fsr1_mcu_stspll_lock(fsr1_mcu_stspll_lock[2:0]),
	.fbd0_frame_lock(fdout0_frame_lock_sync[13:0]),
	.fbd1_frame_lock(fdout1_frame_lock_sync[13:0]),
  .fbdic_data_sel(fbdic_data_sel[4:0]),
  .fbdic0_ts_data(fbdic0_ts_data[11:0]),
  .fbdic1_ts_data(fbdic1_ts_data[11:0]),
  .fbdic_ibist_data(fbdic_ibist_data[119:0]),
  .fbdic_f(fbdic_f[1:0]),
  .fbdic_f_1_l(fbdic_f_1_l),
  .fbdic0_chnl_disable(fbdic0_chnl_disable),
  .fbdic1_chnl_disable(fbdic1_chnl_disable),
  .fbdic_a_cmd(fbdic_a_cmd[23:0]),
  .fbdic_bc_cmd(fbdic_bc_cmd[71:0]),
  .fbdic0_cmd_crc_sel(fbdic0_cmd_crc_sel[1:0]),
  .fbdic0_data_crc_sel(fbdic0_data_crc_sel[2:0]),
  .fbdic0_sb_failover(fbdic0_sb_failover),
  .fbdic0_sb_failover_l(fbdic0_sb_failover_l),
  .fbdic0_sb_failover_mask(fbdic0_sb_failover_mask[8:0]),
  .fbdic0_sb_failover_mask_l(fbdic0_sb_failover_mask_l[8:0]),
  .fbdic0_nb_failover(fbdic0_nb_failover),
  .fbdic0_nb_failover_l(fbdic0_nb_failover_l),
  .fbdic0_nb_failover_mask(fbdic0_nb_failover_mask[12:0]),
  .fbdic0_nb_failover_mask_l(fbdic0_nb_failover_mask_l[12:0]),
  .fbdic1_cmd_crc_sel(fbdic1_cmd_crc_sel[1:0]),
  .fbdic1_data_crc_sel(fbdic1_data_crc_sel[2:0]),
  .fbdic1_sb_failover(fbdic1_sb_failover),
  .fbdic1_sb_failover_l(fbdic1_sb_failover_l),
  .fbdic1_sb_failover_mask(fbdic1_sb_failover_mask[8:0]),
  .fbdic1_sb_failover_mask_l(fbdic1_sb_failover_mask_l[8:0]),
  .fbdic1_nb_failover(fbdic1_nb_failover),
  .fbdic1_nb_failover_l(fbdic1_nb_failover_l),
  .fbdic1_nb_failover_mask(fbdic1_nb_failover_mask[12:0]),
  .fbdic1_nb_failover_mask_l(fbdic1_nb_failover_mask_l[12:0]),
  .fbdic_ucb_rd_data(fbdic_ucb_rd_data[65:0]),
  .fbdic_train_state(fbdic_train_state),
  .fbdic_disable_state(fbdic_disable_state),
  .fbdic_enable_sync_count(fbdic_enable_sync_count),
  .fbdic_sync_frame_req_early3(fbdic_sync_frame_req_early3),
  .fbdic_sync_frame_req_early2(fbdic_sync_frame_req_early2),
  .fbdic_sync_frame_req_early1(fbdic_sync_frame_req_early1),
  .fbdic_sync_frame_req(fbdic_sync_frame_req),
  .fbdic_sync_frame_req_d1(fbdic_sync_frame_req_d1),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_l0s_lfsr_stall(fbdic_l0s_lfsr_stall),
  .fbdic_err_fast_reset_done(fbdic_err_fast_reset_done),
  .fbdic_chnl_reset_error(fbdic_chnl_reset_error),
  .fbdic_chnl_reset_error_mode(fbdic_chnl_reset_error_mode),
  .fbdic_special_cmd(fbdic_special_cmd),
  .fbdic_special_cmd_l(fbdic_special_cmd_l),
  .fbdic_ibrx_data_sel(fbdic_ibrx_data_sel),
  .fbdic_ibrx_data_sel_l(fbdic_ibrx_data_sel_l),
  .fbdic_rddata_vld(fbdic_rddata_vld),
  .fbdic_rddata_vld_l(fbdic_rddata_vld_l),
  .fbdic_woq_free(fbdic_woq_free[1:0]),
  .fbdic_clear_wrq_ent(fbdic_clear_wrq_ent),
  .fbdic_error_mode(fbdic_error_mode),
  .fbdic_fbd_error(fbdic_fbd_error),
  .fbdic_crc_error(fbdic_crc_error),
  .fbdic_err_unrecov(fbdic_err_unrecov),
  .fbdic_err_recov(fbdic_err_recov),
  .fbdic_err_fbr(fbdic_err_fbr),
  .fbdic0_inc_wptr(fbdic0_inc_wptr),
  .fbdic0_inc_rptr(fbdic0_inc_rptr[13:0]),
  .fbdic0_clr_ptrs(fbdic0_clr_ptrs),
  .fbdic1_inc_wptr(fbdic1_inc_wptr),
  .fbdic1_inc_rptr(fbdic1_inc_rptr[13:0]),
  .fbdic1_clr_ptrs(fbdic1_clr_ptrs),
  .fbdic_idle_lfsr_reset(fbdic_idle_lfsr_reset),
  .mcu_fsr0_cfgpll_enpll(mcu_fsr0_cfgpll_enpll),
  .mcu_fsr1_cfgpll_enpll(mcu_fsr1_cfgpll_enpll),
  .mcu_fsr01_cfgpll_lb(mcu_fsr01_cfgpll_lb[1:0]),
  .mcu_fsr01_cfgpll_mpy(mcu_fsr01_cfgpll_mpy[3:0]),
  .mcu_fsr0_cfgrx_enrx(mcu_fsr0_cfgrx_enrx),
  .mcu_fsr1_cfgrx_enrx(mcu_fsr1_cfgrx_enrx),
  .mcu_fsr0_cfgrx_entest(mcu_fsr0_cfgrx_entest),
  .mcu_fsr1_cfgrx_entest(mcu_fsr1_cfgrx_entest),
  .mcu_fsr0_cfgrx_align(mcu_fsr0_cfgrx_align),
  .mcu_fsr1_cfgrx_align(mcu_fsr1_cfgrx_align),
  .mcu_fsr0_cfgrx_invpair(mcu_fsr0_cfgrx_invpair[13:0]),
  .mcu_fsr1_cfgrx_invpair(mcu_fsr1_cfgrx_invpair[13:0]),
  .mcu_fsr01_cfgrx_eq(mcu_fsr01_cfgrx_eq[3:0]),
  .mcu_fsr01_cfgrx_cdr(mcu_fsr01_cfgrx_cdr[2:0]),
  .mcu_fsr01_cfgrx_term(mcu_fsr01_cfgrx_term[2:0]),
  .mcu_fsr0_cfgtx_entx(mcu_fsr0_cfgtx_entx),
  .mcu_fsr1_cfgtx_entx(mcu_fsr1_cfgtx_entx),
  .mcu_fsr0_cfgtx_entest(mcu_fsr0_cfgtx_entest),
  .mcu_fsr1_cfgtx_entest(mcu_fsr1_cfgtx_entest),
  .mcu_fsr0_cfgtx_enidl(mcu_fsr0_cfgtx_enidl),
  .mcu_fsr1_cfgtx_enidl(mcu_fsr1_cfgtx_enidl),
  .mcu_fsr0_cfgtx_invpair(mcu_fsr0_cfgtx_invpair[9:0]),
  .mcu_fsr1_cfgtx_invpair(mcu_fsr1_cfgtx_invpair[9:0]),
  .mcu_fsr01_cfgtx_enftp(mcu_fsr01_cfgtx_enftp),
  .mcu_fsr01_cfgtx_de(mcu_fsr01_cfgtx_de[3:0]),
  .mcu_fsr01_cfgtx_swing(mcu_fsr01_cfgtx_swing[2:0]),
  .mcu_fsr01_cfgtx_cm(mcu_fsr01_cfgtx_cm),
  .mcu_fsr01_cfgrtx_rate(mcu_fsr01_cfgrtx_rate[1:0]),
  .mcu_fsr0_testcfg(mcu_fsr0_testcfg[11:0]),
  .mcu_fsr1_testcfg(mcu_fsr1_testcfg[11:0]),
  .fbdic_link_cnt_en(fbdic_link_cnt_en),
  .fbdic_link_cnt_reset(fbdic_link_cnt_reset[5:0]),
  .rdpctl_kp_lnk_up(rdpctl_kp_lnk_up),
  .rdpctl_kp_lnk_up_clr(rdpctl_kp_lnk_up_clr),
  .fbdic_serdes_dtm(fbdic_serdes_dtm),
  .fbdic_srds_dtm_muxsel(fbdic_srds_dtm_muxsel),
  .fbdic_cfgrd_crc_error(fbdic_cfgrd_crc_error),
  .fbdic_mcu_idle(fbdic_mcu_idle),
  .fbd0_elect_idle(fbd0_elect_idle[13:0]),
  .fbd1_elect_idle(fbd1_elect_idle[13:0]),
  .fbd0_testfail(fbd0_testfail[13:0]),
  .fbd1_testfail(fbd1_testfail[13:0]),
  .drif_ucb_wr_req_vld(drif_ucb_wr_req_vld),
  .drif_ucb_rd_req_vld(drif_ucb_rd_req_vld),
  .drif_ucb_addr(drif_ucb_addr[12:0]),
  .drif_ucb_data(drif_ucb_data[63:0]),
  .lndskw0_data(lndskw0_data[39:0]),
  .lndskw1_data(lndskw1_data[39:0]),
  .fbdird_ibrx_data(fbdird_ibrx_data[167:40]),
  .drif_dram_cmd_a(drif_dram_cmd_a[2:0]),
  .drif_dram_addr_a(drif_dram_addr_a[15:0]),
  .drif_dram_bank_a(drif_dram_bank_a[2:0]),
  .drif_dram_dimm_a(drif_dram_dimm_a[2:0]),
  .drif_dram_rank_a(drif_dram_rank_a),
  .drif_dram_cmd_b(drif_dram_cmd_b[2:0]),
  .drif_dram_addr_b(drif_dram_addr_b[15:0]),
  .drif_dram_bank_b(drif_dram_bank_b[2:0]),
  .drif_dram_dimm_b(drif_dram_dimm_b[2:0]),
  .drif_dram_rank_b(drif_dram_rank_b),
  .drif_wdata_wsn(drif_wdata_wsn),
  .woq_err_st_wait_free(woq_err_st_wait_free),
  .drif_dram_cmd_c(drif_dram_cmd_c[2:0]),
  .drif_dram_addr_c(drif_dram_addr_c[15:0]),
  .drif_dram_bank_c(drif_dram_bank_c[2:0]),
  .drif_dram_dimm_c(drif_dram_dimm_c[2:0]),
  .drif_dram_rank_c(drif_dram_rank_c),
  .drif_single_channel_mode(drif_single_channel_mode),
  .drif_branch_disabled(drif_branch_disabled),
  .drif_mcu_idle(drif_mcu_idle),
  .drif_cke_reg(drif_cke_reg),
  .drif_stacked_dimm(drif_stacked_dimm),
  .drif_num_dimms(drif_num_dimms[2:0]),
  .rdpctl_fifo_empty(rdpctl_fifo_empty),
  .rdpctl_crc_recov_err(rdpctl_crc_recov_err),
  .rdpctl_crc_unrecov_err(rdpctl_crc_unrecov_err),
  .rdpctl_mask_err(rdpctl_mask_err),
  .drif_dbg_trig_reg_ld(drif_dbg_trig_reg_ld),
  .fdout_link_cnt(fdout_link_cnt[5:0]),
  .drif_err_state_crc_fr(drif_err_state_crc_fr),
  .rdata_err_fbui(rdata_err_fbui),
  .rdata_err_fbri(rdata_err_fbri),
  .fbdird_crc_cmp0_0(fbdird_crc_cmp0_0),
  .fbdird_crc_cmp0_1(fbdird_crc_cmp0_1),
  .fbdird_crc_cmp1_0(fbdird_crc_cmp1_0),
  .fbdird_crc_cmp1_1(fbdird_crc_cmp1_1),
  .lndskw0_ts0_hdr_match(lndskw0_ts0_hdr_match[13:0]),
  .lndskw1_ts0_hdr_match(lndskw1_ts0_hdr_match[13:0]),
  .lndskw0_status_parity(lndskw0_status_parity[11:0]),
  .lndskw1_status_parity(lndskw1_status_parity[11:0]),
  .lndskw0_idle_match(lndskw0_idle_match[13:0]),
  .lndskw1_idle_match(lndskw1_idle_match[13:0]),
  .lndskw0_alert_match(lndskw0_alert_match[13:0]),
  .lndskw1_alert_match(lndskw1_alert_match[13:0]),
  .lndskw0_alert_asserted(lndskw0_alert_asserted[11:0]),
  .lndskw1_alert_asserted(lndskw1_alert_asserted[11:0]),
  .lndskw0_nbde(lndskw0_nbde[11:0]),
  .lndskw1_nbde(lndskw1_nbde[11:0]),
  .lndskw0_thermal_trip(lndskw0_thermal_trip[23:0]),
  .lndskw1_thermal_trip(lndskw1_thermal_trip[23:0]),
  .fsr0_mcu_ststx_testfail(fsr0_mcu_ststx_testfail[9:0]),
  .fsr1_mcu_ststx_testfail(fsr1_mcu_ststx_testfail[9:0]),
  .rdpctl_dtm_atspeed(rdpctl_dtm_atspeed),
  .ccu_serdes_dtm(ccu_serdes_dtm),
  .mcu_gnd(mcu_gnd),
  .aclk_wmr(aclk_wmr),
  .tcu_scan_en(tcu_scan_en),
  .wmr_protect(wmr_protect),
  .tcu_mcu_testmode(tcu_mcu_testmode)
);

mcu_crcs_ctl crcs (
	.scan_in(crcs_scanin),
	.scan_out(crcs_scanout),
	.drl2clk(drl2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(dr_pce_ov),
  .crcsc_crc(crcsc_crc[13:0]),
  .crcscf_crc(crcscf_crc[9:0]),
  .crcsd0_crc(crcsd0_crc[21:0]),
  .crcsdf0_crc(crcsdf0_crc[9:0]),
  .crcsd1_crc(crcsd1_crc[21:0]),
  .crcsdf1_crc(crcsdf1_crc[9:0]),
  .bc(bc[25:0]),
  .bd0(bd0[71:0]),
  .bd1(bd1[71:0]),
  .tcu_scan_en(tcu_scan_en)
);

mcu_crcn_ctl crcn (
	.scan_in(crcn_scanin),
	.scan_out(crcn_scanout),
	.drl2clk(drl2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(dr_pce_ov),
  .crcnd_crc0_0(crcnd_crc0_0[11:0]),
  .crcnd_crc0_1(crcnd_crc0_1[11:0]),
  .crcnd_crc1_0(crcnd_crc1_0[11:0]),
  .crcnd_crc1_1(crcnd_crc1_1[11:0]),
  .crcndf_crc0_0(crcndf_crc0_0[5:0]),
  .crcndf_crc0_1(crcndf_crc0_1[5:0]),
  .crcndf_crc1_0(crcndf_crc1_0[5:0]),
  .crcndf_crc1_1(crcndf_crc1_1[5:0]),
  .bd00(bd00[71:0]),
  .bd01(bd01[71:0]),
  .bd10(bd10[71:0]),
  .bd11(bd11[71:0]),
  .tcu_scan_en(tcu_scan_en)
);

mcu_addrdp_dp addrdp (
	.scan_in(addrdp_scanin),
	.scan_out(addrdp_scanout),
	.drl2clk(drl2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(dr_pce_ov),
	.l2b0_rd_adr_queue7_en(drq0_rd_adr_queue7_en),
	.l2b0_rd_adr_queue6_en(drq0_rd_adr_queue6_en),
	.l2b0_rd_adr_queue5_en(drq0_rd_adr_queue5_en),
	.l2b0_rd_adr_queue4_en(drq0_rd_adr_queue4_en),
	.l2b0_rd_adr_queue3_en(drq0_rd_adr_queue3_en),
	.l2b0_rd_adr_queue2_en(drq0_rd_adr_queue2_en),
	.l2b0_rd_adr_queue1_en(drq0_rd_adr_queue1_en),
	.l2b0_rd_adr_queue0_en(drq0_rd_adr_queue0_en),
	.l2b0_rd_adr_queue_sel(drif0_rd_adr_queue_sel[7:0]),
	.l2b0_wr_adr_queue7_en(drq0_wr_adr_queue7_en),
	.l2b0_wr_adr_queue6_en(drq0_wr_adr_queue6_en),
	.l2b0_wr_adr_queue5_en(drq0_wr_adr_queue5_en),
	.l2b0_wr_adr_queue4_en(drq0_wr_adr_queue4_en),
	.l2b0_wr_adr_queue3_en(drq0_wr_adr_queue3_en),
	.l2b0_wr_adr_queue2_en(drq0_wr_adr_queue2_en),
	.l2b0_wr_adr_queue1_en(drq0_wr_adr_queue1_en),
	.l2b0_wr_adr_queue0_en(drq0_wr_adr_queue0_en),
	.l2b0_rd_wr_adr0_eq(addrdp0_rd_wr_adr0_eq),
	.l2b0_rd_wr_adr1_eq(addrdp0_rd_wr_adr1_eq),
	.l2b0_rd_wr_adr2_eq(addrdp0_rd_wr_adr2_eq),
	.l2b0_rd_wr_adr3_eq(addrdp0_rd_wr_adr3_eq),
	.l2b0_rd_wr_adr4_eq(addrdp0_rd_wr_adr4_eq),
	.l2b0_rd_wr_adr5_eq(addrdp0_rd_wr_adr5_eq),
	.l2b0_rd_wr_adr6_eq(addrdp0_rd_wr_adr6_eq),
	.l2b0_rd_wr_adr7_eq(addrdp0_rd_wr_adr7_eq),
	.l2b0_req_rdwr_addr_sel(drif0_req_rdwr_addr_sel[1:0]),
	.l2b1_rd_adr_queue7_en(drq1_rd_adr_queue7_en),
	.l2b1_rd_adr_queue6_en(drq1_rd_adr_queue6_en),
	.l2b1_rd_adr_queue5_en(drq1_rd_adr_queue5_en),
	.l2b1_rd_adr_queue4_en(drq1_rd_adr_queue4_en),
	.l2b1_rd_adr_queue3_en(drq1_rd_adr_queue3_en),
	.l2b1_rd_adr_queue2_en(drq1_rd_adr_queue2_en),
	.l2b1_rd_adr_queue1_en(drq1_rd_adr_queue1_en),
	.l2b1_rd_adr_queue0_en(drq1_rd_adr_queue0_en),
	.l2b1_rd_adr_queue_sel(drif1_rd_adr_queue_sel[7:0]),
	.l2b1_wr_adr_queue7_en(drq1_wr_adr_queue7_en),
	.l2b1_wr_adr_queue6_en(drq1_wr_adr_queue6_en),
	.l2b1_wr_adr_queue5_en(drq1_wr_adr_queue5_en),
	.l2b1_wr_adr_queue4_en(drq1_wr_adr_queue4_en),
	.l2b1_wr_adr_queue3_en(drq1_wr_adr_queue3_en),
	.l2b1_wr_adr_queue2_en(drq1_wr_adr_queue2_en),
	.l2b1_wr_adr_queue1_en(drq1_wr_adr_queue1_en),
	.l2b1_wr_adr_queue0_en(drq1_wr_adr_queue0_en),
	.l2b1_rd_wr_adr0_eq(addrdp1_rd_wr_adr0_eq),
	.l2b1_rd_wr_adr1_eq(addrdp1_rd_wr_adr1_eq),
	.l2b1_rd_wr_adr2_eq(addrdp1_rd_wr_adr2_eq),
	.l2b1_rd_wr_adr3_eq(addrdp1_rd_wr_adr3_eq),
	.l2b1_rd_wr_adr4_eq(addrdp1_rd_wr_adr4_eq),
	.l2b1_rd_wr_adr5_eq(addrdp1_rd_wr_adr5_eq),
	.l2b1_rd_wr_adr6_eq(addrdp1_rd_wr_adr6_eq),
	.l2b1_rd_wr_adr7_eq(addrdp1_rd_wr_adr7_eq),
	.l2b1_req_rdwr_addr_sel(drif1_req_rdwr_addr_sel[1:0]),
	.ras_adr_queue(addrdp_ras_adr_queue[14:0]),
	.cas_adr_queue(addrdp_cas_adr_queue[10:0]),
	.ras_wr1_adr_queue(addrdp_ras_wr1_adr_queue[14:0]),
	.cas_wr1_adr_queue(addrdp_cas_wr1_adr_queue[10:0]),
	.ras_wr2_adr_queue(addrdp_ras_wr2_adr_queue[14:0]),
	.cas_wr2_adr_queue(addrdp_cas_wr2_adr_queue[10:0]),
       	.rd_req_id_queue(addrdp_rd_req_id_queue[2:0]),
	.rascas_adr_sel(drif_rascas_adr_sel[1:0]),
	.rascas_wr1_adr_sel(drif_rascas_wr1_adr_sel[1:0]),
	.rascas_wr2_adr_sel(drif_rascas_wr2_adr_sel[1:0]),
	.wr_adr_queue_sel(woq_wr_adr_queue_sel[7:0]),
	.wr1_adr_queue_sel(woq_wr1_adr_queue_sel[7:0]),
	.wr2_adr_queue_sel(woq_wr2_adr_queue_sel[7:0]),
  .l2clk(l2clk),
  .tcu_scan_en(tcu_scan_en),
  .drif_single_channel_mode(drif_single_channel_mode),
  .l2b0_rd_ras_adr(l2b0_rd_ras_adr[14:0]),
  .l2b0_rd_cas_adr(l2b0_rd_cas_adr[10:0]),
  .l2b0_rd_rank_adr(l2b0_rd_rank_adr),
  .l2b0_rd_dimm_adr(l2b0_rd_dimm_adr[2:0]),
  .l2b0_rd_bank_adr(l2b0_rd_bank_adr[2:0]),
  .l2b0_l2rd_req_id(l2b0_l2rd_req_id[2:0]),
  .l2b0_wr_ras_adr(l2b0_wr_ras_adr[14:0]),
  .l2b0_wr_cas_adr(l2b0_wr_cas_adr[10:0]),
  .l2b0_wr_rank_adr(l2b0_wr_rank_adr),
  .l2b0_wr_dimm_adr(l2b0_wr_dimm_adr[2:0]),
  .l2b0_wr_bank_adr(l2b0_wr_bank_adr[2:0]),
  .l2b1_rd_ras_adr(l2b1_rd_ras_adr[14:0]),
  .l2b1_rd_cas_adr(l2b1_rd_cas_adr[10:0]),
  .l2b1_rd_rank_adr(l2b1_rd_rank_adr),
  .l2b1_rd_dimm_adr(l2b1_rd_dimm_adr[2:0]),
  .l2b1_rd_bank_adr(l2b1_rd_bank_adr[2:0]),
  .l2b1_l2rd_req_id(l2b1_l2rd_req_id[2:0]),
  .l2b1_wr_ras_adr(l2b1_wr_ras_adr[14:0]),
  .l2b1_wr_cas_adr(l2b1_wr_cas_adr[10:0]),
  .l2b1_wr_rank_adr(l2b1_wr_rank_adr),
  .l2b1_wr_dimm_adr(l2b1_wr_dimm_adr[2:0]),
  .l2b1_wr_bank_adr(l2b1_wr_bank_adr[2:0])
);

mcu_readdp_dp readdp0 (
	.scan_in(readdp0_scanin),
	.scan_out(readdp0_scanout),
	.drl2clk(drl2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(dr_pce_ov),
	.dr_secc_err(readdp_ecc_single_err[0]),
	.dr_mecc_err(readdp_ecc_multi_err[0]),
	.ecc_loc(readdp0_ecc_loc[35:0]),
	.fail_over_mode(drif_fail_over_mode),
	.fail_over_mask(drif_fail_over_mask[34:0]),
	.fail_over_mask_l(drif_fail_over_mask_l[34:0]),
	.syndrome(readdp0_syndrome[15:0]),
	.cor_rddata(mcu_scrub_wdata[255:128]),
	.rddata(readdp_rddata[255:128]),
	.rddata_en({rdpctl_rddata_en[2],rdpctl_rddata_en[0]}),
	.radr_parity(rdpctl_radr_parity),
	.inj_ecc_err(rdpctl_inj_ecc_err),
	.io_mcu_data_in(fbdird0_data[127:0]),
	.io_mcu_ecc_in(fbdird0_data[143:128]),
  .tcu_scan_en(tcu_scan_en),
  .fbdic_rddata_vld(fbdic_rddata_vld),
  .mcu_gnd(mcu_gnd)
);

mcu_readdp_dp readdp1 (
	.scan_in(readdp1_scanin),
	.scan_out(readdp1_scanout),
	.drl2clk(drl2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(dr_pce_ov),
	.dr_secc_err(readdp_ecc_single_err[1]),
	.dr_mecc_err(readdp_ecc_multi_err[1]),
	.ecc_loc(readdp1_ecc_loc[35:0]),
	.fail_over_mode(drif_fail_over_mode),
	.fail_over_mask(drif_fail_over_mask[34:0]),
	.fail_over_mask_l(drif_fail_over_mask_l[34:0]),
	.syndrome(readdp1_syndrome[15:0]),
	.cor_rddata(mcu_scrub_wdata[127:0]),
	.rddata(readdp_rddata[127:0]),
	.rddata_en(rdpctl_rddata_en[2:1]),
	.radr_parity(rdpctl_radr_parity),
	.inj_ecc_err(1'b0),
	.io_mcu_data_in(fbdird1_data[127:0]),
	.io_mcu_ecc_in(fbdird1_data[143:128]),
	.mcu_gnd(mcu_gnd_unused),
  .tcu_scan_en(tcu_scan_en),
  .fbdic_rddata_vld(fbdic_rddata_vld)
);

mcu_l2rdmx_dp l2rdmx (
	.scan_in(l2rdmx_scanin),
	.scan_out(l2rdmx_scanout),
	.l2clk(l2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(cmp_pce_ov),
	.ddr_cmp_sync_en(rdata_ddr_cmp_sync_en),
	.cmp_ddr_sync_en(rdata_cmp_ddr_sync_en),
	.bank0_l2wr_data(l2rdmx0_l2wr_data[63:0]),
	.bank1_l2wr_data(l2rdmx1_l2wr_data[63:0]),
	.rddata(readdp_rddata[255:0]),
	.rddata_sel(rdata_rddata_sel[1:0]),
	.pa_err(rdata_pa_err),
	.dr_secc_err(readdp_ecc_single_err[1:0]),
	.dr_mecc_err(readdp_ecc_multi_err[1:0]),
	.l2_secc_err_dly1(readdp_l2_secc_err_dly1),
	.l2_mecc_err_dly1(readdp_l2_mecc_err_dly1),
	.mcu_rddata(mcu_l2b_data_r3[127:0]),
	.mcu_rdecc(mcu_l2b_ecc_r3[27:0]),
  .mcu_l2t0_qword_id_r0(mcu_l2t0_qword_id_r0[1:0]),
  .mcu_l2t0_data_vld_r0(mcu_l2t0_data_vld_r0),
  .mcu_l2t0_rd_req_id_r0(mcu_l2t0_rd_req_id_r0[2:0]),
  .mcu_l2t1_qword_id_r0(mcu_l2t1_qword_id_r0[1:0]),
  .mcu_l2t1_data_vld_r0(mcu_l2t1_data_vld_r0),
  .mcu_l2t1_rd_req_id_r0(mcu_l2t1_rd_req_id_r0[2:0]),
  .l2b0_rd_rank_adr(l2b0_rd_rank_adr),
  .l2b0_rd_dimm_adr(l2b0_rd_dimm_adr[2:0]),
  .l2b0_rd_bank_adr(l2b0_rd_bank_adr[2:0]),
  .l2b0_rd_ras_adr(l2b0_rd_ras_adr[14:0]),
  .l2b0_rd_cas_adr(l2b0_rd_cas_adr[10:0]),
  .l2b0_rd_addr_err(l2b0_rd_addr_err),
  .l2b0_rd_addr_par(l2b0_rd_addr_par),
  .l2b0_l2rd_req_id(l2b0_l2rd_req_id[2:0]),
  .l2b0_wr_rank_adr(l2b0_wr_rank_adr),
  .l2b0_wr_dimm_adr(l2b0_wr_dimm_adr[2:0]),
  .l2b0_wr_bank_adr(l2b0_wr_bank_adr[2:0]),
  .l2b0_wr_ras_adr(l2b0_wr_ras_adr[14:0]),
  .l2b0_wr_cas_adr(l2b0_wr_cas_adr[10:0]),
  .l2b0_wr_addr_err(l2b0_wr_addr_err),
  .l2b0_wr_addr_par(l2b0_wr_addr_par),
  .l2b1_rd_rank_adr(l2b1_rd_rank_adr),
  .l2b1_rd_dimm_adr(l2b1_rd_dimm_adr[2:0]),
  .l2b1_rd_bank_adr(l2b1_rd_bank_adr[2:0]),
  .l2b1_rd_ras_adr(l2b1_rd_ras_adr[14:0]),
  .l2b1_rd_cas_adr(l2b1_rd_cas_adr[10:0]),
  .l2b1_rd_addr_err(l2b1_rd_addr_err),
  .l2b1_rd_addr_par(l2b1_rd_addr_par),
  .l2b1_l2rd_req_id(l2b1_l2rd_req_id[2:0]),
  .l2b1_wr_rank_adr(l2b1_wr_rank_adr),
  .l2b1_wr_dimm_adr(l2b1_wr_dimm_adr[2:0]),
  .l2b1_wr_bank_adr(l2b1_wr_bank_adr[2:0]),
  .l2b1_wr_ras_adr(l2b1_wr_ras_adr[14:0]),
  .l2b1_wr_cas_adr(l2b1_wr_cas_adr[10:0]),
  .l2b1_wr_addr_err(l2b1_wr_addr_err),
  .l2b1_wr_addr_par(l2b1_wr_addr_par),
  .mbist_run_d1(mbist_run_d1),
  .mbist_run_d1_l(mbist_run_d1_l),
  .mbist_wdata(mbist_wdata[7:0]),
  .l2b0_mcu_wr_data_r5(l2b0_mcu_wr_data_r5[63:0]),
  .l2b1_mcu_wr_data_r5(l2b1_mcu_wr_data_r5[63:0]),
  .rdpctl_l2t0_data_valid(rdpctl_l2t0_data_valid),
  .rdpctl_l2t1_data_valid(rdpctl_l2t1_data_valid),
  .rdpctl_qword_id(rdpctl_qword_id),
  .rdpctl_rd_req_id(rdpctl_rd_req_id[2:0]),
  .l2if0_rd_rank_adr(l2if0_rd_rank_adr),
  .l2if0_rd_dimm_adr(l2if0_rd_dimm_adr[2:0]),
  .l2if0_rd_bank_adr(l2if0_rd_bank_adr[2:0]),
  .l2if0_rd_ras_adr(l2if0_rd_ras_adr[14:0]),
  .l2if0_rd_cas_adr(l2if0_rd_cas_adr[10:0]),
  .l2if0_rd_addr_err(l2if0_rd_addr_err),
  .l2if0_rd_addr_parity(l2if0_rd_addr_parity),
  .l2if0_rd_req_id(l2if0_rd_req_id[2:0]),
  .l2if0_wr_rank_adr(l2if0_wr_rank_adr),
  .l2if0_wr_dimm_adr(l2if0_wr_dimm_adr[2:0]),
  .l2if0_wr_bank_adr(l2if0_wr_bank_adr[2:0]),
  .l2if0_wr_ras_adr(l2if0_wr_ras_adr[14:0]),
  .l2if0_wr_cas_adr(l2if0_wr_cas_adr[10:0]),
  .l2if0_wr_addr_err(l2if0_wr_addr_err),
  .l2if0_wr_addr_parity(l2if0_wr_addr_parity),
  .l2if1_rd_rank_adr(l2if1_rd_rank_adr),
  .l2if1_rd_dimm_adr(l2if1_rd_dimm_adr[2:0]),
  .l2if1_rd_bank_adr(l2if1_rd_bank_adr[2:0]),
  .l2if1_rd_ras_adr(l2if1_rd_ras_adr[14:0]),
  .l2if1_rd_cas_adr(l2if1_rd_cas_adr[10:0]),
  .l2if1_rd_addr_err(l2if1_rd_addr_err),
  .l2if1_rd_addr_parity(l2if1_rd_addr_parity),
  .l2if1_rd_req_id(l2if1_rd_req_id[2:0]),
  .l2if1_wr_rank_adr(l2if1_wr_rank_adr),
  .l2if1_wr_dimm_adr(l2if1_wr_dimm_adr[2:0]),
  .l2if1_wr_bank_adr(l2if1_wr_bank_adr[2:0]),
  .l2if1_wr_ras_adr(l2if1_wr_ras_adr[14:0]),
  .l2if1_wr_cas_adr(l2if1_wr_cas_adr[10:0]),
  .l2if1_wr_addr_err(l2if1_wr_addr_err),
  .l2if1_wr_addr_parity(l2if1_wr_addr_parity),
  .tcu_scan_en(tcu_scan_en)
);

mcu_wrdp_dp wrdp (
	.scan_in(wrdp_scanin),
	.scan_out(wrdp_scanout),
	.drl2clk(drl2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(dr_pce_ov),
	.fail_over_mask(drif_fail_over_mask[34:0]),
	.fail_over_mask_l(drif_fail_over_mask_l[34:0]),
	.bank0_wdata(wdq0_wr_data[127:0]),
	.bank1_wdata(wdq1_wr_data[127:0]),
	.err_inj_reg(drif_err_inj_enable),
	.err_mask_reg(drif_err_mask_reg[15:0]),
	.wdata_sel(drif_wdata_sel[3:0]),
	.wadr_parity(drif_wadr_parity),
	.l2poison_qw(drif_l2poison_qw),
	.scrub_rwen(drif_scrub_rwen),
	.io_wdata_sel(drif_io_wdata_sel[1:0]),
	.mcu_io_data_out(mcu_ddp_data_out[143:0]),
	.mbist_run(mbist_run_d1),
	.mbist_sel_hiorlo_72bits(mbist_sel_hiorlo_72bits_d1),
	.mbist_sel_bank0or1(mbist_sel_bank0or1_d1),
	.lfsr_in(fdout_idle_lfsr[11:0]),
	.lfsr_out({wrdp_idle_lfsr_l_0, wrdp_idle_lfsr[11:0]}),
	.lfsr_out_0(wrdp_idle_lfsr_0[3:0]),
  .l2clk(l2clk),
  .cmp_pce_ov(cmp_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .mcu_scrub_wdata(mcu_scrub_wdata[255:0]),
  .mbist_read_data(mbist_read_data[63:0])
);

mcu_fbdiwr_dp fbdiwr (
	.scan_in(fbdiwr_scanin),
	.scan_out(fbdiwr_scanout),
	.drl2clk(drl2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(dr_pce_ov),
	.wrdp_data(mcu_ddp_data_out[143:0]),
	.fbdic0_failover_mask(fbdic0_sb_failover_mask[8:0]),
	.fbdic0_failover_mask_l(fbdic0_sb_failover_mask_l[8:0]),
	.fbdic1_failover_mask(fbdic1_sb_failover_mask[8:0]),
	.fbdic1_failover_mask_l(fbdic1_sb_failover_mask_l[8:0]),
  .fbdiwr0_data(fbdiwr0_data[119:0]),
  .fbdiwr1_data(fbdiwr1_data[119:0]),
  .fbdiwr_dtm_crc(fbdiwr_dtm_crc[21:0]),
  .bc(bc[25:0]),
  .bd0(bd0[71:0]),
  .bd1(bd1[71:0]),
  .fbdic0_ts_data(fbdic0_ts_data[11:0]),
  .fbdic1_ts_data(fbdic1_ts_data[11:0]),
  .fbdic_ibist_data(fbdic_ibist_data[119:0]),
  .fbdic_f(fbdic_f[1:0]),
  .fbdic_f_1_l(fbdic_f_1_l),
  .fbdic0_chnl_disable(fbdic0_chnl_disable),
  .fbdic1_chnl_disable(fbdic1_chnl_disable),
  .fbdic_a_cmd(fbdic_a_cmd[23:0]),
  .fbdic_bc_cmd(fbdic_bc_cmd[71:0]),
  .fbdic0_cmd_crc_sel(fbdic0_cmd_crc_sel[1:0]),
  .fbdic1_cmd_crc_sel(fbdic1_cmd_crc_sel[1:0]),
  .fbdic0_data_crc_sel(fbdic0_data_crc_sel[2:0]),
  .fbdic1_data_crc_sel(fbdic1_data_crc_sel[2:0]),
  .fbdic_special_cmd(fbdic_special_cmd),
  .fbdic_special_cmd_l(fbdic_special_cmd_l),
  .fbd0_data(fbd0_data[167:0]),
  .fbd1_data(fbd1_data[167:0]),
  .fbdic_data_sel(fbdic_data_sel[4:0]),
  .rdpctl_dtm_chnl_enable(rdpctl_dtm_chnl_enable[1:0]),
  .crcsc_crc(crcsc_crc[13:0]),
  .crcscf_crc(crcscf_crc[9:0]),
  .crcsd0_crc(crcsd0_crc[21:0]),
  .crcsdf0_crc(crcsdf0_crc[9:0]),
  .crcsd1_crc(crcsd1_crc[21:0]),
  .crcsdf1_crc(crcsdf1_crc[9:0]),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_scan_en(tcu_scan_en)
);

mcu_fbdird_dp fbdird (
	.scan_in(fbdird_scanin),
	.scan_out(fbdird_scanout),
	.drl2clk(drl2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(dr_pce_ov),
	.fbdic0_failover(fbdic0_nb_failover),
	.fbdic0_failover_l(fbdic0_nb_failover_l),
	.fbdic1_failover(fbdic1_nb_failover),
	.fbdic1_failover_l(fbdic1_nb_failover_l),
  .fbdird0_data(fbdird0_data[143:0]),
  .fbdird1_data(fbdird1_data[143:0]),
  .fbdird_ibrx_data(fbdird_ibrx_data[167:40]),
  .fbdird_crc_cmp0_0(fbdird_crc_cmp0_0),
  .fbdird_crc_cmp0_1(fbdird_crc_cmp0_1),
  .fbdird_crc_cmp1_0(fbdird_crc_cmp1_0),
  .fbdird_crc_cmp1_1(fbdird_crc_cmp1_1),
  .bd00(bd00[71:0]),
  .bd01(bd01[71:0]),
  .bd10(bd10[71:0]),
  .bd11(bd11[71:0]),
  .fbdic_rddata_vld(fbdic_rddata_vld),
  .fbdic_rddata_vld_l(fbdic_rddata_vld_l),
  .fbdic_ibrx_data_sel(fbdic_ibrx_data_sel),
  .fbdic_ibrx_data_sel_l(fbdic_ibrx_data_sel_l),
  .fbd0_data(fbd0_data[167:0]),
  .fbd1_data(fbd1_data[167:0]),
  .fbdic_idle_lfsr_reset(fbdic_idle_lfsr_reset),
  .fbdic_train_state(fbdic_train_state),
  .fbdic_disable_state(fbdic_disable_state),
  .lndskw0_data(lndskw0_data[167:0]),
  .lndskw1_data(lndskw1_data[167:0]),
  .crcnd_crc0_0(crcnd_crc0_0[11:0]),
  .crcnd_crc0_1(crcnd_crc0_1[11:0]),
  .crcnd_crc1_0(crcnd_crc1_0[11:0]),
  .crcnd_crc1_1(crcnd_crc1_1[11:0]),
  .crcndf_crc0_0(crcndf_crc0_0[5:0]),
  .crcndf_crc0_1(crcndf_crc0_1[5:0]),
  .crcndf_crc1_0(crcndf_crc1_0[5:0]),
  .crcndf_crc1_1(crcndf_crc1_1[5:0]),
  .drif_single_channel_mode(drif_single_channel_mode),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_scan_en(tcu_scan_en)
);

mcu_lndskw_dp lndskw0 ( // FS:wmr_protect
	.wmr_scan_in(lndskw0_wmr_scanin),
	.wmr_scan_out(lndskw0_wmr_scanout),
	.scan_in(lndskw0_scanin),
	.scan_out(lndskw0_scanout),
	.drl2clk(drl2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(dr_pce_ov),
	.fbd_data(fbd0_data[167:0]),
	.fbdic_inc_wptr(fbdic0_inc_wptr),
	.fbdic_inc_rptr(fbdic0_inc_rptr[13:0]),
	.fbdic_clr_ptrs(fbdic0_clr_ptrs),
	.fbdic_failover_mask(fbdic0_nb_failover_mask[12:0]),
	.fbdic_failover_mask_l(fbdic0_nb_failover_mask_l[12:0]),
	.lndskw_data(lndskw0_data[167:0]),
	.lndskw_ts0_hdr_match(lndskw0_ts0_hdr_match[13:0]),
	.lndskw_status_parity(lndskw0_status_parity[11:0]),
	.lndskw_idle_match(lndskw0_idle_match[13:0]),
	.lndskw_alert_match(lndskw0_alert_match[13:0]),
	.lndskw_alert_asserted(lndskw0_alert_asserted[11:0]),
	.lndskw_nbde(lndskw0_nbde[11:0]),
	.lndskw_thermal_trip(lndskw0_thermal_trip[23:0]),
	.fdout_idle_lfsr(wrdp_idle_lfsr[11:0]),
	.fdout_idle_lfsr_l_0(wrdp_idle_lfsr_l_0),
	.fdout_idle_lfsr_0(wrdp_idle_lfsr_0[1:0]),
  .tcu_scan_en(tcu_scan_en),
  .aclk_wmr(aclk_wmr)
);

mcu_lndskw_dp lndskw1 ( // FS:wmr_protect
	.wmr_scan_in(lndskw1_wmr_scanin),
	.wmr_scan_out(lndskw1_wmr_scanout),
	.scan_in(lndskw1_scanin),
	.scan_out(lndskw1_scanout),
	.drl2clk(drl2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(dr_pce_ov),
	.fbd_data(fbd1_data[167:0]),
	.fbdic_inc_wptr(fbdic1_inc_wptr),
	.fbdic_inc_rptr(fbdic1_inc_rptr[13:0]),
	.fbdic_clr_ptrs(fbdic1_clr_ptrs),
	.fbdic_failover_mask(fbdic1_nb_failover_mask[12:0]),
	.fbdic_failover_mask_l(fbdic1_nb_failover_mask_l[12:0]),
	.lndskw_data(lndskw1_data[167:0]),
	.lndskw_ts0_hdr_match(lndskw1_ts0_hdr_match[13:0]),
	.lndskw_status_parity(lndskw1_status_parity[11:0]),
	.lndskw_idle_match(lndskw1_idle_match[13:0]),
	.lndskw_alert_match(lndskw1_alert_match[13:0]),
	.lndskw_alert_asserted(lndskw1_alert_asserted[11:0]),
	.lndskw_nbde(lndskw1_nbde[11:0]),
	.lndskw_thermal_trip(lndskw1_thermal_trip[23:0]),
	.fdout_idle_lfsr(wrdp_idle_lfsr[11:0]),
	.fdout_idle_lfsr_l_0(wrdp_idle_lfsr_l_0),
	.fdout_idle_lfsr_0(wrdp_idle_lfsr_0[3:2]),
  .tcu_scan_en(tcu_scan_en),
  .aclk_wmr(aclk_wmr)
);

mcu_fbd_dp fbd0 (
	.scan_in(fbd0_scanin),
	.scan_out(fbd0_scanout),
	.drl2clk(drl2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(dr_pce_ov),
	.fbd_elect_idle(fbd0_elect_idle[13:0]),
	.fbd_frame_lock(fbd0_frame_lock[13:0]),
	.fbd_testfail(fbd0_testfail[13:0]),
	.fbd_data(fbd0_data[167:0]),
	.fsr_rxbclk(fsr0_mcu_rxbclk[13:0]),
	.fsr_data(fsr0_mcu_data[167:0]),
	.fsr_stsrx_sync(fsr0_mcu_stsrx_sync[13:0]),
	.fsr_stsrx_losdtct(fsr0_mcu_stsrx_losdtct[13:0]),
	.fsr_stsrx_testfail(fsr0_mcu_stsrx_testfail[13:0]),
	.fdout_rptr0(fdout0_rptr0[1:0]),
	.fdout_rptr1(fdout0_rptr1[1:0]),
	.fdout_rptr2(fdout0_rptr2[1:0]),
	.fdout_rptr3(fdout0_rptr3[1:0]),
	.fdout_rptr4(fdout0_rptr4[1:0]),
	.fdout_rptr5(fdout0_rptr5[1:0]),
	.fdout_rptr6(fdout0_rptr6[1:0]),
	.fdout_rptr7(fdout0_rptr7[1:0]),
	.fdout_rptr8(fdout0_rptr8[1:0]),
	.fdout_rptr9(fdout0_rptr9[1:0]),
	.fdout_rptr10(fdout0_rptr10[1:0]),
	.fdout_rptr11(fdout0_rptr11[1:0]),
	.fdout_rptr12(fdout0_rptr12[1:0]),
	.fdout_rptr13(fdout0_rptr13[1:0]),
	.fdout_frame_lock(fdout0_frame_lock_sync[13:0]),
  .fbdic_enable_sync_count(fbdic_enable_sync_count),
  .tcu_scan_en(tcu_scan_en),
  .tcu_mcu_fbd_clk_stop(tcu_mcu_fbd_clk_stop),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_atpg_mode(tcu_atpg_mode)
);

mcu_fbd_dp fbd1 (
	.scan_in(fbd1_scanin),
	.scan_out(fbd1_scanout),
	.drl2clk(drl2clk),
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.tcu_pce_ov(dr_pce_ov),
	.fbd_elect_idle(fbd1_elect_idle[13:0]),
	.fbd_frame_lock(fbd1_frame_lock[13:0]),
	.fbd_testfail(fbd1_testfail[13:0]),
	.fbd_data(fbd1_data),
	.fsr_rxbclk(fsr1_mcu_rxbclk[13:0]),
	.fsr_data(fsr1_mcu_data[167:0]),
	.fsr_stsrx_sync(fsr1_mcu_stsrx_sync[13:0]),
	.fsr_stsrx_losdtct(fsr1_mcu_stsrx_losdtct[13:0]),
	.fsr_stsrx_testfail(fsr1_mcu_stsrx_testfail[13:0]),
	.fdout_rptr0(fdout1_rptr0[1:0]),
	.fdout_rptr1(fdout1_rptr1[1:0]),
	.fdout_rptr2(fdout1_rptr2[1:0]),
	.fdout_rptr3(fdout1_rptr3[1:0]),
	.fdout_rptr4(fdout1_rptr4[1:0]),
	.fdout_rptr5(fdout1_rptr5[1:0]),
	.fdout_rptr6(fdout1_rptr6[1:0]),
	.fdout_rptr7(fdout1_rptr7[1:0]),
	.fdout_rptr8(fdout1_rptr8[1:0]),
	.fdout_rptr9(fdout1_rptr9[1:0]),
	.fdout_rptr10(fdout1_rptr10[1:0]),
	.fdout_rptr11(fdout1_rptr11[1:0]),
	.fdout_rptr12(fdout1_rptr12[1:0]),
	.fdout_rptr13(fdout1_rptr13[1:0]),
	.fdout_frame_lock(fdout1_frame_lock_sync[13:0]),
  .fbdic_enable_sync_count(fbdic_enable_sync_count),
  .tcu_scan_en(tcu_scan_en),
  .tcu_mcu_fbd_clk_stop(tcu_mcu_fbd_clk_stop),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_atpg_mode(tcu_atpg_mode)
);

n2_mcu_32x72async_dp_cust wdqrf00 (
	.scan_in(wdqrf00_scanin),
	.scan_out(wdqrf00_scanout),
	.wrclk(l2clk),  
	.rdclk(drl2clk),  
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.bist_clk_mux_sel(mbist_run),
	.tcu_array_wr_inhibit(array_wr_inhibit),
	.wr_pce(1'b1),
	.rd_pce(1'b1),
	.wr_en(l2if0_wdq_we[0]),
	.rd_en(rdata0_wdq_rd[0]),
	.wr_adr(l2if0_wdq_wadr[4:0]),
	.rd_adr(rdata_wdq_radr[4:0]),
	.din({l2rdmx0_l2wr_data[63:57], l2if0_mcu_data_mecc, l2rdmx0_l2wr_data[63:0]}), 
	.dout({wdrqf00_data[6:0], wdqrf00_data_mecc, wdq0_wr_data[127:64]}),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_se_scancollar_in(tcu_se_scancollar_in)
);

n2_mcu_32x72async_dp_cust wdqrf01 (
	.scan_in(wdqrf01_scanin),
	.scan_out(wdqrf01_scanout),
	.wrclk(l2clk),  
	.rdclk(drl2clk),  
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.bist_clk_mux_sel(mbist_run),
	.tcu_array_wr_inhibit(array_wr_inhibit),
	.wr_pce(1'b1),
	.rd_pce(1'b1),
	.wr_en(l2if0_wdq_we[1]),
	.rd_en(rdata0_wdq_rd[1]),
	.wr_adr(l2if0_wdq_wadr[4:0]),
	.rd_adr(rdata_wdq_radr[4:0]),
	.din({l2rdmx0_l2wr_data[63:57], l2if0_mcu_data_mecc, l2rdmx0_l2wr_data[63:0]}), 
	.dout({wdrqf01_data[6:0], wdqrf01_data_mecc, wdq0_wr_data[63:0]}),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_se_scancollar_in(tcu_se_scancollar_in)
);

n2_mcu_32x72async_dp_cust wdqrf10 (
	.scan_in(wdqrf10_scanin),
	.scan_out(wdqrf10_scanout),
	.wrclk(l2clk),  
	.rdclk(drl2clk),  
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.bist_clk_mux_sel(mbist_run),
	.tcu_array_wr_inhibit(array_wr_inhibit),
	.wr_pce(1'b1),
	.rd_pce(1'b1),
	.wr_en(l2if1_wdq_we[0]),
	.rd_en(rdata1_wdq_rd[0]),
	.wr_adr(l2if1_wdq_wadr[4:0]),
	.rd_adr(rdata_wdq_radr[4:0]),
	.din({l2rdmx1_l2wr_data[63:57], l2if1_mcu_data_mecc, l2rdmx1_l2wr_data[63:0]}), 
	.dout({wdrqf10_data[6:0], wdqrf10_data_mecc, wdq1_wr_data[127:64]}),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_se_scancollar_in(tcu_se_scancollar_in)
);

n2_mcu_32x72async_dp_cust wdqrf11 (
	.scan_in(wdqrf11_scanin),
	.scan_out(wdqrf11_scanout),
	.wrclk(l2clk),  
	.rdclk(drl2clk),  
	.tcu_aclk(aclk),
	.tcu_bclk(bclk),
	.bist_clk_mux_sel(mbist_run),
	.tcu_array_wr_inhibit(array_wr_inhibit),
	.wr_pce(1'b1),
	.rd_pce(1'b1),
	.wr_en(l2if1_wdq_we[1]),
	.rd_en(rdata1_wdq_rd[1]),
	.wr_adr(l2if1_wdq_wadr[4:0]),
	.rd_adr(rdata_wdq_radr[4:0]),
	.din({l2rdmx1_l2wr_data[63:57], l2if1_mcu_data_mecc, l2rdmx1_l2wr_data[63:0]}), 
	.dout({wdrqf11_data[6:0], wdqrf11_data_mecc, wdq1_wr_data[63:0]}),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_se_scancollar_in(tcu_se_scancollar_in)
);

mcu_bscan_ctl bscan (.mcu_fsr0_cfgtx_bstx(mcu_fsr0_cfgtx_bstx[9:0]),
  .mcu_fsr1_cfgtx_bstx(mcu_fsr1_cfgtx_bstx[9:0]),
  .fsr0_mcu_stsrx_bsrxp(fsr0_mcu_stsrx_bsrxp[13:0]),
  .fsr1_mcu_stsrx_bsrxp(fsr1_mcu_stsrx_bsrxp[13:0]),
  .fsr0_mcu_stsrx_bsrxn(fsr0_mcu_stsrx_bsrxn[13:0]),
  .fsr1_mcu_stsrx_bsrxn(fsr1_mcu_stsrx_bsrxn[13:0]),
  .mcu_sbs_scan_in(mcu_sbs_scan_in),
  .mcu_sbs_scan_out(mcu_sbs_scan_out),
  .tcu_sbs_scan_en(tcu_sbs_scan_en),
  .tcu_sbs_clk(tcu_sbs_clk),
  .tcu_sbs_uclk(tcu_sbs_uclk),
  .tcu_sbs_aclk(tcu_sbs_aclk),
  .tcu_sbs_bclk(tcu_sbs_bclk)
);

mcu_mbist_ctl mbist (
        .scan_in(mbist_scanin),
        .scan_out(mbist_scanout),
        .l2clk                          (l2clk),
	.tcu_aclk			(aclk),
	.tcu_bclk			(bclk),
	.tcu_pce_ov			(cmp_pce_ov),
        .mcu_mbist_done                 (mcu_tcu_mbist_done),
        .mcu_mbist_fail              	(mcu_tcu_mbist_fail),
        .mcu_mbist_start                (tcu_mcu_mbist_start),
        .mcu_mbist_user_mode            (tcu_mbist_user_mode),
        .mcu_mbist_bisi_mode            (tcu_mbist_bisi_en),
	.mcu_mbist_run			(mbist_run),
	.mcu_mbist_addr			(mbist_addr[4:0]),
	.mcu_mbist_wdata		(mbist_wdata[7:0]),
	.mcu_mbist_sel_bank0or1		(mbist_sel_bank0or1),
	.mcu_mbist_sel_hiorlo_72bits	(mbist_sel_hiorlo_72bits),
	.mcu_mbist_wdqrf00_wr_en	(mbist_wdqrf00_wr_en),
	.mcu_mbist_wdqrf00_rd_en	(mbist_wdqrf00_rd_en),
	.mcu_mbist_wdqrf01_wr_en	(mbist_wdqrf01_wr_en),
	.mcu_mbist_wdqrf01_rd_en	(mbist_wdqrf01_rd_en),
	.mcu_mbist_wdqrf10_wr_en	(mbist_wdqrf10_wr_en),
	.mcu_mbist_wdqrf10_rd_en	(mbist_wdqrf10_rd_en),
	.mcu_mbist_wdqrf11_wr_en	(mbist_wdqrf11_wr_en),
	.mcu_mbist_wdqrf11_rd_en	(mbist_wdqrf11_rd_en),
        .read_data			(mbist_read_data[71:0]),
  .tcu_scan_en(tcu_scan_en)
); 

////////////////////////////////////////////////////////////
// 0-IN checks
////////////////////////////////////////////////////////////

// 0in bits_on -max 1 -var {mcu_l2t0_data_vld_r0,mcu_l2t1_data_vld_r0} -clock l2clk

// 0in known_driven -var mcu_l2t0_data_vld_r0 -clock l2clk
// 0in known_driven -var mcu_l2t0_rd_ack -clock l2clk
// 0in known_driven -var mcu_l2t0_scb_mecc_err -clock l2clk
// 0in known_driven -var mcu_l2t0_scb_secc_err -clock l2clk
// 0in known_driven -var mcu_l2t0_wr_ack -clock l2clk
// 0in known_driven -var mcu_l2t0_qword_id_r0 -clock l2clk
// 0in known_driven -var mcu_l2t0_mecc_err_r3 -clock l2clk
// 0in known_driven -var mcu_l2t0_rd_req_id_r0 -clock l2clk
// 0in known_driven -var mcu_l2t0_secc_err_r3 -clock l2clk
// 0in known_driven -var mcu_l2t1_data_vld_r0 -clock l2clk
// 0in known_driven -var mcu_l2t1_rd_ack -clock l2clk
// 0in known_driven -var mcu_l2t1_scb_mecc_err -clock l2clk
// 0in known_driven -var mcu_l2t1_scb_secc_err -clock l2clk
// 0in known_driven -var mcu_l2t1_wr_ack -clock l2clk
// 0in known_driven -var mcu_l2t1_qword_id_r0 -clock l2clk
// 0in known_driven -var mcu_l2t1_mecc_err_r3 -clock l2clk
// 0in known_driven -var mcu_l2t1_rd_req_id_r0 -clock l2clk
// 0in known_driven -var mcu_l2t1_secc_err_r3 -clock l2clk
// 0in known_driven -var mcu_l2b_data_r3 -clock l2clk
// 0in known_driven -var mcu_l2b_ecc_r3 -clock l2clk
// 0in known_driven -var mcu_pt_sync_out -clock l2clk
// 0in known_driven -var mcu_ncu_data -clock iol2clk -active mcu_ncu_vld
// 0in known_driven -var mcu_ncu_stall -clock iol2clk
// 0in known_driven -var mcu_ncu_vld -clock iol2clk
// 0in known_driven -var mcu_ncu_ecc -clock iol2clk
// 0in known_driven -var mcu_ncu_fbr -clock iol2clk
// 0in known_driven -var ncu_mcu_data -clock iol2clk -active ncu_mcu_vld
// 0in known_driven -var ncu_mcu_stall -clock iol2clk
// 0in known_driven -var ncu_mcu_vld -clock iol2clk
// 0in known_driven -var ncu_mcu_ecci -clock iol2clk
// 0in known_driven -var ncu_mcu_fbui -clock iol2clk
// 0in known_driven -var ncu_mcu_fbri -clock iol2clk
// 0in known_driven -var ncu_mcu_pm -clock iol2clk
// 0in known_driven -var ncu_mcu_ba01 -clock iol2clk
// 0in known_driven -var ncu_mcu_ba23 -clock iol2clk
// 0in known_driven -var ncu_mcu_ba45 -clock iol2clk
// 0in known_driven -var ncu_mcu_ba67 -clock iol2clk
// 0in known_driven -var l2b0_mcu_data_mecc_r5 -clock l2clk -active l2b0_mcu_data_vld_r5
// 0in known_driven -var l2b0_mcu_data_vld_r5 -clock l2clk
// 0in known_driven -var l2b0_mcu_wr_data_r5 -clock l2clk -active l2b0_mcu_data_vld_r5
// 0in known_driven -var l2t0_mcu_addr_39to7 -clock l2clk -active (l2t0_mcu_rd_req | l2t0_mcu_wr_req)
// 0in known_driven -var l2t0_mcu_addr_5 -clock l2clk -active (l2t0_mcu_rd_req | l2t0_mcu_wr_req)
// 0in known_driven -var l2t0_mcu_rd_dummy_req -clock l2clk -active l2t0_mcu_rd_req
// 0in known_driven -var l2t0_mcu_rd_req -clock l2clk
// 0in known_driven -var l2t0_mcu_rd_req_id -clock l2clk -active l2t0_mcu_rd_req
// 0in known_driven -var l2t0_mcu_wr_req -clock l2clk
// 0in known_driven -var l2b1_mcu_data_mecc_r5 -clock l2clk -active l2b1_mcu_data_vld_r5
// 0in known_driven -var l2b1_mcu_data_vld_r5 -clock l2clk
// 0in known_driven -var l2b1_mcu_wr_data_r5 -clock l2clk -active l2b1_mcu_data_vld_r5
// 0in known_driven -var l2t1_mcu_addr_39to7 -clock l2clk -active (l2t1_mcu_rd_req | l2t1_mcu_wr_req)
// 0in known_driven -var l2t1_mcu_addr_5 -clock l2clk -active (l2t1_mcu_rd_req | l2t1_mcu_wr_req)
// 0in known_driven -var l2t1_mcu_rd_dummy_req -clock l2clk -active l2t1_mcu_rd_req
// 0in known_driven -var l2t1_mcu_rd_req -clock l2clk
// 0in known_driven -var l2t1_mcu_rd_req_id -clock l2clk -active l2t1_mcu_rd_req
// 0in known_driven -var l2t1_mcu_wr_req -clock l2clk
// 0in known_driven -var mcu_pt_sync_in0 -clock l2clk
// 0in known_driven -var mcu_pt_sync_in1 -clock l2clk
// 0in known_driven -var mcu_pt_sync_in2 -clock l2clk
// 0in known_driven -var mcu_id -clock l2clk
// 0in known_driven -var ccu_dr_sync_en -clock l2clk
// 0in known_driven -var ccu_io_cmp_sync_en -clock l2clk
// 0in known_driven -var ccu_cmp_io_sync_en -clock l2clk
// 0in known_driven -var rst_mcu_selfrsh -clock l2clk
// 0in known_driven -var rst_wmr_protect -clock l2clk
// 0in known_driven -var scan_in -clock l2clk
// 0in known_driven -var tcu_aclk -clock l2clk
// 0in known_driven -var tcu_bclk -clock l2clk
// 0in known_driven -var tcu_mcu_clk_stop -clock l2clk
// 0in known_driven -var tcu_mcu_dr_clk_stop -clock drl2clk
// 0in known_driven -var tcu_mcu_io_clk_stop -clock iol2clk
// 0in known_driven -var tcu_pce_ov -clock l2clk
// 0in known_driven -var tcu_muxtest -clock l2clk
// 0in known_driven -var tcu_dectest -clock l2clk
// 0in known_driven -var tcu_scan_en -clock l2clk
// 0in known_driven -var scan_out -clock l2clk
// 0in known_driven -var mcu_fsr0_data -clock drl2clk
// 0in known_driven -var mcu_fsr1_data -clock drl2clk
// 0in known_driven -var mcu_fsr0_cfgpll_enpll -clock drl2clk
// 0in known_driven -var mcu_fsr1_cfgpll_enpll -clock drl2clk
// 0in known_driven -var mcu_fsr01_cfgpll_lb -clock drl2clk
// 0in known_driven -var mcu_fsr01_cfgpll_mpy -clock drl2clk
// 0in known_driven -var mcu_fsr0_cfgrx_enrx -clock drl2clk
// 0in known_driven -var mcu_fsr1_cfgrx_enrx -clock drl2clk
// 0in known_driven -var mcu_fsr0_cfgrx_align -clock drl2clk
// 0in known_driven -var mcu_fsr1_cfgrx_align -clock drl2clk
// 0in known_driven -var mcu_fsr0_cfgrx_invpair -clock drl2clk
// 0in known_driven -var mcu_fsr1_cfgrx_invpair -clock drl2clk
// 0in known_driven -var mcu_fsr01_cfgrx_eq -clock drl2clk
// 0in known_driven -var mcu_fsr01_cfgrx_cdr -clock drl2clk
// 0in known_driven -var mcu_fsr01_cfgrx_term -clock drl2clk
// 0in known_driven -var mcu_fsr0_cfgtx_entx -clock drl2clk
// 0in known_driven -var mcu_fsr1_cfgtx_entx -clock drl2clk
// 0in known_driven -var mcu_fsr0_cfgtx_enidl -clock drl2clk
// 0in known_driven -var mcu_fsr1_cfgtx_enidl -clock drl2clk
// 0in known_driven -var mcu_fsr0_cfgtx_invpair -clock drl2clk
// 0in known_driven -var mcu_fsr1_cfgtx_invpair -clock drl2clk
// 0in known_driven -var mcu_fsr01_cfgtx_enftp -clock drl2clk
// 0in known_driven -var mcu_fsr01_cfgtx_de -clock drl2clk
// 0in known_driven -var mcu_fsr01_cfgtx_swing -clock drl2clk
// 0in known_driven -var mcu_fsr01_cfgtx_cm -clock drl2clk
// 0in known_driven -var fsr0_mcu_rxbclk -clock drl2clk -active (&fsr0_mcu_stspll_lock[2:0])
// 0in known_driven -var fsr1_mcu_rxbclk -clock drl2clk -active (&fsr1_mcu_stspll_lock[2:0])
// 0in known_driven -var fsr0_mcu_data -clock drl2clk -active (&fsr0_mcu_stspll_lock[2:0])
// 0in known_driven -var fsr1_mcu_data -clock drl2clk -active (&fsr1_mcu_stspll_lock[2:0])
// 0in known_driven -var fsr0_mcu_stspll_lock -clock drl2clk
// 0in known_driven -var fsr1_mcu_stspll_lock -clock drl2clk
// 0in known_driven -var fsr0_mcu_stsrx_sync -clock drl2clk -active (&fsr0_mcu_stspll_lock[2:0])
// 0in known_driven -var fsr1_mcu_stsrx_sync -clock drl2clk -active (&fsr1_mcu_stspll_lock[2:0])
// 0in known_driven -var fsr0_mcu_stsrx_losdtct -clock drl2clk -active (&fsr0_mcu_stspll_lock[2:0])
// 0in known_driven -var fsr1_mcu_stsrx_losdtct -clock drl2clk -active (&fsr1_mcu_stspll_lock[2:0])
// 0in known_driven -var mcu_dbg1_rd_req_in_0 -clock iol2clk
// 0in known_driven -var mcu_dbg1_rd_req_in_1 -clock iol2clk
// 0in known_driven -var mcu_dbg1_rd_req_out -clock iol2clk
// 0in known_driven -var mcu_dbg1_wr_req_in_0 -clock iol2clk
// 0in known_driven -var mcu_dbg1_wr_req_in_1 -clock iol2clk
// 0in known_driven -var mcu_dbg1_wr_req_out -clock iol2clk
// 0in known_driven -var mcu_dbg1_mecc_err -clock iol2clk
// 0in known_driven -var mcu_dbg1_secc_err -clock iol2clk
// 0in known_driven -var mcu_dbg1_fbd_err -clock iol2clk
// 0in known_driven -var mcu_dbg1_err_mode -clock iol2clk
// 0in known_driven -var mcu_dbg1_err_event -clock iol2clk
// 0in known_driven -var tcu_mbist_bisi_en -clock l2clk
// 0in known_driven -var tcu_mcu_mbist_start -clock l2clk
// 0in known_driven -var mcu_tcu_mbist_done -clock l2clk
// 0in known_driven -var mcu_tcu_mbist_fail -clock l2clk
// 0in known_driven -var tcu_mcu_mbist_scan_in -clock l2clk
// 0in known_driven -var mcu_tcu_mbist_scan_out -clock l2clk

// 0in custom -fire (wdqrf00.array.wr_en & wdqrf00.array.rd_en & wdqrf00.array.rd_adr[4:0] == wdqrf00.array.wr_adr[4:0]) -clock l2clk
// 0in custom -fire (wdqrf01.array.wr_en & wdqrf01.array.rd_en & wdqrf01.array.rd_adr[4:0] == wdqrf01.array.wr_adr[4:0]) -clock l2clk
// 0in custom -fire (wdqrf10.array.wr_en & wdqrf10.array.rd_en & wdqrf10.array.rd_adr[4:0] == wdqrf10.array.wr_adr[4:0]) -clock l2clk
// 0in custom -fire (wdqrf11.array.wr_en & wdqrf11.array.rd_en & wdqrf11.array.rd_adr[4:0] == wdqrf11.array.wr_adr[4:0]) -clock l2clk

assign mbist_scanin              = tcu_mcu_mbist_scan_in    ;
assign mcu_tcu_mbist_scan_out    = mbist_scanout            ;

// fixscan start:
assign clkgen_cmp_scanin         = scan_in                  ;
assign clkgen_dr_scanin          = clkgen_cmp_scanout       ;
assign clkgen_io_scanin          = clkgen_dr_scanout        ;
assign l2if0_scanin              = clkgen_io_scanout        ;
assign l2if1_scanin              = l2if0_scanout            ;
assign drif_scanin               = l2if1_scanout            ;
assign ucb_scanin                = drif_scanout             ;
assign rdata_scanin              = ucb_scanout              ;
assign rdpctl_scanin             = rdata_scanout            ;
assign fdout_scanin              = rdpctl_scanout           ;
assign fdoklu_scanin             = fdout_scanout            ;
assign fbdtm_scanin              = fdoklu_scanout           ;
assign fbdic_scanin              = fbdtm_scanout            ;
assign crcs_scanin               = fbdic_scanout            ;
assign crcn_scanin               = crcs_scanout             ;
assign addrdp_scanin             = crcn_scanout             ;
assign readdp0_scanin            = addrdp_scanout           ;
assign readdp1_scanin            = readdp0_scanout          ;
assign l2rdmx_scanin             = readdp1_scanout          ;
assign wrdp_scanin               = l2rdmx_scanout           ;
assign fbdiwr_scanin             = wrdp_scanout             ;
assign fbdird_scanin             = fbdiwr_scanout           ;
assign lndskw0_scanin            = fbdird_scanout           ;
assign lndskw1_scanin            = lndskw0_scanout          ;
assign fbd0_scanin               = lndskw1_scanout          ;
assign fbd1_scanin               = fbd0_scanout             ;
assign wdqrf00_scanin            = fbd1_scanout             ;
assign wdqrf01_scanin            = wdqrf00_scanout          ;
assign wdqrf10_scanin            = wdqrf01_scanout          ;
assign wdqrf11_scanin            = wdqrf10_scanout          ;
assign drif_wmr_scanin           = wdqrf11_scanout          ;
assign rdpctl_wmr_scanin         = drif_wmr_scanout         ;
assign lndskw0_wmr_scanin        = rdpctl_wmr_scanout       ;
assign lndskw1_wmr_scanin        = lndskw0_wmr_scanout      ;
assign fbdtm_wmr_scanin          = lndskw1_wmr_scanout      ;
assign fbdic_wmr_scanin          = fbdtm_wmr_scanout        ;
assign scan_out                  = fbdic_wmr_scanout        ;
// fixscan end:
endmodule

