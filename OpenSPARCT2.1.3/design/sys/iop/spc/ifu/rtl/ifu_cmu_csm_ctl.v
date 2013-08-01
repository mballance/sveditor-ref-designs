// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_cmu_csm_ctl.v
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
module ifu_cmu_csm_ctl (
  l1clk, 
  scan_in, 
  spc_aclk, 
  spc_bclk, 
  ftu_cmiss, 
  ftu_redirect, 
  ftu_inv_req, 
  lsc_l15_valid, 
  mct_fill_complete, 
  cmu_data_ready, 
  cmu_has_dup_miss, 
  cmu_mbhit_c, 
  mct_rst_dupmiss, 
  mct_ignore_cmiss, 
  mdp_mbhit_q, 
  csm_valid_req, 
  cmu_null_st, 
  cmu_dupmiss_st, 
  cmu_req_st, 
  cmu_canleave_st, 
  scan_out) ;
wire siclk;
wire soclk;
wire inv_req_reg_scanin;
wire inv_req_reg_scanout;
wire inv_req_ff;
wire redirect_reg_scanin;
wire redirect_reg_scanout;
wire ftu_redirect_lat;
wire go_to_null_state;
wire null_state;
wire req_state;
wire canleave_state;
wire fillwait_state;
wire dupmiss_state;
wire invreq_state;
wire next_null_state_;
wire null_state_;
wire null_state_reg_scanin;
wire null_state_reg_scanout;
wire go_to_req_state;
wire next_req_state;
wire req_state_reg_scanin;
wire req_state_reg_scanout;
wire go_to_canleave_state;
wire next_canleave_state;
wire canleave_state_reg_scanin;
wire canleave_state_reg_scanout;
wire go_to_retwait_state;
wire retwait_state;
wire next_retwait_state;
wire retwait_state_reg_scanin;
wire retwait_state_reg_scanout;
wire go_to_fillwait_state;
wire next_fillwait_state;
wire fillwait_state_reg_scanin;
wire fillwait_state_reg_scanout;
wire go_to_dupmiss_state;
wire next_dupmiss_state;
wire dupmiss_state_reg_scanin;
wire dupmiss_state_reg_scanout;
wire go_to_invreq_state;
wire next_invreq_state;
wire invreq_state_reg_scanin;
wire invreq_state_reg_scanout;


input l1clk;
input scan_in;
input spc_aclk;
input spc_bclk;

input ftu_cmiss;            // cmiss request
input ftu_redirect;         // indicates the thread is flushed/redirected
input ftu_inv_req;          // invalidation request
input lsc_l15_valid;        // req sent to gkt
input mct_fill_complete;    // indicates that fill has been completed

input cmu_data_ready;       // gkt rtn data and is ready to be written to I$
input cmu_has_dup_miss;     // from MB ctl logic, current thread has outstanding duplicate miss.
input cmu_mbhit_c;          // from MB ctl logic, current thread hits in missbuff, it is not real miss

input mct_rst_dupmiss;      // comes on with data_ready, all dup miss waiting on current thread are reset.
input mct_ignore_cmiss;     // current cmiss is a duplicate miss which needs to be ignored, data sent to I$.
input mdp_mbhit_q;          // A qualified mbhit


output csm_valid_req;         // valid request indicator
output cmu_null_st;
output    cmu_dupmiss_st;
output    cmu_req_st;
output    cmu_canleave_st;

   

output scan_out;

// scan renames
assign siclk = spc_aclk;
assign soclk = spc_bclk;
// end scan


// flop inv_req.
// It means that inv_req will not take part in arbitration for
// two cycles after it arrives.
ifu_cmu_csm_ctl_msff_ctl_macro__width_1 inv_req_reg  (
 .scan_in(inv_req_reg_scanin),
 .scan_out(inv_req_reg_scanout),
 .l1clk(l1clk),
 .din  (ftu_inv_req),
 .dout (inv_req_ff),
  .siclk(siclk),
  .soclk(soclk)
);

// flop ftu_redirect
// use the delayed version for qualifying valid req.
// clearing of wom bits in mct should also use delayed version.
// use raw version to clear dup miss states

ifu_cmu_csm_ctl_msff_ctl_macro__width_1 redirect_reg  (
 .scan_in(redirect_reg_scanin),
 .scan_out(redirect_reg_scanout),
 .l1clk(l1clk),
 .din  (ftu_redirect),
 .dout (ftu_redirect_lat),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////
// CASE STATEMENT DESCRIPTION OF TSM MACHINE
///////////////////////////////////////////////////
//case(`CSM_STATE)
//  `NULL_ST:
//    if (~(ftu_cmiss & ~mct_ignore_cmiss) & ~inv_req_ff)
//      next_state = `NULL_ST;
//    if (ftu_cmiss & ~cmu_mbhit_c)
//      next_state = `REQ_ST;
//    if (ftu_cmiss & cmu_mbhit_c & ~ignore_cmiss)
//      next_state = `DUPMISS_ST;
//    if (inv_req_ff)
//      next_state = `INVREQ_ST;
//
//  `REQ_ST:
//    if (lsc_l15_valid)
//      next_state = `RETWAIT_ST;
//    if (~lsc_l15_valid & ftu_redirect_lat & cmu_has_dup_miss)
//      next_state = `CANLEAVE_ST;
//    if (~lsc_l15_valid & ftu_redirect_lat & ~cmu_has_dup_miss & mdp_mbhit_q)
//      next_state = `CANLEAVE_ST;
//    if (~lsc_l15_valid & ftu_redirect_lat & ~cmu_has_dup_miss & ~mdp_mbhit_q)
//      next_state = `NULL_ST;
//    if (~lsc_l15_valid & ~ftu_redirect_lat)
//      next_state = `REQ_ST;
//
//  `CANLEAVE_ST:
//    if (lsc_l15_valid)
//      next_state = `RETWAIT_ST;
//    if (~lsc_l15_valid & ~cmu_has_dup_miss & ~mdp_mbhit_q)
//      next_state = `NULL_ST;
//    if (~lsc_l15_valid & cmu_has_dup_miss)
//      next_state = `CANLEAVE_ST;
//    if (~lsc_l15_valid & mdp_mbhit_q)
//      next_state = `CANLEAVE_ST;
//
//  `RETWAIT_ST:
//    if (~cmu_data_ready)
//      next_state = `RETWAIT_ST;
//    if (cmu_data_ready)
//      next_state = `FILLWAIT_ST;
//
//  `FILLWAIT_ST:
//    if (~mct_fill_complete)
//      next_state = `FILLWAIT_ST;
//    if (mct_fill_complete)
//      next_state = `NULL_ST;
//
//  `DUPMISS_ST:
//    if (~ftu_redirect & ~mct_rst_dupmiss)
//      next_state = `DUPMISS_ST;
//    if (ftu_redirect | mct_rst_dupmiss)
//      next_state = `NULL_ST;
//
//  `INVREQ_ST:
//    if (lsc_l15_valid)
//      next_state = `NULL_ST;
//    if (~lsc_l15_valid)
//      next_state = `INVREQ_ST;
//
// endcase
//
// 

// 0in one_hot -var {null_state,req_state,canleave_state,retwait_state,fillwait_state,dupmiss_state,invreq_state}
////////////////////////////////////////////////////////
// NULL STATE
////////////////////////////////////////////////////////
// cmu_mbhit_c indicates a duplicate miss
// ignore_cmiss indicates a duplicate miss which needs to be ignored
//
// null_st is default state.
// 
assign go_to_null_state = (null_state & ~(ftu_cmiss & ~mct_ignore_cmiss) & ~inv_req_ff)  | 
                          (req_state & ~lsc_l15_valid & ftu_redirect_lat & ~cmu_has_dup_miss & ~mdp_mbhit_q) |
                          (canleave_state & ~lsc_l15_valid & ~cmu_has_dup_miss & ~mdp_mbhit_q) |
                          (fillwait_state & mct_fill_complete)  |
                          (dupmiss_state & (ftu_redirect | mct_rst_dupmiss)) |
                          (invreq_state & lsc_l15_valid);

assign next_null_state_ = ~go_to_null_state;

assign null_state       = ~null_state_;

ifu_cmu_csm_ctl_msff_ctl_macro__width_1 null_state_reg  (
 .scan_in(null_state_reg_scanin),
 .scan_out(null_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_null_state_),
 .dout (null_state_),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////
// REQUEST STATE
////////////////////////////////////////////////////////
// Go to request state on a real miss
// Stay in request state until the request is sent out or redirect.
assign go_to_req_state  = (null_state & ftu_cmiss & ~cmu_mbhit_c) | 
                          (req_state & ~lsc_l15_valid & ~ftu_redirect_lat) ;

assign next_req_state   = go_to_req_state;

ifu_cmu_csm_ctl_msff_ctl_macro__width_1 req_state_reg  (
 .scan_in(req_state_reg_scanin),
 .scan_out(req_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_req_state),
 .dout (req_state),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////
// CANLEAVE STATE
////////////////////////////////////////////////////////
// Go to canleave_st when a real miss is flushed, but it has
// other outstanding duplicate misses waiting on it.
// Leave canleave_st when the request is sent out, or it has no
// other duplicate misses waiting on it (This can happen if
// all duplicate misses get flushed out).
assign go_to_canleave_state = (req_state & ftu_redirect_lat & cmu_has_dup_miss & ~lsc_l15_valid) |
                              (req_state & ftu_redirect_lat & mdp_mbhit_q & ~lsc_l15_valid) |
                              (canleave_state & cmu_has_dup_miss & ~lsc_l15_valid) |
                              (canleave_state & mdp_mbhit_q & ~lsc_l15_valid);

assign next_canleave_state = go_to_canleave_state;

ifu_cmu_csm_ctl_msff_ctl_macro__width_1 canleave_state_reg  (
 .scan_in(canleave_state_reg_scanin),
 .scan_out(canleave_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_canleave_state),
 .dout (canleave_state),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////
// Return Wait State
////////////////////////////////////////////////////////
// Go to return wait state when a request is sent to gkt/xbar.
// Stay in this state until data comes back and data_ready is
// signalled to ifu.
assign go_to_retwait_state  = (req_state & lsc_l15_valid) | 
                              (canleave_state & lsc_l15_valid) |
                              (retwait_state & ~cmu_data_ready);

assign next_retwait_state   = go_to_retwait_state;


ifu_cmu_csm_ctl_msff_ctl_macro__width_1 retwait_state_reg  (
 .scan_in(retwait_state_reg_scanin),
 .scan_out(retwait_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_retwait_state),
 .dout (retwait_state),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////
// Fill Wait State
////////////////////////////////////////////////////////
// Fillwait_st indicates that data_ready has been sent, wait
// until fill_complete is  signalled by ifu
assign go_to_fillwait_state = (retwait_state & cmu_data_ready ) | 
                              (fillwait_state & ~mct_fill_complete);
assign next_fillwait_state  = go_to_fillwait_state;

ifu_cmu_csm_ctl_msff_ctl_macro__width_1 fillwait_state_reg  (
 .scan_in(fillwait_state_reg_scanin),
 .scan_out(fillwait_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_fillwait_state),
 .dout (fillwait_state),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////
// DupMiss State
////////////////////////////////////////////////////////
// go to dupmiss_st on a dup miss.
assign go_to_dupmiss_state = (null_state & ftu_cmiss & cmu_mbhit_c & ~mct_ignore_cmiss) |
                             (dupmiss_state & ~ftu_redirect & ~mct_rst_dupmiss);

assign next_dupmiss_state = go_to_dupmiss_state;

ifu_cmu_csm_ctl_msff_ctl_macro__width_1 dupmiss_state_reg  (
 .scan_in(dupmiss_state_reg_scanin),
 .scan_out(dupmiss_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_dupmiss_state),
 .dout (dupmiss_state),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////
// INVREQ STATE
////////////////////////////////////////////////////////
// go to invreq state on a invalidation request.
assign go_to_invreq_state = (null_state & inv_req_ff) |
                            (invreq_state & ~lsc_l15_valid);

assign next_invreq_state = go_to_invreq_state;

ifu_cmu_csm_ctl_msff_ctl_macro__width_1 invreq_state_reg  (
 .scan_in(invreq_state_reg_scanin),
 .scan_out(invreq_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_invreq_state),
 .dout (invreq_state),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////
// State Machine output signals
////////////////////////////////////////////////////////
// csm_valid_req indicates that a valid request exists which
// takes part in arbitration
// If a request was sent out previous cycle, then the thread
// will still be in REQ state this cycle. Validreq will still come
// on for this thread, but it will get killed in lsi_ctl before
// it takes part in arbitration.

// To ease timing, mbhit_q is not used to generate the valid req.
// valid_req comes on if
//  1. in req state, and no flush or has_dup_miss.
//     if a flush happens and there are no dup misses, then the thread
//     will not take part in arb, even though a new dup miss could be
//     happening at the same time. The new dup miss will show up in
//     can_leave state the next cycle.
// 2.  in canleave state and has_dup_miss. Again, if in canleave state
//     and no dup miss, then thread will not take part in arb even though
//     a dup miss could be happening in same cycle. The dup miss will
//     force the state the stay in can_leave and it will set the has_dup
//     signal next cycle. So the thread will take part in arb next cycle.
// 3.  In inv_req state.


assign csm_valid_req = (req_state & ~(ftu_redirect_lat & ~cmu_has_dup_miss)) |
                       (canleave_state & cmu_has_dup_miss) |
                       (invreq_state);  


// cmu_cmiss_is_sent
// Indicates that a request has been sent.
// This signal serves two purposes:
// 1. used in conjunction with has_dup_miss in msb_ctl and ifu_ftu to
//    qualify missbuffer hits.
//    If a parent thread has not been sent, and it has a redirect, and
//    it does not have other dup misses outstanding, then an incoming
//    thread cannot hit on it.
// 2. Used by ifu to get out of no_new_miss state.
//assign cmu_cmiss_is_sent = lsc_l15_valid | retwait_state | fillwait_state;

// wom_valid bit for each thread comes on when the thread is in dupmiss_st or the req
// has been sent and thread has not been redirected.
// wom_valid is used to qualify bypass for the thread. 
// Bypass to a thread only if its wom_valid bit is set.
// dup WOM bit is not reset if there is redirect and req. is already sent. In this scenario,
// bypass is not valid. Hence generating this wom_valid signal to ignore the wom bit.

//assign csm_wom_valid = ~null_state & ~reqredirect_state ;

assign cmu_null_st = null_state;
assign cmu_dupmiss_st = dupmiss_state;
assign cmu_req_st = req_state;
assign cmu_canleave_st = canleave_state;

   
supply0 vss;
supply1 vdd;
// fixscan start:
assign inv_req_reg_scanin        = scan_in                  ;
assign redirect_reg_scanin       = inv_req_reg_scanout      ;
assign null_state_reg_scanin     = redirect_reg_scanout     ;
assign req_state_reg_scanin      = null_state_reg_scanout   ;
assign canleave_state_reg_scanin = req_state_reg_scanout    ;
assign retwait_state_reg_scanin  = canleave_state_reg_scanout;
assign fillwait_state_reg_scanin = retwait_state_reg_scanout;
assign dupmiss_state_reg_scanin  = fillwait_state_reg_scanout;
assign invreq_state_reg_scanin   = dupmiss_state_reg_scanout;
assign scan_out                  = invreq_state_reg_scanout ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module ifu_cmu_csm_ctl_msff_ctl_macro__width_1 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule








