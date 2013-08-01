// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: TagArray.v
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
module TagArray(L2_INT_RST);

parameter PSMPL = 5;

input L2_INT_RST;
integer i, way;
reg stuck_to0, stuck_to1, tarand_bit_flip;
integer r,m,rand_limit_hi,rand,rand1,rand2;
reg [23:0] inject_limit;
reg [7:0] RunTimer;
reg injectErr,start_injection;
reg [39:0] address;
reg[27:0] start_err,start_err1;
reg[27:0] tagEntry, errTagEntry;
reg [26:0] lkupTag;
wire [7:0]  rd_en,decdp_inst_int_or_inval_c1,inst_vld_c2_prev;
wire [319:0]  arbdp_addr_c1;
wire [215:0]  lkup_tag_d1;
wire [223:0] tag_way0_c1,tag_way1_c1,tag_way2_c1,tag_way3_c1;
wire [223:0]tag_way4_c1,tag_way5_c1,tag_way6_c1,tag_way7_c1;
wire [223:0] tag_way8_c1,tag_way9_c1,tag_way10_c1,tag_way11_c1;
wire [223:0] tag_way12_c1,tag_way13_c1,tag_way14_c1,tag_way15_c1;
wire  rd_en_0 , rd_en_1 , rd_en_2 , rd_en_3 , rd_en_4,rd_en_5 , rd_en_6 , rd_en_7;

wire [39:0]  arbdp_addr_c1_0 , arbdp_addr_c1_1 , arbdp_addr_c1_2 , arbdp_addr_c1_3 , arbdp_addr_c1_4 , arbdp_addr_c1_5 , arbdp_addr_c1_6 , arbdp_addr_c1_7;

wire decdp_inst_int_or_inval_c1_0 ,decdp_inst_int_or_inval_c1_1 ,decdp_inst_int_or_inval_c1_2 ,decdp_inst_int_or_inval_c1_3 ,decdp_inst_int_or_inval_c1_4 ,decdp_inst_int_or_inval_c1_5 ,decdp_inst_int_or_inval_c1_6 ,decdp_inst_int_or_inval_c1_7;

wire inst_vld_c2_prev_0 , inst_vld_c2_prev_1 ,inst_vld_c2_prev_2 ,inst_vld_c2_prev_3 , inst_vld_c2_prev_4 ,inst_vld_c2_prev_5 ,inst_vld_c2_prev_6 , inst_vld_c2_prev_7;

wire [26:0] lkup_tag_d1_0 ,lkup_tag_d1_1 , lkup_tag_d1_2 ,lkup_tag_d1_3 ,lkup_tag_d1_4 , lkup_tag_d1_5 ,lkup_tag_d1_6 ,lkup_tag_d1_7;

wire [27:0] tag_way0_c1_0 , tag_way0_c1_1 , tag_way0_c1_2 ,tag_way0_c1_3 , tag_way0_c1_4 , tag_way0_c1_5 , tag_way0_c1_6 ,tag_way0_c1_7;

wire [27:0] tag_way1_c1_0 , tag_way1_c1_1 , tag_way1_c1_2 ,tag_way1_c1_3 , tag_way1_c1_4 , tag_way1_c1_5 , tag_way1_c1_6 ,tag_way1_c1_7;

wire [27:0] tag_way2_c1_0 , tag_way2_c1_1 , tag_way2_c1_2 ,tag_way2_c1_3 , tag_way2_c1_4 , tag_way2_c1_5 , tag_way2_c1_6 ,tag_way2_c1_7;

wire [27:0] tag_way3_c1_0 , tag_way3_c1_1 , tag_way3_c1_2 ,tag_way3_c1_3 , tag_way3_c1_4 , tag_way3_c1_5 , tag_way3_c1_6 ,tag_way3_c1_7;

wire [27:0] tag_way4_c1_0 , tag_way4_c1_1 , tag_way4_c1_2 ,tag_way4_c1_3 , tag_way4_c1_4 , tag_way4_c1_5 , tag_way4_c1_6 ,tag_way4_c1_7;

wire [27:0] tag_way5_c1_0 , tag_way5_c1_1 , tag_way5_c1_2 ,tag_way5_c1_3 , tag_way5_c1_4 , tag_way5_c1_5 , tag_way5_c1_6 ,tag_way5_c1_7;

wire [27:0] tag_way6_c1_0 , tag_way6_c1_1 , tag_way6_c1_2 ,tag_way6_c1_3 , tag_way6_c1_4 , tag_way6_c1_5 , tag_way6_c1_6 ,tag_way6_c1_7;

wire [27:0] tag_way7_c1_0 , tag_way7_c1_1 , tag_way7_c1_2 ,tag_way7_c1_3 , tag_way7_c1_4 , tag_way7_c1_5 , tag_way7_c1_6 ,tag_way7_c1_7;

wire [27:0] tag_way8_c1_0 , tag_way8_c1_1 , tag_way8_c1_2 ,tag_way8_c1_3 , tag_way8_c1_4 , tag_way8_c1_5 , tag_way8_c1_6 ,tag_way8_c1_7;

wire [27:0] tag_way9_c1_0 , tag_way9_c1_1 , tag_way9_c1_2 ,tag_way9_c1_3 , tag_way9_c1_4 , tag_way9_c1_5 , tag_way9_c1_6 ,tag_way9_c1_7;

wire [27:0] tag_way10_c1_0 , tag_way10_c1_1 , tag_way10_c1_2 ,tag_way10_c1_3 , tag_way10_c1_4 , tag_way10_c1_5 , tag_way10_c1_6 ,tag_way10_c1_7;

wire [27:0] tag_way11_c1_0 , tag_way11_c1_1 , tag_way11_c1_2 ,tag_way11_c1_3 , tag_way11_c1_4 , tag_way11_c1_5 , tag_way11_c1_6 ,tag_way11_c1_7;

wire [27:0] tag_way12_c1_0 , tag_way12_c1_1 , tag_way12_c1_2 ,tag_way12_c1_3 , tag_way12_c1_4 , tag_way12_c1_5 , tag_way12_c1_6 ,tag_way12_c1_7;

wire [27:0] tag_way13_c1_0 , tag_way13_c1_1 , tag_way13_c1_2 ,tag_way13_c1_3 , tag_way13_c1_4 , tag_way13_c1_5 , tag_way13_c1_6 ,tag_way13_c1_7;

wire [27:0] tag_way14_c1_0 , tag_way14_c1_1 , tag_way14_c1_2 ,tag_way14_c1_3 , tag_way14_c1_4 , tag_way14_c1_5 , tag_way14_c1_6 ,tag_way14_c1_7;

wire [27:0] tag_way15_c1_0 , tag_way15_c1_1 , tag_way15_c1_2 ,tag_way15_c1_3 , tag_way15_c1_4 , tag_way15_c1_5 , tag_way15_c1_6 ,tag_way15_c1_7;





assign rd_en = {rd_en_7 , rd_en_6 , rd_en_5 , rd_en_4 ,rd_en_3,rd_en_2 , rd_en_1 , rd_en_0 };

assign arbdp_addr_c1  = {arbdp_addr_c1_7 , arbdp_addr_c1_6 , arbdp_addr_c1_5 , arbdp_addr_c1_4 , arbdp_addr_c1_3 , arbdp_addr_c1_2 , arbdp_addr_c1_1 , arbdp_addr_c1_0};

assign decdp_inst_int_or_inval_c1 = {decdp_inst_int_or_inval_c1_7 , decdp_inst_int_or_inval_c1_6 ,decdp_inst_int_or_inval_c1_5 ,decdp_inst_int_or_inval_c1_4 , decdp_inst_int_or_inval_c1_3 ,decdp_inst_int_or_inval_c1_2 , decdp_inst_int_or_inval_c1_1 ,decdp_inst_int_or_inval_c1_0 };


assign inst_vld_c2_prev  = {inst_vld_c2_prev_7 , inst_vld_c2_prev_6 ,inst_vld_c2_prev_5 , inst_vld_c2_prev_4 , inst_vld_c2_prev_3 ,inst_vld_c2_prev_2 , inst_vld_c2_prev_1 , inst_vld_c2_prev_0};

assign lkup_tag_d1 = {lkup_tag_d1_7 ,lkup_tag_d1_6 , lkup_tag_d1_5 ,lkup_tag_d1_4 , lkup_tag_d1_3 , lkup_tag_d1_2 ,lkup_tag_d1_1 ,lkup_tag_d1_0};


assign tag_way0_c1  = {tag_way0_c1_7 , tag_way0_c1_6 , tag_way0_c1_5 ,tag_way0_c1_4 , tag_way0_c1_3 , tag_way0_c1_2 , tag_way0_c1_1 ,tag_way0_c1_0 };

assign tag_way1_c1  = {tag_way1_c1_7 , tag_way1_c1_6 , tag_way1_c1_5 , tag_way1_c1_4 , tag_way1_c1_3 , tag_way1_c1_2 , tag_way1_c1_1 ,tag_way1_c1_0 };

assign tag_way2_c1  = {tag_way2_c1_7 , tag_way2_c1_6 , tag_way2_c1_5 , tag_way2_c1_4 , tag_way2_c1_3 , tag_way2_c1_2 , tag_way2_c1_1 ,tag_way2_c1_0 };

assign tag_way3_c1  ={tag_way3_c1_7 , tag_way3_c1_6 , tag_way3_c1_5 , tag_way3_c1_4 , tag_way3_c1_3 , tag_way3_c1_2 , tag_way3_c1_1 , tag_way3_c1_0 };

assign tag_way4_c1 ={tag_way4_c1_7 ,tag_way4_c1_6 ,tag_way4_c1_5 ,tag_way4_c1_4 , tag_way4_c1_3 , tag_way4_c1_2 , tag_way4_c1_1 ,tag_way4_c1_0};

assign tag_way5_c1 ={tag_way5_c1_7 , tag_way5_c1_6 ,tag_way5_c1_5 , tag_way5_c1_4 , tag_way5_c1_3 , tag_way5_c1_2 , tag_way5_c1_1 ,tag_way5_c1_0};


assign tag_way6_c1 ={tag_way6_c1_7 , tag_way6_c1_6 ,tag_way6_c1_5 ,tag_way6_c1_4 , tag_way6_c1_3 , tag_way6_c1_2 , tag_way6_c1_1 ,tag_way6_c1_0 };

assign tag_way7_c1  = {tag_way7_c1_7 ,tag_way7_c1_6 ,tag_way7_c1_5 ,tag_way7_c1_4 , tag_way7_c1_3 , tag_way7_c1_2 , tag_way7_c1_1 ,tag_way7_c1_0 };

assign tag_way8_c1 ={tag_way8_c1_7 , tag_way8_c1_6 ,tag_way8_c1_5 ,tag_way8_c1_4 , tag_way8_c1_3 , tag_way8_c1_2 , tag_way8_c1_1 ,tag_way8_c1_0 };

assign tag_way9_c1 = {tag_way9_c1_7 , tag_way9_c1_6 ,tag_way9_c1_5 ,tag_way9_c1_4 , tag_way9_c1_3 , tag_way9_c1_2 , tag_way9_c1_1 ,tag_way9_c1_0 };

assign tag_way10_c1 ={tag_way10_c1_7 , tag_way10_c1_6 ,tag_way10_c1_5 , tag_way10_c1_4 , tag_way10_c1_3 , tag_way10_c1_2 , tag_way10_c1_1 ,tag_way10_c1_0 };

assign tag_way11_c1 ={tag_way11_c1_7 , tag_way11_c1_6 ,tag_way11_c1_5 , tag_way11_c1_4 , tag_way11_c1_3 , tag_way11_c1_2 , tag_way11_c1_1 ,tag_way11_c1_0 };

assign tag_way12_c1 ={tag_way12_c1_7 , tag_way12_c1_6 ,tag_way12_c1_5 , tag_way12_c1_4 , tag_way12_c1_3 , tag_way12_c1_2 , tag_way12_c1_1 ,tag_way12_c1_0 };

assign tag_way13_c1  ={tag_way13_c1_7 , tag_way13_c1_6 ,tag_way13_c1_5 , tag_way13_c1_4 , tag_way13_c1_3 , tag_way13_c1_2 ,tag_way13_c1_1 , tag_way13_c1_0 };

assign tag_way14_c1 ={tag_way14_c1_7 , tag_way14_c1_6 ,tag_way14_c1_5 ,tag_way14_c1_4 , tag_way14_c1_3 , tag_way14_c1_2 , tag_way14_c1_1 ,tag_way14_c1_0};

assign tag_way15_c1  ={tag_way15_c1_7 , tag_way15_c1_6 , tag_way15_c1_5 , tag_way15_c1_4 , tag_way15_c1_3 , tag_way15_c1_2 , tag_way15_c1_1 ,tag_way15_c1_0};




assign rd_en_0 = tb_top.cpu.l2t0.tag.rd_en0;
assign rd_en_1 = tb_top.cpu.l2t1.tag.rd_en0;
assign rd_en_2 = tb_top.cpu.l2t2.tag.rd_en0;
assign rd_en_3 = tb_top.cpu.l2t3.tag.rd_en0;
assign rd_en_4 = tb_top.cpu.l2t4.tag.rd_en0;
assign rd_en_5 = tb_top.cpu.l2t5.tag.rd_en0;
assign rd_en_6 = tb_top.cpu.l2t6.tag.rd_en0;
assign rd_en_7 = tb_top.cpu.l2t7.tag.rd_en0;

assign arbdp_addr_c1_0 = tb_top.cpu.l2t0.arbadr.arbdp_addr_c1_1;
assign arbdp_addr_c1_1 = tb_top.cpu.l2t1.arbadr.arbdp_addr_c1_1;
assign arbdp_addr_c1_2 = tb_top.cpu.l2t2.arbadr.arbdp_addr_c1_1;
assign arbdp_addr_c1_3 = tb_top.cpu.l2t3.arbadr.arbdp_addr_c1_1;
assign arbdp_addr_c1_4 = tb_top.cpu.l2t4.arbadr.arbdp_addr_c1_1;
assign arbdp_addr_c1_5 = tb_top.cpu.l2t5.arbadr.arbdp_addr_c1_1;
assign arbdp_addr_c1_6 = tb_top.cpu.l2t6.arbadr.arbdp_addr_c1_1;
assign arbdp_addr_c1_7 = tb_top.cpu.l2t7.arbadr.arbdp_addr_c1_1;


assign decdp_inst_int_or_inval_c1_0 = tb_top.cpu.l2t0.arb.decdp_inst_int_or_inval_c1;
assign decdp_inst_int_or_inval_c1_1 = tb_top.cpu.l2t1.arb.decdp_inst_int_or_inval_c1;    
assign decdp_inst_int_or_inval_c1_2 = tb_top.cpu.l2t2.arb.decdp_inst_int_or_inval_c1; 
assign decdp_inst_int_or_inval_c1_3 = tb_top.cpu.l2t3.arb.decdp_inst_int_or_inval_c1;
assign decdp_inst_int_or_inval_c1_4 = tb_top.cpu.l2t4.arb.decdp_inst_int_or_inval_c1;
assign decdp_inst_int_or_inval_c1_5 = tb_top.cpu.l2t5.arb.decdp_inst_int_or_inval_c1;
assign decdp_inst_int_or_inval_c1_6 = tb_top.cpu.l2t6.arb.decdp_inst_int_or_inval_c1;
assign decdp_inst_int_or_inval_c1_7 = tb_top.cpu.l2t7.arb.decdp_inst_int_or_inval_c1;


assign inst_vld_c2_prev_0 = tb_top.cpu.l2t0.arb.inst_vld_c2_prev;
assign inst_vld_c2_prev_1 = tb_top.cpu.l2t1.arb.inst_vld_c2_prev;
assign inst_vld_c2_prev_2 = tb_top.cpu.l2t2.arb.inst_vld_c2_prev;
assign inst_vld_c2_prev_3 = tb_top.cpu.l2t3.arb.inst_vld_c2_prev;
assign inst_vld_c2_prev_4 = tb_top.cpu.l2t4.arb.inst_vld_c2_prev;
assign inst_vld_c2_prev_5 = tb_top.cpu.l2t5.arb.inst_vld_c2_prev;
assign inst_vld_c2_prev_6 = tb_top.cpu.l2t6.arb.inst_vld_c2_prev;
assign inst_vld_c2_prev_7 = tb_top.cpu.l2t7.arb.inst_vld_c2_prev;

assign lkup_tag_d1_0 = tb_top.cpu.l2t0.tag.lkup_tag0[27:1];
assign lkup_tag_d1_1 = tb_top.cpu.l2t1.tag.lkup_tag0[27:1];
assign lkup_tag_d1_2 = tb_top.cpu.l2t2.tag.lkup_tag0[27:1];
assign lkup_tag_d1_3 = tb_top.cpu.l2t3.tag.lkup_tag0[27:1];
assign lkup_tag_d1_4 = tb_top.cpu.l2t4.tag.lkup_tag0[27:1];
assign lkup_tag_d1_5 = tb_top.cpu.l2t5.tag.lkup_tag0[27:1];
assign lkup_tag_d1_6 = tb_top.cpu.l2t6.tag.lkup_tag0[27:1];
assign lkup_tag_d1_7 = tb_top.cpu.l2t7.tag.lkup_tag0[27:1];

/***** Changed similarly for all ways
assign tag_way0_c1_0 = tb_top.cpu.l2t0.tag.quad0.bank0.tag_way0;
assign tag_way0_c1_1 = tb_top.cpu.l2t1.tag.quad0.bank0.tag_way0;
assign tag_way0_c1_2 = tb_top.cpu.l2t2.tag.quad0.bank0.tag_way0;
assign tag_way0_c1_3 = tb_top.cpu.l2t3.tag.quad0.bank0.tag_way0;
assign tag_way0_c1_4 = tb_top.cpu.l2t4.tag.quad0.bank0.tag_way0;
assign tag_way0_c1_5 = tb_top.cpu.l2t5.tag.quad0.bank0.tag_way0;
assign tag_way0_c1_6 = tb_top.cpu.l2t6.tag.quad0.bank0.tag_way0;
assign tag_way0_c1_7 = tb_top.cpu.l2t7.tag.quad0.bank0.tag_way0;
****/

assign tag_way0_c1_0 = tb_top.cpu.l2t0.tag.quad0.bank0.sao_mx0;
assign tag_way0_c1_1 = tb_top.cpu.l2t1.tag.quad0.bank0.sao_mx0;
assign tag_way0_c1_2 = tb_top.cpu.l2t2.tag.quad0.bank0.sao_mx0;
assign tag_way0_c1_3 = tb_top.cpu.l2t3.tag.quad0.bank0.sao_mx0;
assign tag_way0_c1_4 = tb_top.cpu.l2t4.tag.quad0.bank0.sao_mx0;
assign tag_way0_c1_5 = tb_top.cpu.l2t5.tag.quad0.bank0.sao_mx0;
assign tag_way0_c1_6 = tb_top.cpu.l2t6.tag.quad0.bank0.sao_mx0;
assign tag_way0_c1_7 = tb_top.cpu.l2t7.tag.quad0.bank0.sao_mx0;

//assign tag_way1_c1_0 = tb_top.cpu.l2t0.tag.quad0.bank0.tag_way1;
assign tag_way1_c1_0 = tb_top.cpu.l2t0.tag.quad0.bank1.sao_mx0;
assign tag_way1_c1_1 = tb_top.cpu.l2t1.tag.quad0.bank1.tag_way1;
assign tag_way1_c1_2 = tb_top.cpu.l2t2.tag.quad0.bank1.tag_way1;
assign tag_way1_c1_3 = tb_top.cpu.l2t3.tag.quad0.bank1.tag_way1;
assign tag_way1_c1_4 = tb_top.cpu.l2t4.tag.quad0.bank1.tag_way1;
assign tag_way1_c1_5 = tb_top.cpu.l2t5.tag.quad0.bank1.tag_way1;
assign tag_way1_c1_6 = tb_top.cpu.l2t6.tag.quad0.bank1.tag_way1;
assign tag_way1_c1_7 = tb_top.cpu.l2t7.tag.quad0.bank1.tag_way1;

//assign tag_way2_c1_0 = tb_top.cpu.l2t0.tag.quad0.bank1.tag_way0;
assign tag_way2_c1_0 = tb_top.cpu.l2t0.tag.quad2.bank0.sao_mx0;
assign tag_way2_c1_1 = tb_top.cpu.l2t1.tag.quad0.bank1.tag_way0;
assign tag_way2_c1_2 = tb_top.cpu.l2t2.tag.quad0.bank1.tag_way0;
assign tag_way2_c1_3 = tb_top.cpu.l2t3.tag.quad0.bank1.tag_way0;
assign tag_way2_c1_4 = tb_top.cpu.l2t4.tag.quad0.bank1.tag_way0;
assign tag_way2_c1_5 = tb_top.cpu.l2t5.tag.quad0.bank1.tag_way0;
assign tag_way2_c1_6 = tb_top.cpu.l2t6.tag.quad0.bank1.tag_way0;
assign tag_way2_c1_7 = tb_top.cpu.l2t7.tag.quad0.bank1.tag_way0;

//assign tag_way3_c1_0 = tb_top.cpu.l2t0.tag.quad0.bank1.tag_way1;
assign tag_way3_c1_0 = tb_top.cpu.l2t0.tag.quad2.bank1.sao_mx0;
assign tag_way3_c1_1 = tb_top.cpu.l2t1.tag.quad0.bank1.tag_way1;
assign tag_way3_c1_2 = tb_top.cpu.l2t2.tag.quad0.bank1.tag_way1;
assign tag_way3_c1_3 = tb_top.cpu.l2t3.tag.quad0.bank1.tag_way1;
assign tag_way3_c1_4 = tb_top.cpu.l2t4.tag.quad0.bank1.tag_way1;
assign tag_way3_c1_5 = tb_top.cpu.l2t5.tag.quad0.bank1.tag_way1;
assign tag_way3_c1_6 = tb_top.cpu.l2t6.tag.quad0.bank1.tag_way1;
assign tag_way3_c1_7 = tb_top.cpu.l2t7.tag.quad0.bank1.tag_way1;

//assign tag_way4_c1_0 = tb_top.cpu.l2t0.tag.quad1.bank0.tag_way0;
assign tag_way4_c1_0 = tb_top.cpu.l2t0.tag.quad0.bank0.sao_mx1;
assign tag_way4_c1_1 = tb_top.cpu.l2t1.tag.quad1.bank0.tag_way0;
assign tag_way4_c1_2 = tb_top.cpu.l2t2.tag.quad1.bank0.tag_way0;
assign tag_way4_c1_3 = tb_top.cpu.l2t3.tag.quad1.bank0.tag_way0;
assign tag_way4_c1_4 = tb_top.cpu.l2t4.tag.quad1.bank0.tag_way0;
assign tag_way4_c1_5 = tb_top.cpu.l2t5.tag.quad1.bank0.tag_way0;
assign tag_way4_c1_6 = tb_top.cpu.l2t6.tag.quad1.bank0.tag_way0;
assign tag_way4_c1_7 = tb_top.cpu.l2t7.tag.quad1.bank0.tag_way0;

//assign tag_way5_c1_0 = tb_top.cpu.l2t0.tag.quad1.bank0.tag_way1;
assign tag_way5_c1_0 = tb_top.cpu.l2t0.tag.quad0.bank1.sao_mx1;
assign tag_way5_c1_1 = tb_top.cpu.l2t1.tag.quad1.bank0.tag_way1;
assign tag_way5_c1_2 = tb_top.cpu.l2t2.tag.quad1.bank0.tag_way1;
assign tag_way5_c1_3 = tb_top.cpu.l2t3.tag.quad1.bank0.tag_way1;
assign tag_way5_c1_4 = tb_top.cpu.l2t4.tag.quad1.bank0.tag_way1;
assign tag_way5_c1_5 = tb_top.cpu.l2t5.tag.quad1.bank0.tag_way1;
assign tag_way5_c1_6 = tb_top.cpu.l2t6.tag.quad1.bank0.tag_way1;
assign tag_way5_c1_7 = tb_top.cpu.l2t7.tag.quad1.bank0.tag_way1;

//assign tag_way6_c1_0 = tb_top.cpu.l2t0.tag.quad1.bank1.tag_way0;
assign tag_way6_c1_0 = tb_top.cpu.l2t0.tag.quad2.bank0.sao_mx1;
assign tag_way6_c1_1 = tb_top.cpu.l2t1.tag.quad1.bank1.tag_way0;
assign tag_way6_c1_2 = tb_top.cpu.l2t2.tag.quad1.bank1.tag_way0;
assign tag_way6_c1_3 = tb_top.cpu.l2t3.tag.quad1.bank1.tag_way0;
assign tag_way6_c1_4 = tb_top.cpu.l2t4.tag.quad1.bank1.tag_way0;
assign tag_way6_c1_5 = tb_top.cpu.l2t5.tag.quad1.bank1.tag_way0;
assign tag_way6_c1_6 = tb_top.cpu.l2t6.tag.quad1.bank1.tag_way0;
assign tag_way6_c1_7 = tb_top.cpu.l2t7.tag.quad1.bank1.tag_way0;

//assign tag_way7_c1_0 = tb_top.cpu.l2t0.tag.quad1.bank1.tag_way1;
assign tag_way7_c1_0 = tb_top.cpu.l2t0.tag.quad2.bank1.sao_mx1;
assign tag_way7_c1_1 = tb_top.cpu.l2t1.tag.quad1.bank1.tag_way1;
assign tag_way7_c1_2 = tb_top.cpu.l2t2.tag.quad1.bank1.tag_way1;
assign tag_way7_c1_3 = tb_top.cpu.l2t3.tag.quad1.bank1.tag_way1;
assign tag_way7_c1_4 = tb_top.cpu.l2t4.tag.quad1.bank1.tag_way1;
assign tag_way7_c1_5 = tb_top.cpu.l2t5.tag.quad1.bank1.tag_way1;
assign tag_way7_c1_6 = tb_top.cpu.l2t6.tag.quad1.bank1.tag_way1;
assign tag_way7_c1_7 = tb_top.cpu.l2t7.tag.quad1.bank1.tag_way1;

//assign tag_way8_c1_0 = tb_top.cpu.l2t0.tag.quad2.bank0.tag_way0;
assign tag_way8_c1_0 = tb_top.cpu.l2t0.tag.quad1.bank0.sao_mx0;
assign tag_way8_c1_1 = tb_top.cpu.l2t1.tag.quad2.bank0.tag_way0;
assign tag_way8_c1_2 = tb_top.cpu.l2t2.tag.quad2.bank0.tag_way0;
assign tag_way8_c1_3 = tb_top.cpu.l2t3.tag.quad2.bank0.tag_way0;
assign tag_way8_c1_4 = tb_top.cpu.l2t4.tag.quad2.bank0.tag_way0;
assign tag_way8_c1_5 = tb_top.cpu.l2t5.tag.quad2.bank0.tag_way0;
assign tag_way8_c1_6 = tb_top.cpu.l2t6.tag.quad2.bank0.tag_way0;
assign tag_way8_c1_7 = tb_top.cpu.l2t7.tag.quad2.bank0.tag_way0;

//assign tag_way9_c1_0 = tb_top.cpu.l2t0.tag.quad2.bank0.tag_way1;
assign tag_way9_c1_0 = tb_top.cpu.l2t0.tag.quad1.bank1.sao_mx0;
assign tag_way9_c1_1 = tb_top.cpu.l2t1.tag.quad2.bank0.tag_way1;
assign tag_way9_c1_2 = tb_top.cpu.l2t2.tag.quad2.bank0.tag_way1;
assign tag_way9_c1_3 = tb_top.cpu.l2t3.tag.quad2.bank0.tag_way1;
assign tag_way9_c1_4 = tb_top.cpu.l2t4.tag.quad2.bank0.tag_way1;
assign tag_way9_c1_5 = tb_top.cpu.l2t5.tag.quad2.bank0.tag_way1;
assign tag_way9_c1_6 = tb_top.cpu.l2t6.tag.quad2.bank0.tag_way1;
assign tag_way9_c1_7 = tb_top.cpu.l2t7.tag.quad2.bank0.tag_way1;

//assign tag_way10_c1_0 = tb_top.cpu.l2t0.tag.quad2.bank1.tag_way0;
assign tag_way10_c1_0 = tb_top.cpu.l2t0.tag.quad3.bank0.sao_mx0;
assign tag_way10_c1_1 = tb_top.cpu.l2t1.tag.quad2.bank1.tag_way0;
assign tag_way10_c1_2 = tb_top.cpu.l2t2.tag.quad2.bank1.tag_way0;
assign tag_way10_c1_3 = tb_top.cpu.l2t3.tag.quad2.bank1.tag_way0;
assign tag_way10_c1_4 = tb_top.cpu.l2t4.tag.quad2.bank1.tag_way0;
assign tag_way10_c1_5 = tb_top.cpu.l2t5.tag.quad2.bank1.tag_way0;
assign tag_way10_c1_6 = tb_top.cpu.l2t6.tag.quad2.bank1.tag_way0;
assign tag_way10_c1_7 = tb_top.cpu.l2t7.tag.quad2.bank1.tag_way0;

//assign tag_way11_c1_0 = tb_top.cpu.l2t0.tag.quad2.bank1.tag_way1;
assign tag_way11_c1_0 = tb_top.cpu.l2t0.tag.quad3.bank1.sao_mx0;
assign tag_way11_c1_1 = tb_top.cpu.l2t1.tag.quad2.bank1.tag_way1;
assign tag_way11_c1_2 = tb_top.cpu.l2t2.tag.quad2.bank1.tag_way1;
assign tag_way11_c1_3 = tb_top.cpu.l2t3.tag.quad2.bank1.tag_way1;
assign tag_way11_c1_4 = tb_top.cpu.l2t4.tag.quad2.bank1.tag_way1;
assign tag_way11_c1_5 = tb_top.cpu.l2t5.tag.quad2.bank1.tag_way1;
assign tag_way11_c1_6 = tb_top.cpu.l2t6.tag.quad2.bank1.tag_way1;
assign tag_way11_c1_7 = tb_top.cpu.l2t7.tag.quad2.bank1.tag_way1;

//assign tag_way12_c1_0 = tb_top.cpu.l2t0.tag.quad3.bank0.tag_way0;
assign tag_way12_c1_0 = tb_top.cpu.l2t0.tag.quad1.bank0.sao_mx1;
assign tag_way12_c1_1 = tb_top.cpu.l2t1.tag.quad3.bank0.tag_way0;
assign tag_way12_c1_2 = tb_top.cpu.l2t2.tag.quad3.bank0.tag_way0;
assign tag_way12_c1_3 = tb_top.cpu.l2t3.tag.quad3.bank0.tag_way0;
assign tag_way12_c1_4 = tb_top.cpu.l2t4.tag.quad3.bank0.tag_way0;
assign tag_way12_c1_5 = tb_top.cpu.l2t5.tag.quad3.bank0.tag_way0;
assign tag_way12_c1_6 = tb_top.cpu.l2t6.tag.quad3.bank0.tag_way0;
assign tag_way12_c1_7 = tb_top.cpu.l2t7.tag.quad3.bank0.tag_way0;

//assign tag_way13_c1_0 = tb_top.cpu.l2t0.tag.quad3.bank0.tag_way1;
assign tag_way13_c1_0 = tb_top.cpu.l2t0.tag.quad1.bank1.sao_mx1;
assign tag_way13_c1_1 = tb_top.cpu.l2t1.tag.quad3.bank0.tag_way1;
assign tag_way13_c1_2 = tb_top.cpu.l2t2.tag.quad3.bank0.tag_way1;
assign tag_way13_c1_3 = tb_top.cpu.l2t3.tag.quad3.bank0.tag_way1;
assign tag_way13_c1_4 = tb_top.cpu.l2t4.tag.quad3.bank0.tag_way1;
assign tag_way13_c1_5 = tb_top.cpu.l2t5.tag.quad3.bank0.tag_way1;
assign tag_way13_c1_6 = tb_top.cpu.l2t6.tag.quad3.bank0.tag_way1;
assign tag_way13_c1_7 = tb_top.cpu.l2t7.tag.quad3.bank0.tag_way1;

//assign tag_way14_c1_0 = tb_top.cpu.l2t0.tag.quad3.bank1.tag_way0;
assign tag_way14_c1_0 = tb_top.cpu.l2t0.tag.quad3.bank0.sao_mx1;
assign tag_way14_c1_1 = tb_top.cpu.l2t1.tag.quad3.bank1.tag_way0;
assign tag_way14_c1_2 = tb_top.cpu.l2t2.tag.quad3.bank1.tag_way0;
assign tag_way14_c1_3 = tb_top.cpu.l2t3.tag.quad3.bank1.tag_way0;
assign tag_way14_c1_4 = tb_top.cpu.l2t4.tag.quad3.bank1.tag_way0;
assign tag_way14_c1_5 = tb_top.cpu.l2t5.tag.quad3.bank1.tag_way0;
assign tag_way14_c1_6 = tb_top.cpu.l2t6.tag.quad3.bank1.tag_way0;
assign tag_way14_c1_7 = tb_top.cpu.l2t7.tag.quad3.bank1.tag_way0;

//assign tag_way15_c1_0 = tb_top.cpu.l2t0.tag.quad3.bank1.tag_way1;
assign tag_way15_c1_0 = tb_top.cpu.l2t0.tag.quad3.bank1.sao_mx1;
assign tag_way15_c1_1 = tb_top.cpu.l2t1.tag.quad3.bank1.tag_way1;
assign tag_way15_c1_2 = tb_top.cpu.l2t2.tag.quad3.bank1.tag_way1;
assign tag_way15_c1_3 = tb_top.cpu.l2t3.tag.quad3.bank1.tag_way1;
assign tag_way15_c1_4 = tb_top.cpu.l2t4.tag.quad3.bank1.tag_way1;
assign tag_way15_c1_5 = tb_top.cpu.l2t5.tag.quad3.bank1.tag_way1;
assign tag_way15_c1_6 = tb_top.cpu.l2t6.tag.quad3.bank1.tag_way1;
assign tag_way15_c1_7 = tb_top.cpu.l2t7.tag.quad3.bank1.tag_way1;



initial
begin


//=================================
// Initialize the forcing variables
//=================================
  stuck_to0 = 1'b0;
  stuck_to1 = 1'b0;
  tarand_bit_flip = 1'b0;
inject_limit = 0;
start_err=0;
start_err1=0;

  rand_limit_hi = 150;
//  rand_limit_lo = 0;
//  rand_seed = 0;

//=================================
// Initialize the variables used in here
//=================================
/**
way = 0;
address=0;
lkupTag=0;
tagEntry=0;
errTagEntry=0;
**/
injectErr = 0;
start_injection = 0;

//=========================================
// Check if forcing variables are changed by verargs
//=========================================
  if($test$plusargs("ta_bit_stuck_to0"))
  begin
    stuck_to0= 1;
    stuck_to1= 0;
    tarand_bit_flip = 0;
    `PR_ALWAYS("l2_tagErrInjector", `ALWAYS, "L2 bit stuck to 0");
  end
   else if ($test$plusargs("ta_bit_stuck_to1"))
   begin
     stuck_to0= 0;
     stuck_to1= 1;
     tarand_bit_flip = 0;
     `PR_ALWAYS("l2_tagErrInjector", `ALWAYS,"L2 bit stuck to 1");
   end
   else if ($test$plusargs("L2TA_RAND_ERR_ENABLE"))
   begin
     tarand_bit_flip = 1;
     stuck_to0= 0;
     stuck_to1= 0;
   //  if($value$plusargs("L2INJECT_LIMIT=%d",inject_limit))
   //  $display("L2InjectLimit is = %d",inject_limit);
   //  if (inject_limit > rand_limit_hi)
   //  $display("inject limit is %d greater than max allowable \n", inject_limit);
     `PR_ALWAYS("l2_tagErrInjector", `ALWAYS,"L2 Tag Array Err injection Enabled");
   end

end

/**
always @(posedge tb_top.cpu.l2clk)
begin
        if(start_err < 15744276)
        begin
                start_err <= $time;
                start_injection <= 0;
        end
        else
        begin
                start_err <= start_err1;
                start_injection <= 1;
        end
end
**/




always @(posedge tb_top.cpu.l2clk)
        // Tag array error injection
begin
if(!L2_INT_RST)
begin
	way <= 0;
	address <= 0;
	lkupTag <= 0;
	tagEntry <= 0;
	errTagEntry <= 0;
	i <= 0;

end
else
  if(`TOP.gOutOfBoot[63:0] === `TOP.verif_args.finish_mask[63:0] )
  begin

	if(tarand_bit_flip == 1)
	begin
    		// if(rd_en && ($random%8 == 0)) begin // PX2 signal,PSAMPLE,in cycleN
     		if(rd_en_0 ) begin // PX2 signal,PSAMPLE,in cycleN
                    fork
                    begin
                        // wait till C1
                        @(posedge tb_top.cpu.l2clk);
			#(PSMPL);
                        address <= arbdp_addr_c1_0; // C1 signal,PSAMPLE,in cycle N
			i <= 0;

                        if(address[39:37] != 3'b101 && !decdp_inst_int_or_inval_c1_0 && inst_vld_c2_prev_0) 
		begin
			#(PSMPL);
                            way <= ({$random(`PARGS.seed)} % 16); //<MOD> 12 to 16
                            lkupTag <= lkup_tag_d1_0;
                            // this message is printed in cycle N (C1)
                            `PR_ALWAYS("l2_tagErrInjector", `ALWAYS,"Tag array error injected into bank%0d, index%0d, way%0d",i, address[17:9], way);
                            // wait till negedge of C1
                            @(negedge tb_top.cpu.l2clk);
			#(PSMPL);
                            // C1 sample, NSAMPLE, occurs in cycle N negedge
                            // C2 drive, PRZ, takes effect in cycle N+1
                            case(way) 
                                0: begin
                                    tagEntry <= tag_way0_c1_0;
                                    errTagEntry <= (tagEntry ^ (28'b1 << (({$random(`PARGS.seed)} % 27) + 1)));
                                    SetTagWay0(i, errTagEntry); // This takes place at cycle N+1 (C2)
                                end
                                1: begin
                                    tagEntry <= tag_way1_c1_0;
                                    errTagEntry <= (tagEntry ^ (28'b1 << (({$random(`PARGS.seed)} % 27) + 1)));
                                    SetTagWay1(i, errTagEntry); // This takes place at cycle N+1 (C2)
                                end
                                2: begin
                                    tagEntry <= tag_way2_c1_0;
                                    errTagEntry <= (tagEntry ^ (28'b1 << (({$random(`PARGS.seed)} % 27) + 1)));
                                    SetTagWay2(i, errTagEntry); // This takes place at cycle N+1 (C2)
                                end
                                3: begin
                                    tagEntry <= tag_way3_c1_0;
                                    errTagEntry <= (tagEntry ^ (28'b1 << (({$random(`PARGS.seed)} % 27) + 1)));
                                    SetTagWay3(i, errTagEntry); // This takes place at cycle N+1 (C2)
                                end
                                4: begin
                                    tagEntry <= tag_way4_c1_0;
                                    errTagEntry <= (tagEntry ^ (28'b1 << (({$random(`PARGS.seed)} % 27) + 1)));
                                    SetTagWay4(i, errTagEntry); // This takes place at cycle N+1 (C2)
                                end
                                5: begin
                                    tagEntry <= tag_way5_c1_0;
                                    errTagEntry <= (tagEntry ^ (28'b1 << (({$random(`PARGS.seed)} % 27) + 1)));
                                    SetTagWay5(i, errTagEntry); // This takes place at cycle N+1 (C2)
                                end
                                6: begin
                                    tagEntry <= tag_way6_c1_0;
                                    errTagEntry <= (tagEntry ^ (28'b1 << (({$random(`PARGS.seed)} % 27) + 1)));
                                    SetTagWay6(i, errTagEntry); // This takes place at cycle N+1 (C2)
                                end
                                7: begin
                                    tagEntry <= tag_way7_c1_0;
                                    errTagEntry <= (tagEntry ^ (28'b1 << (({$random(`PARGS.seed)} % 27) + 1)));
                                    SetTagWay7(i, errTagEntry); // This takes place at cycle N+1 (C2)
                                end
                                8: begin
                                    tagEntry <= tag_way8_c1_0;
                                    errTagEntry <= (tagEntry ^ (28'b1 << (({$random(`PARGS.seed)} % 27) + 1)));
                                    SetTagWay8(i, errTagEntry); // This takes place at cycle N+1 (C2)
                                end
                                9: begin
                                    tagEntry <= tag_way9_c1_0;
                                    errTagEntry <= (tagEntry ^ (28'b1 << (({$random(`PARGS.seed)} % 27) + 1)));
                                    SetTagWay9(i, errTagEntry); // This takes place at cycle N+1 (C2)
                                end
                                10: begin
                                    tagEntry <= tag_way10_c1_0;
                                    errTagEntry <= (tagEntry ^ (28'b1 << (({$random(`PARGS.seed)} % 27) + 1)));
                                    SetTagWay10(i, errTagEntry); // This takes place at cycle N+1 (C2)
                                end
                                11: begin
                                    tagEntry <= tag_way11_c1_0;
                                    errTagEntry <= (tagEntry ^ (28'b1 << (({$random(`PARGS.seed)} % 27) + 1)));
                                    SetTagWay11(i, errTagEntry); // This takes place at cycle N+1 (C2)
                                end
                                12: begin
                                    tagEntry <= tag_way12_c1_0;
                                    errTagEntry <= (tagEntry ^ (28'b1 << (({$random(`PARGS.seed)} % 27) + 1)));
                                    SetTagWay12(i, errTagEntry); // This takes place at cycle N+1 (C2)
                                end
                                13: begin
                                    tagEntry <= tag_way13_c1_0;
                                    errTagEntry <= (tagEntry ^ (28'b1 << (({$random(`PARGS.seed)} % 27) + 1)));
                                    SetTagWay13(i, errTagEntry); // This takes place at cycle N+1 (C2)
                                end
                                14: begin
                                    tagEntry <= tag_way14_c1_0;
                                    errTagEntry <= (tagEntry ^ (28'b1 << (({$random(`PARGS.seed)} % 27) + 1)));
                                    SetTagWay14(i, errTagEntry); // This takes place at cycle N+1 (C2)
                                end
                                15: begin
                                    tagEntry <= tag_way15_c1_0;
                                    errTagEntry <= (tagEntry ^ (28'b1 << (({$random(`PARGS.seed)} % 27) + 1)));
                                    SetTagWay15(i, errTagEntry); // This takes place at cycle N+1 (C2)
                                end
                            endcase // case(way)
                            if (lkupTag == errTagEntry[27:1])
                                SetWaySel(i, way); // This takes place at cycle N+1 (C2)

                           // set tag error bit for 1 cycle in C2 while erroneous value is forced on the
                         // tag array output so that InitErrorHandling() knows the tag contains an error
                       //     @(negedge tb_top.cpu.l2clk);


                            @(posedge tb_top.cpu.l2clk);
			#(PSMPL);
                            case(way)
                                0: ReleaseTagWay0(i);
                                1: ReleaseTagWay1(i);
                                2: ReleaseTagWay2(i);
                                3: ReleaseTagWay3(i);
                                4: ReleaseTagWay4(i);
                                5: ReleaseTagWay5(i);
                                6: ReleaseTagWay6(i);
                                7: ReleaseTagWay7(i);
                                8: ReleaseTagWay8(i);
                                9: ReleaseTagWay9(i);
                                10: ReleaseTagWay10(i);
                                11: ReleaseTagWay11(i);
                                12: ReleaseTagWay12(i);
                                13: ReleaseTagWay13(i);
                                14: ReleaseTagWay14(i);
                                15: ReleaseTagWay15(i);
                            endcase // case(way)
                            ReleaseWaySel(i);

                            // reset tag error bit after erroneous value is no longer forced
                           @(negedge tb_top.cpu.l2clk);
                       end // if(address[39:37] != 3'b101 &&!decdp_inst_int_or_inval_c1 && inst_vld_c2_prev)
                    end
                    join 
                end // if(rd_en && $random%8 == 0)

                @(posedge tb_top.cpu.l2clk);
end // if(start_injection==1)
end // OutOfBoot
end //always block

// Tasks for forcing error 

task SetTagWay0;
input bank;
input [27:0] value;
integer bank;
reg [27:0] value;
begin
   case (bank)
    0: force tb_top.cpu.l2t0.tag.quad0.bank0.tag_way0 = value;
    1: force tb_top.cpu.l2t1.tag.quad0.bank0.tag_way0 = value;
    2: force tb_top.cpu.l2t2.tag.quad0.bank0.tag_way0 = value;
    3: force tb_top.cpu.l2t3.tag.quad0.bank0.tag_way0 = value;
    4: force tb_top.cpu.l2t4.tag.quad0.bank0.tag_way0 = value;
    5: force tb_top.cpu.l2t5.tag.quad0.bank0.tag_way0 = value;
    6: force tb_top.cpu.l2t6.tag.quad0.bank0.tag_way0 = value;
    7: force tb_top.cpu.l2t7.tag.quad0.bank0.tag_way0 = value;
    endcase
end
endtask

task ReleaseTagWay0;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2t0.tag.quad0.bank0.tag_way0;
    1: release tb_top.cpu.l2t1.tag.quad0.bank0.tag_way0;
    2: release tb_top.cpu.l2t2.tag.quad0.bank0.tag_way0;
    3: release tb_top.cpu.l2t3.tag.quad0.bank0.tag_way0;
    4: release tb_top.cpu.l2t4.tag.quad0.bank0.tag_way0;
    5: release tb_top.cpu.l2t5.tag.quad0.bank0.tag_way0;
    6: release tb_top.cpu.l2t6.tag.quad0.bank0.tag_way0;
    7: release tb_top.cpu.l2t7.tag.quad0.bank0.tag_way0;
    endcase
end
endtask



task SetTagWay1;
input bank;
input [27:0] value;
integer bank;
reg [27:0] value;
begin
   case (bank)
    0: force tb_top.cpu.l2t0.tag.quad0.bank0.tag_way1 = value;
    1: force tb_top.cpu.l2t1.tag.quad0.bank0.tag_way1 = value;
    2: force tb_top.cpu.l2t2.tag.quad0.bank0.tag_way1 = value;
    3: force tb_top.cpu.l2t3.tag.quad0.bank0.tag_way1 = value;
    4: force tb_top.cpu.l2t4.tag.quad0.bank0.tag_way1 = value;
    5: force tb_top.cpu.l2t5.tag.quad0.bank0.tag_way1 = value;
    6: force tb_top.cpu.l2t6.tag.quad0.bank0.tag_way1 = value;
    7: force tb_top.cpu.l2t7.tag.quad0.bank0.tag_way1 = value;
    endcase
end
endtask

task ReleaseTagWay1;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2t0.tag.quad0.bank0.tag_way1;
    1: release tb_top.cpu.l2t1.tag.quad0.bank0.tag_way1;
    2: release tb_top.cpu.l2t2.tag.quad0.bank0.tag_way1;
    3: release tb_top.cpu.l2t3.tag.quad0.bank0.tag_way1;
    4: release tb_top.cpu.l2t4.tag.quad0.bank0.tag_way1;
    5: release tb_top.cpu.l2t5.tag.quad0.bank0.tag_way1;
    6: release tb_top.cpu.l2t6.tag.quad0.bank0.tag_way1;
    7: release tb_top.cpu.l2t7.tag.quad0.bank0.tag_way1;
    endcase
end
endtask


task SetTagWay2;
input bank;
input [27:0] value;
integer bank;
reg [27:0] value;
begin
   case (bank)
    0: force tb_top.cpu.l2t0.tag.quad0.bank1.tag_way0 = value;
    1: force tb_top.cpu.l2t1.tag.quad0.bank1.tag_way0 = value;
    2: force tb_top.cpu.l2t2.tag.quad0.bank1.tag_way0 = value;
    3: force tb_top.cpu.l2t3.tag.quad0.bank1.tag_way0 = value;
    4: force tb_top.cpu.l2t4.tag.quad0.bank1.tag_way0 = value;
    5: force tb_top.cpu.l2t5.tag.quad0.bank1.tag_way0 = value;
    6: force tb_top.cpu.l2t6.tag.quad0.bank1.tag_way0 = value;
    7: force tb_top.cpu.l2t7.tag.quad0.bank1.tag_way0 = value;
    endcase
end
endtask


task ReleaseTagWay2;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2t0.tag.quad0.bank1.tag_way0;
    1: release tb_top.cpu.l2t1.tag.quad0.bank1.tag_way0;
    2: release tb_top.cpu.l2t2.tag.quad0.bank1.tag_way0;
    3: release tb_top.cpu.l2t3.tag.quad0.bank1.tag_way0;
    4: release tb_top.cpu.l2t4.tag.quad0.bank1.tag_way0;
    5: release tb_top.cpu.l2t5.tag.quad0.bank1.tag_way0;
    6: release tb_top.cpu.l2t6.tag.quad0.bank1.tag_way0;
    7: release tb_top.cpu.l2t7.tag.quad0.bank1.tag_way0;
    endcase
end
endtask

task SetTagWay3;
input bank;
input [27:0] value;
integer bank;
reg [27:0] value;
begin
   case (bank)
    0: force tb_top.cpu.l2t0.tag.quad0.bank1.tag_way1 = value;
    1: force tb_top.cpu.l2t1.tag.quad0.bank1.tag_way1 = value;
    2: force tb_top.cpu.l2t2.tag.quad0.bank1.tag_way1 = value;
    3: force tb_top.cpu.l2t3.tag.quad0.bank1.tag_way1 = value;
    4: force tb_top.cpu.l2t4.tag.quad0.bank1.tag_way1 = value;
    5: force tb_top.cpu.l2t5.tag.quad0.bank1.tag_way1 = value;
    6: force tb_top.cpu.l2t6.tag.quad0.bank1.tag_way1 = value;
    7: force tb_top.cpu.l2t7.tag.quad0.bank1.tag_way1 = value;
    endcase
end
endtask

task ReleaseTagWay3;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2t0.tag.quad0.bank1.tag_way1;
    1: release tb_top.cpu.l2t1.tag.quad0.bank1.tag_way1;
    2: release tb_top.cpu.l2t2.tag.quad0.bank1.tag_way1;
    3: release tb_top.cpu.l2t3.tag.quad0.bank1.tag_way1;
    4: release tb_top.cpu.l2t4.tag.quad0.bank1.tag_way1;
    5: release tb_top.cpu.l2t5.tag.quad0.bank1.tag_way1;
    6: release tb_top.cpu.l2t6.tag.quad0.bank1.tag_way1;
    7: release tb_top.cpu.l2t7.tag.quad0.bank1.tag_way1;
    endcase
end
endtask



task SetTagWay4;
input bank;
input [27:0] value;
integer bank;
reg [27:0] value;
begin
   case (bank)
    0: force tb_top.cpu.l2t0.tag.quad1.bank0.tag_way0 = value;
    1: force tb_top.cpu.l2t1.tag.quad1.bank0.tag_way0 = value;
    2: force tb_top.cpu.l2t2.tag.quad1.bank0.tag_way0 = value;
    3: force tb_top.cpu.l2t3.tag.quad1.bank0.tag_way0 = value;
    4: force tb_top.cpu.l2t4.tag.quad1.bank0.tag_way0 = value;
    5: force tb_top.cpu.l2t5.tag.quad1.bank0.tag_way0 = value;
    6: force tb_top.cpu.l2t6.tag.quad1.bank0.tag_way0 = value;
    7: force tb_top.cpu.l2t7.tag.quad1.bank0.tag_way0 = value;
    endcase
end
endtask

task ReleaseTagWay4;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2t0.tag.quad1.bank0.tag_way0;
    1: release tb_top.cpu.l2t1.tag.quad1.bank0.tag_way0;
    2: release tb_top.cpu.l2t2.tag.quad1.bank0.tag_way0;
    3: release tb_top.cpu.l2t3.tag.quad1.bank0.tag_way0;
    4: release tb_top.cpu.l2t4.tag.quad1.bank0.tag_way0;
    5: release tb_top.cpu.l2t5.tag.quad1.bank0.tag_way0;
    6: release tb_top.cpu.l2t6.tag.quad1.bank0.tag_way0;
    7: release tb_top.cpu.l2t7.tag.quad1.bank0.tag_way0;
    endcase
end
endtask

task SetTagWay5;
input bank;
input [27:0] value;
integer bank;
reg [27:0] value;
begin
   case (bank)
    0: force tb_top.cpu.l2t0.tag.quad1.bank0.tag_way1 = value;
    1: force tb_top.cpu.l2t1.tag.quad1.bank0.tag_way1 = value;
    2: force tb_top.cpu.l2t2.tag.quad1.bank0.tag_way1 = value;
    3: force tb_top.cpu.l2t3.tag.quad1.bank0.tag_way1 = value;
    4: force tb_top.cpu.l2t4.tag.quad1.bank0.tag_way1 = value;
    5: force tb_top.cpu.l2t5.tag.quad1.bank0.tag_way1 = value;
    6: force tb_top.cpu.l2t6.tag.quad1.bank0.tag_way1 = value;
    7: force tb_top.cpu.l2t7.tag.quad1.bank0.tag_way1 = value;
    endcase
end
endtask


task ReleaseTagWay5;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2t0.tag.quad1.bank0.tag_way1;
    1: release tb_top.cpu.l2t1.tag.quad1.bank0.tag_way1;
    2: release tb_top.cpu.l2t2.tag.quad1.bank0.tag_way1;
    3: release tb_top.cpu.l2t3.tag.quad1.bank0.tag_way1;
    4: release tb_top.cpu.l2t4.tag.quad1.bank0.tag_way1;
    5: release tb_top.cpu.l2t5.tag.quad1.bank0.tag_way1;
    6: release tb_top.cpu.l2t6.tag.quad1.bank0.tag_way1;
    7: release tb_top.cpu.l2t7.tag.quad1.bank0.tag_way1;
    endcase
end
endtask

task SetTagWay6;
input bank;
input [27:0] value;
integer bank;
reg [27:0] value;
begin
   case (bank)
    0: force tb_top.cpu.l2t0.tag.quad1.bank1.tag_way0 = value;
    1: force tb_top.cpu.l2t1.tag.quad1.bank1.tag_way0 = value;
    2: force tb_top.cpu.l2t2.tag.quad1.bank1.tag_way0 = value;
    3: force tb_top.cpu.l2t3.tag.quad1.bank1.tag_way0 = value;
    4: force tb_top.cpu.l2t4.tag.quad1.bank1.tag_way0 = value;
    5: force tb_top.cpu.l2t5.tag.quad1.bank1.tag_way0 = value;
    6: force tb_top.cpu.l2t6.tag.quad1.bank1.tag_way0 = value;
    7: force tb_top.cpu.l2t7.tag.quad1.bank1.tag_way0 = value;
    endcase
end
endtask

task ReleaseTagWay6;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2t0.tag.quad1.bank1.tag_way0;
    1: release tb_top.cpu.l2t1.tag.quad1.bank1.tag_way0;
    2: release tb_top.cpu.l2t2.tag.quad1.bank1.tag_way0;
    3: release tb_top.cpu.l2t3.tag.quad1.bank1.tag_way0;
    4: release tb_top.cpu.l2t4.tag.quad1.bank1.tag_way0;
    5: release tb_top.cpu.l2t5.tag.quad1.bank1.tag_way0;
    6: release tb_top.cpu.l2t6.tag.quad1.bank1.tag_way0;
    7: release tb_top.cpu.l2t7.tag.quad1.bank1.tag_way0;
    endcase
end
endtask



task SetTagWay7;
input bank;
input [27:0] value;
integer bank;
reg [27:0] value;
begin
   case (bank)
    0: force tb_top.cpu.l2t0.tag.quad1.bank1.tag_way1 = value;
    1: force tb_top.cpu.l2t1.tag.quad1.bank1.tag_way1 = value;
    2: force tb_top.cpu.l2t2.tag.quad1.bank1.tag_way1 = value;
    3: force tb_top.cpu.l2t3.tag.quad1.bank1.tag_way1 = value;
    4: force tb_top.cpu.l2t4.tag.quad1.bank1.tag_way1 = value;
    5: force tb_top.cpu.l2t5.tag.quad1.bank1.tag_way1 = value;
    6: force tb_top.cpu.l2t6.tag.quad1.bank1.tag_way1 = value;
    7: force tb_top.cpu.l2t7.tag.quad1.bank1.tag_way1 = value;
    endcase
end
endtask

task ReleaseTagWay7;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2t0.tag.quad1.bank1.tag_way1;
    1: release tb_top.cpu.l2t1.tag.quad1.bank1.tag_way1;
    2: release tb_top.cpu.l2t2.tag.quad1.bank1.tag_way1;
    3: release tb_top.cpu.l2t3.tag.quad1.bank1.tag_way1;
    4: release tb_top.cpu.l2t4.tag.quad1.bank1.tag_way1;
    5: release tb_top.cpu.l2t5.tag.quad1.bank1.tag_way1;
    6: release tb_top.cpu.l2t6.tag.quad1.bank1.tag_way1;
    7: release tb_top.cpu.l2t7.tag.quad1.bank1.tag_way1;
    endcase
end
endtask

task SetTagWay8;
input bank;
input [27:0] value;
integer bank;
reg [27:0] value;
begin
   case (bank)
    0: force tb_top.cpu.l2t0.tag.quad2.bank0.tag_way0 = value;
    1: force tb_top.cpu.l2t1.tag.quad2.bank0.tag_way0 = value;
    2: force tb_top.cpu.l2t2.tag.quad2.bank0.tag_way0 = value;
    3: force tb_top.cpu.l2t3.tag.quad2.bank0.tag_way0 = value;
    4: force tb_top.cpu.l2t4.tag.quad2.bank0.tag_way0 = value;
    5: force tb_top.cpu.l2t5.tag.quad2.bank0.tag_way0 = value;
    6: force tb_top.cpu.l2t6.tag.quad2.bank0.tag_way0 = value;
    7: force tb_top.cpu.l2t7.tag.quad2.bank0.tag_way0 = value;
    endcase
end
endtask


task ReleaseTagWay8;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2t0.tag.quad2.bank0.tag_way0;
    1: release tb_top.cpu.l2t1.tag.quad2.bank0.tag_way0;
    2: release tb_top.cpu.l2t2.tag.quad2.bank0.tag_way0;
    3: release tb_top.cpu.l2t3.tag.quad2.bank0.tag_way0;
    4: release tb_top.cpu.l2t4.tag.quad2.bank0.tag_way0;
    5: release tb_top.cpu.l2t5.tag.quad2.bank0.tag_way0;
    6: release tb_top.cpu.l2t6.tag.quad2.bank0.tag_way0;
    7: release tb_top.cpu.l2t7.tag.quad2.bank0.tag_way0;
    endcase
end
endtask

task SetTagWay9;
input bank;
input [27:0] value;
integer bank;
reg [27:0] value;
begin
   case (bank)
    0: force tb_top.cpu.l2t0.tag.quad2.bank0.tag_way1 = value;
    1: force tb_top.cpu.l2t1.tag.quad2.bank0.tag_way1 = value;
    2: force tb_top.cpu.l2t2.tag.quad2.bank0.tag_way1 = value;
    3: force tb_top.cpu.l2t3.tag.quad2.bank0.tag_way1 = value;
    4: force tb_top.cpu.l2t4.tag.quad2.bank0.tag_way1 = value;
    5: force tb_top.cpu.l2t5.tag.quad2.bank0.tag_way1 = value;
    6: force tb_top.cpu.l2t6.tag.quad2.bank0.tag_way1 = value;
    7: force tb_top.cpu.l2t7.tag.quad2.bank0.tag_way1 = value;
    endcase
end
endtask

task ReleaseTagWay9;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2t0.tag.quad2.bank0.tag_way1;
    1: release tb_top.cpu.l2t1.tag.quad2.bank0.tag_way1;
    2: release tb_top.cpu.l2t2.tag.quad2.bank0.tag_way1;
    3: release tb_top.cpu.l2t3.tag.quad2.bank0.tag_way1;
    4: release tb_top.cpu.l2t4.tag.quad2.bank0.tag_way1;
    5: release tb_top.cpu.l2t5.tag.quad2.bank0.tag_way1;
    6: release tb_top.cpu.l2t6.tag.quad2.bank0.tag_way1;
    7: release tb_top.cpu.l2t7.tag.quad2.bank0.tag_way1;
    endcase
end
endtask



task SetTagWay10;
input bank;
input [27:0] value;
integer bank;
reg [27:0] value;
begin
   case (bank)
    0: force tb_top.cpu.l2t0.tag.quad2.bank1.tag_way0 = value;
    1: force tb_top.cpu.l2t1.tag.quad2.bank1.tag_way0 = value;
    2: force tb_top.cpu.l2t2.tag.quad2.bank1.tag_way0 = value;
    3: force tb_top.cpu.l2t3.tag.quad2.bank1.tag_way0 = value;
    4: force tb_top.cpu.l2t4.tag.quad2.bank1.tag_way0 = value;
    5: force tb_top.cpu.l2t5.tag.quad2.bank1.tag_way0 = value;
    6: force tb_top.cpu.l2t6.tag.quad2.bank1.tag_way0 = value;
    7: force tb_top.cpu.l2t7.tag.quad2.bank1.tag_way0 = value;
    endcase
end
endtask

task ReleaseTagWay10;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2t0.tag.quad2.bank1.tag_way0;
    1: release tb_top.cpu.l2t1.tag.quad2.bank1.tag_way0;
    2: release tb_top.cpu.l2t2.tag.quad2.bank1.tag_way0;
    3: release tb_top.cpu.l2t3.tag.quad2.bank1.tag_way0;
    4: release tb_top.cpu.l2t4.tag.quad2.bank1.tag_way0;
    5: release tb_top.cpu.l2t5.tag.quad2.bank1.tag_way0;
    6: release tb_top.cpu.l2t6.tag.quad2.bank1.tag_way0;
    7: release tb_top.cpu.l2t7.tag.quad2.bank1.tag_way0;
    endcase
end
endtask


task SetTagWay11;
input bank;
input [27:0] value;
integer bank;
reg [27:0] value;
begin
   case (bank)
    0: force tb_top.cpu.l2t0.tag.quad2.bank1.tag_way1 = value;
    1: force tb_top.cpu.l2t1.tag.quad2.bank1.tag_way1 = value;
    2: force tb_top.cpu.l2t2.tag.quad2.bank1.tag_way1 = value;
    3: force tb_top.cpu.l2t3.tag.quad2.bank1.tag_way1 = value;
    4: force tb_top.cpu.l2t4.tag.quad2.bank1.tag_way1 = value;
    5: force tb_top.cpu.l2t5.tag.quad2.bank1.tag_way1 = value;
    6: force tb_top.cpu.l2t6.tag.quad2.bank1.tag_way1 = value;
    7: force tb_top.cpu.l2t7.tag.quad2.bank1.tag_way1 = value;
    endcase
end
endtask

task ReleaseTagWay11;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2t0.tag.quad2.bank1.tag_way1;
    1: release tb_top.cpu.l2t1.tag.quad2.bank1.tag_way1;
    2: release tb_top.cpu.l2t2.tag.quad2.bank1.tag_way1;
    3: release tb_top.cpu.l2t3.tag.quad2.bank1.tag_way1;
    4: release tb_top.cpu.l2t4.tag.quad2.bank1.tag_way1;
    5: release tb_top.cpu.l2t5.tag.quad2.bank1.tag_way1;
    6: release tb_top.cpu.l2t6.tag.quad2.bank1.tag_way1;
    7: release tb_top.cpu.l2t7.tag.quad2.bank1.tag_way1;
    endcase
end
endtask


task SetTagWay12;
input bank;
input [27:0] value;
integer bank;
reg [27:0] value;
begin
   case (bank)
    0: force tb_top.cpu.l2t0.tag.quad3.bank0.tag_way0 = value;
    1: force tb_top.cpu.l2t1.tag.quad3.bank0.tag_way0 = value;
    2: force tb_top.cpu.l2t2.tag.quad3.bank0.tag_way0 = value;
    3: force tb_top.cpu.l2t3.tag.quad3.bank0.tag_way0 = value;
    4: force tb_top.cpu.l2t4.tag.quad3.bank0.tag_way0 = value;
    5: force tb_top.cpu.l2t5.tag.quad3.bank0.tag_way0 = value;
    6: force tb_top.cpu.l2t6.tag.quad3.bank0.tag_way0 = value;
    7: force tb_top.cpu.l2t7.tag.quad3.bank0.tag_way0 = value;
    endcase
end
endtask

task ReleaseTagWay12;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2t0.tag.quad3.bank0.tag_way0;
    1: release tb_top.cpu.l2t1.tag.quad3.bank0.tag_way0;
    2: release tb_top.cpu.l2t2.tag.quad3.bank0.tag_way0;
    3: release tb_top.cpu.l2t3.tag.quad3.bank0.tag_way0;
    4: release tb_top.cpu.l2t4.tag.quad3.bank0.tag_way0;
    5: release tb_top.cpu.l2t5.tag.quad3.bank0.tag_way0;
    6: release tb_top.cpu.l2t6.tag.quad3.bank0.tag_way0;
    7: release tb_top.cpu.l2t7.tag.quad3.bank0.tag_way0;
    endcase
end
endtask


task SetTagWay13;
input bank;
input [27:0] value;
integer bank;
reg [27:0] value;
begin
   case (bank)
    0: force tb_top.cpu.l2t0.tag.quad3.bank0.tag_way1 = value;
    1: force tb_top.cpu.l2t1.tag.quad3.bank0.tag_way1 = value;
    2: force tb_top.cpu.l2t2.tag.quad3.bank0.tag_way1 = value;
    3: force tb_top.cpu.l2t3.tag.quad3.bank0.tag_way1 = value;
    4: force tb_top.cpu.l2t4.tag.quad3.bank0.tag_way1 = value;
    5: force tb_top.cpu.l2t5.tag.quad3.bank0.tag_way1 = value;
    6: force tb_top.cpu.l2t6.tag.quad3.bank0.tag_way1 = value;
    7: force tb_top.cpu.l2t7.tag.quad3.bank0.tag_way1 = value;
    endcase
end
endtask

task ReleaseTagWay13;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2t0.tag.quad3.bank0.tag_way1;
    1: release tb_top.cpu.l2t1.tag.quad3.bank0.tag_way1;
    2: release tb_top.cpu.l2t2.tag.quad3.bank0.tag_way1;
    3: release tb_top.cpu.l2t3.tag.quad3.bank0.tag_way1;
    4: release tb_top.cpu.l2t4.tag.quad3.bank0.tag_way1;
    5: release tb_top.cpu.l2t5.tag.quad3.bank0.tag_way1;
    6: release tb_top.cpu.l2t6.tag.quad3.bank0.tag_way1;
    7: release tb_top.cpu.l2t7.tag.quad3.bank0.tag_way1;
    endcase
end
endtask


task SetTagWay14;
input bank;
input [27:0] value;
integer bank;
reg [27:0] value;
begin
   case (bank)
    0: force tb_top.cpu.l2t0.tag.quad3.bank1.tag_way0 = value;
    1: force tb_top.cpu.l2t1.tag.quad3.bank1.tag_way0 = value;
    2: force tb_top.cpu.l2t2.tag.quad3.bank1.tag_way0 = value;
    3: force tb_top.cpu.l2t3.tag.quad3.bank1.tag_way0 = value;
    4: force tb_top.cpu.l2t4.tag.quad3.bank1.tag_way0 = value;
    5: force tb_top.cpu.l2t5.tag.quad3.bank1.tag_way0 = value;
    6: force tb_top.cpu.l2t6.tag.quad3.bank1.tag_way0 = value;
    7: force tb_top.cpu.l2t7.tag.quad3.bank1.tag_way0 = value;
    endcase
end
endtask

task ReleaseTagWay14;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2t0.tag.quad3.bank1.tag_way0;
    1: release tb_top.cpu.l2t1.tag.quad3.bank1.tag_way0;
    2: release tb_top.cpu.l2t2.tag.quad3.bank1.tag_way0;
    3: release tb_top.cpu.l2t3.tag.quad3.bank1.tag_way0;
    4: release tb_top.cpu.l2t4.tag.quad3.bank1.tag_way0;
    5: release tb_top.cpu.l2t5.tag.quad3.bank1.tag_way0;
    6: release tb_top.cpu.l2t6.tag.quad3.bank1.tag_way0;
    7: release tb_top.cpu.l2t7.tag.quad3.bank1.tag_way0;
    endcase
end
endtask

task SetTagWay15;
input bank;
input [27:0] value;
integer bank;
reg [27:0] value;
begin
   case (bank)
    0: force tb_top.cpu.l2t0.tag.quad3.bank1.tag_way1 = value;
    1: force tb_top.cpu.l2t1.tag.quad3.bank1.tag_way1 = value;
    2: force tb_top.cpu.l2t2.tag.quad3.bank1.tag_way1 = value;
    3: force tb_top.cpu.l2t3.tag.quad3.bank1.tag_way1 = value;
    4: force tb_top.cpu.l2t4.tag.quad3.bank1.tag_way1 = value;
    5: force tb_top.cpu.l2t5.tag.quad3.bank1.tag_way1 = value;
    6: force tb_top.cpu.l2t6.tag.quad3.bank1.tag_way1 = value;
    7: force tb_top.cpu.l2t7.tag.quad3.bank1.tag_way1 = value;
    endcase
end
endtask


task ReleaseTagWay15;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2t0.tag.quad3.bank1.tag_way1;
    1: release tb_top.cpu.l2t1.tag.quad3.bank1.tag_way1;
    2: release tb_top.cpu.l2t2.tag.quad3.bank1.tag_way1;
    3: release tb_top.cpu.l2t3.tag.quad3.bank1.tag_way1;
    4: release tb_top.cpu.l2t4.tag.quad3.bank1.tag_way1;
    5: release tb_top.cpu.l2t5.tag.quad3.bank1.tag_way1;
    6: release tb_top.cpu.l2t6.tag.quad3.bank1.tag_way1;
    7: release tb_top.cpu.l2t7.tag.quad3.bank1.tag_way1;
    endcase
end
endtask

task SetWaySel;
input bank;
input way;
integer bank;
integer way;
begin
   case (bank)
    0: force tb_top.cpu.l2t0.tag.way_hit = (1'b1 << way);
    1: force tb_top.cpu.l2t1.tag.way_hit = (1'b1 << way);
    2: force tb_top.cpu.l2t2.tag.way_hit = (1'b1 << way);
    3: force tb_top.cpu.l2t3.tag.way_hit = (1'b1 << way);
    4: force tb_top.cpu.l2t4.tag.way_hit = (1'b1 << way);
    5: force tb_top.cpu.l2t5.tag.way_hit = (1'b1 << way);
    6: force tb_top.cpu.l2t6.tag.way_hit = (1'b1 << way);
    7: force tb_top.cpu.l2t7.tag.way_hit = (1'b1 << way);
   endcase
end
endtask

task ReleaseWaySel;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2t0.tag.way_hit;
    1: release tb_top.cpu.l2t1.tag.way_hit;
    2: release tb_top.cpu.l2t2.tag.way_hit;
    3: release tb_top.cpu.l2t3.tag.way_hit;
    4: release tb_top.cpu.l2t4.tag.way_hit;
    5: release tb_top.cpu.l2t5.tag.way_hit;
    6: release tb_top.cpu.l2t6.tag.way_hit;
    7: release tb_top.cpu.l2t7.tag.way_hit;
   endcase
end
endtask



endmodule
