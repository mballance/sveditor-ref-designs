// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tds.v
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
// $VPERL_PORT_COMM = 1;
// # $VPERL_INST_COMM = 2;
//
// &MODULE ("tds");
// #------------------------------------------------------------
// #-- Instantiations
// #------------------------------------------------------------
// &INSTANCE ("/vobs/neptune/design/niu/smx/rtl/niu_smx.v niu_smx", "niu_smx");
// &INSTANCE ("/vobs/neptune/design/niu/tds/rtl/niu_meta_arb.v.new niu_meta_arb", "niu_meta_arb");
// &INSTANCE ("/vobs/neptune/design/niu/tds/rtl/niu_tdmc.v.new niu_tdmc", "niu_tdmc");
// &INSTANCE ("/vobs/neptune/design/niu/tds/rtl/tds_n2_efuhdr2_ctl.v", "tdmc_sram_header");
// &INSTANCE ("/vobs/neptune/design/niu/tds/rtl/dmo_regs.v", "dmo_regs");
// &INSTANCE ("/vobs/neptune/design/niu/n2_lib/clkgen_tds_io2x.v", "clkgen2x_tds");
// &INSTANCE ("/vobs/neptune/design/niu/tds/rtl/tds_l2l1clk_io.v", "clkgen_tds");

// #------------------------------------------------------------
// #-- Special Ports
// #------------------------------------------------------------
// &FORCE ("output", "meta_dmc_resp_ready");
// &FORCE ("output", "meta_dmc_resp_cmd[7:0]");
// &FORCE ("output", "meta_dmc_resp_cmd_status[3:0]");
// &FORCE ("output", "meta_dmc_resp_address[63:0]");
// &FORCE ("output", "meta_dmc_resp_length[13:0]");
// &FORCE ("output", "meta_dmc_resp_trans_id[5:0]");
// &FORCE ("output", "meta_dmc_resp_port_num[1:0]");
// &FORCE ("output", "meta_dmc_resp_dma_num[4:0]");
// # &FORCE ("output", "meta_dmc_resp_client[7:0]");
// # &FORCE ("output", "meta_dmc_data_valid[7:0]");
// &FORCE ("output", "meta_dmc_data[127:0]");
// &FORCE ("output", "meta_dmc_resp_byteenable[15:0]");
// &FORCE ("output", "meta_dmc_data_status[3:0]");
// # &FORCE ("output", "meta_dmc_resp_complete[7:0]");
// # &FORCE ("output", "meta_dmc_resp_transfer_cmpl[7:0]");
// &FORCE ("output", "meta_dmc_ack_ready");
// &FORCE ("output", "meta_dmc_ack_cmd[7:0]");
// &FORCE ("output", "meta_dmc_ack_cmd_status[3:0]");
// &FORCE ("output", "meta_dmc_ack_dma_num[4:0]");
// # &FORCE ("output", "meta_dmc_ack_client[7:0]");
// &FORCE ("output", "dmc_meta1_req_trans_id[5:0]");
// &FORCE ("output", "tds_tcu_dmo_dout[39:0]");

// &FORCE ("output", "meta1_rdmc_rbr_resp_data[127:0]");
// &FORCE ("output", "meta1_rdmc_rbr_resp_byteenable[15:0]");
// &FORCE ("output", "meta1_rdmc_rbr_resp_cmd[7:0]");
// &FORCE ("output", "meta1_rdmc_rbr_resp_cmd_status[3:0]");
// &FORCE ("output", "meta1_rdmc_rbr_resp_dma_num[4:0]");
// &FORCE ("output", "meta1_rdmc_rbr_resp_ready");

// # &FORCE ("input",  "txc_dmc_dma_pkt_size_err[23:0]");
// # &FORCE ("input",  "txc_dmc_dma_nack_pkt_rd[23:0]");
// #-- &FORCE ("input",  "txc_dmc_dma_pkt_size_err[15:0]");
// &FORCE ("input",  "txc_dmc_p0_dma_pkt_size_err[15:0]");
// &FORCE ("input",  "txc_dmc_p1_dma_pkt_size_err[15:0]");
// &FORCE ("input",  "txc_dmc_dma_nack_pkt_rd[15:0]");

// #################################
// # MBIST port:
// #################################

// &FORCE ("input",  "tcu_scan_en");
// &FORCE ("input",  "tcu_aclk");
// &FORCE ("input",  "tcu_bclk");
// &FORCE ("input",  "tcu_tds_io_clk_stop");
// &FORCE ("input",  "tcu_pce_ov");

// # Use for FF Scan Chain
// &FORCE ("input",  "scan_in");
// &FORCE ("output", "scan_out");

// # Use for MBIST Scan Chain
// &FORCE ("input",   "tds_mbist_scan_in");
// &FORCE ("output",  "tds_mbist_scan_out");

// ################################
// # clkgen_tds clkgen2x_tds
// ################################
// &FORCE ("input",   "rst_por_"); 
// # &FORCE ("input",   "ccu_io_out");   change to gl_tds_io_out I6.1
// # &FORCE ("input",   "ccu_io2x_out");                     
// # &FORCE ("input",   "gclk"); 
// &FORCE ("input",  "gl_tds_io_out");
// &FORCE ("input",  "gl_tds_io2x_out");
// &FORCE ("input", "cmp_gclk_c0_tds");
// &FORCE ("input", "tcu_atpg_mode");
// &FORCE ("input", "tcu_wr_inhibit");

// ####################################
// # SRAM Header
// ####################################

// &FORCE ("input",   "efu_niu_ram_data"); 
// &FORCE ("input",   "efu_niu_ram_xfer_en");       
// &FORCE ("input",   "efu_niu_ram_clr");        

// &FORCE ("output",   "niu_efu_ram_data");
// &FORCE ("output",  "niu_efu_ram_xfer_en");

// ####################################
// # Split ports to connect RDP and RTX
// ####################################
// &FORCE ("wire", "x_meta1_rdmc_rbr_resp_data[127:0]");
// &FORCE ("wire", "x_meta1_rdmc_rbr_resp_byteenable[15:0]");
// &FORCE ("wire", "x_meta1_rdmc_rbr_resp_cmd[7:0]");
// &FORCE ("wire", "x_meta1_rdmc_rbr_resp_cmd_status[3:0]");
// &FORCE ("wire", "x_meta1_rdmc_rbr_resp_dma_num[4:0]");
// &FORCE ("wire", "x_meta1_rdmc_rbr_resp_ready");
// &FORCE ("wire", "tds_tcu_dmo_data_out[39:0]");
// &FORCE ("wire", "l1clk");
// &FORCE ("wire", "iol2clk");
// &FORCE ("wire", "io2xl2clk");
// &FORCE ("wire", "ioclk_scan_out");
// &FORCE ("wire", "io2xclk_scan_out");
// &FORCE ("wire", "tds_pce_ov");

// ####################################
// # USE FOR UNCONNECT PORTS:
// ####################################
// &FORCE ("wire", "unconnected_1[10:7]");
// &FORCE ("wire", "unconnected_2[10:2]");

// &FORCE ("wire", "tds_array_wr_inhibit");

// #------------------------------------------------------------
// #-- Explicit connections
// #------------------------------------------------------------
// &CONNECT ("clkgen_tds.rst_por_", "rst_por_");
// # Note: the ccu_*sync_en connections will be removed 
// # &CONNECT ("clkgen_tds.ccu_cmp_slow_sync_en", "ccu_cmp_io_sync_en");
// # &CONNECT ("clkgen_tds.ccu_slow_cmp_sync_en", "ccu_io_cmp_sync_en");
// # &CONNECT ("clkgen_tds.clk_ext", "1'b0"); 
// # &CONNECT ("clkgen_tds.ccu_serdes_dtm", "1'b0");

// &CONNECT ("clkgen_tds.ccu_div_ph", "gl_tds_io_out");
// &CONNECT ("clkgen_tds.gclk", "cmp_gclk_c0_tds");
// &CONNECT ("clkgen_tds.scan_en", "tcu_scan_en");
// &CONNECT ("clkgen_tds.l1clk", "l1clk");
// &CONNECT ("clkgen_tds.iol2clk", "iol2clk");
// &CONNECT ("clkgen_tds.por_", "niu_reset_l");
// &CONNECT ("clkgen_tds.scan_out", "ioclk_scan_out"); 
// &CONNECT ("clkgen_tds.pce_ov", "tds_pce_ov");
// &CONNECT ("clkgen_tds.tcu_atpg_mode", "tcu_atpg_mode");

// # New pins I6.1
// &CONNECT ("clkgen2x_tds.array_wr_inhibit", "");
// &CONNECT ("clkgen2x_tds.tcu_atpg_mode", "tcu_atpg_mode");
// &CONNECT ("clkgen2x_tds.tcu_wr_inhibit", "1'b0");

// # Note: the ccu_*sync_en connections will be removed in I5.3
// &CONNECT ("clkgen2x_tds.ccu_cmp_slow_sync_en", "1'b0");
// &CONNECT ("clkgen2x_tds.ccu_slow_cmp_sync_en", "1'b0");

// &CONNECT ("clkgen2x_tds.ccu_div_ph", "gl_tds_io2x_out");
// &CONNECT ("clkgen2x_tds.rst_por_", "rst_por_");
// &CONNECT ("clkgen2x_tds.gclk", "cmp_gclk_c0_tds");
// &CONNECT ("clkgen2x_tds.l2clk", "io2xl2clk");

// &CONNECT ("clkgen2x_tds.tcu_aclk", "aclk");
// &CONNECT ("clkgen2x_tds.tcu_bclk", "bclk");
// &CONNECT ("clkgen2x_tds.tcu_pce_ov", "tds_pce_ov");
// &CONNECT ("clkgen2x_tds.scan_en", "tcu_scan_en");
// &CONNECT ("clkgen2x_tds.scan_in", "ioclk_scan_out");
// &CONNECT ("clkgen2x_tds.scan_out", "io2xclk_scan_out");

// &CONNECT ("clkgen_tds.aclk", "aclk");
// &CONNECT ("clkgen_tds.bclk", "bclk");
// &CONNECT ("niu_tdmc.tcu_aclk", "aclk");
// &CONNECT ("niu_tdmc.tcu_bclk", "bclk");
// &CONNECT ("niu_smx.tcu_aclk", "aclk");
// &CONNECT ("niu_smx.tcu_bclk", "bclk");
// &CONNECT ("clkgen_tds.tcu_clk_stop", "tcu_tds_io_clk_stop");
// &CONNECT ("clkgen2x_tds.tcu_clk_stop", "tcu_tds_io_clk_stop");

// &CONNECT ("clkgen_tds.tcu_wr_inhibit", "tcu_wr_inhibit");
// &CONNECT ("clkgen_tds.array_wr_inhibit", "tds_array_wr_inhibit");
// &CONNECT ("clkgen_tds.wmr_protect", "");           
// &CONNECT ("clkgen_tds.wmr_", "");                
// &CONNECT ("clkgen_tds.cmp_slow_sync_en", ""); 
// &CONNECT ("clkgen_tds.slow_cmp_sync_en", "");
// &CONNECT ("clkgen_tds.aclk_wmr", "");
// &CONNECT ("clkgen2x_tds.aclk_wmr", "");
// &CONNECT ("clkgen2x_tds.aclk", "");
// &CONNECT ("clkgen2x_tds.bclk", "");
// &CONNECT ("clkgen2x_tds.por_", "");                       
// &CONNECT ("clkgen2x_tds.pce_ov", "");
// &CONNECT ("clkgen2x_tds.wmr_protect", "");           
// &CONNECT ("clkgen2x_tds.wmr_", "");                
// &CONNECT ("clkgen2x_tds.cmp_slow_sync_en", ""); 
// &CONNECT ("clkgen2x_tds.slow_cmp_sync_en", "");

// &CONNECT ("clkgen_tds.rst_wmr_protect", "1'b0");
// &CONNECT ("clkgen_tds.rst_wmr_", "1'b1");
// &CONNECT ("clkgen_tds.cluster_div_en", "1'b1");

// &CONNECT ("clkgen2x_tds.rst_wmr_protect", "1'b0");
// &CONNECT ("clkgen2x_tds.rst_wmr_", "1'b1");
// &CONNECT ("clkgen2x_tds.cluster_div_en", "1'b1");
// &CONNECT ("clkgen2x_tds.ccu_serdes_dtm", "1'b0");
// &CONNECT ("clkgen2x_tds.clk_ext", "1'b0");

// # TDMC EFUSE connections
// &CONNECT ("niu_tdmc.hdr_sram_rvalue_tdmc", " hdr_sram_rvalue_tdmc[6:0]");
// &CONNECT ("niu_tdmc.hdr_sram_rid_tdmc", "hdr_sram_rid_tdmc[1:0]");
// &CONNECT ("niu_tdmc.hdr_sram_wr_en_tdmc", "hdr_sram_wr_en_tdmc");
// &CONNECT ("niu_tdmc.hdr_sram_red_clr_tdmc", "hdr_sram_red_clr_tdmc");
// &CONNECT ("niu_tdmc.sram_hdr_read_data_tdmc", "sram_hdr_read_data_tdmc[6:0]");
// &CONNECT ("tdmc_sram_header.hdr_sram_rvalue", "{unconnected_1[10:7], hdr_sram_rvalue_tdmc[6:0]}");
// &CONNECT ("tdmc_sram_header.hdr_sram_rid", "{unconnected_2[10:2], hdr_sram_rid_tdmc[1:0]}");
// &CONNECT ("tdmc_sram_header.hdr_sram_wr_en", "hdr_sram_wr_en_tdmc");
// &CONNECT ("tdmc_sram_header.hdr_sram_red_clr", "hdr_sram_red_clr_tdmc");
// &CONNECT ("tdmc_sram_header.sram_hdr_read_data", "{4'b0, sram_hdr_read_data_tdmc[6:0]}");
// &CONNECT ("tdmc_sram_header.l2clk", "l1clk");
// &CONNECT ("tdmc_sram_header.tcu_clk_stop", "tcu_tds_io_clk_stop");

// &CONNECT ("tdmc_sram_header.reset_l", "niu_reset_l");
// &CONNECT ("tdmc_sram_header.efu_hdr_write_data", "efu_niu_ram_data");
// &CONNECT ("tdmc_sram_header.efu_hdr_xfer_en", "efu_niu_ram_xfer_en");
// &CONNECT ("tdmc_sram_header.efu_hdr_clr", "efu_niu_ram_clr");
// &CONNECT ("tdmc_sram_header.hdr_efu_read_data", "niu_efu_ram_data");
// &CONNECT ("tdmc_sram_header.hdr_efu_xfer_en", "niu_efu_ram_xfer_en");
// &CONNECT ("tdmc_sram_header.tcu_aclk", "aclk");
// &CONNECT ("tdmc_sram_header.tcu_bclk", "bclk");
// &CONNECT ("tdmc_sram_header.tcu_pce_ov", "tds_pce_ov");
// &CONNECT ("tdmc_sram_header.scan_in", "io2xclk_scan_out");
// &CONNECT ("tdmc_sram_header.scan_out", "");
// &CONNECT ("niu_tdmc.niu_clk", "l1clk");
// &CONNECT ("niu_tdmc.iol2clk", "iol2clk");
// # &CONNECT ("niu_tdmc.tcu_clk_stop", "tcu_tds_io_clk_stop");
// &CONNECT ("niu_smx.niu_clk", "l1clk");
// &CONNECT ("niu_smx.iol2clk", "iol2clk");
// &CONNECT ("niu_meta_arb.niu_clk", "l1clk");
// &CONNECT ("niu_meta_arb.dmc_meta1_req_transID", "dmc_meta1_req_trans_id[5:0]");
// &CONNECT ("niu_meta_arb.meta_dmc_resp_transID","meta_dmc_resp_trans_id[5:0]");
// &CONNECT ("niu_smx.dmc_meta1_req_transID", "dmc_meta1_req_trans_id[5:0]");
// &CONNECT ("niu_smx.meta_dmc_resp_transID","meta_dmc_resp_trans_id[5:0]");

// ####################################
// # Split port connections:
// ####################################

// &CONNECT ("niu_smx.meta_dmc_data", "x_meta1_rdmc_rbr_resp_data[127:0]");
// &CONNECT ("niu_smx.meta_dmc_resp_byteenable", "x_meta1_rdmc_rbr_resp_byteenable[15:0]");
// &CONNECT ("niu_smx.meta_dmc_resp_cmd", "x_meta1_rdmc_rbr_resp_cmd[7:0]");
// &CONNECT ("niu_smx.meta_dmc_resp_cmd_status", "x_meta1_rdmc_rbr_resp_cmd_status[3:0]");
// &CONNECT ("niu_smx.meta_dmc_resp_dma_num", "x_meta1_rdmc_rbr_resp_dma_num[4:0]");
// &CONNECT ("niu_smx.meta_dmc_resp_ready", "x_meta1_rdmc_rbr_resp_ready");

// &CONNECT ("niu_tdmc.meta_dmc_data", "x_meta1_rdmc_rbr_resp_data[127:0]");
// &CONNECT ("niu_tdmc.meta_dmc_resp_byteenable", "x_meta1_rdmc_rbr_resp_byteenable[15:0]");
// &CONNECT ("niu_tdmc.meta_dmc_resp_cmd", "x_meta1_rdmc_rbr_resp_cmd[7:0]");
// &CONNECT ("niu_tdmc.meta_dmc_resp_cmd_status", "x_meta1_rdmc_rbr_resp_cmd_status[3:0]");
// &CONNECT ("niu_tdmc.meta_dmc_resp_dma_num", "x_meta1_rdmc_rbr_resp_dma_num[4:0]");
// &CONNECT ("niu_tdmc.meta_dmc_resp_ready", "x_meta1_rdmc_rbr_resp_ready");

// &CONNECT ("dmo_regs.niu_clk", "l1clk");
// &CONNECT ("dmo_regs.dmo_out", "tds_tcu_dmo_dout[39:0]"); 
// &CONNECT ("dmo_regs.dmo_in", "tds_tcu_dmo_data_out[39:0]");
// &CONNECT ("niu_tdmc.l2clk_2x", "io2xl2clk");
// &CONNECT ("niu_tdmc.tds_tcu_dmo_data_out", "tds_tcu_dmo_data_out[39:0]");

// &CONNECT ("niu_smx.meta_dmc_resp_client_tdmc", "meta_dmc_resp_client_tdmc");
// &CONNECT ("niu_smx.meta_dmc_resp_complete_tdmc", "meta_dmc_resp_complete_tdmc");
// &CONNECT ("niu_smx.meta_dmc_resp_transfer_cmpl_tdmc", "meta_dmc_resp_transfer_cmpl_tdmc");
// &CONNECT ("niu_smx.meta_dmc_data_valid_tdmc", "meta_dmc_data_valid_tdmc");
// &CONNECT ("niu_smx.meta_dmc_ack_client_tdmc", "meta_dmc_ack_client_tdmc");
// &CONNECT ("niu_tdmc.meta_dmc_resp_client", "meta_dmc_resp_client_tdmc");
// &CONNECT ("niu_tdmc.meta_dmc_resp_complete", "meta_dmc_resp_complete_tdmc");
// &CONNECT ("niu_tdmc.meta_dmc_resp_transfer_cmpl", "meta_dmc_resp_transfer_cmpl_tdmc");
// &CONNECT ("niu_tdmc.meta_dmc_data_valid", "meta_dmc_data_valid_tdmc");
// &CONNECT ("niu_tdmc.meta_dmc_ack_client", "meta_dmc_ack_client_tdmc");
// &CONNECT ("niu_tdmc.dmc_meta_resp_accept", "tdmc_meta_resp_accept");
// &CONNECT ("niu_tdmc.dmc_meta_ack_accept", "tdmc_meta_ack_accept");
// &CONNECT ("niu_tdmc.meta_dmc_ack_complete", "meta_dmc_ack_complete");
// &CONNECT ("niu_tdmc.txc_dmc_p0_dma_pkt_size_err","txc_dmc_p0_dma_pkt_size_err[15:0]");
// &CONNECT ("niu_tdmc.txc_dmc_p1_dma_pkt_size_err","txc_dmc_p1_dma_pkt_size_err[15:0]");
// #&CONNECT ("niu_tdmc.txc_dmc_dma_nack_pkt_rd","txc_dmc_dma_nack_pkt_rd[23:0]");
// # - &CONNECT ("niu_tdmc.txc_dmc_dma_pkt_size_err","txc_dmc_dma_pkt_size_err[15:0]");
// &CONNECT ("niu_tdmc.txc_dmc_dma_nack_pkt_rd","txc_dmc_dma_nack_pkt_rd[15:0]");
// &CONNECT ("niu_tdmc.niu_reset_l","niu_reset_l");
// &CONNECT ("niu_smx.niu_reset_l","niu_reset_l");
// &CONNECT ("niu_meta_arb.niu_reset_l","niu_reset_l");
// # &DECLARE ("wire", "tds_mbist_scan_in");
// # &DECLARE ("wire", "tds_mbist_scan_out");
// # &DECLARE ("wire", "tdmc2smx_mbist_scan");
// &CONNECT ("niu_tdmc.tds_tdmc_mbist_scan_in", "tds_mbist_scan_in");
// &CONNECT ("niu_tdmc.tds_tdmc_mbist_scan_out", "tds_smx_mbist_scan_in");
// &CONNECT ("niu_smx.tds_smx_mbist_scan_in", "tds_smx_mbist_scan_in");
// &CONNECT ("niu_smx.tds_smx_mbist_scan_out", "tds_mbist_scan_out");
// &CONNECT ("niu_tdmc.tcu_array_wr_inhibit", "tds_array_wr_inhibit");
// &CONNECT ("niu_smx.tcu_array_wr_inhibit", "tds_array_wr_inhibit");

// VPERL: PERL_END
// VPERL: GENERATED_BEG

module tds (
    cluster_arst_l,
    cmp_gclk_c0_tds,
    dbg1_niu_resume,
    dbg1_niu_stall,
    efu_niu_ram_clr,
    efu_niu_ram_data,
    efu_niu_ram_xfer_en,
    gl_tds_io2x_out,
    gl_tds_io_out,
    ncu_niu_ctag_cei,
    ncu_niu_ctag_uei,
    ncu_niu_d_pei,
    pio_arb_ctrl,
    pio_arb_debug_vector,
    pio_arb_dirtid_clr,
    pio_arb_dirtid_enable,
    pio_arb_np_threshold,
    pio_arb_rd_threshold,
    pio_clients_addr,
    pio_clients_rd,
    pio_clients_wdata,
    pio_smx_cfg_data,
    pio_smx_clear_intr,
    pio_smx_ctrl,
    pio_smx_debug_vector,
    pio_tdmc_sel,
    rbr_arb1_req,
    rbr_arb1_req_address,
    rbr_arb1_req_cmd,
    rbr_arb1_req_dma_num,
    rbr_arb1_req_func_num,
    rbr_arb1_req_length,
    rbr_arb1_req_port_num,
    rcr_arb0_data,
    rcr_arb0_data_valid,
    rcr_arb0_req,
    rcr_arb0_req_address,
    rcr_arb0_req_byteenable,
    rcr_arb0_req_cmd,
    rcr_arb0_req_dma_num,
    rcr_arb0_req_func_num,
    rcr_arb0_req_length,
    rcr_arb0_req_port_num,
    rcr_arb0_status,
    rcr_arb0_transfer_complete,
    rdc_arb0_data,
    rdc_arb0_data_valid,
    rdc_arb0_req,
    rdc_arb0_req_address,
    rdc_arb0_req_byteenable,
    rdc_arb0_req_cmd,
    rdc_arb0_req_dma_num,
    rdc_arb0_req_func_num,
    rdc_arb0_req_length,
    rdc_arb0_req_port_num,
    rdc_arb0_status,
    rdc_arb0_transfer_complete,
    rdmc_meta_ack_accept,
    rdmc_meta_resp_accept,
    rst_por_,
    scan_in,
    sii_niu_bqdq,
    sii_niu_oqdq,
    sio_niu_data,
    sio_niu_datareq,
    sio_niu_hdr_vld,
    sio_niu_parity,
    tcu_aclk,
    tcu_atpg_mode,
    tcu_bclk,
    tcu_div_bypass,
    tcu_mbist_bisi_en,
    tcu_mbist_user_mode,
    tcu_pce_ov,
    tcu_scan_en,
    tcu_se_scancollar_in,
    tcu_se_scancollar_out,
    tcu_tds_io_clk_stop,
    tcu_tds_smx_mbist_start,
    tcu_tds_tdmc_mbist_start,
    tcu_wr_inhibit,
    tds_mbist_scan_in,
    txc_arb1_req,
    txc_arb1_req_address,
    txc_arb1_req_cmd,
    txc_arb1_req_dma_num,
    txc_arb1_req_func_num,
    txc_arb1_req_length,
    txc_arb1_req_port_num,
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
    txc_meta_resp_accept,
    arb0_rcr_data_req,
    arb0_rcr_req_accept,
    arb0_rdc_data_req,
    arb0_rdc_req_accept,
    arb1_rbr_req_accept,
    arb1_rbr_req_errors,
    arb1_txc_req_accept,
    arb_pio_all_npwdirty,
    arb_pio_all_rddirty,
    arb_pio_dirtid_npwstatus,
    arb_pio_dirtid_rdstatus,
    dmc_meta1_req_trans_id,
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
    meta1_rdmc_rbr_resp_byteenable,
    meta1_rdmc_rbr_resp_cmd,
    meta1_rdmc_rbr_resp_cmd_status,
    meta1_rdmc_rbr_resp_data,
    meta1_rdmc_rbr_resp_dma_num,
    meta1_rdmc_rbr_resp_ready,
    meta_arb_debug_port,
    meta_dmc_ack_client_rdmc,
    meta_dmc_ack_cmd,
    meta_dmc_ack_cmd_status,
    meta_dmc_ack_dma_num,
    meta_dmc_ack_ready,
    meta_dmc_data,
    meta_dmc_data_status,
    meta_dmc_data_valid_rdmc,
    meta_dmc_data_valid_txc,
    meta_dmc_resp_address,
    meta_dmc_resp_byteenable,
    meta_dmc_resp_client_rdmc,
    meta_dmc_resp_client_txc,
    meta_dmc_resp_cmd,
    meta_dmc_resp_cmd_status,
    meta_dmc_resp_complete_rdmc,
    meta_dmc_resp_complete_txc,
    meta_dmc_resp_dma_num,
    meta_dmc_resp_length,
    meta_dmc_resp_port_num,
    meta_dmc_resp_ready,
    meta_dmc_resp_trans_id,
    meta_dmc_resp_transfer_cmpl_rdmc,
    meta_dmc_resp_transfer_cmpl_txc,
    niu_dbg1_stall_ack,
    niu_efu_ram_data,
    niu_efu_ram_xfer_en,
    niu_ncu_ctag_ce,
    niu_ncu_ctag_ue,
    niu_ncu_d_pe,
    niu_sii_data,
    niu_sii_datareq,
    niu_sii_hdr_vld,
    niu_sii_parity,
    niu_sii_reqbypass,
    niu_sio_dq,
    scan_out,
    smx_debug_port,
    smx_pio_intr,
    smx_pio_status,
    tdmc_debug_port,
    tdmc_pio_ack,
    tdmc_pio_err,
    tdmc_pio_intr,
    tdmc_pio_rdata,
    tds_mbist_scan_out,
    tds_smx_tcu_mbist_done,
    tds_smx_tcu_mbist_fail,
    tds_tcu_dmo_dout,
    tds_tdmc_tcu_mbist_done,
    tds_tdmc_tcu_mbist_fail 
    );

input		cluster_arst_l;
input		cmp_gclk_c0_tds;
input		dbg1_niu_resume;
input		dbg1_niu_stall;
input		efu_niu_ram_clr;
input		efu_niu_ram_data;
input		efu_niu_ram_xfer_en;
input		gl_tds_io2x_out;
input		gl_tds_io_out;
input		ncu_niu_ctag_cei;
input		ncu_niu_ctag_uei;
input		ncu_niu_d_pei;
input	[31:0]	pio_arb_ctrl;
input	[31:0]	pio_arb_debug_vector;
input		pio_arb_dirtid_clr;                // Clear all Dirty TID Entries
input		pio_arb_dirtid_enable;             // Enable Dirty TID logic
input	[5:0]	pio_arb_np_threshold;              // np write threshold
input	[5:0]	pio_arb_rd_threshold;              // read threshold
input	[19:0]	pio_clients_addr;                  // pio address
input		pio_clients_rd;                    // pio read
input	[63:0]	pio_clients_wdata;                 // pio write data
input	[31:0]	pio_smx_cfg_data;                  // static
input		pio_smx_clear_intr;                // a pulse          
input	[31:0]	pio_smx_ctrl;
input	[31:0]	pio_smx_debug_vector;
input		pio_tdmc_sel;                      // pio DMC select
input		rbr_arb1_req;                      // Req Command Request
input	[63:0]	rbr_arb1_req_address;              // Memory Address
input	[7:0]	rbr_arb1_req_cmd;                  // Command Request
input	[4:0]	rbr_arb1_req_dma_num;              // Channel Number
input	[1:0]	rbr_arb1_req_func_num;             // Channel Number
input	[13:0]	rbr_arb1_req_length;               // Packet Length
input	[1:0]	rbr_arb1_req_port_num;             // Port Number
input	[127:0]	rcr_arb0_data;                     // Transfer Data
input		rcr_arb0_data_valid;               // Transfer Data Ack
input		rcr_arb0_req;                      // Req Command Request
input	[63:0]	rcr_arb0_req_address;              // Memory Address
input	[15:0]	rcr_arb0_req_byteenable;           // First/Last BE
input	[7:0]	rcr_arb0_req_cmd;                  // Command Request
input	[4:0]	rcr_arb0_req_dma_num;              // Channel Number
input	[1:0]	rcr_arb0_req_func_num;             // Channel Number
input	[13:0]	rcr_arb0_req_length;               // Packet Length
input	[1:0]	rcr_arb0_req_port_num;             // Port Number
input	[3:0]	rcr_arb0_status;                   // Transfer Data Status
input		rcr_arb0_transfer_complete;        // Transfer Data Complete
input	[127:0]	rdc_arb0_data;                     // Transfer Data
input		rdc_arb0_data_valid;               // Transfer Data Ack
input		rdc_arb0_req;                      // Req Command Request
input	[63:0]	rdc_arb0_req_address;              // Memory Address
input	[15:0]	rdc_arb0_req_byteenable;           // First/Last BE
input	[7:0]	rdc_arb0_req_cmd;                  // Command Request
input	[4:0]	rdc_arb0_req_dma_num;              // Channel Number
input	[1:0]	rdc_arb0_req_func_num;             // Channel Number
input	[13:0]	rdc_arb0_req_length;               // Packet Length
input	[1:0]	rdc_arb0_req_port_num;             // Port Number
input	[3:0]	rdc_arb0_status;                   // Transfer Data Status
input		rdc_arb0_transfer_complete;        // Transfer Data Complete
input		rdmc_meta_ack_accept;              // bitwise client accept
input		rdmc_meta_resp_accept;             // Valid TransID
input		rst_por_;
input		scan_in;                           // unused as of today - feb 10, 05
input		sii_niu_bqdq;
input		sii_niu_oqdq;
input	[127:0]	sio_niu_data;
input		sio_niu_datareq;
input		sio_niu_hdr_vld;
input	[7:0]	sio_niu_parity;
input		tcu_aclk;
input		tcu_atpg_mode;
input		tcu_bclk;
input		tcu_div_bypass;                    // bypasses clk divider to mux in ext clk
input		tcu_mbist_bisi_en;
input		tcu_mbist_user_mode;
input		tcu_pce_ov;
input		tcu_scan_en;
input		tcu_se_scancollar_in;
input		tcu_se_scancollar_out;
input		tcu_tds_io_clk_stop;
input		tcu_tds_smx_mbist_start;
input		tcu_tds_tdmc_mbist_start;
input		tcu_wr_inhibit;
input		tds_mbist_scan_in;
input		txc_arb1_req;                      // Req Command Request
input	[63:0]	txc_arb1_req_address;              // Memory Address
input	[7:0]	txc_arb1_req_cmd;                  // Command Request
input	[4:0]	txc_arb1_req_dma_num;              // Channel Number
input	[1:0]	txc_arb1_req_func_num;             // Channel Number
input	[13:0]	txc_arb1_req_length;               // Packet Length
input	[1:0]	txc_arb1_req_port_num;             // Port Number
input		txc_dmc_dma0_getnxtdesc;
input		txc_dmc_dma0_inc_head;
input		txc_dmc_dma0_inc_pkt_cnt;
input		txc_dmc_dma0_mark_bit;
input		txc_dmc_dma0_reset_done;
input		txc_dmc_dma10_getnxtdesc;
input		txc_dmc_dma10_inc_head;
input		txc_dmc_dma10_inc_pkt_cnt;
input		txc_dmc_dma10_mark_bit;
input		txc_dmc_dma10_reset_done;
input		txc_dmc_dma11_getnxtdesc;
input		txc_dmc_dma11_inc_head;
input		txc_dmc_dma11_inc_pkt_cnt;
input		txc_dmc_dma11_mark_bit;
input		txc_dmc_dma11_reset_done;
input		txc_dmc_dma12_getnxtdesc;
input		txc_dmc_dma12_inc_head;
input		txc_dmc_dma12_inc_pkt_cnt;
input		txc_dmc_dma12_mark_bit;
input		txc_dmc_dma12_reset_done;
input		txc_dmc_dma13_getnxtdesc;
input		txc_dmc_dma13_inc_head;
input		txc_dmc_dma13_inc_pkt_cnt;
input		txc_dmc_dma13_mark_bit;
input		txc_dmc_dma13_reset_done;
input		txc_dmc_dma14_getnxtdesc;
input		txc_dmc_dma14_inc_head;
input		txc_dmc_dma14_inc_pkt_cnt;
input		txc_dmc_dma14_mark_bit;
input		txc_dmc_dma14_reset_done;
input		txc_dmc_dma15_getnxtdesc;
input		txc_dmc_dma15_inc_head;
input		txc_dmc_dma15_inc_pkt_cnt;
input		txc_dmc_dma15_mark_bit;
input		txc_dmc_dma15_reset_done;
input		txc_dmc_dma1_getnxtdesc;
input		txc_dmc_dma1_inc_head;
input		txc_dmc_dma1_inc_pkt_cnt;
input		txc_dmc_dma1_mark_bit;
input		txc_dmc_dma1_reset_done;
input		txc_dmc_dma2_getnxtdesc;
input		txc_dmc_dma2_inc_head;
input		txc_dmc_dma2_inc_pkt_cnt;
input		txc_dmc_dma2_mark_bit;
input		txc_dmc_dma2_reset_done;
input		txc_dmc_dma3_getnxtdesc;
input		txc_dmc_dma3_inc_head;
input		txc_dmc_dma3_inc_pkt_cnt;
input		txc_dmc_dma3_mark_bit;
input		txc_dmc_dma3_reset_done;
input		txc_dmc_dma4_getnxtdesc;
input		txc_dmc_dma4_inc_head;
input		txc_dmc_dma4_inc_pkt_cnt;
input		txc_dmc_dma4_mark_bit;
input		txc_dmc_dma4_reset_done;
input		txc_dmc_dma5_getnxtdesc;
input		txc_dmc_dma5_inc_head;
input		txc_dmc_dma5_inc_pkt_cnt;
input		txc_dmc_dma5_mark_bit;
input		txc_dmc_dma5_reset_done;
input		txc_dmc_dma6_getnxtdesc;
input		txc_dmc_dma6_inc_head;
input		txc_dmc_dma6_inc_pkt_cnt;
input		txc_dmc_dma6_mark_bit;
input		txc_dmc_dma6_reset_done;
input		txc_dmc_dma7_getnxtdesc;
input		txc_dmc_dma7_inc_head;
input		txc_dmc_dma7_inc_pkt_cnt;
input		txc_dmc_dma7_mark_bit;
input		txc_dmc_dma7_reset_done;
input		txc_dmc_dma8_getnxtdesc;
input		txc_dmc_dma8_inc_head;
input		txc_dmc_dma8_inc_pkt_cnt;
input		txc_dmc_dma8_mark_bit;
input		txc_dmc_dma8_reset_done;
input		txc_dmc_dma9_getnxtdesc;
input		txc_dmc_dma9_inc_head;
input		txc_dmc_dma9_inc_pkt_cnt;
input		txc_dmc_dma9_mark_bit;
input		txc_dmc_dma9_reset_done;
input	[15:0]	txc_dmc_dma_nack_pkt_rd;
input		txc_dmc_nack_pkt_rd;               // pulse to indicate error
input	[43:0]	txc_dmc_nack_pkt_rd_addr;
input	[15:0]	txc_dmc_p0_dma_pkt_size_err;       // one-hot encoded
input		txc_dmc_p0_pkt_size_err;           // pulse to indicate error
input	[43:0]	txc_dmc_p0_pkt_size_err_addr;
input	[15:0]	txc_dmc_p1_dma_pkt_size_err;       // one-hot encoded
input		txc_dmc_p1_pkt_size_err;           // pulse to indicate error
input	[43:0]	txc_dmc_p1_pkt_size_err_addr;
input		txc_meta_resp_accept;              // Valid TransID
output		arb0_rcr_data_req;                 // Memory line request
output		arb0_rcr_req_accept;               // Response to REQ
output		arb0_rdc_data_req;                 // Memory line request
output		arb0_rdc_req_accept;               // Response to REQ
output		arb1_rbr_req_accept;               // Response to REQ
output		arb1_rbr_req_errors;               // Error flag
output		arb1_txc_req_accept;               // Response to REQ
output		arb_pio_all_npwdirty;              // all dirty bin entries are dirty
output		arb_pio_all_rddirty;               // all dirty bin entries are dirty
output	[5:0]	arb_pio_dirtid_npwstatus;          //  count for number of np write TID's dirty
output	[5:0]	arb_pio_dirtid_rdstatus;           // count for number of read TID's dirty
output	[5:0]	dmc_meta1_req_trans_id;
output		dmc_txc_dma0_active;
output		dmc_txc_dma0_cacheready;
output	[63:0]	dmc_txc_dma0_descriptor;
output		dmc_txc_dma0_eoflist;
output		dmc_txc_dma0_error;
output	[1:0]	dmc_txc_dma0_func_num;
output		dmc_txc_dma0_gotnxtdesc;
output	[19:0]	dmc_txc_dma0_page_handle;
output		dmc_txc_dma0_partial;
output		dmc_txc_dma0_reset_scheduled;
output		dmc_txc_dma10_active;
output		dmc_txc_dma10_cacheready;
output	[63:0]	dmc_txc_dma10_descriptor;
output		dmc_txc_dma10_eoflist;
output		dmc_txc_dma10_error;
output	[1:0]	dmc_txc_dma10_func_num;
output		dmc_txc_dma10_gotnxtdesc;
output	[19:0]	dmc_txc_dma10_page_handle;
output		dmc_txc_dma10_partial;
output		dmc_txc_dma10_reset_scheduled;
output		dmc_txc_dma11_active;
output		dmc_txc_dma11_cacheready;
output	[63:0]	dmc_txc_dma11_descriptor;
output		dmc_txc_dma11_eoflist;
output		dmc_txc_dma11_error;
output	[1:0]	dmc_txc_dma11_func_num;
output		dmc_txc_dma11_gotnxtdesc;
output	[19:0]	dmc_txc_dma11_page_handle;
output		dmc_txc_dma11_partial;
output		dmc_txc_dma11_reset_scheduled;
output		dmc_txc_dma12_active;
output		dmc_txc_dma12_cacheready;
output	[63:0]	dmc_txc_dma12_descriptor;
output		dmc_txc_dma12_eoflist;
output		dmc_txc_dma12_error;
output	[1:0]	dmc_txc_dma12_func_num;
output		dmc_txc_dma12_gotnxtdesc;
output	[19:0]	dmc_txc_dma12_page_handle;
output		dmc_txc_dma12_partial;
output		dmc_txc_dma12_reset_scheduled;
output		dmc_txc_dma13_active;
output		dmc_txc_dma13_cacheready;
output	[63:0]	dmc_txc_dma13_descriptor;
output		dmc_txc_dma13_eoflist;
output		dmc_txc_dma13_error;
output	[1:0]	dmc_txc_dma13_func_num;
output		dmc_txc_dma13_gotnxtdesc;
output	[19:0]	dmc_txc_dma13_page_handle;
output		dmc_txc_dma13_partial;
output		dmc_txc_dma13_reset_scheduled;
output		dmc_txc_dma14_active;
output		dmc_txc_dma14_cacheready;
output	[63:0]	dmc_txc_dma14_descriptor;
output		dmc_txc_dma14_eoflist;
output		dmc_txc_dma14_error;
output	[1:0]	dmc_txc_dma14_func_num;
output		dmc_txc_dma14_gotnxtdesc;
output	[19:0]	dmc_txc_dma14_page_handle;
output		dmc_txc_dma14_partial;
output		dmc_txc_dma14_reset_scheduled;
output		dmc_txc_dma15_active;
output		dmc_txc_dma15_cacheready;
output	[63:0]	dmc_txc_dma15_descriptor;
output		dmc_txc_dma15_eoflist;
output		dmc_txc_dma15_error;
output	[1:0]	dmc_txc_dma15_func_num;
output		dmc_txc_dma15_gotnxtdesc;
output	[19:0]	dmc_txc_dma15_page_handle;
output		dmc_txc_dma15_partial;
output		dmc_txc_dma15_reset_scheduled;
output		dmc_txc_dma1_active;
output		dmc_txc_dma1_cacheready;
output	[63:0]	dmc_txc_dma1_descriptor;
output		dmc_txc_dma1_eoflist;
output		dmc_txc_dma1_error;
output	[1:0]	dmc_txc_dma1_func_num;
output		dmc_txc_dma1_gotnxtdesc;
output	[19:0]	dmc_txc_dma1_page_handle;
output		dmc_txc_dma1_partial;
output		dmc_txc_dma1_reset_scheduled;
output		dmc_txc_dma2_active;
output		dmc_txc_dma2_cacheready;
output	[63:0]	dmc_txc_dma2_descriptor;
output		dmc_txc_dma2_eoflist;
output		dmc_txc_dma2_error;
output	[1:0]	dmc_txc_dma2_func_num;
output		dmc_txc_dma2_gotnxtdesc;
output	[19:0]	dmc_txc_dma2_page_handle;
output		dmc_txc_dma2_partial;
output		dmc_txc_dma2_reset_scheduled;
output		dmc_txc_dma3_active;
output		dmc_txc_dma3_cacheready;
output	[63:0]	dmc_txc_dma3_descriptor;
output		dmc_txc_dma3_eoflist;
output		dmc_txc_dma3_error;
output	[1:0]	dmc_txc_dma3_func_num;
output		dmc_txc_dma3_gotnxtdesc;
output	[19:0]	dmc_txc_dma3_page_handle;
output		dmc_txc_dma3_partial;
output		dmc_txc_dma3_reset_scheduled;
output		dmc_txc_dma4_active;
output		dmc_txc_dma4_cacheready;
output	[63:0]	dmc_txc_dma4_descriptor;
output		dmc_txc_dma4_eoflist;
output		dmc_txc_dma4_error;
output	[1:0]	dmc_txc_dma4_func_num;
output		dmc_txc_dma4_gotnxtdesc;
output	[19:0]	dmc_txc_dma4_page_handle;
output		dmc_txc_dma4_partial;
output		dmc_txc_dma4_reset_scheduled;
output		dmc_txc_dma5_active;
output		dmc_txc_dma5_cacheready;
output	[63:0]	dmc_txc_dma5_descriptor;
output		dmc_txc_dma5_eoflist;
output		dmc_txc_dma5_error;
output	[1:0]	dmc_txc_dma5_func_num;
output		dmc_txc_dma5_gotnxtdesc;
output	[19:0]	dmc_txc_dma5_page_handle;
output		dmc_txc_dma5_partial;
output		dmc_txc_dma5_reset_scheduled;
output		dmc_txc_dma6_active;
output		dmc_txc_dma6_cacheready;
output	[63:0]	dmc_txc_dma6_descriptor;
output		dmc_txc_dma6_eoflist;
output		dmc_txc_dma6_error;
output	[1:0]	dmc_txc_dma6_func_num;
output		dmc_txc_dma6_gotnxtdesc;
output	[19:0]	dmc_txc_dma6_page_handle;
output		dmc_txc_dma6_partial;
output		dmc_txc_dma6_reset_scheduled;
output		dmc_txc_dma7_active;
output		dmc_txc_dma7_cacheready;
output	[63:0]	dmc_txc_dma7_descriptor;
output		dmc_txc_dma7_eoflist;
output		dmc_txc_dma7_error;
output	[1:0]	dmc_txc_dma7_func_num;
output		dmc_txc_dma7_gotnxtdesc;
output	[19:0]	dmc_txc_dma7_page_handle;
output		dmc_txc_dma7_partial;
output		dmc_txc_dma7_reset_scheduled;
output		dmc_txc_dma8_active;
output		dmc_txc_dma8_cacheready;
output	[63:0]	dmc_txc_dma8_descriptor;
output		dmc_txc_dma8_eoflist;
output		dmc_txc_dma8_error;
output	[1:0]	dmc_txc_dma8_func_num;
output		dmc_txc_dma8_gotnxtdesc;
output	[19:0]	dmc_txc_dma8_page_handle;
output		dmc_txc_dma8_partial;
output		dmc_txc_dma8_reset_scheduled;
output		dmc_txc_dma9_active;
output		dmc_txc_dma9_cacheready;
output	[63:0]	dmc_txc_dma9_descriptor;
output		dmc_txc_dma9_eoflist;
output		dmc_txc_dma9_error;
output	[1:0]	dmc_txc_dma9_func_num;
output		dmc_txc_dma9_gotnxtdesc;
output	[19:0]	dmc_txc_dma9_page_handle;
output		dmc_txc_dma9_partial;
output		dmc_txc_dma9_reset_scheduled;
output		dmc_txc_tx_addr_md;                // 1 would indicate 32bit addressing mode
output	[15:0]	meta1_rdmc_rbr_resp_byteenable;
output	[7:0]	meta1_rdmc_rbr_resp_cmd;
output	[3:0]	meta1_rdmc_rbr_resp_cmd_status;
output	[127:0]	meta1_rdmc_rbr_resp_data;
output	[4:0]	meta1_rdmc_rbr_resp_dma_num;
output		meta1_rdmc_rbr_resp_ready;
output	[31:0]	meta_arb_debug_port;
output		meta_dmc_ack_client_rdmc;          // 4
output	[7:0]	meta_dmc_ack_cmd;                  // Command Request
output	[3:0]	meta_dmc_ack_cmd_status;           // status in command phase
output	[4:0]	meta_dmc_ack_dma_num;              // Channel Number
output		meta_dmc_ack_ready;                // Resp Command Request  <--- all ack??
output	[127:0]	meta_dmc_data;
output	[3:0]	meta_dmc_data_status;              // <- chg
output		meta_dmc_data_valid_rdmc;
output		meta_dmc_data_valid_txc;
output	[63:0]	meta_dmc_resp_address;
output	[15:0]	meta_dmc_resp_byteenable;
output		meta_dmc_resp_client_rdmc;
output		meta_dmc_resp_client_txc;
output	[7:0]	meta_dmc_resp_cmd;
output	[3:0]	meta_dmc_resp_cmd_status;          // status in command phase
output		meta_dmc_resp_complete_rdmc;       // 5
output		meta_dmc_resp_complete_txc;        // 1
output	[4:0]	meta_dmc_resp_dma_num;
output	[13:0]	meta_dmc_resp_length;
output	[1:0]	meta_dmc_resp_port_num;
output		meta_dmc_resp_ready;
output	[5:0]	meta_dmc_resp_trans_id;
output		meta_dmc_resp_transfer_cmpl_rdmc;
output		meta_dmc_resp_transfer_cmpl_txc;
output		niu_dbg1_stall_ack;
output		niu_efu_ram_data;
output		niu_efu_ram_xfer_en;
output		niu_ncu_ctag_ce;
output		niu_ncu_ctag_ue;
output		niu_ncu_d_pe;
output	[127:0]	niu_sii_data;
output		niu_sii_datareq;
output		niu_sii_hdr_vld;
output	[7:0]	niu_sii_parity;
output		niu_sii_reqbypass;
output		niu_sio_dq;
output		scan_out;                          // unused as of today - feb 10, 05
output	[31:0]	smx_debug_port;
output		smx_pio_intr;                      // level signal;
output	[31:0]	smx_pio_status;                    // status info related to intr
output	[31:0]	tdmc_debug_port;
output		tdmc_pio_ack;                      // pio read data ack
output		tdmc_pio_err;                      // pio read data error
output	[63:0]	tdmc_pio_intr;
output	[63:0]	tdmc_pio_rdata;                    // pio read data
output		tds_mbist_scan_out;
output		tds_smx_tcu_mbist_done;
output		tds_smx_tcu_mbist_fail;
output	[39:0]	tds_tcu_dmo_dout;
output		tds_tdmc_tcu_mbist_done;
output		tds_tdmc_tcu_mbist_fail;

wire	[127:0]	dmc_meta0_data;
wire	[63:0]	dmc_meta0_req_address;
wire	[15:0]	dmc_meta0_req_byteenable;
wire	[63:0]	dmc_meta1_req_address;
wire	[127:0]	tdmc_arb0_data;
wire	[63:0]	tdmc_arb0_req_address;
wire	[15:0]	tdmc_arb0_req_byteenable;
wire	[63:0]	tdmc_arb1_req_address;
wire	[39:0]	tds_tcu_dmo_data_out;
wire	[15:0]	x_meta1_rdmc_rbr_resp_byteenable;
wire	[127:0]	x_meta1_rdmc_rbr_resp_data;
wire		aclk;
wire		arb0_tdmc_data_req;
wire		arb0_tdmc_req_accept;
wire		arb1_tdmc_req_accept;
wire		bclk;
wire		dmc_meta0_data_valid;
wire		dmc_meta0_req;
wire	[7:0]	dmc_meta0_req_client;
wire	[7:0]	dmc_meta0_req_cmd;
wire	[4:0]	dmc_meta0_req_dma_num;
wire	[13:0]	dmc_meta0_req_length;
wire	[1:0]	dmc_meta0_req_port_num;
wire	[5:0]	dmc_meta0_req_transID;
wire	[3:0]	dmc_meta0_status;
wire		dmc_meta0_transfer_complete;
wire		dmc_meta1_req;
wire	[7:0]	dmc_meta1_req_client;
wire	[7:0]	dmc_meta1_req_cmd;
wire	[4:0]	dmc_meta1_req_dma_num;
wire	[13:0]	dmc_meta1_req_length;
wire	[1:0]	dmc_meta1_req_port_num;
wire		hdr_sram_red_clr_tdmc;
wire	[1:0]	hdr_sram_rid_tdmc;
wire	[6:0]	hdr_sram_rvalue_tdmc;
wire		hdr_sram_wr_en_tdmc;
wire		io2xclk_scan_out;
wire		io2xl2clk;
wire		ioclk_scan_out;
wire		iol2clk;
wire		l1clk;
wire		meta_dmc0_data_req;
wire		meta_dmc0_req_accept;
wire		meta_dmc0_req_errors;
wire		meta_dmc1_req_accept;
wire		meta_dmc1_req_errors;
wire		meta_dmc_ack_client_tdmc;
wire		meta_dmc_ack_complete;
wire	[5:0]	meta_dmc_ack_transID;
wire	[7:0]	meta_dmc_ack_transfer_cmpl;
wire		meta_dmc_data_valid_tdmc;
wire		meta_dmc_resp_client_tdmc;
wire		meta_dmc_resp_complete_tdmc;
wire	[7:0]	meta_dmc_resp_transfer_cmpl;
wire		meta_dmc_resp_transfer_cmpl_tdmc;
wire		niu_reset_l;
wire	[6:0]	sram_hdr_read_data_tdmc;
wire		tdmc_arb0_data_valid;
wire		tdmc_arb0_req;
wire	[7:0]	tdmc_arb0_req_cmd;
wire	[4:0]	tdmc_arb0_req_dma_num;
wire	[1:0]	tdmc_arb0_req_func_num;
wire	[13:0]	tdmc_arb0_req_length;
wire	[1:0]	tdmc_arb0_req_port_num;
wire	[3:0]	tdmc_arb0_status;
wire		tdmc_arb0_transfer_complete;
wire		tdmc_arb1_req;
wire	[7:0]	tdmc_arb1_req_cmd;
wire	[4:0]	tdmc_arb1_req_dma_num;
wire	[1:0]	tdmc_arb1_req_func_num;
wire	[13:0]	tdmc_arb1_req_length;
wire	[1:0]	tdmc_arb1_req_port_num;
wire		tdmc_meta_ack_accept;
wire		tdmc_meta_resp_accept;
wire		tds_array_wr_inhibit;
wire		tds_pce_ov;
wire		tds_smx_mbist_scan_in;
wire	[10:7]	unconnected_1;
wire	[10:2]	unconnected_2;
wire	[7:0]	x_meta1_rdmc_rbr_resp_cmd;
wire	[3:0]	x_meta1_rdmc_rbr_resp_cmd_status;
wire	[4:0]	x_meta1_rdmc_rbr_resp_dma_num;
wire		x_meta1_rdmc_rbr_resp_ready;

niu_smx niu_smx (
    .niu_clk                          (l1clk),
    .iol2clk                          (iol2clk),
    .niu_reset_l                      (niu_reset_l),
    .niu_sii_hdr_vld                  (niu_sii_hdr_vld),
    .niu_sii_reqbypass                (niu_sii_reqbypass),
    .niu_sii_datareq                  (niu_sii_datareq),
    .niu_sii_data                     (niu_sii_data[127:0]),
    .niu_sii_parity                   (niu_sii_parity[7:0]),
    .sii_niu_oqdq                     (sii_niu_oqdq),
    .sii_niu_bqdq                     (sii_niu_bqdq),
    .sio_niu_hdr_vld                  (sio_niu_hdr_vld),
    .sio_niu_datareq                  (sio_niu_datareq),
    .sio_niu_data                     (sio_niu_data[127:0]),
    .sio_niu_parity                   (sio_niu_parity[7:0]),
    .niu_sio_dq                       (niu_sio_dq),
    .dmc_meta0_req                    (dmc_meta0_req),
    .dmc_meta0_req_cmd                (dmc_meta0_req_cmd[7:0]),
    .dmc_meta0_req_address            (dmc_meta0_req_address[63:0]),
    .dmc_meta0_req_length             (dmc_meta0_req_length[13:0]),
    .dmc_meta0_req_transID            (dmc_meta0_req_transID[5:0]),
    .dmc_meta0_req_port_num           (dmc_meta0_req_port_num[1:0]),
    .dmc_meta0_req_dma_num            (dmc_meta0_req_dma_num[4:0]),
    .dmc_meta0_req_client             (dmc_meta0_req_client[7:0]),
    .meta_dmc0_req_accept             (meta_dmc0_req_accept),
    .meta_dmc0_req_errors             (meta_dmc0_req_errors),
    .meta_dmc0_data_req               (meta_dmc0_data_req),
    .dmc_meta0_data_valid             (dmc_meta0_data_valid),
    .dmc_meta0_data                   (dmc_meta0_data[127:0]),
    .dmc_meta0_req_byteenable         (dmc_meta0_req_byteenable[15:0]),
    .dmc_meta0_status                 (dmc_meta0_status[3:0]),
    .dmc_meta0_transfer_complete      (dmc_meta0_transfer_complete),
    .dmc_meta1_req                    (dmc_meta1_req),
    .dmc_meta1_req_cmd                (dmc_meta1_req_cmd[7:0]),
    .dmc_meta1_req_address            (dmc_meta1_req_address[63:0]),
    .dmc_meta1_req_length             (dmc_meta1_req_length[13:0]),
    .dmc_meta1_req_transID            (dmc_meta1_req_trans_id[5:0]),
    .dmc_meta1_req_port_num           (dmc_meta1_req_port_num[1:0]),
    .dmc_meta1_req_dma_num            (dmc_meta1_req_dma_num[4:0]),
    .dmc_meta1_req_client             (dmc_meta1_req_client[7:0]),
    .meta_dmc1_req_accept             (meta_dmc1_req_accept),
    .meta_dmc1_req_errors             (meta_dmc1_req_errors),
    .meta_dmc_resp_ready              (x_meta1_rdmc_rbr_resp_ready),
    .meta_dmc_resp_cmd                (x_meta1_rdmc_rbr_resp_cmd[7:0]),
    .meta_dmc_resp_cmd_status         (x_meta1_rdmc_rbr_resp_cmd_status[3:0]),
    .meta_dmc_resp_address            (meta_dmc_resp_address[63:0]),
    .meta_dmc_resp_length             (meta_dmc_resp_length[13:0]),
    .meta_dmc_resp_transID            (meta_dmc_resp_trans_id[5:0]),
    .meta_dmc_resp_port_num           (meta_dmc_resp_port_num[1:0]),
    .meta_dmc_resp_dma_num            (x_meta1_rdmc_rbr_resp_dma_num[4:0]),
    .meta_dmc_resp_client_txc         (meta_dmc_resp_client_txc),
    .meta_dmc_resp_client_tdmc        (meta_dmc_resp_client_tdmc),
    .meta_dmc_resp_client_rdmc        (meta_dmc_resp_client_rdmc),
    .rdmc_meta_resp_accept            (rdmc_meta_resp_accept),
    .txc_meta_resp_accept             (txc_meta_resp_accept),
    .tdmc_meta_resp_accept            (tdmc_meta_resp_accept),
    .meta_dmc_data_valid_txc          (meta_dmc_data_valid_txc),
    .meta_dmc_data_valid_tdmc         (meta_dmc_data_valid_tdmc),
    .meta_dmc_data_valid_rdmc         (meta_dmc_data_valid_rdmc),
    .meta_dmc_data                    (x_meta1_rdmc_rbr_resp_data[127:0]),
    .meta_dmc_resp_byteenable         (x_meta1_rdmc_rbr_resp_byteenable[15:0]),
    .meta_dmc_data_status             (meta_dmc_data_status[3:0]),
    .meta_dmc_resp_complete_txc       (meta_dmc_resp_complete_txc),
    .meta_dmc_resp_complete_tdmc      (meta_dmc_resp_complete_tdmc),
    .meta_dmc_resp_complete_rdmc      (meta_dmc_resp_complete_rdmc),
    .meta_dmc_resp_transfer_cmpl      (meta_dmc_resp_transfer_cmpl[7:0]),
    .meta_dmc_resp_transfer_cmpl_txc  (meta_dmc_resp_transfer_cmpl_txc),
    .meta_dmc_resp_transfer_cmpl_tdmc (meta_dmc_resp_transfer_cmpl_tdmc),
    .meta_dmc_resp_transfer_cmpl_rdmc (meta_dmc_resp_transfer_cmpl_rdmc),
    .meta_dmc_ack_ready               (meta_dmc_ack_ready),
    .meta_dmc_ack_cmd                 (meta_dmc_ack_cmd[7:0]),
    .meta_dmc_ack_cmd_status          (meta_dmc_ack_cmd_status[3:0]),
    .meta_dmc_ack_dma_num             (meta_dmc_ack_dma_num[4:0]),
    .meta_dmc_ack_transID             (meta_dmc_ack_transID[5:0]),
    .meta_dmc_ack_client_tdmc         (meta_dmc_ack_client_tdmc),
    .meta_dmc_ack_client_rdmc         (meta_dmc_ack_client_rdmc),
    .meta_dmc_ack_complete            (meta_dmc_ack_complete),
    .meta_dmc_ack_transfer_cmpl       (meta_dmc_ack_transfer_cmpl[7:0]),
    .rdmc_meta_ack_accept             (rdmc_meta_ack_accept),
    .tdmc_meta_ack_accept             (tdmc_meta_ack_accept),
    .ncu_niu_ctag_uei                 (ncu_niu_ctag_uei),
    .ncu_niu_ctag_cei                 (ncu_niu_ctag_cei),
    .ncu_niu_d_pei                    (ncu_niu_d_pei),
    .niu_ncu_ctag_ue                  (niu_ncu_ctag_ue),
    .niu_ncu_ctag_ce                  (niu_ncu_ctag_ce),
    .niu_ncu_d_pe                     (niu_ncu_d_pe),
    .tcu_aclk                         (aclk),
    .tcu_bclk                         (bclk),
    .tcu_se_scancollar_in             (tcu_se_scancollar_in),
    .tcu_array_wr_inhibit             (tds_array_wr_inhibit),
    .tcu_mbist_user_mode              (tcu_mbist_user_mode),
    .tds_smx_mbist_scan_in            (tds_smx_mbist_scan_in),
    .tcu_tds_smx_mbist_start          (tcu_tds_smx_mbist_start),
    .tcu_mbist_bisi_en                (tcu_mbist_bisi_en),
    .tds_smx_tcu_mbist_fail           (tds_smx_tcu_mbist_fail),
    .tds_smx_tcu_mbist_done           (tds_smx_tcu_mbist_done),
    .tds_smx_mbist_scan_out           (tds_mbist_scan_out),
    .pio_smx_cfg_data                 (pio_smx_cfg_data[31:0]),
    .smx_pio_intr                     (smx_pio_intr),
    .smx_pio_status                   (smx_pio_status[31:0]),
    .pio_smx_clear_intr               (pio_smx_clear_intr),
    .pio_smx_ctrl                     (pio_smx_ctrl[31:0]),
    .pio_smx_debug_vector             (pio_smx_debug_vector[31:0]),
    .dbg1_niu_stall                   (dbg1_niu_stall),
    .dbg1_niu_resume                  (dbg1_niu_resume),
    .niu_dbg1_stall_ack               (niu_dbg1_stall_ack),
    .smx_debug_port                   (smx_debug_port[31:0])
    );

niu_meta_arb niu_meta_arb (
    .meta_dmc0_data_req          (meta_dmc0_data_req),
    .meta_dmc0_req_accept        (meta_dmc0_req_accept),
    .meta_dmc0_req_errors        (meta_dmc0_req_errors),
    .meta_dmc1_req_accept        (meta_dmc1_req_accept),
    .meta_dmc1_req_errors        (meta_dmc1_req_errors),
    .meta_dmc_ack_cmd_status     (meta_dmc_ack_cmd_status[3:0]),
    .meta_dmc_ack_transID        (meta_dmc_ack_transID[5:0]),
    .meta_dmc_ack_transfer_cmpl  (meta_dmc_ack_transfer_cmpl[7:0]),
    .meta_dmc_resp_cmd_status    (meta_dmc_resp_cmd_status[3:0]),
    .meta_dmc_resp_transID       (meta_dmc_resp_trans_id[5:0]),
    .meta_dmc_resp_transfer_cmpl (meta_dmc_resp_transfer_cmpl[7:0]),
    .pio_arb_ctrl                (pio_arb_ctrl[31:0]),
    .pio_arb_debug_vector        (pio_arb_debug_vector[31:0]),
    .pio_arb_dirtid_clr          (pio_arb_dirtid_clr),
    .pio_arb_dirtid_enable       (pio_arb_dirtid_enable),
    .pio_arb_np_threshold        (pio_arb_np_threshold[5:0]),
    .pio_arb_rd_threshold        (pio_arb_rd_threshold[5:0]),
    .rbr_arb1_req                (rbr_arb1_req),
    .rbr_arb1_req_address        (rbr_arb1_req_address[63:0]),
    .rbr_arb1_req_cmd            (rbr_arb1_req_cmd[7:0]),
    .rbr_arb1_req_dma_num        (rbr_arb1_req_dma_num[4:0]),
    .rbr_arb1_req_func_num       (rbr_arb1_req_func_num[1:0]),
    .rbr_arb1_req_length         (rbr_arb1_req_length[13:0]),
    .rbr_arb1_req_port_num       (rbr_arb1_req_port_num[1:0]),
    .rcr_arb0_data               (rcr_arb0_data[127:0]),
    .rcr_arb0_data_valid         (rcr_arb0_data_valid),
    .rcr_arb0_req                (rcr_arb0_req),
    .rcr_arb0_req_address        (rcr_arb0_req_address[63:0]),
    .rcr_arb0_req_byteenable     (rcr_arb0_req_byteenable[15:0]),
    .rcr_arb0_req_cmd            (rcr_arb0_req_cmd[7:0]),
    .rcr_arb0_req_dma_num        (rcr_arb0_req_dma_num[4:0]),
    .rcr_arb0_req_func_num       (rcr_arb0_req_func_num[1:0]),
    .rcr_arb0_req_length         (rcr_arb0_req_length[13:0]),
    .rcr_arb0_req_port_num       (rcr_arb0_req_port_num[1:0]),
    .rcr_arb0_status             (rcr_arb0_status[3:0]),
    .rcr_arb0_transfer_complete  (rcr_arb0_transfer_complete),
    .rdc_arb0_data               (rdc_arb0_data[127:0]),
    .rdc_arb0_data_valid         (rdc_arb0_data_valid),
    .rdc_arb0_req                (rdc_arb0_req),
    .rdc_arb0_req_address        (rdc_arb0_req_address[63:0]),
    .rdc_arb0_req_byteenable     (rdc_arb0_req_byteenable[15:0]),
    .rdc_arb0_req_cmd            (rdc_arb0_req_cmd[7:0]),
    .rdc_arb0_req_dma_num        (rdc_arb0_req_dma_num[4:0]),
    .rdc_arb0_req_func_num       (rdc_arb0_req_func_num[1:0]),
    .rdc_arb0_req_length         (rdc_arb0_req_length[13:0]),
    .rdc_arb0_req_port_num       (rdc_arb0_req_port_num[1:0]),
    .rdc_arb0_status             (rdc_arb0_status[3:0]),
    .rdc_arb0_transfer_complete  (rdc_arb0_transfer_complete),
    .tdmc_arb0_data              (tdmc_arb0_data[127:0]),
    .tdmc_arb0_data_valid        (tdmc_arb0_data_valid),
    .tdmc_arb0_req               (tdmc_arb0_req),
    .tdmc_arb0_req_address       (tdmc_arb0_req_address[63:0]),
    .tdmc_arb0_req_byteenable    (tdmc_arb0_req_byteenable[15:0]),
    .tdmc_arb0_req_cmd           (tdmc_arb0_req_cmd[7:0]),
    .tdmc_arb0_req_dma_num       (tdmc_arb0_req_dma_num[4:0]),
    .tdmc_arb0_req_func_num      (tdmc_arb0_req_func_num[1:0]),
    .tdmc_arb0_req_length        (tdmc_arb0_req_length[13:0]),
    .tdmc_arb0_req_port_num      (tdmc_arb0_req_port_num[1:0]),
    .tdmc_arb0_status            (tdmc_arb0_status[3:0]),
    .tdmc_arb0_transfer_complete (tdmc_arb0_transfer_complete),
    .tdmc_arb1_req               (tdmc_arb1_req),
    .tdmc_arb1_req_address       (tdmc_arb1_req_address[63:0]),
    .tdmc_arb1_req_cmd           (tdmc_arb1_req_cmd[7:0]),
    .tdmc_arb1_req_dma_num       (tdmc_arb1_req_dma_num[4:0]),
    .tdmc_arb1_req_func_num      (tdmc_arb1_req_func_num[1:0]),
    .tdmc_arb1_req_length        (tdmc_arb1_req_length[13:0]),
    .tdmc_arb1_req_port_num      (tdmc_arb1_req_port_num[1:0]),
    .txc_arb1_req                (txc_arb1_req),
    .txc_arb1_req_address        (txc_arb1_req_address[63:0]),
    .txc_arb1_req_cmd            (txc_arb1_req_cmd[7:0]),
    .txc_arb1_req_dma_num        (txc_arb1_req_dma_num[4:0]),
    .txc_arb1_req_func_num       (txc_arb1_req_func_num[1:0]),
    .txc_arb1_req_length         (txc_arb1_req_length[13:0]),
    .txc_arb1_req_port_num       (txc_arb1_req_port_num[1:0]),
    .arb0_rcr_data_req           (arb0_rcr_data_req),
    .arb0_rcr_req_accept         (arb0_rcr_req_accept),
    .arb0_rdc_data_req           (arb0_rdc_data_req),
    .arb0_rdc_req_accept         (arb0_rdc_req_accept),
    .arb0_tdmc_data_req          (arb0_tdmc_data_req),
    .arb0_tdmc_req_accept        (arb0_tdmc_req_accept),
    .arb1_rbr_req_accept         (arb1_rbr_req_accept),
    .arb1_tdmc_req_accept        (arb1_tdmc_req_accept),
    .arb1_txc_req_accept         (arb1_txc_req_accept),
    .arb1_rbr_req_errors         (arb1_rbr_req_errors),
    .arb_pio_all_npwdirty        (arb_pio_all_npwdirty),
    .arb_pio_all_rddirty         (arb_pio_all_rddirty),
    .arb_pio_dirtid_npwstatus    (arb_pio_dirtid_npwstatus[5:0]),
    .arb_pio_dirtid_rdstatus     (arb_pio_dirtid_rdstatus[5:0]),
    .dmc_meta0_data              (dmc_meta0_data[127:0]),
    .dmc_meta0_data_valid        (dmc_meta0_data_valid),
    .dmc_meta0_req               (dmc_meta0_req),
    .dmc_meta0_req_address       (dmc_meta0_req_address[63:0]),
    .dmc_meta0_req_byteenable    (dmc_meta0_req_byteenable[15:0]),
    .dmc_meta0_req_client        (dmc_meta0_req_client[7:0]),
    .dmc_meta0_req_cmd           (dmc_meta0_req_cmd[7:0]),
    .dmc_meta0_req_dma_num       (dmc_meta0_req_dma_num[4:0]),
    .dmc_meta0_req_length        (dmc_meta0_req_length[13:0]),
    .dmc_meta0_req_port_num      (dmc_meta0_req_port_num[1:0]),
    .dmc_meta0_req_transID       (dmc_meta0_req_transID[5:0]),
    .dmc_meta0_status            (dmc_meta0_status[3:0]),
    .dmc_meta0_transfer_complete (dmc_meta0_transfer_complete),
    .dmc_meta1_req               (dmc_meta1_req),
    .dmc_meta1_req_address       (dmc_meta1_req_address[63:0]),
    .dmc_meta1_req_client        (dmc_meta1_req_client[7:0]),
    .dmc_meta1_req_cmd           (dmc_meta1_req_cmd[7:0]),
    .dmc_meta1_req_dma_num       (dmc_meta1_req_dma_num[4:0]),
    .dmc_meta1_req_length        (dmc_meta1_req_length[13:0]),
    .dmc_meta1_req_port_num      (dmc_meta1_req_port_num[1:0]),
    .dmc_meta1_req_transID       (dmc_meta1_req_trans_id[5:0]),
    .meta_arb_debug_port         (meta_arb_debug_port[31:0]),
    .niu_clk                     (l1clk),
    .niu_reset_l                 (niu_reset_l),
    .rdmc_meta_ack_accept        (rdmc_meta_ack_accept),
    .tdmc_meta_ack_accept        (tdmc_meta_ack_accept),
    .rdmc_meta_resp_accept       (rdmc_meta_resp_accept),
    .tdmc_meta_resp_accept       (tdmc_meta_resp_accept),
    .txc_meta_resp_accept        (txc_meta_resp_accept)
    );

niu_tdmc niu_tdmc (
    .niu_clk                       (l1clk),
    .niu_reset_l                   (niu_reset_l),
    .tdmc_debug_port               (tdmc_debug_port[31:0]),
    .tcu_aclk                      (aclk),
    .tcu_bclk                      (bclk),
    .tcu_se_scancollar_in          (tcu_se_scancollar_in),
    .tcu_se_scancollar_out         (tcu_se_scancollar_out),
    .tcu_array_wr_inhibit          (tds_array_wr_inhibit),
    .tcu_scan_en                   (tcu_scan_en),
    .tds_tdmc_mbist_scan_in        (tds_mbist_scan_in),
    .tds_tdmc_mbist_scan_out       (tds_smx_mbist_scan_in),
    .tcu_mbist_user_mode           (tcu_mbist_user_mode),
    .tcu_tds_tdmc_mbist_start      (tcu_tds_tdmc_mbist_start),
    .tcu_mbist_bisi_en             (tcu_mbist_bisi_en),
    .tds_tdmc_tcu_mbist_fail       (tds_tdmc_tcu_mbist_fail),
    .tds_tdmc_tcu_mbist_done       (tds_tdmc_tcu_mbist_done),
    .l2clk_2x                      (io2xl2clk),
    .iol2clk                       (iol2clk),
    .hdr_sram_rvalue_tdmc          ( hdr_sram_rvalue_tdmc[6:0]),
    .hdr_sram_rid_tdmc             (hdr_sram_rid_tdmc[1:0]),
    .hdr_sram_wr_en_tdmc           (hdr_sram_wr_en_tdmc),
    .hdr_sram_red_clr_tdmc         (hdr_sram_red_clr_tdmc),
    .sram_hdr_read_data_tdmc       (sram_hdr_read_data_tdmc[6:0]),
    .tds_tcu_dmo_data_out          (tds_tcu_dmo_data_out[39:0]),
    .tdmc_arb1_req                 (tdmc_arb1_req),
    .tdmc_arb1_req_port_num        (tdmc_arb1_req_port_num[1:0]),
    .tdmc_arb1_req_dma_num         (tdmc_arb1_req_dma_num[4:0]),
    .tdmc_arb1_req_cmd             (tdmc_arb1_req_cmd[7:0]),
    .tdmc_arb1_req_length          (tdmc_arb1_req_length[13:0]),
    .tdmc_arb1_req_address         (tdmc_arb1_req_address[63:0]),
    .dmc_meta_resp_accept          (tdmc_meta_resp_accept),
    .tdmc_arb1_req_func_num        (tdmc_arb1_req_func_num[1:0]),
    .arb1_tdmc_req_accept          (arb1_tdmc_req_accept),
    .meta_dmc_resp_ready           (x_meta1_rdmc_rbr_resp_ready),
    .meta_dmc_resp_client          (meta_dmc_resp_client_tdmc),
    .meta_dmc_resp_complete        (meta_dmc_resp_complete_tdmc),
    .meta_dmc_resp_transfer_cmpl   (meta_dmc_resp_transfer_cmpl_tdmc),
    .meta_dmc_data_valid           (meta_dmc_data_valid_tdmc),
    .meta_dmc_resp_dma_num         (x_meta1_rdmc_rbr_resp_dma_num[4:0]),
    .meta_dmc_resp_length          (meta_dmc_resp_length[13:0]),
    .meta_dmc_resp_byteenable      (x_meta1_rdmc_rbr_resp_byteenable[15:0]),
    .meta_dmc_resp_address         (meta_dmc_resp_address[63:0]),
    .meta_dmc_data                 (x_meta1_rdmc_rbr_resp_data[127:0]),
    .meta_dmc_resp_cmd             (x_meta1_rdmc_rbr_resp_cmd[7:0]),
    .meta_dmc_resp_cmd_status      (x_meta1_rdmc_rbr_resp_cmd_status[3:0]),
    .meta_dmc_data_status          (meta_dmc_data_status[3:0]),
    .tdmc_arb0_data_valid          (tdmc_arb0_data_valid),
    .tdmc_arb0_req                 (tdmc_arb0_req),
    .tdmc_arb0_transfer_complete   (tdmc_arb0_transfer_complete),
    .tdmc_arb0_req_port_num        (tdmc_arb0_req_port_num[1:0]),
    .tdmc_arb0_status              (tdmc_arb0_status[3:0]),
    .tdmc_arb0_req_dma_num         (tdmc_arb0_req_dma_num[4:0]),
    .tdmc_arb0_req_cmd             (tdmc_arb0_req_cmd[7:0]),
    .tdmc_arb0_req_length          (tdmc_arb0_req_length[13:0]),
    .tdmc_arb0_req_byteenable      (tdmc_arb0_req_byteenable[15:0]),
    .tdmc_arb0_req_address         (tdmc_arb0_req_address[63:0]),
    .tdmc_arb0_data                (tdmc_arb0_data[127:0]),
    .tdmc_arb0_req_func_num        (tdmc_arb0_req_func_num[1:0]),
    .dmc_meta_ack_accept           (tdmc_meta_ack_accept),
    .arb0_tdmc_data_req            (arb0_tdmc_data_req),
    .arb0_tdmc_req_accept          (arb0_tdmc_req_accept),
    .meta_dmc_ack_ready            (meta_dmc_ack_ready),
    .meta_dmc_ack_client           (meta_dmc_ack_client_tdmc),
    .meta_dmc_ack_complete         (meta_dmc_ack_complete),
    .meta_dmc_ack_dma_num          (meta_dmc_ack_dma_num[4:0]),
    .meta_dmc_ack_cmd              (meta_dmc_ack_cmd[7:0]),
    .meta_dmc_ack_cmd_status       (meta_dmc_ack_cmd_status[3:0]),
    .tdmc_pio_ack                  (tdmc_pio_ack),
    .tdmc_pio_err                  (tdmc_pio_err),
    .tdmc_pio_rdata                (tdmc_pio_rdata[63:0]),
    .tdmc_pio_intr                 (tdmc_pio_intr[63:0]),
    .pio_clients_rd                (pio_clients_rd),
    .pio_tdmc_sel                  (pio_tdmc_sel),
    .pio_clients_addr              (pio_clients_addr[19:0]),
    .pio_clients_wdata             (pio_clients_wdata[63:0]),
    .txc_dmc_dma0_getnxtdesc       (txc_dmc_dma0_getnxtdesc),
    .txc_dmc_dma0_inc_head         (txc_dmc_dma0_inc_head),
    .txc_dmc_dma0_reset_done       (txc_dmc_dma0_reset_done),
    .txc_dmc_dma0_mark_bit         (txc_dmc_dma0_mark_bit),
    .txc_dmc_dma0_inc_pkt_cnt      (txc_dmc_dma0_inc_pkt_cnt),
    .dmc_txc_dma0_active           (dmc_txc_dma0_active),
    .dmc_txc_dma0_eoflist          (dmc_txc_dma0_eoflist),
    .dmc_txc_dma0_error            (dmc_txc_dma0_error),
    .dmc_txc_dma0_gotnxtdesc       (dmc_txc_dma0_gotnxtdesc),
    .dmc_txc_dma0_cacheready       (dmc_txc_dma0_cacheready),
    .dmc_txc_dma0_partial          (dmc_txc_dma0_partial),
    .dmc_txc_dma0_reset_scheduled  (dmc_txc_dma0_reset_scheduled),
    .dmc_txc_dma0_page_handle      (dmc_txc_dma0_page_handle[19:0]),
    .dmc_txc_dma0_descriptor       (dmc_txc_dma0_descriptor[63:0]),
    .txc_dmc_dma1_getnxtdesc       (txc_dmc_dma1_getnxtdesc),
    .txc_dmc_dma1_inc_head         (txc_dmc_dma1_inc_head),
    .txc_dmc_dma1_reset_done       (txc_dmc_dma1_reset_done),
    .txc_dmc_dma1_mark_bit         (txc_dmc_dma1_mark_bit),
    .txc_dmc_dma1_inc_pkt_cnt      (txc_dmc_dma1_inc_pkt_cnt),
    .dmc_txc_dma1_active           (dmc_txc_dma1_active),
    .dmc_txc_dma1_eoflist          (dmc_txc_dma1_eoflist),
    .dmc_txc_dma1_error            (dmc_txc_dma1_error),
    .dmc_txc_dma1_gotnxtdesc       (dmc_txc_dma1_gotnxtdesc),
    .dmc_txc_dma1_cacheready       (dmc_txc_dma1_cacheready),
    .dmc_txc_dma1_partial          (dmc_txc_dma1_partial),
    .dmc_txc_dma1_reset_scheduled  (dmc_txc_dma1_reset_scheduled),
    .dmc_txc_dma1_page_handle      (dmc_txc_dma1_page_handle[19:0]),
    .dmc_txc_dma1_descriptor       (dmc_txc_dma1_descriptor[63:0]),
    .txc_dmc_dma2_getnxtdesc       (txc_dmc_dma2_getnxtdesc),
    .txc_dmc_dma2_inc_head         (txc_dmc_dma2_inc_head),
    .txc_dmc_dma2_reset_done       (txc_dmc_dma2_reset_done),
    .txc_dmc_dma2_mark_bit         (txc_dmc_dma2_mark_bit),
    .txc_dmc_dma2_inc_pkt_cnt      (txc_dmc_dma2_inc_pkt_cnt),
    .dmc_txc_dma2_active           (dmc_txc_dma2_active),
    .dmc_txc_dma2_eoflist          (dmc_txc_dma2_eoflist),
    .dmc_txc_dma2_error            (dmc_txc_dma2_error),
    .dmc_txc_dma2_gotnxtdesc       (dmc_txc_dma2_gotnxtdesc),
    .dmc_txc_dma2_cacheready       (dmc_txc_dma2_cacheready),
    .dmc_txc_dma2_partial          (dmc_txc_dma2_partial),
    .dmc_txc_dma2_reset_scheduled  (dmc_txc_dma2_reset_scheduled),
    .dmc_txc_dma2_page_handle      (dmc_txc_dma2_page_handle[19:0]),
    .dmc_txc_dma2_descriptor       (dmc_txc_dma2_descriptor[63:0]),
    .txc_dmc_dma3_getnxtdesc       (txc_dmc_dma3_getnxtdesc),
    .txc_dmc_dma3_inc_head         (txc_dmc_dma3_inc_head),
    .txc_dmc_dma3_reset_done       (txc_dmc_dma3_reset_done),
    .txc_dmc_dma3_mark_bit         (txc_dmc_dma3_mark_bit),
    .txc_dmc_dma3_inc_pkt_cnt      (txc_dmc_dma3_inc_pkt_cnt),
    .dmc_txc_dma3_active           (dmc_txc_dma3_active),
    .dmc_txc_dma3_eoflist          (dmc_txc_dma3_eoflist),
    .dmc_txc_dma3_error            (dmc_txc_dma3_error),
    .dmc_txc_dma3_gotnxtdesc       (dmc_txc_dma3_gotnxtdesc),
    .dmc_txc_dma3_cacheready       (dmc_txc_dma3_cacheready),
    .dmc_txc_dma3_partial          (dmc_txc_dma3_partial),
    .dmc_txc_dma3_reset_scheduled  (dmc_txc_dma3_reset_scheduled),
    .dmc_txc_dma3_page_handle      (dmc_txc_dma3_page_handle[19:0]),
    .dmc_txc_dma3_descriptor       (dmc_txc_dma3_descriptor[63:0]),
    .txc_dmc_dma4_getnxtdesc       (txc_dmc_dma4_getnxtdesc),
    .txc_dmc_dma4_inc_head         (txc_dmc_dma4_inc_head),
    .txc_dmc_dma4_reset_done       (txc_dmc_dma4_reset_done),
    .txc_dmc_dma4_mark_bit         (txc_dmc_dma4_mark_bit),
    .txc_dmc_dma4_inc_pkt_cnt      (txc_dmc_dma4_inc_pkt_cnt),
    .dmc_txc_dma4_active           (dmc_txc_dma4_active),
    .dmc_txc_dma4_eoflist          (dmc_txc_dma4_eoflist),
    .dmc_txc_dma4_error            (dmc_txc_dma4_error),
    .dmc_txc_dma4_gotnxtdesc       (dmc_txc_dma4_gotnxtdesc),
    .dmc_txc_dma4_cacheready       (dmc_txc_dma4_cacheready),
    .dmc_txc_dma4_partial          (dmc_txc_dma4_partial),
    .dmc_txc_dma4_reset_scheduled  (dmc_txc_dma4_reset_scheduled),
    .dmc_txc_dma4_page_handle      (dmc_txc_dma4_page_handle[19:0]),
    .dmc_txc_dma4_descriptor       (dmc_txc_dma4_descriptor[63:0]),
    .txc_dmc_dma5_getnxtdesc       (txc_dmc_dma5_getnxtdesc),
    .txc_dmc_dma5_inc_head         (txc_dmc_dma5_inc_head),
    .txc_dmc_dma5_reset_done       (txc_dmc_dma5_reset_done),
    .txc_dmc_dma5_mark_bit         (txc_dmc_dma5_mark_bit),
    .txc_dmc_dma5_inc_pkt_cnt      (txc_dmc_dma5_inc_pkt_cnt),
    .dmc_txc_dma5_active           (dmc_txc_dma5_active),
    .dmc_txc_dma5_eoflist          (dmc_txc_dma5_eoflist),
    .dmc_txc_dma5_error            (dmc_txc_dma5_error),
    .dmc_txc_dma5_gotnxtdesc       (dmc_txc_dma5_gotnxtdesc),
    .dmc_txc_dma5_cacheready       (dmc_txc_dma5_cacheready),
    .dmc_txc_dma5_partial          (dmc_txc_dma5_partial),
    .dmc_txc_dma5_reset_scheduled  (dmc_txc_dma5_reset_scheduled),
    .dmc_txc_dma5_page_handle      (dmc_txc_dma5_page_handle[19:0]),
    .dmc_txc_dma5_descriptor       (dmc_txc_dma5_descriptor[63:0]),
    .txc_dmc_dma6_getnxtdesc       (txc_dmc_dma6_getnxtdesc),
    .txc_dmc_dma6_inc_head         (txc_dmc_dma6_inc_head),
    .txc_dmc_dma6_reset_done       (txc_dmc_dma6_reset_done),
    .txc_dmc_dma6_mark_bit         (txc_dmc_dma6_mark_bit),
    .txc_dmc_dma6_inc_pkt_cnt      (txc_dmc_dma6_inc_pkt_cnt),
    .dmc_txc_dma6_active           (dmc_txc_dma6_active),
    .dmc_txc_dma6_eoflist          (dmc_txc_dma6_eoflist),
    .dmc_txc_dma6_error            (dmc_txc_dma6_error),
    .dmc_txc_dma6_gotnxtdesc       (dmc_txc_dma6_gotnxtdesc),
    .dmc_txc_dma6_cacheready       (dmc_txc_dma6_cacheready),
    .dmc_txc_dma6_partial          (dmc_txc_dma6_partial),
    .dmc_txc_dma6_reset_scheduled  (dmc_txc_dma6_reset_scheduled),
    .dmc_txc_dma6_page_handle      (dmc_txc_dma6_page_handle[19:0]),
    .dmc_txc_dma6_descriptor       (dmc_txc_dma6_descriptor[63:0]),
    .txc_dmc_dma7_getnxtdesc       (txc_dmc_dma7_getnxtdesc),
    .txc_dmc_dma7_inc_head         (txc_dmc_dma7_inc_head),
    .txc_dmc_dma7_reset_done       (txc_dmc_dma7_reset_done),
    .txc_dmc_dma7_mark_bit         (txc_dmc_dma7_mark_bit),
    .txc_dmc_dma7_inc_pkt_cnt      (txc_dmc_dma7_inc_pkt_cnt),
    .dmc_txc_dma7_active           (dmc_txc_dma7_active),
    .dmc_txc_dma7_eoflist          (dmc_txc_dma7_eoflist),
    .dmc_txc_dma7_error            (dmc_txc_dma7_error),
    .dmc_txc_dma7_gotnxtdesc       (dmc_txc_dma7_gotnxtdesc),
    .dmc_txc_dma7_cacheready       (dmc_txc_dma7_cacheready),
    .dmc_txc_dma7_partial          (dmc_txc_dma7_partial),
    .dmc_txc_dma7_reset_scheduled  (dmc_txc_dma7_reset_scheduled),
    .dmc_txc_dma7_page_handle      (dmc_txc_dma7_page_handle[19:0]),
    .dmc_txc_dma7_descriptor       (dmc_txc_dma7_descriptor[63:0]),
    .txc_dmc_dma8_getnxtdesc       (txc_dmc_dma8_getnxtdesc),
    .txc_dmc_dma8_inc_head         (txc_dmc_dma8_inc_head),
    .txc_dmc_dma8_reset_done       (txc_dmc_dma8_reset_done),
    .txc_dmc_dma8_mark_bit         (txc_dmc_dma8_mark_bit),
    .txc_dmc_dma8_inc_pkt_cnt      (txc_dmc_dma8_inc_pkt_cnt),
    .dmc_txc_dma8_active           (dmc_txc_dma8_active),
    .dmc_txc_dma8_eoflist          (dmc_txc_dma8_eoflist),
    .dmc_txc_dma8_error            (dmc_txc_dma8_error),
    .dmc_txc_dma8_gotnxtdesc       (dmc_txc_dma8_gotnxtdesc),
    .dmc_txc_dma8_cacheready       (dmc_txc_dma8_cacheready),
    .dmc_txc_dma8_partial          (dmc_txc_dma8_partial),
    .dmc_txc_dma8_reset_scheduled  (dmc_txc_dma8_reset_scheduled),
    .dmc_txc_dma8_page_handle      (dmc_txc_dma8_page_handle[19:0]),
    .dmc_txc_dma8_descriptor       (dmc_txc_dma8_descriptor[63:0]),
    .txc_dmc_dma9_getnxtdesc       (txc_dmc_dma9_getnxtdesc),
    .txc_dmc_dma9_inc_head         (txc_dmc_dma9_inc_head),
    .txc_dmc_dma9_reset_done       (txc_dmc_dma9_reset_done),
    .txc_dmc_dma9_mark_bit         (txc_dmc_dma9_mark_bit),
    .txc_dmc_dma9_inc_pkt_cnt      (txc_dmc_dma9_inc_pkt_cnt),
    .dmc_txc_dma9_active           (dmc_txc_dma9_active),
    .dmc_txc_dma9_eoflist          (dmc_txc_dma9_eoflist),
    .dmc_txc_dma9_error            (dmc_txc_dma9_error),
    .dmc_txc_dma9_gotnxtdesc       (dmc_txc_dma9_gotnxtdesc),
    .dmc_txc_dma9_cacheready       (dmc_txc_dma9_cacheready),
    .dmc_txc_dma9_partial          (dmc_txc_dma9_partial),
    .dmc_txc_dma9_reset_scheduled  (dmc_txc_dma9_reset_scheduled),
    .dmc_txc_dma9_page_handle      (dmc_txc_dma9_page_handle[19:0]),
    .dmc_txc_dma9_descriptor       (dmc_txc_dma9_descriptor[63:0]),
    .txc_dmc_dma10_getnxtdesc      (txc_dmc_dma10_getnxtdesc),
    .txc_dmc_dma10_inc_head        (txc_dmc_dma10_inc_head),
    .txc_dmc_dma10_reset_done      (txc_dmc_dma10_reset_done),
    .txc_dmc_dma10_mark_bit        (txc_dmc_dma10_mark_bit),
    .txc_dmc_dma10_inc_pkt_cnt     (txc_dmc_dma10_inc_pkt_cnt),
    .dmc_txc_dma10_active          (dmc_txc_dma10_active),
    .dmc_txc_dma10_eoflist         (dmc_txc_dma10_eoflist),
    .dmc_txc_dma10_error           (dmc_txc_dma10_error),
    .dmc_txc_dma10_gotnxtdesc      (dmc_txc_dma10_gotnxtdesc),
    .dmc_txc_dma10_cacheready      (dmc_txc_dma10_cacheready),
    .dmc_txc_dma10_partial         (dmc_txc_dma10_partial),
    .dmc_txc_dma10_reset_scheduled (dmc_txc_dma10_reset_scheduled),
    .dmc_txc_dma10_page_handle     (dmc_txc_dma10_page_handle[19:0]),
    .dmc_txc_dma10_descriptor      (dmc_txc_dma10_descriptor[63:0]),
    .txc_dmc_dma11_getnxtdesc      (txc_dmc_dma11_getnxtdesc),
    .txc_dmc_dma11_inc_head        (txc_dmc_dma11_inc_head),
    .txc_dmc_dma11_reset_done      (txc_dmc_dma11_reset_done),
    .txc_dmc_dma11_mark_bit        (txc_dmc_dma11_mark_bit),
    .txc_dmc_dma11_inc_pkt_cnt     (txc_dmc_dma11_inc_pkt_cnt),
    .dmc_txc_dma11_active          (dmc_txc_dma11_active),
    .dmc_txc_dma11_eoflist         (dmc_txc_dma11_eoflist),
    .dmc_txc_dma11_error           (dmc_txc_dma11_error),
    .dmc_txc_dma11_gotnxtdesc      (dmc_txc_dma11_gotnxtdesc),
    .dmc_txc_dma11_cacheready      (dmc_txc_dma11_cacheready),
    .dmc_txc_dma11_partial         (dmc_txc_dma11_partial),
    .dmc_txc_dma11_reset_scheduled (dmc_txc_dma11_reset_scheduled),
    .dmc_txc_dma11_page_handle     (dmc_txc_dma11_page_handle[19:0]),
    .dmc_txc_dma11_descriptor      (dmc_txc_dma11_descriptor[63:0]),
    .txc_dmc_dma12_getnxtdesc      (txc_dmc_dma12_getnxtdesc),
    .txc_dmc_dma12_inc_head        (txc_dmc_dma12_inc_head),
    .txc_dmc_dma12_reset_done      (txc_dmc_dma12_reset_done),
    .txc_dmc_dma12_mark_bit        (txc_dmc_dma12_mark_bit),
    .txc_dmc_dma12_inc_pkt_cnt     (txc_dmc_dma12_inc_pkt_cnt),
    .dmc_txc_dma12_active          (dmc_txc_dma12_active),
    .dmc_txc_dma12_eoflist         (dmc_txc_dma12_eoflist),
    .dmc_txc_dma12_error           (dmc_txc_dma12_error),
    .dmc_txc_dma12_gotnxtdesc      (dmc_txc_dma12_gotnxtdesc),
    .dmc_txc_dma12_cacheready      (dmc_txc_dma12_cacheready),
    .dmc_txc_dma12_partial         (dmc_txc_dma12_partial),
    .dmc_txc_dma12_reset_scheduled (dmc_txc_dma12_reset_scheduled),
    .dmc_txc_dma12_page_handle     (dmc_txc_dma12_page_handle[19:0]),
    .dmc_txc_dma12_descriptor      (dmc_txc_dma12_descriptor[63:0]),
    .txc_dmc_dma13_getnxtdesc      (txc_dmc_dma13_getnxtdesc),
    .txc_dmc_dma13_inc_head        (txc_dmc_dma13_inc_head),
    .txc_dmc_dma13_reset_done      (txc_dmc_dma13_reset_done),
    .txc_dmc_dma13_mark_bit        (txc_dmc_dma13_mark_bit),
    .txc_dmc_dma13_inc_pkt_cnt     (txc_dmc_dma13_inc_pkt_cnt),
    .dmc_txc_dma13_active          (dmc_txc_dma13_active),
    .dmc_txc_dma13_eoflist         (dmc_txc_dma13_eoflist),
    .dmc_txc_dma13_error           (dmc_txc_dma13_error),
    .dmc_txc_dma13_gotnxtdesc      (dmc_txc_dma13_gotnxtdesc),
    .dmc_txc_dma13_cacheready      (dmc_txc_dma13_cacheready),
    .dmc_txc_dma13_partial         (dmc_txc_dma13_partial),
    .dmc_txc_dma13_reset_scheduled (dmc_txc_dma13_reset_scheduled),
    .dmc_txc_dma13_page_handle     (dmc_txc_dma13_page_handle[19:0]),
    .dmc_txc_dma13_descriptor      (dmc_txc_dma13_descriptor[63:0]),
    .txc_dmc_dma14_getnxtdesc      (txc_dmc_dma14_getnxtdesc),
    .txc_dmc_dma14_inc_head        (txc_dmc_dma14_inc_head),
    .txc_dmc_dma14_reset_done      (txc_dmc_dma14_reset_done),
    .txc_dmc_dma14_mark_bit        (txc_dmc_dma14_mark_bit),
    .txc_dmc_dma14_inc_pkt_cnt     (txc_dmc_dma14_inc_pkt_cnt),
    .dmc_txc_dma14_active          (dmc_txc_dma14_active),
    .dmc_txc_dma14_eoflist         (dmc_txc_dma14_eoflist),
    .dmc_txc_dma14_error           (dmc_txc_dma14_error),
    .dmc_txc_dma14_gotnxtdesc      (dmc_txc_dma14_gotnxtdesc),
    .dmc_txc_dma14_cacheready      (dmc_txc_dma14_cacheready),
    .dmc_txc_dma14_partial         (dmc_txc_dma14_partial),
    .dmc_txc_dma14_reset_scheduled (dmc_txc_dma14_reset_scheduled),
    .dmc_txc_dma14_page_handle     (dmc_txc_dma14_page_handle[19:0]),
    .dmc_txc_dma14_descriptor      (dmc_txc_dma14_descriptor[63:0]),
    .txc_dmc_dma15_getnxtdesc      (txc_dmc_dma15_getnxtdesc),
    .txc_dmc_dma15_inc_head        (txc_dmc_dma15_inc_head),
    .txc_dmc_dma15_reset_done      (txc_dmc_dma15_reset_done),
    .txc_dmc_dma15_mark_bit        (txc_dmc_dma15_mark_bit),
    .txc_dmc_dma15_inc_pkt_cnt     (txc_dmc_dma15_inc_pkt_cnt),
    .dmc_txc_dma15_active          (dmc_txc_dma15_active),
    .dmc_txc_dma15_eoflist         (dmc_txc_dma15_eoflist),
    .dmc_txc_dma15_error           (dmc_txc_dma15_error),
    .dmc_txc_dma15_gotnxtdesc      (dmc_txc_dma15_gotnxtdesc),
    .dmc_txc_dma15_cacheready      (dmc_txc_dma15_cacheready),
    .dmc_txc_dma15_partial         (dmc_txc_dma15_partial),
    .dmc_txc_dma15_reset_scheduled (dmc_txc_dma15_reset_scheduled),
    .dmc_txc_dma15_page_handle     (dmc_txc_dma15_page_handle[19:0]),
    .dmc_txc_dma15_descriptor      (dmc_txc_dma15_descriptor[63:0]),
    .dmc_txc_dma0_func_num         (dmc_txc_dma0_func_num[1:0]),
    .dmc_txc_dma1_func_num         (dmc_txc_dma1_func_num[1:0]),
    .dmc_txc_dma2_func_num         (dmc_txc_dma2_func_num[1:0]),
    .dmc_txc_dma3_func_num         (dmc_txc_dma3_func_num[1:0]),
    .dmc_txc_dma4_func_num         (dmc_txc_dma4_func_num[1:0]),
    .dmc_txc_dma5_func_num         (dmc_txc_dma5_func_num[1:0]),
    .dmc_txc_dma6_func_num         (dmc_txc_dma6_func_num[1:0]),
    .dmc_txc_dma7_func_num         (dmc_txc_dma7_func_num[1:0]),
    .dmc_txc_dma8_func_num         (dmc_txc_dma8_func_num[1:0]),
    .dmc_txc_dma9_func_num         (dmc_txc_dma9_func_num[1:0]),
    .dmc_txc_dma10_func_num        (dmc_txc_dma10_func_num[1:0]),
    .dmc_txc_dma11_func_num        (dmc_txc_dma11_func_num[1:0]),
    .dmc_txc_dma12_func_num        (dmc_txc_dma12_func_num[1:0]),
    .dmc_txc_dma13_func_num        (dmc_txc_dma13_func_num[1:0]),
    .dmc_txc_dma14_func_num        (dmc_txc_dma14_func_num[1:0]),
    .dmc_txc_dma15_func_num        (dmc_txc_dma15_func_num[1:0]),
    .dmc_txc_tx_addr_md            (dmc_txc_tx_addr_md),
    .txc_dmc_dma_nack_pkt_rd       (txc_dmc_dma_nack_pkt_rd[15:0]),
    .txc_dmc_nack_pkt_rd_addr      (txc_dmc_nack_pkt_rd_addr[43:0]),
    .txc_dmc_nack_pkt_rd           (txc_dmc_nack_pkt_rd),
    .txc_dmc_p0_dma_pkt_size_err   (txc_dmc_p0_dma_pkt_size_err[15:0]),
    .txc_dmc_p0_pkt_size_err_addr  (txc_dmc_p0_pkt_size_err_addr[43:0]),
    .txc_dmc_p0_pkt_size_err       (txc_dmc_p0_pkt_size_err),
    .txc_dmc_p1_dma_pkt_size_err   (txc_dmc_p1_dma_pkt_size_err[15:0]),
    .txc_dmc_p1_pkt_size_err_addr  (txc_dmc_p1_pkt_size_err_addr[43:0]),
    .txc_dmc_p1_pkt_size_err       (txc_dmc_p1_pkt_size_err)
    );

tds_n2_efuhdr2_ctl tdmc_sram_header (
    .efu_hdr_write_data (efu_niu_ram_data),
    .efu_hdr_xfer_en    (efu_niu_ram_xfer_en),
    .efu_hdr_clr        (efu_niu_ram_clr),
    .hdr_efu_read_data  (niu_efu_ram_data),
    .hdr_efu_xfer_en    (niu_efu_ram_xfer_en),
    .hdr_sram_rvalue    ({unconnected_1[10:7], hdr_sram_rvalue_tdmc[6:0]}),
    .hdr_sram_rid       ({unconnected_2[10:2], hdr_sram_rid_tdmc[1:0]}),
    .hdr_sram_wr_en     (hdr_sram_wr_en_tdmc),
    .hdr_sram_red_clr   (hdr_sram_red_clr_tdmc),
    .sram_hdr_read_data ({4'b0, sram_hdr_read_data_tdmc[6:0]}),
    .reset_l            (niu_reset_l),
    .l2clk              (l1clk),
    .tcu_pce_ov         (tds_pce_ov),
    .tcu_aclk           (aclk),
    .tcu_bclk           (bclk),
    .tcu_scan_en        (tcu_scan_en),
    .tcu_clk_stop       (tcu_tds_io_clk_stop),
    .scan_in            (io2xclk_scan_out),
    .scan_out           ()
    );

dmo_regs dmo_regs (
    .niu_clk (l1clk),
    .dmo_in  (tds_tcu_dmo_data_out[39:0]),
    .dmo_out (tds_tcu_dmo_dout[39:0])
    );

clkgen_tds_io2x clkgen2x_tds (
    .l2clk                (io2xl2clk),
    .aclk                 (),
    .bclk                 (),
    .scan_out             (io2xclk_scan_out),
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
    .tcu_clk_stop         (tcu_tds_io_clk_stop),
    .tcu_pce_ov           (tds_pce_ov),
    .rst_wmr_protect      (1'b0),
    .rst_wmr_             (1'b1),
    .rst_por_             (rst_por_),
    .ccu_cmp_slow_sync_en (1'b0),
    .ccu_slow_cmp_sync_en (1'b0),
    .tcu_div_bypass       (tcu_div_bypass),
    .ccu_div_ph           (gl_tds_io2x_out),
    .cluster_div_en       (1'b1),
    .gclk                 (cmp_gclk_c0_tds),
    .cluster_arst_l       (cluster_arst_l),
    .ccu_serdes_dtm       (1'b0),
    .clk_ext              (1'b0),
    .scan_en              (tcu_scan_en),
    .scan_in              (ioclk_scan_out),
    .tcu_aclk             (aclk),
    .tcu_bclk             (bclk)
    );

tds_l2l1clk_io clkgen_tds (
    .array_wr_inhibit (tds_array_wr_inhibit),
    .l1clk            (l1clk),
    .iol2clk          (iol2clk),
    .aclk             (aclk),
    .bclk             (bclk),
    .scan_out         (ioclk_scan_out),
    .aclk_wmr         (),
    .pce_ov           (tds_pce_ov),
    .wmr_protect      (),
    .wmr_             (),
    .por_             (niu_reset_l),
    .cmp_slow_sync_en (),
    .slow_cmp_sync_en (),
    .tcu_atpg_mode    (tcu_atpg_mode),
    .tcu_wr_inhibit   (tcu_wr_inhibit),
    .tcu_clk_stop     (tcu_tds_io_clk_stop),
    .tcu_pce_ov       (tcu_pce_ov),
    .rst_wmr_protect  (1'b0),
    .rst_wmr_         (1'b1),
    .rst_por_         (rst_por_),
    .tcu_div_bypass   (tcu_div_bypass),
    .ccu_div_ph       (gl_tds_io_out),
    .cluster_div_en   (1'b1),
    .gclk             (cmp_gclk_c0_tds),
    .cluster_arst_l   (cluster_arst_l),
    .scan_en          (tcu_scan_en),
    .scan_in          (scan_in),
    .tcu_aclk         (tcu_aclk),
    .tcu_bclk         (tcu_bclk)
    );
// VPERL: GENERATED_END

assign meta_dmc_data[127:0]           = x_meta1_rdmc_rbr_resp_data[127:0];
assign meta_dmc_resp_byteenable[15:0] = x_meta1_rdmc_rbr_resp_byteenable[15:0];
assign meta_dmc_resp_cmd[7:0]         = x_meta1_rdmc_rbr_resp_cmd[7:0];
assign meta_dmc_resp_cmd_status[3:0]  = x_meta1_rdmc_rbr_resp_cmd_status[3:0];
assign meta_dmc_resp_dma_num[4:0]     = x_meta1_rdmc_rbr_resp_dma_num[4:0];
assign meta_dmc_resp_ready            = x_meta1_rdmc_rbr_resp_ready;

assign meta1_rdmc_rbr_resp_data[127:0]      = x_meta1_rdmc_rbr_resp_data[127:0];
assign meta1_rdmc_rbr_resp_byteenable[15:0] = x_meta1_rdmc_rbr_resp_byteenable[15:0];
assign meta1_rdmc_rbr_resp_cmd[7:0]         = x_meta1_rdmc_rbr_resp_cmd[7:0];
assign meta1_rdmc_rbr_resp_cmd_status[3:0]  = x_meta1_rdmc_rbr_resp_cmd_status[3:0];
assign meta1_rdmc_rbr_resp_dma_num[4:0]     = x_meta1_rdmc_rbr_resp_dma_num[4:0];
assign meta1_rdmc_rbr_resp_ready            = x_meta1_rdmc_rbr_resp_ready;

endmodule

