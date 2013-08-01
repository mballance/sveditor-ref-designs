// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_sed_dp.v
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
module lsu_sed_dp (
  sbc_ramout_clken, 
  sbc_diag_wptr_w3, 
  sbc_inv_ecc, 
  stb_ram_rd_data, 
  sec_corr_bit, 
  stb_ram_rd_ecc, 
  stb_ram_rd_cparity, 
  stb_ram_rd_ctl, 
  sbd_st_data_b, 
  stb_cam_data, 
  dcc_stb_data_rd_w3, 
  dcc_stb_ecc_rd_w3, 
  dcc_stb_ctl_rd_w3, 
  dcc_stb_addr_sel_w3, 
  dcc_stb_ptr_rd_w3, 
  mbi_run, 
  mbi_wdata, 
  bist_cmp_data, 
  stb_ram_data, 
  stb_ram_data_corr, 
  stb_ram_ctl, 
  stb_ram_cparity, 
  sed_ecc_b, 
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
  stb_ldxa_asi_data_w, 
  sed_bist_cmp_0, 
  sed_bist_cmp_1, 
  sed_bist_cmp_2, 
  sed_bist_cmp_3, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_se_scancollar_out, 
  spc_aclk, 
  spc_bclk, 
  scan_out);
wire stop;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire [31:0] wdh;
wire [31:0] wdl;
wire [6:0] inv;
wire p1_hi_l;
wire p1_hi_r;
wire p1_hi;
wire p2_hi_l;
wire p2_hi_r;
wire p2_hi;
wire p4_hi_l;
wire p4_hi_r;
wire p4_hi;
wire p8_hi_l;
wire p8_hi_r;
wire p8_hi;
wire p16_hi_l;
wire p16_hi_r;
wire p16_hi;
wire p32_hi_l;
wire p32_hi;
wire pf_hi_l;
wire pf_hi_r;
wire pf_hi;
wire p1_lo_l;
wire p1_lo_r;
wire p1_lo;
wire p2_lo_l;
wire p2_lo_r;
wire p2_lo;
wire p4_lo_l;
wire p4_lo_r;
wire p4_lo;
wire p8_lo_l;
wire p8_lo_r;
wire p8_lo;
wire p16_lo_l;
wire p16_lo_r;
wire p16_lo;
wire p32_lo_l;
wire p32_lo;
wire pf_lo_l;
wire pf_lo_r;
wire pf_lo;
wire mbi_run_;
wire mbi_run_local;
wire [31:0] rdh;
wire [31:0] rdl;
wire [13:0] ecc;
wire c1_hi_l;
wire c1_hi_r;
wire c2_hi_l;
wire c2_hi_r;
wire c4_hi_l;
wire c4_hi_r;
wire c8_hi_l;
wire c8_hi_r;
wire c16_hi_r;
wire c32_hi_l;
wire cf_hi_l;
wire cf_hi_r;
wire cf_hi_c;
wire c1_lo_l;
wire c1_lo_r;
wire c2_lo_l;
wire c2_lo_r;
wire c4_lo_l;
wire c4_lo_r;
wire c8_lo_l;
wire c8_lo_r;
wire c16_lo_r;
wire c32_lo_l;
wire cf_lo_l;
wire cf_lo_r;
wire cf_lo_c;
wire dff_prty_bits_scanin;
wire dff_prty_bits_scanout;
wire dff_rd_data_0_scanin;
wire dff_rd_data_0_scanout;
wire [13:0] stb_ram_ecc;
wire [1:0] unused;
wire dff_rd_data_1_scanin;
wire dff_rd_data_1_scanout;
wire [63:0] stb_ram_data_corr_;
wire [31:0] def_value;
wire [63:0] stb_diag_rd_data;


input		sbc_ramout_clken;
input	[2:0]	sbc_diag_wptr_w3;
input	[6:0]	sbc_inv_ecc;

input	[63:0]	stb_ram_rd_data;
input	[63:0]	sec_corr_bit;
input	[13:0]	stb_ram_rd_ecc;
input		stb_ram_rd_cparity;
input	[2:0]	stb_ram_rd_ctl;

input	[63:0]	sbd_st_data_b;

input	[44:0]	stb_cam_data;

input		dcc_stb_data_rd_w3;
input		dcc_stb_ecc_rd_w3;
input		dcc_stb_ctl_rd_w3;
input		dcc_stb_addr_sel_w3;
input		dcc_stb_ptr_rd_w3;

input		mbi_run;
input	[7:0]	mbi_wdata;
input	[7:0]	bist_cmp_data;

output	[63:0]	stb_ram_data;		// Flopped data
output	[63:0]	stb_ram_data_corr;	// Final formatted data
output	[2:0]	stb_ram_ctl;
output		stb_ram_cparity;
output	[13:0]	sed_ecc_b;		// generated ECC bits

output	[1:0]	sed_c1_lo;
output	[1:0]	sed_c1_hi;
output	[1:0]	sed_c2_lo;
output	[1:0]	sed_c2_hi;
output	[1:0]	sed_c4_lo;
output	[1:0]	sed_c4_hi;
output	[1:0]	sed_c8_lo;
output	[1:0]	sed_c8_hi;
output	[1:0]	sed_c16_lo;
output	[1:0]	sed_c16_hi;
output	[2:0]	sed_cf_lo;
output	[2:0]	sed_cf_hi;
output		sed_c32_hi;
output		sed_c32_lo;

output	[63:0]	stb_ldxa_asi_data_w;
output		sed_bist_cmp_0;
output		sed_bist_cmp_1;
output		sed_bist_cmp_2;
output		sed_bist_cmp_3;

// Globals
input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input		tcu_se_scancollar_out;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;

// scan renames
assign stop = 1'b0;
// end scan

lsu_sed_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 test_rep0  (
	.din ({tcu_se_scancollar_out,tcu_pce_ov,spc_aclk,spc_bclk}),
	.dout({se,pce_ov,siclk,soclk})
);

////////////////////////////////////////////////////////////////////////////////
// ECC generation logic

assign {wdh[31:0],wdl[31:0]} = sbd_st_data_b[63:0];
assign inv[6:0] = sbc_inv_ecc[6:0];

// P1 - hi
lsu_sed_dp_prty_macro__width_16 pgen1_hi_l  (
	.din	({inv[0],wdh[30],1'b0   ,wdh[28],1'b0   ,wdh[26],wdh[25],1'b0   ,
		  wdh[23],1'b0   ,wdh[21],1'b0   ,wdh[19],1'b0   ,wdh[17],1'b0   }),
	.dout	(p1_hi_l)
);
lsu_sed_dp_prty_macro__width_16 pgen1_hi_r  (
	.din	({wdh[15],1'b0   ,wdh[13],1'b0   ,wdh[11],wdh[10],1'b0   ,wdh[8],
		  1'b0   ,wdh[6],1'b0   ,wdh[4],wdh[3],1'b0   ,wdh[1],wdh[0]}),
	.dout	(p1_hi_r)
);
lsu_sed_dp_xor_macro__ports_2__width_1 pgen1_hi   (
	.din0	(p1_hi_l),
	.din1	(p1_hi_r),
	.dout	(p1_hi)
);

// P2 - hi
lsu_sed_dp_prty_macro__width_16 pgen2_hi_l  (
	.din	({wdh[31],inv[1],1'b0   ,wdh[28],wdh[27],1'b0   ,wdh[25],wdh[24],
		  1'b0   ,1'b0   ,wdh[21],wdh[20],1'b0   ,1'b0   ,wdh[17],wdh[16]}),
	.dout	(p2_hi_l)
);
lsu_sed_dp_prty_macro__width_16 pgen2_hi_r  (
	.din	({1'b0   ,1'b0   ,wdh[13],wdh[12],1'b0   ,wdh[10],wdh[9],1'b0   ,
		  1'b0   ,wdh[6],wdh[5],1'b0   ,wdh[3],wdh[2],1'b0   ,wdh[0]}),
	.dout	(p2_hi_r)
);
lsu_sed_dp_xor_macro__ports_2__width_1 pgen2_hi   (
	.din0	(p2_hi_l),
	.din1	(p2_hi_r),
	.dout	(p2_hi)
);

// P4 - hi
lsu_sed_dp_prty_macro__width_16 pgen4_hi_l  (
	.din	({wdh[31],wdh[30],wdh[29],inv[2],1'b0   ,1'b0   ,wdh[25],wdh[24],
		  wdh[23],wdh[22],1'b0   ,1'b0   ,1'b0   ,1'b0   ,wdh[17],wdh[16]}),
	.dout	(p4_hi_l)
);
lsu_sed_dp_prty_macro__width_16 pgen4_hi_r  (
	.din	({wdh[15],wdh[14],1'b0   ,1'b0   ,1'b0   ,wdh[10],wdh[9],wdh[8],
		  wdh[7],1'b0   ,1'b0   ,1'b0   ,wdh[3],wdh[2],wdh[1],1'b0   }),
	.dout	(p4_hi_r)
);
lsu_sed_dp_xor_macro__ports_2__width_1 pgen4_hi   (
	.din0	(p4_hi_l),
	.din1	(p4_hi_r),
	.dout	(p4_hi)
);

// P8 - hi
lsu_sed_dp_prty_macro__width_8 pgen8_hi_l  (
	.din	({wdh[25],wdh[24],wdh[23],wdh[22],wdh[21],wdh[20],wdh[19],wdh[18]}),
	.dout	(p8_hi_l)
);
lsu_sed_dp_prty_macro__width_8 pgen8_hi_r  (
	.din	({inv[3],wdh[10],wdh[9],wdh[8],wdh[7],wdh[6],wdh[5],wdh[4]}),
	.dout	(p8_hi_r)
);
lsu_sed_dp_xor_macro__ports_2__width_1 pgen8_hi   (
	.din0	(p8_hi_l),
	.din1	(p8_hi_r),
	.dout	(p8_hi)
);

// P16 - hi
assign p16_hi_l = p8_hi_l;	// this one can be shared

lsu_sed_dp_prty_macro__width_8 pgen16_hi_r  (
	.din	({wdh[17],wdh[16],wdh[15],wdh[14],wdh[13],wdh[12],wdh[11],inv[4]}),
	.dout	(p16_hi_r)
);
lsu_sed_dp_xor_macro__ports_2__width_1 pgen16_hi   (
	.din0	(p16_hi_l),
	.din1	(p16_hi_r),
	.dout	(p16_hi)
);

// P32 - hi
lsu_sed_dp_prty_macro__width_8 pgen32_hi_l  (
	.din	({wdh[31],wdh[30],wdh[29],wdh[28],wdh[27],wdh[26],inv[5],1'b0   }),
	.dout	(p32_hi_l)
);
lsu_sed_dp_buff_macro__width_1 pgen32_hi  (
	.din	(p32_hi_l),
	.dout	(p32_hi)
);

// PF - hi
lsu_sed_dp_prty_macro__width_16 pgenf_hi_l  (
	.din	({inv[6],1'b0   ,wdh[29],1'b0   ,wdh[27],wdh[26],1'b0   ,wdh[24],
		  wdh[23],1'b0   ,wdh[21],1'b0   ,1'b0   ,wdh[18],wdh[17],1'b0   }),
	.dout	(pf_hi_l)
);
lsu_sed_dp_prty_macro__width_16 pgenf_hi_r  (
	.din	({1'b0   ,wdh[14],1'b0   ,wdh[12],wdh[11],wdh[10],1'b0   ,1'b0   ,
		  wdh[7],1'b0   ,wdh[5],wdh[4],1'b0   ,wdh[2],wdh[1],wdh[0]}),
	.dout	(pf_hi_r)
);
lsu_sed_dp_xor_macro__ports_2__width_1 pgenf_hi   (
	.din0	(pf_hi_l),
	.din1	(pf_hi_r),
	.dout	(pf_hi)
);

// P1 - lo
lsu_sed_dp_prty_macro__width_16 pgen1_lo_l  (
	.din	({1'b0   ,wdl[30],1'b0   ,wdl[28],1'b0   ,wdl[26],wdl[25],1'b0   ,
		  wdl[23],1'b0   ,wdl[21],1'b0   ,wdl[19],1'b0   ,wdl[17],1'b0   }),
	.dout	(p1_lo_l)
);
lsu_sed_dp_prty_macro__width_16 pgen1_lo_r  (
	.din	({wdl[15],1'b0   ,wdl[13],1'b0   ,wdl[11],wdl[10],1'b0   ,wdl[8],
		  1'b0   ,wdl[6],1'b0   ,wdl[4],wdl[3],1'b0   ,wdl[1],wdl[0]}),
	.dout	(p1_lo_r)
);
lsu_sed_dp_xor_macro__ports_2__width_1 pgen1_lo   (
	.din0	(p1_lo_l),
	.din1	(p1_lo_r),
	.dout	(p1_lo)
);

// P2 - lo
lsu_sed_dp_prty_macro__width_16 pgen2_lo_l  (
	.din	({wdl[31],1'b0   ,1'b0   ,wdl[28],wdl[27],1'b0   ,wdl[25],wdl[24],
		  1'b0   ,1'b0   ,wdl[21],wdl[20],1'b0   ,1'b0   ,wdl[17],wdl[16]}),
	.dout	(p2_lo_l)
);
lsu_sed_dp_prty_macro__width_16 pgen2_lo_r  (
	.din	({1'b0   ,1'b0   ,wdl[13],wdl[12],1'b0   ,wdl[10],wdl[9],1'b0   ,
		  1'b0   ,wdl[6],wdl[5],1'b0   ,wdl[3],wdl[2],1'b0   ,wdl[0]}),
	.dout	(p2_lo_r)
);
lsu_sed_dp_xor_macro__ports_2__width_1 pgen2_lo   (
	.din0	(p2_lo_l),
	.din1	(p2_lo_r),
	.dout	(p2_lo)
);

// P4 - lo
lsu_sed_dp_prty_macro__width_16 pgen4_lo_l  (
	.din	({wdl[31],wdl[30],wdl[29],1'b0   ,1'b0   ,1'b0   ,wdl[25],wdl[24],
		  wdl[23],wdl[22],1'b0   ,1'b0   ,1'b0   ,1'b0   ,wdl[17],wdl[16]}),
	.dout	(p4_lo_l)
);
lsu_sed_dp_prty_macro__width_16 pgen4_lo_r  (
	.din	({wdl[15],wdl[14],1'b0   ,1'b0   ,1'b0   ,wdl[10],wdl[9],wdl[8],
		  wdl[7],1'b0   ,1'b0   ,1'b0   ,wdl[3],wdl[2],wdl[1],1'b0   }),
	.dout	(p4_lo_r)
);
lsu_sed_dp_xor_macro__ports_2__width_1 pgen4_lo   (
	.din0	(p4_lo_l),
	.din1	(p4_lo_r),
	.dout	(p4_lo)
);

// P8 - lo
lsu_sed_dp_prty_macro__width_8 pgen8_lo_l  (
	.din	({wdl[25],wdl[24],wdl[23],wdl[22],wdl[21],wdl[20],wdl[19],wdl[18]}),
	.dout	(p8_lo_l)
);
lsu_sed_dp_prty_macro__width_8 pgen8_lo_r  (
	.din	({1'b0   ,wdl[10],wdl[9],wdl[8],wdl[7],wdl[6],wdl[5],wdl[4]}),
	.dout	(p8_lo_r)
);
lsu_sed_dp_xor_macro__ports_2__width_1 pgen8_lo   (
	.din0	(p8_lo_l),
	.din1	(p8_lo_r),
	.dout	(p8_lo)
);

// P16 - lo
assign p16_lo_l = p8_lo_l;	// this one can be shared

lsu_sed_dp_prty_macro__width_8 pgen16_lo_r  (
	.din	({wdl[17],wdl[16],wdl[15],wdl[14],wdl[13],wdl[12],wdl[11],1'b0   }),
	.dout	(p16_lo_r)
);
lsu_sed_dp_xor_macro__ports_2__width_1 pgen16_lo   (
	.din0	(p16_lo_l),
	.din1	(p16_lo_r),
	.dout	(p16_lo)
);

// P32 - lo
lsu_sed_dp_prty_macro__width_8 pgen32_lo_l  (
	.din	({wdl[31],wdl[30],wdl[29],wdl[28],wdl[27],wdl[26],1'b0   ,1'b0   }),
	.dout	(p32_lo_l)
);
lsu_sed_dp_buff_macro__width_1 pgen32_lo  (
	.din	(p32_lo_l),
	.dout	(p32_lo)
);

// PF - lo
lsu_sed_dp_prty_macro__width_16 pgenf_lo_l  (
	.din	({1'b0   ,1'b0   ,wdl[29],1'b0   ,wdl[27],wdl[26],1'b0   ,wdl[24],
		  wdl[23],1'b0   ,wdl[21],1'b0   ,1'b0   ,wdl[18],wdl[17],1'b0   }),
	.dout	(pf_lo_l)
);
lsu_sed_dp_prty_macro__width_16 pgenf_lo_r  (
	.din	({1'b0   ,wdl[14],1'b0   ,wdl[12],wdl[11],wdl[10],1'b0   ,1'b0   ,
		  wdl[7],1'b0   ,wdl[5],wdl[4],1'b0   ,wdl[2],wdl[1],wdl[0]}),
	.dout	(pf_lo_r)
);
lsu_sed_dp_xor_macro__ports_2__width_1 pgenf_lo   (
	.din0	(pf_lo_l),
	.din1	(pf_lo_r),
	.dout	(pf_lo)
);

lsu_sed_dp_inv_macro__width_2 mbi_run_buf  (
	.din	({mbi_run, mbi_run_}),
	.dout	({mbi_run_,mbi_run_local})
);

lsu_sed_dp_mux_macro__buffsel_none__dmux_4x__mux_aonpe__ports_2__width_14 bist_ecc_mx      (
	.din0	({mbi_wdata[5:0],mbi_wdata[7:0]}),
	.din1	({pf_hi,p32_hi,p16_hi,p8_hi,p4_hi,p2_hi,p1_hi,
		  pf_lo,p32_lo,p16_lo,p8_lo,p4_lo,p2_lo,p1_lo}),
	.sel0	(mbi_run_local),
	.sel1	(mbi_run_),
	.dout	(sed_ecc_b[13:0])
);

////////////////////////////////////////////////////////////////////////////////
// ECC check logic

assign {rdh[31:0],rdl[31:0]} = stb_ram_rd_data[63:0];
assign ecc[13:0] = stb_ram_rd_ecc[13:0];

// C1 - hi
lsu_sed_dp_prty_macro__width_16 pchk1_hi_l  (
	.din	({1'b0   ,rdh[30],1'b0   ,rdh[28],1'b0   ,rdh[26],rdh[25],1'b0   ,
		  rdh[23],1'b0   ,rdh[21],1'b0   ,rdh[19],1'b0   ,rdh[17],ecc[7]}),
	.dout	(c1_hi_l)
);
lsu_sed_dp_prty_macro__width_16 pchk1_hi_r  (
	.din	({rdh[15],1'b0   ,rdh[13],1'b0   ,rdh[11],rdh[10],1'b0   ,rdh[8],
		  1'b0   ,rdh[6],1'b0   ,rdh[4],rdh[3],1'b0   ,rdh[1],rdh[0]}),
	.dout	(c1_hi_r)
);

// C2 - hi
lsu_sed_dp_prty_macro__width_16 pchk2_hi_l  (
	.din	({rdh[31],1'b0   ,1'b0   ,rdh[28],rdh[27],1'b0   ,rdh[25],rdh[24],
		  1'b0   ,1'b0   ,rdh[21],rdh[20],1'b0   ,1'b0   ,rdh[17],rdh[16]}),
	.dout	(c2_hi_l)
);
lsu_sed_dp_prty_macro__width_16 pchk2_hi_r  (
	.din	({ecc[8],1'b0   ,rdh[13],rdh[12],1'b0   ,rdh[10],rdh[9],1'b0   ,
		  1'b0   ,rdh[6],rdh[5],1'b0   ,rdh[3],rdh[2],1'b0   ,rdh[0]}),
	.dout	(c2_hi_r)
);

// C4 - hi
lsu_sed_dp_prty_macro__width_16 pchk4_hi_l  (
	.din	({rdh[31],rdh[30],rdh[29],1'b0   ,1'b0   ,1'b0   ,rdh[25],rdh[24],
		  rdh[23],rdh[22],1'b0   ,1'b0   ,1'b0   ,1'b0   ,rdh[17],rdh[16]}),
	.dout	(c4_hi_l)
);
lsu_sed_dp_prty_macro__width_16 pchk4_hi_r  (
	.din	({rdh[15],rdh[14],ecc[9],1'b0   ,1'b0   ,rdh[10],rdh[9],rdh[8],
		  rdh[7],1'b0   ,1'b0   ,1'b0   ,rdh[3],rdh[2],rdh[1],1'b0   }),
	.dout	(c4_hi_r)
);

// C8 - hi
lsu_sed_dp_prty_macro__width_8 pchk8_hi_l  (
	.din	({rdh[25],rdh[24],rdh[23],rdh[22],rdh[21],rdh[20],rdh[19],rdh[18]}),
	.dout	(c8_hi_l)
);
lsu_sed_dp_prty_macro__width_8 pchk8_hi_r  (
	.din	({ecc[10],rdh[10],rdh[9],rdh[8],rdh[7],rdh[6],rdh[5],rdh[4]}),
	.dout	(c8_hi_r)
);

// C16 - hi
lsu_sed_dp_prty_macro__width_8 pchk16_hi_r  (
	.din	({rdh[17],rdh[16],rdh[15],rdh[14],rdh[13],rdh[12],rdh[11],ecc[11]}),
	.dout	(c16_hi_r)
);

// C32 - hi
lsu_sed_dp_prty_macro__width_8 pchk32_hi_l  (
	.din	({rdh[31],rdh[30],rdh[29],rdh[28],rdh[27],rdh[26],1'b0   ,ecc[12]}),
	.dout	(c32_hi_l)
);

// CF - hi
lsu_sed_dp_prty_macro__width_16 pchkf_hi_l  (
	.din	({rdh[31],rdh[30],rdh[29],rdh[28],rdh[27],rdh[26],rdh[25],rdh[24],
		  rdh[23],rdh[22],rdh[21],rdh[20],rdh[19],rdh[18],rdh[17],rdh[16]}),
	.dout	(cf_hi_l)
);
lsu_sed_dp_prty_macro__width_16 pchkf_hi_r  (
	.din	({rdh[15],rdh[14],rdh[13],rdh[12],rdh[11],rdh[10],rdh[9],rdh[8],
		  rdh[7],rdh[6],rdh[5],rdh[4],rdh[3],rdh[2],rdh[1],rdh[0]}),
	.dout	(cf_hi_r)
);
lsu_sed_dp_prty_macro__width_8 pchkf_hi_c  (
	.din	({ecc[13],ecc[12],ecc[11],ecc[10],ecc[9],ecc[8],ecc[7],1'b0}),
	.dout	(cf_hi_c)
);

// C1 - lo
lsu_sed_dp_prty_macro__width_16 pchk1_lo_l  (
	.din	({1'b0   ,rdl[30],1'b0   ,rdl[28],1'b0   ,rdl[26],rdl[25],1'b0   ,
		  rdl[23],1'b0   ,rdl[21],1'b0   ,rdl[19],1'b0   ,rdl[17],1'b0}),
	.dout	(c1_lo_l)
);
lsu_sed_dp_prty_macro__width_16 pchk1_lo_r  (
	.din	({rdl[15],ecc[0],rdl[13],1'b0   ,rdl[11],rdl[10],1'b0   ,rdl[8],
		  1'b0   ,rdl[6],1'b0   ,rdl[4],rdl[3],1'b0   ,rdl[1],rdl[0]}),
	.dout	(c1_lo_r)
);

// C2 - lo
lsu_sed_dp_prty_macro__width_16 pchk2_lo_l  (
	.din	({rdl[31],1'b0   ,1'b0   ,rdl[28],rdl[27],1'b0   ,rdl[25],rdl[24],
		  1'b0   ,1'b0   ,rdl[21],rdl[20],1'b0   ,1'b0,rdl[17],rdl[16]}),
	.dout	(c2_lo_l)
);
lsu_sed_dp_prty_macro__width_16 pchk2_lo_r  (
	.din	({ecc[1],1'b0   ,rdl[13],rdl[12],1'b0   ,rdl[10],rdl[9],1'b0   ,
		  1'b0   ,rdl[6],rdl[5],1'b0   ,rdl[3],rdl[2],1'b0   ,rdl[0]}),
	.dout	(c2_lo_r)
);

// C4 - lo
lsu_sed_dp_prty_macro__width_16 pchk4_lo_l  (
	.din	({rdl[31],rdl[30],rdl[29],1'b0   ,1'b0   ,1'b0   ,rdl[25],rdl[24],
		  rdl[23],rdl[22],1'b0   ,1'b0   ,1'b0   ,1'b0,rdl[17],rdl[16]}),
	.dout	(c4_lo_l)
);
lsu_sed_dp_prty_macro__width_16 pchk4_lo_r  (
	.din	({rdl[15],rdl[14],ecc[2],1'b0   ,1'b0   ,rdl[10],rdl[9],rdl[8],
		  rdl[7],1'b0   ,1'b0   ,1'b0   ,rdl[3],rdl[2],rdl[1],1'b0   }),
	.dout	(c4_lo_r)
);

// C8 - lo
lsu_sed_dp_prty_macro__width_8 pchk8_lo_l  (
	.din	({rdl[25],rdl[24],rdl[23],rdl[22],rdl[21],rdl[20],rdl[19],rdl[18]}),
	.dout	(c8_lo_l)
);
lsu_sed_dp_prty_macro__width_8 pchk8_lo_r  (
	.din	({ecc[3],rdl[10],rdl[9],rdl[8],rdl[7],rdl[6],rdl[5],rdl[4]}),
	.dout	(c8_lo_r)
);

// C16 - lo
lsu_sed_dp_prty_macro__width_8 pchk16_lo_r  (
	.din	({ecc[4],rdl[17],rdl[16],rdl[15],rdl[14],rdl[13],rdl[12],rdl[11]}),
	.dout	(c16_lo_r)
);

// C32 - lo
lsu_sed_dp_prty_macro__width_8 pchk32_lo_l  (
	.din	({rdl[31],rdl[30],rdl[29],rdl[28],rdl[27],rdl[26],1'b0   ,ecc[5]}),
	.dout	(c32_lo_l)
);

// CF - lo
lsu_sed_dp_prty_macro__width_16 pchkf_lo_l  (
	.din	({rdl[31],rdl[30],rdl[29],rdl[28],rdl[27],rdl[26],rdl[25],rdl[24],
		  rdl[23],rdl[22],rdl[21],rdl[20],rdl[19],rdl[18],rdl[17],rdl[16]}),
	.dout	(cf_lo_l)
);
lsu_sed_dp_prty_macro__width_16 pchkf_lo_r  (
	.din	({rdl[15],rdl[14],rdl[13],rdl[12],rdl[11],rdl[10],rdl[9],rdl[8],
		  rdl[7],rdl[6],rdl[5],rdl[4],rdl[3],rdl[2],rdl[1],rdl[0]}),
	.dout	(cf_lo_r)
);
lsu_sed_dp_prty_macro__width_8 pchkf_lo_c  (
	.din	({ecc[6],ecc[5],ecc[4],ecc[3],ecc[2],ecc[1],ecc[0],1'b0}),
	.dout	(cf_lo_c)
);

lsu_sed_dp_msff_macro__stack_42l__width_26 dff_prty_bits   (
	.scan_in(dff_prty_bits_scanin),
	.scan_out(dff_prty_bits_scanout),
	.din	({c32_hi_l,c32_lo_l,c1_hi_l,c1_lo_l,c2_hi_l,c2_lo_l,c4_hi_l,c4_lo_l,
		  cf_hi_l,cf_lo_l,c8_hi_l,c8_lo_l,
		  cf_hi_c,cf_lo_c,
		  c16_hi_r,c16_lo_r,c1_hi_r,c1_lo_r,c2_hi_r,c2_lo_r,c4_hi_r,c4_lo_r,
		  c8_hi_r,c8_lo_r,cf_hi_r,cf_lo_r
		}),
	.dout	({sed_c32_hi,sed_c32_lo,sed_c1_hi[1],sed_c1_lo[1],sed_c2_hi[1],sed_c2_lo[1],sed_c4_hi[1],sed_c4_lo[1],
		  sed_cf_hi[1],sed_cf_lo[1],sed_c8_hi[1],sed_c8_lo[1],
		  sed_cf_hi[2],sed_cf_lo[2],
		  sed_c16_hi[0],sed_c16_lo[0],sed_c1_hi[0],sed_c1_lo[0],sed_c2_hi[0],sed_c2_lo[0],sed_c4_hi[0],sed_c4_lo[0],
		  sed_c8_hi[0],sed_c8_lo[0],sed_cf_hi[0],sed_cf_lo[0]
		}),
	.clk    (l2clk),
	.en	(sbc_ramout_clken),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
assign sed_c16_hi[1] = sed_c8_hi[1];
assign sed_c16_lo[1] = sed_c8_lo[1];

////////////////////////////////////////////////////////////////////////////////
// stb_ram output flops and correction xors

lsu_sed_dp_msff_macro__minbuff_1__stack_42l__width_42 dff_rd_data_0     (
	.scan_in(dff_rd_data_0_scanin),
	.scan_out(dff_rd_data_0_scanout),
	.din	({stb_ram_rd_cparity,stb_ram_rd_ctl[2],stb_ram_rd_data[63:48],stb_ram_rd_ecc[13:7],1'b0,     stb_ram_rd_data[47:32]}),
	.dout	({stb_ram_cparity,   stb_ram_ctl[2],   stb_ram_data[63:48],   stb_ram_ecc[13:7],   unused[0],stb_ram_data[47:32]}),
	.clk    (l2clk),
	.en	(sbc_ramout_clken),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_sed_dp_msff_macro__minbuff_1__stack_42l__width_42 dff_rd_data_1     (
	.scan_in(dff_rd_data_1_scanin),
	.scan_out(dff_rd_data_1_scanout),
	.din	({stb_ram_rd_ctl[1:0],stb_ram_rd_data[31:16],stb_ram_rd_ecc[6:0],1'b0,     stb_ram_rd_data[15:0]}),
	.dout	({stb_ram_ctl[1:0],   stb_ram_data[31:16],   stb_ram_ecc[6:0],   unused[1],stb_ram_data[15:0]}),
	.clk    (l2clk),
	.en	(sbc_ramout_clken),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

lsu_sed_dp_xnor_macro__stack_32c__width_32 ecc_xnor_0   (
	.din0	(stb_ram_data[63:32]),
	.din1	(sec_corr_bit[63:32]),
	.dout	(stb_ram_data_corr_[63:32])
);
lsu_sed_dp_inv_macro__stack_32c__width_32 ecc_inv_0   (
	.din	(stb_ram_data_corr_[63:32]),
	.dout	(stb_ram_data_corr[63:32])
);
lsu_sed_dp_xnor_macro__stack_32c__width_32 ecc_xnor_1   (
	.din0	(stb_ram_data[31:0]),
	.din1	(sec_corr_bit[31:0]),
	.dout	(stb_ram_data_corr_[31:0])
);
lsu_sed_dp_inv_macro__stack_32c__width_32 ecc_inv_1   (
	.din	(stb_ram_data_corr_[31:0]),
	.dout	(stb_ram_data_corr[31:0])
);

////////////////////////////////////////////////////////////////////////////////
// STB diagnostic read and bist muxing

lsu_sed_dp_and_macro__ports_2__stack_32c__width_32 def_value_mx    (
	.din0	({4{bist_cmp_data[7:0]}}),
	.din1	({32{mbi_run}}),	
	.dout	(def_value[31:0])
);

lsu_sed_dp_mux_macro__mux_aope__ports_3__stack_32c__width_32 stb_diag_mux1_0     (
	.din0	(stb_ram_data[63:32]),
	.din1	({def_value[31:16],stb_cam_data[7:0],stb_cam_data[44:37]}),	
	.din2	(def_value[31:0]),
	.sel0	(dcc_stb_data_rd_w3),
	.sel1	(dcc_stb_addr_sel_w3),
	.dout	(stb_diag_rd_data[63:32])
);
lsu_sed_dp_mux_macro__mux_aonpe__ports_5__stack_32c__width_32 stb_diag_mux1_1     (
	.din0	(stb_ram_data[31:0]),
	.din1	({def_value[31:14],stb_ram_ecc[13:0]}),	
	.din2	({def_value[31:4],stb_ram_cparity,stb_ram_ctl[2:0]}),	
	.din3	({stb_cam_data[36:8],def_value[2:0]}),	
	.din4	({def_value[31:3],sbc_diag_wptr_w3[2:0]}),
	.sel0	(dcc_stb_data_rd_w3),
	.sel1	(dcc_stb_ecc_rd_w3),
	.sel2	(dcc_stb_ctl_rd_w3),
	.sel3	(dcc_stb_addr_sel_w3),
	.sel4	(dcc_stb_ptr_rd_w3),
	.dout	(stb_diag_rd_data[31:0])
);

lsu_sed_dp_cmp_macro__width_16 bist_cmp_0  (
	.din0	({2{bist_cmp_data[7:0]}}),
	.din1	(stb_diag_rd_data[63:48]),
	.dout	(sed_bist_cmp_0)
);
lsu_sed_dp_cmp_macro__width_16 bist_cmp_1  (
	.din0	({2{bist_cmp_data[7:0]}}),
	.din1	(stb_diag_rd_data[47:32]),
	.dout	(sed_bist_cmp_1)
);
lsu_sed_dp_cmp_macro__width_16 bist_cmp_2  (
	.din0	({2{bist_cmp_data[7:0]}}),
	.din1	(stb_diag_rd_data[31:16]),
	.dout	(sed_bist_cmp_2)
);
lsu_sed_dp_cmp_macro__width_16 bist_cmp_3  (
	.din0	({2{bist_cmp_data[7:0]}}),
	.din1	(stb_diag_rd_data[15:0]),
	.dout	(sed_bist_cmp_3)
);

lsu_sed_dp_buff_macro__stack_32c__width_32 ldxa_asi_data_buf_0   (
	.din	(stb_diag_rd_data[63:32]),
	.dout	(stb_ldxa_asi_data_w[63:32])
);
lsu_sed_dp_buff_macro__stack_32c__width_32 ldxa_asi_data_buf_1   (
	.din	(stb_diag_rd_data[31:0]),
	.dout	(stb_ldxa_asi_data_w[31:0])
);

// fixscan start:
assign dff_prty_bits_scanin      = scan_in                  ;
assign dff_rd_data_0_scanin      = dff_prty_bits_scanout    ;
assign dff_rd_data_1_scanin      = dff_rd_data_0_scanout    ;
assign scan_out                  = dff_rd_data_1_scanout    ;
// fixscan end:
endmodule



//
//   buff macro
//
//





module lsu_sed_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 (
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
//   parity macro (even parity)
//
//





module lsu_sed_dp_prty_macro__width_16 (
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





module lsu_sed_dp_xor_macro__ports_2__width_1 (
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





module lsu_sed_dp_prty_macro__width_8 (
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





module lsu_sed_dp_buff_macro__width_1 (
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
//   invert macro
//
//





module lsu_sed_dp_inv_macro__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






inv #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_sed_dp_mux_macro__buffsel_none__dmux_4x__mux_aonpe__ports_2__width_14 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [13:0] din0;
  input sel0;
  input [13:0] din1;
  input sel1;
  output [13:0] dout;





mux2s #(14)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[13:0]),
  .in1(din1[13:0]),
.dout(dout[13:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module lsu_sed_dp_msff_macro__stack_42l__width_26 (
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
wire [24:0] so;

  input [25:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [25:0] dout;


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
dff #(26)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[25:0]),
.si({scan_in,so[24:0]}),
.so({so[24:0],scan_out}),
.q(dout[25:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module lsu_sed_dp_msff_macro__minbuff_1__stack_42l__width_42 (
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
wire [40:0] so;

  input [41:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [41:0] dout;


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
dff #(42)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[41:0]),
.si({scan_in,so[40:0]}),
.so({so[40:0],scan_out}),
.q(dout[41:0])
);




















endmodule









//
//   xnor macro for ports = 2,3
//
//





module lsu_sed_dp_xnor_macro__stack_32c__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output [31:0] dout;






xnor2 #(32)  d0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout[31:0])
);







endmodule





//
//   invert macro
//
//





module lsu_sed_dp_inv_macro__stack_32c__width_32 (
  din, 
  dout);
  input [31:0] din;
  output [31:0] dout;






inv #(32)  d0_0 (
.in(din[31:0]),
.out(dout[31:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module lsu_sed_dp_and_macro__ports_2__stack_32c__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output [31:0] dout;






and2 #(32)  d0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout[31:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_sed_dp_mux_macro__mux_aope__ports_3__stack_32c__width_32 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [31:0] din0;
  input [31:0] din1;
  input [31:0] din2;
  input sel0;
  input sel1;
  output [31:0] dout;





cl_dp1_penc3_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(32)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
.dout(dout[31:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_sed_dp_mux_macro__mux_aonpe__ports_5__stack_32c__width_32 (
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
  output [31:0] dout;





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
mux5s #(32)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
  .in3(din3[31:0]),
  .in4(din4[31:0]),
.dout(dout[31:0])
);









  



endmodule


//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module lsu_sed_dp_cmp_macro__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output dout;






cmp #(16)  m0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout)
);










endmodule





//
//   buff macro
//
//





module lsu_sed_dp_buff_macro__stack_32c__width_32 (
  din, 
  dout);
  input [31:0] din;
  output [31:0] dout;






buff #(32)  d0_0 (
.in(din[31:0]),
.out(dout[31:0])
);








endmodule




