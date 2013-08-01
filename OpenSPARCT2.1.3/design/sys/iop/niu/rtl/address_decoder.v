// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: address_decoder.v
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
 * File Name    : address_decoder.v
 * Author Name  : John Lo
 * Description  : decode incoming DA, flow control frame, bcast,mcast.
 * Parent Module: rx_xmac
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

module address_decoder(
  rx_clk,
  rx_reset,
  eop,
  bad_pkt_bit,
  promisc_all,       // control enable
  promisc_group,     // control enable
  reserve_multicast, // control enable
  rx_pause_en,       // control enable
  rx_data_64bit_reg0_gmux,
  rx_data_valid_gmux_lead,
  mac_unique_addr,
  // start of ALT_ADDR_AND_HASH_FUNC specific signals
  new_crc5_result,
  addr_filter_en,
  hash_filter_en,
  alt_addr_comp_en,
  mac_alt_addr0,
  mac_alt_addr1,
  mac_alt_addr2,
  mac_alt_addr3,
  mac_alt_addr4,
  mac_alt_addr5,
  mac_alt_addr6,
  mac_alt_addr7,
  mac_alt_addr8,
  mac_alt_addr9,
  mac_alt_addr10,
  mac_alt_addr11,
  mac_alt_addr12,
  mac_alt_addr13,
  mac_alt_addr14,
  mac_alt_addr15,
  addr_filter,
  addr_filter_mask_msb,
  addr_filter_mask_lsb,
  hash_table,
  mac_host_info0 ,
  mac_host_info1 ,
  mac_host_info2 ,
  mac_host_info3 ,
  mac_host_info4 ,
  mac_host_info5 ,
  mac_host_info6 ,
  mac_host_info7 ,
  mac_host_info8 ,
  mac_host_info9 ,
  mac_host_info10,
  mac_host_info11,
  mac_host_info12,
  mac_host_info13,
  mac_host_info14,
  mac_host_info15,
  mac_host_info16,
  mac_host_info17,
  mac_host_info18,
  mac_host_info19,
  rx_ok,
// output signals   
  alt_addr_filter_value,
  hash_hit_match,
  hash_value,
  mac_ctrl_word,
  mac_ctrl_word_wr_en,
  // end of ALT_ADDR_AND_HASH_FUNC specific signals
  rx_fc_pkt,
  rx_fc_pkt_ok,
  pause_time,
  da_match,
  da_match_err,
  mac_own_da_match,
  inc_bcast_count, // ***** signal crossing different clk
  inc_mcast_count  // ***** signal crossing different clk
);
   
   input              rx_clk;
   input 	      rx_reset;
   input 	      eop;
   input 	      bad_pkt_bit;
   input 	      promisc_all;       // control enable
   input 	      promisc_group;     // control enable
   input 	      reserve_multicast; // control enable
   input 	      rx_pause_en;       // control enable
   input [63:0]	      rx_data_64bit_reg0_gmux;
   input 	      rx_data_valid_gmux_lead;
   input [47:0]       mac_unique_addr;
   // start of ALT_ADDR_AND_HASH_FUNC specific signals
   input [15:0]       new_crc5_result;
   input 	      addr_filter_en;
   input 	      hash_filter_en;
   input [15:0]       alt_addr_comp_en;
   input [47:0]       mac_alt_addr0;
   input [47:0]       mac_alt_addr1;
   input [47:0]       mac_alt_addr2;
   input [47:0]       mac_alt_addr3;
   input [47:0]       mac_alt_addr4;
   input [47:0]       mac_alt_addr5;
   input [47:0]       mac_alt_addr6;
   input [47:0]       mac_alt_addr7;
   input [47:0]       mac_alt_addr8;
   input [47:0]       mac_alt_addr9;
   input [47:0]       mac_alt_addr10;
   input [47:0]       mac_alt_addr11;
   input [47:0]       mac_alt_addr12;
   input [47:0]       mac_alt_addr13;
   input [47:0]       mac_alt_addr14;
   input [47:0]       mac_alt_addr15;
   input [47:0]       addr_filter;
   input [7:0] 	      addr_filter_mask_msb;
   input [15:0]       addr_filter_mask_lsb;
   input [255:0]      hash_table;
   input [`H_INFO]    mac_host_info0 ;
   input [`H_INFO]    mac_host_info1 ;
   input [`H_INFO]    mac_host_info2 ;
   input [`H_INFO]    mac_host_info3 ;
   input [`H_INFO]    mac_host_info4 ;
   input [`H_INFO]    mac_host_info5 ;
   input [`H_INFO]    mac_host_info6 ;
   input [`H_INFO]    mac_host_info7 ;
   input [`H_INFO]    mac_host_info8 ;
   input [`H_INFO]    mac_host_info9 ;
   input [`H_INFO]    mac_host_info10;
   input [`H_INFO]    mac_host_info11;
   input [`H_INFO]    mac_host_info12;
   input [`H_INFO]    mac_host_info13;
   input [`H_INFO]    mac_host_info14;
   input [`H_INFO]    mac_host_info15;
   input [`H_INFO]    mac_host_info16;
   input [`H_INFO]    mac_host_info17;
   input [`H_INFO]    mac_host_info18;
   input [`H_INFO]    mac_host_info19;
   input 	      rx_ok;
// output signals   
   output [6:0]       alt_addr_filter_value;
   output 	      hash_hit_match;
   output [15:0]      hash_value;
   output [`MAC_CTRL] mac_ctrl_word;
   output 	      mac_ctrl_word_wr_en;
   // end of ALT_ADDR_AND_HASH_FUNC specific signals
   output 	      rx_fc_pkt;
   output 	      rx_fc_pkt_ok;
   output [15:0]      pause_time;
   output 	      da_match;
   output 	      da_match_err;
   output 	      mac_own_da_match;
   output 	      inc_bcast_count; // * signal crossing different clk
   output   	      inc_mcast_count; // * signal crossing different clk
   
   wire [7:0] 	   rx_byte0  = rx_data_64bit_reg0_gmux[`BYTE0];
   wire [7:0] 	   rx_byte1  = rx_data_64bit_reg0_gmux[`BYTE1];
   wire [7:0] 	   rx_byte2  = rx_data_64bit_reg0_gmux[`BYTE2];
   wire [7:0] 	   rx_byte3  = rx_data_64bit_reg0_gmux[`BYTE3];
   wire [7:0] 	   rx_byte4  = rx_data_64bit_reg0_gmux[`BYTE4];
   wire [7:0] 	   rx_byte5  = rx_data_64bit_reg0_gmux[`BYTE5];
   wire [7:0] 	   rx_byte6  = rx_data_64bit_reg0_gmux[`BYTE6];
   wire [7:0] 	   rx_byte7  = rx_data_64bit_reg0_gmux[`BYTE7];

   wire          set_mac_reserve_multicast_match,
                     mac_reserve_multicast_match,
                 set_mac_own_da_match,
                     mac_own_da_match,
                 set_addr_filter_match,
                     addr_filter_match,
		 set_all_mac_alt_addr_match,
		     all_mac_alt_addr_match,
		 set_hash_hit_match,
		     hash_hit_match,
                 set_mac_fc_match,
                     mac_fc_match, 
                 set_rx_fc_pkt,
                     promisc_all_match,
                 set_grp_match,
                     grp_match,
                 promisc_grp_match,
                 set_bcast_match,
                     bcast_match;
   wire 	 d_rx_data_valid_gmux_lead,type_mac_control,opcode_pause;
   wire 	 rx_reset_counters = rx_reset | eop;
   wire 	 rx_1st_word_time  =   rx_data_valid_gmux_lead;
   wire 	 rx_2nd_word_time  = d_rx_data_valid_gmux_lead;
   wire 	 load_pause_time;
// vlint flag_net_has_no_load            off
// vlint flag_dangling_net_within_module off
   wire 	 load_pause_time_trail;
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load            on
   
/**************************************************************************
 * Start of NIC selectable logic signals
 * ************************************************************************/
/**************************************************************************
 * end of NIC selectable logic signals
 * ************************************************************************/

   FD1  d_rx_data_valid_gmux_lead_FD1 (.D(rx_data_valid_gmux_lead),
                                       .CP(rx_clk),
                                       .Q(d_rx_data_valid_gmux_lead));
   
/* -------------------- promiscuous all match ------------------------- */  
 
   FD1  promisc_all_match_FF1(.D(promisc_all),.CP(rx_clk),
                              .Q(promisc_all_match)); // a level
   
/* -------------------- promiscuous group match ----------------------- */  
   // I/G bit: 1st byte, bit 0. if (I/G = 1) then GROUP else INIDIVIDUAL

          // a pulse
   assign set_grp_match = rx_1st_word_time & rx_byte0[0];
   RS_FF grp_match_RS_FF (.set(set_grp_match),.rst(1'b0),
                  .clk(rx_clk),.reset(rx_reset_counters),.qout(grp_match));

   assign promisc_grp_match = promisc_group & grp_match; // a level
 
/* -------------------- broadcast match ------------------------------- */ 
          // a pulse
   assign set_bcast_match =  rx_1st_word_time & 
          (rx_byte0 == 8'hFF) & 
          (rx_byte1 == 8'hFF) & 
          (rx_byte2 == 8'hFF) & 
          (rx_byte3 == 8'hFF) & 
          (rx_byte4 == 8'hFF) & 
          (rx_byte5 == 8'hFF) ;
   RS_FF bcast_match_RS_FF (.set(set_bcast_match),.rst(1'b0),
            .clk(rx_clk),.reset(rx_reset_counters),.qout(bcast_match));

/* -------------------- own da match ---------------------------------- */  
          // a pulse
   assign set_mac_own_da_match = rx_1st_word_time &  
          (rx_byte0 == mac_unique_addr[`BYTE1]) &    // a
          (rx_byte1 == mac_unique_addr[`BYTE0]) &    // b
          (rx_byte2 == mac_unique_addr[`BYTE3]) &    // c
          (rx_byte3 == mac_unique_addr[`BYTE2]) &    // d
	  (rx_byte4 == mac_unique_addr[`BYTE5]) &    // e
	  (rx_byte5 == mac_unique_addr[`BYTE4]) ;    // f
   
   RS_FF mac_own_da_match_RS_FF (.set(set_mac_own_da_match),.rst(1'b0),
        .clk(rx_clk),.reset(rx_reset_counters),.qout(mac_own_da_match));

/* -------------------- flow control frame match ---------------------- */
          // 01-80-C2-00-00-01 is  the globally-assigned 48 bit multicast
          // address for used in Mac Control Pause frames for inhibiting
          // transmission of data from a DTE in a full-duplex mode LAN.
          // Refer to IEEE Std 802.3x & 802.3y Annex31B, pp-300.
          // This signal is a pulse.
   assign set_mac_fc_match =   rx_1st_word_time &  // a pulse
          (rx_byte0 == 8'h01) &
          (rx_byte1 == 8'h80) &
          (rx_byte2 == 8'hC2) &
          (rx_byte3 == 8'h00) &
          (rx_byte4 == 8'h00) &
	  (rx_byte5 == 8'h01) ;

   // fc_match is available at rx_2nd_word_time
   RS_FF mac_fc_match_RS_FF (.set(set_mac_fc_match),.rst(1'b0),
        .clk(rx_clk),.reset(rx_reset_counters),.qout(mac_fc_match));
   //
   assign type_mac_control =  ({rx_byte4,rx_byte5} == 16'h8808);
   assign opcode_pause     =  ({rx_byte6,rx_byte7} == 16'h0001);

   // set_rx_fc_pk is valid at rx_2nd_word_time.  It is a pulse.
   assign set_rx_fc_pkt = rx_2nd_word_time & rx_pause_en &
	  mac_fc_match & type_mac_control & opcode_pause;
   
   // rx_fc_pkt is valid at rx_3rd_word_time.  It is a level.
   RS_FF rx_fc_pkt_RS_FF (.set(set_rx_fc_pkt),.rst(1'b0),
        .clk(rx_clk),.reset(rx_reset_counters),.qout(rx_fc_pkt));

   // load pause_time at rx_3rd_word_time
   // Request TxMac to load pause_time, only after eop.
PlsGen2 load_pause_time_PlsGen2(.sig_in(rx_fc_pkt),.clk(rx_clk),
                    .lead(load_pause_time),.trail(load_pause_time_trail));

   assign rx_fc_pkt_ok = eop & rx_fc_pkt & ~bad_pkt_bit;
   
   // pause_time is valid at   rx_4th_word_time.  It is a level.
register_load_X16 pause_time_register_load_X16(.clk(rx_clk),
                  .load(load_pause_time),   // load data @ rx_3rd_word_time
                  .din({rx_byte0,rx_byte1}),// rx_3rd_word_time data.
                  .dout(pause_time));       // available at rx_4th_word_time
   
/* -------------------- reserve multicast frames ---------------------- */
         // a pulse     
   assign set_mac_reserve_multicast_match =  rx_1st_word_time & 
                                             reserve_multicast &  
          (rx_byte0 == mac_unique_addr[15:08]) & 
          (rx_byte1 == mac_unique_addr[07:00]) & 
          (rx_byte2 == mac_unique_addr[31:24]) & 
          (rx_byte3 == mac_unique_addr[23:16]) & 
          (rx_byte4 == mac_unique_addr[47:40]) & 
          (rx_byte5[7:4] == mac_unique_addr[39:36]); // skip big [35:32]

  RS_FF mac_reserve_match_RS_FF (.set(set_mac_reserve_multicast_match),
                                 .rst(1'b0),.clk(rx_clk),
                                 .reset(rx_reset_counters),
                                 .qout(mac_reserve_multicast_match));
   
/* -------------------- da_match, match conclusion -------------------- */
        // a level
 assign    da_match =          promisc_all_match           |      
                               promisc_grp_match           |
                               bcast_match                 |
                               mac_own_da_match            |
                               //  
	                       hash_hit_match              |
                               addr_filter_match           |
                               all_mac_alt_addr_match      | // new 64 hosts
                               //
                               mac_fc_match                |
                               mac_reserve_multicast_match; 

        // a pulse for xrlm_sm only
   wire da_match_pls =     (promisc_all_match              |
                           (promisc_group & set_grp_match) |
                            set_bcast_match                |
                            set_mac_own_da_match           |
                            //
			    set_hash_hit_match             |
                            set_addr_filter_match          |
                            set_all_mac_alt_addr_match     | // new 64 hosts
			    //
                            set_mac_fc_match               |
                            set_mac_reserve_multicast_match);

   
 assign    da_match_err = ~da_match_pls;

/* -------------------- RMON Support ---------------------------------- */
   assign inc_bcast_count =    set_bcast_match;
   assign inc_mcast_count =    set_grp_match & !set_bcast_match;
   
/**************************************************************************
 * start of ALT_ADDR_AND_HASH_FUNC selectable logic
 * ************************************************************************/
`ifdef ALT_ADDR_AND_HASH_FUNC
   wire          set_mac_alt_addr0_match,
                 set_mac_alt_addr1_match,
                 set_mac_alt_addr2_match,
                 set_mac_alt_addr3_match,
                 set_mac_alt_addr4_match,
                 set_mac_alt_addr5_match,
                 set_mac_alt_addr6_match,
                 set_mac_alt_addr7_match,
                 set_mac_alt_addr8_match,
                 set_mac_alt_addr9_match,
                 set_mac_alt_addr10_match,
                 set_mac_alt_addr11_match,
                 set_mac_alt_addr12_match,
                 set_mac_alt_addr13_match,
                 set_mac_alt_addr14_match,
                 set_mac_alt_addr15_match;
   
/* -------------------- hash multicast match -------------------------- */
   wire [7:0]  hash_key = {new_crc5_result[0],
                           new_crc5_result[1],
                           new_crc5_result[2],
                           new_crc5_result[3],
                           new_crc5_result[4],
                           new_crc5_result[5],
                           new_crc5_result[6],
		           new_crc5_result[7]};
   
   wire   hash_bit = hash_table[hash_key];
   
   assign set_hash_hit_match = hash_filter_en & 
                              (rx_1st_word_time & rx_byte0[0] & hash_bit);

   RS_FF hash_hit_match_RS_FF (.set(set_hash_hit_match),.rst(1'b0),
                .clk(rx_clk),.reset(rx_reset_counters),.qout(hash_hit_match));
   
 xREG #(16) hash_value_xREG(.din({new_crc5_result[0],
                                  new_crc5_result[1],
                                  new_crc5_result[2],
                                  new_crc5_result[3],
                                  new_crc5_result[4],
                                  new_crc5_result[5],
                                  new_crc5_result[6],
                                  new_crc5_result[7],
                                  new_crc5_result[8],
                                  new_crc5_result[9],
                                  new_crc5_result[10],
                                  new_crc5_result[11],
                                  new_crc5_result[12],
                                  new_crc5_result[13],
                                  new_crc5_result[14],
                                  new_crc5_result[15]}),
                           .clk(rx_clk),
                           .en(rx_1st_word_time),
                           .reset(rx_reset_counters),
                           .qout(hash_value[15:0]));  
                             	  
/* -------------------- addr filter match ---------------------------- */
          // a pulse
 assign set_addr_filter_match = rx_1st_word_time & addr_filter_en & (
  ((rx_byte0[`NIB1] == addr_filter[15:12]) | !addr_filter_mask_msb[7]) &
  ((rx_byte0[`NIB0] == addr_filter[11:8])  | !addr_filter_mask_msb[6]) |
								     
  ((rx_byte1[`NIB1] == addr_filter[7:4])   | !addr_filter_mask_msb[5]) &
  ((rx_byte1[`NIB0] == addr_filter[3:0])   | !addr_filter_mask_msb[4]) |
								     
  ((rx_byte2[`NIB1] == addr_filter[31:28]) | !addr_filter_mask_msb[3]) &
  ((rx_byte2[`NIB0] == addr_filter[27:24]) | !addr_filter_mask_msb[2]) |
								     
  ((rx_byte3[`NIB1] == addr_filter[23:20]) | !addr_filter_mask_msb[1]) &
  ((rx_byte3[`NIB0] == addr_filter[19:16]) | !addr_filter_mask_msb[0]) |
								     
  ((rx_byte4[7] == addr_filter[47]) | !addr_filter_mask_lsb[15]) &
  ((rx_byte4[6] == addr_filter[46]) | !addr_filter_mask_lsb[14]) &
  ((rx_byte4[5] == addr_filter[45]) | !addr_filter_mask_lsb[13]) &
  ((rx_byte4[4] == addr_filter[44]) | !addr_filter_mask_lsb[12]) &
  ((rx_byte4[3] == addr_filter[43]) | !addr_filter_mask_lsb[11]) &
  ((rx_byte4[2] == addr_filter[42]) | !addr_filter_mask_lsb[10]) &
  ((rx_byte4[1] == addr_filter[41]) | !addr_filter_mask_lsb[9])  &
  ((rx_byte4[0] == addr_filter[40]) | !addr_filter_mask_lsb[8])  |

  ((rx_byte5[7] == addr_filter[39]) | !addr_filter_mask_lsb[7]) &
  ((rx_byte5[6] == addr_filter[38]) | !addr_filter_mask_lsb[6]) &
  ((rx_byte5[5] == addr_filter[37]) | !addr_filter_mask_lsb[5]) &
  ((rx_byte5[4] == addr_filter[36]) | !addr_filter_mask_lsb[4]) &
  ((rx_byte5[3] == addr_filter[35]) | !addr_filter_mask_lsb[3]) &
  ((rx_byte5[2] == addr_filter[34]) | !addr_filter_mask_lsb[2]) &
  ((rx_byte5[1] == addr_filter[33]) | !addr_filter_mask_lsb[1]) &
  ((rx_byte5[0] == addr_filter[32]) | !addr_filter_mask_lsb[0])  );
   
   RS_FF addr_filter_match_RS_FF (.set(set_addr_filter_match),.rst(1'b0),
         .clk(rx_clk),.reset(rx_reset_counters),.qout(addr_filter_match));
   
/* -------------------- mac alternative addr0 match ------------------- */
          // a pulse
   assign set_mac_alt_addr0_match = rx_1st_word_time & 
          alt_addr_comp_en[0] &
          (rx_byte0 == mac_alt_addr0[`BYTE1]) &    // a
          (rx_byte1 == mac_alt_addr0[`BYTE0]) &    // b
          (rx_byte2 == mac_alt_addr0[`BYTE3]) &    // c
          (rx_byte3 == mac_alt_addr0[`BYTE2]) &    // d
	  (rx_byte4 == mac_alt_addr0[`BYTE5]) &    // e
	  (rx_byte5 == mac_alt_addr0[`BYTE4]) ;    // f
   
/* -------------------- mac alternative addr1 match ------------------- */
          // a pulse
   assign set_mac_alt_addr1_match = rx_1st_word_time & 
          alt_addr_comp_en[1] &
          (rx_byte0 == mac_alt_addr1[`BYTE1]) &    // a
          (rx_byte1 == mac_alt_addr1[`BYTE0]) &    // b
          (rx_byte2 == mac_alt_addr1[`BYTE3]) &    // c
          (rx_byte3 == mac_alt_addr1[`BYTE2]) &    // d
	  (rx_byte4 == mac_alt_addr1[`BYTE5]) &    // e
	  (rx_byte5 == mac_alt_addr1[`BYTE4]) ;    // f
   
/* -------------------- mac alternative addr2 match ------------------- */
          // a pulse
   assign set_mac_alt_addr2_match = rx_1st_word_time & 
          alt_addr_comp_en[2] &
          (rx_byte0 == mac_alt_addr2[`BYTE1]) &    // a
          (rx_byte1 == mac_alt_addr2[`BYTE0]) &    // b
          (rx_byte2 == mac_alt_addr2[`BYTE3]) &    // c
          (rx_byte3 == mac_alt_addr2[`BYTE2]) &    // d
	  (rx_byte4 == mac_alt_addr2[`BYTE5]) &    // e
	  (rx_byte5 == mac_alt_addr2[`BYTE4]) ;    // f
   
/* -------------------- mac alternative addr3 match ------------------- */
          // a pulse
   assign set_mac_alt_addr3_match = rx_1st_word_time & 
          alt_addr_comp_en[3] &
          (rx_byte0 == mac_alt_addr3[`BYTE1]) &    // a
          (rx_byte1 == mac_alt_addr3[`BYTE0]) &    // b
          (rx_byte2 == mac_alt_addr3[`BYTE3]) &    // c
          (rx_byte3 == mac_alt_addr3[`BYTE2]) &    // d
	  (rx_byte4 == mac_alt_addr3[`BYTE5]) &    // e
	  (rx_byte5 == mac_alt_addr3[`BYTE4]) ;    // f
   
/* -------------------- mac alternative addr4 match ------------------- */
          // a pulse
   assign set_mac_alt_addr4_match = rx_1st_word_time & 
          alt_addr_comp_en[4] &
          (rx_byte0 == mac_alt_addr4[`BYTE1]) &    // a
          (rx_byte1 == mac_alt_addr4[`BYTE0]) &    // b
          (rx_byte2 == mac_alt_addr4[`BYTE3]) &    // c
          (rx_byte3 == mac_alt_addr4[`BYTE2]) &    // d
	  (rx_byte4 == mac_alt_addr4[`BYTE5]) &    // e
	  (rx_byte5 == mac_alt_addr4[`BYTE4]) ;    // f
   
/* -------------------- mac alternative addr5 match ------------------- */
          // a pulse
   assign set_mac_alt_addr5_match = rx_1st_word_time & 
          alt_addr_comp_en[5] &
          (rx_byte0 == mac_alt_addr5[`BYTE1]) &    // a
          (rx_byte1 == mac_alt_addr5[`BYTE0]) &    // b
          (rx_byte2 == mac_alt_addr5[`BYTE3]) &    // c
          (rx_byte3 == mac_alt_addr5[`BYTE2]) &    // d
	  (rx_byte4 == mac_alt_addr5[`BYTE5]) &    // e
	  (rx_byte5 == mac_alt_addr5[`BYTE4]) ;    // f
   
/* -------------------- mac alternative addr6 match ------------------- */
          // a pulse
   assign set_mac_alt_addr6_match = rx_1st_word_time & 
          alt_addr_comp_en[6] &
          (rx_byte0 == mac_alt_addr6[`BYTE1]) &    // a
          (rx_byte1 == mac_alt_addr6[`BYTE0]) &    // b
          (rx_byte2 == mac_alt_addr6[`BYTE3]) &    // c
          (rx_byte3 == mac_alt_addr6[`BYTE2]) &    // d
	  (rx_byte4 == mac_alt_addr6[`BYTE5]) &    // e
	  (rx_byte5 == mac_alt_addr6[`BYTE4]) ;    // f
   
/* -------------------- mac alternative addr7 match ------------------- */
          // a pulse
   assign set_mac_alt_addr7_match = rx_1st_word_time & 
          alt_addr_comp_en[7] &
          (rx_byte0 == mac_alt_addr7[`BYTE1]) &    // a
          (rx_byte1 == mac_alt_addr7[`BYTE0]) &    // b
          (rx_byte2 == mac_alt_addr7[`BYTE3]) &    // c
          (rx_byte3 == mac_alt_addr7[`BYTE2]) &    // d
	  (rx_byte4 == mac_alt_addr7[`BYTE5]) &    // e
	  (rx_byte5 == mac_alt_addr7[`BYTE4]) ;    // f
   
/* -------------------- mac alternative addr8 match ------------------- */
          // a pulse
   assign set_mac_alt_addr8_match = rx_1st_word_time & 
          alt_addr_comp_en[8] &
          (rx_byte0 == mac_alt_addr8[`BYTE1]) &    // a
          (rx_byte1 == mac_alt_addr8[`BYTE0]) &    // b
          (rx_byte2 == mac_alt_addr8[`BYTE3]) &    // c
          (rx_byte3 == mac_alt_addr8[`BYTE2]) &    // d
	  (rx_byte4 == mac_alt_addr8[`BYTE5]) &    // e
	  (rx_byte5 == mac_alt_addr8[`BYTE4]) ;    // f
   
/* -------------------- mac alternative addr9 match ------------------- */
          // a pulse
   assign set_mac_alt_addr9_match = rx_1st_word_time & 
          alt_addr_comp_en[9] &
          (rx_byte0 == mac_alt_addr9[`BYTE1]) &    // a
          (rx_byte1 == mac_alt_addr9[`BYTE0]) &    // b
          (rx_byte2 == mac_alt_addr9[`BYTE3]) &    // c
          (rx_byte3 == mac_alt_addr9[`BYTE2]) &    // d
	  (rx_byte4 == mac_alt_addr9[`BYTE5]) &    // e
	  (rx_byte5 == mac_alt_addr9[`BYTE4]) ;    // f
   
/* -------------------- mac alternative addr10 match ------------------ */
          // a pulse
   assign set_mac_alt_addr10_match = rx_1st_word_time & 
          alt_addr_comp_en[10] &
          (rx_byte0 == mac_alt_addr10[`BYTE1]) &    // a
          (rx_byte1 == mac_alt_addr10[`BYTE0]) &    // b
          (rx_byte2 == mac_alt_addr10[`BYTE3]) &    // c
          (rx_byte3 == mac_alt_addr10[`BYTE2]) &    // d
	  (rx_byte4 == mac_alt_addr10[`BYTE5]) &    // e
	  (rx_byte5 == mac_alt_addr10[`BYTE4]) ;    // f
   
/* -------------------- mac alternative addr11 match ------------------ */
          // a pulse
   assign set_mac_alt_addr11_match = rx_1st_word_time & 
          alt_addr_comp_en[11] &
          (rx_byte0 == mac_alt_addr11[`BYTE1]) &    // a
          (rx_byte1 == mac_alt_addr11[`BYTE0]) &    // b
          (rx_byte2 == mac_alt_addr11[`BYTE3]) &    // c
          (rx_byte3 == mac_alt_addr11[`BYTE2]) &    // d
	  (rx_byte4 == mac_alt_addr11[`BYTE5]) &    // e
	  (rx_byte5 == mac_alt_addr11[`BYTE4]) ;    // f
   
/* -------------------- mac alternative addr12 match ------------------ */
          // a pulse
   assign set_mac_alt_addr12_match = rx_1st_word_time & 
          alt_addr_comp_en[12] &
          (rx_byte0 == mac_alt_addr12[`BYTE1]) &    // a
          (rx_byte1 == mac_alt_addr12[`BYTE0]) &    // b
          (rx_byte2 == mac_alt_addr12[`BYTE3]) &    // c
          (rx_byte3 == mac_alt_addr12[`BYTE2]) &    // d
	  (rx_byte4 == mac_alt_addr12[`BYTE5]) &    // e
	  (rx_byte5 == mac_alt_addr12[`BYTE4]) ;    // f
   
/* -------------------- mac alternative addr13 match ------------------ */
          // a pulse
   assign set_mac_alt_addr13_match = rx_1st_word_time & 
          alt_addr_comp_en[13] &
          (rx_byte0 == mac_alt_addr13[`BYTE1]) &    // a
          (rx_byte1 == mac_alt_addr13[`BYTE0]) &    // b
          (rx_byte2 == mac_alt_addr13[`BYTE3]) &    // c
          (rx_byte3 == mac_alt_addr13[`BYTE2]) &    // d
	  (rx_byte4 == mac_alt_addr13[`BYTE5]) &    // e
	  (rx_byte5 == mac_alt_addr13[`BYTE4]) ;    // f
   
/* -------------------- mac alternative addr14 match ------------------ */
          // a pulse
   assign set_mac_alt_addr14_match = rx_1st_word_time & 
          alt_addr_comp_en[14] &
          (rx_byte0 == mac_alt_addr14[`BYTE1]) &    // a
          (rx_byte1 == mac_alt_addr14[`BYTE0]) &    // b
          (rx_byte2 == mac_alt_addr14[`BYTE3]) &    // c
          (rx_byte3 == mac_alt_addr14[`BYTE2]) &    // d
	  (rx_byte4 == mac_alt_addr14[`BYTE5]) &    // e
	  (rx_byte5 == mac_alt_addr14[`BYTE4]) ;    // f
   
/* -------------------- mac alternative addr15 match ------------------ */
          // a pulse
   assign set_mac_alt_addr15_match = rx_1st_word_time & 
          alt_addr_comp_en[15] &
          (rx_byte0 == mac_alt_addr15[`BYTE1]) &    // a
          (rx_byte1 == mac_alt_addr15[`BYTE0]) &    // b
          (rx_byte2 == mac_alt_addr15[`BYTE3]) &    // c
          (rx_byte3 == mac_alt_addr15[`BYTE2]) &    // d
	  (rx_byte4 == mac_alt_addr15[`BYTE5]) &    // e
	  (rx_byte5 == mac_alt_addr15[`BYTE4]) ;    // f
   

/* --------- conclusion of all 64 mac's alt address matches------------ */
 assign set_all_mac_alt_addr_match = set_mac_alt_addr0_match  |
                                     set_mac_alt_addr1_match  |
                                     set_mac_alt_addr2_match  |
                                     set_mac_alt_addr3_match  |
                                     set_mac_alt_addr4_match  |
                                     set_mac_alt_addr5_match  |
                                     set_mac_alt_addr6_match  |
                                     set_mac_alt_addr7_match  |
                                     set_mac_alt_addr8_match  |
                                     set_mac_alt_addr9_match  |
                                     set_mac_alt_addr10_match |
                                     set_mac_alt_addr11_match |
                                     set_mac_alt_addr12_match |
                                     set_mac_alt_addr13_match |
                                     set_mac_alt_addr14_match |
                                     set_mac_alt_addr15_match ;

   RS_FF all_mac_alt_addr_match_RS_FF (.set(set_all_mac_alt_addr_match),
                                       .rst(1'b0),
                                       .clk(rx_clk),
                                       .reset(rx_reset_counters),
                                       .qout(all_mac_alt_addr_match));

/* -------------------- mac address value generation ------------------ */
   wire   [6:0]   alt_addr_filter_value   = 0;


/* -------------------- mac control word generation --------------- */
   reg  [`MAC_CTRL] mac_info;
   wire [`MAC_CTRL] mac_ctrl_word;
   wire 	    p_hit = 1'b1;// p_hit == 1: perfect match | hash hit
                                 // p_hit == 0: non of above

always @ (/*AUTOSENSE*/mac_host_info0 or mac_host_info1
	  or mac_host_info10 or mac_host_info11 or mac_host_info12
	  or mac_host_info13 or mac_host_info14 or mac_host_info15
	  or mac_host_info16 or mac_host_info17 or mac_host_info18
	  or mac_host_info19 or mac_host_info2 or mac_host_info3
	  or mac_host_info4 or mac_host_info5 or mac_host_info6
	  or mac_host_info7 or mac_host_info8 or mac_host_info9
	  or p_hit or promisc_all or set_addr_filter_match
	  or set_hash_hit_match or set_mac_alt_addr0_match
	  or set_mac_alt_addr10_match or set_mac_alt_addr11_match
	  or set_mac_alt_addr12_match or set_mac_alt_addr13_match
	  or set_mac_alt_addr14_match or set_mac_alt_addr15_match
	  or set_mac_alt_addr1_match or set_mac_alt_addr2_match
	  or set_mac_alt_addr3_match or set_mac_alt_addr4_match
	  or set_mac_alt_addr5_match or set_mac_alt_addr6_match
	  or set_mac_alt_addr7_match or set_mac_alt_addr8_match
	  or set_mac_alt_addr9_match or set_mac_fc_match
	  or set_mac_own_da_match)
  begin
    if (set_mac_alt_addr0_match)
      mac_info = {mac_host_info0,p_hit,promisc_all}  ;
    else  if (set_mac_alt_addr1_match)
      mac_info = {mac_host_info1,p_hit,promisc_all}  ;
    else  if (set_mac_alt_addr2_match)
      mac_info = {mac_host_info2,p_hit,promisc_all}  ;
    else  if (set_mac_alt_addr3_match)
      mac_info = {mac_host_info3,p_hit,promisc_all}  ;
    else  if (set_mac_alt_addr4_match)
      mac_info = {mac_host_info4,p_hit,promisc_all}  ;
    else  if (set_mac_alt_addr5_match)
      mac_info = {mac_host_info5,p_hit,promisc_all}  ;
    else  if (set_mac_alt_addr6_match)
      mac_info = {mac_host_info6,p_hit,promisc_all}  ;
    else  if (set_mac_alt_addr7_match)
      mac_info = {mac_host_info7,p_hit,promisc_all}  ;
    else  if (set_mac_alt_addr8_match)
      mac_info = {mac_host_info8,p_hit,promisc_all}  ;
    else  if (set_mac_alt_addr9_match)
      mac_info = {mac_host_info9,p_hit,promisc_all}  ;
    else  if (set_mac_alt_addr10_match)
      mac_info = {mac_host_info10,p_hit,promisc_all} ;
    else  if (set_mac_alt_addr11_match)
      mac_info = {mac_host_info11,p_hit,promisc_all} ;
    else  if (set_mac_alt_addr12_match)
      mac_info = {mac_host_info12,p_hit,promisc_all} ;
    else  if (set_mac_alt_addr13_match)
      mac_info = {mac_host_info13,p_hit,promisc_all} ;
    else  if (set_mac_alt_addr14_match)
      mac_info = {mac_host_info14,p_hit,promisc_all} ;
    else  if (set_mac_alt_addr15_match)
      mac_info = {mac_host_info15,p_hit,promisc_all} ;
    else  if (set_hash_hit_match)// perfect match has higher pri over hash hit.
      mac_info = {mac_host_info16,p_hit,promisc_all} ;
    else  if (set_mac_own_da_match) // station unique address
      mac_info = {mac_host_info17,p_hit,promisc_all} ;
    else  if (set_addr_filter_match)
      mac_info = {mac_host_info18,p_hit,promisc_all} ;
    else  if (set_mac_fc_match)
      mac_info = {mac_host_info19,p_hit,promisc_all} ;
    else 
        // no perfet hit or hash hit. 
        // This condition will happen only when 
        // promiscuous all, promiscuous group, broadcast packets.
      mac_info = {mac_host_info16,1'b0,promisc_all} ; 
  end
  
  // The following reason for registering mac_info:
  // 1. mac_info should be written ONLY when mac_alt_addr is a match or
  //    the packet will be filterred out in the first place. The packet
  //    won't even be written to packet fifo (rxfifo).
  // 2. mac_info aligned with set_all_mac_alt_addr_match. This is a pre
  //    registration of mac_info right before written to srfifo.
  //
  //    mac_info[`MAC_CTRL]      <- set_all_mac_alt_addr_match  
  //
  //       |                              |        <- register
  //       v                              v
  //
  //    mac_ctrl_word[`MAC_CTRL] <- mac_ctrl_word_wr_en
  //
  // 3. mac_ctrl_word has to line up with the first word (64bit) to be 
  //    written to rxfifo.
  // 4. to compensate the mac_ctrl_word delay and to align with
  //    eop time (reg1 time).

 xREG #(`MAC_CTRL_WIDTH) mac_ctrl_word_xREG(.din(mac_info),
                           .clk(rx_clk),
                           .en(rx_ok),
                           .reset(rx_reset),
                           .qout(mac_ctrl_word)); 
 // rx_ok is from xrlm_sm. It is a pulse. It is valid at rx_1st_word_time. 
 FD1 mac_ctrl_word_wr_en_FD1 (.D(rx_ok),
                              .CP(rx_clk),
                              .Q(mac_ctrl_word_wr_en)); // rx_2nd_word_time
   
   
`else // !ifdef ALT_ADDR_AND_HASH_FUNC
   wire          hash_hit_match          = 0;
   wire [15:0]   hash_value              = 0;
   wire [6:0]    alt_addr_filter_value   = 0;
`endif // !ifdef ALT_ADDR_AND_HASH_FUNC

/**************************************************************************
 * end of ALT_ADDR_AND_HASH_FUNC selectable logic
 * ************************************************************************/
   
endmodule // address_decoder

