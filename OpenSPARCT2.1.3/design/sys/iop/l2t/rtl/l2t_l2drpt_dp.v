// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_l2drpt_dp.v
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
module  l2t_l2drpt_dp (
  l2clk, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  scan_in, 
  scan_out, 
  arb_l2drpt_waysel_gate_c1, 
  mbist_run, 
  misbuf_tag_hit_unqual_c2, 
  arb_inst_vld_c2_prev, 
  csr_l2_bypass_mode_on, 
  arb_decdp_ld64_inst_c1, 
  tag_way_sel_c2, 
  tagctl_l2drpt_mux4_way_sel_c1, 
  vlddir_vuad_valid_c2, 
  tag_rdma_gate_off_c2, 
  tag_l2d_way_sel_c2, 
  tagdp_lru_way_sel_c3, 
  arb_evict_vld_c2, 
  tagdp_tag_par_err_c3);
wire pce_ov;
wire siclk;
wire soclk;
wire stop;
wire se;
wire ld64_l2_bypass_mode_on_c1;
wire arb_inst_vld_c2_prev_n;
wire [15:0] temp_way_sel_c2_n;
wire mbist_run_r1_n;
wire tagdp_tag_par_err_c3_n;
wire tag_rdma_gate_off_c2_n;
wire [15:0] temp_way_sel_c2;
wire mbist_run_r1;
wire ld64_l2_bypass_mode_on_c1_qual;
wire arb_evict_vld_c2_qual;
wire arb_inst_vld_c2_prev_qual;
wire ff_all_signals_scanin;
wire ff_all_signals_scanout;
wire arb_waysel_gate_c2;
wire arb_waysel_inst_vld_c2;
wire ld64_l2_bypass_mode_on_c2;
wire evict_unqual_vld_c3;
wire term_2_qual;
wire [15:0] hit_way_n;
wire [15:0] replace_way_n;
wire [15:0] tag_l2d_way_sel_c2_fnl_1;
wire [15:0] tag_l2d_way_sel_c2_fnl_n;
wire vld_mbf_miss_c2_1;
wire vld_mbf_miss_c2_2;
wire vld_mbf_miss_c2_3;
wire vld_mbf_miss_c2_4;


input           l2clk;
input           tcu_pce_ov;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;
input           tcu_clk_stop;
input           scan_in;
output          scan_out;

input           arb_l2drpt_waysel_gate_c1;
input           mbist_run;
input           misbuf_tag_hit_unqual_c2;
input           arb_inst_vld_c2_prev;
input           csr_l2_bypass_mode_on; 
input           arb_decdp_ld64_inst_c1; 

input   [15:0]  tag_way_sel_c2; // from the tag 
input   [15:0]  tagctl_l2drpt_mux4_way_sel_c1; // from the tag 
input   [15:0]  vlddir_vuad_valid_c2; // from vuad dp 
input           tag_rdma_gate_off_c2;

output  [15:0]  tag_l2d_way_sel_c2;
input   [15:0]  tagdp_lru_way_sel_c3;


input           arb_evict_vld_c2;
input           tagdp_tag_par_err_c3;
//input           arb_waysel_gate_c2;

assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign stop = tcu_clk_stop;
assign se = tcu_scan_en;



l2t_l2drpt_dp_nor_macro__dnor_4x__ports_3__stack_2r__width_1 nor_ld64_l2_bypass_mode_on_c1 
	(
	.dout	(ld64_l2_bypass_mode_on_c1),
	.din0	(arb_decdp_ld64_inst_c1),
	.din1	(csr_l2_bypass_mode_on),
	.din2	(arb_inst_vld_c2_prev_n)
	);


l2t_l2drpt_dp_inv_macro__dinv_32x__width_20 inv_all_signals 
	(
	.dout	({temp_way_sel_c2_n[15:0],
		  mbist_run_r1_n,
		  tagdp_tag_par_err_c3_n,
		  tag_rdma_gate_off_c2_n,
		  arb_inst_vld_c2_prev_n}),
	.din	({temp_way_sel_c2[15:0],
		  mbist_run_r1,
		  tagdp_tag_par_err_c3,
                  tag_rdma_gate_off_c2,
		  arb_inst_vld_c2_prev})
	);


l2t_l2drpt_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__width_3 mux_misc_signals 
	(
	.dout	({ld64_l2_bypass_mode_on_c1_qual,arb_evict_vld_c2_qual,arb_inst_vld_c2_prev_qual}),
	.din0	({ld64_l2_bypass_mode_on_c1,arb_evict_vld_c2,arb_inst_vld_c2_prev}),
	.din1	(3'b0),
	.sel0	(mbist_run_r1_n),
	.sel1	(mbist_run_r1)
	);

l2t_l2drpt_dp_msff_macro__dmsff_32x__stack_26r__width_21 ff_all_signals 
        (
        .scan_in(ff_all_signals_scanin),
        .scan_out(ff_all_signals_scanout),
        .dout   ({arb_waysel_gate_c2,
		   arb_waysel_inst_vld_c2,
                  temp_way_sel_c2[15:0],
                  ld64_l2_bypass_mode_on_c2,
                  evict_unqual_vld_c3,
                  mbist_run_r1}),
        .din    ({arb_l2drpt_waysel_gate_c1,
		  arb_inst_vld_c2_prev_qual,
                  tagctl_l2drpt_mux4_way_sel_c1[15:0],
                  ld64_l2_bypass_mode_on_c1_qual,
                  arb_evict_vld_c2_qual,
                  mbist_run}),
        .clk    (l2clk),
        .en     (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
        );

l2t_l2drpt_dp_and_macro__dinv_48x__dnand_16x__ports_3__stack_2r__width_1 and_term_2_qual 
	(
	.dout	(term_2_qual),
	.din0	(ld64_l2_bypass_mode_on_c2),
	.din1	(tag_rdma_gate_off_c2_n),
	.din2	(arb_waysel_gate_c2)
	);


l2t_l2drpt_dp_nand_macro__dnand_24x__ports_3__stack_16r__width_16 nand_term_2 
	(
	.dout	(hit_way_n[15:0]),
	.din0	(tag_way_sel_c2[15:0]),
	.din1	(vlddir_vuad_valid_c2[15:0]),
	.din2	({16{term_2_qual}})
	);


l2t_l2drpt_dp_nand_macro__dnand_24x__ports_3__stack_16r__width_16 nand_term_3 
        (
        .dout   (replace_way_n[15:0]),
        .din0   (tagdp_lru_way_sel_c3[15:0]),
        .din1   ({16{evict_unqual_vld_c3}}),
        .din2   ({16{tagdp_tag_par_err_c3_n}})
        );
l2t_l2drpt_dp_nand_macro__dnand_24x__ports_3__stack_16r__width_16 nand_level_1 
	(
	.dout	(tag_l2d_way_sel_c2_fnl_1[15:0]),
	.din0	(temp_way_sel_c2_n[15:0]),
	.din1	(hit_way_n[15:0]),
	.din2	(replace_way_n[15:0])
	);

//nand_macro nand_vld_mbf_miss_c2 (width=4,stack=4r,dnand=32x)
//	(
//	.dout	(vld_mbf_miss_c2),
//	.din0	(misbuf_tag_hit_unqual_c2),
//	.din1	(4{arb_waysel_inst_vld_c2)
//	);

l2t_l2drpt_dp_nand_macro__dnand_32x__stack_16r__width_5 nand_tag_l2d_way_sel_c2_fnl_slice1  
        (
        .dout   ({tag_l2d_way_sel_c2_fnl_n[15:14],vld_mbf_miss_c2_1,       tag_l2d_way_sel_c2_fnl_n[13:12]}),
        .din0   ({tag_l2d_way_sel_c2_fnl_1[15:14],misbuf_tag_hit_unqual_c2,tag_l2d_way_sel_c2_fnl_1[13:12]}),
        .din1   ({{2{vld_mbf_miss_c2_1}},          arb_waysel_inst_vld_c2,  {2{vld_mbf_miss_c2_1}}})
        );


l2t_l2drpt_dp_nand_macro__dnand_32x__stack_16r__width_5 nand_tag_l2d_way_sel_c2_fnl_slice2  
        (
        .dout   ({tag_l2d_way_sel_c2_fnl_n[11:10],vld_mbf_miss_c2_2,       tag_l2d_way_sel_c2_fnl_n[9:8]}),
        .din0   ({tag_l2d_way_sel_c2_fnl_1[11:10],misbuf_tag_hit_unqual_c2,tag_l2d_way_sel_c2_fnl_1[9:8]}),
        .din1   ({{2{vld_mbf_miss_c2_2}},          arb_waysel_inst_vld_c2,  {2{vld_mbf_miss_c2_2}}})
        );


l2t_l2drpt_dp_nand_macro__dnand_32x__stack_16r__width_5 nand_tag_l2d_way_sel_c2_fnl_slice3  
        (
        .dout   ({tag_l2d_way_sel_c2_fnl_n[7:6],vld_mbf_miss_c2_3,       tag_l2d_way_sel_c2_fnl_n[5:4]}),
        .din0   ({tag_l2d_way_sel_c2_fnl_1[7:6],misbuf_tag_hit_unqual_c2,tag_l2d_way_sel_c2_fnl_1[5:4]}),
        .din1   ({{2{vld_mbf_miss_c2_3}},          arb_waysel_inst_vld_c2,  {2{vld_mbf_miss_c2_3}}})
        );


l2t_l2drpt_dp_nand_macro__dnand_32x__stack_16r__width_5 nand_tag_l2d_way_sel_c2_fnl_slice4  
        (
        .dout   ({tag_l2d_way_sel_c2_fnl_n[3:2],vld_mbf_miss_c2_4,       tag_l2d_way_sel_c2_fnl_n[1:0]}),
        .din0   ({tag_l2d_way_sel_c2_fnl_1[3:2],misbuf_tag_hit_unqual_c2,tag_l2d_way_sel_c2_fnl_1[1:0]}),
        .din1   ({{2{vld_mbf_miss_c2_4}},          arb_waysel_inst_vld_c2,  {2{vld_mbf_miss_c2_4}}})
        );




l2t_l2drpt_dp_inv_macro__dinv_48x__stack_16r__width_16 inv_tag_l2d_way_sel_c2_n 
	(
	.dout	(tag_l2d_way_sel_c2[15:0]),
	.din	(tag_l2d_way_sel_c2_fnl_n[15:0])
	);




// fixscan start:
assign ff_all_signals_scanin     = scan_in                  ;
assign scan_out                  = ff_all_signals_scanout   ;
// fixscan end:
endmodule


//
//   nor macro for ports = 2,3
//
//





module l2t_l2drpt_dp_nor_macro__dnor_4x__ports_3__stack_2r__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






nor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);







endmodule





//
//   invert macro
//
//





module l2t_l2drpt_dp_inv_macro__dinv_32x__width_20 (
  din, 
  dout);
  input [19:0] din;
  output [19:0] dout;






inv #(20)  d0_0 (
.in(din[19:0]),
.out(dout[19:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_l2drpt_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__width_3 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [2:0] din0;
  input sel0;
  input [2:0] din1;
  input sel1;
  output [2:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(3)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[2:0]),
  .in1(din1[2:0]),
.dout(dout[2:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module l2t_l2drpt_dp_msff_macro__dmsff_32x__stack_26r__width_21 (
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









//  
//   and macro for ports = 2,3,4
//
//





module l2t_l2drpt_dp_and_macro__dinv_48x__dnand_16x__ports_3__stack_2r__width_1 (
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





//
//   nand macro for ports = 2,3,4
//
//





module l2t_l2drpt_dp_nand_macro__dnand_24x__ports_3__stack_16r__width_16 (
  din0, 
  din1, 
  din2, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  input [15:0] din2;
  output [15:0] dout;






nand3 #(16)  d0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.in2(din2[15:0]),
.out(dout[15:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module l2t_l2drpt_dp_nand_macro__dnand_32x__stack_16r__width_5 (
  din0, 
  din1, 
  dout);
  input [4:0] din0;
  input [4:0] din1;
  output [4:0] dout;






nand2 #(5)  d0_0 (
.in0(din0[4:0]),
.in1(din1[4:0]),
.out(dout[4:0])
);









endmodule





//
//   invert macro
//
//





module l2t_l2drpt_dp_inv_macro__dinv_48x__stack_16r__width_16 (
  din, 
  dout);
  input [15:0] din;
  output [15:0] dout;






inv #(16)  d0_0 (
.in(din[15:0]),
.out(dout[15:0])
);









endmodule




