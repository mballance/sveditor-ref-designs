// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs_tx.v
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
/* Module Name   :  xpcs_tx                                           */
/* Description   :  XPCS transmit top level.  Ranmomizer and tx state */
/*                  machine (clause 48.2.6.2.1 ieee802.3ae).          */
/*                                                                    */
/*                  Link protocol:                                    */
/*                                                                    */
/*                  When xpcs receiver asserts local fault to XGMII   */
/*                  due to link loss, the xpcs transmiter transmits   */
/*                  remote faults and idles.                          */
/*                                                                    */
/*                  When the receiver gets remote faults, the XPCS    */
/*                  passes it on to the XGMII. The MAC then generates */
/*                  idles for XPCS to transmit to assist the remote   */
/*                  node regain link. (clause 46.3.4 p285).           */
/*                                                                    */
/* Assumptions   : none.                                              */
/*                                                                    */
/* Parent module : xpcs_tx.v                                          */
/* Child modules : none.                                              */
/* Author Name   : Carlos Castil                                      */
/* Date Created  : 11/10/02                                           */
/*                                                                    */
/*              Copyright (c) 2002, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */ 
/* Modifications :                                                    */
/**********************************************************************/

 
module xpcs_tx (           tx_clk, 
                           reset, 

                           csr_link_status,
                           csr_tx_test_enable,
                           csr_test_pattern_sel,
                           
                           tx_byte_0,
                           tx_byte_1,
                           tx_byte_2,
                           tx_byte_3,

                           tx_special_0,
                           tx_special_1,
                           tx_special_2,
                           tx_special_3,

                           tx_byte_0_enc,
                           tx_byte_1_enc,
                           tx_byte_2_enc,
                           tx_byte_3_enc,

                           tx_special_0_enc,
                           tx_special_1_enc,
                           tx_special_2_enc,
                           tx_special_3_enc,

                           csr_transmit_fault_ref,

                           inc_tx_pkt_count_ref,

                           
                           state       );

input       tx_clk;
input       reset;

input       csr_link_status;
input       csr_tx_test_enable;
input [1:0] csr_test_pattern_sel;

output      inc_tx_pkt_count_ref;
output      csr_transmit_fault_ref;

input [7:0] tx_byte_0;
input [7:0] tx_byte_1;
input [7:0] tx_byte_2;
input [7:0] tx_byte_3;

input       tx_special_0;
input       tx_special_1;
input       tx_special_2;
input       tx_special_3;

output [3:0] state;

output [7:0] tx_byte_0_enc;
output [7:0] tx_byte_1_enc;
output [7:0] tx_byte_2_enc;
output [7:0] tx_byte_3_enc;

output       tx_special_0_enc;
output       tx_special_1_enc;
output       tx_special_2_enc;
output       tx_special_3_enc;

parameter SEND_DATA       = 4'h0;
parameter SEND_SDP        = 4'h1;
parameter SEND_A          = 4'h2;
parameter SEND_K          = 4'h3;
parameter SEND_Q          = 4'h4;
parameter SEND_RANDOM_R   = 4'h5;
parameter SEND_RANDOM_A   = 4'h6;
parameter SEND_RANDOM_K   = 4'h7;
parameter SEND_RANDOM_Q   = 4'h8;
parameter UNDERRUN        = 4'h9;

reg [3:0] state;

wire [3:0] nxt_state;

reg [7:0] tx_byte_0_in;
reg [7:0] tx_byte_1_in;
reg [7:0] tx_byte_2_in;
reg [7:0] tx_byte_3_in;

reg      tx_special_0_in;
reg      tx_special_1_in;
reg      tx_special_2_in;
reg      tx_special_3_in;

reg [7:0] tx_byte_0_int;
reg [7:0] tx_byte_1_int;
reg [7:0] tx_byte_2_int;
reg [7:0] tx_byte_3_int;

reg      tx_special_0_int;
reg      tx_special_1_int;
reg      tx_special_2_int;
reg      tx_special_3_int;

wire [7:0] tx_byte_0_mux;
wire [7:0] tx_byte_1_mux;
wire [7:0] tx_byte_2_mux;
wire [7:0] tx_byte_3_mux;

wire      tx_special_0_mux;
wire      tx_special_1_mux;
wire      tx_special_2_mux;
wire      tx_special_3_mux;

reg [7:0] tx_byte_0_enc;
reg [7:0] tx_byte_1_enc;
reg [7:0] tx_byte_2_enc;
reg [7:0] tx_byte_3_enc;

reg       tx_special_0_enc;
reg       tx_special_1_enc;
reg       tx_special_2_enc;
reg       tx_special_3_enc;

wire     align_count_exp;
wire     code_sel_random;

wire     sel_d, sel_k, sel_a, sel_r, sel_q;
wire     sel_s;

wire     q_detect;

wire     term_det_0;
wire     term_det_1;
wire     term_det_2;
wire     term_det_3;

wire     idle_det_0;
wire     idle_det_1;
wire     idle_det_2;
wire     idle_det_3;

wire     i_detect;

wire     clr_a_cnt;

wire     clr_q_det;

wire     xgmii_s_detect;
wire     xgmii_d_detect;

wire     csr_transmit_fault_ref;

wire [7:0] test_byte;
wire       test_special;

wire       q_detect_local;
wire       q_detect_remote;

reg        q_det_local;
reg        q_det_remote;

wire       link_status_tx;
wire       tx_test_enable;

wire [1:0] test_pattern_sel;

/* ********************************************************** */
/*        Synchronize                                         */
/* ********************************************************** */

SYNC_CELL u_sync_link_status (
                        .D  (csr_link_status),  // unsynchronized
                        .CP (tx_clk),
                        .Q  (link_status_tx));    // synchronized

SYNC_CELL u_sync_test_enable (
                        .D  (csr_tx_test_enable),  // unsynchronized
                        .CP (tx_clk),
                        .Q  (tx_test_enable));    // synchronized

SYNC_CELL u_sync_test_pattern_sel_0 (
                        .D  (csr_test_pattern_sel[0]),  // unsynchronized
                        .CP (tx_clk),
                        .Q  (test_pattern_sel[0]));    // synchronized

SYNC_CELL u_sync_test_pattern_sel_1 (
                        .D  (csr_test_pattern_sel[1]),  // unsynchronized
                        .CP (tx_clk),
                        .Q  (test_pattern_sel[1]));    // synchronized

// *******************************************************
// q_det function per clause 48.2.6.1.4 ieee 802.3ae
// *******************************************************

assign q_detect_local = tx_special_0_in & (tx_byte_0_in == `XPCS_ENC_SEQ) & 
                                          (tx_byte_1_in == `XPCS_ENC_D00) &
                                          (tx_byte_2_in == `XPCS_ENC_D00) &
                                          (tx_byte_3_in == `XPCS_ENC_D10) ;

always @ (posedge tx_clk)
    if (reset)
      q_det_local <= 1'b0;
    else
      q_det_local <= (q_detect_local) ? 1'b1 : (clr_q_det) ? 1'b0 : q_det_local;
 

assign q_detect_remote = tx_special_0_in & (tx_byte_0_in == `XPCS_ENC_SEQ) &
                                           (tx_byte_1_in == `XPCS_ENC_D00) &
                                           (tx_byte_2_in == `XPCS_ENC_D00) &
                                           (tx_byte_3_in == `XPCS_ENC_D20) ; 

always @ (posedge tx_clk)
    if (reset)
      q_det_remote <= 1'b0;
    else
      q_det_remote <= ((!link_status_tx) | q_detect_remote) ? 1'b1 :         
                                                 (clr_q_det) ? 1'b0 : q_det_remote;


assign q_detect = q_det_local | q_det_remote;


assign csr_transmit_fault_ref = q_detect;

// *******************************************************
// sop detection logic
// *******************************************************

assign xgmii_s_detect = tx_special_0_in & (tx_byte_0_in == `XPCS_ENC_SDP);

// *******************************************************
// data detection logic
// *******************************************************

assign xgmii_d_detect = (!tx_special_0_in) |
                        (!tx_special_1_in) |
                        (!tx_special_2_in) |
                        (!tx_special_3_in) &
                        ( link_status_tx & !xgmii_s_detect );

// ***************************************************************
//  Terminate detection  
// ***************************************************************

assign term_det_0 = tx_special_0_mux & (tx_byte_0_mux == `XPCS_ENC_EGP) &
                    tx_special_1_mux & (tx_byte_1_mux == `XPCS_ENC_IDL) &
                    tx_special_2_mux & (tx_byte_2_mux == `XPCS_ENC_IDL) &
                    tx_special_3_mux & (tx_byte_3_mux == `XPCS_ENC_IDL);

assign term_det_1 = tx_special_1_mux & (tx_byte_1_mux == `XPCS_ENC_EGP) &
                    tx_special_2_mux & (tx_byte_2_mux == `XPCS_ENC_IDL) &
                    tx_special_3_mux & (tx_byte_3_mux == `XPCS_ENC_IDL);

assign term_det_2 = tx_special_2_mux & (tx_byte_2_mux == `XPCS_ENC_EGP) &
                    tx_special_3_mux & (tx_byte_3_mux == `XPCS_ENC_IDL);

assign term_det_3 = tx_special_3_mux & (tx_byte_3_mux == `XPCS_ENC_EGP);


assign inc_tx_pkt_count_ref = term_det_0 | term_det_1 | term_det_2 | term_det_3 ;


// ***************************************************************
//  Idle detection
// ***************************************************************

assign idle_det_0 = tx_special_0_in & (tx_byte_0_in == `XPCS_ENC_IDL);
assign idle_det_1 = tx_special_1_in & (tx_byte_1_in == `XPCS_ENC_IDL);
assign idle_det_2 = tx_special_2_in & (tx_byte_2_in == `XPCS_ENC_IDL);
assign idle_det_3 = tx_special_3_in & (tx_byte_3_in == `XPCS_ENC_IDL);

assign i_detect = idle_det_0 & idle_det_1 & idle_det_2 & idle_det_3;

// ***************************************************************
// State Machine 48.2.6.2.1 ieee 802.3ae
// ***************************************************************

/* *************************************************************************
                   {n_state, n_clr_a_cnt, n_clr_q_det, n_sel_s
                    n_sel_d, n_sel_r, n_sel_k, n_sel_a, n_sel_q};
** *************************************************************************/

assign {nxt_state, 
        clr_a_cnt, 
        clr_q_det, 
        sel_s,
        sel_d, 
        sel_r,
        sel_k,
        sel_a,
        sel_q}   = transmit_fn (reset, 
                                align_count_exp,
                                code_sel_random, 
                                q_detect,
                                i_detect,
                                xgmii_s_detect,
                                xgmii_d_detect,
                                state);

function [11:0]  transmit_fn;

 input        reset;
 input        a_cnt;
 input        code_sel;
 input        q_det;
 input        i_det;
 input        s_det;
 input        d_det;
 input [3:0]  state;

 reg   [3:0]  n_state;

 reg          n_clr_a_cnt;
 reg          n_clr_q_det;

 reg          n_sel_d;
 reg          n_sel_a;
 reg          n_sel_k;
 reg          n_sel_r;
 reg          n_sel_q;
 reg          n_sel_s;

 reg          nxt_ifg;

 begin

  if (reset)
     begin

       n_clr_a_cnt = 1'b0;
       n_clr_q_det = 1'b0;

       n_sel_d     = 1'b0;
       n_sel_r     = 1'b0;
       n_sel_k     = 1'b0;
       n_sel_a     = 1'b0;
       n_sel_q     = 1'b0;
       n_sel_s     = 1'b0;

       nxt_ifg     = 1'b0;

       n_state = SEND_K;  // send K
    
     end

  else

     begin

       n_state = SEND_K;

       n_clr_a_cnt = 1'b0;

       n_clr_q_det = 1'b0;

       n_sel_d       = 1'b0;
       n_sel_r       = 1'b0;
       n_sel_k       = 1'b0;
       n_sel_a       = 1'b0;
       n_sel_q       = 1'b0;
       n_sel_s       = 1'b0;

       case (state)

         SEND_DATA  :  // 0 
           begin 
             n_sel_d  = 1'b1;
           
             if (i_det | q_det)
               begin
                 if (nxt_ifg & a_cnt)
                   n_state =  SEND_A;

                 else if (!nxt_ifg | !a_cnt)
                   n_state =  SEND_K;
               end
             else
               n_state     = SEND_DATA;

           end


         SEND_SDP :  //  1
           begin
             n_sel_s       = 1'b1;

             if (d_det)
               n_state     = SEND_DATA;
             else
               n_state     = UNDERRUN;

           end


         SEND_A :   //  2
           begin
             n_clr_a_cnt = 1'b1;
             n_sel_a     = 1'b1;  
             nxt_ifg     = 1'b0;    // select K next instead of A    

             if (q_det)
               n_state     = SEND_Q;

             else if (s_det)
               n_state     = SEND_SDP;
              
             else  
               n_state     = SEND_RANDOM_R;

           end

         SEND_K :   // 3
           begin
             n_sel_k   = 1'b1;  
             nxt_ifg   = 1'b1;    // select A next instead of K

             if (s_det)
               n_state     = SEND_SDP;

             else
               n_state     = SEND_RANDOM_R;  

           end

         SEND_Q :  // 4
           begin
             n_sel_q     = 1'b1;
             n_clr_q_det = 1'b1;

            if (s_det)
               n_state     = SEND_SDP;

            else
               n_state     = SEND_RANDOM_R;

           end

         SEND_RANDOM_R :  // 5
           begin
             n_sel_r       = 1'b1;

             if (s_det)
               n_state     = SEND_SDP;

             else if (code_sel & !a_cnt)
               n_state     = SEND_RANDOM_R;

             else if ((!code_sel) & !a_cnt)
               n_state     = SEND_RANDOM_K;

             else if (a_cnt)
               n_state     = SEND_RANDOM_A;

           end

         SEND_RANDOM_A :  // 6
           begin
             n_sel_a     = 1'b1;
             n_clr_a_cnt = 1'b1;

             if (s_det)
               n_state     = SEND_SDP;

             else if (q_det)
               n_state     = SEND_RANDOM_Q;

             else if (code_sel & !q_det)
               n_state     = SEND_RANDOM_R;

             else if ((!code_sel) & !q_det)
               n_state     = SEND_RANDOM_K;

           end


         SEND_RANDOM_K :  // 7 
           begin
             n_sel_k     = 1'b1;

             if (s_det)
               n_state     = SEND_SDP;

             else if (a_cnt)
               n_state     = SEND_RANDOM_A;

             else if (code_sel & !a_cnt)
               n_state     = SEND_RANDOM_R;

             else if ((!code_sel) & !a_cnt)
               n_state     = SEND_RANDOM_K;


           end


         SEND_RANDOM_Q  :  // 8
           begin
             n_sel_q     = 1'b1;
             n_clr_q_det = 1'b1;

             if (s_det)
               n_state     = SEND_SDP;

             else if (code_sel)
               n_state     = SEND_RANDOM_R;

             else if (!code_sel)
               n_state     = SEND_RANDOM_K;

           end

         UNDERRUN :  // 9 
           begin
              n_state     = SEND_A;
           end


        endcase

      end

     transmit_fn = {n_state, n_clr_a_cnt, n_clr_q_det, n_sel_s,
                    n_sel_d, n_sel_r, n_sel_k, n_sel_a, n_sel_q}; 

  end

endfunction


// State machine register

always @ (posedge tx_clk)
   if (reset)
       state <=  4'h0;
   else
       state <=  nxt_state;

// *******************************************************
//                 Data Path Pipeline
// *******************************************************

always @ (posedge tx_clk)
  begin
   tx_byte_0_in <= tx_byte_0;
   tx_byte_1_in <= tx_byte_1;
   tx_byte_2_in <= tx_byte_2;
   tx_byte_3_in <= tx_byte_3;
 end

always @ (posedge tx_clk)
  begin
   tx_special_0_in <= tx_special_0;
   tx_special_1_in <= tx_special_1;
   tx_special_2_in <= tx_special_2;
   tx_special_3_in <= tx_special_3;
  end

always @ (posedge tx_clk)
  begin
   tx_byte_0_int <= tx_byte_0_in;
   tx_byte_1_int <= tx_byte_1_in;
   tx_byte_2_int <= tx_byte_2_in;
   tx_byte_3_int <= tx_byte_3_in;
 end

always @ (posedge tx_clk)
  begin
   tx_special_0_int <= tx_special_0_in;
   tx_special_1_int <= tx_special_1_in;
   tx_special_2_int <= tx_special_2_in;
   tx_special_3_int <= tx_special_3_in;
  end


// *******************************************************
//     Data Path MUX and output register to Decoder
// *******************************************************

assign {tx_special_0_mux} = (sel_r | sel_k | sel_a) ? 1'b1 :
                                             sel_q  ? 1'b1 : {tx_special_0_int}; 

assign {tx_special_1_mux} = (sel_r | sel_k | sel_a) ? 1'b1 :         
                                             sel_q  ? 1'b0 : {tx_special_1_int};

assign {tx_special_2_mux} = (sel_r | sel_k | sel_a) ? 1'b1 :         
                                             sel_q  ? 1'b0 : {tx_special_2_int};

assign {tx_special_3_mux} = (sel_r | sel_k | sel_a) ? 1'b1 :         
                                             sel_q  ? 1'b0 : {tx_special_3_int};

assign tx_byte_0_mux  =  sel_s ? `XPCS_ENC_SDP :

                         sel_d ? tx_byte_0_int :

                         sel_r ? `XPCS_ENC_SKP :
                         sel_k ? `XPCS_ENC_COM :
                         sel_a ? `XPCS_ENC_ALG :

                         sel_q ? `XPCS_ENC_SEQ :

                         tx_byte_0_int ;


assign tx_byte_1_mux  = sel_s ? tx_byte_1_int  :

                        sel_d ? tx_byte_1_int  :

                        sel_r ? `XPCS_ENC_SKP  :
                        sel_k ? `XPCS_ENC_COM  :
                        sel_a ? `XPCS_ENC_ALG  :

                        sel_q ? `XPCS_ENC_D00  :

                        tx_byte_1_int ;


assign tx_byte_2_mux  = sel_s ? tx_byte_2_int :
             
                        sel_d ? tx_byte_2_int :

                        sel_r ? `XPCS_ENC_SKP :
                        sel_k ? `XPCS_ENC_COM :
                        sel_a ? `XPCS_ENC_ALG :

                        sel_q ? `XPCS_ENC_D00  :

                        tx_byte_2_int ;

assign tx_byte_3_mux  = sel_s ? tx_byte_3_int :

                        sel_d ? tx_byte_3_int :

                        sel_r ? `XPCS_ENC_SKP :
                        sel_k ? `XPCS_ENC_COM :
                        sel_a ? `XPCS_ENC_ALG :

                        sel_q & q_det_remote ? `XPCS_ENC_D20  :
                        sel_q & q_det_local  ? `XPCS_ENC_D10  :

                        tx_byte_3_int ;


always @ (posedge tx_clk)
  begin
   tx_byte_0_enc <= tx_test_enable ? test_byte : term_det_0 ? `XPCS_ENC_EGP : tx_byte_0_mux ;

   tx_byte_1_enc <= tx_test_enable ? test_byte : term_det_0 ? `XPCS_ENC_COM : 
                                                     term_det_1 ? `XPCS_ENC_EGP : tx_byte_1_mux ;

   tx_byte_2_enc <= tx_test_enable ? test_byte : term_det_0 ? `XPCS_ENC_COM : 
                                                     term_det_1 ? `XPCS_ENC_COM : 
                                                     term_det_2 ? `XPCS_ENC_EGP : tx_byte_2_mux ;

   tx_byte_3_enc <= tx_test_enable ? test_byte : term_det_0 ? `XPCS_ENC_COM : 
                                                     term_det_1 ? `XPCS_ENC_COM : 
                                                     term_det_2 ? `XPCS_ENC_COM : 
                                                     term_det_3 ? `XPCS_ENC_EGP : tx_byte_3_mux ; 
  end

always @ (posedge tx_clk)
  begin
   tx_special_0_enc <= tx_test_enable ? test_special : (term_det_0) ? 1'b1 : tx_special_0_mux ; 

   tx_special_1_enc <= tx_test_enable ? test_special : (term_det_0 | term_det_1) ? 1'b1 : tx_special_1_mux;

   tx_special_2_enc <= tx_test_enable ? test_special : (term_det_0 | term_det_1 | term_det_2) ? 1'b1 : tx_special_2_mux;

   tx_special_3_enc <= tx_test_enable ? test_special : 
                             (term_det_0 | term_det_1 | term_det_2 | term_det_3) ? 1'b1 : tx_special_3_mux;

  end




// ***************************************************************
//                     Randomizers
// ***************************************************************

xpcs_tx_randomizer xpcs_tx_randomizer_l (.tx_clk(tx_clk), 
                                         .reset(reset), 
                                         .align_count_exp(align_count_exp), 
                                         .clr_align_count(clr_a_cnt), 
                                         .code_sel(code_sel_random) );


// ****************************************************************
//  Test mode logic high/low/mixed frequency patterns per Annex 48A
//   ieee 802.3 ae
//  00 high freq, 01 low freq, 10 mixed freq.
// ****************************************************************

assign test_byte    = (test_pattern_sel == 2'b00) ? `XPCS_ENC_TTH :
                      (test_pattern_sel == 2'b01) ? `XPCS_ENC_TTL :
                      (test_pattern_sel == 2'b10) ? `XPCS_ENC_COM : `XPCS_ENC_COM;

assign test_special = (test_pattern_sel == 2'b00) ?  1'b0 :         // D21.5
                      (test_pattern_sel == 2'b01) ?  1'b1 :         // K28.7
                      (test_pattern_sel == 2'b10) ?  1'b1 : 1'b1 ;  // K28.5


// 0in state -var state -val SEND_DATA -next SEND_A SEND_K -clock tx_clk -reset reset
// 0in state -var state -val SEND_SDP -next SEND_DATA UNDERRUN SEND_K -clock tx_clk -reset reset
// 0in state -var state -val SEND_A -next SEND_RANDOM_R SEND_Q SEND_SDP SEND_K -clock tx_clk -reset reset
// 0in state -var state -val SEND_K -next SEND_RANDOM_R SEND_SDP SEND_K -clock tx_clk -reset reset
// 0in state -var state -val SEND_Q -next SEND_RANDOM_R SEND_SDP SEND_K -clock tx_clk -reset reset
// 0in state -var state -val SEND_RANDOM_R -next SEND_RANDOM_A SEND_RANDOM_K SEND_SDP SEND_K -clock tx_clk -reset reset
// 0in state -var state -val SEND_RANDOM_K -next SEND_RANDOM_A SEND_RANDOM_R SEND_SDP SEND_K -clock tx_clk -reset reset
// 0in state -var state -val SEND_RANDOM_Q -next SEND_RANDOM_K SEND_RANDOM_R SEND_SDP SEND_K -clock tx_clk -reset reset
// 0in state -var state -val SEND_RANDOM_A -next SEND_RANDOM_Q SEND_RANDOM_R SEND_RANDOM_K SEND_SDP SEND_K -clock tx_clk -reset reset
// 0in state -var state -val UNDERRUN -next SEND_A SEND_K -clock tx_clk -reset reset


endmodule
