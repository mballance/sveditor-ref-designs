// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_ibu_ibf_dp.v
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
module  ifu_ibu_ibf_dp (
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  pku_pick_p, 
  ftu_instr_0_c, 
  ftu_instr_1_c, 
  ftu_instr_2_c, 
  ftu_instr_3_c, 
  ftu_instr_0_exceptions_c, 
  ftu_instr_1_exceptions_c, 
  ftu_instr_2_exceptions_c, 
  ftu_instr_3_exceptions_c, 
  ftu_ic_no_err_c, 
  ibq_buff_clken, 
  ibq_ctl_clken, 
  ibq_buf0_sel_inst0_pick, 
  ibq_buf0_sel_inst1_pick, 
  ibq_buf0_sel_inst2_pick, 
  ibq_buf0_sel_inst3_pick, 
  ibq_buf0_sel_inst0_pick_, 
  ibq_buf0_sel_inst1_pick_, 
  ibq_buf0_sel_inst2_pick_, 
  ibq_buf0_sel_inst3_pick_, 
  ibq_buf0_sel_buf1, 
  ibq_buf0_sel_buf2, 
  ibq_buf0_sel_buf3, 
  ibq_buf0_sel_buf4, 
  ibq_buf0_sel_buf5, 
  ibq_buf0_sel_buf6, 
  ibq_buf0_sel_buf7, 
  ibq_buf0_sel_hold_pick, 
  ibq_buf0_sel_hold_pick_, 
  ibq_buf0_sel_buf1to7_pick, 
  ibq_buf0_sel_buf1to7_pick_, 
  ibq_buf1_sel_inst0, 
  ibq_buf1_sel_inst1, 
  ibq_buf1_sel_inst2, 
  ibq_buf1_sel_inst3, 
  ibq_buf1_sel_hold, 
  ibq_buf2_sel_inst0, 
  ibq_buf2_sel_inst1, 
  ibq_buf2_sel_inst2, 
  ibq_buf2_sel_inst3, 
  ibq_buf2_sel_hold, 
  ibq_buf3_sel_inst0, 
  ibq_buf3_sel_inst1, 
  ibq_buf3_sel_inst2, 
  ibq_buf3_sel_inst3, 
  ibq_buf3_sel_hold, 
  ibq_buf4_sel_inst0, 
  ibq_buf4_sel_inst1, 
  ibq_buf4_sel_inst2, 
  ibq_buf4_sel_inst3, 
  ibq_buf4_sel_hold, 
  ibq_buf5_sel_inst0, 
  ibq_buf5_sel_inst1, 
  ibq_buf5_sel_inst2, 
  ibq_buf5_sel_inst3, 
  ibq_buf5_sel_hold, 
  ibq_buf6_sel_inst0, 
  ibq_buf6_sel_inst1, 
  ibq_buf6_sel_inst2, 
  ibq_buf6_sel_inst3, 
  ibq_buf6_sel_hold, 
  ibq_buf7_sel_inst0, 
  ibq_buf7_sel_inst1, 
  ibq_buf7_sel_inst2, 
  ibq_buf7_sel_inst3, 
  ibq_buf7_sel_hold, 
  ifu_buf0_inst, 
  ifu_buf0_excp, 
  scan_out);
wire stop;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire [37:0] buf1_inst;
wire [37:0] buf2_inst;
wire [37:0] buf3_inst;
wire [37:0] buf4_inst;
wire [37:0] buf5_inst;
wire [37:0] buf6_inst;
wire [37:0] buf7_inst;
wire [37:0] buf0_in7to1;
wire pick0_;
wire pick1_;
wire pick2_;
wire buf0_sel_inst0_int0;
wire buf0_sel_inst1_int0;
wire buf0_sel_inst2_int0;
wire buf0_sel_inst3_int0;
wire buf0_sel_buf1to7_int0;
wire buf0_sel_hold_int0;
wire buf0_sel_inst0_int1;
wire buf0_sel_inst1_int1;
wire buf0_sel_inst2_int1;
wire buf0_sel_inst3_int1;
wire buf0_sel_buf1to7_int1;
wire buf0_sel_hold_int1;
wire buf0_sel_inst0;
wire buf0_sel_inst1;
wire buf0_sel_inst2;
wire buf0_sel_inst3;
wire buf0_sel_buf1to7;
wire buf0_sel_hold;
wire ic_no_err_c_buf;
wire [4:0] instr_1_exceptions_c_mod;
wire [4:0] instr_2_exceptions_c_mod;
wire [4:0] instr_3_exceptions_c_mod;
wire [37:0] buf0_in;
wire [37:0] buf1_in;
wire [37:0] buf2_in;
wire [37:0] buf3_in;
wire [37:0] buf4_in;
wire [37:0] buf5_in;
wire [37:0] buf6_in;
wire [37:0] buf7_in;
wire buf0_ff_scanin;
wire buf0_ff_scanout;
wire buf1_ff_scanin;
wire buf1_ff_scanout;
wire buf2_ff_scanin;
wire buf2_ff_scanout;
wire buf3_ff_scanin;
wire buf3_ff_scanout;
wire buf4_ff_scanin;
wire buf4_ff_scanout;
wire buf5_ff_scanin;
wire buf5_ff_scanout;
wire buf6_ff_scanin;
wire buf6_ff_scanout;
wire buf7_ff_scanin;
wire buf7_ff_scanout;


input tcu_scan_en ;
   input        l2clk ;
   input 	scan_in;
   input 	tcu_pce_ov;		// scan signals
   input 	spc_aclk;
   input 	spc_bclk;

   input        pku_pick_p;

   input [32:0] ftu_instr_0_c;
   input [32:0] ftu_instr_1_c;
   input [32:0] ftu_instr_2_c;
   input [32:0] ftu_instr_3_c;
   input  [4:0] ftu_instr_0_exceptions_c;
   input  [4:0] ftu_instr_1_exceptions_c;
   input  [4:0] ftu_instr_2_exceptions_c;
   input  [4:0] ftu_instr_3_exceptions_c;

   input        ftu_ic_no_err_c;

   input        ibq_buff_clken;
   input        ibq_ctl_clken     ;

   input        ibq_buf0_sel_inst0_pick ;
   input        ibq_buf0_sel_inst1_pick ;
   input        ibq_buf0_sel_inst2_pick ;
   input        ibq_buf0_sel_inst3_pick ;
   input        ibq_buf0_sel_inst0_pick_;
   input        ibq_buf0_sel_inst1_pick_;
   input        ibq_buf0_sel_inst2_pick_;
   input        ibq_buf0_sel_inst3_pick_;
   input        ibq_buf0_sel_buf1  ;
   input        ibq_buf0_sel_buf2  ;
   input        ibq_buf0_sel_buf3  ;
   input        ibq_buf0_sel_buf4  ;
   input        ibq_buf0_sel_buf5  ;
   input        ibq_buf0_sel_buf6  ;
   input        ibq_buf0_sel_buf7  ;
   input        ibq_buf0_sel_hold_pick  ;
   input        ibq_buf0_sel_hold_pick_ ;
         
   input        ibq_buf0_sel_buf1to7_pick;
   input        ibq_buf0_sel_buf1to7_pick_;
   
   input        ibq_buf1_sel_inst0 ;
   input        ibq_buf1_sel_inst1 ;
   input        ibq_buf1_sel_inst2 ;
   input        ibq_buf1_sel_inst3 ;
   input        ibq_buf1_sel_hold  ;
        
   input        ibq_buf2_sel_inst0 ;
   input        ibq_buf2_sel_inst1 ;
   input        ibq_buf2_sel_inst2 ;
   input        ibq_buf2_sel_inst3 ;
   input        ibq_buf2_sel_hold  ;
        
   input        ibq_buf3_sel_inst0 ;
   input        ibq_buf3_sel_inst1 ;
   input        ibq_buf3_sel_inst2 ;
   input        ibq_buf3_sel_inst3 ;
   input        ibq_buf3_sel_hold  ;
        
   input        ibq_buf4_sel_inst0 ;
   input        ibq_buf4_sel_inst1 ;
   input        ibq_buf4_sel_inst2 ;
   input        ibq_buf4_sel_inst3 ;
   input        ibq_buf4_sel_hold  ;
        
   input        ibq_buf5_sel_inst0 ;
   input        ibq_buf5_sel_inst1 ;
   input        ibq_buf5_sel_inst2 ;
   input        ibq_buf5_sel_inst3 ;
   input        ibq_buf5_sel_hold  ;
   
   input        ibq_buf6_sel_inst0 ;
   input        ibq_buf6_sel_inst1 ;
   input        ibq_buf6_sel_inst2 ;
   input        ibq_buf6_sel_inst3 ;
   input        ibq_buf6_sel_hold  ;
   
   input        ibq_buf7_sel_inst0 ;
   input        ibq_buf7_sel_inst1 ;
   input        ibq_buf7_sel_inst2 ;
   input        ibq_buf7_sel_inst3 ;
   input        ibq_buf7_sel_hold  ;
        
   output[32:0] ifu_buf0_inst      ;
   output[4:0]  ifu_buf0_excp      ;
   output 	scan_out;

// scan renames
// assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
// assign siclk = spc_aclk;
// assign soclk = spc_bclk;
// end scan

 ifu_ibu_ibf_dp_buff_macro__dbuff_32x__stack_none__width_4 test_rep0  (
  .din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk}),
  .dout({se,pce_ov,siclk,soclk})
);



   ///////////////////////////////////////////////////////////
   // Muxing for each buffer                                //
   ///////////////////////////////////////////////////////////

   // mux types can be decided later based on area/timing.  Can also use other types of logic (i.e. and/or)
   ifu_ibu_ibf_dp_mux_macro__mux_aonpe__ports_7__stack_38c__width_38 buf0_muxa  (
     .din0(buf1_inst[37:0]), 
     .din1(buf2_inst[37:0]),  
     .din2(buf3_inst[37:0]),  
     .din3(buf4_inst[37:0]), 
     .din4(buf5_inst[37:0]),  
     .din5(buf6_inst[37:0]),  
     .din6(buf7_inst[37:0]),  
     .sel0(ibq_buf0_sel_buf1),
     .sel1(ibq_buf0_sel_buf2),
     .sel2(ibq_buf0_sel_buf3),
     .sel3(ibq_buf0_sel_buf4),
     .sel4(ibq_buf0_sel_buf5),
     .sel5(ibq_buf0_sel_buf6),
     .sel6(ibq_buf0_sel_buf7),
     .dout(buf0_in7to1[37:0])
   );

   ///////////////////////////////////////////////////////////////////
   // Selects for buf0.                                             //
   ///////////////////////////////////////////////////////////////////
   ifu_ibu_ibf_dp_inv_macro__dinv_12x__width_3  pick_inv   (
      .din ({3{pku_pick_p}}),
      .dout({pick0_,pick1_,pick2_}));

   ifu_ibu_ibf_dp_nand_macro__dnand_20x__width_6 ibuf0_sel0_n0   (
     .din0 ({6{pku_pick_p}}),
     .din1 ({ibq_buf0_sel_inst0_pick,ibq_buf0_sel_inst1_pick,ibq_buf0_sel_inst2_pick,
             ibq_buf0_sel_inst3_pick,ibq_buf0_sel_buf1to7_pick,ibq_buf0_sel_hold_pick}),
     .dout ({buf0_sel_inst0_int0,buf0_sel_inst1_int0,buf0_sel_inst2_int0,
             buf0_sel_inst3_int0,buf0_sel_buf1to7_int0,buf0_sel_hold_int0})) ;

   ifu_ibu_ibf_dp_nand_macro__dnand_20x__width_6 ibuf0_sel0_n1   (
     .din0 ({2{pick0_,pick1_,pick2_}}),
     .din1 ({ibq_buf0_sel_inst0_pick_,ibq_buf0_sel_inst1_pick_,ibq_buf0_sel_inst2_pick_,
             ibq_buf0_sel_inst3_pick_,ibq_buf0_sel_buf1to7_pick_,ibq_buf0_sel_hold_pick_}),
     .dout ({buf0_sel_inst0_int1,buf0_sel_inst1_int1,buf0_sel_inst2_int1,
             buf0_sel_inst3_int1,buf0_sel_buf1to7_int1,buf0_sel_hold_int1})) ;

   ifu_ibu_ibf_dp_nand_macro__dnand_32x__width_6 ibuf0_sel0_n2   (
     .din0 ({buf0_sel_inst0_int1,buf0_sel_inst1_int1,buf0_sel_inst2_int1,
             buf0_sel_inst3_int1,buf0_sel_buf1to7_int1,buf0_sel_hold_int1}),
     .din1 ({buf0_sel_inst0_int0,buf0_sel_inst1_int0,buf0_sel_inst2_int0,
             buf0_sel_inst3_int0,buf0_sel_buf1to7_int0,buf0_sel_hold_int0}),
     .dout ({buf0_sel_inst0,buf0_sel_inst1,buf0_sel_inst2,
             buf0_sel_inst3,buf0_sel_buf1to7,buf0_sel_hold})) ;

   ////////////////////////////////////////////////////////////////////
   // Zero out the exception bits when in Ic by-pass mode and no_err //
   // This is done to avoid the PMU counting cache-misses and other  //
   // info more than once. I.e only one instruction should be marked //
   // NOTE: we can not do that when there are errors becuse we need  //  
   // to have at least two instruction marked just in case one of    //   
   // is annulled.                                                   //
   ////////////////////////////////////////////////////////////////////
   
   ifu_ibu_ibf_dp_buff_macro__dbuff_32x__stack_none__width_1 ic_no_err_buff  (
    .din (ftu_ic_no_err_c),
    .dout(ic_no_err_c_buf)
   );

   ifu_ibu_ibf_dp_and_macro__dnand_32x__width_5 except_1_and    (
     .din1 ({5{ic_no_err_c_buf}}),
     .din0 ( ftu_instr_1_exceptions_c[4:0]),
     .dout ( instr_1_exceptions_c_mod[4:0]));


   ifu_ibu_ibf_dp_and_macro__dnand_32x__width_5 except_2_and    (
     .din1 ({5{ic_no_err_c_buf}}),
     .din0 ( ftu_instr_2_exceptions_c[4:0]),
     .dout ( instr_2_exceptions_c_mod[4:0]));


   ifu_ibu_ibf_dp_and_macro__dnand_32x__width_5 except_3_and    (
     .din1 ({5{ic_no_err_c_buf}}),
     .din0 ( ftu_instr_3_exceptions_c[4:0]),
     .dout ( instr_3_exceptions_c_mod[4:0]));


   ///////////////////////////////////////////////////////////////////
   // Changed this mux to 7x1 because the instructions are no longer//
   // ordered and we do not know which one the first instruction is //
   //								    //
   ///////////////////////////////////////////////////////////////////
   
   ifu_ibu_ibf_dp_mux_macro__buffsel_none__mux_aonpe__ports_6__stack_38c__width_38 buf0_muxb  (
     .din0({ftu_instr_0_exceptions_c[4:0],ftu_instr_0_c[32:0]}),  
     .din1({instr_1_exceptions_c_mod[4:0],ftu_instr_1_c[32:0]}),  
     .din2({instr_2_exceptions_c_mod[4:0],ftu_instr_2_c[32:0]}),  
     .din3({instr_3_exceptions_c_mod[4:0],ftu_instr_3_c[32:0]}),  
     .din4(buf0_in7to1[37:0]),  
     .din5({ifu_buf0_excp[4:0], ifu_buf0_inst[32:0]}), 
     .sel0(buf0_sel_inst0),
     .sel1(buf0_sel_inst1),
     .sel2(buf0_sel_inst2),
     .sel3(buf0_sel_inst3),
     .sel4(buf0_sel_buf1to7),
     .sel5(buf0_sel_hold),
     .dout(buf0_in[37:0])
   );

//    mux_macro buf0_muxc (width=38,ports=2,mux=aope,stack=38c) (
//      .din0(buf0_flush0[37:0]),
//      .din1({ifu_buf0_excp[4:0], ifu_buf0_inst[32:0]}),
//      .sel0(ibq_buf0_sel_hold),
//      .dout(buf0_in[37:0])
//    );


   ifu_ibu_ibf_dp_mux_macro__mux_aonpe__ports_5__stack_38c__width_38 buf1_mux  (
     .din0({ftu_instr_0_exceptions_c[4:0],ftu_instr_0_c[32:0]}),  
     .din1({instr_1_exceptions_c_mod[4:0],ftu_instr_1_c[32:0]}), 
     .din2({instr_2_exceptions_c_mod[4:0],ftu_instr_2_c[32:0]}), 
     .din3({instr_3_exceptions_c_mod[4:0],ftu_instr_3_c[32:0]}), 
     .din4(buf1_inst[37:0]), 
     .sel0(ibq_buf1_sel_inst0),
     .sel1(ibq_buf1_sel_inst1),
     .sel2(ibq_buf1_sel_inst2),
     .sel3(ibq_buf1_sel_inst3),
     .sel4(ibq_buf1_sel_hold),
     .dout(buf1_in[37:0])
   );

   ifu_ibu_ibf_dp_mux_macro__mux_aonpe__ports_5__stack_38c__width_38 buf2_mux  (
     .din0({ftu_instr_0_exceptions_c[4:0],ftu_instr_0_c[32:0]}),  
     .din1({instr_1_exceptions_c_mod[4:0],ftu_instr_1_c[32:0]}), 
     .din2({instr_2_exceptions_c_mod[4:0],ftu_instr_2_c[32:0]}), 
     .din3({instr_3_exceptions_c_mod[4:0],ftu_instr_3_c[32:0]}), 
     .din4(buf2_inst[37:0]), 
     .sel0(ibq_buf2_sel_inst0),
     .sel1(ibq_buf2_sel_inst1),
     .sel2(ibq_buf2_sel_inst2),
     .sel3(ibq_buf2_sel_inst3),
     .sel4(ibq_buf2_sel_hold),
     .dout(buf2_in[37:0])
   );

   ifu_ibu_ibf_dp_mux_macro__mux_aonpe__ports_5__stack_38c__width_38 buf3_mux  (
     .din0({ftu_instr_0_exceptions_c[4:0],ftu_instr_0_c[32:0]}),  
     .din1({instr_1_exceptions_c_mod[4:0],ftu_instr_1_c[32:0]}), 
     .din2({instr_2_exceptions_c_mod[4:0],ftu_instr_2_c[32:0]}), 
     .din3({instr_3_exceptions_c_mod[4:0],ftu_instr_3_c[32:0]}), 
     .din4(buf3_inst[37:0]), 
     .sel0(ibq_buf3_sel_inst0),
     .sel1(ibq_buf3_sel_inst1),
     .sel2(ibq_buf3_sel_inst2),
     .sel3(ibq_buf3_sel_inst3),
     .sel4(ibq_buf3_sel_hold),
     .dout(buf3_in[37:0])
   );

   ifu_ibu_ibf_dp_mux_macro__mux_aonpe__ports_5__stack_38c__width_38 buf4_mux  (
     .din0({ftu_instr_0_exceptions_c[4:0],ftu_instr_0_c[32:0]}),  
     .din1({instr_1_exceptions_c_mod[4:0],ftu_instr_1_c[32:0]}), 
     .din2({instr_2_exceptions_c_mod[4:0],ftu_instr_2_c[32:0]}), 
     .din3({instr_3_exceptions_c_mod[4:0],ftu_instr_3_c[32:0]}), 
     .din4(buf4_inst[37:0]), 
     .sel0(ibq_buf4_sel_inst0),
     .sel1(ibq_buf4_sel_inst1),
     .sel2(ibq_buf4_sel_inst2),
     .sel3(ibq_buf4_sel_inst3),
     .sel4(ibq_buf4_sel_hold),
     .dout(buf4_in[37:0])
   );

   ifu_ibu_ibf_dp_mux_macro__mux_aonpe__ports_5__stack_38c__width_38 buf5_mux  (
     .din0({ftu_instr_0_exceptions_c[4:0],ftu_instr_0_c[32:0]}),  
     .din1({instr_1_exceptions_c_mod[4:0],ftu_instr_1_c[32:0]}), 
     .din2({instr_2_exceptions_c_mod[4:0],ftu_instr_2_c[32:0]}), 
     .din3({instr_3_exceptions_c_mod[4:0],ftu_instr_3_c[32:0]}), 
     .din4(buf5_inst[37:0]), 
     .sel0(ibq_buf5_sel_inst0),
     .sel1(ibq_buf5_sel_inst1),
     .sel2(ibq_buf5_sel_inst2),
     .sel3(ibq_buf5_sel_inst3),
     .sel4(ibq_buf5_sel_hold),
     .dout(buf5_in[37:0])
   );

   ifu_ibu_ibf_dp_mux_macro__mux_aonpe__ports_5__stack_38c__width_38 buf6_mux  (
     .din0({ftu_instr_0_exceptions_c[4:0],ftu_instr_0_c[32:0]}),  
     .din1({instr_1_exceptions_c_mod[4:0],ftu_instr_1_c[32:0]}), 
     .din2({instr_2_exceptions_c_mod[4:0],ftu_instr_2_c[32:0]}), 
     .din3({instr_3_exceptions_c_mod[4:0],ftu_instr_3_c[32:0]}), 
     .din4(buf6_inst[37:0]), 
     .sel0(ibq_buf6_sel_inst0),
     .sel1(ibq_buf6_sel_inst1),
     .sel2(ibq_buf6_sel_inst2),
     .sel3(ibq_buf6_sel_inst3),
     .sel4(ibq_buf6_sel_hold),
     .dout(buf6_in[37:0])
   );

   ifu_ibu_ibf_dp_mux_macro__mux_aonpe__ports_5__stack_38c__width_38 buf7_mux  (
     .din0({ftu_instr_0_exceptions_c[4:0],ftu_instr_0_c[32:0]}),  
     .din1({instr_1_exceptions_c_mod[4:0],ftu_instr_1_c[32:0]}), 
     .din2({instr_2_exceptions_c_mod[4:0],ftu_instr_2_c[32:0]}), 
     .din3({instr_3_exceptions_c_mod[4:0],ftu_instr_3_c[32:0]}), 
     .din4(buf7_inst[37:0]), 
     .sel0(ibq_buf7_sel_inst0),
     .sel1(ibq_buf7_sel_inst1),
     .sel2(ibq_buf7_sel_inst2),
     .sel3(ibq_buf7_sel_inst3),
     .sel4(ibq_buf7_sel_hold),
     .dout(buf7_in[37:0])
   );


   ///////////////////////////////////////////////////////////
   // Flops for the buffers                                 //
   ///////////////////////////////////////////////////////////

   ifu_ibu_ibf_dp_msff_macro__dmsff_32x__stack_38c__width_38 buf0_ff   (
    .scan_in(buf0_ff_scanin),
    .scan_out(buf0_ff_scanout),
    .clk(l2clk),
    .din  (buf0_in[37:0]),
    .en   (ibq_ctl_clken),
    .dout ({ifu_buf0_excp[4:0],ifu_buf0_inst[32:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
   );

   ifu_ibu_ibf_dp_msff_macro__stack_38c__width_38 buf1_ff   (
    .scan_in(buf1_ff_scanin),
    .scan_out(buf1_ff_scanout),
    .clk(l2clk),
    .din  (buf1_in[37:0]),
    .en   (ibq_buff_clken),
    .dout (buf1_inst[37:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
   );

   ifu_ibu_ibf_dp_msff_macro__stack_38c__width_38 buf2_ff   (
    .scan_in(buf2_ff_scanin),
    .scan_out(buf2_ff_scanout),
    .clk(l2clk),
    .din  (buf2_in[37:0]),
    .en   (ibq_buff_clken),
    .dout (buf2_inst[37:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
   );
   ifu_ibu_ibf_dp_msff_macro__stack_38c__width_38 buf3_ff   (
    .scan_in(buf3_ff_scanin),
    .scan_out(buf3_ff_scanout),
    .clk(l2clk),
    .din  (buf3_in[37:0]),
    .en   (ibq_buff_clken),
    .dout (buf3_inst[37:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
   );
   ifu_ibu_ibf_dp_msff_macro__stack_38c__width_38 buf4_ff   (
    .scan_in(buf4_ff_scanin),
    .scan_out(buf4_ff_scanout),
    .clk(l2clk),
    .din  (buf4_in[37:0]),
    .en   (ibq_buff_clken),
    .dout (buf4_inst[37:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
   );
   ifu_ibu_ibf_dp_msff_macro__stack_38c__width_38 buf5_ff   (
    .scan_in(buf5_ff_scanin),
    .scan_out(buf5_ff_scanout),
    .clk(l2clk),
    .din  (buf5_in[37:0]),
    .en   (ibq_buff_clken),
    .dout (buf5_inst[37:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
   );
   ifu_ibu_ibf_dp_msff_macro__stack_38c__width_38 buf6_ff   (
    .scan_in(buf6_ff_scanin),
    .scan_out(buf6_ff_scanout),
    .clk(l2clk),
    .din  (buf6_in[37:0]),
    .en   (ibq_buff_clken),
    .dout (buf6_inst[37:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
   );
   ifu_ibu_ibf_dp_msff_macro__stack_38c__width_38 buf7_ff   (
    .scan_in(buf7_ff_scanin),
    .scan_out(buf7_ff_scanout),
    .clk(l2clk),
    .din  (buf7_in[37:0]),
    .en   (ibq_buff_clken),
    .dout (buf7_inst[37:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
   );

// fixscan start:
assign buf0_ff_scanin            = scan_in                  ;
assign buf1_ff_scanin            = buf0_ff_scanout          ;
assign buf2_ff_scanin            = buf1_ff_scanout          ;
assign buf3_ff_scanin            = buf2_ff_scanout          ;
assign buf4_ff_scanin            = buf3_ff_scanout          ;
assign buf5_ff_scanin            = buf4_ff_scanout          ;
assign buf6_ff_scanin            = buf5_ff_scanout          ;
assign buf7_ff_scanin            = buf6_ff_scanout          ;
assign scan_out                  = buf7_ff_scanout          ;
// fixscan end:
// assign se = tcu_scan_en ;
endmodule



//
//   buff macro
//
//





module ifu_ibu_ibf_dp_buff_macro__dbuff_32x__stack_none__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ibu_ibf_dp_mux_macro__mux_aonpe__ports_7__stack_38c__width_38 (
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
  din5, 
  sel5, 
  din6, 
  sel6, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;

  input [37:0] din0;
  input sel0;
  input [37:0] din1;
  input sel1;
  input [37:0] din2;
  input sel2;
  input [37:0] din3;
  input sel3;
  input [37:0] din4;
  input sel4;
  input [37:0] din5;
  input sel5;
  input [37:0] din6;
  input sel6;
  output [37:0] dout;





cl_dp1_muxbuff7_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .in6(sel6),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5),
 .out6(buffout6)
);
mux7s #(38)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .in0(din0[37:0]),
  .in1(din1[37:0]),
  .in2(din2[37:0]),
  .in3(din3[37:0]),
  .in4(din4[37:0]),
  .in5(din5[37:0]),
  .in6(din6[37:0]),
.dout(dout[37:0])
);









  



endmodule


//
//   invert macro
//
//





module ifu_ibu_ibf_dp_inv_macro__dinv_12x__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






inv #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ifu_ibu_ibf_dp_nand_macro__dnand_20x__width_6 (
  din0, 
  din1, 
  dout);
  input [5:0] din0;
  input [5:0] din1;
  output [5:0] dout;






nand2 #(6)  d0_0 (
.in0(din0[5:0]),
.in1(din1[5:0]),
.out(dout[5:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module ifu_ibu_ibf_dp_nand_macro__dnand_32x__width_6 (
  din0, 
  din1, 
  dout);
  input [5:0] din0;
  input [5:0] din1;
  output [5:0] dout;






nand2 #(6)  d0_0 (
.in0(din0[5:0]),
.in1(din1[5:0]),
.out(dout[5:0])
);









endmodule





//
//   buff macro
//
//





module ifu_ibu_ibf_dp_buff_macro__dbuff_32x__stack_none__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





//  
//   and macro for ports = 2,3,4
//
//





module ifu_ibu_ibf_dp_and_macro__dnand_32x__width_5 (
  din0, 
  din1, 
  dout);
  input [4:0] din0;
  input [4:0] din1;
  output [4:0] dout;






and2 #(5)  d0_0 (
.in0(din0[4:0]),
.in1(din1[4:0]),
.out(dout[4:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ibu_ibf_dp_mux_macro__buffsel_none__mux_aonpe__ports_6__stack_38c__width_38 (
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
  din5, 
  sel5, 
  dout);
  input [37:0] din0;
  input sel0;
  input [37:0] din1;
  input sel1;
  input [37:0] din2;
  input sel2;
  input [37:0] din3;
  input sel3;
  input [37:0] din4;
  input sel4;
  input [37:0] din5;
  input sel5;
  output [37:0] dout;





mux6s #(38)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .sel2(sel2),
  .sel3(sel3),
  .sel4(sel4),
  .sel5(sel5),
  .in0(din0[37:0]),
  .in1(din1[37:0]),
  .in2(din2[37:0]),
  .in3(din3[37:0]),
  .in4(din4[37:0]),
  .in5(din5[37:0]),
.dout(dout[37:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ibu_ibf_dp_mux_macro__mux_aonpe__ports_5__stack_38c__width_38 (
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

  input [37:0] din0;
  input sel0;
  input [37:0] din1;
  input sel1;
  input [37:0] din2;
  input sel2;
  input [37:0] din3;
  input sel3;
  input [37:0] din4;
  input sel4;
  output [37:0] dout;





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
mux5s #(38)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .in0(din0[37:0]),
  .in1(din1[37:0]),
  .in2(din2[37:0]),
  .in3(din3[37:0]),
  .in4(din4[37:0]),
.dout(dout[37:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module ifu_ibu_ibf_dp_msff_macro__dmsff_32x__stack_38c__width_38 (
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
wire [36:0] so;

  input [37:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [37:0] dout;


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
dff #(38)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[37:0]),
.si({scan_in,so[36:0]}),
.so({so[36:0],scan_out}),
.q(dout[37:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module ifu_ibu_ibf_dp_msff_macro__stack_38c__width_38 (
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
wire [36:0] so;

  input [37:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [37:0] dout;


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
dff #(38)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[37:0]),
.si({scan_in,so[36:0]}),
.so({so[36:0],scan_out}),
.q(dout[37:0])
);




















endmodule








