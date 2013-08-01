// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_dcd_dp.v
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
module lsu_dcd_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk, 
  spc_bclk, 
  scan_out, 
  dca_ld_data_b, 
  dac_byte_one_extend, 
  dac_byte_sel_data, 
  dac_swap7_byte0_l, 
  dac_swap7_byte3_l, 
  dac_swap7_byte4_l, 
  dac_swap7_byte7_l, 
  dac_swap6_byte1_l, 
  dac_swap6_byte2_l, 
  dac_swap6_byte5_l, 
  dac_swap6_byte6_l, 
  dac_swap5_byte1_l, 
  dac_swap5_byte2_l, 
  dac_swap5_byte5_l, 
  dac_swap5_byte6_l, 
  dac_swap4_byte0_l, 
  dac_swap4_byte3_l, 
  dac_swap4_byte4_l, 
  dac_swap4_byte7_l, 
  dac_swap3_byte0_r, 
  dac_swap3_byte3_r, 
  dac_swap3_byte4_r, 
  dac_swap3_byte7_r, 
  dac_swap2_byte1_r, 
  dac_swap2_byte2_r, 
  dac_swap2_byte5_r, 
  dac_swap2_byte6_r, 
  dac_swap1_byte0_r, 
  dac_swap1_byte1_r, 
  dac_swap1_byte2_r, 
  dac_swap1_byte3_r, 
  dac_swap1_byte4_r, 
  dac_swap1_byte5_r, 
  dac_swap1_byte6_r, 
  dac_swap1_byte7_r, 
  dac_swap0_byte0_r, 
  dac_swap0_byte1_r, 
  dac_swap0_byte2_r, 
  dac_swap0_byte3_r, 
  dac_swap0_byte4_r, 
  dac_swap0_byte5_r, 
  dac_swap0_byte6_r, 
  dac_swap0_byte7_r, 
  lsu_exu_ld_data_b, 
  lsu_fgu_fld_data_b, 
  bist_cmp_data, 
  dcd_dca_data_compare, 
  dcs_memref_m, 
  lsu_mmu_va_m, 
  lsu_mmu_va_b);
wire se;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire clk;
wire [63:0] prealign_load_data;
wire [7:0] byte7;
wire [7:0] byte6;
wire [7:0] byte5;
wire [7:0] byte4;
wire [7:0] byte3;
wire [7:0] byte2;
wire [7:0] byte1;
wire [7:0] byte0;
wire [7:0] align_byte0;
wire [63:0] final_data;
wire [7:0] align_byte1;
wire [7:0] align_byte2;
wire [7:0] align_byte3;
wire [7:0] align_byte4;
wire [7:0] align_byte5;
wire [7:0] align_byte6;
wire [7:0] align_byte7;
wire [1:0] data_compare;
wire [7:0] bist_cmp_data_local;
wire mmu_va_b_lat_scanin;
wire mmu_va_b_lat_scanout;
wire [47:0] va_b;


// globals
input 		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input 		tcu_scan_en;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;

// Data sources
input	[63:0]	dca_ld_data_b;		// data from dcache array

// Sign/zero extend controls
input	[7:1]	dac_byte_one_extend;
input	[7:1]	dac_byte_sel_data;

// Byte alignment controls
input		dac_swap7_byte0_l;
input		dac_swap7_byte3_l;
input		dac_swap7_byte4_l;
input		dac_swap7_byte7_l;
input		dac_swap6_byte1_l;
input		dac_swap6_byte2_l;
input		dac_swap6_byte5_l;
input		dac_swap6_byte6_l;
input		dac_swap5_byte1_l;   
input		dac_swap5_byte2_l;   
input		dac_swap5_byte5_l;   
input		dac_swap5_byte6_l;
input		dac_swap4_byte0_l;
input		dac_swap4_byte3_l;
input		dac_swap4_byte4_l;
input		dac_swap4_byte7_l;

input		dac_swap3_byte0_r;
input		dac_swap3_byte3_r;
input		dac_swap3_byte4_r;
input		dac_swap3_byte7_r;
input		dac_swap2_byte1_r;
input		dac_swap2_byte2_r;
input		dac_swap2_byte5_r;
input		dac_swap2_byte6_r;
input		dac_swap1_byte0_r;
input		dac_swap1_byte1_r;
input		dac_swap1_byte2_r;
input		dac_swap1_byte3_r;
input		dac_swap1_byte4_r;
input		dac_swap1_byte5_r;
input		dac_swap1_byte6_r;
input		dac_swap1_byte7_r; 
input		dac_swap0_byte0_r;
input		dac_swap0_byte1_r;
input		dac_swap0_byte2_r;
input		dac_swap0_byte3_r;
input		dac_swap0_byte4_r;
input		dac_swap0_byte5_r;
input		dac_swap0_byte6_r;
input		dac_swap0_byte7_r;

// Outputs to exu and fgu
output	[63:0]	lsu_exu_ld_data_b;
output	[63:0]	lsu_fgu_fld_data_b;

input	[7:0]	bist_cmp_data;
output	[1:0]	dcd_dca_data_compare;

input		dcs_memref_m;
input	[47:0]	lsu_mmu_va_m;
output	[47:0]	lsu_mmu_va_b;

assign se 	= tcu_scan_en;
assign pce_ov	= tcu_pce_ov;
assign stop	= 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;
assign clk	= l2clk;


assign prealign_load_data[63:0] = dca_ld_data_b[63:0];

//=========================================================================================
//	Alignment of Load Return Data
//=========================================================================================

// All data returning to the register files must be aligned
// and sign extended here.  Formatting occurs in two steps.
// 1st: Swizzle the bytes based on endianess, size, and address.
// 2nd: Pass the data or replace with zero/one extention.
// In the layout, bits should be interleaved to (1) minmize wire
// usage and (2) keep msb's close to the dac block.

// Because the fgu is flipped in the spc floorplan, it's alignment muxes are separate
// so that the mux ordering matches the fgu bit ordering.

assign	byte7[7:0] = prealign_load_data[63:56];
assign	byte6[7:0] = prealign_load_data[55:48];
assign	byte5[7:0] = prealign_load_data[47:40];
assign	byte4[7:0] = prealign_load_data[39:32];
assign	byte3[7:0] = prealign_load_data[31:24];
assign	byte2[7:0] = prealign_load_data[23:16];
assign	byte1[7:0] = prealign_load_data[15:8];
assign	byte0[7:0] = prealign_load_data[7:0];

// INT muxes

// Byte 0.
lsu_dcd_dp_mux_macro__buffsel_none__mux_aonpe__ports_8__stack_8c__width_8 i_swap_byte0       (
	.din0	(byte0[7:0]),
	.din1	(byte1[7:0]),
	.din2	(byte2[7:0]),
	.din3	(byte3[7:0]),
	.din4	(byte4[7:0]),
	.din5	(byte5[7:0]),
	.din6	(byte6[7:0]),
	.din7	(byte7[7:0]),
	.sel0	(dac_swap0_byte0_r),
	.sel1	(dac_swap0_byte1_r),
	.sel2	(dac_swap0_byte2_r),
	.sel3	(dac_swap0_byte3_r),
	.sel4	(dac_swap0_byte4_r),
	.sel5	(dac_swap0_byte5_r),
	.sel6	(dac_swap0_byte6_r),
	.sel7	(dac_swap0_byte7_r),
	.dout	(align_byte0[7:0])
);

// No sign-extension for byte0.  It always has "real" data.
assign final_data[7:0] = align_byte0[7:0];


// Byte 1.
lsu_dcd_dp_mux_macro__buffsel_none__mux_aonpe__ports_8__stack_8c__width_8 i_swap_byte1       (
	.din0	(byte0[7:0]),
	.din1	(byte1[7:0]),
	.din2	(byte2[7:0]),
	.din3	(byte3[7:0]),
	.din4	(byte4[7:0]),
	.din5	(byte5[7:0]),
	.din6	(byte6[7:0]),
	.din7	(byte7[7:0]),
	.sel0	(dac_swap1_byte0_r),
	.sel1	(dac_swap1_byte1_r),
	.sel2	(dac_swap1_byte2_r),
	.sel3	(dac_swap1_byte3_r),
	.sel4	(dac_swap1_byte4_r),
	.sel5	(dac_swap1_byte5_r),
	.sel6	(dac_swap1_byte6_r),
	.sel7	(dac_swap1_byte7_r),
	.dout	(align_byte1[7:0])
);

lsu_dcd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_8c__width_8 sext_byte1       (
	.din0	(align_byte1[7:0]),
	.din1	(8'hff),
	.sel0	(dac_byte_sel_data[1]),
	.sel1	(dac_byte_one_extend[1]),
	.dout	(final_data[15:8])
);


// Byte 2.
lsu_dcd_dp_mux_macro__buffsel_none__mux_aonpe__ports_4__stack_8c__width_8 i_swap_byte2       (
	.din0	(byte1[7:0]),
	.din1	(byte2[7:0]),
	.din2	(byte5[7:0]),
	.din3	(byte6[7:0]),
	.sel0	(dac_swap2_byte1_r),
	.sel1	(dac_swap2_byte2_r),
	.sel2	(dac_swap2_byte5_r),
	.sel3	(dac_swap2_byte6_r),
	.dout	(align_byte2[7:0])
);

lsu_dcd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_8c__width_8 sext_byte2       (
	.din0	(align_byte2[7:0]),
	.din1	(8'hff),
	.sel0	(dac_byte_sel_data[2]),
	.sel1	(dac_byte_one_extend[2]),
	.dout	(final_data[23:16])
);


// Byte 3.
lsu_dcd_dp_mux_macro__buffsel_none__mux_aonpe__ports_4__stack_8c__width_8 i_swap_byte3       (
	.din0	(byte0[7:0]),
	.din1	(byte3[7:0]),
	.din2	(byte4[7:0]),
	.din3	(byte7[7:0]),
	.sel0	(dac_swap3_byte0_r),
	.sel1	(dac_swap3_byte3_r),
	.sel2	(dac_swap3_byte4_r),
	.sel3	(dac_swap3_byte7_r),
	.dout	(align_byte3[7:0])
);

lsu_dcd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_8c__width_8 sext_byte3       (
	.din0	(align_byte3[7:0]),
	.din1	(8'hff),
	.sel0	(dac_byte_sel_data[3]),
	.sel1	(dac_byte_one_extend[3]),
	.dout	(final_data[31:24])
);


// Byte 4.
lsu_dcd_dp_mux_macro__buffsel_none__mux_aonpe__ports_4__stack_8c__width_8 i_swap_byte4       (
	.din0	(byte0[7:0]),
	.din1	(byte3[7:0]),
	.din2	(byte4[7:0]),
	.din3	(byte7[7:0]),
	.sel0	(dac_swap4_byte0_l),
	.sel1	(dac_swap4_byte3_l),
	.sel2	(dac_swap4_byte4_l),
	.sel3	(dac_swap4_byte7_l),
	.dout	(align_byte4[7:0])
);

lsu_dcd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_8c__width_8 sext_byte4       (
	.din0	(align_byte4[7:0]),
	.din1	(8'hff),
	.sel0	(dac_byte_sel_data[4]),
	.sel1	(dac_byte_one_extend[4]),
	.dout	(final_data[39:32])
);


// Byte 5.
lsu_dcd_dp_mux_macro__buffsel_none__mux_aonpe__ports_4__stack_8c__width_8 i_swap_byte5       (
	.din0	(byte1[7:0]),
	.din1	(byte2[7:0]),
	.din2	(byte5[7:0]),
	.din3	(byte6[7:0]),
	.sel0	(dac_swap5_byte1_l),
	.sel1	(dac_swap5_byte2_l),
	.sel2	(dac_swap5_byte5_l),
	.sel3	(dac_swap5_byte6_l),
	.dout	(align_byte5[7:0])
);

lsu_dcd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_8c__width_8 sext_byte5       (
	.din0	(align_byte5[7:0]),
	.din1	(8'hff),
	.sel0	(dac_byte_sel_data[5]),
	.sel1	(dac_byte_one_extend[5]),
	.dout	(final_data[47:40])
);


// Byte 6.
lsu_dcd_dp_mux_macro__buffsel_none__mux_aonpe__ports_4__stack_8c__width_8 i_swap_byte6       (
	.din0	(byte1[7:0]),
	.din1	(byte2[7:0]),
	.din2	(byte5[7:0]),
	.din3	(byte6[7:0]),
	.sel0	(dac_swap6_byte1_l),
	.sel1	(dac_swap6_byte2_l),
	.sel2	(dac_swap6_byte5_l),
	.sel3	(dac_swap6_byte6_l),
	.dout	(align_byte6[7:0])
);

lsu_dcd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_8c__width_8 sext_byte6       (
	.din0	(align_byte6[7:0]),
	.din1	(8'hff),
	.sel0	(dac_byte_sel_data[6]),
	.sel1	(dac_byte_one_extend[6]),
	.dout	(final_data[55:48])
);


// Byte 7.
lsu_dcd_dp_mux_macro__buffsel_none__mux_aonpe__ports_4__stack_8c__width_8 i_swap_byte7       (
	.din0	(byte0[7:0]),
	.din1	(byte3[7:0]),
	.din2	(byte4[7:0]),
	.din3	(byte7[7:0]),
	.sel0	(dac_swap7_byte0_l),
	.sel1	(dac_swap7_byte3_l),
	.sel2	(dac_swap7_byte4_l),
	.sel3	(dac_swap7_byte7_l),
	.dout	(align_byte7[7:0])
);

lsu_dcd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_8c__width_8 sext_byte7       (
	.din0	(align_byte7[7:0]),
	.din1	(8'hff),
	.sel0	(dac_byte_sel_data[7]),
	.sel1	(dac_byte_one_extend[7]),
	.dout	(final_data[63:56])
);


lsu_dcd_dp_buff_macro__dbuff_32x__rep_1__width_64 exu_data   (
	.din	(final_data[63:0]),
	.dout	(lsu_exu_ld_data_b[63:0])
);

lsu_dcd_dp_buff_macro__dbuff_32x__rep_1__width_64 fgu_data   (
	.din	({align_byte7[7:0],align_byte6[7:0],align_byte5[7:0],align_byte4[7:0],
		  align_byte3[7:0],align_byte2[7:0],align_byte1[7:0],align_byte0[7:0]}),
	.dout	(lsu_fgu_fld_data_b[63:0])
);

///////////
// BIST

lsu_dcd_dp_buff_macro__width_10 cmp_buff  (
	.din	({        data_compare[1:0],bist_cmp_data[7:0]}),
	.dout	({dcd_dca_data_compare[1:0],bist_cmp_data_local[7:0]})
);

lsu_dcd_dp_cmp_macro__width_32 bist_cmp0  (
	.din0	({4{bist_cmp_data_local[7:0]}}),
	.din1	(dca_ld_data_b[63:32]),
	.dout	(data_compare[0])
);

lsu_dcd_dp_cmp_macro__width_32 bist_cmp1  (
	.din0	({4{bist_cmp_data_local[7:0]}}),
	.din1	(dca_ld_data_b[31:0]),
	.dout	(data_compare[1])
);

//////////////////////////////
// Flop for VA to send to MMU
lsu_dcd_dp_msff_macro__minbuff_1__stack_48c__width_48 mmu_va_b_lat   (
	.scan_in(mmu_va_b_lat_scanin),
	.scan_out(mmu_va_b_lat_scanout),
	.en	(dcs_memref_m),
	.din	(lsu_mmu_va_m[47:0]),
	.dout	(va_b[47:0]),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_dcd_dp_buff_macro__dbuff_32x__stack_48c__width_48 mmu_va_b_buf    (
	.din	(va_b[47:0]),
	.dout	(lsu_mmu_va_b[47:0])
);


// fixscan start:
assign mmu_va_b_lat_scanin       = scan_in                  ;
assign scan_out                  = mmu_va_b_lat_scanout     ;
// fixscan end:
endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_dcd_dp_mux_macro__buffsel_none__mux_aonpe__ports_8__stack_8c__width_8 (
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
  din7, 
  sel7, 
  dout);
  input [7:0] din0;
  input sel0;
  input [7:0] din1;
  input sel1;
  input [7:0] din2;
  input sel2;
  input [7:0] din3;
  input sel3;
  input [7:0] din4;
  input sel4;
  input [7:0] din5;
  input sel5;
  input [7:0] din6;
  input sel6;
  input [7:0] din7;
  input sel7;
  output [7:0] dout;





mux8s #(8)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .sel2(sel2),
  .sel3(sel3),
  .sel4(sel4),
  .sel5(sel5),
  .sel6(sel6),
  .sel7(sel7),
  .in0(din0[7:0]),
  .in1(din1[7:0]),
  .in2(din2[7:0]),
  .in3(din3[7:0]),
  .in4(din4[7:0]),
  .in5(din5[7:0]),
  .in6(din6[7:0]),
  .in7(din7[7:0]),
.dout(dout[7:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_dcd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_8c__width_8 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [7:0] din0;
  input sel0;
  input [7:0] din1;
  input sel1;
  output [7:0] dout;





mux2s #(8)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[7:0]),
  .in1(din1[7:0]),
.dout(dout[7:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_dcd_dp_mux_macro__buffsel_none__mux_aonpe__ports_4__stack_8c__width_8 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
  input [7:0] din0;
  input sel0;
  input [7:0] din1;
  input sel1;
  input [7:0] din2;
  input sel2;
  input [7:0] din3;
  input sel3;
  output [7:0] dout;





mux4s #(8)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .sel2(sel2),
  .sel3(sel3),
  .in0(din0[7:0]),
  .in1(din1[7:0]),
  .in2(din2[7:0]),
  .in3(din3[7:0]),
.dout(dout[7:0])
);









  



endmodule


//
//   buff macro
//
//





module lsu_dcd_dp_buff_macro__dbuff_32x__rep_1__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule





//
//   buff macro
//
//





module lsu_dcd_dp_buff_macro__width_10 (
  din, 
  dout);
  input [9:0] din;
  output [9:0] dout;






buff #(10)  d0_0 (
.in(din[9:0]),
.out(dout[9:0])
);








endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module lsu_dcd_dp_cmp_macro__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output dout;






cmp #(32)  m0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout)
);










endmodule









// any PARAMS parms go into naming of macro

module lsu_dcd_dp_msff_macro__minbuff_1__stack_48c__width_48 (
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
wire [46:0] so;

  input [47:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [47:0] dout;


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
dff #(48)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[47:0]),
.si({scan_in,so[46:0]}),
.so({so[46:0],scan_out}),
.q(dout[47:0])
);




















endmodule









//
//   buff macro
//
//





module lsu_dcd_dp_buff_macro__dbuff_32x__stack_48c__width_48 (
  din, 
  dout);
  input [47:0] din;
  output [47:0] dout;






buff #(48)  d0_0 (
.in(din[47:0]),
.out(dout[47:0])
);








endmodule




