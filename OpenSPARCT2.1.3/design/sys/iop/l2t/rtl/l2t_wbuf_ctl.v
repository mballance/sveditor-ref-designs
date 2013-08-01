// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_wbuf_ctl.v
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
module l2t_wbuf_ctl (
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  scan_in, 
  scan_out, 
  l2clk, 
  wmr_l, 
  vlddir_dirty_evict_c3, 
  arbdec_arbdp_inst_fb_c2, 
  misbuf_wbuf_mbid_c4, 
  misbuf_hit_c4, 
  misbuf_filbuf_mcu_pick, 
  csr_l2_bypass_mode_on, 
  wb_cam_match_c2, 
  wbuf_wbtag_write_wl_c4, 
  wbuf_wbtag_write_en_c4, 
  wbuf_wb_read_wl, 
  wbuf_wb_read_en, 
  wbuf_wbufrpt_leave_state0, 
  arbadr_c1_addr_eq_wb_c4, 
  arb_wbuf_hit_off_c1, 
  arb_wbuf_inst_vld_c2, 
  mcu_l2t_wr_ack, 
  l2t_l2b_wbwr_wl_c6, 
  l2t_l2b_wbwr_wen_c6, 
  l2t_l2b_wbrd_wl_r0, 
  l2t_l2b_ev_dword_r0, 
  l2t_l2b_evict_en_r0, 
  l2t_mcu_wr_req, 
  wbuf_hit_unqual_c2, 
  wbuf_misbuf_dep_rdy_en, 
  wbuf_misbuf_dep_mbid, 
  wbuf_arb_full_px1, 
  wbuf_rdmat_read_wl, 
  wbuf_rdmat_read_en, 
  rdmat_pick_vec, 
  rdmat_or_rdmat_valid, 
  wbuf_wr_addr_sel, 
  wbuf_wb_or_rdma_wr_req_en, 
  l2t_l2b_rdma_rdwl_r0, 
  wbuf_reset_rdmat_vld, 
  wbuf_set_rdmat_acked, 
  l2t_sii_wib_dequeue, 
  l2t_siu_delay, 
  l2t_dbg_sii_wib_dequeue, 
  l2t_mb2_run, 
  l2t_mb2_rdmatag_rd_en, 
  l2t_mb2_wbtag_wr_en, 
  l2t_mb2_wbtag_rd_en, 
  l2t_mb2_addr, 
  wbuf_wbufrpt_next_state_1, 
  cycle_count_less_than_7_din, 
  mcu_l2t_wr_ack_d1, 
  wb_mbist_cam_hit, 
  wb_mbist_cam_sel);
wire dbginit_l;
wire reset_flop_scanin;
wire reset_flop_scanout;
wire l1clk;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire spares_scanin;
wire spares_scanout;
wire arb_wbuf_inst_vld_c3;
wire ff_arb_wbuf_inst_vld_c3_scanin;
wire ff_arb_wbuf_inst_vld_c3_scanout;
wire arbdec_arbdp_inst_fb_c3;
wire ff_arbdp_inst_fb_c3_scanin;
wire ff_arbdp_inst_fb_c3_scanout;
wire arb_wbuf_hit_off_c2;
wire ff_arb_wbuf_hit_off_c2_scanin;
wire ff_arb_wbuf_hit_off_c2_scanout;
wire ff_mcu_l2t_wr_ack_d1_scanin;
wire ff_mcu_l2t_wr_ack_d1_scanout;
wire [7:0] wbuf_wbtag_write_wl_c4_fnl;
wire [7:0] mbist_wbuf_wr_ptr;
wire [2:0] l2t_mb2_addr_r3;
wire l2t_mb2_rdmatag_rd_en_r1;
wire l2t_mb2_rdmatag_rd_en_r2;
wire l2t_mb2_wbtag_rd_en_r1;
wire l2t_mb2_wbtag_rd_en_r2;
wire [2:0] l2t_mb2_addr_r1;
wire [2:0] l2t_mb2_addr_r2;
wire ff_l2t_mb2_run_r1_scanin;
wire ff_l2t_mb2_run_r1_scanout;
wire l2t_mb2_rdmatag_rd_en_r3;
wire l2t_mb2_wbtag_rd_en_r3;
wire l2t_mb2_run_r1;
wire ff_wbtag_write_wl_c5_scanin;
wire ff_wbtag_write_wl_c5_scanout;
wire ff_enc_write_wl_c52_scanin;
wire ff_enc_write_wl_c52_scanout;
wire ff_enc_write_wl_c6_scanin;
wire ff_enc_write_wl_c6_scanout;
wire l2_bypass_mode_on_d1;
wire ff_l2_bypass_mode_on_d1_scanin;
wire ff_l2_bypass_mode_on_d1_scanout;
wire wbtag_write_en_c3_fnl;
wire l2t_mb2_wbtag_wr_en_r2;
wire l2t_mb2_wbtag_wr_en_r1;
wire ff_wbtag_write_en_c4_scanin;
wire ff_wbtag_write_en_c4_scanout;
wire wbtag_write_we_c5;
wire ff_wbtag_write_we_c5_scanin;
wire ff_wbtag_write_we_c5_scanout;
wire wbtag_write_we_c52;
wire ff_wbtag_write_we_c52_scanin;
wire ff_wbtag_write_we_c52_scanout;
wire wbtag_write_we_c6;
wire ff_wbtag_write_we_c6_scanin;
wire ff_wbtag_write_we_c6_scanout;
wire ff_wb_valid_scanin;
wire ff_wb_valid_scanout;
wire ff_wb_acked_scanin;
wire ff_wb_acked_scanout;
wire ff_bypass_en_c2_scanin;
wire ff_bypass_en_c2_scanout;
wire [7:0] wb_cam_match_c2_d1;
wire wb_mbist_cam_sel_r1;
wire ff_wb_cam_match_c2_scanin;
wire ff_wb_cam_match_c2_scanout;
wire wb_mbist_cam_hit_unreg;
wire ff_wb_cam_hit_vec_c3_scanin;
wire ff_wb_cam_hit_vec_c3_scanout;
wire ff_wb_cam_hit_vec_c4_scanin;
wire ff_wb_cam_hit_vec_c4_scanout;
wire ff_wbuf_hit_qual_c3_scanin;
wire ff_wbuf_hit_qual_c3_scanout;
wire ff_wbuf_hit_qual_c4_scanin;
wire ff_wbuf_hit_qual_c4_scanout;
wire ff_mbid0_scanin;
wire ff_mbid0_scanout;
wire ff_mbid1_scanin;
wire ff_mbid1_scanout;
wire ff_mbid2_scanin;
wire ff_mbid2_scanout;
wire ff_mbid3_scanin;
wire ff_mbid3_scanout;
wire ff_mbid4_scanin;
wire ff_mbid4_scanout;
wire ff_mbid5_scanin;
wire ff_mbid5_scanout;
wire ff_mbid6_scanin;
wire ff_mbid6_scanout;
wire ff_mbid7_scanin;
wire ff_mbid7_scanout;
wire ff_wb_mbid_vld_scanin;
wire ff_wb_mbid_vld_scanout;
wire ff_or_wb_mbid_vld_scanin;
wire ff_or_wb_mbid_vld_scanout;
wire ff_state_scanin;
wire ff_state_scanout;
wire ff_mcu_req_pending_scanin;
wire ff_mcu_req_pending_scanout;
wire ff_cycle_count_scanin;
wire ff_cycle_count_scanout;
wire [3:0] l2t_rdma_rd_ptr;
wire ff_latched_wb_read_wl_scanin;
wire ff_latched_wb_read_wl_scanout;
wire ff_latched_wb_read_en_scanin;
wire ff_latched_wb_read_en_scanout;
wire [1:0] l2t_l2b_rdma_rdwl_r0_prev;
wire ff_l2t_l2b_rdma_rdwl_r0_scanin;
wire ff_l2t_l2b_rdma_rdwl_r0_scanout;
wire ff_latched_rdmad_read_wl_scanin;
wire ff_latched_rdmad_read_wl_scanout;
wire ff_latched_rdma_read_en_scanin;
wire ff_latched_rdma_read_en_scanout;
wire ff_wbuf_wr_addr_sel_scanin;
wire ff_wbuf_wr_addr_sel_scanout;
wire ff_wb_or_rdma_wr_req_en_scanin;
wire ff_wb_or_rdma_wr_req_en_scanout;
wire ff_l2t_mcu_wr_req_scanin;
wire ff_l2t_mcu_wr_req_scanout;
wire [2:0] l2t_l2b_wbrd_wl_r0_prev;
wire ff_l2t_l2b_wbrd_wl_r0_scanin;
wire ff_l2t_l2b_wbrd_wl_r0_scanout;
wire cycle_count_less_than_7;
wire l2t_l2b_evict_en_r0_d1_unused;
wire ff_l2t_l2b_evict_en_r0_d1_scanin;
wire ff_l2t_l2b_evict_en_r0_d1_scanout;
wire ff_cycle_count_in_scanin;
wire ff_cycle_count_in_scanout;
wire l2t_sii_wib_dequeue_raw;
wire ff_l2t_sii_wib_dequeue_scanin;
wire ff_l2t_sii_wib_dequeue_scanout;
wire l2t_sii_wib_dequeue_delay;
wire ff_l2t_sii_wib_dequeue_delay_scanin;
wire ff_l2t_sii_wib_dequeue_delay_scanout;
wire ff_l2t_dbg_sii_wib_dequeue_scanin;
wire ff_l2t_dbg_sii_wib_dequeue_scanout;
wire ff_quad_state_scanin;
wire ff_quad_state_scanout;
wire ff_quad0_state_scanin;
wire ff_quad0_state_scanout;
wire ff_quad1_state_scanin;
wire ff_quad1_state_scanout;
wire ff_quad2_state_scanin;
wire ff_quad2_state_scanout;
wire ff_wb_count_scanin;
wire ff_wb_count_scanout;
wire ff_wbuf_arb_full_px1_scanin;
wire ff_wbuf_arb_full_px1_scanout;
 

 input tcu_pce_ov;
 input tcu_aclk;
 input tcu_bclk;
 input tcu_scan_en;
 
input scan_in;
output scan_out; 
input           l2clk; 
input           wmr_l; 
 
input           vlddir_dirty_evict_c3; 
// This indicates that the Tag of the instruction evicted 
// (i.e. lru_tag_c3) needs to written into the WB tag array. 
 
input           arbdec_arbdp_inst_fb_c2; 
 
 
input   [4:0]   misbuf_wbuf_mbid_c4;  // BS & SR 11/04/03, MB grows to 32
input           misbuf_hit_c4; 
input           misbuf_filbuf_mcu_pick; 
 
 
// from csr 
input           csr_l2_bypass_mode_on; 
 
 
// from wbtag 
input   [7:0]   wb_cam_match_c2; 
output  [7:0]   wbuf_wbtag_write_wl_c4;      // tag wr wl. Tag is written in C4 PH1 
output          wbuf_wbtag_write_en_c4;      // tag wren Tag is written in C4 PH1 
output  [7:0]   wbuf_wb_read_wl; 
output          wbuf_wb_read_en; // look at read pipeline 
output		wbuf_wbufrpt_leave_state0;
 
 
// from arbaddr 
input		arbadr_c1_addr_eq_wb_c4; 
 
// from arb. 
input           arb_wbuf_hit_off_c1; // hit qualifier. 
input           arb_wbuf_inst_vld_c2; 
 
 
input           mcu_l2t_wr_ack; 
 
 
output  [2:0]   l2t_l2b_wbwr_wl_c6;  // must come out of a flop 
output  [3:0]   l2t_l2b_wbwr_wen_c6; // must come out of a flop. 3:0 are the same 
output  [2:0]   l2t_l2b_wbrd_wl_r0; 
//output          l2t_l2b_wbrd_en_r0; 
output  [2:0]   l2t_l2b_ev_dword_r0; 
output          l2t_l2b_evict_en_r0; 
 
 
output          l2t_mcu_wr_req; 
 
 
// to arbaddr 
 
// to misbuf. 
output          wbuf_hit_unqual_c2; // hit not qualified with instruction valid. 
output          wbuf_misbuf_dep_rdy_en; 
output  [4:0]   wbuf_misbuf_dep_mbid; // // BS & SR 11/04/03, MB grows to 32
 
 
// to arb. 
output          wbuf_arb_full_px1; 
// Can accomodate two more instructions 
// This signal should come out of a flop 
 
 
output	[3:0]	wbuf_rdmat_read_wl; 
output		wbuf_rdmat_read_en; 
 
input	[3:0]	rdmat_pick_vec ; // from rdmat. 
input		rdmat_or_rdmat_valid ; 
 
output          wbuf_wr_addr_sel; 
output		wbuf_wb_or_rdma_wr_req_en; // to evctag 
 
output  [1:0]   l2t_l2b_rdma_rdwl_r0; 
//output          l2t_l2b_rdma_rden_r0; 
 
// rdmat 
output	[3:0]	wbuf_reset_rdmat_vld; 
output	[3:0]	wbuf_set_rdmat_acked; 
 
// to siu 
output	l2t_sii_wib_dequeue; 
input		l2t_siu_delay;
// to debug
output          l2t_dbg_sii_wib_dequeue;

// mbist
input		l2t_mb2_run;
input		l2t_mb2_rdmatag_rd_en;
input		l2t_mb2_wbtag_wr_en;
input		l2t_mb2_wbtag_rd_en;
input	[2:0]	l2t_mb2_addr;

output 		wbuf_wbufrpt_next_state_1;
output	   	cycle_count_less_than_7_din;	
output	   	mcu_l2t_wr_ack_d1;	
output		wb_mbist_cam_hit;
input		wb_mbist_cam_sel;
//////////////////////////////////////////////////////////////////////////////// 
wire            mcu_l2t_wr_ack_d1; 
 
wire    [7:0]   wb_valid_in; 
wire    [7:0]   wb_valid; 
wire            or_wb_valid; 
 
wire    [2:0]   enc_write_wl_c5, enc_write_wl_c52; // BS 03/11/04 extra cycle for mem access 
wire    [2:0]   enc_write_wl_c6; 
 
wire    [7:0]   wb_cam_hit_vec_c2; 
wire    [7:0]   wb_cam_hit_vec_c3; 
wire    [7:0]   wb_cam_hit_vec_c4; 
wire            wbuf_hit_unqual_c2; 
wire            wbuf_hit_qual_c2; 
wire            wbuf_hit_qual_c3; 
wire            wbuf_hit_qual_c4; 
 
wire    [7:0]   set_wb_valid; 
wire    [7:0]   reset_wb_valid; 
 
wire    [7:0]   set_wb_acked; 
wire    [7:0]   wb_acked_in; 
wire    [7:0]   wb_acked; 
 
wire            mbid_wr_en; 
wire    [7:0]   sel_insert_mbid_c4; 
wire    [4:0]   mbid0;  // BS & SR 11/04/03, MB grows to 32
wire    [4:0]   mbid1;  // BS & SR 11/04/03, MB grows to 32
wire    [4:0]   mbid2;  // BS & SR 11/04/03, MB grows to 32
wire    [4:0]   mbid3;  // BS & SR 11/04/03, MB grows to 32
wire    [4:0]   mbid4;  // BS & SR 11/04/03, MB grows to 32
wire    [4:0]   mbid5;  // BS & SR 11/04/03, MB grows to 32
wire    [4:0]   mbid6;  // BS & SR 11/04/03, MB grows to 32
wire    [4:0]   mbid7;  // BS & SR 11/04/03, MB grows to 32
 
wire    [7:0]   wb_mbid_vld_in; 
wire    [7:0]   wb_mbid_vld; 
wire            or_wb_mbid_vld_in; 
wire            or_wb_mbid_vld; 
 
wire    [7:0]   sel_mbid; 
wire            sel_default_mux1; 
wire            sel_default_mux2; 
wire            sel_default_mbentry; 
wire    [4:0]   sel_mbid3t0; // BS & SR 11/04/03, MB grows to 32
wire    [4:0]   sel_mbid7t4; // BS & SR 11/04/03, MB grows to 32
wire    [4:0]   sel_mbid7t0; // BS & SR 11/04/03, MB grows to 32
 
wire            can_req_mcu; 
wire            enter_state0; 
wire            leave_state0; 
wire            enter_state1; 
wire            leave_state1; 
wire            enter_state2; 
wire            leave_state2; 
wire    [2:0]   next_state; 
wire    [2:0]   state; 
wire            mcu_req_pending_in; 
wire            mcu_req_pending; 
wire            inc_cycle_count; 
wire    [3:0]   cycle_count_plus1; 
wire    [3:0]   next_cycle_count; 
wire    [3:0]   cycle_count_in; 
wire    [3:0]   cycle_count; 
wire            l2t_l2b_evict_en_r0_d1; 
 
 
wire            init_pick_state; 
wire            sel_lshift_quad; 
wire            sel_same_quad; 
wire    [2:0]   lshift_quad_state; 
wire    [2:0]   quad_state_in; 
wire    [2:0]   quad_state; 
 
wire            sel_lshift_quad0; 
wire            sel_same_quad0; 
wire    [3:0]   lshift_quad0_state; 
wire    [3:0]   quad0_state_in; 
wire    [3:0]   quad0_state; 
 
wire            sel_lshift_quad1; 
wire            sel_same_quad1; 
wire    [3:0]   lshift_quad1_state; 
wire    [3:0]   quad1_state_in; 
wire    [3:0]   quad1_state; 
 
wire            sel_lshift_quad2; 
wire            sel_same_quad2; 
wire    [3:0]   lshift_quad2_state; 
wire    [3:0]   quad2_state_in; 
wire    [3:0]   quad2_state; 
 
wire    [3:0]   pick_quad0_sel; 
wire    [3:0]   pick_quad1_sel; 
wire    [3:0]   pick_quad2_sel; 
 
wire    [2:0]   pick_quad_sel; 
 
wire    [3:0]   pick_quad0_in; 
wire    [3:0]   pick_quad1_in; 
wire    [3:0]   pick_quad2_in; 
 
wire    [2:0]   pick_quad_in; 
 
wire    [7:0]   pick_wb_read_wl; 
wire	[3:0]	pick_rdmat_read_wl ; 
wire    [7:0]   latched_wb_read_wl; 
wire	[3:0]	latched_rdmad_read_wl; 
wire	latched_rdma_read_en, latched_wb_read_en ; 
 
wire    [3:0]   wb_count; 
wire    [3:0]   next_wb_count; 
wire    [3:0]   wb_count_plus1; 
wire    [3:0]   wb_count_minus1; 
wire            inc_wb_count; 
wire            dec_wb_count; 
wire            same_wb_count; 
wire            wb_count_5; 
wire            wb_count_5_plus; 
wire            wbuf_arb_full_px1_in; 
wire	l2t_sii_wib_dequeue_prev; 
 
wire	[7:0]	wbtag_write_wl_c5; 
wire	bypass_en_c1, bypass_en_c2; 
wire	bypass_hit_en_c2; 
wire	[7:0]	wb_cam_hit_vec_tmp_c2; 
wire	wbtag_write_en_c3; 
 
wire            dbb_rst_l; 
wire	[7:0]	sel_mbid_rst; 

assign dbginit_l = 1'b1;

/////////////////////////////////////////////////////////////////// 
 // Reset flop 
 /////////////////////////////////////////////////////////////////// 
 
l2t_wbuf_ctl_msff_ctl_macro__width_1 reset_flop 
				(.dout(dbb_rst_l), 
                                        .scan_in(reset_flop_scanin),
                                        .scan_out(reset_flop_scanout),
                                        .l1clk(l1clk), 
                                        .din(wmr_l),
  .siclk(siclk),
  .soclk(soclk) 
                                         
); 
 


//////////////////////////////////////////////////
// L1 clk header
//////////////////////////////////////////////////
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

l2t_wbuf_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk(l2clk),
        .l1en(1'b1 ),
        .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

//////////////////////////////////////////////////

//////////////////////////////////////////
// Spare gate insertion
//////////////////////////////////////////
l2t_wbuf_ctl_spare_ctl_macro__num_4 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
//////////////////////////////////////////


 
//////////////////////////////////////////////////////////////////////////////// 
 
 
l2t_wbuf_ctl_msff_ctl_macro__width_1 ff_arb_wbuf_inst_vld_c3 
              (.dout   (arb_wbuf_inst_vld_c3), 
               .scan_in(ff_arb_wbuf_inst_vld_c3_scanin),
               .scan_out(ff_arb_wbuf_inst_vld_c3_scanout),
               .din (arb_wbuf_inst_vld_c2), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
l2t_wbuf_ctl_msff_ctl_macro__width_1 ff_arbdp_inst_fb_c3 
              (.dout   (arbdec_arbdp_inst_fb_c3), 
               .scan_in(ff_arbdp_inst_fb_c3_scanin),
               .scan_out(ff_arbdp_inst_fb_c3_scanout),
               .din (arbdec_arbdp_inst_fb_c2), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
l2t_wbuf_ctl_msff_ctl_macro__width_1 ff_arb_wbuf_hit_off_c2 
              (.dout   (arb_wbuf_hit_off_c2), 
               .scan_in(ff_arb_wbuf_hit_off_c2_scanin),
               .scan_out(ff_arb_wbuf_hit_off_c2_scanout),
               .din (arb_wbuf_hit_off_c1), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
l2t_wbuf_ctl_msff_ctl_macro__dmsff_32x__width_1 ff_mcu_l2t_wr_ack_d1 
              (.dout   (mcu_l2t_wr_ack_d1), 
               .scan_in(ff_mcu_l2t_wr_ack_d1_scanin),
               .scan_out(ff_mcu_l2t_wr_ack_d1_scanout),
               .din (mcu_l2t_wr_ack), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              ) ; 

 
 
//////////////////////////////////////////////////////////////////////////////// 
// eviction pipeline. 
//------------------------------------------------------------------------------ 
//    C2      C3            C4              C5            C6              C7 
//------------------------------------------------------------------------------ 
//    lru     dirty         xmit            rd data       rd_data       write 
//    calc.   evict         lru way         array         array.        WB array 
//                                                                      in PH2 
//            xmit 
//            lru way 
// 
//            		   wen and wl    write wtag       xmit 
//            		   generation    array in         wl for write 
//            		   for wbtag.    PH1              and wen. 
//------------------------------------------------------------------------------ 
//////////////////////////////////////////////////////////////////////////////// 

assign  wbuf_wbtag_write_wl_c4_fnl[0] = ~wb_valid[0] ; 
assign  wbuf_wbtag_write_wl_c4_fnl[1] = ~wb_valid[1] &  wb_valid[0] ; 
assign  wbuf_wbtag_write_wl_c4_fnl[2] = ~wb_valid[2] & (&(wb_valid[1:0])) ; 
assign  wbuf_wbtag_write_wl_c4_fnl[3] = ~wb_valid[3] & (&(wb_valid[2:0])) ; 
assign  wbuf_wbtag_write_wl_c4_fnl[4] = ~wb_valid[4] & (&(wb_valid[3:0])) ; 
assign  wbuf_wbtag_write_wl_c4_fnl[5] = ~wb_valid[5] & (&(wb_valid[4:0])) ; 
assign  wbuf_wbtag_write_wl_c4_fnl[6] = ~wb_valid[6] & (&(wb_valid[5:0])) ; 
assign  wbuf_wbtag_write_wl_c4_fnl[7] = ~wb_valid[7] & (&(wb_valid[6:0])) ; 
 

assign mbist_wbuf_wr_ptr[0] = (l2t_mb2_addr_r3[2:0] == 3'b000);
assign mbist_wbuf_wr_ptr[1] = (l2t_mb2_addr_r3[2:0] == 3'b001);
assign mbist_wbuf_wr_ptr[2] = (l2t_mb2_addr_r3[2:0] == 3'b010);
assign mbist_wbuf_wr_ptr[3] = (l2t_mb2_addr_r3[2:0] == 3'b011);
assign mbist_wbuf_wr_ptr[4] = (l2t_mb2_addr_r3[2:0] == 3'b100);
assign mbist_wbuf_wr_ptr[5] = (l2t_mb2_addr_r3[2:0] == 3'b101);
assign mbist_wbuf_wr_ptr[6] = (l2t_mb2_addr_r3[2:0] == 3'b110);
assign mbist_wbuf_wr_ptr[7] = (l2t_mb2_addr_r3[2:0] == 3'b111);



l2t_wbuf_ctl_msff_ctl_macro__width_16 ff_l2t_mb2_run_r1 
       (.din({l2t_mb2_rdmatag_rd_en,l2t_mb2_rdmatag_rd_en_r1,l2t_mb2_rdmatag_rd_en_r2,
		l2t_mb2_wbtag_rd_en,l2t_mb2_wbtag_rd_en_r1,l2t_mb2_wbtag_rd_en_r2,
		 l2t_mb2_addr[2:0],l2t_mb2_addr_r1[2:0],l2t_mb2_addr_r2[2:0],l2t_mb2_run}), 
	.l1clk(l1clk),  
	.scan_in(ff_l2t_mb2_run_r1_scanin),
	.scan_out(ff_l2t_mb2_run_r1_scanout),
	.dout({l2t_mb2_rdmatag_rd_en_r1,l2t_mb2_rdmatag_rd_en_r2,l2t_mb2_rdmatag_rd_en_r3,
		l2t_mb2_wbtag_rd_en_r1,l2t_mb2_wbtag_rd_en_r2,l2t_mb2_wbtag_rd_en_r3,
		l2t_mb2_addr_r1[2:0],l2t_mb2_addr_r2[2:0],l2t_mb2_addr_r3[2:0],l2t_mb2_run_r1}),
  .siclk(siclk),
  .soclk(soclk)  
		); 



assign wbuf_wbtag_write_wl_c4[7:0] = l2t_mb2_run_r1 ? mbist_wbuf_wr_ptr[7:0] :  wbuf_wbtag_write_wl_c4_fnl[7:0] ; 




 
l2t_wbuf_ctl_msff_ctl_macro__width_8 ff_wbtag_write_wl_c5 
              (.dout   (wbtag_write_wl_c5[7:0]), 
               .scan_in(ff_wbtag_write_wl_c5_scanin),
               .scan_out(ff_wbtag_write_wl_c5_scanout),
               .din (wbuf_wbtag_write_wl_c4[7:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
assign  enc_write_wl_c5[0]   = (wbtag_write_wl_c5[1] | wbtag_write_wl_c5[3] | 
                                wbtag_write_wl_c5[5] | wbtag_write_wl_c5[7]) ; 
assign  enc_write_wl_c5[1]   = (wbtag_write_wl_c5[2] | wbtag_write_wl_c5[3] | 
                                wbtag_write_wl_c5[6] | wbtag_write_wl_c5[7]) ; 
assign  enc_write_wl_c5[2]   = (wbtag_write_wl_c5[4] | wbtag_write_wl_c5[5] | 
                                wbtag_write_wl_c5[6] | wbtag_write_wl_c5[7]) ; 

// BS 03/11/04 extra cycle for mem access

l2t_wbuf_ctl_msff_ctl_macro__width_3 ff_enc_write_wl_c52 
              (.dout   (enc_write_wl_c52[2:0]),
               .scan_in(ff_enc_write_wl_c52_scanin),
               .scan_out(ff_enc_write_wl_c52_scanout),
               .din (enc_write_wl_c5[2:0]),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
                

              ) ;

l2t_wbuf_ctl_msff_ctl_macro__width_3 ff_enc_write_wl_c6 
              (.dout   (enc_write_wl_c6[2:0]), 
               .scan_in(ff_enc_write_wl_c6_scanin),
               .scan_out(ff_enc_write_wl_c6_scanout),
               .din (enc_write_wl_c52[2:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
///////////////////////////////////////////////////////////////////////////////// 
// A fill causes the WBB to be written in L2 $ off mode. 
// Here is the pipeline for a Fill in OFF mode. 
// 
// 	C5		C6		C7		C8		C8 
// 
//	read FB		mux		xmit		data		write 
//			with		in l2d	in l2b	WB 
//			$ data. 
// 
//	write		xmit				setup 
//	wbtag		wl and wen			wb write 
//	in PH1		from l2t				en and wl 
// 
///////////////////////////////////////////////////////////////////////////////// 
 
l2t_wbuf_ctl_msff_ctl_macro__width_1 ff_l2_bypass_mode_on_d1 
              (.dout   (l2_bypass_mode_on_d1), 
               .scan_in(ff_l2_bypass_mode_on_d1_scanin),
               .scan_out(ff_l2_bypass_mode_on_d1_scanout),
               .din (csr_l2_bypass_mode_on), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              ) ; 
 
assign  wbtag_write_en_c3_fnl    =  vlddir_dirty_evict_c3 | 
                               (l2_bypass_mode_on_d1 & arbdec_arbdp_inst_fb_c3 & 
                                arb_wbuf_inst_vld_c3) ; 

assign wbtag_write_en_c3 = l2t_mb2_run_r1 ? l2t_mb2_wbtag_wr_en_r2  : wbtag_write_en_c3_fnl;
 
l2t_wbuf_ctl_msff_ctl_macro__width_3 ff_wbtag_write_en_c4 
              (.dout   ({l2t_mb2_wbtag_wr_en_r1,l2t_mb2_wbtag_wr_en_r2,wbuf_wbtag_write_en_c4}), 
               .scan_in(ff_wbtag_write_en_c4_scanin),
               .scan_out(ff_wbtag_write_en_c4_scanout),
               .din ({l2t_mb2_wbtag_wr_en,l2t_mb2_wbtag_wr_en_r1,wbtag_write_en_c3}), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
l2t_wbuf_ctl_msff_ctl_macro__width_1 ff_wbtag_write_we_c5 
              (.dout   (wbtag_write_we_c5), 
               .scan_in(ff_wbtag_write_we_c5_scanin),
               .scan_out(ff_wbtag_write_we_c5_scanout),
               .din (wbuf_wbtag_write_en_c4), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 

// BS 03/11/04 extra cycle for mem access

l2t_wbuf_ctl_msff_ctl_macro__width_1 ff_wbtag_write_we_c52 
              (.dout   (wbtag_write_we_c52),
               .scan_in(ff_wbtag_write_we_c52_scanin),
               .scan_out(ff_wbtag_write_we_c52_scanout),
               .din (wbtag_write_we_c5),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
                

              ) ;

l2t_wbuf_ctl_msff_ctl_macro__width_1 ff_wbtag_write_we_c6 
              (.dout   (wbtag_write_we_c6), 
               .scan_in(ff_wbtag_write_we_c6_scanin),
               .scan_out(ff_wbtag_write_we_c6_scanout),
               .din (wbtag_write_we_c52), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
///////////////////////////////////////////////////////////////////////////////// 
// An eviction causes the WBB to be written in L2 $ ON mode. 
// 
// 	C5		C6		C7			C8		C9 
// 
//	read $		read $ cyc2	xmit data 		xmit		write 
//					inside l2d		to l2b	data into wbb 
//			 
//			 
// 
//	write		xmit wl					setup 
//	wbtag		to wbdata 				wb write 
//	in PH1							en and wl 
// 
// 
// IN OFF mode, the wl and wen are transmitted to l2b in the C6 cycle of  
// a Fill operation. 
// A fill is indicated by arbdec_arbdp_inst_fb_c3 & arb_wbuf_inst_vld_c3 
///////////////////////////////////////////////////////////////////////////////// 
 
assign  l2t_l2b_wbwr_wl_c6[2:0]  = enc_write_wl_c6[2:0] ; 
assign  l2t_l2b_wbwr_wen_c6[3:0] = {4{wbtag_write_we_c6}} ; 
 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// VALID bit 
// Set on insertion. 
// Reset on an eviction to DRAM. 
//////////////////////////////////////////////////////////////////////////////// 
 
 
 
assign  wbuf_reset_rdmat_vld = {4{leave_state2}} & latched_rdmad_read_wl ; 
assign	wbuf_set_rdmat_acked = {4{leave_state1}} & latched_rdmad_read_wl ; 
 
assign  set_wb_valid   = {8{wbtag_write_we_c5}} & wbtag_write_wl_c5 ; 
assign  reset_wb_valid = {8{leave_state2}} & latched_wb_read_wl ; 
assign  wb_valid_in    = (wb_valid | set_wb_valid) & ~(reset_wb_valid) ; 
 
l2t_wbuf_ctl_msff_ctl_macro__clr_1__width_8 ff_wb_valid  // sync reset active low
              (.dout   (wb_valid[7:0]), 
               .scan_in(ff_wb_valid_scanin),
               .scan_out(ff_wb_valid_scanout),
               .din (wb_valid_in[7:0]), 
               .l1clk (l1clk),  .clr(~dbb_rst_l),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
assign  or_wb_valid = |(wb_valid[7:0]) ; 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// ACKED  bit 
// Set when an entry is acked by the DRAM controller. 
// Reset when the valid bit is reset i.e. on an eviction to DRAM. 
//////////////////////////////////////////////////////////////////////////////// 
 
assign  set_wb_acked = ({8{leave_state1}} & latched_wb_read_wl) ; 
assign  wb_acked_in  = (wb_acked | set_wb_acked) & ~reset_wb_valid ; 
 
l2t_wbuf_ctl_msff_ctl_macro__clr_1__width_8 ff_wb_acked  // sync reset active low
              (.dout   (wb_acked[7:0]), 
               .scan_in(ff_wb_acked_scanin),
               .scan_out(ff_wb_acked_scanout),
               .din (wb_acked_in[7:0]), 
               .l1clk (l1clk),  .clr(~dbb_rst_l),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
 
 
/////////////////////////////////////////////// 
// Updated on 11/10/2002 
// bypassing of wb_write_data 
// required for generation 
// of wb hit. 
// evicted tag is written into the WBB in C5. 
// The operation in C2 in that cycle will have 
// to see the effect of the wb write. Hence the 
// C4 address being written into the tag is compared 
// with the address of the instruction in C1. 
////////////////////////////////////////////// 
 
assign	bypass_en_c1 = arbadr_c1_addr_eq_wb_c4 & wbuf_wbtag_write_en_c4; 
 
l2t_wbuf_ctl_msff_ctl_macro__width_1 ff_bypass_en_c2 
              (.dout   (bypass_en_c2), 
               .scan_in(ff_bypass_en_c2_scanin),
               .scan_out(ff_bypass_en_c2_scanout),
               .din (bypass_en_c1), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              ) ; 

l2t_wbuf_ctl_msff_ctl_macro__width_10 ff_wb_cam_match_c2 
              (.dout   ({wb_mbist_cam_hit,wb_cam_match_c2_d1[7:0],wb_mbist_cam_sel_r1}),
               .scan_in(ff_wb_cam_match_c2_scanin),
               .scan_out(ff_wb_cam_match_c2_scanout),
               .din ({wb_mbist_cam_hit_unreg,wb_cam_match_c2[7:0],wb_mbist_cam_sel}),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
              ) ;


assign wb_mbist_cam_hit_unreg = wb_mbist_cam_sel_r1 ? |(wb_cam_match_c2_d1[7:0]) : 1'b0;
 
assign	bypass_hit_en_c2 = ( bypass_en_c2  & ~arb_wbuf_hit_off_c2 ) ; 
 
assign  wb_cam_hit_vec_tmp_c2   = ( (wb_cam_match_c2[7:0] & wb_valid[7:0]) & 
                    ~(wb_acked[7:0] | {8{arb_wbuf_hit_off_c2}}) ) ; 
 
assign  wbuf_hit_unqual_c2 = (|(wb_cam_hit_vec_tmp_c2[7:0])) |  
				bypass_hit_en_c2 ; 
 
assign	wb_cam_hit_vec_c2 = ( wb_cam_hit_vec_tmp_c2 ) |  
			( {8{bypass_hit_en_c2}} & wbtag_write_wl_c5 ) ; 
 
 
l2t_wbuf_ctl_msff_ctl_macro__width_8 ff_wb_cam_hit_vec_c3 
              (.dout   (wb_cam_hit_vec_c3[7:0]), 
               .scan_in(ff_wb_cam_hit_vec_c3_scanin),
               .scan_out(ff_wb_cam_hit_vec_c3_scanout),
               .din (wb_cam_hit_vec_c2[7:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
l2t_wbuf_ctl_msff_ctl_macro__width_8 ff_wb_cam_hit_vec_c4 
              (.dout   (wb_cam_hit_vec_c4[7:0]), 
               .scan_in(ff_wb_cam_hit_vec_c4_scanin),
               .scan_out(ff_wb_cam_hit_vec_c4_scanout),
               .din (wb_cam_hit_vec_c3[7:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
assign  wbuf_hit_qual_c2 = wbuf_hit_unqual_c2 & arb_wbuf_inst_vld_c2 ; 
 
l2t_wbuf_ctl_msff_ctl_macro__width_1 ff_wbuf_hit_qual_c3 
              (.dout   (wbuf_hit_qual_c3), 
               .scan_in(ff_wbuf_hit_qual_c3_scanin),
               .scan_out(ff_wbuf_hit_qual_c3_scanout),
               .din (wbuf_hit_qual_c2), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
l2t_wbuf_ctl_msff_ctl_macro__width_1 ff_wbuf_hit_qual_c4 
              (.dout   (wbuf_hit_qual_c4), 
               .scan_in(ff_wbuf_hit_qual_c4_scanin),
               .scan_out(ff_wbuf_hit_qual_c4_scanout),
               .din (wbuf_hit_qual_c3), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
//////////////////////////////////////////////////////////////////////////////// 
// MBID and MBID_vld. 
// Written in the C4 cycle of a non-dependent instruction that hits 
// the Writeback buffer. 
// 
// When an ack is received from DRAM for the entry with mbid_vld, 
// the corresponding mbid is used to wake up the miss buffer entry 
// that depends on the write.The ack may be received when the instruction 
// is in flight i.e in C2, C3 otr C4 and yet to set mbid vld. But that is 
// okay since the "acked" bit can only be set for one entry in the WBB at 
// a time. 
// MBID_vld is reset when an entry has mbid_vld =1 and acked=1 
// 
//////////////////////////////////////////////////////////////////////////////// 
assign  mbid_wr_en         = wbuf_hit_qual_c4 & ~misbuf_hit_c4; 
assign  sel_insert_mbid_c4 = {8{mbid_wr_en}} & wb_cam_hit_vec_c4[7:0] ; 


// BS & SR 11/04/03, MB grows to 32
l2t_wbuf_ctl_msff_ctl_macro__en_1__width_5 ff_mbid0 
              (.dout   (mbid0[4:0]), 
               .scan_in(ff_mbid0_scanin),
               .scan_out(ff_mbid0_scanout),
               .din (misbuf_wbuf_mbid_c4[4:0]), 
               .en  (sel_insert_mbid_c4[0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
l2t_wbuf_ctl_msff_ctl_macro__en_1__width_5 ff_mbid1 
              (.dout   (mbid1[4:0]), 
               .scan_in(ff_mbid1_scanin),
               .scan_out(ff_mbid1_scanout),
               .din (misbuf_wbuf_mbid_c4[4:0]), 
               .en  (sel_insert_mbid_c4[1]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
l2t_wbuf_ctl_msff_ctl_macro__en_1__width_5 ff_mbid2 
              (.dout   (mbid2[4:0]), 
               .scan_in(ff_mbid2_scanin),
               .scan_out(ff_mbid2_scanout),
               .din (misbuf_wbuf_mbid_c4[4:0]), 
               .en  (sel_insert_mbid_c4[2]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
l2t_wbuf_ctl_msff_ctl_macro__en_1__width_5 ff_mbid3 
              (.dout   (mbid3[4:0]), 
               .scan_in(ff_mbid3_scanin),
               .scan_out(ff_mbid3_scanout),
               .din (misbuf_wbuf_mbid_c4[4:0]), 
               .en  (sel_insert_mbid_c4[3]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
l2t_wbuf_ctl_msff_ctl_macro__en_1__width_5 ff_mbid4 
              (.dout   (mbid4[4:0]), 
               .scan_in(ff_mbid4_scanin),
               .scan_out(ff_mbid4_scanout),
               .din (misbuf_wbuf_mbid_c4[4:0]), 
               .en  (sel_insert_mbid_c4[4]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
l2t_wbuf_ctl_msff_ctl_macro__en_1__width_5 ff_mbid5 
              (.dout   (mbid5[4:0]), 
               .scan_in(ff_mbid5_scanin),
               .scan_out(ff_mbid5_scanout),
               .din (misbuf_wbuf_mbid_c4[4:0]), 
               .en  (sel_insert_mbid_c4[5]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
l2t_wbuf_ctl_msff_ctl_macro__en_1__width_5 ff_mbid6 
              (.dout   (mbid6[4:0]), 
               .scan_in(ff_mbid6_scanin),
               .scan_out(ff_mbid6_scanout),
               .din (misbuf_wbuf_mbid_c4[4:0]), 
               .en  (sel_insert_mbid_c4[6]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
l2t_wbuf_ctl_msff_ctl_macro__en_1__width_5 ff_mbid7 
              (.dout   (mbid7[4:0]), 
               .scan_in(ff_mbid7_scanin),
               .scan_out(ff_mbid7_scanout),
               .din (misbuf_wbuf_mbid_c4[4:0]), 
               .en  (sel_insert_mbid_c4[7]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
assign  wb_mbid_vld_in[7:0] = (wb_mbid_vld[7:0] | sel_insert_mbid_c4[7:0]) & 
                              ~(sel_mbid[7:0]) ; 
 
l2t_wbuf_ctl_msff_ctl_macro__clr_1__width_8 ff_wb_mbid_vld  // sync reset active low
              (.dout   (wb_mbid_vld[7:0]), 
               .scan_in(ff_wb_mbid_vld_scanin),
               .scan_out(ff_wb_mbid_vld_scanout),
               .din (wb_mbid_vld_in[7:0]), 
               .l1clk (l1clk),  .clr(~dbb_rst_l),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
assign  or_wb_mbid_vld_in = |(wb_mbid_vld_in[7:0]) ; 
 
l2t_wbuf_ctl_msff_ctl_macro__clr_1__width_1 ff_or_wb_mbid_vld  // sync reset active low
              (.dout   (or_wb_mbid_vld), 
               .scan_in(ff_or_wb_mbid_vld_scanin),
               .scan_out(ff_or_wb_mbid_vld_scanout),
               .din (or_wb_mbid_vld_in), 
               .l1clk (l1clk),  .clr(~dbb_rst_l),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
//////////////////////////////////////////////////////////////////////////////// 
assign  sel_mbid[7:0]       = wb_acked[7:0] & wb_mbid_vld[7:0] ; 
assign  sel_default_mux1    = ~(sel_mbid[0] | sel_mbid[1] | sel_mbid[2]) ; 
assign  sel_default_mux2    = ~(sel_mbid[4] | sel_mbid[5] | sel_mbid[6]) ; 
assign  sel_default_mbentry = |(sel_mbid[3:0]) ; 
 
assign	sel_mbid_rst[0] = sel_mbid[0] ; 
assign	sel_mbid_rst[1] = sel_mbid[1] ; 
assign	sel_mbid_rst[2] = sel_mbid[2] ; 
assign	sel_mbid_rst[3] = sel_default_mux1 ; 
assign	sel_mbid_rst[4] = sel_mbid[4] ; 
assign	sel_mbid_rst[5] = sel_mbid[5] ; 
assign	sel_mbid_rst[6] = sel_mbid[6] ; 
assign	sel_mbid_rst[7] = sel_default_mux2 ; 
 
  // BS & SR 11/04/03, MB grows to 32

l2t_wbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_sel_mbid3t0 
              (.dout (sel_mbid3t0[4:0]), 
               .din0  (mbid0[4:0]),  .sel0 (sel_mbid_rst[0]), 
               .din1  (mbid1[4:0]),  .sel1 (sel_mbid_rst[1]), 
               .din2  (mbid2[4:0]),  .sel2 (sel_mbid_rst[2]), 
               .din3  (mbid3[4:0]),  .sel3 (sel_mbid_rst[3]) 
              ) ; 
l2t_wbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 mux_sel_mbid7t4 
              (.dout (sel_mbid7t4[4:0]), 
               .din0  (mbid4[4:0]),  .sel0 (sel_mbid_rst[4]), 
               .din1  (mbid5[4:0]),  .sel1 (sel_mbid_rst[5]), 
               .din2  (mbid6[4:0]),  .sel2 (sel_mbid_rst[6]), 
               .din3  (mbid7[4:0]),  .sel3 (sel_mbid_rst[7]) 
              ) ; 
l2t_wbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_5 mux_sel_mbid7t0 
              (.dout (sel_mbid7t0[4:0]), 
               .din0  (sel_mbid3t0[4:0]),  .sel0 (sel_default_mbentry), 
               .din1  (sel_mbid7t4[4:0]),  .sel1 (~sel_default_mbentry) 
              ) ; 
 
assign  wbuf_misbuf_dep_rdy_en = |(sel_mbid[7:0]) ; 
assign  wbuf_misbuf_dep_mbid   = sel_mbid7t0[4:0] ;  // BS & SR 11/04/03, MB grows to 32
 
 
//////////////////////////////////////////////////////////////////////////////// 
// A Write request is generated only if a READ request is not being 
// sent to DRAM in the same cycle. Here is the pipeline for making 
// a write request to DRAM. 
//------------------------------------------------------------------------------ 
//      #1                      #2                 #3 
//------------------------------------------------------------------------------ 
//   if (atleast 1          rd wbtag           xmit req,addr 
//   mcu_req                                  to 
//   AND                                       DRAM 
//   not mcu_pick 
//   in misbuf. 
//   AND 
//   not wrreq              wbuf_wr_addr_sel 
//   pending to DRAM)       xmitted to 
//                          arbaddr. 
//   generate RD 
//   pointer 
// 
//   set wrreq 
//   pending 
// 
//   xmit read en 
//   and rd wl to wbtag. 
//------------------------------------------------------------------------------ 
//#n-1        #n(r0)          #n+1(r1)                #n+2(r2)        #n+2(r3) 
//------------------------------------------------------------------------------ 
//          ack from mcu   rd_en                   rd wbdata       mux data 
//                          rd_wl                   in PH1          in evict 
//                          to l2b.wbdata 
//------------------------------------------------------------------------------ 
//    r4                   r5              r6      ......          r12 
//------------------------------------------------------------------------------ 
//   perform ecc         xmit data1      dat2                    data8 
//                       to mcu         to mcu                 to mcu 
// 
//                                                               reset 
//                                                               wrreq 
//                                                               pending 
// 
//                                                               reset vld 
// 
//                                                               dec wb counter 
//////////////////////////////////////////////////////////////////////////////// 
 
assign  can_req_mcu  = ( or_wb_valid | rdmat_or_rdmat_valid )  
		& ~mcu_req_pending & ~misbuf_filbuf_mcu_pick ; 
 
assign  enter_state0  = ~dbb_rst_l | leave_state2 ; 
assign  leave_state0  = state[0] & can_req_mcu ; 
assign  next_state[0] = (state[0] | enter_state0) & ~leave_state0 ; 
 
assign  enter_state1  = leave_state0 ; 
assign  leave_state1  = state[1] & mcu_l2t_wr_ack_d1 ; 
assign  next_state[1] = (state[1] | enter_state1) & ~leave_state1 & dbb_rst_l ; 
 
assign  enter_state2  = leave_state1 ; 
assign  leave_state2  = state[2] & (cycle_count[3:0] == 4'd12) ; 
assign  next_state[2] = (state[2] | enter_state2) & ~leave_state2 & dbb_rst_l ; 
 
l2t_wbuf_ctl_msff_ctl_macro__width_3 ff_state 
              (.dout   (state[2:0]), 
               .scan_in(ff_state_scanin),
               .scan_out(ff_state_scanout),
               .din (next_state[2:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
 
 
assign  mcu_req_pending_in = (mcu_req_pending | leave_state0) & ~leave_state2 ; 
 
l2t_wbuf_ctl_msff_ctl_macro__clr_1__width_1 ff_mcu_req_pending  // sync reset active low
              (.dout   (mcu_req_pending), 
               .scan_in(ff_mcu_req_pending_scanin),
               .scan_out(ff_mcu_req_pending_scanout),
               .din (mcu_req_pending_in), 
               .l1clk (l1clk),  .clr(~dbb_rst_l),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
 
 
assign  inc_cycle_count   = (enter_state2 | state[2]) ; 
assign  cycle_count_plus1 = cycle_count + 4'b1 ; 
assign  next_cycle_count  = cycle_count_plus1 & ~{4{leave_state2}} ; 
 
l2t_wbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_cycle_count_in 
              (.dout (cycle_count_in[3:0]), 
               .din0  (cycle_count[3:0]),        .sel0 (~inc_cycle_count), 
               .din1  (next_cycle_count[3:0]),   .sel1 (inc_cycle_count) 
              ) ; 
l2t_wbuf_ctl_msff_ctl_macro__clr_1__width_4 ff_cycle_count  // sync reset active low
              (.dout   (cycle_count[3:0]), 
               .scan_in(ff_cycle_count_scanin),
               .scan_out(ff_cycle_count_scanout),
               .din (cycle_count_in[3:0]), 
               .l1clk (l1clk),  .clr(~dbb_rst_l),
  .siclk(siclk),
  .soclk(soclk) 
              ) ; 

assign l2t_rdma_rd_ptr[0] = (l2t_mb2_addr_r3[1:0] == 2'b00);
assign l2t_rdma_rd_ptr[1] = (l2t_mb2_addr_r3[1:0] == 2'b01);
assign l2t_rdma_rd_ptr[2] = (l2t_mb2_addr_r3[1:0] == 2'b10);
assign l2t_rdma_rd_ptr[3] = (l2t_mb2_addr_r3[1:0] == 2'b11);


 
assign  wbuf_wb_read_en = l2t_mb2_run_r1 ? l2t_mb2_wbtag_rd_en_r3 : (leave_state0  & ~pick_quad_sel[2]); 
assign  wbuf_wb_read_wl[7:0] = l2t_mb2_run_r1 ? mbist_wbuf_wr_ptr[7:0] : pick_wb_read_wl[7:0] ; 
 
assign	wbuf_rdmat_read_en = l2t_mb2_run_r1 ? l2t_mb2_rdmatag_rd_en_r3 : (leave_state0 & pick_quad_sel[2]); 
assign	wbuf_rdmat_read_wl[3:0] = l2t_mb2_run_r1 ? l2t_rdma_rd_ptr[3:0] : pick_rdmat_read_wl[3:0]; 
 
l2t_wbuf_ctl_msff_ctl_macro__en_1__width_8 ff_latched_wb_read_wl 
              (.dout   (latched_wb_read_wl[7:0]), 
               .scan_in(ff_latched_wb_read_wl_scanin),
               .scan_out(ff_latched_wb_read_wl_scanout),
               .din (pick_wb_read_wl[7:0]), 
               .en  (leave_state0), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
l2t_wbuf_ctl_msff_ctl_macro__en_1__width_1 ff_latched_wb_read_en 
              (.dout   (latched_wb_read_en), 
               .scan_in(ff_latched_wb_read_en_scanin),
               .scan_out(ff_latched_wb_read_en_scanout),
               .din (wbuf_wb_read_en), 
               .en  (leave_state0), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 




assign	l2t_l2b_rdma_rdwl_r0_prev[0] = (pick_rdmat_read_wl[1] | pick_rdmat_read_wl[3] ); 
assign	l2t_l2b_rdma_rdwl_r0_prev[1] = (pick_rdmat_read_wl[2] | pick_rdmat_read_wl[3] ); 

l2t_wbuf_ctl_msff_ctl_macro__en_1__width_2 ff_l2t_l2b_rdma_rdwl_r0 
              (.dout   (l2t_l2b_rdma_rdwl_r0[1:0]),
               .scan_in(ff_l2t_l2b_rdma_rdwl_r0_scanin),
               .scan_out(ff_l2t_l2b_rdma_rdwl_r0_scanout),
               .din (l2t_l2b_rdma_rdwl_r0_prev[1:0]),
               .en  (leave_state0),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
              ) ;
 
l2t_wbuf_ctl_msff_ctl_macro__en_1__width_4 ff_latched_rdmad_read_wl 
              (.dout   (latched_rdmad_read_wl[3:0]), 
               .scan_in(ff_latched_rdmad_read_wl_scanin),
               .scan_out(ff_latched_rdmad_read_wl_scanout),
               .din (pick_rdmat_read_wl[3:0]), 
               .en  (leave_state0), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              ) ; 
 
l2t_wbuf_ctl_msff_ctl_macro__en_1__width_1 ff_latched_rdma_read_en 
              (.dout   (latched_rdma_read_en), 
               .scan_in(ff_latched_rdma_read_en_scanin),
               .scan_out(ff_latched_rdma_read_en_scanout),
               .din (wbuf_rdmat_read_en), 
               .en  (leave_state0), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
// the following signal  indicates that the WBB buffer address 
// needs to be selected over the rdmat address. 
l2t_wbuf_ctl_msff_ctl_macro__width_1 ff_wbuf_wr_addr_sel 
              (.dout   (wbuf_wr_addr_sel), 
               .scan_in(ff_wbuf_wr_addr_sel_scanin),
               .scan_out(ff_wbuf_wr_addr_sel_scanout),
               .din (wbuf_wb_read_en), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
// the following signal goes to evctag to enable the  
// address flop that transmits the address to  
// DRAM 
 
l2t_wbuf_ctl_msff_ctl_macro__width_1 ff_wb_or_rdma_wr_req_en 
              (.dout   (wbuf_wb_or_rdma_wr_req_en), 
               .scan_in(ff_wb_or_rdma_wr_req_en_scanin),
               .scan_out(ff_wb_or_rdma_wr_req_en_scanout),
               .din (leave_state0), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
// the following signal  indicates that a write  
// request needs to be issued either from the 
// wbb or the rdmat 
 
l2t_wbuf_ctl_msff_ctl_macro__width_1 ff_l2t_mcu_wr_req 
              (.dout   (l2t_mcu_wr_req), 
               .scan_in(ff_l2t_mcu_wr_req_scanin),
               .scan_out(ff_l2t_mcu_wr_req_scanout),
               .din (wbuf_wb_or_rdma_wr_req_en), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
//
//msff_ctl_macro ff_latched_wb_read_wl (width=8,en=1)
//              (.dout   (latched_wb_read_wl[7:0]),
//               .scan_in(ff_latched_wb_read_wl_scanin),
//               .scan_out(ff_latched_wb_read_wl_scanout),
//               .din (pick_wb_read_wl[7:0]),
//               .en  (leave_state0),
//               .l1clk (l1clk),
//
//
//assign  l2t_l2b_wbrd_wl_r0[0] = (latched_wb_read_wl[1] | latched_wb_read_wl[3] | 
//                                     latched_wb_read_wl[5] | latched_wb_read_wl[7]) ; 
//assign  l2t_l2b_wbrd_wl_r0[1] = (latched_wb_read_wl[2] | latched_wb_read_wl[3] | 
//                                     latched_wb_read_wl[6] | latched_wb_read_wl[7]) ; 
//assign  l2t_l2b_wbrd_wl_r0[2] = (latched_wb_read_wl[4] | latched_wb_read_wl[5] | 
//                                     latched_wb_read_wl[6] | latched_wb_read_wl[7]) ; 
// 



assign  l2t_l2b_wbrd_wl_r0_prev[0] = (pick_wb_read_wl[1] | pick_wb_read_wl[3] |
                                     pick_wb_read_wl[5] | pick_wb_read_wl[7]) ;

assign  l2t_l2b_wbrd_wl_r0_prev[1] = (pick_wb_read_wl[2] | pick_wb_read_wl[3] |
                                     pick_wb_read_wl[6] | pick_wb_read_wl[7]) ;
assign  l2t_l2b_wbrd_wl_r0_prev[2] = (pick_wb_read_wl[4] | pick_wb_read_wl[5] |
                                     pick_wb_read_wl[6] | pick_wb_read_wl[7]) ;


l2t_wbuf_ctl_msff_ctl_macro__en_1__width_3 ff_l2t_l2b_wbrd_wl_r0 
              (.dout   (l2t_l2b_wbrd_wl_r0[2:0]),
               .scan_in(ff_l2t_l2b_wbrd_wl_r0_scanin),
               .scan_out(ff_l2t_l2b_wbrd_wl_r0_scanout),
               .din (l2t_l2b_wbrd_wl_r0_prev[2:0]),
               .en  (leave_state0),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
		);


//assign  l2t_l2b_wbrd_en_r0    = (l2t_l2b_evict_en_r0 & ~l2t_l2b_evict_en_r0_d1) & latched_wb_read_en  ; 
//assign	l2t_l2b_rdma_rdwl_r0[0] = (latched_rdmad_read_wl[1] | latched_rdmad_read_wl[3] ); 
//assign	l2t_l2b_rdma_rdwl_r0[1] = (latched_rdmad_read_wl[2] | latched_rdmad_read_wl[3] ); 
//assign	l2t_l2b_rdma_rden_r0 =  (l2t_l2b_evict_en_r0 & ~l2t_l2b_evict_en_r0_d1) & latched_rdma_read_en  ; 

assign  wbuf_wbufrpt_leave_state0  = state[0] & can_req_mcu ; 
 
 
assign  l2t_l2b_ev_dword_r0   = cycle_count[2:0] ; 
//assign  l2t_l2b_evict_en_r0   = leave_state1 | (state[2] & (cycle_count < 4'd8)) ; 


assign  l2t_l2b_evict_en_r0   = leave_state1 | cycle_count_less_than_7 ;

assign	wbuf_wbufrpt_next_state_1 = next_state[1];


 
l2t_wbuf_ctl_msff_ctl_macro__width_1 ff_l2t_l2b_evict_en_r0_d1 
              (.dout   (l2t_l2b_evict_en_r0_d1_unused), 
               .scan_in(ff_l2t_l2b_evict_en_r0_d1_scanin),
               .scan_out(ff_l2t_l2b_evict_en_r0_d1_scanout),
               .din (l2t_l2b_evict_en_r0), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              ) ; 


assign cycle_count_less_than_7_din = (cycle_count < 4'd7) & next_state[2];

l2t_wbuf_ctl_msff_ctl_macro__width_1 ff_cycle_count_in 
              (.dout   (cycle_count_less_than_7),
               .scan_in(ff_cycle_count_in_scanin),
               .scan_out(ff_cycle_count_in_scanout),
               .din (cycle_count_less_than_7_din),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
              ) ;





 
 
//////////////////////////////////////////////////////////////////////////////// 
// Dequeue of rdmad buffer needs to be sent to jbus. 
//////////////////////////////////////////////////////////////////////////////// 

assign	l2t_sii_wib_dequeue_prev = leave_state2 &  
					latched_rdma_read_en ; 
 
l2t_wbuf_ctl_msff_ctl_macro__width_1 ff_l2t_sii_wib_dequeue 
              (.dout   (l2t_sii_wib_dequeue_raw), 
               .scan_in(ff_l2t_sii_wib_dequeue_scanin),
               .scan_out(ff_l2t_sii_wib_dequeue_scanout),
               .din (l2t_sii_wib_dequeue_prev), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
              ) ; 

l2t_wbuf_ctl_msff_ctl_macro__width_1 ff_l2t_sii_wib_dequeue_delay 
              (.dout   (l2t_sii_wib_dequeue_delay),
               .scan_in(ff_l2t_sii_wib_dequeue_delay_scanin),
               .scan_out(ff_l2t_sii_wib_dequeue_delay_scanout),
               .din (l2t_sii_wib_dequeue_raw),
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
              ) ;

assign l2t_sii_wib_dequeue = l2t_siu_delay ? l2t_sii_wib_dequeue_delay : l2t_sii_wib_dequeue_raw;

 
// for debug
// to siu
// assign l2t_dbg_sii_wib_dequeue = l2t_sii_wib_dequeue;
//

l2t_wbuf_ctl_msff_ctl_macro__width_1 ff_l2t_dbg_sii_wib_dequeue 
        (       
        .scan_in(ff_l2t_dbg_sii_wib_dequeue_scanin),
        .scan_out(ff_l2t_dbg_sii_wib_dequeue_scanout),
        .din(l2t_sii_wib_dequeue), 
        .l1clk(l1clk),
        .dout(l2t_dbg_sii_wib_dequeue),
  .siclk(siclk),
  .soclk(soclk)
        );




 
//////////////////////////////////////////////////////////////////////////////// 
 
l2t_wbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_pick_quad0_in 
              (.dout (pick_quad0_in[3:0]), 
               .din0  (wb_valid[3:0]),     .sel0 (~or_wb_mbid_vld), 
               .din1  (wb_mbid_vld[3:0]),  .sel1 (or_wb_mbid_vld) 
              ) ; 
l2t_wbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 mux_pick_quad1_in 
              (.dout (pick_quad1_in[3:0]), 
               .din0  (wb_valid[7:4]),     .sel0 (~or_wb_mbid_vld), 
               .din1  (wb_mbid_vld[7:4]),  .sel1 (or_wb_mbid_vld) 
              ) ; 
 
 
 
assign	pick_quad2_in[3:0] = rdmat_pick_vec[3:0] ; 
 
 
assign  pick_quad_in[0] = |(pick_quad0_in[3:0]) ; 
assign  pick_quad_in[1] = |(pick_quad1_in[3:0]) ; 
assign  pick_quad_in[2] = |(pick_quad2_in[3:0]) ; 
 
 
 
 
assign  init_pick_state   = ~dbb_rst_l | ~dbginit_l ; 
 
 
assign  sel_lshift_quad   = leave_state1 & ~init_pick_state ; 
assign  sel_same_quad     = ~sel_lshift_quad & ~init_pick_state ; 
assign  lshift_quad_state = {quad_state[1:0], quad_state[2]} ; 
 
l2t_wbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_3 mux_quad_state_in  
              (.dout (quad_state_in[2:0]), 
               .din0  (3'b01),                   .sel0 (init_pick_state), 
               .din1  (quad_state[2:0]),         .sel1 (sel_same_quad), 
               .din2  (lshift_quad_state[2:0]),  .sel2 (sel_lshift_quad) 
              ) ; 
l2t_wbuf_ctl_msff_ctl_macro__width_3 ff_quad_state 
              (.dout   (quad_state[2:0]), 
               .scan_in(ff_quad_state_scanin),
               .scan_out(ff_quad_state_scanout),
               .din (quad_state_in[2:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
 
assign  sel_lshift_quad0   = leave_state1 & |(latched_wb_read_wl[3:0]) & ~init_pick_state ; 
assign  sel_same_quad0     = ~sel_lshift_quad0 & ~init_pick_state ; 
assign  lshift_quad0_state = {quad0_state[2:0], quad0_state[3]} ; 
 
l2t_wbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_quad0_state_in  
              (.dout (quad0_state_in[3:0]), 
               .din0  (4'b0001),                  .sel0 (init_pick_state), 
               .din1  (quad0_state[3:0]),         .sel1 (sel_same_quad0), 
               .din2  (lshift_quad0_state[3:0]),  .sel2 (sel_lshift_quad0) 
              ) ; 
 
l2t_wbuf_ctl_msff_ctl_macro__width_4 ff_quad0_state 
              (.dout   (quad0_state[3:0]), 
               .scan_in(ff_quad0_state_scanin),
               .scan_out(ff_quad0_state_scanout),
               .din (quad0_state_in[3:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
 
assign  sel_lshift_quad1   = leave_state1 & |(latched_wb_read_wl[7:4]) & ~init_pick_state ; 
assign  sel_same_quad1     = ~sel_lshift_quad1 & ~init_pick_state ; 
assign  lshift_quad1_state = {quad1_state[2:0], quad1_state[3]} ; 
 
l2t_wbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_quad1_state_in  
              (.dout (quad1_state_in[3:0]), 
               .din0  (4'b0001),                  .sel0 (init_pick_state), 
               .din1  (quad1_state[3:0]),         .sel1 (sel_same_quad1), 
               .din2  (lshift_quad1_state[3:0]),  .sel2 (sel_lshift_quad1) 
              ) ; 
 
l2t_wbuf_ctl_msff_ctl_macro__width_4 ff_quad1_state 
              (.dout   (quad1_state[3:0]), 
               .scan_in(ff_quad1_state_scanin),
               .scan_out(ff_quad1_state_scanout),
               .din (quad1_state_in[3:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
//assign  sel_lshift_quad2   = leave_state1 & |(latched_wb_read_wl[7:4]) & ~init_pick_state ; 
assign  sel_lshift_quad2   = leave_state1 & |(latched_rdmad_read_wl[3:0]) & ~init_pick_state ; 
assign  sel_same_quad2     = ~sel_lshift_quad2 & ~init_pick_state ; 
assign  lshift_quad2_state = {quad2_state[2:0], quad2_state[3]} ; 
 
l2t_wbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_quad2_state_in  
              (.dout (quad2_state_in[3:0]), 
               .din0  (4'b0001),                  .sel0 (init_pick_state), 
               .din1  (quad2_state[3:0]),         .sel1 (sel_same_quad2), 
               .din2  (lshift_quad2_state[3:0]),  .sel2 (sel_lshift_quad2) 
              ) ; 
 
l2t_wbuf_ctl_msff_ctl_macro__width_4 ff_quad2_state 
              (.dout   (quad2_state[3:0]), 
               .scan_in(ff_quad2_state_scanin),
               .scan_out(ff_quad2_state_scanout),
               .din (quad2_state_in[3:0]), 
               .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
 
 
// QUAD0 bits. 
assign  pick_quad0_sel[0] =  pick_quad0_in[0] & 
                            (quad0_state[0] | 
                            (quad0_state[1] & ~(pick_quad0_in[1] | 
                                                pick_quad0_in[2] | 
                                                pick_quad0_in[3])) | 
                            (quad0_state[2] & ~(pick_quad0_in[2] | 
                                                pick_quad0_in[3])) | 
                            (quad0_state[3] & ~(pick_quad0_in[3])) ) ; 
assign  pick_quad0_sel[1] =  pick_quad0_in[1] & 
                            (quad0_state[1] | 
                            (quad0_state[2] & ~(pick_quad0_in[2] | 
                                                pick_quad0_in[3] | 
                                                pick_quad0_in[0])) | 
                            (quad0_state[3] & ~(pick_quad0_in[3] | 
                                                pick_quad0_in[0])) | 
                            (quad0_state[0] & ~(pick_quad0_in[0])) ) ; 
assign  pick_quad0_sel[2] =  pick_quad0_in[2] & 
                            (quad0_state[2] | 
                            (quad0_state[3] & ~(pick_quad0_in[3] | 
                                                pick_quad0_in[0] | 
                                                pick_quad0_in[1])) | 
                            (quad0_state[0] & ~(pick_quad0_in[0] | 
                                                pick_quad0_in[1])) | 
                            (quad0_state[1] & ~(pick_quad0_in[1])) ) ; 
assign  pick_quad0_sel[3] =  pick_quad0_in[3] & 
                            (quad0_state[3] | 
                            (quad0_state[0] & ~(pick_quad0_in[0] | 
                                                pick_quad0_in[1] | 
                                                pick_quad0_in[2])) | 
                            (quad0_state[1] & ~(pick_quad0_in[1] | 
                                                pick_quad0_in[2])) | 
                            (quad0_state[2] & ~(pick_quad0_in[2])) ) ; 
 
 
// QUAD1 bits. 
assign  pick_quad1_sel[0] =  pick_quad1_in[0] & 
                            (quad1_state[0] | 
                            (quad1_state[1] & ~(pick_quad1_in[1] | 
                                                pick_quad1_in[2] | 
                                                pick_quad1_in[3])) | 
                            (quad1_state[2] & ~(pick_quad1_in[2] | 
                                                pick_quad1_in[3])) | 
                            (quad1_state[3] & ~(pick_quad1_in[3])) ) ; 
assign  pick_quad1_sel[1] =  pick_quad1_in[1] & 
                            (quad1_state[1] | 
                            (quad1_state[2] & ~(pick_quad1_in[2] | 
                                                pick_quad1_in[3] | 
                                                pick_quad1_in[0])) | 
                            (quad1_state[3] & ~(pick_quad1_in[3] | 
                                                pick_quad1_in[0])) | 
                            (quad1_state[0] & ~(pick_quad1_in[0])) ) ; 
assign  pick_quad1_sel[2] =  pick_quad1_in[2] & 
                            (quad1_state[2] | 
                            (quad1_state[3] & ~(pick_quad1_in[3] | 
                                                pick_quad1_in[0] | 
                                                pick_quad1_in[1])) | 
                            (quad1_state[0] & ~(pick_quad1_in[0] | 
                                                pick_quad1_in[1])) | 
                            (quad1_state[1] & ~(pick_quad1_in[1])) ) ; 
assign  pick_quad1_sel[3] =  pick_quad1_in[3] & 
                            (quad1_state[3] | 
                            (quad1_state[0] & ~(pick_quad1_in[0] | 
                                                pick_quad1_in[1] | 
                                                pick_quad1_in[2])) | 
                            (quad1_state[1] & ~(pick_quad1_in[1] | 
                                                pick_quad1_in[2])) | 
                            (quad1_state[2] & ~(pick_quad1_in[2])) ) ; 
 
 
// QUAD1 bits. 
assign  pick_quad2_sel[0] =  pick_quad2_in[0] & 
                            (quad2_state[0] | 
                            (quad2_state[1] & ~(pick_quad2_in[1] | 
                                                pick_quad2_in[2] | 
                                                pick_quad2_in[3])) | 
                            (quad2_state[2] & ~(pick_quad2_in[2] | 
                                                pick_quad2_in[3])) | 
                            (quad2_state[3] & ~(pick_quad2_in[3])) ) ; 
assign  pick_quad2_sel[1] =  pick_quad2_in[1] & 
                            (quad2_state[1] | 
                            (quad2_state[2] & ~(pick_quad2_in[2] | 
                                                pick_quad2_in[3] | 
                                                pick_quad2_in[0])) | 
                            (quad2_state[3] & ~(pick_quad2_in[3] | 
                                                pick_quad2_in[0])) | 
                            (quad2_state[0] & ~(pick_quad2_in[0])) ) ; 
assign  pick_quad2_sel[2] =  pick_quad2_in[2] & 
                            (quad2_state[2] | 
                            (quad2_state[3] & ~(pick_quad2_in[3] | 
                                                pick_quad2_in[0] | 
                                                pick_quad2_in[1])) | 
                            (quad2_state[0] & ~(pick_quad2_in[0] | 
                                                pick_quad2_in[1])) | 
                            (quad2_state[1] & ~(pick_quad2_in[1])) ) ; 
assign  pick_quad2_sel[3] =  pick_quad2_in[3] & 
                            (quad2_state[3] | 
                            (quad2_state[0] & ~(pick_quad2_in[0] | 
                                                pick_quad2_in[1] | 
                                                pick_quad2_in[2])) | 
                            (quad2_state[1] & ~(pick_quad2_in[1] | 
                                                pick_quad2_in[2])) | 
                            (quad2_state[2] & ~(pick_quad2_in[2])) ) ; 
 
 
 
// QUAD bits. 
 
assign  pick_quad_sel[0] = pick_quad_in[0] &  ( quad_state[0] | 
                        ( quad_state[1] & ~( pick_quad_in[1] | pick_quad_in[2] ) ) | 
                        ( quad_state[2] & ~pick_quad_in[2] ) ) ; 
 
assign  pick_quad_sel[1] = pick_quad_in[1] &  ( quad_state[1] | 
                        ( quad_state[2] & ~( pick_quad_in[2] | pick_quad_in[0] ) ) | 
                        ( quad_state[0] & ~pick_quad_in[0] ) ) ; 
 
assign  pick_quad_sel[2] = pick_quad_in[2] &  ( quad_state[2] | 
                        ( quad_state[0] & ~( pick_quad_in[0] | pick_quad_in[1] ) ) | 
                        ( quad_state[1] & ~pick_quad_in[1] ) ) ; 
 
 
 
assign  pick_wb_read_wl[3:0] = (pick_quad0_sel[3:0] & {4{pick_quad_sel[0]}}) ;  
assign  pick_wb_read_wl[7:4] = (pick_quad1_sel[3:0] & {4{pick_quad_sel[1]}}) ; 
 
assign	pick_rdmat_read_wl[3:0]= (pick_quad2_sel[3:0] & {4{pick_quad_sel[2]}}) ; 
 
 
 
 
 
 
 
//////////////////////////////////////////////////////////////////////////////// 
 
assign  inc_wb_count  =  wbuf_wbtag_write_en_c4 & ~(leave_state2  &  
				latched_wb_read_en ) ; 
assign  dec_wb_count  = ~wbuf_wbtag_write_en_c4 &   
			( leave_state2 & latched_wb_read_en )  ; 
assign  same_wb_count = ~(inc_wb_count | dec_wb_count) ; 
 
assign  wb_count_plus1  = wb_count + 4'b1 ; 
assign  wb_count_minus1 = wb_count - 4'b1 ; 
 
l2t_wbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 mux_next_wb_count  
              (.dout (next_wb_count[3:0]), 
               .din0  (wb_count[3:0]),         .sel0 (same_wb_count), 
               .din1  (wb_count_plus1[3:0]),   .sel1 (inc_wb_count), 
               .din2  (wb_count_minus1[3:0]),  .sel2 (dec_wb_count) 
              ) ; 
l2t_wbuf_ctl_msff_ctl_macro__clr_1__width_4 ff_wb_count  // sync reset active low
              (.dout   (wb_count[3:0]), 
               .scan_in(ff_wb_count_scanin),
               .scan_out(ff_wb_count_scanout),
               .din (next_wb_count[3:0]), 
               .l1clk (l1clk),  .clr(~dbb_rst_l),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
//s//ynopsys translate_off FIXME fix sunv
//
// removing until sunv gets fixed
//
// always  @(wb_count  ) begin 
//         if(  wb_count > 4'd8 )  begin // BS and SR int 5.0 changes
//              // 0in <fire -message "FATAL ERROR: wb_counter overflow." 
// `ifdef DEFINE_0IN 
// `else 
//         $error("WB_COUNT", "wb_counter overflow."); 
// `endif 
//         end 
// end 
//s//ynopsys translate_on FIXME fix sunv
 
 
//////////////////////////////////////////////////////////////////////////// 
// wb_count is a c5 flop. 
// The following condition is actually evaluated in C4 and flopped to C5 
// 
// When an eviction is in C4, the earliest following eviction can be 
// in C1 and the one following that could be in  PX2 ( happens if the 
// C1 instruction has stalled ).  
// Hence the px1 instruction will not be picked if the counter is 6 or greater. 
 
//////////////////////////////////////////////////////////////////////////// 
assign  wb_count_5      = (wb_count[3:0] == 4'd5) ; 
assign  wb_count_5_plus = (wb_count[3:0] >  4'd5) ; 
 
 
assign  wbuf_arb_full_px1_in = wb_count_5_plus | (wb_count_5 & inc_wb_count) ; 
l2t_wbuf_ctl_msff_ctl_macro__clr_1__width_1 ff_wbuf_arb_full_px1  // sync reset active low
              (.dout   (wbuf_arb_full_px1), 
               .scan_in(ff_wbuf_arb_full_px1_scanin),
               .scan_out(ff_wbuf_arb_full_px1_scanout),
               .din (wbuf_arb_full_px1_in), 
               .l1clk (l1clk),  .clr(~dbb_rst_l),
  .siclk(siclk),
  .soclk(soclk) 
                
 
              ) ; 
 
 
//////////////////////////////////////////////////////////////////////////////// 
 
// fixscan start:
assign reset_flop_scanin         = scan_in                  ;
assign spares_scanin             = reset_flop_scanout       ;
assign ff_arb_wbuf_inst_vld_c3_scanin = spares_scanout           ;
assign ff_arbdp_inst_fb_c3_scanin = ff_arb_wbuf_inst_vld_c3_scanout;
assign ff_arb_wbuf_hit_off_c2_scanin = ff_arbdp_inst_fb_c3_scanout;
assign ff_mcu_l2t_wr_ack_d1_scanin = ff_arb_wbuf_hit_off_c2_scanout;
assign ff_l2t_mb2_run_r1_scanin  = ff_mcu_l2t_wr_ack_d1_scanout;
assign ff_wbtag_write_wl_c5_scanin = ff_l2t_mb2_run_r1_scanout;
assign ff_enc_write_wl_c52_scanin = ff_wbtag_write_wl_c5_scanout;
assign ff_enc_write_wl_c6_scanin = ff_enc_write_wl_c52_scanout;
assign ff_l2_bypass_mode_on_d1_scanin = ff_enc_write_wl_c6_scanout;
assign ff_wbtag_write_en_c4_scanin = ff_l2_bypass_mode_on_d1_scanout;
assign ff_wbtag_write_we_c5_scanin = ff_wbtag_write_en_c4_scanout;
assign ff_wbtag_write_we_c52_scanin = ff_wbtag_write_we_c5_scanout;
assign ff_wbtag_write_we_c6_scanin = ff_wbtag_write_we_c52_scanout;
assign ff_wb_valid_scanin        = ff_wbtag_write_we_c6_scanout;
assign ff_wb_acked_scanin        = ff_wb_valid_scanout      ;
assign ff_bypass_en_c2_scanin    = ff_wb_acked_scanout      ;
assign ff_wb_cam_match_c2_scanin = ff_bypass_en_c2_scanout  ;
assign ff_wb_cam_hit_vec_c3_scanin = ff_wb_cam_match_c2_scanout;
assign ff_wb_cam_hit_vec_c4_scanin = ff_wb_cam_hit_vec_c3_scanout;
assign ff_wbuf_hit_qual_c3_scanin = ff_wb_cam_hit_vec_c4_scanout;
assign ff_wbuf_hit_qual_c4_scanin = ff_wbuf_hit_qual_c3_scanout;
assign ff_mbid0_scanin           = ff_wbuf_hit_qual_c4_scanout;
assign ff_mbid1_scanin           = ff_mbid0_scanout         ;
assign ff_mbid2_scanin           = ff_mbid1_scanout         ;
assign ff_mbid3_scanin           = ff_mbid2_scanout         ;
assign ff_mbid4_scanin           = ff_mbid3_scanout         ;
assign ff_mbid5_scanin           = ff_mbid4_scanout         ;
assign ff_mbid6_scanin           = ff_mbid5_scanout         ;
assign ff_mbid7_scanin           = ff_mbid6_scanout         ;
assign ff_wb_mbid_vld_scanin     = ff_mbid7_scanout         ;
assign ff_or_wb_mbid_vld_scanin  = ff_wb_mbid_vld_scanout   ;
assign ff_state_scanin           = ff_or_wb_mbid_vld_scanout;
assign ff_mcu_req_pending_scanin = ff_state_scanout         ;
assign ff_cycle_count_scanin     = ff_mcu_req_pending_scanout;
assign ff_latched_wb_read_wl_scanin = ff_cycle_count_scanout   ;
assign ff_latched_wb_read_en_scanin = ff_latched_wb_read_wl_scanout;
assign ff_l2t_l2b_rdma_rdwl_r0_scanin = ff_latched_wb_read_en_scanout;
assign ff_latched_rdmad_read_wl_scanin = ff_l2t_l2b_rdma_rdwl_r0_scanout;
assign ff_latched_rdma_read_en_scanin = ff_latched_rdmad_read_wl_scanout;
assign ff_wbuf_wr_addr_sel_scanin = ff_latched_rdma_read_en_scanout;
assign ff_wb_or_rdma_wr_req_en_scanin = ff_wbuf_wr_addr_sel_scanout;
assign ff_l2t_mcu_wr_req_scanin  = ff_wb_or_rdma_wr_req_en_scanout;
assign ff_l2t_l2b_wbrd_wl_r0_scanin = ff_l2t_mcu_wr_req_scanout;
assign ff_l2t_l2b_evict_en_r0_d1_scanin = ff_l2t_l2b_wbrd_wl_r0_scanout;
assign ff_cycle_count_in_scanin  = ff_l2t_l2b_evict_en_r0_d1_scanout;
assign ff_l2t_sii_wib_dequeue_scanin = ff_cycle_count_in_scanout;
assign ff_l2t_sii_wib_dequeue_delay_scanin = ff_l2t_sii_wib_dequeue_scanout;
assign ff_l2t_dbg_sii_wib_dequeue_scanin = ff_l2t_sii_wib_dequeue_delay_scanout;
assign ff_quad_state_scanin      = ff_l2t_dbg_sii_wib_dequeue_scanout;
assign ff_quad0_state_scanin     = ff_quad_state_scanout    ;
assign ff_quad1_state_scanin     = ff_quad0_state_scanout   ;
assign ff_quad2_state_scanin     = ff_quad1_state_scanout   ;
assign ff_wb_count_scanin        = ff_quad2_state_scanout   ;
assign ff_wbuf_arb_full_px1_scanin = ff_wb_count_scanout      ;
assign scan_out                  = ff_wbuf_arb_full_px1_scanout;
// fixscan end:
endmodule 







// any PARAMS parms go into naming of macro

module l2t_wbuf_ctl_msff_ctl_macro__width_1 (
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

module l2t_wbuf_ctl_l1clkhdr_ctl_macro (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module l2t_wbuf_ctl_spare_ctl_macro__num_4 (
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
wire si_2;
wire so_2;
wire spare2_flop_unused;
wire spare2_buf_32x_unused;
wire spare2_nand3_8x_unused;
wire spare2_inv_8x_unused;
wire spare2_aoi22_4x_unused;
wire spare2_buf_8x_unused;
wire spare2_oai22_4x_unused;
wire spare2_inv_16x_unused;
wire spare2_nand2_16x_unused;
wire spare2_nor3_4x_unused;
wire spare2_nand2_8x_unused;
wire spare2_buf_16x_unused;
wire spare2_nor2_16x_unused;
wire spare2_inv_32x_unused;
wire si_3;
wire so_3;
wire spare3_flop_unused;
wire spare3_buf_32x_unused;
wire spare3_nand3_8x_unused;
wire spare3_inv_8x_unused;
wire spare3_aoi22_4x_unused;
wire spare3_buf_8x_unused;
wire spare3_oai22_4x_unused;
wire spare3_inv_16x_unused;
wire spare3_nand2_16x_unused;
wire spare3_nor3_4x_unused;
wire spare3_nand2_8x_unused;
wire spare3_buf_16x_unused;
wire spare3_nor2_16x_unused;
wire spare3_inv_32x_unused;


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

cl_sc1_msff_8x spare2_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_2),
                               .so(so_2),
                               .d(1'b0),
                               .q(spare2_flop_unused));
assign si_2 = so_1;

cl_u1_buf_32x   spare2_buf_32x (.in(1'b1),
                                   .out(spare2_buf_32x_unused));
cl_u1_nand3_8x spare2_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare2_nand3_8x_unused));
cl_u1_inv_8x    spare2_inv_8x (.in(1'b1),
                                  .out(spare2_inv_8x_unused));
cl_u1_aoi22_4x spare2_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_aoi22_4x_unused));
cl_u1_buf_8x    spare2_buf_8x (.in(1'b1),
                                  .out(spare2_buf_8x_unused));
cl_u1_oai22_4x spare2_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_oai22_4x_unused));
cl_u1_inv_16x   spare2_inv_16x (.in(1'b1),
                                   .out(spare2_inv_16x_unused));
cl_u1_nand2_16x spare2_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare2_nand2_16x_unused));
cl_u1_nor3_4x spare2_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare2_nor3_4x_unused));
cl_u1_nand2_8x spare2_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare2_nand2_8x_unused));
cl_u1_buf_16x   spare2_buf_16x (.in(1'b1),
                                   .out(spare2_buf_16x_unused));
cl_u1_nor2_16x spare2_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare2_nor2_16x_unused));
cl_u1_inv_32x   spare2_inv_32x (.in(1'b1),
                                   .out(spare2_inv_32x_unused));

cl_sc1_msff_8x spare3_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_3),
                               .so(so_3),
                               .d(1'b0),
                               .q(spare3_flop_unused));
assign si_3 = so_2;

cl_u1_buf_32x   spare3_buf_32x (.in(1'b1),
                                   .out(spare3_buf_32x_unused));
cl_u1_nand3_8x spare3_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare3_nand3_8x_unused));
cl_u1_inv_8x    spare3_inv_8x (.in(1'b1),
                                  .out(spare3_inv_8x_unused));
cl_u1_aoi22_4x spare3_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_aoi22_4x_unused));
cl_u1_buf_8x    spare3_buf_8x (.in(1'b1),
                                  .out(spare3_buf_8x_unused));
cl_u1_oai22_4x spare3_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_oai22_4x_unused));
cl_u1_inv_16x   spare3_inv_16x (.in(1'b1),
                                   .out(spare3_inv_16x_unused));
cl_u1_nand2_16x spare3_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare3_nand2_16x_unused));
cl_u1_nor3_4x spare3_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare3_nor3_4x_unused));
cl_u1_nand2_8x spare3_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare3_nand2_8x_unused));
cl_u1_buf_16x   spare3_buf_16x (.in(1'b1),
                                   .out(spare3_buf_16x_unused));
cl_u1_nor2_16x spare3_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare3_nor2_16x_unused));
cl_u1_inv_32x   spare3_inv_32x (.in(1'b1),
                                   .out(spare3_inv_32x_unused));
assign scan_out = so_3;



endmodule






// any PARAMS parms go into naming of macro

module l2t_wbuf_ctl_msff_ctl_macro__dmsff_32x__width_1 (
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

module l2t_wbuf_ctl_msff_ctl_macro__width_16 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = din[15:0];






dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_wbuf_ctl_msff_ctl_macro__width_8 (
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













// any PARAMS parms go into naming of macro

module l2t_wbuf_ctl_msff_ctl_macro__width_3 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0];






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_wbuf_ctl_msff_ctl_macro__clr_1__width_8 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0] & ~{8{clr}};






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













// any PARAMS parms go into naming of macro

module l2t_wbuf_ctl_msff_ctl_macro__width_10 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [9:0] fdin;
wire [8:0] so;

  input [9:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [9:0] dout;
  output scan_out;
assign fdin[9:0] = din[9:0];






dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_wbuf_ctl_msff_ctl_macro__en_1__width_5 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = (din[4:0] & {5{en}}) | (dout[4:0] & ~{5{en}});






dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_wbuf_ctl_msff_ctl_macro__clr_1__width_1 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0] & ~{1{clr}};






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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_wbuf_ctl_mux_ctl_macro__mux_aonpe__ports_4__width_5 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
  input [4:0] din0;
  input sel0;
  input [4:0] din1;
  input sel1;
  input [4:0] din2;
  input sel2;
  input [4:0] din3;
  input sel3;
  output [4:0] dout;





assign dout[4:0] = ( {5{sel0}} & din0[4:0] ) |
                       ( {5{sel1}} & din1[4:0]) |
                       ( {5{sel2}} & din2[4:0]) |
                       ( {5{sel3}} & din3[4:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_wbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_5 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [4:0] din0;
  input sel0;
  input [4:0] din1;
  input sel1;
  output [4:0] dout;





assign dout[4:0] = ( {5{sel0}} & din0[4:0] ) |
                       ( {5{sel1}} & din1[4:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_wbuf_ctl_mux_ctl_macro__mux_aonpe__ports_2__width_4 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [3:0] din0;
  input sel0;
  input [3:0] din1;
  input sel1;
  output [3:0] dout;





assign dout[3:0] = ( {4{sel0}} & din0[3:0] ) |
                       ( {4{sel1}} & din1[3:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_wbuf_ctl_msff_ctl_macro__clr_1__width_4 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0] & ~{4{clr}};






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













// any PARAMS parms go into naming of macro

module l2t_wbuf_ctl_msff_ctl_macro__en_1__width_8 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = (din[7:0] & {8{en}}) | (dout[7:0] & ~{8{en}});






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













// any PARAMS parms go into naming of macro

module l2t_wbuf_ctl_msff_ctl_macro__en_1__width_1 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}}) | (dout[0:0] & ~{1{en}});






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

module l2t_wbuf_ctl_msff_ctl_macro__en_1__width_2 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = (din[1:0] & {2{en}}) | (dout[1:0] & ~{2{en}});






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













// any PARAMS parms go into naming of macro

module l2t_wbuf_ctl_msff_ctl_macro__en_1__width_4 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = (din[3:0] & {4{en}}) | (dout[3:0] & ~{4{en}});






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













// any PARAMS parms go into naming of macro

module l2t_wbuf_ctl_msff_ctl_macro__en_1__width_3 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = (din[2:0] & {3{en}}) | (dout[2:0] & ~{3{en}});






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_wbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_3 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
  input [2:0] din0;
  input sel0;
  input [2:0] din1;
  input sel1;
  input [2:0] din2;
  input sel2;
  output [2:0] dout;





assign dout[2:0] = ( {3{sel0}} & din0[2:0] ) |
                       ( {3{sel1}} & din1[2:0]) |
                       ( {3{sel2}} & din2[2:0]);





endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module l2t_wbuf_ctl_mux_ctl_macro__mux_aonpe__ports_3__width_4 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
  input [3:0] din0;
  input sel0;
  input [3:0] din1;
  input sel1;
  input [3:0] din2;
  input sel2;
  output [3:0] dout;





assign dout[3:0] = ( {4{sel0}} & din0[3:0] ) |
                       ( {4{sel1}} & din1[3:0]) |
                       ( {4{sel2}} & din2[3:0]);





endmodule






// any PARAMS parms go into naming of macro

module l2t_wbuf_ctl_msff_ctl_macro__width_4 (
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








