// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mmu_trs_ctl.v
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
module mmu_trs_ctl (
  l1clk, 
  scan_in, 
  spc_aclk, 
  spc_bclk, 
  tsb_hit_hw1, 
  thr_valid_hw3, 
  ra2pahit_hw5, 
  ranotpax_hw5, 
  tsm_waitfortte, 
  ep_miss_hw1, 
  rrindex_bit0, 
  rrindex_bit1, 
  l2_ecc_err_hw1, 
  cfg_ecc_err_m3, 
  rr_ecc_err_hw5, 
  l2_ecc_err_type, 
  cfg_ecc_err_type, 
  rr_ecc_err_type, 
  cfg_ecc_err_index, 
  rr_ecc_err_index, 
  trs_rqv, 
  trs_null_st, 
  trs_waitrr3_st, 
  trs_ecc_err, 
  trs_ep_err, 
  trs_err_type, 
  trs_err_index, 
  trs_eccerr_st, 
  trs_eperr_st, 
  scan_out);
wire siclk;
wire soclk;
wire [1:0] rrindex;
wire goto_null_state;
wire null_state;
wire ignorette_state;
wire eperr_state;
wire eccerr_state;
wire next_null_state;
wire next_null_state_;
wire null_state_;
wire null_state_reg_scanin;
wire null_state_reg_scanout;
wire goto_validreq_state;
wire validreq_state;
wire next_validreq_state;
wire validreq_state_reg_scanin;
wire validreq_state_reg_scanout;
wire goto_waitrr2_state;
wire next_waitrr2_state;
wire waitrr2_state_reg_scanin;
wire waitrr2_state_reg_scanout;
wire waitrr2_state;
wire goto_waitrr3_state;
wire next_waitrr3_state;
wire waitrr3_state_reg_scanin;
wire waitrr3_state_reg_scanout;
wire waitrr3_state;
wire goto_ignorette_state;
wire next_ignorette_state;
wire ignorette_state_reg_scanin;
wire ignorette_state_reg_scanout;
wire goto_eperr_state;
wire next_eperr_state;
wire eperr_state_reg_scanin;
wire eperr_state_reg_scanout;
wire goto_eccerr_state;
wire next_eccerr_state;
wire eccerr_state_reg_scanin;
wire eccerr_state_reg_scanout;
wire take_l2_err;
wire take_cfg_err;
wire take_rr_err;
wire [2:0] err_type;
wire err_type_en;
wire [2:0] err_type_in;
wire [2:0] new_err_index;
wire [2:0] err_index_in;
wire err_type_reg_scanin;
wire err_type_reg_scanout;
wire err_index_reg_scanin;
wire err_index_reg_scanout;


input           l1clk;
input           scan_in;
input		spc_aclk;
input		spc_bclk;

input           tsb_hit_hw1;
input           thr_valid_hw3;
input           ra2pahit_hw5;
input           ranotpax_hw5;
input           tsm_waitfortte;

input           ep_miss_hw1;
input           rrindex_bit0;
input           rrindex_bit1;


input           l2_ecc_err_hw1;
input           cfg_ecc_err_m3;
input           rr_ecc_err_hw5;

input [1:0]     l2_ecc_err_type;
input [1:0]     cfg_ecc_err_type;
input [1:0]     rr_ecc_err_type;

input [2:0]     cfg_ecc_err_index;
input [2:0]     rr_ecc_err_index;


output          trs_rqv;
output          trs_null_st;       // indicates that the thread in NULL state.
output          trs_waitrr3_st;    // indicates that the thread in waitrr3 state.
output          trs_ecc_err;       // ecc error signal
output          trs_ep_err;        // ep miss detection
output [2:0]    trs_err_type;      // ecc error type (001=>mra c 010=>mra uc 101=>l2 c 110=>l2 uc 111=>l2 notdata)
                                          // thread could be in validreq, readrr, waitrr2, waitrr3 or ignorette states.

output [2:0]    trs_err_index;     // index for mra errors

output          trs_eccerr_st;
output          trs_eperr_st;

output          scan_out;


assign siclk	= spc_aclk;
assign soclk	= spc_bclk;



assign rrindex[1:0] = {rrindex_bit1, rrindex_bit0};


///////////////////////////////////////////////////
// CASE STATEMENT DESCRIPTION OF TRS MACHINE
///////////////////////////////////////////////////
//case(`TRS_STATE)
//  `NULL_ST:
//    begin
//
//    if (~tsb_hit_hw1 & ~l2_ecc_err_hw1 & ~cfg_ecc_err_m3 & ~ep_miss_hw1)
//      next_state = `NULL_ST;
//    if (tsb_hit_hw1 & ~l2_ecc_err_hw1 & ~cfg_ecc_err_m3 & ~ep_miss_hw1)
//      next_state = `VALIDREQ_ST;
//    if (ep_miss_hw1 & l2_ecc_err_hw1 & ~cfg_ecc_err_m3)
//      next_state = `EPERR_ST;
//    if (l2_ecc_err_hw1 | cfg_ecc_err_m3)
//      next_state = `ECCERR_ST;
//
//    end
//
//  `VALIDREQ_ST:
//    begin
//        if (~ra2pahit_hw5 & ~ranotpax_hw5 & ~rr_ecc_err &
//           (~(rrindex[1:0] == 2'b11 & thr_valid_hw3)))
//          next_state = `VALIDREQ_ST;
//        if (~ra2pahit_hw5 & ~ranotpax_hw5 & ~rr_ecc_err &
//           ((rrindex[1:0] == 2'b11 & thr_valid_hw3)))
//          next_state = `WAITRR2_ST;
//        if ((ra2pahit_hw5 | ranotpax_hw5) & ~rr_ecc_err)
//          next_state = `IGNORETTE_ST;
//        if (rr_ecc_err)
//          next_state = `ECCERR_ST;
//    end
//
//  `WAITRR2_ST:
//    begin
//        if (~ra2pahit_hw5 & ~ranotpax_hw5 & ~rr_ecc_err)
//          next_state = `WAITRR3_ST;
//        if ((ra2pahit_hw5 | ranotpax_hw5) & ~rr_ecc_err)
//          next_state = `IGNORETTE_ST;
//        if (rr_ecc_err)
//          next_state = `ECCERR_ST;
//    end
//
//  `WAITRR3_ST:
//    begin
//        if (~rr_ecc_err)
//          next_state = `IGNORETTE_ST;
//        if (rr_ecc_err)
//          next_state = `ECCERR_ST;
//    end
//
//  `IGNORETTE_ST:
//    begin
//        if (~tsm_waitfortte) 
//          next_state = `NULL_ST;
//        else
//          next_state = `IGNORETTE_ST;
//    end
//
//  `ECCERR_ST:
//    begin
//        if (~tsm_waitfortte) 
//          next_state = `NULL_ST;
//        else
//          next_state = `ECCERR_ST;
//    end
//
//  `EPERR_ST:
//    begin
//        if (~tsm_waitfortte) 
//          next_state = `NULL_ST;
//        else
//          next_state = `EPERR_ST;
//    end
//
//endcase // case(`TRS_STATE)
  
// 0in one_hot -var {null_state,validreq_state,waitrr2_state,waitrr3_state,ignorette_state,eccerr_state,eperr_state}



///////////////////////////////////////////////////
// Null State (HW1)
///////////////////////////////////////////////////
assign goto_null_state = (null_state  & ~tsb_hit_hw1 & ~l2_ecc_err_hw1 & ~cfg_ecc_err_m3 & ~ep_miss_hw1) | //if thr_sel then go to specrr)
                         (ignorette_state & ~tsm_waitfortte) |
                         (eperr_state & ~tsm_waitfortte) |
                         (eccerr_state & ~tsm_waitfortte);
assign next_null_state = goto_null_state;

assign next_null_state_ = ~next_null_state;
assign null_state = ~null_state_;

mmu_trs_ctl_msff_ctl_macro__width_1 null_state_reg  (
 .scan_in(null_state_reg_scanin),
 .scan_out(null_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_null_state_),
 .dout (null_state_),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////
// Valid Req State (HW2)
///////////////////////////////////////////////////
assign goto_validreq_state = (null_state & tsb_hit_hw1 & ~cfg_ecc_err_m3) |                          //ra2pahit_hw5 cannot happen in null_state
                             (validreq_state & ~ra2pahit_hw5 & ~ranotpax_hw5 & ~rr_ecc_err_hw5 &
                              ~(rrindex[1] & rrindex[0] & thr_valid_hw3)) ;

assign next_validreq_state = goto_validreq_state;


mmu_trs_ctl_msff_ctl_macro__width_1 validreq_state_reg  (
 .scan_in(validreq_state_reg_scanin),
 .scan_out(validreq_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_validreq_state),
 .dout (validreq_state),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////
// WaitRR2 State (HW4)
///////////////////////////////////////////////////
assign goto_waitrr2_state = (validreq_state & ~ra2pahit_hw5 & ~ranotpax_hw5 & rrindex[1] & rrindex[0] & thr_valid_hw3 & ~rr_ecc_err_hw5);
assign next_waitrr2_state = goto_waitrr2_state;


mmu_trs_ctl_msff_ctl_macro__width_1 waitrr2_state_reg  (
 .scan_in(waitrr2_state_reg_scanin),
 .scan_out(waitrr2_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_waitrr2_state),
 .dout (waitrr2_state),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////
// WaitRR3 State (HW5)
///////////////////////////////////////////////////
assign goto_waitrr3_state = (waitrr2_state & ~ra2pahit_hw5 & ~ranotpax_hw5 & ~rr_ecc_err_hw5);
assign next_waitrr3_state = goto_waitrr3_state;

mmu_trs_ctl_msff_ctl_macro__width_1 waitrr3_state_reg  (
 .scan_in(waitrr3_state_reg_scanin),
 .scan_out(waitrr3_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_waitrr3_state),
 .dout (waitrr3_state),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////
// IgnoreTTE State (HW6)
///////////////////////////////////////////////////
assign goto_ignorette_state = ((validreq_state | waitrr2_state ) & (ra2pahit_hw5 | ranotpax_hw5) & ~rr_ecc_err_hw5) |
                              (waitrr3_state & ~rr_ecc_err_hw5) |
                              (ignorette_state & tsm_waitfortte);
assign next_ignorette_state = goto_ignorette_state;


mmu_trs_ctl_msff_ctl_macro__width_1 ignorette_state_reg  (
 .scan_in(ignorette_state_reg_scanin),
 .scan_out(ignorette_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_ignorette_state),
 .dout (ignorette_state),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////
// EpErr State (HW6)
///////////////////////////////////////////////////
assign goto_eperr_state = (null_state & ep_miss_hw1 & ~cfg_ecc_err_m3) |
                           (eperr_state & tsm_waitfortte);
assign next_eperr_state = goto_eperr_state;


mmu_trs_ctl_msff_ctl_macro__width_1 eperr_state_reg  (
 .scan_in(eperr_state_reg_scanin),
 .scan_out(eperr_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_eperr_state),
 .dout (eperr_state),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////
// EccErr State (HW6)
///////////////////////////////////////////////////
assign goto_eccerr_state = (null_state & (l2_ecc_err_hw1 | cfg_ecc_err_m3)) |
                           ((validreq_state | waitrr2_state | waitrr3_state ) & rr_ecc_err_hw5) |
                           (eccerr_state & tsm_waitfortte);
assign next_eccerr_state = goto_eccerr_state;


mmu_trs_ctl_msff_ctl_macro__width_1 eccerr_state_reg  (
 .scan_in(eccerr_state_reg_scanin),
 .scan_out(eccerr_state_reg_scanout),
 .l1clk(l1clk),
 .din  (next_eccerr_state),
 .dout (eccerr_state),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////
// Set the ECC ERROR TYPE
// 000 No errors
// 110 MRA Correctable
// 101 MRA Uncorrectable
// 001 L2 correctable
// 010 L2 uncorrectable
// 011 L2 Not Data
// latch the first ecc error and hold it.
///////////////////////////////////////////////////
//0in bits_on -var {take_l2_err, take_cfg_err, take_rr_err} -max 1
assign take_l2_err = (null_state & l2_ecc_err_hw1);
assign take_cfg_err = (null_state  & ~l2_ecc_err_hw1 & cfg_ecc_err_m3);
assign take_rr_err = (validreq_state | waitrr2_state | waitrr3_state ) & rr_ecc_err_hw5;

assign err_type[1:0] = ({2{take_l2_err}} & l2_ecc_err_type[1:0]) |
                       ({2{take_cfg_err}} & cfg_ecc_err_type[1:0]) |
                       ({2{take_rr_err}} & rr_ecc_err_type[1:0]);

assign err_type[2] = (take_cfg_err | take_rr_err) & ~take_l2_err;
assign err_type_en = take_l2_err | take_cfg_err | take_rr_err;

assign err_type_in[2:0] = ({3{err_type_en}} & err_type[2:0]) |
                          ({3{~err_type_en}} & trs_err_type[2:0]);

assign new_err_index[2:0] =   ({3{take_cfg_err}} & cfg_ecc_err_index[2:0]) |
                          ({3{take_rr_err}} & rr_ecc_err_index[2:0]);


assign err_index_in[2:0] = ({3{err_type_en}} & new_err_index[2:0]) |
                          ({3{~err_type_en}} & trs_err_index[2:0]);


mmu_trs_ctl_msff_ctl_macro__width_3 err_type_reg  
(
 .scan_in(err_type_reg_scanin),
 .scan_out(err_type_reg_scanout),
 .l1clk(l1clk),
 .din  (err_type_in[2:0]),
 .dout (trs_err_type[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_trs_ctl_msff_ctl_macro__width_3 err_index_reg  
(
 .scan_in(err_index_reg_scanin),
 .scan_out(err_index_reg_scanout),
 .l1clk(l1clk),
 .din  (err_index_in[2:0]),
 .dout (trs_err_index[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);
///////////////////////////////////////////////////
// State Machine Outputs
///////////////////////////////////////////////////
assign trs_rqv = validreq_state;

assign trs_null_st = null_state;
assign trs_ecc_err = eccerr_state & ~tsm_waitfortte;
assign trs_eccerr_st = eccerr_state;
assign trs_waitrr3_st = waitrr3_state;


assign trs_ep_err = eperr_state & ~tsm_waitfortte;
assign trs_eperr_st = eperr_state;


supply0 vss;
supply1 vdd;

// fixscan start:
assign null_state_reg_scanin     = scan_in                  ;
assign validreq_state_reg_scanin = null_state_reg_scanout   ;
assign waitrr2_state_reg_scanin  = validreq_state_reg_scanout;
assign waitrr3_state_reg_scanin  = waitrr2_state_reg_scanout;
assign ignorette_state_reg_scanin = waitrr3_state_reg_scanout;
assign eperr_state_reg_scanin    = ignorette_state_reg_scanout;
assign eccerr_state_reg_scanin   = eperr_state_reg_scanout  ;
assign err_type_reg_scanin       = eccerr_state_reg_scanout ;
assign err_index_reg_scanin      = err_type_reg_scanout     ;
assign scan_out                  = err_index_reg_scanout    ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module mmu_trs_ctl_msff_ctl_macro__width_1 (
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

module mmu_trs_ctl_msff_ctl_macro__width_3 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0];






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule








