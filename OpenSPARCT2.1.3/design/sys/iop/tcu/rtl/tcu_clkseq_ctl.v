// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tcu_clkseq_ctl.v
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
module tcu_clkseq_ctl (
  tcu_int_se, 
  tcu_int_aclk, 
  tcu_int_bclk, 
  tcu_int_ce, 
  tcu_pce_ov, 
  l2clk, 
  clock_stop_active, 
  debug_reg_hard_stop_domain_1st, 
  hard_stop_via_reg_din, 
  test_mode_gated, 
  io_ac_test_mode, 
  stop_req, 
  cntstart_equal_max, 
  cntstop_equal_max, 
  cntstart, 
  cntstop, 
  scan_in, 
  scan_out, 
  spc0_clk_stop_loop, 
  spc1_clk_stop_loop, 
  spc2_clk_stop_loop, 
  spc3_clk_stop_loop, 
  spc4_clk_stop_loop, 
  spc5_clk_stop_loop, 
  spc6_clk_stop_loop, 
  spc7_clk_stop_loop, 
  bnk0_clk_stop_loop, 
  bnk1_clk_stop_loop, 
  bnk2_clk_stop_loop, 
  bnk3_clk_stop_loop, 
  bnk4_clk_stop_loop, 
  bnk5_clk_stop_loop, 
  bnk6_clk_stop_loop, 
  bnk7_clk_stop_loop, 
  mcu0_clk_stop_loop, 
  mcu1_clk_stop_loop, 
  mcu2_clk_stop_loop, 
  mcu3_clk_stop_loop, 
  soc0_clk_stop_loop, 
  soc1_clk_stop_loop, 
  soc2_clk_stop_loop, 
  soc3_clk_stop_loop, 
  clk_stop_loops_all_on, 
  clk_stop_loops_all_off);
wire l1en;
wire pce_ov;
wire stop;
wire se;
wire siclk;
wire soclk;
wire l1clk;
wire start_with_spc0;
wire start_with_spc1;
wire start_with_spc2;
wire start_with_spc3;
wire start_with_spc4;
wire start_with_spc5;
wire start_with_spc6;
wire start_with_spc7;
wire start_with_bnk0;
wire start_with_bnk1;
wire start_with_bnk2;
wire start_with_bnk3;
wire start_with_bnk4;
wire start_with_bnk5;
wire start_with_bnk6;
wire start_with_bnk7;
wire start_with_mcu0;
wire start_with_mcu1;
wire start_with_mcu2;
wire start_with_mcu3;
wire start_with_soc0;
wire start_with_soc1;
wire start_with_soc2;
wire start_with_soc3;
wire stop_spc0;
wire stop_spc1;
wire stop_spc2;
wire stop_spc3;
wire stop_spc4;
wire stop_spc5;
wire stop_spc6;
wire stop_spc7;
wire stop_bnk0;
wire stop_bnk1;
wire stop_bnk2;
wire stop_bnk3;
wire stop_bnk4;
wire stop_bnk5;
wire stop_bnk6;
wire stop_bnk7;
wire stop_mcu0;
wire stop_mcu1;
wire stop_mcu2;
wire stop_mcu3;
wire stop_soc0;
wire stop_soc1;
wire stop_soc2;
wire stop_soc3;
wire stop_spc0_trigger;
wire stopspc0_din;
wire stopspc0_dout;
wire clkseq_stopspc0_reg_scanin;
wire clkseq_stopspc0_reg_scanout;
wire stopspc0_din_l;
wire stopspc0_dout_l;
wire start_spc0_trigger;
wire startspc0_din;
wire startspc0_dout;
wire clkseq_startspc0_reg_scanin;
wire clkseq_startspc0_reg_scanout;
wire startspc0_din_l;
wire startspc0_dout_l;
wire stop_spc0_delayed;
wire stop_spc1_trigger;
wire stopspc1_din;
wire stopspc1_dout;
wire clkseq_stopspc1_reg_scanin;
wire clkseq_stopspc1_reg_scanout;
wire stopspc1_din_l;
wire stopspc1_dout_l;
wire start_spc1_trigger;
wire startspc1_din;
wire startspc1_dout;
wire clkseq_startspc1_reg_scanin;
wire clkseq_startspc1_reg_scanout;
wire startspc1_din_l;
wire startspc1_dout_l;
wire stop_spc1_delayed;
wire stop_spc2_trigger;
wire stopspc2_din;
wire stopspc2_dout;
wire clkseq_stopspc2_reg_scanin;
wire clkseq_stopspc2_reg_scanout;
wire stopspc2_din_l;
wire stopspc2_dout_l;
wire start_spc2_trigger;
wire startspc2_din;
wire startspc2_dout;
wire clkseq_startspc2_reg_scanin;
wire clkseq_startspc2_reg_scanout;
wire startspc2_din_l;
wire startspc2_dout_l;
wire stop_spc2_delayed;
wire stop_spc3_trigger;
wire stopspc3_din;
wire stopspc3_dout;
wire clkseq_stopspc3_reg_scanin;
wire clkseq_stopspc3_reg_scanout;
wire stopspc3_din_l;
wire stopspc3_dout_l;
wire start_spc3_trigger;
wire startspc3_din;
wire startspc3_dout;
wire clkseq_startspc3_reg_scanin;
wire clkseq_startspc3_reg_scanout;
wire startspc3_din_l;
wire startspc3_dout_l;
wire stop_spc3_delayed;
wire stop_spc4_trigger;
wire stopspc4_din;
wire stopspc4_dout;
wire clkseq_stopspc4_reg_scanin;
wire clkseq_stopspc4_reg_scanout;
wire stopspc4_din_l;
wire stopspc4_dout_l;
wire start_spc4_trigger;
wire startspc4_din;
wire startspc4_dout;
wire clkseq_startspc4_reg_scanin;
wire clkseq_startspc4_reg_scanout;
wire startspc4_din_l;
wire startspc4_dout_l;
wire stop_spc4_delayed;
wire stop_spc5_trigger;
wire stopspc5_din;
wire stopspc5_dout;
wire clkseq_stopspc5_reg_scanin;
wire clkseq_stopspc5_reg_scanout;
wire stopspc5_din_l;
wire stopspc5_dout_l;
wire start_spc5_trigger;
wire startspc5_din;
wire startspc5_dout;
wire clkseq_startspc5_reg_scanin;
wire clkseq_startspc5_reg_scanout;
wire startspc5_din_l;
wire startspc5_dout_l;
wire stop_spc5_delayed;
wire stop_spc6_trigger;
wire stopspc6_din;
wire stopspc6_dout;
wire clkseq_stopspc6_reg_scanin;
wire clkseq_stopspc6_reg_scanout;
wire stopspc6_din_l;
wire stopspc6_dout_l;
wire start_spc6_trigger;
wire startspc6_din;
wire startspc6_dout;
wire clkseq_startspc6_reg_scanin;
wire clkseq_startspc6_reg_scanout;
wire startspc6_din_l;
wire startspc6_dout_l;
wire stop_spc6_delayed;
wire stop_spc7_trigger;
wire stopspc7_din;
wire stopspc7_dout;
wire clkseq_stopspc7_reg_scanin;
wire clkseq_stopspc7_reg_scanout;
wire stopspc7_din_l;
wire stopspc7_dout_l;
wire start_spc7_trigger;
wire startspc7_din;
wire startspc7_dout;
wire clkseq_startspc7_reg_scanin;
wire clkseq_startspc7_reg_scanout;
wire startspc7_din_l;
wire startspc7_dout_l;
wire stop_spc7_delayed;
wire stop_bnk0_trigger;
wire stopbnk0_din;
wire stopbnk0_dout;
wire clkseq_stopbnk0_reg_scanin;
wire clkseq_stopbnk0_reg_scanout;
wire stopbnk0_din_l;
wire stopbnk0_dout_l;
wire start_bnk0_trigger;
wire startbnk0_din;
wire startbnk0_dout;
wire clkseq_startbnk0_reg_scanin;
wire clkseq_startbnk0_reg_scanout;
wire startbnk0_din_l;
wire startbnk0_dout_l;
wire stop_bnk0_delayed;
wire stop_bnk1_trigger;
wire stopbnk1_din;
wire stopbnk1_dout;
wire clkseq_stopbnk1_reg_scanin;
wire clkseq_stopbnk1_reg_scanout;
wire stopbnk1_din_l;
wire stopbnk1_dout_l;
wire start_bnk1_trigger;
wire startbnk1_din;
wire startbnk1_dout;
wire clkseq_startbnk1_reg_scanin;
wire clkseq_startbnk1_reg_scanout;
wire startbnk1_din_l;
wire startbnk1_dout_l;
wire stop_bnk1_delayed;
wire stop_bnk2_trigger;
wire stopbnk2_din;
wire stopbnk2_dout;
wire clkseq_stopbnk2_reg_scanin;
wire clkseq_stopbnk2_reg_scanout;
wire stopbnk2_din_l;
wire stopbnk2_dout_l;
wire start_bnk2_trigger;
wire startbnk2_din;
wire startbnk2_dout;
wire clkseq_startbnk2_reg_scanin;
wire clkseq_startbnk2_reg_scanout;
wire startbnk2_din_l;
wire startbnk2_dout_l;
wire stop_bnk2_delayed;
wire stop_bnk3_trigger;
wire stopbnk3_din;
wire stopbnk3_dout;
wire clkseq_stopbnk3_reg_scanin;
wire clkseq_stopbnk3_reg_scanout;
wire stopbnk3_din_l;
wire stopbnk3_dout_l;
wire start_bnk3_trigger;
wire startbnk3_din;
wire startbnk3_dout;
wire clkseq_startbnk3_reg_scanin;
wire clkseq_startbnk3_reg_scanout;
wire startbnk3_din_l;
wire startbnk3_dout_l;
wire stop_bnk3_delayed;
wire stop_bnk4_trigger;
wire stopbnk4_din;
wire stopbnk4_dout;
wire clkseq_stopbnk4_reg_scanin;
wire clkseq_stopbnk4_reg_scanout;
wire stopbnk4_din_l;
wire stopbnk4_dout_l;
wire start_bnk4_trigger;
wire startbnk4_din;
wire startbnk4_dout;
wire clkseq_startbnk4_reg_scanin;
wire clkseq_startbnk4_reg_scanout;
wire startbnk4_din_l;
wire startbnk4_dout_l;
wire stop_bnk4_delayed;
wire stop_bnk5_trigger;
wire stopbnk5_din;
wire stopbnk5_dout;
wire clkseq_stopbnk5_reg_scanin;
wire clkseq_stopbnk5_reg_scanout;
wire stopbnk5_din_l;
wire stopbnk5_dout_l;
wire start_bnk5_trigger;
wire startbnk5_din;
wire startbnk5_dout;
wire clkseq_startbnk5_reg_scanin;
wire clkseq_startbnk5_reg_scanout;
wire startbnk5_din_l;
wire startbnk5_dout_l;
wire stop_bnk5_delayed;
wire stop_bnk6_trigger;
wire stopbnk6_din;
wire stopbnk6_dout;
wire clkseq_stopbnk6_reg_scanin;
wire clkseq_stopbnk6_reg_scanout;
wire stopbnk6_din_l;
wire stopbnk6_dout_l;
wire start_bnk6_trigger;
wire startbnk6_din;
wire startbnk6_dout;
wire clkseq_startbnk6_reg_scanin;
wire clkseq_startbnk6_reg_scanout;
wire startbnk6_din_l;
wire startbnk6_dout_l;
wire stop_bnk6_delayed;
wire stop_bnk7_trigger;
wire stopbnk7_din;
wire stopbnk7_dout;
wire clkseq_stopbnk7_reg_scanin;
wire clkseq_stopbnk7_reg_scanout;
wire stopbnk7_din_l;
wire stopbnk7_dout_l;
wire start_bnk7_trigger;
wire startbnk7_din;
wire startbnk7_dout;
wire clkseq_startbnk7_reg_scanin;
wire clkseq_startbnk7_reg_scanout;
wire startbnk7_din_l;
wire startbnk7_dout_l;
wire stop_bnk7_delayed;
wire stop_mcu0_trigger;
wire stopmcu0_din;
wire stopmcu0_dout;
wire clkseq_stopmcu0_reg_scanin;
wire clkseq_stopmcu0_reg_scanout;
wire stopmcu0_din_l;
wire stopmcu0_dout_l;
wire start_mcu0_trigger;
wire startmcu0_din;
wire startmcu0_dout;
wire clkseq_startmcu0_reg_scanin;
wire clkseq_startmcu0_reg_scanout;
wire startmcu0_din_l;
wire startmcu0_dout_l;
wire stop_mcu0_delayed;
wire stop_mcu1_trigger;
wire stopmcu1_din;
wire stopmcu1_dout;
wire clkseq_stopmcu1_reg_scanin;
wire clkseq_stopmcu1_reg_scanout;
wire stopmcu1_din_l;
wire stopmcu1_dout_l;
wire start_mcu1_trigger;
wire startmcu1_din;
wire startmcu1_dout;
wire clkseq_startmcu1_reg_scanin;
wire clkseq_startmcu1_reg_scanout;
wire startmcu1_din_l;
wire startmcu1_dout_l;
wire stop_mcu1_delayed;
wire stop_mcu2_trigger;
wire stopmcu2_din;
wire stopmcu2_dout;
wire clkseq_stopmcu2_reg_scanin;
wire clkseq_stopmcu2_reg_scanout;
wire stopmcu2_din_l;
wire stopmcu2_dout_l;
wire start_mcu2_trigger;
wire startmcu2_din;
wire startmcu2_dout;
wire clkseq_startmcu2_reg_scanin;
wire clkseq_startmcu2_reg_scanout;
wire startmcu2_din_l;
wire startmcu2_dout_l;
wire stop_mcu2_delayed;
wire stop_mcu3_trigger;
wire stopmcu3_din;
wire stopmcu3_dout;
wire clkseq_stopmcu3_reg_scanin;
wire clkseq_stopmcu3_reg_scanout;
wire stopmcu3_din_l;
wire stopmcu3_dout_l;
wire start_mcu3_trigger;
wire startmcu3_din;
wire startmcu3_dout;
wire clkseq_startmcu3_reg_scanin;
wire clkseq_startmcu3_reg_scanout;
wire startmcu3_din_l;
wire startmcu3_dout_l;
wire stop_mcu3_delayed;
wire stop_soc0_trigger;
wire stopsoc0_din;
wire stopsoc0_dout;
wire clkseq_stopsoc0_reg_scanin;
wire clkseq_stopsoc0_reg_scanout;
wire stopsoc0_din_l;
wire stopsoc0_dout_l;
wire start_soc0_trigger;
wire startsoc0_din;
wire startsoc0_dout;
wire clkseq_startsoc0_reg_scanin;
wire clkseq_startsoc0_reg_scanout;
wire startsoc0_din_l;
wire startsoc0_dout_l;
wire stop_soc0_delayed;
wire stop_soc1_trigger;
wire stopsoc1_din;
wire stopsoc1_dout;
wire clkseq_stopsoc1_reg_scanin;
wire clkseq_stopsoc1_reg_scanout;
wire stopsoc1_din_l;
wire stopsoc1_dout_l;
wire start_soc1_trigger;
wire startsoc1_din;
wire startsoc1_dout;
wire clkseq_startsoc1_reg_scanin;
wire clkseq_startsoc1_reg_scanout;
wire startsoc1_din_l;
wire startsoc1_dout_l;
wire stop_soc1_delayed;
wire stop_soc2_trigger;
wire stopsoc2_din;
wire stopsoc2_dout;
wire clkseq_stopsoc2_reg_scanin;
wire clkseq_stopsoc2_reg_scanout;
wire stopsoc2_din_l;
wire stopsoc2_dout_l;
wire start_soc2_trigger;
wire startsoc2_din;
wire startsoc2_dout;
wire clkseq_startsoc2_reg_scanin;
wire clkseq_startsoc2_reg_scanout;
wire startsoc2_din_l;
wire startsoc2_dout_l;
wire stop_soc2_delayed;
wire stop_soc3_trigger;
wire stopsoc3_din;
wire stopsoc3_dout;
wire clkseq_stopsoc3_reg_scanin;
wire clkseq_stopsoc3_reg_scanout;
wire stopsoc3_din_l;
wire stopsoc3_dout_l;
wire start_soc3_trigger;
wire startsoc3_din;
wire startsoc3_dout;
wire clkseq_startsoc3_reg_scanin;
wire clkseq_startsoc3_reg_scanout;
wire startsoc3_din_l;
wire startsoc3_dout_l;
wire stop_soc3_delayed;
wire io_test_mode;
wire spc0_clk_stop;
wire spc1_clk_stop;
wire spc2_clk_stop;
wire spc3_clk_stop;
wire spc4_clk_stop;
wire spc5_clk_stop;
wire spc6_clk_stop;
wire spc7_clk_stop;
wire bnk0_clk_stop;
wire bnk1_clk_stop;
wire bnk2_clk_stop;
wire bnk3_clk_stop;
wire bnk4_clk_stop;
wire bnk5_clk_stop;
wire bnk6_clk_stop;
wire bnk7_clk_stop;
wire mcu0_clk_stop;
wire mcu1_clk_stop;
wire mcu2_clk_stop;
wire mcu3_clk_stop;
wire soc0_clk_stop;
wire soc1_clk_stop;
wire soc2_clk_stop;
wire soc3_clk_stop;

    
   //inputs
   input         tcu_int_se;
   input         tcu_int_aclk;
   input 	 tcu_int_bclk;
   input         tcu_int_ce;
   input         tcu_pce_ov;
   input 	 l2clk;
   input 	 clock_stop_active;
   input [23:0]  debug_reg_hard_stop_domain_1st;
   input 	 hard_stop_via_reg_din; 	 
   input 	 test_mode_gated;
   input 	 io_ac_test_mode;
   input 	 stop_req;
   input 	 cntstart_equal_max;
   input 	 cntstop_equal_max;
   input 	 cntstart;
   input 	 cntstop;
   
   //scan
   input 	 scan_in;
   output 	 scan_out;

   //outputs
   output        spc0_clk_stop_loop;
   output        spc1_clk_stop_loop;
   output        spc2_clk_stop_loop;
   output        spc3_clk_stop_loop;
   output        spc4_clk_stop_loop;
   output        spc5_clk_stop_loop;
   output        spc6_clk_stop_loop;
   output        spc7_clk_stop_loop;
   output 	 bnk0_clk_stop_loop;
   output 	 bnk1_clk_stop_loop;
   output 	 bnk2_clk_stop_loop;
   output 	 bnk3_clk_stop_loop;
   output 	 bnk4_clk_stop_loop;
   output 	 bnk5_clk_stop_loop;
   output 	 bnk6_clk_stop_loop;
   output 	 bnk7_clk_stop_loop;
   output 	 mcu0_clk_stop_loop;
   output 	 mcu1_clk_stop_loop;
   output 	 mcu2_clk_stop_loop;
   output 	 mcu3_clk_stop_loop;
   output 	 soc0_clk_stop_loop;
   output 	 soc1_clk_stop_loop;
   output 	 soc2_clk_stop_loop;
   output 	 soc3_clk_stop_loop;
   
   output 	 clk_stop_loops_all_on ;
   output 	 clk_stop_loops_all_off;
   
   // Scan reassigns
   assign 	 l1en   = tcu_int_ce; //1'b1; 
   assign 	 pce_ov = tcu_pce_ov; //1'b1; 
   assign 	 stop   = 1'b0;
   assign 	 se     = tcu_int_se;
   assign 	 siclk  = tcu_int_aclk;
   assign 	 soclk  = tcu_int_bclk; 

   //create clock headers
   tcu_clkseq_ctl_l1clkhdr_ctl_macro clkseq_clkgen 
     (
      .l2clk  (l2clk   ),
      .l1clk  (l1clk   ),
  .l1en(l1en),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
      );
   

   //********************************************************************
   // Clock Stop Sequencer
   //********************************************************************

   // We want to be able to specify the starting point for stopping the clocks
   assign   start_with_spc0 = hard_stop_via_reg_din ? debug_reg_hard_stop_domain_1st[0]:1'b1;
   assign   start_with_spc1 = debug_reg_hard_stop_domain_1st[1];
   assign   start_with_spc2 = debug_reg_hard_stop_domain_1st[2];
   assign   start_with_spc3 = debug_reg_hard_stop_domain_1st[3];
   assign   start_with_spc4 = debug_reg_hard_stop_domain_1st[4];
   assign   start_with_spc5 = debug_reg_hard_stop_domain_1st[5];
   assign   start_with_spc6 = debug_reg_hard_stop_domain_1st[6];
   assign   start_with_spc7 = debug_reg_hard_stop_domain_1st[7];
   assign   start_with_bnk0 = debug_reg_hard_stop_domain_1st[8];
   assign   start_with_bnk1 = debug_reg_hard_stop_domain_1st[9];
   assign   start_with_bnk2 = debug_reg_hard_stop_domain_1st[10];
   assign   start_with_bnk3 = debug_reg_hard_stop_domain_1st[11];
   assign   start_with_bnk4 = debug_reg_hard_stop_domain_1st[12];
   assign   start_with_bnk5 = debug_reg_hard_stop_domain_1st[13];
   assign   start_with_bnk6 = debug_reg_hard_stop_domain_1st[14];
   assign   start_with_bnk7 = debug_reg_hard_stop_domain_1st[15];
   assign   start_with_mcu0 = debug_reg_hard_stop_domain_1st[16];
   assign   start_with_mcu1 = debug_reg_hard_stop_domain_1st[17];
   assign   start_with_mcu2 = debug_reg_hard_stop_domain_1st[18];
   assign   start_with_mcu3 = debug_reg_hard_stop_domain_1st[19];
   assign   start_with_soc0 = debug_reg_hard_stop_domain_1st[20];
   assign   start_with_soc1 = debug_reg_hard_stop_domain_1st[21];
   assign   start_with_soc2 = debug_reg_hard_stop_domain_1st[22];
   assign   start_with_soc3 = debug_reg_hard_stop_domain_1st[23];
   
   assign   stop_spc0 = start_with_spc0 ? stop_req : soc3_clk_stop_loop; 
   assign   stop_spc1 = start_with_spc1 ? stop_req : spc0_clk_stop_loop;
   assign   stop_spc2 = start_with_spc2 ? stop_req : spc1_clk_stop_loop;
   assign   stop_spc3 = start_with_spc3 ? stop_req : spc2_clk_stop_loop; 
   assign   stop_spc4 = start_with_spc4 ? stop_req : spc3_clk_stop_loop; 
   assign   stop_spc5 = start_with_spc5 ? stop_req : spc4_clk_stop_loop; 
   assign   stop_spc6 = start_with_spc6 ? stop_req : spc5_clk_stop_loop; 
   assign   stop_spc7 = start_with_spc7 ? stop_req : spc6_clk_stop_loop; 
   assign   stop_bnk0 = start_with_bnk0 ? stop_req : spc7_clk_stop_loop; 
   assign   stop_bnk1 = start_with_bnk1 ? stop_req : bnk0_clk_stop_loop; 
   assign   stop_bnk2 = start_with_bnk2 ? stop_req : bnk1_clk_stop_loop; 
   assign   stop_bnk3 = start_with_bnk3 ? stop_req : bnk2_clk_stop_loop; 
   assign   stop_bnk4 = start_with_bnk4 ? stop_req : bnk3_clk_stop_loop; 
   assign   stop_bnk5 = start_with_bnk5 ? stop_req : bnk4_clk_stop_loop; 
   assign   stop_bnk6 = start_with_bnk6 ? stop_req : bnk5_clk_stop_loop; 
   assign   stop_bnk7 = start_with_bnk7 ? stop_req : bnk6_clk_stop_loop; 
   assign   stop_mcu0 = start_with_mcu0 ? stop_req : bnk7_clk_stop_loop; 
   assign   stop_mcu1 = start_with_mcu1 ? stop_req : mcu0_clk_stop_loop; 
   assign   stop_mcu2 = start_with_mcu2 ? stop_req : mcu1_clk_stop_loop; 
   assign   stop_mcu3 = start_with_mcu3 ? stop_req : mcu2_clk_stop_loop; 
   assign   stop_soc0 = start_with_soc0 ? stop_req : mcu3_clk_stop_loop; 
   assign   stop_soc1 = start_with_soc1 ? stop_req : soc0_clk_stop_loop; 
   assign   stop_soc2 = start_with_soc2 ? stop_req : soc1_clk_stop_loop; 
   assign   stop_soc3 = start_with_soc3 ? stop_req : soc2_clk_stop_loop; 

   
   //********************************************************************
   // SPC0 - Turn CLOCK STOP ON
   assign   stop_spc0_trigger = stop_spc0 & cntstop_equal_max;
   assign   stopspc0_din      = stop_req & (stop_spc0_trigger | stopspc0_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopspc0_reg 
   ( 
     .scan_in(clkseq_stopspc0_reg_scanin),
     .scan_out(clkseq_stopspc0_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopspc0_din_l), 
     .dout     (stopspc0_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // SPC0 - Turn CLOCK STOP OFF
   assign   start_spc0_trigger = ~stop_spc0 & cntstart_equal_max;
   assign   startspc0_din      = ~stop_req & (start_spc0_trigger | startspc0_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startspc0_reg 
   ( 
     .scan_in(clkseq_startspc0_reg_scanin),
     .scan_out(clkseq_startspc0_reg_scanout),
     .l1clk    (l1clk),
     .din      (startspc0_din_l),
     .dout     (startspc0_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_spc0_delayed = (cntstop & stopspc0_dout) | (cntstart & ~startspc0_dout);

   //********************************************************************
   // SPC1 - Turn CLOCK STOP ON
   assign   stop_spc1_trigger = stop_spc1 & cntstop_equal_max;
   assign   stopspc1_din      = stop_req & (stop_spc1_trigger | stopspc1_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopspc1_reg 
   ( 
     .scan_in(clkseq_stopspc1_reg_scanin),
     .scan_out(clkseq_stopspc1_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopspc1_din_l),
     .dout     (stopspc1_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // SPC1 - Turn CLOCK STOP OFF
   assign   start_spc1_trigger = ~stop_spc1 & cntstart_equal_max;
   assign   startspc1_din      = ~stop_req & (start_spc1_trigger | startspc1_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startspc1_reg 
   ( 
     .scan_in(clkseq_startspc1_reg_scanin),
     .scan_out(clkseq_startspc1_reg_scanout),
     .l1clk    (l1clk),
     .din      (startspc1_din_l),
     .dout     (startspc1_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_spc1_delayed = (cntstop & stopspc1_dout) | (cntstart & ~startspc1_dout);

   //********************************************************************
   // SPC2 - Turn CLOCK STOP ON
   assign   stop_spc2_trigger = stop_spc2 & cntstop_equal_max;
   assign   stopspc2_din      = stop_req & (stop_spc2_trigger | stopspc2_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopspc2_reg 
   ( 
     .scan_in(clkseq_stopspc2_reg_scanin),
     .scan_out(clkseq_stopspc2_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopspc2_din_l),
     .dout     (stopspc2_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // SPC2 - Turn CLOCK STOP OFF
   assign   start_spc2_trigger = ~stop_spc2 & cntstart_equal_max;
   assign   startspc2_din      = ~stop_req & (start_spc2_trigger | startspc2_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startspc2_reg 
   ( 
     .scan_in(clkseq_startspc2_reg_scanin),
     .scan_out(clkseq_startspc2_reg_scanout),
     .l1clk    (l1clk),
     .din      (startspc2_din_l),
     .dout     (startspc2_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_spc2_delayed = (cntstop & stopspc2_dout) | (cntstart & ~startspc2_dout);

   //********************************************************************
   // SPC3 - Turn CLOCK STOP ON
   assign   stop_spc3_trigger = stop_spc3 & cntstop_equal_max;
   assign   stopspc3_din      = stop_req & (stop_spc3_trigger | stopspc3_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopspc3_reg 
   ( 
     .scan_in(clkseq_stopspc3_reg_scanin),
     .scan_out(clkseq_stopspc3_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopspc3_din_l),
     .dout     (stopspc3_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // SPC3 - Turn CLOCK STOP OFF
   assign   start_spc3_trigger = ~stop_spc3 & cntstart_equal_max;
   assign   startspc3_din      = ~stop_req & (start_spc3_trigger | startspc3_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startspc3_reg 
   ( 
     .scan_in(clkseq_startspc3_reg_scanin),
     .scan_out(clkseq_startspc3_reg_scanout),
     .l1clk    (l1clk),
     .din      (startspc3_din_l),
     .dout     (startspc3_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_spc3_delayed = (cntstop & stopspc3_dout) | (cntstart & ~startspc3_dout);

   //********************************************************************
   // SPC4 - Turn CLOCK STOP ON
   assign   stop_spc4_trigger = stop_spc4 & cntstop_equal_max;
   assign   stopspc4_din      = stop_req & (stop_spc4_trigger | stopspc4_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopspc4_reg 
   ( 
     .scan_in(clkseq_stopspc4_reg_scanin),
     .scan_out(clkseq_stopspc4_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopspc4_din_l),
     .dout     (stopspc4_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // SPC4 - Turn CLOCK STOP OFF
   assign   start_spc4_trigger = ~stop_spc4 & cntstart_equal_max;
   assign   startspc4_din      = ~stop_req & (start_spc4_trigger | startspc4_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startspc4_reg 
   ( 
     .scan_in(clkseq_startspc4_reg_scanin),
     .scan_out(clkseq_startspc4_reg_scanout),
     .l1clk    (l1clk),
     .din      (startspc4_din_l),
     .dout     (startspc4_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_spc4_delayed = (cntstop & stopspc4_dout) | (cntstart & ~startspc4_dout);

   //********************************************************************
   // SPC5 - Turn CLOCK STOP ON
   assign   stop_spc5_trigger = stop_spc5 & cntstop_equal_max;
   assign   stopspc5_din      = stop_req & (stop_spc5_trigger | stopspc5_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopspc5_reg 
   ( 
     .scan_in(clkseq_stopspc5_reg_scanin),
     .scan_out(clkseq_stopspc5_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopspc5_din_l),
     .dout     (stopspc5_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // SPC5 - Turn CLOCK STOP OFF
   assign   start_spc5_trigger = ~stop_spc5 & cntstart_equal_max;
   assign   startspc5_din      = ~stop_req & (start_spc5_trigger | startspc5_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startspc5_reg 
   ( 
     .scan_in(clkseq_startspc5_reg_scanin),
     .scan_out(clkseq_startspc5_reg_scanout),
     .l1clk    (l1clk),
     .din      (startspc5_din_l),
     .dout     (startspc5_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_spc5_delayed = (cntstop & stopspc5_dout) | (cntstart & ~startspc5_dout);

   //********************************************************************
   // SPC6 - Turn CLOCK STOP ON
   assign   stop_spc6_trigger = stop_spc6 & cntstop_equal_max;
   assign   stopspc6_din      = stop_req & (stop_spc6_trigger | stopspc6_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopspc6_reg 
   ( 
     .scan_in(clkseq_stopspc6_reg_scanin),
     .scan_out(clkseq_stopspc6_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopspc6_din_l),
     .dout     (stopspc6_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // SPC6 - Turn CLOCK STOP OFF
   assign   start_spc6_trigger = ~stop_spc6 & cntstart_equal_max;
   assign   startspc6_din      = ~stop_req & (start_spc6_trigger | startspc6_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startspc6_reg 
   ( 
     .scan_in(clkseq_startspc6_reg_scanin),
     .scan_out(clkseq_startspc6_reg_scanout),
     .l1clk    (l1clk),
     .din      (startspc6_din_l),
     .dout     (startspc6_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_spc6_delayed = (cntstop & stopspc6_dout) | (cntstart & ~startspc6_dout);

   //********************************************************************
   // SPC7 - Turn CLOCK STOP ON
   assign   stop_spc7_trigger = stop_spc7 & cntstop_equal_max;
   assign   stopspc7_din      = stop_req & (stop_spc7_trigger | stopspc7_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopspc7_reg 
   ( 
     .scan_in(clkseq_stopspc7_reg_scanin),
     .scan_out(clkseq_stopspc7_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopspc7_din_l),
     .dout     (stopspc7_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // SPC7 - Turn CLOCK STOP OFF
   assign   start_spc7_trigger = ~stop_spc7 & cntstart_equal_max;
   assign   startspc7_din      = ~stop_req & (start_spc7_trigger | startspc7_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startspc7_reg 
   ( 
     .scan_in(clkseq_startspc7_reg_scanin),
     .scan_out(clkseq_startspc7_reg_scanout),
     .l1clk    (l1clk),
     .din      (startspc7_din_l),
     .dout     (startspc7_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_spc7_delayed = (cntstop & stopspc7_dout) | (cntstart & ~startspc7_dout);

   //********************************************************************
   // BNK0 - Turn CLOCK STOP ON
   assign   stop_bnk0_trigger = stop_bnk0 & cntstop_equal_max;
   assign   stopbnk0_din      = stop_req & (stop_bnk0_trigger | stopbnk0_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopbnk0_reg 
   ( 
     .scan_in(clkseq_stopbnk0_reg_scanin),
     .scan_out(clkseq_stopbnk0_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopbnk0_din_l),
     .dout     (stopbnk0_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // BNK0 - Turn CLOCK STOP OFF
   assign   start_bnk0_trigger = ~stop_bnk0 & cntstart_equal_max;
   assign   startbnk0_din      = ~stop_req & (start_bnk0_trigger | startbnk0_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startbnk0_reg 
   ( 
     .scan_in(clkseq_startbnk0_reg_scanin),
     .scan_out(clkseq_startbnk0_reg_scanout),
     .l1clk    (l1clk),
     .din      (startbnk0_din_l),
     .dout     (startbnk0_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_bnk0_delayed = (cntstop & stopbnk0_dout) | (cntstart & ~startbnk0_dout);

   //********************************************************************
   // BNK1 - Turn CLOCK STOP ON
   assign   stop_bnk1_trigger = stop_bnk1 & cntstop_equal_max;
   assign   stopbnk1_din      = stop_req & (stop_bnk1_trigger | stopbnk1_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopbnk1_reg 
   ( 
     .scan_in(clkseq_stopbnk1_reg_scanin),
     .scan_out(clkseq_stopbnk1_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopbnk1_din_l),
     .dout     (stopbnk1_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // BNK1 - Turn CLOCK STOP OFF
   assign   start_bnk1_trigger = ~stop_bnk1 & cntstart_equal_max;
   assign   startbnk1_din      = ~stop_req & (start_bnk1_trigger | startbnk1_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startbnk1_reg 
   ( 
     .scan_in(clkseq_startbnk1_reg_scanin),
     .scan_out(clkseq_startbnk1_reg_scanout),
     .l1clk    (l1clk),
     .din      (startbnk1_din_l),
     .dout     (startbnk1_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_bnk1_delayed = (cntstop & stopbnk1_dout) | (cntstart & ~startbnk1_dout);

   //********************************************************************
   // BNK2 - Turn CLOCK STOP ON
   assign   stop_bnk2_trigger = stop_bnk2 & cntstop_equal_max;
   assign   stopbnk2_din      = stop_req & (stop_bnk2_trigger | stopbnk2_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopbnk2_reg 
   ( 
     .scan_in(clkseq_stopbnk2_reg_scanin),
     .scan_out(clkseq_stopbnk2_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopbnk2_din_l),
     .dout     (stopbnk2_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // BNK2 - Turn CLOCK STOP OFF
   assign   start_bnk2_trigger = ~stop_bnk2 & cntstart_equal_max;
   assign   startbnk2_din      = ~stop_req & (start_bnk2_trigger | startbnk2_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startbnk2_reg 
   ( 
     .scan_in(clkseq_startbnk2_reg_scanin),
     .scan_out(clkseq_startbnk2_reg_scanout),
     .l1clk    (l1clk),
     .din      (startbnk2_din_l),
     .dout     (startbnk2_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_bnk2_delayed = (cntstop & stopbnk2_dout) | (cntstart & ~startbnk2_dout);

   //********************************************************************
   // BNK3 - Turn CLOCK STOP ON
   assign   stop_bnk3_trigger = stop_bnk3 & cntstop_equal_max;
   assign   stopbnk3_din      = stop_req & (stop_bnk3_trigger | stopbnk3_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopbnk3_reg 
   ( 
     .scan_in(clkseq_stopbnk3_reg_scanin),
     .scan_out(clkseq_stopbnk3_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopbnk3_din_l),
     .dout     (stopbnk3_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // BNK3 - Turn CLOCK STOP OFF
   assign   start_bnk3_trigger = ~stop_bnk3 & cntstart_equal_max;
   assign   startbnk3_din      = ~stop_req & (start_bnk3_trigger | startbnk3_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startbnk3_reg 
   ( 
     .scan_in(clkseq_startbnk3_reg_scanin),
     .scan_out(clkseq_startbnk3_reg_scanout),
     .l1clk    (l1clk),
     .din      (startbnk3_din_l),
     .dout     (startbnk3_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_bnk3_delayed = (cntstop & stopbnk3_dout) | (cntstart & ~startbnk3_dout);

   //********************************************************************
   // BNK4 - Turn CLOCK STOP ON
   assign   stop_bnk4_trigger = stop_bnk4 & cntstop_equal_max;
   assign   stopbnk4_din      = stop_req & (stop_bnk4_trigger | stopbnk4_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopbnk4_reg 
   ( 
     .scan_in(clkseq_stopbnk4_reg_scanin),
     .scan_out(clkseq_stopbnk4_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopbnk4_din_l),
     .dout     (stopbnk4_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // BNK4 - Turn CLOCK STOP OFF
   assign   start_bnk4_trigger = ~stop_bnk4 & cntstart_equal_max;
   assign   startbnk4_din      = ~stop_req & (start_bnk4_trigger | startbnk4_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startbnk4_reg 
   ( 
     .scan_in(clkseq_startbnk4_reg_scanin),
     .scan_out(clkseq_startbnk4_reg_scanout),
     .l1clk    (l1clk),
     .din      (startbnk4_din_l),
     .dout     (startbnk4_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_bnk4_delayed = (cntstop & stopbnk4_dout) | (cntstart & ~startbnk4_dout);

   //********************************************************************
   // BNK5 - Turn CLOCK STOP ON
   assign   stop_bnk5_trigger = stop_bnk5 & cntstop_equal_max;
   assign   stopbnk5_din      = stop_req & (stop_bnk5_trigger | stopbnk5_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopbnk5_reg 
   ( 
     .scan_in(clkseq_stopbnk5_reg_scanin),
     .scan_out(clkseq_stopbnk5_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopbnk5_din_l),
     .dout     (stopbnk5_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // BNK5 - Turn CLOCK STOP OFF
   assign   start_bnk5_trigger = ~stop_bnk5 & cntstart_equal_max;
   assign   startbnk5_din      = ~stop_req & (start_bnk5_trigger | startbnk5_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startbnk5_reg 
   ( 
     .scan_in(clkseq_startbnk5_reg_scanin),
     .scan_out(clkseq_startbnk5_reg_scanout),
     .l1clk    (l1clk),
     .din      (startbnk5_din_l),
     .dout     (startbnk5_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_bnk5_delayed = (cntstop & stopbnk5_dout) | (cntstart & ~startbnk5_dout);

   //********************************************************************
   // BNK6 - Turn CLOCK STOP ON
   assign   stop_bnk6_trigger = stop_bnk6 & cntstop_equal_max;
   assign   stopbnk6_din      = stop_req & (stop_bnk6_trigger | stopbnk6_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopbnk6_reg 
   ( 
     .scan_in(clkseq_stopbnk6_reg_scanin),
     .scan_out(clkseq_stopbnk6_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopbnk6_din_l),
     .dout     (stopbnk6_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // BNK6 - Turn CLOCK STOP OFF
   assign   start_bnk6_trigger = ~stop_bnk6 & cntstart_equal_max;
   assign   startbnk6_din      = ~stop_req & (start_bnk6_trigger | startbnk6_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startbnk6_reg 
   ( 
     .scan_in(clkseq_startbnk6_reg_scanin),
     .scan_out(clkseq_startbnk6_reg_scanout),
     .l1clk    (l1clk),
     .din      (startbnk6_din_l),
     .dout     (startbnk6_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_bnk6_delayed = (cntstop & stopbnk6_dout) | (cntstart & ~startbnk6_dout);

   //********************************************************************
   // BNK7 - Turn CLOCK STOP ON
   assign   stop_bnk7_trigger = stop_bnk7 & cntstop_equal_max;
   assign   stopbnk7_din      = stop_req & (stop_bnk7_trigger | stopbnk7_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopbnk7_reg 
   ( 
     .scan_in(clkseq_stopbnk7_reg_scanin),
     .scan_out(clkseq_stopbnk7_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopbnk7_din_l),
     .dout     (stopbnk7_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // BNK7 - Turn CLOCK STOP OFF
   assign   start_bnk7_trigger = ~stop_bnk7 & cntstart_equal_max;
   assign   startbnk7_din      = ~stop_req & (start_bnk7_trigger | startbnk7_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startbnk7_reg 
   ( 
     .scan_in(clkseq_startbnk7_reg_scanin),
     .scan_out(clkseq_startbnk7_reg_scanout),
     .l1clk    (l1clk),
     .din      (startbnk7_din_l),
     .dout     (startbnk7_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_bnk7_delayed = (cntstop & stopbnk7_dout) | (cntstart & ~startbnk7_dout);

   //********************************************************************
   // MCU0 - Turn CLOCK STOP ON
   assign   stop_mcu0_trigger = stop_mcu0 & cntstop_equal_max;
   assign   stopmcu0_din      = stop_req & (stop_mcu0_trigger | stopmcu0_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopmcu0_reg 
   ( 
     .scan_in(clkseq_stopmcu0_reg_scanin),
     .scan_out(clkseq_stopmcu0_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopmcu0_din_l),
     .dout     (stopmcu0_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // MCU0 - Turn CLOCK STOP OFF
   assign   start_mcu0_trigger = ~stop_mcu0 & cntstart_equal_max;
   assign   startmcu0_din      = ~stop_req & (start_mcu0_trigger | startmcu0_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startmcu0_reg 
   ( 
     .scan_in(clkseq_startmcu0_reg_scanin),
     .scan_out(clkseq_startmcu0_reg_scanout),
     .l1clk    (l1clk),
     .din      (startmcu0_din_l),
     .dout     (startmcu0_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_mcu0_delayed = (cntstop & stopmcu0_dout) | (cntstart & ~startmcu0_dout);
  
   //********************************************************************
   // MCU1 - Turn CLOCK STOP ON
   assign   stop_mcu1_trigger = stop_mcu1 & cntstop_equal_max;
   assign   stopmcu1_din      = stop_req & (stop_mcu1_trigger | stopmcu1_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopmcu1_reg 
   ( 
     .scan_in(clkseq_stopmcu1_reg_scanin),
     .scan_out(clkseq_stopmcu1_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopmcu1_din_l),
     .dout     (stopmcu1_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // MCU1 - Turn CLOCK STOP OFF
   assign   start_mcu1_trigger = ~stop_mcu1 & cntstart_equal_max;
   assign   startmcu1_din      = ~stop_req & (start_mcu1_trigger | startmcu1_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startmcu1_reg 
   ( 
     .scan_in(clkseq_startmcu1_reg_scanin),
     .scan_out(clkseq_startmcu1_reg_scanout),
     .l1clk    (l1clk),
     .din      (startmcu1_din_l),
     .dout     (startmcu1_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_mcu1_delayed = (cntstop & stopmcu1_dout) | (cntstart & ~startmcu1_dout);
  
   //********************************************************************
   // MCU2 - Turn CLOCK STOP ON
   assign   stop_mcu2_trigger = stop_mcu2 & cntstop_equal_max;
   assign   stopmcu2_din      = stop_req & (stop_mcu2_trigger | stopmcu2_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopmcu2_reg 
   ( 
     .scan_in(clkseq_stopmcu2_reg_scanin),
     .scan_out(clkseq_stopmcu2_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopmcu2_din_l),
     .dout     (stopmcu2_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // MCU2 - Turn CLOCK STOP OFF
   assign   start_mcu2_trigger = ~stop_mcu2 & cntstart_equal_max;
   assign   startmcu2_din      = ~stop_req & (start_mcu2_trigger | startmcu2_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startmcu2_reg 
   ( 
     .scan_in(clkseq_startmcu2_reg_scanin),
     .scan_out(clkseq_startmcu2_reg_scanout),
     .l1clk    (l1clk),
     .din      (startmcu2_din_l),
     .dout     (startmcu2_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_mcu2_delayed = (cntstop & stopmcu2_dout) | (cntstart & ~startmcu2_dout);
  
   //********************************************************************
   // MCU3 - Turn CLOCK STOP ON
   assign   stop_mcu3_trigger = stop_mcu3 & cntstop_equal_max;
   assign   stopmcu3_din      = stop_req & (stop_mcu3_trigger | stopmcu3_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopmcu3_reg 
   ( 
     .scan_in(clkseq_stopmcu3_reg_scanin),
     .scan_out(clkseq_stopmcu3_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopmcu3_din_l),
     .dout     (stopmcu3_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // MCU3 - Turn CLOCK STOP OFF
   assign   start_mcu3_trigger = ~stop_mcu3 & cntstart_equal_max;
   assign   startmcu3_din      = ~stop_req & (start_mcu3_trigger | startmcu3_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startmcu3_reg 
   ( 
     .scan_in(clkseq_startmcu3_reg_scanin),
     .scan_out(clkseq_startmcu3_reg_scanout),
     .l1clk    (l1clk),
     .din      (startmcu3_din_l),
     .dout     (startmcu3_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_mcu3_delayed = (cntstop & stopmcu3_dout) | (cntstart & ~startmcu3_dout);
  
   //********************************************************************
   // SOC0 - Turn CLOCK STOP ON
   assign   stop_soc0_trigger = stop_soc0 & cntstop_equal_max;
   assign   stopsoc0_din      = stop_req & (stop_soc0_trigger | stopsoc0_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopsoc0_reg 
   ( 
     .scan_in(clkseq_stopsoc0_reg_scanin),
     .scan_out(clkseq_stopsoc0_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopsoc0_din_l),
     .dout     (stopsoc0_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // SOC0 - Turn CLOCK STOP OFF
   assign   start_soc0_trigger = ~stop_soc0 & cntstart_equal_max;
   assign   startsoc0_din      = ~stop_req & (start_soc0_trigger | startsoc0_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startsoc0_reg 
   ( 
     .scan_in(clkseq_startsoc0_reg_scanin),
     .scan_out(clkseq_startsoc0_reg_scanout),
     .l1clk    (l1clk),
     .din      (startsoc0_din_l),
     .dout     (startsoc0_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_soc0_delayed = (cntstop & stopsoc0_dout) | (cntstart & ~startsoc0_dout);
  
   //********************************************************************
   // SOC1 - Turn CLOCK STOP ON
   assign   stop_soc1_trigger = stop_soc1 & cntstop_equal_max;
   assign   stopsoc1_din      = stop_req & (stop_soc1_trigger | stopsoc1_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopsoc1_reg 
   ( 
     .scan_in(clkseq_stopsoc1_reg_scanin),
     .scan_out(clkseq_stopsoc1_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopsoc1_din_l),
     .dout     (stopsoc1_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // SOC1 - Turn CLOCK STOP OFF
   assign   start_soc1_trigger = ~stop_soc1 & cntstart_equal_max;
   assign   startsoc1_din      = ~stop_req & (start_soc1_trigger | startsoc1_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startsoc1_reg 
   ( 
     .scan_in(clkseq_startsoc1_reg_scanin),
     .scan_out(clkseq_startsoc1_reg_scanout),
     .l1clk    (l1clk),
     .din      (startsoc1_din_l),
     .dout     (startsoc1_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_soc1_delayed = (cntstop & stopsoc1_dout) | (cntstart & ~startsoc1_dout);
  
   //********************************************************************
   // SOC2 - Turn CLOCK STOP ON
   assign   stop_soc2_trigger = stop_soc2 & cntstop_equal_max;
   assign   stopsoc2_din      = stop_req & (stop_soc2_trigger | stopsoc2_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopsoc2_reg 
   ( 
     .scan_in(clkseq_stopsoc2_reg_scanin),
     .scan_out(clkseq_stopsoc2_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopsoc2_din_l),
     .dout     (stopsoc2_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // SOC2 - Turn CLOCK STOP OFF
   assign   start_soc2_trigger = ~stop_soc2 & cntstart_equal_max;
   assign   startsoc2_din      = ~stop_req & (start_soc2_trigger | startsoc2_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startsoc2_reg 
   ( 
     .scan_in(clkseq_startsoc2_reg_scanin),
     .scan_out(clkseq_startsoc2_reg_scanout),
     .l1clk    (l1clk),
     .din      (startsoc2_din_l),
     .dout     (startsoc2_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_soc2_delayed = (cntstop & stopsoc2_dout) | (cntstart & ~startsoc2_dout);
  
   //********************************************************************
   // SOC3 - Turn CLOCK STOP ON
   assign   stop_soc3_trigger = stop_soc3 & cntstop_equal_max;
   assign   stopsoc3_din      = stop_req & (stop_soc3_trigger | stopsoc3_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_stopsoc3_reg 
   ( 
     .scan_in(clkseq_stopsoc3_reg_scanin),
     .scan_out(clkseq_stopsoc3_reg_scanout),
     .l1clk    (l1clk),
     .din      (stopsoc3_din_l),
     .dout     (stopsoc3_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   // SOC3 - Turn CLOCK STOP OFF
   assign   start_soc3_trigger = ~stop_soc3 & cntstart_equal_max;
   assign   startsoc3_din      = ~stop_req & (start_soc3_trigger | startsoc3_dout);
   tcu_clkseq_ctl_msff_ctl_macro__width_1 clkseq_startsoc3_reg 
   ( 
     .scan_in(clkseq_startsoc3_reg_scanin),
     .scan_out(clkseq_startsoc3_reg_scanout),
     .l1clk    (l1clk),
     .din      (startsoc3_din_l),
     .dout     (startsoc3_dout_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_soc3_delayed = (cntstop & stopsoc3_dout) | (cntstart & ~startsoc3_dout);
   
   //********************************************************************
   // Generation of clock stops before synchronizing them 
   //********************************************************************
   assign   io_test_mode       = test_mode_gated;

   assign   spc0_clk_stop_loop = io_test_mode ? io_ac_test_mode : spc0_clk_stop;
   assign   spc0_clk_stop      = clock_stop_active & stop_spc0_delayed;
   
   assign   spc1_clk_stop_loop = io_test_mode ? io_ac_test_mode : spc1_clk_stop;
   assign   spc1_clk_stop      = clock_stop_active & stop_spc1_delayed;

   assign   spc2_clk_stop_loop = io_test_mode ? io_ac_test_mode : spc2_clk_stop;
   assign   spc2_clk_stop      = clock_stop_active & stop_spc2_delayed;

   assign   spc3_clk_stop_loop = io_test_mode ? io_ac_test_mode : spc3_clk_stop;
   assign   spc3_clk_stop      = clock_stop_active & stop_spc3_delayed;

   assign   spc4_clk_stop_loop = io_test_mode ? io_ac_test_mode : spc4_clk_stop;
   assign   spc4_clk_stop      = clock_stop_active & stop_spc4_delayed;

   assign   spc5_clk_stop_loop = io_test_mode ? io_ac_test_mode : spc5_clk_stop;
   assign   spc5_clk_stop      = clock_stop_active & stop_spc5_delayed;

   assign   spc6_clk_stop_loop = io_test_mode ? io_ac_test_mode : spc6_clk_stop;
   assign   spc6_clk_stop      = clock_stop_active & stop_spc6_delayed;

   assign   spc7_clk_stop_loop = io_test_mode ? io_ac_test_mode : spc7_clk_stop;
   assign   spc7_clk_stop      = clock_stop_active & stop_spc7_delayed;

   assign   bnk0_clk_stop_loop = io_test_mode ? io_ac_test_mode : bnk0_clk_stop;
   assign   bnk0_clk_stop      = clock_stop_active & stop_bnk0_delayed;

   assign   bnk1_clk_stop_loop = io_test_mode ? io_ac_test_mode : bnk1_clk_stop;
   assign   bnk1_clk_stop      = clock_stop_active & stop_bnk1_delayed;
   
   assign   bnk2_clk_stop_loop = io_test_mode ? io_ac_test_mode : bnk2_clk_stop;
   assign   bnk2_clk_stop      = clock_stop_active & stop_bnk2_delayed;
   
   assign   bnk3_clk_stop_loop = io_test_mode ? io_ac_test_mode : bnk3_clk_stop;
   assign   bnk3_clk_stop      = clock_stop_active & stop_bnk3_delayed;
   
   assign   bnk4_clk_stop_loop = io_test_mode ? io_ac_test_mode : bnk4_clk_stop;
   assign   bnk4_clk_stop      = clock_stop_active & stop_bnk4_delayed;
   
   assign   bnk5_clk_stop_loop = io_test_mode ? io_ac_test_mode : bnk5_clk_stop;
   assign   bnk5_clk_stop      = clock_stop_active & stop_bnk5_delayed;
   
   assign   bnk6_clk_stop_loop = io_test_mode ? io_ac_test_mode : bnk6_clk_stop;
   assign   bnk6_clk_stop      = clock_stop_active & stop_bnk6_delayed;
   
   assign   bnk7_clk_stop_loop = io_test_mode ? io_ac_test_mode : bnk7_clk_stop;
   assign   bnk7_clk_stop      = clock_stop_active & stop_bnk7_delayed;

   assign   mcu0_clk_stop_loop = io_test_mode ? io_ac_test_mode : mcu0_clk_stop;
   assign   mcu0_clk_stop      = clock_stop_active & stop_mcu0_delayed;

   assign   mcu1_clk_stop_loop = io_test_mode ? io_ac_test_mode : mcu1_clk_stop;
   assign   mcu1_clk_stop      = clock_stop_active & stop_mcu1_delayed;

   assign   mcu2_clk_stop_loop = io_test_mode ? io_ac_test_mode : mcu2_clk_stop;
   assign   mcu2_clk_stop      = clock_stop_active & stop_mcu2_delayed;

   assign   mcu3_clk_stop_loop = io_test_mode ? io_ac_test_mode : mcu3_clk_stop;
   assign   mcu3_clk_stop      = clock_stop_active & stop_mcu3_delayed;

   assign   soc0_clk_stop_loop = io_test_mode ? io_ac_test_mode : soc0_clk_stop;
   assign   soc0_clk_stop      = clock_stop_active & stop_soc0_delayed;

   assign   soc1_clk_stop_loop = io_test_mode ? io_ac_test_mode : soc1_clk_stop;
   assign   soc1_clk_stop      = clock_stop_active & stop_soc1_delayed;
   
   assign   soc2_clk_stop_loop = io_test_mode ? io_ac_test_mode : soc2_clk_stop;
   assign   soc2_clk_stop      = clock_stop_active & stop_soc2_delayed;
   
   assign   soc3_clk_stop_loop = io_test_mode ? io_ac_test_mode : soc3_clk_stop;
   assign   soc3_clk_stop      = clock_stop_active & stop_soc3_delayed;
   
   assign clk_stop_loops_all_off = ~(spc0_clk_stop_loop | spc1_clk_stop_loop
  	                           | spc2_clk_stop_loop | spc3_clk_stop_loop
  	                           | spc4_clk_stop_loop | spc5_clk_stop_loop
  	                           | spc6_clk_stop_loop | spc7_clk_stop_loop
				   | bnk0_clk_stop_loop | bnk1_clk_stop_loop
				   | bnk2_clk_stop_loop | bnk3_clk_stop_loop
				   | bnk4_clk_stop_loop | bnk5_clk_stop_loop
				   | bnk6_clk_stop_loop | bnk7_clk_stop_loop
				   | mcu0_clk_stop_loop | mcu1_clk_stop_loop
				   | mcu2_clk_stop_loop | mcu3_clk_stop_loop
  	                           | soc0_clk_stop_loop | soc1_clk_stop_loop
  	                           | soc2_clk_stop_loop | soc3_clk_stop_loop);
   
   assign clk_stop_loops_all_on  = ( spc0_clk_stop_loop & spc1_clk_stop_loop
  	                           & spc2_clk_stop_loop & spc3_clk_stop_loop
  	                           & spc4_clk_stop_loop & spc5_clk_stop_loop
  	                           & spc6_clk_stop_loop & spc7_clk_stop_loop
				   & bnk0_clk_stop_loop & bnk1_clk_stop_loop
				   & bnk2_clk_stop_loop & bnk3_clk_stop_loop
				   & bnk4_clk_stop_loop & bnk5_clk_stop_loop
				   & bnk6_clk_stop_loop & bnk7_clk_stop_loop
				   & mcu0_clk_stop_loop & mcu1_clk_stop_loop
				   & mcu2_clk_stop_loop & mcu3_clk_stop_loop
  	                           & soc0_clk_stop_loop & soc1_clk_stop_loop
  	                           & soc2_clk_stop_loop & soc3_clk_stop_loop);

// invert din and dout (q) so that during flush reset these flops all are set to '1'

   assign   stopspc0_din_l      = ~stopspc0_din;
   assign   startspc0_din_l     = ~startspc0_din;
   assign   stopspc1_din_l      = ~stopspc1_din;
   assign   startspc1_din_l     = ~startspc1_din;
   assign   stopspc2_din_l      = ~stopspc2_din;
   assign   startspc2_din_l     = ~startspc2_din;
   assign   stopspc3_din_l      = ~stopspc3_din;
   assign   startspc3_din_l     = ~startspc3_din;
   assign   stopspc4_din_l      = ~stopspc4_din;
   assign   startspc4_din_l     = ~startspc4_din;
   assign   stopspc5_din_l      = ~stopspc5_din;
   assign   startspc5_din_l     = ~startspc5_din;
   assign   stopspc6_din_l      = ~stopspc6_din;
   assign   startspc6_din_l     = ~startspc6_din;
   assign   stopspc7_din_l      = ~stopspc7_din;
   assign   startspc7_din_l     = ~startspc7_din;
   assign   stopbnk0_din_l      = ~stopbnk0_din;
   assign   startbnk0_din_l     = ~startbnk0_din;
   assign   stopbnk1_din_l      = ~stopbnk1_din;
   assign   startbnk1_din_l     = ~startbnk1_din;
   assign   stopbnk2_din_l      = ~stopbnk2_din;
   assign   startbnk2_din_l     = ~startbnk2_din;
   assign   stopbnk3_din_l      = ~stopbnk3_din;
   assign   startbnk3_din_l     = ~startbnk3_din;
   assign   stopbnk4_din_l      = ~stopbnk4_din;
   assign   startbnk4_din_l     = ~startbnk4_din;
   assign   stopbnk5_din_l      = ~stopbnk5_din;
   assign   startbnk5_din_l     = ~startbnk5_din;
   assign   stopbnk6_din_l      = ~stopbnk6_din;
   assign   startbnk6_din_l     = ~startbnk6_din;
   assign   stopbnk7_din_l      = ~stopbnk7_din;
   assign   startbnk7_din_l     = ~startbnk7_din;
   assign   stopmcu0_din_l      = ~stopmcu0_din;
   assign   startmcu0_din_l     = ~startmcu0_din;
   assign   stopmcu1_din_l      = ~stopmcu1_din;
   assign   startmcu1_din_l     = ~startmcu1_din;
   assign   stopmcu2_din_l      = ~stopmcu2_din;
   assign   startmcu2_din_l     = ~startmcu2_din;
   assign   stopmcu3_din_l      = ~stopmcu3_din;
   assign   startmcu3_din_l     = ~startmcu3_din;
   assign   stopsoc0_din_l      = ~stopsoc0_din;
   assign   startsoc0_din_l     = ~startsoc0_din;
   assign   stopsoc1_din_l      = ~stopsoc1_din;
   assign   startsoc1_din_l     = ~startsoc1_din;
   assign   stopsoc2_din_l      = ~stopsoc2_din;
   assign   startsoc2_din_l     = ~startsoc2_din;
   assign   stopsoc3_din_l      = ~stopsoc3_din;
   assign   startsoc3_din_l     = ~startsoc3_din;

   assign   stopspc0_dout       = ~stopspc0_dout_l;
   assign   startspc0_dout      = ~startspc0_dout_l;
   assign   stopspc1_dout       = ~stopspc1_dout_l;
   assign   startspc1_dout      = ~startspc1_dout_l;
   assign   stopspc2_dout       = ~stopspc2_dout_l;
   assign   startspc2_dout      = ~startspc2_dout_l;
   assign   stopspc3_dout       = ~stopspc3_dout_l;
   assign   startspc3_dout      = ~startspc3_dout_l;
   assign   stopspc4_dout       = ~stopspc4_dout_l;
   assign   startspc4_dout      = ~startspc4_dout_l;
   assign   stopspc5_dout       = ~stopspc5_dout_l;
   assign   startspc5_dout      = ~startspc5_dout_l;
   assign   stopspc6_dout       = ~stopspc6_dout_l;
   assign   startspc6_dout      = ~startspc6_dout_l;
   assign   stopspc7_dout       = ~stopspc7_dout_l;
   assign   startspc7_dout      = ~startspc7_dout_l;
   assign   stopbnk0_dout       = ~stopbnk0_dout_l;
   assign   startbnk0_dout      = ~startbnk0_dout_l;
   assign   stopbnk1_dout       = ~stopbnk1_dout_l;
   assign   startbnk1_dout      = ~startbnk1_dout_l;
   assign   stopbnk2_dout       = ~stopbnk2_dout_l;
   assign   startbnk2_dout      = ~startbnk2_dout_l;
   assign   stopbnk3_dout       = ~stopbnk3_dout_l;
   assign   startbnk3_dout      = ~startbnk3_dout_l;
   assign   stopbnk4_dout       = ~stopbnk4_dout_l;
   assign   startbnk4_dout      = ~startbnk4_dout_l;
   assign   stopbnk5_dout       = ~stopbnk5_dout_l;
   assign   startbnk5_dout      = ~startbnk5_dout_l;
   assign   stopbnk6_dout       = ~stopbnk6_dout_l;
   assign   startbnk6_dout      = ~startbnk6_dout_l;
   assign   stopbnk7_dout       = ~stopbnk7_dout_l;
   assign   startbnk7_dout      = ~startbnk7_dout_l;
   assign   stopmcu0_dout       = ~stopmcu0_dout_l;
   assign   startmcu0_dout      = ~startmcu0_dout_l;
   assign   stopmcu1_dout       = ~stopmcu1_dout_l;
   assign   startmcu1_dout      = ~startmcu1_dout_l;
   assign   stopmcu2_dout       = ~stopmcu2_dout_l;
   assign   startmcu2_dout      = ~startmcu2_dout_l;
   assign   stopmcu3_dout       = ~stopmcu3_dout_l;
   assign   startmcu3_dout      = ~startmcu3_dout_l;
   assign   stopsoc0_dout       = ~stopsoc0_dout_l;
   assign   startsoc0_dout      = ~startsoc0_dout_l;
   assign   stopsoc1_dout       = ~stopsoc1_dout_l;
   assign   startsoc1_dout      = ~startsoc1_dout_l;
   assign   stopsoc2_dout       = ~stopsoc2_dout_l;
   assign   startsoc2_dout      = ~startsoc2_dout_l;
   assign   stopsoc3_dout       = ~stopsoc3_dout_l;
   assign   startsoc3_dout      = ~startsoc3_dout_l;

   
// fixscan start:
assign clkseq_stopspc0_reg_scanin = scan_in                  ;
assign clkseq_startspc0_reg_scanin = clkseq_stopspc0_reg_scanout;
assign clkseq_stopspc1_reg_scanin = clkseq_startspc0_reg_scanout;
assign clkseq_startspc1_reg_scanin = clkseq_stopspc1_reg_scanout;
assign clkseq_stopspc2_reg_scanin = clkseq_startspc1_reg_scanout;
assign clkseq_startspc2_reg_scanin = clkseq_stopspc2_reg_scanout;
assign clkseq_stopspc3_reg_scanin = clkseq_startspc2_reg_scanout;
assign clkseq_startspc3_reg_scanin = clkseq_stopspc3_reg_scanout;
assign clkseq_stopspc4_reg_scanin = clkseq_startspc3_reg_scanout;
assign clkseq_startspc4_reg_scanin = clkseq_stopspc4_reg_scanout;
assign clkseq_stopspc5_reg_scanin = clkseq_startspc4_reg_scanout;
assign clkseq_startspc5_reg_scanin = clkseq_stopspc5_reg_scanout;
assign clkseq_stopspc6_reg_scanin = clkseq_startspc5_reg_scanout;
assign clkseq_startspc6_reg_scanin = clkseq_stopspc6_reg_scanout;
assign clkseq_stopspc7_reg_scanin = clkseq_startspc6_reg_scanout;
assign clkseq_startspc7_reg_scanin = clkseq_stopspc7_reg_scanout;
assign clkseq_stopbnk0_reg_scanin = clkseq_startspc7_reg_scanout;
assign clkseq_startbnk0_reg_scanin = clkseq_stopbnk0_reg_scanout;
assign clkseq_stopbnk1_reg_scanin = clkseq_startbnk0_reg_scanout;
assign clkseq_startbnk1_reg_scanin = clkseq_stopbnk1_reg_scanout;
assign clkseq_stopbnk2_reg_scanin = clkseq_startbnk1_reg_scanout;
assign clkseq_startbnk2_reg_scanin = clkseq_stopbnk2_reg_scanout;
assign clkseq_stopbnk3_reg_scanin = clkseq_startbnk2_reg_scanout;
assign clkseq_startbnk3_reg_scanin = clkseq_stopbnk3_reg_scanout;
assign clkseq_stopbnk4_reg_scanin = clkseq_startbnk3_reg_scanout;
assign clkseq_startbnk4_reg_scanin = clkseq_stopbnk4_reg_scanout;
assign clkseq_stopbnk5_reg_scanin = clkseq_startbnk4_reg_scanout;
assign clkseq_startbnk5_reg_scanin = clkseq_stopbnk5_reg_scanout;
assign clkseq_stopbnk6_reg_scanin = clkseq_startbnk5_reg_scanout;
assign clkseq_startbnk6_reg_scanin = clkseq_stopbnk6_reg_scanout;
assign clkseq_stopbnk7_reg_scanin = clkseq_startbnk6_reg_scanout;
assign clkseq_startbnk7_reg_scanin = clkseq_stopbnk7_reg_scanout;
assign clkseq_stopmcu0_reg_scanin = clkseq_startbnk7_reg_scanout;
assign clkseq_startmcu0_reg_scanin = clkseq_stopmcu0_reg_scanout;
assign clkseq_stopmcu1_reg_scanin = clkseq_startmcu0_reg_scanout;
assign clkseq_startmcu1_reg_scanin = clkseq_stopmcu1_reg_scanout;
assign clkseq_stopmcu2_reg_scanin = clkseq_startmcu1_reg_scanout;
assign clkseq_startmcu2_reg_scanin = clkseq_stopmcu2_reg_scanout;
assign clkseq_stopmcu3_reg_scanin = clkseq_startmcu2_reg_scanout;
assign clkseq_startmcu3_reg_scanin = clkseq_stopmcu3_reg_scanout;
assign clkseq_stopsoc0_reg_scanin = clkseq_startmcu3_reg_scanout;
assign clkseq_startsoc0_reg_scanin = clkseq_stopsoc0_reg_scanout;
assign clkseq_stopsoc1_reg_scanin = clkseq_startsoc0_reg_scanout;
assign clkseq_startsoc1_reg_scanin = clkseq_stopsoc1_reg_scanout;
assign clkseq_stopsoc2_reg_scanin = clkseq_startsoc1_reg_scanout;
assign clkseq_startsoc2_reg_scanin = clkseq_stopsoc2_reg_scanout;
assign clkseq_stopsoc3_reg_scanin = clkseq_startsoc2_reg_scanout;
assign clkseq_startsoc3_reg_scanin = clkseq_stopsoc3_reg_scanout;
assign scan_out                  = clkseq_startsoc3_reg_scanout;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module tcu_clkseq_ctl_l1clkhdr_ctl_macro (
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

module tcu_clkseq_ctl_msff_ctl_macro__width_1 (
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








