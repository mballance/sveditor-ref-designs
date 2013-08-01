// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lfs_sm.v
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
 * File Name    : lfs_sm.v
 * Author Name  : John Lo
 * Description  : link fault signaling state machine.
 * Parent Module: lfs
 * Child  Module: 
 * Interface Mod:
 * Date Created : 7/24/01
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

module lfs_sm (
rx_clk,
rx_reset,
lfs_disable_rxclk,
fault_sequence,
col_cnt_limit,
diff_seq_type,
seq_cnt_less_3,
rst_col_cnt,
rst_seq_cnt,
link_fault,
col_cnt_en,
load_fault_type,
lfs_state       // dynamic signal
	       );
   input        rx_clk;
   input        rx_reset;
   input 	lfs_disable_rxclk;
   input 	fault_sequence;
   input 	col_cnt_limit;
   input 	diff_seq_type;
   input 	seq_cnt_less_3;
// outputs
   output 	rst_col_cnt;
   output 	rst_seq_cnt;
   output 	link_fault;
   output 	col_cnt_en;
   output 	load_fault_type;
   output [1:0] lfs_state;       // dynamic signal
    
// internal signals
   reg 	[1:0]   nx_lfs_state;
   reg 		rst_col_cnt;
   reg 		rst_seq_cnt;
   reg 		load_fault_type;
   wire 	link_fault;

/* ----------------------- lfs_sm -------------------------------------- */
/* 1. to tx_xmac to generate idle (if rf is detected) or RF if (lf is
 *    detected. 
 * 2. xmac_slv to generate status bit for interrupt gen.
 * 3. to bring xrlm_sm and sop_sm to initial state.
 * 4. "link fault" can happen any time.  It should generate a crc error 
 *    if it happened in the middle a packet. It resets sop_sm and xrlm_sm.
 *    It stops sending data to rx_xmac by reseting sop_sm.  It goes to
 *    tx_xmac to generate RF if LF is detected and gnerates IDLE if RF is
 *    detected. 
 */

 parameter INIT          = 2'b00,
           COUNT         = 2'b01,
           FAULT         = 2'b10;
   
// com part
always @ (lfs_state or fault_sequence or 
          col_cnt_limit or diff_seq_type or seq_cnt_less_3 )
  begin
     nx_lfs_state   = INIT;
     rst_col_cnt    = 0;
     rst_seq_cnt    = 0;
     load_fault_type= 1;
    casex(lfs_state)  // synopsys parallel_case full_case
      INIT:
 	if (fault_sequence)
 	  begin
 	     nx_lfs_state   = COUNT;
 	  end
 	else 
          begin 
	     nx_lfs_state= lfs_state; // stay
             rst_col_cnt    = 1;
             rst_seq_cnt    = 1;
     	  end // else: !if(fault_sequence)

      COUNT:
        casex({fault_sequence,col_cnt_limit,diff_seq_type,seq_cnt_less_3})
          4'b00xx:  nx_lfs_state   = lfs_state; // stay to count ok window.
	  4'b01xx:  nx_lfs_state   = INIT;      // link ok
	  4'b1x00:begin
                    nx_lfs_state   = FAULT;     // same seq_type, >= 3
                    load_fault_type= 1;
	          end
	  4'b1x01:  nx_lfs_state   = lfs_state; // same seq_type, <  3, stay
	  4'b1x1x:  nx_lfs_state   = lfs_state; // diff seq_type, stay
	  default:begin
	            nx_lfs_state   = INIT;
		    // synopsys translate_off
                    $display("( ERROR: lfs_state in unknown (COUNT) state.)");
		    // synopsys translate_on
	          end // case: default
	endcase
      
      
      FAULT:
        casex ({fault_sequence,col_cnt_limit,diff_seq_type})
	  3'b00x:   nx_lfs_state   = lfs_state; // stay to count ok window.
	  3'b01x:   nx_lfs_state   = INIT;      // link ok
	  3'b1x0:   nx_lfs_state   = lfs_state; // stay
	  3'b1x1:   nx_lfs_state   = COUNT;
	  default:begin
	            nx_lfs_state   = INIT;
		    // synopsys translate_off
                    $display("( ERROR: lfs_state in unknown (FAULT) state.)");
		    // synopsys translate_on
	          end
	endcase

      default: 
	begin
 	     nx_lfs_state= INIT;
 	     // synopsys translate_off
             $display("( ERROR: lfs_state in unknown state.)");
	     // synopsys translate_on
	end 
    endcase // casex(lfs_state)
  end 
   

   // seq part
RegRst #(2) lfs_state_RegRst(.din(nx_lfs_state),
                              .clk(rx_clk),
                              .reset(rx_reset | lfs_disable_rxclk),
                              .qout(lfs_state));

   assign	link_fault = lfs_state == FAULT;
   assign 	col_cnt_en =  lfs_state != INIT;
   
endmodule // lfs_sm




/************************************************************************ 
 * col_cnt: A count of the number of columns received not containing 
 *          a fault_sequence. This counter incre-ments at RX_CLK rate
 *         (on both the rising and falling clock transitions) unless 
 *         reset.
 * 
 * fault_sequence:
 *         A new column received on RXC<3:0> and RXD<31:0> comprising a 
 *         Sequence ordered_set of four bytes and consisting of a 
 *         Sequence control character in lane 0 and a seq_type in 
 *         lanes 1, 2, and 3 indicating either Local Fault or
 *         Remote Fault.
 * 
 * last_seq_type:
 *         The seq_type of the previous Sequence ordered_set received
 *         Values:
 *            Local Fault; 0x00 in lane 1, 0x00 in lane 2, 0x01 in lane 3.
 *           Remote Fault; 0x00 in lane 1, 0x00 in lane 2, 0x02 in lane 3.
 * 
 * link_fault:
 *         An indicator of the fault status.
 *         Values: OK; No fault.
 *                 Local Fault; fault detected by the PHY.
 *                 Remote Fault; fault detection signaled by the remote 
 *                 RS.
 * 
 * rx_reset:
 *         Condition that is true until such time as the power supply for 
 *         the device that contains the RS has reached the operating 
 *         region.
 *         Values: FALSE: The device is completely powered and has not 
 *         been reset (default).
 *         TRUE: The device has not been completely powered or has been
 *               reset.
 * seq_cnt:
 *         A count of the number of received Sequence ordered_sets of 
 *         the same type.
 * 
 * seq_type:
 *         The value received in the current Sequence ordered_set
 *         Values: 
 *         Local Fault;  0x00 in lane 1, 0x00 in lane 2, 0x01 in lane 3.
 *         Remote Fault; 0x00 in lane 1, 0x00 in lane 2, 0x02 in lane 3.
 * 
 * 
 * The link fault signaling state machine specifies the RS monitoring 
 * of RXC<3:0> and RXD<31:0> for Sequence ordered_sets. The variable 
 * link_fault is set to indicate the value of a received Sequence
 * ordered_set when the following conditions have been met:
 * a) Four fault_sequences containing the same fault value have been
 *    received
 * b) Without receiving any fault_sequence within a period of 128 columns
 *    The variable link_fault is set to OK following any interval of 128
 *    columns not containing a Remote Fault or Local Fault Sequence
 *    ordered_set.
 * 
 ************************************************************************/



