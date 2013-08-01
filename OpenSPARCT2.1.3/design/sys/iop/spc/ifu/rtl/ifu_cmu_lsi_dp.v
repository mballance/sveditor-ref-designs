// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_cmu_lsi_dp.v
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
module ifu_cmu_lsi_dp (
  tcu_scan_en, 
  l2clk, 
  spc_aclk, 
  spc_bclk, 
  tcu_pce_ov, 
  scan_in, 
  lsc_clken, 
  lsc_data_sel, 
  l15_spc_data1, 
  lsc_fill_rtn1, 
  lsc_fill_rtn2, 
  gkt_ifu_legal, 
  gkt_ifu_flip_parity, 
  cmu_ic_data, 
  cmu_fill_inst0, 
  cmu_fill_inst1, 
  cmu_fill_inst2, 
  cmu_fill_inst3, 
  scan_out) ;
wire stop;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire l15_w0_parity_pre;
wire l15_w0_parity;
wire l15_w1_parity_pre;
wire l15_w1_parity;
wire l15_w2_parity_pre;
wire l15_w2_parity;
wire l15_w3_parity_pre;
wire l15_w3_parity;
wire [127:0] gkt_data;
wire [32:0] w0_data_r1_buf;
wire [32:0] w0_data_in;
wire [32:0] w1_data_r1_buf;
wire [32:0] w1_data_in;
wire [32:0] w2_data_r1_buf;
wire [32:0] w2_data_in;
wire [32:0] w3_data_r1_buf;
wire [32:0] w3_data_in;
wire [32:0] w4_data_r1_buf;
wire [32:0] w4_data_in;
wire [32:0] w5_data_r1_buf;
wire [32:0] w5_data_in;
wire [32:0] w6_data_r1_buf;
wire [32:0] w6_data_in;
wire [32:0] w7_data_r1_buf;
wire [32:0] w7_data_in;
wire fill_data_w0_reg_scanin;
wire fill_data_w0_reg_scanout;
wire [32:0] w0_data_r1;
wire fill_data_w1_reg_scanin;
wire fill_data_w1_reg_scanout;
wire [32:0] w1_data_r1;
wire fill_data_w2_reg_scanin;
wire fill_data_w2_reg_scanout;
wire [32:0] w2_data_r1;
wire fill_data_w3_reg_scanin;
wire fill_data_w3_reg_scanout;
wire [32:0] w3_data_r1;
wire fill_data_w4_reg_scanin;
wire fill_data_w4_reg_scanout;
wire [32:0] w4_data_r1;
wire fill_data_w5_reg_scanin;
wire fill_data_w5_reg_scanout;
wire [32:0] w5_data_r1;
wire fill_data_w6_reg_scanin;
wire fill_data_w6_reg_scanout;
wire [32:0] w6_data_r1;
wire fill_data_w7_reg_scanin;
wire fill_data_w7_reg_scanout;
wire [32:0] w7_data_r1;
wire paddr_lat_scanin;
wire paddr_lat_scanout;
wire [7:0] lsc_data_sel_lat;
wire [32:0] cmu_fill_inst0_prebuf;
wire [32:0] cmu_fill_inst1_prebuf;
wire [32:0] cmu_fill_inst2_prebuf;
wire [32:0] cmu_fill_inst3_prebuf;


input tcu_scan_en ;
input l2clk;
input spc_aclk;                 
input spc_bclk;                 
input tcu_pce_ov ;
input scan_in;

input lsc_clken;
input [7:0] lsc_data_sel;

                                
input [127:0] l15_spc_data1;
input         lsc_fill_rtn1;
input         lsc_fill_rtn2;
input [3:0]   gkt_ifu_legal;
input [3:0]   gkt_ifu_flip_parity;



output [263:0] cmu_ic_data;

output [32:0]  cmu_fill_inst0;
output [32:0]  cmu_fill_inst1;
output [32:0]  cmu_fill_inst2;
output [32:0]  cmu_fill_inst3;


output         scan_out;

// scan renames
assign stop = 1'b0;
// end scan

ifu_cmu_lsi_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 test_rep0   (
  .din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk}),
  .dout({se,pce_ov,siclk,soclk})
);


////////////////////////////////////////////////////////
// Compute parity on input data from gkt
// Data from gkt arrives at ~350ps, parity should be 250 ps.
////////////////////////////////////////////////////////

ifu_cmu_lsi_dp_prty_macro__dprty_8x__width_32 w0_parity   (
    .din(l15_spc_data1[127:96]),
    .dout(l15_w0_parity_pre)
);
ifu_cmu_lsi_dp_xor_macro__ports_2__stack_34c__width_1 w0_parity_final    (
    .din0(l15_w0_parity_pre),
    .din1(gkt_ifu_flip_parity[3]),
    .dout(l15_w0_parity)                                                     
);
                                                         
ifu_cmu_lsi_dp_prty_macro__dprty_8x__width_32 w1_parity   (
    .din(l15_spc_data1[95:64]),
    .dout(l15_w1_parity_pre)
);
ifu_cmu_lsi_dp_xor_macro__ports_2__stack_34c__width_1 w1_parity_final    (
    .din0(l15_w1_parity_pre),
    .din1(gkt_ifu_flip_parity[2]),
    .dout(l15_w1_parity)                                                     
);
                                                         

ifu_cmu_lsi_dp_prty_macro__dprty_8x__width_32 w2_parity   (
    .din(l15_spc_data1[63:32]),
    .dout(l15_w2_parity_pre)
);
ifu_cmu_lsi_dp_xor_macro__ports_2__stack_34c__width_1 w2_parity_final    (
    .din0(l15_w2_parity_pre),
    .din1(gkt_ifu_flip_parity[1]),
    .dout(l15_w2_parity)                                                     
);
                                                         

ifu_cmu_lsi_dp_prty_macro__dprty_8x__width_32 w3_parity   (
    .din(l15_spc_data1[31:0]),
    .dout(l15_w3_parity_pre)
);
ifu_cmu_lsi_dp_xor_macro__ports_2__stack_34c__width_1 w3_parity_final    (
    .din0(l15_w3_parity_pre),
    .din1(gkt_ifu_flip_parity[0]),
    .dout(l15_w3_parity)                                                     
);
                                                         

////////////////////////////////////////////////////////
// For illegal instructions, 0 out bits 31,30,24,23,22 of instruction
////////////////////////////////////////////////////////
ifu_cmu_lsi_dp_and_macro__stack_34c__width_5 zero_opc_and0   (
.din0 ({l15_spc_data1[31],l15_spc_data1[30],l15_spc_data1[24],l15_spc_data1[23],l15_spc_data1[22]}),
.din1 ({5{gkt_ifu_legal[0]}}),                                
.dout ({gkt_data[31],gkt_data[30],gkt_data[24],gkt_data[23],gkt_data[22]})                               
);

ifu_cmu_lsi_dp_and_macro__stack_34c__width_5 zero_opc_and1   (
.din0 ({l15_spc_data1[63],l15_spc_data1[62],l15_spc_data1[56],l15_spc_data1[55],l15_spc_data1[54]}),
.din1 ({5{gkt_ifu_legal[1]}}),                                
.dout ({gkt_data[63],gkt_data[62],gkt_data[56],gkt_data[55],gkt_data[54]})                               
);

ifu_cmu_lsi_dp_and_macro__stack_34c__width_5 zero_opc_and2   (
.din0 ({l15_spc_data1[95],l15_spc_data1[94],l15_spc_data1[88],l15_spc_data1[87],l15_spc_data1[86]}),
.din1 ({5{gkt_ifu_legal[2]}}),                                
.dout ({gkt_data[95],gkt_data[94],gkt_data[88],gkt_data[87],gkt_data[86]})                               
);

ifu_cmu_lsi_dp_and_macro__stack_34c__width_5 zero_opc_and3   (
.din0 ({l15_spc_data1[127],l15_spc_data1[126],l15_spc_data1[120],l15_spc_data1[119],l15_spc_data1[118]}),
.din1 ({5{gkt_ifu_legal[3]}}),                                
.dout ({gkt_data[127],gkt_data[126],gkt_data[120],gkt_data[119],gkt_data[118]})                               
);

assign gkt_data[29:25] = l15_spc_data1[29:25];
assign gkt_data[21:0] = l15_spc_data1[21:0];

assign gkt_data[61:57] = l15_spc_data1[61:57];
assign gkt_data[53:32] = l15_spc_data1[53:32];

assign gkt_data[93:89] = l15_spc_data1[93:89];
assign gkt_data[85:64] = l15_spc_data1[85:64];

assign gkt_data[125:121] = l15_spc_data1[125:121];
assign gkt_data[117:96] = l15_spc_data1[117:96];


////////////////////////////////////////////////////////
// Flopping input data from gkt
////////////////////////////////////////////////////////

ifu_cmu_lsi_dp_mux_macro__mux_aope__ports_2__stack_34c__width_33 w0_data_mux  (
    .din1(w0_data_r1_buf[32:0]),
    .din0({l15_w0_parity,gkt_data[127:96]}),
    .sel0(lsc_fill_rtn1),
    .dout(w0_data_in[32:0])
);

ifu_cmu_lsi_dp_mux_macro__mux_aope__ports_2__stack_34c__width_33 w1_data_mux  (
    .din1(w1_data_r1_buf[32:0]),
    .din0({l15_w1_parity,gkt_data[95:64]}),
    .sel0(lsc_fill_rtn1),
    .dout(w1_data_in[32:0])
);

ifu_cmu_lsi_dp_mux_macro__mux_aope__ports_2__stack_34c__width_33 w2_data_mux  (
    .din1(w2_data_r1_buf[32:0]),
    .din0({l15_w2_parity,gkt_data[63:32]}),
    .sel0(lsc_fill_rtn1),
    .dout(w2_data_in[32:0])
);

ifu_cmu_lsi_dp_mux_macro__mux_aope__ports_2__stack_34c__width_33 w3_data_mux  (
    .din1(w3_data_r1_buf[32:0]),
    .din0({l15_w3_parity,gkt_data[31:0]}),
    .sel0(lsc_fill_rtn1),
    .dout(w3_data_in[32:0])
);

ifu_cmu_lsi_dp_mux_macro__mux_aope__ports_2__stack_34c__width_33 w4_data_mux  (
    .din1(w4_data_r1_buf[32:0]),
    .din0({l15_w0_parity,gkt_data[127:96]}),
    .sel0(lsc_fill_rtn2),
    .dout(w4_data_in[32:0])
);

ifu_cmu_lsi_dp_mux_macro__mux_aope__ports_2__stack_34c__width_33 w5_data_mux  (
    .din1(w5_data_r1_buf[32:0]),
    .din0({l15_w1_parity,gkt_data[95:64]}),
    .sel0(lsc_fill_rtn2),
    .dout(w5_data_in[32:0])
);

ifu_cmu_lsi_dp_mux_macro__mux_aope__ports_2__stack_34c__width_33 w6_data_mux  (
    .din1(w6_data_r1_buf[32:0]),
    .din0({l15_w2_parity,gkt_data[63:32]}),
    .sel0(lsc_fill_rtn2),
    .dout(w6_data_in[32:0])
);

ifu_cmu_lsi_dp_mux_macro__mux_aope__ports_2__stack_34c__width_33 w7_data_mux  (
    .din1(w7_data_r1_buf[32:0]),
    .din0({l15_w3_parity,gkt_data[31:0]}),
    .sel0(lsc_fill_rtn2),
    .dout(w7_data_in[32:0])
);

ifu_cmu_lsi_dp_msff_macro__stack_34c__width_33 fill_data_w0_reg  (
    .scan_in(fill_data_w0_reg_scanin),
    .scan_out(fill_data_w0_reg_scanout),
    .clk (l2clk),
    .en  (lsc_clken),
    .din (w0_data_in[32:0]),
    .dout(w0_data_r1[32:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

ifu_cmu_lsi_dp_msff_macro__stack_34c__width_33 fill_data_w1_reg  (
    .scan_in(fill_data_w1_reg_scanin),
    .scan_out(fill_data_w1_reg_scanout),
    .clk (l2clk),
    .en  (lsc_clken),
    .din (w1_data_in[32:0]),
    .dout(w1_data_r1[32:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

ifu_cmu_lsi_dp_msff_macro__stack_34c__width_33 fill_data_w2_reg  (
    .scan_in(fill_data_w2_reg_scanin),
    .scan_out(fill_data_w2_reg_scanout),
    .clk (l2clk),
    .en  (lsc_clken),
    .din (w2_data_in[32:0]),
    .dout(w2_data_r1[32:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

ifu_cmu_lsi_dp_msff_macro__stack_34c__width_33 fill_data_w3_reg  (
    .scan_in(fill_data_w3_reg_scanin),
    .scan_out(fill_data_w3_reg_scanout),
    .clk (l2clk),
    .en  (lsc_clken),
    .din (w3_data_in[32:0]),
    .dout(w3_data_r1[32:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

ifu_cmu_lsi_dp_msff_macro__stack_34c__width_33 fill_data_w4_reg  (
    .scan_in(fill_data_w4_reg_scanin),
    .scan_out(fill_data_w4_reg_scanout),
    .clk (l2clk),
    .en  (lsc_clken),
    .din (w4_data_in[32:0]),
    .dout(w4_data_r1[32:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

ifu_cmu_lsi_dp_msff_macro__stack_34c__width_33 fill_data_w5_reg  (
    .scan_in(fill_data_w5_reg_scanin),
    .scan_out(fill_data_w5_reg_scanout),
    .clk (l2clk),
    .en  (lsc_clken),
    .din (w5_data_in[32:0]),
    .dout(w5_data_r1[32:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

ifu_cmu_lsi_dp_msff_macro__stack_34c__width_33 fill_data_w6_reg  (
    .scan_in(fill_data_w6_reg_scanin),
    .scan_out(fill_data_w6_reg_scanout),
    .clk (l2clk),
    .en  (lsc_clken),
    .din (w6_data_in[32:0]),
    .dout(w6_data_r1[32:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

ifu_cmu_lsi_dp_msff_macro__stack_34c__width_33 fill_data_w7_reg  (
    .scan_in(fill_data_w7_reg_scanin),
    .scan_out(fill_data_w7_reg_scanout),
    .clk (l2clk),
    .en  (lsc_clken),
    .din (w7_data_in[32:0]),
    .dout(w7_data_r1[32:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

////////////////////////////////////////////////////////
// Instruction Mux
////////////////////////////////////////////////////////
ifu_cmu_lsi_dp_msff_macro__left_8__stack_16l__width_8 paddr_lat   (
    .scan_in(paddr_lat_scanin),
    .scan_out(paddr_lat_scanout),
    .clk (l2clk),
    .en  (lsc_clken),
    .din (lsc_data_sel[7:0]),
    .dout(lsc_data_sel_lat[7:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

ifu_cmu_lsi_dp_mux_macro__mux_aonpe__ports_8__stack_34c__width_33 inst0_mux  (
    .din0(w0_data_r1_buf[32:0]),
    .din1(w1_data_r1_buf[32:0]),
    .din2(w2_data_r1_buf[32:0]),
    .din3(w3_data_r1_buf[32:0]),
    .din4(w4_data_r1_buf[32:0]),
    .din5(w5_data_r1_buf[32:0]),
    .din6(w6_data_r1_buf[32:0]),
    .din7(w7_data_r1_buf[32:0]),
    .sel0(lsc_data_sel_lat[0]),
    .sel1(lsc_data_sel_lat[1]),
    .sel2(lsc_data_sel_lat[2]),
    .sel3(lsc_data_sel_lat[3]),
    .sel4(lsc_data_sel_lat[4]),
    .sel5(lsc_data_sel_lat[5]),
    .sel6(lsc_data_sel_lat[6]),
    .sel7(lsc_data_sel_lat[7]),
    .dout(cmu_fill_inst0_prebuf[32:0])
);

ifu_cmu_lsi_dp_buff_macro__stack_34c__width_33 inst0_buf   (
	.din	(cmu_fill_inst0_prebuf[32:0]),
	.dout	(cmu_fill_inst0[32:0])
);

ifu_cmu_lsi_dp_mux_macro__mux_aonpe__ports_8__stack_34c__width_33 inst1_mux  (
    .din0(w1_data_r1_buf[32:0]),
    .din1(w2_data_r1_buf[32:0]),
    .din2(w3_data_r1_buf[32:0]),
    .din3(w4_data_r1_buf[32:0]),
    .din4(w5_data_r1_buf[32:0]),
    .din5(w6_data_r1_buf[32:0]),
    .din6(w7_data_r1_buf[32:0]),
    .din7(w0_data_r1_buf[32:0]),
    .sel0(lsc_data_sel_lat[0]),
    .sel1(lsc_data_sel_lat[1]),
    .sel2(lsc_data_sel_lat[2]),
    .sel3(lsc_data_sel_lat[3]),
    .sel4(lsc_data_sel_lat[4]),
    .sel5(lsc_data_sel_lat[5]),
    .sel6(lsc_data_sel_lat[6]),
    .sel7(lsc_data_sel_lat[7]),
    .dout(cmu_fill_inst1_prebuf[32:0])
);

ifu_cmu_lsi_dp_buff_macro__stack_34c__width_33 inst1_buf   (
	.din	(cmu_fill_inst1_prebuf[32:0]),
	.dout	(cmu_fill_inst1[32:0])
);

ifu_cmu_lsi_dp_mux_macro__mux_aonpe__ports_8__stack_34c__width_33 inst2_mux  (
    .din0(w2_data_r1_buf[32:0]),
    .din1(w3_data_r1_buf[32:0]),
    .din2(w4_data_r1_buf[32:0]),
    .din3(w5_data_r1_buf[32:0]),
    .din4(w6_data_r1_buf[32:0]),
    .din5(w7_data_r1_buf[32:0]),
    .din6(w0_data_r1_buf[32:0]),
    .din7(w1_data_r1_buf[32:0]),
    .sel0(lsc_data_sel_lat[0]),
    .sel1(lsc_data_sel_lat[1]),
    .sel2(lsc_data_sel_lat[2]),
    .sel3(lsc_data_sel_lat[3]),
    .sel4(lsc_data_sel_lat[4]),
    .sel5(lsc_data_sel_lat[5]),
    .sel6(lsc_data_sel_lat[6]),
    .sel7(lsc_data_sel_lat[7]),
    .dout(cmu_fill_inst2_prebuf[32:0])
);

ifu_cmu_lsi_dp_buff_macro__stack_34c__width_33 inst2_buf   (
	.din	(cmu_fill_inst2_prebuf[32:0]),
	.dout	(cmu_fill_inst2[32:0])
);

ifu_cmu_lsi_dp_mux_macro__mux_aonpe__ports_8__stack_34c__width_33 inst3_mux  (
    .din0(w3_data_r1_buf[32:0]),
    .din1(w4_data_r1_buf[32:0]),
    .din2(w5_data_r1_buf[32:0]),
    .din3(w6_data_r1_buf[32:0]),
    .din4(w7_data_r1_buf[32:0]),
    .din5(w0_data_r1_buf[32:0]),
    .din6(w1_data_r1_buf[32:0]),
    .din7(w2_data_r1_buf[32:0]),
    .sel0(lsc_data_sel_lat[0]),
    .sel1(lsc_data_sel_lat[1]),
    .sel2(lsc_data_sel_lat[2]),
    .sel3(lsc_data_sel_lat[3]),
    .sel4(lsc_data_sel_lat[4]),
    .sel5(lsc_data_sel_lat[5]),
    .sel6(lsc_data_sel_lat[6]),
    .sel7(lsc_data_sel_lat[7]),
    .dout(cmu_fill_inst3_prebuf[32:0])
);

ifu_cmu_lsi_dp_buff_macro__stack_34c__width_33 inst3_buf   (
	.din	(cmu_fill_inst3_prebuf[32:0]),
	.dout	(cmu_fill_inst3[32:0])
);


////////////////////////////////////////////////////////
// Buffer Cache data
////////////////////////////////////////////////////////
ifu_cmu_lsi_dp_buff_macro__stack_34c__width_33 w0_data_buf   (
    .din	(w0_data_r1[32:0]),
	.dout	(w0_data_r1_buf[32:0])
);

ifu_cmu_lsi_dp_buff_macro__stack_34c__width_33 w1_data_buf   (
    .din	(w1_data_r1[32:0]),
	.dout	(w1_data_r1_buf[32:0])
);

ifu_cmu_lsi_dp_buff_macro__stack_34c__width_33 w2_data_buf   (
    .din	(w2_data_r1[32:0]),
	.dout	(w2_data_r1_buf[32:0])
);

ifu_cmu_lsi_dp_buff_macro__stack_34c__width_33 w3_data_buf   (
    .din	(w3_data_r1[32:0]),
	.dout	(w3_data_r1_buf[32:0])
);

ifu_cmu_lsi_dp_buff_macro__stack_34c__width_33 w4_data_buf   (
    .din	(w4_data_r1[32:0]),
	.dout	(w4_data_r1_buf[32:0])
);

ifu_cmu_lsi_dp_buff_macro__stack_34c__width_33 w5_data_buf   (
    .din	(w5_data_r1[32:0]),
	.dout	(w5_data_r1_buf[32:0])
);

ifu_cmu_lsi_dp_buff_macro__stack_34c__width_33 w6_data_buf   (
    .din	(w6_data_r1[32:0]),
	.dout	(w6_data_r1_buf[32:0])
);

ifu_cmu_lsi_dp_buff_macro__stack_34c__width_33 w7_data_buf   (
    .din	(w7_data_r1[32:0]),
	.dout	(w7_data_r1_buf[32:0])
);

////////////////////////////////////////////////////////
// Cache Data Line
////////////////////////////////////////////////////////
assign cmu_ic_data[32:0] = w0_data_r1_buf[32:0];
assign cmu_ic_data[65:33] = w1_data_r1_buf[32:0];
assign cmu_ic_data[98:66] = w2_data_r1_buf[32:0];
assign cmu_ic_data[131:99] = w3_data_r1_buf[32:0];
assign cmu_ic_data[164:132] = w4_data_r1_buf[32:0];
assign cmu_ic_data[197:165] = w5_data_r1_buf[32:0];
assign cmu_ic_data[230:198] = w6_data_r1_buf[32:0];
assign cmu_ic_data[263:231] = w7_data_r1_buf[32:0];




// fixscan start:
assign fill_data_w0_reg_scanin   = scan_in                  ;
assign fill_data_w1_reg_scanin   = fill_data_w0_reg_scanout ;
assign fill_data_w2_reg_scanin   = fill_data_w1_reg_scanout ;
assign fill_data_w3_reg_scanin   = fill_data_w2_reg_scanout ;
assign fill_data_w4_reg_scanin   = fill_data_w3_reg_scanout ;
assign fill_data_w5_reg_scanin   = fill_data_w4_reg_scanout ;
assign fill_data_w6_reg_scanin   = fill_data_w5_reg_scanout ;
assign fill_data_w7_reg_scanin   = fill_data_w6_reg_scanout ;
assign paddr_lat_scanin          = fill_data_w7_reg_scanout ;
assign scan_out                  = paddr_lat_scanout        ;
// fixscan end:
endmodule


//
//   buff macro
//
//





module ifu_cmu_lsi_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 (
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





module ifu_cmu_lsi_dp_prty_macro__dprty_8x__width_32 (
  din, 
  dout);
  input [31:0] din;
  output dout;







prty #(32)  m0_0 (
.in(din[31:0]),
.out(dout)
);










endmodule





//
//   xor macro for ports = 2,3
//
//





module ifu_cmu_lsi_dp_xor_macro__ports_2__stack_34c__width_1 (
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
//   and macro for ports = 2,3,4
//
//





module ifu_cmu_lsi_dp_and_macro__stack_34c__width_5 (
  din0, 
  din1, 
  dout);
  input [4:0] din0;
  input [4:0] din1;
  output [4:0] dout;






and2 #(5)  d0_0 (
.in0(din0[4:0]),
.in1(din1[4:0]),
.out(dout[4:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_cmu_lsi_dp_mux_macro__mux_aope__ports_2__stack_34c__width_33 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [32:0] din0;
  input [32:0] din1;
  input sel0;
  output [32:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(33)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[32:0]),
  .in1(din1[32:0]),
.dout(dout[32:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module ifu_cmu_lsi_dp_msff_macro__stack_34c__width_33 (
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
wire [31:0] so;

  input [32:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [32:0] dout;


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
dff #(33)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[32:0]),
.si({scan_in,so[31:0]}),
.so({so[31:0],scan_out}),
.q(dout[32:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module ifu_cmu_lsi_dp_msff_macro__left_8__stack_16l__width_8 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_cmu_lsi_dp_mux_macro__mux_aonpe__ports_8__stack_34c__width_33 (
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

  input [32:0] din0;
  input sel0;
  input [32:0] din1;
  input sel1;
  input [32:0] din2;
  input sel2;
  input [32:0] din3;
  input sel3;
  input [32:0] din4;
  input sel4;
  input [32:0] din5;
  input sel5;
  input [32:0] din6;
  input sel6;
  input [32:0] din7;
  input sel7;
  output [32:0] dout;





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
mux8s #(33)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[32:0]),
  .in1(din1[32:0]),
  .in2(din2[32:0]),
  .in3(din3[32:0]),
  .in4(din4[32:0]),
  .in5(din5[32:0]),
  .in6(din6[32:0]),
  .in7(din7[32:0]),
.dout(dout[32:0])
);









  



endmodule


//
//   buff macro
//
//





module ifu_cmu_lsi_dp_buff_macro__stack_34c__width_33 (
  din, 
  dout);
  input [32:0] din;
  output [32:0] dout;






buff #(33)  d0_0 (
.in(din[32:0]),
.out(dout[32:0])
);








endmodule




