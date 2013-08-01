// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_cmu_msb_ctl.v
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
module ifu_cmu_msb_ctl (
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  lsu_ifu_cmu_pmen, 
  l15_spc_cpkt, 
  ftu_fetch_f, 
  ftu_cmiss, 
  ftu_inv_req, 
  ftu_redirect, 
  cmu_req_st, 
  cmu_canleave_st, 
  lsc_l15_valid, 
  cmu_data_ready, 
  lsc_fill_rtn2, 
  mdp_mbhit_q, 
  mct_early_req, 
  mct_real_wom, 
  mct_upd_addr, 
  cmu_has_dup_miss, 
  mct_rst_dupmiss, 
  mct_fill_complete, 
  mct_ignore_cmiss, 
  mct_clken, 
  scan_out) ;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire pmen_lat_scanin;
wire pmen_lat_scanout;
wire [7:0] ftu_fetch_c;
wire ifu_pmen;
wire [7:0] cmu_has_dup_miss_din;
wire [7:0] mct_e0_wom;
wire [7:0] mct_e1_wom;
wire [7:0] mct_e2_wom;
wire [7:0] mct_e3_wom;
wire [7:0] mct_e4_wom;
wire [7:0] mct_e5_wom;
wire [7:0] mct_e6_wom;
wire [7:0] mct_e7_wom;
wire dup_miss_lat_scanin;
wire dup_miss_lat_scanout;
wire [7:0] mct_real_miss;
wire cmu_mbhit_c;
wire redirect_reg_scanin;
wire redirect_reg_scanout;
wire [7:0] ftu_redirect_lat;
wire [7:0] csm_rmwbit_reset;
wire set_e0wom_bit0;
wire [7:0] mdp_e0_wom;
wire reset_e0wom_bit0;
wire next_e0wom_bit0;
wire set_e1wom_bit0;
wire [7:0] mdp_e1_wom;
wire reset_e1wom_bit0;
wire next_e1wom_bit0;
wire set_e2wom_bit0;
wire [7:0] mdp_e2_wom;
wire reset_e2wom_bit0;
wire next_e2wom_bit0;
wire set_e3wom_bit0;
wire [7:0] mdp_e3_wom;
wire reset_e3wom_bit0;
wire next_e3wom_bit0;
wire set_e4wom_bit0;
wire [7:0] mdp_e4_wom;
wire reset_e4wom_bit0;
wire next_e4wom_bit0;
wire set_e5wom_bit0;
wire [7:0] mdp_e5_wom;
wire reset_e5wom_bit0;
wire next_e5wom_bit0;
wire set_e6wom_bit0;
wire [7:0] mdp_e6_wom;
wire reset_e6wom_bit0;
wire next_e6wom_bit0;
wire set_e7wom_bit0;
wire [7:0] mdp_e7_wom;
wire reset_e7wom_bit0;
wire next_e7wom_bit0;
wire set_e0wom_bit1;
wire reset_e0wom_bit1;
wire next_e0wom_bit1;
wire set_e1wom_bit1;
wire reset_e1wom_bit1;
wire next_e1wom_bit1;
wire set_e2wom_bit1;
wire reset_e2wom_bit1;
wire next_e2wom_bit1;
wire set_e3wom_bit1;
wire reset_e3wom_bit1;
wire next_e3wom_bit1;
wire set_e4wom_bit1;
wire reset_e4wom_bit1;
wire next_e4wom_bit1;
wire set_e5wom_bit1;
wire reset_e5wom_bit1;
wire next_e5wom_bit1;
wire set_e6wom_bit1;
wire reset_e6wom_bit1;
wire next_e6wom_bit1;
wire set_e7wom_bit1;
wire reset_e7wom_bit1;
wire next_e7wom_bit1;
wire set_e0wom_bit2;
wire reset_e0wom_bit2;
wire next_e0wom_bit2;
wire set_e1wom_bit2;
wire reset_e1wom_bit2;
wire next_e1wom_bit2;
wire set_e2wom_bit2;
wire reset_e2wom_bit2;
wire next_e2wom_bit2;
wire set_e3wom_bit2;
wire reset_e3wom_bit2;
wire next_e3wom_bit2;
wire set_e4wom_bit2;
wire reset_e4wom_bit2;
wire next_e4wom_bit2;
wire set_e5wom_bit2;
wire reset_e5wom_bit2;
wire next_e5wom_bit2;
wire set_e6wom_bit2;
wire reset_e6wom_bit2;
wire next_e6wom_bit2;
wire set_e7wom_bit2;
wire reset_e7wom_bit2;
wire next_e7wom_bit2;
wire set_e0wom_bit3;
wire reset_e0wom_bit3;
wire next_e0wom_bit3;
wire set_e1wom_bit3;
wire reset_e1wom_bit3;
wire next_e1wom_bit3;
wire set_e2wom_bit3;
wire reset_e2wom_bit3;
wire next_e2wom_bit3;
wire set_e3wom_bit3;
wire reset_e3wom_bit3;
wire next_e3wom_bit3;
wire set_e4wom_bit3;
wire reset_e4wom_bit3;
wire next_e4wom_bit3;
wire set_e5wom_bit3;
wire reset_e5wom_bit3;
wire next_e5wom_bit3;
wire set_e6wom_bit3;
wire reset_e6wom_bit3;
wire next_e6wom_bit3;
wire set_e7wom_bit3;
wire reset_e7wom_bit3;
wire next_e7wom_bit3;
wire set_e0wom_bit4;
wire reset_e0wom_bit4;
wire next_e0wom_bit4;
wire set_e1wom_bit4;
wire reset_e1wom_bit4;
wire next_e1wom_bit4;
wire set_e2wom_bit4;
wire reset_e2wom_bit4;
wire next_e2wom_bit4;
wire set_e3wom_bit4;
wire reset_e3wom_bit4;
wire next_e3wom_bit4;
wire set_e4wom_bit4;
wire reset_e4wom_bit4;
wire next_e4wom_bit4;
wire set_e5wom_bit4;
wire reset_e5wom_bit4;
wire next_e5wom_bit4;
wire set_e6wom_bit4;
wire reset_e6wom_bit4;
wire next_e6wom_bit4;
wire set_e7wom_bit4;
wire reset_e7wom_bit4;
wire next_e7wom_bit4;
wire set_e0wom_bit5;
wire reset_e0wom_bit5;
wire next_e0wom_bit5;
wire set_e1wom_bit5;
wire reset_e1wom_bit5;
wire next_e1wom_bit5;
wire set_e2wom_bit5;
wire reset_e2wom_bit5;
wire next_e2wom_bit5;
wire set_e3wom_bit5;
wire reset_e3wom_bit5;
wire next_e3wom_bit5;
wire set_e4wom_bit5;
wire reset_e4wom_bit5;
wire next_e4wom_bit5;
wire set_e5wom_bit5;
wire reset_e5wom_bit5;
wire next_e5wom_bit5;
wire set_e6wom_bit5;
wire reset_e6wom_bit5;
wire next_e6wom_bit5;
wire set_e7wom_bit5;
wire reset_e7wom_bit5;
wire next_e7wom_bit5;
wire set_e0wom_bit6;
wire reset_e0wom_bit6;
wire next_e0wom_bit6;
wire set_e1wom_bit6;
wire reset_e1wom_bit6;
wire next_e1wom_bit6;
wire set_e2wom_bit6;
wire reset_e2wom_bit6;
wire next_e2wom_bit6;
wire set_e3wom_bit6;
wire reset_e3wom_bit6;
wire next_e3wom_bit6;
wire set_e4wom_bit6;
wire reset_e4wom_bit6;
wire next_e4wom_bit6;
wire set_e5wom_bit6;
wire reset_e5wom_bit6;
wire next_e5wom_bit6;
wire set_e6wom_bit6;
wire reset_e6wom_bit6;
wire next_e6wom_bit6;
wire set_e7wom_bit6;
wire reset_e7wom_bit6;
wire next_e7wom_bit6;
wire set_e0wom_bit7;
wire reset_e0wom_bit7;
wire next_e0wom_bit7;
wire set_e1wom_bit7;
wire reset_e1wom_bit7;
wire next_e1wom_bit7;
wire set_e2wom_bit7;
wire reset_e2wom_bit7;
wire next_e2wom_bit7;
wire set_e3wom_bit7;
wire reset_e3wom_bit7;
wire next_e3wom_bit7;
wire set_e4wom_bit7;
wire reset_e4wom_bit7;
wire next_e4wom_bit7;
wire set_e5wom_bit7;
wire reset_e5wom_bit7;
wire next_e5wom_bit7;
wire set_e6wom_bit7;
wire reset_e6wom_bit7;
wire next_e6wom_bit7;
wire set_e7wom_bit7;
wire reset_e7wom_bit7;
wire next_e7wom_bit7;
wire e0_wom_reg_f_scanin;
wire e0_wom_reg_f_scanout;
wire e1_wom_reg_f_scanin;
wire e1_wom_reg_f_scanout;
wire e2_wom_reg_f_scanin;
wire e2_wom_reg_f_scanout;
wire e3_wom_reg_f_scanin;
wire e3_wom_reg_f_scanout;
wire e4_wom_reg_f_scanin;
wire e4_wom_reg_f_scanout;
wire e5_wom_reg_f_scanin;
wire e5_wom_reg_f_scanout;
wire e6_wom_reg_f_scanin;
wire e6_wom_reg_f_scanout;
wire e7_wom_reg_f_scanin;
wire e7_wom_reg_f_scanout;
wire [7:0] cmu_fill_wom;
wire [7:0] data_ready_bf;
wire data_ready_reg_f_scanin;
wire data_ready_reg_f_scanout;
wire [7:0] data_ready_f;
wire data_ready_reg_c_scanin;
wire data_ready_reg_c_scanout;
wire [7:0] data_ready_c;
wire spares_scanin;
wire spares_scanout;


input tcu_scan_en ;
input l2clk;
input scan_in;
input tcu_pce_ov;		// scan signals
input spc_aclk;
input spc_bclk;

input lsu_ifu_cmu_pmen;

input [8:6] l15_spc_cpkt;

input [7:0] ftu_fetch_f;         //from ftu tsm
input [7:0] ftu_cmiss;         //from ftu tsm
input [7:0] ftu_inv_req;         //from ftu tsm
input [7:0] ftu_redirect;      //from ftu tsm

input [7:0] cmu_req_st;
input [7:0] cmu_canleave_st;
input [7:0] lsc_l15_valid;


input [7:0] cmu_data_ready;    // rtn pkt ready
input       lsc_fill_rtn2;      // second pkt being returned, any data rdy
                              
input [7:0]      mdp_mbhit_q;           // Raw hit in miss buffer
                              

output       mct_early_req;

output [7:0] mct_real_wom;   // real wom bits



output [7:0] mct_upd_addr;    //one-hot signal, selects one MB line to be updated



output [7:0] cmu_has_dup_miss;   //indicates thr0 dup miss exists, goes to CMSM0
output [7:0] mct_rst_dupmiss;    // reset duplicate miss wait state
output [7:0] mct_fill_complete;  // signal fill complete 2 cycles after data ready
output       mct_ignore_cmiss;       // ignore cmiss for 3 cycles when data is being returned


output [7:0] mct_clken;

output       scan_out;

// scan renames
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = spc_aclk;
assign soclk = spc_bclk;
assign se = tcu_scan_en ;
// end scan

//output mdp_cache_bit;       //cacheable bit from MB to CMSB
//output mdp_par_bit;         //parity bit from MB to ??
//assign l2clk = clk;

///////////////////////////////////////////////////
// clock header
///////////////////////////////////////////////////
ifu_cmu_msb_ctl_l1clkhdr_ctl_macro clkgen (
 .l2clk(l2clk),
 .l1en (1'b1 ),
 .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);
////////////////////////////////////////////////////////
//
// Form clk enable for misbuffer
ifu_cmu_msb_ctl_msff_ctl_macro__width_9 pmen_lat  (
 .scan_in(pmen_lat_scanin),
 .scan_out(pmen_lat_scanout),
 .l1clk ( l1clk ),
 .din   ({  ftu_fetch_f[7:0],lsu_ifu_cmu_pmen}),
 .dout  ({  ftu_fetch_c[7:0], ifu_pmen}),
  .siclk(siclk),
  .soclk(soclk)
);


assign mct_clken[7:0] = ftu_fetch_c[7:0] | ~{8{ifu_pmen}};


////////////////////////////////////////////////////////
// Duplicate miss logic
// Detect whether there exists a duplicate miss for 
// current thread (or PA). WOM bit entries are used
// to detect this duplicate miss. Diagonal bits are ignored
// because they indicate REAL MISS.
// mct_e*_wom are next_wom bits 
// mdp_e*_wom are latched wom bits 
////////////////////////////////////////////////////////
assign cmu_has_dup_miss_din[0] = (mct_e0_wom[7] | mct_e0_wom[6] | mct_e0_wom[5] | mct_e0_wom[4] | 
                                  mct_e0_wom[3] | mct_e0_wom[2] | mct_e0_wom[1]);
assign cmu_has_dup_miss_din[1] = (mct_e1_wom[7] | mct_e1_wom[6] | mct_e1_wom[5] | mct_e1_wom[4] | 
                                  mct_e1_wom[3] | mct_e1_wom[2] | mct_e1_wom[0]);
assign cmu_has_dup_miss_din[2] = (mct_e2_wom[7] | mct_e2_wom[6] | mct_e2_wom[5] | mct_e2_wom[4] | 
                                  mct_e2_wom[3] | mct_e2_wom[1] | mct_e2_wom[0]);
assign cmu_has_dup_miss_din[3] = (mct_e3_wom[7] | mct_e3_wom[6] | mct_e3_wom[5] | mct_e3_wom[4] | 
                                  mct_e3_wom[2] | mct_e3_wom[1] | mct_e3_wom[0]);
assign cmu_has_dup_miss_din[4] = (mct_e4_wom[7] | mct_e4_wom[6] | mct_e4_wom[5] | mct_e4_wom[3] | 
                                  mct_e4_wom[2] | mct_e4_wom[1] | mct_e4_wom[0]);
assign cmu_has_dup_miss_din[5] = (mct_e5_wom[7] | mct_e5_wom[6] | mct_e5_wom[4] | mct_e5_wom[3] | 
                                  mct_e5_wom[2] | mct_e5_wom[1] | mct_e5_wom[0]);
assign cmu_has_dup_miss_din[6] = (mct_e6_wom[7] | mct_e6_wom[5] | mct_e6_wom[4] | mct_e6_wom[3] | 
                                  mct_e6_wom[2] | mct_e6_wom[1] | mct_e6_wom[0]);
assign cmu_has_dup_miss_din[7] = (mct_e7_wom[6] | mct_e7_wom[5] | mct_e7_wom[4] | mct_e7_wom[3] | 
                                  mct_e7_wom[2] | mct_e7_wom[1] | mct_e7_wom[0]);


ifu_cmu_msb_ctl_msff_ctl_macro__width_8 dup_miss_lat  (
 .scan_in(dup_miss_lat_scanin),
 .scan_out(dup_miss_lat_scanout),
 .l1clk ( l1clk ),
 .din   ({  cmu_has_dup_miss_din[7:0]}),
 .dout  ({  cmu_has_dup_miss[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////
// Generate update signal for address, cacheable bit,
// parity and replace way bits.
////////////////////////////////////////////////////////
// enables for miss buffer
assign mct_upd_addr[7:0] = (ftu_cmiss[7:0] | ftu_inv_req[7:0]);

assign mct_real_miss[7:0] = ftu_cmiss[7:0] & {8{~cmu_mbhit_c}};
////////////////////////////////////////////////////////
// WOM bits to be filled in the WOM field of MB
// If there is a flush, set the whole column to '0'.
// If there is a cmiss, then use mbhit signal to select
// the bit to be set.
////////////////////////////////////////////////////////

// raw mbhit is generated if incoming address bits 39:5 match the
// missbuffer entry and
// neither incoming nor the missbuffer entries are non-cacheable and
// neither incoming nor the missbuffer entries are inval_req


assign cmu_mbhit_c = mdp_mbhit_q[0] | mdp_mbhit_q[1] | mdp_mbhit_q[2] | mdp_mbhit_q[3]
                   | mdp_mbhit_q[4] | mdp_mbhit_q[5] | mdp_mbhit_q[6] | mdp_mbhit_q[7];


assign mct_early_req = |(ftu_cmiss[7:0]) & ~cmu_mbhit_c;


////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// SET the WOM bits
// Each thread sets an entire column in WOM array
////////////////////////////////////////////////////////

// Reset the diagonal WOM bits which are the real miss bits 
// 1.When a Real Miss is flushed and it has no dup misses and no mbhit_q,
// 2.When in canleave state, and has no dup misses and no mbhit_q
// 3.Fill complete

// use delayed version of ftu_redirect for resetting real miss wom bit, but use raw
// version to reset dup miss wom bit.
ifu_cmu_msb_ctl_msff_ctl_macro__width_8 redirect_reg  (
 .scan_in(redirect_reg_scanin),
 .scan_out(redirect_reg_scanout),
 .l1clk(l1clk),
 .din  (ftu_redirect[7:0]),
 .dout (ftu_redirect_lat[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign csm_rmwbit_reset[7:0] = (cmu_req_st[7:0] & ftu_redirect_lat[7:0] & ~lsc_l15_valid[7:0] & ~cmu_has_dup_miss[7:0] & ~mdp_mbhit_q[7:0]) |
                               (cmu_canleave_st[7:0] & ~lsc_l15_valid[7:0] & ~cmu_has_dup_miss[7:0] & ~mdp_mbhit_q[7:0]) |
                               mct_fill_complete[7:0];

// Thread0
////////////////////////////////////////////////////////
assign set_e0wom_bit0 = mdp_e0_wom[0] | mct_real_miss[0];
assign reset_e0wom_bit0 = csm_rmwbit_reset[0];
assign next_e0wom_bit0 = set_e0wom_bit0 & ~reset_e0wom_bit0;

assign set_e1wom_bit0 = mdp_e1_wom[0] | (ftu_cmiss[0] & mdp_mbhit_q[1]);
assign reset_e1wom_bit0 = ftu_redirect[0] | mct_fill_complete[1];
assign next_e1wom_bit0 = set_e1wom_bit0 & ~reset_e1wom_bit0;

assign set_e2wom_bit0 = mdp_e2_wom[0] | (ftu_cmiss[0] & mdp_mbhit_q[2]);
assign reset_e2wom_bit0 = ftu_redirect[0] | mct_fill_complete[2];
assign next_e2wom_bit0 = set_e2wom_bit0 & ~reset_e2wom_bit0;

assign set_e3wom_bit0 = mdp_e3_wom[0] | (ftu_cmiss[0] & mdp_mbhit_q[3]);
assign reset_e3wom_bit0 = ftu_redirect[0] | mct_fill_complete[3];
assign next_e3wom_bit0 = set_e3wom_bit0 & ~reset_e3wom_bit0;

assign set_e4wom_bit0 = mdp_e4_wom[0] | (ftu_cmiss[0] & mdp_mbhit_q[4]);
assign reset_e4wom_bit0 = ftu_redirect[0] | mct_fill_complete[4];
assign next_e4wom_bit0 = set_e4wom_bit0 & ~reset_e4wom_bit0;

assign set_e5wom_bit0 = mdp_e5_wom[0] | (ftu_cmiss[0] & mdp_mbhit_q[5]);
assign reset_e5wom_bit0 = ftu_redirect[0] | mct_fill_complete[5];
assign next_e5wom_bit0 = set_e5wom_bit0 & ~reset_e5wom_bit0;

assign set_e6wom_bit0 = mdp_e6_wom[0] | (ftu_cmiss[0] & mdp_mbhit_q[6]);
assign reset_e6wom_bit0 = ftu_redirect[0] | mct_fill_complete[6];
assign next_e6wom_bit0 = set_e6wom_bit0 & ~reset_e6wom_bit0;

assign set_e7wom_bit0 = mdp_e7_wom[0] | (ftu_cmiss[0] & mdp_mbhit_q[7]);
assign reset_e7wom_bit0 = ftu_redirect[0] | mct_fill_complete[7];
assign next_e7wom_bit0 = set_e7wom_bit0 & ~reset_e7wom_bit0;

////////////////////////////////////////////////////////
// Thread1
////////////////////////////////////////////////////////
assign set_e0wom_bit1 = mdp_e0_wom[1] | (ftu_cmiss[1] & mdp_mbhit_q[0]);
assign reset_e0wom_bit1 = ftu_redirect[1] | mct_fill_complete[0];
assign next_e0wom_bit1 = set_e0wom_bit1 & ~reset_e0wom_bit1;

assign set_e1wom_bit1 = mdp_e1_wom[1] | mct_real_miss[1];
assign reset_e1wom_bit1 = csm_rmwbit_reset[1];
assign next_e1wom_bit1 = set_e1wom_bit1 & ~reset_e1wom_bit1;

assign set_e2wom_bit1 = mdp_e2_wom[1] | (ftu_cmiss[1] & mdp_mbhit_q[2]);
assign reset_e2wom_bit1 = ftu_redirect[1] | mct_fill_complete[2];
assign next_e2wom_bit1 = set_e2wom_bit1 & ~reset_e2wom_bit1;

assign set_e3wom_bit1 = mdp_e3_wom[1] | (ftu_cmiss[1] & mdp_mbhit_q[3]);
assign reset_e3wom_bit1 = ftu_redirect[1] | mct_fill_complete[3];
assign next_e3wom_bit1 = set_e3wom_bit1 & ~reset_e3wom_bit1;

assign set_e4wom_bit1 = mdp_e4_wom[1] | (ftu_cmiss[1] & mdp_mbhit_q[4]);
assign reset_e4wom_bit1 = ftu_redirect[1] | mct_fill_complete[4];
assign next_e4wom_bit1 = set_e4wom_bit1 & ~reset_e4wom_bit1;

assign set_e5wom_bit1 = mdp_e5_wom[1] | (ftu_cmiss[1] & mdp_mbhit_q[5]);
assign reset_e5wom_bit1 = ftu_redirect[1] | mct_fill_complete[5];
assign next_e5wom_bit1 = set_e5wom_bit1 & ~reset_e5wom_bit1;

assign set_e6wom_bit1 = mdp_e6_wom[1] | (ftu_cmiss[1] & mdp_mbhit_q[6]);
assign reset_e6wom_bit1 = ftu_redirect[1] | mct_fill_complete[6];
assign next_e6wom_bit1 = set_e6wom_bit1 & ~reset_e6wom_bit1;

assign set_e7wom_bit1 = mdp_e7_wom[1] | (ftu_cmiss[1] & mdp_mbhit_q[7]);
assign reset_e7wom_bit1 = ftu_redirect[1] | mct_fill_complete[7];
assign next_e7wom_bit1 = set_e7wom_bit1 & ~reset_e7wom_bit1;

////////////////////////////////////////////////////////
// Thread2
////////////////////////////////////////////////////////
assign set_e0wom_bit2 = mdp_e0_wom[2] | (ftu_cmiss[2] & mdp_mbhit_q[0]);
assign reset_e0wom_bit2 = ftu_redirect[2] | mct_fill_complete[0];
assign next_e0wom_bit2 = set_e0wom_bit2 & ~reset_e0wom_bit2;

assign set_e1wom_bit2 = mdp_e1_wom[2] | (ftu_cmiss[2] & mdp_mbhit_q[1]);
assign reset_e1wom_bit2 = ftu_redirect[2] | mct_fill_complete[1];
assign next_e1wom_bit2 = set_e1wom_bit2 & ~reset_e1wom_bit2;

assign set_e2wom_bit2 = mdp_e2_wom[2] | mct_real_miss[2];
assign reset_e2wom_bit2 = csm_rmwbit_reset[2];
assign next_e2wom_bit2 = set_e2wom_bit2 & ~reset_e2wom_bit2;

assign set_e3wom_bit2 = mdp_e3_wom[2] | (ftu_cmiss[2] & mdp_mbhit_q[3]);
assign reset_e3wom_bit2 = ftu_redirect[2] | mct_fill_complete[3];
assign next_e3wom_bit2 = set_e3wom_bit2 & ~reset_e3wom_bit2;

assign set_e4wom_bit2 = mdp_e4_wom[2] | (ftu_cmiss[2] & mdp_mbhit_q[4]);
assign reset_e4wom_bit2 = ftu_redirect[2] | mct_fill_complete[4];
assign next_e4wom_bit2 = set_e4wom_bit2 & ~reset_e4wom_bit2;

assign set_e5wom_bit2 = mdp_e5_wom[2] | (ftu_cmiss[2] & mdp_mbhit_q[5]);
assign reset_e5wom_bit2 = ftu_redirect[2] | mct_fill_complete[5];
assign next_e5wom_bit2 = set_e5wom_bit2 & ~reset_e5wom_bit2;

assign set_e6wom_bit2 = mdp_e6_wom[2] | (ftu_cmiss[2] & mdp_mbhit_q[6]);
assign reset_e6wom_bit2 = ftu_redirect[2] | mct_fill_complete[6];
assign next_e6wom_bit2 = set_e6wom_bit2 & ~reset_e6wom_bit2;

assign set_e7wom_bit2 = mdp_e7_wom[2] | (ftu_cmiss[2] & mdp_mbhit_q[7]);
assign reset_e7wom_bit2 = ftu_redirect[2] | mct_fill_complete[7];
assign next_e7wom_bit2 = set_e7wom_bit2 & ~reset_e7wom_bit2;

////////////////////////////////////////////////////////
// Thread3
////////////////////////////////////////////////////////
assign set_e0wom_bit3 = mdp_e0_wom[3] | (ftu_cmiss[3] & mdp_mbhit_q[0]);
assign reset_e0wom_bit3 = ftu_redirect[3] | mct_fill_complete[0];
assign next_e0wom_bit3 = set_e0wom_bit3 & ~reset_e0wom_bit3;

assign set_e1wom_bit3 = mdp_e1_wom[3] | (ftu_cmiss[3] & mdp_mbhit_q[1]);
assign reset_e1wom_bit3 = ftu_redirect[3] | mct_fill_complete[1];
assign next_e1wom_bit3 = set_e1wom_bit3 & ~reset_e1wom_bit3;

assign set_e2wom_bit3 = mdp_e2_wom[3] | (ftu_cmiss[3] & mdp_mbhit_q[2]);
assign reset_e2wom_bit3 = ftu_redirect[3] | mct_fill_complete[2];
assign next_e2wom_bit3 = set_e2wom_bit3 & ~reset_e2wom_bit3;

assign set_e3wom_bit3 = mdp_e3_wom[3] | mct_real_miss[3];
assign reset_e3wom_bit3 = csm_rmwbit_reset[3];
assign next_e3wom_bit3 = set_e3wom_bit3 & ~reset_e3wom_bit3;

assign set_e4wom_bit3 = mdp_e4_wom[3] | (ftu_cmiss[3] & mdp_mbhit_q[4]);
assign reset_e4wom_bit3 = ftu_redirect[3] | mct_fill_complete[4];
assign next_e4wom_bit3 = set_e4wom_bit3 & ~reset_e4wom_bit3;

assign set_e5wom_bit3 = mdp_e5_wom[3] | (ftu_cmiss[3] & mdp_mbhit_q[5]);
assign reset_e5wom_bit3 = ftu_redirect[3] | mct_fill_complete[5];
assign next_e5wom_bit3 = set_e5wom_bit3 & ~reset_e5wom_bit3;

assign set_e6wom_bit3 = mdp_e6_wom[3] | (ftu_cmiss[3] & mdp_mbhit_q[6]);
assign reset_e6wom_bit3 = ftu_redirect[3] | mct_fill_complete[6];
assign next_e6wom_bit3 = set_e6wom_bit3 & ~reset_e6wom_bit3;

assign set_e7wom_bit3 = mdp_e7_wom[3] | (ftu_cmiss[3] & mdp_mbhit_q[7]);
assign reset_e7wom_bit3 = ftu_redirect[3] | mct_fill_complete[7];
assign next_e7wom_bit3 = set_e7wom_bit3 & ~reset_e7wom_bit3;

////////////////////////////////////////////////////////
// Thread4
////////////////////////////////////////////////////////
assign set_e0wom_bit4 = mdp_e0_wom[4] | (ftu_cmiss[4] & mdp_mbhit_q[0]);
assign reset_e0wom_bit4 = ftu_redirect[4] | mct_fill_complete[0];
assign next_e0wom_bit4 = set_e0wom_bit4 & ~reset_e0wom_bit4;

assign set_e1wom_bit4 = mdp_e1_wom[4] | (ftu_cmiss[4] & mdp_mbhit_q[1]);
assign reset_e1wom_bit4 = ftu_redirect[4] | mct_fill_complete[1];
assign next_e1wom_bit4 = set_e1wom_bit4 & ~reset_e1wom_bit4;

assign set_e2wom_bit4 = mdp_e2_wom[4] | (ftu_cmiss[4] & mdp_mbhit_q[2]);
assign reset_e2wom_bit4 = ftu_redirect[4] | mct_fill_complete[2];
assign next_e2wom_bit4 = set_e2wom_bit4 & ~reset_e2wom_bit4;

assign set_e3wom_bit4 = mdp_e3_wom[4] | (ftu_cmiss[4] & mdp_mbhit_q[3]);
assign reset_e3wom_bit4 = ftu_redirect[4] | mct_fill_complete[3];
assign next_e3wom_bit4 = set_e3wom_bit4 & ~reset_e3wom_bit4;

assign set_e4wom_bit4 = mdp_e4_wom[4] | mct_real_miss[4];
assign reset_e4wom_bit4 = csm_rmwbit_reset[4];
assign next_e4wom_bit4 = set_e4wom_bit4 & ~reset_e4wom_bit4;

assign set_e5wom_bit4 = mdp_e5_wom[4] | (ftu_cmiss[4] & mdp_mbhit_q[5]);
assign reset_e5wom_bit4 = ftu_redirect[4] | mct_fill_complete[5];
assign next_e5wom_bit4 = set_e5wom_bit4 & ~reset_e5wom_bit4;

assign set_e6wom_bit4 = mdp_e6_wom[4] | (ftu_cmiss[4] & mdp_mbhit_q[6]);
assign reset_e6wom_bit4 = ftu_redirect[4] | mct_fill_complete[6];
assign next_e6wom_bit4 = set_e6wom_bit4 & ~reset_e6wom_bit4;

assign set_e7wom_bit4 = mdp_e7_wom[4] | (ftu_cmiss[4] & mdp_mbhit_q[7]);
assign reset_e7wom_bit4 = ftu_redirect[4] | mct_fill_complete[7];
assign next_e7wom_bit4 = set_e7wom_bit4 & ~reset_e7wom_bit4;

////////////////////////////////////////////////////////
// Thread5
////////////////////////////////////////////////////////
assign set_e0wom_bit5 = mdp_e0_wom[5] | (ftu_cmiss[5] & mdp_mbhit_q[0]);
assign reset_e0wom_bit5 = ftu_redirect[5] | mct_fill_complete[0];
assign next_e0wom_bit5 = set_e0wom_bit5 & ~reset_e0wom_bit5;

assign set_e1wom_bit5 = mdp_e1_wom[5] | (ftu_cmiss[5] & mdp_mbhit_q[1]);
assign reset_e1wom_bit5 = ftu_redirect[5] | mct_fill_complete[1];
assign next_e1wom_bit5 = set_e1wom_bit5 & ~reset_e1wom_bit5;

assign set_e2wom_bit5 = mdp_e2_wom[5] | (ftu_cmiss[5] & mdp_mbhit_q[2]);
assign reset_e2wom_bit5 = ftu_redirect[5] | mct_fill_complete[2];
assign next_e2wom_bit5 = set_e2wom_bit5 & ~reset_e2wom_bit5;

assign set_e3wom_bit5 = mdp_e3_wom[5] | (ftu_cmiss[5] & mdp_mbhit_q[3]);
assign reset_e3wom_bit5 = ftu_redirect[5] | mct_fill_complete[3];
assign next_e3wom_bit5 = set_e3wom_bit5 & ~reset_e3wom_bit5;

assign set_e4wom_bit5 = mdp_e4_wom[5] | (ftu_cmiss[5] & mdp_mbhit_q[4]);
assign reset_e4wom_bit5 = ftu_redirect[5] | mct_fill_complete[4];
assign next_e4wom_bit5 = set_e4wom_bit5 & ~reset_e4wom_bit5;

assign set_e5wom_bit5 = mdp_e5_wom[5] | mct_real_miss[5];
assign reset_e5wom_bit5 = csm_rmwbit_reset[5];
assign next_e5wom_bit5 = set_e5wom_bit5 & ~reset_e5wom_bit5;

assign set_e6wom_bit5 = mdp_e6_wom[5] | (ftu_cmiss[5] & mdp_mbhit_q[6]);
assign reset_e6wom_bit5 = ftu_redirect[5] | mct_fill_complete[6];
assign next_e6wom_bit5 = set_e6wom_bit5 & ~reset_e6wom_bit5;

assign set_e7wom_bit5 = mdp_e7_wom[5] | (ftu_cmiss[5] & mdp_mbhit_q[7]);
assign reset_e7wom_bit5 = ftu_redirect[5] | mct_fill_complete[7];
assign next_e7wom_bit5 = set_e7wom_bit5 & ~reset_e7wom_bit5;

////////////////////////////////////////////////////////
// Thread6
////////////////////////////////////////////////////////
assign set_e0wom_bit6 = mdp_e0_wom[6] | (ftu_cmiss[6] & mdp_mbhit_q[0]);
assign reset_e0wom_bit6 = ftu_redirect[6] | mct_fill_complete[0];
assign next_e0wom_bit6 = set_e0wom_bit6 & ~reset_e0wom_bit6;

assign set_e1wom_bit6 = mdp_e1_wom[6] | (ftu_cmiss[6] & mdp_mbhit_q[1]);
assign reset_e1wom_bit6 = ftu_redirect[6] | mct_fill_complete[1];
assign next_e1wom_bit6 = set_e1wom_bit6 & ~reset_e1wom_bit6;

assign set_e2wom_bit6 = mdp_e2_wom[6] | (ftu_cmiss[6] & mdp_mbhit_q[2]);
assign reset_e2wom_bit6 = ftu_redirect[6] | mct_fill_complete[2];
assign next_e2wom_bit6 = set_e2wom_bit6 & ~reset_e2wom_bit6;

assign set_e3wom_bit6 = mdp_e3_wom[6] | (ftu_cmiss[6] & mdp_mbhit_q[3]);
assign reset_e3wom_bit6 = ftu_redirect[6] | mct_fill_complete[3];
assign next_e3wom_bit6 = set_e3wom_bit6 & ~reset_e3wom_bit6;

assign set_e4wom_bit6 = mdp_e4_wom[6] | (ftu_cmiss[6] & mdp_mbhit_q[4]);
assign reset_e4wom_bit6 = ftu_redirect[6] | mct_fill_complete[4];
assign next_e4wom_bit6 = set_e4wom_bit6 & ~reset_e4wom_bit6;

assign set_e5wom_bit6 = mdp_e5_wom[6] | (ftu_cmiss[6] & mdp_mbhit_q[5]);
assign reset_e5wom_bit6 = ftu_redirect[6] | mct_fill_complete[5];
assign next_e5wom_bit6 = set_e5wom_bit6 & ~reset_e5wom_bit6;

assign set_e6wom_bit6 = mdp_e6_wom[6] | mct_real_miss[6];
assign reset_e6wom_bit6 = csm_rmwbit_reset[6];
assign next_e6wom_bit6 = set_e6wom_bit6 & ~reset_e6wom_bit6;

assign set_e7wom_bit6 = mdp_e7_wom[6] | (ftu_cmiss[6] & mdp_mbhit_q[7]);
assign reset_e7wom_bit6 = ftu_redirect[6] | mct_fill_complete[7];
assign next_e7wom_bit6 = set_e7wom_bit6 & ~reset_e7wom_bit6;

////////////////////////////////////////////////////////
// Thread7
////////////////////////////////////////////////////////
assign set_e0wom_bit7 = mdp_e0_wom[7] | (ftu_cmiss[7] & mdp_mbhit_q[0]);
assign reset_e0wom_bit7 = ftu_redirect[7] | mct_fill_complete[0];
assign next_e0wom_bit7 = set_e0wom_bit7 & ~reset_e0wom_bit7;

assign set_e1wom_bit7 = mdp_e1_wom[7] | (ftu_cmiss[7] & mdp_mbhit_q[1]);
assign reset_e1wom_bit7 = ftu_redirect[7] | mct_fill_complete[1];
assign next_e1wom_bit7 = set_e1wom_bit7 & ~reset_e1wom_bit7;

assign set_e2wom_bit7 = mdp_e2_wom[7] | (ftu_cmiss[7] & mdp_mbhit_q[2]);
assign reset_e2wom_bit7 = ftu_redirect[7] | mct_fill_complete[2];
assign next_e2wom_bit7 = set_e2wom_bit7 & ~reset_e2wom_bit7;

assign set_e3wom_bit7 = mdp_e3_wom[7] | (ftu_cmiss[7] & mdp_mbhit_q[3]);
assign reset_e3wom_bit7 = ftu_redirect[7] | mct_fill_complete[3];
assign next_e3wom_bit7 = set_e3wom_bit7 & ~reset_e3wom_bit7;

assign set_e4wom_bit7 = mdp_e4_wom[7] | (ftu_cmiss[7] & mdp_mbhit_q[4]);
assign reset_e4wom_bit7 = ftu_redirect[7] | mct_fill_complete[4];
assign next_e4wom_bit7 = set_e4wom_bit7 & ~reset_e4wom_bit7;

assign set_e5wom_bit7 = mdp_e5_wom[7] | (ftu_cmiss[7] & mdp_mbhit_q[5]);
assign reset_e5wom_bit7 = ftu_redirect[7] | mct_fill_complete[5];
assign next_e5wom_bit7 = set_e5wom_bit7 & ~reset_e5wom_bit7;

assign set_e6wom_bit7 = mdp_e6_wom[7] | (ftu_cmiss[7] & mdp_mbhit_q[6]);
assign reset_e6wom_bit7 = ftu_redirect[7] | mct_fill_complete[6];
assign next_e6wom_bit7 = set_e6wom_bit7 & ~reset_e6wom_bit7;

assign set_e7wom_bit7 = mdp_e7_wom[7] | mct_real_miss[7];
assign reset_e7wom_bit7 = csm_rmwbit_reset[7];
assign next_e7wom_bit7 = set_e7wom_bit7 & ~reset_e7wom_bit7;

assign mct_e0_wom[7:0] = ({next_e0wom_bit7, next_e0wom_bit6, next_e0wom_bit5, next_e0wom_bit4,
                           next_e0wom_bit3, next_e0wom_bit2, next_e0wom_bit1, next_e0wom_bit0});
assign mct_e1_wom[7:0] = ({next_e1wom_bit7, next_e1wom_bit6, next_e1wom_bit5, next_e1wom_bit4,
                           next_e1wom_bit3, next_e1wom_bit2, next_e1wom_bit1, next_e1wom_bit0});
assign mct_e2_wom[7:0] = ({next_e2wom_bit7, next_e2wom_bit6, next_e2wom_bit5, next_e2wom_bit4,
                           next_e2wom_bit3, next_e2wom_bit2, next_e2wom_bit1, next_e2wom_bit0});
assign mct_e3_wom[7:0] = ({next_e3wom_bit7, next_e3wom_bit6, next_e3wom_bit5, next_e3wom_bit4,
                           next_e3wom_bit3, next_e3wom_bit2, next_e3wom_bit1, next_e3wom_bit0});
assign mct_e4_wom[7:0] = ({next_e4wom_bit7, next_e4wom_bit6, next_e4wom_bit5, next_e4wom_bit4,
                           next_e4wom_bit3, next_e4wom_bit2, next_e4wom_bit1, next_e4wom_bit0});
assign mct_e5_wom[7:0] = ({next_e5wom_bit7, next_e5wom_bit6, next_e5wom_bit5, next_e5wom_bit4,
                           next_e5wom_bit3, next_e5wom_bit2, next_e5wom_bit1, next_e5wom_bit0});
assign mct_e6_wom[7:0] = ({next_e6wom_bit7, next_e6wom_bit6, next_e6wom_bit5, next_e6wom_bit4,
                           next_e6wom_bit3, next_e6wom_bit2, next_e6wom_bit1, next_e6wom_bit0});
assign mct_e7_wom[7:0] = ({next_e7wom_bit7, next_e7wom_bit6, next_e7wom_bit5, next_e7wom_bit4,
                           next_e7wom_bit3, next_e7wom_bit2, next_e7wom_bit1, next_e7wom_bit0});

ifu_cmu_msb_ctl_msff_ctl_macro__width_8 e0_wom_reg_f  (
 .scan_in(e0_wom_reg_f_scanin),
 .scan_out(e0_wom_reg_f_scanout),
 .l1clk( l1clk ),
 .din  ({mct_e0_wom[7:0]}),
 .dout  ({mdp_e0_wom[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_cmu_msb_ctl_msff_ctl_macro__width_8 e1_wom_reg_f  (
 .scan_in(e1_wom_reg_f_scanin),
 .scan_out(e1_wom_reg_f_scanout),
 .l1clk( l1clk ),
 .din  ({mct_e1_wom[7:0]}),
 .dout  ({mdp_e1_wom[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_cmu_msb_ctl_msff_ctl_macro__width_8 e2_wom_reg_f  (
 .scan_in(e2_wom_reg_f_scanin),
 .scan_out(e2_wom_reg_f_scanout),
 .l1clk( l1clk ),
 .din  ({mct_e2_wom[7:0]}),
 .dout  ({mdp_e2_wom[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_cmu_msb_ctl_msff_ctl_macro__width_8 e3_wom_reg_f  (
 .scan_in(e3_wom_reg_f_scanin),
 .scan_out(e3_wom_reg_f_scanout),
 .l1clk( l1clk ),
 .din  ({mct_e3_wom[7:0]}),
 .dout  ({mdp_e3_wom[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_cmu_msb_ctl_msff_ctl_macro__width_8 e4_wom_reg_f  (
 .scan_in(e4_wom_reg_f_scanin),
 .scan_out(e4_wom_reg_f_scanout),
 .l1clk( l1clk ),
 .din  ({mct_e4_wom[7:0]}),
 .dout  ({mdp_e4_wom[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_cmu_msb_ctl_msff_ctl_macro__width_8 e5_wom_reg_f  (
 .scan_in(e5_wom_reg_f_scanin),
 .scan_out(e5_wom_reg_f_scanout),
 .l1clk( l1clk ),
 .din  ({mct_e5_wom[7:0]}),
 .dout  ({mdp_e5_wom[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_cmu_msb_ctl_msff_ctl_macro__width_8 e6_wom_reg_f  (
 .scan_in(e6_wom_reg_f_scanin),
 .scan_out(e6_wom_reg_f_scanout),
 .l1clk( l1clk ),
 .din  ({mct_e6_wom[7:0]}),
 .dout  ({mdp_e6_wom[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_cmu_msb_ctl_msff_ctl_macro__width_8 e7_wom_reg_f  (
 .scan_in(e7_wom_reg_f_scanin),
 .scan_out(e7_wom_reg_f_scanout),
 .l1clk( l1clk ),
 .din  ({mct_e7_wom[7:0]}),
 .dout  ({mdp_e7_wom[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

assign mct_real_wom[7:0] = {mdp_e7_wom[7],mdp_e6_wom[6],mdp_e5_wom[5],mdp_e4_wom[4],
                            mdp_e3_wom[3],mdp_e2_wom[2],mdp_e1_wom[1],mdp_e0_wom[0]};

assign cmu_fill_wom[7:0] = ({8{~l15_spc_cpkt[8] & ~l15_spc_cpkt[7] & ~l15_spc_cpkt[6]}} & mdp_e0_wom[7:0]) |
                           ({8{~l15_spc_cpkt[8] & ~l15_spc_cpkt[7] &  l15_spc_cpkt[6]}} & mdp_e1_wom[7:0]) |
                           ({8{~l15_spc_cpkt[8] &  l15_spc_cpkt[7] & ~l15_spc_cpkt[6]}} & mdp_e2_wom[7:0]) |
                           ({8{~l15_spc_cpkt[8] &  l15_spc_cpkt[7] &  l15_spc_cpkt[6]}} & mdp_e3_wom[7:0]) |
                           ({8{ l15_spc_cpkt[8] & ~l15_spc_cpkt[7] & ~l15_spc_cpkt[6]}} & mdp_e4_wom[7:0]) |
                           ({8{ l15_spc_cpkt[8] & ~l15_spc_cpkt[7] &  l15_spc_cpkt[6]}} & mdp_e5_wom[7:0]) |
                           ({8{ l15_spc_cpkt[8] &  l15_spc_cpkt[7] & ~l15_spc_cpkt[6]}} & mdp_e6_wom[7:0]) |
                           ({8{ l15_spc_cpkt[8] &  l15_spc_cpkt[7] &  l15_spc_cpkt[6]}} & mdp_e7_wom[7:0]);
                          
assign mct_rst_dupmiss[7:0]  = cmu_fill_wom[7:0] & {8{lsc_fill_rtn2}};

////////////////////////////////////////////////////////////////
// Ignore CMISS
////////////////////////////////////////////////////////////////
// Ignore cmiss, if cmiss occurs in either of following three cycles 
// |        bf          |        f        |        C        |
// |---------------------------------------------------------
// |     DATA_READY     |  CMISS          |    CMISS        |
// |       CMISS        | (same line)     |   (same line)   |
// | (cmiss on same line|                 |                 |
// |  as data_ready)    |                 |                 |
//

assign data_ready_bf[7:0] = cmu_data_ready[7:0];

ifu_cmu_msb_ctl_msff_ctl_macro__width_8 data_ready_reg_f  (
 .scan_in(data_ready_reg_f_scanin),
 .scan_out(data_ready_reg_f_scanout),
 .l1clk( l1clk ),
 .din  ({data_ready_bf[7:0]}),
 .dout  ({data_ready_f[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_cmu_msb_ctl_msff_ctl_macro__width_8 data_ready_reg_c  (
 .scan_in(data_ready_reg_c_scanin),
 .scan_out(data_ready_reg_c_scanout),
 .l1clk( l1clk ),
 .din  ({data_ready_f[7:0]}),
 .dout  ({data_ready_c[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);



// ignore cache miss if it is a dup miss and a data ready for the parent thread has been sent
// on one of prev 3 cycles.
assign mct_ignore_cmiss = (mdp_mbhit_q[0] & (data_ready_bf[0] | data_ready_f[0] | data_ready_c[0])) |
                          (mdp_mbhit_q[1] & (data_ready_bf[1] | data_ready_f[1] | data_ready_c[1])) |
                          (mdp_mbhit_q[2] & (data_ready_bf[2] | data_ready_f[2] | data_ready_c[2])) |
                          (mdp_mbhit_q[3] & (data_ready_bf[3] | data_ready_f[3] | data_ready_c[3])) |
                          (mdp_mbhit_q[4] & (data_ready_bf[4] | data_ready_f[4] | data_ready_c[4])) |
                          (mdp_mbhit_q[5] & (data_ready_bf[5] | data_ready_f[5] | data_ready_c[5])) |
                          (mdp_mbhit_q[6] & (data_ready_bf[6] | data_ready_f[6] | data_ready_c[6])) |
                          (mdp_mbhit_q[7] & (data_ready_bf[7] | data_ready_f[7] | data_ready_c[7])) ;


// signal fill complete 2 cycles after data ready
assign mct_fill_complete[7:0] = data_ready_c[7:0];

////////////////////////////////////////////////////////
// SPARE CELLS
////////////////////////////////////////////////////////
ifu_cmu_msb_ctl_spare_ctl_macro__num_2 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
////////////////////////////////////////////////////////

supply0 vss;
supply1 vdd;
// fixscan start:
assign pmen_lat_scanin           = scan_in                  ;
assign dup_miss_lat_scanin       = pmen_lat_scanout         ;
assign redirect_reg_scanin       = dup_miss_lat_scanout     ;
assign e0_wom_reg_f_scanin       = redirect_reg_scanout     ;
assign e1_wom_reg_f_scanin       = e0_wom_reg_f_scanout     ;
assign e2_wom_reg_f_scanin       = e1_wom_reg_f_scanout     ;
assign e3_wom_reg_f_scanin       = e2_wom_reg_f_scanout     ;
assign e4_wom_reg_f_scanin       = e3_wom_reg_f_scanout     ;
assign e5_wom_reg_f_scanin       = e4_wom_reg_f_scanout     ;
assign e6_wom_reg_f_scanin       = e5_wom_reg_f_scanout     ;
assign e7_wom_reg_f_scanin       = e6_wom_reg_f_scanout     ;
assign data_ready_reg_f_scanin   = e7_wom_reg_f_scanout     ;
assign data_ready_reg_c_scanin   = data_ready_reg_f_scanout ;
assign spares_scanin             = data_ready_reg_c_scanout ;
assign scan_out                  = spares_scanout           ;

// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module ifu_cmu_msb_ctl_l1clkhdr_ctl_macro (
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













// any PARAMS parms go into naming of macro

module ifu_cmu_msb_ctl_msff_ctl_macro__width_9 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;
wire [7:0] so;

  input [8:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [8:0] dout;
  output scan_out;
assign fdin[8:0] = din[8:0];






dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ifu_cmu_msb_ctl_msff_ctl_macro__width_8 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0];






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module ifu_cmu_msb_ctl_spare_ctl_macro__num_2 (
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
assign scan_out = so_1;



endmodule

