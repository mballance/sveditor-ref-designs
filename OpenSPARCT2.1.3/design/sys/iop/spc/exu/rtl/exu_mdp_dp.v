// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: exu_mdp_dp.v
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
module exu_mdp_dp (
  tcu_dectest, 
  tcu_muxtest, 
  dec_fgu_sel_e, 
  dec_fgu_sel_m, 
  dec_lsu_sel0_e, 
  dec_lsu_sel1_e, 
  dec_rs1_addr0_e, 
  dec_rs1_addr1_e, 
  dec_lsu_sel0_lower_e, 
  dec_lsu_sel1_lower_e, 
  dec_lsu_sel0_upper_e, 
  dec_lsu_sel1_upper_e, 
  dec_rs1_addr0_upper_e, 
  dec_rs1_addr1_upper_e, 
  exu0_mdp_mux_sel_e, 
  exu1_mdp_mux_sel_e, 
  exu_ms_icc0_e, 
  exu_ms_icc1_e, 
  exu_rs1_data0_e, 
  exu_rs1_data1_e, 
  exu_rs2_data0_e, 
  exu_rs2_data1_e, 
  exu_y_data0_e, 
  exu_y_data1_e, 
  exu_address0_e, 
  exu_address1_e, 
  exu_store_data0_e, 
  exu_store_data1_e, 
  exu_ecc_winop_flush_m, 
  exu_gsr_data0_m, 
  exu_gsr_data1_m, 
  exu_gsr_vld0_m, 
  exu_gsr_vld1_m, 
  exu_cmov_true_m, 
  lsu_exu_address_e, 
  lsu_sel_lsu_addr_e, 
  exu_fgu_rs1_e, 
  exu_fgu_rs2_e, 
  exu_fgu_gsr_m, 
  exu_fgu_gsr_vld_m, 
  exu_fgu_flush_m, 
  exu_fgu_fmov_vld_m, 
  exu_lsu_address_e, 
  exu_lsu_store_data_e, 
  exu_lsu_rs2_e);
wire test;
wire exu_rs1_data0_b31;
wire exu_rs2_data0_b31;
wire exu_rs1_data1_b31;
wire exu_rs2_data1_b31;
wire [63:0] rs1_data0_early_mux;
wire [63:0] rs1_data0_early;
wire [63:0] rs1_data1_early;
wire [63:32] rs2_data0_early_mux;
wire [63:0] rs2_data0_early;
wire [63:0] rs2_data1_early;
wire [63:0] rs1_e;
wire [63:0] rs2_e;
wire fmov_vld_m;
wire flush_m;
wire [1:0] gsr_vld_m;
wire [31:0] gsr_m;
wire tcu_muxtest_rep0;
wire [63:0] store_data_e;


input		tcu_dectest;		// Passgate mux test control
input		tcu_muxtest;		// Passgate mux test control

input  [1:0]	dec_fgu_sel_e;		// mux select between TG's for fgu ops
input  [1:0]	dec_fgu_sel_m;		// mux select between TG's for fgu ops
   
input 		dec_lsu_sel0_e;		// TG0 address         -> address
input 		dec_lsu_sel1_e;		// TG1 address         -> address

input		dec_rs1_addr0_e;	// CASA only : TG0 RS1 -> address
input		dec_rs1_addr1_e;	// CASA only : TG1 RS1 -> address

input 		dec_lsu_sel0_lower_e;	// TG0 address         -> address 
input 		dec_lsu_sel1_lower_e;	// TG1 address         -> address 

input 		dec_lsu_sel0_upper_e;	// TG0 address         -> address (zero when pstate.am = 1, ie 32-bit addressing)
input 		dec_lsu_sel1_upper_e;	// TG1 address         -> address (zero when pstate.am = 1, ie 32-bit addressing)

input		dec_rs1_addr0_upper_e;	// CASA only : TG0 RS1 -> address (zero when pstate.am = 1, ie 32-bit addressing)
input		dec_rs1_addr1_upper_e;	// CASA only : TG1 RS1 -> address (zero when pstate.am = 1, ie 32-bit addressing)

input  [5:0]	exu0_mdp_mux_sel_e;
input  [5:0]	exu1_mdp_mux_sel_e;

input		exu_ms_icc0_e;
input		exu_ms_icc1_e;

input  [63:0]	exu_rs1_data0_e;
input  [63:0]	exu_rs1_data1_e;
input  [63:0]	exu_rs2_data0_e;
input  [63:0]	exu_rs2_data1_e;

input  [31:0]	exu_y_data0_e;
input  [31:0]	exu_y_data1_e;

input  [47:0]	exu_address0_e;
input  [47:0]	exu_address1_e;

input  [63:0]	exu_store_data0_e;
input  [63:0]	exu_store_data1_e;

input  [1:0]	exu_ecc_winop_flush_m;  

input  [31:0]	exu_gsr_data0_m;
input  [31:0]	exu_gsr_data1_m;

input  [1:0]	exu_gsr_vld0_m;
input  [1:0]	exu_gsr_vld1_m;

input  [1:0]	exu_cmov_true_m;

input  [47:13]  lsu_exu_address_e;
input		lsu_sel_lsu_addr_e;


output [63:0]	exu_fgu_rs1_e;
output [63:0]	exu_fgu_rs2_e;
output [31:0]	exu_fgu_gsr_m;
output [1:0]	exu_fgu_gsr_vld_m;
output		exu_fgu_flush_m;
output		exu_fgu_fmov_vld_m;


output [47:0]	exu_lsu_address_e;
output [63:0]	exu_lsu_store_data_e;
output [7:0]	exu_lsu_rs2_e;			// Partial stores


// scan/test renames
assign test		= tcu_dectest;
// end scan/test renames


 
//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! Start : FGU Muxing   !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!


exu_mdp_dp_buff_macro__width_2	i_fp_buff0		 (
  .din  ({exu_rs1_data0_e[31],exu_rs2_data0_e[31]}),
  .dout ({exu_rs1_data0_b31  ,exu_rs2_data0_b31  }));

exu_mdp_dp_buff_macro__width_2	i_fp_buff1		 (
  .din  ({exu_rs1_data1_e[31],exu_rs2_data1_e[31]}),
  .dout ({exu_rs1_data1_b31  ,exu_rs2_data1_b31}  ));





exu_mdp_dp_mux_macro__mux_aope__ports_5__stack_72c__width_64	i_fp_mux_rs1_early0	 (
  .din0 ({{32{exu_rs1_data0_b31}}		,exu_rs1_data0_e[31:0]}			),	// pg. 197 SMUL(cc)
  .din1 ({{32{1'b0             }}		,exu_rs1_data0_e[31:0]}			),	// pg. 197 UMUL(cc)
  .din2 ({exu_y_data0_e[31:0]      		,exu_rs1_data0_e[31:0]}			),	// pg. 152 SDIV(cc), UDIV(cc)
  .din3 ({{30{1'b0}},exu_y_data0_e[0],1'b0	,exu_ms_icc0_e,exu_rs1_data0_e[31:1]}	),	// pg. 199 MULScc
  .din4 ({exu_rs1_data0_e[63:32]		,exu_rs1_data0_e[31:0]}			),
  .sel0 ( exu0_mdp_mux_sel_e[0]								),
  .sel1 ( exu0_mdp_mux_sel_e[1]								),
  .sel2 ( exu0_mdp_mux_sel_e[2]								),
  .sel3 ( exu0_mdp_mux_sel_e[3]								),
  .dout ( rs1_data0_early_mux[63:0]							));

exu_mdp_dp_buff_macro__stack_72c__width_64	i_fp_buf_rs1_early0	 (
  .din  ( rs1_data0_early_mux[63:0]							),
  .dout ( rs1_data0_early[63:0]								));


exu_mdp_dp_mux_macro__mux_aope__ports_5__stack_72c__width_64	i_fp_mux_rs1_early1	 (
  .din0 ({{32{exu_rs1_data1_b31}}		,exu_rs1_data1_e[31:0]}			),	// pg. 197 SMUL(cc)
  .din1 ({{32{1'b0             }}		,exu_rs1_data1_e[31:0]}			),	// pg. 197 UMUL(cc)
  .din2 ({exu_y_data1_e[31:0]      		,exu_rs1_data1_e[31:0]}			),	// pg. 152 SDIV(cc), UDIV(cc)
  .din3 ({{30{1'b0}},exu_y_data1_e[0],1'b0	,exu_ms_icc1_e,exu_rs1_data1_e[31:1]}	),	// pg. 199 MULScc
  .din4 ({exu_rs1_data1_e[63:32]		,exu_rs1_data1_e[31:0]}			),
  .sel0 ( exu1_mdp_mux_sel_e[0]								),
  .sel1 ( exu1_mdp_mux_sel_e[1]								),
  .sel2 ( exu1_mdp_mux_sel_e[2]								),
  .sel3 ( exu1_mdp_mux_sel_e[3]								),
  .dout ( rs1_data1_early[63:0]								));


exu_mdp_dp_mux_macro__mux_aonpe__ports_2__stack_72c__width_32	i_fp_mux_rs2_early0	 (
  .din0 ( {32{exu_rs2_data0_b31}}							),	// pg. 197 SDIV(cc), SMUL(cc)
//.din1 ( {32{1'b0             }}							),	// pg. 197 UDIV(cc), UMUL(cc)  pg. 199 MULScc
  .din1 ( exu_rs2_data0_e[63:32]							),
  .sel0 ( exu0_mdp_mux_sel_e[4]								),
  .sel1 ( exu0_mdp_mux_sel_e[5]								),
  .dout ( rs2_data0_early_mux[63:32]							));

exu_mdp_dp_buff_macro__stack_72c__width_32	i_fp_buf_rs2_early0	 (
  .din  ( rs2_data0_early_mux[63:32]							),
  .dout ( rs2_data0_early[63:32]							));


exu_mdp_dp_mux_macro__mux_aonpe__ports_2__stack_72c__width_32	i_fp_mux_rs2_early1	 (
  .din0 ( {32{exu_rs2_data1_b31}}							),	// pg. 197 SDIV(cc), SMUL(cc)
//.din1 ( {32{1'b0             }}							),	// pg. 197 UDIV(cc), UMUL(cc)  pg. 199 MULScc
  .din1 ( exu_rs2_data1_e[63:32]							),
  .sel0 ( exu1_mdp_mux_sel_e[4]								),
  .sel1 ( exu1_mdp_mux_sel_e[5]								),
  .dout ( rs2_data1_early[63:32]							));

  assign rs2_data0_early[31:0]	= exu_rs2_data0_e[31:0];
  assign rs2_data1_early[31:0]	= exu_rs2_data1_e[31:0];


exu_mdp_dp_mux_macro__mux_aonpe__ports_2__stack_72c__width_64	i_fp_mux_rs1		 (
  .din0 ( rs1_data0_early[63:0]								),
  .din1 ( rs1_data1_early[63:0]								),
  .sel0 ( dec_fgu_sel_e[0]								),
  .sel1 ( dec_fgu_sel_e[1]								),
  .dout ( rs1_e[63:0]									));

exu_mdp_dp_buff_macro__stack_72c__width_64	i_fp_buf_rs1		 (
  .din  ( rs1_e[63:0]									),
  .dout ( exu_fgu_rs1_e[63:0]								));


exu_mdp_dp_mux_macro__mux_aonpe__ports_2__stack_72c__width_64	i_fp_mux_rs2		 (
  .din0 ( rs2_data0_early[63:0]								),
  .din1 ( rs2_data1_early[63:0]								),
  .sel0 ( dec_fgu_sel_e[0]								),
  .sel1 ( dec_fgu_sel_e[1]								),
  .dout ( rs2_e[63:0]									));

exu_mdp_dp_buff_macro__stack_72c__width_64	i_fp_buf_rs2		 (
  .din  ( rs2_e[63:0]									),
  .dout ( exu_fgu_rs2_e[63:0]								));


exu_mdp_dp_buff_macro__stack_72c__width_8	i_ls_buf_rs2		 (
  .din  ( exu_fgu_rs2_e[7:0]								),
  .dout ( exu_lsu_rs2_e[7:0]								));


exu_mdp_dp_mux_macro__mux_aonpe__ports_2__stack_72c__width_36	i_fp_mux_gsr		 (
  .din0 ({exu_cmov_true_m[0] , exu_ecc_winop_flush_m[0], exu_gsr_vld0_m[1:0]    , exu_gsr_data0_m[31:0]}	),
  .din1 ({exu_cmov_true_m[1] , exu_ecc_winop_flush_m[1], exu_gsr_vld1_m[1:0]    , exu_gsr_data1_m[31:0]}	),
  .sel0 ( dec_fgu_sel_m[0]											),
  .sel1 ( dec_fgu_sel_m[1]											),
  .dout ({        fmov_vld_m ,         flush_m         ,         gsr_vld_m[1:0] ,         gsr_m[31:0]}		));

exu_mdp_dp_buff_macro__stack_72c__width_36	i_fp_buf_gsr		 (
  .din  ({        fmov_vld_m ,         flush_m         ,         gsr_vld_m[1:0] ,         gsr_m[31:0]}		),
  .dout ({exu_fgu_fmov_vld_m , exu_fgu_flush_m         , exu_fgu_gsr_vld_m[1:0] , exu_fgu_gsr_m[31:0]}		));



 
//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! Start : LSU Muxing   !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!

exu_mdp_dp_buff_macro__dbuff_48x__width_1	tst_mux_rep0		 (
  .din ( tcu_muxtest									),
  .dout( tcu_muxtest_rep0								));

exu_mdp_dp_mux_macro__dmux_32x__mux_pgpe__ports_6__stack_72c__width_32	i_ls_mux_addr_l		 (
  .muxtst (tcu_muxtest_rep0								),
  .din0 ({lsu_exu_address_e[31:13],{13{1'b0}}}						),
  .din1 ( exu_rs1_data0_e[31:0]								),
  .din2 ( exu_rs1_data1_e[31:0]								),
  .din3 ( exu_address0_e[31:0]								),
  .din4 ( exu_address1_e[31:0]								),
  .din5 ({32{1'b0}}									),
  .sel0 ( lsu_sel_lsu_addr_e								),
  .sel1 ( dec_rs1_addr0_e								),
  .sel2 ( dec_rs1_addr1_e								),
  .sel3 ( dec_lsu_sel0_lower_e								),
  .sel4 ( dec_lsu_sel1_lower_e								),
  .dout ( exu_lsu_address_e[31:0]							),
  .test(test));

exu_mdp_dp_mux_macro__dmux_32x__mux_pgpe__ports_6__stack_72c__width_16	i_ls_mux_addr_h		 (
  .muxtst (tcu_muxtest_rep0								),
  .din0 ( lsu_exu_address_e[47:32]							),
  .din1 ( exu_rs1_data0_e[47:32]							),
  .din2 ( exu_rs1_data1_e[47:32]							),
  .din3 ( exu_address0_e[47:32]								),
  .din4 ( exu_address1_e[47:32]								),
  .din5 ({16{1'b0}}									),
  .sel0 ( lsu_sel_lsu_addr_e								),
  .sel1 ( dec_rs1_addr0_upper_e								),
  .sel2 ( dec_rs1_addr1_upper_e								),
  .sel3 ( dec_lsu_sel0_upper_e								),
  .sel4 ( dec_lsu_sel1_upper_e								),
  .dout ( exu_lsu_address_e[47:32]							),
  .test(test));	// Zero 47:32 when pstate.am = 1


exu_mdp_dp_mux_macro__mux_aonpe__ports_2__stack_72c__width_64	i_ls_mux_store		 (
  .din0 ( exu_store_data0_e[63:0]							),
  .din1 ( exu_store_data1_e[63:0]							),
  .sel0 ( dec_lsu_sel0_e								),
  .sel1 ( dec_lsu_sel1_e								),
  .dout ( store_data_e[63:0]								));

exu_mdp_dp_buff_macro__stack_72c__width_64	i_ls_buf_store		 (
  .din  ( store_data_e[63:0]								),
  .dout ( exu_lsu_store_data_e[63:0]							));


endmodule


//
//   buff macro
//
//





module exu_mdp_dp_buff_macro__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






buff #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_mdp_dp_mux_macro__mux_aope__ports_5__stack_72c__width_64 (
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

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  input [63:0] din4;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  output [63:0] dout;





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

mux5s #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
.dout(dout[63:0])
);









  



endmodule


//
//   buff macro
//
//





module exu_mdp_dp_buff_macro__stack_72c__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_mdp_dp_mux_macro__mux_aonpe__ports_2__stack_72c__width_32 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [31:0] din0;
  input sel0;
  input [31:0] din1;
  input sel1;
  output [31:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(32)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
.dout(dout[31:0])
);









  



endmodule


//
//   buff macro
//
//





module exu_mdp_dp_buff_macro__stack_72c__width_32 (
  din, 
  dout);
  input [31:0] din;
  output [31:0] dout;






buff #(32)  d0_0 (
.in(din[31:0]),
.out(dout[31:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_mdp_dp_mux_macro__mux_aonpe__ports_2__stack_72c__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  output [63:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(64)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(dout[63:0])
);









  



endmodule


//
//   buff macro
//
//





module exu_mdp_dp_buff_macro__stack_72c__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






buff #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_mdp_dp_mux_macro__mux_aonpe__ports_2__stack_72c__width_36 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [35:0] din0;
  input sel0;
  input [35:0] din1;
  input sel1;
  output [35:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(36)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[35:0]),
  .in1(din1[35:0]),
.dout(dout[35:0])
);









  



endmodule


//
//   buff macro
//
//





module exu_mdp_dp_buff_macro__stack_72c__width_36 (
  din, 
  dout);
  input [35:0] din;
  output [35:0] dout;






buff #(36)  d0_0 (
.in(din[35:0]),
.out(dout[35:0])
);








endmodule





//
//   buff macro
//
//





module exu_mdp_dp_buff_macro__dbuff_48x__width_1 (
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

module exu_mdp_dp_mux_macro__dmux_32x__mux_pgpe__ports_6__stack_72c__width_32 (
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
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;

  input [31:0] din0;
  input [31:0] din1;
  input [31:0] din2;
  input [31:0] din3;
  input [31:0] din4;
  input [31:0] din5;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input muxtst;
  input test;
  output [31:0] dout;





cl_dp1_penc6_8x  c0_0 (
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
 .psel5(psel5),
  .test(test)
);

mux6 #(32)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
  .in3(din3[31:0]),
  .in4(din4[31:0]),
  .in5(din5[31:0]),
.dout(dout[31:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_mdp_dp_mux_macro__dmux_32x__mux_pgpe__ports_6__stack_72c__width_16 (
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
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;

  input [15:0] din0;
  input [15:0] din1;
  input [15:0] din2;
  input [15:0] din3;
  input [15:0] din4;
  input [15:0] din5;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input muxtst;
  input test;
  output [15:0] dout;





cl_dp1_penc6_8x  c0_0 (
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
 .psel5(psel5),
  .test(test)
);

mux6 #(16)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .in0(din0[15:0]),
  .in1(din1[15:0]),
  .in2(din2[15:0]),
  .in3(din3[15:0]),
  .in4(din4[15:0]),
  .in5(din5[15:0]),
.dout(dout[15:0]),
  .muxtst(muxtst)
);









  



endmodule

