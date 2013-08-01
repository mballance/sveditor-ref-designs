// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fgu_fpe_dp.v
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
module fgu_fpe_dp (
  fad_rs1_fx1, 
  fad_rs2_fx1, 
  fac_aexp_fmt_sel_e, 
  fac_bexp_fmt_sel_e, 
  fac_aux_cin_fx1, 
  main_clken, 
  fpc_exp_sel_mul_fx5, 
  fpc_eintx_sel_fx2, 
  fpc_eadjx_sel_fx2, 
  fpc_ma_fmt_sel_fx4, 
  fpc_rinc_sel_fx5, 
  fpc_q_rinc_sel_fx5, 
  fpe_aux_rs2_fmt_fx1_b0, 
  fpe_aux_eint_fx1, 
  fpe_rs1_fmt_fx1, 
  fpe_rs2_fmt_fx1, 
  fpe_einty_adj_cout_fx5, 
  fpe_einty_eq_eadj_fx5, 
  fgu_mul_result_fx5_b63, 
  fpf_rcout_fx5, 
  fpe_exp_res_fb, 
  fpe_align_sel_fx2, 
  fic_i2f_eadj_fx2, 
  fic_norm_eadj_fx5, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_dectest, 
  tcu_muxtest, 
  tcu_scan_en, 
  scan_out);
wire stop;
wire test;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire fx1_fmtsel_scanin;
wire fx1_fmtsel_scanout;
wire [9:0] aexp_fmt_sel_fx1;
wire [7:0] bexp_fmt_sel_fx1;
wire tcu_muxtest_a_rep0;
wire tcu_muxtest_b_rep0;
wire [10:0] rs1_fmt_fx1_;
wire [10:0] rs2_fmt_fx1_;
wire amb_unused;
wire [10:0] ea_minus_eb_fx1;
wire ea_gteq_eb_fx1;
wire bma_unused;
wire [10:0] eb_minus_ea_fx1;
wire eb_gteq_ea_fx1;
wire fx2_swp_sel_scanin;
wire fx2_swp_sel_scanout;
wire [10:0] eintw_fx2;
wire rs1_fx1_b62_;
wire [10:0] rs2_fx1_b62_52_;
wire rs1_fx1_b30_;
wire [7:0] rs2_fx1_b30_23_;
wire tcu_muxtest_c_rep0;
wire [10:0] aux_rs1_fmt_fx1;
wire tcu_muxtest_d_rep0;
wire [10:1] aux_rs2_fmt_fx1;
wire [11:0] aux_eint_fx1;
wire aux_add_unused;
wire fx2_aux_scanin;
wire fx2_aux_scanout;
wire [10:0] aux_eint_fx2;
wire [10:0] eintx_fx2;
wire [5:0] i2f_eadj_fx2_;
wire [11:0] eadjx_fx2;
wire [1:0] einty_unused;
wire [10:0] einty_fx2;
wire fx3_einty_scanin;
wire fx3_einty_scanout;
wire [10:0] einty_fx3;
wire fx4_einty_scanin;
wire fx4_einty_scanout;
wire [10:0] einty_fx4;
wire [1:0] ma_fmt_sel_fx5;
wire [10:0] einty_fx5;
wire [1:0] einty_inc_unused;
wire [10:0] einty_inc_fx5;
wire i_exp_inc_sel_fx5;
wire enoinc_i1_fx5_;
wire enoinc_i1_fx5;
wire einty_adj_cin_fx5;
wire [5:0] eadj_fx5_;
wire einty_adj_unused;
wire [10:0] einty_adj_fx5;
wire [0:0] cmp_exp_eadj;
wire i_exp_inc_sel_fx5_;
wire fpc_exp_sel_mul_fx5_;
wire einc_i0_fx5;
wire einc_i1_fx5;
wire exp_inc_sel_fx5;
wire exp_noinc_sel_fx5;
wire [10:0] exp_res_fx5;
wire fb_exp_res_scanin;
wire fb_exp_res_scanout;



// ----------------------------------------------------------------------------
// Interface with FAD
// ----------------------------------------------------------------------------

input  [62:23] fad_rs1_fx1;            // rs1 unformatted
input  [62:23] fad_rs2_fx1;            // rs2 unformatted

// ----------------------------------------------------------------------------
// Interface with FAC
// ----------------------------------------------------------------------------

input    [9:0] fac_aexp_fmt_sel_e;     // aop exponent format mux select
input    [7:0] fac_bexp_fmt_sel_e;     // bop exponent format mux select
input          fac_aux_cin_fx1;        // aux exp adder cin

input          main_clken;             // main clken

// ----------------------------------------------------------------------------
// Interface with FPC
// ----------------------------------------------------------------------------

input          fpc_exp_sel_mul_fx5;
input    [3:0] fpc_eintx_sel_fx2;      // FxTOs=0001, FxTOd=0010, FiTO(s,d)=0100, F(s)MUL(s,d)=1000
input    [2:0] fpc_eadjx_sel_fx2;      // F(i,x)TO(s,d)=001, FsTOd=010, FdTOs=100
input    [1:0] fpc_ma_fmt_sel_fx4;     // FADD/FSUB: 001=00.1X, 010=1X.XX, 100=default
input          fpc_rinc_sel_fx5;
input          fpc_q_rinc_sel_fx5;     // rinc_sel and ~logical_sub 00.1X
output         fpe_aux_rs2_fmt_fx1_b0;
output  [11:0] fpe_aux_eint_fx1;
output  [10:0] fpe_rs1_fmt_fx1;
output  [10:0] fpe_rs2_fmt_fx1;
output         fpe_einty_adj_cout_fx5;
output         fpe_einty_eq_eadj_fx5;

// ----------------------------------------------------------------------------
// Interface with FPY
// ----------------------------------------------------------------------------

input          fgu_mul_result_fx5_b63;

// ----------------------------------------------------------------------------
// Interface with FPF
// ----------------------------------------------------------------------------

input          fpf_rcout_fx5;
output  [10:0] fpe_exp_res_fb;
output  [10:0] fpe_align_sel_fx2;

// ----------------------------------------------------------------------------
// Interface with FIC
// ----------------------------------------------------------------------------

input    [5:0] fic_i2f_eadj_fx2;
input    [5:0] fic_norm_eadj_fx5;

// ----------------------------------------------------------------------------
// Global Signals
// ----------------------------------------------------------------------------

input           l2clk;                  // clock input
input  	        scan_in;
input  		tcu_pce_ov;		// scan signals
input  		spc_aclk;
input  		spc_bclk;
input 	        tcu_dectest;
input           tcu_muxtest;
input           tcu_scan_en;
output 		scan_out;

// scan renames
assign stop   = 1'b0;
assign test   = tcu_dectest;
// end scan

fgu_fpe_dp_buff_macro__dbuff_32x__rep_1__stack_32l__width_4 test_rep0  (
  .din ({tcu_scan_en, tcu_pce_ov, spc_aclk, spc_bclk}),
  .dout({se,          pce_ov,     siclk,    soclk   })
  );


// ----------------------------------------------------------------------------
//                               FX1 stage
// ----------------------------------------------------------------------------

fgu_fpe_dp_msff_macro__stack_32l__width_18 fx1_fmtsel  (
  .scan_in(fx1_fmtsel_scanin),
  .scan_out(fx1_fmtsel_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din ({fac_aexp_fmt_sel_e[9:0],   fac_bexp_fmt_sel_e[7:0]  }),
  .dout({    aexp_fmt_sel_fx1[9:0],     bexp_fmt_sel_fx1[7:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ------------------------------------
// Add exponent input format muxes
//
// FADD: IF (Eb>=Ea) THEN (SC=(Eb-Ea)); ELSE (SC=(Ea-Eb))
//       IF (Eb>=Ea) THEN (Eint=Eb);    ELSE (Eint=Ea)
// ------------------------------------

fgu_fpe_dp_buff_macro__dbuff_32x__stack_32l__width_1 muxtest_a_rep0  (
  .din (tcu_muxtest	  ),
  .dout(tcu_muxtest_a_rep0)
  );

fgu_fpe_dp_mux_macro__mux_pgpe__ports_8__stack_32l__width_11 add_fmt1  (
  .muxtst(tcu_muxtest_a_rep0),
  .din0( 11'b00000000001            ),  // FGX, F(s,d)TO(d,s), FSQRT(s,d)
  .din1({3'b000, fad_rs1_fx1[30:23]}),  // SP odd
  .din2({3'b000, fad_rs1_fx1[62:55]}),  // SP even
  .din3(         fad_rs1_fx1[62:52] ),  // DP
  .din4( 11'b00010111110            ),  // FsTOx                2^(63+127) =2^190
  .din5( 11'b10000111110            ),  // FdTOx                2^(63+1023)=2^1086
  .din6( 11'b00010011110            ),  // FsTOi,F(i,x)TO(s,d)  2^(31+127) =2^158
  .din7( 11'b10000011110            ),  // FdTOi                2^(31+1023)=2^1054
  .sel0(aexp_fmt_sel_fx1[0]),
  .sel1(aexp_fmt_sel_fx1[1]),
  .sel2(aexp_fmt_sel_fx1[2]),
  .sel3(aexp_fmt_sel_fx1[3]),
  .sel4(aexp_fmt_sel_fx1[4]),
  .sel5(aexp_fmt_sel_fx1[5]),
  .sel6(aexp_fmt_sel_fx1[6]),
  .dout(fpe_rs1_fmt_fx1[10:0]  ),
  .test(test)
  );

fgu_fpe_dp_buff_macro__dbuff_32x__stack_32l__width_1 muxtest_b_rep0  (
  .din (tcu_muxtest	  ),
  .dout(tcu_muxtest_b_rep0)
  );

fgu_fpe_dp_mux_macro__mux_pgpe__ports_4__stack_32l__width_11 add_fmt2  (
  .muxtst(tcu_muxtest_b_rep0),
  .din0( 11'b00000000001            ),  // FGX, F(i,x)TO(s,d)
  .din1({3'b000, fad_rs2_fx1[30:23]}),  // SP odd
  .din2({3'b000, fad_rs2_fx1[62:55]}),  // SP even
  .din3(         fad_rs2_fx1[62:52] ),  // DP
  .sel0(bexp_fmt_sel_fx1[0]),
  .sel1(bexp_fmt_sel_fx1[1]),
  .sel2(bexp_fmt_sel_fx1[2]),
  .dout(fpe_rs2_fmt_fx1[10:0]  ),
  .test(test)
  );

// ------------------------------------
// Ea-Eb, Eb-Ea
// ------------------------------------

fgu_fpe_dp_inv_macro__stack_32l__width_11 inv_a  (
  .din (fpe_rs1_fmt_fx1[10:0] ),
  .dout(    rs1_fmt_fx1_[10:0]) 
  );

fgu_fpe_dp_inv_macro__stack_32l__width_11 inv_b  (
  .din (fpe_rs2_fmt_fx1[10:0] ),
  .dout(    rs2_fmt_fx1_[10:0]) 
  );

fgu_fpe_dp_cla_macro__width_12 amb  (
  .din0({1'b1,     rs2_fmt_fx1_[10:0]}),
  .din1({1'b0, fpe_rs1_fmt_fx1[10:0] }),
  .cin ( 1'b1                         ),
  .dout({amb_unused, ea_minus_eb_fx1[10:0]}),
  .cout( ea_gteq_eb_fx1               )
  );

fgu_fpe_dp_cla_macro__width_12 bma  (
  .din0({1'b0, fpe_rs2_fmt_fx1[10:0] }),
  .din1({1'b1,     rs1_fmt_fx1_[10:0]}),
  .cin ( 1'b1                         ),
  .dout({bma_unused, eb_minus_ea_fx1[10:0]}),
  .cout( eb_gteq_ea_fx1               )
  );

// ------------------------------------
// {generate aligner shift selects, Eintw}
// ------------------------------------

fgu_fpe_dp_msff_macro__mux_aonpe__ports_2__stack_32l__width_22 fx2_swp_sel  (
  .scan_in(fx2_swp_sel_scanin),
  .scan_out(fx2_swp_sel_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din0({eb_minus_ea_fx1[10:0],   fpe_rs2_fmt_fx1[10:0]}),
  .din1({ea_minus_eb_fx1[10:0],   fpe_rs1_fmt_fx1[10:0]}),
  .sel0(eb_gteq_ea_fx1),
  .sel1(ea_gteq_eb_fx1),
  .dout({fpe_align_sel_fx2[10:0], eintw_fx2[10:0]      }),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ------------------------------------
// Multiply/Divide exponent input format muxes
//
// FMUL:  Eint=Ea+Eb-bias
//          -bias is accomplished by inverting Ea MSB and setting CPA cin=1
//
// FSQRT: Eint= 0+Eb-bias
//          -bias is accomplished by inverting Ea MSB and setting CPA cin=1
//
// FDIV:  Eint=Ea-Eb+bias=Ea+~Eb+1+bias
//          +bias+1 is accomplished by inverting Ea MSB, must invert Eb
// ------------------------------------

fgu_fpe_dp_inv_macro__stack_32l__width_21 inv_ab  (
  .din ({fad_rs1_fx1[62],  fad_rs2_fx1[62:52],        fad_rs1_fx1[30],  fad_rs2_fx1[30:23]      }),
  .dout({    rs1_fx1_b62_,     rs2_fx1_b62_52_[10:0],     rs1_fx1_b30_,     rs2_fx1_b30_23_[7:0]}) 
  );

fgu_fpe_dp_buff_macro__dbuff_32x__stack_32l__width_1 muxtest_c_rep0  (
  .din (tcu_muxtest	  ),
  .dout(tcu_muxtest_c_rep0)
  );

fgu_fpe_dp_mux_macro__mux_pgpe__ports_7__stack_32l__width_11 aux_fmt1  (
  .muxtst(tcu_muxtest_c_rep0),
  .din0({3'b100, bexp_fmt_sel_fx1[2] , 7'b0         }),  // FSQRT (~bias),
                                                         //   bexp_fmt_sel_fx1[2] asserts if SP
  .din1(11'b11110000001                              ),  // FdTOs (-896-1=-897)
  .din2({     {4{rs1_fx1_b30_}}, fad_rs1_fx1[29:23] }),  // bias extended SP odd  -> DP
  .din3({     {4{rs1_fx1_b62_}}, fad_rs1_fx1[61:55] }),  // bias extended SP even -> DP
  .din4({3'b000, rs1_fx1_b30_,   fad_rs1_fx1[29:23] }),  // SP odd
  .din5({3'b000, rs1_fx1_b62_,   fad_rs1_fx1[61:55] }),  // SP even
  .din6({        rs1_fx1_b62_,   fad_rs1_fx1[61:52] }),  // DP
  .sel0(aexp_fmt_sel_fx1[0]),
  .sel1(aexp_fmt_sel_fx1[7]),
  .sel2(aexp_fmt_sel_fx1[8]),
  .sel3(aexp_fmt_sel_fx1[9]),
  .sel4(aexp_fmt_sel_fx1[1]),
  .sel5(aexp_fmt_sel_fx1[2]),
  .dout(aux_rs1_fmt_fx1[10:0]),
  .test(test)
  );

fgu_fpe_dp_buff_macro__dbuff_32x__stack_32l__width_1 muxtest_d_rep0  (
  .din (tcu_muxtest	  ),
  .dout(tcu_muxtest_d_rep0)
  );

fgu_fpe_dp_mux_macro__mux_pgpe__ports_8__stack_32l__width_11 aux_fmt2  (
  .muxtst(tcu_muxtest_d_rep0),
  .din0({3'b000,                     rs2_fx1_b30_23_[7:0] }),  // SP odd  FDIV
  .din1({3'b000,                     rs2_fx1_b62_52_[10:3]}),  // SP even FDIV
  .din2({                            rs2_fx1_b62_52_[10:0]}),  // DP      FDIV
  .din3({fad_rs2_fx1[30],
              {3{rs2_fx1_b30_23_[7] }}, fad_rs2_fx1[29:23]}),  // bias extended SP odd  -> DP
  .din4({fad_rs2_fx1[62],
              {3{rs2_fx1_b62_52_[10]}}, fad_rs2_fx1[61:55]}),  // bias extended SP even -> DP
  .din5({3'b000,                 fad_rs2_fx1[30:23]       }),  // SP odd
  .din6({3'b000,                 fad_rs2_fx1[62:55]       }),  // SP even
  .din7({                        fad_rs2_fx1[62:52]       }),  // DP
  .sel0(bexp_fmt_sel_fx1[3]),
  .sel1(bexp_fmt_sel_fx1[4]),
  .sel2(bexp_fmt_sel_fx1[5]),
  .sel3(bexp_fmt_sel_fx1[6]),
  .sel4(bexp_fmt_sel_fx1[7]),
  .sel5(bexp_fmt_sel_fx1[1]),
  .sel6(bexp_fmt_sel_fx1[2]),
  .dout({aux_rs2_fmt_fx1[10:1], fpe_aux_rs2_fmt_fx1_b0}),
  .test(test)
  );

// ------------------------------------
// Auxiliary exponent adder
// ------------------------------------

fgu_fpe_dp_cla_macro__width_12 aux_add  (
  .din0({1'b0, aux_rs1_fmt_fx1[10:0]                        }),
  .din1({1'b0, aux_rs2_fmt_fx1[10:1], fpe_aux_rs2_fmt_fx1_b0}),
  .cin ( fac_aux_cin_fx1                 ),
  .dout(     aux_eint_fx1[11:0]          ),
  .cout(     aux_add_unused              )
  );

fgu_fpe_dp_buff_macro__width_12 buf_aux_add  (
  .din (    aux_eint_fx1[11:0]),
  .dout(fpe_aux_eint_fx1[11:0])
  );

// ----------------------------------------------------------------------------
//                               FX2 stage
// ----------------------------------------------------------------------------

fgu_fpe_dp_msff_macro__stack_32l__width_11 fx2_aux  (
  .scan_in(fx2_aux_scanin),
  .scan_out(fx2_aux_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din (fpe_aux_eint_fx1[10:0]),
  .dout(    aux_eint_fx2[10:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ------------------------------------
// Eintx
// ------------------------------------

fgu_fpe_dp_mux_macro__mux_aope__ports_5__stack_32l__width_11 eintx  (
  .din0(11'b11111111111   ),  // NaN
  .din1(11'b00010111110   ),  // F(i,x)TOs  2^(63+127) =2^190
  .din2(11'b10000111110   ),  // F(i,x)TOd  2^(63+1023)=2^1086
  .din3(aux_eint_fx2[10:0]),  // F(s)MUL(s,d)
  .din4(eintw_fx2[10:0]   ),  // other
  .sel0(fpc_eintx_sel_fx2[0]),
  .sel1(fpc_eintx_sel_fx2[1]),
  .sel2(fpc_eintx_sel_fx2[2]),
  .sel3(fpc_eintx_sel_fx2[3]),
  .dout(eintx_fx2[10:0] )
  );

// ------------------------------------
// Eadjx for F(i,x)TO(s,d), FsTOd, FdTOs
// ------------------------------------

fgu_fpe_dp_inv_macro__stack_32l__width_6 inv_i2f  (
  .din (fic_i2f_eadj_fx2[5:0]  ),
  .dout(    i2f_eadj_fx2_[5:0]) 
  );

fgu_fpe_dp_mux_macro__mux_aope__ports_4__stack_32l__width_12 eadjx  (
  .din0({ 6'b111111, i2f_eadj_fx2_[5:0]}),  // F(i,x)TO(s,d),    ~(i2f norm amount)
  .din1( 12'b001101111111),                 // FsTOd, 2^(896-1), note: cin=1 in adder below
  .din2( 12'b110001111111),                 // FdTOs, ~(2^896),  note: cin=1 in adder below
  .din3( 12'b111111111111),                 // other, ~zero
  .sel0(fpc_eadjx_sel_fx2[0]),
  .sel1(fpc_eadjx_sel_fx2[1]),
  .sel2(fpc_eadjx_sel_fx2[2]),
  .dout(eadjx_fx2[11:0])
  );

// ------------------------------------
// Einty=Eintx-Eadjx
// ------------------------------------

fgu_fpe_dp_cla_macro__width_12 einty  (
  .din0({1'b0, eintx_fx2[10:0]}),
  .din1(       eadjx_fx2[11:0] ),
  .cin ( 1'b1                  ),
  .dout({einty_unused[0], einty_fx2[10:0]}),
  .cout( einty_unused[1]       )
  );

// ----------------------------------------------------------------------------
//                               FX3 stage
// ----------------------------------------------------------------------------

fgu_fpe_dp_msff_macro__stack_32l__width_11 fx3_einty  (
  .scan_in(fx3_einty_scanin),
  .scan_out(fx3_einty_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din (einty_fx2[10:0]),
  .dout(einty_fx3[10:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ----------------------------------------------------------------------------
//                               FX4 stage
// ----------------------------------------------------------------------------

fgu_fpe_dp_msff_macro__stack_32l__width_24 fx4_einty  (
  .scan_in(fx4_einty_scanin),
  .scan_out(fx4_einty_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din ({fpc_ma_fmt_sel_fx4[1:0], einty_fx4[10:0], einty_fx3[10:0]}),
  .dout({    ma_fmt_sel_fx5[1:0], einty_fx5[10:0], einty_fx4[10:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );

// ----------------------------------------------------------------------------
//                               FX5 stage
// ----------------------------------------------------------------------------

// ------------------------------------
// Einty_inc=Einty+(1X.XX|Rcout)
// ------------------------------------

fgu_fpe_dp_increment_macro__width_12 einty_inc  (
  .din ({1'b0, einty_fx5[10:0]}),
  .cin ( 1'b1                  ),
  .dout({einty_inc_unused[0], einty_inc_fx5[10:0] }),
  .cout( einty_inc_unused[1]   )
  );

fgu_fpe_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_32l__width_1 i_einc  ( 
  .din0(fgu_mul_result_fx5_b63),  // fpy 1X.XX (fmul)
  .din1(ma_fmt_sel_fx5[1]     ),  // logical_add 1X.XX, intfp 10.00
  .sel0(fpc_exp_sel_mul_fx5   ),  // fmul instr
  .sel1(1'b1                  ),
  .dout(i_exp_inc_sel_fx5     )   // exp inc detected
  );

// ------------------------------------
// Einty_adj=Einty-Eadj
// - cin not asserted if logical_sub and 00.1X.
//   In this case LZD gets overridden and eadj=0, when correct eadj=1.
//   This is accounted for by effectively subtracting 1 by not asserting cin.
// - If logical_sub and 00.1X, followed by Rcout, then
//   Eint-Eadj+Rcout=Eint-1+1=Eint
// ------------------------------------

fgu_fpe_dp_inv_macro__stack_32l__width_8 inv_eadj  (
  .din ({enoinc_i1_fx5_, ma_fmt_sel_fx5[0], fic_norm_eadj_fx5[5:0] }),
  .dout({enoinc_i1_fx5,  einty_adj_cin_fx5,          eadj_fx5_[5:0]})
  );

fgu_fpe_dp_cla_macro__width_12 einty_adj  (
  .din0({1'b0,      einty_fx5[10:0]}),
  .din1({6'b111111, eadj_fx5_[5:0] }),
  .cin ( einty_adj_cin_fx5          ),
  .dout({einty_adj_unused, einty_adj_fx5[10:0]}),
  .cout( fpe_einty_adj_cout_fx5     )
  );

// ------------------------------------
// Einty=Eadj
// ------------------------------------

fgu_fpe_dp_cmp_macro__width_12 cmp_exp  (
  .din0({6'b0, fic_norm_eadj_fx5[5:1], cmp_exp_eadj[0]}),  // [0] must acct for logical_sub and 00.1X case
  .din1({1'b0, einty_fx5[10:0]                        }),
  .dout(fpe_einty_eq_eadj_fx5                          )
  );

// exp_noinc_sel_fx5 =
//   (logical_sub 00.1X &
//    Rinc output selected &
//    Rinc output format 01.XX) |  // since 00.1X first gets normalized, actually check for Rcout
//   fmul instr

fgu_fpe_dp_nand_macro__ports_2__stack_32l__width_2 enoinc  (
  .din0({ma_fmt_sel_fx5[0], eadj_fx5_[0]     }),
  .din1({fpc_rinc_sel_fx5,  einty_adj_cin_fx5}),
  .dout({enoinc_i1_fx5_,    cmp_exp_eadj[0]  })
  );

fgu_fpe_dp_inv_macro__stack_32l__width_2 inv_einc  (
  .din ({i_exp_inc_sel_fx5,  fpc_exp_sel_mul_fx5 }),
  .dout({i_exp_inc_sel_fx5_, fpc_exp_sel_mul_fx5_})
  );

fgu_fpe_dp_nand_macro__dnand_8x__ports_2__stack_32l__width_4 einc  (
  .din0({fpc_q_rinc_sel_fx5, einc_i0_fx5,        enoinc_i1_fx5, einc_i1_fx5         }),  // fpc_q_rinc_sel_fx5 <= Rinc output selected & ~(logical_sub 00.1X)
  .din1({fpf_rcout_fx5,      i_exp_inc_sel_fx5_, fpf_rcout_fx5, fpc_exp_sel_mul_fx5_}),
  .dout({einc_i0_fx5,        exp_inc_sel_fx5,    einc_i1_fx5,   exp_noinc_sel_fx5   })
  );

// ------------------------------------
// Eres
// ------------------------------------

fgu_fpe_dp_mux_macro__mux_aope__ports_3__stack_32l__width_11 einty_mux  (
  .din0(einty_inc_fx5[10:0]),
  .din1(einty_fx5[10:0]    ),
  .din2(einty_adj_fx5[10:0]),
  .sel0(exp_inc_sel_fx5),
  .sel1(exp_noinc_sel_fx5),
  .dout(exp_res_fx5[10:0])
  );

// ----------------------------------------------------------------------------
//                               FB stage
// ----------------------------------------------------------------------------

fgu_fpe_dp_msff_macro__stack_32l__width_11 fb_exp_res  (
  .scan_in(fb_exp_res_scanin),
  .scan_out(fb_exp_res_scanout),
  .clk (l2clk),
  .en  (main_clken),
  .din (    exp_res_fx5[10:0]),
  .dout(fpe_exp_res_fb[10:0] ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
  );



// fixscan start:
assign fx1_fmtsel_scanin         = scan_in                  ;
assign fx2_swp_sel_scanin        = fx1_fmtsel_scanout       ;
assign fx2_aux_scanin            = fx2_swp_sel_scanout      ;
assign fx3_einty_scanin          = fx2_aux_scanout          ;
assign fx4_einty_scanin          = fx3_einty_scanout        ;
assign fb_exp_res_scanin         = fx4_einty_scanout        ;
assign scan_out                  = fb_exp_res_scanout       ;
// fixscan end:
endmodule  // fgu_fpe_dp


//
//   buff macro
//
//





module fgu_fpe_dp_buff_macro__dbuff_32x__rep_1__stack_32l__width_4 (
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

module fgu_fpe_dp_msff_macro__stack_32l__width_18 (
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
wire [16:0] so;

  input [17:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [17:0] dout;


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
dff #(18)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[17:0]),
.si({scan_in,so[16:0]}),
.so({so[16:0],scan_out}),
.q(dout[17:0])
);




















endmodule









//
//   buff macro
//
//





module fgu_fpe_dp_buff_macro__dbuff_32x__stack_32l__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpe_dp_mux_macro__mux_pgpe__ports_8__stack_32l__width_11 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  sel4, 
  sel5, 
  sel6, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [10:0] din0;
  input [10:0] din1;
  input [10:0] din2;
  input [10:0] din3;
  input [10:0] din4;
  input [10:0] din5;
  input [10:0] din6;
  input [10:0] din7;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input sel5;
  input sel6;
  input muxtst;
  input test;
  output [10:0] dout;





cl_dp1_penc8_8x  c0_0 (
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .sel4(sel4),
 .sel5(sel5),
 .sel6(sel6),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7),
  .test(test)
);

mux8 #(11)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[10:0]),
  .in1(din1[10:0]),
  .in2(din2[10:0]),
  .in3(din3[10:0]),
  .in4(din4[10:0]),
  .in5(din5[10:0]),
  .in6(din6[10:0]),
  .in7(din7[10:0]),
.dout(dout[10:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpe_dp_mux_macro__mux_pgpe__ports_4__stack_32l__width_11 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel0, 
  sel1, 
  sel2, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [10:0] din0;
  input [10:0] din1;
  input [10:0] din2;
  input [10:0] din3;
  input sel0;
  input sel1;
  input sel2;
  input muxtst;
  input test;
  output [10:0] dout;





cl_dp1_penc4_8x  c0_0 (
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
  .test(test)
);

mux4 #(11)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[10:0]),
  .in1(din1[10:0]),
  .in2(din2[10:0]),
  .in3(din3[10:0]),
.dout(dout[10:0]),
  .muxtst(muxtst)
);









  



endmodule


//
//   invert macro
//
//





module fgu_fpe_dp_inv_macro__stack_32l__width_11 (
  din, 
  dout);
  input [10:0] din;
  output [10:0] dout;






inv #(11)  d0_0 (
.in(din[10:0]),
.out(dout[10:0])
);









endmodule





//
//   cla macro
//
//





module fgu_fpe_dp_cla_macro__width_12 (
  cin, 
  din0, 
  din1, 
  dout, 
  cout);
  input cin;
  input [11:0] din0;
  input [11:0] din1;
  output [11:0] dout;
  output cout;







cla #(12)  m0_0 (
.cin(cin),
.in0(din0[11:0]),
.in1(din1[11:0]),
.out(dout[11:0]),
.cout(cout)
);












endmodule









// any PARAMS parms go into naming of macro

module fgu_fpe_dp_msff_macro__mux_aonpe__ports_2__stack_32l__width_22 (
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
wire [21:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [20:0] so;

  input [21:0] din0;
  input sel0;
  input [21:0] din1;
  input sel1;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [21:0] dout;


  output scan_out;




cl_dp1_muxbuff2_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(22)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[21:0]),
  .in1(din1[21:0]),
.dout(muxout[21:0])
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
dff #(22)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[21:0]),
.si({scan_in,so[20:0]}),
.so({so[20:0],scan_out}),
.q(dout[21:0])
);




















endmodule









//
//   invert macro
//
//





module fgu_fpe_dp_inv_macro__stack_32l__width_21 (
  din, 
  dout);
  input [20:0] din;
  output [20:0] dout;






inv #(21)  d0_0 (
.in(din[20:0]),
.out(dout[20:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpe_dp_mux_macro__mux_pgpe__ports_7__stack_32l__width_11 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  sel4, 
  sel5, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;

  input [10:0] din0;
  input [10:0] din1;
  input [10:0] din2;
  input [10:0] din3;
  input [10:0] din4;
  input [10:0] din5;
  input [10:0] din6;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input sel5;
  input muxtst;
  input test;
  output [10:0] dout;





cl_dp1_penc7_8x  c0_0 (
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .sel4(sel4),
 .sel5(sel5),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
  .test(test)
);

mux7 #(11)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .in0(din0[10:0]),
  .in1(din1[10:0]),
  .in2(din2[10:0]),
  .in3(din3[10:0]),
  .in4(din4[10:0]),
  .in5(din5[10:0]),
  .in6(din6[10:0]),
.dout(dout[10:0]),
  .muxtst(muxtst)
);









  



endmodule


//
//   buff macro
//
//





module fgu_fpe_dp_buff_macro__width_12 (
  din, 
  dout);
  input [11:0] din;
  output [11:0] dout;






buff #(12)  d0_0 (
.in(din[11:0]),
.out(dout[11:0])
);








endmodule









// any PARAMS parms go into naming of macro

module fgu_fpe_dp_msff_macro__stack_32l__width_11 (
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
wire [9:0] so;

  input [10:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [10:0] dout;


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
dff #(11)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[10:0]),
.si({scan_in,so[9:0]}),
.so({so[9:0],scan_out}),
.q(dout[10:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpe_dp_mux_macro__mux_aope__ports_5__stack_32l__width_11 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;

  input [10:0] din0;
  input [10:0] din1;
  input [10:0] din2;
  input [10:0] din3;
  input [10:0] din4;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  output [10:0] dout;





cl_dp1_penc5_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4)
);

mux5s #(11)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .in0(din0[10:0]),
  .in1(din1[10:0]),
  .in2(din2[10:0]),
  .in3(din3[10:0]),
  .in4(din4[10:0]),
.dout(dout[10:0])
);









  



endmodule


//
//   invert macro
//
//





module fgu_fpe_dp_inv_macro__stack_32l__width_6 (
  din, 
  dout);
  input [5:0] din;
  output [5:0] dout;






inv #(6)  d0_0 (
.in(din[5:0]),
.out(dout[5:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpe_dp_mux_macro__mux_aope__ports_4__stack_32l__width_12 (
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

  input [11:0] din0;
  input [11:0] din1;
  input [11:0] din2;
  input [11:0] din3;
  input sel0;
  input sel1;
  input sel2;
  output [11:0] dout;





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

mux4s #(12)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[11:0]),
  .in1(din1[11:0]),
  .in2(din2[11:0]),
  .in3(din3[11:0]),
.dout(dout[11:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module fgu_fpe_dp_msff_macro__stack_32l__width_24 (
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
wire [22:0] so;

  input [23:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [23:0] dout;


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
dff #(24)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[23:0]),
.si({scan_in,so[22:0]}),
.so({so[22:0],scan_out}),
.q(dout[23:0])
);




















endmodule









//
//   increment macro 
//
//





module fgu_fpe_dp_increment_macro__width_12 (
  din, 
  cin, 
  dout, 
  cout);
  input [11:0] din;
  input cin;
  output [11:0] dout;
  output cout;






incr #(12)  m0_0 (
.cin(cin),
.in(din[11:0]),
.out(dout[11:0]),
.cout(cout)
);











endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpe_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_32l__width_1 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [0:0] din0;
  input sel0;
  input [0:0] din1;
  input sel1;
  output [0:0] dout;





mux2s #(1)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[0:0]),
  .in1(din1[0:0]),
.dout(dout[0:0])
);









  



endmodule


//
//   invert macro
//
//





module fgu_fpe_dp_inv_macro__stack_32l__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






inv #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);









endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module fgu_fpe_dp_cmp_macro__width_12 (
  din0, 
  din1, 
  dout);
  input [11:0] din0;
  input [11:0] din1;
  output dout;






cmp #(12)  m0_0 (
.in0(din0[11:0]),
.in1(din1[11:0]),
.out(dout)
);










endmodule





//
//   nand macro for ports = 2,3,4
//
//





module fgu_fpe_dp_nand_macro__ports_2__stack_32l__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






nand2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule





//
//   invert macro
//
//





module fgu_fpe_dp_inv_macro__stack_32l__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






inv #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module fgu_fpe_dp_nand_macro__dnand_8x__ports_2__stack_32l__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






nand2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpe_dp_mux_macro__mux_aope__ports_3__stack_32l__width_11 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [10:0] din0;
  input [10:0] din1;
  input [10:0] din2;
  input sel0;
  input sel1;
  output [10:0] dout;





cl_dp1_penc3_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(11)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[10:0]),
  .in1(din1[10:0]),
  .in2(din2[10:0]),
.dout(dout[10:0])
);









  



endmodule

