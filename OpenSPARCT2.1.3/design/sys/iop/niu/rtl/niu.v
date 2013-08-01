// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu.v
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
`include "fc.vh"
`include "defines.vh"

`timescale 1ps / 1ps

module niu (
    XAUI0_REFCLK_N,
    XAUI0_REFCLK_P,
    XAUI0_RX_N,
    XAUI0_RX_P,
    XAUI1_RX_N,
    XAUI1_RX_P,
    cluster_arst_l,
    cmp_gclk_c0_rdp,
    cmp_gclk_c0_rtx,
    cmp_gclk_c0_tds,
    cmp_gclk_c1_mac,
    dbg1_niu_dbg_sel,
    dbg1_niu_resume,
    dbg1_niu_stall,
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
    efu_niu_ram0_clr,
    efu_niu_ram0_xfer_en,
    efu_niu_ram1_clr,
    efu_niu_ram1_xfer_en,
    efu_niu_ram_clr,
    efu_niu_ram_data,
    efu_niu_ram_xfer_en,
    esr_atpgd,
    gl_mac_io_clk_stop,
    mac_125rx_test_clk,
    mac_125tx_test_clk,
    mac_156rx_test_clk,
    mac_156tx_test_clk,
    mac_312rx_test_clk,
    mac_312tx_test_clk,
    mdi,
    ncu_niu_ctag_cei,
    ncu_niu_ctag_uei,
    ncu_niu_d_pei,
    ncu_niu_data,
    ncu_niu_stall,
    ncu_niu_vld,
    peu_mac_sbs_input,
    rdp_rdmc_mbist_scan_in,
    rtx_mbist_scan_in,
    sii_niu_bqdq,
    sii_niu_oqdq,
    sio_niu_data,
    sio_niu_datareq,
    sio_niu_hdr_vld,
    sio_niu_parity,
    tcu_div_bypass,
    tcu_mbist_bisi_en,
    tcu_mbist_user_mode,
    tcu_pce_ov,
    tcu_rdp_rdmc_mbist_start,
    tcu_rtx_dmo_ctl,
    tcu_rtx_rxc_ipp0_mbist_start,
    tcu_rtx_rxc_ipp1_mbist_start,
    tcu_rtx_rxc_mb5_mbist_start,
    tcu_rtx_rxc_mb6_mbist_start,
    tcu_rtx_rxc_zcp0_mbist_start,
    tcu_rtx_rxc_zcp1_mbist_start,
    tcu_rtx_txc_txe0_mbist_start,
    tcu_rtx_txc_txe1_mbist_start,
    tcu_sbs_aclk,
    tcu_sbs_acmode,
    tcu_sbs_actestsignal,
    tcu_sbs_bclk,
    tcu_sbs_clk,
    tcu_sbs_enbspt,
    tcu_sbs_enbsrx,
    tcu_sbs_enbstx,
    tcu_sbs_scan_en,
    tcu_sbs_uclk,
    tcu_tds_smx_mbist_start,
    tcu_tds_tdmc_mbist_start,
    tds_mbist_scan_in,
    XAUI0_AMUX,
    XAUI0_TX_N,
    XAUI0_TX_P,
    XAUI1_AMUX,
    XAUI1_TX_N,
    XAUI1_TX_P,
    arb0_rcr_data_req,
    arb0_rcr_req_accept,
    arb0_rdc_data_req,
    arb0_rdc_req_accept,
    arb1_rbr_req_accept,
    arb1_rbr_req_errors,
    esr_atpgq,
    mac_mcu_3_sbs_output,
    mdoe,
    niu_dbg1_stall_ack,
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
    niu_efu_ram0_data,
    niu_efu_ram0_xfer_en,
    niu_efu_ram1_data,
    niu_efu_ram1_xfer_en,
    niu_efu_ram_data,
    niu_efu_ram_xfer_en,
    niu_mio_debug_clock,
    niu_mio_debug_data,
    niu_ncu_ctag_ce,
    niu_ncu_ctag_ue,
    niu_ncu_d_pe,
    niu_ncu_data,
    niu_ncu_stall,
    niu_ncu_vld,
    niu_sii_data,
    niu_sii_datareq,
    niu_sii_hdr_vld,
    niu_sii_parity,
    niu_sii_reqbypass,
    niu_sio_dq,
    niu_txc_interrupts,
    rdp_rdmc_mbist_scan_out,
    rdp_rdmc_tcu_mbist_done,
    rdp_rdmc_tcu_mbist_fail,
    rdp_tcu_dmo_dout,
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
    tdmc_pio_intr,
    tds_mbist_scan_out,
    tds_smx_tcu_mbist_done,
    tds_smx_tcu_mbist_fail,
    tds_tcu_dmo_dout,
    tds_tdmc_tcu_mbist_done,
    tds_tdmc_tcu_mbist_fail,
    xaui_act_led_0,
    xaui_act_led_1,
    xaui_link_led_0,
    xaui_link_led_1 ,
    VDDT_ESR,
    VDDA_ESR,
    VDDD_ESR,
    VDDR_ESR,
    VSSA_ESR,
    gl_io2x_out_c1b,
    gl_io_out_c1b,
    gl_rst_niu_wmr_c1b,
    tcu_asic_aclk,
    tcu_asic_bclk,
    tcu_asic_scan_en,
    tcu_asic_se_scancollar_in,
    tcu_asic_se_scancollar_out,
    tcu_asic_array_wr_inhibit,
    tcu_soce_scan_out,
    gl_rdp_io_clk_stop,
    tcu_soc4_scan_out,
    gl_tds_io_clk_stop,
    tcu_socf_scan_out,
    gl_rtx_io_clk_stop,
    gl_rst_mac_c1b,
    tcu_soc5_scan_out,
    tcu_mac_testmode,
    tcu_stcicfg,
    tcu_stciclk,
    esr_stcid,
    mio_esr_testclkr,
    mio_esr_testclkt,
    efu_niu_fclk,
    efu_niu_fclrz,
    efu_niu_fdi,
    tcu_sbs_bsinitclk,
    tcu_srd_atpgse,
    tcu_srd_atpgmode,
    rdp_scan_out,
    tds_scan_out,
    rtx_scan_out,
    mac_scan_out,
    mdc,
    esr_stciq,
    niu_efu_fdo
    );


input		XAUI0_REFCLK_N;
input		XAUI0_REFCLK_P;
input	[3:0]	XAUI0_RX_N;
input	[3:0]	XAUI0_RX_P;
input	[3:0]	XAUI1_RX_N;
input	[3:0]	XAUI1_RX_P;
input		cluster_arst_l;
input		cmp_gclk_c0_rdp;
input		cmp_gclk_c0_rtx;
input		cmp_gclk_c0_tds;
input		cmp_gclk_c1_mac;
input	[4:0]	dbg1_niu_dbg_sel;
input		dbg1_niu_resume;
input		dbg1_niu_stall;
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
input		efu_niu_ram0_clr;
input		efu_niu_ram0_xfer_en;
input		efu_niu_ram1_clr;
input		efu_niu_ram1_xfer_en;
input		efu_niu_ram_clr;
input		efu_niu_ram_data;
input		efu_niu_ram_xfer_en;
input		esr_atpgd;
input		gl_mac_io_clk_stop;
input		mac_125rx_test_clk;
input		mac_125tx_test_clk;
input		mac_156rx_test_clk;
input		mac_156tx_test_clk;
input		mac_312rx_test_clk;
input		mac_312tx_test_clk;
input		mdi;
input		ncu_niu_ctag_cei;
input		ncu_niu_ctag_uei;
input		ncu_niu_d_pei;
input	[31:0]	ncu_niu_data;
input		ncu_niu_stall;
input		ncu_niu_vld;
input		peu_mac_sbs_input;
input		rdp_rdmc_mbist_scan_in;
input		rtx_mbist_scan_in;
input		sii_niu_bqdq;
input		sii_niu_oqdq;
input	[127:0]	sio_niu_data;
input		sio_niu_datareq;
input		sio_niu_hdr_vld;
input	[7:0]	sio_niu_parity;
input		tcu_div_bypass;
input		tcu_mbist_bisi_en;
input		tcu_mbist_user_mode;
input		tcu_pce_ov;
input		tcu_rdp_rdmc_mbist_start;
input	[2:0]	tcu_rtx_dmo_ctl;
input		tcu_rtx_rxc_ipp0_mbist_start;
input		tcu_rtx_rxc_ipp1_mbist_start;
input		tcu_rtx_rxc_mb5_mbist_start;
input		tcu_rtx_rxc_mb6_mbist_start;
input		tcu_rtx_rxc_zcp0_mbist_start;
input		tcu_rtx_rxc_zcp1_mbist_start;
input		tcu_rtx_txc_txe0_mbist_start;
input		tcu_rtx_txc_txe1_mbist_start;
input		tcu_sbs_aclk;
input		tcu_sbs_acmode;
input		tcu_sbs_actestsignal;
input		tcu_sbs_bclk;
input		tcu_sbs_clk;
input		tcu_sbs_enbspt;
input		tcu_sbs_enbsrx;
input		tcu_sbs_enbstx;
input		tcu_sbs_scan_en;
input		tcu_sbs_uclk;
input		tcu_tds_smx_mbist_start;
input		tcu_tds_tdmc_mbist_start;
input		tds_mbist_scan_in;
output		XAUI0_AMUX;
output	[3:0]	XAUI0_TX_N;
output	[3:0]	XAUI0_TX_P;
output		XAUI1_AMUX;
output	[3:0]	XAUI1_TX_N;
output	[3:0]	XAUI1_TX_P;
output		arb0_rcr_data_req;
output		arb0_rcr_req_accept;
output		arb0_rdc_data_req;
output		arb0_rdc_req_accept;
output		arb1_rbr_req_accept;
output		arb1_rbr_req_errors;
output		esr_atpgq;
output		mac_mcu_3_sbs_output;
output		mdoe;
output		niu_dbg1_stall_ack;
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
output		niu_efu_ram0_data;
output		niu_efu_ram0_xfer_en;
output		niu_efu_ram1_data;
output		niu_efu_ram1_xfer_en;
output		niu_efu_ram_data;
output		niu_efu_ram_xfer_en;
output	[1:0]	niu_mio_debug_clock;
output	[31:0]	niu_mio_debug_data;
output		niu_ncu_ctag_ce;
output		niu_ncu_ctag_ue;
output		niu_ncu_d_pe;
output	[31:0]	niu_ncu_data;
output		niu_ncu_stall;
output		niu_ncu_vld;
output	[127:0]	niu_sii_data;
output		niu_sii_datareq;
output		niu_sii_hdr_vld;
output	[7:0]	niu_sii_parity;
output		niu_sii_reqbypass;
output		niu_sio_dq;
output		niu_txc_interrupts;
output		rdp_rdmc_mbist_scan_out;
output		rdp_rdmc_tcu_mbist_done;
output		rdp_rdmc_tcu_mbist_fail;
output	[39:0]	rdp_tcu_dmo_dout;
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
output	[63:0]	tdmc_pio_intr;
output		tds_mbist_scan_out;
output		tds_smx_tcu_mbist_done;
output		tds_smx_tcu_mbist_fail;
output	[39:0]	tds_tcu_dmo_dout;
output		tds_tdmc_tcu_mbist_done;
output		tds_tdmc_tcu_mbist_fail;
output		xaui_act_led_0;
output		xaui_act_led_1;
output		xaui_link_led_0;
output		xaui_link_led_1;
input		VDDT_ESR;
input		VDDA_ESR;
input		VDDD_ESR;
input		VDDR_ESR;
input		VSSA_ESR;

input		gl_io2x_out_c1b;
input		gl_io_out_c1b;
input		gl_rst_niu_wmr_c1b;
input		tcu_asic_aclk;
input		tcu_asic_bclk;
input		tcu_asic_scan_en;
input		tcu_asic_se_scancollar_in;
input		tcu_asic_se_scancollar_out;
input		tcu_asic_array_wr_inhibit;
input		tcu_soce_scan_out;
input		gl_rdp_io_clk_stop;
input		tcu_soc4_scan_out;
input		gl_tds_io_clk_stop;
input		tcu_socf_scan_out;
input		gl_rtx_io_clk_stop;
input		gl_rst_mac_c1b;
input		tcu_soc5_scan_out;
input		tcu_mac_testmode;
input	[1:0]	tcu_stcicfg;
input		tcu_stciclk;
input		esr_stcid;
input		mio_esr_testclkr;
input		mio_esr_testclkt;
input		efu_niu_fclk;
input		efu_niu_fclrz;
input		efu_niu_fdi;
input		tcu_sbs_bsinitclk;
input		tcu_srd_atpgse;
input	[2:0]	tcu_srd_atpgmode;
output		rdp_scan_out;
output		tds_scan_out;
output		rtx_scan_out;
output		mac_scan_out;
output		mdc;
output		esr_stciq;
output		niu_efu_fdo;

wire [9:0] esr_mac_rxd0_0;
wire [9:0] esr_mac_rxd0_1;
wire [9:0] esr_mac_rxd1_0;
wire [9:0] esr_mac_rxd1_1;
wire [9:0] esr_mac_rxd2_0;
wire [9:0] esr_mac_rxd2_1;
wire [9:0] esr_mac_rxd3_0;
wire [9:0] esr_mac_rxd3_1;
wire [9:0] mac_esr_txd0_0;
wire [9:0] mac_esr_txd0_1;
wire [9:0] mac_esr_txd1_0;
wire [9:0] mac_esr_txd1_1;
wire [9:0] mac_esr_txd2_0;
wire [9:0] mac_esr_txd2_1;
wire [9:0] mac_esr_txd3_0;
wire [9:0] mac_esr_txd3_1;
wire	   xaui_clk;


wire [23:0] dummy;


reg rdp_niu_pio_ucb_niu_clk;
reg rtx_txc_niu_clk;
reg tds_niu_smx_niu_clk;
reg tds_niu_smx_niu_reset_l;

initial begin
  rdp_niu_pio_ucb_niu_clk = 1'b0;
  rtx_txc_niu_clk = 1'b0;
  tds_niu_smx_niu_clk = 1'b0;
  tds_niu_smx_niu_reset_l = 1'b0;
end

always @(posedge cmp_gclk_c0_rdp)
  rdp_niu_pio_ucb_niu_clk = #1 gl_io_out_c1b;

always @(posedge cmp_gclk_c0_tds)
  tds_niu_smx_niu_clk = #1 gl_io_out_c1b;

always @(posedge cmp_gclk_c0_rtx)
  rtx_txc_niu_clk = #1 gl_io_out_c1b;


always @(posedge tds_niu_smx_niu_clk)
  tds_niu_smx_niu_reset_l <= cluster_arst_l;


integer shmem_key;
integer status;
initial shmem_key = 0;

integer live_interval;
initial begin 
  live_interval = 0;
  if ($test$plusargs("live_interval="))
    status = $value$plusargs("live_interval=%d", live_interval); 
  if(live_interval != 0) 
    forever begin
      $display($time, " SYSTEMC: live");
      #live_interval;
    end
end

initial begin
  if ($test$plusargs("dump_niu=")) begin
    $fsdbDumpvars(0, tb_top.cpu.niu);
    $fsdbDumpvars(0, tb_top.enet_model);
 end
end



niu_setup niu_setup ();


wire 	    niu_rd;
wire [26:0] niu_rd_addr;
wire [63:0] niu_rd_data;

niu_ncu_interface niu_ncu_interface(
	.niu_ncu_data (niu_ncu_data),
	.niu_ncu_vld (niu_ncu_vld),
	.niu_ncu_stall (niu_ncu_stall),
	.ncu_niu_data (ncu_niu_data),
	.ncu_niu_vld (ncu_niu_vld),
	.ncu_niu_stall (ncu_niu_stall),
	.clk (rdp_niu_pio_ucb_niu_clk),
	.niu_rd (niu_rd),
	.niu_rd_addr (niu_rd_addr),
	.niu_rd_data (niu_rd_data));

integer niu_csr;

always @(niu_rd) begin
  if(niu_rd) begin
    $display("NIU_READ to sas: %h %h", {8'h81, 5'h0, niu_rd_addr}, niu_rd_data);
    if (`PARGS.nas_check_on ) 
      niu_csr = $sim_send(`PLI_CSR_READ, {24'h0, 8'h81, 5'h0, niu_rd_addr}, niu_rd_data, 8'h01);
  end
end


niu_siu_interface niu_siu_interface(
	.clk			(rdp_niu_pio_ucb_niu_clk),
	.niu_sii_hdr_vld	(niu_sii_hdr_vld),
	.niu_sii_reqbypass	(niu_sii_reqbypass),
	.sio_niu_data		(sio_niu_data),
	.sio_niu_datareq	(sio_niu_datareq),
	.sio_niu_parity		(sio_niu_parity),
	.niu_sio_dq		(niu_sio_dq),
	.niu_sii_data		(niu_sii_data),
	.niu_sii_parity		(niu_sii_parity),
	.niu_sii_datareq	(niu_sii_datareq),
	.sio_niu_hdr_vld	(sio_niu_hdr_vld),
	.sii_niu_bqdq		(sii_niu_bqdq),
	.sii_niu_oqdq		(sii_niu_oqdq));

xaui xaui0 (
        .XAUI_RX_N      (XAUI0_RX_N),
        .XAUI_RX_P      (XAUI0_RX_P),
        .XAUI_AMUX      (XAUI0_AMUX),
        .XAUI_TX_N      (XAUI0_TX_N),
        .XAUI_TX_P      (XAUI0_TX_P),
        .esr_mac_rxd0   (esr_mac_rxd0_0),
        .esr_mac_rxd1   (esr_mac_rxd1_0),
        .esr_mac_rxd2   (esr_mac_rxd2_0),
        .esr_mac_rxd3   (esr_mac_rxd3_0),
        .mac_esr_txd0   (mac_esr_txd0_0),
        .mac_esr_txd1   (mac_esr_txd1_0),
        .mac_esr_txd2   (mac_esr_txd2_0),
        .mac_esr_txd3   (mac_esr_txd3_0),
        .xaui_clk       (xaui_clk),
        .mac_clk        (XAUI0_REFCLK_P),
        .reset          (~gl_rst_mac_c1b));

xaui xaui1 (
        .XAUI_RX_N      (XAUI1_RX_N),
        .XAUI_RX_P      (XAUI1_RX_P),
        .XAUI_AMUX      (XAUI1_AMUX),
        .XAUI_TX_N      (XAUI1_TX_N),
        .XAUI_TX_P      (XAUI1_TX_P),
        .esr_mac_rxd0   (esr_mac_rxd0_1),
        .esr_mac_rxd1   (esr_mac_rxd1_1),
        .esr_mac_rxd2   (esr_mac_rxd2_1),
        .esr_mac_rxd3   (esr_mac_rxd3_1),
        .mac_esr_txd0   (mac_esr_txd0_1),
        .mac_esr_txd1   (mac_esr_txd1_1),
        .mac_esr_txd2   (mac_esr_txd2_1),
        .mac_esr_txd3   (mac_esr_txd3_1),
        .xaui_clk       (xaui_clk),
        .mac_clk        (XAUI0_REFCLK_P),
        .reset          (~gl_rst_mac_c1b));

niu_mac_interface niu_mac_interface (
	.reset		(~gl_rst_mac_c1b),
	.mac_clk	(XAUI0_REFCLK_P),
	.esr_mac_rxd0_0	(esr_mac_rxd0_0),
	.esr_mac_rxd0_1	(esr_mac_rxd0_1),
	.esr_mac_rxd1_0	(esr_mac_rxd1_0),
	.esr_mac_rxd1_1	(esr_mac_rxd1_1),
	.esr_mac_rxd2_0	(esr_mac_rxd2_0),
	.esr_mac_rxd2_1	(esr_mac_rxd2_1),
	.esr_mac_rxd3_0	(esr_mac_rxd3_0),
	.esr_mac_rxd3_1	(esr_mac_rxd3_1),
	.mac_esr_txd0_0	(mac_esr_txd0_0),
	.mac_esr_txd0_1	(mac_esr_txd0_1),
	.mac_esr_txd1_0	(mac_esr_txd1_0),
	.mac_esr_txd1_1	(mac_esr_txd1_1),
	.mac_esr_txd2_0	(mac_esr_txd2_0),
	.mac_esr_txd2_1	(mac_esr_txd2_1),
	.mac_esr_txd3_0	(mac_esr_txd3_0),
	.mac_esr_txd3_1	(mac_esr_txd3_1)
	);

clock_multiplier_10x clock_multiplier_10x(XAUI0_REFCLK_P, xaui_clk);

assign arb0_rcr_data_req	= 1'b0;
assign arb0_rcr_req_accept	= 1'b0;
assign arb0_rdc_data_req	= 1'b0;
assign arb0_rdc_req_accept	= 1'b0;
assign arb1_rbr_req_accept	= 1'b0;
assign arb1_rbr_req_errors	= 1'b0;
assign esr_atpgq		= 1'b0;
assign esr_stciq		= 1'b0;		
assign mac_mcu_3_sbs_output	= 1'b0;
assign mac_scan_out		= 1'b0;	
assign mdc			= 1'b1;
assign mdoe			= 1'b1;		
assign niu_efu_4k_data		= 1'b0;
assign niu_efu_4k_xfer_en	= 1'b0;
assign niu_efu_cfifo0_data	= 1'b0;
assign niu_efu_cfifo0_xfer_en	= 1'b0;
assign niu_efu_cfifo1_data	= 1'b0;
assign niu_efu_cfifo1_xfer_en	= 1'b0;
assign niu_efu_fdo		= 1'b0;
assign niu_efu_ipp0_data	= 1'b0;
assign niu_efu_ipp0_xfer_en	= 1'b0;
assign niu_efu_ipp1_data	= 1'b0;
assign niu_efu_ipp1_xfer_en	= 1'b0;
assign niu_efu_mac0_ro_data	= 1'b0;
assign niu_efu_mac0_ro_xfer_en	= 1'b0;
assign niu_efu_mac0_sf_data	= 1'b0;
assign niu_efu_mac0_sf_xfer_en	= 1'b0;
assign niu_efu_mac1_ro_data	= 1'b0;
assign niu_efu_mac1_ro_xfer_en	= 1'b0;
assign niu_efu_mac1_sf_data	= 1'b0;
assign niu_efu_mac1_sf_xfer_en	= 1'b0;
assign niu_efu_ram0_data	= 1'b0;
assign niu_efu_ram0_xfer_en	= 1'b0;
assign niu_efu_ram1_data	= 1'b0;
assign niu_efu_ram1_xfer_en	= 1'b0;
assign niu_efu_ram_data		= 1'b0;
assign niu_efu_ram_xfer_en	= 1'b0;
assign niu_mio_debug_clock	= 2'b00;	
assign niu_mio_debug_data	= 32'h00000000;
assign niu_dbg1_stall_ack	= 1'b0;		
assign niu_ncu_ctag_ce		= 1'b0;
assign niu_ncu_ctag_ue		= 1'b0;
assign niu_ncu_d_pe		= 1'b0;		

//assign niu_ncu_data		= [31:0]	
//assign niu_ncu_stall		=		
//assign niu_ncu_vld		=		

assign niu_txc_interrupts	= 1'b0;		
assign rdp_rdmc_mbist_scan_out	= 1'b0;
assign rdp_rdmc_tcu_mbist_done	= 1'b0;
assign rdp_rdmc_tcu_mbist_fail	= 1'b0;		
assign rdp_scan_out		= 1'b0;		
assign rdp_tcu_dmo_dout		= 1'b0;
assign rtx_mbist_scan_out	= 1'b0;		
assign rtx_rxc_ipp0_tcu_mbist_done	= 1'b0;
assign rtx_rxc_ipp0_tcu_mbist_fail	= 1'b0;
assign rtx_rxc_ipp1_tcu_mbist_done	= 1'b0;
assign rtx_rxc_ipp1_tcu_mbist_fail	= 1'b0;
assign rtx_rxc_mb5_tcu_mbist_done	= 1'b0;
assign rtx_rxc_mb5_tcu_mbist_fail	= 1'b0;
assign rtx_rxc_mb6_tcu_mbist_done	= 1'b0;
assign rtx_rxc_mb6_tcu_mbist_fail	= 1'b0;
assign rtx_rxc_zcp0_tcu_mbist_done	= 1'b0;
assign rtx_rxc_zcp0_tcu_mbist_fail	= 1'b0;
assign rtx_rxc_zcp1_tcu_mbist_done	= 1'b0;
assign rtx_rxc_zcp1_tcu_mbist_fail	= 1'b0;
assign rtx_txc_txe0_tcu_mbist_done	= 1'b0;
assign rtx_txc_txe0_tcu_mbist_fail	= 1'b0;
assign rtx_txc_txe1_tcu_mbist_done	= 1'b0;
assign rtx_txc_txe1_tcu_mbist_fail	= 1'b0;
assign rtx_scan_out		= 1'b0;
assign rtx_tcu_dmo_data_out	= 40'h0000000000;
assign tdmc_pio_intr		= 64'h0000000000000000;
assign tds_mbist_scan_out	= 1'b0;
assign tds_scan_out		= 1'b0;
assign tds_smx_tcu_mbist_done	= 1'b0;
assign tds_smx_tcu_mbist_fail	= 1'b0;
assign tds_tcu_dmo_dout		= 40'h0000000000;
assign tds_tdmc_tcu_mbist_done	= 1'b0;
assign tds_tdmc_tcu_mbist_fail	= 1'b0;
assign xaui_act_led_0		= 1'b0;		
assign xaui_act_led_1		= 1'b0;	
assign xaui_link_led_0		= 1'b0;
assign xaui_link_led_1		= 1'b0;

endmodule


