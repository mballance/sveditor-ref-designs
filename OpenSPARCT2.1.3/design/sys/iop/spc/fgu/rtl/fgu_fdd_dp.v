// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fgu_fdd_dp.v
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
module fgu_fdd_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  scan_out, 
  div_clken_rep0, 
  fad_rs1_fmt_fx1_rep01, 
  fad_rs2_fmt_fx1_rep01, 
  fac_div_valid_fx1_rep0, 
  fac_divq_valid_fx1_rep0, 
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
  fdc_qm1_in, 
  fdd_result, 
  fdd_pte_cla_early_b63, 
  fdd_pe_clth, 
  fdd_cla_zero32_, 
  fdd_cla_zero64_, 
  fdd_fdx_din0, 
  fdd_fdx_din1, 
  fdd_fdx_cin64, 
  fdd_fdq00_10_sum, 
  fdd_fdq00_10_carry, 
  fdd_fdq1p_sum, 
  fdd_fdq1p_carry, 
  fdd_fdq1n_sum, 
  fdd_fdq1n_carry);
wire stop;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire q_rs1_ff_scanin;
wire q_rs1_ff_scanout;
wire [63:0] q_rs1_fx1;
wire q_rs2_ff_scanin;
wire q_rs2_ff_scanout;
wire [63:0] q_rs2_fx1;
wire ipe_clth_scanin;
wire ipe_clth_scanout;
wire [63:0] pe_xsht1;
wire ipe_slth_scanin;
wire ipe_slth_scanout;
wire [63:0] pe_slth;
wire [63:0] pe_xsht0;
wire bsign_buff0;
wire bsign_buff1;
wire [65:0] pe_divisor;
wire [65:0] pe_aop_sh;
wire [65:0] sum_new;
wire [65:0] divisor_new;
wire engine_start;
wire engine_start_;
wire ie_s00lth_scanin;
wire ie_s00lth_scanout;
wire [64:0] s21;
wire [65:1] s1;
wire [64:0] s20;
wire [65:0] s0;
wire ie_c00lth_scanin;
wire ie_c00lth_scanout;
wire [64:1] c21;
wire [65:2] c1;
wire [64:1] c20;
wire [65:2] c0;
wire [65:0] d2_00_in;
wire [65:0] d1;
wire [65:0] sqe_cnt1;
wire [65:0] d2_p1_in;
wire [65:0] flip1;
wire [65:0] d2_m1xor;
wire [65:0] d2_m1_in;
wire ie_d00lth_scanin;
wire ie_d00lth_scanout;
wire [65:0] d0;
wire [64:0] sqe_cnt13;
wire [64:0] effd2_p1_p1in;
wire [64:0] sqe_cnt3;
wire [64:0] effd2_00_p1in;
wire [64:0] effd2_m1_p1in;
wire [64:0] effd2_xx_p1in;
wire ie_d00lthp1_scanin;
wire ie_d00lthp1_scanout;
wire [64:0] effd0_p1_;
wire [64:0] sqe_cnt23;
wire [64:0] effd2_p1_m1in;
wire [64:0] sqe_cnt123;
wire [64:0] effd2_00_m1in;
wire [64:0] effd2_m1_m1in;
wire ie_d00lthm1_scanin;
wire ie_d00lthm1_scanout;
wire [64:0] effd0_m1;
wire ie_csa11_unused;
wire [64:1] c11;
wire [64:0] s11;
wire ie_csa10_unused;
wire [64:1] c10;
wire [64:0] s10;
wire [65:0] d1_00_in;
wire [65:0] sqe_cnt0;
wire [65:0] d1_p1_in;
wire [65:0] flip0;
wire [65:0] d1_m1xor;
wire [65:0] d1_m1_in;
wire [65:0] sqe_cnt02;
wire [64:0] effd1_p1_p1in;
wire [64:0] sqe_cnt2;
wire [64:0] effd1_00_p1in;
wire [64:0] effd1_m1_p1in;
wire [64:0] effd1_p1_;
wire [64:0] sqe_cnt12;
wire [64:0] effd1_p1_m1in;
wire [65:0] sqe_cnt012;
wire [64:0] effd1_00_m1in;
wire [64:0] effd1_m1_m1in;
wire [64:0] effd1_m1;
wire ie_csa21_unused;
wire ie_csa20_unused;
wire [65:0] q_lth;
wire [65:2] q_in;
wire ie_qlth_scanin;
wire ie_qlth_scanout;
wire [65:0] qm1_lth;
wire [65:2] qm1_in;
wire ie_qm1lth_scanin;
wire ie_qm1lth_scanout;
wire [65:1] qm1_lth_;
wire [65:2] pte_q;
wire [65:2] pte_qm1_;
wire ipte_csa_unused;
wire [63:1] pte_carry;
wire [63:0] pte_sum;
wire ipte_clalth0_scanin;
wire ipte_clalth0_scanout;
wire [63:0] pte_cla;
wire [64:0] pte_clalth0;
wire ipte_clalth1_scanin;
wire ipte_clalth1_scanout;
wire [64:0] pte_clalth1;
wire pte_cla_cout;
wire ipte_result_scanin;
wire ipte_result_scanout;
wire isqe_cnt_scanin;
wire isqe_cnt_scanout;
wire [65:0] sqe_cnt2_;
wire [65:0] sqe_cnt0_;
wire isqe_flip_scanin;
wire isqe_flip_scanout;
wire [65:0] sqe_cnt1_;
wire [65:1] sqe_cnt01;


// *** globals ***
input		l2clk;
input  		scan_in;
input  		tcu_pce_ov;		// scan signals
input  		spc_aclk;
input  		spc_bclk;
input 		tcu_scan_en;
output 		scan_out;

input           div_clken_rep0;         // div clken

input  [63:0]	fad_rs1_fmt_fx1_rep01;
input  [63:0]	fad_rs2_fmt_fx1_rep01;

input		fac_div_valid_fx1_rep0;	//  div_valid  divq_valid  |  action
input		fac_divq_valid_fx1_rep0;//  ---------  ----------  |  ---------------------------------------
					//     1           0       |  start divide from FX1   RS1/RS2/control
					//     0           1       |  load  queue  from FX1   RS1/RS2/control
					//     1           1       |  start divide from queue RS1/RS2/control

// *** locals  ***
input		fdc_asign_lth;
input		fdc_bsign_lth;
input		fdc_bsign_lth_;
input		fdc_pe_cycle3;
input		fdc_pe_cmux_sel;
input  [2:0]	fdc_pe_smux_sel;
input  [5:0]	fdc_pe_xsht_ctl;
input		fdc_ie_fsqrt_valid_even;
input		fdc_ie_fsqrt_valid_even_;
input		fdc_ie_fsqrt_valid_odd;
input		fdc_ie_fsqrt_valid_odd_;
input  [4:0]	fdc_ie_rmux_sel;
input  [2:0]	fdc_ie_dmux_sel;
input		fdc_flt_increment;
input  [1:0]	fdc_pte_clasel;
input		fdc_pte_csa_cin;
input		fdc_pte_cycle2;
input		fdc_emin_lth;
input  [2:0]	fdc_pte_qsel;
input		fdc_pte_stall_;

input  [1:0]	fdc_flt_round;
input  [4:0]	fdc_idiv_ctl;           //  3210   [4] = integer
                                        //  ----
                                        //  0001 : 8000 0000 0000 0000
                                        //  0010 : FFFF FFFF 8000 0000
                                        //  0100 : 0000 0000 7FFF FFFF
                                        //  1000 : 0000 0000 FFFF FFFF


input		fdc_fdx_cin_in;
input  [2:0]	fdc_qsel00;
input  [2:0]	fdc_qsel1;

input  [1:0]	fdc_q_in;
input  [1:0]	fdc_qm1_in;


// *** globals ***
output [63:0]	fdd_result;
output		fdd_pte_cla_early_b63;


// *** locals  ***
output [63:0]	fdd_pe_clth;
output		fdd_cla_zero32_;
output		fdd_cla_zero64_;

output		fdd_fdx_din0;
output		fdd_fdx_din1;
output		fdd_fdx_cin64;

output [4:0]	fdd_fdq00_10_sum;
output [4:0]	fdd_fdq00_10_carry;
output [3:0]	fdd_fdq1p_sum;
output [3:0]	fdd_fdq1p_carry;
output [3:0]	fdd_fdq1n_sum;
output [3:0]	fdd_fdq1n_carry;



// scan renames
assign stop   = 1'b0;
// end scan

fgu_fdd_dp_buff_macro__dbuff_32x__rep_1__stack_66c__width_4 test_rep0  (
 .din ({tcu_scan_en, tcu_pce_ov, spc_aclk, spc_bclk}),
 .dout({se,          pce_ov,     siclk,    soclk   }));


 
// * * * * * * * * * * * 2nd Thread Group Queue * * * * * * * * * * 


fgu_fdd_dp_msff_macro__stack_66c__width_64	q_rs1_ff	 (
 .scan_in(q_rs1_ff_scanin),
 .scan_out(q_rs1_ff_scanout),
 .clk ( l2clk                      ),
 .en  ( fac_divq_valid_fx1_rep0    ),
 .din ( fad_rs1_fmt_fx1_rep01[63:0]),
 .dout( q_rs1_fx1[63:0]            ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fdd_dp_msff_macro__stack_66c__width_64	q_rs2_ff	 (
 .scan_in(q_rs2_ff_scanin),
 .scan_out(q_rs2_ff_scanout),
 .clk ( l2clk                      ),
 .en  ( fac_divq_valid_fx1_rep0    ),
 .din ( fad_rs2_fmt_fx1_rep01[63:0]),
 .dout( q_rs2_fx1[63:0]            ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


 
// * * * * * * * * * * * Integer "pre-engine" * * * * * * * * * * * 


fgu_fdd_dp_msff_macro__mux_aope__ports_3__stack_66c__width_64	ipe_clth	 (
 .scan_in(ipe_clth_scanin),
 .scan_out(ipe_clth_scanout),
 .clk ( l2clk                      ),
 .en  ( div_clken_rep0             ),  // powerdown pin
 .din0( pe_xsht1[63:0]             ),
 .din1( fad_rs2_fmt_fx1_rep01[63:0]),
 .din2( q_rs2_fx1[63:0]            ),
 .sel0( fdc_pe_cmux_sel            ),
 .sel1( fdc_pe_smux_sel[2]         ),
 .dout( fdd_pe_clth[63:0]          ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fdd_dp_msff_macro__mux_aope__ports_4__stack_66c__width_64	ipe_slth	 (
 .scan_in(ipe_slth_scanin),
 .scan_out(ipe_slth_scanout),
 .clk ( l2clk                      ),
 .en  ( div_clken_rep0             ),  // powerdown pin
 .din0({fdd_pe_clth[62:0],1'b0    }),
 .din1( fdd_pe_clth[63:0]          ),
 .din2( fad_rs1_fmt_fx1_rep01[63:0]),
 .din3( q_rs1_fx1[63:0]            ),
 .sel0( fdc_pe_smux_sel[0]         ),
 .sel1( fdc_pe_smux_sel[1]         ),
 .sel2( fdc_pe_smux_sel[2]         ),
 .dout( pe_slth[63:0]              ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fdd_dp_mux_macro__mux_aodec__ports_8__stack_66c__width_64	ipe_xsht0	 (
 .din0( pe_slth[63:0]            ),
 .din1({pe_slth[55:0],{ 8{1'b0}}}),
 .din2({pe_slth[47:0],{16{1'b0}}}),
 .din3({pe_slth[39:0],{24{1'b0}}}),
 .din4({pe_slth[31:0],{32{1'b0}}}),
 .din5({pe_slth[23:0],{40{1'b0}}}),
 .din6({pe_slth[15:0],{48{1'b0}}}),
 .din7({pe_slth[7:0],{56{1'b0}}}),
 .sel ( fdc_pe_xsht_ctl[5:3]      ),
 .dout( pe_xsht0[63:0]            ));


fgu_fdd_dp_mux_macro__mux_aodec__ports_8__stack_66c__width_64	ipe_xsht1	 (
 .din0( pe_xsht0[63:0]           ),
 .din1({pe_xsht0[62:0],{1{1'b0}}}),
 .din2({pe_xsht0[61:0],{2{1'b0}}}),
 .din3({pe_xsht0[60:0],{3{1'b0}}}),
 .din4({pe_xsht0[59:0],{4{1'b0}}}),
 .din5({pe_xsht0[58:0],{5{1'b0}}}),
 .din6({pe_xsht0[57:0],{6{1'b0}}}),
 .din7({pe_xsht0[56:0],{7{1'b0}}}),
 .sel ( fdc_pe_xsht_ctl[2:0]      ),
 .dout( pe_xsht1[63:0]            ));


// Floorplan Info - install "ipe_bsign_buf" in clock bay of "ipe_divxor"

fgu_fdd_dp_buff_macro__stack_66c__width_2	ipe_bsign_buf	 (
 .din ({2{fdc_bsign_lth}          }),
 .dout({bsign_buff0,bsign_buff1   }));

fgu_fdd_dp_xor_macro__ports_2__stack_66c__width_64	ipe_divxor	 (
 .din0( fdd_pe_clth[63:0]                   ),
 .din1({{32{bsign_buff0}},{32{bsign_buff1}}}),
 .dout( pe_divisor[63:0]                    ));

assign pe_aop_sh[65:0]   = {{2{fdc_asign_lth}},pe_xsht1[63:0]};
assign pe_divisor[65:64] = 2'b00;


 
// * * * * * * * * * * * Interface to engine * * * * * * * * * * * 


fgu_fdd_dp_mux_macro__mux_aonpe__ports_5__stack_66c__width_66	ie_rmux		 (
 .din0( pe_aop_sh[65:0]                                   ),  // integer
 .din1({{4'b0001},fad_rs2_fmt_fx1_rep01[62:11],{10{1'b0}}}),  // float sqrt
 .din2({{3'b001 },fad_rs1_fmt_fx1_rep01[62:11],{11{1'b0}}}),  // float div
 .din3({{4'b0001},q_rs2_fx1[62:11]            ,{10{1'b0}}}),  // float sqrt
 .din4({{3'b001 },q_rs1_fx1[62:11]            ,{11{1'b0}}}),  // float div
 .sel0( fdc_ie_rmux_sel[0]                                ),
 .sel1( fdc_ie_rmux_sel[1]                                ),
 .sel2( fdc_ie_rmux_sel[2]                                ),
 .sel3( fdc_ie_rmux_sel[3]                                ),
 .sel4( fdc_ie_rmux_sel[4]                                ),
 .dout( sum_new[65:0]                                     ));

fgu_fdd_dp_mux_macro__mux_aonpe__ports_3__stack_66c__width_66	ie_dmux		 (
 .din0( pe_divisor[65:0]                                  ),  // integer
 .din1({{3'b001 },fad_rs2_fmt_fx1_rep01[62:11],{11{1'b0}}}),  // float div
 .din2({{3'b001 },q_rs2_fx1[62:11]            ,{11{1'b0}}}),  // float div
 .sel0( fdc_ie_dmux_sel[0]                                ),
 .sel1( fdc_ie_dmux_sel[1]                                ),
 .sel2( fdc_ie_dmux_sel[2]                                ),
 .dout( divisor_new[65:0]                                 ));


 
// * * * * * * * * * * * * * * "engine" * * * * * * * * * * * * * * 

fgu_fdd_dp_or_macro__ports_2__width_1	ie_engstart_or	 (
 .din0( fac_div_valid_fx1_rep0   ),
 .din1( fdc_pe_cycle3            ),
 .dout( engine_start             ));

fgu_fdd_dp_nor_macro__ports_2__width_1	ie_engstart_nor	 (
 .din0( fac_div_valid_fx1_rep0   ),
 .din1( fdc_pe_cycle3            ),
 .dout( engine_start_            ));


fgu_fdd_dp_msff_macro__mux_aonpe__ports_4__stack_66c__width_66	ie_s00lth	 (
 .scan_in(ie_s00lth_scanin),
 .scan_out(ie_s00lth_scanout),
 .clk ( l2clk                    ),
 .en  ( div_clken_rep0           ),  // powerdown pin
 .din0({s21[64:0],1'b0          }),
 .din1({s1[64:1] ,2'b00         }),
 .din2({s20[64:0],1'b0          }),
 .din3( sum_new[65:0]            ),  // PR(i+1) = PR(i) - qD;
 .sel0( fdc_qsel1[0]             ),  // PR + D -> therefore q = -1
 .sel1( fdc_qsel1[1]             ),
 .sel2( fdc_qsel1[2]             ),  // PR - D -> therefore q = +1
 .sel3( engine_start             ),
 .dout( s0[65:0]                 ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));



fgu_fdd_dp_msff_macro__mux_aonpe__ports_4__stack_66c__width_64	ie_c00lth	 (
 .scan_in(ie_c00lth_scanin),
 .scan_out(ie_c00lth_scanout),
 .clk ( l2clk                    ),
 .en  ( div_clken_rep0           ),  // powerdown pin
 .din0( c21[64:1]                ),
 .din1({c1[64:2] ,1'b0          }),
 .din2( c20[64:1]                ),
 .din3({64{1'b0}                }),  // PR(i+1) = PR(i) - qD;
 .sel0( fdc_qsel1[0]             ),  // PR + D -> therefore q = -1
 .sel1( fdc_qsel1[1]             ),
 .sel2( fdc_qsel1[2]             ),  // PR - D -> therefore q = +1
 .sel3( engine_start             ),
 .dout( c0[65:2]                 ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));



//assign d2_p1_in[65:0]       =  d1[65:0]                | sqe_cnt1[65:0];
  assign d2_00_in[65:0]       =  d1[65:0]                                ;
//assign d2_m1_in[65:0]       = (d1[65:0] ^ flip1[65:0]) | sqe_cnt1[65:0];

fgu_fdd_dp_or_macro__ports_2__stack_66c__width_66	ie_d00lth_p1or	 (
 .din0( d1[65:0]                 ),
 .din1( sqe_cnt1[65:0]           ),
 .dout( d2_p1_in[65:0]           ));

fgu_fdd_dp_xor_macro__ports_2__stack_66c__width_66	ie_d00lth_m1xor	 (
 .din0( d1[65:0]                 ),
 .din1( flip1[65:0]              ),
 .dout( d2_m1xor[65:0]           ));

fgu_fdd_dp_or_macro__ports_2__stack_66c__width_66	ie_d00lth_m1or	 (
 .din0( d2_m1xor[65:0]           ),
 .din1( sqe_cnt1[65:0]           ),
 .dout( d2_m1_in[65:0]           ));

fgu_fdd_dp_msff_macro__mux_aonpe__ports_4__stack_66c__width_66	ie_d00lth	 (
 .scan_in(ie_d00lth_scanin),
 .scan_out(ie_d00lth_scanout),
 .clk ( l2clk                    ),
 .en  ( div_clken_rep0           ),  // powerdown pin
 .din0( d2_m1_in[65:0]           ),
 .din1( d2_00_in[65:0]           ),
 .din2( d2_p1_in[65:0]           ),
 .din3( divisor_new[65:0]        ),
 .sel0( fdc_qsel1[0]             ),
 .sel1( fdc_qsel1[1]             ),
 .sel2( fdc_qsel1[2]             ),
 .sel3( engine_start             ),
 .dout( d0[65:0]                 ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// assign effd0_00[65:0]      =   d0[65:0];  Not used


// Post-LTH version of the logic
// assign effd0_p1_[65:0]     = ~( d0[65:0]              | sqe_cnt1[65:0]);

// Pre-LTH version of the logic
// assign effd2_p1_p1in       = ~( ( d1 | cnt1         ) | cnt3);
// assign effd2_00_p1in       = ~( ( d1                ) | cnt3);
// assign effd1_m1_p1in       = ~( ((d1 ^ flip1) | cnt1) | cnt3);

// assign effd2_p1_p1in[65:0] = ~( d1[65:0]                | sqe_cnt13[65:0]);
// assign effd2_00_p1in[65:0] = ~( d1[65:0]                | sqe_cnt3[65:0] );
// assign effd2_m1_p1in[65:0] = ~((d1[65:0] ^ flip1[65:0]) | sqe_cnt13[65:0]);
// assign effd2_xx_p1in[65:0] = ~(divisor_new[65:0]        | {2'b00,fdc_ie_fsqrt_valid_odd,fdc_ie_fsqrt_valid_even,{62{1'b0}}});

fgu_fdd_dp_nor_macro__ports_2__stack_66c__width_65	ie_d00lthp1_p1nor	 (
 .din0( d1[64:0]                 ),
 .din1( sqe_cnt13[64:0]          ),
 .dout( effd2_p1_p1in[64:0]      ));

fgu_fdd_dp_nor_macro__ports_2__stack_66c__width_65	ie_d00lthp1_00nor	 (
 .din0( d1[64:0]                 ),
 .din1( sqe_cnt3[64:0]           ),
 .dout( effd2_00_p1in[64:0]      ));

fgu_fdd_dp_nor_macro__ports_2__stack_66c__width_65	ie_d00lthp1_m1nor	 (
 .din0( d2_m1xor[64:0]           ),
 .din1( sqe_cnt13[64:0]          ),
 .dout( effd2_m1_p1in[64:0]      ));

fgu_fdd_dp_nor_macro__ports_2__stack_66c__width_65	ie_d00lthp1_xxnor	 (
 .din0( divisor_new[64:0]        ),
 .din1({1'b0,fdc_ie_fsqrt_valid_odd,fdc_ie_fsqrt_valid_even,{62{1'b0}}}),
 .dout( effd2_xx_p1in[64:0]      ));


fgu_fdd_dp_msff_macro__mux_aonpe__ports_4__stack_66c__width_65	ie_d00lthp1	 (
 .scan_in(ie_d00lthp1_scanin),
 .scan_out(ie_d00lthp1_scanout),
 .clk ( l2clk                    ),
 .en  ( div_clken_rep0           ),  // powerdown pin
 .din0( effd2_m1_p1in[64:0]      ),
 .din1( effd2_00_p1in[64:0]      ),
 .din2( effd2_p1_p1in[64:0]      ),
 .din3( effd2_xx_p1in[64:0]      ),
 .sel0( fdc_qsel1[0]             ),
 .sel1( fdc_qsel1[1]             ),
 .sel2( fdc_qsel1[2]             ),
 .sel3( engine_start             ),
 .dout( effd0_p1_[64:0]          ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));



// Post-LTH version of the logic
// assign effd0_m1[65:0]      =  (d0[65:0] ^ (flip0[65:0] | sqe_cnt0[65:0])) | sqe_cnt1[65:0];
// assign effd0_m1[65:0]      =  (d0[65:0] ^  flip0[65:0]                  ) | sqe_cnt01[65:0];   d0 has no overlap w/ cnt0

// Pre-LTH version of the logic
// assign effd2_p1_m1in       = ( (d1 | cnt1) ^ flip2 )         | cnt2 | cnt3;     flip2 = cnt1; for p1 select
// assign effd2_p1_m1in       = ( (d1 | cnt1) ^ cnt1  )         | cnt2 | cnt3;     d1 has no overlap w/ cnt1
// assign effd2_p1_m1in       = (  d1                 )         | cnt2 | cnt3;

// assign effd1_00_m1in       = (  d1         ^ flip2 )         | cnt2 | cnt3;     flip2 = flip1 | cnt1; for 00 select
// assign effd1_00_m1in       = (  d1         ^ (flip1  | cnt1) | cnt2 | cnt3;     d1 has no overlap w/ cnt1
// assign effd1_00_m1in       = (  d1         ^ flip1 ) | cnt1  | cnt2 | cnt3;

// assign effd1_m1_m1in       = ( ((d1 ^ flip1) | cnt1) ^ flip2) | cnt2 | cnt3;    flip2 = cnt1; for m1 select
// assign effd1_m1_m1in       = ( ((d1 ^ flip1) | cnt1) ^ cnt1 ) | cnt2 | cnt3;    d1 has no overlap w/ cnt1
// assign effd1_m1_m1in       = ( ((d1 ^ flip1)                ) | cnt2 | cnt3;

// assign effd2_p1_m1in[65:0] =   d1[65:0]                | sqe_cnt23[65:0] ;
// assign effd2_00_m1in[65:0] =  (d1[65:0] ^ flip1[65:0]) | sqe_cnt123[65:0];
// assign effd2_m1_m1in[65:0] =  (d1[65:0] ^ flip1[65:0]) | sqe_cnt23[65:0] ;

fgu_fdd_dp_or_macro__ports_2__stack_66c__width_65	ie_d00lthm1_p1or 	 (
 .din0( d1[64:0]                 ),
 .din1( sqe_cnt23[64:0]          ),
 .dout( effd2_p1_m1in[64:0]      ));

fgu_fdd_dp_or_macro__ports_2__stack_66c__width_65	ie_d00lthm1_00or 	 (
 .din0( d2_m1xor[64:0]           ),
 .din1( sqe_cnt123[64:0]         ),
 .dout( effd2_00_m1in[64:0]      ));

fgu_fdd_dp_or_macro__ports_2__stack_66c__width_65	ie_d00lthm1_m1or 	 (
 .din0( d2_m1xor[64:0]           ),
 .din1( sqe_cnt23[64:0]          ),
 .dout( effd2_m1_m1in[64:0]      ));


fgu_fdd_dp_msff_macro__mux_aonpe__ports_4__stack_66c__width_65	ie_d00lthm1	 (
 .scan_in(ie_d00lthm1_scanin),
 .scan_out(ie_d00lthm1_scanout),
 .clk ( l2clk                    ),
 .en  ( div_clken_rep0           ),  // powerdown pin
 .din0( effd2_m1_m1in[64:0]      ),
 .din1( effd2_00_m1in[64:0]      ),
 .din2( effd2_p1_m1in[64:0]      ),
 .din3( divisor_new[64:0]        ),
 .sel0( fdc_qsel1[0]             ),
 .sel1( fdc_qsel1[1]             ),
 .sel2( fdc_qsel1[2]             ),
 .sel3( engine_start             ),
 .dout( effd0_m1[64:0]           ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));



// fgu_fdq_cust ie_qslc00 (
//  .sum  ( s0[65:62]            ),
//  .carry( c0[65:62]            ),
//  .fdq_qip1 ( qsel00[2:0]          )); // q(i+1) == +1, 0, -1


fgu_fdd_dp_csa32_macro__stack_66c__width_65	ie_csa11	 (
 .i0   ( s0[64:0]                     ),
 .i1   ({c0[64:2],1'b0,fdc_bsign_lth }),
 .i2   ( effd0_m1[64:0]               ),
 .carry({ie_csa11_unused,c11[64:1]   }),
 .sum  (                 s11[64:0]    ));


fgu_fdd_dp_csa32_macro__stack_66c__width_65	ie_csa10	 (
 .i0   ( s0[64:0]                     ),
 .i1   ({c0[64:2],1'b0,fdc_bsign_lth_}),
 .i2   ( effd0_p1_[64:0]              ),
 .carry({ie_csa10_unused,c10[64:1]   }),
 .sum  (                 s10[64:0]    ));


fgu_fdd_dp_mux_macro__dmux_6x__mux_aonpe__ports_3__stack_66c__width_65	ie_s1mux	 (
 .din0( s11[64:0]                ),
 .din1( s0[64:0]                 ),
 .din2( s10[64:0]                ),
 .sel0( fdc_qsel00[0]            ),
 .sel1( fdc_qsel00[1]            ),
 .sel2( fdc_qsel00[2]            ),
 .dout( s1[65:1]                 ));
				 
fgu_fdd_dp_mux_macro__dmux_6x__mux_aonpe__ports_3__stack_66c__width_64	ie_c1mux	 (
 .din0( c11[64:1]                ),
 .din1({c0[64:2],1'b0           }),
 .din2( c10[64:1]                ),
 .sel0( fdc_qsel00[0]            ),
 .sel1( fdc_qsel00[1]            ),
 .sel2( fdc_qsel00[2]            ),
 .dout( c1[65:2]                 ));


// assign d1_p1_in[65:0]     =  d0[65:0]                | sqe_cnt0[65:0];
   assign d1_00_in[65:0]     =  d0[65:0]                                ;
// assign d1_m1_in[65:0]     = (d0[65:0] ^ flip0[65:0]) | sqe_cnt0[65:0];

fgu_fdd_dp_or_macro__ports_2__stack_66c__width_66	ie_d1mux_p1or	 (
 .din0( d0[65:0]                 ),
 .din1( sqe_cnt0[65:0]           ),
 .dout( d1_p1_in[65:0]           ));

fgu_fdd_dp_xor_macro__ports_2__stack_66c__width_66	ie_d1mux_m1xor	 (
 .din0( d0[65:0]                 ),
 .din1( flip0[65:0]              ),
 .dout( d1_m1xor[65:0]           ));

fgu_fdd_dp_or_macro__ports_2__stack_66c__width_66	ie_d1mux_m1or	 (
 .din0( d1_m1xor[65:0]           ),
 .din1( sqe_cnt0[65:0]           ),
 .dout( d1_m1_in[65:0]           ));

fgu_fdd_dp_mux_macro__mux_aonpe__ports_3__stack_66c__width_66	ie_d1mux	 (
 .din0( d1_m1_in[65:0]           ),
 .din1( d1_00_in[65:0]           ),
 .din2( d1_p1_in[65:0]           ),
 .sel0( fdc_qsel00[0]            ),
 .sel1( fdc_qsel00[1]            ),
 .sel2( fdc_qsel00[2]            ),
 .dout( d1[65:0]                 ));

// assign effd1_00[65:0]      =   d1[65:0];  Not used


// Post-MUX version of the logic
// assign effd1_p1_[65:0]     = ~( d1[65:0]                | sqe_cnt2[65:1]);

// assign effd1_p1_p1in[65:0] = ~( d0[65:0]                | sqe_cnt02[65:0]);
// assign effd1_00_p1in[65:0] = ~( d0[65:0]                | sqe_cnt2[65:0] );
// assign effd1_m1_p1in[65:0] = ~((d0[65:0] ^ flip0[65:0]) | sqe_cnt02[65:0]);

fgu_fdd_dp_nor_macro__ports_2__stack_66c__width_65	ie_d1muxp1_p1nor	 (
 .din0( d0[64:0]                 ),
 .din1( sqe_cnt02[64:0]          ),
 .dout( effd1_p1_p1in[64:0]      ));

fgu_fdd_dp_nor_macro__ports_2__stack_66c__width_65	ie_d1muxp1_00nor	 (
 .din0( d0[64:0]                 ),
 .din1( sqe_cnt2[64:0]           ),
 .dout( effd1_00_p1in[64:0]      ));

fgu_fdd_dp_nor_macro__ports_2__stack_66c__width_65	ie_d1muxp1_m1nor	 (
 .din0( d1_m1xor[64:0]           ),
 .din1( sqe_cnt02[64:0]          ),
 .dout( effd1_m1_p1in[64:0]      ));

fgu_fdd_dp_mux_macro__mux_aonpe__ports_3__stack_66c__width_65	ie_d1muxp1	 (
 .din0( effd1_m1_p1in[64:0]      ),
 .din1( effd1_00_p1in[64:0]      ),
 .din2( effd1_p1_p1in[64:0]      ),
 .sel0( fdc_qsel00[0]            ),
 .sel1( fdc_qsel00[1]            ),
 .sel2( fdc_qsel00[2]            ),
 .dout( effd1_p1_[64:0]          ));



// Post-MUX version of the logic
// assign effd1_m1[65:0]      =  (d1[65:0] ^ (flip1[65:0] | sqe_cnt1[65:0])) | sqe_cnt2[65:1] ;

// Pre-MUX intermediate version of logic (see 'effd2_XX_m1in' for simplication details)
// assign effd1_p1_m1in       =  ( (d0          | sqe_cnt0) ^ (flip1 | sqe_cnt1)) | sqe_cnt2;
// assign effd1_00_m1in       =  (  d0                      ^ (flip1 | sqe_cnt1)) | sqe_cnt2;
// assign effd1_m1_m1in       =  (((d0 ^ flip0) | sqe_cnt0) ^ (flip1 | sqe_cnt1)) | sqe_cnt2;

// assign effd1_p1_m1in[65:0] =    d0[65:0]                | sqe_cnt12[65:0] ;
// assign effd1_00_m1in[65:0] =   (d0[65:0] ^ flip0[65:0]) | sqe_cnt012[65:0];
// assign effd1_m1_m1in[65:0] =   (d0[65:0] ^ flip0[65:0]) | sqe_cnt12[65:0] ;

fgu_fdd_dp_or_macro__ports_2__stack_66c__width_65	ie_d1muxm1_p1or	 (
 .din0( d0[64:0]                 ),
 .din1( sqe_cnt12[64:0]          ),
 .dout( effd1_p1_m1in[64:0]      ));

fgu_fdd_dp_or_macro__ports_2__stack_66c__width_65	ie_d1muxm1_00or	 (
 .din0( d1_m1xor[64:0]           ),
 .din1( sqe_cnt012[64:0]         ),
 .dout( effd1_00_m1in[64:0]      ));

fgu_fdd_dp_or_macro__ports_2__stack_66c__width_65	ie_d1muxm1_m1or	 (
 .din0( d1_m1xor[64:0]           ),
 .din1( sqe_cnt12[64:0]          ),
 .dout( effd1_m1_m1in[64:0]      ));

fgu_fdd_dp_mux_macro__mux_aonpe__ports_3__stack_66c__width_65	ie_d1muxm1	 (
 .din0( effd1_m1_m1in[64:0]      ),
 .din1( effd1_00_m1in[64:0]      ),
 .din2( effd1_p1_m1in[64:0]      ),
 .sel0( fdc_qsel00[0]            ),
 .sel1( fdc_qsel00[1]            ),
 .sel2( fdc_qsel00[2]            ),
 .dout( effd1_m1[64:0]           ));




// fgu_fdq_cust ie_qslc1p (
//  .sum      ( s11[64:61]           ),
//  .carry    ( c11[64:61]           ),
//  .fdq_qip1 ( qsel1p[2:0]          )); // q(i+1) == +1, 0, -1

// fgu_fdq_cust ie_qslc10 (
//  .sum      ( s0_buf[64:61]        ),
//  .carry    ( c0_buf[64:61]        ),
//  .fdq_qip1 ( qsel10[2:0]          )); // q(i+1) == +1, 0, -1

// fgu_fdq_cust ie_qslc1n (
//  .sum      ( s10[64:61]           ),
//  .carry    ( c10[64:61]           ),
//  .fdq_qip1 ( qsel1n[2:0]          )); // q(i+1) == +1, 0, -1


assign fdd_fdq00_10_sum[4:0]	= s0[65:61];
assign fdd_fdq00_10_carry[4:0]	= c0[65:61];

assign fdd_fdq1p_sum[3:0]	= s11[64:61];
assign fdd_fdq1p_carry[3:0]	= c11[64:61];

assign fdd_fdq1n_sum[3:0]	= s10[64:61];
assign fdd_fdq1n_carry[3:0]	= c10[64:61];




// Timing change : 7-17-02
//
// and_macro	ie_qslc00a	(width=3,ports=2,stack=66c) (
//  .din0 ( fdc_qsel00[2:0]      ),
//  .din1 ({3{engine_start_    }}),
//  .dout ( gated_qsel00[2:0]    ));
//
// mux_macro	ie_qslcmux	(width=3,ports=3,mux=aonpe,buffsel=none,stack=66c) (
//  .din0( qsel1p[2:0]         ),
//  .din1( qsel10[2:0]         ),
//  .din2( qsel1n[2:0]         ),  // PR(i+1) = PR(i) - qD;
//  .sel0( gated_qsel00[0]     ),  // PR + D -> therefore q = -1
//  .sel1( gated_qsel00[1]     ),
//  .sel2( gated_qsel00[2]     ),  // PR - D -> therefore q = +1
//  .dout( qsel1[2:0]          ));


fgu_fdd_dp_csa32_macro__stack_66c__width_65	ie_csa21	 (
 .i0   ({s1[64:1],1'b0               }),
 .i1   ({c1[64:2],1'b0,fdc_bsign_lth }),
 .i2   ( effd1_m1[64:0]               ),
 .carry({ie_csa21_unused,c21[64:1]   }),
 .sum  (                 s21[64:0]    ));


fgu_fdd_dp_csa32_macro__stack_66c__width_65	ie_csa20	 (
 .i0   ({s1[64:1],1'b0               }),
 .i1   ({c1[64:2],1'b0,fdc_bsign_lth_}),
 .i2   ( effd1_p1_[64:0]              ),
 .carry({ie_csa20_unused,c20[64:1]   }),
 .sum  (                 s20[64:0]    ));




// During pte_cycle[3], an extra shift will occur in both q_lth and qm1_lth.
// Both latches are made 2-bits wider so no data is lost.


// Floorplan note : pack "ie_qmuxh" and "ie_qmuxl" on same row

fgu_fdd_dp_mux_macro__mux_aope__ports_2__stack_66c__width_64	ie_qmuxh	 (
 .din0({64{1'b0}                }),
 .din1( q_lth[63:0]              ),
 .sel0( engine_start             ),
 .dout( q_in[65:2]               ));




fgu_fdd_dp_msff_macro__stack_66c__width_66	ie_qlth		 (
 .scan_in(ie_qlth_scanin),
 .scan_out(ie_qlth_scanout),
 .clk ( l2clk                    ),
 .en  ( div_clken_rep0           ),  // powerdown pin
 .din ({q_in[65:2],fdc_q_in[1:0]}),
 .dout( q_lth[65:0]              ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fdd_dp_mux_macro__mux_aope__ports_2__stack_66c__width_64	ie_qm1muxh	 (
 .din0({64{1'b0}                }),
 .din1( qm1_lth[63:0]            ),
 .sel0( engine_start             ),
 .dout( qm1_in[65:2]             ));


fgu_fdd_dp_msff_macro__stack_66c__width_66	ie_qm1lth	 (
 .scan_in(ie_qm1lth_scanin),
 .scan_out(ie_qm1lth_scanout),
 .clk ( l2clk                        ),
 .en  ( div_clken_rep0               ),  // powerdown pin
 .din ({qm1_in[65:2],fdc_qm1_in[1:0]}),
 .dout( qm1_lth[65:0]                ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

fgu_fdd_dp_inv_macro__stack_66c__width_65	 ie_qm1inv	 (
 .din ( qm1_lth[65:1]            ),
 .dout( qm1_lth_[65:1]           ));


 
// * * * * * * * * * * * * * * "post-engine" * * * * * * * * * * * * * * 

// The CIN to the adder for the R = Q - Qm1 cycle is very confusing.
// For positive operands it is fairly straight forward.  When we
// invert Qm1, we should add the CIN to create the 2's complement.
// However, when the final remainder is negative, the Q is one too
// large.  To correct for this, we need to add one to Qm1 before
// we compute the final result.  By withholding the CIN, we effectively
// make Qm1 appear one larger than what we originally logged.  
//
// For a negative B operand, the situation is more complicated.
// When the final remainder is positive, we need to add the CIN
// so that R = Q - Qm1 is computed correctly.  For a negative
// remainder, not only do we need to add the CIN for the 2's
// complement of Qm1, but we must also add a one to the Q.
// Remember that the logging of the quotient digits is reversed
// for a negative B operand.  So, when the final remainder is 
// negative, that means that Qm1 is one larger than is should have
// been.  To correct, we need to add one to the Q to correct.
//
// Notice the the table has a symmetry around the A operand.
// The correction method (adding one to Q or to Qm1) becomes
// reversed when A is negative.
//
// The table below will summarize.  ('->' is a correction row)
//
//   Sign of   Sign of   Sign of    |   Zero                Method
//      A         B     Remainder   | Remainder  Action |  CSA   Cin
//   -------------------------------|-------------------|-----------
//      0         0         0       |            add 1  |   0     1
//  ->  0         0         1       |            add 0  |   0     0
//      0         1         0       |            add 1  |   1     0
//  ->  0         1         1       |            add 2  |   1     1
//      1         0         0       |  yes       add 1  |   1     0
//  ->  1         0         0       |  no        add 2  |   1     1
//      1         0         1       |            add 1  |   1     0
//      1         1         0       |  yes       add 1  |   0     1
//  ->  1         1         0       |  no        add 0  |   0     0
//      1         1         1       |            add 1  |   0     1


fgu_fdd_dp_mux_macro__mux_aope__ports_4__stack_66c__width_64	ipte_qmux	 (
 .din0( q_lth[65:2]               ),  // INT even ndp
 .din1( q_lth[64:1]               ),  // INT odd  ndq correction
 .din2({q_lth[55:1],{ 9{1'b0}}   }),  // FLT DP
 .din3({q_lth[27:2],{38{1'b0}}   }),  // FLT SP 
 .sel0( fdc_pte_qsel[0]           ),
 .sel1( fdc_pte_qsel[1]           ),
 .sel2( fdc_pte_qsel[2]           ),
 .dout( pte_q[65:2]               ));

fgu_fdd_dp_mux_macro__mux_aope__ports_4__stack_66c__width_64	ipte_qm1mux	 (
 .din0( qm1_lth_[65:2]            ),  // INT even ndq
 .din1( qm1_lth_[64:1]            ),  // INT odd  ndq correction
 .din2({qm1_lth_[55:1],{ 9{1'b1}}}),  // FLT DP
 .din3({qm1_lth_[27:2],{38{1'b1}}}),  // FLT SP 
 .sel0( fdc_pte_qsel[0]           ),
 .sel1( fdc_pte_qsel[1]           ),
 .sel2( fdc_pte_qsel[2]           ),
 .dout( pte_qm1_[65:2]            ));

fgu_fdd_dp_csa32_macro__stack_66c__width_64	ipte_csa	 (
 .i0   ( pte_q[65:2]                     ),
 .i1   ( pte_qm1_[65:2]                  ),
 .i2   ({{63{1'b0}}, fdc_pte_csa_cin    }),
 .carry({ipte_csa_unused,pte_carry[63:1]}),
 .sum  (                 pte_sum[63:0]   ));


fgu_fdd_dp_msff_macro__mux_aope__ports_6__stack_66c__width_65	ipte_clalth0	 (
 .scan_in(ipte_clalth0_scanin),
 .scan_out(ipte_clalth0_scanout),
 .clk ( l2clk                    ),
 .en  ( div_clken_rep0           ),  // powerdown pin
 .din0( s0[65:1]                 ),
 .din1( s1[65:1]                 ),  // odd ndq correction
 .din2({1'b0,pte_sum[63:0]}      ),  // append cin=1 for Q-Qm1 to din1
 .din3({1'b0,pte_cla[63:0]}      ),
 .din4({1'b0,pte_cla[63:0]}      ),
 .din5({1'b0,pte_cla[62:0],1'b0} ),
 .sel0( fdc_pte_clasel[0]        ),
 .sel1( fdc_pte_clasel[1]        ),
 .sel2( fdc_pte_cycle2           ),
 .sel3( pte_cla[63]              ),
 .sel4( fdc_emin_lth             ),
 .dout( pte_clalth0[64:0]        ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fdd_dp_msff_macro__mux_aope__ports_4__stack_66c__width_65	ipte_clalth1	 (
 .scan_in(ipte_clalth1_scanin),
 .scan_out(ipte_clalth1_scanout),
 .clk ( l2clk                    ),
 .en  ( div_clken_rep0           ),  // powerdown pin
 .din0({c0[65:2],1'b0}           ),
 .din1({c1[65:2],1'b0}           ),  // odd ndq correction
 .din2({1'b0,pte_carry[63:1],
        fdc_fdx_cin_in}          ),
 .din3({{24{1'b0}},
        fdc_flt_round[1],
        {28{1'b0}},
        fdc_flt_round[0],
        {11{1'b0}}}              ),
 .sel0( fdc_pte_clasel[0]        ),
 .sel1( fdc_pte_clasel[1]        ),
 .sel2( fdc_pte_cycle2           ),
 .dout( pte_clalth1[64:0]        ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));



// hnb_fg_claz65 fpd_cla (
//  .din0      ( pte_clalth0[64:0]      ),
//  .din1      ({pte_clalth1[64:1],1'b0}),
//  .cin       ( pte_cin                ),
//  .asign     ( fdc_asign_lth          ),
//  .bsign     ( fdc_bsign_lth          ),
//  .cin_enable( fdc_pte_cycle2         ),
//    .pte_cla    ( pte_cla[64:0]         ),
//    .pte_zdetect( pte_zerodetect        ),
//    .pte_cin_in ( pte_cin_in            ));


fgu_fdd_dp_cla_macro__width_64	ipte_cla	 (
  .din0      ( pte_clalth0[63:0]      ),
  .din1      ( pte_clalth1[63:0]      ),
  .cin       ( 1'b0                   ),
    .dout      ( pte_cla[63:0]          ),
    .cout      ( pte_cla_cout           ));

fgu_fdd_dp_and_macro__ports_2__stack_66c__width_1	ipte_cla63_and	 (
  .din0      ( pte_cla[63]            ),
  .din1      ( fdc_flt_increment      ),
    .dout      ( fdd_pte_cla_early_b63  ));

cl_dp1_zdt64_8x	ipte_claz	(
  .din0      ( pte_clalth0[63:0]      ),
  .din1      ( pte_clalth1[63:0]      ),
  .cin       ( 1'b0                   ),
    .zdt_z32_      ( fdd_cla_zero32_        ),
    .zdt_z64_      ( fdd_cla_zero64_        ));

// fgu_fdx_cust	ipte_cla65	(
//   .din0      ( pte_clalth0[64]        ),
//   .din1      ( pte_clalth1[64]        ),
//   .cin64     ( pte_cla_cout           ),
//   .asign     ( fdc_asign_lth          ),
//   .bsign     ( fdc_bsign_lth          ),
//   .cin_enable( fdc_pte_cycle2         ),
//   .z64_l     ( fdd_cla_zero64_        ),
//     .fdx_cin_in( pte_cin_in             ));


assign fdd_fdx_din0	= pte_clalth0[64];
assign fdd_fdx_din1	= pte_clalth1[64];
assign fdd_fdx_cin64	= pte_cla_cout;



fgu_fdd_dp_msff_macro__mux_aope__ports_6__stack_66c__width_64	ipte_result	 (
 .scan_in(ipte_result_scanin),
 .scan_out(ipte_result_scanout),
 .clk ( l2clk                                                  ),
 .en  ( fdc_pte_stall_                                         ),  // powerdown pin
 .din0( 64'h8000000000000000                                   ),
 .din1( 64'hffffffff80000000                                   ),
 .din2( 64'h000000007fffffff                                   ),
 .din3( 64'h00000000ffffffff                                   ),
 .din4({fdd_result[62:0],1'b0}                                 ),
 .din5( pte_cla[63:0]                                          ),
 .sel0( fdc_idiv_ctl[0]                                        ),
 .sel1( fdc_idiv_ctl[1]                                        ),
 .sel2( fdc_idiv_ctl[2]                                        ),
 .sel3( fdc_idiv_ctl[3]                                        ),
 .sel4( fdc_idiv_ctl[4]                                        ),
 .dout( fdd_result[63:0]                                       ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


 
// * * * * * * * * * * * * * * square root * * * * * * * * * * * * * * 

// The CNT bit represents where the newest effective divisor digit will go.
// For divide instruction, this latch will be all 0's and the original divisor
//   will remain unchanged.
// The 'flip' register allows us to quickly compute the effect of a "-1" at position
//   "i" will have on the next effective divisor.

// Define cnt(i)  == single bit ON with position "i";
//        Q(0)    == 0;
//        flip(0) == 0;

// for "+1" -> Q(i+1)    =  Q(i)            | cnt(i);
//             flip(i+1) =  cnt(i)                  ;

// for "-1" -> Q(i+1)    = (Q(i) ^ flip(i)) | cnt(i);
//             flip(i+1) =  cnt(i)                  ;

// for " 0" -> Q(i+1)    =  Q(i)                    ;
//             flip(i+1) =  cnt(i) | flip(i)        ;


// Example :   let i    = 000000001
//             let Q    = 011010000
//            then flip = 000011110
//
// if we get a "-1" at i, then 
//                 Q    = (Q ^ flip) | cnt
//                 Q    = 011001111;      this is the same as a "-1" at "i" added to Q

fgu_fdd_dp_msff_macro__mux_aope__ports_2__stack_66c__width_66	isqe_cnt	 (
 .scan_in(isqe_cnt_scanin),
 .scan_out(isqe_cnt_scanout),
 .clk ( l2clk                    ),
 .en  ( div_clken_rep0           ),  // powerdown pin
 .din0({1'b1,
        fdc_ie_fsqrt_valid_odd_,
        fdc_ie_fsqrt_valid_even_,
        {63{1'b1}}              }),
 .din1( sqe_cnt2_[65:0]          ),
 .sel0( engine_start             ),  //
 .dout( sqe_cnt0_[65:0]          ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

fgu_fdd_dp_inv_macro__stack_66c__width_66	 isqe_cntinv	 (
 .din ( sqe_cnt0_[65:0]          ),
 .dout( sqe_cnt0[65:0]           ));


fgu_fdd_dp_msff_macro__mux_aonpe__ports_2__stack_66c__width_66	isqe_flip	 (
 .scan_in(isqe_flip_scanin),
 .scan_out(isqe_flip_scanout),
 .clk ( l2clk                    ),
 .en  ( div_clken_rep0           ),  // powerdown pin
 .din0( flip1[65:0]              ),
 .din1( sqe_cnt1[65:0]           ),
 .sel0( fdc_qsel1[1]             ),
 .sel1( engine_start_            ),  // mux output == flip2
 .dout( flip0[65:0]              ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


// assign flip1[65:0]       = sqe_cnt0[65:0] |               
//                            ({66{fdc_qsel00[1]}} & flip0[65:0]);

// assign flip2[65:0]       = sqe_cnt1[65:0] |               
//                            ({66{qsel1[1]}}  & flip1[65:0]);

fgu_fdd_dp_mux_macro__mux_aonpe__ports_2__stack_66c__width_66	isqe_flip1	 (
 .din0( flip0[65:0]              ),
 .din1( sqe_cnt0[65:0]           ),
 .sel0( fdc_qsel00[1]            ),
 .sel1( 1'b1                     ),
 .dout( flip1[65:0]              ));


assign sqe_cnt1[65:0]    = {1'b0  ,sqe_cnt0[65:1]};
assign sqe_cnt2[64:0]    = {1'b0  ,sqe_cnt0[65:2]};
assign sqe_cnt3[64:0]    = {2'b00 ,sqe_cnt0[65:3]};

assign sqe_cnt1_[65:0]   = {1'b1  ,sqe_cnt0_[65:1]};
assign sqe_cnt2_[65:0]   = {2'b11 ,sqe_cnt0_[65:2]};
// assign sqe_cnt3_[65:0]   = {3'b111,sqe_cnt0_[65:3]};

// assign sqe_cnt012[65:0]  = sqe_cnt0[65:0] | sqe_cnt1[65:0] | sqe_cnt2[65:0]                 ;
// assign sqe_cnt01[65:0]   = sqe_cnt0[65:0] | sqe_cnt1[65:0]                                  ;
// assign sqe_cnt02[65:0]   = sqe_cnt0[65:0] |                  sqe_cnt2[65:0]                 ;
// assign sqe_cnt12[65:0]   =                  sqe_cnt1[65:0] | sqe_cnt2[65:0]                 ;
// assign sqe_cnt123[65:0]  =                  sqe_cnt1[65:0] | sqe_cnt2[65:0] | sqe_cnt3[65:0];
// assign sqe_cnt13[65:0]   =                  sqe_cnt1[65:0] |                  sqe_cnt3[65:0];
// assign sqe_cnt23[65:0]   =                                   sqe_cnt2[65:0] | sqe_cnt3[65:0];


fgu_fdd_dp_nand_macro__ports_3__stack_66c__width_66	isqe_cnt012	 (
 .din0( sqe_cnt0_[65:0]          ),
 .din1( sqe_cnt1_[65:0]          ),
 .din2( sqe_cnt2_[65:0]          ),
 .dout( sqe_cnt012[65:0]         ));

fgu_fdd_dp_nand_macro__ports_2__stack_66c__width_65	isqe_cnt01 	 (
 .din0( sqe_cnt0_[65:1]          ),
 .din1( sqe_cnt1_[65:1]          ),
 .dout( sqe_cnt01[65:1]          ));

fgu_fdd_dp_nand_macro__ports_2__stack_66c__width_66	isqe_cnt02 	 (
 .din0( sqe_cnt0_[65:0]          ),
 .din1( sqe_cnt2_[65:0]          ),
 .dout( sqe_cnt02[65:0]          ));

assign sqe_cnt12[64:0]   =        sqe_cnt01[65:1];
assign sqe_cnt123[64:0]  =        sqe_cnt012[65:1];
assign sqe_cnt13[64:0]   =        sqe_cnt02[65:1];
assign sqe_cnt23[64:0]   = {1'b0 ,sqe_cnt01[65:2]};


 
// * * * * * * * * * * * * * * square root * * * * * * * * * * * * * * 
// 
//                     Float Square Root Example
//
// see ~co132877/design/doc/fsqrt_examples for additional examples
// 
// Notes :
// 
//   1. PR(i+1) = 2PR(i) - q(i+1) * Dnew
//   2. Dnew = 2*Q(i) + q(i+1) * 2^-(i+1)
//   3. Q(i) == estimate of sqrt(RB) after ith iteration
//   4. PR(0) == RB
//   5. Q(0)  == 0
// 
// 
// Example 1 : RB = 1.1000 0000 0000    (PR kept in non-redundant form)
// 
//             RD = sqrt(RB) = 1.0011 1001 1000 1000 ...   (from architectural simulator)
// 
// 
//  i      divisor                   qslc    engine                       Q// Qm1
//  -      ------------------------  ----    ------------------------     ---------------
//              v
//  1      00.0 1000 0000 0000 0000   +1     00.0 1100 0000 0000 0000     1.
//                                          +11.1 1000 0000 0000 0000    -0.
//                                           ------------------------     --
//                                           00.0 0100 0000 0000 0000     1.
// 
//               v
//  2      00.1 0100 0000 0000 0000   +1     00.0 1000 0000 0000 0000     1.1
//                                          +11.0 1100 0000 0000 0000    -0.0
//                                           ------------------------     ---
//                                           11.1 0100 0000 0000 0000     1.1
// 
//                v
//  3      00.1 10m0 0000 0000 0000   -1     11.0 1000 0000 0000 0000     1.10
//         00.1 0110 0000 0000 0000         +00.1 0110 0000 0000 0000    -0.01
//                                           ------------------------     ----
//                                           11.1 1110 0000 0000 0000     1.01
// 
//                 v
//  4      00.1 0100 0000 0000 0000    0     11.1 1100 0000 0000 0000     1.100
//                                          +00.0 0000 0000 0000 0000    -0.010
//                                           ------------------------     -----
//                                           11.1 1100 0000 0000 0000     1.010
// 
//                   v
//  5      00.1 0100 0000 0000 0000    0     11.1 1000 0000 0000 0000     1.1000
//                                          +00.0 0000 0000 0000 0000    -0.0100
//                                           ------------------------     ------
//                                           11.1 1000 0000 0000 0000     1.0100
// 
//                    v
//  6      00.1 0100 0m00 0000 0000   -1     11.1 0000 0000 0000 0000     1.1000 0
//         00.1 0011 1100 0000 0000         +00.1 0011 1100 0000 0000    -0.0100 1
//                                           ------------------------     --------
//                                           00.0 0011 1100 0000 0000     1.0011 1
// 
//                     v
//  7      00.1 0011 1000 0000 0000    0     00.0 0111 1000 0000 0000     1.1000 00
//                                          +00.0 0000 0000 0000 0000    -0.0100 10
//                                           ------------------------     ---------
//                                           00.0 0111 1000 0000 0000     1.0011 10
// 
//                      v
//  8      00.1 0011 1001 0000 0000   +1     00.0 1111 0000 0000 0000     1.1000 001
//                                          +11.0 1100 0111 0000 0000    -0.0100 100
//                                           ------------------------     ----------
//                                           11.1 1011 0111 0000 0000     1.0011 101
// 
//                        v
//  9      00.1 0011 1010 m000 0000   -1     11.1 0110 1110 0000 0000     1.1000 0010
//         00.1 0011 1001 1000 0000         +00.1 0011 1001 1000 0000    -0.0100 1001
//                                           ------------------------     -----------
//                                           00.0 1010 0111 1000 0000     1.0011 1001
// 
//                         v
//  10     00.1 0011 1001 0100 0000   +1     00.1 0100 1111 0000 0000     1.1000 0010 1
//                                          +11.0 1100 0110 1100 0000    -0.0100 1001 0
//                                           ------------------------     -------------
//                                           00.0 0001 0101 1100 0000     1.0011 1001 1
// 
//                          v
//  11     00.1 0011 1001 1000 0000    0     00.0 0010 1011 1000 0000     1.1000 0010 10
//                                          +00.0 0000 0000 0000 0000    -0.0100 1001 00
//                                           ------------------------     --------------
//                                           00.0 0010 1011 1000 0000     1.0011 1001 10
// 
//                           v
//  12     00.1 0011 1001 1000 0000    0     00.0 0101 0111 0000 0000     1.1000 0010 100
//                                          +00.0 0000 0000 0000 0000    -0.0100 1001 000
//                                           ------------------------     ---------------
//                                           00.0 0101 0111 0000 0000     1.0011 1001 100
// 
//                             v
//  13     00.1 0011 1001 1000 1000   +1     00.0 1010 1110 0000 0000     1.1000 0010 1001
//                                          +11.0 1100 0110 0111 1000    -0.0100 1001 0000
//                                           ------------------------     ----------------
//                                           11.1 0111 0100 0111 1000     1.0011 1001 1001
// 
//                              v
//  14     00.1 0011 1001 1001 0m00   -1     11.0 1110 1000 1111 0000     1.1000 0010 1001 0
//         00.1 0011 1001 1000 1100         +00.1 0011 1001 1000 1100    -0.0100 1001 0000 1
//                                           ------------------------     ------------------
//                                           00.0 0011 0010 0111 1100     1.0011 1001 1000 1
// 
// 
//                                                        RD = sqrt(RB) = 1.0011 1001 1000 1000 ...
// 
//  END EXAMPLE


// fixscan start:
assign q_rs1_ff_scanin           = scan_in                  ;
assign q_rs2_ff_scanin           = q_rs1_ff_scanout         ;
assign ipe_clth_scanin           = q_rs2_ff_scanout         ;
assign ipe_slth_scanin           = ipe_clth_scanout         ;
assign ie_s00lth_scanin          = ipe_slth_scanout         ;
assign ie_c00lth_scanin          = ie_s00lth_scanout        ;
assign ie_d00lth_scanin          = ie_c00lth_scanout        ;
assign ie_d00lthp1_scanin        = ie_d00lth_scanout        ;
assign ie_d00lthm1_scanin        = ie_d00lthp1_scanout      ;
assign ie_qlth_scanin            = ie_d00lthm1_scanout      ;
assign ie_qm1lth_scanin          = ie_qlth_scanout          ;
assign ipte_clalth0_scanin       = ie_qm1lth_scanout        ;
assign ipte_clalth1_scanin       = ipte_clalth0_scanout     ;
assign ipte_result_scanin        = ipte_clalth1_scanout     ;
assign isqe_cnt_scanin           = ipte_result_scanout      ;
assign isqe_flip_scanin          = isqe_cnt_scanout         ;
assign scan_out                  = isqe_flip_scanout        ;
// fixscan end:
endmodule


//
//   buff macro
//
//





module fgu_fdd_dp_buff_macro__dbuff_32x__rep_1__stack_66c__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule









// any PARAMS parms go into naming of macro

module fgu_fdd_dp_msff_macro__stack_66c__width_64 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fdd_dp_msff_macro__mux_aope__ports_3__stack_66c__width_64 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire psel2;
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input sel0;
  input sel1;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_penc3_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(64)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
.dout(muxout[63:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fdd_dp_msff_macro__mux_aope__ports_4__stack_66c__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel0, 
  sel1, 
  sel2, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  input sel0;
  input sel1;
  input sel2;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_penc4_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(64)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
.dout(muxout[63:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fdd_dp_mux_macro__mux_aodec__ports_8__stack_66c__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  input [63:0] din4;
  input [63:0] din5;
  input [63:0] din6;
  input [63:0] din7;
  input [2:0] sel;
  output [63:0] dout;





cl_dp1_pdec8_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .sel2(sel[2]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7)
);

mux8s #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
  .in5(din5[63:0]),
  .in6(din6[63:0]),
  .in7(din7[63:0]),
.dout(dout[63:0])
);









  



endmodule


//
//   buff macro
//
//





module fgu_fdd_dp_buff_macro__stack_66c__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






buff #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module fgu_fdd_dp_xor_macro__ports_2__stack_66c__width_64 (
  din0, 
  din1, 
  dout);
  input [63:0] din0;
  input [63:0] din1;
  output [63:0] dout;





xor2 #(64)  d0_0 (
.in0(din0[63:0]),
.in1(din1[63:0]),
.out(dout[63:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fdd_dp_mux_macro__mux_aonpe__ports_5__stack_66c__width_66 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;

  input [65:0] din0;
  input sel0;
  input [65:0] din1;
  input sel1;
  input [65:0] din2;
  input sel2;
  input [65:0] din3;
  input sel3;
  input [65:0] din4;
  input sel4;
  output [65:0] dout;





cl_dp1_muxbuff5_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4)
);
mux5s #(66)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .in0(din0[65:0]),
  .in1(din1[65:0]),
  .in2(din2[65:0]),
  .in3(din3[65:0]),
  .in4(din4[65:0]),
.dout(dout[65:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fdd_dp_mux_macro__mux_aonpe__ports_3__stack_66c__width_66 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;

  input [65:0] din0;
  input sel0;
  input [65:0] din1;
  input sel1;
  input [65:0] din2;
  input sel2;
  output [65:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(66)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[65:0]),
  .in1(din1[65:0]),
  .in2(din2[65:0]),
.dout(dout[65:0])
);









  



endmodule


//  
//   or macro for ports = 2,3
//
//





module fgu_fdd_dp_or_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module fgu_fdd_dp_nor_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule









// any PARAMS parms go into naming of macro

module fgu_fdd_dp_msff_macro__mux_aonpe__ports_4__stack_66c__width_66 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire [65:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [64:0] so;

  input [65:0] din0;
  input sel0;
  input [65:0] din1;
  input sel1;
  input [65:0] din2;
  input sel2;
  input [65:0] din3;
  input sel3;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [65:0] dout;


  output scan_out;




cl_dp1_muxbuff4_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(66)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[65:0]),
  .in1(din1[65:0]),
  .in2(din2[65:0]),
  .in3(din3[65:0]),
.dout(muxout[65:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(66)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[65:0]),
.si({scan_in,so[64:0]}),
.so({so[64:0],scan_out}),
.q(dout[65:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fdd_dp_msff_macro__mux_aonpe__ports_4__stack_66c__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  input [63:0] din3;
  input sel3;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_muxbuff4_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(64)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
.dout(muxout[63:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule









//  
//   or macro for ports = 2,3
//
//





module fgu_fdd_dp_or_macro__ports_2__stack_66c__width_66 (
  din0, 
  din1, 
  dout);
  input [65:0] din0;
  input [65:0] din1;
  output [65:0] dout;






or2 #(66)  d0_0 (
.in0(din0[65:0]),
.in1(din1[65:0]),
.out(dout[65:0])
);









endmodule





//
//   xor macro for ports = 2,3
//
//





module fgu_fdd_dp_xor_macro__ports_2__stack_66c__width_66 (
  din0, 
  din1, 
  dout);
  input [65:0] din0;
  input [65:0] din1;
  output [65:0] dout;





xor2 #(66)  d0_0 (
.in0(din0[65:0]),
.in1(din1[65:0]),
.out(dout[65:0])
);








endmodule





//
//   nor macro for ports = 2,3
//
//





module fgu_fdd_dp_nor_macro__ports_2__stack_66c__width_65 (
  din0, 
  din1, 
  dout);
  input [64:0] din0;
  input [64:0] din1;
  output [64:0] dout;






nor2 #(65)  d0_0 (
.in0(din0[64:0]),
.in1(din1[64:0]),
.out(dout[64:0])
);







endmodule









// any PARAMS parms go into naming of macro

module fgu_fdd_dp_msff_macro__mux_aonpe__ports_4__stack_66c__width_65 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire [64:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [63:0] so;

  input [64:0] din0;
  input sel0;
  input [64:0] din1;
  input sel1;
  input [64:0] din2;
  input sel2;
  input [64:0] din3;
  input sel3;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [64:0] dout;


  output scan_out;




cl_dp1_muxbuff4_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(65)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[64:0]),
  .in1(din1[64:0]),
  .in2(din2[64:0]),
  .in3(din3[64:0]),
.dout(muxout[64:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(65)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[64:0]),
.si({scan_in,so[63:0]}),
.so({so[63:0],scan_out}),
.q(dout[64:0])
);




















endmodule









//  
//   or macro for ports = 2,3
//
//





module fgu_fdd_dp_or_macro__ports_2__stack_66c__width_65 (
  din0, 
  din1, 
  dout);
  input [64:0] din0;
  input [64:0] din1;
  output [64:0] dout;






or2 #(65)  d0_0 (
.in0(din0[64:0]),
.in1(din1[64:0]),
.out(dout[64:0])
);









endmodule





//
//      3:2 Carry Save Adder
//
//




// any PARAMS parms go into naming of macro


module fgu_fdd_dp_csa32_macro__stack_66c__width_65 (
  i0, 
  i1, 
  i2, 
  carry, 
  sum);
  input  [64:0] i0;
  input  [64:0] i1;
  input  [64:0] i2;
  output [64:0] carry;
  output [64:0] sum;






csa32 #(65)  d0_0 (
.in0(i0[64:0]),
.in1(i1[64:0]),
.in2(i2[64:0]),
.carry(carry[64:0]),
.sum(sum[64:0])
);









endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fdd_dp_mux_macro__dmux_6x__mux_aonpe__ports_3__stack_66c__width_65 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;

  input [64:0] din0;
  input sel0;
  input [64:0] din1;
  input sel1;
  input [64:0] din2;
  input sel2;
  output [64:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(65)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[64:0]),
  .in1(din1[64:0]),
  .in2(din2[64:0]),
.dout(dout[64:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fdd_dp_mux_macro__dmux_6x__mux_aonpe__ports_3__stack_66c__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  output [63:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(64)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
.dout(dout[63:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fdd_dp_mux_macro__mux_aonpe__ports_3__stack_66c__width_65 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;

  input [64:0] din0;
  input sel0;
  input [64:0] din1;
  input sel1;
  input [64:0] din2;
  input sel2;
  output [64:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(65)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[64:0]),
  .in1(din1[64:0]),
  .in2(din2[64:0]),
.dout(dout[64:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fdd_dp_mux_macro__mux_aope__ports_2__stack_66c__width_64 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [63:0] din0;
  input [63:0] din1;
  input sel0;
  output [63:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(dout[63:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module fgu_fdd_dp_msff_macro__stack_66c__width_66 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [64:0] so;

  input [65:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [65:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(66)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[65:0]),
.si({scan_in,so[64:0]}),
.so({so[64:0],scan_out}),
.q(dout[65:0])
);




















endmodule









//
//   invert macro
//
//





module fgu_fdd_dp_inv_macro__stack_66c__width_65 (
  din, 
  dout);
  input [64:0] din;
  output [64:0] dout;






inv #(65)  d0_0 (
.in(din[64:0]),
.out(dout[64:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fdd_dp_mux_macro__mux_aope__ports_4__stack_66c__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel0, 
  sel1, 
  sel2, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  input sel0;
  input sel1;
  input sel2;
  output [63:0] dout;





cl_dp1_penc4_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
.dout(dout[63:0])
);









  



endmodule


//
//      3:2 Carry Save Adder
//
//




// any PARAMS parms go into naming of macro


module fgu_fdd_dp_csa32_macro__stack_66c__width_64 (
  i0, 
  i1, 
  i2, 
  carry, 
  sum);
  input  [63:0] i0;
  input  [63:0] i1;
  input  [63:0] i2;
  output [63:0] carry;
  output [63:0] sum;






csa32 #(64)  d0_0 (
.in0(i0[63:0]),
.in1(i1[63:0]),
.in2(i2[63:0]),
.carry(carry[63:0]),
.sum(sum[63:0])
);









endmodule






// any PARAMS parms go into naming of macro

module fgu_fdd_dp_msff_macro__mux_aope__ports_6__stack_66c__width_65 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  sel4, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire [64:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [63:0] so;

  input [64:0] din0;
  input [64:0] din1;
  input [64:0] din2;
  input [64:0] din3;
  input [64:0] din4;
  input [64:0] din5;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [64:0] dout;


  output scan_out;




cl_dp1_penc6_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .sel4(sel4),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5)
);

mux6s #(65)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .in0(din0[64:0]),
  .in1(din1[64:0]),
  .in2(din2[64:0]),
  .in3(din3[64:0]),
  .in4(din4[64:0]),
  .in5(din5[64:0]),
.dout(muxout[64:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(65)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[64:0]),
.si({scan_in,so[63:0]}),
.so({so[63:0],scan_out}),
.q(dout[64:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fdd_dp_msff_macro__mux_aope__ports_4__stack_66c__width_65 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel0, 
  sel1, 
  sel2, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire [64:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [63:0] so;

  input [64:0] din0;
  input [64:0] din1;
  input [64:0] din2;
  input [64:0] din3;
  input sel0;
  input sel1;
  input sel2;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [64:0] dout;


  output scan_out;




cl_dp1_penc4_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(65)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[64:0]),
  .in1(din1[64:0]),
  .in2(din2[64:0]),
  .in3(din3[64:0]),
.dout(muxout[64:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(65)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[64:0]),
.si({scan_in,so[63:0]}),
.so({so[63:0],scan_out}),
.q(dout[64:0])
);




















endmodule









//
//   cla macro
//
//





module fgu_fdd_dp_cla_macro__width_64 (
  cin, 
  din0, 
  din1, 
  dout, 
  cout);
  input cin;
  input [63:0] din0;
  input [63:0] din1;
  output [63:0] dout;
  output cout;







cla #(64)  m0_0 (
.cin(cin),
.in0(din0[63:0]),
.in1(din1[63:0]),
.out(dout[63:0]),
.cout(cout)
);












endmodule





//  
//   and macro for ports = 2,3,4
//
//





module fgu_fdd_dp_and_macro__ports_2__stack_66c__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule









// any PARAMS parms go into naming of macro

module fgu_fdd_dp_msff_macro__mux_aope__ports_6__stack_66c__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  sel4, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  input [63:0] din4;
  input [63:0] din5;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_penc6_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .sel4(sel4),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5)
);

mux6s #(64)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
  .in5(din5[63:0]),
.dout(muxout[63:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fdd_dp_msff_macro__mux_aope__ports_2__stack_66c__width_66 (
  din0, 
  din1, 
  sel0, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire [65:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [64:0] so;

  input [65:0] din0;
  input [65:0] din1;
  input sel0;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [65:0] dout;


  output scan_out;




cl_dp1_penc2_8x  c1_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(66)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[65:0]),
  .in1(din1[65:0]),
.dout(muxout[65:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(66)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[65:0]),
.si({scan_in,so[64:0]}),
.so({so[64:0],scan_out}),
.q(dout[65:0])
);




















endmodule









//
//   invert macro
//
//





module fgu_fdd_dp_inv_macro__stack_66c__width_66 (
  din, 
  dout);
  input [65:0] din;
  output [65:0] dout;






inv #(66)  d0_0 (
.in(din[65:0]),
.out(dout[65:0])
);









endmodule









// any PARAMS parms go into naming of macro

module fgu_fdd_dp_msff_macro__mux_aonpe__ports_2__stack_66c__width_66 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire buffout0;
wire buffout1;
wire [65:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [64:0] so;

  input [65:0] din0;
  input sel0;
  input [65:0] din1;
  input sel1;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [65:0] dout;


  output scan_out;




cl_dp1_muxbuff2_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(66)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[65:0]),
  .in1(din1[65:0]),
.dout(muxout[65:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(66)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[65:0]),
.si({scan_in,so[64:0]}),
.so({so[64:0],scan_out}),
.q(dout[65:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fdd_dp_mux_macro__mux_aonpe__ports_2__stack_66c__width_66 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [65:0] din0;
  input sel0;
  input [65:0] din1;
  input sel1;
  output [65:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(66)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[65:0]),
  .in1(din1[65:0]),
.dout(dout[65:0])
);









  



endmodule


//
//   nand macro for ports = 2,3,4
//
//





module fgu_fdd_dp_nand_macro__ports_3__stack_66c__width_66 (
  din0, 
  din1, 
  din2, 
  dout);
  input [65:0] din0;
  input [65:0] din1;
  input [65:0] din2;
  output [65:0] dout;






nand3 #(66)  d0_0 (
.in0(din0[65:0]),
.in1(din1[65:0]),
.in2(din2[65:0]),
.out(dout[65:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module fgu_fdd_dp_nand_macro__ports_2__stack_66c__width_65 (
  din0, 
  din1, 
  dout);
  input [64:0] din0;
  input [64:0] din1;
  output [64:0] dout;






nand2 #(65)  d0_0 (
.in0(din0[64:0]),
.in1(din1[64:0]),
.out(dout[64:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module fgu_fdd_dp_nand_macro__ports_2__stack_66c__width_66 (
  din0, 
  din1, 
  dout);
  input [65:0] din0;
  input [65:0] din1;
  output [65:0] dout;






nand2 #(66)  d0_0 (
.in0(din0[65:0]),
.in1(din1[65:0]),
.out(dout[65:0])
);









endmodule




