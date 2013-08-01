// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_tld_dp.v
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
module lsu_tld_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  tcu_se_scancollar_in, 
  spc_aclk, 
  spc_bclk, 
  exu_lsu_address_e, 
  default_tag, 
  tlc_sel_write_tag, 
  tlc_sel_dm_tag, 
  tlc_sel_wr_dm_bist, 
  tlc_write_next, 
  tlc_tte0_clken, 
  tlc_tte1_clken, 
  tlc_tag_error_inj, 
  tlc_data_error_inj, 
  tlu_tte, 
  tlc_mbi_run, 
  mbi_wdata, 
  mbi_addr, 
  mbi_cambist_run, 
  mbi_cambist_shift, 
  mbi_init_to_zero, 
  mbi_dtb_write_en, 
  mbi_repl_write, 
  mbi_dis_clr_ubit, 
  mbi_dtb_demap_en, 
  mbi_demap_type, 
  tld_mbi_dtb_write_en, 
  tld_mbi_repl_write, 
  tld_mbi_dis_clr_ubit, 
  tld_mbi_dtb_demap_en, 
  tld_mbi_demap_type, 
  tgd_tag_c0, 
  tgd_tag_c1, 
  scan_out, 
  tld_ubit, 
  tld_tag_pid, 
  tld_tag_c0, 
  tld_tag_c1, 
  tld_tag_real, 
  tld_tag_valid, 
  tld_tag_mask, 
  tld_data, 
  tld_demap_control0, 
  tld_demap_control1, 
  tld_use_secondary_context0, 
  tld_tid, 
  tld_index_valid, 
  tld_rw_index, 
  tld_prty_256m, 
  tld_prty_4m, 
  tld_prty_64k, 
  tld_prty_8k, 
  tld_prty_ctxt0, 
  tld_prty_ctxt1, 
  tld_va_m_eq_zero, 
  lsu_va_m, 
  lsu_mmu_va_m, 
  lsu_exu_address_e);
wire stop;
wire en;
wire clk;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire tte0_lat_scanin;
wire tte0_lat_scanout;
wire [54:0] tte0;
wire [12:0] context_to_write;
wire tte1_lat_scanin;
wire tte1_lat_scanout;
wire [54:0] tte1;
wire tte2_lat_scanin;
wire tte2_lat_scanout;
wire [2:0] partition_id1;
wire [51:0] tte2_lat_out;
wire [54:0] tte2;
wire [2:0] partition_id2;
wire wrdata_sel;
wire wrdata_sel_;
wire [68:0] access_tag_m;
wire [68:0] tag_to_demap_d;
wire [68:0] tag_to_write;
wire [7:0] bist_data_0;
wire [69:0] mbist_wdata;
wire test_data_mux_scanin;
wire test_data_mux_scanout;
wire [69:0] bist_wdata;
wire tld_mbi_cambist_run;
wire [27:0] tag0;
wire [55:13] tld_tag_0;
wire default_unused;
wire [6:0] tld_mbi_addr;
wire mask_va_27_22_;
wire mask_va_21_16_;
wire mask_va_15_13_;
wire mask_context_;
wire [27:13] masked_va;
wire [12:0] masked_ctxt;
wire [47:0] va_m;
wire [51:0] tag_for_parity;
wire tag_parity_unmasked;
wire tag_parity_masked;
wire tag_parity_unmasked_;
wire tag_parity_masked_;
wire tag_parity;
wire prty_256m;
wire prty_8k_lower;
wire prty_va_27_22;
wire prty_4m;
wire prty_va_27_16;
wire prty_64k;
wire prty_8k;
wire prty_ctxt0;
wire prty_ctxt1;
wire [36:0] wr_data;
wire data_parity;
wire [7:0] bist_data_1;
wire data_parity_0;
wire data_parity_1;
wire va_m_lat_scanin;
wire va_m_lat_scanout;
wire bist_lat_scanin;
wire bist_lat_scanout;




input		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		tcu_scan_en;
input		tcu_se_scancollar_in;
input		spc_aclk;
input		spc_bclk;

input	[47:0]	exu_lsu_address_e;	// E->M flop is in this dp

input	[55:13] default_tag;

                                        // The following signals indicate the
                                        // first cycle of TTE transfer as well
                                        // as the operation (write or demap)
input		tlc_sel_write_tag;
input		tlc_sel_dm_tag;
input		tlc_sel_wr_dm_bist;
input		tlc_write_next;
input		tlc_tte0_clken;
input		tlc_tte1_clken;

input		tlc_tag_error_inj;
input		tlc_data_error_inj;

input	[54:0]	tlu_tte;		
                                        // First cycle of transfer 
				        // (part of tag, data, controls)
					// 	  54	  Index valid
					// 	  53:47	  Index to write
					// 	  46	  Demap / repl sec. cxt
					// 	  45	  Demap valid
					// 	  44:43	  Demap / context type
                                        //	  42	  PS_GT_64K
                                        //	  41:39   VA[15:13]
                                        //	  38	  PS_GT_8K
                                        //	  37:35   Thread ID
                                        //	  34	  Real bit
                                        //	  33:22   PA[39:28]
                                        //	  21:16   PA[27:22]
                                        //	  15:10   PA[21:16]
                                        //	  09:07   PA[15:13]
                                        //	  06	  Valid bit
                                        //	  05	  NFO bit
                                        //	  04	  IE bit
                                        //	  03	  CP bit
                                        //	  02	  X bit
                                        //	  01	  P bit
                                        //	  00	  W bit
                                        // Second cycle of transfer 
					// (rest of tag)
                                        //	  47:28   VA[47:28]
                                        //	  27:22   VA[27:22]
                                        //	  21	  PS_EQ_256M
                                        //	  20	  Valid
                                        //	  19	  Lock
                                        //	  18:13   VA[21:16]
                                        //	  12:00   Context


input		tlc_mbi_run;
input	[7:0]	mbi_wdata;
input	[6:0]	mbi_addr;
input		mbi_cambist_run;
input		mbi_cambist_shift;
input		mbi_init_to_zero;

input		mbi_dtb_write_en;
input		mbi_repl_write;
input		mbi_dis_clr_ubit;
input		mbi_dtb_demap_en;
input	[1:0]	mbi_demap_type;
output		tld_mbi_dtb_write_en;
output		tld_mbi_repl_write;
output		tld_mbi_dis_clr_ubit;
output		tld_mbi_dtb_demap_en;
output	[1:0]	tld_mbi_demap_type;

input	[12:0]	tgd_tag_c0;
input	[12:0]	tgd_tag_c1;

output		scan_out;
output		tld_ubit;
output	[2:0]	tld_tag_pid;
output	[12:0]	tld_tag_c0;
output	[12:0]	tld_tag_c1;
output		tld_tag_real;
output		tld_tag_valid;
output	[2:0]	tld_tag_mask;
output	[37:0]	tld_data;
output	[2:0]	tld_demap_control0;
output	[3:0]	tld_demap_control1;
output		tld_use_secondary_context0;
output	[2:0]	tld_tid;
output		tld_index_valid;
output	[6:0]	tld_rw_index;
output		tld_prty_256m;
output		tld_prty_4m;
output		tld_prty_64k;
output		tld_prty_8k;
output		tld_prty_ctxt0;
output		tld_prty_ctxt1;
output		tld_va_m_eq_zero;
output	[47:0]	lsu_va_m;
output	[47:0]	lsu_mmu_va_m;
					
output	[47:13]	lsu_exu_address_e;


					
assign stop	= 1'b0;
assign en	= 1'b1;
assign clk	= l2clk;

lsu_tld_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 test_rep0  (
	.din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk}),
	.dout({se,pce_ov,siclk,soclk})
);


///////////////////////////////////////////////////////////////////////////////
// Flop the TTE from TLU

lsu_tld_dp_msff_macro__stack_70c__width_55 tte0_lat   (
	.scan_in(tte0_lat_scanin),
	.scan_out(tte0_lat_scanout),
	.din	(tlu_tte		[54:0]	),
	.dout	(tte0			[54:0]	),
	.en	(tlc_tte0_clken),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign tld_tid[2:0] =
       tte0[37:35];

// Mux context for write tag
lsu_tld_dp_mux_macro__mux_aope__ports_2__stack_70c__width_13 context_to_write_mux     (
	.din0	(tgd_tag_c0		[12:0]	),
	.din1	(tte0			[12:0]	),
	.sel0	(tlc_write_next			),
	.dout	(context_to_write	[12:0]	)
);

assign tld_use_secondary_context0 =
       tte0[46];

lsu_tld_dp_msff_macro__stack_70c__width_55 tte1_lat   (
	.scan_in(tte1_lat_scanin),
	.scan_out(tte1_lat_scanout),
	.din	({tte0	[54:13], context_to_write[12:0]}),
	.dout	( tte1	[54:0]				),
	.en	(tlc_tte1_clken),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// If a write will happen next cycle, flop the tte tag for write.
// Otherwise, flop the tag that was just used for lookup.
lsu_tld_dp_msff_macro__mux_aope__ports_2__stack_70c__width_52 tte2_lat     (
	.scan_in(tte2_lat_scanin),
	.scan_out(tte2_lat_scanout),
	.din0	({tte1[54:47],partition_id1[2:0],tte1[42:38],1'b1,1'b0,tte1[34:7],tte1[5:0]}),
	.din1	({tld_tag_pid[2:0],tld_tag_real,12'b0,1'b0,1'b1,7'b0,tgd_tag_c1[12:0],tgd_tag_c0[12:0],1'b0}),
	.sel0	(tlc_write_next),
	.dout	(tte2_lat_out[51:0]),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign {tte2[54:47],partition_id2[2:0],tte2[42:38],wrdata_sel,wrdata_sel_,tte2[34:7],tte2[5:0]} = tte2_lat_out[51:0];
assign {access_tag_m[68:56], access_tag_m[12:0]} = tte2_lat_out[26:1];
assign access_tag_m[55:52] = tte2_lat_out[51:48];

assign tld_index_valid =
       tte2[54];

///////////////////////////TTE tag///////////////////////////////////////////////

assign partition_id1[2:0] = default_tag[55:53];

// Now build tag for the two cycles
// Demap with specified context
assign tag_to_demap_d[68:0] =
       {tte0		[12:0],	// Context
	partition_id1	[2:0],	// PID
	tte1		[34   ],	// R
	tte0		[47:28],	// VA[47:28]
	tte0		[27:22],	// VA[27:22]
	tte0		[21   ],	// 27_22_V
	tte0		[20   ],	// V
	tte0		[18:13],	// VA[21:16]
	tte1		[42   ],	// 21_16_V
	tte1		[41:39],	// VA[15:13]
	tte1		[38   ],	// 15_13_V
	tte0		[12:0]};	// Context[12:00]

// Write with muxed context
assign tag_to_write[68:0] =
       {tte1		[12:0],	// Context
	partition_id2	[2:0],	// PID
	tte2		[34   ],	// R
	tte1		[47:28],	// VA[47:28]
	tte1		[27:22],	// VA[27:22]
	tte1		[21   ],	// 27_22_V
	tte1		[20   ],	// V
	tte1		[18:13],	// VA[21:16]
	tte2		[42   ],	// 21_16_V
	tte2		[41:39],	// VA[15:13]
	tte2		[38   ],	// 15_13_V
	tte1		[12:0]		// Context[12:00]
	};
	

lsu_tld_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_8 buf_mbi_wdata  (
	.din	(mbi_wdata[7:0]),
	.dout	(bist_data_0[7:0])
);

// Page mask and real bits must be zero for bist to avoid masking lower address and context bits.
assign mbist_wdata[69:0] = {	bist_data_0[0],						// U
				bist_data_0[7:0],bist_data_0[7:3],			// [68:56]
				bist_data_0[4:2],					// [55:53]
				1'b0,							// [52]
				bist_data_0[0],{3{bist_data_0[7:0]}},bist_data_0[7],	// [51:26]
				1'b0,							// [25]
				bist_data_0[6:0],					// [24:18]
				1'b0,							// [17]
				bist_data_0[7:5],					// [16:14]
				1'b0,							// [13]
				bist_data_0[4:0],bist_data_0[7:0]};			// [12:0]

// Key to CAMBIST match/write data
// [0] = other		[4] = Valid
// [1] = PID		[5] = Real
// [2] = Context1	[6] = Used
// [3] = Context0

lsu_tld_dp_msff_macro__mux_aope__ports_4__stack_70c__width_70 test_data_mux     (
	.scan_in(test_data_mux_scanin),
	.scan_out(test_data_mux_scanout),
	.en	(tlc_mbi_run),
	.din0	({13'b0,1'b1,55'b0,1'b1}),
	.din1	({1'b1,
		  bist_wdata[67:56],1'b0,
		  bist_wdata[54:26],bist_wdata[23],
		  1'b0,1'b1,
		  bist_wdata[22:18],bist_wdata[16],
		  1'b0,
		  bist_wdata[15:14],bist_wdata[12],
		  1'b0,
		  bist_wdata[11:0],1'b0}),		// CAMBIST shift data
	.din2	({bist_data_0[6],{13{bist_data_0[2]}},{3{bist_data_0[1]}},bist_data_0[5],
		 {26{bist_data_0[0]}},1'b0,bist_data_0[4],{6{bist_data_0[0]}},
		  1'b0,{3{bist_data_0[0]}},1'b0,{13{bist_data_0[3]}}}
		),								// CAMBIST match/write data
	.din3	(mbist_wdata[69:0]),						// MEMBIST data
	.sel0	(mbi_init_to_zero),
	.sel1	(mbi_cambist_shift),
	.sel2	(tld_mbi_cambist_run),
	.dout	(bist_wdata[69:0]),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// tte_tag pin ordering is, from left of CAM to right of CAM
// Used Valid Context0[12:0] Context1[12:0] Real VA[27:13] VA[47:28] PID[2:0]

// Valid and context are muxed one way.  The context result of this mux will be muxed later
// with the stored context values.  This mux sits above the tlb, that mux sits below in
// lsu_tgd_dp.
lsu_tld_dp_mux_macro__mux_aonpe__ports_3__stack_28l__width_28 mx_tag0_d     (
	.din0	({bist_wdata[69], bist_wdata    [24],bist_wdata    [12:0],bist_wdata    [68:56]	}),
	.din1	({          1'b1, tag_to_write  [24],tag_to_write  [12:0],tag_to_write  [68:56]	}),
	.din2	({          1'b1, tag_to_demap_d[24],tag_to_demap_d[12:0],tag_to_demap_d[68:56]	}),
	.sel0	(tlc_mbi_run							),
	.sel1	(tlc_sel_write_tag						),
	.sel2	(tlc_sel_dm_tag						  	),
	.dout	(tag0[27:0])
);
lsu_tld_dp_buff_macro__width_28 tag0_buf  (
	.din	(tag0[27:0]),
	.dout	({tld_ubit, tld_tag_valid,tld_tag_c0    [12:0],tld_tag_c1     [12:0]	})
);

// VA/PID/Real bit are muxed differently.  I use two levels of muxing to keep
// the delay for the exu address path to a minimum.
lsu_tld_dp_mux_macro__mux_aonpe__ports_3__stack_42l__width_42 mx_tag1_d     (
	.din0	({bist_wdata    [52],bist_wdata    [31:25],bist_wdata    [23:13],bist_wdata    [51:32],bist_wdata    [55:53]	}),
	.din1	({tag_to_write  [52],tag_to_write  [31:25],tag_to_write  [23:13],tag_to_write  [51:32],tag_to_write  [55:53]	}),
	.din2	({tag_to_demap_d[52],tag_to_demap_d[31:25],tag_to_demap_d[23:13],tag_to_demap_d[51:32],tag_to_demap_d[55:53]	}),
	.sel0	(tlc_mbi_run	        		        					 			 ),
	.sel1	(tlc_sel_write_tag      		        					 			 ),
	.sel2	(tlc_sel_dm_tag						  	),
	.dout	({tld_tag_0     [52],tld_tag_0     [31:25],tld_tag_0     [23:13],tld_tag_0     [51:32],tld_tag_0     [55:53]	})
);

lsu_tld_dp_buff_macro__dbuff_32x__stack_none__width_35 exu_addr_buf   (
	.din	({tld_tag_0[51:26],tld_tag_0[23:18],tld_tag_0[16:14]}),
	.dout	(lsu_exu_address_e[47:13])
);

//                   R                   27_22_V       21_16_V           15_13_V           PID
lsu_tld_dp_mux_macro__mux_pgpe__ports_2__stack_42r__width_7 mx_tag2_d     (
	.din0	({tld_tag_0     [52],tld_tag_0  [25],tld_tag_0  [17],tld_tag_0  [13],tld_tag_0  [55:53]	}),
	.din1	({default_tag   [52],default_tag[25],default_tag[17],default_tag[13],default_tag[55:53]	}),
	.sel0	(tlc_sel_wr_dm_bist     		           		 		      ),
	.dout	({tld_tag_real      ,tld_tag_mask[2],tld_tag_mask[1],tld_tag_mask[0],tld_tag_pid[2:0]	})
);

assign default_unused=default_tag[24];

lsu_tld_dp_mux_macro__mux_aope__ports_3__stack_8l__width_7 mx_index     (
	.din0	(tld_mbi_addr[6:0]				),
	.din1	(tte2[53:47]					),
	.din2	(exu_lsu_address_e[9:3]				),
	.sel0	(tlc_mbi_run					),
	.sel1	(tlc_sel_write_tag				),
	.dout	(tld_rw_index[6:0]				)
);

///////////////////////////////////////////////
// Parity generation for tte_tag
///////////////////////////////////////////////

// Mask the appropriate address/context bits based on page size and RA or VA trans type.

lsu_tld_dp_inv_macro__width_3 pg_mask_va  (
	.din	({tag_to_write[25],tag_to_write[17],tag_to_write[13]}),
	.dout	({mask_va_27_22_,  mask_va_21_16_,  mask_va_15_13_})
);
lsu_tld_dp_inv_macro__width_1 pg_mask_ctxt  (
	.din	(tag_to_write[52]),
	.dout	(mask_context_)
);

lsu_tld_dp_and_macro__ports_2__stack_28l__width_28 mask_tag    (
	.din0	({tag_to_write[31:26],
		  tag_to_write[23:18],
		  tag_to_write[16:14],
		  tag_to_write[12:0]}),
	.din1	({{6{mask_va_27_22_}},
		  {6{mask_va_21_16_}},
		  {3{mask_va_15_13_}},
		  {13{mask_context_}}}),
	.dout	({masked_va[27:22],
		  masked_va[21:16],
		  masked_va[15:13],
		  masked_ctxt[12:0]})
);

lsu_tld_dp_mux_macro__left_6__mux_aonpe__ports_2__stack_70c__width_52 parity_mux      (
	.din0	({tag_to_write[55:53],	
		  tag_to_write[52],	
		  tag_to_write[51:32],	
		  masked_va   [27:22],	
		  masked_va   [21:16],	
		  masked_va   [15:13],	
		  masked_ctxt [12:0]}),
	.din1	({access_tag_m[55:53],	
		  access_tag_m[52],	
		  va_m        [47:22],	
		  va_m        [21:16],	
		  va_m        [15:13],	
		  13'b0}),
	.sel0	(wrdata_sel	),
	.sel1	(wrdata_sel_	),
	.dout	({tag_for_parity[51:0]})
);

lsu_tld_dp_prty_macro__width_32 tag_pgen0  (
	.din	({tlc_tag_error_inj,1'b0,tag_for_parity[51:28],6'b0}),
	.dout	(tag_parity_unmasked)
);
lsu_tld_dp_prty_macro__width_32 tag_pgen1  (
	.din	({2'b0,tag_for_parity[27:0],2'b0}),
	.dout	(tag_parity_masked)
);
lsu_tld_dp_inv_macro__width_2 inv_tag_par  (
	.din	({tag_parity_unmasked ,tag_parity_masked}),
	.dout	({tag_parity_unmasked_,tag_parity_masked_})
);
lsu_tld_dp_xor_macro__ports_2__width_1 pgen_tag   (
	.din0	(tag_parity_unmasked_),
	.din1	(tag_parity_masked_),
	.dout	(tag_parity)
);

// Additional logic needed to complete parity detection.  
// tag_parity_unmasked is valid for all page sizes (it's complete for 256m)
// tag_parity_masked represents the addtional parity for 8k pages

lsu_tld_dp_inv_macro__width_2 pgen_256m  (
	.din	({tag_parity_unmasked_,tag_parity_masked_}),
	.dout	({prty_256m,           prty_8k_lower})
);

lsu_tld_dp_prty_macro__width_8 pgen_va_27_22  (
	.din	({va_m[27:22],2'b00}),
	.dout	(prty_va_27_22)
);
lsu_tld_dp_xor_macro__ports_2__width_1 pgen_4m   (
	.din0	(prty_256m),
	.din1	(prty_va_27_22),
	.dout	(prty_4m)
);

lsu_tld_dp_prty_macro__width_16 pgen_va_27_16  (
	.din	({va_m[27:22],4'b0000,va_m[21:16]}),
	.dout	(prty_va_27_16)
);
lsu_tld_dp_xor_macro__ports_2__width_1 pgen_64k   (
	.din0	(prty_256m),
	.din1	(prty_va_27_16),
	.dout	(prty_64k)
);

lsu_tld_dp_xor_macro__ports_2__width_1 pgen_8k   (
	.din0	(prty_256m),
	.din1	(prty_8k_lower),
	.dout	(prty_8k)
);

lsu_tld_dp_prty_macro__width_16 pgen_ctxt0  (
	.din	({access_tag_m[12:0],3'b000}),
	.dout	(prty_ctxt0)
);
lsu_tld_dp_prty_macro__width_16 pgen_ctxt1  (
	.din	({3'b000,access_tag_m[68:56]}),
	.dout	(prty_ctxt1)
);

lsu_tld_dp_buff_macro__width_6 prty_buf  (
	.din	({    prty_256m,    prty_4m,    prty_64k,    prty_8k,    prty_ctxt1,    prty_ctxt0}),
	.dout	({tld_prty_256m,tld_prty_4m,tld_prty_64k,tld_prty_8k,tld_prty_ctxt1,tld_prty_ctxt0})
);

///////////////////////////TTE data////////////////////////////////////////////
                                
// Data is only needed for write, so only need a mux for bist

assign wr_data[36:0] = 
       {data_parity	       ,	// Data Parity
	tte2		[33:22],	// PA[39:28]
	tte2		[21:16],	// PA[27:22]
	tte1		[21   ],	// 27_22_V, PS_EQ_256M
	tte2		[15:10],	// PA[21:16]
	tte2		[42   ],	// 21_16_V, PS_GT_64K
	tte2		[9:7],	// PA[15:13]
	tte2		[38   ],	// 15_13_V, PS_GT_8K
	tte2		[5:0]		// NFO, IE, CP, E, P, W
	};	

lsu_tld_dp_mux_macro__mux_aope__ports_3__stack_20r__width_19 mx_data_odd     (
        .din0   ({16'b0,tld_mbi_addr[5],tld_mbi_addr[3],tld_mbi_addr[1]}),
        .din1   ({bist_data_1[5],bist_data_1[3],bist_data_1[1],{4{bist_data_1[7],bist_data_1[5],bist_data_1[3],bist_data_1[1]}}}),
        .din2   ({            tag_parity ,wr_data[35],wr_data[33],wr_data[31],
                  wr_data[29],wr_data[27],wr_data[25],wr_data[23],wr_data[21],
                  wr_data[19],wr_data[17],wr_data[15],wr_data[13],wr_data[11],
                  wr_data[9],wr_data[7],wr_data[5],wr_data[3],wr_data[1]}),
        .sel0   (tld_mbi_cambist_run),
        .sel1   (tlc_mbi_run),
        .dout   ({             tld_data[37],tld_data[35],tld_data[33],tld_data[31],
                  tld_data[29],tld_data[27],tld_data[25],tld_data[23],tld_data[21],
                  tld_data[19],tld_data[17],tld_data[15],tld_data[13],tld_data[11],
                  tld_data[9],tld_data[7],tld_data[5],tld_data[3],tld_data[1]})
);
lsu_tld_dp_mux_macro__mux_aope__ports_3__stack_20r__width_19 mx_data_even     (
        .din0   ({15'b0,tld_mbi_addr[6],tld_mbi_addr[4],tld_mbi_addr[2],tld_mbi_addr[0]}),
        .din1   ({bist_data_1[4],bist_data_1[2],bist_data_1[0],{4{bist_data_1[6],bist_data_1[4],bist_data_1[2],bist_data_1[0]}}}),
        .din2   ({            wr_data[36],wr_data[34],wr_data[32],wr_data[30],
                  wr_data[28],wr_data[26],wr_data[24],wr_data[22],wr_data[20],
                  wr_data[18],wr_data[16],wr_data[14],wr_data[12],wr_data[10],
                  wr_data[8],wr_data[6],wr_data[4],wr_data[2],wr_data[0]}),
        .sel0   (tld_mbi_cambist_run),
        .sel1   (tlc_mbi_run),
        .dout   ({             tld_data[36],tld_data[34],tld_data[32],tld_data[30],
                  tld_data[28],tld_data[26],tld_data[24],tld_data[22],tld_data[20],
                  tld_data[18],tld_data[16],tld_data[14],tld_data[12],tld_data[10],
                  tld_data[8],tld_data[6],tld_data[4],tld_data[2],tld_data[0]})
);

lsu_tld_dp_prty_macro__width_16 dprty0  (
	.din	({tlc_data_error_inj,wr_data[10],wr_data[7:6],1'b0,wr_data[35:25]}),
	.dout	(data_parity_0)
);
lsu_tld_dp_prty_macro__width_16 dprty1  (
	.din	({wr_data[24],wr_data[17],wr_data[23:18],wr_data[16:11],wr_data[9:8]}),
	.dout	(data_parity_1)
);
lsu_tld_dp_prty_macro__width_8 dprty2  (
	.din	({wr_data[5:0],data_parity_0,data_parity_1}),
	.dout	(data_parity)
);

assign tld_demap_control0[2:0] =
       tte0[45:43];
assign tld_demap_control1[3:0] =
       tte1[46:43];



////////////////////////////////////////////////////////////////////
// VA staging from E to M - it's located here for floorplan reasons
lsu_tld_dp_msff_macro__stack_48c__width_48 va_m_lat    (
	.scan_in(va_m_lat_scanin),
	.scan_out(va_m_lat_scanout),
	.se	(tcu_se_scancollar_in),
	.din	(exu_lsu_address_e[47:0]),
	.dout	(va_m[47:0]),
  .clk(clk),
  .en(en),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_tld_dp_zero_macro__width_32 va_m_zdt  (
	.din	(va_m[47:16]),
	.dout	(tld_va_m_eq_zero)
);

lsu_tld_dp_buff_macro__rep_1__stack_48c__width_48 lsu_va_m_buf   (
	.din	(va_m[47:0]),
	.dout	(lsu_va_m[47:0])
);
lsu_tld_dp_buff_macro__rep_1__stack_48c__width_48 lsu_mmu_va_m_buf   (
	.din	(va_m[47:0]),
	.dout	(lsu_mmu_va_m[47:0])
);

lsu_tld_dp_msff_macro__stack_22r__width_22 bist_lat    (
	.scan_in(bist_lat_scanin),
	.scan_out(bist_lat_scanout),
	.en	(tlc_mbi_run),
	.din	({bist_data_0[7:0],    mbi_addr[6:0],        mbi_dtb_write_en,     mbi_cambist_run,
		  mbi_repl_write,      mbi_dis_clr_ubit,
		  mbi_dtb_demap_en,    mbi_demap_type[1:0]}),
	.dout	({bist_data_1[7:0],    tld_mbi_addr[6:0],    tld_mbi_dtb_write_en, tld_mbi_cambist_run,
		  tld_mbi_repl_write,  tld_mbi_dis_clr_ubit,
		  tld_mbi_dtb_demap_en,tld_mbi_demap_type[1:0]}),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// fixscan start:
assign tte0_lat_scanin           = scan_in                  ;
assign tte1_lat_scanin           = tte0_lat_scanout         ;
assign tte2_lat_scanin           = tte1_lat_scanout         ;
assign test_data_mux_scanin      = tte2_lat_scanout         ;
assign va_m_lat_scanin           = test_data_mux_scanout    ;
assign bist_lat_scanin           = va_m_lat_scanout         ;
assign scan_out                  = bist_lat_scanout         ;
// fixscan end:
endmodule	


//
//   buff macro
//
//





module lsu_tld_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 (
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

module lsu_tld_dp_msff_macro__stack_70c__width_55 (
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
wire [53:0] so;

  input [54:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [54:0] dout;


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
dff #(55)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[54:0]),
.si({scan_in,so[53:0]}),
.so({so[53:0],scan_out}),
.q(dout[54:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_tld_dp_mux_macro__mux_aope__ports_2__stack_70c__width_13 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [12:0] din0;
  input [12:0] din1;
  input sel0;
  output [12:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(13)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[12:0]),
  .in1(din1[12:0]),
.dout(dout[12:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module lsu_tld_dp_msff_macro__mux_aope__ports_2__stack_70c__width_52 (
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
wire [51:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [50:0] so;

  input [51:0] din0;
  input [51:0] din1;
  input sel0;


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




cl_dp1_penc2_8x  c1_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(52)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[51:0]),
  .in1(din1[51:0]),
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





module lsu_tld_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






buff #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);








endmodule









// any PARAMS parms go into naming of macro

module lsu_tld_dp_msff_macro__mux_aope__ports_4__stack_70c__width_70 (
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
wire [69:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [68:0] so;

  input [69:0] din0;
  input [69:0] din1;
  input [69:0] din2;
  input [69:0] din3;
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



  output [69:0] dout;


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

mux4s #(70)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[69:0]),
  .in1(din1[69:0]),
  .in2(din2[69:0]),
  .in3(din3[69:0]),
.dout(muxout[69:0])
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
dff #(70)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[69:0]),
.si({scan_in,so[68:0]}),
.so({so[68:0],scan_out}),
.q(dout[69:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_tld_dp_mux_macro__mux_aonpe__ports_3__stack_28l__width_28 (
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

  input [27:0] din0;
  input sel0;
  input [27:0] din1;
  input sel1;
  input [27:0] din2;
  input sel2;
  output [27:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(28)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[27:0]),
  .in1(din1[27:0]),
  .in2(din2[27:0]),
.dout(dout[27:0])
);









  



endmodule


//
//   buff macro
//
//





module lsu_tld_dp_buff_macro__width_28 (
  din, 
  dout);
  input [27:0] din;
  output [27:0] dout;






buff #(28)  d0_0 (
.in(din[27:0]),
.out(dout[27:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_tld_dp_mux_macro__mux_aonpe__ports_3__stack_42l__width_42 (
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

  input [41:0] din0;
  input sel0;
  input [41:0] din1;
  input sel1;
  input [41:0] din2;
  input sel2;
  output [41:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(42)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[41:0]),
  .in1(din1[41:0]),
  .in2(din2[41:0]),
.dout(dout[41:0])
);









  



endmodule


//
//   buff macro
//
//





module lsu_tld_dp_buff_macro__dbuff_32x__stack_none__width_35 (
  din, 
  dout);
  input [34:0] din;
  output [34:0] dout;






buff #(35)  d0_0 (
.in(din[34:0]),
.out(dout[34:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_tld_dp_mux_macro__mux_pgpe__ports_2__stack_42r__width_7 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [6:0] din0;
  input [6:0] din1;
  input sel0;
  output [6:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(7)  d0_0 (
  .sel(psel1),
  .in0(din0[6:0]),
  .in1(din1[6:0]),
.dout(dout[6:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_tld_dp_mux_macro__mux_aope__ports_3__stack_8l__width_7 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [6:0] din0;
  input [6:0] din1;
  input [6:0] din2;
  input sel0;
  input sel1;
  output [6:0] dout;





cl_dp1_penc3_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(7)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[6:0]),
  .in1(din1[6:0]),
  .in2(din2[6:0]),
.dout(dout[6:0])
);









  



endmodule


//
//   invert macro
//
//





module lsu_tld_dp_inv_macro__width_3 (
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
//   invert macro
//
//





module lsu_tld_dp_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module lsu_tld_dp_and_macro__ports_2__stack_28l__width_28 (
  din0, 
  din1, 
  dout);
  input [27:0] din0;
  input [27:0] din1;
  output [27:0] dout;






and2 #(28)  d0_0 (
.in0(din0[27:0]),
.in1(din1[27:0]),
.out(dout[27:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_tld_dp_mux_macro__left_6__mux_aonpe__ports_2__stack_70c__width_52 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [51:0] din0;
  input sel0;
  input [51:0] din1;
  input sel1;
  output [51:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(52)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[51:0]),
  .in1(din1[51:0]),
.dout(dout[51:0])
);









  



endmodule


//
//   parity macro (even parity)
//
//





module lsu_tld_dp_prty_macro__width_32 (
  din, 
  dout);
  input [31:0] din;
  output dout;







prty #(32)  m0_0 (
.in(din[31:0]),
.out(dout)
);










endmodule





//
//   invert macro
//
//





module lsu_tld_dp_inv_macro__width_2 (
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
//   xor macro for ports = 2,3
//
//





module lsu_tld_dp_xor_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;





xor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);








endmodule





//
//   parity macro (even parity)
//
//





module lsu_tld_dp_prty_macro__width_8 (
  din, 
  dout);
  input [7:0] din;
  output dout;







prty #(8)  m0_0 (
.in(din[7:0]),
.out(dout)
);










endmodule





//
//   parity macro (even parity)
//
//





module lsu_tld_dp_prty_macro__width_16 (
  din, 
  dout);
  input [15:0] din;
  output dout;







prty #(16)  m0_0 (
.in(din[15:0]),
.out(dout)
);










endmodule





//
//   buff macro
//
//





module lsu_tld_dp_buff_macro__width_6 (
  din, 
  dout);
  input [5:0] din;
  output [5:0] dout;






buff #(6)  d0_0 (
.in(din[5:0]),
.out(dout[5:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_tld_dp_mux_macro__mux_aope__ports_3__stack_20r__width_19 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [18:0] din0;
  input [18:0] din1;
  input [18:0] din2;
  input sel0;
  input sel1;
  output [18:0] dout;





cl_dp1_penc3_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(19)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[18:0]),
  .in1(din1[18:0]),
  .in2(din2[18:0]),
.dout(dout[18:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module lsu_tld_dp_msff_macro__stack_48c__width_48 (
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
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module lsu_tld_dp_zero_macro__width_32 (
  din, 
  dout);
  input [31:0] din;
  output dout;






zero #(32)  m0_0 (
.in(din[31:0]),
.out(dout)
);










endmodule





//
//   buff macro
//
//





module lsu_tld_dp_buff_macro__rep_1__stack_48c__width_48 (
  din, 
  dout);
  input [47:0] din;
  output [47:0] dout;






buff #(48)  d0_0 (
.in(din[47:0]),
.out(dout[47:0])
);








endmodule









// any PARAMS parms go into naming of macro

module lsu_tld_dp_msff_macro__stack_22r__width_22 (
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
wire [20:0] so;

  input [21:0] din;


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
.d(din[21:0]),
.si({scan_in,so[20:0]}),
.so({so[20:0],scan_out}),
.q(dout[21:0])
);




















endmodule








