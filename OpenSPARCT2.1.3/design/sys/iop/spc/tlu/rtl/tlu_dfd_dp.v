// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_dfd_dp.v
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
module tlu_dfd_dp (
  l2clk, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  scan_in, 
  tcu_scan_en_wmr, 
  spc_aclk_wmr, 
  wmr_scan_in, 
  lsu_va_b, 
  pct0_target_b, 
  pct1_target_b, 
  tic_exu_address0_b, 
  tic_exu_address1_b, 
  fls0_dfd_lsu_inst_b, 
  fls1_dfd_lsu_inst_b, 
  tel0_syndrome, 
  tel1_syndrome, 
  tlu_tsa_index_0, 
  tlu_tsa_index_1, 
  ras_dsfar_0, 
  ras_dsfar_1, 
  ras_dsfar_2, 
  ras_dsfar_3, 
  ras_dsfar_4, 
  ras_dsfar_5, 
  ras_dsfar_6, 
  ras_dsfar_7, 
  ras_dsfar_sel_lsu_va, 
  ras_dsfar_sel_ras, 
  ras_dsfar_sel_tsa, 
  ras_desr_et_0, 
  ras_desr_et_1, 
  ras_desr_et_2, 
  ras_desr_et_3, 
  ras_desr_et_4, 
  ras_desr_et_5, 
  ras_desr_et_6, 
  ras_desr_et_7, 
  ras_desr_ea_0, 
  ras_desr_ea_1, 
  ras_desr_ea_2, 
  ras_desr_ea_3, 
  ras_desr_ea_4, 
  ras_desr_ea_5, 
  ras_desr_ea_6, 
  ras_desr_ea_7, 
  ras_desr_me_0, 
  ras_desr_me_1, 
  ras_desr_me_2, 
  ras_desr_me_3, 
  ras_desr_me_4, 
  ras_desr_me_5, 
  ras_desr_me_6, 
  ras_desr_me_7, 
  ras_desr_en, 
  ras_write_desr_1st, 
  ras_write_desr_2nd, 
  ras_fesr_et_0, 
  ras_fesr_et_1, 
  ras_fesr_et_2, 
  ras_fesr_et_3, 
  ras_fesr_et_4, 
  ras_fesr_et_5, 
  ras_fesr_et_6, 
  ras_fesr_et_7, 
  ras_fesr_ea_0, 
  ras_fesr_ea_1, 
  ras_fesr_ea_2, 
  ras_fesr_ea_3, 
  ras_fesr_ea_4, 
  ras_fesr_ea_5, 
  ras_fesr_ea_6, 
  ras_fesr_ea_7, 
  ras_fesr_en, 
  ras_write_fesr, 
  ras_fesr_priv, 
  ras_update_priv, 
  ras_asi_data, 
  ras_rd_dsfar, 
  ras_rd_desr, 
  ras_rd_fesr, 
  asi_wr_dsfar, 
  asi_wr_data, 
  scan_out, 
  wmr_scan_out, 
  dfd_desr_f, 
  dfd_desr_s, 
  dfd_fls_desr_f, 
  dfd_fls_desr_s, 
  dfd_fesr_f, 
  dfd_fesr_priv_0, 
  dfd_fesr_priv_1, 
  dfd_fesr_priv_2, 
  dfd_fesr_priv_3, 
  dfd_fesr_priv_4, 
  dfd_fesr_priv_5, 
  dfd_fesr_priv_6, 
  dfd_fesr_priv_7, 
  dfd_asi_data, 
  dfd_asi_desr);
wire clk;
wire stop;
wire en;
wire pce_ov;
wire se;
wire siclk;
wire soclk;
wire [54:48] wr_data_unused;
wire [61:0] wr_data;
wire lsu_br_va_0_lat_scanin;
wire lsu_br_va_0_lat_scanout;
wire [47:0] lsu_br_va_0_w;
wire lsu_br_va_1_lat_scanin;
wire lsu_br_va_1_lat_scanout;
wire [47:0] lsu_br_va_1_w;
wire va_0_w1_lat_scanin;
wire va_0_w1_lat_scanout;
wire [47:0] va_0_w1;
wire va_1_w1_lat_scanin;
wire va_1_w1_lat_scanout;
wire [47:0] va_1_w1;
wire dsfar_0_lat_wmr_scanin;
wire dsfar_0_lat_wmr_scanout;
wire [47:0] dsfar_0;
wire dsfar_1_lat_wmr_scanin;
wire dsfar_1_lat_wmr_scanout;
wire [47:0] dsfar_1;
wire dsfar_2_lat_wmr_scanin;
wire dsfar_2_lat_wmr_scanout;
wire [47:0] dsfar_2;
wire dsfar_3_lat_wmr_scanin;
wire dsfar_3_lat_wmr_scanout;
wire [47:0] dsfar_3;
wire dsfar_4_lat_wmr_scanin;
wire dsfar_4_lat_wmr_scanout;
wire [47:0] dsfar_4;
wire dsfar_5_lat_wmr_scanin;
wire dsfar_5_lat_wmr_scanout;
wire [47:0] dsfar_5;
wire dsfar_6_lat_wmr_scanin;
wire dsfar_6_lat_wmr_scanout;
wire [47:0] dsfar_6;
wire dsfar_7_lat_wmr_scanin;
wire dsfar_7_lat_wmr_scanout;
wire [47:0] dsfar_7;
wire desr_0_lat_wmr_scanin;
wire desr_0_lat_wmr_scanout;
wire [63:0] desr_0;
wire desr_1_lat_wmr_scanin;
wire desr_1_lat_wmr_scanout;
wire [63:0] desr_1;
wire desr_2_lat_wmr_scanin;
wire desr_2_lat_wmr_scanout;
wire [63:0] desr_2;
wire desr_3_lat_wmr_scanin;
wire desr_3_lat_wmr_scanout;
wire [63:0] desr_3;
wire desr_4_lat_wmr_scanin;
wire desr_4_lat_wmr_scanout;
wire [63:0] desr_4;
wire desr_5_lat_wmr_scanin;
wire desr_5_lat_wmr_scanout;
wire [63:0] desr_5;
wire desr_6_lat_wmr_scanin;
wire desr_6_lat_wmr_scanout;
wire [63:0] desr_6;
wire desr_7_lat_wmr_scanin;
wire desr_7_lat_wmr_scanout;
wire [63:0] desr_7;
wire fesr_0_lat_wmr_scanin;
wire fesr_0_lat_wmr_scanout;
wire [61:55] fesr_0;
wire fesr_1_lat_wmr_scanin;
wire fesr_1_lat_wmr_scanout;
wire [61:55] fesr_1;
wire fesr_2_lat_wmr_scanin;
wire fesr_2_lat_wmr_scanout;
wire [61:55] fesr_2;
wire fesr_3_lat_wmr_scanin;
wire fesr_3_lat_wmr_scanout;
wire [61:55] fesr_3;
wire fesr_4_lat_wmr_scanin;
wire fesr_4_lat_wmr_scanout;
wire [61:55] fesr_4;
wire fesr_5_lat_wmr_scanin;
wire fesr_5_lat_wmr_scanout;
wire [61:55] fesr_5;
wire fesr_6_lat_wmr_scanin;
wire fesr_6_lat_wmr_scanout;
wire [61:55] fesr_6;
wire fesr_7_lat_wmr_scanin;
wire fesr_7_lat_wmr_scanout;
wire [61:55] fesr_7;
wire [47:0] dsfar;
wire [18:0] desr;
wire [6:0] fesr;



input		l2clk;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;
input		scan_in;

input		tcu_scan_en_wmr;
input 		spc_aclk_wmr;		// Warm reset (non)scan
input		wmr_scan_in;

// DSFARs
input	[47:0]	lsu_va_b;
input	[47:2] pct0_target_b;
input	[47:2] pct1_target_b;
input	[1:0]	tic_exu_address0_b;
input	[1:0]	tic_exu_address1_b;
input		fls0_dfd_lsu_inst_b;
input		fls1_dfd_lsu_inst_b;
input	[15:0]	tel0_syndrome;
input	[15:0]	tel1_syndrome;
input	[2:0]	tlu_tsa_index_0;
input	[2:0]	tlu_tsa_index_1;
input	[19:0]	ras_dsfar_0;
input	[19:0]	ras_dsfar_1;
input	[19:0]	ras_dsfar_2;
input	[19:0]	ras_dsfar_3;
input	[19:0]	ras_dsfar_4;
input	[19:0]	ras_dsfar_5;
input	[19:0]	ras_dsfar_6;
input	[19:0]	ras_dsfar_7;
input	[7:0] ras_dsfar_sel_lsu_va;
input	[7:0] ras_dsfar_sel_ras;
input	[7:0] ras_dsfar_sel_tsa;

// DESRs
input	[61:56]	ras_desr_et_0;
input	[61:56]	ras_desr_et_1;
input	[61:56]	ras_desr_et_2;
input	[61:56]	ras_desr_et_3;
input	[61:56]	ras_desr_et_4;
input	[61:56]	ras_desr_et_5;
input	[61:56]	ras_desr_et_6;
input	[61:56]	ras_desr_et_7;
input	[10:0]	ras_desr_ea_0;
input	[10:0]	ras_desr_ea_1;
input	[10:0]	ras_desr_ea_2;
input	[10:0]	ras_desr_ea_3;
input	[10:0]	ras_desr_ea_4;
input	[10:0]	ras_desr_ea_5;
input	[10:0]	ras_desr_ea_6;
input	[10:0]	ras_desr_ea_7;
input		ras_desr_me_0;
input		ras_desr_me_1;
input		ras_desr_me_2;
input		ras_desr_me_3;
input		ras_desr_me_4;
input		ras_desr_me_5;
input		ras_desr_me_6;
input		ras_desr_me_7;
input	[7:0]	ras_desr_en;
input	[7:0]	ras_write_desr_1st;
input	[7:0]	ras_write_desr_2nd;

// FESRs
input	[61:60]	ras_fesr_et_0;
input	[61:60]	ras_fesr_et_1;
input	[61:60]	ras_fesr_et_2;
input	[61:60]	ras_fesr_et_3;
input	[61:60]	ras_fesr_et_4;
input	[61:60]	ras_fesr_et_5;
input	[61:60]	ras_fesr_et_6;
input	[61:60]	ras_fesr_et_7;
input	[59:55]	ras_fesr_ea_0;
input	[59:55]	ras_fesr_ea_1;
input	[59:55]	ras_fesr_ea_2;
input	[59:55]	ras_fesr_ea_3;
input	[59:55]	ras_fesr_ea_4;
input	[59:55]	ras_fesr_ea_5;
input	[59:55]	ras_fesr_ea_6;
input	[59:55]	ras_fesr_ea_7;
input	[7:0]	ras_fesr_en;
input	[7:0]	ras_write_fesr;
input	[59:58] ras_fesr_priv;
input	[7:0] ras_update_priv;

input	[3:0] ras_asi_data;
input	[7:0]	ras_rd_dsfar;
input	[7:0]	ras_rd_desr;
input	[7:0]	ras_rd_fesr;


input	[7:0]	asi_wr_dsfar;
input	[61:0]	asi_wr_data;


output		scan_out;

output		wmr_scan_out;		// Warm reset (non)scan

output	[7:0]	dfd_desr_f;
output	[7:0]	dfd_desr_s;
output	[7:0]	dfd_fls_desr_f;
output	[7:0]	dfd_fls_desr_s;
output	[7:0]	dfd_fesr_f;
output	[1:0]	dfd_fesr_priv_0;
output	[1:0]	dfd_fesr_priv_1;
output	[1:0]	dfd_fesr_priv_2;
output	[1:0]	dfd_fesr_priv_3;
output	[1:0]	dfd_fesr_priv_4;
output	[1:0]	dfd_fesr_priv_5;
output	[1:0]	dfd_fesr_priv_6;
output	[1:0]	dfd_fesr_priv_7;

output	[47:0]	dfd_asi_data;
output	[18:0]	dfd_asi_desr;




//////////////////////////////////////////////////////////////////////

assign clk	= l2clk;
assign stop	= 1'b0;
assign en	= 1'b1;

tlu_dfd_dp_buff_macro__width_4 clk_control_buf  (
	.din	({tcu_pce_ov		       ,
		  tcu_scan_en		       ,
		  spc_aclk		       ,
		  spc_bclk		       }),
	.dout	({pce_ov		       ,
		  se			       ,
		  siclk			       ,
		  soclk			       })
);

assign wr_data_unused[54:48] =
       asi_wr_data[54:48];

assign wr_data[61:55] =
       asi_wr_data[61:55];
assign wr_data[47:0] =
       asi_wr_data[47:0];


//////////////////////////////////////////////////////////////////////
//
// DSFARs
//

// First mux the LSU and EXU addresses together and flop for next cycle
tlu_dfd_dp_msff_macro__mux_aope__ports_2__stack_48c__width_48 lsu_br_va_0_lat     (
	.scan_in(lsu_br_va_0_lat_scanin),
	.scan_out(lsu_br_va_0_lat_scanout),
	.din0 	(lsu_va_b		[47:0]	),
	.din1 	({pct0_target_b		[47:2],
		  tic_exu_address0_b	[1:0]}),
	.sel0 	(fls0_dfd_lsu_inst_b		),
	.en 	(1'b1				),
	.dout	(lsu_br_va_0_w		[47:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_dfd_dp_msff_macro__mux_aope__ports_2__stack_48c__width_48 lsu_br_va_1_lat     (
	.scan_in(lsu_br_va_1_lat_scanin),
	.scan_out(lsu_br_va_1_lat_scanout),
	.din0 	(lsu_va_b		[47:0]	),
	.din1 	({pct1_target_b		[47:2],
		  tic_exu_address1_b	[1:0]}),
	.sel0 	(fls1_dfd_lsu_inst_b		),
	.en 	(1'b1				),
	.dout	(lsu_br_va_1_w		[47:0]	),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_dfd_dp_msff_macro__stack_48c__width_48 va_0_w1_lat   (
	.scan_in(va_0_w1_lat_scanin),
	.scan_out(va_0_w1_lat_scanout),
	.din 	(lsu_br_va_0_w		[47:0]	),
	.dout 	(va_0_w1		[47:0]	),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_dfd_dp_msff_macro__stack_48c__width_48 va_1_w1_lat   (
	.scan_in(va_1_w1_lat_scanin),
	.scan_out(va_1_w1_lat_scanout),
	.din 	(lsu_br_va_1_w		[47:0]	),
	.dout 	(va_1_w1		[47:0]	),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);


tlu_dfd_dp_msff_macro__mux_aope__ports_5__stack_48c__width_48 dsfar_0_lat     ( 
	.scan_in(dsfar_0_lat_wmr_scanin),
	.scan_out(dsfar_0_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({{29 {1'b0}}		       ,	
		  tel0_syndrome		[15:0],	
		  tlu_tsa_index_0	[2:0]}),
	.din1	({{28 {1'b0}}		       ,	
		  ras_dsfar_0		[19:0]}),
	.din2	(va_0_w1		[47:0]	),
	.din3	(wr_data		[47:0]	),
	.din4	(dsfar_0		[47:0]	),
	.sel0	(ras_dsfar_sel_tsa	[0   ]	),
	.sel1	(ras_dsfar_sel_ras	[0   ]	),
	.sel2	(ras_dsfar_sel_lsu_va	[0   ]	),
	.sel3	(asi_wr_dsfar		[0   ]	),
	.dout	(dsfar_0		[47:0]	),
  .clk(clk),
  .en(en),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_dfd_dp_msff_macro__mux_aope__ports_5__stack_48c__width_48 dsfar_1_lat     ( 
	.scan_in(dsfar_1_lat_wmr_scanin),
	.scan_out(dsfar_1_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({{29 {1'b0}}		       ,	
		  tel0_syndrome		[15:0],	
		  tlu_tsa_index_0	[2:0]}),
	.din1	({{28 {1'b0}}		       ,	
		  ras_dsfar_1		[19:0]}),
	.din2	(va_0_w1		[47:0]	),
	.din3	(wr_data		[47:0]	),
	.din4	(dsfar_1		[47:0]	),
	.sel0	(ras_dsfar_sel_tsa	[1   ]	),
	.sel1	(ras_dsfar_sel_ras	[1   ]	),
	.sel2	(ras_dsfar_sel_lsu_va	[1   ]	),
	.sel3	(asi_wr_dsfar		[1   ]	),
	.dout	(dsfar_1		[47:0]	),
  .clk(clk),
  .en(en),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_dfd_dp_msff_macro__mux_aope__ports_5__stack_48c__width_48 dsfar_2_lat     ( 
	.scan_in(dsfar_2_lat_wmr_scanin),
	.scan_out(dsfar_2_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({{29 {1'b0}}		       ,	
		  tel0_syndrome		[15:0],	
		  tlu_tsa_index_0	[2:0]}),
	.din1	({{28 {1'b0}}		       ,	
		  ras_dsfar_2		[19:0]}),
	.din2	(va_0_w1		[47:0]	),
	.din3	(wr_data		[47:0]	),
	.din4	(dsfar_2		[47:0]	),
	.sel0	(ras_dsfar_sel_tsa	[2   ]	),
	.sel1	(ras_dsfar_sel_ras	[2   ]	),
	.sel2	(ras_dsfar_sel_lsu_va	[2   ]	),
	.sel3	(asi_wr_dsfar		[2   ]	),
	.dout	(dsfar_2		[47:0]	),
  .clk(clk),
  .en(en),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_dfd_dp_msff_macro__mux_aope__ports_5__stack_48c__width_48 dsfar_3_lat     ( 
	.scan_in(dsfar_3_lat_wmr_scanin),
	.scan_out(dsfar_3_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({{29 {1'b0}}		       ,	
		  tel0_syndrome		[15:0],	
		  tlu_tsa_index_0	[2:0]}),
	.din1	({{28 {1'b0}}		       ,	
		  ras_dsfar_3 		[19:0]}),
	.din2	(va_0_w1		[47:0]	),
	.din3	(wr_data		[47:0]	),
	.din4	(dsfar_3		[47:0]	),
	.sel0	(ras_dsfar_sel_tsa	[3   ]	),
	.sel1	(ras_dsfar_sel_ras	[3   ]	),
	.sel2	(ras_dsfar_sel_lsu_va	[3   ]	),
	.sel3	(asi_wr_dsfar		[3   ]	),
	.dout	(dsfar_3		[47:0]	),
  .clk(clk),
  .en(en),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_dfd_dp_msff_macro__mux_aope__ports_5__stack_48c__width_48 dsfar_4_lat     ( 
	.scan_in(dsfar_4_lat_wmr_scanin),
	.scan_out(dsfar_4_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({{29 {1'b0}}		       ,	
		  tel1_syndrome		[15:0],	
		  tlu_tsa_index_1	[2:0]}),
	.din1	({{28 {1'b0}}		       ,	
		  ras_dsfar_4		[19:0]}),
	.din2	(va_1_w1		[47:0]	),
	.din3	(wr_data		[47:0]	),
	.din4	(dsfar_4		[47:0]	),
	.sel0	(ras_dsfar_sel_tsa	[4   ]	),
	.sel1	(ras_dsfar_sel_ras	[4   ]	),
	.sel2	(ras_dsfar_sel_lsu_va	[4   ]	),
	.sel3	(asi_wr_dsfar		[4   ]	),
	.dout	(dsfar_4		[47:0]	),
  .clk(clk),
  .en(en),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_dfd_dp_msff_macro__mux_aope__ports_5__stack_48c__width_48 dsfar_5_lat     ( 
	.scan_in(dsfar_5_lat_wmr_scanin),
	.scan_out(dsfar_5_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({{29 {1'b0}}		       ,	
		  tel1_syndrome		[15:0],	
		  tlu_tsa_index_1	[2:0]}),
	.din1	({{28 {1'b0}}		       ,	
		  ras_dsfar_5		[19:0]}),
	.din2	(va_1_w1		[47:0]	),
	.din3	(wr_data		[47:0]	),
	.din4	(dsfar_5		[47:0]	),
	.sel0	(ras_dsfar_sel_tsa	[5   ]	),
	.sel1	(ras_dsfar_sel_ras	[5   ]	),
	.sel2	(ras_dsfar_sel_lsu_va	[5   ]	),
	.sel3	(asi_wr_dsfar		[5   ]	),
	.dout	(dsfar_5		[47:0]	),
  .clk(clk),
  .en(en),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_dfd_dp_msff_macro__mux_aope__ports_5__stack_48c__width_48 dsfar_6_lat     ( 
	.scan_in(dsfar_6_lat_wmr_scanin),
	.scan_out(dsfar_6_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({{29 {1'b0}}		       ,	
		  tel1_syndrome		[15:0],	
		  tlu_tsa_index_1	[2:0]}),
	.din1	({{28 {1'b0}}		       ,	
		  ras_dsfar_6		[19:0]}),
	.din2	(va_1_w1		[47:0]	),
	.din3	(wr_data		[47:0]	),
	.din4	(dsfar_6		[47:0]	),
	.sel0	(ras_dsfar_sel_tsa	[6   ]	),
	.sel1	(ras_dsfar_sel_ras	[6   ]	),
	.sel2	(ras_dsfar_sel_lsu_va	[6   ]	),
	.sel3	(asi_wr_dsfar		[6   ]	),
	.dout	(dsfar_6		[47:0]	),
  .clk(clk),
  .en(en),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_dfd_dp_msff_macro__mux_aope__ports_5__stack_48c__width_48 dsfar_7_lat     ( 
	.scan_in(dsfar_7_lat_wmr_scanin),
	.scan_out(dsfar_7_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({{29 {1'b0}}		       ,	
		  tel1_syndrome		[15:0],	
		  tlu_tsa_index_1	[2:0]}),
	.din1	({{28 {1'b0}}		       ,	
		  ras_dsfar_7		[19:0]}),
	.din2	(va_1_w1		[47:0]	),
	.din3	(wr_data		[47:0]	),
	.din4	(dsfar_7		[47:0]	),
	.sel0	(ras_dsfar_sel_tsa	[7   ]	),
	.sel1	(ras_dsfar_sel_ras	[7   ]	),
	.sel2	(ras_dsfar_sel_lsu_va	[7   ]	),
	.sel3	(asi_wr_dsfar		[7   ]	),
	.dout	(dsfar_7		[47:0]	),
  .clk(clk),
  .en(en),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);


//////////////////////////////////////////////////////////////////////
//
// DESRs
//
tlu_dfd_dp_msff_macro__mux_aope__ports_4__width_19 desr_0_lat    ( 
	.scan_in(desr_0_lat_wmr_scanin),
	.scan_out(desr_0_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({1'b1			       ,	// F
		  ras_desr_me_0		       ,	// ME
		  ras_desr_et_0		[61:56],	// S, ET
		  ras_desr_ea_0		[10:0]}),	// EA
	.din1	({1'b1			       ,	// F
		  1'b1			       ,	// ME
		  desr_0   		[61:56],	// S, ET
		  desr_0   		[10:0]}),	// EA
	.din2	({19 {1'b0}		       }),	
	.din3	({desr_0		[63   ],	// F
		  desr_0		[62   ],	// ME
		  desr_0  		[61:56],	// S, ET
		  desr_0  		[10:0]}),	// EA
	.sel0	(ras_write_desr_1st	[0   ]	),
	.sel1	(ras_write_desr_2nd	[0   ]	),
	.sel2	(ras_rd_desr		[0   ]	),
	.en 	(ras_desr_en		[0   ]	),
	.dout	({desr_0		[63   ],	// F
		  desr_0		[62   ],	// ME
		  desr_0  		[61:56],	// S, ET
		  desr_0  		[10:0]}),	// EA
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	
);

tlu_dfd_dp_msff_macro__mux_aope__ports_4__width_19 desr_1_lat    ( 
	.scan_in(desr_1_lat_wmr_scanin),
	.scan_out(desr_1_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({1'b1			       ,	// F
		  ras_desr_me_1		       ,	// ME
		  ras_desr_et_1		[61:56],	// S, ET
		  ras_desr_ea_1		[10:0]}),	// EA
	.din1	({1'b1			       ,	// F
		  1'b1			       ,	// ME
		  desr_1   		[61:56],	// S, ET
		  desr_1   		[10:0]}),	// EA
	.din2	({19 {1'b0}		       }),	
	.din3	({desr_1		[63   ],	// F
		  desr_1		[62   ],	// ME
		  desr_1  		[61:56],	// S, ET
		  desr_1  		[10:0]}),	// EA
	.sel0	(ras_write_desr_1st	[1   ]	),
	.sel1	(ras_write_desr_2nd	[1   ]	),
	.sel2	(ras_rd_desr		[1   ]	),
	.en 	(ras_desr_en		[1   ]	),
	.dout	({desr_1		[63   ],	// F
		  desr_1		[62   ],	// ME
		  desr_1  		[61:56],	// S, ET
		  desr_1  		[10:0]}),	// EA
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	
);

tlu_dfd_dp_msff_macro__mux_aope__ports_4__width_19 desr_2_lat    ( 
	.scan_in(desr_2_lat_wmr_scanin),
	.scan_out(desr_2_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({1'b1			       ,	// F
		  ras_desr_me_2		       ,	// ME
		  ras_desr_et_2		[61:56],	// S, ET
		  ras_desr_ea_2		[10:0]}),	// EA
	.din1	({1'b1			       ,	// F
		  1'b1			       ,	// ME
		  desr_2   		[61:56],	// S, ET
		  desr_2   		[10:0]}),	// EA
	.din2	({19 {1'b0}		       }),	
	.din3	({desr_2		[63   ],	// F
		  desr_2		[62   ],	// ME
		  desr_2  		[61:56],	// S, ET
		  desr_2  		[10:0]}),	// EA
	.sel0	(ras_write_desr_1st	[2   ]	),
	.sel1	(ras_write_desr_2nd	[2   ]	),
	.sel2	(ras_rd_desr		[2   ]	),
	.en 	(ras_desr_en		[2   ]	),
	.dout	({desr_2		[63   ],	// F
		  desr_2		[62   ],	// ME
		  desr_2  		[61:56],	// S, ET
		  desr_2  		[10:0]}),	// EA
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	
);

tlu_dfd_dp_msff_macro__mux_aope__ports_4__width_19 desr_3_lat    ( 
	.scan_in(desr_3_lat_wmr_scanin),
	.scan_out(desr_3_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({1'b1			       ,	// F
		  ras_desr_me_3 	       ,	// ME
		  ras_desr_et_3 	[61:56],	// S, ET
		  ras_desr_ea_3		[10:0]}),	// EA
	.din1	({1'b1			       ,	// F
		  1'b1			       ,	// ME
		  desr_3   		[61:56],	// S, ET
		  desr_3   		[10:0]}),	// EA
	.din2	({19 {1'b0}		       }),	
	.din3	({desr_3		[63   ],	// F
		  desr_3		[62   ],	// ME
		  desr_3  		[61:56],	// S, ET
		  desr_3  		[10:0]}),	// EA
	.sel0	(ras_write_desr_1st	[3   ]	),
	.sel1	(ras_write_desr_2nd	[3   ]	),
	.sel2	(ras_rd_desr		[3   ]	),
	.en 	(ras_desr_en		[3   ]	),
	.dout	({desr_3		[63   ],	// F
		  desr_3		[62   ],	// ME
		  desr_3  		[61:56],	// S, ET
		  desr_3  		[10:0]}),	// EA
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	
);

tlu_dfd_dp_msff_macro__mux_aope__ports_4__width_19 desr_4_lat    ( 
	.scan_in(desr_4_lat_wmr_scanin),
	.scan_out(desr_4_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({1'b1			       ,	// F
		  ras_desr_me_4		       ,	// ME
		  ras_desr_et_4		[61:56],	// S, ET
		  ras_desr_ea_4		[10:0]}),	// EA
	.din1	({1'b1			       ,	// F
		  1'b1			       ,	// ME
		  desr_4   		[61:56],	// S, ET
		  desr_4   		[10:0]}),	// EA
	.din2	({19 {1'b0}		       }),	
	.din3	({desr_4		[63   ],	// F
		  desr_4		[62   ],	// ME
		  desr_4  		[61:56],	// S, ET
		  desr_4  		[10:0]}),	// EA
	.sel0	(ras_write_desr_1st	[4   ]	),
	.sel1	(ras_write_desr_2nd	[4   ]	),
	.sel2	(ras_rd_desr		[4   ]	),
	.en 	(ras_desr_en		[4   ]	),
	.dout	({desr_4		[63   ],	// F
		  desr_4		[62   ],	// ME
		  desr_4  		[61:56],	// S, ET
		  desr_4  		[10:0]}),	// EA
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	
);

tlu_dfd_dp_msff_macro__mux_aope__ports_4__width_19 desr_5_lat    ( 
	.scan_in(desr_5_lat_wmr_scanin),
	.scan_out(desr_5_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({1'b1			       ,	// F
		  ras_desr_me_5		       ,	// ME
		  ras_desr_et_5		[61:56],	// S, ET
		  ras_desr_ea_5		[10:0]}),	// EA
	.din1	({1'b1			       ,	// F
		  1'b1			       ,	// ME
		  desr_5   		[61:56],	// S, ET
		  desr_5   		[10:0]}),	// EA
	.din2	({19 {1'b0}		       }),	
	.din3	({desr_5		[63   ],	// F
		  desr_5		[62   ],	// ME
		  desr_5  		[61:56],	// S, ET
		  desr_5  		[10:0]}),	// EA
	.sel0	(ras_write_desr_1st	[5   ]	),
	.sel1	(ras_write_desr_2nd	[5   ]	),
	.sel2	(ras_rd_desr		[5   ]	),
	.en 	(ras_desr_en		[5   ]	),
	.dout	({desr_5		[63   ],	// F
		  desr_5		[62   ],	// ME
		  desr_5  		[61:56],	// S, ET
		  desr_5  		[10:0]}),	// EA
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	
);

tlu_dfd_dp_msff_macro__mux_aope__ports_4__width_19 desr_6_lat    ( 
	.scan_in(desr_6_lat_wmr_scanin),
	.scan_out(desr_6_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({1'b1			       ,	// F
		  ras_desr_me_6		       ,	// ME
		  ras_desr_et_6		[61:56],	// S, ET
		  ras_desr_ea_6		[10:0]}),	// EA
	.din1	({1'b1			       ,	// F
		  1'b1			       ,	// ME
		  desr_6   		[61:56],	// S, ET
		  desr_6   		[10:0]}),	// EA
	.din2	({19 {1'b0}		       }),	
	.din3	({desr_6		[63   ],	// F
		  desr_6		[62   ],	// ME
		  desr_6  		[61:56],	// S, ET
		  desr_6  		[10:0]}),	// EA
	.sel0	(ras_write_desr_1st	[6   ]	),
	.sel1	(ras_write_desr_2nd	[6   ]	),
	.sel2	(ras_rd_desr		[6   ]	),
	.en 	(ras_desr_en		[6   ]	),
	.dout	({desr_6		[63   ],	// F
		  desr_6		[62   ],	// ME
		  desr_6  		[61:56],	// S, ET
		  desr_6  		[10:0]}),	// EA
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	
);

tlu_dfd_dp_msff_macro__mux_aope__ports_4__width_19 desr_7_lat    ( 
	.scan_in(desr_7_lat_wmr_scanin),
	.scan_out(desr_7_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({1'b1			       ,	// F
		  ras_desr_me_7		       ,	// ME
		  ras_desr_et_7		[61:56],	// S, ET
		  ras_desr_ea_7		[10:0]}),	// EA
	.din1	({1'b1			       ,	// F
		  1'b1			       ,	// ME
		  desr_7   		[61:56],	// S, ET
		  desr_7   		[10:0]}),	// EA
	.din2	({19 {1'b0}		       }),	
	.din3	({desr_7		[63   ],	// F
		  desr_7		[62   ],	// ME
		  desr_7  		[61:56],	// S, ET
		  desr_7  		[10:0]}),	// EA
	.sel0	(ras_write_desr_1st	[7   ]	),
	.sel1	(ras_write_desr_2nd	[7   ]	),
	.sel2	(ras_rd_desr		[7   ]	),
	.en 	(ras_desr_en		[7   ]	),
	.dout	({desr_7		[63   ],	// F
		  desr_7		[62   ],	// ME
		  desr_7  		[61:56],	// S, ET
		  desr_7  		[10:0]}),	// EA
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	
);

assign dfd_desr_f[7:0] =
       {desr_7[63], desr_6[63], desr_5[63], desr_4[63],
        desr_3[63], desr_2[63], desr_1[63], desr_0[63]};

assign dfd_desr_s[7:0] =
       {desr_7[61], desr_6[61], desr_5[61], desr_4[61],
        desr_3[61], desr_2[61], desr_1[61], desr_0[61]};

tlu_dfd_dp_buff_macro__rep_1__stack_none__width_8 desr_f_buf    (
	.din	({desr_7[63], desr_6[63], desr_5[63], desr_4[63],
	          desr_3[63], desr_2[63], desr_1[63], desr_0[63]}),
	.dout	(dfd_fls_desr_f		[7:0]	)
);

tlu_dfd_dp_buff_macro__rep_1__stack_none__width_8 desr_s_buf    (
	.din	({desr_7[61], desr_6[61], desr_5[61], desr_4[61],
	          desr_3[61], desr_2[61], desr_1[61], desr_0[61]}),
	.dout	(dfd_fls_desr_s		[7:0]	)
);



//////////////////////////////////////////////////////////////////////
//
// FESRs
//

tlu_dfd_dp_msff_macro__mux_aonpe__ports_3__width_7 fesr_0_lat    ( 
	.scan_in(fesr_0_lat_wmr_scanin),
	.scan_out(fesr_0_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({ras_fesr_et_0		[61:60],	// ET
		  ras_fesr_ea_0		[59:55]}),	// PL, STBI
	.din1	({fesr_0 		[61:60],	// ET
		  ras_fesr_priv		[59:58],	// PL
		  fesr_0 		[57:55]}),	// STBI
	.din2	({7 {1'b0}}			),
	.sel0	(ras_write_fesr		[0   ]	),
	.sel1	(ras_update_priv	[0   ]	),
	.sel2	(ras_rd_fesr		[0   ]	),
	.en	(ras_fesr_en		[0   ]	),
	.dout	({fesr_0		[61:60],	// ET
		  fesr_0		[59:58],	// PL
		  fesr_0		[57:55]}),	// STBI
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	
);

tlu_dfd_dp_msff_macro__mux_aonpe__ports_3__width_7 fesr_1_lat    ( 
	.scan_in(fesr_1_lat_wmr_scanin),
	.scan_out(fesr_1_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({ras_fesr_et_1		[61:60],	// ET
		  ras_fesr_ea_1		[59:55]}),	// PL, STBI
	.din1	({fesr_1 		[61:60],	// ET
		  ras_fesr_priv		[59:58],	// PL
		  fesr_1 		[57:55]}),	// STBI
	.din2	({7 {1'b0}}			),
	.sel0	(ras_write_fesr		[1   ]	),
	.sel1	(ras_update_priv	[1   ]	),
	.sel2	(ras_rd_fesr		[1   ]	),
	.en	(ras_fesr_en		[1   ]	),
	.dout	({fesr_1		[61:60],	// ET
		  fesr_1		[59:58],	// PL
		  fesr_1		[57:55]}),	// STBI
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	
);

tlu_dfd_dp_msff_macro__mux_aonpe__ports_3__width_7 fesr_2_lat    ( 
	.scan_in(fesr_2_lat_wmr_scanin),
	.scan_out(fesr_2_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({ras_fesr_et_2		[61:60],	// ET
		  ras_fesr_ea_2		[59:55]}),	// PL, STBI
	.din1	({fesr_2 		[61:60],	// ET
		  ras_fesr_priv		[59:58],	// PL
		  fesr_2 		[57:55]}),	// STBI
	.din2	({7 {1'b0}}			),
	.sel0	(ras_write_fesr		[2   ]	),
	.sel1	(ras_update_priv	[2   ]	),
	.sel2	(ras_rd_fesr		[2   ]	),
	.en	(ras_fesr_en		[2   ]	),
	.dout	({fesr_2		[61:60],	// ET
		  fesr_2		[59:58],	// PL
		  fesr_2		[57:55]}),	// STBI
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	
);

tlu_dfd_dp_msff_macro__mux_aonpe__ports_3__width_7 fesr_3_lat    ( 
	.scan_in(fesr_3_lat_wmr_scanin),
	.scan_out(fesr_3_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({ras_fesr_et_3		[61:60],	// ET
		  ras_fesr_ea_3		[59:55]}),	// PL, STBI
	.din1	({fesr_3 		[61:60],	// ET
		  ras_fesr_priv		[59:58],	// PL
		  fesr_3 		[57:55]}),	// STBI
	.din2	({7 {1'b0}}			),
	.sel0	(ras_write_fesr		[3   ]	),
	.sel1	(ras_update_priv	[3   ]	),
	.sel2	(ras_rd_fesr		[3   ]	),
	.en	(ras_fesr_en		[3   ]	),
	.dout	({fesr_3		[61:60],	// ET
		  fesr_3		[59:58],	// PL
		  fesr_3		[57:55]}),	// STBI
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	
);

tlu_dfd_dp_msff_macro__mux_aonpe__ports_3__width_7 fesr_4_lat    ( 
	.scan_in(fesr_4_lat_wmr_scanin),
	.scan_out(fesr_4_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({ras_fesr_et_4		[61:60],	// ET
		  ras_fesr_ea_4		[59:55]}),	// PL, STBI
	.din1	({fesr_4 		[61:60],	// ET
		  ras_fesr_priv		[59:58],	// PL
		  fesr_4 		[57:55]}),	// STBI
	.din2	({7 {1'b0}}			),
	.sel0	(ras_write_fesr		[4   ]	),
	.sel1	(ras_update_priv	[4   ]	),
	.sel2	(ras_rd_fesr		[4   ]	),
	.en	(ras_fesr_en		[4   ]	),
	.dout	({fesr_4		[61:60],	// ET
		  fesr_4		[59:58],	// PL
		  fesr_4		[57:55]}),	// STBI
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	
);

tlu_dfd_dp_msff_macro__mux_aonpe__ports_3__width_7 fesr_5_lat    ( 
	.scan_in(fesr_5_lat_wmr_scanin),
	.scan_out(fesr_5_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({ras_fesr_et_5		[61:60],	// ET
		  ras_fesr_ea_5		[59:55]}),	// PL, STBI
	.din1	({fesr_5 		[61:60],	// ET
		  ras_fesr_priv		[59:58],	// PL
		  fesr_5 		[57:55]}),	// STBI
	.din2	({7 {1'b0}}			),
	.sel0	(ras_write_fesr		[5   ]	),
	.sel1	(ras_update_priv	[5   ]	),
	.sel2	(ras_rd_fesr		[5   ]	),
	.en	(ras_fesr_en		[5   ]	),
	.dout	({fesr_5		[61:60],	// ET
		  fesr_5		[59:58],	// PL
		  fesr_5		[57:55]}),	// STBI
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	
);

tlu_dfd_dp_msff_macro__mux_aonpe__ports_3__width_7 fesr_6_lat    ( 
	.scan_in(fesr_6_lat_wmr_scanin),
	.scan_out(fesr_6_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({ras_fesr_et_6		[61:60],	// ET
		  ras_fesr_ea_6		[59:55]}),	// PL, STBI
	.din1	({fesr_6 		[61:60],	// ET
		  ras_fesr_priv		[59:58],	// PL
		  fesr_6 		[57:55]}),	// STBI
	.din2	({7 {1'b0}}			),
	.sel0	(ras_write_fesr		[6   ]	),
	.sel1	(ras_update_priv	[6   ]	),
	.sel2	(ras_rd_fesr		[6   ]	),
	.en	(ras_fesr_en		[6   ]	),
	.dout	({fesr_6		[61:60],	// ET
		  fesr_6		[59:58],	// PL
		  fesr_6		[57:55]}),	// STBI
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	
);

tlu_dfd_dp_msff_macro__mux_aonpe__ports_3__width_7 fesr_7_lat    ( 
	.scan_in(fesr_7_lat_wmr_scanin),
	.scan_out(fesr_7_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.se	(tcu_scan_en_wmr		),
	.din0	({ras_fesr_et_7		[61:60],	// ET
		  ras_fesr_ea_7		[59:55]}),	// PL, STBI
	.din1	({fesr_7 		[61:60],	// ET
		  ras_fesr_priv		[59:58],	// PL
		  fesr_7 		[57:55]}),	// STBI
	.din2	({7 {1'b0}}			),
	.sel0	(ras_write_fesr		[7   ]	),
	.sel1	(ras_update_priv	[7   ]	),
	.sel2	(ras_rd_fesr		[7   ]	),
	.en	(ras_fesr_en		[7   ]	),
	.dout	({fesr_7		[61:60],	// ET
		  fesr_7		[59:58],	// PL
		  fesr_7		[57:55]}),	// STBI
  .clk(clk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)	
);

tlu_dfd_dp_or_macro__ports_2__width_8 fesr_f_or   (
	.din0	({fesr_7		[61   ], 
		  fesr_6		[61   ],
		  fesr_5		[61   ], 
		  fesr_4		[61   ],
		  fesr_3		[61   ], 
		  fesr_2		[61   ], 
		  fesr_1		[61   ], 
		  fesr_0		[61   ]}),
	.din1	({fesr_7		[60   ], 
		  fesr_6		[60   ],
		  fesr_5		[60   ], 
		  fesr_4		[60   ],
		  fesr_3		[60   ], 
		  fesr_2		[60   ], 
		  fesr_1		[60   ], 
		  fesr_0		[60   ]}),
	.dout	(dfd_fesr_f		[7:0]	)
);

tlu_dfd_dp_buff_macro__dbuff_16x__width_16 fesr_priv_buf   (
	.din 	({fesr_7		[59:58],
		  fesr_6		[59:58],
		  fesr_5		[59:58],
		  fesr_4		[59:58],
		  fesr_3		[59:58],
		  fesr_2		[59:58],
		  fesr_1		[59:58],
		  fesr_0		[59:58]}),
	.dout	({dfd_fesr_priv_7	[1:0],
		  dfd_fesr_priv_6	[1:0],
		  dfd_fesr_priv_5	[1:0],
		  dfd_fesr_priv_4	[1:0],
		  dfd_fesr_priv_3	[1:0],
		  dfd_fesr_priv_2	[1:0],
		  dfd_fesr_priv_1	[1:0],
		  dfd_fesr_priv_0	[1:0]})
);


//////////////////////////////////////////////////////////////////////
//
// Mux read data
//

tlu_dfd_dp_mux_macro__mux_aonpe__ports_8__stack_48c__width_48 dsfar_mux     (
	.din0	(dsfar_0		[47:0]	),
	.din1	(dsfar_1		[47:0]	),
	.din2	(dsfar_2		[47:0]	),
	.din3	(dsfar_3		[47:0]	),
	.din4	(dsfar_4		[47:0]	),
	.din5	(dsfar_5		[47:0]	),
	.din6	(dsfar_6		[47:0]	),
	.din7	(dsfar_7		[47:0]	),
	.sel0	(ras_rd_dsfar		[0   ]	),
	.sel1	(ras_rd_dsfar		[1   ]	),
	.sel2	(ras_rd_dsfar		[2   ]	),
	.sel3	(ras_rd_dsfar		[3   ]	),
	.sel4	(ras_rd_dsfar		[4   ]	),
	.sel5	(ras_rd_dsfar		[5   ]	),
	.sel6	(ras_rd_dsfar		[6   ]	),
	.sel7	(ras_rd_dsfar		[7   ]	),
	.dout	(dsfar			[47:0]	)
);

tlu_dfd_dp_mux_macro__dmux_8x__mux_aonpe__ports_8__width_19 desr_mux     (
	.din0	({desr_0		[63   ],	// F
		  desr_0		[62   ],	// ME
		  desr_0  		[61:56],	// S, ET
		  desr_0  		[10:0]}),	// EA
	.din1	({desr_1		[63   ],	// F
		  desr_1		[62   ],	// ME
		  desr_1  		[61:56],	// S, ET
		  desr_1  		[10:0]}),	// EA
	.din2	({desr_2		[63   ],	// F
		  desr_2		[62   ],	// ME
		  desr_2  		[61:56],	// S, ET
		  desr_2  		[10:0]}),	// EA
	.din3	({desr_3		[63   ],	// F
		  desr_3		[62   ],	// ME
		  desr_3  		[61:56],	// S, ET
		  desr_3  		[10:0]}),	// EA
	.din4	({desr_4		[63   ],	// F
		  desr_4		[62   ],	// ME
		  desr_4  		[61:56],	// S, ET
		  desr_4  		[10:0]}),	// EA
	.din5	({desr_5		[63   ],	// F
		  desr_5		[62   ],	// ME
		  desr_5  		[61:56],	// S, ET
		  desr_5  		[10:0]}),	// EA
	.din6	({desr_6		[63   ],	// F
		  desr_6		[62   ],	// ME
		  desr_6  		[61:56],	// S, ET
		  desr_6  		[10:0]}),	// EA
	.din7	({desr_7		[63   ],	// F
		  desr_7		[62   ],	// ME
		  desr_7  		[61:56],	// S, ET
		  desr_7  		[10:0]}),	// EA
	.sel0	(ras_rd_desr		[0   ]	),
	.sel1	(ras_rd_desr		[1   ]	),
	.sel2	(ras_rd_desr		[2   ]	),
	.sel3	(ras_rd_desr		[3   ]	),
	.sel4	(ras_rd_desr		[4   ]	),
	.sel5	(ras_rd_desr		[5   ]	),
	.sel6	(ras_rd_desr		[6   ]	),
	.sel7	(ras_rd_desr		[7   ]	),
	.dout	(desr			[18:0]	)
);

// Next stage of muxing in tlu_asi_ctl
assign dfd_asi_desr[18:0] =
       desr[18:0];

tlu_dfd_dp_mux_macro__mux_aonpe__ports_8__width_7 fesr_mux    (
	.din0	({fesr_0		[61:60],	// ET
		  fesr_0		[59:58],	// PL
		  fesr_0		[57:55]}),	// STBI
	.din1	({fesr_1		[61:60],	// ET
		  fesr_1		[59:58],	// PL
		  fesr_1		[57:55]}),	// STBI
	.din2	({fesr_2		[61:60],	// ET
		  fesr_2		[59:58],	// PL
		  fesr_2		[57:55]}),	// STBI
	.din3	({fesr_3		[61:60],	// ET
		  fesr_3		[59:58],	// PL
		  fesr_3		[57:55]}),	// STBI
	.din4	({fesr_4		[61:60],	// ET
		  fesr_4		[59:58],	// PL
		  fesr_4		[57:55]}),	// STBI
	.din5	({fesr_5		[61:60],	// ET
		  fesr_5		[59:58],	// PL
		  fesr_5		[57:55]}),	// STBI
	.din6	({fesr_6		[61:60],	// ET
		  fesr_6		[59:58],	// PL
		  fesr_6		[57:55]}),	// STBI
	.din7	({fesr_7		[61:60],	// ET
		  fesr_7		[59:58],	// PL
		  fesr_7		[57:55]}),	// STBI
	.sel0	(ras_rd_fesr		[0   ]	),
	.sel1	(ras_rd_fesr		[1   ]	),
	.sel2	(ras_rd_fesr		[2   ]	),
	.sel3	(ras_rd_fesr		[3   ]	),
	.sel4	(ras_rd_fesr		[4   ]	),
	.sel5	(ras_rd_fesr		[5   ]	),
	.sel6	(ras_rd_fesr		[6   ]	),
	.sel7	(ras_rd_fesr		[7   ]	),
	.dout	(fesr			[6:0]	)
);


// Map of how the various registers get merged into the ASI bus in DFD
// dfd_asi_data	47:41	40:37	36:19	18:0
// dsfar	47:41	40:37	36:19	18:0
// fesr		6:0
// desr					18:0
// dsfsr/{0,isfsr}	40:37

tlu_dfd_dp_or_macro__ports_2__stack_48c__width_48 asi_data_or    (
	.din0	(dsfar		[47:0]	),
	.din1	({fesr		[6:0],
		  ras_asi_data	[3:0],
		  {18 {1'b0}}	       ,
		  {19 {1'b0}}	       }),
	.dout	(dfd_asi_data	[47:0]	)
);






// fixscan start:
assign lsu_br_va_0_lat_scanin    = scan_in                  ;
assign lsu_br_va_1_lat_scanin    = lsu_br_va_0_lat_scanout  ;
assign va_0_w1_lat_scanin        = lsu_br_va_1_lat_scanout  ;
assign va_1_w1_lat_scanin        = va_0_w1_lat_scanout      ;
assign scan_out                  = va_1_w1_lat_scanout      ;

assign dsfar_0_lat_wmr_scanin    = wmr_scan_in              ;
assign dsfar_1_lat_wmr_scanin    = dsfar_0_lat_wmr_scanout  ;
assign dsfar_2_lat_wmr_scanin    = dsfar_1_lat_wmr_scanout  ;
assign dsfar_3_lat_wmr_scanin    = dsfar_2_lat_wmr_scanout  ;
assign dsfar_4_lat_wmr_scanin    = dsfar_3_lat_wmr_scanout  ;
assign dsfar_5_lat_wmr_scanin    = dsfar_4_lat_wmr_scanout  ;
assign dsfar_6_lat_wmr_scanin    = dsfar_5_lat_wmr_scanout  ;
assign dsfar_7_lat_wmr_scanin    = dsfar_6_lat_wmr_scanout  ;
assign desr_0_lat_wmr_scanin     = dsfar_7_lat_wmr_scanout  ;
assign desr_1_lat_wmr_scanin     = desr_0_lat_wmr_scanout   ;
assign desr_2_lat_wmr_scanin     = desr_1_lat_wmr_scanout   ;
assign desr_3_lat_wmr_scanin     = desr_2_lat_wmr_scanout   ;
assign desr_4_lat_wmr_scanin     = desr_3_lat_wmr_scanout   ;
assign desr_5_lat_wmr_scanin     = desr_4_lat_wmr_scanout   ;
assign desr_6_lat_wmr_scanin     = desr_5_lat_wmr_scanout   ;
assign desr_7_lat_wmr_scanin     = desr_6_lat_wmr_scanout   ;
assign fesr_0_lat_wmr_scanin     = desr_7_lat_wmr_scanout   ;
assign fesr_1_lat_wmr_scanin     = fesr_0_lat_wmr_scanout   ;
assign fesr_2_lat_wmr_scanin     = fesr_1_lat_wmr_scanout   ;
assign fesr_3_lat_wmr_scanin     = fesr_2_lat_wmr_scanout   ;
assign fesr_4_lat_wmr_scanin     = fesr_3_lat_wmr_scanout   ;
assign fesr_5_lat_wmr_scanin     = fesr_4_lat_wmr_scanout   ;
assign fesr_6_lat_wmr_scanin     = fesr_5_lat_wmr_scanout   ;
assign fesr_7_lat_wmr_scanin     = fesr_6_lat_wmr_scanout   ;
assign wmr_scan_out              = fesr_7_lat_wmr_scanout   ;
// fixscan end:
endmodule




//
//   buff macro
//
//





module tlu_dfd_dp_buff_macro__width_4 (
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

module tlu_dfd_dp_msff_macro__mux_aope__ports_2__stack_48c__width_48 (
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
wire [47:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [46:0] so;

  input [47:0] din0;
  input [47:0] din1;
  input sel0;


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




cl_dp1_penc2_8x  c1_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(48)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[47:0]),
  .in1(din1[47:0]),
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













// any PARAMS parms go into naming of macro

module tlu_dfd_dp_msff_macro__stack_48c__width_48 (
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













// any PARAMS parms go into naming of macro

module tlu_dfd_dp_msff_macro__mux_aope__ports_5__stack_48c__width_48 (
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



  output [47:0] dout;


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

mux5s #(48)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .in0(din0[47:0]),
  .in1(din1[47:0]),
  .in2(din2[47:0]),
  .in3(din3[47:0]),
  .in4(din4[47:0]),
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













// any PARAMS parms go into naming of macro

module tlu_dfd_dp_msff_macro__mux_aope__ports_4__width_19 (
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
wire [18:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [17:0] so;

  input [18:0] din0;
  input [18:0] din1;
  input [18:0] din2;
  input [18:0] din3;
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



  output [18:0] dout;


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

mux4s #(19)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[18:0]),
  .in1(din1[18:0]),
  .in2(din2[18:0]),
  .in3(din3[18:0]),
.dout(muxout[18:0])
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
dff #(19)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[18:0]),
.si({scan_in,so[17:0]}),
.so({so[17:0],scan_out}),
.q(dout[18:0])
);




















endmodule









//
//   buff macro
//
//





module tlu_dfd_dp_buff_macro__rep_1__stack_none__width_8 (
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

module tlu_dfd_dp_msff_macro__mux_aonpe__ports_3__width_7 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
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
wire buffout0;
wire buffout1;
wire buffout2;
wire [6:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [5:0] so;

  input [6:0] din0;
  input sel0;
  input [6:0] din1;
  input sel1;
  input [6:0] din2;
  input sel2;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [6:0] dout;


  output scan_out;




cl_dp1_muxbuff3_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(7)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[6:0]),
  .in1(din1[6:0]),
  .in2(din2[6:0]),
.dout(muxout[6:0])
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
dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);




















endmodule









//  
//   or macro for ports = 2,3
//
//





module tlu_dfd_dp_or_macro__ports_2__width_8 (
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
//   buff macro
//
//





module tlu_dfd_dp_buff_macro__dbuff_16x__width_16 (
  din, 
  dout);
  input [15:0] din;
  output [15:0] dout;






buff #(16)  d0_0 (
.in(din[15:0]),
.out(dout[15:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_dfd_dp_mux_macro__mux_aonpe__ports_8__stack_48c__width_48 (
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

  input [47:0] din0;
  input sel0;
  input [47:0] din1;
  input sel1;
  input [47:0] din2;
  input sel2;
  input [47:0] din3;
  input sel3;
  input [47:0] din4;
  input sel4;
  input [47:0] din5;
  input sel5;
  input [47:0] din6;
  input sel6;
  input [47:0] din7;
  input sel7;
  output [47:0] dout;





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
mux8s #(48)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[47:0]),
  .in1(din1[47:0]),
  .in2(din2[47:0]),
  .in3(din3[47:0]),
  .in4(din4[47:0]),
  .in5(din5[47:0]),
  .in6(din6[47:0]),
  .in7(din7[47:0]),
.dout(dout[47:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_dfd_dp_mux_macro__dmux_8x__mux_aonpe__ports_8__width_19 (
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
  input [18:0] din7;
  input sel7;
  output [18:0] dout;





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
mux8s #(19)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[18:0]),
  .in1(din1[18:0]),
  .in2(din2[18:0]),
  .in3(din3[18:0]),
  .in4(din4[18:0]),
  .in5(din5[18:0]),
  .in6(din6[18:0]),
  .in7(din7[18:0]),
.dout(dout[18:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module tlu_dfd_dp_mux_macro__mux_aonpe__ports_8__width_7 (
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

  input [6:0] din0;
  input sel0;
  input [6:0] din1;
  input sel1;
  input [6:0] din2;
  input sel2;
  input [6:0] din3;
  input sel3;
  input [6:0] din4;
  input sel4;
  input [6:0] din5;
  input sel5;
  input [6:0] din6;
  input sel6;
  input [6:0] din7;
  input sel7;
  output [6:0] dout;





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
mux8s #(7)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[6:0]),
  .in1(din1[6:0]),
  .in2(din2[6:0]),
  .in3(din3[6:0]),
  .in4(din4[6:0]),
  .in5(din5[6:0]),
  .in6(din6[6:0]),
  .in7(din7[6:0]),
.dout(dout[6:0])
);









  



endmodule


//  
//   or macro for ports = 2,3
//
//





module tlu_dfd_dp_or_macro__ports_2__stack_48c__width_48 (
  din0, 
  din1, 
  dout);
  input [47:0] din0;
  input [47:0] din1;
  output [47:0] dout;






or2 #(48)  d0_0 (
.in0(din0[47:0]),
.in1(din1[47:0]),
.out(dout[47:0])
);









endmodule




