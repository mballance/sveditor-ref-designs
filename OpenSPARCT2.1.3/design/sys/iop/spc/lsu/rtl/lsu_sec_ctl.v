// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_sec_ctl.v
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
module lsu_sec_ctl (
  sed_c1_lo, 
  sed_c1_hi, 
  sed_c2_lo, 
  sed_c2_hi, 
  sed_c4_lo, 
  sed_c4_hi, 
  sed_c8_lo, 
  sed_c8_hi, 
  sed_c16_lo, 
  sed_c16_hi, 
  sed_cf_lo, 
  sed_cf_hi, 
  sed_c32_hi, 
  sed_c32_lo, 
  sbc_twocycle_inst_w, 
  stb_cparity_calc, 
  sbc_st_sz_m, 
  sbc_std_le_m, 
  sbc_st_le_if_ie_m, 
  sbc_st_le_not_ie_m, 
  sbc_spd_clken, 
  mbi_run, 
  mbi_wdata_b3, 
  cecc_err, 
  uecc_err, 
  corr_bit, 
  stb_cparity, 
  sec_st_sz_dw_std_le_b, 
  sec_st_sz_dw_le_not_ie_b, 
  sec_st_sz_dw_be_not_ie_b, 
  sec_st_sz_word_le_not_ie_b, 
  sec_st_sz_word_be_not_ie_b, 
  sec_st_sz_hw_le_not_ie_b, 
  sec_st_sz_hw_be_not_ie_b, 
  sec_st_sz_dw_le_if_ie_b, 
  sec_st_sz_dw_be_if_ie_b, 
  sec_st_sz_word_le_if_ie_b, 
  sec_st_sz_word_be_if_ie_b, 
  sec_st_sz_hw_le_if_ie_b, 
  sec_st_sz_hw_be_if_ie_b, 
  sec_st_sz_byte_b, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk, 
  spc_bclk, 
  scan_out);
wire se;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire [31:0] err_bith;
wire [31:0] err_bitl;
wire l1clk_pm1;
wire parityl;
wire c32l;
wire c16l;
wire c8l;
wire c4l;
wire c2l;
wire c1l;
wire cecc_errl;
wire uecc_errl;
wire parityh;
wire c32h;
wire c16h;
wire c8h;
wire c4h;
wire c2h;
wire c1h;
wire cecc_errh;
wire uecc_errh;
wire stb_cparity_w;
wire dff_cparity_scanin;
wire dff_cparity_scanout;
wire st_sz_dw_m;
wire st_sz_word_m;
wire st_sz_hw_m;
wire st_sz_byte_m;
wire st_sz_dw_std_le_m;
wire st_sz_dw_le_not_ie_m;
wire st_sz_dw_be_not_ie_m;
wire st_sz_word_le_not_ie_m;
wire st_sz_word_be_not_ie_m;
wire st_sz_hw_le_not_ie_m;
wire st_sz_hw_be_not_ie_m;
wire st_sz_dw_le_if_ie_m;
wire st_sz_dw_be_if_ie_m;
wire st_sz_word_le_if_ie_m;
wire st_sz_word_be_if_ie_m;
wire st_sz_hw_le_if_ie_m;
wire st_sz_hw_be_if_ie_m;
wire dff_st_sz_scanin;
wire dff_st_sz_scanout;
wire spares_scanin;
wire spares_scanout;


input	[1:0]	sed_c1_lo;
input	[1:0]	sed_c1_hi;
input	[1:0]	sed_c2_lo;
input	[1:0]	sed_c2_hi;
input	[1:0]	sed_c4_lo;
input	[1:0]	sed_c4_hi;
input	[1:0]	sed_c8_lo;
input	[1:0]	sed_c8_hi;
input	[1:0]	sed_c16_lo;
input	[1:0]	sed_c16_hi;
input	[2:0]	sed_cf_lo;
input	[2:0]	sed_cf_hi;
input		sed_c32_hi;
input		sed_c32_lo;

input		sbc_twocycle_inst_w;
input		stb_cparity_calc;
input	[1:0]	sbc_st_sz_m;
input		sbc_std_le_m;
input		sbc_st_le_if_ie_m;
input		sbc_st_le_not_ie_m;
input		sbc_spd_clken;

input		mbi_run;
input		mbi_wdata_b3;

output		cecc_err;
output		uecc_err;
output	[63:0]	corr_bit;
output		stb_cparity;

output		sec_st_sz_dw_std_le_b;
output		sec_st_sz_dw_le_not_ie_b;
output		sec_st_sz_dw_be_not_ie_b;
output		sec_st_sz_word_le_not_ie_b;
output		sec_st_sz_word_be_not_ie_b;
output		sec_st_sz_hw_le_not_ie_b;
output		sec_st_sz_hw_be_not_ie_b;
output		sec_st_sz_dw_le_if_ie_b;
output		sec_st_sz_dw_be_if_ie_b;
output		sec_st_sz_word_le_if_ie_b;
output		sec_st_sz_word_be_if_ie_b;
output		sec_st_sz_hw_le_if_ie_b;
output		sec_st_sz_hw_be_if_ie_b;
output		sec_st_sz_byte_b;

input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input		tcu_scan_en;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;

// scan renames
assign se = tcu_scan_en;
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = spc_aclk;
assign soclk = spc_bclk;
// end scan

assign corr_bit[63:0] = {err_bith[31:0],err_bitl[31:0]};

//////////////////////////////
// Clock header
//////////////////////////////
lsu_sec_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk              ),
        .l1en   (sbc_spd_clken      ),
        .l1clk  (l1clk_pm1          ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

///////////////////////////////////////////////////////////////////////
// Flop check bits, determine error, and generate correction vector

assign parityl = sed_cf_lo[2] ^ sed_cf_lo[1] ^ sed_cf_lo[0];
assign c32l    = sed_c32_lo;
assign c16l    = sed_c16_lo[1] ^ sed_c16_lo[0];
assign c8l     = sed_c8_lo[1] ^ sed_c8_lo[0];
assign c4l     = sed_c4_lo[1] ^ sed_c4_lo[0];
assign c2l     = sed_c2_lo[1] ^ sed_c2_lo[0];
assign c1l     = sed_c1_lo[1] ^ sed_c1_lo[0];

assign cecc_errl = |({c1l,c2l,c4l,c8l,c16l,c32l}) & parityl;
assign uecc_errl = |({c1l,c2l,c4l,c8l,c16l,c32l}) & ~parityl;

assign err_bitl[0]  = ~c32l & ~c16l & ~c8l & ~c4l &  c2l &  c1l;
assign err_bitl[1]  = ~c32l & ~c16l & ~c8l &  c4l & ~c2l &  c1l;
assign err_bitl[2]  = ~c32l & ~c16l & ~c8l &  c4l &  c2l & ~c1l;
assign err_bitl[3]  = ~c32l & ~c16l & ~c8l &  c4l &  c2l &  c1l;
assign err_bitl[4]  = ~c32l & ~c16l &  c8l & ~c4l & ~c2l &  c1l;
assign err_bitl[5]  = ~c32l & ~c16l &  c8l & ~c4l &  c2l & ~c1l;
assign err_bitl[6]  = ~c32l & ~c16l &  c8l & ~c4l &  c2l &  c1l;
assign err_bitl[7]  = ~c32l & ~c16l &  c8l &  c4l & ~c2l & ~c1l;
assign err_bitl[8]  = ~c32l & ~c16l &  c8l &  c4l & ~c2l &  c1l;
assign err_bitl[9]  = ~c32l & ~c16l &  c8l &  c4l &  c2l & ~c1l;
assign err_bitl[10] = ~c32l & ~c16l &  c8l &  c4l &  c2l &  c1l;
assign err_bitl[11] = ~c32l &  c16l & ~c8l & ~c4l & ~c2l &  c1l;
assign err_bitl[12] = ~c32l &  c16l & ~c8l & ~c4l &  c2l & ~c1l;
assign err_bitl[13] = ~c32l &  c16l & ~c8l & ~c4l &  c2l &  c1l;
assign err_bitl[14] = ~c32l &  c16l & ~c8l &  c4l & ~c2l & ~c1l;
assign err_bitl[15] = ~c32l &  c16l & ~c8l &  c4l & ~c2l &  c1l;
assign err_bitl[16] = ~c32l &  c16l & ~c8l &  c4l &  c2l & ~c1l;
assign err_bitl[17] = ~c32l &  c16l & ~c8l &  c4l &  c2l &  c1l;
assign err_bitl[18] = ~c32l &  c16l &  c8l & ~c4l & ~c2l & ~c1l;
assign err_bitl[19] = ~c32l &  c16l &  c8l & ~c4l & ~c2l &  c1l;
assign err_bitl[20] = ~c32l &  c16l &  c8l & ~c4l &  c2l & ~c1l;
assign err_bitl[21] = ~c32l &  c16l &  c8l & ~c4l &  c2l &  c1l;
assign err_bitl[22] = ~c32l &  c16l &  c8l &  c4l & ~c2l & ~c1l;
assign err_bitl[23] = ~c32l &  c16l &  c8l &  c4l & ~c2l &  c1l;
assign err_bitl[24] = ~c32l &  c16l &  c8l &  c4l &  c2l & ~c1l;
assign err_bitl[25] = ~c32l &  c16l &  c8l &  c4l &  c2l &  c1l;
assign err_bitl[26] =  c32l & ~c16l & ~c8l & ~c4l & ~c2l &  c1l;
assign err_bitl[27] =  c32l & ~c16l & ~c8l & ~c4l &  c2l & ~c1l;
assign err_bitl[28] =  c32l & ~c16l & ~c8l & ~c4l &  c2l &  c1l;
assign err_bitl[29] =  c32l & ~c16l & ~c8l &  c4l & ~c2l & ~c1l;
assign err_bitl[30] =  c32l & ~c16l & ~c8l &  c4l & ~c2l &  c1l;
assign err_bitl[31] =  c32l & ~c16l & ~c8l &  c4l &  c2l & ~c1l;

assign parityh = sed_cf_hi[2] ^ sed_cf_hi[1] ^ sed_cf_hi[0];
assign c32h    = sed_c32_hi;
assign c16h    = sed_c16_hi[1] ^ sed_c16_hi[0];
assign c8h     = sed_c8_hi[1] ^ sed_c8_hi[0];
assign c4h     = sed_c4_hi[1] ^ sed_c4_hi[0];
assign c2h     = sed_c2_hi[1] ^ sed_c2_hi[0];
assign c1h     = sed_c1_hi[1] ^ sed_c1_hi[0];

assign cecc_errh = |({c1h,c2h,c4h,c8h,c16h,c32h}) &  parityh;
assign uecc_errh = |({c1h,c2h,c4h,c8h,c16h,c32h}) & ~parityh;

assign err_bith[0]  = ~c32h & ~c16h & ~c8h & ~c4h &  c2h &  c1h;
assign err_bith[1]  = ~c32h & ~c16h & ~c8h &  c4h & ~c2h &  c1h;
assign err_bith[2]  = ~c32h & ~c16h & ~c8h &  c4h &  c2h & ~c1h;
assign err_bith[3]  = ~c32h & ~c16h & ~c8h &  c4h &  c2h &  c1h;
assign err_bith[4]  = ~c32h & ~c16h &  c8h & ~c4h & ~c2h &  c1h;
assign err_bith[5]  = ~c32h & ~c16h &  c8h & ~c4h &  c2h & ~c1h;
assign err_bith[6]  = ~c32h & ~c16h &  c8h & ~c4h &  c2h &  c1h;
assign err_bith[7]  = ~c32h & ~c16h &  c8h &  c4h & ~c2h & ~c1h;
assign err_bith[8]  = ~c32h & ~c16h &  c8h &  c4h & ~c2h &  c1h;
assign err_bith[9]  = ~c32h & ~c16h &  c8h &  c4h &  c2h & ~c1h;
assign err_bith[10] = ~c32h & ~c16h &  c8h &  c4h &  c2h &  c1h;
assign err_bith[11] = ~c32h &  c16h & ~c8h & ~c4h & ~c2h &  c1h;
assign err_bith[12] = ~c32h &  c16h & ~c8h & ~c4h &  c2h & ~c1h;
assign err_bith[13] = ~c32h &  c16h & ~c8h & ~c4h &  c2h &  c1h;
assign err_bith[14] = ~c32h &  c16h & ~c8h &  c4h & ~c2h & ~c1h;
assign err_bith[15] = ~c32h &  c16h & ~c8h &  c4h & ~c2h &  c1h;
assign err_bith[16] = ~c32h &  c16h & ~c8h &  c4h &  c2h & ~c1h;
assign err_bith[17] = ~c32h &  c16h & ~c8h &  c4h &  c2h &  c1h;
assign err_bith[18] = ~c32h &  c16h &  c8h & ~c4h & ~c2h & ~c1h;
assign err_bith[19] = ~c32h &  c16h &  c8h & ~c4h & ~c2h &  c1h;
assign err_bith[20] = ~c32h &  c16h &  c8h & ~c4h &  c2h & ~c1h;
assign err_bith[21] = ~c32h &  c16h &  c8h & ~c4h &  c2h &  c1h;
assign err_bith[22] = ~c32h &  c16h &  c8h &  c4h & ~c2h & ~c1h;
assign err_bith[23] = ~c32h &  c16h &  c8h &  c4h & ~c2h &  c1h;
assign err_bith[24] = ~c32h &  c16h &  c8h &  c4h &  c2h & ~c1h;
assign err_bith[25] = ~c32h &  c16h &  c8h &  c4h &  c2h &  c1h;
assign err_bith[26] =  c32h & ~c16h & ~c8h & ~c4h & ~c2h &  c1h;
assign err_bith[27] =  c32h & ~c16h & ~c8h & ~c4h &  c2h & ~c1h;
assign err_bith[28] =  c32h & ~c16h & ~c8h & ~c4h &  c2h &  c1h;
assign err_bith[29] =  c32h & ~c16h & ~c8h &  c4h & ~c2h & ~c1h;
assign err_bith[30] =  c32h & ~c16h & ~c8h &  c4h & ~c2h &  c1h;
assign err_bith[31] =  c32h & ~c16h & ~c8h &  c4h &  c2h & ~c1h;

assign cecc_err = cecc_errl | cecc_errh;
assign uecc_err = uecc_errl | uecc_errh;

assign stb_cparity   = mbi_run ? mbi_wdata_b3 : (sbc_twocycle_inst_w ? stb_cparity_w : stb_cparity_calc);

// Store cam parity for a cycle for the STD case
lsu_sec_ctl_msff_ctl_macro__width_1 dff_cparity  (
	.scan_in(dff_cparity_scanin),
	.scan_out(dff_cparity_scanout),
	.l1clk	(l1clk_pm1),
	.din	(stb_cparity_calc),
	.dout	(stb_cparity_w),
  .siclk(siclk),
  .soclk(soclk)
);

assign st_sz_dw_m   =  sbc_st_sz_m[1] &  sbc_st_sz_m[0];
assign st_sz_word_m =  sbc_st_sz_m[1] & ~sbc_st_sz_m[0];
assign st_sz_hw_m   = ~sbc_st_sz_m[1] &  sbc_st_sz_m[0];
assign st_sz_byte_m = ~sbc_st_sz_m[1] & ~sbc_st_sz_m[0];

assign st_sz_dw_std_le_m = st_sz_dw_m & sbc_std_le_m;
assign st_sz_dw_le_not_ie_m = st_sz_dw_m & ~sbc_std_le_m & sbc_st_le_not_ie_m;
assign st_sz_dw_be_not_ie_m = st_sz_dw_m & ~sbc_std_le_m & ~sbc_st_le_not_ie_m;
assign st_sz_word_le_not_ie_m = st_sz_word_m & sbc_st_le_not_ie_m;
assign st_sz_word_be_not_ie_m = st_sz_word_m & ~sbc_st_le_not_ie_m;
assign st_sz_hw_le_not_ie_m = st_sz_hw_m & sbc_st_le_not_ie_m;
assign st_sz_hw_be_not_ie_m = st_sz_hw_m & ~sbc_st_le_not_ie_m;
assign st_sz_dw_le_if_ie_m = st_sz_dw_m & ~sbc_std_le_m & sbc_st_le_if_ie_m;
assign st_sz_dw_be_if_ie_m = st_sz_dw_m & ~sbc_std_le_m & ~sbc_st_le_if_ie_m;
assign st_sz_word_le_if_ie_m = st_sz_word_m & sbc_st_le_if_ie_m;
assign st_sz_word_be_if_ie_m = st_sz_word_m & ~sbc_st_le_if_ie_m;
assign st_sz_hw_le_if_ie_m = st_sz_hw_m & sbc_st_le_if_ie_m;
assign st_sz_hw_be_if_ie_m = st_sz_hw_m & ~sbc_st_le_if_ie_m;

lsu_sec_ctl_msff_ctl_macro__width_14 dff_st_sz  (
	.scan_in(dff_st_sz_scanin),
	.scan_out(dff_st_sz_scanout),
	.l1clk	(l1clk_pm1),
	.din	({    st_sz_dw_std_le_m,         st_sz_dw_le_not_ie_m,      st_sz_dw_be_not_ie_m,
		      st_sz_word_le_not_ie_m,    st_sz_word_be_not_ie_m,    st_sz_hw_le_not_ie_m,
		      st_sz_hw_be_not_ie_m,      st_sz_dw_le_if_ie_m,       st_sz_dw_be_if_ie_m,
		      st_sz_word_le_if_ie_m,     st_sz_word_be_if_ie_m,     st_sz_hw_le_if_ie_m,
		      st_sz_hw_be_if_ie_m,       st_sz_byte_m}),
	.dout	({sec_st_sz_dw_std_le_b,     sec_st_sz_dw_le_not_ie_b,  sec_st_sz_dw_be_not_ie_b,
		  sec_st_sz_word_le_not_ie_b,sec_st_sz_word_be_not_ie_b,sec_st_sz_hw_le_not_ie_b,
		  sec_st_sz_hw_be_not_ie_b,  sec_st_sz_dw_le_if_ie_b,   sec_st_sz_dw_be_if_ie_b,
		  sec_st_sz_word_le_if_ie_b, sec_st_sz_word_be_if_ie_b, sec_st_sz_hw_le_if_ie_b,
		  sec_st_sz_hw_be_if_ie_b,   sec_st_sz_byte_b}),
  .siclk(siclk),
  .soclk(soclk)
);


lsu_sec_ctl_spare_ctl_macro__num_1 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk_pm1),
  .siclk(siclk),
  .soclk(soclk)
);

// fixscan start:
assign dff_cparity_scanin        = scan_in                  ;
assign dff_st_sz_scanin          = dff_cparity_scanout      ;
assign spares_scanin             = dff_st_sz_scanout        ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule







// any PARAMS parms go into naming of macro

module lsu_sec_ctl_l1clkhdr_ctl_macro (
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













// any PARAMS parms go into naming of macro

module lsu_sec_ctl_msff_ctl_macro__width_1 (
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

module lsu_sec_ctl_msff_ctl_macro__width_14 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [13:0] fdin;
wire [12:0] so;

  input [13:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [13:0] dout;
  output scan_out;
assign fdin[13:0] = din[13:0];






dff #(14)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[13:0]),
.si({scan_in,so[12:0]}),
.so({so[12:0],scan_out}),
.q(dout[13:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module lsu_sec_ctl_spare_ctl_macro__num_1 (
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
assign scan_out = so_0;



endmodule

