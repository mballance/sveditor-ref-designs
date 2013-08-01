// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs_rxio_ebuffer.v
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
//   Design: XPCS Physical Interface Core
//    Block: 10G Ethernet Physical Interface Controller
//   Author: Carlos Castil 
//   
//   Module: xpcs_rxio_ebuffer
//     File: xpcs_rxio_ebuffer.v
//
//   Description:
//	This block contains an elastic buffer and deskew controller
//	for ieee 802.3ae xpcs clock tolerance compensation.
//
//   Revision History
//   ------------------------------------------------------------
//      Ver   Date      Comments
//   ------------------------------------------------------------
//      1.0   10/9/02    Created
//
// ****************************************************************



module xpcs_rxio_ebuffer (
		rx_clk,
		reset,
		
		w_byte_0,
                w_byte_1,
		w_byte_2,
		w_byte_3,

		w_special_0,
		w_special_1,
		w_special_2,
		w_special_3,

		w_error_0,
		w_error_1,
		w_error_2,
		w_error_3,

		flush,

		w_hold_0,
                w_hold_1,
		w_hold_2,
		w_hold_3,

                csr_link_status,
                sync_status,
        
                csr_pulse_deskew_error,
                csr_ebuffer_state,

		r_byte_0,
		r_byte_1,
		r_byte_2,
		r_byte_3,

		r_special_0,
		r_special_1,
		r_special_2,
		r_special_3,

		r_error_0,
		r_error_1,
		r_error_2,
		r_error_3 );

		
input		rx_clk;
input		reset;

input           sync_status;

input	[7:0]	w_byte_0;
input	[7:0]	w_byte_1;
input	[7:0]	w_byte_2;
input	[7:0]	w_byte_3;

input		w_special_0;
input		w_special_1;
input		w_special_2;
input		w_special_3;

input		w_error_0;
input		w_error_1;
input		w_error_2;
input		w_error_3;

output		flush;

output		w_hold_0;
output		w_hold_1;
output		w_hold_2;
output		w_hold_3;

output          csr_link_status;
output  [7:0]   csr_ebuffer_state;
output          csr_pulse_deskew_error;

output	[7:0]	r_byte_0;
output	[7:0]	r_byte_1;
output	[7:0]	r_byte_2;
output	[7:0]	r_byte_3;

output		r_special_0;
output		r_special_1;
output		r_special_2;
output		r_special_3;

output		r_error_0;
output		r_error_1;
output		r_error_2;
output		r_error_3;

// Write Clock Domain Wires And Regs Which Are Not Flops

wire		hold_en;

// State Machine control signals 

reg     [2:0]   flush_cnt;

reg     [2:0]	deskew_cnt;
reg             deskew_ack;
reg             deskew_req;

wire            deskew_done;
wire            deskew_init;

wire            dec_flush_cnt;

reg             flush_int;
reg             flush_reg;

reg		deskew_ack_hold;
reg             deskew_req_hold;

reg             det_alg;
reg             deskewing_reg;

wire            deskewing;
wire            deskew_on_pulse;
wire            deskew_off_pulse;

wire            det_alg_x4;

wire            det_alg_lane0;
wire            det_alg_lane1;
wire            det_alg_lane2;
wire            det_alg_lane3;

reg     [9:0]   w_s_in_0;
reg     [9:0]   w_s_in_1;
reg     [9:0]   w_s_in_2;
reg     [9:0]   w_s_in_3;

// ************************************************************************
// Align character detect logic
// ************************************************************************

// Register inputs from the deskew fifo

always @ (posedge rx_clk)
  begin
    w_s_in_0[9:0]  <=  {w_error_0,  w_special_0,  w_byte_0[7:0]};
    w_s_in_1[9:0]  <=  {w_error_1,  w_special_1,  w_byte_1[7:0]};
    w_s_in_2[9:0]  <=  {w_error_2,  w_special_2,  w_byte_2[7:0]};
    w_s_in_3[9:0]  <=  {w_error_3,  w_special_3,  w_byte_3[7:0]};
  end


assign det_alg_lane0  = ({w_error_0,  w_special_0,  w_byte_0[7:0]}  == `XPCS_DEC_ALG) ;
assign det_alg_lane1  = ({w_error_1,  w_special_1,  w_byte_1[7:0]}  == `XPCS_DEC_ALG) ;
assign det_alg_lane2  = ({w_error_2,  w_special_2,  w_byte_2[7:0]}  == `XPCS_DEC_ALG) ;
assign det_alg_lane3  = ({w_error_3,  w_special_3,  w_byte_3[7:0]}  == `XPCS_DEC_ALG) ;

// deskewing starts after detection of any align character in any lane

always @ (posedge rx_clk)
    det_alg <= (det_alg_lane0 | det_alg_lane1 | det_alg_lane2 | det_alg_lane3);

always @ (posedge rx_clk)
 if (reset)
     deskewing_reg  <=  1'b0;
 else
     deskewing_reg  <=  deskew_off_pulse ? 1'b0 : deskew_on_pulse ? 1'b1 : deskewing;

assign deskew_off_pulse = (deskew_cnt[2:0] == 3'b000);
assign deskew_on_pulse  = (flush_cnt[2:0]  == 3'b000) & 
                          (det_alg_lane0 | det_alg_lane1 | det_alg_lane2 | det_alg_lane3) & !det_alg;

assign deskewing = deskew_on_pulse | deskewing_reg;


// assign hold_en = (deskew_cnt[2:0] != 3'b000) & deskewing & !det_alg_x4 ;

// deskew_cnt <=  flush_reg ? 3'b100 : hold_en ? (deskew_cnt - 3'b001) : 3'b000;




// *********************************************************************
// Deskew Logic
// *********************************************************************

assign det_alg_x4     = det_alg_lane0 &
                        det_alg_lane1 &
                        det_alg_lane2 &
                        det_alg_lane3;


// *********************************************************************
// Deskew fifo control logic
// *********************************************************************

// Assert hold if deskewing and alignment detected on at least one lane

assign w_hold_0  = (hold_en & det_alg_lane0);
assign w_hold_1  = (hold_en & det_alg_lane1);
assign w_hold_2  = (hold_en & det_alg_lane2);
assign w_hold_3  = (hold_en & det_alg_lane3);

// ----------------------------
// Elastic Buffer output wires
// ----------------------------

assign {r_error_0,r_special_0,r_byte_0[7:0]} = w_s_in_0[9:0];
assign {r_error_1,r_special_1,r_byte_1[7:0]} = w_s_in_1[9:0];
assign {r_error_2,r_special_2,r_byte_2[7:0]} = w_s_in_2[9:0];
assign {r_error_3,r_special_3,r_byte_3[7:0]} = w_s_in_3[9:0];


// *********************************
// Deskew init and Deskew done logic 
// *********************************

// Generate deskew request

always @ (posedge rx_clk)
  if (reset)
    deskew_req <=  1'b0;
  else
    deskew_req <=  deskew_init ? !deskew_req : deskew_req; 

// Generate pulse to flush deskew fifos and reset deskew_cnt 

always @ (posedge rx_clk)
   if (reset)
     deskew_req_hold <=  1'b0;
   else
     deskew_req_hold <=  deskew_req;


assign flush = (deskew_req ^ deskew_req_hold);

// Generate flush_int used to create deskew_ack

always @ (posedge rx_clk)
   if (reset)
    begin
      flush_reg <= 1'b0;
      flush_int <= 1'b0;
    end
   else
    begin
      flush_reg <=  flush;
      flush_int <=  flush_reg ? 1'b1 : (deskew_cnt[2:0]==3'b000) ? 1'b0 : flush_int ;
    end
      
// Count from 6, 5, 4, 3, 2, 1, to 0.... 5 clock count to account for deskew of
//  5 X 6.4 ns = 32 ns deskew window
 
always @ (posedge rx_clk)
  if (reset)
    begin
      deskew_cnt <=  3'b000;
    end
  else
    begin
      deskew_cnt <=  flush_reg ? 3'b100 : hold_en ? (deskew_cnt - 3'b001) : deskew_cnt;
    end

// Wait for flush to complete to enable hold....fifo must flush

always @ (posedge rx_clk)
  if (reset)
    begin
      flush_cnt <=  3'b000;
    end
  else
    begin
      flush_cnt <=  flush_reg ? 3'b100 : (dec_flush_cnt) ? (flush_cnt - 3'b001) : 3'b000;
    end

assign dec_flush_cnt = (flush_cnt != 3'b000);


// hold if counter is not expired and commas have not been detected across all lanes
// Deskewing starts immidiately on detection of an align character.

assign hold_en = (deskew_cnt[2:0] != 3'b000) & deskewing & !det_alg_x4 ; 


// Generate acknowledge signal for deskew process

always @ (posedge rx_clk)
  if (reset)
    deskew_ack <=  1'b0;
  else
    deskew_ack <=  (flush_int & (deskew_cnt[2:0]==3'b000)) ? deskew_req : deskew_ack ;

// Generate deskew done strobe from edge of deskew_ack

always @ (posedge rx_clk)
  if (reset)
    deskew_ack_hold <=  1'b0;
  else
    deskew_ack_hold <=  deskew_ack;

assign deskew_done = (deskew_ack_hold ^ deskew_ack);


// ******************************************************************
// Elastic Buffer state machine
// ******************************************************************

xpcs_rxio_ebuffer_sm xpcs_rxio_ebuffer_sm (
                .reset(reset),
                .rx_clk(rx_clk),

                .csr_link_status(csr_link_status),

                .csr_pulse_deskew_error(csr_pulse_deskew_error),
                .sync_status(sync_status),

                .state(csr_ebuffer_state),

                .deskew_init(deskew_init),
                .deskew_done(deskew_done),

                .r_byte_0(r_byte_0),
                .r_byte_1(r_byte_1),
                .r_byte_2(r_byte_2),
                .r_byte_3(r_byte_3),

                .r_special_0(r_special_0),
                .r_special_1(r_special_1),
                .r_special_2(r_special_2),
                .r_special_3(r_special_3),

                .r_error_0(r_error_0),
                .r_error_1(r_error_1),
                .r_error_2(r_error_2),
                .r_error_3(r_error_3) );



endmodule
