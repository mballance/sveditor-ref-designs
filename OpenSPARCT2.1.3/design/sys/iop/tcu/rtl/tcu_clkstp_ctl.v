// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tcu_clkstp_ctl.v
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
module tcu_clkstp_ctl (
  l2clk, 
  scan_in, 
  scan_out, 
  tcu_int_se, 
  tcu_int_aclk, 
  tcu_int_bclk, 
  tcu_int_ce, 
  tcu_pce_ov, 
  cmp_dr_sync_en, 
  mt_mode_sync, 
  instr_mt_scan_rti, 
  pre_spc0_clk_stop, 
  pre_spc1_clk_stop, 
  pre_spc2_clk_stop, 
  pre_spc3_clk_stop, 
  pre_spc4_clk_stop, 
  pre_spc5_clk_stop, 
  pre_spc6_clk_stop, 
  pre_spc7_clk_stop, 
  pre_bnk0_clk_stop, 
  pre_l2t0_clk_stop, 
  pre_bnk1_clk_stop, 
  pre_l2t1_clk_stop, 
  pre_bnk2_clk_stop, 
  pre_l2t2_clk_stop, 
  pre_bnk3_clk_stop, 
  pre_l2t3_clk_stop, 
  pre_bnk4_clk_stop, 
  pre_l2t4_clk_stop, 
  pre_bnk5_clk_stop, 
  pre_l2t5_clk_stop, 
  pre_bnk6_clk_stop, 
  pre_l2t6_clk_stop, 
  pre_bnk7_clk_stop, 
  pre_l2t7_clk_stop, 
  pre_mcu0_clk_stop, 
  pre_mcu0_io_clk_stop, 
  pre_mcu0_dr_clk_stop, 
  pre_mcu0_fbd_clk_stop, 
  pre_mcu1_clk_stop, 
  pre_mcu1_io_clk_stop, 
  pre_mcu1_dr_clk_stop, 
  pre_mcu1_fbd_clk_stop, 
  pre_mcu2_clk_stop, 
  pre_mcu2_io_clk_stop, 
  pre_mcu2_dr_clk_stop, 
  pre_mcu2_fbd_clk_stop, 
  pre_mcu3_clk_stop, 
  pre_mcu3_io_clk_stop, 
  pre_mcu3_dr_clk_stop, 
  pre_mcu3_fbd_clk_stop, 
  pre_soc0_clk_stop, 
  pre_soc0_io_clk_stop, 
  pre_soc1_io_clk_stop, 
  pre_soc2_io_clk_stop, 
  pre_soc3_clk_stop, 
  pre_soc3_io_clk_stop, 
  tcu_spc0_clk_stop, 
  tcu_spc1_clk_stop, 
  tcu_spc2_clk_stop, 
  tcu_spc3_clk_stop, 
  tcu_spc4_clk_stop, 
  tcu_spc5_clk_stop, 
  tcu_spc6_clk_stop, 
  tcu_spc7_clk_stop, 
  tcu_l2d0_clk_stop, 
  tcu_l2d1_clk_stop, 
  tcu_l2d2_clk_stop, 
  tcu_l2d3_clk_stop, 
  tcu_l2d4_clk_stop, 
  tcu_l2d5_clk_stop, 
  tcu_l2d6_clk_stop, 
  tcu_l2d7_clk_stop, 
  tcu_l2b0_clk_stop, 
  tcu_l2b1_clk_stop, 
  tcu_l2b2_clk_stop, 
  tcu_l2b3_clk_stop, 
  tcu_l2b4_clk_stop, 
  tcu_l2b5_clk_stop, 
  tcu_l2b6_clk_stop, 
  tcu_l2b7_clk_stop, 
  tcu_l2t0_clk_stop, 
  tcu_l2t1_clk_stop, 
  tcu_l2t2_clk_stop, 
  tcu_l2t3_clk_stop, 
  tcu_l2t4_clk_stop, 
  tcu_l2t5_clk_stop, 
  tcu_l2t6_clk_stop, 
  tcu_l2t7_clk_stop, 
  tcu_mcu0_clk_stop, 
  tcu_mcu1_clk_stop, 
  tcu_mcu2_clk_stop, 
  tcu_mcu3_clk_stop, 
  tcu_mcu0_dr_clk_stop, 
  tcu_mcu1_dr_clk_stop, 
  tcu_mcu2_dr_clk_stop, 
  tcu_mcu3_dr_clk_stop, 
  tcu_mcu0_io_clk_stop, 
  tcu_mcu1_io_clk_stop, 
  tcu_mcu2_io_clk_stop, 
  tcu_mcu3_io_clk_stop, 
  tcu_mcu0_fbd_clk_stop, 
  tcu_mcu1_fbd_clk_stop, 
  tcu_mcu2_fbd_clk_stop, 
  tcu_mcu3_fbd_clk_stop, 
  tcu_sii_clk_stop, 
  tcu_sio_clk_stop, 
  tcu_ncu_clk_stop, 
  tcu_ccx_clk_stop, 
  tcu_efu_clk_stop, 
  tcu_sii_io_clk_stop, 
  tcu_sio_io_clk_stop, 
  tcu_ncu_io_clk_stop, 
  tcu_efu_io_clk_stop, 
  tcu_db0_clk_stop, 
  tcu_db1_clk_stop, 
  tcu_mio_clk_stop, 
  tcu_rdp_io_clk_stop, 
  tcu_mac_io_clk_stop, 
  tcu_rtx_io_clk_stop, 
  tcu_tds_io_clk_stop, 
  tcu_dmu_io_clk_stop, 
  tcu_peu_pc_clk_stop, 
  tcu_peu_io_clk_stop);
wire l1en;
wire pce_ov;
wire stop;
wire se;
wire siclk;
wire soclk;
wire l1clk;
wire clkstp_cmpsync_reg_scanin;
wire clkstp_cmpsync_reg_scanout;
wire cmp_dr_sync_en_local;
wire not_mt_mode;
wire instr_mt_scan_rti_sync;
wire clkstp_spc0stop_reg_scanin;
wire clkstp_spc0stop_reg_scanout;
wire pre_spc0_clk_stop_l;
wire tcu_spc0_clk_stop_l;
wire clkstp_spc1stop_reg_scanin;
wire clkstp_spc1stop_reg_scanout;
wire pre_spc1_clk_stop_l;
wire tcu_spc1_clk_stop_l;
wire clkstp_spc2stop_reg_scanin;
wire clkstp_spc2stop_reg_scanout;
wire pre_spc2_clk_stop_l;
wire tcu_spc2_clk_stop_l;
wire clkstp_spc3stop_reg_scanin;
wire clkstp_spc3stop_reg_scanout;
wire pre_spc3_clk_stop_l;
wire tcu_spc3_clk_stop_l;
wire clkstp_spc4stop_reg_scanin;
wire clkstp_spc4stop_reg_scanout;
wire pre_spc4_clk_stop_l;
wire tcu_spc4_clk_stop_l;
wire clkstp_spc5stop_reg_scanin;
wire clkstp_spc5stop_reg_scanout;
wire pre_spc5_clk_stop_l;
wire tcu_spc5_clk_stop_l;
wire clkstp_spc6stop_reg_scanin;
wire clkstp_spc6stop_reg_scanout;
wire pre_spc6_clk_stop_l;
wire tcu_spc6_clk_stop_l;
wire clkstp_spc7stop_reg_scanin;
wire clkstp_spc7stop_reg_scanout;
wire pre_spc7_clk_stop_l;
wire tcu_spc7_clk_stop_l;
wire clkstp_bnkstop_reg_scanin;
wire clkstp_bnkstop_reg_scanout;
wire pre_bnk0_clk_stop_l;
wire pre_bnk1_clk_stop_l;
wire pre_bnk2_clk_stop_l;
wire pre_bnk3_clk_stop_l;
wire pre_bnk4_clk_stop_l;
wire pre_bnk5_clk_stop_l;
wire pre_bnk6_clk_stop_l;
wire pre_bnk7_clk_stop_l;
wire tcu_bnk0_clk_stop_l;
wire tcu_bnk1_clk_stop_l;
wire tcu_bnk2_clk_stop_l;
wire tcu_bnk3_clk_stop_l;
wire tcu_bnk4_clk_stop_l;
wire tcu_bnk5_clk_stop_l;
wire tcu_bnk6_clk_stop_l;
wire tcu_bnk7_clk_stop_l;
wire clkstp_l2tstop_reg_scanin;
wire clkstp_l2tstop_reg_scanout;
wire pre_l2t0_clk_stop_l;
wire pre_l2t1_clk_stop_l;
wire pre_l2t2_clk_stop_l;
wire pre_l2t3_clk_stop_l;
wire pre_l2t4_clk_stop_l;
wire pre_l2t5_clk_stop_l;
wire pre_l2t6_clk_stop_l;
wire pre_l2t7_clk_stop_l;
wire tcu_l2t0_clk_stop_l;
wire tcu_l2t1_clk_stop_l;
wire tcu_l2t2_clk_stop_l;
wire tcu_l2t3_clk_stop_l;
wire tcu_l2t4_clk_stop_l;
wire tcu_l2t5_clk_stop_l;
wire tcu_l2t6_clk_stop_l;
wire tcu_l2t7_clk_stop_l;
wire clkstp_mcustop_reg_scanin;
wire clkstp_mcustop_reg_scanout;
wire pre_mcu0_clk_stop_l;
wire pre_mcu1_clk_stop_l;
wire pre_mcu2_clk_stop_l;
wire pre_mcu3_clk_stop_l;
wire tcu_mcu0_clk_stop_l;
wire tcu_mcu1_clk_stop_l;
wire tcu_mcu2_clk_stop_l;
wire tcu_mcu3_clk_stop_l;
wire clkstp_mcuiostop_reg_scanin;
wire clkstp_mcuiostop_reg_scanout;
wire pre_mcu0_io_clk_stop_l;
wire pre_mcu1_io_clk_stop_l;
wire pre_mcu2_io_clk_stop_l;
wire pre_mcu3_io_clk_stop_l;
wire tcu_mcu0_io_clk_stop_l;
wire tcu_mcu1_io_clk_stop_l;
wire tcu_mcu2_io_clk_stop_l;
wire tcu_mcu3_io_clk_stop_l;
wire clkstp_mcudrstop_reg_scanin;
wire clkstp_mcudrstop_reg_scanout;
wire pre_mcu0_dr_clk_stop_l;
wire pre_mcu1_dr_clk_stop_l;
wire pre_mcu2_dr_clk_stop_l;
wire pre_mcu3_dr_clk_stop_l;
wire tcu_mcu0_dr_clk_stop_l;
wire tcu_mcu1_dr_clk_stop_l;
wire tcu_mcu2_dr_clk_stop_l;
wire tcu_mcu3_dr_clk_stop_l;
wire clkstp_mcufbdstop_reg_scanin;
wire clkstp_mcufbdstop_reg_scanout;
wire pre_mcu0_fbd_clk_stop_l;
wire pre_mcu1_fbd_clk_stop_l;
wire pre_mcu2_fbd_clk_stop_l;
wire pre_mcu3_fbd_clk_stop_l;
wire tcu_mcu0_fbd_clk_stop_l;
wire tcu_mcu1_fbd_clk_stop_l;
wire tcu_mcu2_fbd_clk_stop_l;
wire tcu_mcu3_fbd_clk_stop_l;
wire clkstp_soc0stop_reg_scanin;
wire clkstp_soc0stop_reg_scanout;
wire pre_soc0_clk_stop_l;
wire tcu_soc0_clk_stop_l;
wire clkstp_soc0iostop_reg_scanin;
wire clkstp_soc0iostop_reg_scanout;
wire pre_soc0_io_clk_stop_l;
wire tcu_soc0_io_clk_stop_l;
wire clkstp_soc1iostop_reg_scanin;
wire clkstp_soc1iostop_reg_scanout;
wire pre_soc1_io_clk_stop_l;
wire tcu_soc1_io_clk_stop_l;
wire clkstp_soc2iostop_reg_scanin;
wire clkstp_soc2iostop_reg_scanout;
wire pre_soc2_io_clk_stop_l;
wire tcu_soc2_io_clk_stop_l;
wire clkstp_soc3stop_reg_scanin;
wire clkstp_soc3stop_reg_scanout;
wire pre_soc3_clk_stop_l;
wire tcu_soc3_clk_stop_l;
wire clkstp_soc3iostop_reg_scanin;
wire clkstp_soc3iostop_reg_scanout;
wire pre_soc3_io_clk_stop_l;
wire tcu_soc3_io_clk_stop_l;
wire turn_off_clk_stop;
wire tcu_bnk0_clk_stop;
wire tcu_bnk1_clk_stop;
wire tcu_bnk2_clk_stop;
wire tcu_bnk3_clk_stop;
wire tcu_bnk4_clk_stop;
wire tcu_bnk5_clk_stop;
wire tcu_bnk6_clk_stop;
wire tcu_bnk7_clk_stop;
wire tcu_soc0_clk_stop;
wire tcu_soc0_io_clk_stop;
wire tcu_soc1_io_clk_stop;
wire tcu_soc2_io_clk_stop;
wire tcu_soc3_clk_stop;
wire tcu_soc3_io_clk_stop;
wire sync_ff_instr_mt_scan_scanin;
wire sync_ff_instr_mt_scan_scanout;

   
   input         l2clk;

   // Scan input/output for this block 
   input 	 scan_in;
   output 	 scan_out;
   // Scan Controls
   input         tcu_int_se;
   input         tcu_int_aclk;
   input         tcu_int_bclk;
   input         tcu_int_ce;
   input         tcu_pce_ov;
   
   // Synchronizer enables
   input         cmp_dr_sync_en; // enable dr_clk_stops with this

   // Synchronized macro test mode enable signal
   input         mt_mode_sync;
   input         instr_mt_scan_rti;

   // Inputs from sigmux_ctl
   input 	 pre_spc0_clk_stop;
   input 	 pre_spc1_clk_stop;
   input 	 pre_spc2_clk_stop;
   input 	 pre_spc3_clk_stop;
   input 	 pre_spc4_clk_stop;
   input 	 pre_spc5_clk_stop;
   input 	 pre_spc6_clk_stop;
   input 	 pre_spc7_clk_stop;
   
   input 	 pre_bnk0_clk_stop; 
   input 	 pre_l2t0_clk_stop;
   input 	 pre_bnk1_clk_stop; 
   input 	 pre_l2t1_clk_stop; 
   input 	 pre_bnk2_clk_stop; 
   input 	 pre_l2t2_clk_stop; 
   input 	 pre_bnk3_clk_stop; 
   input 	 pre_l2t3_clk_stop; 
   input 	 pre_bnk4_clk_stop; 
   input 	 pre_l2t4_clk_stop; 
   input 	 pre_bnk5_clk_stop; 
   input 	 pre_l2t5_clk_stop; 
   input 	 pre_bnk6_clk_stop; 
   input 	 pre_l2t6_clk_stop; 
   input 	 pre_bnk7_clk_stop; 
   input 	 pre_l2t7_clk_stop;

   input 	 pre_mcu0_clk_stop;
   input 	 pre_mcu0_io_clk_stop;
   input 	 pre_mcu0_dr_clk_stop;
   input 	 pre_mcu0_fbd_clk_stop;
   
   input 	 pre_mcu1_clk_stop;
   input 	 pre_mcu1_io_clk_stop;
   input 	 pre_mcu1_dr_clk_stop;
   input 	 pre_mcu1_fbd_clk_stop;
   
   input 	 pre_mcu2_clk_stop;
   input 	 pre_mcu2_io_clk_stop;
   input 	 pre_mcu2_dr_clk_stop;
   input 	 pre_mcu2_fbd_clk_stop;
 
   input 	 pre_mcu3_clk_stop;
   input 	 pre_mcu3_io_clk_stop;
   input 	 pre_mcu3_dr_clk_stop;
   input 	 pre_mcu3_fbd_clk_stop;
   
   input 	 pre_soc0_clk_stop;
   input 	 pre_soc0_io_clk_stop;
   
   input 	 pre_soc1_io_clk_stop;
   input 	 pre_soc2_io_clk_stop;
   input 	 pre_soc3_clk_stop;
   input 	 pre_soc3_io_clk_stop;
   

   // Outputs from TCU
   output 	 tcu_spc0_clk_stop;
   output 	 tcu_spc1_clk_stop;
   output 	 tcu_spc2_clk_stop;
   output 	 tcu_spc3_clk_stop;
   output 	 tcu_spc4_clk_stop;
   output 	 tcu_spc5_clk_stop;
   output 	 tcu_spc6_clk_stop;
   output 	 tcu_spc7_clk_stop;
   output 	 tcu_l2d0_clk_stop;
   output 	 tcu_l2d1_clk_stop;
   output 	 tcu_l2d2_clk_stop;
   output 	 tcu_l2d3_clk_stop;
   output 	 tcu_l2d4_clk_stop;
   output 	 tcu_l2d5_clk_stop;
   output 	 tcu_l2d6_clk_stop;
   output 	 tcu_l2d7_clk_stop;
   output 	 tcu_l2b0_clk_stop;
   output 	 tcu_l2b1_clk_stop;
   output 	 tcu_l2b2_clk_stop;
   output 	 tcu_l2b3_clk_stop;
   output 	 tcu_l2b4_clk_stop;
   output 	 tcu_l2b5_clk_stop;
   output 	 tcu_l2b6_clk_stop;
   output 	 tcu_l2b7_clk_stop;
   output 	 tcu_l2t0_clk_stop;
   output 	 tcu_l2t1_clk_stop;
   output 	 tcu_l2t2_clk_stop;
   output 	 tcu_l2t3_clk_stop;
   output 	 tcu_l2t4_clk_stop;
   output 	 tcu_l2t5_clk_stop;
   output 	 tcu_l2t6_clk_stop;
   output 	 tcu_l2t7_clk_stop;
   output 	 tcu_mcu0_clk_stop;
   output 	 tcu_mcu1_clk_stop;
   output 	 tcu_mcu2_clk_stop;
   output 	 tcu_mcu3_clk_stop;
   output 	 tcu_mcu0_dr_clk_stop; 
   output 	 tcu_mcu1_dr_clk_stop; 
   output 	 tcu_mcu2_dr_clk_stop;
   output 	 tcu_mcu3_dr_clk_stop; 
   output 	 tcu_mcu0_io_clk_stop; 
   output 	 tcu_mcu1_io_clk_stop; 
   output 	 tcu_mcu2_io_clk_stop;
   output 	 tcu_mcu3_io_clk_stop; 
   output        tcu_mcu0_fbd_clk_stop;
   output        tcu_mcu1_fbd_clk_stop;
   output        tcu_mcu2_fbd_clk_stop;
   output        tcu_mcu3_fbd_clk_stop;
   
   output 	 tcu_sii_clk_stop;
   output 	 tcu_sio_clk_stop;
   output 	 tcu_ncu_clk_stop;
 //output 	 tcu_rst_clk_stop;
   output 	 tcu_ccx_clk_stop;
   output 	 tcu_efu_clk_stop;
   
   output 	 tcu_sii_io_clk_stop;
   output 	 tcu_sio_io_clk_stop;
   output 	 tcu_ncu_io_clk_stop;
   output 	 tcu_efu_io_clk_stop;
 //output 	 tcu_rst_io_clk_stop;
   output        tcu_db0_clk_stop; // io clk domain
   output        tcu_db1_clk_stop; // io clk domain
   output        tcu_mio_clk_stop; // io clk domain
   
   output 	 tcu_rdp_io_clk_stop;
   output 	 tcu_mac_io_clk_stop;
   output 	 tcu_rtx_io_clk_stop;
   output 	 tcu_tds_io_clk_stop;
     
   output 	 tcu_dmu_io_clk_stop;
   
   output 	 tcu_peu_pc_clk_stop;
   
   output        tcu_peu_io_clk_stop;

   
   //********************************************************************
   // Scan reassigns
   //********************************************************************
   assign     l1en   = tcu_int_ce; // 1'b1; 
   assign     pce_ov = tcu_pce_ov; // 1'b1;
   assign     stop   = 1'b0;
   assign     se     = tcu_int_se;
   assign     siclk  = tcu_int_aclk;
   assign     soclk  = tcu_int_bclk;

   tcu_clkstp_ctl_l1clkhdr_ctl_macro clkstp_clkgen 
     ( .l2clk  (l2clk),
       .l1clk  (l1clk),
  .l1en(l1en),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se) );

   // ********************************************************************
   // Synchronizer Enable Pulses from cluster header
   // ********************************************************************
   tcu_clkstp_ctl_msff_ctl_macro__width_1 clkstp_cmpsync_reg 
   ( 
     .scan_in  (clkstp_cmpsync_reg_scanin),
     .scan_out (clkstp_cmpsync_reg_scanout),
     .l1clk    (l1clk),
     .din      (cmp_dr_sync_en      ), 
     .dout     (cmp_dr_sync_en_local),
  .siclk(siclk),
  .soclk(soclk)
     );

   assign        not_mt_mode = ~mt_mode_sync  |   instr_mt_scan_rti_sync;
   
   // ********************************************************************
   // Flop Clock Stop Signals before leaving TCU
   // ********************************************************************
   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_1 clkstp_spc0stop_reg 
   ( .scan_in  (clkstp_spc0stop_reg_scanin),
     .scan_out (clkstp_spc0stop_reg_scanout),
     .en       (not_mt_mode),
     .din      (pre_spc0_clk_stop_l),
     .dout     (tcu_spc0_clk_stop_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_1 clkstp_spc1stop_reg 
   ( .scan_in  (clkstp_spc1stop_reg_scanin),
     .scan_out (clkstp_spc1stop_reg_scanout),
     .en       (not_mt_mode),
     .din      (pre_spc1_clk_stop_l),
     .dout     (tcu_spc1_clk_stop_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_1 clkstp_spc2stop_reg 
   ( .scan_in  (clkstp_spc2stop_reg_scanin),
     .scan_out (clkstp_spc2stop_reg_scanout),
     .en       (not_mt_mode),
     .din      (pre_spc2_clk_stop_l),
     .dout     (tcu_spc2_clk_stop_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_1 clkstp_spc3stop_reg 
   ( .scan_in  (clkstp_spc3stop_reg_scanin),
     .scan_out (clkstp_spc3stop_reg_scanout),
     .en       (not_mt_mode),
     .din      (pre_spc3_clk_stop_l),
     .dout     (tcu_spc3_clk_stop_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_1 clkstp_spc4stop_reg 
   ( .scan_in  (clkstp_spc4stop_reg_scanin),
     .scan_out (clkstp_spc4stop_reg_scanout),
     .en       (not_mt_mode),
     .din      (pre_spc4_clk_stop_l),
     .dout     (tcu_spc4_clk_stop_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_1 clkstp_spc5stop_reg 
   ( .scan_in  (clkstp_spc5stop_reg_scanin),
     .scan_out (clkstp_spc5stop_reg_scanout),
     .en       (not_mt_mode),
     .din      (pre_spc5_clk_stop_l),
     .dout     (tcu_spc5_clk_stop_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_1 clkstp_spc6stop_reg 
   ( .scan_in  (clkstp_spc6stop_reg_scanin),
     .scan_out (clkstp_spc6stop_reg_scanout),
     .en       (not_mt_mode),
     .din      (pre_spc6_clk_stop_l),
     .dout     (tcu_spc6_clk_stop_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_1 clkstp_spc7stop_reg 
   ( .scan_in  (clkstp_spc7stop_reg_scanin),
     .scan_out (clkstp_spc7stop_reg_scanout),
     .en       (not_mt_mode),
     .din      (pre_spc7_clk_stop_l),
     .dout     (tcu_spc7_clk_stop_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));

   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_8 clkstp_bnkstop_reg 
   ( .scan_in  (clkstp_bnkstop_reg_scanin),
     .scan_out (clkstp_bnkstop_reg_scanout),
     .en       (not_mt_mode),
     .din      ({pre_bnk0_clk_stop_l,pre_bnk1_clk_stop_l,pre_bnk2_clk_stop_l,pre_bnk3_clk_stop_l,
                 pre_bnk4_clk_stop_l,pre_bnk5_clk_stop_l,pre_bnk6_clk_stop_l,pre_bnk7_clk_stop_l}),
     .dout     ({tcu_bnk0_clk_stop_l,tcu_bnk1_clk_stop_l,tcu_bnk2_clk_stop_l,tcu_bnk3_clk_stop_l,
                 tcu_bnk4_clk_stop_l,tcu_bnk5_clk_stop_l,tcu_bnk6_clk_stop_l,tcu_bnk7_clk_stop_l}),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_8 clkstp_l2tstop_reg 
   ( .scan_in  (clkstp_l2tstop_reg_scanin),
     .scan_out (clkstp_l2tstop_reg_scanout),
     .en       (not_mt_mode),
     .din      ({pre_l2t0_clk_stop_l,pre_l2t1_clk_stop_l,pre_l2t2_clk_stop_l,pre_l2t3_clk_stop_l,
                 pre_l2t4_clk_stop_l,pre_l2t5_clk_stop_l,pre_l2t6_clk_stop_l,pre_l2t7_clk_stop_l}),
     .dout     ({tcu_l2t0_clk_stop_l,tcu_l2t1_clk_stop_l,tcu_l2t2_clk_stop_l,tcu_l2t3_clk_stop_l,
                 tcu_l2t4_clk_stop_l,tcu_l2t5_clk_stop_l,tcu_l2t6_clk_stop_l,tcu_l2t7_clk_stop_l}),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));

   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_4 clkstp_mcustop_reg 
   ( .scan_in  (clkstp_mcustop_reg_scanin),
     .scan_out (clkstp_mcustop_reg_scanout),
     .en       (not_mt_mode),
     .din      ({pre_mcu0_clk_stop_l,pre_mcu1_clk_stop_l,pre_mcu2_clk_stop_l,pre_mcu3_clk_stop_l}),
     .dout     ({tcu_mcu0_clk_stop_l,tcu_mcu1_clk_stop_l,tcu_mcu2_clk_stop_l,tcu_mcu3_clk_stop_l}),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_4 clkstp_mcuiostop_reg 
   ( .scan_in  (clkstp_mcuiostop_reg_scanin),
     .scan_out (clkstp_mcuiostop_reg_scanout),
     .en       (not_mt_mode),
     .din      ({pre_mcu0_io_clk_stop_l,pre_mcu1_io_clk_stop_l,pre_mcu2_io_clk_stop_l,pre_mcu3_io_clk_stop_l}),
     .dout     ({tcu_mcu0_io_clk_stop_l,tcu_mcu1_io_clk_stop_l,tcu_mcu2_io_clk_stop_l,tcu_mcu3_io_clk_stop_l}),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_4 clkstp_mcudrstop_reg 
   ( .scan_in  (clkstp_mcudrstop_reg_scanin),
     .scan_out (clkstp_mcudrstop_reg_scanout),
     .en       (cmp_dr_sync_en_local),
     .din      ({pre_mcu0_dr_clk_stop_l,pre_mcu1_dr_clk_stop_l,pre_mcu2_dr_clk_stop_l,pre_mcu3_dr_clk_stop_l}),
     .dout     ({tcu_mcu0_dr_clk_stop_l,tcu_mcu1_dr_clk_stop_l,tcu_mcu2_dr_clk_stop_l,tcu_mcu3_dr_clk_stop_l}),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_4 clkstp_mcufbdstop_reg 
   ( .scan_in  (clkstp_mcufbdstop_reg_scanin),
     .scan_out (clkstp_mcufbdstop_reg_scanout),
     .en       (not_mt_mode),
     .din      ({pre_mcu0_fbd_clk_stop_l,pre_mcu1_fbd_clk_stop_l,pre_mcu2_fbd_clk_stop_l,pre_mcu3_fbd_clk_stop_l}),
     .dout     ({tcu_mcu0_fbd_clk_stop_l,tcu_mcu1_fbd_clk_stop_l,tcu_mcu2_fbd_clk_stop_l,tcu_mcu3_fbd_clk_stop_l}),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));

   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_1 clkstp_soc0stop_reg 
   ( .scan_in  (clkstp_soc0stop_reg_scanin),
     .scan_out (clkstp_soc0stop_reg_scanout),
     .en       (not_mt_mode),
     .din      (pre_soc0_clk_stop_l),
     .dout     (tcu_soc0_clk_stop_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_1 clkstp_soc0iostop_reg 
   ( .scan_in  (clkstp_soc0iostop_reg_scanin),
     .scan_out (clkstp_soc0iostop_reg_scanout),
     .en       (not_mt_mode),
     .din      (pre_soc0_io_clk_stop_l),
     .dout     (tcu_soc0_io_clk_stop_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));

   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_1 clkstp_soc1iostop_reg 
   ( .scan_in  (clkstp_soc1iostop_reg_scanin),
     .scan_out (clkstp_soc1iostop_reg_scanout),
     .en       (not_mt_mode),
     .din      (pre_soc1_io_clk_stop_l),
     .dout     (tcu_soc1_io_clk_stop_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_1 clkstp_soc2iostop_reg 
   ( .scan_in  (clkstp_soc2iostop_reg_scanin),
     .scan_out (clkstp_soc2iostop_reg_scanout),
     .en       (not_mt_mode),
     .din      (pre_soc2_io_clk_stop_l),
     .dout     (tcu_soc2_io_clk_stop_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));

   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_1 clkstp_soc3stop_reg 
   ( .scan_in  (clkstp_soc3stop_reg_scanin),
     .scan_out (clkstp_soc3stop_reg_scanout),
     .en       (not_mt_mode),
     .din      (pre_soc3_clk_stop_l),
     .dout     (tcu_soc3_clk_stop_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_clkstp_ctl_msff_ctl_macro__en_1__width_1 clkstp_soc3iostop_reg 
   ( .scan_in  (clkstp_soc3iostop_reg_scanin),
     .scan_out (clkstp_soc3iostop_reg_scanout),
     .en       (not_mt_mode),
     .din      (pre_soc3_io_clk_stop_l),
     .dout     (tcu_soc3_io_clk_stop_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));

   // Invert din and dout so flush to zero puts the flops to '1'
   assign   pre_spc0_clk_stop_l     = ~pre_spc0_clk_stop        |  turn_off_clk_stop;
   assign   pre_spc1_clk_stop_l     = ~pre_spc1_clk_stop        |  turn_off_clk_stop;
   assign   pre_spc2_clk_stop_l     = ~pre_spc2_clk_stop        |  turn_off_clk_stop;
   assign   pre_spc3_clk_stop_l     = ~pre_spc3_clk_stop        |  turn_off_clk_stop;
   assign   pre_spc4_clk_stop_l     = ~pre_spc4_clk_stop        |  turn_off_clk_stop;
   assign   pre_spc5_clk_stop_l     = ~pre_spc5_clk_stop        |  turn_off_clk_stop;
   assign   pre_spc6_clk_stop_l     = ~pre_spc6_clk_stop        |  turn_off_clk_stop;
   assign   pre_spc7_clk_stop_l     = ~pre_spc7_clk_stop        |  turn_off_clk_stop;
   assign   tcu_spc0_clk_stop       = ~tcu_spc0_clk_stop_l;
   assign   tcu_spc1_clk_stop       = ~tcu_spc1_clk_stop_l;
   assign   tcu_spc2_clk_stop       = ~tcu_spc2_clk_stop_l;
   assign   tcu_spc3_clk_stop       = ~tcu_spc3_clk_stop_l;
   assign   tcu_spc4_clk_stop       = ~tcu_spc4_clk_stop_l;
   assign   tcu_spc5_clk_stop       = ~tcu_spc5_clk_stop_l;
   assign   tcu_spc6_clk_stop       = ~tcu_spc6_clk_stop_l;
   assign   tcu_spc7_clk_stop       = ~tcu_spc7_clk_stop_l;

   assign   pre_bnk0_clk_stop_l     = ~pre_bnk0_clk_stop        |  turn_off_clk_stop;
   assign   pre_bnk1_clk_stop_l     = ~pre_bnk1_clk_stop        |  turn_off_clk_stop;
   assign   pre_bnk2_clk_stop_l     = ~pre_bnk2_clk_stop        |  turn_off_clk_stop;
   assign   pre_bnk3_clk_stop_l     = ~pre_bnk3_clk_stop        |  turn_off_clk_stop;
   assign   pre_bnk4_clk_stop_l     = ~pre_bnk4_clk_stop        |  turn_off_clk_stop;
   assign   pre_bnk5_clk_stop_l     = ~pre_bnk5_clk_stop        |  turn_off_clk_stop;
   assign   pre_bnk6_clk_stop_l     = ~pre_bnk6_clk_stop        |  turn_off_clk_stop;
   assign   pre_bnk7_clk_stop_l     = ~pre_bnk7_clk_stop        |  turn_off_clk_stop;
   assign   tcu_bnk0_clk_stop       = ~tcu_bnk0_clk_stop_l;
   assign   tcu_bnk1_clk_stop       = ~tcu_bnk1_clk_stop_l;
   assign   tcu_bnk2_clk_stop       = ~tcu_bnk2_clk_stop_l;
   assign   tcu_bnk3_clk_stop       = ~tcu_bnk3_clk_stop_l;
   assign   tcu_bnk4_clk_stop       = ~tcu_bnk4_clk_stop_l;
   assign   tcu_bnk5_clk_stop       = ~tcu_bnk5_clk_stop_l;
   assign   tcu_bnk6_clk_stop       = ~tcu_bnk6_clk_stop_l;
   assign   tcu_bnk7_clk_stop       = ~tcu_bnk7_clk_stop_l;
   assign   pre_l2t0_clk_stop_l     = ~pre_l2t0_clk_stop        |  turn_off_clk_stop;
   assign   pre_l2t1_clk_stop_l     = ~pre_l2t1_clk_stop        |  turn_off_clk_stop;
   assign   pre_l2t2_clk_stop_l     = ~pre_l2t2_clk_stop        |  turn_off_clk_stop;
   assign   pre_l2t3_clk_stop_l     = ~pre_l2t3_clk_stop        |  turn_off_clk_stop;
   assign   pre_l2t4_clk_stop_l     = ~pre_l2t4_clk_stop        |  turn_off_clk_stop;
   assign   pre_l2t5_clk_stop_l     = ~pre_l2t5_clk_stop        |  turn_off_clk_stop;
   assign   pre_l2t6_clk_stop_l     = ~pre_l2t6_clk_stop        |  turn_off_clk_stop;
   assign   pre_l2t7_clk_stop_l     = ~pre_l2t7_clk_stop        |  turn_off_clk_stop;
   assign   tcu_l2t0_clk_stop       = ~tcu_l2t0_clk_stop_l;
   assign   tcu_l2t1_clk_stop       = ~tcu_l2t1_clk_stop_l;
   assign   tcu_l2t2_clk_stop       = ~tcu_l2t2_clk_stop_l;
   assign   tcu_l2t3_clk_stop       = ~tcu_l2t3_clk_stop_l;
   assign   tcu_l2t4_clk_stop       = ~tcu_l2t4_clk_stop_l;
   assign   tcu_l2t5_clk_stop       = ~tcu_l2t5_clk_stop_l;
   assign   tcu_l2t6_clk_stop       = ~tcu_l2t6_clk_stop_l;
   assign   tcu_l2t7_clk_stop       = ~tcu_l2t7_clk_stop_l;

   assign   pre_mcu0_clk_stop_l     = ~pre_mcu0_clk_stop        |  turn_off_clk_stop;
   assign   pre_mcu0_io_clk_stop_l  = ~pre_mcu0_io_clk_stop     |  turn_off_clk_stop;
   assign   pre_mcu0_dr_clk_stop_l  = ~pre_mcu0_dr_clk_stop     |  turn_off_clk_stop;
   assign   pre_mcu0_fbd_clk_stop_l = ~pre_mcu0_fbd_clk_stop    |  turn_off_clk_stop;
   assign   tcu_mcu0_clk_stop       = ~tcu_mcu0_clk_stop_l;
   assign   tcu_mcu0_io_clk_stop    = ~tcu_mcu0_io_clk_stop_l;
   assign   tcu_mcu0_dr_clk_stop    = ~tcu_mcu0_dr_clk_stop_l;
   assign   tcu_mcu0_fbd_clk_stop   = ~tcu_mcu0_fbd_clk_stop_l;
   assign   pre_mcu1_clk_stop_l     = ~pre_mcu1_clk_stop        |  turn_off_clk_stop;
   assign   pre_mcu1_io_clk_stop_l  = ~pre_mcu1_io_clk_stop     |  turn_off_clk_stop;
   assign   pre_mcu1_dr_clk_stop_l  = ~pre_mcu1_dr_clk_stop     |  turn_off_clk_stop;
   assign   pre_mcu1_fbd_clk_stop_l = ~pre_mcu1_fbd_clk_stop    |  turn_off_clk_stop;
   assign   tcu_mcu1_clk_stop       = ~tcu_mcu1_clk_stop_l;
   assign   tcu_mcu1_io_clk_stop    = ~tcu_mcu1_io_clk_stop_l;
   assign   tcu_mcu1_dr_clk_stop    = ~tcu_mcu1_dr_clk_stop_l;
   assign   tcu_mcu1_fbd_clk_stop   = ~tcu_mcu1_fbd_clk_stop_l;
   assign   pre_mcu2_clk_stop_l     = ~pre_mcu2_clk_stop        |  turn_off_clk_stop;
   assign   pre_mcu2_io_clk_stop_l  = ~pre_mcu2_io_clk_stop     |  turn_off_clk_stop;
   assign   pre_mcu2_dr_clk_stop_l  = ~pre_mcu2_dr_clk_stop     |  turn_off_clk_stop;
   assign   pre_mcu2_fbd_clk_stop_l = ~pre_mcu2_fbd_clk_stop    |  turn_off_clk_stop;
   assign   tcu_mcu2_clk_stop       = ~tcu_mcu2_clk_stop_l;
   assign   tcu_mcu2_io_clk_stop    = ~tcu_mcu2_io_clk_stop_l;
   assign   tcu_mcu2_dr_clk_stop    = ~tcu_mcu2_dr_clk_stop_l;
   assign   tcu_mcu2_fbd_clk_stop   = ~tcu_mcu2_fbd_clk_stop_l;
   assign   pre_mcu3_clk_stop_l     = ~pre_mcu3_clk_stop        |  turn_off_clk_stop;
   assign   pre_mcu3_io_clk_stop_l  = ~pre_mcu3_io_clk_stop     |  turn_off_clk_stop;
   assign   pre_mcu3_dr_clk_stop_l  = ~pre_mcu3_dr_clk_stop     |  turn_off_clk_stop;
   assign   pre_mcu3_fbd_clk_stop_l = ~pre_mcu3_fbd_clk_stop    |  turn_off_clk_stop;
   assign   tcu_mcu3_clk_stop       = ~tcu_mcu3_clk_stop_l;
   assign   tcu_mcu3_io_clk_stop    = ~tcu_mcu3_io_clk_stop_l;
   assign   tcu_mcu3_dr_clk_stop    = ~tcu_mcu3_dr_clk_stop_l;
   assign   tcu_mcu3_fbd_clk_stop   = ~tcu_mcu3_fbd_clk_stop_l;

   assign   pre_soc0_clk_stop_l     = ~pre_soc0_clk_stop        |  turn_off_clk_stop;
   assign   pre_soc0_io_clk_stop_l  = ~pre_soc0_io_clk_stop     |  turn_off_clk_stop;
   assign   tcu_soc0_clk_stop       = ~tcu_soc0_clk_stop_l;
   assign   tcu_soc0_io_clk_stop    = ~tcu_soc0_io_clk_stop_l;
   assign   pre_soc1_io_clk_stop_l  = ~pre_soc1_io_clk_stop     |  turn_off_clk_stop;
   assign   tcu_soc1_io_clk_stop    = ~tcu_soc1_io_clk_stop_l;
   assign   pre_soc2_io_clk_stop_l  = ~pre_soc2_io_clk_stop     |  turn_off_clk_stop;
   assign   tcu_soc2_io_clk_stop    = ~tcu_soc2_io_clk_stop_l;
   assign   pre_soc3_clk_stop_l     = ~pre_soc3_clk_stop        |  turn_off_clk_stop;
   assign   pre_soc3_io_clk_stop_l  = ~pre_soc3_io_clk_stop     |  turn_off_clk_stop;
   assign   tcu_soc3_clk_stop       = ~tcu_soc3_clk_stop_l;
   assign   tcu_soc3_io_clk_stop    = ~tcu_soc3_io_clk_stop_l;


   // ********************************************************************
   // End of Flop Clock Stop Signals before leaving TCU
   // ********************************************************************


   // Assign clock stops to outputs
   assign        tcu_l2d0_clk_stop = tcu_bnk0_clk_stop;
   assign        tcu_l2d1_clk_stop = tcu_bnk1_clk_stop;
   assign        tcu_l2d2_clk_stop = tcu_bnk2_clk_stop;
   assign        tcu_l2d3_clk_stop = tcu_bnk3_clk_stop;
   assign        tcu_l2d4_clk_stop = tcu_bnk4_clk_stop;
   assign        tcu_l2d5_clk_stop = tcu_bnk5_clk_stop;
   assign        tcu_l2d6_clk_stop = tcu_bnk6_clk_stop;
   assign        tcu_l2d7_clk_stop = tcu_bnk7_clk_stop;
   assign        tcu_l2b0_clk_stop = tcu_bnk0_clk_stop;
   assign        tcu_l2b1_clk_stop = tcu_bnk1_clk_stop;
   assign        tcu_l2b2_clk_stop = tcu_bnk2_clk_stop;
   assign        tcu_l2b3_clk_stop = tcu_bnk3_clk_stop;
   assign        tcu_l2b4_clk_stop = tcu_bnk4_clk_stop;
   assign        tcu_l2b5_clk_stop = tcu_bnk5_clk_stop;
   assign        tcu_l2b6_clk_stop = tcu_bnk6_clk_stop;
   assign        tcu_l2b7_clk_stop = tcu_bnk7_clk_stop;

   assign        tcu_ccx_clk_stop    = tcu_soc0_clk_stop;
   assign        tcu_efu_clk_stop    = tcu_soc0_clk_stop;
   assign        tcu_sii_clk_stop    = tcu_soc0_clk_stop;
   assign        tcu_sio_clk_stop    = tcu_soc0_clk_stop;
   assign        tcu_ncu_clk_stop    = tcu_soc0_clk_stop;

   assign        tcu_sii_io_clk_stop = tcu_soc0_io_clk_stop;
   assign        tcu_sio_io_clk_stop = tcu_soc0_io_clk_stop;
   assign        tcu_ncu_io_clk_stop = tcu_soc0_io_clk_stop;
   assign        tcu_efu_io_clk_stop = tcu_soc0_io_clk_stop;
   assign        tcu_db0_clk_stop    = tcu_soc0_io_clk_stop;
   assign        tcu_db1_clk_stop    = tcu_soc0_io_clk_stop;
   assign        tcu_mio_clk_stop    = tcu_soc0_io_clk_stop;

   assign        tcu_rdp_io_clk_stop = tcu_soc1_io_clk_stop;
   assign        tcu_mac_io_clk_stop = tcu_soc1_io_clk_stop;
   assign        tcu_rtx_io_clk_stop = tcu_soc1_io_clk_stop;
   assign        tcu_tds_io_clk_stop = tcu_soc1_io_clk_stop;

   assign        tcu_dmu_io_clk_stop = tcu_soc2_io_clk_stop;

   assign        tcu_peu_pc_clk_stop = tcu_soc3_clk_stop;
   assign        tcu_peu_io_clk_stop = tcu_soc3_io_clk_stop;

   // this is synchronizer for JTAG Macrotest instruction
   cl_sc1_clksyncff_4x sync_ff_instr_mt_scan
     (.si (sync_ff_instr_mt_scan_scanin),
      .so (sync_ff_instr_mt_scan_scanout),
      .l1clk (l1clk),
      .d     (instr_mt_scan_rti),
      .q     (instr_mt_scan_rti_sync),
  .siclk(siclk),
  .soclk(soclk) 
      );

   // load '1' to turn off clock stop, when enter jtag macrotest
   assign        turn_off_clk_stop   = instr_mt_scan_rti_sync;


// fixscan start:
assign clkstp_cmpsync_reg_scanin = scan_in                  ;
assign clkstp_spc0stop_reg_scanin = clkstp_cmpsync_reg_scanout;
assign clkstp_spc1stop_reg_scanin = clkstp_spc0stop_reg_scanout;
assign clkstp_spc2stop_reg_scanin = clkstp_spc1stop_reg_scanout;
assign clkstp_spc3stop_reg_scanin = clkstp_spc2stop_reg_scanout;
assign clkstp_spc4stop_reg_scanin = clkstp_spc3stop_reg_scanout;
assign clkstp_spc5stop_reg_scanin = clkstp_spc4stop_reg_scanout;
assign clkstp_spc6stop_reg_scanin = clkstp_spc5stop_reg_scanout;
assign clkstp_spc7stop_reg_scanin = clkstp_spc6stop_reg_scanout;
assign clkstp_bnkstop_reg_scanin = clkstp_spc7stop_reg_scanout;
assign clkstp_l2tstop_reg_scanin = clkstp_bnkstop_reg_scanout;
assign clkstp_mcustop_reg_scanin = clkstp_l2tstop_reg_scanout;
assign clkstp_mcuiostop_reg_scanin = clkstp_mcustop_reg_scanout;
assign clkstp_mcudrstop_reg_scanin = clkstp_mcuiostop_reg_scanout;
assign clkstp_mcufbdstop_reg_scanin = clkstp_mcudrstop_reg_scanout;
assign clkstp_soc0stop_reg_scanin = clkstp_mcufbdstop_reg_scanout;
assign clkstp_soc0iostop_reg_scanin = clkstp_soc0stop_reg_scanout;
assign clkstp_soc1iostop_reg_scanin = clkstp_soc0iostop_reg_scanout;
assign clkstp_soc2iostop_reg_scanin = clkstp_soc1iostop_reg_scanout;
assign clkstp_soc3stop_reg_scanin = clkstp_soc2iostop_reg_scanout;
assign clkstp_soc3iostop_reg_scanin = clkstp_soc3stop_reg_scanout;
assign sync_ff_instr_mt_scan_scanin = clkstp_soc3iostop_reg_scanout;
assign scan_out                  = sync_ff_instr_mt_scan_scanout;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module tcu_clkstp_ctl_l1clkhdr_ctl_macro (
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

module tcu_clkstp_ctl_msff_ctl_macro__width_1 (
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

module tcu_clkstp_ctl_msff_ctl_macro__en_1__width_1 (
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

module tcu_clkstp_ctl_msff_ctl_macro__en_1__width_8 (
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

module tcu_clkstp_ctl_msff_ctl_macro__en_1__width_4 (
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








