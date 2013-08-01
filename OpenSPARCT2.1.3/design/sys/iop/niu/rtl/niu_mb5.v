// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_mb5.v
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

///////////////////////////////////////////////////////////////////////////////
//
//
//    Released:           12/06/02
//    Contacts:           carlos.castil@sun.com/shahryar.aryani@sun.com
//    Description:        Memory BIST Controller for Niagara2 NIU core
//    Block Type:         Control Block
//    Chip Name:          
//    Unit Name:         
//    Module:             mbist_engine
//    Where Instantiated: 
//
//
//  (c) 2005 Sun Microsystems, Inc.
//      Sun Proprietary/Confidential
//      Internal use only.
//
//  All rights reserved. No part of this design may be reproduced stored
//  in a retrieval system, or transmitted, in any form or by any means,
//  electronic, mechanical, photocopying, recording, or otherwise, without
//  prior written permission of Sun Microsystems, Inc.
//
///////////////////////////////////////////////////////////////////////////////


module niu_mb5 (
  niu_mb5_tcam_cntrl_rd_en, 
  niu_mb5_tcam_cntrl_wr_en, 
  niu_mb5_addr, 
  niu_mb5_run, 
  niu_tcu_mbist_fail_5, 
  niu_tcu_mbist_done_5, 
  mb5_scan_out, 
  niu_mb5_data_inp, 
  niu_mb5_pio_sel, 
  niu_mb5_cam_compare, 
  l1clk, 
  mb5_scan_in, 
  tcu_aclk, 
  tcu_bclk, 
  rst, 
  tcu_niu_mbist_start_5, 
  niu_mb5_msk_dat_out, 
  tcu_mbist_bisi_en, 
  tcu_mbist_user_mode, 
  niu_mb5_cam_haddr, 
  niu_mb5_cam_valid, 
  niu_mb5_rd_vld, 
  niu_mb5_cam_hit);
wire siclk;
wire soclk;
wire reset;
wire config_reg_scanin;
wire config_reg_scanout;
wire [7:0] config_in;
wire [7:0] config_out;
wire start_transition;
wire reset_engine;
wire mbist_user_loop_mode;
wire mbist_done;
wire run;
wire bisi;
wire user_mode;
wire user_data_mode;
wire user_addr_mode;
wire user_loop_mode;
wire ten_n_mode;
wire mbist_user_data_mode;
wire mbist_user_addr_mode;
wire mbist_ten_n_mode;
wire user_data_reg_scanin;
wire user_data_reg_scanout;
wire [7:0] user_data_in;
wire [7:0] user_data_out;
wire user_start_addr_reg_scanin;
wire user_start_addr_reg_scanout;
wire [7:0] user_start_addr_in;
wire [7:0] user_start_addr;
wire user_stop_addr_reg_scanin;
wire user_stop_addr_reg_scanout;
wire [7:0] user_stop_addr_in;
wire [7:0] user_stop_addr;
wire user_incr_addr_reg_scanin;
wire user_incr_addr_reg_scanout;
wire [7:0] user_incr_addr_in;
wire [7:0] user_incr_addr;
wire user_cam_mode_reg_scanin;
wire user_cam_mode_reg_scanout;
wire user_cam_mode_in;
wire user_cam_mode;
wire user_cam_test_select_reg_scanin;
wire user_cam_test_select_reg_scanout;
wire [3:0] user_cam_test_sel_in;
wire [3:0] user_cam_test_sel;
wire user_bisi_wr_reg_scanin;
wire user_bisi_wr_reg_scanout;
wire user_bisi_wr_mode_in;
wire user_bisi_wr_mode;
wire user_bisi_rd_reg_scanin;
wire user_bisi_rd_reg_scanout;
wire user_bisi_rd_mode_in;
wire user_bisi_rd_mode;
wire mbist_user_bisi_wr_mode;
wire mbist_user_bisi_wr_rd_mode;
wire start_transition_reg_scanin;
wire start_transition_reg_scanout;
wire start_transition_piped;
wire run_reg_scanin;
wire run_reg_scanout;
wire run1_reg_scanin;
wire run1_reg_scanout;
wire run1_in;
wire run1_out;
wire run2_reg_scanin;
wire run2_reg_scanout;
wire run2_in;
wire run2_out;
wire run_piped3;
wire msb;
wire done_reg_scanin;
wire done_reg_scanout;
wire mbist_fail_reg_scanin;
wire mbist_fail_reg_scanout;
wire fail;
wire walking0_8bit_reg_scanin;
wire walking0_8bit_reg_scanout;
wire [7:0] walking0_8bit_in;
wire [7:0] walking0_8bit;
wire ctest3;
wire ctest4;
wire cseq1;
wire crw1;
wire op_hold;
wire [7:0] cam_addr;
wire array_write;
wire array_read;
wire [7:0] mbist_wdata;
wire ctest1;
wire ctest7;
wire cseq0;
wire ctest8;
wire ctest0;
wire ctest2;
wire ctest5;
wire ctest6;
wire crw0;
wire crw3;
wire crw2;
wire op_hold_reg_scanin;
wire op_hold_reg_scanout;
wire op_hold_in;
wire cambist;
wire control_reg_scanin;
wire control_reg_scanout;
wire [19:0] control_in;
wire [19:0] control_out;
wire bisi_wr_rd;
wire [1:0] data_control;
wire address_mix;
wire [3:0] march_element;
wire [7:0] array_address;
wire upaddress_march;
wire [2:0] read_write_control;
wire five_cycle_march;
wire one_cycle_march;
wire increment_addr;
wire [7:0] start_addr;
wire [7:0] next_array_address;
wire next_upaddr_march;
wire next_downaddr_march;
wire [7:0] stop_addr;
wire [8:0] overflow_addr;
wire [7:0] incr_addr;
wire overflow;
wire [8:0] compare_addr;
wire [7:0] add;
wire [7:0] adj_address;
wire [7:0] mbist_address;
wire increment_march_elem;
wire [1:0] next_data_control;
wire next_address_mix;
wire [3:0] next_march_element;
wire true_data;
wire [7:0] data_pattern;
wire done_counter_reg_scanin;
wire done_counter_reg_scanout;
wire [2:0] done_counter_in;
wire [2:0] done_counter_out;
wire final_msb;
wire cam_msb;
wire cam_rd_en;
wire cam_wr_en;
wire cam_lkup_en;
wire cseq;
wire user_mode_mask_init_reg_scanin;
wire user_mode_mask_init_reg_scanout;
wire user_mode_mask_init_in;
wire user_mode_mask_init;
wire cam_cntl_reg_scanin;
wire cam_cntl_reg_scanout;
wire [15:0] cam_in;
wire [15:0] cam_out;
wire [3:0] ctest;
wire [1:0] crw;
wire [15:0] qual_cam;
wire [3:0] next_ctest;
wire next_cseq;
wire [7:0] next_cam_addr;
wire [1:0] next_crw;
wire add_pipe_reg1_scanin;
wire add_pipe_reg1_scanout;
wire [6:0] add_pipe_reg1_in;
wire [6:0] add_pipe_reg1_out;
wire add_pipe_reg2_scanin;
wire add_pipe_reg2_scanout;
wire [6:0] add_pipe_reg2_in;
wire [6:0] add_pipe_reg2_out;
wire add_pipe_reg3_scanin;
wire add_pipe_reg3_scanout;
wire [6:0] add_pipe_reg3_in;
wire [6:0] add_pipe_reg3_out;
wire add_pipe_reg4_scanin;
wire add_pipe_reg4_scanout;
wire [6:0] add_pipe_reg4_in;
wire [6:0] add_pipe_reg4_out;
wire [6:0] mbist_piped_address;
wire data_pipe_reg1_scanin;
wire data_pipe_reg1_scanout;
wire [7:0] data_pipe_reg1_in;
wire [7:0] data_pipe_out1;
wire data_pipe_reg2_scanin;
wire data_pipe_reg2_scanout;
wire [7:0] data_pipe_reg2_in;
wire [7:0] data_pipe_out2;
wire data_pipe_reg3_scanin;
wire data_pipe_reg3_scanout;
wire [7:0] data_pipe_reg3_in;
wire [7:0] data_pipe_out3;
wire [7:0] piped_wdata;
wire ren_pipe_reg1_scanin;
wire ren_pipe_reg1_scanout;
wire ren_pipe_reg1_in;
wire ren_pipe_out1;
wire ren_pipe_reg2_scanin;
wire ren_pipe_reg2_scanout;
wire ren_pipe_reg2_in;
wire ren_pipe_out2;
wire ren_pipe_reg3_scanin;
wire ren_pipe_reg3_scanout;
wire ren_pipe_reg3_in;
wire ren_pipe_out3;
wire piped_ren;
wire cam_ren_pipe_reg1_scanin;
wire cam_ren_pipe_reg1_scanout;
wire cam_ren_pipe_reg1_in;
wire cam_ren_pipe_out1;
wire cam_ren_pipe_reg2_scanin;
wire cam_ren_pipe_reg2_scanout;
wire cam_ren_pipe_reg2_in;
wire cam_ren_pipe_out2;
wire cam_ren_pipe_reg3_scanin;
wire cam_ren_pipe_reg3_scanout;
wire cam_ren_pipe_reg3_in;
wire cam_ren_pipe_out3;
wire piped_cam_ren;
wire cam_lkup_en_pipe_reg1_scanin;
wire cam_lkup_en_pipe_reg1_scanout;
wire cam_lkup_en_pipe_reg1_in;
wire cam_lkup_en_pipe_out1;
wire cam_lkup_en_pipe_reg2_scanin;
wire cam_lkup_en_pipe_reg2_scanout;
wire cam_lkup_en_pipe_reg2_in;
wire cam_lkup_en_pipe_out2;
wire cam_lkup_en_pipe_reg3_scanin;
wire cam_lkup_en_pipe_reg3_scanout;
wire cam_lkup_en_pipe_reg3_in;
wire cam_lkup_en_pipe_out3;
wire cam_lkup_en_pipe_reg4_scanin;
wire cam_lkup_en_pipe_reg4_scanout;
wire cam_lkup_en_pipe_reg4_in;
wire cam_lkup_en_pipe_out4;
wire piped_cam_lkup_en;
wire ctest_pipe_reg1_scanin;
wire ctest_pipe_reg1_scanout;
wire [2:0] ctest_pipe_reg1_in;
wire [2:0] ctest_pipe_out1;
wire ctest_pipe_reg2_scanin;
wire ctest_pipe_reg2_scanout;
wire [2:0] ctest_pipe_reg2_in;
wire [2:0] ctest_pipe_out2;
wire ctest_pipe_reg3_scanin;
wire ctest_pipe_reg3_scanout;
wire [2:0] ctest_pipe_reg3_in;
wire [2:0] ctest_pipe_out3;
wire ctest_pipe_reg4_scanin;
wire ctest_pipe_reg4_scanout;
wire [2:0] ctest_pipe_reg4_in;
wire [2:0] ctest_pipe_out4;
wire [2:0] ctest_piped4;
wire fail_reg_scanin;
wire fail_reg_scanout;
wire fail_reg_in;
wire fail_reg_out;
wire qual_fail;
wire fail_detect;
wire cam_fail_reg_out;
wire qual_cam_fail;
wire cam_fail_reg_scanin;
wire cam_fail_reg_scanout;
wire cam_fail_reg_in;
wire cam_fail_detect;




// /////////////////////////////////////////////////////////////////////////////
// Outputs
// /////////////////////////////////////////////////////////////////////////////

   output niu_mb5_tcam_cntrl_rd_en;
   output niu_mb5_tcam_cntrl_wr_en;

   output [6:0] niu_mb5_addr;
//   output [7:0] niu_mb5_wdata;    
   output niu_mb5_run;

   output niu_tcu_mbist_fail_5;
   output niu_tcu_mbist_done_5;

   output mb5_scan_out;

   output [199:0] niu_mb5_data_inp;
   output         niu_mb5_pio_sel;
   output         niu_mb5_cam_compare;


// /////////////////////////////////////////////////////////////////////////////
// Inputs
// /////////////////////////////////////////////////////////////////////////////

//   input              iol2clk;
   input              l1clk;
//   input              tcu_scan_en;
   input              mb5_scan_in;
//   input              tcu_pce_ov;             // scan signals
//   input              tcu_clk_stop;
   input              tcu_aclk;
   input              tcu_bclk;
   input              rst;                     // Active high reset!

   input              tcu_niu_mbist_start_5;

   input [199:0]      niu_mb5_msk_dat_out;

   input              tcu_mbist_bisi_en;
   input              tcu_mbist_user_mode;

   input   [6:0]      niu_mb5_cam_haddr;
   input              niu_mb5_cam_valid;  
   input              niu_mb5_rd_vld;     
   input              niu_mb5_cam_hit;


// /////////////////////////////////////////////////////////////////////////////
// Scan Renames
// /////////////////////////////////////////////////////////////////////////////

// assign se     = tcu_scan_en;
// assign pce_ov = tcu_pce_ov;
// assign stop   = tcu_clk_stop;
   assign siclk  = tcu_aclk;
   assign soclk  = tcu_bclk;

   assign reset = ~rst;


////////////////////////////////////////////////////////////////////////////////
// Clock header

// l1clkhdr_ctl_macro clkgen (
//         .l2clk  (iol2clk 			),
//         .l1en   (1'b1			),
//         .l1clk  (l1clk			)
// );
//assign siclk = 1'b0;
//assign soclk = 1'b0;


// /////////////////////////////////////////////////////////////////////////////
//
// MBIST Config Register
//
// /////////////////////////////////////////////////////////////////////////////
//
// A low to high transition on mbist_start will reset and start the engine.  
// mbist_start must remain active high for the duration of MBIST.  
// If mbist_start deasserts the engine will stop but not reset.
// Once MBIST has completed niu_tcu_mbist_done_5 will assert and the fail status
// signals will be valid.  
// To run MBIST again the mbist_start signal must transition low then high.
//
// Loop on Address will disable the address mix function.
//
// /////////////////////////////////////////////////////////////////////////////

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_8 config_reg    (
               .scan_in(config_reg_scanin),
               .scan_out(config_reg_scanout),
               .din      ( config_in[7:0]       ),
               .dout     ( config_out[7:0]      ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));



  assign config_in[0]        =    tcu_niu_mbist_start_5;
  assign config_in[1]        =    config_out[0];
  assign start_transition    =    config_out[0]      &  ~config_out[1];
  assign reset_engine        =    start_transition   |  (mbist_user_loop_mode  &  mbist_done);
//  assign run                 =    config_out[1]      &  (mbist_user_loop_mode | ~mbist_done);
  assign run                 =    config_out[0] & config_out[1]; // 9/19/05 run to follow start only!

  assign config_in[2]        =    start_transition   ?   tcu_mbist_bisi_en  :    config_out[2];
  assign bisi                =    config_out[2];

  assign config_in[3]        =    start_transition   ?   tcu_mbist_user_mode:    config_out[3];
  assign user_mode           =    config_out[3];

  assign config_in[4]        =    config_out[4];
  assign user_data_mode      =    config_out[4];

  assign config_in[5]        =    config_out[5];
  assign user_addr_mode      =    config_out[5];

  assign config_in[6]        =    config_out[6];
  assign user_loop_mode      =    config_out[6];

  assign config_in[7]        =    config_out[7];
  assign ten_n_mode          =    config_out[7];


  assign mbist_user_data_mode =   user_mode & user_data_mode;
  assign mbist_user_addr_mode =   user_mode & user_addr_mode;
  assign mbist_user_loop_mode =   user_mode & user_loop_mode;
  assign mbist_ten_n_mode     =   user_mode & ten_n_mode;


  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_8 user_data_reg    (
                 .scan_in(user_data_reg_scanin),
                 .scan_out(user_data_reg_scanout),
                 .din      ( user_data_in[7:0]       ),
                 .dout     ( user_data_out[7:0]      ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign user_data_in[7:0]    =    user_data_out[7:0];


// Defining User start, stop, and increment addresses.

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_8 user_start_addr_reg    (
                 .scan_in(user_start_addr_reg_scanin),
                 .scan_out(user_start_addr_reg_scanout),
                 .din      ( user_start_addr_in[7:0]  ),
                 .dout     ( user_start_addr[7:0] ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_start_addr_in[7:0]   =    user_start_addr[7:0];

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_8 user_stop_addr_reg    (
                 .scan_in(user_stop_addr_reg_scanin),
                 .scan_out(user_stop_addr_reg_scanout),
                 .din      ( user_stop_addr_in[7:0]  ),
                 .dout     ( user_stop_addr[7:0] ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_stop_addr_in[7:0]   =    user_stop_addr[7:0];


  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_8 user_incr_addr_reg    (
                 .scan_in(user_incr_addr_reg_scanin),
                 .scan_out(user_incr_addr_reg_scanout),
                 .din      ( user_incr_addr_in[7:0]  ),
                 .dout     ( user_incr_addr[7:0] ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_incr_addr_in[7:0]   =    user_incr_addr[7:0];


// user_cam_mode Register
// During user_mode, if user_cam_mode=0, then memBIST (R/W test);
//                   if user_cam_mode=1, then camBIST.

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1 user_cam_mode_reg    (
  	          .scan_in(user_cam_mode_reg_scanin),
  	          .scan_out(user_cam_mode_reg_scanout),
  	          .din      ( user_cam_mode_in       ),
  		      .dout     ( user_cam_mode     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_cam_mode_in    =   user_cam_mode;  

// cambist: user CAM select


  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_4 user_cam_test_select_reg    (
  	          .scan_in(user_cam_test_select_reg_scanin),
  	          .scan_out(user_cam_test_select_reg_scanout),
  	          .din      ( user_cam_test_sel_in[3:0]       ),
  		      .dout     ( user_cam_test_sel[3:0]      ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_cam_test_sel_in[3:0]  =  user_cam_test_sel[3:0];

// Defining user_bisi write and read registers

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1 user_bisi_wr_reg    (
                 .scan_in(user_bisi_wr_reg_scanin),
                 .scan_out(user_bisi_wr_reg_scanout),
                 .din      ( user_bisi_wr_mode_in  ),
                 .dout     ( user_bisi_wr_mode ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_bisi_wr_mode_in     =    user_bisi_wr_mode;

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1 user_bisi_rd_reg    (
                 .scan_in(user_bisi_rd_reg_scanin),
                 .scan_out(user_bisi_rd_reg_scanout),
                 .din      ( user_bisi_rd_mode_in  ),
                 .dout     ( user_bisi_rd_mode ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_bisi_rd_mode_in     =    user_bisi_rd_mode;

  assign mbist_user_bisi_wr_mode  =    user_mode & bisi & user_bisi_wr_mode & ~user_bisi_rd_mode;
//  assign mbist_user_bisi_rd_mode  =    user_mode & bisi & user_bisi_rd_mode & ~user_bisi_wr_mode;

  assign mbist_user_bisi_wr_rd_mode =   user_mode & bisi & 
                                      ((user_bisi_wr_mode & user_bisi_rd_mode) |
                                       (~user_bisi_wr_mode & ~user_bisi_rd_mode));

////////////////////////////////////////////////////////////////////////////////
// Piping start_transition 
////////////////////////////////////////////////////////////////////////////////

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1 start_transition_reg    (
               .scan_in(start_transition_reg_scanin),
               .scan_out(start_transition_reg_scanout),
               .din      ( start_transition ),
               .dout     ( start_transition_piped ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////////////////////////////////////
// Staging run for 3 cycles 
////////////////////////////////////////////////////////////////////////////////

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1 run_reg    (
               .scan_in(run_reg_scanin),
               .scan_out(run_reg_scanout),
               .din      ( run ),
               .dout     ( niu_mb5_run ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//Adding 2 extra pipeline stages to run to delay the start of mbist for 3 cycles.
  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1 run1_reg    (
               .scan_in(run1_reg_scanin),
               .scan_out(run1_reg_scanout),
               .din      ( run1_in ),
               .dout     ( run1_out ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign run1_in = reset_engine        ?   1'b0:      niu_mb5_run;

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1 run2_reg    (
               .scan_in(run2_reg_scanin),
               .scan_out(run2_reg_scanout),
               .din      ( run2_in ),
               .dout     ( run2_out ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign run2_in = reset_engine        ?   1'b0:      run1_out;
  assign run_piped3 = config_out[0] & run2_out & ~msb;

////////////////////////////////////////////////////////////////////////////////
// Creating flop boundaries for the outputs of the mbist
////////////////////////////////////////////////////////////////////////////////

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1 done_reg   (
               .scan_in(done_reg_scanin),
               .scan_out(done_reg_scanout),
               .din      ( mbist_done  ),
               .dout     ( niu_tcu_mbist_done_5 ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1 mbist_fail_reg   (
               .scan_in(mbist_fail_reg_scanin),
               .scan_out(mbist_fail_reg_scanout),
               .din      ( fail  ),
               .dout     ( niu_tcu_mbist_fail_5 ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////////////////////////////////////
// Creating niu_mb5_data_inp
////////////////////////////////////////////////////////////////////////////////
/*  integer i;
  reg [199:0] walk0_data, walk1_data;

  always@(cam_addr[7:0])
    begin
     for(i=0;i<200;i=i+1)
     begin
    	if(i==cam_addr[7:0])
         begin
            walk0_data[i] = 1'b0;
            walk1_data[i] = 1'b1;
         end
        else begin
            walk0_data[i] = 1'b1;
            walk1_data[i] = 1'b0;
         end
     end
   end  
*/
   niu_mb5_msff_ctl_macro__library_a1__reset_1__width_8 walking0_8bit_reg    (
                      .scan_in(walking0_8bit_reg_scanin),
                      .scan_out(walking0_8bit_reg_scanout),
                      .din   ( walking0_8bit_in[7:0]           ),
                      .dout  ( walking0_8bit[7:0]          ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign walking0_8bit_in[7:0] = reset_engine             ?  8'hFE :
//                                (ctest3 | ctest4) & (cam_addr[2:0] == 3'b0)  ?  8'hFE :
             (ctest3 | ctest4) & cseq1 & crw1 & op_hold   ?  {walking0_8bit[6:0], walking0_8bit[7]}:
                                                              walking0_8bit[7:0];

reg [199:0]  walk0_data, walk1_data;

  always@( cam_addr[7:3] or walking0_8bit[7:0] ) begin
    case ( cam_addr[7:3] ) //synopsys parallel_case full_case
    
    5'h00 : begin 
              walk0_data[199:0] = {{192{1'b1}}, walking0_8bit[7:0]};
              walk1_data[199:0] = {{192{1'b0}}, ~walking0_8bit[7:0]};
            end
    5'h01 : begin 
              walk0_data[199:0] = {{184{1'b1}}, walking0_8bit[7:0], {8{1'b1}}};
              walk1_data[199:0] = {{184{1'b0}}, ~walking0_8bit[7:0], {8{1'b0}}};
            end
    5'h02 : begin 
              walk0_data[199:0] = {{176{1'b1}}, walking0_8bit[7:0], {16{1'b1}}};
              walk1_data[199:0] = {{176{1'b0}}, ~walking0_8bit[7:0], {16{1'b0}}};
            end
    5'h03 : begin 
              walk0_data[199:0] = {{168{1'b1}}, walking0_8bit[7:0], {24{1'b1}}};
              walk1_data[199:0] = {{168{1'b0}}, ~walking0_8bit[7:0], {24{1'b0}}};
            end
    5'h04 : begin 
              walk0_data[199:0] = {{160{1'b1}}, walking0_8bit[7:0], {32{1'b1}}};
              walk1_data[199:0] = {{160{1'b0}}, ~walking0_8bit[7:0], {32{1'b0}}};
            end
    5'h05 : begin 
              walk0_data[199:0] = {{152{1'b1}}, walking0_8bit[7:0], {40{1'b1}}};
              walk1_data[199:0] = {{152{1'b0}}, ~walking0_8bit[7:0], {40{1'b0}}};
            end
    5'h06 : begin 
              walk0_data[199:0] = {{144{1'b1}}, walking0_8bit[7:0], {48{1'b1}}};
              walk1_data[199:0] = {{144{1'b0}}, ~walking0_8bit[7:0], {48{1'b0}}};
            end
    5'h07 : begin 
              walk0_data[199:0] = {{136{1'b1}}, walking0_8bit[7:0], {56{1'b1}}};
              walk1_data[199:0] = {{136{1'b0}}, ~walking0_8bit[7:0], {56{1'b0}}};
            end
    5'h08 : begin 
              walk0_data[199:0] = {{128{1'b1}}, walking0_8bit[7:0], {64{1'b1}}};
              walk1_data[199:0] = {{128{1'b0}}, ~walking0_8bit[7:0], {64{1'b0}}};
            end
    5'h09 : begin 
              walk0_data[199:0] = {{120{1'b1}}, walking0_8bit[7:0], {72{1'b1}}};
              walk1_data[199:0] = {{120{1'b0}}, ~walking0_8bit[7:0], {72{1'b0}}};
            end
    5'h0A : begin 
              walk0_data[199:0] = {{112{1'b1}}, walking0_8bit[7:0], {80{1'b1}}};
              walk1_data[199:0] = {{112{1'b0}}, ~walking0_8bit[7:0], {80{1'b0}}};
            end
    5'h0B : begin 
              walk0_data[199:0] = {{104{1'b1}}, walking0_8bit[7:0], {88{1'b1}}};
              walk1_data[199:0] = {{104{1'b0}}, ~walking0_8bit[7:0], {88{1'b0}}};
            end
    5'h0C : begin 
              walk0_data[199:0] = {{96{1'b1}}, walking0_8bit[7:0], {96{1'b1}}};
              walk1_data[199:0] = {{96{1'b0}}, ~walking0_8bit[7:0], {96{1'b0}}};
            end
    5'h0D : begin 
              walk0_data[199:0] = {{88{1'b1}}, walking0_8bit[7:0], {104{1'b1}}};
              walk1_data[199:0] = {{88{1'b0}}, ~walking0_8bit[7:0], {104{1'b0}}};
            end
    5'h0E : begin 
              walk0_data[199:0] = {{80{1'b1}}, walking0_8bit[7:0], {112{1'b1}}};
              walk1_data[199:0] = {{80{1'b0}}, ~walking0_8bit[7:0], {112{1'b0}}};
            end
    5'h0F : begin 
              walk0_data[199:0] = {{72{1'b1}}, walking0_8bit[7:0], {120{1'b1}}};
              walk1_data[199:0] = {{72{1'b0}}, ~walking0_8bit[7:0], {120{1'b0}}};
            end
    5'h10 : begin 
              walk0_data[199:0] = {{64{1'b1}}, walking0_8bit[7:0], {128{1'b1}}};
              walk1_data[199:0] = {{64{1'b0}}, ~walking0_8bit[7:0], {128{1'b0}}};
            end
    5'h11 : begin 
              walk0_data[199:0] = {{56{1'b1}}, walking0_8bit[7:0], {136{1'b1}}};
              walk1_data[199:0] = {{56{1'b0}}, ~walking0_8bit[7:0], {136{1'b0}}};
            end
    5'h12 : begin 
              walk0_data[199:0] = {{48{1'b1}}, walking0_8bit[7:0], {144{1'b1}}};
              walk1_data[199:0] = {{48{1'b0}}, ~walking0_8bit[7:0], {144{1'b0}}};
            end
    5'h13 : begin 
              walk0_data[199:0] = {{40{1'b1}}, walking0_8bit[7:0], {152{1'b1}}};
              walk1_data[199:0] = {{40{1'b0}}, ~walking0_8bit[7:0], {152{1'b0}}};
            end
    5'h14 : begin 
              walk0_data[199:0] = {{32{1'b1}}, walking0_8bit[7:0], {160{1'b1}}};
              walk1_data[199:0] = {{32{1'b0}}, ~walking0_8bit[7:0], {160{1'b0}}};
            end
    5'h15 : begin 
              walk0_data[199:0] = {{24{1'b1}}, walking0_8bit[7:0], {168{1'b1}}};
              walk1_data[199:0] = {{24{1'b0}}, ~walking0_8bit[7:0], {168{1'b0}}};
            end
    5'h16 : begin 
              walk0_data[199:0] = {{16{1'b1}}, walking0_8bit[7:0], {176{1'b1}}};
              walk1_data[199:0] = {{16{1'b0}}, ~walking0_8bit[7:0], {176{1'b0}}};
            end
    5'h17 : begin 
              walk0_data[199:0] = {{8{1'b1}}, walking0_8bit[7:0], {184{1'b1}}};
              walk1_data[199:0] = {{8{1'b0}}, ~walking0_8bit[7:0], {184{1'b0}}};
            end
  default : begin 
              walk0_data[199:0] = { walking0_8bit[7:0], {192{1'b1}}};
              walk1_data[199:0] = {~walking0_8bit[7:0], {192{1'b0}}};
            end
    endcase
  end



  assign niu_mb5_data_inp[199:0] = array_write | array_read                        ? {25{mbist_wdata[7:0]}}: 
                                 ((ctest1 | ctest4 | ctest7) & cseq0) | ctest8     ?  200'b0 :
                         ctest0 | ((ctest2 | ctest3 | ctest5 | ctest6) & cseq0)    ? {200{1'b1}} :
  cseq1 & ( (ctest1 & (crw0|crw1)) | ((ctest2|ctest5) & crw3) | (ctest6 & crw0))   ? {200{1'b1}} :     
  cseq1 & ( (ctest1 & crw3) | ((ctest2|ctest5) & (crw0|crw1)) | (ctest6 & crw2) | 
                                                                (ctest7 & crw0))   ? 200'b0 : 
//                 ctest3 & (cam_addr[7:0] == 8'b0)   ?   {{199{1'b1}},1'b0} : // Start walking0 
//                 ctest4 & (cam_addr[7:0] == 8'b0)   ?   {{199{1'b0}},1'b1} : // Start walking1 
                            ctest3 & cseq1 & crw0   ?   walk0_data[199:0]  :
                            ctest4 & cseq1 & crw0   ?   walk1_data[199:0]  :  200'b0;


// /////////////////////////////////////////////////////////////////////////////
//
// MBIST Control Register
//
// /////////////////////////////////////////////////////////////////////////////

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1 op_hold_reg   (
               .scan_in(op_hold_reg_scanin),
               .scan_out(op_hold_reg_scanout),
               .din      ( op_hold_in  ),
               .dout     ( op_hold ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign  op_hold_in  =  reset_engine           ? 1'b1 :
                         ~run_piped3 & ~cambist ? op_hold :
                         ~op_hold;

   
   niu_mb5_msff_ctl_macro__library_a1__reset_1__width_20 control_reg    (
                      .scan_in(control_reg_scanin),
                      .scan_out(control_reg_scanout),
                      .din   ( control_in[19:0]           ),
                      .dout  ( control_out[19:0]          ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign   msb                       = ~bisi & user_mode & user_cam_mode ? 1'b1 : control_out[19];
  assign   bisi_wr_rd       = (bisi & ~user_mode) | mbist_user_bisi_wr_rd_mode ? control_out[18] : 1'b1;
  assign   data_control[1:0]         =     control_out[17:16];
  assign   address_mix           =(bisi | mbist_user_addr_mode) ?  1'b0:   control_out[15];
  assign   march_element[3:0]        =     control_out[14:11];
  assign   array_address[7:0]        =     upaddress_march     ?  control_out[10:3] : ~control_out[10:3];
  assign   read_write_control[2:0]   =     ~five_cycle_march   ?   {2'b11,  control_out[0]} :
                                                                   control_out[2:0];


  assign   control_in[2:0]           =     reset_engine        ?   3'b0:
                                         ~run_piped3 | op_hold ?   control_out[2:0]:
     (five_cycle_march && (read_write_control[2:0] == 3'b100)) ?   3'b000:
      (one_cycle_march && (read_write_control[2:0] == 3'b110)) ?   3'b000:
                                                                   control_out[2:0]   +  3'b001;

  assign   increment_addr            =   ( (five_cycle_march && (read_write_control[2:0] == 3'b100)) || 
                                            (one_cycle_march && (read_write_control[2:0] == 3'b110)) ||
                                            (read_write_control[2:0] == 3'b111) ) & ~op_hold;

// start_transition_piped was added to have the correct start_addr at the start
// of mbist during user_addr_mode
  assign   control_in[10:3]  =     start_transition_piped || reset_engine ?  start_addr[7:0]:
                                        ~run_piped3 || ~increment_addr   ?  control_out[10:3]:
                                                                           next_array_address[7:0];

  assign   next_array_address[7:0]   =    next_upaddr_march      ?  start_addr[7:0]:
                                          next_downaddr_march    ?  ~stop_addr[7:0]:
                                                                   (overflow_addr[7:0]);     // array_addr + incr_addr

  assign   start_addr[7:0]           =    mbist_user_addr_mode   ?   user_start_addr[7:0] : 8'h00;
  assign   stop_addr[7:0]            =    mbist_user_addr_mode   ?   user_stop_addr[7:0]  : 8'hFF;
  assign   incr_addr[7:0]            =    mbist_user_addr_mode   ?   user_incr_addr[7:0]  : 8'h01;

  assign   overflow_addr[8:0]        =    {1'b0,control_out[10:3]} + {1'b0,incr_addr[7:0]};
  assign   overflow                  =    compare_addr[8:0] < overflow_addr[8:0];

  assign   compare_addr[8:0]         =    upaddress_march       ?  {1'b0, stop_addr[7:0]} :
                                                                   {1'b0, ~start_addr[7:0]}; 

  assign   next_upaddr_march         =   ( (march_element[3:0] == 4'h0) || (march_element[3:0] == 4'h1) || 
                                           (march_element[3:0] == 4'h6) || (march_element[3:0] == 4'h5) || 
                                           (march_element[3:0] == 4'h8) ) && overflow; 
   
  assign   next_downaddr_march       =   ( (march_element[3:0] == 4'h2) || (march_element[3:0] == 4'h7) ||
                                           (march_element[3:0] == 4'h3) || (march_element[3:0] == 4'h4) ) && 
                                            overflow; 
   

   
  assign   add[7:0]                  =     five_cycle_march && ( (read_write_control[2:0] == 3'h1) || 
                                                                 (read_write_control[2:0] == 3'h3)) ?   
                                                                 adj_address[7:0]:    array_address[7:0];

  assign   adj_address[7:0]          =     { array_address[7:1], ~array_address[0] };  // Since all addresses are row addresses! Verify!!!!

  assign   mbist_address[7:0]        =     address_mix         ?  {add[7],add[0],add[6],add[5],add[4],add[3],add[2],add[1]}:
                                                                    add[7:0];

// Definition of the rest of the control register  
  assign   increment_march_elem      =     increment_addr && overflow;

  assign   control_in[19:11]         =     reset_engine        ?   9'b0:
                                          ~run_piped3          ?   control_out[19:11]:
                                           {msb, bisi_wr_rd, next_data_control[1:0], next_address_mix, next_march_element[3:0]}
                                           + {8'b0, increment_march_elem};                        

  assign   next_data_control[1:0]    =     (bisi || (mbist_user_data_mode && (data_control[1:0] == 2'b00)))  ?   2'b11:
                                                                                                                 data_control[1:0];

  assign   next_address_mix          =     bisi | mbist_user_addr_mode ?  1'b1 : address_mix;

// Modified next_march_element to remove a possible long path.
// Incorporated ten_n_mode!  
  assign   next_march_element[3:0]   =     ( bisi || 
                                             (mbist_ten_n_mode && (march_element[3:0] == 4'b0101)) || 
                                          ((march_element[3:0] == 4'b1000) && (read_write_control[2:0] == 3'b100)) ) 
                                            && overflow & ~op_hold ?   4'b1111:  march_element[3:0];

//  assign   next_march_element[3:0]   =     (bisi || ((march_element[3:0] == 4'b1000) && (read_write_control[2:0] == 3'b100)) ) 
//                                            && overflow ?   4'b1111:  march_element[3:0];


  assign   array_write               =     ~run_piped3         ?    1'b0:
                                           five_cycle_march    ?  (read_write_control[2:0] == 3'h0) || 
                                                                  (read_write_control[2:0] == 3'h1) ||
                                                                  (read_write_control[2:0] == 3'h4): 
                        (~five_cycle_march & ~one_cycle_march) ?  read_write_control[0]:
     ( ((march_element[3:0] == 4'h0) & (~bisi || ~bisi_wr_rd || mbist_user_bisi_wr_mode)) || (march_element[3:0] == 4'h7));

  assign   array_read                =    ~array_write        &&  run_piped3;     //  &&  ~initialize;
//  assign   mbist_done                =     msb;

  assign   mbist_wdata[7:0]          =     true_data           ?   data_pattern[7:0]:      ~data_pattern[7:0];


  assign   five_cycle_march          =    (march_element[3:0] == 4'h6)    ||  (march_element[3:0] == 4'h8);
  assign   one_cycle_march           =    (march_element[3:0] == 4'h0)    ||  (march_element[3:0] == 4'h5) || 
                                          (march_element[3:0] == 4'h7);

  assign   upaddress_march           =    (march_element[3:0] == 4'h0)    ||  (march_element[3:0] == 4'h1) ||
                                          (march_element[3:0] == 4'h2)    ||  (march_element[3:0] == 4'h6) ||
                                          (march_element[3:0] == 4'h7);

//  assign   true_data                 =     read_write_control[1] ^ ~march_element[0];

  assign   true_data                 =     (five_cycle_march && (march_element[3:0] == 4'h6)) ? 
                                           ((read_write_control[2:0] == 3'h0) || (read_write_control[2:0] == 3'h2)):
                                           (five_cycle_march && (march_element[3:0] == 4'h8)) ? 
                                           ((read_write_control[2:0] == 3'h1) || 
                                            (read_write_control[2:0] == 3'h3) || (read_write_control[2:0] == 3'h4)):
                                            one_cycle_march   ?   (march_element[3:0] == 4'h7):
                                            ~(read_write_control[0] ^ march_element[0]);                                

  
  assign   data_pattern[7:0]         =    (bisi & mbist_user_data_mode) ?   ~user_data_out[7:0]:
                                           mbist_user_data_mode         ?    user_data_out[7:0]:
                                           bisi                         ?    8'hFF:  // true_data function will invert to 8'h00
                                          (data_control[1:0] == 2'h0)   ?    8'hAA:
                                          (data_control[1:0] == 2'h1)   ?    8'h99:
                                          (data_control[1:0] == 2'h2)   ?    8'hCC:
                                                                             8'h00;
   

/////////////////////////////////////////////////////////////////////////
// Creating the mbist_done signal
/////////////////////////////////////////////////////////////////////////
// Delaying mbist_done 8 clock signals after msb going high, to provide
// a generic solution for done going high after the last fail has come back!

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_3 done_counter_reg    (
               .scan_in(done_counter_reg_scanin),
               .scan_out(done_counter_reg_scanout),
               .din      ( done_counter_in[2:0]       ),
               .dout     ( done_counter_out[2:0]      ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// config_out[1] is AND'ed to force mbist_done low 2 cycles after mbist_start
// goes low.  

  assign mbist_done = (&done_counter_out[2:0] == 1'b1) & config_out[1];
  assign done_counter_in[2:0] = reset_engine       ?   3'b000:    
           final_msb & ~mbist_done & config_out[1] ?   done_counter_out[2:0] + 3'b001:
                                                       done_counter_out[2:0];

  assign final_msb = bisi ? msb : cam_msb;

/////////////////////////////////////////////////////////////////////////
// Creating the select lines and enable signals.
/////////////////////////////////////////////////////////////////////////

  assign niu_mb5_tcam_cntrl_rd_en = array_read | cam_rd_en; 
  assign niu_mb5_tcam_cntrl_wr_en = array_write | cam_wr_en; 

  assign niu_mb5_cam_compare      = cam_lkup_en; 

  assign niu_mb5_pio_sel          = cambist & (ctest3 | ctest4) & cseq ? 1'b0 : // 9/19/05 Forcing pio_sel to 0 during walk0 or walk1.
                                    cambist ? cam_addr[7]   : mbist_address[7];
  assign niu_mb5_addr[6:0]        = cambist ? cam_addr[6:0] : mbist_address[6:0];

//  assign niu_mb5_wdata[7:0]       = mbist_wdata[7:0];   // Keep it temporarily!


// /////////////////////////////////////////////////////////////////////////////
// CAM BIST:
// /////////////////////////////////////////////////////////////////////////////

   niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1 user_mode_mask_init_reg    (
                 .scan_in(user_mode_mask_init_reg_scanin),
                 .scan_out(user_mode_mask_init_reg_scanout),
                 .din      ( user_mode_mask_init_in ),
                 .dout     ( user_mode_mask_init    ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

   assign user_mode_mask_init_in = reset_engine                                  ?  1'b0 :  
                                   user_mode & ctest0 & (cam_addr[7:0] == 8'hFF) & ~op_hold ?  1'b1 : 
                                   user_mode_mask_init ;

   niu_mb5_msff_ctl_macro__library_a1__reset_1__width_16 cam_cntl_reg    (
                 .scan_in(cam_cntl_reg_scanin),
                 .scan_out(cam_cntl_reg_scanout),
                 .din      ( cam_in[15:0]       ),
                 .dout     ( cam_out[15:0]      ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

   assign cam_msb                =   user_mode & ~user_cam_mode & msb ? 1'b1 : cam_out[15];    


   assign ctest[3:0]             =   user_mode & (|user_cam_test_sel[2:0] != 1'b0) & 
                                     ~user_mode_mask_init                             ? 4'b0000 : 
                                     user_mode                                        ? user_cam_test_sel[3:0] :   
                                     cam_out[14:11];    

   assign cseq                   =   cam_out[10];

//msb address selects pio_sel   
   assign cam_addr[7:0]          =   (ctest0 | ctest8) | ((ctest5 | ctest7) & cseq1)  ?  
                                                                 {1'b1, cam_out[8:2]} : cam_out[9:2];  
                                                                                         
   assign crw[1:0]               =       cseq0        ? 2'b11:
                                                        cam_out[1:0];    // read write control


   assign ctest0  =  ~(  ctest[3] |  ctest[2] |  ctest[1] |  ctest[0]);   // ^[W(m,1)]
   assign ctest1  =  ~(  ctest[3] |  ctest[2] |  ctest[1] | ~ctest[0]);   // ^[W(d,0)]; ^[W(d,1),C1,NOOP,W(d,0)]
   assign ctest2  =  ~(  ctest[3] |  ctest[2] | ~ctest[1] |  ctest[0]);   // ^[W(d,1)]; ^[W(d,0),C0,NOOP,W(d,1)] 
   assign ctest3  =  ~(  ctest[3] |  ctest[2] | ~ctest[1] | ~ctest[0]);   // ^[W(d,1)]; >(C(wk0),NOOP)
   assign ctest4  =  ~(  ctest[3] | ~ctest[2] |  ctest[1] |  ctest[0]);   // ^[W(d,0)]; >(C(wk1),NOOP)
   assign ctest5  =  ~(  ctest[3] | ~ctest[2] |  ctest[1] | ~ctest[0]);   // ^[W(d,1)]; ^[W(m,0),C0,NOOP,W(m,1)] 
                                                                          //  With mask,opposite data should still match! 
   assign ctest6  =  ~(  ctest[3] | ~ctest[2] | ~ctest[1] |  ctest[0]);   // ^[W(d,1)]; ^[C1,NOOP,W(d,0)]
                                                                          // Testing priority encoder; hit_addr = current_addr
   assign ctest7  =  ~(  ctest[3] | ~ctest[2] | ~ctest[1] | ~ctest[0]);   // ^[W(d,0)]; ^[{C0,R(m,1)},NOOP]
                                                                          // Testing compare & read collision; Read should happen! haddr=0!
   assign ctest8  =  ~( ~ctest[3] |  ctest[2] |  ctest[1] |  ctest[0]);   // ^[W(m,0)]

   assign cseq0   = ~cseq;
   assign cseq1   =  cseq;

   assign crw0    = ~( crw[1] |  crw[0]);
   assign crw1    = ~( crw[1] | ~crw[0]);
   assign crw2    = ~(~crw[1] |  crw[0]);
   assign crw3    = ~(~crw[1] | ~crw[0]);


   assign cam_wr_en   =  cambist ?  cseq0 | 
                                  (( (ctest1 | ctest2 | ctest5) & cseq1 ) &  (crw0 | crw3)) | 
                                  ((  ctest6                    & cseq1 ) &   crw2        ) : 1'b0;

   assign cam_lkup_en =  cambist ? ( (ctest1 | ctest2 | ctest5) & cseq1 & crw1 ) |
                                   ( (ctest3 | ctest4 | ctest7) & cseq1 & crw0 ) |
                                   (  ctest6                    & cseq1 & crw0 ) : 1'b0;

   assign cam_rd_en   =  cambist ?  ctest7 & cseq1 & crw0: 1'b0;


   assign qual_cam[15:0] = {cam_msb,
              			    next_ctest[3:0],
              			    next_cseq,
                            next_cam_addr[7:0],
			                next_crw[1:0]};

   assign cam_in[15:0] =   reset_engine      ? 16'b0:                    // set zero
	                      cambist & ~op_hold ? qual_cam[15:0] + 16'h1:   // increment
	                                           qual_cam[15:0];           // save value


   assign next_ctest[3:0] = user_mode & (ctest[3:0] == user_cam_test_sel[3:0])  ? 4'b1111 :
                               ctest8 & (cam_addr[7:0] == 8'hFF) & ~op_hold     ? 4'b1111 :
                                                                                  cam_out[14:11];

   assign next_cseq       = (ctest0 | ctest8) & (cam_addr[7:0] == 8'hFF)  & ~op_hold ? 1'b1 : cseq;

   assign next_cam_addr[7:0] = ( ((~ctest0 & ~ctest8) & cseq0) | 
                               ((((ctest1 | ctest2) & crw3) | (ctest6 & crw2)) & cseq1) ) & 
                                  (cam_addr[7:0] == 8'h7F) & ~op_hold  ? 8'hFF     :
                               (ctest3 | ctest4) & cseq1 & crw1 &
                               (cam_addr[7:0] == 8'hC7)    & ~op_hold  ? 8'hFF : cam_addr[7:0];

   assign next_crw[1:0]      =  ctest6                    & cseq1 & crw2 & ~op_hold ? 2'b11 : 
                               (ctest3 | ctest4 | ctest7) & cseq1 & crw1 & ~op_hold ? 2'b11 : crw[1:0];

// Defining cambist mode of operation!

   assign cambist            = ~bisi & run2_out & msb & ~cam_msb;


// /////////////////////////////////////////////////////////////////////////////
// Pipeline for Address, wdata, and Read_en
// /////////////////////////////////////////////////////////////////////////////

// /////////////////////////////////////////////////////////////////////////////
// Pipeline for Address
// /////////////////////////////////////////////////////////////////////////////

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_7 add_pipe_reg1    (
                   .scan_in(add_pipe_reg1_scanin),
                   .scan_out(add_pipe_reg1_scanout),
                   .din      ( add_pipe_reg1_in[6:0]     ),
                   .dout     ( add_pipe_reg1_out[6:0]        ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_7 add_pipe_reg2    (
                   .scan_in(add_pipe_reg2_scanin),
                   .scan_out(add_pipe_reg2_scanout),
                   .din      ( add_pipe_reg2_in[6:0]    ),
                   .dout     ( add_pipe_reg2_out[6:0]    ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_7 add_pipe_reg3    (
                   .scan_in(add_pipe_reg3_scanin),
                   .scan_out(add_pipe_reg3_scanout),
                   .din      ( add_pipe_reg3_in[6:0]    ),
                   .dout     ( add_pipe_reg3_out[6:0]    ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_7 add_pipe_reg4    (
                   .scan_in(add_pipe_reg4_scanin),
                   .scan_out(add_pipe_reg4_scanout),
                   .din      ( add_pipe_reg4_in[6:0]    ),
                   .dout     ( add_pipe_reg4_out[6:0]    ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign add_pipe_reg1_in[6:0]		=	 reset_engine	 ?    7'h00:  cam_addr[6:0];
  assign add_pipe_reg2_in[6:0]		=	 reset_engine	 ?    7'h00:  add_pipe_reg1_out[6:0];
  assign add_pipe_reg3_in[6:0]		=	 reset_engine	 ?    7'h00:  add_pipe_reg2_out[6:0];
  assign add_pipe_reg4_in[6:0]		=	 reset_engine	 ?    7'h00:  add_pipe_reg3_out[6:0];
  assign mbist_piped_address[6:0]   =    add_pipe_reg4_out[6:0];


// /////////////////////////////////////////////////////////////////////////////
// Pipeline for wdata
// /////////////////////////////////////////////////////////////////////////////

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_8  data_pipe_reg1   (
               .scan_in(data_pipe_reg1_scanin),
               .scan_out(data_pipe_reg1_scanout),
               .din        ( data_pipe_reg1_in[7:0]  ),
               .dout       ( data_pipe_out1[7:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_8  data_pipe_reg2   (
               .scan_in(data_pipe_reg2_scanin),
               .scan_out(data_pipe_reg2_scanout),
               .din        ( data_pipe_reg2_in[7:0]  ),
               .dout       ( data_pipe_out2[7:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_8  data_pipe_reg3   (
               .scan_in(data_pipe_reg3_scanin),
               .scan_out(data_pipe_reg3_scanout),
               .din        ( data_pipe_reg3_in[7:0]  ),
               .dout       ( data_pipe_out3[7:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign data_pipe_reg1_in[7:0]   =  reset_engine    ?    8'h00:      mbist_wdata[7:0];
  assign data_pipe_reg2_in[7:0]   =  reset_engine    ?    8'h00:      data_pipe_out1[7:0];
  assign data_pipe_reg3_in[7:0]   =  reset_engine    ?    8'h00:      data_pipe_out2[7:0];
  assign piped_wdata[7:0]         =  data_pipe_out3[7:0];

// /////////////////////////////////////////////////////////////////////////////
// Pipeline for Read_en
// /////////////////////////////////////////////////////////////////////////////

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1  ren_pipe_reg1   (
               .scan_in(ren_pipe_reg1_scanin),
               .scan_out(ren_pipe_reg1_scanout),
               .din        ( ren_pipe_reg1_in  ),
               .dout       ( ren_pipe_out1     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1  ren_pipe_reg2   (
               .scan_in(ren_pipe_reg2_scanin),
               .scan_out(ren_pipe_reg2_scanout),
               .din        ( ren_pipe_reg2_in  ),
               .dout       ( ren_pipe_out2     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1  ren_pipe_reg3   (
               .scan_in(ren_pipe_reg3_scanin),
               .scan_out(ren_pipe_reg3_scanout),
               .din        ( ren_pipe_reg3_in  ),
               .dout       ( ren_pipe_out3     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign ren_pipe_reg1_in   =  reset_engine    ?    1'b0:      array_read & op_hold;
  assign ren_pipe_reg2_in   =  reset_engine    ?    1'b0:      ren_pipe_out1;
  assign ren_pipe_reg3_in   =  reset_engine    ?    1'b0:      ren_pipe_out2;
  assign piped_ren          =  ren_pipe_out3;

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1  cam_ren_pipe_reg1   (
               .scan_in(cam_ren_pipe_reg1_scanin),
               .scan_out(cam_ren_pipe_reg1_scanout),
               .din        ( cam_ren_pipe_reg1_in  ),
               .dout       ( cam_ren_pipe_out1     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1  cam_ren_pipe_reg2   (
               .scan_in(cam_ren_pipe_reg2_scanin),
               .scan_out(cam_ren_pipe_reg2_scanout),
               .din        ( cam_ren_pipe_reg2_in  ),
               .dout       ( cam_ren_pipe_out2     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1  cam_ren_pipe_reg3   (
               .scan_in(cam_ren_pipe_reg3_scanin),
               .scan_out(cam_ren_pipe_reg3_scanout),
               .din        ( cam_ren_pipe_reg3_in  ),
               .dout       ( cam_ren_pipe_out3     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign cam_ren_pipe_reg1_in   =  reset_engine    ?    1'b0:      cam_rd_en & op_hold;
  assign cam_ren_pipe_reg2_in   =  reset_engine    ?    1'b0:      cam_ren_pipe_out1;
  assign cam_ren_pipe_reg3_in   =  reset_engine    ?    1'b0:      cam_ren_pipe_out2;
  assign piped_cam_ren          =  cam_ren_pipe_out3;

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1  cam_lkup_en_pipe_reg1   (
               .scan_in(cam_lkup_en_pipe_reg1_scanin),
               .scan_out(cam_lkup_en_pipe_reg1_scanout),
               .din        ( cam_lkup_en_pipe_reg1_in  ),
               .dout       ( cam_lkup_en_pipe_out1     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1  cam_lkup_en_pipe_reg2   (
               .scan_in(cam_lkup_en_pipe_reg2_scanin),
               .scan_out(cam_lkup_en_pipe_reg2_scanout),
               .din        ( cam_lkup_en_pipe_reg2_in  ),
               .dout       ( cam_lkup_en_pipe_out2     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1  cam_lkup_en_pipe_reg3   (
               .scan_in(cam_lkup_en_pipe_reg3_scanin),
               .scan_out(cam_lkup_en_pipe_reg3_scanout),
               .din        ( cam_lkup_en_pipe_reg3_in  ),
               .dout       ( cam_lkup_en_pipe_out3     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1  cam_lkup_en_pipe_reg4   (
               .scan_in(cam_lkup_en_pipe_reg4_scanin),
               .scan_out(cam_lkup_en_pipe_reg4_scanout),
               .din        ( cam_lkup_en_pipe_reg4_in  ),
               .dout       ( cam_lkup_en_pipe_out4     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign cam_lkup_en_pipe_reg1_in   =  reset_engine    ?    1'b0:      cam_lkup_en & op_hold;
  assign cam_lkup_en_pipe_reg2_in   =  reset_engine    ?    1'b0:      cam_lkup_en_pipe_out1;
  assign cam_lkup_en_pipe_reg3_in   =  reset_engine    ?    1'b0:      cam_lkup_en_pipe_out2;
  assign cam_lkup_en_pipe_reg4_in   =  reset_engine    ?    1'b0:      cam_lkup_en_pipe_out3;
  assign piped_cam_lkup_en          =  cam_lkup_en_pipe_out4;

// ctest
  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_3  ctest_pipe_reg1   (
               .scan_in(ctest_pipe_reg1_scanin),
               .scan_out(ctest_pipe_reg1_scanout),
               .din        ( ctest_pipe_reg1_in[2:0]  ),
               .dout       ( ctest_pipe_out1[2:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_3  ctest_pipe_reg2   (
               .scan_in(ctest_pipe_reg2_scanin),
               .scan_out(ctest_pipe_reg2_scanout),
               .din        ( ctest_pipe_reg2_in[2:0]  ),
               .dout       ( ctest_pipe_out2[2:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_3  ctest_pipe_reg3   (
               .scan_in(ctest_pipe_reg3_scanin),
               .scan_out(ctest_pipe_reg3_scanout),
               .din        ( ctest_pipe_reg3_in[2:0]  ),
               .dout       ( ctest_pipe_out3[2:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_3  ctest_pipe_reg4   (
               .scan_in(ctest_pipe_reg4_scanin),
               .scan_out(ctest_pipe_reg4_scanout),
               .din        ( ctest_pipe_reg4_in[2:0]  ),
               .dout       ( ctest_pipe_out4[2:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign ctest_pipe_reg1_in[2:0]   =  reset_engine    ?    3'b00:      ctest[2:0];
  assign ctest_pipe_reg2_in[2:0]   =  reset_engine    ?    3'b00:      ctest_pipe_out1[2:0];
  assign ctest_pipe_reg3_in[2:0]   =  reset_engine    ?    3'b00:      ctest_pipe_out2[2:0];
  assign ctest_pipe_reg4_in[2:0]   =  reset_engine    ?    3'b00:      ctest_pipe_out3[2:0];

  assign ctest_piped4[2:0]  =  ctest_pipe_out4[2:0];


// /////////////////////////////////////////////////////////////////////////////
// Fail Detection
// /////////////////////////////////////////////////////////////////////////////

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1 fail_reg    (
                   .scan_in(fail_reg_scanin),
                   .scan_out(fail_reg_scanout),
                   .din      ( fail_reg_in  ),
                   .dout     ( fail_reg_out  ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign    fail_reg_in      =   reset_engine      ?    1'b0 :  qual_fail |  fail_reg_out;
  assign    qual_fail        =   fail_detect;    
  assign    fail_detect		 =  (({25{piped_wdata[7:0]}} != niu_mb5_msk_dat_out[199:0]) | ~niu_mb5_rd_vld) && piped_ren;

  assign    fail             =   mbist_done ?  (fail_reg_out | cam_fail_reg_out) : 
                                                 qual_fail | qual_cam_fail;

// CAM Fail

  niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1 cam_fail_reg    (
                   .scan_in(cam_fail_reg_scanin),
                   .scan_out(cam_fail_reg_scanout),
                   .din      ( cam_fail_reg_in  ),
                   .dout     ( cam_fail_reg_out  ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign    cam_fail_reg_in  =   reset_engine      ?    1'b0 :  qual_cam_fail |  cam_fail_reg_out;

  assign    qual_cam_fail    =   cam_fail_detect;    

  assign    cam_fail_detect  = (( ctest_piped4[2:0] == 3'b001 ) | ( ctest_piped4[2:0] == 3'b010 ) |
                                ( ctest_piped4[2:0] == 3'b101 ) | ( ctest_piped4[2:0] == 3'b110 ) ) ?
          ( (mbist_piped_address[6:0] != niu_mb5_cam_haddr[6:0]) | ~niu_mb5_cam_valid |
                                               ~niu_mb5_cam_hit ) &  piped_cam_lkup_en              :
                                                                  ( ctest_piped4[2:0] == 3'b111 )   ?
        ( ((niu_mb5_cam_haddr[6:0] != 7'b0) | ~niu_mb5_cam_valid |
             ~niu_mb5_cam_hit) & piped_cam_lkup_en ) | 
        ( ((niu_mb5_msk_dat_out[199:0] != {200{1'b1}}) | ~niu_mb5_rd_vld) & piped_cam_ren )         :
          ( (niu_mb5_cam_haddr[6:0] != 7'b0) | niu_mb5_cam_hit | ~niu_mb5_cam_valid ) & piped_cam_lkup_en;


supply0 vss; // <- port for ground
supply1 vdd; // <- port for power 
// /////////////////////////////////////////////////////////////////////////////
// fixscan start:
assign config_reg_scanin         = mb5_scan_in                  ;
assign user_data_reg_scanin      = config_reg_scanout       ;
assign user_start_addr_reg_scanin = user_data_reg_scanout    ;
assign user_stop_addr_reg_scanin = user_start_addr_reg_scanout;
assign user_incr_addr_reg_scanin = user_stop_addr_reg_scanout;
assign user_cam_mode_reg_scanin  = user_incr_addr_reg_scanout;
assign user_cam_test_select_reg_scanin = user_cam_mode_reg_scanout;
assign user_bisi_wr_reg_scanin   = user_cam_test_select_reg_scanout;
assign user_bisi_rd_reg_scanin   = user_bisi_wr_reg_scanout ;
assign start_transition_reg_scanin = user_bisi_rd_reg_scanout ;
assign run_reg_scanin            = start_transition_reg_scanout;
assign run1_reg_scanin           = run_reg_scanout          ;
assign run2_reg_scanin           = run1_reg_scanout         ;
assign done_reg_scanin           = run2_reg_scanout         ;
assign mbist_fail_reg_scanin     = done_reg_scanout         ;
assign walking0_8bit_reg_scanin  = mbist_fail_reg_scanout   ;
assign op_hold_reg_scanin        = walking0_8bit_reg_scanout;
assign control_reg_scanin        = op_hold_reg_scanout      ;
assign done_counter_reg_scanin   = control_reg_scanout      ;
assign user_mode_mask_init_reg_scanin = done_counter_reg_scanout ;
assign cam_cntl_reg_scanin       = user_mode_mask_init_reg_scanout;
assign add_pipe_reg1_scanin      = cam_cntl_reg_scanout     ;
assign add_pipe_reg2_scanin      = add_pipe_reg1_scanout    ;
assign add_pipe_reg3_scanin      = add_pipe_reg2_scanout    ;
assign add_pipe_reg4_scanin      = add_pipe_reg3_scanout    ;
assign data_pipe_reg1_scanin     = add_pipe_reg4_scanout    ;
assign data_pipe_reg2_scanin     = data_pipe_reg1_scanout   ;
assign data_pipe_reg3_scanin     = data_pipe_reg2_scanout   ;
assign ren_pipe_reg1_scanin      = data_pipe_reg3_scanout   ;
assign ren_pipe_reg2_scanin      = ren_pipe_reg1_scanout    ;
assign ren_pipe_reg3_scanin      = ren_pipe_reg2_scanout    ;
assign cam_ren_pipe_reg1_scanin  = ren_pipe_reg3_scanout    ;
assign cam_ren_pipe_reg2_scanin  = cam_ren_pipe_reg1_scanout;
assign cam_ren_pipe_reg3_scanin  = cam_ren_pipe_reg2_scanout;
assign cam_lkup_en_pipe_reg1_scanin = cam_ren_pipe_reg3_scanout;
assign cam_lkup_en_pipe_reg2_scanin = cam_lkup_en_pipe_reg1_scanout;
assign cam_lkup_en_pipe_reg3_scanin = cam_lkup_en_pipe_reg2_scanout;
assign cam_lkup_en_pipe_reg4_scanin = cam_lkup_en_pipe_reg3_scanout;
assign ctest_pipe_reg1_scanin    = cam_lkup_en_pipe_reg4_scanout;
assign ctest_pipe_reg2_scanin    = ctest_pipe_reg1_scanout  ;
assign ctest_pipe_reg3_scanin    = ctest_pipe_reg2_scanout  ;
assign ctest_pipe_reg4_scanin    = ctest_pipe_reg3_scanout  ;
assign fail_reg_scanin           = ctest_pipe_reg4_scanout  ;
assign cam_fail_reg_scanin       = fail_reg_scanout         ;
assign mb5_scan_out              = cam_fail_reg_scanout     ;
// fixscan end:
endmodule
// /////////////////////////////////////////////////////////////////////////////






// any PARAMS parms go into naming of macro

module niu_mb5_msff_ctl_macro__library_a1__reset_1__width_8 (
  din, 
  reset, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [7:1] sout;

  input [7:0] din;
  input reset;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0] & {8 {reset}};









    







cl_a1_msff_syrst_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0]),
.si(sout[1]),
.so(scan_out),
.reset(reset),
.q(dout[0])
);
cl_a1_msff_syrst_4x d0_1 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1]),
.si(sout[2]),
.so(sout[1]),
.reset(reset),
.q(dout[1])
);
cl_a1_msff_syrst_4x d0_2 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2]),
.si(sout[3]),
.so(sout[2]),
.reset(reset),
.q(dout[2])
);
cl_a1_msff_syrst_4x d0_3 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3]),
.si(sout[4]),
.so(sout[3]),
.reset(reset),
.q(dout[3])
);
cl_a1_msff_syrst_4x d0_4 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4]),
.si(sout[5]),
.so(sout[4]),
.reset(reset),
.q(dout[4])
);
cl_a1_msff_syrst_4x d0_5 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5]),
.si(sout[6]),
.so(sout[5]),
.reset(reset),
.q(dout[5])
);
cl_a1_msff_syrst_4x d0_6 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6]),
.si(sout[7]),
.so(sout[6]),
.reset(reset),
.q(dout[6])
);
cl_a1_msff_syrst_4x d0_7 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7]),
.si(scan_in),
.so(sout[7]),
.reset(reset),
.q(dout[7])
);




endmodule













// any PARAMS parms go into naming of macro

module niu_mb5_msff_ctl_macro__library_a1__reset_1__width_1 (
  din, 
  reset, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input reset;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0] & {1 {reset}};









    







cl_a1_msff_syrst_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0]),
.si(scan_in),
.so(scan_out),
.reset(reset),
.q(dout[0])
);




endmodule













// any PARAMS parms go into naming of macro

module niu_mb5_msff_ctl_macro__library_a1__reset_1__width_4 (
  din, 
  reset, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [3:1] sout;

  input [3:0] din;
  input reset;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0] & {4 {reset}};









    







cl_a1_msff_syrst_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0]),
.si(sout[1]),
.so(scan_out),
.reset(reset),
.q(dout[0])
);
cl_a1_msff_syrst_4x d0_1 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1]),
.si(sout[2]),
.so(sout[1]),
.reset(reset),
.q(dout[1])
);
cl_a1_msff_syrst_4x d0_2 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2]),
.si(sout[3]),
.so(sout[2]),
.reset(reset),
.q(dout[2])
);
cl_a1_msff_syrst_4x d0_3 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3]),
.si(scan_in),
.so(sout[3]),
.reset(reset),
.q(dout[3])
);




endmodule













// any PARAMS parms go into naming of macro

module niu_mb5_msff_ctl_macro__library_a1__reset_1__width_20 (
  din, 
  reset, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [19:0] fdin;
wire [19:1] sout;

  input [19:0] din;
  input reset;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [19:0] dout;
  output scan_out;
assign fdin[19:0] = din[19:0] & {20 {reset}};









    







cl_a1_msff_syrst_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0]),
.si(sout[1]),
.so(scan_out),
.reset(reset),
.q(dout[0])
);
cl_a1_msff_syrst_4x d0_1 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1]),
.si(sout[2]),
.so(sout[1]),
.reset(reset),
.q(dout[1])
);
cl_a1_msff_syrst_4x d0_2 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2]),
.si(sout[3]),
.so(sout[2]),
.reset(reset),
.q(dout[2])
);
cl_a1_msff_syrst_4x d0_3 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3]),
.si(sout[4]),
.so(sout[3]),
.reset(reset),
.q(dout[3])
);
cl_a1_msff_syrst_4x d0_4 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4]),
.si(sout[5]),
.so(sout[4]),
.reset(reset),
.q(dout[4])
);
cl_a1_msff_syrst_4x d0_5 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5]),
.si(sout[6]),
.so(sout[5]),
.reset(reset),
.q(dout[5])
);
cl_a1_msff_syrst_4x d0_6 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6]),
.si(sout[7]),
.so(sout[6]),
.reset(reset),
.q(dout[6])
);
cl_a1_msff_syrst_4x d0_7 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7]),
.si(sout[8]),
.so(sout[7]),
.reset(reset),
.q(dout[7])
);
cl_a1_msff_syrst_4x d0_8 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8]),
.si(sout[9]),
.so(sout[8]),
.reset(reset),
.q(dout[8])
);
cl_a1_msff_syrst_4x d0_9 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[9]),
.si(sout[10]),
.so(sout[9]),
.reset(reset),
.q(dout[9])
);
cl_a1_msff_syrst_4x d0_10 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[10]),
.si(sout[11]),
.so(sout[10]),
.reset(reset),
.q(dout[10])
);
cl_a1_msff_syrst_4x d0_11 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[11]),
.si(sout[12]),
.so(sout[11]),
.reset(reset),
.q(dout[11])
);
cl_a1_msff_syrst_4x d0_12 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[12]),
.si(sout[13]),
.so(sout[12]),
.reset(reset),
.q(dout[12])
);
cl_a1_msff_syrst_4x d0_13 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[13]),
.si(sout[14]),
.so(sout[13]),
.reset(reset),
.q(dout[13])
);
cl_a1_msff_syrst_4x d0_14 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[14]),
.si(sout[15]),
.so(sout[14]),
.reset(reset),
.q(dout[14])
);
cl_a1_msff_syrst_4x d0_15 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15]),
.si(sout[16]),
.so(sout[15]),
.reset(reset),
.q(dout[15])
);
cl_a1_msff_syrst_4x d0_16 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[16]),
.si(sout[17]),
.so(sout[16]),
.reset(reset),
.q(dout[16])
);
cl_a1_msff_syrst_4x d0_17 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[17]),
.si(sout[18]),
.so(sout[17]),
.reset(reset),
.q(dout[17])
);
cl_a1_msff_syrst_4x d0_18 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[18]),
.si(sout[19]),
.so(sout[18]),
.reset(reset),
.q(dout[18])
);
cl_a1_msff_syrst_4x d0_19 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[19]),
.si(scan_in),
.so(sout[19]),
.reset(reset),
.q(dout[19])
);




endmodule













// any PARAMS parms go into naming of macro

module niu_mb5_msff_ctl_macro__library_a1__reset_1__width_3 (
  din, 
  reset, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [2:1] sout;

  input [2:0] din;
  input reset;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0] & {3 {reset}};









    







cl_a1_msff_syrst_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0]),
.si(sout[1]),
.so(scan_out),
.reset(reset),
.q(dout[0])
);
cl_a1_msff_syrst_4x d0_1 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1]),
.si(sout[2]),
.so(sout[1]),
.reset(reset),
.q(dout[1])
);
cl_a1_msff_syrst_4x d0_2 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2]),
.si(scan_in),
.so(sout[2]),
.reset(reset),
.q(dout[2])
);




endmodule













// any PARAMS parms go into naming of macro

module niu_mb5_msff_ctl_macro__library_a1__reset_1__width_16 (
  din, 
  reset, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [15:1] sout;

  input [15:0] din;
  input reset;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = din[15:0] & {16 {reset}};









    







cl_a1_msff_syrst_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0]),
.si(sout[1]),
.so(scan_out),
.reset(reset),
.q(dout[0])
);
cl_a1_msff_syrst_4x d0_1 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1]),
.si(sout[2]),
.so(sout[1]),
.reset(reset),
.q(dout[1])
);
cl_a1_msff_syrst_4x d0_2 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2]),
.si(sout[3]),
.so(sout[2]),
.reset(reset),
.q(dout[2])
);
cl_a1_msff_syrst_4x d0_3 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3]),
.si(sout[4]),
.so(sout[3]),
.reset(reset),
.q(dout[3])
);
cl_a1_msff_syrst_4x d0_4 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4]),
.si(sout[5]),
.so(sout[4]),
.reset(reset),
.q(dout[4])
);
cl_a1_msff_syrst_4x d0_5 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5]),
.si(sout[6]),
.so(sout[5]),
.reset(reset),
.q(dout[5])
);
cl_a1_msff_syrst_4x d0_6 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6]),
.si(sout[7]),
.so(sout[6]),
.reset(reset),
.q(dout[6])
);
cl_a1_msff_syrst_4x d0_7 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7]),
.si(sout[8]),
.so(sout[7]),
.reset(reset),
.q(dout[7])
);
cl_a1_msff_syrst_4x d0_8 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8]),
.si(sout[9]),
.so(sout[8]),
.reset(reset),
.q(dout[8])
);
cl_a1_msff_syrst_4x d0_9 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[9]),
.si(sout[10]),
.so(sout[9]),
.reset(reset),
.q(dout[9])
);
cl_a1_msff_syrst_4x d0_10 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[10]),
.si(sout[11]),
.so(sout[10]),
.reset(reset),
.q(dout[10])
);
cl_a1_msff_syrst_4x d0_11 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[11]),
.si(sout[12]),
.so(sout[11]),
.reset(reset),
.q(dout[11])
);
cl_a1_msff_syrst_4x d0_12 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[12]),
.si(sout[13]),
.so(sout[12]),
.reset(reset),
.q(dout[12])
);
cl_a1_msff_syrst_4x d0_13 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[13]),
.si(sout[14]),
.so(sout[13]),
.reset(reset),
.q(dout[13])
);
cl_a1_msff_syrst_4x d0_14 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[14]),
.si(sout[15]),
.so(sout[14]),
.reset(reset),
.q(dout[14])
);
cl_a1_msff_syrst_4x d0_15 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15]),
.si(scan_in),
.so(sout[15]),
.reset(reset),
.q(dout[15])
);




endmodule













// any PARAMS parms go into naming of macro

module niu_mb5_msff_ctl_macro__library_a1__reset_1__width_7 (
  din, 
  reset, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [6:1] sout;

  input [6:0] din;
  input reset;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = din[6:0] & {7 {reset}};









    







cl_a1_msff_syrst_4x d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0]),
.si(sout[1]),
.so(scan_out),
.reset(reset),
.q(dout[0])
);
cl_a1_msff_syrst_4x d0_1 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1]),
.si(sout[2]),
.so(sout[1]),
.reset(reset),
.q(dout[1])
);
cl_a1_msff_syrst_4x d0_2 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2]),
.si(sout[3]),
.so(sout[2]),
.reset(reset),
.q(dout[2])
);
cl_a1_msff_syrst_4x d0_3 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3]),
.si(sout[4]),
.so(sout[3]),
.reset(reset),
.q(dout[3])
);
cl_a1_msff_syrst_4x d0_4 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4]),
.si(sout[5]),
.so(sout[4]),
.reset(reset),
.q(dout[4])
);
cl_a1_msff_syrst_4x d0_5 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5]),
.si(sout[6]),
.so(sout[5]),
.reset(reset),
.q(dout[5])
);
cl_a1_msff_syrst_4x d0_6 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6]),
.si(scan_in),
.so(sout[6]),
.reset(reset),
.q(dout[6])
);




endmodule








