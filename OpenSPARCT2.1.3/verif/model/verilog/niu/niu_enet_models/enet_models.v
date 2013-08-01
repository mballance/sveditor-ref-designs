// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: enet_models.v
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
module enet_models (
    ref_clk,           // input  (xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    reset,             // input  (pcs_0_ENV,pcs_1_ENV,xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    RGMII_TXCLK0,      // input  () <= ()
    RGMII_TXCLK1,      // input  () <= ()
    RGMII_TXCLK2,      // input  () <= ()
    RGMII_TXCLK3,      // input  () <= ()
    RXN0_p0,           // input  (serdes_P0) <= ()
    RXN1_p0,           // input  (serdes_P0) <= ()
    RXN2_p0,           // input  (serdes_P0) <= ()
    RXN3_p0,           // input  (serdes_P0) <= ()
    RXP0_p0,           // input  (serdes_P0) <= ()
    RXP1_p0,           // input  (serdes_P0) <= ()
    RXP2_p0,           // input  (serdes_P0) <= ()
    RXP3_p0,           // input  (serdes_P0) <= ()
    RXN0_p1,           // input  (serdes_P1) <= ()
    RXN1_p1,           // input  (serdes_P1) <= ()
    RXN2_p1,           // input  (serdes_P1) <= ()
    RXN3_p1,           // input  (serdes_P1) <= ()
    RXP0_p1,           // input  (serdes_P1) <= ()
    RXP1_p1,           // input  (serdes_P1) <= ()
    RXP2_p1,           // input  (serdes_P1) <= ()
    RXP3_p1,           // input  (serdes_P1) <= ()
    m0_rx_clk,         // output (port0_clk) => (xgmii_if_P0)
    m0_tx_clk,         // output () => (BW_CALC_P0)
    m0_tx_data,        // output () => (BW_CALC_P0)
    m0_tx_en,          // output () => (BW_CALC_P0)
    m0_tx_err,         // output () => ()
    m1_rx_clk,         // output (port1_clk) => (xgmii_if_P1)
    m1_tx_clk,         // output () => (BW_CALC_P1)
    m1_tx_data,        // output () => (BW_CALC_P1)
    m1_tx_en,          // output () => (BW_CALC_P1)
    m1_tx_err,         // output () => ()
    m2_rx_clk,         // output (port2_clk) => ()
    m2_tx_clk,         // output () => ()
    m2_tx_data,        // output () => ()
    m2_tx_en,          // output () => ()
    m2_tx_err,         // output () => ()
    m3_rx_clk,         // output (port3_clk) => ()
    m3_tx_clk,         // output () => ()
    m3_tx_data,        // output () => ()
    m3_tx_en,          // output () => ()
    m3_tx_err,         // output () => ()
    BSINITCLK,         // input  (serdes_P0,serdes_P1) <= ()
    REFCLKN,           // input  (serdes_P0,serdes_P1) <= ()
    REFCLKP,           // input  (serdes_P0,serdes_P1) <= ()
    core_clk,          // input  (pcs_0_ENV,pcs_1_ENV) <= ()
    m0_rx_config,      // input  (port0_clk) <= ()
    m0_rx_data,        // input  (pcs_0_ENV,xgmii_if_P0) <= ()
    m0_rx_dv,          // input  (pcs_0_ENV,xgmii_if_P0) <= ()
    m0_rx_err,         // input  (pcs_0_ENV) <= ()
    m0_tx_config,      // input  (port0_clk) <= ()
    m1_rx_config,      // input  (port1_clk) <= ()
    m1_rx_data,        // input  (pcs_1_ENV,xgmii_if_P1) <= ()
    m1_rx_dv,          // input  (pcs_1_ENV,xgmii_if_P1) <= ()
    m1_rx_err,         // input  (pcs_1_ENV) <= ()
    m1_tx_config,      // input  (port1_clk) <= ()
    m2_rx_config,      // input  (port2_clk) <= ()
    m2_tx_config,      // input  (port2_clk) <= ()
    m3_rx_config,      // input  (port3_clk) <= ()
    m3_tx_config,      // input  (port3_clk) <= ()
    AMUX_p0,           // output (serdes_P0) => ()
    AMUX_p1,           // output (serdes_P1) => ()
    STCIQ_p0,          // output (serdes_P0) => ()
    STCIQ_p1,          // output (serdes_P1) => ()
    TXN0_p0,           // output (serdes_P0) => ()
    TXN0_p1,           // output (serdes_P1) => ()
    TXN1_p0,           // output (serdes_P0) => ()
    TXN1_p1,           // output (serdes_P1) => ()
    TXN2_p0,           // output (serdes_P0) => ()
    TXN2_p1,           // output (serdes_P1) => ()
    TXN3_p0,           // output (serdes_P0) => ()
    TXN3_p1,           // output (serdes_P1) => ()
    TXP0_p0,           // output (serdes_P0) => ()
    TXP0_p1,           // output (serdes_P1) => ()
    TXP1_p0,           // output (serdes_P0) => ()
    TXP1_p1,           // output (serdes_P1) => ()
    TXP2_p0,           // output (serdes_P0) => ()
    TXP2_p1,           // output (serdes_P1) => ()
    TXP3_p0,           // output (serdes_P0) => ()
    TXP3_p1,           // output (serdes_P1) => ()
    m0_rx_col,         // output (pcs_0_ENV) => ()
    m0_rx_crs,         // output (pcs_0_ENV) => ()
    m0_tx_clk_port,    // output (port0_clk) => ()
    m1_rx_col,         // output (pcs_1_ENV) => ()
    m1_rx_crs,         // output (pcs_1_ENV) => ()
    m1_tx_clk_port,    // output (port1_clk) => ()
    m2_tx_clk_port,    // output (port2_clk) => ()
    m3_tx_clk_port,    // output (port3_clk) => ()
    rx_clk_xgmii       // output (xgmii_if_P0,xgmii_if_P1) => ()
    );

input		BSINITCLK;
input		REFCLKN;
input		REFCLKP;
input		core_clk;
input	[3:0]	m0_rx_config;
input	[7:0]	m0_rx_data;
input		m0_rx_dv;
input		m0_rx_err;
input	[3:0]	m0_tx_config;
input	[3:0]	m1_rx_config;
input	[7:0]	m1_rx_data;
input		m1_rx_dv;
input		m1_rx_err;
input	[3:0]	m1_tx_config;
input	[3:0]	m2_rx_config;
input	[3:0]	m2_tx_config;
input	[3:0]	m3_rx_config;
input	[3:0]	m3_tx_config;
output		AMUX_p0;
output		AMUX_p1;
output		STCIQ_p0;
output		STCIQ_p1;
output		TXN0_p0;
output		TXN0_p1;
output		TXN1_p0;
output		TXN1_p1;
output		TXN2_p0;
output		TXN2_p1;
output		TXN3_p0;
output		TXN3_p1;
output		TXP0_p0;
output		TXP0_p1;
output		TXP1_p0;
output		TXP1_p1;
output		TXP2_p0;
output		TXP2_p1;
output		TXP3_p0;
output		TXP3_p1;
output		m0_rx_col;
output		m0_rx_crs;
output		m0_tx_clk_port;
output		m1_rx_col;
output		m1_rx_crs;
output		m1_tx_clk_port;
output		m2_tx_clk_port;
output		m3_tx_clk_port;
output		rx_clk_xgmii;

wire	[31:0]	xgmii_rxd0;
wire	[31:0]	xgmii_rxd1;
wire	[3:0]	xgmii_rxc0;
wire	[3:0]	xgmii_rxc1;
supply0		VLO;
supply0		GND;
supply1		VDD;
supply0		LV_TM;
input		ref_clk;
input		reset;
input		RGMII_TXCLK0;
input		RGMII_TXCLK1;
input		RGMII_TXCLK2;
input		RGMII_TXCLK3;
input		RXN0_p0;
input		RXN1_p0;
input		RXN2_p0;
input		RXN3_p0;
input		RXP0_p0;
input		RXP1_p0;
input		RXP2_p0;
input		RXP3_p0;
input		RXN0_p1;
input		RXN1_p1;
input		RXN2_p1;
input		RXN3_p1;
input		RXP0_p1;
input		RXP1_p1;
input		RXP2_p1;
input		RXP3_p1;
output		m0_rx_clk;
output		m0_tx_clk;
output	[7:0]	m0_tx_data;
output		m0_tx_en;
output		m0_tx_err;
output		m1_rx_clk;
output		m1_tx_clk;
output	[7:0]	m1_tx_data;
output		m1_tx_en;
output		m1_tx_err;
output		m2_rx_clk;
output		m2_tx_clk;
output	[7:0]	m2_tx_data;
output		m2_tx_en;
output		m2_tx_err;
output		m3_rx_clk;
output		m3_tx_clk;
output	[7:0]	m3_tx_data;
output		m3_tx_en;
output		m3_tx_err;
wire		ENV_RO_MONI;
wire		w_BT_EN;
wire		w_RO_EN;
wire		w_TEST_EN;
wire		w_BS_MODE;
wire		w_FORCE_DRV_DIS;
wire		w_TX_BS_SEL;
wire		DRV_BSOUT_A;
wire		DRV_BSOUT_B;
wire		DRV_BSOUT_C;
wire		DRV_BSOUT_D;
wire		ENV_PLL_LOCK;
wire		ENV_RES_EXT;
wire		RX_BSOUT_A;
wire		RX_BSOUT_B;
wire		RX_BSOUT_C;
wire		RX_BSOUT_D;
wire		TX_BSOUT_A;
wire		TX_BSOUT_B;
wire		TX_BSOUT_C;
wire		TX_BSOUT_D;
wire	[3:0]	RDreg;
wire		odd_rx_pcs0_ENV;
wire		odd_rx_pcs1_ENV;
wire		odd_rx_pcs2_ENV;
wire		odd_rx_pcs3_ENV;
wire		pio_core_sel_pcs_ENV;
wire		pio_rd_wr__pcs_ENV;
wire	[6:0]	pio_addr_pcs_ENV;
wire	[17:0]	pio_wr_data_pcs_ENV;
wire	[1:0]	slink_state_pcs_ENV;
wire		signal_detect_pcs_ENV;
wire		serdes_rdy_pcs_ENV;
wire		pio_err_pcs_0_ENV;
wire		pio_err_pcs_1_ENV;
wire		an_loss_sync_pcs_ENV;
wire		ewrap_pcs_ENV;
wire		pcs_int_pcs_ENV;
wire		phy_mode_pcs_ENV;
wire		pio_core_ack_pcs_ENV;
wire	[31:0]	pio_rd_data_pcs_ENV;
wire	[31:0]	xgmii_txd0_in;
wire	[3:0]	xgmii_txc0_in;
wire	[31:0]	xgmii_txd1_in;
wire	[3:0]	xgmii_txc1_in;
wire		eser_env_bit_byte_sync_a;
wire		eser_env_bit_byte_sync_b;
wire		eser_env_bit_byte_sync_c;
wire		eser_env_bit_byte_sync_d;
wire		link_up_tx_pcs_0_ENV;
wire		link_up_tx_pcs_1_ENV;
wire		rx_clkn;
wire	[2:0]	shared_sel_pcs_ENV;
wire		sw_ensyncdet_pcs_ENV;
wire		sw_lockref_pcs_ENV;
wire		tx_clk_xgmii0;
wire		tx_clk_xgmii1;
wire		tx_clkn;
wire		rx_clk_pcs0_ENV;
wire		rx_clk_pcs1_ENV;
wire	[9:0]	xgmii_env_eser_rxd_a_del;
wire	[9:0]	xgmii_env_eser_rxd_b_del;
wire	[9:0]	xgmii_env_eser_rxd_c_del;
wire	[9:0]	xgmii_env_eser_rxd_d_del;
wire	[9:0]	env_eser_rxd_a_del;
wire	[9:0]	env_eser_rxd_b_del;
wire	[9:0]	env_eser_rxd_c_del;
wire	[9:0]	env_eser_rxd_d_del;
wire	[9:0]	env_eser_rxd_a_del1;
wire	[9:0]	env_eser_rxd_b_del1;
wire	[9:0]	env_eser_rxd_c_del1;
wire	[9:0]	env_eser_rxd_d_del1;
wire	[9:0]	env_eser_rxd_a;
wire	[9:0]	env_eser_rxd_b;
wire	[9:0]	env_eser_rxd_c;
wire	[9:0]	env_eser_rxd_d;
wire		env_eser_pll_en;
wire		env_eser_bias_en;
wire	[1:0]	env_eser_ser_sel;
wire		env_eser_refclk_sel;
wire		env_eser_trd_sel;
wire		env_eser_tclk_sel;
wire		env_eser_low_latency;
wire		env_eser_sync_dual_pol;
wire	[5:0]	env_eser_tubi;
wire		env_eser_tx_en_a;
wire		env_eser_tx_en_b;
wire		env_eser_tx_en_c;
wire		env_eser_tx_en_d;
wire		env_eser_tx_clk_en_a;
wire		env_eser_tx_clk_en_b;
wire		env_eser_tx_clk_en_c;
wire		env_eser_tx_clk_en_d;
wire		env_eser_drv_en_a;
wire		env_eser_drv_en_b;
wire		env_eser_drv_en_c;
wire		env_eser_drv_en_d;
wire	[1:0]	env_eser_lev_sel_a;
wire	[1:0]	env_eser_lev_sel_b;
wire	[1:0]	env_eser_lev_sel_c;
wire	[1:0]	env_eser_lev_sel_d;
wire	[1:0]	env_eser_drv_emp_lvl_a;
wire	[1:0]	env_eser_drv_emp_lvl_b;
wire	[1:0]	env_eser_drv_emp_lvl_c;
wire	[1:0]	env_eser_drv_emp_lvl_d;
wire		env_eser_tx_lpb_en_a;
wire		env_eser_tx_lpb_en_b;
wire		env_eser_tx_lpb_en_c;
wire		env_eser_tx_lpb_en_d;
wire		env_eser_rx_lpb_en_a;
wire		env_eser_rx_lpb_en_b;
wire		env_eser_rx_lpb_en_c;
wire		env_eser_rx_lpb_en_d;
wire		env_eser_rx_en_a;
wire		env_eser_rx_en_b;
wire		env_eser_rx_en_c;
wire		env_eser_rx_en_d;
wire		env_eser_rx_clk_en_a;
wire		env_eser_rx_clk_en_b;
wire		env_eser_rx_clk_en_c;
wire		env_eser_rx_clk_en_d;
wire		env_eser_rx_sleep_en_a;
wire		env_eser_rx_sleep_en_b;
wire		env_eser_rx_sleep_en_c;
wire		env_eser_rx_sleep_en_d;
wire		env_eser_rbc_sel_a;
wire		env_eser_rbc_sel_b;
wire		env_eser_rbc_sel_c;
wire		env_eser_rbc_sel_d;
wire		env_eser_byte_sync_en_a;
wire		env_eser_byte_sync_en_b;
wire		env_eser_byte_sync_en_c;
wire		env_eser_byte_sync_en_d;
wire		env_eser_sync_sel_a;
wire		env_eser_sync_sel_b;
wire		env_eser_sync_sel_c;
wire		env_eser_sync_sel_d;
wire		env_eser_rx_reset_a;
wire		env_eser_rx_reset_b;
wire		env_eser_rx_reset_c;
wire		env_eser_rx_reset_d;
wire	[9:0]	eser_env_txd_a;
wire	[9:0]	eser_env_txd_b;
wire	[9:0]	eser_env_txd_c;
wire	[9:0]	eser_env_txd_d;
wire		eser_env_rbc0_a;
wire		eser_env_rbc0_b;
wire		eser_env_rbc0_c;
wire		eser_env_rbc0_d;
wire		eser_env_rbc1_a;
wire		eser_env_rbc1_b;
wire		eser_env_rbc1_c;
wire		eser_env_rbc1_d;
wire		eser_env_tclk0;
wire		eser_env_tclk1;
wire		eser_env_common_ready;
wire		eser_env_cchk_dmy;
wire	[2:0]	eser_env_tubo;
wire	[3:0]	eser_env_tbo;
wire		eser_env_fraq_a;
wire		eser_env_fraq_b;
wire		eser_env_fraq_c;
wire		eser_env_fraq_d;
wire		eser_env_sigdet_a;
wire		eser_env_sigdet_b;
wire		eser_env_sigdet_c;
wire		eser_env_sigdet_d;
wire		eser_env_rx_ready_a;
wire		eser_env_rx_ready_b;
wire		eser_env_rx_ready_c;
wire		eser_env_rx_ready_d;
wire	[9:0]	w_SYNC_CHAR;
wire	[4:0]	w_SYNC_MASK;
wire		m0_gmii_tx_en0;
wire		m0_xgmii_tx_en;
wire	[7:0]	m0_xgmii_txdata;
wire		m1_xgmii_tx_en;
wire	[7:0]	m1_xgmii_txdata;
wire	[7:0]	m0_gmii_txd0;
wire		rxclk_mux0;
wire		rxclk_mux1;
wire		txclk_mux0;
wire		txclk_mux1;
wire	[7:0]	pcs0_tx_data;
wire	[7:0]	pcs1_tx_data;
wire	[7:0]	pcs2_tx_data;
wire	[7:0]	pcs3_tx_data;
wire		pcs0_tx_en;
wire		pcs1_tx_en;
wire		pcs2_tx_en;
wire		pcs3_tx_en;
wire		pcs0_tx_err;
wire		pcs1_tx_err;
wire		pcs2_tx_err;
wire		pcs3_tx_err;
wire	[7:0]	rgmii0_tx_data;
wire	[7:0]	rgmii1_tx_data;
wire	[7:0]	rgmii2_tx_data;
wire	[7:0]	rgmii3_tx_data;
wire		rgmii0_tx_en;
wire		rgmii1_tx_en;
wire		rgmii2_tx_en;
wire		rgmii3_tx_en;
wire		rgmii0_tx_err;
wire		rgmii1_tx_err;
wire		rgmii2_tx_err;
wire		rgmii3_tx_err;
wire	[9:0]	temp_enc_ch0_p0;
wire	[9:0]	temp_enc_ch1_p0;
wire	[9:0]	temp_enc_ch2_p0;
wire	[9:0]	temp_enc_ch3_p0;
wire	[9:0]	temp_enc_ch0_p1;
wire	[9:0]	temp_enc_ch1_p1;
wire	[9:0]	temp_enc_ch2_p1;
wire	[9:0]	temp_enc_ch3_p1;
wire	[9:0]	TD0_p0;
wire	[9:0]	TD1_p0;
wire	[9:0]	TD2_p0;
wire	[9:0]	TD3_p0;
wire	[9:0]	TD0_r_p0;
wire	[9:0]	TD1_r_p0;
wire	[9:0]	TD2_r_p0;
wire	[9:0]	TD3_r_p0;
wire	[9:0]	TD1_r_p0_mux;
wire	[9:0]	TD0_r_p0_mux;
wire	[9:0]	TD0_r_p1_mux;
wire	[9:0]	RD0_p0;
wire	[9:0]	RD1_p0;
wire	[9:0]	RD2_p0;
wire	[9:0]	RD3_p0;
wire	[9:0]	RD0_r_p0;
wire	[9:0]	RD1_r_p0;
wire	[9:0]	RD2_r_p0;
wire	[9:0]	RD3_r_p0;
wire	[3:0]	STSPLL_p0;
wire	[7:0]	STSRX0_p0;
wire	[7:0]	STSRX1_p0;
wire	[7:0]	STSRX2_p0;
wire	[7:0]	STSRX3_p0;
wire	[3:0]	STSTX0_p0;
wire	[3:0]	STSTX1_p0;
wire	[3:0]	STSTX2_p0;
wire	[3:0]	STSTX3_p0;
wire	[3:0]	TXBCLK_p0;
wire	[1:0]	RDLL0_p0;
wire	[1:0]	RDLL1_p0;
wire	[1:0]	RDLL2_p0;
wire	[1:0]	RDLL3_p0;
wire	[3:0]	RXBCLKLLN_p0;
wire	[3:0]	RXBCLKLLP_p0;
wire	[3:0]	RXBCLK_p0;
wire	[3:0]	RXBCLKIN_p0;
wire		AMX_p0;
wire		FDO_p0;
wire		BSINITCLK_p0;
wire	[11:0]	CFGPLL_p0;
wire	[27:0]	CFGRX0_p0;
wire	[27:0]	CFGRX1_p0;
wire	[27:0]	CFGRX2_p0;
wire	[27:0]	CFGRX3_p0;
wire	[19:0]	CFGTX0_p0;
wire	[19:0]	CFGTX1_p0;
wire	[19:0]	CFGTX2_p0;
wire	[19:0]	CFGTX3_p0;
wire	[19:0]	TESTCFG_p0;
wire		FCLK_p0;
wire		FCLRZ_p0;
wire		FDI_p0;
wire	[1:0]	STCICFG_p0;
wire		STCICLK_p0;
wire		STCID_p0;
wire		TESTCLKR_p0;
wire		TESTCLKT_p0;
wire	[3:0]	TXBCLKIN_p0;
wire	[9:0]	TD0_p1;
wire	[9:0]	TD1_p1;
wire	[9:0]	TD2_p1;
wire	[9:0]	TD3_p1;
wire	[9:0]	TD0_r_p1;
wire	[9:0]	TD1_r_p1;
wire	[9:0]	TD2_r_p1;
wire	[9:0]	TD3_r_p1;
wire	[9:0]	TD1_r_p1_mux;
wire	[9:0]	RD0_p1;
wire	[9:0]	RD1_p1;
wire	[9:0]	RD2_p1;
wire	[9:0]	RD3_p1;
wire	[9:0]	RD0_r_p1;
wire	[9:0]	RD1_r_p1;
wire	[9:0]	RD2_r_p1;
wire	[9:0]	RD3_r_p1;
wire	[3:0]	STSPLL_p1;
wire	[7:0]	STSRX0_p1;
wire	[7:0]	STSRX1_p1;
wire	[7:0]	STSRX2_p1;
wire	[7:0]	STSRX3_p1;
wire	[3:0]	STSTX0_p1;
wire	[3:0]	STSTX1_p1;
wire	[3:0]	STSTX2_p1;
wire	[3:0]	STSTX3_p1;
wire	[3:0]	TXBCLK_p1;
wire	[1:0]	RDLL0_p1;
wire	[1:0]	RDLL1_p1;
wire	[1:0]	RDLL2_p1;
wire	[1:0]	RDLL3_p1;
wire	[3:0]	RXBCLKLLN_p1;
wire	[3:0]	RXBCLKLLP_p1;
wire	[3:0]	RXBCLK_p1;
wire	[3:0]	RXBCLKIN_p1;
wire		AMX_p1;
wire		FDO_p1;
wire		BSINITCLK_p1;
wire	[11:0]	CFGPLL_p1;
wire	[27:0]	CFGRX0_p1;
wire	[27:0]	CFGRX1_p1;
wire	[27:0]	CFGRX2_p1;
wire	[27:0]	CFGRX3_p1;
wire	[19:0]	CFGTX0_p1;
wire	[19:0]	CFGTX1_p1;
wire	[19:0]	CFGTX2_p1;
wire	[19:0]	CFGTX3_p1;
wire	[19:0]	TESTCFG_p1;
wire		FCLK_p1;
wire		FCLRZ_p1;
wire		FDI_p1;
wire	[1:0]	STCICFG_p1;
wire		STCICLK_p1;
wire		STCID_p1;
wire		TESTCLKR_p1;
wire		TESTCLKT_p1;
wire	[3:0]	TXBCLKIN_p1;
wire	[15:0]	no_of_txpkts_r;
wire	[15:0]	tx_pkt_len_r;
wire		enb_bwcal_r;
wire		speed_10G_w;

serdes_wrapper serdes_P0 (
    .BSINITCLK (BSINITCLK),        // input  (serdes_P0,serdes_P1) <= ()
    .CFGPLL    (CFGPLL_p0[11:0]),  // input  (serdes_P0) <= ()
    .CFGRX0    (CFGRX0_p0[27:0]),  // input  (serdes_P0) <= ()
    .CFGRX1    (CFGRX1_p0[27:0]),  // input  (serdes_P0) <= ()
    .CFGRX2    (CFGRX2_p0[27:0]),  // input  (serdes_P0) <= ()
    .CFGRX3    (CFGRX3_p0[27:0]),  // input  (serdes_P0) <= ()
    .CFGTX0    (CFGTX0_p0[19:0]),  // input  (serdes_P0) <= ()
    .CFGTX1    (CFGTX1_p0[19:0]),  // input  (serdes_P0) <= ()
    .CFGTX2    (CFGTX2_p0[19:0]),  // input  (serdes_P0) <= ()
    .CFGTX3    (CFGTX3_p0[19:0]),  // input  (serdes_P0) <= ()
    .FCLK      (FCLK_p0),          // input  (serdes_P0) <= ()
    .FCLRZ     (FCLRZ_p0),         // input  (serdes_P0) <= ()
    .FDI       (FDI_p0),           // input  (serdes_P0) <= ()
    .REFCLKN   (REFCLKN),          // input  (serdes_P0,serdes_P1) <= ()
    .REFCLKP   (REFCLKP),          // input  (serdes_P0,serdes_P1) <= ()
    .RXBCLKIN  (RXBCLKIN_p0[3:0]), // input  (serdes_P0) <= ()
    .RXN0      (RXN0_p0),          // input  (serdes_P0) <= ()
    .RXN1      (RXN1_p0),          // input  (serdes_P0) <= ()
    .RXN2      (RXN2_p0),          // input  (serdes_P0) <= ()
    .RXN3      (RXN3_p0),          // input  (serdes_P0) <= ()
    .RXP0      (RXP0_p0),          // input  (serdes_P0) <= ()
    .RXP1      (RXP1_p0),          // input  (serdes_P0) <= ()
    .RXP2      (RXP2_p0),          // input  (serdes_P0) <= ()
    .RXP3      (RXP3_p0),          // input  (serdes_P0) <= ()
    .STCICFG   (STCICFG_p0[1:0]),  // input  (serdes_P0) <= ()
    .STCICLK   (STCICLK_p0),       // input  (serdes_P0) <= ()
    .STCID     (STCID_p0),         // input  (serdes_P0) <= ()
    .TD0       (TD0_r_p0[9:0]),    // input  (serdes_P0) <= ()
    .TD1       (TD1_r_p0[9:0]),    // input  (serdes_P0) <= ()
    .TD2       (TD2_r_p0[9:0]),    // input  (serdes_P0) <= ()
    .TD3       (TD3_r_p0[9:0]),    // input  (serdes_P0) <= ()
    .TESTCFG   (TESTCFG_p0[19:0]), // input  (serdes_P0) <= ()
    .TESTCLKR  (TESTCLKR_p0),      // input  (serdes_P0) <= ()
    .TESTCLKT  (TESTCLKT_p0),      // input  (serdes_P0) <= ()
    .TXBCLKIN  (TXBCLKIN_p0[3:0]), // input  (serdes_P0) <= ()
    .AMUX      (AMUX_p0),          // output (serdes_P0) => ()
    .FDO       (FDO_p0),           // output (serdes_P0) => ()
    .RD0       (RD0_p0[9:0]),      // output (serdes_P0) => ()
    .RD1       (RD1_p0[9:0]),      // output (serdes_P0) => ()
    .RD2       (RD2_p0[9:0]),      // output (serdes_P0) => ()
    .RD3       (RD3_p0[9:0]),      // output (serdes_P0) => ()
    .RDLL0     (RDLL0_p0),         // output (serdes_P0) => ()
    .RDLL1     (RDLL1_p0),         // output (serdes_P0) => ()
    .RDLL2     (RDLL2_p0),         // output (serdes_P0) => ()
    .RDLL3     (RDLL3_p0),         // output (serdes_P0) => ()
    .RXBCLK    (RXBCLK_p0),        // output (serdes_P0) => ()
    .RXBCLKLLN (RXBCLKLLN_p0),     // output (serdes_P0) => ()
    .RXBCLKLLP (RXBCLKLLP_p0),     // output (serdes_P0) => ()
    .STCIQ     (STCIQ_p0),         // output (serdes_P0) => ()
    .STSPLL    (STSPLL_p0),        // output (serdes_P0) => ()
    .STSRX0    (STSRX0_p0),        // output (serdes_P0) => (pcs_0_ENV)
    .STSRX1    (STSRX1_p0),        // output (serdes_P0) => ()
    .STSRX2    (STSRX2_p0),        // output (serdes_P0) => ()
    .STSRX3    (STSRX3_p0),        // output (serdes_P0) => ()
    .STSTX0    (STSTX0_p0),        // output (serdes_P0) => ()
    .STSTX1    (STSTX1_p0),        // output (serdes_P0) => ()
    .STSTX2    (STSTX2_p0),        // output (serdes_P0) => ()
    .STSTX3    (STSTX3_p0),        // output (serdes_P0) => ()
    .TXBCLK    (TXBCLK_p0),        // output (serdes_P0) => ()
    .TXN0      (TXN0_p0),          // output (serdes_P0) => ()
    .TXN1      (TXN1_p0),          // output (serdes_P0) => ()
    .TXN2      (TXN2_p0),          // output (serdes_P0) => ()
    .TXN3      (TXN3_p0),          // output (serdes_P0) => ()
    .TXP0      (TXP0_p0),          // output (serdes_P0) => ()
    .TXP1      (TXP1_p0),          // output (serdes_P0) => ()
    .TXP2      (TXP2_p0),          // output (serdes_P0) => ()
    .TXP3      (TXP3_p0)           // output (serdes_P0) => ()
    );

serdes_wrapper serdes_P1 (
    .BSINITCLK (BSINITCLK),        // input  (serdes_P0,serdes_P1) <= ()
    .CFGPLL    (CFGPLL_p1[11:0]),  // input  (serdes_P1) <= ()
    .CFGRX0    (CFGRX0_p1[27:0]),  // input  (serdes_P1) <= ()
    .CFGRX1    (CFGRX1_p1[27:0]),  // input  (serdes_P1) <= ()
    .CFGRX2    (CFGRX2_p1[27:0]),  // input  (serdes_P1) <= ()
    .CFGRX3    (CFGRX3_p1[27:0]),  // input  (serdes_P1) <= ()
    .CFGTX0    (CFGTX0_p1[19:0]),  // input  (serdes_P1) <= ()
    .CFGTX1    (CFGTX1_p1[19:0]),  // input  (serdes_P1) <= ()
    .CFGTX2    (CFGTX2_p1[19:0]),  // input  (serdes_P1) <= ()
    .CFGTX3    (CFGTX3_p1[19:0]),  // input  (serdes_P1) <= ()
    .FCLK      (FCLK_p1),          // input  (serdes_P1) <= ()
    .FCLRZ     (FCLRZ_p1),         // input  (serdes_P1) <= ()
    .FDI       (FDI_p1),           // input  (serdes_P1) <= ()
    .REFCLKN   (REFCLKN),          // input  (serdes_P0,serdes_P1) <= ()
    .REFCLKP   (REFCLKP),          // input  (serdes_P0,serdes_P1) <= ()
    .RXBCLKIN  (RXBCLKIN_p1[3:0]), // input  (serdes_P1) <= ()
    .RXN0      (RXN0_p1),          // input  (serdes_P1) <= ()
    .RXN1      (RXN1_p1),          // input  (serdes_P1) <= ()
    .RXN2      (RXN2_p1),          // input  (serdes_P1) <= ()
    .RXN3      (RXN3_p1),          // input  (serdes_P1) <= ()
    .RXP0      (RXP0_p1),          // input  (serdes_P1) <= ()
    .RXP1      (RXP1_p1),          // input  (serdes_P1) <= ()
    .RXP2      (RXP2_p1),          // input  (serdes_P1) <= ()
    .RXP3      (RXP3_p1),          // input  (serdes_P1) <= ()
    .STCICFG   (STCICFG_p1[1:0]),  // input  (serdes_P1) <= ()
    .STCICLK   (STCICLK_p1),       // input  (serdes_P1) <= ()
    .STCID     (STCID_p1),         // input  (serdes_P1) <= ()
    .TD0       (TD0_r_p1[9:0]),    // input  (serdes_P1) <= ()
    .TD1       (TD1_r_p1[9:0]),    // input  (serdes_P1) <= ()
    .TD2       (TD2_r_p1[9:0]),    // input  (serdes_P1) <= ()
    .TD3       (TD3_r_p1[9:0]),    // input  (serdes_P1) <= ()
    .TESTCFG   (TESTCFG_p1[19:0]), // input  (serdes_P1) <= ()
    .TESTCLKR  (TESTCLKR_p1),      // input  (serdes_P1) <= ()
    .TESTCLKT  (TESTCLKT_p1),      // input  (serdes_P1) <= ()
    .TXBCLKIN  (TXBCLKIN_p1[3:0]), // input  (serdes_P1) <= ()
    .AMUX      (AMUX_p1),          // output (serdes_P1) => ()
    .FDO       (FDO_p1),           // output (serdes_P1) => ()
    .RD0       (RD0_p1[9:0]),      // output (serdes_P1) => ()
    .RD1       (RD1_p1[9:0]),      // output (serdes_P1) => ()
    .RD2       (RD2_p1[9:0]),      // output (serdes_P1) => ()
    .RD3       (RD3_p1[9:0]),      // output (serdes_P1) => ()
    .RDLL0     (RDLL0_p1),         // output (serdes_P1) => ()
    .RDLL1     (RDLL1_p1),         // output (serdes_P1) => ()
    .RDLL2     (RDLL2_p1),         // output (serdes_P1) => ()
    .RDLL3     (RDLL3_p1),         // output (serdes_P1) => ()
    .RXBCLK    (RXBCLK_p1),        // output (serdes_P1) => ()
    .RXBCLKLLN (RXBCLKLLN_p1),     // output (serdes_P1) => ()
    .RXBCLKLLP (RXBCLKLLP_p1),     // output (serdes_P1) => ()
    .STCIQ     (STCIQ_p1),         // output (serdes_P1) => ()
    .STSPLL    (STSPLL_p1),        // output (serdes_P1) => ()
    .STSRX0    (STSRX0_p1),        // output (serdes_P1) => (pcs_1_ENV)
    .STSRX1    (STSRX1_p1),        // output (serdes_P1) => ()
    .STSRX2    (STSRX2_p1),        // output (serdes_P1) => ()
    .STSRX3    (STSRX3_p1),        // output (serdes_P1) => ()
    .STSTX0    (STSTX0_p1),        // output (serdes_P1) => ()
    .STSTX1    (STSTX1_p1),        // output (serdes_P1) => ()
    .STSTX2    (STSTX2_p1),        // output (serdes_P1) => ()
    .STSTX3    (STSTX3_p1),        // output (serdes_P1) => ()
    .TXBCLK    (TXBCLK_p1),        // output (serdes_P1) => ()
    .TXN0      (TXN0_p1),          // output (serdes_P1) => ()
    .TXN1      (TXN1_p1),          // output (serdes_P1) => ()
    .TXN2      (TXN2_p1),          // output (serdes_P1) => ()
    .TXN3      (TXN3_p1),          // output (serdes_P1) => ()
    .TXP0      (TXP0_p1),          // output (serdes_P1) => ()
    .TXP1      (TXP1_p1),          // output (serdes_P1) => ()
    .TXP2      (TXP2_p1),          // output (serdes_P1) => ()
    .TXP3      (TXP3_p1)           // output (serdes_P1) => ()
    );

pcs pcs_0_ENV (
    .rxclk          (rxclk_mux0),            // input  (pcs_0_ENV) <= ()
    .rx_10bdata     (RD0_r_p0),              // input  (pcs_0_ENV,xgmii_A_dec_P0) <= ()
    .rxd            (pcs0_tx_data[7:0]),     // output (pcs_0_ENV) => ()
    .rx_dv          (pcs0_tx_en),            // output (pcs_0_ENV) => ()
    .rx_er          (pcs0_tx_err),           // output (pcs_0_ENV) => ()
    .serdes_rdy     (serdes_rdy_pcs_ENV),    // input  (pcs_0_ENV,pcs_1_ENV) <= ()
    .link_up_tx     (link_up_tx_pcs_0_ENV),  // output (pcs_0_ENV) => ()
    .odd_rx         (STSRX0_p0[2]),          // input  (pcs_0_ENV) <= (serdes_P0)
    .signal_detect  (signal_detect_pcs_ENV), // input  (pcs_0_ENV,pcs_1_ENV) <= ()
    .an_loss_sync   (an_loss_sync_pcs_ENV),  // output (pcs_0_ENV,pcs_1_ENV) => ()
    .txclk          (txclk_mux0),            // input  (pcs_0_ENV) <= ()
    .tx_en          (m0_rx_dv),              // input  (pcs_0_ENV,xgmii_if_P0) <= ()
    .tx_er          (m0_rx_err),             // input  (pcs_0_ENV) <= ()
    .crs            (m0_rx_crs),             // output (pcs_0_ENV) => ()
    .col            (m0_rx_col),             // output (pcs_0_ENV) => ()
    .txd            (m0_rx_data[7:0]),       // input  (pcs_0_ENV,xgmii_if_P0) <= ()
    .tx_10bdata     (env_eser_rxd_a[9:0]),   // output (pcs_0_ENV) => ()
    .clk            (core_clk),              // input  (pcs_0_ENV,pcs_1_ENV) <= ()
    .pio_core_reset (reset),                 // input  (pcs_0_ENV,pcs_1_ENV,xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .pio_core_sel   (pio_core_sel_pcs_ENV),  // input  (pcs_0_ENV,pcs_1_ENV) <= ()
    .pio_rd_wr      (pio_rd_wr__pcs_ENV),    // input  (pcs_0_ENV,pcs_1_ENV) <= ()
    .pio_addr       (pio_addr_pcs_ENV),      // input  (pcs_0_ENV,pcs_1_ENV) <= ()
    .pio_wr_data    (pio_wr_data_pcs_ENV),   // input  (pcs_0_ENV,pcs_1_ENV) <= ()
    .slink_state    (slink_state_pcs_ENV),   // input  (pcs_0_ENV,pcs_1_ENV) <= ()
    .pio_err        (pio_err_pcs_0_ENV),     // output (pcs_0_ENV) => ()
    .pio_core_ack   (pio_core_ack_pcs_ENV),  // output (pcs_0_ENV,pcs_1_ENV) => ()
    .pio_rd_data    (pio_rd_data_pcs_ENV),   // output (pcs_0_ENV,pcs_1_ENV) => ()
    .sw_ensyncdet   (sw_ensyncdet_pcs_ENV),  // output (pcs_0_ENV,pcs_1_ENV) => ()
    .sw_lockref     (sw_lockref_pcs_ENV),    // output (pcs_0_ENV,pcs_1_ENV) => ()
    .phy_mode       (phy_mode_pcs_ENV),      // output (pcs_0_ENV,pcs_1_ENV) => ()
    .shared_sel     (shared_sel_pcs_ENV),    // output (pcs_0_ENV,pcs_1_ENV) => ()
    .pcs_int        (pcs_int_pcs_ENV),       // output (pcs_0_ENV,pcs_1_ENV) => ()
    .ewrap          (ewrap_pcs_ENV)          // output (pcs_0_ENV,pcs_1_ENV) => ()
    );

pcs pcs_1_ENV (
    .rxclk          (rxclk_mux1),            // input  (pcs_1_ENV) <= ()
    .rx_10bdata     (RD0_r_p1),              // input  (pcs_1_ENV,xgmii_A_dec_P1) <= ()
    .rxd            (pcs1_tx_data[7:0]),     // output (pcs_1_ENV) => ()
    .rx_dv          (pcs1_tx_en),            // output (pcs_1_ENV) => ()
    .rx_er          (pcs1_tx_err),           // output (pcs_1_ENV) => ()
    .serdes_rdy     (serdes_rdy_pcs_ENV),    // input  (pcs_0_ENV,pcs_1_ENV) <= ()
    .link_up_tx     (link_up_tx_pcs_1_ENV),  // output (pcs_1_ENV) => ()
    .odd_rx         (STSRX0_p1[2]),          // input  (pcs_1_ENV) <= (serdes_P1)
    .signal_detect  (signal_detect_pcs_ENV), // input  (pcs_0_ENV,pcs_1_ENV) <= ()
    .an_loss_sync   (an_loss_sync_pcs_ENV),  // output (pcs_0_ENV,pcs_1_ENV) => ()
    .txclk          (txclk_mux1),            // input  (pcs_1_ENV) <= ()
    .tx_en          (m1_rx_dv),              // input  (pcs_1_ENV,xgmii_if_P1) <= ()
    .tx_er          (m1_rx_err),             // input  (pcs_1_ENV) <= ()
    .crs            (m1_rx_crs),             // output (pcs_1_ENV) => ()
    .col            (m1_rx_col),             // output (pcs_1_ENV) => ()
    .txd            (m1_rx_data[7:0]),       // input  (pcs_1_ENV,xgmii_if_P1) <= ()
    .tx_10bdata     (env_eser_rxd_b[9:0]),   // output (pcs_1_ENV) => ()
    .clk            (core_clk),              // input  (pcs_0_ENV,pcs_1_ENV) <= ()
    .pio_core_reset (reset),                 // input  (pcs_0_ENV,pcs_1_ENV,xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .pio_core_sel   (pio_core_sel_pcs_ENV),  // input  (pcs_0_ENV,pcs_1_ENV) <= ()
    .pio_rd_wr      (pio_rd_wr__pcs_ENV),    // input  (pcs_0_ENV,pcs_1_ENV) <= ()
    .pio_addr       (pio_addr_pcs_ENV),      // input  (pcs_0_ENV,pcs_1_ENV) <= ()
    .pio_wr_data    (pio_wr_data_pcs_ENV),   // input  (pcs_0_ENV,pcs_1_ENV) <= ()
    .slink_state    (slink_state_pcs_ENV),   // input  (pcs_0_ENV,pcs_1_ENV) <= ()
    .pio_err        (pio_err_pcs_1_ENV),     // output (pcs_1_ENV) => ()
    .pio_core_ack   (pio_core_ack_pcs_ENV),  // output (pcs_0_ENV,pcs_1_ENV) => ()
    .pio_rd_data    (pio_rd_data_pcs_ENV),   // output (pcs_0_ENV,pcs_1_ENV) => ()
    .sw_ensyncdet   (sw_ensyncdet_pcs_ENV),  // output (pcs_0_ENV,pcs_1_ENV) => ()
    .sw_lockref     (sw_lockref_pcs_ENV),    // output (pcs_0_ENV,pcs_1_ENV) => ()
    .phy_mode       (phy_mode_pcs_ENV),      // output (pcs_0_ENV,pcs_1_ENV) => ()
    .shared_sel     (shared_sel_pcs_ENV),    // output (pcs_0_ENV,pcs_1_ENV) => ()
    .pcs_int        (pcs_int_pcs_ENV),       // output (pcs_0_ENV,pcs_1_ENV) => ()
    .ewrap          (ewrap_pcs_ENV)          // output (pcs_0_ENV,pcs_1_ENV) => ()
    );

phy_clock_doubler_env phy_clk_doubler_0_ENV (
    .rbc0  (eser_env_rbc0_a), // input  (phy_clk_doubler_0_ENV) <= ()
    .rbc1  (eser_env_rbc1_a), // input  (phy_clk_doubler_0_ENV) <= ()
    .rbcx2 (rx_clk_pcs0_ENV)  // output (phy_clk_doubler_0_ENV) => ()
    );

phy_clock_doubler_env phy_clk_doubler_1_ENV (
    .rbc0  (eser_env_rbc0_b), // input  (phy_clk_doubler_1_ENV) <= ()
    .rbc1  (eser_env_rbc1_b), // input  (phy_clk_doubler_1_ENV) <= ()
    .rbcx2 (rx_clk_pcs1_ENV)  // output (phy_clk_doubler_1_ENV) => ()
    );

xgmii_tx_encoder_top xgmii_tx_enc_top_P0 (
    .tx_clk           (ref_clk),               // input  (xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .tx_rst           (reset),                 // input  (pcs_0_ENV,pcs_1_ENV,xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .tx_enc_in        (xgmii_rxd0[31:0]),      // input  (xgmii_tx_enc_top_P0) <= (xgmii_if_P0)
    .tx_ctrl_in       (xgmii_rxc0[3:0]),       // input  (xgmii_tx_enc_top_P0) <= (xgmii_if_P0)
    .RDreg            (RDreg[0]),              // output (xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) => ()
    .tx_10b_enc_out_a (temp_enc_ch0_p0[9:0]),  // output (xgmii_tx_enc_top_P0) => ()
    .tx_10b_enc_out_b (temp_enc_ch1_p0[9:0]),  // output (xgmii_tx_enc_top_P0) => ()
    .tx_10b_enc_out_c (temp_enc_ch2_p0[9:0]),  // output (xgmii_tx_enc_top_P0) => ()
    .tx_10b_enc_out_d (temp_enc_ch3_p0[9:0])   // output (xgmii_tx_enc_top_P0) => ()
    );

xgmii_tx_encoder_top xgmii_tx_enc_top_P1 (
    .tx_clk           (ref_clk),               // input  (xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .tx_rst           (reset),                 // input  (pcs_0_ENV,pcs_1_ENV,xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .tx_enc_in        (xgmii_rxd1[31:0]),      // input  (xgmii_tx_enc_top_P1) <= (xgmii_if_P1)
    .tx_ctrl_in       (xgmii_rxc1[3:0]),       // input  (xgmii_tx_enc_top_P1) <= (xgmii_if_P1)
    .RDreg            (RDreg[0]),              // output (xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) => ()
    .tx_10b_enc_out_a (temp_enc_ch0_p1[9:0]),  // output (xgmii_tx_enc_top_P1) => ()
    .tx_10b_enc_out_b (temp_enc_ch1_p1[9:0]),  // output (xgmii_tx_enc_top_P1) => ()
    .tx_10b_enc_out_c (temp_enc_ch2_p1[9:0]),  // output (xgmii_tx_enc_top_P1) => ()
    .tx_10b_enc_out_d (temp_enc_ch3_p1[9:0])   // output (xgmii_tx_enc_top_P1) => ()
    );

xgmii_rx_decoder xgmii_A_dec_P0 (
    .rx_clk       (ref_clk),            // input  (xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .rst          (reset),              // input  (pcs_0_ENV,pcs_1_ENV,xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .rx_10bdec_in (RD0_r_p0[9:0]),      // input  (pcs_0_ENV,xgmii_A_dec_P0) <= ()
    .rx_8bdec_out (xgmii_txd0_in[7:0]), // output (xgmii_A_dec_P0,xgmii_B_dec_P0,xgmii_C_dec_P0,xgmii_D_dec_P0) => (xgmii_if_P0)
    .special      (xgmii_txc0_in[0])    // output (xgmii_A_dec_P0,xgmii_B_dec_P0,xgmii_C_dec_P0,xgmii_D_dec_P0) => (xgmii_if_P0)
    );

xgmii_rx_decoder xgmii_B_dec_P0 (
    .rx_clk       (ref_clk),             // input  (xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .rst          (reset),               // input  (pcs_0_ENV,pcs_1_ENV,xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .rx_10bdec_in (RD1_r_p0[9:0]),       // input  (xgmii_B_dec_P0) <= ()
    .rx_8bdec_out (xgmii_txd0_in[15:8]), // output (xgmii_A_dec_P0,xgmii_B_dec_P0,xgmii_C_dec_P0,xgmii_D_dec_P0) => (xgmii_if_P0)
    .special      (xgmii_txc0_in[1])     // output (xgmii_A_dec_P0,xgmii_B_dec_P0,xgmii_C_dec_P0,xgmii_D_dec_P0) => (xgmii_if_P0)
    );

xgmii_rx_decoder xgmii_C_dec_P0 (
    .rx_clk       (ref_clk),              // input  (xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .rst          (reset),                // input  (pcs_0_ENV,pcs_1_ENV,xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .rx_10bdec_in (RD2_r_p0[9:0]),        // input  (xgmii_C_dec_P0) <= ()
    .rx_8bdec_out (xgmii_txd0_in[23:16]), // output (xgmii_A_dec_P0,xgmii_B_dec_P0,xgmii_C_dec_P0,xgmii_D_dec_P0) => (xgmii_if_P0)
    .special      (xgmii_txc0_in[2])      // output (xgmii_A_dec_P0,xgmii_B_dec_P0,xgmii_C_dec_P0,xgmii_D_dec_P0) => (xgmii_if_P0)
    );

xgmii_rx_decoder xgmii_D_dec_P0 (
    .rx_clk       (ref_clk),              // input  (xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .rst          (reset),                // input  (pcs_0_ENV,pcs_1_ENV,xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .rx_10bdec_in (RD3_r_p0[9:0]),        // input  (xgmii_D_dec_P0) <= ()
    .rx_8bdec_out (xgmii_txd0_in[31:24]), // output (xgmii_A_dec_P0,xgmii_B_dec_P0,xgmii_C_dec_P0,xgmii_D_dec_P0) => (xgmii_if_P0)
    .special      (xgmii_txc0_in[3])      // output (xgmii_A_dec_P0,xgmii_B_dec_P0,xgmii_C_dec_P0,xgmii_D_dec_P0) => (xgmii_if_P0)
    );

xgmii_rx_decoder xgmii_A_dec_P1 (
    .rx_clk       (ref_clk),            // input  (xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .rst          (reset),              // input  (pcs_0_ENV,pcs_1_ENV,xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .rx_10bdec_in (RD0_r_p1[9:0]),      // input  (pcs_1_ENV,xgmii_A_dec_P1) <= ()
    .rx_8bdec_out (xgmii_txd1_in[7:0]), // output (xgmii_A_dec_P1,xgmii_B_dec_P1,xgmii_C_dec_P1,xgmii_D_dec_P1) => (xgmii_if_P1)
    .special      (xgmii_txc1_in[0])    // output (xgmii_A_dec_P1,xgmii_B_dec_P1,xgmii_C_dec_P1,xgmii_D_dec_P1) => (xgmii_if_P1)
    );

xgmii_rx_decoder xgmii_B_dec_P1 (
    .rx_clk       (ref_clk),             // input  (xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .rst          (reset),               // input  (pcs_0_ENV,pcs_1_ENV,xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .rx_10bdec_in (RD1_r_p1[9:0]),       // input  (xgmii_B_dec_P1) <= ()
    .rx_8bdec_out (xgmii_txd1_in[15:8]), // output (xgmii_A_dec_P1,xgmii_B_dec_P1,xgmii_C_dec_P1,xgmii_D_dec_P1) => (xgmii_if_P1)
    .special      (xgmii_txc1_in[1])     // output (xgmii_A_dec_P1,xgmii_B_dec_P1,xgmii_C_dec_P1,xgmii_D_dec_P1) => (xgmii_if_P1)
    );

xgmii_rx_decoder xgmii_C_dec_P1 (
    .rx_clk       (ref_clk),              // input  (xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .rst          (reset),                // input  (pcs_0_ENV,pcs_1_ENV,xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .rx_10bdec_in (RD2_r_p1[9:0]),        // input  (xgmii_C_dec_P1) <= ()
    .rx_8bdec_out (xgmii_txd1_in[23:16]), // output (xgmii_A_dec_P1,xgmii_B_dec_P1,xgmii_C_dec_P1,xgmii_D_dec_P1) => (xgmii_if_P1)
    .special      (xgmii_txc1_in[2])      // output (xgmii_A_dec_P1,xgmii_B_dec_P1,xgmii_C_dec_P1,xgmii_D_dec_P1) => (xgmii_if_P1)
    );

xgmii_rx_decoder xgmii_D_dec_P1 (
    .rx_clk       (ref_clk),              // input  (xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .rst          (reset),                // input  (pcs_0_ENV,pcs_1_ENV,xgmii_A_dec_P0,xgmii_A_dec_P1,xgmii_B_dec_P0,xgmii_B_dec_P1,xgmii_C_dec_P0,xgmii_C_dec_P1,xgmii_D_dec_P0,xgmii_D_dec_P1,xgmii_tx_enc_top_P0,xgmii_tx_enc_top_P1) <= ()
    .rx_10bdec_in (RD3_r_p1[9:0]),        // input  (xgmii_D_dec_P1) <= ()
    .rx_8bdec_out (xgmii_txd1_in[31:24]), // output (xgmii_A_dec_P1,xgmii_B_dec_P1,xgmii_C_dec_P1,xgmii_D_dec_P1) => (xgmii_if_P1)
    .special      (xgmii_txc1_in[3])      // output (xgmii_A_dec_P1,xgmii_B_dec_P1,xgmii_C_dec_P1,xgmii_D_dec_P1) => (xgmii_if_P1)
    );

xgmii_if xgmii_if_P0 (
    .rxd          (m0_rx_data),          // input  (pcs_0_ENV,xgmii_if_P0) <= ()
    .rxdv         (m0_rx_dv),            // input  (pcs_0_ENV,xgmii_if_P0) <= ()
    .rx_clk       (m0_rx_clk),           // input  (xgmii_if_P0) <= (port0_clk)
    .txd_xgmii    (xgmii_txd0_in[31:0]), // input  (xgmii_if_P0) <= (xgmii_A_dec_P0,xgmii_B_dec_P0,xgmii_C_dec_P0,xgmii_D_dec_P0)
    .txctrl_xgmii (xgmii_txc0_in[3:0]),  // input  (xgmii_if_P0) <= (xgmii_A_dec_P0,xgmii_B_dec_P0,xgmii_C_dec_P0,xgmii_D_dec_P0)
    .tx_clk       (m0_rx_clk),           // input  (xgmii_if_P0) <= (port0_clk)
    .rx_clk_xgmii (rx_clk_xgmii),        // output (xgmii_if_P0,xgmii_if_P1) => ()
    .rxd_xgmii    (xgmii_rxd0),          // output (xgmii_if_P0) => (xgmii_tx_enc_top_P0)
    .rxctrl_xgmii (xgmii_rxc0),          // output (xgmii_if_P0) => (xgmii_tx_enc_top_P0)
    .tx_clk_xgmii (tx_clk_xgmii0),       // output (xgmii_if_P0) => ()
    .txd          (m0_xgmii_txdata),     // output (xgmii_if_P0) => ()
    .txen         (m0_xgmii_tx_en)       // output (xgmii_if_P0) => ()
    );

xgmii_if xgmii_if_P1 (
    .rxd          (m1_rx_data),          // input  (pcs_1_ENV,xgmii_if_P1) <= ()
    .rxdv         (m1_rx_dv),            // input  (pcs_1_ENV,xgmii_if_P1) <= ()
    .rx_clk       (m1_rx_clk),           // input  (xgmii_if_P1) <= (port1_clk)
    .txd_xgmii    (xgmii_txd1_in[31:0]), // input  (xgmii_if_P1) <= (xgmii_A_dec_P1,xgmii_B_dec_P1,xgmii_C_dec_P1,xgmii_D_dec_P1)
    .txctrl_xgmii (xgmii_txc1_in[3:0]),  // input  (xgmii_if_P1) <= (xgmii_A_dec_P1,xgmii_B_dec_P1,xgmii_C_dec_P1,xgmii_D_dec_P1)
    .tx_clk       (m1_rx_clk),           // input  (xgmii_if_P1) <= (port1_clk)
    .rx_clk_xgmii (rx_clk_xgmii),        // output (xgmii_if_P0,xgmii_if_P1) => ()
    .rxd_xgmii    (xgmii_rxd1),          // output (xgmii_if_P1) => (xgmii_tx_enc_top_P1)
    .rxctrl_xgmii (xgmii_rxc1),          // output (xgmii_if_P1) => (xgmii_tx_enc_top_P1)
    .tx_clk_xgmii (tx_clk_xgmii1),       // output (xgmii_if_P1) => ()
    .txd          (m1_xgmii_txdata),     // output (xgmii_if_P1) => ()
    .txen         (m1_xgmii_tx_en)       // output (xgmii_if_P1) => ()
    );

port_clk port0_clk (
    .tx_clkp   (m0_tx_clk_port),    // output (port0_clk) => ()
    .tx_clkn   (tx_clkn),           // output (port0_clk,port1_clk,port2_clk,port3_clk) => ()
    .rx_clkp   (m0_rx_clk),         // output (port0_clk) => (xgmii_if_P0)
    .rx_clkn   (rx_clkn),           // output (port0_clk,port1_clk,port2_clk,port3_clk) => ()
    .tx_config (m0_tx_config[3:0]), // input  (port0_clk) <= ()
    .rx_config (m0_rx_config[3:0])  // input  (port0_clk) <= ()
    );

port_clk port1_clk (
    .tx_clkp   (m1_tx_clk_port),    // output (port1_clk) => ()
    .tx_clkn   (tx_clkn),           // output (port0_clk,port1_clk,port2_clk,port3_clk) => ()
    .rx_clkp   (m1_rx_clk),         // output (port1_clk) => (xgmii_if_P1)
    .rx_clkn   (rx_clkn),           // output (port0_clk,port1_clk,port2_clk,port3_clk) => ()
    .tx_config (m1_tx_config[3:0]), // input  (port1_clk) <= ()
    .rx_config (m1_rx_config[3:0])  // input  (port1_clk) <= ()
    );

port_clk port2_clk (
    .tx_clkp   (m2_tx_clk_port),    // output (port2_clk) => ()
    .tx_clkn   (tx_clkn),           // output (port0_clk,port1_clk,port2_clk,port3_clk) => ()
    .rx_clkp   (m2_rx_clk),         // output (port2_clk) => ()
    .rx_clkn   (rx_clkn),           // output (port0_clk,port1_clk,port2_clk,port3_clk) => ()
    .tx_config (m2_tx_config[3:0]), // input  (port2_clk) <= ()
    .rx_config (m2_rx_config[3:0])  // input  (port2_clk) <= ()
    );

port_clk port3_clk (
    .tx_clkp   (m3_tx_clk_port),    // output (port3_clk) => ()
    .tx_clkn   (tx_clkn),           // output (port0_clk,port1_clk,port2_clk,port3_clk) => ()
    .rx_clkp   (m3_rx_clk),         // output (port3_clk) => ()
    .rx_clkn   (rx_clkn),           // output (port0_clk,port1_clk,port2_clk,port3_clk) => ()
    .tx_config (m3_tx_config[3:0]), // input  (port3_clk) <= ()
    .rx_config (m3_rx_config[3:0])  // input  (port3_clk) <= ()
    );

bw_calc BW_CALC_P0 (
    .clk        (m0_tx_clk),        // input  (BW_CALC_P0) <= ()
    .data       (m0_tx_data),       // input  (BW_CALC_P0) <= ()
    .enb        (m0_tx_en),         // input  (BW_CALC_P0) <= ()
    .cal_enb    (enb_bwcal_r),      // input  (BW_CALC_P0,BW_CALC_P1) <= ()
    .speed_10G  (speed_10G_w),      // input  (BW_CALC_P0,BW_CALC_P1) <= ()
    .port_num   ({VLO,VLO}),        // input  (BW_CALC_P0,BW_CALC_P1) <= ()
    .no_of_pkts (no_of_txpkts_r),   // input  (BW_CALC_P0,BW_CALC_P1) <= ()
    .pkt_len    (tx_pkt_len_r)      // input  (BW_CALC_P0,BW_CALC_P1) <= ()
    );

bw_calc BW_CALC_P1 (
    .clk        (m1_tx_clk),        // input  (BW_CALC_P1) <= ()
    .data       (m1_tx_data),       // input  (BW_CALC_P1) <= ()
    .enb        (m1_tx_en),         // input  (BW_CALC_P1) <= ()
    .cal_enb    (enb_bwcal_r),      // input  (BW_CALC_P0,BW_CALC_P1) <= ()
    .speed_10G  (speed_10G_w),      // input  (BW_CALC_P0,BW_CALC_P1) <= ()
    .port_num   ({VLO,VDD}),        // input  (BW_CALC_P0,BW_CALC_P1) <= ()
    .no_of_pkts (no_of_txpkts_r),   // input  (BW_CALC_P0,BW_CALC_P1) <= ()
    .pkt_len    (tx_pkt_len_r)      // input  (BW_CALC_P0,BW_CALC_P1) <= ()
    );
// VPERL: GENERATED_END

//------------------------------------------------------------
// SerDes_ENV initialization
//------------------------------------------------------------

assign w_BT_EN  = 1'b0;
assign w_RO_EN  = 1'b0;
assign w_SYNC_CHAR       = 10'b0101111100;
assign w_SYNC_MASK       = 5'b00000;


assign w_TEST_EN         = 1'b0;
assign w_BS_MODE         = 1'b0;
assign w_FORCE_DRV_DIS   = 1'b0;
assign w_TX_BS_SEL       = 1'b0;


assign env_eser_pll_en = 1;
assign env_eser_bias_en = 1;
assign env_eser_tclk_sel = 1;
assign env_eser_drv_emp_lvl_a[1] = 0;
assign env_eser_drv_emp_lvl_a[0] = 0;
assign env_eser_drv_emp_lvl_b[1] = 0;
assign env_eser_drv_emp_lvl_b[0] = 0;
assign env_eser_drv_emp_lvl_c[1] = 0;
assign env_eser_drv_emp_lvl_c[0] = 0;
assign env_eser_drv_emp_lvl_d[1] = 0;
assign env_eser_drv_emp_lvl_d[0] = 0;
/**
assign env_eser_ser_sel[1] = 0;
assign env_eser_ser_sel[0] = 0;
assign env_eser_refclk_sel = 0; 
**/
assign env_eser_trd_sel = 0;
assign env_eser_low_latency = 0;
assign env_eser_sync_dual_pol = 1;
assign env_eser_tubi[5] = 0;
assign env_eser_tubi[4] = 0;
assign env_eser_tubi[3] = 0;
assign env_eser_tubi[2] = 0;
assign env_eser_tubi[1] = 0;
assign env_eser_tubi[0] = 0;
assign env_eser_tx_en_a = 1;
assign env_eser_tx_en_b = 1;
assign env_eser_tx_en_c = 1;
assign env_eser_tx_en_d = 1;
assign env_eser_tx_clk_en_a = 1;
assign env_eser_tx_clk_en_b = 1;
assign env_eser_tx_clk_en_c = 1;
assign env_eser_tx_clk_en_d = 1;
assign env_eser_drv_en_a = 1;
assign env_eser_drv_en_b = 1;
assign env_eser_drv_en_c = 1;
assign env_eser_drv_en_d = 1;
assign env_eser_lev_sel_a[1] = 0;
assign env_eser_lev_sel_b[1] = 0;
assign env_eser_lev_sel_c[1] = 0;
assign env_eser_lev_sel_d[1] = 0;
assign env_eser_lev_sel_a[0] = 0;
assign env_eser_lev_sel_b[0] = 0;
assign env_eser_lev_sel_c[0] = 0;
assign env_eser_lev_sel_d[0] = 0;
assign env_eser_tx_lpb_en_a = 0;
assign env_eser_tx_lpb_en_b = 0;
assign env_eser_tx_lpb_en_c = 0;
assign env_eser_tx_lpb_en_d = 0;
assign env_eser_rx_lpb_en_a = 0;
assign env_eser_rx_lpb_en_b = 0;
assign env_eser_rx_lpb_en_c = 0;
assign env_eser_rx_lpb_en_d = 0;
assign env_eser_rx_en_a = 1;
assign env_eser_rx_en_b = 1;
assign env_eser_rx_en_c = 1;
assign env_eser_rx_en_d = 1;
assign env_eser_rx_clk_en_a = 1;
assign env_eser_rx_clk_en_b = 1;
assign env_eser_rx_clk_en_c = 1;
assign env_eser_rx_clk_en_d = 1;
assign env_eser_rx_sleep_en_a = 1;
assign env_eser_rx_sleep_en_b = 1;
assign env_eser_rx_sleep_en_c = 1;
assign env_eser_rx_sleep_en_d = 1;
assign env_eser_rbc_sel_a = 0;
assign env_eser_rbc_sel_b = 0;
assign env_eser_rbc_sel_c = 0;
assign env_eser_rbc_sel_d = 0;
assign env_eser_byte_sync_en_a = 1;
assign env_eser_byte_sync_en_b = 1;
assign env_eser_byte_sync_en_c = 1;
assign env_eser_byte_sync_en_d = 1;
assign env_eser_sync_sel_a = 0;
assign env_eser_sync_sel_b = 0;
assign env_eser_sync_sel_c = 0;
assign env_eser_sync_sel_d = 0;
assign env_eser_rx_reset_a = 0;
assign env_eser_rx_reset_b = 0;
assign env_eser_rx_reset_c = 0;
assign env_eser_rx_reset_d = 0;



  
//------------------------------------------------------------
// pcs_ENV initialization
//------------------------------------------------------------

assign signal_detect_pcs_ENV = 1;
assign serdes_rdy_pcs_ENV = 1;
assign #2 odd_rx_pcs0_ENV =  eser_env_rbc1_a;
assign #2 odd_rx_pcs1_ENV =  eser_env_rbc1_b;
//assign #2 odd_rx_pcs2_ENV =  eser_env_rbc1_c;
//assign #2 odd_rx_pcs3_ENV =  eser_env_rbc1_d;
assign pio_core_sel_pcs_ENV = 1;
assign pio_rd_wr__pcs_ENV = 0;
assign pio_addr_pcs_ENV = 0;
assign pio_wr_data_pcs_ENV = 0;
assign slink_state_pcs_ENV = 0;

// asign TD and xgmii_env_esr

assign TD0_p0 = temp_enc_ch0_p0;
assign TD1_p0 = temp_enc_ch1_p0;
assign TD2_p0 = temp_enc_ch2_p0;
assign TD3_p0 = temp_enc_ch3_p0;

assign TD0_p1 = temp_enc_ch0_p1;
assign TD1_p1 = temp_enc_ch1_p1;
assign TD2_p1 = temp_enc_ch2_p1;
assign TD3_p1 = temp_enc_ch3_p1;


initial begin
force enet_models.pcs_0_ENV.pcs_slave.phy_mode_ext_xREG2.qout=2'b10;
force enet_models.pcs_0_ENV.pcs_slave.pcs_config_xREG2.qout=7'h21;
force enet_models.pcs_1_ENV.pcs_slave.phy_mode_ext_xREG2.qout=2'b10;
force enet_models.pcs_1_ENV.pcs_slave.pcs_config_xREG2.qout=7'h21;
//force enet_models.pcs_2_ENV.pcs_slave.phy_mode_ext_xREG2.qout=2'b10;
//force enet_models.pcs_2_ENV.pcs_slave.pcs_config_xREG2.qout=7'h21;
//force enet_models.pcs_3_ENV.pcs_slave.phy_mode_ext_xREG2.qout=2'b10;
//force enet_models.pcs_3_ENV.pcs_slave.pcs_config_xREG2.qout=7'h21;
end


reg sel_gmii;
integer speed0,speed1;
integer mac_port;
reg speed_10G;
reg[8*60:1]   arg,arg0,arg1,arg2,arg3;
reg enb_bwcal;
integer no_of_txpkts,tx_pkt_len;
integer tb_time_out;
reg [31:0]  CycleCounter;

`ifdef TEST_UNH_VECTORS
 initial begin

   if ($value$plusargs ("tb_time_out=%d", tb_time_out)) begin
      $display("SET tb_time_out = %d", tb_time_out);
   end // if ($value$plusargs ("tb_time_out=%d", tb_time_out))
   else
     begin
        tb_time_out = 1999999;
        $display("SET tb_time_out = %d", tb_time_out);
     end // else: !if($value$plusargs ("tb_time_out=%d", tb_time_out))
 end // initial begin

 initial CycleCounter = 0;

 always @(posedge core_clk)
     begin
       CycleCounter = CycleCounter+1;
       if(CycleCounter % 100000 == 0)
         $display("INFO Simulation CycleCounter = %d", CycleCounter);
     end

 always @(posedge core_clk)
     begin
        if(CycleCounter > tb_time_out)
          begin
             $display("INFO Simulation is quitting at CycleCounter = %d for UNH TESTS", CycleCounter);
             $finish;
          end // if (CycleCounter == 32'h5_4000)
     end // always @ (posedge SystemClock)
`else
`endif

/* reg	[9:0]	xgmii_env_eser_rxd_a;
reg	[9:0]	xgmii_env_eser_rxd_b;
reg	[9:0]	xgmii_env_eser_rxd_c;
reg	[9:0]	xgmii_env_eser_rxd_d; */

wire [9:0]  xgmii_env_eser_rxd_a;
wire [9:0]  xgmii_env_eser_rxd_b;
wire [9:0]  xgmii_env_eser_rxd_c;
wire [9:0]  xgmii_env_eser_rxd_d;


initial
  begin
   arg = "GET_MAC_PORTS=";

   if ($test$plusargs("GET_MAC_PORTS="))
       mac_port =  $util_get_plus_args_num(arg); 
       $display("mc_core : Ethernet Port is %0d \n",mac_port);
  end

   /* if (mac_port == 0)
     begin
      xgmii_env_eser_rxd_a = temp_enc_ch0_p0;
      xgmii_env_eser_rxd_b = temp_enc_ch1_p0;
      xgmii_env_eser_rxd_c = temp_enc_ch2_p0;
      xgmii_env_eser_rxd_d = temp_enc_ch3_p0;
     end
   else if (mac_port == 1)
     begin
      xgmii_env_eser_rxd_a = temp_enc_ch0_p1;
      xgmii_env_eser_rxd_b = temp_enc_ch1_p1;
      xgmii_env_eser_rxd_c = temp_enc_ch2_p1;
      xgmii_env_eser_rxd_d = temp_enc_ch3_p1;
     end
  end */

  assign xgmii_env_eser_rxd_a = mac_port ? temp_enc_ch0_p1 : temp_enc_ch0_p0;
  assign xgmii_env_eser_rxd_b = mac_port ? temp_enc_ch1_p1 : temp_enc_ch1_p0;
  assign xgmii_env_eser_rxd_c = mac_port ? temp_enc_ch2_p1 : temp_enc_ch2_p0;
  assign xgmii_env_eser_rxd_d = mac_port ? temp_enc_ch3_p1 : temp_enc_ch3_p0;


initial
  begin

        /* Check MAC_SPEED0 */

        arg0 = "MAC_SPEED0=";
        if ($test$plusargs("MAC_SPEED0="))
           speed0 = $util_get_plus_args_num(arg0);
        else speed0 = 1000;

        /* Check MAC_SPEED1 */

        arg1 = "MAC_SPEED1=";
        if ($test$plusargs("MAC_SPEED1="))
           speed1 = $util_get_plus_args_num(arg1);
        else speed1 = 1000;

        arg2 = "TX_PKT_CNT=";
        /* check for no_of_pkts */
         if ($test$plusargs("TX_PKT_CNT=")) begin
             no_of_txpkts = $util_get_plus_args_num(arg2);
            $display("Number of tx_pkts %0d\n",no_of_txpkts);
         end

         arg3 = "TX_PKT_LEN=";
        /* check for no_of_pkts */
         if ($test$plusargs("TX_PKT_LEN=")) begin
            tx_pkt_len = $util_get_plus_args_num(arg3);
            $display("Tx_pkt_len %0d\n",tx_pkt_len);
         end


        if ((speed0 == 10000) ||(speed1 == 10000))
        begin
            $display("mc_core : Ethernet Speed 10G\n");
            speed_10G = 1;
        end
        else
        begin
            $display("mac_core : Ethernet Speed0 Speed1 %0d, %0d\n",speed0, speed1);
            speed_10G = 0;
        end

        /* Check PCS_SERDES */

        if ($test$plusargs("PCS_SERDES"))
        begin
            $display("mac_core : Ethernet SerDes Mode\n");
            sel_gmii = 0;
        end
        else
        begin
            $display("mac_core : Ethernet RGMII Mode\n");
            sel_gmii = 1;
        end

        /* check if perf test */

        if($test$plusargs("PERF_TEST"))
         begin
           $display("BANDW_CAL_ON\n");
           enb_bwcal = 1;
         end
        else
           enb_bwcal = 0;

end

assign  no_of_txpkts_r = no_of_txpkts;
assign  tx_pkt_len_r = tx_pkt_len;
assign  enb_bwcal_r = enb_bwcal;
assign  speed_10G_w = speed_10G;

////////////////////////////////////////////////////
// INJECT_10b_ERRORS    //port0 only
// test specific, only sends corrupt pattern for `corrupt_time_limit
`define corrupt_time_limit 160000
`define corrupt_limit_min 300
`define corrupt_limit_max 600

reg [9:0] txd_corrupt;
integer corrupt_cnt=0;
integer corrupt_limit=`corrupt_limit_min;
reg corrupt;
reg inject_10b_errors=0;

initial begin
  corrupt=0;
  txd_corrupt='h17c;
  if($test$plusargs("INJECT_10b_ERRORS")) begin
     repeat(2000) @(posedge ref_clk);  // wait for link up
     inject_10b_errors=1;
  end
  else inject_10b_errors=0;
end

always@(posedge TXBCLK_p0[0] & inject_10b_errors) begin
    if($time>`corrupt_time_limit) begin
      corrupt=0;                            // stop corrupting and let link up remain
    end
    else if(corrupt_cnt==corrupt_limit) begin
       corrupt_cnt = 0;
       corrupt=~corrupt;
       if(corrupt==1) begin
         if(corrupt_limit==`corrupt_limit_max) corrupt_limit=`corrupt_limit_min;
         else corrupt_limit=corrupt_limit+3;
       end 
    end
    else corrupt_cnt = corrupt_cnt +1;
end

always@(posedge TXBCLK_p0[0]) begin
  if(corrupt_cnt<5) txd_corrupt=$random;
  else txd_corrupt = (txd_corrupt=='h17c) ? 9'h00 : 9'h17c;  //17c==fa
end
////////////////////////////////////////////////////

assign TD0_r_p0_mux = speed_10G ? {TD0_p0[0],TD0_p0[1],TD0_p0[2],TD0_p0[3],TD0_p0[4],
                                   TD0_p0[5],TD0_p0[6],TD0_p0[7],TD0_p0[8],TD0_p0[9]} : 
                                  {env_eser_rxd_a[0],env_eser_rxd_a[1],env_eser_rxd_a[2],
                                   env_eser_rxd_a[3],env_eser_rxd_a[4],env_eser_rxd_a[5], 
                                   env_eser_rxd_a[6],env_eser_rxd_a[7],env_eser_rxd_a[8],
                                   env_eser_rxd_a[9]};
assign TD0_r_p1_mux = speed_10G ? {TD0_p1[0],TD0_p1[1],TD0_p1[2],TD0_p1[3],TD0_p1[4],
                                   TD0_p1[5],TD0_p1[6],TD0_p1[7],TD0_p1[8],TD0_p1[9]} : 
                                  {env_eser_rxd_b[0],env_eser_rxd_b[1],env_eser_rxd_b[2],
                                   env_eser_rxd_b[3],env_eser_rxd_b[4],env_eser_rxd_b[5], 
                                   env_eser_rxd_b[6],env_eser_rxd_b[7],env_eser_rxd_b[8],
                                   env_eser_rxd_b[9]};


//-------------------------------------------------------
//-- For ti serdes reverse the encoded data Port 0 ------
//-------------------------------------------------------

//  assign TD0_r_p0 = {TD0_p0[0],TD0_p0[1],TD0_p0[2],TD0_p0[3],TD0_p0[4],
//                     TD0_p0[5],TD0_p0[6],TD0_p0[7],TD0_p0[8],TD0_p0[9]};

//  assign TD1_r_p0 = TD1_r_p0_mux; // mux for 10G and 1G   

//  assign TD0_r_p0 = TD0_r_p0_mux; // mux for 10G and 1G   

`ifdef TEST_UNH_VECTORS
   assign TD0_r_p0 = {env_eser_rxd_a_del[0],env_eser_rxd_a_del[1],env_eser_rxd_a_del[2],env_eser_rxd_a_del[3],
                      env_eser_rxd_a_del[4],env_eser_rxd_a_del[5],env_eser_rxd_a_del[6],env_eser_rxd_a_del[7],
                      env_eser_rxd_a_del[8],env_eser_rxd_a_del[9]};
`else
    //assign TD0_r_p0 = TD0_r_p0_mux;
    assign TD0_r_p0 = (corrupt) ? {txd_corrupt[0],txd_corrupt[1],txd_corrupt[2],
                                   txd_corrupt[3],txd_corrupt[4],txd_corrupt[5], 
                                   txd_corrupt[6],txd_corrupt[7],txd_corrupt[8],
                                   txd_corrupt[9]}
                                : TD0_r_p0_mux;
`endif

`ifdef TEST_UNH_VECTORS
   assign TD1_r_p0 = {env_eser_rxd_b_del[0],env_eser_rxd_b_del[1],env_eser_rxd_b_del[2],env_eser_rxd_b_del[3],
                      env_eser_rxd_b_del[4],env_eser_rxd_b_del[5],env_eser_rxd_b_del[6],env_eser_rxd_b_del[7],
                      env_eser_rxd_b_del[8],env_eser_rxd_b_del[9]};
`else
  assign TD1_r_p0 = {TD1_p0[0],TD1_p0[1],TD1_p0[2],TD1_p0[3],TD1_p0[4],
                     TD1_p0[5],TD1_p0[6],TD1_p0[7],TD1_p0[8],TD1_p0[9]};
`endif

`ifdef TEST_UNH_VECTORS
   assign TD2_r_p0 = {env_eser_rxd_c_del[0],env_eser_rxd_c_del[1],env_eser_rxd_c_del[2],env_eser_rxd_c_del[3],
                      env_eser_rxd_c_del[4],env_eser_rxd_c_del[5],env_eser_rxd_c_del[6],env_eser_rxd_c_del[7],
                      env_eser_rxd_c_del[8],env_eser_rxd_c_del[9]};
   `else
  assign TD2_r_p0 = {TD2_p0[0],TD2_p0[1],TD2_p0[2],TD2_p0[3],TD2_p0[4],
                     TD2_p0[5],TD2_p0[6],TD2_p0[7],TD2_p0[8],TD2_p0[9]};
`endif

`ifdef TEST_UNH_VECTORS
   // assign TD3_r_p0 = env_eser_rxd_d_del[9:0];
   assign TD3_r_p0 = {env_eser_rxd_d_del[0],env_eser_rxd_d_del[1],env_eser_rxd_d_del[2],env_eser_rxd_d_del[3],
                      env_eser_rxd_d_del[4],env_eser_rxd_d_del[5],env_eser_rxd_d_del[6],env_eser_rxd_d_del[7],
                      env_eser_rxd_d_del[8],env_eser_rxd_d_del[9]};
`else
  assign TD3_r_p0 = {TD3_p0[0],TD3_p0[1],TD3_p0[2],TD3_p0[3],TD3_p0[4],
                     TD3_p0[5],TD3_p0[6],TD3_p0[7],TD3_p0[8],TD3_p0[9]};
`endif

  assign RD0_r_p0 = {RD0_p0[0],RD0_p0[1],RD0_p0[2],RD0_p0[3],RD0_p0[4],
                     RD0_p0[5],RD0_p0[6],RD0_p0[7],RD0_p0[8],RD0_p0[9]};

  assign RD1_r_p0 = {RD1_p0[0],RD1_p0[1],RD1_p0[2],RD1_p0[3],RD1_p0[4],
                     RD1_p0[5],RD1_p0[6],RD1_p0[7],RD1_p0[8],RD1_p0[9]};

  assign RD2_r_p0 = {RD2_p0[0],RD2_p0[1],RD2_p0[2],RD2_p0[3],RD2_p0[4],
                     RD2_p0[5],RD2_p0[6],RD2_p0[7],RD2_p0[8],RD2_p0[9]};

  assign RD3_r_p0 = {RD3_p0[0],RD3_p0[1],RD3_p0[2],RD3_p0[3],RD3_p0[4],
                     RD3_p0[5],RD3_p0[6],RD3_p0[7],RD3_p0[8],RD3_p0[9]};


//-------------------------------------------------------
//-- For ti serdes reverse the encoded data Port 1 ------
//-------------------------------------------------------

// assign TD0_r_p1 = {TD0_p1[0],TD0_p1[1],TD0_p1[2],TD0_p1[3],TD0_p1[4],
//                     TD0_p1[5],TD0_p1[6],TD0_p1[7],TD0_p1[8],TD0_p1[9]};

//  assign TD0_r_p1 = TD0_r_p1_mux; // mux for 10G and 1G   

`ifdef TEST_UNH_VECTORS
   assign TD0_r_p1 = {env_eser_rxd_a_del[0],env_eser_rxd_a_del[1],env_eser_rxd_a_del[2],env_eser_rxd_a_del[3],
                      env_eser_rxd_a_del[4],env_eser_rxd_a_del[5],env_eser_rxd_a_del[6],env_eser_rxd_a_del[7],
                      env_eser_rxd_a_del[8],env_eser_rxd_a_del[9]};
`else
  assign TD0_r_p1 = TD0_r_p1_mux; // mux for 10G and 1G  
`endif

`ifdef TEST_UNH_VECTORS
   assign TD1_r_p1 = {env_eser_rxd_b_del[0],env_eser_rxd_b_del[1],env_eser_rxd_b_del[2],env_eser_rxd_b_del[3],
                      env_eser_rxd_b_del[4],env_eser_rxd_b_del[5],env_eser_rxd_b_del[6],env_eser_rxd_b_del[7],
                      env_eser_rxd_b_del[8],env_eser_rxd_b_del[9]};
`else
  assign TD1_r_p1 = {TD1_p1[0],TD1_p1[1],TD1_p1[2],TD1_p1[3],TD1_p1[4],
                     TD1_p1[5],TD1_p1[6],TD1_p1[7],TD1_p1[8],TD1_p1[9]};
`endif

`ifdef TEST_UNH_VECTORS
   assign TD2_r_p1 = {env_eser_rxd_c_del[0],env_eser_rxd_c_del[1],env_eser_rxd_c_del[2],env_eser_rxd_c_del[3],
                      env_eser_rxd_c_del[4],env_eser_rxd_c_del[5],env_eser_rxd_c_del[6],env_eser_rxd_c_del[7],
                      env_eser_rxd_c_del[8],env_eser_rxd_c_del[9]};
`else
  assign TD2_r_p1 = {TD2_p1[0],TD2_p1[1],TD2_p1[2],TD2_p1[3],TD2_p1[4],
                     TD2_p1[5],TD2_p1[6],TD2_p1[7],TD2_p1[8],TD2_p1[9]};
`endif

`ifdef TEST_UNH_VECTORS
   assign TD3_r_p1 = {env_eser_rxd_d_del[0],env_eser_rxd_d_del[1],env_eser_rxd_d_del[2],env_eser_rxd_d_del[3],
                      env_eser_rxd_d_del[4],env_eser_rxd_d_del[5],env_eser_rxd_d_del[6],env_eser_rxd_d_del[7],
                      env_eser_rxd_d_del[8],env_eser_rxd_d_del[9]};
`else
  assign TD3_r_p1 = {TD3_p1[0],TD3_p1[1],TD3_p1[2],TD3_p1[3],TD3_p1[4],
                     TD3_p1[5],TD3_p1[6],TD3_p1[7],TD3_p1[8],TD3_p1[9]};
`endif

  assign RD0_r_p1 = {RD0_p1[0],RD0_p1[1],RD0_p1[2],RD0_p1[3],RD0_p1[4],
                     RD0_p1[5],RD0_p1[6],RD0_p1[7],RD0_p1[8],RD0_p1[9]};

  assign RD1_r_p1 = {RD1_p1[0],RD1_p1[1],RD1_p1[2],RD1_p1[3],RD1_p1[4],
                     RD1_p1[5],RD1_p1[6],RD1_p1[7],RD1_p1[8],RD1_p1[9]};

  assign RD2_r_p1 = {RD2_p1[0],RD2_p1[1],RD2_p1[2],RD2_p1[3],RD2_p1[4],
                     RD2_p1[5],RD2_p1[6],RD2_p1[7],RD2_p1[8],RD2_p1[9]};

  assign RD3_r_p1 = {RD3_p1[0],RD3_p1[1],RD3_p1[2],RD3_p1[3],RD3_p1[4],
                     RD3_p1[5],RD3_p1[6],RD3_p1[7],RD3_p1[8],RD3_p1[9]};


     assign env_eser_ser_sel[1] = speed_10G ? 1'b1 : 1'b0; 
     assign env_eser_ser_sel[0] = speed_10G ? 1'b0 : 1'b0; 
     assign env_eser_refclk_sel = speed_10G ? 1'b1 : 1'b0;

     assign rxclk_mux0 = speed_10G ? 1'b0 : RXBCLK_p0[0];
     assign rxclk_mux1 = speed_10G ? 1'b0 : RXBCLK_p1[0];
     assign txclk_mux0 = speed_10G ? 1'b0 : TXBCLK_p0[0];
     assign txclk_mux1 = speed_10G ? 1'b0 : TXBCLK_p1[0];

     assign m0_tx_clk =  speed_10G ?  tx_clk_xgmii0 : (sel_gmii ?  RGMII_TXCLK0 : eser_env_tclk0);
     assign m1_tx_clk =  speed_10G ?  tx_clk_xgmii1 : (sel_gmii ?  RGMII_TXCLK1 : eser_env_tclk1);
     assign m2_tx_clk =  sel_gmii ?  RGMII_TXCLK2 : eser_env_tclk0;
     assign m3_tx_clk =  sel_gmii ?  RGMII_TXCLK3 : eser_env_tclk0;
    
     assign eser_env_tclk0 = TXBCLK_p0[0];
     assign eser_env_tclk1 = TXBCLK_p1[0];

     assign m0_tx_data = speed_10G ? m0_xgmii_txdata : (sel_gmii ?  rgmii0_tx_data : pcs0_tx_data);
     assign m0_tx_en   = speed_10G ? m0_xgmii_tx_en : (sel_gmii ?  rgmii0_tx_en : pcs0_tx_en);
     assign m0_tx_err  = speed_10G ? 0 : (sel_gmii ?  rgmii0_tx_err : pcs0_tx_err);

     assign m1_tx_data = speed_10G ? m1_xgmii_txdata : (sel_gmii ?  rgmii1_tx_data : pcs1_tx_data);
     assign m1_tx_en   = speed_10G ? m1_xgmii_tx_en : (sel_gmii ?  rgmii1_tx_en : pcs1_tx_en);
     assign m1_tx_err  = speed_10G ? 0 : ( sel_gmii ?  rgmii1_tx_err : pcs1_tx_err);


     assign m2_tx_data = sel_gmii ?  rgmii2_tx_data : pcs2_tx_data;
     assign m2_tx_en   = sel_gmii ?  rgmii2_tx_en   : pcs2_tx_en;
     assign m2_tx_err  = sel_gmii ?  rgmii2_tx_err  : pcs2_tx_err;

     assign m3_tx_data = sel_gmii ?  rgmii3_tx_data : pcs3_tx_data;
     assign m3_tx_en   = sel_gmii ?  rgmii3_tx_en   : pcs3_tx_en;
     assign m3_tx_err  = sel_gmii ?  rgmii3_tx_err  : pcs3_tx_err;

     assign #0.9 xgmii_env_eser_rxd_a_del[9:0] = xgmii_env_eser_rxd_a[9:0];  
     assign #0.9 xgmii_env_eser_rxd_b_del[9:0] = xgmii_env_eser_rxd_b[9:0];  
     assign #0.9 xgmii_env_eser_rxd_c_del[9:0] = xgmii_env_eser_rxd_c[9:0];  
     assign #0.9 xgmii_env_eser_rxd_d_del[9:0] = xgmii_env_eser_rxd_d[9:0];  



        assign #0.9 env_eser_rxd_a_del1[9:0] = env_eser_rxd_a[9:0];
        assign #0.9 env_eser_rxd_b_del1[9:0] = env_eser_rxd_b[9:0];
        assign #0.9 env_eser_rxd_c_del1[9:0] = env_eser_rxd_c[9:0];
        assign #0.9 env_eser_rxd_d_del1[9:0] = env_eser_rxd_d[9:0];


`ifdef TEST_UNH_VECTORS
   reg [9:0] unh_rxd_a,unh_rxd_b,unh_rxd_c,unh_rxd_d;
   wire [9:0] unh_rxd_a_del,unh_rxd_b_del,unh_rxd_c_del,unh_rxd_d_del;
   reg [9:0] vectors[20000:0];
   reg [15:0] vector_loc;
   reg start_playing_vectors;
   reg USE_UNH_VECTOR;
   wire USE_UNH_VECTOR_del;
   reg [31:0] start_time;
   reg[8*60:1]   unh_arg;
   integer plus_args_ok;
   reg [400*8:0] unh_vector_filename;
   wire env_eop;
   reg [3:0] env_pkt_cnt;
   reg new_start_time,new_start_time_d;
   reg check_serdes_output;	
  
  initial begin
     USE_UNH_VECTOR =0;
     env_pkt_cnt = 4'h0;
     new_start_time =0;
     new_start_time_d =0;
     start_playing_vectors =0;
     unh_rxd_a = 0;
     unh_rxd_b = 0;
     unh_rxd_c = 0;
     unh_rxd_d = 0;
     for(vector_loc =0;vector_loc < 18096; vector_loc = vector_loc +1)
       vectors[vector_loc] = 0;
     
     unh_vector_filename = "unh_vectors.txt";
     
     //plus_args_ok = $util_get_plus_args_str("UNH_VECTOR_FILE_",unh_vector_filename);
     plus_args_ok = $value$plusargs("UNH_VECTOR_FILE=%s", unh_vector_filename);

     if(plus_args_ok)
       $display("UNH_DEBUG: UNH Vector Files -- %s",unh_vector_filename);
     else begin
	unh_vector_filename = "unh_vectors.txt";
	$display("UNH_DEBUG: No Vector File Specified Using Default FileName-- %s",unh_vector_filename);
        $display("UNH_DEBUG: UNH Vector Files -- %s",unh_vector_filename);
     end

     $readmemb(unh_vector_filename,vectors);
     $display(" UNH Vectors Read into Buffer \n");

     vector_loc =0;

     unh_arg = "UNH_START_TIME=";
     if ($test$plusargs("UNH_START_TIME="))
	  start_time =  $util_get_plus_args_num(unh_arg);
     else start_time = 1277;
     $display("%m:UNH start time set to %d \n",start_time);
     // $display("%m:UNH start time set to %d \n",start_time);
     // repeat(1633) @(posedge ref_clk);
     // repeat(1347) @(posedge ref_clk);
     // repeat(1277) @(posedge ref_clk);
     // repeat(start_time) @(posedge ref_clk);
     // start_playing_vectors =1;
     // $display(" UNH VECTORS STARTED Time = %t ",$time);
 

  end
   assign env_eop = (xgmii_env_eser_rxd_a[9:0] == 10'h3a2 /* 0x117*/ ) | ( xgmii_env_eser_rxd_a[9:0] == 10'h05d /* 0x2e8*/ );
   always@(posedge ref_clk) begin
      if(env_eop)
	env_pkt_cnt <= env_pkt_cnt +1;
      if(env_pkt_cnt ==1) begin
	 start_playing_vectors <= 1;
      end // if (env_pkt_cnt ==1)
	new_start_time_d <= start_playing_vectors;
      if(~start_playing_vectors & new_start_time_d)
	$display(" UNH VECTORS STARTED Time = %t ",$time);

   end
   
   

   always@(posedge ref_clk) begin
      if(start_playing_vectors) begin
	 USE_UNH_VECTOR <=1;
	 unh_rxd_a <= vectors[vector_loc +0 ] ;
	 unh_rxd_b <= vectors[vector_loc +1 ] ;
	 unh_rxd_c <= vectors[vector_loc +2 ] ;
	 unh_rxd_d <= vectors[vector_loc +3 ] ;
	 vector_loc <= vector_loc +4;
          if(vector_loc >= 18096)  begin
            USE_UNH_VECTOR <=0;
            start_playing_vectors <= 1'b0;
          end
      end else // if (start_playing_vectors)
	USE_UNH_VECTOR <=0;
      
   end

  // assign #0.9 USE_UNH_VECTOR_del = USE_UNH_VECTOR;
   assign #0.9 USE_UNH_VECTOR_del = new_start_time_d;
   
   assign #0.9  unh_rxd_a_del = {unh_rxd_a[0],unh_rxd_a[1],unh_rxd_a[2],unh_rxd_a[3],unh_rxd_a[4],unh_rxd_a[5],unh_rxd_a[6],unh_rxd_a[7],unh_rxd_a[8],unh_rxd_a[9]} ;
   assign #0.9  unh_rxd_b_del = {unh_rxd_b[0],unh_rxd_b[1],unh_rxd_b[2],unh_rxd_b[3],unh_rxd_b[4],unh_rxd_b[5],unh_rxd_b[6],unh_rxd_b[7],unh_rxd_b[8],unh_rxd_b[9]}  ;
   assign #0.9  unh_rxd_c_del = {unh_rxd_c[0],unh_rxd_c[1],unh_rxd_c[2],unh_rxd_c[3],unh_rxd_c[4],unh_rxd_c[5],unh_rxd_c[6],unh_rxd_c[7],unh_rxd_c[8],unh_rxd_c[9]}  ;
   assign #0.9  unh_rxd_d_del = {unh_rxd_d[0],unh_rxd_d[1],unh_rxd_d[2],unh_rxd_d[3],unh_rxd_d[4],unh_rxd_d[5],unh_rxd_d[6],unh_rxd_d[7],unh_rxd_d[8],unh_rxd_d[9]}  ;


     assign env_eser_rxd_a_del[9:0] = USE_UNH_VECTOR_del? unh_rxd_a_del : (speed_10G ? 
								   xgmii_env_eser_rxd_a_del[9:0] : env_eser_rxd_a_del1[9:0]);  
     assign env_eser_rxd_b_del[9:0] = USE_UNH_VECTOR_del? unh_rxd_b_del : (speed_10G ? 
								   xgmii_env_eser_rxd_b_del[9:0] : env_eser_rxd_b_del1[9:0]);  
     assign env_eser_rxd_c_del[9:0] = USE_UNH_VECTOR_del? unh_rxd_c_del : (speed_10G ? 
								   xgmii_env_eser_rxd_c_del[9:0] : env_eser_rxd_c_del1[9:0]);  
     assign env_eser_rxd_d_del[9:0] = USE_UNH_VECTOR_del? unh_rxd_d_del : (speed_10G ? 
								   xgmii_env_eser_rxd_d_del[9:0] : env_eser_rxd_d_del1[9:0]);  

   xaui_decode unh_rxda ( .data(unh_rxd_a), .clk(ref_clk),.decode(start_playing_vectors), .bit_reverse(1'b0));
   xaui_decode unh_rxdb ( .data(unh_rxd_b), .clk(ref_clk),.decode(start_playing_vectors), .bit_reverse(1'b0));
   xaui_decode unh_rxdc ( .data(unh_rxd_c), .clk(ref_clk),.decode(start_playing_vectors), .bit_reverse(1'b0));
   xaui_decode unh_rxdd ( .data(unh_rxd_d), .clk(ref_clk),.decode(start_playing_vectors), .bit_reverse(1'b0));
   unh_checks unh_checks(.ref_clk(core_clk));

   reg [9:0] serdesout_lane0,serdesout_lane1,serdesout_lane2,serdesout_lane3;
   reg [4:0] start_checking_serdesdata;
   reg [15:0] check_loc;
   reg [9:0] lane0_exp,lane1_exp,lane2_exp,lane3_exp;

   initial begin
	 start_checking_serdesdata =0;
	 check_loc =0;
	if($test$plusargs("CHECK_SERDES"))
	   check_serdes_output = 1;
	else
	  check_serdes_output =0;
 end

   always@(posedge ref_clk) begin
	   start_checking_serdesdata <= {start_checking_serdesdata[3:0],USE_UNH_VECTOR};
   end

   always@(posedge ref_clk) begin
	   if(start_checking_serdesdata[4] & check_serdes_output) begin
		   lane0_exp <= vectors[check_loc + 0];
		   lane1_exp <= vectors[check_loc + 1];
		   lane2_exp <= vectors[check_loc + 2];
		   lane3_exp <= vectors[check_loc + 3];
		   check_loc <= check_loc +4;
   
   		   serdesout_lane0 <= tb_top.cpu.mac.mac_core.esr_mac_rxd0_0[9:0];
   		   serdesout_lane1 <= tb_top.cpu.mac.mac_core.esr_mac_rxd1_0[9:0];
   		   serdesout_lane2 <= tb_top.cpu.mac.mac_core.esr_mac_rxd2_0[9:0];
   		   serdesout_lane3 <= tb_top.cpu.mac.mac_core.esr_mac_rxd3_0[9:0];

		   check_serdesout(lane0_exp,serdesout_lane0,2'h0,check_loc);
		   check_serdesout(lane1_exp,serdesout_lane1,2'h1,check_loc);
		   check_serdesout(lane2_exp,serdesout_lane2,2'h2,check_loc);
		   check_serdesout(lane3_exp,serdesout_lane3,2'h3,check_loc);

	   end
   end

`else // !ifdef TEST_UNH_VECTORS
	       
     assign env_eser_rxd_a_del[9:0] = speed_10G ? 
	xgmii_env_eser_rxd_a_del[9:0] : env_eser_rxd_a_del1[9:0];  
     assign env_eser_rxd_b_del[9:0] = speed_10G ? 
	xgmii_env_eser_rxd_b_del[9:0] : env_eser_rxd_b_del1[9:0];  
     assign env_eser_rxd_c_del[9:0] = speed_10G ? 
	xgmii_env_eser_rxd_c_del[9:0] : env_eser_rxd_c_del1[9:0];  
     assign env_eser_rxd_d_del[9:0] = speed_10G ? 
	xgmii_env_eser_rxd_d_del[9:0] : env_eser_rxd_d_del1[9:0];  
`endif
	
// Code for dumping Tx signals into file for easy debug

   reg dump_tx_debug,start_tx_dump;
   reg [31:0] tx_dump_start_time;
   reg [8*60:1] tx_dump_arg,tx_start_arg;
   
   reg [80*6:0] fp;

initial begin
   
   fp = $fopen("xaui_tx_debug.txt","w");
   start_tx_dump =0;

   tx_dump_arg = "TX_DEBUG_ENABLE";
   if ($test$plusargs("TX_DEBUG_ENABLE"))
     dump_tx_debug =  1;
   else dump_tx_debug = 0;
   tx_start_arg = "TX_DEBUG_START=";
     if ($test$plusargs("TX_DEBUG_START="))
     tx_dump_start_time =  $util_get_plus_args_num(tx_start_arg);
   else tx_dump_start_time = 10;

   if(dump_tx_debug) begin
      $display("%m:TX Debug Dump  start clock set to %d \n",tx_dump_start_time);
      repeat(tx_dump_start_time) @(posedge ref_clk);
      $display(" enabling Tx Debug Dumps at Time =%t",$time);
      start_tx_dump =1;
   end // if (dump_tx_debug)
   
   
end

  always@(posedge ref_clk) begin
	  if(start_tx_dump & dump_tx_debug )
   	    $fdisplay(fp,"%b %b %b %b",eser_env_txd_a[9:0],eser_env_txd_b[9:0],eser_env_txd_c[9:0],eser_env_txd_d[9:0]);
  end


   xaui_decode rxda ( .data(env_eser_rxd_a_del), .clk(ref_clk), .decode(1'b1), .bit_reverse(1'b1));
   xaui_decode rxdb ( .data(env_eser_rxd_b_del), .clk(ref_clk), .decode(1'b1), .bit_reverse(1'b1));
   xaui_decode rxdc ( .data(env_eser_rxd_c_del), .clk(ref_clk), .decode(1'b1), .bit_reverse(1'b1));
   xaui_decode rxdd ( .data(env_eser_rxd_d_del), .clk(ref_clk), .decode(1'b1), .bit_reverse(1'b1));


      `ifdef TEST_UNH_VECTORS

	      task check_serdesout;
		      input [9:0] lane_exp;
		      input [9:0] serdesout;
		      input [1:0] lane_num;
		      input [15:0] check_loc;
		      reg [9:0] serdes_out_tmp;
		      begin
			serdes_out_tmp = { serdesout[0],serdesout[1],serdesout[2],serdesout[3],serdesout[4],
					   serdesout[5],serdesout[6],serdesout[7],serdesout[8],serdesout[9] }; 

			if(serdes_out_tmp!== lane_exp) begin
				$display("Time =%t: ERROR Serdes Output Mismatch!! LaneNumber = %d, Expected = %h Received = %h VectorIndex = %d ",$time,lane_num,lane_exp,serdes_out_tmp,check_loc);
			end

		      end
	      endtask
      `endif

//-----------------------------------------------------------------------
//------------- PORT0 reg declarations and init -------------------------
// register declarations and initialization code of ti-serdes for port 0
//------------------------------------------------------------------------

reg [11:0]  reg_CFGPLL_p0;
reg [27:0]  reg_CFGRX0_p0;     // Receive configuration bus - channel 0
reg [27:0]  reg_CFGRX1_p0;     // Receive configuration bus - channel 1
reg [27:0]  reg_CFGRX2_p0;     // Receive configuration bus - channel 2
reg [27:0]  reg_CFGRX3_p0;     // Receive configuration bus - channel 3

reg [19:0]  reg_CFGTX0_p0;     // Transmit configuration bus - channel 0
reg [19:0]  reg_CFGTX1_p0;     // Transmit configuration bus - channel 1
reg [19:0]  reg_CFGTX2_p0;     // Transmit configuration bus - channel 2
reg [19:0]  reg_CFGTX3_p0;     // Transmit configuration bus - channel 3
reg [19:0]  reg_TESTCFG_p0;    // Test configuration bus.
reg         reg_FCLK_p0;       // eFuse clock
reg         reg_FCLRZ_p0;      // eFuse clear
reg         reg_FDI_p0;        // eFuse input data
reg [1:0]   reg_STCICFG_p0;    // STCI Mode.
reg         reg_STCICLK_p0;    // STCI clock.
reg         reg_STCID_p0;      // STCI input data
reg         reg_TESTCLKR_p0;   // Receive test clock
reg         reg_TESTCLKT_p0;   // Receive test clock
reg         reg_BSINITCLK_p0;


initial
if(speed_10G == 1)
    begin
	@(posedge ref_clk);

	reg_BSINITCLK_p0 = 1'b0;
		// configure PLL
	reg_CFGPLL_p0 = 0;
	reg_CFGPLL_p0[0] = 1'b1;
	reg_CFGPLL_p0[4:1] = 4'h1;
	reg_CFGPLL_p0[9:8] = 2'b11;
	reg_CFGPLL_p0[11:10] = 2'b10;

	// RX Configuration
	reg_CFGRX0_p0 = 0;
	reg_CFGRX1_p0 = reg_CFGRX0_p0;
	reg_CFGRX2_p0 = reg_CFGRX0_p0;
	reg_CFGRX3_p0 = reg_CFGRX0_p0;

	// TX Configuration
	reg_CFGTX0_p0 = 0;
	reg_CFGTX1_p0 = reg_CFGTX0_p0;
	reg_CFGTX2_p0 = reg_CFGTX0_p0;
	reg_CFGTX3_p0 = reg_CFGTX0_p0;

	// Test Configuration
	reg_TESTCFG_p0 = 0;

	// misc
	reg_FCLK_p0  = 0;
	reg_FCLRZ_p0 = 1; // active low
	reg_FDI_p0   = 0;
	reg_STCICFG_p0 = 0;
	reg_STCICLK_p0 = 0;
	reg_STCID_p0 = 0;
	reg_TESTCLKR_p0 = 0;
	reg_TESTCLKT_p0 = 0;

	@(posedge STSPLL_p0[0]);
	$display("PLL Lock for Port0 is %b", STSPLL_p0[0] );

	@(posedge REFCLKP);
	// TX Configuration
	reg_CFGTX0_p0[0] = 1;
	reg_CFGTX1_p0[0] = 1;
	reg_CFGTX2_p0[0] = 1;
	reg_CFGTX3_p0[0] = 1;

	// RX Configuration
	reg_CFGRX0_p0[0] = 1;
	reg_CFGRX0_p0[13:12] = 2'b01;
	reg_CFGRX0_p0[15:14] = 2'b01;

	reg_CFGRX1_p0 = reg_CFGRX0_p0;
	reg_CFGRX2_p0 = reg_CFGRX0_p0;
	reg_CFGRX3_p0 = reg_CFGRX0_p0;
end
else
    begin
      @(posedge ref_clk);

	reg_BSINITCLK_p0 = 1'b0;
	// configure PLL
	reg_CFGPLL_p0 = 0;
	reg_CFGPLL_p0[0] = 1'b1;
	reg_CFGPLL_p0[4:1] = 4'h5;
	reg_CFGPLL_p0[9:8] = 2'b00;
	reg_CFGPLL_p0[11:10] = 2'b00;

	// RX Configuration
	reg_CFGRX0_p0 = 0;
	reg_CFGRX1_p0 = reg_CFGRX0_p0;
	reg_CFGRX2_p0 = reg_CFGRX0_p0;
	reg_CFGRX3_p0 = reg_CFGRX0_p0;

	// TX Configuration
	reg_CFGTX0_p0 = 0;
	reg_CFGTX1_p0 = reg_CFGTX0_p0;
	reg_CFGTX2_p0 = reg_CFGTX0_p0;
	reg_CFGTX3_p0 = reg_CFGTX0_p0;

	// Test Configuration
	reg_TESTCFG_p0 = 0;

	// misc
	reg_FCLK_p0  = 0;
	reg_FCLRZ_p0 = 1; // active low
	reg_FDI_p0   = 0;
	reg_STCICFG_p0 = 0;
	reg_STCICLK_p0 = 0;
	reg_STCID_p0 = 0;
	reg_TESTCLKR_p0 = 0;
	reg_TESTCLKT_p0 = 0;

	@(posedge STSPLL_p0[0]);
	$display("PLL Lock for Port0 is %b", STSPLL_p0[0] );

	@(posedge REFCLKP);
	// TX Configuration
	reg_CFGTX0_p0[0] = 1;
	reg_CFGTX0_p0[6:5] = 2'b01;
	reg_CFGTX1_p0[0] = 0;
	reg_CFGTX2_p0[0] = 0;
	reg_CFGTX3_p0[0] = 0;

	// RX Configuration
	reg_CFGRX0_p0[0] = 1;
	reg_CFGRX0_p0[6:5] = 2'b01;
	reg_CFGRX0_p0[13:12] = 2'b01;
	reg_CFGRX0_p0[15:14] = 2'b01;

end

assign TXBCLKIN_p0 = {4{REFCLKP}};
assign RXBCLKIN_p0 = RXBCLK_p0;

assign CFGPLL_p0 = reg_CFGPLL_p0;
assign CFGRX0_p0 = reg_CFGRX0_p0;
assign CFGRX1_p0 = reg_CFGRX1_p0;
assign CFGRX2_p0 = reg_CFGRX2_p0;
assign CFGRX3_p0 = reg_CFGRX3_p0;

assign CFGTX0_p0 = reg_CFGTX0_p0;
assign CFGTX1_p0 = reg_CFGTX1_p0;
assign CFGTX2_p0 = reg_CFGTX2_p0;
assign CFGTX3_p0 = reg_CFGTX3_p0;
assign TESTCFG_p0 = reg_TESTCFG_p0;
assign FCLK_p0 = reg_FCLK_p0;
assign FCLRZ_p0 = reg_FCLRZ_p0;      // eFuse clear
assign FDI_p0 = reg_FDI_p0;        // eFuse input data
assign STCICFG_p0 = reg_STCICFG_p0;    // STCI Mode.
assign STCICLK_p0 = reg_STCICLK_p0;    // STCI clock.
assign STCID_p0 = reg_STCID_p0;      // STCI input data
assign TESTCFG_p0 = reg_TESTCFG_p0;    // Test configuration bus.
assign TESTCLKR_p0 = reg_TESTCLKR_p0;   // Receive test clock
assign TESTCLKT_p0 = reg_TESTCLKT_p0;   // Tx test clock
assign BSINITCLK_p0 = reg_BSINITCLK_p0;

//-----------------------------------------------------------------------
//------------- PORT1 reg declarations and init -------------------------
// register declarations and initialization code of ti-serdes for port 1
//------------------------------------------------------------------------

reg [11:0]  reg_CFGPLL_p1;
reg [27:0]  reg_CFGRX0_p1;     // Receive configuration bus - channel 0
reg [27:0]  reg_CFGRX1_p1;     // Receive configuration bus - channel 1
reg [27:0]  reg_CFGRX2_p1;     // Receive configuration bus - channel 2
reg [27:0]  reg_CFGRX3_p1;     // Receive configuration bus - channel 3

reg [19:0]  reg_CFGTX0_p1;     // Transmit configuration bus - channel 0
reg [19:0]  reg_CFGTX1_p1;     // Transmit configuration bus - channel 1
reg [19:0]  reg_CFGTX2_p1;     // Transmit configuration bus - channel 2
reg [19:0]  reg_CFGTX3_p1;     // Transmit configuration bus - channel 3
reg [19:0]  reg_TESTCFG_p1;    // Test configuration bus.
reg         reg_FCLK_p1;       // eFuse clock
reg         reg_FCLRZ_p1;      // eFuse clear
reg         reg_FDI_p1;        // eFuse input data
reg [1:0]   reg_STCICFG_p1;    // STCI Mode.
reg         reg_STCICLK_p1;    // STCI clock.
reg         reg_STCID_p1;      // STCI input data
reg         reg_TESTCLKR_p1;   // Receive test clock
reg         reg_TESTCLKT_p1;   // Receive test clock
reg         reg_BSINITCLK_p1;

//----------------------------------------------------------
//------ declarations for BW Cal -----------------------
//----------------------------------------------------------

// integer data_byte_cnt;
// integer ipg_byte_cnt;
// real BW;
// real avg_ipg_byte_cnt;
// time bw_start_time;
// time bw_end_time;
// integer pkt_cnt;

// reg [1:0] bw_state;
// reg [1:0] nxt_state;
// reg [1:0] bw_state1;
// reg [1:0] nxt_state1;


initial
if (speed_10G == 1)
    begin
     @(posedge ref_clk);

      reg_BSINITCLK_p1 = 1'b0;
        // configure PLL
      reg_CFGPLL_p1 = 0;
      reg_CFGPLL_p1[0] = 1'b1;
      reg_CFGPLL_p1[4:1] = 4'h1;
      reg_CFGPLL_p1[9:8] = 2'b11;
      reg_CFGPLL_p1[11:10] = 2'b10;

      // RX Configuration
      reg_CFGRX0_p1 = 0;
      reg_CFGRX1_p1 = reg_CFGRX0_p1;
      reg_CFGRX2_p1 = reg_CFGRX0_p1;
      reg_CFGRX3_p1 = reg_CFGRX0_p1;

      // TX Configuration
      reg_CFGTX0_p1 = 0;
      reg_CFGTX1_p1 = reg_CFGTX0_p1;
      reg_CFGTX2_p1 = reg_CFGTX0_p1;
      reg_CFGTX3_p1 = reg_CFGTX0_p1;

      // Test Configuration
      reg_TESTCFG_p1 = 0;

      // misc
      reg_FCLK_p1  = 0;
      reg_FCLRZ_p1 = 1; // active low
      reg_FDI_p1   = 0;
      reg_STCICFG_p1 = 0;
      reg_STCICLK_p1 = 0;
      reg_STCID_p1 = 0;
      reg_TESTCLKR_p1 = 0;
      reg_TESTCLKT_p1 = 0;

      @(posedge STSPLL_p1[0]);
      $display("PLL Lock for Port1 is %b", STSPLL_p1[0] );

      @(posedge REFCLKP);
      // TX Configuration
      reg_CFGTX0_p1[0] = 1;
      reg_CFGTX1_p1[0] = 1;
      reg_CFGTX2_p1[0] = 1;
      reg_CFGTX3_p1[0] = 1;

      // RX Configuration
      reg_CFGRX0_p1[0] = 1;
      reg_CFGRX0_p1[13:12] = 2'b01;
      reg_CFGRX0_p1[15:14] = 2'b01;

      reg_CFGRX1_p1 = reg_CFGRX0_p1;
      reg_CFGRX2_p1 = reg_CFGRX0_p1;
      reg_CFGRX3_p1 = reg_CFGRX0_p1;
 end
else
    begin
      @(posedge ref_clk);

	reg_BSINITCLK_p1 = 1'b0;
	// configure PLL
	reg_CFGPLL_p1 = 0;
	reg_CFGPLL_p1[0] = 1'b1;
	reg_CFGPLL_p1[4:1] = 4'h5;
	reg_CFGPLL_p1[9:8] = 2'b00;
	reg_CFGPLL_p1[11:10] = 2'b00;

	// RX Configuration
	reg_CFGRX0_p1 = 0;
	reg_CFGRX1_p1 = reg_CFGRX0_p1;
	reg_CFGRX2_p1 = reg_CFGRX0_p1;
	reg_CFGRX3_p1 = reg_CFGRX0_p1;

	// TX Configuration
	reg_CFGTX0_p1 = 0;
	reg_CFGTX1_p1 = reg_CFGTX0_p1;
	reg_CFGTX2_p1 = reg_CFGTX0_p1;
	reg_CFGTX3_p1 = reg_CFGTX0_p1;

	// Test Configuration
	reg_TESTCFG_p1 = 0;

	// misc
	reg_FCLK_p1  = 0;
	reg_FCLRZ_p1 = 1; // active low
	reg_FDI_p1   = 0;
	reg_STCICFG_p1 = 0;
	reg_STCICLK_p1 = 0;
	reg_STCID_p1 = 0;
	reg_TESTCLKR_p1 = 0;
	reg_TESTCLKT_p1 = 0;

	@(posedge STSPLL_p1[0]);
	$display("PLL Lock for Port1 is %b", STSPLL_p1[0] );

	@(posedge REFCLKP);
	// TX Configuration
	reg_CFGTX0_p1[0] = 1;
	reg_CFGTX0_p1[6:5] = 2'b01;
	reg_CFGTX1_p1[0] = 0;
	reg_CFGTX2_p1[0] = 0;
	reg_CFGTX3_p1[0] = 0;

	// RX Configuration
	//reg_CFGRX0_p1[0] = 0;
	//reg_CFGRX0_p1[13:12] = 2'b01;
	//reg_CFGRX0_p1[15:14] = 2'b01;

	// reg_CFGRX1_p1 = reg_CFGRX0_p1;
	reg_CFGRX0_p1[0] = 1;
	reg_CFGRX0_p1[6:5] = 2'b01;
	reg_CFGRX0_p1[13:12] = 2'b01;
	reg_CFGRX0_p1[15:14] = 2'b01;

	//reg_CFGRX2_p1 = reg_CFGRX0_p1;
	//reg_CFGRX3_p1 = reg_CFGRX0_p1;

 end

assign TXBCLKIN_p1 = {4{REFCLKP}};
assign RXBCLKIN_p1 = RXBCLK_p1;

assign CFGPLL_p1 = reg_CFGPLL_p1;
assign CFGRX0_p1 = reg_CFGRX0_p1;
assign CFGRX1_p1 = reg_CFGRX1_p1;
assign CFGRX2_p1 = reg_CFGRX2_p1;
assign CFGRX3_p1 = reg_CFGRX3_p1;

assign CFGTX0_p1 = reg_CFGTX0_p1;
assign CFGTX1_p1 = reg_CFGTX1_p1;
assign CFGTX2_p1 = reg_CFGTX2_p1;
assign CFGTX3_p1 = reg_CFGTX3_p1;
assign TESTCFG_p1 = reg_TESTCFG_p1;
assign FCLK_p1 = reg_FCLK_p1;
assign FCLRZ_p1 = reg_FCLRZ_p1;      // eFuse clear
assign FDI_p1 = reg_FDI_p1;        // eFuse input data
assign STCICFG_p1 = reg_STCICFG_p1;    // STCI Mode.
assign STCICLK_p1 = reg_STCICLK_p1;    // STCI clock.
assign STCID_p1 = reg_STCID_p1;      // STCI input data
assign TESTCFG_p1 = reg_TESTCFG_p1;    // Test configuration bus.
assign TESTCLKR_p1 = reg_TESTCLKR_p1;   // Receive test clock
assign TESTCLKT_p1 = reg_TESTCLKT_p1;   // Tx test clock
assign BSINITCLK_p1 = reg_BSINITCLK_p1;

endmodule
