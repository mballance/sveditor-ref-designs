// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sio_opdc_dp.v
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
module sio_opdc_dp (
  l2clk, 
  old0_opd_data, 
  old1_opd_data, 
  old2_opd_data, 
  old3_opd_data, 
  old4_opd_data, 
  old5_opd_data, 
  old6_opd_data, 
  old7_opd_data, 
  opcc_opdc_gnt0_opc0, 
  opcc_opdc_gnt2_opc0, 
  opcc_opdc_gnt4_opc0, 
  opcc_opdc_gnt6_opc0, 
  opcc_opdc_gnt01_opc1, 
  opcc_opdc_gnt45_opc1, 
  opcc_opdc_gnt0123_opc1, 
  olddq0_dout, 
  olddq1_dout, 
  olddq2_dout, 
  olddq3_dout, 
  olddq4_dout, 
  olddq5_dout, 
  olddq6_dout, 
  olddq7_dout, 
  sio_mb0_sel_l1, 
  sio_mb0_sel_l2, 
  opdc_bank_data_opc1, 
  read_data_top, 
  read_data_bot, 
  sio_mb1_run, 
  sio_mb1_wdata, 
  opdc_mb1bank_data_opc1, 
  opdc_mb1bank_parity_opc1, 
  sio_mb1_addr, 
  opcc_opddq00_wr_en, 
  opcc_opddq01_wr_en, 
  opcc_opddq10_wr_en, 
  opcc_opddq11_wr_en, 
  opcc_opdhq0_wr_en, 
  opcc_opdhq1_wr_en, 
  sio_mb1_opddq00_wr_en, 
  sio_mb1_opddq01_wr_en, 
  sio_mb1_opdhq0_wr_en, 
  sio_mb1_opddq10_wr_en, 
  sio_mb1_opddq11_wr_en, 
  sio_mb1_opdhq1_wr_en, 
  opdc_opddq00_wr_en, 
  opdc_opddq01_wr_en, 
  opdc_opdhq0_wr_en, 
  opdc_opddq10_wr_en, 
  opdc_opddq11_wr_en, 
  opdc_opdhq1_wr_en, 
  opcc_opddq00_wr_addr, 
  opcc_opddq01_wr_addr, 
  opcc_opdhq0_wr_addr, 
  opcc_opddq10_wr_addr, 
  opcc_opddq11_wr_addr, 
  opcc_opdhq1_wr_addr, 
  opdc_opddq00_wr_addr, 
  opdc_opddq01_wr_addr, 
  opdc_opdhq0_wr_addr, 
  opdc_opddq10_wr_addr, 
  opdc_opddq11_wr_addr, 
  opdc_opdhq1_wr_addr, 
  tcu_muxtest, 
  tcu_dectest, 
  tcu_scan_en, 
  scan_in, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  scan_out);
wire muxtst;
wire test;
wire se;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire [63:0] bank_data_opc1;
wire [65:0] bank01_data_opc0;
wire [65:0] bank23_data_opc0;
wire [65:0] bank67_data_opc0;
wire [67:0] mb0_read_data_01;
wire [67:0] mb0_read_data_23;
wire [67:0] mb0_read_data_45;
wire [67:0] mb0_read_data_67;
wire [67:0] mb0_read_data_0145;
wire dff_mbist0145_data_h_scanin;
wire dff_mbist0145_data_h_scanout;
wire dff_mbist0145_data_l_scanin;
wire dff_mbist0145_data_l_scanout;
wire [67:0] mb0_read_data_2367;
wire dff_mbist2367_data_h_scanin;
wire dff_mbist2367_data_h_scanout;
wire dff_mbist2367_data_l_scanin;
wire dff_mbist2367_data_l_scanout;
wire dff_bank01_data_opc1_h_scanin;
wire dff_bank01_data_opc1_h_scanout;
wire [65:0] bank01_data_opc1;
wire dff_bank01_data_opc1_l_scanin;
wire dff_bank01_data_opc1_l_scanout;
wire dff_bank23_data_opc1_h_scanin;
wire dff_bank23_data_opc1_h_scanout;
wire [65:0] bank23_data_opc1;
wire dff_bank23_data_opc1_l_scanin;
wire dff_bank23_data_opc1_l_scanout;
wire dff_bank45_data_opc1_h_scanin;
wire dff_bank45_data_opc1_h_scanout;
wire [65:0] bank45_data_opc1;
wire dff_bank45_data_opc1_l_scanin;
wire dff_bank45_data_opc1_l_scanout;
wire dff_bank67_data_opc1_h_scanin;
wire dff_bank67_data_opc1_h_scanout;
wire [65:0] bank67_data_opc1;
wire dff_bank67_data_opc1_l_scanin;
wire dff_bank67_data_opc1_l_scanout;
wire [63:0] bank01_data_opc1_rw;
wire [63:0] bank23_data_opc1_rw;
wire [63:0] bank45_data_opc1_rw;
wire [63:0] bank67_data_opc1_rw;
wire [3:0] bank01_parity_opc1_pre;
wire [3:0] bank23_parity_opc1_pre;
wire [3:0] bank45_parity_opc1_pre;
wire [3:0] bank67_parity_opc1_pre;
wire [3:0] bank01_parity_opc1;
wire [3:0] bank23_parity_opc1;
wire [3:0] bank45_parity_opc1;
wire [3:0] bank67_parity_opc1;
wire [7:0] bank_parity_opc1;
wire [63:0] bankleft_data_opc1;
wire [63:0] bankright_data_opc1;
wire [3:0] sel_bank_parity;
wire not_opcc_opdc_gnt01_opc1;
wire not_opcc_opdc_gnt45_opc1;
wire not_opcc_opdc_gnt0123_opc1;


   input          l2clk;
   input  [64:0]  old0_opd_data;		//[66] [64] = ue , [63:0] = data
   input  [64:0]  old1_opd_data;
   input  [64:0]  old2_opd_data;
   input  [64:0]  old3_opd_data;
   input  [64:0]  old4_opd_data;
   input  [64:0]  old5_opd_data;
   input  [64:0]  old6_opd_data;
   input  [64:0]  old7_opd_data;
   input          opcc_opdc_gnt0_opc0;
   input          opcc_opdc_gnt2_opc0;
   input          opcc_opdc_gnt4_opc0;
   input          opcc_opdc_gnt6_opc0;
   input          opcc_opdc_gnt01_opc1;
   input          opcc_opdc_gnt45_opc1;
   input          opcc_opdc_gnt0123_opc1;
   
   input  [67:0]  olddq0_dout;
   input  [67:0]  olddq1_dout;
   input  [67:0]  olddq2_dout;
   input  [67:0]  olddq3_dout;
   input  [67:0]  olddq4_dout;
   input  [67:0]  olddq5_dout;
   input  [67:0]  olddq6_dout;
   input  [67:0]  olddq7_dout;
   input	  sio_mb0_sel_l1;
   input	  sio_mb0_sel_l2;

   output [63:0]  opdc_bank_data_opc1;
   output [67:0]  read_data_top;
   output [67:0]  read_data_bot;
//   output [7:0]   opdc_bank_parity_opc1;


   // for mb1
   // 2:1 mux between {opdc_bank_data_opc1[63:0], opdc_bank_parity_opc1[7:0]} and {9{sio_mb1_wdata[7:0]}}
   input 	  sio_mb1_run;
   input [7:0] 	  sio_mb1_wdata;

   output [63:0]  opdc_mb1bank_data_opc1;
   output [7:0]   opdc_mb1bank_parity_opc1;

   // for mb1 - mux between the wr_en, wr_addr
   input  [5:0]	      sio_mb1_addr;
   input 	      opcc_opddq00_wr_en;
   input 	      opcc_opddq01_wr_en;
   input 	      opcc_opddq10_wr_en;
   input 	      opcc_opddq11_wr_en;
   input 	      opcc_opdhq0_wr_en;
   input 	      opcc_opdhq1_wr_en;
   input 	      sio_mb1_opddq00_wr_en;
   input 	      sio_mb1_opddq01_wr_en;
   input 	      sio_mb1_opdhq0_wr_en;
   input 	      sio_mb1_opddq10_wr_en;
   input 	      sio_mb1_opddq11_wr_en;
   input 	      sio_mb1_opdhq1_wr_en;
   output 	      opdc_opddq00_wr_en;
   output 	      opdc_opddq01_wr_en;
   output 	      opdc_opdhq0_wr_en;   
   output 	      opdc_opddq10_wr_en;
   output 	      opdc_opddq11_wr_en;
   output 	      opdc_opdhq1_wr_en;   

   input  [5:0]	      opcc_opddq00_wr_addr;
   input  [5:0]	      opcc_opddq01_wr_addr;
   input  [3:0]	      opcc_opdhq0_wr_addr;
   input  [5:0]	      opcc_opddq10_wr_addr;
   input  [5:0]	      opcc_opddq11_wr_addr;
   input  [3:0]	      opcc_opdhq1_wr_addr;

   output [5:0]	      opdc_opddq00_wr_addr;
   output [5:0]	      opdc_opddq01_wr_addr;
   output [3:0]	      opdc_opdhq0_wr_addr;   
   output [5:0]	      opdc_opddq10_wr_addr;
   output [5:0]	      opdc_opddq11_wr_addr;
   output [3:0]	      opdc_opdhq1_wr_addr;   
   

   input 	  tcu_muxtest;
   input 	  tcu_dectest;
   input 	  tcu_scan_en;
   
   input 	scan_in;
   input 	tcu_aclk;
   input 	tcu_bclk; 
   input 	tcu_pce_ov;
   input 	tcu_clk_stop;
   output 	scan_out;

   ///////////////////////////////////////
   // Scan chain connections            
   ///////////////////////////////////////
   // scan renames
   assign 	  muxtst = tcu_muxtest;
   assign 	  test   = tcu_dectest;
   assign 	  se     = tcu_scan_en;

assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign pce_ov = tcu_pce_ov;
assign stop = tcu_clk_stop;
   // end scan

	
   assign opdc_bank_data_opc1[63:0]   = bank_data_opc1[63:0];
//   assign opdc_bank_parity_opc1[7:0]  = bank_parity_opc1[7:0];


 wire [10:0] bank01_data_opc0_buf;
 wire [65:0] bank01_data_opc0_pre;
 wire  bank01_unused;
 wire  bank45_unused;
 wire [65:0] bank45_data_opc0_pre;
 wire [65:0] bank45_data_opc0;
 wire [16:0] bank45_data_opc0_buf;
 wire [17:0] bank67_data_opc0_buf;


   // level 1 -- opc0 stage

   sio_opdc_dp_mux_macro__mux_pgpe__ports_2__stack_66c__width_66  mx21_bank01_data     (
	.dout (bank01_data_opc0_pre[65:0]),
	.din0 ({1'b0, old0_opd_data[64:0]}),
	.din1 ({1'b0, old1_opd_data[64:0]}),
	.sel0 (opcc_opdc_gnt0_opc0)
	);

   sio_opdc_dp_buff_macro__minbuff_1__stack_2l__width_2  buf_mx21_bank01_data  (
                        .din ({bank01_data_opc0_pre[50], bank01_data_opc0_pre[48]}),
                        .dout ({bank01_data_opc0_buf[1:0]})
                        );

   assign bank01_data_opc0 = {bank01_data_opc0_pre[65:51],bank01_data_opc0_buf[1],bank01_data_opc0_pre[49],bank01_data_opc0_buf[0],bank01_data_opc0_pre[47:0]};

   sio_opdc_dp_mux_macro__mux_pgpe__ports_2__stack_66c__width_66  mx21_bank23_data     (
	.dout (bank23_data_opc0[65:0]),
	.din0 ({1'b0, old2_opd_data[64:0]}),
	.din1 ({1'b0, old3_opd_data[64:0]}),
	.sel0 (opcc_opdc_gnt2_opc0)
	);
								 
   sio_opdc_dp_mux_macro__mux_pgpe__ports_2__stack_66c__width_66  mx21_bank45_data     (
	.dout (bank45_data_opc0_pre[65:0]),
	.din0 ({1'b0, old4_opd_data[64:0]}),
	.din1 ({1'b0, old5_opd_data[64:0]}),
	.sel0 (opcc_opdc_gnt4_opc0)
	);

   sio_opdc_dp_buff_macro__minbuff_1__stack_12l__width_12  buf_mx21_bank45_data  (
     .din ({1'b0,bank45_data_opc0_pre[52],bank45_data_opc0_pre[48:46],bank45_data_opc0_pre[44:42],bank45_data_opc0_pre[39],bank45_data_opc0_pre[36],bank45_data_opc0_pre[33:32]}),
     .dout ({bank45_unused,bank45_data_opc0_buf[10:0]})
                        );
 
   assign bank45_data_opc0 = {bank45_data_opc0_pre[65:53],bank45_data_opc0_buf[10],bank45_data_opc0_pre[51:49],bank45_data_opc0_buf[9:7],bank45_data_opc0_pre[45],bank45_data_opc0_buf[6:4],bank45_data_opc0_pre[41:40],bank45_data_opc0_buf[3],bank45_data_opc0_pre[38:37],bank45_data_opc0_buf[2],bank45_data_opc0_pre[35:34],bank45_data_opc0_buf[1:0],bank45_data_opc0_pre[31:0]};
   
   sio_opdc_dp_mux_macro__mux_pgpe__ports_2__stack_66c__width_66  mx21_bank67_data     (
	.dout (bank67_data_opc0[65:0]),
	.din0 ({1'b0, old6_opd_data[64:0]}),
	.din1 ({1'b0, old7_opd_data[64:0]}),
	.sel0 (opcc_opdc_gnt6_opc0)
	);

   //-------------------------------
   // 		mbist muxes
   //-------------------------------
// Level one muxes
   sio_opdc_dp_mux_macro__dmux_16x__mux_pgpe__ports_2__stack_68c__width_68  mx21_mbist01_data      (
	.dout (mb0_read_data_01[67:0]),
	.din0 (olddq0_dout[67:0]),
	.din1 (olddq1_dout[67:0]),
	.sel0 (sio_mb0_sel_l1)
	);
								 
   sio_opdc_dp_mux_macro__dmux_16x__mux_pgpe__ports_2__stack_68c__width_68  mx21_mbist23_data      (
	.dout (mb0_read_data_23[67:0]),
	.din0 (olddq2_dout[67:0]),
	.din1 (olddq3_dout[67:0]),
	.sel0 (sio_mb0_sel_l1)
	);
								 
   sio_opdc_dp_mux_macro__dmux_16x__mux_pgpe__ports_2__stack_68c__width_68  mx21_mbist45_data      (
	.dout (mb0_read_data_45[67:0]),
	.din0 (olddq4_dout[67:0]),
	.din1 (olddq5_dout[67:0]),
	.sel0 (sio_mb0_sel_l1)
	);
								 
   sio_opdc_dp_mux_macro__dmux_16x__mux_pgpe__ports_2__stack_68c__width_68  mx21_mbist67_data      (
	.dout (mb0_read_data_67[67:0]),
	.din0 (olddq6_dout[67:0]),
	.din1 (olddq7_dout[67:0]),
	.sel0 (sio_mb0_sel_l1)
	);
								 
// Level 2
   sio_opdc_dp_mux_macro__dmux_16x__mux_pgpe__ports_2__stack_68c__width_68  mx21_mbist0145_data      (
	.dout (mb0_read_data_0145[67:0]),
	.din0 (mb0_read_data_01[67:0]),
	.din1 (mb0_read_data_45[67:0]),
	.sel0 (sio_mb0_sel_l2)
	);
								 
   sio_opdc_dp_msff_macro__stack_34l__width_34 dff_mbist0145_data_h   (
	.scan_in(dff_mbist0145_data_h_scanin),
	.scan_out(dff_mbist0145_data_h_scanout),
	.clk  (l2clk),
	.din  (mb0_read_data_0145[67:34]),
	.dout (read_data_top[67:34]),
	.en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
   
   sio_opdc_dp_msff_macro__stack_34l__width_34 dff_mbist0145_data_l   (
	.scan_in(dff_mbist0145_data_l_scanin),
	.scan_out(dff_mbist0145_data_l_scanout),
	.clk  (l2clk),
	.din  (mb0_read_data_0145[33:0]),
	.dout (read_data_top[33:0]),
	.en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
   
   sio_opdc_dp_mux_macro__dmux_16x__mux_pgpe__ports_2__stack_68c__width_68  mx21_mbist2367_data      (
	.dout (mb0_read_data_2367[67:0]),
	.din0 (mb0_read_data_23[67:0]),
	.din1 (mb0_read_data_67[67:0]),
	.sel0 (sio_mb0_sel_l2)
	);

   sio_opdc_dp_msff_macro__stack_34l__width_34 dff_mbist2367_data_h   (
	.scan_in(dff_mbist2367_data_h_scanin),
	.scan_out(dff_mbist2367_data_h_scanout),
	.clk  (l2clk),
	.din  (mb0_read_data_2367[67:34]),
	.dout (read_data_bot[67:34]),
	.en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
   
   sio_opdc_dp_msff_macro__stack_34l__width_34 dff_mbist2367_data_l   (
	.scan_in(dff_mbist2367_data_l_scanin),
	.scan_out(dff_mbist2367_data_l_scanout),
	.clk  (l2clk),
	.din  (mb0_read_data_2367[33:0]),
	.dout (read_data_bot[33:0]),
	.en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
   
   // DFF
   sio_opdc_dp_buff_macro__minbuff_1__stack_10l__width_10  buf_bank01_data_opc1_h0  (
     .din ({1'b0,bank01_data_opc0[58],bank01_data_opc0[54],bank01_data_opc0[52:51],bank01_data_opc0[47:46],bank01_data_opc0[38],bank01_data_opc0[36],bank01_data_opc0[32]}),
     .dout ({bank01_unused,bank01_data_opc0_buf[10:2]})
                        );
   sio_opdc_dp_msff_macro__stack_34l__width_34 dff_bank01_data_opc1_h   (
	.scan_in(dff_bank01_data_opc1_h_scanin),
	.scan_out(dff_bank01_data_opc1_h_scanout),
	.clk  (l2clk),
	.din  ({bank01_data_opc0[65:59],bank01_data_opc0_buf[10],bank01_data_opc0[57:55],bank01_data_opc0_buf[9],bank01_data_opc0[53],bank01_data_opc0_buf[8:7],bank01_data_opc0[50:48],bank01_data_opc0_buf[6:5],bank01_data_opc0[45:39],bank01_data_opc0_buf[4],bank01_data_opc0[37],bank01_data_opc0_buf[3],bank01_data_opc0[35:33],bank01_data_opc0_buf[2]}),
	.dout (bank01_data_opc1[65:32]),
	.en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
   
   sio_opdc_dp_msff_macro__stack_32l__width_32 dff_bank01_data_opc1_l   (
	.scan_in(dff_bank01_data_opc1_l_scanin),
	.scan_out(dff_bank01_data_opc1_l_scanout),
	.clk  (l2clk),
	.din  (bank01_data_opc0[31:0]),
	.dout (bank01_data_opc1[31:0]),
	.en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
   
   sio_opdc_dp_msff_macro__stack_34l__width_34 dff_bank23_data_opc1_h   (
	.scan_in(dff_bank23_data_opc1_h_scanin),
	.scan_out(dff_bank23_data_opc1_h_scanout),
	.clk  (l2clk),
	.din  (bank23_data_opc0[65:32]),
	.dout (bank23_data_opc1[65:32]),
	.en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
   
   sio_opdc_dp_msff_macro__stack_32l__width_32 dff_bank23_data_opc1_l   (
	.scan_in(dff_bank23_data_opc1_l_scanin),
	.scan_out(dff_bank23_data_opc1_l_scanout),
	.clk  (l2clk),
	.din  (bank23_data_opc0[31:0]),
	.dout (bank23_data_opc1[31:0]),
	.en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

   sio_opdc_dp_buff_macro__minbuff_1__stack_6l__width_6  buf_bank45_data_opc1_h  (
     .din ({bank45_data_opc0[61],bank45_data_opc0[59],bank45_data_opc0[55],bank45_data_opc0[51],bank45_data_opc0[38],bank45_data_opc0[34]}),
     .dout ({bank45_data_opc0_buf[16:11]})
                        );

   sio_opdc_dp_msff_macro__stack_34l__width_34 dff_bank45_data_opc1_h   (
	.scan_in(dff_bank45_data_opc1_h_scanin),
	.scan_out(dff_bank45_data_opc1_h_scanout),
	.clk  (l2clk),
	.din  ({bank45_data_opc0[65:62],bank45_data_opc0_buf[16],bank45_data_opc0[60],bank45_data_opc0_buf[15],bank45_data_opc0[58:56],bank45_data_opc0_buf[14],bank45_data_opc0[54:52],bank45_data_opc0_buf[13],bank45_data_opc0[50:39],bank45_data_opc0_buf[12],bank45_data_opc0[37:35],bank45_data_opc0_buf[11],bank45_data_opc0[33:32]}),
	.dout (bank45_data_opc1[65:32]),
	.en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
   
   sio_opdc_dp_msff_macro__stack_32l__width_32 dff_bank45_data_opc1_l   (
	.scan_in(dff_bank45_data_opc1_l_scanin),
	.scan_out(dff_bank45_data_opc1_l_scanout),
	.clk  (l2clk),
	.din  (bank45_data_opc0[31:0]),
	.dout (bank45_data_opc1[31:0]),
	.en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
   
   sio_opdc_dp_buff_macro__minbuff_1__stack_18l__width_18  buf_bank67_data_opc1_h  (
     .din ({bank67_data_opc0[56:55],bank67_data_opc0[52:50],bank67_data_opc0[48],bank67_data_opc0[46],bank67_data_opc0[43:38],bank67_data_opc0[36:32]}),
     .dout ({bank67_data_opc0_buf[17:0]})
                        );

   sio_opdc_dp_msff_macro__stack_34l__width_34 dff_bank67_data_opc1_h   (
	.scan_in(dff_bank67_data_opc1_h_scanin),
	.scan_out(dff_bank67_data_opc1_h_scanout),
	.clk  (l2clk),
	.din  ({bank67_data_opc0[65:57],bank67_data_opc0_buf[17:16],bank67_data_opc0[54:53],bank67_data_opc0_buf[15:13],bank67_data_opc0[49],bank67_data_opc0_buf[12],bank67_data_opc0[47],bank67_data_opc0_buf[11],bank67_data_opc0[45:44],bank67_data_opc0_buf[10:5],bank67_data_opc0[37],bank67_data_opc0_buf[4:0]}),
	.dout (bank67_data_opc1[65:32]),
	.en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
   
   sio_opdc_dp_msff_macro__stack_32l__width_32 dff_bank67_data_opc1_l   (
	.scan_in(dff_bank67_data_opc1_l_scanin),
	.scan_out(dff_bank67_data_opc1_l_scanout),
	.clk  (l2clk),
	.din  (bank67_data_opc0[31:0]),
	.dout (bank67_data_opc1[31:0]),
	.en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);
   
// rewired data from flop output above
// INTERLEAVED PARITY CODE
//
// pgenx

   assign bank01_data_opc1_rw[63:0] = {
                                         bank01_data_opc1[63], bank01_data_opc1[61], bank01_data_opc1[59], bank01_data_opc1[57],
                                         bank01_data_opc1[55], bank01_data_opc1[53], bank01_data_opc1[51], bank01_data_opc1[49],
                                         bank01_data_opc1[47], bank01_data_opc1[45], bank01_data_opc1[43], bank01_data_opc1[41],
                                         bank01_data_opc1[39], bank01_data_opc1[37], bank01_data_opc1[35], bank01_data_opc1[33],

                                         bank01_data_opc1[62], bank01_data_opc1[60], bank01_data_opc1[58], bank01_data_opc1[56],
                                         bank01_data_opc1[54], bank01_data_opc1[52], bank01_data_opc1[50], bank01_data_opc1[48],
                                         bank01_data_opc1[46], bank01_data_opc1[44], bank01_data_opc1[42], bank01_data_opc1[40],
                                         bank01_data_opc1[38], bank01_data_opc1[36], bank01_data_opc1[34], bank01_data_opc1[32],

                                         bank01_data_opc1[31], bank01_data_opc1[29], bank01_data_opc1[27], bank01_data_opc1[25],
                                         bank01_data_opc1[23], bank01_data_opc1[21], bank01_data_opc1[19], bank01_data_opc1[17],
                                         bank01_data_opc1[15], bank01_data_opc1[13], bank01_data_opc1[11], bank01_data_opc1[ 9],
                                         bank01_data_opc1[ 7], bank01_data_opc1[ 5], bank01_data_opc1[ 3], bank01_data_opc1[ 1],

                                         bank01_data_opc1[30], bank01_data_opc1[28], bank01_data_opc1[26], bank01_data_opc1[24],
                                         bank01_data_opc1[22], bank01_data_opc1[20], bank01_data_opc1[18], bank01_data_opc1[16],
                                         bank01_data_opc1[14], bank01_data_opc1[12], bank01_data_opc1[10], bank01_data_opc1[ 8],
                                         bank01_data_opc1[ 6], bank01_data_opc1[ 4], bank01_data_opc1[ 2], bank01_data_opc1[ 0]
                                         };

   assign bank23_data_opc1_rw[63:0] = {
                                         bank23_data_opc1[63], bank23_data_opc1[61], bank23_data_opc1[59], bank23_data_opc1[57],
                                         bank23_data_opc1[55], bank23_data_opc1[53], bank23_data_opc1[51], bank23_data_opc1[49],
                                         bank23_data_opc1[47], bank23_data_opc1[45], bank23_data_opc1[43], bank23_data_opc1[41],
                                         bank23_data_opc1[39], bank23_data_opc1[37], bank23_data_opc1[35], bank23_data_opc1[33],

                                         bank23_data_opc1[62], bank23_data_opc1[60], bank23_data_opc1[58], bank23_data_opc1[56],
                                         bank23_data_opc1[54], bank23_data_opc1[52], bank23_data_opc1[50], bank23_data_opc1[48],
                                         bank23_data_opc1[46], bank23_data_opc1[44], bank23_data_opc1[42], bank23_data_opc1[40],
                                         bank23_data_opc1[38], bank23_data_opc1[36], bank23_data_opc1[34], bank23_data_opc1[32],

                                         bank23_data_opc1[31], bank23_data_opc1[29], bank23_data_opc1[27], bank23_data_opc1[25],
                                         bank23_data_opc1[23], bank23_data_opc1[21], bank23_data_opc1[19], bank23_data_opc1[17],
                                         bank23_data_opc1[15], bank23_data_opc1[13], bank23_data_opc1[11], bank23_data_opc1[ 9],
                                         bank23_data_opc1[ 7], bank23_data_opc1[ 5], bank23_data_opc1[ 3], bank23_data_opc1[ 1],

                                         bank23_data_opc1[30], bank23_data_opc1[28], bank23_data_opc1[26], bank23_data_opc1[24],
                                         bank23_data_opc1[22], bank23_data_opc1[20], bank23_data_opc1[18], bank23_data_opc1[16],
                                         bank23_data_opc1[14], bank23_data_opc1[12], bank23_data_opc1[10], bank23_data_opc1[ 8],
                                         bank23_data_opc1[ 6], bank23_data_opc1[ 4], bank23_data_opc1[ 2], bank23_data_opc1[ 0]
                                         };

   assign bank45_data_opc1_rw[63:0] = {
                                         bank45_data_opc1[63], bank45_data_opc1[61], bank45_data_opc1[59], bank45_data_opc1[57],
                                         bank45_data_opc1[55], bank45_data_opc1[53], bank45_data_opc1[51], bank45_data_opc1[49],
                                         bank45_data_opc1[47], bank45_data_opc1[45], bank45_data_opc1[43], bank45_data_opc1[41],
                                         bank45_data_opc1[39], bank45_data_opc1[37], bank45_data_opc1[35], bank45_data_opc1[33],

                                         bank45_data_opc1[62], bank45_data_opc1[60], bank45_data_opc1[58], bank45_data_opc1[56],
                                         bank45_data_opc1[54], bank45_data_opc1[52], bank45_data_opc1[50], bank45_data_opc1[48],
                                         bank45_data_opc1[46], bank45_data_opc1[44], bank45_data_opc1[42], bank45_data_opc1[40],
                                         bank45_data_opc1[38], bank45_data_opc1[36], bank45_data_opc1[34], bank45_data_opc1[32],

                                         bank45_data_opc1[31], bank45_data_opc1[29], bank45_data_opc1[27], bank45_data_opc1[25],
                                         bank45_data_opc1[23], bank45_data_opc1[21], bank45_data_opc1[19], bank45_data_opc1[17],
                                         bank45_data_opc1[15], bank45_data_opc1[13], bank45_data_opc1[11], bank45_data_opc1[ 9],
                                         bank45_data_opc1[ 7], bank45_data_opc1[ 5], bank45_data_opc1[ 3], bank45_data_opc1[ 1],

                                         bank45_data_opc1[30], bank45_data_opc1[28], bank45_data_opc1[26], bank45_data_opc1[24],
                                         bank45_data_opc1[22], bank45_data_opc1[20], bank45_data_opc1[18], bank45_data_opc1[16],
                                         bank45_data_opc1[14], bank45_data_opc1[12], bank45_data_opc1[10], bank45_data_opc1[ 8],
                                         bank45_data_opc1[ 6], bank45_data_opc1[ 4], bank45_data_opc1[ 2], bank45_data_opc1[ 0]
                                         };

   assign bank67_data_opc1_rw[63:0] = {
                                         bank67_data_opc1[63], bank67_data_opc1[61], bank67_data_opc1[59], bank67_data_opc1[57],
                                         bank67_data_opc1[55], bank67_data_opc1[53], bank67_data_opc1[51], bank67_data_opc1[49],
                                         bank67_data_opc1[47], bank67_data_opc1[45], bank67_data_opc1[43], bank67_data_opc1[41],
                                         bank67_data_opc1[39], bank67_data_opc1[37], bank67_data_opc1[35], bank67_data_opc1[33],

                                         bank67_data_opc1[62], bank67_data_opc1[60], bank67_data_opc1[58], bank67_data_opc1[56],
                                         bank67_data_opc1[54], bank67_data_opc1[52], bank67_data_opc1[50], bank67_data_opc1[48],
                                         bank67_data_opc1[46], bank67_data_opc1[44], bank67_data_opc1[42], bank67_data_opc1[40],
                                         bank67_data_opc1[38], bank67_data_opc1[36], bank67_data_opc1[34], bank67_data_opc1[32],

                                         bank67_data_opc1[31], bank67_data_opc1[29], bank67_data_opc1[27], bank67_data_opc1[25],
                                         bank67_data_opc1[23], bank67_data_opc1[21], bank67_data_opc1[19], bank67_data_opc1[17],
                                         bank67_data_opc1[15], bank67_data_opc1[13], bank67_data_opc1[11], bank67_data_opc1[ 9],
                                         bank67_data_opc1[ 7], bank67_data_opc1[ 5], bank67_data_opc1[ 3], bank67_data_opc1[ 1],

                                         bank67_data_opc1[30], bank67_data_opc1[28], bank67_data_opc1[26], bank67_data_opc1[24],
                                         bank67_data_opc1[22], bank67_data_opc1[20], bank67_data_opc1[18], bank67_data_opc1[16],
                                         bank67_data_opc1[14], bank67_data_opc1[12], bank67_data_opc1[10], bank67_data_opc1[ 8],
                                         bank67_data_opc1[ 6], bank67_data_opc1[ 4], bank67_data_opc1[ 2], bank67_data_opc1[ 0]
                                         };
   // level 2 -- opc1 stage


   //bank01 parity
   sio_opdc_dp_prty_macro__width_16 prty_bank01_parity3  (
	.din  (bank01_data_opc1_rw[63:48]),
	.dout (bank01_parity_opc1_pre[3])
        );
					     
   sio_opdc_dp_prty_macro__width_16 prty_bank01_parity2  (
	.din  (bank01_data_opc1_rw[47:32]),
	.dout (bank01_parity_opc1_pre[2])
        );
					     
   sio_opdc_dp_prty_macro__width_16 prty_bank01_parity1  (
	.din  (bank01_data_opc1_rw[31:16]),
	.dout (bank01_parity_opc1_pre[1])
        );
					     
   sio_opdc_dp_prty_macro__width_16 prty_bank01_parity0  (
	.din  (bank01_data_opc1_rw[15:0]),
	.dout (bank01_parity_opc1_pre[0])
        );
					     
   //bank23 parity
   sio_opdc_dp_prty_macro__width_16 prty_bank23_parity3  (
	.din  (bank23_data_opc1_rw[63:48]),
	.dout (bank23_parity_opc1_pre[3])
        );
					     
   sio_opdc_dp_prty_macro__width_16 prty_bank23_parity2  (
	.din  (bank23_data_opc1_rw[47:32]),
	.dout (bank23_parity_opc1_pre[2])
        );
					     
   sio_opdc_dp_prty_macro__width_16 prty_bank23_parity1  (
	.din  (bank23_data_opc1_rw[31:16]),
	.dout (bank23_parity_opc1_pre[1])
        );
					     
   sio_opdc_dp_prty_macro__width_16 prty_bank23_parity0  (
	.din  (bank23_data_opc1_rw[15:0]),
	.dout (bank23_parity_opc1_pre[0])
        );
					     
   //bank45 parity
   sio_opdc_dp_prty_macro__width_16 prty_bank45_parity3  (
	.din  (bank45_data_opc1_rw[63:48]),
	.dout (bank45_parity_opc1_pre[3])
        );
					     
   sio_opdc_dp_prty_macro__width_16 prty_bank45_parity2  (
	.din  (bank45_data_opc1_rw[47:32]),
	.dout (bank45_parity_opc1_pre[2])
        );
					     
   sio_opdc_dp_prty_macro__width_16 prty_bank45_parity1  (
	.din  (bank45_data_opc1_rw[31:16]),
	.dout (bank45_parity_opc1_pre[1])
        );
					     
   sio_opdc_dp_prty_macro__width_16 prty_bank45_parity0  (
	.din  (bank45_data_opc1_rw[15:0]),
	.dout (bank45_parity_opc1_pre[0])
        );
					     
   //bank67 parity
   sio_opdc_dp_prty_macro__width_16 prty_bank67_parity3  (
	.din  (bank67_data_opc1_rw[63:48]),
	.dout (bank67_parity_opc1_pre[3])
        );
					     
   sio_opdc_dp_prty_macro__width_16 prty_bank67_parity2  (
	.din  (bank67_data_opc1_rw[47:32]),
	.dout (bank67_parity_opc1_pre[2])
        );
					     
   sio_opdc_dp_prty_macro__width_16 prty_bank67_parity1  (
	.din  (bank67_data_opc1_rw[31:16]),
	.dout (bank67_parity_opc1_pre[1])
        );
					     
   sio_opdc_dp_prty_macro__width_16 prty_bank67_parity0  (
	.din  (bank67_data_opc1_rw[15:0]),
	.dout (bank67_parity_opc1_pre[0])
        );

//-----------------------------------------------------------------------------------				 
//	Parity bits flip for ue error	
//-----------------------------------------------------------------------------------				 
   sio_opdc_dp_xor_macro__width_4 bank01_parity_ue  (
	.din0 (bank01_parity_opc1_pre[3:0]),
	.din1 ({4{bank01_data_opc1[64]}}),
	.dout (bank01_parity_opc1[3:0])
	);
	
   sio_opdc_dp_xor_macro__width_4 bank23_parity_ue  (
	.din0 (bank23_parity_opc1_pre[3:0]),
	.din1 ({4{bank23_data_opc1[64]}}),
	.dout (bank23_parity_opc1[3:0])
	);
	
   sio_opdc_dp_xor_macro__width_4 bank45_parity_ue  (
	.din0 (bank45_parity_opc1_pre[3:0]),
	.din1 ({4{bank45_data_opc1[64]}}),
	.dout (bank45_parity_opc1[3:0])
	);
	
   sio_opdc_dp_xor_macro__width_4 bank67_parity_ue  (
	.din0 (bank67_parity_opc1_pre[3:0]),
	.din1 ({4{bank67_data_opc1[64]}}),
	.dout (bank67_parity_opc1[3:0])
	);
	
   assign bank_parity_opc1[7:4] = bank_parity_opc1[3:0];

   sio_opdc_dp_mux_macro__mux_pgpe__ports_2__stack_64c__width_64  mx21_bankleft_data     (
	.dout (bankleft_data_opc1[63:0]),
	.din0 (bank01_data_opc1[63:0]),
	.din1 (bank23_data_opc1[63:0]),
	.sel0 (opcc_opdc_gnt01_opc1)
	);
								 
   sio_opdc_dp_mux_macro__mux_pgpe__ports_2__stack_64c__width_64  mx21_bankright_data     (
	.dout (bankright_data_opc1[63:0]),
	.din0 (bank45_data_opc1[63:0]),
	.din1 (bank67_data_opc1[63:0]),
	.sel0 (opcc_opdc_gnt45_opc1)
	);
//-----------------------------------------------------------------------------------				 
//	Timing fix to combine bankright_parity , bankleft_parity and bankparity muxes
//-----------------------------------------------------------------------------------				 
//  mux_macro  mx21_bankleft_parity (width=4, stack=4c, mux=pgpe, ports=2) (
//	.dout (bankleft_parity_opc1[3:0]),
//	.din0 (bank01_parity_opc1[3:0]),
//	.din1 (bank23_parity_opc1[3:0]),
//	.sel0 (opcc_opdc_gnt01_opc1)
//	);
								 
//   mux_macro  mx21_bankright_parity (width=4, stack=4c, mux=pgpe, ports=2) (
//	.dout (bankright_parity_opc1[3:0]),
//	.din0 (bank45_parity_opc1[3:0]),
//	.din1 (bank67_parity_opc1[3:0]),
//	.sel0 (opcc_opdc_gnt45_opc1)
//	);
								 
//   mux_macro  mx21_bank_parity (width=4, stack=4c, mux=pgpe, ports=2) (
//	.dout (bank_parity_opc1[3:0]),
//	.din0 (bankleft_parity_opc1[3:0]),
//	.din1 (bankright_parity_opc1[3:0]),
//	.sel0 (opcc_opdc_gnt0123_opc1)
//	);

   sio_opdc_dp_mux_macro__mux_pgnpe__ports_4__stack_4c__width_4  mx21_bank_parity     (
	.dout (bank_parity_opc1[3:0]),
	.din3 (bank01_parity_opc1[3:0]),
	.din2 (bank23_parity_opc1[3:0]),
	.din1 (bank45_parity_opc1[3:0]),
	.din0 (bank67_parity_opc1[3:0]),
	.sel3 (sel_bank_parity[3]),
	.sel2 (sel_bank_parity[2]),
	.sel1 (sel_bank_parity[1]),
	.sel0 (sel_bank_parity[0]),
  .muxtst(muxtst)
	);

sio_opdc_dp_inv_macro__width_3 inv_sel_bank_parity   
                        (
                        .din ({opcc_opdc_gnt01_opc1, opcc_opdc_gnt45_opc1, opcc_opdc_gnt0123_opc1}),
                        .dout ({not_opcc_opdc_gnt01_opc1, not_opcc_opdc_gnt45_opc1, 
				not_opcc_opdc_gnt0123_opc1})
                        );

sio_opdc_dp_and_macro__left_0__ports_2__stack_4r__width_4 and_left_right_4567     
                        (
                        .din0 ({opcc_opdc_gnt0123_opc1,opcc_opdc_gnt0123_opc1,
				not_opcc_opdc_gnt0123_opc1, not_opcc_opdc_gnt0123_opc1}),
                        .din1 ({opcc_opdc_gnt01_opc1, not_opcc_opdc_gnt01_opc1,
				opcc_opdc_gnt45_opc1, not_opcc_opdc_gnt45_opc1}),
                        .dout (sel_bank_parity[3:0])
                        );




//-----------------------------------------------------------------------------------				 
//	End - Timing fix to combine bankright_parity , bankleft_parity and bankparity muxes
//-----------------------------------------------------------------------------------				 

   // level 3 -- opc1 stage
   sio_opdc_dp_mux_macro__mux_pgpe__ports_2__stack_64c__width_64  mx21_bank_data     (
	.dout (bank_data_opc1[63:0]),
	.din0 (bankleft_data_opc1[63:0]),
	.din1 (bankright_data_opc1[63:0]),
	.sel0 (opcc_opdc_gnt0123_opc1)
	);
								 
   // for mb1 

    sio_opdc_dp_mux_macro__dmux_8x__mux_pgpe__ports_2__stack_72c__width_72  mx21_mb1bank_dataparity      (
       .dout ({opdc_mb1bank_data_opc1[63:0], opdc_mb1bank_parity_opc1[7:0]}),
       .din0 ({9{sio_mb1_wdata[7:0]}}),
       .din1 ({bank_data_opc1[63:0], bank_parity_opc1[7:0]}),
	.sel0 (sio_mb1_run)
	);

   // for mb1 -- 2:1 mux of opcc_x or mb1_x -> opdc_x
   // width = 38 = 2x19 = 2x (3 (wr_ens) + 12 (dqx_wr_addr) + 4 (hq_wr_addr))
   // 
   sio_opdc_dp_mux_macro__mux_aope__ports_2__stack_38c__width_38  mx21_mbist_write_controls     (
	.dout ({opdc_opddq00_wr_addr[5:0], opdc_opddq01_wr_addr[5:0], opdc_opdhq0_wr_addr[3:0],
		opdc_opddq00_wr_en, opdc_opddq01_wr_en, opdc_opdhq0_wr_en, 
		opdc_opddq10_wr_addr[5:0], opdc_opddq11_wr_addr[5:0], opdc_opdhq1_wr_addr[3:0],
		opdc_opddq10_wr_en, opdc_opddq11_wr_en, opdc_opdhq1_wr_en}),

	.din0 ({sio_mb1_addr[5:0], sio_mb1_addr[5:0], sio_mb1_addr[3:0],
		sio_mb1_opddq00_wr_en, sio_mb1_opddq01_wr_en, sio_mb1_opdhq0_wr_en,
		sio_mb1_addr[5:0], sio_mb1_addr[5:0], sio_mb1_addr[3:0],
		sio_mb1_opddq10_wr_en, sio_mb1_opddq11_wr_en, sio_mb1_opdhq1_wr_en}),

	.din1 ({opcc_opddq00_wr_addr[5:0], opcc_opddq01_wr_addr[5:0], opcc_opdhq0_wr_addr[3:0],
		opcc_opddq00_wr_en, opcc_opddq01_wr_en, opcc_opdhq0_wr_en,
		opcc_opddq10_wr_addr[5:0], opcc_opddq11_wr_addr[5:0], opcc_opdhq1_wr_addr[3:0],
		opcc_opddq10_wr_en, opcc_opddq11_wr_en, opcc_opdhq1_wr_en}),
										  
	.sel0 (sio_mb1_run)
	);


// fixscan start:
assign dff_mbist0145_data_h_scanin = scan_in                  ;
assign dff_mbist0145_data_l_scanin = dff_mbist0145_data_h_scanout;
assign dff_mbist2367_data_h_scanin = dff_mbist0145_data_l_scanout;
assign dff_mbist2367_data_l_scanin = dff_mbist2367_data_h_scanout;
assign dff_bank01_data_opc1_h_scanin = dff_mbist2367_data_l_scanout;
assign dff_bank01_data_opc1_l_scanin = dff_bank01_data_opc1_h_scanout;
assign dff_bank23_data_opc1_h_scanin = dff_bank01_data_opc1_l_scanout;
assign dff_bank23_data_opc1_l_scanin = dff_bank23_data_opc1_h_scanout;
assign dff_bank45_data_opc1_h_scanin = dff_bank23_data_opc1_l_scanout;
assign dff_bank45_data_opc1_l_scanin = dff_bank45_data_opc1_h_scanout;
assign dff_bank67_data_opc1_h_scanin = dff_bank45_data_opc1_l_scanout;
assign dff_bank67_data_opc1_l_scanin = dff_bank67_data_opc1_h_scanout;
assign scan_out                  = dff_bank67_data_opc1_l_scanout;
// fixscan end:
endmodule // sio_opdc_dp


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sio_opdc_dp_mux_macro__mux_pgpe__ports_2__stack_66c__width_66 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [65:0] din0;
  input [65:0] din1;
  input sel0;
  output [65:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(66)  d0_0 (
  .sel(psel1),
  .in0(din0[65:0]),
  .in1(din1[65:0]),
.dout(dout[65:0])
);









  



endmodule


//
//   buff macro
//
//





module sio_opdc_dp_buff_macro__minbuff_1__stack_2l__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






buff #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);








endmodule





//
//   buff macro
//
//





module sio_opdc_dp_buff_macro__minbuff_1__stack_12l__width_12 (
  din, 
  dout);
  input [11:0] din;
  output [11:0] dout;






buff #(12)  d0_0 (
.in(din[11:0]),
.out(dout[11:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sio_opdc_dp_mux_macro__dmux_16x__mux_pgpe__ports_2__stack_68c__width_68 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [67:0] din0;
  input [67:0] din1;
  input sel0;
  output [67:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(68)  d0_0 (
  .sel(psel1),
  .in0(din0[67:0]),
  .in1(din1[67:0]),
.dout(dout[67:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module sio_opdc_dp_msff_macro__stack_34l__width_34 (
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
wire [32:0] so;

  input [33:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [33:0] dout;


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
dff #(34)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[33:0]),
.si({scan_in,so[32:0]}),
.so({so[32:0],scan_out}),
.q(dout[33:0])
);




















endmodule









//
//   buff macro
//
//





module sio_opdc_dp_buff_macro__minbuff_1__stack_10l__width_10 (
  din, 
  dout);
  input [9:0] din;
  output [9:0] dout;






buff #(10)  d0_0 (
.in(din[9:0]),
.out(dout[9:0])
);








endmodule









// any PARAMS parms go into naming of macro

module sio_opdc_dp_msff_macro__stack_32l__width_32 (
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
wire [30:0] so;

  input [31:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [31:0] dout;


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
dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);




















endmodule









//
//   buff macro
//
//





module sio_opdc_dp_buff_macro__minbuff_1__stack_6l__width_6 (
  din, 
  dout);
  input [5:0] din;
  output [5:0] dout;






buff #(6)  d0_0 (
.in(din[5:0]),
.out(dout[5:0])
);








endmodule





//
//   buff macro
//
//





module sio_opdc_dp_buff_macro__minbuff_1__stack_18l__width_18 (
  din, 
  dout);
  input [17:0] din;
  output [17:0] dout;






buff #(18)  d0_0 (
.in(din[17:0]),
.out(dout[17:0])
);








endmodule





//
//   parity macro (even parity)
//
//





module sio_opdc_dp_prty_macro__width_16 (
  din, 
  dout);
  input [15:0] din;
  output dout;







prty #(16)  m0_0 (
.in(din[15:0]),
.out(dout)
);










endmodule





//
//   xor macro for ports = 2,3
//
//





module sio_opdc_dp_xor_macro__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;





xor2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sio_opdc_dp_mux_macro__mux_pgpe__ports_2__stack_64c__width_64 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [63:0] din0;
  input [63:0] din1;
  input sel0;
  output [63:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(64)  d0_0 (
  .sel(psel1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(dout[63:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sio_opdc_dp_mux_macro__mux_pgnpe__ports_4__stack_4c__width_4 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  muxtst, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;

  input [3:0] din0;
  input sel0;
  input [3:0] din1;
  input sel1;
  input [3:0] din2;
  input sel2;
  input [3:0] din3;
  input sel3;
  input muxtst;
  output [3:0] dout;





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
mux4 #(4)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[3:0]),
  .in1(din1[3:0]),
  .in2(din2[3:0]),
  .in3(din3[3:0]),
.dout(dout[3:0]),
  .muxtst(muxtst)
);









  



endmodule


//
//   invert macro
//
//





module sio_opdc_dp_inv_macro__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






inv #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module sio_opdc_dp_and_macro__left_0__ports_2__stack_4r__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






and2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sio_opdc_dp_mux_macro__dmux_8x__mux_pgpe__ports_2__stack_72c__width_72 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [71:0] din0;
  input [71:0] din1;
  input sel0;
  output [71:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(72)  d0_0 (
  .sel(psel1),
  .in0(din0[71:0]),
  .in1(din1[71:0]),
.dout(dout[71:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module sio_opdc_dp_mux_macro__mux_aope__ports_2__stack_38c__width_38 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [37:0] din0;
  input [37:0] din1;
  input sel0;
  output [37:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(38)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[37:0]),
  .in1(din1[37:0]),
.dout(dout[37:0])
);









  



endmodule

