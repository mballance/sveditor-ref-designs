// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs_rx.v
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
//   Design: XPCS Receive 
//    Block: XPCS 
//   Author: Carlos Castil
//
//   Module: xpcs_rx
//     File: xpcs_rx.v
//
//   Description: Logic to deliver receive data to the Vega core
//                in single clock XGMII, 8 byte wide on a single
//                clock.
//
//   Revision History
//   ------------------------------------------------------------
//      Ver   Date      Comments
//   ------------------------------------------------------------
//      1.0   10/16/02  Created
//
// ****************************************************************



module xpcs_rx (
                rx_clk,
                reset_rxclk,

                xserdes_rdy,

                state,

                csr_xpcs_enable,
                csr_link_status_rx,
                csr_tx_test_enable,

                csr_receive_fault_ref,

                inc_rx_pkt_count_ref,

                rx_byte_0,
                rx_byte_1,
                rx_byte_2,
                rx_byte_3,

                rx_special_0,
                rx_special_1,
                rx_special_2,
                rx_special_3,

                rx_error_0,
                rx_error_1,
                rx_error_2,
                rx_error_3,

                rx_xgmii_byte_0,
                rx_xgmii_byte_1,
                rx_xgmii_byte_2,
                rx_xgmii_byte_3,
 
                rx_xgmii_special_0,
                rx_xgmii_special_1,
                rx_xgmii_special_2,
                rx_xgmii_special_3

                );

input          rx_clk;
input          reset_rxclk;

input          xserdes_rdy;

input          csr_xpcs_enable;
input          csr_link_status_rx;
input          csr_tx_test_enable;

input  [7:0]   rx_byte_0;
input  [7:0]   rx_byte_1;
input  [7:0]   rx_byte_2;
input  [7:0]   rx_byte_3;

input          rx_special_0;
input          rx_special_1;
input          rx_special_2;
input          rx_special_3;

input          rx_error_0;
input          rx_error_1;
input          rx_error_2;
input          rx_error_3;

output         state;

output [7:0] rx_xgmii_byte_0;
output [7:0] rx_xgmii_byte_1;
output [7:0] rx_xgmii_byte_2;
output [7:0] rx_xgmii_byte_3;

output       rx_xgmii_special_0;
output       rx_xgmii_special_1;
output       rx_xgmii_special_2;
output       rx_xgmii_special_3;

output       inc_rx_pkt_count_ref;

output       csr_receive_fault_ref;

parameter FAULT    = 1'b0;
parameter RECEIVE  = 1'b1;
 
wire           nxt_state;

wire           serdes_rdy;

wire           detect_idle_0;
wire           detect_idle_1;
wire           detect_idle_2;
wire           detect_idle_3;

// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
wire       detect_idle;
wire       detect_sop_pipe;
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on

reg            state;

reg  [7:0] rx_xgmii_byte_0;
reg  [7:0] rx_xgmii_byte_1;
reg  [7:0] rx_xgmii_byte_2;
reg  [7:0] rx_xgmii_byte_3;

reg        rx_xgmii_special_0;
reg        rx_xgmii_special_1;
reg        rx_xgmii_special_2;
reg        rx_xgmii_special_3;

reg [7:0]  rx_byte_pipe_0;
reg [7:0]  rx_byte_pipe_1;
reg [7:0]  rx_byte_pipe_2;
reg [7:0]  rx_byte_pipe_3;

reg        rx_error_int_0;
reg        rx_error_int_1;
reg        rx_error_int_2;
reg        rx_error_int_3;

reg        rx_special_pipe_0;
reg        rx_special_pipe_1;
reg        rx_special_pipe_2;
reg        rx_special_pipe_3;
 
wire       rx_error_pipe_0;
wire       rx_error_pipe_1;
wire       rx_error_pipe_2;
wire       rx_error_pipe_3;

wire       detect_eop_0;
wire       detect_eop_1;
wire       detect_eop_2;
wire       detect_eop_3;

wire       detect_eop;

wire       detect_seq;

wire       detect_eop_pipe;

wire       detect_eop_pipe0;
wire       detect_eop_pipe1;
wire       detect_eop_pipe2;
wire       detect_eop_pipe3;

wire       xpcs_enable;
wire       tx_test_enable;

/* ********************************************************* */
/*        Synchronize                                        */
/* ********************************************************* */

SYNC_CELL u_sync_serdes_rdy (
                        .D  (xserdes_rdy),  // unsynchronized
                        .CP (rx_clk),
                        .Q  (serdes_rdy));    // synchronized

SYNC_CELL u_sync_xpcs_enable (
                        .D  (csr_xpcs_enable),  // unsynchronized
                        .CP (rx_clk),
                        .Q  (xpcs_enable));    // synchronized

SYNC_CELL u_sync_test_enable (
                        .D  (csr_tx_test_enable),  // unsynchronized
                        .CP (rx_clk),
                        .Q  (tx_test_enable));    // synchronized

/* ********************************************************************** */
/*        Pipeline to satisfy 48.2.6.1.4 check_end Function               */
/* ********************************************************************** */

assign detect_eop_0  = ({rx_error_0,rx_special_0,rx_byte_0} == `XPCS_DEC_END);
assign detect_eop_1  = ({rx_error_1,rx_special_1,rx_byte_1} == `XPCS_DEC_END);
assign detect_eop_2  = ({rx_error_2,rx_special_2,rx_byte_2} == `XPCS_DEC_END);
assign detect_eop_3  = ({rx_error_3,rx_special_3,rx_byte_3} == `XPCS_DEC_END);

assign detect_eop = detect_eop_0 | detect_eop_1 | detect_eop_2 | detect_eop_3;

always @ (posedge rx_clk)
   if (reset_rxclk)
     begin
      rx_byte_pipe_0 <= 8'h00;
      rx_byte_pipe_1 <= 8'h00;
      rx_byte_pipe_2 <= 8'h00;
      rx_byte_pipe_3 <= 8'h00;
     end
   else
     begin
      rx_byte_pipe_0 <= rx_byte_0;
      rx_byte_pipe_1 <= rx_byte_1;
      rx_byte_pipe_2 <= rx_byte_2;
      rx_byte_pipe_3 <= rx_byte_3;
     end

always @ (posedge rx_clk)
   if (reset_rxclk)
     begin
      rx_error_int_0 <= 1'b0;
      rx_error_int_1 <= 1'b0;
      rx_error_int_2 <= 1'b0;
      rx_error_int_3 <= 1'b0;
     end
   else
     begin
      rx_error_int_0 <= rx_error_0;
      rx_error_int_1 <= rx_error_1;
      rx_error_int_2 <= rx_error_2;
      rx_error_int_3 <= rx_error_3;
     end

assign rx_error_pipe_0 = rx_error_int_0 | rx_error_0 & detect_eop_pipe | rx_error_0 & detect_eop;
assign rx_error_pipe_1 = rx_error_int_1 | rx_error_1 & detect_eop_pipe | rx_error_1 & detect_eop;
assign rx_error_pipe_2 = rx_error_int_2 | rx_error_2 & detect_eop_pipe | rx_error_2 & detect_eop;
assign rx_error_pipe_3 = rx_error_int_3 | rx_error_3 & detect_eop_pipe | rx_error_3 & detect_eop;

always @ (posedge rx_clk)
   if (reset_rxclk)
     begin
      rx_special_pipe_0 <= 1'b0;
      rx_special_pipe_1 <= 1'b0;
      rx_special_pipe_2 <= 1'b0;
      rx_special_pipe_3 <= 1'b0;
     end
   else
     begin
      rx_special_pipe_0 <= rx_special_0;
      rx_special_pipe_1 <= rx_special_1;
      rx_special_pipe_2 <= rx_special_2;
      rx_special_pipe_3 <= rx_special_3;
     end

/* ********************************************************************** */

assign detect_eop_pipe0  = ({rx_error_int_0,rx_special_pipe_0,rx_byte_pipe_0} == `XPCS_DEC_END);
assign detect_eop_pipe1  = ({rx_error_int_1,rx_special_pipe_1,rx_byte_pipe_1} == `XPCS_DEC_END);
assign detect_eop_pipe2  = ({rx_error_int_2,rx_special_pipe_2,rx_byte_pipe_2} == `XPCS_DEC_END);
assign detect_eop_pipe3  = ({rx_error_int_3,rx_special_pipe_3,rx_byte_pipe_3} == `XPCS_DEC_END);

assign detect_idle_0 = ({rx_error_pipe_0,rx_special_pipe_0,rx_byte_pipe_0} == `XPCS_DEC_SKP) |
                       ({rx_error_pipe_0,rx_special_pipe_0,rx_byte_pipe_0} == `XPCS_DEC_ALG) |
                       ({rx_error_pipe_0,rx_special_pipe_0,rx_byte_pipe_0} == `XPCS_DEC_COM);

assign detect_idle_1 = ({rx_error_pipe_1,rx_special_pipe_1,rx_byte_pipe_1} == `XPCS_DEC_SKP) |
                       ({rx_error_pipe_1,rx_special_pipe_1,rx_byte_pipe_1} == `XPCS_DEC_ALG) |
                       ({rx_error_pipe_1,rx_special_pipe_1,rx_byte_pipe_1} == `XPCS_DEC_COM);

assign detect_idle_2 = ({rx_error_pipe_2,rx_special_pipe_2,rx_byte_pipe_2} == `XPCS_DEC_SKP) |
                       ({rx_error_pipe_2,rx_special_pipe_2,rx_byte_pipe_2} == `XPCS_DEC_ALG) |
                       ({rx_error_pipe_2,rx_special_pipe_2,rx_byte_pipe_2} == `XPCS_DEC_COM);

assign detect_idle_3 = ({rx_error_pipe_3,rx_special_pipe_3,rx_byte_pipe_3} == `XPCS_DEC_SKP) |
                       ({rx_error_pipe_3,rx_special_pipe_3,rx_byte_pipe_3} == `XPCS_DEC_ALG) |
                       ({rx_error_pipe_3,rx_special_pipe_3,rx_byte_pipe_3} == `XPCS_DEC_COM);

/* 0in req_ack -req $0in_rising_edge(detect_sop_pipe) -ack $0in_rising_edge(detect_eop_pipe) -clock rx_clk -max 7000 */

assign detect_eop_pipe = (detect_eop_pipe0 | detect_eop_pipe1 | detect_eop_pipe2 | detect_eop_pipe3); 
assign detect_sop_pipe = ({rx_error_pipe_0,rx_special_pipe_0,rx_byte_pipe_0} == `XPCS_DEC_SDP); 

assign detect_idle = (detect_idle_0 | detect_idle_1 | detect_idle_2 | detect_idle_3);
assign detect_seq = ({rx_error_pipe_0,rx_special_pipe_0,rx_byte_pipe_0} == `XPCS_DEC_SEQ);

assign inc_rx_pkt_count_ref = detect_eop_pipe;

assign csr_receive_fault_ref = detect_seq;



always @ (posedge rx_clk)
   if (reset_rxclk)
     begin
      rx_xgmii_byte_0 <= 8'h9C;
      rx_xgmii_byte_1 <= 8'h00;
      rx_xgmii_byte_2 <= 8'h00;
      rx_xgmii_byte_3 <= 8'h00;
     end
   else
     begin

      rx_xgmii_byte_3 <=                                            (state == FAULT) ? 8'h01 :
                          ((state == RECEIVE) & rx_error_pipe_3) & !detect_eop_pipe3 ? 8'hFE : 
                               detect_idle_3 & rx_special_pipe_3 & !detect_eop_pipe3 ? 8'h07 : 
                                                 detect_eop_pipe & !detect_eop_pipe3 ? 8'h07 :
                                                      rx_byte_pipe_3 ;

      rx_xgmii_byte_2 <=                                            (state == FAULT) ? 8'h00 :
                          ((state == RECEIVE) & rx_error_pipe_2) & !detect_eop_pipe2 ? 8'hFE :
                               detect_idle_2 & rx_special_pipe_2 & !detect_eop_pipe2 ? 8'h07 :
                          (detect_eop_pipe & !(detect_eop_pipe3 | detect_eop_pipe2)) ? 8'h07 :
                                            rx_byte_pipe_2 ;

      rx_xgmii_byte_1 <=                                            (state == FAULT) ? 8'h00 :
                          ((state == RECEIVE) & rx_error_pipe_1) & !detect_eop_pipe1 ? 8'hFE :
                               detect_idle_1 & rx_special_pipe_1 & !detect_eop_pipe1 ? 8'h07 :
       (detect_eop_pipe & !(detect_eop_pipe3 | detect_eop_pipe2 | detect_eop_pipe1)) ? 8'h07 :
                                            rx_byte_pipe_1 ;

      rx_xgmii_byte_0 <=                                            (state == FAULT) ? 8'h9C :
                          ((state == RECEIVE) & rx_error_pipe_0) & !detect_eop_pipe0 ? 8'hFE :
                               detect_idle_0 & rx_special_pipe_0 & !detect_eop_pipe0 ? 8'h07 :
                                            rx_byte_pipe_0 ;
    end


always @ (posedge rx_clk)
   if (reset_rxclk)
     begin
      rx_xgmii_special_0 <= 1'b1;
      rx_xgmii_special_1 <= 1'b0;
      rx_xgmii_special_2 <= 1'b0;
      rx_xgmii_special_3 <= 1'b0;
     end
   else
     begin
      rx_xgmii_special_3 <= (state == FAULT) ? 1'b0 :   rx_special_pipe_3 | ((state == RECEIVE) & rx_error_pipe_3) ;
      rx_xgmii_special_2 <= (state == FAULT) ? 1'b0 :   rx_special_pipe_2 | ((state == RECEIVE) & rx_error_pipe_2) ;
      rx_xgmii_special_1 <= (state == FAULT) ? 1'b0 :   rx_special_pipe_1 | ((state == RECEIVE) & rx_error_pipe_1) ;
      rx_xgmii_special_0 <= (state == FAULT) ? 1'b1 :   rx_special_pipe_0 | ((state == RECEIVE) & rx_error_pipe_0) ;
    end


assign {nxt_state} = receive_fn (reset_rxclk,
                                 serdes_rdy,
                                 tx_test_enable,
                                 xpcs_enable,
                                 csr_link_status_rx,
                                 detect_eop_pipe,
                                 state);


function [0:0]  receive_fn;

 input       reset;
 input       serdes_rdy;
 input       tx_test_enable;
 input       enable;
 input       link;
 input       eop;
 input       state;

 reg         n_state;

 begin

  if (reset)

     begin
        n_state         = FAULT;
     end

  else

     begin

       n_state         = FAULT;

       case (state)

         FAULT : 
           if (link & enable & serdes_rdy & !tx_test_enable)
               n_state      =   RECEIVE;
           else 
               n_state      =   FAULT;

         RECEIVE: 
            if (!link | tx_test_enable)
                n_state         = FAULT;
            else if (!enable & eop)
                n_state         = FAULT;
            else
                n_state         = RECEIVE;

        endcase

      end

     receive_fn = {n_state};

  end

endfunction

// 0in state -var state -val FAULT -next RECEIVE -clock rx_clk 
// 0in state -var state -val RECEIVE -next FAULT -clock rx_clk 


always @ (posedge rx_clk)
   if (reset_rxclk)
       state <=  1'b0;
   else
       state <=  nxt_state;



endmodule
