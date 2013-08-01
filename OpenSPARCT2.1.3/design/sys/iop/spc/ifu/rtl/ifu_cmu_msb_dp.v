// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_cmu_msb_dp.v
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
module ifu_cmu_msb_dp (
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  mct_clken, 
  l15_spc_cpkt, 
  ftu_paddr, 
  ftu_rep_way, 
  ftu_inv_req, 
  ftu_thrx_un_cacheable, 
  lsc_pending_req, 
  lsc_req_sel, 
  mct_upd_addr, 
  mct_real_wom, 
  mdp_mbhit_q, 
  mdp_lsi_rway, 
  ifu_l15_addr, 
  mdp_lsi_nc_bit, 
  mdp_lsi_inv_bit, 
  cmu_fill_wrway, 
  cmu_fill_paddr, 
  scan_out) ;
wire stop;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire ftu_thrx_un_cacheable_buf;
wire [2:0] ftu_rep_way_buf;
wire [39:0] ftu_paddr_buf;
wire [44:0] e0_misc_dout;
wire [44:0] e0_misc_din;
wire [44:0] e1_misc_dout;
wire [44:0] e1_misc_din;
wire [44:0] e2_misc_dout;
wire [44:0] e2_misc_din;
wire [44:0] e3_misc_dout;
wire [44:0] e3_misc_din;
wire [44:0] e4_misc_dout;
wire [44:0] e4_misc_din;
wire [44:0] e5_misc_dout;
wire [44:0] e5_misc_din;
wire [44:0] e6_misc_dout;
wire [44:0] e6_misc_din;
wire [44:0] e7_misc_dout;
wire [44:0] e7_misc_din;
wire e0_phyaddr_reg_scanin;
wire e0_phyaddr_reg_scanout;
wire e1_phyaddr_reg_scanin;
wire e1_phyaddr_reg_scanout;
wire e2_phyaddr_reg_scanin;
wire e2_phyaddr_reg_scanout;
wire e3_phyaddr_reg_scanin;
wire e3_phyaddr_reg_scanout;
wire e4_phyaddr_reg_scanin;
wire e4_phyaddr_reg_scanout;
wire e5_phyaddr_reg_scanin;
wire e5_phyaddr_reg_scanout;
wire e6_phyaddr_reg_scanin;
wire e6_phyaddr_reg_scanout;
wire e7_phyaddr_reg_scanin;
wire e7_phyaddr_reg_scanout;
wire [7:0] cmp1_hit;
wire [7:0] cmp2_hit;
wire [2:0] cmu_fill_wrway_prebuf;
wire [39:0] cmu_fill_paddr_prebuf;
wire mdp_lsi_nc_bit_prebuf;
wire mdp_lsi_inv_bit_prebuf;
wire [2:0] mdp_lsi_rway_prebuf;
wire [39:0] ifu_l15_addr_din;
wire [39:0] ifu_l15_addr_mux;
wire [39:39] ifu_l15_addr_muxbuf;
wire [4:0] ifu_l15_addr_mux_bit4_0;
wire [38:5] ifu_l15_addr_mux_minbuf;
wire ifu_l15_lat0_scanin;
wire ifu_l15_lat0_scanout;
wire [39:0] ifu_l15_addr_prebuf;


input tcu_scan_en ;
input l2clk;
input scan_in;
input tcu_pce_ov;		// scan signals
input spc_aclk;
input spc_bclk;

input [7:0]  mct_clken;

input [8:6] l15_spc_cpkt;

input [39:0] ftu_paddr;
input [2:0]  ftu_rep_way;    
input [7:0]  ftu_inv_req;         //from ftu tsm
input        ftu_thrx_un_cacheable;

input        lsc_pending_req;
input [7:0]  lsc_req_sel;     //selected pending requests

input [7:0]  mct_upd_addr;    //one-hot signal, selects one MB line to be updated for phys addr
input [7:0]  mct_real_wom;    // real wom bits


output [7:0] mdp_mbhit_q;     // misbuffer hit


output [2:0] mdp_lsi_rway;   //MB to LSU
output [39:0] ifu_l15_addr; //MB to lsu
output        mdp_lsi_nc_bit;    //cacheable bit from MB to CMSB
output        mdp_lsi_inv_bit;    //cacheable bit from MB to CMSB
//output mdp_lsu_par_bit;      //parity bit from MB to ??

output [2:0]  cmu_fill_wrway;  //MB to ??
output [39:0] cmu_fill_paddr;//MB to lsu
//output mdp_fill_par_bit;     //parity bit from MB to ??

output        scan_out;

// scan renames
assign stop = 1'b0 ;
// end scan

//assign l2clk = clk;
ifu_cmu_msb_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 test_rep0   (
  .din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk}),
  .dout({se,pce_ov,siclk,soclk})
);

// buffer ftu data before using it
ifu_cmu_msb_dp_buff_macro__stack_60c__width_44 ftu_data  (
	.din	({ftu_thrx_un_cacheable, ftu_rep_way[2:0], ftu_paddr[39:0]}),
	.dout	({ftu_thrx_un_cacheable_buf, ftu_rep_way_buf[2:0], ftu_paddr_buf[39:0]})
);

////////////////////////////////////////////////////////////////
// Miss buffers
// physical adress, cacheable bit, parity bit and replace way
// registers for all entries
////////////////////////////////////////////////////////////////
ifu_cmu_msb_dp_mux_macro__mux_aope__ports_2__stack_60c__width_45 addr_upd_mux0  (
    .din1({e0_misc_dout[44:0]}),
    .din0({ftu_thrx_un_cacheable_buf, ftu_inv_req[0], ftu_rep_way_buf[2:0], ftu_paddr_buf[39:0]}),
    .sel0(mct_upd_addr[0]),
    .dout({e0_misc_din[44:0]})
);

ifu_cmu_msb_dp_mux_macro__mux_aope__ports_2__stack_60c__width_45 addr_upd_mux1  (
    .din1({e1_misc_dout[44:0]}),
    .din0({ftu_thrx_un_cacheable_buf, ftu_inv_req[1], ftu_rep_way_buf[2:0], ftu_paddr_buf[39:0]}),
    .sel0(mct_upd_addr[1]),
    .dout({e1_misc_din[44:0]})
);

ifu_cmu_msb_dp_mux_macro__mux_aope__ports_2__stack_60c__width_45 addr_upd_mux2  (
    .din1({e2_misc_dout[44:0]}),
    .din0({ftu_thrx_un_cacheable_buf, ftu_inv_req[2], ftu_rep_way_buf[2:0], ftu_paddr_buf[39:0]}),
    .sel0(mct_upd_addr[2]),
    .dout({e2_misc_din[44:0]})
);

ifu_cmu_msb_dp_mux_macro__mux_aope__ports_2__stack_60c__width_45 addr_upd_mux3  (
    .din1({e3_misc_dout[44:0]}),
    .din0({ftu_thrx_un_cacheable_buf, ftu_inv_req[3], ftu_rep_way_buf[2:0], ftu_paddr_buf[39:0]}),
    .sel0(mct_upd_addr[3]),
    .dout({e3_misc_din[44:0]})
);

ifu_cmu_msb_dp_mux_macro__mux_aope__ports_2__stack_60c__width_45 addr_upd_mux4  (
    .din1({e4_misc_dout[44:0]}),
    .din0({ftu_thrx_un_cacheable_buf, ftu_inv_req[4], ftu_rep_way_buf[2:0], ftu_paddr_buf[39:0]}),
    .sel0(mct_upd_addr[4]),
    .dout({e4_misc_din[44:0]})
);

ifu_cmu_msb_dp_mux_macro__mux_aope__ports_2__stack_60c__width_45 addr_upd_mux5  (
    .din1({e5_misc_dout[44:0]}),
    .din0({ftu_thrx_un_cacheable_buf, ftu_inv_req[5], ftu_rep_way_buf[2:0], ftu_paddr_buf[39:0]}),
    .sel0(mct_upd_addr[5]),
    .dout({e5_misc_din[44:0]})
);

ifu_cmu_msb_dp_mux_macro__mux_aope__ports_2__stack_60c__width_45 addr_upd_mux6  (
    .din1({e6_misc_dout[44:0]}),
    .din0({ftu_thrx_un_cacheable_buf, ftu_inv_req[6], ftu_rep_way_buf[2:0], ftu_paddr_buf[39:0]}),
    .sel0(mct_upd_addr[6]),
    .dout({e6_misc_din[44:0]})
);

ifu_cmu_msb_dp_mux_macro__mux_aope__ports_2__stack_60c__width_45 addr_upd_mux7  (
    .din1({e7_misc_dout[44:0]}),
    .din0({ftu_thrx_un_cacheable_buf, ftu_inv_req[7], ftu_rep_way_buf[2:0], ftu_paddr_buf[39:0]}),
    .sel0(mct_upd_addr[7]),
    .dout({e7_misc_din[44:0]})
);

ifu_cmu_msb_dp_msff_macro__stack_60c__width_45 e0_phyaddr_reg  (
    .scan_in(e0_phyaddr_reg_scanin),
    .scan_out(e0_phyaddr_reg_scanout),
    .clk (l2clk),
    .en  (mct_clken[0]),
    .din ({e0_misc_din[44:0]}),
    .dout({e0_misc_dout[44:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

ifu_cmu_msb_dp_msff_macro__stack_60c__width_45 e1_phyaddr_reg  (
    .scan_in(e1_phyaddr_reg_scanin),
    .scan_out(e1_phyaddr_reg_scanout),
    .clk (l2clk),
    .en  (mct_clken[1]),
    .din ({e1_misc_din[44:0]}),
    .dout({e1_misc_dout[44:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

ifu_cmu_msb_dp_msff_macro__stack_60c__width_45 e2_phyaddr_reg  (
    .scan_in(e2_phyaddr_reg_scanin),
    .scan_out(e2_phyaddr_reg_scanout),
    .clk (l2clk),
    .en  (mct_clken[2]),
    .din ({e2_misc_din[44:0]}),
    .dout({e2_misc_dout[44:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

ifu_cmu_msb_dp_msff_macro__stack_60c__width_45 e3_phyaddr_reg  (
    .scan_in(e3_phyaddr_reg_scanin),
    .scan_out(e3_phyaddr_reg_scanout),
    .clk (l2clk),
    .en  (mct_clken[3]),
    .din ({e3_misc_din[44:0]}),
    .dout({e3_misc_dout[44:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

ifu_cmu_msb_dp_msff_macro__stack_60c__width_45 e4_phyaddr_reg  (
    .scan_in(e4_phyaddr_reg_scanin),
    .scan_out(e4_phyaddr_reg_scanout),
    .clk (l2clk),
    .en  (mct_clken[4]),
    .din ({e4_misc_din[44:0]}),
    .dout({e4_misc_dout[44:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

ifu_cmu_msb_dp_msff_macro__stack_60c__width_45 e5_phyaddr_reg  (
    .scan_in(e5_phyaddr_reg_scanin),
    .scan_out(e5_phyaddr_reg_scanout),
    .clk (l2clk),
    .en  (mct_clken[5]),
    .din ({e5_misc_din[44:0]}),
    .dout({e5_misc_dout[44:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

ifu_cmu_msb_dp_msff_macro__stack_60c__width_45 e6_phyaddr_reg  (
    .scan_in(e6_phyaddr_reg_scanin),
    .scan_out(e6_phyaddr_reg_scanout),
    .en  (mct_clken[6]),
    .clk (l2clk),
    .din ({e6_misc_din[44:0]}),
    .dout({e6_misc_dout[44:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

ifu_cmu_msb_dp_msff_macro__stack_60c__width_45 e7_phyaddr_reg  (
    .scan_in(e7_phyaddr_reg_scanin),
    .scan_out(e7_phyaddr_reg_scanout),
    .clk (l2clk),
    .en  (mct_clken[7]),
    .din ({e7_misc_din[44:0]}), // ifu_lsu_nc_bit_mux, ifu_lsu_rway_mux[2:0]}),
    .dout({e7_misc_dout[44:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)  // ifu_lsu_nc_bit    ,     ifu_lsu_rway[2:0]})
);

////////////////////////////////////////////////////////////////
// hit/miss logic
// never generate a hit if the incoming request is non-cacheable.
// This is taken care of in cmp1.
// never generate a hit if stored entry is non-cacheable, or
// it is a inv_req. This is taken care of in cmp2
////////////////////////////////////////////////////////////////
ifu_cmu_msb_dp_cmp_macro__dcmp_8x__width_32 e0_addrhit_cmp1  (
    .dout( cmp1_hit[0]), 
    .din1( {1'b0, e0_misc_dout[35:5]}), 
    .din0( {1'b0, ftu_paddr_buf[35:5]})
); 

ifu_cmu_msb_dp_cmp_macro__dcmp_8x__width_32 e1_addrhit_cmp1  (
    .dout( cmp1_hit[1]), 
    .din1( {1'b0, e1_misc_dout[35:5]}), 
    .din0( {1'b0, ftu_paddr_buf[35:5]})
); 

ifu_cmu_msb_dp_cmp_macro__dcmp_8x__width_32 e2_addrhit_cmp1  (
    .dout( cmp1_hit[2]), 
    .din1( {1'b0, e2_misc_dout[35:5]}), 
    .din0( {1'b0, ftu_paddr_buf[35:5]})
); 

ifu_cmu_msb_dp_cmp_macro__dcmp_8x__width_32 e3_addrhit_cmp1  (
    .dout( cmp1_hit[3]), 
    .din1( {1'b0, e3_misc_dout[35:5]}), 
    .din0( {1'b0, ftu_paddr_buf[35:5]})
); 

ifu_cmu_msb_dp_cmp_macro__dcmp_8x__width_32 e4_addrhit_cmp1  (
    .dout( cmp1_hit[4]), 
    .din1( {1'b0, e4_misc_dout[35:5]}), 
    .din0( {1'b0, ftu_paddr_buf[35:5]})
); 

ifu_cmu_msb_dp_cmp_macro__dcmp_8x__width_32 e5_addrhit_cmp1  (
    .dout( cmp1_hit[5]), 
    .din1( {1'b0, e5_misc_dout[35:5]}), 
    .din0( {1'b0, ftu_paddr_buf[35:5]})
); 

ifu_cmu_msb_dp_cmp_macro__dcmp_8x__width_32 e6_addrhit_cmp1  (
    .dout( cmp1_hit[6]), 
    .din1( {1'b0, e6_misc_dout[35:5]}), 
    .din0( {1'b0, ftu_paddr_buf[35:5]})
); 

ifu_cmu_msb_dp_cmp_macro__dcmp_8x__width_32 e7_addrhit_cmp1  (
    .dout( cmp1_hit[7]), 
    .din1( {1'b0, e7_misc_dout[35:5]}), 
    .din0( {1'b0, ftu_paddr_buf[35:5]})
); 

ifu_cmu_msb_dp_cmp_macro__dcmp_8x__width_8 e0_addrhit_cmp2  (
    .dout(cmp2_hit[0]), 
    .din1({e0_misc_dout[44:43], 1'b0, 1'b0,                  e0_misc_dout[39:36]}), 
    .din0({2'b00,               1'b0, ftu_thrx_un_cacheable_buf, ftu_paddr_buf[39:36]})
); 

ifu_cmu_msb_dp_cmp_macro__dcmp_8x__width_8 e1_addrhit_cmp2  (
    .dout(cmp2_hit[1]), 
    .din1({e1_misc_dout[44:43], 1'b0, 1'b0,                  e1_misc_dout[39:36]}), 
    .din0({2'b00,               1'b0, ftu_thrx_un_cacheable_buf, ftu_paddr_buf[39:36]})
); 

ifu_cmu_msb_dp_cmp_macro__dcmp_8x__width_8 e2_addrhit_cmp2  (
    .dout(cmp2_hit[2]), 
    .din1({e2_misc_dout[44:43], 1'b0, 1'b0,                  e2_misc_dout[39:36]}), 
    .din0({2'b00,               1'b0, ftu_thrx_un_cacheable_buf, ftu_paddr_buf[39:36]})
); 

ifu_cmu_msb_dp_cmp_macro__dcmp_8x__width_8 e3_addrhit_cmp2  (
    .dout(cmp2_hit[3]), 
    .din1({e3_misc_dout[44:43], 1'b0, 1'b0,                  e3_misc_dout[39:36]}), 
    .din0({2'b00,               1'b0, ftu_thrx_un_cacheable_buf, ftu_paddr_buf[39:36]})
); 

ifu_cmu_msb_dp_cmp_macro__dcmp_8x__width_8 e4_addrhit_cmp2  (
    .dout(cmp2_hit[4]), 
    .din1({e4_misc_dout[44:43], 1'b0, 1'b0,                  e4_misc_dout[39:36]}), 
    .din0({2'b00,               1'b0, ftu_thrx_un_cacheable_buf, ftu_paddr_buf[39:36]})
); 

ifu_cmu_msb_dp_cmp_macro__dcmp_8x__width_8 e5_addrhit_cmp2  (
    .dout(cmp2_hit[5]), 
    .din1({e5_misc_dout[44:43], 1'b0, 1'b0,                  e5_misc_dout[39:36]}), 
    .din0({2'b00,               1'b0, ftu_thrx_un_cacheable_buf, ftu_paddr_buf[39:36]})
); 

ifu_cmu_msb_dp_cmp_macro__dcmp_8x__width_8 e6_addrhit_cmp2  (
    .dout(cmp2_hit[6]), 
    .din1({e6_misc_dout[44:43], 1'b0, 1'b0,                  e6_misc_dout[39:36]}), 
    .din0({2'b00,               1'b0, ftu_thrx_un_cacheable_buf, ftu_paddr_buf[39:36]})
); 

ifu_cmu_msb_dp_cmp_macro__dcmp_8x__width_8 e7_addrhit_cmp2  (
    .dout(cmp2_hit[7]), 
    .din1({e7_misc_dout[44:43], 1'b0, 1'b0,                  e7_misc_dout[39:36]}), 
    .din0({2'b00,               1'b0, ftu_thrx_un_cacheable_buf, ftu_paddr_buf[39:36]})
); 

ifu_cmu_msb_dp_and_macro__ports_3__stack_2l__width_1 and0  (
    .din0(cmp1_hit[0]),
    .din1(cmp2_hit[0]),
    .din2(mct_real_wom[0]),
    .dout(mdp_mbhit_q[0])
);

ifu_cmu_msb_dp_and_macro__ports_3__stack_2l__width_1 and1  (
    .din0(cmp1_hit[1]),
    .din1(cmp2_hit[1]),
    .din2(mct_real_wom[1]),
    .dout(mdp_mbhit_q[1])
);

ifu_cmu_msb_dp_and_macro__ports_3__stack_2l__width_1 and2  (
    .din0(cmp1_hit[2]),
    .din1(cmp2_hit[2]),
    .din2(mct_real_wom[2]),
    .dout(mdp_mbhit_q[2])
);

ifu_cmu_msb_dp_and_macro__ports_3__stack_2l__width_1 and3  (
    .din0(cmp1_hit[3]),
    .din1(cmp2_hit[3]),
    .din2(mct_real_wom[3]),
    .dout(mdp_mbhit_q[3])
);

ifu_cmu_msb_dp_and_macro__ports_3__stack_2l__width_1 and4  (
    .din0(cmp1_hit[4]),
    .din1(cmp2_hit[4]),
    .din2(mct_real_wom[4]),
    .dout(mdp_mbhit_q[4])
);

ifu_cmu_msb_dp_and_macro__ports_3__stack_2l__width_1 and5  (
    .din0(cmp1_hit[5]),
    .din1(cmp2_hit[5]),
    .din2(mct_real_wom[5]),
    .dout(mdp_mbhit_q[5])
);

ifu_cmu_msb_dp_and_macro__ports_3__stack_2l__width_1 and6  (
    .din0(cmp1_hit[6]),
    .din1(cmp2_hit[6]),
    .din2(mct_real_wom[6]),
    .dout(mdp_mbhit_q[6])
);

ifu_cmu_msb_dp_and_macro__ports_3__stack_2l__width_1 and7  (
    .din0(cmp1_hit[7]),
    .din1(cmp2_hit[7]),
    .din2(mct_real_wom[7]),
    .dout(mdp_mbhit_q[7])
);

////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// MUX OUT MB data and send it to ftu
////////////////////////////////////////////////////////////////
// Mux out remaing bits based on the return thread id
// sent to ftu
ifu_cmu_msb_dp_mux_macro__mux_aodec__ports_8__stack_60c__width_43 fillwait_data_mux2  (
    .din0({e0_misc_dout[42:0]}),
    .din1({e1_misc_dout[42:0]}),
    .din2({e2_misc_dout[42:0]}),
    .din3({e3_misc_dout[42:0]}),
    .din4({e4_misc_dout[42:0]}),
    .din5({e5_misc_dout[42:0]}),
    .din6({e6_misc_dout[42:0]}),
    .din7({e7_misc_dout[42:0]}),
    .sel(l15_spc_cpkt[8:6]),
    .dout({cmu_fill_wrway_prebuf[2:0], cmu_fill_paddr_prebuf[39:0]})
);

ifu_cmu_msb_dp_buff_macro__stack_60c__width_43 fillwait_data_buf2  (
	.din	({cmu_fill_wrway_prebuf[2:0], cmu_fill_paddr_prebuf[39:0]}),
	.dout	({cmu_fill_wrway[2:0], cmu_fill_paddr[39:0]})
);

// mux out MB data to send request out to gkt
// select based on pending req selected
ifu_cmu_msb_dp_mux_macro__mux_aonpe__ports_8__stack_60c__width_45 cmu_data_mux1  (
    .din0(e0_misc_dout[44:0]),
    .din1(e1_misc_dout[44:0]),
    .din2(e2_misc_dout[44:0]),
    .din3(e3_misc_dout[44:0]),
    .din4(e4_misc_dout[44:0]),
    .din5(e5_misc_dout[44:0]),
    .din6(e6_misc_dout[44:0]),
    .din7(e7_misc_dout[44:0]),
    .sel0(lsc_req_sel[0]),
    .sel1(lsc_req_sel[1]),
    .sel2(lsc_req_sel[2]),
    .sel3(lsc_req_sel[3]),
    .sel4(lsc_req_sel[4]),
    .sel5(lsc_req_sel[5]),
    .sel6(lsc_req_sel[6]),
    .sel7(lsc_req_sel[7]),
    .dout({mdp_lsi_nc_bit_prebuf, mdp_lsi_inv_bit_prebuf, mdp_lsi_rway_prebuf[2:0], ifu_l15_addr_din[39:0]})
);

// Mux out incoming request if no pending req
ifu_cmu_msb_dp_mux_macro__mux_aope__ports_2__stack_60c__width_40 ifu_l15_mux0  (
    .din1(ftu_paddr_buf[39:0]),
    .din0(ifu_l15_addr_din[39:0]),
    .sel0(lsc_pending_req),
    .dout(ifu_l15_addr_mux[39:0])
);

// if bit 39 = 1, it indicates a NCU or L2 CSR request.
// if bit 39 = 0, it is a l2 request, and bits 4:0 need to be
// cleared in this case.
ifu_cmu_msb_dp_and_macro__ports_2__stack_60c__width_5 ifu_l15_and_4_0 
(
 .din1({5{ifu_l15_addr_muxbuf[39]}}),
 .din0(ifu_l15_addr_mux[4:0]),
 .dout(ifu_l15_addr_mux_bit4_0[4:0])
 );

ifu_cmu_msb_dp_buff_macro__minbuff_1__stack_60c__width_34 ifu_l15_minbuf    (
	.din	({ifu_l15_addr_mux[38:5]}),
	.dout	({ifu_l15_addr_mux_minbuf[38:5]})
);

ifu_cmu_msb_dp_msff_macro__stack_60c__width_40 ifu_l15_lat0  (
    .scan_in(ifu_l15_lat0_scanin),
    .scan_out(ifu_l15_lat0_scanout),
    .clk (l2clk),
    .en  (1'b1),
    .din ({ifu_l15_addr_muxbuf[39],ifu_l15_addr_mux_minbuf[38:5], ifu_l15_addr_mux_bit4_0[4:0]}),
    .dout({ifu_l15_addr_prebuf[39:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

ifu_cmu_msb_dp_buff_macro__stack_60c__width_46 ifu_l15_buf0  (
	.din	({ifu_l15_addr_mux[39],    mdp_lsi_nc_bit_prebuf, mdp_lsi_inv_bit_prebuf, mdp_lsi_rway_prebuf[2:0], ifu_l15_addr_prebuf[39:0]}),
	.dout	({ifu_l15_addr_muxbuf[39], mdp_lsi_nc_bit, mdp_lsi_inv_bit, mdp_lsi_rway[2:0], ifu_l15_addr[39:0]})
);
                                              

// fixscan start:
assign e0_phyaddr_reg_scanin     = scan_in                  ;
assign e1_phyaddr_reg_scanin     = e0_phyaddr_reg_scanout   ;
assign e2_phyaddr_reg_scanin     = e1_phyaddr_reg_scanout   ;
assign e3_phyaddr_reg_scanin     = e2_phyaddr_reg_scanout   ;
assign e4_phyaddr_reg_scanin     = e3_phyaddr_reg_scanout   ;
assign e5_phyaddr_reg_scanin     = e4_phyaddr_reg_scanout   ;
assign e6_phyaddr_reg_scanin     = e5_phyaddr_reg_scanout   ;
assign e7_phyaddr_reg_scanin     = e6_phyaddr_reg_scanout   ;
assign ifu_l15_lat0_scanin       = e7_phyaddr_reg_scanout   ;
assign scan_out                  = ifu_l15_lat0_scanout     ;
// fixscan end:
endmodule


//
//   buff macro
//
//





module ifu_cmu_msb_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 (
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
//   buff macro
//
//





module ifu_cmu_msb_dp_buff_macro__stack_60c__width_44 (
  din, 
  dout);
  input [43:0] din;
  output [43:0] dout;






buff #(44)  d0_0 (
.in(din[43:0]),
.out(dout[43:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_cmu_msb_dp_mux_macro__mux_aope__ports_2__stack_60c__width_45 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [44:0] din0;
  input [44:0] din1;
  input sel0;
  output [44:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(45)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[44:0]),
  .in1(din1[44:0]),
.dout(dout[44:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module ifu_cmu_msb_dp_msff_macro__stack_60c__width_45 (
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
wire [43:0] so;

  input [44:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [44:0] dout;


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
dff #(45)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[44:0]),
.si({scan_in,so[43:0]}),
.so({so[43:0],scan_out}),
.q(dout[44:0])
);




















endmodule









//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module ifu_cmu_msb_dp_cmp_macro__dcmp_8x__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output dout;






cmp #(32)  m0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout)
);










endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module ifu_cmu_msb_dp_cmp_macro__dcmp_8x__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output dout;






cmp #(8)  m0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout)
);










endmodule





//  
//   and macro for ports = 2,3,4
//
//





module ifu_cmu_msb_dp_and_macro__ports_3__stack_2l__width_1 (
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





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_cmu_msb_dp_mux_macro__mux_aodec__ports_8__stack_60c__width_43 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [42:0] din0;
  input [42:0] din1;
  input [42:0] din2;
  input [42:0] din3;
  input [42:0] din4;
  input [42:0] din5;
  input [42:0] din6;
  input [42:0] din7;
  input [2:0] sel;
  output [42:0] dout;





cl_dp1_pdec8_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .sel2(sel[2]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7)
);

mux8s #(43)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[42:0]),
  .in1(din1[42:0]),
  .in2(din2[42:0]),
  .in3(din3[42:0]),
  .in4(din4[42:0]),
  .in5(din5[42:0]),
  .in6(din6[42:0]),
  .in7(din7[42:0]),
.dout(dout[42:0])
);









  



endmodule


//
//   buff macro
//
//





module ifu_cmu_msb_dp_buff_macro__stack_60c__width_43 (
  din, 
  dout);
  input [42:0] din;
  output [42:0] dout;






buff #(43)  d0_0 (
.in(din[42:0]),
.out(dout[42:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_cmu_msb_dp_mux_macro__mux_aonpe__ports_8__stack_60c__width_45 (
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

  input [44:0] din0;
  input sel0;
  input [44:0] din1;
  input sel1;
  input [44:0] din2;
  input sel2;
  input [44:0] din3;
  input sel3;
  input [44:0] din4;
  input sel4;
  input [44:0] din5;
  input sel5;
  input [44:0] din6;
  input sel6;
  input [44:0] din7;
  input sel7;
  output [44:0] dout;





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
mux8s #(45)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[44:0]),
  .in1(din1[44:0]),
  .in2(din2[44:0]),
  .in3(din3[44:0]),
  .in4(din4[44:0]),
  .in5(din5[44:0]),
  .in6(din6[44:0]),
  .in7(din7[44:0]),
.dout(dout[44:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module ifu_cmu_msb_dp_mux_macro__mux_aope__ports_2__stack_60c__width_40 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [39:0] din0;
  input [39:0] din1;
  input sel0;
  output [39:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(40)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[39:0]),
  .in1(din1[39:0]),
.dout(dout[39:0])
);









  



endmodule


//  
//   and macro for ports = 2,3,4
//
//





module ifu_cmu_msb_dp_and_macro__ports_2__stack_60c__width_5 (
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
//   buff macro
//
//





module ifu_cmu_msb_dp_buff_macro__minbuff_1__stack_60c__width_34 (
  din, 
  dout);
  input [33:0] din;
  output [33:0] dout;






buff #(34)  d0_0 (
.in(din[33:0]),
.out(dout[33:0])
);








endmodule









// any PARAMS parms go into naming of macro

module ifu_cmu_msb_dp_msff_macro__stack_60c__width_40 (
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
wire [38:0] so;

  input [39:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [39:0] dout;


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
dff #(40)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[39:0]),
.si({scan_in,so[38:0]}),
.so({so[38:0],scan_out}),
.q(dout[39:0])
);




















endmodule









//
//   buff macro
//
//





module ifu_cmu_msb_dp_buff_macro__stack_60c__width_46 (
  din, 
  dout);
  input [45:0] din;
  output [45:0] dout;






buff #(46)  d0_0 (
.in(din[45:0]),
.out(dout[45:0])
);








endmodule




