// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs_rxio_sync_sm.v
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
// ****************************************************************
//
//   Sun Proprietary/Confidential: Internal Use Only
//
// ****************************************************************
//   Design: XPCS RX IO Interface
//    Block: XPCS RX Sync state machine
//   Author: Carlos Castil 
//   
//   Module: xpcs_rxio_sync_sm 
//     File: xpcs_rxio_sync_sm.v 
//
//   Description: This block contains a comma detector compliant
//                to ieee 802.3ae clause 48 fig 48-7.
//
//   Revision History
//   ------------------------------------------------------------
//      Ver   Date      Comments
//   ------------------------------------------------------------
//      1.0   09/24/02   Created
//
// ****************************************************************



module xpcs_rxio_sync_sm (
		rx_lane_clk,
		rx_lane_reset,
                rx_signal_detect,
		
		byte_deskew,
		special_deskew,
		error_deskew,

                state,
		csr_lane_sync_status);

input		rx_lane_clk;
input		rx_lane_reset;
input           rx_signal_detect;

input	[7:0]	byte_deskew;
input		special_deskew;
input		error_deskew;

output  [3:0]   state;
output		csr_lane_sync_status;

// Wires and Regs which are not flops

wire		com_det;
wire   [3:0]    nxt_state;

// Regs which are flops

reg             csr_lane_sync_status;
wire            rx_lane_sync_loss;

wire            inc_comma_cnt;
wire            inc_symbol_cnt;

wire  [2:0]     nxt_comma_cnt;  // counter for number of good commas received
wire  [2:0]     nxt_symbol_cnt; // counter for number of good symbol received

reg   [2:0]     comma_cnt;
reg   [2:0]     symbol_cnt;

wire            clr_comma_cnt;
wire            clr_symbol_cnt;

wire            comma_cnt_eq4;
wire            symbol_cnt_eq3;

reg   [3:0]     state;

wire            com_k281_det;
wire            com_k285_det;
wire            com_k287_det;

wire            invalid;


parameter  LOSS_SYNC       = 4'h0; // word synchronization state machine
parameter  IN_SYNC         = 4'h1;
parameter  ONE_INVALID     = 4'h2;
parameter  TWO_INVALID     = 4'h4;
parameter  THREE_INVALID   = 4'h8;


// Decode
/*
XPCS_DEC_COM 10'h1BC   // K28.5 
XPCS_DEC_281 10'h13C
XPCS_DEC_285 10'h1BC
XPCS_DEC_287 10'h1FC

XPCS_DEC_SDP 10'h1FB
XPCS_DEC_SLP 10'h15C
XPCS_DEC_EGP 10'h1FD
XPCS_DEC_EBP 10'h1FE
XPCS_DEC_PAD 10'h1F7
XPCS_DEC_SKP 10'h11C

XPCS_DEC_LN0 10'h000
XPCS_DEC_LN1 10'h001
XPCS_DEC_LN2 10'h002
XPCS_DEC_LN3 10'h004

XPCS_DEC_LN4 10'h008
XPCS_DEC_LN5 10'h00F
XPCS_DEC_LN6 10'h010
XPCS_DEC_LN7 10'h017
XPCS_DEC_LN8 10'h018
XPCS_DEC_LN9 10'h01B
XPCS_DEC_LNA 10'h01D
XPCS_DEC_LNB 10'h01E
*/

assign com_k281_det   = ({error_deskew,special_deskew,byte_deskew[7:0]} == `XPCS_DEC_281);
assign com_k285_det   = ({error_deskew,special_deskew,byte_deskew[7:0]} == `XPCS_DEC_285);
assign com_k287_det   = ({error_deskew,special_deskew,byte_deskew[7:0]} == `XPCS_DEC_287);


assign com_det        = com_k281_det | com_k285_det | com_k287_det;

assign invalid        = error_deskew;   // Disparity and decode errors


/*
** Synchronization COMMA counter
*/

always @ (posedge rx_lane_clk)
  if (rx_lane_reset)
     comma_cnt <= 3'b0;
  else
     comma_cnt <= nxt_comma_cnt;

assign nxt_comma_cnt = (rx_lane_reset | clr_comma_cnt) ? 3'h0 : 
                       (inc_comma_cnt)  ? comma_cnt + 3'h1 :
                        comma_cnt;

assign comma_cnt_eq4 = (comma_cnt >= 3'h4);

/*
** Synchronization SYMBOL counter
*/

always @ (posedge rx_lane_clk)
  if (rx_lane_reset)
     symbol_cnt <= 3'b0;
  else
     symbol_cnt <= nxt_symbol_cnt;

assign nxt_symbol_cnt = (rx_lane_reset | clr_symbol_cnt) ? 3'h0 :
                        (inc_symbol_cnt)  ? symbol_cnt + 3'h1 :
                         symbol_cnt;

assign symbol_cnt_eq3 = (symbol_cnt >= 3'h3);

/* ************************************************************* */

always @ (posedge rx_lane_clk)
    csr_lane_sync_status <= !rx_lane_sync_loss;

/*
** Call of function word synchronization
*/

assign {rx_lane_sync_loss,inc_symbol_cnt,clr_symbol_cnt,inc_comma_cnt,clr_comma_cnt,nxt_state}
        = synchronization_fn(rx_lane_reset,
                             com_det,
                             invalid,
                             comma_cnt_eq4,
                             symbol_cnt_eq3,
                             state);


/*
** Word Synchronization state machine
*/
function [8:0] synchronization_fn;
   input        f_reset;
   input        f_com_det;        // to determine if there is a comma
   input        f_invalid;        // invalid transmission word detected
   input        f_comma_cnt_eq4;
   input        f_symbol_cnt_eq3;   // found 3 commas with no errors
   input [3:0]  state;

   reg          f_loss_sync;       // indicates word sync status
   reg          f_inc_comma_cnt;   // increment word sync counter
   reg          f_clr_comma_cnt;   // clear word sync counter
   reg          f_inc_symbol_cnt;  // increment word sync counter
   reg          f_clr_symbol_cnt;  // clear word sync counter
   reg [3:0]    n_state;           // next state

   begin
    if (f_reset)
      begin
        f_loss_sync      = 1'h1; 
        f_inc_comma_cnt  = 1'h0;
        f_clr_comma_cnt  = 1'h1;
        f_inc_symbol_cnt = 1'h0;
        f_clr_symbol_cnt = 1'h1;
        n_state          = LOSS_SYNC;
      end
    else
      begin
        f_loss_sync      = 1'h0;
        f_inc_comma_cnt  = 1'h0;
        f_clr_comma_cnt  = 1'h0;
        f_inc_symbol_cnt = 1'h0;
        f_clr_symbol_cnt = 1'h0;
        n_state          = LOSS_SYNC;

        case (state)    // synopsys parallel_case

            LOSS_SYNC : // 0    // being in this state triggers link config
              begin
                f_loss_sync = 1'h1;
                if (f_reset)
                        n_state = LOSS_SYNC;
                else if (f_invalid)
                      begin
                        f_clr_comma_cnt  = 1'h1;
                        f_clr_symbol_cnt = 1'h1;
                        n_state = LOSS_SYNC;
                      end
                else if (f_comma_cnt_eq4)   // got 3 good commas
                        n_state = IN_SYNC;
                else if (f_com_det) // accum good
                      begin
                        f_clr_comma_cnt  = 1'h0;
                        f_inc_comma_cnt  = 1'h1;
                        n_state = LOSS_SYNC;
                      end
                 else  
                        n_state = LOSS_SYNC;

              end

           IN_SYNC :    // 1
              if (f_invalid)
                  begin
                    f_clr_comma_cnt  = 1'h1;
                    f_clr_symbol_cnt = 1'h1;
                    n_state = ONE_INVALID;
                  end
              else 
                    n_state = IN_SYNC;

           ONE_INVALID : // 2 
              if (f_invalid) 
                  begin
                     f_clr_symbol_cnt = 1'h1;
                     f_clr_comma_cnt  = 1'h1;
                     n_state = TWO_INVALID;
                  end

              else if (f_symbol_cnt_eq3)   // got 3 good symbols 
                  begin
                     f_clr_symbol_cnt = 1'h1;
                     f_clr_comma_cnt  = 1'h1;
                     n_state = IN_SYNC;    // go to sync state
                  end

              else                         // inc good symbol count
                   begin
                      f_clr_symbol_cnt  = 1'h0;
                      f_inc_symbol_cnt  = 1'h1;
                      n_state = ONE_INVALID;
                   end


           TWO_INVALID : // 4
              if (f_invalid)
                  begin
                     f_clr_symbol_cnt = 1'h1;
                     f_clr_comma_cnt  = 1'h1;
                     n_state = THREE_INVALID;
                  end

              else if (f_symbol_cnt_eq3)    // got 3 good symbols
                  begin
                     f_clr_symbol_cnt = 1'h1;
                     f_clr_comma_cnt  = 1'h1;
                     n_state = ONE_INVALID; // Need to get 3 more good symbols 
                  end

              else                          // inc good symbol count 
                   begin
                      f_clr_symbol_cnt  = 1'h0;
                      f_inc_symbol_cnt  = 1'h1;
                      n_state = TWO_INVALID;
                   end


           THREE_INVALID : // 8
              if (f_invalid)
                  begin
                     f_clr_symbol_cnt = 1'h1;
                     f_clr_comma_cnt  = 1'h1;
                     n_state = LOSS_SYNC;
                  end

              else if (f_symbol_cnt_eq3)    // got 3 good symbols 
                  begin
                     f_clr_symbol_cnt = 1'h1;
                     f_clr_comma_cnt  = 1'h1;
                     n_state = TWO_INVALID; // Need to get 6 more good symbols 
                  end

              else                          // inc good symbol count 
                   begin
                      f_clr_symbol_cnt  = 1'h0;
                      f_inc_symbol_cnt  = 1'h1;
                      n_state = THREE_INVALID;
                   end


        endcase
      
       end
//                 {rx_lane_sync_loss,  inc_symbol_cnt,  clr_symbol_cnt,  inc_comma_cnt,  clr_comma_cnt,nxt_state}
    synchronization_fn = {f_loss_sync,f_inc_symbol_cnt,f_clr_symbol_cnt,f_inc_comma_cnt,f_clr_comma_cnt,n_state};

  end
endfunction

// ********************************
// Receive State Machine Registers
// ********************************

always @(posedge rx_lane_clk)
  if (rx_lane_reset | !rx_signal_detect)
    begin 
      state <= 4'b0;      
    end
  else
    begin
      state <= nxt_state;
    end    

// 0in bits_on -var state -max 1 -clock rx_lane_clk

// 0in state -var state -val LOSS_SYNC -next IN_SYNC -clock rx_lane_clk -reset (rx_lane_reset | !rx_signal_detect)
// 0in state -var state -val IN_SYNC -next ONE_INVALID -clock rx_lane_clk -reset (rx_lane_reset | !rx_signal_detect) 
// 0in state -var state -val ONE_INVALID -next TWO_INVALID IN_SYNC -clock rx_lane_clk -reset (rx_lane_reset | !rx_signal_detect)
// 0in state -var state -val TWO_INVALID -next THREE_INVALID ONE_INVALID -clock rx_lane_clk -reset (rx_lane_reset | !rx_signal_detect)
// 0in state -var state -val THREE_INVALID -next LOSS_SYNC TWO_INVALID -clock rx_lane_clk -reset (rx_lane_reset | !rx_signal_detect)

endmodule
