// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: peu_csr_omni.v
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
`timescale 100ps/10ps


module peu_csr_omni (

        tlu_ctl_csrbus_read_data,
        tlu_ctl_csrbus_omni_data,

        ilu_err_rw1s_alias_csrbus_read_data,
        ilu_err_rw1s_alias_csrbus_omni_data,

        tlu_sts_csrbus_read_data,
        tlu_sts_csrbus_omni_data,

        trn_off_csrbus_read_data,
        trn_off_csrbus_omni_data,

        tlu_ici_csrbus_read_data,
        tlu_ici_csrbus_omni_data,

        tlu_diag_csrbus_read_data,
        tlu_diag_csrbus_omni_data,

        tlu_ecc_csrbus_read_data,
        tlu_ecc_csrbus_omni_data,

        tlu_ecl_csrbus_read_data,
        tlu_ecl_csrbus_omni_data,

        tlu_erb_csrbus_read_data,
        tlu_erb_csrbus_omni_data,

        tlu_ica_csrbus_read_data,
        tlu_ica_csrbus_omni_data,

        tlu_icr_csrbus_read_data,
        tlu_icr_csrbus_omni_data,

        oe_log_csrbus_read_data,
        oe_log_csrbus_omni_data,

        oe_int_en_csrbus_read_data,
        oe_int_en_csrbus_omni_data,

        oe_en_err_csrbus_read_data,
        oe_en_err_csrbus_omni_data,

        oe_err_rw1c_alias_csrbus_read_data,
        oe_err_rw1c_alias_csrbus_omni_data,

        oe_err_rw1s_alias_csrbus_read_data,
        oe_err_rw1s_alias_csrbus_omni_data,

        roe_hdr1_csrbus_read_data,
        roe_hdr1_csrbus_omni_data,

        roe_hdr2_csrbus_read_data,
        roe_hdr2_csrbus_omni_data,

        toe_hdr1_csrbus_read_data,
        toe_hdr1_csrbus_omni_data,

        toe_hdr2_csrbus_read_data,
        toe_hdr2_csrbus_omni_data,

        tlu_prfc_csrbus_read_data,
        tlu_prfc_csrbus_omni_data,

        tlu_prf0_csrbus_read_data,
        tlu_prf0_csrbus_omni_data,

        tlu_prf1_csrbus_read_data,
        tlu_prf1_csrbus_omni_data,

        tlu_prf2_csrbus_read_data,
        tlu_prf2_csrbus_omni_data,

        tlu_dbg_sel_a_csrbus_read_data,
        tlu_dbg_sel_a_csrbus_omni_data,

        tlu_dbg_sel_b_csrbus_read_data,
        tlu_dbg_sel_b_csrbus_omni_data,

        dev_cap_csrbus_read_data,
        dev_cap_csrbus_omni_data,

        dev_ctl_csrbus_read_data,
        dev_ctl_csrbus_omni_data,

        dev_sts_csrbus_read_data,
        dev_sts_csrbus_omni_data,

        lnk_cap_csrbus_read_data,
        lnk_cap_csrbus_omni_data,

        lnk_ctl_csrbus_read_data,
        lnk_ctl_csrbus_omni_data,

        lnk_sts_csrbus_read_data,
        lnk_sts_csrbus_omni_data,

        slt_cap_csrbus_read_data,
        slt_cap_csrbus_omni_data,

        ue_log_csrbus_read_data,
        ue_log_csrbus_omni_data,

        ue_int_en_csrbus_read_data,
        ue_int_en_csrbus_omni_data,

        ue_en_err_csrbus_read_data,
        ue_en_err_csrbus_omni_data,

        ue_err_rw1c_alias_csrbus_read_data,
        ue_err_rw1c_alias_csrbus_omni_data,

        ue_err_rw1s_alias_csrbus_read_data,
        ue_err_rw1s_alias_csrbus_omni_data,

        rue_hdr1_csrbus_read_data,
        rue_hdr1_csrbus_omni_data,

        rue_hdr2_csrbus_read_data,
        rue_hdr2_csrbus_omni_data,

        tue_hdr1_csrbus_read_data,
        tue_hdr1_csrbus_omni_data,

        tue_hdr2_csrbus_read_data,
        tue_hdr2_csrbus_omni_data,

        ce_log_csrbus_read_data,
        ce_log_csrbus_omni_data,

        ce_int_en_csrbus_read_data,
        ce_int_en_csrbus_omni_data,

        ce_en_err_csrbus_read_data,
        ce_en_err_csrbus_omni_data,

        ce_err_rw1c_alias_csrbus_read_data,
        ce_err_rw1c_alias_csrbus_omni_data,

        ce_err_rw1s_alias_csrbus_read_data,
        ce_err_rw1s_alias_csrbus_omni_data,

        peu_dlpl_serdes_rev_csrbus_read_data,
        peu_dlpl_serdes_rev_csrbus_omni_data,

        acknak_thresh_csrbus_read_data,
        acknak_thresh_csrbus_omni_data,

        acknak_timer_csrbus_read_data,
        acknak_timer_csrbus_omni_data,

        replay_tim_thresh_csrbus_read_data,
        replay_tim_thresh_csrbus_omni_data,

        replay_timer_csrbus_read_data,
        replay_timer_csrbus_omni_data,

        ven_dllp_msg_csrbus_read_data,
        ven_dllp_msg_csrbus_omni_data,

        force_ltssm_csrbus_read_data,
        force_ltssm_csrbus_omni_data,

        link_cfg_csrbus_read_data,
        link_cfg_csrbus_omni_data,

        link_ctl_csrbus_read_data,
        link_ctl_csrbus_omni_data,

        lane_skew_csrbus_read_data,
        lane_skew_csrbus_omni_data,

        symbol_num_csrbus_read_data,
        symbol_num_csrbus_omni_data,

        symbol_timer_csrbus_read_data,
        symbol_timer_csrbus_omni_data,

        core_status_csrbus_read_data,
        core_status_csrbus_omni_data,

        event_err_log_en_csrbus_read_data,
        event_err_log_en_csrbus_omni_data,

        event_err_int_en_csrbus_read_data,
        event_err_int_en_csrbus_omni_data,

        event_err_int_sts_csrbus_read_data,
        event_err_int_sts_csrbus_omni_data,

        event_err_sts_clr_rw1c_alias_csrbus_read_data,
        event_err_sts_clr_rw1c_alias_csrbus_omni_data,

        event_err_sts_clr_rw1s_alias_csrbus_read_data,
        event_err_sts_clr_rw1s_alias_csrbus_omni_data,

        lnk_bit_err_cnt_1_csrbus_read_data,
        lnk_bit_err_cnt_1_csrbus_omni_data,

        lnk_bit_err_cnt_2_csrbus_read_data,
        lnk_bit_err_cnt_2_csrbus_omni_data,

        serdes_pll_csrbus_read_data,
        serdes_pll_csrbus_omni_data,

        serdes_receiver_lane_ctl_csrbus_read_data,
        serdes_receiver_lane_ctl_csrbus_omni_data,

        serdes_receiver_lane_status_csrbus_read_data,
        serdes_receiver_lane_status_csrbus_omni_data,

        serdes_xmitter_lane_ctl_csrbus_read_data,
        serdes_xmitter_lane_ctl_csrbus_omni_data,

        serdes_xmitter_lane_status_csrbus_read_data,
        serdes_xmitter_lane_status_csrbus_omni_data,

        serdes_macro_test_cfg_csrbus_read_data,
        serdes_macro_test_cfg_csrbus_omni_data

        );

        input [63:0] 	tlu_ctl_csrbus_read_data;
        output [63:0]   tlu_ctl_csrbus_omni_data;

        input [63:0] 	ilu_err_rw1s_alias_csrbus_read_data;
        output [63:0]   ilu_err_rw1s_alias_csrbus_omni_data;

        input [63:0] 	tlu_sts_csrbus_read_data;
        output [63:0]   tlu_sts_csrbus_omni_data;

        input [63:0] 	trn_off_csrbus_read_data;
        output [63:0]   trn_off_csrbus_omni_data;

        input [63:0] 	tlu_ici_csrbus_read_data;
        output [63:0]   tlu_ici_csrbus_omni_data;

        input [63:0] 	tlu_diag_csrbus_read_data;
        output [63:0]   tlu_diag_csrbus_omni_data;

        input [63:0] 	tlu_ecc_csrbus_read_data;
        output [63:0]   tlu_ecc_csrbus_omni_data;

        input [63:0] 	tlu_ecl_csrbus_read_data;
        output [63:0]   tlu_ecl_csrbus_omni_data;

        input [63:0] 	tlu_erb_csrbus_read_data;
        output [63:0]   tlu_erb_csrbus_omni_data;

        input [63:0] 	tlu_ica_csrbus_read_data;
        output [63:0]   tlu_ica_csrbus_omni_data;

        input [63:0] 	tlu_icr_csrbus_read_data;
        output [63:0]   tlu_icr_csrbus_omni_data;

        input [63:0] 	oe_log_csrbus_read_data;
        output [63:0]   oe_log_csrbus_omni_data;

        input [63:0] 	oe_int_en_csrbus_read_data;
        output [63:0]   oe_int_en_csrbus_omni_data;

        input [63:0] oe_en_err_csrbus_read_data;
        output [63:0]  oe_en_err_csrbus_omni_data;

        input [63:0] oe_err_rw1c_alias_csrbus_read_data;
        output [63:0]  oe_err_rw1c_alias_csrbus_omni_data;

        input [63:0] oe_err_rw1s_alias_csrbus_read_data;
        output [63:0]  oe_err_rw1s_alias_csrbus_omni_data;

        input [63:0] roe_hdr1_csrbus_read_data;
        output [63:0]  roe_hdr1_csrbus_omni_data;

        input [63:0] roe_hdr2_csrbus_read_data;
        output [63:0]  roe_hdr2_csrbus_omni_data;

        input [63:0] toe_hdr1_csrbus_read_data;
        output [63:0]  toe_hdr1_csrbus_omni_data;

        input [63:0] toe_hdr2_csrbus_read_data;
        output [63:0]  toe_hdr2_csrbus_omni_data;

        input [63:0] tlu_prfc_csrbus_read_data;
        output [63:0]  tlu_prfc_csrbus_omni_data;

        input [63:0] tlu_prf0_csrbus_read_data;
        output [63:0]  tlu_prf0_csrbus_omni_data;

        input [63:0] tlu_prf1_csrbus_read_data;
        output [63:0]  tlu_prf1_csrbus_omni_data;

        input [63:0] tlu_prf2_csrbus_read_data;
        output [63:0]  tlu_prf2_csrbus_omni_data;

        input [63:0] tlu_dbg_sel_a_csrbus_read_data;
        output [63:0]  tlu_dbg_sel_a_csrbus_omni_data;

        input [63:0] tlu_dbg_sel_b_csrbus_read_data;
        output [63:0]  tlu_dbg_sel_b_csrbus_omni_data;

        input [63:0] dev_cap_csrbus_read_data;
        output [63:0]  dev_cap_csrbus_omni_data;

        input [63:0] dev_ctl_csrbus_read_data;
        output [63:0]  dev_ctl_csrbus_omni_data;

        input [63:0] dev_sts_csrbus_read_data;
        output [63:0]  dev_sts_csrbus_omni_data;

        input [63:0] lnk_cap_csrbus_read_data;
        output [63:0]  lnk_cap_csrbus_omni_data;

        input [63:0] lnk_ctl_csrbus_read_data;
        output [63:0]  lnk_ctl_csrbus_omni_data;

        input [63:0] lnk_sts_csrbus_read_data;
        output [63:0]  lnk_sts_csrbus_omni_data;

        input [63:0] slt_cap_csrbus_read_data;
        output [63:0]  slt_cap_csrbus_omni_data;

        input [63:0] ue_log_csrbus_read_data;
        output [63:0]  ue_log_csrbus_omni_data;

        input [63:0] ue_int_en_csrbus_read_data;
        output [63:0]  ue_int_en_csrbus_omni_data;

        input [63:0] ue_en_err_csrbus_read_data;
        output [63:0]  ue_en_err_csrbus_omni_data;

        input [63:0] ue_err_rw1c_alias_csrbus_read_data;
        output [63:0]  ue_err_rw1c_alias_csrbus_omni_data;

        input [63:0] ue_err_rw1s_alias_csrbus_read_data;
        output [63:0]  ue_err_rw1s_alias_csrbus_omni_data;

        input [63:0] rue_hdr1_csrbus_read_data;
        output [63:0]  rue_hdr1_csrbus_omni_data;

        input [63:0] rue_hdr2_csrbus_read_data;
        output [63:0]  rue_hdr2_csrbus_omni_data;

        input [63:0] tue_hdr1_csrbus_read_data;
        output [63:0]  tue_hdr1_csrbus_omni_data;

        input [63:0] tue_hdr2_csrbus_read_data;
        output [63:0]  tue_hdr2_csrbus_omni_data;

        input [63:0] ce_log_csrbus_read_data;
        output [63:0]  ce_log_csrbus_omni_data;

        input [63:0] ce_int_en_csrbus_read_data;
        output [63:0]  ce_int_en_csrbus_omni_data;

        input [63:0] ce_en_err_csrbus_read_data;
        output [63:0]  ce_en_err_csrbus_omni_data;

        input [63:0] ce_err_rw1c_alias_csrbus_read_data;
        output [63:0]  ce_err_rw1c_alias_csrbus_omni_data;

        input [63:0] ce_err_rw1s_alias_csrbus_read_data;
        output [63:0]  ce_err_rw1s_alias_csrbus_omni_data;

        input [63:0] peu_dlpl_serdes_rev_csrbus_read_data;
        output [63:0]  peu_dlpl_serdes_rev_csrbus_omni_data;

        input [63:0] acknak_thresh_csrbus_read_data;
        output [63:0]  acknak_thresh_csrbus_omni_data;

        input [63:0] acknak_timer_csrbus_read_data;
        output [63:0]  acknak_timer_csrbus_omni_data;

        input [63:0] replay_tim_thresh_csrbus_read_data;
        output [63:0]  replay_tim_thresh_csrbus_omni_data;

        input [63:0] replay_timer_csrbus_read_data;
        output [63:0]  replay_timer_csrbus_omni_data;

        input [63:0] ven_dllp_msg_csrbus_read_data;
        output [63:0]  ven_dllp_msg_csrbus_omni_data;

        input [63:0] force_ltssm_csrbus_read_data;
        output [63:0]  force_ltssm_csrbus_omni_data;

        input [63:0] link_cfg_csrbus_read_data;
        output [63:0]  link_cfg_csrbus_omni_data;

        input [63:0] link_ctl_csrbus_read_data;
        output [63:0]  link_ctl_csrbus_omni_data;

        input [63:0] lane_skew_csrbus_read_data;
        output [63:0]  lane_skew_csrbus_omni_data;

        input [63:0] symbol_num_csrbus_read_data;
        output [63:0]  symbol_num_csrbus_omni_data;

        input [63:0] symbol_timer_csrbus_read_data;
        output [63:0]  symbol_timer_csrbus_omni_data;

        input [63:0] core_status_csrbus_read_data;
        output [63:0]  core_status_csrbus_omni_data;

        input [63:0] event_err_log_en_csrbus_read_data;
        output [63:0]  event_err_log_en_csrbus_omni_data;

        input [63:0] event_err_int_en_csrbus_read_data;
        output [63:0]  event_err_int_en_csrbus_omni_data;

        input [63:0] event_err_int_sts_csrbus_read_data;
        output [63:0]  event_err_int_sts_csrbus_omni_data;

        input [63:0] event_err_sts_clr_rw1c_alias_csrbus_read_data;
        output [63:0]  event_err_sts_clr_rw1c_alias_csrbus_omni_data;

        input [63:0] event_err_sts_clr_rw1s_alias_csrbus_read_data;
        output [63:0]  event_err_sts_clr_rw1s_alias_csrbus_omni_data;

        input [63:0] lnk_bit_err_cnt_1_csrbus_read_data;
        output [63:0]  lnk_bit_err_cnt_1_csrbus_omni_data;

        input [63:0] lnk_bit_err_cnt_2_csrbus_read_data;
        output [63:0]  lnk_bit_err_cnt_2_csrbus_omni_data;

        input [63:0] serdes_pll_csrbus_read_data;
        output [63:0]  serdes_pll_csrbus_omni_data;

        input [63:0] serdes_receiver_lane_ctl_csrbus_read_data;
        output [63:0]  serdes_receiver_lane_ctl_csrbus_omni_data;

        input [63:0] serdes_receiver_lane_status_csrbus_read_data;
        output [63:0]  serdes_receiver_lane_status_csrbus_omni_data;

        input [63:0] serdes_xmitter_lane_ctl_csrbus_read_data;
        output [63:0]  serdes_xmitter_lane_ctl_csrbus_omni_data;

        input [63:0] serdes_xmitter_lane_status_csrbus_read_data;
        output [63:0]  serdes_xmitter_lane_status_csrbus_omni_data;

        input [63:0] serdes_macro_test_cfg_csrbus_read_data;
        output [63:0]  serdes_macro_test_cfg_csrbus_omni_data;

        wire [63:0] 	tlu_ctl_csrbus_read_data;
        reg [63:0]   tlu_ctl_csrbus_omni_data;

        wire [63:0] 	ilu_err_rw1s_alias_csrbus_read_data;
        reg [63:0]   ilu_err_rw1s_alias_csrbus_omni_data;

        wire [63:0] 	tlu_sts_csrbus_read_data;
        reg [63:0]   tlu_sts_csrbus_omni_data;

        wire [63:0] 	trn_off_csrbus_read_data;
        reg [63:0]   trn_off_csrbus_omni_data;

        wire [63:0] 	tlu_ici_csrbus_read_data;
        reg [63:0]   tlu_ici_csrbus_omni_data;

        wire [63:0] 	tlu_diag_csrbus_read_data;
        reg [63:0]   tlu_diag_csrbus_omni_data;

        wire [63:0] 	tlu_ecc_csrbus_read_data;
        reg [63:0]   tlu_ecc_csrbus_omni_data;

        wire [63:0] 	tlu_ecl_csrbus_read_data;
        reg [63:0]   tlu_ecl_csrbus_omni_data;

        wire [63:0] 	tlu_erb_csrbus_read_data;
        reg [63:0]   tlu_erb_csrbus_omni_data;

        wire [63:0] 	tlu_ica_csrbus_read_data;
        reg [63:0]   tlu_ica_csrbus_omni_data;

        wire [63:0] 	tlu_icr_csrbus_read_data;
        reg [63:0]   tlu_icr_csrbus_omni_data;

        wire [63:0] 	oe_log_csrbus_read_data;
        reg [63:0]   oe_log_csrbus_omni_data;

        wire [63:0] 	oe_int_en_csrbus_read_data;
        reg [63:0]   oe_int_en_csrbus_omni_data;

        wire [63:0] oe_en_err_csrbus_read_data;
        reg [63:0]  oe_en_err_csrbus_omni_data;

        wire [63:0] oe_err_rw1c_alias_csrbus_read_data;
        reg [63:0]  oe_err_rw1c_alias_csrbus_omni_data;

        wire [63:0] oe_err_rw1s_alias_csrbus_read_data;
        reg [63:0]  oe_err_rw1s_alias_csrbus_omni_data;

        wire [63:0] roe_hdr1_csrbus_read_data;
        reg [63:0]  roe_hdr1_csrbus_omni_data;

        wire [63:0] roe_hdr2_csrbus_read_data;
        reg [63:0]  roe_hdr2_csrbus_omni_data;

        wire [63:0] toe_hdr1_csrbus_read_data;
        reg [63:0]  toe_hdr1_csrbus_omni_data;

        wire [63:0] toe_hdr2_csrbus_read_data;
        reg [63:0]  toe_hdr2_csrbus_omni_data;

        wire [63:0] tlu_prfc_csrbus_read_data;
        reg [63:0]  tlu_prfc_csrbus_omni_data;

        wire [63:0] tlu_prf0_csrbus_read_data;
        reg [63:0]  tlu_prf0_csrbus_omni_data;

        wire [63:0] tlu_prf1_csrbus_read_data;
        reg [63:0]  tlu_prf1_csrbus_omni_data;

        wire [63:0] tlu_prf2_csrbus_read_data;
        reg [63:0]  tlu_prf2_csrbus_omni_data;

        wire [63:0] tlu_dbg_sel_a_csrbus_read_data;
        reg [63:0]  tlu_dbg_sel_a_csrbus_omni_data;

        wire [63:0] tlu_dbg_sel_b_csrbus_read_data;
        reg [63:0]  tlu_dbg_sel_b_csrbus_omni_data;

        wire [63:0] dev_cap_csrbus_read_data;
        reg [63:0]  dev_cap_csrbus_omni_data;

        wire [63:0] dev_ctl_csrbus_read_data;
        reg [63:0]  dev_ctl_csrbus_omni_data;

        wire [63:0] dev_sts_csrbus_read_data;
        reg [63:0]  dev_sts_csrbus_omni_data;

        wire [63:0] lnk_cap_csrbus_read_data;
        reg [63:0]  lnk_cap_csrbus_omni_data;

        wire [63:0] lnk_ctl_csrbus_read_data;
        reg [63:0]  lnk_ctl_csrbus_omni_data;

        wire [63:0] lnk_sts_csrbus_read_data;
        reg [63:0]  lnk_sts_csrbus_omni_data;

        wire [63:0] slt_cap_csrbus_read_data;
        reg [63:0]  slt_cap_csrbus_omni_data;

        wire [63:0] ue_log_csrbus_read_data;
        reg [63:0]  ue_log_csrbus_omni_data;

        wire [63:0] ue_int_en_csrbus_read_data;
        reg [63:0]  ue_int_en_csrbus_omni_data;

        wire [63:0] ue_en_err_csrbus_read_data;
        reg [63:0]  ue_en_err_csrbus_omni_data;

        wire [63:0] ue_err_rw1c_alias_csrbus_read_data;
        reg [63:0]  ue_err_rw1c_alias_csrbus_omni_data;

        wire [63:0] ue_err_rw1s_alias_csrbus_read_data;
        reg [63:0]  ue_err_rw1s_alias_csrbus_omni_data;

        wire [63:0] rue_hdr1_csrbus_read_data;
        reg [63:0]  rue_hdr1_csrbus_omni_data;

        wire [63:0] rue_hdr2_csrbus_read_data;
        reg [63:0]  rue_hdr2_csrbus_omni_data;

        wire [63:0] tue_hdr1_csrbus_read_data;
        reg [63:0]  tue_hdr1_csrbus_omni_data;

        wire [63:0] tue_hdr2_csrbus_read_data;
        reg [63:0]  tue_hdr2_csrbus_omni_data;

        wire [63:0] ce_log_csrbus_read_data;
        reg [63:0]  ce_log_csrbus_omni_data;

        wire [63:0] ce_int_en_csrbus_read_data;
        reg [63:0]  ce_int_en_csrbus_omni_data;

        wire [63:0] ce_en_err_csrbus_read_data;
        reg [63:0]  ce_en_err_csrbus_omni_data;

        wire [63:0] ce_err_rw1c_alias_csrbus_read_data;
        reg [63:0]  ce_err_rw1c_alias_csrbus_omni_data;

        wire [63:0] ce_err_rw1s_alias_csrbus_read_data;
        reg [63:0]  ce_err_rw1s_alias_csrbus_omni_data;

        wire [63:0] peu_dlpl_serdes_rev_csrbus_read_data;
        reg [63:0]  peu_dlpl_serdes_rev_csrbus_omni_data;

        wire [63:0] acknak_thresh_csrbus_read_data;
        reg [63:0]  acknak_thresh_csrbus_omni_data;

        wire [63:0] acknak_timer_csrbus_read_data;
        reg [63:0]  acknak_timer_csrbus_omni_data;

        wire [63:0] replay_tim_thresh_csrbus_read_data;
        reg [63:0]  replay_tim_thresh_csrbus_omni_data;

        wire [63:0] replay_timer_csrbus_read_data;
        reg [63:0]  replay_timer_csrbus_omni_data;

        wire [63:0] ven_dllp_msg_csrbus_read_data;
        reg [63:0]  ven_dllp_msg_csrbus_omni_data;

        wire [63:0] force_ltssm_csrbus_read_data;
        reg [63:0]  force_ltssm_csrbus_omni_data;

        wire [63:0] link_cfg_csrbus_read_data;
        reg [63:0]  link_cfg_csrbus_omni_data;

        wire [63:0] link_ctl_csrbus_read_data;
        reg [63:0]  link_ctl_csrbus_omni_data;

        wire [63:0] lane_skew_csrbus_read_data;
        reg [63:0]  lane_skew_csrbus_omni_data;

        wire [63:0] symbol_num_csrbus_read_data;
        reg [63:0]  symbol_num_csrbus_omni_data;

        wire [63:0] symbol_timer_csrbus_read_data;
        reg [63:0]  symbol_timer_csrbus_omni_data;

        wire [63:0] core_status_csrbus_read_data;
        reg [63:0]  core_status_csrbus_omni_data;

        wire [63:0] event_err_log_en_csrbus_read_data;
        reg [63:0]  event_err_log_en_csrbus_omni_data;

        wire [63:0] event_err_int_en_csrbus_read_data;
        reg [63:0]  event_err_int_en_csrbus_omni_data;

        wire [63:0] event_err_int_sts_csrbus_read_data;
        reg [63:0]  event_err_int_sts_csrbus_omni_data;

        wire [63:0] event_err_sts_clr_rw1c_alias_csrbus_read_data;
        reg [63:0]  event_err_sts_clr_rw1c_alias_csrbus_omni_data;

        wire [63:0] event_err_sts_clr_rw1s_alias_csrbus_read_data;
        reg [63:0]  event_err_sts_clr_rw1s_alias_csrbus_omni_data;

        wire [63:0] lnk_bit_err_cnt_1_csrbus_read_data;
        reg [63:0]  lnk_bit_err_cnt_1_csrbus_omni_data;

        wire [63:0] lnk_bit_err_cnt_2_csrbus_read_data;
        reg [63:0]  lnk_bit_err_cnt_2_csrbus_omni_data;

        wire [63:0] serdes_pll_csrbus_read_data;
        reg [63:0]  serdes_pll_csrbus_omni_data;

        wire [63:0] serdes_receiver_lane_ctl_csrbus_read_data;
        reg [63:0]  serdes_receiver_lane_ctl_csrbus_omni_data;

        wire [63:0] serdes_receiver_lane_status_csrbus_read_data;
        reg [63:0]  serdes_receiver_lane_status_csrbus_omni_data;

        wire [63:0] serdes_xmitter_lane_ctl_csrbus_read_data;
        reg [63:0]  serdes_xmitter_lane_ctl_csrbus_omni_data;

        wire [63:0] serdes_xmitter_lane_status_csrbus_read_data;
        reg [63:0]  serdes_xmitter_lane_status_csrbus_omni_data;

        wire [63:0] serdes_macro_test_cfg_csrbus_read_data;
        reg [63:0]  serdes_macro_test_cfg_csrbus_omni_data;


endmodule // csr_omni
