// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_l2t_sp_28kb_cust.v
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
`define L2T_ARR_D_WIDTH            28
`define L2T_ARR_DEPTH              512
`define WAY_HIT_WIDTH              16
`define BADREAD                	   BADBADD 



module n2_l2t_sp_28kb_cust (
  scan_in, 
  scan_out, 
  tcu_scan_en0, 
  tcu_scan_en1, 
  l2t_bist_en0, 
  l2t_bist_en1, 
  bist_index0, 
  bist_index1, 
  bist_rd_en0, 
  bist_rd_en1, 
  bist_way, 
  bist_wr_en0, 
  bist_wr_en1, 
  bist_wrdata0, 
  bist_wrdata1, 
  tcu_clk_stop, 
  index0, 
  index1, 
  l2clk, 
  lkup_tag0, 
  lkup_tag1, 
  pce, 
  tcu_pce_ov, 
  rd_en0, 
  rd_en1, 
  hdr_l2t_rvalue, 
  hdr_l2t_rid, 
  hdr_l2t_wr_en, 
  hdr_l2t_red_clr, 
  tcu_se_scancollar_in0, 
  tcu_se_scancollar_in1, 
  tcu_se_scancollar_out0, 
  tcu_se_scancollar_out1, 
  tcu_aclk0, 
  tcu_aclk1, 
  tcu_bclk0, 
  tcu_bclk1, 
  w_inhibit0, 
  w_inhibit1, 
  way, 
  wr_en0, 
  wr_en1, 
  wrdata0, 
  wrdata1, 
  vnw_ary, 
  l2t_hdr_read_data, 
  tag_way0, 
  tag_way1, 
  tag_way2, 
  tag_way3, 
  tag_way4, 
  tag_way5, 
  tag_way6, 
  tag_way7, 
  tag_way8, 
  tag_way9, 
  tag_way10, 
  tag_way11, 
  tag_way12, 
  tag_way13, 
  tag_way14, 
  tag_way15, 
  way_hit, 
  wr_en_ov, 
  clk_en0, 
  clk_en1, 
  clk_en_ov);
wire l1clk_in;
wire l1clk_out;
wire pce_unused;
wire stop_unused;
wire siclk;
wire soclk;
wire scan_en2;
wire scan_en0;
wire scan_en3;
wire scan_en1;
wire [3:0] way_hit3;
wire [3:0] way_hit2;
wire [3:0] way_hit1;
wire [3:0] way_hit0;
wire [27:0] tag_way0_0;
wire [27:0] tag_way1_0;
wire [27:0] tag_way2_0;
wire [27:0] tag_way3_0;
wire [27:0] tag_way0_1;
wire [27:0] tag_way1_1;
wire [27:0] tag_way2_1;
wire [27:0] tag_way3_1;
wire [27:0] tag_way0_2;
wire [27:0] tag_way1_2;
wire [27:0] tag_way2_2;
wire [27:0] tag_way3_2;
wire [27:0] tag_way0_3;
wire [27:0] tag_way1_3;
wire [27:0] tag_way2_3;
wire [27:0] tag_way3_3;
wire [4:0] red_d_quad_2_0;
wire [4:0] req_d_quad0;
wire [4:0] req_d_quad1;
wire [4:0] req_d_quad2;
wire [5:0] red_data;
wire [4:0] req_d_quad3;
wire red_data_tmp0;
wire red_data_tmp1;
wire [1:0] req_en_quad2_0;
wire [1:0] req_en_quad3;
wire [1:0] req_en_quad0;
wire [1:0] req_en_quad1;
wire [1:0] req_en_quad2;
wire [8:0] tag_index1;
wire [8:0] tag_index0;
wire [8:0] index_3;
wire [8:0] index_1;
wire [8:0] index_2;
wire [8:0] index_0;
wire [15:0] wrway;
wire [3:0] way3;
wire [3:0] way2;
wire [3:0] way1;
wire [3:0] way0;
wire [27:0] din1_v1;
wire [27:0] din0_v1;
wire [27:0] din3;
wire [27:0] din2;
wire [27:0] din1;
wire [27:0] din0;
wire rd_en_a3_tmp;
wire not_l2t_bist_en1;
wire not_bist_wr_en1;
wire rd_en_a3;
wire rd_en_a1_tmp;
wire rd_en_a1;
wire rd_en_a2_tmp;
wire not_l2t_bist_en0;
wire not_bist_wr_en0;
wire rd_en_a2;
wire rd_en_a0_tmp;
wire rd_en_a0;
wire wr_en_a2_tmp;
wire not_bist_rd_en0;
wire wr_en_a2;
wire wr_en_a0_tmp;
wire wr_en_a0;
wire wr_en_a3_tmp;
wire not_bist_rd_en1;
wire wr_en_a3;
wire wr_en_a1_tmp;
wire wr_en_a1;
wire [27:1] lkup_tag_3;
wire [27:1] lkup_tag_1;
wire [27:1] lkup_tag_2;
wire [27:1] lkup_tag_0;
wire rd_en;
wire pce_out_a3;
wire rd_en_r;
wire clk_en_ov_r;
wire pce_out_a1;
wire pce_out_a2;
wire pce_out_a0;
wire pce_ctl_a3;
wire pce_ctl_a1;
wire pce_ctl_a2;
wire pce_ctl_a0;
wire pce_din_a3;
wire wr_en_ov_r;
wire pce_din_a1;
wire pce_din_a2;
wire pce_din_a0;
wire pce_ov_a3;
wire pce_ov_a1;
wire pce_ov_a2;
wire pce_ov_a0;
wire [4:0] red_d_in_3;
wire [5:0] hdr_l2t_rvalue_r;
wire [4:0] red_d_in_1;
wire [4:0] red_d_in_2;
wire [4:0] red_d_in_0;
wire [1:0] red_en_in_3;
wire [1:0] red_en_in_1;
wire [1:0] red_en_in_2;
wire [1:0] red_en_in_0;
wire not_w_inhibit0;
wire red_wen_3;
wire hdr_l2t_wr_en_r;
wire red_wen_2;
wire red_wen_1;
wire red_wen_0;
wire and_red_clr_r_w_inhibit0;
wire hdr_l2t_red_clr_r;
wire hdr_l2t_red_clr_r1;
wire [3:0] rid_in_quad3;
wire [3:0] hdr_l2t_rid_r;
wire [3:0] rid_in_quad1;
wire [3:0] rid_in_quad2;
wire [3:0] rid_in_quad0;
wire se_inff3;
wire se_inff1;
wire se_inff2;
wire se_inff0;
wire se_outff3;
wire se_outff1;
wire se_outff2;
wire se_outff0;
wire tcu_aclk_3;
wire tcu_aclk_1;
wire tcu_aclk_2;
wire tcu_aclk_0;
wire tcu_bclk_3;
wire tcu_bclk_1;
wire tcu_bclk_2;
wire tcu_bclk_0;
wire wr_inhibit_a3;
wire wr_inhibit_a1;
wire wr_inhibit_a2;
wire wr_inhibit_a0;
wire quad0_scanout;
wire quad0_scanin;
wire quad1_scanout;
wire quad1_scanin;
wire quad2_scanout;
wire quad2_scanin;
wire quad3_scanout;
wire quad3_scanin;
wire hdr_l2t_rvalue_scanin;
wire hdr_l2t_rvalue_scanout;
wire hdr_l2t_rid_scanin;
wire hdr_l2t_rid_scanout;
wire hdr_l2t_red_clr_scanin;
wire hdr_l2t_red_clr_scanout;
wire hdr_l2t_wr_en_scanin;
wire hdr_l2t_wr_en_scanout;
wire rd_en_scanin;
wire rd_en_scanout;
wire clk_en_ov_scanin;
wire clk_en_ov_scanout;
wire wr_en_ov_scanin;
wire wr_en_ov_scanout;
wire l2t_hdr_read_data_scanin;
wire l2t_hdr_read_data_scanout;


input         scan_in;
output        scan_out;
input         tcu_scan_en0;
input         tcu_scan_en1;
input         l2t_bist_en0;
input         l2t_bist_en1;

//XXinput   arst_l;
input  [8:0] 			bist_index0;
input  [8:0] 			bist_index1;
input   			bist_rd_en0;
input   			bist_rd_en1;
input  [15:0] 			bist_way;
input   			bist_wr_en0;
input   			bist_wr_en1;
input  [7:0] 			bist_wrdata0;
input  [7:0] 			bist_wrdata1;
input   			tcu_clk_stop;
input  [8:0] 			index0;
input  [8:0] 			index1;
input   			l2clk;
input  [27:1] lkup_tag0;
input  [27:1] lkup_tag1;
input   			pce;
input   			tcu_pce_ov;
input   			rd_en0;
input   			rd_en1;
//XXinput  [4:0] 			red_d_in0;
//XXinput  [4:0] 			red_d_in1;
//XXinput  [1:0] 			red_en_in0;
//XXinput  [1:0] 			red_en_in1;
//XXinput  				red_wen0;
//XXinput  				red_wen1;
//XXinput  [3:0] 			rid_in;

input  [5:0] 			hdr_l2t_rvalue;
input  [3:0] 			hdr_l2t_rid;
input  				hdr_l2t_wr_en;
input  				hdr_l2t_red_clr;

input   			tcu_se_scancollar_in0;
input   			tcu_se_scancollar_in1;
input   			tcu_se_scancollar_out0;
input   			tcu_se_scancollar_out1;
input   			tcu_aclk0;
input   			tcu_aclk1;
input   			tcu_bclk0;
input   			tcu_bclk1;
input   			w_inhibit0;
input   			w_inhibit1;
input  [15:0]   way;
input   			wr_en0;
input  				wr_en1;
input  [27:0] 			wrdata0;
input  [27:0] 			wrdata1;

input				vnw_ary;

//XXoutput  [4:0] 			reg_d_out;

output  [5:0] 			l2t_hdr_read_data;

//output  [1:0] 			reg_en_out;
output  [27:0] tag_way0;
output  [27:0] tag_way1;
output  [27:0] tag_way2;
output  [27:0] tag_way3;
output  [27:0] tag_way4;
output  [27:0] tag_way5;
output  [27:0] tag_way6;
output  [27:0] tag_way7;
output  [27:0] tag_way8;
output  [27:0] tag_way9;
output  [27:0] tag_way10;
output  [27:0] tag_way11;
output  [27:0] tag_way12;
output  [27:0] tag_way13;
output  [27:0] tag_way14;
output  [27:0] tag_way15;
output  [15:0]   way_hit;

// Power save pins

input		wr_en_ov;
input		clk_en0;
input		clk_en1;
input		clk_en_ov;


// JDL 05/17/07
// synopsys translate_off

/////////////////////////////////////////
//	   Clock Header		       //
/////////////////////////////////////////

//INPUT HEADER

n2_l2t_sp_28kb_cust_l1clkhdr_ctl_macro clkgen_in (
        .l2clk  (l2clk),
        .l1en   (1'b1),	
        .pce_ov (1'b1),
        .stop   (1'b0),
	.se 	(tcu_se_scancollar_in0),
        .l1clk  (l1clk_in)
        );


//OUTPUT HEADER
n2_l2t_sp_28kb_cust_l1clkhdr_ctl_macro clkgen_out (
        .l2clk  (l2clk),
        .l1en   (1'b1),	
        .pce_ov (1'b1),
        .stop   (1'b0),
	.se 	(tcu_se_scancollar_out1),
        .l1clk  (l1clk_out)
        );
			     
//assign          pce_ov = tcu_pce_ov;
assign 		pce_unused = pce;
assign          stop_unused = tcu_clk_stop;
//assign          se = tcu_scan_en0;

assign          siclk = tcu_aclk0;
assign          soclk = tcu_bclk0;

assign          scan_en2 = tcu_scan_en0;
assign          scan_en0 = tcu_scan_en0;
assign          scan_en3 = tcu_scan_en1;
assign          scan_en1 = tcu_scan_en1;


//---------------------------------------
//	output signals
//---------------------------------------

assign {way_hit[15:14], way_hit[11:10]}	= way_hit3[3:0];
assign {way_hit[7:6]  , way_hit[3:2]  } = way_hit2[3:0];
assign {way_hit[13:12], way_hit[9:8]  }	= way_hit1[3:0];
assign {way_hit[5:4]  , way_hit[1:0]  }	= way_hit0[3:0];

//quad_00
assign tag_way0[`L2T_ARR_D_WIDTH - 1:0] = tag_way0_0[`L2T_ARR_D_WIDTH - 1:0]; 
assign tag_way1[`L2T_ARR_D_WIDTH - 1:0] = tag_way1_0[`L2T_ARR_D_WIDTH - 1:0]; 
assign tag_way4[`L2T_ARR_D_WIDTH - 1:0] = tag_way2_0[`L2T_ARR_D_WIDTH - 1:0]; 
assign tag_way5[`L2T_ARR_D_WIDTH - 1:0] = tag_way3_0[`L2T_ARR_D_WIDTH - 1:0]; 

//quad_01
assign tag_way8[`L2T_ARR_D_WIDTH - 1:0]  = tag_way0_1[`L2T_ARR_D_WIDTH - 1:0]; 
assign tag_way9[`L2T_ARR_D_WIDTH - 1:0]  = tag_way1_1[`L2T_ARR_D_WIDTH - 1:0]; 
assign tag_way12[`L2T_ARR_D_WIDTH - 1:0] = tag_way2_1[`L2T_ARR_D_WIDTH - 1:0]; 
assign tag_way13[`L2T_ARR_D_WIDTH - 1:0] = tag_way3_1[`L2T_ARR_D_WIDTH - 1:0]; 

//quad_10
assign tag_way2[`L2T_ARR_D_WIDTH - 1:0]  = tag_way0_2[`L2T_ARR_D_WIDTH - 1:0]; 
assign tag_way3[`L2T_ARR_D_WIDTH - 1:0]  = tag_way1_2[`L2T_ARR_D_WIDTH - 1:0]; 
assign tag_way6[`L2T_ARR_D_WIDTH - 1:0]  = tag_way2_2[`L2T_ARR_D_WIDTH - 1:0]; 
assign tag_way7[`L2T_ARR_D_WIDTH - 1:0]  = tag_way3_2[`L2T_ARR_D_WIDTH - 1:0]; 

//quad_11
assign tag_way10[`L2T_ARR_D_WIDTH - 1:0] = tag_way0_3[`L2T_ARR_D_WIDTH - 1:0]; 
assign tag_way11[`L2T_ARR_D_WIDTH - 1:0] = tag_way1_3[`L2T_ARR_D_WIDTH - 1:0]; 
assign tag_way14[`L2T_ARR_D_WIDTH - 1:0] = tag_way2_3[`L2T_ARR_D_WIDTH - 1:0]; 
assign tag_way15[`L2T_ARR_D_WIDTH - 1:0] = tag_way3_3[`L2T_ARR_D_WIDTH - 1:0]; 

// redundancy data signals from four quads are "ored". redundancy enable
// signals are ored and anded together to generate 1 bit enable out signal.
// Change to structural coding CC

//assign red_data[5:1] = (req_d_quad0[4:0] |  req_d_quad2[4:0]) | (req_d_quad1[4:0] | req_d_quad3[4:0]);
n2_l2t_sp_28kb_cust_or_macro__ports_3__width_5 or_req_d_quad2_0  (
        .dout (red_d_quad_2_0[4:0]),
        .din0 (req_d_quad0[4:0]),
        .din1 (req_d_quad1[4:0]),
        .din2 (req_d_quad2[4:0]));

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_5 or_req_d_quad3_0  (
        .dout (red_data[5:1]),
        .din0 (red_d_quad_2_0[4:0]),
        .din1 (req_d_quad3[4:0]));

//assign red_data[0] = ((req_en_quad0[1] || req_en_quad2[1]) || (req_en_quad1[1] || req_en_quad3[1])) &&
//                     ((req_en_quad0[0] || req_en_quad1[0]) || (req_en_quad2[0] || req_en_quad3[0]));

n2_l2t_sp_28kb_cust_and_macro__ports_2__width_1 and_red_0  
	(
	.dout (red_data[0]),
	.din0 (red_data_tmp0),
	.din1 (red_data_tmp1)
	);

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1 or_red_data_0 
	(
        .dout (red_data_tmp0),
        .din0 (req_en_quad2_0[0]),
        .din1 (req_en_quad3[0]));

n2_l2t_sp_28kb_cust_or_macro__ports_3__width_1 or_red_data_2_0 
	(
        .dout (req_en_quad2_0[0]),
        .din0 (req_en_quad0[0]),
        .din1 (req_en_quad1[0]),
        .din2 (req_en_quad2[0]));

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1 or_red_data_1 
	(
        .dout (red_data_tmp1),
        .din0 (req_en_quad2_0[1]),
        .din1 (req_en_quad3[1]));

n2_l2t_sp_28kb_cust_or_macro__ports_3__width_1 or_red_data_2_0_1 
	(
        .dout (req_en_quad2_0[1]),
        .din0 (req_en_quad0[1]),
        .din1 (req_en_quad1[1]),
        .din2 (req_en_quad2[1]));


//---------------------------------------
//	internal signals
//---------------------------------------

// Index and bist_index mux. Muxed output is tag_index.
n2_l2t_sp_28kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_9 mux_index_bist_index1 (
        .dout   (tag_index1[8:0]),
        .din0   (index1[8:0]),
        .din1   (bist_index1[8:0]),
        .sel0   (~l2t_bist_en1),
        .sel1   (l2t_bist_en1));

n2_l2t_sp_28kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_9 mux_index_bist_index0 (
        .dout   (tag_index0[8:0]),
        .din0   (index0[8:0]),
        .din1   (bist_index0[8:0]),
        .sel0   (~l2t_bist_en0),
        .sel1   (l2t_bist_en0));

assign index_3[8:0] = tag_index1[8:0];
assign index_1[8:0] = tag_index1[8:0];
assign index_2[8:0] = tag_index0[8:0];
assign index_0[8:0] = tag_index0[8:0];

// Way and bist_way mux. Mux output is wrway.

n2_l2t_sp_28kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_8 mux_way_bistway1 (
        .dout   (wrway[15:8]),
        .din0   (way[15:8]),
        .din1   (bist_way[15:8]),
        .sel0   (~l2t_bist_en1),
        .sel1   (l2t_bist_en1));

n2_l2t_sp_28kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_8 mux_way_bistway0 (
        .dout   (wrway[7:0]),
        .din0   (way[7:0]),
        .din1   (bist_way[7:0]),
        .sel0   (~l2t_bist_en0),
        .sel1   (l2t_bist_en0));

assign way3[3:0] = {wrway[15:14],wrway[11:10]};
assign way2[3:0] = {wrway[7:6],wrway[3:2]};
assign way1[3:0] = {wrway[13:12],wrway[9:8]};
assign way0[3:0] = {wrway[5:4],wrway[1:0]};

// wrdata and bist_wrdata mux. Mux output is din0_v1 and din1_v1:

n2_l2t_sp_28kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_28 mux_wrdata_bist_wrdata1  (
        .dout   (din1_v1[`L2T_ARR_D_WIDTH - 1:0]),
        .din0   (wrdata1[`L2T_ARR_D_WIDTH - 1:0]),
        .din1   ({bist_wrdata1[3:0], bist_wrdata1[7:0], bist_wrdata1[7:0], bist_wrdata1[7:0]}),   
        .sel0   (~l2t_bist_en1),
        .sel1   (l2t_bist_en1));

n2_l2t_sp_28kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_28 mux_wrdata_bist_wrdata0  (
        .dout   (din0_v1[`L2T_ARR_D_WIDTH - 1:0]),
        .din0   (wrdata0[`L2T_ARR_D_WIDTH - 1:0]),
        .din1   ({bist_wrdata0[3:0], bist_wrdata0[7:0], bist_wrdata0[7:0], bist_wrdata0[7:0]}),   
        .sel0   (~l2t_bist_en0),
        .sel1   (l2t_bist_en0));

assign din3[`L2T_ARR_D_WIDTH - 1:0] = din1_v1[`L2T_ARR_D_WIDTH - 1:0]; 
assign din2[`L2T_ARR_D_WIDTH - 1:0] = din0_v1[`L2T_ARR_D_WIDTH - 1:0]; 
assign din1[`L2T_ARR_D_WIDTH - 1:0] = din1_v1[`L2T_ARR_D_WIDTH - 1:0]; 
assign din0[`L2T_ARR_D_WIDTH - 1:0] = din0_v1[`L2T_ARR_D_WIDTH - 1:0]; 

// rd_en and wr_en mux. 
// Change to structural coding CC
//assign	rd_en_a3	= ((~l2t_bist_en1) && (~bist_wr_en1)  && rd_en1) || bist_rd_en1;
//assign	rd_en_a1	= ((~l2t_bist_en1) && (~bist_wr_en1)  && rd_en1) || bist_rd_en1;
//assign	rd_en_a2	= ((~l2t_bist_en0) && (~bist_wr_en0)  && rd_en0) || bist_rd_en0;
//assign	rd_en_a0	= ((~l2t_bist_en0) && (~bist_wr_en0)  && rd_en0) || bist_rd_en0;

n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1	and_rd_en_a3 
			(
			.dout (rd_en_a3_tmp),
			.din0 (not_l2t_bist_en1),
			.din1 (not_bist_wr_en1),
			.din2 (rd_en1)
			);

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1	or_rd_en_a3 
			(
			.dout (rd_en_a3),
			.din0 (rd_en_a3_tmp),
			.din1 (bist_rd_en1)
			);

n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1	and_rd_en_a1 
			(
			.dout (rd_en_a1_tmp),
			.din0 (not_l2t_bist_en1),
			.din1 (not_bist_wr_en1),
			.din2 (rd_en1)
			);

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1	or_rd_en_a1 
			(
			.dout (rd_en_a1),
			.din0 (rd_en_a1_tmp),
			.din1 (bist_rd_en1)
			);
//--
n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1	and_rd_en_a2 
			(
			.dout (rd_en_a2_tmp),
			.din0 (not_l2t_bist_en0),
			.din1 (not_bist_wr_en0),
			.din2 (rd_en0)
			);

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1	or_rd_en_a2 
			(
			.dout (rd_en_a2),
			.din0 (rd_en_a2_tmp),
			.din1 (bist_rd_en0)
			);

n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1	and_rd_en_a0 
			(
			.dout (rd_en_a0_tmp),
			.din0 (not_l2t_bist_en0),
			.din1 (not_bist_wr_en0),
			.din2 (rd_en0)
			);

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1	or_rd_en_a0 
			(
			.dout (rd_en_a0),
			.din0 (rd_en_a0_tmp),
			.din1 (bist_rd_en0)
			);

//--
n2_l2t_sp_28kb_cust_inv_macro__width_1       inv_l2t_bist_en1   
                        (
                        .din (l2t_bist_en1),
                        .dout(not_l2t_bist_en1)  
                        );
n2_l2t_sp_28kb_cust_inv_macro__width_1       inv_l2t_bist_en0   
                        (
                        .din (l2t_bist_en0),
                        .dout(not_l2t_bist_en0)  
                        );

n2_l2t_sp_28kb_cust_inv_macro__width_1       inv_bist_wr_en1   
                        (
                        .din (bist_wr_en1),
                        .dout(not_bist_wr_en1)  
                        );
n2_l2t_sp_28kb_cust_inv_macro__width_1       inv_bist_wr_en0   
                        (
                        .din (bist_wr_en0),
                        .dout(not_bist_wr_en0)  
                        );

//assign	wr_en_a3	= ((~l2t_bist_en1) &&(~bist_rd_en1) && wr_en1) || bist_wr_en1;
//assign	wr_en_a1	= ((~l2t_bist_en1) &&(~bist_rd_en1) && wr_en1) || bist_wr_en1;
//assign	wr_en_a2	= ((~l2t_bist_en0) &&(~bist_rd_en0) && wr_en0) || bist_wr_en0;
//assign	wr_en_a0	= ((~l2t_bist_en0) &&(~bist_rd_en0) && wr_en0) || bist_wr_en0;

n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1	and_wr_en_a2 
			(
			.dout (wr_en_a2_tmp),
			.din0 (not_l2t_bist_en0),
			.din1 (not_bist_rd_en0),
			.din2 (wr_en0)
			);

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1	or_wr_en_a2 
			(
			.dout (wr_en_a2),
			.din0 (wr_en_a2_tmp),
			.din1 (bist_wr_en0)
			);

n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1	and_wr_en_a0 
			(
			.dout (wr_en_a0_tmp),
			.din0 (not_l2t_bist_en0),
			.din1 (not_bist_rd_en0),
			.din2 (wr_en0)
			);

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1	or_wr_en_a0 
			(
			.dout (wr_en_a0),
			.din0 (wr_en_a0_tmp),
			.din1 (bist_wr_en0)
			);
//--
n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1	and_wr_en_a3 
			(
			.dout (wr_en_a3_tmp),
			.din0 (not_l2t_bist_en1),
			.din1 (not_bist_rd_en1),
			.din2 (wr_en1)
			);

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1	or_wr_en_a3 
			(
			.dout (wr_en_a3),
			.din0 (wr_en_a3_tmp),
			.din1 (bist_wr_en1)
			);

n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1	and_wr_en_a1 
			(
			.dout (wr_en_a1_tmp),
			.din0 (not_l2t_bist_en1),
			.din1 (not_bist_rd_en1),
			.din2 (wr_en1)
			);

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1	or_wr_en_a1 
			(
			.dout (wr_en_a1),
			.din0 (wr_en_a1_tmp),
			.din1 (bist_wr_en1)
			);
//--
n2_l2t_sp_28kb_cust_inv_macro__width_1       inv_bist_rd_en1   
                        (
                        .din (bist_rd_en1),
                        .dout(not_bist_rd_en1)  
                        );
n2_l2t_sp_28kb_cust_inv_macro__width_1       inv_bist_rd_en0   
                        (
                        .din (bist_rd_en0),
                        .dout(not_bist_rd_en0)  
                        );

// lkup_tag distribution to different quads

assign lkup_tag_3[`L2T_ARR_D_WIDTH - 1:1] 	= lkup_tag1[`L2T_ARR_D_WIDTH - 1:1]; 
assign lkup_tag_1[`L2T_ARR_D_WIDTH - 1:1] 	= lkup_tag1[`L2T_ARR_D_WIDTH - 1:1]; 
assign lkup_tag_2[`L2T_ARR_D_WIDTH - 1:1] 	= lkup_tag0[`L2T_ARR_D_WIDTH - 1:1]; 
assign lkup_tag_0[`L2T_ARR_D_WIDTH - 1:1] 	= lkup_tag0[`L2T_ARR_D_WIDTH - 1:1]; 

//---------------------------------------
// Generation of pce signal
//---------------------------------------
// Change to structural coding CC

//assign rd_en = rd_en_a0 || rd_en_a1;

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1 or_rd_en  
(
        .dout (rd_en),
        .din0 (rd_en_a0),
        .din1 (rd_en_a1)
);


//assign pce_out_a3 = rd_en_r || clk_en_ov_r;
//assign pce_out_a1 = rd_en_r || clk_en_ov_r;
//assign pce_out_a2 = rd_en_r || clk_en_ov_r;
//assign pce_out_a0 = rd_en_r || clk_en_ov_r;

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1 or_pce_out_a3  
(
        .dout (pce_out_a3),
        .din0 (rd_en_r),
        .din1 (clk_en_ov_r)
);

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1 or_pce_out_a1  
(
        .dout (pce_out_a1),
        .din0 (rd_en_r),
        .din1 (clk_en_ov_r)
);

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1 or_pce_out_a2  
(
        .dout (pce_out_a2),
        .din0 (rd_en_r),
        .din1 (clk_en_ov_r)
);

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1 or_pce_out_a0  
(
        .dout (pce_out_a0),
        .din0 (rd_en_r),
        .din1 (clk_en_ov_r)
);


//assign pce_ctl_a3 = clk_en1 || clk_en_ov_r;
//assign pce_ctl_a1 = clk_en1 || clk_en_ov_r;
//assign pce_ctl_a2 = clk_en0 || clk_en_ov_r;
//assign pce_ctl_a0 = clk_en0 || clk_en_ov_r;

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1 or_pce_ctl_a3  
(
        .dout (pce_ctl_a3),
        .din0 (clk_en1),
        .din1 (clk_en_ov_r)
);

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1 or_pce_ctl_a1  
(
        .dout (pce_ctl_a1),
        .din0 (clk_en1),
        .din1 (clk_en_ov_r)
);

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1 or_pce_ctl_a2  
(
        .dout (pce_ctl_a2),
        .din0 (clk_en0),
        .din1 (clk_en_ov_r)
);

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1 or_pce_ctl_a0  
(
        .dout (pce_ctl_a0),
        .din0 (clk_en0),
        .din1 (clk_en_ov_r)
);

//assign pce_din_a3 = wr_en_ov_r || bist_wr_en1 || wr_en1;
//assign pce_din_a1 = wr_en_ov_r || bist_wr_en1 || wr_en1;
//assign pce_din_a2 = wr_en_ov_r || bist_wr_en0 || wr_en0;
//assign pce_din_a0 = wr_en_ov_r || bist_wr_en0 || wr_en0;

n2_l2t_sp_28kb_cust_or_macro__ports_3__width_1 or_pce_din_a3  
(
        .dout (pce_din_a3),
        .din0 (wr_en_ov_r),
        .din1 (bist_wr_en1),
        .din2 (wr_en1)
);

n2_l2t_sp_28kb_cust_or_macro__ports_3__width_1 or_pce_din_a1  
(
        .dout (pce_din_a1),
        .din0 (wr_en_ov_r),
        .din1 (bist_wr_en1),
        .din2 (wr_en1)
);

n2_l2t_sp_28kb_cust_or_macro__ports_3__width_1 or_pce_din_a2  
(
        .dout (pce_din_a2),
        .din0 (wr_en_ov_r),
        .din1 (bist_wr_en0),
        .din2 (wr_en0)
);

n2_l2t_sp_28kb_cust_or_macro__ports_3__width_1 or_pce_din_a0  
(
        .dout (pce_din_a0),
        .din0 (wr_en_ov_r),
        .din1 (bist_wr_en0),
        .din2 (wr_en0)
);

assign pce_ov_a3  = tcu_pce_ov;
assign pce_ov_a1  = tcu_pce_ov;
assign pce_ov_a2  = tcu_pce_ov;
assign pce_ov_a0  = tcu_pce_ov;

//---------------------------------------
//	Redundancy section
//---------------------------------------

assign red_d_in_3[4:0]        = hdr_l2t_rvalue_r[5:1];
assign red_d_in_1[4:0]        = hdr_l2t_rvalue_r[5:1];
assign red_d_in_2[4:0]        = hdr_l2t_rvalue_r[5:1];
assign red_d_in_0[4:0]        = hdr_l2t_rvalue_r[5:1];

assign red_en_in_3[1:0]       = {hdr_l2t_rvalue_r[0],hdr_l2t_rvalue_r[0]};
assign red_en_in_1[1:0]       = {hdr_l2t_rvalue_r[0],hdr_l2t_rvalue_r[0]};
assign red_en_in_2[1:0]       = {hdr_l2t_rvalue_r[0],hdr_l2t_rvalue_r[0]};
assign red_en_in_0[1:0]       = {hdr_l2t_rvalue_r[0],hdr_l2t_rvalue_r[0]};

// Input is hdr_l2t_wr_en. Flopped version is hdr_l2t_wr_en_r
// Chane to structural coding CC
// assign red_wen_3 = hdr_l2t_wr_en_r && (~w_inhibit0);
// assign red_wen_1 = hdr_l2t_wr_en_r && (~w_inhibit0);
// assign red_wen_2 = hdr_l2t_wr_en_r && (~w_inhibit0);
// assign red_wen_0 = hdr_l2t_wr_en_r && (~w_inhibit0);

n2_l2t_sp_28kb_cust_inv_macro__width_1 inv_w_inhibit0   
                        (
                        .din (w_inhibit0),
                        .dout(not_w_inhibit0)  
                        );

n2_l2t_sp_28kb_cust_and_macro__ports_2__width_1 and_red_wen_3  
	(
	.dout (red_wen_3),
	.din0 (hdr_l2t_wr_en_r),
	.din1 (not_w_inhibit0)
	);

n2_l2t_sp_28kb_cust_and_macro__ports_2__width_1 and_red_wen_2  
	(
	.dout (red_wen_2),
	.din0 (hdr_l2t_wr_en_r),
	.din1 (not_w_inhibit0)
	);

n2_l2t_sp_28kb_cust_and_macro__ports_2__width_1 and_red_wen_1  
	(
	.dout (red_wen_1),
	.din0 (hdr_l2t_wr_en_r),
	.din1 (not_w_inhibit0)
	);

n2_l2t_sp_28kb_cust_and_macro__ports_2__width_1 and_red_wen_0  
	(
	.dout (red_wen_0),
	.din0 (hdr_l2t_wr_en_r),
	.din1 (not_w_inhibit0)
	);

// Input is hdr_l2t_red_clr, flopped output is hdr_l2t_red_clr_r. 
// assign hdr_l2t_red_clr_r1      = ~(hdr_l2t_red_clr_r && (~w_inhibit0)) ;

n2_l2t_sp_28kb_cust_and_macro__ports_2__width_1 and_hdr_l2t_red_clr_r_w_inhibit0  
	(
	.dout (and_red_clr_r_w_inhibit0),
	.din0 (hdr_l2t_red_clr_r),
	.din1 (not_w_inhibit0)
	);

n2_l2t_sp_28kb_cust_inv_macro__width_1 inv_hdr_l2t_red_clr_r1   
                        (
                        .din (and_red_clr_r_w_inhibit0),
                        .dout(hdr_l2t_red_clr_r1)  
                        );

//Input is hdr_l2t_rid and flopped output is hdr_l2t_rid_r
assign rid_in_quad3[3:0] = { ( hdr_l2t_rid_r[3]), ( hdr_l2t_rid_r[2]), hdr_l2t_rid_r[1:0]};  
assign rid_in_quad1[3:0] = { (~hdr_l2t_rid_r[3]), ( hdr_l2t_rid_r[2]), hdr_l2t_rid_r[1:0]};  
assign rid_in_quad2[3:0] = { ( hdr_l2t_rid_r[3]), (~hdr_l2t_rid_r[2]), hdr_l2t_rid_r[1:0]};  
assign rid_in_quad0[3:0] = { (~hdr_l2t_rid_r[3]), (~hdr_l2t_rid_r[2]), hdr_l2t_rid_r[1:0]};  


//-----------
//dft signals
//-----------

assign se_inff3 	= tcu_se_scancollar_in1;	
assign se_inff1 	= tcu_se_scancollar_in1;	
assign se_inff2 	= tcu_se_scancollar_in0;	
assign se_inff0 	= tcu_se_scancollar_in0;	

assign se_outff3 	= tcu_se_scancollar_out1;	
assign se_outff1 	= tcu_se_scancollar_out1;	
assign se_outff2 	= tcu_se_scancollar_out0;	
assign se_outff0 	= tcu_se_scancollar_out0;	

assign tcu_aclk_3 	= tcu_aclk1;
assign tcu_aclk_1 	= tcu_aclk1;
assign tcu_aclk_2 	= tcu_aclk0;
assign tcu_aclk_0 	= tcu_aclk0;

assign tcu_bclk_3 	= tcu_bclk1;
assign tcu_bclk_1 	= tcu_bclk1;
assign tcu_bclk_2 	= tcu_bclk0;
assign tcu_bclk_0 	= tcu_bclk0;

assign wr_inhibit_a3 	= w_inhibit1;
assign wr_inhibit_a1 	= w_inhibit1;
assign wr_inhibit_a2 	= w_inhibit0;
assign wr_inhibit_a0 	= w_inhibit0;




//---------------------------------------
//	L2T ARRAY INSTANTIATION 
//---------------------------------------
n2_l2t_quad quad0 (/*AUTOINST*/
		   // Outputs
		   .scan_out		(quad0_scanout),	 // Templated
		   .req_d_quad		(req_d_quad0[4 : 0]),	 // Templated
		   .req_en_quad		(req_en_quad0[1 : 0]),	 // Templated
		   .tag_way0		(tag_way0_0[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .tag_way1		(tag_way1_0[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .tag_way2		(tag_way2_0[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .tag_way3		(tag_way3_0[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .way_hit		(way_hit0[3 : 0]),	 // Templated
		   // Inputs
		   .vnw_ary             (vnw_ary),
		   .scan_in		(quad0_scanin),		 // Templated
		   .arst_l		(hdr_l2t_red_clr_r1),	
		   .din			(din0[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .index		(index_0[8 : 0]),	 // Templated
		   .lkup_tag		(lkup_tag_0[`L2T_ARR_D_WIDTH - 1 : 1]), // Templated
		   .l2clk		(l2clk),
		   .pce_ov		(pce_ov_a0),		 // Templated
		   .pce_out		(pce_out_a0),		 // Templated
		   .pce_din		(pce_din_a0),		 // Templated
		   .pce_ctl		(pce_ctl_a0),		 // Templated
		   .rd_en_a		(rd_en_a0),		 // Templated
		   .red_d_in		(red_d_in_0[4 : 0]),	 // Templated
		   .red_en_in		(red_en_in_0[1 : 0]),	 // Templated
		   .red_wen		(red_wen_0),		 // Templated
		   .rid_in		(rid_in_quad0[3:0]),
		   .tcu_aclk		(tcu_aclk_0),		 // Templated
		   .tcu_bclk		(tcu_bclk_0),		 // Templated
		   .se_inff		(se_inff0),		 // Templated
		   .se_outff		(se_outff0),		 // Templated
		   .scan_en		(scan_en0),		 // Templated
		   .way			(way0[3:0]),
		   .wr_en_a		(wr_en_a0),		 // Templated
		   .wr_inhibit_a	(wr_inhibit_a0));	 // Templated

n2_l2t_quad quad1 (/*AUTOINST*/
		   // Outputs
		   .scan_out		(quad1_scanout),	 // Templated
		   .req_d_quad		(req_d_quad1[4 : 0]),	 // Templated
		   .req_en_quad		(req_en_quad1[1 : 0]),	 // Templated
		   .tag_way0		(tag_way0_1[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .tag_way1		(tag_way1_1[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .tag_way2		(tag_way2_1[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .tag_way3		(tag_way3_1[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .way_hit		(way_hit1[3 : 0]),	 // Templated
		   // Inputs
                   .vnw_ary             (vnw_ary),
		   .scan_in		(quad1_scanin),		 // Templated
		   .arst_l		(hdr_l2t_red_clr_r1),	
		   .din			(din1[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .index		(index_1[8 : 0]),	 // Templated
		   .lkup_tag		(lkup_tag_1[`L2T_ARR_D_WIDTH - 1 : 1]), // Templated
		   .l2clk		(l2clk),
		   .pce_ov		(pce_ov_a1),		 // Templated
		   .pce_out		(pce_out_a1),		 // Templated
		   .pce_din		(pce_din_a1),		 // Templated
		   .pce_ctl		(pce_ctl_a1),		 // Templated
		   .rd_en_a		(rd_en_a1),		 // Templated
		   .red_d_in		(red_d_in_1[4 : 0]),	 // Templated
		   .red_en_in		(red_en_in_1[1 : 0]),	 // Templated
		   .red_wen		(red_wen_1),		 // Templated
		   .rid_in		(rid_in_quad1[3:0]),
		   .tcu_aclk		(tcu_aclk_1),		 // Templated
		   .tcu_bclk		(tcu_bclk_1),		 // Templated
		   .se_inff		(se_inff1),		 // Templated
		   .se_outff		(se_outff1),		 // Templated
		   .scan_en		(scan_en1),		 // Templated
		   .way			(way1[3 : 0]),		 // Templated
		   .wr_en_a		(wr_en_a1),		 // Templated
		   .wr_inhibit_a	(wr_inhibit_a1));	 // Templated

n2_l2t_quad quad2 (/*AUTOINST*/
		   // Outputs
		   .scan_out		(quad2_scanout),	 // Templated
		   .req_d_quad		(req_d_quad2[4 : 0]),	 // Templated
		   .req_en_quad		(req_en_quad2[1 : 0]),	 // Templated
		   .tag_way0		(tag_way0_2[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .tag_way1		(tag_way1_2[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .tag_way2		(tag_way2_2[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .tag_way3		(tag_way3_2[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .way_hit		(way_hit2[3 : 0]),	 // Templated
		   // Inputs
                   .vnw_ary             (vnw_ary),
		   .scan_in		(quad2_scanin),		 // Templated
		   .arst_l		(hdr_l2t_red_clr_r1),	
		   .din			(din2[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .index		(index_2[8 : 0]),	 // Templated
		   .lkup_tag		(lkup_tag_2[`L2T_ARR_D_WIDTH - 1 : 1]), // Templated
		   .l2clk		(l2clk),
		   .pce_ov		(pce_ov_a2),		 // Templated
		   .pce_out		(pce_out_a2),		 // Templated
		   .pce_din		(pce_din_a2),		 // Templated
		   .pce_ctl		(pce_ctl_a2),		 // Templated
		   .rd_en_a		(rd_en_a2),		 // Templated
		   .red_d_in		(red_d_in_2[4 : 0]),	 // Templated
		   .red_en_in		(red_en_in_2[1 : 0]),	 // Templated
		   .red_wen		(red_wen_2),		 // Templated
		   .rid_in		(rid_in_quad2[3:0]),
		   .tcu_aclk		(tcu_aclk_2),		 // Templated
		   .tcu_bclk		(tcu_bclk_2),		 // Templated
		   .se_inff		(se_inff2),		 // Templated
		   .se_outff		(se_outff2),		 // Templated
		   .scan_en		(scan_en2),		 // Templated
		   .way			(way2[3 : 0]),		 // Templated
		   .wr_en_a		(wr_en_a2),		 // Templated
		   .wr_inhibit_a	(wr_inhibit_a2));	 // Templated

n2_l2t_quad quad3 (/*AUTOINST*/
		   // Outputs
		   .scan_out		(quad3_scanout),	 // Templated
		   .req_d_quad		(req_d_quad3[4 : 0]),	 // Templated
		   .req_en_quad		(req_en_quad3[1 : 0]),	 // Templated
		   .tag_way0		(tag_way0_3[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .tag_way1		(tag_way1_3[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .tag_way2		(tag_way2_3[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .tag_way3		(tag_way3_3[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .way_hit		(way_hit3[3 : 0]),	 // Templated
		   // Inputs
                   .vnw_ary             (vnw_ary),
		   .scan_in		(quad3_scanin),		 // Templated
		   .arst_l		(hdr_l2t_red_clr_r1),	
		   .din			(din3[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		   .index		(index_3[8 : 0]),	 // Templated
		   .lkup_tag		(lkup_tag_3[`L2T_ARR_D_WIDTH - 1 : 1]), // Templated
		   .l2clk		(l2clk),
		   .pce_ov		(pce_ov_a3),		 // Templated
		   .pce_out		(pce_out_a3),		 // Templated
		   .pce_din		(pce_din_a3),		 // Templated
		   .pce_ctl		(pce_ctl_a3),		 // Templated
		   .rd_en_a		(rd_en_a3),		 // Templated
		   .red_d_in		(red_d_in_3[4 : 0]),	 // Templated
		   .red_en_in		(red_en_in_3[1 : 0]),	 // Templated
		   .red_wen		(red_wen_3),		 // Templated
		   .rid_in		(rid_in_quad3[3:0]),
		   .tcu_aclk		(tcu_aclk_3),		 // Templated
		   .tcu_bclk		(tcu_bclk_3),		 // Templated
		   .se_inff		(se_inff3),		 // Templated
		   .se_outff		(se_outff3),		 // Templated
		   .scan_en		(scan_en3),		 // Templated
		   .way			(way3[3 : 0]),		 // Templated
		   .wr_en_a		(wr_en_a3),		 // Templated
		   .wr_inhibit_a	(wr_inhibit_a3));	 // Templated

//************************************************************************
// 			REGISTERS SECTION
//************************************************************************

//REDUNDANCY INPUTS FLOPS
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_6 ff_hdr_l2t_rvalue        
        (
        .scan_in(hdr_l2t_rvalue_scanin),
        .scan_out(hdr_l2t_rvalue_scanout),
        .l1clk  (l1clk_in),
        .dout   (hdr_l2t_rvalue_r[5:0]),
        .din    (hdr_l2t_rvalue[5:0]),
  .siclk(siclk),
  .soclk(soclk)
        );

n2_l2t_sp_28kb_cust_msff_ctl_macro__width_4 ff_hdr_l2t_rid        
        (
        .scan_in(hdr_l2t_rid_scanin),
        .scan_out(hdr_l2t_rid_scanout),
        .l1clk  (l1clk_in),
        .dout   (hdr_l2t_rid_r[3:0]),
        .din    (hdr_l2t_rid[3:0]),
  .siclk(siclk),
  .soclk(soclk)
        );

n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 ff_hdr_l2t_red_clr        
        (
        .scan_in(hdr_l2t_red_clr_scanin),
        .scan_out(hdr_l2t_red_clr_scanout),
        .l1clk  (l1clk_in),
        .dout   (hdr_l2t_red_clr_r),
        .din    (hdr_l2t_red_clr),
  .siclk(siclk),
  .soclk(soclk)
        );

n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 ff_write_enable	
	(
        .scan_in(hdr_l2t_wr_en_scanin),
        .scan_out(hdr_l2t_wr_en_scanout),
        .dout   (hdr_l2t_wr_en_r),
        .din    (hdr_l2t_wr_en),
        .l1clk  (l1clk_in),
  .siclk(siclk),
  .soclk(soclk)
        );

// POWER SAVING INPUT FLOPS	

// Remove flop for tcu_pce_ov
//msff_ctl_macro ff_pce_ov	(width=1)
//	(
//       .scan_in(1'b1),
//       .scan_out(tcu_pce_ov_scanout),
//       .dout   (pce_ov_r),
//       .din    (tcu_pce_ov),
//       .l1clk  (l1clk_in));

n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 ff_rd_en	
	(
        .scan_in(rd_en_scanin),
        .scan_out(rd_en_scanout),
        .dout   (rd_en_r),
        .din    (rd_en),
        .l1clk  (l1clk_in),
  .siclk(siclk),
  .soclk(soclk)
        );

n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 ff_clk_en_ov	
	(
        .scan_in(clk_en_ov_scanin),
        .scan_out(clk_en_ov_scanout),
        .dout   (clk_en_ov_r),
        .din    (clk_en_ov),
        .l1clk  (l1clk_in),
  .siclk(siclk),
  .soclk(soclk)
        );

n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 ff_ff_wr_en_ov  
	(
        .scan_in(wr_en_ov_scanin),
        .scan_out(wr_en_ov_scanout),
        .dout   (wr_en_ov_r),
        .din    (wr_en_ov),
        .l1clk  (l1clk_in),
  .siclk(siclk),
  .soclk(soclk)
        );

//OUTPUT FLOPS
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_6 ff_l2t_hdr_read_data        
        (
        .scan_in (l2t_hdr_read_data_scanin),
        .scan_out(l2t_hdr_read_data_scanout),
        .dout    (l2t_hdr_read_data[5:0]),
        .din     (red_data[5:0]),
        .l1clk   (l1clk_out),
  .siclk(siclk),
  .soclk(soclk)
        );


// =============== VERILOG-MODE AUTO TEMPLATES

/*

n2_l2t_quad AUTO_TEMPLATE  (	
				.scan_in (quad@_scanin),
				.se_inff(se_inff@),
				.se_outff(se_outff@),
				.scan_en(scan_en@),
                                .din(din@[`L2T_ARR_D_WIDTH - 1 : 0]),
		                .arst_l       (hdr_l2t_red_clr_r1),
                                .index(index_@[8 : 0]),
                                .lkup_tag(lkup_tag@[`L2T_ARR_D_WIDTH - 1 : 1]),
                                .rd_en_a(rd_en_a@),
                                .wr_en_a(wr_en_a@),
                                .way(way@[3 : 0]),
                                .red_d_in(red_d_in_@[4 : 0]),
                                .red_en_in(red_en_in_@[1 : 0]),
                                .red_wen(red_wen_@),
                                .tcu_aclk(tcu_aclk_@),
                                .tcu_bclk(tcu_bclk_@),
				.pce_ov(pce_ov_a@),
				.pce_out(pce_out_a@),
				.pce_din(pce_din_a@),
				.pce_ctl(pce_ctl_a@),
                                .wr_inhibit_a(wr_inhibit_a@),
                                .way_hit(way_hit@[3 : 0]),
                                .tag_way0(tag_way0_@[`L2T_ARR_D_WIDTH - 1 : 0]),
                                .tag_way1(tag_way1_@[`L2T_ARR_D_WIDTH - 1 : 0]),
                                .tag_way2(tag_way2_@[`L2T_ARR_D_WIDTH - 1 : 0]),
                                .tag_way3(tag_way3_@[`L2T_ARR_D_WIDTH - 1 : 0]),
                                .req_d_quad(req_d_quad@[4 : 0]),
                                .req_en_quad(req_en_quad@[1 : 0]),
				.scan_out (quad@_scanout),
                           );

*/
// fixscan start:
assign quad2_scanin              = scan_in                  ;
assign quad0_scanin              = quad2_scanout            ;
assign quad1_scanin              = quad0_scanout            ;
assign quad3_scanin              = quad1_scanout            ;
assign hdr_l2t_rvalue_scanin     = quad3_scanout            ;
assign hdr_l2t_rid_scanin        = hdr_l2t_rvalue_scanout   ;
assign hdr_l2t_wr_en_scanin      = hdr_l2t_rid_scanout      ;
assign hdr_l2t_red_clr_scanin    = hdr_l2t_wr_en_scanout    ;
assign l2t_hdr_read_data_scanin  = hdr_l2t_red_clr_scanout  ;
assign wr_en_ov_scanin           = l2t_hdr_read_data_scanout;
assign clk_en_ov_scanin          = wr_en_ov_scanout         ;
assign rd_en_scanin              = clk_en_ov_scanout        ;
assign scan_out                  = rd_en_scanout            ;
// fixscan end:

// JDL 05/17/07
// synopsys translate_on

endmodule






// any PARAMS parms go into naming of macro

module n2_l2t_sp_28kb_cust_l1clkhdr_ctl_macro (
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









//  
//   or macro for ports = 2,3
//
//





module n2_l2t_sp_28kb_cust_or_macro__ports_3__width_5 (
  din0, 
  din1, 
  din2, 
  dout);
  input [4:0] din0;
  input [4:0] din1;
  input [4:0] din2;
  output [4:0] dout;






or3 #(5)  d0_0 (
.in0(din0[4:0]),
.in1(din1[4:0]),
.in2(din2[4:0]),
.out(dout[4:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module n2_l2t_sp_28kb_cust_or_macro__ports_2__width_5 (
  din0, 
  din1, 
  dout);
  input [4:0] din0;
  input [4:0] din1;
  output [4:0] dout;






or2 #(5)  d0_0 (
.in0(din0[4:0]),
.in1(din1[4:0]),
.out(dout[4:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module n2_l2t_sp_28kb_cust_and_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module n2_l2t_sp_28kb_cust_or_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






or3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module n2_l2t_sp_28kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_9 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [8:0] din0;
  input sel0;
  input [8:0] din1;
  input sel1;
  output [8:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(9)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[8:0]),
  .in1(din1[8:0]),
.dout(dout[8:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module n2_l2t_sp_28kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_8 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [7:0] din0;
  input sel0;
  input [7:0] din1;
  input sel1;
  output [7:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(8)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[7:0]),
  .in1(din1[7:0]),
.dout(dout[7:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module n2_l2t_sp_28kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_28 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [27:0] din0;
  input sel0;
  input [27:0] din1;
  input sel1;
  output [27:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(28)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[27:0]),
  .in1(din1[27:0]),
.dout(dout[27:0])
);









  



endmodule


//  
//   and macro for ports = 2,3,4
//
//





module n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 (
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
//   invert macro
//
//





module n2_l2t_sp_28kb_cust_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule







`define L2T_ARR_D_WIDTH            28
`define L2T_ARR_DEPTH              512
`define WAY_HIT_WIDTH              16
`define BADREAD                	   BADBADD 



module n2_l2t_quad (
  vnw_ary, 
  scan_in, 
  scan_out, 
  arst_l, 
  din, 
  index, 
  lkup_tag, 
  l2clk, 
  pce_ov, 
  pce_out, 
  pce_din, 
  pce_ctl, 
  rd_en_a, 
  red_d_in, 
  red_en_in, 
  red_wen, 
  rid_in, 
  tcu_aclk, 
  tcu_bclk, 
  se_inff, 
  se_outff, 
  scan_en, 
  way, 
  wr_en_a, 
  wr_inhibit_a, 
  req_d_quad, 
  req_en_quad, 
  tag_way0, 
  tag_way1, 
  tag_way2, 
  tag_way3, 
  way_hit);
wire l1clk_din0;
wire l1clk_din1;
wire l1clk_in;
wire se_unused;
wire siclk;
wire soclk;
wire clk_stop;
wire [4:0] reg_d1;
wire [4:0] reg_d0;
wire [1:0] reg_en1;
wire [1:0] reg_en0;
wire [27:0] tag_way0_0;
wire [27:0] tag_way1_0;
wire [27:0] tag_way0_1;
wire [27:0] tag_way1_1;
wire [1:0] way_hit_a1;
wire [1:0] way_hit_a0;
wire [8:0] index_a;
wire [1:0] way_a0;
wire [1:0] way_a1;
wire [4:0] reg_d_in;
wire [1:0] reg_en_in;
wire not_quad_active;
wire quad_active_unused;
wire not_arst_l;
wire [1:0] not_rid_in;
wire rid_rgt1;
wire rid_rgt0;
wire rid_lft1;
wire rid_lft0;
wire rid_rgt1_wen;
wire reg_wen_rgt1;
wire rid_rgt0_wen;
wire reg_wen_rgt0;
wire rid_lft1_wen;
wire reg_wen_lft1;
wire rid_lft0_wen;
wire reg_wen_lft0;
wire bank0_scanout;
wire bank0_scanin;
wire [27:0] din_r;
wire bank1_scanout;
wire bank1_scanin;
wire reg_din_27_scanin;
wire reg_din_27_scanout;
wire reg_din_26_scanin;
wire reg_din_26_scanout;
wire reg_din_25_scanin;
wire reg_din_25_scanout;
wire reg_din_24_scanin;
wire reg_din_24_scanout;
wire reg_din_23_scanin;
wire reg_din_23_scanout;
wire reg_din_22_scanin;
wire reg_din_22_scanout;
wire reg_din_21_scanin;
wire reg_din_21_scanout;
wire reg_din_20_scanin;
wire reg_din_20_scanout;
wire reg_din_19_scanin;
wire reg_din_19_scanout;
wire reg_din_18_scanin;
wire reg_din_18_scanout;
wire reg_din_17_scanin;
wire reg_din_17_scanout;
wire reg_din_16_scanin;
wire reg_din_16_scanout;
wire reg_din_15_scanin;
wire reg_din_15_scanout;
wire reg_din_14_scanin;
wire reg_din_14_scanout;
wire reg_din_13_scanin;
wire reg_din_13_scanout;
wire reg_din_12_scanin;
wire reg_din_12_scanout;
wire reg_din_11_scanin;
wire reg_din_11_scanout;
wire reg_din_10_scanin;
wire reg_din_10_scanout;
wire reg_din_9_scanin;
wire reg_din_9_scanout;
wire reg_din_8_scanin;
wire reg_din_8_scanout;
wire reg_din_7_scanin;
wire reg_din_7_scanout;
wire reg_din_6_scanin;
wire reg_din_6_scanout;
wire reg_din_5_scanin;
wire reg_din_5_scanout;
wire reg_din_4_scanin;
wire reg_din_4_scanout;
wire reg_din_3_scanin;
wire reg_din_3_scanout;
wire reg_din_2_scanin;
wire reg_din_2_scanout;
wire reg_din_1_scanin;
wire reg_din_1_scanout;
wire reg_din_0_scanin;
wire reg_din_0_scanout;


input                           vnw_ary;
input         scan_in;
output        scan_out;

input    			 arst_l;
input   [`L2T_ARR_D_WIDTH - 1:0] din;
input   [8:0]			 index;
input   [`L2T_ARR_D_WIDTH - 1:1] lkup_tag;
input   			 l2clk;
input   			 pce_ov;
input   			 pce_out;
input   			 pce_din;
input   			 pce_ctl;
input   			 rd_en_a;
input   [4:0]			 red_d_in;
input   [1:0]			 red_en_in;
input   			 red_wen;
input   [3:0]			 rid_in;
input   			 tcu_aclk;
input   			 tcu_bclk;
input   			 se_inff;
input   			 se_outff;
input   			 scan_en;
input   [3:0]			 way;
input   			 wr_en_a;
input   			 wr_inhibit_a;

output  [4:0]			 req_d_quad;
output  [1:0]			 req_en_quad;
output  [`L2T_ARR_D_WIDTH - 1:0] tag_way0;
output  [`L2T_ARR_D_WIDTH - 1:0] tag_way1;
output  [`L2T_ARR_D_WIDTH - 1:0] tag_way2;
output  [`L2T_ARR_D_WIDTH - 1:0] tag_way3;
output  [3:0] 			 way_hit;

/////////////////////////////////////////
//         Clock Header                //
/////////////////////////////////////////
			      
// Clk. header for data input flops
//cl_sc1_l1hdr_48x clk_hdr_din (
//        .l2clk  (l2clk),
//        .pce    (pce_din),
//        .pce_ov (pce_ov),
//        .stop   (1'b0),
//        .l1clk  (l1clk_din),
//        .se     (se_inff)
//                              );

n2_l2t_sp_28kb_cust_l1clkhdr_ctl_macro clk_hdr_din0 (
        .l2clk  (l2clk),
        .l1en    (pce_din),
        .pce_ov (pce_ov),
        .stop   (1'b0),
        .l1clk  (l1clk_din0),
        .se     (se_inff)
                              );

n2_l2t_sp_28kb_cust_l1clkhdr_ctl_macro clk_hdr_din1 (
        .l2clk  (l2clk),
        .l1en    (pce_din),
        .pce_ov (pce_ov),
        .stop   (1'b0),
        .l1clk  (l1clk_din1),
        .se     (se_inff)
                              );



// Clk. header for control input flops
//cl_sc1_l1hdr_32x clk_hdr_ctl (
//        .l2clk  (l2clk),
//        .pce    (pce_ctl),
//        .pce_ov (pce_ov),
//        .stop   (1'b0),
//        .l1clk  (l1clk_in),
//        .se     (se_inff)
//                              );

n2_l2t_sp_28kb_cust_l1clkhdr_ctl_macro clk_hdr_ctl (
        .l2clk  (l2clk),
        .l1en    (pce_ctl),
        .pce_ov (pce_ov),
        .stop   (1'b0),
        .l1clk  (l1clk_in),
        .se     (se_inff)
                              );

assign		se_unused    = se_inff;
assign          siclk = tcu_aclk;
assign          soclk = tcu_bclk;
assign		clk_stop   = 1'b0;


//---------------------------------------
//      output signals
//---------------------------------------
// reg_d1/reg_en0 are from top quad. reg_d0/reg_en0 are from bottom quad.

//assign req_d_quad[4:0]  = (reg_d1[4:0]  | reg_d0[4:0]); 
//assign req_en_quad[1:0] = (reg_en1[1:0] | reg_en0[1:0]); 

//Change to structural coding CC
//assign req_d_quad[4]  = (reg_d1[4]  | reg_d0[4]); 
//assign req_d_quad[3]  = (reg_d1[3]  | reg_d0[3]); 
//assign req_d_quad[2]  = (reg_d1[2]  | reg_d0[2]); 
//assign req_d_quad[1]  = (reg_d1[1]  | reg_d0[1]); 
//assign req_d_quad[0]  = (reg_d1[0]  | reg_d0[0]); 

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_5 or_req_d_quad    
                        (
                        .din0 (reg_d1[4:0]),
                        .din1 (reg_d0[4:0]),
                        .dout (req_d_quad[4:0])
                        );

//assign req_en_quad[1] = (reg_en1[1] | reg_en0[1]); 
//assign req_en_quad[0] = (reg_en1[0] | reg_en0[0]); 

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_2 or_req_en_quad    
                        (
                        .din0 (reg_en1[1:0]),
                        .din1 (reg_en0[1:0]),
                        .dout (req_en_quad[1:0])
                        );

assign tag_way0[`L2T_ARR_D_WIDTH - 1:0] = tag_way0_0[`L2T_ARR_D_WIDTH - 1:0];
assign tag_way2[`L2T_ARR_D_WIDTH - 1:0] = tag_way1_0[`L2T_ARR_D_WIDTH - 1:0];
assign tag_way1[`L2T_ARR_D_WIDTH - 1:0] = tag_way0_1[`L2T_ARR_D_WIDTH - 1:0];
assign tag_way3[`L2T_ARR_D_WIDTH - 1:0] = tag_way1_1[`L2T_ARR_D_WIDTH - 1:0];

assign way_hit[3] = way_hit_a1[1];
assign way_hit[2] = way_hit_a0[1];
assign way_hit[1] = way_hit_a1[0];
assign way_hit[0] = way_hit_a0[0];
//---------------------------------------
//      internal signals
//---------------------------------------

assign  index_a[8:0]    = index[8:0];

assign  way_a0[1:0]  	= {way[2], way[0]};
assign  way_a1[1:0]  	= {way[3], way[1]};

//assign   reg_d_in[4:0] = {arst_l, arst_l, arst_l, arst_l, arst_l} & red_d_in[4:0];
n2_l2t_sp_28kb_cust_and_macro__ports_2__width_5 and_reg_d_in    
                        (
                        .din0 ({arst_l,arst_l, arst_l, arst_l, arst_l}),
                        .din1 (red_d_in[4:0]),
                        .dout (reg_d_in[4:0])
                        );

//assign   reg_en_in[1:0]	= {arst_l, arst_l} & red_en_in[1:0];
n2_l2t_sp_28kb_cust_and_macro__ports_2__width_2 and_reg_en_in    
                        (
                        .din0 ({arst_l,arst_l}),
                        .din1 (red_en_in[1:0]),
                        .dout (reg_en_in[1:0])
                        );

// rid_in<3:2> selects one of four quads, and rid_in<1:0> selects one of
// four arrays in a quad.

//assign   quad_active	= ~(rid_in[3] && rid_in[2]) ;
n2_l2t_sp_28kb_cust_and_macro__ports_2__width_1 and_quad_active    
                        (
                        .din0 (rid_in[3]),
                        .din1 (rid_in[2]),
                        .dout (not_quad_active)
                        );

n2_l2t_sp_28kb_cust_inv_macro__width_1 inv_quad_active 
			(
			.din(not_quad_active),	
			.dout(quad_active_unused)
			);

// Bank0 (bottom bank)
//assign   reg_wen_lft0	= quad_active && (rid_in[1:0] == 2'b00) ? red_wen : 1'b0 ;
//assign   reg_wen_rgt0	= quad_active && (rid_in[1:0] == 2'b01) ? red_wen : 1'b0 ;
//assign   rid_rgt0	= quad_active && (rid_in[1:0] == 2'b01) ? 1'b1 : 1'b0;
//assign   rid_lft0	= quad_active && (rid_in[1:0] == 2'b00) ? 1'b1 : 1'b0;
// Bank1 (top bank)
//assign   reg_wen_lft1	= quad_active && (rid_in[1:0] == 2'b10) ? red_wen : 1'b0 ;
//assign   reg_wen_rgt1	= quad_active && (rid_in[1:0] == 2'b11) ? red_wen : 1'b0 ;
//assign   rid_rgt1	= quad_active && (rid_in[1:0] == 2'b11) ? 1'b1 : 1'b0;
//assign   rid_lft1	= quad_active && (rid_in[1:0] == 2'b10) ? 1'b1 : 1'b0;

// rid_in<1:0> selects one of four arrays :
// 	rid_in<1:0> 	= 11 => top, right array
// 	rid_in<1:0> 	= 10 => top, left  array
// 	rid_in<1:0> 	= 01 => bot, right array
// 	rid_in<1:0> 	= 00 => bot, left  array

// Change to structural CC
//assign   rid_rgt1	= !quad_active && ( (rid_in[1]) && ( rid_in[0]));
//assign   rid_lft1	= !quad_active && ( (rid_in[1]) && (!rid_in[0]));
//assign   rid_rgt0	= !quad_active && (!(rid_in[1]) && ( rid_in[0]));
//assign   rid_lft0	= !quad_active && (!(rid_in[1]) && (!rid_in[0]));


n2_l2t_sp_28kb_cust_inv_macro__width_1 inv_arst_l  
                        (
                        .din (arst_l),
                        .dout (not_arst_l)
                        );

n2_l2t_sp_28kb_cust_inv_macro__width_2 inv_rid_in  
                        (
                        .din (rid_in[1:0]),
                        .dout (not_rid_in[1:0])
                        );

n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rid_rgt1    
                        (
                        .din0 (not_quad_active),
                        .din1 (rid_in[0]),
                        .din2 (rid_in[1]),
                        .dout (rid_rgt1)
                        );

n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rid_rgt0    
                        (
                        .din0 (not_quad_active),
                        .din1 (rid_in[0]),
                        .din2 (not_rid_in[1]),
                        .dout (rid_rgt0)
                        );

n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rid_lft1    
                        (
                        .din0 (not_quad_active),
                        .din1 (not_rid_in[0]),
                        .din2 (rid_in[1]),
                        .dout (rid_lft1)
                        );

n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rid_lft0    
                        (
                        .din0 (not_quad_active),
                        .din1 (not_rid_in[0]),
                        .din2 (not_rid_in[1]),
                        .dout (rid_lft0)
                        );

//assign   reg_wen_rgt1	= !arst_l || (rid_rgt1 && red_wen);
//assign   reg_wen_lft1	= !arst_l || (rid_lft1 && red_wen);
//assign   reg_wen_rgt0	= !arst_l || (rid_rgt0 && red_wen);
//assign   reg_wen_lft0	= !arst_l || (rid_lft0 && red_wen);

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1 or_reg_wen_rgt1    
                        (
                        .din0 (rid_rgt1_wen),
                        .din1 (not_arst_l),
                        .dout (reg_wen_rgt1)
                        );

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1 or_reg_wen_rgt0    
                        (
                        .din0 (rid_rgt0_wen),
                        .din1 (not_arst_l),
                        .dout (reg_wen_rgt0)
                        );

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1 or_reg_wen_lft1    
                        (
                        .din0 (rid_lft1_wen),
                        .din1 (not_arst_l),
                        .dout (reg_wen_lft1)
                        );

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1 or_reg_wen_lft0    
                        (
                        .din0 (rid_lft0_wen),
                        .din1 (not_arst_l),
                        .dout (reg_wen_lft0)
                        );

n2_l2t_sp_28kb_cust_and_macro__ports_2__width_1 and_rid_rgt1_wen    
                        (
                        .din0 (rid_rgt1),
                        .din1 (red_wen),
                        .dout (rid_rgt1_wen)
                        );

n2_l2t_sp_28kb_cust_and_macro__ports_2__width_1 and_rid_rgt0_wen    
                        (
                        .din0 (rid_rgt0),
                        .din1 (red_wen),
                        .dout (rid_rgt0_wen)
                        );

n2_l2t_sp_28kb_cust_and_macro__ports_2__width_1 and_rid_lft1_wen    
                        (
                        .din0 (rid_lft1),
                        .din1 (red_wen),
                        .dout (rid_lft1_wen)
                        );

n2_l2t_sp_28kb_cust_and_macro__ports_2__width_1 and_rid_lft0_wen    
                        (
                        .din0 (rid_lft0),
                        .din1 (red_wen),
                        .dout (rid_lft0_wen)
                        );


//---------------------------------------
//      L2T BANKS INSTANTIATION
//---------------------------------------

n2_l2t_bank	bank0( /*AUTOINST*/
		      // Outputs
		      .scan_out		(bank0_scanout),	 // Templated
		      .reg_d		(reg_d0[4:0]),		 // Templated
		      .reg_en		(reg_en0[1:0]),		 // Templated
		      .tag_way0		(tag_way0_0[`L2T_ARR_D_WIDTH - 1:0]), // Templated
		      .tag_way1		(tag_way1_0[`L2T_ARR_D_WIDTH - 1:0]), // Templated
		      .way_hit_a	(way_hit_a0[1:0]),	 // Templated
		      // Inputs
		      .vnw_ary          (vnw_ary),
		      .l1clk_in		(l1clk_in),
		      .scan_in		(bank0_scanin),		 // Templated
		      .clk_stop		(clk_stop),
		      .se_outff		(se_outff),
		      .scan_en		(scan_en),
		      .din		(din_r[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		      .index_a		(index_a[8:0]),
		      .l2clk		(l2clk),
		      .lkuptag_d1	(lkup_tag[`L2T_ARR_D_WIDTH-1:1]), // Templated
		      .pce_out		(pce_out),
		      .pce_ctl		(pce_ctl),
		      .pce_ov		(pce_ov),
		      .rd_en_a		(rd_en_a),
		      .reg_d_in		(reg_d_in[4:0]),
		      .reg_en_in	(reg_en_in[1:0]),
		      .reg_wen_lft	(reg_wen_lft0),		 // Templated
		      .reg_wen_rgt	(reg_wen_rgt0),		 // Templated
		      .rid_lft		(rid_lft0),		 // Templated
		      .rid_rgt		(rid_rgt0),		 // Templated
		      .tcu_aclk		(tcu_aclk),
		      .tcu_bclk		(tcu_bclk),
		      .way_a		(way_a0[1:0]),		 // Templated
		      .wr_en_a		(wr_en_a),
		      .wr_inhibit_a	(wr_inhibit_a));

n2_l2t_bank	bank1( /*AUTOINST*/
		      // Outputs
		      .scan_out		(bank1_scanout),	 // Templated
		      .reg_d		(reg_d1[4:0]),		 // Templated
		      .reg_en		(reg_en1[1:0]),		 // Templated
		      .tag_way0		(tag_way0_1[`L2T_ARR_D_WIDTH - 1:0]), // Templated
		      .tag_way1		(tag_way1_1[`L2T_ARR_D_WIDTH - 1:0]), // Templated
		      .way_hit_a	(way_hit_a1[1:0]),	 // Templated
		      // Inputs
                      .vnw_ary          (vnw_ary),
		      .l1clk_in		(l1clk_in),
		      .scan_in		(bank1_scanin),		 // Templated
		      .clk_stop		(clk_stop),
		      .se_outff		(se_outff),
		      .scan_en		(scan_en),
		      .din		(din_r[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
		      .index_a		(index_a[8:0]),
		      .l2clk		(l2clk),
		      .lkuptag_d1	(lkup_tag[`L2T_ARR_D_WIDTH-1:1]), // Templated
		      .pce_out		(pce_out),
		      .pce_ctl		(pce_ctl),
		      .pce_ov		(pce_ov),
		      .rd_en_a		(rd_en_a),
		      .reg_d_in		(reg_d_in[4:0]),
		      .reg_en_in	(reg_en_in[1:0]),
		      .reg_wen_lft	(reg_wen_lft1),		 // Templated
		      .reg_wen_rgt	(reg_wen_rgt1),		 // Templated
		      .rid_lft		(rid_lft1),		 // Templated
		      .rid_rgt		(rid_rgt1),		 // Templated
		      .tcu_aclk		(tcu_aclk),
		      .tcu_bclk		(tcu_bclk),
		      .way_a		(way_a1[1:0]),		 // Templated
		      .wr_en_a		(wr_en_a),
		      .wr_inhibit_a	(wr_inhibit_a));
//************************************************************************
//                      REGISTERS SECTION
//************************************************************************

n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_27  (.scan_in(reg_din_27_scanin), .scan_out(reg_din_27_scanout),
                                      .dout(din_r[27]), .l1clk(l1clk_din0), .din(din[27]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_26  (.scan_in(reg_din_26_scanin), .scan_out(reg_din_26_scanout),
                                      .dout(din_r[26]), .l1clk(l1clk_din0), .din(din[26]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_25  (.scan_in(reg_din_25_scanin), .scan_out(reg_din_25_scanout),
                                      .dout(din_r[25]), .l1clk(l1clk_din0), .din(din[25]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_24  (.scan_in(reg_din_24_scanin), .scan_out(reg_din_24_scanout),
                                      .dout(din_r[24]), .l1clk(l1clk_din0), .din(din[24]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_23  (.scan_in(reg_din_23_scanin), .scan_out(reg_din_23_scanout),
                                      .dout(din_r[23]), .l1clk(l1clk_din0), .din(din[23]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_22  (.scan_in(reg_din_22_scanin), .scan_out(reg_din_22_scanout),
                                      .dout(din_r[22]), .l1clk(l1clk_din0), .din(din[22]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_21  (.scan_in(reg_din_21_scanin), .scan_out(reg_din_21_scanout),
                                      .dout(din_r[21]), .l1clk(l1clk_din0), .din(din[21]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_20  (.scan_in(reg_din_20_scanin), .scan_out(reg_din_20_scanout),
                                      .dout(din_r[20]), .l1clk(l1clk_din0), .din(din[20]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_19  (.scan_in(reg_din_19_scanin), .scan_out(reg_din_19_scanout),
                                      .dout(din_r[19]), .l1clk(l1clk_din0), .din(din[19]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_18  (.scan_in(reg_din_18_scanin), .scan_out(reg_din_18_scanout),
                                      .dout(din_r[18]), .l1clk(l1clk_din0), .din(din[18]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_17  (.scan_in(reg_din_17_scanin), .scan_out(reg_din_17_scanout),
                                      .dout(din_r[17]), .l1clk(l1clk_din0), .din(din[17]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_16  (.scan_in(reg_din_16_scanin), .scan_out(reg_din_16_scanout),
                                      .dout(din_r[16]), .l1clk(l1clk_din0), .din(din[16]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_15  (.scan_in(reg_din_15_scanin), .scan_out(reg_din_15_scanout),
                                      .dout(din_r[15]), .l1clk(l1clk_din0), .din(din[15]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_14  (.scan_in(reg_din_14_scanin), .scan_out(reg_din_14_scanout),
                                      .dout(din_r[14]), .l1clk(l1clk_din0), .din(din[14]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_13  (.scan_in(reg_din_13_scanin), .scan_out(reg_din_13_scanout),
                                      .dout(din_r[13]), .l1clk(l1clk_din0), .din(din[13]),
  .siclk(siclk),
  .soclk(soclk));

n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_12  (.scan_in(reg_din_12_scanin), .scan_out(reg_din_12_scanout),
                                      .dout(din_r[12]), .l1clk(l1clk_din1), .din(din[12]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_11  (.scan_in(reg_din_11_scanin), .scan_out(reg_din_11_scanout),
                                      .dout(din_r[11]), .l1clk(l1clk_din1), .din(din[11]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_10  (.scan_in(reg_din_10_scanin), .scan_out(reg_din_10_scanout),
                                      .dout(din_r[10]), .l1clk(l1clk_din1), .din(din[10]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_9  (.scan_in(reg_din_9_scanin), .scan_out(reg_din_9_scanout),
                                      .dout(din_r[9]), .l1clk(l1clk_din1), .din(din[9]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_8  (.scan_in(reg_din_8_scanin), .scan_out(reg_din_8_scanout),
                                      .dout(din_r[8]), .l1clk(l1clk_din1), .din(din[8]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_7  (.scan_in(reg_din_7_scanin), .scan_out(reg_din_7_scanout),
                                      .dout(din_r[7]), .l1clk(l1clk_din1), .din(din[7]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_6  (.scan_in(reg_din_6_scanin), .scan_out(reg_din_6_scanout),
                                      .dout(din_r[6]), .l1clk(l1clk_din1), .din(din[6]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_5  (.scan_in(reg_din_5_scanin), .scan_out(reg_din_5_scanout),
                                      .dout(din_r[5]), .l1clk(l1clk_din1), .din(din[5]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_4  (.scan_in(reg_din_4_scanin), .scan_out(reg_din_4_scanout),
                                      .dout(din_r[4]), .l1clk(l1clk_din1), .din(din[4]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_3  (.scan_in(reg_din_3_scanin), .scan_out(reg_din_3_scanout),
                                      .dout(din_r[3]), .l1clk(l1clk_din1), .din(din[3]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_2  (.scan_in(reg_din_2_scanin), .scan_out(reg_din_2_scanout),
                                      .dout(din_r[2]), .l1clk(l1clk_din1), .din(din[2]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_1  (.scan_in(reg_din_1_scanin), .scan_out(reg_din_1_scanout),
                                      .dout(din_r[1]), .l1clk(l1clk_din1), .din(din[1]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1  reg_din_0  (.scan_in(reg_din_0_scanin), .scan_out(reg_din_0_scanout),
                                      .dout(din_r[0]), .l1clk(l1clk_din1), .din(din[0]),
  .siclk(siclk),
  .soclk(soclk));

// =============== VERILOG-MODE AUTO TEMPLATES

/*

n2_l2t_bank AUTO_TEMPLATE  (
                                .din(din_r[`L2T_ARR_D_WIDTH - 1 : 0]),
				.reg_wen_lft (reg_wen_lft@),
				.reg_wen_rgt (reg_wen_rgt@),
				.rid_lft (rid_lft@),
				.rid_rgt (rid_rgt@),
				.way_a (way_a@[1:0]),
				.tcu_pce_ov(pce_ov),
		      		.lkuptag_d1(lkup_tag[`L2T_ARR_D_WIDTH-1:1]),
				.reg_d(reg_d@[4:0]),
				.reg_en(reg_en@[1:0]),
				.tag_way0(tag_way0_@[`L2T_ARR_D_WIDTH - 1:0]),
				.tag_way1(tag_way1_@[`L2T_ARR_D_WIDTH - 1:0]),
				.way_hit_a (way_hit_a@[1:0]),
				.scan_out (bank@_scanout),
				.scan_in (bank@_scanin),
                           );

*/

// Manual scan section
assign bank1_scanin              = scan_in                  ;

assign reg_din_0_scanin          = bank1_scanout            ;
assign reg_din_1_scanin 	 = reg_din_0_scanout        ;
assign reg_din_2_scanin          = reg_din_1_scanout        ; 
assign reg_din_3_scanin 	 = reg_din_2_scanout        ;
assign reg_din_4_scanin          = reg_din_3_scanout        ;
assign reg_din_5_scanin 	 = reg_din_4_scanout        ;
assign reg_din_6_scanin          = reg_din_5_scanout        ;
assign reg_din_7_scanin 	 = reg_din_6_scanout        ;
assign reg_din_8_scanin          = reg_din_7_scanout        ;
assign reg_din_9_scanin 	 = reg_din_8_scanout        ;
assign reg_din_10_scanin         = reg_din_9_scanout        ;
assign reg_din_11_scanin         = reg_din_10_scanout       ;
assign reg_din_12_scanin         = reg_din_11_scanout       ;
assign reg_din_13_scanin         = reg_din_12_scanout       ;
assign reg_din_14_scanin         = reg_din_13_scanout       ;
assign reg_din_15_scanin         = reg_din_14_scanout       ;
assign reg_din_16_scanin         = reg_din_15_scanout       ;
assign reg_din_17_scanin         = reg_din_16_scanout       ;
assign reg_din_18_scanin         = reg_din_17_scanout       ;
assign reg_din_19_scanin         = reg_din_18_scanout       ;
assign reg_din_20_scanin         = reg_din_19_scanout       ;
assign reg_din_21_scanin         = reg_din_20_scanout       ;
assign reg_din_22_scanin         = reg_din_21_scanout       ;
assign reg_din_23_scanin         = reg_din_22_scanout       ;
assign reg_din_24_scanin         = reg_din_23_scanout       ;
assign reg_din_25_scanin         = reg_din_24_scanout       ;
assign reg_din_26_scanin         = reg_din_25_scanout       ;
assign reg_din_27_scanin         = reg_din_26_scanout       ;
assign bank0_scanin              = reg_din_27_scanout       ;
assign scan_out                  = bank0_scanout            ;
endmodule


//  
//   or macro for ports = 2,3
//
//





module n2_l2t_sp_28kb_cust_or_macro__ports_2__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






or2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module n2_l2t_sp_28kb_cust_and_macro__ports_2__width_5 (
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





//  
//   and macro for ports = 2,3,4
//
//





module n2_l2t_sp_28kb_cust_and_macro__ports_2__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






and2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule





//
//   invert macro
//
//





module n2_l2t_sp_28kb_cust_inv_macro__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






inv #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);









endmodule






`define L2T_ARR_D_WIDTH            28
`define L2T_ARR_DEPTH              512
`define WAY_HIT_WIDTH              16
`define BADREAD                	   BADBADD 



module n2_l2t_bank (
  l1clk_in, 
  scan_in, 
  clk_stop, 
  se_outff, 
  scan_en, 
  vnw_ary, 
  scan_out, 
  din, 
  index_a, 
  l2clk, 
  lkuptag_d1, 
  pce_out, 
  pce_ctl, 
  pce_ov, 
  rd_en_a, 
  reg_d_in, 
  reg_en_in, 
  reg_wen_lft, 
  reg_wen_rgt, 
  rid_lft, 
  rid_rgt, 
  tcu_aclk, 
  tcu_bclk, 
  way_a, 
  wr_en_a, 
  wr_inhibit_a, 
  reg_d, 
  reg_en, 
  tag_way0, 
  tag_way1, 
  way_hit_a);
wire l1clk_int_v1;
wire l1clk_int_v2;
wire l1clk_out0;
wire l1clk_out1;
wire se_unused;
wire siclk;
wire soclk;
wire w1_cmp27to19;
wire w1_cmp27to25;
wire w1_cmp24to22;
wire w1_cmp21to19;
wire w0_cmp27to19;
wire w0_cmp27to25;
wire w0_cmp24to22;
wire w0_cmp21to19;
wire w1_cmp18to10;
wire w1_cmp18to16;
wire w1_cmp15to13;
wire w1_cmp12to10;
wire w0_cmp18to10;
wire w0_cmp18to16;
wire w0_cmp15to13;
wire w0_cmp12to10;
wire w1_cmp9to1;
wire w1_cmp9to7;
wire w1_cmp6to4;
wire w1_cmp3to1;
wire w0_cmp9to1;
wire w0_cmp9to7;
wire w0_cmp6to4;
wire w0_cmp3to1;
wire w1_cmp27to1;
wire rd_en_d1_a;
wire w0_cmp27to1;
wire [4:0] reg_d_lft;
wire [4:0] reg_d_rgt;
wire rid_lft_b;
wire rid_rgt_b;
wire [1:0] reg_en_lft;
wire [1:0] reg_en_rgt;
wire ln1clk;
wire ln2clk;
wire wr_inhibit_a_l;
wire not_reg_wen_lft;
wire wen_clk_lft;
wire not_reg_wen_rgt;
wire wen_clk_rgt;
wire en_lft;
wire en_rgt;
wire [4:0] not_reg_d_lft;
wire [1:0] rpda_lft;
wire [3:0] rpdb_lft;
wire [3:0] rpdc_lft;
wire [4:0] not_reg_d_rgt;
wire [1:0] rpda_rgt;
wire [3:0] rpdb_rgt;
wire [3:0] rpdc_rgt;
wire [27:0] sao_mx0_h;
wire [27:0] sao_mx0_l;
wire [27:0] sao_mx1_h;
wire [27:0] sao_mx1_l;
wire [8:0] addr_b;
wire rd_en_b;
wire wr_en_b;
wire wr_en_d1_a;
wire [1:0] wr_way_b;
wire [1:0] wr_way_b_l;
wire [27:0] sao_mx1;
wire [27:0] sao_mx0;
wire reg_addr_b_8_scanin;
wire reg_addr_b_8_scanout;
wire reg_addr_b_8_unused;
wire reg_addr_b_7_scanin;
wire reg_addr_b_7_scanout;
wire reg_addr_b_7_unused;
wire reg_addr_b_6_scanin;
wire reg_addr_b_6_scanout;
wire reg_addr_b_6_unused;
wire reg_addr_b_5_scanin;
wire reg_addr_b_5_scanout;
wire reg_addr_b_5_unused;
wire reg_addr_b_4_scanin;
wire reg_addr_b_4_scanout;
wire reg_addr_b_4_unused;
wire reg_addr_b_3_scanin;
wire reg_addr_b_3_scanout;
wire reg_addr_b_3_unused;
wire reg_addr_b_2_scanin;
wire reg_addr_b_2_scanout;
wire reg_addr_b_2_unused;
wire reg_addr_b_1_scanin;
wire reg_addr_b_1_scanout;
wire reg_addr_b_1_unused;
wire reg_addr_b_0_scanin;
wire reg_addr_b_0_scanout;
wire reg_addr_b_0_unused;
wire reg_wr_way_b_scanin;
wire reg_wr_way_b_scanout;
wire reg_wr_en_b_scanin;
wire reg_wr_en_b_scanout;
wire reg_wr_en_b_unused;
wire reg_rd_en_b_scanin;
wire reg_rd_en_b_scanout;
wire reg_rd_en_b_unused;
wire reg_wr_en_a_scanin;
wire reg_wr_en_a_scanout;
wire reg_rd_en_a_scanin;
wire reg_rd_en_a_scanout;
wire reg_tag_way1_27_scanin;
wire reg_tag_way1_27_scanout;
wire reg_tag_way0_27_scanin;
wire reg_tag_way0_27_scanout;
wire reg_tag_way1_26_scanin;
wire reg_tag_way1_26_scanout;
wire reg_tag_way0_26_scanin;
wire reg_tag_way0_26_scanout;
wire reg_tag_way1_25_scanin;
wire reg_tag_way1_25_scanout;
wire reg_tag_way0_25_scanin;
wire reg_tag_way0_25_scanout;
wire reg_tag_way1_24_scanin;
wire reg_tag_way1_24_scanout;
wire reg_tag_way0_24_scanin;
wire reg_tag_way0_24_scanout;
wire reg_tag_way1_23_scanin;
wire reg_tag_way1_23_scanout;
wire reg_tag_way0_23_scanin;
wire reg_tag_way0_23_scanout;
wire reg_tag_way1_22_scanin;
wire reg_tag_way1_22_scanout;
wire reg_tag_way0_22_scanin;
wire reg_tag_way0_22_scanout;
wire reg_tag_way1_21_scanin;
wire reg_tag_way1_21_scanout;
wire reg_tag_way0_21_scanin;
wire reg_tag_way0_21_scanout;
wire reg_tag_way1_20_scanin;
wire reg_tag_way1_20_scanout;
wire reg_tag_way0_20_scanin;
wire reg_tag_way0_20_scanout;
wire reg_tag_way1_19_scanin;
wire reg_tag_way1_19_scanout;
wire reg_tag_way0_19_scanin;
wire reg_tag_way0_19_scanout;
wire reg_tag_way1_18_scanin;
wire reg_tag_way1_18_scanout;
wire reg_tag_way0_18_scanin;
wire reg_tag_way0_18_scanout;
wire reg_tag_way1_17_scanin;
wire reg_tag_way1_17_scanout;
wire reg_tag_way0_17_scanin;
wire reg_tag_way0_17_scanout;
wire reg_tag_way1_16_scanin;
wire reg_tag_way1_16_scanout;
wire reg_tag_way0_16_scanin;
wire reg_tag_way0_16_scanout;
wire reg_tag_way1_15_scanin;
wire reg_tag_way1_15_scanout;
wire reg_tag_way0_15_scanin;
wire reg_tag_way0_15_scanout;
wire reg_tag_way1_14_scanin;
wire reg_tag_way1_14_scanout;
wire reg_tag_way0_14_scanin;
wire reg_tag_way0_14_scanout;
wire reg_tag_way1_13_scanin;
wire reg_tag_way1_13_scanout;
wire reg_tag_way0_13_scanin;
wire reg_tag_way0_13_scanout;
wire reg_tag_way1_12_scanin;
wire reg_tag_way1_12_scanout;
wire reg_tag_way0_12_scanin;
wire reg_tag_way0_12_scanout;
wire reg_tag_way1_11_scanin;
wire reg_tag_way1_11_scanout;
wire reg_tag_way0_11_scanin;
wire reg_tag_way0_11_scanout;
wire reg_tag_way1_10_scanin;
wire reg_tag_way1_10_scanout;
wire reg_tag_way0_10_scanin;
wire reg_tag_way0_10_scanout;
wire reg_tag_way1_9_scanin;
wire reg_tag_way1_9_scanout;
wire reg_tag_way0_9_scanin;
wire reg_tag_way0_9_scanout;
wire reg_tag_way1_8_scanin;
wire reg_tag_way1_8_scanout;
wire reg_tag_way0_8_scanin;
wire reg_tag_way0_8_scanout;
wire reg_tag_way1_7_scanin;
wire reg_tag_way1_7_scanout;
wire reg_tag_way0_7_scanin;
wire reg_tag_way0_7_scanout;
wire reg_tag_way1_6_scanin;
wire reg_tag_way1_6_scanout;
wire reg_tag_way0_6_scanin;
wire reg_tag_way0_6_scanout;
wire reg_tag_way1_5_scanin;
wire reg_tag_way1_5_scanout;
wire reg_tag_way0_5_scanin;
wire reg_tag_way0_5_scanout;
wire reg_tag_way1_4_scanin;
wire reg_tag_way1_4_scanout;
wire reg_tag_way0_4_scanin;
wire reg_tag_way0_4_scanout;
wire reg_tag_way1_3_scanin;
wire reg_tag_way1_3_scanout;
wire reg_tag_way0_3_scanin;
wire reg_tag_way0_3_scanout;
wire reg_tag_way1_2_scanin;
wire reg_tag_way1_2_scanout;
wire reg_tag_way0_2_scanin;
wire reg_tag_way0_2_scanout;
wire reg_tag_way1_1_scanin;
wire reg_tag_way1_1_scanout;
wire reg_tag_way0_1_scanin;
wire reg_tag_way0_1_scanout;
wire reg_tag_way1_0_scanin;
wire reg_tag_way1_0_scanout;
wire reg_tag_way0_0_scanin;
wire reg_tag_way0_0_scanout;
wire reg_way_hit_a0_scanin;
wire reg_way_hit_a0_scanout;
wire reg_way_hit_a1_scanin;
wire reg_way_hit_a1_scanout;


//   input         l2clk;                  // cmp clock
input         	   l1clk_in;                  // io clock
input         	   scan_in;
input              clk_stop;
input              se_outff;
input              scan_en;
input              vnw_ary;

//   input         tcu_aclk;
//   input         tcu_bclk;
//   input         tcu_scan_en;
//   input         tcu_muxtest;
//   input         tcu_dectest;
output        scan_out;

input	[`L2T_ARR_D_WIDTH - 1:0]	din;
input   [8:0]	 			index_a;
input   	 			l2clk;
input   [`L2T_ARR_D_WIDTH - 1:1] 	lkuptag_d1;
input   	 			pce_out;
input   	 			pce_ctl;
input   	 			pce_ov;
input   	 			rd_en_a;
input   [4:0]	 			reg_d_in;
input   [1:0]	 			reg_en_in;
input   	 			reg_wen_lft;
input   	 			reg_wen_rgt;
input   	 			rid_lft;
input   	 			rid_rgt;
input   	 			tcu_aclk;
input   	 			tcu_bclk;
input   [1:0]	 			way_a;
input   	 			wr_en_a;
input   	 			wr_inhibit_a;

output  [4:0] 				reg_d;
output  [1:0] 				reg_en;
output  [`L2T_ARR_D_WIDTH - 1:0] 	tag_way0;
output  [`L2T_ARR_D_WIDTH - 1:0] 	tag_way1;
output  [1:0] 				way_hit_a;



/////////////////////////////////////////
//	   Clock Header		       //
/////////////////////////////////////////

//INTERNAL HEADER
//
n2_l2t_sp_28kb_cust_l1clkhdr_ctl_macro clk_hdr_int_v1 (
        .l2clk  (l2clk),
        .l1en    (pce_ctl),	
        .pce_ov (pce_ov),
        .stop   (clk_stop),
	.se	(scan_en),
        .l1clk  (l1clk_int_v1));

n2_l2t_sp_28kb_cust_l1clkhdr_ctl_macro clk_hdr_int_v2 (
        .l2clk  (l2clk),
        .l1en    (pce_ctl),	
        .pce_ov (pce_ov),
        .stop   (clk_stop),
	.se	(scan_en),
        .l1clk  (l1clk_int_v2));


//OUTPUT HEADER
//
n2_l2t_sp_28kb_cust_l1clkhdr_ctl_macro clk_hdr_out0 (
        .l2clk  (l2clk),
        .l1en    (pce_out),	
        .pce_ov (pce_ov),
        .stop   (clk_stop),
	.se	(se_outff),
        .l1clk  (l1clk_out0));

n2_l2t_sp_28kb_cust_l1clkhdr_ctl_macro clk_hdr_out1 (
        .l2clk  (l2clk),
        .l1en    (pce_out),	
        .pce_ov (pce_ov),
        .stop   (clk_stop),
	.se	(se_outff),
        .l1clk  (l1clk_out1));

assign		se_unused    	= se_outff;
assign          siclk 		= tcu_aclk;
assign          soclk 		= tcu_bclk;

//---------------------------------------
//	output signals
//---------------------------------------

//  Behaviourial coding for compare:
//assign way_hit_a_l[1]	= (lkuptag_d1[`L2T_ARR_D_WIDTH - 1 :1] == sao_mx1_h[`L2T_ARR_D_WIDTH - 1 :1] ) ?
//				1'b0 : 1'b1;
//assign way_hit_a_l[0]	= (lkuptag_d1[`L2T_ARR_D_WIDTH - 1 :1] == sao_mx0_h[`L2T_ARR_D_WIDTH - 1 :1] ) ?
//				1'b0 : 1'b1;

// Structural coding for 27bit compare (for two ways):
n2_l2t_sp_28kb_cust_nor_macro__ports_3__width_1 w1_nor_cmp27to19 (
	.dout (w1_cmp27to19),
        .din0 (w1_cmp27to25),
	.din1 (w1_cmp24to22),
	.din2 (w1_cmp21to19));	

n2_l2t_sp_28kb_cust_nor_macro__ports_3__width_1 w0_nor_cmp27to19 
	(
	.dout (w0_cmp27to19),
        .din0 (w0_cmp27to25),
	.din1 (w0_cmp24to22),
	.din2 (w0_cmp21to19));	

n2_l2t_sp_28kb_cust_nor_macro__ports_3__width_1 w1_nor_cmp18to10 
	(
	.dout (w1_cmp18to10),
        .din0 (w1_cmp18to16),
	.din1 (w1_cmp15to13),
	.din2 (w1_cmp12to10));	

n2_l2t_sp_28kb_cust_nor_macro__ports_3__width_1 w0_nor_cmp18to10 
	(
	.dout (w0_cmp18to10),
        .din0 (w0_cmp18to16),
	.din1 (w0_cmp15to13),
	.din2 (w0_cmp12to10));	


n2_l2t_sp_28kb_cust_nor_macro__ports_3__width_1 w1_nor_cmp9to1 
	(
	.dout (w1_cmp9to1),
        .din0 (w1_cmp9to7),
	.din1 (w1_cmp6to4),
	.din2 (w1_cmp3to1));	


n2_l2t_sp_28kb_cust_nor_macro__ports_3__width_1 w0_nor_cmp9to1 
	(
	.dout (w0_cmp9to1),
        .din0 (w0_cmp9to7),
	.din1 (w0_cmp6to4),
	.din2 (w0_cmp3to1));	


// Third stage nand 
//assign w1_cmp27to1  = ~(rd_en_d1_a & w1_cmp27to19 & w1_cmp18to10 & w1_cmp9to1);
//assign w0_cmp27to1  = ~(rd_en_d1_a & w0_cmp27to19 & w0_cmp18to10 & w0_cmp9to1);

n2_l2t_sp_28kb_cust_nand_macro__ports_4__width_1 w1_nand_cmp27to1 
	(
	.dout (w1_cmp27to1),
        .din0 (rd_en_d1_a),
	.din1 (w1_cmp27to19),
	.din2 (w1_cmp18to10),
	.din3 (w1_cmp9to1));	

n2_l2t_sp_28kb_cust_nand_macro__ports_4__width_1 w0_nand_cmp27to1 
	(
	.dout (w0_cmp27to1),
        .din0 (rd_en_d1_a),
	.din1 (w0_cmp27to19),
	.din2 (w0_cmp18to10),
	.din3 (w0_cmp9to1));	

// The mux is not explicit (check with Connie)
//assign	reg_sel[1:0]	= {rid_lft_b, rid_rgt_b};
//assign	reg_d[4:0]	= (reg_sel == 2'b10) ? reg_d_lft[4:0]  : (reg_sel == 2'b01) ? reg_d_rgt[4:0]  : 5'b00000; 
//assign	reg_en[1:0]	= (reg_sel == 2'b10) ? reg_en_lft[1:0] : (reg_sel == 2'b01) ? reg_en_rgt[1:0] : 2'b00; 

n2_l2t_sp_28kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_5 mux_reg_d_lft_reg_d_rgt  
        (
        .dout   (reg_d[4:0]),
        .din0   (reg_d_lft[4:0]),
        .din1   (reg_d_rgt[4:0]),
        .sel0   (rid_lft_b),
        .sel1   (rid_rgt_b)
        );

n2_l2t_sp_28kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_2 mux_reg_en_lft_reg_en_rgt  
        (
        .dout   (reg_en[1:0]),
        .din0   (reg_en_lft[1:0]),
        .din1   (reg_en_rgt[1:0]),
        .sel0   (rid_lft_b),
        .sel1   (rid_rgt_b)
        );



//---------------------------------------
//	internal signals
//---------------------------------------
assign ln1clk 		=  l1clk_int_v2;
assign ln2clk 		=  l1clk_int_v2;
//Change to structural CC
// assign wr_inhibit_a_l 	=  ~wr_inhibit_a;

n2_l2t_sp_28kb_cust_inv_macro__width_1	inv_wr_inhibit_a   
                        (
                        .din (wr_inhibit_a),
                        .dout (wr_inhibit_a_l)
                        );

//---------------------------------------
//	Redundancy section
//---------------------------------------

//Change to structural CC
//assign wen_clk_lft	= ~((~l1clk_int_v1) && reg_wen_lft);
//assign wen_clk_rgt	= ~((~l1clk_int_v2) && reg_wen_rgt);

n2_l2t_sp_28kb_cust_inv_macro__width_1 inv_reg_wen_lft  
                        (
                        .din (reg_wen_lft),
                        .dout (not_reg_wen_lft)
                        );

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1 or_wen_clk_lft  
                        (
                        .din0 (l1clk_int_v1),
                        .din1 (not_reg_wen_lft),
                        .dout (wen_clk_lft)
			);
			
n2_l2t_sp_28kb_cust_inv_macro__width_1 inv_reg_wen_rgt 
                        (
                        .din (reg_wen_rgt),
                        .dout (not_reg_wen_rgt)
                        );

n2_l2t_sp_28kb_cust_or_macro__ports_2__width_1 or_wen_clk_rgt  
                        (
                        .din0 (l1clk_int_v2),
                        .din1 (not_reg_wen_rgt),
                        .dout (wen_clk_rgt)
			);
			

//assign en_lft		= &reg_en_lft[1:0];
//assign en_rgt		= &reg_en_rgt[1:0];

n2_l2t_sp_28kb_cust_and_macro__ports_2__width_1 and_en_lft  
                        (
                        .din0 (reg_en_lft[0]),
                        .din1 (reg_en_lft[1]),
                        .dout (en_lft)
			);

n2_l2t_sp_28kb_cust_and_macro__ports_2__width_1 and_en_rgt  
                        (
                        .din0 (reg_en_rgt[0]),
                        .din1 (reg_en_rgt[1]),
                        .dout (en_rgt)
			);

// Redundancy decoding :
//Change to structural CC

// LEFT SIDE 
n2_l2t_sp_28kb_cust_inv_macro__width_5 inv_reg_d_lft  
                        (
                        .din (reg_d_lft[4:0]),
                        .dout (not_reg_d_lft[4:0])
                        );

//assign rpdb_lft[3] = en_lft && ( reg_d_lft[3]) && ( reg_d_lft[2]); 
//assign rpda_lft[1] = en_lft && ( reg_d_lft[4]); 
n2_l2t_sp_28kb_cust_and_macro__ports_2__width_1 and_rpda_lft_1   
                        (
                        .din0 (reg_d_lft[4]),
                        .din1 (en_lft),
                        .dout (rpda_lft[1])
                        );

//assign rpda_lft[0] = en_lft && (~reg_d_lft[4]); 
n2_l2t_sp_28kb_cust_and_macro__ports_2__width_1 and_rpda_lft_0   
                        (
                        .din0 (not_reg_d_lft[4]),
                        .din1 (en_lft),
                        .dout (rpda_lft[0])
                        );

n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rpdb_lft_3   
                        (
                        .din0 (reg_d_lft[3]),
                        .din1 (en_lft),
                        .din2 (reg_d_lft[2]),
                        .dout (rpdb_lft[3])
                        );

//assign rpdb_lft[2] = en_lft && ( reg_d_lft[3]) && (~reg_d_lft[2]); 
n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rpdb_lft_2   
                        (
                        .din0 (reg_d_lft[3]),
                        .din1 (en_lft),
                        .din2 (not_reg_d_lft[2]),
                        .dout (rpdb_lft[2])
                        );

//assign rpdb_lft[1] = en_lft && (~reg_d_lft[3]) && ( reg_d_lft[2]); 
n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rpdb_lft_1   
                        (
                        .din0 (not_reg_d_lft[3]),
                        .din1 (en_lft),
                        .din2 (reg_d_lft[2]),
                        .dout (rpdb_lft[1])
                        );

//assign rpdb_lft[0] = en_lft && (~reg_d_lft[3]) && (~reg_d_lft[2]); 
n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rpdb_lft_0   
                        (
                        .din0 (not_reg_d_lft[3]),
                        .din1 (en_lft),
                        .din2 (not_reg_d_lft[2]),
                        .dout (rpdb_lft[0])
                        );

//assign rpdc_lft[3] = en_lft && ( reg_d_lft[1]) && ( reg_d_lft[0]); 
n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rpdc_lft_3   
                        (
                        .din0 (reg_d_lft[1]),
                        .din1 (en_lft),
                        .din2 (reg_d_lft[0]),
                        .dout (rpdc_lft[3])
                        );

//assign rpdc_lft[2] = en_lft && ( reg_d_lft[1]) && (~reg_d_lft[0]); 
n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rpdc_lft_2   
                        (
                        .din0 (reg_d_lft[1]),
                        .din1 (en_lft),
                        .din2 (not_reg_d_lft[0]),
                        .dout (rpdc_lft[2])
                        );

//assign rpdc_lft[1] = en_lft && (~reg_d_lft[1]) && ( reg_d_lft[0]); 
n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rpdc_lft_1   
                        (
                        .din0 (reg_d_lft[0]),
                        .din1 (en_lft),
                        .din2 (not_reg_d_lft[1]),
                        .dout (rpdc_lft[1])
                        );

//assign rpdc_lft[0] = en_lft && (~reg_d_lft[1]) && (~reg_d_lft[0]); 
n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rpdc_lft_0   
                        (
                        .din0 (not_reg_d_lft[0]),
                        .din1 (en_lft),
                        .din2 (not_reg_d_lft[1]),
                        .dout (rpdc_lft[0])
                        );
// RIGHT SIDE 
n2_l2t_sp_28kb_cust_inv_macro__width_5 inv_reg_d_rgt  
                        (
                        .din (reg_d_rgt[4:0]),
                        .dout (not_reg_d_rgt[4:0])
                        );

//assign rpda_rgt[1] = en_rgt && ( reg_d_rgt[4]); 
n2_l2t_sp_28kb_cust_and_macro__ports_2__width_1 and_rpda_rgt_1   
                        (
                        .din0 (reg_d_rgt[4]),
                        .din1 (en_rgt),
                        .dout (rpda_rgt[1])
                        );

//assign rpda_rgt[0] = en_rgt && (~reg_d_rgt[4]); 
n2_l2t_sp_28kb_cust_and_macro__ports_2__width_1 and_rpda_rgt_0   
                        (
                        .din0 (not_reg_d_rgt[4]),
                        .din1 (en_rgt),
                        .dout (rpda_rgt[0])
                        );

//assign rpdb_rgt[3] = en_rgt && ( reg_d_rgt[3]) && ( reg_d_rgt[2]); 
n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rpdb_rgt_3   
                        (
                        .din0 (reg_d_rgt[2]),
                        .din1 (en_rgt),
                        .din2 (reg_d_rgt[3]),
                        .dout (rpdb_rgt[3])
                        );

//assign rpdb_rgt[2] = en_rgt && ( reg_d_rgt[3]) && (~reg_d_rgt[2]); 
n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rpdb_rgt_2   
                        (
                        .din0 (not_reg_d_rgt[2]),
                        .din1 (en_rgt),
                        .din2 (reg_d_rgt[3]),
                        .dout (rpdb_rgt[2])
                        );

//assign rpdb_rgt[1] = en_rgt && (~reg_d_rgt[3]) && ( reg_d_rgt[2]); 
n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rpdb_rgt_1   
                        (
                        .din0 (reg_d_rgt[2]),
                        .din1 (en_rgt),
                        .din2 (not_reg_d_rgt[3]),
                        .dout (rpdb_rgt[1])
                        );

//assign rpdb_rgt[0] = en_rgt && (~reg_d_rgt[3]) && (~reg_d_rgt[2]); 
n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rpdb_rgt_0   
                        (
                        .din0 (not_reg_d_rgt[2]),
                        .din1 (en_rgt),
                        .din2 (not_reg_d_rgt[3]),
                        .dout (rpdb_rgt[0])
                        );

//assign rpdc_rgt[3] = en_rgt && ( reg_d_rgt[1]) && ( reg_d_rgt[0]); 
n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rpdc_rgt_3   
                        (
                        .din0 (reg_d_rgt[1]),
                        .din1 (en_rgt),
                        .din2 (reg_d_rgt[0]),
                        .dout (rpdc_rgt[3])
                        );

//assign rpdc_rgt[2] = en_rgt && ( reg_d_rgt[1]) && (~reg_d_rgt[0]); 
n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rpdc_rgt_2   
                        (
                        .din0 (reg_d_rgt[1]),
                        .din1 (en_rgt),
                        .din2 (not_reg_d_rgt[0]),
                        .dout (rpdc_rgt[2])
                        );

//assign rpdc_rgt[1] = en_rgt && (~reg_d_rgt[1]) && ( reg_d_rgt[0]); 
n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rpdc_rgt_1   
                        (
                        .din0 (not_reg_d_rgt[1]),
                        .din1 (en_rgt),
                        .din2 (reg_d_rgt[0]),
                        .dout (rpdc_rgt[1])
                        );

//assign rpdc_rgt[0] = en_rgt && (~reg_d_rgt[1]) && (~reg_d_rgt[0]); 
n2_l2t_sp_28kb_cust_and_macro__ports_3__width_1 and_rpdc_rgt_0   
                        (
                        .din0 (not_reg_d_rgt[1]),
                        .din1 (en_rgt),
                        .din2 (not_reg_d_rgt[0]),
                        .dout (rpdc_rgt[0])
                        );

// ---


//assign rpda_lft[1:0]	= en_lft ? (reg_d_lft[4] ? 2'b10 : 2'b01 ): 2'b00; 
//assign rpdb_lft[3:0]	= en_lft ? ((reg_d_lft[3:2] == 2'b11) ? 4'b1000 :  
//				    (reg_d_lft[3:2] == 2'b10) ? 4'b0100 :
//				    (reg_d_lft[3:2] == 2'b01) ? 4'b0010 :
//				     				4'b0001 ) : 4'b0000;
//assign rpdc_lft[3:0]	= en_lft ? ((reg_d_lft[1:0] == 2'b11) ? 4'b1000 :  
//				    (reg_d_lft[1:0] == 2'b10) ? 4'b0100 :
//				    (reg_d_lft[1:0] == 2'b01) ? 4'b0010 :
//				     				4'b0001 ) : 4'b0000;
//assign rpda_rgt[1:0]	= en_rgt ? (reg_d_rgt[4] ? 2'b10 : 2'b01 ): 2'b00; 
//assign rpdb_rgt[3:0]	= en_rgt ? ((reg_d_rgt[3:2] == 2'b11) ? 4'b1000 :  
//				    (reg_d_rgt[3:2] == 2'b10) ? 4'b0100 :
//				    (reg_d_rgt[3:2] == 2'b01) ? 4'b0010 :
//				     				4'b0001 ) : 4'b0000;
//assign rpdc_rgt[3:0]	= en_rgt ? ((reg_d_rgt[1:0] == 2'b11) ? 4'b1000 :  
//				    (reg_d_rgt[1:0] == 2'b10) ? 4'b0100 :
//				    (reg_d_rgt[1:0] == 2'b01) ? 4'b0010 :
//				     				4'b0001 ) : 4'b0000;


//---------------------------------------
//	L2T ARRAY INSTANTIATION 
//---------------------------------------
n2_l2t_array l2t_array (/*AUTOINST*/
			// Outputs
			.sao_mx0_h	(sao_mx0_h[`L2T_ARR_D_WIDTH-1:0]),
			.sao_mx0_l	(sao_mx0_l[`L2T_ARR_D_WIDTH-1:0]),
			.sao_mx1_h	(sao_mx1_h[`L2T_ARR_D_WIDTH-1:0]),
			.sao_mx1_l	(sao_mx1_l[`L2T_ARR_D_WIDTH-1:0]),
			// Inputs
		        .vnw_ary          (vnw_ary),
			.din		(din[`L2T_ARR_D_WIDTH - 1 : 0]), // Templated
			.addr_b		(addr_b[8:0]),
			.l1clk_internal_v1(l1clk_int_v1),		 // Templated
			.l1clk_internal_v2(l1clk_int_v2),		 // Templated
			.ln1clk		(ln1clk),
			.ln2clk		(ln2clk),
			.rd_en_b	(rd_en_b),
			.rd_en_d1_a	(rd_en_d1_a),
			.rpda_lft	(rpda_lft[1:0]),
			.rpda_rgt	(rpda_rgt[1:0]),
			.rpdb_lft	(rpdb_lft[3:0]),
			.rpdb_rgt	(rpdb_rgt[3:0]),
			.rpdc_lft	(rpdc_lft[3:0]),
			.rpdc_rgt	(rpdc_rgt[3:0]),
			.w_inhibit_l	(wr_inhibit_a_l),
			.wr_en_b	(wr_en_b),
			.wr_en_d1_a	(wr_en_d1_a),
			.wr_way_b	(wr_way_b[1:0]),
			.wr_way_b_l	(wr_way_b_l[1:0]));

//---------------------------------------
//  SET RESET LATCH FOR SENSE AMP OUT
//---------------------------------------

n2_l2t_sr_latch srlatch_sao_mx1_27  (.set (sao_mx1_h[27]), .reset (sao_mx1_l[27]), .out	(sao_mx1[27]));
n2_l2t_sr_latch srlatch_sao_mx1_26  (.set (sao_mx1_h[26]), .reset (sao_mx1_l[26]), .out	(sao_mx1[26]));
n2_l2t_sr_latch srlatch_sao_mx1_25  (.set (sao_mx1_h[25]), .reset (sao_mx1_l[25]), .out	(sao_mx1[25]));
n2_l2t_sr_latch srlatch_sao_mx1_24  (.set (sao_mx1_h[24]), .reset (sao_mx1_l[24]), .out	(sao_mx1[24]));
n2_l2t_sr_latch srlatch_sao_mx1_23  (.set (sao_mx1_h[23]), .reset (sao_mx1_l[23]), .out	(sao_mx1[23]));
n2_l2t_sr_latch srlatch_sao_mx1_22  (.set (sao_mx1_h[22]), .reset (sao_mx1_l[22]), .out	(sao_mx1[22]));
n2_l2t_sr_latch srlatch_sao_mx1_21  (.set (sao_mx1_h[21]), .reset (sao_mx1_l[21]), .out	(sao_mx1[21]));
n2_l2t_sr_latch srlatch_sao_mx1_20  (.set (sao_mx1_h[20]), .reset (sao_mx1_l[20]), .out	(sao_mx1[20]));
n2_l2t_sr_latch srlatch_sao_mx1_19  (.set (sao_mx1_h[19]), .reset (sao_mx1_l[19]), .out	(sao_mx1[19]));
n2_l2t_sr_latch srlatch_sao_mx1_18  (.set (sao_mx1_h[18]), .reset (sao_mx1_l[18]), .out	(sao_mx1[18]));
n2_l2t_sr_latch srlatch_sao_mx1_17  (.set (sao_mx1_h[17]), .reset (sao_mx1_l[17]), .out	(sao_mx1[17]));
n2_l2t_sr_latch srlatch_sao_mx1_16  (.set (sao_mx1_h[16]), .reset (sao_mx1_l[16]), .out	(sao_mx1[16]));
n2_l2t_sr_latch srlatch_sao_mx1_15  (.set (sao_mx1_h[15]), .reset (sao_mx1_l[15]), .out	(sao_mx1[15]));
n2_l2t_sr_latch srlatch_sao_mx1_14  (.set (sao_mx1_h[14]), .reset (sao_mx1_l[14]), .out	(sao_mx1[14]));
n2_l2t_sr_latch srlatch_sao_mx1_13  (.set (sao_mx1_h[13]), .reset (sao_mx1_l[13]), .out	(sao_mx1[13]));
n2_l2t_sr_latch srlatch_sao_mx1_12  (.set (sao_mx1_h[12]), .reset (sao_mx1_l[12]), .out	(sao_mx1[12]));
n2_l2t_sr_latch srlatch_sao_mx1_11  (.set (sao_mx1_h[11]), .reset (sao_mx1_l[11]), .out	(sao_mx1[11]));
n2_l2t_sr_latch srlatch_sao_mx1_10  (.set (sao_mx1_h[10]), .reset (sao_mx1_l[10]), .out	(sao_mx1[10]));
n2_l2t_sr_latch srlatch_sao_mx1_9   (.set (sao_mx1_h[9]),  .reset (sao_mx1_l[9]),  .out	(sao_mx1[9]));
n2_l2t_sr_latch srlatch_sao_mx1_8   (.set (sao_mx1_h[8]),  .reset (sao_mx1_l[8]),  .out	(sao_mx1[8]));
n2_l2t_sr_latch srlatch_sao_mx1_7   (.set (sao_mx1_h[7]),  .reset (sao_mx1_l[7]),  .out	(sao_mx1[7]));
n2_l2t_sr_latch srlatch_sao_mx1_6   (.set (sao_mx1_h[6]),  .reset (sao_mx1_l[6]),  .out	(sao_mx1[6]));
n2_l2t_sr_latch srlatch_sao_mx1_5   (.set (sao_mx1_h[5]),  .reset (sao_mx1_l[5]),  .out	(sao_mx1[5]));
n2_l2t_sr_latch srlatch_sao_mx1_4   (.set (sao_mx1_h[4]),  .reset (sao_mx1_l[4]),  .out	(sao_mx1[4]));
n2_l2t_sr_latch srlatch_sao_mx1_3   (.set (sao_mx1_h[3]),  .reset (sao_mx1_l[3]),  .out	(sao_mx1[3]));
n2_l2t_sr_latch srlatch_sao_mx1_2   (.set (sao_mx1_h[2]),  .reset (sao_mx1_l[2]),  .out	(sao_mx1[2]));
n2_l2t_sr_latch srlatch_sao_mx1_1   (.set (sao_mx1_h[1]),  .reset (sao_mx1_l[1]),  .out	(sao_mx1[1]));
n2_l2t_sr_latch srlatch_sao_mx1_0   (.set (sao_mx1_h[0]),  .reset (sao_mx1_l[0 ]), .out	(sao_mx1[0]));

n2_l2t_sr_latch srlatch_sao_mx0_27  (.set (sao_mx0_h[27]), .reset (sao_mx0_l[27]), .out	(sao_mx0[27]));
n2_l2t_sr_latch srlatch_sao_mx0_26  (.set (sao_mx0_h[26]), .reset (sao_mx0_l[26]), .out	(sao_mx0[26]));
n2_l2t_sr_latch srlatch_sao_mx0_25  (.set (sao_mx0_h[25]), .reset (sao_mx0_l[25]), .out	(sao_mx0[25]));
n2_l2t_sr_latch srlatch_sao_mx0_24  (.set (sao_mx0_h[24]), .reset (sao_mx0_l[24]), .out	(sao_mx0[24]));
n2_l2t_sr_latch srlatch_sao_mx0_23  (.set (sao_mx0_h[23]), .reset (sao_mx0_l[23]), .out	(sao_mx0[23]));
n2_l2t_sr_latch srlatch_sao_mx0_22  (.set (sao_mx0_h[22]), .reset (sao_mx0_l[22]), .out	(sao_mx0[22]));
n2_l2t_sr_latch srlatch_sao_mx0_21  (.set (sao_mx0_h[21]), .reset (sao_mx0_l[21]), .out	(sao_mx0[21]));
n2_l2t_sr_latch srlatch_sao_mx0_20  (.set (sao_mx0_h[20]), .reset (sao_mx0_l[20]), .out	(sao_mx0[20]));
n2_l2t_sr_latch srlatch_sao_mx0_19  (.set (sao_mx0_h[19]), .reset (sao_mx0_l[19]), .out	(sao_mx0[19]));
n2_l2t_sr_latch srlatch_sao_mx0_18  (.set (sao_mx0_h[18]), .reset (sao_mx0_l[18]), .out	(sao_mx0[18]));
n2_l2t_sr_latch srlatch_sao_mx0_17  (.set (sao_mx0_h[17]), .reset (sao_mx0_l[17]), .out	(sao_mx0[17]));
n2_l2t_sr_latch srlatch_sao_mx0_16  (.set (sao_mx0_h[16]), .reset (sao_mx0_l[16]), .out	(sao_mx0[16]));
n2_l2t_sr_latch srlatch_sao_mx0_15  (.set (sao_mx0_h[15]), .reset (sao_mx0_l[15]), .out	(sao_mx0[15]));
n2_l2t_sr_latch srlatch_sao_mx0_14  (.set (sao_mx0_h[14]), .reset (sao_mx0_l[14]), .out	(sao_mx0[14]));
n2_l2t_sr_latch srlatch_sao_mx0_13  (.set (sao_mx0_h[13]), .reset (sao_mx0_l[13]), .out	(sao_mx0[13]));
n2_l2t_sr_latch srlatch_sao_mx0_12  (.set (sao_mx0_h[12]), .reset (sao_mx0_l[12]), .out	(sao_mx0[12]));
n2_l2t_sr_latch srlatch_sao_mx0_11  (.set (sao_mx0_h[11]), .reset (sao_mx0_l[11]), .out	(sao_mx0[11]));
n2_l2t_sr_latch srlatch_sao_mx0_10  (.set (sao_mx0_h[10]), .reset (sao_mx0_l[10]), .out	(sao_mx0[10]));
n2_l2t_sr_latch srlatch_sao_mx0_9   (.set (sao_mx0_h[9]),  .reset (sao_mx0_l[9]),  .out	(sao_mx0[9]));
n2_l2t_sr_latch srlatch_sao_mx0_8   (.set (sao_mx0_h[8]),  .reset (sao_mx0_l[8]),  .out	(sao_mx0[8]));
n2_l2t_sr_latch srlatch_sao_mx0_7   (.set (sao_mx0_h[7]),  .reset (sao_mx0_l[7]),  .out	(sao_mx0[7]));
n2_l2t_sr_latch srlatch_sao_mx0_6   (.set (sao_mx0_h[6]),  .reset (sao_mx0_l[6]),  .out	(sao_mx0[6]));
n2_l2t_sr_latch srlatch_sao_mx0_5   (.set (sao_mx0_h[5]),  .reset (sao_mx0_l[5]),  .out	(sao_mx0[5]));
n2_l2t_sr_latch srlatch_sao_mx0_4   (.set (sao_mx0_h[4]),  .reset (sao_mx0_l[4]),  .out	(sao_mx0[4]));
n2_l2t_sr_latch srlatch_sao_mx0_3   (.set (sao_mx0_h[3]),  .reset (sao_mx0_l[3]),  .out	(sao_mx0[3]));
n2_l2t_sr_latch srlatch_sao_mx0_2   (.set (sao_mx0_h[2]),  .reset (sao_mx0_l[2]),  .out	(sao_mx0[2]));
n2_l2t_sr_latch srlatch_sao_mx0_1   (.set (sao_mx0_h[1]),  .reset (sao_mx0_l[1]),  .out	(sao_mx0[1]));
n2_l2t_sr_latch srlatch_sao_mx0_0   (.set (sao_mx0_h[0]),  .reset (sao_mx0_l[0]),  .out	(sao_mx0[0]));



//---------------------------------------
//	L2T 3BIT COMPARE (FIRST STAGE)
//---------------------------------------
n2_l2t_cmp_3bx2 cmp27to25 (
			.sao_mx1_h	(sao_mx1_h[27:25]),
			.sao_mx1_l	(sao_mx1_l[27:25]),
			.sao_mx0_h	(sao_mx0_h[27:25]),
			.sao_mx0_l	(sao_mx0_l[27:25]),
			.lkuptag_d1     (lkuptag_d1[27:25]),
			.l1clk_d  	(l1clk_int_v2),
			.w1_cmp3b       (w1_cmp27to25),
			.w0_cmp3b       (w0_cmp27to25));

n2_l2t_cmp_3bx2 cmp24to22 (
			.sao_mx1_h	(sao_mx1_h[24:22]),
			.sao_mx1_l	(sao_mx1_l[24:22]),
			.sao_mx0_h	(sao_mx0_h[24:22]),
			.sao_mx0_l	(sao_mx0_l[24:22]),
			.lkuptag_d1     (lkuptag_d1[24:22]),
			.l1clk_d  	(l1clk_int_v2),
			.w1_cmp3b       (w1_cmp24to22),
			.w0_cmp3b       (w0_cmp24to22));

n2_l2t_cmp_3bx2 cmp21to19 (
			.sao_mx1_h	(sao_mx1_h[21:19]),
			.sao_mx1_l	(sao_mx1_l[21:19]),
			.sao_mx0_h	(sao_mx0_h[21:19]),
			.sao_mx0_l	(sao_mx0_l[21:19]),
			.lkuptag_d1     (lkuptag_d1[21:19]),
			.l1clk_d  	(l1clk_int_v2),
			.w1_cmp3b       (w1_cmp21to19),
			.w0_cmp3b       (w0_cmp21to19));

n2_l2t_cmp_3bx2 cmp18to16 (
			.sao_mx1_h	(sao_mx1_h[18:16]),
			.sao_mx1_l	(sao_mx1_l[18:16]),
			.sao_mx0_h	(sao_mx0_h[18:16]),
			.sao_mx0_l	(sao_mx0_l[18:16]),
			.lkuptag_d1     (lkuptag_d1[18:16]),
			.l1clk_d  	(l1clk_int_v2),
			.w1_cmp3b       (w1_cmp18to16),
			.w0_cmp3b       (w0_cmp18to16));

n2_l2t_cmp_3bx2 cmp15to13 (
			.sao_mx1_h	(sao_mx1_h[15:13]),
			.sao_mx1_l	(sao_mx1_l[15:13]),
			.sao_mx0_h	(sao_mx0_h[15:13]),
			.sao_mx0_l	(sao_mx0_l[15:13]),
			.lkuptag_d1     (lkuptag_d1[15:13]),
			.l1clk_d  	(l1clk_int_v2),
			.w1_cmp3b       (w1_cmp15to13),
			.w0_cmp3b       (w0_cmp15to13));

n2_l2t_cmp_3bx2 cmp12to10 (
			.sao_mx1_h	(sao_mx1_h[12:10]),
			.sao_mx1_l	(sao_mx1_l[12:10]),
			.sao_mx0_h	(sao_mx0_h[12:10]),
			.sao_mx0_l	(sao_mx0_l[12:10]),
			.lkuptag_d1     (lkuptag_d1[12:10]),
			.l1clk_d  	(l1clk_int_v2),
			.w1_cmp3b       (w1_cmp12to10),
			.w0_cmp3b       (w0_cmp12to10));
	
n2_l2t_cmp_3bx2 cmp9to7 (
			.sao_mx1_h	(sao_mx1_h[9:7]),
			.sao_mx1_l	(sao_mx1_l[9:7]),
			.sao_mx0_h	(sao_mx0_h[9:7]),
			.sao_mx0_l	(sao_mx0_l[9:7]),
			.lkuptag_d1     (lkuptag_d1[9:7]),
			.l1clk_d  	(l1clk_int_v2),
			.w1_cmp3b       (w1_cmp9to7),
			.w0_cmp3b       (w0_cmp9to7));
	
	
n2_l2t_cmp_3bx2 cmp6to4 (
			.sao_mx1_h	(sao_mx1_h[6:4]),
			.sao_mx1_l	(sao_mx1_l[6:4]),
			.sao_mx0_h	(sao_mx0_h[6:4]),
			.sao_mx0_l	(sao_mx0_l[6:4]),
			.lkuptag_d1     (lkuptag_d1[6:4]),
			.l1clk_d  	(l1clk_int_v2),
			.w1_cmp3b       (w1_cmp6to4),
			.w0_cmp3b       (w0_cmp6to4));
	
	
n2_l2t_cmp_3bx2 cmp3to1 (
			.sao_mx1_h	(sao_mx1_h[3:1]),
			.sao_mx1_l	(sao_mx1_l[3:1]),
			.sao_mx0_h	(sao_mx0_h[3:1]),
			.sao_mx0_l	(sao_mx0_l[3:1]),
			.lkuptag_d1     (lkuptag_d1[3:1]),
			.l1clk_d  	(l1clk_int_v2),
			.w1_cmp3b       (w1_cmp3to1),
			.w0_cmp3b       (w0_cmp3to1));
	

	
//************************************************************************
// 			REGISTERS SECTION
//************************************************************************

// INPUT FLOPS
n2_l2t_sp_28kb_cust_tisram_blb_macro__dmsff_4x__width_2 lat_reg_en_lft  
			 	( 	
					.d_a(reg_en_in[1:0]),
					.q_b(reg_en_lft[1:0]),
					.l1clk(wen_clk_lft)
				);

n2_l2t_sp_28kb_cust_tisram_blb_macro__dmsff_4x__width_5 lat_reg_d_lft  	
				(
					.d_a(reg_d_in[4:0]),
					.q_b(reg_d_lft[4:0]),
					.l1clk(wen_clk_lft)
				);

n2_l2t_sp_28kb_cust_tisram_blb_macro__dmsff_4x__width_2 lat_reg_en_rgt  
				(	
					.d_a(reg_en_in[1:0]),
					.q_b(reg_en_rgt[1:0]),
					.l1clk(wen_clk_rgt)
				);

n2_l2t_sp_28kb_cust_tisram_blb_macro__dmsff_4x__width_5 lat_reg_d_rgt  
				(
					.d_a(reg_d_in[4:0]),
					.q_b(reg_d_rgt[4:0]),
					.l1clk(wen_clk_rgt)
				);

// BLB for rid_lft and rid_rgt:

n2_l2t_sp_28kb_cust_tisram_blb_macro__dmsff_4x__width_1 lat_rid_lft  
				(
					.d_a(rid_lft),
					.q_b(rid_lft_b),
					.l1clk(l1clk_int_v1)
				);

n2_l2t_sp_28kb_cust_tisram_blb_macro__dmsff_4x__width_1 lat_rid_rgt  
				(
					.d_a(rid_rgt),
					.q_b(rid_rgt_b),
					.l1clk(l1clk_int_v1)
				);


n2_l2t_sp_28kb_cust_tisram_msff_macro__width_1  reg_addr_b_8  (.scan_in (reg_addr_b_8_scanin), .scan_out(reg_addr_b_8_scanout),
                                              .latout(addr_b[8]), .latout_l(reg_addr_b_8_unused), .l1clk(l1clk_in), .d(index_a[8]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_tisram_msff_macro__width_1  reg_addr_b_7  (.scan_in (reg_addr_b_7_scanin), .scan_out(reg_addr_b_7_scanout),
                                              .latout(addr_b[7]), .latout_l(reg_addr_b_7_unused), .l1clk(l1clk_in), .d(index_a[7]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_tisram_msff_macro__width_1  reg_addr_b_6  (.scan_in (reg_addr_b_6_scanin), .scan_out(reg_addr_b_6_scanout),
                                              .latout(addr_b[6]), .latout_l(reg_addr_b_6_unused), .l1clk(l1clk_in), .d(index_a[6]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_tisram_msff_macro__width_1  reg_addr_b_5  (.scan_in (reg_addr_b_5_scanin), .scan_out(reg_addr_b_5_scanout),
                                              .latout(addr_b[5]), .latout_l(reg_addr_b_5_unused), .l1clk(l1clk_in), .d(index_a[5]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_tisram_msff_macro__width_1  reg_addr_b_4  (.scan_in (reg_addr_b_4_scanin), .scan_out(reg_addr_b_4_scanout),
                                              .latout(addr_b[4]), .latout_l(reg_addr_b_4_unused), .l1clk(l1clk_in), .d(index_a[4]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_tisram_msff_macro__width_1  reg_addr_b_3  (.scan_in (reg_addr_b_3_scanin), .scan_out(reg_addr_b_3_scanout),
                                              .latout(addr_b[3]), .latout_l(reg_addr_b_3_unused), .l1clk(l1clk_in), .d(index_a[3]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_tisram_msff_macro__width_1  reg_addr_b_2  (.scan_in (reg_addr_b_2_scanin), .scan_out(reg_addr_b_2_scanout),
                                              .latout(addr_b[2]), .latout_l(reg_addr_b_2_unused), .l1clk(l1clk_in), .d(index_a[2]),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_tisram_msff_macro__width_1  reg_addr_b_1  (.scan_in (reg_addr_b_1_scanin), .scan_out(reg_addr_b_1_scanout),
                                              .latout(addr_b[1]), .latout_l(reg_addr_b_1_unused), .l1clk(l1clk_in), .d(index_a[1]),
  .siclk(siclk),
  .soclk(soclk));

n2_l2t_sp_28kb_cust_tisram_msff_macro__width_1  reg_addr_b_0  (.scan_in (reg_addr_b_0_scanin),    .scan_out(reg_addr_b_0_scanout),
                                              .latout(addr_b[0]),   .latout_l(reg_addr_b_0_unused), .l1clk(l1clk_in), .d(index_a[0]),
  .siclk(siclk),
  .soclk(soclk));

n2_l2t_sp_28kb_cust_tisram_msff_macro__width_2 reg_wr_way_b  (
                                        .scan_in (reg_wr_way_b_scanin),
                                        .scan_out(reg_wr_way_b_scanout),
                                        .latout  (wr_way_b[1:0]),
                                        .latout_l(wr_way_b_l[1:0]),
                                        .l1clk(l1clk_in),
                                        .d(way_a[1:0]),
  .siclk(siclk),
  .soclk(soclk));

n2_l2t_sp_28kb_cust_tisram_msff_macro__width_1 reg_wr_en_b  (
                                        .scan_in (reg_wr_en_b_scanin),
                                        .scan_out(reg_wr_en_b_scanout),
                                        .latout(wr_en_b),
                                        .latout_l(reg_wr_en_b_unused),
                                        .l1clk(l1clk_in),
                                        .d(wr_en_a),
  .siclk(siclk),
  .soclk(soclk));

n2_l2t_sp_28kb_cust_tisram_msff_macro__width_1 reg_rd_en_b  (
                                        .scan_in (reg_rd_en_b_scanin),
                                        .scan_out(reg_rd_en_b_scanout),
                                        .latout(rd_en_b),
                                        .latout_l(reg_rd_en_b_unused),
                                        .l1clk(l1clk_in),
                                        .d(rd_en_a),
  .siclk(siclk),
  .soclk(soclk));

n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_wr_en_a  (
                                        .scan_in(reg_wr_en_a_scanin),
                                        .scan_out(reg_wr_en_a_scanout),
                                        .dout(wr_en_d1_a),
                                        .l1clk(l1clk_in),
                                        .din(wr_en_a),
  .siclk(siclk),
  .soclk(soclk));

n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_rd_en_a  (
                                        .scan_in(reg_rd_en_a_scanin),
                                        .scan_out(reg_rd_en_a_scanout),
                                        .dout(rd_en_d1_a),
                                        .l1clk(l1clk_in),
                                        .din(rd_en_a),
  .siclk(siclk),
  .soclk(soclk));

//-----------------------------------------------------------
//			output
//-----------------------------------------------------------

n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_27  (.scan_in(reg_tag_way1_27_scanin), .scan_out(reg_tag_way1_27_scanout),
                                           .din(sao_mx1[27]), .dout(tag_way1[27]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_27  (.scan_in(reg_tag_way0_27_scanin), .scan_out(reg_tag_way0_27_scanout),
                                           .din(sao_mx0[27]), .dout(tag_way0[27]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_26  (.scan_in(reg_tag_way1_26_scanin), .scan_out(reg_tag_way1_26_scanout),
                                           .din(sao_mx1[26]), .dout(tag_way1[26]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_26  (.scan_in(reg_tag_way0_26_scanin), .scan_out(reg_tag_way0_26_scanout),
                                           .din(sao_mx0[26]), .dout(tag_way0[26]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_25  (.scan_in(reg_tag_way1_25_scanin), .scan_out(reg_tag_way1_25_scanout),
                                           .din(sao_mx1[25]), .dout(tag_way1[25]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_25  (.scan_in(reg_tag_way0_25_scanin), .scan_out(reg_tag_way0_25_scanout),
                                           .din(sao_mx0[25]), .dout(tag_way0[25]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_24  (.scan_in(reg_tag_way1_24_scanin), .scan_out(reg_tag_way1_24_scanout),
                                           .din(sao_mx1[24]), .dout(tag_way1[24]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_24  (.scan_in(reg_tag_way0_24_scanin), .scan_out(reg_tag_way0_24_scanout),
                                           .din(sao_mx0[24]), .dout(tag_way0[24]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_23  (.scan_in(reg_tag_way1_23_scanin), .scan_out(reg_tag_way1_23_scanout),
                                           .din(sao_mx1[23]), .dout(tag_way1[23]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_23  (.scan_in(reg_tag_way0_23_scanin), .scan_out(reg_tag_way0_23_scanout),
                                           .din(sao_mx0[23]), .dout(tag_way0[23]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_22  (.scan_in(reg_tag_way1_22_scanin), .scan_out(reg_tag_way1_22_scanout),
                                           .din(sao_mx1[22]), .dout(tag_way1[22]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_22  (.scan_in(reg_tag_way0_22_scanin), .scan_out(reg_tag_way0_22_scanout),
                                           .din(sao_mx0[22]), .dout(tag_way0[22]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_21  (.scan_in(reg_tag_way1_21_scanin), .scan_out(reg_tag_way1_21_scanout),
                                           .din(sao_mx1[21]), .dout(tag_way1[21]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_21  (.scan_in(reg_tag_way0_21_scanin), .scan_out(reg_tag_way0_21_scanout),
                                           .din(sao_mx0[21]), .dout(tag_way0[21]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_20  (.scan_in(reg_tag_way1_20_scanin), .scan_out(reg_tag_way1_20_scanout),
                                           .din(sao_mx1[20]), .dout(tag_way1[20]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_20  (.scan_in(reg_tag_way0_20_scanin), .scan_out(reg_tag_way0_20_scanout),
                                           .din(sao_mx0[20]), .dout(tag_way0[20]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_19  (.scan_in(reg_tag_way1_19_scanin), .scan_out(reg_tag_way1_19_scanout),
                                           .din(sao_mx1[19]), .dout(tag_way1[19]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_19  (.scan_in(reg_tag_way0_19_scanin), .scan_out(reg_tag_way0_19_scanout),
                                           .din(sao_mx0[19]), .dout(tag_way0[19]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_18  (.scan_in(reg_tag_way1_18_scanin), .scan_out(reg_tag_way1_18_scanout),
                                           .din(sao_mx1[18]), .dout(tag_way1[18]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_18  (.scan_in(reg_tag_way0_18_scanin), .scan_out(reg_tag_way0_18_scanout),
                                           .din(sao_mx0[18]), .dout(tag_way0[18]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_17  (.scan_in(reg_tag_way1_17_scanin), .scan_out(reg_tag_way1_17_scanout),
                                           .din(sao_mx1[17]), .dout(tag_way1[17]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_17  (.scan_in(reg_tag_way0_17_scanin), .scan_out(reg_tag_way0_17_scanout),
                                           .din(sao_mx0[17]), .dout(tag_way0[17]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_16  (.scan_in(reg_tag_way1_16_scanin), .scan_out(reg_tag_way1_16_scanout),
                                           .din(sao_mx1[16]), .dout(tag_way1[16]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_16  (.scan_in(reg_tag_way0_16_scanin), .scan_out(reg_tag_way0_16_scanout),
                                           .din(sao_mx0[16]), .dout(tag_way0[16]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_15  (.scan_in(reg_tag_way1_15_scanin), .scan_out(reg_tag_way1_15_scanout),
                                           .din(sao_mx1[15]), .dout(tag_way1[15]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_15  (.scan_in(reg_tag_way0_15_scanin), .scan_out(reg_tag_way0_15_scanout),
                                           .din(sao_mx0[15]), .dout(tag_way0[15]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_14  (.scan_in(reg_tag_way1_14_scanin), .scan_out(reg_tag_way1_14_scanout),
                                           .din(sao_mx1[14]), .dout(tag_way1[14]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_14  (.scan_in(reg_tag_way0_14_scanin), .scan_out(reg_tag_way0_14_scanout),
                                           .din(sao_mx0[14]), .dout(tag_way0[14]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_13  (.scan_in(reg_tag_way1_13_scanin), .scan_out(reg_tag_way1_13_scanout),
                                           .din(sao_mx1[13]), .dout(tag_way1[13]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_13  (.scan_in(reg_tag_way0_13_scanin), .scan_out(reg_tag_way0_13_scanout),
                                           .din(sao_mx0[13]), .dout(tag_way0[13]), .l1clk(l1clk_out0),
  .siclk(siclk),
  .soclk(soclk));

n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_12  (.scan_in(reg_tag_way1_12_scanin), .scan_out(reg_tag_way1_12_scanout),
                                           .din(sao_mx1[12]), .dout(tag_way1[12]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_12  (.scan_in(reg_tag_way0_12_scanin), .scan_out(reg_tag_way0_12_scanout),
                                           .din(sao_mx0[12]), .dout(tag_way0[12]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_11  (.scan_in(reg_tag_way1_11_scanin), .scan_out(reg_tag_way1_11_scanout),
                                           .din(sao_mx1[11]), .dout(tag_way1[11]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_11  (.scan_in(reg_tag_way0_11_scanin), .scan_out(reg_tag_way0_11_scanout),
                                           .din(sao_mx0[11]), .dout(tag_way0[11]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_10  (.scan_in(reg_tag_way1_10_scanin), .scan_out(reg_tag_way1_10_scanout),
                                           .din(sao_mx1[10]), .dout(tag_way1[10]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_10  (.scan_in(reg_tag_way0_10_scanin), .scan_out(reg_tag_way0_10_scanout),
                                           .din(sao_mx0[10]), .dout(tag_way0[10]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_9  (.scan_in(reg_tag_way1_9_scanin), .scan_out(reg_tag_way1_9_scanout),
                                           .din(sao_mx1[9]), .dout(tag_way1[9]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_9  (.scan_in(reg_tag_way0_9_scanin), .scan_out(reg_tag_way0_9_scanout),
                                           .din(sao_mx0[9]), .dout(tag_way0[9]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_8  (.scan_in(reg_tag_way1_8_scanin), .scan_out(reg_tag_way1_8_scanout),
                                           .din(sao_mx1[8]), .dout(tag_way1[8]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_8  (.scan_in(reg_tag_way0_8_scanin), .scan_out(reg_tag_way0_8_scanout),
                                           .din(sao_mx0[8]), .dout(tag_way0[8]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_7  (.scan_in(reg_tag_way1_7_scanin), .scan_out(reg_tag_way1_7_scanout),
                                           .din(sao_mx1[7]), .dout(tag_way1[7]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_7  (.scan_in(reg_tag_way0_7_scanin), .scan_out(reg_tag_way0_7_scanout),
                                           .din(sao_mx0[7]), .dout(tag_way0[7]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_6  (.scan_in(reg_tag_way1_6_scanin), .scan_out(reg_tag_way1_6_scanout),
                                           .din(sao_mx1[6]), .dout(tag_way1[6]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_6  (.scan_in(reg_tag_way0_6_scanin), .scan_out(reg_tag_way0_6_scanout),
                                           .din(sao_mx0[6]), .dout(tag_way0[6]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_5  (.scan_in(reg_tag_way1_5_scanin), .scan_out(reg_tag_way1_5_scanout),
                                           .din(sao_mx1[5]), .dout(tag_way1[5]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_5  (.scan_in(reg_tag_way0_5_scanin), .scan_out(reg_tag_way0_5_scanout),
                                           .din(sao_mx0[5]), .dout(tag_way0[5]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_4  (.scan_in(reg_tag_way1_4_scanin), .scan_out(reg_tag_way1_4_scanout),
                                           .din(sao_mx1[4]), .dout(tag_way1[4]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_4  (.scan_in(reg_tag_way0_4_scanin), .scan_out(reg_tag_way0_4_scanout),
                                           .din(sao_mx0[4]), .dout(tag_way0[4]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_3  (.scan_in(reg_tag_way1_3_scanin), .scan_out(reg_tag_way1_3_scanout),
                                           .din(sao_mx1[3]), .dout(tag_way1[3]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_3  (.scan_in(reg_tag_way0_3_scanin), .scan_out(reg_tag_way0_3_scanout),
                                           .din(sao_mx0[3]), .dout(tag_way0[3]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_2  (.scan_in(reg_tag_way1_2_scanin), .scan_out(reg_tag_way1_2_scanout),
                                           .din(sao_mx1[2]), .dout(tag_way1[2]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_2  (.scan_in(reg_tag_way0_2_scanin), .scan_out(reg_tag_way0_2_scanout),
                                           .din(sao_mx0[2]), .dout(tag_way0[2]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_1  (.scan_in(reg_tag_way1_1_scanin), .scan_out(reg_tag_way1_1_scanout),
                                           .din(sao_mx1[1]), .dout(tag_way1[1]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_1  (.scan_in(reg_tag_way0_1_scanin), .scan_out(reg_tag_way0_1_scanout),
                                           .din(sao_mx0[1]), .dout(tag_way0[1]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way1_0  (.scan_in(reg_tag_way1_0_scanin), .scan_out(reg_tag_way1_0_scanout),
                                           .din(sao_mx1[0]), .dout(tag_way1[0]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 	reg_tag_way0_0  (.scan_in(reg_tag_way0_0_scanin), .scan_out(reg_tag_way0_0_scanout),
                                           .din(sao_mx0[0]), .dout(tag_way0[0]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));

n2_l2t_sp_28kb_cust_msffi_ctl_macro__clockwidth_0__width_1	reg_way_hit_a0   (.scan_in(reg_way_hit_a0_scanin), .scan_out(reg_way_hit_a0_scanout),
                                        .din(w0_cmp27to1), .q_l(way_hit_a[0]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));
n2_l2t_sp_28kb_cust_msffi_ctl_macro__clockwidth_0__width_1	reg_way_hit_a1   (.scan_in(reg_way_hit_a1_scanin), .scan_out(reg_way_hit_a1_scanout),
                                        .din(w1_cmp27to1), .q_l(way_hit_a[1]), .l1clk(l1clk_out1),
  .siclk(siclk),
  .soclk(soclk));


// =============== VERILOG-MODE AUTO TEMPLATES

/*

n2_l2t_array AUTO_TEMPLATE  (
                                .din(din[`L2T_ARR_D_WIDTH - 1 : 0]),
				.l1clk_internal_v1		(l1clk_int),
				.l1clk_internal_v2		(l1clk_int),

                           );

*/
// Manual scan hookup :

assign reg_tag_way1_27_scanin    = scan_in                  ;
assign reg_tag_way0_27_scanin    = reg_tag_way1_27_scanout  ;
assign reg_tag_way1_26_scanin    = reg_tag_way0_27_scanout  ;
assign reg_tag_way0_26_scanin    = reg_tag_way1_26_scanout  ;
assign reg_tag_way1_25_scanin    = reg_tag_way0_26_scanout  ;
assign reg_tag_way0_25_scanin    = reg_tag_way1_25_scanout  ;
assign reg_tag_way1_24_scanin    = reg_tag_way0_25_scanout  ;
assign reg_tag_way0_24_scanin    = reg_tag_way1_24_scanout  ;
assign reg_tag_way1_23_scanin    = reg_tag_way0_24_scanout  ;
assign reg_tag_way0_23_scanin    = reg_tag_way1_23_scanout  ;
assign reg_tag_way1_22_scanin    = reg_tag_way0_23_scanout  ;
assign reg_tag_way0_22_scanin    = reg_tag_way1_22_scanout  ;
assign reg_tag_way1_21_scanin    = reg_tag_way0_22_scanout  ;
assign reg_tag_way0_21_scanin    = reg_tag_way1_21_scanout  ; 
assign reg_tag_way1_20_scanin    = reg_tag_way0_21_scanout  ;
assign reg_tag_way0_20_scanin    = reg_tag_way1_20_scanout  ;
assign reg_tag_way1_19_scanin    = reg_tag_way0_20_scanout  ;
assign reg_tag_way0_19_scanin    = reg_tag_way1_19_scanout  ;
assign reg_tag_way1_18_scanin    = reg_tag_way0_19_scanout  ;
assign reg_tag_way0_18_scanin    = reg_tag_way1_18_scanout  ;
assign reg_tag_way1_17_scanin    = reg_tag_way0_18_scanout  ;
assign reg_tag_way0_17_scanin    = reg_tag_way1_17_scanout  ;
assign reg_tag_way1_16_scanin    = reg_tag_way0_17_scanout  ;
assign reg_tag_way0_16_scanin    = reg_tag_way1_16_scanout  ;
assign reg_tag_way1_15_scanin    = reg_tag_way0_16_scanout  ;
assign reg_tag_way0_15_scanin    = reg_tag_way1_15_scanout  ; 
assign reg_tag_way1_14_scanin    = reg_tag_way0_15_scanout  ;
assign reg_tag_way0_14_scanin    = reg_tag_way1_14_scanout  ;
assign reg_tag_way1_13_scanin    = reg_tag_way0_14_scanout  ;
assign reg_tag_way0_13_scanin    = reg_tag_way1_13_scanout  ;
 

assign reg_way_hit_a0_scanin     = reg_tag_way0_13_scanout  ;
assign reg_way_hit_a1_scanin     = reg_way_hit_a0_scanout   ;

assign reg_addr_b_8_scanin       = reg_way_hit_a1_scanout   ;
assign reg_addr_b_7_scanin       = reg_addr_b_8_scanout  ;
assign reg_addr_b_6_scanin       = reg_addr_b_7_scanout  ;
assign reg_addr_b_5_scanin       = reg_addr_b_6_scanout  ;
assign reg_addr_b_4_scanin       = reg_addr_b_5_scanout  ;
assign reg_addr_b_3_scanin       = reg_addr_b_4_scanout  ;
assign reg_addr_b_2_scanin       = reg_addr_b_3_scanout  ;
assign reg_addr_b_1_scanin       = reg_addr_b_2_scanout  ;

assign reg_wr_way_b_scanin       = reg_addr_b_1_scanout  ;
assign reg_addr_b_0_scanin       = reg_wr_way_b_scanout     ;
assign reg_wr_en_b_scanin        = reg_addr_b_0_scanout     ;
assign reg_rd_en_b_scanin        = reg_wr_en_b_scanout      ;
assign reg_wr_en_a_scanin        = reg_rd_en_b_scanout      ;
assign reg_rd_en_a_scanin        = reg_wr_en_a_scanout      ;

assign reg_tag_way1_12_scanin    = reg_rd_en_a_scanout     ;
assign reg_tag_way0_12_scanin    = reg_tag_way1_12_scanout ;
assign reg_tag_way1_11_scanin    = reg_tag_way0_12_scanout ;
assign reg_tag_way0_11_scanin    = reg_tag_way1_11_scanout ;
assign reg_tag_way1_10_scanin    = reg_tag_way0_11_scanout ; 
assign reg_tag_way0_10_scanin    = reg_tag_way1_10_scanout ;
assign reg_tag_way1_9_scanin     = reg_tag_way0_10_scanout ;
assign reg_tag_way0_9_scanin     = reg_tag_way1_9_scanout ;
assign reg_tag_way1_8_scanin     = reg_tag_way0_9_scanout ; 
assign reg_tag_way0_8_scanin     = reg_tag_way1_8_scanout ;
assign reg_tag_way1_7_scanin     = reg_tag_way0_8_scanout ; 
assign reg_tag_way0_7_scanin     = reg_tag_way1_7_scanout ;
assign reg_tag_way1_6_scanin     = reg_tag_way0_7_scanout ;  
assign reg_tag_way0_6_scanin     = reg_tag_way1_6_scanout ;  
assign reg_tag_way1_5_scanin     = reg_tag_way0_6_scanout ; 
assign reg_tag_way0_5_scanin     = reg_tag_way1_5_scanout ;
assign reg_tag_way1_4_scanin     = reg_tag_way0_5_scanout ;   
assign reg_tag_way0_4_scanin     = reg_tag_way1_4_scanout ;   
assign reg_tag_way1_3_scanin     = reg_tag_way0_4_scanout ;  
assign reg_tag_way0_3_scanin     = reg_tag_way1_3_scanout ;  
assign reg_tag_way1_2_scanin     = reg_tag_way0_3_scanout ; 
assign reg_tag_way0_2_scanin     = reg_tag_way1_2_scanout ;   
assign reg_tag_way1_1_scanin     = reg_tag_way0_2_scanout ;  
assign reg_tag_way0_1_scanin     = reg_tag_way1_1_scanout ;  
assign reg_tag_way1_0_scanin     = reg_tag_way0_1_scanout ; 
assign reg_tag_way0_0_scanin     = reg_tag_way1_0_scanout ;  
                                  
assign scan_out                  = reg_tag_way0_0_scanout ;
endmodule




//
//   nor macro for ports = 2,3
//
//





module n2_l2t_sp_28kb_cust_nor_macro__ports_3__width_1 (
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
//   nand macro for ports = 2,3,4
//
//





module n2_l2t_sp_28kb_cust_nand_macro__ports_4__width_1 (
  din0, 
  din1, 
  din2, 
  din3, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  input [0:0] din3;
  output [0:0] dout;






nand4 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.in3(din3[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module n2_l2t_sp_28kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_5 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [4:0] din0;
  input sel0;
  input [4:0] din1;
  input sel1;
  output [4:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(5)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[4:0]),
  .in1(din1[4:0]),
.dout(dout[4:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module n2_l2t_sp_28kb_cust_mux_macro__mux_aonpe__ports_2__stack_156c__width_2 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [1:0] din0;
  input sel0;
  input [1:0] din1;
  input sel1;
  output [1:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(2)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[1:0]),
  .in1(din1[1:0]),
.dout(dout[1:0])
);









  



endmodule


//
//   invert macro
//
//





module n2_l2t_sp_28kb_cust_inv_macro__width_5 (
  din, 
  dout);
  input [4:0] din;
  output [4:0] dout;






inv #(5)  d0_0 (
.in(din[4:0]),
.out(dout[4:0])
);









endmodule





`define L2T_ARR_D_WIDTH            28
`define L2T_ARR_DEPTH              512
`define WAY_HIT_WIDTH              16
`define BADREAD                	   BADBADD 


`define  sh_index_lft		  5'b00000
`define  sh_index_rgt		  5'b00000

module n2_l2t_array (
  din, 
  addr_b, 
  l1clk_internal_v1, 
  l1clk_internal_v2, 
  ln1clk, 
  ln2clk, 
  rd_en_b, 
  rd_en_d1_a, 
  rpda_lft, 
  rpda_rgt, 
  rpdb_lft, 
  rpdb_rgt, 
  rpdc_lft, 
  rpdc_rgt, 
  w_inhibit_l, 
  wr_en_b, 
  wr_en_d1_a, 
  wr_way_b, 
  wr_way_b_l, 
  vnw_ary, 
  sao_mx0_h, 
  sao_mx0_l, 
  sao_mx1_h, 
  sao_mx1_l);
wire ln1clk_unused;
wire ln2clk_unused;
wire l1clk_int_v2_unused;
wire rd_en_b_unused;
wire wr_en_b_unused;
wire [1:0] wr_way_b_unused;
wire l1clk_int;
wire rd_en;
wire [4:0] sf_l;
wire [4:0] sf_r;
wire shift_en_lft;
wire shift_en_rgt;
wire redundancy_en;
wire [4:0] sh_index_lft;
wire [4:0] sh_index_rgt;
wire mem_wr_en0;
wire mem_wr_en1;


//   input         l2clk;                  // cmp clock
//   input         iol2clk;                  // io clock
//   input         scan_in;
//   input         tcu_pce_ov;            // scan signals
//   input         tcu_clk_stop;
//   input         tcu_aclk;
//   input         tcu_bclk;
//   input         tcu_scan_en;
//   input         tcu_muxtest;
//   input         tcu_dectest;
//   output        scan_out;


input	[`L2T_ARR_D_WIDTH - 1:0]	din;
input	[8:0]	 			addr_b;
input		 			l1clk_internal_v1;
input		 			l1clk_internal_v2;
input		 			ln1clk;
input		 			ln2clk;
input		 			rd_en_b;
input		 			rd_en_d1_a;
input	[1:0]	 			rpda_lft;
input	[1:0]	 			rpda_rgt;
input	[3:0]	 			rpdb_lft;
input	[3:0]	 			rpdb_rgt;
input	[3:0]	 			rpdc_lft;
input	[3:0]	 			rpdc_rgt;
input		 			w_inhibit_l;
input		 			wr_en_b;
input		 			wr_en_d1_a;
input   [1:0]	 			wr_way_b;
input   [1:0]	 			wr_way_b_l;

// Added vnw_ary pin for n2 for 2.0

input                                   vnw_ary;

output  [`L2T_ARR_D_WIDTH - 1:0]	sao_mx0_h;
output  [`L2T_ARR_D_WIDTH - 1:0]	sao_mx0_l;
output  [`L2T_ARR_D_WIDTH - 1:0]	sao_mx1_h;
output  [`L2T_ARR_D_WIDTH - 1:0]	sao_mx1_l;


reg 	[`L2T_ARR_D_WIDTH + 2:0]    	mem_lft[`L2T_ARR_DEPTH - 1 :0];	//one extra bit for redundancy
reg 	[0:`L2T_ARR_D_WIDTH - 2]    	mem_rgt[`L2T_ARR_DEPTH - 1 :0];
reg 	[`L2T_ARR_D_WIDTH + 2:0]    	mem_lft_reg ;
reg 	[0:`L2T_ARR_D_WIDTH - 2]    	mem_rgt_reg ; 			// one entry of the memonry


reg  	[`L2T_ARR_D_WIDTH + 2:0]	mem_data_lft;
reg  	[0:`L2T_ARR_D_WIDTH - 2]	mem_data_rgt;

reg  	[14:0]				rdata0_lft;
reg  	[14:0]				rdata1_lft;
reg  	[0:12]				rdata0_rgt;
reg  	[0:12]				rdata1_rgt;
reg  	[30:0]				wdata_lft;
reg  	[30:0]				wdata_rgt;
reg  	[29:0]				tmp_lft;
reg  	[25:0]				tmp_rgt;

wire  	[14:0]				mem0_lft;
wire  	[14:0]				mem1_lft;
wire  	[12:0]				mem0_rgt;
wire  	[12:0]				mem1_rgt;
wire  	[30:0]				mem_all_lft;
wire  	[26:0]				mem_all_rgt;
wire  	[30:0]				rdata_out_lft;
wire  	[26:0]				rdata_out_rgt;
integer				 	i;
integer				 	j;
integer				 	l;
integer				 	k;

reg  	[`L2T_ARR_D_WIDTH - 1:0] sao_mx0_h ;	
reg  	[`L2T_ARR_D_WIDTH - 1:0] sao_mx0_l ;	
reg  	[`L2T_ARR_D_WIDTH - 1:0] sao_mx1_h ;	
reg  	[`L2T_ARR_D_WIDTH - 1:0] sao_mx1_l ;	

wire  	[`L2T_ARR_D_WIDTH - 1:0] rdata0_out ;	
wire  	[`L2T_ARR_D_WIDTH - 1:0] rdata1_out ;	
//-----------------------------------------------------------------
//	  	INITIALIZE MEMORY	
//-----------------------------------------------------------------
`ifndef NOINITMEM
initial begin
	for (i = 0; i < `L2T_ARR_DEPTH - 1; i = i + 1)
          begin
             mem_rgt[i]=27'h0;
             mem_lft[i]=31'h0;
          end
	end
`endif


//-----------------------------------------------------------------
//	  	UNUSED SIGNALS	
//-----------------------------------------------------------------
assign	ln1clk_unused		= ln1clk;
assign	ln2clk_unused		= ln2clk;
assign	l1clk_int_v2_unused	= l1clk_internal_v2;
assign	rd_en_b_unused		= rd_en_b;
assign	wr_en_b_unused		= wr_en_b;
assign	wr_way_b_unused[1:0]	= wr_way_b_l[1:0];


assign	l1clk_int		= l1clk_internal_v1;

//-----------------------------------------------------------------
//	 	OUTPUTS	
//-----------------------------------------------------------------
//
//always @ (l1clk_int or rd_en)
//  if (l1clk_int || ~rd_en)	
//    begin
//	sao_mx0_h [`L2T_ARR_D_WIDTH - 1:0] <=   28'h0;
//	sao_mx0_l [`L2T_ARR_D_WIDTH - 1:0] <=   28'h0;
//	sao_mx1_h [`L2T_ARR_D_WIDTH - 1:0] <=   28'h0;
//	sao_mx1_l [`L2T_ARR_D_WIDTH - 1:0] <=   28'h0;
//    end
//
//-----------------------------------------------------------------
//	  	INTERNAL LOGIC	
//-----------------------------------------------------------------
// Add vnw_ary high check for read operation for n2_to_2.0
// assign rd_en =  rd_en_d1_a && ~wr_en_d1_a && w_inhibit_l;
  assign rd_en =  rd_en_d1_a && ~wr_en_d1_a && w_inhibit_l && vnw_ary;

//-----------------------------------------------------------------
//			REDUNDANCY
//-----------------------------------------------------------------
// Use [511:0] way0[29] as the redundancy bit, there are total 512 redundancy
// bits. 
// Left side  :	way0_tmp[29:15] = mem0_lft[14:0]
//	       	way1_tmp[27:13] = mem1_lft[14:0]
//	       	way0_tmp[14]    = red_bit_lft     (redundancy bit)	
//	Shift mem1_lft[n] -> mem0_lft[n] , shift mem0_lft[n]->men1_rgt[n-1]
// 			 mem0_lft[0]->redundancy bit = red_bit_lft.
//
// Right side : way0_tmp[12:0] = mem0_rgt[12:0]
//	       	way1_tmp[12:0] = mem1_rgt[12:0]
//	       	way0_tmp[13]    = red_bit_rgt     (redundancy bit)	
//	Shift mem1_rgt[n] -> mem0_rgt[n] , shift mem0_rgt[n]->men1_rgt[n+1]
// 			 mem0_rgt[0]->redundancy bit = red_bit_rgt.
//
//-----------------------------------------------------------------

//-----------------------------------------------------------------
// recover the shift index from rpda, rpdb, rpdc
//-----------------------------------------------------------------
assign  sf_l[4]				= rpda_lft[1] ;
assign  sf_l[3:2]			= rpdb_lft[3] ? 2'b11 :
					  rpdb_lft[2] ? 2'b10 :
					  rpdb_lft[1] ? 2'b01 : 
					  2'b00;
assign  sf_l[1:0]			= rpdc_lft[3] ? 2'b11 :
					  rpdc_lft[2] ? 2'b10 :
					  rpdc_lft[1] ? 2'b01 : 
					  2'b00;

assign  sf_r[4]				= rpda_rgt[1] ;
assign  sf_r[3:2]			= rpdb_rgt[3] ? 2'b11 :
					  rpdb_rgt[2] ? 2'b10 :
					  rpdb_rgt[1] ? 2'b01 : 
					  2'b00;
assign  sf_r[1:0]			= rpdc_rgt[3] ? 2'b11 :
					  rpdc_rgt[2] ? 2'b10 :
					  rpdc_rgt[1] ? 2'b01 : 
					  2'b00;

assign  shift_en_lft			= (sf_l[4:0] < 5'd30) ? (|rpda_lft[1:0]) && (|rpdb_lft[3:0]) && (|rpdc_lft[3:0]) : 1'b0;
assign  shift_en_rgt			= (sf_r[4:0] < 5'd26) ? (|rpda_rgt[1:0]) && (|rpdb_rgt[3:0]) && (|rpdc_rgt[3:0]) : 1'b0;

assign  redundancy_en			= shift_en_lft || shift_en_rgt;

assign  sh_index_lft[4:0]		= shift_en_lft && (sf_l[4:0] < 5'd30) ? sf_l[4:0] : 5'b00000;
assign  sh_index_rgt[4:0]		= shift_en_rgt && (sf_r[4:0] < 5'd26) ? sf_r[4:0] : 5'b00000;



//-----------------------------------------------------------------
//		Write Arrays 
//-----------------------------------------------------------------


//--------------------------------------
//  Write Redundancy Mapping
//--------------------------------------
// Shifting of redundancy base on the sh_index_lft and sh_index_rgt

wire [14:0]	din_lft 	;
wire [0:12]	din_rgt 	;
assign din_lft[14:0]	= din[27:13];
assign din_rgt[0:12]	= din[12:0];

// Add vnw_high check for write operation (implemented for n2_to_2.0)

assign mem_wr_en0	= wr_way_b[0] &&   wr_en_b && ~rd_en_b && w_inhibit_l && wr_en_d1_a && vnw_ary;
assign mem_wr_en1	= wr_way_b[1] &&   wr_en_b && ~rd_en_b && w_inhibit_l && wr_en_d1_a && vnw_ary;




//-------left-------
always @ (sh_index_lft or  din_lft[14:0] or shift_en_lft or mem_wr_en0 or mem_wr_en1 
	  or l1clk_int or  addr_b[8:0] )


    #0

begin 


  mem_lft_reg[`L2T_ARR_D_WIDTH + 2:0] = mem_lft[addr_b] ;



// Write to redundant bit in write cycle for way0 with no redundancy
   if (l1clk_int && (~shift_en_lft) && mem_wr_en0) 
      begin	
          mem_lft_reg[0]      = din_lft[0];	
      end	  

  for (i=14; i >= 0; i=i-1)
  begin
    if (mem_wr_en0 && l1clk_int)		//way0
      begin
        if (( sh_index_lft < (2*i)) || ~shift_en_lft)
          mem_lft_reg[2*i+1]  = din_lft[i];	//no shift
	else
	 begin
          mem_lft_reg[2*i]  = din_lft[i];	// shift
	 end
      end
	  if(shift_en_lft)        
          mem_lft_reg[sh_index_lft+1]  = 1'bx;	// write "x" to bad bit
   end	//for   
	   
  for (i=14; i >= 0; i=i-1)
  begin
    if (mem_wr_en1 && l1clk_int )		//way1
      begin
        if (( sh_index_lft < (2*i + 1)) || ~shift_en_lft)
          mem_lft_reg[2*i+2]  = din_lft[i];	//no shift
	else
	begin
          mem_lft_reg[2*i+1]  = din_lft[i];	//shift
	end
      end
	  if(shift_en_lft)        
          mem_lft_reg[sh_index_lft+1]  = 1'bx;  //write "x" to bad bit 
  end	   

  if (l1clk_int)  mem_lft[addr_b] =  mem_lft_reg[`L2T_ARR_D_WIDTH + 2:0] ;


end

//-------right-------

always @ (sh_index_rgt or  din_rgt[0:12] or shift_en_rgt or mem_wr_en0 or mem_wr_en1 
	  or l1clk_int or  addr_b[8:0] )


    #0

begin 

  mem_rgt_reg[0 : `L2T_ARR_D_WIDTH - 2]  = mem_rgt[addr_b];



// Write to redundant bit in write cycle for way0 with no redundancy
   if (l1clk_int && (~shift_en_rgt) && mem_wr_en0) 
      begin	
          mem_rgt_reg[0]      = din_rgt[0];	
      end	  

  for (k=12; k >= 0; k=k-1)
  begin
    if (mem_wr_en0 && l1clk_int)		//WAY0
      begin
        if (( sh_index_rgt < (2*k )) || ~shift_en_rgt)
          mem_rgt_reg[2*k+1]  = din_rgt[k];	//no shift
	else
	 begin
          mem_rgt_reg[2*k]  = din_rgt[k];	// shift
	 end
      end
	  if(shift_en_rgt)        
          mem_rgt_reg[sh_index_rgt+1]   = 1'bx; // Write "X" to the bad bit
   end	//for   
	   
  for (k=12; k >= 0; k=k-1)
  begin
    if (mem_wr_en1 && l1clk_int )		//WAY1
      begin
        if (( sh_index_rgt < (2*k + 1)) || ~shift_en_rgt)
          mem_rgt_reg[2*k+2]  = din_rgt[k];	//no shift
	else
	 begin
          mem_rgt_reg[2*k+1]  = din_rgt[k];	// shift
	  end
      end
	  if(shift_en_rgt)        
          mem_rgt_reg[sh_index_rgt+1]   = 1'bx; // Write "X" to the bad bit
  end  //for	   

  if (l1clk_int) mem_rgt[addr_b] =  mem_rgt_reg[0 : `L2T_ARR_D_WIDTH - 2] ;



end

//-----------------------------------------------------------------
//		Read Arrays 
//-----------------------------------------------------------------

//--------------------------------------
//  Read Redundancy Mapping
//--------------------------------------


//---------Left--------------
always @ (sh_index_lft or  shift_en_lft or rd_en or l1clk_int or  addr_b[8:0] )
begin 	
  if (l1clk_int)		
  begin
  
    mem_data_lft[`L2T_ARR_D_WIDTH + 2:0] = ~rd_en ? 31'hx : mem_lft[addr_b] ;
  
  end


  if (rd_en && ~l1clk_int)


  begin	  

    for (j=14; j >= 0; j=j-1)	//WAY0	
    begin
        if (( sh_index_lft < (2*j )) || ~shift_en_lft)
	  rdata0_lft[j]	      	= mem_data_lft[2*j+1];  // no shift
	else
          rdata0_lft[j]  	= mem_data_lft[2*j];	// shift
     end	//for   
	   
    for (j=14; j >= 0; j=j-1)	//WAY1
      begin
        if (( sh_index_lft < (2*j + 1)) || ~shift_en_lft)
          rdata1_lft[j]  = mem_data_lft[2*j+2];	//no shift
	else
          rdata1_lft[j]  = mem_data_lft[2*j+1];	// shift
      end
      sao_mx0_h[27:13] =  rdata0_lft[14:0]  & {15{rd_en}};
      sao_mx0_l[27:13] = ~rdata0_lft[14:0]  & {15{rd_en}};
      sao_mx1_h[27:13] =  rdata1_lft[14:0]  & {15{rd_en}};
      sao_mx1_l[27:13] = ~rdata1_lft[14:0]  & {15{rd_en}};
  end	   
 else if(l1clk_int || ~rd_en)
	begin
	sao_mx0_h[27:13] = 15'h0;
      	sao_mx0_l[27:13] = 15'h0;
      	sao_mx1_h[27:13] = 15'h0;
      	sao_mx1_l[27:13] = 15'h0;
	end
end

//---------Right--------------

always @ (sh_index_rgt or  shift_en_rgt or rd_en or l1clk_int or  addr_b[8:0] )
	  
begin 	
  if (l1clk_int)		
  begin

    mem_data_rgt[0: `L2T_ARR_D_WIDTH - 2] = ~rd_en ? 27'hx : mem_rgt[addr_b] ;

  end 


  if (rd_en && ~l1clk_int)


    begin

    for (l=12; l >= 0; l=l-1)	//WAY0	
    begin
        if (( sh_index_rgt < (2*l)) || ~shift_en_rgt)
	  rdata0_rgt[l]	      	= mem_data_rgt[2*l+1];  // no shift
	else
          rdata0_rgt[l]  	= mem_data_rgt[2*l];	// shift
     end	//for   
	   
    for (l=12; l >= 0; l=l-1)	//WAY1
      begin
        if (( sh_index_rgt < (2*l + 1)) || ~shift_en_rgt)
          rdata1_rgt[l]  = mem_data_rgt[2*l+2];	//no shift
	else
          rdata1_rgt[l]  = mem_data_rgt[2*l+1];	// shift
      end
         sao_mx0_h[12:0] =  rdata0_rgt[0:12]  & {13{rd_en}};
         sao_mx0_l[12:0] = ~rdata0_rgt[0:12]  & {13{rd_en}};
         sao_mx1_h[12:0] =  rdata1_rgt[0:12]  & {13{rd_en}};
         sao_mx1_l[12:0] = ~rdata1_rgt[0:12]  & {13{rd_en}};
  end	   
  else if (l1clk_int || ~rd_en)
        begin
        sao_mx0_h[12:0] = 13'h0;
        sao_mx0_l[12:0] = 13'h0;
        sao_mx1_h[12:0] = 13'h0;
        sao_mx1_l[12:0] = 13'h0;
        end
end


endmodule



module n2_l2t_sr_latch (
  set, 
  reset, 
  out) ;


	input  		set;
	input  		reset;
	output 		out;

	reg 		out;

	always @(set or reset)
		begin
			if (reset) 	out=1'b0;
			else if (set)	out=1'b1;
		end
endmodule // n2_l2t_sr_latch	



// Compare sao_mx_h with lkuptag_d1, and sao_mx_l with ~lkuptag_d1. 
// Output is "0" for hit and "1" for miss

module n2_l2t_cmp_3bx2 (
  sao_mx1_h, 
  sao_mx1_l, 
  sao_mx0_h, 
  sao_mx0_l, 
  lkuptag_d1, 
  l1clk_d, 
  w1_cmp3b, 
  w0_cmp3b) ;


	input 	[2:0]	sao_mx1_h;
	input 	[2:0]	sao_mx1_l;
	input 	[2:0]	sao_mx0_h;
	input 	[2:0]	sao_mx0_l;
	input 	[2:0]	lkuptag_d1;
	input           l1clk_d;
	output          w1_cmp3b;
	output	        w0_cmp3b;

reg w1_cmp3b;
reg w0_cmp3b;

//Compare ouput is 0 for match and 1 for mismatch

	always @(l1clk_d or sao_mx1_h or sao_mx1_l or sao_mx0_h or sao_mx0_l or lkuptag_d1) 

	if (l1clk_d) // Precharge mode
           begin
             w1_cmp3b = 1'b0;
             w0_cmp3b = 1'b0;
           end		   
        else 	
	if (~l1clk_d ) // Evaluation mode 
	   begin 
	     w1_cmp3b = (lkuptag_d1[2] && sao_mx1_l[2]) || (~lkuptag_d1[2] && sao_mx1_h[2]) ||
	                (lkuptag_d1[1] && sao_mx1_l[1]) || (~lkuptag_d1[1] && sao_mx1_h[1]) ||
	                (lkuptag_d1[0] && sao_mx1_l[0]) || (~lkuptag_d1[0] && sao_mx1_h[0]);
			
	     w0_cmp3b = (lkuptag_d1[2] && sao_mx0_l[2]) || (~lkuptag_d1[2] && sao_mx0_h[2]) ||
	                (lkuptag_d1[1] && sao_mx0_l[1]) || (~lkuptag_d1[1] && sao_mx0_h[1]) ||
	                (lkuptag_d1[0] && sao_mx0_l[0]) || (~lkuptag_d1[0] && sao_mx0_h[0]);
           end
 
endmodule // n2_l2t_cmp_3bx2


//
//   macro for cl_mc1_tisram_blb_{8,4}x flops
//
//





module n2_l2t_sp_28kb_cust_tisram_blb_macro__dmsff_4x__width_2 (
  d_a, 
  l1clk, 
  q_b);
input [1:0] d_a;
input l1clk;
output [1:0] q_b;






tisram_blb #(2)  d0_0 (
.d(d_a[1:0]),
.l1clk(l1clk),
.latout_l(q_b[1:0])
);










//place::generic_place($width,$stack,$left);

endmodule





//
//   macro for cl_mc1_tisram_blb_{8,4}x flops
//
//





module n2_l2t_sp_28kb_cust_tisram_blb_macro__dmsff_4x__width_5 (
  d_a, 
  l1clk, 
  q_b);
input [4:0] d_a;
input l1clk;
output [4:0] q_b;






tisram_blb #(5)  d0_0 (
.d(d_a[4:0]),
.l1clk(l1clk),
.latout_l(q_b[4:0])
);










//place::generic_place($width,$stack,$left);

endmodule





//
//   macro for cl_mc1_tisram_blb_{8,4}x flops
//
//





module n2_l2t_sp_28kb_cust_tisram_blb_macro__dmsff_4x__width_1 (
  d_a, 
  l1clk, 
  q_b);
input [0:0] d_a;
input l1clk;
output [0:0] q_b;






tisram_blb #(1)  d0_0 (
.d(d_a[0:0]),
.l1clk(l1clk),
.latout_l(q_b[0:0])
);










//place::generic_place($width,$stack,$left);

endmodule





//
//   macro for cl_mc1_tisram_msff_{16,8}x flops
//
//





module n2_l2t_sp_28kb_cust_tisram_msff_macro__width_1 (
  d, 
  scan_in, 
  l1clk, 
  siclk, 
  soclk, 
  scan_out, 
  latout, 
  latout_l);
input [0:0] d;
  input scan_in;
input l1clk;
input siclk;
input soclk;
  output scan_out;
output [0:0] latout;
output [0:0] latout_l;






tisram_msff #(1)  d0_0 (
.d(d[0:0]),
.si(scan_in),
.so(scan_out),
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.latout(latout[0:0]),
.latout_l(latout_l[0:0])
);












//place::generic_place($width,$stack,$left);

endmodule





//
//   macro for cl_mc1_tisram_msff_{16,8}x flops
//
//





module n2_l2t_sp_28kb_cust_tisram_msff_macro__width_2 (
  d, 
  scan_in, 
  l1clk, 
  siclk, 
  soclk, 
  scan_out, 
  latout, 
  latout_l);
wire [0:0] so;

input [1:0] d;
  input scan_in;
input l1clk;
input siclk;
input soclk;
  output scan_out;
output [1:0] latout;
output [1:0] latout_l;






tisram_msff #(2)  d0_0 (
.d(d[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.latout(latout[1:0]),
.latout_l(latout_l[1:0])
);












//place::generic_place($width,$stack,$left);

endmodule









// any PARAMS parms go into naming of macro

module n2_l2t_sp_28kb_cust_msff_ctl_macro__width_1 (
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

module n2_l2t_sp_28kb_cust_msffi_ctl_macro__clockwidth_0__width_1 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  q_l, 
  scan_out);
  input [0:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] q_l;
  output scan_out;






msffi #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(din[0:0]),
.si(scan_in),
.so(scan_out),
.q_l(q_l[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module n2_l2t_sp_28kb_cust_msff_ctl_macro__width_6 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0];






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module n2_l2t_sp_28kb_cust_msff_ctl_macro__width_4 (
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








