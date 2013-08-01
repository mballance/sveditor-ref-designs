// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: db0_reduct_ctl.v
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
module db0_reduct_ctl (
  iol2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  dmu_ncu_vld, 
  wr_en0, 
  wr_en1, 
  wr_en2, 
  wr_en3, 
  mux1_sel0, 
  mux1_sel1, 
  mux1_sel2, 
  mux2_sel0, 
  mux2_sel1, 
  mux2_sel2, 
  mux3_sel0, 
  mux3_sel1, 
  mux3_sel2, 
  mux4_sel0, 
  mux4_sel1, 
  mux4_sel2, 
  mux5_sel0, 
  mux5_sel1, 
  mux5_sel2, 
  mux5_sel3);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire dmu_ncu_vld_r;
wire ff_dmu_ncu_vld_scanin;
wire ff_dmu_ncu_vld_scanout;
wire l1clk;
wire reg0_vld_din;
wire reg0_vld;
wire reg1_vld;
wire reg2_vld;
wire reg3_vld;
wire reg0_vld_r;
wire reg0_vld_r2;
wire ff_reg0_vld_scanin;
wire ff_reg0_vld_scanout;
wire ff_reg0_vld_r_scanin;
wire ff_reg0_vld_r_scanout;
wire ff_reg0_vld_r2_scanin;
wire ff_reg0_vld_r2_scanout;
wire reg1_vld_din;
wire reg1_vld_r_din;
wire reg1_vld_r;
wire reg1_vld_r2;
wire ff_reg1_vld_scanin;
wire ff_reg1_vld_scanout;
wire ff_reg1_vld_r_scanin;
wire ff_reg1_vld_r_scanout;
wire ff_reg1_vld_r2_scanin;
wire ff_reg1_vld_r2_scanout;
wire reg2_vld_din;
wire reg2_vld_r_din;
wire reg2_vld_r;
wire reg2_vld_r2;
wire ff_reg2_vld_scanin;
wire ff_reg2_vld_scanout;
wire ff_reg2_vld_r_scanin;
wire ff_reg2_vld_r_scanout;
wire ff_reg2_vld_r2_scanin;
wire ff_reg2_vld_r2_scanout;
wire reg3_vld_din;
wire reg3_vld_r_din;
wire reg3_vld_r;
wire reg3_vld_r2;
wire ff_reg3_vld_scanin;
wire ff_reg3_vld_scanout;
wire ff_reg3_vld_r_scanin;
wire ff_reg3_vld_r_scanout;
wire ff_reg3_vld_r2_scanin;
wire ff_reg3_vld_r2_scanout;
wire spares_scanin;
wire spares_scanout;


input		iol2clk;                // Internal IO clock from CCU 

input           scan_in;
output          scan_out;
input           tcu_pce_ov;
input           tcu_clk_stop;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;


input           dmu_ncu_vld;            //CSR Data return valid from DMU to NCU

output           wr_en0;
output           wr_en1;
output           wr_en2;
output           wr_en3;

output           mux1_sel0;
output           mux1_sel1;
output           mux1_sel2;

output           mux2_sel0;
output           mux2_sel1;
output           mux2_sel2;

output           mux3_sel0;
output           mux3_sel1;
output           mux3_sel2;

output           mux4_sel0;
output           mux4_sel1;
output           mux4_sel2;

output           mux5_sel0;
output           mux5_sel1;
output           mux5_sel2;
output           mux5_sel3;

// Scan reassigns
assign pce_ov = tcu_pce_ov;
assign stop = tcu_clk_stop;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

// flop dmu_ncu_vld

db0_reduct_ctl_msff_ctl_macro__width_1 ff_dmu_ncu_vld 
               (.dout(dmu_ncu_vld_r),
               .scan_in(ff_dmu_ncu_vld_scanin),
               .scan_out(ff_dmu_ncu_vld_scanout),
               .l1clk(l1clk),
               .din(dmu_ncu_vld),
  .siclk(siclk),
  .soclk(soclk)
);


// Reg0 vld bits

assign reg0_vld_din = (dmu_ncu_vld_r & 
                      ~(reg0_vld | reg1_vld | reg2_vld | reg3_vld)
                                                ) | reg0_vld; // set if dmu_ncu_vld_r is true
                                                              // and reg0_vld,reg1_vld,reg2_vld,reg3_vld are
                                                              // all 1'b0 
                                                              // held at 1 with reg0_vld until
                                                              // cleared
assign mux1_sel0 = reg0_vld & ~reg0_vld_r;
assign mux1_sel1 = reg0_vld_r & ~reg0_vld_r2;
assign mux1_sel2 = reg0_vld_r2; 

assign mux5_sel0 = mux1_sel0 | mux1_sel1 | mux1_sel2;

assign wr_en0 = (dmu_ncu_vld_r &
                      ~(reg0_vld | reg1_vld | reg2_vld | reg3_vld));

                // write to reg0 when none of the valid bits are on and dmu_ncu_vld_r is true

db0_reduct_ctl_msff_ctl_macro__clr_1__width_1 ff_reg0_vld 
               (.dout(reg0_vld),
	       .scan_in(ff_reg0_vld_scanin),
	       .scan_out(ff_reg0_vld_scanout),
	       .clr(reg0_vld_r2),
               .l1clk(l1clk),
               .din(reg0_vld_din),
  .siclk(siclk),
  .soclk(soclk)

);

db0_reduct_ctl_msff_ctl_macro__clr_1__width_1 ff_reg0_vld_r 
               (.dout(reg0_vld_r),
	       .scan_in(ff_reg0_vld_r_scanin),
	       .scan_out(ff_reg0_vld_r_scanout),
	       .clr(reg0_vld_r2),
               .l1clk(l1clk),
               .din(reg0_vld),
  .siclk(siclk),
  .soclk(soclk)

);

db0_reduct_ctl_msff_ctl_macro__clr_1__width_1 ff_reg0_vld_r2 
               (.dout(reg0_vld_r2),
	       .scan_in(ff_reg0_vld_r2_scanin),
	       .scan_out(ff_reg0_vld_r2_scanout),
	       .clr(reg0_vld_r2),
               .l1clk(l1clk),
               .din(reg0_vld_r),
  .siclk(siclk),
  .soclk(soclk)

);

// Reg1 vld bits

assign reg1_vld_din = (dmu_ncu_vld_r & reg0_vld ) | reg1_vld; // set if dmu_ncu_vld_r is true
                                                              // and reg0_vld is 1'b1
                                                              // held at 1 with reg1_vld until
                                                              // cleared

assign reg1_vld_r_din = reg1_vld & ~reg0_vld; // propagate the value of reg1_vld to reg1_vld_r
                                              // only when reg0_vld = 0 

assign mux2_sel0 = reg1_vld & ~reg1_vld_r & ~reg0_vld;
assign mux2_sel1 = reg1_vld_r & ~reg1_vld_r2;
assign mux2_sel2 = reg1_vld_r2;

assign mux5_sel1 = mux2_sel0 | mux2_sel1 | mux2_sel2;

assign wr_en1 = (dmu_ncu_vld_r & reg0_vld & ~reg1_vld);

                // write to reg1 when reg0 valid bit is true and dmu_ncu_vld_r is true



db0_reduct_ctl_msff_ctl_macro__clr_1__width_1 ff_reg1_vld 
               (.dout(reg1_vld),
	       .scan_in(ff_reg1_vld_scanin),
	       .scan_out(ff_reg1_vld_scanout),
	       .clr(reg1_vld_r2),
               .l1clk(l1clk),
               .din(reg1_vld_din),
  .siclk(siclk),
  .soclk(soclk)

);

db0_reduct_ctl_msff_ctl_macro__clr_1__width_1 ff_reg1_vld_r 
               (.dout(reg1_vld_r),
	       .scan_in(ff_reg1_vld_r_scanin),
	       .scan_out(ff_reg1_vld_r_scanout),
	       .clr(reg1_vld_r2),
               .l1clk(l1clk),
               .din(reg1_vld_r_din),
  .siclk(siclk),
  .soclk(soclk)

);

db0_reduct_ctl_msff_ctl_macro__clr_1__width_1 ff_reg1_vld_r2 
               (.dout(reg1_vld_r2),
	       .scan_in(ff_reg1_vld_r2_scanin),
	       .scan_out(ff_reg1_vld_r2_scanout),
	       .clr(reg1_vld_r2),
               .l1clk(l1clk),
               .din(reg1_vld_r),
  .siclk(siclk),
  .soclk(soclk)

);

// Reg2 vld bits

assign reg2_vld_din = (dmu_ncu_vld_r & reg1_vld ) | reg2_vld; // set if dmu_ncu_vld_r is true
                                                              // and reg1_vld is 1'b1
                                                              // held at 1 with reg2_vld until
                                                              // cleared

assign reg2_vld_r_din = reg2_vld & ~reg1_vld; // propagate the value of reg2_vld to reg2_vld_r
                                              // only when reg1_vld = 0

assign mux3_sel0 = reg2_vld & ~reg2_vld_r & ~reg1_vld;
assign mux3_sel1 = reg2_vld_r & ~reg2_vld_r2;
assign mux3_sel2 = reg2_vld_r2;

assign mux5_sel2 = mux3_sel0 | mux3_sel1 | mux3_sel2;

assign wr_en2 = (dmu_ncu_vld_r & reg1_vld & ~reg2_vld);

                // write to reg2 when reg1 valid bit is true and dmu_ncu_vld_r is true



db0_reduct_ctl_msff_ctl_macro__clr_1__width_1 ff_reg2_vld 
               (.dout(reg2_vld),
	       .scan_in(ff_reg2_vld_scanin),
	       .scan_out(ff_reg2_vld_scanout),
	       .clr(reg2_vld_r2),
               .l1clk(l1clk),
               .din(reg2_vld_din),
  .siclk(siclk),
  .soclk(soclk)

);

db0_reduct_ctl_msff_ctl_macro__clr_1__width_1 ff_reg2_vld_r 
               (.dout(reg2_vld_r),
	       .scan_in(ff_reg2_vld_r_scanin),
	       .scan_out(ff_reg2_vld_r_scanout),
	       .clr(reg2_vld_r2),
               .l1clk(l1clk),
               .din(reg2_vld_r_din),
  .siclk(siclk),
  .soclk(soclk)

);

db0_reduct_ctl_msff_ctl_macro__clr_1__width_1 ff_reg2_vld_r2 
               (.dout(reg2_vld_r2),
	       .scan_in(ff_reg2_vld_r2_scanin),
	       .scan_out(ff_reg2_vld_r2_scanout),
	       .clr(reg2_vld_r2),
               .l1clk(l1clk),
               .din(reg2_vld_r),
  .siclk(siclk),
  .soclk(soclk)

);

// Reg3 vld bits

assign reg3_vld_din = (dmu_ncu_vld_r & reg2_vld ) | reg3_vld; // set if dmu_ncu_vld_r is true
                                                              // and reg2_vld is 1'b1
                                                              // held at 1 with reg3_vld until
                                                              // cleared

assign reg3_vld_r_din = reg3_vld & ~reg2_vld; // propagate the value of reg3_vld to reg3_vld_r
                                              // only when reg2_vld = 0

assign mux4_sel0 = reg3_vld & ~reg3_vld_r & ~reg2_vld;
assign mux4_sel1 = reg3_vld_r & ~reg3_vld_r2;
assign mux4_sel2 = reg3_vld_r2;

assign mux5_sel3 = mux4_sel0 | mux4_sel1 | mux4_sel2;

assign wr_en3 = (dmu_ncu_vld_r & reg2_vld);

                // write to reg3 when reg2 valid bit is true and dmu_ncu_vld_r is true



db0_reduct_ctl_msff_ctl_macro__clr_1__width_1 ff_reg3_vld 
               (.dout(reg3_vld),
	       .scan_in(ff_reg3_vld_scanin),
	       .scan_out(ff_reg3_vld_scanout),
	       .clr(reg3_vld_r2),
               .l1clk(l1clk),
               .din(reg3_vld_din),
  .siclk(siclk),
  .soclk(soclk)

);

db0_reduct_ctl_msff_ctl_macro__clr_1__width_1 ff_reg3_vld_r 
               (.dout(reg3_vld_r),
	       .scan_in(ff_reg3_vld_r_scanin),
	       .scan_out(ff_reg3_vld_r_scanout),
	       .clr(reg3_vld_r2),
               .l1clk(l1clk),
               .din(reg3_vld_r_din),
  .siclk(siclk),
  .soclk(soclk)

);

db0_reduct_ctl_msff_ctl_macro__clr_1__width_1 ff_reg3_vld_r2 
               (.dout(reg3_vld_r2),
	       .scan_in(ff_reg3_vld_r2_scanin),
	       .scan_out(ff_reg3_vld_r2_scanout),
	       .clr(reg3_vld_r2),
               .l1clk(l1clk),
               .din(reg3_vld_r),
  .siclk(siclk),
  .soclk(soclk)

);

// Spare gates 

db0_reduct_ctl_spare_ctl_macro__num_5 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

/**** adding clock header ****/
db0_reduct_ctl_l1clkhdr_ctl_macro clkgen (
                                .l2clk  (iol2clk),
                                .l1en   (1'b1),
                                .l1clk  (l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
                                );


// fixscan start:
assign ff_dmu_ncu_vld_scanin     = scan_in                  ;
assign ff_reg0_vld_scanin        = ff_dmu_ncu_vld_scanout   ;
assign ff_reg0_vld_r_scanin      = ff_reg0_vld_scanout      ;
assign ff_reg0_vld_r2_scanin     = ff_reg0_vld_r_scanout    ;
assign ff_reg1_vld_scanin        = ff_reg0_vld_r2_scanout   ;
assign ff_reg1_vld_r_scanin      = ff_reg1_vld_scanout      ;
assign ff_reg1_vld_r2_scanin     = ff_reg1_vld_r_scanout    ;
assign ff_reg2_vld_scanin        = ff_reg1_vld_r2_scanout   ;
assign ff_reg2_vld_r_scanin      = ff_reg2_vld_scanout      ;
assign ff_reg2_vld_r2_scanin     = ff_reg2_vld_r_scanout    ;
assign ff_reg3_vld_scanin        = ff_reg2_vld_r2_scanout   ;
assign ff_reg3_vld_r_scanin      = ff_reg3_vld_scanout      ;
assign ff_reg3_vld_r2_scanin     = ff_reg3_vld_r_scanout    ;
assign spares_scanin             = ff_reg3_vld_r2_scanout   ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module db0_reduct_ctl_msff_ctl_macro__width_1 (
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

module db0_reduct_ctl_msff_ctl_macro__clr_1__width_1 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0] & ~{1{clr}};






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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module db0_reduct_ctl_spare_ctl_macro__num_5 (
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
wire si_1;
wire so_1;
wire spare1_flop_unused;
wire spare1_buf_32x_unused;
wire spare1_nand3_8x_unused;
wire spare1_inv_8x_unused;
wire spare1_aoi22_4x_unused;
wire spare1_buf_8x_unused;
wire spare1_oai22_4x_unused;
wire spare1_inv_16x_unused;
wire spare1_nand2_16x_unused;
wire spare1_nor3_4x_unused;
wire spare1_nand2_8x_unused;
wire spare1_buf_16x_unused;
wire spare1_nor2_16x_unused;
wire spare1_inv_32x_unused;
wire si_2;
wire so_2;
wire spare2_flop_unused;
wire spare2_buf_32x_unused;
wire spare2_nand3_8x_unused;
wire spare2_inv_8x_unused;
wire spare2_aoi22_4x_unused;
wire spare2_buf_8x_unused;
wire spare2_oai22_4x_unused;
wire spare2_inv_16x_unused;
wire spare2_nand2_16x_unused;
wire spare2_nor3_4x_unused;
wire spare2_nand2_8x_unused;
wire spare2_buf_16x_unused;
wire spare2_nor2_16x_unused;
wire spare2_inv_32x_unused;
wire si_3;
wire so_3;
wire spare3_flop_unused;
wire spare3_buf_32x_unused;
wire spare3_nand3_8x_unused;
wire spare3_inv_8x_unused;
wire spare3_aoi22_4x_unused;
wire spare3_buf_8x_unused;
wire spare3_oai22_4x_unused;
wire spare3_inv_16x_unused;
wire spare3_nand2_16x_unused;
wire spare3_nor3_4x_unused;
wire spare3_nand2_8x_unused;
wire spare3_buf_16x_unused;
wire spare3_nor2_16x_unused;
wire spare3_inv_32x_unused;
wire si_4;
wire so_4;
wire spare4_flop_unused;
wire spare4_buf_32x_unused;
wire spare4_nand3_8x_unused;
wire spare4_inv_8x_unused;
wire spare4_aoi22_4x_unused;
wire spare4_buf_8x_unused;
wire spare4_oai22_4x_unused;
wire spare4_inv_16x_unused;
wire spare4_nand2_16x_unused;
wire spare4_nor3_4x_unused;
wire spare4_nand2_8x_unused;
wire spare4_buf_16x_unused;
wire spare4_nor2_16x_unused;
wire spare4_inv_32x_unused;


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

cl_sc1_msff_8x spare1_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_1),
                               .so(so_1),
                               .d(1'b0),
                               .q(spare1_flop_unused));
assign si_1 = so_0;

cl_u1_buf_32x   spare1_buf_32x (.in(1'b1),
                                   .out(spare1_buf_32x_unused));
cl_u1_nand3_8x spare1_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare1_nand3_8x_unused));
cl_u1_inv_8x    spare1_inv_8x (.in(1'b1),
                                  .out(spare1_inv_8x_unused));
cl_u1_aoi22_4x spare1_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_aoi22_4x_unused));
cl_u1_buf_8x    spare1_buf_8x (.in(1'b1),
                                  .out(spare1_buf_8x_unused));
cl_u1_oai22_4x spare1_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_oai22_4x_unused));
cl_u1_inv_16x   spare1_inv_16x (.in(1'b1),
                                   .out(spare1_inv_16x_unused));
cl_u1_nand2_16x spare1_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare1_nand2_16x_unused));
cl_u1_nor3_4x spare1_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare1_nor3_4x_unused));
cl_u1_nand2_8x spare1_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare1_nand2_8x_unused));
cl_u1_buf_16x   spare1_buf_16x (.in(1'b1),
                                   .out(spare1_buf_16x_unused));
cl_u1_nor2_16x spare1_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare1_nor2_16x_unused));
cl_u1_inv_32x   spare1_inv_32x (.in(1'b1),
                                   .out(spare1_inv_32x_unused));

cl_sc1_msff_8x spare2_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_2),
                               .so(so_2),
                               .d(1'b0),
                               .q(spare2_flop_unused));
assign si_2 = so_1;

cl_u1_buf_32x   spare2_buf_32x (.in(1'b1),
                                   .out(spare2_buf_32x_unused));
cl_u1_nand3_8x spare2_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare2_nand3_8x_unused));
cl_u1_inv_8x    spare2_inv_8x (.in(1'b1),
                                  .out(spare2_inv_8x_unused));
cl_u1_aoi22_4x spare2_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_aoi22_4x_unused));
cl_u1_buf_8x    spare2_buf_8x (.in(1'b1),
                                  .out(spare2_buf_8x_unused));
cl_u1_oai22_4x spare2_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_oai22_4x_unused));
cl_u1_inv_16x   spare2_inv_16x (.in(1'b1),
                                   .out(spare2_inv_16x_unused));
cl_u1_nand2_16x spare2_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare2_nand2_16x_unused));
cl_u1_nor3_4x spare2_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare2_nor3_4x_unused));
cl_u1_nand2_8x spare2_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare2_nand2_8x_unused));
cl_u1_buf_16x   spare2_buf_16x (.in(1'b1),
                                   .out(spare2_buf_16x_unused));
cl_u1_nor2_16x spare2_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare2_nor2_16x_unused));
cl_u1_inv_32x   spare2_inv_32x (.in(1'b1),
                                   .out(spare2_inv_32x_unused));

cl_sc1_msff_8x spare3_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_3),
                               .so(so_3),
                               .d(1'b0),
                               .q(spare3_flop_unused));
assign si_3 = so_2;

cl_u1_buf_32x   spare3_buf_32x (.in(1'b1),
                                   .out(spare3_buf_32x_unused));
cl_u1_nand3_8x spare3_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare3_nand3_8x_unused));
cl_u1_inv_8x    spare3_inv_8x (.in(1'b1),
                                  .out(spare3_inv_8x_unused));
cl_u1_aoi22_4x spare3_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_aoi22_4x_unused));
cl_u1_buf_8x    spare3_buf_8x (.in(1'b1),
                                  .out(spare3_buf_8x_unused));
cl_u1_oai22_4x spare3_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_oai22_4x_unused));
cl_u1_inv_16x   spare3_inv_16x (.in(1'b1),
                                   .out(spare3_inv_16x_unused));
cl_u1_nand2_16x spare3_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare3_nand2_16x_unused));
cl_u1_nor3_4x spare3_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare3_nor3_4x_unused));
cl_u1_nand2_8x spare3_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare3_nand2_8x_unused));
cl_u1_buf_16x   spare3_buf_16x (.in(1'b1),
                                   .out(spare3_buf_16x_unused));
cl_u1_nor2_16x spare3_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare3_nor2_16x_unused));
cl_u1_inv_32x   spare3_inv_32x (.in(1'b1),
                                   .out(spare3_inv_32x_unused));

cl_sc1_msff_8x spare4_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_4),
                               .so(so_4),
                               .d(1'b0),
                               .q(spare4_flop_unused));
assign si_4 = so_3;

cl_u1_buf_32x   spare4_buf_32x (.in(1'b1),
                                   .out(spare4_buf_32x_unused));
cl_u1_nand3_8x spare4_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare4_nand3_8x_unused));
cl_u1_inv_8x    spare4_inv_8x (.in(1'b1),
                                  .out(spare4_inv_8x_unused));
cl_u1_aoi22_4x spare4_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_aoi22_4x_unused));
cl_u1_buf_8x    spare4_buf_8x (.in(1'b1),
                                  .out(spare4_buf_8x_unused));
cl_u1_oai22_4x spare4_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_oai22_4x_unused));
cl_u1_inv_16x   spare4_inv_16x (.in(1'b1),
                                   .out(spare4_inv_16x_unused));
cl_u1_nand2_16x spare4_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare4_nand2_16x_unused));
cl_u1_nor3_4x spare4_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare4_nor3_4x_unused));
cl_u1_nand2_8x spare4_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare4_nand2_8x_unused));
cl_u1_buf_16x   spare4_buf_16x (.in(1'b1),
                                   .out(spare4_buf_16x_unused));
cl_u1_nor2_16x spare4_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare4_nor2_16x_unused));
cl_u1_inv_32x   spare4_inv_32x (.in(1'b1),
                                   .out(spare4_inv_32x_unused));
assign scan_out = so_4;



endmodule






// any PARAMS parms go into naming of macro

module db0_reduct_ctl_l1clkhdr_ctl_macro (
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








