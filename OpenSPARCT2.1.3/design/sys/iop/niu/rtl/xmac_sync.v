// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xmac_sync.v
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

/*************************************************************************
 *
 * File Name    : xmac_sync.v
 * Author Name  : John Lo
 * Description  : It contains control signals crossing different clk domain.
 * Parent Module: xmac_core
 * Child  Module: 
 * Interface Mod: many.
 * Date Created : 5/9/00
 *
 * Copyright (c) 2002, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

module xmac_sync (
            clk,
            rx_clk,
            rx_nbclk,
            tx_clk,
            tx_nbclk,
            rx_reset_clk, // sys_clk domain
            tx_reset_clk,
            hw_reset,
            // fifo related input signal
            rxfifo_g_rd_ptr_clk,      // from    clk domain
    	    rxfifo_g_wr_ptr_rxclk,    // from rx_clk domain
    	    rxfifo_overrun_rxclk,     // from rx_clk domain
            txfifo_g_rd_ptr_txclk,    // from tx_clk domain
    	    txfifo_g_wr_ptr_clk,      // from    clk domain
            txfifo_underrun_txclk,    // from tx_clk domain
            stfifo_g_rd_ptr_txclk,    // from tx_clk domain
            stfifo_g_wr_ptr_clk,      // from    clk domain
            srfifo_g_wr_ptr_rxclk,    // from rx_clk domain
            // RxMac related input signals
    	    rx_good_pkt,
    	    rx_fc_pkt_ok,             // from rx_clk domain
    	    inc_max_pkt_err_count,
    	    inc_min_pkt_err_count,
    	    inc_code_viol_count,
            inc_align_err_count_nbclk, // mii_mode 
    	    inc_crc_err_count,
    	    toggle_rx_bcount,
    	    inc_bcast_count,
    	    inc_mcast_count,
            rx_enable,
            rxfifo_full_rxclk_reg,
            rx_data_valid_gmux_reg,
            // TxMac related input signlas
 	    paused_state,
            set_tx_pkt_ok,
            txfifo_xfr_err,
 	    tx_max_pkt_size_err,
 	    toggle_tx_bcount,
 	    toggle_txframe_count,
            tx_enable,
            tx_output_en,
            tx_data_valid,
            // lfs related input signals
            lfs_disable,
            inc_link_fault_count,
            remote_fault_oc_reg,
            local_fault_oc_reg,	  
// outputs
     	    rx_reset,             // to   rx_clk domain
     	    tx_reset,             // to   tx_clk domain
     	    clr_rx_reset_clk,     // to      clk domain
     	    clr_tx_reset_clk,     // to      clk domain
            hw_reset_rxnbclk,     // to   rx_nbclk domain
            hw_reset_txnbclk,     // to   tx_nbclk domain
            rx_reset_nbclk,       // to   rx_nbclk domain
            tx_reset_nbclk,       // to   tx_nbclk domain
            // fifo related output signals
            rxfifo_g_rd_ptr_sync, // to   rx_clk domain
            rxfifo_g_wr_ptr_sync, // to      clk domain
     	    rxfifo_overrun_sync,  // to      clk domain
            txfifo_g_rd_ptr_sync, // to      clk domain
            txfifo_g_wr_ptr_sync, // to   tx_clk domain
            txfifo_underrun_sync, // to      clk domain
            stfifo_g_rd_ptr_sync, // to      clk domain
            stfifo_g_wr_ptr_sync, // to   tx_clk domain
            srfifo_g_wr_ptr_sync, // to      clk domain
            // RxMac related output signals
     	    rx_good_pkt_sync,     // to      xmac_slv.
     	    rx_fc_pkt_ok_txclk,   // to      tx_xmac.
     	    rx_fc_pkt_ok_clk,     // to      xmac_slv.
     	    inc_max_pkt_err_count_sync,
     	    inc_min_pkt_err_count_sync,
     	    inc_code_viol_count_sync,
            inc_align_err_count_sync,
     	    inc_crc_err_count_sync,
     	    toggle_rx_bcount_sync,
     	    inc_bcast_count_sync,
     	    inc_mcast_count_sync,
            rx_enable_rxclk,
            rx_enable_nbclk,
            rxfifo_full_nbclk,
            rx_data_valid_gmux_reg_clk,
            // TxMac related output signals
            paused_state_sync,
            set_tx_pkt_ok_sync,
            txfifo_xfr_err_sync,
            tx_max_pkt_size_err_sync,
            toggle_tx_bcount_sync,
            toggle_txframe_count_sync,
            tx_enable_txclk,
            tx_output_en_txclk,
            tx_output_en_nbclk,
            tx_data_valid_clk,
            // lfs related output signals
            lfs_disable_rxclk,
            inc_link_fault_count_sync,
            remote_fault_oc_sync,
            local_fault_oc_sync,
            remote_fault_oc_txclk,
            local_fault_oc_txclk
            );
   
   input         clk;
   input         rx_clk;
   input         rx_nbclk;
   input         tx_clk;
   input         tx_nbclk;
   input         rx_reset_clk;
   input         tx_reset_clk;
   input 	 hw_reset;
   // fifo related input signals
   input [4:0]   rxfifo_g_rd_ptr_clk;      // from    clk domain
   input [4:0] 	 rxfifo_g_wr_ptr_rxclk;    // from rx_clk domain
   input 	 rxfifo_overrun_rxclk;     // from rx_clk domain
   input [4:0]   txfifo_g_rd_ptr_txclk;    // from tx_clk domain
   input [4:0] 	 txfifo_g_wr_ptr_clk;      // from    clk domain
   input  	 txfifo_underrun_txclk;    // from tx_clk domain
   input [4:0]   stfifo_g_rd_ptr_txclk;    // from tx_clk domain
   input [4:0]   stfifo_g_wr_ptr_clk;      // from    clk domain
   input [4:0] 	 srfifo_g_wr_ptr_rxclk;    // from rx_clk domain
   // RxMac related input signals
   input 	 rx_good_pkt;
   input 	 rx_fc_pkt_ok;         // from rx_clk domain
   input 	 inc_max_pkt_err_count;
   input 	 inc_min_pkt_err_count;
   input 	 inc_code_viol_count;
   input 	 inc_align_err_count_nbclk;
   input 	 inc_crc_err_count;
   input 	 toggle_rx_bcount;
   input 	 inc_bcast_count;
   input 	 inc_mcast_count;
   input 	 rx_enable;
   input 	 rxfifo_full_rxclk_reg;
   input 	 rx_data_valid_gmux_reg;
   // TxMac related input signlas
   input 	 paused_state;
   input 	 set_tx_pkt_ok;
   input 	 txfifo_xfr_err;
   input 	 tx_max_pkt_size_err;
   input 	 toggle_tx_bcount;
   input 	 toggle_txframe_count;
   input 	 tx_enable;
   input 	 tx_output_en;
   input 	 tx_data_valid;
   // lfs related input signals
   input 	 lfs_disable;
   input 	 inc_link_fault_count;
   input 	 remote_fault_oc_reg;
   input 	 local_fault_oc_reg;
// outputs   
   output 	 rx_reset;             // to rx_clk domain
   output 	 tx_reset;             // to tx_clk domain
   output 	 clr_rx_reset_clk;     // to    clk domain
   output 	 clr_tx_reset_clk;     // to    clk domain
   output 	 hw_reset_rxnbclk;     // to rx_nbclk domain
   output 	 hw_reset_txnbclk;     // to tx_nbclk domain
   output 	 rx_reset_nbclk;       // to rx_nbclk domain
   output 	 tx_reset_nbclk;       // to tx_nbclk domain
    // fifo related output signals
   output [4:0]  rxfifo_g_rd_ptr_sync; // to rx_clk domain
   output [4:0]  rxfifo_g_wr_ptr_sync; // to    clk domain
   output 	 rxfifo_overrun_sync;  // to    clk domain
   output [4:0]  txfifo_g_rd_ptr_sync; // to    clk domain
   output [4:0]  txfifo_g_wr_ptr_sync; // to tx_clk domain
   output 	 txfifo_underrun_sync; // to    clk domain
   output [4:0]  stfifo_g_rd_ptr_sync; // to    clk domain
   output [4:0]  stfifo_g_wr_ptr_sync; // to tx_clk domain
   output [4:0]  srfifo_g_wr_ptr_sync; // to    clk domain
   // RxMac related output signals
   output 	 rx_good_pkt_sync;     // to    xmac_slv.v
   output 	 rx_fc_pkt_ok_txclk;   // to    tx_xmac.v
   output 	 rx_fc_pkt_ok_clk;     // to    xmac_slv.v
   output 	 inc_max_pkt_err_count_sync;
   output 	 inc_min_pkt_err_count_sync;
   output 	 inc_code_viol_count_sync;
   output 	 inc_align_err_count_sync;
   output 	 inc_crc_err_count_sync;
   output 	 toggle_rx_bcount_sync;
   output 	 inc_bcast_count_sync;
   output 	 inc_mcast_count_sync;
   output 	 rx_enable_rxclk;
   output 	 rx_enable_nbclk;
   output 	 rxfifo_full_nbclk;
   output 	 rx_data_valid_gmux_reg_clk;
   // TxMac related output signals        
   output 	 paused_state_sync;
   output 	 set_tx_pkt_ok_sync;
   output 	 txfifo_xfr_err_sync;
   output 	 tx_max_pkt_size_err_sync;
   output 	 toggle_tx_bcount_sync;
   output 	 toggle_txframe_count_sync;
   output 	 tx_enable_txclk;
   output 	 tx_output_en_txclk;
   output 	 tx_output_en_nbclk;
   output 	 tx_data_valid_clk;
   // lfs related input signals
   output 	 lfs_disable_rxclk;
   output 	 inc_link_fault_count_sync;
   output 	 remote_fault_oc_sync;
   output 	 local_fault_oc_sync;
   output 	 remote_fault_oc_txclk; // to tx_xmac to generate idle
   output 	 local_fault_oc_txclk;  // to tx_xmac to generate RF

   //
   wire 	 rx_reset;
   wire 	 hw_reset_rxnbclk;
   wire 	 rx_reset_nbclk;
   wire 	 tx_reset;
   wire 	 hw_reset_txnbclk;
   wire 	 tx_reset_nbclk;
   wire 	 clr_rx_reset_rxclk;
   wire 	 clr_tx_reset_txclk;
   
/**********************************************************************
 * RXMAC fifo section
 *********************************************************************/
   
 /* ---------------- from clk to rx_clk -------------------------- */

   // start 5bit rxfifo_g_rd_ptr_sync
SYNC_5bit rxfifo_g_rd_ptr_sync_SYNC_5bit (
                                .din(rxfifo_g_rd_ptr_clk),
                                .clk(rx_clk),
                                .qout(rxfifo_g_rd_ptr_sync));

 /* ---------------- from rx_clk to clk --------------------------- */

   // start 5-bit rxfifo_g_wr_ptr_sync
SYNC_5bit rxfifo_g_wr_ptr_sync_SYNC_5bit (
                                .din(rxfifo_g_wr_ptr_rxclk),
                                .clk(clk),
                                .qout(rxfifo_g_wr_ptr_sync));

SYNC_5bit srfifo_g_wr_ptr_sync_SYNC_5bit (
                                .din(srfifo_g_wr_ptr_rxclk),
                                .clk(clk),
                                .qout(srfifo_g_wr_ptr_sync));

/**********************************************************************
 * TXMAC fifo section
 *********************************************************************/
   
 /* ---------------- from tx_clk to clk --------------------------- */
   // start 5-bit txfifo_g_rd_ptr_sync

SYNC_5bit txfifo_g_rd_ptr_sync_SYNC_5bit (
                                .din(txfifo_g_rd_ptr_txclk[4:0]),
                                .clk(clk),
                                .qout(txfifo_g_rd_ptr_sync[4:0]));
   
   
 /* ---------------- from clk to tx_clk --------------------------- */

   // start 5-bit txfifo_g_wr_ptr_sync
SYNC_5bit txfifo_g_wr_ptr_sync_SYNC_5bit (
                                .din(txfifo_g_wr_ptr_clk[4:0]),
                                .clk(tx_clk),
                                .qout(txfifo_g_wr_ptr_sync[4:0]));

 /* ---------------- from tx_clk to clk --------------------------- */
   // start 5-bit stfifo_g_rd_ptr_sync

SYNC_5bit stfifo_g_rd_ptr_sync_SYNC_5bit (
                                .din(stfifo_g_rd_ptr_txclk[4:0]),
                                .clk(clk),
                                .qout(stfifo_g_rd_ptr_sync[4:0]));
   
 /* ---------------- from clk to tx_clk --------------------------- */

   // start 5-bit stfifo_g_wr_ptr_sync
SYNC_5bit stfifo_g_wr_ptr_sync_SYNC_5bit (
                                .din(stfifo_g_wr_ptr_clk[4:0]),
                                .clk(tx_clk),
                                .qout(stfifo_g_wr_ptr_sync[4:0]));


 /* --------------------------- rx_clk to clk --------------------- */
 SYNC_PLS rx_good_pkt_sync_SYNC_PLS(.src_pls(rx_good_pkt),
                                    .src_clk(rx_clk),
				    .src_reset(rx_reset),
                                    .des_clk(clk),
                                    .out_pls(rx_good_pkt_sync));

 SYNC_PLS rx_fc_pkt_ok_clk_SYNC_PLS(.src_pls(rx_fc_pkt_ok),
                                    .src_clk(rx_clk),
				    .src_reset(rx_reset),
                                    .des_clk(clk),
                                    .out_pls(rx_fc_pkt_ok_clk));

 SYNC_PLS inc_max_pkt_err_count_sync_SYNC_PLS(.src_pls(inc_max_pkt_err_count),
                                    .src_clk(rx_clk),
				    .src_reset(rx_reset),
                                    .des_clk(clk),
                                    .out_pls(inc_max_pkt_err_count_sync));

 SYNC_PLS inc_min_pkt_err_count_sync_SYNC_PLS(.src_pls(inc_min_pkt_err_count),
                                    .src_clk(rx_clk),
 				    .src_reset(rx_reset),
                                    .des_clk(clk),
                                    .out_pls(inc_min_pkt_err_count_sync));

 SYNC_PLS inc_code_viol_count_sync_SYNC_PLS(.src_pls(inc_code_viol_count),
                                    .src_clk(rx_clk),
				    .src_reset(rx_reset),
                                    .des_clk(clk),
                                    .out_pls(inc_code_viol_count_sync));

 SYNC_PLS inc_align_err_count_sync_SYNC_PLS(.src_pls(inc_align_err_count_nbclk),
                                    .src_clk(rx_clk),
				    .src_reset(rx_reset),
                                    .des_clk(clk),
                                    .out_pls(inc_align_err_count_sync));

 SYNC_PLS rxfifo_overrun_sync_SYNC_PLS(.src_pls(rxfifo_overrun_rxclk),
                                    .src_clk(rx_clk),
				    .src_reset(rx_reset),
                                    .des_clk(clk),
                                    .out_pls(rxfifo_overrun_sync));

 SYNC_PLS inc_crc_err_count_SYNC_PLS(.src_pls(inc_crc_err_count),
                                    .src_clk(rx_clk),
				    .src_reset(rx_reset),
                                    .des_clk(clk),
                                    .out_pls(inc_crc_err_count_sync));
   
 SYNC_CELL TOG_RX_BCNT_SYNC(.D(toggle_rx_bcount),.CP(clk),
                            .Q(toggle_rx_bcount_sync));

 SYNC_PLS inc_bcast_count_sync_SYNC_PLS(.src_pls(inc_bcast_count),
                                    .src_clk(rx_clk),
				    .src_reset(rx_reset),
                                    .des_clk(clk),
                                    .out_pls(inc_bcast_count_sync));

 SYNC_PLS inc_mcast_count_sync_SYNC_PLS(.src_pls(inc_mcast_count),
                                    .src_clk(rx_clk),
				    .src_reset(rx_reset),
                                    .des_clk(clk),
                                    .out_pls(inc_mcast_count_sync));

 SYNC_CELL rx_data_valid_gmux_reg_clk_SYNC(
                             .D(rx_data_valid_gmux_reg),.CP(clk),
                             .Q(rx_data_valid_gmux_reg_clk));


 // lfs related input signals
 SYNC_PLS inc_link_fault_count_sync_SYNC_PLS(.src_pls(inc_link_fault_count),
                                    .src_clk(rx_clk),
				    .src_reset(rx_reset),
                                    .des_clk(clk),
                                    .out_pls(inc_link_fault_count_sync));

 SYNC_CELL remote_fault_oc_sync_SYNC(.D(remote_fault_oc_reg),.CP(clk),
                                     .Q(remote_fault_oc_sync));
   
 SYNC_CELL local_fault_oc_sync_SYNC(.D(local_fault_oc_reg),.CP(clk),
                                    .Q(local_fault_oc_sync));

 /* ---------------------- rx_clk to rx_nbclk --------------------- */
 SYNC_CELL rxfifo_full_nbclk_SYNC_CELL (.D(rxfifo_full_rxclk_reg),
                                          .CP(rx_nbclk),
                                          .Q(rxfifo_full_nbclk));
   
 /* -------------------------- clk to rx_clk ---------------------- */
 SYNC_CELL SYNC_RX_RESET(.D(rx_reset_clk),.CP(rx_clk),
                         .Q(rx_reset));

// logic vision complains the back to back NEC synchronizer
// cell connection.  
// SYNC_CELL clr_rx_reset_rxclk_SYNC(.D(rx_reset),
//                                   .CP(rx_clk),
//                                   .Q(clr_rx_reset_rxclk));
// the following DFF is for delaying one tx_clk purpose.
 FD1  clr_rx_reset_rxclk_FD1(.CP(rx_clk),.D(rx_reset), 
                             .Q(clr_rx_reset_rxclk));
      
 SYNC_CELL SYNC_CLR_RX_RESET(.D(clr_rx_reset_rxclk),
                             .CP(clk),
                             .Q(clr_rx_reset_clk));
   
 SYNC_CELL rx_enable_rxclk_SYNC(.D(rx_enable),.CP(rx_clk),
                                .Q(rx_enable_rxclk));

  SYNC_CELL lfs_disable_rxclk_SYNC(.D(lfs_disable),
                                  .CP(rx_clk),
                                  .Q(lfs_disable_rxclk));

 /* -------------------------- clk to rx_nbclk --------------------- */
 SYNC_CELL hw_reset_rxnbclk_SYNC(.D(hw_reset),
                              .CP(rx_nbclk),
                              .Q(hw_reset_rxnbclk));
   
 SYNC_CELL rx_reset_nbclk_SYNC(.D(rx_reset_clk),
                               .CP(rx_nbclk),
                               .Q(rx_reset_nbclk));

 SYNC_CELL rx_enable_nbclk_SYNC(.D(rx_enable),
                                .CP(rx_nbclk),
                                .Q(rx_enable_nbclk));

 /* ---------------------- rx_clk to tx_clk ----------------------- */
 SYNC_PLS rx_fc_pkt_ok_txclk_SYNC_PLS(.src_pls(rx_fc_pkt_ok),
                                    .src_clk(rx_clk),
				    .src_reset(rx_reset),
                                    .des_clk(tx_clk),
                                    .out_pls(rx_fc_pkt_ok_txclk));
// to tx_xmac to generate IDLE
 SYNC_CELL remote_fault_oc_txclk_SYNC(.D(remote_fault_oc_reg),.CP(tx_clk),
                                      .Q(remote_fault_oc_txclk));
// to tx_xmac to generate RF
 SYNC_CELL local_fault_oc_txclk_SYNC(.D(local_fault_oc_reg),.CP(tx_clk),
                                     .Q(local_fault_oc_txclk));

 /* --------------------------- tx_clk to clk --------------------- */
 SYNC_CELL PAUSED_SNC(.D(paused_state),.CP(clk),.Q(paused_state_sync));

 SYNC_PLS TX_PKT_OK_SYNC_PLS(.src_pls(set_tx_pkt_ok),
                             .src_clk(tx_clk),
                             .src_reset(tx_reset),
                             .des_clk(clk),
                             .out_pls(set_tx_pkt_ok_sync));
   
 SYNC_PLS txfifo_underrun_sync_SYNC_PLS(.src_pls(txfifo_underrun_txclk),
                                    .src_clk(tx_clk),
				    .src_reset(tx_reset),
                                    .des_clk(clk),
                                    .out_pls(txfifo_underrun_sync));

 SYNC_PLS txfifo_xfr_err_syn_SYNC_PLS(.src_pls(txfifo_xfr_err),
                                    .src_clk(tx_clk),
				    .src_reset(tx_reset),
                                    .des_clk(clk),
                                    .out_pls(txfifo_xfr_err_sync));

 SYNC_PLS tx_max_pkt_size_err_syn_SYNC_PLS(.src_pls(tx_max_pkt_size_err),
                                    .src_clk(tx_clk),
				    .src_reset(tx_reset),
                                    .des_clk(clk),
                                    .out_pls(tx_max_pkt_size_err_sync));

 SYNC_CELL TOG_TX_BCNT_SYNC(.D(toggle_tx_bcount),.CP(clk),
                            .Q(toggle_tx_bcount_sync));

 SYNC_CELL TOG_TX_FRAME_SYNC(.D(toggle_txframe_count),.CP(clk),
                             .Q(toggle_txframe_count_sync));

 SYNC_CELL tx_data_valid_clk_SYNC(.D(tx_data_valid),.CP(clk),
                             .Q(tx_data_valid_clk));

 /* -------------------------- clk to tx_clk ---------------------- */
 SYNC_CELL TX_CLK_RESET_SYNC(.D(tx_reset_clk),.CP(tx_clk),.Q(tx_reset));

// logic vision complains the back to back NEC synchronizer
// cell connection.  
// SYNC_CELL clr_tx_reset_txclk_SYNC(.D(tx_reset),
//                                   .CP(tx_clk),
//                                   .Q(clr_tx_reset_txclk));
// the following DFF is for delaying one tx_clk purpose.
 FD1 clr_rx_reset_txclk_FD1(.CP(tx_clk), .D(tx_reset), .Q(clr_tx_reset_txclk));
   
 SYNC_CELL SYNC_CLR_TX_RESET(.D(clr_tx_reset_txclk),
                             .CP(clk),
                             .Q(clr_tx_reset_clk));

 SYNC_CELL tx_enable_txclk_SYNC(.D(tx_enable),
                                .CP(tx_clk),
                                .Q(tx_enable_txclk));

 SYNC_CELL tx_output_en_txclk_SYNC(.D(tx_output_en),
                                   .CP(tx_clk),
                                   .Q(tx_output_en_txclk));

 /* -------------------------- clk to tx_nbclk --------------------- */
 SYNC_CELL hw_reset_txnbclk_SYNC(.D(hw_reset),
                              .CP(tx_nbclk),
                              .Q(hw_reset_txnbclk));

 SYNC_CELL tx_reset_nbclk_SYNC(.D(tx_reset_clk),
                               .CP(tx_nbclk),
                               .Q(tx_reset_nbclk));

 SYNC_CELL tx_output_en_nbclk_SYNC(.D(tx_output_en),
                                    .CP(tx_nbclk),
                                    .Q(tx_output_en_nbclk));

 /* -------------------------- tx_nbclk to clk --------------------- */
 /* ---------------------------------------------------------------- */
 /* -------------------------- clk to tx_nbclk --------------------- */
 /* -------------------------- tx_clk to rx_clk -------------------- */
   
endmodule // xmac_sync

