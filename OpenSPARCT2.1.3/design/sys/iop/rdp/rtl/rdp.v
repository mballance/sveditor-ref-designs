// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rdp.v
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
// ##########################################################
// # 
// # File Name    : rdp_clkhdr.vp 
// # Author Name  : Maya Suresh                                  
// # Description  : 
// # Parent Module:                               
// # Child  Module:                                          
// # Interface Mod:                                     
// #                                                         
// # Copyright (c) 2020, Sun Microsystems, Inc.              
// # Sun Proprietary and Confidential                        
// #                                                         
// # Modification :                                          
// #                                                         
// ##########################################################

// VPERL: PERL_BEG
//
// $VPERL_PORT_COMM = 1;
// &MODULE ("rdp");
// #

// &DECLARE ("input", "tcu_atpg_mode");
// &DECLARE ("input", "tcu_wr_inhibit");

// &DECLARE ("input", "scan_in");
// &DECLARE ("output", "scan_out");

// &DECLARE ("output", "pio_clients_wdata[63:0]");
// &DECLARE ("output", "pio_clients_addr[19:0]");
// &DECLARE ("output", "pio_clients_rd");

// &DECLARE ("input", "dbg1_niu_dbg_sel[4:0]");
// &DECLARE ("output", "niu_mio_debug_clock[1:0]");
// &DECLARE ("output", "niu_mio_debug_data[31:0]");

// &DECLARE ("output", "niu_efu_ram0_data");
// &DECLARE ("output", "niu_efu_ram1_data");

// &DECLARE ("input", "tcu_rdp_io_clk_stop");

// &DECLARE ("input","tdmc_pio_intri[31:0]");
// &DECLARE ("input","tdmc_pio_intrj[31:0]");
// ####################################

// &INSTANCE ("/vobs/neptune/design/niu/rdp/rtl/rdp_dmoreg.v", "rdp_dmoreg");
// &INSTANCE ("/vobs/neptune/design/niu/rdp/rtl/n2_niu_pio.v", "niu_pio");
// &INSTANCE ("/vobs/neptune/design/niu/ucb/rtl/niu_pio_ucb.v", "niu_pio_ucb");
// &INSTANCE ("/vobs/neptune/design/niu/rdp/rtl/n2_debug.v", "debug");
// &INSTANCE ("/vobs/neptune/design/niu/rdp/rtl/n2_niu_rdmc.v", "niu_rdmc");
// &INSTANCE ("/vobs/neptune/design/niu/rdp/rtl/rdp_clkgen_rdp_io.v", "rdp_clkgen_rdp_io");
// &INSTANCE ("/vobs/neptune/design/niu/rdp/rtl/rdp_clkgen_rdp_io2x.v", "rdp_clkgen_rdp_io2x");
// &INSTANCE ("/vobs/neptune/design/niu/rdp/rtl/rdp_n2_efuhdr4a_ctl.v", "rdmc_sram_header_0");
// &INSTANCE ("/vobs/neptune/design/niu/rdp/rtl/rdp_n2_efuhdr4b_ctl.v", "rdmc_sram_header_1");

// ####################################
// # SRAM Header
// ####################################

// &CONNECT ("debug.debug_port_sel_in", "dbg1_niu_dbg_sel[4:0]");
// &CONNECT ("debug.debug_clock0_out", "niu_mio_debug_clock[0]");
// &CONNECT ("debug.debug_clock1_out", "niu_mio_debug_clock[1]");
// &CONNECT ("debug.debug_port_data_out", "niu_mio_debug_data[31:0]");

// &CONNECT ("niu_pio.niu_clk", "l1clk");
// &CONNECT ("niu_rdmc.niu_clk", "l1clk");
// &CONNECT ("debug.niu_clk", "l1clk");
// &CONNECT ("rdp_dmoreg.clk", "l1clk");
// &CONNECT ("rdmc_sram_header_0.l2clk", "l1clk");
// &CONNECT ("rdmc_sram_header_1.l2clk", "l1clk");
// &CONNECT ("rdmc_sram_header_0.reset_l", "niu_reset_l");
// &CONNECT ("rdmc_sram_header_1.reset_l", "niu_reset_l");
// &CONNECT ("niu_rdmc.l2clk_2x", "io2xl2clk");
// &CONNECT ("niu_rdmc.iol2clk", "iol2clk");

// &CONNECT ("niu_pio_ucb.niu_clk", "l1clk");
// &CONNECT ("niu_pio_ucb.niu_reset_l", "reset");
// &CONNECT ("niu_pio.dmc_pio_intri", "{tdmc_pio_intri[31:0],rdmc_pio_intr_ldf_a}");
// &CONNECT ("niu_pio.dmc_pio_intrj", "{tdmc_pio_intrj[31:0],rdmc_pio_intr_ldf_b}");

// ## &CONNECT ("niu_rdmc.rdmc_pio_intr_ldf_a", "dmc_pio_intri[31:0]");
// ## &CONNECT ("niu_rdmc.rdmc_pio_intr_ldf_b", "dmc_pio_intri[63:32]");

// &CONNECT ("niu_rdmc.pio_rdmc_wdata", "pio_clients_wdata[63:0]");
// &CONNECT ("niu_rdmc.pio_rdmc_addr", "pio_clients_addr[19:0]");
// &CONNECT ("niu_rdmc.pio_rdmc_rd", "pio_clients_rd");

// &FORCE ("wire","rdmc_pio_port_int");

// ####################################

// &CONNECT ("niu_rdmc.hdr_sram_rvalue_rdmc0", "hdr_sram_rvalue_rdmc0[6:0]");
// &CONNECT ("niu_rdmc.hdr_sram_rid_rdmc0", "hdr_sram_rid_rdmc0[1:0]");
// &CONNECT ("niu_rdmc.hdr_sram_wr_en_rdmc0", "hdr_sram_wr_en_rdmc0");
// &CONNECT ("niu_rdmc.hdr_sram_red_clr_rdmc0", "hdr_sram_red_clr_rdmc0");
// &CONNECT ("niu_rdmc.sram_hdr_read_data_rdmc0", "sram_hdr_read_data_rdmc0[6:0]");

// &CONNECT ("rdmc_sram_header_0.hdr_sram_rvalue", "{Unconnected_3[10:7],hdr_sram_rvalue_rdmc0[6:0]}");
// &CONNECT ("rdmc_sram_header_0.hdr_sram_rid", "{Unconnected_1[10:2],hdr_sram_rid_rdmc0[1:0]}");
// &CONNECT ("rdmc_sram_header_0.hdr_sram_wr_en", "hdr_sram_wr_en_rdmc0");
// &CONNECT ("rdmc_sram_header_0.hdr_sram_red_clr", "hdr_sram_red_clr_rdmc0");
// &CONNECT ("rdmc_sram_header_0.sram_hdr_read_data", "{4'b0,sram_hdr_read_data_rdmc0[6:0]}");

// &CONNECT ("niu_rdmc.hdr_sram_rvalue_rdmc1", "hdr_sram_rvalue_rdmc1[6:0]");
// &CONNECT ("niu_rdmc.hdr_sram_rid_rdmc1", "hdr_sram_rid_rdmc1[1:0]");
// &CONNECT ("niu_rdmc.hdr_sram_wr_en_rdmc1", "hdr_sram_wr_en_rdmc1");
// &CONNECT ("niu_rdmc.hdr_sram_red_clr_rdmc1", "hdr_sram_red_clr_rdmc1");
// &CONNECT ("niu_rdmc.sram_hdr_read_data_rdmc1", "sram_hdr_read_data_rdmc1[6:0]");

// &CONNECT ("rdmc_sram_header_1.hdr_sram_rvalue", "{Unconnected_4[10:7],hdr_sram_rvalue_rdmc1[6:0]}");
// &CONNECT ("rdmc_sram_header_1.hdr_sram_rid", "{Unconnected_2[10:2],hdr_sram_rid_rdmc1[1:0]}");
// &CONNECT ("rdmc_sram_header_1.hdr_sram_wr_en", "hdr_sram_wr_en_rdmc1");
// &CONNECT ("rdmc_sram_header_1.hdr_sram_red_clr", "hdr_sram_red_clr_rdmc1");
// &CONNECT ("rdmc_sram_header_1.sram_hdr_read_data", "{4'b0,sram_hdr_read_data_rdmc1[6:0]}");

// &CONNECT ("rdmc_sram_header_0.efu_hdr_write_data", "efu_niu_ram_data");
// &CONNECT ("rdmc_sram_header_0.efu_hdr_xfer_en", "efu_niu_ram0_xfer_en");
// &CONNECT ("rdmc_sram_header_0.efu_hdr_clr", "efu_niu_ram0_clr");
// &CONNECT ("rdmc_sram_header_0.hdr_efu_read_data", "niu_efu_ram0_data");
// &CONNECT ("rdmc_sram_header_0.hdr_efu_xfer_en", "niu_efu_ram0_xfer_en");
// &CONNECT ("rdmc_sram_header_0.scan_in", "1'b0");
// &CONNECT ("rdmc_sram_header_0.scan_out", "not_used0");

// &CONNECT ("rdmc_sram_header_1.efu_hdr_write_data", "efu_niu_ram_data");
// &CONNECT ("rdmc_sram_header_1.efu_hdr_xfer_en", "efu_niu_ram1_xfer_en");
// &CONNECT ("rdmc_sram_header_1.efu_hdr_clr", "efu_niu_ram1_clr");
// &CONNECT ("rdmc_sram_header_1.hdr_efu_read_data", "niu_efu_ram1_data");
// &CONNECT ("rdmc_sram_header_1.hdr_efu_xfer_en", "niu_efu_ram1_xfer_en");
// &CONNECT ("rdmc_sram_header_1.scan_in", "1'b0");
// ########### Temorary Tie to RDP scan_out ################
// &CONNECT ("rdmc_sram_header_1.scan_out", "scan_out");

// &FORCE ("wire", "not_used0");
// &FORCE ("wire", "Unconnected_1[10:2]");
// &FORCE ("wire", "Unconnected_2[10:2]");
// &FORCE ("wire", "Unconnected_3[10:7]");
// &FORCE ("wire", "Unconnected_4[10:7]");

// ####################################
//
//
// &CONNECT ("rdp_clkgen_rdp_io.gclk", "cmp_gclk_c0_rdp");
// &CONNECT ("rdp_clkgen_rdp_io.l1clk", "l1clk");
// &CONNECT ("rdp_clkgen_rdp_io.por_", "niu_reset_l");
//
// &CONNECT ("rdp_clkgen_rdp_io.tcu_clk_stop", "tcu_rdp_io_clk_stop");
// &CONNECT ("rdp_clkgen_rdp_io.ccu_cmp_slow_sync_en", "1'b0");
// &CONNECT ("rdp_clkgen_rdp_io.ccu_slow_cmp_sync_en", "1'b0");
// &CONNECT ("rdp_clkgen_rdp_io.ccu_div_ph", "gl_rdp_io_out");
//
// &CONNECT ("rdp_clkgen_rdp_io.rst_wmr_protect", "1'b0");
// &CONNECT ("rdp_clkgen_rdp_io.rst_wmr_", "1'b0");
// &CONNECT ("rdp_clkgen_rdp_io.cmp_slow_sync_en", "");
// &CONNECT ("rdp_clkgen_rdp_io.slow_cmp_sync_en", "");
// &CONNECT ("rdp_clkgen_rdp_io.wmr_", "");
// &CONNECT ("rdp_clkgen_rdp_io.wmr_protect", "");
// &CONNECT ("rdp_clkgen_rdp_io.aclk_wmr", "");
// &CONNECT ("rdp_clkgen_rdp_io.pce_ov", "pce_ov");
// &CONNECT ("rdp_clkgen_rdp_io.cluster_div_en", "1'b1");
// &CONNECT ("rdp_clkgen_rdp_io.tcu_scan_en", "tcu_scan_en");
// &CONNECT ("rdp_clkgen_rdp_io.scan_in", "scan_in");
// &CONNECT ("rdp_clkgen_rdp_io.scan_out", "ioclk_scan_out");

// ##########################################################
// &CONNECT ("rdp_clkgen_rdp_io2x.io2xl2clk", "io2xl2clk");
// &CONNECT ("rdp_clkgen_rdp_io2x.aclk", "x2aclk");
// &CONNECT ("rdp_clkgen_rdp_io2x.bclk", "x2bclk");
// &CONNECT ("rdp_clkgen_rdp_io2x.scan_out", "x2so");
// &CONNECT ("rdp_clkgen_rdp_io2x.pce_ov", "x2pce_ov");
// &CONNECT ("rdp_clkgen_rdp_io2x.tcu_pce_ov", "pce_ov");
// &CONNECT ("rdp_clkgen_rdp_io2x.wmr_protect", "x2wmr_protect");
// &CONNECT ("rdp_clkgen_rdp_io2x.wmr_", "x2wmr");
// &CONNECT ("rdp_clkgen_rdp_io2x.por_", "x2por");
// &CONNECT ("rdp_clkgen_rdp_io2x.tcu_clk_stop", "tcu_rdp_io_clk_stop");
// &CONNECT ("rdp_clkgen_rdp_io2x.cmp_slow_sync_en", "x2_cmp_slow_sync_en");
// &CONNECT ("rdp_clkgen_rdp_io2x.slow_cmp_sync_en", "x2_slow_cmp_sync_en");
// &CONNECT ("rdp_clkgen_rdp_io2x.aclk_wmr", "x2aclk_wmr");
// &CONNECT ("rdp_clkgen_rdp_io2x.rst_wmr_protect", "1'b1");
// &CONNECT ("rdp_clkgen_rdp_io2x.rst_wmr_", "1'b0");
// &CONNECT ("rdp_clkgen_rdp_io2x.ccu_cmp_slow_sync_en", "1'b0");
// &CONNECT ("rdp_clkgen_rdp_io2x.ccu_slow_cmp_sync_en", "1'b0");
// &CONNECT ("rdp_clkgen_rdp_io2x.ccu_div_ph", "gl_rdp_io2x_out");
// &CONNECT ("rdp_clkgen_rdp_io2x.cluster_div_en", "1'b1");
// &CONNECT ("rdp_clkgen_rdp_io2x.tcu_scan_en", "tcu_scan_en");
// &CONNECT ("rdp_clkgen_rdp_io2x.scan_in", "ioclk_scan_out");
// &CONNECT ("rdp_clkgen_rdp_io2x.scan_out", "io2xclk_scan_out");
// &CONNECT ("rdp_clkgen_rdp_io2x.tcu_wr_inhibit", "1'b0");
// &CONNECT ("rdp_clkgen_rdp_io2x.array_wr_inhibit", "x2_array_wr_inhibit");
// &CONNECT ("rdp_clkgen_rdp_io2x.gclk", "cmp_gclk_c0_rdp ");

// &FORCE ("wire","io2xclk_scan_out");
// &FORCE ("wire","x2aclk");
// &FORCE ("wire","x2bclk");
// &FORCE ("wire","x2por");
// &FORCE ("wire","x2wmr");
// &FORCE ("wire","x2wmr_protect");
// &FORCE ("wire","x2aclk_wmr");
// &FORCE ("wire", "x2_cmp_slow_sync_en");
// &FORCE ("wire", "x2_slow_cmp_sync_en");
// &FORCE ("wire", "x2pce_ov");
// &FORCE ("wire", "x2_array_wr_inhibit");

// ##########################################################
// &CONNECT ("rdmc_sram_header_0.tcu_clk_stop", "tcu_rdp_io_clk_stop");
// &CONNECT ("rdmc_sram_header_1.tcu_clk_stop", "tcu_rdp_io_clk_stop");
// ##########################################################

// ########################################################
//  &CONNECT ("rdp_clkgen_rdp_io2x.tcu_aclk", "aclk");
//  &CONNECT ("rdp_clkgen_rdp_io2x.tcu_bclk", "bclk");
//  &CONNECT ("niu_rdmc.tcu_aclk", "aclk");
//  &CONNECT ("niu_rdmc.tcu_bclk", "bclk");
//  &CONNECT ("niu_rdmc.tcu_array_wr_inhibit", "array_wr_inhibit");
//  &CONNECT ("rdmc_sram_header_0.tcu_aclk", "aclk");
//  &CONNECT ("rdmc_sram_header_0.tcu_bclk", "bclk");
//  &CONNECT ("rdmc_sram_header_0.tcu_pce_ov", "pce_ov");
//  &CONNECT ("rdmc_sram_header_1.tcu_aclk", "aclk");
//  &CONNECT ("rdmc_sram_header_1.tcu_bclk", "bclk");
//  &CONNECT ("rdmc_sram_header_1.tcu_pce_ov", "pce_ov");


// VPERL: PERL_END
// VPERL: GENERATED_BEG

module rdp (
    tcu_atpg_mode,
    tcu_wr_inhibit,
    scan_in,
    scan_out,
    pio_clients_wdata,
    pio_clients_addr,
    pio_clients_rd,
    dbg1_niu_dbg_sel,
    niu_mio_debug_clock,
    niu_mio_debug_data,
    niu_efu_ram0_data,
    niu_efu_ram1_data,
    tcu_rdp_io_clk_stop,
    tdmc_pio_intri,
    tdmc_pio_intrj,
    arb_pio_all_npwdirty,
    arb_pio_all_rddirty,
    arb_pio_dirtid_npwstatus,
    arb_pio_dirtid_rdstatus,
    cluster_arst_l,
    cmp_gclk_c0_rdp,
    efu_niu_ram0_clr,
    efu_niu_ram0_xfer_en,
    efu_niu_ram1_clr,
    efu_niu_ram1_xfer_en,
    efu_niu_ram_data,
    fflp_debug_port,
    fflp_pio_ack,
    fflp_pio_err,
    fflp_pio_intr,
    fflp_pio_rdata,
    gl_rdp_io2x_out,
    gl_rdp_io_out,
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
    mac_debug_port,
    mac_pio_ack,
    mac_pio_err,
    mac_pio_intr0,
    mac_pio_intr1,
    mac_pio_rdata,
    meta0_rdmc_rcr_ack_client,
    meta0_rdmc_rcr_ack_cmd,
    meta0_rdmc_rcr_ack_cmd_status,
    meta0_rdmc_rcr_ack_dma_num,
    meta0_rdmc_rcr_ack_ready,
    meta0_rdmc_rcr_data_req,
    meta0_rdmc_rcr_req_accept,
    meta0_rdmc_wr_data_req,
    meta0_rdmc_wr_req_accept,
    meta1_rdmc_rbr_req_accept,
    meta1_rdmc_rbr_req_error,
    meta1_rdmc_rbr_resp_byteenable,
    meta1_rdmc_rbr_resp_client,
    meta1_rdmc_rbr_resp_cmd,
    meta1_rdmc_rbr_resp_cmd_status,
    meta1_rdmc_rbr_resp_comp,
    meta1_rdmc_rbr_resp_data,
    meta1_rdmc_rbr_resp_data_status,
    meta1_rdmc_rbr_resp_data_valid,
    meta1_rdmc_rbr_resp_dma_num,
    meta1_rdmc_rbr_resp_ready,
    meta1_rdmc_rbr_resp_trans_comp,
    meta_arb_debug_port,
    mif_pio_intr,
    ncu_niu_data,
    ncu_niu_stall,
    ncu_niu_vld,
    rdp_rdmc_mbist_scan_in,
    rst_por_,
    smx_debug_port,
    smx_pio_intr,
    smx_pio_status,
    tcu_aclk,
    tcu_bclk,
    tcu_div_bypass,
    tcu_mbist_bisi_en,
    tcu_mbist_user_mode,
    tcu_pce_ov,
    tcu_rdp_rdmc_mbist_start,
    tcu_scan_en,
    tcu_se_scancollar_in,
    tcu_se_scancollar_out,
    tdmc_debug_port,
    tdmc_pio_ack,
    tdmc_pio_err,
    tdmc_pio_rdata,
    txc_debug_port,
    txc_pio_ack,
    txc_pio_err,
    txc_pio_intr,
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
    zcp_pio_rdata,
    dmc_ipp_dat_req0,
    dmc_ipp_dat_req1,
    dmc_zcp_req0,
    dmc_zcp_req1,
    mac_reset0,
    mac_reset1,
    niu_efu_ram0_xfer_en,
    niu_efu_ram1_xfer_en,
    niu_ncu_data,
    niu_ncu_stall,
    niu_ncu_vld,
    pio_arb_ctrl,
    pio_arb_debug_vector,
    pio_arb_dirtid_clr,
    pio_arb_dirtid_enable,
    pio_arb_np_threshold,
    pio_arb_rd_threshold,
    pio_fflp_sel,
    pio_ipp_sel,
    pio_mac_sel,
    pio_smx_cfg_data,
    pio_smx_clear_intr,
    pio_smx_ctrl,
    pio_smx_debug_vector,
    pio_tdmc_sel,
    pio_txc_sel,
    pio_zcp_sel,
    rdmc_meta0_rcr_ack_accept,
    rdmc_meta0_rcr_data,
    rdmc_meta0_rcr_data_valid,
    rdmc_meta0_rcr_req,
    rdmc_meta0_rcr_req_address,
    rdmc_meta0_rcr_req_byteenable,
    rdmc_meta0_rcr_req_cmd,
    rdmc_meta0_rcr_req_dma_num,
    rdmc_meta0_rcr_req_func_num,
    rdmc_meta0_rcr_req_length,
    rdmc_meta0_rcr_req_port_num,
    rdmc_meta0_rcr_status,
    rdmc_meta0_rcr_transfer_comp,
    rdmc_meta0_wr_data,
    rdmc_meta0_wr_data_valid,
    rdmc_meta0_wr_req,
    rdmc_meta0_wr_req_address,
    rdmc_meta0_wr_req_byteenable,
    rdmc_meta0_wr_req_cmd,
    rdmc_meta0_wr_req_dma_num,
    rdmc_meta0_wr_req_func_num,
    rdmc_meta0_wr_req_length,
    rdmc_meta0_wr_req_port_num,
    rdmc_meta0_wr_status,
    rdmc_meta0_wr_transfer_comp,
    rdmc_meta1_rbr_req,
    rdmc_meta1_rbr_req_address,
    rdmc_meta1_rbr_req_cmd,
    rdmc_meta1_rbr_req_dma_num,
    rdmc_meta1_rbr_req_func_num,
    rdmc_meta1_rbr_req_length,
    rdmc_meta1_rbr_req_port_num,
    rdmc_meta1_rbr_resp_accept,
    rdp_rdmc_mbist_scan_out,
    rdp_rdmc_tcu_mbist_done,
    rdp_rdmc_tcu_mbist_fail,
    rdp_tcu_dmo_dout 
    );

input		arb_pio_all_npwdirty;
input		arb_pio_all_rddirty;
input	[5:0]	arb_pio_dirtid_npwstatus;
input	[5:0]	arb_pio_dirtid_rdstatus;
input		cluster_arst_l;
input		cmp_gclk_c0_rdp;
input		efu_niu_ram0_clr;
input		efu_niu_ram0_xfer_en;
input		efu_niu_ram1_clr;
input		efu_niu_ram1_xfer_en;
input		efu_niu_ram_data;
input	[31:0]	fflp_debug_port;
input		fflp_pio_ack;
input		fflp_pio_err;
input		fflp_pio_intr;
input	[63:0]	fflp_pio_rdata;
input		gl_rdp_io2x_out;
input		gl_rdp_io_out;
input	[31:0]	ipp_debug_port;
input		ipp_dmc_dat_ack0;
input		ipp_dmc_dat_ack1;
input		ipp_dmc_dat_err0;
input		ipp_dmc_dat_err1;
input	[129:0]	ipp_dmc_data0;
input	[129:0]	ipp_dmc_data1;
input		ipp_dmc_ful_pkt0;
input		ipp_dmc_ful_pkt1;
input		ipp_pio_ack;
input		ipp_pio_err;
input		ipp_pio_intr;
input	[63:0]	ipp_pio_rdata;
input	[31:0]	mac_debug_port;
input		mac_pio_ack;
input		mac_pio_err;
input		mac_pio_intr0;
input		mac_pio_intr1;
input	[63:0]	mac_pio_rdata;
input		meta0_rdmc_rcr_ack_client;
input	[7:0]	meta0_rdmc_rcr_ack_cmd;
input	[3:0]	meta0_rdmc_rcr_ack_cmd_status;
input	[4:0]	meta0_rdmc_rcr_ack_dma_num;
input		meta0_rdmc_rcr_ack_ready;
input		meta0_rdmc_rcr_data_req;
input		meta0_rdmc_rcr_req_accept;
input		meta0_rdmc_wr_data_req;
input		meta0_rdmc_wr_req_accept;
input		meta1_rdmc_rbr_req_accept;
input		meta1_rdmc_rbr_req_error;
input	[15:0]	meta1_rdmc_rbr_resp_byteenable;
input		meta1_rdmc_rbr_resp_client;
input	[7:0]	meta1_rdmc_rbr_resp_cmd;
input	[3:0]	meta1_rdmc_rbr_resp_cmd_status;
input		meta1_rdmc_rbr_resp_comp;
input	[127:0]	meta1_rdmc_rbr_resp_data;
input	[3:0]	meta1_rdmc_rbr_resp_data_status;
input		meta1_rdmc_rbr_resp_data_valid;
input	[4:0]	meta1_rdmc_rbr_resp_dma_num;
input		meta1_rdmc_rbr_resp_ready;
input		meta1_rdmc_rbr_resp_trans_comp;
input	[31:0]	meta_arb_debug_port;
input		mif_pio_intr;
input	[31:0]	ncu_niu_data;
input		ncu_niu_stall;
input		ncu_niu_vld;
input		rdp_rdmc_mbist_scan_in;
input		rst_por_;
input	[31:0]	smx_debug_port;
input		smx_pio_intr;
input	[31:0]	smx_pio_status;
input		tcu_aclk;
input		tcu_bclk;
input		tcu_div_bypass;                   // bypasses clk divider to mux in ext clk
input		tcu_mbist_bisi_en;
input		tcu_mbist_user_mode;
input		tcu_pce_ov;
input		tcu_rdp_rdmc_mbist_start;
input		tcu_scan_en;                      // unused as of today - feb 10, 05
input		tcu_se_scancollar_in;
input		tcu_se_scancollar_out;
input	[31:0]	tdmc_debug_port;
input		tdmc_pio_ack;
input		tdmc_pio_err;
input	[63:0]	tdmc_pio_rdata;
input	[31:0]	txc_debug_port;
input		txc_pio_ack;
input		txc_pio_err;
input		txc_pio_intr;
input	[63:0]	txc_pio_rdata;
input	[31:0]	zcp_debug_port;
input		zcp_dmc_ack0;
input		zcp_dmc_ack1;
input	[129:0]	zcp_dmc_dat0;
input	[129:0]	zcp_dmc_dat1;
input		zcp_dmc_dat_err0;
input		zcp_dmc_dat_err1;
input		zcp_dmc_ful_pkt0;
input		zcp_dmc_ful_pkt1;
input		zcp_pio_ack;
input		zcp_pio_err;
input		zcp_pio_intr;
input	[63:0]	zcp_pio_rdata;
output		dmc_ipp_dat_req0;
output		dmc_ipp_dat_req1;
output		dmc_zcp_req0;
output		dmc_zcp_req1;
output		mac_reset0;
output		mac_reset1;
output		niu_efu_ram0_xfer_en;
output		niu_efu_ram1_xfer_en;
output	[31:0]	niu_ncu_data;
output		niu_ncu_stall;
output		niu_ncu_vld;
output	[31:0]	pio_arb_ctrl;
output	[31:0]	pio_arb_debug_vector;
output		pio_arb_dirtid_clr;
output		pio_arb_dirtid_enable;
output	[5:0]	pio_arb_np_threshold;
output	[5:0]	pio_arb_rd_threshold;
output		pio_fflp_sel;
output		pio_ipp_sel;
output		pio_mac_sel;
output	[31:0]	pio_smx_cfg_data;
output		pio_smx_clear_intr;
output	[31:0]	pio_smx_ctrl;
output	[31:0]	pio_smx_debug_vector;
output		pio_tdmc_sel;
output		pio_txc_sel;
output		pio_zcp_sel;
output		rdmc_meta0_rcr_ack_accept;
output	[127:0]	rdmc_meta0_rcr_data;
output		rdmc_meta0_rcr_data_valid;
output		rdmc_meta0_rcr_req;
output	[63:0]	rdmc_meta0_rcr_req_address;
output	[15:0]	rdmc_meta0_rcr_req_byteenable;
output	[7:0]	rdmc_meta0_rcr_req_cmd;
output	[4:0]	rdmc_meta0_rcr_req_dma_num;
output	[1:0]	rdmc_meta0_rcr_req_func_num;
output	[13:0]	rdmc_meta0_rcr_req_length;
output	[1:0]	rdmc_meta0_rcr_req_port_num;
output	[3:0]	rdmc_meta0_rcr_status;
output		rdmc_meta0_rcr_transfer_comp;
output	[127:0]	rdmc_meta0_wr_data;
output		rdmc_meta0_wr_data_valid;
output		rdmc_meta0_wr_req;
output	[63:0]	rdmc_meta0_wr_req_address;
output	[15:0]	rdmc_meta0_wr_req_byteenable;
output	[7:0]	rdmc_meta0_wr_req_cmd;
output	[4:0]	rdmc_meta0_wr_req_dma_num;
output	[1:0]	rdmc_meta0_wr_req_func_num;
output	[13:0]	rdmc_meta0_wr_req_length;
output	[1:0]	rdmc_meta0_wr_req_port_num;
output	[3:0]	rdmc_meta0_wr_status;
output		rdmc_meta0_wr_transfer_comp;
output		rdmc_meta1_rbr_req;
output	[63:0]	rdmc_meta1_rbr_req_address;
output	[7:0]	rdmc_meta1_rbr_req_cmd;
output	[4:0]	rdmc_meta1_rbr_req_dma_num;
output	[1:0]	rdmc_meta1_rbr_req_func_num;
output	[13:0]	rdmc_meta1_rbr_req_length;
output	[1:0]	rdmc_meta1_rbr_req_port_num;
output		rdmc_meta1_rbr_resp_accept;
output		rdp_rdmc_mbist_scan_out;
output		rdp_rdmc_tcu_mbist_done;
output		rdp_rdmc_tcu_mbist_fail;
output	[39:0]	rdp_tcu_dmo_dout;

wire	[26:0]	addr_in;
wire	[63:0]	data_in;
wire	[63:0]	data_out;
wire	[31:0]	pio_debug_port;
wire	[31:0]	rdmc_debug_port;
wire	[31:0]	rdmc_pio_intr_ldf_a;
wire	[31:0]	rdmc_pio_intr_ldf_b;
wire	[63:0]	rdmc_pio_rdata;
wire	[39:0]	rdp_tcu_dmo_data_out;
wire	[10:2]	Unconnected_1;
wire	[10:2]	Unconnected_2;
wire	[10:7]	Unconnected_3;
wire	[10:7]	Unconnected_4;
wire		aclk;
wire		array_wr_inhibit;
wire		bclk;
wire	[1:0]	buf_id_in;
wire	[1:0]	buf_id_out;
wire	[6:0]	dev_id;
wire		hdr_sram_red_clr_rdmc0;
wire		hdr_sram_red_clr_rdmc1;
wire	[1:0]	hdr_sram_rid_rdmc0;
wire	[1:0]	hdr_sram_rid_rdmc1;
wire	[6:0]	hdr_sram_rvalue_rdmc0;
wire	[6:0]	hdr_sram_rvalue_rdmc1;
wire		hdr_sram_wr_en_rdmc0;
wire		hdr_sram_wr_en_rdmc1;
wire		int_busy;
wire		int_vld;
wire		io2xclk_scan_out;
wire		io2xl2clk;
wire		ioclk_scan_out;
wire		iol2clk;
wire		l1clk;
wire		niu_reset_l;
wire		not_used0;
wire		pce_ov;
wire		pio_rdmc_sel;
wire		rack_busy;
wire		rd_ack_vld;
wire		rd_nack_vld;
wire		rd_req_vld;
wire		rdmc_pio_ack;
wire		rdmc_pio_err;
wire		rdmc_pio_port_int;
wire		req_accepted;
wire		reset;
wire	[6:0]	sram_hdr_read_data_rdmc0;
wire	[6:0]	sram_hdr_read_data_rdmc1;
wire	[5:0]	thr_id_in;
wire	[5:0]	thr_id_out;
wire		wr_req_vld;
wire		x2_array_wr_inhibit;
wire		x2_cmp_slow_sync_en;
wire		x2_slow_cmp_sync_en;
wire		x2aclk;
wire		x2aclk_wmr;
wire		x2bclk;
wire		x2pce_ov;
wire		x2por;
wire		x2wmr;
wire		x2wmr_protect;
input		tcu_atpg_mode;                    // New
input		tcu_wr_inhibit;                   // New
input		scan_in;                          // unused as of today - feb 10, 05
output		scan_out;                         // unused as of today - feb 10, 05
output	[63:0]	pio_clients_wdata;
output	[19:0]	pio_clients_addr;
output		pio_clients_rd;
input	[4:0]	dbg1_niu_dbg_sel;
output	[1:0]	niu_mio_debug_clock;
output	[31:0]	niu_mio_debug_data;
output		niu_efu_ram0_data;
output		niu_efu_ram1_data;
input		tcu_rdp_io_clk_stop;
input	[31:0]	tdmc_pio_intri;
input	[31:0]	tdmc_pio_intrj;

rdp_dmoreg rdp_dmoreg (
    .clk                  (l1clk),
    .rdp_tcu_dmo_data_out (rdp_tcu_dmo_data_out[39:0]),
    .rdp_tcu_dmo_dout     (rdp_tcu_dmo_dout[39:0])
    );

niu_pio niu_pio (
    .pio_smx_cfg_data         (pio_smx_cfg_data[31:0]),
    .smx_pio_intr             (smx_pio_intr),
    .smx_pio_status           (smx_pio_status[31:0]),
    .pio_smx_clear_intr       (pio_smx_clear_intr),
    .pio_smx_ctrl             (pio_smx_ctrl[31:0]),
    .pio_smx_debug_vector     (pio_smx_debug_vector[31:0]),
    .niu_reset_l              (niu_reset_l),
    .niu_clk                  (l1clk),
    .reset                    (reset),
    .pio_clients_addr         (pio_clients_addr[19:0]),
    .pio_clients_rd           (pio_clients_rd),
    .pio_clients_wdata        (pio_clients_wdata[63:0]),
    .pio_mac_sel              (pio_mac_sel),
    .mac_pio_ack              (mac_pio_ack),
    .mac_pio_rdata            (mac_pio_rdata[63:0]),
    .mac_pio_err              (mac_pio_err),
    .mac_pio_intr0            (mac_pio_intr0),
    .mac_pio_intr1            (mac_pio_intr1),
    .mif_pio_intr             (mif_pio_intr),
    .pio_ipp_sel              (pio_ipp_sel),
    .ipp_pio_ack              (ipp_pio_ack),
    .ipp_pio_rdata            (ipp_pio_rdata[63:0]),
    .ipp_pio_err              (ipp_pio_err),
    .ipp_pio_intr             (ipp_pio_intr),
    .pio_fflp_sel             (pio_fflp_sel),
    .fflp_pio_ack             (fflp_pio_ack),
    .fflp_pio_rdata           (fflp_pio_rdata[63:0]),
    .fflp_pio_err             (fflp_pio_err),
    .fflp_pio_intr            (fflp_pio_intr),
    .pio_zcp_sel              (pio_zcp_sel),
    .zcp_pio_ack              (zcp_pio_ack),
    .zcp_pio_rdata            (zcp_pio_rdata[63:0]),
    .zcp_pio_err              (zcp_pio_err),
    .zcp_pio_intr             (zcp_pio_intr),
    .pio_tdmc_sel             (pio_tdmc_sel),
    .tdmc_pio_ack             (tdmc_pio_ack),
    .tdmc_pio_rdata           (tdmc_pio_rdata[63:0]),
    .tdmc_pio_err             (tdmc_pio_err),
    .pio_rdmc_sel             (pio_rdmc_sel),
    .rdmc_pio_ack             (rdmc_pio_ack),
    .rdmc_pio_rdata           (rdmc_pio_rdata[63:0]),
    .rdmc_pio_err             (rdmc_pio_err),
    .rdmc_pio_port_int        (rdmc_pio_port_int),
    .dmc_pio_intri            ({tdmc_pio_intri[31:0],rdmc_pio_intr_ldf_a}),
    .dmc_pio_intrj            ({tdmc_pio_intrj[31:0],rdmc_pio_intr_ldf_b}),
    .pio_txc_sel              (pio_txc_sel),
    .txc_pio_ack              (txc_pio_ack),
    .txc_pio_rdata            (txc_pio_rdata[63:0]),
    .txc_pio_err              (txc_pio_err),
    .txc_pio_intr             (txc_pio_intr),
    .rd_req_vld               (rd_req_vld),
    .addr_in                  (addr_in),
    .thr_id_in                (thr_id_in[5:0]),
    .buf_id_in                (buf_id_in[1:0]),
    .req_accepted             (req_accepted),
    .rack_busy                (rack_busy),
    .rd_ack_vld               (rd_ack_vld),
    .rd_nack_vld              (rd_nack_vld),
    .data_out                 (data_out[63:0]),
    .thr_id_out               (thr_id_out[5:0]),
    .buf_id_out               (buf_id_out[1:0]),
    .wr_req_vld               (wr_req_vld),
    .data_in                  (data_in[63:0]),
    .int_busy                 (int_busy),
    .int_vld                  (int_vld),
    .dev_id                   (dev_id[6:0]),
    .mac_reset0               (mac_reset0),
    .mac_reset1               (mac_reset1),
    .pio_debug_port           (pio_debug_port[31:0]),
    .pio_arb_dirtid_enable    (pio_arb_dirtid_enable),
    .pio_arb_dirtid_clr       (pio_arb_dirtid_clr),
    .pio_arb_np_threshold     (pio_arb_np_threshold[5:0]),
    .pio_arb_rd_threshold     (pio_arb_rd_threshold[5:0]),
    .arb_pio_dirtid_rdstatus  (arb_pio_dirtid_rdstatus[5:0]),
    .arb_pio_dirtid_npwstatus (arb_pio_dirtid_npwstatus[5:0]),
    .arb_pio_all_npwdirty     (arb_pio_all_npwdirty),
    .arb_pio_all_rddirty      (arb_pio_all_rddirty),
    .pio_arb_ctrl             (pio_arb_ctrl[31:0]),
    .pio_arb_debug_vector     (pio_arb_debug_vector[31:0])
    );

niu_pio_ucb niu_pio_ucb (
    .niu_clk       (l1clk),
    .niu_reset_l   (reset),
    .ncu_niu_vld   (ncu_niu_vld),
    .ncu_niu_data  (ncu_niu_data[31:0]),
    .niu_ncu_stall (niu_ncu_stall),
    .niu_ncu_vld   (niu_ncu_vld),
    .niu_ncu_data  (niu_ncu_data[31:0]),
    .ncu_niu_stall (ncu_niu_stall),
    .rd_req_vld    (rd_req_vld),
    .wr_req_vld    (wr_req_vld),
    .thr_id_in     (thr_id_in[5:0]),
    .buf_id_in     (buf_id_in[1:0]),
    .addr_in       (addr_in[26:0]),
    .data_in       (data_in[63:0]),
    .req_accepted  (req_accepted),
    .rd_ack_vld    (rd_ack_vld),
    .rd_nack_vld   (rd_nack_vld),
    .thr_id_out    (thr_id_out[5:0]),
    .buf_id_out    (buf_id_out[1:0]),
    .data_out      (data_out[63:0]),
    .rack_busy     (rack_busy),
    .int_vld       (int_vld),
    .dev_id        (dev_id[6:0]),
    .int_busy      (int_busy)
    );

debug debug (
    .debug_port_sel_in   (dbg1_niu_dbg_sel[4:0]),
    .debug_port_data_out (niu_mio_debug_data[31:0]),
    .txc_debug_port      (txc_debug_port[31:0]),
    .tdmc_debug_port     (tdmc_debug_port[31:0]),
    .rdmc_debug_port     (rdmc_debug_port[31:0]),
    .zcp_debug_port      (zcp_debug_port[31:0]),
    .ipp_debug_port      (ipp_debug_port[31:0]),
    .fflp_debug_port     (fflp_debug_port[31:0]),
    .pio_debug_port      (pio_debug_port[31:0]),
    .mac_debug_port      (mac_debug_port[31:0]),
    .meta_arb_debug_port (meta_arb_debug_port[31:0]),
    .niu_clk             (l1clk),
    .smx_debug_port      (smx_debug_port[31:0]),
    .debug_clock0_out    (niu_mio_debug_clock[0]),
    .debug_clock1_out    (niu_mio_debug_clock[1])
    );

niu_rdmc niu_rdmc (
    .niu_clk                         (l1clk),
    .niu_reset_l                     (niu_reset_l),
    .pio_rdmc_wdata                  (pio_clients_wdata[63:0]),
    .pio_rdmc_rd                     (pio_clients_rd),
    .pio_rdmc_sel                    (pio_rdmc_sel),
    .pio_rdmc_addr                   (pio_clients_addr[19:0]),
    .ipp_dmc_ful_pkt0                (ipp_dmc_ful_pkt0),
    .ipp_dmc_dat_ack0                (ipp_dmc_dat_ack0),
    .ipp_dmc_dat_err0                (ipp_dmc_dat_err0),
    .ipp_dmc_data0                   (ipp_dmc_data0[129:0]),
    .ipp_dmc_ful_pkt1                (ipp_dmc_ful_pkt1),
    .ipp_dmc_dat_ack1                (ipp_dmc_dat_ack1),
    .ipp_dmc_dat_err1                (ipp_dmc_dat_err1),
    .ipp_dmc_data1                   (ipp_dmc_data1[129:0]),
    .zcp_dmc_ful_pkt0                (zcp_dmc_ful_pkt0),
    .zcp_dmc_ack0                    (zcp_dmc_ack0),
    .zcp_dmc_dat0                    (zcp_dmc_dat0[129:0]),
    .zcp_dmc_dat_err0                (zcp_dmc_dat_err0),
    .zcp_dmc_ful_pkt1                (zcp_dmc_ful_pkt1),
    .zcp_dmc_ack1                    (zcp_dmc_ack1),
    .zcp_dmc_dat1                    (zcp_dmc_dat1[129:0]),
    .zcp_dmc_dat_err1                (zcp_dmc_dat_err1),
    .meta0_rdmc_wr_req_accept        (meta0_rdmc_wr_req_accept),
    .meta0_rdmc_wr_data_req          (meta0_rdmc_wr_data_req),
    .meta0_rdmc_rcr_req_accept       (meta0_rdmc_rcr_req_accept),
    .meta0_rdmc_rcr_data_req         (meta0_rdmc_rcr_data_req),
    .meta0_rdmc_rcr_ack_ready        (meta0_rdmc_rcr_ack_ready),
    .meta0_rdmc_rcr_ack_cmd          (meta0_rdmc_rcr_ack_cmd[7:0]),
    .meta0_rdmc_rcr_ack_cmd_status   (meta0_rdmc_rcr_ack_cmd_status[3:0]),
    .meta0_rdmc_rcr_ack_client       (meta0_rdmc_rcr_ack_client),
    .meta0_rdmc_rcr_ack_dma_num      (meta0_rdmc_rcr_ack_dma_num[4:0]),
    .meta1_rdmc_rbr_req_accept       (meta1_rdmc_rbr_req_accept),
    .meta1_rdmc_rbr_req_error        (meta1_rdmc_rbr_req_error),
    .meta1_rdmc_rbr_resp_ready       (meta1_rdmc_rbr_resp_ready),
    .meta1_rdmc_rbr_resp_cmd         (meta1_rdmc_rbr_resp_cmd[7:0]),
    .meta1_rdmc_rbr_resp_cmd_status  (meta1_rdmc_rbr_resp_cmd_status[3:0]),
    .meta1_rdmc_rbr_resp_dma_num     (meta1_rdmc_rbr_resp_dma_num[4:0]),
    .meta1_rdmc_rbr_resp_client      (meta1_rdmc_rbr_resp_client),
    .meta1_rdmc_rbr_resp_comp        (meta1_rdmc_rbr_resp_comp),
    .meta1_rdmc_rbr_resp_trans_comp  (meta1_rdmc_rbr_resp_trans_comp),
    .meta1_rdmc_rbr_resp_data_valid  (meta1_rdmc_rbr_resp_data_valid),
    .meta1_rdmc_rbr_resp_data        (meta1_rdmc_rbr_resp_data[127:0]),
    .meta1_rdmc_rbr_resp_byteenable  (meta1_rdmc_rbr_resp_byteenable[15:0]),
    .meta1_rdmc_rbr_resp_data_status (meta1_rdmc_rbr_resp_data_status[3:0]),
    .rdmc_pio_rdata                  (rdmc_pio_rdata[63:0]),
    .rdmc_pio_ack                    (rdmc_pio_ack),
    .rdmc_pio_err                    (rdmc_pio_err),
    .rdmc_pio_port_int               (rdmc_pio_port_int),
    .rdmc_pio_intr_ldf_a             (rdmc_pio_intr_ldf_a[31:0]),
    .rdmc_pio_intr_ldf_b             (rdmc_pio_intr_ldf_b[31:0]),
    .dmc_ipp_dat_req0                (dmc_ipp_dat_req0),
    .dmc_ipp_dat_req1                (dmc_ipp_dat_req1),
    .dmc_zcp_req0                    (dmc_zcp_req0),
    .dmc_zcp_req1                    (dmc_zcp_req1),
    .rdmc_meta0_wr_req               (rdmc_meta0_wr_req),
    .rdmc_meta0_wr_req_cmd           (rdmc_meta0_wr_req_cmd[7:0]),
    .rdmc_meta0_wr_req_address       (rdmc_meta0_wr_req_address[63:0]),
    .rdmc_meta0_wr_req_length        (rdmc_meta0_wr_req_length[13:0]),
    .rdmc_meta0_wr_req_port_num      (rdmc_meta0_wr_req_port_num[1:0]),
    .rdmc_meta0_wr_req_dma_num       (rdmc_meta0_wr_req_dma_num[4:0]),
    .rdmc_meta0_wr_req_func_num      (rdmc_meta0_wr_req_func_num[1:0]),
    .rdmc_meta0_wr_data_valid        (rdmc_meta0_wr_data_valid),
    .rdmc_meta0_wr_data              (rdmc_meta0_wr_data[127:0]),
    .rdmc_meta0_wr_req_byteenable    (rdmc_meta0_wr_req_byteenable[15:0]),
    .rdmc_meta0_wr_transfer_comp     (rdmc_meta0_wr_transfer_comp),
    .rdmc_meta0_wr_status            (rdmc_meta0_wr_status[3:0]),
    .rdmc_meta0_rcr_req              (rdmc_meta0_rcr_req),
    .rdmc_meta0_rcr_req_cmd          (rdmc_meta0_rcr_req_cmd[7:0]),
    .rdmc_meta0_rcr_req_address      (rdmc_meta0_rcr_req_address[63:0]),
    .rdmc_meta0_rcr_req_length       (rdmc_meta0_rcr_req_length[13:0]),
    .rdmc_meta0_rcr_req_port_num     (rdmc_meta0_rcr_req_port_num[1:0]),
    .rdmc_meta0_rcr_req_dma_num      (rdmc_meta0_rcr_req_dma_num[4:0]),
    .rdmc_meta0_rcr_req_func_num     (rdmc_meta0_rcr_req_func_num[1:0]),
    .rdmc_meta0_rcr_data_valid       (rdmc_meta0_rcr_data_valid),
    .rdmc_meta0_rcr_data             (rdmc_meta0_rcr_data[127:0]),
    .rdmc_meta0_rcr_req_byteenable   (rdmc_meta0_rcr_req_byteenable[15:0]),
    .rdmc_meta0_rcr_transfer_comp    (rdmc_meta0_rcr_transfer_comp),
    .rdmc_meta0_rcr_status           (rdmc_meta0_rcr_status[3:0]),
    .rdmc_meta1_rbr_req              (rdmc_meta1_rbr_req),
    .rdmc_meta1_rbr_req_cmd          (rdmc_meta1_rbr_req_cmd[7:0]),
    .rdmc_meta1_rbr_req_address      (rdmc_meta1_rbr_req_address[63:0]),
    .rdmc_meta1_rbr_req_length       (rdmc_meta1_rbr_req_length[13:0]),
    .rdmc_meta1_rbr_req_dma_num      (rdmc_meta1_rbr_req_dma_num[4:0]),
    .rdmc_meta1_rbr_req_port_num     (rdmc_meta1_rbr_req_port_num[1:0]),
    .rdmc_meta1_rbr_req_func_num     (rdmc_meta1_rbr_req_func_num[1:0]),
    .rdmc_meta1_rbr_resp_accept      (rdmc_meta1_rbr_resp_accept),
    .rdmc_meta0_rcr_ack_accept       (rdmc_meta0_rcr_ack_accept),
    .rdmc_debug_port                 (rdmc_debug_port[31:0]),
    .tcu_aclk                        (aclk),
    .tcu_bclk                        (bclk),
    .tcu_scan_en                     (tcu_scan_en),
    .tcu_se_scancollar_in            (tcu_se_scancollar_in),
    .tcu_se_scancollar_out           (tcu_se_scancollar_out),
    .tcu_mbist_bisi_en               (tcu_mbist_bisi_en),
    .tcu_array_wr_inhibit            (array_wr_inhibit),
    .tcu_mbist_user_mode             (tcu_mbist_user_mode),
    .l2clk_2x                        (io2xl2clk),
    .iol2clk                         (iol2clk),
    .tcu_rdp_rdmc_mbist_start        (tcu_rdp_rdmc_mbist_start),
    .rdp_rdmc_tcu_mbist_fail         (rdp_rdmc_tcu_mbist_fail),
    .rdp_rdmc_tcu_mbist_done         (rdp_rdmc_tcu_mbist_done),
    .rdp_rdmc_mbist_scan_in          (rdp_rdmc_mbist_scan_in),
    .rdp_rdmc_mbist_scan_out         (rdp_rdmc_mbist_scan_out),
    .rdp_tcu_dmo_data_out            (rdp_tcu_dmo_data_out[39:0]),
    .hdr_sram_rvalue_rdmc0           (hdr_sram_rvalue_rdmc0[6:0]),
    .hdr_sram_rid_rdmc0              (hdr_sram_rid_rdmc0[1:0]),
    .hdr_sram_wr_en_rdmc0            (hdr_sram_wr_en_rdmc0),
    .hdr_sram_red_clr_rdmc0          (hdr_sram_red_clr_rdmc0),
    .sram_hdr_read_data_rdmc0        (sram_hdr_read_data_rdmc0[6:0]),
    .hdr_sram_rvalue_rdmc1           (hdr_sram_rvalue_rdmc1[6:0]),
    .hdr_sram_rid_rdmc1              (hdr_sram_rid_rdmc1[1:0]),
    .hdr_sram_wr_en_rdmc1            (hdr_sram_wr_en_rdmc1),
    .hdr_sram_red_clr_rdmc1          (hdr_sram_red_clr_rdmc1),
    .sram_hdr_read_data_rdmc1        (sram_hdr_read_data_rdmc1[6:0])
    );

rdp_clkgen_rdp_io rdp_clkgen_rdp_io (
    .array_wr_inhibit     (array_wr_inhibit),
    .tcu_atpg_mode        (tcu_atpg_mode),
    .tcu_wr_inhibit       (tcu_wr_inhibit),
    .l1clk                (l1clk),
    .iol2clk              (iol2clk),
    .aclk                 (aclk),
    .bclk                 (bclk),
    .scan_out             (ioclk_scan_out),
    .pce_ov               (pce_ov),
    .wmr_protect          (),
    .wmr_                 (),
    .por_                 (niu_reset_l),
    .cmp_slow_sync_en     (),
    .slow_cmp_sync_en     (),
    .aclk_wmr             (),
    .tcu_clk_stop         (tcu_rdp_io_clk_stop),
    .tcu_pce_ov           (tcu_pce_ov),
    .rst_wmr_protect      (1'b0),
    .rst_wmr_             (1'b0),
    .rst_por_             (rst_por_),
    .cluster_arst_l       (cluster_arst_l),
    .ccu_cmp_slow_sync_en (1'b0),
    .ccu_slow_cmp_sync_en (1'b0),
    .tcu_div_bypass       (tcu_div_bypass),
    .ccu_div_ph           (gl_rdp_io_out),
    .cluster_div_en       (1'b1),
    .gclk                 (cmp_gclk_c0_rdp),
    .tcu_scan_en          (tcu_scan_en),
    .scan_in              (scan_in),
    .tcu_aclk             (tcu_aclk),
    .tcu_bclk             (tcu_bclk)
    );

rdp_clkgen_rdp_io2x rdp_clkgen_rdp_io2x (
    .io2xl2clk            (io2xl2clk),
    .aclk                 (x2aclk),
    .bclk                 (x2bclk),
    .scan_out             (io2xclk_scan_out),
    .aclk_wmr             (x2aclk_wmr),
    .pce_ov               (x2pce_ov),
    .wmr_protect          (x2wmr_protect),
    .wmr_                 (x2wmr),
    .por_                 (x2por),
    .cmp_slow_sync_en     (x2_cmp_slow_sync_en),
    .slow_cmp_sync_en     (x2_slow_cmp_sync_en),
    .array_wr_inhibit     (x2_array_wr_inhibit),
    .tcu_atpg_mode        (tcu_atpg_mode),
    .tcu_wr_inhibit       (1'b0),
    .tcu_clk_stop         (tcu_rdp_io_clk_stop),
    .tcu_pce_ov           (pce_ov),
    .rst_wmr_protect      (1'b1),
    .rst_wmr_             (1'b0),
    .rst_por_             (rst_por_),
    .cluster_arst_l       (cluster_arst_l),
    .ccu_cmp_slow_sync_en (1'b0),
    .ccu_slow_cmp_sync_en (1'b0),
    .tcu_div_bypass       (tcu_div_bypass),
    .ccu_div_ph           (gl_rdp_io2x_out),
    .cluster_div_en       (1'b1),
    .gclk                 (cmp_gclk_c0_rdp ),
    .tcu_scan_en          (tcu_scan_en),
    .scan_in              (ioclk_scan_out),
    .tcu_aclk             (aclk),
    .tcu_bclk             (bclk)
    );

rdp_n2_efuhdr4a_ctl rdmc_sram_header_0 (
    .efu_hdr_write_data (efu_niu_ram_data),
    .efu_hdr_xfer_en    (efu_niu_ram0_xfer_en),
    .efu_hdr_clr        (efu_niu_ram0_clr),
    .hdr_efu_read_data  (niu_efu_ram0_data),
    .hdr_efu_xfer_en    (niu_efu_ram0_xfer_en),
    .hdr_sram_rvalue    ({Unconnected_3[10:7],hdr_sram_rvalue_rdmc0[6:0]}),
    .hdr_sram_rid       ({Unconnected_1[10:2],hdr_sram_rid_rdmc0[1:0]}),
    .hdr_sram_wr_en     (hdr_sram_wr_en_rdmc0),
    .hdr_sram_red_clr   (hdr_sram_red_clr_rdmc0),
    .sram_hdr_read_data ({4'b0,sram_hdr_read_data_rdmc0[6:0]}),
    .l2clk              (l1clk),
    .reset_l            (niu_reset_l),
    .tcu_pce_ov         (pce_ov),
    .tcu_aclk           (aclk),
    .tcu_bclk           (bclk),
    .tcu_scan_en        (tcu_scan_en),
    .tcu_clk_stop       (tcu_rdp_io_clk_stop),
    .scan_in            (1'b0),
    .scan_out           (not_used0)
    );

rdp_n2_efuhdr4b_ctl rdmc_sram_header_1 (
    .efu_hdr_write_data (efu_niu_ram_data),
    .efu_hdr_xfer_en    (efu_niu_ram1_xfer_en),
    .efu_hdr_clr        (efu_niu_ram1_clr),
    .hdr_efu_read_data  (niu_efu_ram1_data),
    .hdr_efu_xfer_en    (niu_efu_ram1_xfer_en),
    .hdr_sram_rvalue    ({Unconnected_4[10:7],hdr_sram_rvalue_rdmc1[6:0]}),
    .hdr_sram_rid       ({Unconnected_2[10:2],hdr_sram_rid_rdmc1[1:0]}),
    .hdr_sram_wr_en     (hdr_sram_wr_en_rdmc1),
    .hdr_sram_red_clr   (hdr_sram_red_clr_rdmc1),
    .sram_hdr_read_data ({4'b0,sram_hdr_read_data_rdmc1[6:0]}),
    .l2clk              (l1clk),
    .reset_l            (niu_reset_l),
    .tcu_pce_ov         (pce_ov),
    .tcu_aclk           (aclk),
    .tcu_bclk           (bclk),
    .tcu_scan_en        (tcu_scan_en),
    .tcu_clk_stop       (tcu_rdp_io_clk_stop),
    .scan_in            (1'b0),
    .scan_out           (scan_out)
    );
// VPERL: GENERATED_END

endmodule
