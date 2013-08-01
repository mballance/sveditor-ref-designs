// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_niu_dp_512x152s_cust.v
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
module n2_niu_dp_512x152s_cust (
  reset, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  tcu_pce_ov, 
  pce, 
  tcu_array_wr_inhibit, 
  scan_in, 
  scan_out, 
  hdr_sram_rvalue, 
  hdr_sram_rid, 
  hdr_sram_wr_en, 
  hdr_sram_red_clr, 
  sram_hdr_read_data, 
  wr_adr, 
  wr_en, 
  rd_adr, 
  rd_en, 
  din, 
  dout, 
  l2clk_2x, 
  l2clk);
wire array_scan_out;
 

input                   reset;
input                   tcu_aclk;
input                   tcu_bclk;
input                   tcu_scan_en;
input                   tcu_se_scancollar_in;
input                   tcu_se_scancollar_out;
input                   tcu_pce_ov;
input                   pce;
input                   tcu_array_wr_inhibit;
input                   scan_in;
output                  scan_out;

input             [6:0] hdr_sram_rvalue;
input             [1:0] hdr_sram_rid;
input                   hdr_sram_wr_en;
input                   hdr_sram_red_clr;
output            [6:0] sram_hdr_read_data;

input             [8:0] wr_adr;
input                   wr_en;
input             [8:0] rd_adr;
input                   rd_en;
input           [151:0] din;
output          [151:0] dout;
input                   l2clk_2x;
input                   l2clk;

wire            [151:0] dout;
wire              [6:0] sram_hdr_read_data;
wire              [6:0] hdr_sram_rvalue;
wire              [1:0] hdr_sram_rid;
wire              [8:0] wr_adr;
wire              [8:0] rd_adr;
wire            [151:0] din;







wire              [5:0] red_value_b0;      // to subbank
wire              [5:0] red_value_b1;
wire              [5:0] red_value_b2;
wire              [5:0] red_value_b3;
wire              	repair_en_b0;
wire              	repair_en_b1;
wire              	repair_en_b2;
wire              	repair_en_b3;

wire                    scan_in_repair;
wire                    scan_out_repair;

  n2_niu_dp_512x152s_bank niu_dp_512x152s_bank_0 (
                        .reset                  (reset),
                        .tcu_aclk               (tcu_aclk),
                        .tcu_bclk               (tcu_bclk),
                        .pce                    (pce),
                        .tcu_pce_ov             (tcu_pce_ov),
                        .tcu_scan_en            (tcu_scan_en),
                        .tcu_se_scancollar_in   (tcu_se_scancollar_in),
                        .tcu_array_wr_inhibit   (tcu_array_wr_inhibit),
                        .l2clk                  (l2clk),
                        .l2clk_2x               (l2clk_2x),
                        .wr_adr                 (wr_adr),
                        .wr_en                  (wr_en),
                        .rd_adr                 (rd_adr),
                        .rd_en                  (rd_en),
                        .din                    (din),
                        .scan_in                (scan_in),
                        .scan_out               (array_scan_out),
                        .red_v_br               (red_value_b0),
                        .red_v_bl               (red_value_b1),
                        .red_v_tr               (red_value_b2),
                        .red_v_tl               (red_value_b3),
                        .red_en_br              (repair_en_b0),
                        .red_en_bl              (repair_en_b1),
                        .red_en_tr              (repair_en_b2),
                        .red_en_tl              (repair_en_b3),
                        .dout                   (dout)
                       );


  n2_niu_dp_512x152s_repair niu_dp_512x152s_repair_0 (
                        .aclk                   (tcu_aclk),
                        .bclk                   (tcu_bclk),
                        .pce                    (pce),
                        .tcu_pce_ov             (tcu_pce_ov),
                        .tcu_scan_en            (tcu_scan_en),
                        .tcu_se_scancollar_in   (tcu_se_scancollar_in),
                        .tcu_se_scancollar_out  (tcu_se_scancollar_out),
                        .tcu_array_wr_inhibit   (tcu_array_wr_inhibit),
                        .scanin_red             (array_scan_out),
                        .hdr_sram_rvalue        (hdr_sram_rvalue),
                        .hdr_sram_rid           (hdr_sram_rid),
                        .hdr_sram_wr_en         (hdr_sram_wr_en),
                        .hdr_sram_red_clr       (hdr_sram_red_clr),
                        .l2clk                  (l2clk),
                        .sram_hdr_read_data     (sram_hdr_read_data),
                        .red_v_br           	(red_value_b0),   // to subbank
                        .red_v_bl           	(red_value_b1),
                        .red_v_tr           	(red_value_b2),
                        .red_v_tl           	(red_value_b3),
                        .red_en_br           	(repair_en_b0),
                        .red_en_bl           	(repair_en_b1),
                        .red_en_tr           	(repair_en_b2),
                        .red_en_tl           	(repair_en_b3),
                        .scanout_red            (scan_out)
                       );




endmodule




module n2_niu_dp_512x152s_bank (
  reset, 
  din, 
  wr_adr, 
  rd_adr, 
  rd_en, 
  wr_en, 
  tcu_aclk, 
  tcu_bclk, 
  pce, 
  tcu_pce_ov, 
  tcu_scan_en, 
  tcu_se_scancollar_in, 
  tcu_array_wr_inhibit, 
  l2clk, 
  l2clk_2x, 
  scan_in, 
  red_v_br, 
  red_v_bl, 
  red_v_tr, 
  red_v_tl, 
  red_en_br, 
  red_en_bl, 
  red_en_tr, 
  red_en_tl, 
  dout, 
  scan_out);
wire l1clk_in_en;
wire l1clk_in;
wire l1clk_gate_en;
wire l1clk_gate;
wire [8:0] dff_wr_adr_m_scanout;
wire [8:0] dff_rd_adr_m_scanout;
wire dff_rd_en_m_scanin;
wire dff_rd_en_m_scanout;
wire dff_wr_en_m_scanin;
wire dff_wr_en_m_scanout;
wire test_mode;
wire dff_test_mode_scanin;
wire dff_test_mode_scanout;
wire test_clk;
wire dff_test_clk_scanin;
wire dff_test_clk_scanout;
wire do_A_read_2x_a;
wire do_B_write_2x_a;
wire [151:0] wdata_2x_b;
 

input                   reset;
input           [151:0] din;
input             [8:0] wr_adr;
input             [8:0] rd_adr;
input                   rd_en;
input                   wr_en;
input                   tcu_aclk;
input                   tcu_bclk;
input                   pce;
input                   tcu_pce_ov;
input                   tcu_scan_en;
input                   tcu_se_scancollar_in;
input                   tcu_array_wr_inhibit;
input                   l2clk;
input                   l2clk_2x;
input                   scan_in;

input		  [5:0] red_v_br;
input		  [5:0] red_v_bl;
input		  [5:0] red_v_tr;
input		  [5:0] red_v_tl;
input			red_en_br;
input			red_en_bl;
input			red_en_tr;
input			red_en_tl;

output          [151:0] dout;
output                  scan_out;



wire             [5:0] 	red_value_b0;
wire             [5:0] 	red_value_b1;
wire             [5:0] 	red_value_b2;
wire             [5:0] 	red_value_b3;
wire             [3:0] 	repair_en_bk;
wire            [151:0] dout;      //


// scan renames
// end scan

wire                    rd_en_a;
wire                    wr_en_a;
wire            [151:0] wdata_b;
wire              [8:0] addr_a;

wire                    wcs_a;

wire             [37:0] din_br;
wire             [37:0] din_tr;
wire             [37:0] din_bl;
wire             [37:0] din_tl;

wire            [151:0] rd_dout;

wire              [3:0] rd_en_column;
wire              [3:0] wt_en_column;

wire             [37:0] ary_rdout_br;
wire             [37:0] ary_rdout_tr;
wire             [37:0] ary_rdout_bl;
wire             [37:0] ary_rdout_tl;

wire siclk, soclk;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;


//=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=
//================================================
// l2 clock Domain: Clock headers
//================================================
//cl_sc1_l1hdr_8x l1ch_in (
//                              .l1clk       (l1clk_in),
//                              .l2clk       (l2clk),
//                              .se          (tcu_se_scancollar_in),
//                              .pce         (pce),
//                              .pce_ov      (tcu_pce_ov),
//                              .stop        (1'b0)
//                             );

//cl_sc1_l1hdr_8x l1ch_gate (
//                              .l1clk       (l1clk_gate),
//                              .l2clk       (l2clk),
//                              .se          (tcu_scan_en),
//                              .pce         (pce),
//                              .pce_ov      (tcu_pce_ov),
//                              .stop        (1'b0)
//                             );

///////////////////////////////////
// decomposed l1hdr for l1clk_in
///////////////////////////////////

cl_mc1_l1enable_12x l1ch_in_l1en (
                                .l2clk          (l2clk),
                                .pce            (pce),
                                .pce_ov         (tcu_pce_ov),
                                .l1en           (l1clk_in_en)
                        );

cl_mc1_l1driver_12x l1ch_in_l1drvr (
                                .se             (tcu_se_scancollar_in),
                                .l1en           (l1clk_in_en),
                                .l1clk          (l1clk_in),
  .l2clk(l2clk)
                        );

///////////////////////////////////
// decomposed l1hdr for l1clk_gate
///////////////////////////////////

cl_mc1_l1enable_12x l1ch_gate_l1en (
                                .l2clk          (l2clk),
                                .pce            (pce),
                                .pce_ov         (tcu_pce_ov),
                                .l1en           (l1clk_gate_en)
                        );

cl_mc1_l1driver_12x l1ch_gate_l1drvr (
                                .se             (tcu_scan_en),
                                .l1en           (l1clk_gate_en),
                                .l1clk          (l1clk_gate),
  .l2clk(l2clk)
                        );



//================================================
//  l2 clock Domain: Input flops
//================================================

// ------------ controls_ph.a register --------------
/****************************************************
//reg               [8:0] rd_adr_m;
//reg               [8:0] wr_adr_m;
//reg                     rd_en_m;
//reg                     wr_en_m;
//
//  always @(posedge l1clk_in) begin
//    rd_adr_m     <= rd_adr;
//    wr_adr_m     <= wr_adr;
//    rd_en_m      <= rd_en;
//    wr_en_m      <= wr_en;
//  end

*****************************************************/
wire              [8:0] rd_adr_m;
wire              [8:0] wr_adr_m;
wire                    rd_en_m;
wire                    wr_en_m;
wire 			reset_l;
wire            [151:0] din_m;
wire		  [8:0] dff_wr_adr_m_scanin;
wire		  [8:0] dff_rd_adr_m_scanin;

assign reset_l = ~reset;

//  msff_ctl_macro dff_ctrls_m (width=(9*2+2), clr_=1) (
//    .scan_in    (scan_in),
//    .scan_out   (dff_ctrls_m_scanout),
//    .clr_       (reset_l),    
//    .l1clk      (l1clk_in),
//    .din        ({rd_en,  wr_en,  rd_adr[8:0],  wr_adr[8:0]}),
//    .dout       ({rd_en_m,wr_en_m,rd_adr_m[8:0],wr_adr_m[8:0]}) );


  cl_sc1_msff_syrst_4x wr_adr_m00 (.d(wr_adr[0]),   .si(dff_wr_adr_m_scanin[0]),  .q(wr_adr_m[0]),  .so(dff_wr_adr_m_scanout[0]),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );
  cl_sc1_msff_syrst_4x wr_adr_m01 (.d(wr_adr[1]),   .si(dff_wr_adr_m_scanin[1]),  .q(wr_adr_m[1]),  .so(dff_wr_adr_m_scanout[1]),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );
  cl_sc1_msff_syrst_4x wr_adr_m02 (.d(wr_adr[2]),   .si(dff_wr_adr_m_scanin[2]),  .q(wr_adr_m[2]),  .so(dff_wr_adr_m_scanout[2]),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );
  cl_sc1_msff_syrst_4x wr_adr_m03 (.d(wr_adr[3]),   .si(dff_wr_adr_m_scanin[3]),  .q(wr_adr_m[3]),  .so(dff_wr_adr_m_scanout[3]),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );
  cl_sc1_msff_syrst_4x wr_adr_m04 (.d(wr_adr[4]),   .si(dff_wr_adr_m_scanin[4]),  .q(wr_adr_m[4]),  .so(dff_wr_adr_m_scanout[4]),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );
  cl_sc1_msff_syrst_4x wr_adr_m05 (.d(wr_adr[5]),   .si(dff_wr_adr_m_scanin[5]),  .q(wr_adr_m[5]),  .so(dff_wr_adr_m_scanout[5]),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );
  cl_sc1_msff_syrst_4x wr_adr_m06 (.d(wr_adr[6]),   .si(dff_wr_adr_m_scanin[6]),  .q(wr_adr_m[6]),  .so(dff_wr_adr_m_scanout[6]),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );
  cl_sc1_msff_syrst_4x wr_adr_m07 (.d(wr_adr[7]),   .si(dff_wr_adr_m_scanin[7]),  .q(wr_adr_m[7]),  .so(dff_wr_adr_m_scanout[7]),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );
  cl_sc1_msff_syrst_4x wr_adr_m08 (.d(wr_adr[8]),   .si(dff_wr_adr_m_scanin[8]),  .q(wr_adr_m[8]),  .so(dff_wr_adr_m_scanout[8]),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );

  cl_sc1_msff_syrst_4x rd_adr_m00 (.d(rd_adr[0]),   .si(dff_rd_adr_m_scanin[0]),  .q(rd_adr_m[0]),  .so(dff_rd_adr_m_scanout[0]),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );
  cl_sc1_msff_syrst_4x rd_adr_m01 (.d(rd_adr[1]),   .si(dff_rd_adr_m_scanin[1]),  .q(rd_adr_m[1]),  .so(dff_rd_adr_m_scanout[1]),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );
  cl_sc1_msff_syrst_4x rd_adr_m02 (.d(rd_adr[2]),   .si(dff_rd_adr_m_scanin[2]),  .q(rd_adr_m[2]),  .so(dff_rd_adr_m_scanout[2]),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );
  cl_sc1_msff_syrst_4x rd_adr_m03 (.d(rd_adr[3]),   .si(dff_rd_adr_m_scanin[3]),  .q(rd_adr_m[3]),  .so(dff_rd_adr_m_scanout[3]),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );
  cl_sc1_msff_syrst_4x rd_adr_m04 (.d(rd_adr[4]),   .si(dff_rd_adr_m_scanin[4]),  .q(rd_adr_m[4]),  .so(dff_rd_adr_m_scanout[4]),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );
  cl_sc1_msff_syrst_4x rd_adr_m05 (.d(rd_adr[5]),   .si(dff_rd_adr_m_scanin[5]),  .q(rd_adr_m[5]),  .so(dff_rd_adr_m_scanout[5]),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );
  cl_sc1_msff_syrst_4x rd_adr_m06 (.d(rd_adr[6]),   .si(dff_rd_adr_m_scanin[6]),  .q(rd_adr_m[6]),  .so(dff_rd_adr_m_scanout[6]),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );
  cl_sc1_msff_syrst_4x rd_adr_m07 (.d(rd_adr[7]),   .si(dff_rd_adr_m_scanin[7]),  .q(rd_adr_m[7]),  .so(dff_rd_adr_m_scanout[7]),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );
  cl_sc1_msff_syrst_4x rd_adr_m08 (.d(rd_adr[8]),   .si(dff_rd_adr_m_scanin[8]),  .q(rd_adr_m[8]),  .so(dff_rd_adr_m_scanout[8]),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );

  cl_sc1_msff_syrst_4x rd_en_m0   (.d(rd_en),       .si(dff_rd_en_m_scanin),      .q(rd_en_m),      .so(dff_rd_en_m_scanout),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );
  cl_sc1_msff_syrst_4x wr_en_m0   (.d(wr_en),       .si(dff_wr_en_m_scanin),      .q(wr_en_m),      .so(dff_wr_en_m_scanout),
                                  .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),    .soclk(soclk) );

// ------------ write_data_ph.a register ------------
//
//reg             [151:0] din_m;
//
//
//  always @(posedge l1clk_in) begin
//    din_m        <= din;
//  end

//  msff_ctl_macro dff_wdata_m (width=152, clr_=1) (
//    .scan_in    (dff_ctrls_m_scanout),
//    .scan_out   (dff_wdata_m_scanout),
//    .clr_       (reset_l),
//    .l1clk      (l1clk_in),
//    .din        (din[151:0]),
//    .dout       (din_m[151:0]) );


wire            [151:0] dff_wdata_m_scanin, dff_wdata_m_scanout;

  cl_sc1_msff_syrst_4x din_m000 (.d(din[0]),    .si(dff_wdata_m_scanin[0]), .q(din_m[0]), .so(dff_wdata_m_scanout[0]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m001 (.d(din[1]),    .si(dff_wdata_m_scanin[1]), .q(din_m[1]), .so(dff_wdata_m_scanout[1]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m002 (.d(din[2]),    .si(dff_wdata_m_scanin[2]), .q(din_m[2]), .so(dff_wdata_m_scanout[2]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m003 (.d(din[3]),    .si(dff_wdata_m_scanin[3]), .q(din_m[3]), .so(dff_wdata_m_scanout[3]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m004 (.d(din[4]),    .si(dff_wdata_m_scanin[4]), .q(din_m[4]), .so(dff_wdata_m_scanout[4]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m005 (.d(din[5]),    .si(dff_wdata_m_scanin[5]), .q(din_m[5]), .so(dff_wdata_m_scanout[5]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m006 (.d(din[6]),    .si(dff_wdata_m_scanin[6]), .q(din_m[6]), .so(dff_wdata_m_scanout[6]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m007 (.d(din[7]),    .si(dff_wdata_m_scanin[7]), .q(din_m[7]), .so(dff_wdata_m_scanout[7]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m008 (.d(din[8]),    .si(dff_wdata_m_scanin[8]), .q(din_m[8]), .so(dff_wdata_m_scanout[8]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m009 (.d(din[9]),    .si(dff_wdata_m_scanin[9]), .q(din_m[9]), .so(dff_wdata_m_scanout[9]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );

  cl_sc1_msff_syrst_4x din_m010 (.d(din[10]),    .si(dff_wdata_m_scanin[10]), .q(din_m[10]), .so(dff_wdata_m_scanout[10]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m011 (.d(din[11]),    .si(dff_wdata_m_scanin[11]), .q(din_m[11]), .so(dff_wdata_m_scanout[11]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m012 (.d(din[12]),    .si(dff_wdata_m_scanin[12]), .q(din_m[12]), .so(dff_wdata_m_scanout[12]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m013 (.d(din[13]),    .si(dff_wdata_m_scanin[13]), .q(din_m[13]), .so(dff_wdata_m_scanout[13]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m014 (.d(din[14]),    .si(dff_wdata_m_scanin[14]), .q(din_m[14]), .so(dff_wdata_m_scanout[14]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m015 (.d(din[15]),    .si(dff_wdata_m_scanin[15]), .q(din_m[15]), .so(dff_wdata_m_scanout[15]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m016 (.d(din[16]),    .si(dff_wdata_m_scanin[16]), .q(din_m[16]), .so(dff_wdata_m_scanout[16]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m017 (.d(din[17]),    .si(dff_wdata_m_scanin[17]), .q(din_m[17]), .so(dff_wdata_m_scanout[17]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m018 (.d(din[18]),    .si(dff_wdata_m_scanin[18]), .q(din_m[18]), .so(dff_wdata_m_scanout[18]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m019 (.d(din[19]),    .si(dff_wdata_m_scanin[19]), .q(din_m[19]), .so(dff_wdata_m_scanout[19]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );

  cl_sc1_msff_syrst_4x din_m020 (.d(din[20]),    .si(dff_wdata_m_scanin[20]), .q(din_m[20]), .so(dff_wdata_m_scanout[20]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m021 (.d(din[21]),    .si(dff_wdata_m_scanin[21]), .q(din_m[21]), .so(dff_wdata_m_scanout[21]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m022 (.d(din[22]),    .si(dff_wdata_m_scanin[22]), .q(din_m[22]), .so(dff_wdata_m_scanout[22]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m023 (.d(din[23]),    .si(dff_wdata_m_scanin[23]), .q(din_m[23]), .so(dff_wdata_m_scanout[23]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m024 (.d(din[24]),    .si(dff_wdata_m_scanin[24]), .q(din_m[24]), .so(dff_wdata_m_scanout[24]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m025 (.d(din[25]),    .si(dff_wdata_m_scanin[25]), .q(din_m[25]), .so(dff_wdata_m_scanout[25]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m026 (.d(din[26]),    .si(dff_wdata_m_scanin[26]), .q(din_m[26]), .so(dff_wdata_m_scanout[26]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m027 (.d(din[27]),    .si(dff_wdata_m_scanin[27]), .q(din_m[27]), .so(dff_wdata_m_scanout[27]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m028 (.d(din[28]),    .si(dff_wdata_m_scanin[28]), .q(din_m[28]), .so(dff_wdata_m_scanout[28]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m029 (.d(din[29]),    .si(dff_wdata_m_scanin[29]), .q(din_m[29]), .so(dff_wdata_m_scanout[29]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );

  cl_sc1_msff_syrst_4x din_m030 (.d(din[30]),    .si(dff_wdata_m_scanin[30]), .q(din_m[30]), .so(dff_wdata_m_scanout[30]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m031 (.d(din[31]),    .si(dff_wdata_m_scanin[31]), .q(din_m[31]), .so(dff_wdata_m_scanout[31]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m032 (.d(din[32]),    .si(dff_wdata_m_scanin[32]), .q(din_m[32]), .so(dff_wdata_m_scanout[32]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m033 (.d(din[33]),    .si(dff_wdata_m_scanin[33]), .q(din_m[33]), .so(dff_wdata_m_scanout[33]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m034 (.d(din[34]),    .si(dff_wdata_m_scanin[34]), .q(din_m[34]), .so(dff_wdata_m_scanout[34]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m035 (.d(din[35]),    .si(dff_wdata_m_scanin[35]), .q(din_m[35]), .so(dff_wdata_m_scanout[35]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m036 (.d(din[36]),    .si(dff_wdata_m_scanin[36]), .q(din_m[36]), .so(dff_wdata_m_scanout[36]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m037 (.d(din[37]),    .si(dff_wdata_m_scanin[37]), .q(din_m[37]), .so(dff_wdata_m_scanout[37]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m038 (.d(din[38]),    .si(dff_wdata_m_scanin[38]), .q(din_m[38]), .so(dff_wdata_m_scanout[38]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m039 (.d(din[39]),    .si(dff_wdata_m_scanin[39]), .q(din_m[39]), .so(dff_wdata_m_scanout[39]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );

  cl_sc1_msff_syrst_4x din_m040 (.d(din[40]),    .si(dff_wdata_m_scanin[40]), .q(din_m[40]), .so(dff_wdata_m_scanout[40]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m041 (.d(din[41]),    .si(dff_wdata_m_scanin[41]), .q(din_m[41]), .so(dff_wdata_m_scanout[41]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m042 (.d(din[42]),    .si(dff_wdata_m_scanin[42]), .q(din_m[42]), .so(dff_wdata_m_scanout[42]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m043 (.d(din[43]),    .si(dff_wdata_m_scanin[43]), .q(din_m[43]), .so(dff_wdata_m_scanout[43]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m044 (.d(din[44]),    .si(dff_wdata_m_scanin[44]), .q(din_m[44]), .so(dff_wdata_m_scanout[44]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m045 (.d(din[45]),    .si(dff_wdata_m_scanin[45]), .q(din_m[45]), .so(dff_wdata_m_scanout[45]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m046 (.d(din[46]),    .si(dff_wdata_m_scanin[46]), .q(din_m[46]), .so(dff_wdata_m_scanout[46]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m047 (.d(din[47]),    .si(dff_wdata_m_scanin[47]), .q(din_m[47]), .so(dff_wdata_m_scanout[47]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m048 (.d(din[48]),    .si(dff_wdata_m_scanin[48]), .q(din_m[48]), .so(dff_wdata_m_scanout[48]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m049 (.d(din[49]),    .si(dff_wdata_m_scanin[49]), .q(din_m[49]), .so(dff_wdata_m_scanout[49]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );

  cl_sc1_msff_syrst_4x din_m050 (.d(din[50]),    .si(dff_wdata_m_scanin[50]), .q(din_m[50]), .so(dff_wdata_m_scanout[50]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m051 (.d(din[51]),    .si(dff_wdata_m_scanin[51]), .q(din_m[51]), .so(dff_wdata_m_scanout[51]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m052 (.d(din[52]),    .si(dff_wdata_m_scanin[52]), .q(din_m[52]), .so(dff_wdata_m_scanout[52]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m053 (.d(din[53]),    .si(dff_wdata_m_scanin[53]), .q(din_m[53]), .so(dff_wdata_m_scanout[53]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m054 (.d(din[54]),    .si(dff_wdata_m_scanin[54]), .q(din_m[54]), .so(dff_wdata_m_scanout[54]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m055 (.d(din[55]),    .si(dff_wdata_m_scanin[55]), .q(din_m[55]), .so(dff_wdata_m_scanout[55]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m056 (.d(din[56]),    .si(dff_wdata_m_scanin[56]), .q(din_m[56]), .so(dff_wdata_m_scanout[56]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m057 (.d(din[57]),    .si(dff_wdata_m_scanin[57]), .q(din_m[57]), .so(dff_wdata_m_scanout[57]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m058 (.d(din[58]),    .si(dff_wdata_m_scanin[58]), .q(din_m[58]), .so(dff_wdata_m_scanout[58]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m059 (.d(din[59]),    .si(dff_wdata_m_scanin[59]), .q(din_m[59]), .so(dff_wdata_m_scanout[59]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );

  cl_sc1_msff_syrst_4x din_m060 (.d(din[60]),    .si(dff_wdata_m_scanin[60]), .q(din_m[60]), .so(dff_wdata_m_scanout[60]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m061 (.d(din[61]),    .si(dff_wdata_m_scanin[61]), .q(din_m[61]), .so(dff_wdata_m_scanout[61]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m062 (.d(din[62]),    .si(dff_wdata_m_scanin[62]), .q(din_m[62]), .so(dff_wdata_m_scanout[62]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m063 (.d(din[63]),    .si(dff_wdata_m_scanin[63]), .q(din_m[63]), .so(dff_wdata_m_scanout[63]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m064 (.d(din[64]),    .si(dff_wdata_m_scanin[64]), .q(din_m[64]), .so(dff_wdata_m_scanout[64]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m065 (.d(din[65]),    .si(dff_wdata_m_scanin[65]), .q(din_m[65]), .so(dff_wdata_m_scanout[65]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m066 (.d(din[66]),    .si(dff_wdata_m_scanin[66]), .q(din_m[66]), .so(dff_wdata_m_scanout[66]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m067 (.d(din[67]),    .si(dff_wdata_m_scanin[67]), .q(din_m[67]), .so(dff_wdata_m_scanout[67]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m068 (.d(din[68]),    .si(dff_wdata_m_scanin[68]), .q(din_m[68]), .so(dff_wdata_m_scanout[68]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m069 (.d(din[69]),    .si(dff_wdata_m_scanin[69]), .q(din_m[69]), .so(dff_wdata_m_scanout[69]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );

  cl_sc1_msff_syrst_4x din_m070 (.d(din[70]),    .si(dff_wdata_m_scanin[70]), .q(din_m[70]), .so(dff_wdata_m_scanout[70]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m071 (.d(din[71]),    .si(dff_wdata_m_scanin[71]), .q(din_m[71]), .so(dff_wdata_m_scanout[71]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m072 (.d(din[72]),    .si(dff_wdata_m_scanin[72]), .q(din_m[72]), .so(dff_wdata_m_scanout[72]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m073 (.d(din[73]),    .si(dff_wdata_m_scanin[73]), .q(din_m[73]), .so(dff_wdata_m_scanout[73]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m074 (.d(din[74]),    .si(dff_wdata_m_scanin[74]), .q(din_m[74]), .so(dff_wdata_m_scanout[74]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m075 (.d(din[75]),    .si(dff_wdata_m_scanin[75]), .q(din_m[75]), .so(dff_wdata_m_scanout[75]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m076 (.d(din[76]),    .si(dff_wdata_m_scanin[76]), .q(din_m[76]), .so(dff_wdata_m_scanout[76]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m077 (.d(din[77]),    .si(dff_wdata_m_scanin[77]), .q(din_m[77]), .so(dff_wdata_m_scanout[77]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m078 (.d(din[78]),    .si(dff_wdata_m_scanin[78]), .q(din_m[78]), .so(dff_wdata_m_scanout[78]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m079 (.d(din[79]),    .si(dff_wdata_m_scanin[79]), .q(din_m[79]), .so(dff_wdata_m_scanout[79]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );

  cl_sc1_msff_syrst_4x din_m080 (.d(din[80]),    .si(dff_wdata_m_scanin[80]), .q(din_m[80]), .so(dff_wdata_m_scanout[80]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m081 (.d(din[81]),    .si(dff_wdata_m_scanin[81]), .q(din_m[81]), .so(dff_wdata_m_scanout[81]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m082 (.d(din[82]),    .si(dff_wdata_m_scanin[82]), .q(din_m[82]), .so(dff_wdata_m_scanout[82]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m083 (.d(din[83]),    .si(dff_wdata_m_scanin[83]), .q(din_m[83]), .so(dff_wdata_m_scanout[83]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m084 (.d(din[84]),    .si(dff_wdata_m_scanin[84]), .q(din_m[84]), .so(dff_wdata_m_scanout[84]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m085 (.d(din[85]),    .si(dff_wdata_m_scanin[85]), .q(din_m[85]), .so(dff_wdata_m_scanout[85]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m086 (.d(din[86]),    .si(dff_wdata_m_scanin[86]), .q(din_m[86]), .so(dff_wdata_m_scanout[86]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m087 (.d(din[87]),    .si(dff_wdata_m_scanin[87]), .q(din_m[87]), .so(dff_wdata_m_scanout[87]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m088 (.d(din[88]),    .si(dff_wdata_m_scanin[88]), .q(din_m[88]), .so(dff_wdata_m_scanout[88]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m089 (.d(din[89]),    .si(dff_wdata_m_scanin[89]), .q(din_m[89]), .so(dff_wdata_m_scanout[89]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );

  cl_sc1_msff_syrst_4x din_m090 (.d(din[90]),    .si(dff_wdata_m_scanin[90]), .q(din_m[90]), .so(dff_wdata_m_scanout[90]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m091 (.d(din[91]),    .si(dff_wdata_m_scanin[91]), .q(din_m[91]), .so(dff_wdata_m_scanout[91]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m092 (.d(din[92]),    .si(dff_wdata_m_scanin[92]), .q(din_m[92]), .so(dff_wdata_m_scanout[92]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m093 (.d(din[93]),    .si(dff_wdata_m_scanin[93]), .q(din_m[93]), .so(dff_wdata_m_scanout[93]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m094 (.d(din[94]),    .si(dff_wdata_m_scanin[94]), .q(din_m[94]), .so(dff_wdata_m_scanout[94]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m095 (.d(din[95]),    .si(dff_wdata_m_scanin[95]), .q(din_m[95]), .so(dff_wdata_m_scanout[95]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m096 (.d(din[96]),    .si(dff_wdata_m_scanin[96]), .q(din_m[96]), .so(dff_wdata_m_scanout[96]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m097 (.d(din[97]),    .si(dff_wdata_m_scanin[97]), .q(din_m[97]), .so(dff_wdata_m_scanout[97]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m098 (.d(din[98]),    .si(dff_wdata_m_scanin[98]), .q(din_m[98]), .so(dff_wdata_m_scanout[98]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m099 (.d(din[99]),    .si(dff_wdata_m_scanin[99]), .q(din_m[99]), .so(dff_wdata_m_scanout[99]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );

  cl_sc1_msff_syrst_4x din_m100 (.d(din[100]),    .si(dff_wdata_m_scanin[100]), .q(din_m[100]), .so(dff_wdata_m_scanout[100]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m101 (.d(din[101]),    .si(dff_wdata_m_scanin[101]), .q(din_m[101]), .so(dff_wdata_m_scanout[101]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m102 (.d(din[102]),    .si(dff_wdata_m_scanin[102]), .q(din_m[102]), .so(dff_wdata_m_scanout[102]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m103 (.d(din[103]),    .si(dff_wdata_m_scanin[103]), .q(din_m[103]), .so(dff_wdata_m_scanout[103]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m104 (.d(din[104]),    .si(dff_wdata_m_scanin[104]), .q(din_m[104]), .so(dff_wdata_m_scanout[104]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m105 (.d(din[105]),    .si(dff_wdata_m_scanin[105]), .q(din_m[105]), .so(dff_wdata_m_scanout[105]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m106 (.d(din[106]),    .si(dff_wdata_m_scanin[106]), .q(din_m[106]), .so(dff_wdata_m_scanout[106]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m107 (.d(din[107]),    .si(dff_wdata_m_scanin[107]), .q(din_m[107]), .so(dff_wdata_m_scanout[107]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m108 (.d(din[108]),    .si(dff_wdata_m_scanin[108]), .q(din_m[108]), .so(dff_wdata_m_scanout[108]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m109 (.d(din[109]),    .si(dff_wdata_m_scanin[109]), .q(din_m[109]), .so(dff_wdata_m_scanout[109]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );

  cl_sc1_msff_syrst_4x din_m110 (.d(din[110]),    .si(dff_wdata_m_scanin[110]), .q(din_m[110]), .so(dff_wdata_m_scanout[110]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m111 (.d(din[111]),    .si(dff_wdata_m_scanin[111]), .q(din_m[111]), .so(dff_wdata_m_scanout[111]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m112 (.d(din[112]),    .si(dff_wdata_m_scanin[112]), .q(din_m[112]), .so(dff_wdata_m_scanout[112]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m113 (.d(din[113]),    .si(dff_wdata_m_scanin[113]), .q(din_m[113]), .so(dff_wdata_m_scanout[113]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m114 (.d(din[114]),    .si(dff_wdata_m_scanin[114]), .q(din_m[114]), .so(dff_wdata_m_scanout[114]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m115 (.d(din[115]),    .si(dff_wdata_m_scanin[115]), .q(din_m[115]), .so(dff_wdata_m_scanout[115]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m116 (.d(din[116]),    .si(dff_wdata_m_scanin[116]), .q(din_m[116]), .so(dff_wdata_m_scanout[116]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m117 (.d(din[117]),    .si(dff_wdata_m_scanin[117]), .q(din_m[117]), .so(dff_wdata_m_scanout[117]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m118 (.d(din[118]),    .si(dff_wdata_m_scanin[118]), .q(din_m[118]), .so(dff_wdata_m_scanout[118]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m119 (.d(din[119]),    .si(dff_wdata_m_scanin[119]), .q(din_m[119]), .so(dff_wdata_m_scanout[119]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );

  cl_sc1_msff_syrst_4x din_m120 (.d(din[120]),    .si(dff_wdata_m_scanin[120]), .q(din_m[120]), .so(dff_wdata_m_scanout[120]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m121 (.d(din[121]),    .si(dff_wdata_m_scanin[121]), .q(din_m[121]), .so(dff_wdata_m_scanout[121]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m122 (.d(din[122]),    .si(dff_wdata_m_scanin[122]), .q(din_m[122]), .so(dff_wdata_m_scanout[122]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m123 (.d(din[123]),    .si(dff_wdata_m_scanin[123]), .q(din_m[123]), .so(dff_wdata_m_scanout[123]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m124 (.d(din[124]),    .si(dff_wdata_m_scanin[124]), .q(din_m[124]), .so(dff_wdata_m_scanout[124]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m125 (.d(din[125]),    .si(dff_wdata_m_scanin[125]), .q(din_m[125]), .so(dff_wdata_m_scanout[125]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m126 (.d(din[126]),    .si(dff_wdata_m_scanin[126]), .q(din_m[126]), .so(dff_wdata_m_scanout[126]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m127 (.d(din[127]),    .si(dff_wdata_m_scanin[127]), .q(din_m[127]), .so(dff_wdata_m_scanout[127]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m128 (.d(din[128]),    .si(dff_wdata_m_scanin[128]), .q(din_m[128]), .so(dff_wdata_m_scanout[128]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m129 (.d(din[129]),    .si(dff_wdata_m_scanin[129]), .q(din_m[129]), .so(dff_wdata_m_scanout[129]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );

  cl_sc1_msff_syrst_4x din_m130 (.d(din[130]),    .si(dff_wdata_m_scanin[130]), .q(din_m[130]), .so(dff_wdata_m_scanout[130]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m131 (.d(din[131]),    .si(dff_wdata_m_scanin[131]), .q(din_m[131]), .so(dff_wdata_m_scanout[131]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m132 (.d(din[132]),    .si(dff_wdata_m_scanin[132]), .q(din_m[132]), .so(dff_wdata_m_scanout[132]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m133 (.d(din[133]),    .si(dff_wdata_m_scanin[133]), .q(din_m[133]), .so(dff_wdata_m_scanout[133]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m134 (.d(din[134]),    .si(dff_wdata_m_scanin[134]), .q(din_m[134]), .so(dff_wdata_m_scanout[134]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m135 (.d(din[135]),    .si(dff_wdata_m_scanin[135]), .q(din_m[135]), .so(dff_wdata_m_scanout[135]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m136 (.d(din[136]),    .si(dff_wdata_m_scanin[136]), .q(din_m[136]), .so(dff_wdata_m_scanout[136]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m137 (.d(din[137]),    .si(dff_wdata_m_scanin[137]), .q(din_m[137]), .so(dff_wdata_m_scanout[137]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m138 (.d(din[138]),    .si(dff_wdata_m_scanin[138]), .q(din_m[138]), .so(dff_wdata_m_scanout[138]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m139 (.d(din[139]),    .si(dff_wdata_m_scanin[139]), .q(din_m[139]), .so(dff_wdata_m_scanout[139]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );

  cl_sc1_msff_syrst_4x din_m140 (.d(din[140]),    .si(dff_wdata_m_scanin[140]), .q(din_m[140]), .so(dff_wdata_m_scanout[140]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m141 (.d(din[141]),    .si(dff_wdata_m_scanin[141]), .q(din_m[141]), .so(dff_wdata_m_scanout[141]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m142 (.d(din[142]),    .si(dff_wdata_m_scanin[142]), .q(din_m[142]), .so(dff_wdata_m_scanout[142]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m143 (.d(din[143]),    .si(dff_wdata_m_scanin[143]), .q(din_m[143]), .so(dff_wdata_m_scanout[143]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m144 (.d(din[144]),    .si(dff_wdata_m_scanin[144]), .q(din_m[144]), .so(dff_wdata_m_scanout[144]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m145 (.d(din[145]),    .si(dff_wdata_m_scanin[145]), .q(din_m[145]), .so(dff_wdata_m_scanout[145]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m146 (.d(din[146]),    .si(dff_wdata_m_scanin[146]), .q(din_m[146]), .so(dff_wdata_m_scanout[146]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m147 (.d(din[147]),    .si(dff_wdata_m_scanin[147]), .q(din_m[147]), .so(dff_wdata_m_scanout[147]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m148 (.d(din[148]),    .si(dff_wdata_m_scanin[148]), .q(din_m[148]), .so(dff_wdata_m_scanout[148]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m149 (.d(din[149]),    .si(dff_wdata_m_scanin[149]), .q(din_m[149]), .so(dff_wdata_m_scanout[149]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );

  cl_sc1_msff_syrst_4x din_m150 (.d(din[150]),    .si(dff_wdata_m_scanin[150]), .q(din_m[150]), .so(dff_wdata_m_scanout[150]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );
  cl_sc1_msff_syrst_4x din_m151 (.d(din[151]),    .si(dff_wdata_m_scanin[151]), .q(din_m[151]), .so(dff_wdata_m_scanout[151]),
                                .reset(reset_l), .l1clk(l1clk_in),             .siclk(siclk),  .soclk(soclk) );

// ------------ test registers ------------

  cl_sc1_msff_syrst_4x test_mode_reg (
    .d          (test_mode),
    .reset      (reset_l),
    .si         (dff_test_mode_scanin),
    .q          (test_mode),
    .so         (dff_test_mode_scanout),
    .l1clk      (l1clk_in),
    .siclk      (tcu_aclk),
    .soclk      (tcu_bclk) );

  cl_sc1_msff_syrst_4x test_clk_reg (
    .d          (test_clk),
    .reset      (reset_l),
    .si         (dff_test_clk_scanin),
    .q          (test_clk),
    .so         (dff_test_clk_scanout),
    .l1clk      (l1clk_in),
    .siclk      (tcu_aclk),
    .soclk      (tcu_bclk) );

wire l1clk_testclk;

  assign l1clk_testclk = test_mode ? test_clk : l1clk_gate;


//================================================
//  l2 clock Domain: Control signals
//================================================
wire                    do_B_write_m, l1clk_testclk_not, wr_inhibit_not, wr_en_and_clk;
wire                    do_A_read_m, do_A_read_temp;
wire              [8:0] rw_addr_m,    sc11, sc12;

//  assign do_B_write_m = wr_en_m && !l1clk_gate && !tcu_array_wr_inhibit;
//  assign do_A_read_m  = rd_en_m &&  l1clk_gate && !tcu_array_wr_inhibit;
//  assign rw_addr_m    = {9{do_B_write_m}} & wr_adr_m |
//                        {9{do_A_read_m}}  & rd_adr_m;

  niu512_inv_macro__width_1 a1  (.dout(l1clk_testclk_not),         .din(l1clk_testclk) );
  niu512_inv_macro__width_1 a2  (.dout(wr_inhibit_not),         .din(tcu_array_wr_inhibit) );
  niu512_and_macro__width_1 a3  (.dout(wr_en_and_clk),         .din0(wr_en_m), .din1(l1clk_testclk_not) );
  niu512_and_macro__width_1 a4  (.dout(do_B_write_m), .din0(wr_en_and_clk),    .din1(wr_inhibit_not) );

  niu512_and_macro__width_1 b1  (.dout(do_A_read_temp),  .din0(rd_en_m), .din1(l1clk_testclk) );
  niu512_and_macro__width_1 b2  (.dout(do_A_read_m),     .din0(wr_inhibit_not),    .din1(do_A_read_temp) );

  niu512_and_macro__width_9 c1  (.dout(sc11[8:0]),     .din0({9{do_B_write_m}}),.din1(wr_adr_m[8:0]));
  niu512_and_macro__width_9 c2  (.dout(sc12[8:0]),     .din0({9{do_A_read_m}}), .din1(rd_adr_m[8:0]));
   niu512_or_macro__width_9 c3  (.dout(rw_addr_m[8:0]),.din0(sc11[8:0]),        .din1(sc12[8:0]));

//================================================
// l2x2 clock Domain: Clock headers
//================================================

wire                    l1clk_2x_free;

cl_sc1_l1hdr_8x l1ch_2x_free (
                                .l2clk          (l2clk_2x),
                                .pce            (pce),
                                .pce_ov         (tcu_pce_ov),
                                .l1clk          (l1clk_2x_free),
                                .se             (tcu_scan_en),
                                .stop           (1'b0)
                          );



//================================================
//  l2x2 clock Domain: Input Logic
//================================================
// ------------ controls_ph.a Latch @ posedge -------
//reg                     do_B_write_2x_a;
//reg                     do_A_read_2x_a;
//reg               [8:0] rw_addr_2x_a;
//
//  always @(l1clk_2x_free or rw_addr_m or do_A_read_m or do_B_write_m) begin
//    if (l1clk_2x_free)
//      begin
//        rw_addr_2x_a          = rw_addr_m;
//        do_A_read_2x_a        = do_A_read_m;
//        do_B_write_2x_a       = do_B_write_m;
//      end
//    else
//      begin
//        rw_addr_2x_a          = rw_addr_2x_a;
//        do_A_read_2x_a        = do_A_read_2x_a;
//        do_B_write_2x_a       = do_B_write_2x_a;
//      end
//  end
// ------------ controls_ph.b Latch @ negedge -------
//reg               [1:0] rd_addr_column_b;
//reg               [1:0] rd_addr_column_b1;
//
//  always @(l1clk_2x_free or rd_en_a or rw_addr_2x_a) begin
//    if (!l1clk_2x_free && rd_en_a)
//      begin
//        rd_addr_column_b1      = rw_addr_2x_a[1:0];
//      end
//    else
//      begin
//        rd_addr_column_b1      = rd_addr_column_b1;
//      end
//  end
//
//  always @(l1clk_2x_free) begin
//        rd_addr_column_b           <= rd_addr_column_b1;
//  end

// ------------ write_data_ph.b Flop  @ negedge -----
//reg             [151:0] wdata_2x_b;
//
//  always @(negedge l1clk_2x_free) begin
//        wdata_2x_b           <= din_m;
//  end
//

wire               [8:0] rw_addr_2x_a;
wire               [1:0] rd_addr_column_b;
wire               [1:0] rd_addr_column_b1;

cl_mc1_scm_msff_lat_4x rw_addr_2x_a_lat0 (.latout(rw_addr_2x_a[0]), .d(rw_addr_m[0]), .l1clk(~l1clk_2x_free), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .q(),.q_l(), .so() );
cl_mc1_scm_msff_lat_4x rw_addr_2x_a_lat1 (.latout(rw_addr_2x_a[1]), .d(rw_addr_m[1]), .l1clk(~l1clk_2x_free), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .q(),.q_l(), .so() );
cl_mc1_scm_msff_lat_4x rw_addr_2x_a_lat2 (.latout(rw_addr_2x_a[2]), .d(rw_addr_m[2]), .l1clk(~l1clk_2x_free), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .q(),.q_l(), .so() );
cl_mc1_scm_msff_lat_4x rw_addr_2x_a_lat3 (.latout(rw_addr_2x_a[3]), .d(rw_addr_m[3]), .l1clk(~l1clk_2x_free), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .q(),.q_l(), .so() );
cl_mc1_scm_msff_lat_4x rw_addr_2x_a_lat4 (.latout(rw_addr_2x_a[4]), .d(rw_addr_m[4]), .l1clk(~l1clk_2x_free), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .q(),.q_l(), .so() );
cl_mc1_scm_msff_lat_4x rw_addr_2x_a_lat5 (.latout(rw_addr_2x_a[5]), .d(rw_addr_m[5]), .l1clk(~l1clk_2x_free), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .q(),.q_l(), .so() );
cl_mc1_scm_msff_lat_4x rw_addr_2x_a_lat6 (.latout(rw_addr_2x_a[6]), .d(rw_addr_m[6]), .l1clk(~l1clk_2x_free), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .q(),.q_l(), .so() );
cl_mc1_scm_msff_lat_4x rw_addr_2x_a_lat7 (.latout(rw_addr_2x_a[7]), .d(rw_addr_m[7]), .l1clk(~l1clk_2x_free), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .q(),.q_l(), .so() );
cl_mc1_scm_msff_lat_4x rw_addr_2x_a_lat8 (.latout(rw_addr_2x_a[8]), .d(rw_addr_m[8]), .l1clk(~l1clk_2x_free), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .q(),.q_l(), .so() );

cl_mc1_scm_msff_lat_4x do_A_read_2x_a_lat (.latout(do_A_read_2x_a), .d(do_A_read_m), .l1clk(~l1clk_2x_free), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .q(),.q_l(), .so() );
cl_mc1_scm_msff_lat_4x do_B_write_2x_a_lat (.latout(do_B_write_2x_a), .d(do_B_write_m), .l1clk(~l1clk_2x_free), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .q(),.q_l() , .so());


cl_mc1_scm_msff_lat_4x rd_addr_column_b1_lat0 (.latout(rd_addr_column_b1[0]), .d(rw_addr_2x_a[0]), .l1clk(~(!l1clk_2x_free && rd_en_a)), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .q(),.q_l() , .so());
cl_mc1_scm_msff_lat_4x rd_addr_column_b1_lat1 (.latout(rd_addr_column_b1[1]), .d(rw_addr_2x_a[1]), .l1clk(~(!l1clk_2x_free && rd_en_a)), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .q(),.q_l() , .so());

cl_mc1_scm_msff_lat_4x rd_addr_column_b_lat0 (.latout(rd_addr_column_b[0]), .d(rd_addr_column_b1[0]), .l1clk(~l1clk_2x_free), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .q(),.q_l() , .so());
cl_mc1_scm_msff_lat_4x rd_addr_column_b_lat1 (.latout(rd_addr_column_b[1]), .d(rd_addr_column_b1[1]), .l1clk(~l1clk_2x_free), .si(1'b0), .siclk(1'b0), .soclk(1'b0), .q(),.q_l() , .so());


cl_sc1_msff_4x wdata_2x_b_reg0 (.d(din_m[0]), .si(1'b0), .q(wdata_2x_b[0]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg1 (.d(din_m[1]), .si(1'b0), .q(wdata_2x_b[1]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg2 (.d(din_m[2]), .si(1'b0), .q(wdata_2x_b[2]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg3 (.d(din_m[3]), .si(1'b0), .q(wdata_2x_b[3]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg4 (.d(din_m[4]), .si(1'b0), .q(wdata_2x_b[4]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg5 (.d(din_m[5]), .si(1'b0), .q(wdata_2x_b[5]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg6 (.d(din_m[6]), .si(1'b0), .q(wdata_2x_b[6]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg7 (.d(din_m[7]), .si(1'b0), .q(wdata_2x_b[7]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg8 (.d(din_m[8]), .si(1'b0), .q(wdata_2x_b[8]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg9 (.d(din_m[9]), .si(1'b0), .q(wdata_2x_b[9]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg10 (.d(din_m[10]), .si(1'b0), .q(wdata_2x_b[10]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg11 (.d(din_m[11]), .si(1'b0), .q(wdata_2x_b[11]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg12 (.d(din_m[12]), .si(1'b0), .q(wdata_2x_b[12]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg13 (.d(din_m[13]), .si(1'b0), .q(wdata_2x_b[13]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg14 (.d(din_m[14]), .si(1'b0), .q(wdata_2x_b[14]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg15 (.d(din_m[15]), .si(1'b0), .q(wdata_2x_b[15]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg16 (.d(din_m[16]), .si(1'b0), .q(wdata_2x_b[16]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg17 (.d(din_m[17]), .si(1'b0), .q(wdata_2x_b[17]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg18 (.d(din_m[18]), .si(1'b0), .q(wdata_2x_b[18]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg19 (.d(din_m[19]), .si(1'b0), .q(wdata_2x_b[19]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg20 (.d(din_m[20]), .si(1'b0), .q(wdata_2x_b[20]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg21 (.d(din_m[21]), .si(1'b0), .q(wdata_2x_b[21]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg22 (.d(din_m[22]), .si(1'b0), .q(wdata_2x_b[22]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg23 (.d(din_m[23]), .si(1'b0), .q(wdata_2x_b[23]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg24 (.d(din_m[24]), .si(1'b0), .q(wdata_2x_b[24]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg25 (.d(din_m[25]), .si(1'b0), .q(wdata_2x_b[25]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg26 (.d(din_m[26]), .si(1'b0), .q(wdata_2x_b[26]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg27 (.d(din_m[27]), .si(1'b0), .q(wdata_2x_b[27]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg28 (.d(din_m[28]), .si(1'b0), .q(wdata_2x_b[28]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg29 (.d(din_m[29]), .si(1'b0), .q(wdata_2x_b[29]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg30 (.d(din_m[30]), .si(1'b0), .q(wdata_2x_b[30]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg31 (.d(din_m[31]), .si(1'b0), .q(wdata_2x_b[31]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg32 (.d(din_m[32]), .si(1'b0), .q(wdata_2x_b[32]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg33 (.d(din_m[33]), .si(1'b0), .q(wdata_2x_b[33]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg34 (.d(din_m[34]), .si(1'b0), .q(wdata_2x_b[34]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg35 (.d(din_m[35]), .si(1'b0), .q(wdata_2x_b[35]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg36 (.d(din_m[36]), .si(1'b0), .q(wdata_2x_b[36]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg37 (.d(din_m[37]), .si(1'b0), .q(wdata_2x_b[37]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg38 (.d(din_m[38]), .si(1'b0), .q(wdata_2x_b[38]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg39 (.d(din_m[39]), .si(1'b0), .q(wdata_2x_b[39]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg40 (.d(din_m[40]), .si(1'b0), .q(wdata_2x_b[40]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg41 (.d(din_m[41]), .si(1'b0), .q(wdata_2x_b[41]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg42 (.d(din_m[42]), .si(1'b0), .q(wdata_2x_b[42]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg43 (.d(din_m[43]), .si(1'b0), .q(wdata_2x_b[43]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg44 (.d(din_m[44]), .si(1'b0), .q(wdata_2x_b[44]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg45 (.d(din_m[45]), .si(1'b0), .q(wdata_2x_b[45]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg46 (.d(din_m[46]), .si(1'b0), .q(wdata_2x_b[46]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg47 (.d(din_m[47]), .si(1'b0), .q(wdata_2x_b[47]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg48 (.d(din_m[48]), .si(1'b0), .q(wdata_2x_b[48]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg49 (.d(din_m[49]), .si(1'b0), .q(wdata_2x_b[49]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg50 (.d(din_m[50]), .si(1'b0), .q(wdata_2x_b[50]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg51 (.d(din_m[51]), .si(1'b0), .q(wdata_2x_b[51]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg52 (.d(din_m[52]), .si(1'b0), .q(wdata_2x_b[52]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg53 (.d(din_m[53]), .si(1'b0), .q(wdata_2x_b[53]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg54 (.d(din_m[54]), .si(1'b0), .q(wdata_2x_b[54]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg55 (.d(din_m[55]), .si(1'b0), .q(wdata_2x_b[55]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg56 (.d(din_m[56]), .si(1'b0), .q(wdata_2x_b[56]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg57 (.d(din_m[57]), .si(1'b0), .q(wdata_2x_b[57]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg58 (.d(din_m[58]), .si(1'b0), .q(wdata_2x_b[58]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg59 (.d(din_m[59]), .si(1'b0), .q(wdata_2x_b[59]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg60 (.d(din_m[60]), .si(1'b0), .q(wdata_2x_b[60]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg61 (.d(din_m[61]), .si(1'b0), .q(wdata_2x_b[61]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg62 (.d(din_m[62]), .si(1'b0), .q(wdata_2x_b[62]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg63 (.d(din_m[63]), .si(1'b0), .q(wdata_2x_b[63]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg64 (.d(din_m[64]), .si(1'b0), .q(wdata_2x_b[64]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg65 (.d(din_m[65]), .si(1'b0), .q(wdata_2x_b[65]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg66 (.d(din_m[66]), .si(1'b0), .q(wdata_2x_b[66]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg67 (.d(din_m[67]), .si(1'b0), .q(wdata_2x_b[67]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg68 (.d(din_m[68]), .si(1'b0), .q(wdata_2x_b[68]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg69 (.d(din_m[69]), .si(1'b0), .q(wdata_2x_b[69]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg70 (.d(din_m[70]), .si(1'b0), .q(wdata_2x_b[70]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg71 (.d(din_m[71]), .si(1'b0), .q(wdata_2x_b[71]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg72 (.d(din_m[72]), .si(1'b0), .q(wdata_2x_b[72]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg73 (.d(din_m[73]), .si(1'b0), .q(wdata_2x_b[73]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg74 (.d(din_m[74]), .si(1'b0), .q(wdata_2x_b[74]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg75 (.d(din_m[75]), .si(1'b0), .q(wdata_2x_b[75]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg76 (.d(din_m[76]), .si(1'b0), .q(wdata_2x_b[76]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg77 (.d(din_m[77]), .si(1'b0), .q(wdata_2x_b[77]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg78 (.d(din_m[78]), .si(1'b0), .q(wdata_2x_b[78]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg79 (.d(din_m[79]), .si(1'b0), .q(wdata_2x_b[79]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg80 (.d(din_m[80]), .si(1'b0), .q(wdata_2x_b[80]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg81 (.d(din_m[81]), .si(1'b0), .q(wdata_2x_b[81]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg82 (.d(din_m[82]), .si(1'b0), .q(wdata_2x_b[82]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg83 (.d(din_m[83]), .si(1'b0), .q(wdata_2x_b[83]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg84 (.d(din_m[84]), .si(1'b0), .q(wdata_2x_b[84]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg85 (.d(din_m[85]), .si(1'b0), .q(wdata_2x_b[85]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg86 (.d(din_m[86]), .si(1'b0), .q(wdata_2x_b[86]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg87 (.d(din_m[87]), .si(1'b0), .q(wdata_2x_b[87]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg88 (.d(din_m[88]), .si(1'b0), .q(wdata_2x_b[88]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg89 (.d(din_m[89]), .si(1'b0), .q(wdata_2x_b[89]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg90 (.d(din_m[90]), .si(1'b0), .q(wdata_2x_b[90]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg91 (.d(din_m[91]), .si(1'b0), .q(wdata_2x_b[91]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg92 (.d(din_m[92]), .si(1'b0), .q(wdata_2x_b[92]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg93 (.d(din_m[93]), .si(1'b0), .q(wdata_2x_b[93]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg94 (.d(din_m[94]), .si(1'b0), .q(wdata_2x_b[94]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg95 (.d(din_m[95]), .si(1'b0), .q(wdata_2x_b[95]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg96 (.d(din_m[96]), .si(1'b0), .q(wdata_2x_b[96]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg97 (.d(din_m[97]), .si(1'b0), .q(wdata_2x_b[97]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg98 (.d(din_m[98]), .si(1'b0), .q(wdata_2x_b[98]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg99 (.d(din_m[99]), .si(1'b0), .q(wdata_2x_b[99]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg100 (.d(din_m[100]), .si(1'b0), .q(wdata_2x_b[100]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg101 (.d(din_m[101]), .si(1'b0), .q(wdata_2x_b[101]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg102 (.d(din_m[102]), .si(1'b0), .q(wdata_2x_b[102]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg103 (.d(din_m[103]), .si(1'b0), .q(wdata_2x_b[103]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg104 (.d(din_m[104]), .si(1'b0), .q(wdata_2x_b[104]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg105 (.d(din_m[105]), .si(1'b0), .q(wdata_2x_b[105]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg106 (.d(din_m[106]), .si(1'b0), .q(wdata_2x_b[106]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg107 (.d(din_m[107]), .si(1'b0), .q(wdata_2x_b[107]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg108 (.d(din_m[108]), .si(1'b0), .q(wdata_2x_b[108]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg109 (.d(din_m[109]), .si(1'b0), .q(wdata_2x_b[109]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg110 (.d(din_m[110]), .si(1'b0), .q(wdata_2x_b[110]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg111 (.d(din_m[111]), .si(1'b0), .q(wdata_2x_b[111]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg112 (.d(din_m[112]), .si(1'b0), .q(wdata_2x_b[112]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg113 (.d(din_m[113]), .si(1'b0), .q(wdata_2x_b[113]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg114 (.d(din_m[114]), .si(1'b0), .q(wdata_2x_b[114]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg115 (.d(din_m[115]), .si(1'b0), .q(wdata_2x_b[115]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg116 (.d(din_m[116]), .si(1'b0), .q(wdata_2x_b[116]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg117 (.d(din_m[117]), .si(1'b0), .q(wdata_2x_b[117]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg118 (.d(din_m[118]), .si(1'b0), .q(wdata_2x_b[118]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg119 (.d(din_m[119]), .si(1'b0), .q(wdata_2x_b[119]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg120 (.d(din_m[120]), .si(1'b0), .q(wdata_2x_b[120]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg121 (.d(din_m[121]), .si(1'b0), .q(wdata_2x_b[121]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg122 (.d(din_m[122]), .si(1'b0), .q(wdata_2x_b[122]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg123 (.d(din_m[123]), .si(1'b0), .q(wdata_2x_b[123]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg124 (.d(din_m[124]), .si(1'b0), .q(wdata_2x_b[124]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg125 (.d(din_m[125]), .si(1'b0), .q(wdata_2x_b[125]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg126 (.d(din_m[126]), .si(1'b0), .q(wdata_2x_b[126]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg127 (.d(din_m[127]), .si(1'b0), .q(wdata_2x_b[127]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg128 (.d(din_m[128]), .si(1'b0), .q(wdata_2x_b[128]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg129 (.d(din_m[129]), .si(1'b0), .q(wdata_2x_b[129]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg130 (.d(din_m[130]), .si(1'b0), .q(wdata_2x_b[130]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg131 (.d(din_m[131]), .si(1'b0), .q(wdata_2x_b[131]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg132 (.d(din_m[132]), .si(1'b0), .q(wdata_2x_b[132]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg133 (.d(din_m[133]), .si(1'b0), .q(wdata_2x_b[133]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg134 (.d(din_m[134]), .si(1'b0), .q(wdata_2x_b[134]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg135 (.d(din_m[135]), .si(1'b0), .q(wdata_2x_b[135]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg136 (.d(din_m[136]), .si(1'b0), .q(wdata_2x_b[136]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg137 (.d(din_m[137]), .si(1'b0), .q(wdata_2x_b[137]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg138 (.d(din_m[138]), .si(1'b0), .q(wdata_2x_b[138]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg139 (.d(din_m[139]), .si(1'b0), .q(wdata_2x_b[139]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg140 (.d(din_m[140]), .si(1'b0), .q(wdata_2x_b[140]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg141 (.d(din_m[141]), .si(1'b0), .q(wdata_2x_b[141]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg142 (.d(din_m[142]), .si(1'b0), .q(wdata_2x_b[142]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg143 (.d(din_m[143]), .si(1'b0), .q(wdata_2x_b[143]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg144 (.d(din_m[144]), .si(1'b0), .q(wdata_2x_b[144]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg145 (.d(din_m[145]), .si(1'b0), .q(wdata_2x_b[145]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg146 (.d(din_m[146]), .si(1'b0), .q(wdata_2x_b[146]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg147 (.d(din_m[147]), .si(1'b0), .q(wdata_2x_b[147]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg148 (.d(din_m[148]), .si(1'b0), .q(wdata_2x_b[148]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg149 (.d(din_m[149]), .si(1'b0), .q(wdata_2x_b[149]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg150 (.d(din_m[150]), .si(1'b0), .q(wdata_2x_b[150]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
cl_sc1_msff_4x wdata_2x_b_reg151 (.d(din_m[151]), .si(1'b0), .q(wdata_2x_b[151]), .l1clk(~l1clk_2x_free), .siclk(1'b0), .soclk(1'b0),.so() );
//================================================
  assign wdata_b = wdata_2x_b;
  assign addr_a  = rw_addr_2x_a;
  assign rd_en_a = do_A_read_2x_a && !do_B_write_2x_a;
  assign wr_en_a = do_B_write_2x_a;

// geo:   assign wcs_a   = wr_en_a & ~tcu_array_wr_inhibit & ~rd_en_a ;
  assign wcs_a   = wr_en_a & ~tcu_array_wr_inhibit;

  assign rd_en_column[0] = rd_en_a &&               !addr_a[1] && !addr_a[0]; 
  assign rd_en_column[1] = rd_en_a &&               !addr_a[1] &&  addr_a[0]; 
  assign rd_en_column[2] = rd_en_a &&                addr_a[1] && !addr_a[0]; 
  assign rd_en_column[3] = rd_en_a &&                addr_a[1] &&  addr_a[0]; 

  assign wt_en_column[0] =   wcs_a &&               !addr_a[1] && !addr_a[0]; 
  assign wt_en_column[1] =   wcs_a &&               !addr_a[1] &&  addr_a[0]; 
  assign wt_en_column[2] =   wcs_a &&                addr_a[1] && !addr_a[0]; 
  assign wt_en_column[3] =   wcs_a &&                addr_a[1] &&  addr_a[0]; 

//================================================
  assign din_tr = {                          wdata_b[74],wdata_b[72],wdata_b[70],wdata_b[68],wdata_b[66],wdata_b[64],
                    wdata_b[62],wdata_b[60],wdata_b[58],wdata_b[56],wdata_b[54],wdata_b[52],wdata_b[50],wdata_b[48],
                    wdata_b[46],wdata_b[44],wdata_b[42],wdata_b[40],wdata_b[38],wdata_b[36],wdata_b[34],wdata_b[32],
                    wdata_b[30],wdata_b[28],wdata_b[26],wdata_b[24],wdata_b[22],wdata_b[20],wdata_b[18],wdata_b[16],
                    wdata_b[14],wdata_b[12],wdata_b[10],wdata_b[8],wdata_b[6],wdata_b[4],wdata_b[2],wdata_b[0]};

  assign din_br = {                          wdata_b[75],wdata_b[73],wdata_b[71],wdata_b[69],wdata_b[67],wdata_b[65],
                    wdata_b[63],wdata_b[61],wdata_b[59],wdata_b[57],wdata_b[55],wdata_b[53],wdata_b[51],wdata_b[49],
                    wdata_b[47],wdata_b[45],wdata_b[43],wdata_b[41],wdata_b[39],wdata_b[37],wdata_b[35],wdata_b[33],
                    wdata_b[31],wdata_b[29],wdata_b[27],wdata_b[25],wdata_b[23],wdata_b[21],wdata_b[19],wdata_b[17],
                    wdata_b[15],wdata_b[13],wdata_b[11],wdata_b[9],wdata_b[7],wdata_b[5],wdata_b[3],wdata_b[1]};

  assign din_tl = {                          wdata_b[150],wdata_b[148],wdata_b[146],wdata_b[144],wdata_b[142],wdata_b[140],
                    wdata_b[138],wdata_b[136],wdata_b[134],wdata_b[132],wdata_b[130],wdata_b[128],wdata_b[126],wdata_b[124],
                    wdata_b[122],wdata_b[120],wdata_b[118],wdata_b[116],wdata_b[114],wdata_b[112],wdata_b[110],wdata_b[108],
                    wdata_b[106],wdata_b[104],wdata_b[102],wdata_b[100],wdata_b[98],wdata_b[96],wdata_b[94],wdata_b[92],
                    wdata_b[90],wdata_b[88],wdata_b[86],wdata_b[84],wdata_b[82],wdata_b[80],wdata_b[78],wdata_b[76]};

  assign din_bl = {                          wdata_b[151],wdata_b[149],wdata_b[147],wdata_b[145],wdata_b[143],wdata_b[141],
                    wdata_b[139],wdata_b[137],wdata_b[135],wdata_b[133],wdata_b[131],wdata_b[129],wdata_b[127],wdata_b[125],
                    wdata_b[123],wdata_b[121],wdata_b[119],wdata_b[117],wdata_b[115],wdata_b[113],wdata_b[111],wdata_b[109],
                    wdata_b[107],wdata_b[105],wdata_b[103],wdata_b[101],wdata_b[99],wdata_b[97],wdata_b[95],wdata_b[93],
                    wdata_b[91],wdata_b[89],wdata_b[87],wdata_b[85],wdata_b[83],wdata_b[81],wdata_b[79],wdata_b[77]};

  assign           {                          rd_dout[74],rd_dout[72],rd_dout[70],rd_dout[68],rd_dout[66],rd_dout[64],
                    rd_dout[62],rd_dout[60],rd_dout[58],rd_dout[56],rd_dout[54],rd_dout[52],rd_dout[50],rd_dout[48],
                    rd_dout[46],rd_dout[44],rd_dout[42],rd_dout[40],rd_dout[38],rd_dout[36],rd_dout[34],rd_dout[32],
                    rd_dout[30],rd_dout[28],rd_dout[26],rd_dout[24],rd_dout[22],rd_dout[20],rd_dout[18],rd_dout[16],
                    rd_dout[14],rd_dout[12],rd_dout[10],rd_dout[8],rd_dout[6],rd_dout[4],rd_dout[2],rd_dout[0]}
                   = ary_rdout_tr;

  assign           {                          rd_dout[75],rd_dout[73],rd_dout[71],rd_dout[69],rd_dout[67],rd_dout[65],
                    rd_dout[63],rd_dout[61],rd_dout[59],rd_dout[57],rd_dout[55],rd_dout[53],rd_dout[51],rd_dout[49],
                    rd_dout[47],rd_dout[45],rd_dout[43],rd_dout[41],rd_dout[39],rd_dout[37],rd_dout[35],rd_dout[33],
                    rd_dout[31],rd_dout[29],rd_dout[27],rd_dout[25],rd_dout[23],rd_dout[21],rd_dout[19],rd_dout[17],
                    rd_dout[15],rd_dout[13],rd_dout[11],rd_dout[9],rd_dout[7],rd_dout[5],rd_dout[3],rd_dout[1]}
                   = ary_rdout_br;

  assign           {                          rd_dout[150],rd_dout[148],rd_dout[146],rd_dout[144],rd_dout[142],rd_dout[140],
                    rd_dout[138],rd_dout[136],rd_dout[134],rd_dout[132],rd_dout[130],rd_dout[128],rd_dout[126],rd_dout[124],
                    rd_dout[122],rd_dout[120],rd_dout[118],rd_dout[116],rd_dout[114],rd_dout[112],rd_dout[110],rd_dout[108],
                    rd_dout[106],rd_dout[104],rd_dout[102],rd_dout[100],rd_dout[98],rd_dout[96],rd_dout[94],rd_dout[92],
                    rd_dout[90],rd_dout[88],rd_dout[86],rd_dout[84],rd_dout[82],rd_dout[80],rd_dout[78],rd_dout[76]}
                   = ary_rdout_tl;

  assign           {                          rd_dout[151],rd_dout[149],rd_dout[147],rd_dout[145],rd_dout[143],rd_dout[141],
                    rd_dout[139],rd_dout[137],rd_dout[135],rd_dout[133],rd_dout[131],rd_dout[129],rd_dout[127],rd_dout[125],
                    rd_dout[123],rd_dout[121],rd_dout[119],rd_dout[117],rd_dout[115],rd_dout[113],rd_dout[111],rd_dout[109],
                    rd_dout[107],rd_dout[105],rd_dout[103],rd_dout[101],rd_dout[99],rd_dout[97],rd_dout[95],rd_dout[93],
                    rd_dout[91],rd_dout[89],rd_dout[87],rd_dout[85],rd_dout[83],rd_dout[81],rd_dout[79],rd_dout[77]}
                   = ary_rdout_bl;

//=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=
   n2_niu_sp_512x152s_array niu_sp_512x152s_array_br (
                                                    .din                (din_br[37:0]),
                                                    .rw_addr_subbank    (addr_a[8:2]),
                                                    .rd_addr_column     (rd_addr_column_b[1:0]),
                                                    .rd_en_column       (rd_en_column[3:0]),
                                                    .wt_en_column       (wt_en_column[3:0]),
                                                    .red_value          (red_v_br),
                                                    .repair_en          (red_en_br),
                                                    .l1clk              (l1clk_2x_free),
                                                    .ary_rdout          (ary_rdout_br)
                                                   );

   n2_niu_sp_512x152s_array niu_sp_512x152s_array_tr (
                                                    .din                (din_tr[37:0]),
                                                    .rw_addr_subbank    (addr_a[8:2]),
                                                    .rd_addr_column     (rd_addr_column_b[1:0]),
                                                    .rd_en_column       (rd_en_column[3:0]),
                                                    .wt_en_column       (wt_en_column[3:0]),
                                                    .red_value          (red_v_tr),
                                                    .repair_en          (red_en_tr),
                                                    .l1clk              (l1clk_2x_free),
                                                    .ary_rdout          (ary_rdout_tr)
                                                   );

   n2_niu_sp_512x152s_array niu_sp_512x152s_array_bl (
                                                    .din                (din_bl[37:0]),
                                                    .rw_addr_subbank    (addr_a[8:2]),
                                                    .rd_addr_column     (rd_addr_column_b[1:0]),
                                                    .rd_en_column       (rd_en_column[3:0]),
                                                    .wt_en_column       (wt_en_column[3:0]),
                                                    .red_value          (red_v_bl),
                                                    .repair_en          (red_en_bl),
                                                    .l1clk              (l1clk_2x_free),
                                                    .ary_rdout          (ary_rdout_bl)
                                                   );

   n2_niu_sp_512x152s_array niu_sp_512x152s_array_tl (
                                                    .din                (din_tl[37:0]),
                                                    .rw_addr_subbank    (addr_a[8:2]),
                                                    .rd_addr_column     (rd_addr_column_b[1:0]),
                                                    .rd_en_column       (rd_en_column[3:0]),
                                                    .wt_en_column       (wt_en_column[3:0]),
                                                    .red_value          (red_v_tl),
                                                    .repair_en          (red_en_tl),
                                                    .l1clk              (l1clk_2x_free),
                                                    .ary_rdout          (ary_rdout_tl)
                                                   );

  assign dout = rd_dout[151:0];

// fixscan start:
  assign dff_wdata_m_scanin[151]   = scan_in   ;
  assign dff_wdata_m_scanin[150]   = dff_wdata_m_scanout[151] ;
  assign dff_wdata_m_scanin[149]   = dff_wdata_m_scanout[150] ;
  assign dff_wdata_m_scanin[148]   = dff_wdata_m_scanout[149] ;
  assign dff_wdata_m_scanin[147]   = dff_wdata_m_scanout[148] ;
  assign dff_wdata_m_scanin[146]   = dff_wdata_m_scanout[147] ;
  assign dff_wdata_m_scanin[145]   = dff_wdata_m_scanout[146] ;
  assign dff_wdata_m_scanin[144]   = dff_wdata_m_scanout[145] ;
  assign dff_wdata_m_scanin[143]   = dff_wdata_m_scanout[144] ;
  assign dff_wdata_m_scanin[142]   = dff_wdata_m_scanout[143] ;
  assign dff_wdata_m_scanin[141]   = dff_wdata_m_scanout[142] ;
  assign dff_wdata_m_scanin[140]   = dff_wdata_m_scanout[141] ;
  assign dff_wdata_m_scanin[139]   = dff_wdata_m_scanout[140] ;
  assign dff_wdata_m_scanin[138]   = dff_wdata_m_scanout[139] ;
  assign dff_wdata_m_scanin[137]   = dff_wdata_m_scanout[138] ;
  assign dff_wdata_m_scanin[136]   = dff_wdata_m_scanout[137] ;
  assign dff_wdata_m_scanin[135]   = dff_wdata_m_scanout[136] ;
  assign dff_wdata_m_scanin[134]   = dff_wdata_m_scanout[135] ;
  assign dff_wdata_m_scanin[133]   = dff_wdata_m_scanout[134] ;
  assign dff_wdata_m_scanin[132]   = dff_wdata_m_scanout[133] ;
  assign dff_wdata_m_scanin[131]   = dff_wdata_m_scanout[132] ;
  assign dff_wdata_m_scanin[130]   = dff_wdata_m_scanout[131] ;
  assign dff_wdata_m_scanin[129]   = dff_wdata_m_scanout[130] ;
  assign dff_wdata_m_scanin[128]   = dff_wdata_m_scanout[129] ;
  assign dff_wdata_m_scanin[127]   = dff_wdata_m_scanout[128] ;
  assign dff_wdata_m_scanin[126]   = dff_wdata_m_scanout[127] ;
  assign dff_wdata_m_scanin[125]   = dff_wdata_m_scanout[126] ;
  assign dff_wdata_m_scanin[124]   = dff_wdata_m_scanout[125] ;
  assign dff_wdata_m_scanin[123]   = dff_wdata_m_scanout[124] ;
  assign dff_wdata_m_scanin[122]   = dff_wdata_m_scanout[123] ;
  assign dff_wdata_m_scanin[121]   = dff_wdata_m_scanout[122] ;
  assign dff_wdata_m_scanin[120]   = dff_wdata_m_scanout[121] ;
  assign dff_wdata_m_scanin[119]   = dff_wdata_m_scanout[120] ;
  assign dff_wdata_m_scanin[118]   = dff_wdata_m_scanout[119] ;
  assign dff_wdata_m_scanin[117]   = dff_wdata_m_scanout[118] ;
  assign dff_wdata_m_scanin[116]   = dff_wdata_m_scanout[117] ;
  assign dff_wdata_m_scanin[115]   = dff_wdata_m_scanout[116] ;
  assign dff_wdata_m_scanin[114]   = dff_wdata_m_scanout[115] ;
  assign dff_wdata_m_scanin[113]   = dff_wdata_m_scanout[114] ;
  assign dff_wdata_m_scanin[112]   = dff_wdata_m_scanout[113] ;
  assign dff_wdata_m_scanin[111]   = dff_wdata_m_scanout[112] ;
  assign dff_wdata_m_scanin[110]   = dff_wdata_m_scanout[111] ;
  assign dff_wdata_m_scanin[109]   = dff_wdata_m_scanout[110] ;
  assign dff_wdata_m_scanin[108]   = dff_wdata_m_scanout[109] ;
  assign dff_wdata_m_scanin[107]   = dff_wdata_m_scanout[108] ;
  assign dff_wdata_m_scanin[106]   = dff_wdata_m_scanout[107] ;
  assign dff_wdata_m_scanin[105]   = dff_wdata_m_scanout[106] ;
  assign dff_wdata_m_scanin[104]   = dff_wdata_m_scanout[105] ;
  assign dff_wdata_m_scanin[103]   = dff_wdata_m_scanout[104] ;
  assign dff_wdata_m_scanin[102]   = dff_wdata_m_scanout[103] ;
  assign dff_wdata_m_scanin[101]   = dff_wdata_m_scanout[102] ;
  assign dff_wdata_m_scanin[100]   = dff_wdata_m_scanout[101] ;
  assign dff_wdata_m_scanin[99]	  = dff_wdata_m_scanout[100] ;
  assign dff_wdata_m_scanin[98]	  = dff_wdata_m_scanout[99] ;
  assign dff_wdata_m_scanin[97]	  = dff_wdata_m_scanout[98] ;
  assign dff_wdata_m_scanin[96]	  = dff_wdata_m_scanout[97] ;
  assign dff_wdata_m_scanin[95]	  = dff_wdata_m_scanout[96] ;
  assign dff_wdata_m_scanin[94]	  = dff_wdata_m_scanout[95] ;
  assign dff_wdata_m_scanin[93]	  = dff_wdata_m_scanout[94] ;
  assign dff_wdata_m_scanin[92]	  = dff_wdata_m_scanout[93] ;
  assign dff_wdata_m_scanin[91]	  = dff_wdata_m_scanout[92] ;
  assign dff_wdata_m_scanin[90]	  = dff_wdata_m_scanout[91] ;
  assign dff_wdata_m_scanin[89]	  = dff_wdata_m_scanout[90] ;
  assign dff_wdata_m_scanin[88]	  = dff_wdata_m_scanout[89] ;
  assign dff_wdata_m_scanin[87]	  = dff_wdata_m_scanout[88] ;
  assign dff_wdata_m_scanin[86]	  = dff_wdata_m_scanout[87] ;
  assign dff_wdata_m_scanin[85]	  = dff_wdata_m_scanout[86] ;
  assign dff_wdata_m_scanin[84]	  = dff_wdata_m_scanout[85] ;
  assign dff_wdata_m_scanin[83]	  = dff_wdata_m_scanout[84] ;
  assign dff_wdata_m_scanin[82]	  = dff_wdata_m_scanout[83] ;
  assign dff_wdata_m_scanin[81]	  = dff_wdata_m_scanout[82] ;
  assign dff_wdata_m_scanin[80]	  = dff_wdata_m_scanout[81] ;
  assign dff_wdata_m_scanin[79]	  = dff_wdata_m_scanout[80] ;
  assign dff_wdata_m_scanin[78]	  = dff_wdata_m_scanout[79] ;
  assign dff_wdata_m_scanin[77]	  = dff_wdata_m_scanout[78] ;
  assign dff_wdata_m_scanin[76]	  = dff_wdata_m_scanout[77] ;
 
  assign dff_wr_adr_m_scanin[0]	   = dff_wdata_m_scanout[76] ;
  assign dff_rd_adr_m_scanin[0]	   = dff_wr_adr_m_scanout[0] ;
  assign dff_wr_adr_m_scanin[1]	   = dff_rd_adr_m_scanout[0] ;
  assign dff_rd_adr_m_scanin[1]	   = dff_wr_adr_m_scanout[1] ;
  assign dff_wr_adr_m_scanin[2]	   = dff_rd_adr_m_scanout[1] ;
  assign dff_rd_adr_m_scanin[2]	   = dff_wr_adr_m_scanout[2] ;
  assign dff_wr_adr_m_scanin[3]	   = dff_rd_adr_m_scanout[2] ;
  assign dff_rd_adr_m_scanin[3]	   = dff_wr_adr_m_scanout[3] ;
  assign dff_wr_adr_m_scanin[4]	   = dff_rd_adr_m_scanout[3] ;
  assign dff_rd_adr_m_scanin[4]	   = dff_wr_adr_m_scanout[4] ;
  assign dff_wr_adr_m_scanin[5]	   = dff_rd_adr_m_scanout[4] ;
  assign dff_rd_adr_m_scanin[5]	   = dff_wr_adr_m_scanout[5] ;
  assign dff_wr_adr_m_scanin[6]	   = dff_rd_adr_m_scanout[5] ;
  assign dff_rd_adr_m_scanin[6]	   = dff_wr_adr_m_scanout[6] ;
  assign dff_wr_adr_m_scanin[7]	   = dff_rd_adr_m_scanout[6] ;
  assign dff_rd_adr_m_scanin[7]	   = dff_wr_adr_m_scanout[7] ;
  assign dff_wr_adr_m_scanin[8]	   = dff_rd_adr_m_scanout[7] ;
  assign dff_rd_adr_m_scanin[8]	   = dff_wr_adr_m_scanout[8] ;
  assign dff_wr_en_m_scanin    	   = dff_rd_adr_m_scanout[8] ;
  assign dff_rd_en_m_scanin	   = dff_wr_en_m_scanout    ;
  assign dff_test_clk_scanin	   = dff_rd_en_m_scanout	;
  assign dff_test_mode_scanin	   = dff_test_clk_scanout	;
  assign dff_wdata_m_scanin[75]	  = dff_test_mode_scanout   ;
  assign dff_wdata_m_scanin[74]	  = dff_wdata_m_scanout[75] ;
  assign dff_wdata_m_scanin[73]	  = dff_wdata_m_scanout[74] ;
  assign dff_wdata_m_scanin[72]	  = dff_wdata_m_scanout[73] ;
  assign dff_wdata_m_scanin[71]	  = dff_wdata_m_scanout[72] ;
  assign dff_wdata_m_scanin[70]	  = dff_wdata_m_scanout[71] ;
  assign dff_wdata_m_scanin[69]	  = dff_wdata_m_scanout[70] ;
  assign dff_wdata_m_scanin[68]	  = dff_wdata_m_scanout[69] ;
  assign dff_wdata_m_scanin[67]	  = dff_wdata_m_scanout[68] ;
  assign dff_wdata_m_scanin[66]	  = dff_wdata_m_scanout[67] ;
  assign dff_wdata_m_scanin[65]	  = dff_wdata_m_scanout[66] ;
  assign dff_wdata_m_scanin[64]	  = dff_wdata_m_scanout[65] ;
  assign dff_wdata_m_scanin[63]	  = dff_wdata_m_scanout[64] ;
  assign dff_wdata_m_scanin[62]	  = dff_wdata_m_scanout[63] ;
  assign dff_wdata_m_scanin[61]	  = dff_wdata_m_scanout[62] ;
  assign dff_wdata_m_scanin[60]	  = dff_wdata_m_scanout[61] ;
  assign dff_wdata_m_scanin[59]	  = dff_wdata_m_scanout[60] ;
  assign dff_wdata_m_scanin[58]	  = dff_wdata_m_scanout[59] ;
  assign dff_wdata_m_scanin[57]	  = dff_wdata_m_scanout[58] ;
  assign dff_wdata_m_scanin[56]	  = dff_wdata_m_scanout[57] ;
  assign dff_wdata_m_scanin[55]	  = dff_wdata_m_scanout[56] ;
  assign dff_wdata_m_scanin[54]	  = dff_wdata_m_scanout[55] ;
  assign dff_wdata_m_scanin[53]	  = dff_wdata_m_scanout[54] ;
  assign dff_wdata_m_scanin[52]	  = dff_wdata_m_scanout[53] ;
  assign dff_wdata_m_scanin[51]	  = dff_wdata_m_scanout[52] ;
  assign dff_wdata_m_scanin[50]	  = dff_wdata_m_scanout[51] ;
  assign dff_wdata_m_scanin[49]	  = dff_wdata_m_scanout[50] ;
  assign dff_wdata_m_scanin[48]	  = dff_wdata_m_scanout[49] ;
  assign dff_wdata_m_scanin[47]	  = dff_wdata_m_scanout[48] ;
  assign dff_wdata_m_scanin[46]	  = dff_wdata_m_scanout[47] ;
  assign dff_wdata_m_scanin[45]	  = dff_wdata_m_scanout[46] ;
  assign dff_wdata_m_scanin[44]	  = dff_wdata_m_scanout[45] ;
  assign dff_wdata_m_scanin[43]	  = dff_wdata_m_scanout[44] ;
  assign dff_wdata_m_scanin[42]	  = dff_wdata_m_scanout[43] ;
  assign dff_wdata_m_scanin[41]	  = dff_wdata_m_scanout[42] ;
  assign dff_wdata_m_scanin[40]	  = dff_wdata_m_scanout[41] ;
  assign dff_wdata_m_scanin[39]	  = dff_wdata_m_scanout[40] ;
  assign dff_wdata_m_scanin[38]	  = dff_wdata_m_scanout[39] ;
  assign dff_wdata_m_scanin[37]	  = dff_wdata_m_scanout[38] ;
  assign dff_wdata_m_scanin[36]	  = dff_wdata_m_scanout[37] ;
  assign dff_wdata_m_scanin[35]	  = dff_wdata_m_scanout[36] ;
  assign dff_wdata_m_scanin[34]	  = dff_wdata_m_scanout[35] ;
  assign dff_wdata_m_scanin[33]	  = dff_wdata_m_scanout[34] ;
  assign dff_wdata_m_scanin[32]	  = dff_wdata_m_scanout[33] ;
  assign dff_wdata_m_scanin[31]	  = dff_wdata_m_scanout[32] ;
  assign dff_wdata_m_scanin[30]	  = dff_wdata_m_scanout[31] ;
  assign dff_wdata_m_scanin[29]	  = dff_wdata_m_scanout[30] ;
  assign dff_wdata_m_scanin[28]	  = dff_wdata_m_scanout[29] ;
  assign dff_wdata_m_scanin[27]	  = dff_wdata_m_scanout[28] ;
  assign dff_wdata_m_scanin[26]	  = dff_wdata_m_scanout[27] ;
  assign dff_wdata_m_scanin[25]	  = dff_wdata_m_scanout[26] ;
  assign dff_wdata_m_scanin[24]	  = dff_wdata_m_scanout[25] ;
  assign dff_wdata_m_scanin[23]	  = dff_wdata_m_scanout[24] ;
  assign dff_wdata_m_scanin[22]	  = dff_wdata_m_scanout[23] ;
  assign dff_wdata_m_scanin[21]	  = dff_wdata_m_scanout[22] ;
  assign dff_wdata_m_scanin[20]	  = dff_wdata_m_scanout[21] ;
  assign dff_wdata_m_scanin[19]	  = dff_wdata_m_scanout[20] ;
  assign dff_wdata_m_scanin[18]	  = dff_wdata_m_scanout[19] ;
  assign dff_wdata_m_scanin[17]	  = dff_wdata_m_scanout[18] ;
  assign dff_wdata_m_scanin[16]	  = dff_wdata_m_scanout[17] ;
  assign dff_wdata_m_scanin[15]	  = dff_wdata_m_scanout[16] ;
  assign dff_wdata_m_scanin[14]	  = dff_wdata_m_scanout[15] ;
  assign dff_wdata_m_scanin[13]	  = dff_wdata_m_scanout[14] ;
  assign dff_wdata_m_scanin[12]	  = dff_wdata_m_scanout[13] ;
  assign dff_wdata_m_scanin[11]	  = dff_wdata_m_scanout[12] ;
  assign dff_wdata_m_scanin[10]	  = dff_wdata_m_scanout[11] ;
  assign dff_wdata_m_scanin[9]	 = dff_wdata_m_scanout[10] ;
  assign dff_wdata_m_scanin[8]	 = dff_wdata_m_scanout[9] ;
  assign dff_wdata_m_scanin[7]	 = dff_wdata_m_scanout[8] ;
  assign dff_wdata_m_scanin[6]	 = dff_wdata_m_scanout[7] ;
  assign dff_wdata_m_scanin[5]	 = dff_wdata_m_scanout[6] ;
  assign dff_wdata_m_scanin[4]	 = dff_wdata_m_scanout[5] ;
  assign dff_wdata_m_scanin[3]	 = dff_wdata_m_scanout[4] ;
  assign dff_wdata_m_scanin[2]	 = dff_wdata_m_scanout[3] ;
  assign dff_wdata_m_scanin[1]	 = dff_wdata_m_scanout[2] ;
  assign dff_wdata_m_scanin[0]	 = dff_wdata_m_scanout[1] ;
  assign scan_out		 = dff_wdata_m_scanout[0] ;

// fixscan end:

endmodule



//
//   invert macro
//
//





module niu512_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;









cl_u1_inv_1x d0_0 (
.in(din[0]),
.out(dout[0])
);





endmodule





//  
//   and macro for ports = 2,3,4
//
//





module niu512_and_macro__width_1 (
  din0, 
  din1, 
  dout);
wire [0:0] nandout;

  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;









cl_u1_nand2_1x d0_0 (
.in0(din0[0]),
.in1(din1[0]),
.out(nandout[0])
);

cl_u1_inv_1x d1_0 (
.in(nandout[0]),
.out(dout[0])
);




endmodule





//  
//   and macro for ports = 2,3,4
//
//





module niu512_and_macro__width_9 (
  din0, 
  din1, 
  dout);
wire [8:0] nandout;

  input [8:0] din0;
  input [8:0] din1;
  output [8:0] dout;









cl_u1_nand2_1x d0_0 (
.in0(din0[0]),
.in1(din1[0]),
.out(nandout[0])
);

cl_u1_nand2_1x d0_1 (
.in0(din0[1]),
.in1(din1[1]),
.out(nandout[1])
);

cl_u1_nand2_1x d0_2 (
.in0(din0[2]),
.in1(din1[2]),
.out(nandout[2])
);

cl_u1_nand2_1x d0_3 (
.in0(din0[3]),
.in1(din1[3]),
.out(nandout[3])
);

cl_u1_nand2_1x d0_4 (
.in0(din0[4]),
.in1(din1[4]),
.out(nandout[4])
);

cl_u1_nand2_1x d0_5 (
.in0(din0[5]),
.in1(din1[5]),
.out(nandout[5])
);

cl_u1_nand2_1x d0_6 (
.in0(din0[6]),
.in1(din1[6]),
.out(nandout[6])
);

cl_u1_nand2_1x d0_7 (
.in0(din0[7]),
.in1(din1[7]),
.out(nandout[7])
);

cl_u1_nand2_1x d0_8 (
.in0(din0[8]),
.in1(din1[8]),
.out(nandout[8])
);

cl_u1_inv_1x d1_0 (
.in(nandout[0]),
.out(dout[0])
);
cl_u1_inv_1x d1_1 (
.in(nandout[1]),
.out(dout[1])
);
cl_u1_inv_1x d1_2 (
.in(nandout[2]),
.out(dout[2])
);
cl_u1_inv_1x d1_3 (
.in(nandout[3]),
.out(dout[3])
);
cl_u1_inv_1x d1_4 (
.in(nandout[4]),
.out(dout[4])
);
cl_u1_inv_1x d1_5 (
.in(nandout[5]),
.out(dout[5])
);
cl_u1_inv_1x d1_6 (
.in(nandout[6]),
.out(dout[6])
);
cl_u1_inv_1x d1_7 (
.in(nandout[7]),
.out(dout[7])
);
cl_u1_inv_1x d1_8 (
.in(nandout[8]),
.out(dout[8])
);




endmodule





//  
//   or macro for ports = 2,3
//
//





module niu512_or_macro__width_9 (
  din0, 
  din1, 
  dout);
wire [8:0] norout;

  input [8:0] din0;
  input [8:0] din1;
  output [8:0] dout;









cl_u1_nor2_1x d0_0 (
.in0(din0[0]),
.in1(din1[0]),
.out(norout[0])
);

cl_u1_nor2_1x d0_1 (
.in0(din0[1]),
.in1(din1[1]),
.out(norout[1])
);

cl_u1_nor2_1x d0_2 (
.in0(din0[2]),
.in1(din1[2]),
.out(norout[2])
);

cl_u1_nor2_1x d0_3 (
.in0(din0[3]),
.in1(din1[3]),
.out(norout[3])
);

cl_u1_nor2_1x d0_4 (
.in0(din0[4]),
.in1(din1[4]),
.out(norout[4])
);

cl_u1_nor2_1x d0_5 (
.in0(din0[5]),
.in1(din1[5]),
.out(norout[5])
);

cl_u1_nor2_1x d0_6 (
.in0(din0[6]),
.in1(din1[6]),
.out(norout[6])
);

cl_u1_nor2_1x d0_7 (
.in0(din0[7]),
.in1(din1[7]),
.out(norout[7])
);

cl_u1_nor2_1x d0_8 (
.in0(din0[8]),
.in1(din1[8]),
.out(norout[8])
);

cl_u1_inv_1x d1_0 (
.in(norout[0]),
.out(dout[0])
);
cl_u1_inv_1x d1_1 (
.in(norout[1]),
.out(dout[1])
);
cl_u1_inv_1x d1_2 (
.in(norout[2]),
.out(dout[2])
);
cl_u1_inv_1x d1_3 (
.in(norout[3]),
.out(dout[3])
);
cl_u1_inv_1x d1_4 (
.in(norout[4]),
.out(dout[4])
);
cl_u1_inv_1x d1_5 (
.in(norout[5]),
.out(dout[5])
);
cl_u1_inv_1x d1_6 (
.in(norout[6]),
.out(dout[6])
);
cl_u1_inv_1x d1_7 (
.in(norout[7]),
.out(dout[7])
);
cl_u1_inv_1x d1_8 (
.in(norout[8]),
.out(dout[8])
);




endmodule





module n2_niu_sp_512x152s_array (
  din, 
  rw_addr_subbank, 
  rd_addr_column, 
  rd_en_column, 
  wt_en_column, 
  red_value, 
  repair_en, 
  l1clk, 
  ary_rdout); 

input            [37:0] din;
input             [6:0] rw_addr_subbank;
input             [1:0] rd_addr_column;
input             [3:0] rd_en_column;
input             [3:0] wt_en_column;
input             [5:0] red_value;
input                   repair_en;
input                   l1clk;

output           [37:0] ary_rdout;

wire             [37:0] ary_rdout;

wire             [37:0] ary_rdout_c0;
wire             [37:0] ary_rdout_c1;
wire             [37:0] ary_rdout_c2;
wire             [37:0] ary_rdout_c3;

  n2_niu_sp_512x152s_subbank niu_sp_512x152s_subbank_c0 (
                                                       .din            (din),
                                                       .rw_addr        (rw_addr_subbank),
                                                       .rd_en          (rd_en_column[0]),
                                                       .wt_en          (wt_en_column[0]),
                                                       .red_value      (red_value),
                                                       .repair_en      (repair_en),
                                                       .l1clk          (l1clk),
                                                       .ary_rdout      (ary_rdout_c0)
                                                      );

  n2_niu_sp_512x152s_subbank niu_sp_512x152s_subbank_c1 (
                                                       .din            (din),
                                                       .rw_addr        (rw_addr_subbank),
                                                       .rd_en          (rd_en_column[1]),
                                                       .wt_en          (wt_en_column[1]),
                                                       .red_value      (red_value),
                                                       .repair_en      (repair_en),
                                                       .l1clk          (l1clk),
                                                       .ary_rdout      (ary_rdout_c1)
                                                      );

  n2_niu_sp_512x152s_subbank niu_sp_512x152s_subbank_c2 (
                                                       .din            (din),
                                                       .rw_addr        (rw_addr_subbank),
                                                       .rd_en          (rd_en_column[2]),
                                                       .wt_en          (wt_en_column[2]),
                                                       .red_value      (red_value),
                                                       .repair_en      (repair_en),
                                                       .l1clk          (l1clk),
                                                       .ary_rdout      (ary_rdout_c2)
                                                      );

  n2_niu_sp_512x152s_subbank niu_sp_512x152s_subbank_c3 (
                                                       .din            (din),
                                                       .rw_addr        (rw_addr_subbank),
                                                       .rd_en          (rd_en_column[3]),
                                                       .wt_en          (wt_en_column[3]),
                                                       .red_value      (red_value),
                                                       .repair_en      (repair_en),
                                                       .l1clk          (l1clk),
                                                       .ary_rdout      (ary_rdout_c3)
                                                      );


assign ary_rdout = rd_addr_column[1]? ( rd_addr_column[0]? ary_rdout_c3: ary_rdout_c2 ) :  
				      ( rd_addr_column[0]? ary_rdout_c1: ary_rdout_c0);


endmodule



module n2_niu_sp_512x152s_subbank (
  din, 
  rw_addr, 
  rd_en, 
  wt_en, 
  red_value, 
  repair_en, 
  l1clk, 
  ary_rdout); 
//                             din,
//                             rw_addr,
//                             rd_en,
//                             wt_en,
//                             red_value,
//                             repair_en,
//                             l1clk,
//                             ary_rdout
//                            );       

input            [37:0] din;
input             [6:0] rw_addr;
input                   rd_en;
input                   wt_en;
input             [5:0] red_value;
input                   repair_en;
input                   l1clk;

output           [37:0] ary_rdout;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------
// checker to verify on accesses's that no bits are x
// 0in kndr -var rw_addr
// 0in kndr -var rd_en
// 0in kndr -var wt_en
// 0in kndr -var red_value
// 0in kndr -var repair_en

wire             [37:0] ary_rdout;

wire             [38:0] wr_data;

reg              [38:0] mem_ary_dout;

integer                 n;

//`ifndef INNOLOGIC
//// Emulate reset
//integer i;
//initial begin
//  for (i=0; i<128; i=i+1) begin
//    mem[i]     = {39{1'b0}};
//  end
//  mem_ary_dout = {39{1'b0}};
//end
//`endif

//////////////////////////////
// Redundancy write shifter //
//////////////////////////////
reg              [38:0] wr_data_rep;

wire             [31:0] red_value_32bit = {{(32-6){1'h0}},red_value}; // 0in < max 37 -active ( (repair_en==1'b1) && (l1clk==1'b1) ) -group mbist_mode


wire [38:0] shift_col_en = {39{~repair_en}} |
                        ( { {37{1'b1}}, {2'b00} } << red_value[5:0] ) ;

assign wr_data[38:0] = (~shift_col_en & {{1'b0}, din}) | (shift_col_en & {din, {din[0]}}) ;


//////////////////////////////
// Read/write array         //
//////////////////////////////
reg                     rd_en_blat;

  always @ (l1clk or rd_en)
    if (!l1clk)
      rd_en_blat = rd_en;
    else
      rd_en_blat = rd_en_blat;

`ifdef AXIS_SMEM_BAD

// internal variable
integer		 k, l;

reg	[38:0]	 write_mask;

wire	[38:0]	 axis_dout ;
wire	[38:0]	 axis_din = wr_data ;
wire	[6:0]	 axis_waddr = rw_addr ;
wire	[6:0]	 axis_raddr = rw_addr ;
wire		 axis_wen = wt_en ;
wire		 axis_ren = rd_en ;
wire		 axis_clk = l1clk ;

axis_smem #(7, 39, 2, 1'b0) mem		   // addr_width,data_width,num_ports,init_value
( {axis_dout		 , {39{1'bz}}	 },	   // Output Port  (1,2)
  {{39{1'bz}}		 , axis_din	 },	   // Input Port   (1,2)
  {axis_raddr		 , axis_waddr	 },	   // Address Port (1,2)
  {1'b0			 , axis_wen	 },	   // Write Enable (1,2)
  {1'b1			 , 1'b1		 },	   // Chip Enable  (1,2)
  {axis_clk		 , axis_clk	 },	   // Port Clocks  (1,2)
  {{39{1'bz}}		 , {39{1'bz}}}	);	   // Write Mask   (1,2)

always @(posedge l1clk) begin
	if (rd_en_blat) begin
		if (axis_wen)
			mem_ary_dout   <= 39'hx;
		else
			mem_ary_dout   <= axis_dout;
	end
end

`else

reg              [38:0] mem[0:128-1];

  always @ (negedge l1clk) begin
    if (wt_en) begin
        if(rd_en)
            mem[rw_addr[6:0]] <= {39{1'hx}}; // 0in < fire -severity 1 -message "Detected rd/wr collision in NIU 512x152s RAM, dout driven as X's" -group mbist_mode
        else
            mem[rw_addr[6:0]] <= wr_data;
    end
  end


  always @(posedge l1clk) begin
    if (rd_en_blat) begin
        if (wt_en)
            mem_ary_dout   <= {39{1'hx}}; // 0in < fire -severity 1 -message "Detected rd/wr collision in NIU 512x152s RAM, dout driven as X's" -group mbist_mode


        else
            mem_ary_dout   <= mem[rw_addr[6:0]] ;
    end
  end

// Initialize the arrays.
`ifndef NOINITMEM
integer j;
initial begin
  for (j=0;j<128;j=j+1) begin
  mem[j] =  39'd0;
  end
  mem_ary_dout[38:0] = 39'h0;
end

`endif // NOINITMEM

`endif // AXIS_SMEM

//////////////////////////////
// Redundancy read shifter  //
//////////////////////////////
reg              [37:0] mem_ary_dout_rep;

  always @(red_value_32bit or mem_ary_dout ) begin
    for (n = 0; n < 38; n = n + 1) begin
      if ( n <= (red_value_32bit))
        mem_ary_dout_rep[n] = mem_ary_dout[n];
      else
        mem_ary_dout_rep[n] = mem_ary_dout[n+1];
    end
  end

  assign ary_rdout = repair_en ? mem_ary_dout_rep : mem_ary_dout[38:1];




supply0 vss;
supply1 vdd;

endmodule




module n2_niu_dp_512x152s_repair (
  aclk, 
  bclk, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  pce, 
  tcu_pce_ov, 
  tcu_scan_en, 
  tcu_array_wr_inhibit, 
  scanin_red, 
  hdr_sram_rvalue, 
  hdr_sram_rid, 
  hdr_sram_wr_en, 
  hdr_sram_red_clr, 
  l2clk, 
  sram_hdr_read_data, 
  red_v_br, 
  red_v_bl, 
  red_v_tr, 
  red_v_tl, 
  red_en_br, 
  red_en_bl, 
  red_en_tr, 
  red_en_tl, 
  scanout_red);
wire l1clk_in_en;
wire l1clk_out_en;
wire l1clk_gate_en;
 

input                   aclk;
input                   bclk;
input                   tcu_se_scancollar_in;
input                   tcu_se_scancollar_out;
input                   pce;
input                   tcu_pce_ov;
input                   tcu_scan_en;
input                   tcu_array_wr_inhibit;         // direct input, not flopped
input                   scanin_red;
input             [6:0] hdr_sram_rvalue;
input             [1:0] hdr_sram_rid;
input                   hdr_sram_wr_en;
input                   hdr_sram_red_clr;

input                   l2clk;

output            [6:0] sram_hdr_read_data;

output            [5:0] red_v_br;      // to subbank
output            [5:0] red_v_bl;
output            [5:0] red_v_tr;
output            [5:0] red_v_tl;
output            	red_en_br;  
output            	red_en_bl;  
output            	red_en_tr;  
output            	red_en_tl;  

output                  scanout_red;

wire              [6:0] sram_hdr_read_data;

wire              [5:0] red_v_br;      // to subbank
wire              [5:0] red_v_bl;
wire              [5:0] red_v_tr;
wire              [5:0] red_v_tl;
wire            	red_en_br;  
wire            	red_en_bl;  
wire            	red_en_tr;  
wire            	red_en_tl;  

wire              [5:0] red_value_b0;      // to subbank
wire              [5:0] red_value_b1;
wire              [5:0] red_value_b2;
wire              [5:0] red_value_b3;
wire              [3:0] repair_en_bk;      // to subbank

wire                    scanout_red;

assign red_v_bl = red_value_b0;
assign red_v_br = red_value_b1;
assign red_v_tl = red_value_b2;
assign red_v_tr = red_value_b3;

assign red_en_bl = repair_en_bk[0];
assign red_en_br = repair_en_bk[1];
assign red_en_tl = repair_en_bk[2];
assign red_en_tr = repair_en_bk[3];


// scan renames
wire   siclk    = aclk;
wire   soclk    = bclk;
// end scan

wire              [3:0] red_id;
wire              [3:0] red_reg_clk_p;
wire              [5:0] fuse_red_data;
wire                    fuse_red_enable;

wire              [5:0] red_data_reg_b0;
wire              [5:0] red_data_reg_b1;
wire              [5:0] red_data_reg_b2;
wire              [5:0] red_data_reg_b3;
wire              [3:0] red_en_reg_bk; 

wire              [3:0] scan_input_bk;
wire              [3:0] scan_output_bk;

//=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=
//================================================
// l2 clock Domain: Clock headers
//================================================
wire                    l1clk_in;
wire                    l1clk_gate;
wire                    l1clk_out;

//cl_sc1_l1hdr_8x l1ch_in (
//                                .l2clk          (l2clk),
//                                .pce            (pce),
//                                .l1clk          (l1clk_in),
//                                .se             (tcu_se_scancollar_in),
//                                .pce_ov         (tcu_pce_ov),
//                                .stop           (1'b0)
//                        );


//cl_sc1_l1hdr_8x l1ch_out (
//                                .l2clk          (l2clk),
//                                .pce            (pce),
//                                .l1clk          (l1clk_out),
//                                .se             (tcu_se_scancollar_out),
//                                .pce_ov         (tcu_pce_ov),
//                                .stop           (1'b0)
//                          );

//cl_sc1_l1hdr_8x l1ch_gate (
//                                .l2clk          (l2clk),
//                                .pce            (pce),
//                                .l1clk          (l1clk_gate),
//                                .se             (tcu_scan_en),
//                                .pce_ov         (tcu_pce_ov),
//                                .stop           (1'b0)
//                          );

///////////////////////////////////
// decomposed l1hdr for l1clk_in
///////////////////////////////////

cl_mc1_l1enable_12x l1ch_in_l1en (
                                .l2clk          (l2clk),
                                .pce            (pce),
                                .pce_ov         (tcu_pce_ov),
                                .l1en           (l1clk_in_en)
                        );

cl_mc1_l1driver_12x l1ch_in_l1drvr (
                                .se             (tcu_se_scancollar_in),
                                .l1en           (l1clk_in_en),
                                .l1clk          (l1clk_in),
  .l2clk(l2clk)
                        );

///////////////////////////////////
// decomposed l1hdr for l1clk_out
///////////////////////////////////

cl_mc1_l1enable_12x l1ch_out_l1en (
                                .l2clk          (l2clk),
                                .pce            (pce),
                                .pce_ov         (tcu_pce_ov),
                                .l1en           (l1clk_out_en)
                        );

cl_mc1_l1driver_12x l1ch_out_l1drvr (
                                .se             (tcu_se_scancollar_out),
                                .l1en           (l1clk_out_en),
                                .l1clk          (l1clk_out),
  .l2clk(l2clk)
                        );


///////////////////////////////////
// decomposed l1hdr for l1clk_gate
///////////////////////////////////

cl_mc1_l1enable_12x l1ch_gate_l1en (
                                .l2clk          (l2clk),
                                .pce            (pce),
                                .pce_ov         (tcu_pce_ov),
                                .l1en           (l1clk_gate_en)
                        );

cl_mc1_l1driver_12x l1ch_gate_l1drvr (
                                .se             (tcu_scan_en),
                                .l1en           (l1clk_gate_en),
                                .l1clk          (l1clk_gate),
  .l2clk(l2clk)
                        );



//================================================
//  l2 clock Domain: Input flops
//================================================

/****************************************************/
wire              [5:0] fuse_niu_repair_value;
wire                    fuse_niu_repair_en;
wire              [1:0] fuse_niu_rid;
wire                    fuse_niu_wen;
wire                    fuse_red_reset;

wire                    dff_rvalue_m_scanin;
wire                    dff_rvalue_m_scanout;
wire                    dff_rid_m_scanin;
wire                    dff_rid_m_scanout;
wire                    dff_wr_en_m_scanin;
wire                    dff_wr_en_m_scanout;
wire                    dff_red_clr_m_scanin;
wire                    dff_red_clr_m_scanout;

wire                    sr10;
wire                    hdr_wr_en;
wire                    hdr_red_clr;

  niu512_msff_ctl_macro__width_7 srhdr_rvalue  (
    .scan_in    (dff_rvalue_m_scanin),
    .scan_out   (dff_rvalue_m_scanout),
    .l1clk      (l1clk_in),
    .din        (hdr_sram_rvalue[6:0]),
    .dout       ({fuse_niu_repair_value[5:0],fuse_niu_repair_en}),
  .siclk(siclk),
  .soclk(soclk) );

  niu512_msff_ctl_macro__width_2 srhdr_rid  (
    .scan_in    (dff_rid_m_scanin),
    .scan_out   (dff_rid_m_scanout),
    .l1clk      (l1clk_in),
    .din        (hdr_sram_rid[1:0]),
    .dout       (fuse_niu_rid[1:0]),
  .siclk(siclk),
  .soclk(soclk) );

  niu512_msff_ctl_macro__width_1 srhdr_wr_en  (
    .scan_in    (dff_wr_en_m_scanin),
    .scan_out   (dff_wr_en_m_scanout),
    .l1clk      (l1clk_in),
    .din        (hdr_sram_wr_en),
    .dout       (hdr_wr_en),
  .siclk(siclk),
  .soclk(soclk) );

  niu512_msff_ctl_macro__width_1 srhdr_red_clr  (
    .scan_in    (dff_red_clr_m_scanin),
    .scan_out   (dff_red_clr_m_scanout),
    .l1clk      (l1clk_in),
    .din        (hdr_sram_red_clr),
    .dout       (hdr_red_clr),
  .siclk(siclk),
  .soclk(soclk) );

//  assign fuse_niu_wen   = hdr_wr_en   && !tcu_array_wr_inhibit;
//  assign fuse_red_reset = hdr_red_clr && !tcu_array_wr_inhibit;

  niu512_inv_macro__width_1 r1  (.dout(sr10),           .din(tcu_array_wr_inhibit) );
  niu512_and_macro__width_1 r2  (.dout(fuse_niu_wen),   .din0(hdr_wr_en),   .din1(sr10) );
  niu512_and_macro__width_1 r3  (.dout(fuse_red_reset), .din0(hdr_red_clr), .din1(sr10) );

//================================================
//  l2 clock Domain: output flops
//================================================

// ------------ repair_ph.a register ----------------
wire              [5:0] niu_fuse_repair_value;
wire                    niu_fuse_repair_en;

wire                    dff_read_data_m_scanin;
wire                    dff_read_data_m_scanout;

  niu512_msff_ctl_macro__width_7 sram_read_data  (
    .scan_in    (dff_read_data_m_scanin),
    .scan_out   (dff_read_data_m_scanout),
    .l1clk      (l1clk_out),
    .din        ({niu_fuse_repair_value[5:0],niu_fuse_repair_en}),
    .dout       (sram_hdr_read_data[6:0]),
  .siclk(siclk),
  .soclk(soclk) );

//=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=
//////////////////////////////
// Redundancy Register      //
//////////////////////////////
  assign red_id[0] =                     !fuse_niu_rid[1] && !fuse_niu_rid[0];
  assign red_id[1] =                     !fuse_niu_rid[1] &&  fuse_niu_rid[0];
  assign red_id[2] =                      fuse_niu_rid[1] && !fuse_niu_rid[0];
  assign red_id[3] =                      fuse_niu_rid[1] &&  fuse_niu_rid[0];

  assign red_reg_clk_p[0] = (!l1clk_gate && (red_id[0] && fuse_niu_wen || fuse_red_reset));
  assign red_reg_clk_p[1] = (!l1clk_gate && (red_id[1] && fuse_niu_wen || fuse_red_reset));
  assign red_reg_clk_p[2] = (!l1clk_gate && (red_id[2] && fuse_niu_wen || fuse_red_reset));
  assign red_reg_clk_p[3] = (!l1clk_gate && (red_id[3] && fuse_niu_wen || fuse_red_reset));

  assign fuse_red_data    = fuse_niu_repair_value & {6{!fuse_red_reset}};
  assign fuse_red_enable  = fuse_niu_repair_en    &&   !fuse_red_reset;

//=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=
    n2_niu_dp_512x152s_redreg redreg_0 (
                                         .fuse_red_data        (fuse_red_data),
                                         .fuse_red_enable      (fuse_red_enable),
                                         .red_reg_clk_p        (red_reg_clk_p[0]),
                                         .red_data_reg         (red_data_reg_b0),
                                         .red_en_reg           (red_en_reg_bk[0]),
                                         .red_value            (red_value_b0),
                                         .repair_en            (repair_en_bk[0])
                                        );

    n2_niu_dp_512x152s_redreg redreg_1 (
                                         .fuse_red_data        (fuse_red_data),
                                         .fuse_red_enable      (fuse_red_enable),
                                         .red_reg_clk_p        (red_reg_clk_p[1]),
                                         .red_data_reg         (red_data_reg_b1),
                                         .red_en_reg           (red_en_reg_bk[1]),
                                         .red_value            (red_value_b1),
                                         .repair_en            (repair_en_bk[1])
                                        );

    n2_niu_dp_512x152s_redreg redreg_2 (
                                         .fuse_red_data        (fuse_red_data),
                                         .fuse_red_enable      (fuse_red_enable),
                                         .red_reg_clk_p        (red_reg_clk_p[2]),
                                         .red_data_reg         (red_data_reg_b2),
                                         .red_en_reg           (red_en_reg_bk[2]),
                                         .red_value            (red_value_b2),
                                         .repair_en            (repair_en_bk[2])
                                        );

    n2_niu_dp_512x152s_redreg redreg_3 (
                                         .fuse_red_data        (fuse_red_data),
                                         .fuse_red_enable      (fuse_red_enable),
                                         .red_reg_clk_p        (red_reg_clk_p[3]),
                                         .red_data_reg         (red_data_reg_b3),
                                         .red_en_reg           (red_en_reg_bk[3]),
                                         .red_value            (red_value_b3),
                                         .repair_en            (repair_en_bk[3])
                                        );

//=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=
wire              [5:0] niu_fuse_repair_value_b0;
wire              [5:0] niu_fuse_repair_value_b1;
wire              [5:0] niu_fuse_repair_value_b2;
wire              [5:0] niu_fuse_repair_value_b3;
wire              [5:0] or_val_b0;
wire              [5:0] or_val_b1;

  // assign niu_fuse_repair_value = (red_data_reg_b0 & {6{red_id[0]}}) |
  //                                (red_data_reg_b1 & {6{red_id[1]}}) |
  //                                (red_data_reg_b2 & {6{red_id[2]}}) |
  //                                (red_data_reg_b3 & {6{red_id[3]}});

  niu512_and_macro__width_6 ava0  (.dout(niu_fuse_repair_value_b0), .din0(red_data_reg_b0), .din1({6{red_id[0]}}));
  niu512_and_macro__width_6 ava1  (.dout(niu_fuse_repair_value_b1), .din0(red_data_reg_b1), .din1({6{red_id[1]}}));
  niu512_and_macro__width_6 ava2  (.dout(niu_fuse_repair_value_b2), .din0(red_data_reg_b2), .din1({6{red_id[2]}}));
  niu512_and_macro__width_6 ava3  (.dout(niu_fuse_repair_value_b3), .din0(red_data_reg_b3), .din1({6{red_id[3]}}));

   niu512_or_macro__width_6 ova0  (.dout(or_val_b0),             .din0(niu_fuse_repair_value_b0), .din1(niu_fuse_repair_value_b1));
   niu512_or_macro__width_6 ova1  (.dout(or_val_b1),             .din0(or_val_b0),                .din1(niu_fuse_repair_value_b2));
   niu512_or_macro__width_6 ova2  (.dout(niu_fuse_repair_value), .din0(or_val_b1),                .din1(niu_fuse_repair_value_b3));

wire              [3:0] niu_fuse_repair_en_bk;
wire              [1:0] or_ena;

  // assign niu_fuse_repair_en    = (red_en_reg_bk[0] && red_id[0])  ||
  //                                (red_en_reg_bk[1] && red_id[1])  ||
  //                                (red_en_reg_bk[2] && red_id[2])  ||
  //                                (red_en_reg_bk[3] && red_id[3]);

  niu512_and_macro__width_4 aen0  (.dout(niu_fuse_repair_en_bk), .din0(red_en_reg_bk[3:0]),       .din1(red_id[3:0]) );

   niu512_or_macro__width_1 oen0  (.dout(or_ena[0]),         .din0(niu_fuse_repair_en_bk[0]),.din1(niu_fuse_repair_en_bk[1]));
   niu512_or_macro__width_1 oen1  (.dout(or_ena[1]),         .din0(or_ena[0]),               .din1(niu_fuse_repair_en_bk[2]));
   niu512_or_macro__width_1 oen2  (.dout(niu_fuse_repair_en),.din0(or_ena[1]),               .din1(niu_fuse_repair_en_bk[3]));

//=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=#=
// fixscan start:

  assign dff_red_clr_m_scanin   = scanin_red              ;
  assign dff_wr_en_m_scanin     = dff_red_clr_m_scanout     ;
  assign dff_rid_m_scanin       = dff_wr_en_m_scanout      ;
  assign dff_rvalue_m_scanin    = dff_rid_m_scanout    ;
  assign dff_read_data_m_scanin = dff_rvalue_m_scanout  ;
  assign scanout_red		= dff_read_data_m_scanout  ;

// fixscan end

endmodule







// any PARAMS parms go into naming of macro

module niu512_msff_ctl_macro__width_7 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [6:1] sout;

  input [6:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = din[6:0];









    







cl_sc1_msff_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0]),
.si(sout[1]),
.so(scan_out),
.q(dout[0])
);
cl_sc1_msff_4x d0_1 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1]),
.si(sout[2]),
.so(sout[1]),
.q(dout[1])
);
cl_sc1_msff_4x d0_2 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2]),
.si(sout[3]),
.so(sout[2]),
.q(dout[2])
);
cl_sc1_msff_4x d0_3 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3]),
.si(sout[4]),
.so(sout[3]),
.q(dout[3])
);
cl_sc1_msff_4x d0_4 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4]),
.si(sout[5]),
.so(sout[4]),
.q(dout[4])
);
cl_sc1_msff_4x d0_5 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5]),
.si(sout[6]),
.so(sout[5]),
.q(dout[5])
);
cl_sc1_msff_4x d0_6 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6]),
.si(scan_in),
.so(sout[6]),
.q(dout[6])
);




endmodule













// any PARAMS parms go into naming of macro

module niu512_msff_ctl_macro__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [1:1] sout;

  input [1:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0];









    







cl_sc1_msff_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0]),
.si(sout[1]),
.so(scan_out),
.q(dout[0])
);
cl_sc1_msff_4x d0_1 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1]),
.si(scan_in),
.so(sout[1]),
.q(dout[1])
);




endmodule













// any PARAMS parms go into naming of macro

module niu512_msff_ctl_macro__width_1 (
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









    







cl_sc1_msff_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0]),
.si(scan_in),
.so(scan_out),
.q(dout[0])
);




endmodule








module n2_niu_dp_512x152s_redreg (
  fuse_red_data, 
  fuse_red_enable, 
  red_reg_clk_p, 
  red_data_reg, 
  red_en_reg, 
  red_value, 
  repair_en); 

input             [5:0] fuse_red_data;
input                   fuse_red_enable;
input                   red_reg_clk_p;

output            [5:0] red_data_reg;    // to repair output
output                  red_en_reg;
output            [5:0] red_value;       // to subbank
output                  repair_en;

wire              [5:0] red_value;
wire                    repair_en;

wire              [5:0] red_data_reg;
wire                    red_en_reg;

wire                    red_en_reg1;


//////////////////////////////
// Redundancy Register      //
//////////////////////////////

// `ifdef NOINITMEM
// `else
//   // Initialize the arrays.
//   initial begin
//     red_data_reg = {6{1'h0}};
//     red_en_reg   = 1'h0;
//   end
// `endif

//  always @(posedge red_reg_clk_p) begin
//    red_data_reg  <= fuse_red_data;
//    red_en_reg    <= fuse_red_enable;
//  end

cl_sc1_msff_4x e_r0 (.si(1'b0),.so(),.l1clk(red_reg_clk_p),.siclk(1'b0),.soclk(1'b0),.d(fuse_red_enable), .q(red_en_reg));
cl_sc1_msff_4x e_r1 (.si(1'b0),.so(),.l1clk(red_reg_clk_p),.siclk(1'b0),.soclk(1'b0),.d(fuse_red_enable), .q(red_en_reg1));

cl_sc1_msff_4x d_r0 (.si(1'b0),.so(),.l1clk(red_reg_clk_p),.siclk(1'b0),.soclk(1'b0),.d(fuse_red_data[0]),.q(red_data_reg[0]));
cl_sc1_msff_4x d_r1 (.si(1'b0),.so(),.l1clk(red_reg_clk_p),.siclk(1'b0),.soclk(1'b0),.d(fuse_red_data[1]),.q(red_data_reg[1]));
cl_sc1_msff_4x d_r2 (.si(1'b0),.so(),.l1clk(red_reg_clk_p),.siclk(1'b0),.soclk(1'b0),.d(fuse_red_data[2]),.q(red_data_reg[2]));
cl_sc1_msff_4x d_r3 (.si(1'b0),.so(),.l1clk(red_reg_clk_p),.siclk(1'b0),.soclk(1'b0),.d(fuse_red_data[3]),.q(red_data_reg[3]));
cl_sc1_msff_4x d_r4 (.si(1'b0),.so(),.l1clk(red_reg_clk_p),.siclk(1'b0),.soclk(1'b0),.d(fuse_red_data[4]),.q(red_data_reg[4]));
cl_sc1_msff_4x d_r5 (.si(1'b0),.so(),.l1clk(red_reg_clk_p),.siclk(1'b0),.soclk(1'b0),.d(fuse_red_data[5]),.q(red_data_reg[5]));

//  assign repair_en = red_en_reg;

  niu512_and_macro__width_1 a0  (.dout(repair_en), .din0(red_en_reg),        .din1(red_en_reg1));
  assign red_value = red_data_reg;

endmodule



//  
//   and macro for ports = 2,3,4
//
//





module niu512_and_macro__width_6 (
  din0, 
  din1, 
  dout);
wire [5:0] nandout;

  input [5:0] din0;
  input [5:0] din1;
  output [5:0] dout;









cl_u1_nand2_1x d0_0 (
.in0(din0[0]),
.in1(din1[0]),
.out(nandout[0])
);

cl_u1_nand2_1x d0_1 (
.in0(din0[1]),
.in1(din1[1]),
.out(nandout[1])
);

cl_u1_nand2_1x d0_2 (
.in0(din0[2]),
.in1(din1[2]),
.out(nandout[2])
);

cl_u1_nand2_1x d0_3 (
.in0(din0[3]),
.in1(din1[3]),
.out(nandout[3])
);

cl_u1_nand2_1x d0_4 (
.in0(din0[4]),
.in1(din1[4]),
.out(nandout[4])
);

cl_u1_nand2_1x d0_5 (
.in0(din0[5]),
.in1(din1[5]),
.out(nandout[5])
);

cl_u1_inv_1x d1_0 (
.in(nandout[0]),
.out(dout[0])
);
cl_u1_inv_1x d1_1 (
.in(nandout[1]),
.out(dout[1])
);
cl_u1_inv_1x d1_2 (
.in(nandout[2]),
.out(dout[2])
);
cl_u1_inv_1x d1_3 (
.in(nandout[3]),
.out(dout[3])
);
cl_u1_inv_1x d1_4 (
.in(nandout[4]),
.out(dout[4])
);
cl_u1_inv_1x d1_5 (
.in(nandout[5]),
.out(dout[5])
);




endmodule





//  
//   or macro for ports = 2,3
//
//





module niu512_or_macro__width_6 (
  din0, 
  din1, 
  dout);
wire [5:0] norout;

  input [5:0] din0;
  input [5:0] din1;
  output [5:0] dout;









cl_u1_nor2_1x d0_0 (
.in0(din0[0]),
.in1(din1[0]),
.out(norout[0])
);

cl_u1_nor2_1x d0_1 (
.in0(din0[1]),
.in1(din1[1]),
.out(norout[1])
);

cl_u1_nor2_1x d0_2 (
.in0(din0[2]),
.in1(din1[2]),
.out(norout[2])
);

cl_u1_nor2_1x d0_3 (
.in0(din0[3]),
.in1(din1[3]),
.out(norout[3])
);

cl_u1_nor2_1x d0_4 (
.in0(din0[4]),
.in1(din1[4]),
.out(norout[4])
);

cl_u1_nor2_1x d0_5 (
.in0(din0[5]),
.in1(din1[5]),
.out(norout[5])
);

cl_u1_inv_1x d1_0 (
.in(norout[0]),
.out(dout[0])
);
cl_u1_inv_1x d1_1 (
.in(norout[1]),
.out(dout[1])
);
cl_u1_inv_1x d1_2 (
.in(norout[2]),
.out(dout[2])
);
cl_u1_inv_1x d1_3 (
.in(norout[3]),
.out(dout[3])
);
cl_u1_inv_1x d1_4 (
.in(norout[4]),
.out(dout[4])
);
cl_u1_inv_1x d1_5 (
.in(norout[5]),
.out(dout[5])
);




endmodule





//  
//   and macro for ports = 2,3,4
//
//





module niu512_and_macro__width_4 (
  din0, 
  din1, 
  dout);
wire [3:0] nandout;

  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;









cl_u1_nand2_1x d0_0 (
.in0(din0[0]),
.in1(din1[0]),
.out(nandout[0])
);

cl_u1_nand2_1x d0_1 (
.in0(din0[1]),
.in1(din1[1]),
.out(nandout[1])
);

cl_u1_nand2_1x d0_2 (
.in0(din0[2]),
.in1(din1[2]),
.out(nandout[2])
);

cl_u1_nand2_1x d0_3 (
.in0(din0[3]),
.in1(din1[3]),
.out(nandout[3])
);

cl_u1_inv_1x d1_0 (
.in(nandout[0]),
.out(dout[0])
);
cl_u1_inv_1x d1_1 (
.in(nandout[1]),
.out(dout[1])
);
cl_u1_inv_1x d1_2 (
.in(nandout[2]),
.out(dout[2])
);
cl_u1_inv_1x d1_3 (
.in(nandout[3]),
.out(dout[3])
);




endmodule





//  
//   or macro for ports = 2,3
//
//





module niu512_or_macro__width_1 (
  din0, 
  din1, 
  dout);
wire [0:0] norout;

  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;









cl_u1_nor2_1x d0_0 (
.in0(din0[0]),
.in1(din1[0]),
.out(norout[0])
);

cl_u1_inv_1x d1_0 (
.in(norout[0]),
.out(dout[0])
);




endmodule




