// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs_rxio_ebuffer_sm.v
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
//   Design: Vega
//    Block: XPCS Lane-to-lane deskew Interface
//   Author: Carlos Castil
//
//   Module: xpcs_rxio_ebuffer_sm
//     File: xpcs_rxio_ebuffer_sm.v
//
//   Description: This block contains the deskew state machine
//                compliant to ieee 802.3ae clause 48 fig 48-8.
//
//   Revision History
//   ------------------------------------------------------------
//      Ver   Date      Comments
//   ------------------------------------------------------------
//      1.0   10/11/02   Created
//
// ****************************************************************


module xpcs_rxio_ebuffer_sm (

                reset,
                rx_clk,

                csr_pulse_deskew_error,
                csr_link_status,
                sync_status,

                state,

                deskew_init,
                deskew_done,

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

input       reset;
input       rx_clk;

input [7:0] r_byte_0;
input [7:0] r_byte_1;
input [7:0] r_byte_2;
input [7:0] r_byte_3;

input       r_special_0;
input       r_special_1;
input       r_special_2;
input       r_special_3;

input       r_error_0;
input       r_error_1;
input       r_error_2;
input       r_error_3;

input       deskew_done;

input       sync_status;

output       deskew_init;
output [7:0] state;
output       csr_link_status;
output       csr_pulse_deskew_error;

parameter DESKEW_LOSS = 8'h00;
parameter ALIGN_DET1  = 8'h01;
parameter ALIGN_DET2  = 8'h02;
parameter ALIGN_DET3  = 8'h04;
parameter DESKEW_OK   = 8'h08;
parameter ALIGN_ERR1  = 8'h10;
parameter ALIGN_ERR2  = 8'h20;
parameter ALIGN_ERR3  = 8'h40;

wire [9:0]  read_in_0;
wire [9:0]  read_in_1;
wire [9:0]  read_in_2;
wire [9:0]  read_in_3;

wire        alg_lane0;
wire        alg_lane1;
wire        alg_lane2;
wire        alg_lane3;

wire        alg_present;
wire        aligned;

wire        csr_deskew_error;
wire        got_deskew_ok;

wire        deskew_on_pulse;
wire        deskew_off_pulse;

wire [7:0]  nxt_state;

reg  [7:0]  state;
reg         deskew_done_d;
reg         deskew_init_d;
reg         deskewing;

// ************************************************************************
// Snoop data out of deskew fifo to check if align characters are deskewed
// ************************************************************************

 assign read_in_0[9:0]  = {r_error_0,  r_special_0,  r_byte_0[7:0]};
 assign read_in_1[9:0]  = {r_error_1,  r_special_1,  r_byte_1[7:0]};
 assign read_in_2[9:0]  = {r_error_2,  r_special_2,  r_byte_2[7:0]};
 assign read_in_3[9:0]  = {r_error_3,  r_special_3,  r_byte_3[7:0]};

// check for comma symbol on all lanes

 assign alg_lane0  = (read_in_0[9:0]  == `XPCS_DEC_ALG);
 assign alg_lane1  = (read_in_1[9:0]  == `XPCS_DEC_ALG);
 assign alg_lane2  = (read_in_2[9:0]  == `XPCS_DEC_ALG);
 assign alg_lane3  = (read_in_3[9:0]  == `XPCS_DEC_ALG);

 assign alg_present  = alg_lane0 | alg_lane1 | alg_lane2 | alg_lane3 ; 

 assign aligned      = alg_lane0 & alg_lane1 & alg_lane2 & alg_lane3;

 assign csr_deskew_error = alg_present & !aligned; 

 assign got_deskew_ok    = alg_present &  aligned;

// ********************************
// Deskew init and done handshake 
// ********************************

always @ (posedge rx_clk)
 if (reset)
    begin
      deskew_done_d <=  1'b0;
      deskew_init_d <=  1'b0;
      deskewing     <=  1'b0;
    end
 else
   begin
     deskew_done_d <=  deskew_done;
     deskew_init_d <=  deskew_init;
     deskewing     <=  deskew_on_pulse ? 1'b1 : deskew_off_pulse ? 1'b0 : deskewing;
   end

assign deskew_off_pulse = deskew_done & !deskew_done_d;
assign deskew_on_pulse  = deskew_init & !deskew_init_d; 


// *****************************************
// Deskew state machine Clause 48 fig 48-8 
// *****************************************

always @ (posedge rx_clk)
 if (reset)
     state <=  8'h00;
 else
     state <=  nxt_state;


   wire csr_link_status_temp;
   reg 	csr_link_status;

always @ (posedge rx_clk)
  csr_link_status <= csr_link_status_temp;
   
assign {csr_link_status_temp, 
        csr_pulse_deskew_error, 
        deskew_init, 
        nxt_state} = fn_deskew_sm (reset, 
                                   state,
                                   sync_status, 
                                   csr_deskew_error, 
                                   deskewing,
                                   got_deskew_ok);

function [10:0] fn_deskew_sm;

 input reset;
 input [7:0] state;
 input sync;
 input error;
 input deskewing; 
 input got_ok;

 reg [7:0] n_state;
 reg       n_status;
 reg       n_init;
 reg       n_inc_deskew_error;

begin

 if (reset | !sync)
    begin
      n_status = 1'b0;
      n_init   = 1'b0;
      n_inc_deskew_error = 1'b0;
      n_state  = DESKEW_LOSS; 
    end

 else

    begin
      n_status = 1'b0;
      n_init   = 1'b0;
      n_inc_deskew_error = 1'b0;
      n_state  = DESKEW_LOSS;

      case (state)  // synopsys parallel_case

       DESKEW_LOSS:

          if (!sync)
            begin
              n_init      = 1'b0;
              n_state     = DESKEW_LOSS;
            end

          else if (got_ok)
            begin
              n_init      = 1'b0;
              n_state     = ALIGN_DET1;
            end 

          else if (!deskewing)
            begin
              n_init      = 1'b1;
              n_state     = DESKEW_LOSS;
            end

          else
            begin
              n_init      = 1'b0;
              n_state     = DESKEW_LOSS;
            end

       ALIGN_DET1:

          if (error)
            begin
              n_state     = DESKEW_LOSS;
            end

          else if (got_ok)
            begin
              n_state     = ALIGN_DET2;
            end

          else
            begin
              n_state     = ALIGN_DET1;
            end

       ALIGN_DET2:

          if (error)
            begin
              n_state     = DESKEW_LOSS;
            end

          else if (got_ok)
            begin
              n_state     = ALIGN_DET3;
            end

          else
            begin
              n_state     = ALIGN_DET2;
            end

       ALIGN_DET3:

          if (error)
            begin
              n_state     = DESKEW_LOSS;
            end

          else if (got_ok)
            begin
              n_state     = DESKEW_OK;
            end

          else
            begin
              n_state     = ALIGN_DET3;
            end

       DESKEW_OK:

          if (error)
            begin
              n_status    = 1'b1;
              n_state     = ALIGN_ERR1;
            end

          else
            begin
              n_status    = 1'b1;
              n_state     = DESKEW_OK;
            end


       ALIGN_ERR1:

          if (error)
            begin
              n_status    = 1'b1;
              n_state     = ALIGN_ERR2;
            end

          else if (got_ok)
            begin
              n_status    = 1'b1;
              n_state     = DESKEW_OK;
            end

          else
            begin
              n_status    = 1'b1;
              n_state     = ALIGN_ERR1;
            end

       ALIGN_ERR2:

          if (error)
            begin
              n_status    = 1'b1;
              n_state     = ALIGN_ERR3;
            end

          else if (got_ok)
            begin
              n_status    = 1'b1;
              n_state     = ALIGN_ERR1;
            end

          else
            begin
              n_status    = 1'b1;
              n_state     = ALIGN_ERR2;
            end

       ALIGN_ERR3:

          if (error)
            begin
              n_status           = 1'b1;
              n_inc_deskew_error = 1'b0;
              n_state            = DESKEW_LOSS;
            end

          else if (got_ok)
            begin
              n_status    = 1'b1;
              n_state     = ALIGN_ERR2;
            end

          else
            begin
              n_status    = 1'b1;
              n_state     = ALIGN_ERR3;
            end

      endcase
 
   end

      fn_deskew_sm =  {n_status, n_inc_deskew_error, n_init, n_state};

 end
 
endfunction


// 0in bits_on -var state -max 1 -clock rx_clk

// 0in state -var state -val DESKEW_LOSS -next ALIGN_DET1 -clock rx_clk -reset (reset |!sync_status)
// 0in state -var state -val ALIGN_DET1 -next DESKEW_LOSS ALIGN_DET2 -clock rx_clk -reset (reset |!sync_status)
// 0in state -var state -val ALIGN_DET2 -next DESKEW_LOSS ALIGN_DET3 -clock rx_clk -reset (reset |!sync_status)
// 0in state -var state -val ALIGN_DET3 -next DESKEW_LOSS DESKEW_OK -clock rx_clk -reset (reset |!sync_status)
// 0in state -var state -val DESKEW_OK -next ALIGN_ERR1 -clock rx_clk -reset (reset |!sync_status)
// 0in state -var state -val ALIGN_ERR1 -next DESKEW_OK ALIGN_ERR2 -clock rx_clk -reset (reset |!sync_status)
// 0in state -var state -val ALIGN_ERR2 -next ALIGN_ERR3 ALIGN_ERR1 -clock rx_clk -reset (reset |!sync_status)
// 0in state -var state -val ALIGN_ERR3 -next DESKEW_LOSS ALIGN_ERR2 -clock rx_clk -reset (reset |!sync_status)


endmodule

