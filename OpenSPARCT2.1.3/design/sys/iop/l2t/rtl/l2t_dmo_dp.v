// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_dmo_dp.v
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
module l2t_dmo_dp (
  tcu_l2t_coresel, 
  l2t_tcu_dmo_out_prev, 
  mbist_dmo_data_out, 
  l2clk, 
  tcu_clk_stop, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  scan_in, 
  scan_out, 
  l2t_tcu_dmo_out, 
  io_cmp_sync_en, 
  tcu_l2t_shscan_clk_stop, 
  tcu_l2t_shscan_clk_stop_d2);
wire stop;
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire [38:0] l2t_tcu_dmo_out_unreg;
wire ff_dmo_data_scanin;
wire ff_dmo_data_scanout;
wire ff_dmo_data_1_scanin;
wire ff_dmo_data_1_scanout;
wire io_cmp_sync_en_r1;
wire ff_shadow_scan_clk_stop_scanin;
wire ff_shadow_scan_clk_stop_scanout;



input           tcu_l2t_coresel;        // 1= select current bank dmo out
input   [38:0]  l2t_tcu_dmo_out_prev;   // dmo output from prev bank
//input           tcu_l2t_tag_or_data_sel;        
//input	[38:0]  decc_ret_diag_data_c7;     // dmo data tag or data data
//input	[27:0]  tagd_evict_tag_c3;     // dmo data tag or data data
input	[38:0]	mbist_dmo_data_out;

input		l2clk;
input		tcu_clk_stop;
input		tcu_pce_ov;
input		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;
input		scan_in;
output		scan_out;
output  [38:0]  l2t_tcu_dmo_out;        // dmo output from this bank

input		io_cmp_sync_en;
input		tcu_l2t_shscan_clk_stop;
output		tcu_l2t_shscan_clk_stop_d2;

assign stop = tcu_clk_stop;
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

//mux_macro  mux_data_tag_dmo_data (width=39,ports=2,mux=aope,stack=39c)
//        (
//        .dout   (mbist_dmo_data_out[38:0]),
//        .din0   ({11'b0,tagd_evict_tag_c3[27:0]}),
//        .din1   (decc_ret_diag_data_c7[38:0]),
//        .sel0   (tcu_l2t_tag_or_data_sel)
//        );
//


l2t_mux_macro__dmux_8x__mux_aope__ports_2__stack_20r__width_19  mux_dmo_data	
	(
	.dout	(l2t_tcu_dmo_out_unreg[18:0]),
	.din0	(l2t_tcu_dmo_out_prev[18:0]),
	.din1	(mbist_dmo_data_out[18:0]),
	.sel0	(tcu_l2t_coresel)
	);

l2t_mux_macro__dmux_8x__mux_aope__ports_2__stack_20r__width_20  mux_dmo_data_1 
        (
        .dout   (l2t_tcu_dmo_out_unreg[38:19]),
        .din0   (l2t_tcu_dmo_out_prev[38:19]),
        .din1   (mbist_dmo_data_out[38:19]),
        .sel0   (tcu_l2t_coresel)
        );




l2t_msff_macro__dmsff_32x__stack_20r__width_19  ff_dmo_data     
	(
	.scan_in(ff_dmo_data_scanin),
	.scan_out(ff_dmo_data_scanout),
	.dout	(l2t_tcu_dmo_out[18:0]),
	.din	(l2t_tcu_dmo_out_unreg[18:0]),
	.clk	(l2clk),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);



l2t_msff_macro__dmsff_32x__stack_22r__width_21  ff_dmo_data_1     
        (
        .scan_in(ff_dmo_data_1_scanin),
        .scan_out(ff_dmo_data_1_scanout),
        .dout   ({io_cmp_sync_en_r1,l2t_tcu_dmo_out[38:19]}),
        .din    ({io_cmp_sync_en,l2t_tcu_dmo_out_unreg[38:19]}),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );


l2t_msff_macro__dmsff_32x__stack_2r__width_1  ff_shadow_scan_clk_stop 
        (
        .scan_in(ff_shadow_scan_clk_stop_scanin),
        .scan_out(ff_shadow_scan_clk_stop_scanout),
        .dout   (tcu_l2t_shscan_clk_stop_d2),
        .din    (tcu_l2t_shscan_clk_stop),
        .clk    (l2clk),
        .en     (io_cmp_sync_en_r1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );



// fixscan start:
assign ff_dmo_data_scanin        = scan_in                  ;
assign ff_dmo_data_1_scanin      = ff_dmo_data_scanout      ;
assign ff_shadow_scan_clk_stop_scanin = ff_dmo_data_1_scanout    ;
assign scan_out                  = ff_shadow_scan_clk_stop_scanout;
// fixscan end:
endmodule

// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder


// any PARAMS parms go into naming of macro

module l2t_mux_macro__dmux_8x__mux_aope__ports_2__stack_20r__width_19 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [18:0] din0;
  input [18:0] din1;
  input sel0;
  output [18:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(19)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[18:0]),
  .in1(din1[18:0]),
.dout(dout[18:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder


// any PARAMS parms go into naming of macro

module l2t_mux_macro__dmux_8x__mux_aope__ports_2__stack_20r__width_20 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [19:0] din0;
  input [19:0] din1;
  input sel0;
  output [19:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(20)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[19:0]),
  .in1(din1[19:0]),
.dout(dout[19:0])
);









  



endmodule




// any PARAMS parms go into naming of macro

module l2t_msff_macro__dmsff_32x__stack_20r__width_19 (
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
wire [17:0] so;

  input [18:0] din;


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
.d(din[18:0]),
.si({scan_in,so[17:0]}),
.so({so[17:0],scan_out}),
.q(dout[18:0])
);




















endmodule




// any PARAMS parms go into naming of macro

module l2t_msff_macro__dmsff_32x__stack_22r__width_21 (
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
wire [19:0] so;

  input [20:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [20:0] dout;


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
dff #(21)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[20:0]),
.si({scan_in,so[19:0]}),
.so({so[19:0],scan_out}),
.q(dout[20:0])
);




















endmodule








// any PARAMS parms go into naming of macro

module l2t_msff_macro__dmsff_32x__stack_2r__width_1 (
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

  input [0:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [0:0] dout;


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
dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);




















endmodule



