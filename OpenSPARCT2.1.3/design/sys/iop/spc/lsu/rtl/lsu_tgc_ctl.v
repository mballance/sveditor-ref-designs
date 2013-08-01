// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_tgc_ctl.v
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
module lsu_tgc_ctl (
  dva_valid_m, 
  dva_valid2_m, 
  lsu_va_m, 
  lsu_va_b12to11_m, 
  exu_lsu_address_e, 
  dcc_ld_inst_vld_m, 
  dcc_dva_din_e, 
  dcc_dva_din2_e, 
  tgd_bist_compare, 
  tgc_cache_way_vld_m, 
  tgc_cache_way_vld2_m, 
  tgc_verr_b, 
  tgc_way_sel_m, 
  tgc_dva_rd_addr_e, 
  tgc_dva_din, 
  lsu_mbi_dva_fail, 
  lsu_mbi_dta_fail, 
  lsu_mbi_dtb_fail, 
  mbi_run, 
  mbi_cambist_run, 
  mbi_wdata, 
  mbi_cmpsel, 
  mbi_addr, 
  mbi_dta_read_en, 
  mbi_dva_read_en, 
  mbi_dtb_read_en, 
  bist_wdata_1, 
  bist_cmp_data, 
  bist_cmpsel_1, 
  bist_cmpsel_2, 
  bist_addr_1, 
  bist_dta_cmp_en, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk, 
  spc_bclk, 
  scan_out, 
  lsu_lsu_pmen);
wire se;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire ld_vld_m_clken;
wire tgc_mbi_run;
wire l1clk_pm1;
wire [3:0] verr_m;
wire dff_way_vld_scanin;
wire dff_way_vld_scanout;
wire [8:5] local_bist_addr_1;
wire dva_fail;
wire bist_dva_cmp_en;
wire dta_fail;
wire dtb_fail;
wire bist_dtb_cmp_en;
wire dff_bist_fail_scanin;
wire dff_bist_fail_scanout;
wire [7:0] wdata_or_addr;
wire dff_bist_scanin;
wire dff_bist_scanout;
wire bist_dta_rd_1;
wire dtb_read_en;
wire bist_dtb_rd_1;
wire [7:0] cmp_data_in;
wire bist_dta_rd_2;
wire bist_dtb_rd_2;
wire [7:0] bist_wdata_2;
wire spares_scanin;
wire spares_scanout;


input	[15:0]	dva_valid_m;
input	[15:0]	dva_valid2_m; 	// redundant copies

input	[5:4]	lsu_va_m;
input	[12:11]	lsu_va_b12to11_m;

input	[10:6]	exu_lsu_address_e;

input		dcc_ld_inst_vld_m;
input		dcc_dva_din_e;
input		dcc_dva_din2_e;

input		tgd_bist_compare;

output	[3:0]	tgc_cache_way_vld_m;
output	[3:0]	tgc_cache_way_vld2_m;
output	[3:0]	tgc_verr_b;
output	[1:0]	tgc_way_sel_m;
output	[10:6]	tgc_dva_rd_addr_e;
output	[31:0]	tgc_dva_din;

output		lsu_mbi_dva_fail;
output		lsu_mbi_dta_fail;
output		lsu_mbi_dtb_fail;

// BIST
input		mbi_run;
input		mbi_cambist_run;
input	[7:0]	mbi_wdata;
input	[1:0]	mbi_cmpsel;		// encoded
input	[8:0]	mbi_addr;
input		mbi_dta_read_en;
input		mbi_dva_read_en;
input		mbi_dtb_read_en;
output	[7:0]	bist_wdata_1;
output	[7:0]	bist_cmp_data;
output	[1:0]	bist_cmpsel_1;
output		bist_cmpsel_2;
output	[8:5]	bist_addr_1;
output		bist_dta_cmp_en;


input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input		tcu_scan_en;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;

input		lsu_lsu_pmen;

// scan renames
assign se = tcu_scan_en;
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = spc_aclk;
assign soclk = spc_bclk;
// end scan

//////////////////////////////
// Clock headers
//////////////////////////////

// Enable flops only when load is in M or during bist
assign ld_vld_m_clken = dcc_ld_inst_vld_m | mbi_run | tgc_mbi_run | ~lsu_lsu_pmen;

lsu_tgc_ctl_l1clkhdr_ctl_macro clkgen0 (
        .l2clk  (l2clk                          ),
        .l1en   (ld_vld_m_clken                 ),
        .l1clk  (l1clk_pm1                      ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

//////////////////////////////

// Valid bit muxing

assign tgc_cache_way_vld_m[3:0] = ({4{(lsu_va_m[5:4] == 2'b00)}} & dva_valid_m[3:0])  |
                                  ({4{(lsu_va_m[5:4] == 2'b01)}} & dva_valid_m[7:4])  |
                                  ({4{(lsu_va_m[5:4] == 2'b10)}} & dva_valid_m[11:8]) |
                                  ({4{(lsu_va_m[5:4] == 2'b11)}} & dva_valid_m[15:12]); 

assign tgc_cache_way_vld2_m[3:0] = ({4{(lsu_va_m[5:4] == 2'b00)}} & dva_valid2_m[3:0])  |
                                   ({4{(lsu_va_m[5:4] == 2'b01)}} & dva_valid2_m[7:4])  |
                                   ({4{(lsu_va_m[5:4] == 2'b10)}} & dva_valid2_m[11:8]) |
                                   ({4{(lsu_va_m[5:4] == 2'b11)}} & dva_valid2_m[15:12]); 

// Valid bit error detection

assign verr_m[0] = tgc_cache_way_vld_m[0] ^ tgc_cache_way_vld2_m[0];
assign verr_m[1] = tgc_cache_way_vld_m[1] ^ tgc_cache_way_vld2_m[1];
assign verr_m[2] = tgc_cache_way_vld_m[2] ^ tgc_cache_way_vld2_m[2];
assign verr_m[3] = tgc_cache_way_vld_m[3] ^ tgc_cache_way_vld2_m[3];

lsu_tgc_ctl_msff_ctl_macro__width_4 dff_way_vld  (
	.scan_in(dff_way_vld_scanin),
	.scan_out(dff_way_vld_scanout),
	.din	(verr_m[3:0]),
	.dout	(tgc_verr_b[3:0]),
	.l1clk	(l1clk_pm1),
  .siclk(siclk),
  .soclk(soclk)
);

// Valid array data in

assign tgc_dva_din[31:0] = tgc_mbi_run ? {4{mbi_wdata[7:0]}} : {{16{dcc_dva_din2_e}},{16{dcc_dva_din_e}}};

// This is the tag way select used for diagnostic and bist reads
assign tgc_way_sel_m[1:0] = tgc_mbi_run ? local_bist_addr_1[8:7] : lsu_va_b12to11_m[12:11];

// BIST compare results
assign dva_fail = bist_dva_cmp_en & ({dva_valid_m[15:0],dva_valid2_m[15:0]} != {4{bist_wdata_1[7:0]}});
assign dta_fail = bist_dta_cmp_en & ~tgd_bist_compare;
assign dtb_fail = bist_dtb_cmp_en & ~tgd_bist_compare & ~mbi_cambist_run;

lsu_tgc_ctl_msff_ctl_macro__width_3 dff_bist_fail  (
	.scan_in(dff_bist_fail_scanin),
	.scan_out(dff_bist_fail_scanout),
	.l1clk	(l1clk_pm1),
	.din	({dta_fail,        dtb_fail,        dva_fail}),
	.dout	({lsu_mbi_dta_fail,lsu_mbi_dtb_fail,lsu_mbi_dva_fail}),
  .siclk(siclk),
  .soclk(soclk)
);

//
// Address muxing for DVA array
//
assign tgc_dva_rd_addr_e[10:6] = tgc_mbi_run ? mbi_addr[4:0] : exu_lsu_address_e[10:6];

////////////////////////////////////////////////////////////////////////////////
// Flops for bist signals

assign wdata_or_addr[7:0] = mbi_cambist_run ?  mbi_addr[7:0] : mbi_wdata[7:0];

lsu_tgc_ctl_msff_ctl_macro__width_38 dff_bist  (
	.scan_in(dff_bist_scanin),
	.scan_out(dff_bist_scanout),
	.l1clk	(l1clk_pm1),
	.din	({mbi_run,
		  mbi_dta_read_en,    bist_dta_rd_1,
		  mbi_dtb_read_en,    dtb_read_en,
                  bist_dtb_rd_1,      mbi_dva_read_en,    
		  wdata_or_addr[7:0], bist_wdata_1[7:0],
                  mbi_cmpsel[1:0],    bist_cmpsel_1[0],
		  mbi_addr[8:5],      cmp_data_in[7:0]
		}),
	.dout	({tgc_mbi_run,
		  bist_dta_rd_1,      bist_dta_rd_2,
		  dtb_read_en,        bist_dtb_rd_1,
		  bist_dtb_rd_2,      bist_dva_cmp_en,
		  bist_wdata_1[7:0],  bist_wdata_2[7:0],
                  bist_cmpsel_1[1:0], bist_cmpsel_2,
		  local_bist_addr_1[8:5],bist_cmp_data[7:0]
		}),
  .siclk(siclk),
  .soclk(soclk)
);

assign cmp_data_in[7:0] = bist_dtb_rd_1 ? bist_wdata_2[7:0] : bist_wdata_1[7:0];

assign bist_addr_1[8:5] = local_bist_addr_1[8:5];
assign bist_dta_cmp_en = bist_dta_rd_2;
assign bist_dtb_cmp_en = bist_dtb_rd_2;


lsu_tgc_ctl_spare_ctl_macro__num_1 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk_pm1),
  .siclk(siclk),
  .soclk(soclk)
);

// fixscan start:
assign dff_way_vld_scanin        = scan_in                  ;
assign dff_bist_fail_scanin      = dff_way_vld_scanout      ;
assign dff_bist_scanin           = dff_bist_fail_scanout    ;
assign spares_scanin             = dff_bist_scanout         ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module lsu_tgc_ctl_l1clkhdr_ctl_macro (
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

module lsu_tgc_ctl_msff_ctl_macro__width_4 (
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

module lsu_tgc_ctl_msff_ctl_macro__width_3 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0];






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule













// any PARAMS parms go into naming of macro

module lsu_tgc_ctl_msff_ctl_macro__width_38 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [37:0] fdin;
wire [36:0] so;

  input [37:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [37:0] dout;
  output scan_out;
assign fdin[37:0] = din[37:0];






dff #(38)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[37:0]),
.si({scan_in,so[36:0]}),
.so({so[36:0],scan_out}),
.q(dout[37:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module lsu_tgc_ctl_spare_ctl_macro__num_1 (
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

