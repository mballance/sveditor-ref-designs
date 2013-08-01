// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mmu_tsm_ctl.v
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
module mmu_tsm_ctl (
  l1clk, 
  scan_in, 
  spc_aclk, 
  spc_bclk, 
  data_rcvd_hw1, 
  tlb_miss_m, 
  tsb_done_hw2, 
  vld_tsbptr_m2, 
  thr_valid_m1, 
  thr_valid_m0, 
  cindex_bit0, 
  cindex_bit1, 
  hwtw_burst, 
  trs_eperr_st, 
  trs_eccerr_st, 
  tsm_tsb_miss_hw2, 
  tsm_rqv, 
  tsm_waitfortte, 
  scan_out);
wire siclk;
wire soclk;
wire [1:0] cindex;
wire goto_null_state;
wire null_state;
wire validreq_state;
wire seqm1_state;
wire seqm2_state;
wire cfgdone_state;
wire ttewait_state;
wire next_null_state;
wire next_null_state_;
wire null_state_;
wire null_state_reg_scanin;
wire null_state_reg_scanout;
wire goto_validreq_state;
wire outstanding_miss_state;
wire next_validreq_state;
wire validreq_state_reg_scanin;
wire validreq_state_reg_scanout;
wire goto_seqm1_state;
wire next_seqm1_state;
wire seqm1_state_reg_scanin;
wire seqm1_state_reg_scanout;
wire goto_seqm2_state;
wire next_seqm2_state;
wire seqm2_state_reg_scanin;
wire seqm2_state_reg_scanout;
wire goto_cfgdone_state;
wire next_cfgdone_state;
wire cfgdone_state_reg_scanin;
wire cfgdone_state_reg_scanout;
wire goto_ttewait_state;
wire next_ttewait_state;
wire ttewait_state_reg_scanin;
wire ttewait_state_reg_scanout;
wire goto_outstanding_miss_state;
wire next_outstanding_miss_state;
wire outstanding_miss_state_reg_scanin;
wire outstanding_miss_state_reg_scanout;
wire data_rcvd_lat_scanin;
wire data_rcvd_lat_scanout;
wire data_rcvd_hw1_ff;
wire req_enq;
wire req_deq;
wire [3:0] next_bal;
wire [3:0] bal;
wire bal_lat_scanin;
wire bal_lat_scanout;


input           l1clk;
input           scan_in;
input		spc_aclk;
input		spc_bclk;

input           data_rcvd_hw1;       // data back from gkt, from htc
input           tlb_miss_m;             // indicates tlb miss, from htc
input           tsb_done_hw2;              // indicates tsb hit, from htc
input           vld_tsbptr_m2;              // indicates valid tsbptr
input           thr_valid_m1;       // valid req in M1 which got asi grant and room avail
input           thr_valid_m0;       // valid req in M0

input           cindex_bit0;
input           cindex_bit1;


input           hwtw_burst;         // hwtw is in burst mode

                                      // mra read, and data available.  
input           trs_eperr_st;         // trs is in ep miss err state

input           trs_eccerr_st;         // trs is in eccerr state

output          tsm_tsb_miss_hw2;    // no tsb hit on any of the 4 tsb 
output          tsm_rqv;         // request is valid, in REQ or CFG_RD
output          tsm_waitfortte;       // all tte not received
output          scan_out;

assign siclk	= spc_aclk;
assign soclk	= spc_bclk;



assign cindex[1:0] = {cindex_bit1, cindex_bit0};

///////////////////////////////////////////////////
// CASE STATEMENT DESCRIPTION OF TSM MACHINE
///////////////////////////////////////////////////

// tsb_done_hw2 = tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4;
//case(`TSM_STATE)
//  `NULL_ST:
//    if (~tlb_miss_m) 
//      next_state = `NULL_ST;
//    else 
//      next_state = `VALIDREQ_ST;
//
//  `VALIDREQ_ST:
//    begin
//        if ((tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) & ~tsm_waitfortte)
//          next_state = `NULL_ST;
//        if ((tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) & tsm_waitfortte)
//          next_state = `TTEWAIT_ST;
//        if (~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) & burst_mode & (~(cindex[1:0] ==2'b11 & thr_valid_m1)))
//          next_state = `VALIDREQ_ST;
//        if (~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) & ~burst_mode & ~thr_valid_m0)
//          next_state = `VALIDREQ_ST;
//        if (~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) & ~burst_mode & thr_valid_m0)
//          next_state = `SEQM1_ST;
//        if (~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) & (cindex[1:0] ==2'b11 & thr_valid_m1))
//          next_state = `CFGDONE_ST;
//    end
//  
//  `SEQM1_ST:
//    begin
//        if ((tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) & ~tsm_waitfortte)
//          next_state = `NULL_ST;
//        if ((tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) & tsm_waitfortte)
//          next_state = `TTEWAIT_ST;
//        if (~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) & ~thr_valid_m1)
//          next_state = `VALIDREQ_ST;
//        if (~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) & thr_valid_m1 & (cindex[1:0] ==2'b11))
//          next_state = `CFGDONE_ST;
//        if (~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) & thr_valid_m1 & ~(cindex[1:0] ==2'b11))
//          next_state = `SEQM2_ST;
//    end
//
//  `SEQM2_ST:
//    begin
//        if ((tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) & ~tsm_waitfortte)
//          next_state = `NULL_ST;          
//        if ((tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) & tsm_waitfortte)
//          next_state = `TTEWAIT_ST;
//        if (~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) & ~tsm_waitfortte)
//          next_state = `VALIDREQ_ST;
//        if (~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) & tsm_waitfortte)
//          next_state = `SEQM2_ST;
//    end
//
//  `CFGDONE_ST:
//    begin
//        if (~tsm_waitfortte)
//          next_state = `NULL_ST;
//        if ((tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) & tsm_waitfortte)
//          next_state = `TTEWAIT_ST;
//        if (~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) & tsm_waitfortte)
//          next_state = `CFGDONE_ST;
//    end
//
//  `TTEWAIT_ST:
//    begin
//        if (tlb_miss_m)
//          next_state = `OUTMISSWAIT_ST;
//        if (~tsm_waitfortte & ~tlb_miss_m)
//          next_state = `NULL_ST;
//        if (tsm_waitfortte & ~tlb_miss_m)
//          next_state = `TTEWAIT_ST;
//    end
//
//  `OUTMISSWAIT_ST:
//    begin
//        if (tsm_waitfortte)
//          next_state = `OUTMISSWAIT_ST;
//        else
//          next_state = `VALIDREQ_ST;
//    end
//endcase // case(`TSM_STATE)

        
  
// 0in one_hot -var {null_state,validreq_state,seqm1_state,seqm2_state,cfgdone_state,ttewait_state,outstanding_miss_state}
///////////////////////////////////////////////////
// Null State (NULL_ST)
///////////////////////////////////////////////////
// Goto null state if either of following is true
// => NULL_ST     and  no tlb miss 
// => VALIDREQ_ST and (tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) and no outstanding tte
// => SEQM1_ST and (tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) and all  no outstanding tte
// => SEQM2_ST and (tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) and all  no outstanding tte
// => CFGDONE_ST  and no outstanding tte
// => TTEWAIT_ST  and no tlb miss and no outstanding tte

// Leave null state if either of following is true
// => tlb miss occurs (goto validreq state)

assign goto_null_state = (null_state & ~tlb_miss_m) |
                         (validreq_state & tsb_done_hw2 & ~tsm_waitfortte) |
                         (seqm1_state & tsb_done_hw2 & ~tsm_waitfortte) |
                         (seqm2_state & tsb_done_hw2 & ~tsm_waitfortte) |
                         (cfgdone_state & ~tsm_waitfortte) | //irrespective of tsb_hit_hw2
                         (ttewait_state & ~tsm_waitfortte & ~tlb_miss_m);

assign next_null_state = goto_null_state;
assign next_null_state_ = ~next_null_state;
assign null_state = ~null_state_;

mmu_tsm_ctl_msff_ctl_macro__width_1 null_state_reg  (
 .scan_in(null_state_reg_scanin),
 .scan_out(null_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_null_state_),
 .dout (null_state_),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////
// Valid Req State (VALIDREQ_ST)
///////////////////////////////////////////////////
// Goto valid req. state if either of following is true
// => VALIDREQ_ST      and ~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) and burst mode and all tsb cfg not read
// => VALIDREQ_ST      and ~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) and ~burst mode and current thread not selected
// => SEQM1_ST         and ~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) and ~thr_valid_m1 (req did not get a grant from asi).
// => SEQM2_ST         and ~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) and no outstanding tte
// => NULL_ST          and tlb_miss_m
// => OUTMISSWAIT_ST   and no outstanding tte 

// Leave valid req. state if either of following is true
// => VALIDREQ_ST and (tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) (go to NULL_ST or TTEWAIT_ST)  
// => VALIDREQ_ST and all req are read (go to CFGDONE_ST)
// => VALIDREQ_ST and not burst mode and current thread selected (thr_valid_m0) (go to SEQM1_ST)

assign goto_validreq_state = (validreq_state & ~tsb_done_hw2 & hwtw_burst & ~(cindex[1] & cindex[0] & thr_valid_m1)) |
                             (validreq_state & ~tsb_done_hw2 & ~hwtw_burst & ~thr_valid_m0) | 
                             (seqm1_state & ~tsb_done_hw2 & ~thr_valid_m1) |
                             (seqm2_state & ~tsb_done_hw2 & ~tsm_waitfortte) |
                             (null_state & tlb_miss_m) | 
                             (outstanding_miss_state & ~tsm_waitfortte);
assign next_validreq_state = goto_validreq_state;


mmu_tsm_ctl_msff_ctl_macro__width_1 validreq_state_reg  (
 .scan_in(validreq_state_reg_scanin),
 .scan_out(validreq_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_validreq_state),
 .dout (validreq_state),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////
// Sequential M1 State (SEQM1_ST)
///////////////////////////////////////////////////
// Goto sequential M1 state if either of following is true
// => VALIDREQ_ST      and ~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) and not burst mode and current thread selected

// Leave sequential M1 state if either of following is true
// => SEQM1_ST and (tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) (go to NULL_ST or TTEWAIT_ST)  
// => SEQM1_ST and ~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) and ~thr_valid_m1 (req was not granted), (go to VALIDREQ_ST)
// => SEQM1_ST and ~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) and thr_valid_m1 (go to SEQM2_ST or CFGDONE_ST)

assign goto_seqm1_state = (validreq_state & ~tsb_done_hw2 & ~hwtw_burst & thr_valid_m0);
assign next_seqm1_state = goto_seqm1_state;


mmu_tsm_ctl_msff_ctl_macro__width_1 seqm1_state_reg  (
 .scan_in(seqm1_state_reg_scanin),
 .scan_out(seqm1_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_seqm1_state),
 .dout (seqm1_state),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////
// Sequential M2 State (SEQM2_ST)
///////////////////////////////////////////////////
// Goto sequential M2 state if either of following is true
// => SEQM1_ST      and ~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) and thr_valid_m1 & all cfg not read
// => SEQM2_ST      and ~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) and outstanding tte

// Leave sequential M2 state if either of following is true
// => SEQM2_ST and (tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) (go to NULL_ST or TTEWAIT_ST)  
// => SEQM2_ST and ~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) and no outstanding tte (go to VALIDREQ_ST)

assign goto_seqm2_state = (seqm1_state & ~tsb_done_hw2 & thr_valid_m1 & ~(cindex[1] & cindex[0])) |
                          (seqm2_state & ~tsb_done_hw2 & tsm_waitfortte);
assign next_seqm2_state = goto_seqm2_state;


mmu_tsm_ctl_msff_ctl_macro__width_1 seqm2_state_reg  (
 .scan_in(seqm2_state_reg_scanin),
 .scan_out(seqm2_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_seqm2_state),
 .dout (seqm2_state),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////
// AllConfigRead State (CFGDONE_ST)
///////////////////////////////////////////////////
// Goto all TSB read state if either of following is true
// => VALIDREQ_ST  and burst mode and ~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) & all cfg read
// => SEQM1_ST     and  ~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) & all cfg read
// => CFGDONE_ST   and ~(tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) and outstanding tte

// Leave all CFG read state if either of following is true
// => CFGDONE_ST and all  no outstanding TTE (go to NULL_ST)
// => CFGDONE_ST and TSB hit and outstanding TTE (go to TTEWAIT_ST)

assign goto_cfgdone_state =  (cfgdone_state & ~tsb_done_hw2 & tsm_waitfortte) |
                             (validreq_state & ~tsb_done_hw2 & hwtw_burst & cindex[1] & cindex[0] & thr_valid_m1) |
                             (seqm1_state & ~tsb_done_hw2  & cindex[1] & cindex[0] & thr_valid_m1);


assign next_cfgdone_state = goto_cfgdone_state;


mmu_tsm_ctl_msff_ctl_macro__width_1 cfgdone_state_reg  (
 .scan_in(cfgdone_state_reg_scanin),
 .scan_out(cfgdone_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_cfgdone_state),
 .dout (cfgdone_state),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////
// TTE Wait State (TTEWAIT_ST)
// go to this state on (tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4).
///////////////////////////////////////////////////
// Goto TTEWAIT_ST state if either of following is true
// => TTEWAIT_ST     and no tlb miss and outstanding tte
// => VALIDREQ_ST    and (tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) and outstanding tte
// => SEQM1_ST       and (tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) and outstanding tte
// => SEQM2_ST       and (tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) and outstanding tte
// => CFGDONE_ST     and (tsb_hit_hw2|ep_miss_hw2|l2_ecc_err_hw2|cfg_ecc_err_m4) and outstanding tte

// Leave TTEWAIT_ST state if either of following is true
// => TTEWAIT_ST and tlb miss (go to OUTMISSWAIT_ST)
// => TTEWAIT_ST and no tlb miss and no outstanding tte (go to NULL_ST)

assign goto_ttewait_state =  (ttewait_state & ~tlb_miss_m & tsm_waitfortte) |
                             (validreq_state & tsb_done_hw2 & tsm_waitfortte) |
                             (seqm1_state & tsb_done_hw2 & tsm_waitfortte) |
                             (seqm2_state & tsb_done_hw2 & tsm_waitfortte) |
                             (cfgdone_state & tsb_done_hw2 & tsm_waitfortte);

assign next_ttewait_state = goto_ttewait_state;


mmu_tsm_ctl_msff_ctl_macro__width_1 ttewait_state_reg  (
 .scan_in(ttewait_state_reg_scanin),
 .scan_out(ttewait_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_ttewait_state),
 .dout (ttewait_state),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////
// Outstanding Miss State (OUTMISSWAIT_ST)
//  Indicates TTEWAIT_ST and a  tlb_miss_m (can happen when we
// have a tsb  hit, thread gets restarted, but all tte's are not done for
// the original miss)
///////////////////////////////////////////////////
// Goto all OUTMISSWAIT_ST if either of following is true
// => OUTMISSWAIT_ST   and not all  TTE received (tsm_waitfortte)
// => TTEWAIT_ST       and tlb_miss_m

assign goto_outstanding_miss_state = (outstanding_miss_state & tsm_waitfortte) |
                                     (ttewait_state & tlb_miss_m);

assign next_outstanding_miss_state = goto_outstanding_miss_state;


mmu_tsm_ctl_msff_ctl_macro__width_1 outstanding_miss_state_reg  (
 .scan_in(outstanding_miss_state_reg_scanin),
 .scan_out(outstanding_miss_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_outstanding_miss_state),
 .dout (outstanding_miss_state),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////
// End of State machine
///////////////////////////////////////////////////

///////////////////////////////////////////////////
// EnQ/DeQ TTEs
// Keeping track of outstanding TTE requests.
// Increment the counter on every request  sent out (vld_tsbptr_m2),
// Decrement the counter on every data recvd, (data_rcvd_hw1)
///////////////////////////////////////////////////
mmu_tsm_ctl_msff_ctl_macro__width_1 data_rcvd_lat  (
 .scan_in(data_rcvd_lat_scanin),
 .scan_out(data_rcvd_lat_scanout),
 .l1clk(l1clk),
 .din  (data_rcvd_hw1),
 .dout (data_rcvd_hw1_ff),
  .siclk(siclk),
  .soclk(soclk)
);
assign req_enq = vld_tsbptr_m2 & ~data_rcvd_hw1_ff;
assign req_deq = data_rcvd_hw1_ff & ~vld_tsbptr_m2;

//0in bits_on -var {req_enq, req_deq} -max 1;
assign next_bal[3:0] = ({4{req_enq & ~bal[3] & ~bal[2] & ~bal[1] & ~bal[0]}} & 4'b0001) |
                       ({4{req_enq & ~bal[3] & ~bal[2] & ~bal[1] &  bal[0]}} & 4'b0011) |
                       ({4{req_enq & ~bal[3] & ~bal[2] &  bal[1] &  bal[0]}} & 4'b0111) |
                       ({4{req_enq & ~bal[3] &  bal[2] &  bal[1] &  bal[0]}} & 4'b1111) |
                       ({4{req_deq &  bal[3] &  bal[2] &  bal[1] &  bal[0]}} & 4'b0111) |
                       ({4{req_deq & ~bal[3] &  bal[2] &  bal[1] &  bal[0]}} & 4'b0011) |
                       ({4{req_deq & ~bal[3] & ~bal[2] &  bal[1] &  bal[0]}} & 4'b0001) |
                       ({4{req_deq & ~bal[3] & ~bal[2] & ~bal[1] &  bal[0]}} & 4'b0000) |
                       ({4{~req_deq & ~req_enq}} & bal[3:0]);

mmu_tsm_ctl_msff_ctl_macro__width_4 bal_lat  (
 .scan_in(bal_lat_scanin),
 .scan_out(bal_lat_scanout),
 .l1clk(l1clk),
 .din  ({next_bal[3:0]}),
 .dout ({bal[3:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////
// State Machine Outputs
///////////////////////////////////////////////////
assign tsm_tsb_miss_hw2 = ~tsm_waitfortte & cfgdone_state & ~tsb_done_hw2  & ~trs_eccerr_st & ~trs_eperr_st;
assign tsm_rqv = validreq_state;
assign tsm_waitfortte = |next_bal[3:0];


supply0 vss;
supply1 vdd;

// fixscan start:
assign null_state_reg_scanin     = scan_in                  ;
assign validreq_state_reg_scanin = null_state_reg_scanout   ;
assign seqm1_state_reg_scanin    = validreq_state_reg_scanout;
assign seqm2_state_reg_scanin    = seqm1_state_reg_scanout  ;
assign cfgdone_state_reg_scanin  = seqm2_state_reg_scanout  ;
assign ttewait_state_reg_scanin  = cfgdone_state_reg_scanout;
assign outstanding_miss_state_reg_scanin = ttewait_state_reg_scanout;
assign data_rcvd_lat_scanin      = outstanding_miss_state_reg_scanout;
assign bal_lat_scanin            = data_rcvd_lat_scanout    ;
assign scan_out                  = bal_lat_scanout          ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module mmu_tsm_ctl_msff_ctl_macro__width_1 (
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













// any PARAMS parms go into naming of macro

module mmu_tsm_ctl_msff_ctl_macro__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule








