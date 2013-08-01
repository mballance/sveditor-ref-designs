// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2err_ccm.v
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
module l2err_ccm ( L2_INT_RST,err_cntr);

parameter SAMPLE = 3;
parameter s0=0,s1=1,S0=0,S1=1;


//tb_top tb_top();

//input declarations
input L2_INT_RST;

//output declarations
output [23:0] err_cntr;



//reg declarations
reg stuck_to0, stuck_to1, rand_bit_flip,err_enable, err_enable_fwd,bit_err_enable,bit_err_enable_c5b;
wire take_ade,take_eer,take_retry;
reg trph,trpH;
reg [3:0] bit_pos;
reg [3:0] i;
reg [154:0] k;
reg [63:0] j;
reg [23:0] err_cntr;

reg [127:0] way,way_int;
reg [23:0] cache_col_offset,cache_col_offset_int;
reg [623:0] dataecc,int;
reg [23:0] inject_limit;
reg [39:0] err_addr;
reg injectErr,start_injection;
reg Tevent;
reg [1:0] cs,ns,cs1,ns1;

integer r,m,rand_limit_hi,rand,rand1,rand2;


//wire declarations
wire [8:0] TRAP_EVENT;
wire [39:0]  err_addr_0,err_addr_1,err_addr_2,err_addr_3,err_addr_4,err_addr_5;
wire [39:0]  err_addr_6,err_addr_7;


wire [15:0] cache_way_sel_c3_0,cache_way_sel_c3_1,cache_way_sel_c3_2;  
wire [15:0] cache_way_sel_c3_3,cache_way_sel_c3_4,cache_way_sel_c3_5;  
wire [15:0] cache_way_sel_c3_6,cache_way_sel_c3_7; 
wire [15:0]  cache_way_sel_c3;

wire cache_rd_wr_c3_0,cache_rd_wr_c3_1,cache_rd_wr_c3_2;
wire cache_rd_wr_c3_3,cache_rd_wr_c3_4,cache_rd_wr_c3_5;
wire cache_rd_wr_c3_6,cache_rd_wr_c3_7;
wire [7:0] cache_rd_wr_c3;

wire inst_l2data_vld_c4_0,inst_l2data_vld_c4_1;
wire inst_l2data_vld_c4_2,inst_l2data_vld_c4_3,inst_l2data_vld_c4_4;
wire inst_l2data_vld_c4_5,inst_l2data_vld_c4_6,inst_l2data_vld_c4_7;
wire [7:0] inst_l2data_vld_c4;

wire [8:0] cache_set_c3_0,cache_set_c3_1,cache_set_c3_2,cache_set_c3_3;
wire [8:0] cache_set_c3_4,cache_set_c3_5,cache_set_c3_6,cache_set_c3_7;
wire [71:0] cache_set_c3;

wire [3:0]cache_col_offset_c3_0,cache_col_offset_c3_1;
wire [3:0]cache_col_offset_c3_2,cache_col_offset_c3_3;
wire [3:0] cache_col_offset_c3_4,cache_col_offset_c3_5;
wire [3:0] cache_col_offset_c3_6,cache_col_offset_c3_7;
wire [31:0] cache_col_offset_c3;

wire [623:0] cache_decc_out_c52_0,cache_decc_out_c52_1;
wire [623:0] cache_decc_out_c52_2,cache_decc_out_c52_3;
wire [623:0] cache_decc_out_c52_4,cache_decc_out_c52_5;
wire [623:0] cache_decc_out_c52_6,cache_decc_out_c52_7;
wire [4991:0] cache_decc_out_c52;

/****
wire [623:0] l2d_l2t_decc_c6_0,  l2d_l2t_decc_c6_1,  l2d_l2t_decc_c6_2;
wire [623:0] l2d_l2t_decc_c6_3,  l2d_l2t_decc_c6_4,  l2d_l2t_decc_c6_5;
wire [623:0] l2d_l2t_decc_c6_6,  l2d_l2t_decc_c6_7;
***/

wire [155:0] l2d_l2t_decc_c6_0,  l2d_l2t_decc_c6_1,  l2d_l2t_decc_c6_2;
wire [155:0] l2d_l2t_decc_c6_3,  l2d_l2t_decc_c6_4,  l2d_l2t_decc_c6_5;
wire [155:0] l2d_l2t_decc_c6_6,  l2d_l2t_decc_c6_7;

assign take_retry = tb_top.cpu.spc0.tlu.trl0.take_ret;
assign take_eer   = tb_top.cpu.spc0.tlu.trl0.take_eer; // For Hw Corr
assign take_ade   = tb_top.cpu.spc0.tlu.trl0.take_ade; // For Sw Recov

assign l2d_l2t_decc_c6_0  = tb_top.cpu.l2d0.l2d_l2t_decc_c6;
assign l2d_l2t_decc_c6_1  = tb_top.cpu.l2d1.l2d_l2t_decc_c6;
assign l2d_l2t_decc_c6_2  = tb_top.cpu.l2d2.l2d_l2t_decc_c6;
assign l2d_l2t_decc_c6_3  = tb_top.cpu.l2d3.l2d_l2t_decc_c6;
assign l2d_l2t_decc_c6_4  = tb_top.cpu.l2d4.l2d_l2t_decc_c6;
assign l2d_l2t_decc_c6_5  = tb_top.cpu.l2d5.l2d_l2t_decc_c6;
assign l2d_l2t_decc_c6_6  = tb_top.cpu.l2d6.l2d_l2t_decc_c6;
assign l2d_l2t_decc_c6_7  = tb_top.cpu.l2d7.l2d_l2t_decc_c6;

/****
assign l2d_l2t_decc_c6_0  = tb_top.cpu.l2d0.ctr.l2d_l2t_decc_c6;
assign l2d_l2t_decc_c6_1  = tb_top.cpu.l2d1.ctr.l2d_l2t_decc_c6;
assign l2d_l2t_decc_c6_2  = tb_top.cpu.l2d2.ctr.l2d_l2t_decc_c6;
assign l2d_l2t_decc_c6_3  = tb_top.cpu.l2d3.ctr.l2d_l2t_decc_c6;
assign l2d_l2t_decc_c6_4  = tb_top.cpu.l2d4.ctr.l2d_l2t_decc_c6;
assign l2d_l2t_decc_c6_5  = tb_top.cpu.l2d5.ctr.l2d_l2t_decc_c6;
assign l2d_l2t_decc_c6_6  = tb_top.cpu.l2d6.ctr.l2d_l2t_decc_c6;
assign l2d_l2t_decc_c6_7  = tb_top.cpu.l2d7.ctr.l2d_l2t_decc_c6;

assign l2d_l2t_decc_c6_0  = tb_top.cpu.l2d0.ctr.l2d_decc_out_c6;
assign l2d_l2t_decc_c6_1  = tb_top.cpu.l2d1.ctr.l2d_decc_out_c6;
assign l2d_l2t_decc_c6_2  = tb_top.cpu.l2d2.ctr.l2d_decc_out_c6;
assign l2d_l2t_decc_c6_3  = tb_top.cpu.l2d3.ctr.l2d_decc_out_c6;
assign l2d_l2t_decc_c6_4  = tb_top.cpu.l2d4.ctr.l2d_decc_out_c6;
assign l2d_l2t_decc_c6_5  = tb_top.cpu.l2d5.ctr.l2d_decc_out_c6;
assign l2d_l2t_decc_c6_6  = tb_top.cpu.l2d6.ctr.l2d_decc_out_c6;
assign l2d_l2t_decc_c6_7  = tb_top.cpu.l2d7.ctr.l2d_decc_out_c6;
*****/



assign err_addr_0 = tb_top.cpu.l2t0.arbadr.arbdp_addr_c2;
assign err_addr_1 = tb_top.cpu.l2t1.arbadr.arbdp_addr_c2;
assign err_addr_2 = tb_top.cpu.l2t2.arbadr.arbdp_addr_c2;
assign err_addr_3 = tb_top.cpu.l2t3.arbadr.arbdp_addr_c2;
assign err_addr_4 = tb_top.cpu.l2t4.arbadr.arbdp_addr_c2;
assign err_addr_5 = tb_top.cpu.l2t5.arbadr.arbdp_addr_c2;
assign err_addr_6 = tb_top.cpu.l2t6.arbadr.arbdp_addr_c2;
assign err_addr_7 = tb_top.cpu.l2t7.arbadr.arbdp_addr_c2;

//assign TRAP_EVENT = tb_top.cpu.spc0.tlu.trl0_trap_type;
assign TRAP_EVENT = tb_top.cpu.spc0.tlu.tsd0_wr_trap_type;

assign cache_way_sel_c3_0  =  tb_top.cpu.l2d0.ctr.l2t_l2d_way_sel_c3;
assign cache_way_sel_c3_1  =  tb_top.cpu.l2d1.ctr.l2t_l2d_way_sel_c3;
assign cache_way_sel_c3_2  =  tb_top.cpu.l2d2.ctr.l2t_l2d_way_sel_c3;
assign cache_way_sel_c3_3  =  tb_top.cpu.l2d3.ctr.l2t_l2d_way_sel_c3;
assign cache_way_sel_c3_4  =  tb_top.cpu.l2d4.ctr.l2t_l2d_way_sel_c3;
assign cache_way_sel_c3_5  =  tb_top.cpu.l2d5.ctr.l2t_l2d_way_sel_c3;
assign cache_way_sel_c3_6  =  tb_top.cpu.l2d6.ctr.l2t_l2d_way_sel_c3;
assign cache_way_sel_c3_7  =  tb_top.cpu.l2d7.ctr.l2t_l2d_way_sel_c3;

//assign cache_way_sel_c3 = {cache_way_sel_c3_7,cache_way_sel_c3_6,cache_way_sel_c3_5,cache_way_sel_c3_4,cache_way_sel_c3_3,cache_way_sel_c3_2,cache_way_sel_c3_1,cache_way_sel_c3_0};


assign cache_way_sel_c3[0] = (cache_way_sel_c3_7[0] || cache_way_sel_c3_6[0] || cache_way_sel_c3_5[0] || cache_way_sel_c3_4[0] || cache_way_sel_c3_3[0] || cache_way_sel_c3_2[0] || cache_way_sel_c3_1[0] || cache_way_sel_c3_0[0]);

assign cache_way_sel_c3[1] = (cache_way_sel_c3_7[1] || cache_way_sel_c3_6[1] || cache_way_sel_c3_5[1] || cache_way_sel_c3_4[1] || cache_way_sel_c3_3[1] || cache_way_sel_c3_2[1] || cache_way_sel_c3_1[1] || cache_way_sel_c3_0[1]);

assign cache_way_sel_c3[2] = (cache_way_sel_c3_7[2] || cache_way_sel_c3_6[2] || cache_way_sel_c3_5[2] || cache_way_sel_c3_4[2] || cache_way_sel_c3_3[2] || cache_way_sel_c3_2[2] || cache_way_sel_c3_1[2] || cache_way_sel_c3_0[2]);

assign cache_way_sel_c3[3] = (cache_way_sel_c3_7[3] || cache_way_sel_c3_6[3] || cache_way_sel_c3_5[3] || cache_way_sel_c3_4[3] || cache_way_sel_c3_3[3] || cache_way_sel_c3_2[3] || cache_way_sel_c3_1[3] || cache_way_sel_c3_0[3]);

assign cache_way_sel_c3[4] = (cache_way_sel_c3_7[4] || cache_way_sel_c3_6[4] || cache_way_sel_c3_5[4] || cache_way_sel_c3_4[4] || cache_way_sel_c3_3[4] || cache_way_sel_c3_2[4] || cache_way_sel_c3_1[4] || cache_way_sel_c3_0[4]);

assign cache_way_sel_c3[5] = (cache_way_sel_c3_7[5] || cache_way_sel_c3_6[5] || cache_way_sel_c3_5[5] || cache_way_sel_c3_4[5] || cache_way_sel_c3_3[5] || cache_way_sel_c3_2[5] || cache_way_sel_c3_1[5] || cache_way_sel_c3_0[5]);

assign cache_way_sel_c3[6] = (cache_way_sel_c3_7[6] || cache_way_sel_c3_6[6] || cache_way_sel_c3_5[6] || cache_way_sel_c3_4[6] || cache_way_sel_c3_3[6] || cache_way_sel_c3_2[6] || cache_way_sel_c3_1[6] || cache_way_sel_c3_0[6]);

assign cache_way_sel_c3[7] = (cache_way_sel_c3_7[7] || cache_way_sel_c3_6[7] || cache_way_sel_c3_5[7] || cache_way_sel_c3_4[7] || cache_way_sel_c3_3[7] || cache_way_sel_c3_2[7] || cache_way_sel_c3_1[7] || cache_way_sel_c3_0[7]);

assign cache_way_sel_c3[8] = (cache_way_sel_c3_7[8] || cache_way_sel_c3_6[8] || cache_way_sel_c3_5[8] || cache_way_sel_c3_4[8] || cache_way_sel_c3_3[8] || cache_way_sel_c3_2[8] || cache_way_sel_c3_1[8] || cache_way_sel_c3_0[8]);

assign cache_way_sel_c3[9] = (cache_way_sel_c3_7[9] || cache_way_sel_c3_6[9] || cache_way_sel_c3_5[9] || cache_way_sel_c3_4[9] || cache_way_sel_c3_3[9] || cache_way_sel_c3_2[9] || cache_way_sel_c3_1[9] || cache_way_sel_c3_0[9]);

assign cache_way_sel_c3[10] = (cache_way_sel_c3_7[10] || cache_way_sel_c3_6[10] || cache_way_sel_c3_5[10] || cache_way_sel_c3_4[10] || cache_way_sel_c3_3[10] || cache_way_sel_c3_2[10] || cache_way_sel_c3_1[10] || cache_way_sel_c3_0[10]);

assign cache_way_sel_c3[11] = (cache_way_sel_c3_7[11] || cache_way_sel_c3_6[11] || cache_way_sel_c3_5[11] || cache_way_sel_c3_4[11] || cache_way_sel_c3_3[11] || cache_way_sel_c3_2[11] || cache_way_sel_c3_1[11] || cache_way_sel_c3_0[11]);

assign cache_way_sel_c3[12] = (cache_way_sel_c3_7[12] || cache_way_sel_c3_6[12] || cache_way_sel_c3_5[12] || cache_way_sel_c3_4[12] || cache_way_sel_c3_3[12] || cache_way_sel_c3_2[12] || cache_way_sel_c3_1[12] || cache_way_sel_c3_0[12]);

assign cache_way_sel_c3[13] = (cache_way_sel_c3_7[13] || cache_way_sel_c3_6[13] || cache_way_sel_c3_5[13] || cache_way_sel_c3_4[13] || cache_way_sel_c3_3[13] || cache_way_sel_c3_2[13] || cache_way_sel_c3_1[13] || cache_way_sel_c3_0[13]);

assign cache_way_sel_c3[14] = (cache_way_sel_c3_7[14] || cache_way_sel_c3_6[14] || cache_way_sel_c3_5[14] || cache_way_sel_c3_4[14] || cache_way_sel_c3_3[14] || cache_way_sel_c3_2[14] || cache_way_sel_c3_1[14] || cache_way_sel_c3_0[14]);

assign cache_way_sel_c3[15] = (cache_way_sel_c3_7[15] || cache_way_sel_c3_6[15] || cache_way_sel_c3_5[15] || cache_way_sel_c3_4[15] || cache_way_sel_c3_3[15] || cache_way_sel_c3_2[15] || cache_way_sel_c3_1[15] || cache_way_sel_c3_0[15]);


//assign cache_rd_wr_c3
assign cache_rd_wr_c3_0 = tb_top.cpu.l2d0.ctr.cache_rd_wr_c3;
assign cache_rd_wr_c3_1 = tb_top.cpu.l2d1.ctr.cache_rd_wr_c3;
assign cache_rd_wr_c3_2 = tb_top.cpu.l2d2.ctr.cache_rd_wr_c3;
assign cache_rd_wr_c3_3 = tb_top.cpu.l2d3.ctr.cache_rd_wr_c3;
assign cache_rd_wr_c3_4 = tb_top.cpu.l2d4.ctr.cache_rd_wr_c3;
assign cache_rd_wr_c3_5 = tb_top.cpu.l2d5.ctr.cache_rd_wr_c3;
assign cache_rd_wr_c3_6 = tb_top.cpu.l2d6.ctr.cache_rd_wr_c3;
assign cache_rd_wr_c3_7 = tb_top.cpu.l2d7.ctr.cache_rd_wr_c3;

assign cache_rd_wr_c3 = {cache_rd_wr_c3_7,cache_rd_wr_c3_6,cache_rd_wr_c3_5,cache_rd_wr_c3_4,cache_rd_wr_c3_3,cache_rd_wr_c3_2,cache_rd_wr_c3_1,cache_rd_wr_c3_0};

//inst_l2data_vld_c4
assign inst_l2data_vld_c4_0 = tb_top.cpu.l2t0.arb.inst_l2data_vld_c4;
assign inst_l2data_vld_c4_1 = tb_top.cpu.l2t1.arb.inst_l2data_vld_c4;
assign inst_l2data_vld_c4_2 = tb_top.cpu.l2t2.arb.inst_l2data_vld_c4;
assign inst_l2data_vld_c4_3 = tb_top.cpu.l2t3.arb.inst_l2data_vld_c4;
assign inst_l2data_vld_c4_4 = tb_top.cpu.l2t4.arb.inst_l2data_vld_c4;
assign inst_l2data_vld_c4_5 = tb_top.cpu.l2t5.arb.inst_l2data_vld_c4;
assign inst_l2data_vld_c4_6 = tb_top.cpu.l2t6.arb.inst_l2data_vld_c4;
assign inst_l2data_vld_c4_7 = tb_top.cpu.l2t7.arb.inst_l2data_vld_c4;

assign inst_l2data_vld_c4 = {inst_l2data_vld_c4_7,inst_l2data_vld_c4_6,inst_l2data_vld_c4_5,inst_l2data_vld_c4_4,inst_l2data_vld_c4_3,inst_l2data_vld_c4_2,inst_l2data_vld_c4_1,inst_l2data_vld_c4_0};


// cache_set_c3
assign cache_set_c3_0 = tb_top.cpu.l2d0.ctr.cache_set_c3;
assign cache_set_c3_1 = tb_top.cpu.l2d1.ctr.cache_set_c3;
assign cache_set_c3_2 = tb_top.cpu.l2d2.ctr.cache_set_c3;
assign cache_set_c3_3 = tb_top.cpu.l2d3.ctr.cache_set_c3;
assign cache_set_c3_4 = tb_top.cpu.l2d4.ctr.cache_set_c3;
assign cache_set_c3_5 = tb_top.cpu.l2d5.ctr.cache_set_c3;
assign cache_set_c3_6 = tb_top.cpu.l2d6.ctr.cache_set_c3;
assign cache_set_c3_7 = tb_top.cpu.l2d7.ctr.cache_set_c3;


assign cache_set_c3 = {cache_set_c3_7,cache_set_c3_6,cache_set_c3_5,cache_set_c3_4,cache_set_c3_3,cache_set_c3_2,cache_set_c3_1,cache_set_c3_0};

//cache_col_offset_c3
assign cache_col_offset_c3_0 = tb_top.cpu.l2d0.ctr.cache_col_offset_c3;
assign cache_col_offset_c3_1 = tb_top.cpu.l2d1.ctr.cache_col_offset_c3;
assign cache_col_offset_c3_2 = tb_top.cpu.l2d2.ctr.cache_col_offset_c3;
assign cache_col_offset_c3_3 = tb_top.cpu.l2d3.ctr.cache_col_offset_c3;
assign cache_col_offset_c3_4 = tb_top.cpu.l2d4.ctr.cache_col_offset_c3;
assign cache_col_offset_c3_5 = tb_top.cpu.l2d5.ctr.cache_col_offset_c3;
assign cache_col_offset_c3_6 = tb_top.cpu.l2d6.ctr.cache_col_offset_c3;
assign cache_col_offset_c3_7 = tb_top.cpu.l2d7.ctr.cache_col_offset_c3;

assign  cache_col_offset_c3 = {cache_col_offset_c3_7,cache_col_offset_c3_6,cache_col_offset_c3_5,cache_col_offset_c3_4,cache_col_offset_c3_3,cache_col_offset_c3_2,cache_col_offset_c3_1,cache_col_offset_c3_0};

//cache_decc_out_c52
// changed from c5b to c52 AK 09/20
assign cache_decc_out_c52_0 =  tb_top.cpu.l2d0.ctr.cache_decc_out_c52;
assign cache_decc_out_c52_1 =  tb_top.cpu.l2d1.ctr.cache_decc_out_c52;
assign cache_decc_out_c52_2 =  tb_top.cpu.l2d2.ctr.cache_decc_out_c52;
assign cache_decc_out_c52_3 =  tb_top.cpu.l2d3.ctr.cache_decc_out_c52;
assign cache_decc_out_c52_4 =  tb_top.cpu.l2d4.ctr.cache_decc_out_c52;
assign cache_decc_out_c52_5 =  tb_top.cpu.l2d5.ctr.cache_decc_out_c52;
assign cache_decc_out_c52_6 =  tb_top.cpu.l2d6.ctr.cache_decc_out_c52;
assign cache_decc_out_c52_7 =  tb_top.cpu.l2d7.ctr.cache_decc_out_c52;

assign cache_decc_out_c52 = {cache_decc_out_c52_7,cache_decc_out_c52_6,cache_decc_out_c52_5,cache_decc_out_c52_4,cache_decc_out_c52_3,cache_decc_out_c52_2,cache_decc_out_c52_1,cache_decc_out_c52_0};


initial	
begin


//=================================
// Initialize the forcing variables
//=================================

  stuck_to0 = 1'b0;
  stuck_to1 = 1'b0;
  rand_bit_flip = 1'b0;
  err_enable = 1'b0;
  inject_limit = 0;
  rand_limit_hi = 150;
  err_addr <= 0;


Tevent = 1'b0;
trph = 1'b0;
trpH = 1'b0;
ns=0;
ns1=0;

//=================================
// Initialize the variables used in here
//=================================
rand1 = 0;
rand2 = 0;
injectErr = 0;
start_injection = 0;
    stuck_to1= 0;
    rand_bit_flip = 0;
    err_enable = 0;
    err_enable_fwd = 0;
    bit_err_enable = 0;
    bit_err_enable_c5b = 0;
    bit_pos = 0;


//=========================================
// Check if forcing variables are changed by verargs
//=========================================

  if($test$plusargs("L2DA_BIT_STUCK_TO0")) 
  begin
    stuck_to0= 1;
    `PR_ALWAYS("l2err_injector", `ALWAYS, "L2 bit stuck to 0");
  end
   else if ($test$plusargs("L2DA_BIT_STUCK_TO1")) 
   begin
     stuck_to1= 1;
     `PR_ALWAYS("l2err_injector", `ALWAYS, "L2 bit stuck to 1");
   end
if ($test$plusargs("L2DA_ERR_ENABLE_FWD"))
  begin
     //     err_enable_fwd = 1;
            bit_err_enable = 1;      
     `PR_ALWAYS("l2err_injector", `ALWAYS, "L2 DATA ARRAY Err INJECTION ENABLED");
  end
if ($test$plusargs("L2DA_INT_ERR_ENABLE"))
  begin
          bit_err_enable_c5b = 1;
     `PR_ALWAYS("l2err_injector", `ALWAYS, "L2 DATA ARRAY Err INJECTION ENABLED");
  end
if ($test$plusargs("L2DA_ERR_ENABLE"))
   begin
    //      err_enable_fwd = 1;
     `PR_ALWAYS("l2err_injector", `ALWAYS, "L2 DATA ARRAY Err INJECTION ENABLED");
          bit_err_enable = 1;
     err_enable = 1;
   end
if ($test$plusargs("L2DA_RAND_ERR_ENABLE")) 
  begin
	rand_bit_flip = 1;
          bit_err_enable = 1;

     	`PR_ALWAYS("l2err_injector", `ALWAYS, "L2 DATA ARRAY RANDOM Err INJECTION ENABLED");
   end

end 



always @(TRAP_EVENT)
begin
if( TRAP_EVENT == 9'h1a0 ||  TRAP_EVENT == 9'h100 || TRAP_EVENT == 9'h101 || TRAP_EVENT == 9'h1a1  || TRAP_EVENT == 8'h09 || TRAP_EVENT == 8'h31 || TRAP_EVENT == 9'h18a || TRAP_EVENT == 9'h12a)
	Tevent = 1'b1;
else   Tevent = 1'b0;
//$display("TRAP_EVENT=%x,Tevent= %x",TRAP_EVENT,Tevent);
end

/***
//  review LATER --> while(errorInject && !checkNotData)


always @(posedge tb_top.cpu.l2clk)
begin

if(!L2_INT_RST)
begin

j <= 0;
way <= 0;
way_int <= 0;
cache_col_offset <= 0;
cache_col_offset_int <= 0;
k <= 0;
dataecc <= 0;
int <= 0;
i <= 0;
bit_pos <= 0;
err_addr <= 0;
err_cntr <= 0;

end
else 
begin
if (( `TOP.gOutOfBoot[63:0] === `TOP.verif_args.finish_mask[63:0] ) && bit_err_enable_c5b)
begin
//$display("In INT Logic");
	err_addr <= err_addr_0;
        @(posedge tb_top.cpu.l2clk);

	j <= cache_set_c3;
        way <= Decode(cache_way_sel_c3);
        cache_col_offset <= Decode1(cache_col_offset_c3);

//$display("cache_way_sel_c3_0 = %x,cache_rd_wr_c3 = %x,inst_l2data_vld_c4 = %x,Tevent = %x,trph = %x,trpH = %x",cache_way_sel_c3_0,cache_rd_wr_c3,inst_l2data_vld_c4,Tevent,trph,trpH);

	#(SAMPLE)  if(cache_way_sel_c3_0 != 0 && cache_rd_wr_c3 == 255 && !inst_l2data_vld_c4 && Tevent == 0 && !trph && !trpH && bit_pos[3] != 1) 
  	begin
//$display("In cache_sel_c3");
		//C3
        	@(posedge tb_top.cpu.l2clk);//C4
        	@(posedge tb_top.cpu.l2clk);//C5

       		#(SAMPLE)  k <= cache_col_offset;
// initially was not injecting on negedge but pos edge..simukate and check this.
        	@(negedge tb_top.cpu.l2clk); //Workaround as c5b is valid only for half clk cycle
		#(SAMPLE) i=0;

		if (bit_err_enable_c5b)
                begin
                    SetCacheDeccOutC52(i, ( cache_decc_out_c52_0  ^ (624'b1 << k)));
                    `PR_ALWAYS("l2err_injector", `ALWAYS,"Data array error injected into bank%0d, index%0d, way%0d, bit%0d",i, j, way, k);
	            `PR_ALWAYS("l2err_injector", `ALWAYS,"Data array error injected at PA: %0h",err_addr);
                        err_cntr <= err_cntr + 1;
                end

                @(negedge tb_top.cpu.l2clk);
                #(SAMPLE)  ReleaseCacheDeccOutC52(i);
	end //if(cache_way_sel_c3_0 != 0 ....
	bit_pos = bit_pos +1;
end   //if of OutOfBootCode
end   // else of If(!Rst)

end  //always

**/
//Sequential part of stmc...
//To not inject in traphandler
always @(posedge tb_top.cpu.l2clk)
begin
if(bit_err_enable || bit_err_enable_c5b)
begin
 if(!L2_INT_RST) cs <= s0;
 else cs <= ns;
end
end
//combo logic
always @(s0 or s1 or take_ade or take_retry or cs or bit_err_enable or bit_err_enable_c5b)
begin
if(bit_err_enable || bit_err_enable_c5b)
begin

trph <= 0;
 case(cs)
  s0: 
    begin
     if ( take_ade == 0) ns <= s0;
     else if (take_ade == 1) begin ns <= s1; trph<= 1;end
    end
  s1:
   begin
    if (take_retry == 0)begin  ns <= s1; trph <= 1; end
    else if (take_retry == 1) begin ns <= s0;trph<=0;end
   end
  endcase
//$display("In Combo Logic take_retry=%d,take_ade=%d,trph=%d,ns=%d",take_retry,take_ade,trph,ns);
end
end //end combo logic

always @(posedge tb_top.cpu.l2clk)
begin
if(bit_err_enable || bit_err_enable_c5b)
begin
 if(!L2_INT_RST) cs1 <= S0;
 else cs1 <= ns1;
end
end
//combo logic
always @(S0 or S1 or take_eer or take_retry or cs1)
begin
trpH <= 0;
 case(cs1)
  S0:
    begin
     if ( take_eer == 0) ns1 <= S0;
     else if (take_eer == 1) begin ns1 <= S1; trpH<= 1;end
    end
  S1:
   begin
    if (take_retry == 0)begin  ns1 <= S1; trpH <= 1; end
    else if (take_retry == 1) begin ns1 <= S0;trpH<=0;end
   end
  endcase
//$display("In Combo Logic take_retry=%d,take_ade=%d,trph=%d,ns=%d",take_retry,take_ade,trph,ns);
end //end combo logic

always @(posedge tb_top.cpu.l2clk)
begin

if(!L2_INT_RST)
begin
err_cntr <= 0;
end
else 
begin
if (( `TOP.gOutOfBoot[63:0] === `TOP.verif_args.finish_mask[63:0] ) && (stuck_to0 || stuck_to1 || bit_err_enable || bit_err_enable_c5b))
begin
//$display("In FWD Logic");
//$display("Out Of Boot TOP.gOutOfBoot = %d",`TOP.gOutOfBoot[63:0]);
	err_addr <= err_addr_0;
        j <= cache_set_c3;
        way <= Decode(cache_way_sel_c3);
        cache_col_offset <= Decode1(cache_col_offset_c3);
//$display("cache_way_sel_c3_0 = %x,cache_rd_wr_c3=%x,inst_l2data_vld_c4=%d,Tevent=%x,trph=%d",cache_way_sel_c3_0,cache_rd_wr_c3,inst_l2data_vld_c4,Tevent,trph);
        #(SAMPLE)  if(cache_way_sel_c3_0 != 0 && cache_rd_wr_c3 == 255 && !inst_l2data_vld_c4 && Tevent == 0 && !trph && !trpH) //C3
        begin
                @(posedge tb_top.cpu.l2clk); // C4
                @(posedge tb_top.cpu.l2clk); //C5
//		@(negedge tb_top.cpu.l2clk);
                #(SAMPLE) i=0;
//               if(stuck_to0 == 0  && stuck_to1 == 0 && rand_bit_flip ==0  && err_enable ==0 && err_enable_fwd ==0 && bit_err_enable ==1)
//                begin
                #(SAMPLE)
//                k <= 298;
//		SetCacheDeccOutC52(i, ( cache_decc_out_c52_0  ^ (300'b1 << k)));
//              `PR_ALWAYS("l2err_injector", `ALWAYS,"Data array error injected into bank%0d, index%0d, way%0d, bit%0d",i, j, way, k);
//		@(negedge tb_top.cpu.l2clk);//negedge of C5
//              #(SAMPLE)  ReleaseCacheDeccOutC52(i);
//		end

                @(posedge tb_top.cpu.l2clk);// C52 //Inject in the data array itself
                if(stuck_to0 == 0  && stuck_to1 == 0 && bit_err_enable == 0 && bit_pos[3] != 1 && bit_err_enable_c5b == 1)
                begin
		k = cache_col_offset;
		@(negedge tb_top.cpu.l2clk);
                    SetCacheDeccOutC52(i, ( cache_decc_out_c52_0  ^ (624'b1 << k)));
                    `PR_ALWAYS("l2err_injector", `ALWAYS,"Data array error injected in bank%0d, index%0d, way%0d, bit%0d",i, j, way, k);
                    `PR_ALWAYS("l2err_injector", `ALWAYS,"Data array error injected at PA: %0h",err_addr);
                        err_cntr <= err_cntr + 1;
                @(negedge tb_top.cpu.l2clk);
                #(SAMPLE)  ReleaseCacheDeccOutC52(i);


		end
                @(posedge tb_top.cpu.l2clk); //C6 One clk cycle reduced 10/13/2005
		//Inject in C6 stage of Pipeline and not in data array

                @(negedge tb_top.cpu.l2clk);// negedge of C6
                #(SAMPLE) i=0;
//$display("In bit_pos=%d",bit_pos);
		
		if(stuck_to0 == 0  && stuck_to1 == 0 && bit_err_enable ==1 && bit_pos[3] != 1 && bit_err_enable_c5b == 0)
	//	if(stuck_to0 == 0  && stuck_to1 == 0 && bit_err_enable ==1 && bit_err_enable_c5b == 0)
		begin
	//	if(({$random(`PARGS.seed)} % 16) == 0)
	//	begin
		/**
		if (rand_bit_flip == 1) k <= ({$random(`PARGS.seed)} % 154);
		else  k<= 144; **/
		k <= ({$random(`PARGS.seed)} % 154);
                #(SAMPLE)
                Setl2d_l2t_decc_c6(i, ( l2d_l2t_decc_c6_0  ^ (156'b1 << k)));
		`PR_ALWAYS("l2err_injector", `ALWAYS,"Data array error injected in pipeline in bank%0d, index%0d, way%0d, bit%0d",i, j, way, k);
		`PR_ALWAYS("l2err_injector", `ALWAYS,"Data array error injected at PA %0h",err_addr);

                err_cntr <= err_cntr + 1;
	//	end // end of if({$random(`PARGS.seed)} % 16)
		end // end of if (stuck_to0.....
		else    err_cntr <= err_cntr;
//$display("err_cntr=%d",err_cntr);


                @(negedge tb_top.cpu.l2clk);
                #(SAMPLE)  Releasel2d_l2t_decc_c6(i);
        end //if(cache_way_sel_c3_0 != 0 ....
		bit_pos <= bit_pos + 1;

end   // if od OutOfBootCode
end   // else of If(!Rst)

end  //always




///////////////////////////////////////////////////////////////////////
//This function returns the bit position of the least significant high bit in the bit vector.
///////////////////////////////////////////////////////////////////////

//*function bit [3:0] Decode(bit [15:0] cache_way_sel_c3) */

function Decode;
input [15:0] cache_way_sel_c3;
begin
           if(cache_way_sel_c3[15] == 1) 
                 Decode = 15;
           else if(cache_way_sel_c3[14] == 1) 
                 Decode = 14;
	   else if(cache_way_sel_c3[13] == 1)
                 Decode = 13;
	   else if(cache_way_sel_c3[12] == 1)
                 Decode = 12;
	   else if(cache_way_sel_c3[11] == 1)
                 Decode = 11;
	   else if(cache_way_sel_c3[10] == 1)
                 Decode = 10;
	   else if(cache_way_sel_c3[9] == 1)
                 Decode = 9;
	   else if(cache_way_sel_c3[8] == 1)
                 Decode = 8;
	   else if(cache_way_sel_c3[7] == 1)
                 Decode = 7;
	   else if(cache_way_sel_c3[6] == 1)
                 Decode = 6;
	   else if(cache_way_sel_c3[5] == 1)
                 Decode = 5;
	   else if(cache_way_sel_c3[4] == 1)
                 Decode = 4;
	   else if(cache_way_sel_c3[3] == 1)
                 Decode = 3;
	   else if(cache_way_sel_c3[2] == 1)
                 Decode = 2;
	   else if(cache_way_sel_c3[1] == 1)
                 Decode = 1;
	   else
                 Decode = 0;

		

end 
endfunction

function Decode1;
input [3:0] cache_col_offset_c3;
begin

                if(cache_col_offset_c3[3])
                        Decode1 = 3;
                else if(cache_col_offset_c3[2])
                        Decode1 = 2;
                else if(cache_col_offset_c3[1])
                        Decode1 = 1;
                else
                        Decode1 = 0;

end
endfunction


// Task for error forward
// Removed ctr on 10/13/2005    0: force tb_top.cpu.l2d0.ctr.l2d_l2t_decc_c6 = value;
task Setl2d_l2t_decc_c6;
input bank;
input [155:0] value;
integer bank;
reg [155:0] value;
begin
   case (bank)
    0: force tb_top.cpu.l2d0.l2d_l2t_decc_c6 = value;
    1: force tb_top.cpu.l2d1.l2d_l2t_decc_c6 = value;
    2: force tb_top.cpu.l2d2.l2d_l2t_decc_c6 = value;
    3: force tb_top.cpu.l2d3.l2d_l2t_decc_c6 = value;
    4: force tb_top.cpu.l2d4.l2d_l2t_decc_c6 = value;
    5: force tb_top.cpu.l2d5.l2d_l2t_decc_c6 = value;
    6: force tb_top.cpu.l2d6.l2d_l2t_decc_c6 = value;
    7: force tb_top.cpu.l2d7.l2d_l2t_decc_c6 = value;
   endcase
end
endtask

task Releasel2d_l2t_decc_c6;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2d0.l2d_l2t_decc_c6;
    1: release tb_top.cpu.l2d1.l2d_l2t_decc_c6;
    2: release tb_top.cpu.l2d2.l2d_l2t_decc_c6;
    3: release tb_top.cpu.l2d3.l2d_l2t_decc_c6;
    4: release tb_top.cpu.l2d4.l2d_l2t_decc_c6;
    5: release tb_top.cpu.l2d5.l2d_l2t_decc_c6;
    6: release tb_top.cpu.l2d6.l2d_l2t_decc_c6;
    7: release tb_top.cpu.l2d7.l2d_l2t_decc_c6;
   endcase
end
endtask




/****
 Task for error forward
task Setl2d_l2t_decc_c6;
input bank;
input [623:0] value;
integer bank;
reg [623:0] value;
begin
   case (bank)
    0: force tb_top.cpu.l2d0.ctr.l2d_decc_out_c6 = value;
    1: force tb_top.cpu.l2d1.ctr.l2d_decc_out_c6 = value;
    2: force tb_top.cpu.l2d2.ctr.l2d_decc_out_c6 = value;
    3: force tb_top.cpu.l2d3.ctr.l2d_decc_out_c6 = value;
    4: force tb_top.cpu.l2d4.ctr.l2d_decc_out_c6 = value;
    5: force tb_top.cpu.l2d5.ctr.l2d_decc_out_c6 = value;
    6: force tb_top.cpu.l2d6.ctr.l2d_decc_out_c6 = value;
    7: force tb_top.cpu.l2d7.ctr.l2d_decc_out_c6 = value;
   endcase
end
endtask

task Releasel2d_l2t_decc_c6;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2d0.ctr.l2d_decc_out_c6;
    1: release tb_top.cpu.l2d1.ctr.l2d_decc_out_c6;
    2: release tb_top.cpu.l2d2.ctr.l2d_decc_out_c6;
    3: release tb_top.cpu.l2d3.ctr.l2d_decc_out_c6;
    4: release tb_top.cpu.l2d4.ctr.l2d_decc_out_c6;
    5: release tb_top.cpu.l2d5.ctr.l2d_decc_out_c6;
    6: release tb_top.cpu.l2d6.ctr.l2d_decc_out_c6;
    7: release tb_top.cpu.l2d7.ctr.l2d_decc_out_c6;
   endcase
end
endtask
***/


/*** Old task 
task SetCacheDeccOutC52;
input bank;
input [623:0] value;
integer bank;
reg [623:0] value;
begin
   case (bank)
    0: force tb_top.cpu.l2d0.ctr.cache_decc_out_c5b = value;
    1: force tb_top.cpu.l2d1.ctr.cache_decc_out_c5b = value;
    2: force tb_top.cpu.l2d2.ctr.cache_decc_out_c5b = value;
    3: force tb_top.cpu.l2d3.ctr.cache_decc_out_c5b = value;
    4: force tb_top.cpu.l2d4.ctr.cache_decc_out_c5b = value;
    5: force tb_top.cpu.l2d5.ctr.cache_decc_out_c5b = value;
    6: force tb_top.cpu.l2d6.ctr.cache_decc_out_c5b = value;
    7: force tb_top.cpu.l2d7.ctr.cache_decc_out_c5b = value;
   endcase
end
endtask

task ReleaseCacheDeccOutC52;
input bank;
integer bank;
begin
   case (bank)
    0: release tb_top.cpu.l2d0.ctr.cache_decc_out_c5b;
    1: release tb_top.cpu.l2d1.ctr.cache_decc_out_c5b;
    2: release tb_top.cpu.l2d2.ctr.cache_decc_out_c5b;
    3: release tb_top.cpu.l2d3.ctr.cache_decc_out_c5b;
    4: release tb_top.cpu.l2d4.ctr.cache_decc_out_c5b;
    5: release tb_top.cpu.l2d5.ctr.cache_decc_out_c5b;
    6: release tb_top.cpu.l2d6.ctr.cache_decc_out_c5b;
    7: release tb_top.cpu.l2d7.ctr.cache_decc_out_c5b;
   endcase
end
endtask ****/


// New Task

task SetCacheDeccOutC52;
input bank;
input [623:0] value;
integer bank;
reg [623:0] value;
begin
//$display("In Task SetCacheDeccOutC52");
   case (bank)
    0:begin
        force tb_top.cpu.l2d0.ctr.cache_decc_out_0_c52 = value[155:0];
        force tb_top.cpu.l2d0.ctr.cache_decc_out_1_c52 = value[311:156];
        force tb_top.cpu.l2d0.ctr.cache_decc_out_2_c52 = value[467:312];
        force tb_top.cpu.l2d0.ctr.cache_decc_out_3_c52 = value[623:468];
      end
    1:begin
        force tb_top.cpu.l2d1.ctr.cache_decc_out_0_c52 = value[155:0];
        force tb_top.cpu.l2d1.ctr.cache_decc_out_1_c52 = value[311:156];
        force tb_top.cpu.l2d1.ctr.cache_decc_out_2_c52 = value[467:312];
        force tb_top.cpu.l2d1.ctr.cache_decc_out_3_c52 = value[623:468];
      end
    2:begin
        force tb_top.cpu.l2d2.ctr.cache_decc_out_0_c52 = value[155:0];
        force tb_top.cpu.l2d2.ctr.cache_decc_out_1_c52 = value[311:156];
        force tb_top.cpu.l2d2.ctr.cache_decc_out_2_c52 = value[467:312];
        force tb_top.cpu.l2d2.ctr.cache_decc_out_3_c52 = value[623:468];
      end
    3:begin
        force tb_top.cpu.l2d3.ctr.cache_decc_out_0_c52 = value[155:0];
        force tb_top.cpu.l2d3.ctr.cache_decc_out_1_c52 = value[311:156];
        force tb_top.cpu.l2d3.ctr.cache_decc_out_2_c52 = value[467:312];
        force tb_top.cpu.l2d3.ctr.cache_decc_out_3_c52 = value[623:468];
      end
    4:begin
        force tb_top.cpu.l2d4.ctr.cache_decc_out_0_c52 = value[155:0];
        force tb_top.cpu.l2d4.ctr.cache_decc_out_1_c52 = value[311:156];
        force tb_top.cpu.l2d4.ctr.cache_decc_out_2_c52 = value[467:312];
        force tb_top.cpu.l2d4.ctr.cache_decc_out_3_c52 = value[623:468];
      end
    5:begin
        force tb_top.cpu.l2d5.ctr.cache_decc_out_0_c52 = value[155:0];
        force tb_top.cpu.l2d5.ctr.cache_decc_out_1_c52 = value[311:156];
        force tb_top.cpu.l2d5.ctr.cache_decc_out_2_c52 = value[467:312];
        force tb_top.cpu.l2d5.ctr.cache_decc_out_3_c52 = value[623:468];
      end
6:begin
        force tb_top.cpu.l2d6.ctr.cache_decc_out_0_c52 = value[155:0];
        force tb_top.cpu.l2d6.ctr.cache_decc_out_1_c52 = value[311:156];
        force tb_top.cpu.l2d6.ctr.cache_decc_out_2_c52 = value[467:312];
        force tb_top.cpu.l2d6.ctr.cache_decc_out_3_c52 = value[623:468];
      end
    7:begin
        force tb_top.cpu.l2d7.ctr.cache_decc_out_0_c52 = value[155:0];
        force tb_top.cpu.l2d7.ctr.cache_decc_out_1_c52 = value[311:156];
        force tb_top.cpu.l2d7.ctr.cache_decc_out_2_c52 = value[467:312];
        force tb_top.cpu.l2d7.ctr.cache_decc_out_3_c52 = value[623:468];
      end
   endcase
end
endtask

task ReleaseCacheDeccOutC52;
input bank;
integer bank;
begin
   case (bank)
    0:begin
         release tb_top.cpu.l2d0.ctr.cache_decc_out_0_c52;
         release tb_top.cpu.l2d0.ctr.cache_decc_out_1_c52;
         release tb_top.cpu.l2d0.ctr.cache_decc_out_2_c52;
         release tb_top.cpu.l2d0.ctr.cache_decc_out_3_c52;
      end
    1: begin
         release tb_top.cpu.l2d1.ctr.cache_decc_out_0_c52;
         release tb_top.cpu.l2d1.ctr.cache_decc_out_1_c52;
         release tb_top.cpu.l2d1.ctr.cache_decc_out_2_c52;
         release tb_top.cpu.l2d1.ctr.cache_decc_out_3_c52;
      end
    2: begin
         release tb_top.cpu.l2d2.ctr.cache_decc_out_0_c52;
         release tb_top.cpu.l2d2.ctr.cache_decc_out_1_c52;
         release tb_top.cpu.l2d2.ctr.cache_decc_out_2_c52;
         release tb_top.cpu.l2d2.ctr.cache_decc_out_3_c52;
      end
    3:begin
         release tb_top.cpu.l2d3.ctr.cache_decc_out_0_c52;
         release tb_top.cpu.l2d3.ctr.cache_decc_out_1_c52;
         release tb_top.cpu.l2d3.ctr.cache_decc_out_2_c52;
         release tb_top.cpu.l2d3.ctr.cache_decc_out_3_c52;
      end
    4: begin
         release tb_top.cpu.l2d4.ctr.cache_decc_out_0_c52;
         release tb_top.cpu.l2d4.ctr.cache_decc_out_1_c52;
         release tb_top.cpu.l2d4.ctr.cache_decc_out_2_c52;
         release tb_top.cpu.l2d4.ctr.cache_decc_out_3_c52;
      end
    5:begin
         release tb_top.cpu.l2d5.ctr.cache_decc_out_0_c52;
         release tb_top.cpu.l2d5.ctr.cache_decc_out_1_c52;
         release tb_top.cpu.l2d5.ctr.cache_decc_out_2_c52;
         release tb_top.cpu.l2d5.ctr.cache_decc_out_3_c52;
      end
    6:begin
         release tb_top.cpu.l2d6.ctr.cache_decc_out_0_c52;
         release tb_top.cpu.l2d6.ctr.cache_decc_out_1_c52;
         release tb_top.cpu.l2d6.ctr.cache_decc_out_2_c52;
         release tb_top.cpu.l2d6.ctr.cache_decc_out_3_c52;
      end
    7:begin
         release tb_top.cpu.l2d7.ctr.cache_decc_out_0_c52;
         release tb_top.cpu.l2d7.ctr.cache_decc_out_1_c52;
         release tb_top.cpu.l2d7.ctr.cache_decc_out_2_c52;
         release tb_top.cpu.l2d7.ctr.cache_decc_out_3_c52;
      end
   endcase
end
endtask





endmodule   


