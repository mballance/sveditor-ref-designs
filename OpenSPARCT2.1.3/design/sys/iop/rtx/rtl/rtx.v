// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rtx.v
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

// VPERL: PERL_BEG
//
// $VPERL_PORT_COMM = 1;
// #$VPERL_INST_COMM = 2;
//
//
// &MODULE ("rtx");
//
// &INSTANCE ("clkgen_rtx.v", "clkgen_rtx");
// &INSTANCE ("/vobs/neptune/design/niu/n2_lib/clkgen_rtx_io2x.v", "clkgen2x_rtx");
// &INSTANCE ("./rtx_n2_efuhdr3_p0_ctl.v", "efuhdr_ipp0");
// &INSTANCE ("./rtx_n2_efuhdr3_p1_ctl.v", "efuhdr_ipp1");
// &INSTANCE ("./rtx_n2_efuhdr1b_p0_ctl.v", "efuhdr_txc0_re");
// &INSTANCE ("./rtx_n2_efuhdr1a_p0_ctl.v", "efuhdr_txc0_st");
// &INSTANCE ("./rtx_n2_efuhdr1b_p1_ctl.v", "efuhdr_txc1_re");
// &INSTANCE ("./rtx_n2_efuhdr1a_p1_ctl.v", "efuhdr_txc1_st");
// &INSTANCE ("./rtx_n2_efuhdr6_ctl.v", "efuhdr_vlan");
// &INSTANCE ("./rtx_n2_efuhdr7_p0_ctl.v", "efuhdr_zcp0");
// &INSTANCE ("./rtx_n2_efuhdr7_p1_ctl.v", "efuhdr_zcp1");
// &INSTANCE ("gates/niu_rxc_shell.v.new", "rxc");
// &INSTANCE ("gates/niu_txc_shell.v.new", "txc");
// &INSTANCE ("rtx_dmo_mux.v", "rtx_dmo_mux");
// # &FORCE ("input", "ccu_io2x_out", "ccu_io_out");
// # I6.1 changes
// &FORCE ("input", "gl_rtx_io_out", "gl_rtx_io2x_out");
// &FORCE ("input", "cmp_gclk_c0_rtx");
// &FORCE ("input", "tcu_atpg_mode");
// &FORCE ("input", "tcu_wr_inhibit");
// &FORCE ("input", "meta_dmc_resp_trans_id[5:0]");

// &FORCE ("wire", "rtx_array_wr_inhibit");
// &FORCE ("wire","rtx_rxc_ipp0_mb3_mbist_scan_out");
// &FORCE ("wire","rtx_rxc_ipp1_mb3_mbist_scan_out");
// &FORCE ("wire","rtx_rxc_tcam_cntrl_mbist_scan_out");
// &FORCE ("wire","rtx_rxc_tcam_vlan_mbist_scan_out");
// &FORCE ("wire","rtx_rxc_zcp0_mb7_mbist_scan_out");
// &FORCE ("wire","rtx_rxc_zcp1_mb7_mbist_scan_out");
// &FORCE ("wire","rtx_txc_txe0_mbist_scan_out");
// &FORCE ("wire","niu_mb3_rx_data_fifo_scan_out");
// &FORCE ("wire","niu_mb4_rx_data_fifo_scan_out");
// &FORCE ("wire","niu_mb3_prebuf_header_scan_out");
// &FORCE ("wire","niu_mb4_prebuf_header_scan_out");
// &FORCE ("wire","niu_mb5_tcam_cntrl_scan_out");
// &FORCE ("wire","niu_mb6_tcam_array_scan_out");
// &FORCE ("wire","niu_mb6_vlan_scan_out");
// &FORCE ("wire","niu_mb7_cntrl_fifo_zcp_scan_out");
// &FORCE ("wire","efuhdr_ipp0_scan_out");
// &FORCE ("wire","efuhdr_ipp1_scan_out");
// &FORCE ("wire","efuhdr_txc0_re_scan_out");
// &FORCE ("wire","efuhdr_txc0_st_scan_out");
// &FORCE ("wire","efuhdr_txc1_re_scan_out");
// &FORCE ("wire","efuhdr_txc1_st_scan_out");
// &FORCE ("wire","efuhdr_vlan_scan_out");
// &FORCE ("wire","efuhdr_zcp0_scan_out");

// &FORCE ("input", "scan_in", "rtx_mbist_scan_in", "tcu_rtx_io_clk_stop", "rst_por_");
// &FORCE ("output", "scan_out", "rtx_mbist_scan_out");
// # New pins I6.1
// &CONNECT ("clkgen_rtx.gclk", "cmp_gclk_c0_rtx");
// &CONNECT ("clkgen_rtx.tcu_wr_inhibit", "tcu_wr_inhibit");
// &CONNECT ("clkgen_rtx.array_wr_inhibit", "rtx_array_wr_inhibit");
// &CONNECT ("clkgen_rtx.tcu_atpg_mode", "tcu_atpg_mode");
// &CONNECT ("clkgen2x_rtx.tcu_atpg_mode", "tcu_atpg_mode");
// &CONNECT ("clkgen2x_rtx.gclk", "cmp_gclk_c0_rtx");
// &CONNECT ("clkgen2x_rtx.array_wr_inhibit", "");
// &CONNECT ("clkgen2x_rtx.tcu_wr_inhibit", "1'b0");
// &CONNECT ("clkgen2x_rtx.tcu_atpg_mode", "tcu_atpg_mode");


// &CONNECT ("clkgen2x_rtx.l2clk", "l1clk_2x");
// &CONNECT ("clkgen2x_rtx.tcu_aclk", "aclk");
// &CONNECT ("clkgen2x_rtx.tcu_bclk", "bclk");
// &CONNECT ("clkgen2x_rtx.tcu_pce_ov", "pce_ov");
// &CONNECT ("clkgen2x_rtx.aclk", "");
// &CONNECT ("clkgen2x_rtx.bclk", "");
// &CONNECT ("clkgen2x_rtx.scan_out", "clkgen2x_rtx_scan_out");
// &CONNECT ("clkgen2x_rtx.wmr_protect", "");
// &CONNECT ("clkgen2x_rtx.aclk_wmr", "");
// &CONNECT ("clkgen2x_rtx.wmr_", "");
// &CONNECT ("clkgen2x_rtx.por_", "");
// &CONNECT ("clkgen2x_rtx.pce_ov", "");
// &CONNECT ("clkgen2x_rtx.cmp_slow_sync_en", "");
// &CONNECT ("clkgen2x_rtx.slow_cmp_sync_en", "");

// &CONNECT ("clkgen2x_rtx.ccu_serdes_dtm", "1'b0");
// &CONNECT ("clkgen2x_rtx.clk_ext", "1'b0");
// &CONNECT ("clkgen2x_rtx.tcu_clk_stop", "tcu_rtx_io_clk_stop");
// &CONNECT ("clkgen2x_rtx.rst_wmr_protect","1'b0");
// &CONNECT ("clkgen2x_rtx.rst_wmr_", "1'b1");
// &CONNECT ("clkgen2x_rtx.rst_por_", "rst_por_");
// &CONNECT ("clkgen2x_rtx.ccu_cmp_slow_sync_en", "1'b0");
// &CONNECT ("clkgen2x_rtx.ccu_slow_cmp_sync_en", "1'b0");
// &CONNECT ("clkgen2x_rtx.ccu_div_ph", "gl_rtx_io2x_out");
// &CONNECT ("clkgen2x_rtx.cluster_div_en","1'b1");
// &CONNECT ("clkgen2x_rtx.scan_en","tcu_scan_en");
// &CONNECT ("clkgen2x_rtx.scan_in","clkgen_rtx_scan_out");

// &CONNECT ("clkgen_rtx.l1clk", "l1clk");
// &CONNECT ("clkgen_rtx.scan_out", "clkgen_rtx_scan_out");
// &CONNECT ("clkgen_rtx.pce_ov", "pce_ov");
// &CONNECT ("clkgen_rtx.wmr_protect", "");
// &CONNECT ("clkgen_rtx.aclk_wmr", "");
// &CONNECT ("clkgen_rtx.wmr_", "");
// &CONNECT ("clkgen_rtx.por_", "reset_l");
// &CONNECT ("clkgen_rtx.cmp_slow_sync_en", "");
// &CONNECT ("clkgen_rtx.slow_cmp_sync_en", "");

// &CONNECT ("clkgen_rtx.tcu_clk_stop", "tcu_rtx_io_clk_stop");
// &CONNECT ("clkgen_rtx.rst_wmr_protect","1'b0");
// &CONNECT ("clkgen_rtx.rst_wmr_", "1'b1");
// &CONNECT ("clkgen_rtx.rst_por_", "rst_por_");
// # &CONNECT ("clkgen_rtx.ccu_cmp_slow_sync_en", "1'b0");
// # &CONNECT ("clkgen_rtx.ccu_slow_cmp_sync_en", "1'b0");
// &CONNECT ("clkgen_rtx.ccu_div_ph", "gl_rtx_io_out");
// &CONNECT ("clkgen_rtx.cluster_div_en","1'b1");
// &CONNECT ("clkgen_rtx.scan_en","tcu_scan_en");
// &CONNECT ("clkgen_rtx.scan_in","scan_in");

// &CONNECT ("rxc.tcu_aclk", "aclk");
// &CONNECT ("rxc.tcu_bclk", "bclk");
// &CONNECT ("rxc.niu_clk", "l1clk");
// &CONNECT ("rxc.iol2clk_2x", "l1clk_2x");
// &CONNECT ("txc.l2clk_2x", "l1clk_2x");
// &CONNECT ("txc.tcu_aclk", "aclk");
// &CONNECT ("txc.tcu_bclk", "bclk");
// &CONNECT ("txc.niu_clk", "l1clk");
// &CONNECT ("rxc.niu_reset_l", "reset_l");
// &CONNECT ("txc.niu_reset_l", "reset_l");
// &CONNECT ("rxc.rtx_rxc_ipp0_mb3_mbist_scan_in","rtx_mbist_scan_in");
// &CONNECT ("rxc.rtx_rxc_ipp1_mb3_mbist_scan_in","rtx_rxc_ipp0_mb3_mbist_scan_out");
// &CONNECT ("rxc.rtx_rxc_tcam_cntrl_mbist_scan_in","rtx_rxc_ipp1_mb3_mbist_scan_out");
// &CONNECT ("rxc.rtx_rxc_tcam_vlan_mbist_scan_in","rtx_rxc_tcam_cntrl_mbist_scan_out");
// &CONNECT ("rxc.rtx_rxc_zcp0_mb7_mbist_scan_in","rtx_rxc_tcam_vlan_mbist_scan_out");
// &CONNECT ("rxc.rtx_rxc_zcp1_mb7_mbist_scan_in","rtx_rxc_zcp0_mb7_mbist_scan_out");
// &CONNECT ("rxc.tcu_array_wr_inhibit", "rtx_array_wr_inhibit");
// &CONNECT ("txc.tcu_array_wr_inhibit", "rtx_array_wr_inhibit");
// &CONNECT ("txc.rtx_txc_txe0_mbist_scan_in","rtx_rxc_zcp1_mb7_mbist_scan_out");
// &CONNECT ("txc.rtx_txc_txe1_mbist_scan_in","rtx_txc_txe0_mbist_scan_out");
// &CONNECT ("txc.rtx_txc_txe1_mbist_scan_out","rtx_mbist_scan_out");


// &CONNECT ("efuhdr_ipp0.scan_out", "efuhdr_ipp0_scan_out");
// &CONNECT ("efuhdr_ipp1.scan_out", "efuhdr_ipp1_scan_out");
// &CONNECT ("efuhdr_txc0_re.scan_out", "efuhdr_txc0_re_scan_out");
// &CONNECT ("efuhdr_txc0_st.scan_out", "efuhdr_txc0_st_scan_out");
// &CONNECT ("efuhdr_txc1_re.scan_out", "efuhdr_txc1_re_scan_out");
// &CONNECT ("efuhdr_txc1_st.scan_out", "efuhdr_txc1_st_scan_out");
// &CONNECT ("efuhdr_vlan.scan_out", "efuhdr_vlan_scan_out");
// &CONNECT ("efuhdr_zcp0.scan_out", "efuhdr_zcp0_scan_out");
// &CONNECT ("efuhdr_zcp1.scan_out", "efuhdr_zcp1_scan_out");

// &CONNECT ("efuhdr_ipp0.scan_in","clkgen2x_rtx_scan_out");
// &CONNECT ("efuhdr_ipp1.scan_in","efuhdr_ipp0_scan_out");
// &CONNECT ("efuhdr_txc0_re.scan_in","efuhdr_ipp1_scan_out");
// &CONNECT ("efuhdr_txc0_st.scan_in","efuhdr_txc0_re_scan_out");
// &CONNECT ("efuhdr_txc1_re.scan_in","efuhdr_txc0_st_scan_out");
// &CONNECT ("efuhdr_txc1_st.scan_in","efuhdr_txc1_re_scan_out");
// &CONNECT ("efuhdr_vlan.scan_in","efuhdr_txc1_st_scan_out");
// &CONNECT ("efuhdr_zcp0.scan_in","efuhdr_vlan_scan_out");
// &CONNECT ("efuhdr_zcp1.scan_in","efuhdr_zcp0_scan_out");

// &CONNECT ("rxc.niu_mb3_rx_data_fifo_scan_in","efuhdr_zcp1_scan_out");
// &CONNECT ("rxc.niu_mb3_prebuf_header_scan_in","niu_mb3_rx_data_fifo_scan_out");
// &CONNECT ("rxc.niu_mb4_rx_data_fifo_scan_in","niu_mb3_prebuf_header_scan_out");
// &CONNECT ("rxc.niu_mb4_prebuf_header_scan_in","niu_mb4_rx_data_fifo_scan_out");
// &CONNECT ("rxc.niu_mb5_tcam_cntrl_scan_in","niu_mb4_prebuf_header_scan_out");
// &CONNECT ("rxc.niu_mb6_tcam_array_scan_in","niu_mb5_tcam_cntrl_scan_out");
// &CONNECT ("rxc.niu_mb6_vlan_scan_in","niu_mb6_tcam_array_scan_out");
// &CONNECT ("rxc.niu_mb7_cntrl_fifo_zcp_scan_in","niu_mb6_vlan_scan_out");
// &CONNECT ("rxc.niu_mb8_cntrl_fifo_zcp_scan_in","niu_mb7_cntrl_fifo_zcp_scan_out");
// &CONNECT ("rxc.niu_mb8_cntrl_fifo_zcp_scan_out","scan_out");

// &FORCE ("wire", "nc40[3:0]", "nc41[3:0]", "nc42[3:0]", "nc43[3:0]", "nc44[3:0]", "nc45[3:0]", "nc46[3:0]", "nc47[3:0]", "nc50[4:0]", "nc80[7:0]", "nc81[7:0]", "nc82[7:0]", "nc83[7:0]", "nc84[7:0]", "nc85[7:0]", "nc90[8:0]", "nc91[8:0]", "nc100[9:0]");
// &CONNECT ("efuhdr_ipp0.hdr_sram_rvalue","{nc40,hdr_sram_rvalue_ipp0[6:0]}");
// &CONNECT ("efuhdr_ipp1.hdr_sram_rvalue","{nc41,hdr_sram_rvalue_ipp1[6:0]}");
// &CONNECT ("efuhdr_txc0_re.hdr_sram_rvalue","{nc42,hdr_sram_rvalue_txc0_re[6:0]}");
// &CONNECT ("efuhdr_txc1_re.hdr_sram_rvalue","{nc43,hdr_sram_rvalue_txc1_re[6:0]}");
// &CONNECT ("efuhdr_txc0_st.hdr_sram_rvalue","{nc44,hdr_sram_rvalue_txc0_st[6:0]}");
// &CONNECT ("efuhdr_txc1_st.hdr_sram_rvalue","{nc45,hdr_sram_rvalue_txc1_st[6:0]}");
// &CONNECT ("efuhdr_vlan.hdr_sram_rvalue","{nc50,hdr_sram_rvalue_vlan[5:0]}");
// &CONNECT ("efuhdr_zcp0.hdr_sram_rvalue","{nc46,hdr_sram_rvalue_zcp0[6:0]}");
// &CONNECT ("efuhdr_zcp1.hdr_sram_rvalue","{nc47,hdr_sram_rvalue_zcp1[6:0]}");

// &CONNECT ("efuhdr_ipp0.hdr_sram_rid","{nc80,hdr_sram_rid_ipp0[2:0]}");
// &CONNECT ("efuhdr_ipp1.hdr_sram_rid","{nc81,hdr_sram_rid_ipp1[2:0]}");
// &CONNECT ("efuhdr_txc0_re.hdr_sram_rid","{nc82,hdr_sram_rid_txc0_re[2:0]}");
// &CONNECT ("efuhdr_txc1_re.hdr_sram_rid","{nc83,hdr_sram_rid_txc1_re[2:0]}");
// &CONNECT ("efuhdr_txc0_st.hdr_sram_rid","{nc84,hdr_sram_rid_txc0_st[2:0]}");
// &CONNECT ("efuhdr_txc1_st.hdr_sram_rid","{nc85,hdr_sram_rid_txc1_st[2:0]}");
// &CONNECT ("efuhdr_vlan.hdr_sram_rid","{nc100,hdr_sram_rid_vlan}");
// &CONNECT ("efuhdr_zcp0.hdr_sram_rid","{nc90,hdr_sram_rid_zcp0[1:0]}");
// &CONNECT ("efuhdr_zcp1.hdr_sram_rid","{nc91,hdr_sram_rid_zcp1[1:0]}");

// &CONNECT ("efuhdr_ipp0.hdr_sram_red_clr","hdr_sram_red_clr_ipp0");
// &CONNECT ("efuhdr_ipp1.hdr_sram_red_clr","hdr_sram_red_clr_ipp1");
// &CONNECT ("efuhdr_txc0_re.hdr_sram_red_clr","hdr_sram_red_clr_txc0_re");
// &CONNECT ("efuhdr_txc1_re.hdr_sram_red_clr","hdr_sram_red_clr_txc1_re");
// &CONNECT ("efuhdr_txc0_st.hdr_sram_red_clr","hdr_sram_red_clr_txc0_st");
// &CONNECT ("efuhdr_txc1_st.hdr_sram_red_clr","hdr_sram_red_clr_txc1_st");
// &CONNECT ("efuhdr_vlan.hdr_sram_red_clr","hdr_sram_red_clr_vlan");
// &CONNECT ("efuhdr_zcp0.hdr_sram_red_clr","hdr_sram_red_clr_zcp0");
// &CONNECT ("efuhdr_zcp1.hdr_sram_red_clr","hdr_sram_red_clr_zcp1");

// #&CONNECT ("rxc.tcu_clk_stop","tcu_rtx_io_clk_stop");
// #&CONNECT ("txc.tcu_clk_stop","tcu_rtx_io_clk_stop");
// &CONNECT ("efuhdr_ipp0.tcu_clk_stop","tcu_rtx_io_clk_stop");
// &CONNECT ("efuhdr_ipp1.tcu_clk_stop","tcu_rtx_io_clk_stop");
// &CONNECT ("efuhdr_txc0_re.tcu_clk_stop","tcu_rtx_io_clk_stop");
// &CONNECT ("efuhdr_txc1_re.tcu_clk_stop","tcu_rtx_io_clk_stop");
// &CONNECT ("efuhdr_txc0_st.tcu_clk_stop","tcu_rtx_io_clk_stop");
// &CONNECT ("efuhdr_txc1_st.tcu_clk_stop","tcu_rtx_io_clk_stop");
// &CONNECT ("efuhdr_vlan.tcu_clk_stop","tcu_rtx_io_clk_stop");
// &CONNECT ("efuhdr_zcp0.tcu_clk_stop","tcu_rtx_io_clk_stop");
// &CONNECT ("efuhdr_zcp1.tcu_clk_stop","tcu_rtx_io_clk_stop");


// &CONNECT ("efuhdr_ipp0.hdr_sram_wr_en","hdr_sram_wr_en_ipp0");
// &CONNECT ("efuhdr_ipp1.hdr_sram_wr_en","hdr_sram_wr_en_ipp1");
// &CONNECT ("efuhdr_txc0_re.hdr_sram_wr_en","hdr_sram_wr_en_txc0_re");
// &CONNECT ("efuhdr_txc1_re.hdr_sram_wr_en","hdr_sram_wr_en_txc1_re");
// &CONNECT ("efuhdr_txc0_st.hdr_sram_wr_en","hdr_sram_wr_en_txc0_st");
// &CONNECT ("efuhdr_txc1_st.hdr_sram_wr_en","hdr_sram_wr_en_txc1_st");
// &CONNECT ("efuhdr_vlan.hdr_sram_wr_en","hdr_sram_wr_en_vlan");
// &CONNECT ("efuhdr_zcp0.hdr_sram_wr_en","hdr_sram_wr_en_zcp0");
// &CONNECT ("efuhdr_zcp1.hdr_sram_wr_en","hdr_sram_wr_en_zcp1");

// &CONNECT ("efuhdr_ipp0.sram_hdr_read_data","{4'b0,sram_hdr_read_data_ipp0[6:0]}");
// &CONNECT ("efuhdr_ipp1.sram_hdr_read_data","{4'b0,sram_hdr_read_data_ipp1[6:0]}");
// &CONNECT ("efuhdr_txc0_re.sram_hdr_read_data","{4'b0,sram_hdr_read_data_txc0_re[6:0]}");
// &CONNECT ("efuhdr_txc1_re.sram_hdr_read_data","{4'b0,sram_hdr_read_data_txc1_re[6:0]}");
// &CONNECT ("efuhdr_txc0_st.sram_hdr_read_data","{4'b0,sram_hdr_read_data_txc0_st[6:0]}");
// &CONNECT ("efuhdr_txc1_st.sram_hdr_read_data","{4'b0,sram_hdr_read_data_txc1_st[6:0]}");
// &CONNECT ("efuhdr_vlan.sram_hdr_read_data","{5'b0,sram_hdr_read_data_vlan[5:0]}");
// &CONNECT ("efuhdr_zcp0.sram_hdr_read_data","{4'b0,sram_hdr_read_data_zcp0[6:0]}");
// &CONNECT ("efuhdr_zcp1.sram_hdr_read_data","{4'b0,sram_hdr_read_data_zcp1[6:0]}");

// &CONNECT ("efuhdr_ipp0.l2clk","l1clk");
// &CONNECT ("efuhdr_ipp1.l2clk","l1clk");
// &CONNECT ("efuhdr_txc0_re.l2clk","l1clk");
// &CONNECT ("efuhdr_txc0_st.l2clk","l1clk");
// &CONNECT ("efuhdr_txc1_re.l2clk","l1clk");
// &CONNECT ("efuhdr_txc1_st.l2clk","l1clk");
// &CONNECT ("efuhdr_vlan.l2clk","l1clk");
// &CONNECT ("efuhdr_zcp0.l2clk","l1clk");
// &CONNECT ("efuhdr_zcp1.l2clk","l1clk");

// &CONNECT ("efuhdr_ipp0.tcu_aclk","aclk");
// &CONNECT ("efuhdr_ipp1.tcu_aclk","aclk");
// &CONNECT ("efuhdr_txc0_re.tcu_aclk","aclk");
// &CONNECT ("efuhdr_txc0_st.tcu_aclk","aclk");
// &CONNECT ("efuhdr_txc1_re.tcu_aclk","aclk");
// &CONNECT ("efuhdr_txc1_st.tcu_aclk","aclk");
// &CONNECT ("efuhdr_vlan.tcu_aclk","aclk");
// &CONNECT ("efuhdr_zcp0.tcu_aclk","aclk");
// &CONNECT ("efuhdr_zcp1.tcu_aclk","aclk");

// &CONNECT ("efuhdr_ipp0.tcu_bclk","bclk");
// &CONNECT ("efuhdr_ipp1.tcu_bclk","bclk");
// &CONNECT ("efuhdr_txc0_re.tcu_bclk","bclk");
// &CONNECT ("efuhdr_txc0_st.tcu_bclk","bclk");
// &CONNECT ("efuhdr_txc1_re.tcu_bclk","bclk");
// &CONNECT ("efuhdr_txc1_st.tcu_bclk","bclk");
// &CONNECT ("efuhdr_vlan.tcu_bclk","bclk");
// &CONNECT ("efuhdr_zcp0.tcu_bclk","bclk");
// &CONNECT ("efuhdr_zcp1.tcu_bclk","bclk");



// &CONNECT ("efuhdr_ipp0.efu_hdr_write_data","efu_niu_mac01_sfro_data");
// &CONNECT ("efuhdr_ipp0.efu_hdr_xfer_en","efu_niu_ipp0_xfer_en");
// &CONNECT ("efuhdr_ipp0.efu_hdr_clr","efu_niu_ipp0_clr");
// &CONNECT ("efuhdr_ipp0.hdr_efu_read_data","niu_efu_ipp0_data");
// &CONNECT ("efuhdr_ipp0.hdr_efu_xfer_en","niu_efu_ipp0_xfer_en");

// &CONNECT ("efuhdr_ipp1.efu_hdr_write_data","efu_niu_mac01_sfro_data");
// &CONNECT ("efuhdr_ipp1.efu_hdr_xfer_en","efu_niu_ipp1_xfer_en");
// &CONNECT ("efuhdr_ipp1.efu_hdr_clr","efu_niu_ipp1_clr");
// &CONNECT ("efuhdr_ipp1.hdr_efu_read_data","niu_efu_ipp1_data");
// &CONNECT ("efuhdr_ipp1.hdr_efu_xfer_en","niu_efu_ipp1_xfer_en");

// &CONNECT ("efuhdr_txc0_re.efu_hdr_write_data","efu_niu_mac01_sfro_data");
// &CONNECT ("efuhdr_txc0_re.efu_hdr_xfer_en","efu_niu_mac0_ro_xfer_en");
// &CONNECT ("efuhdr_txc0_re.efu_hdr_clr","efu_niu_mac0_ro_clr");
// &CONNECT ("efuhdr_txc0_re.hdr_efu_read_data","niu_efu_mac0_ro_data");
// &CONNECT ("efuhdr_txc0_re.hdr_efu_xfer_en","niu_efu_mac0_ro_xfer_en");

// &CONNECT ("efuhdr_txc0_st.efu_hdr_write_data","efu_niu_mac01_sfro_data");
// &CONNECT ("efuhdr_txc0_st.efu_hdr_xfer_en","efu_niu_mac0_sf_xfer_en");
// &CONNECT ("efuhdr_txc0_st.efu_hdr_clr","efu_niu_mac0_sf_clr");
// &CONNECT ("efuhdr_txc0_st.hdr_efu_read_data","niu_efu_mac0_sf_data");
// &CONNECT ("efuhdr_txc0_st.hdr_efu_xfer_en","niu_efu_mac0_sf_xfer_en");

// &CONNECT ("efuhdr_txc1_re.efu_hdr_write_data","efu_niu_mac01_sfro_data");
// &CONNECT ("efuhdr_txc1_re.efu_hdr_xfer_en","efu_niu_mac1_ro_xfer_en");
// &CONNECT ("efuhdr_txc1_re.efu_hdr_clr","efu_niu_mac1_ro_clr");
// &CONNECT ("efuhdr_txc1_re.hdr_efu_read_data","niu_efu_mac1_ro_data");
// &CONNECT ("efuhdr_txc1_re.hdr_efu_xfer_en","niu_efu_mac1_ro_xfer_en");

// &CONNECT ("efuhdr_txc1_st.efu_hdr_write_data","efu_niu_mac01_sfro_data");
// &CONNECT ("efuhdr_txc1_st.efu_hdr_xfer_en","efu_niu_mac1_sf_xfer_en");
// &CONNECT ("efuhdr_txc1_st.efu_hdr_clr","efu_niu_mac1_sf_clr");
// &CONNECT ("efuhdr_txc1_st.hdr_efu_read_data","niu_efu_mac1_sf_data");
// &CONNECT ("efuhdr_txc1_st.hdr_efu_xfer_en","niu_efu_mac1_sf_xfer_en");

// &CONNECT ("efuhdr_vlan.efu_hdr_write_data","efu_niu_4k_data");
// &CONNECT ("efuhdr_vlan.efu_hdr_xfer_en","efu_niu_4k_xfer_en");
// &CONNECT ("efuhdr_vlan.efu_hdr_clr","efu_niu_4k_clr");
// &CONNECT ("efuhdr_vlan.hdr_efu_read_data","niu_efu_4k_data");
// &CONNECT ("efuhdr_vlan.hdr_efu_xfer_en","niu_efu_4k_xfer_en");

// &CONNECT ("efuhdr_zcp0.efu_hdr_write_data","efu_niu_cfifo_data");
// &CONNECT ("efuhdr_zcp0.efu_hdr_xfer_en","efu_niu_cfifo0_xfer_en");
// &CONNECT ("efuhdr_zcp0.efu_hdr_clr","efu_niu_cfifo0_clr");
// &CONNECT ("efuhdr_zcp0.hdr_efu_read_data","niu_efu_cfifo0_data");
// &CONNECT ("efuhdr_zcp0.hdr_efu_xfer_en","niu_efu_cfifo0_xfer_en");

// &CONNECT ("efuhdr_zcp1.efu_hdr_write_data","efu_niu_cfifo_data");
// &CONNECT ("efuhdr_zcp1.efu_hdr_xfer_en","efu_niu_cfifo1_xfer_en");
// &CONNECT ("efuhdr_zcp1.efu_hdr_clr","efu_niu_cfifo1_clr");
// &CONNECT ("efuhdr_zcp1.hdr_efu_read_data","niu_efu_cfifo1_data");
// &CONNECT ("efuhdr_zcp1.hdr_efu_xfer_en","niu_efu_cfifo1_xfer_en");
// &CONNECT ("rtx_dmo_mux.in0", "rtx_txc_txe0_dmo_dout");
// &CONNECT ("rtx_dmo_mux.in1", "rtx_txc_txe1_dmo_dout");
// &CONNECT ("rtx_dmo_mux.in2", "rtx_rxc_ipp0_mb3_dmo_dout");
// &CONNECT ("rtx_dmo_mux.in3", "rtx_rxc_ipp1_mb3_dmo_dout");
// &CONNECT ("rtx_dmo_mux.in4", "rtx_rxc_zcp0_mb7_dmo_dout");
// &CONNECT ("rtx_dmo_mux.in5", "rtx_rxc_zcp1_mb7_dmo_dout");
// &CONNECT ("rtx_dmo_mux.in6", "rtx_rxc_vlan_mb6_dmo_dout");
// &CONNECT ("rtx_dmo_mux.out", "rtx_tcu_dmo_data_out[39:0]");
// &CONNECT ("rtx_dmo_mux.sel", "tcu_rtx_dmo_ctl[2:0]");
// &CONNECT ("rtx_dmo_mux.clk", "l1clk");
// &CONNECT ("txc.meta_dmc_resp_transID", "meta_dmc_resp_trans_id[5:0]");

// VPERL: PERL_END
// VPERL: GENERATED_BEG

module rtx (
    arb1_txc_req_accept,
    arb1_txc_req_transid,
    cluster_arst_l,
    cmp_gclk_c0_rtx,
    dmc_ipp_dat_req0,
    dmc_ipp_dat_req1,
    dmc_txc_dma0_active,
    dmc_txc_dma0_cacheready,
    dmc_txc_dma0_descriptor,
    dmc_txc_dma0_eoflist,
    dmc_txc_dma0_error,
    dmc_txc_dma0_func_num,
    dmc_txc_dma0_gotnxtdesc,
    dmc_txc_dma0_page_handle,
    dmc_txc_dma0_partial,
    dmc_txc_dma0_reset_scheduled,
    dmc_txc_dma10_active,
    dmc_txc_dma10_cacheready,
    dmc_txc_dma10_descriptor,
    dmc_txc_dma10_eoflist,
    dmc_txc_dma10_error,
    dmc_txc_dma10_func_num,
    dmc_txc_dma10_gotnxtdesc,
    dmc_txc_dma10_page_handle,
    dmc_txc_dma10_partial,
    dmc_txc_dma10_reset_scheduled,
    dmc_txc_dma11_active,
    dmc_txc_dma11_cacheready,
    dmc_txc_dma11_descriptor,
    dmc_txc_dma11_eoflist,
    dmc_txc_dma11_error,
    dmc_txc_dma11_func_num,
    dmc_txc_dma11_gotnxtdesc,
    dmc_txc_dma11_page_handle,
    dmc_txc_dma11_partial,
    dmc_txc_dma11_reset_scheduled,
    dmc_txc_dma12_active,
    dmc_txc_dma12_cacheready,
    dmc_txc_dma12_descriptor,
    dmc_txc_dma12_eoflist,
    dmc_txc_dma12_error,
    dmc_txc_dma12_func_num,
    dmc_txc_dma12_gotnxtdesc,
    dmc_txc_dma12_page_handle,
    dmc_txc_dma12_partial,
    dmc_txc_dma12_reset_scheduled,
    dmc_txc_dma13_active,
    dmc_txc_dma13_cacheready,
    dmc_txc_dma13_descriptor,
    dmc_txc_dma13_eoflist,
    dmc_txc_dma13_error,
    dmc_txc_dma13_func_num,
    dmc_txc_dma13_gotnxtdesc,
    dmc_txc_dma13_page_handle,
    dmc_txc_dma13_partial,
    dmc_txc_dma13_reset_scheduled,
    dmc_txc_dma14_active,
    dmc_txc_dma14_cacheready,
    dmc_txc_dma14_descriptor,
    dmc_txc_dma14_eoflist,
    dmc_txc_dma14_error,
    dmc_txc_dma14_func_num,
    dmc_txc_dma14_gotnxtdesc,
    dmc_txc_dma14_page_handle,
    dmc_txc_dma14_partial,
    dmc_txc_dma14_reset_scheduled,
    dmc_txc_dma15_active,
    dmc_txc_dma15_cacheready,
    dmc_txc_dma15_descriptor,
    dmc_txc_dma15_eoflist,
    dmc_txc_dma15_error,
    dmc_txc_dma15_func_num,
    dmc_txc_dma15_gotnxtdesc,
    dmc_txc_dma15_page_handle,
    dmc_txc_dma15_partial,
    dmc_txc_dma15_reset_scheduled,
    dmc_txc_dma1_active,
    dmc_txc_dma1_cacheready,
    dmc_txc_dma1_descriptor,
    dmc_txc_dma1_eoflist,
    dmc_txc_dma1_error,
    dmc_txc_dma1_func_num,
    dmc_txc_dma1_gotnxtdesc,
    dmc_txc_dma1_page_handle,
    dmc_txc_dma1_partial,
    dmc_txc_dma1_reset_scheduled,
    dmc_txc_dma2_active,
    dmc_txc_dma2_cacheready,
    dmc_txc_dma2_descriptor,
    dmc_txc_dma2_eoflist,
    dmc_txc_dma2_error,
    dmc_txc_dma2_func_num,
    dmc_txc_dma2_gotnxtdesc,
    dmc_txc_dma2_page_handle,
    dmc_txc_dma2_partial,
    dmc_txc_dma2_reset_scheduled,
    dmc_txc_dma3_active,
    dmc_txc_dma3_cacheready,
    dmc_txc_dma3_descriptor,
    dmc_txc_dma3_eoflist,
    dmc_txc_dma3_error,
    dmc_txc_dma3_func_num,
    dmc_txc_dma3_gotnxtdesc,
    dmc_txc_dma3_page_handle,
    dmc_txc_dma3_partial,
    dmc_txc_dma3_reset_scheduled,
    dmc_txc_dma4_active,
    dmc_txc_dma4_cacheready,
    dmc_txc_dma4_descriptor,
    dmc_txc_dma4_eoflist,
    dmc_txc_dma4_error,
    dmc_txc_dma4_func_num,
    dmc_txc_dma4_gotnxtdesc,
    dmc_txc_dma4_page_handle,
    dmc_txc_dma4_partial,
    dmc_txc_dma4_reset_scheduled,
    dmc_txc_dma5_active,
    dmc_txc_dma5_cacheready,
    dmc_txc_dma5_descriptor,
    dmc_txc_dma5_eoflist,
    dmc_txc_dma5_error,
    dmc_txc_dma5_func_num,
    dmc_txc_dma5_gotnxtdesc,
    dmc_txc_dma5_page_handle,
    dmc_txc_dma5_partial,
    dmc_txc_dma5_reset_scheduled,
    dmc_txc_dma6_active,
    dmc_txc_dma6_cacheready,
    dmc_txc_dma6_descriptor,
    dmc_txc_dma6_eoflist,
    dmc_txc_dma6_error,
    dmc_txc_dma6_func_num,
    dmc_txc_dma6_gotnxtdesc,
    dmc_txc_dma6_page_handle,
    dmc_txc_dma6_partial,
    dmc_txc_dma6_reset_scheduled,
    dmc_txc_dma7_active,
    dmc_txc_dma7_cacheready,
    dmc_txc_dma7_descriptor,
    dmc_txc_dma7_eoflist,
    dmc_txc_dma7_error,
    dmc_txc_dma7_func_num,
    dmc_txc_dma7_gotnxtdesc,
    dmc_txc_dma7_page_handle,
    dmc_txc_dma7_partial,
    dmc_txc_dma7_reset_scheduled,
    dmc_txc_dma8_active,
    dmc_txc_dma8_cacheready,
    dmc_txc_dma8_descriptor,
    dmc_txc_dma8_eoflist,
    dmc_txc_dma8_error,
    dmc_txc_dma8_func_num,
    dmc_txc_dma8_gotnxtdesc,
    dmc_txc_dma8_page_handle,
    dmc_txc_dma8_partial,
    dmc_txc_dma8_reset_scheduled,
    dmc_txc_dma9_active,
    dmc_txc_dma9_cacheready,
    dmc_txc_dma9_descriptor,
    dmc_txc_dma9_eoflist,
    dmc_txc_dma9_error,
    dmc_txc_dma9_func_num,
    dmc_txc_dma9_gotnxtdesc,
    dmc_txc_dma9_page_handle,
    dmc_txc_dma9_partial,
    dmc_txc_dma9_reset_scheduled,
    dmc_txc_tx_addr_md,
    dmc_zcp_req0,
    dmc_zcp_req1,
    efu_niu_4k_clr,
    efu_niu_4k_data,
    efu_niu_4k_xfer_en,
    efu_niu_cfifo0_clr,
    efu_niu_cfifo0_xfer_en,
    efu_niu_cfifo1_clr,
    efu_niu_cfifo1_xfer_en,
    efu_niu_cfifo_data,
    efu_niu_ipp0_clr,
    efu_niu_ipp0_xfer_en,
    efu_niu_ipp1_clr,
    efu_niu_ipp1_xfer_en,
    efu_niu_mac01_sfro_data,
    efu_niu_mac0_ro_clr,
    efu_niu_mac0_ro_xfer_en,
    efu_niu_mac0_sf_clr,
    efu_niu_mac0_sf_xfer_en,
    efu_niu_mac1_ro_clr,
    efu_niu_mac1_ro_xfer_en,
    efu_niu_mac1_sf_clr,
    efu_niu_mac1_sf_xfer_en,
    gl_rtx_io2x_out,
    gl_rtx_io_out,
    mac_rxc_ack0,
    mac_rxc_ack1,
    mac_rxc_ctrl0,
    mac_rxc_ctrl1,
    mac_rxc_data0,
    mac_rxc_data1,
    mac_rxc_stat0,
    mac_rxc_stat1,
    mac_rxc_tag0,
    mac_rxc_tag1,
    mac_txc_req0,
    mac_txc_req1,
    meta_dmc_data,
    meta_dmc_data_valid,
    meta_dmc_resp_address,
    meta_dmc_resp_byteenable,
    meta_dmc_resp_client,
    meta_dmc_resp_cmd,
    meta_dmc_resp_cmd_status,
    meta_dmc_resp_complete,
    meta_dmc_resp_data_status,
    meta_dmc_resp_dma_num,
    meta_dmc_resp_length,
    meta_dmc_resp_port_num,
    meta_dmc_resp_ready,
    meta_dmc_resp_trans_id,
    meta_dmc_resp_transfer_cmpl,
    pio_clients_addr,
    pio_clients_rd,
    pio_clients_wdata,
    pio_fflp_sel,
    pio_ipp_sel,
    pio_txc_sel,
    pio_zcp_sel,
    rst_por_,
    rtx_mbist_scan_in,
    scan_in,
    tcu_aclk,
    tcu_atpg_mode,
    tcu_bclk,
    tcu_div_bypass,
    tcu_mbist_bisi_en,
    tcu_mbist_user_mode,
    tcu_pce_ov,
    tcu_rtx_dmo_ctl,
    tcu_rtx_io_clk_stop,
    tcu_rtx_rxc_ipp0_mbist_start,
    tcu_rtx_rxc_ipp1_mbist_start,
    tcu_rtx_rxc_mb5_mbist_start,
    tcu_rtx_rxc_mb6_mbist_start,
    tcu_rtx_rxc_zcp0_mbist_start,
    tcu_rtx_rxc_zcp1_mbist_start,
    tcu_rtx_txc_txe0_mbist_start,
    tcu_rtx_txc_txe1_mbist_start,
    tcu_scan_en,
    tcu_se_scancollar_in,
    tcu_se_scancollar_out,
    tcu_wr_inhibit,
    dmc_meta_resp_accept,
    fflp_debug_port,
    fflp_pio_ack,
    fflp_pio_err,
    fflp_pio_intr,
    fflp_pio_rdata,
    ipp_debug_port,
    ipp_dmc_dat_ack0,
    ipp_dmc_dat_ack1,
    ipp_dmc_dat_err0,
    ipp_dmc_dat_err1,
    ipp_dmc_data0,
    ipp_dmc_data1,
    ipp_dmc_ful_pkt0,
    ipp_dmc_ful_pkt1,
    ipp_pio_ack,
    ipp_pio_err,
    ipp_pio_intr,
    ipp_pio_rdata,
    niu_efu_4k_data,
    niu_efu_4k_xfer_en,
    niu_efu_cfifo0_data,
    niu_efu_cfifo0_xfer_en,
    niu_efu_cfifo1_data,
    niu_efu_cfifo1_xfer_en,
    niu_efu_ipp0_data,
    niu_efu_ipp0_xfer_en,
    niu_efu_ipp1_data,
    niu_efu_ipp1_xfer_en,
    niu_efu_mac0_ro_data,
    niu_efu_mac0_ro_xfer_en,
    niu_efu_mac0_sf_data,
    niu_efu_mac0_sf_xfer_en,
    niu_efu_mac1_ro_data,
    niu_efu_mac1_ro_xfer_en,
    niu_efu_mac1_sf_data,
    niu_efu_mac1_sf_xfer_en,
    niu_txc_interrupts,
    rtx_mbist_scan_out,
    rtx_rxc_ipp0_tcu_mbist_done,
    rtx_rxc_ipp0_tcu_mbist_fail,
    rtx_rxc_ipp1_tcu_mbist_done,
    rtx_rxc_ipp1_tcu_mbist_fail,
    rtx_rxc_mb5_tcu_mbist_done,
    rtx_rxc_mb5_tcu_mbist_fail,
    rtx_rxc_mb6_tcu_mbist_done,
    rtx_rxc_mb6_tcu_mbist_fail,
    rtx_rxc_zcp0_tcu_mbist_done,
    rtx_rxc_zcp0_tcu_mbist_fail,
    rtx_rxc_zcp1_tcu_mbist_done,
    rtx_rxc_zcp1_tcu_mbist_fail,
    rtx_tcu_dmo_data_out,
    rtx_txc_txe0_tcu_mbist_done,
    rtx_txc_txe0_tcu_mbist_fail,
    rtx_txc_txe1_tcu_mbist_done,
    rtx_txc_txe1_tcu_mbist_fail,
    rxc_mac_req0,
    rxc_mac_req1,
    scan_out,
    txc_arb1_req,
    txc_arb1_req_address,
    txc_arb1_req_cmd,
    txc_arb1_req_dma_num,
    txc_arb1_req_func_num,
    txc_arb1_req_length,
    txc_arb1_req_port_num,
    txc_debug_port,
    txc_dmc_dma0_getnxtdesc,
    txc_dmc_dma0_inc_head,
    txc_dmc_dma0_inc_pkt_cnt,
    txc_dmc_dma0_mark_bit,
    txc_dmc_dma0_reset_done,
    txc_dmc_dma10_getnxtdesc,
    txc_dmc_dma10_inc_head,
    txc_dmc_dma10_inc_pkt_cnt,
    txc_dmc_dma10_mark_bit,
    txc_dmc_dma10_reset_done,
    txc_dmc_dma11_getnxtdesc,
    txc_dmc_dma11_inc_head,
    txc_dmc_dma11_inc_pkt_cnt,
    txc_dmc_dma11_mark_bit,
    txc_dmc_dma11_reset_done,
    txc_dmc_dma12_getnxtdesc,
    txc_dmc_dma12_inc_head,
    txc_dmc_dma12_inc_pkt_cnt,
    txc_dmc_dma12_mark_bit,
    txc_dmc_dma12_reset_done,
    txc_dmc_dma13_getnxtdesc,
    txc_dmc_dma13_inc_head,
    txc_dmc_dma13_inc_pkt_cnt,
    txc_dmc_dma13_mark_bit,
    txc_dmc_dma13_reset_done,
    txc_dmc_dma14_getnxtdesc,
    txc_dmc_dma14_inc_head,
    txc_dmc_dma14_inc_pkt_cnt,
    txc_dmc_dma14_mark_bit,
    txc_dmc_dma14_reset_done,
    txc_dmc_dma15_getnxtdesc,
    txc_dmc_dma15_inc_head,
    txc_dmc_dma15_inc_pkt_cnt,
    txc_dmc_dma15_mark_bit,
    txc_dmc_dma15_reset_done,
    txc_dmc_dma1_getnxtdesc,
    txc_dmc_dma1_inc_head,
    txc_dmc_dma1_inc_pkt_cnt,
    txc_dmc_dma1_mark_bit,
    txc_dmc_dma1_reset_done,
    txc_dmc_dma2_getnxtdesc,
    txc_dmc_dma2_inc_head,
    txc_dmc_dma2_inc_pkt_cnt,
    txc_dmc_dma2_mark_bit,
    txc_dmc_dma2_reset_done,
    txc_dmc_dma3_getnxtdesc,
    txc_dmc_dma3_inc_head,
    txc_dmc_dma3_inc_pkt_cnt,
    txc_dmc_dma3_mark_bit,
    txc_dmc_dma3_reset_done,
    txc_dmc_dma4_getnxtdesc,
    txc_dmc_dma4_inc_head,
    txc_dmc_dma4_inc_pkt_cnt,
    txc_dmc_dma4_mark_bit,
    txc_dmc_dma4_reset_done,
    txc_dmc_dma5_getnxtdesc,
    txc_dmc_dma5_inc_head,
    txc_dmc_dma5_inc_pkt_cnt,
    txc_dmc_dma5_mark_bit,
    txc_dmc_dma5_reset_done,
    txc_dmc_dma6_getnxtdesc,
    txc_dmc_dma6_inc_head,
    txc_dmc_dma6_inc_pkt_cnt,
    txc_dmc_dma6_mark_bit,
    txc_dmc_dma6_reset_done,
    txc_dmc_dma7_getnxtdesc,
    txc_dmc_dma7_inc_head,
    txc_dmc_dma7_inc_pkt_cnt,
    txc_dmc_dma7_mark_bit,
    txc_dmc_dma7_reset_done,
    txc_dmc_dma8_getnxtdesc,
    txc_dmc_dma8_inc_head,
    txc_dmc_dma8_inc_pkt_cnt,
    txc_dmc_dma8_mark_bit,
    txc_dmc_dma8_reset_done,
    txc_dmc_dma9_getnxtdesc,
    txc_dmc_dma9_inc_head,
    txc_dmc_dma9_inc_pkt_cnt,
    txc_dmc_dma9_mark_bit,
    txc_dmc_dma9_reset_done,
    txc_dmc_dma_nack_pkt_rd,
    txc_dmc_nack_pkt_rd,
    txc_dmc_nack_pkt_rd_addr,
    txc_dmc_p0_dma_pkt_size_err,
    txc_dmc_p0_pkt_size_err,
    txc_dmc_p0_pkt_size_err_addr,
    txc_dmc_p1_dma_pkt_size_err,
    txc_dmc_p1_pkt_size_err,
    txc_dmc_p1_pkt_size_err_addr,
    txc_mac_abort0,
    txc_mac_abort1,
    txc_mac_ack0,
    txc_mac_ack1,
    txc_mac_data0,
    txc_mac_data1,
    txc_mac_stat0,
    txc_mac_stat1,
    txc_mac_tag0,
    txc_mac_tag1,
    txc_pio_ack,
    txc_pio_err,
    txc_pio_rdata,
    zcp_debug_port,
    zcp_dmc_ack0,
    zcp_dmc_ack1,
    zcp_dmc_dat0,
    zcp_dmc_dat1,
    zcp_dmc_dat_err0,
    zcp_dmc_dat_err1,
    zcp_dmc_ful_pkt0,
    zcp_dmc_ful_pkt1,
    zcp_pio_ack,
    zcp_pio_err,
    zcp_pio_intr,
    zcp_pio_rdata 
    );

input		arb1_txc_req_accept;
input	[5:0]	arb1_txc_req_transid;
input		cluster_arst_l;
input		cmp_gclk_c0_rtx;
input		dmc_ipp_dat_req0;               // dmc request data from rxc_data_fifo_0
input		dmc_ipp_dat_req1;               // dmc request data from rxc_data_fifo_1
input		dmc_txc_dma0_active;
input		dmc_txc_dma0_cacheready;
input	[63:0]	dmc_txc_dma0_descriptor;
input		dmc_txc_dma0_eoflist;
input		dmc_txc_dma0_error;
input	[1:0]	dmc_txc_dma0_func_num;
input		dmc_txc_dma0_gotnxtdesc;
input	[19:0]	dmc_txc_dma0_page_handle;
input		dmc_txc_dma0_partial;
input		dmc_txc_dma0_reset_scheduled;
input		dmc_txc_dma10_active;
input		dmc_txc_dma10_cacheready;
input	[63:0]	dmc_txc_dma10_descriptor;
input		dmc_txc_dma10_eoflist;
input		dmc_txc_dma10_error;
input	[1:0]	dmc_txc_dma10_func_num;
input		dmc_txc_dma10_gotnxtdesc;
input	[19:0]	dmc_txc_dma10_page_handle;
input		dmc_txc_dma10_partial;
input		dmc_txc_dma10_reset_scheduled;
input		dmc_txc_dma11_active;
input		dmc_txc_dma11_cacheready;
input	[63:0]	dmc_txc_dma11_descriptor;
input		dmc_txc_dma11_eoflist;
input		dmc_txc_dma11_error;
input	[1:0]	dmc_txc_dma11_func_num;
input		dmc_txc_dma11_gotnxtdesc;
input	[19:0]	dmc_txc_dma11_page_handle;
input		dmc_txc_dma11_partial;
input		dmc_txc_dma11_reset_scheduled;
input		dmc_txc_dma12_active;
input		dmc_txc_dma12_cacheready;
input	[63:0]	dmc_txc_dma12_descriptor;
input		dmc_txc_dma12_eoflist;
input		dmc_txc_dma12_error;
input	[1:0]	dmc_txc_dma12_func_num;
input		dmc_txc_dma12_gotnxtdesc;
input	[19:0]	dmc_txc_dma12_page_handle;
input		dmc_txc_dma12_partial;
input		dmc_txc_dma12_reset_scheduled;
input		dmc_txc_dma13_active;
input		dmc_txc_dma13_cacheready;
input	[63:0]	dmc_txc_dma13_descriptor;
input		dmc_txc_dma13_eoflist;
input		dmc_txc_dma13_error;
input	[1:0]	dmc_txc_dma13_func_num;
input		dmc_txc_dma13_gotnxtdesc;
input	[19:0]	dmc_txc_dma13_page_handle;
input		dmc_txc_dma13_partial;
input		dmc_txc_dma13_reset_scheduled;
input		dmc_txc_dma14_active;
input		dmc_txc_dma14_cacheready;
input	[63:0]	dmc_txc_dma14_descriptor;
input		dmc_txc_dma14_eoflist;
input		dmc_txc_dma14_error;
input	[1:0]	dmc_txc_dma14_func_num;
input		dmc_txc_dma14_gotnxtdesc;
input	[19:0]	dmc_txc_dma14_page_handle;
input		dmc_txc_dma14_partial;
input		dmc_txc_dma14_reset_scheduled;
input		dmc_txc_dma15_active;
input		dmc_txc_dma15_cacheready;
input	[63:0]	dmc_txc_dma15_descriptor;
input		dmc_txc_dma15_eoflist;
input		dmc_txc_dma15_error;
input	[1:0]	dmc_txc_dma15_func_num;
input		dmc_txc_dma15_gotnxtdesc;
input	[19:0]	dmc_txc_dma15_page_handle;
input		dmc_txc_dma15_partial;
input		dmc_txc_dma15_reset_scheduled;
input		dmc_txc_dma1_active;
input		dmc_txc_dma1_cacheready;
input	[63:0]	dmc_txc_dma1_descriptor;
input		dmc_txc_dma1_eoflist;
input		dmc_txc_dma1_error;
input	[1:0]	dmc_txc_dma1_func_num;
input		dmc_txc_dma1_gotnxtdesc;
input	[19:0]	dmc_txc_dma1_page_handle;
input		dmc_txc_dma1_partial;
input		dmc_txc_dma1_reset_scheduled;
input		dmc_txc_dma2_active;
input		dmc_txc_dma2_cacheready;
input	[63:0]	dmc_txc_dma2_descriptor;
input		dmc_txc_dma2_eoflist;
input		dmc_txc_dma2_error;
input	[1:0]	dmc_txc_dma2_func_num;
input		dmc_txc_dma2_gotnxtdesc;
input	[19:0]	dmc_txc_dma2_page_handle;
input		dmc_txc_dma2_partial;
input		dmc_txc_dma2_reset_scheduled;
input		dmc_txc_dma3_active;
input		dmc_txc_dma3_cacheready;
input	[63:0]	dmc_txc_dma3_descriptor;
input		dmc_txc_dma3_eoflist;
input		dmc_txc_dma3_error;
input	[1:0]	dmc_txc_dma3_func_num;
input		dmc_txc_dma3_gotnxtdesc;
input	[19:0]	dmc_txc_dma3_page_handle;
input		dmc_txc_dma3_partial;
input		dmc_txc_dma3_reset_scheduled;
input		dmc_txc_dma4_active;
input		dmc_txc_dma4_cacheready;
input	[63:0]	dmc_txc_dma4_descriptor;
input		dmc_txc_dma4_eoflist;
input		dmc_txc_dma4_error;
input	[1:0]	dmc_txc_dma4_func_num;
input		dmc_txc_dma4_gotnxtdesc;
input	[19:0]	dmc_txc_dma4_page_handle;
input		dmc_txc_dma4_partial;
input		dmc_txc_dma4_reset_scheduled;
input		dmc_txc_dma5_active;
input		dmc_txc_dma5_cacheready;
input	[63:0]	dmc_txc_dma5_descriptor;
input		dmc_txc_dma5_eoflist;
input		dmc_txc_dma5_error;
input	[1:0]	dmc_txc_dma5_func_num;
input		dmc_txc_dma5_gotnxtdesc;
input	[19:0]	dmc_txc_dma5_page_handle;
input		dmc_txc_dma5_partial;
input		dmc_txc_dma5_reset_scheduled;
input		dmc_txc_dma6_active;
input		dmc_txc_dma6_cacheready;
input	[63:0]	dmc_txc_dma6_descriptor;
input		dmc_txc_dma6_eoflist;
input		dmc_txc_dma6_error;
input	[1:0]	dmc_txc_dma6_func_num;
input		dmc_txc_dma6_gotnxtdesc;
input	[19:0]	dmc_txc_dma6_page_handle;
input		dmc_txc_dma6_partial;
input		dmc_txc_dma6_reset_scheduled;
input		dmc_txc_dma7_active;
input		dmc_txc_dma7_cacheready;
input	[63:0]	dmc_txc_dma7_descriptor;
input		dmc_txc_dma7_eoflist;
input		dmc_txc_dma7_error;
input	[1:0]	dmc_txc_dma7_func_num;
input		dmc_txc_dma7_gotnxtdesc;
input	[19:0]	dmc_txc_dma7_page_handle;
input		dmc_txc_dma7_partial;
input		dmc_txc_dma7_reset_scheduled;
input		dmc_txc_dma8_active;
input		dmc_txc_dma8_cacheready;
input	[63:0]	dmc_txc_dma8_descriptor;
input		dmc_txc_dma8_eoflist;
input		dmc_txc_dma8_error;
input	[1:0]	dmc_txc_dma8_func_num;
input		dmc_txc_dma8_gotnxtdesc;
input	[19:0]	dmc_txc_dma8_page_handle;
input		dmc_txc_dma8_partial;
input		dmc_txc_dma8_reset_scheduled;
input		dmc_txc_dma9_active;
input		dmc_txc_dma9_cacheready;
input	[63:0]	dmc_txc_dma9_descriptor;
input		dmc_txc_dma9_eoflist;
input		dmc_txc_dma9_error;
input	[1:0]	dmc_txc_dma9_func_num;
input		dmc_txc_dma9_gotnxtdesc;
input	[19:0]	dmc_txc_dma9_page_handle;
input		dmc_txc_dma9_partial;
input		dmc_txc_dma9_reset_scheduled;
input		dmc_txc_tx_addr_md;
input		dmc_zcp_req0;
input		dmc_zcp_req1;
input		efu_niu_4k_clr;
input		efu_niu_4k_data;
input		efu_niu_4k_xfer_en;
input		efu_niu_cfifo0_clr;
input		efu_niu_cfifo0_xfer_en;
input		efu_niu_cfifo1_clr;
input		efu_niu_cfifo1_xfer_en;
input		efu_niu_cfifo_data;
input		efu_niu_ipp0_clr;
input		efu_niu_ipp0_xfer_en;
input		efu_niu_ipp1_clr;
input		efu_niu_ipp1_xfer_en;
input		efu_niu_mac01_sfro_data;
input		efu_niu_mac0_ro_clr;
input		efu_niu_mac0_ro_xfer_en;
input		efu_niu_mac0_sf_clr;
input		efu_niu_mac0_sf_xfer_en;
input		efu_niu_mac1_ro_clr;
input		efu_niu_mac1_ro_xfer_en;
input		efu_niu_mac1_sf_clr;
input		efu_niu_mac1_sf_xfer_en;
input		gl_rtx_io2x_out;
input		gl_rtx_io_out;
input		mac_rxc_ack0;                   // xmac sends the ack to ipp
input		mac_rxc_ack1;                   // xmac sends the ack to ipp
input		mac_rxc_ctrl0;                  // active high for control information
input		mac_rxc_ctrl1;                  // active high for control information
input	[63:0]	mac_rxc_data0;                  // xmac writing the data to ipp
input	[63:0]	mac_rxc_data1;                  // bmac writing the data to ipp         
input	[22:0]	mac_rxc_stat0;                  // xmac writing the status to ipp
input	[22:0]	mac_rxc_stat1;                  // bmac writing the status to ipp
input		mac_rxc_tag0;                   // xmac identifies the last part packet
input		mac_rxc_tag1;                   // bmac identifies the last part packet
input		mac_txc_req0;
input		mac_txc_req1;
input	[127:0]	meta_dmc_data;
input		meta_dmc_data_valid;
input	[63:0]	meta_dmc_resp_address;
input	[15:0]	meta_dmc_resp_byteenable;
input		meta_dmc_resp_client;
input	[7:0]	meta_dmc_resp_cmd;
input	[3:0]	meta_dmc_resp_cmd_status;
input		meta_dmc_resp_complete;
input	[3:0]	meta_dmc_resp_data_status;
input	[4:0]	meta_dmc_resp_dma_num;
input	[13:0]	meta_dmc_resp_length;
input	[1:0]	meta_dmc_resp_port_num;
input		meta_dmc_resp_ready;
input	[5:0]	meta_dmc_resp_trans_id;
input		meta_dmc_resp_transfer_cmpl;
input	[19:0]	pio_clients_addr;
input		pio_clients_rd;                 // rd_wr
input	[63:0]	pio_clients_wdata;
input		pio_fflp_sel;                   // select fflp's    
input		pio_ipp_sel;                    // select ipp's    
input		pio_txc_sel;
input		pio_zcp_sel;                    // select zcp's    
input		rst_por_;
input		rtx_mbist_scan_in;
input		scan_in;                        // unused as of today - feb 10, 05
input		tcu_aclk;
input		tcu_atpg_mode;
input		tcu_bclk;
input		tcu_div_bypass;                 // bypasses clk divider to mux in ext clk
input		tcu_mbist_bisi_en;
input		tcu_mbist_user_mode;
input		tcu_pce_ov;
input	[2:0]	tcu_rtx_dmo_ctl;
input		tcu_rtx_io_clk_stop;
input		tcu_rtx_rxc_ipp0_mbist_start;
input		tcu_rtx_rxc_ipp1_mbist_start;
input		tcu_rtx_rxc_mb5_mbist_start;
input		tcu_rtx_rxc_mb6_mbist_start;
input		tcu_rtx_rxc_zcp0_mbist_start;
input		tcu_rtx_rxc_zcp1_mbist_start;
input		tcu_rtx_txc_txe0_mbist_start;
input		tcu_rtx_txc_txe1_mbist_start;
input		tcu_scan_en;
input		tcu_se_scancollar_in;
input		tcu_se_scancollar_out;
input		tcu_wr_inhibit;
output		dmc_meta_resp_accept;
output	[31:0]	fflp_debug_port;
output		fflp_pio_ack;
output		fflp_pio_err;
output		fflp_pio_intr;
output	[63:0]	fflp_pio_rdata;
output	[31:0]	ipp_debug_port;
output		ipp_dmc_dat_ack0;               // rxc_data_fifo_0 is sending data to dmc
output		ipp_dmc_dat_ack1;               // rxc_data_fifo_1 is sending data to dmc
output		ipp_dmc_dat_err0;               // rxc_data_fifo_0 data has error
output		ipp_dmc_dat_err1;               // rxc_data_fifo_1 data has ewrror
output	[129:0]	ipp_dmc_data0;                  // rxc_data_fifo_0's data to dmc
output	[129:0]	ipp_dmc_data1;                  // rxc_data_fifo_1's data to dmc
output		ipp_dmc_ful_pkt0;               // rxc_data_fifo_0 has at least 1 full packet
output		ipp_dmc_ful_pkt1;               // rxc_data_fifo_1 has at least 1 full packet
output		ipp_pio_ack;                    // output to  cpu
output		ipp_pio_err;
output		ipp_pio_intr;
output	[63:0]	ipp_pio_rdata;
output		niu_efu_4k_data;
output		niu_efu_4k_xfer_en;
output		niu_efu_cfifo0_data;
output		niu_efu_cfifo0_xfer_en;
output		niu_efu_cfifo1_data;
output		niu_efu_cfifo1_xfer_en;
output		niu_efu_ipp0_data;
output		niu_efu_ipp0_xfer_en;
output		niu_efu_ipp1_data;
output		niu_efu_ipp1_xfer_en;
output		niu_efu_mac0_ro_data;
output		niu_efu_mac0_ro_xfer_en;
output		niu_efu_mac0_sf_data;
output		niu_efu_mac0_sf_xfer_en;
output		niu_efu_mac1_ro_data;
output		niu_efu_mac1_ro_xfer_en;
output		niu_efu_mac1_sf_data;
output		niu_efu_mac1_sf_xfer_en;
output		niu_txc_interrupts;
output		rtx_mbist_scan_out;
output		rtx_rxc_ipp0_tcu_mbist_done;
output		rtx_rxc_ipp0_tcu_mbist_fail;
output		rtx_rxc_ipp1_tcu_mbist_done;
output		rtx_rxc_ipp1_tcu_mbist_fail;
output		rtx_rxc_mb5_tcu_mbist_done;
output		rtx_rxc_mb5_tcu_mbist_fail;
output		rtx_rxc_mb6_tcu_mbist_done;
output		rtx_rxc_mb6_tcu_mbist_fail;
output		rtx_rxc_zcp0_tcu_mbist_done;
output		rtx_rxc_zcp0_tcu_mbist_fail;
output		rtx_rxc_zcp1_tcu_mbist_done;
output		rtx_rxc_zcp1_tcu_mbist_fail;
output	[39:0]	rtx_tcu_dmo_data_out;
output		rtx_txc_txe0_tcu_mbist_done;
output		rtx_txc_txe0_tcu_mbist_fail;
output		rtx_txc_txe1_tcu_mbist_done;
output		rtx_txc_txe1_tcu_mbist_fail;
output		rxc_mac_req0;                   // req(as rdy) from ipp to xmac
output		rxc_mac_req1;                   // ack from ipp to bmac
output		scan_out;                       // unused as of today - feb 10, 05
output		txc_arb1_req;
output	[63:0]	txc_arb1_req_address;
output	[7:0]	txc_arb1_req_cmd;
output	[4:0]	txc_arb1_req_dma_num;
output	[1:0]	txc_arb1_req_func_num;
output	[13:0]	txc_arb1_req_length;
output	[1:0]	txc_arb1_req_port_num;
output	[31:0]	txc_debug_port;
output		txc_dmc_dma0_getnxtdesc;
output		txc_dmc_dma0_inc_head;
output		txc_dmc_dma0_inc_pkt_cnt;
output		txc_dmc_dma0_mark_bit;
output		txc_dmc_dma0_reset_done;
output		txc_dmc_dma10_getnxtdesc;
output		txc_dmc_dma10_inc_head;
output		txc_dmc_dma10_inc_pkt_cnt;
output		txc_dmc_dma10_mark_bit;
output		txc_dmc_dma10_reset_done;
output		txc_dmc_dma11_getnxtdesc;
output		txc_dmc_dma11_inc_head;
output		txc_dmc_dma11_inc_pkt_cnt;
output		txc_dmc_dma11_mark_bit;
output		txc_dmc_dma11_reset_done;
output		txc_dmc_dma12_getnxtdesc;
output		txc_dmc_dma12_inc_head;
output		txc_dmc_dma12_inc_pkt_cnt;
output		txc_dmc_dma12_mark_bit;
output		txc_dmc_dma12_reset_done;
output		txc_dmc_dma13_getnxtdesc;
output		txc_dmc_dma13_inc_head;
output		txc_dmc_dma13_inc_pkt_cnt;
output		txc_dmc_dma13_mark_bit;
output		txc_dmc_dma13_reset_done;
output		txc_dmc_dma14_getnxtdesc;
output		txc_dmc_dma14_inc_head;
output		txc_dmc_dma14_inc_pkt_cnt;
output		txc_dmc_dma14_mark_bit;
output		txc_dmc_dma14_reset_done;
output		txc_dmc_dma15_getnxtdesc;
output		txc_dmc_dma15_inc_head;
output		txc_dmc_dma15_inc_pkt_cnt;
output		txc_dmc_dma15_mark_bit;
output		txc_dmc_dma15_reset_done;
output		txc_dmc_dma1_getnxtdesc;
output		txc_dmc_dma1_inc_head;
output		txc_dmc_dma1_inc_pkt_cnt;
output		txc_dmc_dma1_mark_bit;
output		txc_dmc_dma1_reset_done;
output		txc_dmc_dma2_getnxtdesc;
output		txc_dmc_dma2_inc_head;
output		txc_dmc_dma2_inc_pkt_cnt;
output		txc_dmc_dma2_mark_bit;
output		txc_dmc_dma2_reset_done;
output		txc_dmc_dma3_getnxtdesc;
output		txc_dmc_dma3_inc_head;
output		txc_dmc_dma3_inc_pkt_cnt;
output		txc_dmc_dma3_mark_bit;
output		txc_dmc_dma3_reset_done;
output		txc_dmc_dma4_getnxtdesc;
output		txc_dmc_dma4_inc_head;
output		txc_dmc_dma4_inc_pkt_cnt;
output		txc_dmc_dma4_mark_bit;
output		txc_dmc_dma4_reset_done;
output		txc_dmc_dma5_getnxtdesc;
output		txc_dmc_dma5_inc_head;
output		txc_dmc_dma5_inc_pkt_cnt;
output		txc_dmc_dma5_mark_bit;
output		txc_dmc_dma5_reset_done;
output		txc_dmc_dma6_getnxtdesc;
output		txc_dmc_dma6_inc_head;
output		txc_dmc_dma6_inc_pkt_cnt;
output		txc_dmc_dma6_mark_bit;
output		txc_dmc_dma6_reset_done;
output		txc_dmc_dma7_getnxtdesc;
output		txc_dmc_dma7_inc_head;
output		txc_dmc_dma7_inc_pkt_cnt;
output		txc_dmc_dma7_mark_bit;
output		txc_dmc_dma7_reset_done;
output		txc_dmc_dma8_getnxtdesc;
output		txc_dmc_dma8_inc_head;
output		txc_dmc_dma8_inc_pkt_cnt;
output		txc_dmc_dma8_mark_bit;
output		txc_dmc_dma8_reset_done;
output		txc_dmc_dma9_getnxtdesc;
output		txc_dmc_dma9_inc_head;
output		txc_dmc_dma9_inc_pkt_cnt;
output		txc_dmc_dma9_mark_bit;
output		txc_dmc_dma9_reset_done;
output	[15:0]	txc_dmc_dma_nack_pkt_rd;
output		txc_dmc_nack_pkt_rd;
output	[43:0]	txc_dmc_nack_pkt_rd_addr;
output	[15:0]	txc_dmc_p0_dma_pkt_size_err;
output		txc_dmc_p0_pkt_size_err;
output	[43:0]	txc_dmc_p0_pkt_size_err_addr;
output	[15:0]	txc_dmc_p1_dma_pkt_size_err;
output		txc_dmc_p1_pkt_size_err;
output	[43:0]	txc_dmc_p1_pkt_size_err_addr;
output		txc_mac_abort0;
output		txc_mac_abort1;
output		txc_mac_ack0;
output		txc_mac_ack1;
output	[63:0]	txc_mac_data0;
output	[63:0]	txc_mac_data1;
output	[3:0]	txc_mac_stat0;
output	[3:0]	txc_mac_stat1;
output		txc_mac_tag0;
output		txc_mac_tag1;
output		txc_pio_ack;
output		txc_pio_err;
output	[63:0]	txc_pio_rdata;
output	[31:0]	zcp_debug_port;
output		zcp_dmc_ack0;
output		zcp_dmc_ack1;
output	[129:0]	zcp_dmc_dat0;
output	[129:0]	zcp_dmc_dat1;
output		zcp_dmc_dat_err0;
output		zcp_dmc_dat_err1;
output		zcp_dmc_ful_pkt0;
output		zcp_dmc_ful_pkt1;
output		zcp_pio_ack;
output		zcp_pio_err;
output		zcp_pio_intr;
output	[63:0]	zcp_pio_rdata;

wire	[39:0]	rtx_rxc_ipp0_mb3_dmo_dout;
wire	[39:0]	rtx_rxc_ipp1_mb3_dmo_dout;
wire	[39:0]	rtx_rxc_vlan_mb6_dmo_dout;
wire	[39:0]	rtx_rxc_zcp0_mb7_dmo_dout;
wire	[39:0]	rtx_rxc_zcp1_mb7_dmo_dout;
wire	[39:0]	rtx_txc_txe0_dmo_dout;
wire	[39:0]	rtx_txc_txe1_dmo_dout;
wire		aclk;
wire		bclk;
wire		clkgen2x_rtx_scan_out;
wire		clkgen_rtx_scan_out;
wire		efuhdr_ipp0_scan_out;
wire		efuhdr_ipp1_scan_out;
wire		efuhdr_txc0_re_scan_out;
wire		efuhdr_txc0_st_scan_out;
wire		efuhdr_txc1_re_scan_out;
wire		efuhdr_txc1_st_scan_out;
wire		efuhdr_vlan_scan_out;
wire		efuhdr_zcp0_scan_out;
wire		efuhdr_zcp1_scan_out;
wire		hdr_sram_red_clr_ipp0;
wire		hdr_sram_red_clr_ipp1;
wire		hdr_sram_red_clr_txc0_re;
wire		hdr_sram_red_clr_txc0_st;
wire		hdr_sram_red_clr_txc1_re;
wire		hdr_sram_red_clr_txc1_st;
wire		hdr_sram_red_clr_vlan;
wire		hdr_sram_red_clr_zcp0;
wire		hdr_sram_red_clr_zcp1;
wire	[2:0]	hdr_sram_rid_ipp0;
wire	[2:0]	hdr_sram_rid_ipp1;
wire	[2:0]	hdr_sram_rid_txc0_re;
wire	[2:0]	hdr_sram_rid_txc0_st;
wire	[2:0]	hdr_sram_rid_txc1_re;
wire	[2:0]	hdr_sram_rid_txc1_st;
wire		hdr_sram_rid_vlan;
wire	[1:0]	hdr_sram_rid_zcp0;
wire	[1:0]	hdr_sram_rid_zcp1;
wire	[6:0]	hdr_sram_rvalue_ipp0;
wire	[6:0]	hdr_sram_rvalue_ipp1;
wire	[6:0]	hdr_sram_rvalue_txc0_re;
wire	[6:0]	hdr_sram_rvalue_txc0_st;
wire	[6:0]	hdr_sram_rvalue_txc1_re;
wire	[6:0]	hdr_sram_rvalue_txc1_st;
wire	[5:0]	hdr_sram_rvalue_vlan;
wire	[6:0]	hdr_sram_rvalue_zcp0;
wire	[6:0]	hdr_sram_rvalue_zcp1;
wire		hdr_sram_wr_en_ipp0;
wire		hdr_sram_wr_en_ipp1;
wire		hdr_sram_wr_en_txc0_re;
wire		hdr_sram_wr_en_txc0_st;
wire		hdr_sram_wr_en_txc1_re;
wire		hdr_sram_wr_en_txc1_st;
wire		hdr_sram_wr_en_vlan;
wire		hdr_sram_wr_en_zcp0;
wire		hdr_sram_wr_en_zcp1;
wire		iol2clk;
wire		l1clk;
wire		l1clk_2x;
wire	[9:0]	nc100;
wire	[3:0]	nc40;
wire	[3:0]	nc41;
wire	[3:0]	nc42;
wire	[3:0]	nc43;
wire	[3:0]	nc44;
wire	[3:0]	nc45;
wire	[3:0]	nc46;
wire	[3:0]	nc47;
wire	[4:0]	nc50;
wire	[7:0]	nc80;
wire	[7:0]	nc81;
wire	[7:0]	nc82;
wire	[7:0]	nc83;
wire	[7:0]	nc84;
wire	[7:0]	nc85;
wire	[8:0]	nc90;
wire	[8:0]	nc91;
wire		niu_mb3_prebuf_header_scan_out;
wire		niu_mb3_rx_data_fifo_scan_out;
wire		niu_mb4_prebuf_header_scan_out;
wire		niu_mb4_rx_data_fifo_scan_out;
wire		niu_mb5_tcam_cntrl_scan_out;
wire		niu_mb6_tcam_array_scan_out;
wire		niu_mb6_vlan_scan_out;
wire		niu_mb7_cntrl_fifo_zcp_scan_out;
wire		pce_ov;
wire		reset_l;
wire		rtx_array_wr_inhibit;
wire		rtx_rxc_ipp0_mb3_mbist_scan_out;
wire		rtx_rxc_ipp1_mb3_mbist_scan_out;
wire		rtx_rxc_tcam_cntrl_mbist_scan_out;
wire		rtx_rxc_tcam_vlan_mbist_scan_out;
wire		rtx_rxc_zcp0_mb7_mbist_scan_out;
wire		rtx_rxc_zcp1_mb7_mbist_scan_out;
wire		rtx_txc_txe0_mbist_scan_out;
wire	[6:0]	sram_hdr_read_data_ipp0;
wire	[6:0]	sram_hdr_read_data_ipp1;
wire	[6:0]	sram_hdr_read_data_txc0_re;
wire	[6:0]	sram_hdr_read_data_txc0_st;
wire	[6:0]	sram_hdr_read_data_txc1_re;
wire	[6:0]	sram_hdr_read_data_txc1_st;
wire	[5:0]	sram_hdr_read_data_vlan;
wire	[6:0]	sram_hdr_read_data_zcp0;
wire	[6:0]	sram_hdr_read_data_zcp1;

clkgen_rtx clkgen_rtx (
    .array_wr_inhibit (rtx_array_wr_inhibit),
    .l1clk            (l1clk),
    .iol2clk          (iol2clk),
    .aclk             (aclk),
    .bclk             (bclk),
    .scan_out         (clkgen_rtx_scan_out),
    .aclk_wmr         (),
    .pce_ov           (pce_ov),
    .wmr_protect      (),
    .wmr_             (),
    .por_             (reset_l),
    .cmp_slow_sync_en (),
    .slow_cmp_sync_en (),
    .tcu_wr_inhibit   (tcu_wr_inhibit),
    .tcu_atpg_mode    (tcu_atpg_mode),
    .tcu_clk_stop     (tcu_rtx_io_clk_stop),
    .tcu_pce_ov       (tcu_pce_ov),
    .rst_wmr_protect  (1'b0),
    .rst_wmr_         (1'b1),
    .rst_por_         (rst_por_),
    .tcu_div_bypass   (tcu_div_bypass),
    .ccu_div_ph       (gl_rtx_io_out),
    .cluster_div_en   (1'b1),
    .gclk             (cmp_gclk_c0_rtx),
    .cluster_arst_l   (cluster_arst_l),
    .scan_en          (tcu_scan_en),
    .scan_in          (scan_in),
    .tcu_aclk         (tcu_aclk),
    .tcu_bclk         (tcu_bclk)
    );

clkgen_rtx_io2x clkgen2x_rtx (
    .l2clk                (l1clk_2x),
    .aclk                 (),
    .bclk                 (),
    .scan_out             (clkgen2x_rtx_scan_out),
    .aclk_wmr             (),
    .pce_ov               (),
    .wmr_protect          (),
    .wmr_                 (),
    .por_                 (),
    .cmp_slow_sync_en     (),
    .slow_cmp_sync_en     (),
    .array_wr_inhibit     (),
    .tcu_atpg_mode        (tcu_atpg_mode),
    .tcu_wr_inhibit       (1'b0),
    .tcu_clk_stop         (tcu_rtx_io_clk_stop),
    .tcu_pce_ov           (pce_ov),
    .rst_wmr_protect      (1'b0),
    .rst_wmr_             (1'b1),
    .rst_por_             (rst_por_),
    .ccu_cmp_slow_sync_en (1'b0),
    .ccu_slow_cmp_sync_en (1'b0),
    .tcu_div_bypass       (tcu_div_bypass),
    .ccu_div_ph           (gl_rtx_io2x_out),
    .cluster_div_en       (1'b1),
    .gclk                 (cmp_gclk_c0_rtx),
    .cluster_arst_l       (cluster_arst_l),
    .ccu_serdes_dtm       (1'b0),
    .clk_ext              (1'b0),
    .scan_en              (tcu_scan_en),
    .scan_in              (clkgen_rtx_scan_out),
    .tcu_aclk             (aclk),
    .tcu_bclk             (bclk)
    );

rtx_n2_efuhdr3_p0_ctl efuhdr_ipp0 (
    .efu_hdr_write_data (efu_niu_mac01_sfro_data),
    .efu_hdr_xfer_en    (efu_niu_ipp0_xfer_en),
    .efu_hdr_clr        (efu_niu_ipp0_clr),
    .hdr_efu_read_data  (niu_efu_ipp0_data),
    .hdr_efu_xfer_en    (niu_efu_ipp0_xfer_en),
    .hdr_sram_rvalue    ({nc40,hdr_sram_rvalue_ipp0[6:0]}),
    .hdr_sram_rid       ({nc80,hdr_sram_rid_ipp0[2:0]}),
    .hdr_sram_wr_en     (hdr_sram_wr_en_ipp0),
    .hdr_sram_red_clr   (hdr_sram_red_clr_ipp0),
    .sram_hdr_read_data ({4'b0,sram_hdr_read_data_ipp0[6:0]}),
    .l2clk              (l1clk),
    .reset_l            (reset_l),
    .tcu_pce_ov         (tcu_pce_ov),
    .tcu_aclk           (aclk),
    .tcu_bclk           (bclk),
    .tcu_scan_en        (tcu_scan_en),
    .tcu_clk_stop       (tcu_rtx_io_clk_stop),
    .scan_in            (clkgen2x_rtx_scan_out),
    .scan_out           (efuhdr_ipp0_scan_out)
    );

rtx_n2_efuhdr3_p1_ctl efuhdr_ipp1 (
    .efu_hdr_write_data (efu_niu_mac01_sfro_data),
    .efu_hdr_xfer_en    (efu_niu_ipp1_xfer_en),
    .efu_hdr_clr        (efu_niu_ipp1_clr),
    .hdr_efu_read_data  (niu_efu_ipp1_data),
    .hdr_efu_xfer_en    (niu_efu_ipp1_xfer_en),
    .hdr_sram_rvalue    ({nc41,hdr_sram_rvalue_ipp1[6:0]}),
    .hdr_sram_rid       ({nc81,hdr_sram_rid_ipp1[2:0]}),
    .hdr_sram_wr_en     (hdr_sram_wr_en_ipp1),
    .hdr_sram_red_clr   (hdr_sram_red_clr_ipp1),
    .sram_hdr_read_data ({4'b0,sram_hdr_read_data_ipp1[6:0]}),
    .l2clk              (l1clk),
    .reset_l            (reset_l),
    .tcu_pce_ov         (tcu_pce_ov),
    .tcu_aclk           (aclk),
    .tcu_bclk           (bclk),
    .tcu_scan_en        (tcu_scan_en),
    .tcu_clk_stop       (tcu_rtx_io_clk_stop),
    .scan_in            (efuhdr_ipp0_scan_out),
    .scan_out           (efuhdr_ipp1_scan_out)
    );

rtx_n2_efuhdr1b_p0_ctl efuhdr_txc0_re (
    .efu_hdr_write_data (efu_niu_mac01_sfro_data),
    .efu_hdr_xfer_en    (efu_niu_mac0_ro_xfer_en),
    .efu_hdr_clr        (efu_niu_mac0_ro_clr),
    .hdr_efu_read_data  (niu_efu_mac0_ro_data),
    .hdr_efu_xfer_en    (niu_efu_mac0_ro_xfer_en),
    .hdr_sram_rvalue    ({nc42,hdr_sram_rvalue_txc0_re[6:0]}),
    .hdr_sram_rid       ({nc82,hdr_sram_rid_txc0_re[2:0]}),
    .hdr_sram_wr_en     (hdr_sram_wr_en_txc0_re),
    .hdr_sram_red_clr   (hdr_sram_red_clr_txc0_re),
    .sram_hdr_read_data ({4'b0,sram_hdr_read_data_txc0_re[6:0]}),
    .l2clk              (l1clk),
    .reset_l            (reset_l),
    .tcu_pce_ov         (tcu_pce_ov),
    .tcu_aclk           (aclk),
    .tcu_bclk           (bclk),
    .tcu_scan_en        (tcu_scan_en),
    .tcu_clk_stop       (tcu_rtx_io_clk_stop),
    .scan_in            (efuhdr_ipp1_scan_out),
    .scan_out           (efuhdr_txc0_re_scan_out)
    );

rtx_n2_efuhdr1a_p0_ctl efuhdr_txc0_st (
    .efu_hdr_write_data (efu_niu_mac01_sfro_data),
    .efu_hdr_xfer_en    (efu_niu_mac0_sf_xfer_en),
    .efu_hdr_clr        (efu_niu_mac0_sf_clr),
    .hdr_efu_read_data  (niu_efu_mac0_sf_data),
    .hdr_efu_xfer_en    (niu_efu_mac0_sf_xfer_en),
    .hdr_sram_rvalue    ({nc44,hdr_sram_rvalue_txc0_st[6:0]}),
    .hdr_sram_rid       ({nc84,hdr_sram_rid_txc0_st[2:0]}),
    .hdr_sram_wr_en     (hdr_sram_wr_en_txc0_st),
    .hdr_sram_red_clr   (hdr_sram_red_clr_txc0_st),
    .sram_hdr_read_data ({4'b0,sram_hdr_read_data_txc0_st[6:0]}),
    .l2clk              (l1clk),
    .reset_l            (reset_l),
    .tcu_pce_ov         (tcu_pce_ov),
    .tcu_aclk           (aclk),
    .tcu_bclk           (bclk),
    .tcu_scan_en        (tcu_scan_en),
    .tcu_clk_stop       (tcu_rtx_io_clk_stop),
    .scan_in            (efuhdr_txc0_re_scan_out),
    .scan_out           (efuhdr_txc0_st_scan_out)
    );

rtx_n2_efuhdr1b_p1_ctl efuhdr_txc1_re (
    .efu_hdr_write_data (efu_niu_mac01_sfro_data),
    .efu_hdr_xfer_en    (efu_niu_mac1_ro_xfer_en),
    .efu_hdr_clr        (efu_niu_mac1_ro_clr),
    .hdr_efu_read_data  (niu_efu_mac1_ro_data),
    .hdr_efu_xfer_en    (niu_efu_mac1_ro_xfer_en),
    .hdr_sram_rvalue    ({nc43,hdr_sram_rvalue_txc1_re[6:0]}),
    .hdr_sram_rid       ({nc83,hdr_sram_rid_txc1_re[2:0]}),
    .hdr_sram_wr_en     (hdr_sram_wr_en_txc1_re),
    .hdr_sram_red_clr   (hdr_sram_red_clr_txc1_re),
    .sram_hdr_read_data ({4'b0,sram_hdr_read_data_txc1_re[6:0]}),
    .l2clk              (l1clk),
    .reset_l            (reset_l),
    .tcu_pce_ov         (tcu_pce_ov),
    .tcu_aclk           (aclk),
    .tcu_bclk           (bclk),
    .tcu_scan_en        (tcu_scan_en),
    .tcu_clk_stop       (tcu_rtx_io_clk_stop),
    .scan_in            (efuhdr_txc0_st_scan_out),
    .scan_out           (efuhdr_txc1_re_scan_out)
    );

rtx_n2_efuhdr1a_p1_ctl efuhdr_txc1_st (
    .efu_hdr_write_data (efu_niu_mac01_sfro_data),
    .efu_hdr_xfer_en    (efu_niu_mac1_sf_xfer_en),
    .efu_hdr_clr        (efu_niu_mac1_sf_clr),
    .hdr_efu_read_data  (niu_efu_mac1_sf_data),
    .hdr_efu_xfer_en    (niu_efu_mac1_sf_xfer_en),
    .hdr_sram_rvalue    ({nc45,hdr_sram_rvalue_txc1_st[6:0]}),
    .hdr_sram_rid       ({nc85,hdr_sram_rid_txc1_st[2:0]}),
    .hdr_sram_wr_en     (hdr_sram_wr_en_txc1_st),
    .hdr_sram_red_clr   (hdr_sram_red_clr_txc1_st),
    .sram_hdr_read_data ({4'b0,sram_hdr_read_data_txc1_st[6:0]}),
    .l2clk              (l1clk),
    .reset_l            (reset_l),
    .tcu_pce_ov         (tcu_pce_ov),
    .tcu_aclk           (aclk),
    .tcu_bclk           (bclk),
    .tcu_scan_en        (tcu_scan_en),
    .tcu_clk_stop       (tcu_rtx_io_clk_stop),
    .scan_in            (efuhdr_txc1_re_scan_out),
    .scan_out           (efuhdr_txc1_st_scan_out)
    );

rtx_n2_efuhdr6_ctl efuhdr_vlan (
    .efu_hdr_write_data (efu_niu_4k_data),
    .efu_hdr_xfer_en    (efu_niu_4k_xfer_en),
    .efu_hdr_clr        (efu_niu_4k_clr),
    .hdr_efu_read_data  (niu_efu_4k_data),
    .hdr_efu_xfer_en    (niu_efu_4k_xfer_en),
    .hdr_sram_rvalue    ({nc50,hdr_sram_rvalue_vlan[5:0]}),
    .hdr_sram_rid       ({nc100,hdr_sram_rid_vlan}),
    .hdr_sram_wr_en     (hdr_sram_wr_en_vlan),
    .hdr_sram_red_clr   (hdr_sram_red_clr_vlan),
    .sram_hdr_read_data ({5'b0,sram_hdr_read_data_vlan[5:0]}),
    .l2clk              (l1clk),
    .reset_l            (reset_l),
    .tcu_pce_ov         (tcu_pce_ov),
    .tcu_aclk           (aclk),
    .tcu_bclk           (bclk),
    .tcu_scan_en        (tcu_scan_en),
    .tcu_clk_stop       (tcu_rtx_io_clk_stop),
    .scan_in            (efuhdr_txc1_st_scan_out),
    .scan_out           (efuhdr_vlan_scan_out)
    );

rtx_n2_efuhdr7_p0_ctl efuhdr_zcp0 (
    .efu_hdr_write_data (efu_niu_cfifo_data),
    .efu_hdr_xfer_en    (efu_niu_cfifo0_xfer_en),
    .efu_hdr_clr        (efu_niu_cfifo0_clr),
    .hdr_efu_read_data  (niu_efu_cfifo0_data),
    .hdr_efu_xfer_en    (niu_efu_cfifo0_xfer_en),
    .hdr_sram_rvalue    ({nc46,hdr_sram_rvalue_zcp0[6:0]}),
    .hdr_sram_rid       ({nc90,hdr_sram_rid_zcp0[1:0]}),
    .hdr_sram_wr_en     (hdr_sram_wr_en_zcp0),
    .hdr_sram_red_clr   (hdr_sram_red_clr_zcp0),
    .sram_hdr_read_data ({4'b0,sram_hdr_read_data_zcp0[6:0]}),
    .l2clk              (l1clk),
    .reset_l            (reset_l),
    .tcu_pce_ov         (tcu_pce_ov),
    .tcu_aclk           (aclk),
    .tcu_bclk           (bclk),
    .tcu_scan_en        (tcu_scan_en),
    .tcu_clk_stop       (tcu_rtx_io_clk_stop),
    .scan_in            (efuhdr_vlan_scan_out),
    .scan_out           (efuhdr_zcp0_scan_out)
    );

rtx_n2_efuhdr7_p1_ctl efuhdr_zcp1 (
    .efu_hdr_write_data (efu_niu_cfifo_data),
    .efu_hdr_xfer_en    (efu_niu_cfifo1_xfer_en),
    .efu_hdr_clr        (efu_niu_cfifo1_clr),
    .hdr_efu_read_data  (niu_efu_cfifo1_data),
    .hdr_efu_xfer_en    (niu_efu_cfifo1_xfer_en),
    .hdr_sram_rvalue    ({nc47,hdr_sram_rvalue_zcp1[6:0]}),
    .hdr_sram_rid       ({nc91,hdr_sram_rid_zcp1[1:0]}),
    .hdr_sram_wr_en     (hdr_sram_wr_en_zcp1),
    .hdr_sram_red_clr   (hdr_sram_red_clr_zcp1),
    .sram_hdr_read_data ({4'b0,sram_hdr_read_data_zcp1[6:0]}),
    .l2clk              (l1clk),
    .reset_l            (reset_l),
    .tcu_pce_ov         (tcu_pce_ov),
    .tcu_aclk           (aclk),
    .tcu_bclk           (bclk),
    .tcu_scan_en        (tcu_scan_en),
    .tcu_clk_stop       (tcu_rtx_io_clk_stop),
    .scan_in            (efuhdr_zcp0_scan_out),
    .scan_out           (efuhdr_zcp1_scan_out)
    );

niu_rxc rxc (
    .tcu_mbist_user_mode               (tcu_mbist_user_mode),
    .tcu_scan_en                       (tcu_scan_en),
    .tcu_mbist_bisi_en                 (tcu_mbist_bisi_en),
    .tcu_rtx_rxc_ipp0_mbist_start      (tcu_rtx_rxc_ipp0_mbist_start),
    .tcu_rtx_rxc_ipp1_mbist_start      (tcu_rtx_rxc_ipp1_mbist_start),
    .tcu_rtx_rxc_mb5_mbist_start       (tcu_rtx_rxc_mb5_mbist_start),
    .tcu_rtx_rxc_mb6_mbist_start       (tcu_rtx_rxc_mb6_mbist_start),
    .tcu_rtx_rxc_zcp0_mbist_start      (tcu_rtx_rxc_zcp0_mbist_start),
    .tcu_rtx_rxc_zcp1_mbist_start      (tcu_rtx_rxc_zcp1_mbist_start),
    .rtx_rxc_ipp0_tcu_mbist_fail       (rtx_rxc_ipp0_tcu_mbist_fail),
    .rtx_rxc_ipp1_tcu_mbist_fail       (rtx_rxc_ipp1_tcu_mbist_fail),
    .rtx_rxc_mb5_tcu_mbist_fail        (rtx_rxc_mb5_tcu_mbist_fail),
    .rtx_rxc_mb6_tcu_mbist_fail        (rtx_rxc_mb6_tcu_mbist_fail),
    .rtx_rxc_zcp0_tcu_mbist_fail       (rtx_rxc_zcp0_tcu_mbist_fail),
    .rtx_rxc_zcp1_tcu_mbist_fail       (rtx_rxc_zcp1_tcu_mbist_fail),
    .rtx_rxc_ipp0_tcu_mbist_done       (rtx_rxc_ipp0_tcu_mbist_done),
    .rtx_rxc_ipp1_tcu_mbist_done       (rtx_rxc_ipp1_tcu_mbist_done),
    .rtx_rxc_mb5_tcu_mbist_done        (rtx_rxc_mb5_tcu_mbist_done),
    .rtx_rxc_mb6_tcu_mbist_done        (rtx_rxc_mb6_tcu_mbist_done),
    .rtx_rxc_zcp0_tcu_mbist_done       (rtx_rxc_zcp0_tcu_mbist_done),
    .rtx_rxc_zcp1_tcu_mbist_done       (rtx_rxc_zcp1_tcu_mbist_done),
    .niu_mb3_prebuf_header_scan_in     (niu_mb3_rx_data_fifo_scan_out),
    .niu_mb3_prebuf_header_scan_out    (niu_mb3_prebuf_header_scan_out),
    .niu_mb3_rx_data_fifo_scan_in      (efuhdr_zcp1_scan_out),
    .niu_mb3_rx_data_fifo_scan_out     (niu_mb3_rx_data_fifo_scan_out),
    .rtx_rxc_ipp0_mb3_mbist_scan_in    (rtx_mbist_scan_in),
    .rtx_rxc_ipp0_mb3_mbist_scan_out   (rtx_rxc_ipp0_mb3_mbist_scan_out),
    .rtx_rxc_ipp0_mb3_dmo_dout         (rtx_rxc_ipp0_mb3_dmo_dout[39:0]),
    .niu_mb4_prebuf_header_scan_in     (niu_mb4_rx_data_fifo_scan_out),
    .niu_mb4_prebuf_header_scan_out    (niu_mb4_prebuf_header_scan_out),
    .niu_mb4_rx_data_fifo_scan_in      (niu_mb3_prebuf_header_scan_out),
    .niu_mb4_rx_data_fifo_scan_out     (niu_mb4_rx_data_fifo_scan_out),
    .rtx_rxc_ipp1_mb3_mbist_scan_in    (rtx_rxc_ipp0_mb3_mbist_scan_out),
    .rtx_rxc_ipp1_mb3_mbist_scan_out   (rtx_rxc_ipp1_mb3_mbist_scan_out),
    .rtx_rxc_ipp1_mb3_dmo_dout         (rtx_rxc_ipp1_mb3_dmo_dout[39:0]),
    .niu_mb5_tcam_cntrl_scan_in        (niu_mb4_prebuf_header_scan_out),
    .niu_mb5_tcam_cntrl_scan_out       (niu_mb5_tcam_cntrl_scan_out),
    .rtx_rxc_tcam_cntrl_mbist_scan_in  (rtx_rxc_ipp1_mb3_mbist_scan_out),
    .rtx_rxc_tcam_cntrl_mbist_scan_out (rtx_rxc_tcam_cntrl_mbist_scan_out),
    .niu_mb6_tcam_array_scan_in        (niu_mb5_tcam_cntrl_scan_out),
    .niu_mb6_tcam_array_scan_out       (niu_mb6_tcam_array_scan_out),
    .niu_mb6_vlan_scan_in              (niu_mb6_tcam_array_scan_out),
    .niu_mb6_vlan_scan_out             (niu_mb6_vlan_scan_out),
    .rtx_rxc_tcam_vlan_mbist_scan_in   (rtx_rxc_tcam_cntrl_mbist_scan_out),
    .rtx_rxc_tcam_vlan_mbist_scan_out  (rtx_rxc_tcam_vlan_mbist_scan_out),
    .rtx_rxc_vlan_mb6_dmo_dout         (rtx_rxc_vlan_mb6_dmo_dout[39:0]),
    .niu_mb7_cntrl_fifo_zcp_scan_in    (niu_mb6_vlan_scan_out),
    .niu_mb7_cntrl_fifo_zcp_scan_out   (niu_mb7_cntrl_fifo_zcp_scan_out),
    .rtx_rxc_zcp0_mb7_mbist_scan_in    (rtx_rxc_tcam_vlan_mbist_scan_out),
    .rtx_rxc_zcp0_mb7_mbist_scan_out   (rtx_rxc_zcp0_mb7_mbist_scan_out),
    .rtx_rxc_zcp0_mb7_dmo_dout         (rtx_rxc_zcp0_mb7_dmo_dout[39:0]),
    .niu_mb8_cntrl_fifo_zcp_scan_in    (niu_mb7_cntrl_fifo_zcp_scan_out),
    .niu_mb8_cntrl_fifo_zcp_scan_out   (scan_out),
    .rtx_rxc_zcp1_mb7_mbist_scan_in    (rtx_rxc_zcp0_mb7_mbist_scan_out),
    .rtx_rxc_zcp1_mb7_mbist_scan_out   (rtx_rxc_zcp1_mb7_mbist_scan_out),
    .rtx_rxc_zcp1_mb7_dmo_dout         (rtx_rxc_zcp1_mb7_dmo_dout[39:0]),
    .hdr_sram_rvalue_ipp0              (hdr_sram_rvalue_ipp0[6:0]),
    .hdr_sram_rid_ipp0                 (hdr_sram_rid_ipp0[2:0]),
    .hdr_sram_wr_en_ipp0               (hdr_sram_wr_en_ipp0),
    .hdr_sram_red_clr_ipp0             (hdr_sram_red_clr_ipp0),
    .sram_hdr_read_data_ipp0           (sram_hdr_read_data_ipp0[6:0]),
    .hdr_sram_rvalue_ipp1              (hdr_sram_rvalue_ipp1[6:0]),
    .hdr_sram_rid_ipp1                 (hdr_sram_rid_ipp1[2:0]),
    .hdr_sram_wr_en_ipp1               (hdr_sram_wr_en_ipp1),
    .hdr_sram_red_clr_ipp1             (hdr_sram_red_clr_ipp1),
    .sram_hdr_read_data_ipp1           (sram_hdr_read_data_ipp1[6:0]),
    .hdr_sram_rvalue_zcp0              (hdr_sram_rvalue_zcp0[6:0]),
    .hdr_sram_rid_zcp0                 (hdr_sram_rid_zcp0[1:0]),
    .hdr_sram_wr_en_zcp0               (hdr_sram_wr_en_zcp0),
    .hdr_sram_red_clr_zcp0             (hdr_sram_red_clr_zcp0),
    .sram_hdr_read_data_zcp0           (sram_hdr_read_data_zcp0[6:0]),
    .hdr_sram_rvalue_zcp1              (hdr_sram_rvalue_zcp1[6:0]),
    .hdr_sram_rid_zcp1                 (hdr_sram_rid_zcp1[1:0]),
    .hdr_sram_wr_en_zcp1               (hdr_sram_wr_en_zcp1),
    .hdr_sram_red_clr_zcp1             (hdr_sram_red_clr_zcp1),
    .sram_hdr_read_data_zcp1           (sram_hdr_read_data_zcp1[6:0]),
    .hdr_sram_rvalue_vlan              (hdr_sram_rvalue_vlan[5:0]),
    .hdr_sram_rid_vlan                 (hdr_sram_rid_vlan),
    .hdr_sram_wr_en_vlan               (hdr_sram_wr_en_vlan),
    .hdr_sram_red_clr_vlan             (hdr_sram_red_clr_vlan),
    .sram_hdr_read_data_vlan           (sram_hdr_read_data_vlan[5:0]),
    .tcu_aclk                          (aclk),
    .tcu_bclk                          (bclk),
    .tcu_se_scancollar_in              (tcu_se_scancollar_in),
    .tcu_se_scancollar_out             (tcu_se_scancollar_out),
    .tcu_array_wr_inhibit              (rtx_array_wr_inhibit),
    .iol2clk                           (iol2clk),
    .iol2clk_2x                        (l1clk_2x),
    .pio_ipp_sel                       (pio_ipp_sel),
    .pio_zcp_sel                       (pio_zcp_sel),
    .pio_fflp_sel                      (pio_fflp_sel),
    .pio_clients_addr                  (pio_clients_addr[19:0]),
    .pio_clients_rd                    (pio_clients_rd),
    .pio_clients_wdata                 (pio_clients_wdata[63:0]),
    .niu_reset_l                       (reset_l),
    .niu_clk                           (l1clk),
    .ipp_pio_ack                       (ipp_pio_ack),
    .ipp_pio_rdata                     (ipp_pio_rdata[63:0]),
    .ipp_pio_err                       (ipp_pio_err),
    .ipp_pio_intr                      (ipp_pio_intr),
    .ipp_debug_port                    (ipp_debug_port[31:0]),
    .zcp_pio_ack                       (zcp_pio_ack),
    .zcp_pio_rdata                     (zcp_pio_rdata[63:0]),
    .zcp_pio_err                       (zcp_pio_err),
    .zcp_pio_intr                      (zcp_pio_intr),
    .zcp_debug_port                    (zcp_debug_port[31:0]),
    .fflp_pio_rdata                    (fflp_pio_rdata[63:0]),
    .fflp_pio_ack                      (fflp_pio_ack),
    .fflp_pio_err                      (fflp_pio_err),
    .fflp_pio_intr                     (fflp_pio_intr),
    .fflp_debug_port                   (fflp_debug_port[31:0]),
    .mac_rxc_ack0                      (mac_rxc_ack0),
    .mac_rxc_tag0                      (mac_rxc_tag0),
    .mac_rxc_data0                     (mac_rxc_data0[63:0]),
    .mac_rxc_ctrl0                     (mac_rxc_ctrl0),
    .mac_rxc_stat0                     (mac_rxc_stat0[22:0]),
    .dmc_ipp_dat_req0                  (dmc_ipp_dat_req0),
    .rxc_mac_req0                      (rxc_mac_req0),
    .ipp_dmc_dat_ack0                  (ipp_dmc_dat_ack0),
    .ipp_dmc_data0                     (ipp_dmc_data0[129:0]),
    .ipp_dmc_ful_pkt0                  (ipp_dmc_ful_pkt0),
    .ipp_dmc_dat_err0                  (ipp_dmc_dat_err0),
    .mac_rxc_ack1                      (mac_rxc_ack1),
    .mac_rxc_tag1                      (mac_rxc_tag1),
    .mac_rxc_data1                     (mac_rxc_data1[63:0]),
    .mac_rxc_ctrl1                     (mac_rxc_ctrl1),
    .mac_rxc_stat1                     (mac_rxc_stat1[22:0]),
    .dmc_ipp_dat_req1                  (dmc_ipp_dat_req1),
    .rxc_mac_req1                      (rxc_mac_req1),
    .ipp_dmc_dat_ack1                  (ipp_dmc_dat_ack1),
    .ipp_dmc_data1                     (ipp_dmc_data1[129:0]),
    .ipp_dmc_ful_pkt1                  (ipp_dmc_ful_pkt1),
    .ipp_dmc_dat_err1                  (ipp_dmc_dat_err1),
    .dmc_zcp_req0                      (dmc_zcp_req0),
    .zcp_dmc_ack0                      (zcp_dmc_ack0),
    .zcp_dmc_dat0                      (zcp_dmc_dat0[129:0]),
    .zcp_dmc_dat_err0                  (zcp_dmc_dat_err0),
    .zcp_dmc_ful_pkt0                  (zcp_dmc_ful_pkt0),
    .dmc_zcp_req1                      (dmc_zcp_req1),
    .zcp_dmc_ack1                      (zcp_dmc_ack1),
    .zcp_dmc_dat1                      (zcp_dmc_dat1[129:0]),
    .zcp_dmc_dat_err1                  (zcp_dmc_dat_err1),
    .zcp_dmc_ful_pkt1                  (zcp_dmc_ful_pkt1)
    );

niu_txc txc (
    .niu_clk                       (l1clk),
    .niu_reset_l                   (reset_l),
    .iol2clk                       (iol2clk),
    .l2clk_2x                      (l1clk_2x),
    .tcu_aclk                      (aclk),
    .tcu_bclk                      (bclk),
    .tcu_mbist_bisi_en             (tcu_mbist_bisi_en),
    .tcu_scan_en                   (tcu_scan_en),
    .tcu_se_scancollar_in          (tcu_se_scancollar_in),
    .tcu_se_scancollar_out         (tcu_se_scancollar_out),
    .tcu_array_wr_inhibit          (rtx_array_wr_inhibit),
    .tcu_mbist_user_mode           (tcu_mbist_user_mode),
    .tcu_rtx_txc_txe0_mbist_start  (tcu_rtx_txc_txe0_mbist_start),
    .rtx_txc_txe0_mbist_scan_in    (rtx_rxc_zcp1_mb7_mbist_scan_out),
    .rtx_txc_txe0_tcu_mbist_fail   (rtx_txc_txe0_tcu_mbist_fail),
    .rtx_txc_txe0_tcu_mbist_done   (rtx_txc_txe0_tcu_mbist_done),
    .rtx_txc_txe0_mbist_scan_out   (rtx_txc_txe0_mbist_scan_out),
    .rtx_txc_txe0_dmo_dout         (rtx_txc_txe0_dmo_dout[39:0]),
    .tcu_rtx_txc_txe1_mbist_start  (tcu_rtx_txc_txe1_mbist_start),
    .rtx_txc_txe1_mbist_scan_in    (rtx_txc_txe0_mbist_scan_out),
    .rtx_txc_txe1_tcu_mbist_fail   (rtx_txc_txe1_tcu_mbist_fail),
    .rtx_txc_txe1_tcu_mbist_done   (rtx_txc_txe1_tcu_mbist_done),
    .rtx_txc_txe1_mbist_scan_out   (rtx_mbist_scan_out),
    .rtx_txc_txe1_dmo_dout         (rtx_txc_txe1_dmo_dout[39:0]),
    .hdr_sram_wr_en_txc0_re        (hdr_sram_wr_en_txc0_re),
    .hdr_sram_red_clr_txc0_re      (hdr_sram_red_clr_txc0_re),
    .hdr_sram_wr_en_txc0_st        (hdr_sram_wr_en_txc0_st),
    .hdr_sram_red_clr_txc0_st      (hdr_sram_red_clr_txc0_st),
    .hdr_sram_rid_txc0_re          (hdr_sram_rid_txc0_re[2:0]),
    .hdr_sram_rid_txc0_st          (hdr_sram_rid_txc0_st[2:0]),
    .hdr_sram_rvalue_txc0_re       (hdr_sram_rvalue_txc0_re[6:0]),
    .hdr_sram_rvalue_txc0_st       (hdr_sram_rvalue_txc0_st[6:0]),
    .sram_hdr_read_data_txc0_re    (sram_hdr_read_data_txc0_re[6:0]),
    .sram_hdr_read_data_txc0_st    (sram_hdr_read_data_txc0_st[6:0]),
    .hdr_sram_wr_en_txc1_re        (hdr_sram_wr_en_txc1_re),
    .hdr_sram_red_clr_txc1_re      (hdr_sram_red_clr_txc1_re),
    .hdr_sram_wr_en_txc1_st        (hdr_sram_wr_en_txc1_st),
    .hdr_sram_red_clr_txc1_st      (hdr_sram_red_clr_txc1_st),
    .hdr_sram_rid_txc1_re          (hdr_sram_rid_txc1_re[2:0]),
    .hdr_sram_rid_txc1_st          (hdr_sram_rid_txc1_st[2:0]),
    .hdr_sram_rvalue_txc1_re       (hdr_sram_rvalue_txc1_re[6:0]),
    .hdr_sram_rvalue_txc1_st       (hdr_sram_rvalue_txc1_st[6:0]),
    .sram_hdr_read_data_txc1_re    (sram_hdr_read_data_txc1_re[6:0]),
    .sram_hdr_read_data_txc1_st    (sram_hdr_read_data_txc1_st[6:0]),
    .txc_debug_port                (txc_debug_port[31:0]),
    .pio_clients_rd                (pio_clients_rd),
    .pio_txc_sel                   (pio_txc_sel),
    .pio_clients_addr              (pio_clients_addr[19:0]),
    .pio_clients_wdata             (pio_clients_wdata[31:0]),
    .txc_pio_ack                   (txc_pio_ack),
    .txc_pio_err                   (txc_pio_err),
    .niu_txc_interrupts            (niu_txc_interrupts),
    .txc_pio_rdata                 (txc_pio_rdata[63:0]),
    .mac_txc_req0                  (mac_txc_req0),
    .txc_mac_ack0                  (txc_mac_ack0),
    .txc_mac_tag0                  (txc_mac_tag0),
    .txc_mac_abort0                (txc_mac_abort0),
    .txc_mac_stat0                 (txc_mac_stat0[3:0]),
    .txc_mac_data0                 (txc_mac_data0[63:0]),
    .mac_txc_req1                  (mac_txc_req1),
    .txc_mac_ack1                  (txc_mac_ack1),
    .txc_mac_tag1                  (txc_mac_tag1),
    .txc_mac_abort1                (txc_mac_abort1),
    .txc_mac_stat1                 (txc_mac_stat1[3:0]),
    .txc_mac_data1                 (txc_mac_data1[63:0]),
    .txc_dmc_p0_pkt_size_err       (txc_dmc_p0_pkt_size_err),
    .txc_dmc_p0_pkt_size_err_addr  (txc_dmc_p0_pkt_size_err_addr[43:0]),
    .txc_dmc_p1_pkt_size_err       (txc_dmc_p1_pkt_size_err),
    .txc_dmc_p1_pkt_size_err_addr  (txc_dmc_p1_pkt_size_err_addr[43:0]),
    .txc_dmc_nack_pkt_rd           (txc_dmc_nack_pkt_rd),
    .txc_dmc_nack_pkt_rd_addr      (txc_dmc_nack_pkt_rd_addr[43:0]),
    .txc_dmc_p0_dma_pkt_size_err   (txc_dmc_p0_dma_pkt_size_err[15:0]),
    .txc_dmc_p1_dma_pkt_size_err   (txc_dmc_p1_dma_pkt_size_err[15:0]),
    .txc_dmc_dma_nack_pkt_rd       (txc_dmc_dma_nack_pkt_rd[15:0]),
    .dmc_txc_tx_addr_md            (dmc_txc_tx_addr_md),
    .dmc_txc_dma0_active           (dmc_txc_dma0_active),
    .dmc_txc_dma0_eoflist          (dmc_txc_dma0_eoflist),
    .dmc_txc_dma0_error            (dmc_txc_dma0_error),
    .dmc_txc_dma0_gotnxtdesc       (dmc_txc_dma0_gotnxtdesc),
    .dmc_txc_dma0_cacheready       (dmc_txc_dma0_cacheready),
    .dmc_txc_dma0_partial          (dmc_txc_dma0_partial),
    .dmc_txc_dma0_reset_scheduled  (dmc_txc_dma0_reset_scheduled),
    .dmc_txc_dma0_func_num         (dmc_txc_dma0_func_num[1:0]),
    .dmc_txc_dma0_page_handle      (dmc_txc_dma0_page_handle[19:0]),
    .dmc_txc_dma0_descriptor       (dmc_txc_dma0_descriptor[63:0]),
    .txc_dmc_dma0_getnxtdesc       (txc_dmc_dma0_getnxtdesc),
    .txc_dmc_dma0_inc_head         (txc_dmc_dma0_inc_head),
    .txc_dmc_dma0_reset_done       (txc_dmc_dma0_reset_done),
    .txc_dmc_dma0_mark_bit         (txc_dmc_dma0_mark_bit),
    .txc_dmc_dma0_inc_pkt_cnt      (txc_dmc_dma0_inc_pkt_cnt),
    .dmc_txc_dma1_active           (dmc_txc_dma1_active),
    .dmc_txc_dma1_eoflist          (dmc_txc_dma1_eoflist),
    .dmc_txc_dma1_error            (dmc_txc_dma1_error),
    .dmc_txc_dma1_gotnxtdesc       (dmc_txc_dma1_gotnxtdesc),
    .dmc_txc_dma1_cacheready       (dmc_txc_dma1_cacheready),
    .dmc_txc_dma1_partial          (dmc_txc_dma1_partial),
    .dmc_txc_dma1_reset_scheduled  (dmc_txc_dma1_reset_scheduled),
    .dmc_txc_dma1_func_num         (dmc_txc_dma1_func_num[1:0]),
    .dmc_txc_dma1_page_handle      (dmc_txc_dma1_page_handle[19:0]),
    .dmc_txc_dma1_descriptor       (dmc_txc_dma1_descriptor[63:0]),
    .txc_dmc_dma1_getnxtdesc       (txc_dmc_dma1_getnxtdesc),
    .txc_dmc_dma1_inc_head         (txc_dmc_dma1_inc_head),
    .txc_dmc_dma1_reset_done       (txc_dmc_dma1_reset_done),
    .txc_dmc_dma1_mark_bit         (txc_dmc_dma1_mark_bit),
    .txc_dmc_dma1_inc_pkt_cnt      (txc_dmc_dma1_inc_pkt_cnt),
    .dmc_txc_dma2_active           (dmc_txc_dma2_active),
    .dmc_txc_dma2_eoflist          (dmc_txc_dma2_eoflist),
    .dmc_txc_dma2_error            (dmc_txc_dma2_error),
    .dmc_txc_dma2_gotnxtdesc       (dmc_txc_dma2_gotnxtdesc),
    .dmc_txc_dma2_cacheready       (dmc_txc_dma2_cacheready),
    .dmc_txc_dma2_partial          (dmc_txc_dma2_partial),
    .dmc_txc_dma2_reset_scheduled  (dmc_txc_dma2_reset_scheduled),
    .dmc_txc_dma2_func_num         (dmc_txc_dma2_func_num[1:0]),
    .dmc_txc_dma2_page_handle      (dmc_txc_dma2_page_handle[19:0]),
    .dmc_txc_dma2_descriptor       (dmc_txc_dma2_descriptor[63:0]),
    .txc_dmc_dma2_getnxtdesc       (txc_dmc_dma2_getnxtdesc),
    .txc_dmc_dma2_inc_head         (txc_dmc_dma2_inc_head),
    .txc_dmc_dma2_reset_done       (txc_dmc_dma2_reset_done),
    .txc_dmc_dma2_mark_bit         (txc_dmc_dma2_mark_bit),
    .txc_dmc_dma2_inc_pkt_cnt      (txc_dmc_dma2_inc_pkt_cnt),
    .dmc_txc_dma3_active           (dmc_txc_dma3_active),
    .dmc_txc_dma3_eoflist          (dmc_txc_dma3_eoflist),
    .dmc_txc_dma3_error            (dmc_txc_dma3_error),
    .dmc_txc_dma3_gotnxtdesc       (dmc_txc_dma3_gotnxtdesc),
    .dmc_txc_dma3_cacheready       (dmc_txc_dma3_cacheready),
    .dmc_txc_dma3_partial          (dmc_txc_dma3_partial),
    .dmc_txc_dma3_reset_scheduled  (dmc_txc_dma3_reset_scheduled),
    .dmc_txc_dma3_func_num         (dmc_txc_dma3_func_num[1:0]),
    .dmc_txc_dma3_page_handle      (dmc_txc_dma3_page_handle[19:0]),
    .dmc_txc_dma3_descriptor       (dmc_txc_dma3_descriptor[63:0]),
    .txc_dmc_dma3_getnxtdesc       (txc_dmc_dma3_getnxtdesc),
    .txc_dmc_dma3_inc_head         (txc_dmc_dma3_inc_head),
    .txc_dmc_dma3_reset_done       (txc_dmc_dma3_reset_done),
    .txc_dmc_dma3_mark_bit         (txc_dmc_dma3_mark_bit),
    .txc_dmc_dma3_inc_pkt_cnt      (txc_dmc_dma3_inc_pkt_cnt),
    .dmc_txc_dma4_active           (dmc_txc_dma4_active),
    .dmc_txc_dma4_eoflist          (dmc_txc_dma4_eoflist),
    .dmc_txc_dma4_error            (dmc_txc_dma4_error),
    .dmc_txc_dma4_gotnxtdesc       (dmc_txc_dma4_gotnxtdesc),
    .dmc_txc_dma4_cacheready       (dmc_txc_dma4_cacheready),
    .dmc_txc_dma4_partial          (dmc_txc_dma4_partial),
    .dmc_txc_dma4_reset_scheduled  (dmc_txc_dma4_reset_scheduled),
    .dmc_txc_dma4_func_num         (dmc_txc_dma4_func_num[1:0]),
    .dmc_txc_dma4_page_handle      (dmc_txc_dma4_page_handle[19:0]),
    .dmc_txc_dma4_descriptor       (dmc_txc_dma4_descriptor[63:0]),
    .txc_dmc_dma4_getnxtdesc       (txc_dmc_dma4_getnxtdesc),
    .txc_dmc_dma4_inc_head         (txc_dmc_dma4_inc_head),
    .txc_dmc_dma4_reset_done       (txc_dmc_dma4_reset_done),
    .txc_dmc_dma4_mark_bit         (txc_dmc_dma4_mark_bit),
    .txc_dmc_dma4_inc_pkt_cnt      (txc_dmc_dma4_inc_pkt_cnt),
    .dmc_txc_dma5_active           (dmc_txc_dma5_active),
    .dmc_txc_dma5_eoflist          (dmc_txc_dma5_eoflist),
    .dmc_txc_dma5_error            (dmc_txc_dma5_error),
    .dmc_txc_dma5_gotnxtdesc       (dmc_txc_dma5_gotnxtdesc),
    .dmc_txc_dma5_cacheready       (dmc_txc_dma5_cacheready),
    .dmc_txc_dma5_partial          (dmc_txc_dma5_partial),
    .dmc_txc_dma5_reset_scheduled  (dmc_txc_dma5_reset_scheduled),
    .dmc_txc_dma5_func_num         (dmc_txc_dma5_func_num[1:0]),
    .dmc_txc_dma5_page_handle      (dmc_txc_dma5_page_handle[19:0]),
    .dmc_txc_dma5_descriptor       (dmc_txc_dma5_descriptor[63:0]),
    .txc_dmc_dma5_getnxtdesc       (txc_dmc_dma5_getnxtdesc),
    .txc_dmc_dma5_inc_head         (txc_dmc_dma5_inc_head),
    .txc_dmc_dma5_reset_done       (txc_dmc_dma5_reset_done),
    .txc_dmc_dma5_mark_bit         (txc_dmc_dma5_mark_bit),
    .txc_dmc_dma5_inc_pkt_cnt      (txc_dmc_dma5_inc_pkt_cnt),
    .dmc_txc_dma6_active           (dmc_txc_dma6_active),
    .dmc_txc_dma6_eoflist          (dmc_txc_dma6_eoflist),
    .dmc_txc_dma6_error            (dmc_txc_dma6_error),
    .dmc_txc_dma6_gotnxtdesc       (dmc_txc_dma6_gotnxtdesc),
    .dmc_txc_dma6_cacheready       (dmc_txc_dma6_cacheready),
    .dmc_txc_dma6_partial          (dmc_txc_dma6_partial),
    .dmc_txc_dma6_reset_scheduled  (dmc_txc_dma6_reset_scheduled),
    .dmc_txc_dma6_func_num         (dmc_txc_dma6_func_num[1:0]),
    .dmc_txc_dma6_page_handle      (dmc_txc_dma6_page_handle[19:0]),
    .dmc_txc_dma6_descriptor       (dmc_txc_dma6_descriptor[63:0]),
    .txc_dmc_dma6_getnxtdesc       (txc_dmc_dma6_getnxtdesc),
    .txc_dmc_dma6_inc_head         (txc_dmc_dma6_inc_head),
    .txc_dmc_dma6_reset_done       (txc_dmc_dma6_reset_done),
    .txc_dmc_dma6_mark_bit         (txc_dmc_dma6_mark_bit),
    .txc_dmc_dma6_inc_pkt_cnt      (txc_dmc_dma6_inc_pkt_cnt),
    .dmc_txc_dma7_active           (dmc_txc_dma7_active),
    .dmc_txc_dma7_eoflist          (dmc_txc_dma7_eoflist),
    .dmc_txc_dma7_error            (dmc_txc_dma7_error),
    .dmc_txc_dma7_gotnxtdesc       (dmc_txc_dma7_gotnxtdesc),
    .dmc_txc_dma7_cacheready       (dmc_txc_dma7_cacheready),
    .dmc_txc_dma7_partial          (dmc_txc_dma7_partial),
    .dmc_txc_dma7_reset_scheduled  (dmc_txc_dma7_reset_scheduled),
    .dmc_txc_dma7_func_num         (dmc_txc_dma7_func_num[1:0]),
    .dmc_txc_dma7_page_handle      (dmc_txc_dma7_page_handle[19:0]),
    .dmc_txc_dma7_descriptor       (dmc_txc_dma7_descriptor[63:0]),
    .txc_dmc_dma7_getnxtdesc       (txc_dmc_dma7_getnxtdesc),
    .txc_dmc_dma7_inc_head         (txc_dmc_dma7_inc_head),
    .txc_dmc_dma7_reset_done       (txc_dmc_dma7_reset_done),
    .txc_dmc_dma7_mark_bit         (txc_dmc_dma7_mark_bit),
    .txc_dmc_dma7_inc_pkt_cnt      (txc_dmc_dma7_inc_pkt_cnt),
    .dmc_txc_dma8_active           (dmc_txc_dma8_active),
    .dmc_txc_dma8_eoflist          (dmc_txc_dma8_eoflist),
    .dmc_txc_dma8_error            (dmc_txc_dma8_error),
    .dmc_txc_dma8_gotnxtdesc       (dmc_txc_dma8_gotnxtdesc),
    .dmc_txc_dma8_cacheready       (dmc_txc_dma8_cacheready),
    .dmc_txc_dma8_partial          (dmc_txc_dma8_partial),
    .dmc_txc_dma8_reset_scheduled  (dmc_txc_dma8_reset_scheduled),
    .dmc_txc_dma8_func_num         (dmc_txc_dma8_func_num[1:0]),
    .dmc_txc_dma8_page_handle      (dmc_txc_dma8_page_handle[19:0]),
    .dmc_txc_dma8_descriptor       (dmc_txc_dma8_descriptor[63:0]),
    .txc_dmc_dma8_getnxtdesc       (txc_dmc_dma8_getnxtdesc),
    .txc_dmc_dma8_inc_head         (txc_dmc_dma8_inc_head),
    .txc_dmc_dma8_reset_done       (txc_dmc_dma8_reset_done),
    .txc_dmc_dma8_mark_bit         (txc_dmc_dma8_mark_bit),
    .txc_dmc_dma8_inc_pkt_cnt      (txc_dmc_dma8_inc_pkt_cnt),
    .dmc_txc_dma9_active           (dmc_txc_dma9_active),
    .dmc_txc_dma9_eoflist          (dmc_txc_dma9_eoflist),
    .dmc_txc_dma9_error            (dmc_txc_dma9_error),
    .dmc_txc_dma9_gotnxtdesc       (dmc_txc_dma9_gotnxtdesc),
    .dmc_txc_dma9_cacheready       (dmc_txc_dma9_cacheready),
    .dmc_txc_dma9_partial          (dmc_txc_dma9_partial),
    .dmc_txc_dma9_reset_scheduled  (dmc_txc_dma9_reset_scheduled),
    .dmc_txc_dma9_func_num         (dmc_txc_dma9_func_num[1:0]),
    .dmc_txc_dma9_page_handle      (dmc_txc_dma9_page_handle[19:0]),
    .dmc_txc_dma9_descriptor       (dmc_txc_dma9_descriptor[63:0]),
    .txc_dmc_dma9_getnxtdesc       (txc_dmc_dma9_getnxtdesc),
    .txc_dmc_dma9_inc_head         (txc_dmc_dma9_inc_head),
    .txc_dmc_dma9_reset_done       (txc_dmc_dma9_reset_done),
    .txc_dmc_dma9_mark_bit         (txc_dmc_dma9_mark_bit),
    .txc_dmc_dma9_inc_pkt_cnt      (txc_dmc_dma9_inc_pkt_cnt),
    .dmc_txc_dma10_active          (dmc_txc_dma10_active),
    .dmc_txc_dma10_eoflist         (dmc_txc_dma10_eoflist),
    .dmc_txc_dma10_error           (dmc_txc_dma10_error),
    .dmc_txc_dma10_gotnxtdesc      (dmc_txc_dma10_gotnxtdesc),
    .dmc_txc_dma10_cacheready      (dmc_txc_dma10_cacheready),
    .dmc_txc_dma10_partial         (dmc_txc_dma10_partial),
    .dmc_txc_dma10_reset_scheduled (dmc_txc_dma10_reset_scheduled),
    .dmc_txc_dma10_func_num        (dmc_txc_dma10_func_num[1:0]),
    .dmc_txc_dma10_page_handle     (dmc_txc_dma10_page_handle[19:0]),
    .dmc_txc_dma10_descriptor      (dmc_txc_dma10_descriptor[63:0]),
    .txc_dmc_dma10_getnxtdesc      (txc_dmc_dma10_getnxtdesc),
    .txc_dmc_dma10_inc_head        (txc_dmc_dma10_inc_head),
    .txc_dmc_dma10_reset_done      (txc_dmc_dma10_reset_done),
    .txc_dmc_dma10_mark_bit        (txc_dmc_dma10_mark_bit),
    .txc_dmc_dma10_inc_pkt_cnt     (txc_dmc_dma10_inc_pkt_cnt),
    .dmc_txc_dma11_active          (dmc_txc_dma11_active),
    .dmc_txc_dma11_eoflist         (dmc_txc_dma11_eoflist),
    .dmc_txc_dma11_error           (dmc_txc_dma11_error),
    .dmc_txc_dma11_gotnxtdesc      (dmc_txc_dma11_gotnxtdesc),
    .dmc_txc_dma11_cacheready      (dmc_txc_dma11_cacheready),
    .dmc_txc_dma11_partial         (dmc_txc_dma11_partial),
    .dmc_txc_dma11_reset_scheduled (dmc_txc_dma11_reset_scheduled),
    .dmc_txc_dma11_func_num        (dmc_txc_dma11_func_num[1:0]),
    .dmc_txc_dma11_page_handle     (dmc_txc_dma11_page_handle[19:0]),
    .dmc_txc_dma11_descriptor      (dmc_txc_dma11_descriptor[63:0]),
    .txc_dmc_dma11_getnxtdesc      (txc_dmc_dma11_getnxtdesc),
    .txc_dmc_dma11_inc_head        (txc_dmc_dma11_inc_head),
    .txc_dmc_dma11_reset_done      (txc_dmc_dma11_reset_done),
    .txc_dmc_dma11_mark_bit        (txc_dmc_dma11_mark_bit),
    .txc_dmc_dma11_inc_pkt_cnt     (txc_dmc_dma11_inc_pkt_cnt),
    .dmc_txc_dma12_active          (dmc_txc_dma12_active),
    .dmc_txc_dma12_eoflist         (dmc_txc_dma12_eoflist),
    .dmc_txc_dma12_error           (dmc_txc_dma12_error),
    .dmc_txc_dma12_gotnxtdesc      (dmc_txc_dma12_gotnxtdesc),
    .dmc_txc_dma12_cacheready      (dmc_txc_dma12_cacheready),
    .dmc_txc_dma12_partial         (dmc_txc_dma12_partial),
    .dmc_txc_dma12_reset_scheduled (dmc_txc_dma12_reset_scheduled),
    .dmc_txc_dma12_func_num        (dmc_txc_dma12_func_num[1:0]),
    .dmc_txc_dma12_page_handle     (dmc_txc_dma12_page_handle[19:0]),
    .dmc_txc_dma12_descriptor      (dmc_txc_dma12_descriptor[63:0]),
    .txc_dmc_dma12_getnxtdesc      (txc_dmc_dma12_getnxtdesc),
    .txc_dmc_dma12_inc_head        (txc_dmc_dma12_inc_head),
    .txc_dmc_dma12_reset_done      (txc_dmc_dma12_reset_done),
    .txc_dmc_dma12_mark_bit        (txc_dmc_dma12_mark_bit),
    .txc_dmc_dma12_inc_pkt_cnt     (txc_dmc_dma12_inc_pkt_cnt),
    .dmc_txc_dma13_active          (dmc_txc_dma13_active),
    .dmc_txc_dma13_eoflist         (dmc_txc_dma13_eoflist),
    .dmc_txc_dma13_error           (dmc_txc_dma13_error),
    .dmc_txc_dma13_gotnxtdesc      (dmc_txc_dma13_gotnxtdesc),
    .dmc_txc_dma13_cacheready      (dmc_txc_dma13_cacheready),
    .dmc_txc_dma13_partial         (dmc_txc_dma13_partial),
    .dmc_txc_dma13_reset_scheduled (dmc_txc_dma13_reset_scheduled),
    .dmc_txc_dma13_func_num        (dmc_txc_dma13_func_num[1:0]),
    .dmc_txc_dma13_page_handle     (dmc_txc_dma13_page_handle[19:0]),
    .dmc_txc_dma13_descriptor      (dmc_txc_dma13_descriptor[63:0]),
    .txc_dmc_dma13_getnxtdesc      (txc_dmc_dma13_getnxtdesc),
    .txc_dmc_dma13_inc_head        (txc_dmc_dma13_inc_head),
    .txc_dmc_dma13_reset_done      (txc_dmc_dma13_reset_done),
    .txc_dmc_dma13_mark_bit        (txc_dmc_dma13_mark_bit),
    .txc_dmc_dma13_inc_pkt_cnt     (txc_dmc_dma13_inc_pkt_cnt),
    .dmc_txc_dma14_active          (dmc_txc_dma14_active),
    .dmc_txc_dma14_eoflist         (dmc_txc_dma14_eoflist),
    .dmc_txc_dma14_error           (dmc_txc_dma14_error),
    .dmc_txc_dma14_gotnxtdesc      (dmc_txc_dma14_gotnxtdesc),
    .dmc_txc_dma14_cacheready      (dmc_txc_dma14_cacheready),
    .dmc_txc_dma14_partial         (dmc_txc_dma14_partial),
    .dmc_txc_dma14_reset_scheduled (dmc_txc_dma14_reset_scheduled),
    .dmc_txc_dma14_func_num        (dmc_txc_dma14_func_num[1:0]),
    .dmc_txc_dma14_page_handle     (dmc_txc_dma14_page_handle[19:0]),
    .dmc_txc_dma14_descriptor      (dmc_txc_dma14_descriptor[63:0]),
    .txc_dmc_dma14_getnxtdesc      (txc_dmc_dma14_getnxtdesc),
    .txc_dmc_dma14_inc_head        (txc_dmc_dma14_inc_head),
    .txc_dmc_dma14_reset_done      (txc_dmc_dma14_reset_done),
    .txc_dmc_dma14_mark_bit        (txc_dmc_dma14_mark_bit),
    .txc_dmc_dma14_inc_pkt_cnt     (txc_dmc_dma14_inc_pkt_cnt),
    .dmc_txc_dma15_active          (dmc_txc_dma15_active),
    .dmc_txc_dma15_eoflist         (dmc_txc_dma15_eoflist),
    .dmc_txc_dma15_error           (dmc_txc_dma15_error),
    .dmc_txc_dma15_gotnxtdesc      (dmc_txc_dma15_gotnxtdesc),
    .dmc_txc_dma15_cacheready      (dmc_txc_dma15_cacheready),
    .dmc_txc_dma15_partial         (dmc_txc_dma15_partial),
    .dmc_txc_dma15_reset_scheduled (dmc_txc_dma15_reset_scheduled),
    .dmc_txc_dma15_func_num        (dmc_txc_dma15_func_num[1:0]),
    .dmc_txc_dma15_page_handle     (dmc_txc_dma15_page_handle[19:0]),
    .dmc_txc_dma15_descriptor      (dmc_txc_dma15_descriptor[63:0]),
    .txc_dmc_dma15_getnxtdesc      (txc_dmc_dma15_getnxtdesc),
    .txc_dmc_dma15_inc_head        (txc_dmc_dma15_inc_head),
    .txc_dmc_dma15_reset_done      (txc_dmc_dma15_reset_done),
    .txc_dmc_dma15_mark_bit        (txc_dmc_dma15_mark_bit),
    .txc_dmc_dma15_inc_pkt_cnt     (txc_dmc_dma15_inc_pkt_cnt),
    .arb1_txc_req_accept           (arb1_txc_req_accept),
    .arb1_txc_req_transid          (arb1_txc_req_transid[5:0]),
    .txc_arb1_req                  (txc_arb1_req),
    .txc_arb1_req_func_num         (txc_arb1_req_func_num[1:0]),
    .txc_arb1_req_port_num         (txc_arb1_req_port_num[1:0]),
    .txc_arb1_req_dma_num          (txc_arb1_req_dma_num[4:0]),
    .txc_arb1_req_cmd              (txc_arb1_req_cmd[7:0]),
    .txc_arb1_req_length           (txc_arb1_req_length[13:0]),
    .txc_arb1_req_address          (txc_arb1_req_address[63:0]),
    .meta_dmc_resp_ready           (meta_dmc_resp_ready),
    .meta_dmc_resp_complete        (meta_dmc_resp_complete),
    .meta_dmc_resp_transfer_cmpl   (meta_dmc_resp_transfer_cmpl),
    .meta_dmc_data_valid           (meta_dmc_data_valid),
    .meta_dmc_resp_client          (meta_dmc_resp_client),
    .meta_dmc_resp_port_num        (meta_dmc_resp_port_num[1:0]),
    .meta_dmc_resp_cmd_status      (meta_dmc_resp_cmd_status[3:0]),
    .meta_dmc_resp_data_status     (meta_dmc_resp_data_status[3:0]),
    .meta_dmc_resp_dma_num         (meta_dmc_resp_dma_num[4:0]),
    .meta_dmc_resp_transID         (meta_dmc_resp_trans_id[5:0]),
    .meta_dmc_resp_cmd             (meta_dmc_resp_cmd[7:0]),
    .meta_dmc_resp_byteenable      (meta_dmc_resp_byteenable[15:0]),
    .meta_dmc_resp_length          (meta_dmc_resp_length[13:0]),
    .meta_dmc_resp_address         (meta_dmc_resp_address[63:0]),
    .meta_dmc_data                 (meta_dmc_data[127:0]),
    .dmc_meta_resp_accept          (dmc_meta_resp_accept)
    );

rtx_dmo_mux rtx_dmo_mux (
    .clk (l1clk),
    .in0 (rtx_txc_txe0_dmo_dout),
    .in1 (rtx_txc_txe1_dmo_dout),
    .in2 (rtx_rxc_ipp0_mb3_dmo_dout),
    .in3 (rtx_rxc_ipp1_mb3_dmo_dout),
    .in4 (rtx_rxc_zcp0_mb7_dmo_dout),
    .in5 (rtx_rxc_zcp1_mb7_dmo_dout),
    .in6 (rtx_rxc_vlan_mb6_dmo_dout),
    .sel (tcu_rtx_dmo_ctl[2:0]),
    .out (rtx_tcu_dmo_data_out[39:0])
    );
// VPERL: GENERATED_END


endmodule
