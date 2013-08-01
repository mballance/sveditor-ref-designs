// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: cpu.v
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
module cpu (
  L2T_VNW, 
  SPC_VNW, 
  L2D_VNW0, 
  L2D_VNW1, 
  FBDIMM0A_TX_P, 
  FBDIMM0A_TX_N, 
  FBDIMM0A_RX_P, 
  FBDIMM0A_RX_N, 
  FBDIMM0A_AMUX, 
  FBDIMM0B_TX_P, 
  FBDIMM0B_TX_N, 
  FBDIMM0B_RX_P, 
  FBDIMM0B_RX_N, 
  FBDIMM0B_AMUX, 
  FBDIMM1A_TX_P, 
  FBDIMM1A_TX_N, 
  FBDIMM1A_RX_P, 
  FBDIMM1A_RX_N, 
  FBDIMM1A_AMUX, 
  FBDIMM1B_TX_P, 
  FBDIMM1B_TX_N, 
  FBDIMM1B_RX_P, 
  FBDIMM1B_RX_N, 
  FBDIMM1B_AMUX, 
  FBDIMM2A_TX_P, 
  FBDIMM2A_TX_N, 
  FBDIMM2A_RX_P, 
  FBDIMM2A_RX_N, 
  FBDIMM2A_AMUX, 
  FBDIMM2B_TX_P, 
  FBDIMM2B_TX_N, 
  FBDIMM2B_RX_P, 
  FBDIMM2B_RX_N, 
  FBDIMM2B_AMUX, 
  FBDIMM3A_TX_P, 
  FBDIMM3A_TX_N, 
  FBDIMM3A_RX_P, 
  FBDIMM3A_RX_N, 
  FBDIMM3A_AMUX, 
  FBDIMM3B_TX_P, 
  FBDIMM3B_TX_N, 
  FBDIMM3B_RX_P, 
  FBDIMM3B_RX_N, 
  FBDIMM3B_AMUX, 
  FBDIMM1_REFCLK_P, 
  FBDIMM1_REFCLK_N, 
  FBDIMM2_REFCLK_P, 
  FBDIMM2_REFCLK_N, 
  FBDIMM3_REFCLK_P, 
  FBDIMM3_REFCLK_N, 
  VDDA_FSRL, 
  VDDD_FSRL, 
  VDDR_FSRL, 
  VDDT_FSRL, 
  VSSA_FSRL, 
  VDDA_FSRR, 
  VDDD_FSRR, 
  VDDR_FSRR, 
  VDDT_FSRR, 
  VSSA_FSRR, 
  VDDA_FSRB, 
  VDDD_FSRB, 
  VDDR_FSRB, 
  VDDT_FSRB, 
  VSSA_FSRB, 
  PEX_TX_P, 
  PEX_TX_N, 
  PEX_RX_P, 
  PEX_RX_N, 
  PEX_REFCLK_P, 
  PEX_REFCLK_N, 
  PEX_AMUX, 
  VDDT_PSR, 
  VDDD_PSR, 
  VDDC_PSR, 
  VDDA_PSR, 
  VDDR_PSR, 
  VSSA_PSR, 
  STCIQ, 
  TESTCLKT, 
  TESTCLKR, 
  STCID, 
  PLL_CMP_BYPASS, 
  STCICFG, 
  STCICLK, 
  PGRM_EN, 
  VDDO_PCM, 
`ifndef FC_NO_NIU_T2
  XAUI0_AMUX, 
  XAUI0_TX_N, 
  XAUI0_TX_P, 
  XAUI0_REFCLK_N, 
  XAUI0_REFCLK_P, 
  XAUI0_RX_N, 
  XAUI0_RX_P, 
  XAUI1_AMUX, 
  XAUI1_TX_N, 
  XAUI1_TX_P, 
  XAUI1_RX_N, 
  XAUI1_RX_P, 
  XAUI0_LINK_LED, 
  XAUI1_LINK_LED, 
  XAUI0_ACT_LED, 
  XAUI1_ACT_LED, 
  XAUI_MDC, 
  XAUI_MDIO, 
  XAUI_MDINT1_L, 
  XAUI_MDINT0_L, 
  VDDT_ESR, 
  VDDA_ESR, 
  VDDD_ESR, 
  VDDR_ESR, 
  VSSA_ESR, 
`endif
  PLL_CMP_CLK_P, 
  PLL_CMP_CLK_N, 
  DIODE_TOP, 
  DIODE_BOT, 
  VDD_PLL_CMP_REG, 
  VDD_RNG_HV, 
  VDD_SENSE, 
  VSS_SENSE, 
  RNG_ANLG_CHAR_OUT, 
  PWRON_RST_L, 
  BUTTON_XIR_L, 
  PB_RST_L, 
  PEX_RESET_L, 
  SSI_SYNC_L, 
  VPP, 
  TMS, 
  TDI, 
  TRST_L, 
  TCK, 
  TESTMODE, 
  TDO, 
  DIVIDER_BYPASS, 
  DBG_DQ, 
  DBG_CK0, 
  TRIGIN, 
  TRIGOUT, 
  SSI_MISO, 
  SSI_EXT_INT_L, 
  SSI_SCK, 
  SSI_MOSI, 
  PMI, 
  VREG_SELBG_L, 
  PLL_CHAR_OUT, 
  PLL_TESTMODE, 
  PWR_THRTTL_0, 
  PWR_THRTTL_1, 
  PMO, 
  BURNIN);
wire arb_pio_all_npwdirty;
wire arb_pio_all_rddirty;
wire [5:0] arb_pio_dirtid_npwstatus;
wire [5:0] arb_pio_dirtid_rdstatus;
wire cluster_arst_l;
wire cmp_gclk_c0_rdp;
wire efu_niu_ram0_clr;
wire efu_niu_ram0_xfer_en;
wire efu_niu_ram1_clr;
wire efu_niu_ram1_xfer_en;
wire efu_niu_ram_data;
wire [31:0] fflp_debug_port;
wire fflp_pio_ack;
wire fflp_pio_err;
wire fflp_pio_intr;
wire [63:0] fflp_pio_rdata;
wire gl_io2x_out_c1b;
wire gl_io_out_c1b;
wire [31:0] ipp_debug_port;
wire ipp_dmc_dat_ack0;
wire ipp_dmc_dat_ack1;
wire ipp_dmc_dat_err0;
wire ipp_dmc_dat_err1;
wire [129:0] ipp_dmc_data0;
wire [129:0] ipp_dmc_data1;
wire ipp_dmc_ful_pkt0;
wire ipp_dmc_ful_pkt1;
wire ipp_pio_ack;
wire ipp_pio_err;
wire ipp_pio_intr;
wire [63:0] ipp_pio_rdata;
wire [31:0] mac_debug_port;
wire mac_pio_ack;
wire mac_pio_err;
wire mac_pio_intr0;
wire mac_pio_intr1;
wire [63:0] mac_pio_rdata;
wire meta_dmc_ack_client_rdmc;
wire [7:0] meta_dmc_ack_cmd;
wire [3:0] meta_dmc_ack_cmd_status;
wire [4:0] meta_dmc_ack_dma_num;
wire meta_dmc_ack_ready;
wire arb0_rcr_data_req;
wire arb0_rcr_req_accept;
wire arb0_rdc_data_req;
wire arb0_rdc_req_accept;
wire arb1_rbr_req_accept;
wire arb1_rbr_req_errors;
wire [15:0] meta1_rdmc_rbr_resp_byteenable;
wire meta_dmc_resp_client_rdmc;
wire [7:0] meta1_rdmc_rbr_resp_cmd;
wire [3:0] meta1_rdmc_rbr_resp_cmd_status;
wire meta_dmc_resp_complete_rdmc;
wire [127:0] meta1_rdmc_rbr_resp_data;
wire [3:0] meta_dmc_data_status;
wire meta_dmc_data_valid_rdmc;
wire [4:0] meta1_rdmc_rbr_resp_dma_num;
wire meta1_rdmc_rbr_resp_ready;
wire meta_dmc_resp_transfer_cmpl_rdmc;
wire [31:0] meta_arb_debug_port;
wire mif_pio_intr;
wire [31:0] ncu_niu_data;
wire ncu_niu_stall;
wire ncu_niu_vld;
wire rdp_rdmc_mbist_scan_in;
wire gl_rst_niu_wmr_c1b;
wire [31:0] smx_debug_port;
wire smx_pio_intr;
wire [31:0] smx_pio_status;
wire tcu_asic_aclk;
wire tcu_asic_bclk;
wire tcu_div_bypass;
wire tcu_mbist_bisi_en;
wire tcu_mbist_user_mode;
wire tcu_pce_ov;
wire tcu_rdp_rdmc_mbist_start;
wire tcu_asic_scan_en;
wire tcu_asic_se_scancollar_in;
wire tcu_asic_se_scancollar_out;
wire [31:0] tdmc_debug_port;
wire tdmc_pio_ack;
wire tdmc_pio_err;
wire [63:0] tdmc_pio_rdata;
wire [31:0] txc_debug_port;
wire txc_pio_ack;
wire txc_pio_err;
wire niu_txc_interrupts;
wire [63:0] txc_pio_rdata;
wire [31:0] zcp_debug_port;
wire zcp_dmc_ack0;
wire zcp_dmc_ack1;
wire [129:0] zcp_dmc_dat0;
wire [129:0] zcp_dmc_dat1;
wire zcp_dmc_dat_err0;
wire zcp_dmc_dat_err1;
wire zcp_dmc_ful_pkt0;
wire zcp_dmc_ful_pkt1;
wire zcp_pio_ack;
wire zcp_pio_err;
wire zcp_pio_intr;
wire [63:0] zcp_pio_rdata;
wire dmc_ipp_dat_req0;
wire dmc_ipp_dat_req1;
wire dmc_zcp_req0;
wire dmc_zcp_req1;
wire mac_reset0;
wire mac_reset1;
wire niu_efu_ram0_xfer_en;
wire niu_efu_ram1_xfer_en;
wire [31:0] niu_ncu_data;
wire niu_ncu_stall;
wire niu_ncu_vld;
wire [31:0] pio_arb_ctrl;
wire [31:0] pio_arb_debug_vector;
wire pio_arb_dirtid_clr;
wire pio_arb_dirtid_enable;
wire [5:0] pio_arb_np_threshold;
wire [5:0] pio_arb_rd_threshold;
wire pio_fflp_sel;
wire pio_ipp_sel;
wire pio_mac_sel;
wire [31:0] pio_smx_cfg_data;
wire pio_smx_clear_intr;
wire [31:0] pio_smx_ctrl;
wire [31:0] pio_smx_debug_vector;
wire pio_tdmc_sel;
wire pio_txc_sel;
wire pio_zcp_sel;
wire rdmc_meta_ack_accept;
wire [127:0] rcr_arb0_data;
wire rcr_arb0_data_valid;
wire rcr_arb0_req;
wire [63:0] rcr_arb0_req_address;
wire [15:0] rcr_arb0_req_byteenable;
wire [7:0] rcr_arb0_req_cmd;
wire [4:0] rcr_arb0_req_dma_num;
wire [1:0] rcr_arb0_req_func_num;
wire [13:0] rcr_arb0_req_length;
wire [1:0] rcr_arb0_req_port_num;
wire [3:0] rcr_arb0_status;
wire rcr_arb0_transfer_complete;
wire [127:0] rdc_arb0_data;
wire rdc_arb0_data_valid;
wire rdc_arb0_req;
wire [63:0] rdc_arb0_req_address;
wire [15:0] rdc_arb0_req_byteenable;
wire [7:0] rdc_arb0_req_cmd;
wire [4:0] rdc_arb0_req_dma_num;
wire [1:0] rdc_arb0_req_func_num;
wire [13:0] rdc_arb0_req_length;
wire [1:0] rdc_arb0_req_port_num;
wire [3:0] rdc_arb0_status;
wire rdc_arb0_transfer_complete;
wire rbr_arb1_req;
wire [63:0] rbr_arb1_req_address;
wire [7:0] rbr_arb1_req_cmd;
wire [4:0] rbr_arb1_req_dma_num;
wire [1:0] rbr_arb1_req_func_num;
wire [13:0] rbr_arb1_req_length;
wire [1:0] rbr_arb1_req_port_num;
wire rdmc_meta_resp_accept;
wire rdp_rdmc_mbist_scan_out;
wire rdp_rdmc_tcu_mbist_done;
wire rdp_rdmc_tcu_mbist_fail;
wire [39:0] rdp_tcu_dmo_dout;
wire tcu_asic_array_wr_inhibit;
wire tcu_soce_scan_out;
wire rdp_scan_out;
wire [63:0] pio_clients_wdata;
wire [19:0] pio_clients_addr;
wire pio_clients_rd;
wire [4:0] dbg1_niu_dbg_sel;
wire [1:0] niu_mio_debug_clock;
wire [31:0] niu_mio_debug_data;
wire niu_efu_ram0_data;
wire niu_efu_ram1_data;
wire gl_rdp_io_clk_stop;
wire [63:0] tdmc_pio_intr;
wire cmp_gclk_c0_tds;
wire dbg1_niu_resume;
wire dbg1_niu_stall;
wire efu_niu_ram_clr;
wire efu_niu_ram_xfer_en;
wire ncu_niu_ctag_cei;
wire ncu_niu_ctag_uei;
wire ncu_niu_d_pei;
wire tcu_soc4_scan_out;
wire sii_niu_bqdq;
wire sii_niu_oqdq;
wire [127:0] sio_niu_data;
wire sio_niu_datareq;
wire sio_niu_hdr_vld;
wire [7:0] sio_niu_parity;
wire gl_tds_io_clk_stop;
wire tcu_tds_smx_mbist_start;
wire tcu_tds_tdmc_mbist_start;
wire tds_mbist_scan_in;
wire txc_arb1_req;
wire [63:0] txc_arb1_req_address;
wire [7:0] txc_arb1_req_cmd;
wire [4:0] txc_arb1_req_dma_num;
wire [1:0] txc_arb1_req_func_num;
wire [13:0] txc_arb1_req_length;
wire [1:0] txc_arb1_req_port_num;
wire txc_dmc_dma0_getnxtdesc;
wire txc_dmc_dma0_inc_head;
wire txc_dmc_dma0_inc_pkt_cnt;
wire txc_dmc_dma0_mark_bit;
wire txc_dmc_dma0_reset_done;
wire txc_dmc_dma10_getnxtdesc;
wire txc_dmc_dma10_inc_head;
wire txc_dmc_dma10_inc_pkt_cnt;
wire txc_dmc_dma10_mark_bit;
wire txc_dmc_dma10_reset_done;
wire txc_dmc_dma11_getnxtdesc;
wire txc_dmc_dma11_inc_head;
wire txc_dmc_dma11_inc_pkt_cnt;
wire txc_dmc_dma11_mark_bit;
wire txc_dmc_dma11_reset_done;
wire txc_dmc_dma12_getnxtdesc;
wire txc_dmc_dma12_inc_head;
wire txc_dmc_dma12_inc_pkt_cnt;
wire txc_dmc_dma12_mark_bit;
wire txc_dmc_dma12_reset_done;
wire txc_dmc_dma13_getnxtdesc;
wire txc_dmc_dma13_inc_head;
wire txc_dmc_dma13_inc_pkt_cnt;
wire txc_dmc_dma13_mark_bit;
wire txc_dmc_dma13_reset_done;
wire txc_dmc_dma14_getnxtdesc;
wire txc_dmc_dma14_inc_head;
wire txc_dmc_dma14_inc_pkt_cnt;
wire txc_dmc_dma14_mark_bit;
wire txc_dmc_dma14_reset_done;
wire txc_dmc_dma15_getnxtdesc;
wire txc_dmc_dma15_inc_head;
wire txc_dmc_dma15_inc_pkt_cnt;
wire txc_dmc_dma15_mark_bit;
wire txc_dmc_dma15_reset_done;
wire txc_dmc_dma1_getnxtdesc;
wire txc_dmc_dma1_inc_head;
wire txc_dmc_dma1_inc_pkt_cnt;
wire txc_dmc_dma1_mark_bit;
wire txc_dmc_dma1_reset_done;
wire txc_dmc_dma2_getnxtdesc;
wire txc_dmc_dma2_inc_head;
wire txc_dmc_dma2_inc_pkt_cnt;
wire txc_dmc_dma2_mark_bit;
wire txc_dmc_dma2_reset_done;
wire txc_dmc_dma3_getnxtdesc;
wire txc_dmc_dma3_inc_head;
wire txc_dmc_dma3_inc_pkt_cnt;
wire txc_dmc_dma3_mark_bit;
wire txc_dmc_dma3_reset_done;
wire txc_dmc_dma4_getnxtdesc;
wire txc_dmc_dma4_inc_head;
wire txc_dmc_dma4_inc_pkt_cnt;
wire txc_dmc_dma4_mark_bit;
wire txc_dmc_dma4_reset_done;
wire txc_dmc_dma5_getnxtdesc;
wire txc_dmc_dma5_inc_head;
wire txc_dmc_dma5_inc_pkt_cnt;
wire txc_dmc_dma5_mark_bit;
wire txc_dmc_dma5_reset_done;
wire txc_dmc_dma6_getnxtdesc;
wire txc_dmc_dma6_inc_head;
wire txc_dmc_dma6_inc_pkt_cnt;
wire txc_dmc_dma6_mark_bit;
wire txc_dmc_dma6_reset_done;
wire txc_dmc_dma7_getnxtdesc;
wire txc_dmc_dma7_inc_head;
wire txc_dmc_dma7_inc_pkt_cnt;
wire txc_dmc_dma7_mark_bit;
wire txc_dmc_dma7_reset_done;
wire txc_dmc_dma8_getnxtdesc;
wire txc_dmc_dma8_inc_head;
wire txc_dmc_dma8_inc_pkt_cnt;
wire txc_dmc_dma8_mark_bit;
wire txc_dmc_dma8_reset_done;
wire txc_dmc_dma9_getnxtdesc;
wire txc_dmc_dma9_inc_head;
wire txc_dmc_dma9_inc_pkt_cnt;
wire txc_dmc_dma9_mark_bit;
wire txc_dmc_dma9_reset_done;
wire [15:0] txc_dmc_dma_nack_pkt_rd;
wire txc_dmc_nack_pkt_rd;
wire [43:0] txc_dmc_nack_pkt_rd_addr;
wire [15:0] txc_dmc_p0_dma_pkt_size_err;
wire txc_dmc_p0_pkt_size_err;
wire [43:0] txc_dmc_p0_pkt_size_err_addr;
wire [15:0] txc_dmc_p1_dma_pkt_size_err;
wire txc_dmc_p1_pkt_size_err;
wire [43:0] txc_dmc_p1_pkt_size_err_addr;
wire txc_meta_resp_accept;
wire arb1_txc_req_accept;
wire [5:0] dmc_meta1_req_trans_id;
wire dmc_txc_dma0_active;
wire dmc_txc_dma0_cacheready;
wire [63:0] dmc_txc_dma0_descriptor;
wire dmc_txc_dma0_eoflist;
wire dmc_txc_dma0_error;
wire [1:0] dmc_txc_dma0_func_num;
wire dmc_txc_dma0_gotnxtdesc;
wire [19:0] dmc_txc_dma0_page_handle;
wire dmc_txc_dma0_partial;
wire dmc_txc_dma0_reset_scheduled;
wire dmc_txc_dma10_active;
wire dmc_txc_dma10_cacheready;
wire [63:0] dmc_txc_dma10_descriptor;
wire dmc_txc_dma10_eoflist;
wire dmc_txc_dma10_error;
wire [1:0] dmc_txc_dma10_func_num;
wire dmc_txc_dma10_gotnxtdesc;
wire [19:0] dmc_txc_dma10_page_handle;
wire dmc_txc_dma10_partial;
wire dmc_txc_dma10_reset_scheduled;
wire dmc_txc_dma11_active;
wire dmc_txc_dma11_cacheready;
wire [63:0] dmc_txc_dma11_descriptor;
wire dmc_txc_dma11_eoflist;
wire dmc_txc_dma11_error;
wire [1:0] dmc_txc_dma11_func_num;
wire dmc_txc_dma11_gotnxtdesc;
wire [19:0] dmc_txc_dma11_page_handle;
wire dmc_txc_dma11_partial;
wire dmc_txc_dma11_reset_scheduled;
wire dmc_txc_dma12_active;
wire dmc_txc_dma12_cacheready;
wire [63:0] dmc_txc_dma12_descriptor;
wire dmc_txc_dma12_eoflist;
wire dmc_txc_dma12_error;
wire [1:0] dmc_txc_dma12_func_num;
wire dmc_txc_dma12_gotnxtdesc;
wire [19:0] dmc_txc_dma12_page_handle;
wire dmc_txc_dma12_partial;
wire dmc_txc_dma12_reset_scheduled;
wire dmc_txc_dma13_active;
wire dmc_txc_dma13_cacheready;
wire [63:0] dmc_txc_dma13_descriptor;
wire dmc_txc_dma13_eoflist;
wire dmc_txc_dma13_error;
wire [1:0] dmc_txc_dma13_func_num;
wire dmc_txc_dma13_gotnxtdesc;
wire [19:0] dmc_txc_dma13_page_handle;
wire dmc_txc_dma13_partial;
wire dmc_txc_dma13_reset_scheduled;
wire dmc_txc_dma14_active;
wire dmc_txc_dma14_cacheready;
wire [63:0] dmc_txc_dma14_descriptor;
wire dmc_txc_dma14_eoflist;
wire dmc_txc_dma14_error;
wire [1:0] dmc_txc_dma14_func_num;
wire dmc_txc_dma14_gotnxtdesc;
wire [19:0] dmc_txc_dma14_page_handle;
wire dmc_txc_dma14_partial;
wire dmc_txc_dma14_reset_scheduled;
wire dmc_txc_dma15_active;
wire dmc_txc_dma15_cacheready;
wire [63:0] dmc_txc_dma15_descriptor;
wire dmc_txc_dma15_eoflist;
wire dmc_txc_dma15_error;
wire [1:0] dmc_txc_dma15_func_num;
wire dmc_txc_dma15_gotnxtdesc;
wire [19:0] dmc_txc_dma15_page_handle;
wire dmc_txc_dma15_partial;
wire dmc_txc_dma15_reset_scheduled;
wire dmc_txc_dma1_active;
wire dmc_txc_dma1_cacheready;
wire [63:0] dmc_txc_dma1_descriptor;
wire dmc_txc_dma1_eoflist;
wire dmc_txc_dma1_error;
wire [1:0] dmc_txc_dma1_func_num;
wire dmc_txc_dma1_gotnxtdesc;
wire [19:0] dmc_txc_dma1_page_handle;
wire dmc_txc_dma1_partial;
wire dmc_txc_dma1_reset_scheduled;
wire dmc_txc_dma2_active;
wire dmc_txc_dma2_cacheready;
wire [63:0] dmc_txc_dma2_descriptor;
wire dmc_txc_dma2_eoflist;
wire dmc_txc_dma2_error;
wire [1:0] dmc_txc_dma2_func_num;
wire dmc_txc_dma2_gotnxtdesc;
wire [19:0] dmc_txc_dma2_page_handle;
wire dmc_txc_dma2_partial;
wire dmc_txc_dma2_reset_scheduled;
wire dmc_txc_dma3_active;
wire dmc_txc_dma3_cacheready;
wire [63:0] dmc_txc_dma3_descriptor;
wire dmc_txc_dma3_eoflist;
wire dmc_txc_dma3_error;
wire [1:0] dmc_txc_dma3_func_num;
wire dmc_txc_dma3_gotnxtdesc;
wire [19:0] dmc_txc_dma3_page_handle;
wire dmc_txc_dma3_partial;
wire dmc_txc_dma3_reset_scheduled;
wire dmc_txc_dma4_active;
wire dmc_txc_dma4_cacheready;
wire [63:0] dmc_txc_dma4_descriptor;
wire dmc_txc_dma4_eoflist;
wire dmc_txc_dma4_error;
wire [1:0] dmc_txc_dma4_func_num;
wire dmc_txc_dma4_gotnxtdesc;
wire [19:0] dmc_txc_dma4_page_handle;
wire dmc_txc_dma4_partial;
wire dmc_txc_dma4_reset_scheduled;
wire dmc_txc_dma5_active;
wire dmc_txc_dma5_cacheready;
wire [63:0] dmc_txc_dma5_descriptor;
wire dmc_txc_dma5_eoflist;
wire dmc_txc_dma5_error;
wire [1:0] dmc_txc_dma5_func_num;
wire dmc_txc_dma5_gotnxtdesc;
wire [19:0] dmc_txc_dma5_page_handle;
wire dmc_txc_dma5_partial;
wire dmc_txc_dma5_reset_scheduled;
wire dmc_txc_dma6_active;
wire dmc_txc_dma6_cacheready;
wire [63:0] dmc_txc_dma6_descriptor;
wire dmc_txc_dma6_eoflist;
wire dmc_txc_dma6_error;
wire [1:0] dmc_txc_dma6_func_num;
wire dmc_txc_dma6_gotnxtdesc;
wire [19:0] dmc_txc_dma6_page_handle;
wire dmc_txc_dma6_partial;
wire dmc_txc_dma6_reset_scheduled;
wire dmc_txc_dma7_active;
wire dmc_txc_dma7_cacheready;
wire [63:0] dmc_txc_dma7_descriptor;
wire dmc_txc_dma7_eoflist;
wire dmc_txc_dma7_error;
wire [1:0] dmc_txc_dma7_func_num;
wire dmc_txc_dma7_gotnxtdesc;
wire [19:0] dmc_txc_dma7_page_handle;
wire dmc_txc_dma7_partial;
wire dmc_txc_dma7_reset_scheduled;
wire dmc_txc_dma8_active;
wire dmc_txc_dma8_cacheready;
wire [63:0] dmc_txc_dma8_descriptor;
wire dmc_txc_dma8_eoflist;
wire dmc_txc_dma8_error;
wire [1:0] dmc_txc_dma8_func_num;
wire dmc_txc_dma8_gotnxtdesc;
wire [19:0] dmc_txc_dma8_page_handle;
wire dmc_txc_dma8_partial;
wire dmc_txc_dma8_reset_scheduled;
wire dmc_txc_dma9_active;
wire dmc_txc_dma9_cacheready;
wire [63:0] dmc_txc_dma9_descriptor;
wire dmc_txc_dma9_eoflist;
wire dmc_txc_dma9_error;
wire [1:0] dmc_txc_dma9_func_num;
wire dmc_txc_dma9_gotnxtdesc;
wire [19:0] dmc_txc_dma9_page_handle;
wire dmc_txc_dma9_partial;
wire dmc_txc_dma9_reset_scheduled;
wire dmc_txc_tx_addr_md;
wire [127:0] meta_dmc_data;
wire meta_dmc_data_valid_txc;
wire [63:0] meta_dmc_resp_address;
wire [15:0] meta_dmc_resp_byteenable;
wire meta_dmc_resp_client_txc;
wire [7:0] meta_dmc_resp_cmd;
wire [3:0] meta_dmc_resp_cmd_status;
wire meta_dmc_resp_complete_txc;
wire [4:0] meta_dmc_resp_dma_num;
wire [13:0] meta_dmc_resp_length;
wire [1:0] meta_dmc_resp_port_num;
wire meta_dmc_resp_ready;
wire [5:0] meta_dmc_resp_trans_id;
wire meta_dmc_resp_transfer_cmpl_txc;
wire niu_dbg1_stall_ack;
wire niu_efu_ram_data;
wire niu_efu_ram_xfer_en;
wire niu_ncu_ctag_ce;
wire niu_ncu_ctag_ue;
wire niu_ncu_d_pe;
wire [127:0] niu_sii_data;
wire niu_sii_datareq;
wire niu_sii_hdr_vld;
wire [7:0] niu_sii_parity;
wire niu_sii_reqbypass;
wire niu_sio_dq;
wire tds_scan_out;
wire tds_mbist_scan_out;
wire tds_smx_tcu_mbist_done;
wire tds_smx_tcu_mbist_fail;
wire [39:0] tds_tcu_dmo_dout;
wire tds_tdmc_tcu_mbist_done;
wire tds_tdmc_tcu_mbist_fail;
wire cmp_gclk_c0_rtx;
wire efu_niu_4k_clr;
wire efu_niu_4k_data;
wire efu_niu_4k_xfer_en;
wire efu_niu_cfifo0_clr;
wire efu_niu_cfifo0_xfer_en;
wire efu_niu_cfifo1_clr;
wire efu_niu_cfifo1_xfer_en;
wire efu_niu_cfifo_data;
wire efu_niu_ipp0_clr;
wire efu_niu_ipp0_xfer_en;
wire efu_niu_ipp1_clr;
wire efu_niu_ipp1_xfer_en;
wire efu_niu_mac01_sfro_data;
wire efu_niu_mac0_ro_clr;
wire efu_niu_mac0_ro_xfer_en;
wire efu_niu_mac0_sf_clr;
wire efu_niu_mac0_sf_xfer_en;
wire efu_niu_mac1_ro_clr;
wire efu_niu_mac1_ro_xfer_en;
wire efu_niu_mac1_sf_clr;
wire efu_niu_mac1_sf_xfer_en;
wire mac_rxc_ack0;
wire mac_rxc_ack1;
wire mac_rxc_ctrl0;
wire mac_rxc_ctrl1;
wire [63:0] mac_rxc_data0;
wire [63:0] mac_rxc_data1;
wire [22:0] mac_rxc_stat0;
wire [22:0] mac_rxc_stat1;
wire mac_rxc_tag0;
wire mac_rxc_tag1;
wire mac_txc_req0;
wire mac_txc_req1;
wire rtx_mbist_scan_in;
wire tcu_socf_scan_out;
wire [2:0] tcu_rtx_dmo_ctl;
wire gl_rtx_io_clk_stop;
wire tcu_rtx_rxc_ipp0_mbist_start;
wire tcu_rtx_rxc_ipp1_mbist_start;
wire tcu_rtx_rxc_mb5_mbist_start;
wire tcu_rtx_rxc_mb6_mbist_start;
wire tcu_rtx_rxc_zcp0_mbist_start;
wire tcu_rtx_rxc_zcp1_mbist_start;
wire tcu_rtx_txc_txe0_mbist_start;
wire tcu_rtx_txc_txe1_mbist_start;
wire niu_efu_4k_data;
wire niu_efu_4k_xfer_en;
wire niu_efu_cfifo0_data;
wire niu_efu_cfifo0_xfer_en;
wire niu_efu_cfifo1_data;
wire niu_efu_cfifo1_xfer_en;
wire niu_efu_ipp0_data;
wire niu_efu_ipp0_xfer_en;
wire niu_efu_ipp1_data;
wire niu_efu_ipp1_xfer_en;
wire niu_efu_mac0_ro_data;
wire niu_efu_mac0_ro_xfer_en;
wire niu_efu_mac0_sf_data;
wire niu_efu_mac0_sf_xfer_en;
wire niu_efu_mac1_ro_data;
wire niu_efu_mac1_ro_xfer_en;
wire niu_efu_mac1_sf_data;
wire niu_efu_mac1_sf_xfer_en;
wire rtx_mbist_scan_out;
wire rtx_rxc_ipp0_tcu_mbist_done;
wire rtx_rxc_ipp0_tcu_mbist_fail;
wire rtx_rxc_ipp1_tcu_mbist_done;
wire rtx_rxc_ipp1_tcu_mbist_fail;
wire rtx_rxc_mb5_tcu_mbist_done;
wire rtx_rxc_mb5_tcu_mbist_fail;
wire rtx_rxc_mb6_tcu_mbist_done;
wire rtx_rxc_mb6_tcu_mbist_fail;
wire rtx_rxc_zcp0_tcu_mbist_done;
wire rtx_rxc_zcp0_tcu_mbist_fail;
wire rtx_rxc_zcp1_tcu_mbist_done;
wire rtx_rxc_zcp1_tcu_mbist_fail;
wire [39:0] rtx_tcu_dmo_data_out;
wire rtx_txc_txe0_tcu_mbist_done;
wire rtx_txc_txe0_tcu_mbist_fail;
wire rtx_txc_txe1_tcu_mbist_done;
wire rtx_txc_txe1_tcu_mbist_fail;
wire rxc_mac_req0;
wire rxc_mac_req1;
wire rtx_scan_out;
wire txc_mac_abort0;
wire txc_mac_abort1;
wire txc_mac_ack0;
wire txc_mac_ack1;
wire [63:0] txc_mac_data0;
wire [63:0] txc_mac_data1;
wire [3:0] txc_mac_stat0;
wire [3:0] txc_mac_stat1;
wire txc_mac_tag0;
wire txc_mac_tag1;
wire [3:0] esr_mac_rclk_0;
wire [3:0] esr_mac_rclk_1;
wire [9:0] esr_mac_rxd0_0;
wire [9:0] esr_mac_rxd0_1;
wire [9:0] esr_mac_rxd1_0;
wire [9:0] esr_mac_rxd1_1;
wire [9:0] esr_mac_rxd2_0;
wire [9:0] esr_mac_rxd2_1;
wire [9:0] esr_mac_rxd3_0;
wire [9:0] esr_mac_rxd3_1;
wire esr_mac_tclk_0;
wire esr_mac_tclk_1;
wire cmp_gclk_c1_mac;
wire gl_mac_io_clk_stop;
wire mac_125rx_test_clk;
wire mac_125tx_test_clk;
wire mac_156rx_test_clk;
wire mac_156tx_test_clk;
wire mac_312rx_test_clk;
wire mac_312tx_test_clk;
wire mdi;
wire peu_mac_sbs_input;
wire gl_rst_mac_c1b;
wire tcu_soc5_scan_out;
wire [3:0] stspll_0;
wire [3:0] stspll_1;
wire [7:0] stsrx0_0;
wire [7:0] stsrx0_1;
wire [7:0] stsrx1_0;
wire [7:0] stsrx1_1;
wire [7:0] stsrx2_0;
wire [7:0] stsrx2_1;
wire [7:0] stsrx3_0;
wire [7:0] stsrx3_1;
wire [3:0] ststx0_0;
wire [3:0] ststx0_1;
wire [3:0] ststx1_0;
wire [3:0] ststx1_1;
wire [3:0] ststx2_0;
wire [3:0] ststx2_1;
wire [3:0] ststx3_0;
wire [3:0] ststx3_1;
wire tcu_sbs_acmode;
wire tcu_sbs_actestsignal;
wire tcu_sbs_aclk;
wire tcu_sbs_bclk;
wire tcu_sbs_clk;
wire tcu_sbs_enbspt;
wire tcu_sbs_enbsrx;
wire tcu_sbs_enbstx;
wire tcu_sbs_scan_en;
wire tcu_sbs_uclk;
wire tcu_mac_testmode;
wire [11:0] cfgpll_0;
wire [11:0] cfgpll_1;
wire [27:0] cfgrx0_0;
wire [27:0] cfgrx0_1;
wire [27:0] cfgrx1_0;
wire [27:0] cfgrx1_1;
wire [27:0] cfgrx2_0;
wire [27:0] cfgrx2_1;
wire [27:0] cfgrx3_0;
wire [27:0] cfgrx3_1;
wire [19:0] cfgtx0_0;
wire [19:0] cfgtx0_1;
wire [19:0] cfgtx1_0;
wire [19:0] cfgtx1_1;
wire [19:0] cfgtx2_0;
wire [19:0] cfgtx2_1;
wire [19:0] cfgtx3_0;
wire [19:0] cfgtx3_1;
wire [3:0] mac_esr_tclk_0;
wire [3:0] mac_esr_tclk_1;
wire [9:0] mac_esr_txd0_0;
wire [9:0] mac_esr_txd0_1;
wire [9:0] mac_esr_txd1_0;
wire [9:0] mac_esr_txd1_1;
wire [9:0] mac_esr_txd2_0;
wire [9:0] mac_esr_txd2_1;
wire [9:0] mac_esr_txd3_0;
wire [9:0] mac_esr_txd3_1;
wire mac_mcu_3_sbs_output;
wire mdoe;
wire mac_scan_out;
wire [15:0] testcfg_0;
wire [15:0] testcfg_1;
wire xaui_act_led_0;
wire xaui_act_led_1;
wire xaui_link_led_0;
wire xaui_link_led_1;
wire mio_mac_xaui_mdint1_l;
wire mio_mac_xaui_mdint0_l;
wire mdc;
wire [1:0] tcu_stcicfg;
wire tcu_stciclk;
wire esr_stcid;
wire stcid_1;
wire mio_esr_testclkr;
wire mio_esr_testclkt;
wire fdi_1;
wire efu_niu_fclk;
wire efu_niu_fclrz;
wire efu_niu_fdi;
wire esr_stciq;
wire niu_efu_fdo;
wire tcu_sbs_bsinitclk;
wire tcu_srd_atpgse;
wire [2:0] tcu_srd_atpgmode;
wire esr_atpgd;
wire esr_atpgq;
wire db0_scan_out;
wire cmp_gclk_c3_mio;
wire cmp_gclk_c2_mio_left;
wire cmp_gclk_c2_mio_right;
wire cmp_gclk_c1_mio;
wire gl_mio_clk_stop_c3t;
wire gl_mio_clk_stop_c2t;
wire gl_mio_clk_stop_c1t;
wire gl_io2x_sync_en_c3t0;
wire gl_io2x_sync_en_c2t;
wire gl_mio_io2x_sync_en_c1t;
wire gl_io_out_c3t;
wire pcmb0_mio_ro_in;
wire mio_tcu_tms;
wire mio_tcu_tdi;
wire mio_tcu_trst_l;
wire mio_tcu_tck;
wire mio_tcu_testmode;
wire mio_psr_testclkt;
wire mio_psr_testclkr;
wire [2:0] mio_spc_pwr_throttle_0;
wire [2:0] mio_spc_pwr_throttle_1;
wire mio_pcmb0_sel59;
wire mio_pcmb1_sel60;
wire mio_pcma_sel61;
wire mio_pcm_burnin;
wire mio_efu_prgm_en;
wire mio_scan_out;
wire db1_scan_out;
wire [7:0] dmu_mio_debug_bus_a;
wire [7:0] dmu_mio_debug_bus_b;
wire cmp_gclk_c3_db0;
wire gl_db0_clk_stop;
wire gl_io_out_c3b0;
wire gl_io2x_sync_en_c3t;
wire gl_io_cmp_sync_en_c3b;
wire tcu_aclk;
wire tcu_bclk;
wire tcu_scan_en;
wire dmu_ncu_wrack_vld;
wire [3:0] dmu_ncu_wrack_tag;
wire [31:0] dmu_ncu_data;
wire dmu_ncu_vld;
wire dmu_ncu_stall;
wire dmu_sii_hdr_vld;
wire dmu_sii_reqbypass;
wire dmu_sii_datareq;
wire dmu_sii_datareq16;
wire [127:0] dmu_sii_data;
wire [15:0] dmu_sii_be;
wire l2t0_dbg0_sii_iq_dequeue;
wire l2t2_dbg0_sii_iq_dequeue;
wire l2t0_dbg0_sii_wib_dequeue;
wire l2t2_dbg0_sii_wib_dequeue;
wire l2t0_dbg0_err_event;
wire l2t2_dbg0_err_event;
wire l2t0_dbg0_pa_match;
wire l2t2_dbg0_pa_match;
wire [5:0] l2t0_dbg0_xbar_vcid;
wire [5:0] l2t2_dbg0_xbar_vcid;
wire l2b0_dbg0_sio_ctag_vld;
wire l2b1_dbg0_sio_ctag_vld;
wire l2b2_dbg0_sio_ctag_vld;
wire l2b3_dbg0_sio_ctag_vld;
wire l2b0_dbg0_sio_ack_type;
wire l2b1_dbg0_sio_ack_type;
wire l2b2_dbg0_sio_ack_type;
wire l2b3_dbg0_sio_ack_type;
wire l2b0_dbg0_sio_ack_dest;
wire l2b1_dbg0_sio_ack_dest;
wire l2b2_dbg0_sio_ack_dest;
wire l2b3_dbg0_sio_ack_dest;
wire [1:0] spc0_dbg0_instr_cmt_grp0;
wire [1:0] spc0_dbg0_instr_cmt_grp1;
wire [1:0] spc2_dbg0_instr_cmt_grp0;
wire [1:0] spc2_dbg0_instr_cmt_grp1;
wire [165:0] dbg0_dbg1_debug_data;
wire dbg0_dbg1_l2t0_sii_iq_dequeue;
wire dbg0_dbg1_l2t2_sii_iq_dequeue;
wire dbg0_dbg1_l2t0_sii_wib_dequeue;
wire dbg0_dbg1_l2t2_sii_wib_dequeue;
wire dbg0_dbg1_l2t0_err_event;
wire dbg0_dbg1_l2t2_err_event;
wire dbg0_dbg1_l2t0_pa_match;
wire dbg0_dbg1_l2t2_pa_match;
wire [5:0] dbg0_dbg1_l2t0_xbar_vcid;
wire [5:0] dbg0_dbg1_l2t2_xbar_vcid;
wire dbg0_dbg1_l2b0_sio_ctag_vld;
wire dbg0_dbg1_l2b1_sio_ctag_vld;
wire dbg0_dbg1_l2b2_sio_ctag_vld;
wire dbg0_dbg1_l2b3_sio_ctag_vld;
wire dbg0_dbg1_l2b0_sio_ack_type;
wire dbg0_dbg1_l2b1_sio_ack_type;
wire dbg0_dbg1_l2b2_sio_ack_type;
wire dbg0_dbg1_l2b3_sio_ack_type;
wire dbg0_dbg1_l2b0_sio_ack_dest;
wire dbg0_dbg1_l2b1_sio_ack_dest;
wire dbg0_dbg1_l2b2_sio_ack_dest;
wire dbg0_dbg1_l2b3_sio_ack_dest;
wire [1:0] dbg0_dbg1_spc0_instr_cmt_grp0;
wire [1:0] dbg0_dbg1_spc0_instr_cmt_grp1;
wire [1:0] dbg0_dbg1_spc2_instr_cmt_grp0;
wire [1:0] dbg0_dbg1_spc2_instr_cmt_grp1;
wire [7:0] dbg0_mio_debug_bus_a;
wire [7:0] dbg0_mio_debug_bus_b;
wire tcu_soc6_scan_out;
wire dmu_dbg_err_event;
wire cmp_gclk_c1_db1;
wire gl_db1_clk_stop;
wire gl_io_out_c1m;
wire gl_io2x_sync_en_c1m;
wire gl_io_cmp_sync_en_c1m;
wire gl_cmp_io_sync_en_c1m;
wire rst_wmr_protect;
wire ccu_dbg1_serdes_dtm;
wire l2t1_dbg1_sii_iq_dequeue;
wire l2t3_dbg1_sii_iq_dequeue;
wire l2t4_dbg1_sii_iq_dequeue;
wire l2t5_dbg1_sii_iq_dequeue;
wire l2t6_dbg1_sii_iq_dequeue;
wire l2t7_dbg1_sii_iq_dequeue;
wire l2t1_dbg1_sii_wib_dequeue;
wire l2t3_dbg1_sii_wib_dequeue;
wire l2t4_dbg1_sii_wib_dequeue;
wire l2t5_dbg1_sii_wib_dequeue;
wire l2t6_dbg1_sii_wib_dequeue;
wire l2t7_dbg1_sii_wib_dequeue;
wire l2t1_dbg1_err_event;
wire l2t3_dbg1_err_event;
wire l2t4_dbg1_err_event;
wire l2t6_dbg1_err_event;
wire l2t7_dbg1_err_event;
wire l2t1_dbg1_pa_match;
wire l2t3_dbg1_pa_match;
wire l2t4_dbg1_pa_match;
wire l2t5_dbg1_pa_match;
wire l2t6_dbg1_pa_match;
wire l2t7_dbg1_pa_match;
wire [5:0] l2t1_dbg1_xbar_vcid;
wire [5:0] l2t3_dbg1_xbar_vcid;
wire [5:0] l2t4_dbg1_xbar_vcid;
wire [5:0] l2t5_dbg1_xbar_vcid;
wire [5:0] l2t6_dbg1_xbar_vcid;
wire [5:0] l2t7_dbg1_xbar_vcid;
wire l2b4_dbg1_sio_ctag_vld;
wire l2b5_dbg1_sio_ctag_vld;
wire l2b6_dbg1_sio_ctag_vld;
wire l2b7_dbg1_sio_ctag_vld;
wire l2b4_dbg1_sio_ack_type;
wire l2b5_dbg1_sio_ack_type;
wire l2b6_dbg1_sio_ack_type;
wire l2b7_dbg1_sio_ack_type;
wire l2b4_dbg1_sio_ack_dest;
wire l2b5_dbg1_sio_ack_dest;
wire l2b6_dbg1_sio_ack_dest;
wire l2b7_dbg1_sio_ack_dest;
wire [1:0] spc1_dbg1_instr_cmt_grp0;
wire [1:0] spc1_dbg1_instr_cmt_grp1;
wire [1:0] spc3_dbg1_instr_cmt_grp0;
wire [1:0] spc3_dbg1_instr_cmt_grp1;
wire [1:0] spc4_dbg1_instr_cmt_grp0;
wire [1:0] spc4_dbg1_instr_cmt_grp1;
wire [1:0] spc5_dbg1_instr_cmt_grp0;
wire [1:0] spc5_dbg1_instr_cmt_grp1;
wire [1:0] spc6_dbg1_instr_cmt_grp0;
wire [1:0] spc6_dbg1_instr_cmt_grp1;
wire [1:0] spc7_dbg1_instr_cmt_grp0;
wire [1:0] spc7_dbg1_instr_cmt_grp1;
wire mcu0_dbg1_crc21;
wire [3:0] mcu0_dbg1_rd_req_in_0;
wire [3:0] mcu0_dbg1_rd_req_in_1;
wire [4:0] mcu0_dbg1_rd_req_out;
wire mcu0_dbg1_wr_req_in_0;
wire mcu0_dbg1_wr_req_in_1;
wire [1:0] mcu0_dbg1_wr_req_out;
wire mcu0_dbg1_mecc_err;
wire mcu0_dbg1_secc_err;
wire mcu0_dbg1_fbd_err;
wire mcu0_dbg1_err_mode;
wire mcu0_dbg1_err_event;
wire mcu1_dbg1_crc21;
wire [3:0] mcu1_dbg1_rd_req_in_0;
wire [3:0] mcu1_dbg1_rd_req_in_1;
wire [4:0] mcu1_dbg1_rd_req_out;
wire mcu1_dbg1_wr_req_in_0;
wire mcu1_dbg1_wr_req_in_1;
wire [1:0] mcu1_dbg1_wr_req_out;
wire mcu1_dbg1_mecc_err;
wire mcu1_dbg1_secc_err;
wire mcu1_dbg1_fbd_err;
wire mcu1_dbg1_err_mode;
wire mcu1_dbg1_err_event;
wire mcu2_dbg1_crc21;
wire [3:0] mcu2_dbg1_rd_req_in_0;
wire [3:0] mcu2_dbg1_rd_req_in_1;
wire [4:0] mcu2_dbg1_rd_req_out;
wire mcu2_dbg1_wr_req_in_0;
wire mcu2_dbg1_wr_req_in_1;
wire [1:0] mcu2_dbg1_wr_req_out;
wire mcu2_dbg1_mecc_err;
wire mcu2_dbg1_secc_err;
wire mcu2_dbg1_fbd_err;
wire mcu2_dbg1_err_mode;
wire mcu2_dbg1_err_event;
wire mcu3_dbg1_crc21;
wire [3:0] mcu3_dbg1_rd_req_in_0;
wire [3:0] mcu3_dbg1_rd_req_in_1;
wire [4:0] mcu3_dbg1_rd_req_out;
wire mcu3_dbg1_wr_req_in_0;
wire mcu3_dbg1_wr_req_in_1;
wire [1:0] mcu3_dbg1_wr_req_out;
wire mcu3_dbg1_mecc_err;
wire mcu3_dbg1_secc_err;
wire mcu3_dbg1_fbd_err;
wire mcu3_dbg1_err_mode;
wire mcu3_dbg1_err_event;
wire dbg1_dmu_stall;
wire dmu_dbg1_stall_ack;
wire dbg1_dmu_resume;
wire [1:0] sii_dbg1_l2t0_req_ccxrff;
wire [1:0] sii_dbg1_l2t1_req_ccxrff;
wire [1:0] sii_dbg1_l2t2_req_ccxrff;
wire [1:0] sii_dbg1_l2t3_req_ccxrff;
wire [1:0] sii_dbg1_l2t4_req_ccxrff;
wire [1:0] sii_dbg1_l2t5_req_ccxrff;
wire [1:0] sii_dbg1_l2t6_req_ccxrff;
wire [1:0] sii_dbg1_l2t7_req_ccxrff;
wire ncu_dbg1_error_event;
wire ncu_dbg1_stall;
wire ncu_dbg1_vld;
wire [3:0] ncu_dbg1_data;
wire dbg1_ncu_stall;
wire dbg1_ncu_vld;
wire [3:0] dbg1_ncu_data;
wire dbg1_tcu_soc_hard_stop;
wire dbg1_tcu_soc_asrt_trigout;
wire tcu_mio_jtag_membist_mode;
wire mio_pll_testmode;
wire [165:0] dbg1_mio_dbg_dq;
wire dbg1_mio_drv_en_op_only;
wire dbg1_mio_drv_en_muxtest_op;
wire dbg1_mio_drv_en_muxbist_op;
wire dbg1_mio_drv_en_muxtest_inp;
wire dbg1_mio_drv_en_muxtestpll_inp;
wire dbg1_mio_sel_niu_debug_mode;
wire dbg1_mio_sel_pcix_debug_mode;
wire dbg1_mio_sel_soc_obs_mode;
wire [1:0] dbg1_mio_drv_imped;
wire dbg0_dbg1_l2b0_sio_ack_dest_ccxlff;
wire dbg0_dbg1_l2b0_sio_ack_type_ccxlff;
wire dbg0_dbg1_l2b0_sio_ctag_vld_ccxlff;
wire dbg0_dbg1_l2b1_sio_ack_dest_ccxlff;
wire dbg0_dbg1_l2b1_sio_ack_type_ccxlff;
wire dbg0_dbg1_l2b1_sio_ctag_vld_ccxlff;
wire dbg0_dbg1_l2b2_sio_ack_dest_ccxlff;
wire dbg0_dbg1_l2b2_sio_ack_type_ccxlff;
wire dbg0_dbg1_l2b2_sio_ctag_vld_ccxlff;
wire dbg0_dbg1_l2b3_sio_ack_dest_ccxlff;
wire dbg0_dbg1_l2b3_sio_ack_type_ccxlff;
wire dbg0_dbg1_l2b3_sio_ctag_vld_ccxlff;
wire dbg0_dbg1_l2t0_err_event_ccxlff;
wire dbg0_dbg1_l2t0_pa_match_ccxlff;
wire dbg0_dbg1_l2t0_sii_iq_dequeue_ccxlff;
wire dbg0_dbg1_l2t0_sii_wib_dequeue_ccxlff;
wire [5:0] dbg0_dbg1_l2t0_xbar_vcid_ccxlff;
wire dbg0_dbg1_l2t2_err_event_ccxlff;
wire dbg0_dbg1_l2t2_pa_match_ccxlff;
wire dbg0_dbg1_l2t2_sii_iq_dequeue_ccxlff;
wire dbg0_dbg1_l2t2_sii_wib_dequeue_ccxlff;
wire [5:0] dbg0_dbg1_l2t2_xbar_vcid_ccxlff;
wire dbg0_dbg1_spc0_instr_cmt_grp0_ccxlff_1;
wire dbg0_dbg1_spc0_instr_cmt_grp0_ccxlff_0;
wire dbg0_dbg1_spc0_instr_cmt_grp1_ccxlff_1;
wire dbg0_dbg1_spc0_instr_cmt_grp1_ccxlff_0;
wire dbg0_dbg1_spc2_instr_cmt_grp0_ccxlff_1;
wire dbg0_dbg1_spc2_instr_cmt_grp0_ccxlff_0;
wire dbg0_dbg1_spc2_instr_cmt_grp1_ccxlff_1;
wire dbg0_dbg1_spc2_instr_cmt_grp1_ccxlff_0;
wire cmp_gclk_c3_spc0;
wire gl_spc0_clk_stop;
wire [145:0] cpx_spc0_data_cx2;
wire [8:0] pcx_spc0_grant_px;
wire [8:0] spc0_pcx_req_pq;
wire [8:0] spc0_pcx_atm_pq;
wire [129:0] spc0_pcx_data_pa;
wire spc0_hardstop_request;
wire spc0_softstop_request;
wire spc0_trigger_pulse;
wire [7:0] tcu_ss_mode;
wire [7:0] tcu_do_mode;
wire tcu_ss_request_t1lff_0;
wire spc0_ss_complete;
wire tcu_spc0_aclk;
wire tcu_spc0_bclk;
wire tcu_spc0_scan_en;
wire tcu_spc0_se_scancollar_in;
wire tcu_spc0_se_scancollar_out;
wire tcu_spc0_array_wr_inhibit;
wire [7:0] ncu_spc0_core_running;
wire [7:0] spc0_ncu_core_running_status;
wire [1:0] spc0_tcu_scan_in;
wire [1:0] tcu_spc0_scan_out;
wire tcu_spc0_mbist_start_t1lff_0;
wire spc0_tcu_mbist_done;
wire spc0_tcu_mbist_fail;
wire tcu_spc0_mbist_scan_in;
wire spc0_tcu_mbist_scan_out;
wire [35:0] spc0_dmo_dout;
wire [7:0] tcu_spc_lbist_start;
wire [7:0] tcu_spc_lbist_scan_in;
wire spc0_tcu_lbist_done;
wire spc0_tcu_lbist_scan_out;
wire tcu_spc_shscan_pce_ov;
wire tcu_spc_shscan_aclk;
wire tcu_spc_shscan_bclk;
wire tcu_spc_shscan_scan_en;
wire [2:0] tcu_spc_shscanid;
wire tcu_spc0_shscan_scan_out;
wire spc0_tcu_shscan_scan_in;
wire tcu_spc0_shscan_clk_stop;
wire efu_spc0246_fuse_data;
wire efu_spc0_fuse_ixfer_en;
wire efu_spc0_fuse_iclr;
wire efu_spc0_fuse_dxfer_en;
wire efu_spc0_fuse_dclr;
wire spc0_efu_fuse_dxfer_en;
wire spc0_efu_fuse_ixfer_en;
wire spc0_efu_fuse_ddata;
wire spc0_efu_fuse_idata;
wire gl_io_cmp_sync_en_c3t0;
wire gl_cmp_io_sync_en_c3t0;
wire [3:0] spc_revid_out;
wire tcu_dectest;
wire tcu_muxtest;
wire ncu_cmp_tick_enable;
wire ncu_wmr_vec_mask;
wire ncu_spc_pm;
wire ncu_spc_ba01;
wire ncu_spc_ba23;
wire ncu_spc_ba45;
wire ncu_spc_ba67;
wire tcu_spc_lbist_pgm;
wire tcu_spc0_test_mode;
wire dmo_icmuxctl;
wire dmo_dcmuxctl;
wire cmp_gclk_c2_spc1;
wire gl_spc1_clk_stop;
wire [145:0] cpx_spc1_data_cx2;
wire [8:0] pcx_spc1_grant_px;
wire [8:0] spc1_pcx_req_pq;
wire [8:0] spc1_pcx_atm_pq;
wire [129:0] spc1_pcx_data_pa;
wire spc1_hardstop_request;
wire spc1_softstop_request;
wire spc1_trigger_pulse;
wire [7:0] tcu_ss_request;
wire spc1_ss_complete;
wire tcu_spc1_aclk;
wire tcu_spc1_bclk;
wire tcu_spc1_scan_en;
wire tcu_spc1_se_scancollar_in;
wire tcu_spc1_se_scancollar_out;
wire tcu_spc1_array_wr_inhibit;
wire [7:0] ncu_spc1_core_running;
wire [7:0] spc1_ncu_core_running_status;
wire [1:0] spc1_tcu_scan_in;
wire [1:0] tcu_spc1_scan_out;
wire [7:0] tcu_spc_mbist_start;
wire spc1_tcu_mbist_done;
wire spc1_tcu_mbist_fail;
wire tcu_spc1_mbist_scan_in;
wire spc1_tcu_mbist_scan_out;
wire [35:0] spc1_dmo_dout;
wire [5:0] dmo_coresel;
wire spc1_tcu_lbist_done;
wire spc1_tcu_lbist_scan_out;
wire tcu_spc1_shscan_scan_out;
wire spc1_tcu_shscan_scan_in;
wire tcu_spc1_shscan_clk_stop;
wire efu_spc1357_fuse_data;
wire efu_spc1_fuse_ixfer_en;
wire efu_spc1_fuse_iclr;
wire efu_spc1_fuse_dxfer_en;
wire efu_spc1_fuse_dclr;
wire spc1_efu_fuse_dxfer_en;
wire spc1_efu_fuse_ixfer_en;
wire spc1_efu_fuse_ddata;
wire spc1_efu_fuse_idata;
wire gl_io_cmp_sync_en_c2t;
wire gl_cmp_io_sync_en_c2t;
wire tcu_spc1_test_mode;
wire cmp_gclk_c3_spc2;
wire gl_spc2_clk_stop;
wire [145:0] cpx_spc2_data_cx2;
wire [8:0] pcx_spc2_grant_px;
wire [8:0] spc2_pcx_req_pq;
wire [8:0] spc2_pcx_atm_pq;
wire [129:0] spc2_pcx_data_pa;
wire spc2_hardstop_request;
wire spc2_softstop_request;
wire spc2_trigger_pulse;
wire tcu_ss_request_t3lff_2;
wire spc2_ss_complete;
wire tcu_spc2_aclk;
wire tcu_spc2_bclk;
wire tcu_spc2_scan_en;
wire tcu_spc2_se_scancollar_in;
wire tcu_spc2_se_scancollar_out;
wire tcu_spc2_array_wr_inhibit;
wire [7:0] ncu_spc2_core_running;
wire [7:0] spc2_ncu_core_running_status;
wire [1:0] spc2_tcu_scan_in;
wire [1:0] tcu_spc2_scan_out;
wire tcu_spc_mbist_start_t3lff_2;
wire spc2_tcu_mbist_done;
wire spc2_tcu_mbist_fail;
wire tcu_spc2_mbist_scan_in;
wire spc2_tcu_mbist_scan_out;
wire [35:0] spc2_dmo_dout;
wire spc2_tcu_lbist_done;
wire spc2_tcu_lbist_scan_out;
wire tcu_spc2_shscan_scan_out;
wire spc2_tcu_shscan_scan_in;
wire tcu_spc2_shscan_clk_stop;
wire efu_spc2_fuse_ixfer_en;
wire efu_spc2_fuse_iclr;
wire efu_spc2_fuse_dxfer_en;
wire efu_spc2_fuse_dclr;
wire spc2_efu_fuse_dxfer_en;
wire spc2_efu_fuse_ixfer_en;
wire spc2_efu_fuse_ddata;
wire spc2_efu_fuse_idata;
wire gl_cmp_io_sync_en_c3b;
wire tcu_spc2_test_mode;
wire cmp_gclk_c2_spc3;
wire gl_spc3_clk_stop;
wire [145:0] cpx_spc3_data_cx2;
wire [8:0] pcx_spc3_grant_px;
wire [8:0] spc3_pcx_req_pq;
wire [8:0] spc3_pcx_atm_pq;
wire [129:0] spc3_pcx_data_pa;
wire spc3_hardstop_request;
wire spc3_softstop_request;
wire spc3_trigger_pulse;
wire spc3_ss_complete;
wire tcu_spc3_aclk;
wire tcu_spc3_bclk;
wire tcu_spc3_scan_en;
wire tcu_spc3_se_scancollar_in;
wire tcu_spc3_se_scancollar_out;
wire tcu_spc3_array_wr_inhibit;
wire [7:0] ncu_spc3_core_running;
wire [7:0] spc3_ncu_core_running_status;
wire [1:0] spc3_tcu_scan_in;
wire [1:0] tcu_spc3_scan_out;
wire spc3_tcu_mbist_done;
wire spc3_tcu_mbist_fail;
wire tcu_spc3_mbist_scan_in;
wire spc3_tcu_mbist_scan_out;
wire [35:0] spc3_dmo_dout;
wire spc3_tcu_lbist_done;
wire spc3_tcu_lbist_scan_out;
wire tcu_spc3_shscan_scan_out;
wire spc3_tcu_shscan_scan_in;
wire tcu_spc3_shscan_clk_stop;
wire efu_spc3_fuse_ixfer_en;
wire efu_spc3_fuse_iclr;
wire efu_spc3_fuse_dxfer_en;
wire efu_spc3_fuse_dclr;
wire spc3_efu_fuse_dxfer_en;
wire spc3_efu_fuse_ixfer_en;
wire spc3_efu_fuse_ddata;
wire spc3_efu_fuse_idata;
wire gl_io_cmp_sync_en_c2b;
wire gl_cmp_io_sync_en_c2b;
wire tcu_spc3_test_mode;
wire cmp_gclk_c1_spc4;
wire gl_spc4_clk_stop;
wire [145:0] cpx_spc4_data_cx2;
wire [8:0] pcx_spc4_grant_px;
wire [8:0] spc4_pcx_req_pq;
wire [8:0] spc4_pcx_atm_pq;
wire [129:0] spc4_pcx_data_pa;
wire spc4_hardstop_request;
wire spc4_softstop_request;
wire spc4_trigger_pulse;
wire spc4_ss_complete;
wire tcu_spc4_aclk;
wire tcu_spc4_bclk;
wire tcu_spc4_scan_en;
wire tcu_spc4_se_scancollar_in;
wire tcu_spc4_se_scancollar_out;
wire tcu_spc4_array_wr_inhibit;
wire [7:0] ncu_spc4_core_running;
wire [7:0] spc4_ncu_core_running_status;
wire [1:0] spc4_tcu_scan_in;
wire [1:0] tcu_spc4_scan_out;
wire spc4_tcu_mbist_done;
wire spc4_tcu_mbist_fail;
wire tcu_spc4_mbist_scan_in;
wire spc4_tcu_mbist_scan_out;
wire [35:0] spc5_dmo_dout;
wire [35:0] spc4_dmo_dout;
wire spc4_tcu_lbist_done;
wire spc4_tcu_lbist_scan_out;
wire tcu_spc4_shscan_scan_out;
wire spc4_tcu_shscan_scan_in;
wire tcu_spc4_shscan_clk_stop;
wire efu_spc4_fuse_ixfer_en;
wire efu_spc4_fuse_iclr;
wire efu_spc4_fuse_dxfer_en;
wire efu_spc4_fuse_dclr;
wire spc4_efu_fuse_dxfer_en;
wire spc4_efu_fuse_ixfer_en;
wire spc4_efu_fuse_ddata;
wire spc4_efu_fuse_idata;
wire gl_io_cmp_sync_en_c1t;
wire gl_cmp_io_sync_en_c1t;
wire tcu_spc4_test_mode;
wire cmp_gclk_c2_spc5;
wire gl_spc5_clk_stop;
wire [145:0] cpx_spc5_data_cx2;
wire [8:0] pcx_spc5_grant_px;
wire [8:0] spc5_pcx_req_pq;
wire [8:0] spc5_pcx_atm_pq;
wire [129:0] spc5_pcx_data_pa;
wire spc5_hardstop_request;
wire spc5_softstop_request;
wire spc5_trigger_pulse;
wire spc5_ss_complete;
wire tcu_spc5_aclk;
wire tcu_spc5_bclk;
wire tcu_spc5_scan_en;
wire tcu_spc5_se_scancollar_in;
wire tcu_spc5_se_scancollar_out;
wire tcu_spc5_array_wr_inhibit;
wire [7:0] ncu_spc5_core_running;
wire [7:0] spc5_ncu_core_running_status;
wire [1:0] spc5_tcu_scan_in;
wire [1:0] tcu_spc5_scan_out;
wire spc5_tcu_mbist_done;
wire spc5_tcu_mbist_fail;
wire tcu_spc5_mbist_scan_in;
wire spc5_tcu_mbist_scan_out;
wire spc5_tcu_lbist_done;
wire spc5_tcu_lbist_scan_out;
wire tcu_spc5_shscan_scan_out;
wire spc5_tcu_shscan_scan_in;
wire tcu_spc5_shscan_clk_stop;
wire efu_spc5_fuse_ixfer_en;
wire efu_spc5_fuse_iclr;
wire efu_spc5_fuse_dxfer_en;
wire efu_spc5_fuse_dclr;
wire spc5_efu_fuse_dxfer_en;
wire spc5_efu_fuse_ixfer_en;
wire spc5_efu_fuse_ddata;
wire spc5_efu_fuse_idata;
wire tcu_spc5_test_mode;
wire cmp_gclk_c1_spc6;
wire gl_spc6_clk_stop;
wire [145:0] cpx_spc6_data_cx2;
wire [8:0] pcx_spc6_grant_px;
wire [8:0] spc6_pcx_req_pq;
wire [8:0] spc6_pcx_atm_pq;
wire [129:0] spc6_pcx_data_pa;
wire spc6_hardstop_request;
wire spc6_softstop_request;
wire spc6_trigger_pulse;
wire spc6_ss_complete;
wire tcu_spc6_aclk;
wire tcu_spc6_bclk;
wire tcu_spc6_scan_en;
wire tcu_spc6_se_scancollar_in;
wire tcu_spc6_se_scancollar_out;
wire tcu_spc6_array_wr_inhibit;
wire [7:0] ncu_spc6_core_running;
wire [7:0] spc6_ncu_core_running_status;
wire [1:0] spc6_tcu_scan_in;
wire [1:0] tcu_spc6_scan_out;
wire spc6_tcu_mbist_done;
wire spc6_tcu_mbist_fail;
wire tcu_spc6_mbist_scan_in;
wire spc6_tcu_mbist_scan_out;
wire [35:0] spc7_dmo_dout;
wire [35:0] spc6_dmo_dout;
wire spc6_tcu_lbist_done;
wire spc6_tcu_lbist_scan_out;
wire tcu_spc6_shscan_scan_out;
wire spc6_tcu_shscan_scan_in;
wire tcu_spc6_shscan_clk_stop;
wire efu_spc6_fuse_ixfer_en;
wire efu_spc6_fuse_iclr;
wire efu_spc6_fuse_dxfer_en;
wire efu_spc6_fuse_dclr;
wire spc6_efu_fuse_dxfer_en;
wire spc6_efu_fuse_ixfer_en;
wire spc6_efu_fuse_ddata;
wire spc6_efu_fuse_idata;
wire gl_io_cmp_sync_en_c1b;
wire gl_cmp_io_sync_en_c1b;
wire tcu_spc6_test_mode;
wire cmp_gclk_c2_spc7;
wire gl_spc7_clk_stop;
wire [145:0] cpx_spc7_data_cx2;
wire [8:0] pcx_spc7_grant_px;
wire [8:0] spc7_pcx_req_pq;
wire [8:0] spc7_pcx_atm_pq;
wire [129:0] spc7_pcx_data_pa;
wire spc7_hardstop_request;
wire spc7_softstop_request;
wire spc7_trigger_pulse;
wire spc7_ss_complete;
wire tcu_spc7_aclk;
wire tcu_spc7_bclk;
wire tcu_spc7_scan_en;
wire tcu_spc7_se_scancollar_in;
wire tcu_spc7_se_scancollar_out;
wire tcu_spc7_array_wr_inhibit;
wire [7:0] ncu_spc7_core_running;
wire [7:0] spc7_ncu_core_running_status;
wire [1:0] spc7_tcu_scan_in;
wire [1:0] tcu_spc7_scan_out;
wire spc7_tcu_mbist_done;
wire spc7_tcu_mbist_fail;
wire tcu_spc7_mbist_scan_in;
wire spc7_tcu_mbist_scan_out;
wire spc7_tcu_lbist_done;
wire spc7_tcu_lbist_scan_out;
wire tcu_spc7_shscan_scan_out;
wire spc7_tcu_shscan_scan_in;
wire tcu_spc7_shscan_clk_stop;
wire efu_spc7_fuse_ixfer_en;
wire efu_spc7_fuse_iclr;
wire efu_spc7_fuse_dxfer_en;
wire efu_spc7_fuse_dclr;
wire spc7_efu_fuse_dxfer_en;
wire spc7_efu_fuse_ixfer_en;
wire spc7_efu_fuse_ddata;
wire spc7_efu_fuse_idata;
wire tcu_spc7_test_mode;
wire gl_ccx_clk_stop;
wire [1:0] tcu_ccx_scan_out;
wire [1:0] ccx_scan_out;
wire [7:0] ncu_cpx_req_cq;
wire [7:0] cpx_ncu_grant_cx;
wire [145:0] ncu_cpx_data_ca;
wire ncu_pcx_stall_pq;
wire [129:0] pcx_ncu_data_px2;
wire [145:0] sctag0_cpx_data_ca;
wire [145:0] sctag1_cpx_data_ca;
wire [145:0] sctag2_cpx_data_ca;
wire [145:0] sctag3_cpx_data_ca;
wire [145:0] sctag4_cpx_data_ca;
wire [145:0] sctag5_cpx_data_ca;
wire [145:0] sctag6_cpx_data_ca;
wire [145:0] sctag7_cpx_data_ca;
wire pcx_ncu_data_rdy_px1;
wire [31:0] l2b1_sio_data;
wire [1:0] l2b1_sio_parity;
wire l2b1_sio_ctag_vld;
wire l2b1_sio_ue_err;
wire [31:0] l2b2_sio_data;
wire [1:0] l2b2_sio_parity;
wire l2b2_sio_ctag_vld;
wire l2b2_sio_ue_err;
wire [31:0] l2b3_sio_data;
wire [1:0] l2b3_sio_parity;
wire l2b3_sio_ctag_vld;
wire l2b3_sio_ue_err;
wire l2b0_tcu_mbist_done;
wire l2b0_tcu_mbist_fail;
wire tcu_l2b0_mbist_start;
wire l2b1_tcu_mbist_done;
wire l2b1_tcu_mbist_fail;
wire tcu_l2b1_mbist_start;
wire l2b2_tcu_mbist_done;
wire l2b2_tcu_mbist_fail;
wire tcu_l2b2_mbist_start;
wire l2b3_tcu_mbist_done;
wire l2b3_tcu_mbist_fail;
wire tcu_l2b3_mbist_start;
wire [31:0] l2b1_sio_data_ccxlff;
wire [1:0] l2b1_sio_parity_ccxlff;
wire l2b1_sio_ctag_vld_ccxlff;
wire l2b1_sio_ue_err_ccxlff;
wire [31:0] l2b2_sio_data_ccxlff;
wire [1:0] l2b2_sio_parity_ccxlff;
wire l2b2_sio_ctag_vld_ccxlff;
wire l2b2_sio_ue_err_ccxlff;
wire [31:0] l2b3_sio_data_ccxlff;
wire [1:0] l2b3_sio_parity_ccxlff;
wire l2b3_sio_ctag_vld_ccxlff;
wire l2b3_sio_ue_err_ccxlff;
wire l2b0_tcu_mbist_done_ccxlff;
wire l2b0_tcu_mbist_fail_ccxlff;
wire tcu_l2b0_mbist_start_ccxlff;
wire l2b1_tcu_mbist_done_ccxlff;
wire l2b1_tcu_mbist_fail_ccxlff;
wire tcu_l2b1_mbist_start_ccxlff;
wire l2b2_tcu_mbist_done_ccxlff;
wire l2b2_tcu_mbist_fail_ccxlff;
wire tcu_l2b2_mbist_start_ccxlff;
wire l2b3_tcu_mbist_done_ccxlff;
wire l2b3_tcu_mbist_fail_ccxlff;
wire tcu_l2b3_mbist_start_ccxlff;
wire [6:0] sii_l2b5_ecc;
wire [1:0] sii_dbg1_l2t0_req;
wire [1:0] sii_dbg1_l2t1_req;
wire [1:0] sii_dbg1_l2t2_req;
wire [1:0] sii_dbg1_l2t3_req;
wire [1:0] sii_dbg1_l2t4_req;
wire [1:0] sii_dbg1_l2t5_req;
wire [1:0] sii_dbg1_l2t6_req;
wire [1:0] sii_dbg1_l2t7_req;
wire [1:0] sii_tcu_mbist_done;
wire [1:0] sii_tcu_mbist_fail;
wire [1:0] tcu_sii_mbist_start;
wire tcu_sii_data;
wire tcu_sii_vld;
wire [6:0] sii_l2b6_ecc;
wire [6:0] sii_l2b7_ecc;
wire [159:2] ccx_rstg_out_unconnected;
wire [6:0] sii_l2b5_ecc_ccxrff;
wire sii_tcu_mbist_done_ccxrff_1;
wire sii_tcu_mbist_done_ccxrff_0;
wire sii_tcu_mbist_fail_ccxrff_1;
wire sii_tcu_mbist_fail_ccxrff_0;
wire tcu_sii_mbist_start_ccxrff_1;
wire tcu_sii_mbist_start_ccxrff_0;
wire tcu_sii_data_ccxrff;
wire tcu_sii_vld_ccxrff;
wire [6:0] sii_l2b6_ecc_ccxrff;
wire [6:0] sii_l2b7_ecc_ccxrff;
wire [191:0] cpu_rep0_out_unconnected;
wire [191:0] cpu_rep1_out_unconnected;
wire cmp_gclk_c3_l2d0;
wire gl_l2d0_clk_stop;
wire [15:0] l2t0_l2d0_way_sel_c2;
wire [3:0] l2t0_l2d0_col_offset_c2;
wire l2t0_l2d0_fb_hit_c3;
wire l2t0_l2d0_fbrd_c3;
wire l2t0_l2d0_rd_wr_c2;
wire [8:0] l2t0_l2d0_set_c2;
wire [15:0] l2t0_l2d0_word_en_c2;
wire [77:0] l2t0_l2d0_stdecc_c2;
wire [623:0] l2b0_l2d0_fbdecc_c4;
wire gl_l2_por_c3t0;
wire gl_l2_wmr_c3t0;
wire tcu_se_scancollar_in;
wire tcu_se_scancollar_out;
wire tcu_array_wr_inhibit;
wire l2t1_scan_out;
wire [9:0] l2b0_l2d0_rvalue;
wire [6:0] l2b0_l2d0_rid;
wire l2b0_l2d0_wr_en;
wire l2b0_l2d0_fuse_clr;
wire [9:0] l2d0_l2b0_fuse_data;
wire l2d0_scan_out;
wire [623:0] l2d0_l2b0_decc_out_c7;
wire [155:0] l2d0_l2t0_decc_c6;
wire cmp_gclk_c3_l2d1;
wire gl_l2d1_clk_stop;
wire l2d1_scan_out;
wire [623:0] l2b1_l2d1_fbdecc_c4;
wire gl_l2_por_c3t;
wire gl_l2_wmr_c3t;
wire [3:0] l2t1_l2d1_col_offset_c2;
wire l2t1_l2d1_fb_hit_c3;
wire l2t1_l2d1_fbrd_c3;
wire l2t1_l2d1_rd_wr_c2;
wire [8:0] l2t1_l2d1_set_c2;
wire [77:0] l2t1_l2d1_stdecc_c2;
wire [15:0] l2t1_l2d1_way_sel_c2;
wire [15:0] l2t1_l2d1_word_en_c2;
wire [9:0] l2b1_l2d1_rvalue;
wire [6:0] l2b1_l2d1_rid;
wire l2b1_l2d1_wr_en;
wire l2b1_l2d1_fuse_clr;
wire [9:0] l2d1_l2b1_fuse_data;
wire [623:0] l2d1_l2b1_decc_out_c7;
wire [155:0] l2d1_l2t1_decc_c6;
wire cmp_gclk_c3_l2d2;
wire gl_l2d2_clk_stop;
wire l2t3_scan_out;
wire l2d2_scan_out;
wire [623:0] l2b2_l2d2_fbdecc_c4;
wire gl_l2_por_c3b0;
wire gl_l2_wmr_c3b;
wire [3:0] l2t2_l2d2_col_offset_c2;
wire l2t2_l2d2_fb_hit_c3;
wire l2t2_l2d2_fbrd_c3;
wire l2t2_l2d2_rd_wr_c2;
wire [8:0] l2t2_l2d2_set_c2;
wire [77:0] l2t2_l2d2_stdecc_c2;
wire [15:0] l2t2_l2d2_way_sel_c2;
wire [15:0] l2t2_l2d2_word_en_c2;
wire [623:0] l2d2_l2b2_decc_out_c7;
wire [155:0] l2d2_l2t2_decc_c6;
wire [9:0] l2b2_l2d2_rvalue;
wire [6:0] l2b2_l2d2_rid;
wire l2b2_l2d2_wr_en;
wire l2b2_l2d2_fuse_clr;
wire [9:0] l2d2_l2b2_fuse_data;
wire cmp_gclk_c3_l2d3;
wire gl_l2d3_clk_stop;
wire l2d3_scan_out;
wire [9:0] l2b3_l2d3_rvalue;
wire [6:0] l2b3_l2d3_rid;
wire l2b3_l2d3_wr_en;
wire l2b3_l2d3_fuse_clr;
wire [9:0] l2d3_l2b3_fuse_data;
wire [623:0] l2b3_l2d3_fbdecc_c4;
wire [3:0] l2t3_l2d3_col_offset_c2;
wire l2t3_l2d3_fb_hit_c3;
wire l2t3_l2d3_fbrd_c3;
wire l2t3_l2d3_rd_wr_c2;
wire [8:0] l2t3_l2d3_set_c2;
wire [77:0] l2t3_l2d3_stdecc_c2;
wire [15:0] l2t3_l2d3_way_sel_c2;
wire [15:0] l2t3_l2d3_word_en_c2;
wire [623:0] l2d3_l2b3_decc_out_c7;
wire [155:0] l2d3_l2t3_decc_c6;
wire cmp_gclk_c1_l2d4;
wire gl_l2d4_clk_stop;
wire l2t5_scan_out;
wire l2d4_scan_out;
wire [9:0] l2b4_l2d4_rvalue;
wire [6:0] l2b4_l2d4_rid;
wire l2b4_l2d4_wr_en;
wire l2b4_l2d4_fuse_clr;
wire [9:0] l2d4_l2b4_fuse_data;
wire [623:0] l2b4_l2d4_fbdecc_c4;
wire gl_l2_por_c1t;
wire gl_l2_wmr_c1t;
wire [3:0] l2t4_l2d4_col_offset_c2;
wire l2t4_l2d4_fb_hit_c3;
wire l2t4_l2d4_fbrd_c3;
wire l2t4_l2d4_rd_wr_c2;
wire [8:0] l2t4_l2d4_set_c2;
wire [77:0] l2t4_l2d4_stdecc_c2;
wire [15:0] l2t4_l2d4_way_sel_c2;
wire [15:0] l2t4_l2d4_word_en_c2;
wire [623:0] l2d4_l2b4_decc_out_c7;
wire [155:0] l2d4_l2t4_decc_c6;
wire cmp_gclk_c1_l2d5;
wire gl_l2d5_clk_stop;
wire l2d5_scan_out;
wire [623:0] l2b5_l2d5_fbdecc_c4;
wire [3:0] l2t5_l2d5_col_offset_c2;
wire l2t5_l2d5_fb_hit_c3;
wire l2t5_l2d5_fbrd_c3;
wire l2t5_l2d5_rd_wr_c2;
wire [8:0] l2t5_l2d5_set_c2;
wire [77:0] l2t5_l2d5_stdecc_c2;
wire [15:0] l2t5_l2d5_way_sel_c2;
wire [15:0] l2t5_l2d5_word_en_c2;
wire [9:0] l2b5_l2d5_rvalue;
wire [6:0] l2b5_l2d5_rid;
wire l2b5_l2d5_wr_en;
wire l2b5_l2d5_fuse_clr;
wire [9:0] l2d5_l2b5_fuse_data;
wire [623:0] l2d5_l2b5_decc_out_c7;
wire [155:0] l2d5_l2t5_decc_c6;
wire cmp_gclk_c1_l2d6;
wire gl_l2d6_clk_stop;
wire l2t7_scan_out;
wire l2d6_scan_out;
wire [9:0] l2b6_l2d6_rvalue;
wire [6:0] l2b6_l2d6_rid;
wire l2b6_l2d6_wr_en;
wire l2b6_l2d6_fuse_clr;
wire [9:0] l2d6_l2b6_fuse_data;
wire [623:0] l2b6_l2d6_fbdecc_c4;
wire gl_l2_por_c1b;
wire gl_l2_wmr_c1b;
wire [3:0] l2t6_l2d6_col_offset_c2;
wire l2t6_l2d6_fb_hit_c3;
wire l2t6_l2d6_fbrd_c3;
wire l2t6_l2d6_rd_wr_c2;
wire [8:0] l2t6_l2d6_set_c2;
wire [77:0] l2t6_l2d6_stdecc_c2;
wire [15:0] l2t6_l2d6_way_sel_c2;
wire [15:0] l2t6_l2d6_word_en_c2;
wire [623:0] l2d6_l2b6_decc_out_c7;
wire [155:0] l2d6_l2t6_decc_c6;
wire cmp_gclk_c1_l2d7;
wire gl_l2d7_clk_stop;
wire l2d7_scan_out;
wire [9:0] l2b7_l2d7_rvalue;
wire [6:0] l2b7_l2d7_rid;
wire l2b7_l2d7_wr_en;
wire l2b7_l2d7_fuse_clr;
wire [9:0] l2d7_l2b7_fuse_data;
wire [623:0] l2b7_l2d7_fbdecc_c4;
wire [3:0] l2t7_l2d7_col_offset_c2;
wire l2t7_l2d7_fb_hit_c3;
wire l2t7_l2d7_fbrd_c3;
wire l2t7_l2d7_rd_wr_c2;
wire [8:0] l2t7_l2d7_set_c2;
wire [77:0] l2t7_l2d7_stdecc_c2;
wire [15:0] l2t7_l2d7_way_sel_c2;
wire [15:0] l2t7_l2d7_word_en_c2;
wire [623:0] l2d7_l2b7_decc_out_c7;
wire [155:0] l2d7_l2t7_decc_c6;
wire l2t1_mcu0_rd_req;
wire l2t1_mcu0_rd_dummy_req;
wire [2:0] l2t1_mcu0_rd_req_id;
wire l2t1_mcu0_wr_req;
wire l2t1_mcu0_addr_5;
wire [39:7] l2t1_mcu0_addr;
wire l2t1_mcu0_rd_req_t0lff;
wire l2t1_mcu0_rd_dummy_req_t0lff;
wire [2:0] l2t1_mcu0_rd_req_id_t0lff;
wire l2t1_mcu0_wr_req_t0lff;
wire l2t1_mcu0_addr_5_t0lff;
wire [39:7] l2t1_mcu0_addr_t0lff;
wire [1:0] l2b0_sio_parity;
wire [1:0] l2b0_sio_parity_t0rff;
wire [38:0] l2t0_dmo_dout;
wire dmo_tagmuxctl;
wire gl_io_cmp_sync_en_c3t;
wire gl_cmp_io_sync_en_c3t;
wire [7:0] sctag0_cpx_req_cq;
wire sctag0_cpx_atom_cq;
wire sctag0_pcx_stall_pq;
wire pcx_sctag0_data_rdy_px1;
wire [129:0] pcx_sctag0_data_px2;
wire pcx_sctag0_atm_px1;
wire [7:0] cpx_sctag0_grant_cx;
wire l2t0_rst_fatal_error;
wire l2t0_l2b0_fbrd_en_c3;
wire [2:0] l2t0_l2b0_fbrd_wl_c3;
wire [15:0] l2t0_l2b0_fbwr_wen_r2;
wire [2:0] l2t0_l2b0_fbwr_wl_r2;
wire l2t0_l2b0_fbd_stdatasel_c3;
wire [3:0] l2t0_l2b0_wbwr_wen_c6;
wire [2:0] l2t0_l2b0_wbwr_wl_c6;
wire l2t0_l2b0_wbrd_en_r0;
wire [2:0] l2t0_l2b0_wbrd_wl_r0;
wire [2:0] l2t0_l2b0_ev_dword_r0;
wire l2t0_l2b0_evict_en_r0;
wire l2b0_l2t0_ev_uerr_r5;
wire l2b0_l2t0_ev_cerr_r5;
wire [15:0] l2t0_l2b0_rdma_wren_s2;
wire [1:0] l2t0_l2b0_rdma_wrwl_s2;
wire [1:0] l2t0_l2b0_rdma_rdwl_r0;
wire l2t0_l2b0_rdma_rden_r0;
wire l2t0_l2b0_ctag_en_c7;
wire [31:0] l2t0_l2b0_ctag_c7;
wire [3:0] l2t0_l2b0_word_c7;
wire l2t0_l2b0_req_en_c7;
wire l2t0_l2b0_word_vld_c7;
wire l2b0_l2t0_rdma_uerr_c10;
wire l2b0_l2t0_rdma_cerr_c10;
wire l2b0_l2t0_rdma_notdata_c10;
wire l2t0_mcu0_rd_req;
wire l2t0_mcu0_rd_dummy_req;
wire [2:0] l2t0_mcu0_rd_req_id;
wire [39:7] l2t0_mcu0_addr;
wire l2t0_mcu0_addr_5;
wire l2t0_mcu0_wr_req;
wire mcu0_l2t0_rd_ack;
wire mcu0_l2t0_wr_ack;
wire [1:0] mcu0_l2t0_qword_id_r0;
wire mcu0_l2t0_data_vld_r0;
wire [2:0] mcu0_l2t0_rd_req_id_r0;
wire mcu0_l2t0_secc_err_r2;
wire mcu0_l2t0_mecc_err_r2;
wire mcu0_l2t0_scb_mecc_err;
wire mcu0_l2t0_scb_secc_err;
wire sii_l2t0_req_vld;
wire [31:0] sii_l2t0_req;
wire [6:0] sii_l2b0_ecc;
wire l2t0_sii_iq_dequeue;
wire l2t0_sii_wib_dequeue;
wire tcu_soc0_scan_out;
wire l2t0_scan_out;
wire efu_l2t0_fuse_clr;
wire efu_l2t0_fuse_xfer_en;
wire efu_l2t0246_fuse_data;
wire l2t0_efu_fuse_data;
wire l2t0_efu_fuse_xfer_en;
wire tcu_l2t0_mbist_start_t1lff;
wire tcu_l2t0_mbist_scan_in;
wire l2t0_tcu_mbist_done;
wire l2t0_tcu_mbist_fail;
wire l2t0_tcu_mbist_scan_out;
wire cmp_gclk_c3_l2t0;
wire gl_l2t0_clk_stop;
wire tcu_l2t0_shscan_scan_in;
wire tcu_l2t_shscan_aclk;
wire tcu_l2t_shscan_bclk;
wire tcu_l2t_shscan_scan_en;
wire tcu_l2t_shscan_pce_ov;
wire l2t0_tcu_shscan_scan_out;
wire tcu_l2t0_shscan_clk_stop;
wire [23:0] l2t0_rep_out0_unused;
wire [23:0] l2t0_rep_out1_unused;
wire [23:0] l2t0_rep_out2_unused;
wire [23:0] l2t0_rep_out3_unused;
wire [23:0] l2t0_rep_out4_unused;
wire [23:0] l2t0_rep_out5_unused;
wire [23:0] l2t0_rep_out6_unused;
wire [23:0] l2t0_rep_out7_unused;
wire [23:0] l2t0_rep_out8_unused;
wire [23:0] l2t0_rep_out9_unused;
wire [23:0] l2t0_rep_out10_unused;
wire [23:0] l2t0_rep_out11_unused;
wire [23:0] l2t0_rep_out12_unused;
wire [23:0] l2t0_rep_out13_unused;
wire [23:0] l2t0_rep_out14_unused;
wire [23:0] l2t0_rep_out15_unused;
wire [23:0] l2t0_rep_out16_unused;
wire [23:0] l2t0_rep_out17_unused;
wire [23:0] l2t0_rep_out18_unused;
wire [23:0] l2t0_rep_out19_unused;
wire [1:0] tcu_ncu_mbist_start;
wire l2t4_sii_iq_dequeue;
wire l2t4_sii_wib_dequeue;
wire l2t5_sii_iq_dequeue;
wire l2t5_sii_wib_dequeue;
wire tcu_l2t0_mbist_start;
wire tcu_mcu0_mbist_start;
wire tcu_mcu1_mbist_start;
wire [31:0] l2b0_sio_data;
wire l2b0_sio_ctag_vld;
wire l2b0_sio_ue_err;
wire mcu0_l2t1_rd_ack;
wire mcu0_l2t1_wr_ack;
wire [1:0] mcu0_l2t1_qword_id_r0;
wire mcu0_l2t1_data_vld_r0;
wire [2:0] mcu0_l2t1_rd_req_id_r0;
wire mcu0_l2t1_secc_err_r2;
wire mcu0_l2t1_mecc_err_r2;
wire mcu0_l2t1_scb_mecc_err;
wire mcu0_l2t1_scb_secc_err;
wire tcu_ncu_mbist_start_t1lff_0;
wire l2t4_sii_iq_dequeue_t1lff;
wire l2t4_sii_wib_dequeue_t1lff;
wire l2t5_sii_iq_dequeue_t1lff;
wire l2t5_sii_wib_dequeue_t1lff;
wire tcu_mcu0_mbist_start_t1lff;
wire tcu_mcu1_mbist_start_t1lff;
wire [62:0] unconnectedt1lff_t1lff;
wire [31:0] l2b0_sio_data_t1rff;
wire l2b0_sio_ctag_vld_t1rff;
wire l2b0_sio_ue_err_t1rff;
wire mcu0_l2t1_rd_ack_t1rff;
wire mcu0_l2t1_wr_ack_t1rff;
wire [1:0] mcu0_l2t1_qword_id_r0_t1rff;
wire mcu0_l2t1_data_vld_r0_t1rff;
wire [2:0] mcu0_l2t1_rd_req_id_r0_t1rff;
wire mcu0_l2t1_secc_err_r2_t1rff;
wire mcu0_l2t1_mecc_err_r2_t1rff;
wire mcu0_l2t1_scb_mecc_err_t1rff;
wire mcu0_l2t1_scb_secc_err_t1rff;
wire [38:0] l2t1_dmo_dout;
wire [5:0] dmo_l2tsel;
wire [7:0] sctag1_cpx_req_cq;
wire sctag1_cpx_atom_cq;
wire sctag1_pcx_stall_pq;
wire pcx_sctag1_data_rdy_px1;
wire [129:0] pcx_sctag1_data_px2;
wire pcx_sctag1_atm_px1;
wire [7:0] cpx_sctag1_grant_cx;
wire l2t1_rst_fatal_error;
wire l2t1_l2b1_fbrd_en_c3;
wire [2:0] l2t1_l2b1_fbrd_wl_c3;
wire [15:0] l2t1_l2b1_fbwr_wen_r2;
wire [2:0] l2t1_l2b1_fbwr_wl_r2;
wire l2t1_l2b1_fbd_stdatasel_c3;
wire [3:0] l2t1_l2b1_wbwr_wen_c6;
wire [2:0] l2t1_l2b1_wbwr_wl_c6;
wire l2t1_l2b1_wbrd_en_r0;
wire [2:0] l2t1_l2b1_wbrd_wl_r0;
wire [2:0] l2t1_l2b1_ev_dword_r0;
wire l2t1_l2b1_evict_en_r0;
wire l2b1_l2t1_ev_uerr_r5;
wire l2b1_l2t1_ev_cerr_r5;
wire [15:0] l2t1_l2b1_rdma_wren_s2;
wire [1:0] l2t1_l2b1_rdma_wrwl_s2;
wire [1:0] l2t1_l2b1_rdma_rdwl_r0;
wire l2t1_l2b1_rdma_rden_r0;
wire l2t1_l2b1_ctag_en_c7;
wire [31:0] l2t1_l2b1_ctag_c7;
wire [3:0] l2t1_l2b1_word_c7;
wire l2t1_l2b1_req_en_c7;
wire l2t1_l2b1_word_vld_c7;
wire l2b1_l2t1_rdma_uerr_c10;
wire l2b1_l2t1_rdma_cerr_c10;
wire l2b1_l2t1_rdma_notdata_c10;
wire sii_l2t1_req_vld;
wire [31:0] sii_l2t1_req;
wire [6:0] sii_l2b1_ecc;
wire l2t1_sii_iq_dequeue;
wire l2t1_sii_wib_dequeue;
wire gl_l2_por_c2t;
wire gl_l2_wmr_c2t;
wire efu_l2t1_fuse_clr;
wire efu_l2t1_fuse_xfer_en;
wire efu_l2t1357_fuse_data;
wire l2t1_efu_fuse_data;
wire l2t1_efu_fuse_xfer_en;
wire tcu_l2t1_mbist_start;
wire tcu_l2t1_mbist_scan_in;
wire l2t1_tcu_mbist_done;
wire l2t1_tcu_mbist_fail;
wire l2t1_tcu_mbist_scan_out;
wire cmp_gclk_c2_l2t1;
wire gl_l2t1_clk_stop;
wire tcu_l2t1_shscan_scan_in;
wire l2t1_tcu_shscan_scan_out;
wire tcu_l2t1_shscan_clk_stop;
wire [23:0] l2t1_rep_out0_unused;
wire [23:0] l2t1_rep_out1_unused;
wire [23:0] l2t1_rep_out2_unused;
wire [23:0] l2t1_rep_out3_unused;
wire [23:0] l2t1_rep_out4_unused;
wire [23:0] l2t1_rep_out5_unused;
wire [23:0] l2t1_rep_out6_unused;
wire [23:0] l2t1_rep_out7_unused;
wire [23:0] l2t1_rep_out8_unused;
wire [23:0] l2t1_rep_out9_unused;
wire [23:0] l2t1_rep_out10_unused;
wire [23:0] l2t1_rep_out11_unused;
wire [23:0] l2t1_rep_out12_unused;
wire [23:0] l2t1_rep_out13_unused;
wire [23:0] l2t1_rep_out14_unused;
wire [23:0] l2t1_rep_out15_unused;
wire [23:0] l2t1_rep_out16_unused;
wire [23:0] l2t1_rep_out17_unused;
wire [23:0] l2t1_rep_out18_unused;
wire [23:0] l2t1_rep_out19_unused;
wire l2t3_mcu1_rd_req;
wire l2t3_mcu1_rd_dummy_req;
wire [2:0] l2t3_mcu1_rd_req_id;
wire l2t3_mcu1_wr_req;
wire l2t3_mcu1_addr_5;
wire [39:7] l2t3_mcu1_addr;
wire l2t3_mcu1_rd_req_t2lff;
wire l2t3_mcu1_rd_dummy_req_t2lff;
wire [2:0] l2t3_mcu1_rd_req_id_t2lff;
wire l2t3_mcu1_wr_req_t2lff;
wire l2t3_mcu1_addr_5_t2lff;
wire [39:7] l2t3_mcu1_addr_t2lff;
wire [38:0] l2t2_dmo_dout;
wire [7:0] sctag2_cpx_req_cq;
wire sctag2_cpx_atom_cq;
wire sctag2_pcx_stall_pq;
wire pcx_sctag2_data_rdy_px1;
wire [129:0] pcx_sctag2_data_px2;
wire pcx_sctag2_atm_px1;
wire [7:0] cpx_sctag2_grant_cx;
wire l2t2_rst_fatal_error;
wire l2t2_l2b2_fbrd_en_c3;
wire [2:0] l2t2_l2b2_fbrd_wl_c3;
wire [15:0] l2t2_l2b2_fbwr_wen_r2;
wire [2:0] l2t2_l2b2_fbwr_wl_r2;
wire l2t2_l2b2_fbd_stdatasel_c3;
wire [3:0] l2t2_l2b2_wbwr_wen_c6;
wire [2:0] l2t2_l2b2_wbwr_wl_c6;
wire l2t2_l2b2_wbrd_en_r0;
wire [2:0] l2t2_l2b2_wbrd_wl_r0;
wire [2:0] l2t2_l2b2_ev_dword_r0;
wire l2t2_l2b2_evict_en_r0;
wire l2b2_l2t2_ev_uerr_r5;
wire l2b2_l2t2_ev_cerr_r5;
wire [15:0] l2t2_l2b2_rdma_wren_s2;
wire [1:0] l2t2_l2b2_rdma_wrwl_s2;
wire [1:0] l2t2_l2b2_rdma_rdwl_r0;
wire l2t2_l2b2_rdma_rden_r0;
wire l2t2_l2b2_ctag_en_c7;
wire [31:0] l2t2_l2b2_ctag_c7;
wire [3:0] l2t2_l2b2_word_c7;
wire l2t2_l2b2_req_en_c7;
wire l2t2_l2b2_word_vld_c7;
wire l2b2_l2t2_rdma_uerr_c10;
wire l2b2_l2t2_rdma_cerr_c10;
wire l2b2_l2t2_rdma_notdata_c10;
wire l2t2_mcu1_rd_req;
wire l2t2_mcu1_rd_dummy_req;
wire [2:0] l2t2_mcu1_rd_req_id;
wire [39:7] l2t2_mcu1_addr;
wire l2t2_mcu1_addr_5;
wire l2t2_mcu1_wr_req;
wire mcu1_l2t2_rd_ack;
wire mcu1_l2t2_wr_ack;
wire [1:0] mcu1_l2t2_qword_id_r0;
wire mcu1_l2t2_data_vld_r0;
wire [2:0] mcu1_l2t2_rd_req_id_r0;
wire mcu1_l2t2_secc_err_r2;
wire mcu1_l2t2_mecc_err_r2;
wire mcu1_l2t2_scb_mecc_err;
wire mcu1_l2t2_scb_secc_err;
wire sii_l2t2_req_vld;
wire [31:0] sii_l2t2_req;
wire [6:0] sii_l2b2_ecc;
wire l2t2_sii_iq_dequeue;
wire l2t2_sii_wib_dequeue;
wire tcu_soc1_scan_out;
wire l2t2_scan_out;
wire tcu_l2t2_mbist_start_t3lff;
wire tcu_l2t2_mbist_scan_in;
wire l2t2_tcu_mbist_done;
wire l2t2_tcu_mbist_fail;
wire l2t2_tcu_mbist_scan_out;
wire efu_l2t2_fuse_clr;
wire efu_l2t2_fuse_xfer_en;
wire l2t2_efu_fuse_data;
wire l2t2_efu_fuse_xfer_en;
wire cmp_gclk_c3_l2t2;
wire gl_l2t2_clk_stop;
wire tcu_l2t2_shscan_scan_in;
wire l2t2_tcu_shscan_scan_out;
wire tcu_l2t2_shscan_clk_stop;
wire [23:0] l2t2_rep_out0_unused;
wire [23:0] l2t2_rep_out1_unused;
wire [23:0] l2t2_rep_out2_unused;
wire [23:0] l2t2_rep_out3_unused;
wire [23:0] l2t2_rep_out4_unused;
wire [23:0] l2t2_rep_out5_unused;
wire [23:0] l2t2_rep_out6_unused;
wire [23:0] l2t2_rep_out7_unused;
wire [23:0] l2t2_rep_out8_unused;
wire [23:0] l2t2_rep_out9_unused;
wire [23:0] l2t2_rep_out10_unused;
wire [23:0] l2t2_rep_out11_unused;
wire [23:0] l2t2_rep_out12_unused;
wire [23:0] l2t2_rep_out13_unused;
wire [23:0] l2t2_rep_out14_unused;
wire [23:0] l2t2_rep_out15_unused;
wire [23:0] l2t2_rep_out16_unused;
wire [23:0] l2t2_rep_out17_unused;
wire [23:0] l2t2_rep_out18_unused;
wire [23:0] l2t2_rep_out19_unused;
wire l2t6_sii_iq_dequeue;
wire l2t6_sii_wib_dequeue;
wire l2t7_sii_iq_dequeue;
wire l2t7_sii_wib_dequeue;
wire tcu_l2t2_mbist_start;
wire mcu1_l2t3_rd_ack;
wire mcu1_l2t3_wr_ack;
wire [1:0] mcu1_l2t3_qword_id_r0;
wire mcu1_l2t3_data_vld_r0;
wire [2:0] mcu1_l2t3_rd_req_id_r0;
wire mcu1_l2t3_secc_err_r2;
wire mcu1_l2t3_mecc_err_r2;
wire mcu1_l2t3_scb_mecc_err;
wire mcu1_l2t3_scb_secc_err;
wire l2t6_sii_iq_dequeue_t3lff;
wire l2t6_sii_wib_dequeue_t3lff;
wire l2t7_sii_iq_dequeue_t3lff;
wire l2t7_sii_wib_dequeue_t3lff;
wire mcu1_l2t3_rd_ack_t3rff;
wire mcu1_l2t3_wr_ack_t3rff;
wire [1:0] mcu1_l2t3_qword_id_r0_t3rff;
wire mcu1_l2t3_data_vld_r0_t3rff;
wire [2:0] mcu1_l2t3_rd_req_id_r0_t3rff;
wire mcu1_l2t3_secc_err_r2_t3rff;
wire mcu1_l2t3_mecc_err_r2_t3rff;
wire mcu1_l2t3_scb_mecc_err_t3rff;
wire mcu1_l2t3_scb_secc_err_t3rff;
wire [38:0] l2t3_dmo_dout;
wire [7:0] sctag3_cpx_req_cq;
wire sctag3_cpx_atom_cq;
wire sctag3_pcx_stall_pq;
wire pcx_sctag3_data_rdy_px1;
wire [129:0] pcx_sctag3_data_px2;
wire pcx_sctag3_atm_px1;
wire [7:0] cpx_sctag3_grant_cx;
wire l2t3_rst_fatal_error;
wire l2t3_l2b3_fbrd_en_c3;
wire [2:0] l2t3_l2b3_fbrd_wl_c3;
wire [15:0] l2t3_l2b3_fbwr_wen_r2;
wire [2:0] l2t3_l2b3_fbwr_wl_r2;
wire l2t3_l2b3_fbd_stdatasel_c3;
wire [3:0] l2t3_l2b3_wbwr_wen_c6;
wire [2:0] l2t3_l2b3_wbwr_wl_c6;
wire l2t3_l2b3_wbrd_en_r0;
wire [2:0] l2t3_l2b3_wbrd_wl_r0;
wire [2:0] l2t3_l2b3_ev_dword_r0;
wire l2t3_l2b3_evict_en_r0;
wire l2b3_l2t3_ev_uerr_r5;
wire l2b3_l2t3_ev_cerr_r5;
wire [15:0] l2t3_l2b3_rdma_wren_s2;
wire [1:0] l2t3_l2b3_rdma_wrwl_s2;
wire [1:0] l2t3_l2b3_rdma_rdwl_r0;
wire l2t3_l2b3_rdma_rden_r0;
wire l2t3_l2b3_ctag_en_c7;
wire [31:0] l2t3_l2b3_ctag_c7;
wire [3:0] l2t3_l2b3_word_c7;
wire l2t3_l2b3_req_en_c7;
wire l2t3_l2b3_word_vld_c7;
wire l2b3_l2t3_rdma_uerr_c10;
wire l2b3_l2t3_rdma_cerr_c10;
wire l2b3_l2t3_rdma_notdata_c10;
wire sii_l2t3_req_vld;
wire [31:0] sii_l2t3_req;
wire [6:0] sii_l2b3_ecc;
wire l2t3_sii_iq_dequeue;
wire l2t3_sii_wib_dequeue;
wire gl_l2_por_c2b;
wire gl_l2_wmr_c2b;
wire tcu_l2t3_mbist_start;
wire tcu_l2t3_mbist_scan_in;
wire l2t3_tcu_mbist_done;
wire l2t3_tcu_mbist_fail;
wire l2t3_tcu_mbist_scan_out;
wire efu_l2t3_fuse_clr;
wire efu_l2t3_fuse_xfer_en;
wire l2t3_efu_fuse_data;
wire l2t3_efu_fuse_xfer_en;
wire cmp_gclk_c2_l2t3;
wire gl_l2t3_clk_stop;
wire tcu_l2t3_shscan_scan_in;
wire l2t3_tcu_shscan_scan_out;
wire tcu_l2t3_shscan_clk_stop;
wire [23:0] l2t3_rep_out0_unused;
wire [23:0] l2t3_rep_out1_unused;
wire [23:0] l2t3_rep_out2_unused;
wire [23:0] l2t3_rep_out3_unused;
wire [23:0] l2t3_rep_out4_unused;
wire [23:0] l2t3_rep_out5_unused;
wire [23:0] l2t3_rep_out6_unused;
wire [23:0] l2t3_rep_out7_unused;
wire [23:0] l2t3_rep_out8_unused;
wire [23:0] l2t3_rep_out9_unused;
wire [23:0] l2t3_rep_out10_unused;
wire [23:0] l2t3_rep_out11_unused;
wire [23:0] l2t3_rep_out12_unused;
wire [23:0] l2t3_rep_out13_unused;
wire [23:0] l2t3_rep_out14_unused;
wire [23:0] l2t3_rep_out15_unused;
wire [23:0] l2t3_rep_out16_unused;
wire [23:0] l2t3_rep_out17_unused;
wire [23:0] l2t3_rep_out18_unused;
wire [23:0] l2t3_rep_out19_unused;
wire [31:0] sii_l2t4_req;
wire sii_l2t4_req_vld;
wire [31:0] sii_l2t5_req;
wire sii_l2t5_req_vld;
wire [6:0] sii_l2b4_ecc;
wire l2t5_mcu2_rd_req;
wire l2t5_mcu2_rd_dummy_req;
wire [2:0] l2t5_mcu2_rd_req_id;
wire l2t5_mcu2_wr_req;
wire l2t5_mcu2_addr_5;
wire [39:7] l2t5_mcu2_addr;
wire [31:0] l2b4_sio_data;
wire [1:0] l2b4_sio_parity;
wire l2b4_sio_ctag_vld;
wire l2b4_sio_ue_err;
wire [31:0] sii_l2t4_req_t4lff;
wire sii_l2t4_req_vld_t4lff;
wire [31:0] sii_l2t5_req_t4lff;
wire sii_l2t5_req_vld_t4lff;
wire [6:0] sii_l2b4_ecc_t4lff;
wire [31:0] l2b0_sio_data_t4lff;
wire l2b0_sio_ctag_vld_t4lff;
wire l2b0_sio_ue_err_t4lff;
wire l2t5_mcu2_rd_req_t4lff;
wire l2t5_mcu2_rd_dummy_req_t4lff;
wire [2:0] l2t5_mcu2_rd_req_id_t4lff;
wire l2t5_mcu2_wr_req_t4lff;
wire l2t5_mcu2_addr_5_t4lff;
wire [39:7] l2t5_mcu2_addr_t4lff;
wire [31:0] l2b4_sio_data_t4rff;
wire [1:0] l2b4_sio_parity_t4rff;
wire l2b4_sio_ctag_vld_t4rff;
wire l2b4_sio_ue_err_t4rff;
wire [38:0] l2t5_dmo_dout;
wire [38:0] l2t4_dmo_dout;
wire [7:0] sctag4_cpx_req_cq;
wire sctag4_cpx_atom_cq;
wire sctag4_pcx_stall_pq;
wire pcx_sctag4_data_rdy_px1;
wire [129:0] pcx_sctag4_data_px2;
wire pcx_sctag4_atm_px1;
wire [7:0] cpx_sctag4_grant_cx;
wire l2t4_rst_fatal_error;
wire l2t4_l2b4_fbrd_en_c3;
wire [2:0] l2t4_l2b4_fbrd_wl_c3;
wire [15:0] l2t4_l2b4_fbwr_wen_r2;
wire [2:0] l2t4_l2b4_fbwr_wl_r2;
wire l2t4_l2b4_fbd_stdatasel_c3;
wire [3:0] l2t4_l2b4_wbwr_wen_c6;
wire [2:0] l2t4_l2b4_wbwr_wl_c6;
wire l2t4_l2b4_wbrd_en_r0;
wire [2:0] l2t4_l2b4_wbrd_wl_r0;
wire [2:0] l2t4_l2b4_ev_dword_r0;
wire l2t4_l2b4_evict_en_r0;
wire l2b4_l2t4_ev_uerr_r5;
wire l2b4_l2t4_ev_cerr_r5;
wire [15:0] l2t4_l2b4_rdma_wren_s2;
wire [1:0] l2t4_l2b4_rdma_wrwl_s2;
wire [1:0] l2t4_l2b4_rdma_rdwl_r0;
wire l2t4_l2b4_rdma_rden_r0;
wire l2t4_l2b4_ctag_en_c7;
wire [31:0] l2t4_l2b4_ctag_c7;
wire [3:0] l2t4_l2b4_word_c7;
wire l2t4_l2b4_req_en_c7;
wire l2t4_l2b4_word_vld_c7;
wire l2b4_l2t4_rdma_uerr_c10;
wire l2b4_l2t4_rdma_cerr_c10;
wire l2b4_l2t4_rdma_notdata_c10;
wire l2t4_mcu2_rd_req;
wire l2t4_mcu2_rd_dummy_req;
wire [2:0] l2t4_mcu2_rd_req_id;
wire [39:7] l2t4_mcu2_addr;
wire l2t4_mcu2_addr_5;
wire l2t4_mcu2_wr_req;
wire mcu2_l2t4_rd_ack;
wire mcu2_l2t4_wr_ack;
wire [1:0] mcu2_l2t4_qword_id_r0;
wire mcu2_l2t4_data_vld_r0;
wire [2:0] mcu2_l2t4_rd_req_id_r0;
wire mcu2_l2t4_secc_err_r2;
wire mcu2_l2t4_mecc_err_r2;
wire mcu2_l2t4_scb_mecc_err;
wire mcu2_l2t4_scb_secc_err;
wire gl_rst_l2_por_c1m;
wire gl_rst_l2_wmr_c1m;
wire tcu_soc2_scan_out;
wire l2t4_scan_out;
wire tcu_l2t4_mbist_start;
wire tcu_l2t4_mbist_scan_in;
wire l2t4_tcu_mbist_done;
wire l2t4_tcu_mbist_fail;
wire l2t4_tcu_mbist_scan_out;
wire efu_l2t4_fuse_clr;
wire efu_l2t4_fuse_xfer_en;
wire l2t4_efu_fuse_data;
wire l2t4_efu_fuse_xfer_en;
wire cmp_gclk_c1_l2t4;
wire gl_l2t4_clk_stop;
wire tcu_l2t4_shscan_scan_in;
wire l2t4_tcu_shscan_scan_out;
wire tcu_l2t4_shscan_clk_stop;
wire [23:0] l2t4_rep_out0_unused;
wire [23:0] l2t4_rep_out1_unused;
wire [23:0] l2t4_rep_out2_unused;
wire [23:0] l2t4_rep_out3_unused;
wire [23:0] l2t4_rep_out4_unused;
wire [23:0] l2t4_rep_out5_unused;
wire [23:0] l2t4_rep_out6_unused;
wire [23:0] l2t4_rep_out7_unused;
wire [23:0] l2t4_rep_out8_unused;
wire [23:0] l2t4_rep_out9_unused;
wire [23:0] l2t4_rep_out10_unused;
wire [23:0] l2t4_rep_out11_unused;
wire [23:0] l2t4_rep_out12_unused;
wire [23:0] l2t4_rep_out13_unused;
wire [23:0] l2t4_rep_out14_unused;
wire [23:0] l2t4_rep_out15_unused;
wire [23:0] l2t4_rep_out16_unused;
wire [23:0] l2t4_rep_out17_unused;
wire [23:0] l2t4_rep_out18_unused;
wire [23:0] l2t4_rep_out19_unused;
wire mcu1_tcu_mbist_fail;
wire [1:0] ncu_tcu_mbist_done;
wire [1:0] ncu_tcu_mbist_fail;
wire mcu0_tcu_mbist_done;
wire mcu0_tcu_mbist_fail;
wire mcu1_tcu_mbist_done;
wire mcu2_l2t5_rd_ack;
wire mcu2_l2t5_wr_ack;
wire [1:0] mcu2_l2t5_qword_id_r0;
wire mcu2_l2t5_data_vld_r0;
wire [2:0] mcu2_l2t5_rd_req_id_r0;
wire mcu2_l2t5_secc_err_r2;
wire mcu2_l2t5_mecc_err_r2;
wire mcu2_l2t5_scb_mecc_err;
wire mcu2_l2t5_scb_secc_err;
wire mcu1_tcu_mbist_fail_t5lff;
wire ncu_tcu_mbist_done_t5lff_0;
wire ncu_tcu_mbist_fail_t5lff_0;
wire [1:0] l2b0_sio_parity_t5lff;
wire l2t0_tcu_mbist_done_t5lff;
wire l2t0_tcu_mbist_fail_t5lff;
wire spc0_tcu_mbist_done_t5lff;
wire spc0_tcu_mbist_fail_t5lff;
wire mcu0_tcu_mbist_done_t5lff;
wire mcu0_tcu_mbist_fail_t5lff;
wire mcu1_tcu_mbist_done_t5lff;
wire spc0_softstop_request_t5lff;
wire spc0_hardstop_request_t5lff;
wire spc0_trigger_pulse_t5lff;
wire spc0_ss_complete_t5lff;
wire mcu2_l2t5_rd_ack_t5rff;
wire mcu2_l2t5_wr_ack_t5rff;
wire [1:0] mcu2_l2t5_qword_id_r0_t5rff;
wire mcu2_l2t5_data_vld_r0_t5rff;
wire [2:0] mcu2_l2t5_rd_req_id_r0_t5rff;
wire mcu2_l2t5_secc_err_r2_t5rff;
wire mcu2_l2t5_mecc_err_r2_t5rff;
wire mcu2_l2t5_scb_mecc_err_t5rff;
wire mcu2_l2t5_scb_secc_err_t5rff;
wire l2t5_dbg1_err_event;
wire [7:0] sctag5_cpx_req_cq;
wire sctag5_cpx_atom_cq;
wire sctag5_pcx_stall_pq;
wire pcx_sctag5_data_rdy_px1;
wire [129:0] pcx_sctag5_data_px2;
wire pcx_sctag5_atm_px1;
wire [7:0] cpx_sctag5_grant_cx;
wire l2t5_rst_fatal_error;
wire l2t5_l2b5_fbrd_en_c3;
wire [2:0] l2t5_l2b5_fbrd_wl_c3;
wire [15:0] l2t5_l2b5_fbwr_wen_r2;
wire [2:0] l2t5_l2b5_fbwr_wl_r2;
wire l2t5_l2b5_fbd_stdatasel_c3;
wire [3:0] l2t5_l2b5_wbwr_wen_c6;
wire [2:0] l2t5_l2b5_wbwr_wl_c6;
wire l2t5_l2b5_wbrd_en_r0;
wire [2:0] l2t5_l2b5_wbrd_wl_r0;
wire [2:0] l2t5_l2b5_ev_dword_r0;
wire l2t5_l2b5_evict_en_r0;
wire l2b5_l2t5_ev_uerr_r5;
wire l2b5_l2t5_ev_cerr_r5;
wire [15:0] l2t5_l2b5_rdma_wren_s2;
wire [1:0] l2t5_l2b5_rdma_wrwl_s2;
wire [1:0] l2t5_l2b5_rdma_rdwl_r0;
wire l2t5_l2b5_rdma_rden_r0;
wire l2t5_l2b5_ctag_en_c7;
wire [31:0] l2t5_l2b5_ctag_c7;
wire [3:0] l2t5_l2b5_word_c7;
wire l2t5_l2b5_req_en_c7;
wire l2t5_l2b5_word_vld_c7;
wire l2b5_l2t5_rdma_uerr_c10;
wire l2b5_l2t5_rdma_cerr_c10;
wire l2b5_l2t5_rdma_notdata_c10;
wire tcu_l2t5_mbist_start;
wire tcu_l2t5_mbist_scan_in;
wire l2t5_tcu_mbist_done;
wire l2t5_tcu_mbist_fail;
wire l2t5_tcu_mbist_scan_out;
wire efu_l2t5_fuse_clr;
wire efu_l2t5_fuse_xfer_en;
wire l2t5_efu_fuse_data;
wire l2t5_efu_fuse_xfer_en;
wire cmp_gclk_c2_l2t5;
wire gl_l2t5_clk_stop;
wire tcu_l2t5_shscan_scan_in;
wire l2t5_tcu_shscan_scan_out;
wire tcu_l2t5_shscan_clk_stop;
wire [23:0] l2t5_rep_out0_unused;
wire [23:0] l2t5_rep_out1_unused;
wire [23:0] l2t5_rep_out2_unused;
wire [23:0] l2t5_rep_out3_unused;
wire [23:0] l2t5_rep_out4_unused;
wire [23:0] l2t5_rep_out5_unused;
wire [23:0] l2t5_rep_out6_unused;
wire [23:0] l2t5_rep_out7_unused;
wire [23:0] l2t5_rep_out8_unused;
wire [23:0] l2t5_rep_out9_unused;
wire [23:0] l2t5_rep_out10_unused;
wire [23:0] l2t5_rep_out11_unused;
wire [23:0] l2t5_rep_out12_unused;
wire [23:0] l2t5_rep_out13_unused;
wire [23:0] l2t5_rep_out14_unused;
wire [23:0] l2t5_rep_out15_unused;
wire [23:0] l2t5_rep_out16_unused;
wire [23:0] l2t5_rep_out17_unused;
wire [23:0] l2t5_rep_out18_unused;
wire [23:0] l2t5_rep_out19_unused;
wire [31:0] sii_l2t6_req;
wire sii_l2t6_req_vld;
wire [31:0] sii_l2t7_req;
wire sii_l2t7_req_vld;
wire l2t7_mcu3_rd_req;
wire l2t7_mcu3_rd_dummy_req;
wire [2:0] l2t7_mcu3_rd_req_id;
wire l2t7_mcu3_wr_req;
wire l2t7_mcu3_addr_5;
wire [39:7] l2t7_mcu3_addr;
wire [31:0] sii_l2t6_req_t6lff;
wire sii_l2t6_req_vld_t6lff;
wire [31:0] sii_l2t7_req_t6lff;
wire sii_l2t7_req_vld_t6lff;
wire l2t7_mcu3_rd_req_t6lff;
wire l2t7_mcu3_rd_dummy_req_t6lff;
wire [2:0] l2t7_mcu3_rd_req_id_t6lff;
wire l2t7_mcu3_wr_req_t6lff;
wire l2t7_mcu3_addr_5_t6lff;
wire [39:7] l2t7_mcu3_addr_t6lff;
wire [38:0] l2t7_dmo_dout;
wire [38:0] l2t6_dmo_dout;
wire [7:0] sctag6_cpx_req_cq;
wire sctag6_cpx_atom_cq;
wire sctag6_pcx_stall_pq;
wire pcx_sctag6_data_rdy_px1;
wire [129:0] pcx_sctag6_data_px2;
wire pcx_sctag6_atm_px1;
wire [7:0] cpx_sctag6_grant_cx;
wire l2t6_rst_fatal_error;
wire l2t6_l2b6_fbrd_en_c3;
wire [2:0] l2t6_l2b6_fbrd_wl_c3;
wire [15:0] l2t6_l2b6_fbwr_wen_r2;
wire [2:0] l2t6_l2b6_fbwr_wl_r2;
wire l2t6_l2b6_fbd_stdatasel_c3;
wire [3:0] l2t6_l2b6_wbwr_wen_c6;
wire [2:0] l2t6_l2b6_wbwr_wl_c6;
wire l2t6_l2b6_wbrd_en_r0;
wire [2:0] l2t6_l2b6_wbrd_wl_r0;
wire [2:0] l2t6_l2b6_ev_dword_r0;
wire l2t6_l2b6_evict_en_r0;
wire l2b6_l2t6_ev_uerr_r5;
wire l2b6_l2t6_ev_cerr_r5;
wire [15:0] l2t6_l2b6_rdma_wren_s2;
wire [1:0] l2t6_l2b6_rdma_wrwl_s2;
wire [1:0] l2t6_l2b6_rdma_rdwl_r0;
wire l2t6_l2b6_rdma_rden_r0;
wire l2t6_l2b6_ctag_en_c7;
wire [31:0] l2t6_l2b6_ctag_c7;
wire [3:0] l2t6_l2b6_word_c7;
wire l2t6_l2b6_req_en_c7;
wire l2t6_l2b6_word_vld_c7;
wire l2b6_l2t6_rdma_uerr_c10;
wire l2b6_l2t6_rdma_cerr_c10;
wire l2b6_l2t6_rdma_notdata_c10;
wire l2t6_mcu3_rd_req;
wire l2t6_mcu3_rd_dummy_req;
wire [2:0] l2t6_mcu3_rd_req_id;
wire [39:7] l2t6_mcu3_addr;
wire l2t6_mcu3_addr_5;
wire l2t6_mcu3_wr_req;
wire mcu3_l2t6_rd_ack;
wire mcu3_l2t6_wr_ack;
wire [1:0] mcu3_l2t6_qword_id_r0;
wire mcu3_l2t6_data_vld_r0;
wire [2:0] mcu3_l2t6_rd_req_id_r0;
wire mcu3_l2t6_secc_err_r2;
wire mcu3_l2t6_mecc_err_r2;
wire mcu3_l2t6_scb_mecc_err;
wire mcu3_l2t6_scb_secc_err;
wire tcu_soc3_scan_out;
wire l2t6_scan_out;
wire tcu_l2t6_mbist_start;
wire tcu_l2t6_mbist_scan_in;
wire l2t6_tcu_mbist_done;
wire l2t6_tcu_mbist_fail;
wire l2t6_tcu_mbist_scan_out;
wire efu_l2t6_fuse_clr;
wire efu_l2t6_fuse_xfer_en;
wire l2t6_efu_fuse_data;
wire l2t6_efu_fuse_xfer_en;
wire cmp_gclk_c1_l2t6;
wire gl_l2t6_clk_stop;
wire tcu_l2t6_shscan_scan_in;
wire l2t6_tcu_shscan_scan_out;
wire tcu_l2t6_shscan_clk_stop;
wire [23:0] l2t6_rep_out0_unused;
wire [23:0] l2t6_rep_out1_unused;
wire [23:0] l2t6_rep_out2_unused;
wire [23:0] l2t6_rep_out3_unused;
wire [23:0] l2t6_rep_out4_unused;
wire [23:0] l2t6_rep_out5_unused;
wire [23:0] l2t6_rep_out6_unused;
wire [23:0] l2t6_rep_out7_unused;
wire [23:0] l2t6_rep_out8_unused;
wire [23:0] l2t6_rep_out9_unused;
wire [23:0] l2t6_rep_out10_unused;
wire [23:0] l2t6_rep_out11_unused;
wire [23:0] l2t6_rep_out12_unused;
wire [23:0] l2t6_rep_out13_unused;
wire [23:0] l2t6_rep_out14_unused;
wire [23:0] l2t6_rep_out15_unused;
wire [23:0] l2t6_rep_out16_unused;
wire [23:0] l2t6_rep_out17_unused;
wire [23:0] l2t6_rep_out18_unused;
wire [23:0] l2t6_rep_out19_unused;
wire mcu3_l2t7_rd_ack;
wire mcu3_l2t7_wr_ack;
wire [1:0] mcu3_l2t7_qword_id_r0;
wire mcu3_l2t7_data_vld_r0;
wire [2:0] mcu3_l2t7_rd_req_id_r0;
wire mcu3_l2t7_secc_err_r2;
wire mcu3_l2t7_mecc_err_r2;
wire mcu3_l2t7_scb_mecc_err;
wire mcu3_l2t7_scb_secc_err;
wire l2t2_tcu_mbist_done_t7lff;
wire l2t2_tcu_mbist_fail_t7lff;
wire spc2_tcu_mbist_done_t7lff;
wire spc2_tcu_mbist_fail_t7lff;
wire spc2_softstop_request_t7lff;
wire spc2_hardstop_request_t7lff;
wire spc2_trigger_pulse_t7lff;
wire spc2_ss_complete_t7lff;
wire mcu3_l2t7_rd_ack_t7rff;
wire mcu3_l2t7_wr_ack_t7rff;
wire [1:0] mcu3_l2t7_qword_id_r0_t7rff;
wire mcu3_l2t7_data_vld_r0_t7rff;
wire [2:0] mcu3_l2t7_rd_req_id_r0_t7rff;
wire mcu3_l2t7_secc_err_r2_t7rff;
wire mcu3_l2t7_mecc_err_r2_t7rff;
wire mcu3_l2t7_scb_mecc_err_t7rff;
wire mcu3_l2t7_scb_secc_err_t7rff;
wire [7:0] sctag7_cpx_req_cq;
wire sctag7_cpx_atom_cq;
wire sctag7_pcx_stall_pq;
wire pcx_sctag7_data_rdy_px1;
wire [129:0] pcx_sctag7_data_px2;
wire pcx_sctag7_atm_px1;
wire [7:0] cpx_sctag7_grant_cx;
wire l2t7_rst_fatal_error;
wire l2t7_l2b7_fbrd_en_c3;
wire [2:0] l2t7_l2b7_fbrd_wl_c3;
wire [15:0] l2t7_l2b7_fbwr_wen_r2;
wire [2:0] l2t7_l2b7_fbwr_wl_r2;
wire l2t7_l2b7_fbd_stdatasel_c3;
wire [3:0] l2t7_l2b7_wbwr_wen_c6;
wire [2:0] l2t7_l2b7_wbwr_wl_c6;
wire l2t7_l2b7_wbrd_en_r0;
wire [2:0] l2t7_l2b7_wbrd_wl_r0;
wire [2:0] l2t7_l2b7_ev_dword_r0;
wire l2t7_l2b7_evict_en_r0;
wire l2b7_l2t7_ev_uerr_r5;
wire l2b7_l2t7_ev_cerr_r5;
wire [15:0] l2t7_l2b7_rdma_wren_s2;
wire [1:0] l2t7_l2b7_rdma_wrwl_s2;
wire [1:0] l2t7_l2b7_rdma_rdwl_r0;
wire l2t7_l2b7_rdma_rden_r0;
wire l2t7_l2b7_ctag_en_c7;
wire [31:0] l2t7_l2b7_ctag_c7;
wire [3:0] l2t7_l2b7_word_c7;
wire l2t7_l2b7_req_en_c7;
wire l2t7_l2b7_word_vld_c7;
wire l2b7_l2t7_rdma_uerr_c10;
wire l2b7_l2t7_rdma_cerr_c10;
wire l2b7_l2t7_rdma_notdata_c10;
wire tcu_l2t7_mbist_start;
wire tcu_l2t7_mbist_scan_in;
wire l2t7_tcu_mbist_done;
wire l2t7_tcu_mbist_fail;
wire l2t7_tcu_mbist_scan_out;
wire efu_l2t7_fuse_clr;
wire efu_l2t7_fuse_xfer_en;
wire l2t7_efu_fuse_data;
wire l2t7_efu_fuse_xfer_en;
wire cmp_gclk_c2_l2t7;
wire gl_l2t7_clk_stop;
wire tcu_l2t7_shscan_scan_in;
wire l2t7_tcu_shscan_scan_out;
wire tcu_l2t7_shscan_clk_stop;
wire [23:0] l2t7_rep_out0_unused;
wire [23:0] l2t7_rep_out1_unused;
wire [23:0] l2t7_rep_out2_unused;
wire [23:0] l2t7_rep_out3_unused;
wire [23:0] l2t7_rep_out4_unused;
wire [23:0] l2t7_rep_out5_unused;
wire [23:0] l2t7_rep_out6_unused;
wire [23:0] l2t7_rep_out7_unused;
wire [23:0] l2t7_rep_out8_unused;
wire [23:0] l2t7_rep_out9_unused;
wire [23:0] l2t7_rep_out10_unused;
wire [23:0] l2t7_rep_out11_unused;
wire [23:0] l2t7_rep_out12_unused;
wire [23:0] l2t7_rep_out13_unused;
wire [23:0] l2t7_rep_out14_unused;
wire [23:0] l2t7_rep_out15_unused;
wire [23:0] l2t7_rep_out16_unused;
wire [23:0] l2t7_rep_out17_unused;
wire [23:0] l2t7_rep_out18_unused;
wire [23:0] l2t7_rep_out19_unused;
wire cmp_gclk_c3_l2b0;
wire gl_l2b0_clk_stop;
wire efu_l2b0246_fuse_data;
wire efu_l2b0_fuse_xfer_en;
wire efu_l2b0_fuse_clr;
wire l2b0_efu_fuse_xfer_en;
wire l2b0_efu_fuse_data;
wire [127:0] mcu0_l2b01_data_r2;
wire [27:0] mcu0_l2b01_ecc_r2;
wire tcu_l2b0_mbist_scan_in;
wire l2b0_tcu_mbist_scan_out;
wire l2b0_mcu0_data_mecc_r5;
wire [63:0] l2b0_mcu0_wr_data_r5;
wire l2b0_mcu0_data_vld_r5;
wire tcu_soch_scan_out;
wire l2b0_scan_out;
wire cmp_gclk_c3_l2b1;
wire gl_l2b1_clk_stop;
wire efu_l2b1357_fuse_data;
wire efu_l2b1_fuse_xfer_en;
wire efu_l2b1_fuse_clr;
wire l2b1_efu_fuse_xfer_en;
wire l2b1_efu_fuse_data;
wire tcu_l2b1_mbist_scan_in;
wire l2b1_tcu_mbist_scan_out;
wire l2b1_mcu0_data_mecc_r5;
wire [63:0] l2b1_mcu0_wr_data_r5;
wire l2b1_mcu0_data_vld_r5;
wire l2b1_scan_out;
wire cmp_gclk_c3_l2b2;
wire gl_l2b2_clk_stop;
wire efu_l2b2_fuse_xfer_en;
wire efu_l2b2_fuse_clr;
wire l2b2_efu_fuse_xfer_en;
wire l2b2_efu_fuse_data;
wire [127:0] mcu1_l2b23_data_r2;
wire [27:0] mcu1_l2b23_ecc_r2;
wire tcu_l2b2_mbist_scan_in;
wire l2b2_tcu_mbist_scan_out;
wire l2b2_mcu1_data_mecc_r5;
wire [63:0] l2b2_mcu1_wr_data_r5;
wire l2b2_mcu1_data_vld_r5;
wire l2b2_scan_out;
wire cmp_gclk_c3_l2b3;
wire gl_l2b3_clk_stop;
wire efu_l2b3_fuse_xfer_en;
wire efu_l2b3_fuse_clr;
wire l2b3_efu_fuse_xfer_en;
wire l2b3_efu_fuse_data;
wire tcu_l2b3_mbist_scan_in;
wire l2b3_tcu_mbist_scan_out;
wire l2b3_mcu1_data_mecc_r5;
wire [63:0] l2b3_mcu1_wr_data_r5;
wire l2b3_mcu1_data_vld_r5;
wire l2b3_scan_out;
wire cmp_gclk_c1_l2b4;
wire gl_l2b4_clk_stop;
wire efu_l2b4_fuse_xfer_en;
wire efu_l2b4_fuse_clr;
wire l2b4_efu_fuse_xfer_en;
wire l2b4_efu_fuse_data;
wire [127:0] mcu2_l2b45_data_r2;
wire [27:0] mcu2_l2b45_ecc_r2;
wire tcu_l2b4_mbist_start;
wire l2b4_tcu_mbist_done;
wire l2b4_tcu_mbist_fail;
wire tcu_l2b4_mbist_scan_in;
wire l2b4_tcu_mbist_scan_out;
wire l2b4_mcu2_data_mecc_r5;
wire [63:0] l2b4_mcu2_wr_data_r5;
wire l2b4_mcu2_data_vld_r5;
wire l2b4_scan_out;
wire cmp_gclk_c1_l2b5;
wire gl_l2b5_clk_stop;
wire efu_l2b5_fuse_xfer_en;
wire efu_l2b5_fuse_clr;
wire l2b5_efu_fuse_xfer_en;
wire l2b5_efu_fuse_data;
wire l2b5_sio_ctag_vld;
wire [31:0] l2b5_sio_data;
wire [1:0] l2b5_sio_parity;
wire l2b5_sio_ue_err;
wire tcu_l2b5_mbist_start;
wire l2b5_tcu_mbist_done;
wire l2b5_tcu_mbist_fail;
wire tcu_l2b5_mbist_scan_in;
wire l2b5_tcu_mbist_scan_out;
wire l2b5_mcu2_data_mecc_r5;
wire [63:0] l2b5_mcu2_wr_data_r5;
wire l2b5_mcu2_data_vld_r5;
wire l2b5_scan_out;
wire cmp_gclk_c1_l2b6;
wire gl_l2b6_clk_stop;
wire efu_l2b6_fuse_xfer_en;
wire efu_l2b6_fuse_clr;
wire l2b6_efu_fuse_xfer_en;
wire l2b6_efu_fuse_data;
wire l2b6_sio_ctag_vld;
wire [31:0] l2b6_sio_data;
wire [1:0] l2b6_sio_parity;
wire l2b6_sio_ue_err;
wire [127:0] mcu3_l2b67_data_r2;
wire [27:0] mcu3_l2b67_ecc_r2;
wire tcu_l2b6_mbist_start;
wire l2b6_tcu_mbist_done;
wire l2b6_tcu_mbist_fail;
wire tcu_l2b6_mbist_scan_in;
wire l2b6_tcu_mbist_scan_out;
wire l2b6_mcu3_data_mecc_r5;
wire [63:0] l2b6_mcu3_wr_data_r5;
wire l2b6_mcu3_data_vld_r5;
wire l2b6_scan_out;
wire cmp_gclk_c1_l2b7;
wire gl_l2b7_clk_stop;
wire efu_l2b7_fuse_xfer_en;
wire efu_l2b7_fuse_clr;
wire l2b7_efu_fuse_xfer_en;
wire l2b7_efu_fuse_data;
wire l2b7_sio_ctag_vld;
wire [31:0] l2b7_sio_data;
wire [1:0] l2b7_sio_parity;
wire l2b7_sio_ue_err;
wire tcu_l2b7_mbist_start;
wire l2b7_tcu_mbist_done;
wire l2b7_tcu_mbist_fail;
wire tcu_l2b7_mbist_scan_in;
wire l2b7_tcu_mbist_scan_out;
wire l2b7_mcu3_data_mecc_r5;
wire [63:0] l2b7_mcu3_wr_data_r5;
wire l2b7_mcu3_data_vld_r5;
wire l2b7_scan_out;
wire cmp_gclk_c4_mcu0;
wire gl_mcu0_clk_stop;
wire gl_mcu0_dr_clk_stop;
wire gl_mcu0_io_clk_stop;
wire dr_gclk_c4_mcu0;
wire gl_dr_sync_en_c3t;
wire tcu_mcu0_fbd_clk_stop;
wire mcu0_pt_sync_out;
wire mcu1_pt_sync_out;
wire mcu2_pt_sync_out;
wire mcu3_pt_sync_out;
wire [3:0] mcu0_ncu_data;
wire mcu0_ncu_stall;
wire mcu0_ncu_vld;
wire [3:0] ncu_mcu0_data;
wire ncu_mcu0_stall;
wire ncu_mcu0_vld;
wire mcu0_ncu_ecc;
wire mcu0_ncu_fbr;
wire ncu_mcu0_ecci;
wire ncu_mcu0_fbui;
wire ncu_mcu0_fbri;
wire [119:0] mcu0_fsr0_data;
wire [119:0] mcu0_fsr1_data;
wire mcu0_fsr0_cfgpll_enpll;
wire mcu0_fsr1_cfgpll_enpll;
wire [1:0] mcu0_fsr01_cfgpll_lb;
wire [3:0] mcu0_fsr01_cfgpll_mpy;
wire mcu0_fsr0_cfgrx_enrx;
wire mcu0_fsr1_cfgrx_enrx;
wire mcu0_fsr0_cfgrx_align;
wire mcu0_fsr1_cfgrx_align;
wire [13:0] mcu0_fsr0_cfgrx_invpair;
wire [13:0] mcu0_fsr1_cfgrx_invpair;
wire [3:0] mcu0_fsr01_cfgrx_eq;
wire [2:0] mcu0_fsr01_cfgrx_cdr;
wire [2:0] mcu0_fsr01_cfgrx_term;
wire mcu0_fsr0_cfgtx_entx;
wire mcu0_fsr1_cfgtx_entx;
wire mcu0_fsr0_cfgtx_enidl;
wire mcu0_fsr1_cfgtx_enidl;
wire [9:0] mcu0_fsr0_cfgtx_invpair;
wire [9:0] mcu0_fsr1_cfgtx_invpair;
wire mcu0_fsr01_cfgtx_enftp;
wire [3:0] mcu0_fsr01_cfgtx_de;
wire [2:0] mcu0_fsr01_cfgtx_swing;
wire mcu0_fsr01_cfgtx_cm;
wire [1:0] mcu0_fsr01_cfgrtx_rate;
wire mcu0_fsr0_cfgrx_entest;
wire mcu0_fsr1_cfgrx_entest;
wire mcu0_fsr0_cfgtx_entest;
wire mcu0_fsr1_cfgtx_entest;
wire [9:0] mcu0_fsr0_cfgtx_bstx;
wire [9:0] mcu0_fsr1_cfgtx_bstx;
wire [167:0] fsr0_mcu0_data;
wire [167:0] fsr1_mcu0_data;
wire [13:0] fsr0_mcu0_rxbclk;
wire [13:0] fsr1_mcu0_rxbclk;
wire [2:0] fsr0_mcu0_stspll_lock;
wire [2:0] fsr1_mcu0_stspll_lock;
wire [11:0] mcu0_fsr0_testcfg;
wire [11:0] mcu0_fsr1_testcfg;
wire [13:0] fsr0_mcu0_stsrx_sync;
wire [13:0] fsr1_mcu0_stsrx_sync;
wire [13:0] fsr0_mcu0_stsrx_losdtct;
wire [13:0] fsr1_mcu0_stsrx_losdtct;
wire [13:0] fsr0_mcu0_stsrx_testfail;
wire [13:0] fsr1_mcu0_stsrx_testfail;
wire [13:0] fsr0_mcu0_stsrx_bsrxp;
wire [13:0] fsr1_mcu0_stsrx_bsrxp;
wire [13:0] fsr0_mcu0_stsrx_bsrxn;
wire [13:0] fsr1_mcu0_stsrx_bsrxn;
wire [9:0] fsr0_mcu0_ststx_testfail;
wire [9:0] fsr1_mcu0_ststx_testfail;
wire tcu_mcu0_mbist_scan_in;
wire mcu0_tcu_mbist_scan_out;
wire tcu_sbs_scan_in;
wire mcu0_sbs_scan_out;
wire mcu0_scan_out;
wire cmp_gclk_c4_mcu1;
wire gl_mcu1_dr_clk_stop;
wire gl_mcu1_clk_stop;
wire gl_mcu1_io_clk_stop;
wire dr_gclk_c4_mcu1;
wire tcu_mcu1_fbd_clk_stop;
wire [3:0] mcu1_ncu_data;
wire mcu1_ncu_stall;
wire mcu1_ncu_vld;
wire [3:0] ncu_mcu1_data;
wire ncu_mcu1_stall;
wire ncu_mcu1_vld;
wire mcu1_ncu_ecc;
wire mcu1_ncu_fbr;
wire ncu_mcu1_ecci;
wire ncu_mcu1_fbui;
wire ncu_mcu1_fbri;
wire [119:0] mcu1_fsr2_data;
wire [119:0] mcu1_fsr3_data;
wire mcu1_fsr2_cfgpll_enpll;
wire mcu1_fsr3_cfgpll_enpll;
wire [1:0] mcu1_fsr23_cfgpll_lb;
wire [3:0] mcu1_fsr23_cfgpll_mpy;
wire mcu1_fsr2_cfgrx_enrx;
wire mcu1_fsr3_cfgrx_enrx;
wire mcu1_fsr2_cfgrx_align;
wire mcu1_fsr3_cfgrx_align;
wire [13:0] mcu1_fsr2_cfgrx_invpair;
wire [13:0] mcu1_fsr3_cfgrx_invpair;
wire [3:0] mcu1_fsr23_cfgrx_eq;
wire [2:0] mcu1_fsr23_cfgrx_cdr;
wire [2:0] mcu1_fsr23_cfgrx_term;
wire mcu1_fsr2_cfgtx_entx;
wire mcu1_fsr3_cfgtx_entx;
wire mcu1_fsr2_cfgtx_enidl;
wire mcu1_fsr3_cfgtx_enidl;
wire [9:0] mcu1_fsr2_cfgtx_invpair;
wire [9:0] mcu1_fsr3_cfgtx_invpair;
wire mcu1_fsr23_cfgtx_enftp;
wire [3:0] mcu1_fsr23_cfgtx_de;
wire [2:0] mcu1_fsr23_cfgtx_swing;
wire mcu1_fsr23_cfgtx_cm;
wire [1:0] mcu1_fsr23_cfgrtx_rate;
wire mcu1_fsr2_cfgrx_entest;
wire mcu1_fsr3_cfgrx_entest;
wire mcu1_fsr2_cfgtx_entest;
wire mcu1_fsr3_cfgtx_entest;
wire [9:0] mcu1_fsr2_cfgtx_bstx;
wire [9:0] mcu1_fsr3_cfgtx_bstx;
wire [167:0] fsr2_mcu1_data;
wire [167:0] fsr3_mcu1_data;
wire [13:0] fsr2_mcu1_rxbclk;
wire [13:0] fsr3_mcu1_rxbclk;
wire [2:0] fsr2_mcu1_stspll_lock;
wire [2:0] fsr3_mcu1_stspll_lock;
wire [11:0] mcu1_fsr2_testcfg;
wire [11:0] mcu1_fsr3_testcfg;
wire [13:0] fsr2_mcu1_stsrx_sync;
wire [13:0] fsr3_mcu1_stsrx_sync;
wire [13:0] fsr2_mcu1_stsrx_losdtct;
wire [13:0] fsr3_mcu1_stsrx_losdtct;
wire [13:0] fsr2_mcu1_stsrx_testfail;
wire [13:0] fsr3_mcu1_stsrx_testfail;
wire [13:0] fsr2_mcu1_stsrx_bsrxp;
wire [13:0] fsr3_mcu1_stsrx_bsrxp;
wire [13:0] fsr2_mcu1_stsrx_bsrxn;
wire [13:0] fsr3_mcu1_stsrx_bsrxn;
wire [9:0] fsr2_mcu1_ststx_testfail;
wire [9:0] fsr3_mcu1_ststx_testfail;
wire tcu_mcu1_mbist_scan_in;
wire mcu1_tcu_mbist_scan_out;
wire mcu1_sbs_scan_out;
wire tcu_socc_scan_out;
wire mcu1_scan_out;
wire cmp_gclk_c0_mcu2;
wire gl_mcu2_dr_clk_stop;
wire gl_mcu2_io_clk_stop;
wire gl_mcu2_clk_stop;
wire dr_gclk_c0_mcu2;
wire gl_dr_sync_en_c1m;
wire tcu_mcu2_fbd_clk_stop;
wire [3:0] mcu2_ncu_data;
wire mcu2_ncu_stall;
wire mcu2_ncu_vld;
wire [3:0] ncu_mcu2_data;
wire ncu_mcu2_stall;
wire ncu_mcu2_vld;
wire mcu2_ncu_ecc;
wire mcu2_ncu_fbr;
wire ncu_mcu2_ecci;
wire ncu_mcu2_fbui;
wire ncu_mcu2_fbri;
wire [119:0] mcu2_fsr4_data;
wire [119:0] mcu2_fsr5_data;
wire mcu2_fsr4_cfgpll_enpll;
wire mcu2_fsr5_cfgpll_enpll;
wire [1:0] mcu2_fsr45_cfgpll_lb;
wire [3:0] mcu2_fsr45_cfgpll_mpy;
wire mcu2_fsr4_cfgrx_enrx;
wire mcu2_fsr5_cfgrx_enrx;
wire mcu2_fsr4_cfgrx_align;
wire mcu2_fsr5_cfgrx_align;
wire [13:0] mcu2_fsr4_cfgrx_invpair;
wire [13:0] mcu2_fsr5_cfgrx_invpair;
wire [3:0] mcu2_fsr45_cfgrx_eq;
wire [2:0] mcu2_fsr45_cfgrx_cdr;
wire [2:0] mcu2_fsr45_cfgrx_term;
wire mcu2_fsr4_cfgtx_entx;
wire mcu2_fsr5_cfgtx_entx;
wire mcu2_fsr4_cfgtx_enidl;
wire mcu2_fsr5_cfgtx_enidl;
wire [9:0] mcu2_fsr4_cfgtx_invpair;
wire [9:0] mcu2_fsr5_cfgtx_invpair;
wire mcu2_fsr45_cfgtx_enftp;
wire [3:0] mcu2_fsr45_cfgtx_de;
wire [2:0] mcu2_fsr45_cfgtx_swing;
wire mcu2_fsr45_cfgtx_cm;
wire [1:0] mcu2_fsr45_cfgrtx_rate;
wire mcu2_fsr4_cfgrx_entest;
wire mcu2_fsr5_cfgrx_entest;
wire mcu2_fsr4_cfgtx_entest;
wire mcu2_fsr5_cfgtx_entest;
wire [9:0] mcu2_fsr4_cfgtx_bstx;
wire [9:0] mcu2_fsr5_cfgtx_bstx;
wire [167:0] fsr4_mcu2_data;
wire [167:0] fsr5_mcu2_data;
wire [13:0] fsr4_mcu2_rxbclk;
wire [13:0] fsr5_mcu2_rxbclk;
wire [2:0] fsr4_mcu2_stspll_lock;
wire [2:0] fsr5_mcu2_stspll_lock;
wire [11:0] mcu2_fsr4_testcfg;
wire [11:0] mcu2_fsr5_testcfg;
wire [13:0] fsr4_mcu2_stsrx_sync;
wire [13:0] fsr5_mcu2_stsrx_sync;
wire [13:0] fsr4_mcu2_stsrx_losdtct;
wire [13:0] fsr5_mcu2_stsrx_losdtct;
wire [13:0] fsr4_mcu2_stsrx_testfail;
wire [13:0] fsr5_mcu2_stsrx_testfail;
wire [13:0] fsr4_mcu2_stsrx_bsrxp;
wire [13:0] fsr5_mcu2_stsrx_bsrxp;
wire [13:0] fsr4_mcu2_stsrx_bsrxn;
wire [13:0] fsr5_mcu2_stsrx_bsrxn;
wire [9:0] fsr4_mcu2_ststx_testfail;
wire [9:0] fsr5_mcu2_ststx_testfail;
wire tcu_mcu2_mbist_start;
wire mcu2_tcu_mbist_done;
wire mcu2_tcu_mbist_fail;
wire tcu_mcu2_mbist_scan_in;
wire mcu2_tcu_mbist_scan_out;
wire mcu3_sbs_scan_out;
wire mcu2_sbs_scan_out;
wire mcu2_scan_out;
wire cmp_gclk_c0_mcu3;
wire gl_mcu3_dr_clk_stop;
wire gl_mcu3_io_clk_stop;
wire gl_mcu3_clk_stop;
wire dr_gclk_c0_mcu3;
wire tcu_mcu3_fbd_clk_stop;
wire [3:0] mcu3_ncu_data;
wire mcu3_ncu_stall;
wire mcu3_ncu_vld;
wire [3:0] ncu_mcu3_data;
wire ncu_mcu3_stall;
wire ncu_mcu3_vld;
wire mcu3_ncu_ecc;
wire mcu3_ncu_fbr;
wire ncu_mcu3_ecci;
wire ncu_mcu3_fbui;
wire ncu_mcu3_fbri;
wire [119:0] mcu3_fsr6_data;
wire [119:0] mcu3_fsr7_data;
wire mcu3_fsr6_cfgpll_enpll;
wire mcu3_fsr7_cfgpll_enpll;
wire [1:0] mcu3_fsr67_cfgpll_lb;
wire [3:0] mcu3_fsr67_cfgpll_mpy;
wire mcu3_fsr6_cfgrx_enrx;
wire mcu3_fsr7_cfgrx_enrx;
wire mcu3_fsr6_cfgrx_align;
wire mcu3_fsr7_cfgrx_align;
wire [13:0] mcu3_fsr6_cfgrx_invpair;
wire [13:0] mcu3_fsr7_cfgrx_invpair;
wire [3:0] mcu3_fsr67_cfgrx_eq;
wire [2:0] mcu3_fsr67_cfgrx_cdr;
wire [2:0] mcu3_fsr67_cfgrx_term;
wire mcu3_fsr6_cfgtx_entx;
wire mcu3_fsr7_cfgtx_entx;
wire mcu3_fsr6_cfgtx_enidl;
wire mcu3_fsr7_cfgtx_enidl;
wire [9:0] mcu3_fsr6_cfgtx_invpair;
wire [9:0] mcu3_fsr7_cfgtx_invpair;
wire mcu3_fsr67_cfgtx_enftp;
wire [3:0] mcu3_fsr67_cfgtx_de;
wire [2:0] mcu3_fsr67_cfgtx_swing;
wire mcu3_fsr67_cfgtx_cm;
wire [1:0] mcu3_fsr67_cfgrtx_rate;
wire mcu3_fsr6_cfgrx_entest;
wire mcu3_fsr7_cfgrx_entest;
wire mcu3_fsr6_cfgtx_entest;
wire mcu3_fsr7_cfgtx_entest;
wire [9:0] mcu3_fsr6_cfgtx_bstx;
wire [9:0] mcu3_fsr7_cfgtx_bstx;
wire [167:0] fsr6_mcu3_data;
wire [167:0] fsr7_mcu3_data;
wire [13:0] fsr6_mcu3_rxbclk;
wire [13:0] fsr7_mcu3_rxbclk;
wire [2:0] fsr6_mcu3_stspll_lock;
wire [2:0] fsr7_mcu3_stspll_lock;
wire [11:0] mcu3_fsr6_testcfg;
wire [11:0] mcu3_fsr7_testcfg;
wire [13:0] fsr6_mcu3_stsrx_sync;
wire [13:0] fsr7_mcu3_stsrx_sync;
wire [13:0] fsr6_mcu3_stsrx_losdtct;
wire [13:0] fsr7_mcu3_stsrx_losdtct;
wire [13:0] fsr6_mcu3_stsrx_testfail;
wire [13:0] fsr7_mcu3_stsrx_testfail;
wire [13:0] fsr6_mcu3_stsrx_bsrxp;
wire [13:0] fsr7_mcu3_stsrx_bsrxp;
wire [13:0] fsr6_mcu3_stsrx_bsrxn;
wire [13:0] fsr7_mcu3_stsrx_bsrxn;
wire [9:0] fsr6_mcu3_ststx_testfail;
wire [9:0] fsr7_mcu3_ststx_testfail;
wire tcu_mcu3_mbist_start;
wire mcu3_tcu_mbist_done;
wire mcu3_tcu_mbist_fail;
wire tcu_mcu3_mbist_scan_in;
wire mcu3_tcu_mbist_scan_out;
wire ncu_scan_out;
wire mcu3_scan_out;
wire dr_gclk_c4_fsr0_2;
wire dr_gclk_c4_fsr0_1;
wire dr_gclk_c4_fsr0_0;
wire efu_mcu_fclk;
wire efu_mcu_fclrz;
wire efu_mcu_fdi;
wire [2:0] fsr0_fdo;
wire [2:0] fsr0_stciq;
wire tcu_stcid;
wire [7:0] mio_fsr_testclkr;
wire [7:0] mio_fsr_testclkt;
wire dr_gclk_c4_fsr1_2;
wire dr_gclk_c4_fsr1_1;
wire dr_gclk_c4_fsr1_0;
wire [2:0] fsr1_fdo;
wire [2:0] fsr1_stciq;
wire dr_gclk_c4_fsr2_2;
wire dr_gclk_c4_fsr2_1;
wire dr_gclk_c4_fsr2_0;
wire [2:0] fsr2_fdo;
wire [2:0] fsr2_stciq;
wire dr_gclk_c4_fsr3_2;
wire dr_gclk_c4_fsr3_1;
wire dr_gclk_c4_fsr3_0;
wire [2:0] fsr3_fdo;
wire [2:0] fsr3_stciq;
wire tcu_srd_atpgd;
wire fsr_left_atpgq;
wire dr_gclk_c0_fsr4_2;
wire dr_gclk_c0_fsr4_1;
wire dr_gclk_c0_fsr4_0;
wire [2:0] fsr4_fdo;
wire [2:0] fsr5_stciq;
wire [2:0] fsr4_stciq;
wire dr_gclk_c0_fsr5_2;
wire dr_gclk_c0_fsr5_1;
wire dr_gclk_c0_fsr5_0;
wire [2:0] fsr5_fdo;
wire [2:0] fsr6_stciq;
wire dr_gclk_c0_fsr6_2;
wire dr_gclk_c0_fsr6_1;
wire dr_gclk_c0_fsr6_0;
wire [2:0] fsr6_fdo;
wire [2:0] fsr7_stciq;
wire fsr_bottom_atpgq;
wire srd_tcu_atpgq;
wire dr_gclk_c2_fsr7_2;
wire dr_gclk_c2_fsr7_1;
wire dr_gclk_c2_fsr7_0;
wire [1:0] fsr7_fdo;
wire mcu_efu_fdo;
wire cmp_gclk_c3_sii;
wire gl_sii_clk_stop;
wire gl_sii_io_clk_stop;
wire sii_scan_out;
wire cmp_gclk_c1_sio;
wire gl_sio_clk_stop;
wire gl_sio_io_clk_stop;
wire sio_scan_out;
wire cmp_gclk_c3_ncu;
wire gl_ncu_io_clk_stop;
wire gl_ncu_clk_stop;
wire tcu_socg_scan_out;
wire cmp_gclk_c1_efu;
wire gl_efu_io_clk_stop;
wire gl_efu_clk_stop;
wire efu_scan_out;
wire [6:0] tcu_efu_rowaddr;
wire [4:0] tcu_efu_coladdr;
wire tcu_efu_read_en;
wire [2:0] tcu_efu_read_mode;
wire tcu_efu_read_start;
wire tcu_efu_fuse_bypass;
wire tcu_efu_dest_sample;
wire tcu_efu_data_in;
wire efu_tcu_data_out;
wire tcu_efu_updatedr;
wire tcu_efu_shiftdr;
wire tcu_efu_capturedr;
wire [6:0] tcu_efu_rvclr;
wire tck;
wire pcmb1_out;
wire pcma_out;
wire cmp_gclk_c3_rng;
wire rng_arst_l;
wire [1:0] rng_ch_sel;
wire rng_bypass;
wire mio_ccu_vreg_selbg_l;
wire [1:0] rng_vcoctrl_sel;
wire [1:0] rng_anlg_sel;
wire l2clk;
wire drl2clk;
wire cmp_gclk_c1_ccu;
wire rst_scan_out;
wire ccu_scan_out;
wire cmp_gclk_c1_tcu;
wire rst_tcu_pwron_rst_l;
wire ncu_spc0_core_enable_status;
wire ncu_spc1_core_enable_status;
wire ncu_spc2_core_enable_status;
wire ncu_spc3_core_enable_status;
wire ncu_spc4_core_enable_status;
wire ncu_spc5_core_enable_status;
wire ncu_spc6_core_enable_status;
wire ncu_spc7_core_enable_status;
wire dmu_scan_out;
wire peu_scan_out;
wire tcu_socd_scan_out;
wire tcu_peu_scan_out;
wire gl_dmu_peu_por_c3b;
wire gl_dmu_peu_wmr_c3b;
wire tcu_array_bypass;
wire sii_dmu_wrack_parity;
wire cmp_gclk_c3_dmu;
wire gl_dmu_io_clk_stop;
wire gl_io_out_c3b;
wire cmp_gclk_c3_peu;
wire gl_peu_io_clk_stop;
wire psr_peu_txbclk0;
wire [1:0] dmu_psr_rate_scale;
wire [3:0] peu_psr_pll_mpy;
wire [1:0] peu_psr_pll_lb;
wire psr_stciq_sds0;
wire efu_psr_fclk;
wire efu_psr_fclrz;
wire efu_psr_fdi;
wire psr_fdo_sds0;
wire psr_efu_fdo;
wire psr_peu_rxbclk_b3sds1;
wire psr_peu_rxbclk_b2sds1;
wire psr_peu_rxbclk_b1sds1;
wire psr_peu_rxbclk_b0sds1;
wire psr_peu_rxbclk_b3sds0;
wire psr_peu_rxbclk_b2sds0;
wire psr_peu_rxbclk_b1sds0;
wire psr_peu_rxbclk_b0sds0;
wire tcu_rst_scan_out;
wire gl_rst_io_clk_stop;
wire gl_rst_clk_stop;
wire stg1_ccx_clk_stop_c1b;
wire stg1_cmp_io_sync_en_c1b;
wire stg1_cmp_io_sync_en_c1t;
wire stg1_db0_clk_stop_c1b;
wire stg1_dmu_io_clk_stop_c1b;
wire stg1_dmu_peu_por_c1b;
wire stg1_dmu_peu_wmr_c1b;
wire stg1_dr_sync_en_c1t;
wire stg1_io2x_out_c1b;
wire stg1_io_cmp_sync_en_c1b;
wire stg1_io_cmp_sync_en_c1t;
wire stg1_io_out_c1b;
wire stg1_io_out_c1t;
wire stg1_rst_l2_por_c1b;
wire stg1_rst_l2_por_c1t;
wire stg1_rst_l2_wmr_c1b;
wire stg1_rst_l2_wmr_c1t;
wire stg1_l2b0_clk_stop_c1t;
wire stg1_l2b1_clk_stop_c1t;
wire stg1_l2b2_clk_stop_c1b;
wire stg1_l2b3_clk_stop_c1b;
wire stg1_l2b4_clk_stop_c1t;
wire stg1_l2b5_clk_stop_c1t;
wire stg1_l2d0_clk_stop_c1t;
wire stg1_l2d1_clk_stop_c1t;
wire stg1_l2d2_clk_stop_c1b;
wire stg1_l2d3_clk_stop_c1b;
wire stg1_l2d4_clk_stop_c1t;
wire stg1_l2d5_clk_stop_c1t;
wire stg1_l2d7_clk_stop_c1b;
wire stg1_l2t0_clk_stop_c1t;
wire stg1_l2t1_clk_stop_c1t;
wire stg1_l2t2_clk_stop_c1b;
wire stg1_l2t3_clk_stop_c1b;
wire stg1_l2t5_clk_stop_c1t;
wire stg1_l2t7_clk_stop_c1b;
wire stg1_mac_io_clk_stop_c1b;
wire stg1_mcu0_clk_stop_c1t;
wire stg1_mcu0_dr_clk_stop_c1t;
wire stg1_mcu0_io_clk_stop_c1t;
wire stg1_mcu1_clk_stop_c1t;
wire stg1_mcu1_dr_clk_stop_c1t;
wire stg1_mcu1_io_clk_stop_c1t;
wire stg1_mio_clk_stop_c1t;
wire stg1_io2x_sync_en_c1t;
wire stg1_ncu_clk_stop_c1b;
wire stg1_ncu_io_clk_stop_c1b;
wire stg1_peu_io_clk_stop_c1b;
wire stg1_rdp_io_clk_stop_c1b;
wire stg1_rst_niu_mac_c1b;
wire stg1_rst_niu_wmr_c1b;
wire stg1_tds_io_clk_stop_c1b;
wire stg1_rtx_io_clk_stop_c1b;
wire stg1_sii_clk_stop_c1b;
wire stg1_sii_io_clk_stop_c1b;
wire stg4_cmp_io_sync_en_c3t;
wire stg4_io_cmp_sync_en_c3t;
wire stg4_io_out_c3b;
wire stg4_l2_por_c3t;
wire stg4_l2_wmr_c3t;
wire stg1_spc0_clk_stop_c1t;
wire stg1_spc1_clk_stop_c1t;
wire stg1_spc2_clk_stop_c1b;
wire stg1_spc3_clk_stop_c1b;
wire stg1_spc4_clk_stop_c1t;
wire stg1_spc5_clk_stop_c1t;
wire stg1_spc6_clk_stop_c1b;
wire stg1_spc7_clk_stop_c1b;
wire stg2_ccx_clk_stop_c1b;
wire stg2_cmp_io_sync_en_c1b;
wire stg2_cmp_io_sync_en_c1t;
wire stg2_db0_clk_stop_c1b;
wire stg2_dmu_io_clk_stop_c1b;
wire stg2_dmu_peu_por_c1b;
wire stg2_dmu_peu_wmr_c1b;
wire stg2_dr_sync_en_c1t;
wire stg2_io_cmp_sync_en_c1b;
wire stg2_io_cmp_sync_en_c1t;
wire stg2_io_out_c1t;
wire stg2_io_out_c1b;
wire stg2_l2_por_c1b;
wire stg2_l2_por_c1t;
wire stg2_l2_wmr_c1b;
wire stg2_l2_wmr_c1t;
wire stg2_l2b0_clk_stop_c1t;
wire stg2_l2b1_clk_stop_c1t;
wire stg2_l2b2_clk_stop_c1b;
wire stg2_l2b3_clk_stop_c1b;
wire stg2_l2d0_clk_stop_c1t;
wire stg2_l2d1_clk_stop_c1t;
wire stg2_l2d2_clk_stop_c1b;
wire stg2_l2d3_clk_stop_c1b;
wire stg2_l2t0_clk_stop_c1t;
wire stg2_l2t1_clk_stop_c1t;
wire stg2_l2t2_clk_stop_c1b;
wire stg2_l2t3_clk_stop_c1b;
wire stg2_l2t5_clk_stop_c1t;
wire stg2_l2t7_clk_stop_c1b;
wire stg2_mio_io2x_sync_en_c1t;
wire stg2_mio_clk_stop_c1t;
wire stg2_ncu_clk_stop_c1b;
wire stg2_ncu_io_clk_stop_c1b;
wire stg2_peu_io_clk_stop_c1b;
wire stg2_sii_clk_stop_c1b;
wire stg2_sii_io_clk_stop_c1b;
wire stg2_spc0_clk_stop_c1t;
wire stg2_spc1_clk_stop_c1t;
wire stg2_spc2_clk_stop_c1b;
wire stg2_spc3_clk_stop_c1b;
wire stg2_spc5_clk_stop_c1t;
wire stg2_spc7_clk_stop_c1b;
wire stg3_ccx_clk_stop_c2b;
wire stg3_cmp_io_sync_en_c2b;
wire stg3_cmp_io_sync_en_c2t;
wire stg3_db0_clk_stop_c2b;
wire stg3_dmu_io_clk_stop_c2b;
wire stg3_dmu_peu_por_c2b;
wire stg3_dmu_peu_wmr_c2b;
wire stg3_dr_sync_en_c2t;
wire stg3_mio_io2x_sync_en_c2t;
wire stg3_io_cmp_sync_en_c2b;
wire stg3_io_cmp_sync_en_c2t;
wire stg3_io_out_c2b;
wire stg3_io_out_c2t;
wire stg3_l2_por_c2b;
wire stg3_l2_por_c2t;
wire stg3_l2_wmr_c2b;
wire stg3_l2_wmr_c2t;
wire stg3_l2b0_clk_stop_c2t;
wire stg3_l2b1_clk_stop_c2t;
wire stg3_l2b2_clk_stop_c2b;
wire stg3_l2b3_clk_stop_c2b;
wire stg3_l2d0_clk_stop_c2t;
wire stg3_l2d1_clk_stop_c2t;
wire stg3_l2d2_clk_stop_c2b;
wire stg3_l2d3_clk_stop_c2b;
wire stg3_l2t0_clk_stop_c2t;
wire stg3_l2t1_clk_stop_c2t;
wire stg3_l2t2_clk_stop_c2b;
wire stg3_l2t3_clk_stop_c2b;
wire stg3_l2t5_clk_stop_c2t;
wire stg3_l2t7_clk_stop_c2b;
wire stg3_mcu0_clk_stop_c2t;
wire stg2_mcu0_dr_clk_stop_c2b;
wire stg3_mcu0_io_clk_stop_c2t;
wire stg3_mcu1_clk_stop_c2t;
wire stg2_mcu1_dr_clk_stop_c2b;
wire stg3_mcu1_io_clk_stop_c2t;
wire stg3_mio_clk_stop_c2t;
wire stg3_ncu_clk_stop_c2b;
wire stg3_ncu_io_clk_stop_c2b;
wire stg3_peu_io_clk_stop_c2b;
wire stg3_sii_clk_stop_c2b;
wire stg3_sii_io_clk_stop_c2b;
wire stg3_spc0_clk_stop_c2t;
wire stg3_spc1_clk_stop_c2t;
wire stg3_spc2_clk_stop_c2b;
wire stg3_spc3_clk_stop_c2b;
wire stg3_spc5_clk_stop_c2t;
wire stg3_spc7_clk_stop_c2b;
wire stg4_cmp_io_sync_en_c3b;
wire stg4_db0_clk_stop_c3b;
wire stg4_dmu_io_clk_stop_c3b;
wire stg4_dmu_peu_por_c3b;
wire stg4_dmu_peu_wmr_c3b;
wire stg4_dr_sync_en_c3t;
wire stg4_mio_io2x_sync_en_c3t;
wire stg4_io_cmp_sync_en_c3b;
wire stg4_io_out_c3t;
wire stg4_l2_por_c3b;
wire stg4_l2_wmr_c3b;
wire stg4_l2b0_clk_stop_c3t;
wire stg4_l2b1_clk_stop_c3t;
wire stg4_l2b2_clk_stop_c3b;
wire stg4_l2b3_clk_stop_c3b;
wire stg4_l2d0_clk_stop_c3t;
wire stg4_l2d1_clk_stop_c3t;
wire stg4_l2d2_clk_stop_c3b;
wire stg4_l2d3_clk_stop_c3b;
wire stg4_l2t0_clk_stop_c3t;
wire stg4_l2t2_clk_stop_c3b;
wire stg4_mcu0_clk_stop_c3t;
wire stg4_mcu0_io_clk_stop_c3t;
wire stg4_mcu1_clk_stop_c3t;
wire stg4_mcu1_io_clk_stop_c3t;
wire stg4_mio_clk_stop_c3t;
wire stg4_ncu_clk_stop_c3b;
wire stg4_ncu_io_clk_stop_c3b;
wire stg4_peu_io_clk_stop_c3b;
wire stg4_sii_clk_stop_c3b;
wire stg4_sii_io_clk_stop_c3b;
wire stg4_spc0_clk_stop_c3t;
wire stg4_spc2_clk_stop_c3b;
wire stg2_mcu0_io_clk_stop_c1t;
wire stg2_mcu1_io_clk_stop_c1t;
wire stg1_io2x_sync_en_c1b;
wire stg2_mcu0_clk_stop_c1t;
wire stg2_mcu1_clk_stop_c1t;
wire stg3_io2x_sync_en_c2t;
wire tcu_atpg_mode;
wire ccu_mio_serdes_dtm;
wire tcu_mio_tdo;
wire tcu_mio_tdo_en;
wire tcu_mio_stciq;
wire mio_tcu_stcid;
wire [1:0] mio_tcu_stcicfg;
wire mio_tcu_stciclk;
wire mio_tcu_divider_bypass;
wire mio_tcu_pll_cmp_bypass;
wire mio_tcu_scan_in31;
wire tcu_mio_scan_out31;
wire [7:0] peu_mio_debug_bus_a;
wire [7:0] peu_mio_debug_bus_b;
wire [63:0] peu_mio_pipe_txdata;
wire [7:0] peu_mio_pipe_txdatak;
wire peu_mio_debug_clk;
wire mio_ccu_pll_char_in;
wire [5:0] mio_ccu_pll_div2;
wire mio_ccu_pll_trst_l;
wire mio_ccu_pll_clamp_fltr;
wire [6:0] mio_ccu_pll_div4;
wire mio_ext_dr_clk;
wire mio_ext_cmp_clk;
wire [1:0] ccu_mio_pll_char_out;
wire mio_tcu_io_ac_testmode;
wire mio_tcu_io_ac_testtrig;
wire mio_tcu_io_aclk;
wire mio_tcu_io_bclk;
wire [30:0] mio_tcu_io_scan_in;
wire mio_tcu_peu_clk_ext;
wire [5:0] mio_tcu_niu_clk_ext;
wire mio_tcu_io_scan_en;
wire [30:0] tcu_mio_pins_scan_out;
wire [39:0] tcu_mio_dmo_data;
wire tcu_mio_mbist_done;
wire tcu_mio_mbist_fail;
wire tcu_mio_dmo_sync;
wire mio_tcu_trigin;
wire tcu_mio_trigout;
wire rst_mio_pex_reset_l;
wire [5:0] rst_mio_rst_state;
wire mio_rst_pb_rst_l;
wire mio_rst_button_xir_l;
wire mio_rst_pwron_rst_l;
wire ncu_mio_ssi_mosi;
wire mio_ncu_ssi_miso;
wire ncu_mio_ssi_sck;
wire mio_ncu_ext_int_l;
wire rst_mio_ssi_sync_l;
wire tcu_mio_bs_scan_in;
wire tcu_mio_bs_highz_l;
wire mio_tcu_bs_scan_out;
wire tcu_mio_bs_scan_en;
wire tcu_mio_bs_clk;
wire tcu_mio_bs_aclk;
wire tcu_mio_bs_bclk;
wire tcu_mio_bs_uclk;
wire tcu_mio_bs_mode_ctl;
wire tcu_dbr_gateoff;
wire ncu_spc_l2_idx_hash_en;
wire cmp_gclk_c2_ccx_left;
wire cmp_gclk_c2_ccx_right;
wire ncu_l2t_pm;
wire ncu_l2t_ba01;
wire ncu_l2t_ba23;
wire ncu_l2t_ba45;
wire ncu_l2t_ba67;
wire ncu_mcu_pm;
wire ncu_mcu_ba01;
wire ncu_mcu_ba23;
wire ncu_mcu_ba45;
wire ncu_mcu_ba67;
wire rst_mcu_selfrsh;
wire tcu_mcu_testmode;
wire ccu_serdes_dtm;
wire tcu_sii_mbist_scan_in;
wire sii_tcu_mbist_scan_out;
wire ncu_sii_niuctag_uei;
wire ncu_sii_niuctag_cei;
wire ncu_sii_niua_pei;
wire ncu_sii_niud_pei;
wire ncu_sii_dmuctag_uei;
wire ncu_sii_dmuctag_cei;
wire ncu_sii_dmua_pei;
wire ncu_sii_dmud_pei;
wire ncu_sii_gnt;
wire ncu_sii_pm;
wire ncu_sii_ba01;
wire ncu_sii_ba23;
wire ncu_sii_ba45;
wire ncu_sii_ba67;
wire ncu_sii_l2_idx_hash_en;
wire sii_ncu_niuctag_ue;
wire sii_ncu_niuctag_ce;
wire sii_ncu_niua_pe;
wire sii_ncu_niud_pe;
wire sii_ncu_dmuctag_ue;
wire sii_ncu_dmuctag_ce;
wire sii_ncu_dmua_pe;
wire sii_ncu_dmud_pe;
wire [3:0] sii_ncu_syn_data;
wire sii_ncu_syn_vld;
wire [1:0] sii_ncu_dparity;
wire [31:0] sii_ncu_data;
wire sii_ncu_req;
wire [7:0] dmu_sii_parity;
wire dmu_sii_be_parity;
wire sii_dmu_wrack_vld;
wire [3:0] sii_dmu_wrack_tag;
wire sio_sii_opcc_ipcc_niu_by_deq;
wire [3:0] sio_sii_opcc_ipcc_niu_by_cnt;
wire sio_sii_opcc_ipcc_niu_or_deq;
wire sio_sii_opcc_ipcc_dmu_by_deq;
wire [3:0] sio_sii_opcc_ipcc_dmu_by_cnt;
wire sio_sii_opcc_ipcc_dmu_or_deq;
wire sio_sii_olc0_ilc0_dequeue;
wire sio_sii_olc1_ilc1_dequeue;
wire sio_sii_olc2_ilc2_dequeue;
wire sio_sii_olc3_ilc3_dequeue;
wire sio_sii_olc4_ilc4_dequeue;
wire sio_sii_olc5_ilc5_dequeue;
wire sio_sii_olc6_ilc6_dequeue;
wire sio_sii_olc7_ilc7_dequeue;
wire sio_tcu_vld;
wire sio_tcu_data;
wire [1:0] tcu_sio_mbist_start;
wire [1:0] sio_tcu_mbist_done;
wire [1:0] sio_tcu_mbist_fail;
wire tcu_sio_mbist_scan_in;
wire sio_tcu_mbist_scan_out;
wire sio_dmu_hdr_vld;
wire [127:0] sio_dmu_data;
wire [7:0] sio_dmu_parity;
wire sio_ncu_ctag_ue;
wire sio_ncu_ctag_ce;
wire ncu_sio_ctag_cei;
wire ncu_sio_ctag_uei;
wire ncu_sio_d_pei;
wire tcu_ncu_mbist_scan_in;
wire ncu_tcu_mbist_scan_out;
wire [63:0] ncu_dmu_pio_data;
wire ncu_dmu_pio_hdr_vld;
wire ncu_dmu_mmu_addr_vld;
wire ncu_dmu_mondo_ack;
wire ncu_dmu_mondo_nack;
wire [5:0] ncu_dmu_mondo_id;
wire ncu_dmu_vld;
wire [31:0] ncu_dmu_data;
wire ncu_dmu_stall;
wire ncu_ccu_vld;
wire [3:0] ncu_ccu_data;
wire [3:0] ccu_ncu_data;
wire ccu_ncu_vld;
wire ccu_ncu_stall;
wire ncu_ccu_stall;
wire ncu_tcu_vld;
wire [7:0] ncu_tcu_data;
wire tcu_ncu_stall;
wire tcu_ncu_vld;
wire [7:0] tcu_ncu_data;
wire ncu_tcu_stall;
wire ncu_rst_vld;
wire [3:0] ncu_rst_data;
wire rst_ncu_stall;
wire rst_ncu_vld;
wire [3:0] rst_ncu_data;
wire ncu_rst_stall;
wire efu_ncu_fuse_data;
wire efu_ncu_srlnum0_xfer_en;
wire efu_ncu_srlnum1_xfer_en;
wire efu_ncu_srlnum2_xfer_en;
wire efu_ncu_fusestat_xfer_en;
wire efu_ncu_coreavl_xfer_en;
wire efu_ncu_bankavl_xfer_en;
wire rst_ncu_unpark_thread;
wire rst_ncu_xir_;
wire ncu_rst_xir_done;
wire ncu_spc0_core_available;
wire ncu_spc1_core_available;
wire ncu_spc2_core_available;
wire ncu_spc3_core_available;
wire ncu_spc4_core_available;
wire ncu_spc5_core_available;
wire ncu_spc6_core_available;
wire ncu_spc7_core_available;
wire ncu_rst_fatal_error;
wire [7:0] ncu_tcu_bank_avail;
wire tcu_sck_bypass;
wire dmu_ncu_wrack_par;
wire ncu_dmu_mondo_id_par;
wire dmu_ncu_d_pe;
wire ncu_dmu_d_pei;
wire dmu_ncu_siicr_pe;
wire ncu_dmu_siicr_pei;
wire dmu_ncu_ctag_ue;
wire ncu_dmu_ctag_uei;
wire dmu_ncu_ctag_ce;
wire ncu_dmu_ctag_cei;
wire dmu_ncu_ncucr_pe;
wire ncu_dmu_ncucr_pei;
wire dmu_ncu_ie;
wire ncu_dmu_iei;
wire efu_dmu_data;
wire efu_dmu_xfer_en;
wire efu_dmu_clr;
wire dmu_efu_xfer_en;
wire dmu_efu_data;
wire rng_data;
wire ccu_vco_aligned;
wire gclk_aligned;
wire ccu_cmp_io_sync_en;
wire ccu_io_cmp_sync_en;
wire ccu_io2x_sync_en;
wire ccu_dr_sync_en;
wire ccu_io2x_out;
wire ccu_io_out;
wire gl_ccu_io_clk_stop;
wire gl_ccu_clk_stop;
wire [1:0] tcu_ccu_mux_sel;
wire tcu_ccu_ext_cmp_clk;
wire tcu_ccu_ext_dr_clk;
wire tcu_ccu_clk_stretch;
wire rst_ccu_pll_;
wire rst_ccu_;
wire ccu_rst_change;
wire ccu_rst_sys_clk;
wire ccu_rst_sync_stable;
wire ccu_sys_cmp_sync_en;
wire ccu_cmp_sys_sync_en;
wire tcu_ccu_clk_stop;
wire tcu_ccu_io_clk_stop;
wire [3:0] jtag_revid_out;
wire tcu_spc0_clk_stop;
wire tcu_spc1_clk_stop;
wire tcu_spc2_clk_stop;
wire tcu_spc3_clk_stop;
wire tcu_spc4_clk_stop;
wire tcu_spc5_clk_stop;
wire tcu_spc6_clk_stop;
wire tcu_spc7_clk_stop;
wire tcu_l2d0_clk_stop;
wire tcu_l2d1_clk_stop;
wire tcu_l2d2_clk_stop;
wire tcu_l2d3_clk_stop;
wire tcu_l2d4_clk_stop;
wire tcu_l2d5_clk_stop;
wire tcu_l2d6_clk_stop;
wire tcu_l2d7_clk_stop;
wire tcu_l2t0_clk_stop;
wire tcu_l2t1_clk_stop;
wire tcu_l2t2_clk_stop;
wire tcu_l2t3_clk_stop;
wire tcu_l2t4_clk_stop;
wire tcu_l2t5_clk_stop;
wire tcu_l2t6_clk_stop;
wire tcu_l2t7_clk_stop;
wire tcu_l2b0_clk_stop;
wire tcu_l2b1_clk_stop;
wire tcu_l2b2_clk_stop;
wire tcu_l2b3_clk_stop;
wire tcu_l2b4_clk_stop;
wire tcu_l2b5_clk_stop;
wire tcu_l2b6_clk_stop;
wire tcu_l2b7_clk_stop;
wire tcu_mcu0_clk_stop;
wire tcu_mcu0_dr_clk_stop;
wire tcu_mcu0_io_clk_stop;
wire tcu_mcu1_clk_stop;
wire tcu_mcu1_dr_clk_stop;
wire tcu_mcu1_io_clk_stop;
wire tcu_mcu2_clk_stop;
wire tcu_mcu2_dr_clk_stop;
wire tcu_mcu2_io_clk_stop;
wire tcu_mcu3_clk_stop;
wire tcu_mcu3_dr_clk_stop;
wire tcu_mcu3_io_clk_stop;
wire tcu_ccx_clk_stop;
wire tcu_sii_clk_stop;
wire tcu_sii_io_clk_stop;
wire tcu_sio_clk_stop;
wire tcu_sio_io_clk_stop;
wire tcu_ncu_clk_stop;
wire tcu_ncu_io_clk_stop;
wire tcu_efu_clk_stop;
wire tcu_efu_io_clk_stop;
wire tcu_rst_clk_stop;
wire tcu_rst_io_clk_stop;
wire tcu_dmu_io_clk_stop;
wire tcu_rdp_io_clk_stop;
wire tcu_mac_io_clk_stop;
wire tcu_rtx_io_clk_stop;
wire tcu_tds_io_clk_stop;
wire tcu_peu_pc_clk_stop;
wire tcu_peu_io_clk_stop;
wire tcu_rst_efu_done;
wire tcu_test_protect;
wire [1:0] tcu_dmu_mbist_start;
wire tcu_dmu_mbist_scan_in;
wire [1:0] dmu_tcu_mbist_done;
wire [1:0] dmu_tcu_mbist_fail;
wire dmu_tcu_mbist_scan_out;
wire tcu_peu_mbist_start;
wire tcu_peu_mbist_scan_in;
wire peu_tcu_mbist_done;
wire peu_tcu_mbist_fail;
wire peu_tcu_mbist_scan_out;
wire rst_tcu_flush_init_req;
wire rst_tcu_flush_stop_req;
wire rst_tcu_asicflush_stop_req;
wire tcu_rst_asicflush_stop_ack;
wire tcu_rst_flush_init_ack;
wire tcu_rst_flush_stop_ack;
wire tcu_bisx_done;
wire tcu_rst_scan_mode;
wire rst_tcu_clk_stop;
wire rst_tcu_dbr_gen;
wire tcu_mio_clk_stop;
wire tcu_peu_entestcfg;
wire tcu_peu_clk_ext;
wire tcu_peu_testmode;
wire tcu_db0_clk_stop;
wire tcu_db1_clk_stop;
wire p2d_ce_int;
wire p2d_csr_ack;
wire [95:0] p2d_csr_rcd;
wire p2d_csr_req;
wire p2d_cto_req;
wire [4:0] p2d_cto_tag;
wire p2d_drain;
wire [7:0] p2d_ecd_rptr;
wire [5:0] p2d_ech_rptr;
wire [7:0] p2d_erd_rptr;
wire [5:0] p2d_erh_rptr;
wire p2d_ibc_ack;
wire [127:0] p2d_idb_data;
wire [3:0] p2d_idb_dpar;
wire [127:0] p2d_ihb_data;
wire [3:0] p2d_ihb_dpar;
wire d2p_ihb_rd;
wire d2p_idb_rd;
wire [6:0] p2d_ihb_wptr;
wire [2:0] p2d_mps;
wire p2d_oe_int;
wire [4:0] p2d_spare;
wire p2d_ue_int;
wire p2d_npwr_stall_en;
wire rst_dmu_async_por_;
wire d2p_csr_ack;
wire [95:0] d2p_csr_rcd;
wire d2p_csr_req;
wire d2p_cto_ack;
wire [5:0] d2p_ech_wptr;
wire [7:0] d2p_edb_addr;
wire [127:0] d2p_edb_data;
wire [3:0] d2p_edb_dpar;
wire d2p_edb_we;
wire [5:0] d2p_ehb_addr;
wire [127:0] d2p_ehb_data;
wire [3:0] d2p_ehb_dpar;
wire d2p_ehb_we;
wire [5:0] d2p_erh_wptr;
wire [7:0] d2p_ibc_nhc;
wire [11:0] d2p_ibc_pdc;
wire [7:0] d2p_ibc_phc;
wire d2p_ibc_req;
wire [7:0] d2p_idb_addr;
wire [5:0] d2p_ihb_addr;
wire [4:0] d2p_spare;
wire dmu_psr_pll_en_sds0;
wire dmu_psr_pll_en_sds1;
wire dmu_psr_rx_en_b0_sds0;
wire dmu_psr_rx_en_b1_sds0;
wire dmu_psr_rx_en_b2_sds0;
wire dmu_psr_rx_en_b3_sds0;
wire dmu_psr_rx_en_b0_sds1;
wire dmu_psr_rx_en_b1_sds1;
wire dmu_psr_rx_en_b2_sds1;
wire dmu_psr_rx_en_b3_sds1;
wire dmu_psr_tx_en_b0_sds0;
wire dmu_psr_tx_en_b1_sds0;
wire dmu_psr_tx_en_b2_sds0;
wire dmu_psr_tx_en_b3_sds0;
wire dmu_psr_tx_en_b0_sds1;
wire dmu_psr_tx_en_b1_sds1;
wire dmu_psr_tx_en_b2_sds1;
wire dmu_psr_tx_en_b3_sds1;
wire [15:0] d2p_req_id;
wire [9:0] psr_peu_rd_b0sds0;
wire [9:0] psr_peu_rd_b1sds0;
wire [9:0] psr_peu_rd_b2sds0;
wire [9:0] psr_peu_rd_b3sds0;
wire [9:0] psr_peu_rd_b0sds1;
wire [9:0] psr_peu_rd_b1sds1;
wire [9:0] psr_peu_rd_b2sds1;
wire [9:0] psr_peu_rd_b3sds1;
wire psr_peu_bsrxn_b0sds0;
wire psr_peu_bsrxn_b1sds0;
wire psr_peu_bsrxn_b2sds0;
wire psr_peu_bsrxn_b3sds0;
wire psr_peu_bsrxn_b0sds1;
wire psr_peu_bsrxn_b1sds1;
wire psr_peu_bsrxn_b2sds1;
wire psr_peu_bsrxn_b3sds1;
wire psr_peu_bsrxp_b0sds0;
wire psr_peu_bsrxp_b1sds0;
wire psr_peu_bsrxp_b2sds0;
wire psr_peu_bsrxp_b3sds0;
wire psr_peu_bsrxp_b0sds1;
wire psr_peu_bsrxp_b1sds1;
wire psr_peu_bsrxp_b2sds1;
wire psr_peu_bsrxp_b3sds1;
wire psr_peu_losdtct_b0sds0;
wire psr_peu_losdtct_b1sds0;
wire psr_peu_losdtct_b2sds0;
wire psr_peu_losdtct_b3sds0;
wire psr_peu_losdtct_b0sds1;
wire psr_peu_losdtct_b1sds1;
wire psr_peu_losdtct_b2sds1;
wire psr_peu_losdtct_b3sds1;
wire psr_peu_sync_b0sds0;
wire psr_peu_sync_b1sds0;
wire psr_peu_sync_b2sds0;
wire psr_peu_sync_b3sds0;
wire psr_peu_sync_b0sds1;
wire psr_peu_sync_b1sds1;
wire psr_peu_sync_b2sds1;
wire psr_peu_sync_b3sds1;
wire psr_peu_rx_tstfail_b0sds0;
wire psr_peu_rx_tstfail_b1sds0;
wire psr_peu_rx_tstfail_b2sds0;
wire psr_peu_rx_tstfail_b3sds0;
wire psr_peu_rx_tstfail_b0sds1;
wire psr_peu_rx_tstfail_b1sds1;
wire psr_peu_rx_tstfail_b2sds1;
wire psr_peu_rx_tstfail_b3sds1;
wire psr_peu_rdtcip_b0sds0;
wire psr_peu_rdtcip_b1sds0;
wire psr_peu_rdtcip_b2sds0;
wire psr_peu_rdtcip_b3sds0;
wire psr_peu_rdtcip_b0sds1;
wire psr_peu_rdtcip_b1sds1;
wire psr_peu_rdtcip_b2sds1;
wire psr_peu_rdtcip_b3sds1;
wire psr_peu_tx_tstfail_b0sds0;
wire psr_peu_tx_tstfail_b1sds0;
wire psr_peu_tx_tstfail_b2sds0;
wire psr_peu_tx_tstfail_b3sds0;
wire psr_peu_tx_tstfail_b0sds1;
wire psr_peu_tx_tstfail_b1sds1;
wire psr_peu_tx_tstfail_b2sds1;
wire psr_peu_tx_tstfail_b3sds1;
wire psr_peu_lock_sds0;
wire psr_peu_lock_sds1;
wire [9:0] peu_psr_td_b0sds0;
wire [9:0] peu_psr_td_b1sds0;
wire [9:0] peu_psr_td_b2sds0;
wire [9:0] peu_psr_td_b3sds0;
wire [9:0] peu_psr_td_b0sds1;
wire [9:0] peu_psr_td_b1sds1;
wire [9:0] peu_psr_td_b2sds1;
wire [9:0] peu_psr_td_b3sds1;
wire peu_psr_invpair_b0sds0;
wire peu_psr_invpair_b1sds0;
wire peu_psr_invpair_b2sds0;
wire peu_psr_invpair_b3sds0;
wire peu_psr_invpair_b0sds1;
wire peu_psr_invpair_b1sds1;
wire peu_psr_invpair_b2sds1;
wire peu_psr_invpair_b3sds1;
wire [15:0] peu_psr_rx_lane_ctl_0;
wire [15:0] peu_psr_rx_lane_ctl_1;
wire [15:0] peu_psr_rx_lane_ctl_2;
wire [15:0] peu_psr_rx_lane_ctl_3;
wire [15:0] peu_psr_rx_lane_ctl_4;
wire [15:0] peu_psr_rx_lane_ctl_5;
wire [15:0] peu_psr_rx_lane_ctl_6;
wire [15:0] peu_psr_rx_lane_ctl_7;
wire [1:0] peu_psr_rdtct_b0sds0;
wire [1:0] peu_psr_rdtct_b1sds0;
wire [1:0] peu_psr_rdtct_b2sds0;
wire [1:0] peu_psr_rdtct_b3sds0;
wire [1:0] peu_psr_rdtct_b0sds1;
wire [1:0] peu_psr_rdtct_b1sds1;
wire [1:0] peu_psr_rdtct_b2sds1;
wire [1:0] peu_psr_rdtct_b3sds1;
wire peu_psr_enidl_b0sds0;
wire peu_psr_enidl_b1sds0;
wire peu_psr_enidl_b2sds0;
wire peu_psr_enidl_b3sds0;
wire peu_psr_enidl_b0sds1;
wire peu_psr_enidl_b1sds1;
wire peu_psr_enidl_b2sds1;
wire peu_psr_enidl_b3sds1;
wire peu_psr_bstx_b0sds0;
wire peu_psr_bstx_b1sds0;
wire peu_psr_bstx_b2sds0;
wire peu_psr_bstx_b3sds0;
wire peu_psr_bstx_b0sds1;
wire peu_psr_bstx_b1sds1;
wire peu_psr_bstx_b2sds1;
wire peu_psr_bstx_b3sds1;
wire [9:0] peu_psr_tx_lane_ctl_0;
wire [9:0] peu_psr_tx_lane_ctl_1;
wire [9:0] peu_psr_tx_lane_ctl_2;
wire [9:0] peu_psr_tx_lane_ctl_3;
wire [9:0] peu_psr_tx_lane_ctl_4;
wire [9:0] peu_psr_tx_lane_ctl_5;
wire [9:0] peu_psr_tx_lane_ctl_6;
wire [9:0] peu_psr_tx_lane_ctl_7;
wire [7:0] peu_psr_txbclkin;
wire [15:0] peu_psr_testcfg_sds0;
wire [15:0] peu_psr_testcfg_sds1;
wire rst_l2_por_;
wire rst_l2_wmr_;
wire rst_niu_mac_;
wire rst_niu_wmr_;
wire rst_dmu_peu_por_;
wire rst_dmu_peu_wmr_;


input   [ 7 : 0 ]       L2T_VNW;
input   [ 7 : 0 ]       SPC_VNW;
input   [ 7 : 0 ]       L2D_VNW0;
input   [ 7 : 0 ]       L2D_VNW1; 

output 	[ 9 : 0 ]	FBDIMM0A_TX_P;
output 	[ 9 : 0 ]	FBDIMM0A_TX_N;
input 	[ 13 : 0 ]	FBDIMM0A_RX_P;
input 	[ 13 : 0 ]	FBDIMM0A_RX_N;
output 	[ 2 : 0 ]	FBDIMM0A_AMUX;

output 	[ 9 : 0 ]	FBDIMM0B_TX_P;
output 	[ 9 : 0 ]	FBDIMM0B_TX_N;
input 	[ 13 : 0 ]	FBDIMM0B_RX_P;
input 	[ 13 : 0 ]	FBDIMM0B_RX_N;
output 	[ 2 : 0 ]	FBDIMM0B_AMUX;

output 	[ 9 : 0 ]	FBDIMM1A_TX_P;
output 	[ 9 : 0 ]	FBDIMM1A_TX_N;
input 	[ 13 : 0 ]	FBDIMM1A_RX_P;
input 	[ 13 : 0 ]	FBDIMM1A_RX_N;
output 	[ 2 : 0 ]	FBDIMM1A_AMUX;

output 	[ 9 : 0 ]	FBDIMM1B_TX_P;
output 	[ 9 : 0 ]	FBDIMM1B_TX_N;
input 	[ 13 : 0 ]	FBDIMM1B_RX_P;
input 	[ 13 : 0 ]	FBDIMM1B_RX_N;
output 	[ 2 : 0 ]	FBDIMM1B_AMUX;

output 	[ 9 : 0 ]	FBDIMM2A_TX_P;
output 	[ 9 : 0 ]	FBDIMM2A_TX_N;
input 	[ 13 : 0 ]	FBDIMM2A_RX_P;
input 	[ 13 : 0 ]	FBDIMM2A_RX_N;
output 	[ 2 : 0 ]	FBDIMM2A_AMUX;

output 	[ 9 : 0 ]	FBDIMM2B_TX_P;
output 	[ 9 : 0 ]	FBDIMM2B_TX_N;
input 	[ 13 : 0 ]	FBDIMM2B_RX_P;
input 	[ 13 : 0 ]	FBDIMM2B_RX_N;
output 	[ 2 : 0 ]	FBDIMM2B_AMUX;

output 	[ 9 : 0 ]	FBDIMM3A_TX_P;
output 	[ 9 : 0 ]	FBDIMM3A_TX_N;
input 	[ 13 : 0 ]	FBDIMM3A_RX_P;
input 	[ 13 : 0 ]	FBDIMM3A_RX_N;
output 	[ 2 : 0 ]	FBDIMM3A_AMUX;

output 	[ 9 : 0 ]	FBDIMM3B_TX_P;
output 	[ 9 : 0 ]	FBDIMM3B_TX_N;
input 	[ 13 : 0 ]	FBDIMM3B_RX_P;
input 	[ 13 : 0 ]	FBDIMM3B_RX_N;
output 	[ 2 : 0 ]	FBDIMM3B_AMUX;

input		FBDIMM1_REFCLK_P;
input		FBDIMM1_REFCLK_N;
input		FBDIMM2_REFCLK_P;
input		FBDIMM2_REFCLK_N;
input		FBDIMM3_REFCLK_P;
input		FBDIMM3_REFCLK_N;

input           VDDA_FSRL;
input           VDDD_FSRL;
input           VDDR_FSRL;
input           VDDT_FSRL;
input           VSSA_FSRL;

input           VDDA_FSRR;
input           VDDD_FSRR;
input           VDDR_FSRR;
input           VDDT_FSRR;
input           VSSA_FSRR;

input           VDDA_FSRB;
input           VDDD_FSRB;
input           VDDR_FSRB;
input           VDDT_FSRB;
input           VSSA_FSRB;

// PCI-E Bumps

output	[ 7 : 0 ]	PEX_TX_P ;
output	[ 7 : 0 ]	PEX_TX_N ;
input	[ 7 : 0 ]	PEX_RX_P ;
input	[ 7 : 0 ]	PEX_RX_N ;
input		PEX_REFCLK_P ;
input		PEX_REFCLK_N ;
output	[ 1 : 0 ]	PEX_AMUX ;

input		VDDT_PSR;    // PAD 
input		VDDD_PSR;    // PAD 
input		VDDC_PSR;    // PAD 
input		VDDA_PSR;    // PAD 
input		VDDR_PSR;    // PAD 
input		VSSA_PSR;    // PAD 


output			   STCIQ;
input			   TESTCLKT;		// moved out of NIU 
input			   TESTCLKR;
input			   STCID;
//input			   PLL_DR_BYPASS;
input			   PLL_CMP_BYPASS;
input	[ 1 : 0 ]		   STCICFG;
input			   STCICLK;
input			   PGRM_EN;
input			   VDDO_PCM; // PCM 1.5 Supply


//wire		scan_in		= 1'b0;

`ifndef FC_NO_NIU_T2
// NIU START 
// Updated by  on Sep_1_19_13_16.2005
// start XAUI serdes IO Pads
                        // XAUI serdes IO Pads
   output			   XAUI0_AMUX  ;	// PAD TI only.
   output [ 3 : 0 ]			   XAUI0_TX_N  ;	// PAD
   output [ 3 : 0 ]			   XAUI0_TX_P  ;	// PAD
   input			   XAUI0_REFCLK_N  ;	// PAD
   input			   XAUI0_REFCLK_P  ;	// PAD
   input [ 3 : 0 ]			   XAUI0_RX_N  ;	// PAD
   input [ 3 : 0 ]			   XAUI0_RX_P  ;	// PAD
   output			   XAUI1_AMUX  ;	// PAD TI only.
   output [ 3 : 0 ]			   XAUI1_TX_N  ;	// PAD
   output [ 3 : 0 ]			   XAUI1_TX_P  ;	// PAD
   input [ 3 : 0 ]			   XAUI1_RX_N  ;	// PAD
   input [ 3 : 0 ]			   XAUI1_RX_P  ;	// PAD

   output			   XAUI0_LINK_LED;  // PAD
   output			   XAUI1_LINK_LED;  // PAD
   output			   XAUI0_ACT_LED;   // PAD
   output			   XAUI1_ACT_LED;   // PAD
   output			   XAUI_MDC;	    // PAD
   inout			   XAUI_MDIO;	    // PAD
   inout                           XAUI_MDINT1_L;   // PAD, XAUI INterrupt 1
   inout                           XAUI_MDINT0_L;   // PAD, XAUI INterrupt 0
//   inout  [1:0]                    SPARE;           // Spare PADs

   input                           VDDT_ESR;    // PAD cc
   input                           VDDA_ESR;    // PAD cc
   input                           VDDD_ESR;    // PAD cc
   input                           VDDR_ESR;    // PAD cc
   input                           VSSA_ESR;    // PAD cc

`endif

// added this to exclude NIU specific code
`ifndef FC_NO_NIU_T2


`ifdef NIU_SYSTEMC_T2

`ifdef OPENSPARC_CMP
`else

niu niu (
        .XAUI0_REFCLK_N (XAUI0_REFCLK_N),
        .XAUI0_REFCLK_P (XAUI0_REFCLK_P),
        .XAUI0_RX_N (XAUI0_RX_N[3:0]),
        .XAUI0_RX_P (XAUI0_RX_P[3:0]),
        .XAUI1_RX_N (XAUI1_RX_N[3:0]),
        .XAUI1_RX_P (XAUI1_RX_P[3:0]),
        .cluster_arst_l (cluster_arst_l),
        .cmp_gclk_c0_rdp (cmp_gclk_c0_rdp),
        .cmp_gclk_c0_rtx (cmp_gclk_c0_rtx),
        .cmp_gclk_c0_tds (cmp_gclk_c0_tds),
        .cmp_gclk_c1_mac (cmp_gclk_c1_mac),
        .dbg1_niu_dbg_sel (dbg1_niu_dbg_sel[4:0]),
        .dbg1_niu_resume (dbg1_niu_resume),
        .dbg1_niu_stall (dbg1_niu_stall),
        .efu_niu_4k_clr (efu_niu_4k_clr),
        .efu_niu_4k_data (efu_niu_4k_data),
        .efu_niu_4k_xfer_en (efu_niu_4k_xfer_en),
        .efu_niu_cfifo0_clr (efu_niu_cfifo0_clr),
        .efu_niu_cfifo0_xfer_en (efu_niu_cfifo0_xfer_en),
        .efu_niu_cfifo1_clr (efu_niu_cfifo1_clr),
        .efu_niu_cfifo1_xfer_en (efu_niu_cfifo1_xfer_en),
        .efu_niu_cfifo_data (efu_niu_cfifo_data),
        .efu_niu_ipp0_clr (efu_niu_ipp0_clr),
        .efu_niu_ipp0_xfer_en (efu_niu_ipp0_xfer_en),
        .efu_niu_ipp1_clr (efu_niu_ipp1_clr),
        .efu_niu_ipp1_xfer_en (efu_niu_ipp1_xfer_en),
        .efu_niu_mac01_sfro_data (efu_niu_mac01_sfro_data),
        .efu_niu_mac0_ro_clr (efu_niu_mac0_ro_clr),
        .efu_niu_mac0_ro_xfer_en (efu_niu_mac0_ro_xfer_en),
        .efu_niu_mac0_sf_clr (efu_niu_mac0_sf_clr),
        .efu_niu_mac0_sf_xfer_en (efu_niu_mac0_sf_xfer_en),
        .efu_niu_mac1_ro_clr (efu_niu_mac1_ro_clr),
        .efu_niu_mac1_ro_xfer_en (efu_niu_mac1_ro_xfer_en),
        .efu_niu_mac1_sf_clr (efu_niu_mac1_sf_clr),
        .efu_niu_mac1_sf_xfer_en (efu_niu_mac1_sf_xfer_en),
        .efu_niu_ram0_clr (efu_niu_ram0_clr),
        .efu_niu_ram0_xfer_en (efu_niu_ram0_xfer_en),
        .efu_niu_ram1_clr (efu_niu_ram1_clr),
        .efu_niu_ram1_xfer_en (efu_niu_ram1_xfer_en),
        .efu_niu_ram_clr (efu_niu_ram_clr),
        .efu_niu_ram_data (efu_niu_ram_data),
        .efu_niu_ram_xfer_en (efu_niu_ram_xfer_en),
        .esr_atpgd (esr_atpgd),
        .gl_mac_io_clk_stop (gl_mac_io_clk_stop),
        .mac_125rx_test_clk (mac_125rx_test_clk),
        .mac_125tx_test_clk (mac_125tx_test_clk),
        .mac_156rx_test_clk (mac_156rx_test_clk),
        .mac_156tx_test_clk (mac_156tx_test_clk),
        .mac_312rx_test_clk (mac_312rx_test_clk),
        .mac_312tx_test_clk (mac_312tx_test_clk),
        .mdi (mdi),
        .ncu_niu_ctag_cei (ncu_niu_ctag_cei),
        .ncu_niu_ctag_uei (ncu_niu_ctag_uei),
        .ncu_niu_d_pei (ncu_niu_d_pei),
        .ncu_niu_data (ncu_niu_data[31:0]),
        .ncu_niu_stall (ncu_niu_stall),
        .ncu_niu_vld (ncu_niu_vld),
        .peu_mac_sbs_input (peu_mac_sbs_input),
        .rdp_rdmc_mbist_scan_in (rdp_rdmc_mbist_scan_in),
        .rtx_mbist_scan_in (rtx_mbist_scan_in),
        .sii_niu_bqdq (sii_niu_bqdq),
        .sii_niu_oqdq (sii_niu_oqdq),
        .sio_niu_data (sio_niu_data[127:0]),
        .sio_niu_datareq (sio_niu_datareq),
        .sio_niu_hdr_vld (sio_niu_hdr_vld),
        .sio_niu_parity (sio_niu_parity[7:0]),
        .tcu_div_bypass (tcu_div_bypass),
        .tcu_mbist_bisi_en (tcu_mbist_bisi_en),
        .tcu_mbist_user_mode (tcu_mbist_user_mode),
        .tcu_pce_ov (tcu_pce_ov),
        .tcu_rdp_rdmc_mbist_start (tcu_rdp_rdmc_mbist_start),
        .tcu_rtx_dmo_ctl (tcu_rtx_dmo_ctl[2:0]),
        .tcu_rtx_rxc_ipp0_mbist_start (tcu_rtx_rxc_ipp0_mbist_start),
        .tcu_rtx_rxc_ipp1_mbist_start (tcu_rtx_rxc_ipp1_mbist_start),
        .tcu_rtx_rxc_mb5_mbist_start (tcu_rtx_rxc_mb5_mbist_start),
        .tcu_rtx_rxc_mb6_mbist_start (tcu_rtx_rxc_mb6_mbist_start),
        .tcu_rtx_rxc_zcp0_mbist_start (tcu_rtx_rxc_zcp0_mbist_start),
        .tcu_rtx_rxc_zcp1_mbist_start (tcu_rtx_rxc_zcp1_mbist_start),
        .tcu_rtx_txc_txe0_mbist_start (tcu_rtx_txc_txe0_mbist_start),
        .tcu_rtx_txc_txe1_mbist_start (tcu_rtx_txc_txe1_mbist_start),
        .tcu_sbs_aclk (tcu_sbs_aclk),
        .tcu_sbs_acmode (tcu_sbs_acmode),
        .tcu_sbs_actestsignal (tcu_sbs_actestsignal),
        .tcu_sbs_bclk (tcu_sbs_bclk),
        .tcu_sbs_clk (tcu_sbs_clk),
        .tcu_sbs_enbspt (tcu_sbs_enbspt),
        .tcu_sbs_enbsrx (tcu_sbs_enbsrx),
        .tcu_sbs_enbstx (tcu_sbs_enbstx),
        .tcu_sbs_scan_en (tcu_sbs_scan_en),
        .tcu_sbs_uclk (tcu_sbs_uclk),
        .tcu_tds_smx_mbist_start (tcu_tds_smx_mbist_start),
        .tcu_tds_tdmc_mbist_start (tcu_tds_tdmc_mbist_start),
        .tds_mbist_scan_in (tds_mbist_scan_in),
        .VDDT_ESR (VDDT_ESR),
        .VDDA_ESR (VDDA_ESR),
        .VDDD_ESR (VDDD_ESR),
        .VDDR_ESR (VDDR_ESR),
        .VSSA_ESR (VSSA_ESR),
        .gl_io2x_out_c1b (gl_io2x_out_c1b),
        .gl_io_out_c1b (gl_io_out_c1b),
        .gl_rst_niu_wmr_c1b (gl_rst_niu_wmr_c1b),
        .tcu_asic_aclk (tcu_asic_aclk),
        .tcu_asic_bclk (tcu_asic_bclk),
        .tcu_asic_scan_en (tcu_asic_scan_en),
        .tcu_asic_se_scancollar_in (tcu_asic_se_scancollar_in),
        .tcu_asic_se_scancollar_out (tcu_asic_se_scancollar_out),
        .tcu_asic_array_wr_inhibit (tcu_asic_array_wr_inhibit),
        .tcu_soce_scan_out (tcu_soce_scan_out),
        .gl_rdp_io_clk_stop (gl_rdp_io_clk_stop),
        .tcu_soc4_scan_out (tcu_soc4_scan_out),
        .gl_tds_io_clk_stop (gl_tds_io_clk_stop),
        .tcu_socf_scan_out (tcu_socf_scan_out),
        .gl_rtx_io_clk_stop (gl_rtx_io_clk_stop),
        .gl_rst_mac_c1b (gl_rst_mac_c1b),
        .tcu_soc5_scan_out (tcu_soc5_scan_out),
        .tcu_mac_testmode (tcu_mac_testmode),
        .tcu_stcicfg (tcu_stcicfg[1:0]),
        .tcu_stciclk (tcu_stciclk),
        .esr_stcid (esr_stcid),
        .mio_esr_testclkr (mio_esr_testclkr),
        .mio_esr_testclkt (mio_esr_testclkt),
        .efu_niu_fclk (efu_niu_fclk),
        .efu_niu_fclrz (efu_niu_fclrz),
        .efu_niu_fdi (efu_niu_fdi),
        .tcu_sbs_bsinitclk (tcu_sbs_bsinitclk),
        .tcu_srd_atpgse (tcu_srd_atpgse),
        .tcu_srd_atpgmode (tcu_srd_atpgmode[2:0]),
        .XAUI0_AMUX (XAUI0_AMUX),
        .XAUI0_TX_N (XAUI0_TX_N[3:0]),
        .XAUI0_TX_P (XAUI0_TX_P[3:0]),
        .XAUI1_AMUX (XAUI1_AMUX),
        .XAUI1_TX_N (XAUI1_TX_N[3:0]),
        .XAUI1_TX_P (XAUI1_TX_P[3:0]),
        .arb0_rcr_data_req (arb0_rcr_data_req),
        .arb0_rcr_req_accept (arb0_rcr_req_accept),
        .arb0_rdc_data_req (arb0_rdc_data_req),
        .arb0_rdc_req_accept (arb0_rdc_req_accept),
        .arb1_rbr_req_accept (arb1_rbr_req_accept),
        .arb1_rbr_req_errors (arb1_rbr_req_errors),
        .esr_atpgq (esr_atpgq),
        .mac_mcu_3_sbs_output (mac_mcu_3_sbs_output),
        .mdoe (mdoe),
        .niu_dbg1_stall_ack (niu_dbg1_stall_ack),
        .niu_efu_4k_data (niu_efu_4k_data),
        .niu_efu_4k_xfer_en (niu_efu_4k_xfer_en),
        .niu_efu_cfifo0_data (niu_efu_cfifo0_data),
        .niu_efu_cfifo0_xfer_en (niu_efu_cfifo0_xfer_en),
        .niu_efu_cfifo1_data (niu_efu_cfifo1_data),
        .niu_efu_cfifo1_xfer_en (niu_efu_cfifo1_xfer_en),
        .niu_efu_ipp0_data (niu_efu_ipp0_data),
        .niu_efu_ipp0_xfer_en (niu_efu_ipp0_xfer_en),
        .niu_efu_ipp1_data (niu_efu_ipp1_data),
        .niu_efu_ipp1_xfer_en (niu_efu_ipp1_xfer_en),
        .niu_efu_mac0_ro_data (niu_efu_mac0_ro_data),
        .niu_efu_mac0_ro_xfer_en (niu_efu_mac0_ro_xfer_en),
        .niu_efu_mac0_sf_data (niu_efu_mac0_sf_data),
        .niu_efu_mac0_sf_xfer_en (niu_efu_mac0_sf_xfer_en),
        .niu_efu_mac1_ro_data (niu_efu_mac1_ro_data),
        .niu_efu_mac1_ro_xfer_en (niu_efu_mac1_ro_xfer_en),
        .niu_efu_mac1_sf_data (niu_efu_mac1_sf_data),
        .niu_efu_mac1_sf_xfer_en (niu_efu_mac1_sf_xfer_en),
        .niu_efu_ram0_data (niu_efu_ram0_data),
        .niu_efu_ram0_xfer_en (niu_efu_ram0_xfer_en),
        .niu_efu_ram1_data (niu_efu_ram1_data),
        .niu_efu_ram1_xfer_en (niu_efu_ram1_xfer_en),
        .niu_efu_ram_data (niu_efu_ram_data),
        .niu_efu_ram_xfer_en (niu_efu_ram_xfer_en),
        .niu_mio_debug_clock (niu_mio_debug_clock[1:0]),
        .niu_mio_debug_data (niu_mio_debug_data[31:0]),
        .niu_ncu_ctag_ce (niu_ncu_ctag_ce),
        .niu_ncu_ctag_ue (niu_ncu_ctag_ue),
        .niu_ncu_d_pe (niu_ncu_d_pe),
        .niu_ncu_data (niu_ncu_data[31:0]),
        .niu_ncu_stall (niu_ncu_stall),
        .niu_ncu_vld (niu_ncu_vld),
        .niu_sii_data (niu_sii_data[127:0]),
        .niu_sii_datareq (niu_sii_datareq),
        .niu_sii_hdr_vld (niu_sii_hdr_vld),
        .niu_sii_parity (niu_sii_parity[7:0]),
        .niu_sii_reqbypass (niu_sii_reqbypass),
        .niu_sio_dq (niu_sio_dq),
        .niu_txc_interrupts (niu_txc_interrupts),
        .rdp_rdmc_mbist_scan_out (rdp_rdmc_mbist_scan_out),
        .rdp_rdmc_tcu_mbist_done (rdp_rdmc_tcu_mbist_done),
        .rdp_rdmc_tcu_mbist_fail (rdp_rdmc_tcu_mbist_fail),
        .rdp_tcu_dmo_dout (rdp_tcu_dmo_dout[39:0]),
        .rtx_mbist_scan_out (rtx_mbist_scan_out),
        .rtx_rxc_ipp0_tcu_mbist_done (rtx_rxc_ipp0_tcu_mbist_done),
        .rtx_rxc_ipp0_tcu_mbist_fail (rtx_rxc_ipp0_tcu_mbist_fail),
        .rtx_rxc_ipp1_tcu_mbist_done (rtx_rxc_ipp1_tcu_mbist_done),
        .rtx_rxc_ipp1_tcu_mbist_fail (rtx_rxc_ipp1_tcu_mbist_fail),
        .rtx_rxc_mb5_tcu_mbist_done (rtx_rxc_mb5_tcu_mbist_done),
        .rtx_rxc_mb5_tcu_mbist_fail (rtx_rxc_mb5_tcu_mbist_fail),
        .rtx_rxc_mb6_tcu_mbist_done (rtx_rxc_mb6_tcu_mbist_done),
        .rtx_rxc_mb6_tcu_mbist_fail (rtx_rxc_mb6_tcu_mbist_fail),
        .rtx_rxc_zcp0_tcu_mbist_done (rtx_rxc_zcp0_tcu_mbist_done),
        .rtx_rxc_zcp0_tcu_mbist_fail (rtx_rxc_zcp0_tcu_mbist_fail),
        .rtx_rxc_zcp1_tcu_mbist_done (rtx_rxc_zcp1_tcu_mbist_done),
        .rtx_rxc_zcp1_tcu_mbist_fail (rtx_rxc_zcp1_tcu_mbist_fail),
        .rtx_tcu_dmo_data_out (rtx_tcu_dmo_data_out[39:0]),
        .rtx_txc_txe0_tcu_mbist_done (rtx_txc_txe0_tcu_mbist_done),
        .rtx_txc_txe0_tcu_mbist_fail (rtx_txc_txe0_tcu_mbist_fail),
        .rtx_txc_txe1_tcu_mbist_done (rtx_txc_txe1_tcu_mbist_done),
        .rtx_txc_txe1_tcu_mbist_fail (rtx_txc_txe1_tcu_mbist_fail),
        .tdmc_pio_intr (tdmc_pio_intr[63:0]),
        .tds_mbist_scan_out (tds_mbist_scan_out),
        .tds_smx_tcu_mbist_done (tds_smx_tcu_mbist_done),
        .tds_smx_tcu_mbist_fail (tds_smx_tcu_mbist_fail),
        .tds_tcu_dmo_dout (tds_tcu_dmo_dout[39:0]),
        .tds_tdmc_tcu_mbist_done (tds_tdmc_tcu_mbist_done),
        .tds_tdmc_tcu_mbist_fail (tds_tdmc_tcu_mbist_fail),
        .xaui_act_led_0 (xaui_act_led_0),
        .xaui_act_led_1 (xaui_act_led_1),
        .xaui_link_led_0 (xaui_link_led_0),
        .xaui_link_led_1 (xaui_link_led_1),
        .rdp_scan_out (rdp_scan_out),
        .tds_scan_out (tds_scan_out),
        .rtx_scan_out (rtx_scan_out),
        .mac_scan_out (mac_scan_out),
        .mdc (mdc),
        .esr_stciq (esr_stciq),
        .niu_efu_fdo (niu_efu_fdo)
);

`endif


`else

`ifdef OPENSPARC_CMP
`else

// - 4 repartitioned NIU blocks + esr module -  0304

// leave this instance out of cmp model
rdp rdp (
    .arb_pio_all_npwdirty            (arb_pio_all_npwdirty),                 //  <= 
    .arb_pio_all_rddirty             (arb_pio_all_rddirty),                  //  <= 
    .arb_pio_dirtid_npwstatus        (arb_pio_dirtid_npwstatus[ 5 : 0 ]),        //  <= 
    .arb_pio_dirtid_rdstatus         (arb_pio_dirtid_rdstatus[ 5 : 0 ]),         //  <= 
    .cluster_arst_l                  (cluster_arst_l),                       //  <= 
    .cmp_gclk_c0_rdp                 (cmp_gclk_c0_rdp),                      //  <= 
    .efu_niu_ram0_clr                (efu_niu_ram0_clr),                     //  <= 
    .efu_niu_ram0_xfer_en            (efu_niu_ram0_xfer_en),                 //  <= 
    .efu_niu_ram1_clr                (efu_niu_ram1_clr),                     //  <= 
    .efu_niu_ram1_xfer_en            (efu_niu_ram1_xfer_en),                 //  <= 
    .efu_niu_ram_data                (efu_niu_ram_data),                     //  <= 
    .fflp_debug_port                 (fflp_debug_port[ 31 : 0 ]),                //  <= 
    .fflp_pio_ack                    (fflp_pio_ack),                         //  <= 
    .fflp_pio_err                    (fflp_pio_err),                         //  <= 
    .fflp_pio_intr                   (fflp_pio_intr),                        //  <= 
    .fflp_pio_rdata                  (fflp_pio_rdata[ 63 : 0 ]),                 //  <= 
    .gl_rdp_io2x_out                 (gl_io2x_out_c1b),                      //  <= 
    .gl_rdp_io_out                   (gl_io_out_c1b),                        //  <= 
    .ipp_debug_port                  (ipp_debug_port[ 31 : 0 ]),                 //  <= 
    .ipp_dmc_dat_ack0                (ipp_dmc_dat_ack0),                     //  <= 
    .ipp_dmc_dat_ack1                (ipp_dmc_dat_ack1),                     //  <= 
    .ipp_dmc_dat_err0                (ipp_dmc_dat_err0),                     //  <= 
    .ipp_dmc_dat_err1                (ipp_dmc_dat_err1),                     //  <= 
    .ipp_dmc_data0                   (ipp_dmc_data0[ 129 : 0 ]),                 //  <= 
    .ipp_dmc_data1                   (ipp_dmc_data1[ 129 : 0 ]),                 //  <= 
    .ipp_dmc_ful_pkt0                (ipp_dmc_ful_pkt0),                     //  <= 
    .ipp_dmc_ful_pkt1                (ipp_dmc_ful_pkt1),                     //  <= 
    .ipp_pio_ack                     (ipp_pio_ack),                          //  <= 
    .ipp_pio_err                     (ipp_pio_err),                          //  <= 
    .ipp_pio_intr                    (ipp_pio_intr),                         //  <= 
    .ipp_pio_rdata                   (ipp_pio_rdata[ 63 : 0 ]),                  //  <= 
    .mac_debug_port                  (mac_debug_port[ 31 : 0 ]),                 //  <= 
    .mac_pio_ack                     (mac_pio_ack),                          //  <= 
    .mac_pio_err                     (mac_pio_err),                          //  <= 
    .mac_pio_intr0                   (mac_pio_intr0),                        //  <= 
    .mac_pio_intr1                   (mac_pio_intr1),                        //  <= 
    .mac_pio_rdata                   (mac_pio_rdata[ 63 : 0 ]),                  //  <= 
    .meta0_rdmc_rcr_ack_client       ({meta_dmc_ack_client_rdmc}),           //  <= 
    .meta0_rdmc_rcr_ack_cmd          (meta_dmc_ack_cmd),                     //  <= 
    .meta0_rdmc_rcr_ack_cmd_status   (meta_dmc_ack_cmd_status),              //  <= 
    .meta0_rdmc_rcr_ack_dma_num      (meta_dmc_ack_dma_num[ 4 : 0 ]),            //  <= 
    .meta0_rdmc_rcr_ack_ready        (meta_dmc_ack_ready),                   //  <= 
    .meta0_rdmc_rcr_data_req         (arb0_rcr_data_req),                    //  <= 
    .meta0_rdmc_rcr_req_accept       (arb0_rcr_req_accept),                  //  <= 
    .meta0_rdmc_wr_data_req          (arb0_rdc_data_req),                    //  <= 
    .meta0_rdmc_wr_req_accept        (arb0_rdc_req_accept),                  //  <= 
    .meta1_rdmc_rbr_req_accept       (arb1_rbr_req_accept),                  //  <= 
    .meta1_rdmc_rbr_req_error        (arb1_rbr_req_errors),                  //  <= 
    .meta1_rdmc_rbr_resp_byteenable  (meta1_rdmc_rbr_resp_byteenable[ 15 : 0 ]), //  <= 
    .meta1_rdmc_rbr_resp_client      ({meta_dmc_resp_client_rdmc}),          //  <= 
    .meta1_rdmc_rbr_resp_cmd         (meta1_rdmc_rbr_resp_cmd[ 7 : 0 ]),         //  <= 
    .meta1_rdmc_rbr_resp_cmd_status  (meta1_rdmc_rbr_resp_cmd_status[ 3 : 0 ]),  //  <= 
    .meta1_rdmc_rbr_resp_comp        ({meta_dmc_resp_complete_rdmc}),        //  <= 
    .meta1_rdmc_rbr_resp_data        (meta1_rdmc_rbr_resp_data[ 127 : 0 ]),      //  <= 
    .meta1_rdmc_rbr_resp_data_status (meta_dmc_data_status[ 3 : 0 ]),            //  <= 
    .meta1_rdmc_rbr_resp_data_valid  ({meta_dmc_data_valid_rdmc}),           //  <= 
    .meta1_rdmc_rbr_resp_dma_num     (meta1_rdmc_rbr_resp_dma_num[ 4 : 0 ]),     //  <= 
    .meta1_rdmc_rbr_resp_ready       (meta1_rdmc_rbr_resp_ready),            //  <= 
    .meta1_rdmc_rbr_resp_trans_comp  ({meta_dmc_resp_transfer_cmpl_rdmc}),   //  <= 
    .meta_arb_debug_port             (meta_arb_debug_port[ 31 : 0 ]),            //  <= 
    .mif_pio_intr                    (mif_pio_intr),                         //  <= 
    .ncu_niu_data                    (ncu_niu_data),                   //  <= 
    .ncu_niu_stall                   (ncu_niu_stall),                        //  <= 
    .ncu_niu_vld                     (ncu_niu_vld),                          //  <= 
    .rdp_rdmc_mbist_scan_in          (rdp_rdmc_mbist_scan_in),               //  <= 
    .rst_por_                        (gl_rst_niu_wmr_c1b),                              //  <= 
    .smx_debug_port                  (smx_debug_port[ 31 : 0 ]),                 //  <= 
    .smx_pio_intr                    (smx_pio_intr),                         //  <= 
    .smx_pio_status                  (smx_pio_status[ 31 : 0 ]),                 //  <= 
    .tcu_aclk                        (tcu_asic_aclk),                             //  <= 
    .tcu_bclk                        (tcu_asic_bclk),                             //  <= 
    .tcu_div_bypass                  (tcu_div_bypass),                       //  <= 
    .tcu_mbist_bisi_en               (tcu_mbist_bisi_en),                    //  <= 
    .tcu_mbist_user_mode             (tcu_mbist_user_mode),                  //  <= 
    .tcu_pce_ov                      (tcu_pce_ov),                           //  <= 
    .tcu_rdp_rdmc_mbist_start        (tcu_rdp_rdmc_mbist_start),             //  <= 
    .tcu_scan_en                     (tcu_asic_scan_en),                          //  <= 
    .tcu_se_scancollar_in            (tcu_asic_se_scancollar_in),                 //  <= 
    .tcu_se_scancollar_out           (tcu_asic_se_scancollar_out),                //  <= 
    .tdmc_debug_port                 (tdmc_debug_port[ 31 : 0 ]),                //  <= 
    .tdmc_pio_ack                    (tdmc_pio_ack),                         //  <= 
    .tdmc_pio_err                    (tdmc_pio_err),                         //  <= 
    .tdmc_pio_rdata                  (tdmc_pio_rdata[ 63 : 0 ]),                 //  <= 
    .txc_debug_port                  (txc_debug_port[ 31 : 0 ]),                 //  <= 
    .txc_pio_ack                     (txc_pio_ack),                          //  <= 
    .txc_pio_err                     (txc_pio_err),                          //  <= 
    .txc_pio_intr                    (niu_txc_interrupts),                   //  <= 
    .txc_pio_rdata                   (txc_pio_rdata[ 63 : 0 ]),                  //  <= 
    .zcp_debug_port                  (zcp_debug_port[ 31 : 0 ]),                 //  <= 
    .zcp_dmc_ack0                    (zcp_dmc_ack0),                         //  <= 
    .zcp_dmc_ack1                    (zcp_dmc_ack1),                         //  <= 
    .zcp_dmc_dat0                    (zcp_dmc_dat0[ 129 : 0 ]),                  //  <= 
    .zcp_dmc_dat1                    (zcp_dmc_dat1[ 129 : 0 ]),                  //  <= 
    .zcp_dmc_dat_err0                (zcp_dmc_dat_err0),                     //  <= 
    .zcp_dmc_dat_err1                (zcp_dmc_dat_err1),                     //  <= 
    .zcp_dmc_ful_pkt0                (zcp_dmc_ful_pkt0),                     //  <= 
    .zcp_dmc_ful_pkt1                (zcp_dmc_ful_pkt1),                     //  <= 
    .zcp_pio_ack                     (zcp_pio_ack),                          //  <= 
    .zcp_pio_err                     (zcp_pio_err),                          //  <= 
    .zcp_pio_intr                    (zcp_pio_intr),                         //  <= 
    .zcp_pio_rdata                   (zcp_pio_rdata[ 63 : 0 ]),                  //  <= 
    .dmc_ipp_dat_req0                (dmc_ipp_dat_req0),                     //  => 
    .dmc_ipp_dat_req1                (dmc_ipp_dat_req1),                     //  => 
    .dmc_zcp_req0                    (dmc_zcp_req0),                         //  => 
    .dmc_zcp_req1                    (dmc_zcp_req1),                         //  => 
    .mac_reset0                      (mac_reset0),                           //  => 
    .mac_reset1                      (mac_reset1),                           //  => 
    .niu_efu_ram0_xfer_en            (niu_efu_ram0_xfer_en),                 //  => 
    .niu_efu_ram1_xfer_en            (niu_efu_ram1_xfer_en),                 //  => 
    .niu_ncu_data                    (niu_ncu_data),                   //  => 
    .niu_ncu_stall                   (niu_ncu_stall),                        //  => 
    .niu_ncu_vld                     (niu_ncu_vld),                          //  => 
    .pio_arb_ctrl                    (pio_arb_ctrl[ 31 : 0 ]),                   //  => 
    .pio_arb_debug_vector            (pio_arb_debug_vector[ 31 : 0 ]),           //  => 
    .pio_arb_dirtid_clr              (pio_arb_dirtid_clr),                   //  => 
    .pio_arb_dirtid_enable           (pio_arb_dirtid_enable),                //  => 
    .pio_arb_np_threshold            (pio_arb_np_threshold[ 5 : 0 ]),            //  => 
    .pio_arb_rd_threshold            (pio_arb_rd_threshold[ 5 : 0 ]),            //  => 
    .pio_fflp_sel                    (pio_fflp_sel),                         //  => 
    .pio_ipp_sel                     (pio_ipp_sel),                          //  => 
    .pio_mac_sel                     (pio_mac_sel),                          //  => 
    .pio_smx_cfg_data                (pio_smx_cfg_data[ 31 : 0 ]),               //  => 
    .pio_smx_clear_intr              (pio_smx_clear_intr),                   //  => 
    .pio_smx_ctrl                    (pio_smx_ctrl[ 31 : 0 ]),                   //  => 
    .pio_smx_debug_vector            (pio_smx_debug_vector[ 31 : 0 ]),           //  => 
    .pio_tdmc_sel                    (pio_tdmc_sel),                         //  => 
    .pio_txc_sel                     (pio_txc_sel),                          //  => 
    .pio_zcp_sel                     (pio_zcp_sel),                          //  => 
    .rdmc_meta0_rcr_ack_accept       (rdmc_meta_ack_accept),                 //  => 
    .rdmc_meta0_rcr_data             (rcr_arb0_data[ 127 : 0 ]),                 //  => 
    .rdmc_meta0_rcr_data_valid       (rcr_arb0_data_valid),                  //  => 
    .rdmc_meta0_rcr_req              (rcr_arb0_req),                         //  => 
    .rdmc_meta0_rcr_req_address      (rcr_arb0_req_address[ 63 : 0 ]),           //  => 
    .rdmc_meta0_rcr_req_byteenable   (rcr_arb0_req_byteenable[ 15 : 0 ]),        //  => 
    .rdmc_meta0_rcr_req_cmd          (rcr_arb0_req_cmd[ 7 : 0 ]),                //  => 
    .rdmc_meta0_rcr_req_dma_num      (rcr_arb0_req_dma_num[ 4 : 0 ]),            //  => 
    .rdmc_meta0_rcr_req_func_num     (rcr_arb0_req_func_num[ 1 : 0 ]),           //  => 
    .rdmc_meta0_rcr_req_length       (rcr_arb0_req_length[ 13 : 0 ]),            //  => 
    .rdmc_meta0_rcr_req_port_num     (rcr_arb0_req_port_num[ 1 : 0 ]),           //  => 
    .rdmc_meta0_rcr_status           (rcr_arb0_status[ 3 : 0 ]),                 //  => 
    .rdmc_meta0_rcr_transfer_comp    (rcr_arb0_transfer_complete),           //  => 
    .rdmc_meta0_wr_data              (rdc_arb0_data[ 127 : 0 ]),                 //  => 
    .rdmc_meta0_wr_data_valid        (rdc_arb0_data_valid),                  //  => 
    .rdmc_meta0_wr_req               (rdc_arb0_req),                         //  => 
    .rdmc_meta0_wr_req_address       (rdc_arb0_req_address[ 63 : 0 ]),           //  => 
    .rdmc_meta0_wr_req_byteenable    (rdc_arb0_req_byteenable[ 15 : 0 ]),        //  => 
    .rdmc_meta0_wr_req_cmd           (rdc_arb0_req_cmd[ 7 : 0 ]),                //  => 
    .rdmc_meta0_wr_req_dma_num       (rdc_arb0_req_dma_num[ 4 : 0 ]),            //  => 
    .rdmc_meta0_wr_req_func_num      (rdc_arb0_req_func_num[ 1 : 0 ]),           //  => 
    .rdmc_meta0_wr_req_length        (rdc_arb0_req_length[ 13 : 0 ]),            //  => 
    .rdmc_meta0_wr_req_port_num      (rdc_arb0_req_port_num[ 1 : 0 ]),           //  => 
    .rdmc_meta0_wr_status            (rdc_arb0_status[ 3 : 0 ]),                 //  => 
    .rdmc_meta0_wr_transfer_comp     (rdc_arb0_transfer_complete),           //  => 
    .rdmc_meta1_rbr_req              (rbr_arb1_req),                         //  => 
    .rdmc_meta1_rbr_req_address      (rbr_arb1_req_address[ 63 : 0 ]),           //  => 
    .rdmc_meta1_rbr_req_cmd          (rbr_arb1_req_cmd[ 7 : 0 ]),                //  => 
    .rdmc_meta1_rbr_req_dma_num      (rbr_arb1_req_dma_num[ 4 : 0 ]),            //  => 
    .rdmc_meta1_rbr_req_func_num     (rbr_arb1_req_func_num[ 1 : 0 ]),           //  => 
    .rdmc_meta1_rbr_req_length       (rbr_arb1_req_length[ 13 : 0 ]),            //  => 
    .rdmc_meta1_rbr_req_port_num     (rbr_arb1_req_port_num),                //  => 
    .rdmc_meta1_rbr_resp_accept      (rdmc_meta_resp_accept),                //  => 
    .rdp_rdmc_mbist_scan_out         (rdp_rdmc_mbist_scan_out),              //  => 
    .rdp_rdmc_tcu_mbist_done         (rdp_rdmc_tcu_mbist_done),              //  => 
    .rdp_rdmc_tcu_mbist_fail         (rdp_rdmc_tcu_mbist_fail),              //  => 
    .rdp_tcu_dmo_dout                (rdp_tcu_dmo_dout[ 39 : 0 ]),               //  => 
    .tcu_wr_inhibit                  (tcu_asic_array_wr_inhibit),                       //  <= 
    .scan_in                         (tcu_soce_scan_out),                         //  <= 
    .scan_out                        (rdp_scan_out),                         //  => 
    .pio_clients_wdata               (pio_clients_wdata[ 63 : 0 ]),              //  => 
    .pio_clients_addr                (pio_clients_addr[ 19 : 0 ]),               //  => 
    .pio_clients_rd                  (pio_clients_rd),                       //  => 
    .dbg1_niu_dbg_sel                (dbg1_niu_dbg_sel[ 4 : 0 ]),                //  <= 
    .niu_mio_debug_clock             (niu_mio_debug_clock),             //  => 
    .niu_mio_debug_data              (niu_mio_debug_data),             //  => 
    .niu_efu_ram0_data               (niu_efu_ram0_data),                    //  => 
    .niu_efu_ram1_data               (niu_efu_ram1_data),                    //  => 
    .tcu_rdp_io_clk_stop             (gl_rdp_io_clk_stop),                   //  <= 
    .tdmc_pio_intri                  (tdmc_pio_intr[ 31 : 0 ]),                  //  <= 
    .tdmc_pio_intrj                  (tdmc_pio_intr[ 63 : 32 ]),
  .tcu_atpg_mode(tcu_atpg_mode)                  //  <= 
    );
`endif  // OPENSPARC_CMP



// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
tds tds (
    .cluster_arst_l                   (cluster_arst_l),                       //  <= 
    .cmp_gclk_c0_tds                  (cmp_gclk_c0_tds),                      //  <= 
    .dbg1_niu_resume                  (dbg1_niu_resume),                      //  <= 
    .dbg1_niu_stall                   (dbg1_niu_stall),                       //  <= 
    .efu_niu_ram_clr                  (efu_niu_ram_clr),                      //  <= 
    .efu_niu_ram_data                 (efu_niu_ram_data),                     //  <= 
    .efu_niu_ram_xfer_en              (efu_niu_ram_xfer_en),                  //  <= 
    .gl_tds_io2x_out                  (gl_io2x_out_c1b),                      //  <= 
    .gl_tds_io_out                    (gl_io_out_c1b),                        //  <= 
    .ncu_niu_ctag_cei                 (ncu_niu_ctag_cei),                     //  <= 
    .ncu_niu_ctag_uei                 (ncu_niu_ctag_uei),                     //  <= 
    .ncu_niu_d_pei                    (ncu_niu_d_pei),                        //  <= 
    .pio_arb_ctrl                     (pio_arb_ctrl[ 31 : 0 ]),                   //  <= 
    .pio_arb_debug_vector             (pio_arb_debug_vector[ 31 : 0 ]),           //  <= 
    .pio_arb_dirtid_clr               (pio_arb_dirtid_clr),                   //  <= 
    .pio_arb_dirtid_enable            (pio_arb_dirtid_enable),                //  <= 
    .pio_arb_np_threshold             (pio_arb_np_threshold[ 5 : 0 ]),            //  <= 
    .pio_arb_rd_threshold             (pio_arb_rd_threshold[ 5 : 0 ]),            //  <= 
    .pio_clients_addr                 (pio_clients_addr[ 19 : 0 ]),               //  <= 
    .pio_clients_rd                   (pio_clients_rd),                       //  <= 
    .pio_clients_wdata                (pio_clients_wdata[ 63 : 0 ]),              //  <= 
    .pio_smx_cfg_data                 (pio_smx_cfg_data[ 31 : 0 ]),               //  <= 
    .pio_smx_clear_intr               (pio_smx_clear_intr),                   //  <= 
    .pio_smx_ctrl                     (pio_smx_ctrl[ 31 : 0 ]),                   //  <= 
    .pio_smx_debug_vector             (pio_smx_debug_vector[ 31 : 0 ]),           //  <= 
    .pio_tdmc_sel                     (pio_tdmc_sel),                         //  <= 
    .rbr_arb1_req                     (rbr_arb1_req),                         //  <= 
    .rbr_arb1_req_address             (rbr_arb1_req_address[ 63 : 0 ]),           //  <= 
    .rbr_arb1_req_cmd                 (rbr_arb1_req_cmd[ 7 : 0 ]),                //  <= 
    .rbr_arb1_req_dma_num             (rbr_arb1_req_dma_num[ 4 : 0 ]),            //  <= 
    .rbr_arb1_req_func_num            (rbr_arb1_req_func_num[ 1 : 0 ]),           //  <= 
    .rbr_arb1_req_length              (rbr_arb1_req_length[ 13 : 0 ]),            //  <= 
    .rbr_arb1_req_port_num            (rbr_arb1_req_port_num[ 1 : 0 ]),           //  <= 
    .rcr_arb0_data                    (rcr_arb0_data[ 127 : 0 ]),                 //  <= 
    .rcr_arb0_data_valid              (rcr_arb0_data_valid),                  //  <= 
    .rcr_arb0_req                     (rcr_arb0_req),                         //  <= 
    .rcr_arb0_req_address             (rcr_arb0_req_address[ 63 : 0 ]),           //  <= 
    .rcr_arb0_req_byteenable          (rcr_arb0_req_byteenable[ 15 : 0 ]),        //  <= 
    .rcr_arb0_req_cmd                 (rcr_arb0_req_cmd[ 7 : 0 ]),                //  <= 
    .rcr_arb0_req_dma_num             (rcr_arb0_req_dma_num[ 4 : 0 ]),            //  <= 
    .rcr_arb0_req_func_num            (rcr_arb0_req_func_num[ 1 : 0 ]),           //  <= 
    .rcr_arb0_req_length              (rcr_arb0_req_length[ 13 : 0 ]),            //  <= 
    .rcr_arb0_req_port_num            (rcr_arb0_req_port_num[ 1 : 0 ]),           //  <= 
    .rcr_arb0_status                  (rcr_arb0_status[ 3 : 0 ]),                 //  <= 
    .rcr_arb0_transfer_complete       (rcr_arb0_transfer_complete),           //  <= 
    .rdc_arb0_data                    (rdc_arb0_data[ 127 : 0 ]),                 //  <= 
    .rdc_arb0_data_valid              (rdc_arb0_data_valid),                  //  <= 
    .rdc_arb0_req                     (rdc_arb0_req),                         //  <= 
    .rdc_arb0_req_address             (rdc_arb0_req_address[ 63 : 0 ]),           //  <= 
    .rdc_arb0_req_byteenable          (rdc_arb0_req_byteenable[ 15 : 0 ]),        //  <= 
    .rdc_arb0_req_cmd                 (rdc_arb0_req_cmd[ 7 : 0 ]),                //  <= 
    .rdc_arb0_req_dma_num             (rdc_arb0_req_dma_num[ 4 : 0 ]),            //  <= 
    .rdc_arb0_req_func_num            (rdc_arb0_req_func_num[ 1 : 0 ]),           //  <= 
    .rdc_arb0_req_length              (rdc_arb0_req_length[ 13 : 0 ]),            //  <= 
    .rdc_arb0_req_port_num            (rdc_arb0_req_port_num[ 1 : 0 ]),           //  <= 
    .rdc_arb0_status                  (rdc_arb0_status[ 3 : 0 ]),                 //  <= 
    .rdc_arb0_transfer_complete       (rdc_arb0_transfer_complete),           //  <= 
    .rdmc_meta_ack_accept             (rdmc_meta_ack_accept),                 //  <= 
    .rdmc_meta_resp_accept            (rdmc_meta_resp_accept),                //  <= 
    .rst_por_                         (gl_rst_niu_wmr_c1b),                              //  <= 
    .scan_in                          (tcu_soc4_scan_out),                         //  <= 
    .sii_niu_bqdq                     (sii_niu_bqdq),                         //  <= 
    .sii_niu_oqdq                     (sii_niu_oqdq),                         //  <= 
    .sio_niu_data                     (sio_niu_data),                  //  <= 
    .sio_niu_datareq                  (sio_niu_datareq),                      //  <= 
    .sio_niu_hdr_vld                  (sio_niu_hdr_vld),                      //  <= 
    .sio_niu_parity                   (sio_niu_parity),                  //  <= 
    .tcu_aclk                         (tcu_asic_aclk),                             //  <= 
    .tcu_bclk                         (tcu_asic_bclk),                             //  <= 
    .tcu_div_bypass                   (tcu_div_bypass),                       //  <= 
    .tcu_mbist_bisi_en                (tcu_mbist_bisi_en),                    //  <= 
    .tcu_mbist_user_mode              (tcu_mbist_user_mode),                  //  <= 
    .tcu_pce_ov                       (tcu_pce_ov),                           //  <= 
    .tcu_scan_en                      (tcu_asic_scan_en),                          //  <= 
    .tcu_se_scancollar_in             (tcu_asic_se_scancollar_in),                 //  <= 
    .tcu_se_scancollar_out            (tcu_asic_se_scancollar_out),                //  <= 
    .tcu_tds_io_clk_stop              (gl_tds_io_clk_stop),                   //  <= 
    .tcu_tds_smx_mbist_start          (tcu_tds_smx_mbist_start),              //  <= 
    .tcu_tds_tdmc_mbist_start         (tcu_tds_tdmc_mbist_start),             //  <= 
    .tcu_wr_inhibit                   (tcu_asic_array_wr_inhibit),                       //  <= 
    .tds_mbist_scan_in                (tds_mbist_scan_in),                    //  <= 
    .txc_arb1_req                     (txc_arb1_req),                         //  <= 
    .txc_arb1_req_address             (txc_arb1_req_address[ 63 : 0 ]),           //  <= 
    .txc_arb1_req_cmd                 (txc_arb1_req_cmd[ 7 : 0 ]),                //  <= 
    .txc_arb1_req_dma_num             (txc_arb1_req_dma_num[ 4 : 0 ]),            //  <= 
    .txc_arb1_req_func_num            (txc_arb1_req_func_num[ 1 : 0 ]),           //  <= 
    .txc_arb1_req_length              (txc_arb1_req_length[ 13 : 0 ]),            //  <= 
    .txc_arb1_req_port_num            (txc_arb1_req_port_num[ 1 : 0 ]),           //  <= 
    .txc_dmc_dma0_getnxtdesc          (txc_dmc_dma0_getnxtdesc),              //  <= 
    .txc_dmc_dma0_inc_head            (txc_dmc_dma0_inc_head),                //  <= 
    .txc_dmc_dma0_inc_pkt_cnt         (txc_dmc_dma0_inc_pkt_cnt),             //  <= 
    .txc_dmc_dma0_mark_bit            (txc_dmc_dma0_mark_bit),                //  <= 
    .txc_dmc_dma0_reset_done          (txc_dmc_dma0_reset_done),              //  <= 
    .txc_dmc_dma10_getnxtdesc         (txc_dmc_dma10_getnxtdesc),             //  <= 
    .txc_dmc_dma10_inc_head           (txc_dmc_dma10_inc_head),               //  <= 
    .txc_dmc_dma10_inc_pkt_cnt        (txc_dmc_dma10_inc_pkt_cnt),            //  <= 
    .txc_dmc_dma10_mark_bit           (txc_dmc_dma10_mark_bit),               //  <= 
    .txc_dmc_dma10_reset_done         (txc_dmc_dma10_reset_done),             //  <= 
    .txc_dmc_dma11_getnxtdesc         (txc_dmc_dma11_getnxtdesc),             //  <= 
    .txc_dmc_dma11_inc_head           (txc_dmc_dma11_inc_head),               //  <= 
    .txc_dmc_dma11_inc_pkt_cnt        (txc_dmc_dma11_inc_pkt_cnt),            //  <= 
    .txc_dmc_dma11_mark_bit           (txc_dmc_dma11_mark_bit),               //  <= 
    .txc_dmc_dma11_reset_done         (txc_dmc_dma11_reset_done),             //  <= 
    .txc_dmc_dma12_getnxtdesc         (txc_dmc_dma12_getnxtdesc),             //  <= 
    .txc_dmc_dma12_inc_head           (txc_dmc_dma12_inc_head),               //  <= 
    .txc_dmc_dma12_inc_pkt_cnt        (txc_dmc_dma12_inc_pkt_cnt),            //  <= 
    .txc_dmc_dma12_mark_bit           (txc_dmc_dma12_mark_bit),               //  <= 
    .txc_dmc_dma12_reset_done         (txc_dmc_dma12_reset_done),             //  <= 
    .txc_dmc_dma13_getnxtdesc         (txc_dmc_dma13_getnxtdesc),             //  <= 
    .txc_dmc_dma13_inc_head           (txc_dmc_dma13_inc_head),               //  <= 
    .txc_dmc_dma13_inc_pkt_cnt        (txc_dmc_dma13_inc_pkt_cnt),            //  <= 
    .txc_dmc_dma13_mark_bit           (txc_dmc_dma13_mark_bit),               //  <= 
    .txc_dmc_dma13_reset_done         (txc_dmc_dma13_reset_done),             //  <= 
    .txc_dmc_dma14_getnxtdesc         (txc_dmc_dma14_getnxtdesc),             //  <= 
    .txc_dmc_dma14_inc_head           (txc_dmc_dma14_inc_head),               //  <= 
    .txc_dmc_dma14_inc_pkt_cnt        (txc_dmc_dma14_inc_pkt_cnt),            //  <= 
    .txc_dmc_dma14_mark_bit           (txc_dmc_dma14_mark_bit),               //  <= 
    .txc_dmc_dma14_reset_done         (txc_dmc_dma14_reset_done),             //  <= 
    .txc_dmc_dma15_getnxtdesc         (txc_dmc_dma15_getnxtdesc),             //  <= 
    .txc_dmc_dma15_inc_head           (txc_dmc_dma15_inc_head),               //  <= 
    .txc_dmc_dma15_inc_pkt_cnt        (txc_dmc_dma15_inc_pkt_cnt),            //  <= 
    .txc_dmc_dma15_mark_bit           (txc_dmc_dma15_mark_bit),               //  <= 
    .txc_dmc_dma15_reset_done         (txc_dmc_dma15_reset_done),             //  <= 
    .txc_dmc_dma1_getnxtdesc          (txc_dmc_dma1_getnxtdesc),              //  <= 
    .txc_dmc_dma1_inc_head            (txc_dmc_dma1_inc_head),                //  <= 
    .txc_dmc_dma1_inc_pkt_cnt         (txc_dmc_dma1_inc_pkt_cnt),             //  <= 
    .txc_dmc_dma1_mark_bit            (txc_dmc_dma1_mark_bit),                //  <= 
    .txc_dmc_dma1_reset_done          (txc_dmc_dma1_reset_done),              //  <= 
    .txc_dmc_dma2_getnxtdesc          (txc_dmc_dma2_getnxtdesc),              //  <= 
    .txc_dmc_dma2_inc_head            (txc_dmc_dma2_inc_head),                //  <= 
    .txc_dmc_dma2_inc_pkt_cnt         (txc_dmc_dma2_inc_pkt_cnt),             //  <= 
    .txc_dmc_dma2_mark_bit            (txc_dmc_dma2_mark_bit),                //  <= 
    .txc_dmc_dma2_reset_done          (txc_dmc_dma2_reset_done),              //  <= 
    .txc_dmc_dma3_getnxtdesc          (txc_dmc_dma3_getnxtdesc),              //  <= 
    .txc_dmc_dma3_inc_head            (txc_dmc_dma3_inc_head),                //  <= 
    .txc_dmc_dma3_inc_pkt_cnt         (txc_dmc_dma3_inc_pkt_cnt),             //  <= 
    .txc_dmc_dma3_mark_bit            (txc_dmc_dma3_mark_bit),                //  <= 
    .txc_dmc_dma3_reset_done          (txc_dmc_dma3_reset_done),              //  <= 
    .txc_dmc_dma4_getnxtdesc          (txc_dmc_dma4_getnxtdesc),              //  <= 
    .txc_dmc_dma4_inc_head            (txc_dmc_dma4_inc_head),                //  <= 
    .txc_dmc_dma4_inc_pkt_cnt         (txc_dmc_dma4_inc_pkt_cnt),             //  <= 
    .txc_dmc_dma4_mark_bit            (txc_dmc_dma4_mark_bit),                //  <= 
    .txc_dmc_dma4_reset_done          (txc_dmc_dma4_reset_done),              //  <= 
    .txc_dmc_dma5_getnxtdesc          (txc_dmc_dma5_getnxtdesc),              //  <= 
    .txc_dmc_dma5_inc_head            (txc_dmc_dma5_inc_head),                //  <= 
    .txc_dmc_dma5_inc_pkt_cnt         (txc_dmc_dma5_inc_pkt_cnt),             //  <= 
    .txc_dmc_dma5_mark_bit            (txc_dmc_dma5_mark_bit),                //  <= 
    .txc_dmc_dma5_reset_done          (txc_dmc_dma5_reset_done),              //  <= 
    .txc_dmc_dma6_getnxtdesc          (txc_dmc_dma6_getnxtdesc),              //  <= 
    .txc_dmc_dma6_inc_head            (txc_dmc_dma6_inc_head),                //  <= 
    .txc_dmc_dma6_inc_pkt_cnt         (txc_dmc_dma6_inc_pkt_cnt),             //  <= 
    .txc_dmc_dma6_mark_bit            (txc_dmc_dma6_mark_bit),                //  <= 
    .txc_dmc_dma6_reset_done          (txc_dmc_dma6_reset_done),              //  <= 
    .txc_dmc_dma7_getnxtdesc          (txc_dmc_dma7_getnxtdesc),              //  <= 
    .txc_dmc_dma7_inc_head            (txc_dmc_dma7_inc_head),                //  <= 
    .txc_dmc_dma7_inc_pkt_cnt         (txc_dmc_dma7_inc_pkt_cnt),             //  <= 
    .txc_dmc_dma7_mark_bit            (txc_dmc_dma7_mark_bit),                //  <= 
    .txc_dmc_dma7_reset_done          (txc_dmc_dma7_reset_done),              //  <= 
    .txc_dmc_dma8_getnxtdesc          (txc_dmc_dma8_getnxtdesc),              //  <= 
    .txc_dmc_dma8_inc_head            (txc_dmc_dma8_inc_head),                //  <= 
    .txc_dmc_dma8_inc_pkt_cnt         (txc_dmc_dma8_inc_pkt_cnt),             //  <= 
    .txc_dmc_dma8_mark_bit            (txc_dmc_dma8_mark_bit),                //  <= 
    .txc_dmc_dma8_reset_done          (txc_dmc_dma8_reset_done),              //  <= 
    .txc_dmc_dma9_getnxtdesc          (txc_dmc_dma9_getnxtdesc),              //  <= 
    .txc_dmc_dma9_inc_head            (txc_dmc_dma9_inc_head),                //  <= 
    .txc_dmc_dma9_inc_pkt_cnt         (txc_dmc_dma9_inc_pkt_cnt),             //  <= 
    .txc_dmc_dma9_mark_bit            (txc_dmc_dma9_mark_bit),                //  <= 
    .txc_dmc_dma9_reset_done          (txc_dmc_dma9_reset_done),              //  <= 
    .txc_dmc_dma_nack_pkt_rd          (txc_dmc_dma_nack_pkt_rd[ 15 : 0 ]),        //  <= 
    .txc_dmc_nack_pkt_rd              (txc_dmc_nack_pkt_rd),                  //  <= 
    .txc_dmc_nack_pkt_rd_addr         (txc_dmc_nack_pkt_rd_addr[ 43 : 0 ]),       //  <= 
    .txc_dmc_p0_dma_pkt_size_err      (txc_dmc_p0_dma_pkt_size_err[ 15 : 0 ]),    //  <= 
    .txc_dmc_p0_pkt_size_err          (txc_dmc_p0_pkt_size_err),              //  <= 
    .txc_dmc_p0_pkt_size_err_addr     (txc_dmc_p0_pkt_size_err_addr[ 43 : 0 ]),   //  <= 
    .txc_dmc_p1_dma_pkt_size_err      (txc_dmc_p1_dma_pkt_size_err[ 15 : 0 ]),    //  <= 
    .txc_dmc_p1_pkt_size_err          (txc_dmc_p1_pkt_size_err),              //  <= 
    .txc_dmc_p1_pkt_size_err_addr     (txc_dmc_p1_pkt_size_err_addr[ 43 : 0 ]),   //  <= 
    .txc_meta_resp_accept             (txc_meta_resp_accept),                 //  <= 
    .arb0_rcr_data_req                (arb0_rcr_data_req),                    //  => 
    .arb0_rcr_req_accept              (arb0_rcr_req_accept),                  //  => 
    .arb0_rdc_data_req                (arb0_rdc_data_req),                    //  => 
    .arb0_rdc_req_accept              (arb0_rdc_req_accept),                  //  => 
    .arb1_rbr_req_accept              (arb1_rbr_req_accept),                  //  => 
    .arb1_rbr_req_errors              (arb1_rbr_req_errors),                  //  => 
    .arb1_txc_req_accept              (arb1_txc_req_accept),                  //  => 
    .arb_pio_all_npwdirty             (arb_pio_all_npwdirty),                 //  => 
    .arb_pio_all_rddirty              (arb_pio_all_rddirty),                  //  => 
    .arb_pio_dirtid_npwstatus         (arb_pio_dirtid_npwstatus[ 5 : 0 ]),        //  => 
    .arb_pio_dirtid_rdstatus          (arb_pio_dirtid_rdstatus[ 5 : 0 ]),         //  => 
    .dmc_meta1_req_trans_id            (dmc_meta1_req_trans_id[ 5 : 0 ]),           //  => 
    .dmc_txc_dma0_active              (dmc_txc_dma0_active),                  //  => 
    .dmc_txc_dma0_cacheready          (dmc_txc_dma0_cacheready),              //  => 
    .dmc_txc_dma0_descriptor          (dmc_txc_dma0_descriptor[ 63 : 0 ]),        //  => 
    .dmc_txc_dma0_eoflist             (dmc_txc_dma0_eoflist),                 //  => 
    .dmc_txc_dma0_error               (dmc_txc_dma0_error),                   //  => 
    .dmc_txc_dma0_func_num            (dmc_txc_dma0_func_num[ 1 : 0 ]),           //  => 
    .dmc_txc_dma0_gotnxtdesc          (dmc_txc_dma0_gotnxtdesc),              //  => 
    .dmc_txc_dma0_page_handle         (dmc_txc_dma0_page_handle[ 19 : 0 ]),       //  => 
    .dmc_txc_dma0_partial             (dmc_txc_dma0_partial),                 //  => 
    .dmc_txc_dma0_reset_scheduled     (dmc_txc_dma0_reset_scheduled),         //  => 
    .dmc_txc_dma10_active             (dmc_txc_dma10_active),                 //  => 
    .dmc_txc_dma10_cacheready         (dmc_txc_dma10_cacheready),             //  => 
    .dmc_txc_dma10_descriptor         (dmc_txc_dma10_descriptor[ 63 : 0 ]),       //  => 
    .dmc_txc_dma10_eoflist            (dmc_txc_dma10_eoflist),                //  => 
    .dmc_txc_dma10_error              (dmc_txc_dma10_error),                  //  => 
    .dmc_txc_dma10_func_num           (dmc_txc_dma10_func_num[ 1 : 0 ]),          //  => 
    .dmc_txc_dma10_gotnxtdesc         (dmc_txc_dma10_gotnxtdesc),             //  => 
    .dmc_txc_dma10_page_handle        (dmc_txc_dma10_page_handle[ 19 : 0 ]),      //  => 
    .dmc_txc_dma10_partial            (dmc_txc_dma10_partial),                //  => 
    .dmc_txc_dma10_reset_scheduled    (dmc_txc_dma10_reset_scheduled),        //  => 
    .dmc_txc_dma11_active             (dmc_txc_dma11_active),                 //  => 
    .dmc_txc_dma11_cacheready         (dmc_txc_dma11_cacheready),             //  => 
    .dmc_txc_dma11_descriptor         (dmc_txc_dma11_descriptor[ 63 : 0 ]),       //  => 
    .dmc_txc_dma11_eoflist            (dmc_txc_dma11_eoflist),                //  => 
    .dmc_txc_dma11_error              (dmc_txc_dma11_error),                  //  => 
    .dmc_txc_dma11_func_num           (dmc_txc_dma11_func_num[ 1 : 0 ]),          //  => 
    .dmc_txc_dma11_gotnxtdesc         (dmc_txc_dma11_gotnxtdesc),             //  => 
    .dmc_txc_dma11_page_handle        (dmc_txc_dma11_page_handle[ 19 : 0 ]),      //  => 
    .dmc_txc_dma11_partial            (dmc_txc_dma11_partial),                //  => 
    .dmc_txc_dma11_reset_scheduled    (dmc_txc_dma11_reset_scheduled),        //  => 
    .dmc_txc_dma12_active             (dmc_txc_dma12_active),                 //  => 
    .dmc_txc_dma12_cacheready         (dmc_txc_dma12_cacheready),             //  => 
    .dmc_txc_dma12_descriptor         (dmc_txc_dma12_descriptor[ 63 : 0 ]),       //  => 
    .dmc_txc_dma12_eoflist            (dmc_txc_dma12_eoflist),                //  => 
    .dmc_txc_dma12_error              (dmc_txc_dma12_error),                  //  => 
    .dmc_txc_dma12_func_num           (dmc_txc_dma12_func_num[ 1 : 0 ]),          //  => 
    .dmc_txc_dma12_gotnxtdesc         (dmc_txc_dma12_gotnxtdesc),             //  => 
    .dmc_txc_dma12_page_handle        (dmc_txc_dma12_page_handle[ 19 : 0 ]),      //  => 
    .dmc_txc_dma12_partial            (dmc_txc_dma12_partial),                //  => 
    .dmc_txc_dma12_reset_scheduled    (dmc_txc_dma12_reset_scheduled),        //  => 
    .dmc_txc_dma13_active             (dmc_txc_dma13_active),                 //  => 
    .dmc_txc_dma13_cacheready         (dmc_txc_dma13_cacheready),             //  => 
    .dmc_txc_dma13_descriptor         (dmc_txc_dma13_descriptor[ 63 : 0 ]),       //  => 
    .dmc_txc_dma13_eoflist            (dmc_txc_dma13_eoflist),                //  => 
    .dmc_txc_dma13_error              (dmc_txc_dma13_error),                  //  => 
    .dmc_txc_dma13_func_num           (dmc_txc_dma13_func_num[ 1 : 0 ]),          //  => 
    .dmc_txc_dma13_gotnxtdesc         (dmc_txc_dma13_gotnxtdesc),             //  => 
    .dmc_txc_dma13_page_handle        (dmc_txc_dma13_page_handle[ 19 : 0 ]),      //  => 
    .dmc_txc_dma13_partial            (dmc_txc_dma13_partial),                //  => 
    .dmc_txc_dma13_reset_scheduled    (dmc_txc_dma13_reset_scheduled),        //  => 
    .dmc_txc_dma14_active             (dmc_txc_dma14_active),                 //  => 
    .dmc_txc_dma14_cacheready         (dmc_txc_dma14_cacheready),             //  => 
    .dmc_txc_dma14_descriptor         (dmc_txc_dma14_descriptor[ 63 : 0 ]),       //  => 
    .dmc_txc_dma14_eoflist            (dmc_txc_dma14_eoflist),                //  => 
    .dmc_txc_dma14_error              (dmc_txc_dma14_error),                  //  => 
    .dmc_txc_dma14_func_num           (dmc_txc_dma14_func_num[ 1 : 0 ]),          //  => 
    .dmc_txc_dma14_gotnxtdesc         (dmc_txc_dma14_gotnxtdesc),             //  => 
    .dmc_txc_dma14_page_handle        (dmc_txc_dma14_page_handle[ 19 : 0 ]),      //  => 
    .dmc_txc_dma14_partial            (dmc_txc_dma14_partial),                //  => 
    .dmc_txc_dma14_reset_scheduled    (dmc_txc_dma14_reset_scheduled),        //  => 
    .dmc_txc_dma15_active             (dmc_txc_dma15_active),                 //  => 
    .dmc_txc_dma15_cacheready         (dmc_txc_dma15_cacheready),             //  => 
    .dmc_txc_dma15_descriptor         (dmc_txc_dma15_descriptor[ 63 : 0 ]),       //  => 
    .dmc_txc_dma15_eoflist            (dmc_txc_dma15_eoflist),                //  => 
    .dmc_txc_dma15_error              (dmc_txc_dma15_error),                  //  => 
    .dmc_txc_dma15_func_num           (dmc_txc_dma15_func_num[ 1 : 0 ]),          //  => 
    .dmc_txc_dma15_gotnxtdesc         (dmc_txc_dma15_gotnxtdesc),             //  => 
    .dmc_txc_dma15_page_handle        (dmc_txc_dma15_page_handle[ 19 : 0 ]),      //  => 
    .dmc_txc_dma15_partial            (dmc_txc_dma15_partial),                //  => 
    .dmc_txc_dma15_reset_scheduled    (dmc_txc_dma15_reset_scheduled),        //  => 
    .dmc_txc_dma1_active              (dmc_txc_dma1_active),                  //  => 
    .dmc_txc_dma1_cacheready          (dmc_txc_dma1_cacheready),              //  => 
    .dmc_txc_dma1_descriptor          (dmc_txc_dma1_descriptor[ 63 : 0 ]),        //  => 
    .dmc_txc_dma1_eoflist             (dmc_txc_dma1_eoflist),                 //  => 
    .dmc_txc_dma1_error               (dmc_txc_dma1_error),                   //  => 
    .dmc_txc_dma1_func_num            (dmc_txc_dma1_func_num[ 1 : 0 ]),           //  => 
    .dmc_txc_dma1_gotnxtdesc          (dmc_txc_dma1_gotnxtdesc),              //  => 
    .dmc_txc_dma1_page_handle         (dmc_txc_dma1_page_handle[ 19 : 0 ]),       //  => 
    .dmc_txc_dma1_partial             (dmc_txc_dma1_partial),                 //  => 
    .dmc_txc_dma1_reset_scheduled     (dmc_txc_dma1_reset_scheduled),         //  => 
    .dmc_txc_dma2_active              (dmc_txc_dma2_active),                  //  => 
    .dmc_txc_dma2_cacheready          (dmc_txc_dma2_cacheready),              //  => 
    .dmc_txc_dma2_descriptor          (dmc_txc_dma2_descriptor[ 63 : 0 ]),        //  => 
    .dmc_txc_dma2_eoflist             (dmc_txc_dma2_eoflist),                 //  => 
    .dmc_txc_dma2_error               (dmc_txc_dma2_error),                   //  => 
    .dmc_txc_dma2_func_num            (dmc_txc_dma2_func_num[ 1 : 0 ]),           //  => 
    .dmc_txc_dma2_gotnxtdesc          (dmc_txc_dma2_gotnxtdesc),              //  => 
    .dmc_txc_dma2_page_handle         (dmc_txc_dma2_page_handle[ 19 : 0 ]),       //  => 
    .dmc_txc_dma2_partial             (dmc_txc_dma2_partial),                 //  => 
    .dmc_txc_dma2_reset_scheduled     (dmc_txc_dma2_reset_scheduled),         //  => 
    .dmc_txc_dma3_active              (dmc_txc_dma3_active),                  //  => 
    .dmc_txc_dma3_cacheready          (dmc_txc_dma3_cacheready),              //  => 
    .dmc_txc_dma3_descriptor          (dmc_txc_dma3_descriptor[ 63 : 0 ]),        //  => 
    .dmc_txc_dma3_eoflist             (dmc_txc_dma3_eoflist),                 //  => 
    .dmc_txc_dma3_error               (dmc_txc_dma3_error),                   //  => 
    .dmc_txc_dma3_func_num            (dmc_txc_dma3_func_num[ 1 : 0 ]),           //  => 
    .dmc_txc_dma3_gotnxtdesc          (dmc_txc_dma3_gotnxtdesc),              //  => 
    .dmc_txc_dma3_page_handle         (dmc_txc_dma3_page_handle[ 19 : 0 ]),       //  => 
    .dmc_txc_dma3_partial             (dmc_txc_dma3_partial),                 //  => 
    .dmc_txc_dma3_reset_scheduled     (dmc_txc_dma3_reset_scheduled),         //  => 
    .dmc_txc_dma4_active              (dmc_txc_dma4_active),                  //  => 
    .dmc_txc_dma4_cacheready          (dmc_txc_dma4_cacheready),              //  => 
    .dmc_txc_dma4_descriptor          (dmc_txc_dma4_descriptor[ 63 : 0 ]),        //  => 
    .dmc_txc_dma4_eoflist             (dmc_txc_dma4_eoflist),                 //  => 
    .dmc_txc_dma4_error               (dmc_txc_dma4_error),                   //  => 
    .dmc_txc_dma4_func_num            (dmc_txc_dma4_func_num[ 1 : 0 ]),           //  => 
    .dmc_txc_dma4_gotnxtdesc          (dmc_txc_dma4_gotnxtdesc),              //  => 
    .dmc_txc_dma4_page_handle         (dmc_txc_dma4_page_handle[ 19 : 0 ]),       //  => 
    .dmc_txc_dma4_partial             (dmc_txc_dma4_partial),                 //  => 
    .dmc_txc_dma4_reset_scheduled     (dmc_txc_dma4_reset_scheduled),         //  => 
    .dmc_txc_dma5_active              (dmc_txc_dma5_active),                  //  => 
    .dmc_txc_dma5_cacheready          (dmc_txc_dma5_cacheready),              //  => 
    .dmc_txc_dma5_descriptor          (dmc_txc_dma5_descriptor[ 63 : 0 ]),        //  => 
    .dmc_txc_dma5_eoflist             (dmc_txc_dma5_eoflist),                 //  => 
    .dmc_txc_dma5_error               (dmc_txc_dma5_error),                   //  => 
    .dmc_txc_dma5_func_num            (dmc_txc_dma5_func_num[ 1 : 0 ]),           //  => 
    .dmc_txc_dma5_gotnxtdesc          (dmc_txc_dma5_gotnxtdesc),              //  => 
    .dmc_txc_dma5_page_handle         (dmc_txc_dma5_page_handle[ 19 : 0 ]),       //  => 
    .dmc_txc_dma5_partial             (dmc_txc_dma5_partial),                 //  => 
    .dmc_txc_dma5_reset_scheduled     (dmc_txc_dma5_reset_scheduled),         //  => 
    .dmc_txc_dma6_active              (dmc_txc_dma6_active),                  //  => 
    .dmc_txc_dma6_cacheready          (dmc_txc_dma6_cacheready),              //  => 
    .dmc_txc_dma6_descriptor          (dmc_txc_dma6_descriptor[ 63 : 0 ]),        //  => 
    .dmc_txc_dma6_eoflist             (dmc_txc_dma6_eoflist),                 //  => 
    .dmc_txc_dma6_error               (dmc_txc_dma6_error),                   //  => 
    .dmc_txc_dma6_func_num            (dmc_txc_dma6_func_num[ 1 : 0 ]),           //  => 
    .dmc_txc_dma6_gotnxtdesc          (dmc_txc_dma6_gotnxtdesc),              //  => 
    .dmc_txc_dma6_page_handle         (dmc_txc_dma6_page_handle[ 19 : 0 ]),       //  => 
    .dmc_txc_dma6_partial             (dmc_txc_dma6_partial),                 //  => 
    .dmc_txc_dma6_reset_scheduled     (dmc_txc_dma6_reset_scheduled),         //  => 
    .dmc_txc_dma7_active              (dmc_txc_dma7_active),                  //  => 
    .dmc_txc_dma7_cacheready          (dmc_txc_dma7_cacheready),              //  => 
    .dmc_txc_dma7_descriptor          (dmc_txc_dma7_descriptor[ 63 : 0 ]),        //  => 
    .dmc_txc_dma7_eoflist             (dmc_txc_dma7_eoflist),                 //  => 
    .dmc_txc_dma7_error               (dmc_txc_dma7_error),                   //  => 
    .dmc_txc_dma7_func_num            (dmc_txc_dma7_func_num[ 1 : 0 ]),           //  => 
    .dmc_txc_dma7_gotnxtdesc          (dmc_txc_dma7_gotnxtdesc),              //  => 
    .dmc_txc_dma7_page_handle         (dmc_txc_dma7_page_handle[ 19 : 0 ]),       //  => 
    .dmc_txc_dma7_partial             (dmc_txc_dma7_partial),                 //  => 
    .dmc_txc_dma7_reset_scheduled     (dmc_txc_dma7_reset_scheduled),         //  => 
    .dmc_txc_dma8_active              (dmc_txc_dma8_active),                  //  => 
    .dmc_txc_dma8_cacheready          (dmc_txc_dma8_cacheready),              //  => 
    .dmc_txc_dma8_descriptor          (dmc_txc_dma8_descriptor[ 63 : 0 ]),        //  => 
    .dmc_txc_dma8_eoflist             (dmc_txc_dma8_eoflist),                 //  => 
    .dmc_txc_dma8_error               (dmc_txc_dma8_error),                   //  => 
    .dmc_txc_dma8_func_num            (dmc_txc_dma8_func_num[ 1 : 0 ]),           //  => 
    .dmc_txc_dma8_gotnxtdesc          (dmc_txc_dma8_gotnxtdesc),              //  => 
    .dmc_txc_dma8_page_handle         (dmc_txc_dma8_page_handle[ 19 : 0 ]),       //  => 
    .dmc_txc_dma8_partial             (dmc_txc_dma8_partial),                 //  => 
    .dmc_txc_dma8_reset_scheduled     (dmc_txc_dma8_reset_scheduled),         //  => 
    .dmc_txc_dma9_active              (dmc_txc_dma9_active),                  //  => 
    .dmc_txc_dma9_cacheready          (dmc_txc_dma9_cacheready),              //  => 
    .dmc_txc_dma9_descriptor          (dmc_txc_dma9_descriptor[ 63 : 0 ]),        //  => 
    .dmc_txc_dma9_eoflist             (dmc_txc_dma9_eoflist),                 //  => 
    .dmc_txc_dma9_error               (dmc_txc_dma9_error),                   //  => 
    .dmc_txc_dma9_func_num            (dmc_txc_dma9_func_num[ 1 : 0 ]),           //  => 
    .dmc_txc_dma9_gotnxtdesc          (dmc_txc_dma9_gotnxtdesc),              //  => 
    .dmc_txc_dma9_page_handle         (dmc_txc_dma9_page_handle[ 19 : 0 ]),       //  => 
    .dmc_txc_dma9_partial             (dmc_txc_dma9_partial),                 //  => 
    .dmc_txc_dma9_reset_scheduled     (dmc_txc_dma9_reset_scheduled),         //  => 
    .dmc_txc_tx_addr_md               (dmc_txc_tx_addr_md),                   //  => 
    .meta1_rdmc_rbr_resp_byteenable   (meta1_rdmc_rbr_resp_byteenable[ 15 : 0 ]), //  => 
    .meta1_rdmc_rbr_resp_cmd          (meta1_rdmc_rbr_resp_cmd[ 7 : 0 ]),         //  => 
    .meta1_rdmc_rbr_resp_cmd_status   (meta1_rdmc_rbr_resp_cmd_status[ 3 : 0 ]),  //  => 
    .meta1_rdmc_rbr_resp_data         (meta1_rdmc_rbr_resp_data[ 127 : 0 ]),      //  => 
    .meta1_rdmc_rbr_resp_dma_num      (meta1_rdmc_rbr_resp_dma_num[ 4 : 0 ]),     //  => 
    .meta1_rdmc_rbr_resp_ready        (meta1_rdmc_rbr_resp_ready),            //  => 
    .meta_arb_debug_port              (meta_arb_debug_port[ 31 : 0 ]),            //  => 
    .meta_dmc_ack_client_rdmc         (meta_dmc_ack_client_rdmc),             //  => 
    .meta_dmc_ack_cmd                 (meta_dmc_ack_cmd[ 7 : 0 ]),                //  => 
    .meta_dmc_ack_cmd_status          (meta_dmc_ack_cmd_status[ 3 : 0 ]),         //  => 
    .meta_dmc_ack_dma_num             (meta_dmc_ack_dma_num[ 4 : 0 ]),            //  => 
    .meta_dmc_ack_ready               (meta_dmc_ack_ready),                   //  => 
    .meta_dmc_data                    (meta_dmc_data[ 127 : 0 ]),                 //  => 
    .meta_dmc_data_status             (meta_dmc_data_status[ 3 : 0 ]),            //  => 
    .meta_dmc_data_valid_rdmc         (meta_dmc_data_valid_rdmc),             //  => 
    .meta_dmc_data_valid_txc          (meta_dmc_data_valid_txc),              //  => 
    .meta_dmc_resp_address            (meta_dmc_resp_address[ 63 : 0 ]),          //  => 
    .meta_dmc_resp_byteenable         (meta_dmc_resp_byteenable[ 15 : 0 ]),       //  => 
    .meta_dmc_resp_client_rdmc        (meta_dmc_resp_client_rdmc),            //  => 
    .meta_dmc_resp_client_txc         (meta_dmc_resp_client_txc),             //  => 
    .meta_dmc_resp_cmd                (meta_dmc_resp_cmd[ 7 : 0 ]),               //  => 
    .meta_dmc_resp_cmd_status         (meta_dmc_resp_cmd_status[ 3 : 0 ]),        //  => 
    .meta_dmc_resp_complete_rdmc      (meta_dmc_resp_complete_rdmc),          //  => 
    .meta_dmc_resp_complete_txc       (meta_dmc_resp_complete_txc),           //  => 
    .meta_dmc_resp_dma_num            (meta_dmc_resp_dma_num[ 4 : 0 ]),           //  => 
    .meta_dmc_resp_length             (meta_dmc_resp_length[ 13 : 0 ]),           //  => 
    .meta_dmc_resp_port_num           (meta_dmc_resp_port_num[ 1 : 0 ]),          //  => 
    .meta_dmc_resp_ready              (meta_dmc_resp_ready),                  //  => 
    .meta_dmc_resp_trans_id            (meta_dmc_resp_trans_id[ 5 : 0 ]),           //  => 
    .meta_dmc_resp_transfer_cmpl_rdmc (meta_dmc_resp_transfer_cmpl_rdmc),     //  => 
    .meta_dmc_resp_transfer_cmpl_txc  (meta_dmc_resp_transfer_cmpl_txc),      //  => 
    .niu_dbg1_stall_ack               (niu_dbg1_stall_ack),                   //  => 
    .niu_efu_ram_data                 (niu_efu_ram_data),                     //  => 
    .niu_efu_ram_xfer_en              (niu_efu_ram_xfer_en),                  //  => 
    .niu_ncu_ctag_ce                  (niu_ncu_ctag_ce),                      //  => 
    .niu_ncu_ctag_ue                  (niu_ncu_ctag_ue),                      //  => 
    .niu_ncu_d_pe                     (niu_ncu_d_pe),                         //  => 
    .niu_sii_data                     (niu_sii_data),                  //  => 
    .niu_sii_datareq                  (niu_sii_datareq),                      //  => 
    .niu_sii_hdr_vld                  (niu_sii_hdr_vld),                      //  => 
    .niu_sii_parity                   (niu_sii_parity),                  //  => 
    .niu_sii_reqbypass                (niu_sii_reqbypass),                    //  => 
    .niu_sio_dq                       (niu_sio_dq),                           //  => 
    .scan_out                         (tds_scan_out),                         //  => 
    .smx_debug_port                   (smx_debug_port[ 31 : 0 ]),                 //  => 
    .smx_pio_intr                     (smx_pio_intr),                         //  => 
    .smx_pio_status                   (smx_pio_status[ 31 : 0 ]),                 //  => 
    .tdmc_debug_port                  (tdmc_debug_port[ 31 : 0 ]),                //  => 
    .tdmc_pio_ack                     (tdmc_pio_ack),                         //  => 
    .tdmc_pio_err                     (tdmc_pio_err),                         //  => 
    .tdmc_pio_intr                    (tdmc_pio_intr[ 63 : 0 ]),                  //  => 
    .tdmc_pio_rdata                   (tdmc_pio_rdata[ 63 : 0 ]),                 //  => 
    .tds_mbist_scan_out               (tds_mbist_scan_out),                   //  => 
    .tds_smx_tcu_mbist_done           (tds_smx_tcu_mbist_done),               //  => 
    .tds_smx_tcu_mbist_fail           (tds_smx_tcu_mbist_fail),               //  => 
    .tds_tcu_dmo_dout                 (tds_tcu_dmo_dout[ 39 : 0 ]),               //  => 
    .tds_tdmc_tcu_mbist_done          (tds_tdmc_tcu_mbist_done),              //  => 
    .tds_tdmc_tcu_mbist_fail          (tds_tdmc_tcu_mbist_fail),
  .tcu_atpg_mode(tcu_atpg_mode)               //  => 
    );
`endif  // OPENSPARC_CMP




// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
rtx rtx (
    .arb1_txc_req_accept           (arb1_txc_req_accept),                //  <= 
    .arb1_txc_req_transid          (dmc_meta1_req_trans_id[ 5 : 0 ]),              //  <= 
    .cluster_arst_l                (cluster_arst_l),                     //  <= 
    .cmp_gclk_c0_rtx               (cmp_gclk_c0_rtx),                    //  <= 
    .dmc_ipp_dat_req0              (dmc_ipp_dat_req0),                   //  <= 
    .dmc_ipp_dat_req1              (dmc_ipp_dat_req1),                   //  <= 
    .dmc_txc_dma0_active           (dmc_txc_dma0_active),                //  <= 
    .dmc_txc_dma0_cacheready       (dmc_txc_dma0_cacheready),            //  <= 
    .dmc_txc_dma0_descriptor       (dmc_txc_dma0_descriptor[ 63 : 0 ]),      //  <= 
    .dmc_txc_dma0_eoflist          (dmc_txc_dma0_eoflist),               //  <= 
    .dmc_txc_dma0_error            (dmc_txc_dma0_error),                 //  <= 
    .dmc_txc_dma0_func_num         (dmc_txc_dma0_func_num[ 1 : 0 ]),         //  <= 
    .dmc_txc_dma0_gotnxtdesc       (dmc_txc_dma0_gotnxtdesc),            //  <= 
    .dmc_txc_dma0_page_handle      (dmc_txc_dma0_page_handle[ 19 : 0 ]),     //  <= 
    .dmc_txc_dma0_partial          (dmc_txc_dma0_partial),               //  <= 
    .dmc_txc_dma0_reset_scheduled  (dmc_txc_dma0_reset_scheduled),       //  <= 
    .dmc_txc_dma10_active          (dmc_txc_dma10_active),               //  <= 
    .dmc_txc_dma10_cacheready      (dmc_txc_dma10_cacheready),           //  <= 
    .dmc_txc_dma10_descriptor      (dmc_txc_dma10_descriptor[ 63 : 0 ]),     //  <= 
    .dmc_txc_dma10_eoflist         (dmc_txc_dma10_eoflist),              //  <= 
    .dmc_txc_dma10_error           (dmc_txc_dma10_error),                //  <= 
    .dmc_txc_dma10_func_num        (dmc_txc_dma10_func_num[ 1 : 0 ]),        //  <= 
    .dmc_txc_dma10_gotnxtdesc      (dmc_txc_dma10_gotnxtdesc),           //  <= 
    .dmc_txc_dma10_page_handle     (dmc_txc_dma10_page_handle[ 19 : 0 ]),    //  <= 
    .dmc_txc_dma10_partial         (dmc_txc_dma10_partial),              //  <= 
    .dmc_txc_dma10_reset_scheduled (dmc_txc_dma10_reset_scheduled),      //  <= 
    .dmc_txc_dma11_active          (dmc_txc_dma11_active),               //  <= 
    .dmc_txc_dma11_cacheready      (dmc_txc_dma11_cacheready),           //  <= 
    .dmc_txc_dma11_descriptor      (dmc_txc_dma11_descriptor[ 63 : 0 ]),     //  <= 
    .dmc_txc_dma11_eoflist         (dmc_txc_dma11_eoflist),              //  <= 
    .dmc_txc_dma11_error           (dmc_txc_dma11_error),                //  <= 
    .dmc_txc_dma11_func_num        (dmc_txc_dma11_func_num[ 1 : 0 ]),        //  <= 
    .dmc_txc_dma11_gotnxtdesc      (dmc_txc_dma11_gotnxtdesc),           //  <= 
    .dmc_txc_dma11_page_handle     (dmc_txc_dma11_page_handle[ 19 : 0 ]),    //  <= 
    .dmc_txc_dma11_partial         (dmc_txc_dma11_partial),              //  <= 
    .dmc_txc_dma11_reset_scheduled (dmc_txc_dma11_reset_scheduled),      //  <= 
    .dmc_txc_dma12_active          (dmc_txc_dma12_active),               //  <= 
    .dmc_txc_dma12_cacheready      (dmc_txc_dma12_cacheready),           //  <= 
    .dmc_txc_dma12_descriptor      (dmc_txc_dma12_descriptor[ 63 : 0 ]),     //  <= 
    .dmc_txc_dma12_eoflist         (dmc_txc_dma12_eoflist),              //  <= 
    .dmc_txc_dma12_error           (dmc_txc_dma12_error),                //  <= 
    .dmc_txc_dma12_func_num        (dmc_txc_dma12_func_num[ 1 : 0 ]),        //  <= 
    .dmc_txc_dma12_gotnxtdesc      (dmc_txc_dma12_gotnxtdesc),           //  <= 
    .dmc_txc_dma12_page_handle     (dmc_txc_dma12_page_handle[ 19 : 0 ]),    //  <= 
    .dmc_txc_dma12_partial         (dmc_txc_dma12_partial),              //  <= 
    .dmc_txc_dma12_reset_scheduled (dmc_txc_dma12_reset_scheduled),      //  <= 
    .dmc_txc_dma13_active          (dmc_txc_dma13_active),               //  <= 
    .dmc_txc_dma13_cacheready      (dmc_txc_dma13_cacheready),           //  <= 
    .dmc_txc_dma13_descriptor      (dmc_txc_dma13_descriptor[ 63 : 0 ]),     //  <= 
    .dmc_txc_dma13_eoflist         (dmc_txc_dma13_eoflist),              //  <= 
    .dmc_txc_dma13_error           (dmc_txc_dma13_error),                //  <= 
    .dmc_txc_dma13_func_num        (dmc_txc_dma13_func_num[ 1 : 0 ]),        //  <= 
    .dmc_txc_dma13_gotnxtdesc      (dmc_txc_dma13_gotnxtdesc),           //  <= 
    .dmc_txc_dma13_page_handle     (dmc_txc_dma13_page_handle[ 19 : 0 ]),    //  <= 
    .dmc_txc_dma13_partial         (dmc_txc_dma13_partial),              //  <= 
    .dmc_txc_dma13_reset_scheduled (dmc_txc_dma13_reset_scheduled),      //  <= 
    .dmc_txc_dma14_active          (dmc_txc_dma14_active),               //  <= 
    .dmc_txc_dma14_cacheready      (dmc_txc_dma14_cacheready),           //  <= 
    .dmc_txc_dma14_descriptor      (dmc_txc_dma14_descriptor[ 63 : 0 ]),     //  <= 
    .dmc_txc_dma14_eoflist         (dmc_txc_dma14_eoflist),              //  <= 
    .dmc_txc_dma14_error           (dmc_txc_dma14_error),                //  <= 
    .dmc_txc_dma14_func_num        (dmc_txc_dma14_func_num[ 1 : 0 ]),        //  <= 
    .dmc_txc_dma14_gotnxtdesc      (dmc_txc_dma14_gotnxtdesc),           //  <= 
    .dmc_txc_dma14_page_handle     (dmc_txc_dma14_page_handle[ 19 : 0 ]),    //  <= 
    .dmc_txc_dma14_partial         (dmc_txc_dma14_partial),              //  <= 
    .dmc_txc_dma14_reset_scheduled (dmc_txc_dma14_reset_scheduled),      //  <= 
    .dmc_txc_dma15_active          (dmc_txc_dma15_active),               //  <= 
    .dmc_txc_dma15_cacheready      (dmc_txc_dma15_cacheready),           //  <= 
    .dmc_txc_dma15_descriptor      (dmc_txc_dma15_descriptor[ 63 : 0 ]),     //  <= 
    .dmc_txc_dma15_eoflist         (dmc_txc_dma15_eoflist),              //  <= 
    .dmc_txc_dma15_error           (dmc_txc_dma15_error),                //  <= 
    .dmc_txc_dma15_func_num        (dmc_txc_dma15_func_num[ 1 : 0 ]),        //  <= 
    .dmc_txc_dma15_gotnxtdesc      (dmc_txc_dma15_gotnxtdesc),           //  <= 
    .dmc_txc_dma15_page_handle     (dmc_txc_dma15_page_handle[ 19 : 0 ]),    //  <= 
    .dmc_txc_dma15_partial         (dmc_txc_dma15_partial),              //  <= 
    .dmc_txc_dma15_reset_scheduled (dmc_txc_dma15_reset_scheduled),      //  <= 
    .dmc_txc_dma1_active           (dmc_txc_dma1_active),                //  <= 
    .dmc_txc_dma1_cacheready       (dmc_txc_dma1_cacheready),            //  <= 
    .dmc_txc_dma1_descriptor       (dmc_txc_dma1_descriptor[ 63 : 0 ]),      //  <= 
    .dmc_txc_dma1_eoflist          (dmc_txc_dma1_eoflist),               //  <= 
    .dmc_txc_dma1_error            (dmc_txc_dma1_error),                 //  <= 
    .dmc_txc_dma1_func_num         (dmc_txc_dma1_func_num[ 1 : 0 ]),         //  <= 
    .dmc_txc_dma1_gotnxtdesc       (dmc_txc_dma1_gotnxtdesc),            //  <= 
    .dmc_txc_dma1_page_handle      (dmc_txc_dma1_page_handle[ 19 : 0 ]),     //  <= 
    .dmc_txc_dma1_partial          (dmc_txc_dma1_partial),               //  <= 
    .dmc_txc_dma1_reset_scheduled  (dmc_txc_dma1_reset_scheduled),       //  <= 
    .dmc_txc_dma2_active           (dmc_txc_dma2_active),                //  <= 
    .dmc_txc_dma2_cacheready       (dmc_txc_dma2_cacheready),            //  <= 
    .dmc_txc_dma2_descriptor       (dmc_txc_dma2_descriptor[ 63 : 0 ]),      //  <= 
    .dmc_txc_dma2_eoflist          (dmc_txc_dma2_eoflist),               //  <= 
    .dmc_txc_dma2_error            (dmc_txc_dma2_error),                 //  <= 
    .dmc_txc_dma2_func_num         (dmc_txc_dma2_func_num[ 1 : 0 ]),         //  <= 
    .dmc_txc_dma2_gotnxtdesc       (dmc_txc_dma2_gotnxtdesc),            //  <= 
    .dmc_txc_dma2_page_handle      (dmc_txc_dma2_page_handle[ 19 : 0 ]),     //  <= 
    .dmc_txc_dma2_partial          (dmc_txc_dma2_partial),               //  <= 
    .dmc_txc_dma2_reset_scheduled  (dmc_txc_dma2_reset_scheduled),       //  <= 
    .dmc_txc_dma3_active           (dmc_txc_dma3_active),                //  <= 
    .dmc_txc_dma3_cacheready       (dmc_txc_dma3_cacheready),            //  <= 
    .dmc_txc_dma3_descriptor       (dmc_txc_dma3_descriptor[ 63 : 0 ]),      //  <= 
    .dmc_txc_dma3_eoflist          (dmc_txc_dma3_eoflist),               //  <= 
    .dmc_txc_dma3_error            (dmc_txc_dma3_error),                 //  <= 
    .dmc_txc_dma3_func_num         (dmc_txc_dma3_func_num[ 1 : 0 ]),         //  <= 
    .dmc_txc_dma3_gotnxtdesc       (dmc_txc_dma3_gotnxtdesc),            //  <= 
    .dmc_txc_dma3_page_handle      (dmc_txc_dma3_page_handle[ 19 : 0 ]),     //  <= 
    .dmc_txc_dma3_partial          (dmc_txc_dma3_partial),               //  <= 
    .dmc_txc_dma3_reset_scheduled  (dmc_txc_dma3_reset_scheduled),       //  <= 
    .dmc_txc_dma4_active           (dmc_txc_dma4_active),                //  <= 
    .dmc_txc_dma4_cacheready       (dmc_txc_dma4_cacheready),            //  <= 
    .dmc_txc_dma4_descriptor       (dmc_txc_dma4_descriptor[ 63 : 0 ]),      //  <= 
    .dmc_txc_dma4_eoflist          (dmc_txc_dma4_eoflist),               //  <= 
    .dmc_txc_dma4_error            (dmc_txc_dma4_error),                 //  <= 
    .dmc_txc_dma4_func_num         (dmc_txc_dma4_func_num[ 1 : 0 ]),         //  <= 
    .dmc_txc_dma4_gotnxtdesc       (dmc_txc_dma4_gotnxtdesc),            //  <= 
    .dmc_txc_dma4_page_handle      (dmc_txc_dma4_page_handle[ 19 : 0 ]),     //  <= 
    .dmc_txc_dma4_partial          (dmc_txc_dma4_partial),               //  <= 
    .dmc_txc_dma4_reset_scheduled  (dmc_txc_dma4_reset_scheduled),       //  <= 
    .dmc_txc_dma5_active           (dmc_txc_dma5_active),                //  <= 
    .dmc_txc_dma5_cacheready       (dmc_txc_dma5_cacheready),            //  <= 
    .dmc_txc_dma5_descriptor       (dmc_txc_dma5_descriptor[ 63 : 0 ]),      //  <= 
    .dmc_txc_dma5_eoflist          (dmc_txc_dma5_eoflist),               //  <= 
    .dmc_txc_dma5_error            (dmc_txc_dma5_error),                 //  <= 
    .dmc_txc_dma5_func_num         (dmc_txc_dma5_func_num[ 1 : 0 ]),         //  <= 
    .dmc_txc_dma5_gotnxtdesc       (dmc_txc_dma5_gotnxtdesc),            //  <= 
    .dmc_txc_dma5_page_handle      (dmc_txc_dma5_page_handle[ 19 : 0 ]),     //  <= 
    .dmc_txc_dma5_partial          (dmc_txc_dma5_partial),               //  <= 
    .dmc_txc_dma5_reset_scheduled  (dmc_txc_dma5_reset_scheduled),       //  <= 
    .dmc_txc_dma6_active           (dmc_txc_dma6_active),                //  <= 
    .dmc_txc_dma6_cacheready       (dmc_txc_dma6_cacheready),            //  <= 
    .dmc_txc_dma6_descriptor       (dmc_txc_dma6_descriptor[ 63 : 0 ]),      //  <= 
    .dmc_txc_dma6_eoflist          (dmc_txc_dma6_eoflist),               //  <= 
    .dmc_txc_dma6_error            (dmc_txc_dma6_error),                 //  <= 
    .dmc_txc_dma6_func_num         (dmc_txc_dma6_func_num[ 1 : 0 ]),         //  <= 
    .dmc_txc_dma6_gotnxtdesc       (dmc_txc_dma6_gotnxtdesc),            //  <= 
    .dmc_txc_dma6_page_handle      (dmc_txc_dma6_page_handle[ 19 : 0 ]),     //  <= 
    .dmc_txc_dma6_partial          (dmc_txc_dma6_partial),               //  <= 
    .dmc_txc_dma6_reset_scheduled  (dmc_txc_dma6_reset_scheduled),       //  <= 
    .dmc_txc_dma7_active           (dmc_txc_dma7_active),                //  <= 
    .dmc_txc_dma7_cacheready       (dmc_txc_dma7_cacheready),            //  <= 
    .dmc_txc_dma7_descriptor       (dmc_txc_dma7_descriptor[ 63 : 0 ]),      //  <= 
    .dmc_txc_dma7_eoflist          (dmc_txc_dma7_eoflist),               //  <= 
    .dmc_txc_dma7_error            (dmc_txc_dma7_error),                 //  <= 
    .dmc_txc_dma7_func_num         (dmc_txc_dma7_func_num[ 1 : 0 ]),         //  <= 
    .dmc_txc_dma7_gotnxtdesc       (dmc_txc_dma7_gotnxtdesc),            //  <= 
    .dmc_txc_dma7_page_handle      (dmc_txc_dma7_page_handle[ 19 : 0 ]),     //  <= 
    .dmc_txc_dma7_partial          (dmc_txc_dma7_partial),               //  <= 
    .dmc_txc_dma7_reset_scheduled  (dmc_txc_dma7_reset_scheduled),       //  <= 
    .dmc_txc_dma8_active           (dmc_txc_dma8_active),                //  <= 
    .dmc_txc_dma8_cacheready       (dmc_txc_dma8_cacheready),            //  <= 
    .dmc_txc_dma8_descriptor       (dmc_txc_dma8_descriptor[ 63 : 0 ]),      //  <= 
    .dmc_txc_dma8_eoflist          (dmc_txc_dma8_eoflist),               //  <= 
    .dmc_txc_dma8_error            (dmc_txc_dma8_error),                 //  <= 
    .dmc_txc_dma8_func_num         (dmc_txc_dma8_func_num[ 1 : 0 ]),         //  <= 
    .dmc_txc_dma8_gotnxtdesc       (dmc_txc_dma8_gotnxtdesc),            //  <= 
    .dmc_txc_dma8_page_handle      (dmc_txc_dma8_page_handle[ 19 : 0 ]),     //  <= 
    .dmc_txc_dma8_partial          (dmc_txc_dma8_partial),               //  <= 
    .dmc_txc_dma8_reset_scheduled  (dmc_txc_dma8_reset_scheduled),       //  <= 
    .dmc_txc_dma9_active           (dmc_txc_dma9_active),                //  <= 
    .dmc_txc_dma9_cacheready       (dmc_txc_dma9_cacheready),            //  <= 
    .dmc_txc_dma9_descriptor       (dmc_txc_dma9_descriptor[ 63 : 0 ]),      //  <= 
    .dmc_txc_dma9_eoflist          (dmc_txc_dma9_eoflist),               //  <= 
    .dmc_txc_dma9_error            (dmc_txc_dma9_error),                 //  <= 
    .dmc_txc_dma9_func_num         (dmc_txc_dma9_func_num[ 1 : 0 ]),         //  <= 
    .dmc_txc_dma9_gotnxtdesc       (dmc_txc_dma9_gotnxtdesc),            //  <= 
    .dmc_txc_dma9_page_handle      (dmc_txc_dma9_page_handle[ 19 : 0 ]),     //  <= 
    .dmc_txc_dma9_partial          (dmc_txc_dma9_partial),               //  <= 
    .dmc_txc_dma9_reset_scheduled  (dmc_txc_dma9_reset_scheduled),       //  <= 
    .dmc_txc_tx_addr_md            (dmc_txc_tx_addr_md),                 //  <= 
    .dmc_zcp_req0                  (dmc_zcp_req0),                       //  <= 
    .dmc_zcp_req1                  (dmc_zcp_req1),                       //  <= 
    .efu_niu_4k_clr                (efu_niu_4k_clr),                     //  <= 
    .efu_niu_4k_data               (efu_niu_4k_data),                    //  <= 
    .efu_niu_4k_xfer_en            (efu_niu_4k_xfer_en),                 //  <= 
    .efu_niu_cfifo0_clr            (efu_niu_cfifo0_clr),                 //  <= 
    .efu_niu_cfifo0_xfer_en        (efu_niu_cfifo0_xfer_en),             //  <= 
    .efu_niu_cfifo1_clr            (efu_niu_cfifo1_clr),                 //  <= 
    .efu_niu_cfifo1_xfer_en        (efu_niu_cfifo1_xfer_en),             //  <= 
    .efu_niu_cfifo_data            (efu_niu_cfifo_data),                 //  <= 
    .efu_niu_ipp0_clr              (efu_niu_ipp0_clr),                   //  <= 
    .efu_niu_ipp0_xfer_en          (efu_niu_ipp0_xfer_en),               //  <= 
    .efu_niu_ipp1_clr              (efu_niu_ipp1_clr),                   //  <= 
    .efu_niu_ipp1_xfer_en          (efu_niu_ipp1_xfer_en),               //  <= 
    .efu_niu_mac01_sfro_data       (efu_niu_mac01_sfro_data),            //  <= 
    .efu_niu_mac0_ro_clr           (efu_niu_mac0_ro_clr),                //  <= 
    .efu_niu_mac0_ro_xfer_en       (efu_niu_mac0_ro_xfer_en),            //  <= 
    .efu_niu_mac0_sf_clr           (efu_niu_mac0_sf_clr),                //  <= 
    .efu_niu_mac0_sf_xfer_en       (efu_niu_mac0_sf_xfer_en),            //  <= 
    .efu_niu_mac1_ro_clr           (efu_niu_mac1_ro_clr),                //  <= 
    .efu_niu_mac1_ro_xfer_en       (efu_niu_mac1_ro_xfer_en),            //  <= 
    .efu_niu_mac1_sf_clr           (efu_niu_mac1_sf_clr),                //  <= 
    .efu_niu_mac1_sf_xfer_en       (efu_niu_mac1_sf_xfer_en),            //  <= 
    .gl_rtx_io2x_out               (gl_io2x_out_c1b),                    //  <= 
    .gl_rtx_io_out                 (gl_io_out_c1b),                      //  <= 
    .mac_rxc_ack0                  (mac_rxc_ack0),                       //  <= 
    .mac_rxc_ack1                  (mac_rxc_ack1),                       //  <= 
    .mac_rxc_ctrl0                 (mac_rxc_ctrl0),                      //  <= 
    .mac_rxc_ctrl1                 (mac_rxc_ctrl1),                      //  <= 
    .mac_rxc_data0                 (mac_rxc_data0[ 63 : 0 ]),                //  <= 
    .mac_rxc_data1                 (mac_rxc_data1[ 63 : 0 ]),                //  <= 
    .mac_rxc_stat0                 (mac_rxc_stat0[ 22 : 0 ]),                //  <= 
    .mac_rxc_stat1                 (mac_rxc_stat1[ 22 : 0 ]),                //  <= 
    .mac_rxc_tag0                  (mac_rxc_tag0),                       //  <= 
    .mac_rxc_tag1                  (mac_rxc_tag1),                       //  <= 
    .mac_txc_req0                  (mac_txc_req0),                       //  <= 
    .mac_txc_req1                  (mac_txc_req1),                       //  <= 
    .meta_dmc_data                 (meta_dmc_data[ 127 : 0 ]),               //  <= 
    .meta_dmc_data_valid           (meta_dmc_data_valid_txc),            //  <= 
    .meta_dmc_resp_address         (meta_dmc_resp_address[ 63 : 0 ]),        //  <= 
    .meta_dmc_resp_byteenable      (meta_dmc_resp_byteenable[ 15 : 0 ]),     //  <= 
    .meta_dmc_resp_client          (meta_dmc_resp_client_txc),           //  <= 
    .meta_dmc_resp_cmd             (meta_dmc_resp_cmd[ 7 : 0 ]),             //  <= 
    .meta_dmc_resp_cmd_status      (meta_dmc_resp_cmd_status[ 3 : 0 ]),      //  <= 
    .meta_dmc_resp_complete        (meta_dmc_resp_complete_txc),         //  <= 
    .meta_dmc_resp_data_status     (meta_dmc_data_status[ 3 : 0 ]),          //  <= 
    .meta_dmc_resp_dma_num         (meta_dmc_resp_dma_num[ 4 : 0 ]),         //  <= 
    .meta_dmc_resp_length          (meta_dmc_resp_length[ 13 : 0 ]),         //  <= 
    .meta_dmc_resp_port_num        (meta_dmc_resp_port_num[ 1 : 0 ]),        //  <= 
    .meta_dmc_resp_ready           (meta_dmc_resp_ready),                //  <= 
    .meta_dmc_resp_trans_id         (meta_dmc_resp_trans_id[ 5 : 0 ]),         //  <= 
    .meta_dmc_resp_transfer_cmpl   (meta_dmc_resp_transfer_cmpl_txc),    //  <= 
    .pio_clients_addr              (pio_clients_addr[ 19 : 0 ]),             //  <= 
    .pio_clients_rd                (pio_clients_rd),                     //  <= 
    .pio_clients_wdata             (pio_clients_wdata[ 63 : 0 ]),            //  <= 
    .pio_fflp_sel                  (pio_fflp_sel),                       //  <= 
    .pio_ipp_sel                   (pio_ipp_sel),                        //  <= 
    .pio_txc_sel                   (pio_txc_sel),                        //  <= 
    .pio_zcp_sel                   (pio_zcp_sel),                        //  <= 
    .rst_por_                      (gl_rst_niu_wmr_c1b),                            //  <= 
    .rtx_mbist_scan_in             (rtx_mbist_scan_in),                  //  <= 
    .scan_in                       (tcu_socf_scan_out),                            //  <= 
    .tcu_aclk                      (tcu_asic_aclk),                           //  <= 
    .tcu_bclk                      (tcu_asic_bclk),                           //  <= 
    .tcu_div_bypass                (tcu_div_bypass),                     //  <= 
    .tcu_mbist_bisi_en             (tcu_mbist_bisi_en),                  //  <= 
    .tcu_mbist_user_mode           (tcu_mbist_user_mode),                //  <= 
    .tcu_pce_ov                    (tcu_pce_ov),                         //  <= 
    .tcu_rtx_dmo_ctl               (tcu_rtx_dmo_ctl[ 2 : 0 ]),               //  <= 
    .tcu_rtx_io_clk_stop           (gl_rtx_io_clk_stop),                 //  <= 
    .tcu_rtx_rxc_ipp0_mbist_start  (tcu_rtx_rxc_ipp0_mbist_start),       //  <= 
    .tcu_rtx_rxc_ipp1_mbist_start  (tcu_rtx_rxc_ipp1_mbist_start),       //  <= 
    .tcu_rtx_rxc_mb5_mbist_start   (tcu_rtx_rxc_mb5_mbist_start),        //  <= 
    .tcu_rtx_rxc_mb6_mbist_start   (tcu_rtx_rxc_mb6_mbist_start),        //  <= 
    .tcu_rtx_rxc_zcp0_mbist_start  (tcu_rtx_rxc_zcp0_mbist_start),       //  <= 
    .tcu_rtx_rxc_zcp1_mbist_start  (tcu_rtx_rxc_zcp1_mbist_start),       //  <= 
    .tcu_rtx_txc_txe0_mbist_start  (tcu_rtx_txc_txe0_mbist_start),       //  <= 
    .tcu_rtx_txc_txe1_mbist_start  (tcu_rtx_txc_txe1_mbist_start),       //  <= 
    .tcu_scan_en                   (tcu_asic_scan_en),                        //  <= 
    .tcu_se_scancollar_in          (tcu_asic_se_scancollar_in),               //  <= 
    .tcu_se_scancollar_out         (tcu_asic_se_scancollar_out),              //  <= 
    .tcu_wr_inhibit                (tcu_asic_array_wr_inhibit),                     //  <= 
    .dmc_meta_resp_accept          (txc_meta_resp_accept),               //  => 
    .fflp_debug_port               (fflp_debug_port[ 31 : 0 ]),              //  => 
    .fflp_pio_ack                  (fflp_pio_ack),                       //  => 
    .fflp_pio_err                  (fflp_pio_err),                       //  => 
    .fflp_pio_intr                 (fflp_pio_intr),                      //  => 
    .fflp_pio_rdata                (fflp_pio_rdata[ 63 : 0 ]),               //  => 
    .ipp_debug_port                (ipp_debug_port[ 31 : 0 ]),               //  => 
    .ipp_dmc_dat_ack0              (ipp_dmc_dat_ack0),                   //  => 
    .ipp_dmc_dat_ack1              (ipp_dmc_dat_ack1),                   //  => 
    .ipp_dmc_dat_err0              (ipp_dmc_dat_err0),                   //  => 
    .ipp_dmc_dat_err1              (ipp_dmc_dat_err1),                   //  => 
    .ipp_dmc_data0                 (ipp_dmc_data0[ 129 : 0 ]),               //  => 
    .ipp_dmc_data1                 (ipp_dmc_data1[ 129 : 0 ]),               //  => 
    .ipp_dmc_ful_pkt0              (ipp_dmc_ful_pkt0),                   //  => 
    .ipp_dmc_ful_pkt1              (ipp_dmc_ful_pkt1),                   //  => 
    .ipp_pio_ack                   (ipp_pio_ack),                        //  => 
    .ipp_pio_err                   (ipp_pio_err),                        //  => 
    .ipp_pio_intr                  (ipp_pio_intr),                       //  => 
    .ipp_pio_rdata                 (ipp_pio_rdata[ 63 : 0 ]),                //  => 
    .niu_efu_4k_data               (niu_efu_4k_data),                    //  => 
    .niu_efu_4k_xfer_en            (niu_efu_4k_xfer_en),                 //  => 
    .niu_efu_cfifo0_data           (niu_efu_cfifo0_data),                //  => 
    .niu_efu_cfifo0_xfer_en        (niu_efu_cfifo0_xfer_en),             //  => 
    .niu_efu_cfifo1_data           (niu_efu_cfifo1_data),                //  => 
    .niu_efu_cfifo1_xfer_en        (niu_efu_cfifo1_xfer_en),             //  => 
    .niu_efu_ipp0_data             (niu_efu_ipp0_data),                  //  => 
    .niu_efu_ipp0_xfer_en          (niu_efu_ipp0_xfer_en),               //  => 
    .niu_efu_ipp1_data             (niu_efu_ipp1_data),                  //  => 
    .niu_efu_ipp1_xfer_en          (niu_efu_ipp1_xfer_en),               //  => 
    .niu_efu_mac0_ro_data          (niu_efu_mac0_ro_data),               //  => 
    .niu_efu_mac0_ro_xfer_en       (niu_efu_mac0_ro_xfer_en),            //  => 
    .niu_efu_mac0_sf_data          (niu_efu_mac0_sf_data),               //  => 
    .niu_efu_mac0_sf_xfer_en       (niu_efu_mac0_sf_xfer_en),            //  => 
    .niu_efu_mac1_ro_data          (niu_efu_mac1_ro_data),               //  => 
    .niu_efu_mac1_ro_xfer_en       (niu_efu_mac1_ro_xfer_en),            //  => 
    .niu_efu_mac1_sf_data          (niu_efu_mac1_sf_data),               //  => 
    .niu_efu_mac1_sf_xfer_en       (niu_efu_mac1_sf_xfer_en),            //  => 
    .niu_txc_interrupts            (niu_txc_interrupts),                 //  => 
    .rtx_mbist_scan_out            (rtx_mbist_scan_out),                 //  => 
    .rtx_rxc_ipp0_tcu_mbist_done   (rtx_rxc_ipp0_tcu_mbist_done),        //  => 
    .rtx_rxc_ipp0_tcu_mbist_fail   (rtx_rxc_ipp0_tcu_mbist_fail),        //  => 
    .rtx_rxc_ipp1_tcu_mbist_done   (rtx_rxc_ipp1_tcu_mbist_done),        //  => 
    .rtx_rxc_ipp1_tcu_mbist_fail   (rtx_rxc_ipp1_tcu_mbist_fail),        //  => 
    .rtx_rxc_mb5_tcu_mbist_done    (rtx_rxc_mb5_tcu_mbist_done),         //  => 
    .rtx_rxc_mb5_tcu_mbist_fail    (rtx_rxc_mb5_tcu_mbist_fail),         //  => 
    .rtx_rxc_mb6_tcu_mbist_done    (rtx_rxc_mb6_tcu_mbist_done),         //  => 
    .rtx_rxc_mb6_tcu_mbist_fail    (rtx_rxc_mb6_tcu_mbist_fail),         //  => 
    .rtx_rxc_zcp0_tcu_mbist_done   (rtx_rxc_zcp0_tcu_mbist_done),        //  => 
    .rtx_rxc_zcp0_tcu_mbist_fail   (rtx_rxc_zcp0_tcu_mbist_fail),        //  => 
    .rtx_rxc_zcp1_tcu_mbist_done   (rtx_rxc_zcp1_tcu_mbist_done),        //  => 
    .rtx_rxc_zcp1_tcu_mbist_fail   (rtx_rxc_zcp1_tcu_mbist_fail),        //  => 
    .rtx_tcu_dmo_data_out          (rtx_tcu_dmo_data_out[ 39 : 0 ]),         //  => 
    .rtx_txc_txe0_tcu_mbist_done   (rtx_txc_txe0_tcu_mbist_done),        //  => 
    .rtx_txc_txe0_tcu_mbist_fail   (rtx_txc_txe0_tcu_mbist_fail),        //  => 
    .rtx_txc_txe1_tcu_mbist_done   (rtx_txc_txe1_tcu_mbist_done),        //  => 
    .rtx_txc_txe1_tcu_mbist_fail   (rtx_txc_txe1_tcu_mbist_fail),        //  => 
    .rxc_mac_req0                  (rxc_mac_req0),                       //  => 
    .rxc_mac_req1                  (rxc_mac_req1),                       //  => 
    .scan_out                      (rtx_scan_out),                       //  => 
    .txc_arb1_req                  (txc_arb1_req),                       //  => 
    .txc_arb1_req_address          (txc_arb1_req_address[ 63 : 0 ]),         //  => 
    .txc_arb1_req_cmd              (txc_arb1_req_cmd[ 7 : 0 ]),              //  => 
    .txc_arb1_req_dma_num          (txc_arb1_req_dma_num[ 4 : 0 ]),          //  => 
    .txc_arb1_req_func_num         (txc_arb1_req_func_num[ 1 : 0 ]),         //  => 
    .txc_arb1_req_length           (txc_arb1_req_length[ 13 : 0 ]),          //  => 
    .txc_arb1_req_port_num         (txc_arb1_req_port_num[ 1 : 0 ]),         //  => 
    .txc_debug_port                (txc_debug_port[ 31 : 0 ]),               //  => 
    .txc_dmc_dma0_getnxtdesc       (txc_dmc_dma0_getnxtdesc),            //  => 
    .txc_dmc_dma0_inc_head         (txc_dmc_dma0_inc_head),              //  => 
    .txc_dmc_dma0_inc_pkt_cnt      (txc_dmc_dma0_inc_pkt_cnt),           //  => 
    .txc_dmc_dma0_mark_bit         (txc_dmc_dma0_mark_bit),              //  => 
    .txc_dmc_dma0_reset_done       (txc_dmc_dma0_reset_done),            //  => 
    .txc_dmc_dma10_getnxtdesc      (txc_dmc_dma10_getnxtdesc),           //  => 
    .txc_dmc_dma10_inc_head        (txc_dmc_dma10_inc_head),             //  => 
    .txc_dmc_dma10_inc_pkt_cnt     (txc_dmc_dma10_inc_pkt_cnt),          //  => 
    .txc_dmc_dma10_mark_bit        (txc_dmc_dma10_mark_bit),             //  => 
    .txc_dmc_dma10_reset_done      (txc_dmc_dma10_reset_done),           //  => 
    .txc_dmc_dma11_getnxtdesc      (txc_dmc_dma11_getnxtdesc),           //  => 
    .txc_dmc_dma11_inc_head        (txc_dmc_dma11_inc_head),             //  => 
    .txc_dmc_dma11_inc_pkt_cnt     (txc_dmc_dma11_inc_pkt_cnt),          //  => 
    .txc_dmc_dma11_mark_bit        (txc_dmc_dma11_mark_bit),             //  => 
    .txc_dmc_dma11_reset_done      (txc_dmc_dma11_reset_done),           //  => 
    .txc_dmc_dma12_getnxtdesc      (txc_dmc_dma12_getnxtdesc),           //  => 
    .txc_dmc_dma12_inc_head        (txc_dmc_dma12_inc_head),             //  => 
    .txc_dmc_dma12_inc_pkt_cnt     (txc_dmc_dma12_inc_pkt_cnt),          //  => 
    .txc_dmc_dma12_mark_bit        (txc_dmc_dma12_mark_bit),             //  => 
    .txc_dmc_dma12_reset_done      (txc_dmc_dma12_reset_done),           //  => 
    .txc_dmc_dma13_getnxtdesc      (txc_dmc_dma13_getnxtdesc),           //  => 
    .txc_dmc_dma13_inc_head        (txc_dmc_dma13_inc_head),             //  => 
    .txc_dmc_dma13_inc_pkt_cnt     (txc_dmc_dma13_inc_pkt_cnt),          //  => 
    .txc_dmc_dma13_mark_bit        (txc_dmc_dma13_mark_bit),             //  => 
    .txc_dmc_dma13_reset_done      (txc_dmc_dma13_reset_done),           //  => 
    .txc_dmc_dma14_getnxtdesc      (txc_dmc_dma14_getnxtdesc),           //  => 
    .txc_dmc_dma14_inc_head        (txc_dmc_dma14_inc_head),             //  => 
    .txc_dmc_dma14_inc_pkt_cnt     (txc_dmc_dma14_inc_pkt_cnt),          //  => 
    .txc_dmc_dma14_mark_bit        (txc_dmc_dma14_mark_bit),             //  => 
    .txc_dmc_dma14_reset_done      (txc_dmc_dma14_reset_done),           //  => 
    .txc_dmc_dma15_getnxtdesc      (txc_dmc_dma15_getnxtdesc),           //  => 
    .txc_dmc_dma15_inc_head        (txc_dmc_dma15_inc_head),             //  => 
    .txc_dmc_dma15_inc_pkt_cnt     (txc_dmc_dma15_inc_pkt_cnt),          //  => 
    .txc_dmc_dma15_mark_bit        (txc_dmc_dma15_mark_bit),             //  => 
    .txc_dmc_dma15_reset_done      (txc_dmc_dma15_reset_done),           //  => 
    .txc_dmc_dma1_getnxtdesc       (txc_dmc_dma1_getnxtdesc),            //  => 
    .txc_dmc_dma1_inc_head         (txc_dmc_dma1_inc_head),              //  => 
    .txc_dmc_dma1_inc_pkt_cnt      (txc_dmc_dma1_inc_pkt_cnt),           //  => 
    .txc_dmc_dma1_mark_bit         (txc_dmc_dma1_mark_bit),              //  => 
    .txc_dmc_dma1_reset_done       (txc_dmc_dma1_reset_done),            //  => 
    .txc_dmc_dma2_getnxtdesc       (txc_dmc_dma2_getnxtdesc),            //  => 
    .txc_dmc_dma2_inc_head         (txc_dmc_dma2_inc_head),              //  => 
    .txc_dmc_dma2_inc_pkt_cnt      (txc_dmc_dma2_inc_pkt_cnt),           //  => 
    .txc_dmc_dma2_mark_bit         (txc_dmc_dma2_mark_bit),              //  => 
    .txc_dmc_dma2_reset_done       (txc_dmc_dma2_reset_done),            //  => 
    .txc_dmc_dma3_getnxtdesc       (txc_dmc_dma3_getnxtdesc),            //  => 
    .txc_dmc_dma3_inc_head         (txc_dmc_dma3_inc_head),              //  => 
    .txc_dmc_dma3_inc_pkt_cnt      (txc_dmc_dma3_inc_pkt_cnt),           //  => 
    .txc_dmc_dma3_mark_bit         (txc_dmc_dma3_mark_bit),              //  => 
    .txc_dmc_dma3_reset_done       (txc_dmc_dma3_reset_done),            //  => 
    .txc_dmc_dma4_getnxtdesc       (txc_dmc_dma4_getnxtdesc),            //  => 
    .txc_dmc_dma4_inc_head         (txc_dmc_dma4_inc_head),              //  => 
    .txc_dmc_dma4_inc_pkt_cnt      (txc_dmc_dma4_inc_pkt_cnt),           //  => 
    .txc_dmc_dma4_mark_bit         (txc_dmc_dma4_mark_bit),              //  => 
    .txc_dmc_dma4_reset_done       (txc_dmc_dma4_reset_done),            //  => 
    .txc_dmc_dma5_getnxtdesc       (txc_dmc_dma5_getnxtdesc),            //  => 
    .txc_dmc_dma5_inc_head         (txc_dmc_dma5_inc_head),              //  => 
    .txc_dmc_dma5_inc_pkt_cnt      (txc_dmc_dma5_inc_pkt_cnt),           //  => 
    .txc_dmc_dma5_mark_bit         (txc_dmc_dma5_mark_bit),              //  => 
    .txc_dmc_dma5_reset_done       (txc_dmc_dma5_reset_done),            //  => 
    .txc_dmc_dma6_getnxtdesc       (txc_dmc_dma6_getnxtdesc),            //  => 
    .txc_dmc_dma6_inc_head         (txc_dmc_dma6_inc_head),              //  => 
    .txc_dmc_dma6_inc_pkt_cnt      (txc_dmc_dma6_inc_pkt_cnt),           //  => 
    .txc_dmc_dma6_mark_bit         (txc_dmc_dma6_mark_bit),              //  => 
    .txc_dmc_dma6_reset_done       (txc_dmc_dma6_reset_done),            //  => 
    .txc_dmc_dma7_getnxtdesc       (txc_dmc_dma7_getnxtdesc),            //  => 
    .txc_dmc_dma7_inc_head         (txc_dmc_dma7_inc_head),              //  => 
    .txc_dmc_dma7_inc_pkt_cnt      (txc_dmc_dma7_inc_pkt_cnt),           //  => 
    .txc_dmc_dma7_mark_bit         (txc_dmc_dma7_mark_bit),              //  => 
    .txc_dmc_dma7_reset_done       (txc_dmc_dma7_reset_done),            //  => 
    .txc_dmc_dma8_getnxtdesc       (txc_dmc_dma8_getnxtdesc),            //  => 
    .txc_dmc_dma8_inc_head         (txc_dmc_dma8_inc_head),              //  => 
    .txc_dmc_dma8_inc_pkt_cnt      (txc_dmc_dma8_inc_pkt_cnt),           //  => 
    .txc_dmc_dma8_mark_bit         (txc_dmc_dma8_mark_bit),              //  => 
    .txc_dmc_dma8_reset_done       (txc_dmc_dma8_reset_done),            //  => 
    .txc_dmc_dma9_getnxtdesc       (txc_dmc_dma9_getnxtdesc),            //  => 
    .txc_dmc_dma9_inc_head         (txc_dmc_dma9_inc_head),              //  => 
    .txc_dmc_dma9_inc_pkt_cnt      (txc_dmc_dma9_inc_pkt_cnt),           //  => 
    .txc_dmc_dma9_mark_bit         (txc_dmc_dma9_mark_bit),              //  => 
    .txc_dmc_dma9_reset_done       (txc_dmc_dma9_reset_done),            //  => 
    .txc_dmc_dma_nack_pkt_rd       (txc_dmc_dma_nack_pkt_rd[ 15 : 0 ]),      //  => 
    .txc_dmc_nack_pkt_rd           (txc_dmc_nack_pkt_rd),                //  => 
    .txc_dmc_nack_pkt_rd_addr      (txc_dmc_nack_pkt_rd_addr[ 43 : 0 ]),     //  => 
    .txc_dmc_p0_dma_pkt_size_err   (txc_dmc_p0_dma_pkt_size_err[ 15 : 0 ]),  //  => 
    .txc_dmc_p0_pkt_size_err       (txc_dmc_p0_pkt_size_err),            //  => 
    .txc_dmc_p0_pkt_size_err_addr  (txc_dmc_p0_pkt_size_err_addr[ 43 : 0 ]), //  => 
    .txc_dmc_p1_dma_pkt_size_err   (txc_dmc_p1_dma_pkt_size_err[ 15 : 0 ]),  //  => 
    .txc_dmc_p1_pkt_size_err       (txc_dmc_p1_pkt_size_err),            //  => 
    .txc_dmc_p1_pkt_size_err_addr  (txc_dmc_p1_pkt_size_err_addr[ 43 : 0 ]), //  => 
    .txc_mac_abort0                (txc_mac_abort0),                     //  => 
    .txc_mac_abort1                (txc_mac_abort1),                     //  => 
    .txc_mac_ack0                  (txc_mac_ack0),                       //  => 
    .txc_mac_ack1                  (txc_mac_ack1),                       //  => 
    .txc_mac_data0                 (txc_mac_data0[ 63 : 0 ]),                //  => 
    .txc_mac_data1                 (txc_mac_data1[ 63 : 0 ]),                //  => 
    .txc_mac_stat0                 (txc_mac_stat0[ 3 : 0 ]),                 //  => 
    .txc_mac_stat1                 (txc_mac_stat1[ 3 : 0 ]),                 //  => 
    .txc_mac_tag0                  (txc_mac_tag0),                       //  => 
    .txc_mac_tag1                  (txc_mac_tag1),                       //  => 
    .txc_pio_ack                   (txc_pio_ack),                        //  => 
    .txc_pio_err                   (txc_pio_err),                        //  => 
    .txc_pio_rdata                 (txc_pio_rdata[ 63 : 0 ]),                //  => 
    .zcp_debug_port                (zcp_debug_port[ 31 : 0 ]),               //  => 
    .zcp_dmc_ack0                  (zcp_dmc_ack0),                       //  => 
    .zcp_dmc_ack1                  (zcp_dmc_ack1),                       //  => 
    .zcp_dmc_dat0                  (zcp_dmc_dat0[ 129 : 0 ]),                //  => 
    .zcp_dmc_dat1                  (zcp_dmc_dat1[ 129 : 0 ]),                //  => 
    .zcp_dmc_dat_err0              (zcp_dmc_dat_err0),                   //  => 
    .zcp_dmc_dat_err1              (zcp_dmc_dat_err1),                   //  => 
    .zcp_dmc_ful_pkt0              (zcp_dmc_ful_pkt0),                   //  => 
    .zcp_dmc_ful_pkt1              (zcp_dmc_ful_pkt1),                   //  => 
    .zcp_pio_ack                   (zcp_pio_ack),                        //  => 
    .zcp_pio_err                   (zcp_pio_err),                        //  => 
    .zcp_pio_intr                  (zcp_pio_intr),                       //  => 
    .zcp_pio_rdata                 (zcp_pio_rdata[ 63 : 0 ]),
  .tcu_atpg_mode(tcu_atpg_mode)                 //  => 
    );
`endif  // OPENSPARC_CMP



// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
mac mac (
    .gl_mac_io_out        (gl_io_out_c1b),           //  <= 
    .cluster_arst_l       (cluster_arst_l),          //  <= 
    .esr_mac_rclk_0       (esr_mac_rclk_0[ 3 : 0 ]),     //  <= 
    .esr_mac_rclk_1       (esr_mac_rclk_1[ 3 : 0 ]),     //  <= 
    .esr_mac_rxd0_0       (esr_mac_rxd0_0[ 9 : 0 ]),     //  <= 
    .esr_mac_rxd0_1       (esr_mac_rxd0_1[ 9 : 0 ]),     //  <= 
    .esr_mac_rxd1_0       (esr_mac_rxd1_0[ 9 : 0 ]),     //  <= 
    .esr_mac_rxd1_1       (esr_mac_rxd1_1[ 9 : 0 ]),     //  <= 
    .esr_mac_rxd2_0       (esr_mac_rxd2_0[ 9 : 0 ]),     //  <= 
    .esr_mac_rxd2_1       (esr_mac_rxd2_1[ 9 : 0 ]),     //  <= 
    .esr_mac_rxd3_0       (esr_mac_rxd3_0[ 9 : 0 ]),     //  <= 
    .esr_mac_rxd3_1       (esr_mac_rxd3_1[ 9 : 0 ]),     //  <= 
    .esr_mac_tclk_0       (esr_mac_tclk_0),          //  <= 
    .esr_mac_tclk_1       (esr_mac_tclk_1),          //  <= 
    .cmp_gclk_c1_mac      (cmp_gclk_c1_mac),         //  <= 
    .gl_mac_io_clk_stop   (gl_mac_io_clk_stop),      //  <= 
    .mac_125rx_test_clk   (mac_125rx_test_clk),      //  <= 
    .mac_125tx_test_clk   (mac_125tx_test_clk),      //  <= 
    .mac_156rx_test_clk   (mac_156rx_test_clk),      //  <= 
    .mac_156tx_test_clk   (mac_156tx_test_clk),      //  <= 
    .mac_312rx_test_clk   (mac_312rx_test_clk),      //  <= 
    .mac_312tx_test_clk   (mac_312tx_test_clk),      //  <= 
    .mac_reset0           (mac_reset0),              //  <= 
    .mac_reset1           (mac_reset1),              //  <= 
    .mdi                  (mdi),                     //  <= 
    .peu_mac_sbs_input    (peu_mac_sbs_input),       //  <= 
    .pio_clients_addr     (pio_clients_addr[ 19 : 0 ]),  //  <= 
    .pio_clients_rd       (pio_clients_rd),          //  <= 
    .pio_clients_wdata    (pio_clients_wdata[ 31 : 0 ]), //  <= 
    .pio_mac_sel          (pio_mac_sel),             //  <= 
    .gl_mac_              (gl_rst_mac_c1b),                 //  <= 
    .rxc_mac_req0         (rxc_mac_req0),            //  <= 
    .rxc_mac_req1         (rxc_mac_req1),            //  <= 
    .scan_in              (tcu_soc5_scan_out),            //  <= 
    .stspll_0             (stspll_0[ 3 : 0 ]),           //  <= 
    .stspll_1             (stspll_1[ 3 : 0 ]),           //  <= 
    .stsrx0_0             (stsrx0_0[ 7 : 0 ]),           //  <= 
    .stsrx0_1             (stsrx0_1[ 7 : 0 ]),           //  <= 
    .stsrx1_0             (stsrx1_0[ 7 : 0 ]),           //  <= 
    .stsrx1_1             (stsrx1_1[ 7 : 0 ]),           //  <= 
    .stsrx2_0             (stsrx2_0[ 7 : 0 ]),           //  <= 
    .stsrx2_1             (stsrx2_1[ 7 : 0 ]),           //  <= 
    .stsrx3_0             (stsrx3_0[ 7 : 0 ]),           //  <= 
    .stsrx3_1             (stsrx3_1[ 7 : 0 ]),           //  <= 
    .ststx0_0             (ststx0_0[ 3 : 0 ]),           //  <= 
    .ststx0_1             (ststx0_1[ 3 : 0 ]),           //  <= 
    .ststx1_0             (ststx1_0[ 3 : 0 ]),           //  <= 
    .ststx1_1             (ststx1_1[ 3 : 0 ]),           //  <= 
    .ststx2_0             (ststx2_0[ 3 : 0 ]),           //  <= 
    .ststx2_1             (ststx2_1[ 3 : 0 ]),           //  <= 
    .ststx3_0             (ststx3_0[ 3 : 0 ]),           //  <= 
    .ststx3_1             (ststx3_1[ 3 : 0 ]),           //  <= 
    .tcu_wr_inhibit       (tcu_asic_array_wr_inhibit),          //  <= 
    .tcu_aclk             (tcu_asic_aclk),                //  <= 
    .tcu_bclk             (tcu_asic_bclk),                //  <= 
    .tcu_div_bypass       (tcu_div_bypass),          //  <= 
    .tcu_pce_ov           (tcu_pce_ov),              //  <= 
    .tcu_sbs_acmode       (tcu_sbs_acmode),          //  <= 
    .tcu_sbs_actestsignal (tcu_sbs_actestsignal),    //  <= 
    .tcu_sbs_aclk         (tcu_sbs_aclk),            //  <= 
    .tcu_sbs_bclk         (tcu_sbs_bclk),            //  <= 
    .tcu_sbs_clk          (tcu_sbs_clk),             //  <= 
    .tcu_sbs_enbspt       (tcu_sbs_enbspt),          //  <= 
    .tcu_sbs_enbsrx       (tcu_sbs_enbsrx),          //  <= 
    .tcu_sbs_enbstx       (tcu_sbs_enbstx),          //  <= 
    .tcu_sbs_scan_en      (tcu_sbs_scan_en),         //  <= 
    .tcu_sbs_uclk         (tcu_sbs_uclk),            //  <= 
    .tcu_scan_en          (tcu_asic_scan_en),             //  <= 
    .tcu_scan_mode        (tcu_mac_testmode),           //  <= 
    .txc_mac_abort0       (txc_mac_abort0),          //  <= 
    .txc_mac_abort1       (txc_mac_abort1),          //  <= 
    .txc_mac_ack0         (txc_mac_ack0),            //  <= 
    .txc_mac_ack1         (txc_mac_ack1),            //  <= 
    .txc_mac_data0        (txc_mac_data0[ 63 : 0 ]),     //  <= 
    .txc_mac_data1        (txc_mac_data1[ 63 : 0 ]),     //  <= 
    .txc_mac_stat0        (txc_mac_stat0[ 3 : 0 ]),      //  <= 
    .txc_mac_stat1        (txc_mac_stat1[ 3 : 0 ]),      //  <= 
    .txc_mac_tag0         (txc_mac_tag0),            //  <= 
    .txc_mac_tag1         (txc_mac_tag1),            //  <= 
    .cfgpll_0             (cfgpll_0[ 11 : 0 ]),          //  => 
    .cfgpll_1             (cfgpll_1[ 11 : 0 ]),          //  => 
    .cfgrx0_0             (cfgrx0_0[ 27 : 0 ]),          //  => 
    .cfgrx0_1             (cfgrx0_1[ 27 : 0 ]),          //  => 
    .cfgrx1_0             (cfgrx1_0[ 27 : 0 ]),          //  => 
    .cfgrx1_1             (cfgrx1_1[ 27 : 0 ]),          //  => 
    .cfgrx2_0             (cfgrx2_0[ 27 : 0 ]),          //  => 
    .cfgrx2_1             (cfgrx2_1[ 27 : 0 ]),          //  => 
    .cfgrx3_0             (cfgrx3_0[ 27 : 0 ]),          //  => 
    .cfgrx3_1             (cfgrx3_1[ 27 : 0 ]),          //  => 
    .cfgtx0_0             (cfgtx0_0[ 19 : 0 ]),          //  => 
    .cfgtx0_1             (cfgtx0_1[ 19 : 0 ]),          //  => 
    .cfgtx1_0             (cfgtx1_0[ 19 : 0 ]),          //  => 
    .cfgtx1_1             (cfgtx1_1[ 19 : 0 ]),          //  => 
    .cfgtx2_0             (cfgtx2_0[ 19 : 0 ]),          //  => 
    .cfgtx2_1             (cfgtx2_1[ 19 : 0 ]),          //  => 
    .cfgtx3_0             (cfgtx3_0[ 19 : 0 ]),          //  => 
    .cfgtx3_1             (cfgtx3_1[ 19 : 0 ]),          //  => 
    .mac_debug_port       (mac_debug_port[ 31 : 0 ]),    //  => 
    .mac_esr_tclk_0       (mac_esr_tclk_0[ 3 : 0 ]),     //  => 
    .mac_esr_tclk_1       (mac_esr_tclk_1[ 3 : 0 ]),     //  => 
    .mac_esr_txd0_0       (mac_esr_txd0_0[ 9 : 0 ]),     //  => 
    .mac_esr_txd0_1       (mac_esr_txd0_1[ 9 : 0 ]),     //  => 
    .mac_esr_txd1_0       (mac_esr_txd1_0[ 9 : 0 ]),     //  => 
    .mac_esr_txd1_1       (mac_esr_txd1_1[ 9 : 0 ]),     //  => 
    .mac_esr_txd2_0       (mac_esr_txd2_0[ 9 : 0 ]),     //  => 
    .mac_esr_txd2_1       (mac_esr_txd2_1[ 9 : 0 ]),     //  => 
    .mac_esr_txd3_0       (mac_esr_txd3_0[ 9 : 0 ]),     //  => 
    .mac_esr_txd3_1       (mac_esr_txd3_1[ 9 : 0 ]),     //  => 
    .mac_mcu_3_sbs_output (mac_mcu_3_sbs_output),    //  => 
    .mac_pio_ack          (mac_pio_ack),             //  => 
    .mac_pio_err          (mac_pio_err),             //  => 
    .mac_pio_intr0        (mac_pio_intr0),           //  => 
    .mac_pio_intr1        (mac_pio_intr1),           //  => 
    .mac_pio_rdata        (mac_pio_rdata[ 63 : 0 ]),     //  => 
    .mac_rxc_ack0         (mac_rxc_ack0),            //  => 
    .mac_rxc_ack1         (mac_rxc_ack1),            //  => 
    .mac_rxc_ctrl0        (mac_rxc_ctrl0),           //  => 
    .mac_rxc_ctrl1        (mac_rxc_ctrl1),           //  => 
    .mac_rxc_data0        (mac_rxc_data0[ 63 : 0 ]),     //  => 
    .mac_rxc_data1        (mac_rxc_data1[ 63 : 0 ]),     //  => 
    .mac_rxc_stat0        (mac_rxc_stat0[ 22 : 0 ]),     //  => 
    .mac_rxc_stat1        (mac_rxc_stat1[ 22 : 0 ]),     //  => 
    .mac_rxc_tag0         (mac_rxc_tag0),            //  => 
    .mac_rxc_tag1         (mac_rxc_tag1),            //  => 
    .mac_txc_req0         (mac_txc_req0),            //  => 
    .mac_txc_req1         (mac_txc_req1),            //  => 
    .mdoe                 (mdoe),                    //  => 
    .mif_pio_intr         (mif_pio_intr),            //  => 
    .scan_out             (mac_scan_out),            //  => 
    .testcfg_0            (testcfg_0[ 15 : 0 ]),         //  => 
    .testcfg_1            (testcfg_1[ 15 : 0 ]),         //  => 
    .xaui_act_led_0       (xaui_act_led_0),          //  => 
    .xaui_act_led_1       (xaui_act_led_1),          //  => 
    .xaui_link_led_0      (xaui_link_led_0),         //  => 
    .xaui_link_led_1      (xaui_link_led_1),         //  => 
    .xaui_mdint1_l(mio_mac_xaui_mdint1_l),
    .xaui_mdint0_l(mio_mac_xaui_mdint0_l),
    .mdclk                (mdc),
  .tcu_atpg_mode(tcu_atpg_mode)                      //  => 
    );
`endif  // OPENSPARC_CMP


// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
esr esr (
    .XAUI0_AMUX        (XAUI0_AMUX),            //  => 
    .XAUI0_TX_N        (XAUI0_TX_N[ 3 : 0 ]),       //  => 
    .XAUI0_TX_P        (XAUI0_TX_P[ 3 : 0 ]),       //  => 
    .XAUI0_REFCLK_N    (XAUI0_REFCLK_N),        //  <= 
    .XAUI0_REFCLK_P    (XAUI0_REFCLK_P),        //  <= 
    .XAUI0_RX_N        (XAUI0_RX_N[ 3 : 0 ]),       //  <= 
    .XAUI0_RX_P        (XAUI0_RX_P[ 3 : 0 ]),       //  <= 
    .esr_mac_tclk_0    (esr_mac_tclk_0),        //  => 
    .esr_mac_rclk_0    (esr_mac_rclk_0[ 3 : 0 ]),   //  => 
    .esr_mac_rxd0_0    (esr_mac_rxd0_0[ 9 : 0 ]),   //  => 
    .esr_mac_rxd1_0    (esr_mac_rxd1_0[ 9 : 0 ]),   //  => 
    .esr_mac_rxd2_0    (esr_mac_rxd2_0[ 9 : 0 ]),   //  => 
    .esr_mac_rxd3_0    (esr_mac_rxd3_0[ 9 : 0 ]),   //  => 
    .mac_esr_tclk_0    (mac_esr_tclk_0[ 3 : 0 ]),   //  <= 
    .mac_esr_txd0_0    (mac_esr_txd0_0[ 9 : 0 ]),   //  <= 
    .mac_esr_txd1_0    (mac_esr_txd1_0[ 9 : 0 ]),   //  <= 
    .mac_esr_txd2_0    (mac_esr_txd2_0[ 9 : 0 ]),   //  <= 
    .mac_esr_txd3_0    (mac_esr_txd3_0[ 9 : 0 ]),   //  <= 
    .stcicfg_0         (tcu_stcicfg[ 1 : 0 ]),      //  <= 
    .stciclk_0         (tcu_stciclk),           //  <= 
    .stcid_0           (esr_stcid),               //  <= 
    .stciq_0           (stcid_1),               //  => 
    .rxbclkin_0        (esr_mac_rclk_0[ 3 : 0 ]),   //  => 
    .testclkr_0        (mio_esr_testclkr),      //  <= 
    .testclkt_0        (mio_esr_testclkt),      //  <= 
    .cfgtx0_0          (cfgtx0_0[ 19 : 0 ]),        //  <= 
    .cfgtx1_0          (cfgtx1_0[ 19 : 0 ]),        //  <= 
    .cfgtx2_0          (cfgtx2_0[ 19 : 0 ]),        //  <= 
    .cfgtx3_0          (cfgtx3_0[ 19 : 0 ]),        //  <= 
    .cfgrx0_0          (cfgrx0_0[ 27 : 0 ]),        //  <= 
    .cfgrx1_0          (cfgrx1_0[ 27 : 0 ]),        //  <= 
    .cfgrx2_0          (cfgrx2_0[ 27 : 0 ]),        //  <= 
    .cfgrx3_0          (cfgrx3_0[ 27 : 0 ]),        //  <= 
    .cfgpll_0          (cfgpll_0[ 11 : 0 ]),        //  <= 
    .testcfg_0         (testcfg_0[ 15 : 0 ]),       //  <= 
    .ststx0_0          (ststx0_0[ 3 : 0 ]),         //  => 
    .ststx1_0          (ststx1_0[ 3 : 0 ]),         //  => 
    .ststx2_0          (ststx2_0[ 3 : 0 ]),         //  => 
    .ststx3_0          (ststx3_0[ 3 : 0 ]),         //  => 
    .stsrx0_0          (stsrx0_0[ 7 : 0 ]),         //  => 
    .stsrx1_0          (stsrx1_0[ 7 : 0 ]),         //  => 
    .stsrx2_0          (stsrx2_0[ 7 : 0 ]),         //  => 
    .stsrx3_0          (stsrx3_0[ 7 : 0 ]),         //  => 
    .stspll_0          (stspll_0[ 3 : 0 ]),         //  => 
    .fdo_0             (fdi_1),                 //  => 
    .fclk_0            (efu_niu_fclk),          //  <= 
    .fclrz_0           (efu_niu_fclrz),         //  <= 
    .fdi_0             (efu_niu_fdi),                 //  <= 
    .XAUI1_AMUX        (XAUI1_AMUX),            //  => 
    .XAUI1_TX_N        (XAUI1_TX_N[ 3 : 0 ]),       //  => 
    .XAUI1_TX_P        (XAUI1_TX_P[ 3 : 0 ]),       //  => 
    .XAUI1_RX_N        (XAUI1_RX_N[ 3 : 0 ]),       //  <= 
    .XAUI1_RX_P        (XAUI1_RX_P[ 3 : 0 ]),       //  <= 
    .esr_mac_tclk_1    (esr_mac_tclk_1),        //  => 
    .esr_mac_rclk_1    (esr_mac_rclk_1[ 3 : 0 ]),   //  => 
    .esr_mac_rxd0_1    (esr_mac_rxd0_1[ 9 : 0 ]),   //  => 
    .esr_mac_rxd1_1    (esr_mac_rxd1_1[ 9 : 0 ]),   //  => 
    .esr_mac_rxd2_1    (esr_mac_rxd2_1[ 9 : 0 ]),   //  => 
    .esr_mac_rxd3_1    (esr_mac_rxd3_1[ 9 : 0 ]),   //  => 
    .mac_esr_tclk_1    (mac_esr_tclk_1[ 3 : 0 ]),   //  <= 
    .mac_esr_txd0_1    (mac_esr_txd0_1[ 9 : 0 ]),   //  <= 
    .mac_esr_txd1_1    (mac_esr_txd1_1[ 9 : 0 ]),   //  <= 
    .mac_esr_txd2_1    (mac_esr_txd2_1[ 9 : 0 ]),   //  <= 
    .mac_esr_txd3_1    (mac_esr_txd3_1[ 9 : 0 ]),   //  <= 
    .stcicfg_1         (tcu_stcicfg[ 1 : 0 ]),      //  <= 
    .stciclk_1         (tcu_stciclk),           //  <= 
    .stcid_1           (stcid_1),               //  <= 
    .stciq_1           (esr_stciq),               //  => 
    .rxbclkin_1        (esr_mac_rclk_1[ 3 : 0 ]),   //  => 
    .testclkr_1        (mio_esr_testclkr),      //  <= 
    .testclkt_1        (mio_esr_testclkt),      //  <= 
    .cfgtx0_1          (cfgtx0_1[ 19 : 0 ]),        //  <= 
    .cfgtx1_1          (cfgtx1_1[ 19 : 0 ]),        //  <= 
    .cfgtx2_1          (cfgtx2_1[ 19 : 0 ]),        //  <= 
    .cfgtx3_1          (cfgtx3_1[ 19 : 0 ]),        //  <= 
    .cfgrx0_1          (cfgrx0_1[ 27 : 0 ]),        //  <= 
    .cfgrx1_1          (cfgrx1_1[ 27 : 0 ]),        //  <= 
    .cfgrx2_1          (cfgrx2_1[ 27 : 0 ]),        //  <= 
    .cfgrx3_1          (cfgrx3_1[ 27 : 0 ]),        //  <= 
    .cfgpll_1          (cfgpll_1[ 11 : 0 ]),        //  <= 
    .testcfg_1         (testcfg_1[ 15 : 0 ]),       //  <= 
    .ststx0_1          (ststx0_1[ 3 : 0 ]),         //  => 
    .ststx1_1          (ststx1_1[ 3 : 0 ]),         //  => 
    .ststx2_1          (ststx2_1[ 3 : 0 ]),         //  => 
    .ststx3_1          (ststx3_1[ 3 : 0 ]),         //  => 
    .stsrx0_1          (stsrx0_1[ 7 : 0 ]),         //  => 
    .stsrx1_1          (stsrx1_1[ 7 : 0 ]),         //  => 
    .stsrx2_1          (stsrx2_1[ 7 : 0 ]),         //  => 
    .stsrx3_1          (stsrx3_1[ 7 : 0 ]),         //  => 
    .stspll_1          (stspll_1[ 3 : 0 ]),         //  => 
    .fdo_1             (niu_efu_fdo),                 //  => 
    .fclk_1            (efu_niu_fclk),          //  <= 
    .fclrz_1           (efu_niu_fclrz),         //  <= 
    .fdi_1             (fdi_1),                 //  <= 
    .tcu_sbs_bsinitclk_0 (tcu_sbs_bsinitclk),     //  <= 
    .tcu_sbs_bsinitclk_1 (tcu_sbs_bsinitclk),     //  <=
    .tcu_esr_atpgse_0    (tcu_srd_atpgse),        //  <= 
    .tcu_esr_atpgse_1    (tcu_srd_atpgse),        //  <=
    .tcu_esr_atpgmode_0  (tcu_srd_atpgmode[ 2 : 0 ]), //  <= 
    .tcu_esr_atpgmode_1  (tcu_srd_atpgmode[ 2 : 0 ]), //  <=
    .esr_atpgd         (esr_atpgd),             //  <= 
    .esr_atpgq         (esr_atpgq),             //  => 
    .VDDT              (VDDT_ESR),                  //  <= 
    .VDDA              (VDDA_ESR),                  //  <= 
    .VDDD              (VDDD_ESR),                  //  <= 
    .VDDR              (VDDR_ESR),                  //  <= 
    .VSSA              (VSSA_ESR)                   //  <= 
    );

`endif // NIU_SYSTEMC_T2

`endif  // OPENSPARC_CMP

`endif // `ifndef FC_NO_NIU_T2


// NIU END



input          PLL_CMP_CLK_P;   // Reference clock input, either 133.333, 166.666, or 200 MHz.
input          PLL_CMP_CLK_N;   // Differential signal.
inout [ 2 : 0 ] 	DIODE_TOP; 
inout [ 2 : 0 ] 	DIODE_BOT; 
input 		VDD_PLL_CMP_REG; 	//  TBD - mh157021
input  		VDD_RNG_HV; 	//  TBD - mh157021
output			VDD_SENSE;
output			VSS_SENSE;
output			RNG_ANLG_CHAR_OUT;

input          PWRON_RST_L;    // Power On Reset 
input          BUTTON_XIR_L;   // Externally Initiated Reset
input          PB_RST_L;       // Like Niagara J_RST_L
output         PEX_RESET_L;    // To External PCI Express switch and
                                        // PCI Express Devices
//output         FATAL_ERROR;            // Fatal Error has ocurred in N2
output         SSI_SYNC_L;            // SSI SYNC signal to FPGA PLL

inout          VPP;              // High powered programming pin (efu)

//test
// input  [ 30:0] io_scan_in;
// input          io_srdes_scan_in;
// output [ 30:0] tcu_pins_scan_out;
// output         tcu_pin_srdes_scan_out;

//input          scan_in;

//jtag and test
input          TMS;
input          TDI;
input          TRST_L;
input          TCK;
input          TESTMODE;
output         TDO;

input           DIVIDER_BYPASS;         // Bypasses Clock Tree Dividers

//debug 
inout [ 165 : 0 ]  DBG_DQ;                 // Debug Outputs
                                        // DBG_DQ[113:0] also shares
                                        // function as following pins:
                                        //      CMP_CLK_EXT
                                        //      IO_CLK_EXT
                                        //      IO2X_CLK_EXT
                                        //      ACLK
                                        //      BCLK
                                        //      SCAN_EN
                                        //      AC_TESTMODE
                                        //      AC_TESTRIG
                                        //      SCAN_IN[31:0]
                                        //      SCAN_OUT[31:0]
                                        //      DMA_DATA[39:0]
                                        //      MBIST_DONE
                                        //      MBIST_FAIL

output          DBG_CK0;                // Debug Output CLK Unit 0
input           TRIGIN;                 // Stop clock based on external event;
                                        // TRIGIN controls BISI/BIST selection

output          TRIGOUT;                // DBG event signal to logic analyzer

// SSI 

input           SSI_MISO;               // SSI Master In, Slave Out
input           SSI_EXT_INT_L;          // SSI External Interrupt
output          SSI_SCK;                // SSI Clock
output          SSI_MOSI;               // SSI Master Out, Slave In




// misc pads

input   [ 1 : 0 ]   PMI;                    // process control monitor input
input           VREG_SELBG_L;           // Bandgap Select           
output  [ 1 : 0 ]   PLL_CHAR_OUT;           // PLL Char Out
input           PLL_TESTMODE;           // PLL Testmode Pin
input   [ 2 : 0 ]   PWR_THRTTL_0;           // Power Throttle pins grp 0
input   [ 2 : 0 ]   PWR_THRTTL_1;           // Power Throttle pins grp 1
output          PMO;                    // process control monitor output
input           BURNIN;                 // Sets Burnin Mode for PCM Modules


n2_esd_core_cust esd_core0 (
   .supply_node (VDD_SENSE)
);
 
n2_esd_core_cust esd_core1 (
   .supply_node (VSS_SENSE)
);

// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
mio mio(

  // Inputs
  .scan_in(db0_scan_out),
  .gclk_0( cmp_gclk_c3_mio ), 		// cmp_gclk_c2_mio_left ),  mh157021: n2 eco bug id 110392
  .gclk_1( cmp_gclk_c2_mio_left ),  // cmp_gclk_c2_mio_right ), mh157021: n2 eco bug id 110392
  .gclk_2( cmp_gclk_c2_mio_right ), // cmp_gclk_c3_mio ), 		mh157021: n2 eco bug id 110392
  .gclk_3( cmp_gclk_c1_mio ), 		// cmp_gclk_c1_mio ), 		mh157021: n2 eco bug id 110392
  .gl_mio_clk_stop_c3 (gl_mio_clk_stop_c3t),
  .gl_mio_clk_stop_c2_left (gl_mio_clk_stop_c2t),
  .gl_mio_clk_stop_c2_right (gl_mio_clk_stop_c2t),
  .gl_mio_clk_stop_c1 (gl_mio_clk_stop_c1t),
  .gl_mio_io2x_sync_en_c3 (gl_io2x_sync_en_c3t0), // (gl_io2x_sync_en_c3t), - for int6.1
  .gl_mio_io2x_sync_en_c2_left (gl_io2x_sync_en_c2t), 
  .gl_mio_io2x_sync_en_c2_right (gl_io2x_sync_en_c2t), 
  .gl_mio_io2x_sync_en_c1 (gl_mio_io2x_sync_en_c1t ),
  .ccu_io_out( gl_io_out_c3t),
  .ro_in(pcmb0_mio_ro_in),
  // Outputs
  .mio_tcu_tms(mio_tcu_tms),
  .mio_tcu_tdi(mio_tcu_tdi),
  .mio_tcu_trst_l(mio_tcu_trst_l),
  .mio_tcu_tck(mio_tcu_tck),
  .mio_tcu_testmode(mio_tcu_testmode),
  .mio_psr_testclkt(mio_psr_testclkt),
  .mio_psr_testclkr(mio_psr_testclkr),
  .mio_esr_testclkt(mio_esr_testclkt),
  .mio_esr_testclkr(mio_esr_testclkr),
  .mio_spc_pwr_throttle_0(mio_spc_pwr_throttle_0[ 2 : 0 ]),
  .mio_spc_pwr_throttle_1(mio_spc_pwr_throttle_1[ 2 : 0 ]),
  .sel59(mio_pcmb0_sel59),
  .sel60(mio_pcmb1_sel60),
  .sel61(mio_pcma_sel61),
  .io_burnin(mio_pcm_burnin),
  .mio_efu_prgm_en(mio_efu_prgm_en),
`ifndef FC_NO_NIU_T2
  .mio_mac_xaui_mdint1_l(mio_mac_xaui_mdint1_l),
  .mio_mac_xaui_mdint0_l(mio_mac_xaui_mdint0_l),
`endif
  .scan_out(mio_scan_out),
  .cluster_arst_l(cluster_arst_l),
  .tcu_div_bypass(tcu_div_bypass),
  .tcu_atpg_mode(tcu_atpg_mode),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
`ifndef FC_NO_NIU_T2
  .XAUI_MDINT0_L(XAUI_MDINT0_L),
  .XAUI_MDINT1_L(XAUI_MDINT1_L),
  .XAUI0_ACT_LED(XAUI0_ACT_LED),
  .XAUI0_LINK_LED(XAUI0_LINK_LED),
  .XAUI1_ACT_LED(XAUI1_ACT_LED),
  .XAUI1_LINK_LED(XAUI1_LINK_LED),
  .XAUI_MDC(XAUI_MDC),
  .XAUI_MDIO(XAUI_MDIO),
  .xaui_act_led_0(xaui_act_led_0),
  .xaui_link_led_0(xaui_link_led_0),
  .xaui_act_led_1(xaui_act_led_1),
  .xaui_link_led_1(xaui_link_led_1),
  .mdc(mdc),
  .mdoe(mdoe),
  .mdi(mdi),
`endif
  .TCK(TCK),
  .TDI(TDI),
  .TDO(TDO),
  .TMS(TMS),
  .TRST_L(TRST_L),
  .TESTMODE(TESTMODE),
  .STCIQ(STCIQ),
  .STCID(STCID),
  .STCICFG(STCICFG[1:0]),
  .STCICLK(STCICLK),
  .TESTCLKT(TESTCLKT),
  .TESTCLKR(TESTCLKR),
  .VDDO_PCM(VDDO_PCM),
  .DIVIDER_BYPASS(DIVIDER_BYPASS),
  .PLL_CMP_BYPASS(PLL_CMP_BYPASS),
  .tcu_mio_tdo(tcu_mio_tdo),
  .tcu_mio_tdo_en(tcu_mio_tdo_en),
  .tcu_mio_stciq(tcu_mio_stciq),
  .mio_tcu_stcid(mio_tcu_stcid),
  .mio_tcu_stcicfg(mio_tcu_stcicfg[1:0]),
  .mio_tcu_stciclk(mio_tcu_stciclk),
  .mio_fsr_testclkt(mio_fsr_testclkt[7:0]),
  .mio_fsr_testclkr(mio_fsr_testclkr[7:0]),
  .mio_tcu_divider_bypass(mio_tcu_divider_bypass),
  .mio_tcu_pll_cmp_bypass(mio_tcu_pll_cmp_bypass),
  .DBG_DQ(DBG_DQ[165:0]),
  .DBG_CK0(DBG_CK0),
  .TRIGIN(TRIGIN),
  .TRIGOUT(TRIGOUT),
  .mio_tcu_scan_in31(mio_tcu_scan_in31),
  .tcu_mio_scan_out31(tcu_mio_scan_out31),
  .niu_mio_debug_data(niu_mio_debug_data[31:0]),
  .niu_mio_debug_clock(niu_mio_debug_clock[1:0]),
  .dbg0_mio_debug_bus_a(dbg0_mio_debug_bus_a[7:0]),
  .dbg0_mio_debug_bus_b(dbg0_mio_debug_bus_b[7:0]),
  .peu_mio_debug_bus_a(peu_mio_debug_bus_a[7:0]),
  .peu_mio_debug_bus_b(peu_mio_debug_bus_b[7:0]),
  .peu_mio_pipe_txdata(peu_mio_pipe_txdata[63:0]),
  .peu_mio_pipe_txdatak(peu_mio_pipe_txdatak[7:0]),
  .peu_mio_debug_clk(peu_mio_debug_clk),
  .mio_pll_testmode(mio_pll_testmode),
  .mio_ccu_pll_char_in(mio_ccu_pll_char_in),
  .mio_ccu_pll_div2(mio_ccu_pll_div2[5:0]),
  .mio_ccu_pll_trst_l(mio_ccu_pll_trst_l),
  .mio_ccu_pll_clamp_fltr(mio_ccu_pll_clamp_fltr),
  .mio_ccu_pll_div4(mio_ccu_pll_div4[6:0]),
  .mio_ext_dr_clk(mio_ext_dr_clk),
  .mio_ext_cmp_clk(mio_ext_cmp_clk),
  .ccu_mio_pll_char_out(ccu_mio_pll_char_out[1:0]),
  .mio_ccu_vreg_selbg_l(mio_ccu_vreg_selbg_l),
  .mio_tcu_io_ac_testmode(mio_tcu_io_ac_testmode),
  .mio_tcu_io_ac_testtrig(mio_tcu_io_ac_testtrig),
  .mio_tcu_io_aclk(mio_tcu_io_aclk),
  .mio_tcu_io_bclk(mio_tcu_io_bclk),
  .mio_tcu_io_scan_in(mio_tcu_io_scan_in[30:0]),
  .mio_tcu_peu_clk_ext(mio_tcu_peu_clk_ext),
  .mio_tcu_niu_clk_ext(mio_tcu_niu_clk_ext[5:0]),
  .mio_tcu_io_scan_en(mio_tcu_io_scan_en),
  .tcu_mio_pins_scan_out(tcu_mio_pins_scan_out[30:0]),
  .tcu_mio_dmo_data(tcu_mio_dmo_data[39:0]),
  .tcu_mio_mbist_done(tcu_mio_mbist_done),
  .tcu_mio_mbist_fail(tcu_mio_mbist_fail),
  .tcu_mio_dmo_sync(tcu_mio_dmo_sync),
  .dbg1_mio_dbg_dq(dbg1_mio_dbg_dq[165:0]),
  .mio_tcu_trigin(mio_tcu_trigin),
  .tcu_mio_trigout(tcu_mio_trigout),
  .dbg1_mio_drv_en_op_only(dbg1_mio_drv_en_op_only),
  .dbg1_mio_drv_en_muxtest_inp(dbg1_mio_drv_en_muxtest_inp),
  .dbg1_mio_drv_en_muxtestpll_inp(dbg1_mio_drv_en_muxtestpll_inp),
  .dbg1_mio_drv_en_muxtest_op(dbg1_mio_drv_en_muxtest_op),
  .dbg1_mio_drv_en_muxbist_op(dbg1_mio_drv_en_muxbist_op),
  .PMI(PMI[1:0]),
  .PMO(PMO),
  .PGRM_EN(PGRM_EN),
  .BURNIN(BURNIN),
  .PEX_RESET_L(PEX_RESET_L),
  .PB_RST_L(PB_RST_L),
  .BUTTON_XIR_L(BUTTON_XIR_L),
  .PWRON_RST_L(PWRON_RST_L),
  .SSI_MOSI(SSI_MOSI),
  .SSI_MISO(SSI_MISO),
  .SSI_SCK(SSI_SCK),
  .SSI_EXT_INT_L(SSI_EXT_INT_L),
  .SSI_SYNC_L(SSI_SYNC_L),
  .VREG_SELBG_L(VREG_SELBG_L),
  .PLL_CHAR_OUT(PLL_CHAR_OUT[1:0]),
  .PLL_TESTMODE(PLL_TESTMODE),
  .PWR_THRTTL_0(PWR_THRTTL_0[2:0]),
  .PWR_THRTTL_1(PWR_THRTTL_1[2:0]),
  .rst_mio_pex_reset_l(rst_mio_pex_reset_l),
  .rst_mio_rst_state(rst_mio_rst_state[5:0]),
  .mio_rst_pb_rst_l(mio_rst_pb_rst_l),
  .mio_rst_button_xir_l(mio_rst_button_xir_l),
  .mio_rst_pwron_rst_l(mio_rst_pwron_rst_l),
  .ncu_mio_ssi_mosi(ncu_mio_ssi_mosi),
  .mio_ncu_ssi_miso(mio_ncu_ssi_miso),
  .ncu_mio_ssi_sck(ncu_mio_ssi_sck),
  .mio_ncu_ext_int_l(mio_ncu_ext_int_l),
  .rst_mio_ssi_sync_l(rst_mio_ssi_sync_l),
  .tcu_mio_jtag_membist_mode(tcu_mio_jtag_membist_mode),
  .dbg1_mio_sel_niu_debug_mode(dbg1_mio_sel_niu_debug_mode),
  .dbg1_mio_sel_pcix_debug_mode(dbg1_mio_sel_pcix_debug_mode),
  .dbg1_mio_sel_soc_obs_mode(dbg1_mio_sel_soc_obs_mode),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_mio_bs_scan_in(tcu_mio_bs_scan_in),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .mio_tcu_bs_scan_out(mio_tcu_bs_scan_out),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl)
  );
`endif  // OPENSPARC_CMP

// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
db0 dbg0 (

//.rst_por_(rst_por_		), // Remove.  March 8 '05.
//.rst_wmr_(rst_wmr_		), // Remove.  March 8 '05.
  .scan_in(db1_scan_out),
  .scan_out(db0_scan_out),
  .dmu_dbg0_debug_bus_a (dmu_mio_debug_bus_a[ 7 : 0 ]),
  .dmu_dbg0_debug_bus_b (dmu_mio_debug_bus_b[ 7 : 0 ]),
  .gclk( cmp_gclk_c3_db0 ), // cmp_gclk_c0_r[0]), // temporary
  .tcu_clk_stop ( gl_db0_clk_stop ),	// staged clk_stop
  .ccu_io_out	( gl_io_out_c3b0 ),	// ECO c3b -> c3b0 - mh157021 
  .cmp_io2x_sync_en( gl_io2x_sync_en_c3t ), // ( gl_io2x_sync_en_c3t0 ),  for int6.1
  .io_cmp_sync_en( gl_io_cmp_sync_en_c3b ),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_div_bypass(tcu_div_bypass),
  .dmu_ncu_wrack_vld(dmu_ncu_wrack_vld),
  .dmu_ncu_wrack_tag(dmu_ncu_wrack_tag[ 3 : 0 ]),
  .dmu_ncu_data(dmu_ncu_data[ 31 : 0 ]),
  .dmu_ncu_vld(dmu_ncu_vld),
  .dmu_ncu_stall(dmu_ncu_stall),
  .dmu_sii_hdr_vld(dmu_sii_hdr_vld),
  .dmu_sii_reqbypass(dmu_sii_reqbypass),
  .dmu_sii_datareq(dmu_sii_datareq),
  .dmu_sii_datareq16(dmu_sii_datareq16),
  .dmu_sii_data(dmu_sii_data[ 127 : 0 ]),
  .dmu_sii_be(dmu_sii_be[ 15 : 0 ]),
  .niu_ncu_vld(niu_ncu_vld),
  .niu_ncu_data(niu_ncu_data[ 31 : 0 ]),
  .niu_ncu_stall(niu_ncu_stall),
  .niu_sii_hdr_vld(niu_sii_hdr_vld),
  .niu_sii_reqbypass(niu_sii_reqbypass),
  .niu_sii_datareq(niu_sii_datareq),
  .niu_sii_data(niu_sii_data[ 127 : 0 ]),
  .niu_sio_dq(niu_sio_dq),
  .l2t0_dbg0_sii_iq_dequeue(l2t0_dbg0_sii_iq_dequeue),
  .l2t2_dbg0_sii_iq_dequeue(l2t2_dbg0_sii_iq_dequeue),
  .l2t0_dbg0_sii_wib_dequeue(l2t0_dbg0_sii_wib_dequeue),
  .l2t2_dbg0_sii_wib_dequeue(l2t2_dbg0_sii_wib_dequeue),
  .l2t0_dbg0_err_event(l2t0_dbg0_err_event),
  .l2t2_dbg0_err_event(l2t2_dbg0_err_event),
  .l2t0_dbg0_pa_match(l2t0_dbg0_pa_match),
  .l2t2_dbg0_pa_match(l2t2_dbg0_pa_match),
  .l2t0_dbg0_xbar_vcid(l2t0_dbg0_xbar_vcid[ 5 : 0 ]),
  .l2t2_dbg0_xbar_vcid(l2t2_dbg0_xbar_vcid[ 5 : 0 ]),
  .l2b0_dbg0_sio_ctag_vld(l2b0_dbg0_sio_ctag_vld),
  .l2b1_dbg0_sio_ctag_vld(l2b1_dbg0_sio_ctag_vld),
  .l2b2_dbg0_sio_ctag_vld(l2b2_dbg0_sio_ctag_vld),
  .l2b3_dbg0_sio_ctag_vld(l2b3_dbg0_sio_ctag_vld),
  .l2b0_dbg0_sio_ack_type(l2b0_dbg0_sio_ack_type),
  .l2b1_dbg0_sio_ack_type(l2b1_dbg0_sio_ack_type),
  .l2b2_dbg0_sio_ack_type(l2b2_dbg0_sio_ack_type),
  .l2b3_dbg0_sio_ack_type(l2b3_dbg0_sio_ack_type),
  .l2b0_dbg0_sio_ack_dest(l2b0_dbg0_sio_ack_dest),
  .l2b1_dbg0_sio_ack_dest(l2b1_dbg0_sio_ack_dest),
  .l2b2_dbg0_sio_ack_dest(l2b2_dbg0_sio_ack_dest),
  .l2b3_dbg0_sio_ack_dest(l2b3_dbg0_sio_ack_dest),
  .spc0_dbg0_instr_cmt_grp0(spc0_dbg0_instr_cmt_grp0[ 1 : 0 ]),
  .spc0_dbg0_instr_cmt_grp1(spc0_dbg0_instr_cmt_grp1[ 1 : 0 ]),
  .spc2_dbg0_instr_cmt_grp0(spc2_dbg0_instr_cmt_grp0[ 1 : 0 ]),
  .spc2_dbg0_instr_cmt_grp1(spc2_dbg0_instr_cmt_grp1[ 1 : 0 ]),
  .dbg0_dbg1_debug_data(dbg0_dbg1_debug_data[ 165 : 0 ]),
  .dbg0_dbg1_l2t0_sii_iq_dequeue(dbg0_dbg1_l2t0_sii_iq_dequeue),
  .dbg0_dbg1_l2t2_sii_iq_dequeue(dbg0_dbg1_l2t2_sii_iq_dequeue),
  .dbg0_dbg1_l2t0_sii_wib_dequeue(dbg0_dbg1_l2t0_sii_wib_dequeue),
  .dbg0_dbg1_l2t2_sii_wib_dequeue(dbg0_dbg1_l2t2_sii_wib_dequeue),
  .dbg0_dbg1_l2t0_err_event(dbg0_dbg1_l2t0_err_event),
  .dbg0_dbg1_l2t2_err_event(dbg0_dbg1_l2t2_err_event),
  .dbg0_dbg1_l2t0_pa_match(dbg0_dbg1_l2t0_pa_match),
  .dbg0_dbg1_l2t2_pa_match(dbg0_dbg1_l2t2_pa_match),
  .dbg0_dbg1_l2t0_xbar_vcid(dbg0_dbg1_l2t0_xbar_vcid[ 5 : 0 ]),
  .dbg0_dbg1_l2t2_xbar_vcid(dbg0_dbg1_l2t2_xbar_vcid[ 5 : 0 ]),
  .dbg0_dbg1_l2b0_sio_ctag_vld(dbg0_dbg1_l2b0_sio_ctag_vld),
  .dbg0_dbg1_l2b1_sio_ctag_vld(dbg0_dbg1_l2b1_sio_ctag_vld),
  .dbg0_dbg1_l2b2_sio_ctag_vld(dbg0_dbg1_l2b2_sio_ctag_vld),
  .dbg0_dbg1_l2b3_sio_ctag_vld(dbg0_dbg1_l2b3_sio_ctag_vld),
  .dbg0_dbg1_l2b0_sio_ack_type(dbg0_dbg1_l2b0_sio_ack_type),
  .dbg0_dbg1_l2b1_sio_ack_type(dbg0_dbg1_l2b1_sio_ack_type),
  .dbg0_dbg1_l2b2_sio_ack_type(dbg0_dbg1_l2b2_sio_ack_type),
  .dbg0_dbg1_l2b3_sio_ack_type(dbg0_dbg1_l2b3_sio_ack_type),
  .dbg0_dbg1_l2b0_sio_ack_dest(dbg0_dbg1_l2b0_sio_ack_dest),
  .dbg0_dbg1_l2b1_sio_ack_dest(dbg0_dbg1_l2b1_sio_ack_dest),
  .dbg0_dbg1_l2b2_sio_ack_dest(dbg0_dbg1_l2b2_sio_ack_dest),
  .dbg0_dbg1_l2b3_sio_ack_dest(dbg0_dbg1_l2b3_sio_ack_dest),
  .dbg0_dbg1_spc0_instr_cmt_grp0(dbg0_dbg1_spc0_instr_cmt_grp0[ 1 : 0 ]),
  .dbg0_dbg1_spc0_instr_cmt_grp1(dbg0_dbg1_spc0_instr_cmt_grp1[ 1 : 0 ]),
  .dbg0_dbg1_spc2_instr_cmt_grp0(dbg0_dbg1_spc2_instr_cmt_grp0[ 1 : 0 ]),
  .dbg0_dbg1_spc2_instr_cmt_grp1(dbg0_dbg1_spc2_instr_cmt_grp1[ 1 : 0 ]),
  .dbg0_mio_debug_bus_a(dbg0_mio_debug_bus_a[ 7 : 0 ]),
  .dbg0_mio_debug_bus_b(dbg0_mio_debug_bus_b[ 7 : 0 ]),
  .tcu_atpg_mode(tcu_atpg_mode),
  .cluster_arst_l(cluster_arst_l) // ccu_io_cmp_sync_en),
);
`endif  // OPENSPARC_CMP

// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
db1 dbg1 (

//.rst_por_(rst_por_		), // Remove.  March 8 '05.
//.rst_wmr_(rst_wmr_		), // Remove.  March 8 '05.
  .scan_in(tcu_soc6_scan_out	),
  .scan_out(db1_scan_out),
  .dmu_dbg1_err_event(dmu_dbg_err_event),
  .gclk( cmp_gclk_c1_db1 ), // cmp_gclk_c0_r[0]), // temporary
  .tcu_clk_stop ( gl_db1_clk_stop ),	// staged clk_stop
  .ccu_io_out	( gl_io_out_c1m ),	// staged div phase
  .cmp_io2x_sync_en( gl_io2x_sync_en_c1m ), 
  .io_cmp_sync_en( gl_io_cmp_sync_en_c1m ), 
  .cmp_io_sync_en( gl_cmp_io_sync_en_c1m ), 
  .mio_dbg1_testmode(mio_tcu_testmode),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .rst_wmr_protect(rst_wmr_protect),
  .tcu_div_bypass(tcu_div_bypass),
  .ccu_dbg1_serdes_dtm(ccu_dbg1_serdes_dtm),
  .l2t1_dbg1_sii_iq_dequeue(l2t1_dbg1_sii_iq_dequeue),
  .l2t3_dbg1_sii_iq_dequeue(l2t3_dbg1_sii_iq_dequeue),
  .l2t4_dbg1_sii_iq_dequeue(l2t4_dbg1_sii_iq_dequeue),
  .l2t5_dbg1_sii_iq_dequeue(l2t5_dbg1_sii_iq_dequeue),
  .l2t6_dbg1_sii_iq_dequeue(l2t6_dbg1_sii_iq_dequeue),
  .l2t7_dbg1_sii_iq_dequeue(l2t7_dbg1_sii_iq_dequeue),
  .l2t1_dbg1_sii_wib_dequeue(l2t1_dbg1_sii_wib_dequeue),
  .l2t3_dbg1_sii_wib_dequeue(l2t3_dbg1_sii_wib_dequeue),
  .l2t4_dbg1_sii_wib_dequeue(l2t4_dbg1_sii_wib_dequeue),
  .l2t5_dbg1_sii_wib_dequeue(l2t5_dbg1_sii_wib_dequeue),
  .l2t6_dbg1_sii_wib_dequeue(l2t6_dbg1_sii_wib_dequeue),
  .l2t7_dbg1_sii_wib_dequeue(l2t7_dbg1_sii_wib_dequeue),
  .l2t1_dbg1_err_event(l2t1_dbg1_err_event),
  .l2t3_dbg1_err_event(l2t3_dbg1_err_event),
  .l2t4_dbg1_err_event(l2t4_dbg1_err_event),
  .l2t6_dbg1_err_event(l2t6_dbg1_err_event),
  .l2t7_dbg1_err_event(l2t7_dbg1_err_event),
  .l2t1_dbg1_pa_match(l2t1_dbg1_pa_match),
  .l2t3_dbg1_pa_match(l2t3_dbg1_pa_match),
  .l2t4_dbg1_pa_match(l2t4_dbg1_pa_match),
  .l2t5_dbg1_pa_match(l2t5_dbg1_pa_match),
  .l2t6_dbg1_pa_match(l2t6_dbg1_pa_match),
  .l2t7_dbg1_pa_match(l2t7_dbg1_pa_match),
  .l2t1_dbg1_xbar_vcid(l2t1_dbg1_xbar_vcid[ 5 : 0 ]),
  .l2t3_dbg1_xbar_vcid(l2t3_dbg1_xbar_vcid[ 5 : 0 ]),
  .l2t4_dbg1_xbar_vcid(l2t4_dbg1_xbar_vcid[ 5 : 0 ]),
  .l2t5_dbg1_xbar_vcid(l2t5_dbg1_xbar_vcid[ 5 : 0 ]),
  .l2t6_dbg1_xbar_vcid(l2t6_dbg1_xbar_vcid[ 5 : 0 ]),
  .l2t7_dbg1_xbar_vcid(l2t7_dbg1_xbar_vcid[ 5 : 0 ]),
  .l2b4_dbg1_sio_ctag_vld(l2b4_dbg1_sio_ctag_vld),
  .l2b5_dbg1_sio_ctag_vld(l2b5_dbg1_sio_ctag_vld),
  .l2b6_dbg1_sio_ctag_vld(l2b6_dbg1_sio_ctag_vld),
  .l2b7_dbg1_sio_ctag_vld(l2b7_dbg1_sio_ctag_vld),
  .l2b4_dbg1_sio_ack_type(l2b4_dbg1_sio_ack_type),
  .l2b5_dbg1_sio_ack_type(l2b5_dbg1_sio_ack_type),
  .l2b6_dbg1_sio_ack_type(l2b6_dbg1_sio_ack_type),
  .l2b7_dbg1_sio_ack_type(l2b7_dbg1_sio_ack_type),
  .l2b4_dbg1_sio_ack_dest(l2b4_dbg1_sio_ack_dest),
  .l2b5_dbg1_sio_ack_dest(l2b5_dbg1_sio_ack_dest),
  .l2b6_dbg1_sio_ack_dest(l2b6_dbg1_sio_ack_dest),
  .l2b7_dbg1_sio_ack_dest(l2b7_dbg1_sio_ack_dest),
  .spc1_dbg1_instr_cmt_grp0(spc1_dbg1_instr_cmt_grp0[ 1 : 0 ]),
  .spc1_dbg1_instr_cmt_grp1(spc1_dbg1_instr_cmt_grp1[ 1 : 0 ]),
  .spc3_dbg1_instr_cmt_grp0(spc3_dbg1_instr_cmt_grp0[ 1 : 0 ]),
  .spc3_dbg1_instr_cmt_grp1(spc3_dbg1_instr_cmt_grp1[ 1 : 0 ]),
  .spc4_dbg1_instr_cmt_grp0(spc4_dbg1_instr_cmt_grp0[ 1 : 0 ]),
  .spc4_dbg1_instr_cmt_grp1(spc4_dbg1_instr_cmt_grp1[ 1 : 0 ]),
  .spc5_dbg1_instr_cmt_grp0(spc5_dbg1_instr_cmt_grp0[ 1 : 0 ]),
  .spc5_dbg1_instr_cmt_grp1(spc5_dbg1_instr_cmt_grp1[ 1 : 0 ]),
  .spc6_dbg1_instr_cmt_grp0(spc6_dbg1_instr_cmt_grp0[ 1 : 0 ]),
  .spc6_dbg1_instr_cmt_grp1(spc6_dbg1_instr_cmt_grp1[ 1 : 0 ]),
  .spc7_dbg1_instr_cmt_grp0(spc7_dbg1_instr_cmt_grp0[ 1 : 0 ]),
  .spc7_dbg1_instr_cmt_grp1(spc7_dbg1_instr_cmt_grp1[ 1 : 0 ]),
  .mcu0_dbg1_crc21(mcu0_dbg1_crc21),
  .mcu0_dbg1_rd_req_in_0(mcu0_dbg1_rd_req_in_0[ 3 : 0 ]),
  .mcu0_dbg1_rd_req_in_1(mcu0_dbg1_rd_req_in_1[ 3 : 0 ]),
  .mcu0_dbg1_rd_req_out(mcu0_dbg1_rd_req_out[ 4 : 0 ]),
  .mcu0_dbg1_wr_req_in_0(mcu0_dbg1_wr_req_in_0),
  .mcu0_dbg1_wr_req_in_1(mcu0_dbg1_wr_req_in_1),
  .mcu0_dbg1_wr_req_out(mcu0_dbg1_wr_req_out[ 1 : 0 ]),
  .mcu0_dbg1_mecc_err(mcu0_dbg1_mecc_err),
  .mcu0_dbg1_secc_err(mcu0_dbg1_secc_err),
  .mcu0_dbg1_fbd_err(mcu0_dbg1_fbd_err),
  .mcu0_dbg1_err_mode(mcu0_dbg1_err_mode),
  .mcu0_dbg1_err_event(mcu0_dbg1_err_event),
  .mcu1_dbg1_crc21(mcu1_dbg1_crc21),
  .mcu1_dbg1_rd_req_in_0(mcu1_dbg1_rd_req_in_0[ 3 : 0 ]),
  .mcu1_dbg1_rd_req_in_1(mcu1_dbg1_rd_req_in_1[ 3 : 0 ]),
  .mcu1_dbg1_rd_req_out(mcu1_dbg1_rd_req_out[ 4 : 0 ]),
  .mcu1_dbg1_wr_req_in_0(mcu1_dbg1_wr_req_in_0),
  .mcu1_dbg1_wr_req_in_1(mcu1_dbg1_wr_req_in_1),
  .mcu1_dbg1_wr_req_out(mcu1_dbg1_wr_req_out[ 1 : 0 ]),
  .mcu1_dbg1_mecc_err(mcu1_dbg1_mecc_err),
  .mcu1_dbg1_secc_err(mcu1_dbg1_secc_err),
  .mcu1_dbg1_fbd_err(mcu1_dbg1_fbd_err),
  .mcu1_dbg1_err_mode(mcu1_dbg1_err_mode),
  .mcu1_dbg1_err_event(mcu1_dbg1_err_event),
  .mcu2_dbg1_crc21(mcu2_dbg1_crc21),
  .mcu2_dbg1_rd_req_in_0(mcu2_dbg1_rd_req_in_0[ 3 : 0 ]),
  .mcu2_dbg1_rd_req_in_1(mcu2_dbg1_rd_req_in_1[ 3 : 0 ]),
  .mcu2_dbg1_rd_req_out(mcu2_dbg1_rd_req_out[ 4 : 0 ]),
  .mcu2_dbg1_wr_req_in_0(mcu2_dbg1_wr_req_in_0),
  .mcu2_dbg1_wr_req_in_1(mcu2_dbg1_wr_req_in_1),
  .mcu2_dbg1_wr_req_out(mcu2_dbg1_wr_req_out[ 1 : 0 ]),
  .mcu2_dbg1_mecc_err(mcu2_dbg1_mecc_err),
  .mcu2_dbg1_secc_err(mcu2_dbg1_secc_err),
  .mcu2_dbg1_fbd_err(mcu2_dbg1_fbd_err),
  .mcu2_dbg1_err_mode(mcu2_dbg1_err_mode),
  .mcu2_dbg1_err_event(mcu2_dbg1_err_event),
  .mcu3_dbg1_crc21(mcu3_dbg1_crc21),
  .mcu3_dbg1_rd_req_in_0(mcu3_dbg1_rd_req_in_0[ 3 : 0 ]),
  .mcu3_dbg1_rd_req_in_1(mcu3_dbg1_rd_req_in_1[ 3 : 0 ]),
  .mcu3_dbg1_rd_req_out(mcu3_dbg1_rd_req_out[ 4 : 0 ]),
  .mcu3_dbg1_wr_req_in_0(mcu3_dbg1_wr_req_in_0),
  .mcu3_dbg1_wr_req_in_1(mcu3_dbg1_wr_req_in_1),
  .mcu3_dbg1_wr_req_out(mcu3_dbg1_wr_req_out[ 1 : 0 ]),
  .mcu3_dbg1_mecc_err(mcu3_dbg1_mecc_err),
  .mcu3_dbg1_secc_err(mcu3_dbg1_secc_err),
  .mcu3_dbg1_fbd_err(mcu3_dbg1_fbd_err),
  .mcu3_dbg1_err_mode(mcu3_dbg1_err_mode),
  .mcu3_dbg1_err_event(mcu3_dbg1_err_event),
  .dbg1_niu_stall(dbg1_niu_stall),
  .niu_dbg1_stall_ack(niu_dbg1_stall_ack),
  .dbg1_niu_resume(dbg1_niu_resume),
  .dbg1_dmu_stall(dbg1_dmu_stall),
  .dmu_dbg1_stall_ack(dmu_dbg1_stall_ack),
  .dbg1_dmu_resume(dbg1_dmu_resume),
  .sii_dbg1_l2t0_req(sii_dbg1_l2t0_req_ccxrff[ 1 : 0 ]),
  .sii_dbg1_l2t1_req(sii_dbg1_l2t1_req_ccxrff[ 1 : 0 ]),
  .sii_dbg1_l2t2_req(sii_dbg1_l2t2_req_ccxrff[ 1 : 0 ]),
  .sii_dbg1_l2t3_req(sii_dbg1_l2t3_req_ccxrff[ 1 : 0 ]),
  .sii_dbg1_l2t4_req(sii_dbg1_l2t4_req_ccxrff[ 1 : 0 ]),
  .sii_dbg1_l2t5_req(sii_dbg1_l2t5_req_ccxrff[ 1 : 0 ]),
  .sii_dbg1_l2t6_req(sii_dbg1_l2t6_req_ccxrff[ 1 : 0 ]),
  .sii_dbg1_l2t7_req(sii_dbg1_l2t7_req_ccxrff[ 1 : 0 ]),
  .ncu_dbg1_error_event(ncu_dbg1_error_event),
  .ncu_dbg1_stall(ncu_dbg1_stall),
  .ncu_dbg1_vld(ncu_dbg1_vld),
  .ncu_dbg1_data(ncu_dbg1_data[ 3 : 0 ]),
  .dbg1_ncu_stall(dbg1_ncu_stall),
  .dbg1_ncu_vld(dbg1_ncu_vld),
  .dbg1_ncu_data(dbg1_ncu_data[ 3 : 0 ]),
  .dbg1_tcu_soc_hard_stop(dbg1_tcu_soc_hard_stop),
  .dbg1_tcu_soc_asrt_trigout(dbg1_tcu_soc_asrt_trigout),
  .tcu_mio_jtag_membist_mode(tcu_mio_jtag_membist_mode),
  .dbg1_niu_dbg_sel(dbg1_niu_dbg_sel[ 4 : 0 ]),
  .mio_pll_testmode(mio_pll_testmode),
  .dbg1_mio_dbg_dq(dbg1_mio_dbg_dq[ 165 : 0 ]),
  .dbg1_mio_drv_en_op_only(dbg1_mio_drv_en_op_only),
  .dbg1_mio_drv_en_muxtest_op(dbg1_mio_drv_en_muxtest_op),
  .dbg1_mio_drv_en_muxbist_op(dbg1_mio_drv_en_muxbist_op),
  .dbg1_mio_drv_en_muxtest_inp(dbg1_mio_drv_en_muxtest_inp),
  .dbg1_mio_drv_en_muxtestpll_inp(dbg1_mio_drv_en_muxtestpll_inp),
  .dbg1_mio_sel_niu_debug_mode(dbg1_mio_sel_niu_debug_mode),
  .dbg1_mio_sel_pcix_debug_mode(dbg1_mio_sel_pcix_debug_mode),
  .dbg1_mio_sel_soc_obs_mode(dbg1_mio_sel_soc_obs_mode),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[ 1 : 0 ]),
  .dbg0_dbg1_l2b0_sio_ack_dest(dbg0_dbg1_l2b0_sio_ack_dest_ccxlff),
  .dbg0_dbg1_l2b0_sio_ack_type(dbg0_dbg1_l2b0_sio_ack_type_ccxlff),
  .dbg0_dbg1_l2b0_sio_ctag_vld(dbg0_dbg1_l2b0_sio_ctag_vld_ccxlff),
  .dbg0_dbg1_l2b1_sio_ack_dest(dbg0_dbg1_l2b1_sio_ack_dest_ccxlff),
  .dbg0_dbg1_l2b1_sio_ack_type(dbg0_dbg1_l2b1_sio_ack_type_ccxlff),
  .dbg0_dbg1_l2b1_sio_ctag_vld(dbg0_dbg1_l2b1_sio_ctag_vld_ccxlff),
  .dbg0_dbg1_l2b2_sio_ack_dest(dbg0_dbg1_l2b2_sio_ack_dest_ccxlff),
  .dbg0_dbg1_l2b2_sio_ack_type(dbg0_dbg1_l2b2_sio_ack_type_ccxlff),
  .dbg0_dbg1_l2b2_sio_ctag_vld(dbg0_dbg1_l2b2_sio_ctag_vld_ccxlff),
  .dbg0_dbg1_l2b3_sio_ack_dest(dbg0_dbg1_l2b3_sio_ack_dest_ccxlff),
  .dbg0_dbg1_l2b3_sio_ack_type(dbg0_dbg1_l2b3_sio_ack_type_ccxlff),
  .dbg0_dbg1_l2b3_sio_ctag_vld(dbg0_dbg1_l2b3_sio_ctag_vld_ccxlff),
  .dbg0_dbg1_l2t0_err_event(dbg0_dbg1_l2t0_err_event_ccxlff),
  .dbg0_dbg1_l2t0_pa_match(dbg0_dbg1_l2t0_pa_match_ccxlff),
  .dbg0_dbg1_l2t0_sii_iq_dequeue(dbg0_dbg1_l2t0_sii_iq_dequeue_ccxlff),
  .dbg0_dbg1_l2t0_sii_wib_dequeue(dbg0_dbg1_l2t0_sii_wib_dequeue_ccxlff),
  .dbg0_dbg1_l2t0_xbar_vcid(dbg0_dbg1_l2t0_xbar_vcid_ccxlff[ 5 : 0 ]),
  .dbg0_dbg1_l2t2_err_event(dbg0_dbg1_l2t2_err_event_ccxlff),
  .dbg0_dbg1_l2t2_pa_match(dbg0_dbg1_l2t2_pa_match_ccxlff),
  .dbg0_dbg1_l2t2_sii_iq_dequeue(dbg0_dbg1_l2t2_sii_iq_dequeue_ccxlff),
  .dbg0_dbg1_l2t2_sii_wib_dequeue(dbg0_dbg1_l2t2_sii_wib_dequeue_ccxlff),
  .dbg0_dbg1_l2t2_xbar_vcid(dbg0_dbg1_l2t2_xbar_vcid_ccxlff[ 5 : 0 ]),
  .dbg0_dbg1_spc0_instr_cmt_grp0({dbg0_dbg1_spc0_instr_cmt_grp0_ccxlff_1,dbg0_dbg1_spc0_instr_cmt_grp0_ccxlff_0}),
  .dbg0_dbg1_spc0_instr_cmt_grp1({dbg0_dbg1_spc0_instr_cmt_grp1_ccxlff_1,dbg0_dbg1_spc0_instr_cmt_grp1_ccxlff_0}),
  .dbg0_dbg1_spc2_instr_cmt_grp0({dbg0_dbg1_spc2_instr_cmt_grp0_ccxlff_1,dbg0_dbg1_spc2_instr_cmt_grp0_ccxlff_0}),
  .dbg0_dbg1_spc2_instr_cmt_grp1({dbg0_dbg1_spc2_instr_cmt_grp1_ccxlff_1,dbg0_dbg1_spc2_instr_cmt_grp1_ccxlff_0}),
  .dbg0_dbg1_debug_data(dbg0_dbg1_debug_data[ 165 : 0 ]),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_dbr_gateoff(tcu_dbr_gateoff),
  .cluster_arst_l(cluster_arst_l),
  .l2t5_dbg1_err_event(l2t5_dbg1_err_event)
 );
`endif  // OPENSPARC_CMP

//________________________________________________________________


`ifndef RTL_NO_SPC0
spc spc0(
  .vnw_ary0                 (SPC_VNW[ 0 ]),
  .vnw_ary1		    (SPC_VNW[ 0 ]),
  .gclk				  ( cmp_gclk_c3_spc0 ), // cmp_gclk_c1_r[1]) ,
  .tcu_clk_stop ( gl_spc0_clk_stop ),	// staged clk_stop
  .cpx_spc_data_cx	    (cpx_spc0_data_cx2[ 145 : 0 ]	 ),// sparc core
  .pcx_spc_grant_px	    (pcx_spc0_grant_px[ 8 : 0 ]	 ),
  .spc_pcx_req_pq	    (spc0_pcx_req_pq[ 8 : 0 ]	 ),
  .spc_pcx_atm_pq	    (spc0_pcx_atm_pq[ 8 : 0 ]	 ),
  .spc_pcx_data_pa	    (spc0_pcx_data_pa[ 129 : 0 ]	 ),
  .spc_hardstop_request	    (spc0_hardstop_request),
  .spc_softstop_request	    (spc0_softstop_request),
  .spc_trigger_pulse	    (spc0_trigger_pulse),
  .tcu_ss_mode		    (tcu_ss_mode[ 0 ]),
  .tcu_do_mode		    (tcu_do_mode[ 0 ]),
  .tcu_ss_request	    (tcu_ss_request_t1lff_0),
  .spc_ss_complete	    (spc0_ss_complete),
  .tcu_aclk		    (tcu_spc0_aclk		 ),
  .tcu_bclk		    (tcu_spc0_bclk		 ),
  .tcu_scan_en		    (tcu_spc0_scan_en		 ),
  .tcu_se_scancollar_in	    (tcu_spc0_se_scancollar_in	 ),
  .tcu_se_scancollar_out    (tcu_spc0_se_scancollar_out	 ),
  .tcu_array_wr_inhibit	    (tcu_spc0_array_wr_inhibit	 ),
  .tcu_core_running	    (ncu_spc0_core_running[ 7 : 0 ]	 ),
  .spc_core_running_status  (spc0_ncu_core_running_status[ 7 : 0 ]),
  .const_cpuid		    ({1'b0, 1'b0, 1'b0}		 ),//No 3'b101 to Astro.
  .power_throttle	    (mio_spc_pwr_throttle_0[ 2 : 0 ]),
  .scan_out		    (spc0_tcu_scan_in[ 1 : 0 ]	 ),
  .scan_in		    (tcu_spc0_scan_out[ 1 : 0 ]	 ),
  .spc_dbg_instr_cmt_grp0   (spc0_dbg0_instr_cmt_grp0[ 1 : 0 ]),
  .spc_dbg_instr_cmt_grp1   (spc0_dbg0_instr_cmt_grp1[ 1 : 0 ]),
  .tcu_spc_mbist_start	    (tcu_spc0_mbist_start_t1lff_0),
  .spc_mbist_done	    (spc0_tcu_mbist_done    ),
  .spc_mbist_fail	    (spc0_tcu_mbist_fail    ),
  .tcu_spc_mbist_scan_in    (tcu_spc0_mbist_scan_in	 ),
  .spc_tcu_mbist_scan_out   (spc0_tcu_mbist_scan_out	 ),
  .dmo_din		    (36'b0			 ),
  .dmo_dout		    (spc0_dmo_dout[ 35 : 0 ]	 ),
  .dmo_coresel		    (1'b0			 ),
  .tcu_spc_lbist_start	    (tcu_spc_lbist_start[ 0 ]	 ),
  .tcu_spc_lbist_scan_in    (tcu_spc_lbist_scan_in[ 0 ]	 ),
  .spc_tcu_lbist_done	    (spc0_tcu_lbist_done	 ),
  .spc_tcu_lbist_scan_out   (spc0_tcu_lbist_scan_out	 ),
  .tcu_shscan_pce_ov	    (tcu_spc_shscan_pce_ov	 ),
  .tcu_shscan_aclk	    (tcu_spc_shscan_aclk	 ),
  .tcu_shscan_bclk	    (tcu_spc_shscan_bclk	 ),
  .tcu_shscan_scan_en	    (tcu_spc_shscan_scan_en	 ),
  .tcu_shscanid		    (tcu_spc_shscanid[ 2 : 0 ]	 ),
  .tcu_shscan_scan_in	    (tcu_spc0_shscan_scan_out	 ),
  .spc_shscan_scan_out	    (spc0_tcu_shscan_scan_in	 ),
  .tcu_shscan_clk_stop	    (tcu_spc0_shscan_clk_stop	 ),
  .efu_spc_fuse_data	    (efu_spc0246_fuse_data	 ),
  .efu_spc_fuse_ixfer_en    (efu_spc0_fuse_ixfer_en	 ),
  .efu_spc_fuse_iclr	    (efu_spc0_fuse_iclr		 ),
  .efu_spc_fuse_dxfer_en    (efu_spc0_fuse_dxfer_en	 ),
  .efu_spc_fuse_dclr	    (efu_spc0_fuse_dclr		 ),
  .spc_efu_fuse_dxfer_en    (spc0_efu_fuse_dxfer_en	 ),
  .spc_efu_fuse_ixfer_en    (spc0_efu_fuse_ixfer_en	 ),
  .spc_efu_fuse_ddata	    (spc0_efu_fuse_ddata	 ),
  .spc_efu_fuse_idata	    (spc0_efu_fuse_idata	 ),
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c3t0 ),	// gl_io_cmp_sync_en_c3t  - for int6.1
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c3t0 ),	// gl_cmp_io_sync_en_c3t  - for int6.1
  .hver_mask_minor_rev	    (spc_revid_out[ 3 : 0 ]        ),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .rst_wmr_protect(rst_wmr_protect),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .ncu_cmp_tick_enable(ncu_cmp_tick_enable),
  .ncu_wmr_vec_mask(ncu_wmr_vec_mask),
  .ncu_spc_pm(ncu_spc_pm),
  .ncu_spc_ba01(ncu_spc_ba01),
  .ncu_spc_ba23(ncu_spc_ba23),
  .ncu_spc_ba45(ncu_spc_ba45),
  .ncu_spc_ba67(ncu_spc_ba67),
  .tcu_spc_lbist_pgm(tcu_spc_lbist_pgm),
  .tcu_spc_test_mode(tcu_spc0_test_mode),
  .dmo_icmuxctl(dmo_icmuxctl),
  .dmo_dcmuxctl(dmo_dcmuxctl),
  .tcu_atpg_mode(tcu_atpg_mode),
  .ncu_spc_l2_idx_hash_en(ncu_spc_l2_idx_hash_en)
            );
`else
`ifndef CMP
assign spc0_pcx_req_pq[8:0] = 9'bz;
assign spc0_pcx_atm_pq[8:0] = 9'bz;
assign spc0_pcx_data_pa[129:0] = 130'bz;
assign spc0_tcu_scan_in[1:0] = 2'b0;
assign spc0_ncu_core_running_status[7:0] = 8'b0;
assign spc0_tcu_shscan_scan_in = 1'b0;
assign spc0_tcu_mbist_done = 1'b0;
assign spc0_tcu_mbist_fail = 1'b0;
assign spc0_tcu_mbist_scan_out = 1'b0;
assign spc0_dmo_dout  = 36'b0;
assign spc0_tcu_lbist_done = 1'b0;
assign spc0_tcu_lbist_scan_out = 1'b0;
assign spc0_hardstop_request = 1'b0;
assign spc0_softstop_request = 1'b0;
assign spc0_trigger_pulse = 1'b0;
assign spc0_ss_complete = 1'b0;
assign spc0_dbg0_instr_cmt_grp0[1:0] = 2'b0;
assign spc0_dbg0_instr_cmt_grp1[1:0] = 2'b0;
assign spc0_efu_fuse_ddata =1'b0;
assign spc0_efu_fuse_dxfer_en =1'b0;
assign spc0_efu_fuse_idata =1'b0;
assign spc0_efu_fuse_ixfer_en =1'b0;
`endif
`endif


//________________________________________________________________


`ifndef RTL_NO_SPC1
spc spc1(
  .vnw_ary0                 (SPC_VNW[ 1 ]),
  .vnw_ary1                 (SPC_VNW[ 1 ]),
  .gclk                      	  ( cmp_gclk_c2_spc1 ), // cmp_gclk_c1_r[1]) , 
  .tcu_clk_stop ( gl_spc1_clk_stop ),	// staged clk_stop

  .cpx_spc_data_cx          (cpx_spc1_data_cx2[ 145 : 0 ]    ),// sparc core
  .pcx_spc_grant_px         (pcx_spc1_grant_px[ 8 : 0 ]      ),
  .spc_pcx_req_pq           (spc1_pcx_req_pq[ 8 : 0 ]        ),
  .spc_pcx_atm_pq           (spc1_pcx_atm_pq[ 8 : 0 ]        ),
  .spc_pcx_data_pa          (spc1_pcx_data_pa[ 129 : 0 ]     ),
  .spc_hardstop_request     (spc1_hardstop_request),
  .spc_softstop_request     (spc1_softstop_request),
  .spc_trigger_pulse        (spc1_trigger_pulse),
  .tcu_ss_mode              (tcu_ss_mode[ 1 ]),
  .tcu_do_mode              (tcu_do_mode[ 1 ]),
  .tcu_ss_request           (tcu_ss_request[ 1 ]),
  .spc_ss_complete          (spc1_ss_complete),
  .tcu_aclk                 (tcu_spc1_aclk               ),
  .tcu_bclk                 (tcu_spc1_bclk               ),
  .tcu_scan_en              (tcu_spc1_scan_en            ),
  .tcu_se_scancollar_in     (tcu_spc1_se_scancollar_in   ),
  .tcu_se_scancollar_out    (tcu_spc1_se_scancollar_out  ),
  .tcu_array_wr_inhibit     (tcu_spc1_array_wr_inhibit   ),
  .tcu_core_running         (ncu_spc1_core_running[ 7 : 0 ]  ),
  .spc_core_running_status  (spc1_ncu_core_running_status[ 7 : 0 ]),
  .const_cpuid              ({1'b0, 1'b0, 1'b1}          ),//No 3'b101 to Astro.
  .power_throttle           (mio_spc_pwr_throttle_0[ 2 : 0 ]),
  .scan_out                 (spc1_tcu_scan_in[ 1 : 0 ]       ),
  .scan_in                  (tcu_spc1_scan_out[ 1 : 0 ]      ),
  .spc_dbg_instr_cmt_grp0   (spc1_dbg1_instr_cmt_grp0[ 1 : 0 ]),
  .spc_dbg_instr_cmt_grp1   (spc1_dbg1_instr_cmt_grp1[ 1 : 0 ]),
  .tcu_spc_mbist_start      (tcu_spc_mbist_start[ 1 ]    ),
  .spc_mbist_done           (spc1_tcu_mbist_done    ),
  .spc_mbist_fail           (spc1_tcu_mbist_fail    ),
  .tcu_spc_mbist_scan_in    (tcu_spc1_mbist_scan_in      ),
  .spc_tcu_mbist_scan_out   (spc1_tcu_mbist_scan_out     ),
  .dmo_din                  (spc0_dmo_dout[ 35 : 0 ]         ),
  .dmo_dout                 (spc1_dmo_dout[ 35 : 0 ]         ),
  .dmo_coresel              (dmo_coresel[ 5 ]              ),
  .tcu_spc_lbist_start      (tcu_spc_lbist_start[ 1 ]      ),
  .tcu_spc_lbist_scan_in    (tcu_spc_lbist_scan_in[ 1 ]    ),
  .spc_tcu_lbist_done       (spc1_tcu_lbist_done         ),
  .spc_tcu_lbist_scan_out   (spc1_tcu_lbist_scan_out     ),
  .tcu_shscan_pce_ov	    (tcu_spc_shscan_pce_ov	 ),
  .tcu_shscan_aclk          (tcu_spc_shscan_aclk	 ),
  .tcu_shscan_bclk          (tcu_spc_shscan_bclk         ),
  .tcu_shscan_scan_en       (tcu_spc_shscan_scan_en      ),
  .tcu_shscanid             (tcu_spc_shscanid[ 2 : 0 ]       ),
  .tcu_shscan_scan_in       (tcu_spc1_shscan_scan_out    ),
  .spc_shscan_scan_out      (spc1_tcu_shscan_scan_in     ),
  .tcu_shscan_clk_stop      (tcu_spc1_shscan_clk_stop    ),
  .efu_spc_fuse_data        (efu_spc1357_fuse_data       ),
  .efu_spc_fuse_ixfer_en    (efu_spc1_fuse_ixfer_en      ),
  .efu_spc_fuse_iclr        (efu_spc1_fuse_iclr          ),
  .efu_spc_fuse_dxfer_en    (efu_spc1_fuse_dxfer_en      ),
  .efu_spc_fuse_dclr        (efu_spc1_fuse_dclr          ),
  .spc_efu_fuse_dxfer_en    (spc1_efu_fuse_dxfer_en      ),
  .spc_efu_fuse_ixfer_en    (spc1_efu_fuse_ixfer_en      ),
  .spc_efu_fuse_ddata       (spc1_efu_fuse_ddata         ),
  .spc_efu_fuse_idata       (spc1_efu_fuse_idata         ),
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c2t ), 
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c2t ),
  .hver_mask_minor_rev      (spc_revid_out[ 3 : 0 ]          ),
  .tcu_spc_test_mode        (tcu_spc1_test_mode),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_atpg_mode(tcu_atpg_mode),
  .rst_wmr_protect(rst_wmr_protect),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .ncu_cmp_tick_enable(ncu_cmp_tick_enable),
  .ncu_wmr_vec_mask(ncu_wmr_vec_mask),
  .ncu_spc_pm(ncu_spc_pm),
  .ncu_spc_ba01(ncu_spc_ba01),
  .ncu_spc_ba23(ncu_spc_ba23),
  .ncu_spc_ba45(ncu_spc_ba45),
  .ncu_spc_ba67(ncu_spc_ba67),
  .tcu_spc_lbist_pgm(tcu_spc_lbist_pgm),
  .dmo_icmuxctl(dmo_icmuxctl),
  .dmo_dcmuxctl(dmo_dcmuxctl),
  .ncu_spc_l2_idx_hash_en(ncu_spc_l2_idx_hash_en)
            );
`else
`ifndef CMP
assign spc1_pcx_req_pq[8:0] = 9'bz;
assign spc1_pcx_atm_pq[8:0] = 9'bz;
assign spc1_pcx_data_pa[129:0] = 130'bz;
assign spc1_tcu_scan_in[1:0] = 2'b0;
assign spc1_ncu_core_running_status[7:0] = 8'b0;
assign spc1_tcu_shscan_scan_in = 1'b0;
assign spc1_tcu_mbist_done = 1'b0;
assign spc1_tcu_mbist_fail = 1'b0;
assign spc1_tcu_mbist_scan_out = 1'b0;
assign spc1_dmo_dout = 36'b0;
assign spc1_tcu_lbist_done = 1'b0;
assign spc1_tcu_lbist_scan_out = 1'b0;
assign spc1_hardstop_request = 1'b0;
assign spc1_softstop_request = 1'b0;
assign spc1_trigger_pulse = 1'b0;
assign spc1_ss_complete = 1'b0;
assign spc1_dbg1_instr_cmt_grp0[1:0] = 2'b0;
assign spc1_dbg1_instr_cmt_grp1[1:0] = 2'b0;
assign spc1_efu_fuse_ddata =1'b0;
assign spc1_efu_fuse_dxfer_en =1'b0;
assign spc1_efu_fuse_idata =1'b0;
assign spc1_efu_fuse_ixfer_en =1'b0;
`endif
`endif


//________________________________________________________________



`ifndef RTL_NO_SPC2
spc spc2(
  .vnw_ary0                 (SPC_VNW[ 2 ]),
  .vnw_ary1                 (SPC_VNW[ 2 ]),
  .gclk                      	  ( cmp_gclk_c3_spc2 ), // cmp_gclk_c1_r[6]) , 
  .tcu_clk_stop ( gl_spc2_clk_stop ),	// staged clk_stop

  .cpx_spc_data_cx          (cpx_spc2_data_cx2[ 145 : 0 ]    ),// sparc core
  .pcx_spc_grant_px         (pcx_spc2_grant_px[ 8 : 0 ]      ),
  .spc_pcx_req_pq           (spc2_pcx_req_pq[ 8 : 0 ]        ),
  .spc_pcx_atm_pq           (spc2_pcx_atm_pq[ 8 : 0 ]        ),
  .spc_pcx_data_pa          (spc2_pcx_data_pa[ 129 : 0 ]     ),
  .spc_hardstop_request     (spc2_hardstop_request),
  .spc_softstop_request     (spc2_softstop_request),
  .spc_trigger_pulse        (spc2_trigger_pulse),
  .tcu_ss_mode              (tcu_ss_mode[ 2 ]),
  .tcu_do_mode              (tcu_do_mode[ 2 ]),
  .tcu_ss_request           (tcu_ss_request_t3lff_2),
  .spc_ss_complete          (spc2_ss_complete),
  .tcu_aclk                 (tcu_spc2_aclk               ),
  .tcu_bclk                 (tcu_spc2_bclk               ),
  .tcu_scan_en              (tcu_spc2_scan_en            ),
  .tcu_se_scancollar_in     (tcu_spc2_se_scancollar_in   ),
  .tcu_se_scancollar_out    (tcu_spc2_se_scancollar_out  ),
  .tcu_array_wr_inhibit     (tcu_spc2_array_wr_inhibit   ),
  .tcu_core_running         (ncu_spc2_core_running[ 7 : 0 ]  ),
  .spc_core_running_status  (spc2_ncu_core_running_status[ 7 : 0 ]),
  .const_cpuid              ({1'b0, 1'b1, 1'b0}          ),//No 3'b101 to Astro.
  .power_throttle           (mio_spc_pwr_throttle_1[ 2 : 0 ]),
  .scan_out                 (spc2_tcu_scan_in[ 1 : 0 ]       ),
  .scan_in                  (tcu_spc2_scan_out[ 1 : 0 ]      ),
  .spc_dbg_instr_cmt_grp0   (spc2_dbg0_instr_cmt_grp0[ 1 : 0 ]),
  .spc_dbg_instr_cmt_grp1   (spc2_dbg0_instr_cmt_grp1[ 1 : 0 ]),
  .tcu_spc_mbist_start      (tcu_spc_mbist_start_t3lff_2 ),
  .spc_mbist_done           (spc2_tcu_mbist_done    ),
  .spc_mbist_fail           (spc2_tcu_mbist_fail    ),
  .tcu_spc_mbist_scan_in    (tcu_spc2_mbist_scan_in      ),
  .spc_tcu_mbist_scan_out   (spc2_tcu_mbist_scan_out     ),
  .dmo_din                  (36'b0                       ),
  .dmo_dout                 (spc2_dmo_dout[ 35 : 0 ]         ),
  .dmo_coresel              (1'b0                        ),
  .tcu_spc_lbist_start      (tcu_spc_lbist_start[ 2 ]      ),
  .tcu_spc_lbist_scan_in    (tcu_spc_lbist_scan_in[ 2 ]    ),
  .spc_tcu_lbist_done       (spc2_tcu_lbist_done         ),
  .spc_tcu_lbist_scan_out   (spc2_tcu_lbist_scan_out     ),
  .tcu_shscan_pce_ov	    (tcu_spc_shscan_pce_ov	 ),
  .tcu_shscan_aclk          (tcu_spc_shscan_aclk	 ),
  .tcu_shscan_bclk          (tcu_spc_shscan_bclk         ),
  .tcu_shscan_scan_en       (tcu_spc_shscan_scan_en      ),
  .tcu_shscanid             (tcu_spc_shscanid[ 2 : 0 ]       ),
  .tcu_shscan_scan_in       (tcu_spc2_shscan_scan_out    ),
  .spc_shscan_scan_out      (spc2_tcu_shscan_scan_in     ),
  .tcu_shscan_clk_stop      (tcu_spc2_shscan_clk_stop    ),
  .efu_spc_fuse_data        (efu_spc0246_fuse_data       ),
  .efu_spc_fuse_ixfer_en    (efu_spc2_fuse_ixfer_en      ),
  .efu_spc_fuse_iclr        (efu_spc2_fuse_iclr          ),
  .efu_spc_fuse_dxfer_en    (efu_spc2_fuse_dxfer_en      ),
  .efu_spc_fuse_dclr        (efu_spc2_fuse_dclr          ),
  .spc_efu_fuse_dxfer_en    (spc2_efu_fuse_dxfer_en      ),
  .spc_efu_fuse_ixfer_en    (spc2_efu_fuse_ixfer_en      ),
  .spc_efu_fuse_ddata       (spc2_efu_fuse_ddata         ),
  .spc_efu_fuse_idata       (spc2_efu_fuse_idata         ),
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c3b ), 
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c3b ),
  .hver_mask_minor_rev      (spc_revid_out[ 3 : 0 ]          ),
  .tcu_spc_test_mode        (tcu_spc2_test_mode),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_atpg_mode(tcu_atpg_mode),
  .rst_wmr_protect(rst_wmr_protect),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .ncu_cmp_tick_enable(ncu_cmp_tick_enable),
  .ncu_wmr_vec_mask(ncu_wmr_vec_mask),
  .ncu_spc_pm(ncu_spc_pm),
  .ncu_spc_ba01(ncu_spc_ba01),
  .ncu_spc_ba23(ncu_spc_ba23),
  .ncu_spc_ba45(ncu_spc_ba45),
  .ncu_spc_ba67(ncu_spc_ba67),
  .tcu_spc_lbist_pgm(tcu_spc_lbist_pgm),
  .dmo_icmuxctl(dmo_icmuxctl),
  .dmo_dcmuxctl(dmo_dcmuxctl),
  .ncu_spc_l2_idx_hash_en(ncu_spc_l2_idx_hash_en)
         );
`else
`ifndef CMP
assign spc2_pcx_req_pq[8:0] = 9'bz;
assign spc2_pcx_atm_pq[8:0] = 9'bz;
assign spc2_pcx_data_pa[129:0] = 130'bz;
assign spc2_tcu_scan_in[1:0] = 2'b0;
assign spc2_ncu_core_running_status[7:0] = 8'b0;
assign spc2_tcu_shscan_scan_in = 1'b0;
assign spc2_tcu_mbist_done = 1'b0;
assign spc2_tcu_mbist_fail = 1'b0;
assign spc2_tcu_mbist_scan_out = 1'b0;
assign spc2_dmo_dout = 36'b0;
assign spc2_tcu_lbist_done = 1'b0;
assign spc2_tcu_lbist_scan_out = 1'b0;
assign spc2_hardstop_request = 1'b0;
assign spc2_softstop_request = 1'b0;
assign spc2_trigger_pulse = 1'b0;
assign spc2_ss_complete = 1'b0;
assign spc2_dbg0_instr_cmt_grp0[1:0] = 2'b0;
assign spc2_dbg0_instr_cmt_grp1[1:0] = 2'b0;
assign spc2_efu_fuse_ddata =1'b0;
assign spc2_efu_fuse_dxfer_en =1'b0;
assign spc2_efu_fuse_idata =1'b0;
assign spc2_efu_fuse_ixfer_en =1'b0;
`endif
`endif


//________________________________________________________________


`ifndef RTL_NO_SPC3
spc spc3(
  .vnw_ary0                 (SPC_VNW[ 3 ]),
  .vnw_ary1                 (SPC_VNW[ 3 ]),
  .gclk                      	  ( cmp_gclk_c2_spc3 ), // cmp_gclk_c1_r[6]) , 
  .tcu_clk_stop ( gl_spc3_clk_stop ),	// staged clk_stop

  .cpx_spc_data_cx          (cpx_spc3_data_cx2[ 145 : 0 ]    ),// sparc core
  .pcx_spc_grant_px         (pcx_spc3_grant_px[ 8 : 0 ]      ),
  .spc_pcx_req_pq           (spc3_pcx_req_pq[ 8 : 0 ]        ),
  .spc_pcx_atm_pq           (spc3_pcx_atm_pq[ 8 : 0 ]        ),
  .spc_pcx_data_pa          (spc3_pcx_data_pa[ 129 : 0 ]     ),
  .spc_hardstop_request     (spc3_hardstop_request),
  .spc_softstop_request     (spc3_softstop_request),
  .spc_trigger_pulse        (spc3_trigger_pulse),
  .tcu_ss_mode              (tcu_ss_mode[ 3 ]),
  .tcu_do_mode              (tcu_do_mode[ 3 ]),
  .tcu_ss_request           (tcu_ss_request[ 3 ]),
  .spc_ss_complete          (spc3_ss_complete),
  .tcu_aclk                 (tcu_spc3_aclk               ),
  .tcu_bclk                 (tcu_spc3_bclk               ),
  .tcu_scan_en              (tcu_spc3_scan_en            ),
  .tcu_se_scancollar_in     (tcu_spc3_se_scancollar_in   ),
  .tcu_se_scancollar_out    (tcu_spc3_se_scancollar_out  ),
  .tcu_array_wr_inhibit     (tcu_spc3_array_wr_inhibit   ),
  .tcu_core_running         (ncu_spc3_core_running[ 7 : 0 ]  ),
  .spc_core_running_status  (spc3_ncu_core_running_status[ 7 : 0 ]),
  .const_cpuid              ({1'b0, 1'b1, 1'b1}          ),//No 3'b101 to Astro.
  .power_throttle           (mio_spc_pwr_throttle_1[ 2 : 0 ]),
  .scan_out                 (spc3_tcu_scan_in[ 1 : 0 ]       ),
  .scan_in                  (tcu_spc3_scan_out[ 1 : 0 ]      ),
  .spc_dbg_instr_cmt_grp0   (spc3_dbg1_instr_cmt_grp0[ 1 : 0 ]),
  .spc_dbg_instr_cmt_grp1   (spc3_dbg1_instr_cmt_grp1[ 1 : 0 ]),
  .tcu_spc_mbist_start      (tcu_spc_mbist_start[ 3 ]   ),
  .spc_mbist_done           (spc3_tcu_mbist_done    ),
  .spc_mbist_fail           (spc3_tcu_mbist_fail    ),
  .tcu_spc_mbist_scan_in    (tcu_spc3_mbist_scan_in      ),
  .spc_tcu_mbist_scan_out   (spc3_tcu_mbist_scan_out     ),
  .dmo_din                  (spc2_dmo_dout[ 35 : 0 ]         ),
  .dmo_dout                 (spc3_dmo_dout[ 35 : 0 ]         ),
  .dmo_coresel              (dmo_coresel[ 2 ]              ),
  .tcu_spc_lbist_start      (tcu_spc_lbist_start[ 3 ]      ),
  .tcu_spc_lbist_scan_in    (tcu_spc_lbist_scan_in[ 3 ]    ),
  .spc_tcu_lbist_done       (spc3_tcu_lbist_done         ),
  .spc_tcu_lbist_scan_out   (spc3_tcu_lbist_scan_out     ),
  .tcu_shscan_pce_ov	    (tcu_spc_shscan_pce_ov	 ),
  .tcu_shscan_aclk          (tcu_spc_shscan_aclk	 ),
  .tcu_shscan_bclk          (tcu_spc_shscan_bclk         ),
  .tcu_shscan_scan_en       (tcu_spc_shscan_scan_en      ),
  .tcu_shscanid             (tcu_spc_shscanid[ 2 : 0 ]       ),
  .tcu_shscan_scan_in       (tcu_spc3_shscan_scan_out    ),
  .spc_shscan_scan_out      (spc3_tcu_shscan_scan_in     ),
  .tcu_shscan_clk_stop      (tcu_spc3_shscan_clk_stop    ),
  .efu_spc_fuse_data        (efu_spc1357_fuse_data       ),
  .efu_spc_fuse_ixfer_en    (efu_spc3_fuse_ixfer_en      ),
  .efu_spc_fuse_iclr        (efu_spc3_fuse_iclr          ),
  .efu_spc_fuse_dxfer_en    (efu_spc3_fuse_dxfer_en      ),
  .efu_spc_fuse_dclr        (efu_spc3_fuse_dclr          ),
  .spc_efu_fuse_dxfer_en    (spc3_efu_fuse_dxfer_en      ),
  .spc_efu_fuse_ixfer_en    (spc3_efu_fuse_ixfer_en      ),
  .spc_efu_fuse_ddata       (spc3_efu_fuse_ddata         ),
  .spc_efu_fuse_idata       (spc3_efu_fuse_idata         ),
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c2b ), 
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c2b ),
  .hver_mask_minor_rev      (spc_revid_out[ 3 : 0 ]          ),
  .tcu_spc_test_mode        (tcu_spc3_test_mode),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_atpg_mode(tcu_atpg_mode),
  .rst_wmr_protect(rst_wmr_protect),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .ncu_cmp_tick_enable(ncu_cmp_tick_enable),
  .ncu_wmr_vec_mask(ncu_wmr_vec_mask),
  .ncu_spc_pm(ncu_spc_pm),
  .ncu_spc_ba01(ncu_spc_ba01),
  .ncu_spc_ba23(ncu_spc_ba23),
  .ncu_spc_ba45(ncu_spc_ba45),
  .ncu_spc_ba67(ncu_spc_ba67),
  .tcu_spc_lbist_pgm(tcu_spc_lbist_pgm),
  .dmo_icmuxctl(dmo_icmuxctl),
  .dmo_dcmuxctl(dmo_dcmuxctl),
  .ncu_spc_l2_idx_hash_en(ncu_spc_l2_idx_hash_en)
            );
`else
`ifndef CMP
assign spc3_pcx_req_pq[8:0] = 9'bz;
assign spc3_pcx_atm_pq[8:0] = 9'bz;
assign spc3_pcx_data_pa[129:0] = 130'bz;
assign spc3_tcu_scan_in[1:0] = 2'b0;
assign spc3_ncu_core_running_status[7:0] = 8'b0;
assign spc3_tcu_shscan_scan_in = 1'b0;
assign spc3_tcu_mbist_done = 1'b0;
assign spc3_tcu_mbist_fail = 1'b0;
assign spc3_tcu_mbist_scan_out = 1'b0;
assign spc3_dmo_dout = 36'b0;
assign spc3_tcu_lbist_done = 1'b0;
assign spc3_tcu_lbist_scan_out = 1'b0;
assign spc3_hardstop_request = 1'b0;
assign spc3_softstop_request = 1'b0;
assign spc3_trigger_pulse = 1'b0;
assign spc3_ss_complete = 1'b0;
assign spc3_dbg1_instr_cmt_grp0[1:0] = 2'b0;
assign spc3_dbg1_instr_cmt_grp1[1:0] = 2'b0;
assign spc3_efu_fuse_ddata =1'b0;
assign spc3_efu_fuse_dxfer_en =1'b0;
assign spc3_efu_fuse_idata =1'b0;
assign spc3_efu_fuse_ixfer_en =1'b0;
`endif
`endif


//________________________________________________________________


`ifndef RTL_NO_SPC4
spc spc4(
  .vnw_ary0                 (SPC_VNW[ 4 ]),
  .vnw_ary1                 (SPC_VNW[ 4 ]),
  .gclk                      	  ( cmp_gclk_c1_spc4 ), // cmp_gclk_c2_r[1]) , 
  .tcu_clk_stop ( gl_spc4_clk_stop ),	// staged clk_stop
  .cpx_spc_data_cx          (cpx_spc4_data_cx2[ 145 : 0 ]    ),// sparc core
  .pcx_spc_grant_px         (pcx_spc4_grant_px[ 8 : 0 ]      ),
  .spc_pcx_req_pq           (spc4_pcx_req_pq[ 8 : 0 ]        ),
  .spc_pcx_atm_pq           (spc4_pcx_atm_pq[ 8 : 0 ]        ),
  .spc_pcx_data_pa          (spc4_pcx_data_pa[ 129 : 0 ]     ),
  .spc_hardstop_request     (spc4_hardstop_request),
  .spc_softstop_request     (spc4_softstop_request),
  .spc_trigger_pulse        (spc4_trigger_pulse),
  .tcu_ss_mode              (tcu_ss_mode[ 4 ]),
  .tcu_do_mode              (tcu_do_mode[ 4 ]),
  .tcu_ss_request           (tcu_ss_request[ 4 ]),
  .spc_ss_complete          (spc4_ss_complete),
  .tcu_aclk                 (tcu_spc4_aclk               ),
  .tcu_bclk                 (tcu_spc4_bclk               ),
  .tcu_scan_en              (tcu_spc4_scan_en            ),
  .tcu_se_scancollar_in     (tcu_spc4_se_scancollar_in   ),
  .tcu_se_scancollar_out    (tcu_spc4_se_scancollar_out  ),
  .tcu_array_wr_inhibit     (tcu_spc4_array_wr_inhibit   ),
  .tcu_core_running         (ncu_spc4_core_running[ 7 : 0 ]  ),
  .spc_core_running_status  (spc4_ncu_core_running_status[ 7 : 0 ]),
  .const_cpuid              ({1'b1, 1'b0, 1'b0}          ),//No 3'b101 to Astro.
  .power_throttle           (mio_spc_pwr_throttle_0[ 2 : 0 ]),
  .scan_out                 (spc4_tcu_scan_in[ 1 : 0 ]       ),
  .scan_in                  (tcu_spc4_scan_out[ 1 : 0 ]      ),
  .spc_dbg_instr_cmt_grp0   (spc4_dbg1_instr_cmt_grp0[ 1 : 0 ]),
  .spc_dbg_instr_cmt_grp1   (spc4_dbg1_instr_cmt_grp1[ 1 : 0 ]),
  .tcu_spc_mbist_start      (tcu_spc_mbist_start[ 4 ]  ),
  .spc_mbist_done           (spc4_tcu_mbist_done    ),
  .spc_mbist_fail           (spc4_tcu_mbist_fail    ),
  .tcu_spc_mbist_scan_in    (tcu_spc4_mbist_scan_in      ),
  .spc_tcu_mbist_scan_out   (spc4_tcu_mbist_scan_out     ),
  .dmo_din                  (spc5_dmo_dout[ 35 : 0 ]         ),
  .dmo_dout                 (spc4_dmo_dout[ 35 : 0 ]         ),
  .dmo_coresel              (dmo_coresel[ 3 ]              ),
  .tcu_spc_lbist_start      (tcu_spc_lbist_start[ 4 ]      ),
  .tcu_spc_lbist_scan_in    (tcu_spc_lbist_scan_in[ 4 ]    ),
  .spc_tcu_lbist_done       (spc4_tcu_lbist_done         ),
  .spc_tcu_lbist_scan_out   (spc4_tcu_lbist_scan_out     ),
  .tcu_shscan_pce_ov	    (tcu_spc_shscan_pce_ov	 ),
  .tcu_shscan_aclk          (tcu_spc_shscan_aclk	 ),
  .tcu_shscan_bclk          (tcu_spc_shscan_bclk         ),
  .tcu_shscan_scan_en       (tcu_spc_shscan_scan_en      ),
  .tcu_shscanid             (tcu_spc_shscanid[ 2 : 0 ]       ),
  .tcu_shscan_scan_in       (tcu_spc4_shscan_scan_out    ),
  .spc_shscan_scan_out      (spc4_tcu_shscan_scan_in     ),
  .tcu_shscan_clk_stop      (tcu_spc4_shscan_clk_stop    ),
  .efu_spc_fuse_data        (efu_spc0246_fuse_data       ),
  .efu_spc_fuse_ixfer_en    (efu_spc4_fuse_ixfer_en      ),
  .efu_spc_fuse_iclr        (efu_spc4_fuse_iclr          ),
  .efu_spc_fuse_dxfer_en    (efu_spc4_fuse_dxfer_en      ),
  .efu_spc_fuse_dclr        (efu_spc4_fuse_dclr          ),
  .spc_efu_fuse_dxfer_en    (spc4_efu_fuse_dxfer_en      ),
  .spc_efu_fuse_ixfer_en    (spc4_efu_fuse_ixfer_en      ),
  .spc_efu_fuse_ddata       (spc4_efu_fuse_ddata         ),
  .spc_efu_fuse_idata       (spc4_efu_fuse_idata         ),
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c1t ), 
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c1t ),
  .hver_mask_minor_rev      (spc_revid_out[ 3 : 0 ]          ),
  .tcu_spc_test_mode        (tcu_spc4_test_mode),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_atpg_mode(tcu_atpg_mode),
  .rst_wmr_protect(rst_wmr_protect),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .ncu_cmp_tick_enable(ncu_cmp_tick_enable),
  .ncu_wmr_vec_mask(ncu_wmr_vec_mask),
  .ncu_spc_pm(ncu_spc_pm),
  .ncu_spc_ba01(ncu_spc_ba01),
  .ncu_spc_ba23(ncu_spc_ba23),
  .ncu_spc_ba45(ncu_spc_ba45),
  .ncu_spc_ba67(ncu_spc_ba67),
  .tcu_spc_lbist_pgm(tcu_spc_lbist_pgm),
  .dmo_icmuxctl(dmo_icmuxctl),
  .dmo_dcmuxctl(dmo_dcmuxctl),
  .ncu_spc_l2_idx_hash_en(ncu_spc_l2_idx_hash_en)
        );
`else
`ifndef CMP
assign spc4_pcx_req_pq[8:0] = 9'bz;
assign spc4_pcx_atm_pq[8:0] = 9'bz;
assign spc4_pcx_data_pa[129:0] = 130'bz;
assign spc4_tcu_scan_in[1:0] = 2'b0;
assign spc4_ncu_core_running_status[7:0] = 8'b0;
assign spc4_tcu_shscan_scan_in = 1'b0;
assign spc4_tcu_mbist_done = 1'b0;
assign spc4_tcu_mbist_fail = 1'b0;
assign spc4_tcu_mbist_scan_out = 1'b0;
assign spc4_dmo_dout = 36'b0;
assign spc4_tcu_lbist_done = 1'b0;
assign spc4_tcu_lbist_scan_out = 1'b0;
assign spc4_hardstop_request = 1'b0;
assign spc4_softstop_request = 1'b0;
assign spc4_trigger_pulse = 1'b0;
assign spc4_ss_complete = 1'b0;
assign spc4_dbg1_instr_cmt_grp0[1:0] = 2'b0;
assign spc4_dbg1_instr_cmt_grp1[1:0] = 2'b0;
assign spc4_efu_fuse_ddata =1'b0;
assign spc4_efu_fuse_dxfer_en =1'b0;
assign spc4_efu_fuse_idata =1'b0;
assign spc4_efu_fuse_ixfer_en =1'b0;
`endif
`endif


//________________________________________________________________


`ifndef RTL_NO_SPC5
spc spc5(
  .vnw_ary0                 (SPC_VNW[ 5 ]),
  .vnw_ary1                 (SPC_VNW[ 5 ]),
  .gclk                      	  ( cmp_gclk_c2_spc5 ), // cmp_gclk_c2_r[1]) , 
  .tcu_clk_stop ( gl_spc5_clk_stop ),	// staged clk_stop

  .cpx_spc_data_cx          (cpx_spc5_data_cx2[ 145 : 0 ]    ),// sparc core
  .pcx_spc_grant_px         (pcx_spc5_grant_px[ 8 : 0 ]      ),
  .spc_pcx_req_pq           (spc5_pcx_req_pq[ 8 : 0 ]        ),
  .spc_pcx_atm_pq           (spc5_pcx_atm_pq[ 8 : 0 ]        ),
  .spc_pcx_data_pa          (spc5_pcx_data_pa[ 129 : 0 ]     ),
  .spc_hardstop_request     (spc5_hardstop_request),
  .spc_softstop_request     (spc5_softstop_request),
  .spc_trigger_pulse        (spc5_trigger_pulse),
  .tcu_ss_mode              (tcu_ss_mode[ 5 ]),
  .tcu_do_mode              (tcu_do_mode[ 5 ]),
  .tcu_ss_request           (tcu_ss_request[ 5 ]),
  .spc_ss_complete          (spc5_ss_complete),
  .tcu_aclk                 (tcu_spc5_aclk               ),
  .tcu_bclk                 (tcu_spc5_bclk               ),
  .tcu_scan_en              (tcu_spc5_scan_en            ),
  .tcu_se_scancollar_in     (tcu_spc5_se_scancollar_in   ),
  .tcu_se_scancollar_out    (tcu_spc5_se_scancollar_out  ),
  .tcu_array_wr_inhibit     (tcu_spc5_array_wr_inhibit   ),
  .tcu_core_running         (ncu_spc5_core_running[ 7 : 0 ]  ),
  .spc_core_running_status  (spc5_ncu_core_running_status[ 7 : 0 ]),
  .const_cpuid              ({1'b1, 1'b0, 1'b1}          ),//No 3'b101 to Astro.
  .power_throttle           (mio_spc_pwr_throttle_0[ 2 : 0 ]),
  .scan_out                 (spc5_tcu_scan_in[ 1 : 0 ]       ),
  .scan_in                  (tcu_spc5_scan_out[ 1 : 0 ]      ),
  .spc_dbg_instr_cmt_grp0   (spc5_dbg1_instr_cmt_grp0[ 1 : 0 ]),
  .spc_dbg_instr_cmt_grp1   (spc5_dbg1_instr_cmt_grp1[ 1 : 0 ]),
  .tcu_spc_mbist_start      (tcu_spc_mbist_start[ 5 ]  ),
  .spc_mbist_done           (spc5_tcu_mbist_done    ),
  .spc_mbist_fail           (spc5_tcu_mbist_fail    ),
  .tcu_spc_mbist_scan_in    (tcu_spc5_mbist_scan_in      ),
  .spc_tcu_mbist_scan_out   (spc5_tcu_mbist_scan_out     ),
  .dmo_din                  (spc1_dmo_dout[ 35 : 0 ]         ),
  .dmo_dout                 (spc5_dmo_dout[ 35 : 0 ]         ),
  .dmo_coresel              (dmo_coresel[ 4 ]              ),
  .tcu_spc_lbist_start      (tcu_spc_lbist_start[ 5 ]      ),
  .tcu_spc_lbist_scan_in    (tcu_spc_lbist_scan_in[ 5 ]    ),
  .spc_tcu_lbist_done       (spc5_tcu_lbist_done         ),
  .spc_tcu_lbist_scan_out   (spc5_tcu_lbist_scan_out     ),
  .tcu_shscan_pce_ov	    (tcu_spc_shscan_pce_ov	 ),
  .tcu_shscan_aclk          (tcu_spc_shscan_aclk	 ),
  .tcu_shscan_bclk          (tcu_spc_shscan_bclk         ),
  .tcu_shscan_scan_en       (tcu_spc_shscan_scan_en      ),
  .tcu_shscanid             (tcu_spc_shscanid[ 2 : 0 ]       ),
  .tcu_shscan_scan_in       (tcu_spc5_shscan_scan_out    ),
  .spc_shscan_scan_out      (spc5_tcu_shscan_scan_in     ),
  .tcu_shscan_clk_stop      (tcu_spc5_shscan_clk_stop    ),
  .efu_spc_fuse_data        (efu_spc1357_fuse_data       ),
  .efu_spc_fuse_ixfer_en    (efu_spc5_fuse_ixfer_en      ),
  .efu_spc_fuse_iclr        (efu_spc5_fuse_iclr          ),
  .efu_spc_fuse_dxfer_en    (efu_spc5_fuse_dxfer_en      ),
  .efu_spc_fuse_dclr        (efu_spc5_fuse_dclr          ),
  .spc_efu_fuse_dxfer_en    (spc5_efu_fuse_dxfer_en      ),
  .spc_efu_fuse_ixfer_en    (spc5_efu_fuse_ixfer_en      ),
  .spc_efu_fuse_ddata       (spc5_efu_fuse_ddata         ),
  .spc_efu_fuse_idata       (spc5_efu_fuse_idata         ),
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c2t ), 
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c2t ),
  .hver_mask_minor_rev      (spc_revid_out[ 3 : 0 ]          ),
  .tcu_spc_test_mode        (tcu_spc5_test_mode),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_atpg_mode(tcu_atpg_mode),
  .rst_wmr_protect(rst_wmr_protect),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .ncu_cmp_tick_enable(ncu_cmp_tick_enable),
  .ncu_wmr_vec_mask(ncu_wmr_vec_mask),
  .ncu_spc_pm(ncu_spc_pm),
  .ncu_spc_ba01(ncu_spc_ba01),
  .ncu_spc_ba23(ncu_spc_ba23),
  .ncu_spc_ba45(ncu_spc_ba45),
  .ncu_spc_ba67(ncu_spc_ba67),
  .tcu_spc_lbist_pgm(tcu_spc_lbist_pgm),
  .dmo_icmuxctl(dmo_icmuxctl),
  .dmo_dcmuxctl(dmo_dcmuxctl),
  .ncu_spc_l2_idx_hash_en(ncu_spc_l2_idx_hash_en)
      );
`else
`ifndef CMP
assign spc5_pcx_req_pq[8:0] = 9'bz;
assign spc5_pcx_atm_pq[8:0] = 9'bz;
assign spc5_pcx_data_pa[129:0] = 130'bz;
assign spc5_tcu_scan_in[1:0] = 2'b0;
assign spc5_ncu_core_running_status[7:0] = 8'b0;
assign spc5_tcu_shscan_scan_in = 1'b0;
assign spc5_tcu_mbist_done = 1'b0;
assign spc5_tcu_mbist_fail = 1'b0;
assign spc5_tcu_mbist_scan_out = 1'b0;
assign spc5_dmo_dout = 36'b0;
assign spc5_tcu_lbist_done = 1'b0;
assign spc5_tcu_lbist_scan_out = 1'b0;
assign spc5_hardstop_request = 1'b0;
assign spc5_softstop_request = 1'b0;
assign spc5_trigger_pulse = 1'b0;
assign spc5_ss_complete = 1'b0;
assign spc5_dbg1_instr_cmt_grp0[1:0] = 2'b0;
assign spc5_dbg1_instr_cmt_grp1[1:0] = 2'b0;
assign spc5_efu_fuse_ddata =1'b0;
assign spc5_efu_fuse_dxfer_en =1'b0;
assign spc5_efu_fuse_idata =1'b0;
assign spc5_efu_fuse_ixfer_en =1'b0;
`endif
`endif


//________________________________________________________________


`ifndef RTL_NO_SPC6
spc spc6(
  .vnw_ary0                 (SPC_VNW[ 6 ]),
  .vnw_ary1                 (SPC_VNW[ 6 ]),
  .gclk                      	  ( cmp_gclk_c1_spc6 ), // cmp_gclk_c2_r[6]) , 
  .tcu_clk_stop ( gl_spc6_clk_stop ),	// staged clk_stop

  .cpx_spc_data_cx          (cpx_spc6_data_cx2[ 145 : 0 ]    ),// sparc core
  .pcx_spc_grant_px         (pcx_spc6_grant_px[ 8 : 0 ]      ),
  .spc_pcx_req_pq           (spc6_pcx_req_pq[ 8 : 0 ]        ),
  .spc_pcx_atm_pq           (spc6_pcx_atm_pq[ 8 : 0 ]        ),
  .spc_pcx_data_pa          (spc6_pcx_data_pa[ 129 : 0 ]     ),
  .spc_hardstop_request     (spc6_hardstop_request),
  .spc_softstop_request     (spc6_softstop_request),
  .spc_trigger_pulse        (spc6_trigger_pulse),
  .tcu_ss_mode              (tcu_ss_mode[ 6 ]),
  .tcu_do_mode              (tcu_do_mode[ 6 ]),
  .tcu_ss_request           (tcu_ss_request[ 6 ]),
  .spc_ss_complete          (spc6_ss_complete),
  .tcu_aclk                 (tcu_spc6_aclk               ),
  .tcu_bclk                 (tcu_spc6_bclk               ),
  .tcu_scan_en              (tcu_spc6_scan_en            ),
  .tcu_se_scancollar_in     (tcu_spc6_se_scancollar_in   ),
  .tcu_se_scancollar_out    (tcu_spc6_se_scancollar_out  ),
  .tcu_array_wr_inhibit     (tcu_spc6_array_wr_inhibit   ),
  .tcu_core_running         (ncu_spc6_core_running[ 7 : 0 ]  ),
  .spc_core_running_status  (spc6_ncu_core_running_status[ 7 : 0 ]),
  .const_cpuid              ({1'b1, 1'b1, 1'b0}          ),//No 3'b101 to Astro.
  .power_throttle           (mio_spc_pwr_throttle_1[ 2 : 0 ]),
  .scan_out                 (spc6_tcu_scan_in[ 1 : 0 ]       ),
  .scan_in                  (tcu_spc6_scan_out[ 1 : 0 ]      ),
  .spc_dbg_instr_cmt_grp0   (spc6_dbg1_instr_cmt_grp0[ 1 : 0 ]),
  .spc_dbg_instr_cmt_grp1   (spc6_dbg1_instr_cmt_grp1[ 1 : 0 ]),
  .tcu_spc_mbist_start      (tcu_spc_mbist_start[ 6 ]  ),
  .spc_mbist_done           (spc6_tcu_mbist_done    ),
  .spc_mbist_fail           (spc6_tcu_mbist_fail    ),
  .tcu_spc_mbist_scan_in    (tcu_spc6_mbist_scan_in      ),
  .spc_tcu_mbist_scan_out   (spc6_tcu_mbist_scan_out     ),
  .dmo_din                  (spc7_dmo_dout[ 35 : 0 ]         ),
  .dmo_dout                 (spc6_dmo_dout[ 35 : 0 ]         ),
  .dmo_coresel              (dmo_coresel[ 0 ]              ),
  .tcu_spc_lbist_start      (tcu_spc_lbist_start[ 6 ]      ),
  .tcu_spc_lbist_scan_in    (tcu_spc_lbist_scan_in[ 6 ]    ),
  .spc_tcu_lbist_done       (spc6_tcu_lbist_done         ),
  .spc_tcu_lbist_scan_out   (spc6_tcu_lbist_scan_out     ),
  .tcu_shscan_pce_ov	    (tcu_spc_shscan_pce_ov	 ),
  .tcu_shscan_aclk          (tcu_spc_shscan_aclk	 ),
  .tcu_shscan_bclk          (tcu_spc_shscan_bclk         ),
  .tcu_shscan_scan_en       (tcu_spc_shscan_scan_en      ),
  .tcu_shscanid             (tcu_spc_shscanid[ 2 : 0 ]       ),
  .tcu_shscan_scan_in       (tcu_spc6_shscan_scan_out    ),
  .spc_shscan_scan_out      (spc6_tcu_shscan_scan_in     ),
  .tcu_shscan_clk_stop      (tcu_spc6_shscan_clk_stop    ),
  .efu_spc_fuse_data        (efu_spc0246_fuse_data       ),
  .efu_spc_fuse_ixfer_en    (efu_spc6_fuse_ixfer_en      ),
  .efu_spc_fuse_iclr        (efu_spc6_fuse_iclr          ),
  .efu_spc_fuse_dxfer_en    (efu_spc6_fuse_dxfer_en      ),
  .efu_spc_fuse_dclr        (efu_spc6_fuse_dclr          ),
  .spc_efu_fuse_dxfer_en    (spc6_efu_fuse_dxfer_en      ),
  .spc_efu_fuse_ixfer_en    (spc6_efu_fuse_ixfer_en      ),
  .spc_efu_fuse_ddata       (spc6_efu_fuse_ddata         ),
  .spc_efu_fuse_idata       (spc6_efu_fuse_idata         ),
  .ccu_slow_cmp_sync_en 	(gl_io_cmp_sync_en_c1b ), 
  .ccu_cmp_slow_sync_en 	(gl_cmp_io_sync_en_c1b ),
  .hver_mask_minor_rev      (spc_revid_out[ 3 : 0 ]          ),
  .tcu_spc_test_mode        (tcu_spc6_test_mode),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_atpg_mode(tcu_atpg_mode),
  .rst_wmr_protect(rst_wmr_protect),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .ncu_cmp_tick_enable(ncu_cmp_tick_enable),
  .ncu_wmr_vec_mask(ncu_wmr_vec_mask),
  .ncu_spc_pm(ncu_spc_pm),
  .ncu_spc_ba01(ncu_spc_ba01),
  .ncu_spc_ba23(ncu_spc_ba23),
  .ncu_spc_ba45(ncu_spc_ba45),
  .ncu_spc_ba67(ncu_spc_ba67),
  .tcu_spc_lbist_pgm(tcu_spc_lbist_pgm),
  .dmo_icmuxctl(dmo_icmuxctl),
  .dmo_dcmuxctl(dmo_dcmuxctl),
  .ncu_spc_l2_idx_hash_en(ncu_spc_l2_idx_hash_en)
     );
`else
`ifndef CMP
assign spc6_pcx_req_pq[8:0] = 9'bz;
assign spc6_pcx_atm_pq[8:0] = 9'bz;
assign spc6_pcx_data_pa[129:0] = 130'bz;
assign spc6_tcu_scan_in[1:0] = 2'b0;
assign spc6_ncu_core_running_status[7:0] = 8'b0;
assign spc6_tcu_shscan_scan_in = 1'b0;
assign spc6_tcu_mbist_done = 1'b0;
assign spc6_tcu_mbist_fail = 1'b0;
assign spc6_tcu_mbist_scan_out = 1'b0;
assign spc6_dmo_dout = 36'b0;
assign spc6_tcu_lbist_done = 1'b0;
assign spc6_tcu_lbist_scan_out = 1'b0;
assign spc6_hardstop_request = 1'b0;
assign spc6_softstop_request = 1'b0;
assign spc6_trigger_pulse = 1'b0;
assign spc6_ss_complete = 1'b0;
assign spc6_dbg1_instr_cmt_grp0[1:0] = 2'b0;
assign spc6_dbg1_instr_cmt_grp1[1:0] = 2'b0;
assign spc6_efu_fuse_ddata =1'b0;
assign spc6_efu_fuse_dxfer_en =1'b0;
assign spc6_efu_fuse_idata =1'b0;
assign spc6_efu_fuse_ixfer_en =1'b0;
`endif
`endif


//________________________________________________________________


`ifndef RTL_NO_SPC7
spc spc7(
  .vnw_ary0                 (SPC_VNW[ 7 ]),
  .vnw_ary1                 (SPC_VNW[ 7 ]),
  .gclk                      	  ( cmp_gclk_c2_spc7 ), // cmp_gclk_c2_r[6]) , 
  .tcu_clk_stop ( gl_spc7_clk_stop ),	// staged clk_stop

  .cpx_spc_data_cx          (cpx_spc7_data_cx2[ 145 : 0 ]    ),// sparc core
  .pcx_spc_grant_px         (pcx_spc7_grant_px[ 8 : 0 ]      ),
  .spc_pcx_req_pq           (spc7_pcx_req_pq[ 8 : 0 ]        ),
  .spc_pcx_atm_pq           (spc7_pcx_atm_pq[ 8 : 0 ]        ),
  .spc_pcx_data_pa          (spc7_pcx_data_pa[ 129 : 0 ]     ),
  .spc_hardstop_request     (spc7_hardstop_request),
  .spc_softstop_request     (spc7_softstop_request),
  .spc_trigger_pulse        (spc7_trigger_pulse),
  .tcu_ss_mode              (tcu_ss_mode[ 7 ]),
  .tcu_do_mode              (tcu_do_mode[ 7 ]),
  .tcu_ss_request           (tcu_ss_request[ 7 ]),
  .spc_ss_complete          (spc7_ss_complete),
  .tcu_aclk                 (tcu_spc7_aclk               ),
  .tcu_bclk                 (tcu_spc7_bclk               ),
  .tcu_scan_en              (tcu_spc7_scan_en            ),
  .tcu_se_scancollar_in     (tcu_spc7_se_scancollar_in   ),
  .tcu_se_scancollar_out    (tcu_spc7_se_scancollar_out  ),
  .tcu_array_wr_inhibit     (tcu_spc7_array_wr_inhibit   ),
  .tcu_core_running         (ncu_spc7_core_running[ 7 : 0 ]  ),
  .spc_core_running_status  (spc7_ncu_core_running_status[ 7 : 0 ]),
  .const_cpuid              ({1'b1, 1'b1, 1'b1}          ),//No 3'b101 to Astro.
  .power_throttle           (mio_spc_pwr_throttle_1[ 2 : 0 ]),
  .scan_out                 (spc7_tcu_scan_in[ 1 : 0 ]       ),
  .scan_in                  (tcu_spc7_scan_out[ 1 : 0 ]      ),
  .spc_dbg_instr_cmt_grp0   (spc7_dbg1_instr_cmt_grp0[ 1 : 0 ]),
  .spc_dbg_instr_cmt_grp1   (spc7_dbg1_instr_cmt_grp1[ 1 : 0 ]),
  .tcu_spc_mbist_start      (tcu_spc_mbist_start[ 7 ]  ),
  .spc_mbist_done           (spc7_tcu_mbist_done    ),
  .spc_mbist_fail           (spc7_tcu_mbist_fail    ),
  .tcu_spc_mbist_scan_in    (tcu_spc7_mbist_scan_in      ),
  .spc_tcu_mbist_scan_out   (spc7_tcu_mbist_scan_out     ),
  .dmo_din                  (spc3_dmo_dout[ 35 : 0 ]         ),
  .dmo_dout                 (spc7_dmo_dout[ 35 : 0 ]         ),
  .dmo_coresel              (dmo_coresel[ 1 ]              ),
  .tcu_spc_lbist_start      (tcu_spc_lbist_start[ 7 ]      ),
  .tcu_spc_lbist_scan_in    (tcu_spc_lbist_scan_in[ 7 ]    ),
  .spc_tcu_lbist_done       (spc7_tcu_lbist_done         ),
  .spc_tcu_lbist_scan_out   (spc7_tcu_lbist_scan_out     ),
  .tcu_shscan_pce_ov	    (tcu_spc_shscan_pce_ov	 ),
  .tcu_shscan_aclk          (tcu_spc_shscan_aclk	 ),
  .tcu_shscan_bclk          (tcu_spc_shscan_bclk         ),
  .tcu_shscan_scan_en       (tcu_spc_shscan_scan_en      ),
  .tcu_shscanid             (tcu_spc_shscanid[ 2 : 0 ]       ),
  .tcu_shscan_scan_in       (tcu_spc7_shscan_scan_out    ),
  .spc_shscan_scan_out      (spc7_tcu_shscan_scan_in     ),
  .tcu_shscan_clk_stop      (tcu_spc7_shscan_clk_stop    ),
  .efu_spc_fuse_data        (efu_spc1357_fuse_data       ),
  .efu_spc_fuse_ixfer_en    (efu_spc7_fuse_ixfer_en      ),
  .efu_spc_fuse_iclr        (efu_spc7_fuse_iclr          ),
  .efu_spc_fuse_dxfer_en    (efu_spc7_fuse_dxfer_en      ),
  .efu_spc_fuse_dclr        (efu_spc7_fuse_dclr          ),
  .spc_efu_fuse_dxfer_en    (spc7_efu_fuse_dxfer_en      ),
  .spc_efu_fuse_ixfer_en    (spc7_efu_fuse_ixfer_en      ),
  .spc_efu_fuse_ddata       (spc7_efu_fuse_ddata         ),
  .spc_efu_fuse_idata       (spc7_efu_fuse_idata         ),
  .ccu_slow_cmp_sync_en 	( gl_io_cmp_sync_en_c2b ), 
  .ccu_cmp_slow_sync_en 	( gl_cmp_io_sync_en_c2b ),
  .hver_mask_minor_rev      (spc_revid_out[ 3 : 0 ]          ),
  .tcu_spc_test_mode        (tcu_spc7_test_mode),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_atpg_mode(tcu_atpg_mode),
  .rst_wmr_protect(rst_wmr_protect),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .ncu_cmp_tick_enable(ncu_cmp_tick_enable),
  .ncu_wmr_vec_mask(ncu_wmr_vec_mask),
  .ncu_spc_pm(ncu_spc_pm),
  .ncu_spc_ba01(ncu_spc_ba01),
  .ncu_spc_ba23(ncu_spc_ba23),
  .ncu_spc_ba45(ncu_spc_ba45),
  .ncu_spc_ba67(ncu_spc_ba67),
  .tcu_spc_lbist_pgm(tcu_spc_lbist_pgm),
  .dmo_icmuxctl(dmo_icmuxctl),
  .dmo_dcmuxctl(dmo_dcmuxctl),
  .ncu_spc_l2_idx_hash_en(ncu_spc_l2_idx_hash_en)
       );
`else
`ifndef CMP
assign spc7_pcx_req_pq[8:0] = 9'bz;
assign spc7_pcx_atm_pq[8:0] = 9'bz;
assign spc7_pcx_data_pa[129:0] = 130'bz;
assign spc7_tcu_scan_in[1:0] = 2'b0;
assign spc7_ncu_core_running_status[7:0] = 8'b0;
assign spc7_tcu_shscan_scan_in = 1'b0;
assign spc7_tcu_mbist_done = 1'b0;
assign spc7_tcu_mbist_fail = 1'b0;
assign spc7_tcu_mbist_scan_out = 1'b0;
assign spc7_dmo_dout = 36'b0;
assign spc7_tcu_lbist_done = 1'b0;
assign spc7_tcu_lbist_scan_out = 1'b0;
assign spc7_hardstop_request = 1'b0;
assign spc7_softstop_request = 1'b0;
assign spc7_trigger_pulse = 1'b0;
assign spc7_ss_complete = 1'b0;
assign spc7_dbg1_instr_cmt_grp0[1:0] = 2'b0;
assign spc7_dbg1_instr_cmt_grp1[1:0] = 2'b0;
assign spc7_efu_fuse_ddata =1'b0;
assign spc7_efu_fuse_dxfer_en =1'b0;
assign spc7_efu_fuse_idata =1'b0;
assign spc7_efu_fuse_ixfer_en =1'b0;
`endif
`endif



//________________________________________________________________



//// stagging flops

//assign

ccx ccx(

  //  .gclk		    ( cmp_gclk_c2_ccx_right ), // cmp_gclk_c1_r[3]) , 
  .gl_ccx_clk_stop_left     ( gl_ccx_clk_stop ), 
  .gl_ccx_clk_stop_right    ( gl_ccx_clk_stop ), 
  .scan_in                  (tcu_ccx_scan_out[ 1 : 0 ]       ),      
  .scan_out                 (ccx_scan_out[ 1 : 0 ]           ),
  .io_cpx_req_cq            (ncu_cpx_req_cq[ 7 : 0 ]         ),
  .cpx_io_grant_cx          (cpx_ncu_grant_cx[ 7 : 0 ]       ),
  .io_cpx_data_ca           ({ncu_cpx_data_ca[ 145 : 0 ]}),
  .io_pcx_stall_pq          (ncu_pcx_stall_pq            ),
  .pcx_fpio_data_px2        (pcx_ncu_data_px2[ 129 : 0 ]     ),
  .sctag0_cpx_data_ca       ({sctag0_cpx_data_ca[ 145 : 0 ]}),
  .sctag1_cpx_data_ca       ({sctag1_cpx_data_ca[ 145 : 0 ]}),
  .sctag2_cpx_data_ca       ({sctag2_cpx_data_ca[ 145 : 0 ]}),
  .sctag3_cpx_data_ca       ({sctag3_cpx_data_ca[ 145 : 0 ]}),
  .sctag4_cpx_data_ca       ({sctag4_cpx_data_ca[ 145 : 0 ]}),
  .sctag5_cpx_data_ca       ({sctag5_cpx_data_ca[ 145 : 0 ]}),
  .sctag6_cpx_data_ca       ({sctag6_cpx_data_ca[ 145 : 0 ]}),
  .sctag7_cpx_data_ca       ({sctag7_cpx_data_ca[ 145 : 0 ]}),
  .pcx_fpio_data_rdy_px1    (pcx_ncu_data_rdy_px1        ),
  ////  .tcu_clk_stop             (tcu_soc4cmp_clk_stop        ),

  .ccx_lstg_in              (
                             {dbg0_dbg1_l2b0_sio_ack_dest,
                              dbg0_dbg1_l2b0_sio_ack_type,
                              dbg0_dbg1_l2b0_sio_ctag_vld,
                              dbg0_dbg1_l2b1_sio_ack_dest,
                              dbg0_dbg1_l2b1_sio_ack_type,
                              dbg0_dbg1_l2b1_sio_ctag_vld,
                              dbg0_dbg1_l2b2_sio_ack_dest,
                              dbg0_dbg1_l2b2_sio_ack_type,
                              dbg0_dbg1_l2b2_sio_ctag_vld,
                              dbg0_dbg1_l2b3_sio_ack_dest,
                              dbg0_dbg1_l2b3_sio_ack_type,
                              dbg0_dbg1_l2b3_sio_ctag_vld,
                              dbg0_dbg1_l2t0_err_event,
                              dbg0_dbg1_l2t0_pa_match,
                              dbg0_dbg1_l2t0_sii_iq_dequeue,
                              dbg0_dbg1_l2t0_sii_wib_dequeue,
                              dbg0_dbg1_l2t0_xbar_vcid[ 5 : 0 ],
                              dbg0_dbg1_l2t2_err_event,
                              dbg0_dbg1_l2t2_pa_match,
                              dbg0_dbg1_l2t2_sii_iq_dequeue,
                              dbg0_dbg1_l2t2_sii_wib_dequeue,
                              dbg0_dbg1_l2t2_xbar_vcid[ 5 : 0 ],
                              dbg0_dbg1_spc0_instr_cmt_grp0[ 0 ],
                              dbg0_dbg1_spc0_instr_cmt_grp0[ 1 ],
                              dbg0_dbg1_spc0_instr_cmt_grp1[ 0 ],
                              dbg0_dbg1_spc0_instr_cmt_grp1[ 1 ],
                              dbg0_dbg1_spc2_instr_cmt_grp0[ 0 ],
                              dbg0_dbg1_spc2_instr_cmt_grp0[ 1 ],
                              dbg0_dbg1_spc2_instr_cmt_grp1[ 0 ],
                              dbg0_dbg1_spc2_instr_cmt_grp1[ 1 ],
                              l2b1_sio_data[ 31 : 0 ],
                              l2b1_sio_parity[ 1 : 0 ],
                              l2b1_sio_ctag_vld,
                              l2b1_sio_ue_err,
                              l2b2_sio_data[ 31 : 0 ],
                              l2b2_sio_parity[ 1 : 0 ],
                              l2b2_sio_ctag_vld,
                              l2b2_sio_ue_err,
                              l2b3_sio_data[ 31 : 0 ],
                              l2b3_sio_parity[ 1 : 0 ],
                              l2b3_sio_ctag_vld,
                              l2b3_sio_ue_err,
                              l2b0_tcu_mbist_done,
                              l2b0_tcu_mbist_fail,
                              tcu_l2b0_mbist_start,
                              l2b1_tcu_mbist_done,
                              l2b1_tcu_mbist_fail,
                              tcu_l2b1_mbist_start,
                              l2b2_tcu_mbist_done,
                              l2b2_tcu_mbist_fail,
                              tcu_l2b2_mbist_start,
                              l2b3_tcu_mbist_done,
                              l2b3_tcu_mbist_fail,
                              tcu_l2b3_mbist_start
                             }
                            ),
  .ccx_lstg_out             (
                             {dbg0_dbg1_l2b0_sio_ack_dest_ccxlff,
                              dbg0_dbg1_l2b0_sio_ack_type_ccxlff,
                              dbg0_dbg1_l2b0_sio_ctag_vld_ccxlff,
                              dbg0_dbg1_l2b1_sio_ack_dest_ccxlff,
                              dbg0_dbg1_l2b1_sio_ack_type_ccxlff,
                              dbg0_dbg1_l2b1_sio_ctag_vld_ccxlff,
                              dbg0_dbg1_l2b2_sio_ack_dest_ccxlff,
                              dbg0_dbg1_l2b2_sio_ack_type_ccxlff,
                              dbg0_dbg1_l2b2_sio_ctag_vld_ccxlff,
                              dbg0_dbg1_l2b3_sio_ack_dest_ccxlff,
                              dbg0_dbg1_l2b3_sio_ack_type_ccxlff,
                              dbg0_dbg1_l2b3_sio_ctag_vld_ccxlff,
                              dbg0_dbg1_l2t0_err_event_ccxlff,
                              dbg0_dbg1_l2t0_pa_match_ccxlff,
                              dbg0_dbg1_l2t0_sii_iq_dequeue_ccxlff,
                              dbg0_dbg1_l2t0_sii_wib_dequeue_ccxlff,
                              dbg0_dbg1_l2t0_xbar_vcid_ccxlff[ 5 : 0 ],
                              dbg0_dbg1_l2t2_err_event_ccxlff,
                              dbg0_dbg1_l2t2_pa_match_ccxlff,
                              dbg0_dbg1_l2t2_sii_iq_dequeue_ccxlff,
                              dbg0_dbg1_l2t2_sii_wib_dequeue_ccxlff,
                              dbg0_dbg1_l2t2_xbar_vcid_ccxlff[ 5 : 0 ],
                              dbg0_dbg1_spc0_instr_cmt_grp0_ccxlff_0,
                              dbg0_dbg1_spc0_instr_cmt_grp0_ccxlff_1,
                              dbg0_dbg1_spc0_instr_cmt_grp1_ccxlff_0,
                              dbg0_dbg1_spc0_instr_cmt_grp1_ccxlff_1,
                              dbg0_dbg1_spc2_instr_cmt_grp0_ccxlff_0,
                              dbg0_dbg1_spc2_instr_cmt_grp0_ccxlff_1,
                              dbg0_dbg1_spc2_instr_cmt_grp1_ccxlff_0,
                              dbg0_dbg1_spc2_instr_cmt_grp1_ccxlff_1,
                              l2b1_sio_data_ccxlff[ 31 : 0 ],
                              l2b1_sio_parity_ccxlff[ 1 : 0 ],
                              l2b1_sio_ctag_vld_ccxlff,
                              l2b1_sio_ue_err_ccxlff,
                              l2b2_sio_data_ccxlff[ 31 : 0 ],
                              l2b2_sio_parity_ccxlff[ 1 : 0 ],
                              l2b2_sio_ctag_vld_ccxlff,
                              l2b2_sio_ue_err_ccxlff,
                              l2b3_sio_data_ccxlff[ 31 : 0 ],
                              l2b3_sio_parity_ccxlff[ 1 : 0 ],
                              l2b3_sio_ctag_vld_ccxlff,
                              l2b3_sio_ue_err_ccxlff,
                              l2b0_tcu_mbist_done_ccxlff,
                              l2b0_tcu_mbist_fail_ccxlff,
                              tcu_l2b0_mbist_start_ccxlff,
                              l2b1_tcu_mbist_done_ccxlff,
                              l2b1_tcu_mbist_fail_ccxlff,
                              tcu_l2b1_mbist_start_ccxlff,
                              l2b2_tcu_mbist_done_ccxlff,
                              l2b2_tcu_mbist_fail_ccxlff,
                              tcu_l2b2_mbist_start_ccxlff,
                              l2b3_tcu_mbist_done_ccxlff,
                              l2b3_tcu_mbist_fail_ccxlff,
                              tcu_l2b3_mbist_start_ccxlff
                             }
                            ),
  .ccx_rstg_in              (
                             {5'b0,
                              sii_l2b5_ecc[ 6 : 5 ],
                              4'b0,
                              sii_l2b5_ecc[ 4 : 3 ],
                              4'b0,
                              sii_l2b5_ecc[ 2 : 1 ],
                              4'b0,
                              sii_l2b5_ecc[ 0 ],
                              4'b0,
                              sii_dbg1_l2t0_req[ 1 : 0 ],
                              4'b0,
                              sii_dbg1_l2t1_req[ 1 : 0 ],
                              4'b0,
                              sii_dbg1_l2t2_req[ 1 : 0 ],
                              4'b0,
                              sii_dbg1_l2t3_req[ 1 : 0 ],
                              4'b0,
                              sii_dbg1_l2t4_req[ 1 : 0 ],
                              4'b0,
                              sii_dbg1_l2t5_req[ 1 : 0 ],
                              4'b0,
                              sii_dbg1_l2t6_req[ 1 : 0 ],
                              4'b0,
                              sii_dbg1_l2t7_req[ 1 : 0 ],
                              13'b0,
                              sii_tcu_mbist_done[ 1 : 0 ],
                              4'b0,
                              sii_tcu_mbist_fail[ 1 : 0 ],
                              4'b0,
                              tcu_sii_mbist_start[ 1 : 0 ],
                              4'b0,
                              tcu_sii_data,
                              tcu_sii_vld,
                              13'b0,
                              sii_l2b6_ecc[  0  ],
                              4'b0,
                              sii_l2b6_ecc[  2  :  1  ],
                              4'b0,
                              sii_l2b6_ecc[  4  :  3  ],
                              4'b0,
                              sii_l2b6_ecc[  6  :  5  ],
                              4'b0,
                              sii_l2b7_ecc[  0  ],
                              4'b0,
                              sii_l2b7_ecc[  2  :  1  ],
                              4'b0,
                              sii_l2b7_ecc[  4  :  3  ],
                              4'b0,
                              sii_l2b7_ecc[  6  :  5  ]
                             }
                            ),
  .ccx_rstg_out             (
                             {ccx_rstg_out_unconnected[ 159 : 155 ],
                              sii_l2b5_ecc_ccxrff[ 6 : 5 ],
                              ccx_rstg_out_unconnected[ 152 : 149 ],
                              sii_l2b5_ecc_ccxrff[ 4 : 3 ],
                              ccx_rstg_out_unconnected[ 146 : 143 ],
                              sii_l2b5_ecc_ccxrff[ 2 : 1 ],
                              ccx_rstg_out_unconnected[ 140 : 137 ],
                              sii_l2b5_ecc_ccxrff[ 0 ],
                              ccx_rstg_out_unconnected[ 135 : 132 ],
                              sii_dbg1_l2t0_req_ccxrff[ 1 : 0 ],
                              ccx_rstg_out_unconnected[ 129 : 126 ],
                              sii_dbg1_l2t1_req_ccxrff[ 1 : 0 ],
                              ccx_rstg_out_unconnected[ 123 : 120 ],
                              sii_dbg1_l2t2_req_ccxrff[ 1 : 0 ],
                              ccx_rstg_out_unconnected[ 117 : 114 ],
                              sii_dbg1_l2t3_req_ccxrff[ 1 : 0 ],
                              ccx_rstg_out_unconnected[ 111 : 108 ],
                              sii_dbg1_l2t4_req_ccxrff[ 1 : 0 ],
                              ccx_rstg_out_unconnected[ 105 : 102 ],
                              sii_dbg1_l2t5_req_ccxrff[ 1 : 0 ],
                              ccx_rstg_out_unconnected[ 99 : 96 ],
                              sii_dbg1_l2t6_req_ccxrff[ 1 : 0 ],
                              ccx_rstg_out_unconnected[ 93 : 90 ],
                              sii_dbg1_l2t7_req_ccxrff[ 1 : 0 ],
                              ccx_rstg_out_unconnected[ 87 : 75 ],
                              sii_tcu_mbist_done_ccxrff_1,
                              sii_tcu_mbist_done_ccxrff_0,
                              ccx_rstg_out_unconnected[ 72 : 69 ],
                              sii_tcu_mbist_fail_ccxrff_1,
                              sii_tcu_mbist_fail_ccxrff_0,
                              ccx_rstg_out_unconnected[ 66 : 63 ],
                              tcu_sii_mbist_start_ccxrff_1,
                              tcu_sii_mbist_start_ccxrff_0,
                              ccx_rstg_out_unconnected[ 60 : 57 ],
                              tcu_sii_data_ccxrff,
                              tcu_sii_vld_ccxrff,
                              ccx_rstg_out_unconnected[ 54 : 42 ],
                              sii_l2b6_ecc_ccxrff[ 0 ],
                              ccx_rstg_out_unconnected[ 40 : 37 ],
                              sii_l2b6_ecc_ccxrff[ 2  :  1 ],
                              ccx_rstg_out_unconnected[ 34 : 31 ],
                              sii_l2b6_ecc_ccxrff[ 4 : 3 ],
                              ccx_rstg_out_unconnected[ 28 : 25 ],
                              sii_l2b6_ecc_ccxrff[ 6 : 5 ],
                              ccx_rstg_out_unconnected[ 22 : 19 ],
                              sii_l2b7_ecc_ccxrff[ 0 ],
                              ccx_rstg_out_unconnected[ 17 : 14 ],
                              sii_l2b7_ecc_ccxrff[ 2 : 1 ],
                              ccx_rstg_out_unconnected[ 11 : 8 ],
                              sii_l2b7_ecc_ccxrff[ 4 : 3 ],
                              ccx_rstg_out_unconnected[ 5 : 2 ],
                              sii_l2b7_ecc_ccxrff[ 6 : 5 ]
                             }
                            ),
  .cpu_rep0_in              (192'b0                      ),
  .cpu_rep0_out             (cpu_rep0_out_unconnected[ 191 : 0 ]),
  .cpu_rep1_in              (192'b0                      ),
  .cpu_rep1_out             (cpu_rep1_out_unconnected[ 191 : 0 ]),
  .cmp_gclk_c2_ccx_left(cmp_gclk_c2_ccx_left),
  .cmp_gclk_c2_ccx_right(cmp_gclk_c2_ccx_right),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .cluster_arst_l(cluster_arst_l),
  .tcu_atpg_mode(tcu_atpg_mode),
  .spc0_pcx_data_pa(spc0_pcx_data_pa[129:0]),
  .spc0_pcx_req_pq(spc0_pcx_req_pq[8:0]),
  .spc0_pcx_atm_pq(spc0_pcx_atm_pq[8:0]),
  .spc1_pcx_data_pa(spc1_pcx_data_pa[129:0]),
  .spc1_pcx_req_pq(spc1_pcx_req_pq[8:0]),
  .spc1_pcx_atm_pq(spc1_pcx_atm_pq[8:0]),
  .spc2_pcx_data_pa(spc2_pcx_data_pa[129:0]),
  .spc2_pcx_req_pq(spc2_pcx_req_pq[8:0]),
  .spc2_pcx_atm_pq(spc2_pcx_atm_pq[8:0]),
  .spc3_pcx_data_pa(spc3_pcx_data_pa[129:0]),
  .spc3_pcx_req_pq(spc3_pcx_req_pq[8:0]),
  .spc3_pcx_atm_pq(spc3_pcx_atm_pq[8:0]),
  .spc4_pcx_data_pa(spc4_pcx_data_pa[129:0]),
  .spc4_pcx_req_pq(spc4_pcx_req_pq[8:0]),
  .spc4_pcx_atm_pq(spc4_pcx_atm_pq[8:0]),
  .spc5_pcx_data_pa(spc5_pcx_data_pa[129:0]),
  .spc5_pcx_req_pq(spc5_pcx_req_pq[8:0]),
  .spc5_pcx_atm_pq(spc5_pcx_atm_pq[8:0]),
  .spc6_pcx_data_pa(spc6_pcx_data_pa[129:0]),
  .spc6_pcx_req_pq(spc6_pcx_req_pq[8:0]),
  .spc6_pcx_atm_pq(spc6_pcx_atm_pq[8:0]),
  .spc7_pcx_data_pa(spc7_pcx_data_pa[129:0]),
  .spc7_pcx_req_pq(spc7_pcx_req_pq[8:0]),
  .spc7_pcx_atm_pq(spc7_pcx_atm_pq[8:0]),
  .sctag0_pcx_stall_pq(sctag0_pcx_stall_pq),
  .sctag1_pcx_stall_pq(sctag1_pcx_stall_pq),
  .sctag2_pcx_stall_pq(sctag2_pcx_stall_pq),
  .sctag3_pcx_stall_pq(sctag3_pcx_stall_pq),
  .sctag4_pcx_stall_pq(sctag4_pcx_stall_pq),
  .sctag5_pcx_stall_pq(sctag5_pcx_stall_pq),
  .sctag6_pcx_stall_pq(sctag6_pcx_stall_pq),
  .sctag7_pcx_stall_pq(sctag7_pcx_stall_pq),
  .pcx_spc0_grant_px(pcx_spc0_grant_px[8:0]),
  .pcx_spc1_grant_px(pcx_spc1_grant_px[8:0]),
  .pcx_spc2_grant_px(pcx_spc2_grant_px[8:0]),
  .pcx_spc3_grant_px(pcx_spc3_grant_px[8:0]),
  .pcx_spc4_grant_px(pcx_spc4_grant_px[8:0]),
  .pcx_spc5_grant_px(pcx_spc5_grant_px[8:0]),
  .pcx_spc6_grant_px(pcx_spc6_grant_px[8:0]),
  .pcx_spc7_grant_px(pcx_spc7_grant_px[8:0]),
  .pcx_sctag0_atm_px1(pcx_sctag0_atm_px1),
  .pcx_sctag0_data_px2(pcx_sctag0_data_px2[129:0]),
  .pcx_sctag0_data_rdy_px1(pcx_sctag0_data_rdy_px1),
  .pcx_sctag1_atm_px1(pcx_sctag1_atm_px1),
  .pcx_sctag1_data_px2(pcx_sctag1_data_px2[129:0]),
  .pcx_sctag1_data_rdy_px1(pcx_sctag1_data_rdy_px1),
  .pcx_sctag2_atm_px1(pcx_sctag2_atm_px1),
  .pcx_sctag2_data_px2(pcx_sctag2_data_px2[129:0]),
  .pcx_sctag2_data_rdy_px1(pcx_sctag2_data_rdy_px1),
  .pcx_sctag3_atm_px1(pcx_sctag3_atm_px1),
  .pcx_sctag3_data_px2(pcx_sctag3_data_px2[129:0]),
  .pcx_sctag3_data_rdy_px1(pcx_sctag3_data_rdy_px1),
  .pcx_sctag4_atm_px1(pcx_sctag4_atm_px1),
  .pcx_sctag4_data_px2(pcx_sctag4_data_px2[129:0]),
  .pcx_sctag4_data_rdy_px1(pcx_sctag4_data_rdy_px1),
  .pcx_sctag5_atm_px1(pcx_sctag5_atm_px1),
  .pcx_sctag5_data_px2(pcx_sctag5_data_px2[129:0]),
  .pcx_sctag5_data_rdy_px1(pcx_sctag5_data_rdy_px1),
  .pcx_sctag6_atm_px1(pcx_sctag6_atm_px1),
  .pcx_sctag6_data_px2(pcx_sctag6_data_px2[129:0]),
  .pcx_sctag6_data_rdy_px1(pcx_sctag6_data_rdy_px1),
  .pcx_sctag7_atm_px1(pcx_sctag7_atm_px1),
  .pcx_sctag7_data_px2(pcx_sctag7_data_px2[129:0]),
  .pcx_sctag7_data_rdy_px1(pcx_sctag7_data_rdy_px1),
  .sctag0_cpx_atom_cq(sctag0_cpx_atom_cq),
  .sctag0_cpx_req_cq(sctag0_cpx_req_cq[7:0]),
  .sctag1_cpx_atom_cq(sctag1_cpx_atom_cq),
  .sctag1_cpx_req_cq(sctag1_cpx_req_cq[7:0]),
  .sctag2_cpx_atom_cq(sctag2_cpx_atom_cq),
  .sctag2_cpx_req_cq(sctag2_cpx_req_cq[7:0]),
  .sctag3_cpx_atom_cq(sctag3_cpx_atom_cq),
  .sctag3_cpx_req_cq(sctag3_cpx_req_cq[7:0]),
  .sctag4_cpx_atom_cq(sctag4_cpx_atom_cq),
  .sctag4_cpx_req_cq(sctag4_cpx_req_cq[7:0]),
  .sctag5_cpx_atom_cq(sctag5_cpx_atom_cq),
  .sctag5_cpx_req_cq(sctag5_cpx_req_cq[7:0]),
  .sctag6_cpx_atom_cq(sctag6_cpx_atom_cq),
  .sctag6_cpx_req_cq(sctag6_cpx_req_cq[7:0]),
  .sctag7_cpx_atom_cq(sctag7_cpx_atom_cq),
  .sctag7_cpx_req_cq(sctag7_cpx_req_cq[7:0]),
  .cpx_sctag0_grant_cx(cpx_sctag0_grant_cx[7:0]),
  .cpx_sctag1_grant_cx(cpx_sctag1_grant_cx[7:0]),
  .cpx_sctag2_grant_cx(cpx_sctag2_grant_cx[7:0]),
  .cpx_sctag3_grant_cx(cpx_sctag3_grant_cx[7:0]),
  .cpx_sctag4_grant_cx(cpx_sctag4_grant_cx[7:0]),
  .cpx_sctag5_grant_cx(cpx_sctag5_grant_cx[7:0]),
  .cpx_sctag6_grant_cx(cpx_sctag6_grant_cx[7:0]),
  .cpx_sctag7_grant_cx(cpx_sctag7_grant_cx[7:0]),
  .cpx_spc0_data_cx2(cpx_spc0_data_cx2[145:0]),
  .cpx_spc1_data_cx2(cpx_spc1_data_cx2[145:0]),
  .cpx_spc2_data_cx2(cpx_spc2_data_cx2[145:0]),
  .cpx_spc3_data_cx2(cpx_spc3_data_cx2[145:0]),
  .cpx_spc4_data_cx2(cpx_spc4_data_cx2[145:0]),
  .cpx_spc5_data_cx2(cpx_spc5_data_cx2[145:0]),
  .cpx_spc6_data_cx2(cpx_spc6_data_cx2[145:0]),
  .cpx_spc7_data_cx2(cpx_spc7_data_cx2[145:0])
        );
//________________________________________________________________


n2_l2d_sp_512kb_cust l2d0(

  .l2b_l2d_en_fill_clk_v0         (1'b1),
  .l2b_l2d_en_fill_clk_v1         (1'b1),
  .l2t_l2d_en_fill_clk_ov         (1'b1),
  .l2t_l2d_pwrsav_ov          (1'b1),
  .vnw_ary0                       (L2D_VNW0[ 0 ]),
  .vnw_ary1                       (L2D_VNW1[ 0 ]),
  .gclk                        ( cmp_gclk_c3_l2d0 ), // cmp_gclk_c0_r[0]            ),  
  .tcu_clk_stop ( gl_l2d0_clk_stop ),	// staged clk_stop
  .tcu_aclk			(tcu_aclk),
  .tcu_bclk			(tcu_bclk),
  .l2t_l2d_way_sel_c2             (l2t0_l2d0_way_sel_c2[ 15 : 0 ]),   
  .l2t_l2d_col_offset_c2          (l2t0_l2d0_col_offset_c2[ 3 : 0 ]),     
  .l2t_l2d_fb_hit_c3              (l2t0_l2d0_fb_hit_c3),
  .l2t_l2d_fbrd_c3                (l2t0_l2d0_fbrd_c3),
  .l2t_l2d_rd_wr_c2               (l2t0_l2d0_rd_wr_c2),
  .l2t_l2d_set_c2                 (l2t0_l2d0_set_c2[ 8 : 0 ]),
  .l2t_l2d_word_en_c2             (l2t0_l2d0_word_en_c2[ 15 : 0 ]),
  .l2t_l2d_stdecc_c2              (l2t0_l2d0_stdecc_c2[ 77 : 0 ]),
  .l2b_l2d_fbdecc_c4              (l2b0_l2d0_fbdecc_c4[ 623 : 0 ]),
  .rst_por_                 	  ( gl_l2_por_c3t0 ), // ( gl_l2_por_c3t ),  - for int6.1
  .rst_wmr_                 	  ( gl_l2_wmr_c3t0 ), // ( gl_l2_wmr_c3t ),  - for int6.1
  .rst_wmr_protect                (rst_wmr_protect                 ),
  .tcu_ce                         (1'b1),
  .tcu_se_scancollar_in           (tcu_se_scancollar_in),
  .tcu_se_scancollar_out          (tcu_se_scancollar_out),
  .tcu_array_wr_inhibit           (tcu_array_wr_inhibit),
  .scan_in                        (l2t1_scan_out          ),
  .l2b_l2d_fuse_l2d_data_in       (l2b0_l2d0_rvalue[ 9 : 0 ]),
  .l2b_l2d_fuse_rid               (l2b0_l2d0_rid[ 6 : 0 ]),
  .l2b_l2d_fuse_l2d_wren          (l2b0_l2d0_wr_en),
  .l2b_l2d_fuse_reset             (l2b0_l2d0_fuse_clr),
  .l2d_l2b_efc_fuse_data          (l2d0_l2b0_fuse_data[ 9 : 0 ]),   
  .scan_out                       (l2d0_scan_out),                          
  .l2d_l2b_decc_out_c7            (l2d0_l2b0_decc_out_c7[ 623 : 0 ]),
  .l2d_l2t_decc_c6                (l2d0_l2t0_decc_c6[ 155 : 0 ]),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_atpg_mode(tcu_atpg_mode)
);

//________________________________________________________________


n2_l2d_sp_512kb_cust l2d1(

  .l2b_l2d_en_fill_clk_v0         (1'b1),
  .l2b_l2d_en_fill_clk_v1         (1'b1),
  .l2t_l2d_en_fill_clk_ov         (1'b1),
  .l2t_l2d_pwrsav_ov          (1'b1),
  .vnw_ary0                       (L2D_VNW0[ 1 ]),
  .vnw_ary1                       (L2D_VNW1[ 1 ]),
  .gclk		( cmp_gclk_c3_l2d1 ), // cmp_gclk_c0_r[1]),  
  .tcu_clk_stop ( gl_l2d1_clk_stop ),	// staged clk_stop
  .tcu_aclk		(tcu_aclk),
  .tcu_bclk		(tcu_bclk),
  .tcu_ce                   (1'b1                        ),
  .tcu_se_scancollar_in     (tcu_se_scancollar_in),
  .tcu_se_scancollar_out    (tcu_se_scancollar_out),
  .tcu_array_wr_inhibit     (tcu_array_wr_inhibit),
  .scan_in                  (l2d0_scan_out               ),
  .scan_out                 (l2d1_scan_out),
  .l2b_l2d_fbdecc_c4        (l2b1_l2d1_fbdecc_c4[ 623 : 0 ]  ),// scdata
  .rst_por_                 ( gl_l2_por_c3t ), 
  .rst_wmr_                 ( gl_l2_wmr_c3t ), 
  .rst_wmr_protect                (rst_wmr_protect                 ),
  .l2t_l2d_col_offset_c2    (l2t1_l2d1_col_offset_c2[ 3 : 0 ]),
  .l2t_l2d_fb_hit_c3        (l2t1_l2d1_fb_hit_c3         ),
  .l2t_l2d_fbrd_c3          (l2t1_l2d1_fbrd_c3           ),
  .l2t_l2d_rd_wr_c2         (l2t1_l2d1_rd_wr_c2          ),
  .l2t_l2d_set_c2           (l2t1_l2d1_set_c2[ 8 : 0 ]       ),
  .l2t_l2d_stdecc_c2        (l2t1_l2d1_stdecc_c2[ 77 : 0 ]   ),
  .l2t_l2d_way_sel_c2       (l2t1_l2d1_way_sel_c2[ 15 : 0 ]  ),
  .l2t_l2d_word_en_c2       (l2t1_l2d1_word_en_c2[ 15 : 0 ]  ),
  .l2b_l2d_fuse_l2d_data_in (l2b1_l2d1_rvalue[ 9 : 0 ]),
  .l2b_l2d_fuse_rid         (l2b1_l2d1_rid[ 6 : 0 ]),
  .l2b_l2d_fuse_l2d_wren    (l2b1_l2d1_wr_en),
  .l2b_l2d_fuse_reset       (l2b1_l2d1_fuse_clr),
  .l2d_l2b_efc_fuse_data    (l2d1_l2b1_fuse_data[ 9 : 0 ]),     
  .l2d_l2b_decc_out_c7      (l2d1_l2b1_decc_out_c7[ 623 : 0 ]),
  .l2d_l2t_decc_c6          (l2d1_l2t1_decc_c6[ 155 : 0 ]    ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_atpg_mode(tcu_atpg_mode)
        );
//________________________________________________________________

n2_l2d_sp_512kb_cust l2d2(

  .l2b_l2d_en_fill_clk_v0         (1'b1),
  .l2b_l2d_en_fill_clk_v1         (1'b1),
  .l2t_l2d_en_fill_clk_ov         (1'b1),
  .l2t_l2d_pwrsav_ov          (1'b1),
  .vnw_ary0                       (L2D_VNW0[ 2 ]),
  .vnw_ary1                       (L2D_VNW1[ 2 ]),
  .gclk		( cmp_gclk_c3_l2d2 ), // cmp_gclk_c3_r[4]  ),  
  .tcu_clk_stop ( gl_l2d2_clk_stop ),	// staged clk_stop
  .tcu_aclk		(tcu_aclk),
  .tcu_bclk		(tcu_bclk),
  .tcu_ce                   (1'b1                        ),
  .tcu_se_scancollar_in     (tcu_se_scancollar_in),
  .tcu_se_scancollar_out    (tcu_se_scancollar_out),
  .tcu_array_wr_inhibit     (tcu_array_wr_inhibit),
  .scan_in                  (l2t3_scan_out               ),
  .scan_out                 (l2d2_scan_out),
  .l2b_l2d_fbdecc_c4        (l2b2_l2d2_fbdecc_c4[ 623 : 0 ]  ),// scdata
  .rst_por_                 ( gl_l2_por_c3b0 ), 	// ECO c3t0 -> c3b0 - mh157021
  .rst_wmr_                 ( gl_l2_wmr_c3b ), 		// ECO c3t0 -> c3b  - mh157021
  .rst_wmr_protect                (rst_wmr_protect                 ),
  .l2t_l2d_col_offset_c2    (l2t2_l2d2_col_offset_c2[ 3 : 0 ]),
  .l2t_l2d_fb_hit_c3        (l2t2_l2d2_fb_hit_c3         ),
  .l2t_l2d_fbrd_c3          (l2t2_l2d2_fbrd_c3           ),
  .l2t_l2d_rd_wr_c2         (l2t2_l2d2_rd_wr_c2          ),
  .l2t_l2d_set_c2           (l2t2_l2d2_set_c2[ 8 : 0 ]       ),
  .l2t_l2d_stdecc_c2        (l2t2_l2d2_stdecc_c2[ 77 : 0 ]   ),
  .l2t_l2d_way_sel_c2       (l2t2_l2d2_way_sel_c2[ 15 : 0 ]  ),
  .l2t_l2d_word_en_c2       (l2t2_l2d2_word_en_c2[ 15 : 0 ]  ),
  .l2d_l2b_decc_out_c7      (l2d2_l2b2_decc_out_c7[ 623 : 0 ]),
  .l2d_l2t_decc_c6          (l2d2_l2t2_decc_c6[ 155 : 0 ]    ),
  .l2b_l2d_fuse_l2d_data_in (l2b2_l2d2_rvalue[ 9 : 0 ]),
  .l2b_l2d_fuse_rid         (l2b2_l2d2_rid[ 6 : 0 ]),
  .l2b_l2d_fuse_l2d_wren    (l2b2_l2d2_wr_en),
  .l2b_l2d_fuse_reset       (l2b2_l2d2_fuse_clr),
  .l2d_l2b_efc_fuse_data    (l2d2_l2b2_fuse_data[ 9 : 0 ]),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_atpg_mode(tcu_atpg_mode)     
        );
//________________________________________________________________

 n2_l2d_sp_512kb_cust l2d3(

  .l2b_l2d_en_fill_clk_v0         (1'b1),
  .l2b_l2d_en_fill_clk_v1         (1'b1),
  .l2t_l2d_en_fill_clk_ov         (1'b1),
  .l2t_l2d_pwrsav_ov          (1'b1),
  .vnw_ary0                       (L2D_VNW0[ 3 ]),
  .vnw_ary1                       (L2D_VNW1[ 3 ]),
  .gclk		( cmp_gclk_c3_l2d3 ), // cmp_gclk_c1_r[5]),  
  .tcu_clk_stop ( gl_l2d3_clk_stop ),	// staged clk_stop
  .tcu_aclk		(tcu_aclk),
  .tcu_bclk		(tcu_bclk),
  .scan_in                  (l2d2_scan_out               ),
  .scan_out                 (l2d3_scan_out),
  .tcu_ce                   (1'b1                        ),
  .tcu_se_scancollar_in     (tcu_se_scancollar_in),
  .tcu_se_scancollar_out    (tcu_se_scancollar_out),
  .tcu_array_wr_inhibit     (tcu_array_wr_inhibit),
  .l2b_l2d_fuse_l2d_data_in (l2b3_l2d3_rvalue[ 9 : 0 ]),
  .l2b_l2d_fuse_rid         (l2b3_l2d3_rid[ 6 : 0 ]),
  .l2b_l2d_fuse_l2d_wren    (l2b3_l2d3_wr_en),
  .l2b_l2d_fuse_reset       (l2b3_l2d3_fuse_clr),
  .l2d_l2b_efc_fuse_data    (l2d3_l2b3_fuse_data[ 9 : 0 ]),     
  .l2b_l2d_fbdecc_c4        (l2b3_l2d3_fbdecc_c4[ 623 : 0 ]  ),// scdata
  .rst_por_                 ( gl_l2_por_c3b0 ), 	// ECO c3t0 -> c3b0 -mh157021
  .rst_wmr_                 ( gl_l2_wmr_c3b ), 		// ECO c3t0 -> c3b -mh157021
  .rst_wmr_protect                (rst_wmr_protect                 ),
  .l2t_l2d_col_offset_c2    (l2t3_l2d3_col_offset_c2[ 3 : 0 ]),
  .l2t_l2d_fb_hit_c3        (l2t3_l2d3_fb_hit_c3         ),
  .l2t_l2d_fbrd_c3          (l2t3_l2d3_fbrd_c3           ),
  .l2t_l2d_rd_wr_c2         (l2t3_l2d3_rd_wr_c2          ),
  .l2t_l2d_set_c2           (l2t3_l2d3_set_c2[ 8 : 0 ]       ),
  .l2t_l2d_stdecc_c2        (l2t3_l2d3_stdecc_c2[ 77 : 0 ]   ),
  .l2t_l2d_way_sel_c2       (l2t3_l2d3_way_sel_c2[ 15 : 0 ]  ),
  .l2t_l2d_word_en_c2       (l2t3_l2d3_word_en_c2[ 15 : 0 ]  ),
  .l2d_l2b_decc_out_c7      (l2d3_l2b3_decc_out_c7[ 623 : 0 ]),
  .l2d_l2t_decc_c6          (l2d3_l2t3_decc_c6[ 155 : 0 ]    ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_atpg_mode(tcu_atpg_mode)
        );
//________________________________________________________________

n2_l2d_sp_512kb_cust l2d4(

  .l2b_l2d_en_fill_clk_v0         (1'b1),
  .l2b_l2d_en_fill_clk_v1         (1'b1),
  .l2t_l2d_en_fill_clk_ov         (1'b1),
  .l2t_l2d_pwrsav_ov          (1'b1),
  .vnw_ary0                       (L2D_VNW0[ 4 ]),
  .vnw_ary1                       (L2D_VNW1[ 4 ]),
  .gclk		( cmp_gclk_c1_l2d4 ), // cmp_gclk_c3_r[0]),  
  .tcu_clk_stop ( gl_l2d4_clk_stop ),	// staged clk_stop
  .tcu_aclk		(tcu_aclk),
  .tcu_bclk		(tcu_bclk),
  .scan_in                  (l2t5_scan_out               ),
  .scan_out                 (l2d4_scan_out),
  .tcu_ce                   (1'b1),
  .tcu_se_scancollar_in     (tcu_se_scancollar_in),
  .tcu_se_scancollar_out    (tcu_se_scancollar_out),
  .tcu_array_wr_inhibit     (tcu_array_wr_inhibit),
  .l2b_l2d_fuse_l2d_data_in (l2b4_l2d4_rvalue[ 9 : 0 ]),
  .l2b_l2d_fuse_rid         (l2b4_l2d4_rid[ 6 : 0 ]),
  .l2b_l2d_fuse_l2d_wren    (l2b4_l2d4_wr_en),
  .l2b_l2d_fuse_reset       (l2b4_l2d4_fuse_clr),
  .l2d_l2b_efc_fuse_data    (l2d4_l2b4_fuse_data[ 9 : 0 ]),     
  .l2b_l2d_fbdecc_c4        (l2b4_l2d4_fbdecc_c4[ 623 : 0 ]  ),// scdata
  .rst_por_                 ( gl_l2_por_c1t ), 
  .rst_wmr_                 ( gl_l2_wmr_c1t ), 
  .rst_wmr_protect                (rst_wmr_protect                 ),
  .l2t_l2d_col_offset_c2    (l2t4_l2d4_col_offset_c2[ 3 : 0 ]),
  .l2t_l2d_fb_hit_c3        (l2t4_l2d4_fb_hit_c3         ),
  .l2t_l2d_fbrd_c3          (l2t4_l2d4_fbrd_c3           ),
  .l2t_l2d_rd_wr_c2         (l2t4_l2d4_rd_wr_c2          ),
  .l2t_l2d_set_c2           (l2t4_l2d4_set_c2[ 8 : 0 ]       ),
  .l2t_l2d_stdecc_c2        (l2t4_l2d4_stdecc_c2[ 77 : 0 ]   ),
  .l2t_l2d_way_sel_c2       (l2t4_l2d4_way_sel_c2[ 15 : 0 ]  ),
  .l2t_l2d_word_en_c2       (l2t4_l2d4_word_en_c2[ 15 : 0 ]  ),
  .l2d_l2b_decc_out_c7      (l2d4_l2b4_decc_out_c7[ 623 : 0 ]),
  .l2d_l2t_decc_c6          (l2d4_l2t4_decc_c6[ 155 : 0 ]    ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_atpg_mode(tcu_atpg_mode)
        );
//________________________________________________________________

n2_l2d_sp_512kb_cust l2d5(

  .l2b_l2d_en_fill_clk_v0         (1'b1),
  .l2b_l2d_en_fill_clk_v1         (1'b1),
  .l2t_l2d_en_fill_clk_ov         (1'b1),
  .l2t_l2d_pwrsav_ov          (1'b1),
  .vnw_ary0                       (L2D_VNW0[ 5 ]),
  .vnw_ary1                       (L2D_VNW1[ 5 ]),
  .gclk				( cmp_gclk_c1_l2d5 ), // cmp_gclk_c3_r[1]),  
  .tcu_clk_stop ( gl_l2d5_clk_stop ),	// staged clk_stop
  .tcu_aclk			(tcu_aclk),
  .tcu_bclk			(tcu_bclk),
  .tcu_ce                   (1'b1                        ),
  .tcu_se_scancollar_in     (tcu_se_scancollar_in),
  .tcu_se_scancollar_out    (tcu_se_scancollar_out),
  .tcu_array_wr_inhibit     (tcu_array_wr_inhibit),
  .scan_in                  (l2d4_scan_out               ),
  .scan_out                 (l2d5_scan_out),
  .l2b_l2d_fbdecc_c4        (l2b5_l2d5_fbdecc_c4[ 623 : 0 ]  ),// scdata
  .rst_por_                 ( gl_l2_por_c1t ), 
  .rst_wmr_                 ( gl_l2_wmr_c1t ), 	// ECO c1b -> c1t -mh157021
  .rst_wmr_protect                (rst_wmr_protect                 ),
  .l2t_l2d_col_offset_c2    (l2t5_l2d5_col_offset_c2[ 3 : 0 ]),
  .l2t_l2d_fb_hit_c3        (l2t5_l2d5_fb_hit_c3         ),
  .l2t_l2d_fbrd_c3          (l2t5_l2d5_fbrd_c3           ),
  .l2t_l2d_rd_wr_c2         (l2t5_l2d5_rd_wr_c2          ),
  .l2t_l2d_set_c2           (l2t5_l2d5_set_c2[ 8 : 0 ]       ),
  .l2t_l2d_stdecc_c2        (l2t5_l2d5_stdecc_c2[ 77 : 0 ]   ),
  .l2t_l2d_way_sel_c2       (l2t5_l2d5_way_sel_c2[ 15 : 0 ]  ),
  .l2t_l2d_word_en_c2       (l2t5_l2d5_word_en_c2[ 15 : 0 ]  ),
  .l2b_l2d_fuse_l2d_data_in (l2b5_l2d5_rvalue[ 9 : 0 ]),
  .l2b_l2d_fuse_rid         (l2b5_l2d5_rid[ 6 : 0 ]),
  .l2b_l2d_fuse_l2d_wren    (l2b5_l2d5_wr_en),
  .l2b_l2d_fuse_reset       (l2b5_l2d5_fuse_clr),
  .l2d_l2b_efc_fuse_data    (l2d5_l2b5_fuse_data[ 9 : 0 ]),     
  .l2d_l2b_decc_out_c7      (l2d5_l2b5_decc_out_c7[ 623 : 0 ]),
  .l2d_l2t_decc_c6          (l2d5_l2t5_decc_c6[ 155 : 0 ]    ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_atpg_mode(tcu_atpg_mode)
        );
//________________________________________________________________

n2_l2d_sp_512kb_cust l2d6(

  .l2b_l2d_en_fill_clk_v0         (1'b1),
  .l2b_l2d_en_fill_clk_v1         (1'b1),
  .l2t_l2d_en_fill_clk_ov         (1'b1),
  .l2t_l2d_pwrsav_ov          (1'b1),
  .vnw_ary0                       (L2D_VNW0[ 6 ]),
  .vnw_ary1                       (L2D_VNW1[ 6 ]),
  .gclk		( cmp_gclk_c1_l2d6 ), // cmp_gclk_c3_r[4]),  
  .tcu_clk_stop ( gl_l2d6_clk_stop ),	// staged clk_stop
  .tcu_aclk		(tcu_aclk),
  .tcu_bclk		(tcu_bclk),
  .tcu_ce                   (1'b1                        ),
  .tcu_se_scancollar_in     (tcu_se_scancollar_in),
  .tcu_se_scancollar_out    (tcu_se_scancollar_out),
  .tcu_array_wr_inhibit     (tcu_array_wr_inhibit),
  .scan_in                  (l2t7_scan_out               ),
  .scan_out                 (l2d6_scan_out),
  .l2b_l2d_fuse_l2d_data_in (l2b6_l2d6_rvalue[ 9 : 0 ]),
  .l2b_l2d_fuse_rid         (l2b6_l2d6_rid[ 6 : 0 ]),
  .l2b_l2d_fuse_l2d_wren    (l2b6_l2d6_wr_en),
  .l2b_l2d_fuse_reset       (l2b6_l2d6_fuse_clr),
  .l2d_l2b_efc_fuse_data    (l2d6_l2b6_fuse_data[ 9 : 0 ]),     
  .l2b_l2d_fbdecc_c4        (l2b6_l2d6_fbdecc_c4[ 623 : 0 ]  ),// scdata
  .rst_por_                 ( gl_l2_por_c1b ), // ECO c1t -> c1b - mh157021
  .rst_wmr_                 ( gl_l2_wmr_c1b ), 
  .rst_wmr_protect                (rst_wmr_protect                 ),
  .l2t_l2d_col_offset_c2    (l2t6_l2d6_col_offset_c2[ 3 : 0 ]),
  .l2t_l2d_fb_hit_c3        (l2t6_l2d6_fb_hit_c3         ),
  .l2t_l2d_fbrd_c3          (l2t6_l2d6_fbrd_c3           ),
  .l2t_l2d_rd_wr_c2         (l2t6_l2d6_rd_wr_c2          ),
  .l2t_l2d_set_c2           (l2t6_l2d6_set_c2[ 8 : 0 ]       ),
  .l2t_l2d_stdecc_c2        (l2t6_l2d6_stdecc_c2[ 77 : 0 ]   ),
  .l2t_l2d_way_sel_c2       (l2t6_l2d6_way_sel_c2[ 15 : 0 ]  ),
  .l2t_l2d_word_en_c2       (l2t6_l2d6_word_en_c2[ 15 : 0 ]  ),
  .l2d_l2b_decc_out_c7      (l2d6_l2b6_decc_out_c7[ 623 : 0 ]),
  .l2d_l2t_decc_c6          (l2d6_l2t6_decc_c6[ 155 : 0 ]    ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_atpg_mode(tcu_atpg_mode)
  );
//________________________________________________________________

n2_l2d_sp_512kb_cust l2d7(

  .l2b_l2d_en_fill_clk_v0         (1'b1),
  .l2b_l2d_en_fill_clk_v1         (1'b1),
  .l2t_l2d_en_fill_clk_ov         (1'b1),
  .l2t_l2d_pwrsav_ov          (1'b1),
  .vnw_ary0                       (L2D_VNW0[ 7 ]),
  .vnw_ary1                       (L2D_VNW1[ 7 ]),
  .gclk				( cmp_gclk_c1_l2d7 ), // cmp_gclk_c3_r[5]),  
  .tcu_clk_stop ( gl_l2d7_clk_stop ),	// staged clk_stop
  .tcu_aclk			(tcu_aclk),
  .tcu_bclk			(tcu_bclk),
  .tcu_ce                   (1'b1                        ),
  .tcu_se_scancollar_in     (tcu_se_scancollar_in),
  .tcu_se_scancollar_out    (tcu_se_scancollar_out),
  .tcu_array_wr_inhibit     (tcu_array_wr_inhibit),
  .scan_in                  (l2d6_scan_out               ),
  .scan_out                 (l2d7_scan_out),
  .l2b_l2d_fuse_l2d_data_in (l2b7_l2d7_rvalue[ 9 : 0 ]),
  .l2b_l2d_fuse_rid         (l2b7_l2d7_rid[ 6 : 0 ]),
  .l2b_l2d_fuse_l2d_wren    (l2b7_l2d7_wr_en),
  .l2b_l2d_fuse_reset       (l2b7_l2d7_fuse_clr),
  .l2d_l2b_efc_fuse_data    (l2d7_l2b7_fuse_data[ 9 : 0 ]),     
  .l2b_l2d_fbdecc_c4        (l2b7_l2d7_fbdecc_c4[ 623 : 0 ]  ),// scdata
  .rst_por_                 ( gl_l2_por_c1b ), // ECO c1t -> c1b - mh157021
  .rst_wmr_                 ( gl_l2_wmr_c1b ), 
  .rst_wmr_protect                (rst_wmr_protect                 ),
  .l2t_l2d_col_offset_c2    (l2t7_l2d7_col_offset_c2[ 3 : 0 ]),
  .l2t_l2d_fb_hit_c3        (l2t7_l2d7_fb_hit_c3         ),
  .l2t_l2d_fbrd_c3          (l2t7_l2d7_fbrd_c3           ),
  .l2t_l2d_rd_wr_c2         (l2t7_l2d7_rd_wr_c2          ),
  .l2t_l2d_set_c2           (l2t7_l2d7_set_c2[ 8 : 0 ]       ),
  .l2t_l2d_stdecc_c2        (l2t7_l2d7_stdecc_c2[ 77 : 0 ]   ),
  .l2t_l2d_way_sel_c2       (l2t7_l2d7_way_sel_c2[ 15 : 0 ]  ),
  .l2t_l2d_word_en_c2       (l2t7_l2d7_word_en_c2[ 15 : 0 ]  ),
  .l2d_l2b_decc_out_c7      (l2d7_l2b7_decc_out_c7[ 623 : 0 ]),
  .l2d_l2t_decc_c6          (l2d7_l2t7_decc_c6[ 155 : 0 ]    ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_atpg_mode(tcu_atpg_mode)
        );
//________________________________________________________________



/////// stagging flop

wire [ 191 : 0 ] unconnectedt0lff;
wire [ 191 : 0 ] unconnectedt1lff;
wire [ 191 : 0 ] unconnectedt2lff;
wire [ 191 : 0 ] unconnectedt3lff;
wire [ 191 : 0 ] unconnectedt4lff;
wire [ 191 : 0 ] unconnectedt5lff;
wire [ 191 : 0 ] unconnectedt6lff;
wire [ 191 : 0 ] unconnectedt7lff;
wire [ 191 : 0 ] unconnectedt0rff;
wire [ 191 : 0 ] unconnectedt1rff;
wire [ 191 : 0 ] unconnectedt2rff;
wire [ 191 : 0 ] unconnectedt3rff;
wire [ 191 : 0 ] unconnectedt4rff;
wire [ 191 : 0 ] unconnectedt5rff;
wire [ 191 : 0 ] unconnectedt6rff;
wire [ 191 : 0 ] unconnectedt7rff;

l2t l2t0(
.l2t_lstg_in		    ({
                              148'b0,
			      l2t1_mcu0_rd_req,
			      l2t1_mcu0_rd_dummy_req,
			      l2t1_mcu0_rd_req_id[ 2 : 0 ],
			      l2t1_mcu0_wr_req,
			      l2t1_mcu0_addr_5,
			      l2t1_mcu0_addr[ 39 : 31 ],
			      4'b0,
			      l2t1_mcu0_addr[ 30 : 7 ]}
                            ),
  .l2t_lstg_out		    ({
                              unconnectedt0lff[ 191 : 44 ],
			      l2t1_mcu0_rd_req_t0lff,
			      l2t1_mcu0_rd_dummy_req_t0lff,
			      l2t1_mcu0_rd_req_id_t0lff[ 2 : 0 ],
			      l2t1_mcu0_wr_req_t0lff,
			      l2t1_mcu0_addr_5_t0lff,
			      l2t1_mcu0_addr_t0lff[ 39 : 31 ],
			      unconnectedt0lff[ 27 : 24 ],
			      l2t1_mcu0_addr_t0lff[ 30 : 7 ]}
                            ),
//  .l2t_lstg_in		    (192'b0),
//  .l2t_lstg_out		    (unconnectedt0lff[191:0]),
//  .l2t_rstg_in		    (192'b0),
//  .l2t_rstg_out		    (unconnectedt0rff[191:0]),
  .l2t_rstg_in       	    ({111'b0,
                             l2b0_sio_parity[ 1 : 0 ],
                             79'b0
                             }
                            ),
  .l2t_rstg_out		    ({unconnectedt0rff[ 191 : 81 ],
                             l2b0_sio_parity_t0rff[ 1 : 0 ],
                             unconnectedt0rff[ 78 : 0 ]
                             }
                            ),
  .l2t_siu_delay	    (1'b0),
  .l2t_tcu_dmo_out_prev     (39'b0                       ), 
  .l2t_tcu_dmo_out          (l2t0_dmo_dout[ 38 : 0 ]         ),
  .tcu_l2t_coresel          (1'b0                        ),
  .tcu_l2t_tag_or_data_sel  (dmo_tagmuxctl               ),
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c3t ),
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c3t ),
  .l2t_dbg_sii_iq_dequeue   (l2t0_dbg0_sii_iq_dequeue	 ),
  .l2t_dbg_sii_wib_dequeue  (l2t0_dbg0_sii_wib_dequeue 	 ),
  .l2t_dbg_xbar_vcid	    (l2t0_dbg0_xbar_vcid[ 5 : 0 ]	 ),
  .l2t_dbg_err_event	    (l2t0_dbg0_err_event		 ),
  .l2t_dbg_pa_match	    (l2t0_dbg0_pa_match		 ),
  .l2t_cpx_req_cq           (sctag0_cpx_req_cq[ 7 : 0 ]      ),// sctag
  .l2t_cpx_atom_cq          (sctag0_cpx_atom_cq          ),
  .l2t_cpx_data_ca          (sctag0_cpx_data_ca[ 145 : 0 ]),
  .l2t_pcx_stall_pq         (sctag0_pcx_stall_pq         ),
  .pcx_l2t_data_rdy_px1     (pcx_sctag0_data_rdy_px1     ),
  .pcx_l2t_data_px2         (pcx_sctag0_data_px2[ 129 : 0 ]),
  .pcx_l2t_atm_px1          (pcx_sctag0_atm_px1          ),
  .cpx_l2t_grant_cx         (cpx_sctag0_grant_cx[ 7 : 0 ]    ),
  .l2t_rst_fatal_error      (l2t0_rst_fatal_error        ),
  .rst_wmr_protect                (rst_wmr_protect                 ),
  .l2t_l2d_way_sel_c2       (l2t0_l2d0_way_sel_c2        ),
  .l2t_l2d_rd_wr_c2         (l2t0_l2d0_rd_wr_c2          ),
  .l2t_l2d_set_c2           (l2t0_l2d0_set_c2[ 8 : 0 ]       ),
  .l2t_l2d_col_offset_c2    (l2t0_l2d0_col_offset_c2[ 3 : 0 ]),
  .l2t_l2d_word_en_c2       (l2t0_l2d0_word_en_c2        ),
  .l2t_l2d_fbrd_c3          (l2t0_l2d0_fbrd_c3           ),
  .l2t_l2d_fb_hit_c3        (l2t0_l2d0_fb_hit_c3         ),
  .l2t_l2d_stdecc_c2        (l2t0_l2d0_stdecc_c2[ 77 : 0 ]         ),
  .l2d_l2t_decc_c6          (l2d0_l2t0_decc_c6           ),
//  .l2t_l2b_stdecc_c3        (l2t0_l2b0_stdecc_c3[77:0]   ),
  .l2t_l2b_fbrd_en_c3       (l2t0_l2b0_fbrd_en_c3        ),
  .l2t_l2b_fbrd_wl_c3       (l2t0_l2b0_fbrd_wl_c3[ 2 : 0 ]   ),
  .l2t_l2b_fbwr_wen_r2      (l2t0_l2b0_fbwr_wen_r2[ 15 : 0 ] ),
  .l2t_l2b_fbwr_wl_r2       (l2t0_l2b0_fbwr_wl_r2[ 2 : 0 ]   ),
  .l2t_l2b_fbd_stdatasel_c3 (l2t0_l2b0_fbd_stdatasel_c3  ),
  .l2t_l2b_wbwr_wen_c6      (l2t0_l2b0_wbwr_wen_c6[ 3 : 0 ]  ),
  .l2t_l2b_wbwr_wl_c6       (l2t0_l2b0_wbwr_wl_c6[ 2 : 0 ]   ),
  .l2t_l2b_wbrd_en_r0       (l2t0_l2b0_wbrd_en_r0        ),
  .l2t_l2b_wbrd_wl_r0       (l2t0_l2b0_wbrd_wl_r0[ 2 : 0 ]   ),
  .l2t_l2b_ev_dword_r0      (l2t0_l2b0_ev_dword_r0[ 2 : 0 ]  ),
  .l2t_l2b_evict_en_r0      (l2t0_l2b0_evict_en_r0       ),
  .l2b_l2t_ev_uerr_r5       (l2b0_l2t0_ev_uerr_r5        ),
  .l2b_l2t_ev_cerr_r5       (l2b0_l2t0_ev_cerr_r5        ),
  .l2t_l2b_rdma_wren_s2     (l2t0_l2b0_rdma_wren_s2[ 15 : 0 ]),
  .l2t_l2b_rdma_wrwl_s2     (l2t0_l2b0_rdma_wrwl_s2[ 1 : 0 ] ),
  .l2t_l2b_rdma_rdwl_r0     (l2t0_l2b0_rdma_rdwl_r0[ 1 : 0 ] ),
  .l2t_l2b_rdma_rden_r0     (l2t0_l2b0_rdma_rden_r0      ),
  .l2t_l2b_ctag_en_c7       (l2t0_l2b0_ctag_en_c7        ),
  .l2t_l2b_ctag_c7          (l2t0_l2b0_ctag_c7[ 31 : 0 ]     ),
  .l2t_l2b_word_c7          (l2t0_l2b0_word_c7[ 3 : 0 ]      ),
  .l2t_l2b_req_en_c7        (l2t0_l2b0_req_en_c7         ),
  .l2t_l2b_word_vld_c7      (l2t0_l2b0_word_vld_c7       ),
  .l2b_l2t_rdma_uerr_c10    (l2b0_l2t0_rdma_uerr_c10     ),
  .l2b_l2t_rdma_cerr_c10    (l2b0_l2t0_rdma_cerr_c10     ),
  .l2b_l2t_rdma_notdata_c10 (l2b0_l2t0_rdma_notdata_c10  ),
  .l2t_mcu_rd_req           (l2t0_mcu0_rd_req            ),
  .l2t_mcu_rd_dummy_req     (l2t0_mcu0_rd_dummy_req      ),
  .l2t_mcu_rd_req_id        (l2t0_mcu0_rd_req_id[ 2 : 0 ]    ),
  .l2t_mcu_addr             (l2t0_mcu0_addr[ 39 : 7 ]        ),
  .l2t_mcu_addr_5           (l2t0_mcu0_addr_5            ),
  .l2t_mcu_wr_req           (l2t0_mcu0_wr_req            ),
  .mcu_l2t_rd_ack           (mcu0_l2t0_rd_ack            ),
  .mcu_l2t_wr_ack           (mcu0_l2t0_wr_ack            ),
  .mcu_l2t_chunk_id_r0      (mcu0_l2t0_qword_id_r0[ 1 : 0 ]  ),
  .mcu_l2t_data_vld_r0      (mcu0_l2t0_data_vld_r0       ),
  .mcu_l2t_rd_req_id_r0     (mcu0_l2t0_rd_req_id_r0[ 2 : 0 ] ),
  .mcu_l2t_secc_err_r2      (mcu0_l2t0_secc_err_r2       ),
  .mcu_l2t_mecc_err_r2      (mcu0_l2t0_mecc_err_r2       ),
  .mcu_l2t_scb_mecc_err     (mcu0_l2t0_scb_mecc_err      ),
  .mcu_l2t_scb_secc_err     (mcu0_l2t0_scb_secc_err      ),
  .sii_l2t_req_vld          (sii_l2t0_req_vld            ),
  .sii_l2t_req              (sii_l2t0_req[ 31 : 0 ]          ),
  .sii_l2b_ecc              (sii_l2b0_ecc[ 6 : 0 ]           ),
  .l2t_sii_iq_dequeue       (l2t0_sii_iq_dequeue         ),
  .l2t_sii_wib_dequeue      (l2t0_sii_wib_dequeue        ),
  .rst_por_                 ( gl_l2_por_c3t ), 
  .rst_wmr_                 ( gl_l2_wmr_c3t ), 
  .scan_in                  (tcu_soc0_scan_out           ),
  .scan_out                 (l2t0_scan_out               ),
  .efu_l2t_fuse_clr          (efu_l2t0_fuse_clr          ),                       
  .efu_l2t_fuse_xfer_en      (efu_l2t0_fuse_xfer_en      ),                       
  .efu_l2t_fuse_data         (efu_l2t0246_fuse_data      ),                       
  .l2t_efu_fuse_data         (l2t0_efu_fuse_data         ),                       
  .l2t_efu_fuse_xfer_en      (l2t0_efu_fuse_xfer_en      ),                       
  .tcu_mbist_bisi_en              (tcu_mbist_bisi_en),
  .tcu_l2t_mbist_start            (tcu_l2t0_mbist_start_t1lff),
  .tcu_l2t_mbist_scan_in          (tcu_l2t0_mbist_scan_in),
  .l2t_tcu_mbist_done             (l2t0_tcu_mbist_done),
  .l2t_tcu_mbist_fail             (l2t0_tcu_mbist_fail),
  .l2t_tcu_mbist_scan_out         (l2t0_tcu_mbist_scan_out),
  .gclk                      	  ( cmp_gclk_c3_l2t0 ), // cmp_gclk_c1_r[2]            ), 
  .tcu_clk_stop ( gl_l2t0_clk_stop ),	// staged clk_stop
  .tcu_l2t_shscan_scan_in         (tcu_l2t0_shscan_scan_in ),
  .tcu_l2t_shscan_aclk            (tcu_l2t_shscan_aclk    ),
  .tcu_l2t_shscan_bclk            (tcu_l2t_shscan_bclk    ),
  .tcu_l2t_shscan_scan_en         (tcu_l2t_shscan_scan_en ),
  .tcu_l2t_shscan_pce_ov          (tcu_l2t_shscan_pce_ov  ),
  .l2t_tcu_shscan_scan_out        (l2t0_tcu_shscan_scan_out),
  .tcu_l2t_shscan_clk_stop        (tcu_l2t0_shscan_clk_stop),
  .vnw_ary                            (L2T_VNW[ 0 ]),
  .l2t_rep_in0                        (24'b0),
  .l2t_rep_in1                        (24'b0),
  .l2t_rep_in2                        (24'b0),
  .l2t_rep_in3                        (24'b0),
  .l2t_rep_in4                        (24'b0),
  .l2t_rep_in5                        (24'b0),
  .l2t_rep_in6                        (24'b0),
  .l2t_rep_in7                        (24'b0),
  .l2t_rep_in8                        (24'b0),
  .l2t_rep_in9                        (24'b0),
  .l2t_rep_in10                       (24'b0),
  .l2t_rep_in11                       (24'b0),
  .l2t_rep_in12                       (24'b0),
  .l2t_rep_in13                       (24'b0),
  .l2t_rep_in14                       (24'b0),
  .l2t_rep_in15                       (24'b0),
  .l2t_rep_in16                       (24'b0),
  .l2t_rep_in17                       (24'b0),
  .l2t_rep_in18                       (24'b0),
  .l2t_rep_in19                       (24'b0),
  .l2t_rep_out0                       (l2t0_rep_out0_unused[ 23 : 0 ]),
  .l2t_rep_out1                       (l2t0_rep_out1_unused[ 23 : 0 ]),
  .l2t_rep_out2                       (l2t0_rep_out2_unused[ 23 : 0 ]),
  .l2t_rep_out3                       (l2t0_rep_out3_unused[ 23 : 0 ]),
  .l2t_rep_out4                       (l2t0_rep_out4_unused[ 23 : 0 ]),
  .l2t_rep_out5                       (l2t0_rep_out5_unused[ 23 : 0 ]),
  .l2t_rep_out6                       (l2t0_rep_out6_unused[ 23 : 0 ]),
  .l2t_rep_out7                       (l2t0_rep_out7_unused[ 23 : 0 ]),
  .l2t_rep_out8                       (l2t0_rep_out8_unused[ 23 : 0 ]),
  .l2t_rep_out9                       (l2t0_rep_out9_unused[ 23 : 0 ]),
  .l2t_rep_out10                      (l2t0_rep_out10_unused[ 23 : 0 ]),
  .l2t_rep_out11                      (l2t0_rep_out11_unused[ 23 : 0 ]),
  .l2t_rep_out12                      (l2t0_rep_out12_unused[ 23 : 0 ]),
  .l2t_rep_out13                      (l2t0_rep_out13_unused[ 23 : 0 ]),
  .l2t_rep_out14                      (l2t0_rep_out14_unused[ 23 : 0 ]),
  .l2t_rep_out15                      (l2t0_rep_out15_unused[ 23 : 0 ]),
  .l2t_rep_out16                      (l2t0_rep_out16_unused[ 23 : 0 ]),
  .l2t_rep_out17                      (l2t0_rep_out17_unused[ 23 : 0 ]),
  .l2t_rep_out18                      (l2t0_rep_out18_unused[ 23 : 0 ]),
  .l2t_rep_out19                      (l2t0_rep_out19_unused[ 23 : 0 ]),
  .ncu_l2t_pm(ncu_l2t_pm),
  .ncu_l2t_ba01(ncu_l2t_ba01),
  .ncu_l2t_ba23(ncu_l2t_ba23),
  .ncu_l2t_ba45(ncu_l2t_ba45),
  .ncu_l2t_ba67(ncu_l2t_ba67),
  .ncu_spc0_core_enable_status(ncu_spc0_core_enable_status),
  .ncu_spc1_core_enable_status(ncu_spc1_core_enable_status),
  .ncu_spc2_core_enable_status(ncu_spc2_core_enable_status),
  .ncu_spc3_core_enable_status(ncu_spc3_core_enable_status),
  .ncu_spc4_core_enable_status(ncu_spc4_core_enable_status),
  .ncu_spc5_core_enable_status(ncu_spc5_core_enable_status),
  .ncu_spc6_core_enable_status(ncu_spc6_core_enable_status),
  .ncu_spc7_core_enable_status(ncu_spc7_core_enable_status),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_array_bypass(tcu_array_bypass),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_user_mode(tcu_mbist_user_mode)
        );
//________________________________________________________________

/////// stagging flop

//assign

l2t l2t1(
  .l2t_lstg_in		    (
                             {5'b0,
                              1'b0, tcu_ncu_mbist_start[ 0 ],
                              59'b0,
                              l2t4_sii_iq_dequeue,
                              l2t4_sii_wib_dequeue,
                              l2t5_sii_iq_dequeue,
                              l2t5_sii_wib_dequeue,
                              48'b0,
                              tcu_l2t0_mbist_start,
			      tcu_spc_mbist_start[ 0 ],
			      tcu_ss_request[ 0 ],
			      6'b0,
                              tcu_mcu0_mbist_start,
			      tcu_mcu1_mbist_start,
			      63'b0}
                            ),
  .l2t_rstg_in		    (
                             {77'b0,
                              l2b0_sio_data[ 31 : 0 ],
//                              l2b0_sio_parity[1:0],
                              l2b0_sio_ctag_vld,
                              l2b0_sio_ue_err,
			      25'b0,
                              mcu0_l2t1_rd_ack,
                              mcu0_l2t1_wr_ack,
                              mcu0_l2t1_qword_id_r0[ 1 : 0 ],
                              mcu0_l2t1_data_vld_r0,
                              mcu0_l2t1_rd_req_id_r0[ 2 : 0 ],
                              mcu0_l2t1_secc_err_r2,
                              mcu0_l2t1_mecc_err_r2,
                              mcu0_l2t1_scb_mecc_err,
                              mcu0_l2t1_scb_secc_err,
			      44'b0}
                            ),
  .l2t_lstg_out		    (
                             {unconnectedt1lff[ 191 : 186 ],
                              tcu_ncu_mbist_start_t1lff_0,
                              unconnectedt1lff[  184  :  126  ],
                              l2t4_sii_iq_dequeue_t1lff,
                              l2t4_sii_wib_dequeue_t1lff,
                              l2t5_sii_iq_dequeue_t1lff,
                              l2t5_sii_wib_dequeue_t1lff,
                              unconnectedt1lff[  121  :  74  ],
			      tcu_l2t0_mbist_start_t1lff,
                              tcu_spc0_mbist_start_t1lff_0,
                              tcu_ss_request_t1lff_0,
                              unconnectedt1lff[ 70 : 65 ],
                              tcu_mcu0_mbist_start_t1lff,
                              tcu_mcu1_mbist_start_t1lff,
                              unconnectedt1lff_t1lff[ 62 : 0 ]
                             }
                            ),
  .l2t_rstg_out		   (
                            {unconnectedt1rff[ 191 : 115 ],
			     l2b0_sio_data_t1rff[ 31 : 0 ],
//                             l2b0_sio_parity_t1rff[1:0],
                             l2b0_sio_ctag_vld_t1rff,
                             l2b0_sio_ue_err_t1rff,
			     unconnectedt1rff[ 80 : 56 ],
                             mcu0_l2t1_rd_ack_t1rff,
                             mcu0_l2t1_wr_ack_t1rff,
                             mcu0_l2t1_qword_id_r0_t1rff[ 1 : 0 ],
                             mcu0_l2t1_data_vld_r0_t1rff,
                             mcu0_l2t1_rd_req_id_r0_t1rff[ 2 : 0 ],
                             mcu0_l2t1_secc_err_r2_t1rff,
                             mcu0_l2t1_mecc_err_r2_t1rff,
                             mcu0_l2t1_scb_mecc_err_t1rff,
                             mcu0_l2t1_scb_secc_err_t1rff,
			     unconnectedt1rff[ 43 : 0 ]}
                           ),
  .l2t_siu_delay	    (1'b0),
  .l2t_tcu_dmo_out_prev     (l2t0_dmo_dout[ 38 : 0 ]         ), 
  .l2t_tcu_dmo_out          (l2t1_dmo_dout[ 38 : 0 ]         ),
  .tcu_l2t_coresel          (dmo_l2tsel[ 5 ]               ),
  .tcu_l2t_tag_or_data_sel  (dmo_tagmuxctl               ),
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c2t ), 
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c2t ),
  .l2t_dbg_sii_iq_dequeue   (l2t1_dbg1_sii_iq_dequeue	 ),
  .l2t_dbg_sii_wib_dequeue  (l2t1_dbg1_sii_wib_dequeue 	 ),
  .l2t_dbg_xbar_vcid	    (l2t1_dbg1_xbar_vcid[ 5 : 0 ]	 ),
  .l2t_dbg_err_event	    (l2t1_dbg1_err_event		 ),
  .l2t_dbg_pa_match	    (l2t1_dbg1_pa_match		 ),
  .l2t_cpx_req_cq           (sctag1_cpx_req_cq[ 7 : 0 ]      ),// sctag
  .l2t_cpx_atom_cq          (sctag1_cpx_atom_cq          ),
  .l2t_cpx_data_ca          (sctag1_cpx_data_ca[ 145 : 0 ]),
  .l2t_pcx_stall_pq         (sctag1_pcx_stall_pq         ),
  .pcx_l2t_data_rdy_px1     (pcx_sctag1_data_rdy_px1     ),
  .pcx_l2t_data_px2         (pcx_sctag1_data_px2[ 129 : 0 ]),
  .pcx_l2t_atm_px1          (pcx_sctag1_atm_px1          ),
  .cpx_l2t_grant_cx         (cpx_sctag1_grant_cx[ 7 : 0 ]    ),
  .l2t_rst_fatal_error      (l2t1_rst_fatal_error),
  .rst_wmr_protect                (rst_wmr_protect                 ),
  .l2t_l2d_way_sel_c2       (l2t1_l2d1_way_sel_c2        ),
  .l2t_l2d_rd_wr_c2         (l2t1_l2d1_rd_wr_c2          ),
  .l2t_l2d_set_c2           (l2t1_l2d1_set_c2[ 8 : 0 ]       ),
  .l2t_l2d_col_offset_c2    (l2t1_l2d1_col_offset_c2[ 3 : 0 ]),
  .l2t_l2d_word_en_c2       (l2t1_l2d1_word_en_c2        ),
  .l2t_l2d_fbrd_c3          (l2t1_l2d1_fbrd_c3           ),
  .l2t_l2d_fb_hit_c3        (l2t1_l2d1_fb_hit_c3         ),
  .l2t_l2d_stdecc_c2        (l2t1_l2d1_stdecc_c2[ 77 : 0 ]         ),
  .l2d_l2t_decc_c6          (l2d1_l2t1_decc_c6           ),
 // .l2t_l2b_stdecc_c3        (l2t1_l2b1_stdecc_c3[77:0]   ),
  .l2t_l2b_fbrd_en_c3       (l2t1_l2b1_fbrd_en_c3        ),
  .l2t_l2b_fbrd_wl_c3       (l2t1_l2b1_fbrd_wl_c3[ 2 : 0 ]   ),
  .l2t_l2b_fbwr_wen_r2      (l2t1_l2b1_fbwr_wen_r2[ 15 : 0 ] ),
  .l2t_l2b_fbwr_wl_r2       (l2t1_l2b1_fbwr_wl_r2[ 2 : 0 ]   ),
  .l2t_l2b_fbd_stdatasel_c3 (l2t1_l2b1_fbd_stdatasel_c3  ),
  .l2t_l2b_wbwr_wen_c6      (l2t1_l2b1_wbwr_wen_c6[ 3 : 0 ]  ),
  .l2t_l2b_wbwr_wl_c6       (l2t1_l2b1_wbwr_wl_c6[ 2 : 0 ]   ),
  .l2t_l2b_wbrd_en_r0       (l2t1_l2b1_wbrd_en_r0        ),
  .l2t_l2b_wbrd_wl_r0       (l2t1_l2b1_wbrd_wl_r0[ 2 : 0 ]   ),
  .l2t_l2b_ev_dword_r0      (l2t1_l2b1_ev_dword_r0[ 2 : 0 ]  ),
  .l2t_l2b_evict_en_r0      (l2t1_l2b1_evict_en_r0       ),
  .l2b_l2t_ev_uerr_r5       (l2b1_l2t1_ev_uerr_r5        ),
  .l2b_l2t_ev_cerr_r5       (l2b1_l2t1_ev_cerr_r5        ),
  .l2t_l2b_rdma_wren_s2     (l2t1_l2b1_rdma_wren_s2[ 15 : 0 ]),
  .l2t_l2b_rdma_wrwl_s2     (l2t1_l2b1_rdma_wrwl_s2[ 1 : 0 ] ),
  .l2t_l2b_rdma_rdwl_r0     (l2t1_l2b1_rdma_rdwl_r0[ 1 : 0 ] ),
  .l2t_l2b_rdma_rden_r0     (l2t1_l2b1_rdma_rden_r0      ),
  .l2t_l2b_ctag_en_c7       (l2t1_l2b1_ctag_en_c7        ),
  .l2t_l2b_ctag_c7          (l2t1_l2b1_ctag_c7[ 31 : 0 ]     ),
  .l2t_l2b_word_c7          (l2t1_l2b1_word_c7[ 3 : 0 ]      ),
  .l2t_l2b_req_en_c7        (l2t1_l2b1_req_en_c7         ),
  .l2t_l2b_word_vld_c7      (l2t1_l2b1_word_vld_c7       ),
  .l2b_l2t_rdma_uerr_c10    (l2b1_l2t1_rdma_uerr_c10     ),
  .l2b_l2t_rdma_cerr_c10    (l2b1_l2t1_rdma_cerr_c10     ),
  .l2b_l2t_rdma_notdata_c10 (l2b1_l2t1_rdma_notdata_c10  ),
  .l2t_mcu_rd_req           (l2t1_mcu0_rd_req            ),
  .l2t_mcu_rd_dummy_req     (l2t1_mcu0_rd_dummy_req      ),
  .l2t_mcu_rd_req_id        (l2t1_mcu0_rd_req_id[ 2 : 0 ]    ),
  .l2t_mcu_addr             (l2t1_mcu0_addr[ 39 : 7 ]        ),
  .l2t_mcu_addr_5           (l2t1_mcu0_addr_5            ),
  .l2t_mcu_wr_req           (l2t1_mcu0_wr_req            ),
  .mcu_l2t_rd_ack           (mcu0_l2t1_rd_ack_t1rff            ),
  .mcu_l2t_wr_ack           (mcu0_l2t1_wr_ack_t1rff            ),
  .mcu_l2t_chunk_id_r0      (mcu0_l2t1_qword_id_r0_t1rff[ 1 : 0 ]  ),
  .mcu_l2t_data_vld_r0      (mcu0_l2t1_data_vld_r0_t1rff       ),
  .mcu_l2t_rd_req_id_r0     (mcu0_l2t1_rd_req_id_r0_t1rff[ 2 : 0 ] ),
  .mcu_l2t_secc_err_r2      (mcu0_l2t1_secc_err_r2_t1rff       ),
  .mcu_l2t_mecc_err_r2      (mcu0_l2t1_mecc_err_r2_t1rff       ),
  .mcu_l2t_scb_mecc_err     (mcu0_l2t1_scb_mecc_err_t1rff      ),
  .mcu_l2t_scb_secc_err     (mcu0_l2t1_scb_secc_err_t1rff      ),
  .sii_l2t_req_vld          (sii_l2t1_req_vld            ),
  .sii_l2t_req              (sii_l2t1_req[ 31 : 0 ]          ),
  .sii_l2b_ecc              (sii_l2b1_ecc[ 6 : 0 ]           ),
  .l2t_sii_iq_dequeue       (l2t1_sii_iq_dequeue         ),
  .l2t_sii_wib_dequeue      (l2t1_sii_wib_dequeue        ),
  .scan_out                 (l2t1_scan_out               ),
  .rst_por_                 ( gl_l2_por_c2t ), 
  .rst_wmr_                 ( gl_l2_wmr_c2t ), 
  .scan_in                  (l2t0_scan_out               ),
  .efu_l2t_fuse_clr          (efu_l2t1_fuse_clr          ),                       
  .efu_l2t_fuse_xfer_en      (efu_l2t1_fuse_xfer_en      ),                       
  .efu_l2t_fuse_data         (efu_l2t1357_fuse_data         ),                       
  .l2t_efu_fuse_data         (l2t1_efu_fuse_data         ),                       
  .l2t_efu_fuse_xfer_en      (l2t1_efu_fuse_xfer_en      ),                       
  .tcu_mbist_bisi_en              (tcu_mbist_bisi_en),
  .tcu_l2t_mbist_start            (tcu_l2t1_mbist_start),
  .tcu_l2t_mbist_scan_in          (tcu_l2t1_mbist_scan_in),
  .l2t_tcu_mbist_done             (l2t1_tcu_mbist_done),
  .l2t_tcu_mbist_fail             (l2t1_tcu_mbist_fail),
  .l2t_tcu_mbist_scan_out         (l2t1_tcu_mbist_scan_out),
  .gclk                     ( cmp_gclk_c2_l2t1 ), // cmp_gclk_c1_r[2]            ), 
  .tcu_clk_stop ( gl_l2t1_clk_stop ),	// staged clk_stop
  .tcu_l2t_shscan_scan_in         (tcu_l2t1_shscan_scan_in ),
  .tcu_l2t_shscan_aclk            (tcu_l2t_shscan_aclk    ),
  .tcu_l2t_shscan_bclk            (tcu_l2t_shscan_bclk    ),
  .tcu_l2t_shscan_scan_en         (tcu_l2t_shscan_scan_en ),
  .tcu_l2t_shscan_pce_ov          (tcu_l2t_shscan_pce_ov  ),
  .l2t_tcu_shscan_scan_out        (l2t1_tcu_shscan_scan_out),
  .tcu_l2t_shscan_clk_stop        (tcu_l2t1_shscan_clk_stop),
  .vnw_ary                            (L2T_VNW[ 1 ]),
  .l2t_rep_in0                        (24'b0),
  .l2t_rep_in1                        (24'b0),
  .l2t_rep_in2                        (24'b0),
  .l2t_rep_in3                        (24'b0),
  .l2t_rep_in4                        (24'b0),
  .l2t_rep_in5                        (24'b0),
  .l2t_rep_in6                        (24'b0),
  .l2t_rep_in7                        (24'b0),
  .l2t_rep_in8                        (24'b0),
  .l2t_rep_in9                        (24'b0),
  .l2t_rep_in10                       (24'b0),
  .l2t_rep_in11                       (24'b0),
  .l2t_rep_in12                       (24'b0),
  .l2t_rep_in13                       (24'b0),
  .l2t_rep_in14                       (24'b0),
  .l2t_rep_in15                       (24'b0),
  .l2t_rep_in16                       (24'b0),
  .l2t_rep_in17                       (24'b0),
  .l2t_rep_in18                       (24'b0),
  .l2t_rep_in19                       (24'b0),
  .l2t_rep_out0                       (l2t1_rep_out0_unused[ 23 : 0 ]),
  .l2t_rep_out1                       (l2t1_rep_out1_unused[ 23 : 0 ]),
  .l2t_rep_out2                       (l2t1_rep_out2_unused[ 23 : 0 ]),
  .l2t_rep_out3                       (l2t1_rep_out3_unused[ 23 : 0 ]),
  .l2t_rep_out4                       (l2t1_rep_out4_unused[ 23 : 0 ]),
  .l2t_rep_out5                       (l2t1_rep_out5_unused[ 23 : 0 ]),
  .l2t_rep_out6                       (l2t1_rep_out6_unused[ 23 : 0 ]),
  .l2t_rep_out7                       (l2t1_rep_out7_unused[ 23 : 0 ]),
  .l2t_rep_out8                       (l2t1_rep_out8_unused[ 23 : 0 ]),
  .l2t_rep_out9                       (l2t1_rep_out9_unused[ 23 : 0 ]),
  .l2t_rep_out10                      (l2t1_rep_out10_unused[ 23 : 0 ]),
  .l2t_rep_out11                      (l2t1_rep_out11_unused[ 23 : 0 ]),
  .l2t_rep_out12                      (l2t1_rep_out12_unused[ 23 : 0 ]),
  .l2t_rep_out13                      (l2t1_rep_out13_unused[ 23 : 0 ]),
  .l2t_rep_out14                      (l2t1_rep_out14_unused[ 23 : 0 ]),
  .l2t_rep_out15                      (l2t1_rep_out15_unused[ 23 : 0 ]),
  .l2t_rep_out16                      (l2t1_rep_out16_unused[ 23 : 0 ]),
  .l2t_rep_out17                      (l2t1_rep_out17_unused[ 23 : 0 ]),
  .l2t_rep_out18                      (l2t1_rep_out18_unused[ 23 : 0 ]),
  .l2t_rep_out19                      (l2t1_rep_out19_unused[ 23 : 0 ]),
  .ncu_l2t_pm(ncu_l2t_pm),
  .ncu_l2t_ba01(ncu_l2t_ba01),
  .ncu_l2t_ba23(ncu_l2t_ba23),
  .ncu_l2t_ba45(ncu_l2t_ba45),
  .ncu_l2t_ba67(ncu_l2t_ba67),
  .ncu_spc0_core_enable_status(ncu_spc0_core_enable_status),
  .ncu_spc1_core_enable_status(ncu_spc1_core_enable_status),
  .ncu_spc2_core_enable_status(ncu_spc2_core_enable_status),
  .ncu_spc3_core_enable_status(ncu_spc3_core_enable_status),
  .ncu_spc4_core_enable_status(ncu_spc4_core_enable_status),
  .ncu_spc5_core_enable_status(ncu_spc5_core_enable_status),
  .ncu_spc6_core_enable_status(ncu_spc6_core_enable_status),
  .ncu_spc7_core_enable_status(ncu_spc7_core_enable_status),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_array_bypass(tcu_array_bypass),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_user_mode(tcu_mbist_user_mode)
        );
//________________________________________________________________

/////// stagging flop

//assign

l2t l2t2(
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c3b ), 
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c3b ),
.l2t_lstg_in		    ({
                              148'b0,
                              l2t3_mcu1_rd_req,
                              l2t3_mcu1_rd_dummy_req,
                              l2t3_mcu1_rd_req_id[ 2 : 0 ],
                              l2t3_mcu1_wr_req,
                              l2t3_mcu1_addr_5,
                              l2t3_mcu1_addr[ 39 : 31 ],
                              4'b0,
                              l2t3_mcu1_addr[ 30 : 7 ]}
                            ),
  .l2t_lstg_out		    ({
                              unconnectedt2lff[ 191 : 44 ],
                              l2t3_mcu1_rd_req_t2lff,
                              l2t3_mcu1_rd_dummy_req_t2lff,
                              l2t3_mcu1_rd_req_id_t2lff[ 2 : 0 ],
                              l2t3_mcu1_wr_req_t2lff,
                              l2t3_mcu1_addr_5_t2lff,
                              l2t3_mcu1_addr_t2lff[ 39 : 31 ],
                              unconnectedt2lff[ 27 : 24 ],
                              l2t3_mcu1_addr_t2lff[ 30 : 7 ]}
                            ),
//  .l2t_lstg_in		    (192'b0),
//  .l2t_lstg_out		    (unconnectedt2lff[191:0]),
  .l2t_rstg_in		    (192'b0),
  .l2t_rstg_out		    (unconnectedt2rff[ 191 : 0 ]),
  .l2t_siu_delay	    (1'b0),
  .l2t_tcu_dmo_out_prev     (39'b0                       ), 
  .l2t_tcu_dmo_out          (l2t2_dmo_dout[ 38 : 0 ]         ),
  .tcu_l2t_coresel          (1'b0                        ),
  .tcu_l2t_tag_or_data_sel  (dmo_tagmuxctl               ),
  .l2t_dbg_sii_iq_dequeue   (l2t2_dbg0_sii_iq_dequeue	 ),
  .l2t_dbg_sii_wib_dequeue  (l2t2_dbg0_sii_wib_dequeue 	 ),
  .l2t_dbg_xbar_vcid	    (l2t2_dbg0_xbar_vcid[ 5 : 0 ]	 ),
  .l2t_dbg_err_event	    (l2t2_dbg0_err_event		 ),
  .l2t_dbg_pa_match	    (l2t2_dbg0_pa_match		 ),
  .l2t_cpx_req_cq           (sctag2_cpx_req_cq[ 7 : 0 ]      ),// sctag
  .l2t_cpx_atom_cq          (sctag2_cpx_atom_cq          ),
  .l2t_cpx_data_ca          (sctag2_cpx_data_ca[ 145 : 0 ]),
  .l2t_pcx_stall_pq         (sctag2_pcx_stall_pq         ),
  .pcx_l2t_data_rdy_px1     (pcx_sctag2_data_rdy_px1     ),
  .pcx_l2t_data_px2         (pcx_sctag2_data_px2[ 129 : 0 ]),
  .pcx_l2t_atm_px1          (pcx_sctag2_atm_px1          ),
  .cpx_l2t_grant_cx         (cpx_sctag2_grant_cx[ 7 : 0 ]    ),
  .l2t_rst_fatal_error      (l2t2_rst_fatal_error),
  .rst_wmr_protect                (rst_wmr_protect                 ),
  .l2t_l2d_way_sel_c2       (l2t2_l2d2_way_sel_c2        ),
  .l2t_l2d_rd_wr_c2         (l2t2_l2d2_rd_wr_c2          ),
  .l2t_l2d_set_c2           (l2t2_l2d2_set_c2[ 8 : 0 ]       ),
  .l2t_l2d_col_offset_c2    (l2t2_l2d2_col_offset_c2[ 3 : 0 ]),
  .l2t_l2d_word_en_c2       (l2t2_l2d2_word_en_c2        ),
  .l2t_l2d_fbrd_c3          (l2t2_l2d2_fbrd_c3           ),
  .l2t_l2d_fb_hit_c3        (l2t2_l2d2_fb_hit_c3         ),
  .l2t_l2d_stdecc_c2        (l2t2_l2d2_stdecc_c2[ 77 : 0 ]         ),
  .l2d_l2t_decc_c6          (l2d2_l2t2_decc_c6           ),
 // .l2t_l2b_stdecc_c3        (l2t2_l2b2_stdecc_c3[77:0]   ),
  .l2t_l2b_fbrd_en_c3       (l2t2_l2b2_fbrd_en_c3        ),
  .l2t_l2b_fbrd_wl_c3       (l2t2_l2b2_fbrd_wl_c3[ 2 : 0 ]   ),
  .l2t_l2b_fbwr_wen_r2      (l2t2_l2b2_fbwr_wen_r2[ 15 : 0 ] ),
  .l2t_l2b_fbwr_wl_r2       (l2t2_l2b2_fbwr_wl_r2[ 2 : 0 ]   ),
  .l2t_l2b_fbd_stdatasel_c3 (l2t2_l2b2_fbd_stdatasel_c3  ),
  .l2t_l2b_wbwr_wen_c6      (l2t2_l2b2_wbwr_wen_c6[ 3 : 0 ]  ),
  .l2t_l2b_wbwr_wl_c6       (l2t2_l2b2_wbwr_wl_c6[ 2 : 0 ]   ),
  .l2t_l2b_wbrd_en_r0       (l2t2_l2b2_wbrd_en_r0        ),
  .l2t_l2b_wbrd_wl_r0       (l2t2_l2b2_wbrd_wl_r0[ 2 : 0 ]   ),
  .l2t_l2b_ev_dword_r0      (l2t2_l2b2_ev_dword_r0[ 2 : 0 ]  ),
  .l2t_l2b_evict_en_r0      (l2t2_l2b2_evict_en_r0       ),
  .l2b_l2t_ev_uerr_r5       (l2b2_l2t2_ev_uerr_r5        ),
  .l2b_l2t_ev_cerr_r5       (l2b2_l2t2_ev_cerr_r5        ),
  .l2t_l2b_rdma_wren_s2     (l2t2_l2b2_rdma_wren_s2[ 15 : 0 ]),
  .l2t_l2b_rdma_wrwl_s2     (l2t2_l2b2_rdma_wrwl_s2[ 1 : 0 ] ),
  .l2t_l2b_rdma_rdwl_r0     (l2t2_l2b2_rdma_rdwl_r0[ 1 : 0 ] ),
  .l2t_l2b_rdma_rden_r0     (l2t2_l2b2_rdma_rden_r0      ),
  .l2t_l2b_ctag_en_c7       (l2t2_l2b2_ctag_en_c7        ),
  .l2t_l2b_ctag_c7          (l2t2_l2b2_ctag_c7[ 31 : 0 ]     ),
  .l2t_l2b_word_c7          (l2t2_l2b2_word_c7[ 3 : 0 ]      ),
  .l2t_l2b_req_en_c7        (l2t2_l2b2_req_en_c7         ),
  .l2t_l2b_word_vld_c7      (l2t2_l2b2_word_vld_c7       ),
  .l2b_l2t_rdma_uerr_c10    (l2b2_l2t2_rdma_uerr_c10     ),
  .l2b_l2t_rdma_cerr_c10    (l2b2_l2t2_rdma_cerr_c10     ),
  .l2b_l2t_rdma_notdata_c10 (l2b2_l2t2_rdma_notdata_c10  ),
  .l2t_mcu_rd_req           (l2t2_mcu1_rd_req            ),
  .l2t_mcu_rd_dummy_req     (l2t2_mcu1_rd_dummy_req      ),
  .l2t_mcu_rd_req_id        (l2t2_mcu1_rd_req_id[ 2 : 0 ]    ),
  .l2t_mcu_addr             (l2t2_mcu1_addr[ 39 : 7 ]        ),
  .l2t_mcu_addr_5           (l2t2_mcu1_addr_5            ),
  .l2t_mcu_wr_req           (l2t2_mcu1_wr_req            ),
  .mcu_l2t_rd_ack           (mcu1_l2t2_rd_ack            ),
  .mcu_l2t_wr_ack           (mcu1_l2t2_wr_ack            ),
  .mcu_l2t_chunk_id_r0      (mcu1_l2t2_qword_id_r0[ 1 : 0 ]  ),
  .mcu_l2t_data_vld_r0      (mcu1_l2t2_data_vld_r0       ),
  .mcu_l2t_rd_req_id_r0     (mcu1_l2t2_rd_req_id_r0[ 2 : 0 ] ),
  .mcu_l2t_secc_err_r2      (mcu1_l2t2_secc_err_r2       ),
  .mcu_l2t_mecc_err_r2      (mcu1_l2t2_mecc_err_r2       ),
  .mcu_l2t_scb_mecc_err     (mcu1_l2t2_scb_mecc_err      ),
  .mcu_l2t_scb_secc_err     (mcu1_l2t2_scb_secc_err      ),
  .sii_l2t_req_vld          (sii_l2t2_req_vld            ),
  .sii_l2t_req              (sii_l2t2_req[ 31 : 0 ]          ),
  .sii_l2b_ecc              (sii_l2b2_ecc[ 6 : 0 ]           ),
  .l2t_sii_iq_dequeue       (l2t2_sii_iq_dequeue         ),
  .l2t_sii_wib_dequeue      (l2t2_sii_wib_dequeue        ),
  .rst_por_                 ( gl_l2_por_c3b0 ), 
  .rst_wmr_                 ( gl_l2_wmr_c3b ), 
  .scan_in                  (tcu_soc1_scan_out           ),
  .scan_out                 (l2t2_scan_out               ),
  .tcu_mbist_bisi_en        (tcu_mbist_bisi_en           ),
  .tcu_l2t_mbist_start      (tcu_l2t2_mbist_start_t3lff),
  .tcu_l2t_mbist_scan_in    (tcu_l2t2_mbist_scan_in      ),
  .l2t_tcu_mbist_done       (l2t2_tcu_mbist_done),
  .l2t_tcu_mbist_fail       (l2t2_tcu_mbist_fail),
  .l2t_tcu_mbist_scan_out   (l2t2_tcu_mbist_scan_out     ),
  .efu_l2t_fuse_clr          (efu_l2t2_fuse_clr          ),                       
  .efu_l2t_fuse_xfer_en      (efu_l2t2_fuse_xfer_en      ),                       
  .efu_l2t_fuse_data         (efu_l2t0246_fuse_data         ),                       
  .l2t_efu_fuse_data         (l2t2_efu_fuse_data         ),                       
  .l2t_efu_fuse_xfer_en      (l2t2_efu_fuse_xfer_en      ),                       
  .gclk                     ( cmp_gclk_c3_l2t2 ), // cmp_gclk_c1_r[5] ), 
  .tcu_clk_stop ( gl_l2t2_clk_stop ),	// staged clk_stop
  .tcu_l2t_shscan_scan_in         (tcu_l2t2_shscan_scan_in ),
  .tcu_l2t_shscan_aclk            (tcu_l2t_shscan_aclk    ),
  .tcu_l2t_shscan_bclk            (tcu_l2t_shscan_bclk    ),
  .tcu_l2t_shscan_scan_en         (tcu_l2t_shscan_scan_en ),
  .tcu_l2t_shscan_pce_ov          (tcu_l2t_shscan_pce_ov  ),
  .l2t_tcu_shscan_scan_out        (l2t2_tcu_shscan_scan_out),
  .tcu_l2t_shscan_clk_stop        (tcu_l2t2_shscan_clk_stop),
  .vnw_ary                            (L2T_VNW[ 2 ]),
  .l2t_rep_in0                        (24'b0),
  .l2t_rep_in1                        (24'b0),
  .l2t_rep_in2                        (24'b0),
  .l2t_rep_in3                        (24'b0),
  .l2t_rep_in4                        (24'b0),
  .l2t_rep_in5                        (24'b0),
  .l2t_rep_in6                        (24'b0),
  .l2t_rep_in7                        (24'b0),
  .l2t_rep_in8                        (24'b0),
  .l2t_rep_in9                        (24'b0),
  .l2t_rep_in10                       (24'b0),
  .l2t_rep_in11                       (24'b0),
  .l2t_rep_in12                       (24'b0),
  .l2t_rep_in13                       (24'b0),
  .l2t_rep_in14                       (24'b0),
  .l2t_rep_in15                       (24'b0),
  .l2t_rep_in16                       (24'b0),
  .l2t_rep_in17                       (24'b0),
  .l2t_rep_in18                       (24'b0),
  .l2t_rep_in19                       (24'b0),
  .l2t_rep_out0                       (l2t2_rep_out0_unused[ 23 : 0 ]),
  .l2t_rep_out1                       (l2t2_rep_out1_unused[ 23 : 0 ]),
  .l2t_rep_out2                       (l2t2_rep_out2_unused[ 23 : 0 ]),
  .l2t_rep_out3                       (l2t2_rep_out3_unused[ 23 : 0 ]),
  .l2t_rep_out4                       (l2t2_rep_out4_unused[ 23 : 0 ]),
  .l2t_rep_out5                       (l2t2_rep_out5_unused[ 23 : 0 ]),
  .l2t_rep_out6                       (l2t2_rep_out6_unused[ 23 : 0 ]),
  .l2t_rep_out7                       (l2t2_rep_out7_unused[ 23 : 0 ]),
  .l2t_rep_out8                       (l2t2_rep_out8_unused[ 23 : 0 ]),
  .l2t_rep_out9                       (l2t2_rep_out9_unused[ 23 : 0 ]),
  .l2t_rep_out10                      (l2t2_rep_out10_unused[ 23 : 0 ]),
  .l2t_rep_out11                      (l2t2_rep_out11_unused[ 23 : 0 ]),
  .l2t_rep_out12                      (l2t2_rep_out12_unused[ 23 : 0 ]),
  .l2t_rep_out13                      (l2t2_rep_out13_unused[ 23 : 0 ]),
  .l2t_rep_out14                      (l2t2_rep_out14_unused[ 23 : 0 ]),
  .l2t_rep_out15                      (l2t2_rep_out15_unused[ 23 : 0 ]),
  .l2t_rep_out16                      (l2t2_rep_out16_unused[ 23 : 0 ]),
  .l2t_rep_out17                      (l2t2_rep_out17_unused[ 23 : 0 ]),
  .l2t_rep_out18                      (l2t2_rep_out18_unused[ 23 : 0 ]),
  .l2t_rep_out19                      (l2t2_rep_out19_unused[ 23 : 0 ]),
  .ncu_l2t_pm(ncu_l2t_pm),
  .ncu_l2t_ba01(ncu_l2t_ba01),
  .ncu_l2t_ba23(ncu_l2t_ba23),
  .ncu_l2t_ba45(ncu_l2t_ba45),
  .ncu_l2t_ba67(ncu_l2t_ba67),
  .ncu_spc0_core_enable_status(ncu_spc0_core_enable_status),
  .ncu_spc1_core_enable_status(ncu_spc1_core_enable_status),
  .ncu_spc2_core_enable_status(ncu_spc2_core_enable_status),
  .ncu_spc3_core_enable_status(ncu_spc3_core_enable_status),
  .ncu_spc4_core_enable_status(ncu_spc4_core_enable_status),
  .ncu_spc5_core_enable_status(ncu_spc5_core_enable_status),
  .ncu_spc6_core_enable_status(ncu_spc6_core_enable_status),
  .ncu_spc7_core_enable_status(ncu_spc7_core_enable_status),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_array_bypass(tcu_array_bypass),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_user_mode(tcu_mbist_user_mode)
        );
//________________________________________________________________

/////// stagging flop

//assign

l2t l2t3(
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c2b ), 
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c2b ),
  .l2t_lstg_in		    (
                           { 66'b0,
                              l2t6_sii_iq_dequeue,
                              l2t6_sii_wib_dequeue,
                              l2t7_sii_iq_dequeue,
                              l2t7_sii_wib_dequeue,
                              48'b0,
                              tcu_l2t2_mbist_start,
			      tcu_spc_mbist_start[ 2 ],
			      tcu_ss_request[ 2 ],
			      71'b0
                             }
                            ),
  .l2t_rstg_in		    (
                             {136'b0,
                              mcu1_l2t3_rd_ack,
                              mcu1_l2t3_wr_ack,
                              mcu1_l2t3_qword_id_r0[ 1 : 0 ],
                              mcu1_l2t3_data_vld_r0,
                              mcu1_l2t3_rd_req_id_r0[ 2 : 0 ],
                              mcu1_l2t3_secc_err_r2,
                              mcu1_l2t3_mecc_err_r2,
                              mcu1_l2t3_scb_mecc_err,
                              mcu1_l2t3_scb_secc_err,
                              44'b0
                             }
                            ),
  .l2t_lstg_out		    (
                             {unconnectedt3lff[ 191 : 126 ],
                              l2t6_sii_iq_dequeue_t3lff,
                              l2t6_sii_wib_dequeue_t3lff,
                              l2t7_sii_iq_dequeue_t3lff,
                              l2t7_sii_wib_dequeue_t3lff,
                              unconnectedt3lff[ 121 : 74 ],
                              tcu_l2t2_mbist_start_t3lff,
                              tcu_spc_mbist_start_t3lff_2,
                              tcu_ss_request_t3lff_2,
                              unconnectedt3lff[ 70 : 0 ]
                             }
                            ),
  .l2t_rstg_out		    (
                             {unconnectedt3rff[ 191 : 56 ],
                              mcu1_l2t3_rd_ack_t3rff,
                              mcu1_l2t3_wr_ack_t3rff,
                              mcu1_l2t3_qword_id_r0_t3rff[ 1 : 0 ],
                              mcu1_l2t3_data_vld_r0_t3rff,
                              mcu1_l2t3_rd_req_id_r0_t3rff[ 2 : 0 ],
                              mcu1_l2t3_secc_err_r2_t3rff,
                              mcu1_l2t3_mecc_err_r2_t3rff,
                              mcu1_l2t3_scb_mecc_err_t3rff,
                              mcu1_l2t3_scb_secc_err_t3rff,
                              unconnectedt3rff[ 43 : 0 ]
                             }
                            ),
  .l2t_siu_delay	    (1'b0),
  .l2t_tcu_dmo_out_prev     (l2t2_dmo_dout[ 38 : 0 ]         ), 
  .l2t_tcu_dmo_out          (l2t3_dmo_dout[ 38 : 0 ]         ),
  .tcu_l2t_coresel          (dmo_l2tsel[ 2 ]               ),
  .tcu_l2t_tag_or_data_sel  (dmo_tagmuxctl               ),
  .l2t_dbg_sii_iq_dequeue   (l2t3_dbg1_sii_iq_dequeue	 ),
  .l2t_dbg_sii_wib_dequeue  (l2t3_dbg1_sii_wib_dequeue 	 ),
  .l2t_dbg_xbar_vcid	    (l2t3_dbg1_xbar_vcid[ 5 : 0 ]	 ),
  .l2t_dbg_err_event	    (l2t3_dbg1_err_event		 ),
  .l2t_dbg_pa_match	    (l2t3_dbg1_pa_match		 ),
  .l2t_cpx_req_cq           (sctag3_cpx_req_cq[ 7 : 0 ]      ),// sctag
  .l2t_cpx_atom_cq          (sctag3_cpx_atom_cq          ),
  .l2t_cpx_data_ca          (sctag3_cpx_data_ca[ 145 : 0 ]),
  .l2t_pcx_stall_pq         (sctag3_pcx_stall_pq         ),
  .pcx_l2t_data_rdy_px1     (pcx_sctag3_data_rdy_px1     ),
  .pcx_l2t_data_px2         (pcx_sctag3_data_px2[ 129 : 0 ]),
  .pcx_l2t_atm_px1          (pcx_sctag3_atm_px1          ),
  .cpx_l2t_grant_cx         (cpx_sctag3_grant_cx[ 7 : 0 ]    ),
  .l2t_rst_fatal_error      (l2t3_rst_fatal_error),
  .rst_wmr_protect                (rst_wmr_protect                 ),
  .l2t_l2d_way_sel_c2       (l2t3_l2d3_way_sel_c2        ),
  .l2t_l2d_rd_wr_c2         (l2t3_l2d3_rd_wr_c2          ),
  .l2t_l2d_set_c2           (l2t3_l2d3_set_c2[ 8 : 0 ]       ),
  .l2t_l2d_col_offset_c2    (l2t3_l2d3_col_offset_c2[ 3 : 0 ]),
  .l2t_l2d_word_en_c2       (l2t3_l2d3_word_en_c2        ),
  .l2t_l2d_fbrd_c3          (l2t3_l2d3_fbrd_c3           ),
  .l2t_l2d_fb_hit_c3        (l2t3_l2d3_fb_hit_c3         ),
  .l2t_l2d_stdecc_c2        (l2t3_l2d3_stdecc_c2[ 77 : 0 ]         ),
  .l2d_l2t_decc_c6          (l2d3_l2t3_decc_c6           ),
 // .l2t_l2b_stdecc_c3        (l2t3_l2b3_stdecc_c3[77:0]   ),
  .l2t_l2b_fbrd_en_c3       (l2t3_l2b3_fbrd_en_c3        ),
  .l2t_l2b_fbrd_wl_c3       (l2t3_l2b3_fbrd_wl_c3[ 2 : 0 ]   ),
  .l2t_l2b_fbwr_wen_r2      (l2t3_l2b3_fbwr_wen_r2[ 15 : 0 ] ),
  .l2t_l2b_fbwr_wl_r2       (l2t3_l2b3_fbwr_wl_r2[ 2 : 0 ]   ),
  .l2t_l2b_fbd_stdatasel_c3 (l2t3_l2b3_fbd_stdatasel_c3  ),
  .l2t_l2b_wbwr_wen_c6      (l2t3_l2b3_wbwr_wen_c6[ 3 : 0 ]  ),
  .l2t_l2b_wbwr_wl_c6       (l2t3_l2b3_wbwr_wl_c6[ 2 : 0 ]   ),
  .l2t_l2b_wbrd_en_r0       (l2t3_l2b3_wbrd_en_r0        ),
  .l2t_l2b_wbrd_wl_r0       (l2t3_l2b3_wbrd_wl_r0[ 2 : 0 ]   ),
  .l2t_l2b_ev_dword_r0      (l2t3_l2b3_ev_dword_r0[ 2 : 0 ]  ),
  .l2t_l2b_evict_en_r0      (l2t3_l2b3_evict_en_r0       ),
  .l2b_l2t_ev_uerr_r5       (l2b3_l2t3_ev_uerr_r5        ),
  .l2b_l2t_ev_cerr_r5       (l2b3_l2t3_ev_cerr_r5        ),
  .l2t_l2b_rdma_wren_s2     (l2t3_l2b3_rdma_wren_s2[ 15 : 0 ]),
  .l2t_l2b_rdma_wrwl_s2     (l2t3_l2b3_rdma_wrwl_s2[ 1 : 0 ] ),
  .l2t_l2b_rdma_rdwl_r0     (l2t3_l2b3_rdma_rdwl_r0[ 1 : 0 ] ),
  .l2t_l2b_rdma_rden_r0     (l2t3_l2b3_rdma_rden_r0      ),
  .l2t_l2b_ctag_en_c7       (l2t3_l2b3_ctag_en_c7        ),
  .l2t_l2b_ctag_c7          (l2t3_l2b3_ctag_c7[ 31 : 0 ]     ),
  .l2t_l2b_word_c7          (l2t3_l2b3_word_c7[ 3 : 0 ]      ),
  .l2t_l2b_req_en_c7        (l2t3_l2b3_req_en_c7         ),
  .l2t_l2b_word_vld_c7      (l2t3_l2b3_word_vld_c7       ),
  .l2b_l2t_rdma_uerr_c10    (l2b3_l2t3_rdma_uerr_c10     ),
  .l2b_l2t_rdma_cerr_c10    (l2b3_l2t3_rdma_cerr_c10     ),
  .l2b_l2t_rdma_notdata_c10 (l2b3_l2t3_rdma_notdata_c10  ),
  .l2t_mcu_rd_req           (l2t3_mcu1_rd_req            ),
  .l2t_mcu_rd_dummy_req     (l2t3_mcu1_rd_dummy_req      ),
  .l2t_mcu_rd_req_id        (l2t3_mcu1_rd_req_id[ 2 : 0 ]    ),
  .l2t_mcu_addr             (l2t3_mcu1_addr[ 39 : 7 ]        ),
  .l2t_mcu_addr_5           (l2t3_mcu1_addr_5            ),
  .l2t_mcu_wr_req           (l2t3_mcu1_wr_req            ),
  .mcu_l2t_rd_ack           (mcu1_l2t3_rd_ack_t3rff            ),
  .mcu_l2t_wr_ack           (mcu1_l2t3_wr_ack_t3rff            ),
  .mcu_l2t_chunk_id_r0      (mcu1_l2t3_qword_id_r0_t3rff[ 1 : 0 ]  ),
  .mcu_l2t_data_vld_r0      (mcu1_l2t3_data_vld_r0_t3rff       ),
  .mcu_l2t_rd_req_id_r0     (mcu1_l2t3_rd_req_id_r0_t3rff[ 2 : 0 ] ),
  .mcu_l2t_secc_err_r2      (mcu1_l2t3_secc_err_r2_t3rff       ),
  .mcu_l2t_mecc_err_r2      (mcu1_l2t3_mecc_err_r2_t3rff       ),
  .mcu_l2t_scb_mecc_err     (mcu1_l2t3_scb_mecc_err_t3rff      ),
  .mcu_l2t_scb_secc_err     (mcu1_l2t3_scb_secc_err_t3rff      ),
  .sii_l2t_req_vld          (sii_l2t3_req_vld            ),
  .sii_l2t_req              (sii_l2t3_req[ 31 : 0 ]          ),
  .sii_l2b_ecc              (sii_l2b3_ecc[ 6 : 0 ]           ),
  .l2t_sii_iq_dequeue       (l2t3_sii_iq_dequeue         ),
  .l2t_sii_wib_dequeue      (l2t3_sii_wib_dequeue        ),
  .rst_por_                 ( gl_l2_por_c2b ), 
  .rst_wmr_                 ( gl_l2_wmr_c2b ), 
  .scan_in                  (l2t2_scan_out               ),
  .scan_out                 (l2t3_scan_out               ),
  .tcu_mbist_bisi_en         (tcu_mbist_bisi_en           ),
  .tcu_l2t_mbist_start       (tcu_l2t3_mbist_start),
  .tcu_l2t_mbist_scan_in     (tcu_l2t3_mbist_scan_in      ),
  .l2t_tcu_mbist_done        (l2t3_tcu_mbist_done),
  .l2t_tcu_mbist_fail        (l2t3_tcu_mbist_fail),
  .l2t_tcu_mbist_scan_out    (l2t3_tcu_mbist_scan_out     ),
  .efu_l2t_fuse_clr          (efu_l2t3_fuse_clr          ),                       
  .efu_l2t_fuse_xfer_en      (efu_l2t3_fuse_xfer_en      ),                       
  .efu_l2t_fuse_data         (efu_l2t1357_fuse_data         ),                       
  .l2t_efu_fuse_data         (l2t3_efu_fuse_data         ),                       
  .l2t_efu_fuse_xfer_en      (l2t3_efu_fuse_xfer_en      ),                       
  .gclk                     ( cmp_gclk_c2_l2t3 ), // cmp_gclk_c1_r[5]), 
  .tcu_clk_stop ( gl_l2t3_clk_stop ),	// staged clk_stop
  .tcu_l2t_shscan_scan_in         (tcu_l2t3_shscan_scan_in ),
  .tcu_l2t_shscan_aclk            (tcu_l2t_shscan_aclk    ),
  .tcu_l2t_shscan_bclk            (tcu_l2t_shscan_bclk    ),
  .tcu_l2t_shscan_scan_en         (tcu_l2t_shscan_scan_en ),
  .tcu_l2t_shscan_pce_ov          (tcu_l2t_shscan_pce_ov  ),
  .l2t_tcu_shscan_scan_out        (l2t3_tcu_shscan_scan_out),
  .tcu_l2t_shscan_clk_stop        (tcu_l2t3_shscan_clk_stop),
  .vnw_ary                            (L2T_VNW[ 3 ]),
  .l2t_rep_in0                        (24'b0),
  .l2t_rep_in1                        (24'b0),
  .l2t_rep_in2                        (24'b0),
  .l2t_rep_in3                        (24'b0),
  .l2t_rep_in4                        (24'b0),
  .l2t_rep_in5                        (24'b0),
  .l2t_rep_in6                        (24'b0),
  .l2t_rep_in7                        (24'b0),
  .l2t_rep_in8                        (24'b0),
  .l2t_rep_in9                        (24'b0),
  .l2t_rep_in10                       (24'b0),
  .l2t_rep_in11                       (24'b0),
  .l2t_rep_in12                       (24'b0),
  .l2t_rep_in13                       (24'b0),
  .l2t_rep_in14                       (24'b0),
  .l2t_rep_in15                       (24'b0),
  .l2t_rep_in16                       (24'b0),
  .l2t_rep_in17                       (24'b0),
  .l2t_rep_in18                       (24'b0),
  .l2t_rep_in19                       (24'b0),
  .l2t_rep_out0                       (l2t3_rep_out0_unused[ 23 : 0 ]),
  .l2t_rep_out1                       (l2t3_rep_out1_unused[ 23 : 0 ]),
  .l2t_rep_out2                       (l2t3_rep_out2_unused[ 23 : 0 ]),
  .l2t_rep_out3                       (l2t3_rep_out3_unused[ 23 : 0 ]),
  .l2t_rep_out4                       (l2t3_rep_out4_unused[ 23 : 0 ]),
  .l2t_rep_out5                       (l2t3_rep_out5_unused[ 23 : 0 ]),
  .l2t_rep_out6                       (l2t3_rep_out6_unused[ 23 : 0 ]),
  .l2t_rep_out7                       (l2t3_rep_out7_unused[ 23 : 0 ]),
  .l2t_rep_out8                       (l2t3_rep_out8_unused[ 23 : 0 ]),
  .l2t_rep_out9                       (l2t3_rep_out9_unused[ 23 : 0 ]),
  .l2t_rep_out10                      (l2t3_rep_out10_unused[ 23 : 0 ]),
  .l2t_rep_out11                      (l2t3_rep_out11_unused[ 23 : 0 ]),
  .l2t_rep_out12                      (l2t3_rep_out12_unused[ 23 : 0 ]),
  .l2t_rep_out13                      (l2t3_rep_out13_unused[ 23 : 0 ]),
  .l2t_rep_out14                      (l2t3_rep_out14_unused[ 23 : 0 ]),
  .l2t_rep_out15                      (l2t3_rep_out15_unused[ 23 : 0 ]),
  .l2t_rep_out16                      (l2t3_rep_out16_unused[ 23 : 0 ]),
  .l2t_rep_out17                      (l2t3_rep_out17_unused[ 23 : 0 ]),
  .l2t_rep_out18                      (l2t3_rep_out18_unused[ 23 : 0 ]),
  .l2t_rep_out19                      (l2t3_rep_out19_unused[ 23 : 0 ]),
  .ncu_l2t_pm(ncu_l2t_pm),
  .ncu_l2t_ba01(ncu_l2t_ba01),
  .ncu_l2t_ba23(ncu_l2t_ba23),
  .ncu_l2t_ba45(ncu_l2t_ba45),
  .ncu_l2t_ba67(ncu_l2t_ba67),
  .ncu_spc0_core_enable_status(ncu_spc0_core_enable_status),
  .ncu_spc1_core_enable_status(ncu_spc1_core_enable_status),
  .ncu_spc2_core_enable_status(ncu_spc2_core_enable_status),
  .ncu_spc3_core_enable_status(ncu_spc3_core_enable_status),
  .ncu_spc4_core_enable_status(ncu_spc4_core_enable_status),
  .ncu_spc5_core_enable_status(ncu_spc5_core_enable_status),
  .ncu_spc6_core_enable_status(ncu_spc6_core_enable_status),
  .ncu_spc7_core_enable_status(ncu_spc7_core_enable_status),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_array_bypass(tcu_array_bypass),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_user_mode(tcu_mbist_user_mode)
        );
//________________________________________________________________

/////// stagging flop

//assign

l2t l2t4(
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c1t ), 
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c1t ),
  .l2t_lstg_in		    (
                             {sii_l2t4_req[ 31 : 0 ],
                              sii_l2t4_req_vld,
			      sii_l2t5_req[ 31 : 0 ],
                              sii_l2t5_req_vld,
			      4'b0,
                              sii_l2b4_ecc[ 6 : 0 ],
			      l2b0_sio_data_t1rff[ 31 : 0 ],
//                              l2b0_sio_parity_t1rff[1:0],
                              l2b0_sio_ctag_vld_t1rff,
                              l2b0_sio_ue_err_t1rff,
			      37'b0,
                              l2t5_mcu2_rd_req,
                              l2t5_mcu2_rd_dummy_req,
                              l2t5_mcu2_rd_req_id[ 2 : 0 ],
                              l2t5_mcu2_wr_req,
                              l2t5_mcu2_addr_5,
                              l2t5_mcu2_addr[ 39 : 31 ],
                              4'b0,
			      l2t5_mcu2_addr[ 30 : 7 ]
                             }
                            ),
  .l2t_rstg_in		    (
                             {77'b0,
                              l2b4_sio_data[ 31 : 0 ],
                              l2b4_sio_parity[ 1 : 0 ],
                              l2b4_sio_ctag_vld,
                              l2b4_sio_ue_err,
                              79'b0
                             }
                            ),
  .l2t_lstg_out		    (
                             {sii_l2t4_req_t4lff[ 31 : 0 ],
                              sii_l2t4_req_vld_t4lff,
                              sii_l2t5_req_t4lff[ 31 : 0 ],
                              sii_l2t5_req_vld_t4lff,
                              unconnectedt4lff[ 125 : 122 ],
                              sii_l2b4_ecc_t4lff[ 6 : 0 ],
                              l2b0_sio_data_t4lff[ 31 : 0 ],
//                              l2b0_sio_parity_t4lff[1:0],
                              l2b0_sio_ctag_vld_t4lff,
                              l2b0_sio_ue_err_t4lff,
                              unconnectedt4lff[ 80 : 44 ],
                              l2t5_mcu2_rd_req_t4lff,
                              l2t5_mcu2_rd_dummy_req_t4lff,
                              l2t5_mcu2_rd_req_id_t4lff[ 2 : 0 ],
                              l2t5_mcu2_wr_req_t4lff,
                              l2t5_mcu2_addr_5_t4lff,
                              l2t5_mcu2_addr_t4lff[ 39 : 31 ],
                              unconnectedt4lff[ 27 : 24 ],
			      l2t5_mcu2_addr_t4lff[ 30 : 7 ]
                             }
                            ),
  .l2t_rstg_out		    (
                             {unconnectedt4rff[ 191 : 115 ],
                              l2b4_sio_data_t4rff[ 31 : 0 ],
                              l2b4_sio_parity_t4rff[ 1 : 0 ],
                              l2b4_sio_ctag_vld_t4rff,
                              l2b4_sio_ue_err_t4rff,
                              unconnectedt4rff[ 78 : 0 ]
                             }
                            ),
  .l2t_siu_delay	    (1'b0),
  .l2t_tcu_dmo_out_prev     (l2t5_dmo_dout[ 38 : 0 ]         ), 
  .l2t_tcu_dmo_out          (l2t4_dmo_dout[ 38 : 0 ]         ),
  .tcu_l2t_coresel          (dmo_l2tsel[ 3 ]               ),
  .tcu_l2t_tag_or_data_sel  (dmo_tagmuxctl               ),
  .l2t_dbg_sii_iq_dequeue   (l2t4_dbg1_sii_iq_dequeue	 ),
  .l2t_dbg_sii_wib_dequeue  (l2t4_dbg1_sii_wib_dequeue 	 ),
  .l2t_dbg_xbar_vcid	    (l2t4_dbg1_xbar_vcid[ 5 : 0 ]	 ),
  .l2t_dbg_err_event	    (l2t4_dbg1_err_event		 ),
  .l2t_dbg_pa_match	    (l2t4_dbg1_pa_match		 ),
  .l2t_cpx_req_cq           (sctag4_cpx_req_cq[ 7 : 0 ]      ),// sctag
  .l2t_cpx_atom_cq          (sctag4_cpx_atom_cq          ),
  .l2t_cpx_data_ca          (sctag4_cpx_data_ca[ 145 : 0 ]),
  .l2t_pcx_stall_pq         (sctag4_pcx_stall_pq         ),
  .pcx_l2t_data_rdy_px1     (pcx_sctag4_data_rdy_px1     ),
  .pcx_l2t_data_px2         (pcx_sctag4_data_px2[ 129 : 0 ]),
  .pcx_l2t_atm_px1          (pcx_sctag4_atm_px1          ),
  .cpx_l2t_grant_cx         (cpx_sctag4_grant_cx[ 7 : 0 ]    ),
  .l2t_rst_fatal_error      (l2t4_rst_fatal_error),
  .rst_wmr_protect                (rst_wmr_protect                 ),
  .l2t_l2d_way_sel_c2       (l2t4_l2d4_way_sel_c2        ),
  .l2t_l2d_rd_wr_c2         (l2t4_l2d4_rd_wr_c2          ),
  .l2t_l2d_set_c2           (l2t4_l2d4_set_c2[ 8 : 0 ]       ),
  .l2t_l2d_col_offset_c2    (l2t4_l2d4_col_offset_c2[ 3 : 0 ]),
  .l2t_l2d_word_en_c2       (l2t4_l2d4_word_en_c2        ),
  .l2t_l2d_fbrd_c3          (l2t4_l2d4_fbrd_c3           ),
  .l2t_l2d_fb_hit_c3        (l2t4_l2d4_fb_hit_c3         ),
  .l2t_l2d_stdecc_c2        (l2t4_l2d4_stdecc_c2[ 77 : 0 ]         ),
  .l2d_l2t_decc_c6          (l2d4_l2t4_decc_c6           ),
 // .l2t_l2b_stdecc_c3        (l2t4_l2b4_stdecc_c3[77:0]   ),
  .l2t_l2b_fbrd_en_c3       (l2t4_l2b4_fbrd_en_c3        ),
  .l2t_l2b_fbrd_wl_c3       (l2t4_l2b4_fbrd_wl_c3[ 2 : 0 ]   ),
  .l2t_l2b_fbwr_wen_r2      (l2t4_l2b4_fbwr_wen_r2[ 15 : 0 ] ),
  .l2t_l2b_fbwr_wl_r2       (l2t4_l2b4_fbwr_wl_r2[ 2 : 0 ]   ),
  .l2t_l2b_fbd_stdatasel_c3 (l2t4_l2b4_fbd_stdatasel_c3  ),
  .l2t_l2b_wbwr_wen_c6      (l2t4_l2b4_wbwr_wen_c6[ 3 : 0 ]  ),
  .l2t_l2b_wbwr_wl_c6       (l2t4_l2b4_wbwr_wl_c6[ 2 : 0 ]   ),
  .l2t_l2b_wbrd_en_r0       (l2t4_l2b4_wbrd_en_r0        ),
  .l2t_l2b_wbrd_wl_r0       (l2t4_l2b4_wbrd_wl_r0[ 2 : 0 ]   ),
  .l2t_l2b_ev_dword_r0      (l2t4_l2b4_ev_dword_r0[ 2 : 0 ]  ),
  .l2t_l2b_evict_en_r0      (l2t4_l2b4_evict_en_r0       ),
  .l2b_l2t_ev_uerr_r5       (l2b4_l2t4_ev_uerr_r5        ),
  .l2b_l2t_ev_cerr_r5       (l2b4_l2t4_ev_cerr_r5        ),
  .l2t_l2b_rdma_wren_s2     (l2t4_l2b4_rdma_wren_s2[ 15 : 0 ]),
  .l2t_l2b_rdma_wrwl_s2     (l2t4_l2b4_rdma_wrwl_s2[ 1 : 0 ] ),
  .l2t_l2b_rdma_rdwl_r0     (l2t4_l2b4_rdma_rdwl_r0[ 1 : 0 ] ),
  .l2t_l2b_rdma_rden_r0     (l2t4_l2b4_rdma_rden_r0      ),
  .l2t_l2b_ctag_en_c7       (l2t4_l2b4_ctag_en_c7        ),
  .l2t_l2b_ctag_c7          (l2t4_l2b4_ctag_c7[ 31 : 0 ]     ),
  .l2t_l2b_word_c7          (l2t4_l2b4_word_c7[ 3 : 0 ]      ),
  .l2t_l2b_req_en_c7        (l2t4_l2b4_req_en_c7         ),
  .l2t_l2b_word_vld_c7      (l2t4_l2b4_word_vld_c7       ),
  .l2b_l2t_rdma_uerr_c10    (l2b4_l2t4_rdma_uerr_c10     ),
  .l2b_l2t_rdma_cerr_c10    (l2b4_l2t4_rdma_cerr_c10     ),
  .l2b_l2t_rdma_notdata_c10 (l2b4_l2t4_rdma_notdata_c10  ),
  .l2t_mcu_rd_req           (l2t4_mcu2_rd_req            ),
  .l2t_mcu_rd_dummy_req     (l2t4_mcu2_rd_dummy_req      ),
  .l2t_mcu_rd_req_id        (l2t4_mcu2_rd_req_id[ 2 : 0 ]    ),
  .l2t_mcu_addr             (l2t4_mcu2_addr[ 39 : 7 ]        ),
  .l2t_mcu_addr_5           (l2t4_mcu2_addr_5            ),
  .l2t_mcu_wr_req           (l2t4_mcu2_wr_req            ),
  .mcu_l2t_rd_ack           (mcu2_l2t4_rd_ack            ),
  .mcu_l2t_wr_ack           (mcu2_l2t4_wr_ack            ),
  .mcu_l2t_chunk_id_r0      (mcu2_l2t4_qword_id_r0[ 1 : 0 ]  ),
  .mcu_l2t_data_vld_r0      (mcu2_l2t4_data_vld_r0       ),
  .mcu_l2t_rd_req_id_r0     (mcu2_l2t4_rd_req_id_r0[ 2 : 0 ] ),
  .mcu_l2t_secc_err_r2      (mcu2_l2t4_secc_err_r2       ),
  .mcu_l2t_mecc_err_r2      (mcu2_l2t4_mecc_err_r2       ),
  .mcu_l2t_scb_mecc_err     (mcu2_l2t4_scb_mecc_err      ),
  .mcu_l2t_scb_secc_err     (mcu2_l2t4_scb_secc_err      ),
  .sii_l2t_req_vld          (sii_l2t4_req_vld_t4lff            ),
  .sii_l2t_req              (sii_l2t4_req_t4lff[ 31 : 0 ]          ),
  .sii_l2b_ecc              (sii_l2b4_ecc_t4lff[ 6 : 0 ]           ),
  .l2t_sii_iq_dequeue       (l2t4_sii_iq_dequeue         ),
  .l2t_sii_wib_dequeue      (l2t4_sii_wib_dequeue        ),
  .rst_por_                 ( gl_rst_l2_por_c1m ), // ( gl_l2_por_c1t ),  - for int6.1
  .rst_wmr_                 ( gl_rst_l2_wmr_c1m ), // ( gl_l2_wmr_c1t ),  - for int6.1
  .scan_in                  (tcu_soc2_scan_out           ),
  .scan_out                 (l2t4_scan_out               ),
  .tcu_mbist_bisi_en         (tcu_mbist_bisi_en           ),
  .tcu_l2t_mbist_start       (tcu_l2t4_mbist_start),
  .tcu_l2t_mbist_scan_in     (tcu_l2t4_mbist_scan_in      ),
  .l2t_tcu_mbist_done        (l2t4_tcu_mbist_done),
  .l2t_tcu_mbist_fail        (l2t4_tcu_mbist_fail),
  .l2t_tcu_mbist_scan_out    (l2t4_tcu_mbist_scan_out     ),
  .efu_l2t_fuse_clr          (efu_l2t4_fuse_clr          ),                       
  .efu_l2t_fuse_xfer_en      (efu_l2t4_fuse_xfer_en      ),                       
  .efu_l2t_fuse_data         (efu_l2t0246_fuse_data         ),                       
  .l2t_efu_fuse_data         (l2t4_efu_fuse_data         ),                       
  .l2t_efu_fuse_xfer_en      (l2t4_efu_fuse_xfer_en      ),                       
  .gclk                     ( cmp_gclk_c1_l2t4 ), // cmp_gclk_c2_r[2]), 
  .tcu_clk_stop ( gl_l2t4_clk_stop ),	// staged clk_stop
  .tcu_l2t_shscan_scan_in         (tcu_l2t4_shscan_scan_in ),
  .tcu_l2t_shscan_aclk            (tcu_l2t_shscan_aclk    ),
  .tcu_l2t_shscan_bclk            (tcu_l2t_shscan_bclk    ),
  .tcu_l2t_shscan_scan_en         (tcu_l2t_shscan_scan_en ),
  .tcu_l2t_shscan_pce_ov          (tcu_l2t_shscan_pce_ov  ),
  .l2t_tcu_shscan_scan_out        (l2t4_tcu_shscan_scan_out),
  .tcu_l2t_shscan_clk_stop        (tcu_l2t4_shscan_clk_stop),
  .vnw_ary                            (L2T_VNW[ 4 ]),
  .l2t_rep_in0                        (24'b0),
  .l2t_rep_in1                        (24'b0),
  .l2t_rep_in2                        (24'b0),
  .l2t_rep_in3                        (24'b0),
  .l2t_rep_in4                        (24'b0),
  .l2t_rep_in5                        (24'b0),
  .l2t_rep_in6                        (24'b0),
  .l2t_rep_in7                        (24'b0),
  .l2t_rep_in8                        (24'b0),
  .l2t_rep_in9                        (24'b0),
  .l2t_rep_in10                       (24'b0),
  .l2t_rep_in11                       (24'b0),
  .l2t_rep_in12                       (24'b0),
  .l2t_rep_in13                       (24'b0),
  .l2t_rep_in14                       (24'b0),
  .l2t_rep_in15                       (24'b0),
  .l2t_rep_in16                       (24'b0),
  .l2t_rep_in17                       (24'b0),
  .l2t_rep_in18                       (24'b0),
  .l2t_rep_in19                       (24'b0),
  .l2t_rep_out0                       (l2t4_rep_out0_unused[ 23 : 0 ]),
  .l2t_rep_out1                       (l2t4_rep_out1_unused[ 23 : 0 ]),
  .l2t_rep_out2                       (l2t4_rep_out2_unused[ 23 : 0 ]),
  .l2t_rep_out3                       (l2t4_rep_out3_unused[ 23 : 0 ]),
  .l2t_rep_out4                       (l2t4_rep_out4_unused[ 23 : 0 ]),
  .l2t_rep_out5                       (l2t4_rep_out5_unused[ 23 : 0 ]),
  .l2t_rep_out6                       (l2t4_rep_out6_unused[ 23 : 0 ]),
  .l2t_rep_out7                       (l2t4_rep_out7_unused[ 23 : 0 ]),
  .l2t_rep_out8                       (l2t4_rep_out8_unused[ 23 : 0 ]),
  .l2t_rep_out9                       (l2t4_rep_out9_unused[ 23 : 0 ]),
  .l2t_rep_out10                      (l2t4_rep_out10_unused[ 23 : 0 ]),
  .l2t_rep_out11                      (l2t4_rep_out11_unused[ 23 : 0 ]),
  .l2t_rep_out12                      (l2t4_rep_out12_unused[ 23 : 0 ]),
  .l2t_rep_out13                      (l2t4_rep_out13_unused[ 23 : 0 ]),
  .l2t_rep_out14                      (l2t4_rep_out14_unused[ 23 : 0 ]),
  .l2t_rep_out15                      (l2t4_rep_out15_unused[ 23 : 0 ]),
  .l2t_rep_out16                      (l2t4_rep_out16_unused[ 23 : 0 ]),
  .l2t_rep_out17                      (l2t4_rep_out17_unused[ 23 : 0 ]),
  .l2t_rep_out18                      (l2t4_rep_out18_unused[ 23 : 0 ]),
  .l2t_rep_out19                      (l2t4_rep_out19_unused[ 23 : 0 ]),
  .ncu_l2t_pm(ncu_l2t_pm),
  .ncu_l2t_ba01(ncu_l2t_ba01),
  .ncu_l2t_ba23(ncu_l2t_ba23),
  .ncu_l2t_ba45(ncu_l2t_ba45),
  .ncu_l2t_ba67(ncu_l2t_ba67),
  .ncu_spc0_core_enable_status(ncu_spc0_core_enable_status),
  .ncu_spc1_core_enable_status(ncu_spc1_core_enable_status),
  .ncu_spc2_core_enable_status(ncu_spc2_core_enable_status),
  .ncu_spc3_core_enable_status(ncu_spc3_core_enable_status),
  .ncu_spc4_core_enable_status(ncu_spc4_core_enable_status),
  .ncu_spc5_core_enable_status(ncu_spc5_core_enable_status),
  .ncu_spc6_core_enable_status(ncu_spc6_core_enable_status),
  .ncu_spc7_core_enable_status(ncu_spc7_core_enable_status),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_array_bypass(tcu_array_bypass),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_user_mode(tcu_mbist_user_mode)
        );
//________________________________________________________________

/////// stagging flop

//assign

l2t l2t5(
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c2t ), 
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c2t ),
  .l2t_lstg_in		    (
                             {mcu1_tcu_mbist_fail,     
                              1'b0, ncu_tcu_mbist_done[ 0 ],
                              1'b0, ncu_tcu_mbist_fail[ 0 ],
                              106'b0,                   
                              l2b0_sio_parity_t0rff[ 1 : 0 ],
                              l2t0_tcu_mbist_done,
                              l2t0_tcu_mbist_fail,
                              spc0_tcu_mbist_done,
                              spc0_tcu_mbist_fail,
			      6'b0,
                              mcu0_tcu_mbist_done,
                              mcu0_tcu_mbist_fail,
			      mcu1_tcu_mbist_done,
//                              mcu1_tcu_mbist_fail,
                              16'b0,
			      22'b0,
                              spc0_softstop_request,
                              spc0_hardstop_request,
                              spc0_trigger_pulse,
                              spc0_ss_complete,
			      24'b0
                             }
                            ),
  .l2t_rstg_in		    (
                             {136'b0,
                              mcu2_l2t5_rd_ack,
                              mcu2_l2t5_wr_ack,
                              mcu2_l2t5_qword_id_r0[ 1 : 0 ],
                              mcu2_l2t5_data_vld_r0,
                              mcu2_l2t5_rd_req_id_r0[ 2 : 0 ],
                              mcu2_l2t5_secc_err_r2,
                              mcu2_l2t5_mecc_err_r2,
                              mcu2_l2t5_scb_mecc_err,
                              mcu2_l2t5_scb_secc_err,
                              44'b0
                             }
                            ),
  .l2t_lstg_out		    (
                             {mcu1_tcu_mbist_fail_t5lff,
                              unconnectedt5lff[  190  ],
                              ncu_tcu_mbist_done_t5lff_0,
                              unconnectedt5lff[  188  ],
                              ncu_tcu_mbist_fail_t5lff_0,
                              unconnectedt5lff[  186  :  81  ],
                              l2b0_sio_parity_t5lff[ 1 : 0 ],
                              l2t0_tcu_mbist_done_t5lff,
                              l2t0_tcu_mbist_fail_t5lff,
                              spc0_tcu_mbist_done_t5lff,
                              spc0_tcu_mbist_fail_t5lff,
                              unconnectedt5lff[ 74 : 69 ],
                              mcu0_tcu_mbist_done_t5lff,
                              mcu0_tcu_mbist_fail_t5lff,
                              mcu1_tcu_mbist_done_t5lff,
//                              mcu1_tcu_mbist_fail_t5lff,
                              unconnectedt5lff[ 65 : 28 ],
                              spc0_softstop_request_t5lff,
                              spc0_hardstop_request_t5lff,
                              spc0_trigger_pulse_t5lff,
                              spc0_ss_complete_t5lff,
                              unconnectedt5lff[ 23 : 0 ]
                             }
                            ),
  .l2t_rstg_out		    (
                             {unconnectedt5rff[ 191 : 56 ],
                              mcu2_l2t5_rd_ack_t5rff,
                              mcu2_l2t5_wr_ack_t5rff,
                              mcu2_l2t5_qword_id_r0_t5rff[ 1 : 0 ],
                              mcu2_l2t5_data_vld_r0_t5rff,
                              mcu2_l2t5_rd_req_id_r0_t5rff[ 2 : 0 ],
                              mcu2_l2t5_secc_err_r2_t5rff,
                              mcu2_l2t5_mecc_err_r2_t5rff,
                              mcu2_l2t5_scb_mecc_err_t5rff,
                              mcu2_l2t5_scb_secc_err_t5rff,
                              unconnectedt5rff[ 43 : 0 ]
                             }
                            ),
  .l2t_siu_delay	    (1'b0),
  .l2t_tcu_dmo_out_prev     (l2t1_dmo_dout[ 38 : 0 ]         ), 
  .l2t_tcu_dmo_out          (l2t5_dmo_dout[ 38 : 0 ]         ),
  .tcu_l2t_coresel          (dmo_l2tsel[ 4 ]               ),
  .tcu_l2t_tag_or_data_sel  (dmo_tagmuxctl               ),
  .l2t_dbg_sii_iq_dequeue   (l2t5_dbg1_sii_iq_dequeue	 ),
  .l2t_dbg_sii_wib_dequeue  (l2t5_dbg1_sii_wib_dequeue 	 ),
  .l2t_dbg_xbar_vcid	    (l2t5_dbg1_xbar_vcid[ 5 : 0 ]	 ),
  .l2t_dbg_err_event	    (l2t5_dbg1_err_event		 ),
  .l2t_dbg_pa_match	    (l2t5_dbg1_pa_match		 ),
  .l2t_cpx_req_cq           (sctag5_cpx_req_cq[ 7 : 0 ]      ),// sctag
  .l2t_cpx_atom_cq          (sctag5_cpx_atom_cq          ),
  .l2t_cpx_data_ca          (sctag5_cpx_data_ca[ 145 : 0 ]),
  .l2t_pcx_stall_pq         (sctag5_pcx_stall_pq         ),
  .pcx_l2t_data_rdy_px1     (pcx_sctag5_data_rdy_px1     ),
  .pcx_l2t_data_px2         (pcx_sctag5_data_px2[ 129 : 0 ]),
  .pcx_l2t_atm_px1          (pcx_sctag5_atm_px1          ),
  .cpx_l2t_grant_cx         (cpx_sctag5_grant_cx[ 7 : 0 ]    ),
  .l2t_rst_fatal_error      (l2t5_rst_fatal_error),
  .rst_wmr_protect                (rst_wmr_protect                 ),
  .l2t_l2d_way_sel_c2       (l2t5_l2d5_way_sel_c2        ),
  .l2t_l2d_rd_wr_c2         (l2t5_l2d5_rd_wr_c2          ),
  .l2t_l2d_set_c2           (l2t5_l2d5_set_c2[ 8 : 0 ]       ),
  .l2t_l2d_col_offset_c2    (l2t5_l2d5_col_offset_c2[ 3 : 0 ]),
  .l2t_l2d_word_en_c2       (l2t5_l2d5_word_en_c2        ),
  .l2t_l2d_fbrd_c3          (l2t5_l2d5_fbrd_c3           ),
  .l2t_l2d_fb_hit_c3        (l2t5_l2d5_fb_hit_c3         ),
  .l2t_l2d_stdecc_c2        (l2t5_l2d5_stdecc_c2[ 77 : 0 ]         ),
  .l2d_l2t_decc_c6          (l2d5_l2t5_decc_c6           ),
 // .l2t_l2b_stdecc_c3        (l2t5_l2b5_stdecc_c3[77:0]   ),
  .l2t_l2b_fbrd_en_c3       (l2t5_l2b5_fbrd_en_c3        ),
  .l2t_l2b_fbrd_wl_c3       (l2t5_l2b5_fbrd_wl_c3[ 2 : 0 ]   ),
  .l2t_l2b_fbwr_wen_r2      (l2t5_l2b5_fbwr_wen_r2[ 15 : 0 ] ),
  .l2t_l2b_fbwr_wl_r2       (l2t5_l2b5_fbwr_wl_r2[ 2 : 0 ]   ),
  .l2t_l2b_fbd_stdatasel_c3 (l2t5_l2b5_fbd_stdatasel_c3  ),
  .l2t_l2b_wbwr_wen_c6      (l2t5_l2b5_wbwr_wen_c6[ 3 : 0 ]  ),
  .l2t_l2b_wbwr_wl_c6       (l2t5_l2b5_wbwr_wl_c6[ 2 : 0 ]   ),
  .l2t_l2b_wbrd_en_r0       (l2t5_l2b5_wbrd_en_r0        ),
  .l2t_l2b_wbrd_wl_r0       (l2t5_l2b5_wbrd_wl_r0[ 2 : 0 ]   ),
  .l2t_l2b_ev_dword_r0      (l2t5_l2b5_ev_dword_r0[ 2 : 0 ]  ),
  .l2t_l2b_evict_en_r0      (l2t5_l2b5_evict_en_r0       ),
  .l2b_l2t_ev_uerr_r5       (l2b5_l2t5_ev_uerr_r5        ),
  .l2b_l2t_ev_cerr_r5       (l2b5_l2t5_ev_cerr_r5        ),
  .l2t_l2b_rdma_wren_s2     (l2t5_l2b5_rdma_wren_s2[ 15 : 0 ]),
  .l2t_l2b_rdma_wrwl_s2     (l2t5_l2b5_rdma_wrwl_s2[ 1 : 0 ] ),
  .l2t_l2b_rdma_rdwl_r0     (l2t5_l2b5_rdma_rdwl_r0[ 1 : 0 ] ),
  .l2t_l2b_rdma_rden_r0     (l2t5_l2b5_rdma_rden_r0      ),
  .l2t_l2b_ctag_en_c7       (l2t5_l2b5_ctag_en_c7        ),
  .l2t_l2b_ctag_c7          (l2t5_l2b5_ctag_c7[ 31 : 0 ]     ),
  .l2t_l2b_word_c7          (l2t5_l2b5_word_c7[ 3 : 0 ]      ),
  .l2t_l2b_req_en_c7        (l2t5_l2b5_req_en_c7         ),
  .l2t_l2b_word_vld_c7      (l2t5_l2b5_word_vld_c7       ),
  .l2b_l2t_rdma_uerr_c10    (l2b5_l2t5_rdma_uerr_c10     ),
  .l2b_l2t_rdma_cerr_c10    (l2b5_l2t5_rdma_cerr_c10     ),
  .l2b_l2t_rdma_notdata_c10 (l2b5_l2t5_rdma_notdata_c10  ),
  .l2t_mcu_rd_req           (l2t5_mcu2_rd_req            ),
  .l2t_mcu_rd_dummy_req     (l2t5_mcu2_rd_dummy_req      ),
  .l2t_mcu_rd_req_id        (l2t5_mcu2_rd_req_id[ 2 : 0 ]    ),
  .l2t_mcu_addr             (l2t5_mcu2_addr[ 39 : 7 ]        ),
  .l2t_mcu_addr_5           (l2t5_mcu2_addr_5            ),
  .l2t_mcu_wr_req           (l2t5_mcu2_wr_req            ),
  .mcu_l2t_rd_ack           (mcu2_l2t5_rd_ack_t5rff            ),
  .mcu_l2t_wr_ack           (mcu2_l2t5_wr_ack_t5rff            ),
  .mcu_l2t_chunk_id_r0      (mcu2_l2t5_qword_id_r0_t5rff[ 1 : 0 ]  ),
  .mcu_l2t_data_vld_r0      (mcu2_l2t5_data_vld_r0_t5rff       ),
  .mcu_l2t_rd_req_id_r0     (mcu2_l2t5_rd_req_id_r0_t5rff[ 2 : 0 ] ),
  .mcu_l2t_secc_err_r2      (mcu2_l2t5_secc_err_r2_t5rff       ),
  .mcu_l2t_mecc_err_r2      (mcu2_l2t5_mecc_err_r2_t5rff       ),
  .mcu_l2t_scb_mecc_err     (mcu2_l2t5_scb_mecc_err_t5rff      ),
  .mcu_l2t_scb_secc_err     (mcu2_l2t5_scb_secc_err_t5rff      ),
  .sii_l2t_req_vld          (sii_l2t5_req_vld_t4lff            ),
  .sii_l2t_req              (sii_l2t5_req_t4lff[ 31 : 0 ]          ),
  .sii_l2b_ecc              (sii_l2b5_ecc_ccxrff[ 6 : 0 ]           ),
  .l2t_sii_iq_dequeue       (l2t5_sii_iq_dequeue         ),
  .l2t_sii_wib_dequeue      (l2t5_sii_wib_dequeue        ),
  .rst_por_                 ( gl_l2_por_c2t ), 
  .rst_wmr_                 ( gl_l2_wmr_c2t ), 
  .scan_in                  (l2t4_scan_out               ),
  .scan_out                 (l2t5_scan_out               ),
  .tcu_mbist_bisi_en        (tcu_mbist_bisi_en           ),
  .tcu_l2t_mbist_start      (tcu_l2t5_mbist_start),
  .tcu_l2t_mbist_scan_in    (tcu_l2t5_mbist_scan_in      ),
  .l2t_tcu_mbist_done       (l2t5_tcu_mbist_done),
  .l2t_tcu_mbist_fail       (l2t5_tcu_mbist_fail),
  .l2t_tcu_mbist_scan_out   (l2t5_tcu_mbist_scan_out     ),
  .efu_l2t_fuse_clr          (efu_l2t5_fuse_clr          ),                       
  .efu_l2t_fuse_xfer_en      (efu_l2t5_fuse_xfer_en      ),                       
  .efu_l2t_fuse_data         (efu_l2t1357_fuse_data         ),                       
  .l2t_efu_fuse_data         (l2t5_efu_fuse_data         ),                       
  .l2t_efu_fuse_xfer_en      (l2t5_efu_fuse_xfer_en      ),                       
  .gclk                     ( cmp_gclk_c2_l2t5 ), 
  .tcu_clk_stop ( gl_l2t5_clk_stop ),	// staged clk_stop
  .tcu_l2t_shscan_scan_in         (tcu_l2t5_shscan_scan_in ),
  .tcu_l2t_shscan_aclk            (tcu_l2t_shscan_aclk    ),
  .tcu_l2t_shscan_bclk            (tcu_l2t_shscan_bclk    ),
  .tcu_l2t_shscan_scan_en         (tcu_l2t_shscan_scan_en ),
  .tcu_l2t_shscan_pce_ov          (tcu_l2t_shscan_pce_ov  ),
  .l2t_tcu_shscan_scan_out        (l2t5_tcu_shscan_scan_out),
  .tcu_l2t_shscan_clk_stop        (tcu_l2t5_shscan_clk_stop),
  .vnw_ary                            (L2T_VNW[ 5 ]),
  .l2t_rep_in0                        (24'b0),
  .l2t_rep_in1                        (24'b0),
  .l2t_rep_in2                        (24'b0),
  .l2t_rep_in3                        (24'b0),
  .l2t_rep_in4                        (24'b0),
  .l2t_rep_in5                        (24'b0),
  .l2t_rep_in6                        (24'b0),
  .l2t_rep_in7                        (24'b0),
  .l2t_rep_in8                        (24'b0),
  .l2t_rep_in9                        (24'b0),
  .l2t_rep_in10                       (24'b0),
  .l2t_rep_in11                       (24'b0),
  .l2t_rep_in12                       (24'b0),
  .l2t_rep_in13                       (24'b0),
  .l2t_rep_in14                       (24'b0),
  .l2t_rep_in15                       (24'b0),
  .l2t_rep_in16                       (24'b0),
  .l2t_rep_in17                       (24'b0),
  .l2t_rep_in18                       (24'b0),
  .l2t_rep_in19                       (24'b0),
  .l2t_rep_out0                       (l2t5_rep_out0_unused[ 23 : 0 ]),
  .l2t_rep_out1                       (l2t5_rep_out1_unused[ 23 : 0 ]),
  .l2t_rep_out2                       (l2t5_rep_out2_unused[ 23 : 0 ]),
  .l2t_rep_out3                       (l2t5_rep_out3_unused[ 23 : 0 ]),
  .l2t_rep_out4                       (l2t5_rep_out4_unused[ 23 : 0 ]),
  .l2t_rep_out5                       (l2t5_rep_out5_unused[ 23 : 0 ]),
  .l2t_rep_out6                       (l2t5_rep_out6_unused[ 23 : 0 ]),
  .l2t_rep_out7                       (l2t5_rep_out7_unused[ 23 : 0 ]),
  .l2t_rep_out8                       (l2t5_rep_out8_unused[ 23 : 0 ]),
  .l2t_rep_out9                       (l2t5_rep_out9_unused[ 23 : 0 ]),
  .l2t_rep_out10                      (l2t5_rep_out10_unused[ 23 : 0 ]),
  .l2t_rep_out11                      (l2t5_rep_out11_unused[ 23 : 0 ]),
  .l2t_rep_out12                      (l2t5_rep_out12_unused[ 23 : 0 ]),
  .l2t_rep_out13                      (l2t5_rep_out13_unused[ 23 : 0 ]),
  .l2t_rep_out14                      (l2t5_rep_out14_unused[ 23 : 0 ]),
  .l2t_rep_out15                      (l2t5_rep_out15_unused[ 23 : 0 ]),
  .l2t_rep_out16                      (l2t5_rep_out16_unused[ 23 : 0 ]),
  .l2t_rep_out17                      (l2t5_rep_out17_unused[ 23 : 0 ]),
  .l2t_rep_out18                      (l2t5_rep_out18_unused[ 23 : 0 ]),
  .l2t_rep_out19                      (l2t5_rep_out19_unused[ 23 : 0 ]),
  .ncu_l2t_pm(ncu_l2t_pm),
  .ncu_l2t_ba01(ncu_l2t_ba01),
  .ncu_l2t_ba23(ncu_l2t_ba23),
  .ncu_l2t_ba45(ncu_l2t_ba45),
  .ncu_l2t_ba67(ncu_l2t_ba67),
  .ncu_spc0_core_enable_status(ncu_spc0_core_enable_status),
  .ncu_spc1_core_enable_status(ncu_spc1_core_enable_status),
  .ncu_spc2_core_enable_status(ncu_spc2_core_enable_status),
  .ncu_spc3_core_enable_status(ncu_spc3_core_enable_status),
  .ncu_spc4_core_enable_status(ncu_spc4_core_enable_status),
  .ncu_spc5_core_enable_status(ncu_spc5_core_enable_status),
  .ncu_spc6_core_enable_status(ncu_spc6_core_enable_status),
  .ncu_spc7_core_enable_status(ncu_spc7_core_enable_status),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_array_bypass(tcu_array_bypass),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_user_mode(tcu_mbist_user_mode)
        );
//________________________________________________________________

/////// stagging flop

//assign

l2t l2t6(
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c1b ), 
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c1b ),
  .l2t_lstg_in		    ({sii_l2t6_req[ 31 : 0 ],
                              sii_l2t6_req_vld,
			      sii_l2t7_req[ 31 : 0 ],
                              sii_l2t7_req_vld,
			      82'b0,
                              l2t7_mcu3_rd_req,
                              l2t7_mcu3_rd_dummy_req,
                              l2t7_mcu3_rd_req_id[ 2 : 0 ],
                              l2t7_mcu3_wr_req,
                              l2t7_mcu3_addr_5,
                              l2t7_mcu3_addr[ 39 : 31 ],
                              4'b0,
                              l2t7_mcu3_addr[ 30 : 7 ]
                             }
                            ),
  .l2t_rstg_in		    (192'b0),
  .l2t_lstg_out		    (
                             {sii_l2t6_req_t6lff[ 31 : 0 ],
                              sii_l2t6_req_vld_t6lff,
                              sii_l2t7_req_t6lff[ 31 : 0 ],
                              sii_l2t7_req_vld_t6lff,
                              unconnectedt6lff[ 125 : 44 ],
                              l2t7_mcu3_rd_req_t6lff,
                              l2t7_mcu3_rd_dummy_req_t6lff,
                              l2t7_mcu3_rd_req_id_t6lff[ 2 : 0 ],
                              l2t7_mcu3_wr_req_t6lff,
                              l2t7_mcu3_addr_5_t6lff,
                              l2t7_mcu3_addr_t6lff[ 39 : 31 ],
                              unconnectedt6lff[ 27 : 24 ],
                              l2t7_mcu3_addr_t6lff[ 30 : 7 ]
                             }
                            ),
  .l2t_rstg_out		    ({unconnectedt6rff[ 191 : 0 ]}),
  .l2t_siu_delay	    (1'b0),
  .l2t_tcu_dmo_out_prev     (l2t7_dmo_dout[ 38 : 0 ]         ), 
  .l2t_tcu_dmo_out          (l2t6_dmo_dout[ 38 : 0 ]         ),
  .tcu_l2t_coresel          (dmo_l2tsel[ 0 ]               ),
  .tcu_l2t_tag_or_data_sel  (dmo_tagmuxctl               ),
  .l2t_dbg_sii_iq_dequeue   (l2t6_dbg1_sii_iq_dequeue	 ),
  .l2t_dbg_sii_wib_dequeue  (l2t6_dbg1_sii_wib_dequeue 	 ),
  .l2t_dbg_xbar_vcid	    (l2t6_dbg1_xbar_vcid[ 5 : 0 ]	 ),
  .l2t_dbg_err_event	    (l2t6_dbg1_err_event		 ),
  .l2t_dbg_pa_match	    (l2t6_dbg1_pa_match		 ),
  .l2t_cpx_req_cq           (sctag6_cpx_req_cq[ 7 : 0 ]      ),// sctag
  .l2t_cpx_atom_cq          (sctag6_cpx_atom_cq          ),
  .l2t_cpx_data_ca          (sctag6_cpx_data_ca[ 145 : 0 ]),
  .l2t_pcx_stall_pq         (sctag6_pcx_stall_pq         ),
  .pcx_l2t_data_rdy_px1     (pcx_sctag6_data_rdy_px1     ),
  .pcx_l2t_data_px2         (pcx_sctag6_data_px2[ 129 : 0 ]),
  .pcx_l2t_atm_px1          (pcx_sctag6_atm_px1          ),
  .cpx_l2t_grant_cx         (cpx_sctag6_grant_cx[ 7 : 0 ]    ),
  .l2t_rst_fatal_error      (l2t6_rst_fatal_error),
  .rst_wmr_protect                (rst_wmr_protect                 ),
  .l2t_l2d_way_sel_c2       (l2t6_l2d6_way_sel_c2        ),
  .l2t_l2d_rd_wr_c2         (l2t6_l2d6_rd_wr_c2          ),
  .l2t_l2d_set_c2           (l2t6_l2d6_set_c2[ 8 : 0 ]       ),
  .l2t_l2d_col_offset_c2    (l2t6_l2d6_col_offset_c2[ 3 : 0 ]),
  .l2t_l2d_word_en_c2       (l2t6_l2d6_word_en_c2        ),
  .l2t_l2d_fbrd_c3          (l2t6_l2d6_fbrd_c3           ),
  .l2t_l2d_fb_hit_c3        (l2t6_l2d6_fb_hit_c3         ),
  .l2t_l2d_stdecc_c2        (l2t6_l2d6_stdecc_c2[ 77 : 0 ]         ),
  .l2d_l2t_decc_c6          (l2d6_l2t6_decc_c6           ),
 // .l2t_l2b_stdecc_c3        (l2t6_l2b6_stdecc_c3[77:0]   ),
  .l2t_l2b_fbrd_en_c3       (l2t6_l2b6_fbrd_en_c3        ),
  .l2t_l2b_fbrd_wl_c3       (l2t6_l2b6_fbrd_wl_c3[ 2 : 0 ]   ),
  .l2t_l2b_fbwr_wen_r2      (l2t6_l2b6_fbwr_wen_r2[ 15 : 0 ] ),
  .l2t_l2b_fbwr_wl_r2       (l2t6_l2b6_fbwr_wl_r2[ 2 : 0 ]   ),
  .l2t_l2b_fbd_stdatasel_c3 (l2t6_l2b6_fbd_stdatasel_c3  ),
  .l2t_l2b_wbwr_wen_c6      (l2t6_l2b6_wbwr_wen_c6[ 3 : 0 ]  ),
  .l2t_l2b_wbwr_wl_c6       (l2t6_l2b6_wbwr_wl_c6[ 2 : 0 ]   ),
  .l2t_l2b_wbrd_en_r0       (l2t6_l2b6_wbrd_en_r0        ),
  .l2t_l2b_wbrd_wl_r0       (l2t6_l2b6_wbrd_wl_r0[ 2 : 0 ]   ),
  .l2t_l2b_ev_dword_r0      (l2t6_l2b6_ev_dword_r0[ 2 : 0 ]  ),
  .l2t_l2b_evict_en_r0      (l2t6_l2b6_evict_en_r0       ),
  .l2b_l2t_ev_uerr_r5       (l2b6_l2t6_ev_uerr_r5        ),
  .l2b_l2t_ev_cerr_r5       (l2b6_l2t6_ev_cerr_r5        ),
  .l2t_l2b_rdma_wren_s2     (l2t6_l2b6_rdma_wren_s2[ 15 : 0 ]),
  .l2t_l2b_rdma_wrwl_s2     (l2t6_l2b6_rdma_wrwl_s2[ 1 : 0 ] ),
  .l2t_l2b_rdma_rdwl_r0     (l2t6_l2b6_rdma_rdwl_r0[ 1 : 0 ] ),
  .l2t_l2b_rdma_rden_r0     (l2t6_l2b6_rdma_rden_r0      ),
  .l2t_l2b_ctag_en_c7       (l2t6_l2b6_ctag_en_c7        ),
  .l2t_l2b_ctag_c7          (l2t6_l2b6_ctag_c7[ 31 : 0 ]     ),
  .l2t_l2b_word_c7          (l2t6_l2b6_word_c7[ 3 : 0 ]      ),
  .l2t_l2b_req_en_c7        (l2t6_l2b6_req_en_c7         ),
  .l2t_l2b_word_vld_c7      (l2t6_l2b6_word_vld_c7       ),
  .l2b_l2t_rdma_uerr_c10    (l2b6_l2t6_rdma_uerr_c10     ),
  .l2b_l2t_rdma_cerr_c10    (l2b6_l2t6_rdma_cerr_c10     ),
  .l2b_l2t_rdma_notdata_c10 (l2b6_l2t6_rdma_notdata_c10  ),
  .l2t_mcu_rd_req           (l2t6_mcu3_rd_req            ),
  .l2t_mcu_rd_dummy_req     (l2t6_mcu3_rd_dummy_req      ),
  .l2t_mcu_rd_req_id        (l2t6_mcu3_rd_req_id[ 2 : 0 ]    ),
  .l2t_mcu_addr             (l2t6_mcu3_addr[ 39 : 7 ]        ),
  .l2t_mcu_addr_5           (l2t6_mcu3_addr_5            ),
  .l2t_mcu_wr_req           (l2t6_mcu3_wr_req            ),
  .mcu_l2t_rd_ack           (mcu3_l2t6_rd_ack            ),
  .mcu_l2t_wr_ack           (mcu3_l2t6_wr_ack            ),
  .mcu_l2t_chunk_id_r0      (mcu3_l2t6_qword_id_r0[ 1 : 0 ]  ),
  .mcu_l2t_data_vld_r0      (mcu3_l2t6_data_vld_r0       ),
  .mcu_l2t_rd_req_id_r0     (mcu3_l2t6_rd_req_id_r0[ 2 : 0 ] ),
  .mcu_l2t_secc_err_r2      (mcu3_l2t6_secc_err_r2       ),
  .mcu_l2t_mecc_err_r2      (mcu3_l2t6_mecc_err_r2       ),
  .mcu_l2t_scb_mecc_err     (mcu3_l2t6_scb_mecc_err      ),
  .mcu_l2t_scb_secc_err     (mcu3_l2t6_scb_secc_err      ),
  .sii_l2t_req_vld          (sii_l2t6_req_vld_t6lff            ),
  .sii_l2t_req              (sii_l2t6_req_t6lff[ 31 : 0 ]          ),
  .sii_l2b_ecc              (sii_l2b6_ecc_ccxrff[ 6 : 0 ]           ),
  .l2t_sii_iq_dequeue       (l2t6_sii_iq_dequeue         ),
  .l2t_sii_wib_dequeue      (l2t6_sii_wib_dequeue        ),
  .rst_por_                 ( gl_l2_por_c1b ), // ( gl_l2_por_c1t ),  - for int6.1
  .rst_wmr_                 ( gl_l2_wmr_c1b ), 
  .scan_in                  (tcu_soc3_scan_out           ),
  .scan_out                 (l2t6_scan_out               ),
  .tcu_mbist_bisi_en         (tcu_mbist_bisi_en           ),
  .tcu_l2t_mbist_start       (tcu_l2t6_mbist_start),
  .tcu_l2t_mbist_scan_in     (tcu_l2t6_mbist_scan_in      ),
  .l2t_tcu_mbist_done        (l2t6_tcu_mbist_done),
  .l2t_tcu_mbist_fail        (l2t6_tcu_mbist_fail),
  .l2t_tcu_mbist_scan_out    (l2t6_tcu_mbist_scan_out     ),
  .efu_l2t_fuse_clr          (efu_l2t6_fuse_clr          ),                       
  .efu_l2t_fuse_xfer_en      (efu_l2t6_fuse_xfer_en      ),                       
  .efu_l2t_fuse_data         (efu_l2t0246_fuse_data         ),                       
  .l2t_efu_fuse_data         (l2t6_efu_fuse_data         ),                       
  .l2t_efu_fuse_xfer_en      (l2t6_efu_fuse_xfer_en      ),                       
  .gclk                     ( cmp_gclk_c1_l2t6 ),
  .tcu_clk_stop ( gl_l2t6_clk_stop ),	// staged clk_stop
  .tcu_l2t_shscan_scan_in         (tcu_l2t6_shscan_scan_in ),
  .tcu_l2t_shscan_aclk            (tcu_l2t_shscan_aclk    ),
  .tcu_l2t_shscan_bclk            (tcu_l2t_shscan_bclk    ),
  .tcu_l2t_shscan_scan_en         (tcu_l2t_shscan_scan_en ),
  .tcu_l2t_shscan_pce_ov          (tcu_l2t_shscan_pce_ov  ),
  .l2t_tcu_shscan_scan_out        (l2t6_tcu_shscan_scan_out),
  .tcu_l2t_shscan_clk_stop        (tcu_l2t6_shscan_clk_stop),
  .vnw_ary                            (L2T_VNW[ 6 ]),
  .l2t_rep_in0                        (24'b0),
  .l2t_rep_in1                        (24'b0),
  .l2t_rep_in2                        (24'b0),
  .l2t_rep_in3                        (24'b0),
  .l2t_rep_in4                        (24'b0),
  .l2t_rep_in5                        (24'b0),
  .l2t_rep_in6                        (24'b0),
  .l2t_rep_in7                        (24'b0),
  .l2t_rep_in8                        (24'b0),
  .l2t_rep_in9                        (24'b0),
  .l2t_rep_in10                       (24'b0),
  .l2t_rep_in11                       (24'b0),
  .l2t_rep_in12                       (24'b0),
  .l2t_rep_in13                       (24'b0),
  .l2t_rep_in14                       (24'b0),
  .l2t_rep_in15                       (24'b0),
  .l2t_rep_in16                       (24'b0),
  .l2t_rep_in17                       (24'b0),
  .l2t_rep_in18                       (24'b0),
  .l2t_rep_in19                       (24'b0),
  .l2t_rep_out0                       (l2t6_rep_out0_unused[ 23 : 0 ]),
  .l2t_rep_out1                       (l2t6_rep_out1_unused[ 23 : 0 ]),
  .l2t_rep_out2                       (l2t6_rep_out2_unused[ 23 : 0 ]),
  .l2t_rep_out3                       (l2t6_rep_out3_unused[ 23 : 0 ]),
  .l2t_rep_out4                       (l2t6_rep_out4_unused[ 23 : 0 ]),
  .l2t_rep_out5                       (l2t6_rep_out5_unused[ 23 : 0 ]),
  .l2t_rep_out6                       (l2t6_rep_out6_unused[ 23 : 0 ]),
  .l2t_rep_out7                       (l2t6_rep_out7_unused[ 23 : 0 ]),
  .l2t_rep_out8                       (l2t6_rep_out8_unused[ 23 : 0 ]),
  .l2t_rep_out9                       (l2t6_rep_out9_unused[ 23 : 0 ]),
  .l2t_rep_out10                      (l2t6_rep_out10_unused[ 23 : 0 ]),
  .l2t_rep_out11                      (l2t6_rep_out11_unused[ 23 : 0 ]),
  .l2t_rep_out12                      (l2t6_rep_out12_unused[ 23 : 0 ]),
  .l2t_rep_out13                      (l2t6_rep_out13_unused[ 23 : 0 ]),
  .l2t_rep_out14                      (l2t6_rep_out14_unused[ 23 : 0 ]),
  .l2t_rep_out15                      (l2t6_rep_out15_unused[ 23 : 0 ]),
  .l2t_rep_out16                      (l2t6_rep_out16_unused[ 23 : 0 ]),
  .l2t_rep_out17                      (l2t6_rep_out17_unused[ 23 : 0 ]),
  .l2t_rep_out18                      (l2t6_rep_out18_unused[ 23 : 0 ]),
  .l2t_rep_out19                      (l2t6_rep_out19_unused[ 23 : 0 ]),
  .ncu_l2t_pm(ncu_l2t_pm),
  .ncu_l2t_ba01(ncu_l2t_ba01),
  .ncu_l2t_ba23(ncu_l2t_ba23),
  .ncu_l2t_ba45(ncu_l2t_ba45),
  .ncu_l2t_ba67(ncu_l2t_ba67),
  .ncu_spc0_core_enable_status(ncu_spc0_core_enable_status),
  .ncu_spc1_core_enable_status(ncu_spc1_core_enable_status),
  .ncu_spc2_core_enable_status(ncu_spc2_core_enable_status),
  .ncu_spc3_core_enable_status(ncu_spc3_core_enable_status),
  .ncu_spc4_core_enable_status(ncu_spc4_core_enable_status),
  .ncu_spc5_core_enable_status(ncu_spc5_core_enable_status),
  .ncu_spc6_core_enable_status(ncu_spc6_core_enable_status),
  .ncu_spc7_core_enable_status(ncu_spc7_core_enable_status),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_array_bypass(tcu_array_bypass),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_user_mode(tcu_mbist_user_mode)
        );
//________________________________________________________________

/////// stagging flop

//assign

l2t l2t7(
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c2b ), 
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c2b ),
  .l2t_lstg_in		    (
                             {113'b0,
                              l2t2_tcu_mbist_done,
                              l2t2_tcu_mbist_fail,
                              spc2_tcu_mbist_done,
                              spc2_tcu_mbist_fail,
			      21'b0,
			      26'b0,
                              spc2_softstop_request,
                              spc2_hardstop_request,
                              spc2_trigger_pulse,
                              spc2_ss_complete,
			      24'b0
                             }
                            ),
  .l2t_rstg_in		    (
                             {136'b0,
                              mcu3_l2t7_rd_ack,
                              mcu3_l2t7_wr_ack,
                              mcu3_l2t7_qword_id_r0[ 1 : 0 ],
                              mcu3_l2t7_data_vld_r0,
                              mcu3_l2t7_rd_req_id_r0[ 2 : 0 ],
                              mcu3_l2t7_secc_err_r2,
                              mcu3_l2t7_mecc_err_r2,
                              mcu3_l2t7_scb_mecc_err,
                              mcu3_l2t7_scb_secc_err,
                              44'b0
                             }
                            ),
  .l2t_lstg_out		    (
                             {unconnectedt7lff[ 191 : 79 ],
                              l2t2_tcu_mbist_done_t7lff,
                              l2t2_tcu_mbist_fail_t7lff,
                              spc2_tcu_mbist_done_t7lff,
                              spc2_tcu_mbist_fail_t7lff,
                              unconnectedt7lff[ 74 : 28 ],
                              spc2_softstop_request_t7lff,
                              spc2_hardstop_request_t7lff,
                              spc2_trigger_pulse_t7lff,
                              spc2_ss_complete_t7lff,
                              unconnectedt7lff[ 23 : 0 ]
                              }
                             ),
  .l2t_rstg_out		    (
                             {unconnectedt7rff[ 191 : 56 ],
                              mcu3_l2t7_rd_ack_t7rff,
                              mcu3_l2t7_wr_ack_t7rff,
                              mcu3_l2t7_qword_id_r0_t7rff[ 1 : 0 ],
                              mcu3_l2t7_data_vld_r0_t7rff,
                              mcu3_l2t7_rd_req_id_r0_t7rff[ 2 : 0 ],
                              mcu3_l2t7_secc_err_r2_t7rff,
                              mcu3_l2t7_mecc_err_r2_t7rff,
                              mcu3_l2t7_scb_mecc_err_t7rff,
                              mcu3_l2t7_scb_secc_err_t7rff,
                              unconnectedt7rff[ 43 : 0 ]
                             }
                            ),
  .l2t_siu_delay	    (1'b0),
  .l2t_tcu_dmo_out_prev     (l2t3_dmo_dout[ 38 : 0 ]         ), 
  .l2t_tcu_dmo_out          (l2t7_dmo_dout[ 38 : 0 ]         ),
  .tcu_l2t_coresel          (dmo_l2tsel[ 1 ]               ),
  .tcu_l2t_tag_or_data_sel  (dmo_tagmuxctl               ),
  .l2t_dbg_sii_iq_dequeue   (l2t7_dbg1_sii_iq_dequeue	 ),
  .l2t_dbg_sii_wib_dequeue  (l2t7_dbg1_sii_wib_dequeue 	 ),
  .l2t_dbg_xbar_vcid	    (l2t7_dbg1_xbar_vcid[ 5 : 0 ]	 ),
  .l2t_dbg_err_event	    (l2t7_dbg1_err_event	 ),
  .l2t_dbg_pa_match	    (l2t7_dbg1_pa_match		 ),
  .l2t_cpx_req_cq           (sctag7_cpx_req_cq[ 7 : 0 ]      ),// sctag
  .l2t_cpx_atom_cq          (sctag7_cpx_atom_cq          ),
  .l2t_cpx_data_ca          (sctag7_cpx_data_ca[ 145 : 0 ]),
  .l2t_pcx_stall_pq         (sctag7_pcx_stall_pq         ),
  .pcx_l2t_data_rdy_px1     (pcx_sctag7_data_rdy_px1     ),
  .pcx_l2t_data_px2         (pcx_sctag7_data_px2[ 129 : 0 ]),
  .pcx_l2t_atm_px1          (pcx_sctag7_atm_px1          ),
  .cpx_l2t_grant_cx         (cpx_sctag7_grant_cx[ 7 : 0 ]    ),
  .l2t_rst_fatal_error      (l2t7_rst_fatal_error),
  .rst_wmr_protect                (rst_wmr_protect                 ),
  .l2t_l2d_way_sel_c2       (l2t7_l2d7_way_sel_c2        ),
  .l2t_l2d_rd_wr_c2         (l2t7_l2d7_rd_wr_c2          ),
  .l2t_l2d_set_c2           (l2t7_l2d7_set_c2[ 8 : 0 ]       ),
  .l2t_l2d_col_offset_c2    (l2t7_l2d7_col_offset_c2[ 3 : 0 ]),
  .l2t_l2d_word_en_c2       (l2t7_l2d7_word_en_c2        ),
  .l2t_l2d_fbrd_c3          (l2t7_l2d7_fbrd_c3           ),
  .l2t_l2d_fb_hit_c3        (l2t7_l2d7_fb_hit_c3         ),
  .l2t_l2d_stdecc_c2        (l2t7_l2d7_stdecc_c2[ 77 : 0 ]         ),
  .l2d_l2t_decc_c6          (l2d7_l2t7_decc_c6           ),
 // .l2t_l2b_stdecc_c3        (l2t7_l2b7_stdecc_c3[77:0]   ),
  .l2t_l2b_fbrd_en_c3       (l2t7_l2b7_fbrd_en_c3        ),
  .l2t_l2b_fbrd_wl_c3       (l2t7_l2b7_fbrd_wl_c3[ 2 : 0 ]   ),
  .l2t_l2b_fbwr_wen_r2      (l2t7_l2b7_fbwr_wen_r2[ 15 : 0 ] ),
  .l2t_l2b_fbwr_wl_r2       (l2t7_l2b7_fbwr_wl_r2[ 2 : 0 ]   ),
  .l2t_l2b_fbd_stdatasel_c3 (l2t7_l2b7_fbd_stdatasel_c3  ),
  .l2t_l2b_wbwr_wen_c6      (l2t7_l2b7_wbwr_wen_c6[ 3 : 0 ]  ),
  .l2t_l2b_wbwr_wl_c6       (l2t7_l2b7_wbwr_wl_c6[ 2 : 0 ]   ),
  .l2t_l2b_wbrd_en_r0       (l2t7_l2b7_wbrd_en_r0        ),
  .l2t_l2b_wbrd_wl_r0       (l2t7_l2b7_wbrd_wl_r0[ 2 : 0 ]   ),
  .l2t_l2b_ev_dword_r0      (l2t7_l2b7_ev_dword_r0[ 2 : 0 ]  ),
  .l2t_l2b_evict_en_r0      (l2t7_l2b7_evict_en_r0       ),
  .l2b_l2t_ev_uerr_r5       (l2b7_l2t7_ev_uerr_r5        ),
  .l2b_l2t_ev_cerr_r5       (l2b7_l2t7_ev_cerr_r5        ),
  .l2t_l2b_rdma_wren_s2     (l2t7_l2b7_rdma_wren_s2[ 15 : 0 ]),
  .l2t_l2b_rdma_wrwl_s2     (l2t7_l2b7_rdma_wrwl_s2[ 1 : 0 ] ),
  .l2t_l2b_rdma_rdwl_r0     (l2t7_l2b7_rdma_rdwl_r0[ 1 : 0 ] ),
  .l2t_l2b_rdma_rden_r0     (l2t7_l2b7_rdma_rden_r0      ),
  .l2t_l2b_ctag_en_c7       (l2t7_l2b7_ctag_en_c7        ),
  .l2t_l2b_ctag_c7          (l2t7_l2b7_ctag_c7[ 31 : 0 ]     ),
  .l2t_l2b_word_c7          (l2t7_l2b7_word_c7[ 3 : 0 ]      ),
  .l2t_l2b_req_en_c7        (l2t7_l2b7_req_en_c7         ),
  .l2t_l2b_word_vld_c7      (l2t7_l2b7_word_vld_c7       ),
  .l2b_l2t_rdma_uerr_c10    (l2b7_l2t7_rdma_uerr_c10     ),
  .l2b_l2t_rdma_cerr_c10    (l2b7_l2t7_rdma_cerr_c10     ),
  .l2b_l2t_rdma_notdata_c10 (l2b7_l2t7_rdma_notdata_c10  ),
  .l2t_mcu_rd_req           (l2t7_mcu3_rd_req            ),
  .l2t_mcu_rd_dummy_req     (l2t7_mcu3_rd_dummy_req      ),
  .l2t_mcu_rd_req_id        (l2t7_mcu3_rd_req_id[ 2 : 0 ]    ),
  .l2t_mcu_addr             (l2t7_mcu3_addr[ 39 : 7 ]        ),
  .l2t_mcu_addr_5           (l2t7_mcu3_addr_5            ),
  .l2t_mcu_wr_req           (l2t7_mcu3_wr_req            ),
  .mcu_l2t_rd_ack           (mcu3_l2t7_rd_ack_t7rff            ),
  .mcu_l2t_wr_ack           (mcu3_l2t7_wr_ack_t7rff            ),
  .mcu_l2t_chunk_id_r0      (mcu3_l2t7_qword_id_r0_t7rff[ 1 : 0 ]  ),
  .mcu_l2t_data_vld_r0      (mcu3_l2t7_data_vld_r0_t7rff       ),
  .mcu_l2t_rd_req_id_r0     (mcu3_l2t7_rd_req_id_r0_t7rff[ 2 : 0 ] ),
  .mcu_l2t_secc_err_r2      (mcu3_l2t7_secc_err_r2_t7rff       ),
  .mcu_l2t_mecc_err_r2      (mcu3_l2t7_mecc_err_r2_t7rff       ),
  .mcu_l2t_scb_mecc_err     (mcu3_l2t7_scb_mecc_err_t7rff      ),
  .mcu_l2t_scb_secc_err     (mcu3_l2t7_scb_secc_err_t7rff      ),
  .sii_l2t_req_vld          (sii_l2t7_req_vld_t6lff            ),
  .sii_l2t_req              (sii_l2t7_req_t6lff[ 31 : 0 ]          ),
  .sii_l2b_ecc              (sii_l2b7_ecc_ccxrff[ 6 : 0 ]           ),
  .l2t_sii_iq_dequeue       (l2t7_sii_iq_dequeue         ),
  .l2t_sii_wib_dequeue      (l2t7_sii_wib_dequeue        ),
  .rst_por_                 ( gl_l2_por_c2b ), 
  .rst_wmr_                 ( gl_l2_wmr_c2b ), 
  .scan_in                  (l2t6_scan_out               ),
  .scan_out                 (l2t7_scan_out               ),
  .tcu_mbist_bisi_en        (tcu_mbist_bisi_en           ),
  .tcu_l2t_mbist_start      (tcu_l2t7_mbist_start),
  .tcu_l2t_mbist_scan_in    (tcu_l2t7_mbist_scan_in      ),
  .l2t_tcu_mbist_done       (l2t7_tcu_mbist_done),
  .l2t_tcu_mbist_fail       (l2t7_tcu_mbist_fail),
  .l2t_tcu_mbist_scan_out   (l2t7_tcu_mbist_scan_out     ),
  .efu_l2t_fuse_clr          (efu_l2t7_fuse_clr          ),                       
  .efu_l2t_fuse_xfer_en      (efu_l2t7_fuse_xfer_en      ),                       
  .efu_l2t_fuse_data         (efu_l2t1357_fuse_data         ),                       
  .l2t_efu_fuse_data         (l2t7_efu_fuse_data         ),                       
  .l2t_efu_fuse_xfer_en      (l2t7_efu_fuse_xfer_en      ),                       
  .gclk                     ( cmp_gclk_c2_l2t7 ),
  .tcu_clk_stop ( gl_l2t7_clk_stop ),	// staged clk_stop
  .tcu_l2t_shscan_scan_in         (tcu_l2t7_shscan_scan_in ),
  .tcu_l2t_shscan_aclk            (tcu_l2t_shscan_aclk    ),
  .tcu_l2t_shscan_bclk            (tcu_l2t_shscan_bclk    ),
  .tcu_l2t_shscan_scan_en         (tcu_l2t_shscan_scan_en ),
  .tcu_l2t_shscan_pce_ov          (tcu_l2t_shscan_pce_ov  ),
  .l2t_tcu_shscan_scan_out        (l2t7_tcu_shscan_scan_out),
  .tcu_l2t_shscan_clk_stop        (tcu_l2t7_shscan_clk_stop),
  .vnw_ary                            (L2T_VNW[ 7 ]),
  .l2t_rep_in0                        (24'b0),
  .l2t_rep_in1                        (24'b0),
  .l2t_rep_in2                        (24'b0),
  .l2t_rep_in3                        (24'b0),
  .l2t_rep_in4                        (24'b0),
  .l2t_rep_in5                        (24'b0),
  .l2t_rep_in6                        (24'b0),
  .l2t_rep_in7                        (24'b0),
  .l2t_rep_in8                        (24'b0),
  .l2t_rep_in9                        (24'b0),
  .l2t_rep_in10                       (24'b0),
  .l2t_rep_in11                       (24'b0),
  .l2t_rep_in12                       (24'b0),
  .l2t_rep_in13                       (24'b0),
  .l2t_rep_in14                       (24'b0),
  .l2t_rep_in15                       (24'b0),
  .l2t_rep_in16                       (24'b0),
  .l2t_rep_in17                       (24'b0),
  .l2t_rep_in18                       (24'b0),
  .l2t_rep_in19                       (24'b0),
  .l2t_rep_out0                       (l2t7_rep_out0_unused[ 23 : 0 ]),
  .l2t_rep_out1                       (l2t7_rep_out1_unused[ 23 : 0 ]),
  .l2t_rep_out2                       (l2t7_rep_out2_unused[ 23 : 0 ]),
  .l2t_rep_out3                       (l2t7_rep_out3_unused[ 23 : 0 ]),
  .l2t_rep_out4                       (l2t7_rep_out4_unused[ 23 : 0 ]),
  .l2t_rep_out5                       (l2t7_rep_out5_unused[ 23 : 0 ]),
  .l2t_rep_out6                       (l2t7_rep_out6_unused[ 23 : 0 ]),
  .l2t_rep_out7                       (l2t7_rep_out7_unused[ 23 : 0 ]),
  .l2t_rep_out8                       (l2t7_rep_out8_unused[ 23 : 0 ]),
  .l2t_rep_out9                       (l2t7_rep_out9_unused[ 23 : 0 ]),
  .l2t_rep_out10                      (l2t7_rep_out10_unused[ 23 : 0 ]),
  .l2t_rep_out11                      (l2t7_rep_out11_unused[ 23 : 0 ]),
  .l2t_rep_out12                      (l2t7_rep_out12_unused[ 23 : 0 ]),
  .l2t_rep_out13                      (l2t7_rep_out13_unused[ 23 : 0 ]),
  .l2t_rep_out14                      (l2t7_rep_out14_unused[ 23 : 0 ]),
  .l2t_rep_out15                      (l2t7_rep_out15_unused[ 23 : 0 ]),
  .l2t_rep_out16                      (l2t7_rep_out16_unused[ 23 : 0 ]),
  .l2t_rep_out17                      (l2t7_rep_out17_unused[ 23 : 0 ]),
  .l2t_rep_out18                      (l2t7_rep_out18_unused[ 23 : 0 ]),
  .l2t_rep_out19                      (l2t7_rep_out19_unused[ 23 : 0 ]),
  .ncu_l2t_pm(ncu_l2t_pm),
  .ncu_l2t_ba01(ncu_l2t_ba01),
  .ncu_l2t_ba23(ncu_l2t_ba23),
  .ncu_l2t_ba45(ncu_l2t_ba45),
  .ncu_l2t_ba67(ncu_l2t_ba67),
  .ncu_spc0_core_enable_status(ncu_spc0_core_enable_status),
  .ncu_spc1_core_enable_status(ncu_spc1_core_enable_status),
  .ncu_spc2_core_enable_status(ncu_spc2_core_enable_status),
  .ncu_spc3_core_enable_status(ncu_spc3_core_enable_status),
  .ncu_spc4_core_enable_status(ncu_spc4_core_enable_status),
  .ncu_spc5_core_enable_status(ncu_spc5_core_enable_status),
  .ncu_spc6_core_enable_status(ncu_spc6_core_enable_status),
  .ncu_spc7_core_enable_status(ncu_spc7_core_enable_status),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_array_bypass(tcu_array_bypass),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_user_mode(tcu_mbist_user_mode)
        );
//________________________________________________________________

l2b l2b0(
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c3t0 ), // ( gl_io_cmp_sync_en_c3t ), - for int6.1
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c3t0 ), // ( gl_cmp_io_sync_en_c3t ), - for int6.1
  .select_delay_mcu ( 1'b0 ),

  .gclk                     ( cmp_gclk_c3_l2b0 ), // cmp_gclk_c0_r[1]), 
  .tcu_clk_stop ( gl_l2b0_clk_stop ),	// staged clk_stop
  .rst_por_                 (gl_l2_por_c3t0 			), // ( gl_l2_por_c3t ), - for int6.1
  .rst_wmr_                 (gl_l2_wmr_c3t0 			), // ( gl_l2_wmr_c3t ), - for int6.1
  .l2t_l2b_fbrd_en_c3       (l2t0_l2b0_fbrd_en_c3        ),// scbuf
  .l2t_l2b_fbrd_wl_c3       (l2t0_l2b0_fbrd_wl_c3        ),
  .l2t_l2b_fbwr_wen_r2      (l2t0_l2b0_fbwr_wen_r2       ),
  .l2t_l2b_fbwr_wl_r2       (l2t0_l2b0_fbwr_wl_r2        ),
  .l2t_l2b_fbd_stdatasel_c3 (l2t0_l2b0_fbd_stdatasel_c3  ),
  .l2t_l2b_stdecc_c2        (l2t0_l2d0_stdecc_c2[ 77 : 0 ]         ),
  .l2t_l2b_evict_en_r0      (l2t0_l2b0_evict_en_r0       ),
  .l2t_l2b_wbwr_wen_c6      (l2t0_l2b0_wbwr_wen_c6       ),
  .l2t_l2b_wbwr_wl_c6       (l2t0_l2b0_wbwr_wl_c6        ),
  .l2t_l2b_wbrd_en_r0       (l2t0_l2b0_wbrd_en_r0        ),
  .l2t_l2b_wbrd_wl_r0       (l2t0_l2b0_wbrd_wl_r0        ),
  .l2t_l2b_ev_dword_r0      (l2t0_l2b0_ev_dword_r0       ),
  .l2t_l2b_rdma_wren_s2     (l2t0_l2b0_rdma_wren_s2      ),
  .l2t_l2b_rdma_wrwl_s2     (l2t0_l2b0_rdma_wrwl_s2      ),
  .l2t_l2b_rdma_rden_r0     (l2t0_l2b0_rdma_rden_r0      ),
  .l2t_l2b_rdma_rdwl_r0     (l2t0_l2b0_rdma_rdwl_r0      ),
  .l2t_l2b_ctag_en_c7       (l2t0_l2b0_ctag_en_c7        ),
  .l2t_l2b_ctag_c7          (l2t0_l2b0_ctag_c7[ 31 : 0 ]     ),
  .l2t_l2b_req_en_c7        (l2t0_l2b0_req_en_c7         ),
  .l2t_l2b_word_c7          (l2t0_l2b0_word_c7           ),
  .l2t_l2b_word_vld_c7      (l2t0_l2b0_word_vld_c7       ),
  .sii_l2t_req              (sii_l2t0_req                ),
  .sii_l2b_ecc              (sii_l2b0_ecc[ 6 : 0 ]           ),
  .l2b_l2d_rvalue          (l2b0_l2d0_rvalue[ 9 : 0 ]),
  .l2b_l2d_rid             (l2b0_l2d0_rid[ 6 : 0 ]),      
  .l2b_l2d_wr_en           (l2b0_l2d0_wr_en),
  .l2b_l2d_fuse_clr        (l2b0_l2d0_fuse_clr),
  .l2d_l2b_fuse_read_data  (l2d0_l2b0_fuse_data[ 9 : 0 ]),
  .efu_l2b_fuse_data       (efu_l2b0246_fuse_data),
  .efu_l2b_fuse_xfer_en    (efu_l2b0_fuse_xfer_en),
  .efu_l2b_fuse_clr        (efu_l2b0_fuse_clr),
  .l2b_efu_fuse_xfer_en    (l2b0_efu_fuse_xfer_en),
  .l2b_efu_fuse_data       (l2b0_efu_fuse_data),
  .l2b_dbg_sio_ctag_vld	    (l2b0_dbg0_sio_ctag_vld	 ),
  .l2b_dbg_sio_ack_type	    (l2b0_dbg0_sio_ack_type	 ),
  .l2b_dbg_sio_ack_dest	    (l2b0_dbg0_sio_ack_dest	 ),
  .l2b_sio_ctag_vld         (l2b0_sio_ctag_vld           ),
  .l2b_sio_data             (l2b0_sio_data[ 31 : 0 ]         ),
  .l2b_sio_parity           (l2b0_sio_parity[ 1 : 0 ]        ),     
  .l2b_sio_ue_err           (l2b0_sio_ue_err             ),
  .l2b_l2t_rdma_uerr_c10    (l2b0_l2t0_rdma_uerr_c10     ),
  .l2b_l2t_rdma_cerr_c10    (l2b0_l2t0_rdma_cerr_c10     ),
  .l2b_l2t_rdma_notdata_c10 (l2b0_l2t0_rdma_notdata_c10  ),
  .l2b_l2t_ev_uerr_r5       (l2b0_l2t0_ev_uerr_r5        ),
  .l2b_l2t_ev_cerr_r5       (l2b0_l2t0_ev_cerr_r5        ),
  .l2d_l2b_decc_out_c7      (l2d0_l2b0_decc_out_c7       ),
  .l2b_l2d_fbdecc_c4        (l2b0_l2d0_fbdecc_c4         ),
  .mcu_l2b_data_r2          (mcu0_l2b01_data_r2[ 127 : 0 ]   ),
  .mcu_l2b_ecc_r2           (mcu0_l2b01_ecc_r2[ 27 : 0 ]     ),
  .tcu_mbist_bisi_en        (tcu_mbist_bisi_en           ),
  .tcu_l2b_mbist_start      (tcu_l2b0_mbist_start_ccxlff        ),
  .l2b_tcu_mbist_done       (l2b0_tcu_mbist_done         ),
  .l2b_tcu_mbist_fail       (l2b0_tcu_mbist_fail         ),
  .tcu_l2b_mbist_scan_in    (tcu_l2b0_mbist_scan_in      ),
  .l2b_tcu_mbist_scan_out   (l2b0_tcu_mbist_scan_out     ),
  .l2b_evict_l2b_mcu_data_mecc_r5
                            (l2b0_mcu0_data_mecc_r5      ),
  .evict_l2b_mcu_wr_data_r5 (l2b0_mcu0_wr_data_r5[ 63 : 0 ]  ),
  .evict_l2b_mcu_data_vld_r5(l2b0_mcu0_data_vld_r5       ),
  .scan_in                  (tcu_soch_scan_out           ),
  .scan_out                 (l2b0_scan_out               ),
  .rst_wmr_protect(rst_wmr_protect),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_array_bypass(tcu_array_bypass),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_user_mode(tcu_mbist_user_mode)
//.so                       (                            )
        );
//________________________________________________________________

l2b l2b1(
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c3t ),
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c3t ),
  .select_delay_mcu ( 1'b1 ),


  .gclk                     ( cmp_gclk_c3_l2b1 ), // cmp_gclk_c0_r[2]		 ), 
  .tcu_clk_stop ( gl_l2b1_clk_stop ),	// staged clk_stop
  .rst_por_                 ( gl_l2_por_c3t ), 
  .rst_wmr_                 ( gl_l2_wmr_c3t ), 
  .l2t_l2b_fbrd_en_c3       (l2t1_l2b1_fbrd_en_c3        ),// scbuf
  .l2t_l2b_fbrd_wl_c3       (l2t1_l2b1_fbrd_wl_c3        ),
  .l2t_l2b_fbwr_wen_r2      (l2t1_l2b1_fbwr_wen_r2       ),
  .l2t_l2b_fbwr_wl_r2       (l2t1_l2b1_fbwr_wl_r2        ),
  .l2t_l2b_fbd_stdatasel_c3 (l2t1_l2b1_fbd_stdatasel_c3  ),
  .l2t_l2b_stdecc_c2        (l2t1_l2d1_stdecc_c2[ 77 : 0 ]         ),
  .l2t_l2b_evict_en_r0      (l2t1_l2b1_evict_en_r0       ),
  .l2t_l2b_wbwr_wen_c6      (l2t1_l2b1_wbwr_wen_c6       ),
  .l2t_l2b_wbwr_wl_c6       (l2t1_l2b1_wbwr_wl_c6        ),
  .l2t_l2b_wbrd_en_r0       (l2t1_l2b1_wbrd_en_r0        ),
  .l2t_l2b_wbrd_wl_r0       (l2t1_l2b1_wbrd_wl_r0        ),
  .l2t_l2b_ev_dword_r0      (l2t1_l2b1_ev_dword_r0       ),
  .l2t_l2b_rdma_wren_s2     (l2t1_l2b1_rdma_wren_s2      ),
  .l2t_l2b_rdma_wrwl_s2     (l2t1_l2b1_rdma_wrwl_s2      ),
  .l2t_l2b_rdma_rden_r0     (l2t1_l2b1_rdma_rden_r0      ),
  .l2t_l2b_rdma_rdwl_r0     (l2t1_l2b1_rdma_rdwl_r0      ),
  .l2t_l2b_ctag_en_c7       (l2t1_l2b1_ctag_en_c7        ),
  .l2t_l2b_ctag_c7          (l2t1_l2b1_ctag_c7[ 31 : 0 ]     ),
  .l2t_l2b_req_en_c7        (l2t1_l2b1_req_en_c7         ),
  .l2t_l2b_word_c7          (l2t1_l2b1_word_c7           ),
  .l2t_l2b_word_vld_c7      (l2t1_l2b1_word_vld_c7       ),
  .sii_l2t_req              (sii_l2t1_req                ),
  .sii_l2b_ecc              (sii_l2b1_ecc[ 6 : 0 ]           ),
  .l2b_l2d_rvalue          (l2b1_l2d1_rvalue[ 9 : 0 ]),
  .l2b_l2d_rid             (l2b1_l2d1_rid[ 6 : 0 ]),      
  .l2b_l2d_wr_en           (l2b1_l2d1_wr_en),
  .l2b_l2d_fuse_clr        (l2b1_l2d1_fuse_clr),
  .l2d_l2b_fuse_read_data  (l2d1_l2b1_fuse_data[ 9 : 0 ]),
  .efu_l2b_fuse_data       (efu_l2b1357_fuse_data),
  .efu_l2b_fuse_xfer_en    (efu_l2b1_fuse_xfer_en),
  .efu_l2b_fuse_clr        (efu_l2b1_fuse_clr),
  .l2b_efu_fuse_xfer_en    (l2b1_efu_fuse_xfer_en),
  .l2b_efu_fuse_data       (l2b1_efu_fuse_data),
  .l2b_dbg_sio_ctag_vld	    (l2b1_dbg0_sio_ctag_vld	 ),
  .l2b_dbg_sio_ack_type	    (l2b1_dbg0_sio_ack_type	 ),
  .l2b_dbg_sio_ack_dest	    (l2b1_dbg0_sio_ack_dest	 ),
  .l2b_sio_ctag_vld         (l2b1_sio_ctag_vld           ),
  .l2b_sio_data             (l2b1_sio_data[ 31 : 0 ]         ),
  .l2b_sio_parity           (l2b1_sio_parity[ 1 : 0 ]        ),     
  .l2b_sio_ue_err           (l2b1_sio_ue_err             ),
  .l2b_l2t_rdma_uerr_c10    (l2b1_l2t1_rdma_uerr_c10     ),
  .l2b_l2t_rdma_cerr_c10    (l2b1_l2t1_rdma_cerr_c10     ),
  .l2b_l2t_rdma_notdata_c10 (l2b1_l2t1_rdma_notdata_c10  ),
  .l2b_l2t_ev_uerr_r5       (l2b1_l2t1_ev_uerr_r5        ),
  .l2b_l2t_ev_cerr_r5       (l2b1_l2t1_ev_cerr_r5        ),
  .l2d_l2b_decc_out_c7      (l2d1_l2b1_decc_out_c7       ),
  .l2b_l2d_fbdecc_c4        (l2b1_l2d1_fbdecc_c4         ),
  .mcu_l2b_data_r2          (mcu0_l2b01_data_r2[ 127 : 0 ]   ),
  .mcu_l2b_ecc_r2           (mcu0_l2b01_ecc_r2[ 27 : 0 ]     ),
  .tcu_mbist_bisi_en        (tcu_mbist_bisi_en           ),
  .tcu_l2b_mbist_start      (tcu_l2b1_mbist_start_ccxlff        ),
  .l2b_tcu_mbist_done       (l2b1_tcu_mbist_done         ),
  .l2b_tcu_mbist_fail       (l2b1_tcu_mbist_fail         ),
  .tcu_l2b_mbist_scan_in    (tcu_l2b1_mbist_scan_in      ),
  .l2b_tcu_mbist_scan_out   (l2b1_tcu_mbist_scan_out     ),
  .l2b_evict_l2b_mcu_data_mecc_r5
                            (l2b1_mcu0_data_mecc_r5      ),
  .evict_l2b_mcu_wr_data_r5 (l2b1_mcu0_wr_data_r5[ 63 : 0 ]  ),
  .evict_l2b_mcu_data_vld_r5(l2b1_mcu0_data_vld_r5       ),
  .scan_in                  (l2b0_scan_out               ),
  .scan_out                 (l2b1_scan_out               ),
  .rst_wmr_protect(rst_wmr_protect),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_array_bypass(tcu_array_bypass),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_user_mode(tcu_mbist_user_mode)
//.so                       (                            )
        );
//________________________________________________________________

l2b l2b2(
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c3b ), // gl_io_cmp_sync_en_c3t0 - for int6.1
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c3b ), // gl_cmp_io_sync_en_c3t0 - for int6.1
  .select_delay_mcu ( 1'b0 ),


  .gclk                     ( cmp_gclk_c3_l2b2 ), // cmp_gclk_c0_r[4]            ), 
  .tcu_clk_stop ( gl_l2b2_clk_stop ),	// staged clk_stop
  .rst_por_                 ( gl_l2_por_c3b0 ), // ( gl_l2_por_c3t0 ), - for int6.1 
  .rst_wmr_                 ( gl_l2_wmr_c3b ), // ( gl_l2_wmr_c3t0 ), - for int6.1 
  .l2t_l2b_fbrd_en_c3       (l2t2_l2b2_fbrd_en_c3        ),// scbuf
  .l2t_l2b_fbrd_wl_c3       (l2t2_l2b2_fbrd_wl_c3        ),
  .l2t_l2b_fbwr_wen_r2      (l2t2_l2b2_fbwr_wen_r2       ),
  .l2t_l2b_fbwr_wl_r2       (l2t2_l2b2_fbwr_wl_r2        ),
  .l2t_l2b_fbd_stdatasel_c3 (l2t2_l2b2_fbd_stdatasel_c3  ),
  .l2t_l2b_stdecc_c2        (l2t2_l2d2_stdecc_c2[ 77 : 0 ]         ),
  .l2t_l2b_evict_en_r0      (l2t2_l2b2_evict_en_r0       ),
  .l2t_l2b_wbwr_wen_c6      (l2t2_l2b2_wbwr_wen_c6       ),
  .l2t_l2b_wbwr_wl_c6       (l2t2_l2b2_wbwr_wl_c6        ),
  .l2t_l2b_wbrd_en_r0       (l2t2_l2b2_wbrd_en_r0        ),
  .l2t_l2b_wbrd_wl_r0       (l2t2_l2b2_wbrd_wl_r0        ),
  .l2t_l2b_ev_dword_r0      (l2t2_l2b2_ev_dword_r0       ),
  .l2t_l2b_rdma_wren_s2     (l2t2_l2b2_rdma_wren_s2      ),
  .l2t_l2b_rdma_wrwl_s2     (l2t2_l2b2_rdma_wrwl_s2      ),
  .l2t_l2b_rdma_rden_r0     (l2t2_l2b2_rdma_rden_r0      ),
  .l2t_l2b_rdma_rdwl_r0     (l2t2_l2b2_rdma_rdwl_r0      ),
  .l2t_l2b_ctag_en_c7       (l2t2_l2b2_ctag_en_c7        ),
  .l2t_l2b_ctag_c7          (l2t2_l2b2_ctag_c7[ 31 : 0 ]     ),
  .l2t_l2b_req_en_c7        (l2t2_l2b2_req_en_c7         ),
  .l2t_l2b_word_c7          (l2t2_l2b2_word_c7           ),
  .l2t_l2b_word_vld_c7      (l2t2_l2b2_word_vld_c7       ),
  .sii_l2t_req              (sii_l2t2_req                ),
  .sii_l2b_ecc              (sii_l2b2_ecc[ 6 : 0 ]           ),
  .l2b_l2d_rvalue          (l2b2_l2d2_rvalue[ 9 : 0 ]),
  .l2b_l2d_rid             (l2b2_l2d2_rid[ 6 : 0 ]),      
  .l2b_l2d_wr_en           (l2b2_l2d2_wr_en),
  .l2b_l2d_fuse_clr        (l2b2_l2d2_fuse_clr),
  .l2d_l2b_fuse_read_data  (l2d2_l2b2_fuse_data[ 9 : 0 ]),
  .efu_l2b_fuse_data       (efu_l2b0246_fuse_data),
  .efu_l2b_fuse_xfer_en    (efu_l2b2_fuse_xfer_en),
  .efu_l2b_fuse_clr        (efu_l2b2_fuse_clr),
  .l2b_efu_fuse_xfer_en    (l2b2_efu_fuse_xfer_en),
  .l2b_efu_fuse_data       (l2b2_efu_fuse_data),
  .l2b_dbg_sio_ctag_vld	    (l2b2_dbg0_sio_ctag_vld	 ),
  .l2b_dbg_sio_ack_type	    (l2b2_dbg0_sio_ack_type	 ),
  .l2b_dbg_sio_ack_dest	    (l2b2_dbg0_sio_ack_dest	 ),
  .l2b_sio_ctag_vld         (l2b2_sio_ctag_vld           ),
  .l2b_sio_data             (l2b2_sio_data[ 31 : 0 ]         ),
  .l2b_sio_parity           (l2b2_sio_parity[ 1 : 0 ]        ),     
  .l2b_sio_ue_err           (l2b2_sio_ue_err             ),
  .l2b_l2t_rdma_uerr_c10    (l2b2_l2t2_rdma_uerr_c10     ),
  .l2b_l2t_rdma_cerr_c10    (l2b2_l2t2_rdma_cerr_c10     ),
  .l2b_l2t_rdma_notdata_c10 (l2b2_l2t2_rdma_notdata_c10  ),
  .l2b_l2t_ev_uerr_r5       (l2b2_l2t2_ev_uerr_r5        ),
  .l2b_l2t_ev_cerr_r5       (l2b2_l2t2_ev_cerr_r5        ),
  .l2d_l2b_decc_out_c7      (l2d2_l2b2_decc_out_c7       ),
  .l2b_l2d_fbdecc_c4        (l2b2_l2d2_fbdecc_c4         ),
  .mcu_l2b_data_r2          (mcu1_l2b23_data_r2[ 127 : 0 ]   ),
  .mcu_l2b_ecc_r2           (mcu1_l2b23_ecc_r2[ 27 : 0 ]     ),
  .tcu_mbist_bisi_en        (tcu_mbist_bisi_en           ),
  .tcu_l2b_mbist_start      (tcu_l2b2_mbist_start_ccxlff        ),
  .l2b_tcu_mbist_done       (l2b2_tcu_mbist_done         ),
  .l2b_tcu_mbist_fail       (l2b2_tcu_mbist_fail         ),
  .tcu_l2b_mbist_scan_in    (tcu_l2b2_mbist_scan_in      ),
  .l2b_tcu_mbist_scan_out   (l2b2_tcu_mbist_scan_out     ),
  .l2b_evict_l2b_mcu_data_mecc_r5
                            (l2b2_mcu1_data_mecc_r5      ),
  .evict_l2b_mcu_wr_data_r5 (l2b2_mcu1_wr_data_r5[ 63 : 0 ]  ),
  .evict_l2b_mcu_data_vld_r5(l2b2_mcu1_data_vld_r5       ),
  .scan_in                  (l2b1_scan_out               ),
  .scan_out                 (l2b2_scan_out               ),
  .rst_wmr_protect(rst_wmr_protect),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_array_bypass(tcu_array_bypass),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_user_mode(tcu_mbist_user_mode)
//.so                       (                          )
        );
//________________________________________________________________

l2b l2b3(


  .select_delay_mcu ( 1'b1 ),
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c3b ), // ( gl_io_cmp_sync_en_c3t0 ), - for int6.1
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c3b ), // ( gl_cmp_io_sync_en_c3t0 ), - for int6.1
  .gclk                     ( cmp_gclk_c3_l2b3 ), // cmp_gclk_c0_r[5]            ), 
  .tcu_clk_stop ( gl_l2b3_clk_stop ),	// staged clk_stop
  .rst_por_                 ( gl_l2_por_c3b0 ), // ( gl_l2_por_c3t0 ),  - for int6.1
  .rst_wmr_                 ( gl_l2_wmr_c3b ), // ( gl_l2_wmr_c3t0 ),  - for int6.1
  .l2t_l2b_fbrd_en_c3       (l2t3_l2b3_fbrd_en_c3        ),// scbuf
  .l2t_l2b_fbrd_wl_c3       (l2t3_l2b3_fbrd_wl_c3        ),
  .l2t_l2b_fbwr_wen_r2      (l2t3_l2b3_fbwr_wen_r2       ),
  .l2t_l2b_fbwr_wl_r2       (l2t3_l2b3_fbwr_wl_r2        ),
  .l2t_l2b_fbd_stdatasel_c3 (l2t3_l2b3_fbd_stdatasel_c3  ),
  .l2t_l2b_stdecc_c2        (l2t3_l2d3_stdecc_c2[ 77 : 0 ]         ),
  .l2t_l2b_evict_en_r0      (l2t3_l2b3_evict_en_r0       ),
  .l2t_l2b_wbwr_wen_c6      (l2t3_l2b3_wbwr_wen_c6       ),
  .l2t_l2b_wbwr_wl_c6       (l2t3_l2b3_wbwr_wl_c6        ),
  .l2t_l2b_wbrd_en_r0       (l2t3_l2b3_wbrd_en_r0        ),
  .l2t_l2b_wbrd_wl_r0       (l2t3_l2b3_wbrd_wl_r0        ),
  .l2t_l2b_ev_dword_r0      (l2t3_l2b3_ev_dword_r0       ),
  .l2t_l2b_rdma_wren_s2     (l2t3_l2b3_rdma_wren_s2      ),
  .l2t_l2b_rdma_wrwl_s2     (l2t3_l2b3_rdma_wrwl_s2      ),
  .l2t_l2b_rdma_rden_r0     (l2t3_l2b3_rdma_rden_r0      ),
  .l2t_l2b_rdma_rdwl_r0     (l2t3_l2b3_rdma_rdwl_r0      ),
  .l2t_l2b_ctag_en_c7       (l2t3_l2b3_ctag_en_c7        ),
  .l2t_l2b_ctag_c7          (l2t3_l2b3_ctag_c7[ 31 : 0 ]     ),
  .l2t_l2b_req_en_c7        (l2t3_l2b3_req_en_c7         ),
  .l2t_l2b_word_c7          (l2t3_l2b3_word_c7           ),
  .l2t_l2b_word_vld_c7      (l2t3_l2b3_word_vld_c7       ),
  .sii_l2t_req              (sii_l2t3_req                ),
  .sii_l2b_ecc              (sii_l2b3_ecc[ 6 : 0 ]           ),
  .l2b_l2d_rvalue          (l2b3_l2d3_rvalue[ 9 : 0 ]),
  .l2b_l2d_rid             (l2b3_l2d3_rid[ 6 : 0 ]),      
  .l2b_l2d_wr_en           (l2b3_l2d3_wr_en),
  .l2b_l2d_fuse_clr        (l2b3_l2d3_fuse_clr),
  .l2d_l2b_fuse_read_data  (l2d3_l2b3_fuse_data[ 9 : 0 ]),
  .efu_l2b_fuse_data       (efu_l2b1357_fuse_data),
  .efu_l2b_fuse_xfer_en    (efu_l2b3_fuse_xfer_en),
  .efu_l2b_fuse_clr        (efu_l2b3_fuse_clr),
  .l2b_efu_fuse_xfer_en    (l2b3_efu_fuse_xfer_en),
  .l2b_efu_fuse_data       (l2b3_efu_fuse_data),
  .l2b_dbg_sio_ctag_vld	    (l2b3_dbg0_sio_ctag_vld	 ),
  .l2b_dbg_sio_ack_type	    (l2b3_dbg0_sio_ack_type	 ),
  .l2b_dbg_sio_ack_dest	    (l2b3_dbg0_sio_ack_dest	 ),
  .l2b_sio_ctag_vld         (l2b3_sio_ctag_vld           ),
  .l2b_sio_data             (l2b3_sio_data[ 31 : 0 ]         ),
  .l2b_sio_parity           (l2b3_sio_parity[ 1 : 0 ]        ),     
  .l2b_sio_ue_err           (l2b3_sio_ue_err             ),
  .l2b_l2t_rdma_uerr_c10    (l2b3_l2t3_rdma_uerr_c10     ),
  .l2b_l2t_rdma_cerr_c10    (l2b3_l2t3_rdma_cerr_c10     ),
  .l2b_l2t_rdma_notdata_c10 (l2b3_l2t3_rdma_notdata_c10  ),
  .l2b_l2t_ev_uerr_r5       (l2b3_l2t3_ev_uerr_r5        ),
  .l2b_l2t_ev_cerr_r5       (l2b3_l2t3_ev_cerr_r5        ),
  .l2d_l2b_decc_out_c7      (l2d3_l2b3_decc_out_c7       ),
  .l2b_l2d_fbdecc_c4        (l2b3_l2d3_fbdecc_c4         ),
  .mcu_l2b_data_r2          (mcu1_l2b23_data_r2[ 127 : 0 ]   ),
  .mcu_l2b_ecc_r2           (mcu1_l2b23_ecc_r2[ 27 : 0 ]     ),
  .tcu_mbist_bisi_en        (tcu_mbist_bisi_en           ),
  .tcu_l2b_mbist_start      (tcu_l2b3_mbist_start_ccxlff        ),
  .l2b_tcu_mbist_done       (l2b3_tcu_mbist_done         ),
  .l2b_tcu_mbist_fail       (l2b3_tcu_mbist_fail         ),
  .tcu_l2b_mbist_scan_in    (tcu_l2b3_mbist_scan_in      ),
  .l2b_tcu_mbist_scan_out   (l2b3_tcu_mbist_scan_out     ),
  .l2b_evict_l2b_mcu_data_mecc_r5
                            (l2b3_mcu1_data_mecc_r5      ),
  .evict_l2b_mcu_wr_data_r5 (l2b3_mcu1_wr_data_r5[ 63 : 0 ]  ),
  .evict_l2b_mcu_data_vld_r5(l2b3_mcu1_data_vld_r5       ),
  .scan_in                  (l2b2_scan_out               ),
  .scan_out                 (l2b3_scan_out               ),
  .rst_wmr_protect(rst_wmr_protect),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_array_bypass(tcu_array_bypass),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_user_mode(tcu_mbist_user_mode)
//.so                       (                            )
        );
//________________________________________________________________

l2b l2b4(
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c1t ), 
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c1t ),
  .select_delay_mcu ( 1'b0 ),


  .gclk                     ( cmp_gclk_c1_l2b4 ), // cmp_gclk_c3_r[1]            ), 
  .tcu_clk_stop ( gl_l2b4_clk_stop ),	// staged clk_stop
  .rst_por_                 ( gl_l2_por_c1t ), 
  .rst_wmr_                 ( gl_l2_wmr_c1t ), 
  .l2t_l2b_fbrd_en_c3       (l2t4_l2b4_fbrd_en_c3        ),// scbuf
  .l2t_l2b_fbrd_wl_c3       (l2t4_l2b4_fbrd_wl_c3        ),
  .l2t_l2b_fbwr_wen_r2      (l2t4_l2b4_fbwr_wen_r2       ),
  .l2t_l2b_fbwr_wl_r2       (l2t4_l2b4_fbwr_wl_r2        ),
  .l2t_l2b_fbd_stdatasel_c3 (l2t4_l2b4_fbd_stdatasel_c3  ),
  .l2t_l2b_stdecc_c2        (l2t4_l2d4_stdecc_c2[ 77 : 0 ]         ),
  .l2t_l2b_evict_en_r0      (l2t4_l2b4_evict_en_r0       ),
  .l2t_l2b_wbwr_wen_c6      (l2t4_l2b4_wbwr_wen_c6       ),
  .l2t_l2b_wbwr_wl_c6       (l2t4_l2b4_wbwr_wl_c6        ),
  .l2t_l2b_wbrd_en_r0       (l2t4_l2b4_wbrd_en_r0        ),
  .l2t_l2b_wbrd_wl_r0       (l2t4_l2b4_wbrd_wl_r0        ),
  .l2t_l2b_ev_dword_r0      (l2t4_l2b4_ev_dword_r0       ),
  .l2t_l2b_rdma_wren_s2     (l2t4_l2b4_rdma_wren_s2      ),
  .l2t_l2b_rdma_wrwl_s2     (l2t4_l2b4_rdma_wrwl_s2      ),
  .l2t_l2b_rdma_rden_r0     (l2t4_l2b4_rdma_rden_r0      ),
  .l2t_l2b_rdma_rdwl_r0     (l2t4_l2b4_rdma_rdwl_r0      ),
  .l2t_l2b_ctag_en_c7       (l2t4_l2b4_ctag_en_c7        ),
  .l2t_l2b_ctag_c7          (l2t4_l2b4_ctag_c7[ 31 : 0 ]     ),
  .l2t_l2b_req_en_c7        (l2t4_l2b4_req_en_c7         ),
  .l2t_l2b_word_c7          (l2t4_l2b4_word_c7           ),
  .l2t_l2b_word_vld_c7      (l2t4_l2b4_word_vld_c7       ),
  .sii_l2t_req              (sii_l2t4_req_t4lff[ 31 : 0 ]                ),
  .sii_l2b_ecc              (sii_l2b4_ecc_t4lff[ 6 : 0 ]           ),
  .l2b_l2d_rvalue          (l2b4_l2d4_rvalue[ 9 : 0 ]),
  .l2b_l2d_rid             (l2b4_l2d4_rid[ 6 : 0 ]),      
  .l2b_l2d_wr_en           (l2b4_l2d4_wr_en),
  .l2b_l2d_fuse_clr        (l2b4_l2d4_fuse_clr),
  .l2d_l2b_fuse_read_data  (l2d4_l2b4_fuse_data[ 9 : 0 ]),
  .efu_l2b_fuse_data       (efu_l2b0246_fuse_data),
  .efu_l2b_fuse_xfer_en    (efu_l2b4_fuse_xfer_en),
  .efu_l2b_fuse_clr        (efu_l2b4_fuse_clr),
  .l2b_efu_fuse_xfer_en    (l2b4_efu_fuse_xfer_en),
  .l2b_efu_fuse_data       (l2b4_efu_fuse_data),
  .l2b_dbg_sio_ctag_vld	    (l2b4_dbg1_sio_ctag_vld	 ),
  .l2b_dbg_sio_ack_type	    (l2b4_dbg1_sio_ack_type	 ),
  .l2b_dbg_sio_ack_dest	    (l2b4_dbg1_sio_ack_dest	 ),
  .l2b_sio_ctag_vld         (l2b4_sio_ctag_vld           ),
  .l2b_sio_data             (l2b4_sio_data[ 31 : 0 ]         ),
  .l2b_sio_parity           (l2b4_sio_parity[ 1 : 0 ]        ),     
  .l2b_sio_ue_err           (l2b4_sio_ue_err             ),
  .l2b_l2t_rdma_uerr_c10    (l2b4_l2t4_rdma_uerr_c10     ),
  .l2b_l2t_rdma_cerr_c10    (l2b4_l2t4_rdma_cerr_c10     ),
  .l2b_l2t_rdma_notdata_c10 (l2b4_l2t4_rdma_notdata_c10  ),
  .l2b_l2t_ev_uerr_r5       (l2b4_l2t4_ev_uerr_r5        ),
  .l2b_l2t_ev_cerr_r5       (l2b4_l2t4_ev_cerr_r5        ),
  .l2d_l2b_decc_out_c7      (l2d4_l2b4_decc_out_c7       ),
  .l2b_l2d_fbdecc_c4        (l2b4_l2d4_fbdecc_c4         ),
  .mcu_l2b_data_r2          (mcu2_l2b45_data_r2[ 127 : 0 ]   ),
  .mcu_l2b_ecc_r2           (mcu2_l2b45_ecc_r2[ 27 : 0 ]     ),
  .tcu_mbist_bisi_en        (tcu_mbist_bisi_en           ),
  .tcu_l2b_mbist_start      (tcu_l2b4_mbist_start        ),
  .l2b_tcu_mbist_done       (l2b4_tcu_mbist_done         ),
  .l2b_tcu_mbist_fail       (l2b4_tcu_mbist_fail         ),
  .tcu_l2b_mbist_scan_in    (tcu_l2b4_mbist_scan_in      ),
  .l2b_tcu_mbist_scan_out   (l2b4_tcu_mbist_scan_out     ),
  .l2b_evict_l2b_mcu_data_mecc_r5
                            (l2b4_mcu2_data_mecc_r5      ),
  .evict_l2b_mcu_wr_data_r5 (l2b4_mcu2_wr_data_r5[ 63 : 0 ]  ),
  .evict_l2b_mcu_data_vld_r5(l2b4_mcu2_data_vld_r5       ),
  .scan_in                  (l2b3_scan_out               ),
  .scan_out                 (l2b4_scan_out               ),
  .rst_wmr_protect(rst_wmr_protect),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_array_bypass(tcu_array_bypass),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_user_mode(tcu_mbist_user_mode)
//.so                       (                            )
        );
//________________________________________________________________

l2b l2b5(
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c1t ), 
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c1t ),
  .select_delay_mcu ( 1'b1 ),


  .gclk                     ( cmp_gclk_c1_l2b5 ), // cmp_gclk_c3_r[2]            ), 
  .tcu_clk_stop ( gl_l2b5_clk_stop ),	// staged clk_stop
  .rst_por_                 ( gl_rst_l2_por_c1m ), // ( gl_l2_por_c1t ), - for int6.1 
  .rst_wmr_                 ( gl_rst_l2_wmr_c1m ), // ( gl_l2_wmr_c1b ), - for int6.1 
  .l2t_l2b_fbrd_en_c3       (l2t5_l2b5_fbrd_en_c3        ),// scbuf
  .l2t_l2b_fbrd_wl_c3       (l2t5_l2b5_fbrd_wl_c3        ),
  .l2t_l2b_fbwr_wen_r2      (l2t5_l2b5_fbwr_wen_r2       ),
  .l2t_l2b_fbwr_wl_r2       (l2t5_l2b5_fbwr_wl_r2        ),
  .l2t_l2b_fbd_stdatasel_c3 (l2t5_l2b5_fbd_stdatasel_c3  ),
  .l2t_l2b_stdecc_c2        (l2t5_l2d5_stdecc_c2[ 77 : 0 ]         ),
  .l2t_l2b_evict_en_r0      (l2t5_l2b5_evict_en_r0       ),
  .l2t_l2b_wbwr_wen_c6      (l2t5_l2b5_wbwr_wen_c6       ),
  .l2t_l2b_wbwr_wl_c6       (l2t5_l2b5_wbwr_wl_c6        ),
  .l2t_l2b_wbrd_en_r0       (l2t5_l2b5_wbrd_en_r0        ),
  .l2t_l2b_wbrd_wl_r0       (l2t5_l2b5_wbrd_wl_r0        ),
  .l2t_l2b_ev_dword_r0      (l2t5_l2b5_ev_dword_r0       ),
  .l2t_l2b_rdma_wren_s2     (l2t5_l2b5_rdma_wren_s2      ),
  .l2t_l2b_rdma_wrwl_s2     (l2t5_l2b5_rdma_wrwl_s2      ),
  .l2t_l2b_rdma_rden_r0     (l2t5_l2b5_rdma_rden_r0      ),
  .l2t_l2b_rdma_rdwl_r0     (l2t5_l2b5_rdma_rdwl_r0      ),
  .l2t_l2b_ctag_en_c7       (l2t5_l2b5_ctag_en_c7        ),
  .l2t_l2b_ctag_c7          (l2t5_l2b5_ctag_c7[ 31 : 0 ]     ),
  .l2t_l2b_req_en_c7        (l2t5_l2b5_req_en_c7         ),
  .l2t_l2b_word_c7          (l2t5_l2b5_word_c7           ),
  .l2t_l2b_word_vld_c7      (l2t5_l2b5_word_vld_c7       ),
  .sii_l2t_req              (sii_l2t5_req_t4lff[ 31 : 0 ]                ),
  .sii_l2b_ecc              (sii_l2b5_ecc_ccxrff[ 6 : 0 ]           ),
  .l2b_l2d_rvalue          (l2b5_l2d5_rvalue[ 9 : 0 ]),
  .l2b_l2d_rid             (l2b5_l2d5_rid[ 6 : 0 ]),      
  .l2b_l2d_wr_en           (l2b5_l2d5_wr_en),
  .l2b_l2d_fuse_clr        (l2b5_l2d5_fuse_clr),
  .l2d_l2b_fuse_read_data  (l2d5_l2b5_fuse_data[ 9 : 0 ]),
  .efu_l2b_fuse_data       (efu_l2b1357_fuse_data),
  .efu_l2b_fuse_xfer_en    (efu_l2b5_fuse_xfer_en),
  .efu_l2b_fuse_clr        (efu_l2b5_fuse_clr),
  .l2b_efu_fuse_xfer_en    (l2b5_efu_fuse_xfer_en),
  .l2b_efu_fuse_data       (l2b5_efu_fuse_data),
  .l2b_dbg_sio_ctag_vld	    (l2b5_dbg1_sio_ctag_vld	 ),
  .l2b_dbg_sio_ack_type	    (l2b5_dbg1_sio_ack_type	 ),
  .l2b_dbg_sio_ack_dest	    (l2b5_dbg1_sio_ack_dest	 ),
  .l2b_sio_ctag_vld         (l2b5_sio_ctag_vld           ),
  .l2b_sio_data             (l2b5_sio_data[ 31 : 0 ]         ),
  .l2b_sio_parity           (l2b5_sio_parity[ 1 : 0 ]        ),     
  .l2b_sio_ue_err           (l2b5_sio_ue_err             ),
  .l2b_l2t_rdma_uerr_c10    (l2b5_l2t5_rdma_uerr_c10     ),
  .l2b_l2t_rdma_cerr_c10    (l2b5_l2t5_rdma_cerr_c10     ),
  .l2b_l2t_rdma_notdata_c10 (l2b5_l2t5_rdma_notdata_c10  ),
  .l2b_l2t_ev_uerr_r5       (l2b5_l2t5_ev_uerr_r5        ),
  .l2b_l2t_ev_cerr_r5       (l2b5_l2t5_ev_cerr_r5        ),
  .l2d_l2b_decc_out_c7      (l2d5_l2b5_decc_out_c7       ),
  .l2b_l2d_fbdecc_c4        (l2b5_l2d5_fbdecc_c4         ),
  .mcu_l2b_data_r2          (mcu2_l2b45_data_r2[ 127 : 0 ]   ),
  .mcu_l2b_ecc_r2           (mcu2_l2b45_ecc_r2[ 27 : 0 ]     ),
  .tcu_mbist_bisi_en        (tcu_mbist_bisi_en           ),
  .tcu_l2b_mbist_start      (tcu_l2b5_mbist_start        ),
  .l2b_tcu_mbist_done       (l2b5_tcu_mbist_done         ),
  .l2b_tcu_mbist_fail       (l2b5_tcu_mbist_fail         ),
  .tcu_l2b_mbist_scan_in    (tcu_l2b5_mbist_scan_in      ),
  .l2b_tcu_mbist_scan_out   (l2b5_tcu_mbist_scan_out     ),
  .l2b_evict_l2b_mcu_data_mecc_r5
                            (l2b5_mcu2_data_mecc_r5      ),
  .evict_l2b_mcu_wr_data_r5 (l2b5_mcu2_wr_data_r5[ 63 : 0 ]  ),
  .evict_l2b_mcu_data_vld_r5(l2b5_mcu2_data_vld_r5       ),
  .scan_in                  (l2b4_scan_out               ),
  .scan_out                 (l2b5_scan_out               ),
  .rst_wmr_protect(rst_wmr_protect),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_array_bypass(tcu_array_bypass),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_user_mode(tcu_mbist_user_mode)
//.so                       (                            )
        );
//________________________________________________________________

l2b l2b6(
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c1m ), 
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c1m ),
  .select_delay_mcu ( 1'b0 ),


  .gclk                     ( cmp_gclk_c1_l2b6 ), // cmp_gclk_c3_r[4]            ), 
  .tcu_clk_stop ( gl_l2b6_clk_stop ),	// staged clk_stop
  .rst_por_                 ( gl_l2_por_c1b ), // ( gl_l2_por_c1t ), - for int6.1 
  .rst_wmr_                 ( gl_l2_wmr_c1b ), 
  .l2t_l2b_fbrd_en_c3       (l2t6_l2b6_fbrd_en_c3        ),// scbuf
  .l2t_l2b_fbrd_wl_c3       (l2t6_l2b6_fbrd_wl_c3        ),
  .l2t_l2b_fbwr_wen_r2      (l2t6_l2b6_fbwr_wen_r2       ),
  .l2t_l2b_fbwr_wl_r2       (l2t6_l2b6_fbwr_wl_r2        ),
  .l2t_l2b_fbd_stdatasel_c3 (l2t6_l2b6_fbd_stdatasel_c3  ),
  .l2t_l2b_stdecc_c2        (l2t6_l2d6_stdecc_c2[ 77 : 0 ]         ),
  .l2t_l2b_evict_en_r0      (l2t6_l2b6_evict_en_r0       ),
  .l2t_l2b_wbwr_wen_c6      (l2t6_l2b6_wbwr_wen_c6       ),
  .l2t_l2b_wbwr_wl_c6       (l2t6_l2b6_wbwr_wl_c6        ),
  .l2t_l2b_wbrd_en_r0       (l2t6_l2b6_wbrd_en_r0        ),
  .l2t_l2b_wbrd_wl_r0       (l2t6_l2b6_wbrd_wl_r0        ),
  .l2t_l2b_ev_dword_r0      (l2t6_l2b6_ev_dword_r0       ),
  .l2t_l2b_rdma_wren_s2     (l2t6_l2b6_rdma_wren_s2      ),
  .l2t_l2b_rdma_wrwl_s2     (l2t6_l2b6_rdma_wrwl_s2      ),
  .l2t_l2b_rdma_rden_r0     (l2t6_l2b6_rdma_rden_r0      ),
  .l2t_l2b_rdma_rdwl_r0     (l2t6_l2b6_rdma_rdwl_r0      ),
  .l2t_l2b_ctag_en_c7       (l2t6_l2b6_ctag_en_c7        ),
  .l2t_l2b_ctag_c7          (l2t6_l2b6_ctag_c7[ 31 : 0 ]     ),
  .l2t_l2b_req_en_c7        (l2t6_l2b6_req_en_c7         ),
  .l2t_l2b_word_c7          (l2t6_l2b6_word_c7           ),
  .l2t_l2b_word_vld_c7      (l2t6_l2b6_word_vld_c7       ),
  .sii_l2t_req              (sii_l2t6_req_t6lff                ),
  .sii_l2b_ecc              (sii_l2b6_ecc_ccxrff[ 6 : 0 ]           ),
  .l2b_l2d_rvalue          (l2b6_l2d6_rvalue[ 9 : 0 ]),
  .l2b_l2d_rid             (l2b6_l2d6_rid[ 6 : 0 ]),      
  .l2b_l2d_wr_en           (l2b6_l2d6_wr_en),
  .l2b_l2d_fuse_clr        (l2b6_l2d6_fuse_clr),
  .l2d_l2b_fuse_read_data  (l2d6_l2b6_fuse_data[ 9 : 0 ]),
  .efu_l2b_fuse_data       (efu_l2b0246_fuse_data),
  .efu_l2b_fuse_xfer_en    (efu_l2b6_fuse_xfer_en),
  .efu_l2b_fuse_clr        (efu_l2b6_fuse_clr),
  .l2b_efu_fuse_xfer_en    (l2b6_efu_fuse_xfer_en),
  .l2b_efu_fuse_data       (l2b6_efu_fuse_data),
  .l2b_dbg_sio_ctag_vld	    (l2b6_dbg1_sio_ctag_vld	 ),
  .l2b_dbg_sio_ack_type	    (l2b6_dbg1_sio_ack_type	 ),
  .l2b_dbg_sio_ack_dest	    (l2b6_dbg1_sio_ack_dest	 ),
  .l2b_sio_ctag_vld         (l2b6_sio_ctag_vld           ),
  .l2b_sio_data             (l2b6_sio_data[ 31 : 0 ]         ),
  .l2b_sio_parity           (l2b6_sio_parity[ 1 : 0 ]        ),     
  .l2b_sio_ue_err           (l2b6_sio_ue_err             ),
  .l2b_l2t_rdma_uerr_c10    (l2b6_l2t6_rdma_uerr_c10     ),
  .l2b_l2t_rdma_cerr_c10    (l2b6_l2t6_rdma_cerr_c10     ),
  .l2b_l2t_rdma_notdata_c10 (l2b6_l2t6_rdma_notdata_c10  ),
  .l2b_l2t_ev_uerr_r5       (l2b6_l2t6_ev_uerr_r5        ),
  .l2b_l2t_ev_cerr_r5       (l2b6_l2t6_ev_cerr_r5        ),
  .l2d_l2b_decc_out_c7      (l2d6_l2b6_decc_out_c7       ),
  .l2b_l2d_fbdecc_c4        (l2b6_l2d6_fbdecc_c4         ),
  .mcu_l2b_data_r2          (mcu3_l2b67_data_r2[ 127 : 0 ]   ),
  .mcu_l2b_ecc_r2           (mcu3_l2b67_ecc_r2[ 27 : 0 ]     ),
  .tcu_mbist_bisi_en        (tcu_mbist_bisi_en           ),
  .tcu_l2b_mbist_start      (tcu_l2b6_mbist_start        ),
  .l2b_tcu_mbist_done       (l2b6_tcu_mbist_done         ),
  .l2b_tcu_mbist_fail       (l2b6_tcu_mbist_fail         ),
  .tcu_l2b_mbist_scan_in    (tcu_l2b6_mbist_scan_in      ),
  .l2b_tcu_mbist_scan_out   (l2b6_tcu_mbist_scan_out     ),
  .l2b_evict_l2b_mcu_data_mecc_r5
                            (l2b6_mcu3_data_mecc_r5      ),
  .evict_l2b_mcu_wr_data_r5 (l2b6_mcu3_wr_data_r5[ 63 : 0 ]  ),
  .evict_l2b_mcu_data_vld_r5(l2b6_mcu3_data_vld_r5       ),
  .scan_in                  (l2b5_scan_out               ),
  .scan_out                 (l2b6_scan_out               ),
  .rst_wmr_protect(rst_wmr_protect),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_array_bypass(tcu_array_bypass),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_user_mode(tcu_mbist_user_mode)
//.so                       (                            )
        );
//________________________________________________________________

l2b l2b7(
  .ccu_slow_cmp_sync_en ( gl_io_cmp_sync_en_c1b ),  // ECO c1m -> c1b - mh157021
  .ccu_cmp_slow_sync_en ( gl_cmp_io_sync_en_c1b ),  // ECO c1m -> c1b - mh157021
  .select_delay_mcu ( 1'b1 ),


  .gclk                     ( cmp_gclk_c1_l2b7 ), // cmp_gclk_c3_r[5]            ), 
  .tcu_clk_stop ( gl_l2b7_clk_stop ),	// staged clk_stop
  .rst_por_                 ( gl_l2_por_c1b ), // ECO again c1m -> c1b mh157021 // ( gl_l2_por_c1t ), - for int6.1 
  .rst_wmr_                 ( gl_l2_wmr_c1b ), // ECO again c1m -> c1b mh157021 // ( gl_l2_wmr_c1b ), - for int6.1 
  .l2t_l2b_fbrd_en_c3       (l2t7_l2b7_fbrd_en_c3        ),// scbuf
  .l2t_l2b_fbrd_wl_c3       (l2t7_l2b7_fbrd_wl_c3        ),
  .l2t_l2b_fbwr_wen_r2      (l2t7_l2b7_fbwr_wen_r2       ),
  .l2t_l2b_fbwr_wl_r2       (l2t7_l2b7_fbwr_wl_r2        ),
  .l2t_l2b_fbd_stdatasel_c3 (l2t7_l2b7_fbd_stdatasel_c3  ),
  .l2t_l2b_stdecc_c2        (l2t7_l2d7_stdecc_c2[ 77 : 0 ]   ),
  .l2t_l2b_evict_en_r0      (l2t7_l2b7_evict_en_r0       ),
  .l2t_l2b_wbwr_wen_c6      (l2t7_l2b7_wbwr_wen_c6       ),
  .l2t_l2b_wbwr_wl_c6       (l2t7_l2b7_wbwr_wl_c6        ),
  .l2t_l2b_wbrd_en_r0       (l2t7_l2b7_wbrd_en_r0        ),
  .l2t_l2b_wbrd_wl_r0       (l2t7_l2b7_wbrd_wl_r0        ),
  .l2t_l2b_ev_dword_r0      (l2t7_l2b7_ev_dword_r0       ),
  .l2t_l2b_rdma_wren_s2     (l2t7_l2b7_rdma_wren_s2      ),
  .l2t_l2b_rdma_wrwl_s2     (l2t7_l2b7_rdma_wrwl_s2      ),
  .l2t_l2b_rdma_rden_r0     (l2t7_l2b7_rdma_rden_r0      ),
  .l2t_l2b_rdma_rdwl_r0     (l2t7_l2b7_rdma_rdwl_r0      ),
  .l2t_l2b_ctag_en_c7       (l2t7_l2b7_ctag_en_c7        ),
  .l2t_l2b_ctag_c7          (l2t7_l2b7_ctag_c7[ 31 : 0 ]     ),
  .l2t_l2b_req_en_c7        (l2t7_l2b7_req_en_c7         ),
  .l2t_l2b_word_c7          (l2t7_l2b7_word_c7           ),
  .l2t_l2b_word_vld_c7      (l2t7_l2b7_word_vld_c7       ),
  .sii_l2t_req              (sii_l2t7_req_t6lff                ),
  .sii_l2b_ecc              (sii_l2b7_ecc_ccxrff[ 6 : 0 ]           ),
  .l2b_l2d_rvalue          (l2b7_l2d7_rvalue[ 9 : 0 ]),
  .l2b_l2d_rid             (l2b7_l2d7_rid[ 6 : 0 ]),      
  .l2b_l2d_wr_en           (l2b7_l2d7_wr_en),
  .l2b_l2d_fuse_clr        (l2b7_l2d7_fuse_clr),
  .l2d_l2b_fuse_read_data  (l2d7_l2b7_fuse_data[ 9 : 0 ]),
  .efu_l2b_fuse_data       (efu_l2b1357_fuse_data),
  .efu_l2b_fuse_xfer_en    (efu_l2b7_fuse_xfer_en),
  .efu_l2b_fuse_clr        (efu_l2b7_fuse_clr),
  .l2b_efu_fuse_xfer_en    (l2b7_efu_fuse_xfer_en),
  .l2b_efu_fuse_data       (l2b7_efu_fuse_data),
  .l2b_dbg_sio_ctag_vld	    (l2b7_dbg1_sio_ctag_vld	 ),
  .l2b_dbg_sio_ack_type	    (l2b7_dbg1_sio_ack_type	 ),
  .l2b_dbg_sio_ack_dest	    (l2b7_dbg1_sio_ack_dest	 ),
  .l2b_sio_ctag_vld         (l2b7_sio_ctag_vld           ),
  .l2b_sio_data             (l2b7_sio_data[ 31 : 0 ]         ),
  .l2b_sio_parity           (l2b7_sio_parity[ 1 : 0 ]        ),     
  .l2b_sio_ue_err           (l2b7_sio_ue_err             ),
  .l2b_l2t_rdma_uerr_c10    (l2b7_l2t7_rdma_uerr_c10     ),
  .l2b_l2t_rdma_cerr_c10    (l2b7_l2t7_rdma_cerr_c10     ),
  .l2b_l2t_rdma_notdata_c10 (l2b7_l2t7_rdma_notdata_c10  ),
  .l2b_l2t_ev_uerr_r5       (l2b7_l2t7_ev_uerr_r5        ),
  .l2b_l2t_ev_cerr_r5       (l2b7_l2t7_ev_cerr_r5        ),
  .l2d_l2b_decc_out_c7      (l2d7_l2b7_decc_out_c7       ),
  .l2b_l2d_fbdecc_c4        (l2b7_l2d7_fbdecc_c4         ),
  .mcu_l2b_data_r2          (mcu3_l2b67_data_r2[ 127 : 0 ]   ),
  .mcu_l2b_ecc_r2           (mcu3_l2b67_ecc_r2[ 27 : 0 ]     ),
  .tcu_mbist_bisi_en        (tcu_mbist_bisi_en           ),
  .tcu_l2b_mbist_start      (tcu_l2b7_mbist_start        ),
  .l2b_tcu_mbist_done       (l2b7_tcu_mbist_done         ),
  .l2b_tcu_mbist_fail       (l2b7_tcu_mbist_fail         ),
  .tcu_l2b_mbist_scan_in    (tcu_l2b7_mbist_scan_in      ),
  .l2b_tcu_mbist_scan_out   (l2b7_tcu_mbist_scan_out     ),
  .l2b_evict_l2b_mcu_data_mecc_r5
                            (l2b7_mcu3_data_mecc_r5      ),
  .evict_l2b_mcu_wr_data_r5 (l2b7_mcu3_wr_data_r5[ 63 : 0 ]  ),
  .evict_l2b_mcu_data_vld_r5(l2b7_mcu3_data_vld_r5       ),
  .scan_in                  (l2b6_scan_out               ),
  .scan_out                 (l2b7_scan_out               ),
  .rst_wmr_protect(rst_wmr_protect),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_array_bypass(tcu_array_bypass),
  .cluster_arst_l(cluster_arst_l),
  .tcu_mbist_user_mode(tcu_mbist_user_mode)
//.so                       (                            )
        );
//________________________________________________________________

// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
mcu mcu0(
  .gclk                     ( cmp_gclk_c4_mcu0 ), // cmp_gclk_c0_r[2]            ) , 
  .tcu_mcu_clk_stop	( gl_mcu0_clk_stop ),	// staged clk_stop
  .tcu_mcu_dr_clk_stop	( gl_mcu0_dr_clk_stop ),	// staged clk_stop
  .tcu_mcu_io_clk_stop	( gl_mcu0_io_clk_stop ),	// staged clk_stop
  .ccu_io_out	( gl_io_out_c3t ),	// staged div phase
  .dr_gclk                  ( dr_gclk_c4_mcu0 ), // dr_gclk_c0_r[2]             ) , 
  .ccu_dr_sync_en (gl_dr_sync_en_c3t),		
  .ccu_io_cmp_sync_en ( gl_io_cmp_sync_en_c3t ), 
  .ccu_cmp_io_sync_en ( gl_cmp_io_sync_en_c3t ),
  .tcu_mcu_fbd_clk_stop     (tcu_mcu0_fbd_clk_stop       ),
  .mcu_dbg1_rd_req_in_0	    (mcu0_dbg1_rd_req_in_0[ 3 : 0 ]  ),
  .mcu_dbg1_rd_req_in_1	    (mcu0_dbg1_rd_req_in_1[ 3 : 0 ]  ),
  .mcu_dbg1_rd_req_out	    (mcu0_dbg1_rd_req_out[ 4 : 0 ]   ),
  .mcu_dbg1_wr_req_in_0	    (mcu0_dbg1_wr_req_in_0       ),
  .mcu_dbg1_wr_req_in_1	    (mcu0_dbg1_wr_req_in_1       ),
  .mcu_dbg1_wr_req_out	    (mcu0_dbg1_wr_req_out[ 1 : 0 ]   ),
  .mcu_dbg1_mecc_err	    (mcu0_dbg1_mecc_err          ),
  .mcu_dbg1_secc_err	    (mcu0_dbg1_secc_err          ),
  .mcu_dbg1_fbd_err	    (mcu0_dbg1_fbd_err           ),
  .mcu_dbg1_err_mode	    (mcu0_dbg1_err_mode          ),
  .mcu_dbg1_err_event	    (mcu0_dbg1_err_event         ), 
  .mcu_dbg1_crc21	    (mcu0_dbg1_crc21		 ),
  .l2t0_mcu_rd_req          (l2t0_mcu0_rd_req            ),
  .l2t0_mcu_wr_req          (l2t0_mcu0_wr_req            ),
  .l2t0_mcu_rd_dummy_req    (l2t0_mcu0_rd_dummy_req      ),
  .l2t0_mcu_rd_req_id       (l2t0_mcu0_rd_req_id[ 2 : 0 ]    ),
  .l2t0_mcu_addr_39to7      (l2t0_mcu0_addr[ 39 : 7 ]        ),
  .l2t0_mcu_addr_5          (l2t0_mcu0_addr_5            ),
  .mcu_l2t0_rd_ack          (mcu0_l2t0_rd_ack            ),
  .mcu_l2t0_wr_ack          (mcu0_l2t0_wr_ack            ),
  .mcu_l2t0_data_vld_r0     (mcu0_l2t0_data_vld_r0       ),
  .mcu_l2t0_rd_req_id_r0    (mcu0_l2t0_rd_req_id_r0[ 2 : 0 ] ),
  .mcu_l2t0_secc_err_r3     (mcu0_l2t0_secc_err_r2       ),
  .mcu_l2t0_mecc_err_r3     (mcu0_l2t0_mecc_err_r2       ),
  .mcu_l2t0_scb_secc_err    (mcu0_l2t0_scb_secc_err      ),
  .mcu_l2t0_scb_mecc_err    (mcu0_l2t0_scb_mecc_err      ),
  .mcu_l2t0_qword_id_r0     (mcu0_l2t0_qword_id_r0[ 1 : 0 ]  ),
  .l2t1_mcu_rd_req          (l2t1_mcu0_rd_req_t0lff            ),
  .l2t1_mcu_wr_req          (l2t1_mcu0_wr_req_t0lff            ),
  .l2t1_mcu_rd_dummy_req    (l2t1_mcu0_rd_dummy_req_t0lff      ),
  .l2t1_mcu_rd_req_id       (l2t1_mcu0_rd_req_id_t0lff[ 2 : 0 ]    ),
  .l2t1_mcu_addr_39to7      (l2t1_mcu0_addr_t0lff[ 39 : 7 ]        ),
  .l2t1_mcu_addr_5          (l2t1_mcu0_addr_5_t0lff            ),
  .mcu_l2t1_rd_ack          (mcu0_l2t1_rd_ack            ),
  .mcu_l2t1_wr_ack          (mcu0_l2t1_wr_ack            ),
  .mcu_l2t1_data_vld_r0     (mcu0_l2t1_data_vld_r0       ),
  .mcu_l2t1_rd_req_id_r0    (mcu0_l2t1_rd_req_id_r0[ 2 : 0 ] ),
  .mcu_l2t1_secc_err_r3     (mcu0_l2t1_secc_err_r2       ),
  .mcu_l2t1_mecc_err_r3     (mcu0_l2t1_mecc_err_r2       ),
  .mcu_l2t1_scb_secc_err    (mcu0_l2t1_scb_secc_err      ),
  .mcu_l2t1_scb_mecc_err    (mcu0_l2t1_scb_mecc_err      ),
  .mcu_l2t1_qword_id_r0     (mcu0_l2t1_qword_id_r0[ 1 : 0 ]  ),
  .mcu_l2b_data_r3          (mcu0_l2b01_data_r2[ 127 : 0 ]   ),
  .mcu_l2b_ecc_r3           (mcu0_l2b01_ecc_r2[ 27 : 0 ]     ),
  .l2b0_mcu_data_mecc_r5    (l2b0_mcu0_data_mecc_r5      ),
  .l2b0_mcu_wr_data_r5      (l2b0_mcu0_wr_data_r5[ 63 : 0 ]  ),
  .l2b0_mcu_data_vld_r5     (l2b0_mcu0_data_vld_r5       ),
  .l2b1_mcu_data_mecc_r5    (l2b1_mcu0_data_mecc_r5      ),
  .l2b1_mcu_wr_data_r5      (l2b1_mcu0_wr_data_r5[ 63 : 0 ]  ),
  .l2b1_mcu_data_vld_r5     (l2b1_mcu0_data_vld_r5       ),
  .mcu_pt_sync_out          (mcu0_pt_sync_out            ),
  .mcu_pt_sync_in0          (mcu1_pt_sync_out            ),
  .mcu_pt_sync_in1          (mcu2_pt_sync_out            ),
  .mcu_pt_sync_in2          (mcu3_pt_sync_out            ),
  .mcu_ncu_data             (mcu0_ncu_data[ 3 : 0 ]          ),
  .mcu_ncu_stall            (mcu0_ncu_stall              ),
  .mcu_ncu_vld              (mcu0_ncu_vld                ),
  .ncu_mcu_data             (ncu_mcu0_data[ 3 : 0 ]          ),
  .ncu_mcu_stall            (ncu_mcu0_stall              ),
  .ncu_mcu_vld              (ncu_mcu0_vld                ),
  .mcu_ncu_ecc              (mcu0_ncu_ecc                ),
  .mcu_ncu_fbr              (mcu0_ncu_fbr                ),
  .ncu_mcu_ecci             (ncu_mcu0_ecci               ),
  .ncu_mcu_fbui             (ncu_mcu0_fbui               ),
  .ncu_mcu_fbri             (ncu_mcu0_fbri               ),
  .mcu_fsr0_data            (mcu0_fsr0_data[ 119 : 0 ]       ),
  .mcu_fsr1_data            (mcu0_fsr1_data[ 119 : 0 ]       ),
  .mcu_fsr0_cfgpll_enpll    (mcu0_fsr0_cfgpll_enpll      ),
  .mcu_fsr1_cfgpll_enpll    (mcu0_fsr1_cfgpll_enpll      ),
  .mcu_fsr01_cfgpll_lb      (mcu0_fsr01_cfgpll_lb[ 1 : 0 ]   ),
  .mcu_fsr01_cfgpll_mpy     (mcu0_fsr01_cfgpll_mpy[ 3 : 0 ]  ),
  .mcu_fsr0_cfgrx_enrx      (mcu0_fsr0_cfgrx_enrx        ),
  .mcu_fsr1_cfgrx_enrx      (mcu0_fsr1_cfgrx_enrx        ),
  .mcu_fsr0_cfgrx_align     (mcu0_fsr0_cfgrx_align       ),
  .mcu_fsr1_cfgrx_align     (mcu0_fsr1_cfgrx_align       ),
  .mcu_fsr0_cfgrx_invpair   (mcu0_fsr0_cfgrx_invpair[ 13 : 0 ]),
  .mcu_fsr1_cfgrx_invpair   (mcu0_fsr1_cfgrx_invpair[ 13 : 0 ]),
  .mcu_fsr01_cfgrx_eq       (mcu0_fsr01_cfgrx_eq[ 3 : 0 ]    ),
  .mcu_fsr01_cfgrx_cdr      (mcu0_fsr01_cfgrx_cdr[ 2 : 0 ]   ),
  .mcu_fsr01_cfgrx_term     (mcu0_fsr01_cfgrx_term[ 2 : 0 ]  ),
  .mcu_fsr0_cfgtx_entx      (mcu0_fsr0_cfgtx_entx        ),
  .mcu_fsr1_cfgtx_entx      (mcu0_fsr1_cfgtx_entx        ),
  .mcu_fsr0_cfgtx_enidl     (mcu0_fsr0_cfgtx_enidl       ),
  .mcu_fsr1_cfgtx_enidl     (mcu0_fsr1_cfgtx_enidl       ),
  .mcu_fsr0_cfgtx_invpair   (mcu0_fsr0_cfgtx_invpair[ 9 : 0 ]),
  .mcu_fsr1_cfgtx_invpair   (mcu0_fsr1_cfgtx_invpair[ 9 : 0 ]),
  .mcu_fsr01_cfgtx_enftp    (mcu0_fsr01_cfgtx_enftp      ),
  .mcu_fsr01_cfgtx_de       (mcu0_fsr01_cfgtx_de[ 3 : 0 ]    ),
  .mcu_fsr01_cfgtx_swing    (mcu0_fsr01_cfgtx_swing[ 2 : 0 ] ),
  .mcu_fsr01_cfgtx_cm       (mcu0_fsr01_cfgtx_cm         ),
  .mcu_fsr01_cfgrtx_rate    (mcu0_fsr01_cfgrtx_rate[ 1 : 0 ] ),
  .mcu_fsr0_cfgrx_entest    (mcu0_fsr0_cfgrx_entest      ),
  .mcu_fsr1_cfgrx_entest    (mcu0_fsr1_cfgrx_entest      ),
  .mcu_fsr0_cfgtx_entest    (mcu0_fsr0_cfgtx_entest      ),
  .mcu_fsr1_cfgtx_entest    (mcu0_fsr1_cfgtx_entest      ),
  .mcu_fsr0_cfgtx_bstx      (mcu0_fsr0_cfgtx_bstx[ 9 : 0 ]   ),
  .mcu_fsr1_cfgtx_bstx      (mcu0_fsr1_cfgtx_bstx[ 9 : 0 ]   ),
  .fsr0_mcu_data            (fsr0_mcu0_data[ 167 : 0 ]       ),
  .fsr1_mcu_data            (fsr1_mcu0_data[ 167 : 0 ]       ),
  .fsr0_mcu_rxbclk          (fsr0_mcu0_rxbclk[ 13 : 0 ]      ),
  .fsr1_mcu_rxbclk          (fsr1_mcu0_rxbclk[ 13 : 0 ]      ),
  .fsr0_mcu_stspll_lock     (fsr0_mcu0_stspll_lock[ 2 : 0 ]  ),
  .fsr1_mcu_stspll_lock     (fsr1_mcu0_stspll_lock[ 2 : 0 ]  ),
  .mcu_fsr0_testcfg         (mcu0_fsr0_testcfg[ 11 : 0 ]     ),
  .mcu_fsr1_testcfg         (mcu0_fsr1_testcfg[ 11 : 0 ]     ),
  .fsr0_mcu_stsrx_sync      ({fsr0_mcu0_stsrx_sync[ 8 ],    fsr0_mcu0_stsrx_sync[ 9 ],
			      fsr0_mcu0_stsrx_sync[ 13 : 10 ],fsr0_mcu0_stsrx_sync[ 7 : 0 ]}),
  .fsr1_mcu_stsrx_sync      ({fsr1_mcu0_stsrx_sync[ 8 ],    fsr1_mcu0_stsrx_sync[ 9 ],
			      fsr1_mcu0_stsrx_sync[ 13 : 10 ],fsr1_mcu0_stsrx_sync[ 7 : 0 ]}),
  .fsr0_mcu_stsrx_losdtct   ({fsr0_mcu0_stsrx_losdtct[ 8 ],    fsr0_mcu0_stsrx_losdtct[ 9 ],
			      fsr0_mcu0_stsrx_losdtct[ 13 : 10 ],fsr0_mcu0_stsrx_losdtct[ 7 : 0 ]}),
  .fsr1_mcu_stsrx_losdtct   ({fsr1_mcu0_stsrx_losdtct[ 8 ],    fsr1_mcu0_stsrx_losdtct[ 9 ],
			      fsr1_mcu0_stsrx_losdtct[ 13 : 10 ],fsr1_mcu0_stsrx_losdtct[ 7 : 0 ]}),
  .fsr0_mcu_stsrx_testfail  (fsr0_mcu0_stsrx_testfail[ 13 : 0 ]),
  .fsr1_mcu_stsrx_testfail  (fsr1_mcu0_stsrx_testfail[ 13 : 0 ]),
  .fsr0_mcu_stsrx_bsrxp     (fsr0_mcu0_stsrx_bsrxp[ 13 : 0 ] ),
  .fsr1_mcu_stsrx_bsrxp     (fsr1_mcu0_stsrx_bsrxp[ 13 : 0 ] ),
  .fsr0_mcu_stsrx_bsrxn     (fsr0_mcu0_stsrx_bsrxn[ 13 : 0 ] ),
  .fsr1_mcu_stsrx_bsrxn     (fsr1_mcu0_stsrx_bsrxn[ 13 : 0 ] ),
  .fsr0_mcu_ststx_testfail  (fsr0_mcu0_ststx_testfail[ 9 : 0 ]),
  .fsr1_mcu_ststx_testfail  (fsr1_mcu0_ststx_testfail[ 9 : 0 ]),
  .mcu_id                   ({1'b0,1'b0}                 ),
  .tcu_mcu_mbist_start      (tcu_mcu0_mbist_start_t1lff        ),
  .mcu_tcu_mbist_done       (mcu0_tcu_mbist_done         ),
  .mcu_tcu_mbist_fail       (mcu0_tcu_mbist_fail         ),
  .tcu_mcu_mbist_scan_in    (tcu_mcu0_mbist_scan_in      ),
  .mcu_tcu_mbist_scan_out   (mcu0_tcu_mbist_scan_out     ),
  .mcu_sbs_scan_in          (tcu_sbs_scan_in             ),
  .mcu_sbs_scan_out         (mcu0_sbs_scan_out           ),
  .scan_in                  (ccx_scan_out[ 0 ]             ),
  .scan_out                 (mcu0_scan_out               ),
  .ncu_mcu_pm(ncu_mcu_pm),
  .ncu_mcu_ba01(ncu_mcu_ba01),
  .ncu_mcu_ba23(ncu_mcu_ba23),
  .ncu_mcu_ba45(ncu_mcu_ba45),
  .ncu_mcu_ba67(ncu_mcu_ba67),
  .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .tcu_sbs_scan_en(tcu_sbs_scan_en),
  .tcu_sbs_aclk(tcu_sbs_aclk),
  .tcu_sbs_bclk(tcu_sbs_bclk),
  .tcu_sbs_clk(tcu_sbs_clk),
  .tcu_sbs_uclk(tcu_sbs_uclk),
  .rst_mcu_selfrsh(rst_mcu_selfrsh),
  .rst_wmr_protect(rst_wmr_protect),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_scan_en(tcu_scan_en),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_array_bypass(tcu_array_bypass),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_div_bypass(tcu_div_bypass),
  .ccu_serdes_dtm(ccu_serdes_dtm)
        );
`endif  // OPENSPARC_CMP
//________________________________________________________________

// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
mcu mcu1(
  .gclk                     ( cmp_gclk_c4_mcu1 ), // cmp_gclk_c0_r[3]            ) , 
  .tcu_mcu_dr_clk_stop	( gl_mcu1_dr_clk_stop ),	// staged clk_stop
  .tcu_mcu_clk_stop	( gl_mcu1_clk_stop ),	// staged clk_stop
  .tcu_mcu_io_clk_stop	( gl_mcu1_io_clk_stop ),	// staged clk_stop
  .ccu_io_out	( gl_io_out_c3t ),	// staged div phase
  .ccu_dr_sync_en (gl_dr_sync_en_c3t),		
  .ccu_io_cmp_sync_en ( gl_io_cmp_sync_en_c3t ), 
  .ccu_cmp_io_sync_en ( gl_cmp_io_sync_en_c3t ),
  .dr_gclk                  ( dr_gclk_c4_mcu1 ), // dr_gclk_c0_r[3]             ) , 
  .tcu_mcu_fbd_clk_stop     (tcu_mcu1_fbd_clk_stop       ),
  .mcu_dbg1_rd_req_in_0	    (mcu1_dbg1_rd_req_in_0[ 3 : 0 ]  ),
  .mcu_dbg1_rd_req_in_1	    (mcu1_dbg1_rd_req_in_1[ 3 : 0 ]  ),
  .mcu_dbg1_rd_req_out	    (mcu1_dbg1_rd_req_out[ 4 : 0 ]   ),
  .mcu_dbg1_wr_req_in_0	    (mcu1_dbg1_wr_req_in_0       ),
  .mcu_dbg1_wr_req_in_1	    (mcu1_dbg1_wr_req_in_1       ),
  .mcu_dbg1_wr_req_out	    (mcu1_dbg1_wr_req_out[ 1 : 0 ]   ),
  .mcu_dbg1_mecc_err	    (mcu1_dbg1_mecc_err          ),
  .mcu_dbg1_secc_err	    (mcu1_dbg1_secc_err          ),
  .mcu_dbg1_fbd_err	    (mcu1_dbg1_fbd_err           ),
  .mcu_dbg1_err_mode	    (mcu1_dbg1_err_mode          ),
  .mcu_dbg1_err_event	    (mcu1_dbg1_err_event         ), 
  .mcu_dbg1_crc21	    (mcu1_dbg1_crc21             ),
  .l2t0_mcu_rd_req          (l2t2_mcu1_rd_req            ),
  .l2t0_mcu_wr_req          (l2t2_mcu1_wr_req            ),
  .l2t0_mcu_rd_dummy_req    (l2t2_mcu1_rd_dummy_req      ),
  .l2t0_mcu_rd_req_id       (l2t2_mcu1_rd_req_id[ 2 : 0 ]    ),
  .l2t0_mcu_addr_39to7      (l2t2_mcu1_addr[ 39 : 7 ]        ),
  .l2t0_mcu_addr_5          (l2t2_mcu1_addr_5            ),
  .mcu_l2t0_rd_ack          (mcu1_l2t2_rd_ack            ),
  .mcu_l2t0_wr_ack          (mcu1_l2t2_wr_ack            ),
  .mcu_l2t0_data_vld_r0     (mcu1_l2t2_data_vld_r0       ),
  .mcu_l2t0_rd_req_id_r0    (mcu1_l2t2_rd_req_id_r0[ 2 : 0 ] ),
  .mcu_l2t0_secc_err_r3     (mcu1_l2t2_secc_err_r2       ),
  .mcu_l2t0_mecc_err_r3     (mcu1_l2t2_mecc_err_r2       ),
  .mcu_l2t0_scb_secc_err    (mcu1_l2t2_scb_secc_err      ),
  .mcu_l2t0_scb_mecc_err    (mcu1_l2t2_scb_mecc_err      ),
  .mcu_l2t0_qword_id_r0     (mcu1_l2t2_qword_id_r0[ 1 : 0 ]  ),
  .l2t1_mcu_rd_req          (l2t3_mcu1_rd_req_t2lff            ),
  .l2t1_mcu_wr_req          (l2t3_mcu1_wr_req_t2lff            ),
  .l2t1_mcu_rd_dummy_req    (l2t3_mcu1_rd_dummy_req_t2lff      ),
  .l2t1_mcu_rd_req_id       (l2t3_mcu1_rd_req_id_t2lff[ 2 : 0 ]    ),
  .l2t1_mcu_addr_39to7      (l2t3_mcu1_addr_t2lff[ 39 : 7 ]        ),
  .l2t1_mcu_addr_5          (l2t3_mcu1_addr_5_t2lff            ),
  .mcu_l2t1_rd_ack          (mcu1_l2t3_rd_ack            ),
  .mcu_l2t1_wr_ack          (mcu1_l2t3_wr_ack            ),
  .mcu_l2t1_data_vld_r0     (mcu1_l2t3_data_vld_r0       ),
  .mcu_l2t1_rd_req_id_r0    (mcu1_l2t3_rd_req_id_r0[ 2 : 0 ] ),
  .mcu_l2t1_secc_err_r3     (mcu1_l2t3_secc_err_r2       ),
  .mcu_l2t1_mecc_err_r3     (mcu1_l2t3_mecc_err_r2       ),
  .mcu_l2t1_scb_secc_err    (mcu1_l2t3_scb_secc_err      ),
  .mcu_l2t1_scb_mecc_err    (mcu1_l2t3_scb_mecc_err      ),
  .mcu_l2t1_qword_id_r0     (mcu1_l2t3_qword_id_r0[ 1 : 0 ]  ),
  .mcu_l2b_data_r3          (mcu1_l2b23_data_r2[ 127 : 0 ]   ),
  .mcu_l2b_ecc_r3           (mcu1_l2b23_ecc_r2[ 27 : 0 ]     ),
  .l2b0_mcu_data_mecc_r5    (l2b2_mcu1_data_mecc_r5      ),
  .l2b0_mcu_wr_data_r5      (l2b2_mcu1_wr_data_r5[ 63 : 0 ]  ),
  .l2b0_mcu_data_vld_r5     (l2b2_mcu1_data_vld_r5       ),
  .l2b1_mcu_data_mecc_r5    (l2b3_mcu1_data_mecc_r5      ),
  .l2b1_mcu_wr_data_r5      (l2b3_mcu1_wr_data_r5[ 63 : 0 ]  ),
  .l2b1_mcu_data_vld_r5     (l2b3_mcu1_data_vld_r5       ),
  .mcu_pt_sync_out          (mcu1_pt_sync_out            ),
  .mcu_pt_sync_in0          (mcu2_pt_sync_out            ),
  .mcu_pt_sync_in1          (mcu3_pt_sync_out            ),
  .mcu_pt_sync_in2          (mcu0_pt_sync_out            ),
  .mcu_ncu_data             (mcu1_ncu_data[ 3 : 0 ]          ),
  .mcu_ncu_stall            (mcu1_ncu_stall              ),
  .mcu_ncu_vld              (mcu1_ncu_vld                ),
  .ncu_mcu_data             (ncu_mcu1_data[ 3 : 0 ]          ),
  .ncu_mcu_stall            (ncu_mcu1_stall              ),
  .ncu_mcu_vld              (ncu_mcu1_vld                ),
  .mcu_ncu_ecc              (mcu1_ncu_ecc                ),
  .mcu_ncu_fbr              (mcu1_ncu_fbr                ),
  .ncu_mcu_ecci             (ncu_mcu1_ecci               ),
  .ncu_mcu_fbui             (ncu_mcu1_fbui               ),
  .ncu_mcu_fbri             (ncu_mcu1_fbri               ),
  .mcu_fsr0_data            (mcu1_fsr2_data[ 119 : 0 ]       ),
  .mcu_fsr1_data            (mcu1_fsr3_data[ 119 : 0 ]       ),
  .mcu_fsr0_cfgpll_enpll    (mcu1_fsr2_cfgpll_enpll      ),
  .mcu_fsr1_cfgpll_enpll    (mcu1_fsr3_cfgpll_enpll      ),
  .mcu_fsr01_cfgpll_lb      (mcu1_fsr23_cfgpll_lb[ 1 : 0 ]   ),
  .mcu_fsr01_cfgpll_mpy     (mcu1_fsr23_cfgpll_mpy[ 3 : 0 ]  ),
  .mcu_fsr0_cfgrx_enrx      (mcu1_fsr2_cfgrx_enrx        ),
  .mcu_fsr1_cfgrx_enrx      (mcu1_fsr3_cfgrx_enrx        ),
  .mcu_fsr0_cfgrx_align     (mcu1_fsr2_cfgrx_align       ),
  .mcu_fsr1_cfgrx_align     (mcu1_fsr3_cfgrx_align       ),
  .mcu_fsr0_cfgrx_invpair   (mcu1_fsr2_cfgrx_invpair[ 13 : 0 ]),
  .mcu_fsr1_cfgrx_invpair   (mcu1_fsr3_cfgrx_invpair[ 13 : 0 ]),
  .mcu_fsr01_cfgrx_eq       (mcu1_fsr23_cfgrx_eq[ 3 : 0 ]    ),
  .mcu_fsr01_cfgrx_cdr      (mcu1_fsr23_cfgrx_cdr[ 2 : 0 ]   ),
  .mcu_fsr01_cfgrx_term     (mcu1_fsr23_cfgrx_term[ 2 : 0 ]  ),
  .mcu_fsr0_cfgtx_entx      (mcu1_fsr2_cfgtx_entx        ),
  .mcu_fsr1_cfgtx_entx      (mcu1_fsr3_cfgtx_entx        ),
  .mcu_fsr0_cfgtx_enidl     (mcu1_fsr2_cfgtx_enidl       ),
  .mcu_fsr1_cfgtx_enidl     (mcu1_fsr3_cfgtx_enidl       ),
  .mcu_fsr0_cfgtx_invpair   (mcu1_fsr2_cfgtx_invpair[ 9 : 0 ]),
  .mcu_fsr1_cfgtx_invpair   (mcu1_fsr3_cfgtx_invpair[ 9 : 0 ]),
  .mcu_fsr01_cfgtx_enftp    (mcu1_fsr23_cfgtx_enftp      ),
  .mcu_fsr01_cfgtx_de       (mcu1_fsr23_cfgtx_de[ 3 : 0 ]    ),
  .mcu_fsr01_cfgtx_swing    (mcu1_fsr23_cfgtx_swing[ 2 : 0 ] ),
  .mcu_fsr01_cfgtx_cm       (mcu1_fsr23_cfgtx_cm         ),
  .mcu_fsr01_cfgrtx_rate    (mcu1_fsr23_cfgrtx_rate[ 1 : 0 ] ),
  .mcu_fsr0_cfgrx_entest    (mcu1_fsr2_cfgrx_entest      ),
  .mcu_fsr1_cfgrx_entest    (mcu1_fsr3_cfgrx_entest      ),
  .mcu_fsr0_cfgtx_entest    (mcu1_fsr2_cfgtx_entest      ),
  .mcu_fsr1_cfgtx_entest    (mcu1_fsr3_cfgtx_entest      ),
  .mcu_fsr0_cfgtx_bstx      (mcu1_fsr2_cfgtx_bstx[ 9 : 0 ]   ),
  .mcu_fsr1_cfgtx_bstx      (mcu1_fsr3_cfgtx_bstx[ 9 : 0 ]   ),
  .fsr0_mcu_data            (fsr2_mcu1_data[ 167 : 0 ]       ),
  .fsr1_mcu_data            (fsr3_mcu1_data[ 167 : 0 ]       ),
  .fsr0_mcu_rxbclk          (fsr2_mcu1_rxbclk[ 13 : 0 ]      ),
  .fsr1_mcu_rxbclk          (fsr3_mcu1_rxbclk[ 13 : 0 ]      ),
  .fsr0_mcu_stspll_lock     (fsr2_mcu1_stspll_lock[ 2 : 0 ]  ),
  .fsr1_mcu_stspll_lock     (fsr3_mcu1_stspll_lock[ 2 : 0 ]  ),
  .mcu_fsr0_testcfg         (mcu1_fsr2_testcfg[ 11 : 0 ]     ),
  .mcu_fsr1_testcfg         (mcu1_fsr3_testcfg[ 11 : 0 ]     ),
  .fsr0_mcu_stsrx_sync      ({fsr2_mcu1_stsrx_sync[ 8 ],    fsr2_mcu1_stsrx_sync[ 9 ],
			      fsr2_mcu1_stsrx_sync[ 13 : 10 ],fsr2_mcu1_stsrx_sync[ 7 : 0 ]}),
  .fsr1_mcu_stsrx_sync      ({fsr3_mcu1_stsrx_sync[ 8 ],    fsr3_mcu1_stsrx_sync[ 9 ],
			      fsr3_mcu1_stsrx_sync[ 13 : 10 ],fsr3_mcu1_stsrx_sync[ 7 : 0 ]}),
  .fsr0_mcu_stsrx_losdtct   ({fsr2_mcu1_stsrx_losdtct[ 8 ],    fsr2_mcu1_stsrx_losdtct[ 9 ],
			      fsr2_mcu1_stsrx_losdtct[ 13 : 10 ],fsr2_mcu1_stsrx_losdtct[ 7 : 0 ]}),
  .fsr1_mcu_stsrx_losdtct   ({fsr3_mcu1_stsrx_losdtct[ 8 ],    fsr3_mcu1_stsrx_losdtct[ 9 ],
			      fsr3_mcu1_stsrx_losdtct[ 13 : 10 ],fsr3_mcu1_stsrx_losdtct[ 7 : 0 ]}),
  .fsr0_mcu_stsrx_testfail  (fsr2_mcu1_stsrx_testfail[ 13 : 0 ]),
  .fsr1_mcu_stsrx_testfail  (fsr3_mcu1_stsrx_testfail[ 13 : 0 ]),
  .fsr0_mcu_stsrx_bsrxp     (fsr2_mcu1_stsrx_bsrxp[ 13 : 0 ] ),
  .fsr1_mcu_stsrx_bsrxp     (fsr3_mcu1_stsrx_bsrxp[ 13 : 0 ] ),
  .fsr0_mcu_stsrx_bsrxn     (fsr2_mcu1_stsrx_bsrxn[ 13 : 0 ] ),
  .fsr1_mcu_stsrx_bsrxn     (fsr3_mcu1_stsrx_bsrxn[ 13 : 0 ] ),
  .fsr0_mcu_ststx_testfail  (fsr2_mcu1_ststx_testfail[ 9 : 0 ]),
  .fsr1_mcu_ststx_testfail  (fsr3_mcu1_ststx_testfail[ 9 : 0 ]),
  .mcu_id                   ({1'b0,1'b1}                 ),
  .tcu_mcu_mbist_start      (tcu_mcu1_mbist_start_t1lff        ),
  .mcu_tcu_mbist_done       (mcu1_tcu_mbist_done         ),
  .mcu_tcu_mbist_fail       (mcu1_tcu_mbist_fail         ),
  .tcu_mcu_mbist_scan_in    (tcu_mcu1_mbist_scan_in      ),
  .mcu_tcu_mbist_scan_out   (mcu1_tcu_mbist_scan_out     ),
  .mcu_sbs_scan_in          (mcu0_sbs_scan_out           ),
  .mcu_sbs_scan_out         (mcu1_sbs_scan_out           ),
  .scan_in                  (tcu_socc_scan_out           ),
  .scan_out                 (mcu1_scan_out               ),
  .ncu_mcu_pm(ncu_mcu_pm),
  .ncu_mcu_ba01(ncu_mcu_ba01),
  .ncu_mcu_ba23(ncu_mcu_ba23),
  .ncu_mcu_ba45(ncu_mcu_ba45),
  .ncu_mcu_ba67(ncu_mcu_ba67),
  .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .tcu_sbs_scan_en(tcu_sbs_scan_en),
  .tcu_sbs_aclk(tcu_sbs_aclk),
  .tcu_sbs_bclk(tcu_sbs_bclk),
  .tcu_sbs_clk(tcu_sbs_clk),
  .tcu_sbs_uclk(tcu_sbs_uclk),
  .rst_mcu_selfrsh(rst_mcu_selfrsh),
  .rst_wmr_protect(rst_wmr_protect),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_scan_en(tcu_scan_en),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_array_bypass(tcu_array_bypass),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_div_bypass(tcu_div_bypass),
  .ccu_serdes_dtm(ccu_serdes_dtm)
         );
`endif  // OPENSPARC_CMP
//________________________________________________________________

// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
mcu mcu2(
  .gclk                     ( cmp_gclk_c0_mcu2 ), // cmp_gclk_c3_r[2]            ) , 
  .tcu_mcu_dr_clk_stop	( gl_mcu2_dr_clk_stop ),	// staged clk_stop
  .tcu_mcu_io_clk_stop	( gl_mcu2_io_clk_stop ),	// staged clk_stop
  .tcu_mcu_clk_stop	( gl_mcu2_clk_stop ),	// staged clk_stop
  .ccu_io_out	( gl_io_out_c1m ),	// staged div phase
  .dr_gclk                  ( dr_gclk_c0_mcu2 ), // dr_gclk_c3_r[2]             ) , 
  .ccu_dr_sync_en (gl_dr_sync_en_c1m),	
  .ccu_io_cmp_sync_en ( gl_io_cmp_sync_en_c1m ), 
  .ccu_cmp_io_sync_en ( gl_cmp_io_sync_en_c1m ),
  .tcu_mcu_fbd_clk_stop     (tcu_mcu2_fbd_clk_stop       ),
  .mcu_dbg1_rd_req_in_0	    (mcu2_dbg1_rd_req_in_0[ 3 : 0 ]  ),
  .mcu_dbg1_rd_req_in_1	    (mcu2_dbg1_rd_req_in_1[ 3 : 0 ]  ),
  .mcu_dbg1_rd_req_out	    (mcu2_dbg1_rd_req_out[ 4 : 0 ]   ),
  .mcu_dbg1_wr_req_in_0	    (mcu2_dbg1_wr_req_in_0       ),
  .mcu_dbg1_wr_req_in_1	    (mcu2_dbg1_wr_req_in_1       ),
  .mcu_dbg1_wr_req_out	    (mcu2_dbg1_wr_req_out[ 1 : 0 ]   ),
  .mcu_dbg1_mecc_err	    (mcu2_dbg1_mecc_err          ),
  .mcu_dbg1_secc_err	    (mcu2_dbg1_secc_err          ),
  .mcu_dbg1_fbd_err	    (mcu2_dbg1_fbd_err           ),
  .mcu_dbg1_err_mode	    (mcu2_dbg1_err_mode          ),
  .mcu_dbg1_err_event	    (mcu2_dbg1_err_event         ), 
  .mcu_dbg1_crc21	    (mcu2_dbg1_crc21             ), 
  .l2t0_mcu_rd_req          (l2t4_mcu2_rd_req            ),
  .l2t0_mcu_wr_req          (l2t4_mcu2_wr_req            ),
  .l2t0_mcu_rd_dummy_req    (l2t4_mcu2_rd_dummy_req      ),
  .l2t0_mcu_rd_req_id       (l2t4_mcu2_rd_req_id[ 2 : 0 ]    ),
  .l2t0_mcu_addr_39to7      (l2t4_mcu2_addr[ 39 : 7 ]        ),
  .l2t0_mcu_addr_5          (l2t4_mcu2_addr_5            ),
  .mcu_l2t0_rd_ack          (mcu2_l2t4_rd_ack            ),
  .mcu_l2t0_wr_ack          (mcu2_l2t4_wr_ack            ),
  .mcu_l2t0_data_vld_r0     (mcu2_l2t4_data_vld_r0       ),
  .mcu_l2t0_rd_req_id_r0    (mcu2_l2t4_rd_req_id_r0[ 2 : 0 ] ),
  .mcu_l2t0_secc_err_r3     (mcu2_l2t4_secc_err_r2       ),
  .mcu_l2t0_mecc_err_r3     (mcu2_l2t4_mecc_err_r2       ),
  .mcu_l2t0_scb_secc_err    (mcu2_l2t4_scb_secc_err      ),
  .mcu_l2t0_scb_mecc_err    (mcu2_l2t4_scb_mecc_err      ),
  .mcu_l2t0_qword_id_r0     (mcu2_l2t4_qword_id_r0[ 1 : 0 ]  ),
  .l2t1_mcu_rd_req          (l2t5_mcu2_rd_req_t4lff            ),
  .l2t1_mcu_wr_req          (l2t5_mcu2_wr_req_t4lff            ),
  .l2t1_mcu_rd_dummy_req    (l2t5_mcu2_rd_dummy_req_t4lff      ),
  .l2t1_mcu_rd_req_id       (l2t5_mcu2_rd_req_id_t4lff[ 2 : 0 ]    ),
  .l2t1_mcu_addr_39to7      (l2t5_mcu2_addr_t4lff[ 39 : 7 ]        ),
  .l2t1_mcu_addr_5          (l2t5_mcu2_addr_5_t4lff            ),
  .mcu_l2t1_rd_ack          (mcu2_l2t5_rd_ack            ),
  .mcu_l2t1_wr_ack          (mcu2_l2t5_wr_ack            ),
  .mcu_l2t1_data_vld_r0     (mcu2_l2t5_data_vld_r0       ),
  .mcu_l2t1_rd_req_id_r0    (mcu2_l2t5_rd_req_id_r0[ 2 : 0 ] ),
  .mcu_l2t1_secc_err_r3     (mcu2_l2t5_secc_err_r2       ),
  .mcu_l2t1_mecc_err_r3     (mcu2_l2t5_mecc_err_r2       ),
  .mcu_l2t1_scb_secc_err    (mcu2_l2t5_scb_secc_err      ),
  .mcu_l2t1_scb_mecc_err    (mcu2_l2t5_scb_mecc_err      ),
  .mcu_l2t1_qword_id_r0     (mcu2_l2t5_qword_id_r0[ 1 : 0 ]  ),
  .mcu_l2b_data_r3          (mcu2_l2b45_data_r2[ 127 : 0 ]   ),
  .mcu_l2b_ecc_r3           (mcu2_l2b45_ecc_r2[ 27 : 0 ]     ),
  .l2b0_mcu_data_mecc_r5    (l2b4_mcu2_data_mecc_r5      ),
  .l2b0_mcu_wr_data_r5      (l2b4_mcu2_wr_data_r5[ 63 : 0 ]  ),
  .l2b0_mcu_data_vld_r5     (l2b4_mcu2_data_vld_r5       ),
  .l2b1_mcu_data_mecc_r5    (l2b5_mcu2_data_mecc_r5      ),
  .l2b1_mcu_wr_data_r5      (l2b5_mcu2_wr_data_r5[ 63 : 0 ]  ),
  .l2b1_mcu_data_vld_r5     (l2b5_mcu2_data_vld_r5       ),
  .mcu_pt_sync_out          (mcu2_pt_sync_out            ),
  .mcu_pt_sync_in0          (mcu3_pt_sync_out            ),
  .mcu_pt_sync_in1          (mcu0_pt_sync_out            ),
  .mcu_pt_sync_in2          (mcu1_pt_sync_out            ),
  .mcu_ncu_data             (mcu2_ncu_data[ 3 : 0 ]          ),
  .mcu_ncu_stall            (mcu2_ncu_stall              ),
  .mcu_ncu_vld              (mcu2_ncu_vld                ),
  .ncu_mcu_data             (ncu_mcu2_data[ 3 : 0 ]          ),
  .ncu_mcu_stall            (ncu_mcu2_stall              ),
  .ncu_mcu_vld              (ncu_mcu2_vld                ),
  .mcu_ncu_ecc              (mcu2_ncu_ecc                ),
  .mcu_ncu_fbr              (mcu2_ncu_fbr                ),
  .ncu_mcu_ecci             (ncu_mcu2_ecci               ),
  .ncu_mcu_fbui             (ncu_mcu2_fbui               ),
  .ncu_mcu_fbri             (ncu_mcu2_fbri               ),
  .mcu_fsr0_data            (mcu2_fsr4_data[ 119 : 0 ]       ),
  .mcu_fsr1_data            (mcu2_fsr5_data[ 119 : 0 ]       ),
  .mcu_fsr0_cfgpll_enpll    (mcu2_fsr4_cfgpll_enpll      ),
  .mcu_fsr1_cfgpll_enpll    (mcu2_fsr5_cfgpll_enpll      ),
  .mcu_fsr01_cfgpll_lb      (mcu2_fsr45_cfgpll_lb[ 1 : 0 ]   ),
  .mcu_fsr01_cfgpll_mpy     (mcu2_fsr45_cfgpll_mpy[ 3 : 0 ]  ),
  .mcu_fsr0_cfgrx_enrx      (mcu2_fsr4_cfgrx_enrx        ),
  .mcu_fsr1_cfgrx_enrx      (mcu2_fsr5_cfgrx_enrx        ),
  .mcu_fsr0_cfgrx_align     (mcu2_fsr4_cfgrx_align       ),
  .mcu_fsr1_cfgrx_align     (mcu2_fsr5_cfgrx_align       ),
  .mcu_fsr0_cfgrx_invpair   (mcu2_fsr4_cfgrx_invpair[ 13 : 0 ]),
  .mcu_fsr1_cfgrx_invpair   (mcu2_fsr5_cfgrx_invpair[ 13 : 0 ]),
  .mcu_fsr01_cfgrx_eq       (mcu2_fsr45_cfgrx_eq[ 3 : 0 ]    ),
  .mcu_fsr01_cfgrx_cdr      (mcu2_fsr45_cfgrx_cdr[ 2 : 0 ]   ),
  .mcu_fsr01_cfgrx_term     (mcu2_fsr45_cfgrx_term[ 2 : 0 ]  ),
  .mcu_fsr0_cfgtx_entx      (mcu2_fsr4_cfgtx_entx        ),
  .mcu_fsr1_cfgtx_entx      (mcu2_fsr5_cfgtx_entx        ),
  .mcu_fsr0_cfgtx_enidl     (mcu2_fsr4_cfgtx_enidl       ),
  .mcu_fsr1_cfgtx_enidl     (mcu2_fsr5_cfgtx_enidl       ),
  .mcu_fsr0_cfgtx_invpair   (mcu2_fsr4_cfgtx_invpair[ 9 : 0 ]),
  .mcu_fsr1_cfgtx_invpair   (mcu2_fsr5_cfgtx_invpair[ 9 : 0 ]),
  .mcu_fsr01_cfgtx_enftp    (mcu2_fsr45_cfgtx_enftp      ),
  .mcu_fsr01_cfgtx_de       (mcu2_fsr45_cfgtx_de[ 3 : 0 ]    ),
  .mcu_fsr01_cfgtx_swing    (mcu2_fsr45_cfgtx_swing[ 2 : 0 ] ),
  .mcu_fsr01_cfgtx_cm       (mcu2_fsr45_cfgtx_cm         ),
  .mcu_fsr01_cfgrtx_rate    (mcu2_fsr45_cfgrtx_rate[ 1 : 0 ] ),
  .mcu_fsr0_cfgrx_entest    (mcu2_fsr4_cfgrx_entest      ),
  .mcu_fsr1_cfgrx_entest    (mcu2_fsr5_cfgrx_entest      ),
  .mcu_fsr0_cfgtx_entest    (mcu2_fsr4_cfgtx_entest      ),
  .mcu_fsr1_cfgtx_entest    (mcu2_fsr5_cfgtx_entest      ),
  .mcu_fsr0_cfgtx_bstx      (mcu2_fsr4_cfgtx_bstx[ 9 : 0 ]   ),
  .mcu_fsr1_cfgtx_bstx      (mcu2_fsr5_cfgtx_bstx[ 9 : 0 ]   ),
  .fsr0_mcu_data            (fsr4_mcu2_data[ 167 : 0 ]       ),
  .fsr1_mcu_data            (fsr5_mcu2_data[ 167 : 0 ]       ),
  .fsr0_mcu_rxbclk          (fsr4_mcu2_rxbclk[ 13 : 0 ]      ),
  .fsr1_mcu_rxbclk          (fsr5_mcu2_rxbclk[ 13 : 0 ]      ),
  .fsr0_mcu_stspll_lock     (fsr4_mcu2_stspll_lock[ 2 : 0 ]  ),
  .fsr1_mcu_stspll_lock     (fsr5_mcu2_stspll_lock[ 2 : 0 ]  ),
  .mcu_fsr0_testcfg         (mcu2_fsr4_testcfg[ 11 : 0 ]     ),
  .mcu_fsr1_testcfg         (mcu2_fsr5_testcfg[ 11 : 0 ]     ),
  .fsr0_mcu_stsrx_sync      ({fsr4_mcu2_stsrx_sync[ 9 : 8 ],fsr4_mcu2_stsrx_sync[ 0 ], fsr4_mcu2_stsrx_sync[ 1 ],
			      fsr4_mcu2_stsrx_sync[ 2 ],  fsr4_mcu2_stsrx_sync[ 3 ], fsr4_mcu2_stsrx_sync[ 4 ],
			      fsr4_mcu2_stsrx_sync[ 5 ],  fsr4_mcu2_stsrx_sync[ 6 ], fsr4_mcu2_stsrx_sync[ 7 ],
			      fsr4_mcu2_stsrx_sync[ 10 ], fsr4_mcu2_stsrx_sync[ 11 ],fsr4_mcu2_stsrx_sync[ 12 ],
			      fsr4_mcu2_stsrx_sync[ 13 ]}),
  .fsr1_mcu_stsrx_sync      ({fsr5_mcu2_stsrx_sync[ 9 : 8 ],fsr5_mcu2_stsrx_sync[ 0 ], fsr5_mcu2_stsrx_sync[ 1 ],
			      fsr5_mcu2_stsrx_sync[ 2 ],  fsr5_mcu2_stsrx_sync[ 3 ], fsr5_mcu2_stsrx_sync[ 4 ],
			      fsr5_mcu2_stsrx_sync[ 5 ],  fsr5_mcu2_stsrx_sync[ 6 ], fsr5_mcu2_stsrx_sync[ 7 ],
			      fsr5_mcu2_stsrx_sync[ 10 ], fsr5_mcu2_stsrx_sync[ 11 ],fsr5_mcu2_stsrx_sync[ 12 ],
			      fsr5_mcu2_stsrx_sync[ 13 ]}),
  .fsr0_mcu_stsrx_losdtct   ({fsr4_mcu2_stsrx_losdtct[ 9 : 8 ],fsr4_mcu2_stsrx_losdtct[ 0 ], fsr4_mcu2_stsrx_losdtct[ 1 ],
			      fsr4_mcu2_stsrx_losdtct[ 2 ],  fsr4_mcu2_stsrx_losdtct[ 3 ], fsr4_mcu2_stsrx_losdtct[ 4 ],
			      fsr4_mcu2_stsrx_losdtct[ 5 ],  fsr4_mcu2_stsrx_losdtct[ 6 ], fsr4_mcu2_stsrx_losdtct[ 7 ],
			      fsr4_mcu2_stsrx_losdtct[ 10 ], fsr4_mcu2_stsrx_losdtct[ 11 ],fsr4_mcu2_stsrx_losdtct[ 12 ],
			      fsr4_mcu2_stsrx_losdtct[ 13 ]}),
  .fsr1_mcu_stsrx_losdtct   ({fsr5_mcu2_stsrx_losdtct[ 9 : 8 ],fsr5_mcu2_stsrx_losdtct[ 0 ], fsr5_mcu2_stsrx_losdtct[ 1 ],
			      fsr5_mcu2_stsrx_losdtct[ 2 ],  fsr5_mcu2_stsrx_losdtct[ 3 ], fsr5_mcu2_stsrx_losdtct[ 4 ],
			      fsr5_mcu2_stsrx_losdtct[ 5 ],  fsr5_mcu2_stsrx_losdtct[ 6 ], fsr5_mcu2_stsrx_losdtct[ 7 ],
			      fsr5_mcu2_stsrx_losdtct[ 10 ], fsr5_mcu2_stsrx_losdtct[ 11 ],fsr5_mcu2_stsrx_losdtct[ 12 ],
			      fsr5_mcu2_stsrx_losdtct[ 13 ]}),
  .fsr0_mcu_stsrx_testfail  (fsr4_mcu2_stsrx_testfail[ 13 : 0 ]),
  .fsr1_mcu_stsrx_testfail  (fsr5_mcu2_stsrx_testfail[ 13 : 0 ]),
  .fsr0_mcu_stsrx_bsrxp     (fsr4_mcu2_stsrx_bsrxp[ 13 : 0 ] ),
  .fsr1_mcu_stsrx_bsrxp     (fsr5_mcu2_stsrx_bsrxp[ 13 : 0 ] ),
  .fsr0_mcu_stsrx_bsrxn     (fsr4_mcu2_stsrx_bsrxn[ 13 : 0 ] ),
  .fsr1_mcu_stsrx_bsrxn     (fsr5_mcu2_stsrx_bsrxn[ 13 : 0 ] ),
  .fsr0_mcu_ststx_testfail  (fsr4_mcu2_ststx_testfail[ 9 : 0 ]),
  .fsr1_mcu_ststx_testfail  (fsr5_mcu2_ststx_testfail[ 9 : 0 ]),
  .mcu_id                   ({1'b1,1'b0}                 ),
  .tcu_mcu_mbist_start      (tcu_mcu2_mbist_start        ),
  .mcu_tcu_mbist_done       (mcu2_tcu_mbist_done         ),
  .mcu_tcu_mbist_fail       (mcu2_tcu_mbist_fail         ),
  .tcu_mcu_mbist_scan_in    (tcu_mcu2_mbist_scan_in      ),
  .mcu_tcu_mbist_scan_out   (mcu2_tcu_mbist_scan_out     ),
  .mcu_sbs_scan_in          (mcu3_sbs_scan_out           ),
  .mcu_sbs_scan_out         (mcu2_sbs_scan_out           ),
  .scan_in                  (mcu1_scan_out               ),
  .scan_out                 (mcu2_scan_out               ),
  .ncu_mcu_pm(ncu_mcu_pm),
  .ncu_mcu_ba01(ncu_mcu_ba01),
  .ncu_mcu_ba23(ncu_mcu_ba23),
  .ncu_mcu_ba45(ncu_mcu_ba45),
  .ncu_mcu_ba67(ncu_mcu_ba67),
  .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .tcu_sbs_scan_en(tcu_sbs_scan_en),
  .tcu_sbs_aclk(tcu_sbs_aclk),
  .tcu_sbs_bclk(tcu_sbs_bclk),
  .tcu_sbs_clk(tcu_sbs_clk),
  .tcu_sbs_uclk(tcu_sbs_uclk),
  .rst_mcu_selfrsh(rst_mcu_selfrsh),
  .rst_wmr_protect(rst_wmr_protect),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_scan_en(tcu_scan_en),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_array_bypass(tcu_array_bypass),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_div_bypass(tcu_div_bypass),
  .ccu_serdes_dtm(ccu_serdes_dtm)
        );
`endif  // OPENSPARC_CMP
//________________________________________________________________

// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
mcu mcu3(
  .gclk                     ( cmp_gclk_c0_mcu3 ), // cmp_gclk_c3_r[3]            ) , 
  .tcu_mcu_dr_clk_stop	( gl_mcu3_dr_clk_stop ),	// staged clk_stop
  .tcu_mcu_io_clk_stop	( gl_mcu3_io_clk_stop ),	// staged clk_stop
  .tcu_mcu_clk_stop	( gl_mcu3_clk_stop ),	// staged clk_stop
  .ccu_io_out	( gl_io_out_c1m ),	// staged div phase
  .dr_gclk                  ( dr_gclk_c0_mcu3 ), // dr_gclk_c3_r[3]             ) , 
  .ccu_dr_sync_en (gl_dr_sync_en_c1m),	
  .ccu_io_cmp_sync_en ( gl_io_cmp_sync_en_c1m ), 
  .ccu_cmp_io_sync_en ( gl_cmp_io_sync_en_c1m ),
  .tcu_mcu_fbd_clk_stop     (tcu_mcu3_fbd_clk_stop       ),
  .mcu_dbg1_rd_req_in_0	    (mcu3_dbg1_rd_req_in_0[ 3 : 0 ]  ),
  .mcu_dbg1_rd_req_in_1	    (mcu3_dbg1_rd_req_in_1[ 3 : 0 ]  ),
  .mcu_dbg1_rd_req_out	    (mcu3_dbg1_rd_req_out[ 4 : 0 ]   ),
  .mcu_dbg1_wr_req_in_0	    (mcu3_dbg1_wr_req_in_0       ),
  .mcu_dbg1_wr_req_in_1	    (mcu3_dbg1_wr_req_in_1       ),
  .mcu_dbg1_wr_req_out	    (mcu3_dbg1_wr_req_out[ 1 : 0 ]   ),
  .mcu_dbg1_mecc_err	    (mcu3_dbg1_mecc_err          ),
  .mcu_dbg1_secc_err	    (mcu3_dbg1_secc_err          ),
  .mcu_dbg1_fbd_err	    (mcu3_dbg1_fbd_err           ),
  .mcu_dbg1_err_mode	    (mcu3_dbg1_err_mode          ),
  .mcu_dbg1_err_event	    (mcu3_dbg1_err_event         ), 
  .mcu_dbg1_crc21	    (mcu3_dbg1_crc21		 ), 
  .l2t0_mcu_rd_req          (l2t6_mcu3_rd_req            ),
  .l2t0_mcu_wr_req          (l2t6_mcu3_wr_req            ),
  .l2t0_mcu_rd_dummy_req    (l2t6_mcu3_rd_dummy_req      ),
  .l2t0_mcu_rd_req_id       (l2t6_mcu3_rd_req_id[ 2 : 0 ]    ),
  .l2t0_mcu_addr_39to7      (l2t6_mcu3_addr[ 39 : 7 ]        ),
  .l2t0_mcu_addr_5          (l2t6_mcu3_addr_5            ),
  .mcu_l2t0_rd_ack          (mcu3_l2t6_rd_ack            ),
  .mcu_l2t0_wr_ack          (mcu3_l2t6_wr_ack            ),
  .mcu_l2t0_data_vld_r0     (mcu3_l2t6_data_vld_r0       ),
  .mcu_l2t0_rd_req_id_r0    (mcu3_l2t6_rd_req_id_r0[ 2 : 0 ] ),
  .mcu_l2t0_secc_err_r3     (mcu3_l2t6_secc_err_r2       ),
  .mcu_l2t0_mecc_err_r3     (mcu3_l2t6_mecc_err_r2       ),
  .mcu_l2t0_scb_secc_err    (mcu3_l2t6_scb_secc_err      ),
  .mcu_l2t0_scb_mecc_err    (mcu3_l2t6_scb_mecc_err      ),
  .mcu_l2t0_qword_id_r0     (mcu3_l2t6_qword_id_r0[ 1 : 0 ]  ),
  .l2t1_mcu_rd_req          (l2t7_mcu3_rd_req_t6lff            ),
  .l2t1_mcu_wr_req          (l2t7_mcu3_wr_req_t6lff            ),
  .l2t1_mcu_rd_dummy_req    (l2t7_mcu3_rd_dummy_req_t6lff      ),
  .l2t1_mcu_rd_req_id       (l2t7_mcu3_rd_req_id_t6lff[ 2 : 0 ]    ),
  .l2t1_mcu_addr_39to7      (l2t7_mcu3_addr_t6lff[ 39 : 7 ]        ),
  .l2t1_mcu_addr_5          (l2t7_mcu3_addr_5_t6lff            ),
  .mcu_l2t1_rd_ack          (mcu3_l2t7_rd_ack            ),
  .mcu_l2t1_wr_ack          (mcu3_l2t7_wr_ack            ),
  .mcu_l2t1_data_vld_r0     (mcu3_l2t7_data_vld_r0       ),
  .mcu_l2t1_rd_req_id_r0    (mcu3_l2t7_rd_req_id_r0[ 2 : 0 ] ),
  .mcu_l2t1_secc_err_r3     (mcu3_l2t7_secc_err_r2       ),
  .mcu_l2t1_mecc_err_r3     (mcu3_l2t7_mecc_err_r2       ),
  .mcu_l2t1_scb_secc_err    (mcu3_l2t7_scb_secc_err      ),
  .mcu_l2t1_scb_mecc_err    (mcu3_l2t7_scb_mecc_err      ),
  .mcu_l2t1_qword_id_r0     (mcu3_l2t7_qword_id_r0[ 1 : 0 ]  ),
  .mcu_l2b_data_r3          (mcu3_l2b67_data_r2[ 127 : 0 ]   ),
  .mcu_l2b_ecc_r3           (mcu3_l2b67_ecc_r2[ 27 : 0 ]     ),
  .l2b0_mcu_data_mecc_r5    (l2b6_mcu3_data_mecc_r5      ),
  .l2b0_mcu_wr_data_r5      (l2b6_mcu3_wr_data_r5[ 63 : 0 ]  ),
  .l2b0_mcu_data_vld_r5     (l2b6_mcu3_data_vld_r5       ),
  .l2b1_mcu_data_mecc_r5    (l2b7_mcu3_data_mecc_r5      ),
  .l2b1_mcu_wr_data_r5      (l2b7_mcu3_wr_data_r5[ 63 : 0 ]  ),
  .l2b1_mcu_data_vld_r5     (l2b7_mcu3_data_vld_r5       ),
  .mcu_pt_sync_out          (mcu3_pt_sync_out            ),
  .mcu_pt_sync_in0          (mcu0_pt_sync_out            ),
  .mcu_pt_sync_in1          (mcu1_pt_sync_out            ),
  .mcu_pt_sync_in2          (mcu2_pt_sync_out            ),
  .mcu_ncu_data             (mcu3_ncu_data[ 3 : 0 ]          ),
  .mcu_ncu_stall            (mcu3_ncu_stall              ),
  .mcu_ncu_vld              (mcu3_ncu_vld                ),
  .ncu_mcu_data             (ncu_mcu3_data[ 3 : 0 ]          ),
  .ncu_mcu_stall            (ncu_mcu3_stall              ),
  .ncu_mcu_vld              (ncu_mcu3_vld                ),
  .mcu_ncu_ecc              (mcu3_ncu_ecc                ),
  .mcu_ncu_fbr              (mcu3_ncu_fbr                ),
  .ncu_mcu_ecci             (ncu_mcu3_ecci               ),
  .ncu_mcu_fbui             (ncu_mcu3_fbui               ),
  .ncu_mcu_fbri             (ncu_mcu3_fbri               ),
  .mcu_fsr0_data            (mcu3_fsr6_data[ 119 : 0 ]       ),
  .mcu_fsr1_data            (mcu3_fsr7_data[ 119 : 0 ]       ),
  .mcu_fsr0_cfgpll_enpll    (mcu3_fsr6_cfgpll_enpll      ),
  .mcu_fsr1_cfgpll_enpll    (mcu3_fsr7_cfgpll_enpll      ),
  .mcu_fsr01_cfgpll_lb      (mcu3_fsr67_cfgpll_lb[ 1 : 0 ]   ),
  .mcu_fsr01_cfgpll_mpy     (mcu3_fsr67_cfgpll_mpy[ 3 : 0 ]  ),
  .mcu_fsr0_cfgrx_enrx      (mcu3_fsr6_cfgrx_enrx        ),
  .mcu_fsr1_cfgrx_enrx      (mcu3_fsr7_cfgrx_enrx        ),
  .mcu_fsr0_cfgrx_align     (mcu3_fsr6_cfgrx_align       ),
  .mcu_fsr1_cfgrx_align     (mcu3_fsr7_cfgrx_align       ),
  .mcu_fsr0_cfgrx_invpair   (mcu3_fsr6_cfgrx_invpair[ 13 : 0 ]),
  .mcu_fsr1_cfgrx_invpair   (mcu3_fsr7_cfgrx_invpair[ 13 : 0 ]),
  .mcu_fsr01_cfgrx_eq       (mcu3_fsr67_cfgrx_eq[ 3 : 0 ]    ),
  .mcu_fsr01_cfgrx_cdr      (mcu3_fsr67_cfgrx_cdr[ 2 : 0 ]   ),
  .mcu_fsr01_cfgrx_term     (mcu3_fsr67_cfgrx_term[ 2 : 0 ]  ),
  .mcu_fsr0_cfgtx_entx      (mcu3_fsr6_cfgtx_entx        ),
  .mcu_fsr1_cfgtx_entx      (mcu3_fsr7_cfgtx_entx        ),
  .mcu_fsr0_cfgtx_enidl     (mcu3_fsr6_cfgtx_enidl       ),
  .mcu_fsr1_cfgtx_enidl     (mcu3_fsr7_cfgtx_enidl       ),
  .mcu_fsr0_cfgtx_invpair   (mcu3_fsr6_cfgtx_invpair[ 9 : 0 ]),
  .mcu_fsr1_cfgtx_invpair   (mcu3_fsr7_cfgtx_invpair[ 9 : 0 ]),
  .mcu_fsr01_cfgtx_enftp    (mcu3_fsr67_cfgtx_enftp      ),
  .mcu_fsr01_cfgtx_de       (mcu3_fsr67_cfgtx_de[ 3 : 0 ]    ),
  .mcu_fsr01_cfgtx_swing    (mcu3_fsr67_cfgtx_swing[ 2 : 0 ] ),
  .mcu_fsr01_cfgtx_cm       (mcu3_fsr67_cfgtx_cm         ),
  .mcu_fsr01_cfgrtx_rate    (mcu3_fsr67_cfgrtx_rate[ 1 : 0 ] ),
  .mcu_fsr0_cfgrx_entest    (mcu3_fsr6_cfgrx_entest      ),
  .mcu_fsr1_cfgrx_entest    (mcu3_fsr7_cfgrx_entest      ),
  .mcu_fsr0_cfgtx_entest    (mcu3_fsr6_cfgtx_entest      ),
  .mcu_fsr1_cfgtx_entest    (mcu3_fsr7_cfgtx_entest      ),
  .mcu_fsr0_cfgtx_bstx      (mcu3_fsr6_cfgtx_bstx[ 9 : 0 ]   ),
  .mcu_fsr1_cfgtx_bstx      (mcu3_fsr7_cfgtx_bstx[ 9 : 0 ]   ),
  .fsr0_mcu_data            (fsr6_mcu3_data[ 167 : 0 ]       ),
  .fsr1_mcu_data            (fsr7_mcu3_data[ 167 : 0 ]       ),
  .fsr0_mcu_rxbclk          (fsr6_mcu3_rxbclk[ 13 : 0 ]      ),
  .fsr1_mcu_rxbclk          (fsr7_mcu3_rxbclk[ 13 : 0 ]      ),
  .fsr0_mcu_stspll_lock     (fsr6_mcu3_stspll_lock[ 2 : 0 ]  ),
  .fsr1_mcu_stspll_lock     (fsr7_mcu3_stspll_lock[ 2 : 0 ]  ),
  .mcu_fsr0_testcfg         (mcu3_fsr6_testcfg[ 11 : 0 ]     ),
  .mcu_fsr1_testcfg         (mcu3_fsr7_testcfg[ 11 : 0 ]     ),
  .fsr0_mcu_stsrx_sync      ({fsr6_mcu3_stsrx_sync[ 9 : 8 ],fsr6_mcu3_stsrx_sync[ 0 ], fsr6_mcu3_stsrx_sync[ 1 ],
			      fsr6_mcu3_stsrx_sync[ 2 ],  fsr6_mcu3_stsrx_sync[ 3 ], fsr6_mcu3_stsrx_sync[ 4 ],
			      fsr6_mcu3_stsrx_sync[ 5 ],  fsr6_mcu3_stsrx_sync[ 6 ], fsr6_mcu3_stsrx_sync[ 7 ],
			      fsr6_mcu3_stsrx_sync[ 10 ], fsr6_mcu3_stsrx_sync[ 11 ],fsr6_mcu3_stsrx_sync[ 12 ],
			      fsr6_mcu3_stsrx_sync[ 13 ]}),
  .fsr1_mcu_stsrx_sync      ({fsr7_mcu3_stsrx_sync[ 8 ],    fsr7_mcu3_stsrx_sync[ 9 ],
			      fsr7_mcu3_stsrx_sync[ 13 : 10 ],fsr7_mcu3_stsrx_sync[ 7 : 0 ]}),
  .fsr0_mcu_stsrx_losdtct   ({fsr6_mcu3_stsrx_losdtct[ 9 : 8 ],fsr6_mcu3_stsrx_losdtct[ 0 ], fsr6_mcu3_stsrx_losdtct[ 1 ],
			      fsr6_mcu3_stsrx_losdtct[ 2 ],  fsr6_mcu3_stsrx_losdtct[ 3 ], fsr6_mcu3_stsrx_losdtct[ 4 ],
			      fsr6_mcu3_stsrx_losdtct[ 5 ],  fsr6_mcu3_stsrx_losdtct[ 6 ], fsr6_mcu3_stsrx_losdtct[ 7 ],
			      fsr6_mcu3_stsrx_losdtct[ 10 ], fsr6_mcu3_stsrx_losdtct[ 11 ],fsr6_mcu3_stsrx_losdtct[ 12 ],
			      fsr6_mcu3_stsrx_losdtct[ 13 ]}),
  .fsr1_mcu_stsrx_losdtct   ({fsr7_mcu3_stsrx_losdtct[ 8 ],    fsr7_mcu3_stsrx_losdtct[ 9 ],
			      fsr7_mcu3_stsrx_losdtct[ 13 : 10 ],fsr7_mcu3_stsrx_losdtct[ 7 : 0 ]}),
  .fsr0_mcu_stsrx_testfail  (fsr6_mcu3_stsrx_testfail[ 13 : 0 ]),
  .fsr1_mcu_stsrx_testfail  (fsr7_mcu3_stsrx_testfail[ 13 : 0 ]),
  .fsr0_mcu_stsrx_bsrxp     (fsr6_mcu3_stsrx_bsrxp[ 13 : 0 ] ),
  .fsr1_mcu_stsrx_bsrxp     (fsr7_mcu3_stsrx_bsrxp[ 13 : 0 ] ),
  .fsr0_mcu_stsrx_bsrxn     (fsr6_mcu3_stsrx_bsrxn[ 13 : 0 ] ),
  .fsr1_mcu_stsrx_bsrxn     (fsr7_mcu3_stsrx_bsrxn[ 13 : 0 ] ),
  .fsr0_mcu_ststx_testfail  (fsr6_mcu3_ststx_testfail[ 9 : 0 ]),
  .fsr1_mcu_ststx_testfail  (fsr7_mcu3_ststx_testfail[ 9 : 0 ]),
  .mcu_id                   ({1'b1,1'b1}                 ),
  .tcu_mcu_mbist_start      (tcu_mcu3_mbist_start        ),
  .mcu_tcu_mbist_done       (mcu3_tcu_mbist_done         ),
  .mcu_tcu_mbist_fail       (mcu3_tcu_mbist_fail         ),
  .tcu_mcu_mbist_scan_in    (tcu_mcu3_mbist_scan_in      ),
  .mcu_tcu_mbist_scan_out   (mcu3_tcu_mbist_scan_out     ),
  .mcu_sbs_scan_in          (mac_mcu_3_sbs_output	 ),		// 03/24
  .mcu_sbs_scan_out         (mcu3_sbs_scan_out           ),
  .scan_in                  (ncu_scan_out                ),
  .scan_out                 (mcu3_scan_out               ),
  .ncu_mcu_pm(ncu_mcu_pm),
  .ncu_mcu_ba01(ncu_mcu_ba01),
  .ncu_mcu_ba23(ncu_mcu_ba23),
  .ncu_mcu_ba45(ncu_mcu_ba45),
  .ncu_mcu_ba67(ncu_mcu_ba67),
  .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .tcu_sbs_scan_en(tcu_sbs_scan_en),
  .tcu_sbs_aclk(tcu_sbs_aclk),
  .tcu_sbs_bclk(tcu_sbs_bclk),
  .tcu_sbs_clk(tcu_sbs_clk),
  .tcu_sbs_uclk(tcu_sbs_uclk),
  .rst_mcu_selfrsh(rst_mcu_selfrsh),
  .rst_wmr_protect(rst_wmr_protect),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_scan_en(tcu_scan_en),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_array_bypass(tcu_array_bypass),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_div_bypass(tcu_div_bypass),
  .ccu_serdes_dtm(ccu_serdes_dtm)
         );     
`endif  // OPENSPARC_CMP

//________________________________________________________________

// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
fsr_left fsr_left (
  .FBDIMM0A_RX_P        ({FBDIMM0A_RX_P[ 11 : 8 ],FBDIMM0A_RX_P[ 12 ],FBDIMM0A_RX_P[ 13 ],FBDIMM0A_RX_P[ 7 : 0 ]}),
  .FBDIMM0A_RX_N        ({FBDIMM0A_RX_N[ 11 : 8 ],FBDIMM0A_RX_N[ 12 ],FBDIMM0A_RX_N[ 13 ],FBDIMM0A_RX_N[ 7 : 0 ]}),
  .FBDIMM0A_TX_P        ({FBDIMM0A_TX_P[ 8 : 5 ],FBDIMM0A_TX_P[ 9 ],FBDIMM0A_TX_P[ 4 : 0 ]}),
  .FBDIMM0A_TX_N        ({FBDIMM0A_TX_N[ 8 : 5 ],FBDIMM0A_TX_N[ 9 ],FBDIMM0A_TX_N[ 4 : 0 ]}),
  .FBDIMM0B_RX_P        ({FBDIMM0B_RX_P[ 11 : 8 ],FBDIMM0B_RX_P[ 12 ],FBDIMM0B_RX_P[ 13 ],FBDIMM0B_RX_P[ 7 : 0 ]}),
  .FBDIMM0B_RX_N        ({FBDIMM0B_RX_N[ 11 : 8 ],FBDIMM0B_RX_N[ 12 ],FBDIMM0B_RX_N[ 13 ],FBDIMM0B_RX_N[ 7 : 0 ]}),
  .FBDIMM0B_TX_P        ({FBDIMM0B_TX_P[ 8 : 5 ],FBDIMM0B_TX_P[ 9 ],FBDIMM0B_TX_P[ 4 : 0 ]}),
  .FBDIMM0B_TX_N        ({FBDIMM0B_TX_N[ 8 : 5 ],FBDIMM0B_TX_N[ 9 ],FBDIMM0B_TX_N[ 4 : 0 ]}),
  .FBDIMM1A_RX_P        ({FBDIMM1A_RX_P[ 11 : 8 ],FBDIMM1A_RX_P[ 12 ],FBDIMM1A_RX_P[ 13 ],FBDIMM1A_RX_P[ 7 : 0 ]}),
  .FBDIMM1A_RX_N        ({FBDIMM1A_RX_N[ 11 : 8 ],FBDIMM1A_RX_N[ 12 ],FBDIMM1A_RX_N[ 13 ],FBDIMM1A_RX_N[ 7 : 0 ]}),
  .FBDIMM1A_TX_P        ({FBDIMM1A_TX_P[ 8 : 5 ],FBDIMM1A_TX_P[ 9 ],FBDIMM1A_TX_P[ 4 : 0 ]}),
  .FBDIMM1A_TX_N        ({FBDIMM1A_TX_N[ 8 : 5 ],FBDIMM1A_TX_N[ 9 ],FBDIMM1A_TX_N[ 4 : 0 ]}),
  .FBDIMM1B_RX_P        ({FBDIMM1B_RX_P[ 11 : 8 ],FBDIMM1B_RX_P[ 12 ],FBDIMM1B_RX_P[ 13 ],FBDIMM1B_RX_P[ 7 : 0 ]}),
  .FBDIMM1B_RX_N        ({FBDIMM1B_RX_N[ 11 : 8 ],FBDIMM1B_RX_N[ 12 ],FBDIMM1B_RX_N[ 13 ],FBDIMM1B_RX_N[ 7 : 0 ]}),
  .FBDIMM1B_TX_P        ({FBDIMM1B_TX_P[ 8 : 5 ],FBDIMM1B_TX_P[ 9 ],FBDIMM1B_TX_P[ 4 : 0 ]}),
  .FBDIMM1B_TX_N        ({FBDIMM1B_TX_N[ 8 : 5 ],FBDIMM1B_TX_N[ 9 ],FBDIMM1B_TX_N[ 4 : 0 ]}),
  .mcu0_fsr0_td0        (mcu0_fsr0_data[ 11 : 0 ]),
  .mcu0_fsr0_td1        (mcu0_fsr0_data[ 23 : 12 ]),
  .mcu0_fsr0_td2        (mcu0_fsr0_data[ 35 : 24 ]),
  .mcu0_fsr0_td3        (mcu0_fsr0_data[ 47 : 36 ]),
  .mcu0_fsr0_td4        (mcu0_fsr0_data[ 59 : 48 ]),
  .mcu0_fsr0_td6        (mcu0_fsr0_data[ 71 : 60 ]),
  .mcu0_fsr0_td7        (mcu0_fsr0_data[ 83 : 72 ]),
  .mcu0_fsr0_td8        (mcu0_fsr0_data[ 95 : 84 ]),
  .mcu0_fsr0_td9        (mcu0_fsr0_data[ 107 : 96 ]),
  .mcu0_fsr0_td5        (mcu0_fsr0_data[ 119 : 108 ]),
  .fsr0_mcu0_rd0        (fsr0_mcu0_data[ 11 : 0 ]),
  .fsr0_mcu0_rd1        (fsr0_mcu0_data[ 23 : 12 ]),
  .fsr0_mcu0_rd2        (fsr0_mcu0_data[ 35 : 24 ]),
  .fsr0_mcu0_rd3        (fsr0_mcu0_data[ 47 : 36 ]),
  .fsr0_mcu0_rd4        (fsr0_mcu0_data[ 59 : 48 ]),
  .fsr0_mcu0_rd5        (fsr0_mcu0_data[ 71 : 60 ]),
  .fsr0_mcu0_rd6        (fsr0_mcu0_data[ 83 : 72 ]),
  .fsr0_mcu0_rd7        (fsr0_mcu0_data[ 95 : 84 ]),
  .fsr0_mcu0_rd10       (fsr0_mcu0_data[ 107 : 96 ]),
  .fsr0_mcu0_rd11       (fsr0_mcu0_data[ 119 : 108 ]),
  .fsr0_mcu0_rd12       (fsr0_mcu0_data[ 131 : 120 ]),
  .fsr0_mcu0_rd13       (fsr0_mcu0_data[ 143 : 132 ]),
  .fsr0_mcu0_rd9        (fsr0_mcu0_data[ 155 : 144 ]),
  .fsr0_mcu0_rd8        (fsr0_mcu0_data[ 167 : 156 ]),
  .mcu0_fsr0_cfgpll0    ({mcu0_fsr01_cfgpll_lb[ 1 : 0 ], mcu0_fsr01_cfgpll_mpy[ 3 : 0 ], mcu0_fsr0_cfgpll_enpll}),
  .mcu0_fsr0_cfgpll1    ({mcu0_fsr01_cfgpll_lb[ 1 : 0 ], mcu0_fsr01_cfgpll_mpy[ 3 : 0 ], mcu0_fsr0_cfgpll_enpll}),
  .mcu0_fsr0_cfgpll2    ({mcu0_fsr01_cfgpll_lb[ 1 : 0 ], mcu0_fsr01_cfgpll_mpy[ 3 : 0 ], mcu0_fsr0_cfgpll_enpll}),
  .mcu0_fsr0_cfgrx0     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr0_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr0_cfgrx_invpair[ 0 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr0_cfgrx_entest, mcu0_fsr0_cfgrx_enrx}),
  .mcu0_fsr0_cfgrx1     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr0_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr0_cfgrx_invpair[ 1 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr0_cfgrx_entest, mcu0_fsr0_cfgrx_enrx}),
  .mcu0_fsr0_cfgrx2     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr0_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr0_cfgrx_invpair[ 2 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr0_cfgrx_entest, mcu0_fsr0_cfgrx_enrx}),
  .mcu0_fsr0_cfgrx3     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr0_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr0_cfgrx_invpair[ 3 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr0_cfgrx_entest, mcu0_fsr0_cfgrx_enrx}),
  .mcu0_fsr0_cfgrx4     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr0_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr0_cfgrx_invpair[ 4 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr0_cfgrx_entest, mcu0_fsr0_cfgrx_enrx}),
  .mcu0_fsr0_cfgrx5     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr0_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr0_cfgrx_invpair[ 5 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr0_cfgrx_entest, mcu0_fsr0_cfgrx_enrx}),
  .mcu0_fsr0_cfgrx6     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr0_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr0_cfgrx_invpair[ 6 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr0_cfgrx_entest, mcu0_fsr0_cfgrx_enrx}),
  .mcu0_fsr0_cfgrx7     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr0_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr0_cfgrx_invpair[ 7 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr0_cfgrx_entest, mcu0_fsr0_cfgrx_enrx}),
  .mcu0_fsr0_cfgrx10    ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr0_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr0_cfgrx_invpair[ 8 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr0_cfgrx_entest, mcu0_fsr0_cfgrx_enrx}),
  .mcu0_fsr0_cfgrx11    ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr0_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr0_cfgrx_invpair[ 9 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr0_cfgrx_entest, mcu0_fsr0_cfgrx_enrx}),
  .mcu0_fsr0_cfgrx12    ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr0_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr0_cfgrx_invpair[ 10 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr0_cfgrx_entest, mcu0_fsr0_cfgrx_enrx}),
  .mcu0_fsr0_cfgrx13    ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr0_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr0_cfgrx_invpair[ 11 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr0_cfgrx_entest, mcu0_fsr0_cfgrx_enrx}),
  .mcu0_fsr0_cfgrx9     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr0_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr0_cfgrx_invpair[ 12 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr0_cfgrx_entest, mcu0_fsr0_cfgrx_enrx}),
  .mcu0_fsr0_cfgrx8     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr0_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr0_cfgrx_invpair[ 13 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr0_cfgrx_entest, mcu0_fsr0_cfgrx_enrx}),
  .mcu0_fsr0_cfgtx0     ({mcu0_fsr0_cfgtx_enidl, mcu0_fsr0_cfgtx_bstx[ 0 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr0_cfgtx_invpair[ 0 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr0_cfgtx_entest, 
			  mcu0_fsr0_cfgtx_entx}),
  .mcu0_fsr0_cfgtx1     ({mcu0_fsr0_cfgtx_enidl, mcu0_fsr0_cfgtx_bstx[ 1 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr0_cfgtx_invpair[ 1 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr0_cfgtx_entest, 
			  mcu0_fsr0_cfgtx_entx}),
  .mcu0_fsr0_cfgtx2     ({mcu0_fsr0_cfgtx_enidl, mcu0_fsr0_cfgtx_bstx[ 2 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr0_cfgtx_invpair[ 2 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr0_cfgtx_entest, 
			  mcu0_fsr0_cfgtx_entx}),
  .mcu0_fsr0_cfgtx3     ({mcu0_fsr0_cfgtx_enidl, mcu0_fsr0_cfgtx_bstx[ 3 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr0_cfgtx_invpair[ 3 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr0_cfgtx_entest, 
			  mcu0_fsr0_cfgtx_entx}),
  .mcu0_fsr0_cfgtx4     ({mcu0_fsr0_cfgtx_enidl, mcu0_fsr0_cfgtx_bstx[ 4 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr0_cfgtx_invpair[ 4 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr0_cfgtx_entest, 
			  mcu0_fsr0_cfgtx_entx}),
  .mcu0_fsr0_cfgtx6     ({mcu0_fsr0_cfgtx_enidl, mcu0_fsr0_cfgtx_bstx[ 5 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr0_cfgtx_invpair[ 5 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr0_cfgtx_entest, 
			  mcu0_fsr0_cfgtx_entx}),
  .mcu0_fsr0_cfgtx7     ({mcu0_fsr0_cfgtx_enidl, mcu0_fsr0_cfgtx_bstx[ 6 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr0_cfgtx_invpair[ 6 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr0_cfgtx_entest, 
			  mcu0_fsr0_cfgtx_entx}),
  .mcu0_fsr0_cfgtx8     ({mcu0_fsr0_cfgtx_enidl, mcu0_fsr0_cfgtx_bstx[ 7 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr0_cfgtx_invpair[ 7 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr0_cfgtx_entest, 
			  mcu0_fsr0_cfgtx_entx}),
  .mcu0_fsr0_cfgtx9     ({mcu0_fsr0_cfgtx_enidl, mcu0_fsr0_cfgtx_bstx[ 8 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr0_cfgtx_invpair[ 8 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr0_cfgtx_entest, 
			  mcu0_fsr0_cfgtx_entx}),
  .mcu0_fsr0_cfgtx5     ({mcu0_fsr0_cfgtx_enidl, mcu0_fsr0_cfgtx_bstx[ 9 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr0_cfgtx_invpair[ 9 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr0_cfgtx_entest, 
			  mcu0_fsr0_cfgtx_entx}),
  .mcu0_fsr0_testcfg0   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu0_fsr0_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu0_fsr0_testcfg[ 7 : 0 ]}),
  .mcu0_fsr0_testcfg1   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu0_fsr0_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu0_fsr0_testcfg[ 7 : 0 ]}),
  .mcu0_fsr0_testcfg2   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu0_fsr0_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu0_fsr0_testcfg[ 7 : 0 ]}),
  .fsr0_txbclkin	({dr_gclk_c4_fsr0_2,dr_gclk_c4_fsr0_1,dr_gclk_c4_fsr0_0}),
  .fsr0_mcu0_rxbclk  	({fsr0_mcu0_rxbclk[ 11 : 8 ],fsr0_mcu0_rxbclk[ 12 ],fsr0_mcu0_rxbclk[ 13 ],fsr0_mcu0_rxbclk[ 7 : 0 ]}),
  .fsr0_rxbclkin	({fsr0_mcu0_rxbclk[ 11 : 8 ],fsr0_mcu0_rxbclk[ 12 ],fsr0_mcu0_rxbclk[ 13 ],fsr0_mcu0_rxbclk[ 7 : 0 ]}),
  .fsr0_bsinitclk	({tcu_sbs_bsinitclk, tcu_sbs_bsinitclk, tcu_sbs_bsinitclk}),
  .fsr0_fclk    	({efu_mcu_fclk, efu_mcu_fclk, efu_mcu_fclk}),
  .fsr0_fclrz   	({efu_mcu_fclrz, efu_mcu_fclrz, efu_mcu_fclrz}),
  .fsr0_fdi     	({efu_mcu_fdi,fsr0_fdo[ 2 : 1 ]}),
  .fsr0_fdo     	(fsr0_fdo[ 2 : 0 ]),
  .fsr0_stcicfg 	({tcu_stcicfg[ 1 : 0 ], tcu_stcicfg[ 1 : 0 ], tcu_stcicfg[ 1 : 0 ]}),
  .fsr0_stciclk 	({tcu_stciclk, tcu_stciclk, tcu_stciclk}),
  .fsr0_stcid   	({fsr0_stciq[ 1 : 0 ],tcu_stcid}),
  .fsr0_stciq   	(fsr0_stciq[ 2 : 0 ]),
  .fsr0_testclkr	({mio_fsr_testclkr[ 0 ],mio_fsr_testclkr[ 0 ],mio_fsr_testclkr[ 0 ]}),
  .fsr0_testclkt	({mio_fsr_testclkt[ 0 ],mio_fsr_testclkt[ 0 ],mio_fsr_testclkt[ 0 ]}),
  .mcu0_fsr1_td0        (mcu0_fsr1_data[ 11 : 0 ]),
  .mcu0_fsr1_td1        (mcu0_fsr1_data[ 23 : 12 ]),
  .mcu0_fsr1_td2        (mcu0_fsr1_data[ 35 : 24 ]),
  .mcu0_fsr1_td3        (mcu0_fsr1_data[ 47 : 36 ]),
  .mcu0_fsr1_td4        (mcu0_fsr1_data[ 59 : 48 ]),
  .mcu0_fsr1_td6        (mcu0_fsr1_data[ 71 : 60 ]),
  .mcu0_fsr1_td7        (mcu0_fsr1_data[ 83 : 72 ]),
  .mcu0_fsr1_td8        (mcu0_fsr1_data[ 95 : 84 ]),
  .mcu0_fsr1_td9        (mcu0_fsr1_data[ 107 : 96 ]),
  .mcu0_fsr1_td5        (mcu0_fsr1_data[ 119 : 108 ]),
  .fsr1_mcu0_rd0        (fsr1_mcu0_data[ 11 : 0 ]),
  .fsr1_mcu0_rd1        (fsr1_mcu0_data[ 23 : 12 ]),
  .fsr1_mcu0_rd2        (fsr1_mcu0_data[ 35 : 24 ]),
  .fsr1_mcu0_rd3        (fsr1_mcu0_data[ 47 : 36 ]),
  .fsr1_mcu0_rd4        (fsr1_mcu0_data[ 59 : 48 ]),
  .fsr1_mcu0_rd5        (fsr1_mcu0_data[ 71 : 60 ]),
  .fsr1_mcu0_rd6        (fsr1_mcu0_data[ 83 : 72 ]),
  .fsr1_mcu0_rd7        (fsr1_mcu0_data[ 95 : 84 ]),
  .fsr1_mcu0_rd10       (fsr1_mcu0_data[ 107 : 96 ]),
  .fsr1_mcu0_rd11       (fsr1_mcu0_data[ 119 : 108 ]),
  .fsr1_mcu0_rd12       (fsr1_mcu0_data[ 131 : 120 ]),
  .fsr1_mcu0_rd13       (fsr1_mcu0_data[ 143 : 132 ]),
  .fsr1_mcu0_rd9        (fsr1_mcu0_data[ 155 : 144 ]),
  .fsr1_mcu0_rd8        (fsr1_mcu0_data[ 167 : 156 ]),
  .mcu0_fsr1_cfgpll0    ({mcu0_fsr01_cfgpll_lb[ 1 : 0 ], mcu0_fsr01_cfgpll_mpy[ 3 : 0 ], mcu0_fsr1_cfgpll_enpll}),
  .mcu0_fsr1_cfgpll1    ({mcu0_fsr01_cfgpll_lb[ 1 : 0 ], mcu0_fsr01_cfgpll_mpy[ 3 : 0 ], mcu0_fsr1_cfgpll_enpll}),
  .mcu0_fsr1_cfgpll2    ({mcu0_fsr01_cfgpll_lb[ 1 : 0 ], mcu0_fsr01_cfgpll_mpy[ 3 : 0 ], mcu0_fsr1_cfgpll_enpll}),
  .mcu0_fsr1_cfgrx0     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr1_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr1_cfgrx_invpair[ 0 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr1_cfgrx_entest, mcu0_fsr1_cfgrx_enrx}),
  .mcu0_fsr1_cfgrx1     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr1_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr1_cfgrx_invpair[ 1 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr1_cfgrx_entest, mcu0_fsr1_cfgrx_enrx}),
  .mcu0_fsr1_cfgrx2     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr1_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr1_cfgrx_invpair[ 2 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr1_cfgrx_entest, mcu0_fsr1_cfgrx_enrx}),
  .mcu0_fsr1_cfgrx3     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr1_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr1_cfgrx_invpair[ 3 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr1_cfgrx_entest, mcu0_fsr1_cfgrx_enrx}),
  .mcu0_fsr1_cfgrx4     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr1_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr1_cfgrx_invpair[ 4 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr1_cfgrx_entest, mcu0_fsr1_cfgrx_enrx}),
  .mcu0_fsr1_cfgrx5     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr1_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr1_cfgrx_invpair[ 5 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr1_cfgrx_entest, mcu0_fsr1_cfgrx_enrx}),
  .mcu0_fsr1_cfgrx6     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr1_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr1_cfgrx_invpair[ 6 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr1_cfgrx_entest, mcu0_fsr1_cfgrx_enrx}),
  .mcu0_fsr1_cfgrx7     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr1_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr1_cfgrx_invpair[ 7 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr1_cfgrx_entest, mcu0_fsr1_cfgrx_enrx}),
  .mcu0_fsr1_cfgrx10    ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr1_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr1_cfgrx_invpair[ 8 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr1_cfgrx_entest, mcu0_fsr1_cfgrx_enrx}),
  .mcu0_fsr1_cfgrx11    ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr1_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr1_cfgrx_invpair[ 9 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr1_cfgrx_entest, mcu0_fsr1_cfgrx_enrx}),
  .mcu0_fsr1_cfgrx12    ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr1_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr1_cfgrx_invpair[ 10 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr1_cfgrx_entest, mcu0_fsr1_cfgrx_enrx}),
  .mcu0_fsr1_cfgrx13    ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr1_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr1_cfgrx_invpair[ 11 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr1_cfgrx_entest, mcu0_fsr1_cfgrx_enrx}),
  .mcu0_fsr1_cfgrx9     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr1_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr1_cfgrx_invpair[ 12 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr1_cfgrx_entest, mcu0_fsr1_cfgrx_enrx}),
  .mcu0_fsr1_cfgrx8     ({1'b0, 1'b0, mcu0_fsr01_cfgrx_eq[ 3 : 0 ], 
			  mcu0_fsr01_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu0_fsr1_cfgrx_align, 
			  mcu0_fsr01_cfgrx_term[ 2 : 0 ], mcu0_fsr1_cfgrx_invpair[ 13 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], 
			  mcu0_fsr1_cfgrx_entest, mcu0_fsr1_cfgrx_enrx}),
  .mcu0_fsr1_cfgtx0     ({mcu0_fsr1_cfgtx_enidl, mcu0_fsr1_cfgtx_bstx[ 0 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr1_cfgtx_invpair[ 0 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr1_cfgtx_entest, 
			  mcu0_fsr1_cfgtx_entx}),
  .mcu0_fsr1_cfgtx1     ({mcu0_fsr1_cfgtx_enidl, mcu0_fsr1_cfgtx_bstx[ 1 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr1_cfgtx_invpair[ 1 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr1_cfgtx_entest, 
			  mcu0_fsr1_cfgtx_entx}),
  .mcu0_fsr1_cfgtx2     ({mcu0_fsr1_cfgtx_enidl, mcu0_fsr1_cfgtx_bstx[ 2 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr1_cfgtx_invpair[ 2 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr1_cfgtx_entest, 
			  mcu0_fsr1_cfgtx_entx}),
  .mcu0_fsr1_cfgtx3     ({mcu0_fsr1_cfgtx_enidl, mcu0_fsr1_cfgtx_bstx[ 3 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr1_cfgtx_invpair[ 3 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr1_cfgtx_entest, 
			  mcu0_fsr1_cfgtx_entx}),
  .mcu0_fsr1_cfgtx4     ({mcu0_fsr1_cfgtx_enidl, mcu0_fsr1_cfgtx_bstx[ 4 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr1_cfgtx_invpair[ 4 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr1_cfgtx_entest, 
			  mcu0_fsr1_cfgtx_entx}),
  .mcu0_fsr1_cfgtx6     ({mcu0_fsr1_cfgtx_enidl, mcu0_fsr1_cfgtx_bstx[ 5 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr1_cfgtx_invpair[ 5 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr1_cfgtx_entest, 
			  mcu0_fsr1_cfgtx_entx}),
  .mcu0_fsr1_cfgtx7     ({mcu0_fsr1_cfgtx_enidl, mcu0_fsr1_cfgtx_bstx[ 6 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr1_cfgtx_invpair[ 6 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr1_cfgtx_entest, 
			  mcu0_fsr1_cfgtx_entx}),
  .mcu0_fsr1_cfgtx8     ({mcu0_fsr1_cfgtx_enidl, mcu0_fsr1_cfgtx_bstx[ 7 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr1_cfgtx_invpair[ 7 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr1_cfgtx_entest, 
			  mcu0_fsr1_cfgtx_entx}),
  .mcu0_fsr1_cfgtx9     ({mcu0_fsr1_cfgtx_enidl, mcu0_fsr1_cfgtx_bstx[ 8 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr1_cfgtx_invpair[ 8 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr1_cfgtx_entest, 
			  mcu0_fsr1_cfgtx_entx}),
  .mcu0_fsr1_cfgtx5     ({mcu0_fsr1_cfgtx_enidl, mcu0_fsr1_cfgtx_bstx[ 9 ], mcu0_fsr01_cfgtx_enftp, 
		  	  mcu0_fsr01_cfgtx_de[ 3 : 0 ], mcu0_fsr01_cfgtx_swing[ 2 : 0 ], mcu0_fsr01_cfgtx_cm, 
		  	  mcu0_fsr1_cfgtx_invpair[ 9 ], mcu0_fsr01_cfgrtx_rate[ 1 : 0 ], mcu0_fsr1_cfgtx_entest, 
			  mcu0_fsr1_cfgtx_entx}),
  .mcu0_fsr1_testcfg0   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu0_fsr1_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu0_fsr1_testcfg[ 7 : 0 ]}),
  .mcu0_fsr1_testcfg1   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu0_fsr1_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu0_fsr1_testcfg[ 7 : 0 ]}),
  .mcu0_fsr1_testcfg2   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu0_fsr1_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu0_fsr1_testcfg[ 7 : 0 ]}),
  .fsr1_txbclkin	({dr_gclk_c4_fsr1_2,dr_gclk_c4_fsr1_1,dr_gclk_c4_fsr1_0}),
  .fsr1_mcu0_rxbclk  	({fsr1_mcu0_rxbclk[ 11 : 8 ],fsr1_mcu0_rxbclk[ 12 ],fsr1_mcu0_rxbclk[ 13 ],fsr1_mcu0_rxbclk[ 7 : 0 ]}),
  .fsr1_rxbclkin	({fsr1_mcu0_rxbclk[ 11 : 8 ],fsr1_mcu0_rxbclk[ 12 ],fsr1_mcu0_rxbclk[ 13 ],fsr1_mcu0_rxbclk[ 7 : 0 ]}),
  .fsr1_bsinitclk	({tcu_sbs_bsinitclk, tcu_sbs_bsinitclk, tcu_sbs_bsinitclk}),
  .fsr1_fclk    	({efu_mcu_fclk, efu_mcu_fclk, efu_mcu_fclk}),
  .fsr1_fclrz   	({efu_mcu_fclrz, efu_mcu_fclrz, efu_mcu_fclrz}),
  .fsr1_fdi     	({fsr0_fdo[ 0 ],fsr1_fdo[ 2 : 1 ]}),
  .fsr1_fdo     	(fsr1_fdo[ 2 : 0 ]),
  .fsr1_stcicfg 	({tcu_stcicfg[ 1 : 0 ], tcu_stcicfg[ 1 : 0 ], tcu_stcicfg[ 1 : 0 ]}),
  .fsr1_stciclk 	({tcu_stciclk, tcu_stciclk, tcu_stciclk}),
  .fsr1_stcid   	({fsr1_stciq[ 1 : 0 ],fsr0_stciq[ 2 ]}),
  .fsr1_stciq   	(fsr1_stciq[ 2 : 0 ]),
  .fsr1_testclkr	({mio_fsr_testclkr[ 1 ], mio_fsr_testclkr[ 1 ], mio_fsr_testclkr[ 1 ]}),
  .fsr1_testclkt	({mio_fsr_testclkt[ 1 ], mio_fsr_testclkt[ 1 ], mio_fsr_testclkt[ 1 ]}),
  .mcu1_fsr2_td0        (mcu1_fsr2_data[ 11 : 0 ]),
  .mcu1_fsr2_td1        (mcu1_fsr2_data[ 23 : 12 ]),
  .mcu1_fsr2_td2        (mcu1_fsr2_data[ 35 : 24 ]),
  .mcu1_fsr2_td3        (mcu1_fsr2_data[ 47 : 36 ]),
  .mcu1_fsr2_td4        (mcu1_fsr2_data[ 59 : 48 ]),
  .mcu1_fsr2_td6        (mcu1_fsr2_data[ 71 : 60 ]),
  .mcu1_fsr2_td7        (mcu1_fsr2_data[ 83 : 72 ]),
  .mcu1_fsr2_td8        (mcu1_fsr2_data[ 95 : 84 ]),
  .mcu1_fsr2_td9        (mcu1_fsr2_data[ 107 : 96 ]),
  .mcu1_fsr2_td5        (mcu1_fsr2_data[ 119 : 108 ]),
  .fsr2_mcu1_rd0        (fsr2_mcu1_data[ 11 : 0 ]),
  .fsr2_mcu1_rd1        (fsr2_mcu1_data[ 23 : 12 ]),
  .fsr2_mcu1_rd2        (fsr2_mcu1_data[ 35 : 24 ]),
  .fsr2_mcu1_rd3        (fsr2_mcu1_data[ 47 : 36 ]),
  .fsr2_mcu1_rd4        (fsr2_mcu1_data[ 59 : 48 ]),
  .fsr2_mcu1_rd5        (fsr2_mcu1_data[ 71 : 60 ]),
  .fsr2_mcu1_rd6        (fsr2_mcu1_data[ 83 : 72 ]),
  .fsr2_mcu1_rd7        (fsr2_mcu1_data[ 95 : 84 ]),
  .fsr2_mcu1_rd10       (fsr2_mcu1_data[ 107 : 96 ]),
  .fsr2_mcu1_rd11       (fsr2_mcu1_data[ 119 : 108 ]),
  .fsr2_mcu1_rd12       (fsr2_mcu1_data[ 131 : 120 ]),
  .fsr2_mcu1_rd13       (fsr2_mcu1_data[ 143 : 132 ]),
  .fsr2_mcu1_rd9        (fsr2_mcu1_data[ 155 : 144 ]),
  .fsr2_mcu1_rd8        (fsr2_mcu1_data[ 167 : 156 ]),
  .mcu1_fsr2_cfgpll0    ({mcu1_fsr23_cfgpll_lb[ 1 : 0 ], mcu1_fsr23_cfgpll_mpy[ 3 : 0 ], mcu1_fsr2_cfgpll_enpll}),
  .mcu1_fsr2_cfgpll1    ({mcu1_fsr23_cfgpll_lb[ 1 : 0 ], mcu1_fsr23_cfgpll_mpy[ 3 : 0 ], mcu1_fsr2_cfgpll_enpll}),
  .mcu1_fsr2_cfgpll2    ({mcu1_fsr23_cfgpll_lb[ 1 : 0 ], mcu1_fsr23_cfgpll_mpy[ 3 : 0 ], mcu1_fsr2_cfgpll_enpll}),
  .mcu1_fsr2_cfgrx0     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr2_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr2_cfgrx_invpair[ 0 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr2_cfgrx_entest, mcu1_fsr2_cfgrx_enrx}),
  .mcu1_fsr2_cfgrx1     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr2_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr2_cfgrx_invpair[ 1 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr2_cfgrx_entest, mcu1_fsr2_cfgrx_enrx}),
  .mcu1_fsr2_cfgrx2     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr2_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr2_cfgrx_invpair[ 2 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr2_cfgrx_entest, mcu1_fsr2_cfgrx_enrx}),
  .mcu1_fsr2_cfgrx3     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr2_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr2_cfgrx_invpair[ 3 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr2_cfgrx_entest, mcu1_fsr2_cfgrx_enrx}),
  .mcu1_fsr2_cfgrx4     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr2_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr2_cfgrx_invpair[ 4 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr2_cfgrx_entest, mcu1_fsr2_cfgrx_enrx}),
  .mcu1_fsr2_cfgrx5     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr2_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr2_cfgrx_invpair[ 5 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr2_cfgrx_entest, mcu1_fsr2_cfgrx_enrx}),
  .mcu1_fsr2_cfgrx6     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr2_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr2_cfgrx_invpair[ 6 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr2_cfgrx_entest, mcu1_fsr2_cfgrx_enrx}),
  .mcu1_fsr2_cfgrx7     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr2_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr2_cfgrx_invpair[ 7 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr2_cfgrx_entest, mcu1_fsr2_cfgrx_enrx}),
  .mcu1_fsr2_cfgrx10    ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr2_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr2_cfgrx_invpair[ 8 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr2_cfgrx_entest, mcu1_fsr2_cfgrx_enrx}),
  .mcu1_fsr2_cfgrx11    ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr2_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr2_cfgrx_invpair[ 9 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr2_cfgrx_entest, mcu1_fsr2_cfgrx_enrx}),
  .mcu1_fsr2_cfgrx12    ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr2_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr2_cfgrx_invpair[ 10 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr2_cfgrx_entest, mcu1_fsr2_cfgrx_enrx}),
  .mcu1_fsr2_cfgrx13    ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr2_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr2_cfgrx_invpair[ 11 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr2_cfgrx_entest, mcu1_fsr2_cfgrx_enrx}),
  .mcu1_fsr2_cfgrx9     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr2_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr2_cfgrx_invpair[ 12 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr2_cfgrx_entest, mcu1_fsr2_cfgrx_enrx}),
  .mcu1_fsr2_cfgrx8     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr2_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr2_cfgrx_invpair[ 13 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr2_cfgrx_entest, mcu1_fsr2_cfgrx_enrx}),
  .mcu1_fsr2_cfgtx0     ({mcu1_fsr2_cfgtx_enidl, mcu1_fsr2_cfgtx_bstx[ 0 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr2_cfgtx_invpair[ 0 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr2_cfgtx_entest, 
			  mcu1_fsr2_cfgtx_entx}),
  .mcu1_fsr2_cfgtx1     ({mcu1_fsr2_cfgtx_enidl, mcu1_fsr2_cfgtx_bstx[ 1 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr2_cfgtx_invpair[ 1 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr2_cfgtx_entest, 
			  mcu1_fsr2_cfgtx_entx}),
  .mcu1_fsr2_cfgtx2     ({mcu1_fsr2_cfgtx_enidl, mcu1_fsr2_cfgtx_bstx[ 2 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr2_cfgtx_invpair[ 2 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr2_cfgtx_entest, 
			  mcu1_fsr2_cfgtx_entx}),
  .mcu1_fsr2_cfgtx3     ({mcu1_fsr2_cfgtx_enidl, mcu1_fsr2_cfgtx_bstx[ 3 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr2_cfgtx_invpair[ 3 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr2_cfgtx_entest, 
			  mcu1_fsr2_cfgtx_entx}),
  .mcu1_fsr2_cfgtx4     ({mcu1_fsr2_cfgtx_enidl, mcu1_fsr2_cfgtx_bstx[ 4 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr2_cfgtx_invpair[ 4 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr2_cfgtx_entest, 
			  mcu1_fsr2_cfgtx_entx}),
  .mcu1_fsr2_cfgtx6     ({mcu1_fsr2_cfgtx_enidl, mcu1_fsr2_cfgtx_bstx[ 5 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr2_cfgtx_invpair[ 5 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr2_cfgtx_entest, 
			  mcu1_fsr2_cfgtx_entx}),
  .mcu1_fsr2_cfgtx7     ({mcu1_fsr2_cfgtx_enidl, mcu1_fsr2_cfgtx_bstx[ 6 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr2_cfgtx_invpair[ 6 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr2_cfgtx_entest, 
			  mcu1_fsr2_cfgtx_entx}),
  .mcu1_fsr2_cfgtx8     ({mcu1_fsr2_cfgtx_enidl, mcu1_fsr2_cfgtx_bstx[ 7 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr2_cfgtx_invpair[ 7 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr2_cfgtx_entest, 
			  mcu1_fsr2_cfgtx_entx}),
  .mcu1_fsr2_cfgtx9     ({mcu1_fsr2_cfgtx_enidl, mcu1_fsr2_cfgtx_bstx[ 8 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr2_cfgtx_invpair[ 8 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr2_cfgtx_entest, 
			  mcu1_fsr2_cfgtx_entx}),
  .mcu1_fsr2_cfgtx5     ({mcu1_fsr2_cfgtx_enidl, mcu1_fsr2_cfgtx_bstx[ 9 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr2_cfgtx_invpair[ 9 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr2_cfgtx_entest, 
			  mcu1_fsr2_cfgtx_entx}),
  .mcu1_fsr2_testcfg0   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu1_fsr2_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu1_fsr2_testcfg[ 7 : 0 ]}),
  .mcu1_fsr2_testcfg1   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu1_fsr2_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu1_fsr2_testcfg[ 7 : 0 ]}),
  .mcu1_fsr2_testcfg2   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu1_fsr2_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu1_fsr2_testcfg[ 7 : 0 ]}),
  .fsr2_txbclkin	({dr_gclk_c4_fsr2_2,dr_gclk_c4_fsr2_1,dr_gclk_c4_fsr2_0}),
  .fsr2_mcu1_rxbclk  	({fsr2_mcu1_rxbclk[ 11 : 8 ],fsr2_mcu1_rxbclk[ 12 ],fsr2_mcu1_rxbclk[ 13 ],fsr2_mcu1_rxbclk[ 7 : 0 ]}),
  .fsr2_rxbclkin	({fsr2_mcu1_rxbclk[ 11 : 8 ],fsr2_mcu1_rxbclk[ 12 ],fsr2_mcu1_rxbclk[ 13 ],fsr2_mcu1_rxbclk[ 7 : 0 ]}),
  .fsr2_bsinitclk	({tcu_sbs_bsinitclk, tcu_sbs_bsinitclk, tcu_sbs_bsinitclk}),
  .fsr2_fclk    	({efu_mcu_fclk, efu_mcu_fclk, efu_mcu_fclk}),
  .fsr2_fclrz   	({efu_mcu_fclrz, efu_mcu_fclrz, efu_mcu_fclrz}),
  .fsr2_fdi     	({fsr1_fdo[ 0 ],fsr2_fdo[ 2 : 1 ]}),
  .fsr2_fdo     	(fsr2_fdo[ 2 : 0 ]),
  .fsr2_stcicfg 	({tcu_stcicfg[ 1 : 0 ], tcu_stcicfg[ 1 : 0 ], tcu_stcicfg[ 1 : 0 ]}),
  .fsr2_stciclk 	({tcu_stciclk, tcu_stciclk, tcu_stciclk}),
  .fsr2_stcid   	({fsr2_stciq[ 1 : 0 ],fsr1_stciq[ 2 ]}),
  .fsr2_stciq   	(fsr2_stciq[ 2 : 0 ]),
  .fsr2_testclkr	({mio_fsr_testclkr[ 2 ], mio_fsr_testclkr[ 2 ], mio_fsr_testclkr[ 2 ]}),
  .fsr2_testclkt	({mio_fsr_testclkt[ 2 ], mio_fsr_testclkt[ 2 ], mio_fsr_testclkt[ 2 ]}),
  .mcu1_fsr3_td0        (mcu1_fsr3_data[ 11 : 0 ]),
  .mcu1_fsr3_td1        (mcu1_fsr3_data[ 23 : 12 ]),
  .mcu1_fsr3_td2        (mcu1_fsr3_data[ 35 : 24 ]),
  .mcu1_fsr3_td3        (mcu1_fsr3_data[ 47 : 36 ]),
  .mcu1_fsr3_td4        (mcu1_fsr3_data[ 59 : 48 ]),
  .mcu1_fsr3_td6        (mcu1_fsr3_data[ 71 : 60 ]),
  .mcu1_fsr3_td7        (mcu1_fsr3_data[ 83 : 72 ]),
  .mcu1_fsr3_td8        (mcu1_fsr3_data[ 95 : 84 ]),
  .mcu1_fsr3_td9        (mcu1_fsr3_data[ 107 : 96 ]),
  .mcu1_fsr3_td5        (mcu1_fsr3_data[ 119 : 108 ]),
  .fsr3_mcu1_rd0        (fsr3_mcu1_data[ 11 : 0 ]),
  .fsr3_mcu1_rd1        (fsr3_mcu1_data[ 23 : 12 ]),
  .fsr3_mcu1_rd2        (fsr3_mcu1_data[ 35 : 24 ]),
  .fsr3_mcu1_rd3        (fsr3_mcu1_data[ 47 : 36 ]),
  .fsr3_mcu1_rd4        (fsr3_mcu1_data[ 59 : 48 ]),
  .fsr3_mcu1_rd5        (fsr3_mcu1_data[ 71 : 60 ]),
  .fsr3_mcu1_rd6        (fsr3_mcu1_data[ 83 : 72 ]),
  .fsr3_mcu1_rd7        (fsr3_mcu1_data[ 95 : 84 ]),
  .fsr3_mcu1_rd10       (fsr3_mcu1_data[ 107 : 96 ]),
  .fsr3_mcu1_rd11       (fsr3_mcu1_data[ 119 : 108 ]),
  .fsr3_mcu1_rd12       (fsr3_mcu1_data[ 131 : 120 ]),
  .fsr3_mcu1_rd13       (fsr3_mcu1_data[ 143 : 132 ]),
  .fsr3_mcu1_rd9        (fsr3_mcu1_data[ 155 : 144 ]),
  .fsr3_mcu1_rd8        (fsr3_mcu1_data[ 167 : 156 ]),
  .mcu1_fsr3_cfgpll0    ({mcu1_fsr23_cfgpll_lb[ 1 : 0 ], mcu1_fsr23_cfgpll_mpy[ 3 : 0 ], mcu1_fsr3_cfgpll_enpll}),
  .mcu1_fsr3_cfgpll1    ({mcu1_fsr23_cfgpll_lb[ 1 : 0 ], mcu1_fsr23_cfgpll_mpy[ 3 : 0 ], mcu1_fsr3_cfgpll_enpll}),
  .mcu1_fsr3_cfgpll2    ({mcu1_fsr23_cfgpll_lb[ 1 : 0 ], mcu1_fsr23_cfgpll_mpy[ 3 : 0 ], mcu1_fsr3_cfgpll_enpll}),
  .mcu1_fsr3_cfgrx0     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr3_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr3_cfgrx_invpair[ 0 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr3_cfgrx_entest, mcu1_fsr3_cfgrx_enrx}),
  .mcu1_fsr3_cfgrx1     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr3_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr3_cfgrx_invpair[ 1 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr3_cfgrx_entest, mcu1_fsr3_cfgrx_enrx}),
  .mcu1_fsr3_cfgrx2     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr3_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr3_cfgrx_invpair[ 2 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr3_cfgrx_entest, mcu1_fsr3_cfgrx_enrx}),
  .mcu1_fsr3_cfgrx3     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr3_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr3_cfgrx_invpair[ 3 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr3_cfgrx_entest, mcu1_fsr3_cfgrx_enrx}),
  .mcu1_fsr3_cfgrx4     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr3_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr3_cfgrx_invpair[ 4 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr3_cfgrx_entest, mcu1_fsr3_cfgrx_enrx}),
  .mcu1_fsr3_cfgrx5     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr3_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr3_cfgrx_invpair[ 5 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr3_cfgrx_entest, mcu1_fsr3_cfgrx_enrx}),
  .mcu1_fsr3_cfgrx6     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr3_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr3_cfgrx_invpair[ 6 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr3_cfgrx_entest, mcu1_fsr3_cfgrx_enrx}),
  .mcu1_fsr3_cfgrx7     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr3_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr3_cfgrx_invpair[ 7 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr3_cfgrx_entest, mcu1_fsr3_cfgrx_enrx}),
  .mcu1_fsr3_cfgrx10    ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr3_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr3_cfgrx_invpair[ 8 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr3_cfgrx_entest, mcu1_fsr3_cfgrx_enrx}),
  .mcu1_fsr3_cfgrx11    ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr3_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr3_cfgrx_invpair[ 9 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr3_cfgrx_entest, mcu1_fsr3_cfgrx_enrx}),
  .mcu1_fsr3_cfgrx12    ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr3_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr3_cfgrx_invpair[ 10 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr3_cfgrx_entest, mcu1_fsr3_cfgrx_enrx}),
  .mcu1_fsr3_cfgrx13    ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr3_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr3_cfgrx_invpair[ 11 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr3_cfgrx_entest, mcu1_fsr3_cfgrx_enrx}),
  .mcu1_fsr3_cfgrx9     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr3_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr3_cfgrx_invpair[ 12 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr3_cfgrx_entest, mcu1_fsr3_cfgrx_enrx}),
  .mcu1_fsr3_cfgrx8     ({1'b0, 1'b0, mcu1_fsr23_cfgrx_eq[ 3 : 0 ], 
			  mcu1_fsr23_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu1_fsr3_cfgrx_align, 
			  mcu1_fsr23_cfgrx_term[ 2 : 0 ], mcu1_fsr3_cfgrx_invpair[ 13 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], 
			  mcu1_fsr3_cfgrx_entest, mcu1_fsr3_cfgrx_enrx}),
  .mcu1_fsr3_cfgtx0     ({mcu1_fsr3_cfgtx_enidl, mcu1_fsr3_cfgtx_bstx[ 0 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr3_cfgtx_invpair[ 0 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr3_cfgtx_entest, 
			  mcu1_fsr3_cfgtx_entx}),
  .mcu1_fsr3_cfgtx1     ({mcu1_fsr3_cfgtx_enidl, mcu1_fsr3_cfgtx_bstx[ 1 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr3_cfgtx_invpair[ 1 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr3_cfgtx_entest, 
			  mcu1_fsr3_cfgtx_entx}),
  .mcu1_fsr3_cfgtx2     ({mcu1_fsr3_cfgtx_enidl, mcu1_fsr3_cfgtx_bstx[ 2 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr3_cfgtx_invpair[ 2 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr3_cfgtx_entest, 
			  mcu1_fsr3_cfgtx_entx}),
  .mcu1_fsr3_cfgtx3     ({mcu1_fsr3_cfgtx_enidl, mcu1_fsr3_cfgtx_bstx[ 3 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr3_cfgtx_invpair[ 3 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr3_cfgtx_entest, 
			  mcu1_fsr3_cfgtx_entx}),
  .mcu1_fsr3_cfgtx4     ({mcu1_fsr3_cfgtx_enidl, mcu1_fsr3_cfgtx_bstx[ 4 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr3_cfgtx_invpair[ 4 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr3_cfgtx_entest, 
			  mcu1_fsr3_cfgtx_entx}),
  .mcu1_fsr3_cfgtx6     ({mcu1_fsr3_cfgtx_enidl, mcu1_fsr3_cfgtx_bstx[ 5 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr3_cfgtx_invpair[ 5 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr3_cfgtx_entest, 
			  mcu1_fsr3_cfgtx_entx}),
  .mcu1_fsr3_cfgtx7     ({mcu1_fsr3_cfgtx_enidl, mcu1_fsr3_cfgtx_bstx[ 6 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr3_cfgtx_invpair[ 6 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr3_cfgtx_entest, 
			  mcu1_fsr3_cfgtx_entx}),
  .mcu1_fsr3_cfgtx8     ({mcu1_fsr3_cfgtx_enidl, mcu1_fsr3_cfgtx_bstx[ 7 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr3_cfgtx_invpair[ 7 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr3_cfgtx_entest, 
			  mcu1_fsr3_cfgtx_entx}),
  .mcu1_fsr3_cfgtx9     ({mcu1_fsr3_cfgtx_enidl, mcu1_fsr3_cfgtx_bstx[ 8 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr3_cfgtx_invpair[ 8 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr3_cfgtx_entest, 
			  mcu1_fsr3_cfgtx_entx}),
  .mcu1_fsr3_cfgtx5     ({mcu1_fsr3_cfgtx_enidl, mcu1_fsr3_cfgtx_bstx[ 9 ], mcu1_fsr23_cfgtx_enftp, 
		  	  mcu1_fsr23_cfgtx_de[ 3 : 0 ], mcu1_fsr23_cfgtx_swing[ 2 : 0 ], mcu1_fsr23_cfgtx_cm, 
		  	  mcu1_fsr3_cfgtx_invpair[ 9 ], mcu1_fsr23_cfgrtx_rate[ 1 : 0 ], mcu1_fsr3_cfgtx_entest, 
			  mcu1_fsr3_cfgtx_entx}),
  .mcu1_fsr3_testcfg0   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu1_fsr3_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu1_fsr3_testcfg[ 7 : 0 ]}),
  .mcu1_fsr3_testcfg1   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu1_fsr3_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu1_fsr3_testcfg[ 7 : 0 ]}),
  .mcu1_fsr3_testcfg2   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu1_fsr3_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu1_fsr3_testcfg[ 7 : 0 ]}),
  .fsr3_txbclkin	({dr_gclk_c4_fsr3_2,dr_gclk_c4_fsr3_1,dr_gclk_c4_fsr3_0}),
  .fsr3_mcu1_rxbclk  	({fsr3_mcu1_rxbclk[ 11 : 8 ],fsr3_mcu1_rxbclk[ 12 ],fsr3_mcu1_rxbclk[ 13 ],fsr3_mcu1_rxbclk[ 7 : 0 ]}),
  .fsr3_rxbclkin	({fsr3_mcu1_rxbclk[ 11 : 8 ],fsr3_mcu1_rxbclk[ 12 ],fsr3_mcu1_rxbclk[ 13 ],fsr3_mcu1_rxbclk[ 7 : 0 ]}),
  .fsr3_bsinitclk	({tcu_sbs_bsinitclk, tcu_sbs_bsinitclk, tcu_sbs_bsinitclk}),
  .fsr3_fclk    	({efu_mcu_fclk, efu_mcu_fclk, efu_mcu_fclk}),
  .fsr3_fclrz   	({efu_mcu_fclrz, efu_mcu_fclrz, efu_mcu_fclrz}),
  .fsr3_fdi     	({fsr2_fdo[ 0 ],fsr3_fdo[ 2 : 1 ]}),
  .fsr3_fdo     	(fsr3_fdo[ 2 : 0 ]),
  .fsr3_stcicfg 	({tcu_stcicfg[ 1 : 0 ], tcu_stcicfg[ 1 : 0 ], tcu_stcicfg[ 1 : 0 ]}),
  .fsr3_stciclk 	({tcu_stciclk, tcu_stciclk, tcu_stciclk}),
  .fsr3_stcid   	({fsr3_stciq[ 1 : 0 ],fsr2_stciq[ 2 ]}),
  .fsr3_stciq   	(fsr3_stciq[ 2 : 0 ]),
  .fsr3_testclkr	({mio_fsr_testclkr[ 3 ], mio_fsr_testclkr[ 3 ], mio_fsr_testclkr[ 3 ]}),
  .fsr3_testclkt	({mio_fsr_testclkt[ 3 ], mio_fsr_testclkt[ 3 ], mio_fsr_testclkt[ 3 ]}),
  .fsr_left_atpgd       (tcu_srd_atpgd),
  .fsr_left_atpgq       (fsr_left_atpgq),
  .VDDA                 (VDDA_FSRL),
  .VDDD                 (VDDD_FSRL),
  .VDDR                 (VDDR_FSRL),
  .VDDT                 (VDDT_FSRL),
  .VSSA                 (VSSA_FSRL),
  .fsr0_mcu0_ststx_testfail(fsr0_mcu0_ststx_testfail[9:0]),
  .fsr0_mcu0_stspll_lock(fsr0_mcu0_stspll_lock[2:0]),
  .fsr0_mcu0_stsrx_testfail(fsr0_mcu0_stsrx_testfail[13:0]),
  .fsr0_mcu0_stsrx_sync(fsr0_mcu0_stsrx_sync[13:0]),
  .fsr0_mcu0_stsrx_losdtct(fsr0_mcu0_stsrx_losdtct[13:0]),
  .fsr0_mcu0_stsrx_bsrxp(fsr0_mcu0_stsrx_bsrxp[13:0]),
  .fsr0_mcu0_stsrx_bsrxn(fsr0_mcu0_stsrx_bsrxn[13:0]),
  .FBDIMM0A_AMUX(FBDIMM0A_AMUX[2:0]),
  .fsr1_mcu0_ststx_testfail(fsr1_mcu0_ststx_testfail[9:0]),
  .fsr1_mcu0_stspll_lock(fsr1_mcu0_stspll_lock[2:0]),
  .fsr1_mcu0_stsrx_testfail(fsr1_mcu0_stsrx_testfail[13:0]),
  .fsr1_mcu0_stsrx_sync(fsr1_mcu0_stsrx_sync[13:0]),
  .fsr1_mcu0_stsrx_losdtct(fsr1_mcu0_stsrx_losdtct[13:0]),
  .fsr1_mcu0_stsrx_bsrxp(fsr1_mcu0_stsrx_bsrxp[13:0]),
  .fsr1_mcu0_stsrx_bsrxn(fsr1_mcu0_stsrx_bsrxn[13:0]),
  .FBDIMM0B_AMUX(FBDIMM0B_AMUX[2:0]),
  .fsr2_mcu1_ststx_testfail(fsr2_mcu1_ststx_testfail[9:0]),
  .fsr2_mcu1_stspll_lock(fsr2_mcu1_stspll_lock[2:0]),
  .fsr2_mcu1_stsrx_testfail(fsr2_mcu1_stsrx_testfail[13:0]),
  .fsr2_mcu1_stsrx_sync(fsr2_mcu1_stsrx_sync[13:0]),
  .fsr2_mcu1_stsrx_losdtct(fsr2_mcu1_stsrx_losdtct[13:0]),
  .fsr2_mcu1_stsrx_bsrxp(fsr2_mcu1_stsrx_bsrxp[13:0]),
  .fsr2_mcu1_stsrx_bsrxn(fsr2_mcu1_stsrx_bsrxn[13:0]),
  .FBDIMM1A_AMUX(FBDIMM1A_AMUX[2:0]),
  .fsr3_mcu1_ststx_testfail(fsr3_mcu1_ststx_testfail[9:0]),
  .fsr3_mcu1_stspll_lock(fsr3_mcu1_stspll_lock[2:0]),
  .fsr3_mcu1_stsrx_testfail(fsr3_mcu1_stsrx_testfail[13:0]),
  .fsr3_mcu1_stsrx_sync(fsr3_mcu1_stsrx_sync[13:0]),
  .fsr3_mcu1_stsrx_losdtct(fsr3_mcu1_stsrx_losdtct[13:0]),
  .fsr3_mcu1_stsrx_bsrxp(fsr3_mcu1_stsrx_bsrxp[13:0]),
  .fsr3_mcu1_stsrx_bsrxn(fsr3_mcu1_stsrx_bsrxn[13:0]),
  .FBDIMM1B_AMUX(FBDIMM1B_AMUX[2:0]),
  .FBDIMM1_REFCLK_N(FBDIMM1_REFCLK_N),
  .FBDIMM1_REFCLK_P(FBDIMM1_REFCLK_P)
         );
`endif  // OPENSPARC_CMP

//________________________________________________________________

// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
fsr_right fsr_right (
  .FBDIMM2A_RX_P        ({FBDIMM2A_RX_P[ 0 ], FBDIMM2A_RX_P[ 1 ], FBDIMM2A_RX_P[ 2 ], FBDIMM2A_RX_P[ 3 ],
			  FBDIMM2A_RX_P[ 13 : 12 ], FBDIMM2A_RX_P[ 4 ], FBDIMM2A_RX_P[ 5 ], FBDIMM2A_RX_P[ 6 ],
			  FBDIMM2A_RX_P[ 7 ], FBDIMM2A_RX_P[ 8 ], FBDIMM2A_RX_P[ 9 ], FBDIMM2A_RX_P[ 10 ],
			  FBDIMM2A_RX_P[ 11 ]}),
  .FBDIMM2A_RX_N        ({FBDIMM2A_RX_N[ 0 ], FBDIMM2A_RX_N[ 1 ], FBDIMM2A_RX_N[ 2 ], FBDIMM2A_RX_N[ 3 ],
			  FBDIMM2A_RX_N[ 13 : 12 ], FBDIMM2A_RX_N[ 4 ], FBDIMM2A_RX_N[ 5 ], FBDIMM2A_RX_N[ 6 ],
			  FBDIMM2A_RX_N[ 7 ], FBDIMM2A_RX_N[ 8 ], FBDIMM2A_RX_N[ 9 ], FBDIMM2A_RX_N[ 10 ],
			  FBDIMM2A_RX_N[ 11 ]}),
  .FBDIMM2A_TX_P        ({FBDIMM2A_TX_P[ 0 ], FBDIMM2A_TX_P[ 1 ], FBDIMM2A_TX_P[ 2 ], FBDIMM2A_TX_P[ 3 ],
			  FBDIMM2A_TX_P[ 4 ], FBDIMM2A_TX_P[ 9 ], FBDIMM2A_TX_P[ 5 ], FBDIMM2A_TX_P[ 6 ],
			  FBDIMM2A_TX_P[ 7 ], FBDIMM2A_TX_P[ 8 ]}),
  .FBDIMM2A_TX_N        ({FBDIMM2A_TX_N[ 0 ], FBDIMM2A_TX_N[ 1 ], FBDIMM2A_TX_N[ 2 ], FBDIMM2A_TX_N[ 3 ],
			  FBDIMM2A_TX_N[ 4 ], FBDIMM2A_TX_N[ 9 ], FBDIMM2A_TX_N[ 5 ], FBDIMM2A_TX_N[ 6 ],
			  FBDIMM2A_TX_N[ 7 ], FBDIMM2A_TX_N[ 8 ]}),
  .FBDIMM2B_RX_P        ({FBDIMM2B_RX_P[ 0 ], FBDIMM2B_RX_P[ 1 ], FBDIMM2B_RX_P[ 2 ], FBDIMM2B_RX_P[ 3 ],
			  FBDIMM2B_RX_P[ 13 : 12 ], FBDIMM2B_RX_P[ 4 ], FBDIMM2B_RX_P[ 5 ], FBDIMM2B_RX_P[ 6 ],
			  FBDIMM2B_RX_P[ 7 ],FBDIMM2B_RX_P[ 8 ],FBDIMM2B_RX_P[ 9 ],FBDIMM2B_RX_P[ 10 ],
			  FBDIMM2B_RX_P[ 11 ]}),
  .FBDIMM2B_RX_N        ({FBDIMM2B_RX_N[ 0 ], FBDIMM2B_RX_N[ 1 ], FBDIMM2B_RX_N[ 2 ], FBDIMM2B_RX_N[ 3 ],
			  FBDIMM2B_RX_N[ 13 : 12 ], FBDIMM2B_RX_N[ 4 ], FBDIMM2B_RX_N[ 5 ], FBDIMM2B_RX_N[ 6 ],
			  FBDIMM2B_RX_N[ 7 ],FBDIMM2B_RX_N[ 8 ],FBDIMM2B_RX_N[ 9 ],FBDIMM2B_RX_N[ 10 ],
			  FBDIMM2B_RX_N[ 11 ]}),
  .FBDIMM2B_TX_P        ({FBDIMM2B_TX_P[ 0 ], FBDIMM2B_TX_P[ 1 ], FBDIMM2B_TX_P[ 2 ], FBDIMM2B_TX_P[ 3 ],
			  FBDIMM2B_TX_P[ 4 ], FBDIMM2B_TX_P[ 9 ], FBDIMM2B_TX_P[ 5 ], FBDIMM2B_TX_P[ 6 ],
			  FBDIMM2B_TX_P[ 7 ], FBDIMM2B_TX_P[ 8 ]}),
  .FBDIMM2B_TX_N        ({FBDIMM2B_TX_N[ 0 ], FBDIMM2B_TX_N[ 1 ], FBDIMM2B_TX_N[ 2 ], FBDIMM2B_TX_N[ 3 ],
			  FBDIMM2B_TX_N[ 4 ], FBDIMM2B_TX_N[ 9 ], FBDIMM2B_TX_N[ 5 ], FBDIMM2B_TX_N[ 6 ],
			  FBDIMM2B_TX_N[ 7 ], FBDIMM2B_TX_N[ 8 ]}),
  .FBDIMM3A_RX_P        ({FBDIMM3A_RX_P[ 0 ], FBDIMM3A_RX_P[ 1 ], FBDIMM3A_RX_P[ 2 ], FBDIMM3A_RX_P[ 3 ],
			  FBDIMM3A_RX_P[ 13 : 12 ], FBDIMM3A_RX_P[ 4 ], FBDIMM3A_RX_P[ 5 ], FBDIMM3A_RX_P[ 6 ],
			  FBDIMM3A_RX_P[ 7 ],FBDIMM3A_RX_P[ 8 ],FBDIMM3A_RX_P[ 9 ],FBDIMM3A_RX_P[ 10 ],
			  FBDIMM3A_RX_P[ 11 ]}),
  .FBDIMM3A_RX_N        ({FBDIMM3A_RX_N[ 0 ], FBDIMM3A_RX_N[ 1 ], FBDIMM3A_RX_N[ 2 ], FBDIMM3A_RX_N[ 3 ],
			  FBDIMM3A_RX_N[ 13 : 12 ], FBDIMM3A_RX_N[ 4 ], FBDIMM3A_RX_N[ 5 ], FBDIMM3A_RX_N[ 6 ],
			  FBDIMM3A_RX_N[ 7 ],FBDIMM3A_RX_N[ 8 ],FBDIMM3A_RX_N[ 9 ],FBDIMM3A_RX_N[ 10 ],
			  FBDIMM3A_RX_N[ 11 ]}),
  .FBDIMM3A_TX_P        ({FBDIMM3A_TX_P[ 0 ], FBDIMM3A_TX_P[ 1 ], FBDIMM3A_TX_P[ 2 ], FBDIMM3A_TX_P[ 3 ],
			  FBDIMM3A_TX_P[ 4 ], FBDIMM3A_TX_P[ 9 ], FBDIMM3A_TX_P[ 5 ], FBDIMM3A_TX_P[ 6 ],
			  FBDIMM3A_TX_P[ 7 ], FBDIMM3A_TX_P[ 8 ]}),
  .FBDIMM3A_TX_N        ({FBDIMM3A_TX_N[ 0 ], FBDIMM3A_TX_N[ 1 ], FBDIMM3A_TX_N[ 2 ], FBDIMM3A_TX_N[ 3 ],
			  FBDIMM3A_TX_N[ 4 ], FBDIMM3A_TX_N[ 9 ], FBDIMM3A_TX_N[ 5 ], FBDIMM3A_TX_N[ 6 ],
			  FBDIMM3A_TX_N[ 7 ], FBDIMM3A_TX_N[ 8 ]}),
  .mcu2_fsr4_td9        (mcu2_fsr4_data[ 11 : 0 ]),
  .mcu2_fsr4_td8        (mcu2_fsr4_data[ 23 : 12 ]),
  .mcu2_fsr4_td7        (mcu2_fsr4_data[ 35 : 24 ]),
  .mcu2_fsr4_td6        (mcu2_fsr4_data[ 47 : 36 ]),
  .mcu2_fsr4_td5        (mcu2_fsr4_data[ 59 : 48 ]),
  .mcu2_fsr4_td3        (mcu2_fsr4_data[ 71 : 60 ]),
  .mcu2_fsr4_td2        (mcu2_fsr4_data[ 83 : 72 ]),
  .mcu2_fsr4_td1        (mcu2_fsr4_data[ 95 : 84 ]),
  .mcu2_fsr4_td0        (mcu2_fsr4_data[ 107 : 96 ]),
  .mcu2_fsr4_td4        (mcu2_fsr4_data[ 119 : 108 ]),
  .fsr4_mcu2_rd13       (fsr4_mcu2_data[ 11 : 0 ]),
  .fsr4_mcu2_rd12       (fsr4_mcu2_data[ 23 : 12 ]),
  .fsr4_mcu2_rd11       (fsr4_mcu2_data[ 35 : 24 ]),
  .fsr4_mcu2_rd10       (fsr4_mcu2_data[ 47 : 36 ]),
  .fsr4_mcu2_rd7        (fsr4_mcu2_data[ 59 : 48 ]),
  .fsr4_mcu2_rd6        (fsr4_mcu2_data[ 71 : 60 ]),
  .fsr4_mcu2_rd5        (fsr4_mcu2_data[ 83 : 72 ]),
  .fsr4_mcu2_rd4        (fsr4_mcu2_data[ 95 : 84 ]),
  .fsr4_mcu2_rd3        (fsr4_mcu2_data[ 107 : 96 ]),
  .fsr4_mcu2_rd2        (fsr4_mcu2_data[ 119 : 108 ]),
  .fsr4_mcu2_rd1        (fsr4_mcu2_data[ 131 : 120 ]),
  .fsr4_mcu2_rd0        (fsr4_mcu2_data[ 143 : 132 ]),
  .fsr4_mcu2_rd8        (fsr4_mcu2_data[ 155 : 144 ]),
  .fsr4_mcu2_rd9        (fsr4_mcu2_data[ 167 : 156 ]),
  .mcu2_fsr4_cfgpll0    ({mcu2_fsr45_cfgpll_lb[ 1 : 0 ], mcu2_fsr45_cfgpll_mpy[ 3 : 0 ], mcu2_fsr4_cfgpll_enpll}),
  .mcu2_fsr4_cfgpll1    ({mcu2_fsr45_cfgpll_lb[ 1 : 0 ], mcu2_fsr45_cfgpll_mpy[ 3 : 0 ], mcu2_fsr4_cfgpll_enpll}),
  .mcu2_fsr4_cfgpll2    ({mcu2_fsr45_cfgpll_lb[ 1 : 0 ], mcu2_fsr45_cfgpll_mpy[ 3 : 0 ], mcu2_fsr4_cfgpll_enpll}),
  .mcu2_fsr4_cfgrx13    ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr4_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr4_cfgrx_invpair[ 0 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr4_cfgrx_entest, mcu2_fsr4_cfgrx_enrx}),
  .mcu2_fsr4_cfgrx12    ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr4_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr4_cfgrx_invpair[ 1 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr4_cfgrx_entest, mcu2_fsr4_cfgrx_enrx}),
  .mcu2_fsr4_cfgrx11    ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr4_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr4_cfgrx_invpair[ 2 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr4_cfgrx_entest, mcu2_fsr4_cfgrx_enrx}),
  .mcu2_fsr4_cfgrx10    ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr4_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr4_cfgrx_invpair[ 3 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr4_cfgrx_entest, mcu2_fsr4_cfgrx_enrx}),
  .mcu2_fsr4_cfgrx7     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr4_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr4_cfgrx_invpair[ 4 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr4_cfgrx_entest, mcu2_fsr4_cfgrx_enrx}),
  .mcu2_fsr4_cfgrx6     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr4_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr4_cfgrx_invpair[ 5 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr4_cfgrx_entest, mcu2_fsr4_cfgrx_enrx}),
  .mcu2_fsr4_cfgrx5     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr4_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr4_cfgrx_invpair[ 6 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr4_cfgrx_entest, mcu2_fsr4_cfgrx_enrx}),
  .mcu2_fsr4_cfgrx4     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr4_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr4_cfgrx_invpair[ 7 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr4_cfgrx_entest, mcu2_fsr4_cfgrx_enrx}),
  .mcu2_fsr4_cfgrx3     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr4_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr4_cfgrx_invpair[ 8 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr4_cfgrx_entest, mcu2_fsr4_cfgrx_enrx}),
  .mcu2_fsr4_cfgrx2     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr4_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr4_cfgrx_invpair[ 9 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr4_cfgrx_entest, mcu2_fsr4_cfgrx_enrx}),
  .mcu2_fsr4_cfgrx1     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr4_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr4_cfgrx_invpair[ 10 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr4_cfgrx_entest, mcu2_fsr4_cfgrx_enrx}),
  .mcu2_fsr4_cfgrx0     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr4_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr4_cfgrx_invpair[ 11 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr4_cfgrx_entest, mcu2_fsr4_cfgrx_enrx}),
  .mcu2_fsr4_cfgrx8     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr4_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr4_cfgrx_invpair[ 12 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr4_cfgrx_entest, mcu2_fsr4_cfgrx_enrx}),
  .mcu2_fsr4_cfgrx9     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr4_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr4_cfgrx_invpair[ 13 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr4_cfgrx_entest, mcu2_fsr4_cfgrx_enrx}),
  .mcu2_fsr4_cfgtx9     ({mcu2_fsr4_cfgtx_enidl, mcu2_fsr4_cfgtx_bstx[ 0 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr4_cfgtx_invpair[ 0 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr4_cfgtx_entest, 
			  mcu2_fsr4_cfgtx_entx}),
  .mcu2_fsr4_cfgtx8     ({mcu2_fsr4_cfgtx_enidl, mcu2_fsr4_cfgtx_bstx[ 1 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr4_cfgtx_invpair[ 1 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr4_cfgtx_entest, 
			  mcu2_fsr4_cfgtx_entx}),
  .mcu2_fsr4_cfgtx7     ({mcu2_fsr4_cfgtx_enidl, mcu2_fsr4_cfgtx_bstx[ 2 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr4_cfgtx_invpair[ 2 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr4_cfgtx_entest, 
			  mcu2_fsr4_cfgtx_entx}),
  .mcu2_fsr4_cfgtx6     ({mcu2_fsr4_cfgtx_enidl, mcu2_fsr4_cfgtx_bstx[ 3 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr4_cfgtx_invpair[ 3 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr4_cfgtx_entest, 
			  mcu2_fsr4_cfgtx_entx}),
  .mcu2_fsr4_cfgtx5     ({mcu2_fsr4_cfgtx_enidl, mcu2_fsr4_cfgtx_bstx[ 4 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr4_cfgtx_invpair[ 4 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr4_cfgtx_entest, 
			  mcu2_fsr4_cfgtx_entx}),
  .mcu2_fsr4_cfgtx3     ({mcu2_fsr4_cfgtx_enidl, mcu2_fsr4_cfgtx_bstx[ 5 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr4_cfgtx_invpair[ 5 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr4_cfgtx_entest, 
			  mcu2_fsr4_cfgtx_entx}),
  .mcu2_fsr4_cfgtx2     ({mcu2_fsr4_cfgtx_enidl, mcu2_fsr4_cfgtx_bstx[ 6 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr4_cfgtx_invpair[ 6 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr4_cfgtx_entest, 
			  mcu2_fsr4_cfgtx_entx}),
  .mcu2_fsr4_cfgtx1     ({mcu2_fsr4_cfgtx_enidl, mcu2_fsr4_cfgtx_bstx[ 7 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr4_cfgtx_invpair[ 7 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr4_cfgtx_entest, 
			  mcu2_fsr4_cfgtx_entx}),
  .mcu2_fsr4_cfgtx0     ({mcu2_fsr4_cfgtx_enidl, mcu2_fsr4_cfgtx_bstx[ 8 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr4_cfgtx_invpair[ 8 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr4_cfgtx_entest, 
			  mcu2_fsr4_cfgtx_entx}),
  .mcu2_fsr4_cfgtx4     ({mcu2_fsr4_cfgtx_enidl, mcu2_fsr4_cfgtx_bstx[ 9 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr4_cfgtx_invpair[ 9 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr4_cfgtx_entest, 
			  mcu2_fsr4_cfgtx_entx}),
  .mcu2_fsr4_testcfg0   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu2_fsr4_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu2_fsr4_testcfg[ 7 : 0 ]}),
  .mcu2_fsr4_testcfg1   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu2_fsr4_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu2_fsr4_testcfg[ 7 : 0 ]}),
  .mcu2_fsr4_testcfg2   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu2_fsr4_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu2_fsr4_testcfg[ 7 : 0 ]}),
  .fsr4_txbclkin	({dr_gclk_c0_fsr4_2,dr_gclk_c0_fsr4_1,dr_gclk_c0_fsr4_0}),
  .fsr4_mcu2_rxbclk  	({fsr4_mcu2_rxbclk[ 0 ], fsr4_mcu2_rxbclk[ 1 ], fsr4_mcu2_rxbclk[ 2 ], fsr4_mcu2_rxbclk[ 3 ],
			  fsr4_mcu2_rxbclk[ 13 : 12 ], fsr4_mcu2_rxbclk[ 4 ], fsr4_mcu2_rxbclk[ 5 ], fsr4_mcu2_rxbclk[ 6 ],
			  fsr4_mcu2_rxbclk[ 7 ], fsr4_mcu2_rxbclk[ 8 ], fsr4_mcu2_rxbclk[ 9 ], fsr4_mcu2_rxbclk[ 10 ],
			  fsr4_mcu2_rxbclk[ 11 ]}),
  .fsr4_rxbclkin	({fsr4_mcu2_rxbclk[ 0 ], fsr4_mcu2_rxbclk[ 1 ], fsr4_mcu2_rxbclk[ 2 ], fsr4_mcu2_rxbclk[ 3 ],
			  fsr4_mcu2_rxbclk[ 13 : 12 ], fsr4_mcu2_rxbclk[ 4 ], fsr4_mcu2_rxbclk[ 5 ], fsr4_mcu2_rxbclk[ 6 ],
			  fsr4_mcu2_rxbclk[ 7 ], fsr4_mcu2_rxbclk[ 8 ], fsr4_mcu2_rxbclk[ 9 ], fsr4_mcu2_rxbclk[ 10 ],
			  fsr4_mcu2_rxbclk[ 11 ]}),
  .fsr4_bsinitclk	({tcu_sbs_bsinitclk, tcu_sbs_bsinitclk, tcu_sbs_bsinitclk}),
  .fsr4_fclk    	({efu_mcu_fclk, efu_mcu_fclk, efu_mcu_fclk}),
  .fsr4_fclrz   	({efu_mcu_fclrz, efu_mcu_fclrz, efu_mcu_fclrz}),
  .fsr4_fdi     	({fsr3_fdo[ 0 ],fsr4_fdo[ 2 : 1 ]}),
  .fsr4_fdo     	(fsr4_fdo[ 2 : 0 ]),
  .fsr4_stcicfg 	({tcu_stcicfg[ 1 : 0 ], tcu_stcicfg[ 1 : 0 ], tcu_stcicfg[ 1 : 0 ]}),
  .fsr4_stciclk 	({tcu_stciclk, tcu_stciclk, tcu_stciclk}),
  .fsr4_stcid   	({fsr5_stciq[ 0 ],fsr4_stciq[ 2 : 1 ]}),
  .fsr4_stciq   	(fsr4_stciq[ 2 : 0 ]),
  .fsr4_testclkr	({mio_fsr_testclkr[ 4 ], mio_fsr_testclkr[ 4 ], mio_fsr_testclkr[ 4 ]}),
  .fsr4_testclkt	({mio_fsr_testclkt[ 4 ], mio_fsr_testclkt[ 4 ], mio_fsr_testclkt[ 4 ]}),
  .mcu2_fsr5_td9        (mcu2_fsr5_data[ 11 : 0 ]),
  .mcu2_fsr5_td8        (mcu2_fsr5_data[ 23 : 12 ]),
  .mcu2_fsr5_td7        (mcu2_fsr5_data[ 35 : 24 ]),
  .mcu2_fsr5_td6        (mcu2_fsr5_data[ 47 : 36 ]),
  .mcu2_fsr5_td5        (mcu2_fsr5_data[ 59 : 48 ]),
  .mcu2_fsr5_td3        (mcu2_fsr5_data[ 71 : 60 ]),
  .mcu2_fsr5_td2        (mcu2_fsr5_data[ 83 : 72 ]),
  .mcu2_fsr5_td1        (mcu2_fsr5_data[ 95 : 84 ]),
  .mcu2_fsr5_td0        (mcu2_fsr5_data[ 107 : 96 ]),
  .mcu2_fsr5_td4        (mcu2_fsr5_data[ 119 : 108 ]),
  .fsr5_mcu2_rd13       (fsr5_mcu2_data[ 11 : 0 ]),
  .fsr5_mcu2_rd12       (fsr5_mcu2_data[ 23 : 12 ]),
  .fsr5_mcu2_rd11       (fsr5_mcu2_data[ 35 : 24 ]),
  .fsr5_mcu2_rd10       (fsr5_mcu2_data[ 47 : 36 ]),
  .fsr5_mcu2_rd7        (fsr5_mcu2_data[ 59 : 48 ]),
  .fsr5_mcu2_rd6        (fsr5_mcu2_data[ 71 : 60 ]),
  .fsr5_mcu2_rd5        (fsr5_mcu2_data[ 83 : 72 ]),
  .fsr5_mcu2_rd4        (fsr5_mcu2_data[ 95 : 84 ]),
  .fsr5_mcu2_rd3        (fsr5_mcu2_data[ 107 : 96 ]),
  .fsr5_mcu2_rd2        (fsr5_mcu2_data[ 119 : 108 ]),
  .fsr5_mcu2_rd1        (fsr5_mcu2_data[ 131 : 120 ]),
  .fsr5_mcu2_rd0        (fsr5_mcu2_data[ 143 : 132 ]),
  .fsr5_mcu2_rd8        (fsr5_mcu2_data[ 155 : 144 ]),
  .fsr5_mcu2_rd9        (fsr5_mcu2_data[ 167 : 156 ]),
  .mcu2_fsr5_cfgpll0    ({mcu2_fsr45_cfgpll_lb[ 1 : 0 ], mcu2_fsr45_cfgpll_mpy[ 3 : 0 ], mcu2_fsr5_cfgpll_enpll}),
  .mcu2_fsr5_cfgpll1    ({mcu2_fsr45_cfgpll_lb[ 1 : 0 ], mcu2_fsr45_cfgpll_mpy[ 3 : 0 ], mcu2_fsr5_cfgpll_enpll}),
  .mcu2_fsr5_cfgpll2    ({mcu2_fsr45_cfgpll_lb[ 1 : 0 ], mcu2_fsr45_cfgpll_mpy[ 3 : 0 ], mcu2_fsr5_cfgpll_enpll}),
  .mcu2_fsr5_cfgrx13     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr5_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr5_cfgrx_invpair[ 0 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr5_cfgrx_entest, mcu2_fsr5_cfgrx_enrx}),
  .mcu2_fsr5_cfgrx12    ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr5_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr5_cfgrx_invpair[ 1 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr5_cfgrx_entest, mcu2_fsr5_cfgrx_enrx}),
  .mcu2_fsr5_cfgrx11    ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr5_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr5_cfgrx_invpair[ 2 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr5_cfgrx_entest, mcu2_fsr5_cfgrx_enrx}),
  .mcu2_fsr5_cfgrx10    ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr5_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr5_cfgrx_invpair[ 3 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr5_cfgrx_entest, mcu2_fsr5_cfgrx_enrx}),
  .mcu2_fsr5_cfgrx7     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr5_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr5_cfgrx_invpair[ 4 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr5_cfgrx_entest, mcu2_fsr5_cfgrx_enrx}),
  .mcu2_fsr5_cfgrx6     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr5_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr5_cfgrx_invpair[ 5 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr5_cfgrx_entest, mcu2_fsr5_cfgrx_enrx}),
  .mcu2_fsr5_cfgrx5     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr5_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr5_cfgrx_invpair[ 6 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr5_cfgrx_entest, mcu2_fsr5_cfgrx_enrx}),
  .mcu2_fsr5_cfgrx4     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr5_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr5_cfgrx_invpair[ 7 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr5_cfgrx_entest, mcu2_fsr5_cfgrx_enrx}),
  .mcu2_fsr5_cfgrx3     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr5_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr5_cfgrx_invpair[ 8 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr5_cfgrx_entest, mcu2_fsr5_cfgrx_enrx}),
  .mcu2_fsr5_cfgrx2     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr5_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr5_cfgrx_invpair[ 9 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr5_cfgrx_entest, mcu2_fsr5_cfgrx_enrx}),
  .mcu2_fsr5_cfgrx1     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr5_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr5_cfgrx_invpair[ 10 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr5_cfgrx_entest, mcu2_fsr5_cfgrx_enrx}),
  .mcu2_fsr5_cfgrx0     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr5_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr5_cfgrx_invpair[ 11 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr5_cfgrx_entest, mcu2_fsr5_cfgrx_enrx}),
  .mcu2_fsr5_cfgrx8     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr5_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr5_cfgrx_invpair[ 12 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr5_cfgrx_entest, mcu2_fsr5_cfgrx_enrx}),
  .mcu2_fsr5_cfgrx9     ({1'b0, 1'b0, mcu2_fsr45_cfgrx_eq[ 3 : 0 ], 
			  mcu2_fsr45_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu2_fsr5_cfgrx_align, 
			  mcu2_fsr45_cfgrx_term[ 2 : 0 ], mcu2_fsr5_cfgrx_invpair[ 13 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], 
			  mcu2_fsr5_cfgrx_entest, mcu2_fsr5_cfgrx_enrx}),
  .mcu2_fsr5_cfgtx9     ({mcu2_fsr5_cfgtx_enidl, mcu2_fsr5_cfgtx_bstx[ 0 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr5_cfgtx_invpair[ 0 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr5_cfgtx_entest, 
			  mcu2_fsr5_cfgtx_entx}),
  .mcu2_fsr5_cfgtx8     ({mcu2_fsr5_cfgtx_enidl, mcu2_fsr5_cfgtx_bstx[ 1 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr5_cfgtx_invpair[ 1 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr5_cfgtx_entest, 
			  mcu2_fsr5_cfgtx_entx}),
  .mcu2_fsr5_cfgtx7     ({mcu2_fsr5_cfgtx_enidl, mcu2_fsr5_cfgtx_bstx[ 2 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr5_cfgtx_invpair[ 2 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr5_cfgtx_entest, 
			  mcu2_fsr5_cfgtx_entx}),
  .mcu2_fsr5_cfgtx6     ({mcu2_fsr5_cfgtx_enidl, mcu2_fsr5_cfgtx_bstx[ 3 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr5_cfgtx_invpair[ 3 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr5_cfgtx_entest, 
			  mcu2_fsr5_cfgtx_entx}),
  .mcu2_fsr5_cfgtx5     ({mcu2_fsr5_cfgtx_enidl, mcu2_fsr5_cfgtx_bstx[ 4 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr5_cfgtx_invpair[ 4 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr5_cfgtx_entest, 
			  mcu2_fsr5_cfgtx_entx}),
  .mcu2_fsr5_cfgtx3     ({mcu2_fsr5_cfgtx_enidl, mcu2_fsr5_cfgtx_bstx[ 5 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr5_cfgtx_invpair[ 5 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr5_cfgtx_entest, 
			  mcu2_fsr5_cfgtx_entx}),
  .mcu2_fsr5_cfgtx2     ({mcu2_fsr5_cfgtx_enidl, mcu2_fsr5_cfgtx_bstx[ 6 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr5_cfgtx_invpair[ 6 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr5_cfgtx_entest, 
			  mcu2_fsr5_cfgtx_entx}),
  .mcu2_fsr5_cfgtx1     ({mcu2_fsr5_cfgtx_enidl, mcu2_fsr5_cfgtx_bstx[ 7 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr5_cfgtx_invpair[ 7 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr5_cfgtx_entest, 
			  mcu2_fsr5_cfgtx_entx}),
  .mcu2_fsr5_cfgtx0     ({mcu2_fsr5_cfgtx_enidl, mcu2_fsr5_cfgtx_bstx[ 8 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr5_cfgtx_invpair[ 8 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr5_cfgtx_entest, 
			  mcu2_fsr5_cfgtx_entx}),
  .mcu2_fsr5_cfgtx4     ({mcu2_fsr5_cfgtx_enidl, mcu2_fsr5_cfgtx_bstx[ 9 ], mcu2_fsr45_cfgtx_enftp, 
		  	  mcu2_fsr45_cfgtx_de[ 3 : 0 ], mcu2_fsr45_cfgtx_swing[ 2 : 0 ], mcu2_fsr45_cfgtx_cm, 
		  	  mcu2_fsr5_cfgtx_invpair[ 9 ], mcu2_fsr45_cfgrtx_rate[ 1 : 0 ], mcu2_fsr5_cfgtx_entest, 
			  mcu2_fsr5_cfgtx_entx}),
  .mcu2_fsr5_testcfg0   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu2_fsr5_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu2_fsr5_testcfg[ 7 : 0 ]}),
  .mcu2_fsr5_testcfg1   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu2_fsr5_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu2_fsr5_testcfg[ 7 : 0 ]}),
  .mcu2_fsr5_testcfg2   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu2_fsr5_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu2_fsr5_testcfg[ 7 : 0 ]}),
  .fsr5_txbclkin	({dr_gclk_c0_fsr5_2,dr_gclk_c0_fsr5_1,dr_gclk_c0_fsr5_0}),
  .fsr5_mcu2_rxbclk  	({fsr5_mcu2_rxbclk[ 0 ], fsr5_mcu2_rxbclk[ 1 ], fsr5_mcu2_rxbclk[ 2 ], fsr5_mcu2_rxbclk[ 3 ],
			  fsr5_mcu2_rxbclk[ 13 : 12 ], fsr5_mcu2_rxbclk[ 4 ], fsr5_mcu2_rxbclk[ 5 ], fsr5_mcu2_rxbclk[ 6 ],
			  fsr5_mcu2_rxbclk[ 7 ], fsr5_mcu2_rxbclk[ 8 ], fsr5_mcu2_rxbclk[ 9 ], fsr5_mcu2_rxbclk[ 10 ],
			  fsr5_mcu2_rxbclk[ 11 ]}),
  .fsr5_rxbclkin	({fsr5_mcu2_rxbclk[ 0 ], fsr5_mcu2_rxbclk[ 1 ], fsr5_mcu2_rxbclk[ 2 ], fsr5_mcu2_rxbclk[ 3 ],
			  fsr5_mcu2_rxbclk[ 13 : 12 ], fsr5_mcu2_rxbclk[ 4 ], fsr5_mcu2_rxbclk[ 5 ], fsr5_mcu2_rxbclk[ 6 ],
			  fsr5_mcu2_rxbclk[ 7 ], fsr5_mcu2_rxbclk[ 8 ], fsr5_mcu2_rxbclk[ 9 ], fsr5_mcu2_rxbclk[ 10 ],
			  fsr5_mcu2_rxbclk[ 11 ]}),
  .fsr5_bsinitclk	({tcu_sbs_bsinitclk, tcu_sbs_bsinitclk, tcu_sbs_bsinitclk}),
  .fsr5_fclk    	({efu_mcu_fclk, efu_mcu_fclk, efu_mcu_fclk}),
  .fsr5_fclrz   	({efu_mcu_fclrz, efu_mcu_fclrz, efu_mcu_fclrz}),
  .fsr5_fdi     	({fsr4_fdo[ 0 ],fsr5_fdo[ 2 : 1 ]}),
  .fsr5_fdo     	(fsr5_fdo[ 2 : 0 ]),
  .fsr5_stcicfg 	({tcu_stcicfg[ 1 : 0 ], tcu_stcicfg[ 1 : 0 ], tcu_stcicfg[ 1 : 0 ]}),
  .fsr5_stciclk 	({tcu_stciclk, tcu_stciclk, tcu_stciclk}),
  .fsr5_stcid   	({fsr6_stciq[ 0 ],fsr5_stciq[ 2 : 1 ]}),
  .fsr5_stciq   	(fsr5_stciq[ 2 : 0 ]),
  .fsr5_testclkr	({mio_fsr_testclkr[ 5 ], mio_fsr_testclkr[ 5 ], mio_fsr_testclkr[ 5 ]}),
  .fsr5_testclkt	({mio_fsr_testclkt[ 5 ], mio_fsr_testclkt[ 5 ], mio_fsr_testclkt[ 5 ]}),
  .mcu3_fsr6_td9        (mcu3_fsr6_data[ 11 : 0 ]),
  .mcu3_fsr6_td8        (mcu3_fsr6_data[ 23 : 12 ]),
  .mcu3_fsr6_td7        (mcu3_fsr6_data[ 35 : 24 ]),
  .mcu3_fsr6_td6        (mcu3_fsr6_data[ 47 : 36 ]),
  .mcu3_fsr6_td5        (mcu3_fsr6_data[ 59 : 48 ]),
  .mcu3_fsr6_td3        (mcu3_fsr6_data[ 71 : 60 ]),
  .mcu3_fsr6_td2        (mcu3_fsr6_data[ 83 : 72 ]),
  .mcu3_fsr6_td1        (mcu3_fsr6_data[ 95 : 84 ]),
  .mcu3_fsr6_td0        (mcu3_fsr6_data[ 107 : 96 ]),
  .mcu3_fsr6_td4        (mcu3_fsr6_data[ 119 : 108 ]),
  .fsr6_mcu3_rd13       (fsr6_mcu3_data[ 11 : 0 ]),
  .fsr6_mcu3_rd12       (fsr6_mcu3_data[ 23 : 12 ]),
  .fsr6_mcu3_rd11       (fsr6_mcu3_data[ 35 : 24 ]),
  .fsr6_mcu3_rd10       (fsr6_mcu3_data[ 47 : 36 ]),
  .fsr6_mcu3_rd7        (fsr6_mcu3_data[ 59 : 48 ]),
  .fsr6_mcu3_rd6        (fsr6_mcu3_data[ 71 : 60 ]),
  .fsr6_mcu3_rd5        (fsr6_mcu3_data[ 83 : 72 ]),
  .fsr6_mcu3_rd4        (fsr6_mcu3_data[ 95 : 84 ]),
  .fsr6_mcu3_rd3        (fsr6_mcu3_data[ 107 : 96 ]),
  .fsr6_mcu3_rd2        (fsr6_mcu3_data[ 119 : 108 ]),
  .fsr6_mcu3_rd1        (fsr6_mcu3_data[ 131 : 120 ]),
  .fsr6_mcu3_rd0        (fsr6_mcu3_data[ 143 : 132 ]),
  .fsr6_mcu3_rd8        (fsr6_mcu3_data[ 155 : 144 ]),
  .fsr6_mcu3_rd9        (fsr6_mcu3_data[ 167 : 156 ]),
  .mcu3_fsr6_cfgpll0    ({mcu3_fsr67_cfgpll_lb[ 1 : 0 ], mcu3_fsr67_cfgpll_mpy[ 3 : 0 ], mcu3_fsr6_cfgpll_enpll}),
  .mcu3_fsr6_cfgpll1    ({mcu3_fsr67_cfgpll_lb[ 1 : 0 ], mcu3_fsr67_cfgpll_mpy[ 3 : 0 ], mcu3_fsr6_cfgpll_enpll}),
  .mcu3_fsr6_cfgpll2    ({mcu3_fsr67_cfgpll_lb[ 1 : 0 ], mcu3_fsr67_cfgpll_mpy[ 3 : 0 ], mcu3_fsr6_cfgpll_enpll}),
  .mcu3_fsr6_cfgrx13    ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr6_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr6_cfgrx_invpair[ 0 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr6_cfgrx_entest, mcu3_fsr6_cfgrx_enrx}),
  .mcu3_fsr6_cfgrx12    ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr6_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr6_cfgrx_invpair[ 1 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr6_cfgrx_entest, mcu3_fsr6_cfgrx_enrx}),
  .mcu3_fsr6_cfgrx11    ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr6_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr6_cfgrx_invpair[ 2 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr6_cfgrx_entest, mcu3_fsr6_cfgrx_enrx}),
  .mcu3_fsr6_cfgrx10    ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr6_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr6_cfgrx_invpair[ 3 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr6_cfgrx_entest, mcu3_fsr6_cfgrx_enrx}),
  .mcu3_fsr6_cfgrx7     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr6_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr6_cfgrx_invpair[ 4 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr6_cfgrx_entest, mcu3_fsr6_cfgrx_enrx}),
  .mcu3_fsr6_cfgrx6     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr6_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr6_cfgrx_invpair[ 5 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr6_cfgrx_entest, mcu3_fsr6_cfgrx_enrx}),
  .mcu3_fsr6_cfgrx5     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr6_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr6_cfgrx_invpair[ 6 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr6_cfgrx_entest, mcu3_fsr6_cfgrx_enrx}),
  .mcu3_fsr6_cfgrx4     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr6_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr6_cfgrx_invpair[ 7 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr6_cfgrx_entest, mcu3_fsr6_cfgrx_enrx}),
  .mcu3_fsr6_cfgrx3     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr6_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr6_cfgrx_invpair[ 8 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr6_cfgrx_entest, mcu3_fsr6_cfgrx_enrx}),
  .mcu3_fsr6_cfgrx2     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr6_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr6_cfgrx_invpair[ 9 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr6_cfgrx_entest, mcu3_fsr6_cfgrx_enrx}),
  .mcu3_fsr6_cfgrx1     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr6_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr6_cfgrx_invpair[ 10 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr6_cfgrx_entest, mcu3_fsr6_cfgrx_enrx}),
  .mcu3_fsr6_cfgrx0     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr6_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr6_cfgrx_invpair[ 11 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr6_cfgrx_entest, mcu3_fsr6_cfgrx_enrx}),
  .mcu3_fsr6_cfgrx8     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr6_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr6_cfgrx_invpair[ 12 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr6_cfgrx_entest, mcu3_fsr6_cfgrx_enrx}),
  .mcu3_fsr6_cfgrx9     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr6_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr6_cfgrx_invpair[ 13 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr6_cfgrx_entest, mcu3_fsr6_cfgrx_enrx}),
  .mcu3_fsr6_cfgtx9     ({mcu3_fsr6_cfgtx_enidl, mcu3_fsr6_cfgtx_bstx[ 0 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr6_cfgtx_invpair[ 0 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr6_cfgtx_entest, 
			  mcu3_fsr6_cfgtx_entx}),
  .mcu3_fsr6_cfgtx8     ({mcu3_fsr6_cfgtx_enidl, mcu3_fsr6_cfgtx_bstx[ 1 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr6_cfgtx_invpair[ 1 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr6_cfgtx_entest, 
			  mcu3_fsr6_cfgtx_entx}),
  .mcu3_fsr6_cfgtx7     ({mcu3_fsr6_cfgtx_enidl, mcu3_fsr6_cfgtx_bstx[ 2 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr6_cfgtx_invpair[ 2 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr6_cfgtx_entest, 
			  mcu3_fsr6_cfgtx_entx}),
  .mcu3_fsr6_cfgtx6     ({mcu3_fsr6_cfgtx_enidl, mcu3_fsr6_cfgtx_bstx[ 3 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr6_cfgtx_invpair[ 3 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr6_cfgtx_entest, 
			  mcu3_fsr6_cfgtx_entx}),
  .mcu3_fsr6_cfgtx5     ({mcu3_fsr6_cfgtx_enidl, mcu3_fsr6_cfgtx_bstx[ 4 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr6_cfgtx_invpair[ 4 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr6_cfgtx_entest, 
			  mcu3_fsr6_cfgtx_entx}),
  .mcu3_fsr6_cfgtx3     ({mcu3_fsr6_cfgtx_enidl, mcu3_fsr6_cfgtx_bstx[ 5 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr6_cfgtx_invpair[ 5 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr6_cfgtx_entest, 
			  mcu3_fsr6_cfgtx_entx}),
  .mcu3_fsr6_cfgtx2     ({mcu3_fsr6_cfgtx_enidl, mcu3_fsr6_cfgtx_bstx[ 6 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr6_cfgtx_invpair[ 6 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr6_cfgtx_entest, 
			  mcu3_fsr6_cfgtx_entx}),
  .mcu3_fsr6_cfgtx1     ({mcu3_fsr6_cfgtx_enidl, mcu3_fsr6_cfgtx_bstx[ 7 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr6_cfgtx_invpair[ 7 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr6_cfgtx_entest, 
			  mcu3_fsr6_cfgtx_entx}),
  .mcu3_fsr6_cfgtx0     ({mcu3_fsr6_cfgtx_enidl, mcu3_fsr6_cfgtx_bstx[ 8 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr6_cfgtx_invpair[ 8 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr6_cfgtx_entest, 
			  mcu3_fsr6_cfgtx_entx}),
  .mcu3_fsr6_cfgtx4     ({mcu3_fsr6_cfgtx_enidl, mcu3_fsr6_cfgtx_bstx[ 9 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr6_cfgtx_invpair[ 9 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr6_cfgtx_entest, 
			  mcu3_fsr6_cfgtx_entx}),
  .mcu3_fsr6_testcfg0   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu3_fsr6_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu3_fsr6_testcfg[ 7 : 0 ]}),
  .mcu3_fsr6_testcfg1   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu3_fsr6_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu3_fsr6_testcfg[ 7 : 0 ]}),
  .mcu3_fsr6_testcfg2   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu3_fsr6_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu3_fsr6_testcfg[ 7 : 0 ]}),
  .fsr6_txbclkin	({dr_gclk_c0_fsr6_2,dr_gclk_c0_fsr6_1,dr_gclk_c0_fsr6_0}),
  .fsr6_mcu3_rxbclk  	({fsr6_mcu3_rxbclk[ 0 ], fsr6_mcu3_rxbclk[ 1 ], fsr6_mcu3_rxbclk[ 2 ], fsr6_mcu3_rxbclk[ 3 ],
			  fsr6_mcu3_rxbclk[ 13 : 12 ], fsr6_mcu3_rxbclk[ 4 ], fsr6_mcu3_rxbclk[ 5 ], fsr6_mcu3_rxbclk[ 6 ],
			  fsr6_mcu3_rxbclk[ 7 ], fsr6_mcu3_rxbclk[ 8 ], fsr6_mcu3_rxbclk[ 9 ], fsr6_mcu3_rxbclk[ 10 ],
			  fsr6_mcu3_rxbclk[ 11 ]}),
  .fsr6_rxbclkin	({fsr6_mcu3_rxbclk[ 0 ], fsr6_mcu3_rxbclk[ 1 ], fsr6_mcu3_rxbclk[ 2 ], fsr6_mcu3_rxbclk[ 3 ],
			  fsr6_mcu3_rxbclk[ 13 : 12 ], fsr6_mcu3_rxbclk[ 4 ], fsr6_mcu3_rxbclk[ 5 ], fsr6_mcu3_rxbclk[ 6 ],
			  fsr6_mcu3_rxbclk[ 7 ], fsr6_mcu3_rxbclk[ 8 ], fsr6_mcu3_rxbclk[ 9 ], fsr6_mcu3_rxbclk[ 10 ],
			  fsr6_mcu3_rxbclk[ 11 ]}),
  .fsr6_bsinitclk	({tcu_sbs_bsinitclk, tcu_sbs_bsinitclk, tcu_sbs_bsinitclk}),
  .fsr6_fclk    	({efu_mcu_fclk, efu_mcu_fclk, efu_mcu_fclk}),
  .fsr6_fclrz   	({efu_mcu_fclrz, efu_mcu_fclrz, efu_mcu_fclrz}),
  .fsr6_fdi     	({fsr5_fdo[ 0 ],fsr6_fdo[ 2 : 1 ]}),
  .fsr6_fdo     	(fsr6_fdo[ 2 : 0 ]),
  .fsr6_stcicfg 	({tcu_stcicfg[ 1 : 0 ], tcu_stcicfg[ 1 : 0 ], tcu_stcicfg[ 1 : 0 ]}),
  .fsr6_stciclk 	({tcu_stciclk, tcu_stciclk, tcu_stciclk}),
  .fsr6_stcid   	({fsr7_stciq[ 2 ],fsr6_stciq[ 2 : 1 ]}),
  .fsr6_stciq   	(fsr6_stciq[ 2 : 0 ]),
  .fsr6_testclkr	({mio_fsr_testclkr[ 6 ], mio_fsr_testclkr[ 6 ], mio_fsr_testclkr[ 6 ]}),
  .fsr6_testclkt	({mio_fsr_testclkt[ 6 ], mio_fsr_testclkt[ 6 ], mio_fsr_testclkt[ 6 ]}),
  .fsr_right_atpgd      (fsr_bottom_atpgq),
  .fsr_right_atpgq      (srd_tcu_atpgq),
  .VDDA                 (VDDA_FSRR),
  .VDDD                 (VDDD_FSRR),
  .VDDR                 (VDDR_FSRR),
  .VDDT                 (VDDT_FSRR),
  .VSSA                 (VSSA_FSRR),
  .fsr4_mcu2_ststx_testfail(fsr4_mcu2_ststx_testfail[9:0]),
  .fsr4_mcu2_stspll_lock(fsr4_mcu2_stspll_lock[2:0]),
  .fsr4_mcu2_stsrx_testfail(fsr4_mcu2_stsrx_testfail[13:0]),
  .fsr4_mcu2_stsrx_sync(fsr4_mcu2_stsrx_sync[13:0]),
  .fsr4_mcu2_stsrx_losdtct(fsr4_mcu2_stsrx_losdtct[13:0]),
  .fsr4_mcu2_stsrx_bsrxp(fsr4_mcu2_stsrx_bsrxp[13:0]),
  .fsr4_mcu2_stsrx_bsrxn(fsr4_mcu2_stsrx_bsrxn[13:0]),
  .FBDIMM2A_AMUX(FBDIMM2A_AMUX[2:0]),
  .fsr5_mcu2_ststx_testfail(fsr5_mcu2_ststx_testfail[9:0]),
  .fsr5_mcu2_stspll_lock(fsr5_mcu2_stspll_lock[2:0]),
  .fsr5_mcu2_stsrx_testfail(fsr5_mcu2_stsrx_testfail[13:0]),
  .fsr5_mcu2_stsrx_sync(fsr5_mcu2_stsrx_sync[13:0]),
  .fsr5_mcu2_stsrx_losdtct(fsr5_mcu2_stsrx_losdtct[13:0]),
  .fsr5_mcu2_stsrx_bsrxp(fsr5_mcu2_stsrx_bsrxp[13:0]),
  .fsr5_mcu2_stsrx_bsrxn(fsr5_mcu2_stsrx_bsrxn[13:0]),
  .FBDIMM2B_AMUX(FBDIMM2B_AMUX[2:0]),
  .fsr6_mcu3_ststx_testfail(fsr6_mcu3_ststx_testfail[9:0]),
  .fsr6_mcu3_stspll_lock(fsr6_mcu3_stspll_lock[2:0]),
  .fsr6_mcu3_stsrx_testfail(fsr6_mcu3_stsrx_testfail[13:0]),
  .fsr6_mcu3_stsrx_sync(fsr6_mcu3_stsrx_sync[13:0]),
  .fsr6_mcu3_stsrx_losdtct(fsr6_mcu3_stsrx_losdtct[13:0]),
  .fsr6_mcu3_stsrx_bsrxp(fsr6_mcu3_stsrx_bsrxp[13:0]),
  .fsr6_mcu3_stsrx_bsrxn(fsr6_mcu3_stsrx_bsrxn[13:0]),
  .FBDIMM3A_AMUX(FBDIMM3A_AMUX[2:0]),
  .FBDIMM2_REFCLK_N(FBDIMM2_REFCLK_N),
  .FBDIMM2_REFCLK_P(FBDIMM2_REFCLK_P)
         );     
`endif  // OPENSPARC_CMP

//________________________________________________________________

// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
fsr_bottom fsr_bottom (
  .FBDIMM3B_RX_P        ({FBDIMM3B_RX_P[ 11 : 8 ],FBDIMM3B_RX_P[ 12 ],FBDIMM3B_RX_P[ 13 ],FBDIMM3B_RX_P[ 7 : 0 ]}),
  .FBDIMM3B_RX_N        ({FBDIMM3B_RX_N[ 11 : 8 ],FBDIMM3B_RX_N[ 12 ],FBDIMM3B_RX_N[ 13 ],FBDIMM3B_RX_N[ 7 : 0 ]}),
  .FBDIMM3B_TX_P        ({FBDIMM3B_TX_P[ 8 : 5 ],FBDIMM3B_TX_P[ 9 ],FBDIMM3B_TX_P[ 4 : 0 ]}),
  .FBDIMM3B_TX_N        ({FBDIMM3B_TX_N[ 8 : 5 ],FBDIMM3B_TX_N[ 9 ],FBDIMM3B_TX_N[ 4 : 0 ]}),
  .mcu3_fsr7_td0        (mcu3_fsr7_data[ 11 : 0 ]),
  .mcu3_fsr7_td1        (mcu3_fsr7_data[ 23 : 12 ]),
  .mcu3_fsr7_td2        (mcu3_fsr7_data[ 35 : 24 ]),
  .mcu3_fsr7_td3        (mcu3_fsr7_data[ 47 : 36 ]),
  .mcu3_fsr7_td4        (mcu3_fsr7_data[ 59 : 48 ]),
  .mcu3_fsr7_td6        (mcu3_fsr7_data[ 71 : 60 ]),
  .mcu3_fsr7_td7        (mcu3_fsr7_data[ 83 : 72 ]),
  .mcu3_fsr7_td8        (mcu3_fsr7_data[ 95 : 84 ]),
  .mcu3_fsr7_td9        (mcu3_fsr7_data[ 107 : 96 ]),
  .mcu3_fsr7_td5        (mcu3_fsr7_data[ 119 : 108 ]),
  .fsr7_mcu3_rd0        (fsr7_mcu3_data[ 11 : 0 ]),
  .fsr7_mcu3_rd1        (fsr7_mcu3_data[ 23 : 12 ]),
  .fsr7_mcu3_rd2        (fsr7_mcu3_data[ 35 : 24 ]),
  .fsr7_mcu3_rd3        (fsr7_mcu3_data[ 47 : 36 ]),
  .fsr7_mcu3_rd4        (fsr7_mcu3_data[ 59 : 48 ]),
  .fsr7_mcu3_rd5        (fsr7_mcu3_data[ 71 : 60 ]),
  .fsr7_mcu3_rd6        (fsr7_mcu3_data[ 83 : 72 ]),
  .fsr7_mcu3_rd7        (fsr7_mcu3_data[ 95 : 84 ]),
  .fsr7_mcu3_rd10       (fsr7_mcu3_data[ 107 : 96 ]),
  .fsr7_mcu3_rd11       (fsr7_mcu3_data[ 119 : 108 ]),
  .fsr7_mcu3_rd12       (fsr7_mcu3_data[ 131 : 120 ]),
  .fsr7_mcu3_rd13       (fsr7_mcu3_data[ 143 : 132 ]),
  .fsr7_mcu3_rd9        (fsr7_mcu3_data[ 155 : 144 ]),
  .fsr7_mcu3_rd8        (fsr7_mcu3_data[ 167 : 156 ]),
  .mcu3_fsr7_cfgpll0    ({mcu3_fsr67_cfgpll_lb[ 1 : 0 ], mcu3_fsr67_cfgpll_mpy[ 3 : 0 ], mcu3_fsr7_cfgpll_enpll}),
  .mcu3_fsr7_cfgpll1    ({mcu3_fsr67_cfgpll_lb[ 1 : 0 ], mcu3_fsr67_cfgpll_mpy[ 3 : 0 ], mcu3_fsr7_cfgpll_enpll}),
  .mcu3_fsr7_cfgpll2    ({mcu3_fsr67_cfgpll_lb[ 1 : 0 ], mcu3_fsr67_cfgpll_mpy[ 3 : 0 ], mcu3_fsr7_cfgpll_enpll}),
  .mcu3_fsr7_cfgrx0     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr7_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr7_cfgrx_invpair[ 0 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr7_cfgrx_entest, mcu3_fsr7_cfgrx_enrx}),
  .mcu3_fsr7_cfgrx1     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr7_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr7_cfgrx_invpair[ 1 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr7_cfgrx_entest, mcu3_fsr7_cfgrx_enrx}),
  .mcu3_fsr7_cfgrx2     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr7_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr7_cfgrx_invpair[ 2 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr7_cfgrx_entest, mcu3_fsr7_cfgrx_enrx}),
  .mcu3_fsr7_cfgrx3     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr7_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr7_cfgrx_invpair[ 3 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr7_cfgrx_entest, mcu3_fsr7_cfgrx_enrx}),
  .mcu3_fsr7_cfgrx4     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr7_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr7_cfgrx_invpair[ 4 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr7_cfgrx_entest, mcu3_fsr7_cfgrx_enrx}),
  .mcu3_fsr7_cfgrx5     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr7_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr7_cfgrx_invpair[ 5 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr7_cfgrx_entest, mcu3_fsr7_cfgrx_enrx}),
  .mcu3_fsr7_cfgrx6     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr7_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr7_cfgrx_invpair[ 6 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr7_cfgrx_entest, mcu3_fsr7_cfgrx_enrx}),
  .mcu3_fsr7_cfgrx7     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr7_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr7_cfgrx_invpair[ 7 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr7_cfgrx_entest, mcu3_fsr7_cfgrx_enrx}),
  .mcu3_fsr7_cfgrx10    ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr7_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr7_cfgrx_invpair[ 8 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr7_cfgrx_entest, mcu3_fsr7_cfgrx_enrx}),
  .mcu3_fsr7_cfgrx11    ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr7_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr7_cfgrx_invpair[ 9 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr7_cfgrx_entest, mcu3_fsr7_cfgrx_enrx}),
  .mcu3_fsr7_cfgrx12    ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr7_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr7_cfgrx_invpair[ 10 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr7_cfgrx_entest, mcu3_fsr7_cfgrx_enrx}),
  .mcu3_fsr7_cfgrx13    ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr7_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr7_cfgrx_invpair[ 11 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr7_cfgrx_entest, mcu3_fsr7_cfgrx_enrx}),
  .mcu3_fsr7_cfgrx9     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr7_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr7_cfgrx_invpair[ 12 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr7_cfgrx_entest, mcu3_fsr7_cfgrx_enrx}),
  .mcu3_fsr7_cfgrx8     ({1'b0, 1'b0, mcu3_fsr67_cfgrx_eq[ 3 : 0 ], 
			  mcu3_fsr67_cfgrx_cdr[ 2 : 0 ], 1'b0, 1'b0, mcu3_fsr7_cfgrx_align, 
			  mcu3_fsr67_cfgrx_term[ 2 : 0 ], mcu3_fsr7_cfgrx_invpair[ 13 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], 
			  mcu3_fsr7_cfgrx_entest, mcu3_fsr7_cfgrx_enrx}),
  .mcu3_fsr7_cfgtx0     ({mcu3_fsr7_cfgtx_enidl, mcu3_fsr7_cfgtx_bstx[ 0 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr7_cfgtx_invpair[ 0 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr7_cfgtx_entest, 
			  mcu3_fsr7_cfgtx_entx}),
  .mcu3_fsr7_cfgtx1     ({mcu3_fsr7_cfgtx_enidl, mcu3_fsr7_cfgtx_bstx[ 1 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr7_cfgtx_invpair[ 1 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr7_cfgtx_entest, 
			  mcu3_fsr7_cfgtx_entx}),
  .mcu3_fsr7_cfgtx2     ({mcu3_fsr7_cfgtx_enidl, mcu3_fsr7_cfgtx_bstx[ 2 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr7_cfgtx_invpair[ 2 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr7_cfgtx_entest, 
			  mcu3_fsr7_cfgtx_entx}),
  .mcu3_fsr7_cfgtx3     ({mcu3_fsr7_cfgtx_enidl, mcu3_fsr7_cfgtx_bstx[ 3 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr7_cfgtx_invpair[ 3 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr7_cfgtx_entest, 
			  mcu3_fsr7_cfgtx_entx}),
  .mcu3_fsr7_cfgtx4     ({mcu3_fsr7_cfgtx_enidl, mcu3_fsr7_cfgtx_bstx[ 4 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr7_cfgtx_invpair[ 4 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr7_cfgtx_entest, 
			  mcu3_fsr7_cfgtx_entx}),
  .mcu3_fsr7_cfgtx6     ({mcu3_fsr7_cfgtx_enidl, mcu3_fsr7_cfgtx_bstx[ 5 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr7_cfgtx_invpair[ 5 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr7_cfgtx_entest, 
			  mcu3_fsr7_cfgtx_entx}),
  .mcu3_fsr7_cfgtx7     ({mcu3_fsr7_cfgtx_enidl, mcu3_fsr7_cfgtx_bstx[ 6 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr7_cfgtx_invpair[ 6 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr7_cfgtx_entest, 
			  mcu3_fsr7_cfgtx_entx}),
  .mcu3_fsr7_cfgtx8     ({mcu3_fsr7_cfgtx_enidl, mcu3_fsr7_cfgtx_bstx[ 7 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr7_cfgtx_invpair[ 7 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr7_cfgtx_entest, 
			  mcu3_fsr7_cfgtx_entx}),
  .mcu3_fsr7_cfgtx9     ({mcu3_fsr7_cfgtx_enidl, mcu3_fsr7_cfgtx_bstx[ 8 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr7_cfgtx_invpair[ 8 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr7_cfgtx_entest, 
			  mcu3_fsr7_cfgtx_entx}),
  .mcu3_fsr7_cfgtx5     ({mcu3_fsr7_cfgtx_enidl, mcu3_fsr7_cfgtx_bstx[ 9 ], mcu3_fsr67_cfgtx_enftp, 
		  	  mcu3_fsr67_cfgtx_de[ 3 : 0 ], mcu3_fsr67_cfgtx_swing[ 2 : 0 ], mcu3_fsr67_cfgtx_cm, 
		  	  mcu3_fsr7_cfgtx_invpair[ 9 ], mcu3_fsr67_cfgrtx_rate[ 1 : 0 ], mcu3_fsr7_cfgtx_entest, 
			  mcu3_fsr7_cfgtx_entx}),
  .mcu3_fsr7_testcfg0   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu3_fsr7_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu3_fsr7_testcfg[ 7 : 0 ]}),
  .mcu3_fsr7_testcfg1   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu3_fsr7_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu3_fsr7_testcfg[ 7 : 0 ]}),
  .mcu3_fsr7_testcfg2   ({tcu_srd_atpgse, tcu_srd_atpgmode[ 2 : 0 ], mcu3_fsr7_testcfg[ 11 : 8 ], tcu_sbs_enbsrx, tcu_sbs_enbstx, mcu3_fsr7_testcfg[ 7 : 0 ]}),
  .fsr7_txbclkin	({dr_gclk_c2_fsr7_2,dr_gclk_c2_fsr7_1,dr_gclk_c2_fsr7_0}),
  .fsr7_mcu3_rxbclk  	({fsr7_mcu3_rxbclk[ 11 : 8 ],fsr7_mcu3_rxbclk[ 12 ],fsr7_mcu3_rxbclk[ 13 ],fsr7_mcu3_rxbclk[ 7 : 0 ]}),
  .fsr7_rxbclkin	({fsr7_mcu3_rxbclk[ 11 : 8 ],fsr7_mcu3_rxbclk[ 12 ],fsr7_mcu3_rxbclk[ 13 ],fsr7_mcu3_rxbclk[ 7 : 0 ]}),
  .fsr7_bsinitclk	({tcu_sbs_bsinitclk, tcu_sbs_bsinitclk, tcu_sbs_bsinitclk}),
  .fsr7_fclk    	({efu_mcu_fclk, efu_mcu_fclk, efu_mcu_fclk}),
  .fsr7_fclrz   	({efu_mcu_fclrz, efu_mcu_fclrz, efu_mcu_fclrz}),
  .fsr7_fdi     	({fsr6_fdo[ 0 ], fsr7_fdo[ 1 : 0 ]}),
  .fsr7_fdo     	({fsr7_fdo[ 1 : 0 ],mcu_efu_fdo}),
  .fsr7_stcicfg 	({tcu_stcicfg[ 1 : 0 ], tcu_stcicfg[ 1 : 0 ], tcu_stcicfg[ 1 : 0 ]}),
  .fsr7_stciclk 	({tcu_stciclk, tcu_stciclk, tcu_stciclk}),
  .fsr7_stcid   	({fsr7_stciq[ 1 : 0 ],esr_stciq}),
  .fsr7_stciq   	(fsr7_stciq[ 2 : 0 ]),
  .fsr7_testclkr	({mio_fsr_testclkr[ 7 ], mio_fsr_testclkr[ 7 ], mio_fsr_testclkr[ 7 ]}),
  .fsr7_testclkt	({mio_fsr_testclkt[ 7 ], mio_fsr_testclkt[ 7 ], mio_fsr_testclkt[ 7 ]}),
  .fsr_bottom_atpgd     (esr_atpgq),
  .fsr_bottom_atpgq     (fsr_bottom_atpgq),
  .VDDA                 (VDDA_FSRB),
  .VDDD                 (VDDD_FSRB),
  .VDDR                 (VDDR_FSRB),
  .VDDT                 (VDDT_FSRB),
  .VSSA                 (VSSA_FSRB),
  .fsr7_mcu3_ststx_testfail(fsr7_mcu3_ststx_testfail[9:0]),
  .fsr7_mcu3_stspll_lock(fsr7_mcu3_stspll_lock[2:0]),
  .fsr7_mcu3_stsrx_testfail(fsr7_mcu3_stsrx_testfail[13:0]),
  .fsr7_mcu3_stsrx_sync(fsr7_mcu3_stsrx_sync[13:0]),
  .fsr7_mcu3_stsrx_losdtct(fsr7_mcu3_stsrx_losdtct[13:0]),
  .fsr7_mcu3_stsrx_bsrxp(fsr7_mcu3_stsrx_bsrxp[13:0]),
  .fsr7_mcu3_stsrx_bsrxn(fsr7_mcu3_stsrx_bsrxn[13:0]),
  .FBDIMM3B_AMUX(FBDIMM3B_AMUX[2:0]),
  .FBDIMM3_REFCLK_N(FBDIMM3_REFCLK_N),
  .FBDIMM3_REFCLK_P(FBDIMM3_REFCLK_P)
         );     
`endif  // OPENSPARC_CMP
//________________________________________________________________

// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
sii sii (
  .gclk                     ( cmp_gclk_c3_sii ), // cmp_gclk_c1_r[4]		) ,
  .tcu_sii_clk_stop	( gl_sii_clk_stop ),	// staged clk_stop
  .tcu_sii_io_clk_stop	( gl_sii_io_clk_stop ), // staged clk_stop
  .ccu_io_out	( gl_io_out_c3b0 ),	// staged div phase
  .scan_in		    (ccx_scan_out[ 1 ]             ),
  .scan_out		    (sii_scan_out		 ),
  .ccu_io_cmp_sync_en (gl_io_cmp_sync_en_c3b ),
  .ccu_cmp_io_sync_en (gl_cmp_io_sync_en_c3b ),
  //.tcu_soc4cmp_clk_stop	(tcu_sii_clk_stop		  ),
  //.tcu_soc6io_clk_stop	(tcu_sii_io_clk_stop	   ),
  .tcu_pce_ov_in	    (tcu_pce_ov),
  .tcu_sii_mbist_start({tcu_sii_mbist_start_ccxrff_1,tcu_sii_mbist_start_ccxrff_0}),
  .tcu_sii_data(tcu_sii_data_ccxrff),
  .tcu_sii_vld(tcu_sii_vld_ccxrff),
  .l2t4_sii_iq_dequeue(l2t4_sii_iq_dequeue_t1lff),
  .l2t4_sii_wib_dequeue(l2t4_sii_wib_dequeue_t1lff),
  .l2t5_sii_iq_dequeue(l2t5_sii_iq_dequeue_t1lff),
  .l2t5_sii_wib_dequeue(l2t5_sii_wib_dequeue_t1lff),
  .l2t6_sii_iq_dequeue(l2t6_sii_iq_dequeue_t3lff),
  .l2t6_sii_wib_dequeue(l2t6_sii_wib_dequeue_t3lff),
  .l2t7_sii_iq_dequeue(l2t7_sii_iq_dequeue_t3lff),
  .l2t7_sii_wib_dequeue(l2t7_sii_wib_dequeue_t3lff),
  .tcu_dbr_gateoff(tcu_dbr_gateoff),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .cluster_arst_l(cluster_arst_l),
  .tcu_div_bypass(tcu_div_bypass),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .tcu_sii_mbist_scan_in(tcu_sii_mbist_scan_in),
  .sii_tcu_mbist_done(sii_tcu_mbist_done[1:0]),
  .sii_tcu_mbist_fail(sii_tcu_mbist_fail[1:0]),
  .sii_tcu_mbist_scan_out(sii_tcu_mbist_scan_out),
  .l2t0_sii_iq_dequeue(l2t0_sii_iq_dequeue),
  .l2t0_sii_wib_dequeue(l2t0_sii_wib_dequeue),
  .sii_l2t0_req_vld(sii_l2t0_req_vld),
  .sii_l2t0_req(sii_l2t0_req[31:0]),
  .sii_l2b0_ecc(sii_l2b0_ecc[6:0]),
  .sii_dbg1_l2t0_req(sii_dbg1_l2t0_req[1:0]),
  .l2t1_sii_iq_dequeue(l2t1_sii_iq_dequeue),
  .l2t1_sii_wib_dequeue(l2t1_sii_wib_dequeue),
  .sii_l2t1_req_vld(sii_l2t1_req_vld),
  .sii_l2t1_req(sii_l2t1_req[31:0]),
  .sii_l2b1_ecc(sii_l2b1_ecc[6:0]),
  .sii_dbg1_l2t1_req(sii_dbg1_l2t1_req[1:0]),
  .l2t2_sii_iq_dequeue(l2t2_sii_iq_dequeue),
  .l2t2_sii_wib_dequeue(l2t2_sii_wib_dequeue),
  .sii_l2t2_req_vld(sii_l2t2_req_vld),
  .sii_l2t2_req(sii_l2t2_req[31:0]),
  .sii_l2b2_ecc(sii_l2b2_ecc[6:0]),
  .sii_dbg1_l2t2_req(sii_dbg1_l2t2_req[1:0]),
  .l2t3_sii_iq_dequeue(l2t3_sii_iq_dequeue),
  .l2t3_sii_wib_dequeue(l2t3_sii_wib_dequeue),
  .sii_l2t3_req_vld(sii_l2t3_req_vld),
  .sii_l2t3_req(sii_l2t3_req[31:0]),
  .sii_l2b3_ecc(sii_l2b3_ecc[6:0]),
  .sii_dbg1_l2t3_req(sii_dbg1_l2t3_req[1:0]),
  .sii_l2t4_req_vld(sii_l2t4_req_vld),
  .sii_l2t4_req(sii_l2t4_req[31:0]),
  .sii_l2b4_ecc(sii_l2b4_ecc[6:0]),
  .sii_dbg1_l2t4_req(sii_dbg1_l2t4_req[1:0]),
  .sii_l2t5_req_vld(sii_l2t5_req_vld),
  .sii_l2t5_req(sii_l2t5_req[31:0]),
  .sii_l2b5_ecc(sii_l2b5_ecc[6:0]),
  .sii_dbg1_l2t5_req(sii_dbg1_l2t5_req[1:0]),
  .sii_l2t6_req_vld(sii_l2t6_req_vld),
  .sii_l2t6_req(sii_l2t6_req[31:0]),
  .sii_l2b6_ecc(sii_l2b6_ecc[6:0]),
  .sii_dbg1_l2t6_req(sii_dbg1_l2t6_req[1:0]),
  .sii_l2t7_req_vld(sii_l2t7_req_vld),
  .sii_l2t7_req(sii_l2t7_req[31:0]),
  .sii_l2b7_ecc(sii_l2b7_ecc[6:0]),
  .sii_dbg1_l2t7_req(sii_dbg1_l2t7_req[1:0]),
  .ncu_sii_niuctag_uei(ncu_sii_niuctag_uei),
  .ncu_sii_niuctag_cei(ncu_sii_niuctag_cei),
  .ncu_sii_niua_pei(ncu_sii_niua_pei),
  .ncu_sii_niud_pei(ncu_sii_niud_pei),
  .ncu_sii_dmuctag_uei(ncu_sii_dmuctag_uei),
  .ncu_sii_dmuctag_cei(ncu_sii_dmuctag_cei),
  .ncu_sii_dmua_pei(ncu_sii_dmua_pei),
  .ncu_sii_dmud_pei(ncu_sii_dmud_pei),
  .ncu_sii_gnt(ncu_sii_gnt),
  .ncu_sii_pm(ncu_sii_pm),
  .ncu_sii_ba01(ncu_sii_ba01),
  .ncu_sii_ba23(ncu_sii_ba23),
  .ncu_sii_ba45(ncu_sii_ba45),
  .ncu_sii_ba67(ncu_sii_ba67),
  .ncu_sii_l2_idx_hash_en(ncu_sii_l2_idx_hash_en),
  .sii_ncu_niuctag_ue(sii_ncu_niuctag_ue),
  .sii_ncu_niuctag_ce(sii_ncu_niuctag_ce),
  .sii_ncu_niua_pe(sii_ncu_niua_pe),
  .sii_ncu_niud_pe(sii_ncu_niud_pe),
  .sii_ncu_dmuctag_ue(sii_ncu_dmuctag_ue),
  .sii_ncu_dmuctag_ce(sii_ncu_dmuctag_ce),
  .sii_ncu_dmua_pe(sii_ncu_dmua_pe),
  .sii_ncu_dmud_pe(sii_ncu_dmud_pe),
  .sii_ncu_syn_data(sii_ncu_syn_data[3:0]),
  .sii_ncu_syn_vld(sii_ncu_syn_vld),
  .sii_ncu_dparity(sii_ncu_dparity[1:0]),
  .sii_ncu_data(sii_ncu_data[31:0]),
  .sii_ncu_req(sii_ncu_req),
  .niu_sii_hdr_vld(niu_sii_hdr_vld),
  .niu_sii_reqbypass(niu_sii_reqbypass),
  .niu_sii_datareq(niu_sii_datareq),
  .niu_sii_data(niu_sii_data[127:0]),
  .niu_sii_parity(niu_sii_parity[7:0]),
  .sii_niu_oqdq(sii_niu_oqdq),
  .sii_niu_bqdq(sii_niu_bqdq),
  .dmu_sii_hdr_vld(dmu_sii_hdr_vld),
  .dmu_sii_reqbypass(dmu_sii_reqbypass),
  .dmu_sii_datareq(dmu_sii_datareq),
  .dmu_sii_datareq16(dmu_sii_datareq16),
  .dmu_sii_data(dmu_sii_data[127:0]),
  .dmu_sii_parity(dmu_sii_parity[7:0]),
  .dmu_sii_be_parity(dmu_sii_be_parity),
  .dmu_sii_be(dmu_sii_be[15:0]),
  .sii_dmu_wrack_vld(sii_dmu_wrack_vld),
  .sii_dmu_wrack_tag(sii_dmu_wrack_tag[3:0]),
  .sii_dmu_wrack_parity(sii_dmu_wrack_parity),
  .sio_sii_opcc_ipcc_niu_by_deq(sio_sii_opcc_ipcc_niu_by_deq),
  .sio_sii_opcc_ipcc_niu_by_cnt(sio_sii_opcc_ipcc_niu_by_cnt[3:0]),
  .sio_sii_opcc_ipcc_niu_or_deq(sio_sii_opcc_ipcc_niu_or_deq),
  .sio_sii_opcc_ipcc_dmu_by_deq(sio_sii_opcc_ipcc_dmu_by_deq),
  .sio_sii_opcc_ipcc_dmu_by_cnt(sio_sii_opcc_ipcc_dmu_by_cnt[3:0]),
  .sio_sii_opcc_ipcc_dmu_or_deq(sio_sii_opcc_ipcc_dmu_or_deq),
  .sio_sii_olc0_ilc0_dequeue(sio_sii_olc0_ilc0_dequeue),
  .sio_sii_olc1_ilc1_dequeue(sio_sii_olc1_ilc1_dequeue),
  .sio_sii_olc2_ilc2_dequeue(sio_sii_olc2_ilc2_dequeue),
  .sio_sii_olc3_ilc3_dequeue(sio_sii_olc3_ilc3_dequeue),
  .sio_sii_olc4_ilc4_dequeue(sio_sii_olc4_ilc4_dequeue),
  .sio_sii_olc5_ilc5_dequeue(sio_sii_olc5_ilc5_dequeue),
  .sio_sii_olc6_ilc6_dequeue(sio_sii_olc6_ilc6_dequeue),
  .sio_sii_olc7_ilc7_dequeue(sio_sii_olc7_ilc7_dequeue)

  );
`endif  // OPENSPARC_CMP

//________________________________________________________________

// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
sio sio (
  .gclk                     ( cmp_gclk_c1_sio ), // cmp_gclk_c2_r[4]		) ,
  .tcu_sio_clk_stop	( gl_sio_clk_stop ),	// staged clk_stop
  .tcu_sio_io_clk_stop	( gl_sio_io_clk_stop ), // staged clk_stop
  .ccu_io_out	( gl_io_out_c1m ),	// staged div phase
  .scan_in		    (mcu2_scan_out              ),
  .scan_out		    (sio_scan_out		),
  .ccu_io_cmp_sync_en ( gl_io_cmp_sync_en_c1m ),
  .ccu_cmp_io_sync_en ( gl_cmp_io_sync_en_c1m ),
  //.tcu_soc4cmp_clk_stop	(tcu_sio_clk_stop		  ),
  //.tcu_soc6io_clk_stop	(tcu_sio_io_clk_stop	   ),
  .tcu_pce_ov_in	    (tcu_pce_ov),
  .l2b0_sio_data(l2b0_sio_data_t4lff[ 31 : 0 ]),
  .l2b0_sio_parity(l2b0_sio_parity_t5lff[ 1 : 0 ]),
  .l2b0_sio_ctag_vld(l2b0_sio_ctag_vld_t4lff),
  .l2b0_sio_ue_err(l2b0_sio_ue_err_t4lff),
  .l2b1_sio_data(l2b1_sio_data_ccxlff[ 31 : 0 ]),
  .l2b1_sio_parity(l2b1_sio_parity_ccxlff[ 1 : 0 ]),
  .l2b1_sio_ctag_vld(l2b1_sio_ctag_vld_ccxlff),
  .l2b1_sio_ue_err(l2b1_sio_ue_err_ccxlff),
  .l2b2_sio_data(l2b2_sio_data_ccxlff[ 31 : 0 ]),
  .l2b2_sio_parity(l2b2_sio_parity_ccxlff[ 1 : 0 ]),
  .l2b2_sio_ctag_vld(l2b2_sio_ctag_vld_ccxlff),
  .l2b2_sio_ue_err(l2b2_sio_ue_err_ccxlff),
  .l2b3_sio_data(l2b3_sio_data_ccxlff[ 31 : 0 ]),
  .l2b3_sio_parity(l2b3_sio_parity_ccxlff[ 1 : 0 ]),
  .l2b3_sio_ctag_vld(l2b3_sio_ctag_vld_ccxlff),
  .l2b3_sio_ue_err(l2b3_sio_ue_err_ccxlff),
  .l2b4_sio_data(l2b4_sio_data_t4rff[ 31 : 0 ]),
  .l2b4_sio_parity(l2b4_sio_parity_t4rff[ 1 : 0 ]),
  .l2b4_sio_ctag_vld(l2b4_sio_ctag_vld_t4rff),
  .l2b4_sio_ue_err(l2b4_sio_ue_err_t4rff),
  .tcu_dbr_gateoff(tcu_dbr_gateoff),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .tcu_div_bypass(tcu_div_bypass),
  .cluster_arst_l(cluster_arst_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .sio_tcu_vld(sio_tcu_vld),
  .sio_tcu_data(sio_tcu_data),
  .tcu_sio_mbist_start(tcu_sio_mbist_start[1:0]),
  .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
  .sio_tcu_mbist_done(sio_tcu_mbist_done[1:0]),
  .sio_tcu_mbist_fail(sio_tcu_mbist_fail[1:0]),
  .tcu_sio_mbist_scan_in(tcu_sio_mbist_scan_in),
  .sio_tcu_mbist_scan_out(sio_tcu_mbist_scan_out),
  .l2b5_sio_ctag_vld(l2b5_sio_ctag_vld),
  .l2b5_sio_data(l2b5_sio_data[31:0]),
  .l2b5_sio_parity(l2b5_sio_parity[1:0]),
  .l2b5_sio_ue_err(l2b5_sio_ue_err),
  .l2b6_sio_ctag_vld(l2b6_sio_ctag_vld),
  .l2b6_sio_data(l2b6_sio_data[31:0]),
  .l2b6_sio_parity(l2b6_sio_parity[1:0]),
  .l2b6_sio_ue_err(l2b6_sio_ue_err),
  .l2b7_sio_ctag_vld(l2b7_sio_ctag_vld),
  .l2b7_sio_data(l2b7_sio_data[31:0]),
  .l2b7_sio_parity(l2b7_sio_parity[1:0]),
  .l2b7_sio_ue_err(l2b7_sio_ue_err),
  .niu_sio_dq(niu_sio_dq),
  .sio_niu_hdr_vld(sio_niu_hdr_vld),
  .sio_niu_datareq(sio_niu_datareq),
  .sio_niu_data(sio_niu_data[127:0]),
  .sio_niu_parity(sio_niu_parity[7:0]),
  .sio_dmu_hdr_vld(sio_dmu_hdr_vld),
  .sio_dmu_data(sio_dmu_data[127:0]),
  .sio_dmu_parity(sio_dmu_parity[7:0]),
  .sio_sii_opcc_ipcc_niu_by_deq(sio_sii_opcc_ipcc_niu_by_deq),
  .sio_sii_opcc_ipcc_niu_by_cnt(sio_sii_opcc_ipcc_niu_by_cnt[3:0]),
  .sio_sii_opcc_ipcc_niu_or_deq(sio_sii_opcc_ipcc_niu_or_deq),
  .sio_sii_opcc_ipcc_dmu_by_deq(sio_sii_opcc_ipcc_dmu_by_deq),
  .sio_sii_opcc_ipcc_dmu_by_cnt(sio_sii_opcc_ipcc_dmu_by_cnt[3:0]),
  .sio_sii_opcc_ipcc_dmu_or_deq(sio_sii_opcc_ipcc_dmu_or_deq),
  .sio_sii_olc0_ilc0_dequeue(sio_sii_olc0_ilc0_dequeue),
  .sio_sii_olc1_ilc1_dequeue(sio_sii_olc1_ilc1_dequeue),
  .sio_sii_olc2_ilc2_dequeue(sio_sii_olc2_ilc2_dequeue),
  .sio_sii_olc3_ilc3_dequeue(sio_sii_olc3_ilc3_dequeue),
  .sio_sii_olc4_ilc4_dequeue(sio_sii_olc4_ilc4_dequeue),
  .sio_sii_olc5_ilc5_dequeue(sio_sii_olc5_ilc5_dequeue),
  .sio_sii_olc6_ilc6_dequeue(sio_sii_olc6_ilc6_dequeue),
  .sio_sii_olc7_ilc7_dequeue(sio_sii_olc7_ilc7_dequeue),
  .sio_ncu_ctag_ue(sio_ncu_ctag_ue),
  .sio_ncu_ctag_ce(sio_ncu_ctag_ce),
  .ncu_sio_ctag_cei(ncu_sio_ctag_cei),
  .ncu_sio_ctag_uei(ncu_sio_ctag_uei),
  .ncu_sio_d_pei(ncu_sio_d_pei)
 ) ;
`endif  // OPENSPARC_CMP

//________________________________________________________________

// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
ncu ncu(

  .gclk                     ( cmp_gclk_c3_ncu ), // cmp_gclk_c0_r[3]		) ,
  .tcu_ncu_io_clk_stop	( gl_ncu_io_clk_stop ), // staged clk_stop
  .tcu_ncu_clk_stop	( gl_ncu_clk_stop ),	// staged clk_stop
  .ccu_io_out	( gl_io_out_c3t ),	// staged div phase
  .ccu_io_cmp_sync_en ( gl_io_cmp_sync_en_c3t ),
  .ccu_cmp_io_sync_en ( gl_cmp_io_sync_en_c3t ),
  .scan_in		    (tcu_socg_scan_out		),
  .scan_out		    (ncu_scan_out		),
  .tcu_scan_en(tcu_scan_en),
  .tcu_ncu_mbist_start({tcu_ncu_mbist_start[ 1 ],tcu_ncu_mbist_start_t1lff_0}),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_dbr_gateoff(tcu_dbr_gateoff),
  .ncu_tcu_mbist_done(ncu_tcu_mbist_done[1:0]),
  .ncu_tcu_mbist_fail(ncu_tcu_mbist_fail[1:0]),
  .tcu_ncu_mbist_scan_in(tcu_ncu_mbist_scan_in),
  .ncu_tcu_mbist_scan_out(ncu_tcu_mbist_scan_out),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
  .ncu_pcx_stall_pq(ncu_pcx_stall_pq),
  .pcx_ncu_data_px2(pcx_ncu_data_px2[129:0]),
  .pcx_ncu_data_rdy_px1(pcx_ncu_data_rdy_px1),
  .ncu_cpx_data_ca(ncu_cpx_data_ca[145:0]),
  .ncu_cpx_req_cq(ncu_cpx_req_cq[7:0]),
  .cpx_ncu_grant_cx(cpx_ncu_grant_cx[7:0]),
  .ncu_dmu_pio_data(ncu_dmu_pio_data[63:0]),
  .ncu_dmu_pio_hdr_vld(ncu_dmu_pio_hdr_vld),
  .ncu_dmu_mmu_addr_vld(ncu_dmu_mmu_addr_vld),
  .dmu_ncu_wrack_vld(dmu_ncu_wrack_vld),
  .dmu_ncu_wrack_tag(dmu_ncu_wrack_tag[3:0]),
  .ncu_dmu_mondo_ack(ncu_dmu_mondo_ack),
  .ncu_dmu_mondo_nack(ncu_dmu_mondo_nack),
  .ncu_dmu_mondo_id(ncu_dmu_mondo_id[5:0]),
  .ncu_dmu_vld(ncu_dmu_vld),
  .ncu_dmu_data(ncu_dmu_data[31:0]),
  .dmu_ncu_stall(dmu_ncu_stall),
  .dmu_ncu_vld(dmu_ncu_vld),
  .dmu_ncu_data(dmu_ncu_data[31:0]),
  .ncu_dmu_stall(ncu_dmu_stall),
  .ncu_ccu_vld(ncu_ccu_vld),
  .ncu_ccu_data(ncu_ccu_data[3:0]),
  .ccu_ncu_data(ccu_ncu_data[3:0]),
  .ccu_ncu_vld(ccu_ncu_vld),
  .ccu_ncu_stall(ccu_ncu_stall),
  .ncu_ccu_stall(ncu_ccu_stall),
  .ncu_mcu0_vld(ncu_mcu0_vld),
  .ncu_mcu0_data(ncu_mcu0_data[3:0]),
  .mcu0_ncu_stall(mcu0_ncu_stall),
  .mcu0_ncu_vld(mcu0_ncu_vld),
  .mcu0_ncu_data(mcu0_ncu_data[3:0]),
  .ncu_mcu0_stall(ncu_mcu0_stall),
  .ncu_mcu1_vld(ncu_mcu1_vld),
  .ncu_mcu1_data(ncu_mcu1_data[3:0]),
  .mcu1_ncu_stall(mcu1_ncu_stall),
  .mcu1_ncu_vld(mcu1_ncu_vld),
  .mcu1_ncu_data(mcu1_ncu_data[3:0]),
  .ncu_mcu1_stall(ncu_mcu1_stall),
  .ncu_mcu2_vld(ncu_mcu2_vld),
  .ncu_mcu2_data(ncu_mcu2_data[3:0]),
  .mcu2_ncu_stall(mcu2_ncu_stall),
  .mcu2_ncu_vld(mcu2_ncu_vld),
  .mcu2_ncu_data(mcu2_ncu_data[3:0]),
  .ncu_mcu2_stall(ncu_mcu2_stall),
  .ncu_mcu3_vld(ncu_mcu3_vld),
  .ncu_mcu3_data(ncu_mcu3_data[3:0]),
  .mcu3_ncu_stall(mcu3_ncu_stall),
  .mcu3_ncu_vld(mcu3_ncu_vld),
  .mcu3_ncu_data(mcu3_ncu_data[3:0]),
  .ncu_mcu3_stall(ncu_mcu3_stall),
  .ncu_niu_vld(ncu_niu_vld),
  .ncu_niu_data(ncu_niu_data[31:0]),
  .niu_ncu_stall(niu_ncu_stall),
  .niu_ncu_vld(niu_ncu_vld),
  .niu_ncu_data(niu_ncu_data[31:0]),
  .ncu_niu_stall(ncu_niu_stall),
  .ncu_tcu_vld(ncu_tcu_vld),
  .ncu_tcu_data(ncu_tcu_data[7:0]),
  .tcu_ncu_stall(tcu_ncu_stall),
  .tcu_ncu_vld(tcu_ncu_vld),
  .tcu_ncu_data(tcu_ncu_data[7:0]),
  .ncu_tcu_stall(ncu_tcu_stall),
  .ncu_mio_ssi_mosi(ncu_mio_ssi_mosi),
  .ncu_mio_ssi_sck(ncu_mio_ssi_sck),
  .mio_ncu_ssi_miso(mio_ncu_ssi_miso),
  .mio_ncu_ext_int_l(mio_ncu_ext_int_l),
  .ncu_rst_vld(ncu_rst_vld),
  .ncu_rst_data(ncu_rst_data[3:0]),
  .rst_ncu_stall(rst_ncu_stall),
  .rst_ncu_vld(rst_ncu_vld),
  .rst_ncu_data(rst_ncu_data[3:0]),
  .ncu_rst_stall(ncu_rst_stall),
  .efu_ncu_fuse_data(efu_ncu_fuse_data),
  .efu_ncu_srlnum0_xfer_en(efu_ncu_srlnum0_xfer_en),
  .efu_ncu_srlnum1_xfer_en(efu_ncu_srlnum1_xfer_en),
  .efu_ncu_srlnum2_xfer_en(efu_ncu_srlnum2_xfer_en),
  .efu_ncu_fusestat_xfer_en(efu_ncu_fusestat_xfer_en),
  .efu_ncu_coreavl_xfer_en(efu_ncu_coreavl_xfer_en),
  .efu_ncu_bankavl_xfer_en(efu_ncu_bankavl_xfer_en),
  .sii_ncu_req(sii_ncu_req),
  .ncu_sii_gnt(ncu_sii_gnt),
  .sii_ncu_data(sii_ncu_data[31:0]),
  .rst_ncu_unpark_thread(rst_ncu_unpark_thread),
  .rst_ncu_xir_(rst_ncu_xir_),
  .ncu_rst_xir_done(ncu_rst_xir_done),
  .ncu_cmp_tick_enable(ncu_cmp_tick_enable),
  .ncu_wmr_vec_mask(ncu_wmr_vec_mask),
  .ncu_spc0_core_available(ncu_spc0_core_available),
  .ncu_spc1_core_available(ncu_spc1_core_available),
  .ncu_spc2_core_available(ncu_spc2_core_available),
  .ncu_spc3_core_available(ncu_spc3_core_available),
  .ncu_spc4_core_available(ncu_spc4_core_available),
  .ncu_spc5_core_available(ncu_spc5_core_available),
  .ncu_spc6_core_available(ncu_spc6_core_available),
  .ncu_spc7_core_available(ncu_spc7_core_available),
  .ncu_spc0_core_enable_status(ncu_spc0_core_enable_status),
  .ncu_spc1_core_enable_status(ncu_spc1_core_enable_status),
  .ncu_spc2_core_enable_status(ncu_spc2_core_enable_status),
  .ncu_spc3_core_enable_status(ncu_spc3_core_enable_status),
  .ncu_spc4_core_enable_status(ncu_spc4_core_enable_status),
  .ncu_spc5_core_enable_status(ncu_spc5_core_enable_status),
  .ncu_spc6_core_enable_status(ncu_spc6_core_enable_status),
  .ncu_spc7_core_enable_status(ncu_spc7_core_enable_status),
  .ncu_spc0_core_running(ncu_spc0_core_running[7:0]),
  .ncu_spc1_core_running(ncu_spc1_core_running[7:0]),
  .ncu_spc2_core_running(ncu_spc2_core_running[7:0]),
  .ncu_spc3_core_running(ncu_spc3_core_running[7:0]),
  .ncu_spc4_core_running(ncu_spc4_core_running[7:0]),
  .ncu_spc5_core_running(ncu_spc5_core_running[7:0]),
  .ncu_spc6_core_running(ncu_spc6_core_running[7:0]),
  .ncu_spc7_core_running(ncu_spc7_core_running[7:0]),
  .spc0_ncu_core_running_status(spc0_ncu_core_running_status[7:0]),
  .spc1_ncu_core_running_status(spc1_ncu_core_running_status[7:0]),
  .spc2_ncu_core_running_status(spc2_ncu_core_running_status[7:0]),
  .spc3_ncu_core_running_status(spc3_ncu_core_running_status[7:0]),
  .spc4_ncu_core_running_status(spc4_ncu_core_running_status[7:0]),
  .spc5_ncu_core_running_status(spc5_ncu_core_running_status[7:0]),
  .spc6_ncu_core_running_status(spc6_ncu_core_running_status[7:0]),
  .spc7_ncu_core_running_status(spc7_ncu_core_running_status[7:0]),
  .ncu_spc_pm(ncu_spc_pm),
  .ncu_spc_ba01(ncu_spc_ba01),
  .ncu_spc_ba23(ncu_spc_ba23),
  .ncu_spc_ba45(ncu_spc_ba45),
  .ncu_spc_ba67(ncu_spc_ba67),
  .ncu_spc_l2_idx_hash_en(ncu_spc_l2_idx_hash_en),
  .ncu_sii_pm(ncu_sii_pm),
  .ncu_sii_ba01(ncu_sii_ba01),
  .ncu_sii_ba23(ncu_sii_ba23),
  .ncu_sii_ba45(ncu_sii_ba45),
  .ncu_sii_ba67(ncu_sii_ba67),
  .ncu_sii_l2_idx_hash_en(ncu_sii_l2_idx_hash_en),
  .ncu_l2t_pm(ncu_l2t_pm),
  .ncu_l2t_ba01(ncu_l2t_ba01),
  .ncu_l2t_ba23(ncu_l2t_ba23),
  .ncu_l2t_ba45(ncu_l2t_ba45),
  .ncu_l2t_ba67(ncu_l2t_ba67),
  .ncu_mcu_pm(ncu_mcu_pm),
  .ncu_mcu_ba01(ncu_mcu_ba01),
  .ncu_mcu_ba23(ncu_mcu_ba23),
  .ncu_mcu_ba45(ncu_mcu_ba45),
  .ncu_mcu_ba67(ncu_mcu_ba67),
  .ncu_rst_fatal_error(ncu_rst_fatal_error),
  .ncu_tcu_bank_avail(ncu_tcu_bank_avail[7:0]),
  .sii_ncu_dparity(sii_ncu_dparity[1:0]),
  .sii_ncu_niuctag_ue(sii_ncu_niuctag_ue),
  .ncu_sii_niuctag_uei(ncu_sii_niuctag_uei),
  .sii_ncu_niuctag_ce(sii_ncu_niuctag_ce),
  .ncu_sii_niuctag_cei(ncu_sii_niuctag_cei),
  .sii_ncu_niua_pe(sii_ncu_niua_pe),
  .ncu_sii_niua_pei(ncu_sii_niua_pei),
  .sii_ncu_niud_pe(sii_ncu_niud_pe),
  .ncu_sii_niud_pei(ncu_sii_niud_pei),
  .sii_ncu_dmuctag_ue(sii_ncu_dmuctag_ue),
  .ncu_sii_dmuctag_uei(ncu_sii_dmuctag_uei),
  .sii_ncu_dmuctag_ce(sii_ncu_dmuctag_ce),
  .ncu_sii_dmuctag_cei(ncu_sii_dmuctag_cei),
  .sii_ncu_dmua_pe(sii_ncu_dmua_pe),
  .ncu_sii_dmua_pei(ncu_sii_dmua_pei),
  .sii_ncu_dmud_pe(sii_ncu_dmud_pe),
  .ncu_sii_dmud_pei(ncu_sii_dmud_pei),
  .sii_ncu_syn_vld(sii_ncu_syn_vld),
  .sii_ncu_syn_data(sii_ncu_syn_data[3:0]),
  .tcu_sck_bypass(tcu_sck_bypass),
  .sio_ncu_ctag_ce(sio_ncu_ctag_ce),
  .ncu_sio_ctag_cei(ncu_sio_ctag_cei),
  .sio_ncu_ctag_ue(sio_ncu_ctag_ue),
  .ncu_sio_ctag_uei(ncu_sio_ctag_uei),
  .ncu_sio_d_pei(ncu_sio_d_pei),
  .niu_ncu_ctag_ue(niu_ncu_ctag_ue),
  .ncu_niu_ctag_uei(ncu_niu_ctag_uei),
  .niu_ncu_ctag_ce(niu_ncu_ctag_ce),
  .ncu_niu_ctag_cei(ncu_niu_ctag_cei),
  .niu_ncu_d_pe(niu_ncu_d_pe),
  .ncu_niu_d_pei(ncu_niu_d_pei),
  .dmu_ncu_wrack_par(dmu_ncu_wrack_par),
  .ncu_dmu_mondo_id_par(ncu_dmu_mondo_id_par),
  .dmu_ncu_d_pe(dmu_ncu_d_pe),
  .ncu_dmu_d_pei(ncu_dmu_d_pei),
  .dmu_ncu_siicr_pe(dmu_ncu_siicr_pe),
  .ncu_dmu_siicr_pei(ncu_dmu_siicr_pei),
  .dmu_ncu_ctag_ue(dmu_ncu_ctag_ue),
  .ncu_dmu_ctag_uei(ncu_dmu_ctag_uei),
  .dmu_ncu_ctag_ce(dmu_ncu_ctag_ce),
  .ncu_dmu_ctag_cei(ncu_dmu_ctag_cei),
  .dmu_ncu_ncucr_pe(dmu_ncu_ncucr_pe),
  .ncu_dmu_ncucr_pei(ncu_dmu_ncucr_pei),
  .dmu_ncu_ie(dmu_ncu_ie),
  .ncu_dmu_iei(ncu_dmu_iei),
  .mcu0_ncu_ecc(mcu0_ncu_ecc),
  .ncu_mcu0_ecci(ncu_mcu0_ecci),
  .mcu0_ncu_fbr(mcu0_ncu_fbr),
  .ncu_mcu0_fbri(ncu_mcu0_fbri),
  .ncu_mcu0_fbui(ncu_mcu0_fbui),
  .mcu1_ncu_ecc(mcu1_ncu_ecc),
  .ncu_mcu1_ecci(ncu_mcu1_ecci),
  .mcu1_ncu_fbr(mcu1_ncu_fbr),
  .ncu_mcu1_fbri(ncu_mcu1_fbri),
  .ncu_mcu1_fbui(ncu_mcu1_fbui),
  .mcu2_ncu_ecc(mcu2_ncu_ecc),
  .ncu_mcu2_ecci(ncu_mcu2_ecci),
  .mcu2_ncu_fbr(mcu2_ncu_fbr),
  .ncu_mcu2_fbri(ncu_mcu2_fbri),
  .ncu_mcu2_fbui(ncu_mcu2_fbui),
  .mcu3_ncu_ecc(mcu3_ncu_ecc),
  .ncu_mcu3_ecci(ncu_mcu3_ecci),
  .mcu3_ncu_fbr(mcu3_ncu_fbr),
  .ncu_mcu3_fbri(ncu_mcu3_fbri),
  .ncu_mcu3_fbui(ncu_mcu3_fbui),
  .rst_wmr_protect(rst_wmr_protect),
  .cluster_arst_l(cluster_arst_l),
  .ccu_serdes_dtm(ccu_serdes_dtm),
  .tcu_div_bypass(tcu_div_bypass),
  .tcu_atpg_mode(tcu_atpg_mode),
  .ncu_dbg1_error_event(ncu_dbg1_error_event),
  .ncu_dbg1_stall(ncu_dbg1_stall),
  .ncu_dbg1_vld(ncu_dbg1_vld),
  .ncu_dbg1_data(ncu_dbg1_data[3:0]),
  .dbg1_ncu_stall(dbg1_ncu_stall),
  .dbg1_ncu_vld(dbg1_ncu_vld),
  .dbg1_ncu_data(dbg1_ncu_data[3:0])
  );
`endif  // OPENSPARC_CMP

//________________________________________________________________
// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
efu efu(

  .io_vpp                    (VPP                        ),
  .gclk                      ( cmp_gclk_c1_efu ), // cmp_gclk_c0_r[3]           ),
  .tcu_clk_stop	( gl_efu_io_clk_stop ),	// staged clk_stop
  .tcu_efu_clk_stop ( gl_efu_clk_stop ), // staged cmp clk_stop
  .ccu_io_out	( gl_io_out_c1m ),	// staged div phase
  .scan_in                   (mio_scan_out               ),
  .tcu_scan_en               (tcu_scan_en                ),
  .tcu_aclk                  (tcu_aclk                   ),
  .tcu_bclk                  (tcu_bclk                   ),
  .scan_out                  (efu_scan_out               ),
  .tcu_efu_rowaddr           (tcu_efu_rowaddr[ 6 : 0 ]       ),
  .tcu_efu_coladdr           (tcu_efu_coladdr[ 4 : 0 ]       ),
  .io_pgrm_en                (mio_efu_prgm_en            ),
  .tcu_efu_read_en           (tcu_efu_read_en            ),
  .tcu_efu_read_mode         (tcu_efu_read_mode[ 2 : 0 ]     ),
  .tcu_efu_read_start        (tcu_efu_read_start         ),
  .tcu_efu_fuse_bypass       (tcu_efu_fuse_bypass        ),
  .tcu_efu_dest_sample       (tcu_efu_dest_sample        ),
  .tcu_efu_data_in           (tcu_efu_data_in            ),
  .efu_tcu_data_out          (efu_tcu_data_out           ),
  .tcu_efu_updatedr          (tcu_efu_updatedr           ),
  .tcu_efu_shiftdr           (tcu_efu_shiftdr            ),
  .tcu_efu_capturedr         (tcu_efu_capturedr          ),
  .tcu_red_reg_clr           (tcu_efu_rvclr[ 6 : 0 ]         ),
  .rst_wmr_		     		 ( gl_rst_l2_wmr_c1m ), // ( gl_l2_wmr_c1b ), - for int6.1 
  .rst_por_		     		 ( gl_rst_l2_por_c1m ), // ( gl_l2_por_c1t ), - for int6.1 
  .io_cmp_clk_sync_en	     ( gl_io_cmp_sync_en_c1m ), 
  .cmp_io_clk_sync_en	     ( gl_cmp_io_sync_en_c1m ),
  .tck                       (tck                        ),
  .efu_niu_mac01_sfro_data        (efu_niu_mac01_sfro_data ),
  .efu_niu_mac1_sf_xfer_en        (efu_niu_mac1_sf_xfer_en ),
  .efu_niu_mac1_ro_xfer_en        (efu_niu_mac1_ro_xfer_en ),
  .efu_niu_mac0_sf_xfer_en        (efu_niu_mac0_sf_xfer_en ),
  .efu_niu_mac0_ro_xfer_en        (efu_niu_mac0_ro_xfer_en ),
  .efu_niu_ipp1_xfer_en           (efu_niu_ipp1_xfer_en   ),
  .efu_niu_ipp0_xfer_en           (efu_niu_ipp0_xfer_en   ),
  .efu_niu_mac1_sf_clr            (efu_niu_mac1_sf_clr    ),
  .efu_niu_mac1_ro_clr            (efu_niu_mac1_ro_clr    ),
  .efu_niu_mac0_sf_clr            (efu_niu_mac0_sf_clr    ),
  .efu_niu_mac0_ro_clr            (efu_niu_mac0_ro_clr    ),
  .efu_niu_ipp1_clr               (efu_niu_ipp1_clr       ),
  .efu_niu_ipp0_clr               (efu_niu_ipp0_clr       ),

  .niu_efu_mac1_sf_data           (niu_efu_mac1_sf_data),
.niu_efu_mac1_ro_data             (niu_efu_mac1_ro_data),
.niu_efu_mac0_sf_data             (niu_efu_mac0_sf_data),
.niu_efu_mac0_ro_data           (niu_efu_mac0_ro_data),
.niu_efu_ipp1_data              (niu_efu_ipp1_data),
.niu_efu_ipp0_data              (niu_efu_ipp0_data),
.niu_efu_mac1_sf_xfer_en        (niu_efu_mac1_sf_xfer_en),
.niu_efu_mac1_ro_xfer_en        (niu_efu_mac1_ro_xfer_en),
.niu_efu_mac0_sf_xfer_en        (niu_efu_mac0_sf_xfer_en),
.niu_efu_mac0_ro_xfer_en        (niu_efu_mac0_ro_xfer_en),
.niu_efu_ipp1_xfer_en           (niu_efu_ipp1_xfer_en),
.niu_efu_ipp0_xfer_en           (niu_efu_ipp0_xfer_en),
.niu_efu_cfifo0_data            (niu_efu_cfifo0_data),
.niu_efu_cfifo0_xfer_en            (niu_efu_cfifo0_xfer_en),
.niu_efu_cfifo1_data            (niu_efu_cfifo1_data),
.niu_efu_cfifo1_xfer_en            (niu_efu_cfifo1_xfer_en),
.efu_niu_ram_xfer_en            (efu_niu_ram_xfer_en),
.efu_niu_ram0_xfer_en           (efu_niu_ram0_xfer_en),
.efu_niu_ram1_xfer_en           (efu_niu_ram1_xfer_en),
.niu_efu_ram_xfer_en            (niu_efu_ram_xfer_en),
.niu_efu_ram1_xfer_en            (niu_efu_ram1_xfer_en),
.niu_efu_ram0_xfer_en            (niu_efu_ram0_xfer_en),
.niu_efu_ram_data               (niu_efu_ram_data),
.niu_efu_ram0_data              (niu_efu_ram0_data),
.niu_efu_ram1_data              (niu_efu_ram1_data),
.niu_efu_4k_xfer_en             (niu_efu_4k_xfer_en),
.niu_efu_4k_data                (niu_efu_4k_data),
.efu_niu_cfifo_data             (efu_niu_cfifo_data     ),
.efu_niu_cfifo0_xfer_en         (efu_niu_cfifo0_xfer_en  ),
.efu_niu_cfifo1_xfer_en         (efu_niu_cfifo1_xfer_en  ),
.efu_niu_cfifo0_clr             (efu_niu_cfifo0_clr     ),
.efu_niu_cfifo1_clr             (efu_niu_cfifo1_clr     ),
.efu_niu_ram_clr                (efu_niu_ram_clr        ),
.efu_niu_ram0_clr               (efu_niu_ram0_clr       ),
.efu_niu_ram1_clr               (efu_niu_ram1_clr       ),
.efu_mcu_fdi                    (efu_mcu_fdi            ),
.mcu_efu_fdo                    (mcu_efu_fdo            ),
.efu_mcu_fclk                   (efu_mcu_fclk           ),
.efu_mcu_fclrz                  (efu_mcu_fclrz          ),
.efu_niu_fdi                    (efu_niu_fdi            ),
.niu_efu_fdo                    (niu_efu_fdo            ),		
.efu_niu_fclk                   (efu_niu_fclk           ),
.efu_niu_fclrz                  (efu_niu_fclrz          ),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .cluster_arst_l(cluster_arst_l),
  .tcu_pce_ov(tcu_pce_ov),
  .rst_wmr_protect(rst_wmr_protect),
  .tcu_div_bypass(tcu_div_bypass),
  .tcu_dbr_gateoff(tcu_dbr_gateoff),
  .efu_spc1357_fuse_data(efu_spc1357_fuse_data),
  .efu_spc0246_fuse_data(efu_spc0246_fuse_data),
  .efu_spc0_fuse_ixfer_en(efu_spc0_fuse_ixfer_en),
  .efu_spc1_fuse_ixfer_en(efu_spc1_fuse_ixfer_en),
  .efu_spc2_fuse_ixfer_en(efu_spc2_fuse_ixfer_en),
  .efu_spc3_fuse_ixfer_en(efu_spc3_fuse_ixfer_en),
  .efu_spc4_fuse_ixfer_en(efu_spc4_fuse_ixfer_en),
  .efu_spc5_fuse_ixfer_en(efu_spc5_fuse_ixfer_en),
  .efu_spc6_fuse_ixfer_en(efu_spc6_fuse_ixfer_en),
  .efu_spc7_fuse_ixfer_en(efu_spc7_fuse_ixfer_en),
  .efu_spc0_fuse_iclr(efu_spc0_fuse_iclr),
  .efu_spc1_fuse_iclr(efu_spc1_fuse_iclr),
  .efu_spc2_fuse_iclr(efu_spc2_fuse_iclr),
  .efu_spc3_fuse_iclr(efu_spc3_fuse_iclr),
  .efu_spc4_fuse_iclr(efu_spc4_fuse_iclr),
  .efu_spc5_fuse_iclr(efu_spc5_fuse_iclr),
  .efu_spc6_fuse_iclr(efu_spc6_fuse_iclr),
  .efu_spc7_fuse_iclr(efu_spc7_fuse_iclr),
  .efu_spc0_fuse_dxfer_en(efu_spc0_fuse_dxfer_en),
  .efu_spc1_fuse_dxfer_en(efu_spc1_fuse_dxfer_en),
  .efu_spc2_fuse_dxfer_en(efu_spc2_fuse_dxfer_en),
  .efu_spc3_fuse_dxfer_en(efu_spc3_fuse_dxfer_en),
  .efu_spc4_fuse_dxfer_en(efu_spc4_fuse_dxfer_en),
  .efu_spc5_fuse_dxfer_en(efu_spc5_fuse_dxfer_en),
  .efu_spc6_fuse_dxfer_en(efu_spc6_fuse_dxfer_en),
  .efu_spc7_fuse_dxfer_en(efu_spc7_fuse_dxfer_en),
  .efu_spc0_fuse_dclr(efu_spc0_fuse_dclr),
  .efu_spc1_fuse_dclr(efu_spc1_fuse_dclr),
  .efu_spc2_fuse_dclr(efu_spc2_fuse_dclr),
  .efu_spc3_fuse_dclr(efu_spc3_fuse_dclr),
  .efu_spc4_fuse_dclr(efu_spc4_fuse_dclr),
  .efu_spc5_fuse_dclr(efu_spc5_fuse_dclr),
  .efu_spc6_fuse_dclr(efu_spc6_fuse_dclr),
  .efu_spc7_fuse_dclr(efu_spc7_fuse_dclr),
  .spc0_efu_fuse_dxfer_en(spc0_efu_fuse_dxfer_en),
  .spc1_efu_fuse_dxfer_en(spc1_efu_fuse_dxfer_en),
  .spc2_efu_fuse_dxfer_en(spc2_efu_fuse_dxfer_en),
  .spc3_efu_fuse_dxfer_en(spc3_efu_fuse_dxfer_en),
  .spc4_efu_fuse_dxfer_en(spc4_efu_fuse_dxfer_en),
  .spc5_efu_fuse_dxfer_en(spc5_efu_fuse_dxfer_en),
  .spc6_efu_fuse_dxfer_en(spc6_efu_fuse_dxfer_en),
  .spc7_efu_fuse_dxfer_en(spc7_efu_fuse_dxfer_en),
  .spc0_efu_fuse_ixfer_en(spc0_efu_fuse_ixfer_en),
  .spc1_efu_fuse_ixfer_en(spc1_efu_fuse_ixfer_en),
  .spc2_efu_fuse_ixfer_en(spc2_efu_fuse_ixfer_en),
  .spc3_efu_fuse_ixfer_en(spc3_efu_fuse_ixfer_en),
  .spc4_efu_fuse_ixfer_en(spc4_efu_fuse_ixfer_en),
  .spc5_efu_fuse_ixfer_en(spc5_efu_fuse_ixfer_en),
  .spc6_efu_fuse_ixfer_en(spc6_efu_fuse_ixfer_en),
  .spc7_efu_fuse_ixfer_en(spc7_efu_fuse_ixfer_en),
  .spc0_efu_fuse_ddata(spc0_efu_fuse_ddata),
  .spc1_efu_fuse_ddata(spc1_efu_fuse_ddata),
  .spc2_efu_fuse_ddata(spc2_efu_fuse_ddata),
  .spc3_efu_fuse_ddata(spc3_efu_fuse_ddata),
  .spc4_efu_fuse_ddata(spc4_efu_fuse_ddata),
  .spc5_efu_fuse_ddata(spc5_efu_fuse_ddata),
  .spc6_efu_fuse_ddata(spc6_efu_fuse_ddata),
  .spc7_efu_fuse_ddata(spc7_efu_fuse_ddata),
  .spc0_efu_fuse_idata(spc0_efu_fuse_idata),
  .spc1_efu_fuse_idata(spc1_efu_fuse_idata),
  .spc2_efu_fuse_idata(spc2_efu_fuse_idata),
  .spc3_efu_fuse_idata(spc3_efu_fuse_idata),
  .spc4_efu_fuse_idata(spc4_efu_fuse_idata),
  .spc5_efu_fuse_idata(spc5_efu_fuse_idata),
  .spc6_efu_fuse_idata(spc6_efu_fuse_idata),
  .spc7_efu_fuse_idata(spc7_efu_fuse_idata),
  .efu_l2t0246_fuse_data(efu_l2t0246_fuse_data),
  .efu_l2t1357_fuse_data(efu_l2t1357_fuse_data),
  .efu_l2t0_fuse_xfer_en(efu_l2t0_fuse_xfer_en),
  .efu_l2t1_fuse_xfer_en(efu_l2t1_fuse_xfer_en),
  .efu_l2t2_fuse_xfer_en(efu_l2t2_fuse_xfer_en),
  .efu_l2t3_fuse_xfer_en(efu_l2t3_fuse_xfer_en),
  .efu_l2t4_fuse_xfer_en(efu_l2t4_fuse_xfer_en),
  .efu_l2t5_fuse_xfer_en(efu_l2t5_fuse_xfer_en),
  .efu_l2t6_fuse_xfer_en(efu_l2t6_fuse_xfer_en),
  .efu_l2t7_fuse_xfer_en(efu_l2t7_fuse_xfer_en),
  .efu_l2t0_fuse_clr(efu_l2t0_fuse_clr),
  .efu_l2t1_fuse_clr(efu_l2t1_fuse_clr),
  .efu_l2t2_fuse_clr(efu_l2t2_fuse_clr),
  .efu_l2t3_fuse_clr(efu_l2t3_fuse_clr),
  .efu_l2t4_fuse_clr(efu_l2t4_fuse_clr),
  .efu_l2t5_fuse_clr(efu_l2t5_fuse_clr),
  .efu_l2t6_fuse_clr(efu_l2t6_fuse_clr),
  .efu_l2t7_fuse_clr(efu_l2t7_fuse_clr),
  .l2t0_efu_fuse_xfer_en(l2t0_efu_fuse_xfer_en),
  .l2t1_efu_fuse_xfer_en(l2t1_efu_fuse_xfer_en),
  .l2t2_efu_fuse_xfer_en(l2t2_efu_fuse_xfer_en),
  .l2t3_efu_fuse_xfer_en(l2t3_efu_fuse_xfer_en),
  .l2t4_efu_fuse_xfer_en(l2t4_efu_fuse_xfer_en),
  .l2t5_efu_fuse_xfer_en(l2t5_efu_fuse_xfer_en),
  .l2t6_efu_fuse_xfer_en(l2t6_efu_fuse_xfer_en),
  .l2t7_efu_fuse_xfer_en(l2t7_efu_fuse_xfer_en),
  .l2t0_efu_fuse_data(l2t0_efu_fuse_data),
  .l2t1_efu_fuse_data(l2t1_efu_fuse_data),
  .l2t2_efu_fuse_data(l2t2_efu_fuse_data),
  .l2t3_efu_fuse_data(l2t3_efu_fuse_data),
  .l2t4_efu_fuse_data(l2t4_efu_fuse_data),
  .l2t5_efu_fuse_data(l2t5_efu_fuse_data),
  .l2t6_efu_fuse_data(l2t6_efu_fuse_data),
  .l2t7_efu_fuse_data(l2t7_efu_fuse_data),
  .efu_l2b0246_fuse_data(efu_l2b0246_fuse_data),
  .efu_l2b1357_fuse_data(efu_l2b1357_fuse_data),
  .efu_l2b0_fuse_xfer_en(efu_l2b0_fuse_xfer_en),
  .efu_l2b1_fuse_xfer_en(efu_l2b1_fuse_xfer_en),
  .efu_l2b2_fuse_xfer_en(efu_l2b2_fuse_xfer_en),
  .efu_l2b3_fuse_xfer_en(efu_l2b3_fuse_xfer_en),
  .efu_l2b4_fuse_xfer_en(efu_l2b4_fuse_xfer_en),
  .efu_l2b5_fuse_xfer_en(efu_l2b5_fuse_xfer_en),
  .efu_l2b6_fuse_xfer_en(efu_l2b6_fuse_xfer_en),
  .efu_l2b7_fuse_xfer_en(efu_l2b7_fuse_xfer_en),
  .efu_l2b0_fuse_clr(efu_l2b0_fuse_clr),
  .efu_l2b1_fuse_clr(efu_l2b1_fuse_clr),
  .efu_l2b2_fuse_clr(efu_l2b2_fuse_clr),
  .efu_l2b3_fuse_clr(efu_l2b3_fuse_clr),
  .efu_l2b4_fuse_clr(efu_l2b4_fuse_clr),
  .efu_l2b5_fuse_clr(efu_l2b5_fuse_clr),
  .efu_l2b6_fuse_clr(efu_l2b6_fuse_clr),
  .efu_l2b7_fuse_clr(efu_l2b7_fuse_clr),
  .l2b0_efu_fuse_xfer_en(l2b0_efu_fuse_xfer_en),
  .l2b1_efu_fuse_xfer_en(l2b1_efu_fuse_xfer_en),
  .l2b2_efu_fuse_xfer_en(l2b2_efu_fuse_xfer_en),
  .l2b3_efu_fuse_xfer_en(l2b3_efu_fuse_xfer_en),
  .l2b4_efu_fuse_xfer_en(l2b4_efu_fuse_xfer_en),
  .l2b5_efu_fuse_xfer_en(l2b5_efu_fuse_xfer_en),
  .l2b6_efu_fuse_xfer_en(l2b6_efu_fuse_xfer_en),
  .l2b7_efu_fuse_xfer_en(l2b7_efu_fuse_xfer_en),
  .l2b0_efu_fuse_data(l2b0_efu_fuse_data),
  .l2b1_efu_fuse_data(l2b1_efu_fuse_data),
  .l2b2_efu_fuse_data(l2b2_efu_fuse_data),
  .l2b3_efu_fuse_data(l2b3_efu_fuse_data),
  .l2b4_efu_fuse_data(l2b4_efu_fuse_data),
  .l2b5_efu_fuse_data(l2b5_efu_fuse_data),
  .l2b6_efu_fuse_data(l2b6_efu_fuse_data),
  .l2b7_efu_fuse_data(l2b7_efu_fuse_data),
  .efu_ncu_fuse_data(efu_ncu_fuse_data),
  .efu_ncu_srlnum0_xfer_en(efu_ncu_srlnum0_xfer_en),
  .efu_ncu_srlnum1_xfer_en(efu_ncu_srlnum1_xfer_en),
  .efu_ncu_srlnum2_xfer_en(efu_ncu_srlnum2_xfer_en),
  .efu_ncu_fusestat_xfer_en(efu_ncu_fusestat_xfer_en),
  .efu_ncu_coreavl_xfer_en(efu_ncu_coreavl_xfer_en),
  .efu_ncu_bankavl_xfer_en(efu_ncu_bankavl_xfer_en),
  .efu_niu_ram_data(efu_niu_ram_data),
  .efu_niu_4k_data(efu_niu_4k_data),
  .efu_niu_4k_xfer_en(efu_niu_4k_xfer_en),
  .efu_niu_4k_clr(efu_niu_4k_clr),
  .efu_dmu_data(efu_dmu_data),
  .efu_dmu_xfer_en(efu_dmu_xfer_en),
  .efu_dmu_clr(efu_dmu_clr),
  .dmu_efu_xfer_en(dmu_efu_xfer_en),
  .dmu_efu_data(dmu_efu_data),
  .efu_psr_fdi(efu_psr_fdi),
  .psr_efu_fdo(psr_efu_fdo),
  .efu_psr_fclk(efu_psr_fclk),
  .efu_psr_fclrz(efu_psr_fclrz)
);
`endif  // OPENSPARC_CMP

//________________________________________________________________

n2_pcmb_cust pcmb0 ( 
	.sel     (mio_pcmb0_sel59 ),
        .burnin  (mio_pcm_burnin ),
        .bypass  (pcmb1_out),
        .out     (pcmb0_mio_ro_in)
);

//________________________________________________________________

n2_pcmb_cust pcmb1 ( 
	.sel     (mio_pcmb1_sel60 ),
        .burnin  (mio_pcm_burnin ),
        .bypass  (pcma_out),
        .out     (pcmb1_out)
);

//________________________________________________________________

n2_pcma_cust pcma ( 
	.sel     (mio_pcma_sel61 ),
        .burnin  (mio_pcm_burnin ),
        .out     (pcma_out)
);


//________________________________________________________________

n2_tmpd_cust tm0 ( 
	.diode_top ( DIODE_TOP )
);

n2_tmpd_cust tm1 ( 
	.diode_top ( DIODE_BOT )
);

//________________________________________________________________

n2_rng_cust rng (
	.l2clk 	(cmp_gclk_c3_rng),	// (cmp_gclk_rng), - for int6.1
	.rng_arst_l (rng_arst_l),
	.ch_sel (rng_ch_sel),
	.siclk (tcu_aclk),
	.soclk (tcu_bclk),
	.si (1'b0),
	.stop (1'b0),
	.tcu_se_scancollar_out (tcu_se_scancollar_out),
	.so (),
	.bypass (rng_bypass),
	.vdd_hv15 (VDD_RNG_HV), 	
	.vreg_selbg_l (mio_ccu_vreg_selbg_l),
	.vcoctrl_sel (rng_vcoctrl_sel),
	.anlg_sel (rng_anlg_sel),
	.anlg_char_out (RNG_ANLG_CHAR_OUT),
  .rng_data(rng_data)		
);
//________________________________________________________________

// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
ccu ccu(
	.pll_sys_clk_p      (PLL_CMP_CLK_P),		
	.pll_sys_clk_n      (PLL_CMP_CLK_N),
	.cmp_pll_clk        (l2clk),
	.dr_pll_clk	        (drl2clk) , 
	.gclk           	(cmp_gclk_c1_ccu ), 
    .scan_in            (rst_scan_out         ),
    .scan_out           (ccu_scan_out         ), // to be connected to tcu
	.gl_ccu_io_out		(gl_io_out_c1m),
	.pll_vdd            (VDD_PLL_CMP_REG),
  .ccu_vco_aligned(ccu_vco_aligned),
  .gclk_aligned(gclk_aligned),
  .ccu_ncu_stall(ccu_ncu_stall),
  .ncu_ccu_vld(ncu_ccu_vld),
  .ncu_ccu_data(ncu_ccu_data[3:0]),
  .ncu_ccu_stall(ncu_ccu_stall),
  .ccu_ncu_vld(ccu_ncu_vld),
  .ccu_ncu_data(ccu_ncu_data[3:0]),
  .rng_arst_l(rng_arst_l),
  .rng_data(rng_data),
  .rng_bypass(rng_bypass),
  .rng_vcoctrl_sel(rng_vcoctrl_sel[1:0]),
  .rng_ch_sel(rng_ch_sel[1:0]),
  .rng_anlg_sel(rng_anlg_sel[1:0]),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_scan_en(tcu_scan_en),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .ccu_cmp_io_sync_en(ccu_cmp_io_sync_en),
  .ccu_io_cmp_sync_en(ccu_io_cmp_sync_en),
  .ccu_io2x_sync_en(ccu_io2x_sync_en),
  .ccu_dr_sync_en(ccu_dr_sync_en),
  .ccu_io2x_out(ccu_io2x_out),
  .ccu_io_out(ccu_io_out),
  .ccu_serdes_dtm(ccu_serdes_dtm),
  .ccu_mio_pll_char_out(ccu_mio_pll_char_out[1:0]),
  .ccu_mio_serdes_dtm(ccu_mio_serdes_dtm),
  .ccu_dbg1_serdes_dtm(ccu_dbg1_serdes_dtm),
  .mio_pll_testmode(mio_pll_testmode),
  .mio_ccu_vreg_selbg_l(mio_ccu_vreg_selbg_l),
  .mio_ccu_pll_clamp_fltr(mio_ccu_pll_clamp_fltr),
  .mio_ccu_pll_div2(mio_ccu_pll_div2[5:0]),
  .mio_ccu_pll_div4(mio_ccu_pll_div4[6:0]),
  .mio_ccu_pll_trst_l(mio_ccu_pll_trst_l),
  .mio_ccu_pll_char_in(mio_ccu_pll_char_in),
  .gl_ccu_io_clk_stop(gl_ccu_io_clk_stop),
  .gl_ccu_clk_stop(gl_ccu_clk_stop),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_ccu_mux_sel(tcu_ccu_mux_sel[1:0]),
  .tcu_ccu_ext_cmp_clk(tcu_ccu_ext_cmp_clk),
  .tcu_ccu_ext_dr_clk(tcu_ccu_ext_dr_clk),
  .tcu_ccu_clk_stretch(tcu_ccu_clk_stretch),
  .rst_ccu_pll_(rst_ccu_pll_),
  .rst_ccu_(rst_ccu_),
  .rst_wmr_protect(rst_wmr_protect),
  .ccu_rst_change(ccu_rst_change),
  .ccu_rst_sys_clk(ccu_rst_sys_clk),
  .ccu_rst_sync_stable(ccu_rst_sync_stable),
  .ccu_sys_cmp_sync_en(ccu_sys_cmp_sync_en),
  .ccu_cmp_sys_sync_en(ccu_cmp_sys_sync_en),
  .cluster_arst_l(cluster_arst_l) 	
);
`endif  // OPENSPARC_CMP
 	 

// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
tcu tcu(

        //inputs
  .gclk		             ( cmp_gclk_c1_tcu ), // cmp_gclk_c2_r[4]           ),
  .ccu_io_out	( gl_io_out_c1m ),	// staged div phase
  .ccu_cmp_io2x_sync_en (gl_io2x_sync_en_c1m),
  .ccu_cmp_dr_sync_en (gl_dr_sync_en_c1m),
  .ccu_io_cmp_sync_en ( gl_io_cmp_sync_en_c1m ), 
  .ccu_cmp_io_sync_en ( gl_cmp_io_sync_en_c1m ),
  .io_test_mode		     (mio_tcu_testmode           ),
  .io_tms                    (mio_tcu_tms),
  .io_tdi                    (mio_tcu_tdi),
  .io_trst_l                 (mio_tcu_trst_l),
  .io_tck                    (mio_tcu_tck),
  .POR_                      (rst_tcu_pwron_rst_l      ),//=pwron_rst_l_sys_q  &
                                                         // mio_rst_pwron_rst_l&
                                                         // ccu_rst_sync_stable;
                             // Async assert, cmp-sync deassert.
  .l2t0_tcu_mbist_done       (l2t0_tcu_mbist_done_t5lff),
  .l2t0_tcu_mbist_fail       (l2t0_tcu_mbist_fail_t5lff),
  .spc0_tcu_mbist_done       (spc0_tcu_mbist_done_t5lff),
  .spc0_tcu_mbist_fail       (spc0_tcu_mbist_fail_t5lff),
  .l2t2_tcu_mbist_done       (l2t2_tcu_mbist_done_t7lff),
  .l2t2_tcu_mbist_fail       (l2t2_tcu_mbist_fail_t7lff),
  .spc2_tcu_mbist_done       (spc2_tcu_mbist_done_t7lff),
  .spc2_tcu_mbist_fail       (spc2_tcu_mbist_fail_t7lff),
  .l2b0_tcu_mbist_done       (l2b0_tcu_mbist_done_ccxlff),
  .l2b0_tcu_mbist_fail       (l2b0_tcu_mbist_fail_ccxlff),
  .l2b1_tcu_mbist_done       (l2b1_tcu_mbist_done_ccxlff),
  .l2b1_tcu_mbist_fail       (l2b1_tcu_mbist_fail_ccxlff),
  .l2b2_tcu_mbist_done       (l2b2_tcu_mbist_done_ccxlff),
  .l2b2_tcu_mbist_fail       (l2b2_tcu_mbist_fail_ccxlff),
  .l2b3_tcu_mbist_done       (l2b3_tcu_mbist_done_ccxlff),
  .l2b3_tcu_mbist_fail       (l2b3_tcu_mbist_fail_ccxlff),
  .mcu0_tcu_mbist_done       (mcu0_tcu_mbist_done_t5lff),
  .mcu0_tcu_mbist_fail       (mcu0_tcu_mbist_fail_t5lff),
  .mcu1_tcu_mbist_done       (mcu1_tcu_mbist_done_t5lff),
  .mcu1_tcu_mbist_fail       (mcu1_tcu_mbist_fail_t5lff),
  .sii_tcu_mbist_done        ({sii_tcu_mbist_done_ccxrff_1,sii_tcu_mbist_done_ccxrff_0}),
  .sii_tcu_mbist_fail        ({sii_tcu_mbist_fail_ccxrff_1,sii_tcu_mbist_fail_ccxrff_0}),
  .ncu_tcu_mbist_done        ({ncu_tcu_mbist_done[ 1 ],ncu_tcu_mbist_done_t5lff_0}),
  .ncu_tcu_mbist_fail        ({ncu_tcu_mbist_fail[ 1 ],ncu_tcu_mbist_fail_t5lff_0}),
  .spc0_softstop_request     (spc0_softstop_request_t5lff  ),
  .spc0_hardstop_request     (spc0_hardstop_request_t5lff  ),
  .spc0_trigger_pulse	     (spc0_trigger_pulse_t5lff  ),
  .spc0_ss_complete          (spc0_ss_complete_t5lff),
  .spc2_softstop_request     (spc2_softstop_request_t7lff  ),
  .spc2_hardstop_request     (spc2_hardstop_request_t7lff  ),
  .spc2_trigger_pulse	     (spc2_trigger_pulse_t7lff  ),
  .spc2_ss_complete          (spc2_ss_complete_t7lff),
  .ncu_spc0_core_enable_status(ncu_spc0_core_enable_status),
  .ncu_spc1_core_enable_status(ncu_spc1_core_enable_status),
  .ncu_spc2_core_enable_status(ncu_spc2_core_enable_status),
  .ncu_spc3_core_enable_status(ncu_spc3_core_enable_status),
  .ncu_spc4_core_enable_status(ncu_spc4_core_enable_status),
  .ncu_spc5_core_enable_status(ncu_spc5_core_enable_status),
  .ncu_spc6_core_enable_status(ncu_spc6_core_enable_status),
  .ncu_spc7_core_enable_status(ncu_spc7_core_enable_status),
  .spc0_tcu_scan_in          (spc0_tcu_scan_in[ 1 : 0 ]      ),
  .spc1_tcu_scan_in          (spc1_tcu_scan_in[ 1 : 0 ]      ),
  .spc2_tcu_scan_in          (spc2_tcu_scan_in[ 1 : 0 ]      ),
  .spc3_tcu_scan_in          (spc3_tcu_scan_in[ 1 : 0 ]      ),
  .spc4_tcu_scan_in          (spc4_tcu_scan_in[ 1 : 0 ]      ),
  .spc5_tcu_scan_in          (spc5_tcu_scan_in[ 1 : 0 ]      ),
  .spc6_tcu_scan_in          (spc6_tcu_scan_in[ 1 : 0 ]      ),
  .spc7_tcu_scan_in          (spc7_tcu_scan_in[ 1 : 0 ]      ),
  .soca_tcu_scan_in          (sii_scan_out               ),
  .socb_tcu_scan_in          (mcu0_scan_out              ),
  .socc_tcu_scan_in          (sio_scan_out               ),
  .socd_tcu_scan_in          (dmu_scan_out               ),
  .soce_tcu_scan_in          (rdp_scan_out               ),
  .socf_tcu_scan_in          (rtx_scan_out               ),
  .socg_tcu_scan_in          (mcu3_scan_out              ),
  .soch_tcu_scan_in          (l2b7_scan_out              ),
  .soc0_tcu_scan_in          (l2d1_scan_out              ),
  .soc1_tcu_scan_in          (l2d3_scan_out              ),
  .soc2_tcu_scan_in          (l2d5_scan_out              ),
  .soc3_tcu_scan_in          (l2d7_scan_out              ),
  .soc4_tcu_scan_in          (tds_scan_out               ),
  .soc5_tcu_scan_in          (mac_scan_out               ),
  .soc6_tcu_scan_in          (efu_scan_out               ),
  .peu_tcu_scan_in           (peu_scan_out     ),
  .ccu_tcu_scan_in           (ccu_scan_out     ),
  .spc0_tcu_mbist_scan_in    (spc0_tcu_mbist_scan_out    ),
  .spc1_tcu_mbist_scan_in    (spc1_tcu_mbist_scan_out    ),
  .spc2_tcu_mbist_scan_in    (spc2_tcu_mbist_scan_out    ),
  .spc3_tcu_mbist_scan_in    (spc3_tcu_mbist_scan_out    ),
  .spc4_tcu_mbist_scan_in    (spc4_tcu_mbist_scan_out    ),
  .spc5_tcu_mbist_scan_in    (spc5_tcu_mbist_scan_out    ),
  .spc6_tcu_mbist_scan_in    (spc6_tcu_mbist_scan_out    ),
  .spc7_tcu_mbist_scan_in    (spc7_tcu_mbist_scan_out    ),
    .l2t0_tcu_shscan_scan_out  (l2t0_tcu_shscan_scan_out),
    .l2t1_tcu_shscan_scan_out  (l2t1_tcu_shscan_scan_out),
    .l2t2_tcu_shscan_scan_out  (l2t2_tcu_shscan_scan_out),
    .l2t3_tcu_shscan_scan_out  (l2t3_tcu_shscan_scan_out),
    .l2t4_tcu_shscan_scan_out  (l2t4_tcu_shscan_scan_out),
    .l2t5_tcu_shscan_scan_out  (l2t5_tcu_shscan_scan_out),
    .l2t6_tcu_shscan_scan_out  (l2t6_tcu_shscan_scan_out),
    .l2t7_tcu_shscan_scan_out  (l2t7_tcu_shscan_scan_out),

  .sbs_tcu_scan_out          (mcu2_sbs_scan_out          ),
  .stciq_tcu                 (fsr4_stciq[ 0 ]              ),
  .tcu_srd_atpgd             (tcu_srd_atpgd              ), // temporary until fsr5 has a corresponding port 
  .srd_tcu_atpgq             (srd_tcu_atpgq              ), // temporary until fsr5 has a corresponding port 
 
        //outputs
  .tcu_asic_aclk             (tcu_asic_aclk              ),
  .tcu_asic_bclk             (tcu_asic_bclk              ),
  .tcu_asic_scan_en          (tcu_asic_scan_en           ),
  .tcu_asic_se_scancollar_in (tcu_asic_se_scancollar_in  ),
  .tcu_asic_se_scancollar_out (tcu_asic_se_scancollar_out ),
  .tcu_asic_array_wr_inhibit (tcu_asic_array_wr_inhibit  ),
  .dmo_coresel               (dmo_coresel[ 5 : 0 ]           ),
  .tcu_efu_rvclr             (tcu_efu_rvclr[ 6 : 0 ]         ),
  .tcu_soca_scan_out         (tcu_ccx_scan_out[ 0 ]),
  .tcu_socb_scan_out         (tcu_ccx_scan_out[ 1 ]),
  .tcu_socc_scan_out         (tcu_socc_scan_out),
  .tcu_socd_scan_out         (tcu_socd_scan_out),
  .tcu_soce_scan_out         (tcu_soce_scan_out),
  .tcu_socf_scan_out         (tcu_socf_scan_out),
  .tcu_socg_scan_out         (tcu_socg_scan_out),
  .tcu_soch_scan_out         (tcu_soch_scan_out),
  .tcu_spc0_scan_out         (tcu_spc0_scan_out[ 1 : 0 ]     ),
  .tcu_spc1_scan_out         (tcu_spc1_scan_out[ 1 : 0 ]     ),
  .tcu_spc2_scan_out         (tcu_spc2_scan_out[ 1 : 0 ]     ),
  .tcu_spc3_scan_out         (tcu_spc3_scan_out[ 1 : 0 ]     ),
  .tcu_spc4_scan_out         (tcu_spc4_scan_out[ 1 : 0 ]     ),
  .tcu_spc5_scan_out         (tcu_spc5_scan_out[ 1 : 0 ]     ),
  .tcu_spc6_scan_out         (tcu_spc6_scan_out[ 1 : 0 ]     ),
  .tcu_spc7_scan_out         (tcu_spc7_scan_out[ 1 : 0 ]     ),
  .tcu_spc0_mbist_scan_out   (tcu_spc0_mbist_scan_in     ), 
  .tcu_spc1_mbist_scan_out   (tcu_spc1_mbist_scan_in     ), 
  .tcu_spc2_mbist_scan_out   (tcu_spc2_mbist_scan_in     ), 
  .tcu_spc3_mbist_scan_out   (tcu_spc3_mbist_scan_in     ), 
  .tcu_spc4_mbist_scan_out   (tcu_spc4_mbist_scan_in     ), 
  .tcu_spc5_mbist_scan_out   (tcu_spc5_mbist_scan_in     ), 
  .tcu_spc6_mbist_scan_out   (tcu_spc6_mbist_scan_in     ), 
  .tcu_spc7_mbist_scan_out   (tcu_spc7_mbist_scan_in     ), 
  .tcu_soc0_scan_out         (tcu_soc0_scan_out     ),
  .tcu_soc1_scan_out         (tcu_soc1_scan_out     ),
  .tcu_soc2_scan_out         (tcu_soc2_scan_out     ),
  .tcu_soc3_scan_out         (tcu_soc3_scan_out     ),
  .tcu_soc4_scan_out         (tcu_soc4_scan_out     ),
  .tcu_soc5_scan_out         (tcu_soc5_scan_out     ),
  .tcu_soc6_scan_out         (tcu_soc6_scan_out     ),
  .tcu_peu_scan_out          (tcu_peu_scan_out      ),
  .cluster_arst_l(cluster_arst_l),
  .tcu_ccu_clk_stop(tcu_ccu_clk_stop),
  .tcu_ccu_io_clk_stop(tcu_ccu_io_clk_stop),
  .jtag_revid_out(jtag_revid_out[3:0]),
  .tcu_mio_tdo(tcu_mio_tdo),
  .tcu_mio_tdo_en(tcu_mio_tdo_en),
  .tcu_ncu_stall(tcu_ncu_stall),
  .ncu_tcu_vld(ncu_tcu_vld),
  .ncu_tcu_data(ncu_tcu_data[7:0]),
  .tcu_ncu_vld(tcu_ncu_vld),
  .tcu_ncu_data(tcu_ncu_data[7:0]),
  .ncu_tcu_stall(ncu_tcu_stall),
  .tcu_sck_bypass(tcu_sck_bypass),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .tcu_rst_scan_out(tcu_rst_scan_out),
  .tcu_spc0_aclk(tcu_spc0_aclk),
  .tcu_spc0_bclk(tcu_spc0_bclk),
  .tcu_spc0_scan_en(tcu_spc0_scan_en),
  .tcu_spc0_se_scancollar_in(tcu_spc0_se_scancollar_in),
  .tcu_spc0_se_scancollar_out(tcu_spc0_se_scancollar_out),
  .tcu_spc0_array_wr_inhibit(tcu_spc0_array_wr_inhibit),
  .tcu_spc1_aclk(tcu_spc1_aclk),
  .tcu_spc1_bclk(tcu_spc1_bclk),
  .tcu_spc1_scan_en(tcu_spc1_scan_en),
  .tcu_spc1_se_scancollar_in(tcu_spc1_se_scancollar_in),
  .tcu_spc1_se_scancollar_out(tcu_spc1_se_scancollar_out),
  .tcu_spc1_array_wr_inhibit(tcu_spc1_array_wr_inhibit),
  .tcu_spc2_aclk(tcu_spc2_aclk),
  .tcu_spc2_bclk(tcu_spc2_bclk),
  .tcu_spc2_scan_en(tcu_spc2_scan_en),
  .tcu_spc2_se_scancollar_in(tcu_spc2_se_scancollar_in),
  .tcu_spc2_se_scancollar_out(tcu_spc2_se_scancollar_out),
  .tcu_spc2_array_wr_inhibit(tcu_spc2_array_wr_inhibit),
  .tcu_spc3_aclk(tcu_spc3_aclk),
  .tcu_spc3_bclk(tcu_spc3_bclk),
  .tcu_spc3_scan_en(tcu_spc3_scan_en),
  .tcu_spc3_se_scancollar_in(tcu_spc3_se_scancollar_in),
  .tcu_spc3_se_scancollar_out(tcu_spc3_se_scancollar_out),
  .tcu_spc3_array_wr_inhibit(tcu_spc3_array_wr_inhibit),
  .tcu_spc4_aclk(tcu_spc4_aclk),
  .tcu_spc4_bclk(tcu_spc4_bclk),
  .tcu_spc4_scan_en(tcu_spc4_scan_en),
  .tcu_spc4_se_scancollar_in(tcu_spc4_se_scancollar_in),
  .tcu_spc4_se_scancollar_out(tcu_spc4_se_scancollar_out),
  .tcu_spc4_array_wr_inhibit(tcu_spc4_array_wr_inhibit),
  .tcu_spc5_aclk(tcu_spc5_aclk),
  .tcu_spc5_bclk(tcu_spc5_bclk),
  .tcu_spc5_scan_en(tcu_spc5_scan_en),
  .tcu_spc5_se_scancollar_in(tcu_spc5_se_scancollar_in),
  .tcu_spc5_se_scancollar_out(tcu_spc5_se_scancollar_out),
  .tcu_spc5_array_wr_inhibit(tcu_spc5_array_wr_inhibit),
  .tcu_spc6_aclk(tcu_spc6_aclk),
  .tcu_spc6_bclk(tcu_spc6_bclk),
  .tcu_spc6_scan_en(tcu_spc6_scan_en),
  .tcu_spc6_se_scancollar_in(tcu_spc6_se_scancollar_in),
  .tcu_spc6_se_scancollar_out(tcu_spc6_se_scancollar_out),
  .tcu_spc6_array_wr_inhibit(tcu_spc6_array_wr_inhibit),
  .tcu_spc7_aclk(tcu_spc7_aclk),
  .tcu_spc7_bclk(tcu_spc7_bclk),
  .tcu_spc7_scan_en(tcu_spc7_scan_en),
  .tcu_spc7_se_scancollar_in(tcu_spc7_se_scancollar_in),
  .tcu_spc7_se_scancollar_out(tcu_spc7_se_scancollar_out),
  .tcu_spc7_array_wr_inhibit(tcu_spc7_array_wr_inhibit),
  .tcu_spc0_clk_stop(tcu_spc0_clk_stop),
  .tcu_spc1_clk_stop(tcu_spc1_clk_stop),
  .tcu_spc2_clk_stop(tcu_spc2_clk_stop),
  .tcu_spc3_clk_stop(tcu_spc3_clk_stop),
  .tcu_spc4_clk_stop(tcu_spc4_clk_stop),
  .tcu_spc5_clk_stop(tcu_spc5_clk_stop),
  .tcu_spc6_clk_stop(tcu_spc6_clk_stop),
  .tcu_spc7_clk_stop(tcu_spc7_clk_stop),
  .tcu_l2d0_clk_stop(tcu_l2d0_clk_stop),
  .tcu_l2d1_clk_stop(tcu_l2d1_clk_stop),
  .tcu_l2d2_clk_stop(tcu_l2d2_clk_stop),
  .tcu_l2d3_clk_stop(tcu_l2d3_clk_stop),
  .tcu_l2d4_clk_stop(tcu_l2d4_clk_stop),
  .tcu_l2d5_clk_stop(tcu_l2d5_clk_stop),
  .tcu_l2d6_clk_stop(tcu_l2d6_clk_stop),
  .tcu_l2d7_clk_stop(tcu_l2d7_clk_stop),
  .tcu_l2t0_clk_stop(tcu_l2t0_clk_stop),
  .tcu_l2t1_clk_stop(tcu_l2t1_clk_stop),
  .tcu_l2t2_clk_stop(tcu_l2t2_clk_stop),
  .tcu_l2t3_clk_stop(tcu_l2t3_clk_stop),
  .tcu_l2t4_clk_stop(tcu_l2t4_clk_stop),
  .tcu_l2t5_clk_stop(tcu_l2t5_clk_stop),
  .tcu_l2t6_clk_stop(tcu_l2t6_clk_stop),
  .tcu_l2t7_clk_stop(tcu_l2t7_clk_stop),
  .tcu_l2b0_clk_stop(tcu_l2b0_clk_stop),
  .tcu_l2b1_clk_stop(tcu_l2b1_clk_stop),
  .tcu_l2b2_clk_stop(tcu_l2b2_clk_stop),
  .tcu_l2b3_clk_stop(tcu_l2b3_clk_stop),
  .tcu_l2b4_clk_stop(tcu_l2b4_clk_stop),
  .tcu_l2b5_clk_stop(tcu_l2b5_clk_stop),
  .tcu_l2b6_clk_stop(tcu_l2b6_clk_stop),
  .tcu_l2b7_clk_stop(tcu_l2b7_clk_stop),
  .tcu_mcu0_clk_stop(tcu_mcu0_clk_stop),
  .tcu_mcu0_dr_clk_stop(tcu_mcu0_dr_clk_stop),
  .tcu_mcu0_io_clk_stop(tcu_mcu0_io_clk_stop),
  .tcu_mcu0_fbd_clk_stop(tcu_mcu0_fbd_clk_stop),
  .tcu_mcu1_clk_stop(tcu_mcu1_clk_stop),
  .tcu_mcu1_dr_clk_stop(tcu_mcu1_dr_clk_stop),
  .tcu_mcu1_io_clk_stop(tcu_mcu1_io_clk_stop),
  .tcu_mcu1_fbd_clk_stop(tcu_mcu1_fbd_clk_stop),
  .tcu_mcu2_clk_stop(tcu_mcu2_clk_stop),
  .tcu_mcu2_dr_clk_stop(tcu_mcu2_dr_clk_stop),
  .tcu_mcu2_io_clk_stop(tcu_mcu2_io_clk_stop),
  .tcu_mcu2_fbd_clk_stop(tcu_mcu2_fbd_clk_stop),
  .tcu_mcu3_clk_stop(tcu_mcu3_clk_stop),
  .tcu_mcu3_dr_clk_stop(tcu_mcu3_dr_clk_stop),
  .tcu_mcu3_io_clk_stop(tcu_mcu3_io_clk_stop),
  .tcu_mcu3_fbd_clk_stop(tcu_mcu3_fbd_clk_stop),
  .tcu_ccx_clk_stop(tcu_ccx_clk_stop),
  .tcu_sii_clk_stop(tcu_sii_clk_stop),
  .tcu_sii_io_clk_stop(tcu_sii_io_clk_stop),
  .tcu_sio_clk_stop(tcu_sio_clk_stop),
  .tcu_sio_io_clk_stop(tcu_sio_io_clk_stop),
  .tcu_ncu_clk_stop(tcu_ncu_clk_stop),
  .tcu_ncu_io_clk_stop(tcu_ncu_io_clk_stop),
  .tcu_efu_clk_stop(tcu_efu_clk_stop),
  .tcu_efu_io_clk_stop(tcu_efu_io_clk_stop),
  .tcu_rst_clk_stop(tcu_rst_clk_stop),
  .tcu_rst_io_clk_stop(tcu_rst_io_clk_stop),
  .tcu_dmu_io_clk_stop(tcu_dmu_io_clk_stop),
  .tcu_rdp_io_clk_stop(tcu_rdp_io_clk_stop),
  .tcu_mac_io_clk_stop(tcu_mac_io_clk_stop),
  .tcu_rtx_io_clk_stop(tcu_rtx_io_clk_stop),
  .tcu_tds_io_clk_stop(tcu_tds_io_clk_stop),
  .tcu_peu_pc_clk_stop(tcu_peu_pc_clk_stop),
  .tcu_peu_io_clk_stop(tcu_peu_io_clk_stop),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_sii_data(tcu_sii_data),
  .tcu_sii_vld(tcu_sii_vld),
  .sio_tcu_data(sio_tcu_data),
  .sio_tcu_vld(sio_tcu_vld),
  .tcu_efu_rowaddr(tcu_efu_rowaddr[6:0]),
  .tcu_efu_coladdr(tcu_efu_coladdr[4:0]),
  .tcu_efu_read_en(tcu_efu_read_en),
  .tcu_efu_read_mode(tcu_efu_read_mode[2:0]),
  .tcu_efu_read_start(tcu_efu_read_start),
  .tcu_efu_fuse_bypass(tcu_efu_fuse_bypass),
  .tcu_efu_dest_sample(tcu_efu_dest_sample),
  .tcu_efu_data_in(tcu_efu_data_in),
  .efu_tcu_data_out(efu_tcu_data_out),
  .tcu_efu_updatedr(tcu_efu_updatedr),
  .tcu_efu_shiftdr(tcu_efu_shiftdr),
  .tcu_efu_capturedr(tcu_efu_capturedr),
  .tck(tck),
  .tcu_rst_efu_done(tcu_rst_efu_done),
  .tcu_test_protect(tcu_test_protect),
  .tcu_dbr_gateoff(tcu_dbr_gateoff),
  .tcu_spc_mbist_start(tcu_spc_mbist_start[7:0]),
  .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .spc1_tcu_mbist_done(spc1_tcu_mbist_done),
  .spc1_tcu_mbist_fail(spc1_tcu_mbist_fail),
  .spc3_tcu_mbist_done(spc3_tcu_mbist_done),
  .spc3_tcu_mbist_fail(spc3_tcu_mbist_fail),
  .spc4_tcu_mbist_done(spc4_tcu_mbist_done),
  .spc4_tcu_mbist_fail(spc4_tcu_mbist_fail),
  .spc5_tcu_mbist_done(spc5_tcu_mbist_done),
  .spc5_tcu_mbist_fail(spc5_tcu_mbist_fail),
  .spc6_tcu_mbist_done(spc6_tcu_mbist_done),
  .spc6_tcu_mbist_fail(spc6_tcu_mbist_fail),
  .spc7_tcu_mbist_done(spc7_tcu_mbist_done),
  .spc7_tcu_mbist_fail(spc7_tcu_mbist_fail),
  .tcu_sii_mbist_start(tcu_sii_mbist_start[1:0]),
  .tcu_sii_mbist_scan_in(tcu_sii_mbist_scan_in),
  .sii_tcu_mbist_scan_out(sii_tcu_mbist_scan_out),
  .tcu_sio_mbist_start(tcu_sio_mbist_start[1:0]),
  .tcu_sio_mbist_scan_in(tcu_sio_mbist_scan_in),
  .sio_tcu_mbist_done(sio_tcu_mbist_done[1:0]),
  .sio_tcu_mbist_fail(sio_tcu_mbist_fail[1:0]),
  .sio_tcu_mbist_scan_out(sio_tcu_mbist_scan_out),
  .tcu_ncu_mbist_start(tcu_ncu_mbist_start[1:0]),
  .tcu_ncu_mbist_scan_in(tcu_ncu_mbist_scan_in),
  .ncu_tcu_mbist_scan_out(ncu_tcu_mbist_scan_out),
  .tcu_mcu0_mbist_start(tcu_mcu0_mbist_start),
  .tcu_mcu0_mbist_scan_in(tcu_mcu0_mbist_scan_in),
  .mcu0_tcu_mbist_scan_out(mcu0_tcu_mbist_scan_out),
  .tcu_mcu1_mbist_start(tcu_mcu1_mbist_start),
  .tcu_mcu1_mbist_scan_in(tcu_mcu1_mbist_scan_in),
  .mcu1_tcu_mbist_scan_out(mcu1_tcu_mbist_scan_out),
  .tcu_mcu2_mbist_start(tcu_mcu2_mbist_start),
  .tcu_mcu2_mbist_scan_in(tcu_mcu2_mbist_scan_in),
  .mcu2_tcu_mbist_done(mcu2_tcu_mbist_done),
  .mcu2_tcu_mbist_fail(mcu2_tcu_mbist_fail),
  .mcu2_tcu_mbist_scan_out(mcu2_tcu_mbist_scan_out),
  .tcu_mcu3_mbist_start(tcu_mcu3_mbist_start),
  .tcu_mcu3_mbist_scan_in(tcu_mcu3_mbist_scan_in),
  .mcu3_tcu_mbist_done(mcu3_tcu_mbist_done),
  .mcu3_tcu_mbist_fail(mcu3_tcu_mbist_fail),
  .mcu3_tcu_mbist_scan_out(mcu3_tcu_mbist_scan_out),
  .tcu_l2b0_mbist_start(tcu_l2b0_mbist_start),
  .tcu_l2b0_mbist_scan_in(tcu_l2b0_mbist_scan_in),
  .l2b0_tcu_mbist_scan_out(l2b0_tcu_mbist_scan_out),
  .tcu_l2b1_mbist_start(tcu_l2b1_mbist_start),
  .tcu_l2b1_mbist_scan_in(tcu_l2b1_mbist_scan_in),
  .l2b1_tcu_mbist_scan_out(l2b1_tcu_mbist_scan_out),
  .tcu_l2b2_mbist_start(tcu_l2b2_mbist_start),
  .tcu_l2b2_mbist_scan_in(tcu_l2b2_mbist_scan_in),
  .l2b2_tcu_mbist_scan_out(l2b2_tcu_mbist_scan_out),
  .tcu_l2b3_mbist_start(tcu_l2b3_mbist_start),
  .tcu_l2b3_mbist_scan_in(tcu_l2b3_mbist_scan_in),
  .l2b3_tcu_mbist_scan_out(l2b3_tcu_mbist_scan_out),
  .tcu_l2b4_mbist_start(tcu_l2b4_mbist_start),
  .tcu_l2b4_mbist_scan_in(tcu_l2b4_mbist_scan_in),
  .l2b4_tcu_mbist_done(l2b4_tcu_mbist_done),
  .l2b4_tcu_mbist_fail(l2b4_tcu_mbist_fail),
  .l2b4_tcu_mbist_scan_out(l2b4_tcu_mbist_scan_out),
  .tcu_l2b5_mbist_start(tcu_l2b5_mbist_start),
  .tcu_l2b5_mbist_scan_in(tcu_l2b5_mbist_scan_in),
  .l2b5_tcu_mbist_done(l2b5_tcu_mbist_done),
  .l2b5_tcu_mbist_fail(l2b5_tcu_mbist_fail),
  .l2b5_tcu_mbist_scan_out(l2b5_tcu_mbist_scan_out),
  .tcu_l2b6_mbist_start(tcu_l2b6_mbist_start),
  .tcu_l2b6_mbist_scan_in(tcu_l2b6_mbist_scan_in),
  .l2b6_tcu_mbist_done(l2b6_tcu_mbist_done),
  .l2b6_tcu_mbist_fail(l2b6_tcu_mbist_fail),
  .l2b6_tcu_mbist_scan_out(l2b6_tcu_mbist_scan_out),
  .tcu_l2b7_mbist_start(tcu_l2b7_mbist_start),
  .tcu_l2b7_mbist_scan_in(tcu_l2b7_mbist_scan_in),
  .l2b7_tcu_mbist_done(l2b7_tcu_mbist_done),
  .l2b7_tcu_mbist_fail(l2b7_tcu_mbist_fail),
  .l2b7_tcu_mbist_scan_out(l2b7_tcu_mbist_scan_out),
  .tcu_l2t0_mbist_start(tcu_l2t0_mbist_start),
  .tcu_l2t0_mbist_scan_in(tcu_l2t0_mbist_scan_in),
  .l2t0_tcu_mbist_scan_out(l2t0_tcu_mbist_scan_out),
  .tcu_l2t1_mbist_start(tcu_l2t1_mbist_start),
  .tcu_l2t1_mbist_scan_in(tcu_l2t1_mbist_scan_in),
  .l2t1_tcu_mbist_done(l2t1_tcu_mbist_done),
  .l2t1_tcu_mbist_fail(l2t1_tcu_mbist_fail),
  .l2t1_tcu_mbist_scan_out(l2t1_tcu_mbist_scan_out),
  .tcu_l2t2_mbist_start(tcu_l2t2_mbist_start),
  .tcu_l2t2_mbist_scan_in(tcu_l2t2_mbist_scan_in),
  .l2t2_tcu_mbist_scan_out(l2t2_tcu_mbist_scan_out),
  .tcu_l2t3_mbist_start(tcu_l2t3_mbist_start),
  .tcu_l2t3_mbist_scan_in(tcu_l2t3_mbist_scan_in),
  .l2t3_tcu_mbist_done(l2t3_tcu_mbist_done),
  .l2t3_tcu_mbist_fail(l2t3_tcu_mbist_fail),
  .l2t3_tcu_mbist_scan_out(l2t3_tcu_mbist_scan_out),
  .tcu_l2t4_mbist_start(tcu_l2t4_mbist_start),
  .tcu_l2t4_mbist_scan_in(tcu_l2t4_mbist_scan_in),
  .l2t4_tcu_mbist_done(l2t4_tcu_mbist_done),
  .l2t4_tcu_mbist_fail(l2t4_tcu_mbist_fail),
  .l2t4_tcu_mbist_scan_out(l2t4_tcu_mbist_scan_out),
  .tcu_l2t5_mbist_start(tcu_l2t5_mbist_start),
  .tcu_l2t5_mbist_scan_in(tcu_l2t5_mbist_scan_in),
  .l2t5_tcu_mbist_done(l2t5_tcu_mbist_done),
  .l2t5_tcu_mbist_fail(l2t5_tcu_mbist_fail),
  .l2t5_tcu_mbist_scan_out(l2t5_tcu_mbist_scan_out),
  .tcu_l2t6_mbist_start(tcu_l2t6_mbist_start),
  .tcu_l2t6_mbist_scan_in(tcu_l2t6_mbist_scan_in),
  .l2t6_tcu_mbist_done(l2t6_tcu_mbist_done),
  .l2t6_tcu_mbist_fail(l2t6_tcu_mbist_fail),
  .l2t6_tcu_mbist_scan_out(l2t6_tcu_mbist_scan_out),
  .tcu_l2t7_mbist_start(tcu_l2t7_mbist_start),
  .tcu_l2t7_mbist_scan_in(tcu_l2t7_mbist_scan_in),
  .l2t7_tcu_mbist_done(l2t7_tcu_mbist_done),
  .l2t7_tcu_mbist_fail(l2t7_tcu_mbist_fail),
  .l2t7_tcu_mbist_scan_out(l2t7_tcu_mbist_scan_out),
  .tcu_dmu_mbist_start(tcu_dmu_mbist_start[1:0]),
  .tcu_dmu_mbist_scan_in(tcu_dmu_mbist_scan_in),
  .dmu_tcu_mbist_done(dmu_tcu_mbist_done[1:0]),
  .dmu_tcu_mbist_fail(dmu_tcu_mbist_fail[1:0]),
  .dmu_tcu_mbist_scan_out(dmu_tcu_mbist_scan_out),
  .tcu_peu_mbist_start(tcu_peu_mbist_start),
  .tcu_peu_mbist_scan_in(tcu_peu_mbist_scan_in),
  .peu_tcu_mbist_done(peu_tcu_mbist_done),
  .peu_tcu_mbist_fail(peu_tcu_mbist_fail),
  .peu_tcu_mbist_scan_out(peu_tcu_mbist_scan_out),
  .tcu_rdp_rdmc_mbist_start(tcu_rdp_rdmc_mbist_start),
  .tcu_rtx_rxc_ipp0_mbist_start(tcu_rtx_rxc_ipp0_mbist_start),
  .tcu_rtx_rxc_ipp1_mbist_start(tcu_rtx_rxc_ipp1_mbist_start),
  .tcu_rtx_rxc_mb5_mbist_start(tcu_rtx_rxc_mb5_mbist_start),
  .tcu_rtx_rxc_mb6_mbist_start(tcu_rtx_rxc_mb6_mbist_start),
  .tcu_rtx_rxc_zcp0_mbist_start(tcu_rtx_rxc_zcp0_mbist_start),
  .tcu_rtx_rxc_zcp1_mbist_start(tcu_rtx_rxc_zcp1_mbist_start),
  .tcu_rtx_txc_txe0_mbist_start(tcu_rtx_txc_txe0_mbist_start),
  .tcu_rtx_txc_txe1_mbist_start(tcu_rtx_txc_txe1_mbist_start),
  .tcu_tds_smx_mbist_start(tcu_tds_smx_mbist_start),
  .tcu_tds_tdmc_mbist_start(tcu_tds_tdmc_mbist_start),
  .rtx_mbist_scan_in(rtx_mbist_scan_in),
  .rdp_rdmc_mbist_scan_in(rdp_rdmc_mbist_scan_in),
  .tds_mbist_scan_in(tds_mbist_scan_in),
  .rtx_mbist_scan_out(rtx_mbist_scan_out),
  .rdp_rdmc_mbist_scan_out(rdp_rdmc_mbist_scan_out),
  .tds_mbist_scan_out(tds_mbist_scan_out),
  .rdp_rdmc_tcu_mbist_done(rdp_rdmc_tcu_mbist_done),
  .rtx_rxc_ipp0_tcu_mbist_done(rtx_rxc_ipp0_tcu_mbist_done),
  .rtx_rxc_ipp1_tcu_mbist_done(rtx_rxc_ipp1_tcu_mbist_done),
  .rtx_rxc_mb5_tcu_mbist_done(rtx_rxc_mb5_tcu_mbist_done),
  .rtx_rxc_mb6_tcu_mbist_done(rtx_rxc_mb6_tcu_mbist_done),
  .rtx_rxc_zcp0_tcu_mbist_done(rtx_rxc_zcp0_tcu_mbist_done),
  .rtx_rxc_zcp1_tcu_mbist_done(rtx_rxc_zcp1_tcu_mbist_done),
  .rtx_txc_txe0_tcu_mbist_done(rtx_txc_txe0_tcu_mbist_done),
  .rtx_txc_txe1_tcu_mbist_done(rtx_txc_txe1_tcu_mbist_done),
  .tds_smx_tcu_mbist_done(tds_smx_tcu_mbist_done),
  .tds_tdmc_tcu_mbist_done(tds_tdmc_tcu_mbist_done),
  .rdp_rdmc_tcu_mbist_fail(rdp_rdmc_tcu_mbist_fail),
  .rtx_rxc_ipp0_tcu_mbist_fail(rtx_rxc_ipp0_tcu_mbist_fail),
  .rtx_rxc_ipp1_tcu_mbist_fail(rtx_rxc_ipp1_tcu_mbist_fail),
  .rtx_rxc_mb5_tcu_mbist_fail(rtx_rxc_mb5_tcu_mbist_fail),
  .rtx_rxc_mb6_tcu_mbist_fail(rtx_rxc_mb6_tcu_mbist_fail),
  .rtx_rxc_zcp0_tcu_mbist_fail(rtx_rxc_zcp0_tcu_mbist_fail),
  .rtx_rxc_zcp1_tcu_mbist_fail(rtx_rxc_zcp1_tcu_mbist_fail),
  .rtx_txc_txe0_tcu_mbist_fail(rtx_txc_txe0_tcu_mbist_fail),
  .rtx_txc_txe1_tcu_mbist_fail(rtx_txc_txe1_tcu_mbist_fail),
  .tds_smx_tcu_mbist_fail(tds_smx_tcu_mbist_fail),
  .tds_tdmc_tcu_mbist_fail(tds_tdmc_tcu_mbist_fail),
  .dmo_dcmuxctl(dmo_dcmuxctl),
  .dmo_icmuxctl(dmo_icmuxctl),
  .spc4_dmo_dout(spc4_dmo_dout[35:0]),
  .spc6_dmo_dout(spc6_dmo_dout[35:0]),
  .l2t4_dmo_dout(l2t4_dmo_dout[38:0]),
  .l2t6_dmo_dout(l2t6_dmo_dout[38:0]),
  .dmo_l2tsel(dmo_l2tsel[5:0]),
  .dmo_tagmuxctl(dmo_tagmuxctl),
  .rtx_tcu_dmo_data_out(rtx_tcu_dmo_data_out[39:0]),
  .tds_tcu_dmo_dout(tds_tcu_dmo_dout[39:0]),
  .rdp_tcu_dmo_dout(rdp_tcu_dmo_dout[39:0]),
  .tcu_rtx_dmo_ctl(tcu_rtx_dmo_ctl[2:0]),
  .spc0_tcu_shscan_scan_in(spc0_tcu_shscan_scan_in),
  .tcu_spc0_shscan_scan_out(tcu_spc0_shscan_scan_out),
  .spc1_tcu_shscan_scan_in(spc1_tcu_shscan_scan_in),
  .tcu_spc1_shscan_scan_out(tcu_spc1_shscan_scan_out),
  .spc2_tcu_shscan_scan_in(spc2_tcu_shscan_scan_in),
  .tcu_spc2_shscan_scan_out(tcu_spc2_shscan_scan_out),
  .spc3_tcu_shscan_scan_in(spc3_tcu_shscan_scan_in),
  .tcu_spc3_shscan_scan_out(tcu_spc3_shscan_scan_out),
  .spc4_tcu_shscan_scan_in(spc4_tcu_shscan_scan_in),
  .tcu_spc4_shscan_scan_out(tcu_spc4_shscan_scan_out),
  .spc5_tcu_shscan_scan_in(spc5_tcu_shscan_scan_in),
  .tcu_spc5_shscan_scan_out(tcu_spc5_shscan_scan_out),
  .spc6_tcu_shscan_scan_in(spc6_tcu_shscan_scan_in),
  .tcu_spc6_shscan_scan_out(tcu_spc6_shscan_scan_out),
  .spc7_tcu_shscan_scan_in(spc7_tcu_shscan_scan_in),
  .tcu_spc7_shscan_scan_out(tcu_spc7_shscan_scan_out),
  .tcu_spc_shscan_aclk(tcu_spc_shscan_aclk),
  .tcu_spc_shscan_bclk(tcu_spc_shscan_bclk),
  .tcu_spc_shscan_scan_en(tcu_spc_shscan_scan_en),
  .tcu_spc_shscan_pce_ov(tcu_spc_shscan_pce_ov),
  .tcu_spc0_shscan_clk_stop(tcu_spc0_shscan_clk_stop),
  .tcu_spc1_shscan_clk_stop(tcu_spc1_shscan_clk_stop),
  .tcu_spc2_shscan_clk_stop(tcu_spc2_shscan_clk_stop),
  .tcu_spc3_shscan_clk_stop(tcu_spc3_shscan_clk_stop),
  .tcu_spc4_shscan_clk_stop(tcu_spc4_shscan_clk_stop),
  .tcu_spc5_shscan_clk_stop(tcu_spc5_shscan_clk_stop),
  .tcu_spc6_shscan_clk_stop(tcu_spc6_shscan_clk_stop),
  .tcu_spc7_shscan_clk_stop(tcu_spc7_shscan_clk_stop),
  .tcu_spc_shscanid(tcu_spc_shscanid[2:0]),
  .tcu_l2t0_shscan_scan_in(tcu_l2t0_shscan_scan_in),
  .tcu_l2t1_shscan_scan_in(tcu_l2t1_shscan_scan_in),
  .tcu_l2t2_shscan_scan_in(tcu_l2t2_shscan_scan_in),
  .tcu_l2t3_shscan_scan_in(tcu_l2t3_shscan_scan_in),
  .tcu_l2t4_shscan_scan_in(tcu_l2t4_shscan_scan_in),
  .tcu_l2t5_shscan_scan_in(tcu_l2t5_shscan_scan_in),
  .tcu_l2t6_shscan_scan_in(tcu_l2t6_shscan_scan_in),
  .tcu_l2t7_shscan_scan_in(tcu_l2t7_shscan_scan_in),
  .tcu_l2t_shscan_aclk(tcu_l2t_shscan_aclk),
  .tcu_l2t_shscan_bclk(tcu_l2t_shscan_bclk),
  .tcu_l2t_shscan_scan_en(tcu_l2t_shscan_scan_en),
  .tcu_l2t_shscan_pce_ov(tcu_l2t_shscan_pce_ov),
  .tcu_l2t0_shscan_clk_stop(tcu_l2t0_shscan_clk_stop),
  .tcu_l2t1_shscan_clk_stop(tcu_l2t1_shscan_clk_stop),
  .tcu_l2t2_shscan_clk_stop(tcu_l2t2_shscan_clk_stop),
  .tcu_l2t3_shscan_clk_stop(tcu_l2t3_shscan_clk_stop),
  .tcu_l2t4_shscan_clk_stop(tcu_l2t4_shscan_clk_stop),
  .tcu_l2t5_shscan_clk_stop(tcu_l2t5_shscan_clk_stop),
  .tcu_l2t6_shscan_clk_stop(tcu_l2t6_shscan_clk_stop),
  .tcu_l2t7_shscan_clk_stop(tcu_l2t7_shscan_clk_stop),
  .tcu_ss_mode(tcu_ss_mode[7:0]),
  .tcu_do_mode(tcu_do_mode[7:0]),
  .tcu_ss_request(tcu_ss_request[7:0]),
  .spc1_ss_complete(spc1_ss_complete),
  .spc3_ss_complete(spc3_ss_complete),
  .spc4_ss_complete(spc4_ss_complete),
  .spc5_ss_complete(spc5_ss_complete),
  .spc6_ss_complete(spc6_ss_complete),
  .spc7_ss_complete(spc7_ss_complete),
  .spc1_softstop_request(spc1_softstop_request),
  .spc3_softstop_request(spc3_softstop_request),
  .spc4_softstop_request(spc4_softstop_request),
  .spc5_softstop_request(spc5_softstop_request),
  .spc6_softstop_request(spc6_softstop_request),
  .spc7_softstop_request(spc7_softstop_request),
  .spc1_hardstop_request(spc1_hardstop_request),
  .spc3_hardstop_request(spc3_hardstop_request),
  .spc4_hardstop_request(spc4_hardstop_request),
  .spc5_hardstop_request(spc5_hardstop_request),
  .spc6_hardstop_request(spc6_hardstop_request),
  .spc7_hardstop_request(spc7_hardstop_request),
  .spc0_ncu_core_running_status(spc0_ncu_core_running_status[7:0]),
  .spc1_ncu_core_running_status(spc1_ncu_core_running_status[7:0]),
  .spc2_ncu_core_running_status(spc2_ncu_core_running_status[7:0]),
  .spc3_ncu_core_running_status(spc3_ncu_core_running_status[7:0]),
  .spc4_ncu_core_running_status(spc4_ncu_core_running_status[7:0]),
  .spc5_ncu_core_running_status(spc5_ncu_core_running_status[7:0]),
  .spc6_ncu_core_running_status(spc6_ncu_core_running_status[7:0]),
  .spc7_ncu_core_running_status(spc7_ncu_core_running_status[7:0]),
  .spc1_trigger_pulse(spc1_trigger_pulse),
  .spc3_trigger_pulse(spc3_trigger_pulse),
  .spc4_trigger_pulse(spc4_trigger_pulse),
  .spc5_trigger_pulse(spc5_trigger_pulse),
  .spc6_trigger_pulse(spc6_trigger_pulse),
  .spc7_trigger_pulse(spc7_trigger_pulse),
  .rst_tcu_flush_init_req(rst_tcu_flush_init_req),
  .rst_tcu_flush_stop_req(rst_tcu_flush_stop_req),
  .rst_tcu_asicflush_stop_req(rst_tcu_asicflush_stop_req),
  .tcu_rst_asicflush_stop_ack(tcu_rst_asicflush_stop_ack),
  .tcu_rst_flush_init_ack(tcu_rst_flush_init_ack),
  .tcu_rst_flush_stop_ack(tcu_rst_flush_stop_ack),
  .rst_wmr_protect(rst_wmr_protect),
  .tcu_bisx_done(tcu_bisx_done),
  .tcu_rst_scan_mode(tcu_rst_scan_mode),
  .rst_tcu_clk_stop(rst_tcu_clk_stop),
  .rst_tcu_dbr_gen(rst_tcu_dbr_gen),
  .ncu_spc0_core_available(ncu_spc0_core_available),
  .ncu_spc1_core_available(ncu_spc1_core_available),
  .ncu_spc2_core_available(ncu_spc2_core_available),
  .ncu_spc3_core_available(ncu_spc3_core_available),
  .ncu_spc4_core_available(ncu_spc4_core_available),
  .ncu_spc5_core_available(ncu_spc5_core_available),
  .ncu_spc6_core_available(ncu_spc6_core_available),
  .ncu_spc7_core_available(ncu_spc7_core_available),
  .ncu_tcu_bank_avail(ncu_tcu_bank_avail[7:0]),
  .ncu_spc_pm(ncu_spc_pm),
  .ncu_spc_ba01(ncu_spc_ba01),
  .ncu_spc_ba23(ncu_spc_ba23),
  .ncu_spc_ba45(ncu_spc_ba45),
  .ncu_spc_ba67(ncu_spc_ba67),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_bypass(tcu_array_bypass),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_mio_pins_scan_out(tcu_mio_pins_scan_out[30:0]),
  .tcu_mio_dmo_data(tcu_mio_dmo_data[39:0]),
  .tcu_mio_mbist_done(tcu_mio_mbist_done),
  .tcu_mio_mbist_fail(tcu_mio_mbist_fail),
  .tcu_mio_trigout(tcu_mio_trigout),
  .tcu_mio_jtag_membist_mode(tcu_mio_jtag_membist_mode),
  .tcu_mio_clk_stop(tcu_mio_clk_stop),
  .tcu_mio_bs_scan_in(tcu_mio_bs_scan_in),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_mio_dmo_sync(tcu_mio_dmo_sync),
  .tcu_stciclk(tcu_stciclk),
  .tcu_stcicfg(tcu_stcicfg[1:0]),
  .tcu_stcid(tcu_stcid),
  .tcu_srd_atpgse(tcu_srd_atpgse),
  .tcu_srd_atpgmode(tcu_srd_atpgmode[2:0]),
  .tcu_sbs_enbstx(tcu_sbs_enbstx),
  .tcu_sbs_enbsrx(tcu_sbs_enbsrx),
  .tcu_sbs_scan_en(tcu_sbs_scan_en),
  .tcu_sbs_clk(tcu_sbs_clk),
  .tcu_sbs_aclk(tcu_sbs_aclk),
  .tcu_sbs_bclk(tcu_sbs_bclk),
  .tcu_sbs_uclk(tcu_sbs_uclk),
  .tcu_sbs_scan_in(tcu_sbs_scan_in),
  .tcu_sbs_acmode(tcu_sbs_acmode),
  .tcu_sbs_actestsignal(tcu_sbs_actestsignal),
  .tcu_sbs_enbspt(tcu_sbs_enbspt),
  .tcu_sbs_bsinitclk(tcu_sbs_bsinitclk),
  .tcu_peu_entestcfg(tcu_peu_entestcfg),
  .tcu_mio_scan_out31(tcu_mio_scan_out31),
  .mio_tcu_scan_in31(mio_tcu_scan_in31),
  .mio_tcu_stciclk(mio_tcu_stciclk),
  .mio_tcu_stcicfg(mio_tcu_stcicfg[1:0]),
  .mio_tcu_stcid(mio_tcu_stcid),
  .tcu_mio_stciq(tcu_mio_stciq),
  .mio_tcu_io_ac_testmode(mio_tcu_io_ac_testmode),
  .mio_tcu_io_ac_testtrig(mio_tcu_io_ac_testtrig),
  .mio_tcu_io_aclk(mio_tcu_io_aclk),
  .mio_tcu_io_bclk(mio_tcu_io_bclk),
  .mio_tcu_io_scan_in(mio_tcu_io_scan_in[30:0]),
  .mio_tcu_io_scan_en(mio_tcu_io_scan_en),
  .mio_tcu_trigin(mio_tcu_trigin),
  .mio_tcu_bs_scan_out(mio_tcu_bs_scan_out),
  .mio_ext_cmp_clk(mio_ext_cmp_clk),
  .mio_ext_dr_clk(mio_ext_dr_clk),
  .mio_tcu_peu_clk_ext(mio_tcu_peu_clk_ext),
  .mio_tcu_niu_clk_ext(mio_tcu_niu_clk_ext[5:0]),
  .tcu_peu_clk_ext(tcu_peu_clk_ext),
  .tcu_ccu_ext_cmp_clk(tcu_ccu_ext_cmp_clk),
  .tcu_ccu_ext_dr_clk(tcu_ccu_ext_dr_clk),
  .mac_125rx_test_clk(mac_125rx_test_clk),
  .mac_125tx_test_clk(mac_125tx_test_clk),
  .mac_156rx_test_clk(mac_156rx_test_clk),
  .mac_156tx_test_clk(mac_156tx_test_clk),
  .mac_312rx_test_clk(mac_312rx_test_clk),
  .mac_312tx_test_clk(mac_312tx_test_clk),
  .tcu_peu_testmode(tcu_peu_testmode),
  .tcu_mac_testmode(tcu_mac_testmode),
  .mio_tcu_divider_bypass(mio_tcu_divider_bypass),
  .mio_tcu_pll_cmp_bypass(mio_tcu_pll_cmp_bypass),
  .tcu_div_bypass(tcu_div_bypass),
  .tcu_ccu_mux_sel(tcu_ccu_mux_sel[1:0]),
  .tcu_ccu_clk_stretch(tcu_ccu_clk_stretch),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .dbg1_tcu_soc_hard_stop(dbg1_tcu_soc_hard_stop),
  .dbg1_tcu_soc_asrt_trigout(dbg1_tcu_soc_asrt_trigout),
  .tcu_db0_clk_stop(tcu_db0_clk_stop),
  .tcu_db1_clk_stop(tcu_db1_clk_stop),
  .tcu_spc_lbist_start(tcu_spc_lbist_start[7:0]),
  .tcu_spc_lbist_scan_in(tcu_spc_lbist_scan_in[7:0]),
  .tcu_spc_lbist_pgm(tcu_spc_lbist_pgm),
  .tcu_spc0_test_mode(tcu_spc0_test_mode),
  .tcu_spc1_test_mode(tcu_spc1_test_mode),
  .tcu_spc2_test_mode(tcu_spc2_test_mode),
  .tcu_spc3_test_mode(tcu_spc3_test_mode),
  .tcu_spc4_test_mode(tcu_spc4_test_mode),
  .tcu_spc5_test_mode(tcu_spc5_test_mode),
  .tcu_spc6_test_mode(tcu_spc6_test_mode),
  .tcu_spc7_test_mode(tcu_spc7_test_mode),
  .tcu_atpg_mode(tcu_atpg_mode),
  .spc0_tcu_lbist_done(spc0_tcu_lbist_done),
  .spc1_tcu_lbist_done(spc1_tcu_lbist_done),
  .spc2_tcu_lbist_done(spc2_tcu_lbist_done),
  .spc3_tcu_lbist_done(spc3_tcu_lbist_done),
  .spc4_tcu_lbist_done(spc4_tcu_lbist_done),
  .spc5_tcu_lbist_done(spc5_tcu_lbist_done),
  .spc6_tcu_lbist_done(spc6_tcu_lbist_done),
  .spc7_tcu_lbist_done(spc7_tcu_lbist_done),
  .spc0_tcu_lbist_scan_out(spc0_tcu_lbist_scan_out),
  .spc1_tcu_lbist_scan_out(spc1_tcu_lbist_scan_out),
  .spc2_tcu_lbist_scan_out(spc2_tcu_lbist_scan_out),
  .spc3_tcu_lbist_scan_out(spc3_tcu_lbist_scan_out),
  .spc4_tcu_lbist_scan_out(spc4_tcu_lbist_scan_out),
  .spc5_tcu_lbist_scan_out(spc5_tcu_lbist_scan_out),
  .spc6_tcu_lbist_scan_out(spc6_tcu_lbist_scan_out),
  .spc7_tcu_lbist_scan_out(spc7_tcu_lbist_scan_out)

        );
`endif  // OPENSPARC_CMP



// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
dmu dmu(

  .rst_por_                 (gl_dmu_peu_por_c3b ), 
  .rst_wmr_                 (gl_dmu_peu_wmr_c3b ), 
  .tcu_array_bypass         (tcu_array_bypass            ),
  //.tcu_soc6io_clk_stop      (tcu_dmu_io_clk_stop         ),
  .tcu_aclk                 ( tcu_asic_aclk             ),
  .tcu_bclk                 ( tcu_asic_bclk             ),
  .tcu_scan_en              ( tcu_asic_scan_en          ),
  .tcu_se_scancollar_in     ( tcu_asic_se_scancollar_in ),
  .tcu_se_scancollar_out    ( tcu_asic_se_scancollar_out),
  .tcu_array_wr_inhibit     ( tcu_asic_array_wr_inhibit ),
  .scan_in                  (tcu_socd_scan_out           ),
  .scan_out                 (dmu_scan_out                ),
  .sii_dmu_wrack_par	    (sii_dmu_wrack_parity),
  .gclk                 ( cmp_gclk_c3_dmu ), // cmp_gclk_c0_r[0]       ),
  .tcu_dmu_io_clk_stop	( gl_dmu_io_clk_stop ),	// staged clk_stop
  .ccu_io_out	( gl_io_out_c3b ),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_div_bypass(tcu_div_bypass),
  .tcu_test_protect(tcu_test_protect),
  .cluster_arst_l(cluster_arst_l),
  .ccu_serdes_dtm(ccu_serdes_dtm),
  .ncu_dmu_data(ncu_dmu_data[31:0]),
  .ncu_dmu_mmu_addr_vld(ncu_dmu_mmu_addr_vld),
  .ncu_dmu_mondo_ack(ncu_dmu_mondo_ack),
  .ncu_dmu_mondo_id(ncu_dmu_mondo_id[5:0]),
  .ncu_dmu_mondo_nack(ncu_dmu_mondo_nack),
  .ncu_dmu_pio_data(ncu_dmu_pio_data[63:0]),
  .ncu_dmu_pio_hdr_vld(ncu_dmu_pio_hdr_vld),
  .ncu_dmu_stall(ncu_dmu_stall),
  .ncu_dmu_vld(ncu_dmu_vld),
  .ncu_dmu_mondo_id_par(ncu_dmu_mondo_id_par),
  .ncu_dmu_d_pei(ncu_dmu_d_pei),
  .ncu_dmu_siicr_pei(ncu_dmu_siicr_pei),
  .ncu_dmu_ctag_uei(ncu_dmu_ctag_uei),
  .ncu_dmu_ctag_cei(ncu_dmu_ctag_cei),
  .ncu_dmu_ncucr_pei(ncu_dmu_ncucr_pei),
  .ncu_dmu_iei(ncu_dmu_iei),
  .p2d_ce_int(p2d_ce_int),
  .p2d_csr_ack(p2d_csr_ack),
  .p2d_csr_rcd(p2d_csr_rcd[95:0]),
  .p2d_csr_req(p2d_csr_req),
  .p2d_cto_req(p2d_cto_req),
  .p2d_cto_tag(p2d_cto_tag[4:0]),
  .p2d_drain(p2d_drain),
  .p2d_ecd_rptr(p2d_ecd_rptr[7:0]),
  .p2d_ech_rptr(p2d_ech_rptr[5:0]),
  .p2d_erd_rptr(p2d_erd_rptr[7:0]),
  .p2d_erh_rptr(p2d_erh_rptr[5:0]),
  .p2d_ibc_ack(p2d_ibc_ack),
  .p2d_idb_data(p2d_idb_data[127:0]),
  .p2d_idb_dpar(p2d_idb_dpar[3:0]),
  .p2d_ihb_data(p2d_ihb_data[127:0]),
  .p2d_ihb_dpar(p2d_ihb_dpar[3:0]),
  .d2p_ihb_rd(d2p_ihb_rd),
  .d2p_idb_rd(d2p_idb_rd),
  .p2d_ihb_wptr(p2d_ihb_wptr[6:0]),
  .p2d_mps(p2d_mps[2:0]),
  .p2d_oe_int(p2d_oe_int),
  .p2d_spare(p2d_spare[4:0]),
  .p2d_ue_int(p2d_ue_int),
  .p2d_npwr_stall_en(p2d_npwr_stall_en),
  .rst_dmu_async_por_(rst_dmu_async_por_),
  .sii_dmu_wrack_tag(sii_dmu_wrack_tag[3:0]),
  .sii_dmu_wrack_vld(sii_dmu_wrack_vld),
  .sio_dmu_data(sio_dmu_data[127:0]),
  .sio_dmu_hdr_vld(sio_dmu_hdr_vld),
  .sio_dmu_parity(sio_dmu_parity[7:0]),
  .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .tcu_dmu_mbist_start(tcu_dmu_mbist_start[1:0]),
  .tcu_dmu_mbist_scan_in(tcu_dmu_mbist_scan_in),
  .tcu_atpg_mode(tcu_atpg_mode),
  .dmu_tcu_mbist_done(dmu_tcu_mbist_done[1:0]),
  .dmu_tcu_mbist_fail(dmu_tcu_mbist_fail[1:0]),
  .dmu_tcu_mbist_scan_out(dmu_tcu_mbist_scan_out),
  .d2p_csr_ack(d2p_csr_ack),
  .d2p_csr_rcd(d2p_csr_rcd[95:0]),
  .d2p_csr_req(d2p_csr_req),
  .d2p_cto_ack(d2p_cto_ack),
  .d2p_ech_wptr(d2p_ech_wptr[5:0]),
  .d2p_edb_addr(d2p_edb_addr[7:0]),
  .d2p_edb_data(d2p_edb_data[127:0]),
  .d2p_edb_dpar(d2p_edb_dpar[3:0]),
  .d2p_edb_we(d2p_edb_we),
  .d2p_ehb_addr(d2p_ehb_addr[5:0]),
  .d2p_ehb_data(d2p_ehb_data[127:0]),
  .d2p_ehb_dpar(d2p_ehb_dpar[3:0]),
  .d2p_ehb_we(d2p_ehb_we),
  .d2p_erh_wptr(d2p_erh_wptr[5:0]),
  .d2p_ibc_nhc(d2p_ibc_nhc[7:0]),
  .d2p_ibc_pdc(d2p_ibc_pdc[11:0]),
  .d2p_ibc_phc(d2p_ibc_phc[7:0]),
  .d2p_ibc_req(d2p_ibc_req),
  .d2p_idb_addr(d2p_idb_addr[7:0]),
  .d2p_ihb_addr(d2p_ihb_addr[5:0]),
  .d2p_spare(d2p_spare[4:0]),
  .dmu_ncu_data(dmu_ncu_data[31:0]),
  .dmu_ncu_stall(dmu_ncu_stall),
  .dmu_ncu_vld(dmu_ncu_vld),
  .dmu_ncu_wrack_tag(dmu_ncu_wrack_tag[3:0]),
  .dmu_ncu_wrack_vld(dmu_ncu_wrack_vld),
  .dmu_ncu_wrack_par(dmu_ncu_wrack_par),
  .dmu_ncu_d_pe(dmu_ncu_d_pe),
  .dmu_ncu_siicr_pe(dmu_ncu_siicr_pe),
  .dmu_ncu_ctag_ue(dmu_ncu_ctag_ue),
  .dmu_ncu_ctag_ce(dmu_ncu_ctag_ce),
  .dmu_ncu_ncucr_pe(dmu_ncu_ncucr_pe),
  .dmu_ncu_ie(dmu_ncu_ie),
  .dmu_sii_be(dmu_sii_be[15:0]),
  .dmu_sii_data(dmu_sii_data[127:0]),
  .dmu_sii_datareq(dmu_sii_datareq),
  .dmu_sii_datareq16(dmu_sii_datareq16),
  .dmu_sii_hdr_vld(dmu_sii_hdr_vld),
  .dmu_sii_parity(dmu_sii_parity[7:0]),
  .dmu_sii_be_parity(dmu_sii_be_parity),
  .dmu_sii_reqbypass(dmu_sii_reqbypass),
  .dmu_mio_debug_bus_a(dmu_mio_debug_bus_a[7:0]),
  .dmu_mio_debug_bus_b(dmu_mio_debug_bus_b[7:0]),
  .dmu_dbg_err_event(dmu_dbg_err_event),
  .dbg1_dmu_stall(dbg1_dmu_stall),
  .dbg1_dmu_resume(dbg1_dmu_resume),
  .dmu_dbg1_stall_ack(dmu_dbg1_stall_ack),
  .efu_dmu_data(efu_dmu_data),
  .efu_dmu_xfer_en(efu_dmu_xfer_en),
  .efu_dmu_clr(efu_dmu_clr),
  .dmu_efu_data(dmu_efu_data),
  .dmu_efu_xfer_en(dmu_efu_xfer_en),
  .dmu_psr_rate_scale(dmu_psr_rate_scale[1:0]),
  .dmu_psr_pll_en_sds0(dmu_psr_pll_en_sds0),
  .dmu_psr_pll_en_sds1(dmu_psr_pll_en_sds1),
  .dmu_psr_rx_en_b0_sds0(dmu_psr_rx_en_b0_sds0),
  .dmu_psr_rx_en_b1_sds0(dmu_psr_rx_en_b1_sds0),
  .dmu_psr_rx_en_b2_sds0(dmu_psr_rx_en_b2_sds0),
  .dmu_psr_rx_en_b3_sds0(dmu_psr_rx_en_b3_sds0),
  .dmu_psr_rx_en_b0_sds1(dmu_psr_rx_en_b0_sds1),
  .dmu_psr_rx_en_b1_sds1(dmu_psr_rx_en_b1_sds1),
  .dmu_psr_rx_en_b2_sds1(dmu_psr_rx_en_b2_sds1),
  .dmu_psr_rx_en_b3_sds1(dmu_psr_rx_en_b3_sds1),
  .dmu_psr_tx_en_b0_sds0(dmu_psr_tx_en_b0_sds0),
  .dmu_psr_tx_en_b1_sds0(dmu_psr_tx_en_b1_sds0),
  .dmu_psr_tx_en_b2_sds0(dmu_psr_tx_en_b2_sds0),
  .dmu_psr_tx_en_b3_sds0(dmu_psr_tx_en_b3_sds0),
  .dmu_psr_tx_en_b0_sds1(dmu_psr_tx_en_b0_sds1),
  .dmu_psr_tx_en_b1_sds1(dmu_psr_tx_en_b1_sds1),
  .dmu_psr_tx_en_b2_sds1(dmu_psr_tx_en_b2_sds1),
  .dmu_psr_tx_en_b3_sds1(dmu_psr_tx_en_b3_sds1),
  .d2p_req_id(d2p_req_id[15:0])	// staged div phase
);
`endif  // OPENSPARC_CMP


// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
`ifdef PEU_SYSTEMC_MODEL
 peu peu(

    .rst_por_                 (gl_dmu_peu_por_c3b ), 
    .rst_wmr_                 (gl_dmu_peu_wmr_c3b ), 
    .l2t_clk                   ( cmp_gclk_c3_dmu ),
		 .iol2clk (dmu.l1clk),
  .d2p_csr_ack(d2p_csr_ack),
  .d2p_csr_rcd(d2p_csr_rcd[95:0]),
  .d2p_csr_req(d2p_csr_req),
  .d2p_cto_ack(d2p_cto_ack),
  .d2p_ech_wptr(d2p_ech_wptr[5:0]),
  .d2p_edb_addr(d2p_edb_addr[7:0]),
  .d2p_edb_data(d2p_edb_data[127:0]),
  .d2p_edb_dpar(d2p_edb_dpar[3:0]),
  .d2p_edb_we(d2p_edb_we),
  .d2p_ehb_addr(d2p_ehb_addr[5:0]),
  .d2p_ehb_data(d2p_ehb_data[127:0]),
  .d2p_ehb_dpar(d2p_ehb_dpar[3:0]),
  .d2p_ehb_we(d2p_ehb_we),
  .d2p_erh_wptr(d2p_erh_wptr[5:0]),
  .d2p_ibc_nhc(d2p_ibc_nhc[7:0]),
  .d2p_ibc_pdc(d2p_ibc_pdc[11:0]),
  .d2p_ibc_phc(d2p_ibc_phc[7:0]),
  .d2p_ibc_req(d2p_ibc_req),
  .d2p_idb_addr(d2p_idb_addr[7:0]),
  .d2p_idb_rd(d2p_idb_rd),
  .d2p_ihb_addr(d2p_ihb_addr[5:0]),
  .d2p_ihb_rd(d2p_ihb_rd),
//  .d2p_req_id(d2p_req_id[15:0]),
//  .d2p_spare(d2p_spare[4:0]),
  .p2d_ce_int(p2d_ce_int),
  .p2d_csr_ack(p2d_csr_ack),
  .p2d_csr_rcd(p2d_csr_rcd[95:0]),
  .p2d_csr_req(p2d_csr_req),
  .p2d_cto_req(p2d_cto_req),
  .p2d_cto_tag(p2d_cto_tag[4:0]),
  .p2d_drain(p2d_drain),
  .p2d_ecd_rptr(p2d_ecd_rptr[7:0]),
  .p2d_ech_rptr(p2d_ech_rptr[5:0]),
  .p2d_erd_rptr(p2d_erd_rptr[7:0]),
  .p2d_erh_rptr(p2d_erh_rptr[5:0]),
  .p2d_ibc_ack(p2d_ibc_ack),
  .p2d_idb_data(p2d_idb_data[127:0]),
  .p2d_idb_dpar(p2d_idb_dpar[3:0]),
  .p2d_ihb_data(p2d_ihb_data[127:0]),
  .p2d_ihb_dpar(p2d_ihb_dpar[3:0]),
  .p2d_ihb_wptr(p2d_ihb_wptr[6:0]),
  .p2d_mps(p2d_mps[2:0]),
  .p2d_oe_int(p2d_oe_int),
//  .p2d_spare(p2d_spare[4:0]),
  .p2d_ue_int(p2d_ue_int),
  .link_clk(PEX_REFCLK_P),
  .link_in(PEX_RX_P),
  .link_in_bar(PEX_RX_N),
  .link_out(PEX_TX_P),
  .link_out_bar(PEX_TX_N)

        );

   assign 		 peu_tcu_mbist_done = 1'b0;

`else
/*
peu peu(

    .rst_por_                 (gl_dmu_peu_por_c3b ), 
    .rst_wmr_                 (gl_dmu_peu_wmr_c3b ), 
    .tcu_aclk               ( tcu_asic_aclk             ),
    .tcu_bclk               ( tcu_asic_bclk             ),
    .tcu_scan_en            ( tcu_asic_scan_en          ),
    .tcu_se_scancollar_in   ( tcu_asic_se_scancollar_in ),
    .tcu_array_wr_inhibit   ( tcu_asic_array_wr_inhibit ),
    .scan_in                (tcu_peu_scan_out),
    .scan_out               (peu_scan_out         ), // to be connected to tcu
    .peu_sbs_scan_in        (mcu1_sbs_scan_out ),
    .peu_sbs_scan_out       (peu_mac_sbs_input ),     	//  0324

    .gclk                   ( cmp_gclk_c3_peu ), 	// cmp_gclk_c0_r[0] ), 
    .tcu_peu_io_clk_stop    ( gl_peu_io_clk_stop ),	// staged clk_stop
    .ccu_io_out	( gl_io_out_c3b ),	// staged div phase
    .pc_clk                 (psr_peu_txbclk0 ),
  .ccu_serdes_dtm(ccu_serdes_dtm),
  .cluster_arst_l(cluster_arst_l),
  .rst_dmu_async_por_(rst_dmu_async_por_),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_peu_pc_clk_stop(tcu_peu_pc_clk_stop),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_div_bypass(tcu_div_bypass),
  .tcu_test_protect(tcu_test_protect),
  .tcu_peu_entestcfg(tcu_peu_entestcfg),
  .tcu_peu_testmode(tcu_peu_testmode),
  .tcu_peu_clk_ext(tcu_peu_clk_ext),
  .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .tcu_peu_mbist_start(tcu_peu_mbist_start),
  .peu_tcu_mbist_done(peu_tcu_mbist_done),
  .peu_tcu_mbist_fail(peu_tcu_mbist_fail),
  .tcu_peu_mbist_scan_in(tcu_peu_mbist_scan_in),
  .peu_tcu_mbist_scan_out(peu_tcu_mbist_scan_out),
  .tcu_sbs_scan_en(tcu_sbs_scan_en),
  .tcu_sbs_aclk(tcu_sbs_aclk),
  .tcu_sbs_bclk(tcu_sbs_bclk),
  .tcu_sbs_clk(tcu_sbs_clk),
  .tcu_sbs_uclk(tcu_sbs_uclk),
  .tcu_sbs_enbstx(tcu_sbs_enbstx),
  .tcu_sbs_enbsrx(tcu_sbs_enbsrx),
  .tcu_sbs_enbspt(tcu_sbs_enbspt),
  .tcu_sbs_acmode(tcu_sbs_acmode),
  .tcu_sbs_actestsignal(tcu_sbs_actestsignal),
  .peu_mio_debug_clk(peu_mio_debug_clk),
  .peu_mio_debug_bus_a(peu_mio_debug_bus_a[7:0]),
  .peu_mio_debug_bus_b(peu_mio_debug_bus_b[7:0]),
  .peu_mio_pipe_txdata(peu_mio_pipe_txdata[63:0]),
  .peu_mio_pipe_txdatak(peu_mio_pipe_txdatak[7:0]),
  .d2p_csr_ack(d2p_csr_ack),
  .d2p_csr_rcd(d2p_csr_rcd[95:0]),
  .d2p_csr_req(d2p_csr_req),
  .d2p_cto_ack(d2p_cto_ack),
  .d2p_ech_wptr(d2p_ech_wptr[5:0]),
  .d2p_edb_addr(d2p_edb_addr[7:0]),
  .d2p_edb_data(d2p_edb_data[127:0]),
  .d2p_edb_dpar(d2p_edb_dpar[3:0]),
  .d2p_edb_we(d2p_edb_we),
  .d2p_ehb_addr(d2p_ehb_addr[5:0]),
  .d2p_ehb_data(d2p_ehb_data[127:0]),
  .d2p_ehb_dpar(d2p_ehb_dpar[3:0]),
  .d2p_ehb_we(d2p_ehb_we),
  .d2p_erh_wptr(d2p_erh_wptr[5:0]),
  .d2p_ibc_nhc(d2p_ibc_nhc[7:0]),
  .d2p_ibc_pdc(d2p_ibc_pdc[11:0]),
  .d2p_ibc_phc(d2p_ibc_phc[7:0]),
  .d2p_ibc_req(d2p_ibc_req),
  .d2p_idb_addr(d2p_idb_addr[7:0]),
  .d2p_idb_rd(d2p_idb_rd),
  .d2p_ihb_addr(d2p_ihb_addr[5:0]),
  .d2p_ihb_rd(d2p_ihb_rd),
  .d2p_req_id(d2p_req_id[15:0]),
  .d2p_spare(d2p_spare[4:0]),
  .p2d_ce_int(p2d_ce_int),
  .p2d_csr_ack(p2d_csr_ack),
  .p2d_csr_rcd(p2d_csr_rcd[95:0]),
  .p2d_csr_req(p2d_csr_req),
  .p2d_cto_req(p2d_cto_req),
  .p2d_cto_tag(p2d_cto_tag[4:0]),
  .p2d_drain(p2d_drain),
  .p2d_ecd_rptr(p2d_ecd_rptr[7:0]),
  .p2d_ech_rptr(p2d_ech_rptr[5:0]),
  .p2d_erd_rptr(p2d_erd_rptr[7:0]),
  .p2d_erh_rptr(p2d_erh_rptr[5:0]),
  .p2d_ibc_ack(p2d_ibc_ack),
  .p2d_idb_data(p2d_idb_data[127:0]),
  .p2d_idb_dpar(p2d_idb_dpar[3:0]),
  .p2d_ihb_data(p2d_ihb_data[127:0]),
  .p2d_ihb_dpar(p2d_ihb_dpar[3:0]),
  .p2d_ihb_wptr(p2d_ihb_wptr[6:0]),
  .p2d_mps(p2d_mps[2:0]),
  .p2d_oe_int(p2d_oe_int),
  .p2d_spare(p2d_spare[4:0]),
  .p2d_ue_int(p2d_ue_int),
  .p2d_npwr_stall_en(p2d_npwr_stall_en),
  .psr_peu_rd_b0sds0(psr_peu_rd_b0sds0[9:0]),
  .psr_peu_rd_b1sds0(psr_peu_rd_b1sds0[9:0]),
  .psr_peu_rd_b2sds0(psr_peu_rd_b2sds0[9:0]),
  .psr_peu_rd_b3sds0(psr_peu_rd_b3sds0[9:0]),
  .psr_peu_rd_b0sds1(psr_peu_rd_b0sds1[9:0]),
  .psr_peu_rd_b1sds1(psr_peu_rd_b1sds1[9:0]),
  .psr_peu_rd_b2sds1(psr_peu_rd_b2sds1[9:0]),
  .psr_peu_rd_b3sds1(psr_peu_rd_b3sds1[9:0]),
  .psr_peu_rxbclk_b0sds0(psr_peu_rxbclk_b0sds0),
  .psr_peu_rxbclk_b1sds0(psr_peu_rxbclk_b1sds0),
  .psr_peu_rxbclk_b2sds0(psr_peu_rxbclk_b2sds0),
  .psr_peu_rxbclk_b3sds0(psr_peu_rxbclk_b3sds0),
  .psr_peu_rxbclk_b0sds1(psr_peu_rxbclk_b0sds1),
  .psr_peu_rxbclk_b1sds1(psr_peu_rxbclk_b1sds1),
  .psr_peu_rxbclk_b2sds1(psr_peu_rxbclk_b2sds1),
  .psr_peu_rxbclk_b3sds1(psr_peu_rxbclk_b3sds1),
  .psr_peu_bsrxn_b0sds0(psr_peu_bsrxn_b0sds0),
  .psr_peu_bsrxn_b1sds0(psr_peu_bsrxn_b1sds0),
  .psr_peu_bsrxn_b2sds0(psr_peu_bsrxn_b2sds0),
  .psr_peu_bsrxn_b3sds0(psr_peu_bsrxn_b3sds0),
  .psr_peu_bsrxn_b0sds1(psr_peu_bsrxn_b0sds1),
  .psr_peu_bsrxn_b1sds1(psr_peu_bsrxn_b1sds1),
  .psr_peu_bsrxn_b2sds1(psr_peu_bsrxn_b2sds1),
  .psr_peu_bsrxn_b3sds1(psr_peu_bsrxn_b3sds1),
  .psr_peu_bsrxp_b0sds0(psr_peu_bsrxp_b0sds0),
  .psr_peu_bsrxp_b1sds0(psr_peu_bsrxp_b1sds0),
  .psr_peu_bsrxp_b2sds0(psr_peu_bsrxp_b2sds0),
  .psr_peu_bsrxp_b3sds0(psr_peu_bsrxp_b3sds0),
  .psr_peu_bsrxp_b0sds1(psr_peu_bsrxp_b0sds1),
  .psr_peu_bsrxp_b1sds1(psr_peu_bsrxp_b1sds1),
  .psr_peu_bsrxp_b2sds1(psr_peu_bsrxp_b2sds1),
  .psr_peu_bsrxp_b3sds1(psr_peu_bsrxp_b3sds1),
  .psr_peu_losdtct_b0sds0(psr_peu_losdtct_b0sds0),
  .psr_peu_losdtct_b1sds0(psr_peu_losdtct_b1sds0),
  .psr_peu_losdtct_b2sds0(psr_peu_losdtct_b2sds0),
  .psr_peu_losdtct_b3sds0(psr_peu_losdtct_b3sds0),
  .psr_peu_losdtct_b0sds1(psr_peu_losdtct_b0sds1),
  .psr_peu_losdtct_b1sds1(psr_peu_losdtct_b1sds1),
  .psr_peu_losdtct_b2sds1(psr_peu_losdtct_b2sds1),
  .psr_peu_losdtct_b3sds1(psr_peu_losdtct_b3sds1),
  .psr_peu_sync_b0sds0(psr_peu_sync_b0sds0),
  .psr_peu_sync_b1sds0(psr_peu_sync_b1sds0),
  .psr_peu_sync_b2sds0(psr_peu_sync_b2sds0),
  .psr_peu_sync_b3sds0(psr_peu_sync_b3sds0),
  .psr_peu_sync_b0sds1(psr_peu_sync_b0sds1),
  .psr_peu_sync_b1sds1(psr_peu_sync_b1sds1),
  .psr_peu_sync_b2sds1(psr_peu_sync_b2sds1),
  .psr_peu_sync_b3sds1(psr_peu_sync_b3sds1),
  .psr_peu_rx_tstfail_b0sds0(psr_peu_rx_tstfail_b0sds0),
  .psr_peu_rx_tstfail_b1sds0(psr_peu_rx_tstfail_b1sds0),
  .psr_peu_rx_tstfail_b2sds0(psr_peu_rx_tstfail_b2sds0),
  .psr_peu_rx_tstfail_b3sds0(psr_peu_rx_tstfail_b3sds0),
  .psr_peu_rx_tstfail_b0sds1(psr_peu_rx_tstfail_b0sds1),
  .psr_peu_rx_tstfail_b1sds1(psr_peu_rx_tstfail_b1sds1),
  .psr_peu_rx_tstfail_b2sds1(psr_peu_rx_tstfail_b2sds1),
  .psr_peu_rx_tstfail_b3sds1(psr_peu_rx_tstfail_b3sds1),
  .psr_peu_rdtcip_b0sds0(psr_peu_rdtcip_b0sds0),
  .psr_peu_rdtcip_b1sds0(psr_peu_rdtcip_b1sds0),
  .psr_peu_rdtcip_b2sds0(psr_peu_rdtcip_b2sds0),
  .psr_peu_rdtcip_b3sds0(psr_peu_rdtcip_b3sds0),
  .psr_peu_rdtcip_b0sds1(psr_peu_rdtcip_b0sds1),
  .psr_peu_rdtcip_b1sds1(psr_peu_rdtcip_b1sds1),
  .psr_peu_rdtcip_b2sds1(psr_peu_rdtcip_b2sds1),
  .psr_peu_rdtcip_b3sds1(psr_peu_rdtcip_b3sds1),
  .psr_peu_tx_tstfail_b0sds0(psr_peu_tx_tstfail_b0sds0),
  .psr_peu_tx_tstfail_b1sds0(psr_peu_tx_tstfail_b1sds0),
  .psr_peu_tx_tstfail_b2sds0(psr_peu_tx_tstfail_b2sds0),
  .psr_peu_tx_tstfail_b3sds0(psr_peu_tx_tstfail_b3sds0),
  .psr_peu_tx_tstfail_b0sds1(psr_peu_tx_tstfail_b0sds1),
  .psr_peu_tx_tstfail_b1sds1(psr_peu_tx_tstfail_b1sds1),
  .psr_peu_tx_tstfail_b2sds1(psr_peu_tx_tstfail_b2sds1),
  .psr_peu_tx_tstfail_b3sds1(psr_peu_tx_tstfail_b3sds1),
  .psr_peu_lock_sds0(psr_peu_lock_sds0),
  .psr_peu_lock_sds1(psr_peu_lock_sds1),
  .peu_psr_td_b0sds0(peu_psr_td_b0sds0[9:0]),
  .peu_psr_td_b1sds0(peu_psr_td_b1sds0[9:0]),
  .peu_psr_td_b2sds0(peu_psr_td_b2sds0[9:0]),
  .peu_psr_td_b3sds0(peu_psr_td_b3sds0[9:0]),
  .peu_psr_td_b0sds1(peu_psr_td_b0sds1[9:0]),
  .peu_psr_td_b1sds1(peu_psr_td_b1sds1[9:0]),
  .peu_psr_td_b2sds1(peu_psr_td_b2sds1[9:0]),
  .peu_psr_td_b3sds1(peu_psr_td_b3sds1[9:0]),
  .peu_psr_invpair_b0sds0(peu_psr_invpair_b0sds0),
  .peu_psr_invpair_b1sds0(peu_psr_invpair_b1sds0),
  .peu_psr_invpair_b2sds0(peu_psr_invpair_b2sds0),
  .peu_psr_invpair_b3sds0(peu_psr_invpair_b3sds0),
  .peu_psr_invpair_b0sds1(peu_psr_invpair_b0sds1),
  .peu_psr_invpair_b1sds1(peu_psr_invpair_b1sds1),
  .peu_psr_invpair_b2sds1(peu_psr_invpair_b2sds1),
  .peu_psr_invpair_b3sds1(peu_psr_invpair_b3sds1),
  .peu_psr_rx_lane_ctl_0(peu_psr_rx_lane_ctl_0[15:0]),
  .peu_psr_rx_lane_ctl_1(peu_psr_rx_lane_ctl_1[15:0]),
  .peu_psr_rx_lane_ctl_2(peu_psr_rx_lane_ctl_2[15:0]),
  .peu_psr_rx_lane_ctl_3(peu_psr_rx_lane_ctl_3[15:0]),
  .peu_psr_rx_lane_ctl_4(peu_psr_rx_lane_ctl_4[15:0]),
  .peu_psr_rx_lane_ctl_5(peu_psr_rx_lane_ctl_5[15:0]),
  .peu_psr_rx_lane_ctl_6(peu_psr_rx_lane_ctl_6[15:0]),
  .peu_psr_rx_lane_ctl_7(peu_psr_rx_lane_ctl_7[15:0]),
  .peu_psr_rdtct_b0sds0(peu_psr_rdtct_b0sds0[1:0]),
  .peu_psr_rdtct_b1sds0(peu_psr_rdtct_b1sds0[1:0]),
  .peu_psr_rdtct_b2sds0(peu_psr_rdtct_b2sds0[1:0]),
  .peu_psr_rdtct_b3sds0(peu_psr_rdtct_b3sds0[1:0]),
  .peu_psr_rdtct_b0sds1(peu_psr_rdtct_b0sds1[1:0]),
  .peu_psr_rdtct_b1sds1(peu_psr_rdtct_b1sds1[1:0]),
  .peu_psr_rdtct_b2sds1(peu_psr_rdtct_b2sds1[1:0]),
  .peu_psr_rdtct_b3sds1(peu_psr_rdtct_b3sds1[1:0]),
  .peu_psr_enidl_b0sds0(peu_psr_enidl_b0sds0),
  .peu_psr_enidl_b1sds0(peu_psr_enidl_b1sds0),
  .peu_psr_enidl_b2sds0(peu_psr_enidl_b2sds0),
  .peu_psr_enidl_b3sds0(peu_psr_enidl_b3sds0),
  .peu_psr_enidl_b0sds1(peu_psr_enidl_b0sds1),
  .peu_psr_enidl_b1sds1(peu_psr_enidl_b1sds1),
  .peu_psr_enidl_b2sds1(peu_psr_enidl_b2sds1),
  .peu_psr_enidl_b3sds1(peu_psr_enidl_b3sds1),
  .peu_psr_bstx_b0sds0(peu_psr_bstx_b0sds0),
  .peu_psr_bstx_b1sds0(peu_psr_bstx_b1sds0),
  .peu_psr_bstx_b2sds0(peu_psr_bstx_b2sds0),
  .peu_psr_bstx_b3sds0(peu_psr_bstx_b3sds0),
  .peu_psr_bstx_b0sds1(peu_psr_bstx_b0sds1),
  .peu_psr_bstx_b1sds1(peu_psr_bstx_b1sds1),
  .peu_psr_bstx_b2sds1(peu_psr_bstx_b2sds1),
  .peu_psr_bstx_b3sds1(peu_psr_bstx_b3sds1),
  .peu_psr_tx_lane_ctl_0(peu_psr_tx_lane_ctl_0[9:0]),
  .peu_psr_tx_lane_ctl_1(peu_psr_tx_lane_ctl_1[9:0]),
  .peu_psr_tx_lane_ctl_2(peu_psr_tx_lane_ctl_2[9:0]),
  .peu_psr_tx_lane_ctl_3(peu_psr_tx_lane_ctl_3[9:0]),
  .peu_psr_tx_lane_ctl_4(peu_psr_tx_lane_ctl_4[9:0]),
  .peu_psr_tx_lane_ctl_5(peu_psr_tx_lane_ctl_5[9:0]),
  .peu_psr_tx_lane_ctl_6(peu_psr_tx_lane_ctl_6[9:0]),
  .peu_psr_tx_lane_ctl_7(peu_psr_tx_lane_ctl_7[9:0]),
  .peu_psr_txbclkin(peu_psr_txbclkin[7:0]),
  .peu_psr_testcfg_sds0(peu_psr_testcfg_sds0[15:0]),
  .peu_psr_testcfg_sds1(peu_psr_testcfg_sds1[15:0]),
  .peu_psr_pll_mpy(peu_psr_pll_mpy[3:0]),
  .peu_psr_pll_lb(peu_psr_pll_lb[1:0]) 
        );
*/
`endif
`endif  // OPENSPARC_CMP


/*
// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
psr psr (

   .VDDT                		(VDDT_PSR),
   .VDDD                		(VDDD_PSR),
   .VDDC                		(VDDC_PSR),
   .VDDA                		(VDDA_PSR),
   .VDDR                		(VDDR_PSR),
   .VSSA                		(VSSA_PSR),
   .dmu_psr_rate_scale_rx_b0sds0	(dmu_psr_rate_scale[ 1 : 0 ] ),
   .dmu_psr_rate_scale_rx_b1sds0	(dmu_psr_rate_scale[ 1 : 0 ] ),
   .dmu_psr_rate_scale_rx_b2sds0	(dmu_psr_rate_scale[ 1 : 0 ] ),
   .dmu_psr_rate_scale_rx_b3sds0	(dmu_psr_rate_scale[ 1 : 0 ] ),
   .dmu_psr_rate_scale_rx_b0sds1	(dmu_psr_rate_scale[ 1 : 0 ] ),
   .dmu_psr_rate_scale_rx_b1sds1	(dmu_psr_rate_scale[ 1 : 0 ] ),
   .dmu_psr_rate_scale_rx_b2sds1	(dmu_psr_rate_scale[ 1 : 0 ] ),
   .dmu_psr_rate_scale_rx_b3sds1	(dmu_psr_rate_scale[ 1 : 0 ] ),
   .dmu_psr_rate_scale_tx_b0sds0	(dmu_psr_rate_scale[ 1 : 0 ] ),
   .dmu_psr_rate_scale_tx_b1sds0	(dmu_psr_rate_scale[ 1 : 0 ] ),
   .dmu_psr_rate_scale_tx_b2sds0	(dmu_psr_rate_scale[ 1 : 0 ] ),
   .dmu_psr_rate_scale_tx_b3sds0	(dmu_psr_rate_scale[ 1 : 0 ] ),
   .dmu_psr_rate_scale_tx_b0sds1	(dmu_psr_rate_scale[ 1 : 0 ] ),
   .dmu_psr_rate_scale_tx_b1sds1	(dmu_psr_rate_scale[ 1 : 0 ] ),
   .dmu_psr_rate_scale_tx_b2sds1	(dmu_psr_rate_scale[ 1 : 0 ] ),
   .dmu_psr_rate_scale_tx_b3sds1	(dmu_psr_rate_scale[ 1 : 0 ] ),
   .tcu_srd_atpgse_sds0			(tcu_srd_atpgse ),
   .tcu_srd_atpgmode_sds0		(tcu_srd_atpgmode[ 2 : 0 ] ),
   .tcu_srd_atpgse_sds1			(tcu_srd_atpgse ),
   .tcu_srd_atpgmode_sds1		(tcu_srd_atpgmode[ 2 : 0 ] ),
   .peu_psr_pll_mpy_sds0		(peu_psr_pll_mpy[ 3 : 0 ] ),
   .peu_psr_pll_lb_sds0			(peu_psr_pll_lb[ 1 : 0 ] ),
   .peu_psr_pll_mpy_sds1		(peu_psr_pll_mpy[ 3 : 0 ] ),
   .peu_psr_pll_lb_sds1			(peu_psr_pll_lb[ 1 : 0 ] ),
   .bsinitclk_sds0	    		(tcu_sbs_bsinitclk ) ,
   .bsinitclk_sds1	    		(tcu_sbs_bsinitclk ) ,
   .tcu_stciclk_sds0			(tcu_stciclk ),
   .tcu_stcicfg_sds0			(tcu_stcicfg[ 1 : 0 ] ),
   .tcu_stciclk_sds1			(tcu_stciclk ),
   .tcu_stcicfg_sds1			(tcu_stcicfg[ 1 : 0 ] ),
   .psr_stcid_sds0			(fsr3_stciq[ 2 ] ),
   .psr_stciq_sds0			(psr_stciq_sds0 ),
   .psr_stcid_sds1			(psr_stciq_sds0 ),
   .psr_stciq_sds1			(esr_stcid ),
   .efu_psr_fclk_sds0			(efu_psr_fclk ),
   .efu_psr_fclrz_sds0			(efu_psr_fclrz ),
   .efu_psr_fclk_sds1			(efu_psr_fclk ),
   .efu_psr_fclrz_sds1			(efu_psr_fclrz ),
   .psr_fdi_sds0			(efu_psr_fdi ),
   .psr_fdo_sds0			(psr_fdo_sds0 ),
   .psr_fdi_sds1			(psr_fdo_sds0 ),
   .psr_fdo_sds1			(psr_efu_fdo ),
   .mio_psr_testclkr_sds0		(mio_psr_testclkr ),
   .mio_psr_testclkt_sds0		(mio_psr_testclkt ),
   .mio_psr_testclkr_sds1		(mio_psr_testclkr ),
   .mio_psr_testclkt_sds1		(mio_psr_testclkt ),

// Int 6.1: Short RXBCLKIN to RXBCLK per I/O, Clk team resolution.
   .peu_psr_rxbclkin	    ({ psr_peu_rxbclk_b3sds1, psr_peu_rxbclk_b2sds1, 
			       psr_peu_rxbclk_b1sds1, psr_peu_rxbclk_b0sds1, 
			       psr_peu_rxbclk_b3sds0, psr_peu_rxbclk_b2sds0, 
			       psr_peu_rxbclk_b1sds0, psr_peu_rxbclk_b0sds0 } ),
   .psr_atpgd               		(fsr_left_atpgq ) ,         
   .psr_atpgq				(esr_atpgd ),
  .PEX_RX_N(PEX_RX_N[7:0]),
  .PEX_RX_P(PEX_RX_P[7:0]),
  .PEX_REFCLK_N(PEX_REFCLK_N),
  .PEX_REFCLK_P(PEX_REFCLK_P),
  .dmu_psr_pll_en_sds0(dmu_psr_pll_en_sds0),
  .dmu_psr_pll_en_sds1(dmu_psr_pll_en_sds1),
  .dmu_psr_rx_en_b0_sds0(dmu_psr_rx_en_b0_sds0),
  .dmu_psr_rx_en_b1_sds0(dmu_psr_rx_en_b1_sds0),
  .dmu_psr_rx_en_b2_sds0(dmu_psr_rx_en_b2_sds0),
  .dmu_psr_rx_en_b3_sds0(dmu_psr_rx_en_b3_sds0),
  .dmu_psr_rx_en_b0_sds1(dmu_psr_rx_en_b0_sds1),
  .dmu_psr_rx_en_b1_sds1(dmu_psr_rx_en_b1_sds1),
  .dmu_psr_rx_en_b2_sds1(dmu_psr_rx_en_b2_sds1),
  .dmu_psr_rx_en_b3_sds1(dmu_psr_rx_en_b3_sds1),
  .dmu_psr_tx_en_b0_sds0(dmu_psr_tx_en_b0_sds0),
  .dmu_psr_tx_en_b1_sds0(dmu_psr_tx_en_b1_sds0),
  .dmu_psr_tx_en_b2_sds0(dmu_psr_tx_en_b2_sds0),
  .dmu_psr_tx_en_b3_sds0(dmu_psr_tx_en_b3_sds0),
  .dmu_psr_tx_en_b0_sds1(dmu_psr_tx_en_b0_sds1),
  .dmu_psr_tx_en_b1_sds1(dmu_psr_tx_en_b1_sds1),
  .dmu_psr_tx_en_b2_sds1(dmu_psr_tx_en_b2_sds1),
  .dmu_psr_tx_en_b3_sds1(dmu_psr_tx_en_b3_sds1),
  .peu_psr_td_b0sds0(peu_psr_td_b0sds0[9:0]),
  .peu_psr_td_b1sds0(peu_psr_td_b1sds0[9:0]),
  .peu_psr_td_b2sds0(peu_psr_td_b2sds0[9:0]),
  .peu_psr_td_b3sds0(peu_psr_td_b3sds0[9:0]),
  .peu_psr_td_b0sds1(peu_psr_td_b0sds1[9:0]),
  .peu_psr_td_b1sds1(peu_psr_td_b1sds1[9:0]),
  .peu_psr_td_b2sds1(peu_psr_td_b2sds1[9:0]),
  .peu_psr_td_b3sds1(peu_psr_td_b3sds1[9:0]),
  .peu_psr_invpair_b0sds0(peu_psr_invpair_b0sds0),
  .peu_psr_invpair_b1sds0(peu_psr_invpair_b1sds0),
  .peu_psr_invpair_b2sds0(peu_psr_invpair_b2sds0),
  .peu_psr_invpair_b3sds0(peu_psr_invpair_b3sds0),
  .peu_psr_invpair_b0sds1(peu_psr_invpair_b0sds1),
  .peu_psr_invpair_b1sds1(peu_psr_invpair_b1sds1),
  .peu_psr_invpair_b2sds1(peu_psr_invpair_b2sds1),
  .peu_psr_invpair_b3sds1(peu_psr_invpair_b3sds1),
  .peu_psr_rx_lane_ctl_0(peu_psr_rx_lane_ctl_0[15:0]),
  .peu_psr_rx_lane_ctl_1(peu_psr_rx_lane_ctl_1[15:0]),
  .peu_psr_rx_lane_ctl_2(peu_psr_rx_lane_ctl_2[15:0]),
  .peu_psr_rx_lane_ctl_3(peu_psr_rx_lane_ctl_3[15:0]),
  .peu_psr_rx_lane_ctl_4(peu_psr_rx_lane_ctl_4[15:0]),
  .peu_psr_rx_lane_ctl_5(peu_psr_rx_lane_ctl_5[15:0]),
  .peu_psr_rx_lane_ctl_6(peu_psr_rx_lane_ctl_6[15:0]),
  .peu_psr_rx_lane_ctl_7(peu_psr_rx_lane_ctl_7[15:0]),
  .peu_psr_rdtct_b0sds0(peu_psr_rdtct_b0sds0[1:0]),
  .peu_psr_rdtct_b1sds0(peu_psr_rdtct_b1sds0[1:0]),
  .peu_psr_rdtct_b2sds0(peu_psr_rdtct_b2sds0[1:0]),
  .peu_psr_rdtct_b3sds0(peu_psr_rdtct_b3sds0[1:0]),
  .peu_psr_rdtct_b0sds1(peu_psr_rdtct_b0sds1[1:0]),
  .peu_psr_rdtct_b1sds1(peu_psr_rdtct_b1sds1[1:0]),
  .peu_psr_rdtct_b2sds1(peu_psr_rdtct_b2sds1[1:0]),
  .peu_psr_rdtct_b3sds1(peu_psr_rdtct_b3sds1[1:0]),
  .peu_psr_enidl_b0sds0(peu_psr_enidl_b0sds0),
  .peu_psr_enidl_b1sds0(peu_psr_enidl_b1sds0),
  .peu_psr_enidl_b2sds0(peu_psr_enidl_b2sds0),
  .peu_psr_enidl_b3sds0(peu_psr_enidl_b3sds0),
  .peu_psr_enidl_b0sds1(peu_psr_enidl_b0sds1),
  .peu_psr_enidl_b1sds1(peu_psr_enidl_b1sds1),
  .peu_psr_enidl_b2sds1(peu_psr_enidl_b2sds1),
  .peu_psr_enidl_b3sds1(peu_psr_enidl_b3sds1),
  .peu_psr_bstx_b0sds0(peu_psr_bstx_b0sds0),
  .peu_psr_bstx_b1sds0(peu_psr_bstx_b1sds0),
  .peu_psr_bstx_b2sds0(peu_psr_bstx_b2sds0),
  .peu_psr_bstx_b3sds0(peu_psr_bstx_b3sds0),
  .peu_psr_bstx_b0sds1(peu_psr_bstx_b0sds1),
  .peu_psr_bstx_b1sds1(peu_psr_bstx_b1sds1),
  .peu_psr_bstx_b2sds1(peu_psr_bstx_b2sds1),
  .peu_psr_bstx_b3sds1(peu_psr_bstx_b3sds1),
  .peu_psr_tx_lane_ctl_0(peu_psr_tx_lane_ctl_0[9:0]),
  .peu_psr_tx_lane_ctl_1(peu_psr_tx_lane_ctl_1[9:0]),
  .peu_psr_tx_lane_ctl_2(peu_psr_tx_lane_ctl_2[9:0]),
  .peu_psr_tx_lane_ctl_3(peu_psr_tx_lane_ctl_3[9:0]),
  .peu_psr_tx_lane_ctl_4(peu_psr_tx_lane_ctl_4[9:0]),
  .peu_psr_tx_lane_ctl_5(peu_psr_tx_lane_ctl_5[9:0]),
  .peu_psr_tx_lane_ctl_6(peu_psr_tx_lane_ctl_6[9:0]),
  .peu_psr_tx_lane_ctl_7(peu_psr_tx_lane_ctl_7[9:0]),
  .peu_psr_txbclkin(peu_psr_txbclkin[7:0]),
  .peu_psr_testcfg_sds0(peu_psr_testcfg_sds0[15:0]),
  .peu_psr_testcfg_sds1(peu_psr_testcfg_sds1[15:0]),
  .PEX_TX_N(PEX_TX_N[7:0]),
  .PEX_TX_P(PEX_TX_P[7:0]),
  .PEX_AMUX(PEX_AMUX[1:0]),
  .psr_peu_rd_b0sds0(psr_peu_rd_b0sds0[9:0]),
  .psr_peu_rd_b1sds0(psr_peu_rd_b1sds0[9:0]),
  .psr_peu_rd_b2sds0(psr_peu_rd_b2sds0[9:0]),
  .psr_peu_rd_b3sds0(psr_peu_rd_b3sds0[9:0]),
  .psr_peu_rd_b0sds1(psr_peu_rd_b0sds1[9:0]),
  .psr_peu_rd_b1sds1(psr_peu_rd_b1sds1[9:0]),
  .psr_peu_rd_b2sds1(psr_peu_rd_b2sds1[9:0]),
  .psr_peu_rd_b3sds1(psr_peu_rd_b3sds1[9:0]),
  .psr_peu_rxbclk_b0sds0(psr_peu_rxbclk_b0sds0),
  .psr_peu_rxbclk_b1sds0(psr_peu_rxbclk_b1sds0),
  .psr_peu_rxbclk_b2sds0(psr_peu_rxbclk_b2sds0),
  .psr_peu_rxbclk_b3sds0(psr_peu_rxbclk_b3sds0),
  .psr_peu_rxbclk_b0sds1(psr_peu_rxbclk_b0sds1),
  .psr_peu_rxbclk_b1sds1(psr_peu_rxbclk_b1sds1),
  .psr_peu_rxbclk_b2sds1(psr_peu_rxbclk_b2sds1),
  .psr_peu_rxbclk_b3sds1(psr_peu_rxbclk_b3sds1),
  .psr_peu_bsrxn_b0sds0(psr_peu_bsrxn_b0sds0),
  .psr_peu_bsrxn_b1sds0(psr_peu_bsrxn_b1sds0),
  .psr_peu_bsrxn_b2sds0(psr_peu_bsrxn_b2sds0),
  .psr_peu_bsrxn_b3sds0(psr_peu_bsrxn_b3sds0),
  .psr_peu_bsrxn_b0sds1(psr_peu_bsrxn_b0sds1),
  .psr_peu_bsrxn_b1sds1(psr_peu_bsrxn_b1sds1),
  .psr_peu_bsrxn_b2sds1(psr_peu_bsrxn_b2sds1),
  .psr_peu_bsrxn_b3sds1(psr_peu_bsrxn_b3sds1),
  .psr_peu_bsrxp_b0sds0(psr_peu_bsrxp_b0sds0),
  .psr_peu_bsrxp_b1sds0(psr_peu_bsrxp_b1sds0),
  .psr_peu_bsrxp_b2sds0(psr_peu_bsrxp_b2sds0),
  .psr_peu_bsrxp_b3sds0(psr_peu_bsrxp_b3sds0),
  .psr_peu_bsrxp_b0sds1(psr_peu_bsrxp_b0sds1),
  .psr_peu_bsrxp_b1sds1(psr_peu_bsrxp_b1sds1),
  .psr_peu_bsrxp_b2sds1(psr_peu_bsrxp_b2sds1),
  .psr_peu_bsrxp_b3sds1(psr_peu_bsrxp_b3sds1),
  .psr_peu_losdtct_b0sds0(psr_peu_losdtct_b0sds0),
  .psr_peu_losdtct_b1sds0(psr_peu_losdtct_b1sds0),
  .psr_peu_losdtct_b2sds0(psr_peu_losdtct_b2sds0),
  .psr_peu_losdtct_b3sds0(psr_peu_losdtct_b3sds0),
  .psr_peu_losdtct_b0sds1(psr_peu_losdtct_b0sds1),
  .psr_peu_losdtct_b1sds1(psr_peu_losdtct_b1sds1),
  .psr_peu_losdtct_b2sds1(psr_peu_losdtct_b2sds1),
  .psr_peu_losdtct_b3sds1(psr_peu_losdtct_b3sds1),
  .psr_peu_sync_b0sds0(psr_peu_sync_b0sds0),
  .psr_peu_sync_b1sds0(psr_peu_sync_b1sds0),
  .psr_peu_sync_b2sds0(psr_peu_sync_b2sds0),
  .psr_peu_sync_b3sds0(psr_peu_sync_b3sds0),
  .psr_peu_sync_b0sds1(psr_peu_sync_b0sds1),
  .psr_peu_sync_b1sds1(psr_peu_sync_b1sds1),
  .psr_peu_sync_b2sds1(psr_peu_sync_b2sds1),
  .psr_peu_sync_b3sds1(psr_peu_sync_b3sds1),
  .psr_peu_rx_tstfail_b0sds0(psr_peu_rx_tstfail_b0sds0),
  .psr_peu_rx_tstfail_b1sds0(psr_peu_rx_tstfail_b1sds0),
  .psr_peu_rx_tstfail_b2sds0(psr_peu_rx_tstfail_b2sds0),
  .psr_peu_rx_tstfail_b3sds0(psr_peu_rx_tstfail_b3sds0),
  .psr_peu_rx_tstfail_b0sds1(psr_peu_rx_tstfail_b0sds1),
  .psr_peu_rx_tstfail_b1sds1(psr_peu_rx_tstfail_b1sds1),
  .psr_peu_rx_tstfail_b2sds1(psr_peu_rx_tstfail_b2sds1),
  .psr_peu_rx_tstfail_b3sds1(psr_peu_rx_tstfail_b3sds1),
  .psr_peu_rdtcip_b0sds0(psr_peu_rdtcip_b0sds0),
  .psr_peu_rdtcip_b1sds0(psr_peu_rdtcip_b1sds0),
  .psr_peu_rdtcip_b2sds0(psr_peu_rdtcip_b2sds0),
  .psr_peu_rdtcip_b3sds0(psr_peu_rdtcip_b3sds0),
  .psr_peu_rdtcip_b0sds1(psr_peu_rdtcip_b0sds1),
  .psr_peu_rdtcip_b1sds1(psr_peu_rdtcip_b1sds1),
  .psr_peu_rdtcip_b2sds1(psr_peu_rdtcip_b2sds1),
  .psr_peu_rdtcip_b3sds1(psr_peu_rdtcip_b3sds1),
  .psr_peu_tx_tstfail_b0sds0(psr_peu_tx_tstfail_b0sds0),
  .psr_peu_tx_tstfail_b1sds0(psr_peu_tx_tstfail_b1sds0),
  .psr_peu_tx_tstfail_b2sds0(psr_peu_tx_tstfail_b2sds0),
  .psr_peu_tx_tstfail_b3sds0(psr_peu_tx_tstfail_b3sds0),
  .psr_peu_tx_tstfail_b0sds1(psr_peu_tx_tstfail_b0sds1),
  .psr_peu_tx_tstfail_b1sds1(psr_peu_tx_tstfail_b1sds1),
  .psr_peu_tx_tstfail_b2sds1(psr_peu_tx_tstfail_b2sds1),
  .psr_peu_tx_tstfail_b3sds1(psr_peu_tx_tstfail_b3sds1),
  .psr_peu_lock_sds0(psr_peu_lock_sds0),
  .psr_peu_lock_sds1(psr_peu_lock_sds1),
  .psr_peu_txbclk0(psr_peu_txbclk0) 
    );
`endif  // OPENSPARC_CMP

*/


//--------------------------------------------------------
//  added the following 5 IO modules
// // Ethernet SerDes (Called ges prior to 4-13-04.) //Replaced by real serdes

//.testcfg_a		    (24'b0			 ),
//.scancfg_a		    ( 2'b0			 ),
//.scancfg_b		    ( 2'b0			 ),
//.scanin_a		    ( 1'b0			 ),
//.testclkr_a		    ( 1'b0			 ),
//.testclkt_a		    ( 1'b0			 ),
//.bstxd_a		    ( 4'b0			 ),
//.cfg_a		    (48'b0			 ),
//.enpll_a		    ( 1'b0			 ),
//.enrx_a		    ( 4'b0			 ),
//.jogcom_a		    ( 4'b0			 ),
//.refclkn_a		    ( 1'b0			 ),
//.refclkp_a		    ( 1'b0			 ),
//.rxbclksta_a		    ( 4'b0			 ),
//.rxn0_a		    ( 1'b0			 ),
//.rxn1_a		    ( 1'b0			 ),
//.rxn2_a		    ( 1'b0			 ),
//.rxn3_a		    ( 1'b0			 ),
//.rxp0_a		    ( 1'b0			 ),
//.rxp1_a		    ( 1'b0			 ),
//.rxp2_a		    ( 1'b0			 ),
//.rxp3_a		    ( 1'b0			 ),
//.rxbclkin_a		    ( 4'b0			 ),
//.td0_a		    (10'b0			 ),
//.td1_a		    (10'b0			 ),
//.td2_a		    (10'b0			 ),
//.td3_a		    (10'b0			 ),
//.mdclk                    ( 1'b0			 ),
//.mdo                      ( 1'b0			 ),
//.mdo_0_en		    ( 1'b0			 ),
//.vref                     ( 1'b0			 ),
//.scanclk_a		    ( 1'b0			 ),
//.txbclksta_a		    ( 4'b0			 ),
//.txbclkin_a		    ( 4'b0			 ),
//.testcfg_b		    (24'b0			 ),
//.scanclk_b		    ( 1'b0			 ),
//.scanin_b		    ( 1'b0			 ),
//.testclkr_b		    ( 1'b0			 ),

//.scanin_b		    ( 1'b0			 ),
//.testclkr_b		    ( 1'b0			 ),
//.testclkt_b		    ( 1'b0			 ),
//.bstxd_b		    ( 4'b0			 ),
//.cfg_b		    (48'b0			 ),
//.enpll_b		    ( 1'b0			 ),
//.enrx_b		    ( 4'b0			 ),
//.jogcom_b		    ( 4'b0			 ),
//.refclkn_b		    ( 1'b0			 ),
//.refclkp_b		    ( 1'b0			 ),
//.rxbclksta_b		    ( 4'b0			 ),
//.rxn0_b		    ( 1'b0			 ),
//.rxn1_b		    ( 1'b0			 ),
//.rxn2_b		    ( 1'b0			 ),
//.rxn3_b		    ( 1'b0			 ),
//.rxp0_b		    ( 1'b0			 ),
//.rxp1_b		    ( 1'b0			 ),
//.rxp2_b		    ( 1'b0			 ),
//.rxp3_b		    ( 1'b0			 ),
//.rxbclkin_b		    ( 4'b0			 ),
//.td0_b		    (10'b0			 ),
//.td1_b		    (10'b0			 ),
//.td2_b		    (10'b0			 ),
//.td3_b		    (10'b0			 ),
//.txbclksta_b		    ( 4'b0			 ),
//.txbclkin_b		    ( 4'b0			 )

//	);

// leave this instance out of cmp model
`ifdef OPENSPARC_CMP
`else
rst rst (
  .scan_in                  ( tcu_rst_scan_out           ),
  .scan_out                 ( rst_scan_out               ),
//.mio_rst_pwron_rst_l      ( mio_rst_pwron_rst_l        ),// PWRON_RST_L
//.mio_rst_button_xir_l     ( mio_rst_button_xir_l       ),// BUTTON_XIR_L
//.mio_rst_pb_rst_l         ( mio_rst_pb_rst_l           ),// PB_RST_L
//.ccu_rst_sys_clk          ( ccu_rst_sys_clk            ),// Sunv name connect.
//.ccu_rst_change           ( ccu_rst_change             ),// Sunv name connect.
//.ccu_io_out               ( ccu_io_out                 ),// Sunv name connect.
  .gclk                     ( cmp_gclk_c1_db1            ), // ( cmp_gclk_c1_rst  - for int6.1 
  .ccu_io_cmp_sync_en       ( gl_io_cmp_sync_en_c1m      ), 
  .ccu_cmp_io_sync_en       ( gl_cmp_io_sync_en_c1m      ),
  .tcu_rst_io_clk_stop      ( gl_rst_io_clk_stop         ),// staged clk_stop
  .tcu_rst_clk_stop         ( gl_rst_clk_stop            ),// staged clk_stop
  .ccu_io_out               ( gl_io_out_c1m              ),
  .ccu_rst_sys_clk(ccu_rst_sys_clk),
  .tcu_div_bypass(tcu_div_bypass),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .ccu_cmp_sys_sync_en(ccu_cmp_sys_sync_en),
  .ccu_sys_cmp_sync_en(ccu_sys_cmp_sync_en),
  .ncu_rst_vld(ncu_rst_vld),
  .ncu_rst_data(ncu_rst_data[3:0]),
  .rst_ncu_stall(rst_ncu_stall),
  .rst_ncu_vld(rst_ncu_vld),
  .rst_ncu_data(rst_ncu_data[3:0]),
  .ncu_rst_stall(ncu_rst_stall),
  .mio_rst_pwron_rst_l(mio_rst_pwron_rst_l),
  .mio_rst_button_xir_l(mio_rst_button_xir_l),
  .ncu_rst_xir_done(ncu_rst_xir_done),
  .tcu_rst_flush_init_ack(tcu_rst_flush_init_ack),
  .tcu_rst_flush_stop_ack(tcu_rst_flush_stop_ack),
  .tcu_rst_asicflush_stop_ack(tcu_rst_asicflush_stop_ack),
  .mio_rst_pb_rst_l(mio_rst_pb_rst_l),
  .ccu_rst_change(ccu_rst_change),
  .tcu_bisx_done(tcu_bisx_done),
  .tcu_rst_efu_done(tcu_rst_efu_done),
  .l2t0_rst_fatal_error(l2t0_rst_fatal_error),
  .l2t1_rst_fatal_error(l2t1_rst_fatal_error),
  .l2t2_rst_fatal_error(l2t2_rst_fatal_error),
  .l2t3_rst_fatal_error(l2t3_rst_fatal_error),
  .l2t4_rst_fatal_error(l2t4_rst_fatal_error),
  .l2t5_rst_fatal_error(l2t5_rst_fatal_error),
  .l2t6_rst_fatal_error(l2t6_rst_fatal_error),
  .l2t7_rst_fatal_error(l2t7_rst_fatal_error),
  .ncu_rst_fatal_error(ncu_rst_fatal_error),
  .tcu_rst_scan_mode(tcu_rst_scan_mode),
  .ccu_rst_sync_stable(ccu_rst_sync_stable),
  .tcu_test_protect(tcu_test_protect),
  .rst_l2_por_(rst_l2_por_),
  .rst_l2_wmr_(rst_l2_wmr_),
  .rst_ccu_pll_(rst_ccu_pll_),
  .rst_ccu_(rst_ccu_),
  .rst_wmr_protect(rst_wmr_protect),
  .rst_tcu_clk_stop(rst_tcu_clk_stop),
  .rst_mcu_selfrsh(rst_mcu_selfrsh),
  .rst_tcu_flush_init_req(rst_tcu_flush_init_req),
  .rst_tcu_flush_stop_req(rst_tcu_flush_stop_req),
  .rst_tcu_asicflush_stop_req(rst_tcu_asicflush_stop_req),
  .rst_niu_mac_(rst_niu_mac_),
  .rst_niu_wmr_(rst_niu_wmr_),
  .rst_dmu_peu_por_(rst_dmu_peu_por_),
  .rst_dmu_peu_wmr_(rst_dmu_peu_wmr_),
  .rst_ncu_unpark_thread(rst_ncu_unpark_thread),
  .rst_ncu_xir_(rst_ncu_xir_),
  .rst_mio_pex_reset_l(rst_mio_pex_reset_l),
  .rst_mio_ssi_sync_l(rst_mio_ssi_sync_l),
  .rst_mio_rst_state(rst_mio_rst_state[5:0]),
  .cluster_arst_l(cluster_arst_l),
  .rst_tcu_dbr_gen(rst_tcu_dbr_gen),
  .rst_dmu_async_por_(rst_dmu_async_por_),
  .rst_tcu_pwron_rst_l(rst_tcu_pwron_rst_l)// staged div phase
        );
`endif  // OPENSPARC_CMP
//________________________________________________________________


n2_revid_cust n2_revid_cust (
   .jtag_revid_in ( 4'h3 ),
   .mask_minor    ( 4'h1 ),
  .jtag_revid_out(jtag_revid_out[3:0]),
  .spc_revid_out(spc_revid_out[3:0]));

//________________________________________________________________

n2_clk_gl_cust n2_clk_gl_cust (
	// PRIMARY INPUTS (FROM CCU) 
	.pll_dr_clk ( drl2clk ) , // .dr_pll_clk ( drl2clk ) , - for int6.1
	.pll_cmp_clk ( l2clk ) , // .cmp_pll_clk ( l2clk ) , - for int6.1
	// OTHERS -- AUTOMATIC CONNECTIONS
	// PRIMARY INPUTS (FROM RST) -- AUTOMATIC CONNECTIONS
	// PRIMARY INPUTS (FROM TCU) -- AUTOMATIC CONNECTIONS
	// STAGED INPUTS 
	.stg1_ccx_clk_stop_in_c1b ( stg1_ccx_clk_stop_c1b  ),
	.stg1_cmp_io_sync_en_in_c1b ( stg1_cmp_io_sync_en_c1b  ),
	.stg1_cmp_io_sync_en_in_c1t ( stg1_cmp_io_sync_en_c1t  ),
	.stg1_db0_clk_stop_in_c1b ( stg1_db0_clk_stop_c1b  ),
	.stg1_dmu_io_clk_stop_in_c1b ( stg1_dmu_io_clk_stop_c1b  ),
	.stg1_dmu_peu_por_in_c1b ( stg1_dmu_peu_por_c1b  ),
	.stg1_dmu_peu_wmr_in_c1b ( stg1_dmu_peu_wmr_c1b  ),
	.stg1_dr_sync_en_in_c1t ( stg1_dr_sync_en_c1t  ),
	.stg1_io2x_out_in_c1b ( stg1_io2x_out_c1b  ),
	.stg1_io_cmp_sync_en_in_c1b ( stg1_io_cmp_sync_en_c1b  ),
	.stg1_io_cmp_sync_en_in_c1t ( stg1_io_cmp_sync_en_c1t  ),
	.stg1_io_out_in_c1b ( stg1_io_out_c1b  ),
	.stg1_io_out_in_c1t ( stg1_io_out_c1t  ),
	.stg1_l2_por_in_c1b ( stg1_rst_l2_por_c1b  ),// UNDRIVEN stg1_l2_por_c1b  
	.stg1_l2_por_in_c1t ( stg1_rst_l2_por_c1t  ),// UNDRIVEN stg1_l2_por_c1t  
	.stg1_l2_wmr_in_c1b ( stg1_rst_l2_wmr_c1b  ),// UNDRIVEN stg1_l2_wmr_c1b 
	.stg1_l2_wmr_in_c1t ( stg1_rst_l2_wmr_c1t  ),// UNDRIVEN stg1_l2_wmr_c1t 
	.stg1_l2b0_clk_stop_in_c1t ( stg1_l2b0_clk_stop_c1t  ),
	.stg1_l2b1_clk_stop_in_c1t ( stg1_l2b1_clk_stop_c1t  ),
	.stg1_l2b2_clk_stop_in_c1b ( stg1_l2b2_clk_stop_c1b  ),
	.stg1_l2b3_clk_stop_in_c1b ( stg1_l2b3_clk_stop_c1b  ),
	.stg1_l2b4_clk_stop_in_c1t ( stg1_l2b4_clk_stop_c1t  ),
	.stg1_l2b5_clk_stop_in_c1t ( stg1_l2b5_clk_stop_c1t  ),
	.stg1_l2d0_clk_stop_in_c1t ( stg1_l2d0_clk_stop_c1t  ),
	.stg1_l2d1_clk_stop_in_c1t ( stg1_l2d1_clk_stop_c1t  ),
	.stg1_l2d2_clk_stop_in_c1b ( stg1_l2d2_clk_stop_c1b  ),
	.stg1_l2d3_clk_stop_in_c1b ( stg1_l2d3_clk_stop_c1b  ),
	.stg1_l2d4_clk_stop_in_c1t ( stg1_l2d4_clk_stop_c1t  ),
	.stg1_l2d5_clk_stop_in_c1t ( stg1_l2d5_clk_stop_c1t  ),
//	.stg1_l2d6_clk_stop_in_c1b ( stg1_l2d6_clk_stop_c1b  ),	// ECO1.2 	-mh157021 
	.stg1_l2d7_clk_stop_in_c1b ( stg1_l2d7_clk_stop_c1b  ), // ECO1.2	-mh157021	
	.stg1_l2t0_clk_stop_in_c1t ( stg1_l2t0_clk_stop_c1t  ),
	.stg1_l2t1_clk_stop_in_c1t ( stg1_l2t1_clk_stop_c1t  ),
	.stg1_l2t2_clk_stop_in_c1b ( stg1_l2t2_clk_stop_c1b  ),
	.stg1_l2t3_clk_stop_in_c1b ( stg1_l2t3_clk_stop_c1b  ),
	.stg1_l2t5_clk_stop_in_c1t ( stg1_l2t5_clk_stop_c1t  ),
	.stg1_l2t7_clk_stop_in_c1b ( stg1_l2t7_clk_stop_c1b  ),
	.stg1_mac_io_clk_stop_in_c1b ( stg1_mac_io_clk_stop_c1b ), // UNDRIVEN stg1_mac_clk_stop_c1b  
	.stg1_mcu0_clk_stop_in_c1t ( stg1_mcu0_clk_stop_c1t  ),
	.stg1_mcu0_dr_clk_stop_in_c2b ( stg1_mcu0_dr_clk_stop_c1t  ), // UNDRIVEN stg1_mcu0_dr_clk_stop_c2t 
	.stg1_mcu0_io_clk_stop_in_c1t ( stg1_mcu0_io_clk_stop_c1t  ),
	.stg1_mcu1_clk_stop_in_c1t ( stg1_mcu1_clk_stop_c1t  ),
	.stg1_mcu1_dr_clk_stop_in_c2b ( stg1_mcu1_dr_clk_stop_c1t  ), // UNDRIVEN stg1_mcu1_dr_clk_stop_c2t 
	.stg1_mcu1_io_clk_stop_in_c1t ( stg1_mcu1_io_clk_stop_c1t  ),
	.stg1_mio_clk_stop_in_c1t ( stg1_mio_clk_stop_c1t  ),
	.stg1_mio_io2x_sync_en_in_c1t ( stg1_io2x_sync_en_c1t ), // UNDRIVEN stg1_mio_io2x_sync_en_c1t  
	.stg1_ncu_clk_stop_in_c1b ( stg1_ncu_clk_stop_c1b  ),
	.stg1_ncu_io_clk_stop_in_c1b ( stg1_ncu_io_clk_stop_c1b  ),
	.stg1_peu_io_clk_stop_in_c1b ( stg1_peu_io_clk_stop_c1b  ),
	.stg1_rdp_io_clk_stop_in_c1b ( stg1_rdp_io_clk_stop_c1b  ), // UNDRIVEN stg1_rdp_clk_stop_c1b  
	.stg1_rst_mac_in_c1b ( stg1_rst_niu_mac_c1b ), // UNDRIVEN stg1_rst_mac_c1b  
	.stg1_rst_niu_wmr_in_c1b ( stg1_rst_niu_wmr_c1b  ),
	.stg1_tds_io_clk_stop_in_c1b (stg1_tds_io_clk_stop_c1b ), // UNDRIVEN stg1_tds_io_clk_stop_c1b  
	.stg1_rtx_io_clk_stop_in_c1b ( stg1_rtx_io_clk_stop_c1b ), // UNDRIVEN stg1_rtx_clk_stop_c1b  
	.stg1_sii_clk_stop_in_c1b ( stg1_sii_clk_stop_c1b  ),
	.stg1_sii_io_clk_stop_in_c1b ( stg1_sii_io_clk_stop_c1b  ),

	.stg1_cmp_io_sync_en_in_c1bg ( stg1_cmp_io_sync_en_c1b ), // for int6.1 (set 3)
	.stg1_cmp_io_sync_en_in_c1tg ( stg1_cmp_io_sync_en_c1t ), // for int6.1 (set 3)
	.stg1_io_cmp_sync_en_in_c1bg ( stg1_io_cmp_sync_en_c1b ), // for int6.1 (set 3)
	.stg1_io_cmp_sync_en_in_c1tg ( stg1_io_cmp_sync_en_c1t ), // for int6.1 (set 3)
	.stg1_io_out_in_c1bg ( stg1_io_out_c1b ), // for int6.1 (set 3)
	.stg1_l2_por_in_c1bg ( stg1_rst_l2_por_c1b ), // for int6.1 (set 3)
	.stg1_l2_por_in_c1tg ( stg1_rst_l2_por_c1t ), // for int6.1 (set 3)
	.stg1_l2_wmr_in_c1bg ( stg1_rst_l2_wmr_c1b ), // for int6.1 (set 3)
	.stg1_l2_wmr_in_c1tg ( stg1_rst_l2_wmr_c1t ), // for int6.1 (set 3)
	.stg1_mio_clk_stop_in_c1tg ( stg1_mio_clk_stop_c1t ), // for int6.1 (set 3)
	.stg1_mio_io2x_sync_en_in_c1tg ( stg1_io2x_sync_en_c1t ), // for int6.1 (set 3)
	.stg4_cmp_io_sync_en_in_c3t0 ( stg4_cmp_io_sync_en_c3t ), // for int6.1 (set 3)
	.stg4_io_cmp_sync_en_in_c3t0 ( stg4_io_cmp_sync_en_c3t ), // for int6.1 (set 3)
	.stg4_io_out_in_c3b0 ( stg4_io_out_c3b ), // for int6.1 (set 3)
	.stg4_l2_por_in_c3t0 ( stg4_l2_por_c3t ), // for int6.1 (set 3)
	.stg4_l2_wmr_in_c3t0 ( stg4_l2_wmr_c3t ), // for int6.1 (set 3)

	.stg1_spc0_clk_stop_in_c1t ( stg1_spc0_clk_stop_c1t  ),
	.stg1_spc1_clk_stop_in_c1t ( stg1_spc1_clk_stop_c1t  ),
	.stg1_spc2_clk_stop_in_c1b ( stg1_spc2_clk_stop_c1b  ),
	.stg1_spc3_clk_stop_in_c1b ( stg1_spc3_clk_stop_c1b  ),
	.stg1_spc4_clk_stop_in_c1t ( stg1_spc4_clk_stop_c1t  ),
	.stg1_spc5_clk_stop_in_c1t ( stg1_spc5_clk_stop_c1t  ),
	.stg1_spc6_clk_stop_in_c1b ( stg1_spc6_clk_stop_c1b  ), // for int6.1 (set 3)
	.stg1_spc7_clk_stop_in_c1b ( stg1_spc7_clk_stop_c1b  ),
	.stg2_ccx_clk_stop_in_c2b ( stg2_ccx_clk_stop_c1b  ),// UNDRIVEN stg2_ccx_clk_stop_c2b  
	.stg2_cmp_io_sync_en_in_c2b ( stg2_cmp_io_sync_en_c1b  ),// UNDRIVEN stg2_cmp_io_sync_en_c2b  
	.stg2_cmp_io_sync_en_in_c2t ( stg2_cmp_io_sync_en_c1t  ),// UNDRIVEN stg2_cmp_io_sync_en_c2t  
	.stg2_db0_clk_stop_in_c2b ( stg2_db0_clk_stop_c1b  ),// UNDRIVEN stg2_db0_clk_stop_c2b  
	.stg2_dmu_io_clk_stop_in_c2b ( stg2_dmu_io_clk_stop_c1b  ), // UNDRIVEN stg2_dmu_io_clk_stop_c2b  
	.stg2_dmu_peu_por_in_c2b ( stg2_dmu_peu_por_c1b  ), // UNDRIVEN stg2_dmu_peu_por_c2b  
	.stg2_dmu_peu_wmr_in_c2b ( stg2_dmu_peu_wmr_c1b  ), // UNDRIVEN stg2_dmu_peu_wmr_c2b  
	.stg2_dr_sync_en_in_c2t ( stg2_dr_sync_en_c1t  ),// stg2_dr_sync_en_c2t  UNDRIVEN 
	.stg2_io_cmp_sync_en_in_c2b ( stg2_io_cmp_sync_en_c1b  ),// UNDRIVEN stg2_io_cmp_sync_en_c2b  
	.stg2_io_cmp_sync_en_in_c2t ( stg2_io_cmp_sync_en_c1t  ),// UNDRIVEN stg2_io_cmp_sync_en_c2t  
	.stg2_io_out_in_c2t ( stg2_io_out_c1t  ),// UNDRIVEN stg2_io_out_c2t  
	.stg2_io_out_in_c2b ( stg2_io_out_c1b  ),// UNDRIVEN stg2_io_out_c2b  
	.stg2_l2_por_in_c2b ( stg2_l2_por_c1b  ),// UNDRIVEN stg2_l2_por_c2b  
	.stg2_l2_por_in_c2t ( stg2_l2_por_c1t  ),// UNDRIVEN stg2_l2_por_c2t  
	.stg2_l2_wmr_in_c2b ( stg2_l2_wmr_c1b  ),// UNDRIVEN stg2_l2_wmr_c2b  
	.stg2_l2_wmr_in_c2t ( stg2_l2_wmr_c1t  ),// UNDRIVEN stg2_l2_wmr_c2t  
	.stg2_l2b0_clk_stop_in_c2t ( stg2_l2b0_clk_stop_c1t  ), // UNDRIVEN stg2_l2b0_clk_stop_c2t 
	.stg2_l2b1_clk_stop_in_c2t ( stg2_l2b1_clk_stop_c1t  ), // UNDRIVEN stg2_l2b1_clk_stop_c2t  
	.stg2_l2b2_clk_stop_in_c2b ( stg2_l2b2_clk_stop_c1b  ),// UNDRIVEN stg2_l2b2_clk_stop_c2b  
	.stg2_l2b3_clk_stop_in_c2b ( stg2_l2b3_clk_stop_c1b  ),// UNDRIVEN stg2_l2b3_clk_stop_c2b  
	.stg2_l2d0_clk_stop_in_c2t ( stg2_l2d0_clk_stop_c1t  ),// UNDRIVEN stg2_l2d0_clk_stop_c2t  
	.stg2_l2d1_clk_stop_in_c2t ( stg2_l2d1_clk_stop_c1t  ),// UNDRIVEN stg2_l2d1_clk_stop_c2t  
	.stg2_l2d2_clk_stop_in_c2b ( stg2_l2d2_clk_stop_c1b  ),// UNDRIVEN stg2_l2d2_clk_stop_c2b  
	.stg2_l2d3_clk_stop_in_c2b ( stg2_l2d3_clk_stop_c1b  ),// UNDRIVEN stg2_l2d3_clk_stop_c2b  
	.stg2_l2t0_clk_stop_in_c2t ( stg2_l2t0_clk_stop_c1t  ),// UNDRIVEN stg2_l2t0_clk_stop_c2t  
	.stg2_l2t1_clk_stop_in_c2t ( stg2_l2t1_clk_stop_c1t  ),// UNDRIVEN stg2_l2t1_clk_stop_c2t  
	.stg2_l2t2_clk_stop_in_c2b ( stg2_l2t2_clk_stop_c1b  ),// UNDRIVEN stg2_l2t2_clk_stop_c2b  
	.stg2_l2t3_clk_stop_in_c2bz ( stg2_l2t3_clk_stop_c1b  ),// UNDRIVEN stg2_l2t3_clk_stop_c2bz  
	.stg2_l2t5_clk_stop_in_c2t ( stg2_l2t5_clk_stop_c1t  ),// UNDRIVEN stg2_l2t5_clk_stop_c2t  
	.stg2_l2t7_clk_stop_in_c2b ( stg2_l2t7_clk_stop_c1b  ),// UNDRIVEN stg2_l2t7_clk_stop_c2b  
	.stg2_mio_io2x_sync_en_in_c2t ( stg2_mio_io2x_sync_en_c1t  ), // UNDRIVEN stg2_mio_io2x_sync_en_c2t  
	.stg2_mio_clk_stop_in_c2t ( stg2_mio_clk_stop_c1t ),// UNDRIVEN stg2_mio_clk_stop_c2t 
	.stg2_ncu_clk_stop_in_c2b ( stg2_ncu_clk_stop_c1b  ),// UNDRIVEN stg2_ncu_clk_stop_c2b  
	.stg2_ncu_io_clk_stop_in_c2b ( stg2_ncu_io_clk_stop_c1b  ), // UNDRIVEN stg2_ncu_io_clk_stop_c2b  
	.stg2_peu_io_clk_stop_in_c2b ( stg2_peu_io_clk_stop_c1b  ), // UNDRIVEN stg2_peu_io_clk_stop_c2b  
	.stg2_sii_clk_stop_in_c2b ( stg2_sii_clk_stop_c1b  ), // UNDRIVEN stg2_sii_clk_stop_c2b  
	.stg2_sii_io_clk_stop_in_c2b ( stg2_sii_io_clk_stop_c1b  ), // UNDRIVEN stg2_sii_io_clk_stop_c2b  
	.stg2_spc0_clk_stop_in_c2t ( stg2_spc0_clk_stop_c1t  ), // UNDRIVEN stg2_spc0_clk_stop_c2t  
	.stg2_spc1_clk_stop_in_c2t ( stg2_spc1_clk_stop_c1t  ), // UNDRIVEN stg2_spc1_clk_stop_c2t  
	.stg2_spc2_clk_stop_in_c2b ( stg2_spc2_clk_stop_c1b  ), // UNDRIVEN stg2_spc2_clk_stop_c2b  
	.stg2_spc3_clk_stop_in_c2b ( stg2_spc3_clk_stop_c1b  ), // UNDRIVEN stg2_spc3_clk_stop_c2b  
	.stg2_spc5_clk_stop_in_c2t ( stg2_spc5_clk_stop_c1t  ), // UNDRIVEN stg2_spc5_clk_stop_c2t  
	.stg2_spc7_clk_stop_in_c2b ( stg2_spc7_clk_stop_c1b  ), // UNDRIVEN stg2_spc7_clk_stop_c2b  
    .stg2_io2x_sync_en_in_c2t  ( 1'b0 ), // ERROR: stg2_mio_io2x_sync_en_c2t 
	.stg3_ccx_clk_stop_in_c2b ( stg3_ccx_clk_stop_c2b  ),
	.stg3_cmp_io_sync_en_in_c2b ( stg3_cmp_io_sync_en_c2b  ), // CHECK
	.stg3_cmp_io_sync_en_in_c2t ( stg3_cmp_io_sync_en_c2t  ), // CHECK
	.stg3_cmp_io_sync_en_in_c3b ( stg3_cmp_io_sync_en_c2b  ),// UNDRIVEN stg3_cmp_io_sync_en_c3b  
	.stg3_cmp_io_sync_en_in_c3t ( stg3_cmp_io_sync_en_c2t  ),// UNDRIVEN stg3_cmp_io_sync_en_c3t  
	.stg3_db0_clk_stop_in_c3b ( stg3_db0_clk_stop_c2b  ),// UNDRIVEN stg3_db0_clk_stop_c3b  
	.stg3_dmu_io_clk_stop_in_c3b ( stg3_dmu_io_clk_stop_c2b  ),// UNDRIVEN stg3_dmu_io_clk_stop_c3b  
	.stg3_dmu_peu_por_in_c3b ( stg3_dmu_peu_por_c2b  ), // UNDRIVEN stg3_dmu_peu_por_c3b  
	.stg3_dmu_peu_wmr_in_c3b ( stg3_dmu_peu_wmr_c2b  ), // UNDRIVEN stg3_dmu_peu_wmr_c3b  
	.stg3_dr_sync_en_in_c3t ( stg3_dr_sync_en_c2t  ),	// stg3_dr_sync_en_c3t   UNDRIVEN
	.stg3_io2x_sync_en_in_c2t ( stg3_mio_io2x_sync_en_c2t ), // UNDRIVEN stg3_io2x_sync_en_c2t  
	.stg3_io_cmp_sync_en_in_c2b ( stg3_io_cmp_sync_en_c2b  ), // CHECK
	.stg3_io_cmp_sync_en_in_c2t ( stg3_io_cmp_sync_en_c2t  ), // CHECK
	.stg3_io_cmp_sync_en_in_c3b ( stg3_io_cmp_sync_en_c2b  ), // UNDRIVEN stg3_io_cmp_sync_en_c3b  
	.stg3_io_cmp_sync_en_in_c3t ( stg3_io_cmp_sync_en_c2t  ), // UNDRIVEN stg3_io_cmp_sync_en_c3t  
	.stg3_io_out_in_c3b ( stg3_io_out_c2b  ), // UNDRIVEN stg3_io_out_c3b  
	.stg3_io_out_in_c3t ( stg3_io_out_c2t  ), // UNDRIVEN stg3_io_out_c3t  
	.stg3_l2_por_in_c2b ( stg3_l2_por_c2b  ),
	.stg3_l2_por_in_c2t ( stg3_l2_por_c2t  ),
	.stg3_l2_por_in_c3b ( stg3_l2_por_c2b  ), // UNDRIVEN stg3_l2_por_c3b  
	.stg3_l2_por_in_c3t ( stg3_l2_por_c2t  ), // UNDRIVEN stg3_l2_por_c3t  
	.stg3_l2_wmr_in_c2b ( stg3_l2_wmr_c2b  ),
	.stg3_l2_wmr_in_c2t ( stg3_l2_wmr_c2t  ),
	.stg3_l2_wmr_in_c3b ( stg3_l2_wmr_c2b  ), // UNDRIVEN stg3_l2_wmr_c3b  
	.stg3_l2_wmr_in_c3t ( stg3_l2_wmr_c2t  ), // UNDRIVEN stg3_l2_wmr_c3t  
	.stg3_l2b0_clk_stop_in_c3t ( stg3_l2b0_clk_stop_c2t  ), // UNDRIVEN stg3_l2b0_clk_stop_c3t  
	.stg3_l2b1_clk_stop_in_c3t ( stg3_l2b1_clk_stop_c2t  ), // UNDRIVEN stg3_l2b1_clk_stop_c3t  
	.stg3_l2b2_clk_stop_in_c3b ( stg3_l2b2_clk_stop_c2b  ), // UNDRIVEN stg3_l2b2_clk_stop_c3b  
	.stg3_l2b3_clk_stop_in_c3b ( stg3_l2b3_clk_stop_c2b  ), // UNDRIVEN stg3_l2b3_clk_stop_c3b  
	.stg3_l2d0_clk_stop_in_c3t ( stg3_l2d0_clk_stop_c2t  ), // UNDRIVEN stg3_l2d0_clk_stop_c3t  
	.stg3_l2d1_clk_stop_in_c3t ( stg3_l2d1_clk_stop_c2t  ), // UNDRIVEN stg3_l2d1_clk_stop_c3t  
	.stg3_l2d2_clk_stop_in_c3b ( stg3_l2d2_clk_stop_c2b  ), // UNDRIVEN stg3_l2d2_clk_stop_c3b  
	.stg3_l2d3_clk_stop_in_c3b ( stg3_l2d3_clk_stop_c2b  ), // UNDRIVEN stg3_l2d3_clk_stop_c3b  
	.stg3_l2t0_clk_stop_in_c3t ( stg3_l2t0_clk_stop_c2t  ), // UNDRIVEN stg3_l2t0_clk_stop_c3t  
	.stg3_l2t1_clk_stop_in_c2t ( stg3_l2t1_clk_stop_c2t  ), // UNDRIVEN stg3_l2t1_clk_stop_c2t  
	.stg3_l2t2_clk_stop_in_c3b ( stg3_l2t2_clk_stop_c2b  ), // UNDRIVEN stg3_l2t2_clk_stop_c3b  
	.stg3_l2t3_clk_stop_in_c2b ( stg3_l2t3_clk_stop_c2b  ),
	.stg3_l2t5_clk_stop_in_c2t ( stg3_l2t5_clk_stop_c2t  ),
	.stg3_l2t7_clk_stop_in_c2b ( stg3_l2t7_clk_stop_c2b  ),
	.stg3_mcu0_clk_stop_in_c3t ( stg3_mcu0_clk_stop_c2t  ), // UNDRIVEN stg3_mcu0_clk_stop_c3t  
	.stg2_mcu0_dr_clk_stop_in_c4t ( stg2_mcu0_dr_clk_stop_c2b  ), // UNDRIVEN stg2_mcu0_dr_clk_stop_c3t  
	.stg3_mcu0_io_clk_stop_in_c3t ( stg3_mcu0_io_clk_stop_c2t  ), // UNDRIVEN stg3_mcu0_io_clk_stop_c3t  
	.stg3_mcu1_clk_stop_in_c3t ( stg3_mcu1_clk_stop_c2t  ), // UNDRIVEN stg3_mcu1_clk_stop_c3t  
	.stg2_mcu1_dr_clk_stop_in_c4t ( stg2_mcu1_dr_clk_stop_c2b ), // UD stg2_mcu1_dr_clk_stop_c3t  
	.stg3_mcu1_io_clk_stop_in_c3t ( stg3_mcu1_io_clk_stop_c2t ), // UD stg3_mcu1_io_clk_stop_c3t  
	.stg3_mio_clk_stop_in_c2t ( stg3_mio_clk_stop_c2t  ),
	.stg3_mio_clk_stop_in_c3t ( stg3_mio_clk_stop_c2t  ), // UNDRIVEN stg3_mio_clk_stop_c3t  
	.stg3_mio_io2x_sync_en_in_c3t ( stg3_mio_io2x_sync_en_c2t  ),// UNDRIVEN stg3_mio_io2x_sync_en_c3t  
	.stg3_ncu_clk_stop_in_c3b ( stg3_ncu_clk_stop_c2b  ),	// UNDRIVEN stg3_ncu_clk_stop_c3b  
	.stg3_ncu_io_clk_stop_in_c3b ( stg3_ncu_io_clk_stop_c2b  ),// UNDRIVEN stg3_ncu_io_clk_stop_c3b  
	.stg3_peu_io_clk_stop_in_c3b ( stg3_peu_io_clk_stop_c2b  ),// UNDRIVEN stg3_peu_io_clk_stop_c3b  
	.stg3_sii_clk_stop_in_c3b ( stg3_sii_clk_stop_c2b  ),// UNDRIVEN stg3_sii_clk_stop_c3b  
	.stg3_sii_io_clk_stop_in_c3b ( stg3_sii_io_clk_stop_c2b  ),// UNDRIVEN stg3_sii_io_clk_stop_c3b  
	.stg3_spc0_clk_stop_in_c3t ( stg3_spc0_clk_stop_c2t  ),	// UNDRIVEN stg3_spc0_clk_stop_c3t  
	.stg3_spc1_clk_stop_in_c2t ( stg3_spc1_clk_stop_c2t  ),	// UNDRIVEN stg3_spc1_clk_stop_c2b  
	.stg3_spc2_clk_stop_in_c3b ( stg3_spc2_clk_stop_c2b  ), // UNDRIVEN stg3_spc2_clk_stop_c3b  
	.stg3_spc3_clk_stop_in_c2b ( stg3_spc3_clk_stop_c2b ),		
	.stg3_spc5_clk_stop_in_c2t ( stg3_spc5_clk_stop_c2t  ), // UNDRIVEN stg3_spc5_clk_stop_c2b  
	.stg3_spc7_clk_stop_in_c2b ( stg3_spc7_clk_stop_c2b ),		
	.stg4_cmp_io_sync_en_in_c3b ( stg4_cmp_io_sync_en_c3b  ),
	.stg4_cmp_io_sync_en_in_c3t ( stg4_cmp_io_sync_en_c3t  ),
	.stg4_db0_clk_stop_c3b ( stg4_db0_clk_stop_c3b ),		// ERROR!! should be stg4_db0_clk_stop_in_c3b 
	.stg4_dmu_io_clk_stop_in_c3b ( stg4_dmu_io_clk_stop_c3b  ),
	.stg4_dmu_peu_por_in_c3b ( stg4_dmu_peu_por_c3b  ),
	.stg4_dmu_peu_wmr_in_c3b ( stg4_dmu_peu_wmr_c3b  ),
	.stg4_dr_sync_en_in_c3t ( stg4_dr_sync_en_c3t  ),
	.stg4_io2x_sync_en_in_c3t ( stg4_mio_io2x_sync_en_c3t ), // UNDRIVEN stg4_io2x_sync_en_c3t 
	.stg4_io_cmp_sync_en_in_c3b ( stg4_io_cmp_sync_en_c3b  ),
	.stg4_io_cmp_sync_en_in_c3t ( stg4_io_cmp_sync_en_c3t  ),
	.stg4_io_out_in_c3b ( stg4_io_out_c3b  ),
	.stg4_io_out_in_c3t ( stg4_io_out_c3t  ),
	.stg4_l2_por_in_c3b ( stg4_l2_por_c3b  ),
	.stg4_l2_por_in_c3t ( stg4_l2_por_c3t  ),
	.stg4_l2_wmr_in_c3b ( stg4_l2_wmr_c3b  ),
	.stg4_l2_wmr_in_c3t ( stg4_l2_wmr_c3t  ),
	.stg4_l2b0_clk_stop_in_c3t ( stg4_l2b0_clk_stop_c3t  ),
	.stg4_l2b1_clk_stop_in_c3t ( stg4_l2b1_clk_stop_c3t  ),
	.stg4_l2b2_clk_stop_in_c3b ( stg4_l2b2_clk_stop_c3b  ),
	.stg4_l2b3_clk_stop_in_c3b ( stg4_l2b3_clk_stop_c3b  ),
	.stg4_l2d0_clk_stop_in_c3t ( stg4_l2d0_clk_stop_c3t  ),
	.stg4_l2d1_clk_stop_in_c3t ( stg4_l2d1_clk_stop_c3t  ),
	.stg4_l2d2_clk_stop_in_c3b ( stg4_l2d2_clk_stop_c3b  ),
	.stg4_l2d3_clk_stop_in_c3b ( stg4_l2d3_clk_stop_c3b  ),
	.stg4_l2t0_clk_stop_in_c3t ( stg4_l2t0_clk_stop_c3t  ),
	.stg4_l2t2_clk_stop_in_c3b ( stg4_l2t2_clk_stop_c3b  ),
//	.stg4_mcu1_dr_clk_stop_in_c3t ( stg4_mcu1_dr_clk_stop_c3t  ),
	.stg4_mcu0_clk_stop_in_c3t ( stg4_mcu0_clk_stop_c3t  ),
//	.stg4_mcu0_dr_clk_stop_in_c3t ( stg4_mcu0_dr_clk_stop_c3t  ),
	.stg4_mcu0_io_clk_stop_in_c3t ( stg4_mcu0_io_clk_stop_c3t  ),
	.stg4_mcu1_clk_stop_in_c3t ( stg4_mcu1_clk_stop_c3t  ),
	.stg4_mcu1_io_clk_stop_in_c3t ( stg4_mcu1_io_clk_stop_c3t  ),
	.stg4_mio_clk_stop_in_c3t ( stg4_mio_clk_stop_c3t  ), // UNDRIVEN stg4_mio_clk_stop_c3tz  
	.stg4_ncu_clk_stop_in_c3b ( stg4_ncu_clk_stop_c3b  ),
	.stg4_ncu_io_clk_stop_c3b ( stg4_ncu_io_clk_stop_c3b ),		// ERROR!! - should be stg4_ncu_io_clk_stop_in_c3b 
	.stg4_peu_io_clk_stop_in_c3b ( stg4_peu_io_clk_stop_c3b  ),
	.stg4_sii_clk_stop_in_c3b ( stg4_sii_clk_stop_c3b  ),
	.stg4_sii_io_clk_stop_in_c3b ( stg4_sii_io_clk_stop_c3b  ),
	.stg4_spc0_clk_stop_in_c3t ( stg4_spc0_clk_stop_c3t  ),
	.stg4_spc2_clk_stop_in_c3b ( stg4_spc2_clk_stop_c3b  ),
	.stg2_mcu0_io_clk_stop_in_c2t ( stg2_mcu0_io_clk_stop_c1t ), // UD stg2_mcu0_io_clk_stop_c2t 
//	.stg2_mcu0_dr_clk_stop_in_c2t ( stg2_mcu0_dr_clk_stop_c1t ), // UD stg2_mcu0_dr_clk_stop_c2t 
//	.stg2_mcu1_dr_clk_stop_in_c2t ( stg2_mcu1_dr_clk_stop_c1t ), // UD stg2_mcu1_dr_clk_stop_c2t 
	.stg2_mcu1_io_clk_stop_in_c2t ( stg2_mcu1_io_clk_stop_c1t ), // UD stg2_mcu1_io_clk_stop_c2t 

	// STAGED OUTPUTS
//	.stg3_mcu0_dr_clk_stop_out_c2t ( stg3_mcu0_dr_clk_stop_c2t ),
	.stg3_mcu0_io_clk_stop_out_c2t ( stg3_mcu0_io_clk_stop_c2t ),
//	.stg3_mcu1_dr_clk_stop_out_c2t ( stg3_mcu1_dr_clk_stop_c2t ),
	.stg3_mcu1_io_clk_stop_out_c2t ( stg3_mcu1_io_clk_stop_c2t ),
	.stg1_ccx_clk_stop_out_c1b ( stg1_ccx_clk_stop_c1b  ),
	.stg1_cmp_io_sync_en_out_c1b ( stg1_cmp_io_sync_en_c1b  ),
	.stg1_cmp_io_sync_en_out_c1t ( stg1_cmp_io_sync_en_c1t  ),
	.stg1_db0_clk_stop_out_c1b ( stg1_db0_clk_stop_c1b  ),
	.stg1_dmu_io_clk_stop_out_c1b ( stg1_dmu_io_clk_stop_c1b  ),
	.stg1_dmu_peu_por_out_c1b ( stg1_dmu_peu_por_c1b  ),
	.stg1_dmu_peu_wmr_out_c1b ( stg1_dmu_peu_wmr_c1b  ),
	.stg1_dr_sync_en_out_c1t ( stg1_dr_sync_en_c1t  ),
	.stg1_io2x_out_out_c1b ( stg1_io2x_out_c1b  ),
	.stg1_io2x_sync_en_out_c1b ( stg1_io2x_sync_en_c1b  ),
	.stg1_io2x_sync_en_out_c1t ( stg1_io2x_sync_en_c1t  ),
	.stg1_io_cmp_sync_en_out_c1b ( stg1_io_cmp_sync_en_c1b  ),
	.stg1_io_cmp_sync_en_out_c1t ( stg1_io_cmp_sync_en_c1t  ),
	.stg1_io_out_out_c1b ( stg1_io_out_c1b  ),
	.stg1_io_out_out_c1t ( stg1_io_out_c1t  ),
	.stg1_l2b0_clk_stop_out_c1t ( stg1_l2b0_clk_stop_c1t  ),
	.stg1_l2b1_clk_stop_out_c1t ( stg1_l2b1_clk_stop_c1t  ),
	.stg1_l2b2_clk_stop_out_c1b ( stg1_l2b2_clk_stop_c1b  ),
	.stg1_l2b3_clk_stop_out_c1b ( stg1_l2b3_clk_stop_c1b  ),
	.stg1_l2b4_clk_stop_out_c1t ( stg1_l2b4_clk_stop_c1t  ),
	.stg1_l2b5_clk_stop_out_c1t ( stg1_l2b5_clk_stop_c1t  ),
	.stg1_l2d0_clk_stop_out_c1t ( stg1_l2d0_clk_stop_c1t  ),
	.stg1_l2d1_clk_stop_out_c1t ( stg1_l2d1_clk_stop_c1t  ),
	.stg1_l2d2_clk_stop_out_c1b ( stg1_l2d2_clk_stop_c1b  ),
	.stg1_l2d3_clk_stop_out_c1b ( stg1_l2d3_clk_stop_c1b  ),
	.stg1_l2d4_clk_stop_out_c1t ( stg1_l2d4_clk_stop_c1t  ),
	.stg1_l2d5_clk_stop_out_c1t ( stg1_l2d5_clk_stop_c1t  ),
//	.stg1_l2d6_clk_stop_out_c1b ( stg1_l2d6_clk_stop_c1b  ),  // ECO1.1 -mh157021
	.stg1_l2d7_clk_stop_out_c1b ( stg1_l2d7_clk_stop_c1b  ),  // ECO1.1 -mh157021
	.stg1_l2t0_clk_stop_out_c1t ( stg1_l2t0_clk_stop_c1t  ),
	.stg1_l2t1_clk_stop_out_c1t ( stg1_l2t1_clk_stop_c1t  ),
	.stg1_l2t2_clk_stop_out_c1b ( stg1_l2t2_clk_stop_c1b  ),
	.stg1_l2t3_clk_stop_out_c1b ( stg1_l2t3_clk_stop_c1b  ),
	.stg1_l2t5_clk_stop_out_c1t ( stg1_l2t5_clk_stop_c1t  ),
	.stg1_l2t7_clk_stop_out_c1b ( stg1_l2t7_clk_stop_c1b  ),
	.stg1_mac_io_clk_stop_out_c1b ( stg1_mac_io_clk_stop_c1b  ),
	.stg1_mcu0_clk_stop_out_c1t ( stg1_mcu0_clk_stop_c1t  ),
	.stg1_mcu0_dr_clk_stop_out_c1t ( stg1_mcu0_dr_clk_stop_c1t  ),
	.stg1_mcu0_io_clk_stop_out_c1t ( stg1_mcu0_io_clk_stop_c1t  ),
	.stg1_mcu1_clk_stop_out_c1t ( stg1_mcu1_clk_stop_c1t  ),
	.stg1_mcu1_dr_clk_stop_out_c1t ( stg1_mcu1_dr_clk_stop_c1t  ),
	.stg1_mcu1_io_clk_stop_out_c1t ( stg1_mcu1_io_clk_stop_c1t  ),
	.stg1_mio_clk_stop_out_c1t ( stg1_mio_clk_stop_c1t  ),
	.stg3_mio_clk_stop_out_c2t ( stg3_mio_clk_stop_c2t  ),
	.stg1_ncu_clk_stop_out_c1b ( stg1_ncu_clk_stop_c1b  ),
	.stg1_ncu_io_clk_stop_out_c1b ( stg1_ncu_io_clk_stop_c1b  ),
	.stg1_peu_io_clk_stop_out_c1b ( stg1_peu_io_clk_stop_c1b  ),
	.stg1_rdp_io_clk_stop_out_c1b ( stg1_rdp_io_clk_stop_c1b  ),
	.stg1_rst_l2_por_out_c1b ( stg1_rst_l2_por_c1b  ),
	.stg1_rst_l2_por_out_c1t ( stg1_rst_l2_por_c1t  ),
	.stg1_rst_l2_wmr_out_c1b ( stg1_rst_l2_wmr_c1b  ),
	.stg1_rst_l2_wmr_out_c1t ( stg1_rst_l2_wmr_c1t  ),
	.stg1_rst_niu_mac_out_c1b ( stg1_rst_niu_mac_c1b  ),
	.stg1_rst_niu_wmr_out_c1b ( stg1_rst_niu_wmr_c1b  ),
	.stg1_rtx_io_clk_stop_out_c1b ( stg1_rtx_io_clk_stop_c1b  ),
	.stg1_sii_clk_stop_out_c1b ( stg1_sii_clk_stop_c1b  ),
	.stg1_sii_io_clk_stop_out_c1b ( stg1_sii_io_clk_stop_c1b  ),
	.stg1_spc0_clk_stop_out_c1t ( stg1_spc0_clk_stop_c1t  ),
	.stg1_spc1_clk_stop_out_c1t ( stg1_spc1_clk_stop_c1t  ),
	.stg1_spc2_clk_stop_out_c1b ( stg1_spc2_clk_stop_c1b  ),
	.stg1_spc3_clk_stop_out_c1b ( stg1_spc3_clk_stop_c1b  ),
	.stg1_spc4_clk_stop_out_c1t ( stg1_spc4_clk_stop_c1t  ),
	.stg1_spc5_clk_stop_out_c1t ( stg1_spc5_clk_stop_c1t  ),
	.stg1_spc6_clk_stop_out_c1b ( stg1_spc6_clk_stop_c1b  ),
	.stg1_spc7_clk_stop_out_c1b ( stg1_spc7_clk_stop_c1b  ),
	.stg1_tds_io_clk_stop_out_c1b ( stg1_tds_io_clk_stop_c1b  ),
	.stg2_ccx_clk_stop_out_c1b ( stg2_ccx_clk_stop_c1b  ),
	.stg2_cmp_io_sync_en_out_c1b ( stg2_cmp_io_sync_en_c1b  ),
	.stg2_cmp_io_sync_en_out_c1t ( stg2_cmp_io_sync_en_c1t  ),
	.stg2_db0_clk_stop_out_c1b ( stg2_db0_clk_stop_c1b  ),
	.stg2_dmu_io_clk_stop_out_c1b ( stg2_dmu_io_clk_stop_c1b  ),
	.stg2_dmu_peu_por_out_c1b ( stg2_dmu_peu_por_c1b  ),
	.stg2_dmu_peu_wmr_out_c1b ( stg2_dmu_peu_wmr_c1b  ),
	.stg2_dr_sync_en_out_c1t ( stg2_dr_sync_en_c1t  ),
	.stg2_io_cmp_sync_en_out_c1b ( stg2_io_cmp_sync_en_c1b  ),
	.stg2_io_cmp_sync_en_out_c1t ( stg2_io_cmp_sync_en_c1t  ),
	.stg2_io_out_out_c1t ( stg2_io_out_c1t  ),
	.stg2_io_out_out_c1b ( stg2_io_out_c1b  ), // marked
	.stg2_l2_por_out_c1b ( stg2_l2_por_c1b  ),
	.stg2_l2_por_out_c1t ( stg2_l2_por_c1t  ),
	.stg2_l2_wmr_out_c1b ( stg2_l2_wmr_c1b  ),
	.stg2_l2_wmr_out_c1t ( stg2_l2_wmr_c1t  ),
	.stg2_l2b0_clk_stop_out_c1t ( stg2_l2b0_clk_stop_c1t  ),
	.stg2_l2b1_clk_stop_out_c1t ( stg2_l2b1_clk_stop_c1t  ),
	.stg2_l2b2_clk_stop_out_c1b ( stg2_l2b2_clk_stop_c1b  ),
	.stg2_l2b3_clk_stop_out_c1b ( stg2_l2b3_clk_stop_c1b  ),
	.stg2_l2d0_clk_stop_out_c1t ( stg2_l2d0_clk_stop_c1t  ),
	.stg2_l2d1_clk_stop_out_c1t ( stg2_l2d1_clk_stop_c1t  ),
	.stg2_l2d2_clk_stop_out_c1b ( stg2_l2d2_clk_stop_c1b  ),
	.stg2_l2d3_clk_stop_out_c1b ( stg2_l2d3_clk_stop_c1b  ),
	.stg2_l2t0_clk_stop_out_c1t ( stg2_l2t0_clk_stop_c1t  ),
	.stg2_l2t1_clk_stop_out_c1t ( stg2_l2t1_clk_stop_c1t  ),
	.stg2_l2t2_clk_stop_out_c1b ( stg2_l2t2_clk_stop_c1b  ),
	.stg2_l2t3_clk_stop_out_c1b ( stg2_l2t3_clk_stop_c1b  ),
	.stg2_l2t5_clk_stop_out_c1t ( stg2_l2t5_clk_stop_c1t  ),
	.stg2_l2t7_clk_stop_out_c1b ( stg2_l2t7_clk_stop_c1b  ),
	.stg2_mcu0_clk_stop_out_c1t ( stg2_mcu0_clk_stop_c1t  ),
	.stg2_mcu0_dr_clk_stop_out_c2b ( stg2_mcu0_dr_clk_stop_c2b  ),
	.stg2_mcu1_dr_clk_stop_out_c2b ( stg2_mcu1_dr_clk_stop_c2b  ),
	.stg2_mcu0_io_clk_stop_out_c1t ( stg2_mcu0_io_clk_stop_c1t  ),
	.stg2_mcu1_clk_stop_out_c1t ( stg2_mcu1_clk_stop_c1t  ),
	.stg2_mcu1_io_clk_stop_out_c1t ( stg2_mcu1_io_clk_stop_c1t  ),
	.stg2_mio_clk_stop_out_c1t ( stg2_mio_clk_stop_c1t  ),
	.stg2_mio_io2x_sync_en_out_c1t ( stg2_mio_io2x_sync_en_c1t  ),
//     .stg2_mio_io2x_sync_en_out_c2t  (stg2_mio_io2x_sync_en_c2t ),
	.stg2_ncu_clk_stop_out_c1b ( stg2_ncu_clk_stop_c1b  ),
	.stg2_ncu_io_clk_stop_out_c1b ( stg2_ncu_io_clk_stop_c1b  ),
	.stg2_peu_io_clk_stop_out_c1b ( stg2_peu_io_clk_stop_c1b  ),
	.stg2_sii_clk_stop_out_c1b ( stg2_sii_clk_stop_c1b  ),
	.stg2_sii_io_clk_stop_out_c1b ( stg2_sii_io_clk_stop_c1b  ),
	.stg2_spc0_clk_stop_out_c1t ( stg2_spc0_clk_stop_c1t  ),
	.stg2_spc1_clk_stop_out_c1t ( stg2_spc1_clk_stop_c1t  ),
	.stg2_spc2_clk_stop_out_c1b ( stg2_spc2_clk_stop_c1b  ),
	.stg2_spc3_clk_stop_out_c1b ( stg2_spc3_clk_stop_c1b  ),
	.stg2_spc5_clk_stop_out_c1t ( stg2_spc5_clk_stop_c1t  ),
	.stg2_spc7_clk_stop_out_c1b ( stg2_spc7_clk_stop_c1b  ),
	.stg3_ccx_clk_stop_out_c2b ( stg3_ccx_clk_stop_c2b  ),
	.stg3_cmp_io_sync_en_out_c2b ( stg3_cmp_io_sync_en_c2b  ),
	.stg3_cmp_io_sync_en_out_c2t ( stg3_cmp_io_sync_en_c2t  ),
	.stg3_db0_clk_stop_out_c2b ( stg3_db0_clk_stop_c2b  ),
	.stg3_dmu_io_clk_stop_out_c2b ( stg3_dmu_io_clk_stop_c2b  ),
	.stg3_dmu_peu_por_out_c2b ( stg3_dmu_peu_por_c2b  ),
	.stg3_dmu_peu_wmr_out_c2b ( stg3_dmu_peu_wmr_c2b  ),
	.stg3_dr_sync_en_out_c2t ( stg3_dr_sync_en_c2t  ),
	.stg3_io_cmp_sync_en_out_c2b ( stg3_io_cmp_sync_en_c2b  ),
	.stg3_io_cmp_sync_en_out_c2t ( stg3_io_cmp_sync_en_c2t  ),
	.stg3_io_out_out_c2t ( stg3_io_out_c2t  ),
	.stg3_l2_por_out_c2b ( stg3_l2_por_c2b  ),
	.stg3_l2_por_out_c2t ( stg3_l2_por_c2t  ),
	.stg3_l2_wmr_out_c2b ( stg3_l2_wmr_c2b  ),
	.stg3_l2_wmr_out_c2t ( stg3_l2_wmr_c2t  ),
	.stg3_l2b0_clk_stop_out_c2t ( stg3_l2b0_clk_stop_c2t  ),
	.stg3_l2b1_clk_stop_out_c2t ( stg3_l2b1_clk_stop_c2t  ),
	.stg3_l2b2_clk_stop_out_c2b ( stg3_l2b2_clk_stop_c2b  ),
	.stg3_l2b3_clk_stop_out_c2b ( stg3_l2b3_clk_stop_c2b  ),
	.stg3_l2d0_clk_stop_out_c2t ( stg3_l2d0_clk_stop_c2t  ),
	.stg3_l2d1_clk_stop_out_c2t ( stg3_l2d1_clk_stop_c2t  ),
	.stg3_l2d2_clk_stop_out_c2b ( stg3_l2d2_clk_stop_c2b  ),
	.stg3_l2d3_clk_stop_out_c2b ( stg3_l2d3_clk_stop_c2b  ),
	.stg3_l2t0_clk_stop_out_c2t ( stg3_l2t0_clk_stop_c2t  ),
	.stg3_l2t1_clk_stop_out_c2t ( stg3_l2t1_clk_stop_c2t  ),
	.stg3_l2t2_clk_stop_out_c2b ( stg3_l2t2_clk_stop_c2b  ),
	.stg3_l2t3_clk_stop_out_c2b ( stg3_l2t3_clk_stop_c2b  ),
	.stg3_l2t5_clk_stop_out_c2t ( stg3_l2t5_clk_stop_c2t  ),
	.stg3_l2t7_clk_stop_out_c2b ( stg3_l2t7_clk_stop_c2b  ),
	.stg3_mio_io2x_sync_en_out_c2t ( stg3_mio_io2x_sync_en_c2t  ),
//	.stg3_mcu0_dr_clk_stop_out_c2t ( stg3_mcu0_dr_clk_stop_c2t  ),
//	.stg3_mcu1_dr_clk_stop_out_c2t ( stg3_mcu1_dr_clk_stop_c2t  ),
	.stg3_ncu_clk_stop_out_c2b ( stg3_ncu_clk_stop_c2b  ),
	.stg3_ncu_io_clk_stop_out_c2b ( stg3_ncu_io_clk_stop_c2b  ),
	.stg3_io_out_out_c2b ( stg3_io_out_c2b  ),	 // marked
	.stg3_peu_io_clk_stop_out_c2b ( stg3_peu_io_clk_stop_c2b  ),
	.stg3_sii_clk_stop_out_c2b ( stg3_sii_clk_stop_c2b  ),
	.stg3_sii_io_clk_stop_out_c2b ( stg3_sii_io_clk_stop_c2b  ),
	.stg3_spc0_clk_stop_out_c2t ( stg3_spc0_clk_stop_c2t  ),
	.stg3_spc1_clk_stop_out_c2t ( stg3_spc1_clk_stop_c2t  ),
	.stg3_spc2_clk_stop_out_c2b ( stg3_spc2_clk_stop_c2b  ),
	.stg3_spc3_clk_stop_out_c2b ( stg3_spc3_clk_stop_c2b  ),
	.stg3_spc5_clk_stop_out_c2t ( stg3_spc5_clk_stop_c2t  ),
	.stg3_spc7_clk_stop_out_c2b ( stg3_spc7_clk_stop_c2b  ),
	.stg4_io2x_sync_en_c3t ( stg4_mio_io2x_sync_en_c3t ),	 // ECO1.3 .( stg4_io2x_sync_en_c3t ) -mh157021
	.stg4_cmp_io_sync_en_out_c3b ( stg4_cmp_io_sync_en_c3b  ),
	.stg4_cmp_io_sync_en_out_c3t ( stg4_cmp_io_sync_en_c3t  ),
	.stg4_db0_clk_stop_out_c3b ( stg4_db0_clk_stop_c3b  ),
	.stg4_dmu_io_clk_stop_out_c3b ( stg4_dmu_io_clk_stop_c3b  ),
	.stg4_dmu_peu_por_out_c3b ( stg4_dmu_peu_por_c3b  ),
	.stg4_dmu_peu_wmr_out_c3b ( stg4_dmu_peu_wmr_c3b  ),
	.stg4_dr_sync_en_out_c3t ( stg4_dr_sync_en_c3t  ),
    .stg3_io2x_sync_en_out_c2t  (stg3_io2x_sync_en_c2t), // ERROR : UNUSED
	// .stg4_io2x_sync_en_out_c2b ( stg4_io2x_sync_en_c2b  ),
	.stg4_io_cmp_sync_en_out_c3b ( stg4_io_cmp_sync_en_c3b  ),
	.stg4_io_cmp_sync_en_out_c3t ( stg4_io_cmp_sync_en_c3t  ),
	.stg4_io_out_out_c3b ( stg4_io_out_c3b  ),
	.stg4_io_out_out_c3t ( stg4_io_out_c3t  ),
	.stg4_l2_por_out_c3b ( stg4_l2_por_c3b  ),
	.stg4_l2_por_out_c3t ( stg4_l2_por_c3t  ),
	.stg4_l2_wmr_out_c3b ( stg4_l2_wmr_c3b  ),
	.stg4_l2_wmr_out_c3t ( stg4_l2_wmr_c3t  ),
	.stg4_l2b0_clk_stop_out_c3t ( stg4_l2b0_clk_stop_c3t  ),
	.stg4_l2b1_clk_stop_out_c3t ( stg4_l2b1_clk_stop_c3t  ),
	.stg4_l2b2_clk_stop_out_c3b ( stg4_l2b2_clk_stop_c3b  ),
	.stg4_l2b3_clk_stop_out_c3b ( stg4_l2b3_clk_stop_c3b  ),
	.stg4_l2d0_clk_stop_out_c3t ( stg4_l2d0_clk_stop_c3t  ),
	.stg4_l2d1_clk_stop_out_c3t ( stg4_l2d1_clk_stop_c3t  ),
	.stg4_l2d2_clk_stop_out_c3b ( stg4_l2d2_clk_stop_c3b  ),
	.stg4_l2d3_clk_stop_out_c3b ( stg4_l2d3_clk_stop_c3b  ),
	.stg4_l2t0_clk_stop_out_c3t ( stg4_l2t0_clk_stop_c3t  ),
	.stg4_l2t2_clk_stop_out_c3b ( stg4_l2t2_clk_stop_c3b  ),
	.stg4_mcu0_clk_stop_out_c3t ( stg4_mcu0_clk_stop_c3t  ),
//	.stg4_mcu0_dr_clk_stop_out_c3t ( stg4_mcu0_dr_clk_stop_c3t  ),
	.stg4_mcu0_io_clk_stop_out_c3t ( stg4_mcu0_io_clk_stop_c3t  ),
	.stg4_mcu1_clk_stop_out_c3t ( stg4_mcu1_clk_stop_c3t  ),
//	.stg4_mcu1_dr_clk_stop_out_c3t ( stg4_mcu1_dr_clk_stop_c3t  ),
	.stg4_mcu1_io_clk_stop_out_c3t ( stg4_mcu1_io_clk_stop_c3t  ),
	.stg4_mio_clk_stop_out_c3t ( stg4_mio_clk_stop_c3t  ),
	.stg4_mio_io2x_sync_en_out_c3t ( stg4_mio_io2x_sync_en_c3t  ),
	.stg4_ncu_clk_stop_out_c3b ( stg4_ncu_clk_stop_c3b  ),
	.stg4_ncu_io_clk_stop_out_c3b ( stg4_ncu_io_clk_stop_c3b  ),
	.stg4_peu_io_clk_stop_out_c3b ( stg4_peu_io_clk_stop_c3b  ),
	.stg4_sii_clk_stop_out_c3b ( stg4_sii_clk_stop_c3b  ),
	.stg4_sii_io_clk_stop_out_c3b ( stg4_sii_io_clk_stop_c3b  ),
	.stg4_spc0_clk_stop_out_c3t ( stg4_spc0_clk_stop_c3t  ),
//	.stg4_spc1_clk_stop_out_c2b ( stg4_spc1_clk_stop_c2b  ),
	.stg4_spc2_clk_stop_out_c3b ( stg4_spc2_clk_stop_c3b  ),
//	.stg4_spc5_clk_stop_out_c2b ( stg4_spc5_clk_stop_c2b  ),
	.stg2_mcu0_clk_stop_in_c2t ( stg2_mcu0_clk_stop_c1t ),// UNDRIVEN stg2_mcu0_clk_stop_in_c2t 
	.stg2_mcu1_clk_stop_in_c2t ( stg2_mcu1_clk_stop_c1t ),// UNDRIVEN stg2_mcu1_clk_stop_in_c2t 
	.stg3_mcu0_clk_stop_out_c2t ( stg3_mcu0_clk_stop_c2t ),
	.stg3_mcu1_clk_stop_out_c2t ( stg3_mcu1_clk_stop_c2t ),
  .cmp_gclk_c1_ccu(cmp_gclk_c1_ccu),
  .cmp_gclk_c2_ccx_left(cmp_gclk_c2_ccx_left),
  .cmp_gclk_c2_ccx_right(cmp_gclk_c2_ccx_right),
  .cmp_gclk_c3_db0(cmp_gclk_c3_db0),
  .cmp_gclk_c1_db1(cmp_gclk_c1_db1),
  .cmp_gclk_c3_dmu(cmp_gclk_c3_dmu),
  .cmp_gclk_c1_efu(cmp_gclk_c1_efu),
  .cmp_gclk_c3_l2b0(cmp_gclk_c3_l2b0),
  .cmp_gclk_c3_l2b1(cmp_gclk_c3_l2b1),
  .cmp_gclk_c3_l2b2(cmp_gclk_c3_l2b2),
  .cmp_gclk_c3_l2b3(cmp_gclk_c3_l2b3),
  .cmp_gclk_c1_l2b4(cmp_gclk_c1_l2b4),
  .cmp_gclk_c1_l2b5(cmp_gclk_c1_l2b5),
  .cmp_gclk_c1_l2b6(cmp_gclk_c1_l2b6),
  .cmp_gclk_c1_l2b7(cmp_gclk_c1_l2b7),
  .cmp_gclk_c3_l2d0(cmp_gclk_c3_l2d0),
  .cmp_gclk_c3_l2d1(cmp_gclk_c3_l2d1),
  .cmp_gclk_c3_l2d2(cmp_gclk_c3_l2d2),
  .cmp_gclk_c3_l2d3(cmp_gclk_c3_l2d3),
  .cmp_gclk_c1_l2d4(cmp_gclk_c1_l2d4),
  .cmp_gclk_c1_l2d5(cmp_gclk_c1_l2d5),
  .cmp_gclk_c1_l2d6(cmp_gclk_c1_l2d6),
  .cmp_gclk_c1_l2d7(cmp_gclk_c1_l2d7),
  .cmp_gclk_c3_l2t0(cmp_gclk_c3_l2t0),
  .cmp_gclk_c3_l2t2(cmp_gclk_c3_l2t2),
  .cmp_gclk_c1_l2t4(cmp_gclk_c1_l2t4),
  .cmp_gclk_c1_l2t6(cmp_gclk_c1_l2t6),
  .cmp_gclk_c2_l2t1(cmp_gclk_c2_l2t1),
  .cmp_gclk_c2_l2t3(cmp_gclk_c2_l2t3),
  .cmp_gclk_c2_l2t5(cmp_gclk_c2_l2t5),
  .cmp_gclk_c2_l2t7(cmp_gclk_c2_l2t7),
  .cmp_gclk_c4_mcu0(cmp_gclk_c4_mcu0),
  .cmp_gclk_c4_mcu1(cmp_gclk_c4_mcu1),
  .cmp_gclk_c0_mcu2(cmp_gclk_c0_mcu2),
  .cmp_gclk_c0_mcu3(cmp_gclk_c0_mcu3),
  .dr_gclk_c4_mcu0(dr_gclk_c4_mcu0),
  .dr_gclk_c4_mcu1(dr_gclk_c4_mcu1),
  .dr_gclk_c0_mcu2(dr_gclk_c0_mcu2),
  .dr_gclk_c0_mcu3(dr_gclk_c0_mcu3),
  .cmp_gclk_c1_mio(cmp_gclk_c1_mio),
  .cmp_gclk_c3_mio(cmp_gclk_c3_mio),
  .cmp_gclk_c2_mio_left(cmp_gclk_c2_mio_left),
  .cmp_gclk_c2_mio_right(cmp_gclk_c2_mio_right),
  .cmp_gclk_c3_ncu(cmp_gclk_c3_ncu),
  .cmp_gclk_c3_peu(cmp_gclk_c3_peu),
  .cmp_gclk_c3_sii(cmp_gclk_c3_sii),
  .cmp_gclk_c1_sio(cmp_gclk_c1_sio),
  .cmp_gclk_c3_spc0(cmp_gclk_c3_spc0),
  .cmp_gclk_c3_spc2(cmp_gclk_c3_spc2),
  .cmp_gclk_c1_spc4(cmp_gclk_c1_spc4),
  .cmp_gclk_c1_spc6(cmp_gclk_c1_spc6),
  .cmp_gclk_c2_spc1(cmp_gclk_c2_spc1),
  .cmp_gclk_c2_spc3(cmp_gclk_c2_spc3),
  .cmp_gclk_c2_spc5(cmp_gclk_c2_spc5),
  .cmp_gclk_c2_spc7(cmp_gclk_c2_spc7),
  .cmp_gclk_c1_tcu(cmp_gclk_c1_tcu),
  .cmp_gclk_c1_mac(cmp_gclk_c1_mac),
  .cmp_gclk_c0_rdp(cmp_gclk_c0_rdp),
  .cmp_gclk_c0_rtx(cmp_gclk_c0_rtx),
  .cmp_gclk_c0_tds(cmp_gclk_c0_tds),
  .cmp_gclk_c3_rng(cmp_gclk_c3_rng),
  .dr_gclk_c4_fsr0_0(dr_gclk_c4_fsr0_0),
  .dr_gclk_c4_fsr0_1(dr_gclk_c4_fsr0_1),
  .dr_gclk_c4_fsr0_2(dr_gclk_c4_fsr0_2),
  .dr_gclk_c4_fsr1_0(dr_gclk_c4_fsr1_0),
  .dr_gclk_c4_fsr1_1(dr_gclk_c4_fsr1_1),
  .dr_gclk_c4_fsr1_2(dr_gclk_c4_fsr1_2),
  .dr_gclk_c4_fsr2_0(dr_gclk_c4_fsr2_0),
  .dr_gclk_c4_fsr2_1(dr_gclk_c4_fsr2_1),
  .dr_gclk_c4_fsr2_2(dr_gclk_c4_fsr2_2),
  .dr_gclk_c4_fsr3_0(dr_gclk_c4_fsr3_0),
  .dr_gclk_c4_fsr3_1(dr_gclk_c4_fsr3_1),
  .dr_gclk_c4_fsr3_2(dr_gclk_c4_fsr3_2),
  .dr_gclk_c0_fsr4_0(dr_gclk_c0_fsr4_0),
  .dr_gclk_c0_fsr4_1(dr_gclk_c0_fsr4_1),
  .dr_gclk_c0_fsr4_2(dr_gclk_c0_fsr4_2),
  .dr_gclk_c0_fsr5_0(dr_gclk_c0_fsr5_0),
  .dr_gclk_c0_fsr5_1(dr_gclk_c0_fsr5_1),
  .dr_gclk_c0_fsr5_2(dr_gclk_c0_fsr5_2),
  .dr_gclk_c0_fsr6_0(dr_gclk_c0_fsr6_0),
  .dr_gclk_c0_fsr6_1(dr_gclk_c0_fsr6_1),
  .dr_gclk_c0_fsr6_2(dr_gclk_c0_fsr6_2),
  .dr_gclk_c2_fsr7_0(dr_gclk_c2_fsr7_0),
  .dr_gclk_c2_fsr7_1(dr_gclk_c2_fsr7_1),
  .dr_gclk_c2_fsr7_2(dr_gclk_c2_fsr7_2),
  .ccu_cmp_io_sync_en(ccu_cmp_io_sync_en),
  .ccu_dr_sync_en(ccu_dr_sync_en),
  .ccu_io2x_out(ccu_io2x_out),
  .ccu_io2x_sync_en(ccu_io2x_sync_en),
  .ccu_io_cmp_sync_en(ccu_io_cmp_sync_en),
  .ccu_io_out(ccu_io_out),
  .ccu_vco_aligned(ccu_vco_aligned),
  .gclk_aligned(gclk_aligned),
  .gl_ccu_clk_stop(gl_ccu_clk_stop),
  .gl_ccu_io_clk_stop(gl_ccu_io_clk_stop),
  .gl_ccx_clk_stop(gl_ccx_clk_stop),
  .gl_cmp_io_sync_en_c1b(gl_cmp_io_sync_en_c1b),
  .gl_cmp_io_sync_en_c1m(gl_cmp_io_sync_en_c1m),
  .gl_cmp_io_sync_en_c1t(gl_cmp_io_sync_en_c1t),
  .gl_cmp_io_sync_en_c2b(gl_cmp_io_sync_en_c2b),
  .gl_cmp_io_sync_en_c2t(gl_cmp_io_sync_en_c2t),
  .gl_cmp_io_sync_en_c3b(gl_cmp_io_sync_en_c3b),
  .gl_cmp_io_sync_en_c3t(gl_cmp_io_sync_en_c3t),
  .gl_cmp_io_sync_en_c3t0(gl_cmp_io_sync_en_c3t0),
  .gl_db0_clk_stop(gl_db0_clk_stop),
  .gl_db1_clk_stop(gl_db1_clk_stop),
  .gl_dmu_io_clk_stop(gl_dmu_io_clk_stop),
  .gl_dmu_peu_por_c3b(gl_dmu_peu_por_c3b),
  .gl_dmu_peu_wmr_c3b(gl_dmu_peu_wmr_c3b),
  .gl_dr_sync_en_c1m(gl_dr_sync_en_c1m),
  .gl_dr_sync_en_c3t(gl_dr_sync_en_c3t),
  .gl_efu_clk_stop(gl_efu_clk_stop),
  .gl_efu_io_clk_stop(gl_efu_io_clk_stop),
  .gl_io2x_out_c1b(gl_io2x_out_c1b),
  .gl_io2x_sync_en_c1m(gl_io2x_sync_en_c1m),
  .gl_io2x_sync_en_c3t(gl_io2x_sync_en_c3t),
  .gl_io2x_sync_en_c3t0(gl_io2x_sync_en_c3t0),
  .gl_io2x_sync_en_c2t(gl_io2x_sync_en_c2t),
  .gl_io_cmp_sync_en_c1b(gl_io_cmp_sync_en_c1b),
  .gl_io_cmp_sync_en_c1m(gl_io_cmp_sync_en_c1m),
  .gl_io_cmp_sync_en_c1t(gl_io_cmp_sync_en_c1t),
  .gl_io_cmp_sync_en_c2b(gl_io_cmp_sync_en_c2b),
  .gl_io_cmp_sync_en_c2t(gl_io_cmp_sync_en_c2t),
  .gl_io_cmp_sync_en_c3b(gl_io_cmp_sync_en_c3b),
  .gl_io_cmp_sync_en_c3t(gl_io_cmp_sync_en_c3t),
  .gl_io_cmp_sync_en_c3t0(gl_io_cmp_sync_en_c3t0),
  .gl_io_out_c1b(gl_io_out_c1b),
  .gl_io_out_c1m(gl_io_out_c1m),
  .gl_io_out_c3b(gl_io_out_c3b),
  .gl_io_out_c3b0(gl_io_out_c3b0),
  .gl_io_out_c3t(gl_io_out_c3t),
  .gl_l2_por_c1t(gl_l2_por_c1t),
  .gl_l2_por_c2b(gl_l2_por_c2b),
  .gl_l2_por_c2t(gl_l2_por_c2t),
  .gl_l2_por_c3b0(gl_l2_por_c3b0),
  .gl_l2_por_c3t(gl_l2_por_c3t),
  .gl_l2_por_c3t0(gl_l2_por_c3t0),
  .gl_l2_wmr_c1b(gl_l2_wmr_c1b),
  .gl_l2_wmr_c1t(gl_l2_wmr_c1t),
  .gl_l2_wmr_c2b(gl_l2_wmr_c2b),
  .gl_l2_wmr_c2t(gl_l2_wmr_c2t),
  .gl_l2_wmr_c3b(gl_l2_wmr_c3b),
  .gl_l2_wmr_c3t(gl_l2_wmr_c3t),
  .gl_l2_wmr_c3t0(gl_l2_wmr_c3t0),
  .gl_l2b0_clk_stop(gl_l2b0_clk_stop),
  .gl_l2b1_clk_stop(gl_l2b1_clk_stop),
  .gl_l2b2_clk_stop(gl_l2b2_clk_stop),
  .gl_l2b3_clk_stop(gl_l2b3_clk_stop),
  .gl_l2b4_clk_stop(gl_l2b4_clk_stop),
  .gl_l2b5_clk_stop(gl_l2b5_clk_stop),
  .gl_l2b6_clk_stop(gl_l2b6_clk_stop),
  .gl_l2b7_clk_stop(gl_l2b7_clk_stop),
  .gl_l2d0_clk_stop(gl_l2d0_clk_stop),
  .gl_l2d1_clk_stop(gl_l2d1_clk_stop),
  .gl_l2d2_clk_stop(gl_l2d2_clk_stop),
  .gl_l2d3_clk_stop(gl_l2d3_clk_stop),
  .gl_l2d4_clk_stop(gl_l2d4_clk_stop),
  .gl_l2d5_clk_stop(gl_l2d5_clk_stop),
  .gl_l2d6_clk_stop(gl_l2d6_clk_stop),
  .gl_l2d7_clk_stop(gl_l2d7_clk_stop),
  .gl_l2t0_clk_stop(gl_l2t0_clk_stop),
  .gl_l2t1_clk_stop(gl_l2t1_clk_stop),
  .gl_l2t2_clk_stop(gl_l2t2_clk_stop),
  .gl_l2t3_clk_stop(gl_l2t3_clk_stop),
  .gl_l2t4_clk_stop(gl_l2t4_clk_stop),
  .gl_l2t5_clk_stop(gl_l2t5_clk_stop),
  .gl_l2t6_clk_stop(gl_l2t6_clk_stop),
  .gl_l2t7_clk_stop(gl_l2t7_clk_stop),
  .gl_mac_io_clk_stop(gl_mac_io_clk_stop),
  .gl_mcu0_clk_stop(gl_mcu0_clk_stop),
  .gl_mcu0_dr_clk_stop(gl_mcu0_dr_clk_stop),
  .gl_mcu0_io_clk_stop(gl_mcu0_io_clk_stop),
  .gl_mcu1_clk_stop(gl_mcu1_clk_stop),
  .gl_mcu1_dr_clk_stop(gl_mcu1_dr_clk_stop),
  .gl_mcu1_io_clk_stop(gl_mcu1_io_clk_stop),
  .gl_mcu2_clk_stop(gl_mcu2_clk_stop),
  .gl_mcu2_dr_clk_stop(gl_mcu2_dr_clk_stop),
  .gl_mcu2_io_clk_stop(gl_mcu2_io_clk_stop),
  .gl_mcu3_clk_stop(gl_mcu3_clk_stop),
  .gl_mcu3_dr_clk_stop(gl_mcu3_dr_clk_stop),
  .gl_mcu3_io_clk_stop(gl_mcu3_io_clk_stop),
  .gl_mio_clk_stop_c1t(gl_mio_clk_stop_c1t),
  .gl_mio_clk_stop_c2t(gl_mio_clk_stop_c2t),
  .gl_mio_clk_stop_c3t(gl_mio_clk_stop_c3t),
  .gl_mio_io2x_sync_en_c1t(gl_mio_io2x_sync_en_c1t),
  .gl_ncu_clk_stop(gl_ncu_clk_stop),
  .gl_ncu_io_clk_stop(gl_ncu_io_clk_stop),
  .gl_peu_io_clk_stop(gl_peu_io_clk_stop),
  .gl_rdp_io_clk_stop(gl_rdp_io_clk_stop),
  .gl_rst_clk_stop(gl_rst_clk_stop),
  .gl_rst_io_clk_stop(gl_rst_io_clk_stop),
  .gl_rst_l2_por_c1m(gl_rst_l2_por_c1m),
  .gl_rst_l2_wmr_c1m(gl_rst_l2_wmr_c1m),
  .gl_rst_mac_c1b(gl_rst_mac_c1b),
  .gl_rst_niu_wmr_c1b(gl_rst_niu_wmr_c1b),
  .gl_rtx_io_clk_stop(gl_rtx_io_clk_stop),
  .gl_sii_clk_stop(gl_sii_clk_stop),
  .gl_sii_io_clk_stop(gl_sii_io_clk_stop),
  .gl_sio_clk_stop(gl_sio_clk_stop),
  .gl_sio_io_clk_stop(gl_sio_io_clk_stop),
  .gl_spc0_clk_stop(gl_spc0_clk_stop),
  .gl_spc1_clk_stop(gl_spc1_clk_stop),
  .gl_spc2_clk_stop(gl_spc2_clk_stop),
  .gl_spc3_clk_stop(gl_spc3_clk_stop),
  .gl_spc4_clk_stop(gl_spc4_clk_stop),
  .gl_spc5_clk_stop(gl_spc5_clk_stop),
  .gl_spc6_clk_stop(gl_spc6_clk_stop),
  .gl_spc7_clk_stop(gl_spc7_clk_stop),
  .gl_tds_io_clk_stop(gl_tds_io_clk_stop),
  .rst_dmu_peu_por_(rst_dmu_peu_por_),
  .rst_dmu_peu_wmr_(rst_dmu_peu_wmr_),
  .rst_l2_por_(rst_l2_por_),
  .rst_l2_wmr_(rst_l2_wmr_),
  .rst_niu_mac_(rst_niu_mac_),
  .gl_l2_por_c1b(gl_l2_por_c1b),
  .rst_niu_wmr_(rst_niu_wmr_),
  .tcu_ccu_clk_stop(tcu_ccu_clk_stop),
  .tcu_ccu_io_clk_stop(tcu_ccu_io_clk_stop),
  .tcu_ccx_clk_stop(tcu_ccx_clk_stop),
  .tcu_db0_clk_stop(tcu_db0_clk_stop),
  .tcu_db1_clk_stop(tcu_db1_clk_stop),
  .tcu_dmu_io_clk_stop(tcu_dmu_io_clk_stop),
  .tcu_efu_clk_stop(tcu_efu_clk_stop),
  .tcu_efu_io_clk_stop(tcu_efu_io_clk_stop),
  .tcu_l2b0_clk_stop(tcu_l2b0_clk_stop),
  .tcu_l2b1_clk_stop(tcu_l2b1_clk_stop),
  .tcu_l2b2_clk_stop(tcu_l2b2_clk_stop),
  .tcu_l2b3_clk_stop(tcu_l2b3_clk_stop),
  .tcu_l2b4_clk_stop(tcu_l2b4_clk_stop),
  .tcu_l2b5_clk_stop(tcu_l2b5_clk_stop),
  .tcu_l2b6_clk_stop(tcu_l2b6_clk_stop),
  .tcu_l2b7_clk_stop(tcu_l2b7_clk_stop),
  .tcu_l2d0_clk_stop(tcu_l2d0_clk_stop),
  .tcu_l2d1_clk_stop(tcu_l2d1_clk_stop),
  .tcu_l2d2_clk_stop(tcu_l2d2_clk_stop),
  .tcu_l2d3_clk_stop(tcu_l2d3_clk_stop),
  .tcu_l2d4_clk_stop(tcu_l2d4_clk_stop),
  .tcu_l2d5_clk_stop(tcu_l2d5_clk_stop),
  .tcu_l2d6_clk_stop(tcu_l2d6_clk_stop),
  .tcu_l2d7_clk_stop(tcu_l2d7_clk_stop),
  .tcu_l2t0_clk_stop(tcu_l2t0_clk_stop),
  .tcu_l2t1_clk_stop(tcu_l2t1_clk_stop),
  .tcu_l2t2_clk_stop(tcu_l2t2_clk_stop),
  .tcu_l2t3_clk_stop(tcu_l2t3_clk_stop),
  .tcu_l2t4_clk_stop(tcu_l2t4_clk_stop),
  .tcu_l2t5_clk_stop(tcu_l2t5_clk_stop),
  .tcu_l2t6_clk_stop(tcu_l2t6_clk_stop),
  .tcu_l2t7_clk_stop(tcu_l2t7_clk_stop),
  .tcu_mac_io_clk_stop(tcu_mac_io_clk_stop),
  .tcu_mcu0_clk_stop(tcu_mcu0_clk_stop),
  .tcu_mcu0_dr_clk_stop(tcu_mcu0_dr_clk_stop),
  .tcu_mcu0_io_clk_stop(tcu_mcu0_io_clk_stop),
  .tcu_mcu1_clk_stop(tcu_mcu1_clk_stop),
  .tcu_mcu1_dr_clk_stop(tcu_mcu1_dr_clk_stop),
  .tcu_mcu1_io_clk_stop(tcu_mcu1_io_clk_stop),
  .tcu_mcu2_clk_stop(tcu_mcu2_clk_stop),
  .tcu_mcu2_dr_clk_stop(tcu_mcu2_dr_clk_stop),
  .tcu_mcu2_io_clk_stop(tcu_mcu2_io_clk_stop),
  .tcu_mcu3_clk_stop(tcu_mcu3_clk_stop),
  .tcu_mcu3_dr_clk_stop(tcu_mcu3_dr_clk_stop),
  .tcu_mcu3_io_clk_stop(tcu_mcu3_io_clk_stop),
  .tcu_mio_clk_stop(tcu_mio_clk_stop),
  .tcu_ncu_clk_stop(tcu_ncu_clk_stop),
  .tcu_ncu_io_clk_stop(tcu_ncu_io_clk_stop),
  .tcu_peu_io_clk_stop(tcu_peu_io_clk_stop),
  .tcu_rdp_io_clk_stop(tcu_rdp_io_clk_stop),
  .tcu_rst_clk_stop(tcu_rst_clk_stop),
  .tcu_rst_io_clk_stop(tcu_rst_io_clk_stop),
  .tcu_rtx_io_clk_stop(tcu_rtx_io_clk_stop),
  .tcu_sii_clk_stop(tcu_sii_clk_stop),
  .tcu_sii_io_clk_stop(tcu_sii_io_clk_stop),
  .tcu_sio_clk_stop(tcu_sio_clk_stop),
  .tcu_sio_io_clk_stop(tcu_sio_io_clk_stop),
  .tcu_spc0_clk_stop(tcu_spc0_clk_stop),
  .tcu_spc1_clk_stop(tcu_spc1_clk_stop),
  .tcu_spc2_clk_stop(tcu_spc2_clk_stop),
  .tcu_spc3_clk_stop(tcu_spc3_clk_stop),
  .tcu_spc4_clk_stop(tcu_spc4_clk_stop),
  .tcu_spc5_clk_stop(tcu_spc5_clk_stop),
  .tcu_spc6_clk_stop(tcu_spc6_clk_stop),
  .tcu_spc7_clk_stop(tcu_spc7_clk_stop),
  .tcu_tds_io_clk_stop(tcu_tds_io_clk_stop)
    // PRIMARY OUTPUTS (CLKS) -- AUTOMATIC CONNECTIONS
	// PRIMARY OUTPUTS -- AUTOMATIC CONNECTIONS
);



endmodule // cpu


