// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_rep_dp.v
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
module lsu_rep_dp (
  lmd_fill_or_byp_data_m, 
  lmd_fill_or_byp_data_m_rep1, 
  stb_ram_data, 
  stb_ram_data_rep0, 
  stb_cam_data, 
  stb_cam_data_rep0, 
  sbd_st_data2_b, 
  sbd_st_data2_b_rep0, 
  sbd_st_predata_b, 
  sbd_st_predata_b_rep0, 
  bist_cmp_data, 
  bist_cmp_data_rep0, 
  tlb_tte_ie_b, 
  tlb_tte_ie_b_rep00, 
  tlb_tte_ie_b_rep01, 
  stb_cam_hit, 
  stb_cam_hit_rep0, 
  tlb_cache_way_hit_b, 
  cache_way_hit_top_b, 
  cache_way_hit_bot_b, 
  exu_lsu_store_data_e, 
  exu_lsu_store_data_e_rep0, 
  exu_lsu_address_e, 
  exu_lsu_address_e_rep0);
wire [63:0] lmd_fill_or_byp_data_m_rep0;


input	[63:0]	lmd_fill_or_byp_data_m;
output	[63:0]	lmd_fill_or_byp_data_m_rep1;

input	[63:0]	stb_ram_data;
output	[63:0]	stb_ram_data_rep0;

input	[44:0]	stb_cam_data;
output	[44:0]	stb_cam_data_rep0;

input	[63:0]	sbd_st_data2_b;
output	[63:0]	sbd_st_data2_b_rep0;

input	[47:0]	sbd_st_predata_b;
output	[47:0]	sbd_st_predata_b_rep0;

input	[7:0]	bist_cmp_data;
output	[7:0]	bist_cmp_data_rep0;

input		tlb_tte_ie_b;
output		tlb_tte_ie_b_rep00;
output		tlb_tte_ie_b_rep01;

input		stb_cam_hit;
output		stb_cam_hit_rep0;

input	[3:0]	tlb_cache_way_hit_b;
output	[3:0]	cache_way_hit_top_b;
output	[3:0]	cache_way_hit_bot_b;

input	[63:0]	exu_lsu_store_data_e;
output	[63:0]	exu_lsu_store_data_e_rep0;

input	[10:4]	exu_lsu_address_e;
output	[10:4]	exu_lsu_address_e_rep0;

// D$ bypass data
lsu_rep_dp_buff_macro__rep_1__width_64 fill_or_byp_data_rep0  (
	.din	(lmd_fill_or_byp_data_m[63:0]),
	.dout	(lmd_fill_or_byp_data_m_rep0[63:0])
);
lsu_rep_dp_buff_macro__rep_1__width_64 fill_or_byp_data_rep1  (
	.din	(lmd_fill_or_byp_data_m_rep0[63:0]),
	.dout	(lmd_fill_or_byp_data_m_rep1[63:0])
);

// STB RAM read data (flopped)
lsu_rep_dp_buff_macro__rep_1__stack_32c__width_32 i0_stb_ram_data_rep0   (
	.din	(stb_ram_data[63:32]),
	.dout	(stb_ram_data_rep0[63:32])
);
lsu_rep_dp_buff_macro__rep_1__stack_32c__width_32 i1_stb_ram_data_rep0   (
	.din	(stb_ram_data[31:0]),
	.dout	(stb_ram_data_rep0[31:0])
);

// STB CAM read data
lsu_rep_dp_buff_macro__rep_1__width_45 i_stb_cam_data_rep0  (
	.din	(stb_cam_data[44:0]),
	.dout	(stb_cam_data_rep0[44:0])
);

// Prealigned data from store buffer
lsu_rep_dp_buff_macro__rep_1__width_48 st_predata_b_rep0  (
	.din	(sbd_st_predata_b[47:0]),
	.dout	(sbd_st_predata_b_rep0[47:0])
);

// Aligned data from store buffer
lsu_rep_dp_buff_macro__rep_1__width_64 st_data2_b_rep0  (
	.din	(sbd_st_data2_b[63:0]),
	.dout	(sbd_st_data2_b_rep0[63:0])
);

// BIST compare data
lsu_rep_dp_buff_macro__rep_1__width_8 i_bist_cmp_data_rep0  (
	.din	(bist_cmp_data[7:0]),
	.dout	(bist_cmp_data_rep0[7:0])
);

// TTE.IE
lsu_rep_dp_buff_macro__rep_1__width_1 tte_ie_rep00  (	// to sbs
	.din	(tlb_tte_ie_b),
	.dout	(tlb_tte_ie_b_rep00)
);
lsu_rep_dp_buff_macro__rep_1__width_1 tte_ie_rep01  (	// to dcc
	.din	(tlb_tte_ie_b),
	.dout	(tlb_tte_ie_b_rep01)
);

// stb_cam_hit; very critical to dcc, buffer off load to lmc
lsu_rep_dp_buff_macro__rep_1__width_1 i_stb_cam_hit_rep0  (	// to dcc
	.din	(stb_cam_hit),
	.dout	(stb_cam_hit_rep0)
);

// one copy of cache_way_hit goes up, one goes down
lsu_rep_dp_buff_macro__rep_1__width_4 i_cache_way_hit_top  (	// to dac
	.din	(tlb_cache_way_hit_b[3:0]),
	.dout	(cache_way_hit_top_b[3:0])
);
lsu_rep_dp_buff_macro__rep_1__width_4 i_cache_way_hit_bot  (	// to dcc
	.din	(tlb_cache_way_hit_b[3:0]),
	.dout	(cache_way_hit_bot_b[3:0])
);

lsu_rep_dp_buff_macro__rep_1__width_64 store_data_rep0  (
	.din	(exu_lsu_store_data_e[63:0]),
	.dout	(exu_lsu_store_data_e_rep0[63:0])
);

lsu_rep_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_7 exu_address_rep0  (
	.din	(exu_lsu_address_e[10:4]),
	.dout	(exu_lsu_address_e_rep0[10:4])
);

endmodule


//
//   buff macro
//
//





module lsu_rep_dp_buff_macro__rep_1__width_64 (
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





module lsu_rep_dp_buff_macro__rep_1__stack_32c__width_32 (
  din, 
  dout);
  input [31:0] din;
  output [31:0] dout;






buff #(32)  d0_0 (
.in(din[31:0]),
.out(dout[31:0])
);








endmodule





//
//   buff macro
//
//





module lsu_rep_dp_buff_macro__rep_1__width_45 (
  din, 
  dout);
  input [44:0] din;
  output [44:0] dout;






buff #(45)  d0_0 (
.in(din[44:0]),
.out(dout[44:0])
);








endmodule





//
//   buff macro
//
//





module lsu_rep_dp_buff_macro__rep_1__width_48 (
  din, 
  dout);
  input [47:0] din;
  output [47:0] dout;






buff #(48)  d0_0 (
.in(din[47:0]),
.out(dout[47:0])
);








endmodule





//
//   buff macro
//
//





module lsu_rep_dp_buff_macro__rep_1__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






buff #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);








endmodule





//
//   buff macro
//
//





module lsu_rep_dp_buff_macro__rep_1__width_1 (
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
//   buff macro
//
//





module lsu_rep_dp_buff_macro__rep_1__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule





//
//   buff macro
//
//





module lsu_rep_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_7 (
  din, 
  dout);
  input [6:0] din;
  output [6:0] dout;






buff #(7)  d0_0 (
.in(din[6:0]),
.out(dout[6:0])
);








endmodule




