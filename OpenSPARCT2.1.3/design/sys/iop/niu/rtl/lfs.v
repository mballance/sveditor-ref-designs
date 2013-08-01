// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lfs.v
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
 * File Name    : lfs.v
 * Author Name  : John Lo
 * Description  : link fault signaling state machine.
 *                seq_cnt and col_cnt are two independent counter/sensor 
 *                which are reset/controlled independently.  Their result
 *                values are used by lfs_sm for changing states.
 * Parent Module: rx_xmac
 * Child  Module: lfs_sm
 * Interface Mod:
 * Date Created : 7/30/01
 *
 * Copyright (c) 2003, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

`include  "xmac.h"

module lfs (
rx_clk,
rx_reset,
lfs_disable_rxclk,
rxc_a,
rxc_b,
rx_data_64bit_reg0,
// outputs		
link_fault,      // to rx_xmac only
inc_link_fault_count, // to xmac_sync.v
remote_fault_oc, // to xmac_slv. 
local_fault_oc,  // to xmac_slv.  
lfs_state        // dynamic signal
	    );

   input        rx_clk;
   input        rx_reset;
   input 	lfs_disable_rxclk;
   input [3:0]  rxc_a; 
   input [3:0]  rxc_b;
   input [63:0] rx_data_64bit_reg0;
// outputs
   output 	link_fault;      // to bothe xmac_sync then to xmac_slv
   output 	inc_link_fault_count; // to xmac_sync.v
   output 	remote_fault_oc; // to xtlm_sm, tx_xmac, xmac_slv via xmac_syn
   output 	local_fault_oc;  // to xtlm_sm, tx_xmac, xmac_slv via xmac_syn
   output [1:0] lfs_state;       // dynamic signal
                                                                           
// internal signals
   wire [63:0]  rx_data_64bit_reg0;
   wire [3:0] 	rxc_a_reg;
   wire [3:0] 	rxc_b_reg;
   wire 	col_cnt_en;
   wire 	rst_col_cnt;
   wire 	rst_seq_cnt;
   wire 	last_seq_type;
   // vlint flag_net_has_no_load            off
   // vlint flag_dangling_net_within_module off
   wire 	load_fault_type;
   wire 	diff_seq_type_in_col_ab;
   // vlint flag_dangling_net_within_module on
   // vlint flag_net_has_no_load            on

// post 1st silicon metal eco -loj @6-15-06
// Remove the following extra pipeline. 
//   RegDff #(4)  rxc_a_reg_RegDff (.din(rxc_a),.clk(rx_clk),
//                                 .qout(rxc_a_reg)); 
//   RegDff #(4)  rxc_b_reg_RegDff (.din(rxc_b),.clk(rx_clk),
//                                 .qout(rxc_b_reg)); 
   assign 	rxc_a_reg = rxc_a;
   assign 	rxc_b_reg = rxc_b;
   
// We need to use unconditioned (unfiltered) rxc signals.
// Can not use rx_dv_8bit_reg0 since it is conditioned by sop_sm.
// rxc_a and rxc_b are chosen since they are not conditioned by sop_sm.
 wire   local_fault_sequence_a =
        ( rxc_a_reg[0] & (rx_data_64bit_reg0[`BYTE0] ==  `SEQ)) &
        (~rxc_a_reg[1] & (rx_data_64bit_reg0[`BYTE1] == 8'h00)) &
        (~rxc_a_reg[2] & (rx_data_64bit_reg0[`BYTE2] == 8'h00)) &
	(~rxc_a_reg[3] & (rx_data_64bit_reg0[`BYTE3] == 8'h01)) ;

 wire   local_fault_sequence_b =
        ( rxc_b_reg[0] & (rx_data_64bit_reg0[`BYTE4] ==  `SEQ)) &
        (~rxc_b_reg[1] & (rx_data_64bit_reg0[`BYTE5] == 8'h00)) &
        (~rxc_b_reg[2] & (rx_data_64bit_reg0[`BYTE6] == 8'h00)) &
        (~rxc_b_reg[3] & (rx_data_64bit_reg0[`BYTE7] == 8'h01)) ;

 wire   local_fault_sequence = local_fault_sequence_a | 
                               local_fault_sequence_b;
   
 wire   remote_fault_sequence_a = 
        ( rxc_a_reg[0] & (rx_data_64bit_reg0[`BYTE0] ==  `SEQ)) &
        (~rxc_a_reg[1] & (rx_data_64bit_reg0[`BYTE1] == 8'h00)) &
        (~rxc_a_reg[2] & (rx_data_64bit_reg0[`BYTE2] == 8'h00)) &
	(~rxc_a_reg[3] & (rx_data_64bit_reg0[`BYTE3] == 8'h02)) ;

 wire   remote_fault_sequence_b =
        ( rxc_b_reg[0] & (rx_data_64bit_reg0[`BYTE4] ==  `SEQ)) &
        (~rxc_b_reg[1] & (rx_data_64bit_reg0[`BYTE5] == 8'h00)) &
        (~rxc_b_reg[2] & (rx_data_64bit_reg0[`BYTE6] == 8'h00)) &
        (~rxc_b_reg[3] & (rx_data_64bit_reg0[`BYTE7] == 8'h02)) ;
   
 wire remote_fault_sequence = remote_fault_sequence_a | 
                              remote_fault_sequence_b;

 wire fault_sequence  = local_fault_sequence | remote_fault_sequence;
 wire fault_col_a = local_fault_sequence_a | remote_fault_sequence_a;
 wire fault_col_b = local_fault_sequence_b | remote_fault_sequence_b;
 wire col_a_eq_0  = ~remote_fault_sequence_a & ~local_fault_sequence_a;
 wire col_b_eq_0  = ~remote_fault_sequence_b & ~local_fault_sequence_b;
   

/* ----------------------- seq_type logic ------------------------------ */
// seq_type : current sequence type   
// seq_type == 1 if local fault
// seq_type == 0 if remote fault

 wire remote_fault_oc = link_fault & ~last_seq_type;
 wire local_fault_oc  = link_fault &  last_seq_type;
   
 wire seq_type = (col_a_eq_0              & local_fault_sequence_b) |
                 (local_fault_sequence_a  & col_b_eq_0)             | 
                 (local_fault_sequence_a  & local_fault_sequence_b) | 
                 (remote_fault_sequence_a & local_fault_sequence_b);

// last_seq_type
 xREG #(1) last_seq_type_xREG (.din(seq_type),.clk(rx_clk),
            .en(fault_sequence),.reset(rx_reset),
            .qout(last_seq_type));
   
      
/* ----------------------- seq_cnt logic ------------------------------- */
/* seq_cnt:A count of the number of received Sequence ordered_sets of 
 *         the same type.
 */
 
 assign diff_seq_type_in_col_ab = ( local_fault_sequence_a & remote_fault_sequence_b) |
                      (remote_fault_sequence_a &  local_fault_sequence_b);

// eco @7-17-06
// wire diff_seq_type = (last_seq_type != seq_type) | diff_seq_type_in_col_ab;
wire diff_seq_type = fault_sequence & ((last_seq_type != seq_type) | diff_seq_type_in_col_ab);
//   wire diff_seq_type = 1'b0; // eco 7-19-06
//
   reg [2:0] seq_cnt;
always @ (posedge rx_clk)
  if (rx_reset | rst_seq_cnt | diff_seq_type)
    seq_cnt <=  0;
  else if (fault_sequence)
    seq_cnt <= seq_cnt + {2'b0,fault_col_a} + {2'b0,fault_col_b};
  else
    seq_cnt <= seq_cnt; // hold
//
   wire seq_cnt_less_3 = seq_cnt < 3;


/* ----------------------- col_cnt logic ------------------------------- */
/* col_cnt: A count of the number of columns received not containing 
 *          a fault_sequence. This counter increments at RX_CLK rate
 *         (on both the rising and falling clock transitions) unless 
 *         reset.
 */

   reg [7:0] col_cnt;
always @ (posedge rx_clk)
  if (rx_reset | rst_col_cnt | fault_sequence)
    col_cnt <=  0;
  else if (col_cnt_en)
    col_cnt <= col_cnt + 2;
  else
    col_cnt <= col_cnt; // keep

 wire col_cnt_limit = col_cnt[7];


 PlsGen PlsGen(.reset(rx_reset),.clk(rx_clk),.iSigIn(link_fault),
               .oPlsOut(inc_link_fault_count));

/* ----------------------- lfs_sm instantiation ------------------------ */
lfs_sm lfs_sm(
.rx_clk(rx_clk),
.rx_reset(rx_reset),
.lfs_disable_rxclk(lfs_disable_rxclk),
.fault_sequence(fault_sequence),
.col_cnt_limit(col_cnt_limit),
.diff_seq_type(diff_seq_type),
.seq_cnt_less_3(seq_cnt_less_3),
.rst_col_cnt(rst_col_cnt),          
.rst_seq_cnt(rst_seq_cnt),
.link_fault(link_fault),
.col_cnt_en(col_cnt_en),
.load_fault_type(load_fault_type),
.lfs_state(lfs_state)               // dynamic signal
);




endmodule // lfs

  
