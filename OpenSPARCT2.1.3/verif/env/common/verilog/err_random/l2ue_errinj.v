// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2ue_errinj.v
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
module l2ue_errinj ( L2_INT_RST,err_cntr);

parameter SAMPLE = 3;
parameter s0=0,s1=1;


//tb_top tb_top();

//input declarations
input L2_INT_RST;

//output declarations
output [23:0] err_cntr;


//reg declarations
reg stuck_to0, stuck_to1, rand_bit_flip,err_enable, err_enable_fwd,trph;
wire take_dae,take_retry;
reg [1:0] cs,ns;
reg [2:0] bit_err_enable;
reg [4:0] bit_pos;
//reg [6:0] bit_pos1;
reg [3:0] i;
reg [11:0] k,k1,n;
reg [63:0] j;
reg [23:0] err_cntr;
reg [2:0] sel_bank;

reg [127:0] way,way_int;
reg [23:0] cache_col_offset,cache_col_offset_int;
reg [623:0] dataecc,int;
reg [23:0] inject_limit;
reg [39:0] err_addr;
reg injectErr,start_injection;
reg Tevent;

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
wire cache_rd_wr_c3;

wire inst_l2data_vld_c4_0,inst_l2data_vld_c4_1;
wire inst_l2data_vld_c4_2,inst_l2data_vld_c4_3,inst_l2data_vld_c4_4;
wire inst_l2data_vld_c4_5,inst_l2data_vld_c4_6,inst_l2data_vld_c4_7;
wire inst_l2data_vld_c4;

wire [8:0] cache_set_c3_0,cache_set_c3_1,cache_set_c3_2,cache_set_c3_3;
wire [8:0] cache_set_c3_4,cache_set_c3_5,cache_set_c3_6,cache_set_c3_7;
wire [8:0] cache_set_c3;

wire [3:0]cache_col_offset_c3_0,cache_col_offset_c3_1;
wire [3:0]cache_col_offset_c3_2,cache_col_offset_c3_3;
wire [3:0] cache_col_offset_c3_4,cache_col_offset_c3_5;
wire [3:0] cache_col_offset_c3_6,cache_col_offset_c3_7;
wire [3:0] cache_col_offset_c3;

wire [623:0] cache_decc_out_c52_0,cache_decc_out_c52_1;
wire [623:0] cache_decc_out_c52_2,cache_decc_out_c52_3;
wire [623:0] cache_decc_out_c52_4,cache_decc_out_c52_5;
wire [623:0] cache_decc_out_c52_6,cache_decc_out_c52_7;
wire [623:0] cache_decc_out_c52;

/****
wire [623:0] l2d_l2t_decc_c6_0,  l2d_l2t_decc_c6_1,  l2d_l2t_decc_c6_2;
wire [623:0] l2d_l2t_decc_c6_3,  l2d_l2t_decc_c6_4,  l2d_l2t_decc_c6_5;
wire [623:0] l2d_l2t_decc_c6_6,  l2d_l2t_decc_c6_7;
***/

wire [155:0] l2d_l2t_decc_c6_0,  l2d_l2t_decc_c6_1,  l2d_l2t_decc_c6_2;
wire [155:0] l2d_l2t_decc_c6_3,  l2d_l2t_decc_c6_4,  l2d_l2t_decc_c6_5;
wire [155:0] l2d_l2t_decc_c6_6,  l2d_l2t_decc_c6_7,l2d_l2t_decc_c6;

//wire [63:0] L2esr_logged;
wire L2esr_logged;

assign take_retry = tb_top.cpu.spc0.tlu.trl0.take_ret;
assign take_dae   = tb_top.cpu.spc0.tlu.trl0.take_dae; // For Data Access

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

/***

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
****/

//assign cache_rd_wr_c3
assign cache_rd_wr_c3_0 = tb_top.cpu.l2d0.ctr.cache_rd_wr_c3;
assign cache_rd_wr_c3_1 = tb_top.cpu.l2d1.ctr.cache_rd_wr_c3;
assign cache_rd_wr_c3_2 = tb_top.cpu.l2d2.ctr.cache_rd_wr_c3;
assign cache_rd_wr_c3_3 = tb_top.cpu.l2d3.ctr.cache_rd_wr_c3;
assign cache_rd_wr_c3_4 = tb_top.cpu.l2d4.ctr.cache_rd_wr_c3;
assign cache_rd_wr_c3_5 = tb_top.cpu.l2d5.ctr.cache_rd_wr_c3;
assign cache_rd_wr_c3_6 = tb_top.cpu.l2d6.ctr.cache_rd_wr_c3;
assign cache_rd_wr_c3_7 = tb_top.cpu.l2d7.ctr.cache_rd_wr_c3;

/***
assign cache_rd_wr_c3 = {cache_rd_wr_c3_7,cache_rd_wr_c3_6,cache_rd_wr_c3_5,cache_rd_wr_c3_4,cache_rd_wr_c3_3,cache_rd_wr_c3_2,cache_rd_wr_c3_1,cache_rd_wr_c3_0};
***/
//inst_l2data_vld_c4
assign inst_l2data_vld_c4_0 = tb_top.cpu.l2t0.arb.inst_l2data_vld_c4;
assign inst_l2data_vld_c4_1 = tb_top.cpu.l2t1.arb.inst_l2data_vld_c4;
assign inst_l2data_vld_c4_2 = tb_top.cpu.l2t2.arb.inst_l2data_vld_c4;
assign inst_l2data_vld_c4_3 = tb_top.cpu.l2t3.arb.inst_l2data_vld_c4;
assign inst_l2data_vld_c4_4 = tb_top.cpu.l2t4.arb.inst_l2data_vld_c4;
assign inst_l2data_vld_c4_5 = tb_top.cpu.l2t5.arb.inst_l2data_vld_c4;
assign inst_l2data_vld_c4_6 = tb_top.cpu.l2t6.arb.inst_l2data_vld_c4;
assign inst_l2data_vld_c4_7 = tb_top.cpu.l2t7.arb.inst_l2data_vld_c4;

/****
assign inst_l2data_vld_c4 = {inst_l2data_vld_c4_7,inst_l2data_vld_c4_6,inst_l2data_vld_c4_5,inst_l2data_vld_c4_4,inst_l2data_vld_c4_3,inst_l2data_vld_c4_2,inst_l2data_vld_c4_1,inst_l2data_vld_c4_0};
***/

// cache_set_c3
assign cache_set_c3_0 = tb_top.cpu.l2d0.ctr.cache_set_c3;
assign cache_set_c3_1 = tb_top.cpu.l2d1.ctr.cache_set_c3;
assign cache_set_c3_2 = tb_top.cpu.l2d2.ctr.cache_set_c3;
assign cache_set_c3_3 = tb_top.cpu.l2d3.ctr.cache_set_c3;
assign cache_set_c3_4 = tb_top.cpu.l2d4.ctr.cache_set_c3;
assign cache_set_c3_5 = tb_top.cpu.l2d5.ctr.cache_set_c3;
assign cache_set_c3_6 = tb_top.cpu.l2d6.ctr.cache_set_c3;
assign cache_set_c3_7 = tb_top.cpu.l2d7.ctr.cache_set_c3;

/***
assign cache_set_c3 = {cache_set_c3_7,cache_set_c3_6,cache_set_c3_5,cache_set_c3_4,cache_set_c3_3,cache_set_c3_2,cache_set_c3_1,cache_set_c3_0};
***/

//cache_col_offset_c3
assign cache_col_offset_c3_0 = tb_top.cpu.l2d0.ctr.cache_col_offset_c3;
assign cache_col_offset_c3_1 = tb_top.cpu.l2d1.ctr.cache_col_offset_c3;
assign cache_col_offset_c3_2 = tb_top.cpu.l2d2.ctr.cache_col_offset_c3;
assign cache_col_offset_c3_3 = tb_top.cpu.l2d3.ctr.cache_col_offset_c3;
assign cache_col_offset_c3_4 = tb_top.cpu.l2d4.ctr.cache_col_offset_c3;
assign cache_col_offset_c3_5 = tb_top.cpu.l2d5.ctr.cache_col_offset_c3;
assign cache_col_offset_c3_6 = tb_top.cpu.l2d6.ctr.cache_col_offset_c3;
assign cache_col_offset_c3_7 = tb_top.cpu.l2d7.ctr.cache_col_offset_c3;

/****
assign  cache_col_offset_c3 = {cache_col_offset_c3_7,cache_col_offset_c3_6,cache_col_offset_c3_5,cache_col_offset_c3_4,cache_col_offset_c3_3,cache_col_offset_c3_2,cache_col_offset_c3_1,cache_col_offset_c3_0};
***/
//cache_decc_out_c52
assign cache_decc_out_c52_0 =  tb_top.cpu.l2d0.ctr.cache_decc_out_c5b;
assign cache_decc_out_c52_1 =  tb_top.cpu.l2d1.ctr.cache_decc_out_c5b;
assign cache_decc_out_c52_2 =  tb_top.cpu.l2d2.ctr.cache_decc_out_c5b;
assign cache_decc_out_c52_3 =  tb_top.cpu.l2d3.ctr.cache_decc_out_c5b;
assign cache_decc_out_c52_4 =  tb_top.cpu.l2d4.ctr.cache_decc_out_c5b;
assign cache_decc_out_c52_5 =  tb_top.cpu.l2d5.ctr.cache_decc_out_c5b;
assign cache_decc_out_c52_6 =  tb_top.cpu.l2d6.ctr.cache_decc_out_c5b;
assign cache_decc_out_c52_7 =  tb_top.cpu.l2d7.ctr.cache_decc_out_c5b;

 assign L2esr_logged  = (tb_top.cpu.l2t0.csr.csr_l2_errstate_reg[52]|
   tb_top.cpu.l2t1.csr.csr_l2_errstate_reg[52]|
   tb_top.cpu.l2t2.csr.csr_l2_errstate_reg[52]|
   tb_top.cpu.l2t3.csr.csr_l2_errstate_reg[52]|
   tb_top.cpu.l2t4.csr.csr_l2_errstate_reg[52]|
   tb_top.cpu.l2t5.csr.csr_l2_errstate_reg[52]|
   tb_top.cpu.l2t6.csr.csr_l2_errstate_reg[52]|
   tb_top.cpu.l2t7.csr.csr_l2_errstate_reg[52]);


/***
assign cache_decc_out_c52 = {cache_decc_out_c52_7,cache_decc_out_c52_6,cache_decc_out_c52_5,cache_decc_out_c52_4,cache_decc_out_c52_3,cache_decc_out_c52_2,cache_decc_out_c52_1,cache_decc_out_c52_0};
****/

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
  bit_pos = 4;
  trph = 0;
  err_cntr = 0;
  //L2esr_logged = 0;
  Tevent = 1'b0;

//=================================
// Initialize the variables used in here
//=================================
k1 = 0;
k=0;n=0;
rand1 = 0;
rand2 = 0;
injectErr = 0;
start_injection = 0;
    stuck_to1= 0;
    rand_bit_flip = 0;
    err_enable = 0;
    err_enable_fwd = 0;
    bit_err_enable = 0;


//=========================================
//run args
//=========================================

/**  if($test$plusargs("L2DA_2BIT_STUCK_TO0")) 
  begin
    stuck_to0= 1;
    `PR_ALWAYS("l2err_injector", `ALWAYS, "L2 bit stuck to 0");
  end
   else if ($test$plusargs("L2DA_2BIT_STUCK_TO1")) 
   begin
     stuck_to1= 1;
     `PR_ALWAYS("l2err_injector", `ALWAYS, "L2 bit stuck to 1");
   end
else **/ 

if ($test$plusargs("L2DA_INJECT_UE_ALLBANKS") )
  begin
          bit_err_enable = 1;
     `PR_ALWAYS("l2err_injector", `ALWAYS, "L2 UE DataArray err Injection Enabled");
  end
else if($test$plusargs("L2DA_INJECT_UE_RANDOM"))
  begin
          bit_err_enable = 2;
     `PR_ALWAYS("l2err_injector", `ALWAYS, "L2 UE DataArray err Injection Enabled");
  end
else if($test$plusargs("L2DA_INJECT_UE"))
  begin
          bit_err_enable = 3;
     `PR_ALWAYS("l2err_injector", `ALWAYS, "L2 UE DataArray err Injection Enabled");
  end
else if($test$plusargs("L2DA_INJECT_UE_IN_BURSTS"))
  begin
          bit_err_enable = 4;
     `PR_ALWAYS("l2err_injector", `ALWAYS, "L2 UE DataArray err Injection Enabled");
  end
else if($test$plusargs("L2DA_INJECT_ONE_UE"))
  begin
          bit_err_enable = 5;
     `PR_ALWAYS("l2err_injector", `ALWAYS, "L2 UE DataArray err Injection Enabled");
  end



end 

//Sequential part of stmc...
//To not inject in traphandler
always @(posedge tb_top.cpu.l2clk)
begin
if(bit_err_enable)
begin
 if(!L2_INT_RST) cs <= s0;
 else cs <= ns;
end
end
//combo logic
always @(s0 or s1 or take_dae or take_retry or cs)
begin
trph <= 0;
 case(cs)
  s0:  
    begin
     if ( take_dae == 0) ns <= s0;
     else if (take_dae == 1) begin ns <= s1; trph<= 1;end
    end
  s1:
   begin
    if (take_retry == 0)begin  ns <= s1; trph <= 1; end
    else if (take_retry == 1) begin ns <= s0;trph<=0;end
   end
  endcase
//$display("In Combo Logic take_retry=%d,take_dae=%d,trph=%d,ns=%d",take_retry,take_dae,trph,ns); 
end //end combo logic



always @(posedge tb_top.cpu.l2clk)
begin
if(!L2_INT_RST)
begin
 sel_bank = 3'b000;
end
else
begin
  if(Tevent == 0 && trph == 0 && ( `TOP.gOutOfBoot[63:0] === `TOP.verif_args.finish_mask[63:0] ) && bit_err_enable != 0 ) //&& !L2esr_logged)
  begin
   sel_bank = 3'b000;
      if(bit_err_enable == 1)
      begin
         if(cache_way_sel_c3_0 != 0 && cache_rd_wr_c3_0 == 1 && !inst_l2data_vld_c4_0 && Tevent == 0) //C3
	   sel_bank = 3'b000;
         else if(cache_way_sel_c3_1 != 0 && cache_rd_wr_c3_1 == 1 && !inst_l2data_vld_c4_1 && Tevent == 0) 
          sel_bank = 3'b001;
         else if(cache_way_sel_c3_2 != 0 && cache_rd_wr_c3_2 == 1 && !inst_l2data_vld_c4_2 && Tevent == 0)
          sel_bank = 3'b010;
         else if(cache_way_sel_c3_3 != 0 && cache_rd_wr_c3_3 == 1 && !inst_l2data_vld_c4_3 && Tevent == 0)
          sel_bank = 3'b011;
         else if(cache_way_sel_c3_4 != 0 && cache_rd_wr_c3_4 == 1 && !inst_l2data_vld_c4_4 && Tevent == 0)
          sel_bank = 3'b100;
         else if(cache_way_sel_c3_5 != 0 && cache_rd_wr_c3_5 == 1 && !inst_l2data_vld_c4_5 && Tevent == 0)
          sel_bank = 3'b101;
         else if(cache_way_sel_c3_6 != 0 && cache_rd_wr_c3_6 == 1 && !inst_l2data_vld_c4_6 && Tevent == 0)
          sel_bank = 3'b110;
         else if(cache_way_sel_c3_7 != 0 && cache_rd_wr_c3_7 == 1 && !inst_l2data_vld_c4_7 && Tevent == 0)
          sel_bank = 3'b111;
//$display("In Main sel_bank=%x after bit_err is enabled \n\n",sel_bank);
     end // for if allbanks
     else if (bit_err_enable != 1 && bit_err_enable != 0)
          sel_bank = 3'b000;
   end // if(Tevent && trph ....
//$display("In Main sel_bank = %d\n\n",sel_bank);
end //if else of if (!L2_INT_RST)
end //always block

//always @(sel_bank)
always @(posedge tb_top.cpu.l2clk)
begin
if(Tevent == 0 && trph == 0 && ( `TOP.gOutOfBoot[63:0] === `TOP.verif_args.finish_mask[63:0] ) && bit_err_enable != 0 )
begin
//$display("In Selecting Block sel_bank = %d\n\n",sel_bank);

case(sel_bank)
3'b000:  inject_err(sel_bank,cache_set_c3_0,cache_way_sel_c3_0,cache_rd_wr_c3_0,inst_l2data_vld_c4_0,stuck_to0,stuck_to1,bit_err_enable,l2d_l2t_decc_c6_0);
3'b001:  inject_err(sel_bank,cache_set_c3_1,cache_way_sel_c3_1,cache_rd_wr_c3_1,inst_l2data_vld_c4_1,stuck_to0,stuck_to1,bit_err_enable,l2d_l2t_decc_c6_1);

3'b010:  inject_err(sel_bank,cache_set_c3_2,cache_way_sel_c3_2,cache_rd_wr_c3_2,inst_l2data_vld_c4_2,stuck_to0,stuck_to1,bit_err_enable,l2d_l2t_decc_c6_2);

3'b011:  inject_err(sel_bank,cache_set_c3_3,cache_way_sel_c3_3,cache_rd_wr_c3_3,inst_l2data_vld_c4_3,stuck_to0,stuck_to1,bit_err_enable,l2d_l2t_decc_c6_3);

3'b100:  inject_err(sel_bank,cache_set_c3_4,cache_way_sel_c3_4,cache_rd_wr_c3_4,inst_l2data_vld_c4_4,stuck_to0,stuck_to1,bit_err_enable,l2d_l2t_decc_c6_4);
3'b101:  inject_err(sel_bank,cache_set_c3_5,cache_way_sel_c3_5,cache_rd_wr_c3_5,inst_l2data_vld_c4_5,stuck_to0,stuck_to1,bit_err_enable,l2d_l2t_decc_c6_5);
3'b110:  inject_err(sel_bank,cache_set_c3_6,cache_way_sel_c3_6,cache_rd_wr_c3_6,inst_l2data_vld_c4_6,stuck_to0,stuck_to1,bit_err_enable,l2d_l2t_decc_c6_6);
3'b111:  inject_err(sel_bank,cache_set_c3_7,cache_way_sel_c3_7,cache_rd_wr_c3_7,inst_l2data_vld_c4_7,stuck_to0,stuck_to1,bit_err_enable,l2d_l2t_decc_c6_7);
endcase

end // if
end //always


always @(TRAP_EVENT)
begin
if( TRAP_EVENT == 9'h1a0 ||  TRAP_EVENT == 9'h100 || TRAP_EVENT == 9'h101 || TRAP_EVENT == 9'h1a1 || TRAP_EVENT == 8'h09  || TRAP_EVENT == 9'h18a || TRAP_EVENT == 9'h12a)
	Tevent = 1'b1;
else    Tevent = 1'b0;
//$display("Tevent = %d",Tevent);
end



task inject_err;

input [2:0] sel_bank;
input [8:0] cache_set_c3;
input [15:0] cache_way_sel_c3;
//input [3:0] cache_col_offset_c3;
input cache_rd_wr_c3;
input inst_l2data_vld_c4;
input stuck_to0;
input stuck_to1;
input [2:0] bit_err_enable;
input [155:0] l2d_l2t_decc_c6;
integer k,n,way;

begin
if ( `TOP.gOutOfBoot[63:0] === `TOP.verif_args.finish_mask[63:0] )
begin
//$display("In task Block sel_bank = %d\n\n",sel_bank);
//$display(" Outside If Loop cache_way_sel_c3 = %x,cache_rd_wr_c3 = %x,inst_l2data_vld_c4 = %x,Tevent = %x,bit_pos = %x,bit_err_enable = %x",cache_way_sel_c3,cache_rd_wr_c3,inst_l2data_vld_c4,Tevent,bit_pos,bit_err_enable);
//$display("L2esr_logged = %x",L2esr_logged);

        way = Decode(cache_way_sel_c3);
//        cache_col_offset = Decode1(cache_col_offset_c3);

        #(SAMPLE)  if(cache_way_sel_c3 != 0 && cache_rd_wr_c3 == 1 && !inst_l2data_vld_c4 && Tevent == 0 && !L2esr_logged) //C3
        begin
//$display(" Inside If Loop cache_way_sel_c3 = %x,cache_rd_wr_c3 = %x,inst_l2data_vld_c4 = %x,Tevent = %x,bit_pos = %x,bit_err_enable = %x,L2esr_logged = %x",cache_way_sel_c3,cache_rd_wr_c3,inst_l2data_vld_c4,Tevent,bit_pos,bit_err_enable,L2esr_logged);
		bit_pos  = bit_pos + 1;
		err_cntr = err_cntr;
                @(posedge tb_top.cpu.l2clk); // C4
                @(posedge tb_top.cpu.l2clk); //C5
                @(posedge tb_top.cpu.l2clk);// C52 //two more clk cycles for forward
// MSA 10/30/2006                @(posedge tb_top.cpu.l2clk); //C6 One clk cycle reduced 10/13/2005

                @(negedge tb_top.cpu.l2clk);// negedge of C6
		////////////////////
		/////Stuck At 0/////	
		////////////////////
                if((stuck_to0 == 1  && stuck_to1 == 0 &&  bit_err_enable ==0))
                begin
                k <= 144; n <= 140; #(SAMPLE) l2d_l2t_decc_c6[k] = (l2d_l2t_decc_c6[k] & 1'b0);
                #(SAMPLE) l2d_l2t_decc_c6[n] = (l2d_l2t_decc_c6[n] & 1'b0);
                Setl2d_l2t_decc_c6(sel_bank, (l2d_l2t_decc_c6));
                `PR_ALWAYS("l2err_injector", `ALWAYS,"UE injected in Data Array in bank%0d, index%0d, way%0d, bit%0d and %0d",sel_bank, cache_set_c3, way, k,n); err_cntr <= err_cntr + 1;
                end
		////////////////////
		/////Stuck At 1/////
		////////////////////
                else if((stuck_to0 == 0  && stuck_to1 == 1 &&  bit_err_enable ==0))
                begin
                k <= 144; n <= 140; #(SAMPLE) l2d_l2t_decc_c6[k] = (l2d_l2t_decc_c6[k] | 1'b1);
                #(SAMPLE) l2d_l2t_decc_c6[n] = (l2d_l2t_decc_c6[n] | 1'b1);
                Setl2d_l2t_decc_c6(sel_bank, (l2d_l2t_decc_c6));
                `PR_DEBUG("l2err_injector", `DEBUG,"UE injected in Data Array in bank%0d, index%0d, way%0d, bit%0d and %0d",sel_bank, cache_set_c3, way, k,n); err_cntr <= err_cntr + 1;
                end
///////////////
//ue injection
///////////////
///////////////
//Inject error randomly
///////////////
		else if((stuck_to0 == 0  && stuck_to1 == 0 &&  bit_err_enable == 2 && !({$random(`PARGS.seed)} % 16)))
		begin
                k = ({$random(`PARGS.seed)} % 154) ;
                //n <= 140;
                n = k + 1;
                #(SAMPLE)
                l2d_l2t_decc_c6[k] = (l2d_l2t_decc_c6[k] ^ 1'b1);

                l2d_l2t_decc_c6[n] = (l2d_l2t_decc_c6[n] ^ 1'b1);

                #(SAMPLE)
                Setl2d_l2t_decc_c6(sel_bank, (l2d_l2t_decc_c6));

                `PR_ALWAYS("l2err_injector", `ALWAYS,"UE injected in Data Array in bank%0d, index%0d, way%0d, bit%0d and %0d",sel_bank, cache_set_c3, way, k,n);

                err_cntr = err_cntr + 1;
//$display(" In if of task , err_cntr = %d",err_cntr);
		end
///////////////
// ue Inject 1 error in 100 loads
///////////////
                else if((stuck_to0 == 0  && stuck_to1 == 0 && ( bit_err_enable == 3 || bit_err_enable == 1) && bit_pos == 30))
                begin
                k = ({$random(`PARGS.seed)} % 154) ;
                //n <= 140;
                n = k + 1;
                #(SAMPLE)
                l2d_l2t_decc_c6[k] = (l2d_l2t_decc_c6[k] ^ 1'b1);

                l2d_l2t_decc_c6[n] = (l2d_l2t_decc_c6[n] ^ 1'b1);

                #(SAMPLE)
                Setl2d_l2t_decc_c6(sel_bank, (l2d_l2t_decc_c6));

                `PR_ALWAYS("l2err_injector", `ALWAYS,"UE injected in Data Array in bank%0d, index%0d, way%0d, bit%0d and %0d",sel_bank, cache_set_c3, way, k,n);

                err_cntr = err_cntr + 1;
//$display(" In if of task , err_cntr = %d",err_cntr);
                end
///////////////
// Inject error in Bursts
///////////////
                else if((stuck_to0 == 0  && stuck_to1 == 0 &&  bit_err_enable == 4 && bit_pos[3] != 1))
                begin
                k = ({$random(`PARGS.seed)} % 154) ;
                //n <= 140;
                n = k + 1;
                #(SAMPLE)
                l2d_l2t_decc_c6[k] = (l2d_l2t_decc_c6[k] ^ 1'b1);

                l2d_l2t_decc_c6[n] = (l2d_l2t_decc_c6[n] ^ 1'b1);

                #(SAMPLE)
                Setl2d_l2t_decc_c6(sel_bank, (l2d_l2t_decc_c6));

                `PR_ALWAYS("l2err_injector", `ALWAYS,"UE injected in Data Array in bank%0d, index%0d, way%0d, bit%0d and %0d",sel_bank, cache_set_c3, way, k,n);

                err_cntr = err_cntr + 1;
//$display(" In if of task , err_cntr = %d",err_cntr);
                end
                @(negedge tb_top.cpu.l2clk);
                #(SAMPLE)  Releasel2d_l2t_decc_c6(sel_bank);
        end //if(cache_way_sel_c3_0 != 0 ....
end   // else of If(!Rst)
end   // else of If(!Rst)

endtask



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

endmodule   


