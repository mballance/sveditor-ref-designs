// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xmac_slv.v
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
 * File Name    : xmac_slv.v
 * Author Name  : John Lo
 * Description  : It contains PIO read/write decoder, registers, sw_if etc.
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

`include  "xmac.h"

module xmac_slv
  (/*AUTOARG*/
   // Outputs
   pio_ack, pio_rd_data, pio_err, xmac_debug, mac_debug_sel, 
   strip_crc, addr_filter_en, hash_filter_en, alt_addr_comp_en, 
   mac_alt_addr0, mac_alt_addr1, mac_alt_addr2, mac_alt_addr3, 
   mac_alt_addr4, mac_alt_addr5, mac_alt_addr6, mac_alt_addr7, 
   mac_alt_addr8, mac_alt_addr9, mac_alt_addr10, mac_alt_addr11, 
   mac_alt_addr12, mac_alt_addr13, mac_alt_addr14, mac_alt_addr15, 
   addr_filter, addr_filter_mask_msb, addr_filter_mask_lsb, 
   hash_table, mac_host_info0, mac_host_info1, mac_host_info2, 
   mac_host_info3, mac_host_info4, mac_host_info5, mac_host_info6, 
   mac_host_info7, mac_host_info8, mac_host_info9, mac_host_info10, 
   mac_host_info11, mac_host_info12, mac_host_info13, 
   mac_host_info14, mac_host_info15, mac_host_info16, 
   mac_host_info17, mac_host_info18, mac_host_info19, pcs_bypass, 
   xpcs_bypass, force_LED_on, led_polarity, activity_led, hw_reset, 
   rx_reset_clk, tx_reset_clk, sys_clk_count, txmac_interrupt, 
   rxmac_interrupt, xmac_fc_interrupt, no_tx_min_pkt_size_chk, 
   no_rx_min_pkt_size_chk, always_no_crc, var_min_ipg_en, tx_enable, 
   rx_enable, promisc_all, err_chk_dis, crc_chk_dis, 
   code_viol_chk_dis, promisc_group, reserve_multicast, rx_pause_en, 
   pass_fc, tx_output_en, loopback, sel_por_clk_src, sel_clk_25mhz, 
   mii_mode, gmii_mode, xgmii_mode, mii_or_gmii_mode, lfs_disable, 
   warning_msg_en, ipg_value, ipg_value1, stretch_ratio, 
   stretch_constant, stretch_mode, slot_time, tx_min_pkt_size, 
   rx_min_pkt_size, max_pkt_size, mac_unique_addr, wr_en, rd_en, 
   rac_pls, 
   // Inputs
   clk, clr_rx_reset_clk, clr_tx_reset_clk, pio_core_reset, 
   pio_core_sel, pio_rd, pio_addr, pio_wr_data, pause_time, 
   rxfifo_underrun_clk, rxfifo_overrun_sync, rx_good_pkt_sync, 
   rx_fc_pkt_ok_clk, inc_max_pkt_err_count_sync, 
   inc_min_pkt_err_count_sync, inc_code_viol_count_sync, 
   inc_align_err_count_sync, inc_crc_err_count_sync, 
   toggle_rx_bcount_sync, inc_bcast_count_sync, inc_mcast_count_sync, 
   inc_histo_cntr1, inc_histo_cntr2, inc_histo_cntr3, 
   inc_histo_cntr4, inc_histo_cntr5, inc_histo_cntr6, 
   inc_histo_cntr7, rx_data_valid_gmux_reg_clk, rx_pa_data, 
   set_tx_pkt_ok_sync, paused_state_sync, txfifo_underrun_sync, 
   txfifo_xfr_err_sync, tx_max_pkt_size_err_sync, txfifo_overrun_clk, 
   toggle_tx_bcount_sync, toggle_txframe_count_sync, 
   tx_data_valid_clk, inc_link_fault_count_sync, 
   remote_fault_oc_sync, local_fault_oc_sync, ipp_rxmac_req, 
   rxmac_ipp_ack, rxmac_ipp_tag, rxmac_ipp_ctrl, rxmac_ipp_stat, 
   txmac_opp_req, opp_txmac_ack, opp_txmac_tag, opp_txmac_stat, 
   opp_txmac_abort, rxfifo_full_clk_reg, rxfifo_empty_clk_reg, 
   rxfifo_rd_ptr_clk, rxfifo_wr_ptr_clk, S_detected_reg, 
   T_E_detected_at_modified_pkt_reg, 
   END_PKT_ERR_detected_a_at_modified_pkt_reg, 
   END_PKT_ERR_detected_b_at_modified_pkt_reg, S_D_reg, S_I_reg, 
   D_S_reg, I_S_reg, abort_bit_reg, rx_err_reg, crc_error_reg, 
   kill_data_ready_reg, kill_crc_reg, rx_sel_reg, 
   txfifo_full_clk_reg, txfifo_empty_clk_reg, tx_swap_reg, tx_on_reg, 
   tx_on_half_reg, back2back_swap_reg1, replace_txd_time_reg, 
   adjust2crc_full_case_last_byte_position_reg, 
   adjust2crc_full_case_last_byte_position_is_3_or_7_reg, 
   stretch_clks_reg, full_case_last_byte_position_reg, 
   stretch_full_case_last_byte_position_reg, stretch_bytes_reg, 
   minus_4bytes_reg, B_eop_reg, stretch_1_more_clk_reg, 
   no_wasted_BW_reg, ipg_done_trail_temp_reg, tx_byte0_reg0, 
   restart_ipg_timer_reg, eop_txclk_reg0, eop_w_fcs_reg0, 
   tx_abort_reg0, eop_w_fcs_reg1, tx_abort_reg1, ipg_done_reg, 
   ipg_done_lead_temp_reg, force_ipg_done_lead_reg, 
   set_back2back_reg, back2back_reg, txfifo_rd_ptr_clk, 
   txfifo_wr_ptr_clk, last_byte_position, mgrlm_state, xrlm_state, 
   sop_state, xtlm_state, lfs_state, xpcs_rxc, xpcs_rxd, xpcs_txc, 
   xpcs_txd, rx_heart_beat_timer_reg, tx_heart_beat_timer_reg, 
   tx_clk_div2, rx_clk_div2, tx_nbclk_div2, rx_nbclk_div2, MDINT
   );
   

   // global signals
   input            clk;
   input  	    clr_rx_reset_clk;    
   input  	    clr_tx_reset_clk;    
   input 	    pio_core_reset;   // becomes hw_reset
   input 	    pio_core_sel;     // sel
   output 	    pio_ack;
   input            pio_rd;           // r/w
   input [8:0]      pio_addr;         // address
   input [31:0]     pio_wr_data;      // wr_data
   output [31:0]    pio_rd_data;      // rd_data
   output 	    pio_err;
   // RxMac related input signals        
   input [15:0]     pause_time;// directly from address_decoder.
   input 	    rxfifo_underrun_clk;
   input 	    rxfifo_overrun_sync;
   input  	    rx_good_pkt_sync;    
   input  	    rx_fc_pkt_ok_clk;    
   input  	    inc_max_pkt_err_count_sync;
   input  	    inc_min_pkt_err_count_sync;
   input  	    inc_code_viol_count_sync;
   input  	    inc_align_err_count_sync;
   input  	    inc_crc_err_count_sync;
   input  	    toggle_rx_bcount_sync;
   input  	    inc_bcast_count_sync;
   input  	    inc_mcast_count_sync;
   input 	    inc_histo_cntr1;
   input 	    inc_histo_cntr2;
   input 	    inc_histo_cntr3;
   input 	    inc_histo_cntr4;
   input 	    inc_histo_cntr5;
   input 	    inc_histo_cntr6;
   input 	    inc_histo_cntr7;
   input 	    rx_data_valid_gmux_reg_clk;
   input [63:0]     rx_pa_data;
   // TxMac status register related input  signals
   input 	    set_tx_pkt_ok_sync;
   input 	    paused_state_sync;
   input 	    txfifo_underrun_sync;
   input 	    txfifo_xfr_err_sync;
   input 	    tx_max_pkt_size_err_sync;
   input 	    txfifo_overrun_clk;
   input  	    toggle_tx_bcount_sync;
   input 	    toggle_txframe_count_sync;
   input 	    tx_data_valid_clk;
   // lfs related input signals
   input 	    inc_link_fault_count_sync;
   input 	    remote_fault_oc_sync;
   input 	    local_fault_oc_sync;
   // important interface signals
   input 	    ipp_rxmac_req;
   input	    rxmac_ipp_ack;
   input 	    rxmac_ipp_tag;
   input 	    rxmac_ipp_ctrl;
   input [`TBITS]   rxmac_ipp_stat;
   //
   input 	    txmac_opp_req;
   input            opp_txmac_ack;
   input            opp_txmac_tag;
   input  [3:0]     opp_txmac_stat;
   input 	    opp_txmac_abort;
   // important rx_xmac internal signals
   input 	    rxfifo_full_clk_reg;
   input 	    rxfifo_empty_clk_reg;
   input  [4:0]     rxfifo_rd_ptr_clk; 
   input  [4:0]     rxfifo_wr_ptr_clk; 
   input 	    S_detected_reg;
   input 	    T_E_detected_at_modified_pkt_reg;
   input 	    END_PKT_ERR_detected_a_at_modified_pkt_reg;
   input 	    END_PKT_ERR_detected_b_at_modified_pkt_reg;
   input 	    S_D_reg;
   input 	    S_I_reg;
   input 	    D_S_reg;
   input 	    I_S_reg;
   input 	    abort_bit_reg;
   input 	    rx_err_reg;
   input 	    crc_error_reg;
   input 	    kill_data_ready_reg;
   input 	    kill_crc_reg;
   input [1:0] 	    rx_sel_reg;
   // important tx_xmac internal signals
   input 	    txfifo_full_clk_reg;
   input 	    txfifo_empty_clk_reg;
   input 	    tx_swap_reg;
   input 	    tx_on_reg;
   input 	    tx_on_half_reg;
   input 	    back2back_swap_reg1;
   input 	    replace_txd_time_reg;
   input [2:0]      adjust2crc_full_case_last_byte_position_reg;
   input 	    adjust2crc_full_case_last_byte_position_is_3_or_7_reg;
   input [`BYTE]    stretch_clks_reg;
   input [2:0]      full_case_last_byte_position_reg;
   input [3:0]      stretch_full_case_last_byte_position_reg;
   input [2:0]      stretch_bytes_reg;
   input 	    minus_4bytes_reg;
   input 	    B_eop_reg;
   input 	    stretch_1_more_clk_reg;
   input 	    no_wasted_BW_reg;
   input 	    ipg_done_trail_temp_reg;
   input [7:0] 	    tx_byte0_reg0;
   input 	    restart_ipg_timer_reg;
   input 	    eop_txclk_reg0;
   input 	    eop_w_fcs_reg0;
   input 	    tx_abort_reg0;
   input 	    eop_w_fcs_reg1;
   input 	    tx_abort_reg1;
   input 	    ipg_done_reg;
   input 	    ipg_done_lead_temp_reg;
   input 	    force_ipg_done_lead_reg;
   input 	    set_back2back_reg;
   input 	    back2back_reg;
                    //
   input [4:0]      txfifo_rd_ptr_clk;
   input [4:0] 	    txfifo_wr_ptr_clk;
   input [2:0]      last_byte_position;
   // state machine
   input 	    mgrlm_state;
   input 	    xrlm_state;
   input            sop_state;
   input [2:0]	    xtlm_state;
   input [1:0] 	    lfs_state;
   input [7:0] 	    xpcs_rxc;
   input [63:0]     xpcs_rxd;
   input [7:0] 	    xpcs_txc;
   input [63:0]     xpcs_txd;
   // internal signals
   input [3:0] 	    rx_heart_beat_timer_reg;
   input [3:0]	    tx_heart_beat_timer_reg;
                    // output signals
   output [31:0]    xmac_debug;
   output [2:0]     mac_debug_sel;
   // start of ALT_ADDR_AND_HASH_FUNC specific signals
   output 	    strip_crc;
   output 	    addr_filter_en;
   output 	    hash_filter_en;
   output [15:0]    alt_addr_comp_en;
   output [47:0]    mac_alt_addr0;
   output [47:0]    mac_alt_addr1;
   output [47:0]    mac_alt_addr2;
   output [47:0]    mac_alt_addr3;
   output [47:0]    mac_alt_addr4;
   output [47:0]    mac_alt_addr5;
   output [47:0]    mac_alt_addr6;
   output [47:0]    mac_alt_addr7;
   output [47:0]    mac_alt_addr8;
   output [47:0]    mac_alt_addr9;
   output [47:0]    mac_alt_addr10;
   output [47:0]    mac_alt_addr11;
   output [47:0]    mac_alt_addr12;
   output [47:0]    mac_alt_addr13;
   output [47:0]    mac_alt_addr14;
   output [47:0]    mac_alt_addr15;
   output [47:0]    addr_filter;
   output [7:0]     addr_filter_mask_msb;
   output [15:0]    addr_filter_mask_lsb;
   output [255:0]   hash_table;
   output [`H_INFO] mac_host_info0 ;
   output [`H_INFO] mac_host_info1 ;
   output [`H_INFO] mac_host_info2 ;
   output [`H_INFO] mac_host_info3 ;
   output [`H_INFO] mac_host_info4 ;
   output [`H_INFO] mac_host_info5 ;
   output [`H_INFO] mac_host_info6 ;
   output [`H_INFO] mac_host_info7 ;
   output [`H_INFO] mac_host_info8 ;
   output [`H_INFO] mac_host_info9 ;
   output [`H_INFO] mac_host_info10;
   output [`H_INFO] mac_host_info11;
   output [`H_INFO] mac_host_info12;
   output [`H_INFO] mac_host_info13;
   output [`H_INFO] mac_host_info14;
   output [`H_INFO] mac_host_info15;
   output [`H_INFO] mac_host_info16;
   output [`H_INFO] mac_host_info17;
   output [`H_INFO] mac_host_info18;
   output [`H_INFO] mac_host_info19;
   // end of ALT_ADDR_AND_HASH_FUNC specific signals
   // start of pcs signals
   output 	    pcs_bypass;
   output 	    xpcs_bypass;
   output 	    force_LED_on;
   output 	    led_polarity;
   output 	    activity_led;
   // end of pcs signals
   output 	    hw_reset;
   output 	    rx_reset_clk; // rxfifo_unload.v and xmac_sync.v
   output 	    tx_reset_clk; // txfifo_load.v   and xmac_sync.v
   output [2:0]     sys_clk_count;
   output 	    txmac_interrupt;
   output 	    rxmac_interrupt;
   output 	    xmac_fc_interrupt;
   output 	    no_tx_min_pkt_size_chk;
   output 	    no_rx_min_pkt_size_chk;
   output 	    always_no_crc;
   output 	    var_min_ipg_en;
   output 	    tx_enable;
   output 	    rx_enable;
   output 	    promisc_all;
   output 	    err_chk_dis;
   output 	    crc_chk_dis;
   output 	    code_viol_chk_dis;
   output 	    promisc_group;
   output 	    reserve_multicast;
   output 	    rx_pause_en;
   output 	    pass_fc;
   output 	    tx_output_en;
   output 	    loopback;
   output 	    sel_por_clk_src;
   output 	    sel_clk_25mhz;
   output 	    mii_mode;
   output 	    gmii_mode;
   output 	    xgmii_mode;
   output 	    mii_or_gmii_mode;
   output 	    lfs_disable;
   output 	    warning_msg_en;
   output [2:0]     ipg_value;
   output [`BYTE]   ipg_value1;
   output [4:0]     stretch_ratio;
   output [2:0]     stretch_constant;
   output 	    stretch_mode;
   output [`BYTE]   slot_time;
   output [9:0]     tx_min_pkt_size;
   output [9:0]     rx_min_pkt_size;
   output [13:0]    max_pkt_size;
   output [47:0]    mac_unique_addr;
   // internal signal observation
   output 	    wr_en;
   output 	    rd_en;
   output 	    rac_pls;
   // clock observation point signals
   input 	    tx_clk_div2;
   input 	    rx_clk_div2;
   input 	    tx_nbclk_div2;
   input 	    rx_nbclk_div2;
   // PMD signals
   input 	    MDINT;
 
   reg  [31:0] 	    training_vector;
   reg              non_qualified_addr_err;
   reg  [31:0]      rd_data;
   reg              ld_debug_reg;
   reg 		    ld_training_vector;
   reg              ld_tx_sw_reset_clk;
   reg              ld_tx_reg_reset;
   reg              ld_rx_sw_reset_clk;
   reg              ld_rx_reg_reset;
   reg              rac_tx_status;
   reg              ld_tx_status;
   reg              rac_rx_status;
   reg              ld_rx_status;
   reg              rac_fc_status;
   reg              ld_fc_status;
   reg              ld_tx_mask;
   reg              ld_rx_mask;
   reg              ld_fc_mask;
   reg              ld_mac_config;
   reg              ld_ipg_values;
   reg              ld_minpkt_slot_pa_sizes;
   reg              ld_max_pkt_burst_sizes;
   reg  [2:0]       ld_mac_unique_addr;
   reg              rac_rx_byte_cntr;
   reg              ld_rx_byte_cntr;
   reg              rac_bcast_cntr;
   reg              ld_bcast_cntr;
   reg              rac_mcast_cntr;
   reg              ld_mcast_cntr;
   reg              rac_fragment_cntr;
   reg              ld_fragment_cntr;
   reg              rac_histo_cntr1;
   reg              ld_histo_cntr1;
   reg              rac_histo_cntr2;
   reg              ld_histo_cntr2;
   reg              rac_histo_cntr3;
   reg              ld_histo_cntr3;  
   reg              rac_histo_cntr4;
   reg              ld_histo_cntr4;
   reg              rac_histo_cntr5;
   reg              ld_histo_cntr5;
   reg              rac_histo_cntr6;
   reg              ld_histo_cntr6;
   reg              rac_histo_cntr7;
   reg              ld_histo_cntr7;
   reg              rac_max_pkt_err_cntr;
   reg              ld_max_pkt_err_cntr;
   reg              rac_crc_err_cntr;
   reg              ld_crc_err_cntr;
   reg              rac_code_viol_cntr;
   reg              ld_code_viol_cntr;
   reg              rac_align_err_cntr;
   reg              ld_align_err_cntr;
   reg              rac_tx_frame_cntr;
   reg              ld_tx_frame_cntr;
   reg              rac_tx_byte_cntr;
   reg              ld_tx_byte_cntr;
   reg              rac_link_fault_cntr;
   reg              ld_link_fault_cntr;   
   
   reg 		    pio_ack_p1;
   reg 		    pio_ack;
   reg 		    pio_err_p1;
   reg 		    pio_err;
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
// End of automatics
   wire [31:0]      pio_rd_data;
   wire [31:0]      pio_wr_data;
   wire [31:0]      wr_data;
   wire 	    core_sel_lead;
   wire 	    core_sel;
   wire 	    core_sel1;
   wire             rd_wr,wr_en,rd_en,rac_pls;
   wire [8:0]       reg_offset,pio_addr;
   wire             rx_reg_reset,tx_reg_reset;
   wire [31:0]      tx_status_dout,rx_status_dout,fc_status_dout,
                    tx_mask_dout,rx_mask_dout,fc_mask_dout;
   wire [2:0]       ipg_value;
   wire [4:0] 	    reserved_ipg;
   wire [`BYTE]     ipg_value1;
   wire [7:0]       tx_config_dout;
   wire [10:0]      rx_config_dout;
   wire [1:0]       fc_config_dout;
   wire [10:0]      xif_config_dout;
   wire [20:0]      bcast_count;
   wire [20:0]      mcast_count;
   wire [47:0]      mac_unique_addr;
   wire [31:0]      rx_byte_count_stat,tx_byte_count_stat;
   wire [31:0]      tx_frame_count_stat;
   wire [20:0]      fragment_count;
   wire [7:0]       max_pkt_err_count;
   wire [7:0]       crc_err_count;
   wire [7:0]       code_viol_count;
   wire [7:0]       align_err_count;
   wire [7:0]       link_fault_count;
   wire [9:0]       tx_min_pkt_size;
   wire [9:0]       rx_min_pkt_size;
   wire             new_tx_reset_clk,new_rx_reset_clk,
                    set_tx_byte_count_exp,tx_byte_count_exp,
                    set_tx_frame_count_exp,tx_frame_count_exp,
                    set_crc_err_cntr_exp,crc_err_cntr_exp,
                    set_max_pkt_err_cntr_exp,max_pkt_err_cntr_exp,
                    set_code_viol_cntr_exp,code_viol_cntr_exp,
                    set_rx_byte_count_exp,rx_byte_count_exp,
                    set_histo_count1_exp,histo_count1_exp,
                    set_histo_count2_exp,histo_count2_exp,
                    set_histo_count3_exp,histo_count3_exp,
                    set_histo_count4_exp,histo_count4_exp,
                    set_histo_count5_exp,histo_count5_exp,
                    set_histo_count6_exp,histo_count6_exp,
                    set_histo_count7_exp,histo_count7_exp,
                    set_bcast_count_exp,bcast_count_exp,
                    set_mcast_count_exp,mcast_count_exp,
                    set_fragment_count_exp,fragment_count_exp,
	            set_link_fault_cntr_exp,
                    tx_paused_status,not_tx_paused_status,
                    inc_rx_bcount;
                         
   wire  	    ipp_rxmac_req;
   wire 	    rxmac_ipp_ack;
   wire  	    rxmac_ipp_tag;
   wire  	    rxmac_ipp_ctrl;
   wire [`TBITS]    rxmac_ipp_stat;
   wire 	    txmac_opp_req;
   wire 	    opp_txmac_ack;
   wire 	    opp_txmac_tag;
   wire [3:0] 	    opp_txmac_stat;
   wire 	    opp_txmac_abort;

   reg 		    ipp_rxmac_req_reg;
   reg 		    rxmac_ipp_ack_reg;
   reg 		    rxmac_ipp_tag_reg;
   reg 		    rxmac_ipp_ctrl_reg;
   reg [`TBITS]     rxmac_ipp_stat_reg;
   reg 		    txmac_opp_req_reg;
   reg 		    opp_txmac_ack_reg;
   reg 		    opp_txmac_tag_reg;
   reg [3:0] 	    opp_txmac_stat_reg;
   reg 		    opp_txmac_abort_reg;

   wire 	    change_clk_source_pls;
   wire             d_mii_mode;
   wire             d_gmii_mode;
   wire             d_loopback;
   wire             d_sel_por_clk_src;
   wire             mii_or_gmii_mode = mii_mode | gmii_mode;
   wire [2:0] 	    sys_clk_count;
   wire 	    tx_reset_clk;
   wire 	    rx_reset_clk;
   wire [20:0] 	    histo_count1;
   wire [20:0] 	    histo_count2;
   wire [19:0] 	    histo_count3;
   wire [18:0] 	    histo_count4;
   wire [17:0] 	    histo_count5;
   wire [16:0] 	    histo_count6;
   wire [20:0] 	    histo_count7;
   wire [7:0] 	    debug_reg;
   wire [31:0] 	    state_machine0;
   wire [31:0] 	    internal_signals1;
   wire [31:0] 	    internal_signals2;
   wire [31:0] 	    rx_internal_signals1;
   wire [31:0] 	    tx_internal_signals1;
   wire [31:0] 	    tx_internal_signals2;
   wire             d_hw_reset,frame_transmitted,txfifo_underflow,
		    tx_max_pkt_size_err,txfifo_overflow,
		    txfifo_xfr_err,frame_received,rxfifo_overflow,
		    rxfifo_underflow,
		    mdint_oc,link_fault_cntr_exp,
		    remote_fault_oc_pls,remote_fault_status,
		    local_fault_oc_pls,local_fault_status,
		    paused_state_sync_lead,paused_state_sync_trail,
		    pause_rcvd,d_sel_clk_25mhz,d_pcs_bypass,
		    d_toggle_rx_bcount_sync,
		    rx_byte_count_stat_reached,d_toggle_tx_bcount_sync,
		    tx_byte_count_stat_reached,d_toggle_txframe_count_sync,
		    tx_frame_count_stat_reached,set_tx_led_pls,
		    set_rx_led_pls;
   
// vlint flag_net_has_no_load            off
// vlint flag_dangling_net_within_module off
   wire 	    core_sel_trail;
   wire 	    set_align_err_cntr_exp;
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load            on

   
`ifdef  ALT_ADDR_AND_HASH_FUNC

   reg  	    ld_alt_addr_comp_en;
   reg [2:0] 	    ld_mac_alt_addr0 ;
   reg [2:0] 	    ld_mac_alt_addr1 ;
   reg [2:0] 	    ld_mac_alt_addr2 ;
   reg [2:0] 	    ld_mac_alt_addr3 ;
   reg [2:0] 	    ld_mac_alt_addr4 ;
   reg [2:0] 	    ld_mac_alt_addr5 ;
   reg [2:0] 	    ld_mac_alt_addr6 ;
   reg [2:0] 	    ld_mac_alt_addr7 ;
   reg [2:0] 	    ld_mac_alt_addr8 ;
   reg [2:0] 	    ld_mac_alt_addr9 ;
   reg [2:0] 	    ld_mac_alt_addr10;
   reg [2:0] 	    ld_mac_alt_addr11;
   reg [2:0] 	    ld_mac_alt_addr12;
   reg [2:0] 	    ld_mac_alt_addr13;
   reg [2:0] 	    ld_mac_alt_addr14;
   reg [2:0] 	    ld_mac_alt_addr15;
   reg [2:0]        ld_addr_filter;
   reg              ld_addr_filter_mask_msb,
                    ld_addr_filter_mask_lsb;
   reg [15:0] 	    ld_hash_table;
   reg         	    ld_mac_host_info0 ;
   reg         	    ld_mac_host_info1 ;
   reg         	    ld_mac_host_info2 ;
   reg         	    ld_mac_host_info3 ;
   reg         	    ld_mac_host_info4 ;
   reg         	    ld_mac_host_info5 ;
   reg         	    ld_mac_host_info6 ;
   reg         	    ld_mac_host_info7 ;
   reg         	    ld_mac_host_info8 ;
   reg         	    ld_mac_host_info9 ;
   reg         	    ld_mac_host_info10;
   reg         	    ld_mac_host_info11;
   reg         	    ld_mac_host_info12;
   reg         	    ld_mac_host_info13;
   reg         	    ld_mac_host_info14;
   reg         	    ld_mac_host_info15;
   reg         	    ld_mac_host_info16;
   reg         	    ld_mac_host_info17;
   reg         	    ld_mac_host_info18;
   reg         	    ld_mac_host_info19;
   wire 	    ALT_ADDR_AND_HASH_FUNC_value = 1;
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
`else // !ifdef ALT_ADDR_AND_HASH_FUNC
   wire 	    ALT_ADDR_AND_HASH_FUNC_value = 0;
`endif // ifdef ALT_ADDR_AND_HASH_FUNC

`ifdef XGMII_ONLY
   wire 	    XGMII_ONLY_value = 1;
`else
   wire 	    XGMII_ONLY_value = 0;
`endif



/* ----------- Read and Write logic ---------------------------------- */

//***** Register the bif interface signals *********************
// To reduce gate count -> take register away
// If there is a timing problem then register them again here. 
//**************************************************************


   FD1 core_reset_FD1 (.D(pio_core_reset),.CP(clk),.Q(hw_reset));
   FD1 rd_wr_FD1      (.D(pio_rd),        .CP(clk),.Q(rd_wr));
   FD1 core_sel_FD1   (.D(pio_core_sel),  .CP(clk),.Q(core_sel));
   FD1 core_sel1_FD1  (.D(pio_core_sel),  .CP(clk),.Q(core_sel1)); // duplicat core_sel

   RegDff #(9) reg_offset_RegDff(.din(pio_addr),
                                 .clk(clk),   
                                 .qout(reg_offset));

   RegDff #(32) wr_data_RegDff  (.din(pio_wr_data[31:0]),
                                 .clk(clk),   
                                 .qout(wr_data[31:0]));

   PlsGen2 core_sel_PlsGen2(.sig_in(core_sel),.clk(clk),
                            .lead(core_sel_lead),
                            .trail(core_sel_trail));

   assign    rd_en   = core_sel       &   rd_wr;
   assign    wr_en   = core_sel_lead  & (~rd_wr);
   assign    rac_pls = pio_ack        &   rd_wr;

   assign    pio_rd_data = rd_data;
   
   always @ (posedge clk)
     begin
	pio_ack_p1 <= core_sel_lead;
	pio_ack    <= pio_ack_p1;
     end

   always @ (posedge clk)
     begin
        pio_err_p1 <= core_sel_lead & non_qualified_addr_err;
	pio_err    <= pio_err_p1;
     end

   
   FD1 D_HW_RESET_FF(.D(hw_reset),.CP(clk),.Q(d_hw_reset));
   counter_X3 SYS_CLK_DIVIDER(clk,hw_reset & !d_hw_reset,1'b1,
                              sys_clk_count[2:0]);
   
   
/* ----------- Read and Write Address Decoder -------------------------- */
always @ (posedge clk)
begin
  if (core_sel1)   
    case (reg_offset[8:0]) //synopsys parallel_case full_case
    9'h0:begin
            ld_tx_sw_reset_clk      <= wr_en & wr_data[0];
            ld_tx_reg_reset         <= wr_en & wr_data[1];
            rd_data <= {30'h0,tx_reg_reset,tx_reset_clk};
         end // case: 9'h0
     
    9'h1:begin
            ld_rx_sw_reset_clk      <= wr_en & wr_data[0];
            ld_rx_reg_reset         <= wr_en & wr_data[1];
            rd_data <= {30'h0,rx_reg_reset,rx_reset_clk};
         end // case: 9'h1
     
    9'h4:begin
            rac_tx_status           <= rac_pls;
            ld_tx_status            <= wr_en;
            rd_data                 <= tx_status_dout;
         end
    9'h5:begin   
            rac_rx_status           <= rac_pls;
            ld_rx_status            <= wr_en;
            rd_data                 <= rx_status_dout;
         end
    9'h6:begin   
            rac_fc_status           <= rac_pls;
            ld_fc_status            <= wr_en;
            rd_data                 <= fc_status_dout;
         end
    9'h8:begin
            ld_tx_mask              <= wr_en;
            rd_data                 <= tx_mask_dout;
         end // case: 9'h8
     
    9'h9:begin
            ld_rx_mask              <= wr_en;
            rd_data                 <= rx_mask_dout;
         end // case: 9'h9
     
    9'hA:begin
            ld_fc_mask              <= wr_en;
            rd_data                 <= fc_mask_dout;
         end // case: 9'hA
     
    9'hC:begin
            ld_mac_config           <= wr_en;
            rd_data                 <= {xif_config_dout,  // 11 bits [31:21]
                                       fc_config_dout,    // 2  bits [20:19]
                                       rx_config_dout,    // 11 bits [18:8]
                                       tx_config_dout};   // 8  bits [7:0]
         end // case: 9'hC

    9'h10:begin
            ld_ipg_values           <= wr_en;
            rd_data                 <= {8'b0,
                                       stretch_constant[2:0],
                                       stretch_ratio[4:0],
                                       ipg_value1[7:0],
				       reserved_ipg[4:0],
                                       ipg_value[2:0]};
          end // case: 9'h10
     
    9'h11:begin
            ld_minpkt_slot_pa_sizes <= wr_en;
            rd_data                 <= {2'h0,rx_min_pkt_size,2'b0,slot_time,tx_min_pkt_size};
          end // case: 9'h11
     
    9'h12:begin
            ld_max_pkt_burst_sizes  <= wr_en;
            rd_data                 <= {18'b0,max_pkt_size};
          end // case: 9'h12
     
    9'h14:begin
            ld_mac_unique_addr[0]   <= wr_en;
            rd_data                 <= {16'h0,mac_unique_addr[47:32]};
          end // case: 9'h14
     
    9'h15:begin
            ld_mac_unique_addr[1]   <= wr_en;  
            rd_data                 <= {16'h0,mac_unique_addr[31:16]};
          end // case: 9'h15
     
    9'h16:begin
            ld_mac_unique_addr[2]   <= wr_en;
            rd_data                 <= {16'h0,mac_unique_addr[15:0]};
          end // case: 9'h16

    9'h20:begin
            rac_rx_byte_cntr        <= rac_pls;
            ld_rx_byte_cntr         <= wr_en;
            rd_data                 <= rx_byte_count_stat;
          end // case: 9'h20
     
    9'h21:begin
            rac_bcast_cntr          <= rac_pls;
            ld_bcast_cntr           <= wr_en;
            rd_data                 <= {11'h0,bcast_count};
          end // case: 9'h21
     
    9'h22:begin
            rac_mcast_cntr          <= rac_pls;
            ld_mcast_cntr           <= wr_en;
            rd_data                 <= {11'h0,mcast_count};
          end // case: 9'h22
     
    9'h23:begin
            rac_fragment_cntr       <= rac_pls;
            ld_fragment_cntr        <= wr_en;
            rd_data                 <= {11'h0,fragment_count};
          end // case: 9'h23
     
    9'h24:begin
            rac_histo_cntr1         <= rac_pls;
            ld_histo_cntr1          <= wr_en;
            rd_data                 <= {11'h0,histo_count1};
          end // case: 9'h24
     
    9'h25:begin
            rac_histo_cntr2         <= rac_pls;
            ld_histo_cntr2          <= wr_en;
            rd_data                 <= {11'h0,histo_count2};
          end // case: 9'h25
     
    9'h26:begin
            rac_histo_cntr3         <= rac_pls;
            ld_histo_cntr3          <= wr_en;  
            rd_data                 <= {12'h0,histo_count3};
          end // case: 9'h26
     
    9'h27:begin
            rac_histo_cntr4         <= rac_pls;
            ld_histo_cntr4          <= wr_en;
            rd_data                 <= {13'h0,histo_count4};
          end // case: 9'h27
     
    9'h28:begin
            rac_histo_cntr5         <= rac_pls;
            ld_histo_cntr5          <= wr_en;
            rd_data                 <= {14'h0,histo_count5};
          end // case: 9'h28
     
    9'h29:begin
            rac_histo_cntr6         <= rac_pls;
            ld_histo_cntr6          <= wr_en;
            rd_data                 <= {15'h0,histo_count6};
          end // case: 9'h29
     
    9'h2A:begin
            rac_max_pkt_err_cntr    <= rac_pls;
            ld_max_pkt_err_cntr     <= wr_en;
            rd_data                 <= {24'h0,max_pkt_err_count};
          end // case: 9'h2A
     
    9'h2B:begin
            rac_crc_err_cntr        <= rac_pls;
            ld_crc_err_cntr         <= wr_en;
            rd_data                 <= {24'h0,crc_err_count};
          end // case: 9'h2B
     
    9'h2C:begin
            rac_code_viol_cntr      <= rac_pls;
            ld_code_viol_cntr       <= wr_en;
            rd_data                 <= {24'h0,code_viol_count};
          end // case: 9'h2C
     
    9'h2D:begin
            rac_align_err_cntr      <= rac_pls;
            ld_align_err_cntr       <= wr_en;
            rd_data                 <= {24'h0,align_err_count};
          end // case: 9'h2D
     
    9'h2E:begin
            rac_tx_frame_cntr       <= rac_pls;
            ld_tx_frame_cntr        <= wr_en;
            rd_data                 <= tx_frame_count_stat; 
          end // case: 9'h2E
     
    9'h2F:begin
            rac_tx_byte_cntr        <= rac_pls;
            ld_tx_byte_cntr         <= wr_en;
            rd_data                 <= tx_byte_count_stat;
          end // case: 9'h2F
     
    9'h30:begin
            rac_link_fault_cntr     <= rac_pls;
            ld_link_fault_cntr      <= wr_en;
            rd_data                 <= {24'h0,link_fault_count};
          end // case: 9'h30
     
    9'h31:begin
            rac_histo_cntr7         <= rac_pls;
            ld_histo_cntr7          <= wr_en;
            rd_data                 <= {11'h0,histo_count7};
          end // case: 9'h29
     
    9'h35:begin
             rd_data                <= state_machine0;
          end // case: 9'h35

    9'h36:begin
             rd_data                <= internal_signals1;
          end // case: 9'h36

    9'h37:begin
             rd_data                <= internal_signals2;
          end // case: 9'h37


`ifdef  ALT_ADDR_AND_HASH_FUNC

/***** start of mac addr compare enable register *****/
     // addr 9'h40 is not used
    9'h41:begin // ADDR:0F8
            ld_alt_addr_comp_en     <= wr_en;
            rd_data                 <= {16'b0,alt_addr_comp_en[15:0]};
          end

/***** start of mac alt addr *****/
 // 1
    9'h43:begin
            ld_mac_alt_addr0[0]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr0[47:32]};
          end
          
    9'h44:begin
            ld_mac_alt_addr0[1]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr0[31:16]};
          end
          
    9'h45:begin
            ld_mac_alt_addr0[2]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr0[15:0]};
          end
// 2
    9'h46:begin
            ld_mac_alt_addr1[0]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr1[47:32]};
          end
          
    9'h47:begin
            ld_mac_alt_addr1[1]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr1[31:16]};
          end
          
    9'h48:begin
            ld_mac_alt_addr1[2]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr1[15:0]};
          end
// 3     
    9'h49:begin
            ld_mac_alt_addr2[0]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr2[47:32]};
          end
          
    9'h4A:begin
            ld_mac_alt_addr2[1]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr2[31:16]};
          end
          
    9'h4B:begin
            ld_mac_alt_addr2[2]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr2[15:0]};
          end
// 4     
    9'h4C:begin
            ld_mac_alt_addr3[0]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr3[47:32]};
          end
          
    9'h4D:begin
            ld_mac_alt_addr3[1]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr3[31:16]};
          end
          
    9'h4E:begin
            ld_mac_alt_addr3[2]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr3[15:0]};
          end
// 5     
    9'h4F:begin
            ld_mac_alt_addr4[0]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr4[47:32]};
          end
          
    9'h50:begin
            ld_mac_alt_addr4[1]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr4[31:16]};
          end
          
    9'h51:begin
            ld_mac_alt_addr4[2]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr4[15:0]};
          end
// 6     
    9'h52:begin
            ld_mac_alt_addr5[0]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr5[47:32]};
          end
          
    9'h53:begin
            ld_mac_alt_addr5[1]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr5[31:16]};
          end
          
    9'h54:begin
            ld_mac_alt_addr5[2]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr5[15:0]};
          end
// 7     
    9'h55:begin
            ld_mac_alt_addr6[0]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr6[47:32]};
          end
          
    9'h56:begin
            ld_mac_alt_addr6[1]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr6[31:16]};
          end
          
    9'h57:begin
            ld_mac_alt_addr6[2]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr6[15:0]};
          end
// 8     
    9'h58:begin
            ld_mac_alt_addr7[0]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr7[47:32]};
          end
          
    9'h59:begin
            ld_mac_alt_addr7[1]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr7[31:16]};
          end
          
    9'h5A:begin
            ld_mac_alt_addr7[2]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr7[15:0]};
          end
// 9     
    9'h5B:begin
            ld_mac_alt_addr8[0]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr8[47:32]};
          end
          
    9'h5C:begin
            ld_mac_alt_addr8[1]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr8[31:16]};
          end
          
    9'h5D:begin
            ld_mac_alt_addr8[2]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr8[15:0]};
          end
// 10    
    9'h5E:begin
            ld_mac_alt_addr9[0]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr9[47:32]};
          end
          
    9'h5F:begin
            ld_mac_alt_addr9[1]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr9[31:16]};
          end
          
    9'h60:begin
            ld_mac_alt_addr9[2]     <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr9[15:0]};
          end
// 11    
    9'h61:begin
            ld_mac_alt_addr10[0]    <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr10[47:32]};
          end
          
    9'h62:begin
            ld_mac_alt_addr10[1]    <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr10[31:16]};
          end
          
    9'h63:begin
            ld_mac_alt_addr10[2]    <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr10[15:0]};
          end
// 12    
    9'h64:begin
            ld_mac_alt_addr11[0]    <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr11[47:32]};
          end
          
    9'h65:begin
            ld_mac_alt_addr11[1]    <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr11[31:16]};
          end
          
    9'h66:begin
            ld_mac_alt_addr11[2]    <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr11[15:0]};
          end
// 13    
    9'h67:begin
            ld_mac_alt_addr12[0]    <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr12[47:32]};
          end
          
    9'h68:begin
            ld_mac_alt_addr12[1]    <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr12[31:16]};
          end
          
    9'h69:begin
            ld_mac_alt_addr12[2]    <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr12[15:0]};
          end
// 14    
    9'h6A:begin
            ld_mac_alt_addr13[0]    <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr13[47:32]};
          end
          
    9'h6B:begin
            ld_mac_alt_addr13[1]    <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr13[31:16]};
          end
          
    9'h6C:begin
            ld_mac_alt_addr13[2]    <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr13[15:0]};
          end
// 15    
    9'h6D:begin
            ld_mac_alt_addr14[0]    <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr14[47:32]};
          end
          
    9'h6E:begin
            ld_mac_alt_addr14[1]    <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr14[31:16]};
          end
          
    9'h6F:begin
            ld_mac_alt_addr14[2]    <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr14[15:0]};
          end
// 16    
    9'h70:begin
            ld_mac_alt_addr15[0]    <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr15[47:32]};
          end
          
    9'h71:begin
            ld_mac_alt_addr15[1]    <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr15[31:16]};
          end
          
    9'h72:begin
            ld_mac_alt_addr15[2]    <= wr_en;
            rd_data                 <= {16'h0,mac_alt_addr15[15:0]};
          end
/***** end of mac alt addr *****/
   
/***** start of addr filter ****/
    9'h103:begin // addr: 40C
            ld_addr_filter[0]       <= wr_en;
            rd_data                 <= {16'h0,addr_filter[47:32]};
           end

    9'h104:begin // addr: 410
            ld_addr_filter[1]       <= wr_en;
            rd_data                 <= {16'h0,addr_filter[31:16]};
           end

    9'h105:begin // addr: 414
            ld_addr_filter[2]       <= wr_en;
            rd_data                 <= {16'h0,addr_filter[15:0]};
           end

    9'h106:begin // addr: 418
            ld_addr_filter_mask_msb <= wr_en;
            rd_data                 <= {24'h0,addr_filter_mask_msb[7:0]};
           end

    9'h107:begin // addr: 41C
            ld_addr_filter_mask_lsb <= wr_en;
            rd_data                 <= {16'h0,addr_filter_mask_lsb[15:0]};
           end
/***** end of addr filter ****/

/***** start of hash table *****/
    9'h108:begin // addr: 420
            ld_hash_table[0]        <= wr_en;
            rd_data                 <= {16'h0,hash_table[255:240]};
           end

    9'h109:begin
            ld_hash_table[1]        <= wr_en;
            rd_data                 <= {16'h0,hash_table[239:224]};
           end

    9'h10A:begin
            ld_hash_table[2]        <= wr_en;
            rd_data                 <= {16'h0,hash_table[223:208]};
           end

    9'h10B:begin
            ld_hash_table[3]        <= wr_en;
            rd_data                 <= {16'h0,hash_table[207:192]};
           end

    9'h10C:begin
            ld_hash_table[4]        <= wr_en;
            rd_data                 <= {16'h0,hash_table[191:176]};
           end

    9'h10D:begin
            ld_hash_table[5]        <= wr_en;
            rd_data                 <= {16'h0,hash_table[175:160]};
           end

    9'h10E:begin
            ld_hash_table[6]        <= wr_en;
            rd_data                 <= {16'h0,hash_table[159:144]};
           end

    9'h10F:begin
            ld_hash_table[7]        <= wr_en;
            rd_data                 <= {16'h0,hash_table[143:128]};
           end

    9'h110:begin
            ld_hash_table[8]        <= wr_en;
            rd_data                 <= {16'h0,hash_table[127:112]};
           end

    9'h111:begin
            ld_hash_table[9]        <= wr_en;
            rd_data                 <= {16'h0,hash_table[111:96]};
           end

    9'h112:begin
            ld_hash_table[10]       <= wr_en;
            rd_data                 <= {16'h0,hash_table[95:80]};
           end

    9'h113:begin
            ld_hash_table[11]       <= wr_en;
            rd_data                 <= {16'h0,hash_table[79:64]};
           end

    9'h114:begin
            ld_hash_table[12]       <= wr_en;
            rd_data                 <= {16'h0,hash_table[63:48]};
           end

    9'h115:begin
            ld_hash_table[13]       <= wr_en;
            rd_data                 <= {16'h0,hash_table[47:32]};
           end

    9'h116:begin
            ld_hash_table[14]       <= wr_en;
            rd_data                 <= {16'h0,hash_table[31:16]};
           end

    9'h117:begin
            ld_hash_table[15]       <= wr_en;
            rd_data                 <= {16'h0,hash_table[15:0]};
           end

/***** start of mac host info table *****/
    // 1   
    9'h120:begin
            ld_mac_host_info0       <= wr_en;
            rd_data                 <= {14'b0,mac_host_info0};
           end
    // 2   
    9'h121:begin
            ld_mac_host_info1       <= wr_en;
            rd_data                 <= {14'b0,mac_host_info1};
           end
    // 3     
    9'h122:begin
            ld_mac_host_info2       <= wr_en;
            rd_data                 <= {14'b0,mac_host_info2};
           end
    // 4   
    9'h123:begin
            ld_mac_host_info3       <= wr_en;
            rd_data                 <= {14'b0,mac_host_info3};
           end
    // 5   
    9'h124:begin
            ld_mac_host_info4       <= wr_en;
            rd_data                 <= {14'b0,mac_host_info4};
           end
    // 6   
    9'h125:begin
            ld_mac_host_info5       <= wr_en;
            rd_data                 <= {14'b0,mac_host_info5};
           end
    // 7   
    9'h126:begin
            ld_mac_host_info6       <= wr_en;
            rd_data                 <= {14'b0,mac_host_info6};
           end
    // 8   
    9'h127:begin
            ld_mac_host_info7       <= wr_en;
            rd_data                 <= {14'b0,mac_host_info7};
           end
    // 9   
    9'h128:begin
            ld_mac_host_info8       <= wr_en;
            rd_data                 <= {14'b0,mac_host_info8};
           end
    // 10  
    9'h129:begin
            ld_mac_host_info9       <= wr_en;
            rd_data                 <= {14'b0,mac_host_info9};
           end
    // 11  
    9'h12A:begin
            ld_mac_host_info10      <= wr_en;
            rd_data                 <= {14'b0,mac_host_info10};
           end
    // 12  
    9'h12B:begin
            ld_mac_host_info11      <= wr_en;
            rd_data                 <= {14'b0,mac_host_info11};
           end
    // 13  
    9'h12C:begin
            ld_mac_host_info12      <= wr_en;
            rd_data                 <= {14'b0,mac_host_info12};
           end
    // 14  
    9'h12D:begin
            ld_mac_host_info13      <= wr_en;
            rd_data                 <= {14'b0,mac_host_info13};
           end
    // 15  
    9'h12E:begin
            ld_mac_host_info14      <= wr_en;
            rd_data                 <= {14'b0,mac_host_info14};
           end
    // 16  
    9'h12F:begin
            ld_mac_host_info15      <= wr_en;
            rd_data                 <= {14'b0,mac_host_info15};
           end
    // 17  
    9'h130:begin
            ld_mac_host_info16      <= wr_en;
            rd_data                 <= {14'b0,mac_host_info16};
           end
    // 18  
    9'h131:begin
             ld_mac_host_info17      <= wr_en;
             rd_data                 <= {14'b0,mac_host_info17};
            end
    // 19  
    9'h132:begin
             ld_mac_host_info18      <= wr_en;
             rd_data                 <= {14'b0,mac_host_info18};
            end
    // 20  
    9'h133:begin
             ld_mac_host_info19      <= wr_en;
             rd_data                 <= {14'b0,mac_host_info19};
            end
    // 140~15F is reserved for another 32 host info regs.


/***** end of mac host info table *****/
     
`endif // !ifdef ALT_ADDR_AND_HASH_FUNC
     
    9'h170:begin
             rd_data                 <= rx_pa_data[31:0];
            end
    9'h171:begin
             rd_data                 <= rx_pa_data[63:32];
            end

    9'h172:begin
             ld_debug_reg            <= wr_en;
             rd_data                 <= {24'b0,debug_reg};
            end

    9'h173:begin
             ld_training_vector      <= wr_en;
             rd_data                 <= training_vector;
            end

    default:begin 
             rd_data                 <= 32'hdead_beef;
             non_qualified_addr_err  <= 1;
            end
    endcase // case(reg_offset[8:0])
  else
    begin
            non_qualified_addr_err  <= 0;
            rd_data                 <= 32'hDEADBEEF;
            ld_debug_reg            <= 0;
            ld_training_vector      <= 0;
            ld_tx_sw_reset_clk      <= 0;
            ld_tx_reg_reset         <= 0;
            ld_rx_sw_reset_clk      <= 0;
            ld_rx_reg_reset         <= 0;
            rac_tx_status           <= 0;
            ld_tx_status            <= 0;
            rac_rx_status           <= 0;
            ld_rx_status            <= 0;
            rac_fc_status           <= 0;
            ld_fc_status            <= 0;
            ld_tx_mask              <= 0;
            ld_rx_mask              <= 0;
            ld_fc_mask              <= 0;
            ld_mac_config           <= 0;
            ld_ipg_values           <= 0;
            ld_minpkt_slot_pa_sizes <= 0;
            ld_max_pkt_burst_sizes  <= 0;
            ld_mac_unique_addr[0]   <= 0;
            ld_mac_unique_addr[1]   <= 0;
            ld_mac_unique_addr[2]   <= 0;
            rac_rx_byte_cntr        <= 0;
            ld_rx_byte_cntr         <= 0;
            rac_bcast_cntr          <= 0;
            ld_bcast_cntr           <= 0;
            rac_mcast_cntr          <= 0;
            ld_mcast_cntr           <= 0;
            rac_fragment_cntr       <= 0;
            ld_fragment_cntr        <= 0;
            rac_histo_cntr1         <= 0;
            ld_histo_cntr1          <= 0;
            rac_histo_cntr2         <= 0;
            ld_histo_cntr2          <= 0;
            rac_histo_cntr3         <= 0;
            ld_histo_cntr3          <= 0;  
            rac_histo_cntr4         <= 0;
            ld_histo_cntr4          <= 0;
            rac_histo_cntr5         <= 0;
            ld_histo_cntr5          <= 0;
            rac_histo_cntr6         <= 0;
            ld_histo_cntr6          <= 0;
            rac_histo_cntr7         <= 0;
            ld_histo_cntr7          <= 0;
            rac_max_pkt_err_cntr    <= 0;
            ld_max_pkt_err_cntr     <= 0;
            rac_crc_err_cntr        <= 0;
            ld_crc_err_cntr         <= 0;
            rac_code_viol_cntr      <= 0;
            ld_code_viol_cntr       <= 0;
            rac_align_err_cntr      <= 0;
            ld_align_err_cntr       <= 0;	      
            rac_tx_frame_cntr       <= 0;
            ld_tx_frame_cntr        <= 0;
            rac_tx_byte_cntr        <= 0;
            ld_tx_byte_cntr         <= 0;
            rac_link_fault_cntr     <= 0;
            ld_link_fault_cntr      <= 0;     
            // start of ALT_ADDR_AND_HASH_FUNC signals
    `ifdef  ALT_ADDR_AND_HASH_FUNC
            ld_alt_addr_comp_en     <= 0;
            ld_mac_alt_addr0[0]     <= 0;
            ld_mac_alt_addr0[1]     <= 0;
            ld_mac_alt_addr0[2]     <= 0;
            ld_mac_alt_addr1[0]     <= 0;
            ld_mac_alt_addr1[1]     <= 0;
            ld_mac_alt_addr1[2]     <= 0;
            ld_mac_alt_addr2[0]     <= 0;
            ld_mac_alt_addr2[1]     <= 0;
            ld_mac_alt_addr2[2]     <= 0;
            ld_mac_alt_addr3[0]     <= 0;
            ld_mac_alt_addr3[1]     <= 0;
            ld_mac_alt_addr3[2]     <= 0;
            ld_mac_alt_addr4[0]     <= 0;
            ld_mac_alt_addr4[1]     <= 0;
            ld_mac_alt_addr4[2]     <= 0;
            ld_mac_alt_addr5[0]     <= 0;
            ld_mac_alt_addr5[1]     <= 0;
            ld_mac_alt_addr5[2]     <= 0;
            ld_mac_alt_addr6[0]     <= 0;
            ld_mac_alt_addr6[1]     <= 0;
            ld_mac_alt_addr6[2]     <= 0;
            ld_mac_alt_addr7[0]     <= 0;
            ld_mac_alt_addr7[1]     <= 0;
            ld_mac_alt_addr7[2]     <= 0;
            ld_mac_alt_addr8[0]     <= 0;
            ld_mac_alt_addr8[1]     <= 0;
            ld_mac_alt_addr8[2]     <= 0;
            ld_mac_alt_addr9[0]     <= 0;
            ld_mac_alt_addr9[1]     <= 0;
            ld_mac_alt_addr9[2]     <= 0;
            ld_mac_alt_addr10[0]    <= 0;
            ld_mac_alt_addr10[1]    <= 0;
            ld_mac_alt_addr10[2]    <= 0;
            ld_mac_alt_addr11[0]    <= 0;
            ld_mac_alt_addr11[1]    <= 0;
            ld_mac_alt_addr11[2]    <= 0;
            ld_mac_alt_addr12[0]    <= 0;
            ld_mac_alt_addr12[1]    <= 0;
            ld_mac_alt_addr12[2]    <= 0;
            ld_mac_alt_addr13[0]    <= 0;
            ld_mac_alt_addr13[1]    <= 0;
            ld_mac_alt_addr13[2]    <= 0;
            ld_mac_alt_addr14[0]    <= 0;
            ld_mac_alt_addr14[1]    <= 0;
            ld_mac_alt_addr14[2]    <= 0;
            ld_mac_alt_addr15[0]    <= 0;
            ld_mac_alt_addr15[1]    <= 0;
            ld_mac_alt_addr15[2]    <= 0;
            ld_addr_filter[0]       <= 0;
            ld_addr_filter[1]       <= 0;
            ld_addr_filter[2]       <= 0;
            ld_addr_filter_mask_msb <= 0;
            ld_addr_filter_mask_lsb <= 0;
            ld_hash_table           <= 0;
            ld_mac_host_info0       <= 0;
            ld_mac_host_info1       <= 0;
            ld_mac_host_info2       <= 0;
            ld_mac_host_info3       <= 0;
            ld_mac_host_info4       <= 0;
            ld_mac_host_info5       <= 0;
            ld_mac_host_info6       <= 0;
            ld_mac_host_info7       <= 0;
            ld_mac_host_info8       <= 0;
            ld_mac_host_info9       <= 0;
            ld_mac_host_info10      <= 0;
            ld_mac_host_info11      <= 0;
            ld_mac_host_info12      <= 0;
            ld_mac_host_info13      <= 0;
            ld_mac_host_info14      <= 0;
            ld_mac_host_info15      <= 0;
            ld_mac_host_info16      <= 0;
            ld_mac_host_info17      <= 0;
            ld_mac_host_info18      <= 0;
            ld_mac_host_info19      <= 0;
            // end ALT_ADDR_AND_HASH_FUNC of 
            //`else
            `endif // ifdef ALT_ADDR_AND_HASH_FUNC
    end
end // always @ (posedge clk)
   
   
/* ----------- xmac registers ------------------------------------------ */
 

/* --------------------------- Command Register ------------------------ */
   // tx_reset_clk: used to reset anything other then xmac_slv module.
   // It is mainly for resetting txmac state machines.
 assign new_tx_reset_clk = 
       (ld_tx_sw_reset_clk | hw_reset | change_clk_source_pls) ? 1'b1 :
       (clr_tx_reset_clk    ? 1'b0 : tx_reset_clk   );
 FD1 TX_RESET_FF(.D(new_tx_reset_clk),.CP(clk),.Q(tx_reset_clk));

   // tx_reg_reset for resetting txmac registers in  xmac_slv module.
 wire   new_tx_reg_reset = ld_tx_reg_reset | hw_reset;
 FD1 tx_reg_reset_FF(.D(new_tx_reg_reset),.CP(clk),.Q(tx_reg_reset));
   
   // rx_reset_clk: used to reset anything other then xmac_slv module.
   // It is mainly for resetting rxmac state machines.
 assign new_rx_reset_clk =
       (ld_rx_sw_reset_clk | hw_reset | change_clk_source_pls ) ? 1'b1 :
       (clr_rx_reset_clk    ? 1'b0 : rx_reset_clk   );
 FD1 RX_RESET_FF(.D(new_rx_reset_clk),.CP(clk),.Q(rx_reset_clk));

   // rx_reg_reset for resetting rxmac registers in  xmac_slv module.
 wire   new_rx_reg_reset = ld_rx_reg_reset | hw_reset;
 FD1 rx_reg_reset_FF(.D(new_rx_reg_reset),.CP(clk),.Q(rx_reg_reset));

   // debug   
   xREG #(8) debug_reg_xREG(
                .din(wr_data[7:0]),
                .clk(clk),
                .en(ld_debug_reg),
                .reset(rx_reg_reset|tx_reg_reset),
                .qout(debug_reg[7:0]));

   wire [2:0] 	  mac_debug_sel = debug_reg[2:0]; // 3b
   wire [3:0] 	 xmac_debug_sel = debug_reg[6:3]; // 4b

 /* -------- debug_training_vector --------------- */

always @ (posedge clk)
  begin
    if (rx_reg_reset|tx_reg_reset)
	 training_vector <= 0;
    else if (ld_training_vector)
	 training_vector <= wr_data[31:0];
    else if (xmac_debug_sel == `SEL_mac_training_vector)
	 training_vector <= ~training_vector;
    else training_vector <=  training_vector;
  end

/* --------------------------- TX Status Register --------------------- */

 RAC_FF stat0_frame_transmitted_RAC_FF(.clk(clk),.reset(tx_reg_reset),
                              .set(set_tx_pkt_ok_sync),
                              .rst(rac_tx_status),
                              .load(ld_tx_status),
                              .load_data(wr_data[0]),
                              .dout(frame_transmitted));
  
 RAC_FF stat1_txfifo_underflow_RAC_FF(.clk(clk),
                              .reset(tx_reg_reset),
                              .set(txfifo_underrun_sync),
                              .rst(rac_tx_status),
                              .load(ld_tx_status),
                              .load_data(wr_data[1]),
                              .dout(txfifo_underflow));
    
 RAC_FF stat2_tx_max_pkt_size_err_RAC_FF(.clk(clk),
                              .reset(tx_reg_reset),
                              .set(tx_max_pkt_size_err_sync),
                              .rst(rac_tx_status),
                              .load(ld_tx_status),
                              .load_data(wr_data[2]),
                              .dout(tx_max_pkt_size_err));
   
 RAC_FF stat3_txfifo_overflow_RAC_FF(.clk(clk),
                              .reset(tx_reg_reset),
                              .set(txfifo_overrun_clk),
                              .rst(rac_tx_status),
                              .load(ld_tx_status),
                              .load_data(wr_data[3]),
                              .dout(txfifo_overflow));

 RAC_FF stat4_txfifo_xfr_err_RAC_FF(.clk(clk),
                              .reset(tx_reg_reset),
                              .set(txfifo_xfr_err_sync),
                              .rst(rac_tx_status),
                              .load(ld_tx_status),
                              .load_data(wr_data[4]),
                              .dout(txfifo_xfr_err));

// bit 5 to bit 9 are not used.
/* ------------------ for tx byte counter ----------------------------- */
 RAC_FF stat10_tx_byte_count_exp_RAC_FF(.clk(clk),
                              .reset(tx_reg_reset),
                              .set(set_tx_byte_count_exp),
                              .rst(rac_tx_status),
                              .load(ld_tx_status),
                              .load_data(wr_data[10]),
                              .dout(tx_byte_count_exp));
        
/* ------------------ for tx frame counter ---------------------------- */
 RAC_FF stat11__RAC_FF(.clk(clk),
                              .reset(tx_reg_reset),
                              .set(set_tx_frame_count_exp),
                              .rst(rac_tx_status),
                              .load(ld_tx_status),
                              .load_data(wr_data[11]),
                              .dout(tx_frame_count_exp));

/* -------------------------------------------------------------------- */

// assemble tx_status bits
 assign tx_status_dout = {20'b0,
                          tx_frame_count_exp,
                          tx_byte_count_exp,
                          5'b0,     // bit 5 to bit 9 are not used.
                          txfifo_xfr_err,
                          txfifo_overflow,
                          tx_max_pkt_size_err,
                          txfifo_underflow,
                          frame_transmitted};

// synopsys translate_off
// diag   
always @ (tx_status_dout or warning_msg_en)
  if ((~tx_reg_reset) & (txfifo_underflow | txfifo_overflow) & warning_msg_en)
    $display("\n (* ERROR:  at sim time = %d, txfifo_underflow = %b, txfifo_overflow = %b  *) \n", $time, txfifo_underflow, txfifo_overflow);
  else ;
   
always @ (tx_status_dout or warning_msg_en)
  if ((~tx_reg_reset) & (tx_max_pkt_size_err) & warning_msg_en)
    $display("\n (* ERROR:  at sim time = %d, tx_max_pkt_size_err = %b  *) \n", $time, tx_max_pkt_size_err );
  else ;
   
always @ (tx_status_dout or warning_msg_en)
  if ((~tx_reg_reset) & (txfifo_xfr_err) & warning_msg_en)
    $display("\n (* ERROR:  at sim time = %d, txfifo_xfr_err = %b  *) \n", $time, txfifo_xfr_err );
  else ;
// synopsys translate_on
    
 /* ------------------------------------------------------------------- */

   
 /* -------------------------- RX Status Register --------------------- */
 RAC_FF stat0_frame_receiv_RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(rx_good_pkt_sync),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[0]),
                              .dout(frame_received));

 RAC_FF stat1_rxfifo_overflow_RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(rxfifo_overrun_sync),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[1]),
                              .dout(rxfifo_overflow));
  
 RAC_FF stat2_rxfifo_underflow_RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(rxfifo_underrun_clk),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[2]),
                              .dout(rxfifo_underflow));

 RAC_FF stat3_crc_err_cntr_exp_RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(set_crc_err_cntr_exp),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[3]),
                              .dout(crc_err_cntr_exp));

 RAC_FF stat4_max_pkt_err_cntr_exp_RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(set_max_pkt_err_cntr_exp),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[4]),
                              .dout(max_pkt_err_cntr_exp));

 RAC_FF stat5_code_viol_cntr_exp_RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(set_code_viol_cntr_exp),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[5]),
                              .dout(code_viol_cntr_exp));

 RAC_FF stat6_rx_byte_count_exp_RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(set_rx_byte_count_exp),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[6]),
                              .dout(rx_byte_count_exp));

 RAC_FF stat7_histo_count1_exp_RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(set_histo_count1_exp),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[7]),
                              .dout(histo_count1_exp));

 RAC_FF stat8_histo_count2_exp_RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(set_histo_count2_exp),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[8]),
                              .dout(histo_count2_exp));

 RAC_FF stat9_histo_count3_exp_RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(set_histo_count3_exp),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[9]),
                              .dout(histo_count3_exp));

 RAC_FF stat10_histo_count4_exp_RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(set_histo_count4_exp),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[10]),
                              .dout(histo_count4_exp));

 RAC_FF stat11_histo_count5_exp_RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(set_histo_count5_exp),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[11]),
                              .dout(histo_count5_exp));

 RAC_FF stat12_RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(set_histo_count6_exp),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[12]),
                              .dout(histo_count6_exp));

 RAC_FF stat13_bcast_count_exp_RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(set_bcast_count_exp),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[13]),
                              .dout(bcast_count_exp));

 RAC_FF stat14__RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(set_mcast_count_exp),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[14]),
                              .dout(mcast_count_exp));

 RAC_FF stat15_fragment_count_exp_RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(set_fragment_count_exp),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[15]),
                              .dout(fragment_count_exp));

//RAC_FF stat16_align_err_exp_RAC_FF(.clk(clk),  // for 10/100M only
//                              .reset(rx_reg_reset),
//                              .set(set_align_err_cntr_exp),
//                              .rst(rac_rx_status),
//                              .load(ld_rx_status),
//                              .load_data(wr_data[16]),
//                              .dout(align_err_cntr_exp));

// eco @7-25-06
// RAC_FF stat16_align_err_exp_RAC_FF(.clk(clk),
//                              .reset(rx_reg_reset),
//                              .set(MDINT),
//                              .rst(rac_rx_status),
//                              .load(ld_rx_status),
//                              .load_data(wr_data[16]),
//                              .dout(mdint_oc));

// eco @7-28-06
 FD1 stat16_mdint_oc_FF(.D(MDINT),.CP(clk),.Q(mdint_oc));

   

 // start of lfs related stuff
 RAC_FF stat17_link_fault_exp_RAC_FF(.clk(clk),  // for 10G only
                              .reset(rx_reg_reset),
                              .set(set_link_fault_cntr_exp),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[17]),
                              .dout(link_fault_cntr_exp));
 
 PlsGen remote_fault_oc_pls_PlsGen (.reset(rx_reg_reset),.clk(clk),
               .iSigIn(remote_fault_oc_sync),.oPlsOut(remote_fault_oc_pls));
   
 RAC_FF stat18_remote_fault_status_RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(remote_fault_oc_pls),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[18]),
                              .dout(remote_fault_status));
   
 // eco
 PlsGenX local_fault_oc_pls_PlsGen (.reset(rx_reg_reset),.clk(clk),
               .iSigIn(local_fault_oc_sync),.oPlsOut(local_fault_oc_pls));
   
 RAC_FF stat19_local_fault_status_RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(local_fault_oc_pls),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[19]),
                              .dout(local_fault_status));
   
 // end of lfs related stuff

 RAC_FF stat20_histo_count7_exp_RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(set_histo_count7_exp),
                              .rst(rac_rx_status),
                              .load(ld_rx_status),
                              .load_data(wr_data[20]),
                              .dout(histo_count7_exp));

 assign rx_status_dout = {11'b0,
			  histo_count7_exp,
			  local_fault_status,   // 20th
			  remote_fault_status,  // 19th
			  link_fault_cntr_exp,  // 18th
                          mdint_oc,             // 17th
                          fragment_count_exp,
                          mcast_count_exp,
                          bcast_count_exp,
                          histo_count6_exp,
                          histo_count5_exp,
                          histo_count4_exp,
                          histo_count3_exp,
                          histo_count2_exp,
                          histo_count1_exp,
                          rx_byte_count_exp,
                          code_viol_cntr_exp,
                          max_pkt_err_cntr_exp,
                          crc_err_cntr_exp,
                          rxfifo_underflow,
                          rxfifo_overflow,
                          frame_received};

// synopsys translate_off
// diag   
always @ (rx_status_dout or warning_msg_en)
  if ((~rx_reg_reset) & (rxfifo_underflow | rxfifo_overflow) & warning_msg_en)
    $display("\n (* ERROR:  at sim time = %d, rxfifo_underflow = %b, rxfifo_overflow = %b  *) \n", $time, rxfifo_underflow, rxfifo_overflow);
  else ;
// synopsys translate_on
   
 /* ------------------------------------------------------------------ */

 /* -------------- MAC Flow Control Status Register ------------------ */

 PlsGen2 paused_state_sync_PlsGen2(.sig_in(paused_state_sync),.clk(clk),
                                 .lead(paused_state_sync_lead),
                                 .trail(paused_state_sync_trail));
   
 RAC_FF stat0_pause_rcvd_RAC_FF(.clk(clk),
                              .reset(rx_reg_reset),
                              .set(rx_fc_pkt_ok_clk),
                              .rst(rac_fc_status),
                              .load(ld_fc_status),
                              .load_data(wr_data[0]),
                              .dout(pause_rcvd));

 RAC_FF stat1_tx_paused_status_RAC_FF(.clk(clk),
                              .reset(tx_reg_reset),
                              .set(paused_state_sync_lead),
                              .rst(rac_fc_status),
                              .load(ld_fc_status),
                              .load_data(wr_data[1]),
                              .dout(tx_paused_status));
	       
 RAC_FF stat2_not_tx_paused_status_RAC_FF(.clk(clk),
                              .reset(tx_reg_reset),
                              .set(paused_state_sync_trail),
                              .rst(rac_fc_status),
                              .load(ld_fc_status),
                              .load_data(wr_data[2]),
                              .dout(not_tx_paused_status));
	       
 wire [15:0] pause_time_rcvd;
 xREG #(16) FC_STAT16_31_xREG(.clk(clk),.reset(rx_reg_reset),.en(rx_fc_pkt_ok_clk),.din(pause_time[15:0]),.qout(pause_time_rcvd[15:0]));

 // fc_status_dout is 32 bit wide
 assign fc_status_dout = {pause_time_rcvd[15:0],13'h0,not_tx_paused_status,
                          tx_paused_status,pause_rcvd};

 /* ---------------------------- TX Mask Register -------------------- */
 wire [11:0] new_tx_mask_dout = tx_reg_reset ? 12'hFFF :
                          (ld_tx_mask ? wr_data[11:0] :
                                tx_mask_dout[11:0] );

 RegDff #(12) tx_mask_dout_RegDff (.din(new_tx_mask_dout[11:0]),.clk(clk),
                                      .qout(tx_mask_dout[11:0]));

   assign  tx_mask_dout[31:12] = 0;
   
 /* --------------------------- RX Mask Register ------------------------ */
 wire  [19:0] new_rx_mask_dout = rx_reg_reset ? 20'hF_FFFF :
                                (ld_rx_mask ? wr_data[19:0] : 
                                  rx_mask_dout[19:0]);

 RegDff #(20) rx_mask_dout_RegDff (.din(new_rx_mask_dout[19:0]),.clk(clk),
                                      .qout(rx_mask_dout[19:0]));
   assign  rx_mask_dout[31:20] = 0;

 /* ----------------------- MAC Flow Control Mask Register -------------- */
 wire [2:0] new_fc_mask_dout = rx_reg_reset ? 3'h7 :
                                   (ld_fc_mask ? wr_data[2:0] :
                                   fc_mask_dout[2:0]);
 FD1 FC_MASK0_FF(.D(new_fc_mask_dout[0]),.CP(clk),.Q(fc_mask_dout[0]));
 FD1 FC_MASK1_FF(.D(new_fc_mask_dout[1]),.CP(clk),.Q(fc_mask_dout[1]));
 FD1 FC_MASK2_FF(.D(new_fc_mask_dout[2]),.CP(clk),.Q(fc_mask_dout[2]));
  assign  fc_mask_dout[31:3] = 0;
 /* -------------------------- Interrupts ------------------------------- */
 wire  new_txmac_interrupt =  tx_status_dout[0]  & !tx_mask_dout[0]  |
                              tx_status_dout[1]  & !tx_mask_dout[1]  |
                              tx_status_dout[2]  & !tx_mask_dout[2]  |
                              tx_status_dout[3]  & !tx_mask_dout[3]  |
                              tx_status_dout[4]  & !tx_mask_dout[4]  |
                              tx_status_dout[5]  & !tx_mask_dout[5]  |
                              tx_status_dout[10] & !tx_mask_dout[10] |
                              tx_status_dout[11] & !tx_mask_dout[11] ;
 FD1 TX_INTR(.D(new_txmac_interrupt),.CP(clk),.Q(txmac_interrupt));

 wire  new_rxmac_interrupt =  rx_status_dout[0]  & !rx_mask_dout[0]  |
                              rx_status_dout[1]  & !rx_mask_dout[1]  |
                              rx_status_dout[2]  & !rx_mask_dout[2]  |
                              rx_status_dout[3]  & !rx_mask_dout[3]  |
                              rx_status_dout[4]  & !rx_mask_dout[4]  |
                              rx_status_dout[5]  & !rx_mask_dout[5]  |
                              rx_status_dout[6]  & !rx_mask_dout[6]  |
                              rx_status_dout[7]  & !rx_mask_dout[7]  |
                              rx_status_dout[8]  & !rx_mask_dout[8]  |
                              rx_status_dout[9]  & !rx_mask_dout[9]  |
                              rx_status_dout[10] & !rx_mask_dout[10] |
                              rx_status_dout[11] & !rx_mask_dout[11] |
                              rx_status_dout[12] & !rx_mask_dout[12] |
                              rx_status_dout[13] & !rx_mask_dout[13] |
                              rx_status_dout[14] & !rx_mask_dout[14] |
                              rx_status_dout[15] & !rx_mask_dout[15] |
                              rx_status_dout[16] & !rx_mask_dout[16] |
                              rx_status_dout[17] & !rx_mask_dout[17] |
                              rx_status_dout[18] & !rx_mask_dout[18] |
                              rx_status_dout[19] & !rx_mask_dout[19] ;

 FD1 RX_INTR(.D(new_rxmac_interrupt),.CP(clk),.Q(rxmac_interrupt));
 
 wire  new_xmac_fc_interrupt = fc_status_dout[0] & !fc_mask_dout[0] |
                               fc_status_dout[1] & !fc_mask_dout[1] |
                               fc_status_dout[2] & !fc_mask_dout[2];
 FD1 FC_INTR(.D(new_xmac_fc_interrupt),.CP(clk),.Q(xmac_fc_interrupt));

 /* ------------------------ TX Configuration Register ---------------- */

   wire  tx_enable      =  tx_config_dout[0]; // b0 of config reg.
   wire  stretch_mode   =  tx_config_dout[1]; // b1 of config reg.// stretch_mode always goes with var_min_ipg.
   wire  var_min_ipg_en =  tx_config_dout[2] | stretch_mode;// b2 of config reg.
   wire  always_no_crc  =  tx_config_dout[3]; // b3 of config reg.
// wire  tx_spare_part0 =  tx_config_dout[4]; // b4 of config reg.
// wire  tx_spare_part1 =  tx_config_dout[5]; // b5 of config reg.
// wire  tx_spare_part2 =  tx_config_dout[6]; // b6 of config reg.
   wire  warning_msg_en =  tx_config_dout[7]; // b7 of config reg.

xREG2 #(8) tx_config_dout_xREG2 (.clk(clk), 
                      .reset(tx_reg_reset),
                      .reset_value({8'b0000_0100}), 
                      .load(ld_mac_config), 
                      .din(wr_data[7:0]), 
                      .qout(tx_config_dout[7:0]));
 /* ------------------------ RX Configuration Register ------------------ */
 
xREG2 #(11) rx_config_dout_xREG2 (.clk(clk), 
                      .reset(rx_reg_reset),
                      .reset_value({11'b010_0000_0000}),
				  //     ^
				  //     |
				  // strip_crc
                      .load(ld_mac_config), 
                      .din(wr_data[18:8]), 
                      .qout(rx_config_dout));

   wire       mac2ipp_pkt_cnt_en   =  rx_config_dout[10];// b18 of config reg.
   wire       strip_crc            =  rx_config_dout[9]; // b17 of config reg. // default == 1
   wire       addr_filter_en       =  rx_config_dout[8]; // b16 of config reg.
   wire       hash_filter_en       =  rx_config_dout[7]; // b15 of config reg.
   wire       code_viol_chk_dis    =  rx_config_dout[6]; // b14 of config reg.
   wire       reserve_multicast    =  rx_config_dout[5]; // b13 of config reg.
   wire       crc_chk_dis          =  rx_config_dout[4]; // b12 of config reg.
   wire       err_chk_dis          =  rx_config_dout[3]; // b11 of config reg.
   wire       promisc_group        =  rx_config_dout[2]; // b10 of config reg.
   wire       promisc_all          =  rx_config_dout[1]; // b9  of config reg.
   wire       rx_enable            =  rx_config_dout[0]; // b8  of config reg.

 /* ---------------- MAC Flow Control Configuration Register ------------ */

 xREG #(2)  fc_config_dout_xREG( .clk(clk), 
                    .reset(rx_reg_reset), 
                    .en(ld_mac_config),
                    .din(wr_data[20:19]),
                    .qout(fc_config_dout));
   
   wire       pass_fc     = fc_config_dout[1];           // b20 of config reg.
   wire       rx_pause_en = fc_config_dout[0];           // b19 of config reg.

 /* ----------------------- XIF Configuration Register ------------------ */
 /*************************************************************************
  ***** VERY IMPORTANT *****
  **************************
  * XIF registers use only HW_RESET. 
  * The other places that also used HW_RESET is the tx_heart_beat_timer_reg and
  * rx_heart_beat_timer_reg.
  * 
  * rx_xmac has to be in the loopback mode so that the it can always get 
  * a clock register and synchronize rx_reset signal to create clr_rx_reset_clk.
  *************************************************************************/

xREG2 #(11) xif_config_dout_xREG2 (.clk(clk), 
                      .reset(hw_reset),
                      .reset_value(11'b000_0001_0110),
				   //         ^  ^
				   //  loopback  sel_por_clk_src
                      .load(ld_mac_config), 
                      .din(wr_data[31:21]),   // 11 bits [31:21]
                      .qout(xif_config_dout[10:0]));

   wire sel_clk_25mhz         = xif_config_dout[10];//31
   wire pcs_bypass            = xif_config_dout[9]; //30
   wire xpcs_bypass           = xif_config_dout[8]; //29 // not used in N2/Neptune
   wire mii_mode              = xif_config_dout[7]; //28
   wire gmii_mode             = xif_config_dout[6]; //27
   reg 	xgmii_mode;
   always @ (posedge clk)
        xgmii_mode           <= ~mii_or_gmii_mode;  //--> 2'b00 or 2'b11;+ POR default
   wire lfs_disable           = xif_config_dout[5]; //26
   wire loopback              = xif_config_dout[4]; //25 // xmac functional loopback signal
   wire tx_output_en          = xif_config_dout[3]; //24
   wire sel_por_clk_src       = xif_config_dout[2]; //23 // power on reset loopback to insure the existance of sys_clk.
   wire led_polarity          = xif_config_dout[1]; //22 +:1; -:0;
   wire force_LED_on          = xif_config_dout[0]; //21

 // auto reset generation logic  
 FD1  d_sel_clk_25mhz_FD1(.D(sel_clk_25mhz),.CP(clk),.Q(d_sel_clk_25mhz));
 FD1  d_pcs_bypass_FD1(.D(pcs_bypass),.CP(clk),.Q(d_pcs_bypass));
 FD1  d_mii_mode_FD1(.D(mii_mode),.CP(clk),.Q(d_mii_mode));
 FD1  d_gmii_mode_FD1(.D(gmii_mode),.CP(clk),.Q(d_gmii_mode));
 FD1  d_loopback_FD1(.D(loopback),.CP(clk),.Q(d_loopback));
 FD1  d_sel_por_clk_src_FD1(.D(sel_por_clk_src),.CP(clk),.Q(d_sel_por_clk_src));

   assign change_clk_source_pls =  (sel_clk_25mhz ^ d_sel_clk_25mhz) |
                                   (pcs_bypass    ^ d_pcs_bypass)    |
                                   (mii_mode      ^ d_mii_mode)      |
	                           (gmii_mode     ^ d_gmii_mode)     |
                                   (loopback      ^ d_loopback)      |
                                   (sel_por_clk_src  ^ d_sel_por_clk_src)  ;
   
   
 /* ----------------------------- Parameters: IPG --------------------------- */
xREG2 #(24) ipg_values_xREG2 (.clk(clk), 
                      .reset(tx_reg_reset),
                      .reset_value({3'd1,5'd13,8'h0a,8'h03}),
                      .load(ld_ipg_values), 
                      .din(wr_data[23:0]), 
                      .qout({stretch_constant[2:0],
                             stretch_ratio[4:0],
                             ipg_value1[7:0],
			     reserved_ipg[4:0],
                             ipg_value[2:0]}));
 
 /* ------------------------ Parameters: tx Min Packet Size -------------------- */
xREG2 #(10) tx_min_kt_size_xREG2 (.clk(clk), 
                      .reset(tx_reg_reset),
                      .reset_value({7'h8,3'b0}),      // default value is 64 bytes
                      .load(ld_minpkt_slot_pa_sizes), 
                      .din({wr_data[9:3],3'b0}),      // Bits[2:0] are ignored.
                      .qout(tx_min_pkt_size));

   assign no_tx_min_pkt_size_chk = ~|tx_min_pkt_size;
   
 /* --------------------------- Parameters: Slot Time ----------------------- */
 // The Pause frame time unit: 512 bits (64 bytes) time == slot time.
 // For the 156.25Mhz, every clock is 8-byte time.
 // 8 clock is 64 byte time.
 // Recommended slot_time value is 8 (clocks).
xREG2 #(8) slot_time_xREG2 (.clk(clk), 
                      .reset(tx_reg_reset),
                      .reset_value(8'h08),
                      .load(ld_minpkt_slot_pa_sizes), 
                      .din(wr_data[17:10]), 
                      .qout(slot_time));

  /* ------------------------ Parameters: Min Packet Size -------------------- */
xREG2 #(10) rx_min_pkt_size_xREG2 (.clk(clk), 
                      .reset(tx_reg_reset),
                      .reset_value(10'h40),
                      .load(ld_minpkt_slot_pa_sizes), 
                      .din(wr_data[29:20]), 
                      .qout(rx_min_pkt_size));

   assign no_rx_min_pkt_size_chk = ~(|rx_min_pkt_size);
 
/* ------------------------ Parameters: Max Packet Size -------------------- */
xREG2 #(14)  max_pkt_size_xREG2 (.clk(clk), 
                      .reset(tx_reg_reset|rx_reg_reset),
                      .reset_value(14'd1518),
                      .load(ld_max_pkt_burst_sizes), 
                      .din(wr_data[13:0]), 
                      .qout(max_pkt_size));

 /* ------------ Address Detection & Filtering: MAC Unicast Address --------- */
 register_load_X16 MAC_ADDR_HI(.clk(clk),.load(ld_mac_unique_addr[0]),.din(wr_data[15:0]),.dout(mac_unique_addr[47:32]));
 register_load_X16 MAC_ADDR_MD(.clk(clk),.load(ld_mac_unique_addr[1]),.din(wr_data[15:0]),.dout(mac_unique_addr[31:16]));
 register_load_X16 MAC_ADDR_LO(.clk(clk),.load(ld_mac_unique_addr[2]),.din(wr_data[15:0]),.dout(mac_unique_addr[15:0]));
 /* ------------------------------------------------------------------------- */
  
 

/***********************************************
 * RxMac statistical counters
 * *********************************************/

 /* ----------------- Statistics: Maximum Packet Size Error Counter --------- */
 counter_rac_load_X8 MAX_PKT_ERR_CNTR(.clk   (clk),
                                      .clr   (rac_max_pkt_err_cntr),
                                      .enable(inc_max_pkt_err_count_sync),
                                      .load  (ld_max_pkt_err_cntr),
                                      .din   (wr_data[7:0]),
                                      .count (max_pkt_err_count));

 assign set_max_pkt_err_cntr_exp = inc_max_pkt_err_count_sync &
                                  (max_pkt_err_count == 8'hFF);

// synopsys translate_off
// diag
always @ (inc_max_pkt_err_count_sync or warning_msg_en)
  if (~rx_reg_reset & warning_msg_en)
    $display("\n (* ERROR:  at sim time = %d, inc_max_pkt_err_count_sync = %b ,max_pkt_err_count = %d *) \n", $time, inc_max_pkt_err_count_sync, max_pkt_err_count);
  else ;
// synopsys translate_on
   

 /* ---------------------- Statistics: Alignment Error Counter -------------- */
 counter_rac_load_X8 ALIGN_ERR_CNTR(.clk   (clk),
                                    .clr   (rac_align_err_cntr),
                                    .enable(inc_align_err_count_sync),
                                    .load  (ld_align_err_cntr),
                                    .din   (wr_data[7:0]),
                                    .count (align_err_count));
 assign set_align_err_cntr_exp = inc_align_err_count_sync &
                                    (align_err_count == 8'hFF);

 /* ------------------------ Statistics: CRC Error Counter ----------------- */
 counter_rac_load_X8 CRC_ERR_CNTR(.clk   (clk),
                                  .clr   (rac_crc_err_cntr),
                                  .enable(inc_crc_err_count_sync),
                                  .load  (ld_crc_err_cntr),
                                  .din   (wr_data[7:0]),
                                  .count (crc_err_count));
 assign set_crc_err_cntr_exp = inc_crc_err_count_sync & 
                                  (crc_err_count == 8'hFF);

// synopsys translate_off
// diag
always @ (inc_crc_err_count_sync or warning_msg_en)
  if (~rx_reg_reset & warning_msg_en)
    $display("\n (* ERROR:  at sim time = %d, inc_crc_err_count_sync = %b , crc_err_count = %d *) \n", $time,inc_crc_err_count_sync , crc_err_count);
  else ;
// synopsys translate_on
   
 /* -------------------- Statistics: Rx Code Violation Counter ------------- */
  counter_rac_load_X8 CODE_VIOL_CNTR(.clk   (clk),
                                     .clr   (rac_code_viol_cntr),
                                     .enable(inc_code_viol_count_sync),
                                     .load  (ld_code_viol_cntr),
                                     .din   (wr_data[7:0]),
                                     .count (code_viol_count));
 assign set_code_viol_cntr_exp =  inc_code_viol_count_sync &
                                (code_viol_count == 8'hFF);

// synopsys translate_off
// diag
always @ (inc_code_viol_count_sync or warning_msg_en)
  if (~rx_reg_reset & warning_msg_en)
    $display("\n (* ERROR:  at sim time = %d, inc_code_viol_count_sync = %b , code_viol_count = %d *) \n", $time,inc_code_viol_count_sync , code_viol_count);
  else ;
// synopsys translate_on
 
 /* -------------------------- Statistics: Rx Byte Counter ------------------ */
 FD1 D_TOG_RX_BCNT(.D(toggle_rx_bcount_sync),.CP(clk),
                   .Q(d_toggle_rx_bcount_sync));
 assign inc_rx_bcount = toggle_rx_bcount_sync ^ d_toggle_rx_bcount_sync;

hs_ld_counter_X32 rx_byte_count_stat_hs_ld_counter_X32(
.clk(clk),
.reset(rx_reg_reset),
.inc(inc_rx_bcount),
.clr(rac_rx_byte_cntr),
.max_value({32{1'b1}}),
.load(ld_rx_byte_cntr),
.load_value(wr_data[31:0]),
.Q(rx_byte_count_stat),
.max_value_reached(rx_byte_count_stat_reached));

 assign set_rx_byte_count_exp = inc_rx_bcount & 
                                 rx_byte_count_stat_reached;

 /* -------------------- Statistics: RX Broadcast Frames Counter ------------ */
  counter_rac_load_X21 BCAST_CNTR(.clk   (clk),
                                  .clr   (rac_bcast_cntr),
                                  .enable(inc_bcast_count_sync),
                                  .load  (ld_bcast_cntr),
                                  .din   (wr_data[20:0]),
                                  .count (bcast_count));
 assign set_bcast_count_exp = inc_bcast_count_sync & (bcast_count == 21'h1FFFFF);

 /* -------------------- Statistics: RX Multicast Frames Counter ------------ */
  counter_rac_load_X21 MCAST_CNTR(.clk   (clk),
                                  .clr   (rac_mcast_cntr),
                                  .enable(inc_mcast_count_sync),
                                  .load  (ld_mcast_cntr),
                                  .din   (wr_data[20:0]),
                                  .count (mcast_count));
 assign set_mcast_count_exp = inc_mcast_count_sync & (mcast_count == 21'h1FFFFF);

 /* ---------------------- Statistics: RX Fragments Counter ----------------- */
 counter_rac_load_X21 FRAG_CNTR(.clk   (clk),
                                .clr   (rac_fragment_cntr),
                                .enable(inc_min_pkt_err_count_sync),
                                .load  (ld_fragment_cntr),
                                .din   (wr_data[20:0]),
                                .count (fragment_count));
 assign set_fragment_count_exp = inc_min_pkt_err_count_sync &
                                (fragment_count == 21'h1FFFFF);
 
 /* ------------------------ Statistics: Histogram Counters ----------------- */
 counter_rac_load_X21 HISTO_CNTR1(.clk   (clk),
                                  .clr   (rac_histo_cntr1),
                                  .enable(inc_histo_cntr1),
                                  .load  (ld_histo_cntr1),
                                  .din   (wr_data[20:0]),
                                  .count (histo_count1));
 assign set_histo_count1_exp = inc_histo_cntr1 & (histo_count1 == 21'h1FFFFF);

 counter_rac_load_X21 HISTO_CNTR2(.clk   (clk),
                                  .clr   (rac_histo_cntr2),
                                  .enable(inc_histo_cntr2),
                                  .load  (ld_histo_cntr2),
                                  .din   (wr_data[20:0]),
                                  .count (histo_count2));
 assign set_histo_count2_exp = inc_histo_cntr2 & (histo_count2 == 21'h1FFFFF);
 
 counter_rac_load_X20 HISTO_CNTR3(.clk   (clk),
                                  .clr   (rac_histo_cntr3),
                                  .enable(inc_histo_cntr3),
                                  .load  (ld_histo_cntr3),
                                  .din   (wr_data[19:0]),
                                  .count (histo_count3));
 assign set_histo_count3_exp = inc_histo_cntr3 & (histo_count3 == 20'hFFFFF);
 
 counter_rac_load_X19 HISTO_CNTR4(.clk   (clk),
                                  .clr   (rac_histo_cntr4),
                                  .enable(inc_histo_cntr4),
                                  .load  (ld_histo_cntr4),
                                  .din   (wr_data[18:0]),
                                  .count (histo_count4));
 assign set_histo_count4_exp = inc_histo_cntr4 & (histo_count4 == 19'h7FFFF);
 
 counter_rac_load_X18 HISTO_CNTR5(.clk   (clk),
                                  .clr   (rac_histo_cntr5),
                                  .enable(inc_histo_cntr5),
                                  .load  (ld_histo_cntr5),
                                  .din   (wr_data[17:0]),
                                  .count (histo_count5));
 assign set_histo_count5_exp = inc_histo_cntr5 & (histo_count5 == 18'h3FFFF);
 
 counter_rac_load_X17 HISTO_CNTR6(.clk   (clk),
                                  .clr   (rac_histo_cntr6),
                                  .enable(inc_histo_cntr6),
                                  .load  (ld_histo_cntr6),
                                  .din   (wr_data[16:0]),
                                  .count (histo_count6));
 assign set_histo_count6_exp = inc_histo_cntr6 & (histo_count6 == 17'h1FFFF);

 wire inc_histo_cntr7_muxd_reg;
 wire inc_histo_cntr7_muxd  = mac2ipp_pkt_cnt_en ? rxmac_ipp_tag_reg : inc_histo_cntr7;
 FD1  inc_histo_cntr7_muxd_reg_FF(.D(inc_histo_cntr7_muxd),.CP(clk),.Q(inc_histo_cntr7_muxd_reg));

 counter_rac_load_X21 HISTO_CNTR7(.clk   (clk),
                                  .clr   (rac_histo_cntr7),
                                  .enable(inc_histo_cntr7_muxd_reg), // This egable is different from other counter.
                                  .load  (ld_histo_cntr7),
                                  .din   (wr_data[20:0]),
                                  .count (histo_count7));
 assign set_histo_count7_exp = inc_histo_cntr7 & (histo_count7 == {21{1'b1}});

 
 /* ------------------------------------------------------------------- */

 /* ---------------------- Statistics: Link Fault Counter ------------- */
 counter_rac_load_X8 LINK_FAULT_CNTR(.clk   (clk),
                                     .clr   (rac_link_fault_cntr),
                                     .enable(inc_link_fault_count_sync),
                                     .load  (ld_link_fault_cntr),
                                     .din   (wr_data[7:0]),
                                     .count (link_fault_count));
 assign set_link_fault_cntr_exp =   inc_link_fault_count_sync &
                                    (link_fault_count == 8'hFF);

/***********************************************
 * TxMac statistical counters
 * *********************************************/
/* -------------------- Statistics: Tx Byte Counter --------------------- */
FD1 D_TOG_TX_BCNT(.D(toggle_tx_bcount_sync),.CP(clk),
                .Q(d_toggle_tx_bcount_sync));
 wire   inc_tx_bcount = toggle_tx_bcount_sync ^ d_toggle_tx_bcount_sync;

hs_ld_counter_X32 tx_byte_count_stat_hs_ld_counter_X32(
.clk(clk),
.reset(tx_reg_reset),
.inc(inc_tx_bcount),
.clr(rac_tx_byte_cntr),
.max_value({32{1'b1}}),
.load(ld_tx_byte_cntr),
.load_value(wr_data[31:0]),
.Q(tx_byte_count_stat),
.max_value_reached(tx_byte_count_stat_reached));

 assign set_tx_byte_count_exp = inc_tx_bcount & 
                                 tx_byte_count_stat_reached;

/* ---------------------------------------------------------------------- */

/* --------------- Statistics: Tx Frame Counter ------------------------- */
 FD1 D_TOG_TX_FMCNT(.D(toggle_txframe_count_sync),.CP(clk),
                                  .Q(d_toggle_txframe_count_sync));
 wire   inc_tx_fmcount = toggle_txframe_count_sync ^ d_toggle_txframe_count_sync;

hs_ld_counter_X32 tx_frame_count_stat_hs_ld_counter_X32(
.clk(clk),
.reset(tx_reg_reset),
.inc(inc_tx_fmcount),
.clr(rac_tx_frame_cntr),
.max_value({32{1'b1}}),
.load(ld_tx_frame_cntr),
.load_value(wr_data[31:0]),
.Q(tx_frame_count_stat),
.max_value_reached(tx_frame_count_stat_reached));

 assign set_tx_frame_count_exp = inc_tx_fmcount & 
                                 tx_frame_count_stat_reached;

/* ---------------------------------------------------------------------- */



/**************************************************************************
 * Start of ALT_ADDR_AND_HASH_FUNC selectable logic signals
 * ************************************************************************/

`ifdef ALT_ADDR_AND_HASH_FUNC
 /* ----------- Address Detection & Filtering: MAC Alternate Address -------- */

 xREG #(16) alt_addr_comp_en_31_0_xREG (.din(wr_data[15:0]),
                                        .clk(clk),
                                        .en(ld_alt_addr_comp_en),
                                        .reset(rx_reg_reset),
                                        .qout(alt_addr_comp_en[15:0]));

 register_load_X16 MAC_ALT_ADDR0_HI(.clk(clk),.load(ld_mac_alt_addr0[0]),.din(wr_data[15:0]),.dout(mac_alt_addr0[47:32]));
 register_load_X16 MAC_ALT_ADDR0_MD(.clk(clk),.load(ld_mac_alt_addr0[1]),.din(wr_data[15:0]),.dout(mac_alt_addr0[31:16]));
 register_load_X16 MAC_ALT_ADDR0_LO(.clk(clk),.load(ld_mac_alt_addr0[2]),.din(wr_data[15:0]),.dout(mac_alt_addr0[15:0]));

 register_load_X16 MAC_ALT_ADDR1_HI(.clk(clk),.load(ld_mac_alt_addr1[0]),.din(wr_data[15:0]),.dout(mac_alt_addr1[47:32]));
 register_load_X16 MAC_ALT_ADDR1_MD(.clk(clk),.load(ld_mac_alt_addr1[1]),.din(wr_data[15:0]),.dout(mac_alt_addr1[31:16]));
 register_load_X16 MAC_ALT_ADDR1_LO(.clk(clk),.load(ld_mac_alt_addr1[2]),.din(wr_data[15:0]),.dout(mac_alt_addr1[15:0]));

 register_load_X16 MAC_ALT_ADDR2_HI(.clk(clk),.load(ld_mac_alt_addr2[0]),.din(wr_data[15:0]),.dout(mac_alt_addr2[47:32]));
 register_load_X16 MAC_ALT_ADDR2_MD(.clk(clk),.load(ld_mac_alt_addr2[1]),.din(wr_data[15:0]),.dout(mac_alt_addr2[31:16]));
 register_load_X16 MAC_ALT_ADDR2_LO(.clk(clk),.load(ld_mac_alt_addr2[2]),.din(wr_data[15:0]),.dout(mac_alt_addr2[15:0]));

 register_load_X16 MAC_ALT_ADDR3_HI(.clk(clk),.load(ld_mac_alt_addr3[0]),.din(wr_data[15:0]),.dout(mac_alt_addr3[47:32]));
 register_load_X16 MAC_ALT_ADDR3_MD(.clk(clk),.load(ld_mac_alt_addr3[1]),.din(wr_data[15:0]),.dout(mac_alt_addr3[31:16]));
 register_load_X16 MAC_ALT_ADDR3_LO(.clk(clk),.load(ld_mac_alt_addr3[2]),.din(wr_data[15:0]),.dout(mac_alt_addr3[15:0]));

 register_load_X16 MAC_ALT_ADDR4_HI(.clk(clk),.load(ld_mac_alt_addr4[0]),.din(wr_data[15:0]),.dout(mac_alt_addr4[47:32]));
 register_load_X16 MAC_ALT_ADDR4_MD(.clk(clk),.load(ld_mac_alt_addr4[1]),.din(wr_data[15:0]),.dout(mac_alt_addr4[31:16]));
 register_load_X16 MAC_ALT_ADDR4_LO(.clk(clk),.load(ld_mac_alt_addr4[2]),.din(wr_data[15:0]),.dout(mac_alt_addr4[15:0]));

 register_load_X16 MAC_ALT_ADDR5_HI(.clk(clk),.load(ld_mac_alt_addr5[0]),.din(wr_data[15:0]),.dout(mac_alt_addr5[47:32]));
 register_load_X16 MAC_ALT_ADDR5_MD(.clk(clk),.load(ld_mac_alt_addr5[1]),.din(wr_data[15:0]),.dout(mac_alt_addr5[31:16]));
 register_load_X16 MAC_ALT_ADDR5_LO(.clk(clk),.load(ld_mac_alt_addr5[2]),.din(wr_data[15:0]),.dout(mac_alt_addr5[15:0]));

 register_load_X16 MAC_ALT_ADDR6_HI(.clk(clk),.load(ld_mac_alt_addr6[0]),.din(wr_data[15:0]),.dout(mac_alt_addr6[47:32]));
 register_load_X16 MAC_ALT_ADDR6_MD(.clk(clk),.load(ld_mac_alt_addr6[1]),.din(wr_data[15:0]),.dout(mac_alt_addr6[31:16]));
 register_load_X16 MAC_ALT_ADDR6_LO(.clk(clk),.load(ld_mac_alt_addr6[2]),.din(wr_data[15:0]),.dout(mac_alt_addr6[15:0]));

 register_load_X16 MAC_ALT_ADDR7_HI(.clk(clk),.load(ld_mac_alt_addr7[0]),.din(wr_data[15:0]),.dout(mac_alt_addr7[47:32]));
 register_load_X16 MAC_ALT_ADDR7_MD(.clk(clk),.load(ld_mac_alt_addr7[1]),.din(wr_data[15:0]),.dout(mac_alt_addr7[31:16]));
 register_load_X16 MAC_ALT_ADDR7_LO(.clk(clk),.load(ld_mac_alt_addr7[2]),.din(wr_data[15:0]),.dout(mac_alt_addr7[15:0]));

 register_load_X16 MAC_ALT_ADDR8_HI(.clk(clk),.load(ld_mac_alt_addr8[0]),.din(wr_data[15:0]),.dout(mac_alt_addr8[47:32]));
 register_load_X16 MAC_ALT_ADDR8_MD(.clk(clk),.load(ld_mac_alt_addr8[1]),.din(wr_data[15:0]),.dout(mac_alt_addr8[31:16]));
 register_load_X16 MAC_ALT_ADDR8_LO(.clk(clk),.load(ld_mac_alt_addr8[2]),.din(wr_data[15:0]),.dout(mac_alt_addr8[15:0]));

 register_load_X16 MAC_ALT_ADDR9_HI(.clk(clk),.load(ld_mac_alt_addr9[0]),.din(wr_data[15:0]),.dout(mac_alt_addr9[47:32]));
 register_load_X16 MAC_ALT_ADDR9_MD(.clk(clk),.load(ld_mac_alt_addr9[1]),.din(wr_data[15:0]),.dout(mac_alt_addr9[31:16]));
 register_load_X16 MAC_ALT_ADDR9_LO(.clk(clk),.load(ld_mac_alt_addr9[2]),.din(wr_data[15:0]),.dout(mac_alt_addr9[15:0]));

 register_load_X16 MAC_ALT_ADDR10_HI(.clk(clk),.load(ld_mac_alt_addr10[0]),.din(wr_data[15:0]),.dout(mac_alt_addr10[47:32]));
 register_load_X16 MAC_ALT_ADDR10_MD(.clk(clk),.load(ld_mac_alt_addr10[1]),.din(wr_data[15:0]),.dout(mac_alt_addr10[31:16]));
 register_load_X16 MAC_ALT_ADDR10_LO(.clk(clk),.load(ld_mac_alt_addr10[2]),.din(wr_data[15:0]),.dout(mac_alt_addr10[15:0]));

 register_load_X16 MAC_ALT_ADDR11_HI(.clk(clk),.load(ld_mac_alt_addr11[0]),.din(wr_data[15:0]),.dout(mac_alt_addr11[47:32]));
 register_load_X16 MAC_ALT_ADDR11_MD(.clk(clk),.load(ld_mac_alt_addr11[1]),.din(wr_data[15:0]),.dout(mac_alt_addr11[31:16]));
 register_load_X16 MAC_ALT_ADDR11_LO(.clk(clk),.load(ld_mac_alt_addr11[2]),.din(wr_data[15:0]),.dout(mac_alt_addr11[15:0]));

 register_load_X16 MAC_ALT_ADDR12_HI(.clk(clk),.load(ld_mac_alt_addr12[0]),.din(wr_data[15:0]),.dout(mac_alt_addr12[47:32]));
 register_load_X16 MAC_ALT_ADDR12_MD(.clk(clk),.load(ld_mac_alt_addr12[1]),.din(wr_data[15:0]),.dout(mac_alt_addr12[31:16]));
 register_load_X16 MAC_ALT_ADDR12_LO(.clk(clk),.load(ld_mac_alt_addr12[2]),.din(wr_data[15:0]),.dout(mac_alt_addr12[15:0]));

 register_load_X16 MAC_ALT_ADDR13_HI(.clk(clk),.load(ld_mac_alt_addr13[0]),.din(wr_data[15:0]),.dout(mac_alt_addr13[47:32]));
 register_load_X16 MAC_ALT_ADDR13_MD(.clk(clk),.load(ld_mac_alt_addr13[1]),.din(wr_data[15:0]),.dout(mac_alt_addr13[31:16]));
 register_load_X16 MAC_ALT_ADDR13_LO(.clk(clk),.load(ld_mac_alt_addr13[2]),.din(wr_data[15:0]),.dout(mac_alt_addr13[15:0]));

 register_load_X16 MAC_ALT_ADDR14_HI(.clk(clk),.load(ld_mac_alt_addr14[0]),.din(wr_data[15:0]),.dout(mac_alt_addr14[47:32]));
 register_load_X16 MAC_ALT_ADDR14_MD(.clk(clk),.load(ld_mac_alt_addr14[1]),.din(wr_data[15:0]),.dout(mac_alt_addr14[31:16]));
 register_load_X16 MAC_ALT_ADDR14_LO(.clk(clk),.load(ld_mac_alt_addr14[2]),.din(wr_data[15:0]),.dout(mac_alt_addr14[15:0]));

 register_load_X16 MAC_ALT_ADDR15_HI(.clk(clk),.load(ld_mac_alt_addr15[0]),.din(wr_data[15:0]),.dout(mac_alt_addr15[47:32]));
 register_load_X16 MAC_ALT_ADDR15_MD(.clk(clk),.load(ld_mac_alt_addr15[1]),.din(wr_data[15:0]),.dout(mac_alt_addr15[31:16]));
 register_load_X16 MAC_ALT_ADDR15_LO(.clk(clk),.load(ld_mac_alt_addr15[2]),.din(wr_data[15:0]),.dout(mac_alt_addr15[15:0]));

 /* ------------------------------------------------------------------------- */

 /* --------- Address Detection & Filtering: Multicast Address Filter ------- */
 register_load_X16 ADDR_FILTER_HI(.clk(clk),.load(ld_addr_filter[0]),.din(wr_data[15:0]),.dout(addr_filter[47:32]));
 register_load_X16 ADDR_FILTER_MD(.clk(clk),.load(ld_addr_filter[1]),.din(wr_data[15:0]),.dout(addr_filter[31:16]));
 register_load_X16 ADDR_FILTER_LO(.clk(clk),.load(ld_addr_filter[2]),.din(wr_data[15:0]),.dout(addr_filter[15:0]));
 /* ------------------------------------------------------------------------- */

 /* ------ Address Detection & Filtering: Multicast Address Filter Mask ----- */
 register_load_X16 ADDR_MASK_LSB_REG(.clk(clk),.load(ld_addr_filter_mask_lsb),.din(wr_data[15:0]),.dout(addr_filter_mask_lsb));
 register_load_X8  ADDR_MASK_MSB_REG(.clk(clk),.load(ld_addr_filter_mask_msb),.din(wr_data[7:0]),.dout(addr_filter_mask_msb));
 /* ------------------------------------------------------------------------- */
   
 /* ---------------- Address Detection & Filtering: Hash Table -------------- */
 register_load_X16 HASH_TABLE_REG15(.clk(clk),.load(ld_hash_table[0]),.din(wr_data[15:0]),.dout(hash_table[255:240]));
 register_load_X16 HASH_TABLE_REG14(.clk(clk),.load(ld_hash_table[1]),.din(wr_data[15:0]),.dout(hash_table[239:224]));
 register_load_X16 HASH_TABLE_REG13(.clk(clk),.load(ld_hash_table[2]),.din(wr_data[15:0]),.dout(hash_table[223:208]));
 register_load_X16 HASH_TABLE_REG12(.clk(clk),.load(ld_hash_table[3]),.din(wr_data[15:0]),.dout(hash_table[207:192]));
 register_load_X16 HASH_TABLE_REG11(.clk(clk),.load(ld_hash_table[4]),.din(wr_data[15:0]),.dout(hash_table[191:176]));
 register_load_X16 HASH_TABLE_REG10(.clk(clk),.load(ld_hash_table[5]),.din(wr_data[15:0]),.dout(hash_table[175:160]));
 register_load_X16 HASH_TABLE_REG9 (.clk(clk),.load(ld_hash_table[6]),.din(wr_data[15:0]),.dout(hash_table[159:144]));
 register_load_X16 HASH_TABLE_REG8 (.clk(clk),.load(ld_hash_table[7]),.din(wr_data[15:0]),.dout(hash_table[143:128]));
 register_load_X16 HASH_TABLE_REG7 (.clk(clk),.load(ld_hash_table[8]),.din(wr_data[15:0]),.dout(hash_table[127:112]));
 register_load_X16 HASH_TABLE_REG6 (.clk(clk),.load(ld_hash_table[9]),.din( wr_data[15:0]),.dout(hash_table[111:96]));
 register_load_X16 HASH_TABLE_REG5 (.clk(clk),.load(ld_hash_table[10]),.din(wr_data[15:0]),.dout(hash_table[95:80]));
 register_load_X16 HASH_TABLE_REG4 (.clk(clk),.load(ld_hash_table[11]),.din(wr_data[15:0]),.dout(hash_table[79:64]));
 register_load_X16 HASH_TABLE_REG3 (.clk(clk),.load(ld_hash_table[12]),.din(wr_data[15:0]),.dout(hash_table[63:48]));
 register_load_X16 HASH_TABLE_REG2 (.clk(clk),.load(ld_hash_table[13]),.din(wr_data[15:0]),.dout(hash_table[47:32]));
 register_load_X16 HASH_TABLE_REG1 (.clk(clk),.load(ld_hash_table[14]),.din(wr_data[15:0]),.dout(hash_table[31:16]));
 register_load_X16 HASH_TABLE_REG0 (.clk(clk),.load(ld_hash_table[15]),.din(wr_data[15:0]),.dout(hash_table[15:0]));
				
 /* ------------------------------------------------------------------------- */
 /* ---------------- Mac host info table ------------------------------------ */
 xREG #(`H_INFO_WIDTH) mac_host_info0_xREG (.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info0 ),.reset(rx_reg_reset),.qout(mac_host_info0 ));
 xREG #(`H_INFO_WIDTH) mac_host_info1_xREG (.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info1 ),.reset(rx_reg_reset),.qout(mac_host_info1 ));
 xREG #(`H_INFO_WIDTH) mac_host_info2_xREG (.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info2 ),.reset(rx_reg_reset),.qout(mac_host_info2 ));
 xREG #(`H_INFO_WIDTH) mac_host_info3_xREG (.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info3 ),.reset(rx_reg_reset),.qout(mac_host_info3 ));
 xREG #(`H_INFO_WIDTH) mac_host_info4_xREG (.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info4 ),.reset(rx_reg_reset),.qout(mac_host_info4 ));
 xREG #(`H_INFO_WIDTH) mac_host_info5_xREG (.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info5 ),.reset(rx_reg_reset),.qout(mac_host_info5 ));
 xREG #(`H_INFO_WIDTH) mac_host_info6_xREG (.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info6 ),.reset(rx_reg_reset),.qout(mac_host_info6 ));
 xREG #(`H_INFO_WIDTH) mac_host_info7_xREG (.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info7 ),.reset(rx_reg_reset),.qout(mac_host_info7 ));
 xREG #(`H_INFO_WIDTH) mac_host_info8_xREG (.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info8 ),.reset(rx_reg_reset),.qout(mac_host_info8 ));
 xREG #(`H_INFO_WIDTH) mac_host_info9_xREG (.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info9 ),.reset(rx_reg_reset),.qout(mac_host_info9 ));
 xREG #(`H_INFO_WIDTH) mac_host_info10_xREG(.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info10),.reset(rx_reg_reset),.qout(mac_host_info10));
 xREG #(`H_INFO_WIDTH) mac_host_info11_xREG(.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info11),.reset(rx_reg_reset),.qout(mac_host_info11));
 xREG #(`H_INFO_WIDTH) mac_host_info12_xREG(.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info12),.reset(rx_reg_reset),.qout(mac_host_info12));
 xREG #(`H_INFO_WIDTH) mac_host_info13_xREG(.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info13),.reset(rx_reg_reset),.qout(mac_host_info13));
 xREG #(`H_INFO_WIDTH) mac_host_info14_xREG(.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info14),.reset(rx_reg_reset),.qout(mac_host_info14));
 xREG #(`H_INFO_WIDTH) mac_host_info15_xREG(.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info15),.reset(rx_reg_reset),.qout(mac_host_info15));
 xREG #(`H_INFO_WIDTH) mac_host_info16_xREG(.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info16),.reset(rx_reg_reset),.qout(mac_host_info16));
 xREG #(`H_INFO_WIDTH) mac_host_info17_xREG(.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info17),.reset(rx_reg_reset),.qout(mac_host_info17));
 xREG #(`H_INFO_WIDTH) mac_host_info18_xREG(.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info18),.reset(rx_reg_reset),.qout(mac_host_info18));
 xREG #(`H_INFO_WIDTH) mac_host_info19_xREG(.din(wr_data[`H_INFO]),.clk(clk),.en(ld_mac_host_info19),.reset(rx_reg_reset),.qout(mac_host_info19));
 /* ------------------------------------------------------------------------- */

`endif // !ifdef ALT_ADDR_AND_HASH_FUNC

/**************************************************************************
 * end of ALT_ADDR_AND_HASH_FUNC selectable logic
 * ************************************************************************/

/* led logic */

   // free running clocks 
   wire [15:0] prescalar_cnt;
   wire        prescalar_cnt_max_pls;
   counter_X16 prescalar_cnt_counter_X16(.clk(clk),
               .clr(hw_reset),
               .enable(1'b1),.count(prescalar_cnt[15:0]));

`ifdef ESR_FAST_SIM
   assign prescalar_cnt_max_pls = prescalar_cnt[0] == 1'b1;
`else
   assign prescalar_cnt_max_pls = prescalar_cnt[15:0] == 16'hffff;
`endif

   // tx_led related logic
   wire       tx_led;
   wire [9:0] tx_led_cnt;
   wire   set_tx_led_lv = tx_output_en & tx_data_valid_clk;
   PlsGen set_tx_led_pls_PlsGen  (.reset(hw_reset),.clk(clk),
                                  .iSigIn(set_tx_led_lv),
                                  .oPlsOut(set_tx_led_pls));
   
   wire        tx_led_cnt_max_pls;
   
   wire   tx_led_cnt_en = prescalar_cnt_max_pls & tx_led;
   
   counter_X10 tx_led_counter_X10(.clk(clk),.clr(hw_reset),
               .enable(tx_led_cnt_en),.count(tx_led_cnt[9:0]));

// eco 
`ifdef NEPTUNE
   assign tx_led_cnt_max_pls = tx_led_cnt[9:0] == 10'h3ff;
`else
   wire   tx_led_cnt_max_lv  = tx_led_cnt[9:0] == 10'h3ff;
   PlsGen tx_led_cnt_max_pls_PlsGen  (.reset(hw_reset),.clk(clk),
                                      .iSigIn(tx_led_cnt_max_lv),
                                      .oPlsOut(tx_led_cnt_max_pls));
`endif
   
   SRFF  tx_led_SRFF(.reset(hw_reset),.clk(clk),.iSet(set_tx_led_pls),
                     .iRst(tx_led_cnt_max_pls),.oQ(tx_led));

   // rx_led related logic
   wire       rx_led;
   wire [9:0] rx_led_cnt;
   
   PlsGen set_rx_led_pls_PlsGen  (.reset(hw_reset),.clk(clk),
                             .iSigIn(rx_data_valid_gmux_reg_clk),
                             .oPlsOut(set_rx_led_pls));
   
   wire   rx_led_cnt_max_pls;

   wire   rx_led_cnt_en = prescalar_cnt_max_pls & rx_led;
   
   counter_X10 rx_led_counter_X10(.clk(clk),.clr(hw_reset),
                                  .enable(rx_led_cnt_en),
                                  .count(rx_led_cnt[9:0]));


// eco
`ifdef NEPTUNE
   assign rx_led_cnt_max_pls = rx_led_cnt[9:0] == 10'h3ff;
`else
   wire   rx_led_cnt_max_lv  = rx_led_cnt[9:0] == 10'h3ff;
   PlsGen rx_led_cnt_max_pls_PlsGen  (.reset(hw_reset),.clk(clk),
                                      .iSigIn(rx_led_cnt_max_lv),
                                      .oPlsOut(rx_led_cnt_max_pls));
`endif
   
   SRFF  rx_led_SRFF(.reset(hw_reset),.clk(clk),
                     .iSet(set_rx_led_pls),
                     .iRst(rx_led_cnt_max_pls),
                     .oQ(rx_led));

 wire   txrx_led      = tx_led | rx_led | force_LED_on;
 wire   activity_led  = led_polarity ? txrx_led  : ~txrx_led;

   always @ (posedge clk)
     begin
         rxmac_ipp_ack_reg   <=  rxmac_ipp_ack;                               
         ipp_rxmac_req_reg   <=  ipp_rxmac_req;                               
         rxmac_ipp_tag_reg   <=  rxmac_ipp_tag;                               
         rxmac_ipp_ctrl_reg  <=  rxmac_ipp_ctrl;                             
	 rxmac_ipp_stat_reg  <=  rxmac_ipp_stat;		   
         txmac_opp_req_reg   <=  txmac_opp_req;                               
         opp_txmac_ack_reg   <=  opp_txmac_ack;                               
         opp_txmac_tag_reg   <=  opp_txmac_tag;                               
         opp_txmac_abort_reg <=  opp_txmac_abort;                           
	 opp_txmac_stat_reg  <=  opp_txmac_stat;		   
     end   

   assign state_machine0 =  {
                            rxfifo_empty_clk_reg,
                            rxfifo_full_clk_reg,
                            txfifo_empty_clk_reg,
                            txfifo_full_clk_reg,
                            rxfifo_rd_ptr_clk[4:0], 
                            rxfifo_wr_ptr_clk[4:0], 
                            5'b0,
                            rxmac_ipp_stat_reg[22:20],
                            ALT_ADDR_AND_HASH_FUNC_value,
                            XGMII_ONLY_value,
                            xrlm_state,
                            mgrlm_state,
                            lfs_state[1:0],
                            sop_state,
                            xtlm_state[2:0]
                            };

   assign internal_signals1 =  {
                            rxmac_ipp_ack_reg,
                            ipp_rxmac_req_reg,
                            rxmac_ipp_tag_reg,
                            rxmac_ipp_ctrl_reg,
                            rxmac_ipp_stat_reg[19:0],
                            txmac_opp_req_reg,
                            opp_txmac_ack_reg,
                            opp_txmac_tag_reg,
                            opp_txmac_abort_reg,
                            opp_txmac_stat_reg[3:0]
                            };
    
   assign internal_signals2 =    {6'b0,
                                  remote_fault_oc_sync,
                                  local_fault_oc_sync,
                                  xpcs_txc[7:0],
                                  xpcs_rxc[7:0],
                                  rx_heart_beat_timer_reg,// [3:0]
                                  tx_heart_beat_timer_reg // [3:0]
                                  };

   assign rx_internal_signals1 = {12'b0,rx_clk_div2,rx_nbclk_div2,
                                  S_detected_reg,
                                  T_E_detected_at_modified_pkt_reg,
                                  END_PKT_ERR_detected_a_at_modified_pkt_reg,
                                  END_PKT_ERR_detected_b_at_modified_pkt_reg,
                                  S_D_reg,
                                  S_I_reg,
                                  D_S_reg,
                                  I_S_reg,
                                  abort_bit_reg,
                                  rx_err_reg,
                                  crc_error_reg,
                                  kill_data_ready_reg,
                                  kill_crc_reg,
                                  rx_sel_reg[1:0],
                                  //
                                  last_byte_position[2:0]
                                  };

   assign tx_internal_signals1 = {tx_clk_div2,tx_nbclk_div2,
                                  txfifo_rd_ptr_clk[4:0],
                                  txfifo_wr_ptr_clk[4:0],
                                  tx_swap_reg,
                                  tx_on_reg,
                                  tx_on_half_reg,
                                  back2back_swap_reg1,
                                  replace_txd_time_reg,
                                  adjust2crc_full_case_last_byte_position_reg[2:0],
                                  adjust2crc_full_case_last_byte_position_is_3_or_7_reg,
                                  stretch_clks_reg[`BYTE],
                                  full_case_last_byte_position_reg[2:0]
                                  };
   
   assign tx_internal_signals2 = {1'b0,
                                  stretch_full_case_last_byte_position_reg[3:0],
                                  stretch_bytes_reg[2:0],
                                  minus_4bytes_reg,
                                  B_eop_reg,
                                  stretch_1_more_clk_reg,
                                  no_wasted_BW_reg,
                                  ipg_done_trail_temp_reg,
                                  tx_byte0_reg0[7:0],
                                  restart_ipg_timer_reg,
                                  eop_txclk_reg0,
                                  eop_w_fcs_reg0,
                                  tx_abort_reg0,
                                  eop_w_fcs_reg1,
                                  tx_abort_reg1,
                                  ipg_done_reg,
                                  ipg_done_lead_temp_reg,
                                  force_ipg_done_lead_reg,
                                  set_back2back_reg,
                                  back2back_reg
                                  };
   
    reg [31:0] 	 xmac_debug;

   always @ (/*--AUTOSENSE*/ 
                internal_signals1 or internal_signals2
	     or rx_internal_signals1 or state_machine0
	     or training_vector or tx_internal_signals1
	     or tx_internal_signals2 or xmac_debug_sel or xpcs_rxd
	     or xpcs_txd)
     case (xmac_debug_sel) // synopsys parallel_case full_case 
       4'h0   : xmac_debug = state_machine0;
       4'h1   : xmac_debug = xpcs_rxd[31:0];
       4'h2   : xmac_debug = xpcs_rxd[63:32];
       4'h3   : xmac_debug = xpcs_txd[31:0];
       4'h4   : xmac_debug = xpcs_txd[63:32];
       4'h5   : xmac_debug = internal_signals1;
       4'h6   : xmac_debug = internal_signals2;
       4'hA   : xmac_debug = rx_internal_signals1;
       4'hB   : xmac_debug = tx_internal_signals1;
       4'hC   : xmac_debug = tx_internal_signals2;
       `SEL_mac_training_vector : xmac_debug = training_vector[31:0];
       default: xmac_debug = state_machine0;
     endcase
   

endmodule // xmac_slv




/************************************
* Rising/Falling dual edge pulse gen
*************************************/
module PlsGenX (reset,clk,iSigIn,oPlsOut);

input  reset, clk, iSigIn;
output oPlsOut;

reg Q;

always @ (posedge clk)
if (reset) 
   Q <= 0;
else
   Q <= iSigIn;

wire Qb = ~Q;

wire oPlsOut = (iSigIn & Qb) | (~iSigIn & Q);

endmodule 


