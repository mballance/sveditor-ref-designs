// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_tsd_dp.v
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
module tlu_tsd_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  tcu_dectest, 
  tcu_muxtest, 
  tcu_scan_en_wmr, 
  spc_aclk_wmr, 
  wmr_scan_in, 
  trl_shscanid, 
  exu_ccr0, 
  exu_ccr1, 
  exu_ccr2, 
  exu_ccr3, 
  fls_cwp0, 
  fls_cwp1, 
  fls_cwp2, 
  fls_cwp3, 
  pct_tsa_pc, 
  pct_tsa_pc_oor_va, 
  pct_tsa_npc, 
  pct_tsa_npc_oor_va, 
  pct_tsa_npc_nonseq, 
  trl_tsa_gl, 
  trl_tsa_trap_type, 
  trl_asireg_sel, 
  trl_asireg_en, 
  trl_thread_sel, 
  trl_tba_sel, 
  trl_pstate_thread_sel, 
  trl_don_ret_pstate_sel, 
  trl_pstate_en, 
  trl_reset_trap, 
  trl_stay_in_priv, 
  trl_other_trap, 
  trl_tl_gt_0, 
  trl_tsd_tsa_en, 
  trl_tsd_tsa_wd_en, 
  trl_save_tsa, 
  trl_capture_ss, 
  trl_rmw_tsa, 
  tsa_tpc, 
  tsa_tpc_oor_va, 
  tsa_tnpc, 
  tsa_tnpc_oor_va, 
  tsa_tnpc_nonseq, 
  tsa_gl, 
  tsa_rd_data, 
  tsa_trap_type, 
  asi_wr_mondo_head, 
  asi_wr_mondo_tail, 
  asi_wr_device_head, 
  asi_wr_device_tail, 
  asi_wr_res_err_head, 
  asi_wr_res_err_tail, 
  asi_wr_nonres_err_head, 
  asi_wr_nonres_err_tail, 
  asi_rd_iqr_reg, 
  asi_rd_iqr, 
  asi_rd_tpc, 
  asi_wr_tpc, 
  asi_rd_tnpc, 
  asi_wr_tnpc, 
  asi_rd_tstate, 
  asi_wr_tstate, 
  asi_rd_tt, 
  asi_wr_tt, 
  asi_rd_htstate, 
  asi_wr_htstate, 
  asi_wr_tba, 
  asi_wr_pstate, 
  asi_wr_hpstate, 
  asi_wr_htba, 
  asi_rd_asireg, 
  asi_wr_asireg, 
  asi_rd_h_pstate_tba, 
  asi_rd_tba_htba, 
  asi_rd_pstate_hpstate, 
  asi_wr_data_47_14, 
  asi_wr_data_07_00, 
  asi_tsd_wr_data_12, 
  asi_tsd_wr_data_10_08, 
  asi_tsd_wr_data_05_00, 
  asi_tsa_wr_data, 
  asi_tsa_wr_data_npc_oor_va, 
  asi_tsa_wr_data_npc_nonseq, 
  asi_mbist_ecc_in, 
  asi_mbist_run, 
  asi_mbist_cmpsel, 
  tel_ecc, 
  scan_out, 
  wmr_scan_out, 
  tsd_tba, 
  tsd_wr_tpc, 
  tsd_wr_tpc_oor_va, 
  tsd_wr_tnpc, 
  tsd_wr_tnpc_oor_va, 
  tsd_wr_tnpc_nonseq, 
  tsd_wr_gl, 
  tsd_wr_data, 
  tsd_wr_trap_type, 
  tsd_tpc, 
  tsd_tpc_oor_va, 
  tsd_tnpc, 
  tsd_tnpc_oor_va, 
  tsd_tnpc_nonseq, 
  tsd_mrqr_exc_, 
  tsd_dqr_exc_, 
  tsd_asi_data_, 
  tsd_asi_data, 
  tsd_ted_mra_rd_data, 
  tsd_hpstate_ibe, 
  tsd_hpstate_red, 
  tsd_hpstate_hpriv, 
  tsd_hpstate_tlz, 
  tsd_pstate_tct, 
  tsd_pstate_priv, 
  tsd_pstate_ie, 
  tsd_pstate_am, 
  tsd_htstate_hpriv, 
  tsd_shadow_pstate, 
  tsd_shadow_tpc, 
  tsd_shadow_tt, 
  tsd_mbist_data, 
  tsd_itlb_bypass, 
  tlu_itlb_bypass, 
  tlu_lsu_hpstate_hpriv, 
  tlu_lsu_pstate_priv, 
  tlu_ifu_hpstate_hpriv, 
  tlu_ifu_pstate_priv, 
  tlu_pmu_hpstate_hpriv, 
  tlu_pmu_pstate_priv, 
  tlu_dec_hpstate_hpriv, 
  tlu_dec_pstate_priv, 
  tlu_dec_pstate_pef, 
  tlu_pstate_cle, 
  tlu_pstate_am, 
  tlu_ccr, 
  tlu_asi, 
  tlu_cwp);
wire clk;
wire stop;
wire test;
wire pce_ov;
wire se;
wire siclk;
wire soclk;
wire [47:0] wr_data;
wire asireg_lat_wmr_scanin;
wire asireg_lat_wmr_scanout;
wire [7:0] asimux3;
wire [7:0] asimux2;
wire [7:0] asimux1;
wire [7:0] asimux0;
wire [7:0] asi3;
wire [7:0] asi2;
wire [7:0] asi1;
wire [7:0] asi0;
wire htba3_lat_wmr_scanin;
wire htba3_lat_wmr_scanout;
wire [47:14] htba3;
wire htba2_lat_wmr_scanin;
wire htba2_lat_wmr_scanout;
wire [47:14] htba2;
wire htba1_lat_wmr_scanin;
wire htba1_lat_wmr_scanout;
wire [47:14] htba1;
wire htba0_lat_wmr_scanin;
wire htba0_lat_wmr_scanout;
wire [47:14] htba0;
wire tba3_lat_wmr_scanin;
wire tba3_lat_wmr_scanout;
wire [47:15] tba3;
wire tba2_lat_wmr_scanin;
wire tba2_lat_wmr_scanout;
wire [47:15] tba2;
wire tba1_lat_wmr_scanin;
wire tba1_lat_wmr_scanout;
wire [47:15] tba1;
wire tba0_lat_wmr_scanin;
wire tba0_lat_wmr_scanout;
wire [47:15] tba0;
wire pstate_lat_scanin;
wire pstate_lat_scanout;
wire [10:0] wdr_pstate3;
wire [10:0] wdr_pstate2;
wire [10:0] wdr_pstate1;
wire [10:0] new_pstate0;
wire [10:0] new_pstate1;
wire [10:0] wdr_pstate0;
wire [10:0] new_pstate2;
wire [10:0] new_pstate3;
wire [10:0] pstate3_reg;
wire [10:0] pstate2_reg;
wire [10:0] pstate1_reg;
wire [10:0] pstate0_reg;
wire [10:0] shadow_pstate;
wire [12:0] arch_pstate3;
wire [12:0] arch_pstate2;
wire [12:0] arch_pstate1;
wire [12:0] arch_pstate0;
wire [12:0] arch_hpstate3;
wire [12:0] arch_hpstate2;
wire [12:0] arch_hpstate1;
wire [12:0] arch_hpstate0;
wire [12:0] asi_tsd_wr_data_crit;
wire [3:0] wr_pstate;
wire [10:0] asi_pstate3;
wire [10:0] asi_pstate2;
wire [10:0] asi_pstate1;
wire [10:0] asi_pstate0;
wire [3:0] wr_hpstate;
wire [10:0] asi_hpstate3;
wire [10:0] asi_hpstate2;
wire [10:0] asi_hpstate1;
wire [10:0] asi_hpstate0;
wire [10:0] don_ret_pstate;
wire read_tpc_lat_scanin;
wire read_tpc_lat_scanout;
wire [47:2] tpc_mod_crit;
wire tpc_oor_va_mod_crit;
wire [47:2] tpc_mod;
wire tpc_oor_va_mod;
wire read_tnpc_lat_scanin;
wire read_tnpc_lat_scanout;
wire [47:2] tnpc_mod_crit;
wire tnpc_oor_va_mod_crit;
wire tnpc_nonseq_mod_crit;
wire [47:2] tnpc_mod;
wire tnpc_oor_va_mod;
wire tnpc_nonseq_mod;
wire read_tstate_lat_scanin;
wire read_tstate_lat_scanout;
wire [1:0] gl_mod_crit;
wire [29:0] tstate_mod_crit;
wire [8:0] trap_type_mod_crit;
wire [1:0] gl_mod;
wire [29:0] tstate_mod;
wire [8:0] trap_type_mod;
wire wr_tpc_lat_scanin;
wire wr_tpc_lat_scanout;
wire shadow_tpc_lat_scanin;
wire shadow_tpc_lat_scanout;
wire wr_tnpc_lat_scanin;
wire wr_tnpc_lat_scanout;
wire wr_tstate_lat_scanin;
wire wr_tstate_lat_scanout;
wire [29:0] tsa_wr_data;
wire shadow_tt_lat_scanin;
wire shadow_tt_lat_scanout;
wire rd_ctl_lat_scanin;
wire rd_ctl_lat_scanout;
wire [2:0] rd_iqr;
wire [2:0] rd_h_pstate_tba;
wire [3:0] rd_asireg;
wire rd_tba_htba;
wire rd_pstate_hpstate;
wire rd_tpc;
wire rd_tnpc;
wire rd_tstate;
wire rd_tt;
wire rd_htstate;
wire rd_iqr_reg;
wire [47:0] asi_h_pstate;
wire [47:0] asi_h_tba;
wire [47:0] asi_data;
wire [17:6] iqr_ungated;
wire [17:6] iqr_reg;
wire [10:0] pstate_mod;
wire [47:0] tsa_asi_data;
wire [47:0] asi_data_;
wire cmpsel_lat_scanin;
wire cmpsel_lat_scanout;
wire [3:0] cmpsel;
wire tcu_muxtest_rep0;


input		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;
input		tcu_dectest;
input		tcu_muxtest;

input		tcu_scan_en_wmr;
input 		spc_aclk_wmr;		// Warm reset (non)scan
input		wmr_scan_in;

input	[1:0]	trl_shscanid;		// Select which thread to shadow

input	[7:0]	exu_ccr0;
input	[7:0]	exu_ccr1;
input	[7:0]	exu_ccr2;
input	[7:0]	exu_ccr3;

input	[2:0]	fls_cwp0;
input	[2:0]	fls_cwp1;
input	[2:0]	fls_cwp2;
input	[2:0]	fls_cwp3;

input	[47:2]	pct_tsa_pc;
input 		pct_tsa_pc_oor_va;
input	[47:2]	pct_tsa_npc;
input 		pct_tsa_npc_oor_va;
input 		pct_tsa_npc_nonseq;

input	[1:0]	trl_tsa_gl;
input	[8:0]	trl_tsa_trap_type;
input	[4:0]	trl_asireg_sel;		// Which asireg to update?
input		trl_asireg_en;		// Power management
input	[3:0]	trl_thread_sel;		// Which thread to redirect?
input	[2:0]	trl_tba_sel;		// Which thread & to HPRIV?
input	[4:0]	trl_pstate_thread_sel;	// Which thread to update pstate?
input	[3:0]	trl_don_ret_pstate_sel;	// Which thread takes done / retry?
input		trl_pstate_en;		// Power management
input		trl_reset_trap;
input		trl_stay_in_priv;
input		trl_other_trap;
input		trl_tl_gt_0;
input		trl_tsd_tsa_en;		// Power management
input		trl_tsd_tsa_wd_en;	// Power management
input		trl_save_tsa;
input		trl_capture_ss;		// Capture signal for TPC and TT
input		trl_rmw_tsa;		

input	[47:2]	tsa_tpc;
input		tsa_tpc_oor_va;
input	[47:2]	tsa_tnpc;
input		tsa_tnpc_oor_va;
input 		tsa_tnpc_nonseq;
input	[1:0]	tsa_gl;
input	[29:0]	tsa_rd_data;
input	[8:0]	tsa_trap_type;

input		asi_wr_mondo_head;
input		asi_wr_mondo_tail;
input		asi_wr_device_head;
input		asi_wr_device_tail;
input		asi_wr_res_err_head;
input		asi_wr_res_err_tail;
input		asi_wr_nonres_err_head;
input		asi_wr_nonres_err_tail;
input		asi_rd_iqr_reg;		// Read any interrupt queue reg
input	[2:0]	asi_rd_iqr;		// encoded TID for IQR read
input		asi_rd_tpc;
input		asi_wr_tpc;
input		asi_rd_tnpc;
input		asi_wr_tnpc;
input		asi_rd_tstate;
input		asi_wr_tstate;
input		asi_rd_tt;
input		asi_wr_tt;
input		asi_rd_htstate;
input		asi_wr_htstate;
input	[3:0]	asi_wr_tba;
input 	[3:0]	asi_wr_pstate;
input 	[3:0]	asi_wr_hpstate;
input 	[3:0]	asi_wr_htba;
input	[3:0]	asi_rd_asireg;
input	[3:0]	asi_wr_asireg;
input 	[2:0]	asi_rd_h_pstate_tba;
input		asi_rd_tba_htba;
input		asi_rd_pstate_hpstate;
input 	[47:14]	asi_wr_data_47_14;
input 	[7:0]	asi_wr_data_07_00;
input 		asi_tsd_wr_data_12;
input 	[10:8]	asi_tsd_wr_data_10_08;
input 	[5:0]	asi_tsd_wr_data_05_00;
input 	[47:0]	asi_tsa_wr_data;
input 		asi_tsa_wr_data_npc_oor_va;
input 		asi_tsa_wr_data_npc_nonseq;
input	[7:0]	asi_mbist_ecc_in;	// MBIST write data (not really ECC)
input		asi_mbist_run;		// MBIST
input	[3:0]	asi_mbist_cmpsel;	// MBIST

input	[15:0]	tel_ecc;		// MBIST

output		scan_out;

output		wmr_scan_out;		// Warm reset (non)scan

output	[47:14]	tsd_tba;		// Trap Base Address
output	[47:2]	tsd_wr_tpc;
output 		tsd_wr_tpc_oor_va;
output	[47:2]	tsd_wr_tnpc;
output 		tsd_wr_tnpc_oor_va;
output 		tsd_wr_tnpc_nonseq;
output	[1:0]	tsd_wr_gl;
output	[29:0]	tsd_wr_data;
output	[8:0]	tsd_wr_trap_type;

output 	[47:2]	tsd_tpc;
output		tsd_tpc_oor_va;
output 	[47:2]	tsd_tnpc;
output		tsd_tnpc_oor_va;
output		tsd_tnpc_nonseq;

output 		tsd_mrqr_exc_;		// Mondo or Res Err Queue Register exc
output 		tsd_dqr_exc_;		// Device  Queue Register exception

output	[47:2]	tsd_asi_data_;
output	[1:0]	tsd_asi_data;

output	[135:0]	tsd_ted_mra_rd_data;

output 	[3:0]	tsd_hpstate_ibe;
output 	[3:0]	tsd_hpstate_red;
output 	[3:0]	tsd_hpstate_hpriv;
output 	[3:0]	tsd_hpstate_tlz;
output 	[3:0]	tsd_pstate_tct;
output 	[3:0]	tsd_pstate_priv;
output 	[3:0]	tsd_pstate_ie;
output 	[3:0]	tsd_pstate_am;
output		tsd_htstate_hpriv;	// For saturating GL restore

output	[10:0]	tsd_shadow_pstate;
output	[47:2] tsd_shadow_tpc;
output	[8:0] tsd_shadow_tt;

output	[31:0]	tsd_mbist_data;		// MBIST

output	[3:0]	tsd_itlb_bypass;

output	[3:0]	tlu_itlb_bypass;

output	[3:0] tlu_lsu_hpstate_hpriv;
output	[3:0]	tlu_lsu_pstate_priv;
output	[3:0] tlu_ifu_hpstate_hpriv;
output	[3:0] tlu_ifu_pstate_priv;
output	[3:0] tlu_pmu_hpstate_hpriv;
output	[3:0]	tlu_pmu_pstate_priv;
output	[3:0] tlu_dec_hpstate_hpriv;
output	[3:0]	tlu_dec_pstate_priv;
output	[3:0]	tlu_dec_pstate_pef;
output	[3:0]	tlu_pstate_cle;
output	[3:0]	tlu_pstate_am;

output	[7:0]	tlu_ccr;
output	[7:0]	tlu_asi;
output	[2:0]	tlu_cwp;





////////////////////////////////////////////////////////////////////////////////

assign clk      = l2clk;
assign stop	= 1'b0;
assign test     = tcu_dectest;

tlu_tsd_dp_buff_macro__width_4 clk_control_buf  (
	.din	({tcu_pce_ov		       ,
		  tcu_scan_en		       ,
		  spc_aclk		       ,
		  spc_bclk		       }),
	.dout	({pce_ov		       ,
		  se			       ,
		  siclk			       ,
		  soclk			       })
);




////////////////////////////////////////////////////////////////////////////////
// Buffer off noncritical writes
//

tlu_tsd_dp_buff_macro__width_34 wr_data_47_14_buf  (
	.din	(asi_wr_data_47_14	[47:14]	),
	.dout	(wr_data		[47:14]	)
);

tlu_tsd_dp_buff_macro__width_8 wr_data_07_00_buf  (
	.din	(asi_wr_data_07_00	[7:0]	),
	.dout	(wr_data		[7:0]	)
);



////////////////////////////////////////////////////////////////////////////////
// Shadow copy of ASI registers
//

tlu_tsd_dp_msff_macro__mux_aope__ports_5__stack_48c__width_32 asireg_lat     ( // FS:wmr_protect
	.scan_in(asireg_lat_wmr_scanin),
	.scan_out(asireg_lat_wmr_scanout),
	.se	(tcu_scan_en_wmr		),
	.siclk	(spc_aclk_wmr			),
	.din4	({asimux3		[7:0],
		  asimux2		[7:0],
		  asimux1		[7:0],
		  asimux0		[7:0]}),
	.din3	({wr_data		[7:0],
		  asimux2		[7:0],
		  asimux1		[7:0],
		  asimux0		[7:0]}),
	.din2	({asimux3		[7:0],
		  wr_data		[7:0],
		  asimux1		[7:0],
		  asimux0		[7:0]}),
	.din1	({asimux3		[7:0],
		  asimux2		[7:0],
		  wr_data		[7:0],
		  asimux0		[7:0]}),
	.din0	({asimux3		[7:0],
		  asimux2		[7:0],
		  asimux1		[7:0],
		  wr_data		[7:0]}),
	.sel3	(asi_wr_asireg		[3   ]	),
	.sel2	(asi_wr_asireg		[2   ]	),
	.sel1	(asi_wr_asireg		[1   ]	),
	.sel0	(asi_wr_asireg		[0   ]	),
	.en	(trl_asireg_en			),
	.dout	({asi3			[7:0],
		  asi2			[7:0],
		  asi1			[7:0],
		  asi0			[7:0]}),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tsd_dp_mux_macro__mux_aonpe__ports_5__stack_48c__width_32 asireg_mux    
(
	.din4	({asi3			[7:0],
		  asi2			[7:0],
		  asi1			[7:0],
		  asi0			[7:0]}),
	.din3	({tlu_asi		[7:0],
		  asi2			[7:0],
		  asi1			[7:0],
		  asi0			[7:0]}),
	.din2	({asi3			[7:0],
		  tlu_asi		[7:0],
		  asi1			[7:0],
		  asi0			[7:0]}),
	.din1	({asi3			[7:0],
		  asi2			[7:0],
		  tlu_asi		[7:0],
		  asi0			[7:0]}),
	.din0	({asi3			[7:0],
		  asi2			[7:0],
		  asi1			[7:0],
		  tlu_asi		[7:0]}),
	.sel4	(trl_asireg_sel		[4   ]	),
	.sel3	(trl_asireg_sel		[3   ]	),
	.sel2	(trl_asireg_sel		[2   ]	),
	.sel1	(trl_asireg_sel		[1   ]	),
	.sel0	(trl_asireg_sel		[0   ]	),
	.dout	({asimux3		[7:0],
		  asimux2		[7:0],
		  asimux1		[7:0],
		  asimux0		[7:0]})
);


////////////////////////////////////////////////////////////////////////////////
// Trap Base Addresses and Hyperprivileged TBAs

tlu_tsd_dp_msff_macro__left_14__stack_48c__width_34 htba3_lat    ( // FS:wmr_protect
	.scan_in(htba3_lat_wmr_scanin),
	.scan_out(htba3_lat_wmr_scanout),
	.se	(tcu_scan_en_wmr		),
	.siclk	(spc_aclk_wmr			),
	.en	(asi_wr_htba		[3]	),
	.din	(wr_data		[47:14]	),
	.dout	(htba3			[47:14]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tsd_dp_msff_macro__left_14__stack_48c__width_34 htba2_lat    ( // FS:wmr_protect
	.scan_in(htba2_lat_wmr_scanin),
	.scan_out(htba2_lat_wmr_scanout),
	.se	(tcu_scan_en_wmr		),
	.siclk	(spc_aclk_wmr			),
	.en	(asi_wr_htba		[2]	),
	.din	(wr_data		[47:14]	),
	.dout	(htba2			[47:14]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tsd_dp_msff_macro__left_14__stack_48c__width_34 htba1_lat    ( // FS:wmr_protect
	.scan_in(htba1_lat_wmr_scanin),
	.scan_out(htba1_lat_wmr_scanout),
	.se	(tcu_scan_en_wmr		),
	.siclk	(spc_aclk_wmr			),
	.en	(asi_wr_htba		[1]	),
	.din	(wr_data		[47:14]	),
	.dout	(htba1			[47:14]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tsd_dp_msff_macro__left_14__stack_48c__width_34 htba0_lat    ( // FS:wmr_protect
	.scan_in(htba0_lat_wmr_scanin),
	.scan_out(htba0_lat_wmr_scanout),
	.se	(tcu_scan_en_wmr		),
	.siclk	(spc_aclk_wmr			),
	.en	(asi_wr_htba		[0]	),
	.din	(wr_data		[47:14]	),
	.dout	(htba0			[47:14]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tsd_dp_msff_macro__left_15__stack_48c__width_33 tba3_lat    ( // FS:wmr_protect
	.scan_in(tba3_lat_wmr_scanin),
	.scan_out(tba3_lat_wmr_scanout),
	.se	(tcu_scan_en_wmr		),
	.siclk	(spc_aclk_wmr			),
	.en	(asi_wr_tba		[3]	),
	.din	(wr_data		[47:15]	),
	.dout	(tba3			[47:15]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tsd_dp_msff_macro__left_15__stack_48c__width_33 tba2_lat    ( // FS:wmr_protect
	.scan_in(tba2_lat_wmr_scanin),
	.scan_out(tba2_lat_wmr_scanout),
	.se	(tcu_scan_en_wmr		),
	.siclk	(spc_aclk_wmr			),
	.en	(asi_wr_tba		[2]	),
	.din	(wr_data		[47:15]	),
	.dout	(tba2			[47:15]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tsd_dp_msff_macro__left_15__stack_48c__width_33 tba1_lat    ( // FS:wmr_protect
	.scan_in(tba1_lat_wmr_scanin),
	.scan_out(tba1_lat_wmr_scanout),
	.se	(tcu_scan_en_wmr		),
	.siclk	(spc_aclk_wmr			),
	.en	(asi_wr_tba		[1]	),
	.din	(wr_data		[47:15]	),
	.dout	(tba1			[47:15]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tsd_dp_msff_macro__left_15__stack_48c__width_33 tba0_lat    ( // FS:wmr_protect
	.scan_in(tba0_lat_wmr_scanin),
	.scan_out(tba0_lat_wmr_scanout),
	.se	(tcu_scan_en_wmr		),
	.siclk	(spc_aclk_wmr			),
	.en	(asi_wr_tba		[0]	),
	.din	(wr_data		[47:15]	),
	.dout	(tba0			[47:15]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);



////////////////////////////////////////////////////////////////////////////////
// Mux the TBAs

tlu_tsd_dp_mux_macro__dmux_8x__left_14__mux_aodec__ports_8__stack_48c__width_34 tba_mux       (
	.din0	({tba0			[47:15],
		  trl_tl_gt_0		       }),
	.din1	({tba1			[47:15],
		  trl_tl_gt_0		       }),
	.din2	({tba2			[47:15],
		  trl_tl_gt_0		       }),
	.din3	({tba3			[47:15],
		  trl_tl_gt_0		       }),
	.din4	(htba0			[47:14]	),
	.din5	(htba1			[47:14]	),
	.din6	(htba2			[47:14]	),
	.din7	(htba3			[47:14]	),
	.sel	(trl_tba_sel		[2:0]	),
	.dout	(tsd_tba		[47:14] )
);



////////////////////////////////////////////////////////////////////////////////
// PSTATE & HPSTATE
//	Note that Niagara 1 did not implement MM (bits 7:6 of PSTATE)
//
//			  HP  HP   HP   HP
// Name                  IBE RED HPRIV TLZ  TCT CLE TLE PEF AM PRIV IE 
// Architected Position   10  5    2    0    12  9   8   4  3   2   1  
// Physical Position      10  5    6    0     7  9   8   4  3   2   1

tlu_tsd_dp_msff_macro__mux_aonpe__ports_5__stack_48c__width_44 pstate_lat     (
	.scan_in(pstate_lat_scanin),
	.scan_out(pstate_lat_scanout),
	.din0	({wdr_pstate3		[10:0],
		  wdr_pstate2		[10:0],
		  wdr_pstate1		[10:0],
		  new_pstate0		[10:0]}),
	.din1	({wdr_pstate3		[10:0],
		  wdr_pstate2		[10:0],
		  new_pstate1		[10:0],
		  wdr_pstate0		[10:0]}),
	.din2	({wdr_pstate3		[10:0],
		  new_pstate2		[10:0],
		  wdr_pstate1		[10:0],
		  wdr_pstate0		[10:0]}),
	.din3	({new_pstate3		[10:0],
		  wdr_pstate2		[10:0],
		  wdr_pstate1		[10:0],
		  wdr_pstate0		[10:0]}),
	.din4	({wdr_pstate3		[10:0],
		  wdr_pstate2		[10:0],
		  wdr_pstate1		[10:0],
		  wdr_pstate0		[10:0]}),
	.sel0	(trl_pstate_thread_sel	[0   ]	),
	.sel1	(trl_pstate_thread_sel	[1   ]	),
	.sel2	(trl_pstate_thread_sel	[2   ]	),
	.sel3	(trl_pstate_thread_sel	[3   ]	),
	.sel4	(trl_pstate_thread_sel	[4   ]	),
	.en	(trl_pstate_en			),
	.dout	({pstate3_reg		[10:0],
		  pstate2_reg		[10:0],
		  pstate1_reg		[10:0],
		  pstate0_reg		[10:0]}),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tsd_dp_mux_macro__mux_aodec__ports_4__stack_48c__width_11 shadow_pstate_mux     (
	.din0	(pstate0_reg		[10:0]	),
	.din1	(pstate1_reg		[10:0]	),
	.din2	(pstate2_reg		[10:0]	),
	.din3	(pstate3_reg		[10:0]	),
	.sel	(trl_shscanid		[1:0]	),
	.dout	(shadow_pstate		[10:0]	)
);

assign tsd_shadow_pstate[10:0] =
       shadow_pstate[10:0];

assign arch_pstate3[12:0] =
       {pstate3_reg[7], 2'b00, pstate3_reg[9:8], 3'b000, pstate3_reg[4:1], 
	 1'b0};
assign arch_pstate2[12:0] =
       {pstate2_reg[7], 2'b00, pstate2_reg[9:8], 3'b000, pstate2_reg[4:1],
	1'b0};
assign arch_pstate1[12:0] =
       {pstate1_reg[7], 2'b00, pstate1_reg[9:8], 3'b000, pstate1_reg[4:1],
	1'b0};
assign arch_pstate0[12:0] =
       {pstate0_reg[7], 2'b00, pstate0_reg[9:8], 3'b000, pstate0_reg[4:1],
	1'b0};

assign arch_hpstate3[12:0] =
       {{2 {1'b0}}, pstate3_reg[10], {4 {1'b0}}, pstate3_reg[5],
	 {2 {1'b0}}, pstate3_reg[6], 1'b0, pstate3_reg[0]};
assign arch_hpstate2[12:0] =
       {{2 {1'b0}}, pstate2_reg[10], {4 {1'b0}}, pstate2_reg[5],
	 {2 {1'b0}}, pstate2_reg[6], 1'b0, pstate2_reg[0]};
assign arch_hpstate1[12:0] =
       {{2 {1'b0}}, pstate1_reg[10], {4 {1'b0}}, pstate1_reg[5],
	 {2 {1'b0}}, pstate1_reg[6], 1'b0, pstate1_reg[0]};
assign arch_hpstate0[12:0] =
       {{2 {1'b0}}, pstate0_reg[10], {4 {1'b0}}, pstate0_reg[5],
	 {2 {1'b0}}, pstate0_reg[6], 1'b0, pstate0_reg[0]};

tlu_tsd_dp_buff_macro__rep_1__stack_48c__width_48 pmu_pstate_buf    (
	.din	({    pstate3_reg	[9   ],
		  {5 {pstate3_reg	[6 ]}},
	  	      pstate3_reg	[4   ],
		  {5 {pstate3_reg	[2 ]}},
		      pstate2_reg	[9   ],
		  {5 {pstate2_reg	[6 ]}},
	  	      pstate2_reg	[4   ],
		  {5 {pstate2_reg	[2 ]}},
		      pstate1_reg	[9   ],
		  {5 {pstate1_reg	[6 ]}},
	  	      pstate1_reg	[4   ],
		  {5 {pstate1_reg	[2 ]}},
		      pstate0_reg	[9   ],
		  {5 {pstate0_reg	[6 ]}},
	  	      pstate0_reg	[4   ],
		  {5 {pstate0_reg	[2 ]}}}),
	.dout	({tlu_pstate_cle	[3   ],
		  tlu_pmu_hpstate_hpriv [3   ],
		  tlu_lsu_hpstate_hpriv [3   ],
		  tlu_dec_hpstate_hpriv [3   ],
		  tlu_ifu_hpstate_hpriv [3   ],
		  tsd_hpstate_hpriv     [3   ],
		  tlu_dec_pstate_pef    [3   ],
		  tlu_pmu_pstate_priv	[3   ],
		  tlu_lsu_pstate_priv	[3   ],
		  tlu_dec_pstate_priv	[3   ],
		  tlu_ifu_pstate_priv	[3   ],
		  tsd_pstate_priv	[3   ],
		  tlu_pstate_cle	[2   ],
		  tlu_pmu_hpstate_hpriv [2   ],
		  tlu_lsu_hpstate_hpriv [2   ],
		  tlu_dec_hpstate_hpriv [2   ],
		  tlu_ifu_hpstate_hpriv [2   ],
		  tsd_hpstate_hpriv     [2   ],
		  tlu_dec_pstate_pef    [2   ],
		  tlu_pmu_pstate_priv	[2   ],
		  tlu_lsu_pstate_priv	[2   ],
		  tlu_dec_pstate_priv	[2   ],
		  tlu_ifu_pstate_priv	[2   ],
		  tsd_pstate_priv	[2   ],
		  tlu_pstate_cle	[1   ],
		  tlu_pmu_hpstate_hpriv [1   ],
		  tlu_lsu_hpstate_hpriv [1   ],
		  tlu_dec_hpstate_hpriv [1   ],
		  tlu_ifu_hpstate_hpriv [1   ],
		  tsd_hpstate_hpriv     [1   ],
		  tlu_dec_pstate_pef    [1   ],
		  tlu_pmu_pstate_priv	[1   ],
		  tlu_lsu_pstate_priv	[1   ],
		  tlu_dec_pstate_priv	[1   ],
		  tlu_ifu_pstate_priv	[1   ],
		  tsd_pstate_priv	[1   ],
		  tlu_pstate_cle	[0   ],
		  tlu_pmu_hpstate_hpriv [0   ],
		  tlu_lsu_hpstate_hpriv [0   ],
		  tlu_dec_hpstate_hpriv [0   ],
		  tlu_ifu_hpstate_hpriv [0   ],
		  tsd_hpstate_hpriv     [0   ],
		  tlu_dec_pstate_pef    [0   ],
		  tlu_pmu_pstate_priv	[0   ],
		  tlu_lsu_pstate_priv	[0   ],
		  tlu_dec_pstate_priv	[0   ],
		  tlu_ifu_pstate_priv	[0   ],
		  tsd_pstate_priv	[0   ]})
);

assign tsd_pstate_tct[3:0] =
       {pstate3_reg[7], pstate2_reg[7], pstate1_reg[7], pstate0_reg[7]};

assign tlu_pstate_am[3:0] = 
       {pstate3_reg[3], pstate2_reg[3], pstate1_reg[3], pstate0_reg[3]};

assign tsd_pstate_am[3:0] =
       {pstate3_reg[3], pstate2_reg[3], pstate1_reg[3], pstate0_reg[3]};

assign tsd_pstate_ie[3:0] =
       {pstate3_reg[1], pstate2_reg[1], pstate1_reg[1], pstate0_reg[1]};

assign tsd_hpstate_ibe[3:0] =
       {pstate3_reg[10], pstate2_reg[10], pstate1_reg[10], pstate0_reg[10]};
 
assign tsd_hpstate_red[3:0] =
       {pstate3_reg[5], pstate2_reg[5], pstate1_reg[5], pstate0_reg[5]};

assign tsd_hpstate_tlz[3:0] =
       {pstate3_reg[0], pstate2_reg[0], pstate1_reg[0], pstate0_reg[0]};

// Bypass ITLB if in RED state or in HPRIV
tlu_tsd_dp_or_macro__ports_2__stack_4r__width_4 itlb_bypass_or    (
	.din0	({pstate3_reg		[5   ],
		  pstate2_reg		[5   ],
		  pstate1_reg		[5   ],
		  pstate0_reg		[5   ]}),
	.din1	({pstate3_reg		[6   ],
		  pstate2_reg		[6   ],
		  pstate1_reg		[6   ],
		  pstate0_reg		[6   ]}),
	.dout	(tlu_itlb_bypass	[3:0]	)
);								   

tlu_tsd_dp_buff_macro__rep_1__stack_4r__width_4 itlb_bypass_buf    (
	.din	(tlu_itlb_bypass	[3:0]	),
	.dout	(tsd_itlb_bypass	[3:0]	)
);								   

assign asi_tsd_wr_data_crit[12] =
       asi_tsd_wr_data_12;	
assign asi_tsd_wr_data_crit[10:8] =
       asi_tsd_wr_data_10_08[10:8];	
assign asi_tsd_wr_data_crit[5:0] =
       asi_tsd_wr_data_05_00[5:0];	

// Mux in ASI writes of PSTATE
tlu_tsd_dp_mux_macro__mux_aope__ports_5__stack_48c__width_44 asi_pstate_mux     (
	.din4	({pstate3_reg		[10:0],
		  pstate2_reg		[10:0],
		  pstate1_reg		[10:0],
		  pstate0_reg		[10:0]}),
	.din3	({pstate3_reg		[10   ],
		  asi_tsd_wr_data_crit	[9:8],
		  asi_tsd_wr_data_crit	[12   ],
		  pstate3_reg		[6:5],
		  asi_tsd_wr_data_crit	[4:1],
		  pstate3_reg		[0   ],
		  pstate2_reg		[10:0],
		  pstate1_reg		[10:0],
		  pstate0_reg		[10:0]}),
	.din2	({pstate3_reg		[10:0],
		  pstate2_reg		[10   ],
		  asi_tsd_wr_data_crit	[9:8],
		  asi_tsd_wr_data_crit	[12   ],
		  pstate2_reg		[6:5],
		  asi_tsd_wr_data_crit	[4:1],
		  pstate2_reg		[0   ],
		  pstate1_reg		[10:0],
		  pstate0_reg		[10:0]}),
	.din1	({pstate3_reg		[10:0],
		  pstate2_reg		[10:0],
		  pstate1_reg		[10   ],
		  asi_tsd_wr_data_crit	[9:8],
		  asi_tsd_wr_data_crit	[12   ],
		  pstate1_reg		[6:5],
		  asi_tsd_wr_data_crit	[4:1],
		  pstate1_reg		[0   ],
		  pstate0_reg		[10:0]}),
	.din0	({pstate3_reg		[10:0],
		  pstate2_reg		[10:0],
		  pstate1_reg		[10:0],
		  pstate0_reg		[10   ],
		  asi_tsd_wr_data_crit	[9:8],
		  asi_tsd_wr_data_crit	[12   ],
		  pstate0_reg		[6:5],
		  asi_tsd_wr_data_crit	[4:1],
		  pstate0_reg		[0   ]}),
	.sel3	(wr_pstate		[3   ]	),
	.sel2	(wr_pstate		[2   ]	),
	.sel1	(wr_pstate		[1   ]	),
	.sel0	(wr_pstate		[0   ]	),
	.dout	({asi_pstate3		[10:0],
		  asi_pstate2		[10:0],
		  asi_pstate1		[10:0],
		  asi_pstate0		[10:0]})
);

// Mux in ASI writes of HPSTATE
tlu_tsd_dp_mux_macro__mux_aope__ports_5__stack_48c__width_44 asi_hpstate_mux     (
	.din4	({asi_pstate3		[10:0],
		  asi_pstate2		[10:0],
		  asi_pstate1		[10:0],
		  asi_pstate0		[10:0]}),
	.din3	({asi_tsd_wr_data_crit	[10   ],
		  asi_pstate3		[9:7],
		  asi_tsd_wr_data_crit	[2   ],
		  asi_tsd_wr_data_crit	[5   ],
		  asi_pstate3		[4:1],
		  asi_tsd_wr_data_crit	[0   ],
		  asi_pstate2		[10:0],
		  asi_pstate1		[10:0],
		  asi_pstate0		[10:0]}),
	.din2	({asi_pstate3		[10:0],
		  asi_tsd_wr_data_crit	[10   ],
		  asi_pstate2		[9:7],
		  asi_tsd_wr_data_crit	[2   ],
		  asi_tsd_wr_data_crit	[5   ],
		  asi_pstate2		[4:1],
		  asi_tsd_wr_data_crit	[0   ],
		  asi_pstate1		[10:0],
		  asi_pstate0		[10:0]}),
	.din1	({asi_pstate3		[10:0],
		  asi_pstate2		[10:0],
		  asi_tsd_wr_data_crit	[10   ],
		  asi_pstate1		[9:7],
		  asi_tsd_wr_data_crit	[2   ],
		  asi_tsd_wr_data_crit	[5   ],
		  asi_pstate1		[4:1],
		  asi_tsd_wr_data_crit	[0   ],
		  asi_pstate0		[10:0]}),
	.din0	({asi_pstate3		[10:0],
		  asi_pstate2		[10:0],
		  asi_pstate1		[10:0],
		  asi_tsd_wr_data_crit	[10   ],
		  asi_pstate0		[9:7],
		  asi_tsd_wr_data_crit	[2   ],
		  asi_tsd_wr_data_crit	[5   ],
		  asi_pstate0		[4:1],
		  asi_tsd_wr_data_crit	[0   ]}),
	.sel3	(wr_hpstate		[3   ]	),
	.sel2	(wr_hpstate		[2   ]	),
	.sel1	(wr_hpstate		[1   ]	),
	.sel0	(wr_hpstate		[0   ]	),
	.dout	({asi_hpstate3		[10:0],
		  asi_hpstate2		[10:0],
		  asi_hpstate1		[10:0],
		  asi_hpstate0		[10:0]})
);

// Mux in done and retry H/PSTATE restores if ECC is good		 
tlu_tsd_dp_mux_macro__mux_aope__ports_5__stack_48c__width_44 don_ret_mux     (
	.din4	({asi_hpstate3		[10:0],
		  asi_hpstate2		[10:0],
		  asi_hpstate1		[10:0],
		  asi_hpstate0		[10:0]}),
	.din3	({don_ret_pstate	[10:0],
		  asi_hpstate2		[10:0],
		  asi_hpstate1		[10:0],
		  asi_hpstate0		[10:0]}),
	.din2	({asi_hpstate3		[10:0],
		  don_ret_pstate	[10:0],
		  asi_hpstate1		[10:0],
		  asi_hpstate0		[10:0]}),
	.din1	({asi_hpstate3		[10:0],
		  asi_hpstate2		[10:0],
		  don_ret_pstate	[10:0],
		  asi_hpstate0		[10:0]}),
	.din0	({asi_hpstate3		[10:0],
		  asi_hpstate2		[10:0],
		  asi_hpstate1		[10:0],
		  don_ret_pstate	[10:0]}),
	.sel3	(trl_don_ret_pstate_sel	[3   ]	),
	.sel2	(trl_don_ret_pstate_sel	[2   ]	),
	.sel1	(trl_don_ret_pstate_sel	[1   ]	),
	.sel0	(trl_don_ret_pstate_sel	[0   ]	),
	.dout	({wdr_pstate3		[10:0],
		  wdr_pstate2		[10:0],
		  wdr_pstate1		[10:0],
		  wdr_pstate0		[10:0]})
);

tlu_tsd_dp_mux_macro__mux_aonpe__ports_3__stack_48c__width_44 trap_pstate_mux     (
	// Normal trap to hypervisor
	// IBE to 0, HPRIV to 1,  RED to 0, TCT to 0, CLE to 0, PEF to 0, 
	// AM to 0, PRIV to 0, IE to 0
	.din2 	({2'b00			       ,
		  pstate3_reg		[8   ],
		  7'b0101000		       ,	
		  pstate3_reg		[0   ],
		  2'b00			       ,
		  pstate2_reg		[8   ],
		  7'b0101000		       ,	
		  pstate2_reg		[0   ],
		  2'b00			       ,
		  pstate1_reg		[8   ],
		  7'b0101000		       ,	
		  pstate1_reg		[0   ],
		  2'b00			       ,
		  pstate0_reg		[8   ],
		  7'b0101000		       ,	
		  pstate0_reg		[0   ]}),
	// Normal trap not to hypervisor
	// HPRIV unchanged, RED to 0, TCT to 0, PEF to 1, AM to 0, PRIV to 1, 
	// IE to 0, CLE set to TLE
	.din1	({pstate3_reg		[10   ],
		  pstate3_reg		[8   ],
		  pstate3_reg		[8   ],
		  1'b0			       ,
		  pstate3_reg		[6   ],
		  5'b01010		       ,	
		  pstate3_reg		[0   ],
		  pstate2_reg		[10   ],
		  pstate2_reg		[8   ],
		  pstate2_reg		[8   ],
		  1'b0			       ,
		  pstate2_reg		[6   ],
		  5'b01010		       ,	
		  pstate2_reg		[0   ],
		  pstate1_reg		[10   ],
		  pstate1_reg		[8   ],
		  pstate1_reg		[8   ],
		  1'b0			       ,
		  pstate1_reg		[6   ],
		  5'b01010		       ,	
		  pstate1_reg		[0   ],
		  pstate0_reg		[10   ],
		  pstate0_reg		[8   ],
		  pstate0_reg		[8   ],
		  1'b0			       ,
		  pstate0_reg		[6   ],
		  5'b01010		       ,	
		  pstate0_reg		[0   ]}),
	// Any reset trap
	.din0	({11'b00001110100	       ,	
		  11'b00001110100	       ,	
		  11'b00001110100	       ,	
		  11'b00001110100	       }),
	.sel2	(trl_other_trap			),
	.sel1	(trl_stay_in_priv		),
	.sel0	(trl_reset_trap			),
	.dout	({new_pstate3		[10:0],
		  new_pstate2		[10:0],
		  new_pstate1		[10:0],
		  new_pstate0		[10:0]})
);




////////////////////////////////////////////////////////////////////////////////
// Handle read-modify-write ASI accesses
//

// First capture read
tlu_tsd_dp_msff_macro__left_1__minbuff_1__stack_48c__width_47 read_tpc_lat     (
	.scan_in(read_tpc_lat_scanin),
	.scan_out(read_tpc_lat_scanout),
	.en	(trl_tsd_tsa_en			),
	.din	({tsa_tpc		[47:2],
		  tsa_tpc_oor_va	       }),
	.dout	({tpc_mod_crit		[47:2],
		  tpc_oor_va_mod_crit	       }),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tsd_dp_buff_macro__left_1__rep_1__stack_48c__width_47 read_tpc_buf     (
	.din	({tpc_mod_crit		[47:2],
		  tpc_oor_va_mod_crit	       }),
	.dout	({tpc_mod		[47:2],
		  tpc_oor_va_mod	       })
);

assign tsd_tpc[47:2] =
       tpc_mod[47:2];
assign tsd_tpc_oor_va = 
       tpc_oor_va_mod;

tlu_tsd_dp_msff_macro__minbuff_1__stack_48c__width_48 read_tnpc_lat    (
	.scan_in(read_tnpc_lat_scanin),
	.scan_out(read_tnpc_lat_scanout),
	.en	(trl_tsd_tsa_en			),
	.din	({tsa_tnpc		[47:2],
		  tsa_tnpc_oor_va	       ,
		  tsa_tnpc_nonseq	       }),
	.dout	({tnpc_mod_crit		[47:2],
		  tnpc_oor_va_mod_crit	       ,
		  tnpc_nonseq_mod_crit	       }),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tsd_dp_buff_macro__rep_1__stack_48c__width_48 read_tnpc_buf    (
	.din	({tnpc_mod_crit		[47:2],
		  tnpc_oor_va_mod_crit	       ,
		  tnpc_nonseq_mod_crit	       }),
	.dout	({tnpc_mod		[47:2],
		  tnpc_oor_va_mod	       ,
		  tnpc_nonseq_mod	       })
);

assign tsd_tnpc[47:2] =
       tnpc_mod[47:2];
assign tsd_tnpc_oor_va = 
       tnpc_oor_va_mod;
assign tsd_tnpc_nonseq =
       tnpc_nonseq_mod;

tlu_tsd_dp_msff_macro__left_7__minbuff_1__stack_48c__width_41 read_tstate_lat     (
	.scan_in(read_tstate_lat_scanin),
	.scan_out(read_tstate_lat_scanout),
	.en	(trl_tsd_tsa_en			),
	.din	({tsa_gl		[1:0],
		  tsa_rd_data		[29:0],
		  tsa_trap_type		[8:0]}),
	.dout	({gl_mod_crit		[1:0],
		  tstate_mod_crit	[29:0],
		  trap_type_mod_crit	[8:0]}),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tsd_dp_buff_macro__left_6__stack_48c__width_42 read_tstate_buf    (
	.din	({gl_mod_crit		[1:0],
		  tstate_mod_crit	[29:0],
		  trap_type_mod_crit	[8:0],
		  tstate_mod_crit	   [9]}),
	.dout	({gl_mod		[1:0],
		  tstate_mod		[29:0],
		  trap_type_mod		[8:0],
		  tsd_htstate_hpriv	      })
);

assign tsd_ted_mra_rd_data[135:0] =
       {tpc_oor_va_mod_crit	       ,
	tnpc_oor_va_mod_crit	       ,
	tnpc_nonseq_mod_crit	       ,
	gl_mod_crit		[1:0],
	tstate_mod_crit		[29:0],
	trap_type_mod_crit	[8:0],
	tpc_mod_crit		[47:2],
	tnpc_mod_crit		[47:2]};


// Then modify data
tlu_tsd_dp_msff_macro__left_1__mux_aope__ports_8__stack_48c__width_47 wr_tpc_lat      (
	.scan_in(wr_tpc_lat_scanin),
	.scan_out(wr_tpc_lat_scanout),
	.din0	({asi_mbist_ecc_in	[3:0],
		  {5 {asi_mbist_ecc_in	[7:0]}},
		  asi_mbist_ecc_in	[7:6],
		  asi_mbist_ecc_in	[1   ]}),
	.din1	({asi_tsa_wr_data	[47:2],
		  1'b0			       }),
	.din2	({asi_tsa_wr_data	[17:6],	// Mondo or Res Head
		  tpc_mod		[35:2],
		  tpc_oor_va_mod	       }),
	.din3	({tpc_mod		[47:36],
		  asi_tsa_wr_data	[17:6],	// Device or Nonres Head
		  tpc_mod		[23:2],
		  tpc_oor_va_mod	       }),
	.din4	({asi_tsa_wr_data	[17:6],	// Mondo or Res Head
		  tpc_mod		[35:2],
		  tpc_oor_va_mod	       }),
	.din5	({tpc_mod		[47:36],
		  asi_tsa_wr_data	[17:6],	// Device or Nonres Head
		  tpc_mod		[23:2],
		  tpc_oor_va_mod	       }),
	.din6	({tpc_mod		[47:2],
		  tpc_oor_va_mod	       }),
	.din7	({pct_tsa_pc		[47:2],
		  pct_tsa_pc_oor_va	       }),
	.sel0	(asi_mbist_run			),
	.sel1	(asi_wr_tpc			),
	.sel2	(asi_wr_mondo_head		),
	.sel3	(asi_wr_device_head		),
	.sel4	(asi_wr_res_err_head		),
	.sel5	(asi_wr_nonres_err_head		),
	.sel6	(trl_rmw_tsa			),
	.en	(trl_tsd_tsa_wd_en		),
	.dout	({tsd_wr_tpc		[47:2],
		  tsd_wr_tpc_oor_va	       }),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tsd_dp_msff_macro__left_2__minbuff_1__stack_48c__width_46 shadow_tpc_lat     (
	.scan_in(shadow_tpc_lat_scanin),
	.scan_out(shadow_tpc_lat_scanout),
	.din	(tsd_wr_tpc		[47:2] ),
	.en	(trl_capture_ss			),
	.dout	(tsd_shadow_tpc		[47:2]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// Check Interrupt Queue Registers on write to any of them
// (qualification occurs in tlu_fls_ctl)
// Convert queue registers to 12 bit.
tlu_tsd_dp_cmp_macro__width_12 mondo_res_err_cmp  (
	.din0	(tsd_wr_tpc		[47:36]	),
	.din1	(tsd_wr_tnpc		[47:36]	),
	.dout	(tsd_mrqr_exc_		)
);

tlu_tsd_dp_cmp_macro__width_12 device_cmp  (
	.din0	(tsd_wr_tpc		[35:24]	),
	.din1	(tsd_wr_tnpc		[35:24]	),
	.dout	(tsd_dqr_exc_			)
);

// MBIST writes factored into asi_tsa_wr_data for TNPC
tlu_tsd_dp_msff_macro__mux_aope__ports_8__stack_48c__width_48 wr_tnpc_lat     (
	.scan_in(wr_tnpc_lat_scanin),
	.scan_out(wr_tnpc_lat_scanout),
	.din0	({asi_tsa_wr_data	[47:2],
		  asi_tsa_wr_data_npc_oor_va   ,
		  asi_tsa_wr_data_npc_nonseq   }),
	.din1	({tnpc_mod		[47:2],
		  tnpc_oor_va_mod	       ,
		  1'b1			       }),
	.din2	({asi_tsa_wr_data	[17:6],	// Mondo or Res Tail
		  tnpc_mod		[35:2],
		  tnpc_oor_va_mod	       ,
		  tnpc_nonseq_mod	       }),
	.din3	({tnpc_mod		[47:36],
		  asi_tsa_wr_data	[17:6],	// Device or Nonres Tail
		  tnpc_mod		[23:2],
		  tnpc_oor_va_mod	       ,
		  tnpc_nonseq_mod	       }),
	.din4	({asi_tsa_wr_data	[17:6],	// Mondo or Res Tail
		  tnpc_mod		[35:2],
		  tnpc_oor_va_mod	       ,
		  tnpc_nonseq_mod	       }),
	.din5	({tnpc_mod		[47:36],
		  asi_tsa_wr_data	[17:6],	// Device or Nonres Tail
		  tnpc_mod		[23:2],
		  tnpc_oor_va_mod	       ,
		  tnpc_nonseq_mod	       }),
	.din6	({tnpc_mod		[47:2],
		  tnpc_oor_va_mod	       ,
		  tnpc_nonseq_mod	       }),
	.din7	({pct_tsa_npc		[47:2],
		  pct_tsa_npc_oor_va	       ,
		  pct_tsa_npc_nonseq	       }),
	.sel0	(asi_wr_tnpc			),
	.sel1	(asi_wr_tpc			),
	.sel2	(asi_wr_mondo_tail		),
	.sel3	(asi_wr_device_tail		),
	.sel4	(asi_wr_res_err_tail		),
	.sel5	(asi_wr_nonres_err_tail		),
	.sel6	(trl_rmw_tsa			),
	.en	(trl_tsd_tsa_wd_en		),
	.dout	({tsd_wr_tnpc		[47:2],
		  tsd_wr_tnpc_oor_va	       ,
		  tsd_wr_tnpc_nonseq	       }),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tsd_dp_msff_macro__mux_aope__ports_8__stack_48c__width_41 wr_tstate_lat     (
	.scan_in(wr_tstate_lat_scanin),
	.scan_out(wr_tstate_lat_scanout),
	.din0	({asi_mbist_ecc_in	[4:0],
		  {4 {asi_mbist_ecc_in	[7:0]}},		  
		  asi_mbist_ecc_in	[7:4]}),		  
	.din1	({gl_mod		[1:0],
		  tstate_mod		[29:0],
		  trap_type_mod		[8:0]}),
	.din2	({gl_mod		[1:0],
		  tstate_mod		[29:0],
		  trap_type_mod		[8:0]}),
	.din3	({asi_tsa_wr_data	[41:40], // GL
		  asi_tsa_wr_data	[39:32], // CCR
		  asi_tsa_wr_data	[31:24], // ASI
		  tstate_mod		[13   ], // IBE
		  asi_tsa_wr_data	[17:16], // CLE, TLE
		  asi_tsa_wr_data	[20   ], // TCT
		  tstate_mod		[9   ], // HPRIV
		  tstate_mod		[8   ], // RED
		  asi_tsa_wr_data	[12:9], // PEF, AM, PRIV, IE
		  tstate_mod		[3   ], // TLZ
		  asi_tsa_wr_data	[2:0], // CWP
		  trap_type_mod		[8:0]}), // Trap Type
	.din4	({gl_mod		[1:0],
		  tstate_mod 		[29:0], // Everything but Trap Type
		  asi_tsa_wr_data	[8:0]}), // Trap Type
	.din5	({gl_mod 		[1:0], // GL
		  tstate_mod 		[29:22], // CCR
		  tstate_mod 		[21:14], // ASI
		  asi_tsa_wr_data	[10   ], // IBE
		  tstate_mod		[12:11], // CLE, TLE
		  tstate_mod		[10   ], // TCT
		  asi_tsa_wr_data	[2   ], // HPRIV
		  asi_tsa_wr_data	[5   ], // RED
		  tstate_mod		[7:4], // PEF, AM, PRIV, IE
		  asi_tsa_wr_data	[0   ], // TLZ
		  tstate_mod 		[2:0], // CWP
		  trap_type_mod		[8:0]}), // Trap Type
	.din6	({gl_mod		[1:0],
		  tstate_mod 		[29:0], // Everything but Trap Type
		  trap_type_mod		[8:0]}), // Trap Type
	.din7	({trl_tsa_gl		[1:0],
		  tsa_wr_data		[29:0], 
		  trl_tsa_trap_type	[8:0]}),
	.sel0	(asi_mbist_run			),
	.sel1	(asi_wr_tpc			),
	.sel2	(asi_wr_tnpc			),
	.sel3	(asi_wr_tstate			),
	.sel4	(asi_wr_tt			),
	.sel5	(asi_wr_htstate			),
	.sel6	(trl_save_tsa			),
	.en	(trl_tsd_tsa_wd_en		),
	.dout	({tsd_wr_gl		[1:0],
		  tsd_wr_data		[29:0],
		  tsd_wr_trap_type	[8:0]}),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tsd_dp_buff_macro__rep_1__stack_48c__width_30 ccr_cwp_asi_buf    (
	.din	(tsd_wr_data		[29:0]	),
	.dout	({tlu_ccr		[7:0],
		  tlu_asi		[7:0],
		  don_ret_pstate	[10:0],
		  tlu_cwp		[2:0]})
);

tlu_tsd_dp_msff_macro__stack_48c__width_9 shadow_tt_lat   (
	.scan_in(shadow_tt_lat_scanin),
	.scan_out(shadow_tt_lat_scanout),
	.din	(tsd_wr_trap_type	[8:0] ),
	.en	(trl_capture_ss			),
	.dout	(tsd_shadow_tt		[8:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);


////////////////////////////////////////////////////////////////////////////////
// Build write vector for Trap Stack Array
//   GL    CCR    ASI    (H)PSTATE   CWP   TT  PC nPC
// 41 40  39 32  31 24   19      8   4 0 
//
// GL, TT, PC, nPC concatenated at the array instantiation
// 
// Also implement HTSTATE
//   IBE  RED  HPRIV  TLZ
//    10   5     2     0

tlu_tsd_dp_mux_macro__mux_aonpe__ports_4__stack_48c__width_30 tsa_write_lat     (
	.din0	({exu_ccr0		[7:0], 
		  asi0			[7:0],
		  pstate0_reg		[10:0],
		  fls_cwp0		[2:0]}),
	.din1	({exu_ccr1		[7:0], 
		  asi1			[7:0],
		  pstate1_reg		[10:0],
		  fls_cwp1		[2:0]}),
	.din2	({exu_ccr2		[7:0], 
		  asi2			[7:0],
		  pstate2_reg		[10:0],
		  fls_cwp2		[2:0] }),
	.din3	({exu_ccr3		[7:0], 
		  asi3			[7:0],
		  pstate3_reg 		[10:0],
		  fls_cwp3		[2:0] }),
	.sel0	(trl_thread_sel		[0   ]	),
	.sel1	(trl_thread_sel		[1   ]	),
	.sel2	(trl_thread_sel		[2   ]	),
	.sel3	(trl_thread_sel		[3   ]	),
	.dout	(tsa_wr_data		[29:0]	)
);



////////////////////////////////////////////////////////////////////////////////
// Mux ASI reads
//

tlu_tsd_dp_msff_macro__left_11__stack_48c__width_26 rd_ctl_lat    (
	.scan_in(rd_ctl_lat_scanin),
	.scan_out(rd_ctl_lat_scanout),
	.en	(1'b1				),
	.din	({asi_rd_iqr		[2:0],
	          asi_wr_pstate		[3:0],
		  asi_rd_h_pstate_tba	[2:0],
		  asi_rd_asireg		[3:0],
		  asi_rd_tba_htba	       ,
		  asi_rd_pstate_hpstate	       ,
		  asi_wr_hpstate	[3:0],
		  asi_rd_tpc		       ,
		  asi_rd_tnpc		       ,
		  asi_rd_tstate		       ,
		  asi_rd_tt		       ,
		  asi_rd_htstate	       ,
		  asi_rd_iqr_reg	       }),
	.dout	({rd_iqr		[2:0],
	          wr_pstate		[3:0],
		  rd_h_pstate_tba	[2:0],
		  rd_asireg		[3:0],
		  rd_tba_htba		       ,
		  rd_pstate_hpstate	       ,
		  wr_hpstate		[3:0],
		  rd_tpc		       ,
		  rd_tnpc		       ,
		  rd_tstate		       ,
		  rd_tt			       ,
		  rd_htstate		       ,
		  rd_iqr_reg		       }),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tsd_dp_mux_macro__mux_aodec__ports_8__stack_48c__width_13 asi_php_mux     (
	.din0	(arch_pstate0	[12:0]	),
	.din1	(arch_pstate1	[12:0]	),
	.din2	(arch_pstate2	[12:0]	),
	.din3	(arch_pstate3	[12:0]	),
	.din4	(arch_hpstate0	[12:0]	),
	.din5	(arch_hpstate1	[12:0]	),
	.din6	(arch_hpstate2	[12:0]	),
	.din7	(arch_hpstate3	[12:0]	),
	.sel	(rd_h_pstate_tba[2:0]	),
	.dout	(asi_h_pstate	[12:0]	)
);

assign asi_h_pstate[47:13] =
       {35 {1'b0}};

tlu_tsd_dp_mux_macro__left_14__mux_aodec__ports_8__stack_48c__width_34 asi_pstate_tba_mux      (
	.din0	({tba0		[47:15],
		  1'b0		       }),
	.din1	({tba1		[47:15],
		  1'b0		       }),
	.din2	({tba2		[47:15],
		  1'b0		       }),
	.din3	({tba3		[47:15],
		  1'b0		       }),
	.din4	(htba0		[47:14]	),
	.din5	(htba1		[47:14]	),
	.din6	(htba2		[47:14]	),
	.din7	(htba3		[47:14]	),
	.sel	(rd_h_pstate_tba[2:0]	),
	.dout	(asi_h_tba	[47:14]	)
);

assign asi_h_tba[13:0] =
       {14 {1'b0}};

tlu_tsd_dp_mux_macro__dmux_8x__mux_aonpe__ports_6__stack_48c__width_48 asi_data_mux      (
	.din0	({40'h0000000000       ,
		  asi0		[7:0]}),
	.din1	({40'h0000000000       ,
		  asi1		[7:0]}),
	.din2	({40'h0000000000       ,
		  asi2		[7:0]}),
	.din3	({40'h0000000000       ,
		  asi3		[7:0]}),
	.din4	(asi_h_tba	[47:0]	),
 	.din5	(asi_h_pstate	[47:0]	),
	.sel0	(rd_asireg	[0   ]	),
	.sel1	(rd_asireg	[1   ]	),
	.sel2	(rd_asireg	[2   ]	),
	.sel3	(rd_asireg	[3   ]	),
	.sel4	(rd_tba_htba		),
	.sel5	(rd_pstate_hpstate	),
	.dout	(asi_data	[47:0]	)
);

tlu_tsd_dp_mux_macro__left_6__mux_aope__ports_4__stack_48c__width_12 iqr_mux      (
	.din0	(tnpc_mod		[35:24]	),	// Device or Nonres Tail
	.din1	(tnpc_mod		[47:36]	),	// Mondo or Res Tail
	.din2	(tpc_mod		[35:24]	),	// Device or Nonres Head
	.din3	(tpc_mod		[47:36]	),	// Mondo or Res Head
	.sel0	(rd_iqr			[0   ]	),
	.sel1	(rd_iqr			[1   ]	),
	.sel2	(rd_iqr			[2   ]	),
	.dout	(iqr_ungated		[17:6]	)
);

// Have to force this off since it's just ORed into downstream logic...
tlu_tsd_dp_and_macro__left_6__ports_2__stack_48c__width_12 iqr_and     (
	.din0	(iqr_ungated		[17:6]	),
	.din1	({12 {rd_iqr_reg}}		),
	.dout	(iqr_reg		[17:6]	)
);

assign pstate_mod[10:0] = 
	tstate_mod[13:3];

tlu_tsd_dp_mux_macro__mux_aonpe__ports_5__stack_48c__width_48 tsa_asi_data_mux     (
	.din0	({tpc_mod		[47:2],
		  2'b00			       }),
	.din1	({tnpc_mod		[47:2],
		  2'b00			       }),
	.din2	({6'h00			       ,
		  gl_mod		[1:0],
		  tstate_mod		[29:14],	// CCR, ASI
		  3'b000		       ,
		  pstate_mod		[7   ],	// TCT
		  2'b00			       ,
		  pstate_mod		[9:8],	// CLE, TLE
		  2'b00			       ,	// MM
		  1'b0			       ,
		  pstate_mod		[4:1],	// PEF, AM, PRIV, IE
		  1'b0			       ,
		  5'h00			       ,
		  tstate_mod		[2:0]}),	// CWP
	.din3	({39'h0000000000	       ,
		  trap_type_mod		[8:0]}),
	.din4	({37'h0000000000	       ,
		  pstate_mod		[10   ], 	// IBE
		  4'h0			       ,
		  pstate_mod		[5   ],	// RED
		  2'b00			       ,
		  pstate_mod		[6   ],	// HPRIV
		  1'b0			       ,
		  pstate_mod		[0   ]}),	// TLZ
	.sel0	(rd_tpc				),
	.sel1	(rd_tnpc			),
	.sel2	(rd_tstate			),
	.sel3	(rd_tt				),
	.sel4	(rd_htstate			),
	.dout	(tsa_asi_data		[47:0]	)
);

tlu_tsd_dp_nor_macro__ports_3__stack_48c__width_48 asi_data_nor    (
	.din0	(asi_data		[47:0]	),
	.din1	(tsa_asi_data		[47:0]	),
	.din2	({30'h000000000		       ,
		  iqr_reg		[17:6],
		  6'h00			       }),
	.dout	(asi_data_		[47:0]	)
);

tlu_tsd_dp_buff_macro__left_2__rep_1__stack_48c__width_46 asi_data_b_buf     (
	.din	(asi_data_		[47:2]	),
	.dout	(tsd_asi_data_		[47:2]	)
);

tlu_tsd_dp_inv_macro__stack_48c__width_2 asi_data_inv   (
	.din	(asi_data_		[1:0]	),
	.dout	(tsd_asi_data		[1:0]	)
);




////////////////////////////////////////////////////////////////////////////////
// MBIST muxing
//

tlu_tsd_dp_msff_macro__width_4 cmpsel_lat  (
	.scan_in(cmpsel_lat_scanin),
	.scan_out(cmpsel_lat_scanout),
	.en	(asi_mbist_run			),
	.din	(asi_mbist_cmpsel	[3:0]	),
	.dout	(cmpsel			[3:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_tsd_dp_buff_macro__dbuff_32x__width_1 tst_mux_rep0   (
	.din	(tcu_muxtest			),
	.dout	(tcu_muxtest_rep0		)
);

tlu_tsd_dp_mux_macro__mux_pgpe__ports_5__stack_48c__width_32 mbist_mux     (
	.din4	({tel_ecc		[15:10],
		  tpc_oor_va_mod	       ,
		  tnpc_oor_va_mod	       ,
		  tel_ecc		[15:0],
		  tel_ecc		[7:6],
		  tnpc_nonseq_mod	       ,
		  gl_mod		[1:0],
		  tstate_mod		[29:27]}),
	.din3	({tstate_mod		[26:0],
		  trap_type_mod		[8:4]}),
	.din2	({trap_type_mod		[3:0],
		  tpc_mod		[47:20]}),
	.din1	({tpc_mod		[19:2],
		  tnpc_mod		[47:34]}),
	.din0	(tnpc_mod		[33:2]	),
	.sel3	(cmpsel			[3   ]	),
	.sel2	(cmpsel			[2   ]	),
	.sel1	(cmpsel			[1   ]	),
	.sel0	(cmpsel			[0   ]	),
	.muxtst	(tcu_muxtest_rep0		),
	.dout	(tsd_mbist_data		[31:0]	),
  .test(test)
);



// fixscan start:
assign pstate_lat_scanin         = scan_in                  ;
assign read_tpc_lat_scanin       = pstate_lat_scanout       ;
assign read_tnpc_lat_scanin      = read_tpc_lat_scanout     ;
assign read_tstate_lat_scanin    = read_tnpc_lat_scanout    ;
assign wr_tpc_lat_scanin         = read_tstate_lat_scanout  ;
assign shadow_tpc_lat_scanin     = wr_tpc_lat_scanout       ;
assign wr_tnpc_lat_scanin        = shadow_tpc_lat_scanout   ;
assign wr_tstate_lat_scanin      = wr_tnpc_lat_scanout      ;
assign shadow_tt_lat_scanin      = wr_tstate_lat_scanout    ;
assign rd_ctl_lat_scanin         = shadow_tt_lat_scanout    ;
assign cmpsel_lat_scanin         = rd_ctl_lat_scanout       ;
assign scan_out                  = cmpsel_lat_scanout       ;

assign asireg_lat_wmr_scanin     = wmr_scan_in              ;
assign htba3_lat_wmr_scanin      = asireg_lat_wmr_scanout   ;
assign htba2_lat_wmr_scanin      = htba3_lat_wmr_scanout    ;
assign htba1_lat_wmr_scanin      = htba2_lat_wmr_scanout    ;
assign htba0_lat_wmr_scanin      = htba1_lat_wmr_scanout    ;
assign tba3_lat_wmr_scanin       = htba0_lat_wmr_scanout    ;
assign tba2_lat_wmr_scanin       = tba3_lat_wmr_scanout     ;
assign tba1_lat_wmr_scanin       = tba2_lat_wmr_scanout     ;
assign tba0_lat_wmr_scanin       = tba1_lat_wmr_scanout     ;
assign wmr_scan_out              = tba0_lat_wmr_scanout     ;
// fixscan end:
endmodule



//
//   buff macro
//
//





module tlu_tsd_dp_buff_macro__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule





//
//   buff macro
//
//





module tlu_tsd_dp_buff_macro__width_34 (
  din, 
  dout);
  input [33:0] din;
  output [33:0] dout;






buff #(34)  d0_0 (
.in(din[33:0]),
.out(dout[33:0])
);








endmodule





//
//   buff macro
//
//





module tlu_tsd_dp_buff_macro__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






buff #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);








endmodule









// any PARAMS parms go into naming of macro

module tlu_tsd_dp_msff_macro__mux_aope__ports_5__stack_48c__width_32 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  sel0, 
  sel1, 
  sel2, 
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
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire [31:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [30:0] so;

  input [31:0] din0;
  input [31:0] din1;
  input [31:0] din2;
  input [31:0] din3;
  input [31:0] din4;
  input sel0;
  input sel1;
  input sel2;
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




cl_dp1_penc5_8x  c1_0 (
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

mux5s #(32)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
  .in3(din3[31:0]),
  .in4(din4[31:0]),
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_tsd_dp_mux_macro__mux_aonpe__ports_5__stack_48c__width_32 (
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

  input [31:0] din0;
  input sel0;
  input [31:0] din1;
  input sel1;
  input [31:0] din2;
  input sel2;
  input [31:0] din3;
  input sel3;
  input [31:0] din4;
  input sel4;
  output [31:0] dout;





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
mux5s #(32)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
  .in3(din3[31:0]),
  .in4(din4[31:0]),
.dout(dout[31:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module tlu_tsd_dp_msff_macro__left_14__stack_48c__width_34 (
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
wire [32:0] so;

  input [33:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [33:0] dout;


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
dff #(34)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[33:0]),
.si({scan_in,so[32:0]}),
.so({so[32:0],scan_out}),
.q(dout[33:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module tlu_tsd_dp_msff_macro__left_15__stack_48c__width_33 (
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
wire [31:0] so;

  input [32:0] din;


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
.d(din[32:0]),
.si({scan_in,so[31:0]}),
.so({so[31:0],scan_out}),
.q(dout[32:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_tsd_dp_mux_macro__dmux_8x__left_14__mux_aodec__ports_8__stack_48c__width_34 (
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

  input [33:0] din0;
  input [33:0] din1;
  input [33:0] din2;
  input [33:0] din3;
  input [33:0] din4;
  input [33:0] din5;
  input [33:0] din6;
  input [33:0] din7;
  input [2:0] sel;
  output [33:0] dout;





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

mux8s #(34)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[33:0]),
  .in1(din1[33:0]),
  .in2(din2[33:0]),
  .in3(din3[33:0]),
  .in4(din4[33:0]),
  .in5(din5[33:0]),
  .in6(din6[33:0]),
  .in7(din7[33:0]),
.dout(dout[33:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module tlu_tsd_dp_msff_macro__mux_aonpe__ports_5__stack_48c__width_44 (
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
wire [43:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [42:0] so;

  input [43:0] din0;
  input sel0;
  input [43:0] din1;
  input sel1;
  input [43:0] din2;
  input sel2;
  input [43:0] din3;
  input sel3;
  input [43:0] din4;
  input sel4;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [43:0] dout;


  output scan_out;




cl_dp1_muxbuff5_8x  c1_0 (
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
mux5s #(44)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .in0(din0[43:0]),
  .in1(din1[43:0]),
  .in2(din2[43:0]),
  .in3(din3[43:0]),
  .in4(din4[43:0]),
.dout(muxout[43:0])
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
dff #(44)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[43:0]),
.si({scan_in,so[42:0]}),
.so({so[42:0],scan_out}),
.q(dout[43:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_tsd_dp_mux_macro__mux_aodec__ports_4__stack_48c__width_11 (
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

  input [10:0] din0;
  input [10:0] din1;
  input [10:0] din2;
  input [10:0] din3;
  input [1:0] sel;
  output [10:0] dout;





cl_dp1_pdec4_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(11)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[10:0]),
  .in1(din1[10:0]),
  .in2(din2[10:0]),
  .in3(din3[10:0]),
.dout(dout[10:0])
);









  



endmodule


//
//   buff macro
//
//





module tlu_tsd_dp_buff_macro__rep_1__stack_48c__width_48 (
  din, 
  dout);
  input [47:0] din;
  output [47:0] dout;






buff #(48)  d0_0 (
.in(din[47:0]),
.out(dout[47:0])
);








endmodule





//  
//   or macro for ports = 2,3
//
//





module tlu_tsd_dp_or_macro__ports_2__stack_4r__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






or2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);









endmodule





//
//   buff macro
//
//





module tlu_tsd_dp_buff_macro__rep_1__stack_4r__width_4 (
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

module tlu_tsd_dp_mux_macro__mux_aope__ports_5__stack_48c__width_44 (
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

  input [43:0] din0;
  input [43:0] din1;
  input [43:0] din2;
  input [43:0] din3;
  input [43:0] din4;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  output [43:0] dout;





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

mux5s #(44)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .in0(din0[43:0]),
  .in1(din1[43:0]),
  .in2(din2[43:0]),
  .in3(din3[43:0]),
  .in4(din4[43:0]),
.dout(dout[43:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_tsd_dp_mux_macro__mux_aonpe__ports_3__stack_48c__width_44 (
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

  input [43:0] din0;
  input sel0;
  input [43:0] din1;
  input sel1;
  input [43:0] din2;
  input sel2;
  output [43:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(44)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[43:0]),
  .in1(din1[43:0]),
  .in2(din2[43:0]),
.dout(dout[43:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module tlu_tsd_dp_msff_macro__left_1__minbuff_1__stack_48c__width_47 (
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









//
//   buff macro
//
//





module tlu_tsd_dp_buff_macro__left_1__rep_1__stack_48c__width_47 (
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

module tlu_tsd_dp_msff_macro__minbuff_1__stack_48c__width_48 (
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













// any PARAMS parms go into naming of macro

module tlu_tsd_dp_msff_macro__left_7__minbuff_1__stack_48c__width_41 (
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
wire [39:0] so;

  input [40:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [40:0] dout;


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
dff #(41)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[40:0]),
.si({scan_in,so[39:0]}),
.so({so[39:0],scan_out}),
.q(dout[40:0])
);




















endmodule









//
//   buff macro
//
//





module tlu_tsd_dp_buff_macro__left_6__stack_48c__width_42 (
  din, 
  dout);
  input [41:0] din;
  output [41:0] dout;






buff #(42)  d0_0 (
.in(din[41:0]),
.out(dout[41:0])
);








endmodule









// any PARAMS parms go into naming of macro

module tlu_tsd_dp_msff_macro__left_1__mux_aope__ports_8__stack_48c__width_47 (
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
wire psel6;
wire psel7;
wire [46:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [45:0] so;

  input [46:0] din0;
  input [46:0] din1;
  input [46:0] din2;
  input [46:0] din3;
  input [46:0] din4;
  input [46:0] din5;
  input [46:0] din6;
  input [46:0] din7;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input sel5;
  input sel6;


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




cl_dp1_penc8_8x  c1_0 (
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

mux8s #(47)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[46:0]),
  .in1(din1[46:0]),
  .in2(din2[46:0]),
  .in3(din3[46:0]),
  .in4(din4[46:0]),
  .in5(din5[46:0]),
  .in6(din6[46:0]),
  .in7(din7[46:0]),
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













// any PARAMS parms go into naming of macro

module tlu_tsd_dp_msff_macro__left_2__minbuff_1__stack_48c__width_46 (
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
wire [44:0] so;

  input [45:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [45:0] dout;


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
dff #(46)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[45:0]),
.si({scan_in,so[44:0]}),
.so({so[44:0],scan_out}),
.q(dout[45:0])
);




















endmodule









//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module tlu_tsd_dp_cmp_macro__width_12 (
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









// any PARAMS parms go into naming of macro

module tlu_tsd_dp_msff_macro__mux_aope__ports_8__stack_48c__width_48 (
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
wire psel6;
wire psel7;
wire [47:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [46:0] so;

  input [47:0] din0;
  input [47:0] din1;
  input [47:0] din2;
  input [47:0] din3;
  input [47:0] din4;
  input [47:0] din5;
  input [47:0] din6;
  input [47:0] din7;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input sel5;
  input sel6;


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




cl_dp1_penc8_8x  c1_0 (
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

mux8s #(48)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[47:0]),
  .in1(din1[47:0]),
  .in2(din2[47:0]),
  .in3(din3[47:0]),
  .in4(din4[47:0]),
  .in5(din5[47:0]),
  .in6(din6[47:0]),
  .in7(din7[47:0]),
.dout(muxout[47:0])
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
dff #(48)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[47:0]),
.si({scan_in,so[46:0]}),
.so({so[46:0],scan_out}),
.q(dout[47:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module tlu_tsd_dp_msff_macro__mux_aope__ports_8__stack_48c__width_41 (
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
wire psel6;
wire psel7;
wire [40:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [39:0] so;

  input [40:0] din0;
  input [40:0] din1;
  input [40:0] din2;
  input [40:0] din3;
  input [40:0] din4;
  input [40:0] din5;
  input [40:0] din6;
  input [40:0] din7;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input sel5;
  input sel6;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [40:0] dout;


  output scan_out;




cl_dp1_penc8_8x  c1_0 (
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

mux8s #(41)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[40:0]),
  .in1(din1[40:0]),
  .in2(din2[40:0]),
  .in3(din3[40:0]),
  .in4(din4[40:0]),
  .in5(din5[40:0]),
  .in6(din6[40:0]),
  .in7(din7[40:0]),
.dout(muxout[40:0])
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
dff #(41)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[40:0]),
.si({scan_in,so[39:0]}),
.so({so[39:0],scan_out}),
.q(dout[40:0])
);




















endmodule









//
//   buff macro
//
//





module tlu_tsd_dp_buff_macro__rep_1__stack_48c__width_30 (
  din, 
  dout);
  input [29:0] din;
  output [29:0] dout;






buff #(30)  d0_0 (
.in(din[29:0]),
.out(dout[29:0])
);








endmodule









// any PARAMS parms go into naming of macro

module tlu_tsd_dp_msff_macro__stack_48c__width_9 (
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
wire [7:0] so;

  input [8:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [8:0] dout;


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
dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_tsd_dp_mux_macro__mux_aonpe__ports_4__stack_48c__width_30 (
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

  input [29:0] din0;
  input sel0;
  input [29:0] din1;
  input sel1;
  input [29:0] din2;
  input sel2;
  input [29:0] din3;
  input sel3;
  output [29:0] dout;





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
mux4s #(30)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[29:0]),
  .in1(din1[29:0]),
  .in2(din2[29:0]),
  .in3(din3[29:0]),
.dout(dout[29:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module tlu_tsd_dp_msff_macro__left_11__stack_48c__width_26 (
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
wire [24:0] so;

  input [25:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [25:0] dout;


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
dff #(26)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[25:0]),
.si({scan_in,so[24:0]}),
.so({so[24:0],scan_out}),
.q(dout[25:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_tsd_dp_mux_macro__mux_aodec__ports_8__stack_48c__width_13 (
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

  input [12:0] din0;
  input [12:0] din1;
  input [12:0] din2;
  input [12:0] din3;
  input [12:0] din4;
  input [12:0] din5;
  input [12:0] din6;
  input [12:0] din7;
  input [2:0] sel;
  output [12:0] dout;





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

mux8s #(13)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[12:0]),
  .in1(din1[12:0]),
  .in2(din2[12:0]),
  .in3(din3[12:0]),
  .in4(din4[12:0]),
  .in5(din5[12:0]),
  .in6(din6[12:0]),
  .in7(din7[12:0]),
.dout(dout[12:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_tsd_dp_mux_macro__left_14__mux_aodec__ports_8__stack_48c__width_34 (
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

  input [33:0] din0;
  input [33:0] din1;
  input [33:0] din2;
  input [33:0] din3;
  input [33:0] din4;
  input [33:0] din5;
  input [33:0] din6;
  input [33:0] din7;
  input [2:0] sel;
  output [33:0] dout;





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

mux8s #(34)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[33:0]),
  .in1(din1[33:0]),
  .in2(din2[33:0]),
  .in3(din3[33:0]),
  .in4(din4[33:0]),
  .in5(din5[33:0]),
  .in6(din6[33:0]),
  .in7(din7[33:0]),
.dout(dout[33:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_tsd_dp_mux_macro__dmux_8x__mux_aonpe__ports_6__stack_48c__width_48 (
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

  input [47:0] din0;
  input sel0;
  input [47:0] din1;
  input sel1;
  input [47:0] din2;
  input sel2;
  input [47:0] din3;
  input sel3;
  input [47:0] din4;
  input sel4;
  input [47:0] din5;
  input sel5;
  output [47:0] dout;





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
mux6s #(48)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .in0(din0[47:0]),
  .in1(din1[47:0]),
  .in2(din2[47:0]),
  .in3(din3[47:0]),
  .in4(din4[47:0]),
  .in5(din5[47:0]),
.dout(dout[47:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_tsd_dp_mux_macro__left_6__mux_aope__ports_4__stack_48c__width_12 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel0, 
  sel1, 
  sel2, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [11:0] din0;
  input [11:0] din1;
  input [11:0] din2;
  input [11:0] din3;
  input sel0;
  input sel1;
  input sel2;
  output [11:0] dout;





cl_dp1_penc4_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(12)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[11:0]),
  .in1(din1[11:0]),
  .in2(din2[11:0]),
  .in3(din3[11:0]),
.dout(dout[11:0])
);









  



endmodule


//  
//   and macro for ports = 2,3,4
//
//





module tlu_tsd_dp_and_macro__left_6__ports_2__stack_48c__width_12 (
  din0, 
  din1, 
  dout);
  input [11:0] din0;
  input [11:0] din1;
  output [11:0] dout;






and2 #(12)  d0_0 (
.in0(din0[11:0]),
.in1(din1[11:0]),
.out(dout[11:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_tsd_dp_mux_macro__mux_aonpe__ports_5__stack_48c__width_48 (
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

  input [47:0] din0;
  input sel0;
  input [47:0] din1;
  input sel1;
  input [47:0] din2;
  input sel2;
  input [47:0] din3;
  input sel3;
  input [47:0] din4;
  input sel4;
  output [47:0] dout;





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
mux5s #(48)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .in0(din0[47:0]),
  .in1(din1[47:0]),
  .in2(din2[47:0]),
  .in3(din3[47:0]),
  .in4(din4[47:0]),
.dout(dout[47:0])
);









  



endmodule


//
//   nor macro for ports = 2,3
//
//





module tlu_tsd_dp_nor_macro__ports_3__stack_48c__width_48 (
  din0, 
  din1, 
  din2, 
  dout);
  input [47:0] din0;
  input [47:0] din1;
  input [47:0] din2;
  output [47:0] dout;






nor3 #(48)  d0_0 (
.in0(din0[47:0]),
.in1(din1[47:0]),
.in2(din2[47:0]),
.out(dout[47:0])
);







endmodule





//
//   buff macro
//
//





module tlu_tsd_dp_buff_macro__left_2__rep_1__stack_48c__width_46 (
  din, 
  dout);
  input [45:0] din;
  output [45:0] dout;






buff #(46)  d0_0 (
.in(din[45:0]),
.out(dout[45:0])
);








endmodule





//
//   invert macro
//
//





module tlu_tsd_dp_inv_macro__stack_48c__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






inv #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);









endmodule









// any PARAMS parms go into naming of macro

module tlu_tsd_dp_msff_macro__width_4 (
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
wire [2:0] so;

  input [3:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [3:0] dout;


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
dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);




















endmodule









//
//   buff macro
//
//





module tlu_tsd_dp_buff_macro__dbuff_32x__width_1 (
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

module tlu_tsd_dp_mux_macro__mux_pgpe__ports_5__stack_48c__width_32 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;

  input [31:0] din0;
  input [31:0] din1;
  input [31:0] din2;
  input [31:0] din3;
  input [31:0] din4;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input muxtst;
  input test;
  output [31:0] dout;





cl_dp1_penc5_8x  c0_0 (
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
  .test(test)
);

mux5 #(32)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
  .in3(din3[31:0]),
  .in4(din4[31:0]),
.dout(dout[31:0]),
  .muxtst(muxtst)
);









  



endmodule

