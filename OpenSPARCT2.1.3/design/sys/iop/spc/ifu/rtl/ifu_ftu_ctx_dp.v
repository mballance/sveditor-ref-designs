// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_ftu_ctx_dp.v
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
module ifu_ftu_ctx_dp (
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  spc_aclk_wmr, 
  wmr_scan_in, 
  wmr_scan_out, 
  lsu_ifu_ctxt_data, 
  agc_thr0_cntx_0_sel_ff, 
  agc_thr0_cntx_1_sel_ff, 
  agc_thr1_cntx_0_sel_ff, 
  agc_thr1_cntx_1_sel_ff, 
  agc_thr2_cntx_0_sel_ff, 
  agc_thr2_cntx_1_sel_ff, 
  agc_thr3_cntx_0_sel_ff, 
  agc_thr3_cntx_1_sel_ff, 
  agc_thr4_cntx_0_sel_ff, 
  agc_thr4_cntx_1_sel_ff, 
  agc_thr5_cntx_0_sel_ff, 
  agc_thr5_cntx_1_sel_ff, 
  agc_thr6_cntx_0_sel_ff, 
  agc_thr6_cntx_1_sel_ff, 
  agc_thr7_cntx_0_sel_ff, 
  agc_thr7_cntx_1_sel_ff, 
  agc_thr0_cntx_0_sel, 
  agc_thr0_cntx_1_sel, 
  agc_thr1_cntx_0_sel, 
  agc_thr1_cntx_1_sel, 
  agc_thr2_cntx_0_sel, 
  agc_thr2_cntx_1_sel, 
  agc_thr3_cntx_0_sel, 
  agc_thr3_cntx_1_sel, 
  agc_thr4_cntx_0_sel, 
  agc_thr4_cntx_1_sel, 
  agc_thr5_cntx_0_sel, 
  agc_thr5_cntx_1_sel, 
  agc_thr6_cntx_0_sel, 
  agc_thr6_cntx_1_sel, 
  agc_thr7_cntx_0_sel, 
  agc_thr7_cntx_1_sel, 
  ftp_itb_fetch_thr_bf, 
  itc_thr_to_write, 
  tlu_tl_gt_0, 
  ftp_itlb_probe_req_l, 
  ctx_curr_cntx_0_bf, 
  ctx_curr_cntx_1_bf, 
  ctx_cntx_0_to_write_bf, 
  ctx_cntx_1_to_write_bf, 
  scan_out) ;
wire stop;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire tlu_tl_gt_0_reg_scanin;
wire tlu_tl_gt_0_reg_scanout;
wire [7:0] gt_t_zero_to_buf;
wire [7:0] gt_t_zero;
wire lsu_ifu_data_reg_scanin;
wire lsu_ifu_data_reg_scanout;
wire [12:0] ifu_ctx_data_ff;
wire prty_ctxt;
wire [13:0] thr0_cntx_0;
wire thr0_prty_ctx_0;
wire [13:0] thr0_cntx_1;
wire thr0_prty_ctx_1;
wire [13:0] thr1_cntx_0;
wire thr1_prty_ctx_0;
wire [13:0] thr1_cntx_1;
wire thr1_prty_ctx_1;
wire [13:0] thr2_cntx_0;
wire thr2_prty_ctx_0;
wire [13:0] thr2_cntx_1;
wire thr2_prty_ctx_1;
wire [13:0] thr3_cntx_0;
wire thr3_prty_ctx_0;
wire [13:0] thr3_cntx_1;
wire thr3_prty_ctx_1;
wire [13:0] thr4_cntx_0;
wire thr4_prty_ctx_0;
wire [13:0] thr4_cntx_1;
wire thr4_prty_ctx_1;
wire [13:0] thr5_cntx_0;
wire thr5_prty_ctx_0;
wire [13:0] thr5_cntx_1;
wire thr5_prty_ctx_1;
wire [13:0] thr6_cntx_0;
wire thr6_prty_ctx_0;
wire [13:0] thr6_cntx_1;
wire thr6_prty_ctx_1;
wire [13:0] thr7_cntx_0;
wire thr7_prty_ctx_0;
wire [13:0] thr7_cntx_1;
wire thr7_prty_ctx_1;
wire [13:0] next_thr0_cnxt_0_data;
wire [13:0] next_thr0_cnxt_1_data;
wire [13:0] next_thr1_cnxt_0_data;
wire [13:0] next_thr1_cnxt_1_data;
wire [13:0] next_thr2_cnxt_0_data;
wire [13:0] next_thr2_cnxt_1_data;
wire [13:0] next_thr3_cnxt_0_data;
wire [13:0] next_thr3_cnxt_1_data;
wire [13:0] next_thr4_cnxt_0_data;
wire [13:0] next_thr4_cnxt_1_data;
wire [13:0] next_thr5_cnxt_0_data;
wire [13:0] next_thr5_cnxt_1_data;
wire [13:0] next_thr6_cnxt_0_data;
wire [13:0] next_thr6_cnxt_1_data;
wire [13:0] next_thr7_cnxt_0_data;
wire [13:0] next_thr7_cnxt_1_data;
wire thr0_cntx_0_reg_wmr_scanin;
wire thr0_cntx_0_reg_wmr_scanout;
wire [7:0] ctx_gt_zero_0_;
wire [12:0] thr0_cntx_0_q;
wire thr0_cntx_1_reg_wmr_scanin;
wire thr0_cntx_1_reg_wmr_scanout;
wire [12:0] thr0_cntx_1_q;
wire thr1_cntx_0_reg_wmr_scanin;
wire thr1_cntx_0_reg_wmr_scanout;
wire [12:0] thr1_cntx_0_q;
wire thr1_cntx_1_reg_wmr_scanin;
wire thr1_cntx_1_reg_wmr_scanout;
wire [12:0] thr1_cntx_1_q;
wire thr2_cntx_0_reg_wmr_scanin;
wire thr2_cntx_0_reg_wmr_scanout;
wire [12:0] thr2_cntx_0_q;
wire thr2_cntx_1_reg_wmr_scanin;
wire thr2_cntx_1_reg_wmr_scanout;
wire [12:0] thr2_cntx_1_q;
wire thr3_cntx_0_reg_wmr_scanin;
wire thr3_cntx_0_reg_wmr_scanout;
wire [12:0] thr3_cntx_0_q;
wire thr3_cntx_1_reg_wmr_scanin;
wire thr3_cntx_1_reg_wmr_scanout;
wire [12:0] thr3_cntx_1_q;
wire thr4_cntx_0_reg_wmr_scanin;
wire thr4_cntx_0_reg_wmr_scanout;
wire [12:0] thr4_cntx_0_q;
wire thr4_cntx_1_reg_wmr_scanin;
wire thr4_cntx_1_reg_wmr_scanout;
wire [12:0] thr4_cntx_1_q;
wire thr5_cntx_0_reg_wmr_scanin;
wire thr5_cntx_0_reg_wmr_scanout;
wire [12:0] thr5_cntx_0_q;
wire thr5_cntx_1_reg_wmr_scanin;
wire thr5_cntx_1_reg_wmr_scanout;
wire [12:0] thr5_cntx_1_q;
wire thr6_cntx_0_reg_wmr_scanin;
wire thr6_cntx_0_reg_wmr_scanout;
wire [12:0] thr6_cntx_0_q;
wire thr6_cntx_1_reg_wmr_scanin;
wire thr6_cntx_1_reg_wmr_scanout;
wire [12:0] thr6_cntx_1_q;
wire thr7_cntx_0_reg_wmr_scanin;
wire thr7_cntx_0_reg_wmr_scanout;
wire [12:0] thr7_cntx_0_q;
wire thr7_cntx_1_reg_wmr_scanin;
wire thr7_cntx_1_reg_wmr_scanout;
wire [12:0] thr7_cntx_1_q;
wire [12:0] ctx_curr_cntx_0_to_buf;
wire [12:0] ctx_curr_cntx_1_to_buf;
wire [13:0] ctx_cntx_0_to_write_to_buf;
wire [13:0] ctx_cntx_1_to_write_to_buf;

        

input tcu_scan_en ;
input l2clk;
input scan_in;
input tcu_pce_ov;		// scan signals
input spc_aclk;
input spc_bclk;
// input tcu_muxtest;
input           spc_aclk_wmr;
input           wmr_scan_in;
output          wmr_scan_out;



input   [12:0]  lsu_ifu_ctxt_data;
input           agc_thr0_cntx_0_sel_ff;
input           agc_thr0_cntx_1_sel_ff;
input           agc_thr1_cntx_0_sel_ff;
input           agc_thr1_cntx_1_sel_ff;
input           agc_thr2_cntx_0_sel_ff;
input           agc_thr2_cntx_1_sel_ff;
input           agc_thr3_cntx_0_sel_ff;
input           agc_thr3_cntx_1_sel_ff;
input           agc_thr4_cntx_0_sel_ff;
input           agc_thr4_cntx_1_sel_ff;
input           agc_thr5_cntx_0_sel_ff;
input           agc_thr5_cntx_1_sel_ff;
input           agc_thr6_cntx_0_sel_ff;
input           agc_thr6_cntx_1_sel_ff;
input           agc_thr7_cntx_0_sel_ff;
input           agc_thr7_cntx_1_sel_ff;
 
input  [1:0]    agc_thr0_cntx_0_sel;
input  [1:0]    agc_thr0_cntx_1_sel;
input  [1:0]    agc_thr1_cntx_0_sel;
input  [1:0]    agc_thr1_cntx_1_sel;
input  [1:0]    agc_thr2_cntx_0_sel;
input  [1:0]    agc_thr2_cntx_1_sel;
input  [1:0]    agc_thr3_cntx_0_sel;
input  [1:0]    agc_thr3_cntx_1_sel;
input  [1:0]    agc_thr4_cntx_0_sel;
input  [1:0]    agc_thr4_cntx_1_sel;
input  [1:0]    agc_thr5_cntx_0_sel;
input  [1:0]    agc_thr5_cntx_1_sel;
input  [1:0]    agc_thr6_cntx_0_sel;
input  [1:0]    agc_thr6_cntx_1_sel;
input  [1:0]    agc_thr7_cntx_0_sel;
input  [1:0]    agc_thr7_cntx_1_sel;
input  [7:0]    ftp_itb_fetch_thr_bf;
input  [7:0]    itc_thr_to_write;
input  [7:0]    tlu_tl_gt_0;

input           ftp_itlb_probe_req_l;

output [12:0]   ctx_curr_cntx_0_bf;
output [12:0]   ctx_curr_cntx_1_bf;

output [13:0]   ctx_cntx_0_to_write_bf;
output [13:0]   ctx_cntx_1_to_write_bf;
output scan_out;

// scan renames
// assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
// assign siclk = spc_aclk;
// assign soclk = spc_bclk;
// assign muxtst = tcu_muxtest;
// end scan

ifu_ftu_ctx_dp_buff_macro__dbuff_32x__stack_none__width_4 test_rep0  (
  .din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk}),
  .dout({se,pce_ov,siclk,soclk})
);





ifu_ftu_ctx_dp_msff_macro__stack_14c__width_8 tlu_tl_gt_0_reg  (
 .scan_in(tlu_tl_gt_0_reg_scanin),
 .scan_out(tlu_tl_gt_0_reg_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),
 .din ( tlu_tl_gt_0[7:0]),
 .dout( gt_t_zero_to_buf[7:0]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


ifu_ftu_ctx_dp_buff_macro__stack_14c__width_8 tlu_tl_gt_0_buf   (
  .din(gt_t_zero_to_buf[7:0]),
  .dout(gt_t_zero[7:0]));



ifu_ftu_ctx_dp_msff_macro__stack_14c__width_13 lsu_ifu_data_reg  (
 .scan_in(lsu_ifu_data_reg_scanin),
 .scan_out(lsu_ifu_data_reg_scanout),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),
 .din ( lsu_ifu_ctxt_data[12:0]),
 .dout( ifu_ctx_data_ff[12:0]     ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

ifu_ftu_ctx_dp_prty_macro__width_16 pgen_lsu_ctxt  (
        .din    ({1'b0,ifu_ctx_data_ff[12:0],2'b00}),
        .dout   (prty_ctxt)
);

///////////////////////////////////////////////////////////////////////
// Parity muxing.                                                    //
///////////////////////////////////////////////////////////////////////
// Thr0                                                              //
///////////////////////////////////////////////////////////////////////
ifu_ftu_ctx_dp_mux_macro__mux_aope__ports_2__stack_2c__width_1 thr0_cntx_0_parity_mux  (
 .din0( prty_ctxt),                   // new parity 
 .din1( thr0_cntx_0[13]),           // Hold the old value 
 .sel0( agc_thr0_cntx_0_sel_ff),
 .dout( thr0_prty_ctx_0                               ));

ifu_ftu_ctx_dp_mux_macro__mux_aope__ports_2__stack_2c__width_1 thr0_cntx_1_parity_mux  (
 .din0( prty_ctxt),                   // new parity 
 .din1( thr0_cntx_1[13]),            // Hold the old value 
 .sel0( agc_thr0_cntx_1_sel_ff),
 .dout( thr0_prty_ctx_1                               ));
///////////////////////////////////////////////////////////////////////
// Thr1                                                              //
///////////////////////////////////////////////////////////////////////
ifu_ftu_ctx_dp_mux_macro__mux_aope__ports_2__stack_2c__width_1 thr1_cntx_0_parity_mux  (
 .din0( prty_ctxt),                   // new parity 
 .din1( thr1_cntx_0[13]),           // Hold the old value 
 .sel0( agc_thr1_cntx_0_sel_ff),
 .dout( thr1_prty_ctx_0                               ));

ifu_ftu_ctx_dp_mux_macro__mux_aope__ports_2__stack_2c__width_1 thr1_cntx_1_parity_mux  (
 .din0( prty_ctxt),                   // new parity 
 .din1( thr1_cntx_1[13]),            // Hold the old value 
 .sel0( agc_thr1_cntx_1_sel_ff),
 .dout( thr1_prty_ctx_1                               ));

///////////////////////////////////////////////////////////////////////
// Thr2                                                              //
///////////////////////////////////////////////////////////////////////
ifu_ftu_ctx_dp_mux_macro__mux_aope__ports_2__stack_2c__width_1 thr2_cntx_0_parity_mux  (
 .din0( prty_ctxt),                   // new parity 
 .din1( thr2_cntx_0[13]),           // Hold the old value 
 .sel0( agc_thr2_cntx_0_sel_ff),
 .dout( thr2_prty_ctx_0                               ));

ifu_ftu_ctx_dp_mux_macro__mux_aope__ports_2__stack_2c__width_1 thr2_cntx_1_parity_mux  (
 .din0( prty_ctxt),                   // new parity 
 .din1( thr2_cntx_1[13]),            // Hold the old value 
 .sel0( agc_thr2_cntx_1_sel_ff),
 .dout( thr2_prty_ctx_1                               ));
///////////////////////////////////////////////////////////////////////
// Thr3                                                              //
///////////////////////////////////////////////////////////////////////
ifu_ftu_ctx_dp_mux_macro__mux_aope__ports_2__stack_2c__width_1 thr3_cntx_0_parity_mux  (
 .din0( prty_ctxt),                   // new parity 
 .din1( thr3_cntx_0[13]),           // Hold the old value 
 .sel0( agc_thr3_cntx_0_sel_ff),
 .dout( thr3_prty_ctx_0                               ));

ifu_ftu_ctx_dp_mux_macro__mux_aope__ports_2__stack_2c__width_1 thr3_cntx_1_parity_mux  (
 .din0( prty_ctxt),                   // new parity 
 .din1( thr3_cntx_1[13]),            // Hold the old value 
 .sel0( agc_thr3_cntx_1_sel_ff),
 .dout( thr3_prty_ctx_1                               ));

///////////////////////////////////////////////////////////////////////
// Thr4                                                              //
///////////////////////////////////////////////////////////////////////
ifu_ftu_ctx_dp_mux_macro__mux_aope__ports_2__stack_2c__width_1 thr4_cntx_0_parity_mux  (
 .din0( prty_ctxt),                   // new parity 
 .din1( thr4_cntx_0[13]),           // Hold the old value 
 .sel0( agc_thr4_cntx_0_sel_ff),
 .dout( thr4_prty_ctx_0                               ));

ifu_ftu_ctx_dp_mux_macro__mux_aope__ports_2__stack_2c__width_1 thr4_cntx_1_parity_mux  (
 .din0( prty_ctxt),                   // new parity 
 .din1( thr4_cntx_1[13]),            // Hold the old value 
 .sel0( agc_thr4_cntx_1_sel_ff),
 .dout( thr4_prty_ctx_1                               ));
///////////////////////////////////////////////////////////////////////
// Thr5                                                              //
///////////////////////////////////////////////////////////////////////
ifu_ftu_ctx_dp_mux_macro__mux_aope__ports_2__stack_2c__width_1 thr5_cntx_0_parity_mux  (
 .din0( prty_ctxt),                   // new parity 
 .din1( thr5_cntx_0[13]),           // Hold the old value 
 .sel0( agc_thr5_cntx_0_sel_ff),
 .dout( thr5_prty_ctx_0                               ));

ifu_ftu_ctx_dp_mux_macro__mux_aope__ports_2__stack_2c__width_1 thr5_cntx_1_parity_mux  (
 .din0( prty_ctxt),                   // new parity 
 .din1( thr5_cntx_1[13]),            // Hold the old value 
 .sel0( agc_thr5_cntx_1_sel_ff),
 .dout( thr5_prty_ctx_1                               ));

///////////////////////////////////////////////////////////////////////
// Thr6                                                              //
///////////////////////////////////////////////////////////////////////
ifu_ftu_ctx_dp_mux_macro__mux_aope__ports_2__stack_2c__width_1 thr6_cntx_0_parity_mux  (
 .din0( prty_ctxt),                   // new parity 
 .din1( thr6_cntx_0[13]),           // Hold the old value 
 .sel0( agc_thr6_cntx_0_sel_ff),
 .dout( thr6_prty_ctx_0                               ));

ifu_ftu_ctx_dp_mux_macro__mux_aope__ports_2__stack_2c__width_1 thr6_cntx_1_parity_mux  (
 .din0( prty_ctxt),                   // new parity 
 .din1( thr6_cntx_1[13]),            // Hold the old value 
 .sel0( agc_thr6_cntx_1_sel_ff),
 .dout( thr6_prty_ctx_1                               ));
///////////////////////////////////////////////////////////////////////
// Thr7                                                              //
///////////////////////////////////////////////////////////////////////
ifu_ftu_ctx_dp_mux_macro__mux_aope__ports_2__stack_2c__width_1 thr7_cntx_0_parity_mux  (
 .din0( prty_ctxt),                   // new parity 
 .din1( thr7_cntx_0[13]),           // Hold the old value 
 .sel0( agc_thr7_cntx_0_sel_ff),
 .dout( thr7_prty_ctx_0                               ));

ifu_ftu_ctx_dp_mux_macro__mux_aope__ports_2__stack_2c__width_1 thr7_cntx_1_parity_mux  (
 .din0( prty_ctxt),                   // new parity 
 .din1( thr7_cntx_1[13]),            // Hold the old value 
 .sel0( agc_thr7_cntx_1_sel_ff),
 .dout( thr7_prty_ctx_1                               ));

////////////////////////////////////////////////
// Thread 0 context muxing                    //
////////////////////////////////////////////////
ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_2__stack_14c__width_14 thr0_cntx_0_mux  (
 .din0( {1'b0 ,lsu_ifu_ctxt_data[12:0]}),      // new context from lsu
 .din1( {thr0_prty_ctx_0, thr0_cntx_0[12:0]}),           // Hold the old context 
 .sel0( agc_thr0_cntx_0_sel[0]),
 .sel1( agc_thr0_cntx_0_sel[1]),
 .dout( next_thr0_cnxt_0_data[13:0]                               ));

ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_2__stack_14c__width_14 thr0_cntx_1_mux  (
 .din0( {1'b0,lsu_ifu_ctxt_data[12:0]}),      // new context from lsu
 .din1( {thr0_prty_ctx_1, thr0_cntx_1[12:0]}),           // Hold the old context 
 .sel0( agc_thr0_cntx_1_sel[0]),
 .sel1( agc_thr0_cntx_1_sel[1]),
 .dout( next_thr0_cnxt_1_data[13:0]                               ));

////////////////////////////////////////////////
// Thread 1 context muxing                    //
////////////////////////////////////////////////
ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_2__stack_14c__width_14 thr1_cntx_0_mux  (
 .din0( {1'b0,lsu_ifu_ctxt_data[12:0]}),      // new context from lsu
 .din1( {thr1_prty_ctx_0, thr1_cntx_0[12:0]}),           // Hold the old context 
 .sel0( agc_thr1_cntx_0_sel[0]),
 .sel1( agc_thr1_cntx_0_sel[1]),
 .dout( next_thr1_cnxt_0_data[13:0]                               ));

ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_2__stack_14c__width_14 thr1_cntx_1_mux  (
 .din0( {1'b0,lsu_ifu_ctxt_data[12:0]}),      // new context from lsu
 .din1( {thr1_prty_ctx_1, thr1_cntx_1[12:0]}),           // Hold the old context 
 .sel0( agc_thr1_cntx_1_sel[0]),
 .sel1( agc_thr1_cntx_1_sel[1]),
 .dout( next_thr1_cnxt_1_data[13:0]                               ));


////////////////////////////////////////////////
// Thread 2 context muxing                    //
////////////////////////////////////////////////
ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_2__stack_14c__width_14 thr2_cntx_0_mux  (
 .din0( {1'b0,lsu_ifu_ctxt_data[12:0]}),      // new context from lsu
 .din1( {thr2_prty_ctx_0, thr2_cntx_0[12:0]}),           // Hold the old context 
 .sel0( agc_thr2_cntx_0_sel[0]),
 .sel1( agc_thr2_cntx_0_sel[1]),
 .dout( next_thr2_cnxt_0_data[13:0]                               ));

ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_2__stack_14c__width_14 thr2_cntx_1_mux  (
 .din0( {1'b0,lsu_ifu_ctxt_data[12:0]}),      // new context from lsu
 .din1( {thr2_prty_ctx_1, thr2_cntx_1[12:0]}),           // Hold the old context 
 .sel0( agc_thr2_cntx_1_sel[0]),
 .sel1( agc_thr2_cntx_1_sel[1]),
 .dout( next_thr2_cnxt_1_data[13:0]                               ));

////////////////////////////////////////////////
// Thread 3 context muxing                    //
////////////////////////////////////////////////
ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_2__stack_14c__width_14 thr3_cntx_0_mux  (
 .din0( {1'b0,lsu_ifu_ctxt_data[12:0]}),      // new context from lsu
 .din1( {thr3_prty_ctx_0, thr3_cntx_0[12:0]}),           // Hold the old context 
 .sel0( agc_thr3_cntx_0_sel[0]),
 .sel1( agc_thr3_cntx_0_sel[1]),
 .dout( next_thr3_cnxt_0_data[13:0]                               ));

ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_2__stack_14c__width_14 thr3_cntx_1_mux  (
 .din0( {1'b0,lsu_ifu_ctxt_data[12:0]}),      // new context from lsu
 .din1( {thr3_prty_ctx_1, thr3_cntx_1[12:0]}),           // Hold the old context 
 .sel0( agc_thr3_cntx_1_sel[0]),
 .sel1( agc_thr3_cntx_1_sel[1]),
 .dout( next_thr3_cnxt_1_data[13:0]                               ));

////////////////////////////////////////////////
// Thread 4 context muxing                    //
////////////////////////////////////////////////
ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_2__stack_14c__width_14 thr4_cntx_0_mux  (
 .din0( {1'b0,lsu_ifu_ctxt_data[12:0]}),      // new context from lsu
 .din1( {thr4_prty_ctx_0, thr4_cntx_0[12:0]}),           // Hold the old context 
 .sel0( agc_thr4_cntx_0_sel[0]),
 .sel1( agc_thr4_cntx_0_sel[1]),
 .dout( next_thr4_cnxt_0_data[13:0]                               ));

ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_2__stack_14c__width_14 thr4_cntx_1_mux  (
 .din0( {1'b0,lsu_ifu_ctxt_data[12:0]}),      // new context from lsu
 .din1( {thr4_prty_ctx_1, thr4_cntx_1[12:0]}),           // Hold the old context 
 .sel0( agc_thr4_cntx_1_sel[0]),
 .sel1( agc_thr4_cntx_1_sel[1]),
 .dout( next_thr4_cnxt_1_data[13:0]                               ));

////////////////////////////////////////////////
// Thread 5 context muxing                    //
////////////////////////////////////////////////
ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_2__stack_14c__width_14 thr5_cntx_0_mux  (
 .din0( {1'b0,lsu_ifu_ctxt_data[12:0]}),      // new context from lsu
 .din1( {thr5_prty_ctx_0, thr5_cntx_0[12:0]}),           // Hold the old context 
 .sel0( agc_thr5_cntx_0_sel[0]),
 .sel1( agc_thr5_cntx_0_sel[1]),
 .dout( next_thr5_cnxt_0_data[13:0]                               ));

ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_2__stack_14c__width_14 thr5_cntx_1_mux  (
 .din0( {1'b0,lsu_ifu_ctxt_data[12:0]}),      // new context from lsu
 .din1( {thr5_prty_ctx_1, thr5_cntx_1[12:0]}),           // Hold the old context 
 .sel0( agc_thr5_cntx_1_sel[0]),
 .sel1( agc_thr5_cntx_1_sel[1]),
 .dout( next_thr5_cnxt_1_data[13:0]                               ));


////////////////////////////////////////////////
// Thread 6 context muxing                    //
////////////////////////////////////////////////
ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_2__stack_14c__width_14 thr6_cntx_0_mux  (
 .din0( {1'b0,lsu_ifu_ctxt_data[12:0]}),      // new context from lsu
 .din1( {thr6_prty_ctx_0, thr6_cntx_0[12:0]}),           // Hold the old context 
 .sel0( agc_thr6_cntx_0_sel[0]),
 .sel1( agc_thr6_cntx_0_sel[1]),
 .dout( next_thr6_cnxt_0_data[13:0]                               ));

ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_2__stack_14c__width_14 thr6_cntx_1_mux  (
 .din0( {1'b0,lsu_ifu_ctxt_data[12:0]}),      // new context from lsu
 .din1( {thr6_prty_ctx_1, thr6_cntx_1[12:0]}),           // Hold the old context 
 .sel0( agc_thr6_cntx_1_sel[0]),
 .sel1( agc_thr6_cntx_1_sel[1]),
 .dout( next_thr6_cnxt_1_data[13:0]                               ));

////////////////////////////////////////////////
// Thread 7 context muxing                    //
////////////////////////////////////////////////
ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_2__stack_14c__width_14 thr7_cntx_0_mux  (
 .din0( {1'b0,lsu_ifu_ctxt_data[12:0]}),      // new context from lsu
 .din1( {thr7_prty_ctx_0, thr7_cntx_0[12:0]}),           // Hold the old context 
 .sel0( agc_thr7_cntx_0_sel[0]),
 .sel1( agc_thr7_cntx_0_sel[1]),
 .dout( next_thr7_cnxt_0_data[13:0]                               ));

ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_2__stack_14c__width_14 thr7_cntx_1_mux  (
 .din0( {1'b0,lsu_ifu_ctxt_data[12:0]}),      // new context from lsu
 .din1( {thr7_prty_ctx_1, thr7_cntx_1[12:0]}),           // Hold the old context 
 .sel0( agc_thr7_cntx_1_sel[0]),
 .sel1( agc_thr7_cntx_1_sel[1]),
 .dout( next_thr7_cnxt_1_data[13:0]                               ));

///////////////////////////////////////////////////////////////////////
// Context registers                                                 //
///////////////////////////////////////////////////////////////////////
////////////////////////////////////
// Thread 0 context registers     //
////////////////////////////////////
ifu_ftu_ctx_dp_msff_macro__stack_14c__width_14 thr0_cntx_0_reg  ( // FS:wmr_protect
 .scan_in(thr0_cntx_0_reg_wmr_scanin),
 .scan_out(thr0_cntx_0_reg_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( next_thr0_cnxt_0_data[13:0]),
 .dout( thr0_cntx_0[13:0]     ),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// assign thr0_cntx_0_q[13:0] = thr0_cntx_0[13:0] & {13{~gt_t_zero[0]}} ;

ifu_ftu_ctx_dp_nand_macro__ports_2__stack_14c__width_8 gt_z_nand    (
 .din0(gt_t_zero[7:0]),
 .din1({8{ftp_itlb_probe_req_l}}),
 .dout(ctx_gt_zero_0_[7:0])
);

ifu_ftu_ctx_dp_and_macro__ports_2__stack_14c__width_13 thr0_cntx_0_and    (
 .din0({13{ctx_gt_zero_0_[0]}}),
 .din1(thr0_cntx_0[12:0]),
 .dout(thr0_cntx_0_q[12:0])
);



ifu_ftu_ctx_dp_msff_macro__stack_14c__width_14 thr0_cntx_1_reg  (   // FS:wmr_protect
 .scan_in(thr0_cntx_1_reg_wmr_scanin),
 .scan_out(thr0_cntx_1_reg_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( next_thr0_cnxt_1_data[13:0]),
 .dout( thr0_cntx_1[13:0]     ),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


ifu_ftu_ctx_dp_and_macro__ports_2__stack_14c__width_13 thr0_cntx_1_and    (
 .din0({13{ctx_gt_zero_0_[0]}}),
 .din1(thr0_cntx_1[12:0]),
 .dout(thr0_cntx_1_q[12:0])
);


// assign thr0_cntx_1_q[13:0] = thr0_cntx_1[13:0] & {13{~gt_t_zero[0]}} ;

////////////////////////////////////
// Thread 1 context registers     //
////////////////////////////////////
ifu_ftu_ctx_dp_msff_macro__stack_14c__width_14 thr1_cntx_0_reg  (   // FS:wmr_protect
 .scan_in(thr1_cntx_0_reg_wmr_scanin),
 .scan_out(thr1_cntx_0_reg_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( next_thr1_cnxt_0_data[13:0]),
 .dout( thr1_cntx_0[13:0]     ),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// assign thr1_cntx_0_q[13:0] = thr1_cntx_0[13:0] & {13{~gt_t_zero[1]}} ;


ifu_ftu_ctx_dp_and_macro__ports_2__stack_14c__width_13 thr1_cntx_0_and    (
 .din0({13{ctx_gt_zero_0_[1]}}),
 .din1(thr1_cntx_0[12:0]),
 .dout(thr1_cntx_0_q[12:0])
);


ifu_ftu_ctx_dp_msff_macro__stack_14c__width_14 thr1_cntx_1_reg  (   // FS:wmr_protect
 .scan_in(thr1_cntx_1_reg_wmr_scanin),
 .scan_out(thr1_cntx_1_reg_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( next_thr1_cnxt_1_data[13:0]),
 .dout( thr1_cntx_1[13:0]     ),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// assign thr1_cntx_1_q[13:0] = thr1_cntx_1[13:0] & {13{~gt_t_zero[1]}} ;

ifu_ftu_ctx_dp_and_macro__ports_2__stack_14c__width_13 thr1_cntx_1_and    (
 .din0({13{ctx_gt_zero_0_[1]}}),
 .din1(thr1_cntx_1[12:0]),
 .dout(thr1_cntx_1_q[12:0])
);


////////////////////////////////////
// Thread 2 context registers     //
////////////////////////////////////
ifu_ftu_ctx_dp_msff_macro__stack_14c__width_14 thr2_cntx_0_reg  (   // FS:wmr_protect
 .scan_in(thr2_cntx_0_reg_wmr_scanin),
 .scan_out(thr2_cntx_0_reg_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( next_thr2_cnxt_0_data[13:0]),
 .dout( thr2_cntx_0[13:0]     ),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// assign thr2_cntx_0_q[13:0] = thr2_cntx_0[13:0] & {13{~gt_t_zero[2]}} ;

ifu_ftu_ctx_dp_and_macro__ports_2__stack_14c__width_13 thr2_cntx_0_and    (
 .din0({13{ctx_gt_zero_0_[2]}}),
 .din1(thr2_cntx_0[12:0]),
 .dout(thr2_cntx_0_q[12:0])
);

ifu_ftu_ctx_dp_msff_macro__stack_14c__width_14 thr2_cntx_1_reg  (   // FS:wmr_protect
 .scan_in(thr2_cntx_1_reg_wmr_scanin),
 .scan_out(thr2_cntx_1_reg_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( next_thr2_cnxt_1_data[13:0]),
 .dout( thr2_cntx_1[13:0]     ),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// assign thr2_cntx_1_q[13:0] = thr2_cntx_1[13:0] & {13{~gt_t_zero[2]}} ;

ifu_ftu_ctx_dp_and_macro__ports_2__stack_14c__width_13 thr2_cntx_1_and    (
 .din0({13{ctx_gt_zero_0_[2]}}),
 .din1(thr2_cntx_1[12:0]),
 .dout(thr2_cntx_1_q[12:0])
);


////////////////////////////////////
// Thread 3 context registers     //
////////////////////////////////////
ifu_ftu_ctx_dp_msff_macro__stack_14c__width_14 thr3_cntx_0_reg  (   // FS:wmr_protect
 .scan_in(thr3_cntx_0_reg_wmr_scanin),
 .scan_out(thr3_cntx_0_reg_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( next_thr3_cnxt_0_data[13:0]),
 .dout( thr3_cntx_0[13:0]     ),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// assign thr3_cntx_0_q[13:0] = thr3_cntx_0[13:0] & {13{~gt_t_zero[3]}} ;

ifu_ftu_ctx_dp_and_macro__ports_2__stack_14c__width_13 thr3_cntx_0_and    (
 .din0({13{ctx_gt_zero_0_[3]}}),
 .din1(thr3_cntx_0[12:0]),
 .dout(thr3_cntx_0_q[12:0])
);


ifu_ftu_ctx_dp_msff_macro__stack_14c__width_14 thr3_cntx_1_reg  (   // FS:wmr_protect
 .scan_in(thr3_cntx_1_reg_wmr_scanin),
 .scan_out(thr3_cntx_1_reg_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( next_thr3_cnxt_1_data[13:0]),
 .dout( thr3_cntx_1[13:0]     ),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// assign thr3_cntx_1_q[13:0] = thr3_cntx_1[13:0] & {13{~gt_t_zero[3]}} ;

ifu_ftu_ctx_dp_and_macro__ports_2__stack_14c__width_13 thr3_cntx_1_and    (
 .din0({13{ctx_gt_zero_0_[3]}}),
 .din1(thr3_cntx_1[12:0]),
 .dout(thr3_cntx_1_q[12:0])
);


////////////////////////////////////
// Thread 4 context registers     //
////////////////////////////////////
ifu_ftu_ctx_dp_msff_macro__stack_14c__width_14 thr4_cntx_0_reg  (   // FS:wmr_protect
 .scan_in(thr4_cntx_0_reg_wmr_scanin),
 .scan_out(thr4_cntx_0_reg_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( next_thr4_cnxt_0_data[13:0]),
 .dout( thr4_cntx_0[13:0]     ),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// assign thr4_cntx_0_q[13:0] = thr4_cntx_0[13:0] & {13{~gt_t_zero[4]}} ;

ifu_ftu_ctx_dp_and_macro__ports_2__stack_14c__width_13 thr4_cntx_0_and    (
 .din0({13{ctx_gt_zero_0_[4]}}),
 .din1(thr4_cntx_0[12:0]),
 .dout(thr4_cntx_0_q[12:0])
);


ifu_ftu_ctx_dp_msff_macro__stack_14c__width_14 thr4_cntx_1_reg  (   // FS:wmr_protect
 .scan_in(thr4_cntx_1_reg_wmr_scanin),
 .scan_out(thr4_cntx_1_reg_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( next_thr4_cnxt_1_data[13:0]),
 .dout( thr4_cntx_1[13:0]     ),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// assign thr4_cntx_1_q[13:0] = thr4_cntx_1[13:0] & {13{~gt_t_zero[4]}} ;

ifu_ftu_ctx_dp_and_macro__ports_2__stack_14c__width_13 thr4_cntx_1_and    (
 .din0({13{ctx_gt_zero_0_[4]}}),
 .din1(thr4_cntx_1[12:0]),
 .dout(thr4_cntx_1_q[12:0])
);


////////////////////////////////////
// Thread 5 context registers     //
////////////////////////////////////
ifu_ftu_ctx_dp_msff_macro__stack_14c__width_14 thr5_cntx_0_reg  (   // FS:wmr_protect
 .scan_in(thr5_cntx_0_reg_wmr_scanin),
 .scan_out(thr5_cntx_0_reg_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( next_thr5_cnxt_0_data[13:0]),
 .dout( thr5_cntx_0[13:0]     ),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// assign thr5_cntx_0_q[13:0] = thr5_cntx_0[13:0] & {13{~gt_t_zero[5]}} ;

ifu_ftu_ctx_dp_and_macro__ports_2__stack_14c__width_13 thr5_cntx_0_and    (
 .din0({13{ctx_gt_zero_0_[5]}}),
 .din1(thr5_cntx_0[12:0]),
 .dout(thr5_cntx_0_q[12:0])
);


ifu_ftu_ctx_dp_msff_macro__stack_14c__width_14 thr5_cntx_1_reg  (   // FS:wmr_protect
 .scan_in(thr5_cntx_1_reg_wmr_scanin),
 .scan_out(thr5_cntx_1_reg_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( next_thr5_cnxt_1_data[13:0]),
 .dout( thr5_cntx_1[13:0]     ),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// assign thr5_cntx_1_q[13:0] = thr5_cntx_1[13:0] & {13{~gt_t_zero[5]}} ;

ifu_ftu_ctx_dp_and_macro__ports_2__stack_14c__width_13 thr5_cntx_1_and    (
 .din0({13{ctx_gt_zero_0_[5]}}),
 .din1(thr5_cntx_1[12:0]),
 .dout(thr5_cntx_1_q[12:0])
);


////////////////////////////////////
// Thread 6 context registers     //
////////////////////////////////////
ifu_ftu_ctx_dp_msff_macro__stack_14c__width_14 thr6_cntx_0_reg  (   // FS:wmr_protect
 .scan_in(thr6_cntx_0_reg_wmr_scanin),
 .scan_out(thr6_cntx_0_reg_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( next_thr6_cnxt_0_data[13:0]),
 .dout( thr6_cntx_0[13:0]     ),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// assign thr6_cntx_0_q[13:0] = thr6_cntx_0[13:0] & {13{~gt_t_zero[6]}} ;

ifu_ftu_ctx_dp_and_macro__ports_2__stack_14c__width_13 thr6_cntx_0_and    (
 .din0({13{ctx_gt_zero_0_[6]}}),
 .din1(thr6_cntx_0[12:0]),
 .dout(thr6_cntx_0_q[12:0])
);


ifu_ftu_ctx_dp_msff_macro__stack_14c__width_14 thr6_cntx_1_reg  (   // FS:wmr_protect
 .scan_in(thr6_cntx_1_reg_wmr_scanin),
 .scan_out(thr6_cntx_1_reg_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( next_thr6_cnxt_1_data[13:0]),
 .dout( thr6_cntx_1[13:0]     ),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// assign thr6_cntx_1_q[13:0] = thr6_cntx_1[13:0] & {13{~gt_t_zero[6]}} ;

ifu_ftu_ctx_dp_and_macro__ports_2__stack_14c__width_13 thr6_cntx_1_and    (
 .din0({13{ctx_gt_zero_0_[6]}}),
 .din1(thr6_cntx_1[12:0]),
 .dout(thr6_cntx_1_q[12:0])
);


////////////////////////////////////
// Thread 7 context registers     //
////////////////////////////////////
ifu_ftu_ctx_dp_msff_macro__stack_14c__width_14 thr7_cntx_0_reg  (   // FS:wmr_protect
 .scan_in(thr7_cntx_0_reg_wmr_scanin),
 .scan_out(thr7_cntx_0_reg_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( next_thr7_cnxt_0_data[13:0]),
 .dout( thr7_cntx_0[13:0]     ),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// assign thr7_cntx_0_q[13:0] = thr7_cntx_0[13:0] & {13{~gt_t_zero[7]}} ;

ifu_ftu_ctx_dp_and_macro__ports_2__stack_14c__width_13 thr7_cntx_0_and    (
 .din0({13{ctx_gt_zero_0_[7]}}),
 .din1(thr7_cntx_0[12:0]),
 .dout(thr7_cntx_0_q[12:0])
);


ifu_ftu_ctx_dp_msff_macro__stack_14c__width_14 thr7_cntx_1_reg  (   // FS:wmr_protect
 .scan_in(thr7_cntx_1_reg_wmr_scanin),
 .scan_out(thr7_cntx_1_reg_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .clk ( l2clk                ),
 .en  ( 1'b1                 ),  
 .din ( next_thr7_cnxt_1_data[13:0]),
 .dout( thr7_cntx_1[13:0]     ),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// assign thr7_cntx_1_q[13:0] = thr7_cntx_1[13:0] & {13{~gt_t_zero[7]}} ;

ifu_ftu_ctx_dp_and_macro__ports_2__stack_14c__width_13 thr7_cntx_1_and    (
 .din0({13{ctx_gt_zero_0_[7]}}),
 .din1(thr7_cntx_1[12:0]),
 .dout(thr7_cntx_1_q[12:0])
);


/////////////////////////////////////////////////////////////////////
// Mux out the current context for the thread currently in bf      //
/////////////////////////////////////////////////////////////////////


//buff_macro tst_mux_rep0 (width=1,dbuff=24x) (
// .din ( tcu_muxtest     ),
//.dout( tcu_muxtest_rep0     ));



ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_8__stack_14c__width_13 curr_cntx_0_mux  (
 .din0( thr0_cntx_0_q[12:0]),           // 
 .din1( thr1_cntx_0_q[12:0]),           // 
 .din2( thr2_cntx_0_q[12:0]),           // 
 .din3( thr3_cntx_0_q[12:0]),           // 
 .din4( thr4_cntx_0_q[12:0]),           // 
 .din5( thr5_cntx_0_q[12:0]),           // 
 .din6( thr6_cntx_0_q[12:0]),           // 
 .din7( thr7_cntx_0_q[12:0]),           // 
// .muxtst (tcu_muxtest_rep0),
 .sel0( ftp_itb_fetch_thr_bf[0]),
 .sel1( ftp_itb_fetch_thr_bf[1]),
 .sel2( ftp_itb_fetch_thr_bf[2]),
 .sel3( ftp_itb_fetch_thr_bf[3]),
 .sel4( ftp_itb_fetch_thr_bf[4]),
 .sel5( ftp_itb_fetch_thr_bf[5]),
 .sel6( ftp_itb_fetch_thr_bf[6]),
 .sel7( ftp_itb_fetch_thr_bf[7]),
 .dout( ctx_curr_cntx_0_to_buf[12:0]                               ));

 ifu_ftu_ctx_dp_buff_macro__stack_14c__width_13 curr_cntx_0_buff   (
   .din(ctx_curr_cntx_0_to_buf[12:0]),
   .dout(ctx_curr_cntx_0_bf[12:0]));
//assign ctx_curr_cntx_0_bf[13:0] = ctx_curr_cntx_0_to_buf[13:0]  ;

// buff_macro tst_mux_rep1 (width=1,dbuff=24x) (
//  .din ( tcu_muxtest     ),
//  .dout( tcu_muxtest_rep1     ));

ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_8__stack_14c__width_13 curr_cntx_1_mux  (
 .din0( thr0_cntx_1_q[12:0]),           // 
 .din1( thr1_cntx_1_q[12:0]),           // 
 .din2( thr2_cntx_1_q[12:0]),           // 
 .din3( thr3_cntx_1_q[12:0]),           // 
 .din4( thr4_cntx_1_q[12:0]),           // 
 .din5( thr5_cntx_1_q[12:0]),           // 
 .din6( thr6_cntx_1_q[12:0]),           // 
 .din7( thr7_cntx_1_q[12:0]),           // 
// .muxtst (tcu_muxtest_rep1),
 .sel0( ftp_itb_fetch_thr_bf[0]),
 .sel1( ftp_itb_fetch_thr_bf[1]),
 .sel2( ftp_itb_fetch_thr_bf[2]),
 .sel3( ftp_itb_fetch_thr_bf[3]),
 .sel4( ftp_itb_fetch_thr_bf[4]),
 .sel5( ftp_itb_fetch_thr_bf[5]),
 .sel6( ftp_itb_fetch_thr_bf[6]),
 .sel7( ftp_itb_fetch_thr_bf[7]),
 .dout( ctx_curr_cntx_1_to_buf[12:0]                               ));

ifu_ftu_ctx_dp_buff_macro__stack_14c__width_13 curr_cntx_1_buff   (
   .din(ctx_curr_cntx_1_to_buf[12:0]),
   .dout(ctx_curr_cntx_1_bf[12:0]));

// assign ctx_curr_cntx_1_bf[12:0] = ctx_curr_cntx_1_to_buf[12:0]  ;

/////////////////////////////////////////////////////////////////////
// Mux out the context to_write                                    //
/////////////////////////////////////////////////////////////////////
ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_8__stack_14c__width_14 cntx_0_to_write_mux  (
 .din0( thr0_cntx_0[13:0]),           // 
 .din1( thr1_cntx_0[13:0]),           // 
 .din2( thr2_cntx_0[13:0]),           // 
 .din3( thr3_cntx_0[13:0]),           // 
 .din4( thr4_cntx_0[13:0]),           // 
 .din5( thr5_cntx_0[13:0]),           // 
 .din6( thr6_cntx_0[13:0]),           // 
 .din7( thr7_cntx_0[13:0]),           // 
 .sel0( itc_thr_to_write[0]),
 .sel1( itc_thr_to_write[1]),
 .sel2( itc_thr_to_write[2]),
 .sel3( itc_thr_to_write[3]),
 .sel4( itc_thr_to_write[4]),
 .sel5( itc_thr_to_write[5]),
 .sel6( itc_thr_to_write[6]),
 .sel7( itc_thr_to_write[7]),
 .dout( ctx_cntx_0_to_write_to_buf[13:0]                               ));

ifu_ftu_ctx_dp_buff_macro__stack_14c__width_14 cntx_0_to_write_buf   (
  .din(ctx_cntx_0_to_write_to_buf[13:0]),
  .dout(ctx_cntx_0_to_write_bf[13:0]));

ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_8__stack_14c__width_14 cntx_1_to_write_mux  (
 .din0( thr0_cntx_1[13:0]),           // 
 .din1( thr1_cntx_1[13:0]),           // 
 .din2( thr2_cntx_1[13:0]),           // 
 .din3( thr3_cntx_1[13:0]),           // 
 .din4( thr4_cntx_1[13:0]),           // 
 .din5( thr5_cntx_1[13:0]),           // 
 .din6( thr6_cntx_1[13:0]),           // 
 .din7( thr7_cntx_1[13:0]),           // 
 .sel0( itc_thr_to_write[0]),
 .sel1( itc_thr_to_write[1]),
 .sel2( itc_thr_to_write[2]),
 .sel3( itc_thr_to_write[3]),
 .sel4( itc_thr_to_write[4]),
 .sel5( itc_thr_to_write[5]),
 .sel6( itc_thr_to_write[6]),
 .sel7( itc_thr_to_write[7]),
 .dout( ctx_cntx_1_to_write_to_buf[13:0]                               ));

ifu_ftu_ctx_dp_buff_macro__stack_14c__width_14 cntx_1_to_write_buf   (
  .din(ctx_cntx_1_to_write_to_buf[13:0]),
  .dout(ctx_cntx_1_to_write_bf[13:0]));


// assign se = tcu_scan_en ;
// fixscan start:
assign tlu_tl_gt_0_reg_scanin    = scan_in                  ;
assign lsu_ifu_data_reg_scanin   = tlu_tl_gt_0_reg_scanout  ;
assign scan_out                  = lsu_ifu_data_reg_scanout ;

assign thr0_cntx_0_reg_wmr_scanin = wmr_scan_in              ;
assign thr0_cntx_1_reg_wmr_scanin = thr0_cntx_0_reg_wmr_scanout;
assign thr1_cntx_0_reg_wmr_scanin = thr0_cntx_1_reg_wmr_scanout;
assign thr1_cntx_1_reg_wmr_scanin = thr1_cntx_0_reg_wmr_scanout;
assign thr2_cntx_0_reg_wmr_scanin = thr1_cntx_1_reg_wmr_scanout;
assign thr2_cntx_1_reg_wmr_scanin = thr2_cntx_0_reg_wmr_scanout;
assign thr3_cntx_0_reg_wmr_scanin = thr2_cntx_1_reg_wmr_scanout;
assign thr3_cntx_1_reg_wmr_scanin = thr3_cntx_0_reg_wmr_scanout;
assign thr4_cntx_0_reg_wmr_scanin = thr3_cntx_1_reg_wmr_scanout;
assign thr4_cntx_1_reg_wmr_scanin = thr4_cntx_0_reg_wmr_scanout;
assign thr5_cntx_0_reg_wmr_scanin = thr4_cntx_1_reg_wmr_scanout;
assign thr5_cntx_1_reg_wmr_scanin = thr5_cntx_0_reg_wmr_scanout;
assign thr6_cntx_0_reg_wmr_scanin = thr5_cntx_1_reg_wmr_scanout;
assign thr6_cntx_1_reg_wmr_scanin = thr6_cntx_0_reg_wmr_scanout;
assign thr7_cntx_0_reg_wmr_scanin = thr6_cntx_1_reg_wmr_scanout;
assign thr7_cntx_1_reg_wmr_scanin = thr7_cntx_0_reg_wmr_scanout;
assign wmr_scan_out              = thr7_cntx_1_reg_wmr_scanout;
// fixscan end:
endmodule



//
//   buff macro
//
//





module ifu_ftu_ctx_dp_buff_macro__dbuff_32x__stack_none__width_4 (
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

module ifu_ftu_ctx_dp_msff_macro__stack_14c__width_8 (
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





module ifu_ftu_ctx_dp_buff_macro__stack_14c__width_8 (
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

module ifu_ftu_ctx_dp_msff_macro__stack_14c__width_13 (
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









//
//   parity macro (even parity)
//
//





module ifu_ftu_ctx_dp_prty_macro__width_16 (
  din, 
  dout);
  input [15:0] din;
  output dout;







prty #(16)  m0_0 (
.in(din[15:0]),
.out(dout)
);










endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_ctx_dp_mux_macro__mux_aope__ports_2__stack_2c__width_1 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [0:0] din0;
  input [0:0] din1;
  input sel0;
  output [0:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(1)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[0:0]),
  .in1(din1[0:0]),
.dout(dout[0:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_2__stack_14c__width_14 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [13:0] din0;
  input sel0;
  input [13:0] din1;
  input sel1;
  output [13:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(14)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[13:0]),
  .in1(din1[13:0]),
.dout(dout[13:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module ifu_ftu_ctx_dp_msff_macro__stack_14c__width_14 (
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









//
//   nand macro for ports = 2,3,4
//
//





module ifu_ftu_ctx_dp_nand_macro__ports_2__stack_14c__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output [7:0] dout;






nand2 #(8)  d0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout[7:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module ifu_ftu_ctx_dp_and_macro__ports_2__stack_14c__width_13 (
  din0, 
  din1, 
  dout);
  input [12:0] din0;
  input [12:0] din1;
  output [12:0] dout;






and2 #(13)  d0_0 (
.in0(din0[12:0]),
.in1(din1[12:0]),
.out(dout[12:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_8__stack_14c__width_13 (
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

  input [12:0] din0;
  input sel0;
  input [12:0] din1;
  input sel1;
  input [12:0] din2;
  input sel2;
  input [12:0] din3;
  input sel3;
  input [12:0] din4;
  input sel4;
  input [12:0] din5;
  input sel5;
  input [12:0] din6;
  input sel6;
  input [12:0] din7;
  input sel7;
  output [12:0] dout;





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
mux8s #(13)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
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





module ifu_ftu_ctx_dp_buff_macro__stack_14c__width_13 (
  din, 
  dout);
  input [12:0] din;
  output [12:0] dout;






buff #(13)  d0_0 (
.in(din[12:0]),
.out(dout[12:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_ftu_ctx_dp_mux_macro__mux_aonpe__ports_8__stack_14c__width_14 (
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

  input [13:0] din0;
  input sel0;
  input [13:0] din1;
  input sel1;
  input [13:0] din2;
  input sel2;
  input [13:0] din3;
  input sel3;
  input [13:0] din4;
  input sel4;
  input [13:0] din5;
  input sel5;
  input [13:0] din6;
  input sel6;
  input [13:0] din7;
  input sel7;
  output [13:0] dout;





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
mux8s #(14)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[13:0]),
  .in1(din1[13:0]),
  .in2(din2[13:0]),
  .in3(din3[13:0]),
  .in4(din4[13:0]),
  .in5(din5[13:0]),
  .in6(din6[13:0]),
  .in7(din7[13:0]),
.dout(dout[13:0])
);









  



endmodule


//
//   buff macro
//
//





module ifu_ftu_ctx_dp_buff_macro__stack_14c__width_14 (
  din, 
  dout);
  input [13:0] din;
  output [13:0] dout;






buff #(14)  d0_0 (
.in(din[13:0]),
.out(dout[13:0])
);








endmodule




