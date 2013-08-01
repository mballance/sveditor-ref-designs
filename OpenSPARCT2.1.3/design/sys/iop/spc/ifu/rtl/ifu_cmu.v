// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_cmu.v
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
module ifu_cmu (
  tcu_scan_en, 
  l2clk, 
  spc_aclk, 
  spc_bclk, 
  tcu_pce_ov, 
  scan_in, 
  const_cpuid, 
  lsu_ifu_cmu_pmen, 
  ftu_paddr, 
  ftu_rep_way, 
  ftu_thrx_un_cacheable, 
  ftu_curr_fetch_thr_f, 
  ftu_agc_thr0_cmiss_c, 
  ftu_agc_thr1_cmiss_c, 
  ftu_agc_thr2_cmiss_c, 
  ftu_agc_thr3_cmiss_c, 
  ftu_agc_thr4_cmiss_c, 
  ftu_agc_thr5_cmiss_c, 
  ftu_agc_thr6_cmiss_c, 
  ftu_agc_thr7_cmiss_c, 
  ftu_thr0_inv_req_c, 
  ftu_thr1_inv_req_c, 
  ftu_thr2_inv_req_c, 
  ftu_thr3_inv_req_c, 
  ftu_thr4_inv_req_c, 
  ftu_thr5_inv_req_c, 
  ftu_thr6_inv_req_c, 
  ftu_thr7_inv_req_c, 
  ftu_thr0_redirect_bf, 
  ftu_thr1_redirect_bf, 
  ftu_thr2_redirect_bf, 
  ftu_thr3_redirect_bf, 
  ftu_thr4_redirect_bf, 
  ftu_thr5_redirect_bf, 
  ftu_thr6_redirect_bf, 
  ftu_thr7_redirect_bf, 
  lsu_ifu_ld_index, 
  l15_spc_cpkt, 
  l15_spc_data1, 
  l15_ifu_valid, 
  l15_ifu_grant, 
  gkt_ifu_legal, 
  gkt_ifu_flip_parity, 
  cmu_l2miss, 
  cmu_any_data_ready, 
  cmu_thr0_data_ready, 
  cmu_thr1_data_ready, 
  cmu_thr2_data_ready, 
  cmu_thr3_data_ready, 
  cmu_thr4_data_ready, 
  cmu_thr5_data_ready, 
  cmu_thr6_data_ready, 
  cmu_thr7_data_ready, 
  cmu_any_un_cacheable, 
  cmu_null_st, 
  cmu_dupmiss_st, 
  cmu_rst_dupmiss, 
  cmu_inst0_v, 
  cmu_inst1_v, 
  cmu_inst2_v, 
  cmu_inst3_v, 
  cmu_fill_wrway, 
  cmu_fill_paddr, 
  cmu_fill_inst0, 
  cmu_fill_inst1, 
  cmu_fill_inst2, 
  cmu_fill_inst3, 
  cmu_ic_data, 
  cmu_icache_invalidate, 
  cmu_icache_invalidate_way, 
  cmu_icache_invalidate_index, 
  cmu_icache_inv_way1, 
  cmu_evic_invalidate, 
  cmu_inval_ack, 
  cmu_l2_err, 
  ifu_l15_valid, 
  ifu_l15_cpkt, 
  ifu_l15_addr, 
  ifu_lsu_if_vld, 
  ifu_lsu_if_tid, 
  ifu_lsu_if_addr, 
  scan_out) ;
wire [7:0] ftu_cmiss;
wire [7:0] ftu_inv_req;
wire [7:0] ftu_redirect;
wire [7:0] cmu_data_ready;
wire [7:0] mct_rst_dupmiss;
wire [7:0] ftu_fetch_f;
wire [7:0] csm_valid_req;
wire [7:0] cmu_req_st;
wire [7:0] cmu_canleave_st;
wire cmsm_top_scanin;
wire cmsm_top_scanout;
wire [7:0] mct_fill_complete;
wire [7:0] lsc_l15_valid;
wire [7:0] cmu_has_dup_miss;
wire mct_ignore_cmiss;
wire lsc_fill_rtn1;
wire lsc_fill_rtn2;
wire [7:0] lsc_req_sel;
wire lsc_pending_req;
wire lsi_ctl_scanin;
wire lsi_ctl_scanout;
wire mct_early_req;
wire mdp_lsi_nc_bit;
wire mdp_lsi_inv_bit;
wire [2:0] mdp_lsi_rway;
wire lsi_dp_scanin;
wire lsi_dp_scanout;
wire [7:0] mct_clken;
wire [7:0] mct_upd_addr;
wire [7:0] mct_real_wom;
wire missbuff_ctl_scanin;
wire missbuff_ctl_scanout;
wire [7:0] mdp_mbhit_q;
wire missbuff_dp_scanin;
wire missbuff_dp_scanout;
wire [7:0] lsc_data_sel;
wire lsc_clken;



input tcu_scan_en ;
input l2clk;
input spc_aclk;
input spc_bclk;
input tcu_pce_ov;
input scan_in;

input [2:0] const_cpuid;
input       lsu_ifu_cmu_pmen;

input [39:0] ftu_paddr;
input [2:0]  ftu_rep_way;  
input        ftu_thrx_un_cacheable;

input [7:0]  ftu_curr_fetch_thr_f;


input        ftu_agc_thr0_cmiss_c;
input        ftu_agc_thr1_cmiss_c;
input        ftu_agc_thr2_cmiss_c;
input        ftu_agc_thr3_cmiss_c;
input        ftu_agc_thr4_cmiss_c;
input        ftu_agc_thr5_cmiss_c;
input        ftu_agc_thr6_cmiss_c;
input        ftu_agc_thr7_cmiss_c;

input        ftu_thr0_inv_req_c;  
input        ftu_thr1_inv_req_c;  
input        ftu_thr2_inv_req_c;  
input        ftu_thr3_inv_req_c;  
input        ftu_thr4_inv_req_c;  
input        ftu_thr5_inv_req_c;  
input        ftu_thr6_inv_req_c;  
input        ftu_thr7_inv_req_c;  


input        ftu_thr0_redirect_bf;
input        ftu_thr1_redirect_bf;
input        ftu_thr2_redirect_bf;
input        ftu_thr3_redirect_bf;
input        ftu_thr4_redirect_bf;
input        ftu_thr5_redirect_bf;
input        ftu_thr6_redirect_bf;
input        ftu_thr7_redirect_bf;


input [10:5] lsu_ifu_ld_index;

input [17:0] l15_spc_cpkt;                                               
input [127:0] l15_spc_data1;                                               
input         l15_ifu_valid;                                               
input         l15_ifu_grant;
input [3:0]   gkt_ifu_legal;
input [3:0]   gkt_ifu_flip_parity;



output        cmu_l2miss;


output        cmu_any_data_ready;
output        cmu_thr0_data_ready;   
output        cmu_thr1_data_ready;  
output        cmu_thr2_data_ready;  
output        cmu_thr3_data_ready;  
output        cmu_thr4_data_ready;  
output        cmu_thr5_data_ready;  
output        cmu_thr6_data_ready;  
output        cmu_thr7_data_ready;

output        cmu_any_un_cacheable;




output [7:0] cmu_null_st;
output [7:0] cmu_dupmiss_st;
output [7:0] cmu_rst_dupmiss;
   
output        cmu_inst0_v;                            
output        cmu_inst1_v;                            
output        cmu_inst2_v;                            
output        cmu_inst3_v;                            

output [2:0]  cmu_fill_wrway;                    //MB to ??
output [39:0] cmu_fill_paddr;
output [32:0] cmu_fill_inst0;
output [32:0] cmu_fill_inst1;
output [32:0] cmu_fill_inst2;
output [32:0] cmu_fill_inst3;
output [263:0] cmu_ic_data;

output         cmu_icache_invalidate;
output [2:0]   cmu_icache_invalidate_way;
output [10:5]  cmu_icache_invalidate_index;
output [2:0]   cmu_icache_inv_way1;
output         cmu_evic_invalidate;
output [7:0]   cmu_inval_ack;
output [1:0]   cmu_l2_err;

// **** gkt Interface ****
output        ifu_l15_valid;                   // Valid to L15
output [7:0] ifu_l15_cpkt;                    // Control packet to L15
output [39:0] ifu_l15_addr;                    // Address to L15


// **** LSU Interface ****
output         ifu_lsu_if_vld;
output [2:0]   ifu_lsu_if_tid;
output [10:5]  ifu_lsu_if_addr;



output         scan_out;




assign ftu_cmiss[7:0] = {ftu_agc_thr7_cmiss_c,ftu_agc_thr6_cmiss_c,ftu_agc_thr5_cmiss_c,ftu_agc_thr4_cmiss_c,
                         ftu_agc_thr3_cmiss_c,ftu_agc_thr2_cmiss_c,ftu_agc_thr1_cmiss_c,ftu_agc_thr0_cmiss_c};

assign ftu_inv_req[7:0] = {ftu_thr7_inv_req_c,ftu_thr6_inv_req_c,ftu_thr5_inv_req_c,ftu_thr4_inv_req_c,
                           ftu_thr3_inv_req_c,ftu_thr2_inv_req_c,ftu_thr1_inv_req_c,ftu_thr0_inv_req_c};

assign ftu_redirect[7:0] = {ftu_thr7_redirect_bf,ftu_thr6_redirect_bf,ftu_thr5_redirect_bf,ftu_thr4_redirect_bf,
                            ftu_thr3_redirect_bf,ftu_thr2_redirect_bf,ftu_thr1_redirect_bf,ftu_thr0_redirect_bf};

assign {cmu_thr7_data_ready,cmu_thr6_data_ready,cmu_thr5_data_ready,cmu_thr4_data_ready,
        cmu_thr3_data_ready,cmu_thr2_data_ready,cmu_thr1_data_ready,cmu_thr0_data_ready} = cmu_data_ready[7:0];

assign cmu_rst_dupmiss[7:0] = mct_rst_dupmiss[7:0];

assign ftu_fetch_f[7:0] = ftu_curr_fetch_thr_f[7:0];

   


ifu_cmu_cmt_ctl cmt (
                          /*AUTOINST*/
                          // Outputs
                          .csm_valid_req(csm_valid_req[7:0]),
                          .cmu_null_st(cmu_null_st[7:0]),
                          .cmu_req_st(cmu_req_st[7:0]),
                          .cmu_canleave_st(cmu_canleave_st[7:0]),
                          .cmu_dupmiss_st(cmu_dupmiss_st[7:0]),
                          // Inputs
                          .tcu_pce_ov   (tcu_pce_ov),
                          .spc_aclk (spc_aclk),
                          .spc_bclk (spc_bclk),
                          .scan_in(cmsm_top_scanin),
                          .scan_out(cmsm_top_scanout),
                          .l2clk        (l2clk),
                          .ftu_cmiss    (ftu_cmiss[7:0]),
                          .ftu_redirect (ftu_redirect[7:0]),
                          .mct_fill_complete(mct_fill_complete[7:0]),
                          .ftu_inv_req  (ftu_inv_req[7:0]),
                          .lsc_l15_valid(lsc_l15_valid[7:0]),
                          .cmu_data_ready(cmu_data_ready[7:0]),
                          .cmu_has_dup_miss(cmu_has_dup_miss[7:0]),
                          .mct_rst_dupmiss(mct_rst_dupmiss[7:0]),
                          .mct_ignore_cmiss(mct_ignore_cmiss),
  .tcu_scan_en(tcu_scan_en),
  .mdp_mbhit_q(mdp_mbhit_q[7:0]));



ifu_cmu_lsi_ctl lsc (
                         /*AUTOINST*/
                         // Outputs
                         .lsc_fill_rtn1 (lsc_fill_rtn1),
                         .lsc_fill_rtn2 (lsc_fill_rtn2),
                         .lsc_req_sel   (lsc_req_sel[7:0]),
                         .lsc_pending_req(lsc_pending_req),
                         .lsc_l15_valid (lsc_l15_valid[7:0]),
                         .cmu_any_data_ready(cmu_any_data_ready),
                         .cmu_any_un_cacheable(cmu_any_un_cacheable),
                         .cmu_data_ready(cmu_data_ready[7:0]),
                         .cmu_inst0_v   (cmu_inst0_v),
                         .cmu_inst1_v   (cmu_inst1_v),
                         .cmu_inst2_v   (cmu_inst2_v),
                         .cmu_inst3_v   (cmu_inst3_v),
                         .cmu_icache_invalidate(cmu_icache_invalidate),
                         .cmu_icache_invalidate_way(cmu_icache_invalidate_way[2:0]),
                         .cmu_icache_invalidate_index(cmu_icache_invalidate_index[10:5]),
                         .cmu_evic_invalidate(cmu_evic_invalidate),
                         .cmu_icache_inv_way1(cmu_icache_inv_way1[2:0]),
                         .cmu_inval_ack (cmu_inval_ack[7:0]),
                         .cmu_l2_err    (cmu_l2_err[1:0]),
                         .cmu_l2miss    (cmu_l2miss),
                         .ifu_l15_valid (ifu_l15_valid),
                         .ifu_l15_cpkt  (ifu_l15_cpkt[7:0]),
                         .ifu_lsu_if_vld(ifu_lsu_if_vld),
                         .ifu_lsu_if_tid(ifu_lsu_if_tid[2:0]),
                         .ifu_lsu_if_addr(ifu_lsu_if_addr[10:5]),
                         // Inputs
                         .scan_in(lsi_ctl_scanin),
                         .scan_out(lsi_ctl_scanout),
                         .l2clk         (l2clk),
                         .tcu_pce_ov    (tcu_pce_ov),
                         .spc_aclk  (spc_aclk),
                         .spc_bclk  (spc_bclk),
                         .const_cpuid   (const_cpuid[2:0]),
                         .lsu_ifu_cmu_pmen   (lsu_ifu_cmu_pmen),
                         .ftu_cmiss(ftu_cmiss[7:0]),
                         .mct_early_req (mct_early_req),
                         .ftu_rep_way   (ftu_rep_way[2:0]),
                         .ftu_thrx_un_cacheable(ftu_thrx_un_cacheable),
                         .ifu_l15_addr  (ifu_l15_addr[10:5]),
                         .csm_valid_req (csm_valid_req[7:0]),
                         .l15_spc_data1 (l15_spc_data1[127:0]),
                         .l15_spc_cpkt  (l15_spc_cpkt[17:0]),
                         .l15_ifu_valid (l15_ifu_valid),
                         .l15_ifu_grant (l15_ifu_grant),
                         .lsu_ifu_ld_index(lsu_ifu_ld_index[10:5]),
                         .cmu_fill_paddr(cmu_fill_paddr[4:2]),
                         .mdp_lsi_nc_bit(mdp_lsi_nc_bit),
                         .mdp_lsi_inv_bit(mdp_lsi_inv_bit),
                         .mdp_lsi_rway  (mdp_lsi_rway[2:0]),
  .tcu_scan_en(tcu_scan_en),
  .lsc_data_sel(lsc_data_sel[7:0]),
  .lsc_clken(lsc_clken));


ifu_cmu_lsi_dp  lsd (
                        /*AUTOINST*/
                        // Outputs
                        .cmu_ic_data    (cmu_ic_data[263:0]),
                        .cmu_fill_inst0 (cmu_fill_inst0[32:0]),
                        .cmu_fill_inst1 (cmu_fill_inst1[32:0]),
                        .cmu_fill_inst2 (cmu_fill_inst2[32:0]),
                        .cmu_fill_inst3 (cmu_fill_inst3[32:0]),
                        // Inputs
                        .scan_in(lsi_dp_scanin),
                        .scan_out(lsi_dp_scanout),
                        .l2clk          (l2clk),
                        .spc_aclk   (spc_aclk),
                        .spc_bclk   (spc_bclk),
                        .tcu_pce_ov     (tcu_pce_ov),
                        .l15_spc_data1  (l15_spc_data1[127:0]),
                        .lsc_fill_rtn1  (lsc_fill_rtn1),
                     .lsc_fill_rtn2  (lsc_fill_rtn2),
  .tcu_scan_en(tcu_scan_en),
  .lsc_clken(lsc_clken),
  .lsc_data_sel(lsc_data_sel[7:0]),
  .gkt_ifu_legal(gkt_ifu_legal[3:0]),
  .gkt_ifu_flip_parity(gkt_ifu_flip_parity[3:0]));




ifu_cmu_msb_ctl mct (
                              /*AUTOINST*/
                              // Outputs
                              .mct_clken(mct_clken[7:0]),
                              .mct_early_req(mct_early_req),
                              .mct_upd_addr(mct_upd_addr[7:0]),
                              .mct_real_wom(mct_real_wom[7:0]),
                              .cmu_has_dup_miss(cmu_has_dup_miss[7:0]),
                              .mct_rst_dupmiss(mct_rst_dupmiss[7:0]),
                              .mct_fill_complete(mct_fill_complete[7:0]),
                              .mct_ignore_cmiss(mct_ignore_cmiss),
                              // Inputs
                              .scan_in(missbuff_ctl_scanin),
                              .scan_out(missbuff_ctl_scanout),
                              .l2clk    (l2clk),
                              .tcu_pce_ov(tcu_pce_ov),
                              .spc_aclk(spc_aclk),
                              .spc_bclk(spc_bclk),
                              .lsu_ifu_cmu_pmen   (lsu_ifu_cmu_pmen),
                              .ftu_cmiss(ftu_cmiss[7:0]),
                              .ftu_fetch_f(ftu_fetch_f[7:0]),
                              .ftu_inv_req(ftu_inv_req[7:0]),
                              .ftu_redirect(ftu_redirect[7:0]),
                              .l15_spc_cpkt(l15_spc_cpkt[8:6]),
                              .cmu_req_st(cmu_req_st[7:0]),
                              .cmu_canleave_st(cmu_canleave_st[7:0]),
                              .lsc_l15_valid(lsc_l15_valid[7:0]),
                              .cmu_data_ready(cmu_data_ready[7:0]),
                              .lsc_fill_rtn2(lsc_fill_rtn2),
                              .mdp_mbhit_q(mdp_mbhit_q[7:0]),
  .tcu_scan_en(tcu_scan_en));





ifu_cmu_msb_dp mdp (
                            /*AUTOINST*/
                            // Outputs
                            .mdp_mbhit_q(mdp_mbhit_q[7:0]),
                            .mdp_lsi_rway(mdp_lsi_rway[2:0]),
                            .ifu_l15_addr(ifu_l15_addr[39:0]),
                            .mdp_lsi_nc_bit(mdp_lsi_nc_bit),
                            .mdp_lsi_inv_bit(mdp_lsi_inv_bit),
                            .cmu_fill_wrway(cmu_fill_wrway[2:0]),
                            .cmu_fill_paddr(cmu_fill_paddr[39:0]),
                            // Inputs
                            .scan_in(missbuff_dp_scanin),
                            .scan_out(missbuff_dp_scanout),
                            .l2clk      (l2clk),
                            .tcu_pce_ov (tcu_pce_ov),
                            .spc_aclk(spc_aclk),
                            .spc_bclk(spc_bclk),
                            .l15_spc_cpkt(l15_spc_cpkt[8:6]),
                            .ftu_paddr  (ftu_paddr[39:0]),
                            .ftu_rep_way(ftu_rep_way[2:0]),
                            .ftu_inv_req(ftu_inv_req[7:0]),
                            .ftu_thrx_un_cacheable(ftu_thrx_un_cacheable),
                            .lsc_pending_req(lsc_pending_req),
                            .lsc_req_sel(lsc_req_sel[7:0]),
                              .mct_real_wom(mct_real_wom[7:0]),
                    .mct_upd_addr(mct_upd_addr[7:0]),
  .tcu_scan_en(tcu_scan_en),
  .mct_clken(mct_clken[7:0]));



// fixscan start:
assign cmsm_top_scanin           = scan_in                  ;
assign lsi_ctl_scanin            = cmsm_top_scanout         ;
assign lsi_dp_scanin             = lsi_ctl_scanout          ;
assign missbuff_ctl_scanin       = lsi_dp_scanout           ;
assign missbuff_dp_scanin        = missbuff_ctl_scanout     ;
assign scan_out                  = missbuff_dp_scanout      ;
// fixscan end:
endmodule
