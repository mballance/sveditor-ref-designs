// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mmu_asd_dp.v
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
module mmu_asd_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  tcu_scan_en_wmr, 
  spc_aclk_wmr, 
  wmr_scan_in, 
  thread_group, 
  ase_lsu_va_w, 
  ase_lsu_context_w, 
  asi_mra_rd_en_last, 
  asi_rd_immu_tag_target, 
  asi_rd_immu_tag_access, 
  asi_rd_dmmu_tag_target, 
  asi_rd_dmmu_tag_access, 
  asi_rd_i_access_target, 
  asi_rd_d_access_target, 
  asi_rd_access_target, 
  asi_rd_itte_tag, 
  asi_rd_itte_data, 
  asi_rd_dtte, 
  asi_wr_data, 
  asi_wr_immu_tag_access, 
  asi_i_tag_access_en, 
  asi_wr_itlb_data_in, 
  asi_wr_itlb_data_access, 
  asi_wr_immu_demap, 
  asi_wr_immu_demap_p, 
  asi_wr_immu_demap_n, 
  asi_i_data_in_en, 
  asi_wr_dmmu_tag_access, 
  asi_d_tag_access_en, 
  asi_wr_dtlb_data_in, 
  asi_wr_dtlb_data_access, 
  asi_wr_dmmu_demap, 
  asi_wr_dmmu_demap_p, 
  asi_wr_dmmu_demap_s_n, 
  asi_d_data_in_en, 
  asi_dmmu_demap_s, 
  asi_wr_p_context_0, 
  asi_p_context_0_en, 
  asi_data_in_real, 
  asi_tag_access_sel, 
  asi_mra_wr_data, 
  asi_demap_r_bit, 
  asi_mra_rd_addr_bit_1, 
  asi_rd_tsb_ptr_, 
  mra_data, 
  tlu_pc_w, 
  tlu_load_i_tag_access_p, 
  tlu_load_i_tag_access_n, 
  tlu_load_d_tag_access, 
  tlu_load_d_tag_access_r, 
  htd_tagaccess_din, 
  htd_tlbdatain_din, 
  htc_wr_itlb_data_in, 
  htc_wr_dtlb_data_in, 
  mmu_use_context_0, 
  mmu_use_context_1, 
  mmu_sec_context, 
  scan_out, 
  wmr_scan_out, 
  asd_rd_data, 
  asd_asi_rd_data, 
  asd_dtte_tag, 
  asd_dtte_data, 
  asd_itte_tag_data_, 
  asd_itte_index, 
  asd_iht_p_ctx_0_0, 
  asd_iht_p_ctx_0_1, 
  asd_iht_p_ctx_0_2, 
  asd_iht_p_ctx_0_3, 
  asd_tag_access, 
  asd_zero_context, 
  asd_asi_zero_context, 
  asd_mra_rd_addr_bit_1, 
  asd_pc_w);
wire [3:0] htc_wr_itlb_tag_access;
wire [3:0] htc_wr_dtlb_tag_access;
wire [60:48] wr_data_unused;
wire [12:0] mra_wr_data_unused;
wire clk;
wire stop;
wire pce_ov;
wire se;
wire siclk;
wire soclk;
wire mra_read_1_lat_scanin;
wire mra_read_1_lat_scanout;
wire [81:0] mra_rd_data;
wire mra_read_0_lat_scanin;
wire mra_read_0_lat_scanout;
wire p_context_lat_wmr_scanin;
wire p_context_lat_wmr_scanout;
wire [12:0] p_context_0_3;
wire [12:0] p_context_0_2;
wire [12:0] p_context_0_1;
wire [12:0] p_context_0_0;
wire immu_tag_access_3_lat_wmr_scanin;
wire immu_tag_access_3_lat_wmr_scanout;
wire [47:0] immu_tag_access_3;
wire immu_tag_access_2_lat_wmr_scanin;
wire immu_tag_access_2_lat_wmr_scanout;
wire [47:0] immu_tag_access_2;
wire immu_tag_access_1_lat_wmr_scanin;
wire immu_tag_access_1_lat_wmr_scanout;
wire [47:0] immu_tag_access_1;
wire immu_tag_access_0_lat_wmr_scanin;
wire immu_tag_access_0_lat_wmr_scanout;
wire [47:0] immu_tag_access_0;
wire [61:0] immu_access_target;
wire dmmu_tag_access_3_lat_wmr_scanin;
wire dmmu_tag_access_3_lat_wmr_scanout;
wire [47:0] dmmu_tag_access_3;
wire dmmu_tag_access_2_lat_wmr_scanin;
wire dmmu_tag_access_2_lat_wmr_scanout;
wire [47:0] dmmu_tag_access_2;
wire dmmu_tag_access_1_lat_wmr_scanin;
wire dmmu_tag_access_1_lat_wmr_scanout;
wire [47:0] dmmu_tag_access_1;
wire dmmu_tag_access_0_lat_wmr_scanin;
wire dmmu_tag_access_0_lat_wmr_scanout;
wire [47:0] dmmu_tag_access_0;
wire [61:0] dmmu_access_target;
wire [47:0] tag_access;
wire [2:0] tag_access_sel;
wire zero_context;
wire bit1;
wire asi_rd_mux_scanin;
wire asi_rd_mux_scanout;
wire [48:0] itlb_data_in_0;
wire [48:0] itlb_data_in_1;
wire [48:0] itlb_data_in_2;
wire [48:0] itlb_data_in_3;
wire [50:0] dtlb_data_in_0;
wire [50:0] dtlb_data_in_1;
wire [50:0] dtlb_data_in_2;
wire [50:0] dtlb_data_in_3;
wire itlb_ps_eq_256m_0;
wire itlb_ps_eq_256m_1;
wire itlb_ps_eq_256m_2;
wire itlb_ps_eq_256m_3;
wire dtlb_ps_eq_256m_0;
wire dtlb_ps_eq_256m_1;
wire dtlb_ps_eq_256m_2;
wire dtlb_ps_eq_256m_3;
wire itlb_ps_gt_64k_0;
wire itlb_ps_gt_64k_1;
wire itlb_ps_gt_64k_2;
wire itlb_ps_gt_64k_3;
wire dtlb_ps_gt_64k_0;
wire dtlb_ps_gt_64k_1;
wire dtlb_ps_gt_64k_2;
wire dtlb_ps_gt_64k_3;
wire itlb_ps_gt_8k_0;
wire itlb_ps_gt_8k_1;
wire itlb_ps_gt_8k_2;
wire itlb_ps_gt_8k_3;
wire dtlb_ps_gt_8k_0;
wire dtlb_ps_gt_8k_1;
wire dtlb_ps_gt_8k_2;
wire dtlb_ps_gt_8k_3;
wire [47:0] itte_tag;
wire [47:0] dtte_tag;
wire [38:0] data_in;
wire itlb_data_in_3_lat_scanin;
wire itlb_data_in_3_lat_scanout;
wire itlb_data_in_2_lat_scanin;
wire itlb_data_in_2_lat_scanout;
wire itlb_data_in_1_lat_scanin;
wire itlb_data_in_1_lat_scanout;
wire itlb_data_in_0_lat_scanin;
wire itlb_data_in_0_lat_scanout;
wire dtlb_data_in_3_lat_scanin;
wire dtlb_data_in_3_lat_scanout;
wire dtlb_data_in_2_lat_scanin;
wire dtlb_data_in_2_lat_scanout;
wire dtlb_data_in_1_lat_scanin;
wire dtlb_data_in_1_lat_scanout;
wire dtlb_data_in_0_lat_scanin;
wire dtlb_data_in_0_lat_scanout;
wire [45:0] itte_data;
wire [54:0] dtte_data;



input		l2clk;
input 		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;

input		tcu_scan_en_wmr;
input 		spc_aclk_wmr;		// Warm reset (non)scan
input		wmr_scan_in;

input 		thread_group;

input	[47:13]	ase_lsu_va_w;
input	[12:0]	ase_lsu_context_w;

input 		asi_mra_rd_en_last;

input	[3:0]	asi_rd_immu_tag_target;
input	[3:0]	asi_rd_immu_tag_access;
input	[3:0]	asi_rd_dmmu_tag_target;
input	[3:0]	asi_rd_dmmu_tag_access;
input		asi_rd_i_access_target;
input		asi_rd_d_access_target;
input		asi_rd_access_target;
input	[3:0]	asi_rd_itte_tag;
input	[3:0]	asi_rd_itte_data;
input	[2:0]	asi_rd_dtte;

input 	[63:0]	asi_wr_data;
input	[3:0]	asi_wr_immu_tag_access;
input	[3:0] asi_i_tag_access_en;
input	[3:0]	asi_wr_itlb_data_in;
input	[3:0]	asi_wr_itlb_data_access;
input	[3:0]	asi_wr_immu_demap;
input	[3:0]	asi_wr_immu_demap_p;
input	[3:0]	asi_wr_immu_demap_n;
input	[3:0] asi_i_data_in_en;
input	[3:0]	asi_wr_dmmu_tag_access;
input	[3:0] asi_d_tag_access_en;
input	[3:0]	asi_wr_dtlb_data_in;
input	[3:0]	asi_wr_dtlb_data_access;
input	[3:0]	asi_wr_dmmu_demap;
input	[3:0]	asi_wr_dmmu_demap_p;
input	[3:0]	asi_wr_dmmu_demap_s_n;
input	[3:0] asi_d_data_in_en;
input		asi_dmmu_demap_s;
input	[3:0]	asi_wr_p_context_0;
input		asi_p_context_0_en;
input 		asi_data_in_real;
input	[2:0]	asi_tag_access_sel;

input	[39:0]	asi_mra_wr_data;
input 		asi_demap_r_bit;

input 		asi_mra_rd_addr_bit_1;
input 		asi_rd_tsb_ptr_;

input 	[81:0]	mra_data;

input	[47:13]	tlu_pc_w;
input 	[3:0]	tlu_load_i_tag_access_p;
input 	[3:0]	tlu_load_i_tag_access_n;
input 	[3:0]	tlu_load_d_tag_access;
input 	[3:0]	tlu_load_d_tag_access_r;

input   [47:0] htd_tagaccess_din;
input   [38:0] htd_tlbdatain_din;
input   [3:0] htc_wr_itlb_data_in;
input   [3:0] htc_wr_dtlb_data_in;

input		mmu_use_context_0;	// HW TW:  Replace TTE ctxt with ctxt 0
input		mmu_use_context_1;	// HW TW:  Replace TTE ctxt with ctxt 1
input		mmu_sec_context;	// HW TW:  Replace TTE ctxt with secon. 

output 		scan_out;

output		wmr_scan_out;		// Warm reset (non)scan

output	[81:0]	asd_rd_data;

output	[63:0]	asd_asi_rd_data;

output	[47:0]	asd_dtte_tag;
output	[54:0]	asd_dtte_data;
output	[47:0]	asd_itte_tag_data_;
output	[6:0]	asd_itte_index;

output	[12:0]	asd_iht_p_ctx_0_0;
output	[12:0]	asd_iht_p_ctx_0_1;
output	[12:0]	asd_iht_p_ctx_0_2;
output	[12:0]	asd_iht_p_ctx_0_3;

output	[47:0]	asd_tag_access;
output		asd_zero_context;
output		asd_asi_zero_context;

output		asd_mra_rd_addr_bit_1;

output	[47:13]	asd_pc_w;	// Needs to feed mmu_htd_dp




//////////////////////////////////////////////////////////////////////////////
assign htc_wr_itlb_tag_access[3:0] =
       htc_wr_itlb_data_in[3:0];

assign htc_wr_dtlb_tag_access[3:0] =
       htc_wr_dtlb_data_in[3:0];

assign wr_data_unused[60:48] =
       asi_wr_data[60:48];

assign mra_wr_data_unused[12:10] =
       asi_mra_wr_data[12:10];

assign mra_wr_data_unused[2:0] =
       asi_mra_wr_data[2:0];



//////////////////////////////////////////////////////////////////////

assign clk	= l2clk;
assign stop	= 1'b0;

mmu_asd_dp_buff_macro__width_4 clk_control_buf  (
	.din	({tcu_pce_ov		       ,
		  tcu_scan_en		       ,
		  spc_aclk		       ,
		  spc_bclk		       }),
	.dout	({pce_ov		       ,
		  se			       ,
		  siclk			       ,
		  soclk			       })
);



//////////////////////////////////////////////////////////////////////
//
// Capture read data from mra
//

mmu_asd_dp_msff_macro__minbuff_1__stack_58c__width_24 mra_read_1_lat    (
	.scan_in(mra_read_1_lat_scanin),
	.scan_out(mra_read_1_lat_scanout),
	.en	(asi_mra_rd_en_last		),
	.din	(mra_data		[81:58]),
	.dout	(mra_rd_data		[81:58]),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_asd_dp_msff_macro__minbuff_1__stack_58c__width_58 mra_read_0_lat    (
	.scan_in(mra_read_0_lat_scanin),
	.scan_out(mra_read_0_lat_scanout),
	.en	(asi_mra_rd_en_last		),
	.din	(mra_data		[57:0]	),
	.dout	(mra_rd_data		[57:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign asd_rd_data[81:0] = 
       mra_rd_data[81:0];



//////////////////////////////////////////////////////////////////////
//
// Individual registers
//

// Shadow copy of p_context_0 for tag_access regs
mmu_asd_dp_msff_macro__mux_aonpe__ports_4__stack_58c__width_52 p_context_lat     (
	.scan_in(p_context_lat_wmr_scanin),
	.scan_out(p_context_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({p_context_0_3		[12:0],
		  p_context_0_2		[12:0],
		  p_context_0_1		[12:0],
		  asi_wr_data		[12:0]}),
	.din1	({p_context_0_3		[12:0],
		  p_context_0_2		[12:0],
		  asi_wr_data		[12:0],
		  p_context_0_0		[12:0]}),	
	.din2	({p_context_0_3		[12:0],
		  asi_wr_data		[12:0],
		  p_context_0_1		[12:0],
		  p_context_0_0		[12:0]}),
	.din3	({asi_wr_data		[12:0],
		  p_context_0_2		[12:0],
		  p_context_0_1		[12:0],
		  p_context_0_0		[12:0]}),
	.sel0	(asi_wr_p_context_0	[0   ]	),
	.sel1	(asi_wr_p_context_0	[1   ]	),
	.sel2	(asi_wr_p_context_0	[2   ]	),
	.sel3	(asi_wr_p_context_0	[3   ]	),
	.en	(asi_p_context_0_en		),
	.dout	({p_context_0_3		[12:0],
		  p_context_0_2		[12:0],
		  p_context_0_1		[12:0],
		  p_context_0_0		[12:0]}),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_asd_dp_buff_macro__left_13__stack_58c__width_35 pc_w_buf    (
	.din	(tlu_pc_w		[47:13]	),
	.dout	(asd_pc_w		[47:13]	)
);

mmu_asd_dp_msff_macro__mux_aope__ports_7__stack_58c__width_48 immu_tag_access_3_lat     (
	.scan_in(immu_tag_access_3_lat_wmr_scanin),
	.scan_out(immu_tag_access_3_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({asd_pc_w		[47:13],
		  p_context_0_3		[12:0]}),
	.din1	({asd_pc_w		[47:13],
		  {13 {1'b0}}		       }),
	.din2	(asi_wr_data		[47:0]	),
	.din3	({asi_wr_data		[47:40],   // Demap VA[47:40] in data
		  asi_mra_wr_data	[39:13],   
		  p_context_0_3		[12:0]}),
	.din4	({asi_wr_data		[47:40],   // Demap VA[47:40] in data
		  asi_mra_wr_data	[39:13],
		  {13 {1'b0}}		       }),
	.din5	(htd_tagaccess_din	[47:0]	),
	.din6	(immu_tag_access_3	[47:0]	),
	.sel0	(tlu_load_i_tag_access_p[3   ]	),
	.sel1	(tlu_load_i_tag_access_n[3   ]	),
	.sel2	(asi_wr_immu_tag_access	[3   ]	),
	.sel3	(asi_wr_immu_demap_p	[3   ]	),
	.sel4	(asi_wr_immu_demap_n	[3   ]	),
	.sel5	(htc_wr_itlb_tag_access	[3   ]	), // HWTW Write ITLB Tag Access
	.en	(asi_i_tag_access_en	[3   ]	),
	.dout	(immu_tag_access_3	[47:0]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_asd_dp_msff_macro__mux_aope__ports_7__stack_58c__width_48 immu_tag_access_2_lat     (
	.scan_in(immu_tag_access_2_lat_wmr_scanin),
	.scan_out(immu_tag_access_2_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({asd_pc_w		[47:13],
		  p_context_0_2		[12:0]}),
	.din1	({asd_pc_w		[47:13],
		  {13 {1'b0}}		       }),
	.din2	(asi_wr_data		[47:0]	),
	.din3	({asi_wr_data		[47:40],   // Demap VA[47:40] in data
		  asi_mra_wr_data	[39:13],
		  p_context_0_2		[12:0]}),
	.din4	({asi_wr_data		[47:40],   // Demap VA[47:40] in data
		  asi_mra_wr_data	[39:13],
		  {13 {1'b0}}		       }),
	.din5	(htd_tagaccess_din	[47:0]	),
	.din6	(immu_tag_access_2	[47:0]	),
	.sel0	(tlu_load_i_tag_access_p[2   ]	),
	.sel1	(tlu_load_i_tag_access_n[2   ]	),
	.sel2	(asi_wr_immu_tag_access	[2   ]	),
	.sel3	(asi_wr_immu_demap_p	[2   ]	),
	.sel4	(asi_wr_immu_demap_n	[2   ]	),
	.sel5	(htc_wr_itlb_tag_access	[2   ]	), // HWTW Write ITLB Tag Access
	.en	(asi_i_tag_access_en	[2   ]	),
	.dout	(immu_tag_access_2	[47:0]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_asd_dp_msff_macro__mux_aope__ports_7__stack_58c__width_48 immu_tag_access_1_lat     (
	.scan_in(immu_tag_access_1_lat_wmr_scanin),
	.scan_out(immu_tag_access_1_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({asd_pc_w		[47:13],
		  p_context_0_1		[12:0]}),
	.din1	({asd_pc_w		[47:13],
		  {13 {1'b0}}		       }),
	.din2	(asi_wr_data		[47:0]	),
	.din3	({asi_wr_data		[47:40],   // Demap VA[47:40] in data
		  asi_mra_wr_data	[39:13],
		  p_context_0_1		[12:0]}),
	.din4	({asi_wr_data		[47:40],   // Demap VA[47:40] in data
		  asi_mra_wr_data	[39:13],
		  {13 {1'b0}}		       }),
	.din5	(htd_tagaccess_din	[47:0]	),
	.din6	(immu_tag_access_1	[47:0]	),
	.sel0	(tlu_load_i_tag_access_p[1   ]	),
	.sel1	(tlu_load_i_tag_access_n[1   ]	),
	.sel2	(asi_wr_immu_tag_access	[1   ]	),
	.sel3	(asi_wr_immu_demap_p	[1   ]	),
	.sel4	(asi_wr_immu_demap_n	[1   ]	),
	.sel5	(htc_wr_itlb_tag_access	[1   ]	), // HWTW Write ITLB Tag Access
	.en	(asi_i_tag_access_en	[1   ]	),
	.dout	(immu_tag_access_1	[47:0]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_asd_dp_msff_macro__mux_aope__ports_7__stack_58c__width_48 immu_tag_access_0_lat     ( 
	.scan_in(immu_tag_access_0_lat_wmr_scanin),
	.scan_out(immu_tag_access_0_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({asd_pc_w		[47:13],
		  p_context_0_0		[12:0]}),
	.din1	({asd_pc_w		[47:13],
		  {13 {1'b0}}		       }),
	.din2	(asi_wr_data		[47:0]	),
	.din3	({asi_wr_data		[47:40],   // Demap VA[47:40] in data
		  asi_mra_wr_data	[39:13],
		  p_context_0_0		[12:0]}),
	.din4	({asi_wr_data		[47:40],   // Demap VA[47:40] in data
		  asi_mra_wr_data	[39:13],
		  {13 {1'b0}}		       }),
	.din5	(htd_tagaccess_din	[47:0]	),
	.din6	(immu_tag_access_0	[47:0]	),
	.sel0	(tlu_load_i_tag_access_p[0   ]	),
	.sel1	(tlu_load_i_tag_access_n[0   ]	),
	.sel2	(asi_wr_immu_tag_access	[0   ]	),
	.sel3	(asi_wr_immu_demap_p	[0   ]	),
	.sel4	(asi_wr_immu_demap_n	[0   ]	),
	.sel5	(htc_wr_itlb_tag_access	[0   ]	), // HWTW Write ITLB Tag Access
	.en	(asi_i_tag_access_en	[0   ]	),
	.dout	(immu_tag_access_0	[47:0]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_asd_dp_mux_macro__mux_aonpe__ports_8__width_62 immu_access_target_mux    (
	.din0	({{14 {immu_tag_access_0[47 ]}},
		  immu_tag_access_0	[47:0]}),
	.din1	({{14 {immu_tag_access_1[47 ]}},
		  immu_tag_access_1	[47:0]}),
	.din2	({{14 {immu_tag_access_2[47 ]}},
		  immu_tag_access_2	[47:0]}),
	.din3	({{14 {immu_tag_access_3[47 ]}},
		  immu_tag_access_3	[47:0]}),
	.din4	({1'b0			       ,
		  immu_tag_access_0	[12:0],
		  {6 {1'b0}}		       ,
		  {16 {immu_tag_access_0[47 ]}},
		  immu_tag_access_0	[47:22]}),  // tag target
	.din5	({1'b0			       ,
		  immu_tag_access_1	[12:0],
		  {6 {1'b0}}		       ,
		  {16 {immu_tag_access_1[47 ]}},
		  immu_tag_access_1	[47:22]}),  // tag target
	.din6	({1'b0			       ,
		  immu_tag_access_2	[12:0],
		  {6 {1'b0}}		       ,
		  {16 {immu_tag_access_2[47 ]}},
		  immu_tag_access_2	[47:22]}),  // tag target
	.din7	({1'b0			       ,
		  immu_tag_access_3	[12:0],
		  {6 {1'b0}}		       ,
		  {16 {immu_tag_access_3[47 ]}},
		  immu_tag_access_3	[47:22]}),  // tag target
	.sel0	(asi_rd_immu_tag_access	[0   ]	),
	.sel1	(asi_rd_immu_tag_access	[1   ]	),
	.sel2	(asi_rd_immu_tag_access	[2   ]	),
	.sel3	(asi_rd_immu_tag_access	[3   ]	),
	.sel4	(asi_rd_immu_tag_target	[0   ]	),
	.sel5	(asi_rd_immu_tag_target	[1   ]	),
	.sel6	(asi_rd_immu_tag_target	[2   ]	),
	.sel7	(asi_rd_immu_tag_target	[3   ]	),
	.dout	(immu_access_target	[61:0]	)
);

mmu_asd_dp_msff_macro__mux_aope__ports_7__stack_58c__width_48 dmmu_tag_access_3_lat     ( 
	.scan_in(dmmu_tag_access_3_lat_wmr_scanin),
	.scan_out(dmmu_tag_access_3_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({ase_lsu_va_w		[47:13],
		  ase_lsu_context_w	[12:0]}),
	.din1	({ase_lsu_va_w		[47:13],
		  {13 {1'b0}}		       }),
	.din2	(asi_wr_data		[47:0]	),
	.din3	({asi_wr_data		[47:40],   // Demap VA[47:40] in data
		  asi_mra_wr_data	[39:13],
		  p_context_0_3		[12:0]}),
	.din4	({asi_wr_data		[47:40],   // Demap VA[47:40] in data
		  asi_mra_wr_data	[39:13],
		  {13 {1'b0}}		       }),
	.din5	(htd_tagaccess_din	[47:0]	),
	.din6	(dmmu_tag_access_3	[47:0]	),
	.sel0	(tlu_load_d_tag_access	[3   ]	),
	.sel1	(tlu_load_d_tag_access_r[3   ]	),
	.sel2	(asi_wr_dmmu_tag_access	[3   ]	),
	.sel3	(asi_wr_dmmu_demap_p	[3   ]	),
	.sel4	(asi_wr_dmmu_demap_s_n	[3   ]	),
	.sel5	(htc_wr_dtlb_tag_access	[3   ]	), //HWTW Write DTLB Tag Access
	.en	(asi_d_tag_access_en	[3   ]	),
	.dout	(dmmu_tag_access_3	[47:0]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_asd_dp_msff_macro__mux_aope__ports_7__stack_58c__width_48 dmmu_tag_access_2_lat     ( 
	.scan_in(dmmu_tag_access_2_lat_wmr_scanin),
	.scan_out(dmmu_tag_access_2_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({ase_lsu_va_w		[47:13],
		  ase_lsu_context_w	[12:0]}),
	.din1	({ase_lsu_va_w		[47:13],
		  {13 {1'b0}}		       }),
	.din2	(asi_wr_data		[47:0]	),
	.din3	({asi_wr_data		[47:40],   // Demap VA[47:40] in data
		  asi_mra_wr_data	[39:13],
		  p_context_0_2		[12:0]}),
	.din4	({asi_wr_data		[47:40],   // Demap VA[47:40] in data
		  asi_mra_wr_data	[39:13],
		  {13 {1'b0}}		       }),
	.din5	(htd_tagaccess_din	[47:0]	),
	.din6	(dmmu_tag_access_2	[47:0]	),
	.sel0	(tlu_load_d_tag_access	[2   ]	),
	.sel1	(tlu_load_d_tag_access_r[2   ]	),
	.sel2	(asi_wr_dmmu_tag_access	[2   ]	),
	.sel3	(asi_wr_dmmu_demap_p	[2   ]	),
	.sel4	(asi_wr_dmmu_demap_s_n	[2   ]	),
	.sel5	(htc_wr_dtlb_tag_access	[2   ]	), //HWTW Write DTLB Tag Access
	.en	(asi_d_tag_access_en	[2   ]	),
	.dout	(dmmu_tag_access_2	[47:0]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_asd_dp_msff_macro__mux_aope__ports_7__stack_58c__width_48 dmmu_tag_access_1_lat     ( 
	.scan_in(dmmu_tag_access_1_lat_wmr_scanin),
	.scan_out(dmmu_tag_access_1_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({ase_lsu_va_w		[47:13],
		  ase_lsu_context_w	[12:0]}),
	.din1	({ase_lsu_va_w		[47:13],
		  {13 {1'b0}}		       }),
	.din2	(asi_wr_data		[47:0]	),
	.din3	({asi_wr_data		[47:40],   // Demap VA[47:40] in data
		  asi_mra_wr_data	[39:13],
		  p_context_0_1		[12:0]}),
	.din4	({asi_wr_data		[47:40],   // Demap VA[47:40] in data
		  asi_mra_wr_data	[39:13],
		  {13 {1'b0}}		       }),
	.din5	(htd_tagaccess_din	[47:0]	),
	.din6	(dmmu_tag_access_1	[47:0]	),
	.sel0	(tlu_load_d_tag_access	[1   ]	),
	.sel1	(tlu_load_d_tag_access_r[1   ]	),
	.sel2	(asi_wr_dmmu_tag_access	[1   ]	),
	.sel3	(asi_wr_dmmu_demap_p	[1   ]	),
	.sel4	(asi_wr_dmmu_demap_s_n	[1   ]	),
	.sel5	(htc_wr_dtlb_tag_access	[1   ]	), //HWTW Write DTLB Tag Access
	.en	(asi_d_tag_access_en	[1   ]	),
	.dout	(dmmu_tag_access_1	[47:0]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_asd_dp_msff_macro__mux_aope__ports_7__stack_58c__width_48 dmmu_tag_access_0_lat     ( 
	.scan_in(dmmu_tag_access_0_lat_wmr_scanin),
	.scan_out(dmmu_tag_access_0_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({ase_lsu_va_w		[47:13],
		  ase_lsu_context_w	[12:0]}),
	.din1	({ase_lsu_va_w		[47:13],
		  {13 {1'b0}}		       }),
	.din2	(asi_wr_data		[47:0]	),
	.din3	({asi_wr_data		[47:40],   // Demap VA[47:40] in data
		  asi_mra_wr_data	[39:13],
		  p_context_0_0		[12:0]}),
	.din4	({asi_wr_data		[47:40],   // Demap VA[47:40] in data
		  asi_mra_wr_data	[39:13],
		  {13 {1'b0}}		       }),
	.din5	(htd_tagaccess_din	[47:0]	),
	.din6	(dmmu_tag_access_0	[47:0]	),
	.sel0	(tlu_load_d_tag_access	[0   ]	),
	.sel1	(tlu_load_d_tag_access_r[0   ]	),
	.sel2	(asi_wr_dmmu_tag_access	[0   ]	),
	.sel3	(asi_wr_dmmu_demap_p	[0   ]	),
	.sel4	(asi_wr_dmmu_demap_s_n	[0   ]	),
	.sel5	(htc_wr_dtlb_tag_access	[0   ]	), //HWTW Write DTLB Tag Access
	.en	(asi_d_tag_access_en	[0   ]	),
	.dout	(dmmu_tag_access_0	[47:0]	),
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_asd_dp_mux_macro__mux_aonpe__ports_8__width_62 dmmu_access_target_mux    (
	.din0	({{14 {dmmu_tag_access_0[47 ]}},
		  dmmu_tag_access_0	[47:0]}),
	.din1	({{14 {dmmu_tag_access_1[47 ]}},
		  dmmu_tag_access_1	[47:0]}),
	.din2	({{14 {dmmu_tag_access_2[47 ]}},
		  dmmu_tag_access_2	[47:0]}),
	.din3	({{14 {dmmu_tag_access_3[47 ]}},
		  dmmu_tag_access_3	[47:0]}),
	.din4	({1'b0			       ,
		  dmmu_tag_access_0	[12:0],
		  {6 {1'b0}}		       ,
		  {16 {dmmu_tag_access_0[47 ]}},
		  dmmu_tag_access_0	[47:22]}),  // tag target
	.din5	({1'b0			       ,
		  dmmu_tag_access_1	[12:0],
		  {6 {1'b0}}		       ,
		  {16 {dmmu_tag_access_1[47 ]}},
		  dmmu_tag_access_1	[47:22]}),  // tag target
	.din6	({1'b0			       ,
		  dmmu_tag_access_2	[12:0],
		  {6 {1'b0}}		       ,
		  {16 {dmmu_tag_access_2[47 ]}},
		  dmmu_tag_access_2	[47:22]}),  // tag target
	.din7	({1'b0			       ,
		  dmmu_tag_access_3	[12:0],
		  {6 {1'b0}}		       ,
		  {16 {dmmu_tag_access_3[47 ]}},
		  dmmu_tag_access_3	[47:22]}),  // tag target
	.sel0	(asi_rd_dmmu_tag_access	[0   ]	),
	.sel1	(asi_rd_dmmu_tag_access	[1   ]	),
	.sel2	(asi_rd_dmmu_tag_access	[2   ]	),
	.sel3	(asi_rd_dmmu_tag_access	[3   ]	),
	.sel4	(asi_rd_dmmu_tag_target	[0   ]	),
	.sel5	(asi_rd_dmmu_tag_target	[1   ]	),
	.sel6	(asi_rd_dmmu_tag_target	[2   ]	),
	.sel7	(asi_rd_dmmu_tag_target	[3   ]	),
	.dout	(dmmu_access_target	[61:0]	)
);

mmu_asd_dp_mux_macro__mux_aodec__ports_8__stack_58c__width_13 tag_access_crit_mux     (
	.din0	(immu_tag_access_0	[12:0]	),
	.din1	(immu_tag_access_1	[12:0]	),
	.din2	(immu_tag_access_2	[12:0]	),
	.din3	(immu_tag_access_3	[12:0]	),
	.din4	(dmmu_tag_access_0	[12:0]	),
	.din5	(dmmu_tag_access_1	[12:0]	),
	.din6	(dmmu_tag_access_2	[12:0]	),
	.din7	(dmmu_tag_access_3	[12:0]	),
	.sel	(asi_tag_access_sel	[2:0]	),
	.dout	(tag_access		[12:0]	)
);

mmu_asd_dp_buff_macro__stack_58c__width_3 tag_access_sel_buf   (
	.din	(asi_tag_access_sel	[2:0]	),
	.dout	(tag_access_sel		[2:0]	)
);
mmu_asd_dp_mux_macro__left_13__mux_aodec__ports_8__stack_58c__width_35 tag_access_mux      (
	.din0	(immu_tag_access_0	[47:13]	),
	.din1	(immu_tag_access_1	[47:13]	),
	.din2	(immu_tag_access_2	[47:13]	),
	.din3	(immu_tag_access_3	[47:13]	),
	.din4	(dmmu_tag_access_0	[47:13]	),
	.din5	(dmmu_tag_access_1	[47:13]	),
	.din6	(dmmu_tag_access_2	[47:13]	),
	.din7	(dmmu_tag_access_3	[47:13]	),
	.sel	(tag_access_sel		[2:0]	),
	.dout	(tag_access		[47:13]	)
);

mmu_asd_dp_buff_macro__rep_1__stack_58c__width_48 tag_access_buf    (
	.din	(tag_access		[47:0]	),
	.dout	(asd_tag_access		[47:0]	)
);

mmu_asd_dp_zero_macro__width_16 zero_context_cmp  (
	.din	({{3 {1'b0}},
		  tag_access		[12:0]}),
	.dout	(zero_context			)
);

mmu_asd_dp_nor_macro__ports_2__width_1 bit1_nor   (
	.din0	(zero_context			),
	.din1	(asi_rd_tsb_ptr_		),
	.dout	(bit1				)
);

mmu_asd_dp_or_macro__ports_2__width_1 bit1_or   (
	.din0	(bit1				),
	.din1	(asi_mra_rd_addr_bit_1		),
	.dout	(asd_mra_rd_addr_bit_1		)
);

mmu_asd_dp_buff_macro__rep_1__width_2 zero_context_buf   (
	.din	({2 {zero_context	      }}),
	.dout	({asd_zero_context	       ,
		  asd_asi_zero_context	       })
);

mmu_asd_dp_msff_macro__mux_aonpe__ports_2__width_62 asi_rd_mux    (
	.scan_in(asi_rd_mux_scanin),
	.scan_out(asi_rd_mux_scanout),
	.din0	(immu_access_target	[61:0]	),
	.din1	(dmmu_access_target	[61:0]	),
	.sel0	(asi_rd_i_access_target		),
	.sel1	(asi_rd_d_access_target		),
	.en	(asi_rd_access_target		),
	.dout	(asd_asi_rd_data	[61:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign asd_asi_rd_data[63:62] =
       {2 {asd_asi_rd_data[61]}};

mmu_asd_dp_and_macro__ports_2__stack_58c__width_8 ps_eq_256m_and    (
	.din0	({itlb_data_in_0	[2   ],
		  itlb_data_in_1	[2   ],
		  itlb_data_in_2	[2   ],
		  itlb_data_in_3	[2   ],
		  dtlb_data_in_0	[2   ],
		  dtlb_data_in_1	[2   ],
		  dtlb_data_in_2	[2   ],
		  dtlb_data_in_3	[2   ]}),
	.din1	({itlb_data_in_0	[0   ],
		  itlb_data_in_1	[0   ],
		  itlb_data_in_2	[0   ],
		  itlb_data_in_3	[0   ],
		  dtlb_data_in_0	[0   ],
		  dtlb_data_in_1	[0   ],
		  dtlb_data_in_2	[0   ],
		  dtlb_data_in_3	[0   ]}),
	.dout	({itlb_ps_eq_256m_0	       ,
		  itlb_ps_eq_256m_1	       ,
		  itlb_ps_eq_256m_2	       ,
		  itlb_ps_eq_256m_3	       ,
		  dtlb_ps_eq_256m_0	       ,
		  dtlb_ps_eq_256m_1	       ,
		  dtlb_ps_eq_256m_2	       ,
		  dtlb_ps_eq_256m_3	       })
);

mmu_asd_dp_or_macro__ports_2__stack_58c__width_8 ps_gt_64k_or    (
	.din0	({itlb_data_in_0	[2   ],
		  itlb_data_in_1	[2   ],
		  itlb_data_in_2	[2   ],
		  itlb_data_in_3	[2   ],
		  dtlb_data_in_0	[2   ],
		  dtlb_data_in_1	[2   ],
		  dtlb_data_in_2	[2   ],
		  dtlb_data_in_3	[2   ]}),
	.din1	({itlb_data_in_0	[1   ],
		  itlb_data_in_1	[1   ],
		  itlb_data_in_2	[1   ],
		  itlb_data_in_3	[1   ],
		  dtlb_data_in_0	[1   ],
		  dtlb_data_in_1	[1   ],
		  dtlb_data_in_2	[1   ],
		  dtlb_data_in_3	[1   ]}),
	.dout	({itlb_ps_gt_64k_0	       ,
		  itlb_ps_gt_64k_1	       ,
		  itlb_ps_gt_64k_2	       ,
		  itlb_ps_gt_64k_3	       ,
		  dtlb_ps_gt_64k_0	       ,
		  dtlb_ps_gt_64k_1	       ,
		  dtlb_ps_gt_64k_2	       ,
		  dtlb_ps_gt_64k_3	       })
);

mmu_asd_dp_or_macro__ports_3__stack_58c__width_8 ps_gt_8k_or    (
	.din0	({itlb_data_in_0	[2   ],
		  itlb_data_in_1	[2   ],
		  itlb_data_in_2	[2   ],
		  itlb_data_in_3	[2   ],
		  dtlb_data_in_0	[2   ],
		  dtlb_data_in_1	[2   ],
		  dtlb_data_in_2	[2   ],
		  dtlb_data_in_3	[2   ]}),
	.din1	({itlb_data_in_0	[1   ],
		  itlb_data_in_1	[1   ],
		  itlb_data_in_2	[1   ],
		  itlb_data_in_3	[1   ],
		  dtlb_data_in_0	[1   ],
		  dtlb_data_in_1	[1   ],
		  dtlb_data_in_2	[1   ],
		  dtlb_data_in_3	[1   ]}),
	.din2	({itlb_data_in_0	[0   ],
		  itlb_data_in_1	[0   ],
		  itlb_data_in_2	[0   ],
		  itlb_data_in_3	[0   ],
		  dtlb_data_in_0	[0   ],
		  dtlb_data_in_1	[0   ],
		  dtlb_data_in_2	[0   ],
		  dtlb_data_in_3	[0   ]}),
	.dout	({itlb_ps_gt_8k_0	       ,
		  itlb_ps_gt_8k_1	       ,
		  itlb_ps_gt_8k_2	       ,
		  itlb_ps_gt_8k_3	       ,
		  dtlb_ps_gt_8k_0	       ,
		  dtlb_ps_gt_8k_1	       ,
		  dtlb_ps_gt_8k_2	       ,
		  dtlb_ps_gt_8k_3	       })
);


mmu_asd_dp_mux_macro__mux_aonpe__ports_4__stack_58c__width_48 itte_tag_mux     (
	.din0	({immu_tag_access_0	[47:28],	// VA[47:28]
		  immu_tag_access_0	[27:22],	// VA[27:22]
		  itlb_ps_eq_256m_0	       ,
		  itlb_data_in_0	[38   ],	// Valid
		  itlb_data_in_0	[35   ],	// Locked
		  immu_tag_access_0	[21:16],	// VA[21:16]
		  immu_tag_access_0	[12:0]}),	// Context
	.din1	({immu_tag_access_1	[47:28],	// VA[47:28]
		  immu_tag_access_1	[27:22],	// VA[27:22]
		  itlb_ps_eq_256m_1	       ,
		  itlb_data_in_1	[38   ],	// Valid
		  itlb_data_in_1	[35   ],	// Locked
		  immu_tag_access_1	[21:16],	// VA[21:16]
		  immu_tag_access_1	[12:0]}),	// Context
	.din2	({immu_tag_access_2	[47:28],	// VA[47:28]
		  immu_tag_access_2	[27:22],	// VA[27:22]
		  itlb_ps_eq_256m_2	       ,
		  itlb_data_in_2	[38   ],	// Valid
		  itlb_data_in_2	[35   ],	// Locked
		  immu_tag_access_2	[21:16],	// VA[21:16]
		  immu_tag_access_2	[12:0]}),	// Context
	.din3	({immu_tag_access_3	[47:28],	// VA[47:28]
		  immu_tag_access_3	[27:22],	// VA[27:22]
		  itlb_ps_eq_256m_3	       ,
		  itlb_data_in_3	[38   ],	// Valid
		  itlb_data_in_3	[35   ],	// Locked
		  immu_tag_access_3	[21:16],	// VA[21:16]
		  immu_tag_access_3	[12:0]}),	// Context
	.sel0	(asi_rd_itte_tag	[0   ]	),
	.sel1	(asi_rd_itte_tag	[1   ]	),
	.sel2	(asi_rd_itte_tag	[2   ]	),
	.sel3	(asi_rd_itte_tag	[3   ]	),
	.dout	(itte_tag		[47:0]	)
);

mmu_asd_dp_mux_macro__dmux_8x__mux_aope__ports_4__stack_58c__width_48 dtte_tag_mux      (
	.din0	({dmmu_tag_access_0	[47:28],	// VA[47:28]
		  dmmu_tag_access_0	[27:22],	// VA[27:22]
		  dtlb_ps_eq_256m_0	       ,
		  dtlb_data_in_0	[38   ],	// Valid
		  dtlb_data_in_0	[35   ],	// Locked
		  dmmu_tag_access_0	[21:16],	// VA[21:16]
		  dmmu_tag_access_0	[12:0]}),	// Context
	.din1	({dmmu_tag_access_1	[47:28],	// VA[47:28]
		  dmmu_tag_access_1	[27:22],	// VA[27:22]
		  dtlb_ps_eq_256m_1	       ,
		  dtlb_data_in_1	[38   ],	// Valid
		  dtlb_data_in_1	[35   ],	// Locked
		  dmmu_tag_access_1	[21:16],	// VA[21:16]
		  dmmu_tag_access_1	[12:0]}),	// Context
	.din2	({dmmu_tag_access_2	[47:28],	// VA[47:28]
		  dmmu_tag_access_2	[27:22],	// VA[27:22]
		  dtlb_ps_eq_256m_2	       ,
		  dtlb_data_in_2	[38   ],	// Valid
		  dtlb_data_in_2	[35   ],	// Locked
		  dmmu_tag_access_2	[21:16],	// VA[21:16]
		  dmmu_tag_access_2	[12:0]}),	// Context
	.din3	({dmmu_tag_access_3	[47:28],	// VA[47:28]
		  dmmu_tag_access_3	[27:22],	// VA[27:22]
		  dtlb_ps_eq_256m_3	       ,
		  dtlb_data_in_3	[38   ],	// Valid
		  dtlb_data_in_3	[35   ],	// Locked
		  dmmu_tag_access_3	[21:16],	// VA[21:16]
		  dmmu_tag_access_3	[12:0]}),	// Context
	.sel0	(asi_rd_dtte		[0   ]	),
	.sel1	(asi_rd_dtte		[1   ]	),
	.sel2	(asi_rd_dtte		[2   ]	),
	.dout	(dtte_tag		[47:0]	)
);

mmu_asd_dp_buff_macro__rep_1__stack_58c__width_48 dtte_tag_buf    (
	.din	(dtte_tag		[47:0]	),
	.dout	(asd_dtte_tag		[47:0]	)
);


assign data_in[38:0] = 
	{asi_wr_data		[63   ],	// V
	 asi_wr_data		[62   ],	// NFO
	 asi_data_in_real	       ,	// Real
	 asi_wr_data		[61   ],	// Locked
	 asi_wr_data		[39:13],	// PA[39:13]
	 asi_wr_data		[12   ],	// IE
	 asi_wr_data		[11   ],	// Side effect
	 asi_wr_data		[10   ],	// CP
	 asi_wr_data		[8   ],	// P
	 asi_wr_data		[6   ],	// W
	 asi_wr_data		[2:0]};	// Size

mmu_asd_dp_msff_macro__mux_aope__ports_5__stack_58c__width_49 itlb_data_in_3_lat     (
	.scan_in(itlb_data_in_3_lat_scanin),
	.scan_out(itlb_data_in_3_lat_scanout),
	.din0	({{7 {1'b0}}		       ,   // Index valid & index
		  {3 {1'b0}}		       ,   // Demap valid & type
		  data_in		[38:0]}),
	.din1	({1'b1			       ,   // Index valid
		  asi_mra_wr_data	[8:3],   // Index to write
		  {3 {1'b0}}		       ,   // Demap valid & type
		  data_in		[38:0]}),
	.din2	({{7 {1'b0}}		       ,   // Index valid & index
		  1'b1			       ,   // Demap
		  asi_mra_wr_data	[7:6],   // Demap type field
		  itlb_data_in_3	[38:37],
		  asi_demap_r_bit	       ,   // Demap R bit
		  itlb_data_in_3	[35:0]}),    
	.din3	({{7 {1'b0}}		       ,   // Index valid & index
		  1'b0			       ,   // Demap valid
		  mmu_use_context_1	       ,   // Context type
		  mmu_use_context_0	       ,   // Context type
		  htd_tlbdatain_din	[38:0]}),    
	.din4	(itlb_data_in_3		[48:0]	),     
	.sel0	(asi_wr_itlb_data_in	[3   ]	), // ASI Write
	.sel1	(asi_wr_itlb_data_access[3   ]	), // ASI Write
	.sel2	(asi_wr_immu_demap	[3   ]	), 
	.sel3	(htc_wr_itlb_data_in	[3   ]	), // HWTW Write ITLB Data-In
	.en	(asi_i_data_in_en	[3   ]	),
	.dout	(itlb_data_in_3		[48:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_asd_dp_msff_macro__mux_aope__ports_5__stack_58c__width_49 itlb_data_in_2_lat     (
	.scan_in(itlb_data_in_2_lat_scanin),
	.scan_out(itlb_data_in_2_lat_scanout),
	.din0	({{7 {1'b0}}		       ,   // Index valid & index
		  {3 {1'b0}}		       ,   // Demap valid & type
		  data_in		[38:0]}),
	.din1	({1'b1			       ,   // Index valid
		  asi_mra_wr_data	[8:3],   // Index to write
		  {3 {1'b0}}		       ,   // Demap valid & type
		  data_in		[38:0]}),
	.din2	({{7 {1'b0}}		       ,   // Index valid & index
		  1'b1			       ,   // Demap
		  asi_mra_wr_data	[7:6],   // Demap type field
		  itlb_data_in_2	[38:37],
		  asi_demap_r_bit	       ,   // Demap R bit
		  itlb_data_in_2	[35:0]}),    
	.din3	({{7 {1'b0}}		       ,   // Index valid & index
		  1'b0			       ,   // Demap valid
		  mmu_use_context_1	       ,   // Context type
		  mmu_use_context_0	       ,   // Context type
		  htd_tlbdatain_din	[38:0]}),    
	.din4	(itlb_data_in_2		[48:0]	),     
	.sel0	(asi_wr_itlb_data_in	[2   ]	), // ASI Write
	.sel1	(asi_wr_itlb_data_access[2   ]	), // ASI Write
	.sel2	(asi_wr_immu_demap	[2   ]	), 
	.sel3	(htc_wr_itlb_data_in	[2   ]	), // HWTW Write ITLB Data-In
	.en	(asi_i_data_in_en	[2   ]	),
	.dout	(itlb_data_in_2		[48:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_asd_dp_msff_macro__mux_aope__ports_5__stack_58c__width_49 itlb_data_in_1_lat     (
	.scan_in(itlb_data_in_1_lat_scanin),
	.scan_out(itlb_data_in_1_lat_scanout),
	.din0	({{7 {1'b0}}		       ,   // Index valid & index
		  {3 {1'b0}}		       ,   // Demap valid & type
		  data_in		[38:0]}),
	.din1	({1'b1			       ,   // Index valid
		  asi_mra_wr_data	[8:3],   // Index to write
		  {3 {1'b0}}		       ,   // Demap valid & type
		  data_in		[38:0]}),
	.din2	({{7 {1'b0}}		       ,   // Index valid & index
		  1'b1			       ,   // Demap
		  asi_mra_wr_data	[7:6],   // Demap type field
		  itlb_data_in_1	[38:37],
		  asi_demap_r_bit	       ,   // Demap R bit
		  itlb_data_in_1	[35:0]}),    
	.din3	({{7 {1'b0}}		       ,   // Index valid & index
		  1'b0			       ,   // Demap valid
		  mmu_use_context_1	       ,   // Context type
		  mmu_use_context_0	       ,   // Context type
		  htd_tlbdatain_din	[38:0]}),    
	.din4	(itlb_data_in_1		[48:0]	),     
	.sel0	(asi_wr_itlb_data_in	[1   ]	), // ASI Write
	.sel1	(asi_wr_itlb_data_access[1   ]	), // ASI Write
	.sel2	(asi_wr_immu_demap	[1   ]	), 
	.sel3	(htc_wr_itlb_data_in	[1   ]	), // HWTW Write ITLB Data-In
	.en	(asi_i_data_in_en	[1   ]	),
	.dout	(itlb_data_in_1		[48:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_asd_dp_msff_macro__mux_aope__ports_5__stack_58c__width_49 itlb_data_in_0_lat     (
	.scan_in(itlb_data_in_0_lat_scanin),
	.scan_out(itlb_data_in_0_lat_scanout),
	.din0	({{7 {1'b0}}		       ,   // Index valid & index
		  {3 {1'b0}}		       ,   // Demap valid & type
		  data_in		[38:0]}),
	.din1	({1'b1			       ,   // Index valid
		  asi_mra_wr_data	[8:3],   // Index to write
		  {3 {1'b0}}		       ,   // Demap valid & type
		  data_in		[38:0]}),
	.din2	({{7 {1'b0}}		       ,   // Index valid & index
		  1'b1			       ,   // Demap
		  asi_mra_wr_data	[7:6],   // Demap type field
		  itlb_data_in_0	[38:37],
		  asi_demap_r_bit	       ,   // Demap R bit
		  itlb_data_in_0	[35:0]}),    
	.din3	({{7 {1'b0}}		       ,   // Index valid & index
		  1'b0			       ,   // Demap valid
		  mmu_use_context_1	       ,   // Context type
		  mmu_use_context_0	       ,   // Context type
		  htd_tlbdatain_din	[38:0]}),    
	.din4	(itlb_data_in_0		[48:0]	),     
	.sel0	(asi_wr_itlb_data_in	[0   ]	), // ASI Write
	.sel1	(asi_wr_itlb_data_access[0   ]	), // ASI Write
	.sel2	(asi_wr_immu_demap	[0   ]	), 
	.sel3	(htc_wr_itlb_data_in	[0   ]	), // HWTW Write ITLB Data-In
	.en	(asi_i_data_in_en	[0   ]	),
	.dout	(itlb_data_in_0		[48:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_asd_dp_msff_macro__mux_aope__ports_5__stack_58c__width_51 dtlb_data_in_3_lat     (
	.scan_in(dtlb_data_in_3_lat_scanin),
	.scan_out(dtlb_data_in_3_lat_scanout),
	.din0	({{8 {1'b0}}		       ,   // Index valid & index
		  {4 {1'b0}}		       ,   // Demap valids & type
		  data_in		[38:0]}),   
	.din1	({1'b1			       ,   // Index valid
		  asi_mra_wr_data	[9:3],   // Index to write
		  {4 {1'b0}}		       ,   // Demap valids & type
		  data_in		[38:0]}),   
	.din2	({{8 {1'b0}}		       ,   // Index valid & index
		  asi_dmmu_demap_s	       ,   // Demap secondary context
		  1'b1			       ,   // Demap
		  asi_mra_wr_data	[7:6],   // Demap type field
		  dtlb_data_in_3	[38:37],
		  asi_demap_r_bit	       ,   // Demap R bit
		  dtlb_data_in_3	[35:0]}),    
	.din3	({{8 {1'b0}}		       ,   // Index valid & index
		  mmu_sec_context	       ,   // Replace with secondary cxt
		  1'b0			       ,   // Demap valid
		  mmu_use_context_1	       ,   // Context type
		  mmu_use_context_0	       ,   // Context type
		  htd_tlbdatain_din	[38:0]}),    
	.din4	(dtlb_data_in_3		[50:0]	),     
	.sel0	(asi_wr_dtlb_data_in	[3   ]	), // ASI Write
	.sel1	(asi_wr_dtlb_data_access[3   ]	), // ASI Write
	.sel2	(asi_wr_dmmu_demap	[3   ]	), 
	.sel3	(htc_wr_dtlb_data_in	[3   ]	), // HWTW Write DTLB Data-In
	.en	(asi_d_data_in_en	[3   ]	),
	.dout	(dtlb_data_in_3		[50:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_asd_dp_msff_macro__mux_aope__ports_5__stack_58c__width_51 dtlb_data_in_2_lat     (
	.scan_in(dtlb_data_in_2_lat_scanin),
	.scan_out(dtlb_data_in_2_lat_scanout),
	.din0	({{8 {1'b0}}		       ,   // Index valid & index
		  {4 {1'b0}}		       ,   // Demap valids & type
		  data_in		[38:0]}),   
	.din1	({1'b1			       ,   // Index valid
		  asi_mra_wr_data	[9:3],   // Index to write
		  {4 {1'b0}}		       ,   // Demap valids & type
		  data_in		[38:0]}),   
	.din2	({{8 {1'b0}}		       ,   // Index valid & index
		  asi_dmmu_demap_s	       ,   // Demap secondary context
		  1'b1			       ,   // Demap
		  asi_mra_wr_data	[7:6],   // Demap type field
		  dtlb_data_in_2	[38:37],
		  asi_demap_r_bit	       ,   // Demap R bit
		  dtlb_data_in_2	[35:0]}),    
	.din3	({{8 {1'b0}}		       ,   // Index valid & index
		  mmu_sec_context	       ,   // Replace with secondary cxt
		  1'b0			       ,   // Demap valid
		  mmu_use_context_1	       ,   // Context type
		  mmu_use_context_0	       ,   // Context type
		  htd_tlbdatain_din	[38:0]}),    
	.din4	(dtlb_data_in_2		[50:0]	),     
	.sel0	(asi_wr_dtlb_data_in	[2   ]	), // ASI Write
	.sel1	(asi_wr_dtlb_data_access[2   ]	), // ASI Write
	.sel2	(asi_wr_dmmu_demap	[2   ]	), 
	.sel3	(htc_wr_dtlb_data_in	[2   ]	), // HWTW Write DTLB Data-In
	.en	(asi_d_data_in_en	[2   ]	),
	.dout	(dtlb_data_in_2		[50:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_asd_dp_msff_macro__mux_aope__ports_5__stack_58c__width_51 dtlb_data_in_1_lat     (
	.scan_in(dtlb_data_in_1_lat_scanin),
	.scan_out(dtlb_data_in_1_lat_scanout),
	.din0	({{8 {1'b0}}		       ,   // Index valid & index
		  {4 {1'b0}}		       ,   // Demap valids & type
		  data_in		[38:0]}),   
	.din1	({1'b1			       ,   // Index valid
		  asi_mra_wr_data	[9:3],   // Index to write
		  {4 {1'b0}}		       ,   // Demap valids & type
		  data_in		[38:0]}),   
	.din2	({{8 {1'b0}}		       ,   // Index valid & index
		  asi_dmmu_demap_s	       ,   // Demap secondary context
		  1'b1			       ,   // Demap
		  asi_mra_wr_data	[7:6],   // Demap type field
		  dtlb_data_in_1	[38:37],
		  asi_demap_r_bit	       ,   // Demap R bit
		  dtlb_data_in_1	[35:0]}),    
	.din3	({{8 {1'b0}}		       ,   // Index valid & index
		  mmu_sec_context	       ,   // Replace with secondary cxt
		  1'b0			       ,   // Demap valid
		  mmu_use_context_1	       ,   // Context type
		  mmu_use_context_0	       ,   // Context type
		  htd_tlbdatain_din	[38:0]}),    
	.din4	(dtlb_data_in_1		[50:0]	),     
	.sel0	(asi_wr_dtlb_data_in	[1   ]	), // ASI Write
	.sel1	(asi_wr_dtlb_data_access[1   ]	), // ASI Write
	.sel2	(asi_wr_dmmu_demap	[1   ]	), 
	.sel3	(htc_wr_dtlb_data_in	[1   ]	), // HWTW Write DTLB Data-In
	.en	(asi_d_data_in_en	[1   ]	),
	.dout	(dtlb_data_in_1		[50:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_asd_dp_msff_macro__mux_aope__ports_5__stack_58c__width_51 dtlb_data_in_0_lat     (
	.scan_in(dtlb_data_in_0_lat_scanin),
	.scan_out(dtlb_data_in_0_lat_scanout),
	.din0	({{8 {1'b0}}		       ,   // Index valid & index
		  {4 {1'b0}}		       ,   // Demap valids & type
		  data_in		[38:0]}),   
	.din1	({1'b1			       ,   // Index valid
		  asi_mra_wr_data	[9:3],   // Index to write
		  {4 {1'b0}}		       ,   // Demap valids & type
		  data_in		[38:0]}),   
	.din2	({{8 {1'b0}}		       ,   // Index valid & index
		  asi_dmmu_demap_s	       ,   // Demap secondary context
		  1'b1			       ,   // Demap
		  asi_mra_wr_data	[7:6],   // Demap type field
		  dtlb_data_in_0	[38:37],
		  asi_demap_r_bit	       ,   // Demap R bit
		  dtlb_data_in_0	[35:0]}),    
	.din3	({{8 {1'b0}}		       ,   // Index valid & index
		  mmu_sec_context	       ,   // Replace with secondary cxt
		  1'b0			       ,   // Demap valid
		  mmu_use_context_1	       ,   // Context type
		  mmu_use_context_0	       ,   // Context type
		  htd_tlbdatain_din	[38:0]}),    
	.din4	(dtlb_data_in_0 	[50:0]	),     
	.sel0	(asi_wr_dtlb_data_in	[0   ]	), // ASI Write
	.sel1	(asi_wr_dtlb_data_access[0   ]	), 
	.sel2	(asi_wr_dmmu_demap	[0   ]	), 
	.sel3	(htc_wr_dtlb_data_in	[0   ]	), // HWTW Write DTLB Data-In
	.en	(asi_d_data_in_en	[0   ]	),
	.dout	(dtlb_data_in_0		[50:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);


mmu_asd_dp_mux_macro__dmux_8x__mux_aonpe__ports_4__stack_58c__width_53 itte_data_mux      (
	.din0	({itlb_data_in_0	[48:39],	// Demap info, etc.
		  itlb_ps_gt_64k_0	       ,
		  immu_tag_access_0	[15:13],	// VA[15:13]
		  itlb_ps_gt_8k_0	       ,
		  thread_group		       ,	// TID[02]
		  2'b00			       ,	// TID[01:00]
		  itlb_data_in_0	[36   ],	// Real bit
		  itlb_data_in_0	[34:23],	// PA[39:28]
		  itlb_data_in_0	[22:17],	// PA[27:22]
		  itlb_data_in_0	[16:11],	// PA[21:16]
		  itlb_data_in_0	[10:8],	// PA[15:13]
		  itlb_data_in_0	[38   ],	// Valid
		  itlb_data_in_0	[37   ],	// NFO
		  itlb_data_in_0	[7   ],	// IE
		  itlb_data_in_0	[5   ],	// CP
		  itlb_data_in_0	[6   ],	// E
		  itlb_data_in_0	[4   ],	// P
		  itlb_data_in_0	[3   ]}),	// W
	.din1	({itlb_data_in_1	[48:39],	// Demap info, etc.
		  itlb_ps_gt_64k_1	       ,
		  immu_tag_access_1	[15:13],	// VA[15:13]
		  itlb_ps_gt_8k_1	       ,
		  thread_group		       ,	// TID[02]
		  2'b01			       ,	// TID[01:00]
		  itlb_data_in_1	[36   ],	// Real bit
		  itlb_data_in_1	[34:23],	// PA[39:28]
		  itlb_data_in_1	[22:17],	// PA[27:22]
		  itlb_data_in_1	[16:11],	// PA[21:16]
		  itlb_data_in_1	[10:8],	// PA[15:13]
		  itlb_data_in_1	[38   ],	// Valid
		  itlb_data_in_1	[37   ],	// NFO
		  itlb_data_in_1	[7   ],	// IE
		  itlb_data_in_1	[5   ],	// CP
		  itlb_data_in_1	[6   ],	// E
		  itlb_data_in_1	[4   ],	// P
		  itlb_data_in_1	[3   ]}),	// W
	.din2	({itlb_data_in_2	[48:39],	// Demap info, etc.
		  itlb_ps_gt_64k_2	       ,
		  immu_tag_access_2	[15:13],	// VA[15:13]
		  itlb_ps_gt_8k_2	       ,
		  thread_group		       ,	// TID[02]
		  2'b10			       ,	// TID[01:00]
		  itlb_data_in_2	[36   ],	// Real bit
		  itlb_data_in_2	[34:23],	// PA[39:28]
		  itlb_data_in_2	[22:17],	// PA[27:22]
		  itlb_data_in_2	[16:11],	// PA[21:16]
		  itlb_data_in_2	[10:8],	// PA[15:13]
		  itlb_data_in_2	[38   ],	// Valid
		  itlb_data_in_2	[37   ],	// NFO
		  itlb_data_in_2	[7   ],	// IE
		  itlb_data_in_2	[5   ],	// CP
		  itlb_data_in_2	[6   ],	// E
		  itlb_data_in_2	[4   ],	// P
		  itlb_data_in_2	[3   ]}),	// W
	.din3	({itlb_data_in_3	[48:39],	// Demap info, etc.
		  itlb_ps_gt_64k_3	       ,
		  immu_tag_access_3	[15:13],	// VA[15:13]
		  itlb_ps_gt_8k_3	       ,
		  thread_group		       ,	// TID[02]
		  2'b11			       ,	// TID[01:00]
		  itlb_data_in_3	[36   ],	// Real bit
		  itlb_data_in_3	[34:23],	// PA[39:28]
		  itlb_data_in_3	[22:17],	// PA[27:22]
		  itlb_data_in_3	[16:11],	// PA[21:16]
		  itlb_data_in_3	[10:8],	// PA[15:13]
		  itlb_data_in_3	[38   ],	// Valid
		  itlb_data_in_3	[37   ],	// NFO
		  itlb_data_in_3	[7   ],	// IE
		  itlb_data_in_3	[5   ],	// CP
		  itlb_data_in_3	[6   ],	// E
		  itlb_data_in_3	[4   ],	// P
		  itlb_data_in_3	[3   ]}),	// W
	.sel0	(asi_rd_itte_data	[0   ]	),
	.sel1	(asi_rd_itte_data	[1   ]	),
	.sel2	(asi_rd_itte_data	[2   ]	),
	.sel3	(asi_rd_itte_data	[3   ]	),
	.dout	({asd_itte_index	[6:0],
		  itte_data		[45:0]})
);

// Merge ITLB tag and data
mmu_asd_dp_nor_macro__ports_2__stack_58c__width_48 itte_tag_data_b_nor    (
	.din0	(itte_tag		[47:0]	),
	.din1	({2'b00			       , 
		  itte_data		[45:0]}),
	.dout	(asd_itte_tag_data_	[47:0]	)
);


mmu_asd_dp_mux_macro__mux_aope__ports_4__stack_58c__width_55 dtte_data_mux     (
	.din0	({dtlb_data_in_0	[50:39],	// Demap info, etc
		  dtlb_ps_gt_64k_0	       ,
		  dmmu_tag_access_0	[15:13],	// VA[15:13]
		  dtlb_ps_gt_8k_0	       ,
		  thread_group		       ,	// TID[02]
		  2'b00			       ,	// TID[01:00]
		  dtlb_data_in_0	[36   ],	// Real bit
		  dtlb_data_in_0	[34:23],	// PA[39:28]
		  dtlb_data_in_0	[22:17],	// PA[27:22]
		  dtlb_data_in_0	[16:11],	// PA[21:16]
		  dtlb_data_in_0	[10:8],	// PA[15:13]
		  dtlb_data_in_0	[38   ],	// Valid
		  dtlb_data_in_0	[37   ],	// NFO
		  dtlb_data_in_0	[7   ],	// IE
		  dtlb_data_in_0	[5   ],	// CP
		  dtlb_data_in_0	[6   ],	// E (Side effect)
		  dtlb_data_in_0	[4   ],	// P
		  dtlb_data_in_0	[3   ]}),	// W
	.din1	({dtlb_data_in_1	[50:39],	// Demap info, etc
		  dtlb_ps_gt_64k_1	       ,
		  dmmu_tag_access_1	[15:13],	// VA[15:13]
		  dtlb_ps_gt_8k_1	       ,
		  thread_group		       ,	// TID[02]
		  2'b01			       ,	// TID[01:00]
		  dtlb_data_in_1	[36   ],	// Real bit
		  dtlb_data_in_1	[34:23],	// PA[39:28]
		  dtlb_data_in_1	[22:17],	// PA[27:22]
		  dtlb_data_in_1	[16:11],	// PA[21:16]
		  dtlb_data_in_1	[10:8],	// PA[15:13]
		  dtlb_data_in_1	[38   ],	// Valid
		  dtlb_data_in_1	[37   ],	// NFO
		  dtlb_data_in_1	[7   ],	// IE
		  dtlb_data_in_1	[5   ],	// CP
		  dtlb_data_in_1	[6   ],	// E (Side effect)
		  dtlb_data_in_1	[4   ],	// P
		  dtlb_data_in_1	[3   ]}),	// W
	.din2	({dtlb_data_in_2	[50:39],	// Demap info, etc
		  dtlb_ps_gt_64k_2	       ,
		  dmmu_tag_access_2	[15:13],	// VA[15:13]
		  dtlb_ps_gt_8k_2	       ,
		  thread_group		       ,	// TID[02]
		  2'b10			       ,	// TID[01:00]
		  dtlb_data_in_2	[36   ],	// Real bit
		  dtlb_data_in_2	[34:23],	// PA[39:28]
		  dtlb_data_in_2	[22:17],	// PA[27:22]
		  dtlb_data_in_2	[16:11],	// PA[21:16]
		  dtlb_data_in_2	[10:8],	// PA[15:13]
		  dtlb_data_in_2	[38   ],	// Valid
		  dtlb_data_in_2	[37   ],	// NFO
		  dtlb_data_in_2	[7   ],	// IE
		  dtlb_data_in_2	[5   ],	// CP
		  dtlb_data_in_2	[6   ],	// E (Side effect)
		  dtlb_data_in_2	[4   ],	// P
		  dtlb_data_in_2	[3   ]}),	// W
	.din3	({dtlb_data_in_3	[50:39],	// Demap info, etc
		  dtlb_ps_gt_64k_3	       ,
		  dmmu_tag_access_3	[15:13],	// VA[15:13]
		  dtlb_ps_gt_8k_3	       ,
		  thread_group		       ,	// TID[02]
		  2'b11			       ,	// TID[01:00]
		  dtlb_data_in_3	[36   ],	// Real bit
		  dtlb_data_in_3	[34:23],	// PA[39:28]
		  dtlb_data_in_3	[22:17],	// PA[27:22]
		  dtlb_data_in_3	[16:11],	// PA[21:16]
		  dtlb_data_in_3	[10:8],	// PA[15:13]
		  dtlb_data_in_3	[38   ],	// Valid
		  dtlb_data_in_3	[37   ],	// NFO
		  dtlb_data_in_3	[7   ],	// IE
		  dtlb_data_in_3	[5   ],	// CP
		  dtlb_data_in_3	[6   ],	// E (Side effect)
		  dtlb_data_in_3	[4   ],	// P
		  dtlb_data_in_3	[3   ]}),	// W	
	.sel0	(asi_rd_dtte		[0   ]	),
	.sel1	(asi_rd_dtte		[1   ]	),
	.sel2	(asi_rd_dtte		[2   ]	),
	.dout	(dtte_data		[54:0]	)
);

mmu_asd_dp_buff_macro__rep_1__stack_58c__width_55 dtte_data_buf    (
	.din	(dtte_data		[54:0]	),
	.dout	(asd_dtte_data		[54:0]	)
);

assign asd_iht_p_ctx_0_0    [12:0] = p_context_0_0 [12:0];	
assign asd_iht_p_ctx_0_1    [12:0] = p_context_0_1 [12:0];
assign asd_iht_p_ctx_0_2    [12:0] = p_context_0_2 [12:0];
assign asd_iht_p_ctx_0_3    [12:0] = p_context_0_3 [12:0];

//////////////////////////////////////////////////////////////////////
//
// Scan patch panel
//
// fixscan start:
assign mra_read_1_lat_scanin     = scan_in                  ;
assign mra_read_0_lat_scanin     = mra_read_1_lat_scanout   ;
assign asi_rd_mux_scanin         = mra_read_0_lat_scanout   ;
assign itlb_data_in_3_lat_scanin = asi_rd_mux_scanout       ;
assign itlb_data_in_2_lat_scanin = itlb_data_in_3_lat_scanout;
assign itlb_data_in_1_lat_scanin = itlb_data_in_2_lat_scanout;
assign itlb_data_in_0_lat_scanin = itlb_data_in_1_lat_scanout;
assign dtlb_data_in_3_lat_scanin = itlb_data_in_0_lat_scanout;
assign dtlb_data_in_2_lat_scanin = dtlb_data_in_3_lat_scanout;
assign dtlb_data_in_1_lat_scanin = dtlb_data_in_2_lat_scanout;
assign dtlb_data_in_0_lat_scanin = dtlb_data_in_1_lat_scanout;
assign scan_out                  = dtlb_data_in_0_lat_scanout;

assign p_context_lat_wmr_scanin  = wmr_scan_in              ;
assign immu_tag_access_3_lat_wmr_scanin = p_context_lat_wmr_scanout;
assign immu_tag_access_2_lat_wmr_scanin = immu_tag_access_3_lat_wmr_scanout;
assign immu_tag_access_1_lat_wmr_scanin = immu_tag_access_2_lat_wmr_scanout;
assign immu_tag_access_0_lat_wmr_scanin = immu_tag_access_1_lat_wmr_scanout;
assign dmmu_tag_access_3_lat_wmr_scanin = immu_tag_access_0_lat_wmr_scanout;
assign dmmu_tag_access_2_lat_wmr_scanin = dmmu_tag_access_3_lat_wmr_scanout;
assign dmmu_tag_access_1_lat_wmr_scanin = dmmu_tag_access_2_lat_wmr_scanout;
assign dmmu_tag_access_0_lat_wmr_scanin = dmmu_tag_access_1_lat_wmr_scanout;
assign wmr_scan_out              = dmmu_tag_access_0_lat_wmr_scanout;
// fixscan end:
endmodule


//
//   buff macro
//
//





module mmu_asd_dp_buff_macro__width_4 (
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

module mmu_asd_dp_msff_macro__minbuff_1__stack_58c__width_24 (
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













// any PARAMS parms go into naming of macro

module mmu_asd_dp_msff_macro__minbuff_1__stack_58c__width_58 (
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
wire [56:0] so;

  input [57:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [57:0] dout;


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
dff #(58)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[57:0]),
.si({scan_in,so[56:0]}),
.so({so[56:0],scan_out}),
.q(dout[57:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module mmu_asd_dp_msff_macro__mux_aonpe__ports_4__stack_58c__width_52 (
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
wire [51:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [50:0] so;

  input [51:0] din0;
  input sel0;
  input [51:0] din1;
  input sel1;
  input [51:0] din2;
  input sel2;
  input [51:0] din3;
  input sel3;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [51:0] dout;


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
mux4s #(52)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[51:0]),
  .in1(din1[51:0]),
  .in2(din2[51:0]),
  .in3(din3[51:0]),
.dout(muxout[51:0])
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
dff #(52)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[51:0]),
.si({scan_in,so[50:0]}),
.so({so[50:0],scan_out}),
.q(dout[51:0])
);




















endmodule









//
//   buff macro
//
//





module mmu_asd_dp_buff_macro__left_13__stack_58c__width_35 (
  din, 
  dout);
  input [34:0] din;
  output [34:0] dout;






buff #(35)  d0_0 (
.in(din[34:0]),
.out(dout[34:0])
);








endmodule









// any PARAMS parms go into naming of macro

module mmu_asd_dp_msff_macro__mux_aope__ports_7__stack_58c__width_48 (
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
wire psel6;
wire [47:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [46:0] so;

  input [47:0] din0;
  input [47:0] din1;
  input [47:0] din2;
  input [47:0] din3;
  input [47:0] din4;
  input [47:0] din5;
  input [47:0] din6;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input sel5;


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




cl_dp1_penc7_8x  c1_0 (
  .test(1'b1),
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
 .psel6(psel6)
);

mux7s #(48)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .in0(din0[47:0]),
  .in1(din1[47:0]),
  .in2(din2[47:0]),
  .in3(din3[47:0]),
  .in4(din4[47:0]),
  .in5(din5[47:0]),
  .in6(din6[47:0]),
.dout(muxout[47:0])
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
dff #(48)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[47:0]),
.si({scan_in,so[46:0]}),
.so({so[46:0],scan_out}),
.q(dout[47:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_asd_dp_mux_macro__mux_aonpe__ports_8__width_62 (
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

  input [61:0] din0;
  input sel0;
  input [61:0] din1;
  input sel1;
  input [61:0] din2;
  input sel2;
  input [61:0] din3;
  input sel3;
  input [61:0] din4;
  input sel4;
  input [61:0] din5;
  input sel5;
  input [61:0] din6;
  input sel6;
  input [61:0] din7;
  input sel7;
  output [61:0] dout;





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
mux8s #(62)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[61:0]),
  .in1(din1[61:0]),
  .in2(din2[61:0]),
  .in3(din3[61:0]),
  .in4(din4[61:0]),
  .in5(din5[61:0]),
  .in6(din6[61:0]),
  .in7(din7[61:0]),
.dout(dout[61:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_asd_dp_mux_macro__mux_aodec__ports_8__stack_58c__width_13 (
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

  input [12:0] din0;
  input [12:0] din1;
  input [12:0] din2;
  input [12:0] din3;
  input [12:0] din4;
  input [12:0] din5;
  input [12:0] din6;
  input [12:0] din7;
  input [2:0] sel;
  output [12:0] dout;





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

mux8s #(13)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[12:0]),
  .in1(din1[12:0]),
  .in2(din2[12:0]),
  .in3(din3[12:0]),
  .in4(din4[12:0]),
  .in5(din5[12:0]),
  .in6(din6[12:0]),
  .in7(din7[12:0]),
.dout(dout[12:0])
);









  



endmodule


//
//   buff macro
//
//





module mmu_asd_dp_buff_macro__stack_58c__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






buff #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_asd_dp_mux_macro__left_13__mux_aodec__ports_8__stack_58c__width_35 (
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

  input [34:0] din0;
  input [34:0] din1;
  input [34:0] din2;
  input [34:0] din3;
  input [34:0] din4;
  input [34:0] din5;
  input [34:0] din6;
  input [34:0] din7;
  input [2:0] sel;
  output [34:0] dout;





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

mux8s #(35)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[34:0]),
  .in1(din1[34:0]),
  .in2(din2[34:0]),
  .in3(din3[34:0]),
  .in4(din4[34:0]),
  .in5(din5[34:0]),
  .in6(din6[34:0]),
  .in7(din7[34:0]),
.dout(dout[34:0])
);









  



endmodule


//
//   buff macro
//
//





module mmu_asd_dp_buff_macro__rep_1__stack_58c__width_48 (
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
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module mmu_asd_dp_zero_macro__width_16 (
  din, 
  dout);
  input [15:0] din;
  output dout;






zero #(16)  m0_0 (
.in(din[15:0]),
.out(dout)
);










endmodule





//
//   nor macro for ports = 2,3
//
//





module mmu_asd_dp_nor_macro__ports_2__width_1 (
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





//  
//   or macro for ports = 2,3
//
//





module mmu_asd_dp_or_macro__ports_2__width_1 (
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
//   buff macro
//
//





module mmu_asd_dp_buff_macro__rep_1__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






buff #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);








endmodule









// any PARAMS parms go into naming of macro

module mmu_asd_dp_msff_macro__mux_aonpe__ports_2__width_62 (
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
wire [61:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [60:0] so;

  input [61:0] din0;
  input sel0;
  input [61:0] din1;
  input sel1;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [61:0] dout;


  output scan_out;




cl_dp1_muxbuff2_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(62)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[61:0]),
  .in1(din1[61:0]),
.dout(muxout[61:0])
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
dff #(62)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[61:0]),
.si({scan_in,so[60:0]}),
.so({so[60:0],scan_out}),
.q(dout[61:0])
);




















endmodule









//  
//   and macro for ports = 2,3,4
//
//





module mmu_asd_dp_and_macro__ports_2__stack_58c__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output [7:0] dout;






and2 #(8)  d0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout[7:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module mmu_asd_dp_or_macro__ports_2__stack_58c__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output [7:0] dout;






or2 #(8)  d0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout[7:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module mmu_asd_dp_or_macro__ports_3__stack_58c__width_8 (
  din0, 
  din1, 
  din2, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  input [7:0] din2;
  output [7:0] dout;






or3 #(8)  d0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.in2(din2[7:0]),
.out(dout[7:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_asd_dp_mux_macro__mux_aonpe__ports_4__stack_58c__width_48 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;

  input [47:0] din0;
  input sel0;
  input [47:0] din1;
  input sel1;
  input [47:0] din2;
  input sel2;
  input [47:0] din3;
  input sel3;
  output [47:0] dout;





cl_dp1_muxbuff4_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(48)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[47:0]),
  .in1(din1[47:0]),
  .in2(din2[47:0]),
  .in3(din3[47:0]),
.dout(dout[47:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_asd_dp_mux_macro__dmux_8x__mux_aope__ports_4__stack_58c__width_48 (
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

  input [47:0] din0;
  input [47:0] din1;
  input [47:0] din2;
  input [47:0] din3;
  input sel0;
  input sel1;
  input sel2;
  output [47:0] dout;





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

mux4s #(48)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[47:0]),
  .in1(din1[47:0]),
  .in2(din2[47:0]),
  .in3(din3[47:0]),
.dout(dout[47:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module mmu_asd_dp_msff_macro__mux_aope__ports_5__stack_58c__width_49 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  sel0, 
  sel1, 
  sel2, 
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
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire [48:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [47:0] so;

  input [48:0] din0;
  input [48:0] din1;
  input [48:0] din2;
  input [48:0] din3;
  input [48:0] din4;
  input sel0;
  input sel1;
  input sel2;
  input sel3;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [48:0] dout;


  output scan_out;




cl_dp1_penc5_8x  c1_0 (
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

mux5s #(49)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .in0(din0[48:0]),
  .in1(din1[48:0]),
  .in2(din2[48:0]),
  .in3(din3[48:0]),
  .in4(din4[48:0]),
.dout(muxout[48:0])
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
dff #(49)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[48:0]),
.si({scan_in,so[47:0]}),
.so({so[47:0],scan_out}),
.q(dout[48:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module mmu_asd_dp_msff_macro__mux_aope__ports_5__stack_58c__width_51 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  sel0, 
  sel1, 
  sel2, 
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
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire [50:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [49:0] so;

  input [50:0] din0;
  input [50:0] din1;
  input [50:0] din2;
  input [50:0] din3;
  input [50:0] din4;
  input sel0;
  input sel1;
  input sel2;
  input sel3;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [50:0] dout;


  output scan_out;




cl_dp1_penc5_8x  c1_0 (
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

mux5s #(51)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .in0(din0[50:0]),
  .in1(din1[50:0]),
  .in2(din2[50:0]),
  .in3(din3[50:0]),
  .in4(din4[50:0]),
.dout(muxout[50:0])
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
dff #(51)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[50:0]),
.si({scan_in,so[49:0]}),
.so({so[49:0],scan_out}),
.q(dout[50:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_asd_dp_mux_macro__dmux_8x__mux_aonpe__ports_4__stack_58c__width_53 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;

  input [52:0] din0;
  input sel0;
  input [52:0] din1;
  input sel1;
  input [52:0] din2;
  input sel2;
  input [52:0] din3;
  input sel3;
  output [52:0] dout;





cl_dp1_muxbuff4_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(53)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[52:0]),
  .in1(din1[52:0]),
  .in2(din2[52:0]),
  .in3(din3[52:0]),
.dout(dout[52:0])
);









  



endmodule


//
//   nor macro for ports = 2,3
//
//





module mmu_asd_dp_nor_macro__ports_2__stack_58c__width_48 (
  din0, 
  din1, 
  dout);
  input [47:0] din0;
  input [47:0] din1;
  output [47:0] dout;






nor2 #(48)  d0_0 (
.in0(din0[47:0]),
.in1(din1[47:0]),
.out(dout[47:0])
);







endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_asd_dp_mux_macro__mux_aope__ports_4__stack_58c__width_55 (
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

  input [54:0] din0;
  input [54:0] din1;
  input [54:0] din2;
  input [54:0] din3;
  input sel0;
  input sel1;
  input sel2;
  output [54:0] dout;





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

mux4s #(55)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[54:0]),
  .in1(din1[54:0]),
  .in2(din2[54:0]),
  .in3(din3[54:0]),
.dout(dout[54:0])
);









  



endmodule


//
//   buff macro
//
//





module mmu_asd_dp_buff_macro__rep_1__stack_58c__width_55 (
  din, 
  dout);
  input [54:0] din;
  output [54:0] dout;






buff #(55)  d0_0 (
.in(din[54:0]),
.out(dout[54:0])
);








endmodule




