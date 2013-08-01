// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mmu_ase_dp.v
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
module mmu_ase_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  tcu_dectest, 
  tcu_muxtest, 
  lsu_va_b, 
  lsu_context_b, 
  asi_rd_tsb_cfg_0_2, 
  asi_rd_tsb_cfg_1_3, 
  asi_rd_real_range, 
  asi_rd_physical_offset, 
  asi_sel_mra_0_in, 
  asi_mra_wr_en_next, 
  asi_mra_wr_data, 
  asd0_rd_data, 
  asd1_rd_data, 
  asd0_itte_tag_data_, 
  asd1_itte_tag_data_, 
  asi_mbist_run, 
  asi_ecc_cmpsel_in, 
  asi_ase_cmpsel_in, 
  asi_mbist_wdata, 
  asi_ase_compare_data, 
  mel0_parity, 
  mel1_parity, 
  scan_out, 
  ase_mra_wr_data, 
  ase_mra_wr_data_minbuf, 
  ase_mra_rd_data, 
  ase_lsu_va_w, 
  ase_lsu_context_w, 
  ase_mbd_mbist_data, 
  mmu_itte_tag_data);
wire en;
wire clk;
wire stop;
wire test;
wire pce_ov;
wire se;
wire siclk;
wire soclk;
wire lsu_context_w_lat_scanin;
wire lsu_context_w_lat_scanout;
wire [7:0] compare_data;
wire [1:0] mbist_cmpsel;
wire ecc_cmpsel;
wire sel_mra_0;
wire lsu_va_w_lat_scanin;
wire lsu_va_w_lat_scanout;
wire [47:13] lsu_va_w;
wire [81:0] mra_rd_data;
wire [60:54] wr_data_unused;
wire wr_1_mux_scanin;
wire wr_1_mux_scanout;
wire wr_0_mux_scanin;
wire wr_0_mux_scanout;
wire [1:0] mra_parity;
wire tcu_muxtest_rep0;



input		l2clk;
input 		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;
input		tcu_dectest;
input		tcu_muxtest;

input	[47:0]	lsu_va_b;
input	[12:0]	lsu_context_b;

input		asi_rd_tsb_cfg_0_2;
input		asi_rd_tsb_cfg_1_3;
input		asi_rd_real_range;
input		asi_rd_physical_offset;
input 		asi_sel_mra_0_in;
input		asi_mra_wr_en_next;

input	[63:0]	asi_mra_wr_data;

input	[81:0]	asd0_rd_data;
input	[81:0]	asd1_rd_data;

input	[47:0]	asd0_itte_tag_data_;
input	[47:0]	asd1_itte_tag_data_;

input		asi_mbist_run;		// MBIST
input		asi_ecc_cmpsel_in;	// MBIST
input	[1:0]	asi_ase_cmpsel_in;	// MBIST
input	[7:0]	asi_mbist_wdata;	// MBIST
input	[7:0]	asi_ase_compare_data;	// MBIST
input	[1:0]	mel0_parity;		// MBIST
input	[1:0]	mel1_parity;		// MBIST



output		scan_out;

output 	[81:0]	ase_mra_wr_data;
output 	[81:0]	ase_mra_wr_data_minbuf;

output	[63:0]	ase_mra_rd_data;

output	[47:13]	ase_lsu_va_w;
output	[12:0]	ase_lsu_context_w;

output	[31:0]	ase_mbd_mbist_data;	// MBIST

output	[47:0]	mmu_itte_tag_data;



//////////////////////////////////////////////////////////////////////

assign en	= 1'b1;
assign clk	= l2clk;
assign stop	= 1'b0;
assign test	= tcu_dectest;

mmu_ase_dp_buff_macro__width_4 clk_control_buf  (
	.din	({tcu_pce_ov		       ,
		  tcu_scan_en		       ,
		  spc_aclk		       ,
		  spc_bclk		       }),
	.dout	({pce_ov		       ,
		  se			       ,
		  siclk			       ,
		  soclk			       })
);






mmu_ase_dp_msff_macro__stack_58c__width_25 lsu_context_w_lat   (
	.scan_in(lsu_context_w_lat_scanin),
	.scan_out(lsu_context_w_lat_scanout),
	.din	({asi_ase_compare_data	[7:0],
		  asi_ase_cmpsel_in	[1:0],
		  asi_ecc_cmpsel_in	       ,
		  asi_sel_mra_0_in	       ,
		  lsu_context_b		[12:0]}),
	.dout	({compare_data		[7:0],
		  mbist_cmpsel		[1:0],
		  ecc_cmpsel		       ,
		  sel_mra_0		       ,
		  ase_lsu_context_w	[12:0]}),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_ase_dp_msff_macro__left_13__stack_58c__width_35 lsu_va_w_lat    (
	.scan_in(lsu_va_w_lat_scanin),
	.scan_out(lsu_va_w_lat_scanout),
	.din	({lsu_va_b		[47:13]}),
	.dout	({lsu_va_w		[47:13]}),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign ase_lsu_va_w[47:13] =
	lsu_va_w[47:13];


//////////////////////////////////////////////////////////////////////
//
// Mux the two thread groups together
//
mmu_ase_dp_mux_macro__mux_aope__ports_2__stack_58c__width_24 mra_rd_data_1_mux     (
	.din0	(asd0_rd_data		[81:58]),
	.din1	(asd1_rd_data		[81:58]),
	.sel0	(sel_mra_0			),
	.dout	(mra_rd_data		[81:58])
);

mmu_ase_dp_mux_macro__mux_aope__ports_2__stack_58c__width_58 mra_rd_data_0_mux     (
	.din0	(asd0_rd_data		[57:0]	),
	.din1	(asd1_rd_data		[57:0]	),
	.sel0	(sel_mra_0			),
	.dout	(mra_rd_data		[57:0]	)
);




//////////////////////////////////////////////////////////////////////
//
// Extract and format read data
//

mmu_ase_dp_mux_macro__mux_aonpe__ports_4__width_64 mra_rd_mux    (
	.din0	({mra_rd_data		[77:75],   // TSB config	63:61
		  {21 {1'b0}}		       ,
		  mra_rd_data		[74:48],   // TSB config	39:13
		  { 4 {1'b0}}		       ,
		  mra_rd_data		[47:39]}), // TSB config	08:00
	.din1	({mra_rd_data		[38:36],   // TSB config	63:61
		  {21 {1'b0}}		       ,
		  mra_rd_data		[35:9],   // TSB config	39:13
		  { 4 {1'b0}}		       ,
		  mra_rd_data		[8:0]}), // TSB config	08:00
	.din2	({mra_rd_data		[81   ],   // Real range	63
		  { 9 {1'b0}}		       ,
		  mra_rd_data		[80:27]}), // Real range 	53:00
	.din3	({{24 {1'b0}}		       ,
		  mra_rd_data		[26:0],   // Physical offset	39:13
		  {13 {1'b0}}		       }),
	.sel0	(asi_rd_tsb_cfg_0_2		),
	.sel1	(asi_rd_tsb_cfg_1_3		),
	.sel2	(asi_rd_real_range		),
	.sel3	(asi_rd_physical_offset		),
	.dout	(ase_mra_rd_data	[63:0]	)
);



//////////////////////////////////////////////////////////////////////
//
// Modify data for write
//

assign wr_data_unused[60:54] =
	asi_mra_wr_data[60:54];

mmu_ase_dp_msff_macro__mux_aope__ports_4__stack_58c__width_24 wr_1_mux     (
	.scan_in(wr_1_mux_scanin),
	.scan_out(wr_1_mux_scanout),
	.din0	({asi_mbist_wdata	[1:0],   //			81:80
		  asi_mbist_wdata	[7:0],   //			79:72
		  asi_mbist_wdata	[7:0],   //			71:64
		  asi_mbist_wdata	[7:2]}), //			63:58
	.din1	({{4 {1'b0}}		       ,   //			81:78
		  asi_mra_wr_data	[63:61],   // TSB config 0,2	77:75
		  asi_mra_wr_data	[39:29],   // TSB config 0,2	74:64
		  asi_mra_wr_data	[28:23]}), // TSB config 0,2 	63:58
	.din2	({asi_mra_wr_data	[63   ],   // Real range 	81
		  asi_mra_wr_data	[53:31]}), // Real range	80:58
	.din3	(mra_rd_data		[81:58]	),
	.sel0	(asi_mbist_run			),
	.sel1	(asi_rd_tsb_cfg_0_2		),
	.sel2	(asi_rd_real_range		),
	.en	(asi_mra_wr_en_next		),
	.dout	(ase_mra_wr_data	[81:58]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_ase_dp_buff_macro__minbuff_1__stack_58c__width_24 wr_1_minbuf    (
    .din (ase_mra_wr_data[81:58]),
    .dout (ase_mra_wr_data_minbuf[81:58])
);
                                                         

mmu_ase_dp_msff_macro__mux_aope__ports_5__stack_58c__width_58 wr_0_mux     (
	.scan_in(wr_0_mux_scanin),
	.scan_out(wr_0_mux_scanout),
	.din0	({asi_mbist_wdata	[1:0],
		  {7 {asi_mbist_wdata	[7:0]}}}),
	.din1	({asi_mra_wr_data	[22:13],   // TSB config 0,2 	57:48
		  asi_mra_wr_data	[8:0],   // TSB config 0,2	47:39
		  mra_rd_data		[38:0]}), // TSB config 1,3	
	.din2	({mra_rd_data		[57:39],   // TSB config 0,2
		  asi_mra_wr_data	[63:61],   // TSB config 1,3	38:36
		  asi_mra_wr_data	[39:13],   // TSB config 1,3	35:09
		  asi_mra_wr_data	[8:0]}), // TSB config 1,3	08:00
	.din3	({asi_mra_wr_data	[30:0],   // Real range 	57:27
		  mra_rd_data		[26:0]}), // Physical offset
	.din4	({mra_rd_data		[57:27],   // Real range
		  asi_mra_wr_data	[39:13]}), // Physical offset	26:00
	.sel0	(asi_mbist_run			),
	.sel1	(asi_rd_tsb_cfg_0_2		),
	.sel2	(asi_rd_tsb_cfg_1_3		),
	.sel3	(asi_rd_real_range		),
	.en	(asi_mra_wr_en_next		),
	.dout	(ase_mra_wr_data	[57:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

mmu_ase_dp_buff_macro__minbuff_1__stack_58c__width_58 wr_0_minbuf    (
    .din (ase_mra_wr_data[57:0]),
    .dout (ase_mra_wr_data_minbuf[57:0])
);
                                                         


//////////////////////////////////////////////////////////////////////////////
//
// Merge ITLB reload buses together
//

mmu_ase_dp_nand_macro__ports_2__stack_58c__width_48 itte_tag_data_nand    (
	.din0	(asd0_itte_tag_data_	[47:0]	),
	.din1	(asd1_itte_tag_data_	[47:0]	),
	.dout	(mmu_itte_tag_data	[47:0]	)
);



//////////////////////////////////////////////////////////////////////////////
//
// MBIST muxing
//

mmu_ase_dp_mux_macro__mux_aope__ports_2__stack_58c__width_2 mbist_ecc_mux     (
	.din0	(mel0_parity		[1:0]	),
	.din1	(mel1_parity		[1:0]	),
	.sel0	(ecc_cmpsel			),
	.dout	(mra_parity		[1:0]	)
);

mmu_ase_dp_buff_macro__dbuff_32x__width_1 tst_mux_rep0   (
	.din	(tcu_muxtest			),
	.dout	(tcu_muxtest_rep0		)
);

mmu_ase_dp_mux_macro__mux_pgdec__ports_8__stack_58c__width_32 mbist_mux     (
	.din0	(asd1_rd_data		[31:0]	),
	.din1	(asd1_rd_data		[63:32]	),
	.din2	({compare_data		[7:0],
		  compare_data		[7:2],
		  asd1_rd_data		[81:64]}),
	.din3	({{3 {compare_data	[7:0]}},
		  compare_data		[7:4],
		  mra_parity		[1:0],
		  compare_data		[1:0]}),
	.din4	(asd0_rd_data		[31:0]	),
	.din5	(asd0_rd_data		[63:32]	),
	.din6	({compare_data		[7:0],
		  compare_data		[7:2],
		  asd0_rd_data		[81:64]}),
	.din7	({{3 {compare_data	[7:0]}},
		  compare_data		[7:4],
		  mra_parity		[1:0],
		  compare_data		[1:0]}),
	.sel	({sel_mra_0		       ,
		  mbist_cmpsel		[1:0]}),
	.muxtst	(tcu_muxtest_rep0		),
	.dout	(ase_mbd_mbist_data	[31:0]	),
  .test(test)
);



// fixscan start:
assign lsu_context_w_lat_scanin  = scan_in                  ;
assign lsu_va_w_lat_scanin       = lsu_context_w_lat_scanout;
assign wr_1_mux_scanin           = lsu_va_w_lat_scanout     ;
assign wr_0_mux_scanin           = wr_1_mux_scanout         ;
assign scan_out                  = wr_0_mux_scanout         ;
// fixscan end:
endmodule




//
//   buff macro
//
//





module mmu_ase_dp_buff_macro__width_4 (
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

module mmu_ase_dp_msff_macro__stack_58c__width_25 (
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
wire [23:0] so;

  input [24:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [24:0] dout;


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
dff #(25)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[24:0]),
.si({scan_in,so[23:0]}),
.so({so[23:0],scan_out}),
.q(dout[24:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module mmu_ase_dp_msff_macro__left_13__stack_58c__width_35 (
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
wire [33:0] so;

  input [34:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [34:0] dout;


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
dff #(35)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[34:0]),
.si({scan_in,so[33:0]}),
.so({so[33:0],scan_out}),
.q(dout[34:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_ase_dp_mux_macro__mux_aope__ports_2__stack_58c__width_24 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [23:0] din0;
  input [23:0] din1;
  input sel0;
  output [23:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(24)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[23:0]),
  .in1(din1[23:0]),
.dout(dout[23:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_ase_dp_mux_macro__mux_aope__ports_2__stack_58c__width_58 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [57:0] din0;
  input [57:0] din1;
  input sel0;
  output [57:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(58)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[57:0]),
  .in1(din1[57:0]),
.dout(dout[57:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_ase_dp_mux_macro__mux_aonpe__ports_4__width_64 (
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

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  input [63:0] din3;
  input sel3;
  output [63:0] dout;





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
mux4s #(64)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
.dout(dout[63:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module mmu_ase_dp_msff_macro__mux_aope__ports_4__stack_58c__width_24 (
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
wire [23:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [22:0] so;

  input [23:0] din0;
  input [23:0] din1;
  input [23:0] din2;
  input [23:0] din3;
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



  output [23:0] dout;


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

mux4s #(24)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[23:0]),
  .in1(din1[23:0]),
  .in2(din2[23:0]),
  .in3(din3[23:0]),
.dout(muxout[23:0])
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
dff #(24)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[23:0]),
.si({scan_in,so[22:0]}),
.so({so[22:0],scan_out}),
.q(dout[23:0])
);




















endmodule









//
//   buff macro
//
//





module mmu_ase_dp_buff_macro__minbuff_1__stack_58c__width_24 (
  din, 
  dout);
  input [23:0] din;
  output [23:0] dout;






buff #(24)  d0_0 (
.in(din[23:0]),
.out(dout[23:0])
);








endmodule









// any PARAMS parms go into naming of macro

module mmu_ase_dp_msff_macro__mux_aope__ports_5__stack_58c__width_58 (
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
wire [57:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [56:0] so;

  input [57:0] din0;
  input [57:0] din1;
  input [57:0] din2;
  input [57:0] din3;
  input [57:0] din4;
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



  output [57:0] dout;


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

mux5s #(58)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .in0(din0[57:0]),
  .in1(din1[57:0]),
  .in2(din2[57:0]),
  .in3(din3[57:0]),
  .in4(din4[57:0]),
.dout(muxout[57:0])
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
dff #(58)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[57:0]),
.si({scan_in,so[56:0]}),
.so({so[56:0],scan_out}),
.q(dout[57:0])
);




















endmodule









//
//   buff macro
//
//





module mmu_ase_dp_buff_macro__minbuff_1__stack_58c__width_58 (
  din, 
  dout);
  input [57:0] din;
  output [57:0] dout;






buff #(58)  d0_0 (
.in(din[57:0]),
.out(dout[57:0])
);








endmodule





//
//   nand macro for ports = 2,3,4
//
//





module mmu_ase_dp_nand_macro__ports_2__stack_58c__width_48 (
  din0, 
  din1, 
  dout);
  input [47:0] din0;
  input [47:0] din1;
  output [47:0] dout;






nand2 #(48)  d0_0 (
.in0(din0[47:0]),
.in1(din1[47:0]),
.out(dout[47:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mmu_ase_dp_mux_macro__mux_aope__ports_2__stack_58c__width_2 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [1:0] din0;
  input [1:0] din1;
  input sel0;
  output [1:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(2)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[1:0]),
  .in1(din1[1:0]),
.dout(dout[1:0])
);









  



endmodule


//
//   buff macro
//
//





module mmu_ase_dp_buff_macro__dbuff_32x__width_1 (
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

module mmu_ase_dp_mux_macro__mux_pgdec__ports_8__stack_58c__width_32 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [31:0] din0;
  input [31:0] din1;
  input [31:0] din2;
  input [31:0] din3;
  input [31:0] din4;
  input [31:0] din5;
  input [31:0] din6;
  input [31:0] din7;
  input [2:0] sel;
  input muxtst;
  input test;
  output [31:0] dout;





cl_dp1_pdec8_8x  c0_0 (
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
 .psel7(psel7),
  .test(test)
);

mux8 #(32)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
  .in3(din3[31:0]),
  .in4(din4[31:0]),
  .in5(din5[31:0]),
  .in6(din6[31:0]),
  .in7(din7[31:0]),
.dout(dout[31:0]),
  .muxtst(muxtst)
);









  



endmodule

