// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_dac_ctl.v
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
module lsu_dac_ctl (
  dcc_ld_inst_vld_m, 
  dcc_l2fill_vld_m, 
  dcc_lendian_pre_m, 
  dcc_bendian_byp_m, 
  dcc_baddr_m, 
  dcc_ld_sz_m, 
  dcc_signed_m, 
  lmc_asi_bypass_m, 
  lmc_byp_vld_m, 
  tlb_cache_way_hit_b, 
  lmd_misc_msb_m, 
  dca_msb_w0_b, 
  dca_msb_w1_b, 
  dca_msb_w2_b, 
  dca_msb_w3_b, 
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
  dac_byte_one_extend, 
  dac_byte_sel_data, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk, 
  spc_bclk, 
  scan_out, 
  lbist_run, 
  mbi_run, 
  bist_wdata_1, 
  dac_bist_cmp_data, 
  lsu_lsu_pmen_, 
  dmo_coresel, 
  dmo_dcmuxctl);
wire se;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire l1clk_en;
wire mbi_run_local;
wire l1clk_pm1;
wire dmo_coresel_qual;
wire dmo_dcmuxctl_qual;
wire dff_dac_b_scanin;
wire dff_dac_b_scanout;
wire ld_inst_vld_b;
wire bendian_m;
wire dff_endian_b_scanin;
wire dff_endian_b_scanout;
wire bendian_b;
wire lendian_b;
wire [7:0] offset_m;
wire [7:0] offset_bist_data_in;
wire dff_baddr_b_scanin;
wire dff_baddr_b_scanout;
wire [7:0] offset_bist_data_out;
wire offset_b4_data_out;
wire offset_b0_data_out;
wire [7:0] offset;
wire [1:0] ld_sz_m;
wire byte_sz_m;
wire hw_sz_m;
wire word_sz_m;
wire dw_sz_m;
wire dff_ld_sz_b_scanin;
wire dff_ld_sz_b_scanout;
wire byte_sz;
wire hw_sz;
wire word_sz;
wire dw_sz;
wire dff_sext_b_scanin;
wire dff_sext_b_scanout;
wire signed_b;
wire dff_misc_msb_b_scanin;
wire dff_misc_msb_b_scanout;
wire [7:0] misc_msb_b;
wire sign_bit_w0;
wire sel_msb0;
wire sel_msb1;
wire sel_msb2;
wire sel_msb3;
wire sel_msb4;
wire sel_msb5;
wire sel_msb6;
wire sel_msb7;
wire sign_bit_w1;
wire sign_bit_w2;
wire sign_bit_w3;
wire sign_bit_xx;
wire sign_bit;
wire bendian;
wire lendian;
wire sign_ext;
wire swap7_byte0;
wire swap7_byte3;
wire swap7_byte4;
wire swap7_byte7;
wire swap6_byte1;
wire swap6_byte2;
wire swap6_byte5;
wire swap6_byte6;
wire swap5_byte1;
wire swap5_byte2;
wire swap5_byte5;
wire swap5_byte6;
wire swap4_byte0;
wire swap4_byte3;
wire swap4_byte4;
wire swap4_byte7;
wire swap3_byte0;
wire swap3_byte3;
wire swap3_byte4;
wire swap3_byte7;
wire swap2_byte1;
wire swap2_byte2;
wire swap2_byte5;
wire swap2_byte6;
wire swap1_byte0;
wire swap1_byte1;
wire swap1_byte2;
wire swap1_byte3;
wire swap1_byte4;
wire swap1_byte5;
wire swap1_byte6;
wire swap1_byte7;
wire swap0_byte0;
wire swap0_byte1;
wire swap0_byte2;
wire swap0_byte3;
wire swap0_byte4;
wire swap0_byte5;
wire swap0_byte6;
wire swap0_byte7;
wire spares_scanin;
wire spares_scanout;


input		dcc_ld_inst_vld_m;
input		dcc_l2fill_vld_m;
input		dcc_lendian_pre_m;
input		dcc_bendian_byp_m;
input	[2:0]	dcc_baddr_m;
input	[1:0]	dcc_ld_sz_m;
input		dcc_signed_m;

input		lmc_asi_bypass_m;
input		lmc_byp_vld_m;

input	[3:0]	tlb_cache_way_hit_b;

input	[7:0]	lmd_misc_msb_m;
input	[7:0]	dca_msb_w0_b;
input	[7:0]	dca_msb_w1_b;
input	[7:0]	dca_msb_w2_b;
input	[7:0]	dca_msb_w3_b;

output		dac_swap7_byte0_l;
output		dac_swap7_byte3_l;
output		dac_swap7_byte4_l;
output		dac_swap7_byte7_l;
output		dac_swap6_byte1_l;
output		dac_swap6_byte2_l;
output		dac_swap6_byte5_l;
output		dac_swap6_byte6_l;
output		dac_swap5_byte1_l;
output		dac_swap5_byte2_l;
output		dac_swap5_byte5_l;
output		dac_swap5_byte6_l;
output		dac_swap4_byte0_l;
output		dac_swap4_byte3_l;
output		dac_swap4_byte4_l;
output		dac_swap4_byte7_l;
output		dac_swap3_byte0_r;
output		dac_swap3_byte3_r;
output		dac_swap3_byte4_r;
output		dac_swap3_byte7_r;
output		dac_swap2_byte1_r;
output		dac_swap2_byte2_r;
output		dac_swap2_byte5_r;
output		dac_swap2_byte6_r;
output		dac_swap1_byte0_r;
output		dac_swap1_byte1_r;
output		dac_swap1_byte2_r;
output		dac_swap1_byte3_r;
output		dac_swap1_byte4_r;
output		dac_swap1_byte5_r;
output		dac_swap1_byte6_r;
output		dac_swap1_byte7_r;
output		dac_swap0_byte0_r;
output		dac_swap0_byte1_r;
output		dac_swap0_byte2_r;
output		dac_swap0_byte3_r;
output		dac_swap0_byte4_r;
output		dac_swap0_byte5_r;
output		dac_swap0_byte6_r;
output		dac_swap0_byte7_r;

output	[7:1]	dac_byte_one_extend;
output	[7:1]	dac_byte_sel_data;

input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input		tcu_scan_en;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;

input		lbist_run;
input		mbi_run;
input	[7:0]	bist_wdata_1;
output	[7:0]	dac_bist_cmp_data;

input		lsu_lsu_pmen_;

input		dmo_coresel;		// THIS IS ACTIVE LOW!!!!!
input		dmo_dcmuxctl;

// scan renames
assign se = tcu_scan_en;
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = spc_aclk;
assign soclk = spc_bclk;
// end scan

//////////////////////////////
// Clock header
//////////////////////////////

assign l1clk_en = lsu_lsu_pmen_ | dcc_ld_inst_vld_m | dcc_l2fill_vld_m | lmc_byp_vld_m |
                  mbi_run | mbi_run_local | lbist_run | ~dmo_coresel;

lsu_dac_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk                          ),
        .l1en   (l1clk_en                       ),
        .l1clk  (l1clk_pm1                      ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);


// Qual core inputs with lbist run to prevent X propagation
assign dmo_coresel_qual = ~dmo_coresel & mbi_run_local & ~lbist_run;
assign dmo_dcmuxctl_qual = dmo_dcmuxctl & ~lbist_run;

// Data alignment and sign extension is part of the critical path with
// load data returning to the register files.  When possible, all inputs
// to this block should come from the M stage so that work can begin
// at the start of B.

lsu_dac_ctl_msff_ctl_macro__width_2 dff_dac_b  (
        .scan_in(dff_dac_b_scanin),
        .scan_out(dff_dac_b_scanout),
        .l1clk  (l1clk_pm1),
	.din	({dcc_ld_inst_vld_m, mbi_run}),
	.dout	({ld_inst_vld_b,     mbi_run_local}),
  .siclk(siclk),
  .soclk(soclk)
);

/////////////////////////////////////////////////////////////
// NOTE: DMO operation requires data alignment such that
// bits 63:32 are either 63:32 (no swapping) or 31:0 (bendian
// word at offset 4.
/////////////////////////////////////////////////////////////

// Endianess
// Endianess is controlled by the following rules
// 1. Internal ASI's are all big endian.
// 2. Accesses with implicit ASI's are controlled by (PSTATE.CLE ^ TTE.IE)
// 3. Accesses with explicit ASI's are controlled by (ASI value ^ TTE.IE)
// Most of the work is done ahead of time in dcc.
// Accesses with TTE.IE=1 always miss the D$, so it doesn't factor in the hit path

assign bendian_m = (dcc_ld_inst_vld_m & ~dcc_lendian_pre_m) | 	// ld hit
                   dcc_bendian_byp_m |				// fill or bypass
                   dmo_coresel_qual;				// DMO

lsu_dac_ctl_msff_ctl_macro__width_2 dff_endian_b  (
        .scan_in(dff_endian_b_scanin),
        .scan_out(dff_endian_b_scanout),
        .l1clk  (l1clk_pm1),
	.din	({(bendian_m | dmo_coresel_qual),~(bendian_m | dmo_coresel_qual)}),
	.dout	({bendian_b,                      lendian_b}),
  .siclk(siclk),
  .soclk(soclk)
);


// Byte offset

assign offset_m[0] = ~dcc_baddr_m[2] & ~dcc_baddr_m[1] & ~dcc_baddr_m[0];
assign offset_m[1] = ~dcc_baddr_m[2] & ~dcc_baddr_m[1] &  dcc_baddr_m[0];
assign offset_m[2] = ~dcc_baddr_m[2] &  dcc_baddr_m[1] & ~dcc_baddr_m[0];
assign offset_m[3] = ~dcc_baddr_m[2] &  dcc_baddr_m[1] &  dcc_baddr_m[0];
assign offset_m[4] =  dcc_baddr_m[2] & ~dcc_baddr_m[1] & ~dcc_baddr_m[0];
assign offset_m[5] =  dcc_baddr_m[2] & ~dcc_baddr_m[1] &  dcc_baddr_m[0];
assign offset_m[6] =  dcc_baddr_m[2] &  dcc_baddr_m[1] & ~dcc_baddr_m[0];
assign offset_m[7] =  dcc_baddr_m[2] &  dcc_baddr_m[1] &  dcc_baddr_m[0];

// Reuse this mux for bist data when in BIST mode
assign offset_bist_data_in[7:0] = mbi_run_local ? bist_wdata_1[7:0] : offset_m[7:0];

// offset[4,0] needs to factor the dmo_dcmuxctl so I can't share the flop between bist & functional

lsu_dac_ctl_msff_ctl_macro__width_10 dff_baddr_b  (
        .scan_in(dff_baddr_b_scanin),
        .scan_out(dff_baddr_b_scanout),
        .l1clk  (l1clk_pm1),
	.din	({offset_bist_data_in[7:0],(offset_m[4] | (dmo_coresel_qual & ~dmo_dcmuxctl_qual)),
                  (offset_m[0] & ~(dmo_coresel_qual & ~dmo_dcmuxctl_qual))}),
	.dout	({offset_bist_data_out[7:0],offset_b4_data_out,offset_b0_data_out}),
  .siclk(siclk),
  .soclk(soclk)
);

assign offset[7:0] = {offset_bist_data_out[7:5],offset_b4_data_out,offset_bist_data_out[3:1],offset_b0_data_out};
assign dac_bist_cmp_data[7:0] = offset_bist_data_out[7:0];

// Data Size
// Size for internal ASI accesses is always 64 bits (sz==11)
assign ld_sz_m[1:0] = dcc_ld_sz_m[1:0] | {2{lmc_asi_bypass_m}};

assign byte_sz_m = ~ld_sz_m[1] & ~ld_sz_m[0] & ~dmo_coresel_qual;
assign hw_sz_m   = ~ld_sz_m[1] &  ld_sz_m[0] & ~dmo_coresel_qual;
assign word_sz_m =  (ld_sz_m[1] & ~ld_sz_m[0] & ~dmo_coresel_qual) | (dmo_coresel_qual & ~dmo_dcmuxctl_qual);
assign dw_sz_m   =  (ld_sz_m[1] &  ld_sz_m[0] & ~dmo_coresel_qual) | (dmo_coresel_qual & dmo_dcmuxctl_qual);

lsu_dac_ctl_msff_ctl_macro__width_4 dff_ld_sz_b  (
        .scan_in(dff_ld_sz_b_scanin),
        .scan_out(dff_ld_sz_b_scanout),
        .l1clk  (l1clk_pm1),
	.din	({byte_sz_m,hw_sz_m,word_sz_m,dw_sz_m}),
	.dout	({byte_sz  ,hw_sz  ,word_sz  ,dw_sz  }),
  .siclk(siclk),
  .soclk(soclk)
);


// Sign extend
lsu_dac_ctl_msff_ctl_macro__width_1 dff_sext_b  (
        .scan_in(dff_sext_b_scanin),
        .scan_out(dff_sext_b_scanout),
        .l1clk  (l1clk_pm1),
	.din	(dcc_signed_m & ~mbi_run_local),
	.dout	(signed_b),
  .siclk(siclk),
  .soclk(soclk)
);

// Sign bit derivation
// Figure the correct sign bit for each way and the bypass path
// separately.  Then, once the hit way is known, mux the result.

lsu_dac_ctl_msff_ctl_macro__width_8 dff_misc_msb_b  (
        .scan_in(dff_misc_msb_b_scanin),
        .scan_out(dff_misc_msb_b_scanout),
        .l1clk  (l1clk_pm1),
	.din	(lmd_misc_msb_m[7:0]),
	.dout	(misc_msb_b[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign sign_bit_w0 = sel_msb0 & dca_msb_w0_b[0] |
                     sel_msb1 & dca_msb_w0_b[1] |
                     sel_msb2 & dca_msb_w0_b[2] |
                     sel_msb3 & dca_msb_w0_b[3] |
                     sel_msb4 & dca_msb_w0_b[4] |
                     sel_msb5 & dca_msb_w0_b[5] |
                     sel_msb6 & dca_msb_w0_b[6] |
                     sel_msb7 & dca_msb_w0_b[7] ;

assign sign_bit_w1 = sel_msb0 & dca_msb_w1_b[0] |
                     sel_msb1 & dca_msb_w1_b[1] |
                     sel_msb2 & dca_msb_w1_b[2] |
                     sel_msb3 & dca_msb_w1_b[3] |
                     sel_msb4 & dca_msb_w1_b[4] |
                     sel_msb5 & dca_msb_w1_b[5] |
                     sel_msb6 & dca_msb_w1_b[6] |
                     sel_msb7 & dca_msb_w1_b[7] ;

assign sign_bit_w2 = sel_msb0 & dca_msb_w2_b[0] |
                     sel_msb1 & dca_msb_w2_b[1] |
                     sel_msb2 & dca_msb_w2_b[2] |
                     sel_msb3 & dca_msb_w2_b[3] |
                     sel_msb4 & dca_msb_w2_b[4] |
                     sel_msb5 & dca_msb_w2_b[5] |
                     sel_msb6 & dca_msb_w2_b[6] |
                     sel_msb7 & dca_msb_w2_b[7] ;

assign sign_bit_w3 = sel_msb0 & dca_msb_w3_b[0] |
                     sel_msb1 & dca_msb_w3_b[1] |
                     sel_msb2 & dca_msb_w3_b[2] |
                     sel_msb3 & dca_msb_w3_b[3] |
                     sel_msb4 & dca_msb_w3_b[4] |
                     sel_msb5 & dca_msb_w3_b[5] |
                     sel_msb6 & dca_msb_w3_b[6] |
                     sel_msb7 & dca_msb_w3_b[7] ;

assign sign_bit_xx = sel_msb0 & misc_msb_b[0] |
                     sel_msb1 & misc_msb_b[1] |
                     sel_msb2 & misc_msb_b[2] |
                     sel_msb3 & misc_msb_b[3] |
                     sel_msb4 & misc_msb_b[4] |
                     sel_msb5 & misc_msb_b[5] |
                     sel_msb6 & misc_msb_b[6] |
                     sel_msb7 & misc_msb_b[7] ;

assign sign_bit = ld_inst_vld_b & tlb_cache_way_hit_b[0] & sign_bit_w0 |
                  ld_inst_vld_b & tlb_cache_way_hit_b[1] & sign_bit_w1 |
                  ld_inst_vld_b & tlb_cache_way_hit_b[2] & sign_bit_w2 |
                  ld_inst_vld_b & tlb_cache_way_hit_b[3] & sign_bit_w3 |
                  ~ld_inst_vld_b & sign_bit_xx;


assign bendian = bendian_b;
assign lendian = lendian_b;
assign sign_ext = signed_b;

// Byte Alignment
// dcc_swapX_byteY indicates that the aligned data will have byteY as
// returned from the dcache muxed into the byteX position.  This data
// may be overridden by sign extesion in the next step.
//
// See the espresso input file align_byte.pla for the truth table.
// espresso -Dso -o eqntott align_byte.pla

assign swap7_byte0 = (lendian&word_sz&offset[4]) | (lendian&dw_sz);

assign swap7_byte3 = (bendian&word_sz&offset[4]);			// DMOl

assign swap7_byte4 = (lendian&word_sz&offset[0]);

assign swap7_byte7 = (bendian&word_sz&offset[0]) | (bendian&dw_sz);	// DMOh

assign swap6_byte1 = (lendian&word_sz&offset[4]) | (lendian&dw_sz);

assign swap6_byte2 = (bendian&word_sz&offset[4]);			// DMOl

assign swap6_byte5 = (lendian&word_sz&offset[0]);

assign swap6_byte6 = (bendian&word_sz&offset[0]) | (bendian&dw_sz);	// DMOh

assign swap5_byte1 = (bendian&word_sz&offset[4]);			// DMOl

assign swap5_byte2 = (lendian&word_sz&offset[4]) | (lendian&dw_sz);

assign swap5_byte5 = (bendian&word_sz&offset[0]) | (bendian&dw_sz);	// DMOh

assign swap5_byte6 = (lendian&word_sz&offset[0]);

assign swap4_byte0 = (bendian&word_sz&offset[4]);			// DMOl

assign swap4_byte3 = (lendian&word_sz&offset[4]) | (lendian&dw_sz);

assign swap4_byte4 = (bendian&word_sz&offset[0]) | (bendian&dw_sz);	// DMOh

assign swap4_byte7 = (lendian&word_sz&offset[0]);

assign swap3_byte0 = (lendian&word_sz&offset[4]);

assign swap3_byte3 = (bendian&word_sz&offset[4]) | (bendian&dw_sz);

assign swap3_byte4 = (lendian&word_sz&offset[0]) | (lendian&dw_sz);

assign swap3_byte7 = (bendian&word_sz&offset[0]);

assign swap2_byte1 = (lendian&word_sz&offset[4]);

assign swap2_byte2 = (bendian&word_sz&offset[4]) | (bendian&dw_sz);

assign swap2_byte5 = (lendian&word_sz&offset[0]) | (lendian&dw_sz);

assign swap2_byte6 = (bendian&word_sz&offset[0]);

assign swap1_byte0 = (lendian&hw_sz&offset[6]);

assign swap1_byte1 = (bendian&hw_sz&offset[6]) | (bendian&word_sz&offset[4]) | (
    bendian&dw_sz);

assign swap1_byte2 = (lendian&word_sz&offset[4]) | (lendian&hw_sz&offset[4]);

assign swap1_byte3 = (bendian&hw_sz&offset[4]);

assign swap1_byte4 = (lendian&hw_sz&offset[2]);

assign swap1_byte5 = (bendian&hw_sz&offset[2]) | (bendian&word_sz&offset[0]);

assign swap1_byte6 = (lendian&word_sz&offset[0]) | (lendian&hw_sz&offset[0]) | (
    lendian&dw_sz);

assign swap1_byte7 = (bendian&hw_sz&offset[0]);

assign swap0_byte0 = (bendian&hw_sz&offset[6]) | (bendian&word_sz&offset[4]) | (
    byte_sz&offset[7]) | (bendian&dw_sz);

assign swap0_byte1 = (lendian&hw_sz&offset[6]) | (byte_sz&offset[6]);

assign swap0_byte2 = (bendian&hw_sz&offset[4]) | (byte_sz&offset[5]);

assign swap0_byte3 = (lendian&word_sz&offset[4]) | (lendian&hw_sz&offset[4]) | (
    byte_sz&offset[4]);

assign swap0_byte4 = (bendian&hw_sz&offset[2]) | (bendian&word_sz&offset[0]) | (
    byte_sz&offset[3]);

assign swap0_byte5 = (lendian&hw_sz&offset[2]) | (byte_sz&offset[2]);

assign swap0_byte6 = (bendian&hw_sz&offset[0]) | (byte_sz&offset[1]);

assign swap0_byte7 = (lendian&word_sz&offset[0]) | (lendian&hw_sz&offset[0]) | (
    byte_sz&offset[0]) | (lendian&dw_sz);

// Left and right side outputs
assign dac_swap7_byte0_l = swap7_byte0;
assign dac_swap7_byte3_l = swap7_byte3;
assign dac_swap7_byte4_l = swap7_byte4;
assign dac_swap7_byte7_l = swap7_byte7;
assign dac_swap6_byte1_l = swap6_byte1;
assign dac_swap6_byte2_l = swap6_byte2;
assign dac_swap6_byte5_l = swap6_byte5;
assign dac_swap6_byte6_l = swap6_byte6;
assign dac_swap5_byte1_l = swap5_byte1;
assign dac_swap5_byte2_l = swap5_byte2;
assign dac_swap5_byte5_l = swap5_byte5;
assign dac_swap5_byte6_l = swap5_byte6;
assign dac_swap4_byte0_l = swap4_byte0;
assign dac_swap4_byte3_l = swap4_byte3;
assign dac_swap4_byte4_l = swap4_byte4;
assign dac_swap4_byte7_l = swap4_byte7;
assign dac_swap3_byte0_r = swap3_byte0;
assign dac_swap3_byte3_r = swap3_byte3;
assign dac_swap3_byte4_r = swap3_byte4;
assign dac_swap3_byte7_r = swap3_byte7;
assign dac_swap2_byte1_r = swap2_byte1;
assign dac_swap2_byte2_r = swap2_byte2;
assign dac_swap2_byte5_r = swap2_byte5;
assign dac_swap2_byte6_r = swap2_byte6;
assign dac_swap1_byte0_r = swap1_byte0;
assign dac_swap1_byte1_r = swap1_byte1;
assign dac_swap1_byte2_r = swap1_byte2;
assign dac_swap1_byte3_r = swap1_byte3;
assign dac_swap1_byte4_r = swap1_byte4;
assign dac_swap1_byte5_r = swap1_byte5;
assign dac_swap1_byte6_r = swap1_byte6;
assign dac_swap1_byte7_r = swap1_byte7;
assign dac_swap0_byte0_r = swap0_byte0;
assign dac_swap0_byte1_r = swap0_byte1;
assign dac_swap0_byte2_r = swap0_byte2;
assign dac_swap0_byte3_r = swap0_byte3;
assign dac_swap0_byte4_r = swap0_byte4;
assign dac_swap0_byte5_r = swap0_byte5;
assign dac_swap0_byte6_r = swap0_byte6;
assign dac_swap0_byte7_r = swap0_byte7;

// Sign extension
// dac_byte_one_extend indicates a byte is to be filled with ones.
// dac_byte_sel_data indicates that the aligned data is to be passed.
// An aomux is used for this step, so the absence of one_extend or sel_data
// means that the byte will be zero filled.
// Byte 0 is never zero/one filled, so no control exists for it.
//
// See the espresso input file sext_byte.pla for the truth table.
// espresso -Dso -o eqntott sext_byte.pla

assign dac_byte_one_extend[7] = (sign_ext&sign_bit&!dw_sz);

assign dac_byte_sel_data[7] = dw_sz | dmo_coresel_qual;

assign dac_byte_one_extend[6] = (sign_ext&sign_bit&!dw_sz);

assign dac_byte_sel_data[6] = dw_sz | dmo_coresel_qual;

assign dac_byte_one_extend[5] = (sign_ext&sign_bit&!dw_sz);

assign dac_byte_sel_data[5] = dw_sz | dmo_coresel_qual;

assign dac_byte_one_extend[4] = (sign_ext&sign_bit&!dw_sz);

assign dac_byte_sel_data[4] = dw_sz | dmo_coresel_qual;

assign dac_byte_one_extend[3] = (sign_ext&sign_bit&!word_sz&!dw_sz);

assign dac_byte_sel_data[3] = (!byte_sz&!hw_sz);

assign dac_byte_one_extend[2] = (sign_ext&sign_bit&!word_sz&!dw_sz);

assign dac_byte_sel_data[2] = (!byte_sz&!hw_sz);

assign dac_byte_one_extend[1] = (sign_ext&sign_bit&byte_sz);

assign dac_byte_sel_data[1] = (!byte_sz);

// The sign bit is determined by first figuring out which byte will be
// the most significant based on access size, byte offset address, and
// endianess.  The msb of that byte is the sign bit.

assign sel_msb0 = (lendian & word_sz & offset[4]) | 				// LE word @4
                  (lendian & hw_sz & offset[6]) |				// LE hw @6
                  (offset[7]);							// byte @7

assign sel_msb1 = (bendian & offset[6]) |					// BE hw @6
                  (byte_sz & offset[6]);					// byte @6

assign sel_msb2 = (lendian & hw_sz & offset[4]) |				// LE hw @4
                  (offset[5]);							// byte @5

assign sel_msb3 = (bendian & offset[4]) |					// BE hw or word @4
                  (byte_sz & offset[4]);					// byte @4

assign sel_msb4 = (lendian & word_sz & offset[0]) |				// LE word @0
                  (lendian & hw_sz & offset[2]) |				// LE hw @2
                  (offset[3]);							// byte @3

assign sel_msb5 = (bendian & offset[2]) |					// BE hw@2
                  (byte_sz & offset[2]);					// byte @2

assign sel_msb6 = (lendian & hw_sz & offset[0]) |				// LE hw @0
                  (offset[1]);							// byte @1

assign sel_msb7 = (bendian & offset[0]) |					// BE hw or word @0
                  (byte_sz & offset[0]);					// byte @0


lsu_dac_ctl_spare_ctl_macro__num_1 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk_pm1),
  .siclk(siclk),
  .soclk(soclk)
);

supply0 vss;
supply1 vdd;
// fixscan start:
assign dff_dac_b_scanin          = scan_in                  ;
assign dff_endian_b_scanin       = dff_dac_b_scanout        ;
assign dff_baddr_b_scanin        = dff_endian_b_scanout     ;
assign dff_ld_sz_b_scanin        = dff_baddr_b_scanout      ;
assign dff_sext_b_scanin         = dff_ld_sz_b_scanout      ;
assign dff_misc_msb_b_scanin     = dff_sext_b_scanout       ;
assign spares_scanin             = dff_misc_msb_b_scanout   ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module lsu_dac_ctl_l1clkhdr_ctl_macro (
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

module lsu_dac_ctl_msff_ctl_macro__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);












endmodule













// any PARAMS parms go into naming of macro

module lsu_dac_ctl_msff_ctl_macro__width_10 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [9:0] fdin;
wire [8:0] so;

  input [9:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [9:0] dout;
  output scan_out;
assign fdin[9:0] = din[9:0];






dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);












endmodule













// any PARAMS parms go into naming of macro

module lsu_dac_ctl_msff_ctl_macro__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module lsu_dac_ctl_msff_ctl_macro__width_1 (
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

module lsu_dac_ctl_msff_ctl_macro__width_8 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0];






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module lsu_dac_ctl_spare_ctl_macro__num_1 (
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

