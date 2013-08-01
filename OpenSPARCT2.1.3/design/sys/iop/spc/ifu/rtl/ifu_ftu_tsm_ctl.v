// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_ftu_tsm_ctl.v
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
module ifu_ftu_tsm_ctl (
  l1clk, 
  scan_in, 
  spc_aclk, 
  spc_bclk, 
  asi_rd_request, 
  asi_wr_request, 
  thrx_is_null, 
  thrx_is_dupmiss, 
  ftp_asi_rd_done, 
  ftp_asi_wr_done, 
  agc_redirect_bf, 
  agc_lsu_no_ic_miss, 
  agc_tlu_redirect_bf, 
  inv_req_c, 
  err_detect_c, 
  cmu_inv_req_ack, 
  ftu_agc_cmiss_c, 
  data_ready, 
  cmu_any_data_ready, 
  itb_miss_c, 
  ftp_room_is_less_t_3, 
  tlu_flush_thrx_ifu, 
  thrx_go_to_sf_wait, 
  itc_demap_next, 
  reset_dmiss_bf, 
  ftp_reset_fill_wait, 
  tsm_fill_rdy0, 
  next_thrx_is_ready, 
  tsm_no_new_miss, 
  tsm_ignore_by_pass, 
  tsm_thrx_ifu_quiesce, 
  scan_out) ;
wire siclk;
wire soclk;
wire next_reset_wait;
wire reset_wait_state;
wire next_reset_wait_;
wire reset_wait_reg_scanin;
wire reset_wait_reg_scanout;
wire reset_wait_state_;
wire go_to_rmiss_null;
wire rmiss_wait_state;
wire dmiss_wait_state;
wire no_new_miss_state;
wire can_miss_wait_state;
wire reset_dmiss_f;
wire inv_req_ack_ff;
wire rmiss_null_state;
wire tsm_ifill_done_bf;
wire leave_rmiss_null;
wire next_rmill_null_;
wire rmiss_null_reg_l_scanin;
wire rmiss_null_reg_l_scanout;
wire rmiss_null_state_;
wire go_to_rmiss_wait;
wire leave_rmiss_wait;
wire next_rmiss_wait;
wire rmiss_wait_reg_scanin;
wire rmiss_wait_reg_scanout;
wire go_to_no_new_miss;
wire leave_no_new_miss;
wire next_no_new_miss;
wire no_new_miss_reg_scanin;
wire no_new_miss_reg_scanout;
wire tsm_lsu_no_ic_miss_state;
wire go_to_lsu_ic_miss;
wire lsu_no_ic_miss_reg_scanin;
wire lsu_no_ic_miss_reg_scanout;
wire go_to_lsu_wait;
wire tsm_lsu_wait_state;
wire leave_lsu_wait;
wire next_lsu_wait;
wire lsu_stops_fetch_reg_scanin;
wire lsu_stops_fetch_reg_scanout;
wire go_to_inv_wait;
wire tsm_inv_wait_state;
wire leave_inv_wait;
wire next_inv_wait;
wire inv_stops_fetch_reg_scanin;
wire inv_stops_fetch_reg_scanout;
wire go_to_can_miss_refill;
wire can_miss_refill_state;
wire leave_can_miss_refill;
wire next_can_miss_refill;
wire can_miss_refill_reg_scanin;
wire can_miss_refill_reg_scanout;
wire go_to_can_miss_wait;
wire leave_can_miss_wait;
wire next_can_miss_wait;
wire can_miss_wait_reg_scanin;
wire can_miss_wait_reg_scanout;
wire go_to_fill_rdy0;
wire leave_fill_rdy0;
wire fill_rdy0_state;
wire next_fill_rdy0;
wire fill_rdy0_reg_scanin;
wire fill_rdy0_reg_scanout;
wire go_to_asi_rd_wait;
wire tsm_asi_rd_wait_state;
wire leave_asi_rd_wait;
wire next_asi_rd_wait;
wire asi_rd_stops_fetch_reg_scanin;
wire asi_rd_stops_fetch_reg_scanout;
wire go_to_asi_wr_wait;
wire tsm_asi_wr_wait_state;
wire leave_asi_wr_wait;
wire next_asi_wr_wait;
wire asi_wr_stops_fetch_reg_scanin;
wire asi_wr_stops_fetch_reg_scanout;
wire go_to_dmiss_wait;
wire leave_dmiss_wait;
wire next_dmiss_wait;
wire dmiss_wait_reg_scanin;
wire dmiss_wait_reg_scanout;
wire reset_dmiss_reg_scanin;
wire reset_dmiss_reg_scanout;
wire go_to_fill_wait;
wire fill_wait_state;
wire leave_fill_wait;
wire next_fill_wait;
wire fill_wait_reg_scanin;
wire fill_wait_reg_scanout;
wire go_to_itlb_miss_wait;
wire itlb_miss_wait_state;
wire leave_itlb_miss_wait;
wire next_itlb_miss_wait;
wire itlb_miss_wait_reg_scanin;
wire itlb_miss_wait_reg_scanout;
wire go_to_err_wait;
wire err_wait_state;
wire leave_err_wait;
wire next_err_wait;
wire err_wait_reg_scanin;
wire err_wait_reg_scanout;
wire go_to_no_room_wait;
wire no_room_wait_state;
wire leave_no_room_wait;
wire next_no_room_wait;
wire no_room_wait_reg_scanin;
wire no_room_wait_reg_scanout;
wire go_to_itlb_demap;
wire leave_itlb_demap;
wire itlb_demap_state;
wire next_itlb_demap;
wire itlb_demap_reg_scanin;
wire itlb_demap_reg_scanout;
wire go_to_itlb_write;
wire leave_itlb_write;
wire itlb_write_state;
wire next_itlb_write;
wire itlb_write_reg_scanin;
wire itlb_write_reg_scanout;
wire flush_ifu_reg_scanin;
wire flush_ifu_reg_scanout;
wire tlu_flush_thrx_ifu_d;
wire go_to_tlu_redr;
wire tsm_tlu_redr_wait_state;
wire leave_tlu_redr;
wire next_tlu_redr_wait;
wire tlu_red_reg_scanin;
wire tlu_red_reg_scanout;
wire next_sf_wait;
wire sf_wait_state;
wire tlu_sf_reg_scanin;
wire tlu_sf_reg_scanout;
wire next_ignore_by_pass;
wire ignore_by_pass_reg_scanin;
wire ignore_by_pass_reg_scanout;
wire next_ifu_quiesce;
wire no_icmiss_pending_reg_scanin;
wire no_icmiss_pending_reg_scanout;
wire ifill_done_reg_scanin;
wire ifill_done_reg_scanout;
wire spares_scanin;
wire spares_scanout;
 

input  l1clk;
input  scan_in;
input  spc_aclk;
input  spc_bclk;

input  asi_rd_request;
input  asi_wr_request;
input  thrx_is_null;
input  thrx_is_dupmiss;
input  ftp_asi_rd_done;
input  ftp_asi_wr_done;
input  agc_redirect_bf;
input  agc_lsu_no_ic_miss;
input  agc_tlu_redirect_bf;
input  inv_req_c;
input  err_detect_c;
input  cmu_inv_req_ack;
input  ftu_agc_cmiss_c;
input  data_ready;
input  cmu_any_data_ready;
input  itb_miss_c;
input  ftp_room_is_less_t_3;
input  tlu_flush_thrx_ifu ;
input  thrx_go_to_sf_wait ;
input  itc_demap_next;
input  reset_dmiss_bf;
input  ftp_reset_fill_wait;
// output tsm_ready_hp_bf;
output tsm_fill_rdy0; 
output next_thrx_is_ready ;
// output tsm_fill_rdy1; 
output tsm_no_new_miss;
output tsm_ignore_by_pass;
output tsm_thrx_ifu_quiesce;
output scan_out;

// scan renames
assign siclk = spc_aclk;
assign soclk = spc_bclk;
// end scan
    
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////




////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// First state machine controls the thread if it      //
// initiated  the cache miss.                         //
////////////////////////////////////////////////////////
// First wait state is to wait the initial trap       //
// redirection from the trap unit.                    //
////////////////////////////////////////////////////////
assign next_reset_wait  = reset_wait_state & ~agc_redirect_bf ;
assign next_reset_wait_ = ~next_reset_wait ; 
ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 reset_wait_reg  (
 .scan_in(reset_wait_reg_scanin),
 .scan_out(reset_wait_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  (next_reset_wait_),
 .dout (reset_wait_state_),
  .siclk(siclk),
  .soclk(soclk));

assign reset_wait_state = ~reset_wait_state_ ;
////////////////////////////////////////////////////////
// Real_Miss_Null state                               // 
// Note: Null state comes up as ONE after reset       //
// There is a case that we get reset_dmiss_bf the     //
// cycle that we trying to go dmiss_state.In that case//
// we should come to NULL state.                      //    
////////////////////////////////////////////////////////
assign go_to_rmiss_null =  ( rmiss_wait_state    & thrx_is_null   ) | 
                           // ( rmiss_wait_state    & agc_tg_or_v_err_p) |
                           ( dmiss_wait_state    & (thrx_is_null | agc_redirect_bf)) | 
                           ( thrx_is_dupmiss     & agc_redirect_bf) |
                           ( no_new_miss_state   & thrx_is_null)    | 
                           ( can_miss_wait_state & thrx_is_null)    |
                             reset_dmiss_f                         |
                             inv_req_ack_ff                         |
                             rmiss_null_state                       |                             
                             tsm_ifill_done_bf ;
assign leave_rmiss_null =  ((ftu_agc_cmiss_c | inv_req_c) & ~tsm_ifill_done_bf & ~tsm_no_new_miss) ;
assign next_rmill_null_ = ~(go_to_rmiss_null & ~leave_rmiss_null) ;

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 rmiss_null_reg_l  (
 .scan_in(rmiss_null_reg_l_scanin),
 .scan_out(rmiss_null_reg_l_scanout),
 .l1clk( l1clk ),
 .din  (next_rmill_null_),
 .dout (rmiss_null_state_),
  .siclk(siclk),
  .soclk(soclk));

assign rmiss_null_state = ~rmiss_null_state_ ;
////////////////////////////////////////////////////////
// Real_Miss_Wait state: rmiss_wait_state             //
////////////////////////////////////////////////////////
assign go_to_rmiss_wait = (ftu_agc_cmiss_c & rmiss_null_state & ~tsm_no_new_miss) | 
                           rmiss_wait_state;
// assign leave_rmiss_wait = (agc_redirect_bf | data_ready | (rmiss_wait_state & thrx_is_null) | thrx_is_dupmiss | agc_tg_or_v_err_p );
assign leave_rmiss_wait = (agc_redirect_bf | data_ready | (rmiss_wait_state & thrx_is_null) | thrx_is_dupmiss ) ; // | agc_tg_or_v_err_p );
assign next_rmiss_wait  =  go_to_rmiss_wait & ~leave_rmiss_wait ; 

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 rmiss_wait_reg  (
 .scan_in(rmiss_wait_reg_scanin),
 .scan_out(rmiss_wait_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_rmiss_wait),
 .dout (rmiss_wait_state),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////////////
// No_New_Miss state: no_new_miss_state               //
// NOTE: we do not want to leave no_new_miss_state    //
// even when we go to can_miss_wait_state because it  //
// possible to get flush before the data comes for    //
// the original miss. In that case we simply reset    //
// can_miss_wait_state and we are ready to fetch again//
////////////////////////////////////////////////////////
assign go_to_no_new_miss = (rmiss_wait_state & agc_redirect_bf & ~thrx_is_null & ~thrx_is_dupmiss) | 
                            no_new_miss_state;
assign leave_no_new_miss =  tsm_ifill_done_bf | thrx_is_null  ; 
assign next_no_new_miss  = go_to_no_new_miss & ~leave_no_new_miss ;

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 no_new_miss_reg  (
 .scan_in(no_new_miss_reg_scanin),
 .scan_out(no_new_miss_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_no_new_miss),
 .dout (no_new_miss_state),
  .siclk(siclk),
  .soclk(soclk));

assign tsm_no_new_miss = no_new_miss_state |  tsm_lsu_no_ic_miss_state ;


//////////////////////////////////////////////////////////
// LSU no new_miss state. LSU needs to delay new misses //
//////////////////////////////////////////////////////////
assign go_to_lsu_ic_miss = agc_lsu_no_ic_miss ;

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 lsu_no_ic_miss_reg  (
 .scan_in(lsu_no_ic_miss_reg_scanin),
 .scan_out(lsu_no_ic_miss_reg_scanout),
 .l1clk( l1clk ),
 .din  (go_to_lsu_ic_miss),
 .dout (tsm_lsu_no_ic_miss_state),
  .siclk(siclk),
  .soclk(soclk));


/////////////////////////////////////////////////////////
// Stop fetch if lsu can not handle new miss and we    //
// detect new miss.                                    //
/////////////////////////////////////////////////////////
assign go_to_lsu_wait = (tsm_lsu_no_ic_miss_state & ftu_agc_cmiss_c) | 
                         tsm_lsu_wait_state ;
assign leave_lsu_wait = ~agc_lsu_no_ic_miss ; // | agc_tg_or_v_err_p;
assign next_lsu_wait  = go_to_lsu_wait & ~leave_lsu_wait ;

ifu_ftu_tsm_ctl_msff_ctl_macro__width_2 lsu_stops_fetch_reg  (
 .scan_in(lsu_stops_fetch_reg_scanin),
 .scan_out(lsu_stops_fetch_reg_scanout),
 .l1clk( l1clk ),
 .din  ({next_lsu_wait, cmu_inv_req_ack}),
 .dout ({tsm_lsu_wait_state,inv_req_ack_ff}),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////////////////////////////
// Stop fetch if parity eeror is dtetcted and INV is   // 
// requested from L2. Wait for inv ack.                //
/////////////////////////////////////////////////////////
assign go_to_inv_wait = (inv_req_c & rmiss_null_state & ~tsm_no_new_miss) | 
                         tsm_inv_wait_state ;
assign leave_inv_wait = inv_req_ack_ff  ;
assign next_inv_wait  = go_to_inv_wait & ~leave_inv_wait ;

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 inv_stops_fetch_reg  (
 .scan_in(inv_stops_fetch_reg_scanin),
 .scan_out(inv_stops_fetch_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_inv_wait),
 .dout (tsm_inv_wait_state),
  .siclk(siclk),
  .soclk(soclk));

//  Canceled_Miss_refill: can_miss_refill_state       //
////////////////////////////////////////////////////////
assign go_to_can_miss_refill = (no_new_miss_state & ftu_agc_cmiss_c & ~thrx_is_null) |
                              can_miss_refill_state ; 
assign leave_can_miss_refill = tsm_ifill_done_bf  | thrx_is_null ; // | agc_tg_or_v_err_p;
assign next_can_miss_refill  = go_to_can_miss_refill & ~leave_can_miss_refill ;

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 can_miss_refill_reg  (
 .scan_in(can_miss_refill_reg_scanin),
 .scan_out(can_miss_refill_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_can_miss_refill),
 .dout (can_miss_refill_state),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////////////
//  Canceled_Miss_Wait: can_miss_wait_state           //
////////////////////////////////////////////////////////
assign go_to_can_miss_wait = (no_new_miss_state & ftu_agc_cmiss_c & ~thrx_is_null) |
                              can_miss_wait_state ; 
assign leave_can_miss_wait = tsm_ifill_done_bf | agc_redirect_bf  | thrx_is_null ; // | agc_tg_or_v_err_p;
assign next_can_miss_wait  = go_to_can_miss_wait & ~leave_can_miss_wait ;

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 can_miss_wait_reg  (
 .scan_in(can_miss_wait_reg_scanin),
 .scan_out(can_miss_wait_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_can_miss_wait),
 .dout (can_miss_wait_state),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////////////
// Fill_rdy0 state :                                  //
////////////////////////////////////////////////////////
assign go_to_fill_rdy0 = (data_ready & (rmiss_wait_state |
                          no_new_miss_state  | can_miss_refill_state));
assign leave_fill_rdy0 = fill_rdy0_state ; 
assign next_fill_rdy0  = go_to_fill_rdy0 & ~leave_fill_rdy0 ;
 
ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 fill_rdy0_reg  (
 .scan_in(fill_rdy0_reg_scanin),
 .scan_out(fill_rdy0_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_fill_rdy0),
 .dout (fill_rdy0_state),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////////////
// Fill_rdy1 state :                                  //
////////////////////////////////////////////////////////
// assign go_to_fill_rdy1 = fill_rdy0_state ;
// assign leave_fill_rdy1 = fill_rdy1_state ; 
// assign next_fill_rdy1  = go_to_fill_rdy1 & ~leave_fill_rdy1 ;
 
// msff_ctl_macro fill_rdy1_reg (width=1) (
//  .scan_in(fill_rdy1_reg_scanin),
//  .scan_out(fill_rdy1_reg_scanout),
//  .l1clk( l1clk ),
//  .din  (next_fill_rdy1),
//  .dout (fill_rdy1_state));

/////////////////////////////////////////////////////////
// asi read wait                                       //
//  when asi_request comes stop all threads to gain    //
//  access to the arrays. The only thing that may delay//
//  the access is writes to the Icache caused by fill  // 
/////////////////////////////////////////////////////////
assign go_to_asi_rd_wait = (asi_rd_request ) | 
                         tsm_asi_rd_wait_state ;
assign leave_asi_rd_wait = ftp_asi_rd_done  ; 
assign next_asi_rd_wait  = go_to_asi_rd_wait & ~leave_asi_rd_wait ;

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 asi_rd_stops_fetch_reg  (
 .scan_in(asi_rd_stops_fetch_reg_scanin),
 .scan_out(asi_rd_stops_fetch_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_asi_rd_wait),
 .dout (tsm_asi_rd_wait_state),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////////////////////////////
// asi write wait                                      //
//  when asi_request comes stop all threads to gain    //
//  access to the arrays. The only thing that may delay//
//  the access is writes to the Icache caused by fill  // 
/////////////////////////////////////////////////////////
assign go_to_asi_wr_wait = (asi_wr_request ) | 
                         tsm_asi_wr_wait_state ;
assign leave_asi_wr_wait = ftp_asi_wr_done  ; 
assign next_asi_wr_wait  = go_to_asi_wr_wait & ~leave_asi_wr_wait ;

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 asi_wr_stops_fetch_reg  (
 .scan_in(asi_wr_stops_fetch_reg_scanin),
 .scan_out(asi_wr_stops_fetch_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_asi_wr_wait),
 .dout (tsm_asi_wr_wait_state),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// second state machine is activated if the thread is // 
// waiting on a duplicate miss.                       // 
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// Duplicate_Miss_Wait state: dmiss_wait_state        //
////////////////////////////////////////////////////////
assign go_to_dmiss_wait = (rmiss_wait_state & thrx_is_dupmiss ) | 
                           dmiss_wait_state;
assign leave_dmiss_wait = (agc_redirect_bf | reset_dmiss_f | thrx_is_null); 
assign next_dmiss_wait  =  go_to_dmiss_wait & ~leave_dmiss_wait ; 

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 dmiss_wait_reg  (
 .scan_in(dmiss_wait_reg_scanin),
 .scan_out(dmiss_wait_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_dmiss_wait),
 .dout (dmiss_wait_state),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 reset_dmiss_reg  (
 .scan_in(reset_dmiss_reg_scanin),
 .scan_out(reset_dmiss_reg_scanout),
 .l1clk( l1clk ),
 .din  (reset_dmiss_bf),
 .dout (reset_dmiss_f),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// Third state machine is activated if the thread is  // 
// waiting on a cache line being filled by an other   //
// thread.                                            // 
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// Fill_Wait state: fill_wait_state                   //
////////////////////////////////////////////////////////
assign go_to_fill_wait =  cmu_any_data_ready | fill_wait_state;
assign leave_fill_wait =  ftp_reset_fill_wait & ~cmu_any_data_ready; 
assign next_fill_wait  =  go_to_fill_wait & ~leave_fill_wait ; 

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 fill_wait_reg  (
 .scan_in(fill_wait_reg_scanin),
 .scan_out(fill_wait_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_fill_wait),
 .dout (fill_wait_state),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// Fourth state machine is activated if the thread is // 
// waiting on a ITLB miss.                            // 
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// Fill_Wait state: itlb_miss_wait_state              //
////////////////////////////////////////////////////////
assign go_to_itlb_miss_wait =  itb_miss_c | itlb_miss_wait_state;
assign leave_itlb_miss_wait =  agc_redirect_bf ; 
assign next_itlb_miss_wait  =  go_to_itlb_miss_wait & ~leave_itlb_miss_wait ; 

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 itlb_miss_wait_reg  (
 .scan_in(itlb_miss_wait_reg_scanin),
 .scan_out(itlb_miss_wait_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_itlb_miss_wait),
 .dout (itlb_miss_wait_state),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// err_wait state: err_wait_state                     //
////////////////////////////////////////////////////////
assign go_to_err_wait       =  err_detect_c | err_wait_state;
assign leave_err_wait       =  agc_redirect_bf ; 
assign next_err_wait        =  go_to_err_wait & ~leave_err_wait ; 

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 err_wait_reg  (
 .scan_in(err_wait_reg_scanin),
 .scan_out(err_wait_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_err_wait),
 .dout (err_wait_state),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// Fifth  state machine is activated if the thread    // 
// does not have room for 3 more instructions.        // 
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// Fill_Wait state: no_room_wait_state                //
////////////////////////////////////////////////////////
assign go_to_no_room_wait =   ftp_room_is_less_t_3 | no_room_wait_state;
assign leave_no_room_wait =  ~ftp_room_is_less_t_3 ; 
assign next_no_room_wait  =  go_to_no_room_wait & ~leave_no_room_wait ; 

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 no_room_wait_reg  (
 .scan_in(no_room_wait_reg_scanin),
 .scan_out(no_room_wait_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_no_room_wait),
 .dout (no_room_wait_state),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// sixth  state machine is activated whenever a ITLB  //
// write is requested by TLU.                         //  
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
// Itlb_Demap state: itlb_demap_state                 //
////////////////////////////////////////////////////////
assign go_to_itlb_demap =   itc_demap_next ;
assign leave_itlb_demap =   itlb_demap_state ; 
assign next_itlb_demap  =  go_to_itlb_demap & ~leave_itlb_demap ; 

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 itlb_demap_reg  (
 .scan_in(itlb_demap_reg_scanin),
 .scan_out(itlb_demap_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_itlb_demap),
 .dout (itlb_demap_state),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////////////
// Itlb_write state: itlb_write_state                 //
////////////////////////////////////////////////////////
assign go_to_itlb_write =   itlb_demap_state ;
assign leave_itlb_write =   itlb_write_state ; 
assign next_itlb_write  =  go_to_itlb_write & ~leave_itlb_write ; 

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 itlb_write_reg  (
 .scan_in(itlb_write_reg_scanin),
 .scan_out(itlb_write_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_itlb_write),
 .dout (itlb_write_state),
  .siclk(siclk),
  .soclk(soclk));

// assign itlb_miss_write_done = itlb_write_state ;
//////////////////////////////////////////////////////////
// TLU flush causes the thread to wait until TLU redirection
/////////////////////////////////////////////////////////
ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 flush_ifu_reg  (
 .scan_in(flush_ifu_reg_scanin),
 .scan_out(flush_ifu_reg_scanout),
 .l1clk( l1clk ),
 .din  (tlu_flush_thrx_ifu),
 .dout (tlu_flush_thrx_ifu_d),
  .siclk(siclk),
  .soclk(soclk));

assign go_to_tlu_redr = tlu_flush_thrx_ifu_d | tsm_tlu_redr_wait_state  ; 
assign leave_tlu_redr = agc_tlu_redirect_bf   ; 
assign next_tlu_redr_wait  = go_to_tlu_redr & ~leave_tlu_redr ;

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 tlu_red_reg  (
 .scan_in(tlu_red_reg_scanin),
 .scan_out(tlu_red_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_tlu_redr_wait),
 .dout (tsm_tlu_redr_wait_state),
  .siclk(siclk),
  .soclk(soclk));

assign next_sf_wait = (thrx_go_to_sf_wait | sf_wait_state) & ~agc_tlu_redirect_bf & ~ftu_agc_cmiss_c ;
ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 tlu_sf_reg  (
 .scan_in(tlu_sf_reg_scanin),
 .scan_out(tlu_sf_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_sf_wait),
 .dout (sf_wait_state),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////////////
// Now generate  a cumulative Ready for this thread   //
////////////////////////////////////////////////////////
assign next_thrx_is_ready = ( ~next_rmiss_wait & ~next_can_miss_wait & ~next_itlb_write & ~next_itlb_miss_wait & ~next_err_wait & 
                              ~next_dmiss_wait & ~next_fill_wait & ~next_reset_wait & ~next_itlb_demap & ~next_lsu_wait & ~next_sf_wait &
                              ~next_inv_wait   & ~next_asi_rd_wait  & ~next_asi_wr_wait & ~next_itlb_demap & ~next_tlu_redr_wait) ;
                               // | next_fill_rdy0   | next_fill_rdy1 ; 

// msff_ctl_macro thrx_is_ready_reg (width=1) (
//  .scan_in(thrx_is_ready_reg_scanin),
//  .scan_out(thrx_is_ready_reg_scanout),
//  .l1clk( l1clk ),
//  .din  (next_thrx_is_ready),
//  .dout (thrx_is_ready));


 // assign next_ignore_by_pass = (~next_dmiss_wait & ~next_rmiss_wait) | next_can_miss_refill | next_no_new_miss ;
 assign next_ignore_by_pass = (~next_dmiss_wait & ~rmiss_wait_state) | can_miss_refill_state | next_no_new_miss ;

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 ignore_by_pass_reg  (
 .scan_in(ignore_by_pass_reg_scanin),
 .scan_out(ignore_by_pass_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_ignore_by_pass),
 .dout (tsm_ignore_by_pass),
  .siclk(siclk),
  .soclk(soclk));
      
 
// assign tsm_ready_hp_bf = thrx_is_ready ; // &  ftp_buffer_is_empty;

assign next_ifu_quiesce = (~rmiss_wait_state & ~dmiss_wait_state & 
                                    ~can_miss_wait_state & ~no_new_miss_state) & (tsm_tlu_redr_wait_state |
                                     (next_sf_wait & sf_wait_state)) ;

ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 no_icmiss_pending_reg  (
 .scan_in(no_icmiss_pending_reg_scanin),
 .scan_out(no_icmiss_pending_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_ifu_quiesce),
 .dout (tsm_thrx_ifu_quiesce),
  .siclk(siclk),
  .soclk(soclk));
      
/////////////////////////////////////////////////////////////////////////////////
// assign tsm_ifill_done_bf = leave_fill_rdy0 ; 
// Delay fill done for one cycle so that any fetches still in progress which
// match the current fill will have a chance to be flagged as duplicate in
// the CMU. Otherwise we have to compare the current fetch in C (about to 
// miss) to what is being written and if they match kill the miss.
/////////////////////////////////////////////////////////////////////////////////
ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 ifill_done_reg  (
 .scan_in(ifill_done_reg_scanin),
 .scan_out(ifill_done_reg_scanout),
 .l1clk( l1clk ),
 .din  (leave_fill_rdy0),
 .dout (tsm_ifill_done_bf),
  .siclk(siclk),
  .soclk(soclk));

assign tsm_fill_rdy0 = fill_rdy0_state ;

///////////////////////////////////////////////////////////////////////
// Spare circuits                                                    //
///////////////////////////////////////////////////////////////////////
ifu_ftu_tsm_ctl_spare_ctl_macro__num_1 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);




// assign tsm_fill_rdy1 = fill_rdy1_state ; 
supply0 vss;
supply1 vdd;
// fixscan start:
assign reset_wait_reg_scanin     = scan_in                  ;
assign rmiss_null_reg_l_scanin   = reset_wait_reg_scanout   ;
assign rmiss_wait_reg_scanin     = rmiss_null_reg_l_scanout ;
assign no_new_miss_reg_scanin    = rmiss_wait_reg_scanout   ;
assign lsu_no_ic_miss_reg_scanin = no_new_miss_reg_scanout  ;
assign lsu_stops_fetch_reg_scanin = lsu_no_ic_miss_reg_scanout;
assign inv_stops_fetch_reg_scanin = lsu_stops_fetch_reg_scanout;
assign can_miss_refill_reg_scanin = inv_stops_fetch_reg_scanout;
assign can_miss_wait_reg_scanin  = can_miss_refill_reg_scanout;
assign fill_rdy0_reg_scanin      = can_miss_wait_reg_scanout;
assign asi_rd_stops_fetch_reg_scanin = fill_rdy0_reg_scanout    ;
assign asi_wr_stops_fetch_reg_scanin = asi_rd_stops_fetch_reg_scanout;
assign dmiss_wait_reg_scanin     = asi_wr_stops_fetch_reg_scanout;
assign reset_dmiss_reg_scanin    = dmiss_wait_reg_scanout   ;
assign fill_wait_reg_scanin      = reset_dmiss_reg_scanout  ;
assign itlb_miss_wait_reg_scanin = fill_wait_reg_scanout    ;
assign err_wait_reg_scanin       = itlb_miss_wait_reg_scanout;
assign no_room_wait_reg_scanin   = err_wait_reg_scanout     ;
assign itlb_demap_reg_scanin     = no_room_wait_reg_scanout ;
assign itlb_write_reg_scanin     = itlb_demap_reg_scanout   ;
assign flush_ifu_reg_scanin      = itlb_write_reg_scanout   ;
assign tlu_red_reg_scanin        = flush_ifu_reg_scanout    ;
assign tlu_sf_reg_scanin         = tlu_red_reg_scanout      ;
assign ignore_by_pass_reg_scanin = tlu_sf_reg_scanout       ;
assign no_icmiss_pending_reg_scanin = ignore_by_pass_reg_scanout;
assign ifill_done_reg_scanin     = no_icmiss_pending_reg_scanout;
assign spares_scanin             = ifill_done_reg_scanout   ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module ifu_ftu_tsm_ctl_msff_ctl_macro__width_1 (
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

module ifu_ftu_tsm_ctl_msff_ctl_macro__width_2 (
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


module ifu_ftu_tsm_ctl_spare_ctl_macro__num_1 (
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

