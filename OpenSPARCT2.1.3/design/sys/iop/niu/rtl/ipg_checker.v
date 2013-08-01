// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ipg_checker.v
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
 * File Name    : ipg_checker.v
 * Author Name  : John Lo
 * Description  : For checking variable ipg.
 * Parent Module: xmac
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 3/24/04
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * 
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 ******************************************************************/

`include  "xmac.h"

module ipg_checker (
       tx_clk,
       tx_reset,
       xgmii_txc,
       xgmii_txd,
       var_min_ipg_en,
       add_crc,
       eop_txclk,
       B_eop,
       stretch_mode,
       warning_msg_en
		 );
   input           tx_clk;
   input           tx_reset;
   input [3:0]     xgmii_txc;
   input [31:0]    xgmii_txd;
   input 	   var_min_ipg_en;
   input 	   add_crc;
   input 	   eop_txclk;
   input 	   B_eop;
   input 	   stretch_mode;
   input 	   warning_msg_en;

   wire 	   dly1_tx_clk;
   wire 	   dly2_tx_clk;
   wire 	   x2_tx_clk;
   wire 	   x2_tx_reset;
   wire 	   ipg_count_en_temp;
   wire 	   ipg_count_en;
   wire 	   T_det;
   wire 	   S_det;
   wire		   store_ipg_time;
   reg  	   check_ipg_time;
   reg [`BYTE] 	   ipg_count;
   reg [`BYTE] 	   ipg_net_credit;
   reg [`BYTE] 	   stored_ipg_count;
   reg  [3:0]      itxc;
   reg  [31:0]     itxd;
   
  
   
   SYNC_CELL SYNC_X2_TX_RESET(.D(tx_reset),.CP(x2_tx_clk),.Q(x2_tx_reset));
   assign #1 	   dly1_tx_clk = tx_clk;
   assign #1 	   dly2_tx_clk = dly1_tx_clk;
   assign 	   x2_tx_clk   = dly1_tx_clk ^ dly2_tx_clk;
   
   always @ (posedge x2_tx_clk)
     if (x2_tx_reset)
       begin
	  itxc <= 0;
	  itxd <= 0;
       end // if (!tx_reset_n)
     else
       begin
	  itxc <= xgmii_txc;
	  itxd <= xgmii_txd;
       end

   assign  T_det =
           itxc[0] & (itxd[`BYTE0] == `T) |  // lane0
           itxc[1] & (itxd[`BYTE1] == `T) |  // lane1
           itxc[2] & (itxd[`BYTE2] == `T) |  // lane2
           itxc[3] & (itxd[`BYTE3] == `T) ;  // lane3
   
   assign  S_det = itxc[0] &  (itxd[`BYTE0] == `S); // lane0
 

RSFF ipg_count_en_RSFF(.reset(x2_tx_reset),
                       .clk( x2_tx_clk),
                       .iSet(T_det),
                       .iRst(S_det),
                       .oQ(ipg_count_en_temp));

assign  ipg_count_en = (ipg_count_en_temp | T_det) & (~S_det);

PlsGen2 store_ipg_time_PlsGen2(
                 .sig_in(ipg_count_en),
                 .clk(x2_tx_clk),
                 .lead(),.trail(store_ipg_time));

   wire [`BYTE] itxc_bit0 = {7'b0,itxc[0]};
   wire [`BYTE] itxc_bit1 = {7'b0,itxc[1]};
   wire [`BYTE] itxc_bit2 = {7'b0,itxc[2]};
   wire [`BYTE] itxc_bit3 = {7'b0,itxc[3]};
   
   wire [`BYTE] itxc_count = itxc_bit0 + itxc_bit1 + itxc_bit2 + itxc_bit3;

always @ (posedge x2_tx_clk)
  check_ipg_time <= store_ipg_time;

   
always @  (posedge x2_tx_clk)
  if (x2_tx_reset | store_ipg_time)
    ipg_count <= 0;
  else if (ipg_count_en)
    ipg_count <= itxc_count + ipg_count;
  else
    ipg_count <= ipg_count;

always @ (posedge x2_tx_clk)
    if (x2_tx_reset)
      stored_ipg_count <= 0;
    else if (store_ipg_time)
      stored_ipg_count <= ipg_count;
    else
      stored_ipg_count <= stored_ipg_count;

always @ (posedge x2_tx_clk)
  if (x2_tx_reset)
          ipg_net_credit <= `CREDIT_BIAS;
  else if (store_ipg_time)
    begin
       if (ipg_count >= `CREDIT_BIAS)
          ipg_net_credit <= ipg_net_credit + (ipg_count - `CREDIT_BIAS);
       else 
          ipg_net_credit <= ipg_net_credit - (`CREDIT_BIAS - ipg_count);
    end
  else    ipg_net_credit <= ipg_net_credit;

   wire stored_add_crc;
   wire stored_B_eop;

xREG #(1) stored_add_crc_xREG(.din(add_crc),
                         .clk(x2_tx_clk),
                         .en(eop_txclk),
                         .reset(x2_tx_reset),
                         .qout(stored_add_crc));
   
xREG #(1) stored_B_eop_xREG(.din(B_eop),
                         .clk(x2_tx_clk),
                         .en(eop_txclk),
                         .reset(x2_tx_reset),
                         .qout(stored_B_eop));
   
always @ (negedge check_ipg_time) // LAN mode only
  begin
     if (warning_msg_en & (~x2_tx_reset) & var_min_ipg_en & (~stretch_mode) &
        ((stored_ipg_count < 9) | (stored_ipg_count > 15)))
        $display(" \n(* ERROR:  at sim time = %d, from ipg_checker module, the ipg_checker has detected incorrect ipg value, stored_ipg_count = %d *)", $time, stored_ipg_count);
     else ;
  end

   
always @ (negedge check_ipg_time)
  begin
     if (warning_msg_en & ~x2_tx_reset)
       begin
	  if (stretch_mode) // WAN mode
            $display("\n (* WARNING: from ipg_checker module, stored_ipg_count = %d, stored_add_crc = %h, stored_B_eop = %h, at sim time = %d,  *)", stored_ipg_count,stored_add_crc, stored_B_eop, $time);
	  else // LAN mode
            $display("\n (* WARNING: from ipg_checker module, stored_ipg_count = %d, ipg_net_credit = %d, stored_add_crc = %h, stored_B_eop = %h, at sim time = %d,  *)", stored_ipg_count, ipg_net_credit, stored_add_crc, stored_B_eop, $time);
       end
     else ;
  end

endmodule // ipg_checker

