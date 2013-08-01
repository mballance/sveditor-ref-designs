// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: db1.v
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
module db1 (
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_atpg_mode, 
  tcu_dbr_gateoff, 
  scan_in, 
  scan_out, 
  rst_wmr_protect, 
  cluster_arst_l, 
  ccu_io_out, 
  tcu_div_bypass, 
  ccu_dbg1_serdes_dtm, 
  l2t1_dbg1_sii_iq_dequeue, 
  l2t3_dbg1_sii_iq_dequeue, 
  l2t4_dbg1_sii_iq_dequeue, 
  l2t5_dbg1_sii_iq_dequeue, 
  l2t6_dbg1_sii_iq_dequeue, 
  l2t7_dbg1_sii_iq_dequeue, 
  l2t1_dbg1_sii_wib_dequeue, 
  l2t3_dbg1_sii_wib_dequeue, 
  l2t4_dbg1_sii_wib_dequeue, 
  l2t5_dbg1_sii_wib_dequeue, 
  l2t6_dbg1_sii_wib_dequeue, 
  l2t7_dbg1_sii_wib_dequeue, 
  l2t1_dbg1_err_event, 
  l2t3_dbg1_err_event, 
  l2t4_dbg1_err_event, 
  l2t5_dbg1_err_event, 
  l2t6_dbg1_err_event, 
  l2t7_dbg1_err_event, 
  l2t1_dbg1_pa_match, 
  l2t3_dbg1_pa_match, 
  l2t4_dbg1_pa_match, 
  l2t5_dbg1_pa_match, 
  l2t6_dbg1_pa_match, 
  l2t7_dbg1_pa_match, 
  l2t1_dbg1_xbar_vcid, 
  l2t3_dbg1_xbar_vcid, 
  l2t4_dbg1_xbar_vcid, 
  l2t5_dbg1_xbar_vcid, 
  l2t6_dbg1_xbar_vcid, 
  l2t7_dbg1_xbar_vcid, 
  l2b4_dbg1_sio_ctag_vld, 
  l2b5_dbg1_sio_ctag_vld, 
  l2b6_dbg1_sio_ctag_vld, 
  l2b7_dbg1_sio_ctag_vld, 
  l2b4_dbg1_sio_ack_type, 
  l2b5_dbg1_sio_ack_type, 
  l2b6_dbg1_sio_ack_type, 
  l2b7_dbg1_sio_ack_type, 
  l2b4_dbg1_sio_ack_dest, 
  l2b5_dbg1_sio_ack_dest, 
  l2b6_dbg1_sio_ack_dest, 
  l2b7_dbg1_sio_ack_dest, 
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
  mcu0_dbg1_crc21, 
  mcu0_dbg1_rd_req_in_0, 
  mcu0_dbg1_rd_req_in_1, 
  mcu0_dbg1_rd_req_out, 
  mcu0_dbg1_wr_req_in_0, 
  mcu0_dbg1_wr_req_in_1, 
  mcu0_dbg1_wr_req_out, 
  mcu0_dbg1_mecc_err, 
  mcu0_dbg1_secc_err, 
  mcu0_dbg1_fbd_err, 
  mcu0_dbg1_err_mode, 
  mcu0_dbg1_err_event, 
  mcu1_dbg1_crc21, 
  mcu1_dbg1_rd_req_in_0, 
  mcu1_dbg1_rd_req_in_1, 
  mcu1_dbg1_rd_req_out, 
  mcu1_dbg1_wr_req_in_0, 
  mcu1_dbg1_wr_req_in_1, 
  mcu1_dbg1_wr_req_out, 
  mcu1_dbg1_mecc_err, 
  mcu1_dbg1_secc_err, 
  mcu1_dbg1_fbd_err, 
  mcu1_dbg1_err_mode, 
  mcu1_dbg1_err_event, 
  mcu2_dbg1_crc21, 
  mcu2_dbg1_rd_req_in_0, 
  mcu2_dbg1_rd_req_in_1, 
  mcu2_dbg1_rd_req_out, 
  mcu2_dbg1_wr_req_in_0, 
  mcu2_dbg1_wr_req_in_1, 
  mcu2_dbg1_wr_req_out, 
  mcu2_dbg1_mecc_err, 
  mcu2_dbg1_secc_err, 
  mcu2_dbg1_fbd_err, 
  mcu2_dbg1_err_mode, 
  mcu2_dbg1_err_event, 
  mcu3_dbg1_crc21, 
  mcu3_dbg1_rd_req_in_0, 
  mcu3_dbg1_rd_req_in_1, 
  mcu3_dbg1_rd_req_out, 
  mcu3_dbg1_wr_req_in_0, 
  mcu3_dbg1_wr_req_in_1, 
  mcu3_dbg1_wr_req_out, 
  mcu3_dbg1_mecc_err, 
  mcu3_dbg1_secc_err, 
  mcu3_dbg1_fbd_err, 
  mcu3_dbg1_err_mode, 
  mcu3_dbg1_err_event, 
  dbg1_niu_stall, 
  niu_dbg1_stall_ack, 
  dbg1_niu_resume, 
  dbg1_dmu_stall, 
  dmu_dbg1_stall_ack, 
  dbg1_dmu_resume, 
  dmu_dbg1_err_event, 
  sii_dbg1_l2t0_req, 
  sii_dbg1_l2t1_req, 
  sii_dbg1_l2t2_req, 
  sii_dbg1_l2t3_req, 
  sii_dbg1_l2t4_req, 
  sii_dbg1_l2t5_req, 
  sii_dbg1_l2t6_req, 
  sii_dbg1_l2t7_req, 
  ncu_dbg1_error_event, 
  ncu_dbg1_stall, 
  ncu_dbg1_vld, 
  ncu_dbg1_data, 
  dbg1_ncu_stall, 
  dbg1_ncu_vld, 
  dbg1_ncu_data, 
  dbg1_tcu_soc_hard_stop, 
  dbg1_tcu_soc_asrt_trigout, 
  tcu_mio_jtag_membist_mode, 
  gclk, 
  io_cmp_sync_en, 
  cmp_io2x_sync_en, 
  cmp_io_sync_en, 
  dbg1_niu_dbg_sel, 
  mio_dbg1_testmode, 
  mio_pll_testmode, 
  dbg1_mio_dbg_dq, 
  dbg1_mio_drv_en_op_only, 
  dbg1_mio_drv_en_muxtest_op, 
  dbg1_mio_drv_en_muxbist_op, 
  dbg1_mio_drv_en_muxtest_inp, 
  dbg1_mio_drv_en_muxtestpll_inp, 
  dbg1_mio_sel_niu_debug_mode, 
  dbg1_mio_sel_pcix_debug_mode, 
  dbg1_mio_sel_soc_obs_mode, 
  dbg1_mio_drv_imped, 
  dbg0_dbg1_l2t0_sii_iq_dequeue, 
  dbg0_dbg1_l2t2_sii_iq_dequeue, 
  dbg0_dbg1_l2t0_sii_wib_dequeue, 
  dbg0_dbg1_l2t2_sii_wib_dequeue, 
  dbg0_dbg1_l2t0_err_event, 
  dbg0_dbg1_l2t2_err_event, 
  dbg0_dbg1_l2t0_pa_match, 
  dbg0_dbg1_l2t2_pa_match, 
  dbg0_dbg1_l2t0_xbar_vcid, 
  dbg0_dbg1_l2t2_xbar_vcid, 
  dbg0_dbg1_debug_data, 
  dbg0_dbg1_l2b0_sio_ctag_vld, 
  dbg0_dbg1_l2b1_sio_ctag_vld, 
  dbg0_dbg1_l2b2_sio_ctag_vld, 
  dbg0_dbg1_l2b3_sio_ctag_vld, 
  dbg0_dbg1_l2b0_sio_ack_type, 
  dbg0_dbg1_l2b1_sio_ack_type, 
  dbg0_dbg1_l2b2_sio_ack_type, 
  dbg0_dbg1_l2b3_sio_ack_type, 
  dbg0_dbg1_l2b0_sio_ack_dest, 
  dbg0_dbg1_l2b1_sio_ack_dest, 
  dbg0_dbg1_l2b2_sio_ack_dest, 
  dbg0_dbg1_l2b3_sio_ack_dest, 
  dbg0_dbg1_spc0_instr_cmt_grp0, 
  dbg0_dbg1_spc0_instr_cmt_grp1, 
  dbg0_dbg1_spc2_instr_cmt_grp0, 
  dbg0_dbg1_spc2_instr_cmt_grp1);
wire l2clk;
wire db1_clk_header_cmp_clk_scan_out;
wire aclk;
wire bclk;
wire ce_ovrd;
wire cmp_io2x_sync_en_out;
wire io_cmp_sync_en_out;
wire cmp_io_sync_en_out;
wire db1_clk_header_cmp_clk_scan_in;
wire iol2clk;
wire db1_clk_header_iol2clk_scan_out;
wire wmr_protect;
wire aclk_wmr;
wire db1_clk_header_iol2clk_scan_in;
wire ucbflow_scanin;
wire ucbflow_scanout;
wire dbg1_csr_scanin;
wire dbg1_csr_scanout;
wire dbg1_dbgprt_scanin;
wire dbg1_dbgprt_scanout;
wire rd_req_vld;
wire wr_req_vld;
wire [5:0] thr_id_in;
wire [1:0] buf_id_in;
wire [39:0] addr_in;
wire [63:0] data_in;
wire req_acpted;
wire rd_ack_vld;
wire rd_nack_vld;
wire [5:0] thr_id_out;
wire [1:0] buf_id_out;
wire [63:0] data_out;
wire ack_busy;
wire l2t0_pa_match_synced;
wire l2t1_pa_match_synced;
wire l2t2_pa_match_synced;
wire l2t3_pa_match_synced;
wire l2t4_pa_match_synced;
wire l2t5_pa_match_synced;
wire l2t6_pa_match_synced;
wire l2t7_pa_match_synced;
wire l2t_error_event_synced;
wire [83:0] mcu_dbg_signals;
wire [87:0] mcu_dtm_signals;
wire sel_soc_obs_mode;
wire sel_charac_mode;
wire sel_rep_mode;
wire sel_core_soc_debug_mode;
wire sel_train_mode;


input           tcu_pce_ov;
input           tcu_clk_stop;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;
input		tcu_atpg_mode;
input           tcu_dbr_gateoff;

input           scan_in;
output           scan_out;

// new signals after clock header insertion

input           rst_wmr_protect;
input		cluster_arst_l;
input           ccu_io_out;
input           tcu_div_bypass;
input           ccu_dbg1_serdes_dtm;


// interface with L2T 1,3,4,5,6,7 

input           l2t1_dbg1_sii_iq_dequeue;       //L2t 1  dequeue from IQ
input           l2t3_dbg1_sii_iq_dequeue;        //L2t 3  dequeue from IQ
input           l2t4_dbg1_sii_iq_dequeue;       //L2t 4  dequeue from IQ
input           l2t5_dbg1_sii_iq_dequeue;        //L2t 5  dequeue from IQ
input           l2t6_dbg1_sii_iq_dequeue;       //L2t 6  dequeue from IQ
input           l2t7_dbg1_sii_iq_dequeue;        //L2t 7  dequeue from IQ

input           l2t1_dbg1_sii_wib_dequeue;      //L2t 1  dequeue from IOWB
input           l2t3_dbg1_sii_wib_dequeue;      //L2t 3  dequeue from IOWB
input           l2t4_dbg1_sii_wib_dequeue;      //L2t 4  dequeue from IOWB
input           l2t5_dbg1_sii_wib_dequeue;      //L2t 5  dequeue from IOWB
input           l2t6_dbg1_sii_wib_dequeue;      //L2t 6  dequeue from IOWB
input           l2t7_dbg1_sii_wib_dequeue;      //L2t 7  dequeue from IOWB

input           l2t1_dbg1_err_event;    //An Error event occurred in l2t 1
input           l2t3_dbg1_err_event;    //An Error event occurred in l2t 3
input           l2t4_dbg1_err_event;    //An Error event occurred in l2t 4
input           l2t5_dbg1_err_event;    //An Error event occurred in l2t 5
input           l2t6_dbg1_err_event;    //An Error event occurred in l2t 6
input           l2t7_dbg1_err_event;    //An Error event occurred in l2t 7

input           l2t1_dbg1_pa_match;     //A PA match detected in l2t 1
input           l2t3_dbg1_pa_match;     //A PA match detected in l2t 3
input           l2t4_dbg1_pa_match;     //A PA match detected in l2t 4
input           l2t5_dbg1_pa_match;     //A PA match detected in l2t 5
input           l2t6_dbg1_pa_match;     //A PA match detected in l2t 6
input           l2t7_dbg1_pa_match;     //A PA match detected in l2t 7

input  [5:0]    l2t1_dbg1_xbar_vcid;    //VCID[5:0] from Xbar to L2t 1
input  [5:0]    l2t3_dbg1_xbar_vcid;    //VCID[5:0] from Xbar to L2t 3
input  [5:0]    l2t4_dbg1_xbar_vcid;    //VCID[5:0] from Xbar to L2t 4
input  [5:0]    l2t5_dbg1_xbar_vcid;    //VCID[5:0] from Xbar to L2t 5
input  [5:0]    l2t6_dbg1_xbar_vcid;    //VCID[5:0] from Xbar to L2t 6
input  [5:0]    l2t7_dbg1_xbar_vcid;    //VCID[5:0] from Xbar to L2t 7

// Interface with L2B 4,5,6,7

input           l2b4_dbg1_sio_ctag_vld; //Ctag  valid from L2b 4  to SIO
input           l2b5_dbg1_sio_ctag_vld; //Ctag  valid from L2b 5  to SIO
input           l2b6_dbg1_sio_ctag_vld; //Ctag  valid from L2b 6  to SIO
input           l2b7_dbg1_sio_ctag_vld; //Ctag  valid from L2b 7  to SIO

input           l2b4_dbg1_sio_ack_type; //Read or Wr ack from L2b 4  to SIO
input           l2b5_dbg1_sio_ack_type; //Read or Wr ack from L2b 5  to SIO
input           l2b6_dbg1_sio_ack_type; //Read or Wr ack from L2b 6  to SIO
input           l2b7_dbg1_sio_ack_type; //Read or Wr ack from L2b 7  to SIO

input           l2b4_dbg1_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 4  to SIO
input           l2b5_dbg1_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 5  to SIO
input           l2b6_dbg1_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 6  to SIO
input           l2b7_dbg1_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 7  to SIO

// Interface with Sparcs 1,3,4,5,6,7

input  [1:0]    spc1_dbg1_instr_cmt_grp0;//Instruction Commited in Thread Group 0 for SPC 1
input  [1:0]    spc1_dbg1_instr_cmt_grp1;//Instruction Commited in Thread Group 1 for SPC 1
input  [1:0]    spc3_dbg1_instr_cmt_grp0;//Instruction Commited in Thread Group 0 for SPC 3
input  [1:0]    spc3_dbg1_instr_cmt_grp1;//Instruction Commited in Thread Group 1 for SPC 3
input  [1:0]    spc4_dbg1_instr_cmt_grp0;//Instruction Commited in Thread Group 0 for SPC 4
input  [1:0]    spc4_dbg1_instr_cmt_grp1;//Instruction Commited in Thread Group 1 for SPC 4
input  [1:0]    spc5_dbg1_instr_cmt_grp0;//Instruction Commited in Thread Group 0 for SPC 5
input  [1:0]    spc5_dbg1_instr_cmt_grp1;//Instruction Commited in Thread Group 1 for SPC 5
input  [1:0]    spc6_dbg1_instr_cmt_grp0;//Instruction Commited in Thread Group 0 for SPC 6
input  [1:0]    spc6_dbg1_instr_cmt_grp1;//Instruction Commited in Thread Group 1 for SPC 6
input  [1:0]    spc7_dbg1_instr_cmt_grp0;//Instruction Commited in Thread Group 0 for SPC 7
input  [1:0]    spc7_dbg1_instr_cmt_grp1;//Instruction Commited in Thread Group 1 for SPC 7

// interface with MCU 0

input           mcu0_dbg1_crc21;         // CRC bit 21 for DTM
input  [3:0]    mcu0_dbg1_rd_req_in_0;   //Read Request from L2 bank 0 to MCU 0 (id + valid)
input  [3:0]    mcu0_dbg1_rd_req_in_1;   //Read Request from L2 bank 1 to MCU 0 (id + valid)
input  [4:0]    mcu0_dbg1_rd_req_out;//Read ack from MCU 0 to L2 bank 0 or 1 (id + valid + dest_L2_bank)
input           mcu0_dbg1_wr_req_in_0;   //Write req valid from L2 bank 0
input           mcu0_dbg1_wr_req_in_1;   //Write req valid from L2 bank 1
input  [1:0]    mcu0_dbg1_wr_req_out;    //0,1,2,3  Writes completed   to  DRAM
input           mcu0_dbg1_mecc_err;      //MCU 0 has detected an mecc error on a L2 read or scrub
input           mcu0_dbg1_secc_err;      //MCU 0 has detected a secc error on a L2 read or scrub
input           mcu0_dbg1_fbd_err;       //MCU 0  has detected a fbdimm channel error
input           mcu0_dbg1_err_mode;      //Fbdimm interface logic of MCU 0 has gone into error handling mode.
input           mcu0_dbg1_err_event;     //An error event occurred in MCU 0

// interface with MCU 1

input           mcu1_dbg1_crc21;         // CRC bit 21 for DTM
input  [3:0]    mcu1_dbg1_rd_req_in_0;   //Read Request from L2 bank 0 to MCU 1 (id + valid)
input  [3:0]    mcu1_dbg1_rd_req_in_1;   //Read Request from L2 bank 1 to MCU 1 (id + valid)
input  [4:0]    mcu1_dbg1_rd_req_out;//Read ack from MCU 1 to L2 bank 0 or 1 (id + valid + dest_L2_bank)
input           mcu1_dbg1_wr_req_in_0;   //Write req valid from L2 bank 0
input           mcu1_dbg1_wr_req_in_1;   //Write req valid from L2 bank 1
input  [1:0]    mcu1_dbg1_wr_req_out;    //0,1,2,3  Writes completed   to  DRAM
input           mcu1_dbg1_mecc_err;      //MCU 1 has detected an mecc error on a L2 read or scrub
input           mcu1_dbg1_secc_err;      //MCU 1 has detected a secc error on a L2 read or scrub
input           mcu1_dbg1_fbd_err;       //MCU 1  has detected a fbdimm channel error
input           mcu1_dbg1_err_mode;      //Fbdimm interface logic of MCU 1 has gone into error handling mode.
input           mcu1_dbg1_err_event;     //An error event occurred in MCU 1

// interface with MCU 2

input           mcu2_dbg1_crc21;         // CRC bit 21 for DTM
input  [3:0]    mcu2_dbg1_rd_req_in_0;   //Read Request from L2 bank 0 to MCU 2 (id + valid)
input  [3:0]    mcu2_dbg1_rd_req_in_1;   //Read Request from L2 bank 1 to MCU 2 (id + valid)
input  [4:0]    mcu2_dbg1_rd_req_out;//Read ack from MCU 2 to L2 bank 0 or 1 (id + valid + dest_L2_bank)
input           mcu2_dbg1_wr_req_in_0;   //Write req valid from L2 bank 0
input           mcu2_dbg1_wr_req_in_1;   //Write req valid from L2 bank 1
input  [1:0]    mcu2_dbg1_wr_req_out;    //0,1,2,3  Writes completed   to  DRAM
input           mcu2_dbg1_mecc_err;      //MCU 2 has detected an mecc error on a L2 read or scrub
input           mcu2_dbg1_secc_err;      //MCU 2 has detected a secc error on a L2 read or scrub
input           mcu2_dbg1_fbd_err;       //MCU 2  has detected a fbdimm channel error
input           mcu2_dbg1_err_mode;      //Fbdimm interface logic of MCU 2 has gone into error handling mode.
input           mcu2_dbg1_err_event;     //An error event occurred in MCU 2

// interface with MCU 3

input           mcu3_dbg1_crc21;         // CRC bit 21 for DTM
input  [3:0]    mcu3_dbg1_rd_req_in_0;   //Read Request from L2 bank 0 to MCU 3 (id + valid)
input  [3:0]    mcu3_dbg1_rd_req_in_1;   //Read Request from L2 bank 1 to MCU 3 (id + valid)
input  [4:0]    mcu3_dbg1_rd_req_out;//Read ack from MCU 3 to L2 bank 0 or 1 (id + valid + dest_L2_bank)
input           mcu3_dbg1_wr_req_in_0;   //Write req valid from L2 bank 0
input           mcu3_dbg1_wr_req_in_1;   //Write req valid from L2 bank 1
input  [1:0]    mcu3_dbg1_wr_req_out;    //0,1,2,3  Writes completed   to  DRAM
input           mcu3_dbg1_mecc_err;      //MCU 3 has detected an mecc error on a L2 read or scrub
input           mcu3_dbg1_secc_err;      //MCU 3 has detected a secc error on a L2 read or scrub
input           mcu3_dbg1_fbd_err;       //MCU 3  has detected a fbdimm channel error
input           mcu3_dbg1_err_mode;      //Fbdimm interface logic of MCU 3 has gone into error handling mode.
input           mcu3_dbg1_err_event;     //An error event occurred in MCU 3

//interface with NIU

output          dbg1_niu_stall;          //Request to stall / quiesce NIU -> NCU and NIU -> SII interfaces
input           niu_dbg1_stall_ack;      //Ack from NIU indicating NIU -> NCU and NIU -> SII interfaces have quiesced
output          dbg1_niu_resume;         //Request to resume packets  on NIU -> NCU and NIU -> SII interfaces

// Interface with DMU

output          dbg1_dmu_stall;          //Request to stall / quiesce DMU -> NCU and DMU -> SII interfaces
input           dmu_dbg1_stall_ack;      //Ack from DMU indicating DMU -> NCU and DMU -> SII interfaces have quiesced
output          dbg1_dmu_resume;         //Request to resume packets  on DMU -> NCU and DMU -> SII interfaces
input           dmu_dbg1_err_event;       //An error event occurred in DMU

// interface with SII

input  [1:0]    sii_dbg1_l2t0_req;       //Req type encoded on 2 bits from sii to L2t 0
input  [1:0]    sii_dbg1_l2t1_req;       //Req type encoded on 2 bits from sii to L2t 1
input  [1:0]    sii_dbg1_l2t2_req;       //Req type encoded on 2 bits from sii to L2t 2
input  [1:0]    sii_dbg1_l2t3_req;       //Req type encoded on 2 bits from sii to L2t 3
input  [1:0]    sii_dbg1_l2t4_req;       //Req type encoded on 2 bits from sii to L2t 4
input  [1:0]    sii_dbg1_l2t5_req;       //Req type encoded on 2 bits from sii to L2t 5
input  [1:0]    sii_dbg1_l2t6_req;       //Req type encoded on 2 bits from sii to L2t 6
input  [1:0]    sii_dbg1_l2t7_req;       //Req type encoded on 2 bits from sii to L2t 7


// interface with NCU

input           ncu_dbg1_error_event;    //An Error event occurred in NCU.
input           ncu_dbg1_stall;          //NCU back Pressure control signal to Dbg1
input           ncu_dbg1_vld;            //NCU to Dbg1 UCB data valid
input  [3:0]    ncu_dbg1_data;           //NCU to Dbg1 UCB data bus
output          dbg1_ncu_stall;          //Dbg1 back pressure control signal to NCU
output          dbg1_ncu_vld;            //Dbg1 to NCU UCB data valid
output [3:0]    dbg1_ncu_data;           //Dbg1 to NCU UCB data

// interface with TCU

output          dbg1_tcu_soc_hard_stop;           //Hard Stop request to TCU fron SOC
output          dbg1_tcu_soc_asrt_trigout;       //Assert TRIGOUT request to TCU from SOC
input		tcu_mio_jtag_membist_mode;

// interface with CCU

input           gclk;                  //Internal CMP clock from CCU
input           io_cmp_sync_en;         // IO to CMP sync enable
input           cmp_io2x_sync_en;       // CMP to IO2X sync enable
input		cmp_io_sync_en;		// CMP to IO sync enable 

// interface with MIO

output  [4:0]   dbg1_niu_dbg_sel;
input		mio_dbg1_testmode;
input           mio_pll_testmode;
output [165:0]  dbg1_mio_dbg_dq;         //N2 Debug port
output          dbg1_mio_drv_en_op_only;  //Drive en to pins configured only as debug port
output          dbg1_mio_drv_en_muxtest_op;      //Drive en to pins configured both as debug port and scan out[31:0] pins
output          dbg1_mio_drv_en_muxbist_op;      //Drive en to pins configured both as debug port and mbist output pins.
output          dbg1_mio_drv_en_muxtest_inp;     //Drive en to pins configured as debug port and testmode input pins
output          dbg1_mio_drv_en_muxtestpll_inp;  // Drive en to pins configured as debug port and pll_testmode input pins

output        dbg1_mio_sel_niu_debug_mode;
output        dbg1_mio_sel_pcix_debug_mode;
output        dbg1_mio_sel_soc_obs_mode;
output  [1:0]   dbg1_mio_drv_imped;


// Interface with DBG0

input           dbg0_dbg1_l2t0_sii_iq_dequeue;       //L2t 0  dequeue from IQ : flopped version
input           dbg0_dbg1_l2t2_sii_iq_dequeue;        //L2t 2  dequeue from IQ : flopped version
input           dbg0_dbg1_l2t0_sii_wib_dequeue;      //L2t 0  dequeue from IOWB : flopped version
input           dbg0_dbg1_l2t2_sii_wib_dequeue;      //L2t 2  dequeue from IOWB : flopped version
input           dbg0_dbg1_l2t0_err_event;    //An Error event occurred in l2t 0 : flopped version
input           dbg0_dbg1_l2t2_err_event;    //An Error event occurred in l2t 2 : flopped version
input           dbg0_dbg1_l2t0_pa_match;     //A PA match detected in l2t 0 : flopped version
input           dbg0_dbg1_l2t2_pa_match;     //A PA match detected in l2t 2 : flopped version
input  [5:0]    dbg0_dbg1_l2t0_xbar_vcid;    //VCID[5:0] from Xbar to L2t 0 : flopped version
input  [5:0]    dbg0_dbg1_l2t2_xbar_vcid;    //VCID[5:0] from Xbar to L2t 2 : flopped version

input [165:0]   dbg0_dbg1_debug_data;  // 166 bit debug data bus carrying repeatability signals to DBG1
input           dbg0_dbg1_l2b0_sio_ctag_vld; //Ctag  valid from L2b 0  to SIO : flopped version
input           dbg0_dbg1_l2b1_sio_ctag_vld; //Ctag  valid from L2b 1  to SIO : flopped version
input           dbg0_dbg1_l2b2_sio_ctag_vld; //Ctag  valid from L2b 2  to SIO : flopped version
input           dbg0_dbg1_l2b3_sio_ctag_vld; //Ctag  valid from L2b 3  to SIO : flopped version
input           dbg0_dbg1_l2b0_sio_ack_type; //Read or Wr ack from L2b 0  to SIO : flopped version
input           dbg0_dbg1_l2b1_sio_ack_type; //Read or Wr ack from L2b 1  to SIO : flopped version
input           dbg0_dbg1_l2b2_sio_ack_type; //Read or Wr ack from L2b 2  to SIO : flopped version
input           dbg0_dbg1_l2b3_sio_ack_type; //Read or Wr ack from L2b 3  to SIO : flopped version
input           dbg0_dbg1_l2b0_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 0  to SIO : flopped version
input           dbg0_dbg1_l2b1_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 1  to SIO : flopped version
input           dbg0_dbg1_l2b2_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 2  to SIO : flopped version
input           dbg0_dbg1_l2b3_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 3  to SIO : flopped version

input  [1:0]    dbg0_dbg1_spc0_instr_cmt_grp0;//Instruction Commited in Thread Group 0 for SPC 0
input  [1:0]    dbg0_dbg1_spc0_instr_cmt_grp1;//Instruction Commited in Thread Group 1 for SPC 0
input  [1:0]    dbg0_dbg1_spc2_instr_cmt_grp0;//Instruction Commited in Thread Group 0 for SPC 2
input  [1:0]    dbg0_dbg1_spc2_instr_cmt_grp1;//Instruction Commited in Thread Group 1 for SPC 2

clkgen_db1_cmp db1_clk_header_cmp_clk
        (
        .l2clk                  (l2clk                  ),
        .scan_out               (db1_clk_header_cmp_clk_scan_out),
        .aclk                   (aclk                   ),
        .bclk                   (bclk                   ),
        .pce_ov                 (ce_ovrd                ),
        .wmr_protect            (                       ),
        .wmr_                   (                       ),
        .por_                   (                       ),
        .aclk_wmr               (                       ),
        .dr_sync_en             (                       ),
        .io2x_sync_en           (cmp_io2x_sync_en_out   ),
        .slow_cmp_sync_en       (io_cmp_sync_en_out     ),
        .cmp_slow_sync_en       (cmp_io_sync_en_out     ),
        .tcu_clk_stop           (tcu_clk_stop           ),
        .tcu_pce_ov             (tcu_pce_ov             ),
        .rst_wmr_protect        (rst_wmr_protect        ),
        .rst_wmr_               (1'b0                   ),
        .rst_por_               (1'b0                   ),
        .ccu_dr_sync_en         (1'b0                   ),
        .ccu_io2x_sync_en       (cmp_io2x_sync_en       ),
        .ccu_cmp_slow_sync_en   (cmp_io_sync_en         ),
        .ccu_slow_cmp_sync_en   (io_cmp_sync_en         ),
        .tcu_div_bypass         (1'b0                   ),
        .ccu_div_ph             (1'b1                   ),
        .cluster_div_en         (1'b0                   ),
        .gclk                   (gclk                   ),
        .scan_en                (tcu_scan_en            ),
        .clk_ext                (1'b0                   ),
        .ccu_serdes_dtm         (1'b0                   ),
        .cluster_arst_l         (cluster_arst_l         ),
        .tcu_wr_inhibit         (1'b0                   ),
        .tcu_atpg_mode          (tcu_atpg_mode          ),
        .array_wr_inhibit       (                       ),
        .tcu_aclk               (tcu_aclk               ),
        .tcu_bclk               (tcu_bclk               ),
        .scan_in                (db1_clk_header_cmp_clk_scan_in)
        );

clkgen_db1_io db1_clk_header_iol2clk
        (
        .l2clk                  (iol2clk                ),
        .scan_out               (db1_clk_header_iol2clk_scan_out),
        .aclk                   (                       ),
        .bclk                   (                       ),
        .pce_ov                 (                       ),
        .wmr_protect            (wmr_protect            ),
        .wmr_                   (                       ),
        .por_                   (                       ),
        .aclk_wmr               (aclk_wmr               ),
        .slow_cmp_sync_en       (			),
        .cmp_slow_sync_en       (			),
        .tcu_clk_stop           (tcu_clk_stop           ),
        .tcu_pce_ov             (tcu_pce_ov             ),
        .rst_wmr_protect        (rst_wmr_protect        ),
        .rst_wmr_               (1'b0                   ),
        .rst_por_               (1'b0                   ),
        .ccu_cmp_slow_sync_en   (1'b0                   ),
        .ccu_slow_cmp_sync_en   (1'b0                   ),
        .tcu_div_bypass         (tcu_div_bypass         ),
        .ccu_div_ph             (ccu_io_out             ),
        .cluster_div_en         (1'b1                   ),
        .gclk                   (gclk                   ),
        .clk_ext                (1'b0                   ),
        .ccu_serdes_dtm         (1'b0                   ),
        .cluster_arst_l         (cluster_arst_l         ),
        .tcu_wr_inhibit         (1'b0                   ),
        .tcu_atpg_mode          (tcu_atpg_mode          ),
        .array_wr_inhibit       (                       ),
        .tcu_aclk               (tcu_aclk               ),
        .tcu_bclk               (tcu_bclk               ),
        .scan_en                (tcu_scan_en            ),
        .scan_in                (db1_clk_header_iol2clk_scan_in)
        );



db1_ucbflow_ctl  ucbflow (
			  .scan_in(ucbflow_scanin),
			  .scan_out(ucbflow_scanout),
                	  .tcu_pce_ov(ce_ovrd),
                	  .tcu_clk_stop(1'b0),
                	  .tcu_aclk(aclk),
                	  .tcu_bclk(bclk),
			  .iol2clk(iol2clk),
  .tcu_scan_en(tcu_scan_en),
  .ncu_dbg1_vld(ncu_dbg1_vld),
  .ncu_dbg1_data(ncu_dbg1_data[3:0]),
  .dbg1_ncu_stall(dbg1_ncu_stall),
  .dbg1_ncu_vld(dbg1_ncu_vld),
  .dbg1_ncu_data(dbg1_ncu_data[3:0]),
  .ncu_dbg1_stall(ncu_dbg1_stall),
  .rd_req_vld(rd_req_vld),
  .wr_req_vld(wr_req_vld),
  .thr_id_in(thr_id_in[5:0]),
  .buf_id_in(buf_id_in[1:0]),
  .addr_in(addr_in[39:0]),
  .data_in(data_in[63:0]),
  .req_acpted(req_acpted),
  .rd_ack_vld(rd_ack_vld),
  .rd_nack_vld(rd_nack_vld),
  .thr_id_out(thr_id_out[5:0]),
  .buf_id_out(buf_id_out[1:0]),
  .data_out(data_out[63:0]),
  .ack_busy(ack_busy)
			 );

db1_csr_ctl	 dbg1_csr (
                          .scan_in(dbg1_csr_scanin),
                          .scan_out(dbg1_csr_scanout),
                          .tcu_pce_ov(ce_ovrd),
                          .tcu_clk_stop(1'b0),
                          .tcu_aclk(aclk),
                          .tcu_bclk(bclk),
                          .iol2clk(iol2clk),
  .mcu0_dbg1_crc21(mcu0_dbg1_crc21),
  .mcu0_dbg1_rd_req_in_0(mcu0_dbg1_rd_req_in_0[3:0]),
  .mcu0_dbg1_rd_req_in_1(mcu0_dbg1_rd_req_in_1[3:0]),
  .mcu0_dbg1_rd_req_out(mcu0_dbg1_rd_req_out[4:0]),
  .mcu0_dbg1_wr_req_in_0(mcu0_dbg1_wr_req_in_0),
  .mcu0_dbg1_wr_req_in_1(mcu0_dbg1_wr_req_in_1),
  .mcu0_dbg1_wr_req_out(mcu0_dbg1_wr_req_out[1:0]),
  .mcu0_dbg1_mecc_err(mcu0_dbg1_mecc_err),
  .mcu0_dbg1_secc_err(mcu0_dbg1_secc_err),
  .mcu0_dbg1_fbd_err(mcu0_dbg1_fbd_err),
  .mcu0_dbg1_err_mode(mcu0_dbg1_err_mode),
  .mcu0_dbg1_err_event(mcu0_dbg1_err_event),
  .mcu1_dbg1_crc21(mcu1_dbg1_crc21),
  .mcu1_dbg1_rd_req_in_0(mcu1_dbg1_rd_req_in_0[3:0]),
  .mcu1_dbg1_rd_req_in_1(mcu1_dbg1_rd_req_in_1[3:0]),
  .mcu1_dbg1_rd_req_out(mcu1_dbg1_rd_req_out[4:0]),
  .mcu1_dbg1_wr_req_in_0(mcu1_dbg1_wr_req_in_0),
  .mcu1_dbg1_wr_req_in_1(mcu1_dbg1_wr_req_in_1),
  .mcu1_dbg1_wr_req_out(mcu1_dbg1_wr_req_out[1:0]),
  .mcu1_dbg1_mecc_err(mcu1_dbg1_mecc_err),
  .mcu1_dbg1_secc_err(mcu1_dbg1_secc_err),
  .mcu1_dbg1_fbd_err(mcu1_dbg1_fbd_err),
  .mcu1_dbg1_err_mode(mcu1_dbg1_err_mode),
  .mcu1_dbg1_err_event(mcu1_dbg1_err_event),
  .mcu2_dbg1_crc21(mcu2_dbg1_crc21),
  .mcu2_dbg1_rd_req_in_0(mcu2_dbg1_rd_req_in_0[3:0]),
  .mcu2_dbg1_rd_req_in_1(mcu2_dbg1_rd_req_in_1[3:0]),
  .mcu2_dbg1_rd_req_out(mcu2_dbg1_rd_req_out[4:0]),
  .mcu2_dbg1_wr_req_in_0(mcu2_dbg1_wr_req_in_0),
  .mcu2_dbg1_wr_req_in_1(mcu2_dbg1_wr_req_in_1),
  .mcu2_dbg1_wr_req_out(mcu2_dbg1_wr_req_out[1:0]),
  .mcu2_dbg1_mecc_err(mcu2_dbg1_mecc_err),
  .mcu2_dbg1_secc_err(mcu2_dbg1_secc_err),
  .mcu2_dbg1_fbd_err(mcu2_dbg1_fbd_err),
  .mcu2_dbg1_err_mode(mcu2_dbg1_err_mode),
  .mcu2_dbg1_err_event(mcu2_dbg1_err_event),
  .mcu3_dbg1_crc21(mcu3_dbg1_crc21),
  .mcu3_dbg1_rd_req_in_0(mcu3_dbg1_rd_req_in_0[3:0]),
  .mcu3_dbg1_rd_req_in_1(mcu3_dbg1_rd_req_in_1[3:0]),
  .mcu3_dbg1_rd_req_out(mcu3_dbg1_rd_req_out[4:0]),
  .mcu3_dbg1_wr_req_in_0(mcu3_dbg1_wr_req_in_0),
  .mcu3_dbg1_wr_req_in_1(mcu3_dbg1_wr_req_in_1),
  .mcu3_dbg1_wr_req_out(mcu3_dbg1_wr_req_out[1:0]),
  .mcu3_dbg1_mecc_err(mcu3_dbg1_mecc_err),
  .mcu3_dbg1_secc_err(mcu3_dbg1_secc_err),
  .mcu3_dbg1_fbd_err(mcu3_dbg1_fbd_err),
  .mcu3_dbg1_err_mode(mcu3_dbg1_err_mode),
  .mcu3_dbg1_err_event(mcu3_dbg1_err_event),
  .dbg1_niu_stall(dbg1_niu_stall),
  .niu_dbg1_stall_ack(niu_dbg1_stall_ack),
  .dbg1_niu_resume(dbg1_niu_resume),
  .dbg1_dmu_stall(dbg1_dmu_stall),
  .dmu_dbg1_stall_ack(dmu_dbg1_stall_ack),
  .dbg1_dmu_resume(dbg1_dmu_resume),
  .dmu_dbg1_err_event(dmu_dbg1_err_event),
  .ncu_dbg1_error_event(ncu_dbg1_error_event),
  .l2t0_pa_match_synced(l2t0_pa_match_synced),
  .l2t1_pa_match_synced(l2t1_pa_match_synced),
  .l2t2_pa_match_synced(l2t2_pa_match_synced),
  .l2t3_pa_match_synced(l2t3_pa_match_synced),
  .l2t4_pa_match_synced(l2t4_pa_match_synced),
  .l2t5_pa_match_synced(l2t5_pa_match_synced),
  .l2t6_pa_match_synced(l2t6_pa_match_synced),
  .l2t7_pa_match_synced(l2t7_pa_match_synced),
  .l2t_error_event_synced(l2t_error_event_synced),
  .tcu_mio_jtag_membist_mode(tcu_mio_jtag_membist_mode),
  .tcu_dbr_gateoff(tcu_dbr_gateoff),
  .mio_dbg1_testmode(mio_dbg1_testmode),
  .mio_pll_testmode(mio_pll_testmode),
  .dbg1_niu_dbg_sel(dbg1_niu_dbg_sel[4:0]),
  .dbg1_tcu_soc_hard_stop(dbg1_tcu_soc_hard_stop),
  .dbg1_tcu_soc_asrt_trigout(dbg1_tcu_soc_asrt_trigout),
  .tcu_scan_en(tcu_scan_en),
  .aclk_wmr(aclk_wmr),
  .wmr_protect(wmr_protect),
  .rd_req_vld(rd_req_vld),
  .wr_req_vld(wr_req_vld),
  .addr_in(addr_in[39:0]),
  .data_in(data_in[63:0]),
  .thr_id_in(thr_id_in[5:0]),
  .buf_id_in(buf_id_in[1:0]),
  .ack_busy(ack_busy),
  .rd_ack_vld(rd_ack_vld),
  .rd_nack_vld(rd_nack_vld),
  .req_acpted(req_acpted),
  .data_out(data_out[63:0]),
  .thr_id_out(thr_id_out[5:0]),
  .buf_id_out(buf_id_out[1:0]),
  .mcu_dbg_signals(mcu_dbg_signals[83:0]),
  .mcu_dtm_signals(mcu_dtm_signals[87:0]),
  .sel_soc_obs_mode(sel_soc_obs_mode),
  .sel_charac_mode(sel_charac_mode),
  .sel_rep_mode(sel_rep_mode),
  .sel_core_soc_debug_mode(sel_core_soc_debug_mode),
  .sel_train_mode(sel_train_mode),
  .dbg1_mio_sel_niu_debug_mode(dbg1_mio_sel_niu_debug_mode),
  .dbg1_mio_sel_pcix_debug_mode(dbg1_mio_sel_pcix_debug_mode),
  .dbg1_mio_sel_soc_obs_mode(dbg1_mio_sel_soc_obs_mode),
  .dbg1_mio_drv_en_op_only(dbg1_mio_drv_en_op_only),
  .dbg1_mio_drv_en_muxtest_op(dbg1_mio_drv_en_muxtest_op),
  .dbg1_mio_drv_en_muxbist_op(dbg1_mio_drv_en_muxbist_op),
  .dbg1_mio_drv_en_muxtest_inp(dbg1_mio_drv_en_muxtest_inp),
  .dbg1_mio_drv_en_muxtestpll_inp(dbg1_mio_drv_en_muxtestpll_inp),
  .dbg1_mio_drv_imped(dbg1_mio_drv_imped[1:0])
                         );

db1_dbgprt_dp   dbg1_dbgprt (
                          .scan_in(dbg1_dbgprt_scanin),
                          .scan_out(dbg1_dbgprt_scanout),
                          .tcu_pce_ov(ce_ovrd),
                          .tcu_clk_stop(1'b0),
                          .tcu_aclk(aclk),
                          .tcu_bclk(bclk),
			  .io_cmp_sync_en(io_cmp_sync_en_out),
			  .cmp_io2x_sync_en(cmp_io2x_sync_en_out),
			  .cmp_io_sync_en(cmp_io_sync_en_out),
                          .l2clk(l2clk),
  .dbg0_dbg1_l2t0_pa_match(dbg0_dbg1_l2t0_pa_match),
  .dbg0_dbg1_l2t2_pa_match(dbg0_dbg1_l2t2_pa_match),
  .l2t1_dbg1_pa_match(l2t1_dbg1_pa_match),
  .l2t3_dbg1_pa_match(l2t3_dbg1_pa_match),
  .l2t4_dbg1_pa_match(l2t4_dbg1_pa_match),
  .l2t5_dbg1_pa_match(l2t5_dbg1_pa_match),
  .l2t6_dbg1_pa_match(l2t6_dbg1_pa_match),
  .l2t7_dbg1_pa_match(l2t7_dbg1_pa_match),
  .dbg0_dbg1_l2t0_err_event(dbg0_dbg1_l2t0_err_event),
  .dbg0_dbg1_l2t2_err_event(dbg0_dbg1_l2t2_err_event),
  .l2t1_dbg1_err_event(l2t1_dbg1_err_event),
  .l2t3_dbg1_err_event(l2t3_dbg1_err_event),
  .l2t4_dbg1_err_event(l2t4_dbg1_err_event),
  .l2t5_dbg1_err_event(l2t5_dbg1_err_event),
  .l2t6_dbg1_err_event(l2t6_dbg1_err_event),
  .l2t7_dbg1_err_event(l2t7_dbg1_err_event),
  .dbg0_dbg1_debug_data(dbg0_dbg1_debug_data[165:0]),
  .mcu_dtm_signals(mcu_dtm_signals[87:0]),
  .ccu_dbg1_serdes_dtm(ccu_dbg1_serdes_dtm),
  .tcu_scan_en(tcu_scan_en),
  .mcu_dbg_signals(mcu_dbg_signals[83:0]),
  .sii_dbg1_l2t0_req(sii_dbg1_l2t0_req[1:0]),
  .sii_dbg1_l2t1_req(sii_dbg1_l2t1_req[1:0]),
  .sii_dbg1_l2t2_req(sii_dbg1_l2t2_req[1:0]),
  .sii_dbg1_l2t3_req(sii_dbg1_l2t3_req[1:0]),
  .sii_dbg1_l2t4_req(sii_dbg1_l2t4_req[1:0]),
  .sii_dbg1_l2t5_req(sii_dbg1_l2t5_req[1:0]),
  .sii_dbg1_l2t6_req(sii_dbg1_l2t6_req[1:0]),
  .sii_dbg1_l2t7_req(sii_dbg1_l2t7_req[1:0]),
  .l2t1_dbg1_sii_iq_dequeue(l2t1_dbg1_sii_iq_dequeue),
  .l2t3_dbg1_sii_iq_dequeue(l2t3_dbg1_sii_iq_dequeue),
  .l2t4_dbg1_sii_iq_dequeue(l2t4_dbg1_sii_iq_dequeue),
  .l2t5_dbg1_sii_iq_dequeue(l2t5_dbg1_sii_iq_dequeue),
  .l2t6_dbg1_sii_iq_dequeue(l2t6_dbg1_sii_iq_dequeue),
  .l2t7_dbg1_sii_iq_dequeue(l2t7_dbg1_sii_iq_dequeue),
  .dbg0_dbg1_l2t0_sii_iq_dequeue(dbg0_dbg1_l2t0_sii_iq_dequeue),
  .dbg0_dbg1_l2t2_sii_iq_dequeue(dbg0_dbg1_l2t2_sii_iq_dequeue),
  .l2t1_dbg1_sii_wib_dequeue(l2t1_dbg1_sii_wib_dequeue),
  .l2t3_dbg1_sii_wib_dequeue(l2t3_dbg1_sii_wib_dequeue),
  .l2t4_dbg1_sii_wib_dequeue(l2t4_dbg1_sii_wib_dequeue),
  .l2t5_dbg1_sii_wib_dequeue(l2t5_dbg1_sii_wib_dequeue),
  .l2t6_dbg1_sii_wib_dequeue(l2t6_dbg1_sii_wib_dequeue),
  .l2t7_dbg1_sii_wib_dequeue(l2t7_dbg1_sii_wib_dequeue),
  .dbg0_dbg1_l2t0_sii_wib_dequeue(dbg0_dbg1_l2t0_sii_wib_dequeue),
  .dbg0_dbg1_l2t2_sii_wib_dequeue(dbg0_dbg1_l2t2_sii_wib_dequeue),
  .l2t1_dbg1_xbar_vcid(l2t1_dbg1_xbar_vcid[5:0]),
  .l2t3_dbg1_xbar_vcid(l2t3_dbg1_xbar_vcid[5:0]),
  .l2t4_dbg1_xbar_vcid(l2t4_dbg1_xbar_vcid[5:0]),
  .l2t5_dbg1_xbar_vcid(l2t5_dbg1_xbar_vcid[5:0]),
  .l2t6_dbg1_xbar_vcid(l2t6_dbg1_xbar_vcid[5:0]),
  .l2t7_dbg1_xbar_vcid(l2t7_dbg1_xbar_vcid[5:0]),
  .dbg0_dbg1_l2t0_xbar_vcid(dbg0_dbg1_l2t0_xbar_vcid[5:0]),
  .dbg0_dbg1_l2t2_xbar_vcid(dbg0_dbg1_l2t2_xbar_vcid[5:0]),
  .l2b4_dbg1_sio_ctag_vld(l2b4_dbg1_sio_ctag_vld),
  .l2b5_dbg1_sio_ctag_vld(l2b5_dbg1_sio_ctag_vld),
  .l2b6_dbg1_sio_ctag_vld(l2b6_dbg1_sio_ctag_vld),
  .l2b7_dbg1_sio_ctag_vld(l2b7_dbg1_sio_ctag_vld),
  .dbg0_dbg1_l2b0_sio_ctag_vld(dbg0_dbg1_l2b0_sio_ctag_vld),
  .dbg0_dbg1_l2b1_sio_ctag_vld(dbg0_dbg1_l2b1_sio_ctag_vld),
  .dbg0_dbg1_l2b2_sio_ctag_vld(dbg0_dbg1_l2b2_sio_ctag_vld),
  .dbg0_dbg1_l2b3_sio_ctag_vld(dbg0_dbg1_l2b3_sio_ctag_vld),
  .l2b4_dbg1_sio_ack_type(l2b4_dbg1_sio_ack_type),
  .l2b5_dbg1_sio_ack_type(l2b5_dbg1_sio_ack_type),
  .l2b6_dbg1_sio_ack_type(l2b6_dbg1_sio_ack_type),
  .l2b7_dbg1_sio_ack_type(l2b7_dbg1_sio_ack_type),
  .dbg0_dbg1_l2b0_sio_ack_type(dbg0_dbg1_l2b0_sio_ack_type),
  .dbg0_dbg1_l2b1_sio_ack_type(dbg0_dbg1_l2b1_sio_ack_type),
  .dbg0_dbg1_l2b2_sio_ack_type(dbg0_dbg1_l2b2_sio_ack_type),
  .dbg0_dbg1_l2b3_sio_ack_type(dbg0_dbg1_l2b3_sio_ack_type),
  .l2b4_dbg1_sio_ack_dest(l2b4_dbg1_sio_ack_dest),
  .l2b5_dbg1_sio_ack_dest(l2b5_dbg1_sio_ack_dest),
  .l2b6_dbg1_sio_ack_dest(l2b6_dbg1_sio_ack_dest),
  .l2b7_dbg1_sio_ack_dest(l2b7_dbg1_sio_ack_dest),
  .dbg0_dbg1_l2b0_sio_ack_dest(dbg0_dbg1_l2b0_sio_ack_dest),
  .dbg0_dbg1_l2b1_sio_ack_dest(dbg0_dbg1_l2b1_sio_ack_dest),
  .dbg0_dbg1_l2b2_sio_ack_dest(dbg0_dbg1_l2b2_sio_ack_dest),
  .dbg0_dbg1_l2b3_sio_ack_dest(dbg0_dbg1_l2b3_sio_ack_dest),
  .spc1_dbg1_instr_cmt_grp0(spc1_dbg1_instr_cmt_grp0[1:0]),
  .spc1_dbg1_instr_cmt_grp1(spc1_dbg1_instr_cmt_grp1[1:0]),
  .spc3_dbg1_instr_cmt_grp0(spc3_dbg1_instr_cmt_grp0[1:0]),
  .spc3_dbg1_instr_cmt_grp1(spc3_dbg1_instr_cmt_grp1[1:0]),
  .spc4_dbg1_instr_cmt_grp0(spc4_dbg1_instr_cmt_grp0[1:0]),
  .spc4_dbg1_instr_cmt_grp1(spc4_dbg1_instr_cmt_grp1[1:0]),
  .spc5_dbg1_instr_cmt_grp0(spc5_dbg1_instr_cmt_grp0[1:0]),
  .spc5_dbg1_instr_cmt_grp1(spc5_dbg1_instr_cmt_grp1[1:0]),
  .spc6_dbg1_instr_cmt_grp0(spc6_dbg1_instr_cmt_grp0[1:0]),
  .spc6_dbg1_instr_cmt_grp1(spc6_dbg1_instr_cmt_grp1[1:0]),
  .spc7_dbg1_instr_cmt_grp0(spc7_dbg1_instr_cmt_grp0[1:0]),
  .spc7_dbg1_instr_cmt_grp1(spc7_dbg1_instr_cmt_grp1[1:0]),
  .dbg0_dbg1_spc0_instr_cmt_grp0(dbg0_dbg1_spc0_instr_cmt_grp0[1:0]),
  .dbg0_dbg1_spc0_instr_cmt_grp1(dbg0_dbg1_spc0_instr_cmt_grp1[1:0]),
  .dbg0_dbg1_spc2_instr_cmt_grp0(dbg0_dbg1_spc2_instr_cmt_grp0[1:0]),
  .dbg0_dbg1_spc2_instr_cmt_grp1(dbg0_dbg1_spc2_instr_cmt_grp1[1:0]),
  .sel_soc_obs_mode(sel_soc_obs_mode),
  .sel_charac_mode(sel_charac_mode),
  .sel_rep_mode(sel_rep_mode),
  .sel_core_soc_debug_mode(sel_core_soc_debug_mode),
  .sel_train_mode(sel_train_mode),
  .l2t0_pa_match_synced(l2t0_pa_match_synced),
  .l2t1_pa_match_synced(l2t1_pa_match_synced),
  .l2t2_pa_match_synced(l2t2_pa_match_synced),
  .l2t3_pa_match_synced(l2t3_pa_match_synced),
  .l2t4_pa_match_synced(l2t4_pa_match_synced),
  .l2t5_pa_match_synced(l2t5_pa_match_synced),
  .l2t6_pa_match_synced(l2t6_pa_match_synced),
  .l2t7_pa_match_synced(l2t7_pa_match_synced),
  .l2t_error_event_synced(l2t_error_event_synced),
  .dbg1_mio_dbg_dq(dbg1_mio_dbg_dq[165:0])
                         );


// fixscan start:
assign db1_clk_header_cmp_clk_scan_in = scan_in                  ;
assign db1_clk_header_iol2clk_scan_in = db1_clk_header_cmp_clk_scan_out; 
assign ucbflow_scanin            = db1_clk_header_iol2clk_scan_out;
assign dbg1_csr_scanin           = ucbflow_scanout          ;
assign dbg1_dbgprt_scanin        = dbg1_csr_scanout         ;
assign scan_out                  = dbg1_dbgprt_scanout      ;
// fixscan end:
endmodule

