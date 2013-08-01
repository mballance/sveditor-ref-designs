// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fgu_fdc_ctl.v
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
module fgu_fdc_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  scan_out, 
  fac_div_flush_fx3, 
  fpe_rs2_fmt_fx1_b0, 
  fpf_hi_bof_fx1, 
  fpf_lo_bof_fx1, 
  fpf_sa_xor_sb_fx1, 
  fac_div_valid_fx1, 
  fac_divq_valid_fx1, 
  fac_div_control_fx1, 
  fpc_rd_mode_fx3, 
  fpc_emin_fx3, 
  div_clken, 
  fdd_pe_clth, 
  fdd_cla_zero32_, 
  fdd_cla_zero64_, 
  fdd_result, 
  fdd_fdx_din0, 
  fdd_fdx_din1, 
  fdd_fdx_cin64, 
  fdd_fdq00_10_sum, 
  fdd_fdq00_10_carry, 
  fdd_fdq1p_sum, 
  fdd_fdq1p_carry, 
  fdd_fdq1n_sum, 
  fdd_fdq1n_carry, 
  fgu_fdiv_stall, 
  fgu_idiv_stall, 
  fdc_dec_exp_early, 
  fdc_icc_v_early, 
  fdc_xicc_z_early, 
  fdc_finish_int_early, 
  fdc_finish_fltd_early, 
  fdc_finish_flts_early, 
  fdc_flt_inexact, 
  fdc_asign_lth, 
  fdc_bsign_lth, 
  fdc_bsign_lth_, 
  fdc_pe_cycle3, 
  fdc_pe_cmux_sel, 
  fdc_pe_smux_sel, 
  fdc_pe_xsht_ctl, 
  fdc_ie_fsqrt_valid_even, 
  fdc_ie_fsqrt_valid_even_, 
  fdc_ie_fsqrt_valid_odd, 
  fdc_ie_fsqrt_valid_odd_, 
  fdc_ie_rmux_sel, 
  fdc_ie_dmux_sel, 
  fdc_flt_increment, 
  fdc_pte_clasel, 
  fdc_pte_csa_cin, 
  fdc_pte_cycle2, 
  fdc_emin_lth, 
  fdc_pte_qsel, 
  fdc_pte_stall_, 
  fdc_flt_round, 
  fdc_idiv_ctl, 
  fdc_fdx_cin_in, 
  fdc_qsel00, 
  fdc_qsel1, 
  fdc_q_in, 
  fdc_qm1_in);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk_pm1;
wire spares_scanin;
wire spares_scanout;
wire incoming_sign_fx1;
wire [7:0] qcontrol_in;
wire fsqrt_fract_all_ones;
wire [7:0] qcontrol_fx1;
wire qdata_lth_scanin;
wire qdata_lth_scanout;
wire valid_in;
wire valid_lth;
wire [3:0] fdc_pte_cycle;
wire div_flush_lth;
wire [3:1] pe_cycle_in;
wire [3:1] fdc_pe_cycle;
wire engine_running_in;
wire engine_stop;
wire engine_running_lth;
wire engine_on;
wire [7:0] pe_ndq;
wire [3:0] pte_cycle_in;
wire [4:0] control_lth;
wire cntl_lth_scanin;
wire cntl_lth_scanout;
wire [2:0] pe_hmux_sel;
wire b_neg_one;
wire [7:0] pe_xsht_amt;
wire a_neg_max;
wire ovfl_64_in;
wire b_neg_one_lth;
wire finish_raw;
wire ovfl_64_lth;
wire flt_shift_sel_;
wire ovlf_lth_scanin;
wire ovlf_lth_scanout;
wire cla_zero64_lth_;
wire cla_zero32_lth_;
wire fdiv_stall_in;
wire stall_hold;
wire idiv_stall_in;
wire stall_hold_in;
wire [3:0] stall_cnt_raw;
wire [3:0] stall_cnt_in;
wire finish_lth;
wire [3:0] stall_cnt;
wire stall_lth_scanin;
wire stall_lth_scanout;
wire finish_lth_in;
wire idiv_stall_lth;
wire [4:0] control_in;
wire asign_in;
wire bsign_in;
wire ndq_odd_in;
wire data_lth_scanin;
wire data_lth_scanout;
wire ndq_odd_lth;
wire ndq_odd_2lth;
wire [63:0] clth;
wire b0_nor_76;
wire b0_nor_54;
wire b0_nor_32;
wire b0_nor_10;
wire b0_zeroh_;
wire b0_zerol_;
wire b0_zero_;
wire [1:0] b0_cnth;
wire [1:0] b0_cntl;
wire [2:0] b0_cnt;
wire b1_nor_76;
wire b1_nor_54;
wire b1_nor_32;
wire b1_nor_10;
wire b1_zeroh_;
wire b1_zerol_;
wire b1_zero_;
wire [1:0] b1_cnth;
wire [1:0] b1_cntl;
wire [2:0] b1_cnt;
wire b2_nor_76;
wire b2_nor_54;
wire b2_nor_32;
wire b2_nor_10;
wire b2_zeroh_;
wire b2_zerol_;
wire b2_zero_;
wire [1:0] b2_cnth;
wire [1:0] b2_cntl;
wire [2:0] b2_cnt;
wire b3_nor_76;
wire b3_nor_54;
wire b3_nor_32;
wire b3_nor_10;
wire b3_zeroh_;
wire b3_zerol_;
wire b3_zero_;
wire [1:0] b3_cnth;
wire [1:0] b3_cntl;
wire [2:0] b3_cnt;
wire b4_nor_76;
wire b4_nor_54;
wire b4_nor_32;
wire b4_nor_10;
wire b4_zeroh_;
wire b4_zerol_;
wire b4_zero_;
wire [1:0] b4_cnth;
wire [1:0] b4_cntl;
wire [2:0] b4_cnt;
wire b5_nor_76;
wire b5_nor_54;
wire b5_nor_32;
wire b5_nor_10;
wire b5_zeroh_;
wire b5_zerol_;
wire b5_zero_;
wire [1:0] b5_cnth;
wire [1:0] b5_cntl;
wire [2:0] b5_cnt;
wire b6_nor_76;
wire b6_nor_54;
wire b6_nor_32;
wire b6_nor_10;
wire b6_zeroh_;
wire b6_zerol_;
wire b6_zero_;
wire [1:0] b6_cnth;
wire [1:0] b6_cntl;
wire [2:0] b6_cnt;
wire b7_nor_76;
wire b7_nor_54;
wire b7_nor_32;
wire b7_nor_10;
wire b7_zeroh_;
wire b7_zerol_;
wire b7_zero_;
wire [1:0] b7_cnth;
wire [1:0] b7_cntl;
wire [2:0] b7_cnt;
wire b3_0sel;
wire b2_0sel;
wire b1_0sel;
wire b0_0sel;
wire [4:0] cntl0l;
wire b7_0sel;
wire b6_0sel;
wire b5_0sel;
wire b4_0sel;
wire [4:0] cntl0h;
wire cntl0_selh;
wire cntl0_sell;
wire [6:0] cntl0;
wire b7_nand_74;
wire b7_nand_30;
wire b7_ones;
wire b7_ones_;
wire [1:0] b7_cnt1h;
wire [1:0] b7_cnt1l;
wire [2:0] b7_cnt1;
wire b6_nand_74;
wire b6_nand_30;
wire b6_ones;
wire b6_ones_;
wire [1:0] b6_cnt1h;
wire [1:0] b6_cnt1l;
wire [2:0] b6_cnt1;
wire b5_nand_74;
wire b5_nand_30;
wire b5_ones;
wire b5_ones_;
wire [1:0] b5_cnt1h;
wire [1:0] b5_cnt1l;
wire [2:0] b5_cnt1;
wire b4_nand_74;
wire b4_nand_30;
wire b4_ones;
wire b4_ones_;
wire [1:0] b4_cnt1h;
wire [1:0] b4_cnt1l;
wire [2:0] b4_cnt1;
wire b3_nand_74;
wire b3_nand_30;
wire b3_ones;
wire b3_ones_;
wire [1:0] b3_cnt1h;
wire [1:0] b3_cnt1l;
wire [2:0] b3_cnt1;
wire b2_nand_74;
wire b2_nand_30;
wire b2_ones;
wire b2_ones_;
wire [1:0] b2_cnt1h;
wire [1:0] b2_cnt1l;
wire [2:0] b2_cnt1;
wire b1_nand_74;
wire b1_nand_30;
wire b1_ones;
wire b1_ones_;
wire [1:0] b1_cnt1h;
wire [1:0] b1_cnt1l;
wire [2:0] b1_cnt1;
wire b0_nand_74;
wire [1:0] b0_cnt1h;
wire [1:0] b0_cnt1l;
wire [2:0] b0_cnt1;
wire b3_1sel;
wire b2_1sel;
wire b1_1sel;
wire b0_1sel;
wire [4:0] cntl1l;
wire b7_1sel;
wire b6_1sel;
wire b5_1sel;
wire b4_1sel;
wire [4:0] cntl1h;
wire cntl1_selh;
wire [5:0] cntl1;
wire xsht_amt_sel10;
wire xsht_amt_sel11;
wire xsht_amt_sel20;
wire xsht_amt_sel21;
wire [7:0] xsht_amt_in;
wire [7:0] pe_hamt_lth;
wire [7:0] pe_hamt_in;
wire xsht_lth_scanin;
wire xsht_lth_scanout;
wire hamt_lth_scanin;
wire hamt_lth_scanout;
wire [5:0] xsht_ctl_in;
wire xcntl_lth_scanin;
wire xcntl_lth_scanout;
wire engine_valid_fx1;
wire engine_valid_fx2;
wire queue_valid_lth_fx2;
wire engine_valid_lth_fx2;
wire engine_valid_fx3;
wire queue_valid_lth_fx3;
wire engine_valid_lth_fx3;
wire queue_valid_fx1;
wire queue_valid_fx2;
wire q2e_fx3p;
wire xrnd_vld_lth_scanin;
wire xrnd_vld_lth_scanout;
wire [1:0] eround_mode_in;
wire [1:0] qround_mode_lth;
wire [1:0] eround_mode_lth;
wire e_emin_in;
wire q_emin_lth;
wire [1:0] qround_mode_in;
wire q_emin_in;
wire float_sign_in;
wire float_sign_lth;
wire flt_sqrte_kill_dec;
wire inexact_in;
wire final_sticky;
wire final_guard;
wire xrnd_lth_scanin;
wire xrnd_lth_scanout;
wire sticky_pte1;
wire sticky_pte0;
wire final_lsb;
wire flt_rnd00_en;
wire flt_rnd1x_en;
wire fsqrt_special_in;
wire fsqrt_special_lth;
wire spec_sqrt_lth_scanin;
wire spec_sqrt_lth_scanout;
wire cla_64;
wire cin_in_raw;
wire [3:0] fdq00_sum;
wire [3:0] fdq00_carry;
wire [3:0] pr00;
wire [3:0] pr1p;
wire [2:0] qsel1p;
wire [3:0] fdq10_sum;
wire [3:0] fdq10_carry;
wire [3:0] pr10;
wire [2:0] qsel10;
wire [3:0] pr1n;
wire [2:0] qsel1n;
wire engine_start;


// Timing constraints definition :
//   For Inputs  : Required setup to the end of the cycle
//   For Outputs : Actual time the signal leaves block measured from L1CLK rise
//   For pin location : I am assuming dataflow direction is vertical


// *** globals ***
input		l2clk;
input  		scan_in;
input  		tcu_pce_ov;		// scan signals
input  		spc_aclk;
input  		spc_bclk;
input           tcu_scan_en;
output 		scan_out;

input		fac_div_flush_fx3;
input        	fpe_rs2_fmt_fx1_b0;
input		fpf_hi_bof_fx1;
input		fpf_lo_bof_fx1;
input		fpf_sa_xor_sb_fx1;

input		fac_div_valid_fx1;	//  div_valid  divq_valid  |  action
input		fac_divq_valid_fx1;	//  ---------  ----------  |  ---------------------------------------
					//     1           0       |  start divide from FX1   RS1/RS2/control
					//     0           1       |  load  queue  from FX1   RS1/RS2/control
					//     1           1       |  start divide from queue RS1/RS2/control

input  [4:0]	fac_div_control_fx1;   // 0in value -var fac_div_control_fx1[3:0] -val 4'b0000 4'b0010 4'b0100 4'b0101 4'b0110 4'b0111 4'b1000 4'b1010 -active (fac_div_valid_fx1 ^ fac_divq_valid_fx1)
				       // [3:0]  :                            [4] : Thread Group
                                       //  0000  : Float Divide Single
                                       //  0010  : Float Divide Double
                                       //  0100  : Integer Unsigned - 32 bit
                                       //  0101  : Integer   Signed - 32 bit
                                       //  0110  : Integer Unsigned - 64 bit
                                       //  0111  : Integer   Signed - 64 bit
                                       //  1000  : Float SQRT   Single
                                       //  1010  : Float SQRT   Double

input  [1:0]	fpc_rd_mode_fx3;
input		fpc_emin_fx3;

input           div_clken;             // div clken


// *** locals  ***
input  [63:0]	fdd_pe_clth;
input		fdd_cla_zero32_;
input		fdd_cla_zero64_;
input  [63:9]	fdd_result;

input		fdd_fdx_din0;
input		fdd_fdx_din1;
input		fdd_fdx_cin64;

input  [4:0]	fdd_fdq00_10_sum;
input  [4:0]	fdd_fdq00_10_carry;
input  [3:0]	fdd_fdq1p_sum;
input  [3:0]	fdd_fdq1p_carry;
input  [3:0]	fdd_fdq1n_sum;
input  [3:0]	fdd_fdq1n_carry;


// *** globals ***
output		fgu_fdiv_stall;
output [1:0]	fgu_idiv_stall;		// Stall by Thread Group
output		fdc_dec_exp_early;
output		fdc_icc_v_early;
output [1:0]	fdc_xicc_z_early;
output		fdc_finish_int_early;
output		fdc_finish_fltd_early;
output		fdc_finish_flts_early;
output		fdc_flt_inexact;


// *** locals  ***
output		fdc_asign_lth;
output		fdc_bsign_lth;
output		fdc_bsign_lth_;
output		fdc_pe_cycle3;
output		fdc_pe_cmux_sel;
output [2:0]	fdc_pe_smux_sel;
output [5:0]	fdc_pe_xsht_ctl;
output		fdc_ie_fsqrt_valid_even;
output		fdc_ie_fsqrt_valid_even_;
output		fdc_ie_fsqrt_valid_odd;
output		fdc_ie_fsqrt_valid_odd_;
output [4:0]	fdc_ie_rmux_sel;
output [2:0]	fdc_ie_dmux_sel;
output		fdc_flt_increment;
output [1:0]	fdc_pte_clasel;
output		fdc_pte_csa_cin;
output		fdc_pte_cycle2;
output		fdc_emin_lth;
output [2:0]	fdc_pte_qsel;
output		fdc_pte_stall_;

output [1:0]	fdc_flt_round;
output [4:0]	fdc_idiv_ctl;           // 0in bits_on -max 1 -var fdc_idiv_ctl[3:0]
					//  3210   [4] = integer
                                        //  ----
                                        //  0001 : 8000 0000 0000 0000
                                        //  0010 : FFFF FFFF 8000 0000
                                        //  0100 : 0000 0000 7FFF FFFF
                                        //  1000 : 0000 0000 FFFF FFFF

output		fdc_fdx_cin_in;
output [2:0]	fdc_qsel00;
output [2:0]	fdc_qsel1;

output [1:0]	fdc_q_in;
output [1:0]	fdc_qm1_in;

// scan renames
assign pce_ov = tcu_pce_ov;
assign stop   = 1'b0;
assign siclk  = spc_aclk;
assign soclk  = spc_bclk;
assign se     = tcu_scan_en;
// end scan


fgu_fdc_ctl_l1clkhdr_ctl_macro clkgen_pm1 (
  .l2clk(l2clk),
  .l1en (div_clken),
  .l1clk(l1clk_pm1),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
  );

fgu_fdc_ctl_spare_ctl_macro__num_3 spares  (  // spares: 13 gates + 1 flop for each "num"
  .scan_in(spares_scanin),
  .scan_out(spares_scanout),
  .l1clk(l1clk_pm1),
  .siclk(siclk),
  .soclk(soclk)
  );


assign incoming_sign_fx1= fpf_sa_xor_sb_fx1 & ~fac_div_control_fx1[3];	// Turn off for Square Root

assign qcontrol_in[7:0]	= ({8{ fac_divq_valid_fx1}} & {fsqrt_fract_all_ones,incoming_sign_fx1,fpe_rs2_fmt_fx1_b0,fac_div_control_fx1[4:0]}) |
			  ({8{~fac_divq_valid_fx1}} & qcontrol_fx1[7:0]                                                                   );

fgu_fdc_ctl_msff_ctl_macro__width_8	qdata_lth	 (
 .scan_in(qdata_lth_scanin),
 .scan_out(qdata_lth_scanout),
 .l1clk( l1clk_pm1         ),
 .din  ({qcontrol_in[7:0] }),
 .dout ({qcontrol_fx1[7:0]}),
  .siclk(siclk),
  .soclk(soclk));


 
// * * * * * * * * * * * * Main Controller * * * * * * * * * * * * 


// *** State control ***

//* * * * * * * * * * * * "pre-engine" (integer only)* * * * *
//
// cycle  0   :  fac_div_valid_fx1  A&B are transmitted to divide hardware
//                                  A loaded into Slth
//                                  B loaded into Clth;
//
// cycle  1   :  pe_cycle[1]        B into CNTL0 and CNTL1 -> compute "lsb";
//                                  A loaded into Clth;
//                                  B loaded into Slth;
//
// cycle  2   :  pe_cycle[2]        A into CNTL0 and CNTL1 -> compute "lsa"; 
//                                  B shifts by "lsb" amount
//                                  A loaded into Slth; 
//                                  Xsht loaded into Clth;  (this is Bsh)
//
// cycle  3   :  pe_cycle[3]        A shifts by "lsa" amount;
//               engine_start       Bsh is XORed to produce positive divisor
//                                  compute ndq = lsb - lsa + 1;
//                                  finished if ndq <= 0;        (ie B > A)
//
//* * * * * * * * * * * * * "engine" * * * * * * * * * * * * * 
//
// See Integer "engine" run-time below for how ndq is computed.
//
// if (even ndq)
//    then X =  ndq / 2
//    else X = (ndq - 1) / 2
//
// for X cycles
//    perform loop
//
//  cycle X+3 :  engine_stop      last loop
//
//* * * * * * * * * * * * "post-engine" * * * * * * * * * * * *
//
//  cycle X+4 :  pte_cycle[3]       load "S0" and "C0" latches into adder latches
//                                  For an odd ndq, we actually compute the last Q and Qm1
//                                  and then load "C1" and "S1" into the adder latches.
//
//  cycle X+5 :  pte_cycle[2]       compute Sign of Remainder
//                                  compute zero remainder (used as Sticky and in correction)
//                                  load Q and Qm1 into adder latches
//                                  make correction if necessary
//                                  turn off valid_lth (new divide will NOT affect result)
//
//  cycle X+6 :  pte_cycle[1]       compute Qf = Q - Qm1 + correction;
//                                  64-bit Integer - load into Result latch
//
//  cycle X+7    pte_cycle[0]       32-bit Integer - Overflow detection and correction
//                                  Floating Point - Round
//
//  cycle X+7/8  fdc_finish         transmit Result
//
//
//* * * * * * * * * * * * Integer "engine" run-time * * * * * * * * * *
// 
// 
// Define : lsa  : number of Leading Sign bits in A (n-1 for negative)
//          lsb  : number of Leading Sign bits in B (n   for negative)
//          nda  : number of digits in A (nda=64-lsa)
//          ndb  : number of digits in B (ndb=64-lsb)
//          ndq  : number of digits in the Quotient Q  (MAX)
// 
// Then ndq = nda - (ndb - 1);
// 
// The minus one comes from the fact that dividing by '1' does not reduce
// the number of significant bits in the dividend (A operand).
// 
// By substitution :
// 
//      ndq = [64 - lsa] - ([64 - lsb] - 1);
//          = lsb - lsa + 1;
// 
// 
// Example :      A = 0000 1111 (+15)    lsa = 4
// (8-bit)        B = 0000 0010 (+2)     lsb = 6
//                ------------------
//                R = 0000 0111 (+7)     notice ndq=3
// 
//                compute ndq = lsb - lsa + 1
//                            =  6  -  4  + 1 
//                            =  3             (this is a MAX ndq computation)
// 
// 
// Example :      A = 0000 1000 (+8)     lsa = 4
// (8-bit)        B = 0000 0011 (+3)     lsb = 6
//                ------------------
//                R = 0000 0010 (+2)     notice ndq=2
// 
//                compute ndq = lsb - lsa + 1
//                            =  6  -  4  + 1 
//                            =  3             (this is a MAX ndq computation)
// 
// 
// Example :      A = 1111 0000 (-16)    lsa = 3  (n-1 for negative)
// (8-bit)        B = 0000 0010 (+2)     lsb = 6
//                ------------------
//                R = 1111 1000 (-8)     notice ndq=4
// 
//                compute ndq = lsb - lsa + 1
//                            =  6  -  3  + 1 
//                            =  4             (this is a MAX ndq computation)
// 
// 
// 
// 
// 
//* * * * * * * * * * * * * Total cycle count * * * * * * * * * * * *
// 
// *** 32-bit Integer Division***
// 
// FX1    transmit of RS1 and RS2
//  3     "pre-engine"
//  X     "engine"        where   X = (lsb-lsa)// 2; {0 to 32 cycles}
//  4     "post-engine"   where   4th cycle is Overflow detection and correction
//  S     "engine-stall"  where   S = 4 - X;  {0 to 4 cycles}  (needed to sync up with bubble)
// FX5    transmit to EXU
// W
// ---
// 10+X+S   {14 to 42 cycles}
//
//
// *** 64-bit Integer Division***
// 
// FX1    transmit of RS1 and RS2
//  3     "pre-engine"
//  X     "engine"        where   X = (lsb-lsa)// 2; {0 to 32 cycles}
//  3     "post-engine"
//  S     "engine-stall"  where   S = 4 - X;  {0 to 4 cycles}  (needed to sync up with bubble)
// FX5    transmit to EXU
// W
// ---
//  9+X+S   {13 to 41 cycles}
// 
// 
// *** Float Double Precision divide and square root***
// 
// FX1    transmit of RS1 and RS2
//  27    "engine"        need 53 mantissa + 1 guard + 1 for 0.1 = 55
//                        27 cycles compute 54 quotient digits.  The last bit is computed during pte_cycle[3].
//  4     "post-engine"
// FB
// FW
// FW1
// ---
// 35 cycles
// 
// 
// *** Float Single Precision divide and square root ***
// 
// FX1    transmit of RS1 and RS2
//  13    "engine"        need 24 mantissa + 1 guard + 1 for 0.1 = 26
//  4     "post-engine"
// FB
// FW
// FW1
// ---
// 21 cycles


assign valid_in           = (fac_div_valid_fx1                                            ) |
                            (valid_lth          & ~fdc_pte_cycle[2]       & ~div_flush_lth);

assign pe_cycle_in[1]     = (fac_div_valid_fx1  &  fac_div_control_fx1[2] & ~fac_divq_valid_fx1) |
                            (fac_div_valid_fx1  &         qcontrol_fx1[2] &  fac_divq_valid_fx1);

assign pe_cycle_in[3:2]   =  fdc_pe_cycle[2:1]                            & {2{~div_flush_lth}};

assign engine_running_in  = (fac_div_valid_fx1  & ~fac_div_control_fx1[2] & ~fac_divq_valid_fx1) |  // start FLT
                            (fac_div_valid_fx1  &        ~qcontrol_fx1[2] &  fac_divq_valid_fx1) |  // start FLT
                            (fdc_pe_cycle[3]    & ~engine_stop            & ~div_flush_lth     ) |  // start INT
                            (engine_running_lth & ~engine_stop            & ~div_flush_lth     );

assign engine_on          =  fdc_pe_cycle[3] | engine_running_lth;

// 0in assert_timer -var (engine_running_lth & (control_lth[2:0] == 3'b000)) -max 13 -message "FDIV/FSQRT engine running > 13 cycles for SP"
// 0in assert_timer -var (engine_running_lth & (control_lth[2:0] == 3'b010)) -max 27 -message "FDIV/FSQRT engine running > 27 cycles for DP"
// 0in assert_timer -var (engine_running_lth & (control_lth[3:2] == 2'b01 )) -max 32 -message "IDIV engine running > 32 cycles"

assign engine_stop        = ((pe_ndq[6:1] == 6'b000000) & engine_on) |
                            ( pe_ndq[7]                 & engine_on);

assign pte_cycle_in[3:1]  = {engine_stop,fdc_pte_cycle[3:2]}                       & {3{~div_flush_lth}};
assign pte_cycle_in[0]    =  fdc_pte_cycle[1] & ~(control_lth[2] & control_lth[1]) &    ~div_flush_lth;

fgu_fdc_ctl_msff_ctl_macro__width_10	cntl_lth	 (
 .scan_in(cntl_lth_scanin),
 .scan_out(cntl_lth_scanout),
 .l1clk( l1clk_pm1                                                                                   ),
 .din  ({valid_in  , pe_cycle_in[3:1]  , engine_running_in  , pte_cycle_in[3:0]  , fac_div_flush_fx3}),
 .dout ({valid_lth , fdc_pe_cycle[3:1] , engine_running_lth , fdc_pte_cycle[3:0] , div_flush_lth    }),
  .siclk(siclk),
  .soclk(soclk));

// 0in bits_on -max 1 -var {fdc_pe_cycle[3:1], engine_running_lth, fdc_pte_cycle[3:0], finish_lth}

// 0in state_transition -var {fac_div_valid_fx1, pe_cycle_in[3:1], engine_running_in} -val {1'b1, 3'b000, 1'b0} -next {1'b0, 3'b001, 1'b0} {1'b0, 3'b000, 1'b1} {1'b0, 3'b000, 1'b0} -match_by_cycle
// 0in state_transition -var  pe_cycle_in[3:1] -val 3'b000 -next 3'b001 3'b000
// 0in state_transition -var  pe_cycle_in[3:1] -val 3'b001 -next 3'b010 3'b000 -match_by_cycle
// 0in state_transition -var  pe_cycle_in[3:1] -val 3'b010 -next 3'b100 3'b000 -match_by_cycle
// 0in state_transition -var {engine_running_in, pe_cycle_in[3:1]} -val {1'b0, 3'b100} -next {1'b1, 3'b000} {1'b0, 3'b000} -match_by_cycle
// 0in state_transition -var {pte_cycle_in[3:0], engine_running_in} -val {4'b0000, 1'b1} -next {4'b1000, 1'b0} {4'b0000, 1'b0}
// 0in state_transition -var  pte_cycle_in[3:0] -val 4'b0000 -next 4'b1000
// 0in state_transition -var  pte_cycle_in[3:0] -val 4'b1000 -next 4'b0100 -match_by_cycle
// 0in state_transition -var  pte_cycle_in[3:0] -val 4'b0100 -next 4'b0010 -match_by_cycle
// 0in state_transition -var {pte_cycle_in[3:0], finish_lth_in} -val {4'b0010, 1'b0} -next {4'b0001, 1'b0} {4'b0000, 1'b1}
// 0in state_transition -var {pte_cycle_in[3:0], finish_lth_in} -val {4'b0001, 1'b0} -next {4'b0000, 1'b1}

assign fdc_pe_cycle3      = fdc_pe_cycle[3];	// Tools issues with single bit buses downstream
assign fdc_pte_cycle2     = fdc_pte_cycle[2];	// Tools issues with single bit buses downstream

assign fdc_pe_cmux_sel    =   fdc_pe_cycle[1]   | fdc_pe_cycle[2];

// For neg B, left shift by 1 to compensate for 'n-1' shift amount
assign fdc_pe_smux_sel[0] =   fdc_pe_cycle[1]   & fdd_pe_clth[63] & control_lth[0];
assign fdc_pe_smux_sel[1] =   fdc_pe_cycle[1]   | fdc_pe_cycle[2];
assign fdc_pe_smux_sel[2] =   fac_div_valid_fx1 & ~fac_divq_valid_fx1;

assign     pe_hmux_sel[0] = ( fac_div_valid_fx1 & ~fac_div_control_fx1[2] &  fac_div_control_fx1[1] & ~fac_divq_valid_fx1) |
                            ( fac_div_valid_fx1 &        ~qcontrol_fx1[2] &         qcontrol_fx1[1] &  fac_divq_valid_fx1);
assign     pe_hmux_sel[1] = ( fac_div_valid_fx1 & ~fac_div_control_fx1[2] & ~fac_div_control_fx1[1] & ~fac_divq_valid_fx1) |
                            ( fac_div_valid_fx1 &        ~qcontrol_fx1[2] &        ~qcontrol_fx1[1] &  fac_divq_valid_fx1);
assign     pe_hmux_sel[2] =  ~fdc_pe_cycle[1]   &  valid_lth;

 
// *** Integer Overflow Detection ***

// fdc_idiv_ctl
      //  3210
      //  ----
      //  0001 : 8000 0000 0000 0000  ovfl_64x
      //  0010 : FFFF FFFF 8000 0000  ovfl_32n
      //  0100 : 0000 0000 7FFF FFFF  ovfl_32p
      //  1000 : 0000 0000 FFFF FFFF  ovfl_32u


// For 64-bit divide, the only OVFL condition exits is :  neg max / -1 
// This results in a constant of "8000 0000 0000 0000" defined on pg 196.

assign b_neg_one       =  fdc_pe_cycle[2] & fdc_bsign_lth &
                         (pe_xsht_amt[6:0] == 7'b0111111);

assign a_neg_max       =  fdc_pe_cycle[3] & fdc_asign_lth &
                         (pe_xsht_amt[6:0] == 7'b1111111);  // xsht_amt is inverted by cycle[3]

assign ovfl_64_in      = ( a_neg_max      &  b_neg_one_lth & ~div_flush_lth) |  // 64-bit divide
                         (~finish_raw     &  ovfl_64_lth   & ~div_flush_lth);

assign fdc_idiv_ctl[0] =  fdc_pte_cycle[0] & ovfl_64_lth   & control_lth[1];

// For 64-bit/32-bit, three OVFL constants are possible.  (see pages 152-154)
// For - signed : if quotient <= (-2^31 - 1) then result = FFFF FFFF 8000 0000 (-2^31    )
// For + signed : if quotient >= ( 2^31    ) then result = 0000 0000 7FFF FFFF ( 2^31 - 1)
// For unsigned : if quotient >= ( 2^32    ) then result = 0000 0000 FFFF FFFF ( 2^32 - 1)

assign fdc_idiv_ctl[1] =  fdc_pte_cycle[0] &  (control_lth[2:0] == 3'b101) &
                          fdd_result[63]   &  (fdd_result[62:31] != 32'hFFFFFFFF)  & ~ovfl_64_lth;

assign fdc_idiv_ctl[2] =  fdc_pte_cycle[0] &  (control_lth[2:0] == 3'b101) &
                       ((~fdd_result[63]   &  (fdd_result[62:31] != 32'h00000000)) |  ovfl_64_lth);

assign fdc_idiv_ctl[3] =  fdc_pte_cycle[0] &  (control_lth[2:0] == 3'b100) &
                                              (fdd_result[63:32] != 32'h00000000);

assign fdc_idiv_ctl[4] =  fdc_pte_cycle[0] & ~control_lth[2] & ~flt_shift_sel_ & ~fdc_flt_increment;

assign fdc_icc_v_early = | fdc_idiv_ctl[3:0];


fgu_fdc_ctl_msff_ctl_macro__width_4	ovlf_lth	 (
 .scan_in(ovlf_lth_scanin),
 .scan_out(ovlf_lth_scanout),
 .l1clk( l1clk_pm1							 ),
 .din  ({ovfl_64_in  , b_neg_one     , fdd_cla_zero64_ , fdd_cla_zero32_}),
 .dout ({ovfl_64_lth , b_neg_one_lth , cla_zero64_lth_ , cla_zero32_lth_}),
  .siclk(siclk),
  .soclk(soclk));


assign fdc_xicc_z_early[1] = ~cla_zero64_lth_;
assign fdc_xicc_z_early[0] = ~cla_zero32_lth_ & ~fdc_icc_v_early;

 
// *** Engine stall ***

// The INTEGER divide has a variable timing dependent on the operand data.
// The divide must provide a STALL signal to the issue logic to ensure no
// collision on the shared FGU to EXU bus.  The timing of the IDIV_STALL
// is given below.
//
//  t-1     t     t+1    t+2    t+3    t+4    t+5    t+6    t+7 
//  -----|------|------|------|------|------|------|------|------|
// idiv  | idiv |  D   |  E   | fx1  | fx2  | fx3  | fx4  | fx5  |
// stall | stall|      |      |      |      |      |      |      |
// in    |      |      |      |engine|pte[3]|pte[2]|pte[1]|finish|
//       |      |      |      | stop |      |      |      |      |
//       |      |      |      |      |      |      |      |      |
//   8/9 | 6/7  | 4/5  | 2/3  | 0/1  |      |      |      |      |
//       |      |      |      |      |      |      |      |      |
//   +0  |  +1  |  +2  |  +3  |  +4  |      |      |      |      |
//
//
// The Floating Point Divide and Square Root has a fixed latency.
// The divide must provide a STALL signal to the issue logic to ensure no
// collision at the W2 port to the FRF.
//
//  t-1     t     t+1    t+2    t+3    t+4 
//  -----|------|------|------|------|------|
// fdiv  | fdiv |  D   |  E   |  M   | fb/B |
// stall | stall|      |      |      |      |
// in    |      |      |      |      |      |
//       |      |      |      |      |      |
//       |pte[3]|pte[2]|pte[1]|pte[0]|finish|
//       |      |      |      |      |      |
//       |      |      |      |      |      |
//   8/9 | 6/7  |      |      |      |      |
//       |      |      |      |      |      |
//   +0  |  +1  |      |      |      |      |
//
//
// at engine_start :
//                    stall_cnt
//                    3 2 1 0
//                    -------
//    ndq = neg   ->  1 1 1 1
//    ndq = 0/1   ->  1 1 1 1    [6:1] = 000 000
//    ndq = 2/3   ->  0 1 1 1          = 000 001
//    ndq = 4/5   ->  0 0 1 1          = 000 010
//    ndq = 6/7   ->  0 0 0 1          = 000 011
//    ndq >=8/9   ->  0 0 0 0          = 000 100   idiv_stall_in


assign fdiv_stall_in     = ((pe_ndq[6:1] == 6'b000000) & engine_on & ~control_lth[2]                  & ~stall_hold);

assign idiv_stall_in     = ((pe_ndq[6:1] == 6'b000100) & engine_on &  control_lth[2] & control_lth[1] & ~stall_hold & ~div_flush_lth) |
                           ((pe_ndq[6:3] == 4'b0000  ) & engine_on &  control_lth[2]                  & ~stall_hold & ~div_flush_lth) |
                           ( pe_ndq[7]                 & engine_on &  control_lth[2]                  & ~stall_hold & ~div_flush_lth);


assign stall_hold_in     = (fdiv_stall_in & ~div_flush_lth              ) |
                           (idiv_stall_in & ~div_flush_lth              ) |
                           (stall_hold    & ~div_flush_lth & ~finish_raw);


assign stall_cnt_raw[3]  = (pe_ndq[6:1] == 6'b000000) |
                           (pe_ndq[7]               );

assign stall_cnt_raw[2]  = (pe_ndq[6:2] == 5'b00000 ) |
                           (pe_ndq[7]               );

assign stall_cnt_raw[1]  = (pe_ndq[6:1] == 6'b000010) |
                           (pe_ndq[6:2] == 5'b00000 ) |
                           (pe_ndq[7]               );

assign stall_cnt_raw[0]  = (pe_ndq[6:3] == 4'b0000  ) |
                           (pe_ndq[7]               );

assign stall_cnt_in[3:0] = ({4{ fdc_pe_cycle[3] &  control_lth[1] & ~div_flush_lth}} &       stall_cnt_raw[3:0] ) |  // INT64 engine_start
                           ({4{ fdc_pe_cycle[3] & ~control_lth[1] & ~div_flush_lth}} & {1'b0,stall_cnt_raw[3:1]}) |  // INT32 engine_start
                           ({4{~fdc_pe_cycle[3] & ~finish_lth     & ~div_flush_lth}} &       stall_cnt[3:0]     ) |
                           ({4{                    finish_lth     & ~div_flush_lth}} & {1'b0,stall_cnt[3:1]    });

fgu_fdc_ctl_msff_ctl_macro__width_8	stall_lth	 (
 .scan_in(stall_lth_scanin),
 .scan_out(stall_lth_scanout),
 .l1clk( l1clk_pm1                                                                           ),
 .din  ({finish_lth_in , fdiv_stall_in  , idiv_stall_in  , stall_hold_in , stall_cnt_in[3:0]}),
 .dout ({finish_lth    , fgu_fdiv_stall , idiv_stall_lth , stall_hold    , stall_cnt[3:0]   }),
  .siclk(siclk),
  .soclk(soclk));


assign fgu_idiv_stall[1]   =   control_lth[4] & idiv_stall_lth;		// Threads 4-7
assign fgu_idiv_stall[0]   =  ~control_lth[4] & idiv_stall_lth;		// Threads 0-3


assign finish_lth_in         =  (fdc_pte_cycle[0]                                                                     & ~div_flush_lth) |
                                (fdc_pte_cycle[1] &                                  control_lth[2] &  control_lth[1] & ~div_flush_lth) |
                                (finish_lth       &  stall_cnt[0]                                                     & ~div_flush_lth);


assign finish_raw            =   finish_lth       & ~stall_cnt[0];

assign fdc_finish_int_early  =  (fdc_pte_cycle[0] & ~stall_cnt[0]                 &  control_lth[2]                  ) |
                                (fdc_pte_cycle[1] & ~stall_cnt[0]                 &  control_lth[2] &  control_lth[1]) |
                                (finish_lth       &  stall_cnt[0] & ~stall_cnt[1] &  control_lth[2]                  );

assign fdc_finish_fltd_early = fdc_pte_cycle[0] &                                   ~control_lth[2] &  control_lth[1];
assign fdc_finish_flts_early = fdc_pte_cycle[0] &                                   ~control_lth[2] & ~control_lth[1];



assign fdc_pte_stall_      =   fdc_pte_cycle[1] |
                               fdc_idiv_ctl[0]  |  fdc_idiv_ctl[1] |  fdc_idiv_ctl[2] |  fdc_idiv_ctl[3] |
                              (fdc_pte_cycle[0] & ~flt_shift_sel_ & ~control_lth[2]) |
                              (fdc_pte_cycle[0] &  fdc_flt_increment               );



// *** State data ***

assign control_in[4:0]    = ({5{ fac_div_valid_fx1 & ~fac_divq_valid_fx1}} & fac_div_control_fx1[4:0]) |
                            ({5{ fac_div_valid_fx1 &  fac_divq_valid_fx1}} &        qcontrol_fx1[4:0]) |
                            ({5{~fac_div_valid_fx1                      }} &         control_lth[4:0]);

assign asign_in           = ( fdc_pe_cycle[2] & fdd_pe_clth[63] &  control_lth[0]   ) |
                            (~fdc_pe_cycle[2] & fdc_asign_lth   & ~fac_div_valid_fx1);

assign bsign_in           = ( fdc_pe_cycle[1] & fdd_pe_clth[63] &  control_lth[0]   ) |
                            (~fdc_pe_cycle[1] & fdc_bsign_lth   & ~fac_div_valid_fx1);

assign ndq_odd_in         = ~pe_ndq[7] & pe_ndq[0];

fgu_fdc_ctl_msff_ctl_macro__width_9	data_lth	 (
 .scan_in(data_lth_scanin),
 .scan_out(data_lth_scanout),
 .l1clk( l1clk_pm1                                                              ),
 .din  ({control_in[4:0] ,asign_in     ,bsign_in     ,ndq_odd_in ,ndq_odd_lth  }),
 .dout ({control_lth[4:0],fdc_asign_lth,fdc_bsign_lth,ndq_odd_lth,ndq_odd_2lth }),
  .siclk(siclk),
  .soclk(soclk));

assign fdc_pte_clasel[0]  =  fdc_pte_cycle[3] & ~ndq_odd_lth;
assign fdc_pte_clasel[1]  =  fdc_pte_cycle[3] &  ndq_odd_lth;

assign fdc_pte_qsel[0]    =  control_lth[2] & ~ndq_odd_2lth;    // INT even
assign fdc_pte_qsel[1]    =  control_lth[2] &  ndq_odd_2lth;    // INT odd
assign fdc_pte_qsel[2]    = ~control_lth[2] &  control_lth[1];  // FLT DP 


assign fdc_bsign_lth_     = ~fdc_bsign_lth;
assign fdc_pte_csa_cin    =  fdc_asign_lth ^ fdc_bsign_lth;


 
// * * * * * * * * * * * Interface to engine * * * * * * * * * * * 

// integer select by "fdc_pe_cycle[3]" 

// fac_div_control_fx1[3:0] ==
//   [3:0]  :
//    0000  : Float Divide Single
//    0010  : Float Divide Double
//    0100  : Integer Unsigned - 32 bit
//    0101  : Integer   Signed - 32 bit
//    0110  : Integer Unsigned - 64 bit
//    0111  : Integer   Signed - 64 bit
//    1000  : Float SQRT   Single
//    1010  : Float SQRT   Double


assign fdc_ie_rmux_sel[0] = ~fac_div_valid_fx1;                                                  // integer
assign fdc_ie_rmux_sel[1] =  fac_div_valid_fx1 &  fac_div_control_fx1[3] & ~fac_divq_valid_fx1;  // float sqrt
assign fdc_ie_rmux_sel[2] =  fac_div_valid_fx1 & ~fac_div_control_fx1[3] & ~fac_divq_valid_fx1;  // float div
assign fdc_ie_rmux_sel[3] =  fac_div_valid_fx1 &         qcontrol_fx1[3] &  fac_divq_valid_fx1;  // float sqrt
assign fdc_ie_rmux_sel[4] =  fac_div_valid_fx1 &        ~qcontrol_fx1[3] &  fac_divq_valid_fx1;  // float div
											       
assign fdc_ie_dmux_sel[0] = ~fac_div_valid_fx1;                                                  // integer
assign fdc_ie_dmux_sel[1] =  fac_div_valid_fx1 & ~fac_div_control_fx1[3] & ~fac_divq_valid_fx1;  // float div
assign fdc_ie_dmux_sel[2] =  fac_div_valid_fx1 &        ~qcontrol_fx1[3] &  fac_divq_valid_fx1;  // float div


// must be qualified w/ valid so INT is not corrupted by garbage on bus during pe_cycle[3]
assign fdc_ie_fsqrt_valid_even  = (fac_div_valid_fx1 & fac_div_control_fx1[3] &  fpe_rs2_fmt_fx1_b0 & ~fac_divq_valid_fx1) |
                                  (fac_div_valid_fx1 &        qcontrol_fx1[3] &  qcontrol_fx1[5]    &  fac_divq_valid_fx1);

assign fdc_ie_fsqrt_valid_odd   = (fac_div_valid_fx1 & fac_div_control_fx1[3] & ~fpe_rs2_fmt_fx1_b0 & ~fac_divq_valid_fx1) |
                                  (fac_div_valid_fx1 &        qcontrol_fx1[3] & ~qcontrol_fx1[5]    &  fac_divq_valid_fx1);

assign fdc_ie_fsqrt_valid_even_ = ~fdc_ie_fsqrt_valid_even;
assign fdc_ie_fsqrt_valid_odd_  = ~fdc_ie_fsqrt_valid_odd;

 
// * * * * * * * * * * * * start : Integer CNTL0 * * * * * * * * * * * * * 

//reg [6:0] cntl0;
//
//always @ (fdd_pe_clth[63:0])
//
// begin
//
// casex (fdd_pe_clth[63:0])
//  64'b1???????????????????????????????????????????????????????????????: cntl0[6:0]  =  7'b0000000;
//  64'b01??????????????????????????????????????????????????????????????: cntl0[6:0]  =  7'b0000001;
//  64'b001?????????????????????????????????????????????????????????????: cntl0[6:0]  =  7'b0000010;
//  64'b0001????????????????????????????????????????????????????????????: cntl0[6:0]  =  7'b0000011;
//  64'b00001???????????????????????????????????????????????????????????: cntl0[6:0]  =  7'b0000100;
//  64'b000001??????????????????????????????????????????????????????????: cntl0[6:0]  =  7'b0000101;
//  64'b0000001?????????????????????????????????????????????????????????: cntl0[6:0]  =  7'b0000110;
//  64'b00000001????????????????????????????????????????????????????????: cntl0[6:0]  =  7'b0000111;
//
//  64'b000000001???????????????????????????????????????????????????????: cntl0[6:0]  =  7'b0001000;
//  64'b0000000001??????????????????????????????????????????????????????: cntl0[6:0]  =  7'b0001001;
//  64'b00000000001?????????????????????????????????????????????????????: cntl0[6:0]  =  7'b0001010;
//  64'b000000000001????????????????????????????????????????????????????: cntl0[6:0]  =  7'b0001011;
//  64'b0000000000001???????????????????????????????????????????????????: cntl0[6:0]  =  7'b0001100;
//  64'b00000000000001??????????????????????????????????????????????????: cntl0[6:0]  =  7'b0001101;
//  64'b000000000000001?????????????????????????????????????????????????: cntl0[6:0]  =  7'b0001110;
//  64'b0000000000000001????????????????????????????????????????????????: cntl0[6:0]  =  7'b0001111;
//
//  64'b00000000000000001???????????????????????????????????????????????: cntl0[6:0]  =  7'b0010000;
//  64'b000000000000000001??????????????????????????????????????????????: cntl0[6:0]  =  7'b0010001;
//  64'b0000000000000000001?????????????????????????????????????????????: cntl0[6:0]  =  7'b0010010;
//  64'b00000000000000000001????????????????????????????????????????????: cntl0[6:0]  =  7'b0010011;
//  64'b000000000000000000001???????????????????????????????????????????: cntl0[6:0]  =  7'b0010100;
//  64'b0000000000000000000001??????????????????????????????????????????: cntl0[6:0]  =  7'b0010101;
//  64'b00000000000000000000001?????????????????????????????????????????: cntl0[6:0]  =  7'b0010110;
//  64'b000000000000000000000001????????????????????????????????????????: cntl0[6:0]  =  7'b0010111;
//
//  64'b0000000000000000000000001???????????????????????????????????????: cntl0[6:0]  =  7'b0011000;
//  64'b00000000000000000000000001??????????????????????????????????????: cntl0[6:0]  =  7'b0011001;
//  64'b000000000000000000000000001?????????????????????????????????????: cntl0[6:0]  =  7'b0011010;
//  64'b0000000000000000000000000001????????????????????????????????????: cntl0[6:0]  =  7'b0011011;
//  64'b00000000000000000000000000001???????????????????????????????????: cntl0[6:0]  =  7'b0011100;
//  64'b000000000000000000000000000001??????????????????????????????????: cntl0[6:0]  =  7'b0011101;
//  64'b0000000000000000000000000000001?????????????????????????????????: cntl0[6:0]  =  7'b0011110;
//  64'b00000000000000000000000000000001????????????????????????????????: cntl0[6:0]  =  7'b0011111;
//
//  64'b000000000000000000000000000000001???????????????????????????????: cntl0[6:0]  =  7'b0100000;
//  64'b0000000000000000000000000000000001??????????????????????????????: cntl0[6:0]  =  7'b0100001;
//  64'b00000000000000000000000000000000001?????????????????????????????: cntl0[6:0]  =  7'b0100010;
//  64'b000000000000000000000000000000000001????????????????????????????: cntl0[6:0]  =  7'b0100011;
//  64'b0000000000000000000000000000000000001???????????????????????????: cntl0[6:0]  =  7'b0100100;
//  64'b00000000000000000000000000000000000001??????????????????????????: cntl0[6:0]  =  7'b0100101;
//  64'b000000000000000000000000000000000000001?????????????????????????: cntl0[6:0]  =  7'b0100110;
//  64'b0000000000000000000000000000000000000001????????????????????????: cntl0[6:0]  =  7'b0100111;
//
//  64'b00000000000000000000000000000000000000001???????????????????????: cntl0[6:0]  =  7'b0101000;
//  64'b000000000000000000000000000000000000000001??????????????????????: cntl0[6:0]  =  7'b0101001;
//  64'b0000000000000000000000000000000000000000001?????????????????????: cntl0[6:0]  =  7'b0101010;
//  64'b00000000000000000000000000000000000000000001????????????????????: cntl0[6:0]  =  7'b0101011;
//  64'b000000000000000000000000000000000000000000001???????????????????: cntl0[6:0]  =  7'b0101100;
//  64'b0000000000000000000000000000000000000000000001??????????????????: cntl0[6:0]  =  7'b0101101;
//  64'b00000000000000000000000000000000000000000000001?????????????????: cntl0[6:0]  =  7'b0101110;
//  64'b000000000000000000000000000000000000000000000001????????????????: cntl0[6:0]  =  7'b0101111;
//
//  64'b0000000000000000000000000000000000000000000000001???????????????: cntl0[6:0]  =  7'b0110000;
//  64'b00000000000000000000000000000000000000000000000001??????????????: cntl0[6:0]  =  7'b0110001;
//  64'b000000000000000000000000000000000000000000000000001?????????????: cntl0[6:0]  =  7'b0110010;
//  64'b0000000000000000000000000000000000000000000000000001????????????: cntl0[6:0]  =  7'b0110011;
//  64'b00000000000000000000000000000000000000000000000000001???????????: cntl0[6:0]  =  7'b0110100;
//  64'b000000000000000000000000000000000000000000000000000001??????????: cntl0[6:0]  =  7'b0110101;
//  64'b0000000000000000000000000000000000000000000000000000001?????????: cntl0[6:0]  =  7'b0110110;
//  64'b00000000000000000000000000000000000000000000000000000001????????: cntl0[6:0]  =  7'b0110111;
//
//  64'b000000000000000000000000000000000000000000000000000000001???????: cntl0[6:0]  =  7'b0111000;
//  64'b0000000000000000000000000000000000000000000000000000000001??????: cntl0[6:0]  =  7'b0111001;
//  64'b00000000000000000000000000000000000000000000000000000000001?????: cntl0[6:0]  =  7'b0111010;
//  64'b000000000000000000000000000000000000000000000000000000000001????: cntl0[6:0]  =  7'b0111011;
//  64'b0000000000000000000000000000000000000000000000000000000000001???: cntl0[6:0]  =  7'b0111100;
//  64'b00000000000000000000000000000000000000000000000000000000000001??: cntl0[6:0]  =  7'b0111101;
//  64'b000000000000000000000000000000000000000000000000000000000000001?: cntl0[6:0]  =  7'b0111110;
//  64'b0000000000000000000000000000000000000000000000000000000000000001: cntl0[6:0]  =  7'b0111111;
//
//  64'b0000000000000000000000000000000000000000000000000000000000000000: cntl0[6:0]  =  7'b1000000;
//
//  default:                                                              cntl0[6:0]  =  7'bxxxxxxx;
//
// endcase
//
//end


// The real count leading zero (CNTL0) circuit must be coded at the gate level.
// For each 8-bit byte, a 3-bit count and an "all zero" will be computed.  The
// "all zero" will then be used to find which byte contains the leading 1.
// The 3-bit count from each byte will be muxed using those "all zero" controls
// to form the 3 LSB's of the CNTL0.  The upper 4 bits of the CNTL0 are 
// computed directly from the byte "all zero" controls.  See the truth tables
// below for more details.
//
//                                    byte
//         clth[7:0]    |  cnt[2:0]   zero
//     -----------------|-----------------
//     1 x x x x x x x  |   0 0 0      0
//     0 1 x x x x x x  |   0 0 1      0
//     0 0 1 x x x x x  |   0 1 0      0
//     0 0 0 1 x x x x  |   0 1 1      0
//     0 0 0 0 1 x x x  |   1 0 0      0
//     0 0 0 0 0 1 x x  |   1 0 1      0
//     0 0 0 0 0 0 1 x  |   1 1 0      0
//     0 0 0 0 0 0 0 1  |   1 1 1      0
//     0 0 0 0 0 0 0 0  |   0 0 0      1
//
//
//          Byte Zero_
//    z7 z6 z5 z4 z3 z2 z1 z0  |   cnt[6:3]
//    -------------------------|-------------
//    1  x  x  x  x  x  x  x   |   0 0 0 0
//    0  1  x  x  x  x  x  x   |   0 0 0 1
//    0  0  1  x  x  x  x  x   |   0 0 1 0
//    0  0  0  1  x  x  x  x   |   0 0 1 1
//    0  0  0  0  1  x  x  x   |   0 1 0 0
//    0  0  0  0  0  1  x  x   |   0 1 0 1
//    0  0  0  0  0  0  1  x   |   0 1 1 0
//    0  0  0  0  0  0  0  1   |   0 1 1 1
//    0  0  0  0  0  0  0  0   |   1 x x x (divide ENDS!)
//
//
// Byte Zero_ is an 8-way OR of all bits in that byte.
// This can be accomplished by 4 * Nor2 + Nand4
//
// In order to compute the 3-bit count, we must further
// divide the byte down into an upper and lower half.
//
// Estimated critical path :
//    NOR2 + NAND4 + PE(3->4) + MUX4 + MUX2 + MUX3(merge CNTL0 + CNTL1)


assign clth[63:0] = fdd_pe_clth[63:0];


// ************************ BYTE 0 => 07:00 **************************

assign b0_nor_76  = ~(clth[7] | clth[6]);
assign b0_nor_54  = ~(clth[5] | clth[4]);
assign b0_nor_32  = ~(clth[3] | clth[2]);
assign b0_nor_10  = ~(clth[1] | clth[0]);

assign b0_zeroh_  = ~(b0_nor_76 & b0_nor_54);
assign b0_zerol_  = ~(b0_nor_32 & b0_nor_10);
assign b0_zero_   = ~(b0_nor_76 & b0_nor_54 & b0_nor_32 & b0_nor_10);

assign b0_cnth[0] =  (~clth[7] &  clth[6]                        ) | 
                     (~clth[7] &             ~clth[5] &  clth[4]);

assign b0_cnth[1] =  (~clth[7] & ~clth[6] &  clth[5]            ) | 
                     (~clth[7] & ~clth[6] &              clth[4]);

assign b0_cntl[0] =  (~clth[3] &  clth[2]                        ) | 
                     (~clth[3] &             ~clth[1] &  clth[0]);

assign b0_cntl[1] =  (~clth[3] & ~clth[2] &  clth[1]            ) | 
                     (~clth[3] & ~clth[2] &              clth[0]);

assign b0_cnt[0]  =  ( b0_zeroh_ & b0_cnth[0]) |
                     (~b0_zeroh_ & b0_cntl[0]);

assign b0_cnt[1]  =  ( b0_zeroh_ & b0_cnth[1]) |
                     (~b0_zeroh_ & b0_cntl[1]);

assign b0_cnt[2]  =  (~b0_zeroh_ & b0_zerol_);


// ************************ BYTE 1 => 15:08 **************************

assign b1_nor_76  = ~(clth[15] | clth[14]);
assign b1_nor_54  = ~(clth[13] | clth[12]);
assign b1_nor_32  = ~(clth[11] | clth[10]);
assign b1_nor_10  = ~(clth[9] | clth[8]);

assign b1_zeroh_  = ~(b1_nor_76 & b1_nor_54);
assign b1_zerol_  = ~(b1_nor_32 & b1_nor_10);
assign b1_zero_   = ~(b1_nor_76 & b1_nor_54 & b1_nor_32 & b1_nor_10);

assign b1_cnth[0] =  (~clth[15] &  clth[14]                        ) | 
                     (~clth[15] &             ~clth[13] &  clth[12]);

assign b1_cnth[1] =  (~clth[15] & ~clth[14] &  clth[13]            ) | 
                     (~clth[15] & ~clth[14] &              clth[12]);

assign b1_cntl[0] =  (~clth[11] &  clth[10]                        ) | 
                     (~clth[11] &             ~clth[9] &  clth[8]);

assign b1_cntl[1] =  (~clth[11] & ~clth[10] &  clth[9]            ) | 
                     (~clth[11] & ~clth[10] &              clth[8]);

assign b1_cnt[0]  =  ( b1_zeroh_ & b1_cnth[0]) |
                     (~b1_zeroh_ & b1_cntl[0]);

assign b1_cnt[1]  =  ( b1_zeroh_ & b1_cnth[1]) |
                     (~b1_zeroh_ & b1_cntl[1]);

assign b1_cnt[2]  =  (~b1_zeroh_ & b1_zerol_);


// ************************ BYTE 2 => 23:16 **************************

assign b2_nor_76  = ~(clth[23] | clth[22]);
assign b2_nor_54  = ~(clth[21] | clth[20]);
assign b2_nor_32  = ~(clth[19] | clth[18]);
assign b2_nor_10  = ~(clth[17] | clth[16]);

assign b2_zeroh_  = ~(b2_nor_76 & b2_nor_54);
assign b2_zerol_  = ~(b2_nor_32 & b2_nor_10);
assign b2_zero_   = ~(b2_nor_76 & b2_nor_54 & b2_nor_32 & b2_nor_10);

assign b2_cnth[0] =  (~clth[23] &  clth[22]                        ) | 
                     (~clth[23] &             ~clth[21] &  clth[20]);

assign b2_cnth[1] =  (~clth[23] & ~clth[22] &  clth[21]            ) | 
                     (~clth[23] & ~clth[22] &              clth[20]);

assign b2_cntl[0] =  (~clth[19] &  clth[18]                        ) | 
                     (~clth[19] &             ~clth[17] &  clth[16]);

assign b2_cntl[1] =  (~clth[19] & ~clth[18] &  clth[17]            ) | 
                     (~clth[19] & ~clth[18] &              clth[16]);

assign b2_cnt[0]  =  ( b2_zeroh_ & b2_cnth[0]) |
                     (~b2_zeroh_ & b2_cntl[0]);

assign b2_cnt[1]  =  ( b2_zeroh_ & b2_cnth[1]) |
                     (~b2_zeroh_ & b2_cntl[1]);

assign b2_cnt[2]  =  (~b2_zeroh_ & b2_zerol_);


// ************************ BYTE 3 => 31:24 **************************

assign b3_nor_76  = ~(clth[31] | clth[30]);
assign b3_nor_54  = ~(clth[29] | clth[28]);
assign b3_nor_32  = ~(clth[27] | clth[26]);
assign b3_nor_10  = ~(clth[25] | clth[24]);

assign b3_zeroh_  = ~(b3_nor_76 & b3_nor_54);
assign b3_zerol_  = ~(b3_nor_32 & b3_nor_10);
assign b3_zero_   = ~(b3_nor_76 & b3_nor_54 & b3_nor_32 & b3_nor_10);

assign b3_cnth[0] =  (~clth[31] &  clth[30]                        ) | 
                     (~clth[31] &             ~clth[29] &  clth[28]);

assign b3_cnth[1] =  (~clth[31] & ~clth[30] &  clth[29]            ) | 
                     (~clth[31] & ~clth[30] &              clth[28]);

assign b3_cntl[0] =  (~clth[27] &  clth[26]                        ) | 
                     (~clth[27] &             ~clth[25] &  clth[24]);

assign b3_cntl[1] =  (~clth[27] & ~clth[26] &  clth[25]            ) | 
                     (~clth[27] & ~clth[26] &              clth[24]);

assign b3_cnt[0]  =  ( b3_zeroh_ & b3_cnth[0]) |
                     (~b3_zeroh_ & b3_cntl[0]);

assign b3_cnt[1]  =  ( b3_zeroh_ & b3_cnth[1]) |
                     (~b3_zeroh_ & b3_cntl[1]);

assign b3_cnt[2]  =  (~b3_zeroh_ & b3_zerol_);


// ************************ BYTE 4 => 39:32 **************************

assign b4_nor_76  = ~(clth[39] | clth[38]);
assign b4_nor_54  = ~(clth[37] | clth[36]);
assign b4_nor_32  = ~(clth[35] | clth[34]);
assign b4_nor_10  = ~(clth[33] | clth[32]);

assign b4_zeroh_  = ~(b4_nor_76 & b4_nor_54);
assign b4_zerol_  = ~(b4_nor_32 & b4_nor_10);
assign b4_zero_   = ~(b4_nor_76 & b4_nor_54 & b4_nor_32 & b4_nor_10);

assign b4_cnth[0] =  (~clth[39] &  clth[38]                        ) | 
                     (~clth[39] &             ~clth[37] &  clth[36]);

assign b4_cnth[1] =  (~clth[39] & ~clth[38] &  clth[37]            ) | 
                     (~clth[39] & ~clth[38] &              clth[36]);

assign b4_cntl[0] =  (~clth[35] &  clth[34]                        ) | 
                     (~clth[35] &             ~clth[33] &  clth[32]);

assign b4_cntl[1] =  (~clth[35] & ~clth[34] &  clth[33]            ) | 
                     (~clth[35] & ~clth[34] &              clth[32]);

assign b4_cnt[0]  =  ( b4_zeroh_ & b4_cnth[0]) |
                     (~b4_zeroh_ & b4_cntl[0]);

assign b4_cnt[1]  =  ( b4_zeroh_ & b4_cnth[1]) |
                     (~b4_zeroh_ & b4_cntl[1]);

assign b4_cnt[2]  =  (~b4_zeroh_ & b4_zerol_);


// ************************ BYTE 5 => 47:40 **************************

assign b5_nor_76  = ~(clth[47] | clth[46]);
assign b5_nor_54  = ~(clth[45] | clth[44]);
assign b5_nor_32  = ~(clth[43] | clth[42]);
assign b5_nor_10  = ~(clth[41] | clth[40]);

assign b5_zeroh_  = ~(b5_nor_76 & b5_nor_54);
assign b5_zerol_  = ~(b5_nor_32 & b5_nor_10);
assign b5_zero_   = ~(b5_nor_76 & b5_nor_54 & b5_nor_32 & b5_nor_10);

assign b5_cnth[0] =  (~clth[47] &  clth[46]                        ) | 
                     (~clth[47] &             ~clth[45] &  clth[44]);

assign b5_cnth[1] =  (~clth[47] & ~clth[46] &  clth[45]            ) | 
                     (~clth[47] & ~clth[46] &              clth[44]);

assign b5_cntl[0] =  (~clth[43] &  clth[42]                        ) | 
                     (~clth[43] &             ~clth[41] &  clth[40]);

assign b5_cntl[1] =  (~clth[43] & ~clth[42] &  clth[41]            ) | 
                     (~clth[43] & ~clth[42] &              clth[40]);

assign b5_cnt[0]  =  ( b5_zeroh_ & b5_cnth[0]) |
                     (~b5_zeroh_ & b5_cntl[0]);

assign b5_cnt[1]  =  ( b5_zeroh_ & b5_cnth[1]) |
                     (~b5_zeroh_ & b5_cntl[1]);

assign b5_cnt[2]  =  (~b5_zeroh_ & b5_zerol_);


// ************************ BYTE 6 => 55:48 **************************

assign b6_nor_76  = ~(clth[55] | clth[54]);
assign b6_nor_54  = ~(clth[53] | clth[52]);
assign b6_nor_32  = ~(clth[51] | clth[50]);
assign b6_nor_10  = ~(clth[49] | clth[48]);

assign b6_zeroh_  = ~(b6_nor_76 & b6_nor_54);
assign b6_zerol_  = ~(b6_nor_32 & b6_nor_10);
assign b6_zero_   = ~(b6_nor_76 & b6_nor_54 & b6_nor_32 & b6_nor_10);

assign b6_cnth[0] =  (~clth[55] &  clth[54]                        ) | 
                     (~clth[55] &             ~clth[53] &  clth[52]);

assign b6_cnth[1] =  (~clth[55] & ~clth[54] &  clth[53]            ) | 
                     (~clth[55] & ~clth[54] &              clth[52]);

assign b6_cntl[0] =  (~clth[51] &  clth[50]                        ) | 
                     (~clth[51] &             ~clth[49] &  clth[48]);

assign b6_cntl[1] =  (~clth[51] & ~clth[50] &  clth[49]            ) | 
                     (~clth[51] & ~clth[50] &              clth[48]);

assign b6_cnt[0]  =  ( b6_zeroh_ & b6_cnth[0]) |
                     (~b6_zeroh_ & b6_cntl[0]);

assign b6_cnt[1]  =  ( b6_zeroh_ & b6_cnth[1]) |
                     (~b6_zeroh_ & b6_cntl[1]);

assign b6_cnt[2]  =  (~b6_zeroh_ & b6_zerol_);


// ************************ BYTE 7 => 63:56 **************************

assign b7_nor_76  = ~(clth[63] | clth[62]);
assign b7_nor_54  = ~(clth[61] | clth[60]);
assign b7_nor_32  = ~(clth[59] | clth[58]);
assign b7_nor_10  = ~(clth[57] | clth[56]);

assign b7_zeroh_  = ~(b7_nor_76 & b7_nor_54);
assign b7_zerol_  = ~(b7_nor_32 & b7_nor_10);
assign b7_zero_   = ~(b7_nor_76 & b7_nor_54 & b7_nor_32 & b7_nor_10);

assign b7_cnth[0] =  (~clth[63] &  clth[62]                        ) | 
                     (~clth[63] &             ~clth[61] &  clth[60]);

assign b7_cnth[1] =  (~clth[63] & ~clth[62] &  clth[61]            ) | 
                     (~clth[63] & ~clth[62] &              clth[60]);

assign b7_cntl[0] =  (~clth[59] &  clth[58]                        ) | 
                     (~clth[59] &             ~clth[57] &  clth[56]);

assign b7_cntl[1] =  (~clth[59] & ~clth[58] &  clth[57]            ) | 
                     (~clth[59] & ~clth[58] &              clth[56]);

assign b7_cnt[0]  =  ( b7_zeroh_ & b7_cnth[0]) |
                     (~b7_zeroh_ & b7_cntl[0]);

assign b7_cnt[1]  =  ( b7_zeroh_ & b7_cnth[1]) |
                     (~b7_zeroh_ & b7_cntl[1]);

assign b7_cnt[2]  =  (~b7_zeroh_ & b7_zerol_);



// ************************  Global CNTL0   **************************

// When CNTL0[6] = 1   all other bits become a DON'T CARE

assign b3_0sel     =  b3_zero_                        ;
assign b2_0sel     = ~b3_zero_ &  b2_zero_            ;
assign b1_0sel     = ~b3_zero_ & ~b2_zero_ &  b1_zero_;
assign b0_0sel     = ~b3_zero_ & ~b2_zero_ & ~b1_zero_;

assign cntl0l[4:0] = ({5{b3_0sel}} & {2'b00,b3_cnt[2:0]}) |
                     ({5{b2_0sel}} & {2'b01,b2_cnt[2:0]}) |
                     ({5{b1_0sel}} & {2'b10,b1_cnt[2:0]}) |
                     ({5{b0_0sel}} & {2'b11,b0_cnt[2:0]});


assign b7_0sel     =  b7_zero_                        ;
assign b6_0sel     = ~b7_zero_ &  b6_zero_            ;
assign b5_0sel     = ~b7_zero_ & ~b6_zero_ &  b5_zero_;
assign b4_0sel     = ~b7_zero_ & ~b6_zero_ & ~b5_zero_;

assign cntl0h[4:0] = ({5{b7_0sel}} & {2'b00,b7_cnt[2:0]}) |
                     ({5{b6_0sel}} & {2'b01,b6_cnt[2:0]}) |
                     ({5{b5_0sel}} & {2'b10,b5_cnt[2:0]}) |
                     ({5{b4_0sel}} & {2'b11,b4_cnt[2:0]});

assign cntl0_selh  =  b7_zero_ | b6_zero_ | b5_zero_ | b4_zero_;
assign cntl0_sell  =  b3_zero_ | b2_zero_ | b1_zero_ | b0_zero_;
assign cntl0[6]    = ~(cntl0_selh | cntl0_sell);

assign cntl0[5:0]  = ({6{ cntl0_selh}} & {1'b0, cntl0h[4:0]}) |
                     ({6{~cntl0_selh}} & {1'b1, cntl0l[4:0]});


// * * * * * * * * * * * * End   : Integer CNTL0 * * * * * * * * * * * * * 

 
// * * * * * * * * * * * * Start : Integer CNTL1 * * * * * * * * * * * * * 

//reg [6:0] cntl1;
//
//always @ (fdd_pe_clth[63:0])
//
// begin
//
//
// casex (fdd_pe_clth[63:0])
//  64'b0???????????????????????????????????????????????????????????????: cntl1[6:0]  =  7'b0000000;
//
//  64'b10??????????????????????????????????????????????????????????????: cntl1[6:0]  =  7'b0000000;
//  64'b110?????????????????????????????????????????????????????????????: cntl1[6:0]  =  7'b0000001;
//  64'b1110????????????????????????????????????????????????????????????: cntl1[6:0]  =  7'b0000010;
//  64'b11110???????????????????????????????????????????????????????????: cntl1[6:0]  =  7'b0000011;
//  64'b111110??????????????????????????????????????????????????????????: cntl1[6:0]  =  7'b0000100;
//  64'b1111110?????????????????????????????????????????????????????????: cntl1[6:0]  =  7'b0000101;
//  64'b11111110????????????????????????????????????????????????????????: cntl1[6:0]  =  7'b0000110;
//  64'b111111110???????????????????????????????????????????????????????: cntl1[6:0]  =  7'b0000111;
//
//  64'b1111111110??????????????????????????????????????????????????????: cntl1[6:0]  =  7'b0001000;
//  64'b11111111110?????????????????????????????????????????????????????: cntl1[6:0]  =  7'b0001001;
//  64'b111111111110????????????????????????????????????????????????????: cntl1[6:0]  =  7'b0001010;
//  64'b1111111111110???????????????????????????????????????????????????: cntl1[6:0]  =  7'b0001011;
//  64'b11111111111110??????????????????????????????????????????????????: cntl1[6:0]  =  7'b0001100;
//  64'b111111111111110?????????????????????????????????????????????????: cntl1[6:0]  =  7'b0001101;
//  64'b1111111111111110????????????????????????????????????????????????: cntl1[6:0]  =  7'b0001110;
//  64'b11111111111111110???????????????????????????????????????????????: cntl1[6:0]  =  7'b0001111;
//
//  64'b111111111111111110??????????????????????????????????????????????: cntl1[6:0]  =  7'b0010000;
//  64'b1111111111111111110?????????????????????????????????????????????: cntl1[6:0]  =  7'b0010001;
//  64'b11111111111111111110????????????????????????????????????????????: cntl1[6:0]  =  7'b0010010;
//  64'b111111111111111111110???????????????????????????????????????????: cntl1[6:0]  =  7'b0010011;
//  64'b1111111111111111111110??????????????????????????????????????????: cntl1[6:0]  =  7'b0010100;
//  64'b11111111111111111111110?????????????????????????????????????????: cntl1[6:0]  =  7'b0010101;
//  64'b111111111111111111111110????????????????????????????????????????: cntl1[6:0]  =  7'b0010110;
//  64'b1111111111111111111111110???????????????????????????????????????: cntl1[6:0]  =  7'b0010111;
//
//  64'b11111111111111111111111110??????????????????????????????????????: cntl1[6:0]  =  7'b0011000;
//  64'b111111111111111111111111110?????????????????????????????????????: cntl1[6:0]  =  7'b0011001;
//  64'b1111111111111111111111111110????????????????????????????????????: cntl1[6:0]  =  7'b0011010;
//  64'b11111111111111111111111111110???????????????????????????????????: cntl1[6:0]  =  7'b0011011;
//  64'b111111111111111111111111111110??????????????????????????????????: cntl1[6:0]  =  7'b0011100;
//  64'b1111111111111111111111111111110?????????????????????????????????: cntl1[6:0]  =  7'b0011101;
//  64'b11111111111111111111111111111110????????????????????????????????: cntl1[6:0]  =  7'b0011110;
//  64'b111111111111111111111111111111110???????????????????????????????: cntl1[6:0]  =  7'b0011111;
//
//  64'b1111111111111111111111111111111110??????????????????????????????: cntl1[6:0]  =  7'b0100000;
//  64'b11111111111111111111111111111111110?????????????????????????????: cntl1[6:0]  =  7'b0100001;
//  64'b111111111111111111111111111111111110????????????????????????????: cntl1[6:0]  =  7'b0100010;
//  64'b1111111111111111111111111111111111110???????????????????????????: cntl1[6:0]  =  7'b0100011;
//  64'b11111111111111111111111111111111111110??????????????????????????: cntl1[6:0]  =  7'b0100100;
//  64'b111111111111111111111111111111111111110?????????????????????????: cntl1[6:0]  =  7'b0100101;
//  64'b1111111111111111111111111111111111111110????????????????????????: cntl1[6:0]  =  7'b0100110;
//  64'b11111111111111111111111111111111111111110???????????????????????: cntl1[6:0]  =  7'b0100111;
//
//  64'b111111111111111111111111111111111111111110??????????????????????: cntl1[6:0]  =  7'b0101000;
//  64'b1111111111111111111111111111111111111111110?????????????????????: cntl1[6:0]  =  7'b0101001;
//  64'b11111111111111111111111111111111111111111110????????????????????: cntl1[6:0]  =  7'b0101010;
//  64'b111111111111111111111111111111111111111111110???????????????????: cntl1[6:0]  =  7'b0101011;
//  64'b1111111111111111111111111111111111111111111110??????????????????: cntl1[6:0]  =  7'b0101100;
//  64'b11111111111111111111111111111111111111111111110?????????????????: cntl1[6:0]  =  7'b0101101;
//  64'b111111111111111111111111111111111111111111111110????????????????: cntl1[6:0]  =  7'b0101110;
//  64'b1111111111111111111111111111111111111111111111110???????????????: cntl1[6:0]  =  7'b0101111;
//
//  64'b11111111111111111111111111111111111111111111111110??????????????: cntl1[6:0]  =  7'b0110000;
//  64'b111111111111111111111111111111111111111111111111110?????????????: cntl1[6:0]  =  7'b0110001;
//  64'b1111111111111111111111111111111111111111111111111110????????????: cntl1[6:0]  =  7'b0110010;
//  64'b11111111111111111111111111111111111111111111111111110???????????: cntl1[6:0]  =  7'b0110011;
//  64'b111111111111111111111111111111111111111111111111111110??????????: cntl1[6:0]  =  7'b0110100;
//  64'b1111111111111111111111111111111111111111111111111111110?????????: cntl1[6:0]  =  7'b0110101;
//  64'b11111111111111111111111111111111111111111111111111111110????????: cntl1[6:0]  =  7'b0110110;
//  64'b111111111111111111111111111111111111111111111111111111110???????: cntl1[6:0]  =  7'b0110111;
//
//  64'b1111111111111111111111111111111111111111111111111111111110??????: cntl1[6:0]  =  7'b0111000;
//  64'b11111111111111111111111111111111111111111111111111111111110?????: cntl1[6:0]  =  7'b0111001;
//  64'b111111111111111111111111111111111111111111111111111111111110????: cntl1[6:0]  =  7'b0111010;
//  64'b1111111111111111111111111111111111111111111111111111111111110???: cntl1[6:0]  =  7'b0111011;
//  64'b11111111111111111111111111111111111111111111111111111111111110??: cntl1[6:0]  =  7'b0111100;
//  64'b111111111111111111111111111111111111111111111111111111111111110?: cntl1[6:0]  =  7'b0111101;
//  64'b1111111111111111111111111111111111111111111111111111111111111110: cntl1[6:0]  =  7'b0111110;
//  64'b1111111111111111111111111111111111111111111111111111111111111111: cntl1[6:0]  =  7'b0111111;
//
//  default:                                                              cntl1[6:0]  =  7'b0000000;
//
// endcase
//
//end


// The count leading one (CNTL1) here must compute "n-1"
// leading 1's.  To do this, each local byte will receive
// an offset input.
// Note : If clth[63] = 0   then CNTL1 is a DON'T CARE

//                                    byte
//         clth[7:0]    |  cnt[2:0]   ones
//     -----------------|-----------------
//     0 x x x x x x x  |   0 0 0      0
//     1 0 x x x x x x  |   0 0 1      0
//     1 1 0 x x x x x  |   0 1 0      0
//     1 1 1 0 x x x x  |   0 1 1      0
//     1 1 1 1 0 x x x  |   1 0 0      0
//     1 1 1 1 1 0 x x  |   1 0 1      0
//     1 1 1 1 1 1 0 x  |   1 1 0      0
//     1 1 1 1 1 1 1 0  |   1 1 1      0
//     1 1 1 1 1 1 1 1  |   0 0 0      1    (byte 0 is '111' here)
//
//
//          Byte Ones_
//    z7 z6 z5 z4 z3 z2 z1 z0  |   cnt[6:3]
//    -------------------------|-------------
//    1  x  x  x  x  x  x  x   |   0 0 0 0
//    0  1  x  x  x  x  x  x   |   0 0 0 1
//    0  0  1  x  x  x  x  x   |   0 0 1 0
//    0  0  0  1  x  x  x  x   |   0 0 1 1
//    0  0  0  0  1  x  x  x   |   0 1 0 0
//    0  0  0  0  0  1  x  x   |   0 1 0 1
//    0  0  0  0  0  0  1  x   |   0 1 1 0
//    0  0  0  0  0  0  0  1   |   0 1 1 1
//    0  0  0  0  0  0  0  0   |   1 x x x  (divide ENDS!)
//
//
// Estimated critical path :
//    NAND4 + NOR2 + INV + PE(3->4) + MUX4 + MUX2 + MUX3(merge CNTL0 + CNTL1)



// ************************ BYTE 7 => 62:55 **************************

assign b7_nand_74  = ~(clth[62] & clth[61] & clth[60] & clth[59]);
assign b7_nand_30  = ~(clth[58] & clth[57] & clth[56] & clth[55]);

assign b7_ones     = ~(b7_nand_74 | b7_nand_30);
assign b7_ones_    = ~b7_ones;

assign b7_cnt1h[0] =  ( clth[62] & ~clth[61]                        ) | 
                      ( clth[62] &              clth[60] & ~clth[59]);

assign b7_cnt1h[1] =  ( clth[62] &  clth[61] & ~clth[60]            ) | 
                      ( clth[62] &  clth[61] &             ~clth[59]);

assign b7_cnt1l[0] =  ( clth[58] & ~clth[57]                        ) | 
                      ( clth[58] &              clth[56] & ~clth[55]);

assign b7_cnt1l[1] =  ( clth[58] &  clth[57] & ~clth[56]            ) | 
                      ( clth[58] &  clth[57] &             ~clth[55]);

assign b7_cnt1[0]  =  ( b7_nand_74 & b7_cnt1h[0]) |
                      (~b7_nand_74 & b7_cnt1l[0]);

assign b7_cnt1[1]  =  ( b7_nand_74 & b7_cnt1h[1]) |
                      (~b7_nand_74 & b7_cnt1l[1]);

assign b7_cnt1[2]  =  (~b7_nand_74 & b7_nand_30);


// ************************ BYTE 6 => 54:47 **************************

assign b6_nand_74  = ~(clth[54] & clth[53] & clth[52] & clth[51]);
assign b6_nand_30  = ~(clth[50] & clth[49] & clth[48] & clth[47]);

assign b6_ones     = ~(b6_nand_74 | b6_nand_30);
assign b6_ones_    = ~b6_ones;

assign b6_cnt1h[0] =  ( clth[54] & ~clth[53]                        ) | 
                      ( clth[54] &              clth[52] & ~clth[51]);

assign b6_cnt1h[1] =  ( clth[54] &  clth[53] & ~clth[52]            ) | 
                      ( clth[54] &  clth[53] &             ~clth[51]);

assign b6_cnt1l[0] =  ( clth[50] & ~clth[49]                        ) | 
                      ( clth[50] &              clth[48] & ~clth[47]);

assign b6_cnt1l[1] =  ( clth[50] &  clth[49] & ~clth[48]            ) | 
                      ( clth[50] &  clth[49] &             ~clth[47]);

assign b6_cnt1[0]  =  ( b6_nand_74 & b6_cnt1h[0]) |
                      (~b6_nand_74 & b6_cnt1l[0]);

assign b6_cnt1[1]  =  ( b6_nand_74 & b6_cnt1h[1]) |
                      (~b6_nand_74 & b6_cnt1l[1]);

assign b6_cnt1[2]  =  (~b6_nand_74 & b6_nand_30);


// ************************ BYTE 5 => 46:39 **************************

assign b5_nand_74  = ~(clth[46] & clth[45] & clth[44] & clth[43]);
assign b5_nand_30  = ~(clth[42] & clth[41] & clth[40] & clth[39]);

assign b5_ones     = ~(b5_nand_74 | b5_nand_30);
assign b5_ones_    = ~b5_ones;

assign b5_cnt1h[0] =  ( clth[46] & ~clth[45]                        ) | 
                      ( clth[46] &              clth[44] & ~clth[43]);

assign b5_cnt1h[1] =  ( clth[46] &  clth[45] & ~clth[44]            ) | 
                      ( clth[46] &  clth[45] &             ~clth[43]);

assign b5_cnt1l[0] =  ( clth[42] & ~clth[41]                        ) | 
                      ( clth[42] &              clth[40] & ~clth[39]);

assign b5_cnt1l[1] =  ( clth[42] &  clth[41] & ~clth[40]            ) | 
                      ( clth[42] &  clth[41] &             ~clth[39]);

assign b5_cnt1[0]  =  ( b5_nand_74 & b5_cnt1h[0]) |
                      (~b5_nand_74 & b5_cnt1l[0]);

assign b5_cnt1[1]  =  ( b5_nand_74 & b5_cnt1h[1]) |
                      (~b5_nand_74 & b5_cnt1l[1]);

assign b5_cnt1[2]  =  (~b5_nand_74 & b5_nand_30);


// ************************ BYTE 4 => 38:31 **************************

assign b4_nand_74  = ~(clth[38] & clth[37] & clth[36] & clth[35]);
assign b4_nand_30  = ~(clth[34] & clth[33] & clth[32] & clth[31]);

assign b4_ones     = ~(b4_nand_74 | b4_nand_30);
assign b4_ones_    = ~b4_ones;

assign b4_cnt1h[0] =  ( clth[38] & ~clth[37]                        ) | 
                      ( clth[38] &              clth[36] & ~clth[35]);

assign b4_cnt1h[1] =  ( clth[38] &  clth[37] & ~clth[36]            ) | 
                      ( clth[38] &  clth[37] &             ~clth[35]);

assign b4_cnt1l[0] =  ( clth[34] & ~clth[33]                        ) | 
                      ( clth[34] &              clth[32] & ~clth[31]);

assign b4_cnt1l[1] =  ( clth[34] &  clth[33] & ~clth[32]            ) | 
                      ( clth[34] &  clth[33] &             ~clth[31]);

assign b4_cnt1[0]  =  ( b4_nand_74 & b4_cnt1h[0]) |
                      (~b4_nand_74 & b4_cnt1l[0]);

assign b4_cnt1[1]  =  ( b4_nand_74 & b4_cnt1h[1]) |
                      (~b4_nand_74 & b4_cnt1l[1]);

assign b4_cnt1[2]  =  (~b4_nand_74 & b4_nand_30);


// ************************ BYTE 3 => 30:23 **************************

assign b3_nand_74  = ~(clth[30] & clth[29] & clth[28] & clth[27]);
assign b3_nand_30  = ~(clth[26] & clth[25] & clth[24] & clth[23]);

assign b3_ones     = ~(b3_nand_74 | b3_nand_30);
assign b3_ones_    = ~b3_ones;

assign b3_cnt1h[0] =  ( clth[30] & ~clth[29]                        ) | 
                      ( clth[30] &              clth[28] & ~clth[27]);

assign b3_cnt1h[1] =  ( clth[30] &  clth[29] & ~clth[28]            ) | 
                      ( clth[30] &  clth[29] &             ~clth[27]);

assign b3_cnt1l[0] =  ( clth[26] & ~clth[25]                        ) | 
                      ( clth[26] &              clth[24] & ~clth[23]);

assign b3_cnt1l[1] =  ( clth[26] &  clth[25] & ~clth[24]            ) | 
                      ( clth[26] &  clth[25] &             ~clth[23]);

assign b3_cnt1[0]  =  ( b3_nand_74 & b3_cnt1h[0]) |
                      (~b3_nand_74 & b3_cnt1l[0]);

assign b3_cnt1[1]  =  ( b3_nand_74 & b3_cnt1h[1]) |
                      (~b3_nand_74 & b3_cnt1l[1]);

assign b3_cnt1[2]  =  (~b3_nand_74 & b3_nand_30);


// ************************ BYTE 2 => 22:15 **************************

assign b2_nand_74  = ~(clth[22] & clth[21] & clth[20] & clth[19]);
assign b2_nand_30  = ~(clth[18] & clth[17] & clth[16] & clth[15]);

assign b2_ones     = ~(b2_nand_74 | b2_nand_30);
assign b2_ones_    = ~b2_ones;

assign b2_cnt1h[0] =  ( clth[22] & ~clth[21]                        ) | 
                      ( clth[22] &              clth[20] & ~clth[19]);

assign b2_cnt1h[1] =  ( clth[22] &  clth[21] & ~clth[20]            ) | 
                      ( clth[22] &  clth[21] &             ~clth[19]);

assign b2_cnt1l[0] =  ( clth[18] & ~clth[17]                        ) | 
                      ( clth[18] &              clth[16] & ~clth[15]);

assign b2_cnt1l[1] =  ( clth[18] &  clth[17] & ~clth[16]            ) | 
                      ( clth[18] &  clth[17] &             ~clth[15]);

assign b2_cnt1[0]  =  ( b2_nand_74 & b2_cnt1h[0]) |
                      (~b2_nand_74 & b2_cnt1l[0]);

assign b2_cnt1[1]  =  ( b2_nand_74 & b2_cnt1h[1]) |
                      (~b2_nand_74 & b2_cnt1l[1]);

assign b2_cnt1[2]  =  (~b2_nand_74 & b2_nand_30);


// ************************ BYTE 1 => 14:07 **************************

assign b1_nand_74  = ~(clth[14] & clth[13] & clth[12] & clth[11]);
assign b1_nand_30  = ~(clth[10] & clth[9] & clth[8] & clth[7]);

assign b1_ones     = ~(b1_nand_74 | b1_nand_30);
assign b1_ones_    = ~b1_ones;

assign b1_cnt1h[0] =  ( clth[14] & ~clth[13]                        ) | 
                      ( clth[14] &              clth[12] & ~clth[11]);

assign b1_cnt1h[1] =  ( clth[14] &  clth[13] & ~clth[12]            ) | 
                      ( clth[14] &  clth[13] &             ~clth[11]);

assign b1_cnt1l[0] =  ( clth[10] & ~clth[9]                        ) | 
                      ( clth[10] &              clth[8] & ~clth[7]);

assign b1_cnt1l[1] =  ( clth[10] &  clth[9] & ~clth[8]            ) | 
                      ( clth[10] &  clth[9] &             ~clth[7]);

assign b1_cnt1[0]  =  ( b1_nand_74 & b1_cnt1h[0]) |
                      (~b1_nand_74 & b1_cnt1l[0]);

assign b1_cnt1[1]  =  ( b1_nand_74 & b1_cnt1h[1]) |
                      (~b1_nand_74 & b1_cnt1l[1]);

assign b1_cnt1[2]  =  (~b1_nand_74 & b1_nand_30);


// ************************ BYTE 0 => 06:00 **************************

// Note : Byte 0 is unique since cnt1[2:0] must be 3'b111 for byte 'all ones' case!
//  64'b1111111111111111111111111111111111111111111111111111111110??????: cntl1[6:0]  =  7'b0111000;
//  64'b11111111111111111111111111111111111111111111111111111111110?????: cntl1[6:0]  =  7'b0111001;
//  64'b111111111111111111111111111111111111111111111111111111111110????: cntl1[6:0]  =  7'b0111010;
//  64'b1111111111111111111111111111111111111111111111111111111111110???: cntl1[6:0]  =  7'b0111011;
//  64'b11111111111111111111111111111111111111111111111111111111111110??: cntl1[6:0]  =  7'b0111100;
//  64'b111111111111111111111111111111111111111111111111111111111111110?: cntl1[6:0]  =  7'b0111101;
//  64'b1111111111111111111111111111111111111111111111111111111111111110: cntl1[6:0]  =  7'b0111110;
//  64'b1111111111111111111111111111111111111111111111111111111111111111: cntl1[6:0]  =  7'b0111111;


assign b0_nand_74  = ~(clth[6] & clth[5] & clth[4] & clth[3]);

assign b0_cnt1h[0] =  ( clth[6] & ~clth[5]                        ) | 
                      ( clth[6] &              clth[4] & ~clth[3]);

assign b0_cnt1h[1] =  ( clth[6] &  clth[5] & ~clth[4]            ) | 
                      ( clth[6] &  clth[5] &             ~clth[3]);

assign b0_cnt1l[0] =  ( clth[2] & ~clth[1]                        ) |
                      ( clth[2] &              clth[0]            );

assign b0_cnt1l[1] =  ( clth[2] &  clth[1]                        );

assign b0_cnt1[0]  =  ( b0_nand_74 & b0_cnt1h[0]) |
                      (~b0_nand_74 & b0_cnt1l[0]);

assign b0_cnt1[1]  =  ( b0_nand_74 & b0_cnt1h[1]) |
                      (~b0_nand_74 & b0_cnt1l[1]);

assign b0_cnt1[2]  =  (~b0_nand_74             );



// ************************  Global CNTL1   **************************

assign b3_1sel     =  b3_ones_                        ;
assign b2_1sel     = ~b3_ones_ &  b2_ones_            ;
assign b1_1sel     = ~b3_ones_ & ~b2_ones_ &  b1_ones_;
assign b0_1sel     = ~b3_ones_ & ~b2_ones_ & ~b1_ones_;

assign cntl1l[4:0] = ({5{b3_1sel}} & {2'b00,b3_cnt1[2:0]}) |
                     ({5{b2_1sel}} & {2'b01,b2_cnt1[2:0]}) |
                     ({5{b1_1sel}} & {2'b10,b1_cnt1[2:0]}) |
                     ({5{b0_1sel}} & {2'b11,b0_cnt1[2:0]});


assign b7_1sel     =  b7_ones_                        ;
assign b6_1sel     = ~b7_ones_ &  b6_ones_            ;
assign b5_1sel     = ~b7_ones_ & ~b6_ones_ &  b5_ones_;
assign b4_1sel     = ~b7_ones_ & ~b6_ones_ & ~b5_ones_;

assign cntl1h[4:0] = ({5{b7_1sel}} & {2'b00,b7_cnt1[2:0]}) |
                     ({5{b6_1sel}} & {2'b01,b6_cnt1[2:0]}) |
                     ({5{b5_1sel}} & {2'b10,b5_cnt1[2:0]}) |
                     ({5{b4_1sel}} & {2'b11,b4_cnt1[2:0]});



assign cntl1_selh  = b7_ones_ | b6_ones_ | b5_ones_ | b4_ones_;

assign cntl1[5:0]  = ({6{ cntl1_selh}} & {1'b0, cntl1h[4:0]}) |
                     ({6{~cntl1_selh}} & {1'b1, cntl1l[4:0]});


// * * * * * * * * * * * * End   : Integer CNTL1 * * * * * * * * * * * * * 


assign xsht_amt_sel10   = ~(fdd_pe_clth[63] & control_lth[0]) & fdc_pe_cycle[1];
assign xsht_amt_sel11   =  (fdd_pe_clth[63] & control_lth[0]) & fdc_pe_cycle[1];
assign xsht_amt_sel20   = ~(fdd_pe_clth[63] & control_lth[0]) & fdc_pe_cycle[2];
assign xsht_amt_sel21   =  (fdd_pe_clth[63] & control_lth[0]) & fdc_pe_cycle[2];

assign xsht_amt_in[7:0] = ({8{engine_on     }} &  8'b11111101       ) |
                          ({8{xsht_amt_sel10}} & {1'b0 , cntl0[6:0]}) |
                          ({8{xsht_amt_sel11}} & {2'b00, cntl1[5:0]}) |
                          ({8{xsht_amt_sel20}} & {1'b1 ,~cntl0[6:0]}) |
                          ({8{xsht_amt_sel21}} & {2'b11,~cntl1[5:0]});


assign pe_ndq[7:0]	= pe_hamt_lth[7:0] + pe_xsht_amt[7:0] + 8'b0000_0001;

assign pe_hamt_in[7:0]	= ({8{    pe_hmux_sel[0]}} & 8'b00110100) |	// FLT DP
			  ({8{    pe_hmux_sel[1]}} & 8'b00010111) |	// FLT SP
			  ({8{fdc_pe_smux_sel[0]}} & 8'b00000001) |	// INT neg B correction
			  ({8{    pe_hmux_sel[2]}} & pe_ndq[7:0]);	// SRT loop counter



fgu_fdc_ctl_msff_ctl_macro__width_8	xsht_lth	 (
 .scan_in(xsht_lth_scanin),
 .scan_out(xsht_lth_scanout),
 .l1clk( l1clk_pm1        ),
 .din  ( xsht_amt_in[7:0] ),
 .dout ( pe_xsht_amt[7:0] ),
  .siclk(siclk),
  .soclk(soclk));


fgu_fdc_ctl_msff_ctl_macro__width_8	hamt_lth	 (
 .scan_in(hamt_lth_scanin),
 .scan_out(hamt_lth_scanout),
 .l1clk( l1clk_pm1		),
 .din  ( pe_hamt_in[7:0]	),
 .dout ( pe_hamt_lth[7:0]	),
  .siclk(siclk),
  .soclk(soclk));


assign xsht_ctl_in[5:0] = ({6{xsht_amt_sel10}} & cntl0[5:0]) |
                          ({6{xsht_amt_sel11}} & cntl1[5:0]) |
                          ({6{xsht_amt_sel20}} & cntl0[5:0]) |
                          ({6{xsht_amt_sel21}} & cntl1[5:0]);

fgu_fdc_ctl_msff_ctl_macro__width_6	xcntl_lth	 (
 .scan_in(xcntl_lth_scanin),
 .scan_out(xcntl_lth_scanout),
 .l1clk( l1clk_pm1            ),
 .din  ( xsht_ctl_in[5:0]     ),
 .dout ( fdc_pe_xsht_ctl[5:0] ),
  .siclk(siclk),
  .soclk(soclk));



 
// *** Floating Point Rounding ***


assign engine_valid_fx1	=   fac_div_valid_fx1    &  ~fac_divq_valid_fx1;
assign engine_valid_fx2	=  (queue_valid_lth_fx2  &  (fac_div_valid_fx1 & fac_divq_valid_fx1)) | engine_valid_lth_fx2;
assign engine_valid_fx3	=  (queue_valid_lth_fx3  &  (fac_div_valid_fx1 & fac_divq_valid_fx1)) | engine_valid_lth_fx3;

assign queue_valid_fx1	=  ~fac_div_valid_fx1    &   fac_divq_valid_fx1;
assign queue_valid_fx2	=   queue_valid_lth_fx2  & ~(fac_div_valid_fx1 & fac_divq_valid_fx1);
//sign queue_valid_fx3	=   queue_valid_lth_fx3  & ~(fac_div_valid_fx1 & fac_divq_valid_fx1);

assign q2e_fx3p		=  (fac_div_valid_fx1 & fac_divq_valid_fx1) & ~queue_valid_lth_fx2 & ~queue_valid_lth_fx3;


fgu_fdc_ctl_msff_ctl_macro__width_4	xrnd_vld_lth	 (
 .scan_in(xrnd_vld_lth_scanin),
 .scan_out(xrnd_vld_lth_scanout),
 .l1clk( l1clk_pm1                                                                         ),
 .din  ({engine_valid_fx1    ,engine_valid_fx2    ,queue_valid_fx1    ,queue_valid_fx2}    ),
 .dout ({engine_valid_lth_fx2,engine_valid_lth_fx3,queue_valid_lth_fx2,queue_valid_lth_fx3}),
  .siclk(siclk),
  .soclk(soclk));


// SPARC v9 : pg 44
//
//   RD  |  Round toward
//  ---  |  ------------
//   00  |  Nearest (even if tie)
//   01  |     0
//   10  |  +INF
//   11  |  -INF


assign eround_mode_in[1:0]= ({2{ engine_valid_fx3            }} & fpc_rd_mode_fx3[1:0]) |
                            ({2{                     q2e_fx3p}} & qround_mode_lth[1:0]) |
                            ({2{~engine_valid_fx3 & ~q2e_fx3p}} & eround_mode_lth[1:0]);

assign e_emin_in          = (    engine_valid_fx3               & fpc_emin_fx3        ) |
                            (                        q2e_fx3p   & q_emin_lth          ) |
                            (   ~engine_valid_fx3 & ~q2e_fx3p   & fdc_emin_lth        );


assign qround_mode_in[1:0]= ({2{ queue_valid_lth_fx3}} & fpc_rd_mode_fx3[1:0]) |
                            ({2{~queue_valid_lth_fx3}} & qround_mode_lth[1:0]);

assign q_emin_in          = (    queue_valid_lth_fx3   & fpc_emin_fx3        ) |
                            (   ~queue_valid_lth_fx3   & q_emin_lth          );


assign float_sign_in      = (    fac_div_valid_fx1 & ~fac_divq_valid_fx1   & incoming_sign_fx1       ) |
                            (    fac_div_valid_fx1 &  fac_divq_valid_fx1   & qcontrol_fx1[6]         ) |
                            (   ~fac_div_valid_fx1                         & float_sign_lth          );

assign fdc_dec_exp_early  =  fdc_pte_cycle[0] & ~control_lth[2] & ~fdd_result[63] & ~flt_sqrte_kill_dec;

assign inexact_in         =  fdc_pte_cycle[0] & ~control_lth[2] & (final_sticky | final_guard);


fgu_fdc_ctl_msff_ctl_macro__width_10	xrnd_lth	 (
 .scan_in(xrnd_lth_scanin),
 .scan_out(xrnd_lth_scanout),
 .l1clk( l1clk_pm1                                                                                                                                  ),
 .din  ({float_sign_in  , eround_mode_in[1:0]  , qround_mode_in[1:0]  , fdd_cla_zero64_ , sticky_pte1 , inexact_in      , e_emin_in    , q_emin_in }),
 .dout ({float_sign_lth , eround_mode_lth[1:0] , qround_mode_lth[1:0] , sticky_pte1     , sticky_pte0 , fdc_flt_inexact , fdc_emin_lth , q_emin_lth}),
  .siclk(siclk),
  .soclk(soclk));


assign fdc_flt_round[1]   = ~control_lth[2] & ~control_lth[1];	// SP
assign fdc_flt_round[0]   = ~control_lth[2] &  control_lth[1];	// DP


assign flt_shift_sel_     =   fdd_result[63] |  fdc_emin_lth;


assign final_sticky       = ( control_lth[1] &  flt_shift_sel_ & (fdd_result[9] | sticky_pte0)) |	// DP "1."
                            ( control_lth[1] & ~flt_shift_sel_ & (                 sticky_pte0)) |	// DP "0."
                            (~control_lth[1] &  flt_shift_sel_ & (fdd_result[38] | sticky_pte0)) |	// SP "1."
                            (~control_lth[1] & ~flt_shift_sel_ & (                 sticky_pte0));	// SP "0."

assign final_guard        = ( control_lth[1] &  flt_shift_sel_ &  fdd_result[10]               ) |	// DP "1."
                            ( control_lth[1] & ~flt_shift_sel_ &  fdd_result[9]               ) |	// DP "0."
                            (~control_lth[1] &  flt_shift_sel_ &  fdd_result[39]               ) |	// SP "1."
                            (~control_lth[1] & ~flt_shift_sel_ &  fdd_result[38]               );	// SP "0."

assign final_lsb          = ( control_lth[1] &  flt_shift_sel_ &  fdd_result[11]               ) |	// DP "1."
                            ( control_lth[1] & ~flt_shift_sel_ &  fdd_result[10]               ) |	// DP "0."
                            (~control_lth[1] &  flt_shift_sel_ &  fdd_result[40]               ) |	// SP "1."
                            (~control_lth[1] & ~flt_shift_sel_ &  fdd_result[39]               );	// SP "0."


assign flt_rnd00_en       =  ~control_lth[2] & (eround_mode_lth[1:0] == 2'b00);
assign flt_rnd1x_en       = (~control_lth[2] & (eround_mode_lth[1:0] == 2'b10) & ~float_sign_lth) |
                            (~control_lth[2] & (eround_mode_lth[1:0] == 2'b11) &  float_sign_lth);

assign fdc_flt_increment  = ( flt_rnd00_en  & final_guard & final_sticky            ) |
                            ( flt_rnd00_en  & final_guard &                final_lsb) |
                            ( flt_rnd1x_en  & final_guard                           ) |
                            ( flt_rnd1x_en  &               final_sticky            );



 
// *** Floating Point Square Root Special Case ***

// For an odd exponent Square Root, the mantissa is shifted one bit position right.
// In most cases, the final result will end up in the form of "0.1".  We then normalize
// this result and decrement the result exponent.  However, if the mantissa is all ONES,
// this does not hold.  If you take the square root of 0.1111111...1 (after the 1-bit shift),
// the result will move closer to 1.00000000.  In the Round to +INF only,
// the rounded result will be 1.000000 and no decrementing of the exponent will occur.

//                                  1=DP , 0=SP              SQRTE
assign fsqrt_fract_all_ones	= (~fac_div_control_fx1[1] & fac_div_control_fx1[3] & fpf_hi_bof_fx1                 ) |
				  ( fac_div_control_fx1[1] & fac_div_control_fx1[3] & fpf_hi_bof_fx1 & fpf_lo_bof_fx1);

assign fsqrt_special_in		= ( fac_div_valid_fx1 & ~fac_divq_valid_fx1 & fsqrt_fract_all_ones) |
				  ( fac_div_valid_fx1 &  fac_divq_valid_fx1 & qcontrol_fx1[7]     ) |
				  (~fac_div_valid_fx1 &                       fsqrt_special_lth   );

fgu_fdc_ctl_msff_ctl_macro__width_1	spec_sqrt_lth	 (
 .scan_in(spec_sqrt_lth_scanin),
 .scan_out(spec_sqrt_lth_scanout),
 .l1clk( l1clk_pm1		),
 .din  ( fsqrt_special_in	),
 .dout ( fsqrt_special_lth	),
  .siclk(siclk),
  .soclk(soclk));

assign flt_sqrte_kill_dec	=   fsqrt_special_lth & (eround_mode_lth[1:0] == 2'b10);  // +inf



 
// *** FDX Custom ***


assign cla_64		= fdd_fdx_din0 ^ fdd_fdx_din1 ^ fdd_fdx_cin64;

assign cin_in_raw	= (~fdc_asign_lth & ~fdc_bsign_lth & ~cla_64                   ) |
			  (~fdc_asign_lth &  fdc_bsign_lth &  cla_64                   ) |
			  ( fdc_asign_lth & ~fdc_bsign_lth & ~cla_64 &  fdd_cla_zero64_) |
			  ( fdc_asign_lth &  fdc_bsign_lth &           ~fdd_cla_zero64_) |
			  ( fdc_asign_lth &  fdc_bsign_lth &  cla_64                   );

assign fdc_fdx_cin_in	= fdc_pte_cycle2 & cin_in_raw;



// *** FDQ00 Custom ***

assign fdq00_sum[3:0]   = fdd_fdq00_10_sum[4:1];    // s0[65:62]
assign fdq00_carry[3:0] = fdd_fdq00_10_carry[4:1];  // c0[65:62]

assign pr00[0]		= fdq00_sum[0]   | fdq00_carry[0];
assign pr00[3:1]	= fdq00_sum[3:1] + fdq00_carry[3:1];

assign fdc_qsel00[0]	= ( pr00[3] & ~pr00[2]) |			// 10.0x ; 10.1x
			  ( pr00[3] & ~pr00[1]) |			// 10.0x ; 11.0x
			  ( pr00[3] & ~pr00[0]);			// 11.10

assign fdc_qsel00[1]	= ( pr00[3] &  pr00[2] &  pr00[1] &  pr00[0]) |	// 11.11
			  (~pr00[3] & ~pr00[2] & ~pr00[1] & ~pr00[0]);	// 00.00


assign fdc_qsel00[2]	= (~pr00[3] &  pr00[2]) |			// 01.1x ; 01.0x
			  (~pr00[3] &  pr00[1]) |			// 01.1x ; 00.1x
			  (~pr00[3] &  pr00[0]);			// 00.01


// *** FDQ1p Custom ***

assign pr1p[0]		= fdd_fdq1p_sum[0]   | fdd_fdq1p_carry[0];
assign pr1p[3:1]	= fdd_fdq1p_sum[3:1] + fdd_fdq1p_carry[3:1];

assign qsel1p[0]	= ( pr1p[3] & ~pr1p[2]) |			// 10.0x ; 10.1x
			  ( pr1p[3] & ~pr1p[1]) |			// 10.0x ; 11.0x
			  ( pr1p[3] & ~pr1p[0]);			// 11.10

assign qsel1p[1]	= ( pr1p[3] &  pr1p[2] &  pr1p[1] &  pr1p[0]) |	// 11.11
			  (~pr1p[3] & ~pr1p[2] & ~pr1p[1] & ~pr1p[0]);	// 00.00


assign qsel1p[2]	= (~pr1p[3] &  pr1p[2]) |			// 01.1x ; 01.0x
			  (~pr1p[3] &  pr1p[1]) |			// 01.1x ; 00.1x
			  (~pr1p[3] &  pr1p[0]);			// 00.01


// *** FDQ10 Custom ***

assign fdq10_sum[3:0]   = fdd_fdq00_10_sum[3:0];    // s0[64:61]
assign fdq10_carry[3:0] = fdd_fdq00_10_carry[3:0];  // c0[64:61]

assign pr10[0]		= fdq10_sum[0]   | fdq10_carry[0];
assign pr10[3:1]	= fdq10_sum[3:1] + fdq10_carry[3:1];

assign qsel10[0]	= ( pr10[3] & ~pr10[2]) |			// 10.0x ; 10.1x
			  ( pr10[3] & ~pr10[1]) |			// 10.0x ; 11.0x
			  ( pr10[3] & ~pr10[0]);			// 11.10

assign qsel10[1]	= ( pr10[3] &  pr10[2] &  pr10[1] &  pr10[0]) |	// 11.11
			  (~pr10[3] & ~pr10[2] & ~pr10[1] & ~pr10[0]);	// 00.00


assign qsel10[2]	= (~pr10[3] &  pr10[2]) |			// 01.1x ; 01.0x
			  (~pr10[3] &  pr10[1]) |			// 01.1x ; 00.1x
			  (~pr10[3] &  pr10[0]);			// 00.01


// *** FDQ1n Custom ***

assign pr1n[0]		= fdd_fdq1n_sum[0]   | fdd_fdq1n_carry[0];
assign pr1n[3:1]	= fdd_fdq1n_sum[3:1] + fdd_fdq1n_carry[3:1];

assign qsel1n[0]	= ( pr1n[3] & ~pr1n[2]) |			// 10.0x ; 10.1x
			  ( pr1n[3] & ~pr1n[1]) |			// 10.0x ; 11.0x
			  ( pr1n[3] & ~pr1n[0]);			// 11.10

assign qsel1n[1]	= ( pr1n[3] &  pr1n[2] &  pr1n[1] &  pr1n[0]) |	// 11.11
			  (~pr1n[3] & ~pr1n[2] & ~pr1n[1] & ~pr1n[0]);	// 00.00


assign qsel1n[2]	= (~pr1n[3] &  pr1n[2]) |			// 01.1x ; 01.0x
			  (~pr1n[3] &  pr1n[1]) |			// 01.1x ; 00.1x
			  (~pr1n[3] &  pr1n[0]);			// 00.01



assign engine_start	= fac_div_valid_fx1 | fdc_pe_cycle3;

assign fdc_qsel1[2:0]	= ({3{~engine_start & fdc_qsel00[0]}} & qsel1p[2:0]) |
			  ({3{~engine_start & fdc_qsel00[1]}} & qsel10[2:0]) |
			  ({3{~engine_start & fdc_qsel00[2]}} & qsel1n[2:0]);


// *** Misc Logic from FDD ***

assign fdc_q_in[1]	= (   ~engine_start & fdc_qsel00[0]   & fdc_bsign_lth ) |
			  (   ~engine_start & fdc_qsel00[2]   & fdc_bsign_lth_);

assign fdc_qm1_in[1]	= (   ~engine_start & fdc_qsel00[0]   & fdc_bsign_lth_) |
			  (   ~engine_start & fdc_qsel00[2]   & fdc_bsign_lth );

assign fdc_q_in[0]	= (                   fdc_qsel1[0]    & fdc_bsign_lth ) |
			  (                   fdc_qsel1[2]    & fdc_bsign_lth_);

assign fdc_qm1_in[0]	= (                   fdc_qsel1[0]    & fdc_bsign_lth_) |
			  (                   fdc_qsel1[2]    & fdc_bsign_lth );


supply0 vss;
supply1 vdd;


// fixscan start:
assign spares_scanin             = scan_in                  ;
assign qdata_lth_scanin          = spares_scanout           ;
assign cntl_lth_scanin           = qdata_lth_scanout        ;
assign ovlf_lth_scanin           = cntl_lth_scanout         ;
assign stall_lth_scanin          = ovlf_lth_scanout         ;
assign data_lth_scanin           = stall_lth_scanout        ;
assign xsht_lth_scanin           = data_lth_scanout         ;
assign hamt_lth_scanin           = xsht_lth_scanout         ;
assign xcntl_lth_scanin          = hamt_lth_scanout         ;
assign xrnd_vld_lth_scanin       = xcntl_lth_scanout        ;
assign xrnd_lth_scanin           = xrnd_vld_lth_scanout     ;
assign spec_sqrt_lth_scanin      = xrnd_lth_scanout         ;
assign scan_out                  = spec_sqrt_lth_scanout    ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module fgu_fdc_ctl_l1clkhdr_ctl_macro (
  l2clk, 
  l1en, 
  pce_ov, 
  stop, 
  se, 
  l1clk);


  input l2clk;
  input l1en;
  input pce_ov;
  input stop;
  input se;
  output l1clk;



 

cl_sc1_l1hdr_8x c_0 (


   .l2clk(l2clk),
   .pce(l1en),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);



endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module fgu_fdc_ctl_spare_ctl_macro__num_3 (
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  scan_out);
wire si_0;
wire so_0;
wire spare0_flop_unused;
wire spare0_buf_32x_unused;
wire spare0_nand3_8x_unused;
wire spare0_inv_8x_unused;
wire spare0_aoi22_4x_unused;
wire spare0_buf_8x_unused;
wire spare0_oai22_4x_unused;
wire spare0_inv_16x_unused;
wire spare0_nand2_16x_unused;
wire spare0_nor3_4x_unused;
wire spare0_nand2_8x_unused;
wire spare0_buf_16x_unused;
wire spare0_nor2_16x_unused;
wire spare0_inv_32x_unused;
wire si_1;
wire so_1;
wire spare1_flop_unused;
wire spare1_buf_32x_unused;
wire spare1_nand3_8x_unused;
wire spare1_inv_8x_unused;
wire spare1_aoi22_4x_unused;
wire spare1_buf_8x_unused;
wire spare1_oai22_4x_unused;
wire spare1_inv_16x_unused;
wire spare1_nand2_16x_unused;
wire spare1_nor3_4x_unused;
wire spare1_nand2_8x_unused;
wire spare1_buf_16x_unused;
wire spare1_nor2_16x_unused;
wire spare1_inv_32x_unused;
wire si_2;
wire so_2;
wire spare2_flop_unused;
wire spare2_buf_32x_unused;
wire spare2_nand3_8x_unused;
wire spare2_inv_8x_unused;
wire spare2_aoi22_4x_unused;
wire spare2_buf_8x_unused;
wire spare2_oai22_4x_unused;
wire spare2_inv_16x_unused;
wire spare2_nand2_16x_unused;
wire spare2_nor3_4x_unused;
wire spare2_nand2_8x_unused;
wire spare2_buf_16x_unused;
wire spare2_nor2_16x_unused;
wire spare2_inv_32x_unused;


input		l1clk;
input		scan_in;
input		siclk;
input		soclk;
output		scan_out;

cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
                               .q(spare0_flop_unused));
assign si_0 = scan_in;

cl_u1_buf_32x   spare0_buf_32x (.in(1'b1),
                                   .out(spare0_buf_32x_unused));
cl_u1_nand3_8x spare0_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare0_nand3_8x_unused));
cl_u1_inv_8x    spare0_inv_8x (.in(1'b1),
                                  .out(spare0_inv_8x_unused));
cl_u1_aoi22_4x spare0_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_aoi22_4x_unused));
cl_u1_buf_8x    spare0_buf_8x (.in(1'b1),
                                  .out(spare0_buf_8x_unused));
cl_u1_oai22_4x spare0_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_oai22_4x_unused));
cl_u1_inv_16x   spare0_inv_16x (.in(1'b1),
                                   .out(spare0_inv_16x_unused));
cl_u1_nand2_16x spare0_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare0_nand2_16x_unused));
cl_u1_nor3_4x spare0_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare0_nor3_4x_unused));
cl_u1_nand2_8x spare0_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare0_nand2_8x_unused));
cl_u1_buf_16x   spare0_buf_16x (.in(1'b1),
                                   .out(spare0_buf_16x_unused));
cl_u1_nor2_16x spare0_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare0_nor2_16x_unused));
cl_u1_inv_32x   spare0_inv_32x (.in(1'b1),
                                   .out(spare0_inv_32x_unused));

cl_sc1_msff_8x spare1_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_1),
                               .so(so_1),
                               .d(1'b0),
                               .q(spare1_flop_unused));
assign si_1 = so_0;

cl_u1_buf_32x   spare1_buf_32x (.in(1'b1),
                                   .out(spare1_buf_32x_unused));
cl_u1_nand3_8x spare1_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare1_nand3_8x_unused));
cl_u1_inv_8x    spare1_inv_8x (.in(1'b1),
                                  .out(spare1_inv_8x_unused));
cl_u1_aoi22_4x spare1_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_aoi22_4x_unused));
cl_u1_buf_8x    spare1_buf_8x (.in(1'b1),
                                  .out(spare1_buf_8x_unused));
cl_u1_oai22_4x spare1_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_oai22_4x_unused));
cl_u1_inv_16x   spare1_inv_16x (.in(1'b1),
                                   .out(spare1_inv_16x_unused));
cl_u1_nand2_16x spare1_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare1_nand2_16x_unused));
cl_u1_nor3_4x spare1_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare1_nor3_4x_unused));
cl_u1_nand2_8x spare1_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare1_nand2_8x_unused));
cl_u1_buf_16x   spare1_buf_16x (.in(1'b1),
                                   .out(spare1_buf_16x_unused));
cl_u1_nor2_16x spare1_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare1_nor2_16x_unused));
cl_u1_inv_32x   spare1_inv_32x (.in(1'b1),
                                   .out(spare1_inv_32x_unused));

cl_sc1_msff_8x spare2_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_2),
                               .so(so_2),
                               .d(1'b0),
                               .q(spare2_flop_unused));
assign si_2 = so_1;

cl_u1_buf_32x   spare2_buf_32x (.in(1'b1),
                                   .out(spare2_buf_32x_unused));
cl_u1_nand3_8x spare2_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare2_nand3_8x_unused));
cl_u1_inv_8x    spare2_inv_8x (.in(1'b1),
                                  .out(spare2_inv_8x_unused));
cl_u1_aoi22_4x spare2_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_aoi22_4x_unused));
cl_u1_buf_8x    spare2_buf_8x (.in(1'b1),
                                  .out(spare2_buf_8x_unused));
cl_u1_oai22_4x spare2_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_oai22_4x_unused));
cl_u1_inv_16x   spare2_inv_16x (.in(1'b1),
                                   .out(spare2_inv_16x_unused));
cl_u1_nand2_16x spare2_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare2_nand2_16x_unused));
cl_u1_nor3_4x spare2_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare2_nor3_4x_unused));
cl_u1_nand2_8x spare2_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare2_nand2_8x_unused));
cl_u1_buf_16x   spare2_buf_16x (.in(1'b1),
                                   .out(spare2_buf_16x_unused));
cl_u1_nor2_16x spare2_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare2_nor2_16x_unused));
cl_u1_inv_32x   spare2_inv_32x (.in(1'b1),
                                   .out(spare2_inv_32x_unused));
assign scan_out = so_2;



endmodule






// any PARAMS parms go into naming of macro

module fgu_fdc_ctl_msff_ctl_macro__width_8 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0];






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fdc_ctl_msff_ctl_macro__width_10 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [9:0] fdin;
wire [8:0] so;

  input [9:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [9:0] dout;
  output scan_out;
assign fdin[9:0] = din[9:0];






dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fdc_ctl_msff_ctl_macro__width_4 (
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













// any PARAMS parms go into naming of macro

module fgu_fdc_ctl_msff_ctl_macro__width_9 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;
wire [7:0] so;

  input [8:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [8:0] dout;
  output scan_out;
assign fdin[8:0] = din[8:0];






dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fdc_ctl_msff_ctl_macro__width_6 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0];






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fdc_ctl_msff_ctl_macro__width_1 (
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








