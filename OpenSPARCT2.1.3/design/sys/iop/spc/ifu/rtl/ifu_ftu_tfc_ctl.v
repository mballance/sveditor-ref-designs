// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_ftu_tfc_ctl.v
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
module ifu_ftu_tfc_ctl (
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  spc_aclk, 
  spc_bclk, 
  tcu_pce_ov, 
  ftu_thr0_redirect_bf, 
  ftu_thr1_redirect_bf, 
  ftu_thr2_redirect_bf, 
  ftu_thr3_redirect_bf, 
  ftu_thr4_redirect_bf, 
  ftu_thr5_redirect_bf, 
  ftu_thr6_redirect_bf, 
  ftu_thr7_redirect_bf, 
  agc_thr0_err_detect_c, 
  agc_thr1_err_detect_c, 
  agc_thr2_err_detect_c, 
  agc_thr3_err_detect_c, 
  agc_thr4_err_detect_c, 
  agc_thr5_err_detect_c, 
  agc_thr6_err_detect_c, 
  agc_thr7_err_detect_c, 
  ftu_thr0_inv_req_c, 
  ftu_thr1_inv_req_c, 
  ftu_thr2_inv_req_c, 
  ftu_thr3_inv_req_c, 
  ftu_thr4_inv_req_c, 
  ftu_thr5_inv_req_c, 
  ftu_thr6_inv_req_c, 
  ftu_thr7_inv_req_c, 
  agc_thr0_lsu_no_ic_miss, 
  agc_thr1_lsu_no_ic_miss, 
  agc_thr2_lsu_no_ic_miss, 
  agc_thr3_lsu_no_ic_miss, 
  agc_thr4_lsu_no_ic_miss, 
  agc_thr5_lsu_no_ic_miss, 
  agc_thr6_lsu_no_ic_miss, 
  agc_thr7_lsu_no_ic_miss, 
  agc_thr0_tlu_redirect_bf, 
  agc_thr1_tlu_redirect_bf, 
  agc_thr2_tlu_redirect_bf, 
  agc_thr3_tlu_redirect_bf, 
  agc_thr4_tlu_redirect_bf, 
  agc_thr5_tlu_redirect_bf, 
  agc_thr6_tlu_redirect_bf, 
  agc_thr7_tlu_redirect_bf, 
  ftp_thr0_go_to_sf_wait, 
  ftp_thr1_go_to_sf_wait, 
  ftp_thr2_go_to_sf_wait, 
  ftp_thr3_go_to_sf_wait, 
  ftp_thr4_go_to_sf_wait, 
  ftp_thr5_go_to_sf_wait, 
  ftp_thr6_go_to_sf_wait, 
  ftp_thr7_go_to_sf_wait, 
  cmu_inval_ack, 
  cmu_rst_dupmiss, 
  cmu_null_st, 
  cmu_dupmiss_st, 
  cmu_thr0_data_ready, 
  cmu_thr1_data_ready, 
  cmu_thr2_data_ready, 
  cmu_thr3_data_ready, 
  cmu_thr4_data_ready, 
  cmu_thr5_data_ready, 
  cmu_thr6_data_ready, 
  cmu_thr7_data_ready, 
  agc_thr0_cmiss_stm_c, 
  agc_thr1_cmiss_stm_c, 
  agc_thr2_cmiss_stm_c, 
  agc_thr3_cmiss_stm_c, 
  agc_thr4_cmiss_stm_c, 
  agc_thr5_cmiss_stm_c, 
  agc_thr6_cmiss_stm_c, 
  agc_thr7_cmiss_stm_c, 
  agc_thr0_itb_miss_c, 
  agc_thr1_itb_miss_c, 
  agc_thr2_itb_miss_c, 
  agc_thr3_itb_miss_c, 
  agc_thr4_itb_miss_c, 
  agc_thr5_itb_miss_c, 
  agc_thr6_itb_miss_c, 
  agc_thr7_itb_miss_c, 
  cmu_any_data_ready, 
  ftp_reset_fill_wait, 
  ftp_thr0_room_is_less_t_3, 
  ftp_thr1_room_is_less_t_3, 
  ftp_thr2_room_is_less_t_3, 
  ftp_thr3_room_is_less_t_3, 
  ftp_thr4_room_is_less_t_3, 
  ftp_thr5_room_is_less_t_3, 
  ftp_thr6_room_is_less_t_3, 
  ftp_thr7_room_is_less_t_3, 
  itc_demap_next, 
  tlu_flush_ifu, 
  asi_wr_request, 
  asi_rd_request, 
  ftp_asi_rd_done, 
  ftp_asi_wr_done, 
  tsm_thr0_fill_rdy0, 
  tsm_thr1_fill_rdy0, 
  tsm_thr2_fill_rdy0, 
  tsm_thr3_fill_rdy0, 
  tsm_thr4_fill_rdy0, 
  tsm_thr5_fill_rdy0, 
  tsm_thr6_fill_rdy0, 
  tsm_thr7_fill_rdy0, 
  tsm_thr0_no_new_miss, 
  tsm_thr1_no_new_miss, 
  tsm_thr2_no_new_miss, 
  tsm_thr3_no_new_miss, 
  tsm_thr4_no_new_miss, 
  tsm_thr5_no_new_miss, 
  tsm_thr6_no_new_miss, 
  tsm_thr7_no_new_miss, 
  tsm_thr0_ignore_by_pass, 
  tsm_thr1_ignore_by_pass, 
  tsm_thr2_ignore_by_pass, 
  tsm_thr3_ignore_by_pass, 
  tsm_thr4_ignore_by_pass, 
  tsm_thr5_ignore_by_pass, 
  tsm_thr6_ignore_by_pass, 
  tsm_thr7_ignore_by_pass, 
  tsm_thr0_ready_hp_bf_in, 
  tsm_thr1_ready_hp_bf_in, 
  tsm_thr2_ready_hp_bf_in, 
  tsm_thr3_ready_hp_bf_in, 
  tsm_thr4_ready_hp_bf_in, 
  tsm_thr5_ready_hp_bf_in, 
  tsm_thr6_ready_hp_bf_in, 
  tsm_thr7_ready_hp_bf_in, 
  ftu_ifu_quiesce, 
  scan_out) ;
wire pce_ov;
wire stop;
wire l1clk;
wire tsm0_scanin;
wire tsm0_scanout;
wire tsm1_scanin;
wire tsm1_scanout;
wire tsm2_scanin;
wire tsm2_scanout;
wire tsm3_scanin;
wire tsm3_scanout;
wire tsm4_scanin;
wire tsm4_scanout;
wire tsm5_scanin;
wire tsm5_scanout;
wire tsm6_scanin;
wire tsm6_scanout;
wire tsm7_scanin;
wire tsm7_scanout;
wire se;


input tcu_scan_en ;
input   l2clk;
input  	scan_in;
input  	spc_aclk;
input  	spc_bclk;
input  	tcu_pce_ov;		// scan signals

input   ftu_thr0_redirect_bf;
input   ftu_thr1_redirect_bf;
input   ftu_thr2_redirect_bf;
input   ftu_thr3_redirect_bf;
input   ftu_thr4_redirect_bf;
input   ftu_thr5_redirect_bf;
input   ftu_thr6_redirect_bf;
input   ftu_thr7_redirect_bf;


input   agc_thr0_err_detect_c ;
input   agc_thr1_err_detect_c ;
input   agc_thr2_err_detect_c ;
input   agc_thr3_err_detect_c ;
input   agc_thr4_err_detect_c ;
input   agc_thr5_err_detect_c ;
input   agc_thr6_err_detect_c ;
input   agc_thr7_err_detect_c ;

input   ftu_thr0_inv_req_c ;
input   ftu_thr1_inv_req_c ;
input   ftu_thr2_inv_req_c ;
input   ftu_thr3_inv_req_c ;
input   ftu_thr4_inv_req_c ;
input   ftu_thr5_inv_req_c ;
input   ftu_thr6_inv_req_c ;
input   ftu_thr7_inv_req_c ;
        

input   agc_thr0_lsu_no_ic_miss ;
input   agc_thr1_lsu_no_ic_miss ;
input   agc_thr2_lsu_no_ic_miss ;
input   agc_thr3_lsu_no_ic_miss ;
input   agc_thr4_lsu_no_ic_miss ;
input   agc_thr5_lsu_no_ic_miss ;
input   agc_thr6_lsu_no_ic_miss ;
input   agc_thr7_lsu_no_ic_miss ;

input   agc_thr0_tlu_redirect_bf;
input   agc_thr1_tlu_redirect_bf;
input   agc_thr2_tlu_redirect_bf;
input   agc_thr3_tlu_redirect_bf;
input   agc_thr4_tlu_redirect_bf;
input   agc_thr5_tlu_redirect_bf;
input   agc_thr6_tlu_redirect_bf;
input   agc_thr7_tlu_redirect_bf;

input   ftp_thr0_go_to_sf_wait;
input   ftp_thr1_go_to_sf_wait;
input   ftp_thr2_go_to_sf_wait;
input   ftp_thr3_go_to_sf_wait;
input   ftp_thr4_go_to_sf_wait;
input   ftp_thr5_go_to_sf_wait;
input   ftp_thr6_go_to_sf_wait;
input   ftp_thr7_go_to_sf_wait;

input   [7:0] cmu_inval_ack;
input   [7:0] cmu_rst_dupmiss;
        


input  [7:0] cmu_null_st;
input  [7:0] cmu_dupmiss_st;
   
input   cmu_thr0_data_ready;
input   cmu_thr1_data_ready;
input   cmu_thr2_data_ready;
input   cmu_thr3_data_ready;
input   cmu_thr4_data_ready;
input   cmu_thr5_data_ready;
input   cmu_thr6_data_ready;
input   cmu_thr7_data_ready;
        
input   agc_thr0_cmiss_stm_c;
input   agc_thr1_cmiss_stm_c;
input   agc_thr2_cmiss_stm_c;
input   agc_thr3_cmiss_stm_c;
input   agc_thr4_cmiss_stm_c;
input   agc_thr5_cmiss_stm_c;
input   agc_thr6_cmiss_stm_c;
input   agc_thr7_cmiss_stm_c;
        
input   agc_thr0_itb_miss_c;
input   agc_thr1_itb_miss_c;
input   agc_thr2_itb_miss_c;
input   agc_thr3_itb_miss_c;
input   agc_thr4_itb_miss_c;
input   agc_thr5_itb_miss_c;
input   agc_thr6_itb_miss_c;
input   agc_thr7_itb_miss_c;


input   cmu_any_data_ready ;
input   ftp_reset_fill_wait;
// input   ftp_go_to_fill_wait;
// input   ftp_thr0_go_to_fill_wait;
// input   ftp_thr1_go_to_fill_wait;
// input   ftp_thr2_go_to_fill_wait;
// input   ftp_thr3_go_to_fill_wait;
// input   ftp_thr4_go_to_fill_wait;
// input   ftp_thr5_go_to_fill_wait;
// input   ftp_thr6_go_to_fill_wait;
// input   ftp_thr7_go_to_fill_wait;


input   ftp_thr0_room_is_less_t_3;
input   ftp_thr1_room_is_less_t_3;
input   ftp_thr2_room_is_less_t_3;
input   ftp_thr3_room_is_less_t_3;
input   ftp_thr4_room_is_less_t_3;
input   ftp_thr5_room_is_less_t_3;
input   ftp_thr6_room_is_less_t_3;
input   ftp_thr7_room_is_less_t_3;

// input   agc_thr0_rst_dmiss_bf;
// input   agc_thr1_rst_dmiss_bf;
// input   agc_thr2_rst_dmiss_bf;
// input   agc_thr3_rst_dmiss_bf;
// input   agc_thr4_rst_dmiss_bf;
// input   agc_thr5_rst_dmiss_bf;
// input   agc_thr6_rst_dmiss_bf;
// input   agc_thr7_rst_dmiss_bf;
//         
        
input   itc_demap_next;
input [7:0]  tlu_flush_ifu;

input        asi_wr_request ;
input        asi_rd_request ;
input        ftp_asi_rd_done ;
input        ftp_asi_wr_done ;


output  tsm_thr0_fill_rdy0  ;
output  tsm_thr1_fill_rdy0  ;
output  tsm_thr2_fill_rdy0  ;
output  tsm_thr3_fill_rdy0  ;
output  tsm_thr4_fill_rdy0  ;
output  tsm_thr5_fill_rdy0  ;
output  tsm_thr6_fill_rdy0  ;
output  tsm_thr7_fill_rdy0  ;
 
output  tsm_thr0_no_new_miss  ;
output  tsm_thr1_no_new_miss  ;
output  tsm_thr2_no_new_miss  ;
output  tsm_thr3_no_new_miss  ;
output  tsm_thr4_no_new_miss  ;
output  tsm_thr5_no_new_miss  ;
output  tsm_thr6_no_new_miss  ;
output  tsm_thr7_no_new_miss  ;

output  tsm_thr0_ignore_by_pass ;
output  tsm_thr1_ignore_by_pass ;
output  tsm_thr2_ignore_by_pass ;
output  tsm_thr3_ignore_by_pass ;
output  tsm_thr4_ignore_by_pass ;
output  tsm_thr5_ignore_by_pass ;
output  tsm_thr6_ignore_by_pass ;
output  tsm_thr7_ignore_by_pass ;
   
   

        
        
output  tsm_thr0_ready_hp_bf_in;
output  tsm_thr1_ready_hp_bf_in;
output  tsm_thr2_ready_hp_bf_in;
output  tsm_thr3_ready_hp_bf_in;
output  tsm_thr4_ready_hp_bf_in;
output  tsm_thr5_ready_hp_bf_in;
output  tsm_thr6_ready_hp_bf_in;
output  tsm_thr7_ready_hp_bf_in;
        
        

output  [7:0] ftu_ifu_quiesce; 

output  scan_out;

// scan renames
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
// end scan

ifu_ftu_tfc_ctl_l1clkhdr_ctl_macro clkgen (
 .l2clk(l2clk),
 .l1en (1'b1 ),
 .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));


ifu_ftu_tsm_ctl tsm0 (
   .scan_in(tsm0_scanin),
   .scan_out(tsm0_scanout),
   .l1clk(l1clk), 
   .agc_redirect_bf(ftu_thr0_redirect_bf),
   .agc_tlu_redirect_bf(agc_thr0_tlu_redirect_bf),
   .thrx_go_to_sf_wait(ftp_thr0_go_to_sf_wait),
   .inv_req_c(ftu_thr0_inv_req_c),
   .err_detect_c(agc_thr0_err_detect_c),
   .cmu_inv_req_ack(cmu_inval_ack[0]),
   .thrx_is_null(cmu_null_st[0]),
   .thrx_is_dupmiss(cmu_dupmiss_st[0]),
   .ftu_agc_cmiss_c(agc_thr0_cmiss_stm_c),
   .data_ready(cmu_thr0_data_ready),
   .ftp_reset_fill_wait(ftp_reset_fill_wait),
   .reset_dmiss_bf(cmu_rst_dupmiss[0]),
   .ftp_room_is_less_t_3(ftp_thr0_room_is_less_t_3),
   .itb_miss_c(agc_thr0_itb_miss_c),
   .tlu_flush_thrx_ifu(tlu_flush_ifu[0]),
   .cmu_any_data_ready(cmu_any_data_ready),
   .agc_lsu_no_ic_miss(agc_thr0_lsu_no_ic_miss),
   .next_thrx_is_ready(tsm_thr0_ready_hp_bf_in),
   .tsm_fill_rdy0(tsm_thr0_fill_rdy0),
   .tsm_no_new_miss(tsm_thr0_no_new_miss),
   .tsm_thrx_ifu_quiesce(ftu_ifu_quiesce[0]),
   .tsm_ignore_by_pass(tsm_thr0_ignore_by_pass),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .asi_rd_request(asi_rd_request),
  .asi_wr_request(asi_wr_request),
  .ftp_asi_rd_done(ftp_asi_rd_done),
  .ftp_asi_wr_done(ftp_asi_wr_done),
  .itc_demap_next(itc_demap_next) 
);


ifu_ftu_tsm_ctl tsm1 (
   .scan_in(tsm1_scanin),
   .scan_out(tsm1_scanout),
   .l1clk(l1clk),
   .agc_redirect_bf(ftu_thr1_redirect_bf),
   .agc_tlu_redirect_bf(agc_thr1_tlu_redirect_bf),
   .thrx_go_to_sf_wait(ftp_thr1_go_to_sf_wait),
   .inv_req_c(ftu_thr1_inv_req_c),
   .err_detect_c(agc_thr1_err_detect_c),
   .cmu_inv_req_ack(cmu_inval_ack[1]),
   .ftu_agc_cmiss_c(agc_thr1_cmiss_stm_c),
   .thrx_is_null(cmu_null_st[1]),
   .thrx_is_dupmiss(cmu_dupmiss_st[1]),
   .data_ready(cmu_thr1_data_ready),
   .ftp_reset_fill_wait(ftp_reset_fill_wait),
   .reset_dmiss_bf(cmu_rst_dupmiss[1]),
   .ftp_room_is_less_t_3(ftp_thr1_room_is_less_t_3),
   .itb_miss_c(agc_thr1_itb_miss_c),
   .tlu_flush_thrx_ifu(tlu_flush_ifu[1]),
   .cmu_any_data_ready(cmu_any_data_ready),
   .agc_lsu_no_ic_miss(agc_thr1_lsu_no_ic_miss),
   .next_thrx_is_ready(tsm_thr1_ready_hp_bf_in),
   .tsm_fill_rdy0(tsm_thr1_fill_rdy0),
   .tsm_no_new_miss(tsm_thr1_no_new_miss),
   .tsm_thrx_ifu_quiesce(ftu_ifu_quiesce[1]),
   .tsm_ignore_by_pass(tsm_thr1_ignore_by_pass),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .asi_rd_request(asi_rd_request),
  .asi_wr_request(asi_wr_request),
  .ftp_asi_rd_done(ftp_asi_rd_done),
  .ftp_asi_wr_done(ftp_asi_wr_done),
  .itc_demap_next(itc_demap_next)
);

ifu_ftu_tsm_ctl tsm2 (
   .scan_in(tsm2_scanin),
   .scan_out(tsm2_scanout),
   .l1clk(l1clk),
   .agc_redirect_bf(ftu_thr2_redirect_bf),
   .agc_tlu_redirect_bf(agc_thr2_tlu_redirect_bf),
   .thrx_go_to_sf_wait(ftp_thr2_go_to_sf_wait),
   .inv_req_c(ftu_thr2_inv_req_c),
   .err_detect_c(agc_thr2_err_detect_c),
   .thrx_is_null(cmu_null_st[2]),
   .thrx_is_dupmiss(cmu_dupmiss_st[2]),
   .cmu_inv_req_ack(cmu_inval_ack[2]),
   .ftu_agc_cmiss_c(agc_thr2_cmiss_stm_c),
   .data_ready(cmu_thr2_data_ready),
   .ftp_reset_fill_wait(ftp_reset_fill_wait),
   .reset_dmiss_bf(cmu_rst_dupmiss[2]),
   .ftp_room_is_less_t_3(ftp_thr2_room_is_less_t_3),
   .itb_miss_c(agc_thr2_itb_miss_c),
   .tlu_flush_thrx_ifu(tlu_flush_ifu[2]),
   .cmu_any_data_ready(cmu_any_data_ready),
   .agc_lsu_no_ic_miss(agc_thr2_lsu_no_ic_miss),
   .next_thrx_is_ready(tsm_thr2_ready_hp_bf_in),
   .tsm_fill_rdy0(tsm_thr2_fill_rdy0),
   .tsm_no_new_miss(tsm_thr2_no_new_miss),
   .tsm_thrx_ifu_quiesce(ftu_ifu_quiesce[2]),
   .tsm_ignore_by_pass(tsm_thr2_ignore_by_pass),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .asi_rd_request(asi_rd_request),
  .asi_wr_request(asi_wr_request),
  .ftp_asi_rd_done(ftp_asi_rd_done),
  .ftp_asi_wr_done(ftp_asi_wr_done),
  .itc_demap_next(itc_demap_next) 
);


ifu_ftu_tsm_ctl tsm3 (
   .scan_in(tsm3_scanin),
   .scan_out(tsm3_scanout),
   .l1clk(l1clk),
   .agc_redirect_bf(ftu_thr3_redirect_bf),
   .agc_tlu_redirect_bf(agc_thr3_tlu_redirect_bf),
   .thrx_go_to_sf_wait(ftp_thr3_go_to_sf_wait),
   .inv_req_c(ftu_thr3_inv_req_c),
   .err_detect_c(agc_thr3_err_detect_c),
   .cmu_inv_req_ack(cmu_inval_ack[3]),
   .thrx_is_null(cmu_null_st[3]),
   .thrx_is_dupmiss(cmu_dupmiss_st[3]),
   .ftu_agc_cmiss_c(agc_thr3_cmiss_stm_c),
   .data_ready(cmu_thr3_data_ready),
   .ftp_reset_fill_wait(ftp_reset_fill_wait),
   .reset_dmiss_bf(cmu_rst_dupmiss[3]),
   .ftp_room_is_less_t_3(ftp_thr3_room_is_less_t_3),
   .itb_miss_c(agc_thr3_itb_miss_c),
   .tlu_flush_thrx_ifu(tlu_flush_ifu[3]),
   .cmu_any_data_ready(cmu_any_data_ready),
   .agc_lsu_no_ic_miss(agc_thr3_lsu_no_ic_miss),
   .next_thrx_is_ready(tsm_thr3_ready_hp_bf_in),
   .tsm_fill_rdy0(tsm_thr3_fill_rdy0),
   .tsm_no_new_miss(tsm_thr3_no_new_miss),
   .tsm_thrx_ifu_quiesce(ftu_ifu_quiesce[3]),
   .tsm_ignore_by_pass(tsm_thr3_ignore_by_pass),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .asi_rd_request(asi_rd_request),
  .asi_wr_request(asi_wr_request),
  .ftp_asi_rd_done(ftp_asi_rd_done),
  .ftp_asi_wr_done(ftp_asi_wr_done),
  .itc_demap_next(itc_demap_next) 
);


ifu_ftu_tsm_ctl tsm4 (
   .scan_in(tsm4_scanin),
   .scan_out(tsm4_scanout),
   .l1clk(l1clk),
   .agc_redirect_bf(ftu_thr4_redirect_bf),
   .agc_tlu_redirect_bf(agc_thr4_tlu_redirect_bf),
   .thrx_go_to_sf_wait(ftp_thr4_go_to_sf_wait),
   .inv_req_c(ftu_thr4_inv_req_c),
   .err_detect_c(agc_thr4_err_detect_c),
   .cmu_inv_req_ack(cmu_inval_ack[4]),
   .thrx_is_null(cmu_null_st[4]),
   .thrx_is_dupmiss(cmu_dupmiss_st[4]),
   .ftu_agc_cmiss_c(agc_thr4_cmiss_stm_c),
   .data_ready(cmu_thr4_data_ready),
   .ftp_reset_fill_wait(ftp_reset_fill_wait),
   .reset_dmiss_bf(cmu_rst_dupmiss[4]),
   .ftp_room_is_less_t_3(ftp_thr4_room_is_less_t_3),
   .itb_miss_c(agc_thr4_itb_miss_c),
   .tlu_flush_thrx_ifu(tlu_flush_ifu[4]),
   .cmu_any_data_ready(cmu_any_data_ready),
   .agc_lsu_no_ic_miss(agc_thr4_lsu_no_ic_miss),
   .next_thrx_is_ready(tsm_thr4_ready_hp_bf_in),
   .tsm_fill_rdy0(tsm_thr4_fill_rdy0),
   .tsm_ignore_by_pass(tsm_thr4_ignore_by_pass),
   .tsm_thrx_ifu_quiesce(ftu_ifu_quiesce[4]),
   .tsm_no_new_miss(tsm_thr4_no_new_miss),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .asi_rd_request(asi_rd_request),
  .asi_wr_request(asi_wr_request),
  .ftp_asi_rd_done(ftp_asi_rd_done),
  .ftp_asi_wr_done(ftp_asi_wr_done),
  .itc_demap_next(itc_demap_next)
);


ifu_ftu_tsm_ctl tsm5 (
   .scan_in(tsm5_scanin),
   .scan_out(tsm5_scanout),
   .l1clk(l1clk),
   .agc_redirect_bf(ftu_thr5_redirect_bf),
   .thrx_go_to_sf_wait(ftp_thr5_go_to_sf_wait),
   .agc_tlu_redirect_bf(agc_thr5_tlu_redirect_bf),
   .inv_req_c(ftu_thr5_inv_req_c),
   .err_detect_c(agc_thr5_err_detect_c),
   .cmu_inv_req_ack(cmu_inval_ack[5]),
   .thrx_is_null(cmu_null_st[5]),
   .thrx_is_dupmiss(cmu_dupmiss_st[5]),
   .ftu_agc_cmiss_c(agc_thr5_cmiss_stm_c),
   .data_ready(cmu_thr5_data_ready),
   .ftp_reset_fill_wait(ftp_reset_fill_wait),
   .reset_dmiss_bf(cmu_rst_dupmiss[5]),
   .ftp_room_is_less_t_3(ftp_thr5_room_is_less_t_3),
   .itb_miss_c(agc_thr5_itb_miss_c),
   .tlu_flush_thrx_ifu(tlu_flush_ifu[5]),
   .cmu_any_data_ready(cmu_any_data_ready),
   .agc_lsu_no_ic_miss(agc_thr5_lsu_no_ic_miss),
   .next_thrx_is_ready(tsm_thr5_ready_hp_bf_in),
   .tsm_fill_rdy0(tsm_thr5_fill_rdy0),
   .tsm_no_new_miss(tsm_thr5_no_new_miss),
   .tsm_thrx_ifu_quiesce(ftu_ifu_quiesce[5]),
   .tsm_ignore_by_pass(tsm_thr5_ignore_by_pass),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .asi_rd_request(asi_rd_request),
  .asi_wr_request(asi_wr_request),
  .ftp_asi_rd_done(ftp_asi_rd_done),
  .ftp_asi_wr_done(ftp_asi_wr_done),
  .itc_demap_next(itc_demap_next) 
);

ifu_ftu_tsm_ctl tsm6 (
   .scan_in(tsm6_scanin),
   .scan_out(tsm6_scanout),
   .l1clk(l1clk),
   .agc_redirect_bf(ftu_thr6_redirect_bf),
   .agc_tlu_redirect_bf(agc_thr6_tlu_redirect_bf),
   .thrx_go_to_sf_wait(ftp_thr6_go_to_sf_wait),
   .inv_req_c(ftu_thr6_inv_req_c),
   .err_detect_c(agc_thr6_err_detect_c),
   .cmu_inv_req_ack(cmu_inval_ack[6]),
   .thrx_is_null(cmu_null_st[6]),
   .thrx_is_dupmiss(cmu_dupmiss_st[6]),
   .ftu_agc_cmiss_c(agc_thr6_cmiss_stm_c),
   .data_ready(cmu_thr6_data_ready),
   .ftp_reset_fill_wait(ftp_reset_fill_wait),
   .reset_dmiss_bf(cmu_rst_dupmiss[6]),
   .ftp_room_is_less_t_3(ftp_thr6_room_is_less_t_3),
   .itb_miss_c(agc_thr6_itb_miss_c),
   .tlu_flush_thrx_ifu(tlu_flush_ifu[6]),
   .cmu_any_data_ready(cmu_any_data_ready),
   .agc_lsu_no_ic_miss(agc_thr6_lsu_no_ic_miss),
   .next_thrx_is_ready(tsm_thr6_ready_hp_bf_in),
   .tsm_fill_rdy0(tsm_thr6_fill_rdy0),
   .tsm_no_new_miss(tsm_thr6_no_new_miss),
   .tsm_thrx_ifu_quiesce(ftu_ifu_quiesce[6]),
   .tsm_ignore_by_pass(tsm_thr6_ignore_by_pass),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .asi_rd_request(asi_rd_request),
  .asi_wr_request(asi_wr_request),
  .ftp_asi_rd_done(ftp_asi_rd_done),
  .ftp_asi_wr_done(ftp_asi_wr_done),
  .itc_demap_next(itc_demap_next) 
);


ifu_ftu_tsm_ctl tsm7 (
   .scan_in(tsm7_scanin),
   .scan_out(tsm7_scanout),
   .l1clk(l1clk),
   .agc_redirect_bf(ftu_thr7_redirect_bf),
   .agc_tlu_redirect_bf(agc_thr7_tlu_redirect_bf),
   .thrx_go_to_sf_wait(ftp_thr7_go_to_sf_wait),
   .inv_req_c(ftu_thr7_inv_req_c),
   .err_detect_c(agc_thr7_err_detect_c),
   .cmu_inv_req_ack(cmu_inval_ack[7]),
   .thrx_is_null(cmu_null_st[7]),
   .thrx_is_dupmiss(cmu_dupmiss_st[7]),
   .ftu_agc_cmiss_c(agc_thr7_cmiss_stm_c),
   .data_ready(cmu_thr7_data_ready),
   .ftp_reset_fill_wait(ftp_reset_fill_wait),
   .reset_dmiss_bf(cmu_rst_dupmiss[7]),
   .ftp_room_is_less_t_3(ftp_thr7_room_is_less_t_3),
   .itb_miss_c(agc_thr7_itb_miss_c),
   .tlu_flush_thrx_ifu(tlu_flush_ifu[7]),
   .cmu_any_data_ready(cmu_any_data_ready),
   .agc_lsu_no_ic_miss(agc_thr7_lsu_no_ic_miss),
   .next_thrx_is_ready(tsm_thr7_ready_hp_bf_in),
   .tsm_fill_rdy0(tsm_thr7_fill_rdy0),
   .tsm_no_new_miss(tsm_thr7_no_new_miss),
   .tsm_thrx_ifu_quiesce(ftu_ifu_quiesce[7]),
   .tsm_ignore_by_pass(tsm_thr7_ignore_by_pass),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .asi_rd_request(asi_rd_request),
  .asi_wr_request(asi_wr_request),
  .ftp_asi_rd_done(ftp_asi_rd_done),
  .ftp_asi_wr_done(ftp_asi_wr_done),
  .itc_demap_next(itc_demap_next) 
);



supply0 vss;
supply1 vdd;
// fixscan start:
assign tsm0_scanin               = scan_in                  ;
assign tsm1_scanin               = tsm0_scanout             ;
assign tsm2_scanin               = tsm1_scanout             ;
assign tsm3_scanin               = tsm2_scanout             ;
assign tsm4_scanin               = tsm3_scanout             ;
assign tsm5_scanin               = tsm4_scanout             ;
assign tsm6_scanin               = tsm5_scanout             ;
assign tsm7_scanin               = tsm6_scanout             ;
assign scan_out                  = tsm7_scanout             ;
// fixscan end:
assign se = tcu_scan_en ;
endmodule






// any PARAMS parms go into naming of macro

module ifu_ftu_tfc_ctl_l1clkhdr_ctl_macro (
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

module ifu_ftu_tfc_ctl_msff_ctl_macro__width_1 (
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

module ifu_ftu_tfc_ctl_msff_ctl_macro__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module ifu_ftu_tfc_ctl_spare_ctl_macro__num_1 (
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
assign scan_out = so_0;



endmodule

