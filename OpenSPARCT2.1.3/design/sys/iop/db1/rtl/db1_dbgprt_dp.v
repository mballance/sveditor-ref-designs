// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: db1_dbgprt_dp.v
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
module db1_dbgprt_dp (
  io_cmp_sync_en, 
  cmp_io2x_sync_en, 
  dbg0_dbg1_l2t0_pa_match, 
  dbg0_dbg1_l2t2_pa_match, 
  l2t1_dbg1_pa_match, 
  l2t3_dbg1_pa_match, 
  l2t4_dbg1_pa_match, 
  l2t5_dbg1_pa_match, 
  l2t6_dbg1_pa_match, 
  l2t7_dbg1_pa_match, 
  dbg0_dbg1_l2t0_err_event, 
  dbg0_dbg1_l2t2_err_event, 
  l2t1_dbg1_err_event, 
  l2t3_dbg1_err_event, 
  l2t4_dbg1_err_event, 
  l2t5_dbg1_err_event, 
  l2t6_dbg1_err_event, 
  l2t7_dbg1_err_event, 
  dbg0_dbg1_debug_data, 
  mcu_dtm_signals, 
  ccu_dbg1_serdes_dtm, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  scan_in, 
  scan_out, 
  l2clk, 
  cmp_io_sync_en, 
  mcu_dbg_signals, 
  sii_dbg1_l2t0_req, 
  sii_dbg1_l2t1_req, 
  sii_dbg1_l2t2_req, 
  sii_dbg1_l2t3_req, 
  sii_dbg1_l2t4_req, 
  sii_dbg1_l2t5_req, 
  sii_dbg1_l2t6_req, 
  sii_dbg1_l2t7_req, 
  l2t1_dbg1_sii_iq_dequeue, 
  l2t3_dbg1_sii_iq_dequeue, 
  l2t4_dbg1_sii_iq_dequeue, 
  l2t5_dbg1_sii_iq_dequeue, 
  l2t6_dbg1_sii_iq_dequeue, 
  l2t7_dbg1_sii_iq_dequeue, 
  dbg0_dbg1_l2t0_sii_iq_dequeue, 
  dbg0_dbg1_l2t2_sii_iq_dequeue, 
  l2t1_dbg1_sii_wib_dequeue, 
  l2t3_dbg1_sii_wib_dequeue, 
  l2t4_dbg1_sii_wib_dequeue, 
  l2t5_dbg1_sii_wib_dequeue, 
  l2t6_dbg1_sii_wib_dequeue, 
  l2t7_dbg1_sii_wib_dequeue, 
  dbg0_dbg1_l2t0_sii_wib_dequeue, 
  dbg0_dbg1_l2t2_sii_wib_dequeue, 
  l2t1_dbg1_xbar_vcid, 
  l2t3_dbg1_xbar_vcid, 
  l2t4_dbg1_xbar_vcid, 
  l2t5_dbg1_xbar_vcid, 
  l2t6_dbg1_xbar_vcid, 
  l2t7_dbg1_xbar_vcid, 
  dbg0_dbg1_l2t0_xbar_vcid, 
  dbg0_dbg1_l2t2_xbar_vcid, 
  l2b4_dbg1_sio_ctag_vld, 
  l2b5_dbg1_sio_ctag_vld, 
  l2b6_dbg1_sio_ctag_vld, 
  l2b7_dbg1_sio_ctag_vld, 
  dbg0_dbg1_l2b0_sio_ctag_vld, 
  dbg0_dbg1_l2b1_sio_ctag_vld, 
  dbg0_dbg1_l2b2_sio_ctag_vld, 
  dbg0_dbg1_l2b3_sio_ctag_vld, 
  l2b4_dbg1_sio_ack_type, 
  l2b5_dbg1_sio_ack_type, 
  l2b6_dbg1_sio_ack_type, 
  l2b7_dbg1_sio_ack_type, 
  dbg0_dbg1_l2b0_sio_ack_type, 
  dbg0_dbg1_l2b1_sio_ack_type, 
  dbg0_dbg1_l2b2_sio_ack_type, 
  dbg0_dbg1_l2b3_sio_ack_type, 
  l2b4_dbg1_sio_ack_dest, 
  l2b5_dbg1_sio_ack_dest, 
  l2b6_dbg1_sio_ack_dest, 
  l2b7_dbg1_sio_ack_dest, 
  dbg0_dbg1_l2b0_sio_ack_dest, 
  dbg0_dbg1_l2b1_sio_ack_dest, 
  dbg0_dbg1_l2b2_sio_ack_dest, 
  dbg0_dbg1_l2b3_sio_ack_dest, 
  spc1_dbg1_instr_cmt_grp0, 
  spc1_dbg1_instr_cmt_grp1, 
  spc3_dbg1_instr_cmt_grp0, 
  spc3_dbg1_instr_cmt_grp1, 
  spc4_dbg1_instr_cmt_grp0, 
  spc4_dbg1_instr_cmt_grp1, 
  spc5_dbg1_instr_cmt_grp0, 
  spc5_dbg1_instr_cmt_grp1, 
  spc6_dbg1_instr_cmt_grp0, 
  spc6_dbg1_instr_cmt_grp1, 
  spc7_dbg1_instr_cmt_grp0, 
  spc7_dbg1_instr_cmt_grp1, 
  dbg0_dbg1_spc0_instr_cmt_grp0, 
  dbg0_dbg1_spc0_instr_cmt_grp1, 
  dbg0_dbg1_spc2_instr_cmt_grp0, 
  dbg0_dbg1_spc2_instr_cmt_grp1, 
  sel_soc_obs_mode, 
  sel_charac_mode, 
  sel_rep_mode, 
  sel_core_soc_debug_mode, 
  sel_train_mode, 
  l2t0_pa_match_synced, 
  l2t1_pa_match_synced, 
  l2t2_pa_match_synced, 
  l2t3_pa_match_synced, 
  l2t4_pa_match_synced, 
  l2t5_pa_match_synced, 
  l2t6_pa_match_synced, 
  l2t7_pa_match_synced, 
  l2t_error_event_synced, 
  dbg1_mio_dbg_dq);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire ff_train_seq_gen_scanin;
wire ff_train_seq_gen_scanout;
wire cmp_io2x_sync_en_23;
wire train_seq;
wire train_seq_b1;
wire train_seq_b2;
wire train_seq_b11;
wire train_seq_b12;
wire train_seq_b13;
wire train_seq_b14;
wire train_seq_b15;
wire train_seq_b16;
wire train_seq_b17;
wire train_seq_b18;
wire train_seq_b21;
wire train_seq_b22;
wire train_seq_b23;
wire train_seq_b24;
wire train_seq_b25;
wire train_seq_b26;
wire train_seq_b27;
wire train_seq_b28;
wire train_seq_b29;
wire ff_train_data_0_scanin;
wire ff_train_data_0_scanout;
wire ff_train_data_1_scanin;
wire ff_train_data_1_scanout;
wire ff_train_data_2_scanin;
wire ff_train_data_2_scanout;
wire ff_cmp_io_sync_en_scanin;
wire ff_cmp_io_sync_en_scanout;
wire io_cmp_sync_en_2;
wire io_cmp_sync_en_3;
wire io_cmp_sync_en_4;
wire io_cmp_sync_en_5;
wire io_cmp_sync_en_32;
wire io_cmp_sync_en_42;
wire io_cmp_sync_en_52;
wire l2t0_pa_match_rec_din;
wire l2t1_pa_match_rec_din;
wire l2t2_pa_match_rec_din;
wire l2t3_pa_match_rec_din;
wire l2t4_pa_match_rec_din;
wire l2t5_pa_match_rec_din;
wire l2t6_pa_match_rec_din;
wire l2t7_pa_match_rec_din;
wire dbg1_cmp_io_sync_en_2;
wire io_cmp_sync_en_6;
wire io_cmp_sync_en_62;
wire cmp_io2x_sync_en_2;
wire cmp_io2x_sync_en_22;
wire l2t0_pa_match_r;
wire l2t2_pa_match_r;
wire l2t1_pa_match_r;
wire l2t3_pa_match_r;
wire l2t4_pa_match_r;
wire l2t5_pa_match_r;
wire l2t6_pa_match_r;
wire l2t7_pa_match_r;
wire l2t0_pa_match_rec;
wire l2t1_pa_match_rec;
wire l2t2_pa_match_rec;
wire l2t3_pa_match_rec;
wire l2t4_pa_match_rec;
wire l2t5_pa_match_rec;
wire l2t6_pa_match_rec;
wire l2t7_pa_match_rec;
wire l2t0_err_event_r;
wire l2t2_err_event_r;
wire l2t1_err_event_r;
wire l2t3_err_event_r;
wire l2t4_err_event_r;
wire l2t5_err_event_r;
wire l2t6_err_event_r;
wire l2t7_err_event_r;
wire ff_charac_signal_bus_scanin;
wire ff_charac_signal_bus_scanout;
wire ff_obs_signal_bus_scanin;
wire ff_obs_signal_bus_scanout;
wire io_cmp_sync_en_3or4;
wire io_cmp_sync_en_32or42;
wire io_cmp_sync_en_5or6;
wire io_cmp_sync_en_52or62;
wire cmp_io2x_sync_en_2_n;
wire dbg1_cmp_io_sync_en_2_n;
wire sel_train_mode_n;
wire l2t0_pa_match_rec_sync;
wire l2t1_pa_match_rec_sync;
wire l2t2_pa_match_rec_sync;
wire l2t3_pa_match_rec_sync;
wire l2t4_pa_match_rec_sync;
wire l2t5_pa_match_rec_sync;
wire l2t6_pa_match_rec_sync;
wire l2t7_pa_match_rec_sync;
wire l2t012_err_event_r;
wire l2t345_err_event_r;
wire l2t67_err_event_r;
wire l2t_error_event;
wire ff_l2tx_pa_match_synced_scanin;
wire ff_l2tx_pa_match_synced_scanout;
wire ff_mcu_dbg_signals_slice0_scanin;
wire ff_mcu_dbg_signals_slice0_scanout;
wire ff_mcu_dbg_signals_slice1_scanin;
wire ff_mcu_dbg_signals_slice1_scanout;
wire ff_mcu_dbg_bus_scanin;
wire ff_mcu_dbg_bus_scanout;
wire ff_rep_bus_slice0_scanin;
wire ff_rep_bus_slice0_scanout;
wire ff_rep_bus_slice1_scanin;
wire ff_rep_bus_slice1_scanout;
wire ff_rep_bus_slice2_scanin;
wire ff_rep_bus_slice2_scanout;
wire ff_rep_bus_slice3_scanin;
wire ff_rep_bus_slice3_scanout;
wire ff_obs_signal_bus_io2x_0_scanin;
wire ff_obs_signal_bus_io2x_0_scanout;
wire ff_obs_signal_bus_io2x_1_scanin;
wire ff_obs_signal_bus_io2x_1_scanout;
wire ff_obs_signal_bus_io2x_fnl_0_scanin;
wire ff_obs_signal_bus_io2x_fnl_0_scanout;
wire ff_obs_signal_bus_io2x_fnl_1_scanin;
wire ff_obs_signal_bus_io2x_fnl_1_scanout;
wire ff_charac_signal_bus_io2x_0a_scanin;
wire ff_charac_signal_bus_io2x_0a_scanout;
wire ff_charac_signal_bus_io2x_0b_scanin;
wire ff_charac_signal_bus_io2x_0b_scanout;
wire ff_charac_signal_bus_io2x_1a_scanin;
wire ff_charac_signal_bus_io2x_1a_scanout;
wire ff_charac_signal_bus_io2x_1b_scanin;
wire ff_charac_signal_bus_io2x_1b_scanout;
wire ff_charac_signal_bus_io2x_fnl_0a_scanin;
wire ff_charac_signal_bus_io2x_fnl_0a_scanout;
wire ff_charac_signal_bus_io2x_fnl_1_scanin;
wire ff_charac_signal_bus_io2x_fnl_1_scanout;
wire ff_charac_signal_bus_io2x_fnl_2_scanin;
wire ff_charac_signal_bus_io2x_fnl_2_scanout;
wire ff_charac_signal_bus_io2x_fnl_3_scanin;
wire ff_charac_signal_bus_io2x_fnl_3_scanout;
wire ff_dbg1_mio_dbg_dq_0_scanin;
wire ff_dbg1_mio_dbg_dq_0_scanout;
wire ff_dbg1_mio_dbg_dq_1_scanin;
wire ff_dbg1_mio_dbg_dq_1_scanout;
wire ff_dbg1_mio_dbg_dq_2_scanin;
wire ff_dbg1_mio_dbg_dq_2_scanout;
wire ccu_dbg1_serdes_dtm_n;


input		io_cmp_sync_en;
input		cmp_io2x_sync_en;
input           dbg0_dbg1_l2t0_pa_match;     //A PA match detected in l2t 0 : flopped version
input           dbg0_dbg1_l2t2_pa_match;     //A PA match detected in l2t 2 : flopped version
input           l2t1_dbg1_pa_match;     //A PA match detected in l2t 1
input           l2t3_dbg1_pa_match;     //A PA match detected in l2t 3
input           l2t4_dbg1_pa_match;     //A PA match detected in l2t 4
input           l2t5_dbg1_pa_match;     //A PA match detected in l2t 5
input           l2t6_dbg1_pa_match;     //A PA match detected in l2t 6
input           l2t7_dbg1_pa_match;     //A PA match detected in l2t 7

input           dbg0_dbg1_l2t0_err_event;    //An Error event occurred in l2t 0 : flopped version
input           dbg0_dbg1_l2t2_err_event;    //An Error event occurred in l2t 2 : flopped version
input           l2t1_dbg1_err_event;    //An Error event occurred in l2t 1
input           l2t3_dbg1_err_event;    //An Error event occurred in l2t 3
input           l2t4_dbg1_err_event;    //An Error event occurred in l2t 4
input           l2t5_dbg1_err_event;    //An Error event occurred in l2t 5
input           l2t6_dbg1_err_event;    //An Error event occurred in l2t 6
input           l2t7_dbg1_err_event;    //An Error event occurred in l2t 7

input [165:0]   dbg0_dbg1_debug_data;  // 166 bit debug data bus carrying repeatability signals to DBG1
input [87:0]    mcu_dtm_signals;       // MCU DTM signals to be sent out on debug port
input           ccu_dbg1_serdes_dtm;        // DTM mode 1


input           tcu_pce_ov;
input           tcu_clk_stop;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;
input           scan_in;
output           scan_out;

input           l2clk;                  //Internal CMP clock from CCU

input           cmp_io_sync_en;         // CMP to IO sync enable

input [83:0] 	mcu_dbg_signals;

// Tester charac/CPU debug mode signals and SOC obs
// signals from sii->l2t and l2t -> sio interfaces

input  [1:0]    sii_dbg1_l2t0_req;       //Req type encoded on 2 bits from sii to L2t 0
input  [1:0]    sii_dbg1_l2t1_req;       //Req type encoded on 2 bits from sii to L2t 1
input  [1:0]    sii_dbg1_l2t2_req;       //Req type encoded on 2 bits from sii to L2t 2
input  [1:0]    sii_dbg1_l2t3_req;       //Req type encoded on 2 bits from sii to L2t 3
input  [1:0]    sii_dbg1_l2t4_req;       //Req type encoded on 2 bits from sii to L2t 4
input  [1:0]    sii_dbg1_l2t5_req;       //Req type encoded on 2 bits from sii to L2t 5
input  [1:0]    sii_dbg1_l2t6_req;       //Req type encoded on 2 bits from sii to L2t 6
input  [1:0]    sii_dbg1_l2t7_req;       //Req type encoded on 2 bits from sii to L2t 7


input           l2t1_dbg1_sii_iq_dequeue;
input           l2t3_dbg1_sii_iq_dequeue;
input           l2t4_dbg1_sii_iq_dequeue;
input           l2t5_dbg1_sii_iq_dequeue;
input           l2t6_dbg1_sii_iq_dequeue;
input           l2t7_dbg1_sii_iq_dequeue;
input           dbg0_dbg1_l2t0_sii_iq_dequeue;
input           dbg0_dbg1_l2t2_sii_iq_dequeue;


input           l2t1_dbg1_sii_wib_dequeue;
input           l2t3_dbg1_sii_wib_dequeue;
input           l2t4_dbg1_sii_wib_dequeue;
input           l2t5_dbg1_sii_wib_dequeue;
input           l2t6_dbg1_sii_wib_dequeue;
input           l2t7_dbg1_sii_wib_dequeue;
input           dbg0_dbg1_l2t0_sii_wib_dequeue;
input           dbg0_dbg1_l2t2_sii_wib_dequeue;

input  [5:0]    l2t1_dbg1_xbar_vcid;
input  [5:0]    l2t3_dbg1_xbar_vcid;
input  [5:0]    l2t4_dbg1_xbar_vcid;
input  [5:0]    l2t5_dbg1_xbar_vcid;
input  [5:0]    l2t6_dbg1_xbar_vcid;
input  [5:0]    l2t7_dbg1_xbar_vcid;
input  [5:0]    dbg0_dbg1_l2t0_xbar_vcid;
input  [5:0]    dbg0_dbg1_l2t2_xbar_vcid;

input           l2b4_dbg1_sio_ctag_vld;
input           l2b5_dbg1_sio_ctag_vld;
input           l2b6_dbg1_sio_ctag_vld;
input           l2b7_dbg1_sio_ctag_vld;
input           dbg0_dbg1_l2b0_sio_ctag_vld;
input           dbg0_dbg1_l2b1_sio_ctag_vld;
input           dbg0_dbg1_l2b2_sio_ctag_vld;
input           dbg0_dbg1_l2b3_sio_ctag_vld;


input           l2b4_dbg1_sio_ack_type;
input           l2b5_dbg1_sio_ack_type;
input           l2b6_dbg1_sio_ack_type;
input           l2b7_dbg1_sio_ack_type;
input           dbg0_dbg1_l2b0_sio_ack_type;
input           dbg0_dbg1_l2b1_sio_ack_type;
input           dbg0_dbg1_l2b2_sio_ack_type;
input           dbg0_dbg1_l2b3_sio_ack_type;


input           l2b4_dbg1_sio_ack_dest; 
input           l2b5_dbg1_sio_ack_dest; 
input           l2b6_dbg1_sio_ack_dest; 
input           l2b7_dbg1_sio_ack_dest; 
input           dbg0_dbg1_l2b0_sio_ack_dest;
input           dbg0_dbg1_l2b1_sio_ack_dest;
input           dbg0_dbg1_l2b2_sio_ack_dest;
input           dbg0_dbg1_l2b3_sio_ack_dest;



input  [1:0]    spc1_dbg1_instr_cmt_grp0;
input  [1:0]    spc1_dbg1_instr_cmt_grp1;
input  [1:0]    spc3_dbg1_instr_cmt_grp0;
input  [1:0]    spc3_dbg1_instr_cmt_grp1;
input  [1:0]    spc4_dbg1_instr_cmt_grp0;
input  [1:0]    spc4_dbg1_instr_cmt_grp1;
input  [1:0]    spc5_dbg1_instr_cmt_grp0;
input  [1:0]    spc5_dbg1_instr_cmt_grp1;
input  [1:0]    spc6_dbg1_instr_cmt_grp0;
input  [1:0]    spc6_dbg1_instr_cmt_grp1;
input  [1:0]    spc7_dbg1_instr_cmt_grp0;
input  [1:0]    spc7_dbg1_instr_cmt_grp1;
input  [1:0]    dbg0_dbg1_spc0_instr_cmt_grp0;
input  [1:0]    dbg0_dbg1_spc0_instr_cmt_grp1;
input  [1:0]    dbg0_dbg1_spc2_instr_cmt_grp0;
input  [1:0]    dbg0_dbg1_spc2_instr_cmt_grp1;

input           sel_soc_obs_mode;
input           sel_charac_mode;
input           sel_rep_mode;
input		sel_core_soc_debug_mode;
input           sel_train_mode;



output	        l2t0_pa_match_synced;
output          l2t1_pa_match_synced;
output          l2t2_pa_match_synced;
output          l2t3_pa_match_synced;
output          l2t4_pa_match_synced;
output          l2t5_pa_match_synced;
output          l2t6_pa_match_synced;
output          l2t7_pa_match_synced;
output		l2t_error_event_synced;

output [165:0]	dbg1_mio_dbg_dq;
 
// Scan reassigns
assign pce_ov = tcu_pce_ov;
assign stop = tcu_clk_stop;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

// wire declarations

wire [165:0] dbg1_mio_dbg_dq_int;
wire [83:0]  mcu_dbg_signals_r;
wire [41:0]  mcu_dbg_bus,mcu_dbg_bus_syncd;
wire [165:0] rep_data;
wire [79:0]  charac_signal_bus,charac_signal_bus_0,charac_signal_bus_1;
wire [55:0]  obs_signal_bus,obs_signal_bus_0,obs_signal_bus_1;
wire [111:0] obs_signal_bus_io2x_fnl;
wire [165:0] soc_obs_data;
wire [159:0] charac_signal_bus_io2x_fnl;
wire [165:0] charac_data;
wire [165:0] dbg_mux0_data;
wire [165:0] dbg_mux1_data;
wire [165:0] core_soc_align_data;
wire [165:0] train_data,train_data_din;

wire [1:0]   train_seq_gen;
wire [1:0]   train_seq_gen_din;

// Train sequence generation logic 
// 2 cycle multicyle path from train_seq_gen[1:0] to train_data[165:0]
// 2 cmp clocks wide

db1_dbgprt_dp_inv_macro__stack_1l__width_1 train_seq_gen_0_inv    
        (
        .dout   (train_seq_gen_din[0]),
        .din    (train_seq_gen[0])
        );

db1_dbgprt_dp_xor_macro__stack_1l__width_1 xor1  
        (
        .dout   (train_seq_gen_din[1]),
        .din0   (train_seq_gen[0]),
        .din1   (train_seq_gen[1])
        );

db1_dbgprt_dp_msff_macro__stack_2c__width_2 ff_train_seq_gen        (
                .scan_in(ff_train_seq_gen_scanin),
                .scan_out(ff_train_seq_gen_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_23 ),
                .din    ( train_seq_gen_din[1:0]),
                .dout   ( train_seq_gen[1:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db1_dbgprt_dp_or_macro__stack_1l__width_1 or_train_seq  
        (
        .dout   (train_seq),
        .din1   (train_seq_gen[1]),
        .din0   (train_seq_gen[0])
        );
 

db1_dbgprt_dp_buff_macro__dbuff_8x__stack_20c__width_19 buf_tree_train_seq   
        (
        .din   ({train_seq,train_seq,
                  train_seq_b1,train_seq_b1,train_seq_b1,train_seq_b1,
                  train_seq_b1,train_seq_b1,train_seq_b1,train_seq_b1,
                  train_seq_b2,train_seq_b2,train_seq_b2,train_seq_b2,
                  train_seq_b2,train_seq_b2,train_seq_b2,train_seq_b2,
                  train_seq_b2}),
        .dout    ({train_seq_b1,train_seq_b2,
                   train_seq_b11,train_seq_b12,train_seq_b13,train_seq_b14,
                   train_seq_b15,train_seq_b16,train_seq_b17,train_seq_b18,
                   train_seq_b21,train_seq_b22,train_seq_b23,train_seq_b24,
                   train_seq_b25,train_seq_b26,train_seq_b27,train_seq_b28,
                   train_seq_b29
                  }) 
        );

assign train_data_din = {({6{train_seq_b29}}),({10{train_seq_b28}}),({10{train_seq_b27}}),
                         ({10{train_seq_b26}}),({10{train_seq_b25}}),({10{train_seq_b24}}),
                         ({10{train_seq_b23}}),({10{train_seq_b22}}),({10{train_seq_b21}}),
                         ({10{train_seq_b18}}),({10{train_seq_b17}}),({10{train_seq_b16}}),
                         ({10{train_seq_b15}}),({10{train_seq_b14}}),({10{train_seq_b13}}),
                         ({10{train_seq_b12}}),({10{train_seq_b11}})};

// flop train_data_din enabled with 700 mhz sync_en

db1_dbgprt_dp_msff_macro__stack_72c__width_72 ff_train_data_0        (
                .scan_in(ff_train_data_0_scanin),
                .scan_out(ff_train_data_0_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_23),
                .din    ( train_data_din[71:0]),
                .dout   ( train_data[71:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db1_dbgprt_dp_msff_macro__stack_72c__width_72 ff_train_data_1        (
                .scan_in(ff_train_data_1_scanin),
                .scan_out(ff_train_data_1_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_23),
                .din    ( train_data_din[143:72]),
                .dout   ( train_data[143:72]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );
db1_dbgprt_dp_msff_macro__stack_22c__width_22 ff_train_data_2        (
                .scan_in(ff_train_data_2_scanin),
                .scan_out(ff_train_data_2_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_23),
                .din    ( train_data_din[165:144]),
                .dout   ( train_data[165:144]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

// flops sync enables, L2t pa match and err event signals
// free running flops


db1_dbgprt_dp_msff_macro__stack_38c__width_37 ff_cmp_io_sync_en           (
                .scan_in(ff_cmp_io_sync_en_scanin),
                .scan_out(ff_cmp_io_sync_en_scanout),
                .clk    ( l2clk ),
                .en     ( 1'b1 ),
                .din    ( {cmp_io_sync_en,io_cmp_sync_en,io_cmp_sync_en_2,
                           io_cmp_sync_en_3,io_cmp_sync_en_4,io_cmp_sync_en_5,
                           io_cmp_sync_en_2,io_cmp_sync_en_32,io_cmp_sync_en_42,
                           io_cmp_sync_en_52,cmp_io2x_sync_en,cmp_io2x_sync_en,cmp_io2x_sync_en,
                           dbg0_dbg1_l2t0_pa_match,dbg0_dbg1_l2t2_pa_match,
                           l2t1_dbg1_pa_match,l2t3_dbg1_pa_match,l2t4_dbg1_pa_match,
                           l2t5_dbg1_pa_match,l2t6_dbg1_pa_match,l2t7_dbg1_pa_match,
                           l2t0_pa_match_rec_din,l2t1_pa_match_rec_din,l2t2_pa_match_rec_din,
                           l2t3_pa_match_rec_din,l2t4_pa_match_rec_din,l2t5_pa_match_rec_din,
                           l2t6_pa_match_rec_din,l2t7_pa_match_rec_din,
			   dbg0_dbg1_l2t0_err_event,dbg0_dbg1_l2t2_err_event,
			   l2t1_dbg1_err_event,l2t3_dbg1_err_event,l2t4_dbg1_err_event,
                           l2t5_dbg1_err_event,l2t6_dbg1_err_event,l2t7_dbg1_err_event
                           }),
                .dout   ( {dbg1_cmp_io_sync_en_2,io_cmp_sync_en_2,
                           io_cmp_sync_en_3,io_cmp_sync_en_4,io_cmp_sync_en_5,io_cmp_sync_en_6,
                           io_cmp_sync_en_32,io_cmp_sync_en_42,io_cmp_sync_en_52,
                           io_cmp_sync_en_62,cmp_io2x_sync_en_2,cmp_io2x_sync_en_22,cmp_io2x_sync_en_23,
                           l2t0_pa_match_r,l2t2_pa_match_r,l2t1_pa_match_r,
                           l2t3_pa_match_r,l2t4_pa_match_r,l2t5_pa_match_r,
                           l2t6_pa_match_r,l2t7_pa_match_r,
                           l2t0_pa_match_rec,l2t1_pa_match_rec,l2t2_pa_match_rec,
                           l2t3_pa_match_rec,l2t4_pa_match_rec,l2t5_pa_match_rec,
                           l2t6_pa_match_rec,l2t7_pa_match_rec,
                           l2t0_err_event_r,l2t2_err_event_r,l2t1_err_event_r,
                           l2t3_err_event_r,l2t4_err_event_r,l2t5_err_event_r,
                           l2t6_err_event_r,l2t7_err_event_r}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

// Flop tester charc/cpu debug and soc obs signals between l2t and sii once
// free running flops

db1_dbgprt_dp_msff_macro__stack_72c__width_72 ff_charac_signal_bus           (
                .scan_in(ff_charac_signal_bus_scanin),
                .scan_out(ff_charac_signal_bus_scanout),
                .clk    ( l2clk ),
                .en     ( 1'b1 ),
                .din    ( {spc5_dbg1_instr_cmt_grp1[1:0],spc5_dbg1_instr_cmt_grp0[1:0],
                           spc4_dbg1_instr_cmt_grp1[1:0],spc4_dbg1_instr_cmt_grp0[1:0],
                           spc3_dbg1_instr_cmt_grp1[1:0],spc3_dbg1_instr_cmt_grp0[1:0],
                           dbg0_dbg1_spc2_instr_cmt_grp1[1:0],dbg0_dbg1_spc2_instr_cmt_grp0[1:0],
                           spc1_dbg1_instr_cmt_grp1[1:0],spc1_dbg1_instr_cmt_grp0[1:0],
                           dbg0_dbg1_spc0_instr_cmt_grp1[1:0],dbg0_dbg1_spc0_instr_cmt_grp0[1:0],
                           l2t7_dbg1_xbar_vcid[5:0],l2t6_dbg1_xbar_vcid[5:0],
                           l2t5_dbg1_xbar_vcid[5:0],l2t4_dbg1_xbar_vcid[5:0],
                           l2t3_dbg1_xbar_vcid[5:0],dbg0_dbg1_l2t2_xbar_vcid[5:0],
                           l2t1_dbg1_xbar_vcid[5:0],dbg0_dbg1_l2t0_xbar_vcid[5:0]
                           }),
                .dout   ( charac_signal_bus[71:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
                );

db1_dbgprt_dp_msff_macro__stack_64c__width_64 ff_obs_signal_bus          (
                .scan_in(ff_obs_signal_bus_scanin),
                .scan_out(ff_obs_signal_bus_scanout),
                .clk    ( l2clk ),
                .en     ( 1'b1 ),
                .din    ( {sii_dbg1_l2t7_req[1:0],l2t7_dbg1_sii_iq_dequeue,
                           l2t7_dbg1_sii_wib_dequeue,l2b7_dbg1_sio_ctag_vld,
                           l2b7_dbg1_sio_ack_type,l2b7_dbg1_sio_ack_dest,
                           sii_dbg1_l2t6_req[1:0],l2t6_dbg1_sii_iq_dequeue,
                           l2t6_dbg1_sii_wib_dequeue,l2b6_dbg1_sio_ctag_vld,
                           l2b6_dbg1_sio_ack_type,l2b6_dbg1_sio_ack_dest,
		           sii_dbg1_l2t5_req[1:0],l2t5_dbg1_sii_iq_dequeue,
                           l2t5_dbg1_sii_wib_dequeue,l2b5_dbg1_sio_ctag_vld,
                           l2b5_dbg1_sio_ack_type,l2b5_dbg1_sio_ack_dest,
                           sii_dbg1_l2t4_req[1:0],l2t4_dbg1_sii_iq_dequeue,
                           l2t4_dbg1_sii_wib_dequeue,l2b4_dbg1_sio_ctag_vld,
                           l2b4_dbg1_sio_ack_type,l2b4_dbg1_sio_ack_dest,
                           sii_dbg1_l2t3_req[1:0],l2t3_dbg1_sii_iq_dequeue,
                           l2t3_dbg1_sii_wib_dequeue,dbg0_dbg1_l2b3_sio_ctag_vld,
                           dbg0_dbg1_l2b3_sio_ack_type,dbg0_dbg1_l2b3_sio_ack_dest,
                           sii_dbg1_l2t2_req[1:0],dbg0_dbg1_l2t2_sii_iq_dequeue,
                           dbg0_dbg1_l2t2_sii_wib_dequeue,dbg0_dbg1_l2b2_sio_ctag_vld,
                           dbg0_dbg1_l2b2_sio_ack_type,dbg0_dbg1_l2b2_sio_ack_dest,
                           sii_dbg1_l2t1_req[1:0],l2t1_dbg1_sii_iq_dequeue,
                           l2t1_dbg1_sii_wib_dequeue,dbg0_dbg1_l2b1_sio_ctag_vld,
                           dbg0_dbg1_l2b1_sio_ack_type,dbg0_dbg1_l2b1_sio_ack_dest,
                           sii_dbg1_l2t0_req[1:0],dbg0_dbg1_l2t0_sii_iq_dequeue,
                           dbg0_dbg1_l2t0_sii_wib_dequeue,dbg0_dbg1_l2b0_sio_ctag_vld,
                           dbg0_dbg1_l2b0_sio_ack_type,dbg0_dbg1_l2b0_sio_ack_dest,
                           spc7_dbg1_instr_cmt_grp1[1:0],spc7_dbg1_instr_cmt_grp0[1:0],
                           spc6_dbg1_instr_cmt_grp1[1:0],spc6_dbg1_instr_cmt_grp0[1:0]
                           }),
                .dout   ( {obs_signal_bus[55:0],charac_signal_bus[79:72]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );


// OR piped versions of sync enables to generate mux selects

db1_dbgprt_dp_or_macro__stack_1l__width_1 or_sync_3_4   
        (
        .din0   (io_cmp_sync_en_3),
        .din1   (io_cmp_sync_en_4),
        .dout   (io_cmp_sync_en_3or4)
        );

db1_dbgprt_dp_or_macro__stack_1l__width_1 or_sync_32_42   
        (
        .din0   (io_cmp_sync_en_32),
        .din1   (io_cmp_sync_en_42),
        .dout   (io_cmp_sync_en_32or42)
        );

db1_dbgprt_dp_or_macro__stack_1l__width_1 or_sync_5_6   
        (
        .din0   (io_cmp_sync_en_5),
        .din1   (io_cmp_sync_en_6),
        .dout   (io_cmp_sync_en_5or6)
        );

db1_dbgprt_dp_or_macro__stack_1l__width_1 or_sync_52_62   
        (
        .din0   (io_cmp_sync_en_52),
        .din1   (io_cmp_sync_en_62),
        .dout   (io_cmp_sync_en_52or62)
        );

// these flops are set by l2tx_pa_match_r, and hold value until the next sync pulse
// when they are cleared to 0. Unless l2tx_pa_match_r are 1's, in which case , does
// not get cleared but stay 1's

/*
assign l2t0_pa_match_rec_din = l2t0_pa_match_r | (l2t0_pa_match_rec & ~dbg1_cmp_io_sync_en_2);
assign l2t1_pa_match_rec_din = l2t1_pa_match_r | (l2t1_pa_match_rec & ~dbg1_cmp_io_sync_en_2);
assign l2t2_pa_match_rec_din = l2t2_pa_match_r | (l2t2_pa_match_rec & ~dbg1_cmp_io_sync_en_2);
assign l2t3_pa_match_rec_din = l2t3_pa_match_r | (l2t3_pa_match_rec & ~dbg1_cmp_io_sync_en_2);
assign l2t4_pa_match_rec_din = l2t4_pa_match_r | (l2t4_pa_match_rec & ~dbg1_cmp_io_sync_en_2);
assign l2t5_pa_match_rec_din = l2t5_pa_match_r | (l2t5_pa_match_rec & ~dbg1_cmp_io_sync_en_2);
assign l2t6_pa_match_rec_din = l2t6_pa_match_r | (l2t6_pa_match_rec & ~dbg1_cmp_io_sync_en_2);
assign l2t7_pa_match_rec_din = l2t7_pa_match_r | (l2t7_pa_match_rec & ~dbg1_cmp_io_sync_en_2);
*/

db1_dbgprt_dp_inv_macro__stack_1l__width_1 cmp_io2x_sync_en_2_inv    
        (
        .dout   (cmp_io2x_sync_en_2_n),
        .din    (cmp_io2x_sync_en_2)
        );

db1_dbgprt_dp_inv_macro__stack_1l__width_1 dbg1_cmp_io_sync_en_2_inv_slice  
        (
        .dout   (dbg1_cmp_io_sync_en_2_n),
        .din    (dbg1_cmp_io_sync_en_2)
        );

db1_dbgprt_dp_inv_macro__stack_1l__width_1 sel_train_mode_inv  
        (
        .dout   (sel_train_mode_n),
        .din    (sel_train_mode)
        );

db1_dbgprt_dp_and_macro__stack_1l__width_1  and0  
        (
        .dout   (l2t0_pa_match_rec_sync),
        .din0   (dbg1_cmp_io_sync_en_2_n),
        .din1   (l2t0_pa_match_rec)
        );


db1_dbgprt_dp_or_macro__stack_1l__width_1 or0  
        (
        .dout   (l2t0_pa_match_rec_din),
        .din0   (l2t0_pa_match_r),
        .din1   (l2t0_pa_match_rec_sync)
        );


db1_dbgprt_dp_and_macro__stack_1l__width_1  and1  
        (
        .dout   (l2t1_pa_match_rec_sync),
        .din0   (dbg1_cmp_io_sync_en_2_n),
        .din1   (l2t1_pa_match_rec)
        );


db1_dbgprt_dp_or_macro__stack_1l__width_1 or1  
        (
        .dout   (l2t1_pa_match_rec_din),
        .din0   (l2t1_pa_match_r),
        .din1   (l2t1_pa_match_rec_sync)
        );


db1_dbgprt_dp_and_macro__stack_1l__width_1  and2  
        (
        .dout   (l2t2_pa_match_rec_sync),
        .din0   (dbg1_cmp_io_sync_en_2_n),
        .din1   (l2t2_pa_match_rec)
        );


db1_dbgprt_dp_or_macro__stack_1l__width_1 or2  
        (
        .dout   (l2t2_pa_match_rec_din),
        .din0   (l2t2_pa_match_r),
        .din1   (l2t2_pa_match_rec_sync)
        );

db1_dbgprt_dp_and_macro__stack_1l__width_1  and3  
        (
        .dout   (l2t3_pa_match_rec_sync),
        .din0   (dbg1_cmp_io_sync_en_2_n),
        .din1   (l2t3_pa_match_rec)
        );


db1_dbgprt_dp_or_macro__stack_1l__width_1 or3  
        (
        .dout   (l2t3_pa_match_rec_din),
        .din0   (l2t3_pa_match_r),
        .din1   (l2t3_pa_match_rec_sync)
        );

db1_dbgprt_dp_and_macro__stack_1l__width_1  and4  
        (
        .dout   (l2t4_pa_match_rec_sync),
        .din0   (dbg1_cmp_io_sync_en_2_n),
        .din1   (l2t4_pa_match_rec)
        );


db1_dbgprt_dp_or_macro__stack_1l__width_1 or4  
        (
        .dout   (l2t4_pa_match_rec_din),
        .din0   (l2t4_pa_match_r),
        .din1   (l2t4_pa_match_rec_sync)
        );

db1_dbgprt_dp_and_macro__stack_1l__width_1  and5  
        (
        .dout   (l2t5_pa_match_rec_sync),
        .din0   (dbg1_cmp_io_sync_en_2_n),
        .din1   (l2t5_pa_match_rec)
        );


db1_dbgprt_dp_or_macro__stack_1l__width_1 or5  
        (
        .dout   (l2t5_pa_match_rec_din),
        .din0   (l2t5_pa_match_r),
        .din1   (l2t5_pa_match_rec_sync)
        );

db1_dbgprt_dp_and_macro__stack_1l__width_1  and6  
        (
        .dout   (l2t6_pa_match_rec_sync),
        .din0   (dbg1_cmp_io_sync_en_2_n),
        .din1   (l2t6_pa_match_rec)
        );


db1_dbgprt_dp_or_macro__stack_1l__width_1 or6  
        (
        .dout   (l2t6_pa_match_rec_din),
        .din0   (l2t6_pa_match_r),
        .din1   (l2t6_pa_match_rec_sync)
        );

db1_dbgprt_dp_and_macro__stack_1l__width_1  and7  
        (
        .dout   (l2t7_pa_match_rec_sync),
        .din0   (dbg1_cmp_io_sync_en_2_n),
        .din1   (l2t7_pa_match_rec)
        );


db1_dbgprt_dp_or_macro__stack_1l__width_1 or7  
        (
        .dout   (l2t7_pa_match_rec_din),
        .din0   (l2t7_pa_match_r),
        .din1   (l2t7_pa_match_rec_sync)
        );

// Or all the L2 error events here and sync to iol2clk

// assign l2t_error_event = (l2t0_err_event_r | l2t1_err_event_r | l2t2_err_event_r |
//                           l2t3_err_event_r | l2t4_err_event_r | l2t5_err_event_r |
//                           l2t6_err_event_r | l2t7_err_event_r);


db1_dbgprt_dp_or_macro__ports_3__stack_1l__width_1 err_event_or0    
                        (.dout (l2t012_err_event_r),
                         .din0 (l2t0_err_event_r),
                         .din1 (l2t1_err_event_r),
                         .din2 (l2t2_err_event_r)
                        );

db1_dbgprt_dp_or_macro__ports_3__stack_1l__width_1 err_event_or1    
                        (.dout (l2t345_err_event_r),
                         .din0 (l2t3_err_event_r),
                         .din1 (l2t4_err_event_r),
                         .din2 (l2t5_err_event_r)
                        );

db1_dbgprt_dp_or_macro__ports_2__stack_1l__width_1 err_event_or2    
                        (.dout (l2t67_err_event_r),
                         .din0 (l2t6_err_event_r),
                         .din1 (l2t7_err_event_r)
                        );

db1_dbgprt_dp_or_macro__ports_3__stack_1l__width_1 err_event_or3    
                        (.dout (l2t_error_event),
                         .din0 (l2t012_err_event_r),
                         .din1 (l2t345_err_event_r),
                         .din2 (l2t67_err_event_r)
                        );



db1_dbgprt_dp_msff_macro__stack_9c__width_9 ff_l2tx_pa_match_synced        (
                .scan_in(ff_l2tx_pa_match_synced_scanin),
                .scan_out(ff_l2tx_pa_match_synced_scanout),
                .clk    ( l2clk ),
                .en     ( dbg1_cmp_io_sync_en_2),
                .din    ( {l2t0_pa_match_rec,l2t1_pa_match_rec,l2t2_pa_match_rec,
                           l2t3_pa_match_rec,l2t4_pa_match_rec,l2t5_pa_match_rec,
                           l2t6_pa_match_rec,l2t7_pa_match_rec,l2t_error_event}),
                .dout   ( {l2t0_pa_match_synced,l2t1_pa_match_synced,l2t2_pa_match_synced,
			   l2t3_pa_match_synced,l2t4_pa_match_synced,l2t5_pa_match_synced,
			   l2t6_pa_match_synced,l2t7_pa_match_synced,l2t_error_event_synced}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                ); 

// flop mcu_dbg_signals bits [83:0]
// flop with enable coming from io_cmp_sync_en

db1_dbgprt_dp_msff_macro__stack_72c__width_72 ff_mcu_dbg_signals_slice0        (
                .scan_in(ff_mcu_dbg_signals_slice0_scanin),
                .scan_out(ff_mcu_dbg_signals_slice0_scanout),
                .clk    ( l2clk ),
                .en     ( io_cmp_sync_en_2),
                .din    ( mcu_dbg_signals[71:0]),
                .dout   ( mcu_dbg_signals_r[71:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db1_dbgprt_dp_msff_macro__stack_12c__width_12 ff_mcu_dbg_signals_slice1          (
                .scan_in(ff_mcu_dbg_signals_slice1_scanin),
                .scan_out(ff_mcu_dbg_signals_slice1_scanout),
                .clk    ( l2clk ),
                .en     ( io_cmp_sync_en_2),
                .din    ( mcu_dbg_signals[83:72]),
                .dout   ( mcu_dbg_signals_r[83:72]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

// Mux between mcu_dbg_signals[41:0] and mcu_dbg_signals[83:42]

db1_dbgprt_dp_mux_macro__mux_aonpe__stack_42c__width_42 mux_1 
             (
                .dout (mcu_dbg_bus[41:0]),
                .din0  (mcu_dbg_signals_r[41:0]),
                .din1  (mcu_dbg_signals_r[83:42]),
                .sel0 (io_cmp_sync_en_3or4),
                .sel1 (io_cmp_sync_en_5or6)
              ) ;

// FLop mcu_dbg_bus with enable coming off of registered cmp_io2x_sync_en

db1_dbgprt_dp_msff_macro__stack_42c__width_42 ff_mcu_dbg_bus           (
                .scan_in(ff_mcu_dbg_bus_scanin),
                .scan_out(ff_mcu_dbg_bus_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2 ),
                .din    ( mcu_dbg_bus[41:0]),
                .dout   ( mcu_dbg_bus_syncd[41:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

// Flop dbg0_dbg1_debug_data[165:0] with enable coming off of registered cmp_io2x_sync_en

db1_dbgprt_dp_msff_macro__stack_72c__width_72 ff_rep_bus_slice0           (
                .scan_in(ff_rep_bus_slice0_scanin),
                .scan_out(ff_rep_bus_slice0_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2 ),
                .din    ( dbg0_dbg1_debug_data[71:0]),
                .dout   ( rep_data[71:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db1_dbgprt_dp_msff_macro__stack_12r__width_12 ff_rep_bus_slice1           (
                .scan_in(ff_rep_bus_slice1_scanin),
                .scan_out(ff_rep_bus_slice1_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2 ),
                .din    ( dbg0_dbg1_debug_data[83:72]),
                .dout   ( rep_data[83:72]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db1_dbgprt_dp_msff_macro__stack_72c__width_72 ff_rep_bus_slice2           (
                .scan_in(ff_rep_bus_slice2_scanin),
                .scan_out(ff_rep_bus_slice2_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2 ),
                .din    ( dbg0_dbg1_debug_data[155:84]),
                .dout   ( rep_data[155:84]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
               );

db1_dbgprt_dp_msff_macro__stack_10r__width_10 ff_rep_bus_slice3           (
                .scan_in(ff_rep_bus_slice3_scanin),
                .scan_out(ff_rep_bus_slice3_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2 ),
                .din    ( dbg0_dbg1_debug_data[165:156]),
                .dout   ( rep_data[165:156]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
               );

// Logic to convert obs_signal_bus[55:0]
// from l2clk to io2xclk domain

db1_dbgprt_dp_msff_macro__stack_56c__width_56 ff_obs_signal_bus_io2x_0        (
                .scan_in(ff_obs_signal_bus_io2x_0_scanin),
                .scan_out(ff_obs_signal_bus_io2x_0_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2 ),
                .din    (obs_signal_bus[55:0]),
                .dout   (obs_signal_bus_0[55:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db1_dbgprt_dp_msff_macro__stack_56c__width_56 ff_obs_signal_bus_io2x_1        (
                .scan_in(ff_obs_signal_bus_io2x_1_scanin),
                .scan_out(ff_obs_signal_bus_io2x_1_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2_n ),
                .din    (obs_signal_bus[55:0]),
                .dout   (obs_signal_bus_1[55:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db1_dbgprt_dp_msff_macro__stack_56c__width_56 ff_obs_signal_bus_io2x_fnl_0        (
                .scan_in(ff_obs_signal_bus_io2x_fnl_0_scanin),
                .scan_out(ff_obs_signal_bus_io2x_fnl_0_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2 ),
                .din    ( obs_signal_bus_0[55:0]),
                .dout   ( obs_signal_bus_io2x_fnl[55:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db1_dbgprt_dp_msff_macro__stack_56c__width_56 ff_obs_signal_bus_io2x_fnl_1        (
                .scan_in(ff_obs_signal_bus_io2x_fnl_1_scanin),
                .scan_out(ff_obs_signal_bus_io2x_fnl_1_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2 ),
                .din    ( obs_signal_bus_1[55:0]),
                .dout   ( obs_signal_bus_io2x_fnl[111:56]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

assign soc_obs_data = {10'b0,obs_signal_bus_io2x_fnl[111:0],2'b0,mcu_dbg_bus_syncd[41:0]};

// Logic to convert charac_signal_bus[79:0] from l2clk to io2xclk domain

db1_dbgprt_dp_msff_macro__stack_72c__width_72 ff_charac_signal_bus_io2x_0a        (
                .scan_in(ff_charac_signal_bus_io2x_0a_scanin),
                .scan_out(ff_charac_signal_bus_io2x_0a_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2 ),
                .din    ( charac_signal_bus[71:0]),
                .dout   ( charac_signal_bus_0[71:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db1_dbgprt_dp_msff_macro__stack_8r__width_8 ff_charac_signal_bus_io2x_0b        (
                .scan_in(ff_charac_signal_bus_io2x_0b_scanin),
                .scan_out(ff_charac_signal_bus_io2x_0b_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2 ),
                .din    ( charac_signal_bus[79:72]),
                .dout   ( charac_signal_bus_0[79:72]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db1_dbgprt_dp_msff_macro__stack_72c__width_72 ff_charac_signal_bus_io2x_1a        (
                .scan_in(ff_charac_signal_bus_io2x_1a_scanin),
                .scan_out(ff_charac_signal_bus_io2x_1a_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2_n ),
                .din    ( charac_signal_bus[71:0]),
                .dout   ( charac_signal_bus_1[71:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db1_dbgprt_dp_msff_macro__stack_8r__width_8 ff_charac_signal_bus_io2x_1b        (
                .scan_in(ff_charac_signal_bus_io2x_1b_scanin),
                .scan_out(ff_charac_signal_bus_io2x_1b_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2_n ),
                .din    ( charac_signal_bus[79:72]),
                .dout   ( charac_signal_bus_1[79:72]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );


db1_dbgprt_dp_msff_macro__stack_72c__width_72 ff_charac_signal_bus_io2x_fnl_0a        (
                .scan_in(ff_charac_signal_bus_io2x_fnl_0a_scanin),
                .scan_out(ff_charac_signal_bus_io2x_fnl_0a_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2),
                .din    ( charac_signal_bus_0[71:0]),
                .dout   ( charac_signal_bus_io2x_fnl[71:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );


db1_dbgprt_dp_msff_macro__stack_8r__width_8 ff_charac_signal_bus_io2x_fnl_1        (
                .scan_in(ff_charac_signal_bus_io2x_fnl_1_scanin),
                .scan_out(ff_charac_signal_bus_io2x_fnl_1_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2),
                .din    ( charac_signal_bus_0[79:72]),
                .dout   ( charac_signal_bus_io2x_fnl[79:72]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db1_dbgprt_dp_msff_macro__stack_72c__width_72 ff_charac_signal_bus_io2x_fnl_2        (
                .scan_in(ff_charac_signal_bus_io2x_fnl_2_scanin),
                .scan_out(ff_charac_signal_bus_io2x_fnl_2_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2),
                .din    ( charac_signal_bus_1[71:0]),
                .dout   ( charac_signal_bus_io2x_fnl[151:80]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db1_dbgprt_dp_msff_macro__stack_8r__width_8 ff_charac_signal_bus_io2x_fnl_3        (
                .scan_in(ff_charac_signal_bus_io2x_fnl_3_scanin),
                .scan_out(ff_charac_signal_bus_io2x_fnl_3_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2),
                .din    ( charac_signal_bus_1[79:72]),
                .dout   ( charac_signal_bus_io2x_fnl[159:152]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

assign charac_data = {6'b0,charac_signal_bus_io2x_fnl[159:0]};


assign core_soc_align_data = {16'b0,charac_signal_bus_io2x_fnl[159:128],
                                    charac_signal_bus_io2x_fnl[79:48],
                                    3'b0,rep_data[82:0]};
				// DMU to sii,ncu interface data and core data on every
				// cmp cycle

// 2 cycle ( 2 cmp cycles ) multicycle path from soc_obs_data,charac_data,rep_data,
// core_soc_align_data,train_data to dbg1_mio_dbg_dq[165:0]
 

db1_dbgprt_dp_mux_macro__mux_aonpe__ports_4__stack_72c__width_72 mux_2 
               (
                .dout (dbg_mux0_data[71:0]),
                .din0  (soc_obs_data[71:0]),
                .din1  (charac_data[71:0]),
	        .din2  (rep_data[71:0]),
		.din3  (core_soc_align_data[71:0]),
                .sel0 (sel_soc_obs_mode),
                .sel1 (sel_charac_mode),
                .sel2 (sel_rep_mode),
		.sel3 (sel_core_soc_debug_mode)
              ) ;

db1_dbgprt_dp_mux_macro__mux_aonpe__ports_4__stack_72c__width_72 mux_3 
               (
                .dout (dbg_mux0_data[143:72]),
                .din0  (soc_obs_data[143:72]),
                .din1  (charac_data[143:72]),
	        .din2  (rep_data[143:72]),
                .din3  (core_soc_align_data[143:72]),
                .sel0 (sel_soc_obs_mode),
                .sel1 (sel_charac_mode),
	        .sel2 (sel_rep_mode),
                .sel3 (sel_core_soc_debug_mode)
              ) ;

db1_dbgprt_dp_mux_macro__mux_aonpe__ports_4__stack_22c__width_22 mux_4 
               (
                .dout (dbg_mux0_data[165:144]),
                .din0  (soc_obs_data[165:144]),
                .din1  (charac_data[165:144]),
                .din2  (rep_data[165:144]),
                .din3  (core_soc_align_data[165:144]),
                .sel0 (sel_soc_obs_mode),
                .sel1 (sel_charac_mode),
                .sel2 (sel_rep_mode),
                .sel3 (sel_core_soc_debug_mode)
              ) ;

db1_dbgprt_dp_mux_macro__mux_aonpe__ports_2__stack_72c__width_72 mux_5 
               (
                .dout (dbg_mux1_data[71:0]),
                .din0  (dbg_mux0_data[71:0]),
                .din1  (train_data[71:0]),
                .sel0 (sel_train_mode_n),
                .sel1 (sel_train_mode)
              ) ;

db1_dbgprt_dp_mux_macro__mux_aonpe__ports_2__stack_72c__width_72 mux_6 
               (
                .dout (dbg_mux1_data[143:72]),
                .din0  (dbg_mux0_data[143:72]),
                .din1  (train_data[143:72]),
                .sel0 (sel_train_mode_n),
                .sel1 (sel_train_mode)
              ) ;

db1_dbgprt_dp_mux_macro__mux_aonpe__ports_2__stack_22c__width_22 mux_7 
               (
                .dout (dbg_mux1_data[165:144]),
                .din0  (dbg_mux0_data[165:144]),
                .din1  (train_data[165:144]),
                .sel0 (sel_train_mode_n),
                .sel1 (sel_train_mode)
              ) ;


db1_dbgprt_dp_msff_macro__dmsff_32x__stack_72c__width_72 ff_dbg1_mio_dbg_dq_0         (
                .scan_in(ff_dbg1_mio_dbg_dq_0_scanin),
                .scan_out(ff_dbg1_mio_dbg_dq_0_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_22),
                .din    ( dbg_mux1_data[71:0]),
                .dout   ( dbg1_mio_dbg_dq_int[71:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db1_dbgprt_dp_msff_macro__dmsff_32x__stack_72c__width_72 ff_dbg1_mio_dbg_dq_1         (
                .scan_in(ff_dbg1_mio_dbg_dq_1_scanin),
                .scan_out(ff_dbg1_mio_dbg_dq_1_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_22),
                .din    ( dbg_mux1_data[143:72]),
                .dout   ( dbg1_mio_dbg_dq_int[143:72]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );
db1_dbgprt_dp_msff_macro__dmsff_32x__stack_22c__width_22 ff_dbg1_mio_dbg_dq_2         (
                .scan_in(ff_dbg1_mio_dbg_dq_2_scanin),
                .scan_out(ff_dbg1_mio_dbg_dq_2_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_22),
                .din    ( dbg_mux1_data[165:144]),
                .dout   ( dbg1_mio_dbg_dq_int[165:144]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db1_dbgprt_dp_inv_macro__stack_1l__width_1 ccu_dbg1_serdes_dtm_inv    
        (
        .dout   (ccu_dbg1_serdes_dtm_n),
        .din    (ccu_dbg1_serdes_dtm)
        );


db1_dbgprt_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_72c__width_72 mux_dtm_1 
               (
                .dout (dbg1_mio_dbg_dq[71:0]),
                .din0 (mcu_dtm_signals[71:0]),
                .din1 (dbg1_mio_dbg_dq_int[71:0]),
                .sel0 (ccu_dbg1_serdes_dtm),
                .sel1 (ccu_dbg1_serdes_dtm_n)
              ) ;

db1_dbgprt_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_16c__width_16 mux_dtm_2 
               (
                .dout (dbg1_mio_dbg_dq[87:72]),
                .din0 (mcu_dtm_signals[87:72]),
                .din1 (dbg1_mio_dbg_dq_int[87:72]),
                .sel0 (ccu_dbg1_serdes_dtm),
                .sel1 (ccu_dbg1_serdes_dtm_n)
              ) ;

assign dbg1_mio_dbg_dq[165:88] = dbg1_mio_dbg_dq_int[165:88];

// fixscan start:
assign ff_train_seq_gen_scanin   = scan_in                  ;
assign ff_train_data_0_scanin    = ff_train_seq_gen_scanout ;
assign ff_train_data_1_scanin    = ff_train_data_0_scanout  ;
assign ff_train_data_2_scanin    = ff_train_data_1_scanout  ;
assign ff_cmp_io_sync_en_scanin  = ff_train_data_2_scanout  ;
assign ff_charac_signal_bus_scanin = ff_cmp_io_sync_en_scanout;
assign ff_obs_signal_bus_scanin  = ff_charac_signal_bus_scanout;
assign ff_l2tx_pa_match_synced_scanin = ff_obs_signal_bus_scanout;
assign ff_mcu_dbg_signals_slice0_scanin = ff_l2tx_pa_match_synced_scanout;
assign ff_mcu_dbg_signals_slice1_scanin = ff_mcu_dbg_signals_slice0_scanout;
assign ff_mcu_dbg_bus_scanin     = ff_mcu_dbg_signals_slice1_scanout;
assign ff_rep_bus_slice0_scanin  = ff_mcu_dbg_bus_scanout   ;
assign ff_rep_bus_slice1_scanin  = ff_rep_bus_slice0_scanout;
assign ff_rep_bus_slice2_scanin  = ff_rep_bus_slice1_scanout;
assign ff_rep_bus_slice3_scanin  = ff_rep_bus_slice2_scanout;
assign ff_obs_signal_bus_io2x_0_scanin = ff_rep_bus_slice3_scanout;
assign ff_obs_signal_bus_io2x_1_scanin = ff_obs_signal_bus_io2x_0_scanout;
assign ff_obs_signal_bus_io2x_fnl_0_scanin = ff_obs_signal_bus_io2x_1_scanout;
assign ff_obs_signal_bus_io2x_fnl_1_scanin = ff_obs_signal_bus_io2x_fnl_0_scanout;
assign ff_charac_signal_bus_io2x_0a_scanin = ff_obs_signal_bus_io2x_fnl_1_scanout;
assign ff_charac_signal_bus_io2x_0b_scanin = ff_charac_signal_bus_io2x_0a_scanout;
assign ff_charac_signal_bus_io2x_1a_scanin = ff_charac_signal_bus_io2x_0b_scanout;
assign ff_charac_signal_bus_io2x_1b_scanin = ff_charac_signal_bus_io2x_1a_scanout;
assign ff_charac_signal_bus_io2x_fnl_0a_scanin = ff_charac_signal_bus_io2x_1b_scanout;
assign ff_charac_signal_bus_io2x_fnl_1_scanin = ff_charac_signal_bus_io2x_fnl_0a_scanout;
assign ff_charac_signal_bus_io2x_fnl_2_scanin = ff_charac_signal_bus_io2x_fnl_1_scanout;
assign ff_charac_signal_bus_io2x_fnl_3_scanin = ff_charac_signal_bus_io2x_fnl_2_scanout;
assign ff_dbg1_mio_dbg_dq_0_scanin = ff_charac_signal_bus_io2x_fnl_3_scanout;
assign ff_dbg1_mio_dbg_dq_1_scanin = ff_dbg1_mio_dbg_dq_0_scanout;
assign ff_dbg1_mio_dbg_dq_2_scanin = ff_dbg1_mio_dbg_dq_1_scanout;
assign scan_out                  = ff_dbg1_mio_dbg_dq_2_scanout;
// fixscan end:
endmodule


//
//   invert macro
//
//





module db1_dbgprt_dp_inv_macro__stack_1l__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//
//   xor macro for ports = 2,3
//
//





module db1_dbgprt_dp_xor_macro__stack_1l__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;





xor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);








endmodule









// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_msff_macro__stack_2c__width_2 (
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
wire [0:0] so;

  input [1:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [1:0] dout;


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
dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);




















endmodule









//  
//   or macro for ports = 2,3
//
//





module db1_dbgprt_dp_or_macro__stack_1l__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   buff macro
//
//





module db1_dbgprt_dp_buff_macro__dbuff_8x__stack_20c__width_19 (
  din, 
  dout);
  input [18:0] din;
  output [18:0] dout;






buff #(19)  d0_0 (
.in(din[18:0]),
.out(dout[18:0])
);








endmodule









// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_msff_macro__stack_72c__width_72 (
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
wire [70:0] so;

  input [71:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [71:0] dout;


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
dff #(72)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[71:0]),
.si({scan_in,so[70:0]}),
.so({so[70:0],scan_out}),
.q(dout[71:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_msff_macro__stack_22c__width_22 (
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
wire [20:0] so;

  input [21:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [21:0] dout;


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
dff #(22)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[21:0]),
.si({scan_in,so[20:0]}),
.so({so[20:0],scan_out}),
.q(dout[21:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_msff_macro__stack_38c__width_37 (
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
wire [35:0] so;

  input [36:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [36:0] dout;


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
dff #(37)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[36:0]),
.si({scan_in,so[35:0]}),
.so({so[35:0],scan_out}),
.q(dout[36:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_msff_macro__stack_64c__width_64 (
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
wire [62:0] so;

  input [63:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


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
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule









//  
//   and macro for ports = 2,3,4
//
//





module db1_dbgprt_dp_and_macro__stack_1l__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module db1_dbgprt_dp_or_macro__ports_3__stack_1l__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






or3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module db1_dbgprt_dp_or_macro__ports_2__stack_1l__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule









// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_msff_macro__stack_9c__width_9 (
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
wire [7:0] so;

  input [8:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [8:0] dout;


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
dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_msff_macro__stack_12c__width_12 (
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
wire [10:0] so;

  input [11:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [11:0] dout;


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
dff #(12)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[11:0]),
.si({scan_in,so[10:0]}),
.so({so[10:0],scan_out}),
.q(dout[11:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_mux_macro__mux_aonpe__stack_42c__width_42 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [41:0] din0;
  input sel0;
  input [41:0] din1;
  input sel1;
  output [41:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(42)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[41:0]),
  .in1(din1[41:0]),
.dout(dout[41:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_msff_macro__stack_42c__width_42 (
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
wire [40:0] so;

  input [41:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [41:0] dout;


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
dff #(42)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[41:0]),
.si({scan_in,so[40:0]}),
.so({so[40:0],scan_out}),
.q(dout[41:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_msff_macro__stack_12r__width_12 (
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
wire [10:0] so;

  input [11:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [11:0] dout;


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
dff #(12)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[11:0]),
.si({scan_in,so[10:0]}),
.so({so[10:0],scan_out}),
.q(dout[11:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_msff_macro__stack_10r__width_10 (
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
wire [8:0] so;

  input [9:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [9:0] dout;


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
dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_msff_macro__stack_56c__width_56 (
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
wire [54:0] so;

  input [55:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [55:0] dout;


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
dff #(56)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[55:0]),
.si({scan_in,so[54:0]}),
.so({so[54:0],scan_out}),
.q(dout[55:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_msff_macro__stack_8r__width_8 (
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
wire [6:0] so;

  input [7:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [7:0] dout;


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
dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_mux_macro__mux_aonpe__ports_4__stack_72c__width_72 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;

  input [71:0] din0;
  input sel0;
  input [71:0] din1;
  input sel1;
  input [71:0] din2;
  input sel2;
  input [71:0] din3;
  input sel3;
  output [71:0] dout;





cl_dp1_muxbuff4_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(72)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[71:0]),
  .in1(din1[71:0]),
  .in2(din2[71:0]),
  .in3(din3[71:0]),
.dout(dout[71:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_mux_macro__mux_aonpe__ports_4__stack_22c__width_22 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;

  input [21:0] din0;
  input sel0;
  input [21:0] din1;
  input sel1;
  input [21:0] din2;
  input sel2;
  input [21:0] din3;
  input sel3;
  output [21:0] dout;





cl_dp1_muxbuff4_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(22)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[21:0]),
  .in1(din1[21:0]),
  .in2(din2[21:0]),
  .in3(din3[21:0]),
.dout(dout[21:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_mux_macro__mux_aonpe__ports_2__stack_72c__width_72 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [71:0] din0;
  input sel0;
  input [71:0] din1;
  input sel1;
  output [71:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(72)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[71:0]),
  .in1(din1[71:0]),
.dout(dout[71:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_mux_macro__mux_aonpe__ports_2__stack_22c__width_22 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [21:0] din0;
  input sel0;
  input [21:0] din1;
  input sel1;
  output [21:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(22)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[21:0]),
  .in1(din1[21:0]),
.dout(dout[21:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_msff_macro__dmsff_32x__stack_72c__width_72 (
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
wire [70:0] so;

  input [71:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [71:0] dout;


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
dff #(72)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[71:0]),
.si({scan_in,so[70:0]}),
.so({so[70:0],scan_out}),
.q(dout[71:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_msff_macro__dmsff_32x__stack_22c__width_22 (
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
wire [20:0] so;

  input [21:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [21:0] dout;


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
dff #(22)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[21:0]),
.si({scan_in,so[20:0]}),
.so({so[20:0],scan_out}),
.q(dout[21:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_72c__width_72 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [71:0] din0;
  input sel0;
  input [71:0] din1;
  input sel1;
  output [71:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(72)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[71:0]),
  .in1(din1[71:0]),
.dout(dout[71:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module db1_dbgprt_dp_mux_macro__dmux_8x__mux_aonpe__ports_2__stack_16c__width_16 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [15:0] din0;
  input sel0;
  input [15:0] din1;
  input sel1;
  output [15:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(16)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[15:0]),
  .in1(din1[15:0]),
.dout(dout[15:0])
);









  



endmodule

