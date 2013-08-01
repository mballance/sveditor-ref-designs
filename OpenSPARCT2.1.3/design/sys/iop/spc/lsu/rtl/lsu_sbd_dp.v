// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_sbd_dp.v
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
module lsu_sbd_dp (
  const_cpuid, 
  lsu_va_m, 
  exu_lsu_store_data_e, 
  fgu_lsu_fst_data_fx1, 
  tlb_pgnum_crit, 
  tlb_tte_ie_b, 
  sbc_st_int_sel_m, 
  sbc_bst_offset, 
  sbc_bst_in_prog_m, 
  sbc_load_bst_addr, 
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
  dcc_tid_m, 
  dcc_asi_m, 
  dcc_sbd_e_clken, 
  dcc_sbd_m_clken, 
  dcc_std_inst_m, 
  dcc_fp32b_sel_m, 
  dcc_asi_iomap_m, 
  dcc_cache_diag_wr_m, 
  dcc_demap_asi_m, 
  dcc_ldstub_inst_m, 
  stb_cam_data, 
  dcs_memref_m, 
  mbi_run, 
  mbi_cambist_run, 
  mbi_wdata, 
  mbi_ptag_data, 
  mbi_init_to_zero, 
  mbi_cambist_shift, 
  sbd_st_data_b, 
  sbd_st_data2_b, 
  sbd_st_datab_b, 
  sbd_st_predata_b, 
  sbd_st_addr_b, 
  stb_st_addr_m, 
  stb_st_addr_b, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk, 
  spc_bclk, 
  scan_out);
wire stop;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire dff_st_data_m_0_scanin;
wire dff_st_data_m_0_scanout;
wire [63:0] pre_st_data_m;
wire dff_st_data_m_1_scanin;
wire dff_st_data_m_1_scanout;
wire ldstub_inst_m_0;
wire ldstub_inst_m_1;
wire [63:0] pre_st_data2_m;
wire [63:0] st_data_m;
wire dff_st_data_b_0_scanin;
wire dff_st_data_b_0_scanout;
wire [63:0] st_data_b;
wire dff_st_data_b_1_scanin;
wire dff_st_data_b_1_scanout;
wire [7:0] byte0;
wire [7:0] byte1;
wire [7:0] byte2;
wire [7:0] byte3;
wire [7:0] byte4;
wire [7:0] byte5;
wire [7:0] byte6;
wire [7:0] byte7;
wire [63:0] st_data_ie0_b;
wire [63:0] st_data_ie1_b;
wire [39:3] st_addr_b;
wire [39:3] bist_data;
wire [39:6] bst_addr;
wire [39:3] st_addr_m;
wire dff_st_addr_scanin;
wire dff_st_addr_scanout;
wire dff_bst_addr_scanin;
wire dff_bst_addr_scanout;


input	[2:0]	const_cpuid;

input	[47:3]	lsu_va_m;		

input	[63:0]	exu_lsu_store_data_e;

input	[63:0]	fgu_lsu_fst_data_fx1;

input	[39:13]	tlb_pgnum_crit;
input		tlb_tte_ie_b;

input		sbc_st_int_sel_m;
input	[2:0]	sbc_bst_offset;
input		sbc_bst_in_prog_m;
input		sbc_load_bst_addr;

input		sec_st_sz_dw_std_le_b;
input		sec_st_sz_dw_le_not_ie_b;
input		sec_st_sz_dw_be_not_ie_b;
input		sec_st_sz_word_le_not_ie_b;
input		sec_st_sz_word_be_not_ie_b;
input		sec_st_sz_hw_le_not_ie_b;
input		sec_st_sz_hw_be_not_ie_b;
input		sec_st_sz_dw_le_if_ie_b;
input		sec_st_sz_dw_be_if_ie_b;
input		sec_st_sz_word_le_if_ie_b;
input		sec_st_sz_word_be_if_ie_b;
input		sec_st_sz_hw_le_if_ie_b;
input		sec_st_sz_hw_be_if_ie_b;
input		sec_st_sz_byte_b;

input	[2:0]	dcc_tid_m;
input	[7:0]	dcc_asi_m;
input		dcc_sbd_e_clken;
input		dcc_sbd_m_clken;
input		dcc_std_inst_m;
input		dcc_fp32b_sel_m;
input		dcc_asi_iomap_m;
input		dcc_cache_diag_wr_m;
input		dcc_demap_asi_m;
input		dcc_ldstub_inst_m;

input	[44:11]	stb_cam_data;

input		dcs_memref_m;

input		mbi_run;
input		mbi_cambist_run;
input	[7:0]	mbi_wdata;
input		mbi_ptag_data;
input		mbi_init_to_zero;
input		mbi_cambist_shift;

output	[63:0]	sbd_st_data_b;		// Final formatted data
output	[63:0]	sbd_st_data2_b;		// Final formatted data
output	[63:0]	sbd_st_datab_b;		// Final formatted data with bist
output	[47:0]	sbd_st_predata_b;	// Unformatted store data (ok for ASI writes)
output	[39:3]	sbd_st_addr_b;
output	[39:3]	stb_st_addr_m;
output	[39:13]	stb_st_addr_b;

// Globals
input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input		tcu_scan_en;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;

// scan renames
assign stop = 1'b0;
// end scan

lsu_sbd_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 test_rep0  (
	.din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk}),
	.dout({se,pce_ov,siclk,soclk})
);

////////////////////////////////////////////////////////////////////////////////
// Mux different sources of store data.  FGU data gets muxed spearately in M
// because it comes in that cycle.

lsu_sbd_dp_msff_macro__mux_aope__ports_2__stack_32c__width_32 dff_st_data_m_0      (
	.scan_in(dff_st_data_m_0_scanin),
	.scan_out(dff_st_data_m_0_scanout),
	.din0	(pre_st_data_m[31:0]),					// std
	.din1	(exu_lsu_store_data_e[63:32]),				// default
	.sel0	(dcc_std_inst_m),
	.dout	(pre_st_data_m[63:32]),
	.clk    (l2clk),
	.en	(dcc_sbd_e_clken),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	// enable on stores, second half of STD/CAS
);
lsu_sbd_dp_msff_macro__mux_aope__ports_2__stack_32c__width_32 dff_st_data_m_1      (
	.scan_in(dff_st_data_m_1_scanin),
	.scan_out(dff_st_data_m_1_scanout),
	.din0	(exu_lsu_store_data_e[31:0]),				// std
	.din1	(exu_lsu_store_data_e[31:0]),				// default
	.sel0	(dcc_std_inst_m),
	.dout	(pre_st_data_m[31:0]),
	.clk    (l2clk),
	.en	(dcc_sbd_e_clken),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	// enable on stores, second half of STD/CAS
);

lsu_sbd_dp_buff_macro__rep_1__width_2 ldstub_buf  (
	.din	({2{dcc_ldstub_inst_m}}),
	.dout	({ldstub_inst_m_0,ldstub_inst_m_1})
);

lsu_sbd_dp_or_macro__ports_2__stack_32c__width_32 ldstub_or_0    (
	.din0	(pre_st_data_m[63:32]),
	.din1	({32{ldstub_inst_m_0}}),
	.dout	(pre_st_data2_m[63:32])
);

lsu_sbd_dp_or_macro__ports_2__stack_32c__width_32 ldstub_or_1    (
	.din0	(pre_st_data_m[31:0]),
	.din1	({32{ldstub_inst_m_1}}),
	.dout	(pre_st_data2_m[31:0])
);

lsu_sbd_dp_mux_macro__mux_aope__ports_4__stack_32c__width_32 mx_data_m_0      (
	.din0	({16'b0,lsu_va_m[47:32]}),
	.din1	(pre_st_data2_m[63:32]),
	.din2	(fgu_lsu_fst_data_fx1[63:32]),
	.din3	(fgu_lsu_fst_data_fx1[63:32]),
	.sel0	(dcc_demap_asi_m),
	.sel1	(sbc_st_int_sel_m),
	.sel2	(dcc_fp32b_sel_m),
	.dout	(st_data_m[63:32])
);
lsu_sbd_dp_mux_macro__mux_aope__ports_4__stack_32c__width_32 mx_data_m_1      (
	.din0	({lsu_va_m[31:3],3'b0}),
	.din1	(pre_st_data2_m[31:0]),
	.din2	(fgu_lsu_fst_data_fx1[63:32]),
	.din3	(fgu_lsu_fst_data_fx1[31:0]),
	.sel0	(dcc_demap_asi_m),
	.sel1	(sbc_st_int_sel_m),
	.sel2	(dcc_fp32b_sel_m),
	.dout	(st_data_m[31:0])
);

lsu_sbd_dp_msff_macro__stack_32c__width_32 dff_st_data_b_0    (
	.scan_in(dff_st_data_b_0_scanin),
	.scan_out(dff_st_data_b_0_scanout),
	.din    (st_data_m[63:32]),
	.dout	(st_data_b[63:32]),
	.clk    (l2clk),
	.en	(dcc_sbd_m_clken),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_sbd_dp_msff_macro__stack_32c__width_32 dff_st_data_b_1    (
	.scan_in(dff_st_data_b_1_scanin),
	.scan_out(dff_st_data_b_1_scanout),
	.din    (st_data_m[31:0]),
	.dout	(st_data_b[31:0]),
	.clk    (l2clk),
	.en	(dcc_sbd_m_clken),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

lsu_sbd_dp_buff_macro__rep_1__stack_32c__width_16 st_predata_buf_0   (
	.din	(st_data_b[47:32]),
	.dout	(sbd_st_predata_b[47:32])
);
lsu_sbd_dp_buff_macro__rep_1__stack_32c__width_32 st_predata_buf_1   (
	.din	(st_data_b[31:0]),
	.dout	(sbd_st_predata_b[31:0])
);

////////////////////////////////////////////////////////////////////////////////
// Little endian swapping and data fill

assign byte0[7:0] = st_data_b[7:0];
assign byte1[7:0] = st_data_b[15:8];
assign byte2[7:0] = st_data_b[23:16];
assign byte3[7:0] = st_data_b[31:24];
assign byte4[7:0] = st_data_b[39:32];
assign byte5[7:0] = st_data_b[47:40];
assign byte6[7:0] = st_data_b[55:48];
assign byte7[7:0] = st_data_b[63:56];

// Replicate data of size <64b to fill the line.

lsu_sbd_dp_mux_macro__mux_aonpe__ports_8__stack_32c__width_32 mx_ie0_0      (
	.din0	({byte4[7:0],byte5[7:0],byte6[7:0],byte7[7:0]}),
	.din1	({byte0[7:0],byte1[7:0],byte2[7:0],byte3[7:0]}),
	.din2	({byte7[7:0],byte6[7:0],byte5[7:0],byte4[7:0]}),
	.din3	({byte0[7:0],byte1[7:0],byte2[7:0],byte3[7:0]}),
	.din4	({byte3[7:0],byte2[7:0],byte1[7:0],byte0[7:0]}),
	.din5	({byte0[7:0],byte1[7:0],byte0[7:0],byte1[7:0]}),
	.din6	({byte1[7:0],byte0[7:0],byte1[7:0],byte0[7:0]}),
	.din7	({byte0[7:0],byte0[7:0],byte0[7:0],byte0[7:0]}),
	.sel0	(sec_st_sz_dw_std_le_b),
	.sel1	(sec_st_sz_dw_le_not_ie_b),
	.sel2	(sec_st_sz_dw_be_not_ie_b),
	.sel3	(sec_st_sz_word_le_not_ie_b),
	.sel4	(sec_st_sz_word_be_not_ie_b),
	.sel5	(sec_st_sz_hw_le_not_ie_b),
	.sel6	(sec_st_sz_hw_be_not_ie_b),
	.sel7	(sec_st_sz_byte_b),
	.dout	(st_data_ie0_b[63:32])
);

lsu_sbd_dp_mux_macro__mux_aonpe__ports_8__stack_32c__width_32 mx_ie0_1      (
	.din0	({byte0[7:0],byte1[7:0],byte2[7:0],byte3[7:0]}),
	.din1	({byte4[7:0],byte5[7:0],byte6[7:0],byte7[7:0]}),
	.din2	({byte3[7:0],byte2[7:0],byte1[7:0],byte0[7:0]}),
	.din3	({byte0[7:0],byte1[7:0],byte2[7:0],byte3[7:0]}),
	.din4	({byte3[7:0],byte2[7:0],byte1[7:0],byte0[7:0]}),
	.din5	({byte0[7:0],byte1[7:0],byte0[7:0],byte1[7:0]}),
	.din6	({byte1[7:0],byte0[7:0],byte1[7:0],byte0[7:0]}),
	.din7	({byte0[7:0],byte0[7:0],byte0[7:0],byte0[7:0]}),
	.sel0	(sec_st_sz_dw_std_le_b),
	.sel1	(sec_st_sz_dw_le_not_ie_b),
	.sel2	(sec_st_sz_dw_be_not_ie_b),
	.sel3	(sec_st_sz_word_le_not_ie_b),
	.sel4	(sec_st_sz_word_be_not_ie_b),
	.sel5	(sec_st_sz_hw_le_not_ie_b),
	.sel6	(sec_st_sz_hw_be_not_ie_b),
	.sel7	(sec_st_sz_byte_b),
	.dout	(st_data_ie0_b[31:0])
);

lsu_sbd_dp_mux_macro__mux_aonpe__ports_8__stack_32c__width_32 mx_ie1_0      (
	.din0	({byte4[7:0],byte5[7:0],byte6[7:0],byte7[7:0]}),
	.din1	({byte0[7:0],byte1[7:0],byte2[7:0],byte3[7:0]}),
	.din2	({byte7[7:0],byte6[7:0],byte5[7:0],byte4[7:0]}),
	.din3	({byte0[7:0],byte1[7:0],byte2[7:0],byte3[7:0]}),
	.din4	({byte3[7:0],byte2[7:0],byte1[7:0],byte0[7:0]}),
	.din5	({byte0[7:0],byte1[7:0],byte0[7:0],byte1[7:0]}),
	.din6	({byte1[7:0],byte0[7:0],byte1[7:0],byte0[7:0]}),
	.din7	({byte0[7:0],byte0[7:0],byte0[7:0],byte0[7:0]}),
	.sel0	(sec_st_sz_dw_std_le_b),
	.sel1	(sec_st_sz_dw_le_if_ie_b),
	.sel2	(sec_st_sz_dw_be_if_ie_b),
	.sel3	(sec_st_sz_word_le_if_ie_b),
	.sel4	(sec_st_sz_word_be_if_ie_b),
	.sel5	(sec_st_sz_hw_le_if_ie_b),
	.sel6	(sec_st_sz_hw_be_if_ie_b),
	.sel7	(sec_st_sz_byte_b),
	.dout	(st_data_ie1_b[63:32])
);

lsu_sbd_dp_mux_macro__mux_aonpe__ports_8__stack_32c__width_32 mx_ie1_1      (
	.din0	({byte0[7:0],byte1[7:0],byte2[7:0],byte3[7:0]}),
	.din1	({byte4[7:0],byte5[7:0],byte6[7:0],byte7[7:0]}),
	.din2	({byte3[7:0],byte2[7:0],byte1[7:0],byte0[7:0]}),
	.din3	({byte0[7:0],byte1[7:0],byte2[7:0],byte3[7:0]}),
	.din4	({byte3[7:0],byte2[7:0],byte1[7:0],byte0[7:0]}),
	.din5	({byte0[7:0],byte1[7:0],byte0[7:0],byte1[7:0]}),
	.din6	({byte1[7:0],byte0[7:0],byte1[7:0],byte0[7:0]}),
	.din7	({byte0[7:0],byte0[7:0],byte0[7:0],byte0[7:0]}),
	.sel0	(sec_st_sz_dw_std_le_b),
	.sel1	(sec_st_sz_dw_le_if_ie_b),
	.sel2	(sec_st_sz_dw_be_if_ie_b),
	.sel3	(sec_st_sz_word_le_if_ie_b),
	.sel4	(sec_st_sz_word_be_if_ie_b),
	.sel5	(sec_st_sz_hw_le_if_ie_b),
	.sel6	(sec_st_sz_hw_be_if_ie_b),
	.sel7	(sec_st_sz_byte_b),
	.dout	(st_data_ie1_b[31:0])
);

lsu_sbd_dp_mux_macro__mux_pgpe__ports_2__stack_32c__width_32 mx_endian_0      (
	.din0	(st_data_ie1_b[63:32]),
	.din1	(st_data_ie0_b[63:32]),
	.sel0	(tlb_tte_ie_b),
	.dout	(sbd_st_data_b[63:32])
);
lsu_sbd_dp_mux_macro__mux_pgpe__ports_2__stack_32c__width_32 mx_endian_1      (
	.din0	(st_data_ie1_b[31:0]),
	.din1	(st_data_ie0_b[31:0]),
	.sel0	(tlb_tte_ie_b),
	.dout	(sbd_st_data_b[31:0])
);

lsu_sbd_dp_buff_macro__dbuff_16x__rep_1__stack_32c__width_32 st_data_buf_0    (
	.din	(sbd_st_data_b[63:32]),
	.dout	(sbd_st_data2_b[63:32])
);
lsu_sbd_dp_buff_macro__dbuff_16x__rep_1__stack_32c__width_32 st_data_buf_1    (
	.din	(sbd_st_data_b[31:0]),
	.dout	(sbd_st_data2_b[31:0])
);

lsu_sbd_dp_mux_macro__mux_aope__ports_2__stack_32c__width_32 mx_bist_0      (
	.din0	({4{mbi_wdata[7:0]}}),
	.din1	(sbd_st_data2_b[63:32]),
	.sel0	(mbi_run),
	.dout	(sbd_st_datab_b[63:32])
);
lsu_sbd_dp_mux_macro__mux_aope__ports_2__stack_32c__width_32 mx_bist_1      (
	.din0	({4{mbi_wdata[7:0]}}),
	.din1	(sbd_st_data2_b[31:0]),
	.sel0	(mbi_run),
	.dout	(sbd_st_datab_b[31:0])
);

////////////////////////////////////////////////////////////////////////////////
// Block store address flop and address mux.
// When a block store initiates, load the address in the mux.  With each step of
// the store, increment the address.  Store addresses either come from the tlb
// or from the block store address flop.

lsu_sbd_dp_mux_macro__left_1__mux_aope__ports_4__stack_38l__width_37 sbd_bist_mux       (
	.din0	({{36{1'b0}},1'b1}),
	.din1	({st_addr_b[38:3],1'b0}),
	.din2	({37{mbi_ptag_data}}),
	.din3	({{4{mbi_wdata[7:0]}},mbi_wdata[7:3]}),
	.sel0	(mbi_init_to_zero),
	.sel1	(mbi_cambist_shift),
	.sel2	(mbi_cambist_run),
	.dout	({bist_data[39:3]})
);

// During Lbist, dcc_asi_iomap_m is forced high.  This prevents the tlb_pgnum_crit
// from propagating.
lsu_sbd_dp_mux_macro__dmux_8x__left_1__mux_aope__ports_5__stack_38l__width_37 st_addr_mux        (
	.din0	(bist_data[39:3]),
	.din1	({bst_addr[39:6],sbc_bst_offset[2:0]}),
	.din2	({8'h90,const_cpuid[2:0],dcc_tid_m[2:0],dcc_asi_m[7:0],lsu_va_m[17:3]}),
	.din3	({pre_st_data_m[30:2],lsu_va_m[10:3]}),
	.din4	({tlb_pgnum_crit[39:13],lsu_va_m[12:3]}),
	.sel0	(mbi_run),
	.sel1	(sbc_bst_in_prog_m),
	.sel2	(dcc_asi_iomap_m),
	.sel3	(dcc_cache_diag_wr_m),
	.dout	({st_addr_m[39:3]})
);

assign stb_st_addr_m[39:3] = st_addr_m[39:3];	// to stb_cam

lsu_sbd_dp_msff_macro__left_1__stack_38l__width_37 dff_st_addr    (
	.scan_in(dff_st_addr_scanin),
	.scan_out(dff_st_addr_scanout),
	.din	(st_addr_m[39:3]),
	.dout	(st_addr_b[39:3]),
	.clk	(l2clk),
	.en	(dcs_memref_m),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

lsu_sbd_dp_buff_macro__left_1__rep_1__stack_38l__width_37 st_addr_b_buf    (
	.din	(st_addr_b[39:3]),
	.dout	(sbd_st_addr_b[39:3])
);

lsu_sbd_dp_buff_macro__left_10__rep_1__stack_40c__width_27 stb_st_addr_b_buf    (
	.din	(st_addr_b[39:13]),
	.dout	(stb_st_addr_b[39:13])
);

lsu_sbd_dp_msff_macro__left_4__minbuff_1__stack_38l__width_34 dff_bst_addr      (
	.scan_in(dff_bst_addr_scanin),
	.scan_out(dff_bst_addr_scanout),
	.din	(stb_cam_data[44:11]),
	.dout	(bst_addr[39:6]),
	.clk	(l2clk),
	.en	(sbc_load_bst_addr),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);



// fixscan start:
assign dff_st_data_m_0_scanin    = scan_in                  ;
assign dff_st_data_m_1_scanin    = dff_st_data_m_0_scanout  ;
assign dff_st_data_b_0_scanin    = dff_st_data_m_1_scanout  ;
assign dff_st_data_b_1_scanin    = dff_st_data_b_0_scanout  ;
assign dff_st_addr_scanin        = dff_st_data_b_1_scanout  ;
assign dff_bst_addr_scanin       = dff_st_addr_scanout      ;
assign scan_out                  = dff_bst_addr_scanout     ;
// fixscan end:
endmodule



//
//   buff macro
//
//





module lsu_sbd_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 (
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

module lsu_sbd_dp_msff_macro__mux_aope__ports_2__stack_32c__width_32 (
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
wire [31:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [30:0] so;

  input [31:0] din0;
  input [31:0] din1;
  input sel0;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [31:0] dout;


  output scan_out;




cl_dp1_penc2_8x  c1_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(32)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
.dout(muxout[31:0])
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
dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);




















endmodule









//
//   buff macro
//
//





module lsu_sbd_dp_buff_macro__rep_1__width_2 (
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
//   or macro for ports = 2,3
//
//





module lsu_sbd_dp_or_macro__ports_2__stack_32c__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output [31:0] dout;






or2 #(32)  d0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout[31:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_sbd_dp_mux_macro__mux_aope__ports_4__stack_32c__width_32 (
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

  input [31:0] din0;
  input [31:0] din1;
  input [31:0] din2;
  input [31:0] din3;
  input sel0;
  input sel1;
  input sel2;
  output [31:0] dout;





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

mux4s #(32)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
  .in3(din3[31:0]),
.dout(dout[31:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module lsu_sbd_dp_msff_macro__stack_32c__width_32 (
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
wire [30:0] so;

  input [31:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [31:0] dout;


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
dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);




















endmodule









//
//   buff macro
//
//





module lsu_sbd_dp_buff_macro__rep_1__stack_32c__width_16 (
  din, 
  dout);
  input [15:0] din;
  output [15:0] dout;






buff #(16)  d0_0 (
.in(din[15:0]),
.out(dout[15:0])
);








endmodule





//
//   buff macro
//
//





module lsu_sbd_dp_buff_macro__rep_1__stack_32c__width_32 (
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

module lsu_sbd_dp_mux_macro__mux_aonpe__ports_8__stack_32c__width_32 (
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
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;
wire buffout7;

  input [31:0] din0;
  input sel0;
  input [31:0] din1;
  input sel1;
  input [31:0] din2;
  input sel2;
  input [31:0] din3;
  input sel3;
  input [31:0] din4;
  input sel4;
  input [31:0] din5;
  input sel5;
  input [31:0] din6;
  input sel6;
  input [31:0] din7;
  input sel7;
  output [31:0] dout;





cl_dp1_muxbuff8_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .in6(sel6),
 .in7(sel7),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5),
 .out6(buffout6),
 .out7(buffout7)
);
mux8s #(32)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
  .in3(din3[31:0]),
  .in4(din4[31:0]),
  .in5(din5[31:0]),
  .in6(din6[31:0]),
  .in7(din7[31:0]),
.dout(dout[31:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_sbd_dp_mux_macro__mux_pgpe__ports_2__stack_32c__width_32 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [31:0] din0;
  input [31:0] din1;
  input sel0;
  output [31:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(32)  d0_0 (
  .sel(psel1),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
.dout(dout[31:0])
);









  



endmodule


//
//   buff macro
//
//





module lsu_sbd_dp_buff_macro__dbuff_16x__rep_1__stack_32c__width_32 (
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

module lsu_sbd_dp_mux_macro__mux_aope__ports_2__stack_32c__width_32 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [31:0] din0;
  input [31:0] din1;
  input sel0;
  output [31:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(32)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
.dout(dout[31:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_sbd_dp_mux_macro__left_1__mux_aope__ports_4__stack_38l__width_37 (
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

  input [36:0] din0;
  input [36:0] din1;
  input [36:0] din2;
  input [36:0] din3;
  input sel0;
  input sel1;
  input sel2;
  output [36:0] dout;





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

mux4s #(37)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[36:0]),
  .in1(din1[36:0]),
  .in2(din2[36:0]),
  .in3(din3[36:0]),
.dout(dout[36:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_sbd_dp_mux_macro__dmux_8x__left_1__mux_aope__ports_5__stack_38l__width_37 (
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

  input [36:0] din0;
  input [36:0] din1;
  input [36:0] din2;
  input [36:0] din3;
  input [36:0] din4;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  output [36:0] dout;





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

mux5s #(37)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .in0(din0[36:0]),
  .in1(din1[36:0]),
  .in2(din2[36:0]),
  .in3(din3[36:0]),
  .in4(din4[36:0]),
.dout(dout[36:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module lsu_sbd_dp_msff_macro__left_1__stack_38l__width_37 (
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
wire [35:0] so;

  input [36:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [36:0] dout;


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
dff #(37)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[36:0]),
.si({scan_in,so[35:0]}),
.so({so[35:0],scan_out}),
.q(dout[36:0])
);




















endmodule









//
//   buff macro
//
//





module lsu_sbd_dp_buff_macro__left_1__rep_1__stack_38l__width_37 (
  din, 
  dout);
  input [36:0] din;
  output [36:0] dout;






buff #(37)  d0_0 (
.in(din[36:0]),
.out(dout[36:0])
);








endmodule





//
//   buff macro
//
//





module lsu_sbd_dp_buff_macro__left_10__rep_1__stack_40c__width_27 (
  din, 
  dout);
  input [26:0] din;
  output [26:0] dout;






buff #(27)  d0_0 (
.in(din[26:0]),
.out(dout[26:0])
);








endmodule









// any PARAMS parms go into naming of macro

module lsu_sbd_dp_msff_macro__left_4__minbuff_1__stack_38l__width_34 (
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
wire [32:0] so;

  input [33:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [33:0] dout;


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
dff #(34)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[33:0]),
.si({scan_in,so[32:0]}),
.so({so[32:0],scan_out}),
.q(dout[33:0])
);




















endmodule








