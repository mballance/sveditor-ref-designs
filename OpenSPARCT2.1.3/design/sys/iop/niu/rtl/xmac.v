// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xmac.v
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
/*%W%	%G%*/
 
/***************************************************************
 *
 * File Name    : xmac
 * Author Name  : John Lo
 * Description  : xmac main logic except xmac_clk_mux.
 * Parent Module: xmac
 * Child  Module: many
 * Interface Mod: many.
 * Date Created : 5/9/00
 *
 * Copyright (c) 2008, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Features:
 * ================
 * 1. This is a pre-802.3ae standard design. 
 * 2. The RxMac can handle min IPG == 4 byte time.
 * 3. Supports both 32 bit xgmii interface and 
 *    64 bit xpcs interface.
 * 4. xmac 64bit xpcs interface can swap the S_I, S_D, I_S, and
 *    D_S to correct value. 
 * 5. xmac is designed such that the slowest DMA interface
 *    clock frequency can be the same as xgmii interface clock
 *    frequency.
 * 6. rx_xmac logs the pre-amble data which can be used for
 *    inter-mac communication channel.
 *  
 * 
 * Configuration:
 * ================
 * Use two ifdef variable to config the xmac.
 * (check with xmac.h for detail)
 * 1. XGMII_ONLY (10G only xmac)
 * 2. ALT_ADDR_AND_HASH_FUNC
 * 
 * Synthesis Notes:
 * ================
 * 1. tx_mii_gmii.v: 1st stage reg: change clock domain
 * 2. rx_mii_gmii.v: 2nd stage reg: change clock domain 
 * 3. txmac to rxmac loopback path.
 * 4. Special attenetion to PCS clock doubler timing.
 * 5. (removed 01/10/02)
 * 6. Each mac_clk_mux should be layed out in a small
 *    compact area and should be next to the corresponding
 *    mac port. 
 * 7. timing critical path
 * 
 * Minmimum setup requirements:
 * ============================
 * 1. xMac requires two hardware resets with the duration
 *    of 400ns high and 400ns low.  The first hw_reset is 
 *    to reset the entire xmac and the second one to reset
 *    tx_heart_beat_timer and rx_heart_beat_timer.
 *                           
 *                |- 400ns -|- 400ns -|- 400ns -|- 400ns -|- 400ns
 *  pio_core_reset           _________           _________
 *       (hw_reset)_________|         |_________|         |_______
 * 
 * 2. Program mac config register.
 * 3. Program xif config register to enable tx_output_en. 
 * 
 * Modification :
 * ==============
 * 
 ***************************************************************/

`include  "xmac.h"

module xmac (
/* ------------- xmac clocks --------------------------------- */
                   clk,
                   tx_clk,
                   tx_nbclk,
                   rx_clk,
                   rx_nbclk,
		   sys_clk_count,
                   tx_heart_beat_timer,
                   rx_heart_beat_timer,
/* -------------  shared MII/GMII Interface ------------------ */
                   gmii_rxd,
                   gmii_rx_dv,
                   gmii_rx_err,
                   gmii_txd,
                   gmii_tx_en,
                   gmii_tx_err,
/* ------------- XGMII Interface ----------------------------- */
                   xgmii_rxc,
                   xgmii_rxd,
                   xgmii_txc,
                   xgmii_txd,
/* ------------- XPCS Interface ------------------------------ */
                   xpcs_rxd, // internal 64 bit receive signals// data going onto xGMII
                   xpcs_rxc, // receive data valid, GMII interface
                   xpcs_txd, // internal 64 bit transmit signals // byte from MAC over GMII
                   xpcs_txc, // GMII transmit enable from Mac
/* ------------- pio Interface ------------------------------- */
         	   pio_core_reset,  // becomes hw_reset
         	   pio_core_sel,    // sel mac
		   pio_ack,
                   pio_rd,          // r/w
                   pio_addr,        // address
                   pio_wr_data,     // wr_data
                   pio_rd_data,     // rd_data
	           pio_err,
          	   txmac_interrupt,
          	   rxmac_interrupt,
          	   xmac_fc_interrupt,
/* ------------- Tx DMA Interface ---------------------------- */
                   txmac_opp_req,
                   opp_txmac_ack,
                   opp_txmac_tag,
                   opp_txmac_data,
                   opp_txmac_stat,
		   opp_txmac_abort,
/* ------------- Rx DMA Interface ---------------------------- */
                   ipp_rxmac_req,
                   rxmac_ipp_ack,
                   rxmac_ipp_tag,
                   rxmac_ipp_data,
                   rxmac_ipp_ctrl,
                   rxmac_ipp_stat, 
/* ------------- xmac_xpcs_clk_mux control signals ----------- */
                   sel_clk_25mhz,
                   loopback,
                   sel_por_clk_src,
                   mii_mode,
                   gmii_mode,
		   xgmii_mode,
		   pcs_bypass,
		   xpcs_bypass,
/* ------------- led signals --------------------------------- */
	           force_LED_on,
	           led_polarity,
	           activity_led,
/* ------------- PMD signals --------------------------------- */
	           MDINT,
/* ------------- debug Interface ----------------------------- */
	           xmac_debug,
                   mac_debug_sel
		   );

/* ------------- xmac clocks --------------------------------- */
   input           clk;
   input 	   tx_clk;
   input 	   tx_nbclk;
   input 	   rx_clk;
   input 	   rx_nbclk;
   output [2:0]	   sys_clk_count;
   output [3:0]    tx_heart_beat_timer;
   output [3:0]    rx_heart_beat_timer;
/* -------------  shared MII/GMII Interface ------------------ */
   input           gmii_rx_dv;
   input  [`BYTE]  gmii_rxd;
   input           gmii_rx_err;
   output          gmii_tx_en;
   output [`BYTE]  gmii_txd;
   output          gmii_tx_err;
/* ------------- XGMII Interface ----------------------------- */
   input  [3:0]    xgmii_rxc;
   input  [31:0]   xgmii_rxd;
   output [3:0]    xgmii_txc;
   output [31:0]   xgmii_txd;
/* ------------- XPCS Interface ------------------------------ */
   input  [7:0]    xpcs_rxc;
   input  [63:0]   xpcs_rxd;
   output [7:0]    xpcs_txc;
   output [63:0]   xpcs_txd;
/* ------------- pio Interface ------------------------------- */
   input           pio_core_reset;  // becomes hw_reset
   input           pio_core_sel;    // sel
   output 	   pio_ack;
   input           pio_rd;          // r/w
   input  [8:0]    pio_addr;        // address
   input  [31:0]   pio_wr_data;     // wr_data
   output [31:0]   pio_rd_data;     // rd_data
   output 	   pio_err;
   output  	   txmac_interrupt;
   output  	   rxmac_interrupt;
   output  	   xmac_fc_interrupt;
/* ------------- Tx DMA Interface ---------------------------- */
   output 	   txmac_opp_req;
   input           opp_txmac_ack;
   input           opp_txmac_tag;
   input  [63:0]   opp_txmac_data;
   input  [3:0]    opp_txmac_stat;
   input 	   opp_txmac_abort;
/* ------------- Rx DMA Interface ---------------------------- */
   input 	   ipp_rxmac_req;
   output	   rxmac_ipp_ack;
   output 	   rxmac_ipp_tag;
   output [63:0]   rxmac_ipp_data;  // {64bit data}
   output 	   rxmac_ipp_ctrl;
   output [`TBITS] rxmac_ipp_stat;  // {23bit data}
/* ------------- xmac_clk_mux control signals ---------------- */
   output 	   sel_clk_25mhz;  
   output 	   loopback;
   output 	   sel_por_clk_src;
   output 	   mii_mode;
   output 	   gmii_mode;
   output 	   xgmii_mode;
   output 	   pcs_bypass;
   output 	   xpcs_bypass;
/* ------------- led signals --------------------------------- */
   output 	   force_LED_on;
   output 	   led_polarity;
   output          activity_led;
/* ------------- PMD signals --------------------------------- */
   input 	   MDINT;
/* ------------- debug Interface ----------------------------- */
   output [31:0]   xmac_debug;
   output [2:0]    mac_debug_sel;
      
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			B_eop_reg;		// From tx_xmac of tx_xmac.v
wire			D_S_reg;		// From rx_xmac of rx_xmac.v
wire			END_PKT_ERR_detected_a_at_modified_pkt_reg;// From rx_xmac of rx_xmac.v
wire			END_PKT_ERR_detected_b_at_modified_pkt_reg;// From rx_xmac of rx_xmac.v
wire			I_S_reg;		// From rx_xmac of rx_xmac.v
wire			S_D_reg;		// From rx_xmac of rx_xmac.v
wire			S_I_reg;		// From rx_xmac of rx_xmac.v
wire			S_detected_reg;		// From rx_xmac of rx_xmac.v
wire			T_E_detected_at_modified_pkt_reg;// From rx_xmac of rx_xmac.v
wire			abort_bit_reg;		// From rx_xmac of rx_xmac.v
wire			adjust2crc_full_case_last_byte_position_is_3_or_7_reg;// From tx_xmac of tx_xmac.v
wire [2:0]		adjust2crc_full_case_last_byte_position_reg;// From tx_xmac of tx_xmac.v
wire [15:0]		alt_addr_comp_en;	// From xmac_slv of xmac_slv.v
wire			always_no_crc;		// From xmac_slv of xmac_slv.v
wire			back2back_reg;		// From tx_xmac of tx_xmac.v
wire			back2back_swap_reg1;	// From tx_xmac of tx_xmac.v
wire			clr_rx_reset_clk;	// From xmac_sync of xmac_sync.v
wire			clr_tx_reset_clk;	// From xmac_sync of xmac_sync.v
wire			code_viol_chk_dis;	// From xmac_slv of xmac_slv.v
wire			crc_chk_dis;		// From xmac_slv of xmac_slv.v
wire			crc_error_reg;		// From rx_xmac of rx_xmac.v
wire			eop_txclk_reg0;		// From tx_xmac of tx_xmac.v
wire			eop_w_fcs_reg0;		// From tx_xmac of tx_xmac.v
wire			eop_w_fcs_reg1;		// From tx_xmac of tx_xmac.v
wire			err_chk_dis;		// From xmac_slv of xmac_slv.v
wire			force_ipg_done_lead_reg;// From tx_xmac of tx_xmac.v
wire [2:0]		full_case_last_byte_position_reg;// From tx_xmac of tx_xmac.v
wire			hw_reset;		// From xmac_slv of xmac_slv.v
wire			hw_reset_rxnbclk;	// From xmac_sync of xmac_sync.v
wire			hw_reset_txnbclk;	// From xmac_sync of xmac_sync.v
wire			inc_align_err_count_sync;// From xmac_sync of xmac_sync.v
wire			inc_bcast_count;	// From rx_xmac of rx_xmac.v
wire			inc_bcast_count_sync;	// From xmac_sync of xmac_sync.v
wire			inc_code_viol_count;	// From rx_xmac of rx_xmac.v
wire			inc_code_viol_count_sync;// From xmac_sync of xmac_sync.v
wire			inc_crc_err_count;	// From rx_xmac of rx_xmac.v
wire			inc_crc_err_count_sync;	// From xmac_sync of xmac_sync.v
wire			inc_histo_cntr1;	// From rxfifo_unload of rxfifo_unload.v
wire			inc_histo_cntr2;	// From rxfifo_unload of rxfifo_unload.v
wire			inc_histo_cntr3;	// From rxfifo_unload of rxfifo_unload.v
wire			inc_histo_cntr4;	// From rxfifo_unload of rxfifo_unload.v
wire			inc_histo_cntr5;	// From rxfifo_unload of rxfifo_unload.v
wire			inc_histo_cntr6;	// From rxfifo_unload of rxfifo_unload.v
wire			inc_histo_cntr7;	// From rxfifo_unload of rxfifo_unload.v
wire			inc_link_fault_count;	// From rx_xmac of rx_xmac.v
wire			inc_link_fault_count_sync;// From xmac_sync of xmac_sync.v
wire			inc_max_pkt_err_count;	// From rx_xmac of rx_xmac.v
wire			inc_max_pkt_err_count_sync;// From xmac_sync of xmac_sync.v
wire			inc_mcast_count;	// From rx_xmac of rx_xmac.v
wire			inc_mcast_count_sync;	// From xmac_sync of xmac_sync.v
wire			inc_min_pkt_err_count;	// From rx_xmac of rx_xmac.v
wire			inc_min_pkt_err_count_sync;// From xmac_sync of xmac_sync.v
wire			ipg_done_lead_temp_reg;	// From tx_xmac of tx_xmac.v
wire			ipg_done_reg;		// From tx_xmac of tx_xmac.v
wire			ipg_done_trail_temp_reg;// From tx_xmac of tx_xmac.v
wire [2:0]		ipg_value;		// From xmac_slv of xmac_slv.v
wire [`BYTE]		ipg_value1;		// From xmac_slv of xmac_slv.v
wire			kill_crc_reg;		// From rx_xmac of rx_xmac.v
wire			kill_data_ready_reg;	// From rx_xmac of rx_xmac.v
wire			lfs_disable;		// From xmac_slv of xmac_slv.v
wire			lfs_disable_rxclk;	// From xmac_sync of xmac_sync.v
wire			local_fault_oc_reg;	// From rx_xmac of rx_xmac.v
wire			local_fault_oc_sync;	// From xmac_sync of xmac_sync.v
wire			local_fault_oc_txclk;	// From xmac_sync of xmac_sync.v
wire			mii_or_gmii_mode;	// From xmac_slv of xmac_slv.v
wire			minus_4bytes_reg;	// From tx_xmac of tx_xmac.v
wire			no_crc;			// From txfifo_load of txfifo_load.v
wire			no_rx_min_pkt_size_chk;	// From xmac_slv of xmac_slv.v
wire			no_tx_min_pkt_size_chk;	// From xmac_slv of xmac_slv.v
wire			no_wasted_BW_reg;	// From tx_xmac of tx_xmac.v
wire			pass_fc;		// From xmac_slv of xmac_slv.v
wire			paused_state;		// From tx_xmac of tx_xmac.v
wire			paused_state_sync;	// From xmac_sync of xmac_sync.v
wire			promisc_all;		// From xmac_slv of xmac_slv.v
wire			promisc_group;		// From xmac_slv of xmac_slv.v
wire			remote_fault_oc_reg;	// From rx_xmac of rx_xmac.v
wire			remote_fault_oc_sync;	// From xmac_sync of xmac_sync.v
wire			remote_fault_oc_txclk;	// From xmac_sync of xmac_sync.v
wire			replace_txd_time_reg;	// From tx_xmac of tx_xmac.v
wire			reserve_multicast;	// From xmac_slv of xmac_slv.v
wire			restart_ipg_timer_reg;	// From tx_xmac of tx_xmac.v
wire			rx_data_valid_gmux_reg;	// From rx_xmac of rx_xmac.v
wire			rx_data_valid_gmux_reg_clk;// From xmac_sync of xmac_sync.v
wire			rx_enable;		// From xmac_slv of xmac_slv.v
wire			rx_enable_nbclk;	// From xmac_sync of xmac_sync.v
wire			rx_enable_rxclk;	// From xmac_sync of xmac_sync.v
wire			rx_err_reg;		// From rx_xmac of rx_xmac.v
wire			rx_fc_pkt_ok;		// From rx_xmac of rx_xmac.v
wire			rx_fc_pkt_ok_clk;	// From xmac_sync of xmac_sync.v
wire			rx_fc_pkt_ok_txclk;	// From xmac_sync of xmac_sync.v
wire			rx_good_pkt;		// From rx_xmac of rx_xmac.v
wire			rx_good_pkt_sync;	// From xmac_sync of xmac_sync.v
wire			rx_pause_en;		// From xmac_slv of xmac_slv.v
wire			rx_reset;		// From xmac_sync of xmac_sync.v
wire			rx_reset_clk;		// From xmac_slv of xmac_slv.v
wire			rx_reset_nbclk;		// From xmac_sync of xmac_sync.v
wire [1:0]		rx_sel_reg;		// From rx_xmac of rx_xmac.v
wire			rxfifo_empty_clk_reg;	// From rxfifo_unload of rxfifo_unload.v
wire			rxfifo_full_clk_reg;	// From rxfifo_unload of rxfifo_unload.v
wire			rxfifo_full_nbclk;	// From xmac_sync of xmac_sync.v
wire			rxfifo_full_rxclk_reg;	// From rx_xmac of rx_xmac.v
wire			rxfifo_overrun_rxclk;	// From rx_xmac of rx_xmac.v
wire			rxfifo_overrun_sync;	// From xmac_sync of xmac_sync.v
wire [4:0]		rxfifo_rd_ptr_clk;	// From rxfifo_unload of rxfifo_unload.v
wire			rxfifo_underrun_clk;	// From rxfifo_unload of rxfifo_unload.v
wire [4:0]		rxfifo_wr_ptr_clk;	// From rxfifo_unload of rxfifo_unload.v
wire			set_back2back_reg;	// From tx_xmac of tx_xmac.v
wire			set_tx_pkt_ok;		// From tx_xmac of tx_xmac.v
wire			set_tx_pkt_ok_sync;	// From xmac_sync of xmac_sync.v
wire			stretch_1_more_clk_reg;	// From tx_xmac of tx_xmac.v
wire [2:0]		stretch_bytes_reg;	// From tx_xmac of tx_xmac.v
wire [`BYTE]		stretch_clks_reg;	// From tx_xmac of tx_xmac.v
wire [3:0]		stretch_full_case_last_byte_position_reg;// From tx_xmac of tx_xmac.v
wire			stretch_mode;		// From xmac_slv of xmac_slv.v
wire			toggle_rx_bcount;	// From rx_xmac of rx_xmac.v
wire			toggle_rx_bcount_sync;	// From xmac_sync of xmac_sync.v
wire			toggle_tx_bcount;	// From tx_xmac of tx_xmac.v
wire			toggle_tx_bcount_sync;	// From xmac_sync of xmac_sync.v
wire			toggle_txframe_count;	// From tx_xmac of tx_xmac.v
wire			toggle_txframe_count_sync;// From xmac_sync of xmac_sync.v
wire			tx_abort_reg0;		// From tx_xmac of tx_xmac.v
wire			tx_abort_reg1;		// From tx_xmac of tx_xmac.v
wire [7:0]		tx_byte0_reg0;		// From tx_xmac of tx_xmac.v
wire			tx_data_valid;		// From tx_xmac of tx_xmac.v
wire			tx_data_valid_clk;	// From xmac_sync of xmac_sync.v
wire			tx_enable;		// From xmac_slv of xmac_slv.v
wire			tx_enable_txclk;	// From xmac_sync of xmac_sync.v
wire			tx_err_image;		// From tx_xmac of tx_xmac.v
wire			tx_max_pkt_size_err;	// From tx_xmac of tx_xmac.v
wire			tx_max_pkt_size_err_sync;// From xmac_sync of xmac_sync.v
wire			tx_on_half_reg;		// From tx_xmac of tx_xmac.v
wire			tx_on_reg;		// From tx_xmac of tx_xmac.v
wire			tx_output_en;		// From xmac_slv of xmac_slv.v
wire			tx_output_en_nbclk;	// From xmac_sync of xmac_sync.v
wire			tx_output_en_txclk;	// From xmac_sync of xmac_sync.v
wire			tx_reset;		// From xmac_sync of xmac_sync.v
wire			tx_reset_clk;		// From xmac_slv of xmac_slv.v
wire			tx_reset_nbclk;		// From xmac_sync of xmac_sync.v
wire			tx_swap_reg;		// From tx_xmac of tx_xmac.v
wire			txfifo_empty_clk_reg;	// From txfifo_load of txfifo_load.v
wire			txfifo_full_clk_reg;	// From txfifo_load of txfifo_load.v
wire			txfifo_overrun_clk;	// From txfifo_load of txfifo_load.v
wire [4:0]		txfifo_rd_ptr_clk;	// From txfifo_load of txfifo_load.v
wire			txfifo_underrun_sync;	// From xmac_sync of xmac_sync.v
wire			txfifo_underrun_txclk;	// From tx_xmac of tx_xmac.v
wire [4:0]		txfifo_wr_ptr_clk;	// From txfifo_load of txfifo_load.v
wire			txfifo_xfr_err;		// From tx_xmac of tx_xmac.v
wire			txfifo_xfr_err_sync;	// From xmac_sync of xmac_sync.v
wire			var_min_ipg_en;		// From xmac_slv of xmac_slv.v
wire			warning_msg_en;		// From xmac_slv of xmac_slv.v
wire			xrlm_state;		// From rx_xmac of rx_xmac.v
// End of automatics
   
// rxfifo_unload output wires
   wire   [65:0]    rxfifo_dout; // {mac_ctrl_word,tag,64bit data}
   wire   [15:0]    pause_time;  // signal crossing different clock domain.
// xmac_slv output wires
   wire   [4:0]     stretch_ratio;
   wire   [2:0]     stretch_constant;
   wire   [`BYTE]   slot_time;
   wire   [9:0]     tx_min_pkt_size;
   wire   [9:0]     rx_min_pkt_size;
   wire   [13:0]    max_pkt_size;
   wire   [47:0]    mac_unique_addr;
// xmac_sync output wires
   // rxfifo stuff
   wire   [4:0]     rxfifo_g_rd_ptr_clk; 
   wire   [4:0]     rxfifo_g_rd_ptr_sync; // to   rx_clk domain
   wire   [4:0]     rxfifo_g_wr_ptr_rxclk;
   wire   [4:0]     rxfifo_g_wr_ptr_sync; // to      clk domain
   // srfifo stuff
   wire   [4:0]     srfifo_rd_ptr_clk;   
   wire   [4:0]     srfifo_g_wr_ptr_rxclk;   
   wire   [4:0]     srfifo_g_wr_ptr_sync;   
   // txfifo stuff
   wire   [4:0]     txfifo_g_rd_ptr_txclk;// from tx_clk domain
   wire   [4:0]     txfifo_g_wr_ptr_clk;  // from    clk domain
   wire   [4:0]     txfifo_g_rd_ptr_sync; // to   tx_clk domain
   wire   [4:0]     txfifo_g_wr_ptr_sync; // to      clk domain
   // stfifo stuff
   wire   [4:0]     stfifo_g_rd_ptr_txclk;// from tx_clk domain
   wire   [4:0]     stfifo_g_wr_ptr_clk;  // from    clk domain
   wire   [4:0]     stfifo_g_rd_ptr_sync; // to      clk domain
   wire   [4:0]     stfifo_g_wr_ptr_sync; // to   tx_clk domain

// xpcs 
   wire [7:0] 	    xpcs_rxc;
   wire [63:0] 	    xpcs_rxd;
   wire [7:0] 	    xpcs_txc;
   wire [63:0] 	    xpcs_txd;
// tx_xmac output wires   
   wire [7:0] 	    txc_image;     // loopback path
   wire [63:0] 	    txd_image;     // loopback path

// internal signals
   wire [63:0] 	    rx_pa_data;
   wire [1:0] 	    lfs_state;
   wire             sop_state;
   wire [2:0] 	    xtlm_state;
   wire [2:0] 	    last_byte_position;
   wire [65:0] 	    txfifo_dout;
   wire [63:0] 	    hold_rxd;
   wire [7:0] 	    hold_rx_dv;
   wire 	    hold_rx_err;
   wire [`BYTE]     mgmii_txd;
   wire             mgmii_tx_en;
   wire             mgmii_tx_err;
   wire [31:0] 	    pio_rd_data;
   wire [3:0] 	    rx_heart_beat_timer;
   wire [3:0] 	    tx_heart_beat_timer;
   wire [3:0] 	    rx_heart_beat_timer_reg;
   wire [3:0] 	    tx_heart_beat_timer_reg;
   wire 	    mgrlm_state;
   wire 	    inc_align_err_count_nbclk;
   // clock observation point signals
   wire  	    tx_clk_div2;
   wire  	    rx_clk_div2;
   wire  	    tx_nbclk_div2;
   wire  	    rx_nbclk_div2;

   // start of ALT_ADDR_AND_HASH_FUNC specific signals
   wire 	    strip_crc;
   wire   	    addr_filter_en;
   wire   	    hash_filter_en;
   wire [47:0] 	    mac_alt_addr0;
   wire [47:0] 	    mac_alt_addr1;
   wire [47:0] 	    mac_alt_addr2;
   wire [47:0] 	    mac_alt_addr3;
   wire [47:0] 	    mac_alt_addr4;
   wire [47:0] 	    mac_alt_addr5;
   wire [47:0] 	    mac_alt_addr6;
   wire [47:0] 	    mac_alt_addr7;
   wire [47:0] 	    mac_alt_addr8;
   wire [47:0] 	    mac_alt_addr9;
   wire [47:0] 	    mac_alt_addr10;
   wire [47:0] 	    mac_alt_addr11;
   wire [47:0] 	    mac_alt_addr12;
   wire [47:0] 	    mac_alt_addr13;
   wire [47:0] 	    mac_alt_addr14;
   wire [47:0] 	    mac_alt_addr15;
   wire [47:0] 	    addr_filter;
   wire [7:0] 	    addr_filter_mask_msb;
   wire [15:0] 	    addr_filter_mask_lsb;
   wire [255:0]     hash_table;
   wire [`H_INFO]   mac_host_info0 ;
   wire [`H_INFO]   mac_host_info1 ;
   wire [`H_INFO]   mac_host_info2 ;
   wire [`H_INFO]   mac_host_info3 ;
   wire [`H_INFO]   mac_host_info4 ;
   wire [`H_INFO]   mac_host_info5 ;
   wire [`H_INFO]   mac_host_info6 ;
   wire [`H_INFO]   mac_host_info7 ;
   wire [`H_INFO]   mac_host_info8 ;
   wire [`H_INFO]   mac_host_info9 ;
   wire [`H_INFO]   mac_host_info10;
   wire [`H_INFO]   mac_host_info11;
   wire [`H_INFO]   mac_host_info12;
   wire [`H_INFO]   mac_host_info13;
   wire [`H_INFO]   mac_host_info14;
   wire [`H_INFO]   mac_host_info15;
   wire [`H_INFO]   mac_host_info16;
   wire [`H_INFO]   mac_host_info17;
   wire [`H_INFO]   mac_host_info18;
   wire [`H_INFO]   mac_host_info19;
   wire [`TBITS]    srfifo_dout; 
   // end of ALT_ADDR_AND_HASH_FUNC specific signals

   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire 	    rac_pls;
   wire 	    wr_en;
   wire 	    rd_en;
   wire   [4:0]     rxfifo_full_space_clk;
   wire 	    stfifo_empty_clk;
   wire 	    stfifo_full_clk;
   wire [4:0] 	    stfifo_rd_ptr_txclk;
   wire [4:0] 	    txfifo_rd_ptr_txclk;
   wire 	    link_fault;
   wire 	    tx_hb_byte0_time;
   wire 	    tx_hb_byte1_time;
   wire 	    tx_hb_byte2_time;
   wire 	    tx_hb_byte3_time;
   wire 	    tx_hb_byte4_time;
   wire 	    tx_hb_byte5_time;
   wire 	    tx_hb_byte6_time;
   wire 	    tx_hb_byte7_time;
   wire 	    stfifo_underrun_txclk;
   wire  [13:0]     tx_byte_count;
   wire 	    eop_txclk;
   wire 	    stfifo_overrun_clk;
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on

   
/* ------- start of rxfifo_unload instantiation -------------- */
rxfifo_unload rxfifo_unload
(/*AUTOINST*/
 // Outputs
 .rxmac_ipp_ack				(rxmac_ipp_ack),
 .rxmac_ipp_tag				(rxmac_ipp_tag),
 .rxmac_ipp_data			(rxmac_ipp_data[63:0]),
 .rxmac_ipp_ctrl			(rxmac_ipp_ctrl),
 .rxmac_ipp_stat			(rxmac_ipp_stat[`TBITS]),
 .rxfifo_g_rd_ptr_clk			(rxfifo_g_rd_ptr_clk[4:0]),
 .rxfifo_rd_ptr_clk			(rxfifo_rd_ptr_clk[4:0]),
 .rxfifo_wr_ptr_clk			(rxfifo_wr_ptr_clk[4:0]),
 .rxfifo_underrun_clk			(rxfifo_underrun_clk),
 .srfifo_rd_ptr_clk			(srfifo_rd_ptr_clk[4:0]),
 .inc_histo_cntr1			(inc_histo_cntr1),
 .inc_histo_cntr2			(inc_histo_cntr2),
 .inc_histo_cntr3			(inc_histo_cntr3),
 .inc_histo_cntr4			(inc_histo_cntr4),
 .inc_histo_cntr5			(inc_histo_cntr5),
 .inc_histo_cntr6			(inc_histo_cntr6),
 .inc_histo_cntr7			(inc_histo_cntr7),
 .rxfifo_full_clk_reg			(rxfifo_full_clk_reg),
 .rxfifo_empty_clk_reg			(rxfifo_empty_clk_reg),
 .rxfifo_full_space_clk			(rxfifo_full_space_clk[4:0]),
 // Inputs
 .clk					(clk),
 .rx_reset_clk				(rx_reset_clk),
 .srfifo_g_wr_ptr_sync			(srfifo_g_wr_ptr_sync[4:0]),
 .rxfifo_g_wr_ptr_sync			(rxfifo_g_wr_ptr_sync[4:0]),
 .rxfifo_dout				(rxfifo_dout[65:0]),
 .ipp_rxmac_req				(ipp_rxmac_req),
 .srfifo_dout				(srfifo_dout[`TBITS]));
/* ------- end of rxfifo_unload instatiation ----------------- */   

/* ------- start of rx_xmac instatiation --------------------- */   
rx_xmac rx_xmac
(/*AUTOINST*/
 // Outputs
 .rxfifo_dout				(rxfifo_dout[65:0]),
 .rxfifo_g_wr_ptr_rxclk			(rxfifo_g_wr_ptr_rxclk[4:0]),
 .rxfifo_full_rxclk_reg			(rxfifo_full_rxclk_reg),
 .rxfifo_overrun_rxclk			(rxfifo_overrun_rxclk),
 .srfifo_dout				(srfifo_dout[`TBITS]),
 .srfifo_g_wr_ptr_rxclk			(srfifo_g_wr_ptr_rxclk[4:0]),
 .rx_good_pkt				(rx_good_pkt),
 .rx_fc_pkt_ok				(rx_fc_pkt_ok),
 .pause_time				(pause_time[15:0]),
 .toggle_rx_bcount			(toggle_rx_bcount),
 .inc_bcast_count			(inc_bcast_count),
 .inc_mcast_count			(inc_mcast_count),
 .inc_code_viol_count			(inc_code_viol_count),
 .inc_crc_err_count			(inc_crc_err_count),
 .inc_min_pkt_err_count			(inc_min_pkt_err_count),
 .inc_max_pkt_err_count			(inc_max_pkt_err_count),
 .rx_data_valid_gmux_reg		(rx_data_valid_gmux_reg),
 .rx_pa_data				(rx_pa_data[63:0]),
 .link_fault				(link_fault),
 .inc_link_fault_count			(inc_link_fault_count),
 .remote_fault_oc_reg			(remote_fault_oc_reg),
 .local_fault_oc_reg			(local_fault_oc_reg),
 .lfs_state				(lfs_state[1:0]),
 .xrlm_state				(xrlm_state),
 .sop_state				(sop_state),
 .S_detected_reg			(S_detected_reg),
 .T_E_detected_at_modified_pkt_reg	(T_E_detected_at_modified_pkt_reg),
 .END_PKT_ERR_detected_a_at_modified_pkt_reg(END_PKT_ERR_detected_a_at_modified_pkt_reg),
 .END_PKT_ERR_detected_b_at_modified_pkt_reg(END_PKT_ERR_detected_b_at_modified_pkt_reg),
 .S_D_reg				(S_D_reg),
 .S_I_reg				(S_I_reg),
 .D_S_reg				(D_S_reg),
 .I_S_reg				(I_S_reg),
 .abort_bit_reg				(abort_bit_reg),
 .rx_err_reg				(rx_err_reg),
 .crc_error_reg				(crc_error_reg),
 .kill_data_ready_reg			(kill_data_ready_reg),
 .kill_crc_reg				(kill_crc_reg),
 .rx_sel_reg				(rx_sel_reg[1:0]),
 // Inputs
 .rx_clk				(rx_clk),
 .rx_reset				(rx_reset),
 .warning_msg_en			(warning_msg_en),
 .xgmii_rxc				(xgmii_rxc[3:0]),
 .xgmii_rxd				(xgmii_rxd[31:0]),
 .xpcs_rxc				(xpcs_rxc[7:0]),
 .xpcs_rxd				(xpcs_rxd[63:0]),
 .txc_image				(txc_image[7:0]),
 .txd_image				(txd_image[63:0]),
 .hold_rxd				(hold_rxd[63:0]),
 .hold_rx_dv				(hold_rx_dv[7:0]),
 .hold_rx_err				(hold_rx_err),
 .xpcs_bypass				(xpcs_bypass),
 .mii_or_gmii_mode			(mii_or_gmii_mode),
 .loopback				(loopback),
 .rx_enable_rxclk			(rx_enable_rxclk),
 .code_viol_chk_dis			(code_viol_chk_dis),
 .crc_chk_dis				(crc_chk_dis),
 .promisc_all				(promisc_all),
 .promisc_group				(promisc_group),
 .err_chk_dis				(err_chk_dis),
 .rx_pause_en				(rx_pause_en),
 .pass_fc				(pass_fc),
 .reserve_multicast			(reserve_multicast),
 .mac_unique_addr			(mac_unique_addr[47:0]),
 .no_rx_min_pkt_size_chk		(no_rx_min_pkt_size_chk),
 .rx_min_pkt_size			(rx_min_pkt_size[9:0]),
 .max_pkt_size				(max_pkt_size[13:0]),
 .lfs_disable_rxclk			(lfs_disable_rxclk),
 .rxfifo_g_rd_ptr_sync			(rxfifo_g_rd_ptr_sync[4:0]),
 .rxfifo_rd_ptr_clk			(rxfifo_rd_ptr_clk[3:0]),
 .srfifo_rd_ptr_clk			(srfifo_rd_ptr_clk[4:0]),
 .strip_crc				(strip_crc),
 .addr_filter_en			(addr_filter_en),
 .hash_filter_en			(hash_filter_en),
 .alt_addr_comp_en			(alt_addr_comp_en[15:0]),
 .mac_alt_addr0				(mac_alt_addr0[47:0]),
 .mac_alt_addr1				(mac_alt_addr1[47:0]),
 .mac_alt_addr2				(mac_alt_addr2[47:0]),
 .mac_alt_addr3				(mac_alt_addr3[47:0]),
 .mac_alt_addr4				(mac_alt_addr4[47:0]),
 .mac_alt_addr5				(mac_alt_addr5[47:0]),
 .mac_alt_addr6				(mac_alt_addr6[47:0]),
 .mac_alt_addr7				(mac_alt_addr7[47:0]),
 .mac_alt_addr8				(mac_alt_addr8[47:0]),
 .mac_alt_addr9				(mac_alt_addr9[47:0]),
 .mac_alt_addr10			(mac_alt_addr10[47:0]),
 .mac_alt_addr11			(mac_alt_addr11[47:0]),
 .mac_alt_addr12			(mac_alt_addr12[47:0]),
 .mac_alt_addr13			(mac_alt_addr13[47:0]),
 .mac_alt_addr14			(mac_alt_addr14[47:0]),
 .mac_alt_addr15			(mac_alt_addr15[47:0]),
 .addr_filter				(addr_filter[47:0]),
 .addr_filter_mask_msb			(addr_filter_mask_msb[7:0]),
 .addr_filter_mask_lsb			(addr_filter_mask_lsb[15:0]),
 .hash_table				(hash_table[255:0]),
 .mac_host_info0			(mac_host_info0[`H_INFO]),
 .mac_host_info1			(mac_host_info1[`H_INFO]),
 .mac_host_info2			(mac_host_info2[`H_INFO]),
 .mac_host_info3			(mac_host_info3[`H_INFO]),
 .mac_host_info4			(mac_host_info4[`H_INFO]),
 .mac_host_info5			(mac_host_info5[`H_INFO]),
 .mac_host_info6			(mac_host_info6[`H_INFO]),
 .mac_host_info7			(mac_host_info7[`H_INFO]),
 .mac_host_info8			(mac_host_info8[`H_INFO]),
 .mac_host_info9			(mac_host_info9[`H_INFO]),
 .mac_host_info10			(mac_host_info10[`H_INFO]),
 .mac_host_info11			(mac_host_info11[`H_INFO]),
 .mac_host_info12			(mac_host_info12[`H_INFO]),
 .mac_host_info13			(mac_host_info13[`H_INFO]),
 .mac_host_info14			(mac_host_info14[`H_INFO]),
 .mac_host_info15			(mac_host_info15[`H_INFO]),
 .mac_host_info16			(mac_host_info16[`H_INFO]),
 .mac_host_info17			(mac_host_info17[`H_INFO]),
 .mac_host_info18			(mac_host_info18[`H_INFO]),
 .mac_host_info19			(mac_host_info19[`H_INFO]));  		   
/* ------------- end of rx_xmac instantiation ---------------- */
   
/* ------------- start of xmac_slv instantiation ------------- */
xmac_slv xmac_slv
(/*AUTOINST*/
 // Outputs
 .pio_ack				(pio_ack),
 .pio_rd_data				(pio_rd_data[31:0]),
 .pio_err				(pio_err),
 .xmac_debug				(xmac_debug[31:0]),
 .mac_debug_sel				(mac_debug_sel[2:0]),
 .strip_crc				(strip_crc),
 .addr_filter_en			(addr_filter_en),
 .hash_filter_en			(hash_filter_en),
 .alt_addr_comp_en			(alt_addr_comp_en[15:0]),
 .mac_alt_addr0				(mac_alt_addr0[47:0]),
 .mac_alt_addr1				(mac_alt_addr1[47:0]),
 .mac_alt_addr2				(mac_alt_addr2[47:0]),
 .mac_alt_addr3				(mac_alt_addr3[47:0]),
 .mac_alt_addr4				(mac_alt_addr4[47:0]),
 .mac_alt_addr5				(mac_alt_addr5[47:0]),
 .mac_alt_addr6				(mac_alt_addr6[47:0]),
 .mac_alt_addr7				(mac_alt_addr7[47:0]),
 .mac_alt_addr8				(mac_alt_addr8[47:0]),
 .mac_alt_addr9				(mac_alt_addr9[47:0]),
 .mac_alt_addr10			(mac_alt_addr10[47:0]),
 .mac_alt_addr11			(mac_alt_addr11[47:0]),
 .mac_alt_addr12			(mac_alt_addr12[47:0]),
 .mac_alt_addr13			(mac_alt_addr13[47:0]),
 .mac_alt_addr14			(mac_alt_addr14[47:0]),
 .mac_alt_addr15			(mac_alt_addr15[47:0]),
 .addr_filter				(addr_filter[47:0]),
 .addr_filter_mask_msb			(addr_filter_mask_msb[7:0]),
 .addr_filter_mask_lsb			(addr_filter_mask_lsb[15:0]),
 .hash_table				(hash_table[255:0]),
 .mac_host_info0			(mac_host_info0[`H_INFO]),
 .mac_host_info1			(mac_host_info1[`H_INFO]),
 .mac_host_info2			(mac_host_info2[`H_INFO]),
 .mac_host_info3			(mac_host_info3[`H_INFO]),
 .mac_host_info4			(mac_host_info4[`H_INFO]),
 .mac_host_info5			(mac_host_info5[`H_INFO]),
 .mac_host_info6			(mac_host_info6[`H_INFO]),
 .mac_host_info7			(mac_host_info7[`H_INFO]),
 .mac_host_info8			(mac_host_info8[`H_INFO]),
 .mac_host_info9			(mac_host_info9[`H_INFO]),
 .mac_host_info10			(mac_host_info10[`H_INFO]),
 .mac_host_info11			(mac_host_info11[`H_INFO]),
 .mac_host_info12			(mac_host_info12[`H_INFO]),
 .mac_host_info13			(mac_host_info13[`H_INFO]),
 .mac_host_info14			(mac_host_info14[`H_INFO]),
 .mac_host_info15			(mac_host_info15[`H_INFO]),
 .mac_host_info16			(mac_host_info16[`H_INFO]),
 .mac_host_info17			(mac_host_info17[`H_INFO]),
 .mac_host_info18			(mac_host_info18[`H_INFO]),
 .mac_host_info19			(mac_host_info19[`H_INFO]),
 .pcs_bypass				(pcs_bypass),
 .xpcs_bypass				(xpcs_bypass),
 .force_LED_on				(force_LED_on),
 .led_polarity				(led_polarity),
 .activity_led				(activity_led),
 .hw_reset				(hw_reset),
 .rx_reset_clk				(rx_reset_clk),
 .tx_reset_clk				(tx_reset_clk),
 .sys_clk_count				(sys_clk_count[2:0]),
 .txmac_interrupt			(txmac_interrupt),
 .rxmac_interrupt			(rxmac_interrupt),
 .xmac_fc_interrupt			(xmac_fc_interrupt),
 .no_tx_min_pkt_size_chk		(no_tx_min_pkt_size_chk),
 .no_rx_min_pkt_size_chk		(no_rx_min_pkt_size_chk),
 .always_no_crc				(always_no_crc),
 .var_min_ipg_en			(var_min_ipg_en),
 .tx_enable				(tx_enable),
 .rx_enable				(rx_enable),
 .promisc_all				(promisc_all),
 .err_chk_dis				(err_chk_dis),
 .crc_chk_dis				(crc_chk_dis),
 .code_viol_chk_dis			(code_viol_chk_dis),
 .promisc_group				(promisc_group),
 .reserve_multicast			(reserve_multicast),
 .rx_pause_en				(rx_pause_en),
 .pass_fc				(pass_fc),
 .tx_output_en				(tx_output_en),
 .loopback				(loopback),
 .sel_por_clk_src			(sel_por_clk_src),
 .sel_clk_25mhz				(sel_clk_25mhz),
 .mii_mode				(mii_mode),
 .gmii_mode				(gmii_mode),
 .xgmii_mode				(xgmii_mode),
 .mii_or_gmii_mode			(mii_or_gmii_mode),
 .lfs_disable				(lfs_disable),
 .warning_msg_en			(warning_msg_en),
 .ipg_value				(ipg_value[2:0]),
 .ipg_value1				(ipg_value1[`BYTE]),
 .stretch_ratio				(stretch_ratio[4:0]),
 .stretch_constant			(stretch_constant[2:0]),
 .stretch_mode				(stretch_mode),
 .slot_time				(slot_time[`BYTE]),
 .tx_min_pkt_size			(tx_min_pkt_size[9:0]),
 .rx_min_pkt_size			(rx_min_pkt_size[9:0]),
 .max_pkt_size				(max_pkt_size[13:0]),
 .mac_unique_addr			(mac_unique_addr[47:0]),
 .wr_en					(wr_en),
 .rd_en					(rd_en),
 .rac_pls				(rac_pls),
 // Inputs
 .clk					(clk),
 .clr_rx_reset_clk			(clr_rx_reset_clk),
 .clr_tx_reset_clk			(clr_tx_reset_clk),
 .pio_core_reset			(pio_core_reset),
 .pio_core_sel				(pio_core_sel),
 .pio_rd				(pio_rd),
 .pio_addr				(pio_addr[8:0]),
 .pio_wr_data				(pio_wr_data[31:0]),
 .pause_time				(pause_time[15:0]),
 .rxfifo_underrun_clk			(rxfifo_underrun_clk),
 .rxfifo_overrun_sync			(rxfifo_overrun_sync),
 .rx_good_pkt_sync			(rx_good_pkt_sync),
 .rx_fc_pkt_ok_clk			(rx_fc_pkt_ok_clk),
 .inc_max_pkt_err_count_sync		(inc_max_pkt_err_count_sync),
 .inc_min_pkt_err_count_sync		(inc_min_pkt_err_count_sync),
 .inc_code_viol_count_sync		(inc_code_viol_count_sync),
 .inc_align_err_count_sync		(inc_align_err_count_sync),
 .inc_crc_err_count_sync		(inc_crc_err_count_sync),
 .toggle_rx_bcount_sync			(toggle_rx_bcount_sync),
 .inc_bcast_count_sync			(inc_bcast_count_sync),
 .inc_mcast_count_sync			(inc_mcast_count_sync),
 .inc_histo_cntr1			(inc_histo_cntr1),
 .inc_histo_cntr2			(inc_histo_cntr2),
 .inc_histo_cntr3			(inc_histo_cntr3),
 .inc_histo_cntr4			(inc_histo_cntr4),
 .inc_histo_cntr5			(inc_histo_cntr5),
 .inc_histo_cntr6			(inc_histo_cntr6),
 .inc_histo_cntr7			(inc_histo_cntr7),
 .rx_data_valid_gmux_reg_clk		(rx_data_valid_gmux_reg_clk),
 .rx_pa_data				(rx_pa_data[63:0]),
 .set_tx_pkt_ok_sync			(set_tx_pkt_ok_sync),
 .paused_state_sync			(paused_state_sync),
 .txfifo_underrun_sync			(txfifo_underrun_sync),
 .txfifo_xfr_err_sync			(txfifo_xfr_err_sync),
 .tx_max_pkt_size_err_sync		(tx_max_pkt_size_err_sync),
 .txfifo_overrun_clk			(txfifo_overrun_clk),
 .toggle_tx_bcount_sync			(toggle_tx_bcount_sync),
 .toggle_txframe_count_sync		(toggle_txframe_count_sync),
 .tx_data_valid_clk			(tx_data_valid_clk),
 .inc_link_fault_count_sync		(inc_link_fault_count_sync),
 .remote_fault_oc_sync			(remote_fault_oc_sync),
 .local_fault_oc_sync			(local_fault_oc_sync),
 .ipp_rxmac_req				(ipp_rxmac_req),
 .rxmac_ipp_ack				(rxmac_ipp_ack),
 .rxmac_ipp_tag				(rxmac_ipp_tag),
 .rxmac_ipp_ctrl			(rxmac_ipp_ctrl),
 .rxmac_ipp_stat			(rxmac_ipp_stat[`TBITS]),
 .txmac_opp_req				(txmac_opp_req),
 .opp_txmac_ack				(opp_txmac_ack),
 .opp_txmac_tag				(opp_txmac_tag),
 .opp_txmac_stat			(opp_txmac_stat[3:0]),
 .opp_txmac_abort			(opp_txmac_abort),
 .rxfifo_full_clk_reg			(rxfifo_full_clk_reg),
 .rxfifo_empty_clk_reg			(rxfifo_empty_clk_reg),
 .rxfifo_rd_ptr_clk			(rxfifo_rd_ptr_clk[4:0]),
 .rxfifo_wr_ptr_clk			(rxfifo_wr_ptr_clk[4:0]),
 .S_detected_reg			(S_detected_reg),
 .T_E_detected_at_modified_pkt_reg	(T_E_detected_at_modified_pkt_reg),
 .END_PKT_ERR_detected_a_at_modified_pkt_reg(END_PKT_ERR_detected_a_at_modified_pkt_reg),
 .END_PKT_ERR_detected_b_at_modified_pkt_reg(END_PKT_ERR_detected_b_at_modified_pkt_reg),
 .S_D_reg				(S_D_reg),
 .S_I_reg				(S_I_reg),
 .D_S_reg				(D_S_reg),
 .I_S_reg				(I_S_reg),
 .abort_bit_reg				(abort_bit_reg),
 .rx_err_reg				(rx_err_reg),
 .crc_error_reg				(crc_error_reg),
 .kill_data_ready_reg			(kill_data_ready_reg),
 .kill_crc_reg				(kill_crc_reg),
 .rx_sel_reg				(rx_sel_reg[1:0]),
 .txfifo_full_clk_reg			(txfifo_full_clk_reg),
 .txfifo_empty_clk_reg			(txfifo_empty_clk_reg),
 .tx_swap_reg				(tx_swap_reg),
 .tx_on_reg				(tx_on_reg),
 .tx_on_half_reg			(tx_on_half_reg),
 .back2back_swap_reg1			(back2back_swap_reg1),
 .replace_txd_time_reg			(replace_txd_time_reg),
 .adjust2crc_full_case_last_byte_position_reg(adjust2crc_full_case_last_byte_position_reg[2:0]),
 .adjust2crc_full_case_last_byte_position_is_3_or_7_reg(adjust2crc_full_case_last_byte_position_is_3_or_7_reg),
 .stretch_clks_reg			(stretch_clks_reg[`BYTE]),
 .full_case_last_byte_position_reg	(full_case_last_byte_position_reg[2:0]),
 .stretch_full_case_last_byte_position_reg(stretch_full_case_last_byte_position_reg[3:0]),
 .stretch_bytes_reg			(stretch_bytes_reg[2:0]),
 .minus_4bytes_reg			(minus_4bytes_reg),
 .B_eop_reg				(B_eop_reg),
 .stretch_1_more_clk_reg		(stretch_1_more_clk_reg),
 .no_wasted_BW_reg			(no_wasted_BW_reg),
 .ipg_done_trail_temp_reg		(ipg_done_trail_temp_reg),
 .tx_byte0_reg0				(tx_byte0_reg0[7:0]),
 .restart_ipg_timer_reg			(restart_ipg_timer_reg),
 .eop_txclk_reg0			(eop_txclk_reg0),
 .eop_w_fcs_reg0			(eop_w_fcs_reg0),
 .tx_abort_reg0				(tx_abort_reg0),
 .eop_w_fcs_reg1			(eop_w_fcs_reg1),
 .tx_abort_reg1				(tx_abort_reg1),
 .ipg_done_reg				(ipg_done_reg),
 .ipg_done_lead_temp_reg		(ipg_done_lead_temp_reg),
 .force_ipg_done_lead_reg		(force_ipg_done_lead_reg),
 .set_back2back_reg			(set_back2back_reg),
 .back2back_reg				(back2back_reg),
 .txfifo_rd_ptr_clk			(txfifo_rd_ptr_clk[4:0]),
 .txfifo_wr_ptr_clk			(txfifo_wr_ptr_clk[4:0]),
 .last_byte_position			(last_byte_position[2:0]),
 .mgrlm_state				(mgrlm_state),
 .xrlm_state				(xrlm_state),
 .sop_state				(sop_state),
 .xtlm_state				(xtlm_state[2:0]),
 .lfs_state				(lfs_state[1:0]),
 .xpcs_rxc				(xpcs_rxc[7:0]),
 .xpcs_rxd				(xpcs_rxd[63:0]),
 .xpcs_txc				(xpcs_txc[7:0]),
 .xpcs_txd				(xpcs_txd[63:0]),
 .rx_heart_beat_timer_reg		(rx_heart_beat_timer_reg[3:0]),
 .tx_heart_beat_timer_reg		(tx_heart_beat_timer_reg[3:0]),
 .tx_clk_div2				(tx_clk_div2),
 .rx_clk_div2				(rx_clk_div2),
 .tx_nbclk_div2				(tx_nbclk_div2),
 .rx_nbclk_div2				(rx_nbclk_div2),
 .MDINT					(MDINT));
/* ------------- end of xmac_slv instantiation --------------- */

/* ------------- start of xmac_sync instantiation ------------ */
xmac_sync xmac_sync
(/*AUTOINST*/
 // Outputs
 .rx_reset				(rx_reset),
 .tx_reset				(tx_reset),
 .clr_rx_reset_clk			(clr_rx_reset_clk),
 .clr_tx_reset_clk			(clr_tx_reset_clk),
 .hw_reset_rxnbclk			(hw_reset_rxnbclk),
 .hw_reset_txnbclk			(hw_reset_txnbclk),
 .rx_reset_nbclk			(rx_reset_nbclk),
 .tx_reset_nbclk			(tx_reset_nbclk),
 .rxfifo_g_rd_ptr_sync			(rxfifo_g_rd_ptr_sync[4:0]),
 .rxfifo_g_wr_ptr_sync			(rxfifo_g_wr_ptr_sync[4:0]),
 .rxfifo_overrun_sync			(rxfifo_overrun_sync),
 .txfifo_g_rd_ptr_sync			(txfifo_g_rd_ptr_sync[4:0]),
 .txfifo_g_wr_ptr_sync			(txfifo_g_wr_ptr_sync[4:0]),
 .txfifo_underrun_sync			(txfifo_underrun_sync),
 .stfifo_g_rd_ptr_sync			(stfifo_g_rd_ptr_sync[4:0]),
 .stfifo_g_wr_ptr_sync			(stfifo_g_wr_ptr_sync[4:0]),
 .srfifo_g_wr_ptr_sync			(srfifo_g_wr_ptr_sync[4:0]),
 .rx_good_pkt_sync			(rx_good_pkt_sync),
 .rx_fc_pkt_ok_txclk			(rx_fc_pkt_ok_txclk),
 .rx_fc_pkt_ok_clk			(rx_fc_pkt_ok_clk),
 .inc_max_pkt_err_count_sync		(inc_max_pkt_err_count_sync),
 .inc_min_pkt_err_count_sync		(inc_min_pkt_err_count_sync),
 .inc_code_viol_count_sync		(inc_code_viol_count_sync),
 .inc_align_err_count_sync		(inc_align_err_count_sync),
 .inc_crc_err_count_sync		(inc_crc_err_count_sync),
 .toggle_rx_bcount_sync			(toggle_rx_bcount_sync),
 .inc_bcast_count_sync			(inc_bcast_count_sync),
 .inc_mcast_count_sync			(inc_mcast_count_sync),
 .rx_enable_rxclk			(rx_enable_rxclk),
 .rx_enable_nbclk			(rx_enable_nbclk),
 .rxfifo_full_nbclk			(rxfifo_full_nbclk),
 .rx_data_valid_gmux_reg_clk		(rx_data_valid_gmux_reg_clk),
 .paused_state_sync			(paused_state_sync),
 .set_tx_pkt_ok_sync			(set_tx_pkt_ok_sync),
 .txfifo_xfr_err_sync			(txfifo_xfr_err_sync),
 .tx_max_pkt_size_err_sync		(tx_max_pkt_size_err_sync),
 .toggle_tx_bcount_sync			(toggle_tx_bcount_sync),
 .toggle_txframe_count_sync		(toggle_txframe_count_sync),
 .tx_enable_txclk			(tx_enable_txclk),
 .tx_output_en_txclk			(tx_output_en_txclk),
 .tx_output_en_nbclk			(tx_output_en_nbclk),
 .tx_data_valid_clk			(tx_data_valid_clk),
 .lfs_disable_rxclk			(lfs_disable_rxclk),
 .inc_link_fault_count_sync		(inc_link_fault_count_sync),
 .remote_fault_oc_sync			(remote_fault_oc_sync),
 .local_fault_oc_sync			(local_fault_oc_sync),
 .remote_fault_oc_txclk			(remote_fault_oc_txclk),
 .local_fault_oc_txclk			(local_fault_oc_txclk),
 // Inputs
 .clk					(clk),
 .rx_clk				(rx_clk),
 .rx_nbclk				(rx_nbclk),
 .tx_clk				(tx_clk),
 .tx_nbclk				(tx_nbclk),
 .rx_reset_clk				(rx_reset_clk),
 .tx_reset_clk				(tx_reset_clk),
 .hw_reset				(hw_reset),
 .rxfifo_g_rd_ptr_clk			(rxfifo_g_rd_ptr_clk[4:0]),
 .rxfifo_g_wr_ptr_rxclk			(rxfifo_g_wr_ptr_rxclk[4:0]),
 .rxfifo_overrun_rxclk			(rxfifo_overrun_rxclk),
 .txfifo_g_rd_ptr_txclk			(txfifo_g_rd_ptr_txclk[4:0]),
 .txfifo_g_wr_ptr_clk			(txfifo_g_wr_ptr_clk[4:0]),
 .txfifo_underrun_txclk			(txfifo_underrun_txclk),
 .stfifo_g_rd_ptr_txclk			(stfifo_g_rd_ptr_txclk[4:0]),
 .stfifo_g_wr_ptr_clk			(stfifo_g_wr_ptr_clk[4:0]),
 .srfifo_g_wr_ptr_rxclk			(srfifo_g_wr_ptr_rxclk[4:0]),
 .rx_good_pkt				(rx_good_pkt),
 .rx_fc_pkt_ok				(rx_fc_pkt_ok),
 .inc_max_pkt_err_count			(inc_max_pkt_err_count),
 .inc_min_pkt_err_count			(inc_min_pkt_err_count),
 .inc_code_viol_count			(inc_code_viol_count),
 .inc_align_err_count_nbclk		(inc_align_err_count_nbclk),
 .inc_crc_err_count			(inc_crc_err_count),
 .toggle_rx_bcount			(toggle_rx_bcount),
 .inc_bcast_count			(inc_bcast_count),
 .inc_mcast_count			(inc_mcast_count),
 .rx_enable				(rx_enable),
 .rxfifo_full_rxclk_reg			(rxfifo_full_rxclk_reg),
 .rx_data_valid_gmux_reg		(rx_data_valid_gmux_reg),
 .paused_state				(paused_state),
 .set_tx_pkt_ok				(set_tx_pkt_ok),
 .txfifo_xfr_err			(txfifo_xfr_err),
 .tx_max_pkt_size_err			(tx_max_pkt_size_err),
 .toggle_tx_bcount			(toggle_tx_bcount),
 .toggle_txframe_count			(toggle_txframe_count),
 .tx_enable				(tx_enable),
 .tx_output_en				(tx_output_en),
 .tx_data_valid				(tx_data_valid),
 .lfs_disable				(lfs_disable),
 .inc_link_fault_count			(inc_link_fault_count),
 .remote_fault_oc_reg			(remote_fault_oc_reg),
 .local_fault_oc_reg			(local_fault_oc_reg));
/* ------------- end of xmac_sync instantiation -------------- */
   
/* ------------- start of txfifo_load instantiation ---------- */
txfifo_load txfifo_load
(/*AUTOINST*/
 // Outputs
 .txmac_opp_req				(txmac_opp_req),
 .txfifo_full_clk_reg			(txfifo_full_clk_reg),
 .txfifo_empty_clk_reg			(txfifo_empty_clk_reg),
 .txfifo_overrun_clk			(txfifo_overrun_clk),
 .txfifo_g_wr_ptr_clk			(txfifo_g_wr_ptr_clk[4:0]),
 .txfifo_wr_ptr_clk			(txfifo_wr_ptr_clk[4:0]),
 .txfifo_rd_ptr_clk			(txfifo_rd_ptr_clk[4:0]),
 .stfifo_full_clk			(stfifo_full_clk),
 .stfifo_empty_clk			(stfifo_empty_clk),
 .stfifo_overrun_clk			(stfifo_overrun_clk),
 .stfifo_g_wr_ptr_clk			(stfifo_g_wr_ptr_clk[4:0]),
 .no_crc				(no_crc),
 .last_byte_position			(last_byte_position[2:0]),
 .txfifo_dout				(txfifo_dout[65:0]),
 // Inputs
 .clk					(clk),
 .tx_reset_clk				(tx_reset_clk),
 .opp_txmac_data			(opp_txmac_data[63:0]),
 .opp_txmac_ack				(opp_txmac_ack),
 .opp_txmac_tag				(opp_txmac_tag),
 .opp_txmac_stat			(opp_txmac_stat[3:0]),
 .opp_txmac_abort			(opp_txmac_abort),
 .txfifo_g_rd_ptr_sync			(txfifo_g_rd_ptr_sync[4:0]),
 .txfifo_rd_ptr_txclk			(txfifo_rd_ptr_txclk[3:0]),
 .stfifo_g_rd_ptr_sync			(stfifo_g_rd_ptr_sync[4:0]),
 .stfifo_rd_ptr_txclk			(stfifo_rd_ptr_txclk[3:0]));
/* ------------- end of txfifo_load instantiation ------------ */

/* ------------- start of tx_xmac instantiation -------------- */
tx_xmac tx_xmac
(/*AUTOINST*/
 // Outputs
 .xgmii_txc				(xgmii_txc[3:0]),
 .xgmii_txd				(xgmii_txd[31:0]),
 .xpcs_txc				(xpcs_txc[7:0]),
 .xpcs_txd				(xpcs_txd[63:0]),
 .txc_image				(txc_image[7:0]),
 .txd_image				(txd_image[63:0]),
 .tx_err_image				(tx_err_image),
 .tx_byte_count				(tx_byte_count[13:0]),
 .paused_state				(paused_state),
 .txfifo_xfr_err			(txfifo_xfr_err),
 .tx_max_pkt_size_err			(tx_max_pkt_size_err),
 .set_tx_pkt_ok				(set_tx_pkt_ok),
 .toggle_txframe_count			(toggle_txframe_count),
 .toggle_tx_bcount			(toggle_tx_bcount),
 .txfifo_g_rd_ptr_txclk			(txfifo_g_rd_ptr_txclk[4:0]),
 .txfifo_rd_ptr_txclk			(txfifo_rd_ptr_txclk[4:0]),
 .txfifo_underrun_txclk			(txfifo_underrun_txclk),
 .eop_txclk				(eop_txclk),
 .tx_data_valid				(tx_data_valid),
 .stfifo_g_rd_ptr_txclk			(stfifo_g_rd_ptr_txclk[4:0]),
 .stfifo_rd_ptr_txclk			(stfifo_rd_ptr_txclk[4:0]),
 .stfifo_underrun_txclk			(stfifo_underrun_txclk),
 .tx_swap_reg				(tx_swap_reg),
 .tx_on_reg				(tx_on_reg),
 .tx_on_half_reg			(tx_on_half_reg),
 .back2back_swap_reg1			(back2back_swap_reg1),
 .replace_txd_time_reg			(replace_txd_time_reg),
 .adjust2crc_full_case_last_byte_position_reg(adjust2crc_full_case_last_byte_position_reg[2:0]),
 .adjust2crc_full_case_last_byte_position_is_3_or_7_reg(adjust2crc_full_case_last_byte_position_is_3_or_7_reg),
 .stretch_clks_reg			(stretch_clks_reg[`BYTE]),
 .full_case_last_byte_position_reg	(full_case_last_byte_position_reg[2:0]),
 .stretch_full_case_last_byte_position_reg(stretch_full_case_last_byte_position_reg[3:0]),
 .stretch_bytes_reg			(stretch_bytes_reg[2:0]),
 .minus_4bytes_reg			(minus_4bytes_reg),
 .B_eop_reg				(B_eop_reg),
 .stretch_1_more_clk_reg		(stretch_1_more_clk_reg),
 .no_wasted_BW_reg			(no_wasted_BW_reg),
 .ipg_done_trail_temp_reg		(ipg_done_trail_temp_reg),
 .tx_byte0_reg0				(tx_byte0_reg0[7:0]),
 .restart_ipg_timer_reg			(restart_ipg_timer_reg),
 .eop_txclk_reg0			(eop_txclk_reg0),
 .eop_w_fcs_reg0			(eop_w_fcs_reg0),
 .tx_abort_reg0				(tx_abort_reg0),
 .eop_w_fcs_reg1			(eop_w_fcs_reg1),
 .tx_abort_reg1				(tx_abort_reg1),
 .ipg_done_reg				(ipg_done_reg),
 .ipg_done_lead_temp_reg		(ipg_done_lead_temp_reg),
 .force_ipg_done_lead_reg		(force_ipg_done_lead_reg),
 .set_back2back_reg			(set_back2back_reg),
 .back2back_reg				(back2back_reg),
 .xtlm_state				(xtlm_state[2:0]),
 // Inputs
 .tx_clk				(tx_clk),
 .tx_reset				(tx_reset),
 .xgmii_mode				(xgmii_mode),
 .txfifo_dout				(txfifo_dout[65:0]),
 .no_crc				(no_crc),
 .last_byte_position			(last_byte_position[2:0]),
 .max_pkt_size				(max_pkt_size[13:0]),
 .tx_min_pkt_size			(tx_min_pkt_size[9:0]),
 .no_tx_min_pkt_size_chk		(no_tx_min_pkt_size_chk),
 .mac_unique_addr			(mac_unique_addr[47:0]),
 .ipg_value				(ipg_value[2:0]),
 .stretch_ratio				(stretch_ratio[4:0]),
 .stretch_constant			(stretch_constant[2:0]),
 .stretch_mode				(stretch_mode),
 .rx_fc_pkt_ok_txclk			(rx_fc_pkt_ok_txclk),
 .pause_time				(pause_time[15:0]),
 .slot_time				(slot_time[`BYTE]),
 .txfifo_g_wr_ptr_sync			(txfifo_g_wr_ptr_sync[4:0]),
 .stfifo_g_wr_ptr_sync			(stfifo_g_wr_ptr_sync[4:0]),
 .tx_enable_txclk			(tx_enable_txclk),
 .always_no_crc				(always_no_crc),
 .tx_output_en_txclk			(tx_output_en_txclk),
 .var_min_ipg_en			(var_min_ipg_en),
 .mii_mode				(mii_mode),
 .gmii_mode				(gmii_mode),
 .warning_msg_en			(warning_msg_en),
 .remote_fault_oc_txclk			(remote_fault_oc_txclk),
 .local_fault_oc_txclk			(local_fault_oc_txclk));
/* ------------- end of tx_xmac instantiation ---------------- */

`ifdef XGMII_ONLY
// outputs of rx_mii_gmii 
   assign 	    inc_align_err_count_nbclk = 0;
   assign 	    rx_heart_beat_timer       = 0;
   assign 	    rx_heart_beat_timer_reg   = 0;
   assign 	    hold_rxd    = 0;
   assign 	    hold_rx_dv  = 0;
   assign 	    hold_rx_err = 0;
   assign 	    mgrlm_state = 0;
// outputs of tx_mii_gmii 
   assign 	    tx_heart_beat_timer       = 0;
   assign 	    tx_heart_beat_timer_reg   = 0;
   // mii outputs
   assign 	    mii_txd     = 0;
   assign 	    mii_tx_en   = 0;
   assign 	    mii_tx_err  = 0;
   // gmii outputs
   assign 	    gmii_txd    = 0;
   assign 	    gmii_tx_en  = 0;
   assign 	    gmii_tx_err = 0;
   // loopback path
   assign 	    mgmii_txd   = 0;
   assign 	    mgmii_tx_en = 0;
   assign 	    mgmii_tx_err= 0;
`else  // quad speed
/* ------------- start of rx_mii_gmii instantiation ---------- */
rx_mii_gmii rx_mii_gmii
(/*AUTOINST*/
 // Outputs
 .inc_align_err_count_nbclk		(inc_align_err_count_nbclk),
 .rx_heart_beat_timer			(rx_heart_beat_timer[3:0]),
 .rx_heart_beat_timer_reg		(rx_heart_beat_timer_reg[3:0]),
 .hold_rxd				(hold_rxd[63:0]),
 .hold_rx_dv				(hold_rx_dv[7:0]),
 .hold_rx_err				(hold_rx_err),
 .mgrlm_state				(mgrlm_state),
 // Inputs
 .rx_nbclk				(rx_nbclk),
 .rx_reset_nbclk			(rx_reset_nbclk),
 .hw_reset_rxnbclk			(hw_reset_rxnbclk),
 .rxfifo_full_nbclk			(rxfifo_full_nbclk),
 .rx_enable_nbclk			(rx_enable_nbclk),
 .mgmii_txd				(mgmii_txd[`BYTE]),
 .mgmii_tx_en				(mgmii_tx_en),
 .mgmii_tx_err				(mgmii_tx_err),
 .mii_mode				(mii_mode),
 .gmii_mode				(gmii_mode),
 .mii_or_gmii_mode			(mii_or_gmii_mode),
 .loopback				(loopback),
 .gmii_rxd				(gmii_rxd[`BYTE]),
 .gmii_rx_dv				(gmii_rx_dv),
 .gmii_rx_err				(gmii_rx_err));
/* ------------- end of rx_mii_gmii  instantiation ----------- */

/* ------------- start of tx_mii_gmii instantiation ---------- */
tx_mii_gmii tx_mii_gmii
(/*AUTOINST*/
 // Outputs
 .tx_heart_beat_timer			(tx_heart_beat_timer[3:0]),
 .tx_heart_beat_timer_reg		(tx_heart_beat_timer_reg[3:0]),
 .gmii_txd				(gmii_txd[`BYTE]),
 .gmii_tx_en				(gmii_tx_en),
 .gmii_tx_err				(gmii_tx_err),
 .mgmii_txd				(mgmii_txd[`BYTE]),
 .mgmii_tx_en				(mgmii_tx_en),
 .mgmii_tx_err				(mgmii_tx_err),
 .tx_hb_byte0_time			(tx_hb_byte0_time),
 .tx_hb_byte1_time			(tx_hb_byte1_time),
 .tx_hb_byte2_time			(tx_hb_byte2_time),
 .tx_hb_byte3_time			(tx_hb_byte3_time),
 .tx_hb_byte4_time			(tx_hb_byte4_time),
 .tx_hb_byte5_time			(tx_hb_byte5_time),
 .tx_hb_byte6_time			(tx_hb_byte6_time),
 .tx_hb_byte7_time			(tx_hb_byte7_time),
 // Inputs
 .tx_nbclk				(tx_nbclk),
 .tx_reset_nbclk			(tx_reset_nbclk),
 .hw_reset_txnbclk			(hw_reset_txnbclk),
 .tx_output_en_nbclk			(tx_output_en_nbclk),
 .mii_mode				(mii_mode),
 .gmii_mode				(gmii_mode),
 .mii_or_gmii_mode			(mii_or_gmii_mode),
 .txd_image				(txd_image[63:0]),
 .txc_image				(txc_image[7:0]),
 .tx_err_image				(tx_err_image),
 .ipg_value1				(ipg_value1[`BYTE]));
/* ------------- end of tx_mii_gmii  instantiation ----------- */
`endif // !ifdef XGMII_ONLY


/* ------------- clock observation point logic --------------- */
   
 DIV2_CLK tx_clk_DIV2_CLK  (.reset(tx_reset),.clk(tx_clk),.clk2(tx_clk_div2));
 DIV2_CLK rx_clk_DIV2_CLK  (.reset(rx_reset),.clk(rx_clk),.clk2(rx_clk_div2));
 DIV2_CLK tx_nbclk_DIV2_CLK(.reset(tx_reset_nbclk),.clk(tx_nbclk),.clk2(tx_nbclk_div2));
 DIV2_CLK rx_nbclk_DIV2_CLK(.reset(rx_reset_nbclk),.clk(rx_nbclk),.clk2(rx_nbclk_div2));
   
endmodule // xmac


