// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_dcs_dp.v
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
module lsu_dcs_dp (
  l2clk, 
  scan_in, 
  wmr_scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk_wmr, 
  spc_aclk, 
  spc_bclk, 
  lb_scan_en_wmr, 
  scan_out, 
  wmr_scan_out, 
  const_cpuid, 
  dec_lsu_tid0_d, 
  dec_lsu_tid1_d, 
  dec_lsu_tg_d, 
  dcc_ld_inst_unqual_e, 
  dcc_ctxt_tid0_d, 
  dcc_ctxt_tid1_d, 
  dcc_ctxt_tg_d, 
  dcc_tid_m, 
  dcc_tid_b, 
  dcc_asi_reload_sel, 
  dcc_wr_wtchpt, 
  dcc_wr_lsu_ctl_reg, 
  dcc_wr_pwr_mgmt, 
  dcc_rd_lsu_ctl_reg_b, 
  dcc_rd_diag_reg_b, 
  dcc_rd_core_id_b, 
  dcc_rd_intr_id_b, 
  dcc_rd_rhs_asi_b, 
  dcc_rd_diag_dca_b, 
  dcc_rd_error_inj_b, 
  dcc_rd_pwr_mgmt_b, 
  dcc_wr_error_inj_w, 
  dcc_p0ctxt_rd_m, 
  dcc_p1ctxt_rd_m, 
  dcc_s0ctxt_rd_m, 
  dcc_s1ctxt_rd_m, 
  dcc_pid_rd_m, 
  dcc_wtchpt_sel_m, 
  dcc_wtchpt_rd_b, 
  dcc_pctxt_sel_e, 
  dcc_sctxt_sel_e, 
  dcc_dcs_memref_e, 
  dcc_direct_map, 
  dcc_asi_store_b, 
  dcc_asi_load_m, 
  dcc_asi_load_b, 
  lsu_ifu_direct_map, 
  asc_wr_p0ctxt, 
  asc_wr_p1ctxt, 
  asc_wr_s0ctxt, 
  asc_wr_s1ctxt, 
  asc_wr_pid, 
  asc_wrasi, 
  tlu_asi_0, 
  tlu_asi_1, 
  tlu_lsu_clear_ctl_reg_, 
  dca_rparity_b, 
  sbd_st_data_b, 
  tgd_ldxa_asi_data_b, 
  asd_asi_data, 
  lsu_va_m, 
  lsu_va_b, 
  dcs_asi_d, 
  dcs_context0_e, 
  dcs_context1_e, 
  dcs_pid_e, 
  dcs_ldxa_asi_data_w, 
  dcs_watchpoint_m, 
  dcs_dc_enable, 
  dcs_wpt_mask_m, 
  dcs_wpt_enable_m, 
  dcs_wpt_mode_m, 
  dcs_dmmu_enable_d, 
  lsu_immu_enable, 
  lsu_ic_enable, 
  lsu_context_b, 
  lsu_asi_error_inject, 
  lsu_asi_pwr_mgmt, 
  dcs_memref_m);
wire stop;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire siclk_wmr;
wire scan_en_wmr;
wire dff_in_data_scanin;
wire dff_in_data_scanout;
wire [47:0] wsr_data_w;
wire [12:0] asi_data_in;
wire [7:0] reload_asi_0;
wire [7:0] asi_state0;
wire [7:0] asi_state0_in;
wire [7:0] asi_state1;
wire [7:0] asi_state1_in;
wire [7:0] asi_state2;
wire [7:0] asi_state2_in;
wire [7:0] asi_state3;
wire [7:0] asi_state3_in;
wire [7:0] reload_asi_1;
wire [7:0] asi_state4;
wire [7:0] asi_state4_in;
wire [7:0] asi_state5;
wire [7:0] asi_state5_in;
wire [7:0] asi_state6;
wire [7:0] asi_state6_in;
wire [7:0] asi_state7;
wire [7:0] asi_state7_in;
wire [7:0] wr_p1ctxt_;
wire [7:0] wr_s1ctxt_;
wire [7:0] wr_p0ctxt_;
wire [7:0] wr_s0ctxt_;
wire [7:0] wr_pid_;
wire [7:0] wr_p1ctxt;
wire [7:0] wr_s1ctxt;
wire [7:0] wr_p0ctxt;
wire [7:0] wr_s0ctxt;
wire [7:0] wr_pid;
wire [12:0] p0ctxt_0;
wire [12:0] p0ctxt_0_in;
wire [12:0] p0ctxt_1;
wire [12:0] p0ctxt_1_in;
wire [12:0] p0ctxt_2;
wire [12:0] p0ctxt_2_in;
wire [12:0] p0ctxt_3;
wire [12:0] p0ctxt_3_in;
wire [12:0] p0ctxt_4;
wire [12:0] p0ctxt_4_in;
wire [12:0] p0ctxt_5;
wire [12:0] p0ctxt_5_in;
wire [12:0] p0ctxt_6;
wire [12:0] p0ctxt_6_in;
wire [12:0] p0ctxt_7;
wire [12:0] p0ctxt_7_in;
wire [12:0] p1ctxt_0;
wire [12:0] p1ctxt_0_in;
wire [12:0] p1ctxt_1;
wire [12:0] p1ctxt_1_in;
wire [12:0] p1ctxt_2;
wire [12:0] p1ctxt_2_in;
wire [12:0] p1ctxt_3;
wire [12:0] p1ctxt_3_in;
wire [12:0] p1ctxt_4;
wire [12:0] p1ctxt_4_in;
wire [12:0] p1ctxt_5;
wire [12:0] p1ctxt_5_in;
wire [12:0] p1ctxt_6;
wire [12:0] p1ctxt_6_in;
wire [12:0] p1ctxt_7;
wire [12:0] p1ctxt_7_in;
wire [12:0] s0ctxt_0;
wire [12:0] s0ctxt_0_in;
wire [12:0] s0ctxt_1;
wire [12:0] s0ctxt_1_in;
wire [12:0] s0ctxt_2;
wire [12:0] s0ctxt_2_in;
wire [12:0] s0ctxt_3;
wire [12:0] s0ctxt_3_in;
wire [12:0] s0ctxt_4;
wire [12:0] s0ctxt_4_in;
wire [12:0] s0ctxt_5;
wire [12:0] s0ctxt_5_in;
wire [12:0] s0ctxt_6;
wire [12:0] s0ctxt_6_in;
wire [12:0] s0ctxt_7;
wire [12:0] s0ctxt_7_in;
wire [12:0] s1ctxt_0;
wire [12:0] s1ctxt_0_in;
wire [12:0] s1ctxt_1;
wire [12:0] s1ctxt_1_in;
wire [12:0] s1ctxt_2;
wire [12:0] s1ctxt_2_in;
wire [12:0] s1ctxt_3;
wire [12:0] s1ctxt_3_in;
wire [12:0] s1ctxt_4;
wire [12:0] s1ctxt_4_in;
wire [12:0] s1ctxt_5;
wire [12:0] s1ctxt_5_in;
wire [12:0] s1ctxt_6;
wire [12:0] s1ctxt_6_in;
wire [12:0] s1ctxt_7;
wire [12:0] s1ctxt_7_in;
wire [2:0] pid0;
wire [2:0] pid0_in;
wire [2:0] pid1;
wire [2:0] pid1_in;
wire [2:0] pid2;
wire [2:0] pid2_in;
wire [2:0] pid3;
wire [2:0] pid3_in;
wire [2:0] pid4;
wire [2:0] pid4_in;
wire [2:0] pid5;
wire [2:0] pid5_in;
wire [2:0] pid6;
wire [2:0] pid6_in;
wire [2:0] pid7;
wire [2:0] pid7_in;
wire dff_state0_wmr_scanin;
wire dff_state0_wmr_scanout;
wire [62:0] state0;
wire dff_state1_wmr_scanin;
wire dff_state1_wmr_scanout;
wire [62:0] state1;
wire dff_state2_wmr_scanin;
wire dff_state2_wmr_scanout;
wire [62:0] state2;
wire dff_state3_wmr_scanin;
wire dff_state3_wmr_scanout;
wire [62:0] state3;
wire dff_state4_wmr_scanin;
wire dff_state4_wmr_scanout;
wire [62:0] state4;
wire dff_state5_wmr_scanin;
wire dff_state5_wmr_scanout;
wire [62:0] state5;
wire dff_state6_wmr_scanin;
wire dff_state6_wmr_scanout;
wire [62:0] state6;
wire dff_state7_wmr_scanin;
wire dff_state7_wmr_scanout;
wire [62:0] state7;
wire [62:0] state_tg0;
wire [62:0] state_tg1;
wire [7:0] dmmu_enable;
wire dmmu_enable_tg0;
wire dmmu_enable_tg1;
wire dff_mx_ctxt_scanin;
wire dff_mx_ctxt_scanout;
wire [12:0] dcs_p1ctxt_e;
wire [12:0] dcs_s1ctxt_e;
wire [12:0] dcs_p0ctxt_e;
wire [12:0] dcs_s0ctxt_e;
wire [12:0] context0_e;
wire [12:0] context1_e;
wire dff_context_m_scanin;
wire dff_context_m_scanout;
wire memref_m;
wire [12:0] dcs_context0_m;
wire dff_context_b_scanin;
wire dff_context_b_scanout;
wire [4:0] lsu_ctl_reg_m;
wire [12:0] dcs_context0_b;
wire [1:0] dcs_wpt_mode_b;
wire [7:0] dcs_wpt_mask_b;
wire [1:0] dcs_wpt_enable_b;
wire [4:0] lsu_ctl_reg_b;
wire dff_state_m_scanin;
wire dff_state_m_scanout;
wire [2:0] dcs_pid_m;
wire [12:0] dcs_p1ctxt_m;
wire [12:0] dcs_s1ctxt_m;
wire [12:0] dcs_p0ctxt_m;
wire [12:0] dcs_s0ctxt_m;
wire [12:0] ldxa_asi_data_m;
wire dff_stg_b_scanin;
wire dff_stg_b_scanout;
wire [47:3] watchpoint_m;
wire [46:0] stg_b;
wire [12:0] ldxa_asi_data_b;
wire [47:3] watchpoint_b;
wire [5:0] core_id;
wire [5:0] max_core_id;
wire [5:0] max_strand_id;
wire [63:0] ldxa_asi_data_b_2;
wire dff_asi_w_scanin;
wire dff_asi_w_scanout;
wire dff_watchpoint_0_wmr_scanin;
wire dff_watchpoint_0_wmr_scanout;
wire [47:3] watchpoint0;
wire dff_watchpoint_1_wmr_scanin;
wire dff_watchpoint_1_wmr_scanout;
wire [47:3] watchpoint1;
wire dff_watchpoint_2_wmr_scanin;
wire dff_watchpoint_2_wmr_scanout;
wire [47:3] watchpoint2;
wire dff_watchpoint_3_wmr_scanin;
wire dff_watchpoint_3_wmr_scanout;
wire [47:3] watchpoint3;
wire dff_watchpoint_4_wmr_scanin;
wire dff_watchpoint_4_wmr_scanout;
wire [47:3] watchpoint4;
wire dff_watchpoint_5_wmr_scanin;
wire dff_watchpoint_5_wmr_scanout;
wire [47:3] watchpoint5;
wire dff_watchpoint_6_wmr_scanin;
wire dff_watchpoint_6_wmr_scanout;
wire [47:3] watchpoint6;
wire dff_watchpoint_7_wmr_scanin;
wire dff_watchpoint_7_wmr_scanout;
wire [47:3] watchpoint7;
wire [47:3] watchpoint_mx_m;
wire [16:0] ctl_reg0_in;
wire [16:0] ctl_reg1_in;
wire [16:0] ctl_reg2_in;
wire [16:0] ctl_reg3_in;
wire [16:0] ctl_reg4_in;
wire [16:0] ctl_reg5_in;
wire [16:0] ctl_reg6_in;
wire [16:0] ctl_reg7_in;
wire dff_lsu_ctl_0_scanin;
wire dff_lsu_ctl_0_scanout;
wire [1:0] wpt_mode_0;
wire [7:0] wpt_mask_0;
wire [1:0] wpt_enable_0;
wire [7:0] spec_enable;
wire [7:0] immu_enable;
wire [7:0] dc_enable;
wire [7:0] ic_enable;
wire dff_lsu_ctl_1_scanin;
wire dff_lsu_ctl_1_scanout;
wire [1:0] wpt_mode_1;
wire [7:0] wpt_mask_1;
wire [1:0] wpt_enable_1;
wire dff_lsu_ctl_2_scanin;
wire dff_lsu_ctl_2_scanout;
wire [1:0] wpt_mode_2;
wire [7:0] wpt_mask_2;
wire [1:0] wpt_enable_2;
wire dff_lsu_ctl_3_scanin;
wire dff_lsu_ctl_3_scanout;
wire [1:0] wpt_mode_3;
wire [7:0] wpt_mask_3;
wire [1:0] wpt_enable_3;
wire dff_lsu_ctl_4_scanin;
wire dff_lsu_ctl_4_scanout;
wire [1:0] wpt_mode_4;
wire [7:0] wpt_mask_4;
wire [1:0] wpt_enable_4;
wire dff_lsu_ctl_5_scanin;
wire dff_lsu_ctl_5_scanout;
wire [1:0] wpt_mode_5;
wire [7:0] wpt_mask_5;
wire [1:0] wpt_enable_5;
wire dff_lsu_ctl_6_scanin;
wire dff_lsu_ctl_6_scanout;
wire [1:0] wpt_mode_6;
wire [7:0] wpt_mask_6;
wire [1:0] wpt_enable_6;
wire dff_lsu_ctl_7_scanin;
wire dff_lsu_ctl_7_scanout;
wire [1:0] wpt_mode_7;
wire [7:0] wpt_mask_7;
wire [1:0] wpt_enable_7;
wire [16:0] lsu_ctl_mx;
wire dff_error_inject_scanin;
wire dff_error_inject_scanout;
wire [31:0] asi_error_inject;
wire dff_pwr_mgmt_scanin;
wire dff_pwr_mgmt_scanout;
wire [15:0] asi_pwr_mgmt;
wire dff_va_b_scanin;
wire dff_va_b_scanout;
wire [20:0] va_b;


input		l2clk;
input 		scan_in;
input 		wmr_scan_in;
input 		tcu_pce_ov;		// scan signals
input		tcu_scan_en;
input 		spc_aclk_wmr;
input 		spc_aclk;
input 		spc_bclk;
input		lb_scan_en_wmr;
output		scan_out;
output		wmr_scan_out;

input	[2:0]	const_cpuid;

input	[1:0]	dec_lsu_tid0_d;
input	[1:0]	dec_lsu_tid1_d;
input		dec_lsu_tg_d;

input		dcc_ld_inst_unqual_e;
input	[1:0]	dcc_ctxt_tid0_d;
input	[1:0]	dcc_ctxt_tid1_d;
input		dcc_ctxt_tg_d;
input	[2:0]	dcc_tid_m;
input	[2:0]	dcc_tid_b;
input	[7:0]	dcc_asi_reload_sel;
input	[7:0]	dcc_wr_wtchpt;
input	[7:0]	dcc_wr_lsu_ctl_reg;
input		dcc_wr_pwr_mgmt;
input		dcc_rd_lsu_ctl_reg_b;
input		dcc_rd_diag_reg_b;
input		dcc_rd_core_id_b;
input		dcc_rd_intr_id_b;
input		dcc_rd_rhs_asi_b;
input		dcc_rd_diag_dca_b;
input		dcc_rd_error_inj_b;
input		dcc_rd_pwr_mgmt_b;
input		dcc_wr_error_inj_w;
input		dcc_p0ctxt_rd_m;
input		dcc_p1ctxt_rd_m;
input		dcc_s0ctxt_rd_m;
input		dcc_s1ctxt_rd_m;
input		dcc_pid_rd_m;
input		dcc_wtchpt_sel_m;
input		dcc_wtchpt_rd_b;
input		dcc_pctxt_sel_e;
input		dcc_sctxt_sel_e;
input		dcc_dcs_memref_e;
input		dcc_direct_map;		// diag read only
input		dcc_asi_store_b;
input		dcc_asi_load_m;
input		dcc_asi_load_b;
input		lsu_ifu_direct_map;	// diag read only

input	[7:0]	asc_wr_p0ctxt;
input	[7:0]	asc_wr_p1ctxt;
input	[7:0]	asc_wr_s0ctxt;
input	[7:0]	asc_wr_s1ctxt;
input	[7:0]	asc_wr_pid;
input	[7:0]	asc_wrasi;

input	[7:0]	tlu_asi_0;	// ASI reload data
input	[7:0]	tlu_asi_1;
input	[7:0]	tlu_lsu_clear_ctl_reg_;

input	[7:0]	dca_rparity_b;

input	[47:0]	sbd_st_data_b;

input	[63:0]	tgd_ldxa_asi_data_b;

input	[12:0]	asd_asi_data;

input	[20:0]	lsu_va_m;
output	[20:0]	lsu_va_b;

output	[7:0]	dcs_asi_d;

output	[12:0]	dcs_context0_e;
output	[12:0]	dcs_context1_e;
output	[2:0]	dcs_pid_e;
output	[63:0]	dcs_ldxa_asi_data_w;
output	[47:3]	dcs_watchpoint_m;
output	[7:0]	dcs_dc_enable;
output	[7:0]	dcs_wpt_mask_m;
output	[1:0]	dcs_wpt_enable_m;
output	[1:0]	dcs_wpt_mode_m;
output		dcs_dmmu_enable_d;

output	[7:0]	lsu_immu_enable;
output	[7:0]	lsu_ic_enable;
output	[12:0]	lsu_context_b;
output	[31:0]	lsu_asi_error_inject;
output	[15:0]	lsu_asi_pwr_mgmt;
output		dcs_memref_m;

// scan renames
assign stop = 1'b0;
// end scan

lsu_dcs_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_6 test_rep0  (
	.din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk,spc_aclk_wmr,lb_scan_en_wmr}),
	.dout({se,pce_ov,siclk,soclk,siclk_wmr,scan_en_wmr})
);

lsu_dcs_dp_msff_macro__left_16__stack_64c__width_48 dff_in_data   (
	.scan_in(dff_in_data_scanin),
	.scan_out(dff_in_data_scanout),
	.din	(sbd_st_data_b[47:0]),
	.dout	(wsr_data_w[47:0]),
	.clk	(l2clk),
	.en	(dcc_asi_store_b),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// These nets have a high internal load so buffer them off.
lsu_dcs_dp_buff_macro__dbuff_16x__rep_1__width_13 asi_data_buf  (
	.din	(asd_asi_data[12:0]),
	.dout	(asi_data_in[12:0])
);

////////////////////////////////////////////////////////////////////////////////
// ASI muxes

lsu_dcs_dp_mux_macro__mux_aope__ports_3__stack_8r__width_8 mx_asi_state0      (
	.din0	(reload_asi_0[7:0]),
	.din1	(asi_data_in[7:0]),
	.din2	(asi_state0[7:0]),
	.sel0	(dcc_asi_reload_sel[0]),
	.sel1	(asc_wrasi[0]),
	.dout	(asi_state0_in[7:0])
);
lsu_dcs_dp_mux_macro__mux_aope__ports_3__stack_8r__width_8 mx_asi_state1      (
	.din0	(reload_asi_0[7:0]),
	.din1	(asi_data_in[7:0]),
	.din2	(asi_state1[7:0]),
	.sel0	(dcc_asi_reload_sel[1]),
	.sel1	(asc_wrasi[1]),
	.dout	(asi_state1_in[7:0])
);
lsu_dcs_dp_mux_macro__mux_aope__ports_3__stack_8r__width_8 mx_asi_state2      (
	.din0	(reload_asi_0[7:0]),
	.din1	(asi_data_in[7:0]),
	.din2	(asi_state2[7:0]),
	.sel0	(dcc_asi_reload_sel[2]),
	.sel1	(asc_wrasi[2]),
	.dout	(asi_state2_in[7:0])
);
lsu_dcs_dp_mux_macro__mux_aope__ports_3__stack_8r__width_8 mx_asi_state3      (
	.din0	(reload_asi_0[7:0]),
	.din1	(asi_data_in[7:0]),
	.din2	(asi_state3[7:0]),
	.sel0	(dcc_asi_reload_sel[3]),
	.sel1	(asc_wrasi[3]),
	.dout	(asi_state3_in[7:0])
);
lsu_dcs_dp_mux_macro__mux_aope__ports_3__stack_8r__width_8 mx_asi_state4      (
	.din0	(reload_asi_1[7:0]),
	.din1	(asi_data_in[7:0]),
	.din2	(asi_state4[7:0]),
	.sel0	(dcc_asi_reload_sel[4]),
	.sel1	(asc_wrasi[4]),
	.dout	(asi_state4_in[7:0])
);
lsu_dcs_dp_mux_macro__mux_aope__ports_3__stack_8r__width_8 mx_asi_state5      (
	.din0	(reload_asi_1[7:0]),
	.din1	(asi_data_in[7:0]),
	.din2	(asi_state5[7:0]),
	.sel0	(dcc_asi_reload_sel[5]),
	.sel1	(asc_wrasi[5]),
	.dout	(asi_state5_in[7:0])
);
lsu_dcs_dp_mux_macro__mux_aope__ports_3__stack_8r__width_8 mx_asi_state6      (
	.din0	(reload_asi_1[7:0]),
	.din1	(asi_data_in[7:0]),
	.din2	(asi_state6[7:0]),
	.sel0	(dcc_asi_reload_sel[6]),
	.sel1	(asc_wrasi[6]),
	.dout	(asi_state6_in[7:0])
);
lsu_dcs_dp_mux_macro__mux_aope__ports_3__stack_8r__width_8 mx_asi_state7      (
	.din0	(reload_asi_1[7:0]),
	.din1	(asi_data_in[7:0]),
	.din2	(asi_state7[7:0]),
	.sel0	(dcc_asi_reload_sel[7]),
	.sel1	(asc_wrasi[7]),
	.dout	(asi_state7_in[7:0])
);

// Invert/buffer select lines for aomuxes
lsu_dcs_dp_inv_macro__width_10 inv_sel0  (
	.din	({asc_wr_p1ctxt [0],asc_wr_s1ctxt [0],asc_wr_p0ctxt [0],asc_wr_s0ctxt [0],asc_wr_pid [0],
		      wr_p1ctxt_[0],    wr_s1ctxt_[0],    wr_p0ctxt_[0],    wr_s0ctxt_[0],    wr_pid_[0]}),
	.dout	({    wr_p1ctxt_[0],    wr_s1ctxt_[0],    wr_p0ctxt_[0],    wr_s0ctxt_[0],    wr_pid_[0],
		      wr_p1ctxt [0],    wr_s1ctxt [0],    wr_p0ctxt [0],    wr_s0ctxt [0],     wr_pid[0]})
);
lsu_dcs_dp_inv_macro__width_10 inv_sel1  (
	.din	({asc_wr_p1ctxt [1],asc_wr_s1ctxt [1],asc_wr_p0ctxt [1],asc_wr_s0ctxt [1],asc_wr_pid [1],
		      wr_p1ctxt_[1],    wr_s1ctxt_[1],    wr_p0ctxt_[1],    wr_s0ctxt_[1],    wr_pid_[1]}),
	.dout	({    wr_p1ctxt_[1],    wr_s1ctxt_[1],    wr_p0ctxt_[1],    wr_s0ctxt_[1],    wr_pid_[1],
		      wr_p1ctxt [1],    wr_s1ctxt [1],    wr_p0ctxt [1],    wr_s0ctxt [1],     wr_pid[1]})
);
lsu_dcs_dp_inv_macro__width_10 inv_sel2  (
	.din	({asc_wr_p1ctxt [2],asc_wr_s1ctxt [2],asc_wr_p0ctxt [2],asc_wr_s0ctxt [2],asc_wr_pid [2],
		      wr_p1ctxt_[2],    wr_s1ctxt_[2],    wr_p0ctxt_[2],    wr_s0ctxt_[2],    wr_pid_[2]}),
	.dout	({    wr_p1ctxt_[2],    wr_s1ctxt_[2],    wr_p0ctxt_[2],    wr_s0ctxt_[2],    wr_pid_[2],
		      wr_p1ctxt [2],    wr_s1ctxt [2],    wr_p0ctxt [2],    wr_s0ctxt [2],     wr_pid[2]})
);
lsu_dcs_dp_inv_macro__width_10 inv_sel3  (
	.din	({asc_wr_p1ctxt [3],asc_wr_s1ctxt [3],asc_wr_p0ctxt [3],asc_wr_s0ctxt [3],asc_wr_pid [3],
		      wr_p1ctxt_[3],    wr_s1ctxt_[3],    wr_p0ctxt_[3],    wr_s0ctxt_[3],    wr_pid_[3]}),
	.dout	({    wr_p1ctxt_[3],    wr_s1ctxt_[3],    wr_p0ctxt_[3],    wr_s0ctxt_[3],    wr_pid_[3],
		      wr_p1ctxt [3],    wr_s1ctxt [3],    wr_p0ctxt [3],    wr_s0ctxt [3],     wr_pid[3]})
);
lsu_dcs_dp_inv_macro__width_10 inv_sel4  (
	.din	({asc_wr_p1ctxt [4],asc_wr_s1ctxt [4],asc_wr_p0ctxt [4],asc_wr_s0ctxt [4],asc_wr_pid [4],
		      wr_p1ctxt_[4],    wr_s1ctxt_[4],    wr_p0ctxt_[4],    wr_s0ctxt_[4],    wr_pid_[4]}),
	.dout	({    wr_p1ctxt_[4],    wr_s1ctxt_[4],    wr_p0ctxt_[4],    wr_s0ctxt_[4],    wr_pid_[4],
		      wr_p1ctxt [4],    wr_s1ctxt [4],    wr_p0ctxt [4],    wr_s0ctxt [4],     wr_pid[4]})
);
lsu_dcs_dp_inv_macro__width_10 inv_sel5  (
	.din	({asc_wr_p1ctxt [5],asc_wr_s1ctxt [5],asc_wr_p0ctxt [5],asc_wr_s0ctxt [5],asc_wr_pid [5],
		      wr_p1ctxt_[5],    wr_s1ctxt_[5],    wr_p0ctxt_[5],    wr_s0ctxt_[5],    wr_pid_[5]}),
	.dout	({    wr_p1ctxt_[5],    wr_s1ctxt_[5],    wr_p0ctxt_[5],    wr_s0ctxt_[5],    wr_pid_[5],
		      wr_p1ctxt [5],    wr_s1ctxt [5],    wr_p0ctxt [5],    wr_s0ctxt [5],     wr_pid[5]})
);
lsu_dcs_dp_inv_macro__width_10 inv_sel6  (
	.din	({asc_wr_p1ctxt [6],asc_wr_s1ctxt [6],asc_wr_p0ctxt [6],asc_wr_s0ctxt [6],asc_wr_pid [6],
		      wr_p1ctxt_[6],    wr_s1ctxt_[6],    wr_p0ctxt_[6],    wr_s0ctxt_[6],    wr_pid_[6]}),
	.dout	({    wr_p1ctxt_[6],    wr_s1ctxt_[6],    wr_p0ctxt_[6],    wr_s0ctxt_[6],    wr_pid_[6],
		      wr_p1ctxt [6],    wr_s1ctxt [6],    wr_p0ctxt [6],    wr_s0ctxt [6],     wr_pid[6]})
);
lsu_dcs_dp_inv_macro__width_10 inv_sel7  (
	.din	({asc_wr_p1ctxt [7],asc_wr_s1ctxt [7],asc_wr_p0ctxt [7],asc_wr_s0ctxt [7],asc_wr_pid [7],
		      wr_p1ctxt_[7],    wr_s1ctxt_[7],    wr_p0ctxt_[7],    wr_s0ctxt_[7],    wr_pid_[7]}),
	.dout	({    wr_p1ctxt_[7],    wr_s1ctxt_[7],    wr_p0ctxt_[7],    wr_s0ctxt_[7],    wr_pid_[7],
		      wr_p1ctxt [7],    wr_s1ctxt [7],    wr_p0ctxt [7],    wr_s0ctxt [7],     wr_pid[7]})
);

// Primary context 0 muxes
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_p0ctxt_0      (
	.din0	(asi_data_in[12:0]),
	.din1	(p0ctxt_0[12:0]),
	.sel0	(wr_p0ctxt[0]),
	.sel1	(wr_p0ctxt_[0]),
	.dout	(p0ctxt_0_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_p0ctxt_1      (
	.din0	(asi_data_in[12:0]),
	.din1	(p0ctxt_1[12:0]),
	.sel0	(wr_p0ctxt[1]),
	.sel1	(wr_p0ctxt_[1]),
	.dout	(p0ctxt_1_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_p0ctxt_2      (
	.din0	(asi_data_in[12:0]),
	.din1	(p0ctxt_2[12:0]),
	.sel0	(wr_p0ctxt[2]),
	.sel1	(wr_p0ctxt_[2]),
	.dout	(p0ctxt_2_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_p0ctxt_3      (
	.din0	(asi_data_in[12:0]),
	.din1	(p0ctxt_3[12:0]),
	.sel0	(wr_p0ctxt[3]),
	.sel1	(wr_p0ctxt_[3]),
	.dout	(p0ctxt_3_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_p0ctxt_4      (
	.din0	(asi_data_in[12:0]),
	.din1	(p0ctxt_4[12:0]),
	.sel0	(wr_p0ctxt[4]),
	.sel1	(wr_p0ctxt_[4]),
	.dout	(p0ctxt_4_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_p0ctxt_5      (
	.din0	(asi_data_in[12:0]),
	.din1	(p0ctxt_5[12:0]),
	.sel0	(wr_p0ctxt[5]),
	.sel1	(wr_p0ctxt_[5]),
	.dout	(p0ctxt_5_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_p0ctxt_6      (
	.din0	(asi_data_in[12:0]),
	.din1	(p0ctxt_6[12:0]),
	.sel0	(wr_p0ctxt[6]),
	.sel1	(wr_p0ctxt_[6]),
	.dout	(p0ctxt_6_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_p0ctxt_7      (
	.din0	(asi_data_in[12:0]),
	.din1	(p0ctxt_7[12:0]),
	.sel0	(wr_p0ctxt[7]),
	.sel1	(wr_p0ctxt_[7]),
	.dout	(p0ctxt_7_in[12:0])
);

// Primary context 1 muxes
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_p1ctxt_0      (
	.din0	(asi_data_in[12:0]),
	.din1	(p1ctxt_0[12:0]),
	.sel0	(wr_p1ctxt[0]),
	.sel1	(wr_p1ctxt_[0]),
	.dout	(p1ctxt_0_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_p1ctxt_1      (
	.din0	(asi_data_in[12:0]),
	.din1	(p1ctxt_1[12:0]),
	.sel0	(wr_p1ctxt[1]),
	.sel1	(wr_p1ctxt_[1]),
	.dout	(p1ctxt_1_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_p1ctxt_2      (
	.din0	(asi_data_in[12:0]),
	.din1	(p1ctxt_2[12:0]),
	.sel0	(wr_p1ctxt[2]),
	.sel1	(wr_p1ctxt_[2]),
	.dout	(p1ctxt_2_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_p1ctxt_3      (
	.din0	(asi_data_in[12:0]),
	.din1	(p1ctxt_3[12:0]),
	.sel0	(wr_p1ctxt[3]),
	.sel1	(wr_p1ctxt_[3]),
	.dout	(p1ctxt_3_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_p1ctxt_4      (
	.din0	(asi_data_in[12:0]),
	.din1	(p1ctxt_4[12:0]),
	.sel0	(wr_p1ctxt[4]),
	.sel1	(wr_p1ctxt_[4]),
	.dout	(p1ctxt_4_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_p1ctxt_5      (
	.din0	(asi_data_in[12:0]),
	.din1	(p1ctxt_5[12:0]),
	.sel0	(wr_p1ctxt[5]),
	.sel1	(wr_p1ctxt_[5]),
	.dout	(p1ctxt_5_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_p1ctxt_6      (
	.din0	(asi_data_in[12:0]),
	.din1	(p1ctxt_6[12:0]),
	.sel0	(wr_p1ctxt[6]),
	.sel1	(wr_p1ctxt_[6]),
	.dout	(p1ctxt_6_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_p1ctxt_7      (
	.din0	(asi_data_in[12:0]),
	.din1	(p1ctxt_7[12:0]),
	.sel0	(wr_p1ctxt[7]),
	.sel1	(wr_p1ctxt_[7]),
	.dout	(p1ctxt_7_in[12:0])
);

// Secondary context 0 muxes
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_s0ctxt_0      (
	.din0	(asi_data_in[12:0]),
	.din1	(s0ctxt_0[12:0]),
	.sel0	(wr_s0ctxt[0]),
	.sel1	(wr_s0ctxt_[0]),
	.dout	(s0ctxt_0_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_s0ctxt_1      (
	.din0	(asi_data_in[12:0]),
	.din1	(s0ctxt_1[12:0]),
	.sel0	(wr_s0ctxt[1]),
	.sel1	(wr_s0ctxt_[1]),
	.dout	(s0ctxt_1_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_s0ctxt_2      (
	.din0	(asi_data_in[12:0]),
	.din1	(s0ctxt_2[12:0]),
	.sel0	(wr_s0ctxt[2]),
	.sel1	(wr_s0ctxt_[2]),
	.dout	(s0ctxt_2_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_s0ctxt_3      (
	.din0	(asi_data_in[12:0]),
	.din1	(s0ctxt_3[12:0]),
	.sel0	(wr_s0ctxt[3]),
	.sel1	(wr_s0ctxt_[3]),
	.dout	(s0ctxt_3_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_s0ctxt_4      (
	.din0	(asi_data_in[12:0]),
	.din1	(s0ctxt_4[12:0]),
	.sel0	(wr_s0ctxt[4]),
	.sel1	(wr_s0ctxt_[4]),
	.dout	(s0ctxt_4_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_s0ctxt_5      (
	.din0	(asi_data_in[12:0]),
	.din1	(s0ctxt_5[12:0]),
	.sel0	(wr_s0ctxt[5]),
	.sel1	(wr_s0ctxt_[5]),
	.dout	(s0ctxt_5_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_s0ctxt_6      (
	.din0	(asi_data_in[12:0]),
	.din1	(s0ctxt_6[12:0]),
	.sel0	(wr_s0ctxt[6]),
	.sel1	(wr_s0ctxt_[6]),
	.dout	(s0ctxt_6_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_s0ctxt_7      (
	.din0	(asi_data_in[12:0]),
	.din1	(s0ctxt_7[12:0]),
	.sel0	(wr_s0ctxt[7]),
	.sel1	(wr_s0ctxt_[7]),
	.dout	(s0ctxt_7_in[12:0])
);

// Secondary context 1 muxes
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_s1ctxt_0      (
	.din0	(asi_data_in[12:0]),
	.din1	(s1ctxt_0[12:0]),
	.sel0	(wr_s1ctxt[0]),
	.sel1	(wr_s1ctxt_[0]),
	.dout	(s1ctxt_0_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_s1ctxt_1      (
	.din0	(asi_data_in[12:0]),
	.din1	(s1ctxt_1[12:0]),
	.sel0	(wr_s1ctxt[1]),
	.sel1	(wr_s1ctxt_[1]),
	.dout	(s1ctxt_1_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_s1ctxt_2      (
	.din0	(asi_data_in[12:0]),
	.din1	(s1ctxt_2[12:0]),
	.sel0	(wr_s1ctxt[2]),
	.sel1	(wr_s1ctxt_[2]),
	.dout	(s1ctxt_2_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_s1ctxt_3      (
	.din0	(asi_data_in[12:0]),
	.din1	(s1ctxt_3[12:0]),
	.sel0	(wr_s1ctxt[3]),
	.sel1	(wr_s1ctxt_[3]),
	.dout	(s1ctxt_3_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_s1ctxt_4      (
	.din0	(asi_data_in[12:0]),
	.din1	(s1ctxt_4[12:0]),
	.sel0	(wr_s1ctxt[4]),
	.sel1	(wr_s1ctxt_[4]),
	.dout	(s1ctxt_4_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_s1ctxt_5      (
	.din0	(asi_data_in[12:0]),
	.din1	(s1ctxt_5[12:0]),
	.sel0	(wr_s1ctxt[5]),
	.sel1	(wr_s1ctxt_[5]),
	.dout	(s1ctxt_5_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_s1ctxt_6      (
	.din0	(asi_data_in[12:0]),
	.din1	(s1ctxt_6[12:0]),
	.sel0	(wr_s1ctxt[6]),
	.sel1	(wr_s1ctxt_[6]),
	.dout	(s1ctxt_6_in[12:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 mx_s1ctxt_7      (
	.din0	(asi_data_in[12:0]),
	.din1	(s1ctxt_7[12:0]),
	.sel0	(wr_s1ctxt[7]),
	.sel1	(wr_s1ctxt_[7]),
	.dout	(s1ctxt_7_in[12:0])
);

// Partition ID muxes
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_3 mx_pid0      (
	.din0	(asi_data_in[2:0]),
	.din1	(pid0[2:0]),
	.sel0	(wr_pid[0]),
	.sel1	(wr_pid_[0]),
	.dout	(pid0_in[2:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_3 mx_pid1      (
	.din0	(asi_data_in[2:0]),
	.din1	(pid1[2:0]),
	.sel0	(wr_pid[1]),
	.sel1	(wr_pid_[1]),
	.dout	(pid1_in[2:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_3 mx_pid2      (
	.din0	(asi_data_in[2:0]),
	.din1	(pid2[2:0]),
	.sel0	(wr_pid[2]),
	.sel1	(wr_pid_[2]),
	.dout	(pid2_in[2:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_3 mx_pid3      (
	.din0	(asi_data_in[2:0]),
	.din1	(pid3[2:0]),
	.sel0	(wr_pid[3]),
	.sel1	(wr_pid_[3]),
	.dout	(pid3_in[2:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_3 mx_pid4      (
	.din0	(asi_data_in[2:0]),
	.din1	(pid4[2:0]),
	.sel0	(wr_pid[4]),
	.sel1	(wr_pid_[4]),
	.dout	(pid4_in[2:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_3 mx_pid5      (
	.din0	(asi_data_in[2:0]),
	.din1	(pid5[2:0]),
	.sel0	(wr_pid[5]),
	.sel1	(wr_pid_[5]),
	.dout	(pid5_in[2:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_3 mx_pid6      (
	.din0	(asi_data_in[2:0]),
	.din1	(pid6[2:0]),
	.sel0	(wr_pid[6]),
	.sel1	(wr_pid_[6]),
	.dout	(pid6_in[2:0])
);
lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_3 mx_pid7      (
	.din0	(asi_data_in[2:0]),
	.din1	(pid7[2:0]),
	.sel0	(wr_pid[7]),
	.sel1	(wr_pid_[7]),
	.dout	(pid7_in[2:0])
);

lsu_dcs_dp_msff_macro__left_1__stack_64c__width_63 dff_state0     (	// FS:wmr_protect
	.scan_in(dff_state0_wmr_scanin),
	.scan_out(dff_state0_wmr_scanout),
	.siclk(siclk_wmr),
	.din	({pid0_in[2:0],p1ctxt_0_in[12:0],s1ctxt_0_in[12:0],p0ctxt_0_in[12:0],s0ctxt_0_in[12:0],asi_state0_in[7:0]}),
	.dout	(state0[62:0]),                                                                                          
	.clk	(l2clk),                                                                                                 
	.en	(1'b1),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)                                                                                         
);                                                                                                                       
lsu_dcs_dp_msff_macro__left_1__stack_64c__width_63 dff_state1     ( 	// FS:wmr_protect
	.scan_in(dff_state1_wmr_scanin),
	.scan_out(dff_state1_wmr_scanout),
	.siclk(siclk_wmr),
	.din	({pid1_in[2:0],p1ctxt_1_in[12:0],s1ctxt_1_in[12:0],p0ctxt_1_in[12:0],s0ctxt_1_in[12:0],asi_state1_in[7:0]}),
	.dout	(state1[62:0]),                                                                                          
	.clk	(l2clk),                                                                                                 
	.en	(1'b1),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)                                                                                         
);                                                                                                                       
lsu_dcs_dp_msff_macro__left_1__stack_64c__width_63 dff_state2     (	// FS:wmr_protect
	.scan_in(dff_state2_wmr_scanin),
	.scan_out(dff_state2_wmr_scanout),
	.siclk(siclk_wmr),
	.din	({pid2_in[2:0],p1ctxt_2_in[12:0],s1ctxt_2_in[12:0],p0ctxt_2_in[12:0],s0ctxt_2_in[12:0],asi_state2_in[7:0]}),
	.dout	(state2[62:0]),                                                                                          
	.clk	(l2clk),                                                                                                 
	.en	(1'b1),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)                                                                                         
);                                                                                                                       
lsu_dcs_dp_msff_macro__left_1__stack_64c__width_63 dff_state3     (	// FS:wmr_protect
	.scan_in(dff_state3_wmr_scanin),
	.scan_out(dff_state3_wmr_scanout),
	.siclk(siclk_wmr),
	.din	({pid3_in[2:0],p1ctxt_3_in[12:0],s1ctxt_3_in[12:0],p0ctxt_3_in[12:0],s0ctxt_3_in[12:0],asi_state3_in[7:0]}),
	.dout	(state3[62:0]),                                                                                          
	.clk	(l2clk),                                                                                                 
	.en	(1'b1),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)                                                                                         
);                                                                                                                       
lsu_dcs_dp_msff_macro__left_1__stack_64c__width_63 dff_state4     (	// FS:wmr_protect
	.scan_in(dff_state4_wmr_scanin),
	.scan_out(dff_state4_wmr_scanout),
	.siclk(siclk_wmr),
	.din	({pid4_in[2:0],p1ctxt_4_in[12:0],s1ctxt_4_in[12:0],p0ctxt_4_in[12:0],s0ctxt_4_in[12:0],asi_state4_in[7:0]}),
	.dout	(state4[62:0]),                                                                                          
	.clk	(l2clk),                                                                                                 
	.en	(1'b1),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)                                                                                         
);                                                                                                                       
lsu_dcs_dp_msff_macro__left_1__stack_64c__width_63 dff_state5     (	// FS:wmr_protect
	.scan_in(dff_state5_wmr_scanin),
	.scan_out(dff_state5_wmr_scanout),
	.siclk(siclk_wmr),
	.din	({pid5_in[2:0],p1ctxt_5_in[12:0],s1ctxt_5_in[12:0],p0ctxt_5_in[12:0],s0ctxt_5_in[12:0],asi_state5_in[7:0]}),
	.dout	(state5[62:0]),                                                                                          
	.clk	(l2clk),                                                                                                 
	.en	(1'b1),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)                                                                                         
);                                                                                                                       
lsu_dcs_dp_msff_macro__left_1__stack_64c__width_63 dff_state6     (	// FS:wmr_protect
	.scan_in(dff_state6_wmr_scanin),
	.scan_out(dff_state6_wmr_scanout),
	.siclk(siclk_wmr),
	.din	({pid6_in[2:0],p1ctxt_6_in[12:0],s1ctxt_6_in[12:0],p0ctxt_6_in[12:0],s0ctxt_6_in[12:0],asi_state6_in[7:0]}),
	.dout	(state6[62:0]),                                                                                          
	.clk	(l2clk),                                                                                                 
	.en	(1'b1),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)                                                                                         
);                                                                                                                       
lsu_dcs_dp_msff_macro__left_1__stack_64c__width_63 dff_state7     (	// FS:wmr_protect
	.scan_in(dff_state7_wmr_scanin),
	.scan_out(dff_state7_wmr_scanout),
	.siclk(siclk_wmr),
	.din	({pid7_in[2:0],p1ctxt_7_in[12:0],s1ctxt_7_in[12:0],p0ctxt_7_in[12:0],s0ctxt_7_in[12:0],asi_state7_in[7:0]}),
	.dout	(state7[62:0]),
	.clk	(l2clk),
	.en	(1'b1),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// DO NOT CHANGE THE NAMES OF THE asi_stateN SIGNALS.  THE VERIFICATION BENCH EXPECTS THIS NAME.
assign {pid0[2:0],p1ctxt_0[12:0],s1ctxt_0[12:0],p0ctxt_0[12:0],s0ctxt_0[12:0],asi_state0[7:0]} = state0[62:0];
assign {pid1[2:0],p1ctxt_1[12:0],s1ctxt_1[12:0],p0ctxt_1[12:0],s0ctxt_1[12:0],asi_state1[7:0]} = state1[62:0];
assign {pid2[2:0],p1ctxt_2[12:0],s1ctxt_2[12:0],p0ctxt_2[12:0],s0ctxt_2[12:0],asi_state2[7:0]} = state2[62:0];
assign {pid3[2:0],p1ctxt_3[12:0],s1ctxt_3[12:0],p0ctxt_3[12:0],s0ctxt_3[12:0],asi_state3[7:0]} = state3[62:0];
assign {pid4[2:0],p1ctxt_4[12:0],s1ctxt_4[12:0],p0ctxt_4[12:0],s0ctxt_4[12:0],asi_state4[7:0]} = state4[62:0];
assign {pid5[2:0],p1ctxt_5[12:0],s1ctxt_5[12:0],p0ctxt_5[12:0],s0ctxt_5[12:0],asi_state5[7:0]} = state5[62:0];
assign {pid6[2:0],p1ctxt_6[12:0],s1ctxt_6[12:0],p0ctxt_6[12:0],s0ctxt_6[12:0],asi_state6[7:0]} = state6[62:0];
assign {pid7[2:0],p1ctxt_7[12:0],s1ctxt_7[12:0],p0ctxt_7[12:0],s0ctxt_7[12:0],asi_state7[7:0]} = state7[62:0];

lsu_dcs_dp_mux_macro__mux_aodec__ports_4__stack_64c__width_55 mx_ctxt0     (
	.din0	(state0[62:8]),
	.din1	(state1[62:8]),
	.din2	(state2[62:8]),
	.din3	(state3[62:8]),
	.sel	(dcc_ctxt_tid0_d[1:0]),
	.dout	(state_tg0[62:8])
);

lsu_dcs_dp_mux_macro__mux_aodec__ports_4__stack_64c__width_55 mx_ctxt1     (
	.din0	(state4[62:8]),
	.din1	(state5[62:8]),
	.din2	(state6[62:8]),
	.din3	(state7[62:8]),
	.sel	(dcc_ctxt_tid1_d[1:0]),
	.dout	(state_tg1[62:8])
);
lsu_dcs_dp_mux_macro__mux_aodec__ports_4__stack_10r__width_9 mx_asi0     (
	.din0	({asi_state0[7:0],dmmu_enable[0]}),
	.din1	({asi_state1[7:0],dmmu_enable[1]}),
	.din2	({asi_state2[7:0],dmmu_enable[2]}),
	.din3	({asi_state3[7:0],dmmu_enable[3]}),
	.sel	(dec_lsu_tid0_d[1:0]),
	.dout	({state_tg0[7:0],dmmu_enable_tg0})
);

lsu_dcs_dp_mux_macro__mux_aodec__ports_4__stack_10r__width_9 mx_asi1     (
	.din0	({asi_state4[7:0],dmmu_enable[4]}),
	.din1	({asi_state5[7:0],dmmu_enable[5]}),
	.din2	({asi_state6[7:0],dmmu_enable[6]}),
	.din3	({asi_state7[7:0],dmmu_enable[7]}),
	.sel	(dec_lsu_tid1_d[1:0]),
	.dout	({state_tg1[7:0],dmmu_enable_tg1})
);

lsu_dcs_dp_msff_macro__mux_aope__ports_2__stack_64c__width_55 dff_mx_ctxt     (
	.scan_in(dff_mx_ctxt_scanin),
	.scan_out(dff_mx_ctxt_scanout),
	.din0	(state_tg1[62:8]),
	.din1	(state_tg0[62:8]),
	.sel0	(dcc_ctxt_tg_d),
	.clk	(l2clk),
	.en	(1'b1),
	.dout	({dcs_pid_e[2:0],dcs_p1ctxt_e[12:0],dcs_s1ctxt_e[12:0],dcs_p0ctxt_e[12:0],dcs_s0ctxt_e[12:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

lsu_dcs_dp_mux_macro__mux_pgpe__ports_2__stack_10r__width_9 mx_asi     (
	.din0	({state_tg1[7:0],dmmu_enable_tg1}),
	.din1	({state_tg0[7:0],dmmu_enable_tg0}),
	.sel0	(dec_lsu_tg_d),
	.dout	({dcs_asi_d[7:0],dcs_dmmu_enable_d})
);

// Context selection
lsu_dcs_dp_mux_macro__mux_aonpe__ports_2__stack_14l__width_13 mx_context0     (
	.din0	(dcs_p0ctxt_e[12:0]),
	.din1	(dcs_s0ctxt_e[12:0]),
	.sel0	(dcc_pctxt_sel_e),
	.sel1	(dcc_sctxt_sel_e),
	.dout	(context0_e[12:0])
);
lsu_dcs_dp_buff_macro__dbuff_16x__rep_1__stack_14r__width_13 buf_context0   (
	.din	(context0_e[12:0]),
	.dout	(dcs_context0_e[12:0])
);

// 0in bits_on -var {dcc_pctxt_sel_e,dcc_sctxt_sel_e} -max 1 -message "multiple context selects"
lsu_dcs_dp_mux_macro__mux_aonpe__ports_2__stack_14r__width_13 mx_context1     (
	.din0	(dcs_p1ctxt_e[12:0]),
	.din1	(dcs_s1ctxt_e[12:0]),
	.sel0	(dcc_pctxt_sel_e),
	.sel1	(dcc_sctxt_sel_e),
	.dout	(context1_e[12:0])
);
lsu_dcs_dp_buff_macro__dbuff_16x__rep_1__stack_14r__width_13 buf_context1   (
	.din	(context1_e[12:0]),
	.dout	(dcs_context1_e[12:0])
);

// MMU needs the context in B for miss processing
lsu_dcs_dp_msff_macro__stack_14r__width_14 dff_context_m    (
	.scan_in(dff_context_m_scanin),
	.scan_out(dff_context_m_scanout),
	.din	({dcc_dcs_memref_e,context0_e[12:0]}),
	.dout	({memref_m        ,dcs_context0_m[12:0]}),
	.clk	(l2clk),
	.en	(dcc_dcs_memref_e),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)		// gated for power
);

// Used elsewhere for power management
assign dcs_memref_m = memref_m;

lsu_dcs_dp_msff_macro__stack_30r__width_30 dff_context_b    (
	.scan_in(dff_context_b_scanin),
	.scan_out(dff_context_b_scanout),
	.din	({dcs_context0_m[12:0],
		  dcs_wpt_mode_m[1:0],dcs_wpt_mask_m[7:0],dcs_wpt_enable_m[1:0],lsu_ctl_reg_m[4:0]}),
	.dout	({dcs_context0_b[12:0],
		  dcs_wpt_mode_b[1:0],dcs_wpt_mask_b[7:0],dcs_wpt_enable_b[1:0],lsu_ctl_reg_b[4:0]}),
	.clk	(l2clk),
	.en	(memref_m),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)		// gated for power
);

lsu_dcs_dp_buff_macro__dbuff_16x__rep_1__width_13 context_buf  (
	.din	(dcs_context0_b[12:0]),
	.dout	(lsu_context_b[12:0])
);

lsu_dcs_dp_msff_macro__stack_64c__width_55 dff_state_m    (
	.scan_in(dff_state_m_scanin),
	.scan_out(dff_state_m_scanout),
	.din	({dcs_pid_e[2:0],dcs_p1ctxt_e[12:0],dcs_s1ctxt_e[12:0],dcs_p0ctxt_e[12:0],dcs_s0ctxt_e[12:0]}),
	.dout	({dcs_pid_m[2:0],dcs_p1ctxt_m[12:0],dcs_s1ctxt_m[12:0],dcs_p0ctxt_m[12:0],dcs_s0ctxt_m[12:0]}),
	.clk	(l2clk),
	.en	(dcc_ld_inst_unqual_e),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	// gated for power
);

// Mux out values for asi read.  (ASI register is read in TLU, so it's not used here)
lsu_dcs_dp_mux_macro__mux_aonpe__ports_5__stack_14l__width_13 mx_state_rd     (
	.din0	(dcs_p0ctxt_m[12:0]),
	.din1	(dcs_p1ctxt_m[12:0]),
	.din2	(dcs_s0ctxt_m[12:0]),
	.din3	(dcs_s1ctxt_m[12:0]),
	.din4	({10'd0,dcs_pid_m[2:0]}),
	.sel0	(dcc_p0ctxt_rd_m),
	.sel1	(dcc_p1ctxt_rd_m),
	.sel2	(dcc_s0ctxt_rd_m),
	.sel3	(dcc_s1ctxt_rd_m),
	.sel4	(dcc_pid_rd_m),
	.dout	(ldxa_asi_data_m[12:0])
);

lsu_dcs_dp_msff_macro__left_17__mux_aope__ports_2__stack_64c__width_47 dff_stg_b       (
	.scan_in(dff_stg_b_scanin),
	.scan_out(dff_stg_b_scanout),
	.din0	({watchpoint_m[47:3],2'b0}),
	.din1	({34'd0,ldxa_asi_data_m[12:0]}),
	.sel0	(dcc_wtchpt_sel_m),
	.dout	(stg_b[46:0]),
	.clk	(l2clk),
	.en	(dcc_asi_load_m),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign ldxa_asi_data_b[12:0] = stg_b[12:0];
assign watchpoint_b[47:3] = {stg_b[46:2]};

assign core_id[5:0] = {const_cpuid[2:0],dcc_tid_b[2:0]};
assign max_core_id[5:0] = 6'b111111;
assign max_strand_id[5:0] = 6'b000111;

lsu_dcs_dp_mux_macro__mux_aope__ports_8__stack_64c__width_64 mx_asi_b      (
	.din0	({{16{watchpoint_b[47]}},watchpoint_b[47:3],3'b00}),
	.din1	({29'd0,dcs_wpt_mode_b[1:0],dcs_wpt_mask_b[7:0],dcs_wpt_enable_b[1:0],18'd0,lsu_ctl_reg_b[4:0]}),
	.din2	({56'd0,dca_rparity_b[7:0]}),
	.din3	({26'b0,max_strand_id[5:0],10'b0,max_core_id[5:0],10'b0,core_id[5:0]}),
	.din4	({58'b0,core_id[5:0]}),
	.din5	({32'b0,lsu_asi_error_inject[31:0]}),
	.din6	({48'b0,lsu_asi_pwr_mgmt[15:0]}),
	.din7	({51'd0,ldxa_asi_data_b[12:0]}),
	.sel0	(dcc_wtchpt_rd_b),
	.sel1	(dcc_rd_lsu_ctl_reg_b),
	.sel2	(dcc_rd_diag_dca_b),
	.sel3	(dcc_rd_core_id_b),
	.sel4	(dcc_rd_intr_id_b),
	.sel5	(dcc_rd_error_inj_b),
	.sel6	(dcc_rd_pwr_mgmt_b),
	.dout	(ldxa_asi_data_b_2[63:0])
);
lsu_dcs_dp_msff_macro__mux_aope__ports_3__stack_64c__width_64 dff_asi_w      (
	.scan_in(dff_asi_w_scanin),
	.scan_out(dff_asi_w_scanout),
	.din0	({62'd0,dcc_direct_map,lsu_ifu_direct_map}),
	.din1	(tgd_ldxa_asi_data_b[63:0]),
	.din2	(ldxa_asi_data_b_2[63:0]),
	.sel0	(dcc_rd_diag_reg_b),
	.sel1	(dcc_rd_rhs_asi_b),
	.dout	(dcs_ldxa_asi_data_w[63:0]),
	.clk	(l2clk),
	.en	(dcc_asi_load_b),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

////////////////////////////////////////////////////////////////////////////////
// Watchpoint registers and comparator

lsu_dcs_dp_msff_macro__left_18__stack_64c__width_45 dff_watchpoint_0    (	// FS:wmr_protect
	.scan_in(dff_watchpoint_0_wmr_scanin),
	.scan_out(dff_watchpoint_0_wmr_scanout),
	.siclk(siclk_wmr),
	.se	(scan_en_wmr),
	.din	(wsr_data_w[47:3]),
	.dout	(watchpoint0[47:3]),
	.clk	(l2clk),
	.en	(dcc_wr_wtchpt[0]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_dcs_dp_msff_macro__left_18__stack_64c__width_45 dff_watchpoint_1    (	// FS:wmr_protect
	.scan_in(dff_watchpoint_1_wmr_scanin),
	.scan_out(dff_watchpoint_1_wmr_scanout),
	.siclk(siclk_wmr),
	.se	(scan_en_wmr),
	.din	(wsr_data_w[47:3]),
	.dout	(watchpoint1[47:3]),
	.clk	(l2clk),
	.en	(dcc_wr_wtchpt[1]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_dcs_dp_msff_macro__left_18__stack_64c__width_45 dff_watchpoint_2    (	// FS:wmr_protect
	.scan_in(dff_watchpoint_2_wmr_scanin),
	.scan_out(dff_watchpoint_2_wmr_scanout),
	.siclk(siclk_wmr),
	.se	(scan_en_wmr),
	.din	(wsr_data_w[47:3]),
	.dout	(watchpoint2[47:3]),
	.clk	(l2clk),
	.en	(dcc_wr_wtchpt[2]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_dcs_dp_msff_macro__left_18__stack_64c__width_45 dff_watchpoint_3    (	// FS:wmr_protect
	.scan_in(dff_watchpoint_3_wmr_scanin),
	.scan_out(dff_watchpoint_3_wmr_scanout),
	.siclk(siclk_wmr),
	.se	(scan_en_wmr),
	.din	(wsr_data_w[47:3]),
	.dout	(watchpoint3[47:3]),
	.clk	(l2clk),
	.en	(dcc_wr_wtchpt[3]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_dcs_dp_msff_macro__left_18__stack_64c__width_45 dff_watchpoint_4    (	// FS:wmr_protect
	.scan_in(dff_watchpoint_4_wmr_scanin),
	.scan_out(dff_watchpoint_4_wmr_scanout),
	.siclk(siclk_wmr),
	.se	(scan_en_wmr),
	.din	(wsr_data_w[47:3]),
	.dout	(watchpoint4[47:3]),
	.clk	(l2clk),
	.en	(dcc_wr_wtchpt[4]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_dcs_dp_msff_macro__left_18__stack_64c__width_45 dff_watchpoint_5    (	// FS:wmr_protect
	.scan_in(dff_watchpoint_5_wmr_scanin),
	.scan_out(dff_watchpoint_5_wmr_scanout),
	.siclk(siclk_wmr),
	.se	(scan_en_wmr),
	.din	(wsr_data_w[47:3]),
	.dout	(watchpoint5[47:3]),
	.clk	(l2clk),
	.en	(dcc_wr_wtchpt[5]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_dcs_dp_msff_macro__left_18__stack_64c__width_45 dff_watchpoint_6    (	// FS:wmr_protect
	.scan_in(dff_watchpoint_6_wmr_scanin),
	.scan_out(dff_watchpoint_6_wmr_scanout),
	.siclk(siclk_wmr),
	.se	(scan_en_wmr),
	.din	(wsr_data_w[47:3]),
	.dout	(watchpoint6[47:3]),
	.clk	(l2clk),
	.en	(dcc_wr_wtchpt[6]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_dcs_dp_msff_macro__left_18__stack_64c__width_45 dff_watchpoint_7    (	// FS:wmr_protect
	.scan_in(dff_watchpoint_7_wmr_scanin),
	.scan_out(dff_watchpoint_7_wmr_scanout),
	.siclk(siclk_wmr),
	.se	(scan_en_wmr),
	.din	(wsr_data_w[47:3]),
	.dout	(watchpoint7[47:3]),
	.clk	(l2clk),
	.en	(dcc_wr_wtchpt[7]),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

lsu_dcs_dp_mux_macro__left_18__mux_aodec__ports_8__stack_64c__width_45 mx_watchpoint       (
	.din0	(watchpoint0[47:3]),
	.din1	(watchpoint1[47:3]),
	.din2	(watchpoint2[47:3]),
	.din3	(watchpoint3[47:3]),
	.din4	(watchpoint4[47:3]),
	.din5	(watchpoint5[47:3]),
	.din6	(watchpoint6[47:3]),
	.din7	(watchpoint7[47:3]),
	.sel	(dcc_tid_m[2:0]),
	.dout	(watchpoint_mx_m[47:3])
);

lsu_dcs_dp_buff_macro__left_18__stack_64c__width_45 buf_watchpoint    (
	.din	(watchpoint_mx_m[47:3]),
	.dout	(watchpoint_m[47:3])
);
assign dcs_watchpoint_m[47:3] = watchpoint_m[47:3];

////////////////////////////////////////////////////////////////////////////////
// ASI_LSU_CTL_REG

lsu_dcs_dp_and_macro__ports_2__stack_18r__width_17 clr_ctl_0    (
	.din0	({wsr_data_w[34:23],wsr_data_w[4:0]}),
	.din1	({17{tlu_lsu_clear_ctl_reg_[0]}}),
	.dout	(ctl_reg0_in[16:0])
);
lsu_dcs_dp_and_macro__ports_2__stack_18r__width_17 clr_ctl_1    (
	.din0	({wsr_data_w[34:23],wsr_data_w[4:0]}),
	.din1	({17{tlu_lsu_clear_ctl_reg_[1]}}),
	.dout	(ctl_reg1_in[16:0])
);
lsu_dcs_dp_and_macro__ports_2__stack_18r__width_17 clr_ctl_2    (
	.din0	({wsr_data_w[34:23],wsr_data_w[4:0]}),
	.din1	({17{tlu_lsu_clear_ctl_reg_[2]}}),
	.dout	(ctl_reg2_in[16:0])
);
lsu_dcs_dp_and_macro__ports_2__stack_18r__width_17 clr_ctl_3    (
	.din0	({wsr_data_w[34:23],wsr_data_w[4:0]}),
	.din1	({17{tlu_lsu_clear_ctl_reg_[3]}}),
	.dout	(ctl_reg3_in[16:0])
);
lsu_dcs_dp_and_macro__ports_2__stack_18r__width_17 clr_ctl_4    (
	.din0	({wsr_data_w[34:23],wsr_data_w[4:0]}),
	.din1	({17{tlu_lsu_clear_ctl_reg_[4]}}),
	.dout	(ctl_reg4_in[16:0])
);
lsu_dcs_dp_and_macro__ports_2__stack_18r__width_17 clr_ctl_5    (
	.din0	({wsr_data_w[34:23],wsr_data_w[4:0]}),
	.din1	({17{tlu_lsu_clear_ctl_reg_[5]}}),
	.dout	(ctl_reg5_in[16:0])
);
lsu_dcs_dp_and_macro__ports_2__stack_18r__width_17 clr_ctl_6    (
	.din0	({wsr_data_w[34:23],wsr_data_w[4:0]}),
	.din1	({17{tlu_lsu_clear_ctl_reg_[6]}}),
	.dout	(ctl_reg6_in[16:0])
);
lsu_dcs_dp_and_macro__ports_2__stack_18r__width_17 clr_ctl_7    (
	.din0	({wsr_data_w[34:23],wsr_data_w[4:0]}),
	.din1	({17{tlu_lsu_clear_ctl_reg_[7]}}),
	.dout	(ctl_reg7_in[16:0])
);

lsu_dcs_dp_msff_macro__stack_18r__width_17 dff_lsu_ctl_0   (
	.scan_in(dff_lsu_ctl_0_scanin),
	.scan_out(dff_lsu_ctl_0_scanout),
	.din	(ctl_reg0_in[16:0]),
	.dout	({wpt_mode_0[1:0],wpt_mask_0[7:0],wpt_enable_0[1:0],spec_enable[0],
		  dmmu_enable[0],immu_enable[0],dc_enable[0],ic_enable[0]}),
	.clk	(l2clk),
	.en	(dcc_wr_lsu_ctl_reg[0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_dcs_dp_msff_macro__stack_18r__width_17 dff_lsu_ctl_1   (
	.scan_in(dff_lsu_ctl_1_scanin),
	.scan_out(dff_lsu_ctl_1_scanout),
	.din	(ctl_reg1_in[16:0]),
	.dout	({wpt_mode_1[1:0],wpt_mask_1[7:0],wpt_enable_1[1:0],spec_enable[1],
		  dmmu_enable[1],immu_enable[1],dc_enable[1],ic_enable[1]}),
	.clk	(l2clk),
	.en	(dcc_wr_lsu_ctl_reg[1]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_dcs_dp_msff_macro__stack_18r__width_17 dff_lsu_ctl_2   (
	.scan_in(dff_lsu_ctl_2_scanin),
	.scan_out(dff_lsu_ctl_2_scanout),
	.din	(ctl_reg2_in[16:0]),
	.dout	({wpt_mode_2[1:0],wpt_mask_2[7:0],wpt_enable_2[1:0],spec_enable[2],
		  dmmu_enable[2],immu_enable[2],dc_enable[2],ic_enable[2]}),
	.clk	(l2clk),
	.en	(dcc_wr_lsu_ctl_reg[2]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_dcs_dp_msff_macro__stack_18r__width_17 dff_lsu_ctl_3   (
	.scan_in(dff_lsu_ctl_3_scanin),
	.scan_out(dff_lsu_ctl_3_scanout),
	.din	(ctl_reg3_in[16:0]),
	.dout	({wpt_mode_3[1:0],wpt_mask_3[7:0],wpt_enable_3[1:0],spec_enable[3],
		  dmmu_enable[3],immu_enable[3],dc_enable[3],ic_enable[3]}),
	.clk	(l2clk),
	.en	(dcc_wr_lsu_ctl_reg[3]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_dcs_dp_msff_macro__stack_18r__width_17 dff_lsu_ctl_4   (
	.scan_in(dff_lsu_ctl_4_scanin),
	.scan_out(dff_lsu_ctl_4_scanout),
	.din	(ctl_reg4_in[16:0]),
	.dout	({wpt_mode_4[1:0],wpt_mask_4[7:0],wpt_enable_4[1:0],spec_enable[4],
		  dmmu_enable[4],immu_enable[4],dc_enable[4],ic_enable[4]}),
	.clk	(l2clk),
	.en	(dcc_wr_lsu_ctl_reg[4]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_dcs_dp_msff_macro__stack_18r__width_17 dff_lsu_ctl_5   (
	.scan_in(dff_lsu_ctl_5_scanin),
	.scan_out(dff_lsu_ctl_5_scanout),
	.din	(ctl_reg5_in[16:0]),
	.dout	({wpt_mode_5[1:0],wpt_mask_5[7:0],wpt_enable_5[1:0],spec_enable[5],
		  dmmu_enable[5],immu_enable[5],dc_enable[5],ic_enable[5]}),
	.clk	(l2clk),
	.en	(dcc_wr_lsu_ctl_reg[5]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_dcs_dp_msff_macro__stack_18r__width_17 dff_lsu_ctl_6   (
	.scan_in(dff_lsu_ctl_6_scanin),
	.scan_out(dff_lsu_ctl_6_scanout),
	.din	(ctl_reg6_in[16:0]),
	.dout	({wpt_mode_6[1:0],wpt_mask_6[7:0],wpt_enable_6[1:0],spec_enable[6],
		  dmmu_enable[6],immu_enable[6],dc_enable[6],ic_enable[6]}),
	.clk	(l2clk),
	.en	(dcc_wr_lsu_ctl_reg[6]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_dcs_dp_msff_macro__stack_18r__width_17 dff_lsu_ctl_7   (
	.scan_in(dff_lsu_ctl_7_scanin),
	.scan_out(dff_lsu_ctl_7_scanout),
	.din	(ctl_reg7_in[16:0]),
	.dout	({wpt_mode_7[1:0],wpt_mask_7[7:0],wpt_enable_7[1:0],spec_enable[7],
		  dmmu_enable[7],immu_enable[7],dc_enable[7],ic_enable[7]}),
	.clk	(l2clk),
	.en	(dcc_wr_lsu_ctl_reg[7]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

lsu_dcs_dp_buff_macro__stack_4l__width_3 buf_lsu_ctl_0   (
	.din	({immu_enable[0], dc_enable[0],    ic_enable[0]}),
	.dout	({lsu_immu_enable[0], dcs_dc_enable[0],lsu_ic_enable[0]})
);
lsu_dcs_dp_buff_macro__stack_4l__width_3 buf_lsu_ctl_1   (
	.din	({immu_enable[1], dc_enable[1],    ic_enable[1]}),
	.dout	({lsu_immu_enable[1], dcs_dc_enable[1],lsu_ic_enable[1]})
);
lsu_dcs_dp_buff_macro__stack_4l__width_3 buf_lsu_ctl_2   (
	.din	({immu_enable[2], dc_enable[2],    ic_enable[2]}),
	.dout	({lsu_immu_enable[2], dcs_dc_enable[2],lsu_ic_enable[2]})
);
lsu_dcs_dp_buff_macro__stack_4l__width_3 buf_lsu_ctl_3   (
	.din	({immu_enable[3], dc_enable[3],    ic_enable[3]}),
	.dout	({lsu_immu_enable[3], dcs_dc_enable[3],lsu_ic_enable[3]})
);
lsu_dcs_dp_buff_macro__stack_4l__width_3 buf_lsu_ctl_4   (
	.din	({immu_enable[4], dc_enable[4],    ic_enable[4]}),
	.dout	({lsu_immu_enable[4], dcs_dc_enable[4],lsu_ic_enable[4]})
);
lsu_dcs_dp_buff_macro__stack_4l__width_3 buf_lsu_ctl_5   (
	.din	({immu_enable[5], dc_enable[5],    ic_enable[5]}),
	.dout	({lsu_immu_enable[5], dcs_dc_enable[5],lsu_ic_enable[5]})
);
lsu_dcs_dp_buff_macro__stack_4l__width_3 buf_lsu_ctl_6   (
	.din	({immu_enable[6], dc_enable[6],    ic_enable[6]}),
	.dout	({lsu_immu_enable[6], dcs_dc_enable[6],lsu_ic_enable[6]})
);
lsu_dcs_dp_buff_macro__stack_4l__width_3 buf_lsu_ctl_7   (
	.din	({immu_enable[7], dc_enable[7],    ic_enable[7]}),
	.dout	({lsu_immu_enable[7], dcs_dc_enable[7],lsu_ic_enable[7]})
);

lsu_dcs_dp_mux_macro__mux_aodec__ports_8__stack_18r__width_17 mx_lsu_ctl      (
	.din0	({wpt_mode_0[1:0],wpt_mask_0[7:0],wpt_enable_0[1:0],spec_enable[0],
		  dmmu_enable[0],immu_enable[0],dc_enable[0],ic_enable[0]}),
	.din1	({wpt_mode_1[1:0],wpt_mask_1[7:0],wpt_enable_1[1:0],spec_enable[1],
		  dmmu_enable[1],immu_enable[1],dc_enable[1],ic_enable[1]}),
	.din2	({wpt_mode_2[1:0],wpt_mask_2[7:0],wpt_enable_2[1:0],spec_enable[2],
		  dmmu_enable[2],immu_enable[2],dc_enable[2],ic_enable[2]}),
	.din3	({wpt_mode_3[1:0],wpt_mask_3[7:0],wpt_enable_3[1:0],spec_enable[3],
		  dmmu_enable[3],immu_enable[3],dc_enable[3],ic_enable[3]}),
	.din4	({wpt_mode_4[1:0],wpt_mask_4[7:0],wpt_enable_4[1:0],spec_enable[4],
		  dmmu_enable[4],immu_enable[4],dc_enable[4],ic_enable[4]}),
	.din5	({wpt_mode_5[1:0],wpt_mask_5[7:0],wpt_enable_5[1:0],spec_enable[5],
		  dmmu_enable[5],immu_enable[5],dc_enable[5],ic_enable[5]}),
	.din6	({wpt_mode_6[1:0],wpt_mask_6[7:0],wpt_enable_6[1:0],spec_enable[6],
		  dmmu_enable[6],immu_enable[6],dc_enable[6],ic_enable[6]}),
	.din7	({wpt_mode_7[1:0],wpt_mask_7[7:0],wpt_enable_7[1:0],spec_enable[7],
		  dmmu_enable[7],immu_enable[7],dc_enable[7],ic_enable[7]}),
	.sel	(dcc_tid_m[2:0]),
	.dout	(lsu_ctl_mx[16:0])
);
lsu_dcs_dp_buff_macro__stack_18r__width_17 buf_lsu_ctl   (
	.din	(lsu_ctl_mx[16:0]),
	.dout	({dcs_wpt_mode_m[1:0],dcs_wpt_mask_m[7:0],dcs_wpt_enable_m[1:0],lsu_ctl_reg_m[4:0]})
);

////////////////////////////////////////////////////////////////////////////////
// ASI_ERROR_INJECT

lsu_dcs_dp_msff_macro__stack_64c__width_32 dff_error_inject   (
	.scan_in(dff_error_inject_scanin),
	.scan_out(dff_error_inject_scanout),
	.din	({wsr_data_w[31],1'b0,wsr_data_w[29:19],1'b0,wsr_data_w[17],9'b0,wsr_data_w[7:0]}),
	.dout	(asi_error_inject[31:0]),
	.clk	(l2clk),
	.en	(dcc_wr_error_inj_w),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_dcs_dp_buff_macro__dbuff_16x__rep_1__stack_64c__width_32 buf_error_inject   (
	.din	(asi_error_inject[31:0]),
	.dout	(lsu_asi_error_inject[31:0])
);

////////////////////////////////////////////////////////////////////////////////
// ASI_SPARC_PWR_MGMT

lsu_dcs_dp_msff_macro__stack_16r__width_16 dff_pwr_mgmt   (
	.scan_in(dff_pwr_mgmt_scanin),
	.scan_out(dff_pwr_mgmt_scanout),
	.din	(wsr_data_w[15:0]),
	.dout	(asi_pwr_mgmt[15:0]),
	.clk	(l2clk),
	.en	(dcc_wr_pwr_mgmt),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_dcs_dp_buff_macro__dbuff_16x__rep_1__stack_16r__width_16 buf_pwr_mgmt   (
	.din	(asi_pwr_mgmt[15:0]),
	.dout	(lsu_asi_pwr_mgmt[15:0])
);

////////////////////////////////////////////////////////////////////////////////
// Flop VA from M->B
lsu_dcs_dp_msff_macro__stack_48c__width_37 dff_va_b   (
	.scan_in(dff_va_b_scanin),
	.scan_out(dff_va_b_scanout),
	.din	({tlu_asi_0[7:0],tlu_asi_1[7:0],lsu_va_m[20:0]}),
	.dout	({reload_asi_0[7:0],reload_asi_1[7:0],va_b[20:0]}),
	.clk	(l2clk),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_dcs_dp_buff_macro__stack_48c__width_21 buf_va_b   (
	.din	(va_b[20:0]),
	.dout	(lsu_va_b[20:0])
);

// fixscan start:
assign dff_in_data_scanin        = scan_in                  ;
assign dff_mx_ctxt_scanin        = dff_in_data_scanout      ;
assign dff_context_m_scanin      = dff_mx_ctxt_scanout      ;
assign dff_context_b_scanin      = dff_context_m_scanout    ;
assign dff_state_m_scanin        = dff_context_b_scanout    ;
assign dff_stg_b_scanin          = dff_state_m_scanout      ;
assign dff_asi_w_scanin          = dff_stg_b_scanout        ;
assign dff_lsu_ctl_0_scanin      = dff_asi_w_scanout        ;
assign dff_lsu_ctl_1_scanin      = dff_lsu_ctl_0_scanout    ;
assign dff_lsu_ctl_2_scanin      = dff_lsu_ctl_1_scanout    ;
assign dff_lsu_ctl_3_scanin      = dff_lsu_ctl_2_scanout    ;
assign dff_lsu_ctl_4_scanin      = dff_lsu_ctl_3_scanout    ;
assign dff_lsu_ctl_5_scanin      = dff_lsu_ctl_4_scanout    ;
assign dff_lsu_ctl_6_scanin      = dff_lsu_ctl_5_scanout    ;
assign dff_lsu_ctl_7_scanin      = dff_lsu_ctl_6_scanout    ;
assign dff_error_inject_scanin   = dff_lsu_ctl_7_scanout    ;
assign dff_pwr_mgmt_scanin       = dff_error_inject_scanout ;
assign dff_va_b_scanin           = dff_pwr_mgmt_scanout     ;
assign scan_out                  = dff_va_b_scanout         ;

assign dff_state0_wmr_scanin     = wmr_scan_in              ;
assign dff_state1_wmr_scanin     = dff_state0_wmr_scanout   ;
assign dff_state2_wmr_scanin     = dff_state1_wmr_scanout   ;
assign dff_state3_wmr_scanin     = dff_state2_wmr_scanout   ;
assign dff_state4_wmr_scanin     = dff_state3_wmr_scanout   ;
assign dff_state5_wmr_scanin     = dff_state4_wmr_scanout   ;
assign dff_state6_wmr_scanin     = dff_state5_wmr_scanout   ;
assign dff_state7_wmr_scanin     = dff_state6_wmr_scanout   ;
assign dff_watchpoint_0_wmr_scanin = dff_state7_wmr_scanout   ;
assign dff_watchpoint_1_wmr_scanin = dff_watchpoint_0_wmr_scanout;
assign dff_watchpoint_2_wmr_scanin = dff_watchpoint_1_wmr_scanout;
assign dff_watchpoint_3_wmr_scanin = dff_watchpoint_2_wmr_scanout;
assign dff_watchpoint_4_wmr_scanin = dff_watchpoint_3_wmr_scanout;
assign dff_watchpoint_5_wmr_scanin = dff_watchpoint_4_wmr_scanout;
assign dff_watchpoint_6_wmr_scanin = dff_watchpoint_5_wmr_scanout;
assign dff_watchpoint_7_wmr_scanin = dff_watchpoint_6_wmr_scanout;
assign wmr_scan_out              = dff_watchpoint_7_wmr_scanout;
// fixscan end:
endmodule



//
//   buff macro
//
//





module lsu_dcs_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_6 (
  din, 
  dout);
  input [5:0] din;
  output [5:0] dout;






buff #(6)  d0_0 (
.in(din[5:0]),
.out(dout[5:0])
);








endmodule









// any PARAMS parms go into naming of macro

module lsu_dcs_dp_msff_macro__left_16__stack_64c__width_48 (
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









//
//   buff macro
//
//





module lsu_dcs_dp_buff_macro__dbuff_16x__rep_1__width_13 (
  din, 
  dout);
  input [12:0] din;
  output [12:0] dout;






buff #(13)  d0_0 (
.in(din[12:0]),
.out(dout[12:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_dcs_dp_mux_macro__mux_aope__ports_3__stack_8r__width_8 (
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
//   invert macro
//
//





module lsu_dcs_dp_inv_macro__width_10 (
  din, 
  dout);
  input [9:0] din;
  output [9:0] dout;






inv #(10)  d0_0 (
.in(din[9:0]),
.out(dout[9:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_13 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [12:0] din0;
  input sel0;
  input [12:0] din1;
  input sel1;
  output [12:0] dout;





mux2s #(13)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[12:0]),
  .in1(din1[12:0]),
.dout(dout[12:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_dcs_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_3 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [2:0] din0;
  input sel0;
  input [2:0] din1;
  input sel1;
  output [2:0] dout;





mux2s #(3)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[2:0]),
  .in1(din1[2:0]),
.dout(dout[2:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module lsu_dcs_dp_msff_macro__left_1__stack_64c__width_63 (
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
wire [61:0] so;

  input [62:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [62:0] dout;


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
dff #(63)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[62:0]),
.si({scan_in,so[61:0]}),
.so({so[61:0],scan_out}),
.q(dout[62:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_dcs_dp_mux_macro__mux_aodec__ports_4__stack_64c__width_55 (
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

  input [54:0] din0;
  input [54:0] din1;
  input [54:0] din2;
  input [54:0] din3;
  input [1:0] sel;
  output [54:0] dout;





cl_dp1_pdec4_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(55)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[54:0]),
  .in1(din1[54:0]),
  .in2(din2[54:0]),
  .in3(din3[54:0]),
.dout(dout[54:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_dcs_dp_mux_macro__mux_aodec__ports_4__stack_10r__width_9 (
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

  input [8:0] din0;
  input [8:0] din1;
  input [8:0] din2;
  input [8:0] din3;
  input [1:0] sel;
  output [8:0] dout;





cl_dp1_pdec4_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(9)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[8:0]),
  .in1(din1[8:0]),
  .in2(din2[8:0]),
  .in3(din3[8:0]),
.dout(dout[8:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module lsu_dcs_dp_msff_macro__mux_aope__ports_2__stack_64c__width_55 (
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
wire [54:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [53:0] so;

  input [54:0] din0;
  input [54:0] din1;
  input sel0;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [54:0] dout;


  output scan_out;




cl_dp1_penc2_8x  c1_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(55)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[54:0]),
  .in1(din1[54:0]),
.dout(muxout[54:0])
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
dff #(55)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[54:0]),
.si({scan_in,so[53:0]}),
.so({so[53:0],scan_out}),
.q(dout[54:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_dcs_dp_mux_macro__mux_pgpe__ports_2__stack_10r__width_9 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [8:0] din0;
  input [8:0] din1;
  input sel0;
  output [8:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(9)  d0_0 (
  .sel(psel1),
  .in0(din0[8:0]),
  .in1(din1[8:0]),
.dout(dout[8:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_dcs_dp_mux_macro__mux_aonpe__ports_2__stack_14l__width_13 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [12:0] din0;
  input sel0;
  input [12:0] din1;
  input sel1;
  output [12:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(13)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[12:0]),
  .in1(din1[12:0]),
.dout(dout[12:0])
);









  



endmodule


//
//   buff macro
//
//





module lsu_dcs_dp_buff_macro__dbuff_16x__rep_1__stack_14r__width_13 (
  din, 
  dout);
  input [12:0] din;
  output [12:0] dout;






buff #(13)  d0_0 (
.in(din[12:0]),
.out(dout[12:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_dcs_dp_mux_macro__mux_aonpe__ports_2__stack_14r__width_13 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [12:0] din0;
  input sel0;
  input [12:0] din1;
  input sel1;
  output [12:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(13)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[12:0]),
  .in1(din1[12:0]),
.dout(dout[12:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module lsu_dcs_dp_msff_macro__stack_14r__width_14 (
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













// any PARAMS parms go into naming of macro

module lsu_dcs_dp_msff_macro__stack_30r__width_30 (
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
wire [28:0] so;

  input [29:0] din;


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
.d(din[29:0]),
.si({scan_in,so[28:0]}),
.so({so[28:0],scan_out}),
.q(dout[29:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module lsu_dcs_dp_msff_macro__stack_64c__width_55 (
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
wire [53:0] so;

  input [54:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [54:0] dout;


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
dff #(55)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[54:0]),
.si({scan_in,so[53:0]}),
.so({so[53:0],scan_out}),
.q(dout[54:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_dcs_dp_mux_macro__mux_aonpe__ports_5__stack_14l__width_13 (
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
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;

  input [12:0] din0;
  input sel0;
  input [12:0] din1;
  input sel1;
  input [12:0] din2;
  input sel2;
  input [12:0] din3;
  input sel3;
  input [12:0] din4;
  input sel4;
  output [12:0] dout;





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
mux5s #(13)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .in0(din0[12:0]),
  .in1(din1[12:0]),
  .in2(din2[12:0]),
  .in3(din3[12:0]),
  .in4(din4[12:0]),
.dout(dout[12:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module lsu_dcs_dp_msff_macro__left_17__mux_aope__ports_2__stack_64c__width_47 (
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
wire [46:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [45:0] so;

  input [46:0] din0;
  input [46:0] din1;
  input sel0;


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




cl_dp1_penc2_8x  c1_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(47)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[46:0]),
  .in1(din1[46:0]),
.dout(muxout[46:0])
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
dff #(47)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[46:0]),
.si({scan_in,so[45:0]}),
.so({so[45:0],scan_out}),
.q(dout[46:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_dcs_dp_mux_macro__mux_aope__ports_8__stack_64c__width_64 (
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
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input sel5;
  input sel6;
  output [63:0] dout;





cl_dp1_penc8_8x  c0_0 (
  .test(1'b1),
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






// any PARAMS parms go into naming of macro

module lsu_dcs_dp_msff_macro__mux_aope__ports_3__stack_64c__width_64 (
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

module lsu_dcs_dp_msff_macro__left_18__stack_64c__width_45 (
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
wire [43:0] so;

  input [44:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [44:0] dout;


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
dff #(45)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[44:0]),
.si({scan_in,so[43:0]}),
.so({so[43:0],scan_out}),
.q(dout[44:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_dcs_dp_mux_macro__left_18__mux_aodec__ports_8__stack_64c__width_45 (
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

  input [44:0] din0;
  input [44:0] din1;
  input [44:0] din2;
  input [44:0] din3;
  input [44:0] din4;
  input [44:0] din5;
  input [44:0] din6;
  input [44:0] din7;
  input [2:0] sel;
  output [44:0] dout;





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

mux8s #(45)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[44:0]),
  .in1(din1[44:0]),
  .in2(din2[44:0]),
  .in3(din3[44:0]),
  .in4(din4[44:0]),
  .in5(din5[44:0]),
  .in6(din6[44:0]),
  .in7(din7[44:0]),
.dout(dout[44:0])
);









  



endmodule


//
//   buff macro
//
//





module lsu_dcs_dp_buff_macro__left_18__stack_64c__width_45 (
  din, 
  dout);
  input [44:0] din;
  output [44:0] dout;






buff #(45)  d0_0 (
.in(din[44:0]),
.out(dout[44:0])
);








endmodule





//  
//   and macro for ports = 2,3,4
//
//





module lsu_dcs_dp_and_macro__ports_2__stack_18r__width_17 (
  din0, 
  din1, 
  dout);
  input [16:0] din0;
  input [16:0] din1;
  output [16:0] dout;






and2 #(17)  d0_0 (
.in0(din0[16:0]),
.in1(din1[16:0]),
.out(dout[16:0])
);









endmodule









// any PARAMS parms go into naming of macro

module lsu_dcs_dp_msff_macro__stack_18r__width_17 (
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
wire [15:0] so;

  input [16:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [16:0] dout;


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
dff #(17)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[16:0]),
.si({scan_in,so[15:0]}),
.so({so[15:0],scan_out}),
.q(dout[16:0])
);




















endmodule









//
//   buff macro
//
//





module lsu_dcs_dp_buff_macro__stack_4l__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






buff #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_dcs_dp_mux_macro__mux_aodec__ports_8__stack_18r__width_17 (
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

  input [16:0] din0;
  input [16:0] din1;
  input [16:0] din2;
  input [16:0] din3;
  input [16:0] din4;
  input [16:0] din5;
  input [16:0] din6;
  input [16:0] din7;
  input [2:0] sel;
  output [16:0] dout;





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

mux8s #(17)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[16:0]),
  .in1(din1[16:0]),
  .in2(din2[16:0]),
  .in3(din3[16:0]),
  .in4(din4[16:0]),
  .in5(din5[16:0]),
  .in6(din6[16:0]),
  .in7(din7[16:0]),
.dout(dout[16:0])
);









  



endmodule


//
//   buff macro
//
//





module lsu_dcs_dp_buff_macro__stack_18r__width_17 (
  din, 
  dout);
  input [16:0] din;
  output [16:0] dout;






buff #(17)  d0_0 (
.in(din[16:0]),
.out(dout[16:0])
);








endmodule









// any PARAMS parms go into naming of macro

module lsu_dcs_dp_msff_macro__stack_64c__width_32 (
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









//
//   buff macro
//
//





module lsu_dcs_dp_buff_macro__dbuff_16x__rep_1__stack_64c__width_32 (
  din, 
  dout);
  input [31:0] din;
  output [31:0] dout;






buff #(32)  d0_0 (
.in(din[31:0]),
.out(dout[31:0])
);








endmodule









// any PARAMS parms go into naming of macro

module lsu_dcs_dp_msff_macro__stack_16r__width_16 (
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
//   buff macro
//
//





module lsu_dcs_dp_buff_macro__dbuff_16x__rep_1__stack_16r__width_16 (
  din, 
  dout);
  input [15:0] din;
  output [15:0] dout;






buff #(16)  d0_0 (
.in(din[15:0]),
.out(dout[15:0])
);








endmodule









// any PARAMS parms go into naming of macro

module lsu_dcs_dp_msff_macro__stack_48c__width_37 (
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









//
//   buff macro
//
//





module lsu_dcs_dp_buff_macro__stack_48c__width_21 (
  din, 
  dout);
  input [20:0] din;
  output [20:0] dout;






buff #(21)  d0_0 (
.in(din[20:0]),
.out(dout[20:0])
);








endmodule




