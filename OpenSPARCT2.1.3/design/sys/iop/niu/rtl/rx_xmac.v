// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rx_xmac.v
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
 * File Name    : rx_xmac.v
 * Author Name  : John Lo
 * Description  : receive mac main block. In rx_clk domain
 * Parent Module: xmac
 * Child  Module: many.
 * Interface Mod: many.
 * Date Created : 5/9/00
 *
 * Copyright (c) 2008, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification : major redesign for 64 bit xpcs interface.
 * 
 *                In Feb. 10th, 2004, the rxfifo overflow bug shows up again.
 *                It is caused by adding one more layer of pipeline register
 *                to add the strip_crc function.
 *                For this reason, the rxfifo_afull signal has to be extended 1 more.
 *
 * Design Notes: In 10G mode, when "E" happened in PA time the 
 *               xmac behavior is different from 1G/100M/10M mode 
 *               which will set the abort_bit.
 * 
 *               Here is the difference:
 *               -----------------------
 *               When E happened in PA time, the S won't be 
 *               detected and the packet will be filterred out 
 *               on the spot.
 *               No abort_bit will be set since the packet did not even enter rx_xmac.
 * 
 * Common Notes: "_a" represents column 0~3.
 *               "_b" represents column 4~7.
 *
 * Synthesis Notes: 
 * 
 * Static Timing Analysis Notes: 
 *                 1. txd_image and txc_image are signals corssing 
 *                    different clock domain.  Do STA check carefully.
 * 
 *************************************************************************/

`include  "xmac.h"

module rx_xmac 
(/*AUTOARG*/
   // Outputs
   rxfifo_dout, rxfifo_g_wr_ptr_rxclk, rxfifo_full_rxclk_reg, 
   rxfifo_overrun_rxclk, srfifo_dout, srfifo_g_wr_ptr_rxclk, 
   rx_good_pkt, rx_fc_pkt_ok, pause_time, toggle_rx_bcount, 
   inc_bcast_count, inc_mcast_count, inc_code_viol_count, 
   inc_crc_err_count, inc_min_pkt_err_count, inc_max_pkt_err_count, 
   rx_data_valid_gmux_reg, rx_pa_data, link_fault, 
   inc_link_fault_count, remote_fault_oc_reg, local_fault_oc_reg, 
   lfs_state, xrlm_state, sop_state, S_detected_reg, 
   T_E_detected_at_modified_pkt_reg, 
   END_PKT_ERR_detected_a_at_modified_pkt_reg, 
   END_PKT_ERR_detected_b_at_modified_pkt_reg, S_D_reg, S_I_reg, 
   D_S_reg, I_S_reg, abort_bit_reg, rx_err_reg, crc_error_reg, 
   kill_data_ready_reg, kill_crc_reg, rx_sel_reg, 
   // Inputs
   rx_clk, rx_reset, warning_msg_en, xgmii_rxc, xgmii_rxd, xpcs_rxc, 
   xpcs_rxd, txc_image, txd_image, hold_rxd, hold_rx_dv, hold_rx_err, 
   xpcs_bypass, mii_or_gmii_mode, loopback, rx_enable_rxclk, 
   code_viol_chk_dis, crc_chk_dis, promisc_all, promisc_group, 
   err_chk_dis, rx_pause_en, pass_fc, reserve_multicast, 
   mac_unique_addr, no_rx_min_pkt_size_chk, rx_min_pkt_size, 
   max_pkt_size, lfs_disable_rxclk, rxfifo_g_rd_ptr_sync, 
   rxfifo_rd_ptr_clk, srfifo_rd_ptr_clk, strip_crc, addr_filter_en, 
   hash_filter_en, alt_addr_comp_en, mac_alt_addr0, mac_alt_addr1, 
   mac_alt_addr2, mac_alt_addr3, mac_alt_addr4, mac_alt_addr5, 
   mac_alt_addr6, mac_alt_addr7, mac_alt_addr8, mac_alt_addr9, 
   mac_alt_addr10, mac_alt_addr11, mac_alt_addr12, mac_alt_addr13, 
   mac_alt_addr14, mac_alt_addr15, addr_filter, addr_filter_mask_msb, 
   addr_filter_mask_lsb, hash_table, mac_host_info0, mac_host_info1, 
   mac_host_info2, mac_host_info3, mac_host_info4, mac_host_info5, 
   mac_host_info6, mac_host_info7, mac_host_info8, mac_host_info9, 
   mac_host_info10, mac_host_info11, mac_host_info12, 
   mac_host_info13, mac_host_info14, mac_host_info15, 
   mac_host_info16, mac_host_info17, mac_host_info18, 
   mac_host_info19
   );

/* ------------------------------------------------------------------- */
   input           rx_clk;
   input 	   rx_reset;
   input 	   warning_msg_en;
   // xgmii interface
   input [3:0] 	   xgmii_rxc;
   input [31:0]    xgmii_rxd;
   // xpcs interface
   input [7:0] 	   xpcs_rxc;
   input [63:0]    xpcs_rxd;
   // loopback path
   input [7:0] 	   txc_image;     // loopback path
   input [63:0]    txd_image;     // loopback path
   // gmii/mii path
   input [63:0]    hold_rxd;
   input [7:0]     hold_rx_dv;
   input 	   hold_rx_err;
   // static signals from sys_clk domain
   input 	   xpcs_bypass;
   input 	   mii_or_gmii_mode;
   input 	   loopback;
   input 	   rx_enable_rxclk;
   input 	   code_viol_chk_dis;
   input 	   crc_chk_dis;
   input 	   promisc_all;
   input 	   promisc_group;
   input           err_chk_dis;
   input           rx_pause_en;
   input           pass_fc;
   input           reserve_multicast;
   input [47:0]    mac_unique_addr;
   input 	   no_rx_min_pkt_size_chk;
   input [9:0] 	   rx_min_pkt_size;
   input [13:0]    max_pkt_size;
   input 	   lfs_disable_rxclk;
   // inter module signals
   input [4:0] 	   rxfifo_g_rd_ptr_sync; // ***** signal crossing different clock domain.  ***** 
   input [3:0] 	   rxfifo_rd_ptr_clk;    // ***** signal crossing different clock domain.  ***** 
   input [4:0] 	   srfifo_rd_ptr_clk;    // ***** signal crossing different clock domain.  ***** 
   // start of ALT_ADDR_AND_HASH_FUNC specific signals
   input 	   strip_crc;
   input 	   addr_filter_en;
   input 	   hash_filter_en;
   input [15:0]    alt_addr_comp_en;
   input [47:0]    mac_alt_addr0;
   input [47:0]    mac_alt_addr1;
   input [47:0]    mac_alt_addr2;
   input [47:0]    mac_alt_addr3;
   input [47:0]    mac_alt_addr4;
   input [47:0]    mac_alt_addr5;
   input [47:0]    mac_alt_addr6;
   input [47:0]    mac_alt_addr7;
   input [47:0]    mac_alt_addr8;
   input [47:0]    mac_alt_addr9;
   input [47:0]    mac_alt_addr10;
   input [47:0]    mac_alt_addr11;
   input [47:0]    mac_alt_addr12;
   input [47:0]    mac_alt_addr13;
   input [47:0]    mac_alt_addr14;
   input [47:0]    mac_alt_addr15;
   input [47:0]    addr_filter;
   input [7:0] 	   addr_filter_mask_msb;
   input [15:0]    addr_filter_mask_lsb;
   input [255:0]   hash_table;
   input [`H_INFO] mac_host_info0 ; 
   input [`H_INFO] mac_host_info1 ;
   input [`H_INFO] mac_host_info2 ;
   input [`H_INFO] mac_host_info3 ;
   input [`H_INFO] mac_host_info4 ;
   input [`H_INFO] mac_host_info5 ;
   input [`H_INFO] mac_host_info6 ;
   input [`H_INFO] mac_host_info7 ;
   input [`H_INFO] mac_host_info8 ;
   input [`H_INFO] mac_host_info9 ;
   input [`H_INFO] mac_host_info10;
   input [`H_INFO] mac_host_info11;
   input [`H_INFO] mac_host_info12;
   input [`H_INFO] mac_host_info13;
   input [`H_INFO] mac_host_info14;
   input [`H_INFO] mac_host_info15;
   input [`H_INFO] mac_host_info16;
   input [`H_INFO] mac_host_info17;
   input [`H_INFO] mac_host_info18;
   input [`H_INFO] mac_host_info19;
   // end of ALT_ADDR_AND_HASH_FUNC specific signals
// output signals   
   // rxfifo
   output [65:0]   rxfifo_dout; // {mac_ctrl_word,tag,64bit data}
   output [4:0]    rxfifo_g_wr_ptr_rxclk;  // ***** signal crossing different clock domain.  ***** 
   output 	   rxfifo_full_rxclk_reg;
   output 	   rxfifo_overrun_rxclk;
   // srfifo
   output [`TBITS] srfifo_dout; 
   output [4:0]    srfifo_g_wr_ptr_rxclk;  // ***** signal crossing different clock domain.  ***** 
   //
   output          rx_good_pkt;
   output 	   rx_fc_pkt_ok;     // ***** signal crossing different clock domain.  *****
   output [15:0]   pause_time;       // ***** signal crossing different clock domain.  *****
   output 	   toggle_rx_bcount; // ***** signal crossing different clock domain.  *****
   output 	   inc_bcast_count;  // ***** signal crossing different clock domain.  *****
   output 	   inc_mcast_count;  // ***** signal crossing different clock domain.  *****
   output 	   inc_code_viol_count;// ***** signal crossing different clock domain.  *****
   output          inc_crc_err_count;// ***** signal crossing different clock domain.  *****
   output          inc_min_pkt_err_count;// ***** signal crossing different clock domain.  *****
   output          inc_max_pkt_err_count;// ***** signal crossing different clock domain.  *****
   output 	   rx_data_valid_gmux_reg;
   output [63:0]   rx_pa_data;
   //
   output  	   link_fault;      // to both xmac_sync then to xmac_slv
   output 	   inc_link_fault_count; // to xmac_sync.v
   output 	   remote_fault_oc_reg;  // to xmac_slv. sw does RAC
   output 	   local_fault_oc_reg;   // to xmac_slv. sw does RAC
   output [1:0]    lfs_state;       // dynamic signal
   // state machine outputs
   output 	   xrlm_state;
   output          sop_state;
   // signal observation
   output 	   S_detected_reg;
   output 	   T_E_detected_at_modified_pkt_reg;
   output 	   END_PKT_ERR_detected_a_at_modified_pkt_reg;
   output 	   END_PKT_ERR_detected_b_at_modified_pkt_reg;
   output 	   S_D_reg;
   output 	   S_I_reg;
   output 	   D_S_reg;
   output 	   I_S_reg;
   output 	   abort_bit_reg;    
   output 	   rx_err_reg;       
   output 	   crc_error_reg;
   output 	   kill_data_ready_reg;
   output 	   kill_crc_reg;
   output [1:0]    rx_sel_reg;

/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			abort_bit;		// From rx_xdecap of rx_xdecap.v
wire			bad_pkt_bit;		// From rx_xdecap of rx_xdecap.v
wire			hash_hit_match;		// From address_decoder of address_decoder.v
wire			local_fault_oc;		// From lfs of lfs.v
wire			max_pkt_size_limit;	// From rx_xdecap of rx_xdecap.v
wire			remote_fault_oc;	// From lfs of lfs.v
wire			rst_data_ready;		// From sop_sm of sop_sm.v
wire			rx_fc_pkt;		// From address_decoder of address_decoder.v
wire			rx_ok;			// From xrlm_sm of xrlm_sm.v
wire			set_data_ready;		// From sop_sm of sop_sm.v
wire			valid_data;		// From xrlm_sm of xrlm_sm.v
// End of automatics

/* --- wire definition --- */
   wire 	   rx_data_valid_gmux;
   wire 	   rx_data_valid_gmux_p1;
   wire            rx_data_valid;
   wire            mod_rx_dv;
   wire            rx_dv;
   wire [7:0]      rx_dv_8bit;
   wire [7:0]      rx_dv_8bit_reg0;
   wire [7:0]      rx_dv_8bit_reg0_gmux;
   wire [7:0]      rx_dv_8bit_reg0_gmux_p1;
   wire [7:0]      rx_dv_8bit_reg1;
   wire [63:0]     rx_data_64bit;
   wire [63:0]     rx_data_64bit_reg0;
   wire [63:0]     rx_data_64bit_reg0_gmux;
   wire [63:0]     rx_data_64bit_reg0_gmux_p1;
   wire [63:0]     rx_data_64bit_reg1;
   wire [63:0]     rx_data_64bit_reg2;
   wire [47:0] 	   mac_unique_addr;
   wire [9:0] 	   rx_min_pkt_size;
   wire [13:0] 	   max_pkt_size;
   wire 	   xrlm_state;
   wire        	   sop_state;
   wire [15:0]     pause_time;
   //
   wire [65:0]     rxfifo_din; 
   wire [65:0]     rxfifo_dout;
   wire [4:0]      srfifo_g_wr_ptr_rxclk;
   wire [`TBITS]   rx_status;
   reg  [`TBITS]   rx_stat;
   wire [`TBITS]   srfifo_din; 
   wire [`TBITS]   srfifo_dout; 
   wire 	   eop,rx_eop,mod_eop,eop_wen;
   wire 	   rxfifo_full_rxclk;
   wire 	   rxfifo_afull_rxclk; // rxfifo almost full
   wire 	   rx_err;             // = rx_err_det | rx_err_hold;
   wire 	   rx_err_det;
   wire 	   rx_err_det_pls;
   wire 	   rx_err_gmux;        // = gmii ? g2x_rx_err : xgmii_rx_err;
   wire 	   rx_err_gmux_p1;     // = gmii ? g2x_rx_err : xgmii_rx_err;
   wire 	   xgmii_rx_err;       // xgmii mode rx_err
   wire [63:0]	   g2x_rxd_64bit;
   wire [7:0]      g2x_rx_dv_8bit;  
   wire 	   g2x_rx_err;  
   wire 	   T_showup_a;
   wire 	   T_showup_b;
   wire 	   code_viol_a;
   wire 	   code_viol_b;
   wire [`MAC_CTRL]mac_ctrl_word;         // mac_ctrl_word goes with mac_ctrl_word_wr_en
   wire 	   mac_ctrl_word_wr_en;   // mac_ctrl_word goes with mac_ctrl_word_wr_en
   wire 	   mac_ctrl_word_wen;     // one clock delay of mac_ctrl_word_wr_en. It goes with rx_stat
   // data path
   wire [7:0] 	   xgmii_rxc_8b;
   wire [63:0] 	   xgmii_rxd_64b;
   wire [7:0] 	   xpcs_rxc;
   wire [7:0] 	   xpcs_rxc_reg;
   wire [63:0] 	   xpcs_rxd;
   wire [63:0] 	   xpcs_rxd_reg;
   wire [7:0] 	   txc_image;
   wire [7:0] 	   txc_image_rx_clk;
   wire [63:0] 	   txd_image;
   wire [63:0] 	   txd_image_rx_clk;
    // positive control
   wire [7:0] 	   xrc;
   wire [3:0] 	   xrc_a_p1;
   wire [3:0] 	   xrc_b_p1;
   wire [3:0] 	   xrc_a;
   wire [3:0] 	   xrc_b;
   // positive data
   wire [63:0]     xrd;
   wire [31:0] 	   xrd_a_p1;
   wire [31:0]     xrd_b_p1;
   wire [31:0] 	   xrd_a;
   wire [31:0]     xrd_b;
   //
   wire [1:0] 	   set_sel;
   wire [1:0] 	   rst_sel;
   wire [1:0] 	   rx_sel;
   //
   wire [3:0] 	   rxc_a,rxc_b;
   wire [31:0] 	   rxd_a,rxd_b;
   wire [31:0] 	   rxd_aa,rxd_bb; // valid only at S_detected. It is used for latching rx_pa_data.
   //
   wire 	   S_detected;
   wire 	   S_detected_at_modified_pkt;
   wire 	   T_detected_at_modified_pkt;
   wire 	   MID_PKT_ERR_detected_at_modified_pkt;
   wire 	   T_E_detected_at_modified_pkt;
   wire 	   S_D;
   wire 	   S_I;
   wire 	   D_S;
   wire 	   I_S;
   wire 	   kill_data_ready;
   wire 	   data_ok;
   wire 	   min_pkt_size_limit;
   wire [63:0] 	   rx_pa_data;
   wire 	   srfifo_wr_en;
   wire 	   kill_crc;
   wire 	   data_ready;
   wire 	   rx_data_valid_gmux_lead;
   wire 	   rxfifo_wen;
   wire 	   rx_err_hold;
   wire 	   crc_error; 
   // vlint flag_net_has_no_load            off
   // vlint flag_dangling_net_within_module off
   wire [31:0] 	   rx_crc_result;
   wire [13:0] 	   rx_byte_count;     // for observation.
   wire [13:0] 	   mod_rx_byte_count; // for observation.
   wire 	   da_match;
   wire 	   da_match_err;
   wire            mac_own_da_match;
   wire [4:0] 	   rxfifo_wr_ptr_rxclk;
   wire [15:0] 	   hash_value;
   wire [6:0] 	   alt_addr_filter_value;
   wire [31:0] 	   new_crc5_result;
   wire 	   I_detected;
   wire 	   E_detected;
   wire 	   T_detected;
   wire 	   rx_data_valid_trail;
   wire 	   err_cond;
   wire 	   set_err_time;
   wire 	   rxfifo_empty_rxclk;
   // vlint flag_dangling_net_within_module on
   // vlint flag_net_has_no_load            on

   RegDff #(1)  rxfifo_full_rxclk_reg_RegDff  (.din(rxfifo_full_rxclk),.clk(rx_clk),.qout(rxfifo_full_rxclk_reg)); 
   RegDff #(1)  remote_fault_oc_reg_RegDff    (.din(remote_fault_oc),  .clk(rx_clk),.qout(remote_fault_oc_reg)); 
   RegDff #(1)  local_fault_oc_reg_RegDff     (.din(local_fault_oc),   .clk(rx_clk),.qout(local_fault_oc_reg)); 

   
/* ------------------ data path ------------------------------- */
   // 1st stage interface mux: mux in loopback and xgmii data path.
   //
   // Reason to place mux before register:
   // For xgmii interface mode:The entire xgmii_intf can be placed
   //                          right next to IO pad. 
   //                          From xgmii_intf register out to 
   //                          this 1st stage mux can have whole
   //                          6.4ns for layout trace.
   //                          It can also provid some hold time to
   //                          compensate rx_clk insertion delay.
   //                          Good for both rtl and gate sim.
   //
   // For xpcs interface mode: The xpcs_rxc and xpcs_rxd are
   //                          registered output. The mux provides
   //                          some hold time to compensate rx_clk
   //                          insertion delay.
   //                          Good for both rtl and gate sim.
      
   // 1st stage interface register: register in
   RegDff #(8)  xpcs_rxc_reg_RegDff     (.din(xpcs_rxc),.clk(rx_clk),.qout(xpcs_rxc_reg)); 
   RegDff #(64) xpcs_rxd_reg_RegDff     (.din(xpcs_rxd),.clk(rx_clk),.qout(xpcs_rxd_reg));
   RegDff #(8)  txc_image_rx_clk_RegDff(.din(txc_image),.clk(rx_clk),.qout(txc_image_rx_clk));
   RegDff #(64) txd_image_rx_clk_RegDff(.din(txd_image),.clk(rx_clk),.qout(txd_image_rx_clk));

   xMUX_3to1 #(8)  xrc_MUX_3to1(
                          .din0(xpcs_rxc_reg),
                          .din1(xgmii_rxc_8b),
                          .din2(txc_image_rx_clk),
                          .sel({loopback,xpcs_bypass}),
                          .dout(xrc));
   
   xMUX_3to1 #(64) xrd_MUX_3to1(
                          .din0(xpcs_rxd_reg),
                          .din1(xgmii_rxd_64b),
                          .din2(txd_image_rx_clk),
                          .sel({loopback,xpcs_bypass}),
                          .dout(xrd));

   assign 	   xrc_a_p1 = xrc[3:0];
   assign 	   xrc_b_p1 = xrc[7:4];
   assign 	   xrd_a_p1 = xrd[31:0];
   assign 	   xrd_b_p1 = xrd[63:32];

   // 2nd stage interface register: 
   RegDff #(4)  xrc_a_RegDff(.din(xrc_a_p1),.clk(rx_clk),.qout(xrc_a)); 
   RegDff #(4)  xrc_b_RegDff(.din(xrc_b_p1),.clk(rx_clk),.qout(xrc_b)); 
   RegDff #(32) xrd_a_RegDff(.din(xrd_a_p1),.clk(rx_clk),.qout(xrd_a)); 
   RegDff #(32) xrd_b_RegDff(.din(xrd_b_p1),.clk(rx_clk),.qout(xrd_b));

   // 2nd stage interface mux:
   // for control rxc
   xMUX_2to1 #(4)  rxc_a_MUX_2to1(.din0(xrc_a),
                                  .din1(xrc_b),
                                  .sel(rx_sel[1]),
                                  .dout(rxc_a));

   xMUX_4to1 #(4)  rxc_b_MUX_4to1(.din0(xrc_b),
                                  .din1(xrc_b_p1),
                                  .din2(xrc_a),
                                  .din3(xrc_a_p1),
                                  .sel(rx_sel[1:0]),
                                  .dout(rxc_b));
   // for data rxd
   xMUX_2to1 #(32) rxd_a_MUX_2to1(.din0(xrd_a),
                                  .din1(xrd_b),
                                  .sel(rx_sel[1]),
                                  .dout(rxd_a));

   xMUX_4to1 #(32) rxd_b_MUX_4to1(.din0(xrd_b),
                                  .din1(xrd_b_p1),
                                  .din2(xrd_a),
                                  .din3(xrd_a_p1),
                                  .sel(rx_sel[1:0]),
                                  .dout(rxd_b));
   // for rx_pa_data
   xMUX_2to1 #(32) rxd_aa_MUX_2to1(.din0(xrd_a),
                                  .din1(xrd_b),
                                  .sel(set_sel[1]),
                                  .dout(rxd_aa));

   xMUX_4to1 #(32) rxd_bb_MUX_4to1(.din0(xrd_b),
                                  .din1(xrd_b_p1),
                                  .din2(xrd_a),
                                  .din3(xrd_a_p1),
                                  .sel(set_sel[1:0]),
                                  .dout(rxd_bb));

   // If set and reset happened at the same time, 
   // set gets higher priority.
   // The reset part is taken care of by kill_data_ready to 
   // lower data_ok.
   SR_FF data_ready_SR_FF(.set(set_data_ready),
                          .rst(rst_data_ready),
                          .clk(rx_clk),
                          .reset(rx_reset),
                          .qout(data_ready));
   // rx_sel[1] is equivalent to rx_swap. 
   RS_FF sel1_RS_FF (.set(set_sel[1]),
                     .rst(rst_sel[1]),
                     .clk(rx_clk),
                     .reset(rx_reset),
                     .qout(rx_sel[1]));

   RS_FF sel0_RS_FF (.set(set_sel[0]),
                     .rst(rst_sel[0]),
                     .clk(rx_clk),
                     .reset(rx_reset),
                     .qout(rx_sel[0]));

   // T_E_detected_at_modified_pkt is used to chop the pkt so that forcing bad CRC to happen and abort bit set. 
   assign  kill_data_ready = (T_detected_at_modified_pkt & S_detected_at_modified_pkt) | T_E_detected_at_modified_pkt;

   assign  data_ok = data_ready & ~(rxfifo_full_rxclk | rxfifo_afull_rxclk) & ~kill_data_ready;

   assign  rx_dv_8bit[`BYTE]={(data_ok & ~rxc_b[3]),
		              (data_ok & ~rxc_b[2]),
		              (data_ok & ~rxc_b[1]),
		              (data_ok & ~rxc_b[0]),
	 	              (data_ok & ~rxc_a[3]),
			      (data_ok & ~rxc_a[2]),
			      (data_ok & ~rxc_a[1]),
		              (data_ok & ~rxc_a[0])
		             };
   
   assign  rx_data_64bit = {rxd_b[31:0],rxd_a[31:0]};

/* ------------------ 0th statge registers -------------------- */
   
//   RegDff #(8)  rx_dv_8bit_reg0_RegDff    (.din(rx_dv_8bit),   .clk(rx_clk),.qout(rx_dv_8bit_reg0)); 
//   RegDff #(64) rx_data_64bit_reg0_RegDff (.din(rx_data_64bit),.clk(rx_clk),.qout(rx_data_64bit_reg0)); 
//   RegDff #(1)  rx_data_valid_RegDff      (.din(|rx_dv_8bit),  .clk(rx_clk),.qout(rx_data_valid));

   assign  rx_dv_8bit_reg0    = rx_dv_8bit;
   assign  rx_data_64bit_reg0 = rx_data_64bit;
   assign  rx_data_valid      = |rx_dv_8bit;
   
/* ------------------ 0th stage muxes ------------------------- */
   /*******************************************************
    * This is where gmii and xgmii data path come together.
    * "gmux" is used as surfix to designated that this 
    *  is the merger of gmii and xgmii data path mux.
    *******************************************************/
   wire 	  reset_g2x_regs = rx_reset | rxfifo_full_rxclk;
   
RegRst #(64) g2x_rxd_64bit_RegRst  (.clk(rx_clk),
                                    .reset(reset_g2x_regs),
                                    .din(hold_rxd[63:0]),
                                    .qout(g2x_rxd_64bit[63:0]));
   
RegRst #(8)  g2x_rx_dv_8bit_RegRst (.clk(rx_clk),
                                    .reset(reset_g2x_regs),
                                    .din(hold_rx_dv[7:0]),
                                    .qout(g2x_rx_dv_8bit[7:0]));

RegRst #(1)  g2x_rx_err_8bit_RegRst(.clk(rx_clk),
                                    .reset(reset_g2x_regs),
                                    .din(hold_rx_err),
                                    .qout(g2x_rx_err));

   xMUX_2to1 #(64) rx_data_64bit_reg0_gmux_xMUX_2to1(.din0(rx_data_64bit_reg0),.din1(g2x_rxd_64bit),  .sel(mii_or_gmii_mode),.dout(rx_data_64bit_reg0_gmux_p1));
   xMUX_2to1 #(8)  rx_dv_8bit_reg0_gmux_xMUX_2to1   (.din0(rx_dv_8bit_reg0),   .din1(g2x_rx_dv_8bit), .sel(mii_or_gmii_mode),.dout(rx_dv_8bit_reg0_gmux_p1));
   xMUX_2to1 #(1)  rx_data_valid_gmux_xMUX_2to1     (.din0(rx_data_valid),     .din1(|g2x_rx_dv_8bit),.sel(mii_or_gmii_mode),.dout(rx_data_valid_gmux_p1));

/* ----- add this stage to improve crc timing ----------------- */
   RegDff #(64)  rx_data_64bit_reg0_gmux_RegDff (.din(rx_data_64bit_reg0_gmux_p1),   .clk(rx_clk),.qout(rx_data_64bit_reg0_gmux)); 
   RegDff #(8)   rx_dv_8bit_reg0_gmux_p1_RegDff (.din(rx_dv_8bit_reg0_gmux_p1),   .clk(rx_clk),.qout(rx_dv_8bit_reg0_gmux)); 
   RegDff #(1)   rx_data_valid_gmux_RegDff      (.din(rx_data_valid_gmux_p1),   .clk(rx_clk),.qout(rx_data_valid_gmux)); 

   PlsGen2 rx_data_valid_PlsGen2 (.sig_in(rx_data_valid_gmux),.clk(rx_clk),
                                  .lead (rx_data_valid_gmux_lead),
                                  .trail(rx_data_valid_trail));// not used

   FD1 rx_data_valid_gmux_reg_FD1  (.D(rx_data_valid_gmux),.CP(rx_clk),.Q(rx_data_valid_gmux_reg));
  
/* ----------------- 1st statge registers --------------------- */
  // xrlm_sm convert rx_data_valid_gmux to valid_data in real time.
   FD1 rx_dv_FD1  (.D(valid_data),.CP(rx_clk),.Q(rx_dv));
   RegDff #(64) rx_data_64bit_reg1_RegDff (.din(rx_data_64bit_reg0_gmux),.clk(rx_clk),.qout(rx_data_64bit_reg1));
   RegDff #(8)  rx_dv_8bit_reg1_RegDff    (.din(rx_dv_8bit_reg0_gmux),   .clk(rx_clk),.qout(rx_dv_8bit_reg1)); 
   
/* ----------------- 2nd statge registers --------------------- */
   RegDff #(64) rx_data_64bit_reg2_RegDff (.din(rx_data_64bit_reg1),.clk(rx_clk),.qout(rx_data_64bit_reg2));

   always @ (posedge rx_clk) // rx_status has the same timing as eop.  // loj
     rx_stat <= rx_status;

   // rxfifo related logic
/* ------------------ rxfifo_din mux logic -------------------- */
   // mac_ctrl_word_wen,eop_wen should behave the same way. 
   assign mod_rx_dv    = rx_dv & (~kill_crc);
   FD1    rxfifo_wen_FD1(.D(mod_rx_dv),.CP(rx_clk),.Q(rxfifo_wen));
   assign rxfifo_din   = {mac_ctrl_word_wen,eop_wen,rx_data_64bit_reg2};
   //                        ^               ^
   //                        |               |
   //                   rxmac_ipp_ctrl      rxmac_ipp_tag
   // srfifo related logic
   FD1  mac_ctrl_word_wen_FD1(.D(mac_ctrl_word_wr_en),.CP(rx_clk),.Q(mac_ctrl_word_wen));

   // eop is a lookahead signal. 
   // eop is used in reg1 time.
   // rx_eop is used in reg2 time. 
   assign mod_eop      = eop & (~kill_crc);
   FD1 rx_eop_FD1  (.D(mod_eop),.CP(rx_clk),.Q(rx_eop)); 
   assign srfifo_wr_en = eop_wen | mac_ctrl_word_wen;
   // eop goes with rx_status.
   // rx_eop goes with rx_stat.
   // kill_crc only happens in eop time.
   //                  implicit eop time;   eop delay by one clk;
   //                                |          |
   //                                v          v
   assign eop_wen      = kill_crc ? 1'b1     : rx_eop;
   //                                ^          ^
   //                                |          |
   //                                v          v
   assign srfifo_din   = kill_crc ? rx_status: rx_stat;

/* ---------- start of strip_crc modification logic ----------- */
// The  ~min_pkt_size_limit is to take care of the runt pkt that is less or equal 8 bytes.

//The following two equations performs the same results.
//
//always @ (eop or strip_crc or min_pkt_size_limit or rx_dv_8bit_reg1)
//      if (eop & strip_crc & (~min_pkt_size_limit)) 
//      case(rx_dv_8bit_reg1)  // synopsys parallel_case full_case
//	/* -- below this line  kill_crc == 1 -> kill crc at current and previous lanes -- */
//        8'b00000001:   kill_crc            = 1; 
//        8'b00000011:   kill_crc            = 1; 
//        8'b00000111:   kill_crc            = 1; 
//        8'b00001111:   kill_crc            = 1; 
//        /* -- below this line  kill_crc == 0 -> kill crc at current lanes -- */
//        8'b00011111:   kill_crc            = 0; 
//        8'b00111111:   kill_crc            = 0; 
//        8'b01111111:   kill_crc            = 0; 
//        8'b11111111:   kill_crc            = 0; 
//        default    :   kill_crc            = 0; 
//      endcase // case(rx_dv_8bit_reg1)
//      else             kill_crc            = 0; 
   
assign kill_crc = ((rx_dv_8bit_reg1 == 8'b00000001) |
                   (rx_dv_8bit_reg1 == 8'b00000011) |
                   (rx_dv_8bit_reg1 == 8'b00000111) |
                   (rx_dv_8bit_reg1 == 8'b00001111)) &
                   (eop & strip_crc & (~min_pkt_size_limit));
   
      
/************************ control logic ************************/

   parameter THREE_0  = 3'b000 ,
             FOUR_0   = 4'b0000,
          // THREE_1  = 3'b111 , // not used
	     FOUR_1   = 4'b1111;
   
/* ---------- detect S (sop) logic ---------------------------- */
   // S = 8'hFB, T = 8'hFD, E = 8'hFE, I = 8'h07
   // in 802.3z pp-36A.2 shows PA => FB 55 55 55 55 55 55 D5
   //
   // detect SOP logic
   // D: pre amble
   // I: can be T or I or mixture of T&I&D or I&D;
   // S: sop
   //
   //  LSB   MSB
   //    \   /
   //     a b <--------- Big Endian format
   //     | |
   //     v v
   assign S_D = ((xrc_a[0] & (xrd_a[`BYTE0] == `S)) & (xrc_a[3:1] == THREE_0)) & (xrc_b == FOUR_0)  ; //normal

   //abnormal
   assign S_I = ((xrc_a[0] & (xrd_a[`BYTE0] == `S)) & (xrc_a[3:1] == THREE_0)) & (xrc_b == FOUR_1)  & (xrc_b_p1 == FOUR_0);

   //abnormal
   assign D_S =  (xrc_a == FOUR_0) & ((xrc_b[0] & (xrd_b[`BYTE0] == `S)) & (xrc_b[3:1] == THREE_0)) ; 

   //normal
   assign I_S =  (xrc_a == FOUR_1) & ((xrc_b[0] & (xrd_b[`BYTE0] == `S)) & (xrc_b[3:1] == THREE_0)) & (xrc_a_p1 == FOUR_0);

         
   assign S_detected = S_D | S_I | D_S | I_S;
   
   assign S_detected_at_modified_pkt = (rxc_a[0] & (rxd_a[`BYTE0] == `S)) | (rxc_b[0] & (rxd_b[`BYTE0] == `S)); // lane0

   // ------------------------------------------------
   // truth talbe
   // --------------------------  --------------------
   //  xrc_a   xrc_b   encode     comments
   // ------- ------- ----------  --------------------
   //    S       D      2'b00     no action
   //
   //    S       I      2'b01     pull b   (abnormal)
   //
   //    D       S      2'b10     swap a&b (abnormal)
   //
   //    I       S      2'b11     swap a&b + pull a
   // ------------------------------------------------
   //
   // comments: 
   // 1. whenever the I is detected,
   //    the rxc_a_p1/rxc_b_p1 is used.
   // 2. sel[1]: is the swap enable bit
   //    sel[0]: is the delay bit.

/* ---------- detect T logic ---------------------------------- */
   assign  T_detected = // not used
           xrc_a[0] & (xrd_a[`BYTE0] == `T) |  // lane0
           xrc_a[1] & (xrd_a[`BYTE1] == `T) |  // lane1
           xrc_a[2] & (xrd_a[`BYTE2] == `T) |  // lane2
           xrc_a[3] & (xrd_a[`BYTE3] == `T) |  // lane3
           xrc_b[0] & (xrd_b[`BYTE0] == `T) |  // lane4
           xrc_b[1] & (xrd_b[`BYTE1] == `T) |  // lane5
           xrc_b[2] & (xrd_b[`BYTE2] == `T) |  // lane6
           xrc_b[3] & (xrd_b[`BYTE3] == `T) ;  // lane7
		
   wire    T_detected_a_at_modified_pkt = 
           rxc_a[0] & (rxd_a[`BYTE0] == `T) |  // lane0
           rxc_a[1] & (rxd_a[`BYTE1] == `T) |  // lane1
           rxc_a[2] & (rxd_a[`BYTE2] == `T) |  // lane2
           rxc_a[3] & (rxd_a[`BYTE3] == `T) ;  // lane3


	   
   wire    T_detected_b_at_modified_pkt = 
           rxc_b[0] & (rxd_b[`BYTE0] == `T) |  // lane4
           rxc_b[1] & (rxd_b[`BYTE1] == `T) |  // lane5
           rxc_b[2] & (rxd_b[`BYTE2] == `T) |  // lane6
           rxc_b[3] & (rxd_b[`BYTE3] == `T) ;  // lane7
		
   assign  T_detected_at_modified_pkt = 
           T_detected_a_at_modified_pkt	| T_detected_b_at_modified_pkt;
   
/* ---------- detect I CHAR ----------------------------------- */
   assign  I_detected = // not used
           xrc_a[0] & (xrd_a[`BYTE0] == `I) |  // lane0
           xrc_a[1] & (xrd_a[`BYTE1] == `I) |  // lane1
           xrc_a[2] & (xrd_a[`BYTE2] == `I) |  // lane2
           xrc_a[3] & (xrd_a[`BYTE3] == `I) |  // lane3
           xrc_b[0] & (xrd_b[`BYTE0] == `I) |  // lane4
           xrc_b[1] & (xrd_b[`BYTE1] == `I) |  // lane5
           xrc_b[2] & (xrd_b[`BYTE2] == `I) |  // lane6
           xrc_b[3] & (xrd_b[`BYTE3] == `I) ;  // lane7

/* ---------- detect E CHAR ----------------------------------- */
   assign  E_detected = // not used
           xrc_a[0] & (xrd_a[`BYTE0] == `E) |  // lane0
           xrc_a[1] & (xrd_a[`BYTE1] == `E) |  // lane1
           xrc_a[2] & (xrd_a[`BYTE2] == `E) |  // lane2
           xrc_a[3] & (xrd_a[`BYTE3] == `E) |  // lane3
           xrc_b[0] & (xrd_b[`BYTE0] == `E) |  // lane4
           xrc_b[1] & (xrd_b[`BYTE1] == `E) |  // lane5
           xrc_b[2] & (xrd_b[`BYTE2] == `E) |  // lane6
           xrc_b[3] & (xrd_b[`BYTE3] == `E) ;  // lane7

/* ---------- detect ERR in the middle of pkt ----------------- */
   assign  MID_PKT_ERR_detected_at_modified_pkt = (|rxc_a) | (|rxc_b);

/* ---------- detect ERR at the end of pkt -------------------- */
   wire    END_PKT_ERR_detected_a_at_modified_pkt = 
           rxc_a[0] & (rxd_a[`BYTE0] == `E) |  // lane0
           rxc_a[1] & (rxd_a[`BYTE1] == `E) |  // lane1
           rxc_a[2] & (rxd_a[`BYTE2] == `E) |  // lane2
           rxc_a[3] & (rxd_a[`BYTE3] == `E) ;  // lane3

   wire    END_PKT_ERR_detected_b_at_modified_pkt = 
           rxc_b[0] & (rxd_b[`BYTE0] == `E) |  // lane4
           rxc_b[1] & (rxd_b[`BYTE1] == `E) |  // lane5
           rxc_b[2] & (rxd_b[`BYTE2] == `E) |  // lane6
           rxc_b[3] & (rxd_b[`BYTE3] == `E) ;  // lane7

   assign  T_E_detected_at_modified_pkt = (T_detected_a_at_modified_pkt & END_PKT_ERR_detected_a_at_modified_pkt) | 
                                          (T_detected_b_at_modified_pkt & END_PKT_ERR_detected_b_at_modified_pkt) ;
   
/* ---------- rx pre-amble data (8 bytes) --------------------- */	     
xREG #(64) rx_pa_data_xREG(.din({rxd_bb,rxd_aa}),
                         .clk(rx_clk),
                         .en(S_detected),
                         .reset(rx_reset),
                         .qout(rx_pa_data));

/* ---------- detect E logic @ reg0 time ---------------------- */
   // please refer to July 2000, La Jolla meeting. 
   // XAUI/XGXS Proposal : slide 20
   assign  T_showup_a =  
    (~rx_dv_8bit_reg0[0] & (rx_data_64bit_reg0[`BYTE0] == `T) | 
     ~rx_dv_8bit_reg0[1] & (rx_data_64bit_reg0[`BYTE1] == `T) | 
     ~rx_dv_8bit_reg0[2] & (rx_data_64bit_reg0[`BYTE2] == `T) | 
     ~rx_dv_8bit_reg0[3] & (rx_data_64bit_reg0[`BYTE3] == `T) );
   
   assign  T_showup_b =  
    (~rx_dv_8bit_reg0[4] & (rx_data_64bit_reg0[`BYTE4] == `T) | 
     ~rx_dv_8bit_reg0[5] & (rx_data_64bit_reg0[`BYTE5] == `T) | 
     ~rx_dv_8bit_reg0[6] & (rx_data_64bit_reg0[`BYTE6] == `T) | 
     ~rx_dv_8bit_reg0[7] & (rx_data_64bit_reg0[`BYTE7] == `T) );

   assign  code_viol_a =  
    (~rx_dv_8bit_reg0[0] & (rx_data_64bit_reg0[`BYTE0] == `E) | 
     ~rx_dv_8bit_reg0[1] & (rx_data_64bit_reg0[`BYTE1] == `E) | 
     ~rx_dv_8bit_reg0[2] & (rx_data_64bit_reg0[`BYTE2] == `E) | 
     ~rx_dv_8bit_reg0[3] & (rx_data_64bit_reg0[`BYTE3] == `E)); 

   assign  code_viol_b =  
    (~rx_dv_8bit_reg0[4] & (rx_data_64bit_reg0[`BYTE4] == `E) | 
     ~rx_dv_8bit_reg0[5] & (rx_data_64bit_reg0[`BYTE5] == `E) | 
     ~rx_dv_8bit_reg0[6] & (rx_data_64bit_reg0[`BYTE6] == `E) | 
     ~rx_dv_8bit_reg0[7] & (rx_data_64bit_reg0[`BYTE7] == `E));

   assign  xgmii_rx_err = ( 
             ( ~(T_showup_a | T_showup_b) & (code_viol_a  | code_viol_b) ) |
             (T_showup_a  &  code_viol_a) |
             (T_showup_b  & (code_viol_a  | code_viol_b) )  
             );

	 
   assign  rx_err_gmux_p1 = (mii_or_gmii_mode) ? g2x_rx_err : xgmii_rx_err;
   RegDff   #(1)  rx_err_gmux_RegDff (.din(rx_err_gmux_p1),.clk(rx_clk),.qout(rx_err_gmux));
   
   assign  rx_err_det = ~code_viol_chk_dis & rx_data_valid_gmux & rx_err_gmux;

   PlsGen rx_err_det_pls_PlsGen(.reset(rx_reset),.clk(rx_clk),.iSigIn(rx_err_det),.oPlsOut(rx_err_det_pls));

   RS_FF rx_err_hold_RS_FF(.set(rx_err_det_pls),.rst(eop),.clk(rx_clk),
                   .reset(rx_reset),.qout(rx_err_hold));

   assign  rx_err = rx_err_det | rx_err_hold;
   
/* ------------------ xgmii interface instantiation ----------- */
rx_xgmii_intf rx_xgmii_intf
(/*AUTOINST*/
 // Outputs
 .xgmii_rxc_8b				(xgmii_rxc_8b[7:0]),
 .xgmii_rxd_64b				(xgmii_rxd_64b[63:0]),
 // Inputs
 .rx_clk				(rx_clk),
 .xgmii_rxc				(xgmii_rxc[3:0]),
 .xgmii_rxd				(xgmii_rxd[31:0]));

/* ------------------ address_decoder instantiation ----------- */
address_decoder address_decoder
(/*AUTOINST*/
 // Outputs
 .alt_addr_filter_value			(alt_addr_filter_value[6:0]),
 .hash_hit_match			(hash_hit_match),
 .hash_value				(hash_value[15:0]),
 .mac_ctrl_word				(mac_ctrl_word[`MAC_CTRL]),
 .mac_ctrl_word_wr_en			(mac_ctrl_word_wr_en),
 .rx_fc_pkt				(rx_fc_pkt),
 .rx_fc_pkt_ok				(rx_fc_pkt_ok),
 .pause_time				(pause_time[15:0]),
 .da_match				(da_match),
 .da_match_err				(da_match_err),
 .mac_own_da_match			(mac_own_da_match),
 .inc_bcast_count			(inc_bcast_count),
 .inc_mcast_count			(inc_mcast_count),
 // Inputs
 .rx_clk				(rx_clk),
 .rx_reset				(rx_reset),
 .eop					(eop),
 .bad_pkt_bit				(bad_pkt_bit),
 .promisc_all				(promisc_all),
 .promisc_group				(promisc_group),
 .reserve_multicast			(reserve_multicast),
 .rx_pause_en				(rx_pause_en),
 .rx_data_64bit_reg0_gmux		(rx_data_64bit_reg0_gmux[63:0]),
 .rx_data_valid_gmux_lead		(rx_data_valid_gmux_lead),
 .mac_unique_addr			(mac_unique_addr[47:0]),
 .new_crc5_result			(new_crc5_result[15:0]),
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
 .rx_ok					(rx_ok));


/* ------------------- rx_xdecap instantiation ---------------- */
rx_xdecap  rx_xdecap
(/*AUTOINST*/
 // Outputs
 .min_pkt_size_limit			(min_pkt_size_limit),
 .max_pkt_size_limit			(max_pkt_size_limit),
 .rx_good_pkt				(rx_good_pkt),
 .inc_code_viol_count			(inc_code_viol_count),
 .inc_crc_err_count			(inc_crc_err_count),
 .inc_min_pkt_err_count			(inc_min_pkt_err_count),
 .inc_max_pkt_err_count			(inc_max_pkt_err_count),
 .toggle_rx_bcount			(toggle_rx_bcount),
 .abort_bit				(abort_bit),
 .bad_pkt_bit				(bad_pkt_bit),
 .rx_byte_count				(rx_byte_count[13:0]),
 .mod_rx_byte_count			(mod_rx_byte_count[13:0]),
 .rx_status				(rx_status[`TBITS]),
 // Inputs
 .rx_clk				(rx_clk),
 .rx_reset				(rx_reset),
 .warning_msg_en			(warning_msg_en),
 .strip_crc				(strip_crc),
 .err_chk_dis				(err_chk_dis),
 .pass_fc				(pass_fc),
 .crc_error				(crc_error),
 .rxfifo_full_rxclk			(rxfifo_full_rxclk),
 .rxfifo_afull_rxclk			(rxfifo_afull_rxclk),
 .rx_fc_pkt				(rx_fc_pkt),
 .no_rx_min_pkt_size_chk		(no_rx_min_pkt_size_chk),
 .rx_min_pkt_size			(rx_min_pkt_size[9:0]),
 .max_pkt_size				(max_pkt_size[13:0]),
 .valid_data				(valid_data),
 .rx_dv					(rx_dv),
 .rx_err				(rx_err),
 .rx_dv_8bit_reg0_gmux			(rx_dv_8bit_reg0_gmux[7:0]),
 .eop					(eop),
 .hash_hit_match			(hash_hit_match),
 .hash_value				(hash_value[5:0]),
 .mac_ctrl_word				(mac_ctrl_word[`MAC_CTRL]),
 .mac_ctrl_word_wr_en			(mac_ctrl_word_wr_en));
                   
/* ------------------- rxfifo_load instantiation -------------- */
rxfifo_load rxfifo_load
(/*AUTOINST*/
 // Outputs
 .rxfifo_dout				(rxfifo_dout[65:0]),
 .rxfifo_g_wr_ptr_rxclk			(rxfifo_g_wr_ptr_rxclk[4:0]),
 .rxfifo_full_rxclk			(rxfifo_full_rxclk),
 .rxfifo_afull_rxclk			(rxfifo_afull_rxclk),
 .rxfifo_wr_ptr_rxclk			(rxfifo_wr_ptr_rxclk[4:0]),
 .rxfifo_empty_rxclk			(rxfifo_empty_rxclk),
 .rxfifo_overrun_rxclk			(rxfifo_overrun_rxclk),
 // Inputs
 .rx_clk				(rx_clk),
 .rx_reset				(rx_reset),
 .rxfifo_wen				(rxfifo_wen),
 .rxfifo_g_rd_ptr_sync			(rxfifo_g_rd_ptr_sync[4:0]),
 .rxfifo_rd_ptr_clk			(rxfifo_rd_ptr_clk[3:0]),
 .rxfifo_din				(rxfifo_din[65:0]));// this should never happen.

/* ------------------- srfifo_load instantiation -------------- */
srfifo_load srfifo_load
(/*AUTOINST*/
 // Outputs
 .srfifo_dout				(srfifo_dout[`TBITS]),
 .srfifo_g_wr_ptr_rxclk			(srfifo_g_wr_ptr_rxclk[4:0]),
 // Inputs
 .rx_clk				(rx_clk),
 .rx_reset				(rx_reset),
 .srfifo_wr_en				(srfifo_wr_en),
 .srfifo_rd_ptr_clk			(srfifo_rd_ptr_clk[4:0]),
 .srfifo_din				(srfifo_din[`TBITS]));
   
/* ------------------- sop_sm instantiation ------------------- */
sop_sm sop_sm
(/*AUTOINST*/
 // Outputs
 .set_data_ready			(set_data_ready),
 .rst_data_ready			(rst_data_ready),
 .set_sel				(set_sel[1:0]),
 .rst_sel				(rst_sel[1:0]),
 .sop_state				(sop_state),
 // Inputs
 .rx_clk				(rx_clk),
 .rx_reset				(rx_reset),
 .S_D					(S_D),
 .S_I					(S_I),
 .D_S					(D_S),
 .I_S					(I_S),
 .S_detected				(S_detected),
 .T_detected_at_modified_pkt		(T_detected_at_modified_pkt),
 .MID_PKT_ERR_detected_at_modified_pkt	(MID_PKT_ERR_detected_at_modified_pkt),
 .rxfifo_full_rxclk			(rxfifo_full_rxclk),
 .rxfifo_afull_rxclk			(rxfifo_afull_rxclk),
 .link_fault				(link_fault));

/* ------------------- xmac_fcs instantiation ----------------- */
   wire initialize_rx_crc = rx_reset | !rx_data_valid_gmux;
xmac_fcs xmac_fcs
(/*Do Not use AUTOINST since the clk, reset, compute_en, etc won't be correct*/
                .clk(rx_clk),
                .initialize_crc(initialize_rx_crc),
                .compute_en(~initialize_rx_crc), 	   
                .crc_chk_dis(crc_chk_dis),
                .data_valid(rx_data_valid_gmux),
                .dv_8bit(rx_dv_8bit_reg0_gmux),
                .data_64bit(rx_data_64bit_reg0_gmux),
                // outputs
                .new_crc5_result(new_crc5_result[31:0]),
                .crc_result(rx_crc_result[31:0]),
                .crc_error(crc_error));

   
/* ------------------- xrlm_sm  instantiation ----------------- */
xrlm_sm xrlm_sm
(/*AUTOINST*/
 // Outputs
 .valid_data				(valid_data),
 .set_err_time				(set_err_time),
 .eop					(eop),
 .rx_ok					(rx_ok),
 .err_cond				(err_cond),
 .xrlm_state				(xrlm_state),
 // Inputs
 .rx_clk				(rx_clk),
 .rx_reset				(rx_reset),
 .rx_enable_rxclk			(rx_enable_rxclk),
 .rx_data_valid_gmux			(rx_data_valid_gmux),
 .rx_data_valid_gmux_lead		(rx_data_valid_gmux_lead),
 .da_match_err				(da_match_err),
 .rxfifo_full_rxclk			(rxfifo_full_rxclk),
 .rxfifo_afull_rxclk			(rxfifo_afull_rxclk),
 .max_pkt_size_limit			(max_pkt_size_limit),
 .err_chk_dis				(err_chk_dis),
 .link_fault				(link_fault));

/* ------------------- lfs instantiation ---------------------- */
lfs lfs
(/*AUTOINST*/
 // Outputs
 .link_fault				(link_fault),
 .inc_link_fault_count			(inc_link_fault_count),
 .remote_fault_oc			(remote_fault_oc),
 .local_fault_oc			(local_fault_oc),
 .lfs_state				(lfs_state[1:0]),
 // Inputs
 .rx_clk				(rx_clk),
 .rx_reset				(rx_reset),
 .lfs_disable_rxclk			(lfs_disable_rxclk),
 .rxc_a					(rxc_a[3:0]),
 .rxc_b					(rxc_b[3:0]),
 .rx_data_64bit_reg0			(rx_data_64bit_reg0[63:0]));



/* ------------------- debug support -------------------------- */
   RegDff   #(1) S_detected_RegDff (.din(S_detected),.clk(rx_clk),.qout(S_detected_reg));
   RegDff   #(1) T_E_detected_at_modified_pkt_RegDff (.din(T_E_detected_at_modified_pkt),.clk(rx_clk),.qout(T_E_detected_at_modified_pkt_reg));
   RegDff   #(1) END_PKT_ERR_detected_a_at_modified_pkt_RegDff (.din(END_PKT_ERR_detected_a_at_modified_pkt),.clk(rx_clk),.qout(END_PKT_ERR_detected_a_at_modified_pkt_reg));
   RegDff   #(1) END_PKT_ERR_detected_b_at_modified_pkt_RegDff (.din(END_PKT_ERR_detected_b_at_modified_pkt),.clk(rx_clk),.qout(END_PKT_ERR_detected_b_at_modified_pkt_reg));
   RegDff   #(1) S_D_RegDff (.din(S_D),.clk(rx_clk),.qout(S_D_reg));
   RegDff   #(1) S_I_RegDff (.din(S_I),.clk(rx_clk),.qout(S_I_reg));
   RegDff   #(1) D_S_RegDff (.din(D_S),.clk(rx_clk),.qout(D_S_reg)); 
   RegDff   #(1) I_S_RegDff (.din(I_S),.clk(rx_clk),.qout(I_S_reg));
   RegDff   #(1) abort_bit_RegDff (.din(abort_bit),.clk(rx_clk),.qout(abort_bit_reg));
   RegDff   #(1) rx_err_RegDff (.din(rx_err),.clk(rx_clk),.qout(rx_err_reg));
   RegDff   #(1) crc_error_reg_RegDff (.din(crc_error),.clk(rx_clk),.qout(crc_error_reg));
   RegDff   #(1) kill_data_ready_RegDff (.din(kill_data_ready),.clk(rx_clk),.qout(kill_data_ready_reg));
   RegDff   #(1) kill_crc_RegDff (.din(kill_crc),.clk(rx_clk),.qout(kill_crc_reg));
   RegDff   #(2) rx_sel_RegDff (.din(rx_sel[1:0]),.clk(rx_clk),.qout(rx_sel_reg[1:0]));
   
endmodule // rx_xmac


