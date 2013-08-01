// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tx_xmac.v
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

/*******************************************************************
 *
 * File Name    : tx_xmac.v
 * Author Name  : John Lo
 * Description  : 
 * Parent Module: xmac
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 6/2/00
 *
 * Copyright (c) 2002, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Design Notes: When OPP underrun txfifo (txfifo_empty & ~eop_txclk)
 *               the crc is intentionally corrupted.
 *               The "E" is generated also.
 * 
 * 
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 ******************************************************************/

`include  "xmac.h"

module tx_xmac 
(/*AUTOARG*/
   // Outputs
   xgmii_txc, xgmii_txd, xpcs_txc, xpcs_txd, txc_image, txd_image, 
   tx_err_image, tx_byte_count, paused_state, txfifo_xfr_err, 
   tx_max_pkt_size_err, set_tx_pkt_ok, toggle_txframe_count, 
   toggle_tx_bcount, txfifo_g_rd_ptr_txclk, txfifo_rd_ptr_txclk, 
   txfifo_underrun_txclk, eop_txclk, tx_data_valid, 
   stfifo_g_rd_ptr_txclk, stfifo_rd_ptr_txclk, stfifo_underrun_txclk, 
   tx_swap_reg, tx_on_reg, tx_on_half_reg, back2back_swap_reg1, 
   replace_txd_time_reg, adjust2crc_full_case_last_byte_position_reg, 
   adjust2crc_full_case_last_byte_position_is_3_or_7_reg, 
   stretch_clks_reg, full_case_last_byte_position_reg, 
   stretch_full_case_last_byte_position_reg, stretch_bytes_reg, 
   minus_4bytes_reg, B_eop_reg, stretch_1_more_clk_reg, 
   no_wasted_BW_reg, ipg_done_trail_temp_reg, tx_byte0_reg0, 
   restart_ipg_timer_reg, eop_txclk_reg0, eop_w_fcs_reg0, 
   tx_abort_reg0, eop_w_fcs_reg1, tx_abort_reg1, ipg_done_reg, 
   ipg_done_lead_temp_reg, force_ipg_done_lead_reg, 
   set_back2back_reg, back2back_reg, xtlm_state, 
   // Inputs
   tx_clk, tx_reset, xgmii_mode, txfifo_dout, no_crc, 
   last_byte_position, max_pkt_size, tx_min_pkt_size, 
   no_tx_min_pkt_size_chk, mac_unique_addr, ipg_value, stretch_ratio, 
   stretch_constant, stretch_mode, rx_fc_pkt_ok_txclk, pause_time, 
   slot_time, txfifo_g_wr_ptr_sync, stfifo_g_wr_ptr_sync, 
   tx_enable_txclk, always_no_crc, tx_output_en_txclk, 
   var_min_ipg_en, mii_mode, gmii_mode, warning_msg_en, 
   remote_fault_oc_txclk, local_fault_oc_txclk
   );
   
 
   input           tx_clk;
   input           tx_reset;
   input 	   xgmii_mode;
   input [65:0]    txfifo_dout;
   input 	   no_crc;
   input [2:0] 	   last_byte_position;
   input [13:0]    max_pkt_size;
// vlint flag_input_port_not_connected off
   input [9:0] 	   tx_min_pkt_size;
   input 	   no_tx_min_pkt_size_chk;
// vlint flag_input_port_not_connected on
   input [47:0]    mac_unique_addr;
   input [2:0] 	   ipg_value;
   input [4:0]     stretch_ratio;
   input [2:0]     stretch_constant;
   input 	   stretch_mode;
   input 	   rx_fc_pkt_ok_txclk;// syncd from address_decoder.v
   input [15:0]    pause_time; // async from  address_decoder.v
   input [`BYTE]   slot_time;
   input [4:0]     txfifo_g_wr_ptr_sync;
   input [4:0]     stfifo_g_wr_ptr_sync;
   input 	   tx_enable_txclk;
   input 	   always_no_crc;
   input 	   tx_output_en_txclk;
   input 	   var_min_ipg_en;
   input 	   mii_mode;
   input 	   gmii_mode;
   // vlint flag_input_port_not_connected off 
   input 	   warning_msg_en;
   // vlint flag_input_port_not_connected on
   input 	   remote_fault_oc_txclk;
   input 	   local_fault_oc_txclk;
                   // outputs
   output [3:0]    xgmii_txc;
   output [31:0]   xgmii_txd;
   output [7:0]    xpcs_txc;
   output [63:0]   xpcs_txd;
                   // loopback path
   output [7:0]    txc_image;
   output [63:0]   txd_image;
   output 	   tx_err_image;
   output [13:0]   tx_byte_count;
   output 	   paused_state;
   output 	   txfifo_xfr_err;
   output 	   tx_max_pkt_size_err;
   output 	   set_tx_pkt_ok;
                   // RMON signals to xmac_sync 
   output 	   toggle_txframe_count;
   output 	   toggle_tx_bcount;
                   // txfifo stuff				  
   output [4:0]    txfifo_g_rd_ptr_txclk;
   output [4:0]    txfifo_rd_ptr_txclk;
   output 	   txfifo_underrun_txclk;
   output 	   eop_txclk;
   output 	   tx_data_valid;
                   // stfifo stuff
   output [4:0]    stfifo_g_rd_ptr_txclk;
   output [4:0]    stfifo_rd_ptr_txclk;
   output 	   stfifo_underrun_txclk;
                   // internal tx_xmac signals to xmac_slv debug_port.
   output 	   tx_swap_reg;
   output 	   tx_on_reg;
   output 	   tx_on_half_reg;
   output 	   back2back_swap_reg1;
   output 	   replace_txd_time_reg;
   output [2:0]    adjust2crc_full_case_last_byte_position_reg;
   output 	   adjust2crc_full_case_last_byte_position_is_3_or_7_reg;
   output [`BYTE]  stretch_clks_reg;
   output [2:0]    full_case_last_byte_position_reg;
   output [3:0]    stretch_full_case_last_byte_position_reg;
   output [2:0]    stretch_bytes_reg;
   output 	   minus_4bytes_reg;
   output 	   B_eop_reg;
   output 	   stretch_1_more_clk_reg;
   output 	   no_wasted_BW_reg;
   output 	   ipg_done_trail_temp_reg;
   output [7:0]    tx_byte0_reg0;
   output 	   restart_ipg_timer_reg;
   output 	   eop_txclk_reg0;
   output 	   eop_w_fcs_reg0;
   output 	   tx_abort_reg0;
   output 	   eop_w_fcs_reg1;
   output 	   tx_abort_reg1;
   output 	   ipg_done_reg;
   output 	   ipg_done_lead_temp_reg;
   output 	   force_ipg_done_lead_reg;
   output 	   set_back2back_reg;
   output 	   back2back_reg;
                   // state machine
   output [2:0]    xtlm_state;
   
   reg 		   last_B_in_B0; // last byte is byte0
   reg 		   last_B_in_B1; // last byte is byte1
   reg 		   last_B_in_B2; // last byte is byte2
   reg 		   last_B_in_B3; // last byte is byte3
   reg 		   last_B_in_B4; // last byte is byte4
   reg 		   last_B_in_B5; // last byte is byte5
   reg 		   last_B_in_B6; // last byte is byte6
   reg 		   last_B_in_B7; // last byte is byte7
   reg [7:0] 	   mod_tx_en_8bit_reg0;
   reg [7:0] 	   mod_tx_en_8bit_reg1;
   reg [63:0] 	   mod_tx_data_64bit_reg0;
   reg [63:0] 	   mod_tx_data_64bit_reg1;
   reg [7:0] 	   T_position;
   reg [7:0] 	   tx_en_8bit;
   reg 		   link_up;
   reg 		   link_fault_dly;
   reg [31:0] 	   dly;
   wire [63:0] 	   tx_data_source;
   wire [63:0] 	   tx_data_64bit;
   wire [63:0] 	   tx_data_64bit_reg0;
   wire [63:0] 	   tx_data_64bit_reg1;
   wire [63:0] 	   tx_data_64bit_reg0_mux;
   wire [63:0] 	   tx_data_64bit_reg1_mux;
   wire [63:0] 	   tx_data_64bit_reg1_mux2; // "T" generation
   wire [31:0] 	   tx_data_32_A; 
   wire [31:0] 	   tx_data_32_B;
   wire [31:0] 	   d_tx_data_32_B;        
   wire [31:0] 	   tx_data_32bit_A; 
   wire [31:0] 	   tx_data_32bit_B;
   wire [63:0] 	   p_txd_mux;
   wire [63:0] 	   p_txd;
   wire [63:0] 	   txd_image;
   wire [63:0] 	   txd;
   wire [63:0] 	   xpcs_txd;
   wire [7:0] 	   tx_en_8bit_reg0;
   wire [7:0] 	   tx_en_8bit_reg1;
   wire [7:0] 	   tx_en_8bit_reg0_mux;
   wire [7:0] 	   tx_en_8bit_reg1_mux;
   wire [3:0] 	   tx_en_4_A = tx_en_8bit_reg1_mux[3:0];
   wire [3:0] 	   tx_en_4_B = tx_en_8bit_reg1_mux[7:4];
   wire [3:0] 	   d_tx_en_4_B;
   wire [3:0] 	   tx_en_4bit_A;
   wire [3:0] 	   tx_en_4bit_B;
   wire [7:0] 	   p_txc_mux;
   wire [7:0] 	   p_txc;
   wire [7:0] 	   txc_image;
   wire [7:0] 	   txc;
   wire [7:0] 	   xpcs_txc;
   wire 	   eop_oc;
   wire 	   replace_txd_time;
   wire [13:0] 	   tx_byte_count;
   wire            min_pkt_size_limit_txclk;
   wire 	   tx_on;
   wire 	   tx_on_half;
   wire [31:0] 	   tx_crc_result;
   wire 	   max_pkt_size_limit_txclk;
   wire 	   new_paused_state;
   wire 	   back2back_swap_reg1;
   wire [`BYTE]    final_ipg_clks;
   wire 	   tx_swap;
   wire 	   txfifo_empty_txclk;
   wire 	   eop_txclk;
   wire 	   add_fcs;
   wire 	   pa_time;
   wire 	   eop_tag = txfifo_dout[64] & (~txfifo_empty_txclk);
   wire 	   force_tx_err;
                   // 10-29-2001, loj replaced opp_txma_sa_repl with opp_txmac_abort.
                   // sa_repl is not used from now on.
                   // wire 	 sa_repl   = txfifo_dout[65] & (~txfifo_empty_txclk);
   wire 	   sa_repl   = 1'b0;
   wire 	   tx_abort  = force_tx_err | txfifo_dout[65] & (~txfifo_empty_txclk);
   wire [7:0]	   sfd = 8'hD5;
   wire [63:0]	   pa_data  = {sfd,{6{8'h55}},`S};
   wire 	   remote_fault_oc_txclk;
   wire 	   local_fault_oc_txclk;
   wire 	   link_fault = remote_fault_oc_txclk | local_fault_oc_txclk;
   wire [2:0]      last_byte_position;
   wire [2:0]      adjust2crc_full_case_last_byte_position;
   wire 	   adjust2crc_full_case_last_byte_position_is_3_or_7;
   wire [`BYTE]    stretch_clks;
   wire [2:0]      full_case_last_byte_position;
   wire [3:0]      stretch_full_case_last_byte_position;
   wire [2:0]      stretch_bytes;
   wire 	   minus_4bytes;
   wire 	   B_eop;
   wire 	   stretch_1_more_clk;
   wire 	   no_wasted_BW;
   wire 	   ipg_done_trail_temp;
   wire [7:0] 	   tx_byte0_reg0 = tx_data_64bit_reg0[`BYTE0];
   wire 	   restart_ipg_timer;
   wire 	   eop_txclk_reg0;
   wire 	   eop_w_fcs_reg0;
   wire 	   tx_abort_reg0;
   wire 	   eop_w_fcs_reg1;
   wire 	   tx_abort_reg1;
   wire 	   ipg_done;
   wire 	   ipg_done_lead_temp;
   wire 	   force_ipg_done_lead;
   wire 	   set_back2back;
   wire 	   back2back;
   
   // vlint flag_net_has_no_load            off
   // vlint flag_dangling_net_within_module off
   wire [13:0] 	   nx_temp_tx_byte_count;
   wire [13:0] 	   temp_tx_byte_count;
   wire [13:0] 	   not_used_tx_byte_count;
   wire [31:0] 	   new_crc5_result;
   wire 	   sa1_time;
   wire 	   sa2_time;
   wire 	   txfifo_rd_en;
   wire 	   txfifo_unload_rdy;
   wire 	   d_pa_time;
   wire 	   tx_crc_error;
   wire  	   warning_msg_en;
   wire   	   back2back_swap;
   wire 	   stfifo_empty_txclk;
   wire 	   txfifo_full_txclk;
   wire  [9:0] 	   tx_min_pkt_size;
   wire  	   no_tx_min_pkt_size_chk;
   // vlint flag_dangling_net_within_module on
   // vlint flag_net_has_no_load            on


   
   // ---------------------------------------
   // DA:   01-80-c2-00-00-01 , T/L: 0x8808
   // ---------------------------------------
   //                    ab     cd      ef
   // mac_unique_addr [15:0] [31:16] [47:32],
   // ---------------------------------------
   wire [63:0]	 sa2_data = {txfifo_dout[63:32],      
                             mac_unique_addr[`BYTE4],  // f (sa6)
                             mac_unique_addr[`BYTE5],  // e (sa5)
                             mac_unique_addr[`BYTE2],  // d (sa4)
                             mac_unique_addr[`BYTE3]}; // c (sa3)
   wire [63:0]	 sa1_data = {mac_unique_addr[`BYTE0],  // b (sa2)
                             mac_unique_addr[`BYTE1],  // a (sa1) 
                             txfifo_dout[47:0]};

   // crc gen
   wire [7:0] 	 crc_byte0 = {tx_crc_result[24],tx_crc_result[25],
                              tx_crc_result[26],tx_crc_result[27],
                              tx_crc_result[28],tx_crc_result[29],
                              tx_crc_result[30],tx_crc_result[31]};
		 
   wire [7:0] 	 crc_byte1 = {tx_crc_result[16],tx_crc_result[17],
                              tx_crc_result[18],tx_crc_result[19],
                              tx_crc_result[20],tx_crc_result[21],
                              tx_crc_result[22],tx_crc_result[23]};
   
   wire [7:0] 	 crc_byte2 = {tx_crc_result[8],tx_crc_result[9],
                              tx_crc_result[10],tx_crc_result[11],
                              tx_crc_result[12],tx_crc_result[13],
                              tx_crc_result[14],tx_crc_result[15]};
   
   wire [7:0] 	 crc_byte3 = {tx_crc_result[0],tx_crc_result[1],
                              tx_crc_result[2],tx_crc_result[3],
                              tx_crc_result[4],tx_crc_result[5],
                              tx_crc_result[6],tx_crc_result[7]}; 

   wire [7:0] 	 tx_byte0      = tx_en_8bit[0] ? txfifo_dout[`BYTE0] : `I;
   wire [7:0] 	 tx_byte1      = tx_en_8bit[1] ? txfifo_dout[`BYTE1] : `I;
   wire [7:0] 	 tx_byte2      = tx_en_8bit[2] ? txfifo_dout[`BYTE2] : `I;
   wire [7:0] 	 tx_byte3      = tx_en_8bit[3] ? txfifo_dout[`BYTE3] : `I;
   wire [7:0] 	 tx_byte4      = tx_en_8bit[4] ? txfifo_dout[`BYTE4] : `I;
   wire [7:0] 	 tx_byte5      = tx_en_8bit[5] ? txfifo_dout[`BYTE5] : `I;
   wire [7:0] 	 tx_byte6      = tx_en_8bit[6] ? txfifo_dout[`BYTE6] : `I;
   wire [7:0] 	 tx_byte7      = tx_en_8bit[7] ? txfifo_dout[`BYTE7] : `I;
   wire [7:0] 	 tx_byte1_reg0 = tx_data_64bit_reg0[`BYTE1];
   wire [7:0] 	 tx_byte2_reg0 = tx_data_64bit_reg0[`BYTE2];
   wire [7:0] 	 tx_byte3_reg0 = tx_data_64bit_reg0[`BYTE3];
   wire [7:0] 	 tx_byte4_reg0 = tx_data_64bit_reg0[`BYTE4];
   wire [7:0] 	 tx_byte5_reg0 = tx_data_64bit_reg0[`BYTE5];
   wire [7:0] 	 tx_byte6_reg0 = tx_data_64bit_reg0[`BYTE6];
   wire [7:0] 	 tx_byte7_reg0 = tx_data_64bit_reg0[`BYTE7];

   
   wire [7:0] 	 tx_byte0_reg1 = tx_data_64bit_reg1[`BYTE0];
   wire [7:0] 	 tx_byte1_reg1 = tx_data_64bit_reg1[`BYTE1];
   wire [7:0] 	 tx_byte2_reg1 = tx_data_64bit_reg1[`BYTE2];
   wire [7:0] 	 tx_byte3_reg1 = tx_data_64bit_reg1[`BYTE3];
   wire [7:0] 	 tx_byte4_reg1 = tx_data_64bit_reg1[`BYTE4];
   wire [7:0] 	 tx_byte5_reg1 = tx_data_64bit_reg1[`BYTE5];
   wire [7:0] 	 tx_byte6_reg1 = tx_data_64bit_reg1[`BYTE6];
   wire [7:0] 	 tx_byte7_reg1 = tx_data_64bit_reg1[`BYTE7];

   assign tx_data_64bit_reg1_mux2[`BYTE0] = T_position[0] ? `T :
                                            tx_data_64bit_reg1_mux[`BYTE0];

   assign tx_data_64bit_reg1_mux2[`BYTE1] = T_position[1] ? `T :
                                            tx_data_64bit_reg1_mux[`BYTE1];
 
   assign tx_data_64bit_reg1_mux2[`BYTE2] = T_position[2] ? `T :
                                            tx_data_64bit_reg1_mux[`BYTE2];

   assign tx_data_64bit_reg1_mux2[`BYTE3] = T_position[3] ? `T :
	                                    tx_data_64bit_reg1_mux[`BYTE3];

   assign tx_data_64bit_reg1_mux2[`BYTE4] = T_position[4] ? `T :
	                                    tx_data_64bit_reg1_mux[`BYTE4];

   assign tx_data_64bit_reg1_mux2[`BYTE5] = T_position[5] ? `T :
	                                    tx_data_64bit_reg1_mux[`BYTE5];

   assign tx_data_64bit_reg1_mux2[`BYTE6] = T_position[6] ? `T :
                                            tx_data_64bit_reg1_mux[`BYTE6];

   assign tx_data_64bit_reg1_mux2[`BYTE7] = T_position[7] ? `T :
		                            tx_data_64bit_reg1_mux[`BYTE7];
   
   assign tx_data_32_A = tx_data_64bit_reg1_mux2[31:0]; 
   assign tx_data_32_B = tx_data_64bit_reg1_mux2[63:32];

/* ----------------- first stage pipeline ----------------------- */

   wire   qualified_no_crc = always_no_crc | no_crc;

   wire   add_crc = (~qualified_no_crc) | add_fcs;

   wire   eop_w_fcs = eop_txclk & add_crc;

   RegDff   #(8)  tx_en_8bit_reg0_RegDff   (.din(tx_en_8bit),  
                                 .clk(tx_clk),.qout(tx_en_8bit_reg0));
   RegDff   #(64) tx_data_64bit_reg0_RegDff(.din(tx_data_64bit),
                                 .clk(tx_clk),.qout(tx_data_64bit_reg0));
   FD1 eop_txclk_reg0_FD1(.D(eop_txclk),     .CP(tx_clk),.Q(eop_txclk_reg0));
   FD1 eop_w_fcs_reg0_FD1(.D(eop_w_fcs),     .CP(tx_clk),.Q(eop_w_fcs_reg0));

   FD1 tx_abort_reg0_FD1 (.D(tx_abort), .CP(tx_clk),.Q(tx_abort_reg0));
/* ----------------- second stage pipeline ---------------------- */
   RegDff   #(8)  tx_en_8bit_reg1_RegDff   (.din(tx_en_8bit_reg0_mux),  
                                 .clk(tx_clk),.qout(tx_en_8bit_reg1));
   RegDff   #(64) tx_data_64bit_reg1_RegDff(.din(tx_data_64bit_reg0_mux),
                                 .clk(tx_clk),.qout(tx_data_64bit_reg1));
   FD1 eop_w_fcs_reg1_FD1(.D(eop_w_fcs_reg0),.CP(tx_clk),.Q(eop_w_fcs_reg1));
   FD1 tx_abort_reg1_FD1 (.D(tx_abort_reg0), .CP(tx_clk),.Q(tx_abort_reg1));
/* ----- delay regs between second and third stage pipeline ----- */
   RegDff   #(4)  d_tx_en_4_B_RegDff(.din(tx_en_4_B),.clk(tx_clk),
                                     .qout(d_tx_en_4_B));
   RegDff   #(32) d_tx_data_32_B_RegDff(.din(tx_data_32_B),.clk(tx_clk),
                                     .qout(d_tx_data_32_B));
   
/* ----------------- third stage pipeline ----------------------- */
   RegDff   #(8)  txc_RegDff(.din(p_txc),.clk(tx_clk),.qout(txc));
   RegDff   #(64) txd_RegDff(.din(p_txd),.clk(tx_clk),.qout(txd));
   
   RegDff   #(8)  txc_image_RegDff(.din(~tx_en_8bit_reg1_mux),    .clk(tx_clk),.qout(txc_image));
   RegDff   #(64) txd_image_RegDff(.din(tx_data_64bit_reg1_mux2),.clk(tx_clk),.qout(txd_image));
   FD1 tx_err_image_FD1 (.D(tx_abort_reg1), .CP(tx_clk),.Q(tx_err_image));

   // final output mux
   xMUX_2to1 #(32) xgmii_txd_xMUX_2to1(.din0(txd[63:32]),.din1(txd[31:0]),.sel(tx_clk),.dout(xgmii_txd));
   xMUX_2to1 #(4)  xgmii_txc_xMUX_2to1(.din0(txc[7:4]),  .din1(txc[3:0]), .sel(tx_clk),.dout(xgmii_txc));
   
   my_buffers #(8)  xpcs_txc_my_buffers(.z(xpcs_txc),.a(txc));   
   my_buffers #(64) xpcs_txd_my_buffers(.z(xpcs_txd),.a(txd));
   
/* ------------------- tx_xencap_logic -------------------------- */
  // vlint flag_empty_block off
  // vlint flag_variable_in_sensitivity_list_not_used_in_block off
always @ (/*AUTOSENSE*/crc_byte0 or crc_byte1 or crc_byte2
	  or crc_byte3 or tx_byte0_reg1 or tx_byte1_reg0
	  or tx_byte1_reg1 or tx_byte2_reg0 or tx_byte2_reg1
	  or tx_byte3_reg0 or tx_byte3_reg1 or tx_byte4_reg0
	  or tx_byte4_reg1 or tx_byte5_reg0 or tx_byte5_reg1
	  or tx_byte6_reg0 or tx_byte6_reg1 or tx_byte7_reg0
	  or tx_byte7_reg1 or tx_data_64bit_reg0 or tx_data_64bit_reg1
	  or tx_en_8bit_reg0 or tx_en_8bit_reg1 or tx_reset)
  begin
     last_B_in_B0 = 0;
     last_B_in_B1 = 0;
     last_B_in_B2 = 0;
     last_B_in_B3 = 0;
     last_B_in_B4 = 0;
     last_B_in_B5 = 0;
     last_B_in_B6 = 0;
     last_B_in_B7 = 0;
     mod_tx_en_8bit_reg0    = tx_en_8bit_reg0;
     mod_tx_en_8bit_reg1    = tx_en_8bit_reg1;
     mod_tx_data_64bit_reg0 = tx_data_64bit_reg0;
     mod_tx_data_64bit_reg1 = tx_data_64bit_reg1;
  casex(tx_en_8bit_reg1)  // synopsys parallel_case full_case
    8'b00000001: begin // insert_crc only
                      last_B_in_B0 = 1;
                      mod_tx_en_8bit_reg1 = 8'b00011111;
                      mod_tx_data_64bit_reg1            = {tx_byte7_reg1,
							   tx_byte6_reg1,
							   tx_byte5_reg1,
							   crc_byte3,
							   crc_byte2,
							   crc_byte1,
							   crc_byte0,
							   tx_byte0_reg1};
                 end // case: 8'b00000001
    
    8'b00000011: begin // insert_crc only
                      last_B_in_B1 = 1;
                      mod_tx_en_8bit_reg1 = 8'b00111111;
                      mod_tx_data_64bit_reg1            = {tx_byte7_reg1,
							   tx_byte6_reg1,
							   crc_byte3,
							   crc_byte2,
							   crc_byte1,
							   crc_byte0,
							   tx_byte1_reg1,
							   tx_byte0_reg1};
                 end // case: 8'b00000011
    
    8'b00000111: begin // insert_crc only
                      last_B_in_B2 = 1; 
                      mod_tx_en_8bit_reg1 = 8'b01111111;
                      mod_tx_data_64bit_reg1            = {tx_byte7_reg1,
							   crc_byte3,
							   crc_byte2,
							   crc_byte1,
							   crc_byte0,
							   tx_byte2_reg1,
							   tx_byte1_reg1,
							   tx_byte0_reg1};
                 end // case: 8'b00000111
    
    8'b00001111: begin // insert_crc only
                      last_B_in_B3 = 1;
                      mod_tx_en_8bit_reg1 = 8'b11111111;
                      mod_tx_data_64bit_reg1            = {crc_byte3,
							   crc_byte2,
							   crc_byte1,
							   crc_byte0,
							   tx_byte3_reg1,
							   tx_byte2_reg1,
							   tx_byte1_reg1,
							   tx_byte0_reg1};
                 end // case: 8'b00001111
    
    8'b00011111: begin // both i and a
                      last_B_in_B4 = 1;
                      mod_tx_en_8bit_reg1 = 8'b11111111;
                      mod_tx_data_64bit_reg1            = {crc_byte2,
							   crc_byte1,
							   crc_byte0,
							   tx_byte4_reg1,
							   tx_byte3_reg1,
							   tx_byte2_reg1,
							   tx_byte1_reg1,
							   tx_byte0_reg1};
                      mod_tx_en_8bit_reg0 = 8'b00000001;
                      mod_tx_data_64bit_reg0            = {tx_byte7_reg0, 
							   tx_byte6_reg0,
							   tx_byte5_reg0,
							   tx_byte4_reg0,
							   tx_byte3_reg0,
							   tx_byte2_reg0,
							   tx_byte1_reg0,
							   crc_byte3};
                 end // case: 8'b00011111
    
    8'b00111111: begin // both i and a
                      last_B_in_B5 = 1; 
                      mod_tx_en_8bit_reg1 = 8'b11111111;
                      mod_tx_data_64bit_reg1            = {crc_byte1,
							   crc_byte0,
							   tx_byte5_reg1,
							   tx_byte4_reg1,
							   tx_byte3_reg1,
							   tx_byte2_reg1,
							   tx_byte1_reg1,
							   tx_byte0_reg1};
                      mod_tx_en_8bit_reg0 = 8'b00000011;
                      mod_tx_data_64bit_reg0            = {tx_byte7_reg0, 
							   tx_byte6_reg0,
							   tx_byte5_reg0,
							   tx_byte4_reg0,
							   tx_byte3_reg0,
							   tx_byte2_reg0,
							   crc_byte3,
							   crc_byte2};
                 end // case: 8'b00111111
    
    8'b01111111: begin // both i and a
                      last_B_in_B6 = 1;
                      mod_tx_en_8bit_reg1 = 8'b11111111;
                      mod_tx_data_64bit_reg1            = {crc_byte0,
							   tx_byte6_reg1,
							   tx_byte5_reg1,
							   tx_byte4_reg1,
							   tx_byte3_reg1,
							   tx_byte2_reg1,
							   tx_byte1_reg1,
							   tx_byte0_reg1};
       
                      mod_tx_en_8bit_reg0 = 8'b00000111;
                      mod_tx_data_64bit_reg0            = {tx_byte7_reg0, 
							   tx_byte6_reg0,
							   tx_byte5_reg0,
							   tx_byte4_reg0,
							   tx_byte3_reg0,
							   crc_byte3,
							   crc_byte2,
                                                           crc_byte1};
                 end // case: 8'b01111111
    
    8'b11111111: begin // append_crc only
                      last_B_in_B7 = 1;
                      mod_tx_en_8bit_reg0 = 8'b00001111;
                      mod_tx_data_64bit_reg0            = {tx_byte7_reg0, 
							   tx_byte6_reg0,
							   tx_byte5_reg0,
							   tx_byte4_reg0,
							   crc_byte3,
							   crc_byte2,
                                                           crc_byte1,
                                                           crc_byte0};
                 end // case: 8'b11111111
    
    8'b00000000: begin // do nothing
                 end // case: 8'b00000000
    
    8'b11111110: begin // do nothing
                 end // case: 8'b00000000
    
    default:
                 begin
                   // synopsys translate_off
                   if (tx_reset == 0)
                     $display("(* ERROR:  at sim time = %d, (2) in tx_xmac.v tx_en_8bit_reg1 contains invalid combination. tx_en_8bit_reg1 = %b *) \n", $time, tx_en_8bit_reg1);
		   // synopsys translate_on
                 end // case: default
  endcase // casex(tx_en_8bit_reg1)
  end // always @ (tx_en_8bit_reg0    or tx_en_8bit_reg1    or...
  // vlint flag_variable_in_sensitivity_list_not_used_in_block on
  // vlint flag_empty_block on
   
 
   wire 	 last_B_in_B_0to3 = last_B_in_B0 | last_B_in_B1 | 
                                    last_B_in_B2 | last_B_in_B3;
   wire 	 last_B_in_B_4to6 = last_B_in_B4 | last_B_in_B5 | 
                                    last_B_in_B6;
   wire 	 insert_crc       = eop_w_fcs_reg1 & 
                                    (last_B_in_B_0to3 | last_B_in_B_4to6);
   wire 	 append_crc       = eop_w_fcs_reg1 &
                                    (last_B_in_B7 | last_B_in_B_4to6);

   assign 	 tx_en_8bit_reg0_mux    = append_crc ? mod_tx_en_8bit_reg0:
                                                       tx_en_8bit_reg0;

   assign 	 tx_data_64bit_reg0_mux = append_crc ? mod_tx_data_64bit_reg0:
                                                       tx_data_64bit_reg0;
                                                                                   // corrupt CRC
   // In mii_mode|gmii_mode the tx_en_8bit_reg1 has to be as is so that the tx_err can be transmitted correctly.
   // In xgmii_mode the tx_en_8bit_reg1 will become txc (txc == ~tx_en).  It has to be 8'b0 to make txc == 1
   // so that the "E" char can be sent out with txc= 1.
   assign  	 tx_en_8bit_reg1_mux    = (tx_abort_reg0 &  xgmii_mode) ? 8'b0 :  // lookahead to avoid corrupt "T"
                                          (tx_abort_reg1 & ~xgmii_mode) ? tx_en_8bit_reg1 :
                                           insert_crc                   ? mod_tx_en_8bit_reg1:
                                                                          tx_en_8bit_reg1;  

   assign 	 tx_data_64bit_reg1_mux = (tx_abort_reg0 &  xgmii_mode) ? {8{`E}} :
                                          (tx_abort_reg1 & ~xgmii_mode) ? tx_data_64bit_reg1 :
                                          insert_crc                    ? mod_tx_data_64bit_reg1:
                                                                          tx_data_64bit_reg1;

   assign tx_data_32bit_A = back2back_swap_reg1 ? d_tx_data_32_B:
                                                    tx_data_32_A;
   
   assign tx_data_32bit_B = back2back_swap_reg1 ?   tx_data_32_A :
                                                    tx_data_32_B ;

   assign tx_en_4bit_A    = back2back_swap_reg1 ? d_tx_en_4_B:
                                                    tx_en_4_A;
   
   assign tx_en_4bit_B    = back2back_swap_reg1 ?   tx_en_4_A :
                                                    tx_en_4_B ;
   assign p_txd_mux   = { tx_data_32bit_B,tx_data_32bit_A};
   
   assign p_txc_mux   = {~tx_en_4bit_B,  ~tx_en_4bit_A};

   wire   output_en_sel = tx_output_en_txclk & xgmii_mode;

//   assign p_txd = output_en_sel ? p_txd_mux : {8{`I}}; // send I char
   assign p_txd = remote_fault_oc_txclk ? {8{`I}} :      // generate idle
                  local_fault_oc_txclk  ? `REMOTE_FAULT_SEQ : 
                  output_en_sel   ? p_txd_mux : {8{`I}}; // send I char
   
//   assign p_txc = output_en_sel ? p_txc_mux : 8'hFF;
   assign p_txc = remote_fault_oc_txclk ?  8'hFF :       // generate idle
                  local_fault_oc_txclk  ? {8'b0001_0001} : 
                  output_en_sel   ?  p_txc_mux : 8'hFF;
// `define  REMOTE_FAULT_SEQ {8'h02,8'h00,8'h00,`SEQ,8'h02,8'h00,8'h00,`SEQ} 
   
 // RMON support in tx_encap_logic
TFF toggle_tx_bcount_TFF(.toggle(tx_on),
                         .clk(tx_clk),
                         .reset(tx_reset),
                         .qout(toggle_tx_bcount));
   
/* ---------- start of tx_en_8bit_decoder logic ------------- */
   reg [7:0] decoded_tx_en_8bit;
always @ (tx_on_half or last_byte_position)
  if (tx_on_half)
          decoded_tx_en_8bit = 8'b00001111; // last byte is byte3
  else
  case (last_byte_position)  // synopsys parallel_case full_case
    3'h0: decoded_tx_en_8bit = 8'b00000001; // last byte is byte0
    3'h1: decoded_tx_en_8bit = 8'b00000011; // last byte is byte1
    3'h2: decoded_tx_en_8bit = 8'b00000111; // last byte is byte2
    3'h3: decoded_tx_en_8bit = 8'b00001111; // last byte is byte3
    3'h4: decoded_tx_en_8bit = 8'b00011111; // last byte is byte4
    3'h5: decoded_tx_en_8bit = 8'b00111111; // last byte is byte5
    3'h6: decoded_tx_en_8bit = 8'b01111111; // last byte is byte6
    3'h7: decoded_tx_en_8bit = 8'b11111111; // last byte is byte7
    default:decoded_tx_en_8bit=8'b00000000; 
  endcase // case(last_byte_position)

/* ---------- end of tx_en_8bit_decoder logic --------------- */

/* ---------- start of T_position decoder logic ------------- */
   
always @ (eop_oc or tx_en_8bit_reg1_mux)
  if (eop_oc)
    begin
      T_position =  8'b00000000;
      casex (tx_en_8bit_reg1_mux)  // synopsys parallel_case full_case
        8'b00000000: T_position =  8'b00000001; // no data
        8'b00000001: T_position =  8'b00000010; // last byte is byte0
        8'b00000011: T_position =  8'b00000100; // last byte is byte1
        8'b00000111: T_position =  8'b00001000; // last byte is byte2
        8'b00001111: T_position =  8'b00010000; // last byte is byte3
        8'b00011111: T_position =  8'b00100000; // last byte is byte4
        8'b00111111: T_position =  8'b01000000; // last byte is byte5
        8'b01111111: T_position =  8'b10000000; // last byte is byte6
        8'b11111111: T_position =  8'b00000000; // last byte is byte7 or regular data.
        default    : begin
                     T_position =  8'b00000001;
	             // synopsys translate_off
                     $display("(* ERROR:  at sim time = %d, tx_xmac.v contains invalid tx_en_8bit_reg1_mux = %b *) \n", $time, tx_en_8bit_reg1_mux);
	             // synopsys translate_on
                     end
      endcase // casex(tx_en_8bit_reg1_mux)
    end 
  else
    begin
      T_position =  8'b00000000;
    end
 
   wire rst_eop_oc = (|T_position);
 RS_FF eop_oc_RS_FF(.set(eop_txclk_reg0),.rst(rst_eop_oc),.clk(tx_clk),
                    .reset(tx_reset),.qout(eop_oc));

/* ---------- end of T_position decoder logic --------------- */

   always @ (tx_on or pa_time or eop_txclk or decoded_tx_en_8bit)
	if (~(tx_on | pa_time))
	           tx_en_8bit = 0;                  // no data transfer
	else
	  casex ({pa_time,eop_txclk}) // synopsys parallel_case full_case
	    2'b00:  tx_en_8bit = 8'hFF;              // regular control
	    2'b01:  tx_en_8bit = decoded_tx_en_8bit; // eop_time control
	    2'b1x:  tx_en_8bit = 8'hfe;              // pa_time control
            default:tx_en_8bit = 0;
	  endcase
   
   assign        max_pkt_size_limit_txclk = (tx_byte_count > max_pkt_size);

`ifdef ENABLE_XMAC_PAD_64_BYTES
   wire 	 cond1, cond2, cond3, cond4;
   wire [13:0]   tx_min_pkt_size_minus_4 = {4'b0,tx_min_pkt_size} - 4;
   wire [13:0]   tx_min_pkt_size_minus_8 = {4'b0,tx_min_pkt_size} - 8;
   wire [13:0]   tx_min_pkt_size_minus_16= {4'b0,tx_min_pkt_size} -16;

   assign        min_pkt_size_limit_txclk = cond1 | cond2 | cond3 | cond4;
                 // 63~61
   assign        cond1 = (nx_temp_tx_byte_count >  tx_min_pkt_size_minus_4) &
	                 (nx_temp_tx_byte_count <  {4'b0,tx_min_pkt_size}) &
                          ~no_tx_min_pkt_size_chk; 
   
                 // 60~57
   assign        cond2 = (nx_temp_tx_byte_count >  tx_min_pkt_size_minus_8)  &
	                ((nx_temp_tx_byte_count <  tx_min_pkt_size_minus_4)  |
                         (nx_temp_tx_byte_count == tx_min_pkt_size_minus_4)) &
                          ~no_tx_min_pkt_size_chk;

                 // 56~49
   assign        cond3 = (nx_temp_tx_byte_count >  tx_min_pkt_size_minus_16) &
	                ((nx_temp_tx_byte_count <  tx_min_pkt_size_minus_8)  |
                         (nx_temp_tx_byte_count == tx_min_pkt_size_minus_8)) &
                          ~no_tx_min_pkt_size_chk;

                 // 48~1
   assign        cond4 = (nx_temp_tx_byte_count >  0) &
	                ((nx_temp_tx_byte_count <  tx_min_pkt_size_minus_16)  |
                         (nx_temp_tx_byte_count == tx_min_pkt_size_minus_16)) &
                          ~no_tx_min_pkt_size_chk;

`else
   assign 	 min_pkt_size_limit_txclk = 0;
`endif
   
FD1 sa1_time_FD1 (.D(pa_time), .CP(tx_clk),.Q(sa1_time));
FD1 sa2_time_FD1 (.D(sa1_time),.CP(tx_clk),.Q(sa2_time));
FD1 d_pa_time_FD1 (.D(pa_time),.CP(tx_clk),.Q(d_pa_time)); // spare part, not used

   assign replace_txd_time = pa_time | sa_repl & (sa1_time | sa2_time);
   assign tx_data_source = pa_time  ? pa_data :
                      sa1_time ? sa1_data: sa2_data;
   
   assign tx_data_64bit = replace_txd_time ? tx_data_source :
 {tx_byte7,tx_byte6,tx_byte5,tx_byte4,tx_byte3,tx_byte2,tx_byte1,tx_byte0};
   
FD1 tx_data_valid_FD1  (.D(tx_on),.CP(tx_clk),.Q(tx_data_valid));

PlsGen2 ipg_done_lead_temp_PlsGen2 (.sig_in(ipg_done),.clk(tx_clk),
                 .lead(ipg_done_lead_temp),.trail(ipg_done_trail_temp));

// loj 12/14/00
   wire   p1_force_ipg_done_lead = eop_txclk & (final_ipg_clks[`BYTE] == 8'h0 );
   
FD1 force_ipg_done_lead_FD1 (.D(p1_force_ipg_done_lead),
                             .CP(tx_clk),.Q(force_ipg_done_lead));
   
   wire   ipg_done_lead = ipg_done_lead_temp  | force_ipg_done_lead;
   
   
xREG #(1) back2back_xREG(.din(set_back2back),
                         .clk(tx_clk),
                         .en(pa_time),
                         .reset(tx_reset),
                         .qout(back2back));

   assign   back2back_swap = back2back & tx_swap;
FD1 back2back_swap_reg1_FD1  (.D(back2back_swap),.CP(tx_clk),
                              .Q(back2back_swap_reg1));

/* ------------------- end of tx_encap_logic -------------------- */


/* ------------------- tx_fc logic ------------------------------ */
 // Well-know multicase address DA reserved for Pause Frame:
 // DA:   01-80-c2-00-00-01 , T/L: 0x8808
 // mac control opcode: 0x0001
 // The Pause frame time unit: 512 bits (64 bytes) time == slot time.
 // For the 156.25Mhz, every clock is 8-byte time.
 // 8 clock is 64 byte time.
 // Recommended slot_time value is 8 (clocks).
   
   wire [7:0] 	 slot_time_count;
   wire [15:0] 	 pause_time_count;
   wire 	 slot_time_count_eq_slot_time = (slot_time_count == slot_time);

 // slot timer, each increment indicates 8 byte time.
   wire clr_slot_timer = tx_reset | rx_fc_pkt_ok_txclk |
	                 pa_time  | slot_time_count_eq_slot_time;
   
 counter_X8  FC_SLOT_TIMER(.clk(tx_clk),
			   .clr(clr_slot_timer),
		 	   .enable(paused_state & (!tx_on)),
			   .count(slot_time_count));
   
 // pause_timer   
 counter_ld_dn_X16 PAUSE_TIMER(
                .clk(tx_clk),
                .clr(tx_reset),
                .enable(paused_state & slot_time_count_eq_slot_time),
                .load(rx_fc_pkt_ok_txclk),  // load pause_time
                .din(pause_time),           // async from rxbclk
                .count(pause_time_count)
                );

   assign 	 new_paused_state = (pause_time_count != 16'h0);
 FD1 PAUSED_STATE_FF(.D(new_paused_state),.CP(tx_clk),.Q(paused_state));
/* ------------------- end of tx_fc logic ----------------------- */

/* ------------------- xtlm_sm logic ---------------------------- */
 // RMON spport 
TFF toggle_txframe_count_TFF(.toggle(eop_txclk_reg0),
                         .clk(tx_clk),
                         .reset(tx_reset),
                         .qout(toggle_txframe_count));
 
/* ------------------- end of xtlm_sm logic ---------------------- */
 
/* ------------------- tx_byte_counters instantiation ------------ */

   wire reset_tx_byte_counters = tx_reset | (~tx_on);
   
// tx_byte_counter is for counting real tx_byte_count number which
// is used to compare with rx_byte_count in the loopback mode.
byte_counter tx_byte_counter(
       .clk(tx_clk),
       .reset(reset_tx_byte_counters),
       .byte_count_en(tx_on),
       .dv_en_8bit(tx_en_8bit),
// outputs     
       .byte_count(tx_byte_count),
       .nx_byte_count(not_used_tx_byte_count));

`ifdef ENABLE_XMAC_PAD_64_BYTES
// tx_byte_counter is for generation of cond1, cond2, cond3, cond4, and
// min_pkt_size_limit_txclk which are use by xtlm_sm.
// nx_tx_byte_count will not generate logic loop while nx_tx_byte_count
// will.    
tx_byte_counter  temp_tx_byte_counter (
       .tx_clk(tx_clk), 
       .tx_reset(reset_tx_byte_counters), 
       .last_byte_position(last_byte_position),
       .eop_tag(eop_tag),
       .tx_byte_count_en(tx_on),
// outputs				     
       .tx_byte_count(temp_tx_byte_count[13:0]),
       .nx_tx_byte_count(nx_temp_tx_byte_count[13:0])
       );
`else
   assign temp_tx_byte_count = 0;
   assign nx_temp_tx_byte_count = 0;
`endif	   
   
/* ------------------ txfiflo_unload instantiation -------------- */
txfifo_unload txfifo_unload(
		.tx_clk(tx_clk),
		.tx_reset(tx_reset),
		.txfifo_g_wr_ptr_sync(txfifo_g_wr_ptr_sync), 
	 	.txfifo_rd_en(txfifo_rd_en),
                .stfifo_rd_en(eop_txclk),        
		.stfifo_g_wr_ptr_sync(stfifo_g_wr_ptr_sync),     
// outputs
		 //txfifo stuff
                .txfifo_unload_rdy(txfifo_unload_rdy),
                .txfifo_g_rd_ptr_txclk(txfifo_g_rd_ptr_txclk),
                .txfifo_rd_ptr_txclk(txfifo_rd_ptr_txclk),
	 	.txfifo_empty_txclk(txfifo_empty_txclk),
 		.txfifo_full_txclk(txfifo_full_txclk),
		 //stfifo stuff
                .stfifo_g_rd_ptr_txclk(stfifo_g_rd_ptr_txclk),
                .stfifo_rd_ptr_txclk(stfifo_rd_ptr_txclk),
	 	.stfifo_empty_txclk(stfifo_empty_txclk),
		.stfifo_underrun_txclk(stfifo_underrun_txclk) 
                 );
   
/* ------------------ xdeferral instantiation ------------------- */
xdeferral xdeferral(
                .tx_clk(tx_clk),
                .tx_reset(tx_reset),
                .mii_mode(mii_mode),
                .gmii_mode(gmii_mode),
                .tx_byte_count_en(tx_on),
                .tx_en_8bit(tx_en_8bit),
                .stretch_mode(stretch_mode),
                .stretch_constant(stretch_constant),
                .stretch_ratio(stretch_ratio),
                .ipg_value(ipg_value[2:0]), // only part of it
                .tx_on_half(tx_on_half), // to modify last_byte_position
                .add_crc(add_crc),
                .eop_txclk(eop_txclk),
                .last_byte_position(last_byte_position),
                .var_min_ipg_en(var_min_ipg_en),
                .pa_time(pa_time),
                .back2back_swap_reg1(back2back_swap_reg1),
                .set_back2back(set_back2back),
// outputs
                .tx_swap(tx_swap),		       
                .ipg_done(ipg_done),
                .final_ipg_clks(final_ipg_clks),
                 // internal observation
                .full_case_last_byte_position(full_case_last_byte_position),
                .adjust2crc_full_case_last_byte_position(adjust2crc_full_case_last_byte_position[2:0]),
                .adjust2crc_full_case_last_byte_position_is_3_or_7(adjust2crc_full_case_last_byte_position_is_3_or_7),
                .stretch_full_case_last_byte_position(stretch_full_case_last_byte_position),
                .stretch_clks(stretch_clks[`BYTE]),
                .stretch_bytes(stretch_bytes[2:0]),
                .stretch_1_more_clk(stretch_1_more_clk),
                .B_eop(B_eop),
                .minus_4bytes(minus_4bytes),
                .no_wasted_BW(no_wasted_BW)
                 );
   
/* ------------------ xmac_fcs instantiation -------------------- */
   wire initialize_tx_crc = tx_reset | sa1_time;
   wire tx_crc_compute_en = tx_data_valid & (~tx_reset);
   
xmac_fcs xmac_fcs(
                .clk(tx_clk),
		.initialize_crc(initialize_tx_crc),
                .compute_en(tx_crc_compute_en), 	   
                .crc_chk_dis(1'b0),
                .data_valid(tx_data_valid),
                .dv_8bit(tx_en_8bit_reg0),
                .data_64bit(tx_data_64bit_reg0),
                // outputs
                .new_crc5_result(new_crc5_result[31:0]),
                .crc_result(tx_crc_result),
                .crc_error(tx_crc_error));

/* ------------------- xtlm_sm ---------------------------------- */
 xtlm_sm xtlm_sm(
               .tx_clk(tx_clk),
               .tx_reset(tx_reset),
	       .link_up(link_up),
               .txfifo_unload_rdy(txfifo_unload_rdy),
               .tx_enable_txclk(tx_enable_txclk),
               .txfifo_empty_txclk(txfifo_empty_txclk),
               .eop_tag(eop_tag),
               .ipg_done(ipg_done),
               .ipg_done_lead(ipg_done_lead),
               .max_pkt_size_limit_txclk(max_pkt_size_limit_txclk),
               .min_pkt_size_limit_txclk(min_pkt_size_limit_txclk),
`ifdef ENABLE_XMAC_PAD_64_BYTES
               .cond1(cond1),
               .cond2(cond2),
               .cond3(cond3),
               .cond4(cond4),
`else
`endif
               .pause(paused_state),   
// outputs
               .txfifo_rd_en(txfifo_rd_en),
               .tx_on(tx_on),
               .tx_on_half(tx_on_half),
               .set_back2back(set_back2back),
               .pa_time(pa_time),
               .txfifo_xfr_err(txfifo_xfr_err),
               .tx_max_pkt_size_err(tx_max_pkt_size_err),
               .set_tx_pkt_ok(set_tx_pkt_ok),
               .restart_ipg_timer(restart_ipg_timer),
               .eop_txclk(eop_txclk),
               .add_fcs(add_fcs),
               .force_tx_err(force_tx_err),
               .txfifo_underrun_txclk(txfifo_underrun_txclk),
               .xtlm_state(xtlm_state));

/* ------------------- lfs glue logic ------------------------- */
   //  Added delay 32 idle tx_clk clocks for xpcs to recover from
   //  SEQ order set back to normal IDLE order set. 
   always @ (posedge tx_clk)
     begin
        dly[0 ] <= link_fault;
        dly[1 ] <= dly[0 ];
        dly[2 ] <= dly[1 ];
        dly[3 ] <= dly[2 ];
        dly[4 ] <= dly[3 ];
        dly[5 ] <= dly[4 ];
        dly[6 ] <= dly[5 ];
        dly[7 ] <= dly[6 ];
        dly[8 ] <= dly[7 ];
        dly[9 ] <= dly[8 ];
        dly[10] <= dly[9 ];
        dly[11] <= dly[10];
        dly[12] <= dly[11];
        dly[13] <= dly[12];
        dly[14] <= dly[13];
        dly[15] <= dly[14];
        dly[16] <= dly[15];
        dly[17] <= dly[16];
        dly[18] <= dly[17];
        dly[19] <= dly[18];
        dly[20] <= dly[19];
        dly[21] <= dly[20];
        dly[22] <= dly[21];
        dly[23] <= dly[22];
        dly[24] <= dly[23];
        dly[25] <= dly[24];
        dly[26] <= dly[25];
        dly[27] <= dly[26];
        dly[28] <= dly[27];
        dly[29] <= dly[28];
        dly[30] <= dly[29];
        dly[31] <= dly[30];
        link_fault_dly <= dly[31];
     end

   //             _________                      ______________
   // link_fault           |____________________|
   //             _______________                      ________
   // link_fault_dly             |____________________|
   //                             _______________
   // link_up     _______________|               |______________
   //                      ^^^^^^^
   //        delay for xpcs|||||||  <- 32 clocks 
   always @ (posedge tx_clk)
     begin
	link_up <= (~link_fault_dly) & (~link_fault);
     end
   
/* ------------------- test logic -------------------------------- */
// synopsys translate_off
//summit modcovoff -bpe
//VCS coverage off
ipg_checker ipg_checker(
       .tx_clk(tx_clk),
       .tx_reset(tx_reset),
       .xgmii_txc(xgmii_txc),
       .xgmii_txd(xgmii_txd),
       .var_min_ipg_en(var_min_ipg_en),
       .add_crc(add_crc),
       .eop_txclk(eop_txclk),
       .B_eop(B_eop),
       .stretch_mode(stretch_mode),
       .warning_msg_en(warning_msg_en)
);
//VCS coverage on
//summit modcovon -bpe
// synopsys translate_on
/* ------------------- end of test logic ------------------------- */

/* ------------------- debug mux logic --------------------------- */


   RegDff   #(1) tx_swap_RegDff (.din(tx_swap),.clk(tx_clk),.qout(tx_swap_reg));
   RegDff   #(1) tx_on_RegDff (.din(tx_on),.clk(tx_clk),.qout(tx_on_reg));
   RegDff   #(1) tx_on_half_RegDff (.din(tx_on_half),.clk(tx_clk),.qout(tx_on_half_reg));
   RegDff   #(1) replace_txd_time_RegDff (.din(replace_txd_time),.clk(tx_clk),.qout(replace_txd_time_reg));
   RegDff   #(3) adjust2crc_full_case_last_byte_position_RegDff (.din(adjust2crc_full_case_last_byte_position),.clk(tx_clk),.qout(adjust2crc_full_case_last_byte_position_reg[2:0]));
   RegDff   #(1) adjust2crc_full_case_last_byte_position_is_3_or_7_RegDff (.din(adjust2crc_full_case_last_byte_position_is_3_or_7),.clk(tx_clk),.qout(adjust2crc_full_case_last_byte_position_is_3_or_7_reg));
   RegDff   #(8) stretch_clks_RegDff (.din(stretch_clks),.clk(tx_clk),.qout(stretch_clks_reg));
   RegDff   #(3) full_case_last_byte_position_RegDff (.din(full_case_last_byte_position),.clk(tx_clk),.qout(full_case_last_byte_position_reg));
   RegDff   #(4) stretch_full_case_last_byte_position_RegDff (.din(stretch_full_case_last_byte_position),.clk(tx_clk),.qout(stretch_full_case_last_byte_position_reg));
   RegDff   #(3) stretch_bytes_RegDff (.din(stretch_bytes),.clk(tx_clk),.qout(stretch_bytes_reg));
   RegDff   #(1) minus_4bytes_RegDff (.din(minus_4bytes),.clk(tx_clk),.qout(minus_4bytes_reg));
   RegDff   #(1) B_eop_RegDff (.din(B_eop),.clk(tx_clk),.qout(B_eop_reg));
   RegDff   #(1) stretch_1_more_clk_RegDff (.din(stretch_1_more_clk),.clk(tx_clk),.qout(stretch_1_more_clk_reg));
   RegDff   #(1) no_wasted_BW_RegDff (.din(no_wasted_BW),.clk(tx_clk),.qout(no_wasted_BW_reg));
   RegDff   #(1) ipg_done_trail_temp_RegDff (.din(ipg_done_trail_temp),.clk(tx_clk),.qout(ipg_done_trail_temp_reg));
   RegDff   #(1) restart_ipg_timer_RegDff (.din(restart_ipg_timer),.clk(tx_clk),.qout(restart_ipg_timer_reg));
   RegDff   #(1) ipg_done_RegDff (.din(ipg_done),.clk(tx_clk),.qout(ipg_done_reg));
   RegDff   #(1) ipg_done_lead_temp_RegDff (.din(ipg_done_lead_temp),.clk(tx_clk),.qout(ipg_done_lead_temp_reg));
   RegDff   #(1) force_ipg_done_lead_RegDff (.din(force_ipg_done_lead),.clk(tx_clk),.qout(force_ipg_done_lead_reg));
   RegDff   #(1) set_back2back_RegDff (.din(set_back2back),.clk(tx_clk),.qout(set_back2back_reg));
   RegDff   #(1) back2back_RegDff (.din(back2back),.clk(tx_clk),.qout(back2back_reg));


   
endmodule // tx_xmac

