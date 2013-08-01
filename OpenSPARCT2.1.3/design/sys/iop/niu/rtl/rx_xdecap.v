// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rx_xdecap.v
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
 * File Name    : rx_xdecap.v
 * Author Name  : John Lo
 * Description  : receive misllaneous logic
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

module rx_xdecap(
rx_clk,
rx_reset,
warning_msg_en,
strip_crc,
err_chk_dis,
pass_fc,
crc_error,
rxfifo_full_rxclk,
rxfifo_afull_rxclk,
rx_fc_pkt,
no_rx_min_pkt_size_chk,
rx_min_pkt_size,
max_pkt_size,
valid_data,
rx_dv,
rx_err,
rx_dv_8bit_reg0_gmux,
eop,
// start of ALT_ADDR_AND_HASH_FUNC specific signals
hash_hit_match,
hash_value,
mac_ctrl_word, 
mac_ctrl_word_wr_en,
// end of ALT_ADDR_AND_HASH_FUNC specific signals
// outputs
min_pkt_size_limit,
max_pkt_size_limit,
rx_good_pkt,
inc_code_viol_count,
inc_crc_err_count,
inc_min_pkt_err_count,
inc_max_pkt_err_count,
toggle_rx_bcount,
abort_bit,
bad_pkt_bit,
rx_byte_count,     // for observation.
mod_rx_byte_count, // for observation.
rx_status
		 );
   
   
   input              rx_clk;
   input 	      rx_reset;
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   // vlint flag_input_port_not_connected off
   input 	      warning_msg_en;
   // vlint flag_input_port_not_connected on
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on
   input 	      strip_crc;
   input 	      err_chk_dis;
   input 	      pass_fc;
   input 	      crc_error;
   input 	      rxfifo_full_rxclk;
   input 	      rxfifo_afull_rxclk;
   input 	      rx_fc_pkt;
   input 	      no_rx_min_pkt_size_chk;
   input [9:0] 	      rx_min_pkt_size;
   input [13:0]       max_pkt_size;
   input 	      valid_data;
   input 	      rx_dv;
   input 	      rx_err;
   input [7:0] 	      rx_dv_8bit_reg0_gmux;
   input              eop;
                      // start of ALT_ADDR_AND_HASH_FUNC specific signals
   input 	      hash_hit_match;
   input [5:0]        hash_value;
   input [`MAC_CTRL]  mac_ctrl_word; 
   input	      mac_ctrl_word_wr_en;
                      // end of ALT_ADDR_AND_HASH_FUNC specific signals
                      // outputs
   output 	      min_pkt_size_limit;
   output 	      max_pkt_size_limit;
   output 	      rx_good_pkt;
   output 	      inc_code_viol_count;
   output 	      inc_crc_err_count;
   output 	      inc_min_pkt_err_count;
   output 	      inc_max_pkt_err_count;
   output 	      toggle_rx_bcount;
   output 	      abort_bit;
   output 	      bad_pkt_bit;
   output [13:0]      rx_byte_count;
   output [13:0]      mod_rx_byte_count;
   output [`TBITS]    rx_status;
   
   wire [13:0] 	  rx_byte_count,mod_rx_byte_count;
   wire 	  crc_err,abort_bit,bad_pkt_bit;
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire [13:0] 	  nx_rx_byte_count;
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on
   
 /* ------------------------- rx_byte counter --------------------------- */
   
   wire reset_rx_byte_counter = rx_reset | eop;
   byte_counter rx_byte_counter(
                  .clk(rx_clk),
                  .reset(reset_rx_byte_counter),
		  .byte_count_en(valid_data),
                  .dv_en_8bit(rx_dv_8bit_reg0_gmux),
                  .byte_count(rx_byte_count),
                  .nx_byte_count(nx_rx_byte_count));

/**************************************************************************
 * error detection logic
 * ************************************************************************/

 /* ------------- min_pkt_size_err --- rlm_sm is not aware of it. use EOP */
   // min_pkt_size_limit should be a pulse. It is pulsed by eop at eop time.
   
   assign min_pkt_size_limit = ~no_rx_min_pkt_size_chk & eop & 
                               (rx_byte_count < {4'b0,rx_min_pkt_size});
   
 /* ------------- max_pkt_size_err --- rlm_sm knows it.------------------ */
   // max_pkt_size_limit will cause xrlm_sm to generate eop and 
   // valid_data = 0 which inturn will cause rx_dv == 0.  
   // Therefore max_pkt_size_limit itself should be a pulse.
   // Do NOT use "eop" to generate a pulse. It will cause a logic loop.
   // Max_pkt_size_limit is a PULSE.
   assign max_pkt_size_limit = (rx_byte_count > max_pkt_size) & 
                                rx_dv;
   
 /* ------------- rx_err -- xrlm_sm sees it instantly. ------------------ */
   // rx_err  = rxc_err; from rx_mac_xmii.v; generated by sfd_sm and is
   // delayed by 1 clock to match rx_data_64bit_reg0 and let rlm_sm sees it.
   
 /* --------------------------- Rx Status Word -------------------------- */

// assign rx_fc_pkt_ok = eop & rx_fc_pkt & ~bad_pkt_bit;// address_decoder.v
// rx_fc_pkt is a level signal
   
   assign abort_bit = !err_chk_dis & 
          (crc_err | rx_err | rxfifo_full_rxclk | rxfifo_afull_rxclk |
                       min_pkt_size_limit | max_pkt_size_limit)  |
                      (!pass_fc & rx_fc_pkt & eop);

   // crc is checked at eop time.
   assign crc_err = crc_error & eop;
   assign bad_pkt_bit = !min_pkt_size_limit & (crc_err | rx_err);

   // fcs modification
   assign mod_rx_byte_count = strip_crc ? (rx_byte_count - 4) : rx_byte_count;
   
   // total23b TIBTS:[22:0]
   wire [`TBITS] rx_status =  (mac_ctrl_word_wr_en & ~eop) ?
			      {3'b0,mac_ctrl_word[`MAC_CTRL]} // mac_ctrl_word: 20 bits
			       :
                              {hash_hit_match,  // 1b
                               hash_value[5:0], // 6b .Reged at 1st word time
                               abort_bit,bad_pkt_bit,mod_rx_byte_count} // 16b
                               ;
   
// synopsys translate_off
// diag    
always @ (negedge rx_clk)
  if ((~rx_reset) & (crc_err)  & !err_chk_dis & warning_msg_en)
    $display("\n (* ERROR:  at sim time = %d, at rxmac eop time, crc_err = %b  *) \n", $time, crc_err);
  else ;
// synopsys translate_on

 /* --------------------------------------------------------------------- */

 /* ------------------------ Frame Error Checking ----------------------- */
   // rx_err == rxc_err;
   // code violation is checked by sfd_sm and the result is delayed by one
   // clock to match rx_data_64bit_reg0 and to let xrlm_sm sees it.
   assign rx_good_pkt = eop & !max_pkt_size_limit & !min_pkt_size_limit &
	                      !crc_err & !rx_err;

   // loj @9-01-06 fixed (~rxfifo_afull_rxclk) metal eco with label MAC_RTL_3.5.
   // loj @9-05-06 fixed (~max_pkt_size_limit) metal eco with label MAC_RTL_3.6.
   // Truncated bad CRC should not increase crc_err_count.
   assign inc_crc_err_count     = crc_err            & !err_chk_dis & (~rxfifo_afull_rxclk) & (~max_pkt_size_limit);
   assign inc_code_viol_count   = rx_err             & !err_chk_dis;
   assign inc_min_pkt_err_count = min_pkt_size_limit & !err_chk_dis;
   assign inc_max_pkt_err_count = max_pkt_size_limit & !err_chk_dis;


 /* ------------------------------- RMON Support --------------------- */
//   wire [2:0] rx_bcount_prescaler;
//   
// counter_X3 RX_BCOUNT_PRESCALER_CNTR(rx_clk,
//                                     rx_reset,
//                                     rx_dv,
//                                     rx_bcount_prescaler);
// assign new_toggle_rx_bcount = rx_reset ? 1'b0 :
//           ((rx_bcount_prescaler == 3'h7) & rx_dv) ? 
//                             !toggle_rx_bcount : toggle_rx_bcount;
// FD1 INC_RX_BCNT_FF(.D(new_toggle_rx_bcount),.CP(rx_clk),.Q(toggle_rx_bcount));
//

// no need for prescaler. It is for 1G mac that count 1 byte a time.
TFF toggle_rx_bcount_TFF(.toggle(rx_dv),
                         .clk(rx_clk),
                         .reset(rx_reset),
                         .qout(toggle_rx_bcount));
   
 /* ------------------------------------------------------------------ */



endmodule // rx_xdecap


