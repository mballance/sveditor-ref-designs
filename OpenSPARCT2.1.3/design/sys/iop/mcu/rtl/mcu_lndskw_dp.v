// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_lndskw_dp.v
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
module mcu_lndskw_dp (
  lndskw_data, 
  lndskw_ts0_hdr_match, 
  lndskw_status_parity, 
  lndskw_idle_match, 
  lndskw_alert_match, 
  lndskw_alert_asserted, 
  lndskw_nbde, 
  lndskw_thermal_trip, 
  fbd_data, 
  fbdic_clr_ptrs, 
  fbdic_inc_wptr, 
  fbdic_inc_rptr, 
  fbdic_failover_mask, 
  fbdic_failover_mask_l, 
  fdout_idle_lfsr, 
  fdout_idle_lfsr_l_0, 
  fdout_idle_lfsr_0, 
  drl2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  wmr_scan_in, 
  wmr_scan_out, 
  aclk_wmr);
wire [167:0] mux_fbd_data;
wire algnbf0_wmr_scanin;
wire algnbf0_wmr_scanout;
wire algnbf0_scanin;
wire algnbf0_scanout;
wire algnbf1_wmr_scanin;
wire algnbf1_wmr_scanout;
wire algnbf1_scanin;
wire algnbf1_scanout;
wire algnbf2_wmr_scanin;
wire algnbf2_wmr_scanout;
wire algnbf2_scanin;
wire algnbf2_scanout;
wire algnbf3_wmr_scanin;
wire algnbf3_wmr_scanout;
wire algnbf3_scanin;
wire algnbf3_scanout;
wire algnbf4_wmr_scanin;
wire algnbf4_wmr_scanout;
wire algnbf4_scanin;
wire algnbf4_scanout;
wire algnbf5_wmr_scanin;
wire algnbf5_wmr_scanout;
wire algnbf5_scanin;
wire algnbf5_scanout;
wire algnbf6_wmr_scanin;
wire algnbf6_wmr_scanout;
wire algnbf6_scanin;
wire algnbf6_scanout;
wire algnbf7_wmr_scanin;
wire algnbf7_wmr_scanout;
wire algnbf7_scanin;
wire algnbf7_scanout;
wire algnbf8_wmr_scanin;
wire algnbf8_wmr_scanout;
wire algnbf8_scanin;
wire algnbf8_scanout;
wire algnbf9_wmr_scanin;
wire algnbf9_wmr_scanout;
wire algnbf9_scanin;
wire algnbf9_scanout;
wire algnbf10_wmr_scanin;
wire algnbf10_wmr_scanout;
wire algnbf10_scanin;
wire algnbf10_scanout;
wire algnbf11_wmr_scanin;
wire algnbf11_wmr_scanout;
wire algnbf11_scanin;
wire algnbf11_scanout;
wire [1:0] lndskw_status_parity_unused;
wire [1:0] lndskw_alert_asserted_unused;
wire [1:0] lndskw_nbde_unused;
wire [3:0] lndskw_thermal_trip_unused;
wire algnbf12_wmr_scanin;
wire algnbf12_wmr_scanout;
wire algnbf12_scanin;
wire algnbf12_scanout;
wire algnbf13_wmr_scanin;
wire algnbf13_wmr_scanout;
wire algnbf13_scanin;
wire algnbf13_scanout;


output	[167:0]	lndskw_data;

output	[13:0]	lndskw_ts0_hdr_match;
output	[11:0]	lndskw_status_parity;
output	[13:0]	lndskw_idle_match;
output	[13:0]	lndskw_alert_match;
output	[11:0]	lndskw_alert_asserted;
output	[11:0]	lndskw_nbde;
output	[23:0]	lndskw_thermal_trip;

input	[167:0]	fbd_data;
input		fbdic_clr_ptrs;
input		fbdic_inc_wptr;
input	[13:0]	fbdic_inc_rptr;
input	[12:0]	fbdic_failover_mask;
input	[12:0]	fbdic_failover_mask_l;
input	[11:0]	fdout_idle_lfsr;
input		fdout_idle_lfsr_l_0;
input	[1:0]	fdout_idle_lfsr_0;

input		drl2clk;
input		scan_in;
output		scan_out;
input		tcu_pce_ov;
input		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;

input		wmr_scan_in;
output		wmr_scan_out;
input		aclk_wmr;

mcu_lndskw_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover_11_0     (
	.din0(fbd_data[11:0]),
	.din1(fbd_data[23:12]),
	.sel0(fbdic_failover_mask_l[0]),
	.sel1(fbdic_failover_mask[0]),
	.dout(mux_fbd_data[11:0]));

mcu_lndskw_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover_23_12     (
	.din0(fbd_data[23:12]),
	.din1(fbd_data[35:24]),
	.sel0(fbdic_failover_mask_l[1]),
	.sel1(fbdic_failover_mask[1]),
	.dout(mux_fbd_data[23:12]));

mcu_lndskw_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover_35_24     (
	.din0(fbd_data[35:24]),
	.din1(fbd_data[47:36]),
	.sel0(fbdic_failover_mask_l[2]),
	.sel1(fbdic_failover_mask[2]),
	.dout(mux_fbd_data[35:24]));

mcu_lndskw_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover_47_36     (
	.din0(fbd_data[47:36]),
	.din1(fbd_data[59:48]),
	.sel0(fbdic_failover_mask_l[3]),
	.sel1(fbdic_failover_mask[3]),
	.dout(mux_fbd_data[47:36]));

mcu_lndskw_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover_59_48     (
	.din0(fbd_data[59:48]),
	.din1(fbd_data[71:60]),
	.sel0(fbdic_failover_mask_l[4]),
	.sel1(fbdic_failover_mask[4]),
	.dout(mux_fbd_data[59:48]));

mcu_lndskw_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover_71_60     (
	.din0(fbd_data[71:60]),
	.din1(fbd_data[83:72]),
	.sel0(fbdic_failover_mask_l[5]),
	.sel1(fbdic_failover_mask[5]),
	.dout(mux_fbd_data[71:60]));

mcu_lndskw_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover_83_72     (
	.din0(fbd_data[83:72]),
	.din1(fbd_data[95:84]),
	.sel0(fbdic_failover_mask_l[6]),
	.sel1(fbdic_failover_mask[6]),
	.dout(mux_fbd_data[83:72]));

mcu_lndskw_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover_95_84     (
	.din0(fbd_data[95:84]),
	.din1(fbd_data[107:96]),
	.sel0(fbdic_failover_mask_l[7]),
	.sel1(fbdic_failover_mask[7]),
	.dout(mux_fbd_data[95:84]));

mcu_lndskw_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover_107_96     (
	.din0(fbd_data[107:96]),
	.din1(fbd_data[119:108]),
	.sel0(fbdic_failover_mask_l[8]),
	.sel1(fbdic_failover_mask[8]),
	.dout(mux_fbd_data[107:96]));

mcu_lndskw_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover_119_108     (
	.din0(fbd_data[119:108]),
	.din1(fbd_data[131:120]),
	.sel0(fbdic_failover_mask_l[9]),
	.sel1(fbdic_failover_mask[9]),
	.dout(mux_fbd_data[119:108]));

mcu_lndskw_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover_131_120     (
	.din0(fbd_data[131:120]),
	.din1(fbd_data[143:132]),
	.sel0(fbdic_failover_mask_l[10]),
	.sel1(fbdic_failover_mask[10]),
	.dout(mux_fbd_data[131:120]));

mcu_lndskw_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover_143_132     (
	.din0(fbd_data[143:132]),
	.din1(fbd_data[155:144]),
	.sel0(fbdic_failover_mask_l[11]),
	.sel1(fbdic_failover_mask[11]),
	.dout(mux_fbd_data[143:132]));

mcu_lndskw_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 m_mux_failover_155_144     (
	.din0(fbd_data[155:144]),
	.din1(fbd_data[167:156]),
	.sel0(fbdic_failover_mask_l[12]),
	.sel1(fbdic_failover_mask[12]),
	.dout(mux_fbd_data[155:144]));

assign mux_fbd_data[167:156] = fbd_data[167:156];

mcu_algnbf_dp algnbf0 ( // FS:wmr_protect
	.din(mux_fbd_data[11:0]),
	.dout(lndskw_data[11:0]),
	.ts0_hdr_match(lndskw_ts0_hdr_match[0]),
	.status_parity(lndskw_status_parity[0]),
	.idle_match(lndskw_idle_match[0]),
	.alert_match(lndskw_alert_match[0]),
	.alert_asserted(lndskw_alert_asserted[0]),
	.nbde(lndskw_nbde[0]),
	.thermal_trip(lndskw_thermal_trip[1:0]),
	.inc_rptr(fbdic_inc_rptr[0]),
	.inc_wptr(fbdic_inc_wptr),
	.clr_ptrs(fbdic_clr_ptrs),
	.lfsr_bit({2{fdout_idle_lfsr_0[0]}}),
	.wmr_scan_in(algnbf0_wmr_scanin),
	.wmr_scan_out(algnbf0_wmr_scanout),
	.scan_in(algnbf0_scanin),
	.scan_out(algnbf0_scanout),
	.drl2clk(drl2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .aclk_wmr(aclk_wmr)
);

mcu_algnbf_dp algnbf1 ( // FS:wmr_protect
	.din(mux_fbd_data[23:12]),
	.dout(lndskw_data[23:12]),
	.ts0_hdr_match(lndskw_ts0_hdr_match[1]),
	.status_parity(lndskw_status_parity[1]),
	.idle_match(lndskw_idle_match[1]),
	.alert_match(lndskw_alert_match[1]),
	.alert_asserted(lndskw_alert_asserted[1]),
	.nbde(lndskw_nbde[1]),
	.thermal_trip(lndskw_thermal_trip[3:2]),
	.inc_rptr(fbdic_inc_rptr[1]),
	.inc_wptr(fbdic_inc_wptr),
	.clr_ptrs(fbdic_clr_ptrs),
	.lfsr_bit({2{fdout_idle_lfsr[1]}}),
	.wmr_scan_in(algnbf1_wmr_scanin),
	.wmr_scan_out(algnbf1_wmr_scanout),
	.scan_in(algnbf1_scanin),
	.scan_out(algnbf1_scanout),
	.drl2clk(drl2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .aclk_wmr(aclk_wmr)
);

mcu_algnbf_dp algnbf2 ( // FS:wmr_protect
	.din(mux_fbd_data[35:24]),
	.dout(lndskw_data[35:24]),
	.ts0_hdr_match(lndskw_ts0_hdr_match[2]),
	.status_parity(lndskw_status_parity[2]),
	.idle_match(lndskw_idle_match[2]),
	.alert_match(lndskw_alert_match[2]),
	.alert_asserted(lndskw_alert_asserted[2]),
	.nbde(lndskw_nbde[2]),
	.thermal_trip(lndskw_thermal_trip[5:4]),
	.inc_rptr(fbdic_inc_rptr[2]),
	.inc_wptr(fbdic_inc_wptr),
	.clr_ptrs(fbdic_clr_ptrs),
	.lfsr_bit({2{fdout_idle_lfsr[2]}}),
	.wmr_scan_in(algnbf2_wmr_scanin),
	.wmr_scan_out(algnbf2_wmr_scanout),
	.scan_in(algnbf2_scanin),
	.scan_out(algnbf2_scanout),
	.drl2clk(drl2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .aclk_wmr(aclk_wmr)
);

mcu_algnbf_dp algnbf3 ( // FS:wmr_protect
	.din(mux_fbd_data[47:36]),
	.dout(lndskw_data[47:36]),
	.ts0_hdr_match(lndskw_ts0_hdr_match[3]),
	.status_parity(lndskw_status_parity[3]),
	.idle_match(lndskw_idle_match[3]),
	.alert_match(lndskw_alert_match[3]),
	.alert_asserted(lndskw_alert_asserted[3]),
	.nbde(lndskw_nbde[3]),
	.thermal_trip(lndskw_thermal_trip[7:6]),
	.inc_rptr(fbdic_inc_rptr[3]),
	.inc_wptr(fbdic_inc_wptr),
	.clr_ptrs(fbdic_clr_ptrs),
	.lfsr_bit({2{fdout_idle_lfsr[3]}}),
	.wmr_scan_in(algnbf3_wmr_scanin),
	.wmr_scan_out(algnbf3_wmr_scanout),
	.scan_in(algnbf3_scanin),
	.scan_out(algnbf3_scanout),
	.drl2clk(drl2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .aclk_wmr(aclk_wmr)
);

mcu_algnbf_dp algnbf4 ( // FS:wmr_protect
	.din(mux_fbd_data[59:48]),
	.dout(lndskw_data[59:48]),
	.ts0_hdr_match(lndskw_ts0_hdr_match[4]),
	.status_parity(lndskw_status_parity[4]),
	.idle_match(lndskw_idle_match[4]),
	.alert_match(lndskw_alert_match[4]),
	.alert_asserted(lndskw_alert_asserted[4]),
	.nbde(lndskw_nbde[4]),
	.thermal_trip(lndskw_thermal_trip[9:8]),
	.inc_rptr(fbdic_inc_rptr[4]),
	.inc_wptr(fbdic_inc_wptr),
	.clr_ptrs(fbdic_clr_ptrs),
	.lfsr_bit({2{fdout_idle_lfsr[4]}}),
	.wmr_scan_in(algnbf4_wmr_scanin),
	.wmr_scan_out(algnbf4_wmr_scanout),
	.scan_in(algnbf4_scanin),
	.scan_out(algnbf4_scanout),
	.drl2clk(drl2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .aclk_wmr(aclk_wmr)
);

mcu_algnbf_dp algnbf5 ( // FS:wmr_protect
	.din(mux_fbd_data[71:60]),
	.dout(lndskw_data[71:60]),
	.ts0_hdr_match(lndskw_ts0_hdr_match[5]),
	.status_parity(lndskw_status_parity[5]),
	.idle_match(lndskw_idle_match[5]),
	.alert_match(lndskw_alert_match[5]),
	.alert_asserted(lndskw_alert_asserted[5]),
	.nbde(lndskw_nbde[5]),
	.thermal_trip(lndskw_thermal_trip[11:10]),
	.inc_rptr(fbdic_inc_rptr[5]),
	.inc_wptr(fbdic_inc_wptr),
	.clr_ptrs(fbdic_clr_ptrs),
	.lfsr_bit({2{fdout_idle_lfsr[5]}}),
	.wmr_scan_in(algnbf5_wmr_scanin),
	.wmr_scan_out(algnbf5_wmr_scanout),
	.scan_in(algnbf5_scanin),
	.scan_out(algnbf5_scanout),
	.drl2clk(drl2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .aclk_wmr(aclk_wmr)
);

mcu_algnbf_dp algnbf6 ( // FS:wmr_protect
	.din(mux_fbd_data[83:72]),
	.dout(lndskw_data[83:72]),
	.ts0_hdr_match(lndskw_ts0_hdr_match[6]),
	.status_parity(lndskw_status_parity[6]),
	.idle_match(lndskw_idle_match[6]),
	.alert_match(lndskw_alert_match[6]),
	.alert_asserted(lndskw_alert_asserted[6]),
	.nbde(lndskw_nbde[6]),
	.thermal_trip(lndskw_thermal_trip[13:12]),
	.inc_rptr(fbdic_inc_rptr[6]),
	.inc_wptr(fbdic_inc_wptr),
	.clr_ptrs(fbdic_clr_ptrs),
	.lfsr_bit({2{fdout_idle_lfsr[6]}}),
	.wmr_scan_in(algnbf6_wmr_scanin),
	.wmr_scan_out(algnbf6_wmr_scanout),
	.scan_in(algnbf6_scanin),
	.scan_out(algnbf6_scanout),
	.drl2clk(drl2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .aclk_wmr(aclk_wmr)
);

mcu_algnbf_dp algnbf7 ( // FS:wmr_protect
	.din(mux_fbd_data[95:84]),
	.dout(lndskw_data[95:84]),
	.ts0_hdr_match(lndskw_ts0_hdr_match[7]),
	.status_parity(lndskw_status_parity[7]),
	.idle_match(lndskw_idle_match[7]),
	.alert_match(lndskw_alert_match[7]),
	.alert_asserted(lndskw_alert_asserted[7]),
	.nbde(lndskw_nbde[7]),
	.thermal_trip(lndskw_thermal_trip[15:14]),
	.inc_rptr(fbdic_inc_rptr[7]),
	.inc_wptr(fbdic_inc_wptr),
	.clr_ptrs(fbdic_clr_ptrs),
	.lfsr_bit({2{fdout_idle_lfsr[7]}}),
	.wmr_scan_in(algnbf7_wmr_scanin),
	.wmr_scan_out(algnbf7_wmr_scanout),
	.scan_in(algnbf7_scanin),
	.scan_out(algnbf7_scanout),
	.drl2clk(drl2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .aclk_wmr(aclk_wmr)
);

mcu_algnbf_dp algnbf8 ( // FS:wmr_protect
	.din(mux_fbd_data[107:96]),
	.dout(lndskw_data[107:96]),
	.ts0_hdr_match(lndskw_ts0_hdr_match[8]),
	.status_parity(lndskw_status_parity[8]),
	.idle_match(lndskw_idle_match[8]),
	.alert_match(lndskw_alert_match[8]),
	.alert_asserted(lndskw_alert_asserted[8]),
	.nbde(lndskw_nbde[8]),
	.thermal_trip(lndskw_thermal_trip[17:16]),
	.inc_rptr(fbdic_inc_rptr[8]),
	.inc_wptr(fbdic_inc_wptr),
	.clr_ptrs(fbdic_clr_ptrs),
	.lfsr_bit({2{fdout_idle_lfsr[8]}}),
	.wmr_scan_in(algnbf8_wmr_scanin),
	.wmr_scan_out(algnbf8_wmr_scanout),
	.scan_in(algnbf8_scanin),
	.scan_out(algnbf8_scanout),
	.drl2clk(drl2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .aclk_wmr(aclk_wmr)
);

mcu_algnbf_dp algnbf9 ( // FS:wmr_protect
	.din(mux_fbd_data[119:108]),
	.dout(lndskw_data[119:108]),
	.ts0_hdr_match(lndskw_ts0_hdr_match[9]),
	.status_parity(lndskw_status_parity[9]),
	.idle_match(lndskw_idle_match[9]),
	.alert_match(lndskw_alert_match[9]),
	.alert_asserted(lndskw_alert_asserted[9]),
	.nbde(lndskw_nbde[9]),
	.thermal_trip(lndskw_thermal_trip[19:18]),
	.inc_rptr(fbdic_inc_rptr[9]),
	.inc_wptr(fbdic_inc_wptr),
	.clr_ptrs(fbdic_clr_ptrs),
	.lfsr_bit({2{fdout_idle_lfsr[9]}}),
	.wmr_scan_in(algnbf9_wmr_scanin),
	.wmr_scan_out(algnbf9_wmr_scanout),
	.scan_in(algnbf9_scanin),
	.scan_out(algnbf9_scanout),
	.drl2clk(drl2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .aclk_wmr(aclk_wmr)
);

mcu_algnbf_dp algnbf10 ( // FS:wmr_protect
	.din(mux_fbd_data[131:120]),
	.dout(lndskw_data[131:120]),
	.ts0_hdr_match(lndskw_ts0_hdr_match[10]),
	.status_parity(lndskw_status_parity[10]),
	.idle_match(lndskw_idle_match[10]),
	.alert_match(lndskw_alert_match[10]),
	.alert_asserted(lndskw_alert_asserted[10]),
	.nbde(lndskw_nbde[10]),
	.thermal_trip(lndskw_thermal_trip[21:20]),
	.inc_rptr(fbdic_inc_rptr[10]),
	.inc_wptr(fbdic_inc_wptr),
	.clr_ptrs(fbdic_clr_ptrs),
	.lfsr_bit({2{fdout_idle_lfsr[10]}}),
	.wmr_scan_in(algnbf10_wmr_scanin),
	.wmr_scan_out(algnbf10_wmr_scanout),
	.scan_in(algnbf10_scanin),
	.scan_out(algnbf10_scanout),
	.drl2clk(drl2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .aclk_wmr(aclk_wmr)
);

mcu_algnbf_dp algnbf11 ( // FS:wmr_protect
	.din(mux_fbd_data[143:132]),
	.dout(lndskw_data[143:132]),
	.ts0_hdr_match(lndskw_ts0_hdr_match[11]),
	.status_parity(lndskw_status_parity[11]),
	.idle_match(lndskw_idle_match[11]),
	.alert_match(lndskw_alert_match[11]),
	.alert_asserted(lndskw_alert_asserted[11]),
	.nbde(lndskw_nbde[11]),
	.thermal_trip(lndskw_thermal_trip[23:22]),
	.inc_rptr(fbdic_inc_rptr[11]),
	.inc_wptr(fbdic_inc_wptr),
	.clr_ptrs(fbdic_clr_ptrs),
	.lfsr_bit({2{fdout_idle_lfsr[11]}}),
	.wmr_scan_in(algnbf11_wmr_scanin),
	.wmr_scan_out(algnbf11_wmr_scanout),
	.scan_in(algnbf11_scanin),
	.scan_out(algnbf11_scanout),
	.drl2clk(drl2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .aclk_wmr(aclk_wmr)
);

mcu_algnbf_dp algnbf12 ( // FS:wmr_protect
	.din(mux_fbd_data[155:144]),
	.dout(lndskw_data[155:144]),
	.ts0_hdr_match(lndskw_ts0_hdr_match[12]),
	.status_parity(lndskw_status_parity_unused[0]),
	.idle_match(lndskw_idle_match[12]),
	.alert_match(lndskw_alert_match[12]),
	.alert_asserted(lndskw_alert_asserted_unused[0]),
	.nbde(lndskw_nbde_unused[0]),
	.thermal_trip(lndskw_thermal_trip_unused[1:0]),
	.inc_rptr(fbdic_inc_rptr[12]),
	.inc_wptr(fbdic_inc_wptr),
	.clr_ptrs(fbdic_clr_ptrs),
	.lfsr_bit({fdout_idle_lfsr_l_0,fdout_idle_lfsr[0]}),
	.wmr_scan_in(algnbf12_wmr_scanin),
	.wmr_scan_out(algnbf12_wmr_scanout),
	.scan_in(algnbf12_scanin),
	.scan_out(algnbf12_scanout),
	.drl2clk(drl2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .aclk_wmr(aclk_wmr)
);

mcu_algnbf_dp algnbf13 ( // FS:wmr_protect
	.din(mux_fbd_data[167:156]),
	.dout(lndskw_data[167:156]),
	.ts0_hdr_match(lndskw_ts0_hdr_match[13]),
	.status_parity(lndskw_status_parity_unused[1]),
	.idle_match(lndskw_idle_match[13]),
	.alert_match(lndskw_alert_match[13]),
	.alert_asserted(lndskw_alert_asserted_unused[1]),
	.nbde(lndskw_nbde_unused[1]),
	.thermal_trip(lndskw_thermal_trip_unused[3:2]),
	.inc_rptr(fbdic_inc_rptr[13]),
	.inc_wptr(fbdic_inc_wptr),
	.clr_ptrs(fbdic_clr_ptrs),
	.lfsr_bit({2{fdout_idle_lfsr_0[1]}}),
	.wmr_scan_in(algnbf13_wmr_scanin),
	.wmr_scan_out(algnbf13_wmr_scanout),
	.scan_in(algnbf13_scanin),
	.scan_out(algnbf13_scanout),
	.drl2clk(drl2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .aclk_wmr(aclk_wmr)
);

// fixscan start:
assign algnbf0_scanin            = scan_in                  ;
assign algnbf1_scanin            = algnbf0_scanout          ;
assign algnbf2_scanin            = algnbf1_scanout          ;
assign algnbf3_scanin            = algnbf2_scanout          ;
assign algnbf4_scanin            = algnbf3_scanout          ;
assign algnbf5_scanin            = algnbf4_scanout          ;
assign algnbf6_scanin            = algnbf5_scanout          ;
assign algnbf7_scanin            = algnbf6_scanout          ;
assign algnbf8_scanin            = algnbf7_scanout          ;
assign algnbf9_scanin            = algnbf8_scanout          ;
assign algnbf10_scanin           = algnbf9_scanout          ;
assign algnbf11_scanin           = algnbf10_scanout         ;
assign algnbf12_scanin           = algnbf11_scanout         ;
assign algnbf13_scanin           = algnbf12_scanout         ;
assign scan_out                  = algnbf13_scanout         ;

assign algnbf0_wmr_scanin        = wmr_scan_in              ;
assign algnbf1_wmr_scanin        = algnbf0_wmr_scanout      ;
assign algnbf2_wmr_scanin        = algnbf1_wmr_scanout      ;
assign algnbf3_wmr_scanin        = algnbf2_wmr_scanout      ;
assign algnbf4_wmr_scanin        = algnbf3_wmr_scanout      ;
assign algnbf5_wmr_scanin        = algnbf4_wmr_scanout      ;
assign algnbf6_wmr_scanin        = algnbf5_wmr_scanout      ;
assign algnbf7_wmr_scanin        = algnbf6_wmr_scanout      ;
assign algnbf8_wmr_scanin        = algnbf7_wmr_scanout      ;
assign algnbf9_wmr_scanin        = algnbf8_wmr_scanout      ;
assign algnbf10_wmr_scanin       = algnbf9_wmr_scanout      ;
assign algnbf11_wmr_scanin       = algnbf10_wmr_scanout     ;
assign algnbf12_wmr_scanin       = algnbf11_wmr_scanout     ;
assign algnbf13_wmr_scanin       = algnbf12_wmr_scanout     ;
assign wmr_scan_out              = algnbf13_wmr_scanout     ;
// fixscan end:
endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_lndskw_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_12 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [11:0] din0;
  input sel0;
  input [11:0] din1;
  input sel1;
  output [11:0] dout;





mux2s #(12)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[11:0]),
  .in1(din1[11:0]),
.dout(dout[11:0])
);

endmodule


//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module mcu_lndskw_dp_cmp_macro__width_12 (
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





//
//   xor macro for ports = 2,3
//
//





module mcu_lndskw_dp_xor_macro__ports_3 (
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
//   invert macro
//
//





module mcu_lndskw_dp_inv_macro__width_2 (
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
//   and macro for ports = 2,3,4
//
//





module mcu_lndskw_dp_and_macro__width_1 (
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
//   and macro for ports = 2,3,4
//
//





module mcu_lndskw_dp_and_macro__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






and2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module mcu_lndskw_dp_or_macro__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






or2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule





//
//   increment macro 
//
//





module mcu_lndskw_dp_increment_macro__width_4 (
  din, 
  cin, 
  dout, 
  cout);
  input [3:0] din;
  input cin;
  output [3:0] dout;
  output cout;






incr #(4)  m0_0 (
.cin(cin),
.in(din[3:0]),
.out(dout[3:0]),
.cout(cout)
);











endmodule





//
//   invert macro
//
//





module mcu_lndskw_dp_inv_macro__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






inv #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module mcu_lndskw_dp_and_macro__ports_2__width_3 (
  din0, 
  din1, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  output [2:0] dout;






and2 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.out(dout[2:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module mcu_lndskw_dp_or_macro__ports_2__width_1 (
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
//   nor macro for ports = 2,3
//
//





module mcu_lndskw_dp_nor_macro__ports_3 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






nor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);







endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_lndskw_dp_mux_macro__mux_aonpe__ports_6__stack_12r__width_12 (
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

  input [11:0] din0;
  input sel0;
  input [11:0] din1;
  input sel1;
  input [11:0] din2;
  input sel2;
  input [11:0] din3;
  input sel3;
  input [11:0] din4;
  input sel4;
  input [11:0] din5;
  input sel5;
  output [11:0] dout;





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
mux6s #(12)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .in0(din0[11:0]),
  .in1(din1[11:0]),
  .in2(din2[11:0]),
  .in3(din3[11:0]),
  .in4(din4[11:0]),
  .in5(din5[11:0]),
.dout(dout[11:0])
);









  



endmodule


//  
//   and macro for ports = 2,3,4
//
//





module mcu_lndskw_dp_and_macro__ports_2__width_12 (
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









// any PARAMS parms go into naming of macro

module mcu_lndskw_dp_msff_macro__stack_12r__width_12 (
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
wire [10:0] so;

  input [11:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [11:0] dout;


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
dff #(12)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[11:0]),
.si({scan_in,so[10:0]}),
.so({so[10:0],scan_out}),
.q(dout[11:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module mcu_lndskw_dp_msff_macro__stack_12r__width_6 (
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








