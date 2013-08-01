// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_cmu_lsi_ctl.v
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
module ifu_cmu_lsi_ctl (
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  const_cpuid, 
  mct_early_req, 
  ftu_cmiss, 
  ftu_rep_way, 
  ftu_thrx_un_cacheable, 
  ifu_l15_addr, 
  csm_valid_req, 
  l15_spc_data1, 
  l15_spc_cpkt, 
  l15_ifu_valid, 
  l15_ifu_grant, 
  lsu_ifu_ld_index, 
  cmu_fill_paddr, 
  mdp_lsi_nc_bit, 
  mdp_lsi_inv_bit, 
  mdp_lsi_rway, 
  lsu_ifu_cmu_pmen, 
  lsc_fill_rtn1, 
  lsc_fill_rtn2, 
  lsc_req_sel, 
  lsc_pending_req, 
  lsc_l15_valid, 
  lsc_data_sel, 
  cmu_any_data_ready, 
  cmu_any_un_cacheable, 
  cmu_data_ready, 
  cmu_inst0_v, 
  cmu_inst1_v, 
  cmu_inst2_v, 
  cmu_inst3_v, 
  cmu_icache_invalidate, 
  cmu_icache_invalidate_way, 
  cmu_icache_invalidate_index, 
  cmu_evic_invalidate, 
  cmu_icache_inv_way1, 
  cmu_inval_ack, 
  cmu_l2_err, 
  cmu_l2miss, 
  ifu_l15_valid, 
  ifu_l15_cpkt, 
  lsc_clken, 
  ifu_lsu_if_vld, 
  ifu_lsu_if_tid, 
  ifu_lsu_if_addr, 
  scan_out) ;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire go_to_l15_empty;
wire l15_one_buff_state;
wire l15_empty_state;
wire leave_l15_empty;
wire next_l15_empty;
wire next_l15_empty_;
wire empty_state_reg_scanin;
wire empty_state_reg_scanout;
wire l15_empty_state_;
wire go_to_l15_one_buff;
wire l15_hold_state;
wire leave_l15_one_buff;
wire next_l15_one_buff;
wire one_buff_state_reg_scanin;
wire one_buff_state_reg_scanout;
wire go_to_l15_hold;
wire leave_l15_hold;
wire next_l15_hold;
wire l15_hold_state_reg_scanin;
wire l15_hold_state_reg_scanout;
wire gkt_room_avail_in;
wire [7:0] csm_rqv;
wire lsc_early_req;
wire [2:0] req_sel_tid;
wire [2:0] cmiss_tid;
wire ifu_l15_valid_in;
wire [7:0] lsc_l15_valid_in;
wire [2:0] ifu_l15_tid_in;
wire [2:0] ifu_l15_rway_in;
wire ifu_l15_nc_in;
wire ifu_l15_inv_in;
wire tg0_selected_in;
wire tg1_selected_in;
wire ifu_l15_valid_reg_scanin;
wire ifu_l15_valid_reg_scanout;
wire tg0_selected;
wire tg1_selected;
wire lsc_l15_valid_reg_scanin;
wire lsc_l15_valid_reg_scanout;
wire [7:0] lsc_l15_pre_valid;
wire lsc_req_sel_reg_scanin;
wire lsc_req_sel_reg_scanout;
wire [7:0] lsc_req_sel_lat;
wire lsc_cpkt_reg_scanin;
wire lsc_cpkt_reg_scanout;
wire [2:0] cpuid;
wire [2:0] ifu_l15_rway;
wire ifu_l15_nc;
wire ifu_l15_inv;
wire [2:0] ifu_l15_tid;
wire ifu_lsu_lat_scanin;
wire ifu_lsu_lat_scanout;
wire favor_tg1_in;
wire favor_tg1;
wire favour_bit_reg_scanin;
wire favour_bit_reg_scanout;
wire [3:0] thr_ptr0;
wire [3:0] thr_ptr0_lat;
wire thr_ptr0_lat_0_;
wire [7:4] thr_ptr1;
wire [7:4] thr_ptr1_lat;
wire thr_ptr1_lat_4_;
wire thr_ptr0_0_;
wire thr_ptr1_4_;
wire ptr0_reg_scanin;
wire ptr0_reg_scanout;
wire ptr1_reg_scanin;
wire ptr1_reg_scanout;
wire [7:0] req_bit;
wire tg0_valid;
wire tg1_valid;
wire sel_tg1;
wire reg_pmen_scanin;
wire reg_pmen_scanout;
wire ifu_pmen;
wire [3:0] l15_rtn_type;
wire fill_return;
wire cmu_nc_f4b;
wire second_pkt;
wire second_pkt_in;
wire sec_pkt_lat_scanin;
wire sec_pkt_lat_scanout;
wire [1:0] cmu_l2_err_pkt1_in;
wire stg_r1_lat0_scanin;
wire stg_r1_lat0_scanout;
wire [1:0] cmu_l2_err_pkt1;
wire cmu_l2miss_in;
wire cmu_inst0_v_in;
wire cmu_inst1_v_in;
wire cmu_inst2_v_in;
wire cmu_inst3_v_in;
wire cmu_inst_reg_scanin;
wire cmu_inst_reg_scanout;
wire [31:0] store_inval_vector;
wire [31:0] evic_inv_vec_0;
wire [31:0] evic_inv_vec_1;
wire take_strm_store_ack;
wire take_store_ack;
wire take_inval_ack;
wire take_load_return;
wire take_evic_inv;
wire [7:0] cmu_inval_ack_din;
wire [3:0] inv_vector;
wire evic_i_inv_0_true;
wire [2:0] evic_inv_way0;
wire evic_i_inv_1_true;
wire [2:0] evic_inv_way1;
wire str_strm_invalidate;
wire cross_invalidate;
wire evic_invalidate_w0;
wire evic_invalidate_w1;
wire evic_invalidate_w01;
wire evic_invalidate_any;
wire [2:0] evic_way0;
wire [10:5] evic_index;
wire cmu_icache_invalidate_din;
wire [2:0] cmu_icache_invalidate_way_din;
wire [10:5] cmu_icache_invalidate_index_din;
wire cmu_evic_invalidate_din;
wire [2:0] cmu_icache_inv_way1_din;
wire stg_r1_lat_scanin;
wire stg_r1_lat_scanout;
wire [23:0] l15_spc_data_55_32_unused;
wire [15:0] l15_spc_data_111_96_unused;
wire [4:0] l15_spc_data_121_117_unused;
wire [2:0] l15_spc_data_127_125_unused;
wire [1:0] l15_spc_cpkt_1_0_unused;
wire l15_spc_cpkt_13_unused;
wire spares_so_0;
wire spares_scanout;
wire spares_scanin;
wire out;
wire q;


input tcu_scan_en ;
input l2clk;
input scan_in;
input tcu_pce_ov;               // scan signals
input spc_aclk;
input spc_bclk;

input [2:0]   const_cpuid;
input mct_early_req;
input [7:0] ftu_cmiss;                //from ftu tsm
input [2:0]   ftu_rep_way;            // incoming replacement way from ftu
input         ftu_thrx_un_cacheable;  // incoming cacheable bit from ftu


input [10:5]  ifu_l15_addr;
input [7:0]   csm_valid_req;


input [127:0] l15_spc_data1;
input [17:0]  l15_spc_cpkt;
input         l15_ifu_valid;
input         l15_ifu_grant;           //ACK from gkt when req is accepted

input [10:5]  lsu_ifu_ld_index;        // on a load retn, lsu sends load index for cross invalidates, 

input [4:2]   cmu_fill_paddr;      //bits {4,3,2} of the fill phys addr

input         mdp_lsi_nc_bit;          // Cacheable bit from Missbuffer
input         mdp_lsi_inv_bit;         // Inv req bit from Missbuffer
input [2:0]   mdp_lsi_rway;            // way information from missbuffer

input         lsu_ifu_cmu_pmen;


output        lsc_fill_rtn1;            //enable for fill ready data to lsi_dp
output        lsc_fill_rtn2;            //enable for fill ready data to lsi_dp
output [7:0]  lsc_req_sel;              // selected thread from pending requests
output        lsc_pending_req;
output [7:0]  lsc_l15_valid;             //req for thr0 ACKed by LSU, to TSM (indicates req accepted)

output [7:0]  lsc_data_sel;            // decoded selects for muxing out instructions


output        cmu_any_data_ready;
output        cmu_any_un_cacheable;

output [7:0]  cmu_data_ready;          //data ready for thr0

output        cmu_inst0_v;          // valid for instruction 0
output        cmu_inst1_v;          // valid for instruction 1
output        cmu_inst2_v;          // valid for instruction 2
output        cmu_inst3_v;          // valid for instruction 3

output        cmu_icache_invalidate;                     //invalidate icache request
output [2:0]  cmu_icache_invalidate_way;          
output [10:5] cmu_icache_invalidate_index;

output        cmu_evic_invalidate;                      // eviction invalidation
output [2:0]  cmu_icache_inv_way1;

output [7:0]  cmu_inval_ack;
output [1:0]  cmu_l2_err;
output        cmu_l2miss;                              // l2miss indicator on rtn pkt

output        ifu_l15_valid;             // ifu_l15_valid, valid pcx pkt
output [7:0] ifu_l15_cpkt;

output        lsc_clken;

// **** LSU Interface ****
output        ifu_lsu_if_vld;
output [2:0]  ifu_lsu_if_tid;
output [10:5] ifu_lsu_if_addr;

output        scan_out;


// scan renames
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = spc_aclk;
assign soclk = spc_bclk;
assign se = tcu_scan_en ;
// end scan


///////////////////////////////////////////////////
// clock header
///////////////////////////////////////////////////
ifu_cmu_lsi_ctl_l1clkhdr_ctl_macro clkgen (
 .l2clk(l2clk),
 .l1en (1'b1 ),
 .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

/////////////////////////////////////////////////////////
// Create a state_machine to keep track of L15 buffers //
/////////////////////////////////////////////////////////
// Empty state: L15 has both IFU buffers empty. IFU    //
// can send two requests back to back.                 //
/////////////////////////////////////////////////////////
assign go_to_l15_empty = (l15_one_buff_state & l15_ifu_grant & ~ifu_l15_valid) | 
                         (l15_empty_state    & ~ifu_l15_valid) ;
assign leave_l15_empty = (l15_empty_state    &  ifu_l15_valid) ;

assign next_l15_empty = (go_to_l15_empty & ~leave_l15_empty) ;
assign next_l15_empty_ = ~next_l15_empty ;

ifu_cmu_lsi_ctl_msff_ctl_macro__width_1 empty_state_reg  (
 .scan_in(empty_state_reg_scanin),
 .scan_out(empty_state_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_l15_empty_),
 .dout (l15_empty_state_),
  .siclk(siclk),
  .soclk(soclk)
);

assign l15_empty_state = ~l15_empty_state_ ;

/////////////////////////////////////////////////////////
// One buffer state: L15 has one buffer empty. We can  //
// send only one more request before we get grants.    //
/////////////////////////////////////////////////////////
assign go_to_l15_one_buff = (l15_hold_state  & l15_ifu_grant & ~ifu_l15_valid)     |  // Coming back from hold state
                            (l15_empty_state & ifu_l15_valid)                      |  // Coming from empty state
                            (l15_one_buff_state & ~ifu_l15_valid & ~l15_ifu_grant) |  // Nothing happened: stay in this state
                            (l15_one_buff_state &  ifu_l15_valid &  l15_ifu_grant) ;  // Request accepted and new one issued

assign leave_l15_one_buff = (l15_one_buff_state &  l15_ifu_grant & ~ifu_l15_valid) |
                            (l15_one_buff_state & ~l15_ifu_grant &  ifu_l15_valid) ;                         

assign next_l15_one_buff = go_to_l15_one_buff & ~leave_l15_one_buff ;

ifu_cmu_lsi_ctl_msff_ctl_macro__width_1 one_buff_state_reg  (
 .scan_in(one_buff_state_reg_scanin),
 .scan_out(one_buff_state_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_l15_one_buff),
 .dout (l15_one_buff_state),
  .siclk(siclk),
  .soclk(soclk)
);

/////////////////////////////////////////////////////////
// Hold state: L15 has no more room for IFU requests.  //
// Do not send any more requests until l15_ifu_grant is//
// recieved.                                           //
/////////////////////////////////////////////////////////
assign go_to_l15_hold = (l15_one_buff_state & ifu_l15_valid & ~l15_ifu_grant) |
                        (l15_hold_state     & ifu_l15_valid &  l15_ifu_grant) |
                        (l15_hold_state     & ~l15_ifu_grant) ;

assign leave_l15_hold = (l15_hold_state & ~ifu_l15_valid & l15_ifu_grant) ;

assign next_l15_hold  =  go_to_l15_hold & ~leave_l15_hold ;
ifu_cmu_lsi_ctl_msff_ctl_macro__width_1 l15_hold_state_reg  (
 .scan_in(l15_hold_state_reg_scanin),
 .scan_out(l15_hold_state_reg_scanout),
 .l1clk( l1clk ),
 .din  (next_l15_hold),
 .dout (l15_hold_state),
  .siclk(siclk),
  .soclk(soclk)
);

// ok to send a request to gkt next cycle.
assign gkt_room_avail_in   = next_l15_empty | next_l15_one_buff ;

///////////////////////////////////////////////////
// Select request sent  to gkt.
// If there are no pending requests, and a new request is coming
// in this cycle, then the new request can be sent out to
// gasket next cycle (cycle after C stage).
// This is called "early_request".
// Only cmiss can be an early request. Inval req cannot be sent out
// early.
// If there are pending requests, then the pending request will
// have higher priority and it will get sent out.
// On reset, select_pending_req will be 0.
///////////////////////////////////////////////////

// Qualify the pending requests with the request sent last cycle.
// Thread remains in REQ_ST the cycle it is being launched to
// gkt.
// We do not want it to take part in arbitration again.

//0in bits_on -var {lsc_l15_valid_in[7:0]} -max 1

assign csm_rqv[7:0] = csm_valid_req[7:0] & ~lsc_l15_valid[7:0] ; 

assign lsc_pending_req = |(csm_rqv[7:0]);
assign lsc_early_req = mct_early_req;

assign req_sel_tid[0] = lsc_req_sel[1] | lsc_req_sel[3] | lsc_req_sel[5] | lsc_req_sel[7];
assign req_sel_tid[1] = lsc_req_sel[2] | lsc_req_sel[3] | lsc_req_sel[6] | lsc_req_sel[7];
assign req_sel_tid[2] = lsc_req_sel[4] | lsc_req_sel[5] | lsc_req_sel[6] | lsc_req_sel[7];

assign cmiss_tid[0] = ftu_cmiss[1] | ftu_cmiss[3] | ftu_cmiss[5] | ftu_cmiss[7];
assign cmiss_tid[1] = ftu_cmiss[2] | ftu_cmiss[3] | ftu_cmiss[6] | ftu_cmiss[7];
assign cmiss_tid[2] = ftu_cmiss[4] | ftu_cmiss[5] | ftu_cmiss[6] | ftu_cmiss[7];

assign ifu_l15_valid_in = (lsc_pending_req | lsc_early_req) & gkt_room_avail_in;

assign lsc_l15_valid_in[7:0] = ({8{lsc_pending_req }} & lsc_req_sel[7:0]) |
                               ({8{~lsc_pending_req}} & ftu_cmiss[7:0]);

assign ifu_l15_tid_in[2:0]  =  ({3{lsc_pending_req }} & req_sel_tid[2:0]) |
                               ({3{~lsc_pending_req}} & cmiss_tid[2:0]);

assign ifu_l15_rway_in[2:0] =  ({3{lsc_pending_req }} & mdp_lsi_rway[2:0]) |
                               ({3{~lsc_pending_req}} & ftu_rep_way[2:0]);

assign ifu_l15_nc_in = (lsc_pending_req  & mdp_lsi_nc_bit) |
                       (~lsc_pending_req & ftu_thrx_un_cacheable);

// inval req cannot be sent early
assign ifu_l15_inv_in = lsc_pending_req & mdp_lsi_inv_bit;

assign tg0_selected_in = |(lsc_req_sel[3:0]) & gkt_room_avail_in;
assign tg1_selected_in = |(lsc_req_sel[7:4]) & gkt_room_avail_in;

ifu_cmu_lsi_ctl_msff_ctl_macro__width_3 ifu_l15_valid_reg  (
 .scan_in(ifu_l15_valid_reg_scanin),
 .scan_out(ifu_l15_valid_reg_scanout),
 .l1clk( l1clk ),
 .din  ({ifu_l15_valid_in, tg0_selected_in, tg1_selected_in}),
 .dout ({ifu_l15_valid, tg0_selected, tg1_selected}),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_cmu_lsi_ctl_msff_ctl_macro__width_8 lsc_l15_valid_reg  (
 .scan_in(lsc_l15_valid_reg_scanin),
 .scan_out(lsc_l15_valid_reg_scanout),
 .l1clk( l1clk ),
 .din  (lsc_l15_valid_in[7:0]),
 .dout (lsc_l15_pre_valid[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_cmu_lsi_ctl_msff_ctl_macro__width_8 lsc_req_sel_reg  (
 .scan_in(lsc_req_sel_reg_scanin),
 .scan_out(lsc_req_sel_reg_scanout),
 .l1clk( l1clk ),
 .din  (lsc_req_sel[7:0]),
 .dout (lsc_req_sel_lat[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_cmu_lsi_ctl_msff_ctl_macro__width_11 lsc_cpkt_reg  (
 .scan_in(lsc_cpkt_reg_scanin),
 .scan_out(lsc_cpkt_reg_scanout),
 .l1clk( l1clk ),
 .din  ({const_cpuid[2:0],  ifu_l15_rway_in[2:0], ifu_l15_nc_in, ifu_l15_inv_in, ifu_l15_tid_in[2:0]}),
 .dout ({cpuid[2:0], ifu_l15_rway[2:0], ifu_l15_nc, ifu_l15_inv, ifu_l15_tid[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

assign lsc_l15_valid[7:0] = lsc_l15_pre_valid[7:0] & {8{ifu_l15_valid}};

//assign ifu_l15_cpkt[25:0] = {ifu_l15_valid, ifu_l15_req_type[4:0], ifu_l15_nc, ifu_l15_cpuid[2:0], 
//                             ifu_l15_tid[2:0], ifu_l15_inv, ifu_l15_pf, ifu_l15_rway[2:0], ifu_l15_size[7:0]};

// Actual ifu_l15_cpkt has following fields
// ifu_l15_cpkt[25]   = ifu_l15_valid
// ifu_l15_cpkt[24:20] = ifu_l15_req_type[4:0] = 5'b10000
// ifu_l15_cpkt[19]   = ifu_l15_nc
// ifu_l15_cpkt[18:16] = ifu_l15_cpuid[2:0]
// ifu_l15_cpkt[15:13] = ifu_l15_tid[2:0]
// ifu_l15_cpkt[12]    = ifu_l15_inv
// ifu_l15_cpkt[11]    = ifu_l15_pf = 0
// ifu_l15_cpkt[10:8] = ifu_l15_rway[2:0]
// ifu_l15_cpkt[7:0] = ifu_l15_size[7:0] = 0

// ifu_l15_cpkt is compressed to 8 bits. gkt converts this to final ifu packet
assign ifu_l15_cpkt[7:0] = {ifu_l15_nc, ifu_l15_inv, ifu_l15_rway[2:0], ifu_l15_tid[2:0]};



///////////////////////////////////////////////////
// Generating following signals for LSU cross_invalidate
///////////////////////////////////////////////////
ifu_cmu_lsi_ctl_msff_ctl_macro__width_10 ifu_lsu_lat  (
 .scan_in(ifu_lsu_lat_scanin),
 .scan_out(ifu_lsu_lat_scanout),
 .l1clk( l1clk ),
 .din  ({ifu_l15_valid,
         ifu_l15_tid[2:0],
         ifu_l15_addr[10:5]}),
 .dout ({ifu_lsu_if_vld,
         ifu_lsu_if_tid[2:0],
         ifu_lsu_if_addr[10:5]}),
  .siclk(siclk),
  .soclk(soclk)
);


///////////////////////////////////////////////////
// Logic for selecting pending request
///////////////////////////////////////////////////
// Thread are divided into two groups.
// A single favor bit will select alternatingly between the 2 groups.
// Within a group, the threads will be prioritized based on a 4-bit rotating pointer.
// The pointer always points to the thread with highest priority, and it gets updated
// when a thread gets selected. The pointer updates such that the selected thread will
// have the least priority.

// The group is selected based on a favor bit.
// The favor bit is updated based on what was selected last cycle

assign favor_tg1_in = (favor_tg1 & ~tg1_selected) | tg0_selected;

ifu_cmu_lsi_ctl_msff_ctl_macro__width_1 favour_bit_reg  (
 .scan_in(favour_bit_reg_scanin),
 .scan_out(favour_bit_reg_scanout),
 .l1clk( l1clk ),
 .din  (favor_tg1_in),
 .dout (favor_tg1),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////
// Form the rotating pointer used to prioritize among threads
// The pointer is updated when a thread group is selected, in a way that
// gives the selected thread the least priority
///////////////////////////////////////////////////
assign thr_ptr0[3:0] = tg0_selected ? ({lsc_req_sel_lat[2:0],lsc_req_sel_lat[3]}): {thr_ptr0_lat[3:1],thr_ptr0_lat_0_};
assign thr_ptr1[7:4] = tg1_selected ? ({lsc_req_sel_lat[6:4],lsc_req_sel_lat[7]}): {thr_ptr1_lat[7:5],thr_ptr1_lat_4_};

assign thr_ptr0_0_ = ~thr_ptr0[0];
assign thr_ptr1_4_ = ~thr_ptr1[4];

ifu_cmu_lsi_ctl_msff_ctl_macro__width_4 ptr0_reg  (
 .scan_in(ptr0_reg_scanin),
 .scan_out(ptr0_reg_scanout),
 .l1clk( l1clk ),
 .din  ({thr_ptr0[3:1],thr_ptr0_0_}),
 .dout ({thr_ptr0_lat[3:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_cmu_lsi_ctl_msff_ctl_macro__width_4 ptr1_reg  (
 .scan_in(ptr1_reg_scanin),
 .scan_out(ptr1_reg_scanout),
 .l1clk( l1clk ),
 .din  ({thr_ptr1[7:5],thr_ptr1_4_}),
 .dout ({thr_ptr1_lat[7:4]}),
  .siclk(siclk),
  .soclk(soclk)
);

assign thr_ptr0_lat_0_ = ~thr_ptr0_lat[0];
assign thr_ptr1_lat_4_ = ~thr_ptr1_lat[4];

///////////////////////////////////////////////////
// select a thread based on the pointer value
///////////////////////////////////////////////////
assign req_bit[0] = (thr_ptr0[1] & ~csm_rqv[1] & ~csm_rqv[2] & ~csm_rqv[3] & csm_rqv[0]) |
                    (thr_ptr0[2] &               ~csm_rqv[2] & ~csm_rqv[3] & csm_rqv[0]) |
                    (thr_ptr0[3] &                             ~csm_rqv[3] & csm_rqv[0]) |
                    (thr_ptr0[0] &                                           csm_rqv[0]);

                    
assign req_bit[1] = (thr_ptr0[2] & ~csm_rqv[2] & ~csm_rqv[3] & ~csm_rqv[0] & csm_rqv[1]) |
                    (thr_ptr0[3] &               ~csm_rqv[3] & ~csm_rqv[0] & csm_rqv[1]) | 
                    (thr_ptr0[0] &                             ~csm_rqv[0] & csm_rqv[1]) |
                    (thr_ptr0[1] &                                           csm_rqv[1]);

                    
assign req_bit[2] = (thr_ptr0[3] & ~csm_rqv[3] & ~csm_rqv[0] & ~csm_rqv[1] & csm_rqv[2]) |
                    (thr_ptr0[0] &               ~csm_rqv[0] & ~csm_rqv[1] & csm_rqv[2]) |
                    (thr_ptr0[1] &                             ~csm_rqv[1] & csm_rqv[2]) |
                    (thr_ptr0[2] &                                           csm_rqv[2]);
                    

assign req_bit[3] = (thr_ptr0[0] & ~csm_rqv[0] & ~csm_rqv[1] & ~csm_rqv[2] & csm_rqv[3]) |
                    (thr_ptr0[1] &               ~csm_rqv[1] & ~csm_rqv[2] & csm_rqv[3]) |
                    (thr_ptr0[2] &                             ~csm_rqv[2] & csm_rqv[3]) |
                    (thr_ptr0[3] &                                           csm_rqv[3]);

                    

assign req_bit[4] = (thr_ptr1[5] & ~csm_rqv[5] & ~csm_rqv[6] & ~csm_rqv[7] & csm_rqv[4]) |
                    (thr_ptr1[6] &               ~csm_rqv[6] & ~csm_rqv[7] & csm_rqv[4]) |
                    (thr_ptr1[7] &                             ~csm_rqv[7] & csm_rqv[4]) |
                    (thr_ptr1[4] &                                           csm_rqv[4]);


assign req_bit[5] = (thr_ptr1[6] & ~csm_rqv[6] & ~csm_rqv[7] & ~csm_rqv[4] & csm_rqv[5]) |
                    (thr_ptr1[7] &               ~csm_rqv[7] & ~csm_rqv[4] & csm_rqv[5]) | 
                    (thr_ptr1[4] &                             ~csm_rqv[4] & csm_rqv[5]) |
                    (thr_ptr1[5] &                                           csm_rqv[5]);
                    

assign req_bit[6] = (thr_ptr1[7] & ~csm_rqv[7] & ~csm_rqv[4] & ~csm_rqv[5] & csm_rqv[6]) |
                    (thr_ptr1[4] &               ~csm_rqv[4] & ~csm_rqv[5] & csm_rqv[6]) |
                    (thr_ptr1[5] &                             ~csm_rqv[5] & csm_rqv[6]) |
                    (thr_ptr1[6] &                                           csm_rqv[6]);
 

assign req_bit[7] = (thr_ptr1[4] & ~csm_rqv[4] & ~csm_rqv[5] & ~csm_rqv[6] & csm_rqv[7]) |
                    (thr_ptr1[5] &               ~csm_rqv[5] & ~csm_rqv[6] & csm_rqv[7]) |
                    (thr_ptr1[6] &                             ~csm_rqv[6] & csm_rqv[7]) |
                    (thr_ptr1[7] &                                           csm_rqv[7]);


// select the req based on favor bits
assign tg0_valid = |(csm_rqv[3:0]);
assign tg1_valid = |(csm_rqv[7:4]);

assign sel_tg1 = (favor_tg1_in & tg1_valid) | ~tg0_valid;

assign lsc_req_sel[7:0] = ({8{sel_tg1}} & {req_bit[7:4],4'b0000}) |
                          ({8{~sel_tg1}} & {4'b0000,req_bit[3:0]});

// update tg0/tg1 pointers

///////////////////////////////////////////////////
///////////////////////////////////////////////////

///////////////////////////////////////////////////
// RETURN DATA TO IFU
///////////////////////////////////////////////////
// Decode l15_rtn_type opcode and generate enables
// for fill data registers in DP block.
///////////////////////////////////////////////////
ifu_cmu_lsi_ctl_msff_ctl_macro__width_1 reg_pmen  (
 .scan_in(reg_pmen_scanin),
 .scan_out(reg_pmen_scanout),
 .l1clk( l1clk ),
 .din  (lsu_ifu_cmu_pmen),
 .dout (ifu_pmen),
  .siclk(siclk),
  .soclk(soclk)
);

// decode return pkt

assign lsc_clken = l15_ifu_valid | ~ifu_pmen;

assign l15_rtn_type[3:0] = l15_spc_cpkt[17:14];

assign fill_return = ~l15_rtn_type[2] & ~l15_rtn_type[1] & l15_rtn_type[0] & l15_ifu_valid; 

assign cmu_nc_f4b = l15_spc_cpkt[9] & l15_spc_cpkt[2];

assign lsc_fill_rtn1 = fill_return & ~second_pkt;
assign lsc_fill_rtn2 = (fill_return & second_pkt) | (fill_return & cmu_nc_f4b);

// set up state for second pkt of a two pkt ifill return.
// non-cacheable and f4b ifill returns (nc_f4b_r0) are single pkt.
assign second_pkt_in = ((second_pkt & ~fill_return) | (~second_pkt & fill_return & ~cmu_nc_f4b)) & ~(second_pkt & fill_return);
 
ifu_cmu_lsi_ctl_msff_ctl_macro__width_1 sec_pkt_lat  (
 .scan_in(sec_pkt_lat_scanin),
 .scan_out(sec_pkt_lat_scanout),
 .l1clk(l1clk),
 .din  (second_pkt_in),
 .dout (second_pkt),
  .siclk(siclk),
  .soclk(soclk)
);
 

assign cmu_data_ready[0] = ~l15_spc_cpkt[8] & ~l15_spc_cpkt[7] & ~l15_spc_cpkt[6] & lsc_fill_rtn2;
assign cmu_data_ready[1] = ~l15_spc_cpkt[8] & ~l15_spc_cpkt[7] &  l15_spc_cpkt[6] & lsc_fill_rtn2;
assign cmu_data_ready[2] = ~l15_spc_cpkt[8] &  l15_spc_cpkt[7] & ~l15_spc_cpkt[6] & lsc_fill_rtn2;
assign cmu_data_ready[3] = ~l15_spc_cpkt[8] &  l15_spc_cpkt[7] &  l15_spc_cpkt[6] & lsc_fill_rtn2;
assign cmu_data_ready[4] =  l15_spc_cpkt[8] & ~l15_spc_cpkt[7] & ~l15_spc_cpkt[6] & lsc_fill_rtn2;
assign cmu_data_ready[5] =  l15_spc_cpkt[8] & ~l15_spc_cpkt[7] &  l15_spc_cpkt[6] & lsc_fill_rtn2;
assign cmu_data_ready[6] =  l15_spc_cpkt[8] &  l15_spc_cpkt[7] & ~l15_spc_cpkt[6] & lsc_fill_rtn2;
assign cmu_data_ready[7] =  l15_spc_cpkt[8] &  l15_spc_cpkt[7] &  l15_spc_cpkt[6] & lsc_fill_rtn2;


assign cmu_any_data_ready = lsc_fill_rtn2;
assign cmu_any_un_cacheable = l15_spc_cpkt[9];

///////////////////////////////////////////////////
// decode l2 err and l2 miss and send to ifu
///////////////////////////////////////////////////
//assign cmu_l2_err[1:0] = l15_spc_cpkt[11:10];

assign cmu_l2_err_pkt1_in[1:0] = ({2{lsc_fill_rtn1}} & l15_spc_cpkt[11:10]) & ~{2{lsc_fill_rtn2}};


ifu_cmu_lsi_ctl_msff_ctl_macro__width_2 stg_r1_lat0  (
 .scan_in(stg_r1_lat0_scanin),
 .scan_out(stg_r1_lat0_scanout),
 .l1clk( l1clk ),
 .din  (cmu_l2_err_pkt1_in[1:0]),
 .dout (cmu_l2_err_pkt1[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// l2 err
// 00 - no err, 01 - correctable, 10 - uncorrectable, 11 - not data
// report the worst offense if the two packets have different errors
// not_data > uncorrectable > correctable > no err


assign cmu_l2_err[1] = l15_spc_cpkt[11] | cmu_l2_err_pkt1[1];
assign cmu_l2_err[0] = ( l15_spc_cpkt[11]   &  l15_spc_cpkt[10]) |
                       ( cmu_l2_err_pkt1[1] &  cmu_l2_err_pkt1[0]) |
                       (~l15_spc_cpkt[11]   &  cmu_l2_err_pkt1[0]) |
                       ( l15_spc_cpkt[10]   & ~cmu_l2_err_pkt1[1]);



//assign cmu_l2_err[1:0] = (l15_spc_cpkt[11:10] | cmu_l2_err_pkt1[1:0]);



// l2miss is asserted on the first packet only.

assign cmu_l2miss_in = lsc_fill_rtn1 & l15_spc_cpkt[12];


///////////////////////////////////////////////////
// Word selects for muxing out instructions
///////////////////////////////////////////////////
assign cmu_inst0_v_in = lsc_fill_rtn2;
assign cmu_inst1_v_in = ~(cmu_fill_paddr[4] & cmu_fill_paddr[3] & cmu_fill_paddr[2]) & ~cmu_nc_f4b & lsc_fill_rtn2;
assign cmu_inst2_v_in = ~(cmu_fill_paddr[4] & cmu_fill_paddr[3]) & ~cmu_nc_f4b & lsc_fill_rtn2;
assign cmu_inst3_v_in = ~((cmu_fill_paddr[4] & cmu_fill_paddr[2]) | (cmu_fill_paddr[4] & cmu_fill_paddr[3])) & 
                        ~cmu_nc_f4b & lsc_fill_rtn2;


ifu_cmu_lsi_ctl_msff_ctl_macro__width_4 cmu_inst_reg  (
 .scan_in(cmu_inst_reg_scanin),
 .scan_out(cmu_inst_reg_scanout),
 .l1clk( l1clk ),
 .din  ({cmu_inst0_v_in, cmu_inst1_v_in, cmu_inst2_v_in, cmu_inst3_v_in}),
 .dout ({cmu_inst0_v, cmu_inst1_v, cmu_inst2_v, cmu_inst3_v}),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////
// Generate decodes for muxing out instructions
///////////////////////////////////////////////////
assign lsc_data_sel[0] = ~cmu_fill_paddr[4] & ~cmu_fill_paddr[3] & ~cmu_fill_paddr[2];
assign lsc_data_sel[1] = ~cmu_fill_paddr[4] & ~cmu_fill_paddr[3] &  cmu_fill_paddr[2];
assign lsc_data_sel[2] = ~cmu_fill_paddr[4] &  cmu_fill_paddr[3] & ~cmu_fill_paddr[2];
assign lsc_data_sel[3] = ~cmu_fill_paddr[4] &  cmu_fill_paddr[3] &  cmu_fill_paddr[2];
assign lsc_data_sel[4] =  cmu_fill_paddr[4] & ~cmu_fill_paddr[3] & ~cmu_fill_paddr[2];
assign lsc_data_sel[5] =  cmu_fill_paddr[4] & ~cmu_fill_paddr[3] &  cmu_fill_paddr[2];
assign lsc_data_sel[6] =  cmu_fill_paddr[4] &  cmu_fill_paddr[3] & ~cmu_fill_paddr[2];
assign lsc_data_sel[7] =  cmu_fill_paddr[4] &  cmu_fill_paddr[3] &  cmu_fill_paddr[2];


///////////////////////////////////////////////////
// Cache Invalidation 
///////////////////////////////////////////////////
assign store_inval_vector[31:0] = l15_spc_data1[95:64];
assign evic_inv_vec_0[31:0] = l15_spc_data1[31:0];
assign evic_inv_vec_1[31:0] = l15_spc_data1[87:56];


assign take_strm_store_ack = (~l15_rtn_type[3] &  l15_rtn_type[2] &  l15_rtn_type[1] & ~l15_rtn_type[0]) & l15_ifu_valid;
assign take_store_ack      = (~l15_rtn_type[3] &  l15_rtn_type[2] & ~l15_rtn_type[1] & ~l15_rtn_type[0] & 
                              ~l15_spc_data1[124] & ~l15_spc_data1[123]) & l15_ifu_valid;
assign take_inval_ack      = (~l15_rtn_type[3] &  l15_rtn_type[2] & ~l15_rtn_type[1] & ~l15_rtn_type[0] & 
                              l15_spc_data1[124] & ~l15_spc_data1[123]) & l15_ifu_valid;
assign take_load_return    = (~l15_rtn_type[3] & ~l15_rtn_type[2] & ~l15_rtn_type[1] & ~l15_rtn_type[0]) & l15_ifu_valid;
assign take_evic_inv       = (~l15_rtn_type[3] & ~l15_rtn_type[2] &  l15_rtn_type[1] &  l15_rtn_type[0]) & l15_ifu_valid;


assign cmu_inval_ack_din[0] = take_inval_ack & (~l15_spc_cpkt[8] & ~l15_spc_cpkt[7] & ~l15_spc_cpkt[6]);
assign cmu_inval_ack_din[1] = take_inval_ack & (~l15_spc_cpkt[8] & ~l15_spc_cpkt[7] &  l15_spc_cpkt[6]);
assign cmu_inval_ack_din[2] = take_inval_ack & (~l15_spc_cpkt[8] &  l15_spc_cpkt[7] & ~l15_spc_cpkt[6]);
assign cmu_inval_ack_din[3] = take_inval_ack & (~l15_spc_cpkt[8] &  l15_spc_cpkt[7] &  l15_spc_cpkt[6]);
assign cmu_inval_ack_din[4] = take_inval_ack & ( l15_spc_cpkt[8] & ~l15_spc_cpkt[7] & ~l15_spc_cpkt[6]);
assign cmu_inval_ack_din[5] = take_inval_ack & ( l15_spc_cpkt[8] & ~l15_spc_cpkt[7] &  l15_spc_cpkt[6]);
assign cmu_inval_ack_din[6] = take_inval_ack & ( l15_spc_cpkt[8] &  l15_spc_cpkt[7] & ~l15_spc_cpkt[6]);
assign cmu_inval_ack_din[7] = take_inval_ack & ( l15_spc_cpkt[8] &  l15_spc_cpkt[7] &  l15_spc_cpkt[6]);

assign inv_vector[0] =  ( (~cpuid[2] & ~cpuid[1] & ~cpuid[0]) & store_inval_vector[0]
                        | (~cpuid[2] & ~cpuid[1] &  cpuid[0]) & store_inval_vector[4]
                        | (~cpuid[2] &  cpuid[1] & ~cpuid[0]) & store_inval_vector[8]
                        | (~cpuid[2] &  cpuid[1] &  cpuid[0]) & store_inval_vector[12]
                        | ( cpuid[2] & ~cpuid[1] & ~cpuid[0]) & store_inval_vector[16]
                        | ( cpuid[2] & ~cpuid[1] &  cpuid[0]) & store_inval_vector[20]
                        | ( cpuid[2] &  cpuid[1] & ~cpuid[0]) & store_inval_vector[24]
                        | ( cpuid[2] &  cpuid[1] &  cpuid[0]) & store_inval_vector[28]);

assign inv_vector[1] = ( (~cpuid[2] & ~cpuid[1] & ~cpuid[0]) & store_inval_vector[1]
                       | (~cpuid[2] & ~cpuid[1] &  cpuid[0]) & store_inval_vector[5]
                       | (~cpuid[2] &  cpuid[1] & ~cpuid[0]) & store_inval_vector[9]
                       | (~cpuid[2] &  cpuid[1] &  cpuid[0]) & store_inval_vector[13]
                       | ( cpuid[2] & ~cpuid[1] & ~cpuid[0]) & store_inval_vector[17]
                       | ( cpuid[2] & ~cpuid[1] &  cpuid[0]) & store_inval_vector[21]
                       | ( cpuid[2] &  cpuid[1] & ~cpuid[0]) & store_inval_vector[25]
                       | ( cpuid[2] &  cpuid[1] &  cpuid[0]) & store_inval_vector[29]);

assign inv_vector[2] = ( (~cpuid[2] & ~cpuid[1] & ~cpuid[0]) & store_inval_vector[2]
                       | (~cpuid[2] & ~cpuid[1] &  cpuid[0]) & store_inval_vector[6]
                       | (~cpuid[2] &  cpuid[1] & ~cpuid[0]) & store_inval_vector[10]
                       | (~cpuid[2] &  cpuid[1] &  cpuid[0]) & store_inval_vector[14]
                       | ( cpuid[2] & ~cpuid[1] & ~cpuid[0]) & store_inval_vector[18]
                       | ( cpuid[2] & ~cpuid[1] &  cpuid[0]) & store_inval_vector[22]
                       | ( cpuid[2] &  cpuid[1] & ~cpuid[0]) & store_inval_vector[26]
                       | ( cpuid[2] &  cpuid[1] &  cpuid[0]) & store_inval_vector[30]);

assign inv_vector[3] = ( (~cpuid[2] & ~cpuid[1] & ~cpuid[0]) & store_inval_vector[3]
                       | (~cpuid[2] & ~cpuid[1] &  cpuid[0]) & store_inval_vector[7]
                       | (~cpuid[2] &  cpuid[1] & ~cpuid[0]) & store_inval_vector[11]
                       | (~cpuid[2] &  cpuid[1] &  cpuid[0]) & store_inval_vector[15]
                       | ( cpuid[2] & ~cpuid[1] & ~cpuid[0]) & store_inval_vector[19]
                       | ( cpuid[2] & ~cpuid[1] &  cpuid[0]) & store_inval_vector[23]
                       | ( cpuid[2] &  cpuid[1] & ~cpuid[0]) & store_inval_vector[27]
                       | ( cpuid[2] &  cpuid[1] &  cpuid[0]) & store_inval_vector[31]);

// **************************************************

assign evic_i_inv_0_true =  ( (~cpuid[2] & ~cpuid[1] & ~cpuid[0]) & evic_inv_vec_0[0]
                            | (~cpuid[2] & ~cpuid[1] &  cpuid[0]) & evic_inv_vec_0[4]
                            | (~cpuid[2] &  cpuid[1] & ~cpuid[0]) & evic_inv_vec_0[8]
                            | (~cpuid[2] &  cpuid[1] &  cpuid[0]) & evic_inv_vec_0[12]
                            | ( cpuid[2] & ~cpuid[1] & ~cpuid[0]) & evic_inv_vec_0[16]
                            | ( cpuid[2] & ~cpuid[1] &  cpuid[0]) & evic_inv_vec_0[20]
                            | ( cpuid[2] &  cpuid[1] & ~cpuid[0]) & evic_inv_vec_0[24]
                            | ( cpuid[2] &  cpuid[1] &  cpuid[0]) & evic_inv_vec_0[28]);

assign evic_inv_way0[0] = ( (~cpuid[2] & ~cpuid[1] & ~cpuid[0]) & evic_inv_vec_0[1]
                            | (~cpuid[2] & ~cpuid[1] &  cpuid[0]) & evic_inv_vec_0[5]
                            | (~cpuid[2] &  cpuid[1] & ~cpuid[0]) & evic_inv_vec_0[9]
                            | (~cpuid[2] &  cpuid[1] &  cpuid[0]) & evic_inv_vec_0[13]
                            | ( cpuid[2] & ~cpuid[1] & ~cpuid[0]) & evic_inv_vec_0[17]
                            | ( cpuid[2] & ~cpuid[1] &  cpuid[0]) & evic_inv_vec_0[21]
                            | ( cpuid[2] &  cpuid[1] & ~cpuid[0]) & evic_inv_vec_0[25]
                            | ( cpuid[2] &  cpuid[1] &  cpuid[0]) & evic_inv_vec_0[29]);

assign evic_inv_way0[1] = ( (~cpuid[2] & ~cpuid[1] & ~cpuid[0]) & evic_inv_vec_0[2]
                            | (~cpuid[2] & ~cpuid[1] &  cpuid[0]) & evic_inv_vec_0[6]
                            | (~cpuid[2] &  cpuid[1] & ~cpuid[0]) & evic_inv_vec_0[10]
                            | (~cpuid[2] &  cpuid[1] &  cpuid[0]) & evic_inv_vec_0[14]
                            | ( cpuid[2] & ~cpuid[1] & ~cpuid[0]) & evic_inv_vec_0[18]
                            | ( cpuid[2] & ~cpuid[1] &  cpuid[0]) & evic_inv_vec_0[22]
                            | ( cpuid[2] &  cpuid[1] & ~cpuid[0]) & evic_inv_vec_0[26]
                            | ( cpuid[2] &  cpuid[1] &  cpuid[0]) & evic_inv_vec_0[30]);

assign evic_inv_way0[2] = ( (~cpuid[2] & ~cpuid[1] & ~cpuid[0]) & evic_inv_vec_0[3]
                            | (~cpuid[2] & ~cpuid[1] &  cpuid[0]) & evic_inv_vec_0[7]
                            | (~cpuid[2] &  cpuid[1] & ~cpuid[0]) & evic_inv_vec_0[11]
                            | (~cpuid[2] &  cpuid[1] &  cpuid[0]) & evic_inv_vec_0[15]
                            | ( cpuid[2] & ~cpuid[1] & ~cpuid[0]) & evic_inv_vec_0[19]
                            | ( cpuid[2] & ~cpuid[1] &  cpuid[0]) & evic_inv_vec_0[23]
                            | ( cpuid[2] &  cpuid[1] & ~cpuid[0]) & evic_inv_vec_0[27]
                            | ( cpuid[2] &  cpuid[1] &  cpuid[0]) & evic_inv_vec_0[31]);

// **************************************************
assign evic_i_inv_1_true =  ( (~cpuid[2] & ~cpuid[1] & ~cpuid[0]) & evic_inv_vec_1[0]
                            | (~cpuid[2] & ~cpuid[1] &  cpuid[0]) & evic_inv_vec_1[4]
                            | (~cpuid[2] &  cpuid[1] & ~cpuid[0]) & evic_inv_vec_1[8]
                            | (~cpuid[2] &  cpuid[1] &  cpuid[0]) & evic_inv_vec_1[12]
                            | ( cpuid[2] & ~cpuid[1] & ~cpuid[0]) & evic_inv_vec_1[16]
                            | ( cpuid[2] & ~cpuid[1] &  cpuid[0]) & evic_inv_vec_1[20]
                            | ( cpuid[2] &  cpuid[1] & ~cpuid[0]) & evic_inv_vec_1[24]
                            | ( cpuid[2] &  cpuid[1] &  cpuid[0]) & evic_inv_vec_1[28]);

assign evic_inv_way1[0] = ( (~cpuid[2] & ~cpuid[1] & ~cpuid[0]) & evic_inv_vec_1[1]
                          | (~cpuid[2] & ~cpuid[1] &  cpuid[0]) & evic_inv_vec_1[5]
                          | (~cpuid[2] &  cpuid[1] & ~cpuid[0]) & evic_inv_vec_1[9]
                          | (~cpuid[2] &  cpuid[1] &  cpuid[0]) & evic_inv_vec_1[13]
                          | ( cpuid[2] & ~cpuid[1] & ~cpuid[0]) & evic_inv_vec_1[17]
                          | ( cpuid[2] & ~cpuid[1] &  cpuid[0]) & evic_inv_vec_1[21]
                          | ( cpuid[2] &  cpuid[1] & ~cpuid[0]) & evic_inv_vec_1[25]
                          | ( cpuid[2] &  cpuid[1] &  cpuid[0]) & evic_inv_vec_1[29]);

assign evic_inv_way1[1] = ( (~cpuid[2] & ~cpuid[1] & ~cpuid[0]) & evic_inv_vec_1[2]
                          | (~cpuid[2] & ~cpuid[1] &  cpuid[0]) & evic_inv_vec_1[6]
                          | (~cpuid[2] &  cpuid[1] & ~cpuid[0]) & evic_inv_vec_1[10]
                          | (~cpuid[2] &  cpuid[1] &  cpuid[0]) & evic_inv_vec_1[14]
                          | ( cpuid[2] & ~cpuid[1] & ~cpuid[0]) & evic_inv_vec_1[18]
                          | ( cpuid[2] & ~cpuid[1] &  cpuid[0]) & evic_inv_vec_1[22]
                          | ( cpuid[2] &  cpuid[1] & ~cpuid[0]) & evic_inv_vec_1[26]
                          | ( cpuid[2] &  cpuid[1] &  cpuid[0]) & evic_inv_vec_1[30]);

assign evic_inv_way1[2] = ( (~cpuid[2] & ~cpuid[1] & ~cpuid[0]) & evic_inv_vec_1[3]
                          | (~cpuid[2] & ~cpuid[1] &  cpuid[0]) & evic_inv_vec_1[7]
                          | (~cpuid[2] &  cpuid[1] & ~cpuid[0]) & evic_inv_vec_1[11]
                          | (~cpuid[2] &  cpuid[1] &  cpuid[0]) & evic_inv_vec_1[15]
                          | ( cpuid[2] & ~cpuid[1] & ~cpuid[0]) & evic_inv_vec_1[19]
                          | ( cpuid[2] & ~cpuid[1] &  cpuid[0]) & evic_inv_vec_1[23]
                          | ( cpuid[2] &  cpuid[1] & ~cpuid[0]) & evic_inv_vec_1[27]
                          | ( cpuid[2] &  cpuid[1] &  cpuid[0]) & evic_inv_vec_1[31]);

//0in bits_on -var {str_strm_invalidate, cross_invalidate} -max 1
assign str_strm_invalidate = (take_strm_store_ack | take_store_ack) & inv_vector[0];
assign cross_invalidate = take_load_return & l15_spc_cpkt[5];       // way valid


assign evic_invalidate_w0  = take_evic_inv &  evic_i_inv_0_true & ~evic_i_inv_1_true;
assign evic_invalidate_w1  = take_evic_inv & ~evic_i_inv_0_true &  evic_i_inv_1_true;
assign evic_invalidate_w01 = take_evic_inv &  evic_i_inv_0_true &  evic_i_inv_1_true;
assign evic_invalidate_any = take_evic_inv & (evic_i_inv_0_true | evic_i_inv_1_true);

assign evic_way0[2:0] = (evic_inv_way0[2:0] & {3{evic_invalidate_w0}}) |
                        (evic_inv_way1[2:0] & {3{evic_invalidate_w1}}) |
                        (evic_inv_way0[2:0] & {3{evic_invalidate_w01}});

assign evic_index[10:5] = ({l15_spc_data1[116:112], 1'b0} & {6{evic_invalidate_w01}}) |
                          ({l15_spc_data1[116:112], 1'b0} & {6{evic_invalidate_w0}}) |
                          ({l15_spc_data1[116:112], 1'b1} & {6{evic_invalidate_w1}}) ;

assign cmu_icache_invalidate_din = str_strm_invalidate | cross_invalidate | evic_invalidate_any;
assign cmu_icache_invalidate_way_din[2:0] = (inv_vector[3:1] & {3{str_strm_invalidate}}) |
                                            (l15_spc_cpkt[4:2] & {3{cross_invalidate}}) |
                                            (evic_way0[2:0] & {3{evic_invalidate_any}});
assign cmu_icache_invalidate_index_din[10:5] = ({l15_spc_data1[116:112], l15_spc_data1[122]} & {6{str_strm_invalidate}}) |
                                               ({l15_spc_data1[116:112], l15_spc_data1[122]} & {6{take_inval_ack}}) |
                                               (lsu_ifu_ld_index[10:5] & {6{cross_invalidate}}) |
                                               (evic_index[10:5] & {6{evic_invalidate_any}});

assign cmu_evic_invalidate_din = evic_invalidate_w01;
assign cmu_icache_inv_way1_din[2:0] = evic_inv_way1[2:0];

ifu_cmu_lsi_ctl_msff_ctl_macro__width_22 stg_r1_lat  (
 .scan_in(stg_r1_lat_scanin),
 .scan_out(stg_r1_lat_scanout),
 .l1clk(l1clk ),
 .din  ({cmu_icache_invalidate_din,
         cmu_icache_invalidate_way_din[2:0],
         cmu_icache_invalidate_index_din[10:5],
         cmu_icache_inv_way1_din[2:0],
         cmu_evic_invalidate_din,
         cmu_inval_ack_din[7:0]}),
 .dout  ({cmu_icache_invalidate,
         cmu_icache_invalidate_way[2:0],
         cmu_icache_invalidate_index[10:5],
         cmu_icache_inv_way1[2:0],
         cmu_evic_invalidate,
          cmu_inval_ack[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

assign l15_spc_data_55_32_unused[23:0] = l15_spc_data1[55:32];
assign l15_spc_data_111_96_unused[15:0] = l15_spc_data1[111:96];
assign l15_spc_data_121_117_unused[4:0] = l15_spc_data1[121:117];
assign l15_spc_data_127_125_unused[2:0] = l15_spc_data1[127:125];
assign l15_spc_cpkt_1_0_unused[1:0] = l15_spc_cpkt[1:0];
assign l15_spc_cpkt_13_unused = l15_spc_cpkt[13];

                                                      
////////////////////////////////////////////////////////
// SPARE CELLS
////////////////////////////////////////////////////////
//spare_ctl_macro spares (num=2) (
//	.scan_in(spares_scanin),
//	.scan_out(spares_scanout),
//	.l1clk	(l1clk)
//);
////////////////////////////////////////////////////////
// Flatten spare cells
  cl_sc1_msff_8x spares_spare0_flop ( .l1clk(l1clk), .siclk(siclk), .soclk(soclk), 
        .d(cmu_l2miss_in), .q(cmu_l2miss), .si(stg_r1_lat_scanout), .so(spares_so_0) );
  cl_u1_buf_32x spares_spare0_buf_32x ( .in(1'b1),
  .out(out) );
  cl_u1_nand3_8x spares_spare0_nand3_8x ( .in0(1'b1), .in1(1'b1), .in2(1'b1),
  .out(out) );
  cl_u1_inv_8x spares_spare0_inv_8x ( .in(1'b1),
  .out(out) );
  cl_u1_aoi22_4x spares_spare0_aoi22_4x ( .in00(1'b1), .in01(1'b1), .in10(1'b1), .in11(1'b1),
  .out(out) );
  cl_u1_buf_8x spares_spare0_buf_8x ( .in(1'b1),
  .out(out) );
  cl_u1_oai22_4x spares_spare0_oai22_4x ( .in00(1'b1), .in01(1'b1), .in10(1'b1), .in11(1'b1),
  .out(out) );
  cl_u1_inv_16x spares_spare0_inv_16x ( .in(1'b1),
  .out(out) );
  cl_u1_nand2_16x spares_spare0_nand2_16x ( .in0(1'b1), .in1(1'b1),
  .out(out) );
  cl_u1_nor3_4x spares_spare0_nor3_4x ( .in0(1'b0), .in1(1'b0), .in2(1'b0),
  .out(out) );
  cl_u1_nand2_8x spares_spare0_nand2_8x ( .in0(1'b1), .in1(1'b1),
  .out(out) );
  cl_u1_buf_16x spares_spare0_buf_16x ( .in(1'b1),
  .out(out) );
  cl_u1_nor2_16x spares_spare0_nor2_16x ( .in0(1'b0), .in1(1'b0),
  .out(out) );
  cl_u1_inv_32x spares_spare0_inv_32x ( .in(1'b1),
  .out(out) );
  cl_sc1_msff_8x spares_spare1_flop ( .l1clk(l1clk), .siclk(siclk), .soclk(soclk), 
        .d(1'b0), .si(spares_so_0), .so(spares_scanout),
  .q(q) );
  cl_u1_buf_32x spares_spare1_buf_32x ( .in(1'b1),
  .out(out) );
  cl_u1_nand3_8x spares_spare1_nand3_8x ( .in0(1'b1), .in1(1'b1), .in2(1'b1),
  .out(out) );
  cl_u1_inv_8x spares_spare1_inv_8x ( .in(1'b1),
  .out(out) );
  cl_u1_aoi22_4x spares_spare1_aoi22_4x ( .in00(1'b1), .in01(1'b1), .in10(1'b1), .in11(1'b1),
  .out(out) );
  cl_u1_buf_8x spares_spare1_buf_8x ( .in(1'b1),
  .out(out) );
  cl_u1_oai22_4x spares_spare1_oai22_4x ( .in00(1'b1), .in01(1'b1), .in10(1'b1), .in11(1'b1),
  .out(out) );
  cl_u1_inv_16x spares_spare1_inv_16x ( .in(1'b1),
  .out(out) );
  cl_u1_nand2_16x spares_spare1_nand2_16x ( .in0(1'b1), .in1(1'b1),
  .out(out) );
  cl_u1_nor3_4x spares_spare1_nor3_4x ( .in0(1'b0), .in1(1'b0), .in2(1'b0),
  .out(out) );
  cl_u1_nand2_8x spares_spare1_nand2_8x ( .in0(1'b1), .in1(1'b1),
  .out(out) );
  cl_u1_buf_16x spares_spare1_buf_16x ( .in(1'b1),
  .out(out) );
  cl_u1_nor2_16x spares_spare1_nor2_16x ( .in0(1'b0), .in1(1'b0),
  .out(out) );
  cl_u1_inv_32x spares_spare1_inv_32x ( .in(1'b1),
  .out(out) );
////////////////////////////////////////////////////////

supply0 vss;
supply1 vdd;

// fixscan start:
assign empty_state_reg_scanin    = scan_in                  ;
assign one_buff_state_reg_scanin = empty_state_reg_scanout  ;
assign l15_hold_state_reg_scanin = one_buff_state_reg_scanout;
assign ifu_l15_valid_reg_scanin  = l15_hold_state_reg_scanout;
assign lsc_l15_valid_reg_scanin  = ifu_l15_valid_reg_scanout;
assign lsc_req_sel_reg_scanin    = lsc_l15_valid_reg_scanout;
assign lsc_cpkt_reg_scanin       = lsc_req_sel_reg_scanout  ;
assign ifu_lsu_lat_scanin        = lsc_cpkt_reg_scanout     ;
assign favour_bit_reg_scanin     = ifu_lsu_lat_scanout      ;
assign ptr0_reg_scanin           = favour_bit_reg_scanout   ;
assign ptr1_reg_scanin           = ptr0_reg_scanout         ;
assign reg_pmen_scanin           = ptr1_reg_scanout         ;
assign sec_pkt_lat_scanin        = reg_pmen_scanout         ;
assign stg_r1_lat0_scanin        = sec_pkt_lat_scanout      ;
assign cmu_inst_reg_scanin       = stg_r1_lat0_scanout      ;
assign stg_r1_lat_scanin         = cmu_inst_reg_scanout     ;
assign spares_scanin             = stg_r1_lat_scanout       ;
assign scan_out                  = spares_scanout           ;

// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module ifu_cmu_lsi_ctl_l1clkhdr_ctl_macro (
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

module ifu_cmu_lsi_ctl_msff_ctl_macro__width_1 (
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

module ifu_cmu_lsi_ctl_msff_ctl_macro__width_3 (
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

module ifu_cmu_lsi_ctl_msff_ctl_macro__width_8 (
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

module ifu_cmu_lsi_ctl_msff_ctl_macro__width_11 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [10:0] fdin;
wire [9:0] so;

  input [10:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [10:0] dout;
  output scan_out;
assign fdin[10:0] = din[10:0];






dff #(11)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[10:0]),
.si({scan_in,so[9:0]}),
.so({so[9:0],scan_out}),
.q(dout[10:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ifu_cmu_lsi_ctl_msff_ctl_macro__width_10 (
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

module ifu_cmu_lsi_ctl_msff_ctl_macro__width_4 (
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













// any PARAMS parms go into naming of macro

module ifu_cmu_lsi_ctl_msff_ctl_macro__width_2 (
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













// any PARAMS parms go into naming of macro

module ifu_cmu_lsi_ctl_msff_ctl_macro__width_22 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [21:0] fdin;
wire [20:0] so;

  input [21:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [21:0] dout;
  output scan_out;
assign fdin[21:0] = din[21:0];






dff #(22)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[21:0]),
.si({scan_in,so[20:0]}),
.so({so[20:0],scan_out}),
.q(dout[21:0])
);












endmodule








