// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: db0_rtc_dp.v
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
module db0_rtc_dp (
  l2clk, 
  io_cmp_sync_en, 
  cmp_io2x_sync_en, 
  red_rtc_rep_bus, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  l2t0_dbg0_sii_iq_dequeue, 
  l2t2_dbg0_sii_iq_dequeue, 
  l2t0_dbg0_sii_wib_dequeue, 
  l2t2_dbg0_sii_wib_dequeue, 
  l2t0_dbg0_err_event, 
  l2t2_dbg0_err_event, 
  l2t0_dbg0_pa_match, 
  l2t2_dbg0_pa_match, 
  l2t0_dbg0_xbar_vcid, 
  l2t2_dbg0_xbar_vcid, 
  l2b0_dbg0_sio_ctag_vld, 
  l2b1_dbg0_sio_ctag_vld, 
  l2b2_dbg0_sio_ctag_vld, 
  l2b3_dbg0_sio_ctag_vld, 
  l2b0_dbg0_sio_ack_type, 
  l2b1_dbg0_sio_ack_type, 
  l2b2_dbg0_sio_ack_type, 
  l2b3_dbg0_sio_ack_type, 
  l2b0_dbg0_sio_ack_dest, 
  l2b1_dbg0_sio_ack_dest, 
  l2b2_dbg0_sio_ack_dest, 
  l2b3_dbg0_sio_ack_dest, 
  spc0_dbg0_instr_cmt_grp0, 
  spc0_dbg0_instr_cmt_grp1, 
  spc2_dbg0_instr_cmt_grp0, 
  spc2_dbg0_instr_cmt_grp1, 
  dbg0_dbg1_debug_data, 
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
  dbg0_dbg1_spc0_instr_cmt_grp0, 
  dbg0_dbg1_spc0_instr_cmt_grp1, 
  dbg0_dbg1_spc2_instr_cmt_grp0, 
  dbg0_dbg1_spc2_instr_cmt_grp1, 
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
  dbg0_dbg1_l2b3_sio_ack_dest);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire ff_io_sync_en_scanin;
wire ff_io_sync_en_scanout;
wire dbg0_io_cmp_sync_en_2;
wire dbg0_io_cmp_sync_en_3;
wire dbg0_io_cmp_sync_en_4;
wire dbg0_io_cmp_sync_en_5;
wire dbg0_io_cmp_sync_en_32;
wire dbg0_io_cmp_sync_en_42;
wire dbg0_io_cmp_sync_en_52;
wire dbg0_io_cmp_sync_en_6;
wire dbg0_io_cmp_sync_en_62;
wire cmp_io2x_sync_en_2;
wire dbg0_io_cmp_sync_en_3or4;
wire dbg0_io_cmp_sync_en_32or42;
wire dbg0_io_cmp_sync_en_5or6;
wire dbg0_io_cmp_sync_en_52or62;
wire ff_red_rtc_rep_bus_slice0_scanin;
wire ff_red_rtc_rep_bus_slice0_scanout;
wire ff_red_rtc_rep_bus_slice1_scanin;
wire ff_red_rtc_rep_bus_slice1_scanout;
wire ff_red_rtc_rep_bus_slice2_scanin;
wire ff_red_rtc_rep_bus_slice2_scanout;
wire ff_red_rtc_rep_bus_slice3_scanin;
wire ff_red_rtc_rep_bus_slice3_scanout;
wire ff_red_rtc_rep_bus_slice4_scanin;
wire ff_red_rtc_rep_bus_slice4_scanout;
wire ff_red_rtc_rep_bus_slice5_scanin;
wire ff_red_rtc_rep_bus_slice5_scanout;
wire ff_red_rtc_rep_bus_slice6_scanin;
wire ff_red_rtc_rep_bus_slice6_scanout;
wire ff_red_rtc_rep_bus_slice7_scanin;
wire ff_red_rtc_rep_bus_slice7_scanout;
wire ff_rep_bus_slice0_scanin;
wire ff_rep_bus_slice0_scanout;
wire ff_rep_bus_slice1_scanin;
wire ff_rep_bus_slice1_scanout;
wire ff_rep_bus_slice2_scanin;
wire ff_rep_bus_slice2_scanout;
wire ff_rep_bus_slice3_scanin;
wire ff_rep_bus_slice3_scanout;


input		l2clk;                  //Internal CMP clock from CCU
input           io_cmp_sync_en;         // IO to CMP sync enable
input           cmp_io2x_sync_en;       // CMP to IO2X sync enable
input  [331:0]  red_rtc_rep_bus;        // repeatability bus from rtc_dp module 

input           scan_in;
output          scan_out;
input           tcu_pce_ov;
input           tcu_clk_stop;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;


input           l2t0_dbg0_sii_iq_dequeue;       //L2t 0  dequeue from IQ
input           l2t2_dbg0_sii_iq_dequeue;        //L2t 2  dequeue from IQ
input           l2t0_dbg0_sii_wib_dequeue;      //L2t 0  dequeue from IOWB
input           l2t2_dbg0_sii_wib_dequeue;      //L2t 2  dequeue from IOWB
input           l2t0_dbg0_err_event;    //An Error event occurred in l2t 0
input           l2t2_dbg0_err_event;    //An Error event occurred in l2t 2
input           l2t0_dbg0_pa_match;     //A PA match detected in l2t 0
input           l2t2_dbg0_pa_match;     //A PA match detected in l2t 2
input  [5:0]    l2t0_dbg0_xbar_vcid;    //VCID[5:0] from Xbar to L2t 0
input  [5:0]    l2t2_dbg0_xbar_vcid;    //VCID[5:0] from Xbar to L2t 2
input           l2b0_dbg0_sio_ctag_vld; //Ctag  valid from L2b 0  to SIO
input           l2b1_dbg0_sio_ctag_vld; //Ctag  valid from L2b 1  to SIO
input           l2b2_dbg0_sio_ctag_vld; //Ctag  valid from L2b 2  to SIO
input           l2b3_dbg0_sio_ctag_vld; //Ctag  valid from L2b 3  to SIO
input           l2b0_dbg0_sio_ack_type; //Read or Wr ack from L2b 0  to SIO
input           l2b1_dbg0_sio_ack_type; //Read or Wr ack from L2b 1  to SIO
input           l2b2_dbg0_sio_ack_type; //Read or Wr ack from L2b 2  to SIO
input           l2b3_dbg0_sio_ack_type; //Read or Wr ack from L2b 3  to SIO
input           l2b0_dbg0_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 0  to SIO
input           l2b1_dbg0_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 1  to SIO
input           l2b2_dbg0_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 2  to SIO
input           l2b3_dbg0_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 3  to SIO
input  [1:0]    spc0_dbg0_instr_cmt_grp0;//Instruction Commited in Thread Group 0 for SPC 0
input  [1:0]    spc0_dbg0_instr_cmt_grp1;//Instruction Commited in Thread Group 1 for SPC 0
input  [1:0]    spc2_dbg0_instr_cmt_grp0;//Instruction Commited in Thread Group 0 for SPC 2
input  [1:0]    spc2_dbg0_instr_cmt_grp1;//Instruction Commited in Thread Group 1 for SPC 2


output [165:0]   dbg0_dbg1_debug_data;  // 166 bit debug data bus carrying repeatability signals to DBG1
output           dbg0_dbg1_l2t0_sii_iq_dequeue;       //L2t 0  dequeue from IQ : flopped version
output           dbg0_dbg1_l2t2_sii_iq_dequeue;        //L2t 2  dequeue from IQ : flopped version
output           dbg0_dbg1_l2t0_sii_wib_dequeue;      //L2t 0  dequeue from IOWB : flopped version
output           dbg0_dbg1_l2t2_sii_wib_dequeue;      //L2t 2  dequeue from IOWB : flopped version
output           dbg0_dbg1_l2t0_err_event;    //An Error event occurred in l2t 0 : flopped version
output           dbg0_dbg1_l2t2_err_event;    //An Error event occurred in l2t 2 : flopped version
output           dbg0_dbg1_l2t0_pa_match;     //A PA match detected in l2t 0 : flopped version
output           dbg0_dbg1_l2t2_pa_match;     //A PA match detected in l2t 2 : flopped version
output  [5:0]    dbg0_dbg1_l2t0_xbar_vcid;    //VCID[5:0] from Xbar to L2t 0 : flopped version
output  [5:0]    dbg0_dbg1_l2t2_xbar_vcid;    //VCID[5:0] from Xbar to L2t 2 : flopped version

output  [1:0]    dbg0_dbg1_spc0_instr_cmt_grp0;//Instruction Commited in Thread Group 0 for SPC 0
output  [1:0]    dbg0_dbg1_spc0_instr_cmt_grp1;//Instruction Commited in Thread Group 1 for SPC 0
output  [1:0]    dbg0_dbg1_spc2_instr_cmt_grp0;//Instruction Commited in Thread Group 0 for SPC 2
output  [1:0]    dbg0_dbg1_spc2_instr_cmt_grp1;//Instruction Commited in Thread Group 1 for SPC 2

output           dbg0_dbg1_l2b0_sio_ctag_vld; //Ctag  valid from L2b 0  to SIO : flopped version
output           dbg0_dbg1_l2b1_sio_ctag_vld; //Ctag  valid from L2b 1  to SIO : flopped version
output           dbg0_dbg1_l2b2_sio_ctag_vld; //Ctag  valid from L2b 2  to SIO : flopped version
output           dbg0_dbg1_l2b3_sio_ctag_vld; //Ctag  valid from L2b 3  to SIO : flopped version
output           dbg0_dbg1_l2b0_sio_ack_type; //Read or Wr ack from L2b 0  to SIO : flopped version
output           dbg0_dbg1_l2b1_sio_ack_type; //Read or Wr ack from L2b 1  to SIO : flopped version
output           dbg0_dbg1_l2b2_sio_ack_type; //Read or Wr ack from L2b 2  to SIO : flopped version
output           dbg0_dbg1_l2b3_sio_ack_type; //Read or Wr ack from L2b 3  to SIO : flopped version
output           dbg0_dbg1_l2b0_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 0  to SIO : flopped version
output           dbg0_dbg1_l2b1_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 1  to SIO : flopped version
output           dbg0_dbg1_l2b2_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 2  to SIO : flopped version
output           dbg0_dbg1_l2b3_sio_ack_dest; //Read or Wr ack dest (NIU/DMU) from L2b 3  to SIO : flopped version

// Scan reassigns
assign pce_ov = tcu_pce_ov;
assign stop = tcu_clk_stop;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

wire  [331:0] red_rtc_rep_bus_r,red_rtc_rep_bus_rewired;
wire  [165:0] rep_bus;

// io_cmp_sync_en staging flops to stage sync_enables and to stage signnals 
// from spc0,2, l2b0,1,2,3 l2t0,2  

db0_rtc_dp_msff_macro__stack_50c__width_50 ff_io_sync_en           (
                .scan_in(ff_io_sync_en_scanin),
                .scan_out(ff_io_sync_en_scanout),
                .clk    ( l2clk ),
                .en     ( 1'b1 ),
                .din    ( {io_cmp_sync_en,dbg0_io_cmp_sync_en_2,
                           dbg0_io_cmp_sync_en_3,dbg0_io_cmp_sync_en_4,dbg0_io_cmp_sync_en_5,
                           dbg0_io_cmp_sync_en_2,dbg0_io_cmp_sync_en_32,dbg0_io_cmp_sync_en_42,
                           dbg0_io_cmp_sync_en_52,cmp_io2x_sync_en,
                           spc0_dbg0_instr_cmt_grp0[1:0],spc0_dbg0_instr_cmt_grp1[1:0],
                           spc2_dbg0_instr_cmt_grp0[1:0],spc2_dbg0_instr_cmt_grp1[1:0],
                           l2b0_dbg0_sio_ctag_vld,l2b1_dbg0_sio_ctag_vld,l2b2_dbg0_sio_ctag_vld,
                           l2b3_dbg0_sio_ctag_vld,l2b0_dbg0_sio_ack_type,l2b1_dbg0_sio_ack_type,
                           l2b2_dbg0_sio_ack_type,l2b3_dbg0_sio_ack_type,l2b0_dbg0_sio_ack_dest,
                           l2b1_dbg0_sio_ack_dest,l2b2_dbg0_sio_ack_dest,l2b3_dbg0_sio_ack_dest,
                           l2t0_dbg0_xbar_vcid[5:0],l2t2_dbg0_xbar_vcid[5:0],
                           l2t0_dbg0_sii_iq_dequeue,l2t2_dbg0_sii_iq_dequeue,l2t0_dbg0_sii_wib_dequeue,
                           l2t2_dbg0_sii_wib_dequeue,l2t0_dbg0_err_event,l2t2_dbg0_err_event,
                           l2t0_dbg0_pa_match,l2t2_dbg0_pa_match} 
                         ),
                           
                .dout   ( {dbg0_io_cmp_sync_en_2,dbg0_io_cmp_sync_en_3,
                           dbg0_io_cmp_sync_en_4,dbg0_io_cmp_sync_en_5,dbg0_io_cmp_sync_en_6,
                           dbg0_io_cmp_sync_en_32,dbg0_io_cmp_sync_en_42,dbg0_io_cmp_sync_en_52,
                           dbg0_io_cmp_sync_en_62,cmp_io2x_sync_en_2,
                           dbg0_dbg1_spc0_instr_cmt_grp0[1:0],dbg0_dbg1_spc0_instr_cmt_grp1[1:0],
                           dbg0_dbg1_spc2_instr_cmt_grp0[1:0],dbg0_dbg1_spc2_instr_cmt_grp1[1:0],
                           dbg0_dbg1_l2b0_sio_ctag_vld,dbg0_dbg1_l2b1_sio_ctag_vld,
                           dbg0_dbg1_l2b2_sio_ctag_vld,dbg0_dbg1_l2b3_sio_ctag_vld,
                           dbg0_dbg1_l2b0_sio_ack_type,dbg0_dbg1_l2b1_sio_ack_type,
                           dbg0_dbg1_l2b2_sio_ack_type,dbg0_dbg1_l2b3_sio_ack_type,
                           dbg0_dbg1_l2b0_sio_ack_dest,dbg0_dbg1_l2b1_sio_ack_dest,
                           dbg0_dbg1_l2b2_sio_ack_dest,dbg0_dbg1_l2b3_sio_ack_dest,
                           dbg0_dbg1_l2t0_xbar_vcid[5:0],dbg0_dbg1_l2t2_xbar_vcid[5:0],
                           dbg0_dbg1_l2t0_sii_iq_dequeue,dbg0_dbg1_l2t2_sii_iq_dequeue,
                           dbg0_dbg1_l2t0_sii_wib_dequeue,dbg0_dbg1_l2t2_sii_wib_dequeue,
                           dbg0_dbg1_l2t0_err_event,dbg0_dbg1_l2t2_err_event,
                           dbg0_dbg1_l2t0_pa_match,dbg0_dbg1_l2t2_pa_match} ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

// OR piped versions of sync enables to generate mux selects

db0_rtc_dp_or_macro__stack_1l__width_1 or_sync_3_4    
        (
        .din0   (dbg0_io_cmp_sync_en_3),
        .din1   (dbg0_io_cmp_sync_en_4),
        .dout   (dbg0_io_cmp_sync_en_3or4)
        );

db0_rtc_dp_or_macro__stack_1l__width_1 or_sync_32_42    
        (
        .din0   (dbg0_io_cmp_sync_en_32),
        .din1   (dbg0_io_cmp_sync_en_42),
        .dout   (dbg0_io_cmp_sync_en_32or42)
        );

db0_rtc_dp_or_macro__stack_1l__width_1 or_sync_5_6    
        (
        .din0   (dbg0_io_cmp_sync_en_5),
        .din1   (dbg0_io_cmp_sync_en_6),
        .dout   (dbg0_io_cmp_sync_en_5or6)
        );

db0_rtc_dp_or_macro__stack_1l__width_1 or_sync_52_62    
        (
        .din0   (dbg0_io_cmp_sync_en_52),
        .din1   (dbg0_io_cmp_sync_en_62),
        .dout   (dbg0_io_cmp_sync_en_52or62)
        );

// flop red_rtc_rep_bus bits [165:0]
// flop the data such that the DMU data goes out over 2 back to back 700 mhz clock edges
// on bits 82:0 , and NIU data on bits 165:83

assign red_rtc_rep_bus_rewired = {   red_rtc_rep_bus[248:166],red_rtc_rep_bus[82:0], // NIU 2nd,DMU 2nd
                                     red_rtc_rep_bus[331:249],red_rtc_rep_bus[165:83]} ; // NIU 1st, DMU 1st


db0_rtc_dp_msff_macro__stack_72c__width_72 ff_red_rtc_rep_bus_slice0           (
                .scan_in(ff_red_rtc_rep_bus_slice0_scanin),
                .scan_out(ff_red_rtc_rep_bus_slice0_scanout),
                .clk    ( l2clk ),
                .en     ( dbg0_io_cmp_sync_en_2 ),
                .din    ( red_rtc_rep_bus_rewired[71:0]),
                .dout   ( red_rtc_rep_bus_r[71:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop) 
                );

db0_rtc_dp_msff_macro__stack_12r__width_12 ff_red_rtc_rep_bus_slice1           (
                .scan_in(ff_red_rtc_rep_bus_slice1_scanin),
                .scan_out(ff_red_rtc_rep_bus_slice1_scanout),
                .clk    ( l2clk ),
                .en     ( dbg0_io_cmp_sync_en_2 ),
                .din    ( red_rtc_rep_bus_rewired[83:72]),
                .dout   ( red_rtc_rep_bus_r[83:72]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db0_rtc_dp_msff_macro__stack_72c__width_72 ff_red_rtc_rep_bus_slice2           (
                .scan_in(ff_red_rtc_rep_bus_slice2_scanin),
                .scan_out(ff_red_rtc_rep_bus_slice2_scanout),
                .clk    ( l2clk ),
                .en     ( dbg0_io_cmp_sync_en_2 ),
                .din    ( red_rtc_rep_bus_rewired[155:84]),
                .dout   ( red_rtc_rep_bus_r[155:84]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
               );

db0_rtc_dp_msff_macro__stack_10r__width_10 ff_red_rtc_rep_bus_slice3           (
                .scan_in(ff_red_rtc_rep_bus_slice3_scanin),
                .scan_out(ff_red_rtc_rep_bus_slice3_scanout),
                .clk    ( l2clk ),
                .en     ( dbg0_io_cmp_sync_en_2 ),
                .din    ( red_rtc_rep_bus_rewired[165:156]),
                .dout   ( red_rtc_rep_bus_r[165:156]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
               );

// flop red_rtc_rep_bus bits [311:166]

db0_rtc_dp_msff_macro__stack_72c__width_72 ff_red_rtc_rep_bus_slice4          (
                .scan_in(ff_red_rtc_rep_bus_slice4_scanin),
                .scan_out(ff_red_rtc_rep_bus_slice4_scanout),
                .clk    ( l2clk ),
                .en     ( dbg0_io_cmp_sync_en_2 ),
                .din    ( red_rtc_rep_bus_rewired[237:166]),
                .dout   ( red_rtc_rep_bus_r[237:166]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
               );

db0_rtc_dp_msff_macro__stack_12r__width_12 ff_red_rtc_rep_bus_slice5          (
                .scan_in(ff_red_rtc_rep_bus_slice5_scanin),
                .scan_out(ff_red_rtc_rep_bus_slice5_scanout),
                .clk    ( l2clk ),
                .en     ( dbg0_io_cmp_sync_en_2 ),
                .din    ( red_rtc_rep_bus_rewired[249:238]),
                .dout   ( red_rtc_rep_bus_r[249:238]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
               );

db0_rtc_dp_msff_macro__stack_72c__width_72 ff_red_rtc_rep_bus_slice6          (
                .scan_in(ff_red_rtc_rep_bus_slice6_scanin),
                .scan_out(ff_red_rtc_rep_bus_slice6_scanout),
                .clk    ( l2clk ),
                .en     ( dbg0_io_cmp_sync_en_2 ),
                .din    ( red_rtc_rep_bus_rewired[321:250]),
                .dout   ( red_rtc_rep_bus_r[321:250]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
               );

db0_rtc_dp_msff_macro__stack_10r__width_10 ff_red_rtc_rep_bus_slice7          (
                .scan_in(ff_red_rtc_rep_bus_slice7_scanin),
                .scan_out(ff_red_rtc_rep_bus_slice7_scanout),
                .clk    ( l2clk ),
                .en     ( dbg0_io_cmp_sync_en_2 ),
                .din    ( red_rtc_rep_bus_rewired[331:322]),
                .dout   ( red_rtc_rep_bus_r[331:322]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
               );

// Mux between red_rtc_rep_bus_r[311:166] and red_rtc_rep_bus_r[165:0]

db0_rtc_dp_mux_macro__mux_aonpe__stack_72c__width_72 mux_1 
               (
                .dout (rep_bus[71:0]),
                .din0  (red_rtc_rep_bus_r[71:0]),
                .din1  (red_rtc_rep_bus_r[237:166]),
                .sel0 (dbg0_io_cmp_sync_en_3or4),
                .sel1 (dbg0_io_cmp_sync_en_5or6)
              ) ;

db0_rtc_dp_mux_macro__mux_aonpe__stack_12r__width_12 mux_2 
               (
                .dout (rep_bus[83:72]),
                .din0  (red_rtc_rep_bus_r[83:72]),
                .din1  (red_rtc_rep_bus_r[249:238]),
                .sel0 (dbg0_io_cmp_sync_en_3or4),
                .sel1 (dbg0_io_cmp_sync_en_5or6)
              ) ;

db0_rtc_dp_mux_macro__mux_aonpe__stack_72c__width_72 mux_3 
               (
                .dout (rep_bus[155:84]),
                .din0  (red_rtc_rep_bus_r[155:84]),
                .din1  (red_rtc_rep_bus_r[321:250]),
                .sel0 (dbg0_io_cmp_sync_en_32or42),
                .sel1 (dbg0_io_cmp_sync_en_52or62)
              ) ;

db0_rtc_dp_mux_macro__mux_aonpe__stack_10r__width_10 mux_4 
               (
                .dout (rep_bus[165:156]),
                .din0  (red_rtc_rep_bus_r[165:156]),
                .din1  (red_rtc_rep_bus_r[331:322]),
                .sel0 (dbg0_io_cmp_sync_en_32or42),
                .sel1 (dbg0_io_cmp_sync_en_52or62)
              ) ;

// FLop rep_bus before sending out of dbg0, enabled by cmp_io2x_sync_en_2

db0_rtc_dp_msff_macro__stack_72c__width_72 ff_rep_bus_slice0           (
                .scan_in(ff_rep_bus_slice0_scanin),
                .scan_out(ff_rep_bus_slice0_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2 ),
                .din    ( rep_bus[71:0]),
                .dout   ( dbg0_dbg1_debug_data[71:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db0_rtc_dp_msff_macro__stack_12r__width_12 ff_rep_bus_slice1           (
                .scan_in(ff_rep_bus_slice1_scanin),
                .scan_out(ff_rep_bus_slice1_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2 ),
                .din    ( rep_bus[83:72]),
                .dout   ( dbg0_dbg1_debug_data[83:72]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
                );

db0_rtc_dp_msff_macro__stack_72c__width_72 ff_rep_bus_slice2           (
                .scan_in(ff_rep_bus_slice2_scanin),
                .scan_out(ff_rep_bus_slice2_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2 ),
                .din    ( rep_bus[155:84]),
                .dout   ( dbg0_dbg1_debug_data[155:84]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
               );

db0_rtc_dp_msff_macro__stack_10r__width_10 ff_rep_bus_slice3           (
                .scan_in(ff_rep_bus_slice3_scanin),
                .scan_out(ff_rep_bus_slice3_scanout),
                .clk    ( l2clk ),
                .en     ( cmp_io2x_sync_en_2 ),
                .din    ( rep_bus[165:156]),
                .dout   ( dbg0_dbg1_debug_data[165:156]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
               );


// fixscan start:
assign ff_io_sync_en_scanin      = scan_in                  ;
assign ff_red_rtc_rep_bus_slice0_scanin = ff_io_sync_en_scanout    ;
assign ff_red_rtc_rep_bus_slice1_scanin = ff_red_rtc_rep_bus_slice0_scanout;
assign ff_red_rtc_rep_bus_slice2_scanin = ff_red_rtc_rep_bus_slice1_scanout;
assign ff_red_rtc_rep_bus_slice3_scanin = ff_red_rtc_rep_bus_slice2_scanout;
assign ff_red_rtc_rep_bus_slice4_scanin = ff_red_rtc_rep_bus_slice3_scanout;
assign ff_red_rtc_rep_bus_slice5_scanin = ff_red_rtc_rep_bus_slice4_scanout;
assign ff_red_rtc_rep_bus_slice6_scanin = ff_red_rtc_rep_bus_slice5_scanout;
assign ff_red_rtc_rep_bus_slice7_scanin = ff_red_rtc_rep_bus_slice6_scanout;
assign ff_rep_bus_slice0_scanin  = ff_red_rtc_rep_bus_slice7_scanout;
assign ff_rep_bus_slice1_scanin  = ff_rep_bus_slice0_scanout;
assign ff_rep_bus_slice2_scanin  = ff_rep_bus_slice1_scanout;
assign ff_rep_bus_slice3_scanin  = ff_rep_bus_slice2_scanout;
assign scan_out                  = ff_rep_bus_slice3_scanout;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module db0_rtc_dp_msff_macro__stack_50c__width_50 (
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
wire [48:0] so;

  input [49:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [49:0] dout;


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
dff #(50)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[49:0]),
.si({scan_in,so[48:0]}),
.so({so[48:0],scan_out}),
.q(dout[49:0])
);




















endmodule









//  
//   or macro for ports = 2,3
//
//





module db0_rtc_dp_or_macro__stack_1l__width_1 (
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

module db0_rtc_dp_msff_macro__stack_72c__width_72 (
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

module db0_rtc_dp_msff_macro__stack_12r__width_12 (
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

module db0_rtc_dp_msff_macro__stack_10r__width_10 (
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module db0_rtc_dp_mux_macro__mux_aonpe__stack_72c__width_72 (
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

module db0_rtc_dp_mux_macro__mux_aonpe__stack_12r__width_12 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [11:0] din0;
  input sel0;
  input [11:0] din1;
  input sel1;
  output [11:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(12)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[11:0]),
  .in1(din1[11:0]),
.dout(dout[11:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module db0_rtc_dp_mux_macro__mux_aonpe__stack_10r__width_10 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [9:0] din0;
  input sel0;
  input [9:0] din1;
  input sel1;
  output [9:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(10)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[9:0]),
  .in1(din1[9:0]),
.dout(dout[9:0])
);









  



endmodule

