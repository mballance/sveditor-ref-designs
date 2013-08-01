// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs_xgmii_dpath.v
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
/**********************************************************************/
/* Project Name  :  Vega                                              */
/* Module Name   :  xpcs_xgmii_dpath                                  */
/* Description   :                                                    */
/*                                                                    */
/* Assumptions   : none.                                              */
/*                                                                    */
/* Parent module : xpcs_xgmii_dpath.v                                 */
/* Child modules : none.                                              */
/* Author Name   : Carlos Castil                                      */
/* Date Created  :  8/17/03                                           */
/*                                                                    */
/*              Copyright (c) 2002, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */
/* Modifications :                                                    */
/**********************************************************************/

  

module xpcs_xgmii_dpath (

                         reset_txclk,
                         reset_rxclk,

                         tx_clk,      // 312 mhz tx clk

                         rbc0_a,

                         xpcs_rxd,  // outputs to XMAC receive
                         xpcs_rxc,

                         xpcs_txd,  // inputs from XMAC transmit
                         xpcs_txc,

                         // inputs from XPCS receive

                         rx_xgmii_byte_0,
                         rx_xgmii_byte_1,
                         rx_xgmii_byte_2,
                         rx_xgmii_byte_3,

                         rx_xgmii_special_0,
                         rx_xgmii_special_1,
                         rx_xgmii_special_2,
                         rx_xgmii_special_3,

                         // outputs to XPCS transmit

                         tx_xgmii_byte_0,
                         tx_xgmii_byte_1,
                         tx_xgmii_byte_2,
                         tx_xgmii_byte_3,

                         tx_xgmii_special_0,
                         tx_xgmii_special_1,
                         tx_xgmii_special_2,
                         tx_xgmii_special_3

                                          );

input           reset_txclk;
input           reset_rxclk;

input           tx_clk;      // 312 mhz tx clk
input           rbc0_a;
     
output [63:0]   xpcs_rxd;  // outputs to XMAC receive
output [7:0]    xpcs_rxc;
     
input [63:0]    xpcs_txd;  // inputs from XMAC transmit
input [7:0]     xpcs_txc;
     
               // inputs from XPCS receive
     
input [7:0]     rx_xgmii_byte_0;
input [7:0]     rx_xgmii_byte_1;
input [7:0]     rx_xgmii_byte_2;
input [7:0]     rx_xgmii_byte_3;
     
input           rx_xgmii_special_0;
input           rx_xgmii_special_1;
input           rx_xgmii_special_2;
input           rx_xgmii_special_3;
     
               // outputs to XPCS transmit
     
output [7:0]    tx_xgmii_byte_0;
output [7:0]    tx_xgmii_byte_1;
output [7:0]    tx_xgmii_byte_2;
output [7:0]    tx_xgmii_byte_3;

output          tx_xgmii_special_0;
output          tx_xgmii_special_1;
output          tx_xgmii_special_2;
output          tx_xgmii_special_3;

reg   [63:0]    xpcs_rxd;
reg             load_rx_word; 

reg   [7:0]     xpcs_rxc;

reg   [7:0]     tx_xgmii_byte_0;
reg   [7:0]     tx_xgmii_byte_1;
reg   [7:0]     tx_xgmii_byte_2;
reg   [7:0]     tx_xgmii_byte_3;

reg   [7:0]     shift_byte_0;
reg   [7:0]     shift_byte_1;
reg   [7:0]     shift_byte_2;
reg   [7:0]     shift_byte_3;
reg   [7:0]     shift_byte_4;
reg   [7:0]     shift_byte_5;
reg   [7:0]     shift_byte_6;
reg   [7:0]     shift_byte_7;

reg        tx_xgmii_special_0;
reg        tx_xgmii_special_1;
reg        tx_xgmii_special_2;
reg        tx_xgmii_special_3;

reg        shift_special_0;
reg        shift_special_1;
reg        shift_special_2;
reg        shift_special_3;
reg        shift_special_4;
reg        shift_special_5;
reg        shift_special_6;
reg        shift_special_7;

wire       det_sop;
wire       pulse_det_sop;
wire       load_tx_hi;

reg        det_sop_d;
reg        load_tx_hi_r;

// ***********************************************
// Double byte XGMII RX at 156 Mhz
// ***********************************************

always @ (posedge rbc0_a)
  if (reset_rxclk)
    begin
      shift_byte_0 <= 8'h00;
      shift_byte_1 <= 8'h00;
      shift_byte_2 <= 8'h00;
      shift_byte_3 <= 8'h00;
      shift_byte_4 <= 8'h00;
      shift_byte_5 <= 8'h00;
      shift_byte_6 <= 8'h00;
      shift_byte_7 <= 8'h00;
    end
  else 
    begin 
      shift_byte_4 <= rx_xgmii_byte_0;
      shift_byte_0 <= shift_byte_4;

      shift_byte_5 <= rx_xgmii_byte_1;
      shift_byte_1 <= shift_byte_5;

      shift_byte_6 <= rx_xgmii_byte_2;
      shift_byte_2 <= shift_byte_6;

      shift_byte_7 <= rx_xgmii_byte_3;
      shift_byte_3 <= shift_byte_7;
    end

always @ (posedge rbc0_a)
  if (reset_rxclk)
    begin
      shift_special_0 <= 1'b0;
      shift_special_1 <= 1'b0;
      shift_special_2 <= 1'b0;
      shift_special_3 <= 1'b0;
      shift_special_4 <= 1'b0;
      shift_special_5 <= 1'b0;
      shift_special_6 <= 1'b0;
      shift_special_7 <= 1'b0;
    end
  else
    begin
      shift_special_4 <= rx_xgmii_special_0;
      shift_special_0 <= shift_special_4;

      shift_special_5 <= rx_xgmii_special_1;
      shift_special_1 <= shift_special_5;

      shift_special_6 <= rx_xgmii_special_2;
      shift_special_2 <= shift_special_6;

      shift_special_7 <= rx_xgmii_special_3;
      shift_special_3 <= shift_special_7;
    end



always @ (posedge rbc0_a)
  if (reset_rxclk)
      xpcs_rxd <= 64'h0100009C0100009C;
  else
      xpcs_rxd <= load_rx_word ? {shift_byte_7, shift_byte_6, shift_byte_5, shift_byte_4,
                                  shift_byte_3, shift_byte_2, shift_byte_1, shift_byte_0} : xpcs_rxd;

always @ (posedge rbc0_a)
  if (reset_rxclk)
      xpcs_rxc <= 8'h11;
  else
      xpcs_rxc <= load_rx_word ? {shift_special_7, shift_special_6, shift_special_5, shift_special_4,
                                  shift_special_3, shift_special_2, shift_special_1, shift_special_0} : xpcs_rxc;


always @ (posedge rbc0_a)
  if (reset_rxclk)
      load_rx_word <= 1'b0;
  else
      load_rx_word <= !load_rx_word; 


// ***********************************************
// Double byte XGMII TX at 156 Mhz
// ***********************************************

assign det_sop = ({1'b0,xpcs_txc[0],xpcs_txd[7:0]}   == `XPCS_DEC_SDP) |
                 ({1'b0,xpcs_txc[4],xpcs_txd[39:32]} == `XPCS_DEC_SDP);

always @ (posedge tx_clk)
  det_sop_d <= det_sop;

assign pulse_det_sop = det_sop & !det_sop_d;

always @ (posedge tx_clk)
  if (reset_txclk)
      load_tx_hi_r <= 1'b0;
  else
      load_tx_hi_r <= pulse_det_sop ? 1'b1 : !load_tx_hi_r;

assign load_tx_hi = pulse_det_sop ? 1'b0 : load_tx_hi_r;


always @ (posedge tx_clk)
 if (reset_txclk)
   begin 
    tx_xgmii_byte_0 <= 8'h00;
    tx_xgmii_byte_1 <= 8'h00;
    tx_xgmii_byte_2 <= 8'h00;
    tx_xgmii_byte_3 <= 8'h00;
   end
 else 
   begin
    tx_xgmii_byte_0 <= load_tx_hi ? xpcs_txd[39:32] : xpcs_txd[7:0];
    tx_xgmii_byte_1 <= load_tx_hi ? xpcs_txd[47:40] : xpcs_txd[15:8];
    tx_xgmii_byte_2 <= load_tx_hi ? xpcs_txd[55:48] : xpcs_txd[23:16];
    tx_xgmii_byte_3 <= load_tx_hi ? xpcs_txd[63:56] : xpcs_txd[31:24];
  end


always @ (posedge tx_clk)
 if (reset_txclk)
   begin
    tx_xgmii_special_0 <= 1'b0;
    tx_xgmii_special_1 <= 1'b0;
    tx_xgmii_special_2 <= 1'b0;
    tx_xgmii_special_3 <= 1'b0;
   end
 else
   begin
    tx_xgmii_special_0 <= load_tx_hi ? xpcs_txc[4] : xpcs_txc[0];
    tx_xgmii_special_1 <= load_tx_hi ? xpcs_txc[5] : xpcs_txc[1];
    tx_xgmii_special_2 <= load_tx_hi ? xpcs_txc[6] : xpcs_txc[2];
    tx_xgmii_special_3 <= load_tx_hi ? xpcs_txc[7] : xpcs_txc[3];
  end



endmodule
