// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_ftu_itd_dp.v
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
module ifu_ftu_itd_dp (
  tcu_scan_en, 
  tcu_muxtest, 
  tcu_dectest, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  default_pid, 
  default_r, 
  default_context_0, 
  default_context_1, 
  write_context_0, 
  write_context_1, 
  itc_sel_trap_pc_0, 
  itc_sel_trap_pc_1, 
  itc_sel_demap_tag_d, 
  itc_sel_demap_tag_c0, 
  itc_sel_demap_tag_c1, 
  itc_sel_write_tag, 
  itc_sel_default, 
  itc_sel_write_tag_indexed, 
  itc_tag_error_inj, 
  itc_data_error_inj, 
  ifu_agd_pc_bf, 
  tlu_trap_pc_0, 
  tlu_trap_pc_1, 
  mmu_index, 
  ftp_thr0_pid_data, 
  ftp_thr1_pid_data, 
  ftp_thr2_pid_data, 
  ftp_thr3_pid_data, 
  ftp_thr4_pid_data, 
  ftp_thr5_pid_data, 
  ftp_thr6_pid_data, 
  ftp_thr7_pid_data, 
  asi_addr_bf, 
  mbi_addr, 
  mbi_wdata, 
  mbi_run, 
  mbi_cambist_run, 
  mbi_cambist_shift, 
  mbi_init_to_zero, 
  itc_sel_mbist, 
  itc_write_next, 
  scan_out, 
  itd_tag, 
  itd_data, 
  itd_index_valid_in, 
  itd_rw_index, 
  itd_prty_256m, 
  itd_prty_4m, 
  itd_prty_64k, 
  itd_prty_8k, 
  itd_prty_ctxt0, 
  itd_prty_ctxt1);
wire stop;
wire en;
wire test;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire [54:0] tlu_tte;
wire tte0_lat_scanin;
wire tte0_lat_scanout;
wire init_or_shift;
wire [54:0] tte0;
wire init_or_shift_bf;
wire tte1_lat_scanin;
wire tte1_lat_scanout;
wire [54:0] tte1;
wire not_init_and_run;
wire not_init_nor_run;
wire [54:0] tte2;
wire not_init_and_run_bf;
wire not_init_nor_run_bf;
wire [2:0] partition_id1_to_buf;
wire [2:0] partition_id1;
wire [68:0] tag_to_demap_d;
wire [68:0] tag_to_demap_c0;
wire [12:0] write_context_0_ff;
wire [68:0] tag_to_demap_c1;
wire [12:0] write_context_1_ff;
wire prty_tte0_ctxt_;
wire sel_write_tag_c0;
wire sel_write_tag_c1;
wire [13:0] context_to_write_in;
wire [68:0] tag_to_write;
wire [13:0] context_to_write;
wire [2:0] partition_id2;
wire context_to_write_prty;
wire mask_va_27_22_;
wire mask_va_21_16_;
wire mask_va_15_13_;
wire mask_context_;
wire [27:13] masked_va;
wire masked_ctxt_parity;
wire [68:0] access_tag_f;
wire wrdata_sel;
wire [51:13] tag_for_parity;
wire mux_masked_ctxt_parity;
wire tag_parity_unmasked;
wire tag_parity_masked;
wire tag_parity;
wire [7:0] mbist_wdata_bf;
wire mbist_run;
wire tag_parity_out;
wire prty_256m;
wire prty_8k_lower;
wire prty_va_27_22;
wire prty_4m;
wire prty_va_27_16;
wire prty_64k;
wire prty_8k;
wire prty_ctxt0;
wire prty_ctxt1;
wire [68:0] access_tag_in;
wire access_tag_reg_scanin;
wire access_tag_reg_scanout;
wire access_tag_reg0_scanin;
wire access_tag_reg0_scanout;
wire write_context_0_reg_scanin;
wire write_context_0_reg_scanout;
wire write_context_1_reg_scanin;
wire write_context_1_reg_scanout;
wire context_to_write_reg_scanin;
wire context_to_write_reg_scanout;
wire tte2_lat_scanin;
wire tte2_lat_scanout;
wire [52:0] tte2_out;
wire [3:0] atm_unused;
wire [6:0] tte2_unused;
wire tte1_unused;
wire [68:0] mbist_wdata;
wire [7:0] mbist_wdata_dup;
wire [37:0] data_mbist_wdata;
wire [68:0] mbist_camdata;
wire [68:0] mbist_camdata_shift;
wire [68:0] bist_wdata;
wire [68:0] itd_tag_to_buf;
wire [5:0] mbist_index;
wire [5:0] itd_rw_index_to_buf;
wire mbist_in_reg_scanin;
wire mbist_in_reg_scanout;
wire [5:0] mbist_index_to_buf;
wire [7:0] mbist_wdata_to_buf;
wire mbist_run_to_buf;
wire cambist_run_bf;
wire mbist_in_dup_reg_scanin;
wire mbist_in_dup_reg_scanout;
wire tcu_muxtest_rep0;
wire [37:0] data_to_write;
wire [36:0] itd_data_to_buf;
wire data_parity;
wire data_parity_0;
wire data_parity_1;
wire init_or_shift_nor;
wire [1:0] itd_demap_control1;
wire demap_control1_0_;




input tcu_scan_en ;
input tcu_muxtest;
input tcu_dectest;
input		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;

input	[2:0] default_pid;
input		default_r;
input	[12:0] default_context_0;
input	[12:0] default_context_1;
input	[13:0] write_context_0;
input	[13:0] write_context_1;

input		itc_sel_trap_pc_0;
input		itc_sel_trap_pc_1;
input		itc_sel_demap_tag_d;
input		itc_sel_demap_tag_c0;
input		itc_sel_demap_tag_c1;
input		itc_sel_write_tag;
input           itc_sel_default;
input		itc_sel_write_tag_indexed;
input 	        itc_tag_error_inj;
input 	        itc_data_error_inj;

input	[47:13]	ifu_agd_pc_bf;

input	[47:0]	tlu_trap_pc_0;
input	[47:0]	tlu_trap_pc_1;
input	[6:0]	mmu_index;		// valid and index from data_access

input	[2:0]	ftp_thr0_pid_data;
input	[2:0]	ftp_thr1_pid_data;
input	[2:0]	ftp_thr2_pid_data;
input	[2:0]	ftp_thr3_pid_data;
input	[2:0]	ftp_thr4_pid_data;
input	[2:0]	ftp_thr5_pid_data;
input	[2:0]	ftp_thr6_pid_data;
input	[2:0]	ftp_thr7_pid_data;

input	[8:3]	asi_addr_bf;
input   [5:0] mbi_addr;
input   [7:0]	mbi_wdata;
input 	        mbi_run;
input           mbi_cambist_run;
input           mbi_cambist_shift;
input           mbi_init_to_zero;

input 		itc_sel_mbist;
input           itc_write_next;

output		scan_out;

output	[68:0]	itd_tag;
output	[37:0]	itd_data;
// output	[02:00]	itd_demap_control1;
output		itd_index_valid_in;
output	[5:0]	itd_rw_index;
output		itd_prty_256m;
output		itd_prty_4m;
output		itd_prty_64k;
output		itd_prty_8k;
output		itd_prty_ctxt0;
output		itd_prty_ctxt1;


					
// assign pce_ov	= tcu_pce_ov;
assign stop	= 1'b0;
// assign siclk	= spc_aclk;
// assign soclk	= spc_bclk;
assign en	= 1'b1;
// assign clk	= l2clk;
assign test  	= tcu_dectest;

ifu_ftu_itd_dp_buff_macro__dbuff_32x__stack_none__width_4 test_rep0  (
  .din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk}),
  .dout({se,pce_ov,siclk,soclk})
);



///////////////////////////////////////////////////////////////////////////////
// Flop the TTE from TLU

// First cycle of transfer 
// (part of tag, data, controls)
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

ifu_ftu_itd_dp_mux_macro__mux_aonpe__ports_2__stack_60c__width_55 tte_mux     (
	.din0	({mmu_index		[6:0],
		  tlu_trap_pc_0		[47:0]}),
	.din1	({mmu_index		[6:0],
		  tlu_trap_pc_1		[47:0]}),
	.sel0	(itc_sel_trap_pc_0		),
	.sel1	(itc_sel_trap_pc_1		),
	.dout	(tlu_tte		[54:0]	)
 
);

ifu_ftu_itd_dp_msff_macro__stack_60c__width_56 tte0_lat   (
        .scan_in(tte0_lat_scanin),
        .scan_out(tte0_lat_scanout),
        .clk ( l2clk                ),
	.din	({tlu_tte		[54:0]	,init_or_shift }),
	.dout	({tte0			[54:0]	,init_or_shift_bf}),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

ifu_ftu_itd_dp_msff_macro__stack_60c__width_59 tte1_lat   (
        .scan_in(tte1_lat_scanin),
        .scan_out(tte1_lat_scanout),
        .clk ( l2clk                ),
	.din	({tte0[54:0],  tte1[37:36],not_init_and_run , not_init_nor_run}	),
	.dout	({tte1[54:0],  tte2[37:36],not_init_and_run_bf , not_init_nor_run_bf }	),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);





///////////////////////////TTE tag///////////////////////////////////////////////

// First must capture partition ID for both cycles
ifu_ftu_itd_dp_mux_macro__mux_aodec__ports_8__stack_4r__width_3 mx_pid1     (
	.din0	(ftp_thr0_pid_data[2:0]),
	.din1	(ftp_thr1_pid_data[2:0]),
	.din2	(ftp_thr2_pid_data[2:0]),
	.din3	(ftp_thr3_pid_data[2:0]),
	.din4	(ftp_thr4_pid_data[2:0]),
	.din5	(ftp_thr5_pid_data[2:0]),
	.din6	(ftp_thr6_pid_data[2:0]),
	.din7	(ftp_thr7_pid_data[2:0]),
	.sel	(tte1[37:35]),
	.dout	(partition_id1_to_buf[2:0])
);

ifu_ftu_itd_dp_buff_macro__stack_4c__width_3 mx_pid1_buf   (
    .din(partition_id1_to_buf[2:0]),
    .dout(partition_id1[2:0]));

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

// Demap with context 0
assign tag_to_demap_c0[68:0] =
       {write_context_0_ff	[12:0],	// Context[12:00]
	partition_id1		[2:0],	// PID
	tte1			[34   ],	// R
	tte0			[47:28],	// VA[47:28]
	tte0			[27:22],	// VA[27:22]
	tte0			[21   ],	// 27_22_V
	tte0			[20   ],	// V
	tte0			[18:13],	// VA[21:16]
	tte1			[42   ],	// 21_16_V
	tte1			[41:39],	// VA[15:13]
	tte1			[38   ],	// 15_13_V
	write_context_0_ff	[12:0]};	// Context[12:00]
	
// Demap with context 1
assign tag_to_demap_c1[68:0] =
       {write_context_1_ff	[12:0],	// Context[12:00]
	partition_id1		[2:0],	// PID
	tte1			[34   ],	// R
	tte0			[47:28],	// VA[47:28]
	tte0			[27:22],	// VA[27:22]
	tte0			[21   ],	// 27_22_V
	tte0			[20   ],	// V
	tte0			[18:13],	// VA[21:16]
	tte1			[42   ],	// 21_16_V
	tte1			[41:39],	// VA[15:13]
	tte1			[38   ],	// 15_13_V
	write_context_1_ff	[12:0]};	// Context[12:00]

// Mux context for write tag
ifu_ftu_itd_dp_mux_macro__mux_aope__ports_3__stack_14r__width_14 context_to_write_mux     (
	.din0	(write_context_0	[13:0]	),
	.din1	(write_context_1	[13:0]	),
	.din2	({prty_tte0_ctxt_, tte0	[12:0]}),
	.sel0	(sel_write_tag_c0		),
	.sel1	(sel_write_tag_c1		),
	.dout	(context_to_write_in	[13:0]	)
);

// buff_macro context_to_write_buf (width=14, stack=14r) (
//     .din(context_to_write_to_buf[13:0]),
//     .dout(context_to_write[13:0]));

// Write with muxed context
assign tag_to_write[68:0] =
       {context_to_write[12:0],	// Context		68:56
	partition_id2	[2:0],	// PID			55:53
	tte2		[34   ],	// R			52
	tte1		[47:28],	// VA[47:28]		51:32
	tte1		[27:22],	// VA[27:22]		31:26
	tte1		[21   ],	// 27_22_V		25
	tte1		[20   ],	// V			24
	tte1		[18:13],	// VA[21:16]		23:18
	tte2		[42   ],	// 21_16_V		17
	tte2		[41:39],	// VA[15:13]		16:14
	tte2		[38   ],	// 15_13_V		13
	context_to_write[12:0]		// Context[12:00]	12:00
	};
	
assign context_to_write_prty = context_to_write[13] ;

///////////////////////////////////////////////
// Parity generation for tte_tag
///////////////////////////////////////////////

// Mask the appropriate address/context bits based on page size and RA or VA trans type.

ifu_ftu_itd_dp_inv_macro__width_3 pg_mask_va  (
	.din	({tag_to_write[25],tag_to_write[17],tag_to_write[13]}),
	.dout	({mask_va_27_22_,  mask_va_21_16_,  mask_va_15_13_})
);
ifu_ftu_itd_dp_inv_macro__width_1 pg_mask_ctxt  (
	.din	(tag_to_write[52]),
	.dout	(mask_context_)
);

ifu_ftu_itd_dp_and_macro__ports_2__stack_16l__width_16 mask_tag    (
	.din0	({tag_to_write[31:26],
		  tag_to_write[23:18],
		  tag_to_write[16:14],
		  context_to_write_prty}),
	.din1	({{6{mask_va_27_22_}},
		  {6{mask_va_21_16_}},
		  {3{mask_va_15_13_}},
		     mask_context_}),
	.dout	({masked_va[27:22],
		  masked_va[21:16],
		  masked_va[15:13],
		  masked_ctxt_parity})
);

ifu_ftu_itd_dp_mux_macro__left_2__mux_pgpe__ports_2__stack_60c__width_40 parity_mux      (
	.din0	({ tag_to_write[55:53],	
		  tag_to_write[52],	
		  tag_to_write[51:32],	
		  masked_va   [27:22],	
		  masked_va   [21:16],	
		  masked_va   [15:13],
                  masked_ctxt_parity}),	
	.din1	({ access_tag_f[55:53],	
		  access_tag_f[52],	
		  access_tag_f[51:26],	
		  access_tag_f[23:18],	
		  access_tag_f[16:14],
                  1'b0}),	
	.sel0	(wrdata_sel	),
	.dout	({ tag_for_parity[51:13], mux_masked_ctxt_parity})
);

ifu_ftu_itd_dp_prty_macro__width_32 tag_pgen0  (
	.din	({itc_tag_error_inj,1'b0,tag_for_parity[51:28],6'b0}),
	.dout	(tag_parity_unmasked)
);
ifu_ftu_itd_dp_prty_macro__width_16 tag_pgen1  (
	.din	({tag_for_parity[27:13],mux_masked_ctxt_parity}),
	.dout	(tag_parity_masked)
);
// inv_macro inv_tag_par (width=2) (
// 	.din	({tag_parity_unmasked ,tag_parity_masked}),
// 	.dout	({tag_parity_unmasked_,tag_parity_masked_}),
// );
ifu_ftu_itd_dp_xor_macro__ports_2__width_1 pgen_tag   (
	.din0	(tag_parity_unmasked),
	.din1	(tag_parity_masked),
	.dout	(tag_parity)
);
// inv_macro write_inv (width=1) (
// 	.din	(itc_write_next ),
// 	.dout	(write_next_))
// ;
ifu_ftu_itd_dp_mux_macro__mux_pgpe__ports_2__stack_2r__width_1 tag_pmux     (
	.din0	(mbist_wdata_bf[5]),
	.din1	(tag_parity),
	.sel0	(mbist_run),
	.dout	(tag_parity_out)
);
// buff_macro tag_pbuf (width=1) (
// 	.din	(tag_parity_out),
// 	.dout	(tld_data[37])
// );

// Additional logic needed to complete parity detection.  
// tag_parity_unmasked is valid for all page sizes (it's complete for 256m)
// tag_parity_masked represents the addtional parity for 8k pages


assign prty_256m     = tag_parity_unmasked ;
assign prty_8k_lower = tag_parity_masked ; 

ifu_ftu_itd_dp_prty_macro__width_8 pgen_va_27_22  (
	.din	({access_tag_f[31:26],2'b00}),
	.dout	(prty_va_27_22)
);
ifu_ftu_itd_dp_xor_macro__ports_2__width_1 pgen_4m   (
	.din0	(prty_256m),
	.din1	(prty_va_27_22),
	.dout	(prty_4m)
);

ifu_ftu_itd_dp_prty_macro__width_16 pgen_va_27_16  (
	.din	({access_tag_f[31:26],4'b0000,access_tag_f[23:18]}),
	.dout	(prty_va_27_16)
);
ifu_ftu_itd_dp_xor_macro__ports_2__width_1 pgen_64k   (
	.din0	(prty_256m),
	.din1	(prty_va_27_16),
	.dout	(prty_64k)
);

ifu_ftu_itd_dp_xor_macro__ports_2__width_1 pgen_8k   (
	.din0	(prty_256m),
	.din1	(prty_8k_lower),
	.dout	(prty_8k)
);

 ifu_ftu_itd_dp_prty_macro__width_16 pgen_ctxt0  (
 	.din	({access_tag_f[12:0],3'b000}),
 	.dout	(prty_ctxt0)
 );
 ifu_ftu_itd_dp_prty_macro__width_16 pgen_ctxt1  (
 	.din	({3'b000,access_tag_f[68:56]}),
 	.dout	(prty_ctxt1)
 );

ifu_ftu_itd_dp_buff_macro__width_6 prty_buf  (
	.din	({    prty_256m,    prty_4m,    prty_64k,    prty_8k,    prty_ctxt0,    prty_ctxt1}),
	.dout	({itd_prty_256m,itd_prty_4m,itd_prty_64k,itd_prty_8k,itd_prty_ctxt0,itd_prty_ctxt1})
);

/////////////////////////////////////////////////////////////////////////////////////////////////////////////


 ifu_ftu_itd_dp_prty_macro__width_16 pgen_tte0_ctxt  (
  	.din	({1'b0,tte0[12:0],2'b00}),
  	.dout	(prty_tte0_ctxt_)
  );


assign access_tag_in[68:0] = {itd_tag[68:52],ifu_agd_pc_bf[47:22],itd_tag[25:24],
                              ifu_agd_pc_bf[21:16],itd_tag[17],ifu_agd_pc_bf[15:13],itd_tag[13:0]};

ifu_ftu_itd_dp_msff_macro__stack_60c__width_56 access_tag_reg  (
 .scan_in(access_tag_reg_scanin),
 .scan_out(access_tag_reg_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1 ),  
 .din ( access_tag_in[55:0]),
 .dout( access_tag_f[55:0]    ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

ifu_ftu_itd_dp_msff_macro__stack_14c__width_13 access_tag_reg0  (
 .scan_in(access_tag_reg0_scanin),
 .scan_out(access_tag_reg0_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1 ),  
 .din ( access_tag_in[68:56]),
 .dout( access_tag_f[68:56]    ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

ifu_ftu_itd_dp_msff_macro__stack_14c__width_13 write_context_0_reg  (
 .scan_in(write_context_0_reg_scanin),
 .scan_out(write_context_0_reg_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1 ),  
 .din ( write_context_0[12:0]),
 .dout( write_context_0_ff[12:0]    ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

ifu_ftu_itd_dp_msff_macro__stack_14c__width_14 write_context_1_reg  (
 .scan_in(write_context_1_reg_scanin),
 .scan_out(write_context_1_reg_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1 ),  
 .din ( {itc_write_next,write_context_1[12:0]}),
 .dout( {wrdata_sel,write_context_1_ff[12:0] }   ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

ifu_ftu_itd_dp_msff_macro__stack_14c__width_14 context_to_write_reg  (
 .scan_in(context_to_write_reg_scanin),
 .scan_out(context_to_write_reg_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1 ),  
 .din ( context_to_write_in[13:0]),
 .dout( context_to_write[13:0]    ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// msff_macro tte2_lat (width=52, stack=70c, mux=aope, ports=4) (
//         .scan_in(tte2_lat_scanin),
//         .scan_out(tte2_lat_scanout),
//         .din0   ({51'b0,1'b1}),
//         .din1   ({tte2_lat_out[50:0],1'b0}),
//         .din2   ({tte1[54:47],partition_id1[2:0],tte1[42:38],1'b1,1'b0,tte1[34:7],tte1[5:0]}),
//         .din3   ({tld_tag[55:52],12'b0,1'b0,1'b1,7'b0,tgd_tag_c1[12:00],tgd_tag_c0[12:0],1'b0}),
//         .sel0   (mbi_init_to_zero),
//         .sel1   (mbi_cambist_shift),
//         .sel2   (tlc_write_next),
//         .dout   (tte2_lat_out[51:0]),
//         .en     (tlc_tte2_clken)
// );

ifu_ftu_itd_dp_msff_macro__mux_aope__ports_3__stack_60c__width_53 tte2_lat   (
        .scan_in(tte2_lat_scanin),
        .scan_out(tte2_lat_scanout),
        .clk(l2clk),
        .din0   ({52'b0,1'b1}),
        .din1   ({tte2_out[51:0],1'b0}),
	.din2 	({tte1[54:46],partition_id1[2:0],tte1[44:38],tte1[34:28],tte1[27:7],tte1[5:0]}),
        .sel0   (mbi_init_to_zero ),
        .sel1   (mbi_cambist_shift),
	.dout	({tte2[54:46],partition_id2[2:0],tte2[44:38],tte2[34:28],tte2[27:7],tte2[5:0]}),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);


assign tte2_out[52:0]  = 	({tte2[54:46],partition_id2[2:0],tte2[44:38],tte2[34:28],tte2[27:7],tte2[5:0]});
assign itd_index_valid_in =          tte1[54];

assign atm_unused[3:0] = {access_tag_f[25:24],access_tag_f[17],access_tag_f[13]};
assign tte2_unused[6:0]            = {tte2[47:46],tte2[44:43],tte2[37:36], tte1[35]} ;
assign tte1_unused     = tte1[6] ;




///////////////////////////////////////////////
// Mux bist test data                        //
///////////////////////////////////////////////
//     mbist_wdata[68:0] = {    mbist_wdata_bf[2:0], mbist_wdata_bf[7:0],mbist_wdata_bf[7:6],          // [68:56]
//                              mbist_wdata_bf[4:2],                                                   // [55:53]
//                              1'b0,                                                                  // [52]
//                              mbist_wdata_bf[0],{3{mbist_wdata_bf[7:0]}},mbist_wdata_bf[7],          // [51:26]
//                              1'b0,                                                                  // [25]
//                              mbist_wdata_bf[6:0],                                                   // [24:18]
//                              1'b0,                                                                  // [17]
//                              mbist_wdata_bf[7:5],                                                   // [16:14]
//                              1'b0,                                                                  // [13]
//                              mbist_wdata_bf[4:0],mbist_wdata_bf[7:0]};                              // [12:0]
//
//
//

// Page mask and real bits must be zero for bist to avoid masking lower address and context bits.
assign mbist_wdata[68:0] = {    mbist_wdata_dup[1:0],mbist_wdata_dup[7:0], mbist_wdata_dup[7:5],          // [68:56]
                                mbist_wdata_dup[4:2],                                                   // [55:53]
                                1'b0,                                                                  // [52]
                                mbist_wdata_dup[0],{3{mbist_wdata_dup[7:0]}},mbist_wdata_dup[7],          // [51:26]
                                1'b0,                                                                  // [25]
                                mbist_wdata_dup[6:0],                                                   // [24:18]
                                1'b0,                                                                  // [17]
                                mbist_wdata_dup[7:5],                                                   // [16:14]
                                1'b0,                                                                  // [13]
                                mbist_wdata_dup[4:0],mbist_wdata_dup[7:0]};                              // [12:0]


assign data_mbist_wdata[37:0] = { mbist_wdata_bf[5:0],mbist_wdata_bf[7:2],                             // [37:26]
                                mbist_wdata_bf[1],                                                     // [25]
                                mbist_wdata_bf[0],mbist_wdata_bf[7:2],                                 // [24:18]
                                mbist_wdata_bf[1],                                                     // [17]
                                mbist_wdata_bf[0], mbist_wdata_bf[7:6],                                // [16:14]
                                mbist_wdata_bf[5],                                                     // [13]
                                mbist_wdata_bf[4:0],mbist_wdata_bf[7:0]};                              // [12:0]


// correct this
assign mbist_camdata[68:0]       =   ({{13{mbist_wdata_dup[2]}},{3{mbist_wdata_dup[1]}},mbist_wdata_dup[5],
                                       {26{mbist_wdata_dup[0]}},1'b0,mbist_wdata_dup[4],{6{mbist_wdata_dup[0]}}, 1'b0,
                                       {3{mbist_wdata_dup[0]}},1'b0,{13{mbist_wdata_dup[3]}}});          // CAMBIST match/write data

// correct this
assign mbist_camdata_shift[68:0] =   ({tte2_out[12:0],tte2_out[51:49],tte2_out[48],
                                       tte2_out[47:22],1'b0,1'b1,tte2_out[21:16], 1'b0,
                                       tte2_out[15:13],1'b0,tte2_out[12:0]});           // CAMBIST shift data


ifu_ftu_itd_dp_mux_macro__dmux_6x__mux_aonpe__ports_3__stack_58c__width_56 test_data_mux0      (
        .din0   (mbist_camdata_shift[55:0]),           // CAMBIST shift data
        .din1   (mbist_camdata[55:0]),                 // CAMBIST match/write data
        .din2   (mbist_wdata[55:0]),                   // MEMBIST data
        .sel0   (init_or_shift_bf),
        .sel1   (not_init_and_run_bf),
        .sel2   (not_init_nor_run_bf),
        .dout   (bist_wdata[55:0])
);

ifu_ftu_itd_dp_mux_macro__dmux_6x__mux_aonpe__ports_3__stack_14r__width_13 test_data_mux1      (
        .din0   (mbist_camdata_shift[68:56]),           // CAMBIST shift data
        .din1   (mbist_camdata[68:56]),                 // CAMBIST match/write data
        .din2   (mbist_wdata[68:56]),                   // MEMBIST data
        .sel0   (init_or_shift_bf),
        .sel1   (not_init_and_run_bf),
        .sel2   (not_init_nor_run_bf),
        .dout   (bist_wdata[68:56])
);

///////////////////////////////////////////////
// Parity generation for tte_tag
///////////////////////////////////////////////


// VA muxing done in ifu_ftu_agd_dp, and other "middle" parts of
// tag are not used in match
ifu_ftu_itd_dp_mux_macro__dmux_8x__mux_aonpe__ports_7__stack_58c__width_56 mx_tag0_d      (
	.din0	(tag_to_demap_d		[55:0]	),
	.din1	(tag_to_demap_c0	[55:0]	),
	.din2	(tag_to_demap_c1	[55:0]	),
	.din3	(tag_to_write		[55:0]	),
	.din4	(tag_to_write		[55:0]	),
	.din5	(bist_wdata     	[55:0]	),
	.din6	({default_pid		[2:0],
		  default_r		       ,
		  {39 {1'b0}}		       ,
		  default_context_0	[12:0]}),
	.sel0	(itc_sel_demap_tag_d		),
	.sel1	(itc_sel_demap_tag_c0		),
	.sel2	(itc_sel_demap_tag_c1		),
	.sel3	(itc_sel_write_tag		),
	.sel4	(itc_sel_write_tag_indexed	),
	.sel5	(itc_sel_mbist			),
	.sel6	(itc_sel_default			),
	.dout	(itd_tag_to_buf		[55:0]	)
);

assign itd_tag[55:0] = itd_tag_to_buf[55:0];

// buff_macro mx_tag0_d_buf (width=58, stack=60c) (
// 	.din 	(itd_tag_to_buf		[57:00]	),
// 	.dout	(itd_tag		[57:00]	));

ifu_ftu_itd_dp_mux_macro__dmux_6x__mux_aonpe__ports_7__stack_20r__width_19 mx_tag1_d      (
	.din0	({6'd0,tag_to_demap_d[68:56]}),
	.din1	({6'd0,tag_to_demap_c0[68:56]}),
	.din2	({6'd0,tag_to_demap_c1[68:56]}),
	.din3	({6'd0,tag_to_write[68:56]}),
	.din4	({tte2[53:48],tag_to_write[68:56]}),
	.din5   ({mbist_index[5:0],bist_wdata[68:56]}),
	.din6	({asi_addr_bf[8:3],default_context_1[12:0]}),
	.sel0	(itc_sel_demap_tag_d),
	.sel1	(itc_sel_demap_tag_c0),
	.sel2	(itc_sel_demap_tag_c1),
	.sel3	(itc_sel_write_tag),
	.sel4	(itc_sel_write_tag_indexed),
	.sel5	(itc_sel_mbist			),
	.sel6	(itc_sel_default			),
    	.dout	({itd_rw_index_to_buf[5:0],itd_tag_to_buf[68:56]})  
);

// buff_macro mx_tag1_d_buf (width=20, stack=20c) (
//     .din ( {prty_ctxt1_to_buf_,itd_rw_index_to_buf[5:0],itd_tag_to_buf[68:56]}), 
//     .dout({prty_ctxt1_,itd_rw_index[5:0],itd_tag[68:56]}) ) ;

// assign prty_ctxt1_       = prty_ctxt1_to_buf_; 
assign itd_rw_index[5:0] = itd_rw_index_to_buf[5:0] ;
assign itd_tag[68:56]    = itd_tag_to_buf[68:56] ;

ifu_ftu_itd_dp_msff_macro__stack_16r__width_16 mbist_in_reg  (
 .scan_in(mbist_in_reg_scanin),
 .scan_out(mbist_in_reg_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1 ),  
 .din ( {mbi_addr[5:0],mbi_wdata[7:0],mbi_run,mbi_cambist_run}),
 .dout( {mbist_index_to_buf[5:0],mbist_wdata_to_buf[7:0],mbist_run_to_buf,cambist_run_bf}     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

ifu_ftu_itd_dp_msff_macro__stack_8c__width_8 mbist_in_dup_reg  (
 .scan_in(mbist_in_dup_reg_scanin),
 .scan_out(mbist_in_dup_reg_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1 ),  
 .din ( mbi_wdata[7:0]),
 .dout( mbist_wdata_dup[7:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

ifu_ftu_itd_dp_buff_macro__stack_16r__width_15 mbist_in_buf  (
    .din( {mbist_index_to_buf[5:0],mbist_wdata_to_buf[7:0],mbist_run_to_buf}     ),
    .dout( {mbist_index[5:0],mbist_wdata_bf[7:0],mbist_run}     ));


///////////////////////////TTE data////////////////////////////////////////////
                                

ifu_ftu_itd_dp_buff_macro__dbuff_48x__width_1 tst_mux_rep0  (
 .din ( tcu_muxtest     ),
 .dout( tcu_muxtest_rep0     ));


// Data is only needed for write, need a mux only for bist
ifu_ftu_itd_dp_mux_macro__mux_pgpe__ports_3__stack_38c__width_37 mx_itd_data     (
        .din0   ({31'b0,mbist_index[5:0]}),                  //CAM write data
	.din1	(data_mbist_wdata[36:0]),                    //MBIST write data
	.din2	(data_to_write[36:0]),                    //Functional write data
        .muxtst (tcu_muxtest_rep0),
	.sel0	(cambist_run_bf),
	.sel1	(mbist_run),
	.dout	(itd_data_to_buf[36:0]),
  .test(test)
);

assign itd_data[37:0] = {data_to_write[37], itd_data_to_buf[36:0]} ;

// buff_macro mx_itd_data_buf (width=39, stack=60c) (
// 	.din 	(itd_data_to_buf[38:0]),
// 	.dout	(itd_data[38:0]));

assign data_to_write[37:0] = 
       {tag_parity_out	       ,	// Parity for tag
	data_parity	       ,	// Parity
	tte2		[33:22],	// PA[39:28]
	tte2		[21:16],	// PA[27:22]
	tte1		[21   ],	// 27_22_V, PS_EQ_256M
	tte2		[15:10],	// PA[21:16]
	tte2		[42   ],	// 21_16_V, PS_GT_64K
	tte2		[9:7],	// VA[15:13]
	tte2		[38   ],	// 15_13_V, PS_GT_8K
	tte2		[5:0]		// NFO, IE, CP, E, P, W
	};	


 ifu_ftu_itd_dp_prty_macro__width_32 dprty0  (
	.din	(data_to_write[31:0]),
	.dout	(data_parity_0)
);
ifu_ftu_itd_dp_prty_macro__width_8 dprty1  (
	.din	({2'b00,data_to_write[35:32],itc_data_error_inj,1'b0}),
	.dout	(data_parity_1)
);

ifu_ftu_itd_dp_xor_macro__ports_2__width_1 pgen_data_xor   (
	.din0	(data_parity_0),
	.din1	(data_parity_1),
	.dout	(data_parity)
);

ifu_ftu_itd_dp_nor_macro__ports_2__width_1 shift_or_init   (
	.din0	(mbi_init_to_zero),
	.din1	(mbi_cambist_shift),
	.dout	(init_or_shift_nor)
);

ifu_ftu_itd_dp_inv_macro__width_1 shift_or_init_inv  (
         .din    (init_or_shift_nor),
         .dout   (init_or_shift)
 );

ifu_ftu_itd_dp_nor_macro__ports_2__width_1 not_init_nor_run_nor   (
	.din0	(init_or_shift),
	.din1	(mbi_cambist_run),
	.dout	(not_init_nor_run)
);

ifu_ftu_itd_dp_and_macro__ports_2__width_1 not_init_and_run_and   (
	.din0	(init_or_shift_nor),
	.din1	(mbi_cambist_run),
	.dout	(not_init_and_run)
);

// buff_macro dprty_buf (width=1) (
// 	.din	(data_parity),
// 	.dout	(data_parity_buf)
// );


assign itd_demap_control1[1:0] =
       tte1[44:43];

// Write context 0 if a write with use_context_0 on
// assign itc_sel_write_tag_c0 =
//        (wr_vld  &                  demap_c2[00]) ;
// 
// Write context 1 if a write with use_context_1 on
// assign itc_sel_write_tag_c1 =
//        (wr_vld  &                  demap_c2[01] & ~demap_c2[00]) ;


ifu_ftu_itd_dp_and_macro__ports_2__stack_2l__width_1 write_tag_c0_and    (
        .din0   (itc_write_next),
        .din1   (itd_demap_control1[0]),
        .dout   (sel_write_tag_c0)
);

ifu_ftu_itd_dp_and_macro__ports_3__stack_4l__width_1 write_tag_c1_and    (
        .din0   (itc_write_next),
        .din1   (demap_control1_0_),
        .din2   (itd_demap_control1[1]),
        .dout   (sel_write_tag_c1)
);

// assign sel_write_tag_t1 = write_next_ ;
// 
 ifu_ftu_itd_dp_inv_macro__width_1 sel_write_inv  (
         .din    (itd_demap_control1[0]),
         .dout   (demap_control1_0_)
 );




// assign se = tcu_scan_en ;
// fixscan start:
assign tte0_lat_scanin           = scan_in                  ;
assign tte1_lat_scanin           = tte0_lat_scanout         ;
assign access_tag_reg_scanin     = tte1_lat_scanout         ;
assign access_tag_reg0_scanin    = access_tag_reg_scanout   ;
assign write_context_0_reg_scanin = access_tag_reg0_scanout  ;
assign write_context_1_reg_scanin = write_context_0_reg_scanout;
assign context_to_write_reg_scanin = write_context_1_reg_scanout;
assign tte2_lat_scanin           = context_to_write_reg_scanout;
assign mbist_in_reg_scanin       = tte2_lat_scanout         ;
assign mbist_in_dup_reg_scanin   = mbist_in_reg_scanout     ;
assign scan_out                  = mbist_in_dup_reg_scanout ;
// fixscan end:
endmodule	
	
	


//
//   buff macro
//
//





module ifu_ftu_itd_dp_buff_macro__dbuff_32x__stack_none__width_4 (
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

module ifu_ftu_itd_dp_mux_macro__mux_aonpe__ports_2__stack_60c__width_55 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [54:0] din0;
  input sel0;
  input [54:0] din1;
  input sel1;
  output [54:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(55)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[54:0]),
  .in1(din1[54:0]),
.dout(dout[54:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module ifu_ftu_itd_dp_msff_macro__stack_60c__width_56 (
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
wire [54:0] so;

  input [55:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [55:0] dout;


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
dff #(56)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[55:0]),
.si({scan_in,so[54:0]}),
.so({so[54:0],scan_out}),
.q(dout[55:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module ifu_ftu_itd_dp_msff_macro__stack_60c__width_59 (
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
wire [57:0] so;

  input [58:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [58:0] dout;


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
dff #(59)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[58:0]),
.si({scan_in,so[57:0]}),
.so({so[57:0],scan_out}),
.q(dout[58:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_itd_dp_mux_macro__mux_aodec__ports_8__stack_4r__width_3 (
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

  input [2:0] din0;
  input [2:0] din1;
  input [2:0] din2;
  input [2:0] din3;
  input [2:0] din4;
  input [2:0] din5;
  input [2:0] din6;
  input [2:0] din7;
  input [2:0] sel;
  output [2:0] dout;





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

mux8s #(3)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[2:0]),
  .in1(din1[2:0]),
  .in2(din2[2:0]),
  .in3(din3[2:0]),
  .in4(din4[2:0]),
  .in5(din5[2:0]),
  .in6(din6[2:0]),
  .in7(din7[2:0]),
.dout(dout[2:0])
);









  



endmodule


//
//   buff macro
//
//





module ifu_ftu_itd_dp_buff_macro__stack_4c__width_3 (
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

module ifu_ftu_itd_dp_mux_macro__mux_aope__ports_3__stack_14r__width_14 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [13:0] din0;
  input [13:0] din1;
  input [13:0] din2;
  input sel0;
  input sel1;
  output [13:0] dout;





cl_dp1_penc3_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(14)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[13:0]),
  .in1(din1[13:0]),
  .in2(din2[13:0]),
.dout(dout[13:0])
);









  



endmodule


//
//   invert macro
//
//





module ifu_ftu_itd_dp_inv_macro__width_3 (
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





module ifu_ftu_itd_dp_inv_macro__width_1 (
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





module ifu_ftu_itd_dp_and_macro__ports_2__stack_16l__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output [15:0] dout;






and2 #(16)  d0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout[15:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_itd_dp_mux_macro__left_2__mux_pgpe__ports_2__stack_60c__width_40 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [39:0] din0;
  input [39:0] din1;
  input sel0;
  output [39:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(40)  d0_0 (
  .sel(psel1),
  .in0(din0[39:0]),
  .in1(din1[39:0]),
.dout(dout[39:0])
);









  



endmodule


//
//   parity macro (even parity)
//
//





module ifu_ftu_itd_dp_prty_macro__width_32 (
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
//   parity macro (even parity)
//
//





module ifu_ftu_itd_dp_prty_macro__width_16 (
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
//   xor macro for ports = 2,3
//
//





module ifu_ftu_itd_dp_xor_macro__ports_2__width_1 (
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





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_itd_dp_mux_macro__mux_pgpe__ports_2__stack_2r__width_1 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [0:0] din0;
  input [0:0] din1;
  input sel0;
  output [0:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(1)  d0_0 (
  .sel(psel1),
  .in0(din0[0:0]),
  .in1(din1[0:0]),
.dout(dout[0:0])
);









  



endmodule


//
//   parity macro (even parity)
//
//





module ifu_ftu_itd_dp_prty_macro__width_8 (
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
//   buff macro
//
//





module ifu_ftu_itd_dp_buff_macro__width_6 (
  din, 
  dout);
  input [5:0] din;
  output [5:0] dout;






buff #(6)  d0_0 (
.in(din[5:0]),
.out(dout[5:0])
);








endmodule









// any PARAMS parms go into naming of macro

module ifu_ftu_itd_dp_msff_macro__stack_14c__width_13 (
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
wire [11:0] so;

  input [12:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [12:0] dout;


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
dff #(13)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[12:0]),
.si({scan_in,so[11:0]}),
.so({so[11:0],scan_out}),
.q(dout[12:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module ifu_ftu_itd_dp_msff_macro__stack_14c__width_14 (
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
wire [12:0] so;

  input [13:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [13:0] dout;


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
dff #(14)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[13:0]),
.si({scan_in,so[12:0]}),
.so({so[12:0],scan_out}),
.q(dout[13:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module ifu_ftu_itd_dp_msff_macro__mux_aope__ports_3__stack_60c__width_53 (
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
wire [52:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [51:0] so;

  input [52:0] din0;
  input [52:0] din1;
  input [52:0] din2;
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



  output [52:0] dout;


  output scan_out;




cl_dp1_penc3_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(53)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[52:0]),
  .in1(din1[52:0]),
  .in2(din2[52:0]),
.dout(muxout[52:0])
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
dff #(53)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[52:0]),
.si({scan_in,so[51:0]}),
.so({so[51:0],scan_out}),
.q(dout[52:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_itd_dp_mux_macro__dmux_6x__mux_aonpe__ports_3__stack_58c__width_56 (
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

  input [55:0] din0;
  input sel0;
  input [55:0] din1;
  input sel1;
  input [55:0] din2;
  input sel2;
  output [55:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(56)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[55:0]),
  .in1(din1[55:0]),
  .in2(din2[55:0]),
.dout(dout[55:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_itd_dp_mux_macro__dmux_6x__mux_aonpe__ports_3__stack_14r__width_13 (
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

  input [12:0] din0;
  input sel0;
  input [12:0] din1;
  input sel1;
  input [12:0] din2;
  input sel2;
  output [12:0] dout;





cl_dp1_muxbuff3_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(13)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[12:0]),
  .in1(din1[12:0]),
  .in2(din2[12:0]),
.dout(dout[12:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_itd_dp_mux_macro__dmux_8x__mux_aonpe__ports_7__stack_58c__width_56 (
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

  input [55:0] din0;
  input sel0;
  input [55:0] din1;
  input sel1;
  input [55:0] din2;
  input sel2;
  input [55:0] din3;
  input sel3;
  input [55:0] din4;
  input sel4;
  input [55:0] din5;
  input sel5;
  input [55:0] din6;
  input sel6;
  output [55:0] dout;





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
mux7s #(56)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .in0(din0[55:0]),
  .in1(din1[55:0]),
  .in2(din2[55:0]),
  .in3(din3[55:0]),
  .in4(din4[55:0]),
  .in5(din5[55:0]),
  .in6(din6[55:0]),
.dout(dout[55:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_itd_dp_mux_macro__dmux_6x__mux_aonpe__ports_7__stack_20r__width_19 (
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

  input [18:0] din0;
  input sel0;
  input [18:0] din1;
  input sel1;
  input [18:0] din2;
  input sel2;
  input [18:0] din3;
  input sel3;
  input [18:0] din4;
  input sel4;
  input [18:0] din5;
  input sel5;
  input [18:0] din6;
  input sel6;
  output [18:0] dout;





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
mux7s #(19)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .in0(din0[18:0]),
  .in1(din1[18:0]),
  .in2(din2[18:0]),
  .in3(din3[18:0]),
  .in4(din4[18:0]),
  .in5(din5[18:0]),
  .in6(din6[18:0]),
.dout(dout[18:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module ifu_ftu_itd_dp_msff_macro__stack_16r__width_16 (
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
wire [14:0] so;

  input [15:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [15:0] dout;


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
dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module ifu_ftu_itd_dp_msff_macro__stack_8c__width_8 (
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
wire [6:0] so;

  input [7:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [7:0] dout;


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
dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);




















endmodule









//
//   buff macro
//
//





module ifu_ftu_itd_dp_buff_macro__stack_16r__width_15 (
  din, 
  dout);
  input [14:0] din;
  output [14:0] dout;






buff #(15)  d0_0 (
.in(din[14:0]),
.out(dout[14:0])
);








endmodule





//
//   buff macro
//
//





module ifu_ftu_itd_dp_buff_macro__dbuff_48x__width_1 (
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

module ifu_ftu_itd_dp_mux_macro__mux_pgpe__ports_3__stack_38c__width_37 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [36:0] din0;
  input [36:0] din1;
  input [36:0] din2;
  input sel0;
  input sel1;
  input muxtst;
  input test;
  output [36:0] dout;





cl_dp1_penc3_8x  c0_0 (
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
  .test(test)
);

mux3 #(37)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[36:0]),
  .in1(din1[36:0]),
  .in2(din2[36:0]),
.dout(dout[36:0]),
  .muxtst(muxtst)
);









  



endmodule


//
//   nor macro for ports = 2,3
//
//





module ifu_ftu_itd_dp_nor_macro__ports_2__width_1 (
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
//   and macro for ports = 2,3,4
//
//





module ifu_ftu_itd_dp_and_macro__ports_2__width_1 (
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





//  
//   and macro for ports = 2,3,4
//
//





module ifu_ftu_itd_dp_and_macro__ports_2__stack_2l__width_1 (
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





//  
//   and macro for ports = 2,3,4
//
//





module ifu_ftu_itd_dp_and_macro__ports_3__stack_4l__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






and3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule




