// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_cb0.v
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
module dmu_cb0 (
  dmu_cb0_run, 
  dmu_cb0_addr, 
  dmu_cb0_wdata_key, 
  dmu_cb0_mmu_vtb_wr_en, 
  dmu_cb0_mmu_vtb_rd_en, 
  dmu_cb0_mmu_vtb_lkup_en, 
  dmu_cb0_mmu_ptb_wr_en, 
  dmu_cb0_mmu_ptb_rd_en, 
  dmu_cb0_mmu_ptb_lkup_en, 
  dmu_cb0_hld, 
  dmu_cb0_done, 
  dmu_cb0_fail, 
  scan_out, 
  l1clk, 
  scan_in, 
  tcu_aclk, 
  tcu_bclk, 
  rst_, 
  tcu_dmu_cb0_start, 
  dmu_cb0_bisi_mode, 
  dmu_cb0_user_mode, 
  mmu_vtb_read_data, 
  mmu_ptb_read_data, 
  mmu_vtb_hit, 
  mmu_ptb_hit);
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
wire [5:0] user_start_addr_in;
wire [5:0] user_start_addr;
wire user_stop_addr_reg_scanin;
wire user_stop_addr_reg_scanout;
wire [5:0] user_stop_addr_in;
wire [5:0] user_stop_addr;
wire user_incr_addr_reg_scanin;
wire user_incr_addr_reg_scanout;
wire [5:0] user_incr_addr_in;
wire [5:0] user_incr_addr;
wire user_array_sel_reg_scanin;
wire user_array_sel_reg_scanout;
wire user_array_sel_in;
wire user_array_sel;
wire user_cam_mode_reg_scanin;
wire user_cam_mode_reg_scanout;
wire user_cam_mode_in;
wire user_cam_mode;
wire user_cam_select_reg_scanin;
wire user_cam_select_reg_scanout;
wire user_cam_sel_in;
wire user_cam_sel;
wire user_cam_test_select_reg_scanin;
wire user_cam_test_select_reg_scanout;
wire [2:0] user_cam_test_sel_in;
wire [2:0] user_cam_test_sel;
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
wire addr_reg_scanin;
wire addr_reg_scanout;
wire [5:0] int_address;
wire cambist;
wire [5:0] cam_addr;
wire [5:0] mbist_address;
wire key_reg_scanin;
wire key_reg_scanout;
wire [32:0] mbist_wdata_key;
wire array_write;
wire array_read;
wire [7:0] mbist_wdata;
wire ctest0;
wire ctest2;
wire ctest4;
wire cseq0;
wire ctest1;
wire ctest3;
wire cseq1;
wire crw0;
wire crw1;
wire crw2;
wire crw3;
wire crw4;
wire wr_rd_en_reg_scanin;
wire wr_rd_en_reg_scanout;
wire vtb_wr_en;
wire vtb_rd_en;
wire vtb_lkup_en;
wire ptb_wr_en;
wire ptb_rd_en;
wire ptb_lkup_en;
wire hld_reg_scanin;
wire hld_reg_scanout;
wire mbist_hld;
wire done_reg_scanin;
wire done_reg_scanout;
wire mbist_fail_reg_scanin;
wire mbist_fail_reg_scanout;
wire fail;
wire [32:0] res_read_data;
wire vtb_sel_piped2;
wire read_data_pipe_reg_scanin;
wire read_data_pipe_reg_scanout;
wire [32:0] res_read_data_piped;
wire [63:0] res_hit_data;
wire cam_vtb_sel_piped2;
wire hit_data_pipe_reg_scanin;
wire hit_data_pipe_reg_scanout;
wire [63:0] res_hit_data_piped;
wire control_reg_scanin;
wire control_reg_scanout;
wire [18:0] control_in;
wire [18:0] control_out;
wire bisi_wr_rd;
wire array_sel;
wire [1:0] data_control;
wire address_mix;
wire [3:0] march_element;
wire [5:0] array_address;
wire upaddress_march;
wire [2:0] read_write_control;
wire five_cycle_march;
wire one_cycle_march;
wire increment_addr;
wire [5:0] start_addr;
wire [5:0] next_array_address;
wire next_upaddr_march;
wire next_downaddr_march;
wire [5:0] stop_addr;
wire [6:0] overflow_addr;
wire [5:0] incr_addr;
wire overflow;
wire [6:0] compare_addr;
wire [5:0] add;
wire [5:0] adj_address;
wire increment_march_elem;
wire next_array_sel;
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
wire vtb_sel;
wire ptb_sel;
wire cam_vtb_sel;
wire cam_wr_en;
wire cam_ptb_sel;
wire cam_array_sel;
wire cam_lkup_en;
wire cam_cntl_reg_scanin;
wire cam_cntl_reg_scanout;
wire [14:0] cam_in;
wire [14:0] cam_out;
wire [2:0] ctest;
wire cseq;
wire [2:0] crw;
wire [14:0] qual_cam;
wire next_cam_array_sel;
wire [2:0] next_ctest;
wire [5:0] next_cam_addr;
wire [2:0] next_crw;
wire addr_pipe_reg1_scanin;
wire addr_pipe_reg1_scanout;
wire [5:0] addr_pipe_reg1_in;
wire [5:0] addr_pipe_out1;
wire addr_pipe_reg2_scanin;
wire addr_pipe_reg2_scanout;
wire [5:0] addr_pipe_reg2_in;
wire [5:0] addr_pipe_out2;
wire [5:0] dmu_cb0_piped_addr;
wire data_pipe_reg1_scanin;
wire data_pipe_reg1_scanout;
wire [7:0] date_pipe_reg1_in;
wire [7:0] data_pipe_out1;
wire data_pipe_reg2_scanin;
wire data_pipe_reg2_scanout;
wire [7:0] date_pipe_reg2_in;
wire [7:0] data_pipe_out2;
wire [7:0] dmu_cb0_piped_data;
wire vtb_sel_pipe_reg1_scanin;
wire vtb_sel_pipe_reg1_scanout;
wire vtb_sel_pipe_reg1_in;
wire vtb_sel_piped;
wire vtb_sel_pipe_reg2_scanin;
wire vtb_sel_pipe_reg2_scanout;
wire vtb_sel_pipe_reg2_in;
wire vtb_ren_pipe_reg1_scanin;
wire vtb_ren_pipe_reg1_scanout;
wire vtb_ren_pipe_reg1_in;
wire vtb_rd_en_piped;
wire vtb_ren_pipe_reg2_scanin;
wire vtb_ren_pipe_reg2_scanout;
wire vtb_ren_pipe_reg2_in;
wire vtb_rd_en_piped2;
wire ptb_ren_pipe_reg1_scanin;
wire ptb_ren_pipe_reg1_scanout;
wire ptb_ren_pipe_reg1_in;
wire ptb_rd_en_piped;
wire ptb_ren_pipe_reg2_scanin;
wire ptb_ren_pipe_reg2_scanout;
wire ptb_ren_pipe_reg2_in;
wire ptb_rd_en_piped2;
wire cam_vtb_sel_pipe_reg1_scanin;
wire cam_vtb_sel_pipe_reg1_scanout;
wire cam_vtb_sel_pipe_reg1_in;
wire cam_vtb_sel_piped;
wire cam_vtb_sel_pipe_reg2_scanin;
wire cam_vtb_sel_pipe_reg2_scanout;
wire cam_vtb_sel_pipe_reg2_in;
wire vtb_lkup_en_pipe_reg1_scanin;
wire vtb_lkup_en_pipe_reg1_scanout;
wire vtb_lkup_en_pipe_reg1_in;
wire vtb_lkup_en_piped;
wire vtb_lkup_en_pipe_reg2_scanin;
wire vtb_lkup_en_pipe_reg2_scanout;
wire vtb_lkup_en_pipe_reg2_in;
wire vtb_lkup_en_piped2;
wire ptb_lkup_en_pipe_reg1_scanin;
wire ptb_lkup_en_pipe_reg1_scanout;
wire ptb_lkup_en_pipe_reg1_in;
wire ptb_lkup_en_piped;
wire ptb_lkup_en_pipe_reg2_scanin;
wire ptb_lkup_en_pipe_reg2_scanout;
wire ptb_lkup_en_pipe_reg2_in;
wire ptb_lkup_en_piped2;
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
wire [2:0] ctest_piped3;
wire crw_pipe_reg1_scanin;
wire crw_pipe_reg1_scanout;
wire [2:0] crw_pipe_reg1_in;
wire [2:0] crw_pipe_out1;
wire crw_pipe_reg2_scanin;
wire crw_pipe_reg2_scanout;
wire [2:0] crw_pipe_reg2_in;
wire [2:0] crw_pipe_out2;
wire crw_pipe_reg3_scanin;
wire crw_pipe_reg3_scanout;
wire [2:0] crw_pipe_reg3_in;
wire [2:0] crw_pipe_out3;
wire [2:0] crw_piped3;
wire fail_reg_scanin;
wire fail_reg_scanout;
wire [1:0] fail_reg_in;
wire [1:0] fail_reg_out;
wire qual_ptb_fail;
wire qual_vtb_fail;
wire fail_detect;
wire [1:0] cam_fail_reg_out;
wire qual_cam_vtb_fail;
wire qual_cam_ptb_fail;
wire cam_fail_reg_scanin;
wire cam_fail_reg_scanout;
wire [1:0] cam_fail_reg_in;
wire cam_fail_detect;



   output 	  dmu_cb0_run;

   output [5:0]	  dmu_cb0_addr;
   output [32:0]  dmu_cb0_wdata_key; 

   output 	  dmu_cb0_mmu_vtb_wr_en;
   output 	  dmu_cb0_mmu_vtb_rd_en;
   output 	  dmu_cb0_mmu_vtb_lkup_en;
   
   output     	  dmu_cb0_mmu_ptb_wr_en;
   output 	  dmu_cb0_mmu_ptb_rd_en;
   output 	  dmu_cb0_mmu_ptb_lkup_en;

   output     dmu_cb0_hld;            // New addition.
   
   output         dmu_cb0_done;
   output         dmu_cb0_fail;

   output 	  scan_out;

//   input          l2clk;
   input          l1clk;
//   input     	  tcu_scan_en;
   input     	  scan_in;
   input          tcu_aclk;
   input     	  tcu_bclk; 
//   input          tcu_pce_ov;
//   input     	  tcu_clk_stop;
   input          rst_;

   input          tcu_dmu_cb0_start;
   input          dmu_cb0_bisi_mode;
   input          dmu_cb0_user_mode;

   input [32:0]   mmu_vtb_read_data;
   input [32:0]   mmu_ptb_read_data;

   input [63:0]   mmu_vtb_hit;
   input [63:0]   mmu_ptb_hit;

   
   ///////////////////////////////////////
   // Scan chain connections            
   ///////////////////////////////////////
   // scan renames
//   assign 	  se = tcu_scan_en;
   assign 	  siclk = tcu_aclk;
   assign 	  soclk = tcu_bclk;
//   assign 	  pce_ov = tcu_pce_ov;
//   assign 	  stop = tcu_clk_stop;
   // end scan

//   l1clkhdr_ctl_macro clkgen (library=a1) (
//			      .l2clk  (l2clk  ),
//			      .l1en   (1'b1 ),
//			      .l1clk  (l1clk)
//			      );

   assign     reset = rst_;


// /////////////////////////////////////////////////////////////////////////////
//
// MBIST Config Register
//
// /////////////////////////////////////////////////////////////////////////////
//
// A low to high transition on mbist_start will reset and start the engine.  
// mbist_start must remain active high for the duration of MBIST.  
// If mbist_start deasserts the engine will stop but not reset.
// Once MBIST has completed mbist_done will assert and the fail status
// signals will be valid.  
// To run MBIST again the mbist_start signal must transition low then high.
//
// Loop on Address will disable the address mix function.
//
// /////////////////////////////////////////////////////////////////////////////

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_8 config_reg    (
               .scan_in(config_reg_scanin),
               .scan_out(config_reg_scanout),
               .din      ( config_in[7:0]       ),
               .dout     ( config_out[7:0]      ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));



  assign config_in[0]        =    tcu_dmu_cb0_start;
  assign config_in[1]        =    config_out[0];
  assign start_transition    =    config_out[0]      &  ~config_out[1];
  assign reset_engine        =    start_transition   |  (mbist_user_loop_mode  &  mbist_done);
//  assign run                 =    config_out[1]      &  (mbist_user_loop_mode | ~mbist_done);
  assign run                 =    config_out[0] & config_out[1]; // 9/19/05 run to follow start only!

  assign config_in[2]        =    start_transition   ?   dmu_cb0_bisi_mode:      config_out[2];
  assign bisi                =    config_out[2];

  assign config_in[3]        =    start_transition   ?   dmu_cb0_user_mode:      config_out[3];
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


  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_8 user_data_reg    (
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

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_6 user_start_addr_reg    (
                 .scan_in(user_start_addr_reg_scanin),
                 .scan_out(user_start_addr_reg_scanout),
                 .din      ( user_start_addr_in[5:0]  ),
                 .dout     ( user_start_addr[5:0] ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_start_addr_in[5:0]   =    user_start_addr[5:0];

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_6 user_stop_addr_reg    (
                 .scan_in(user_stop_addr_reg_scanin),
                 .scan_out(user_stop_addr_reg_scanout),
                 .din      ( user_stop_addr_in[5:0]  ),
                 .dout     ( user_stop_addr[5:0] ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_stop_addr_in[5:0]   =    user_stop_addr[5:0];


  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_6 user_incr_addr_reg    (
                 .scan_in(user_incr_addr_reg_scanin),
                 .scan_out(user_incr_addr_reg_scanout),
                 .din      ( user_incr_addr_in[5:0]  ),
                 .dout     ( user_incr_addr[5:0] ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_incr_addr_in[5:0]   =    user_incr_addr[5:0];

// Defining User array_sel.

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 user_array_sel_reg    (
                 .scan_in(user_array_sel_reg_scanin),
                 .scan_out(user_array_sel_reg_scanout),
                 .din      ( user_array_sel_in  ),
                 .dout     ( user_array_sel ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_array_sel_in   =    user_array_sel;


// user_cam_mode Register
// During user_mode, if user_cam_mode=0, then memBIST (R/W test);
//                   if user_cam_mode=1, then camBIST.

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 user_cam_mode_reg    (
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
  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 user_cam_select_reg    (
  	          .scan_in(user_cam_select_reg_scanin),
  	          .scan_out(user_cam_select_reg_scanout),
  	          .din      ( user_cam_sel_in       ),
  		      .dout     ( user_cam_sel      ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_cam_sel_in   =   user_cam_sel;

// cambist: user CAM test select 
  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_3 user_cam_test_select_reg    (
  	          .scan_in(user_cam_test_select_reg_scanin),
  	          .scan_out(user_cam_test_select_reg_scanout),
  	          .din      ( user_cam_test_sel_in[2:0]       ),
  		      .dout     ( user_cam_test_sel[2:0]      ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_cam_test_sel_in[2:0]  =  user_cam_test_sel[2:0];

// Defining user_bisi write and read registers

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 user_bisi_wr_reg    (
                 .scan_in(user_bisi_wr_reg_scanin),
                 .scan_out(user_bisi_wr_reg_scanout),
                 .din      ( user_bisi_wr_mode_in  ),
                 .dout     ( user_bisi_wr_mode ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_bisi_wr_mode_in     =    user_bisi_wr_mode;

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 user_bisi_rd_reg    (
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

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 start_transition_reg    (
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

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 run_reg    (
               .scan_in(run_reg_scanin),
               .scan_out(run_reg_scanout),
               .din      ( run ),
               .dout     ( dmu_cb0_run ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//Adding 2 extra pipeline stages to run to delay the start of mbist for 3 cycles.
  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 run1_reg    (
               .scan_in(run1_reg_scanin),
               .scan_out(run1_reg_scanout),
               .din      ( run1_in ),
               .dout     ( run1_out ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign run1_in = reset_engine        ?   1'b0:      dmu_cb0_run;

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 run2_reg    (
               .scan_in(run2_reg_scanin),
               .scan_out(run2_reg_scanout),
               .din      ( run2_in ),
               .dout     ( run2_out ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign run2_in = reset_engine        ?   1'b0:      run1_out;
//  assign run_piped3 = run2_out & run;
  assign run_piped3 = config_out[0] & run2_out & ~msb;


////////////////////////////////////////////////////////////////////////////////
// Creating flop boundaries for the outputs of the mbist
////////////////////////////////////////////////////////////////////////////////
  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_6 addr_reg    (
               .scan_in(addr_reg_scanin),
               .scan_out(addr_reg_scanout),
               .din      ( int_address[5:0]       ),
               .dout     ( dmu_cb0_addr[5:0]      ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign int_address[5:0] = cambist ? cam_addr[5:0] : mbist_address[5:0];

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_33 key_reg    (
               .scan_in(key_reg_scanin),
               .scan_out(key_reg_scanout),
               .din      ( mbist_wdata_key[32:0]       ),
               .dout     ( dmu_cb0_wdata_key[32:0]      ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));
  

  assign mbist_wdata_key[32:0] = array_write | array_read ? { mbist_wdata[0], {4{mbist_wdata[7:0]}} } :
                       (ctest0 | ctest2 | ctest4) & cseq0 ?    33'b0 :
                                (ctest1 | ctest3) & cseq0 ? {33{1'b1}} :
   cseq1 & ( ((ctest0 | ctest2) & (crw0 | crw1)) | (ctest1 & crw2) ) ? {33{1'b1}} :     
   cseq1 & ( (ctest0 & crw2) | (ctest1 & (crw0 | crw1)) | (ctest2 & (crw2 | crw3 | crw4)) ) ?  33'b0 :     
                       ctest3 & (cam_addr[5:0] == 6'b0)   ?    33'h1FFFFFFFE : // Start walking0
                       ctest4 & (cam_addr[5:0] == 6'b0)   ?    33'h01 :        // Start walking1
                                (ctest3 | ctest4) & cseq1 ?    {dmu_cb0_wdata_key[31:0], dmu_cb0_wdata_key[32]} :
                                                               33'b0;

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_6 wr_rd_en_reg    (
               .scan_in(wr_rd_en_reg_scanin),
               .scan_out(wr_rd_en_reg_scanout),
               .din      ( {vtb_wr_en, vtb_rd_en, vtb_lkup_en, ptb_wr_en, ptb_rd_en, ptb_lkup_en} ),
               .dout     ( {dmu_cb0_mmu_vtb_wr_en, dmu_cb0_mmu_vtb_rd_en, dmu_cb0_mmu_vtb_lkup_en, dmu_cb0_mmu_ptb_wr_en, dmu_cb0_mmu_ptb_rd_en, dmu_cb0_mmu_ptb_lkup_en }  ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 hld_reg   (
               .scan_in(hld_reg_scanin),
               .scan_out(hld_reg_scanout),
               .din      ( mbist_hld  ),
               .dout     ( dmu_cb0_hld ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 done_reg   (
               .scan_in(done_reg_scanin),
               .scan_out(done_reg_scanout),
               .din      ( mbist_done  ),
               .dout     ( dmu_cb0_done ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 mbist_fail_reg   (
               .scan_in(mbist_fail_reg_scanin),
               .scan_out(mbist_fail_reg_scanout),
               .din      ( fail  ),
               .dout     ( dmu_cb0_fail ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


////////////////////////////////////////////////////////////////////////////////
// Creating resultant read_data by muxing the memories outputs
////////////////////////////////////////////////////////////////////////////////

//Piped off internal vtb_sel, therefore, piped twice.
  assign res_read_data[32:0] = vtb_sel_piped2 ?  mmu_vtb_read_data[32:0] :
                                                 mmu_ptb_read_data[32:0];

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_33 read_data_pipe_reg    (
                   .scan_in(read_data_pipe_reg_scanin),
                   .scan_out(read_data_pipe_reg_scanout),
                   .din      ( res_read_data[32:0]   ),
                   .dout     ( res_read_data_piped[32:0]  ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////////////////////////////////////
// Creating resultant hit_data by muxing the memories hit outputs
////////////////////////////////////////////////////////////////////////////////

//Piped off internal cam_vtb_sel, therefore, piped twice.
  assign res_hit_data[63:0] =  cam_vtb_sel_piped2 ? mmu_vtb_hit[63:0] : mmu_ptb_hit[63:0];

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_64 hit_data_pipe_reg    (
                   .scan_in(hit_data_pipe_reg_scanin),
                   .scan_out(hit_data_pipe_reg_scanout),
                   .din      ( res_hit_data[63:0]   ),
                   .dout     ( res_hit_data_piped[63:0]  ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


// /////////////////////////////////////////////////////////////////////////////
//
// MBIST Control Register
//
// /////////////////////////////////////////////////////////////////////////////

   dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_19 control_reg    (
                      .scan_in(control_reg_scanin),
                      .scan_out(control_reg_scanout),
                      .din   ( control_in[18:0]           ),
                      .dout  ( control_out[18:0]          ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign   msb                       = ~bisi & user_mode & user_cam_mode ? 1'b1 : control_out[18];
  assign   bisi_wr_rd    = (bisi & ~user_mode) | mbist_user_bisi_wr_rd_mode ? control_out[17] : 1'b1;
  assign   array_sel                 =     user_mode           ?  user_array_sel : control_out[16];
  assign   data_control[1:0]         =     control_out[15:14];
  assign   address_mix         = (bisi | mbist_user_addr_mode) ?  1'b0:  control_out[13];
  assign   march_element[3:0]        =     control_out[12:9];
  assign   array_address[5:0]        =     upaddress_march     ?  control_out[8:3] : ~control_out[8:3];
  assign   read_write_control[2:0]   =     ~five_cycle_march   ?   {2'b11,  control_out[0]} :
                                                                   control_out[2:0];


  assign   control_in[2:0]           =     reset_engine        ?   3'b0:
                                           ~run_piped3         ?   control_out[2:0]:
     (five_cycle_march && (read_write_control[2:0] == 3'b100)) ?   3'b000:
      (one_cycle_march && (read_write_control[2:0] == 3'b110)) ?   3'b000:
                                                                   control_out[2:0]   +  3'b001;

  assign   increment_addr            =     (five_cycle_march && (read_write_control[2:0] == 3'b100)) || 
                                            (one_cycle_march && (read_write_control[2:0] == 3'b110)) ||
                                            (read_write_control[2:0] == 3'b111);

// start_transition_piped was added to have the correct start_addr at the start
// of mbist during user_addr_mode
  assign   control_in[8:3]  =     start_transition_piped || reset_engine ?  start_addr[5:0]:
                                        ~run_piped3 || ~increment_addr   ?  control_out[8:3]:
                                                                           next_array_address[5:0];

  assign   next_array_address[5:0]   =    next_upaddr_march      ?  start_addr[5:0]:
                                          next_downaddr_march    ?  ~stop_addr[5:0]:
                                                                   (overflow_addr[5:0]);     // array_addr + incr_addr

  assign   start_addr[5:0]           =    mbist_user_addr_mode   ?   user_start_addr[5:0] : 6'b000000;
  assign   stop_addr[5:0]            =    mbist_user_addr_mode   ?   user_stop_addr[5:0] : 6'b111111;
  assign   incr_addr[5:0]            =    mbist_user_addr_mode   ?   user_incr_addr[5:0] : 6'b000001;

  assign   overflow_addr[6:0]        =    {1'b0,control_out[8:3]} + {1'b0,incr_addr[5:0]};
  assign   overflow                  =    compare_addr[6:0] < overflow_addr[6:0];

  assign   compare_addr[6:0]         =    upaddress_march       ?  {1'b0, stop_addr[5:0]} :
                                                                   {1'b0, ~start_addr[5:0]}; 

  assign   next_upaddr_march         =   ( (march_element[3:0] == 4'h0) || (march_element[3:0] == 4'h1) || 
                                           (march_element[3:0] == 4'h6) || (march_element[3:0] == 4'h5) || 
                                           (march_element[3:0] == 4'h8) ) && overflow; 
   
  assign   next_downaddr_march       =   ( (march_element[3:0] == 4'h2) || (march_element[3:0] == 4'h7) ||
                                           (march_element[3:0] == 4'h3) || (march_element[3:0] == 4'h4) ) && 
                                            overflow; 
   

   
  assign   add[5:0]                  =     five_cycle_march && ( (read_write_control[2:0] == 3'h1) || 
                                                                 (read_write_control[2:0] == 3'h3)) ?   
                                                                 adj_address[5:0]:    array_address[5:0];

// All addresses are row addresses. There are two banks however. 0:31 in one
// bank and 32:63 in the other.  
  assign   adj_address[5:0]          =     { array_address[5:3], ~array_address[2], array_address[1:0] };  

  assign   mbist_address[5:0]        =     address_mix         ?  {add[1:0],add[5:2]}:
                                                                    add[5:0];

// Definition of the rest of the control register  
  assign   increment_march_elem      =     increment_addr && overflow;

  assign   control_in[18:9]          =     reset_engine        ?   10'b0:
                                          ~run_piped3          ?   control_out[18:9]:
                                           {msb, bisi_wr_rd, next_array_sel, next_data_control[1:0], next_address_mix, next_march_element[3:0]}
                                           + {9'b0, increment_march_elem};                        

  assign   next_array_sel            =     user_mode           ?   1'b1:  control_out[16]; 
  assign   next_data_control[1:0]    =     (bisi || (mbist_user_data_mode && (data_control[1:0] == 2'b00)))  ?   2'b11:
                                                                                                                 data_control[1:0];

  assign   next_address_mix          =     bisi | mbist_user_addr_mode ?  1'b1 : address_mix;

// Modified next_march_element to remove a possible long path.
// Incorporated ten_n_mode!  
  assign   next_march_element[3:0]   =     ( bisi || 
                                             (mbist_ten_n_mode && (march_element[3:0] == 4'b0101)) || 
                                          ((march_element[3:0] == 4'b1000) && (read_write_control[2:0] == 3'b100)) ) 
                                            && overflow ?   4'b1111:  march_element[3:0];

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

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_3 done_counter_reg    (
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

  assign   vtb_sel                   =    ~array_sel;
  assign   ptb_sel                   =     array_sel;

  assign   vtb_rd_en                 =     vtb_sel && array_read;
  assign   vtb_wr_en                 =    (vtb_sel && array_write) || (cam_vtb_sel && cam_wr_en);

  assign   ptb_rd_en                 =     ptb_sel && array_read;
  assign   ptb_wr_en                 =    (ptb_sel && array_write) || (cam_ptb_sel && cam_wr_en);

  assign   cam_vtb_sel               =    ~cam_array_sel;
  assign   cam_ptb_sel               =     cam_array_sel;

  assign   vtb_lkup_en               =    cam_vtb_sel && cam_lkup_en;
  assign   ptb_lkup_en               =    cam_ptb_sel && cam_lkup_en;


// /////////////////////////////////////////////////////////////////////////////
// CAM BIST:
// /////////////////////////////////////////////////////////////////////////////

   dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_15 cam_cntl_reg    (
                 .scan_in(cam_cntl_reg_scanin),
                 .scan_out(cam_cntl_reg_scanout),
                 .din      ( cam_in[14:0]       ),
                 .dout     ( cam_out[14:0]      ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

   assign cam_msb                =   user_mode & ~user_cam_mode & msb ? 1'b1 : cam_out[14];    

   assign cam_array_sel          =   user_mode ? user_cam_sel:
                                                 cam_out[13];    

   assign ctest[2:0]             =   user_mode ? user_cam_test_sel[2:0] :
                                                 cam_out[12:10];    

   assign cseq                   =   cam_out[9];

   assign cam_addr[5:0]          =   cam_out[8:3];

   assign crw[2:0]               =   cseq0 | (ctest3 | ctest4) ? 3'b111:
                                                                 cam_out[2:0];    // read write control

   assign ctest0  =  ~(  ctest[2] |  ctest[1] |   ctest[0]);   // ^(W0); ^(W1 C1 W0)
   assign ctest1  =  ~(  ctest[2] |  ctest[1] |  ~ctest[0]);   // ^(W1); ^(W0 C0 W1)
   assign ctest2  =  ~(  ctest[2] | ~ctest[1] |   ctest[0]);   // ^(W0); ^(W1 C1 C0,hld C0 W0) for VTB only!
   assign ctest3  =  ~(  ctest[2] | ~ctest[1] |  ~ctest[0]);   // ^(W1); >C(wk0)
   assign ctest4  =  ~( ~ctest[2] |  ctest[1] |   ctest[0]);   // ^(W0); >C(wk1)

   assign cseq0   = ~cseq;
   assign cseq1   =  cseq;

   assign crw0    = ~( crw[2] |  crw[1] |  crw[0]);
   assign crw1    = ~( crw[2] |  crw[1] | ~crw[0]);
   assign crw2    = ~( crw[2] | ~crw[1] |  crw[0]);
   assign crw3    = ~( crw[2] | ~crw[1] | ~crw[0]);
   assign crw4    = ~(~crw[2] |  crw[1] |  crw[0]);


   assign cam_wr_en   =  cambist & ( cseq0 | 
                                    (cseq1 & ((ctest0 | ctest1) & (crw0 | crw2)) |
                                             ( ctest2           & (crw0 | crw4)) ) );

   assign cam_lkup_en =  cambist & cseq1 &
                         ( ((ctest0 | ctest1) & crw1 ) |
                           ( ctest2 & (crw1 | crw2 | crw3)) |
                           ( ctest3 | ctest4)               );

   assign mbist_hld   =  cambist & ctest2 & cseq1 & crw2;                      

   assign qual_cam[14:0] = {cam_msb,
              			    next_cam_array_sel,			  			  
              			    next_ctest[2:0],
              			    cseq,
                            next_cam_addr[5:0],
			                next_crw[2:0]};

   assign cam_in[14:0] =   reset_engine      ? 15'b0:                    // set zero
	                       cambist           ? qual_cam[14:0] + 15'h1:   // increment
	                                           qual_cam[14:0];           // save value

   assign next_cam_array_sel = user_mode                        ?  1'b1   : cam_out[13];

   assign next_ctest[2:0]    = user_mode                                  ? 3'b111 : 
                            ctest4 & cseq1 & (cam_addr[5:0] == 6'b100000) ? 3'b111 : 
     cam_array_sel & ctest1 & cseq1 & crw2 & (cam_addr[5:0] == 6'b111111) ? 3'b010 : cam_out[12:10];

   assign next_cam_addr[5:0] = (ctest3 | ctest4) & cseq1 & 
                               (cam_addr[5:0] == 6'b100000) ?  6'b111111 : cam_addr[5:0];

   assign next_crw[2:0]      = (ctest0 | ctest1) & cseq1 & crw2 ? 3'b111 : 
                                    ctest2       & cseq1 & crw4 ? 3'b111 : crw[2:0];

// Defining cambist mode of operation!

   assign cambist            = ~bisi & run2_out & msb & ~cam_msb;

// /////////////////////////////////////////////////////////////////////////////
// Pipeline for  wdata, Read_en and lkup_en
// /////////////////////////////////////////////////////////////////////////////

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_6  addr_pipe_reg1   (
               .scan_in(addr_pipe_reg1_scanin),
               .scan_out(addr_pipe_reg1_scanout),
               .din        ( addr_pipe_reg1_in[5:0]  ),
               .dout       ( addr_pipe_out1[5:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_6  addr_pipe_reg2   (
               .scan_in(addr_pipe_reg2_scanin),
               .scan_out(addr_pipe_reg2_scanout),
               .din        ( addr_pipe_reg2_in[5:0]  ),
               .dout       ( addr_pipe_out2[5:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign addr_pipe_reg1_in[5:0]   =  reset_engine    ?    6'h00:      dmu_cb0_addr[5:0];
  assign addr_pipe_reg2_in[5:0]   =  reset_engine    ?    6'h00:      addr_pipe_out1[5:0];

  assign dmu_cb0_piped_addr[5:0]  =  addr_pipe_out2[5:0];

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_8  data_pipe_reg1   (
               .scan_in(data_pipe_reg1_scanin),
               .scan_out(data_pipe_reg1_scanout),
               .din        ( date_pipe_reg1_in[7:0]  ),
               .dout       ( data_pipe_out1[7:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_8  data_pipe_reg2   (
               .scan_in(data_pipe_reg2_scanin),
               .scan_out(data_pipe_reg2_scanout),
               .din        ( date_pipe_reg2_in[7:0]  ),
               .dout       ( data_pipe_out2[7:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign date_pipe_reg1_in[7:0]   =  reset_engine    ?    8'h00:      dmu_cb0_wdata_key[7:0];
  assign date_pipe_reg2_in[7:0]   =  reset_engine    ?    8'h00:      data_pipe_out1[7:0];
//  assign date_pipe_reg3_in[7:0]   =  reset_engine    ?    8'h00:      data_pipe_out2[7:0];

  assign dmu_cb0_piped_data[7:0]  =  data_pipe_out2[7:0];

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 vtb_sel_pipe_reg1   (
               .scan_in(vtb_sel_pipe_reg1_scanin),
               .scan_out(vtb_sel_pipe_reg1_scanout),
               .din        ( vtb_sel_pipe_reg1_in  ),
               .dout       ( vtb_sel_piped     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 vtb_sel_pipe_reg2   (
               .scan_in(vtb_sel_pipe_reg2_scanin),
               .scan_out(vtb_sel_pipe_reg2_scanout),
               .din        ( vtb_sel_pipe_reg2_in  ),
               .dout       ( vtb_sel_piped2    ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign vtb_sel_pipe_reg1_in  =  reset_engine    ?    1'b0:   vtb_sel; 
  assign vtb_sel_pipe_reg2_in  =  reset_engine    ?    1'b0:   vtb_sel_piped;


  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 vtb_ren_pipe_reg1   (
               .scan_in(vtb_ren_pipe_reg1_scanin),
               .scan_out(vtb_ren_pipe_reg1_scanout),
               .din        ( vtb_ren_pipe_reg1_in  ),
               .dout       ( vtb_rd_en_piped     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 vtb_ren_pipe_reg2   (
               .scan_in(vtb_ren_pipe_reg2_scanin),
               .scan_out(vtb_ren_pipe_reg2_scanout),
               .din        ( vtb_ren_pipe_reg2_in  ),
               .dout       ( vtb_rd_en_piped2    ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign vtb_ren_pipe_reg1_in  =  reset_engine    ?    1'b0:   dmu_cb0_mmu_vtb_rd_en; 
  assign vtb_ren_pipe_reg2_in  =  reset_engine    ?    1'b0:   vtb_rd_en_piped;

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 ptb_ren_pipe_reg1   (
               .scan_in(ptb_ren_pipe_reg1_scanin),
               .scan_out(ptb_ren_pipe_reg1_scanout),
               .din        ( ptb_ren_pipe_reg1_in  ),
               .dout       ( ptb_rd_en_piped     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 ptb_ren_pipe_reg2   (
               .scan_in(ptb_ren_pipe_reg2_scanin),
               .scan_out(ptb_ren_pipe_reg2_scanout),
               .din        ( ptb_ren_pipe_reg2_in  ),
               .dout       ( ptb_rd_en_piped2    ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign ptb_ren_pipe_reg1_in  =  reset_engine    ?    1'b0:   dmu_cb0_mmu_ptb_rd_en; 
  assign ptb_ren_pipe_reg2_in  =  reset_engine    ?    1'b0:   ptb_rd_en_piped;

//lkup_en
  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 cam_vtb_sel_pipe_reg1   (
               .scan_in(cam_vtb_sel_pipe_reg1_scanin),
               .scan_out(cam_vtb_sel_pipe_reg1_scanout),
               .din        ( cam_vtb_sel_pipe_reg1_in  ),
               .dout       ( cam_vtb_sel_piped     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 cam_vtb_sel_pipe_reg2   (
               .scan_in(cam_vtb_sel_pipe_reg2_scanin),
               .scan_out(cam_vtb_sel_pipe_reg2_scanout),
               .din        ( cam_vtb_sel_pipe_reg2_in  ),
               .dout       ( cam_vtb_sel_piped2    ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign cam_vtb_sel_pipe_reg1_in  =  reset_engine    ?    1'b0:   cam_vtb_sel; 
  assign cam_vtb_sel_pipe_reg2_in  =  reset_engine    ?    1'b0:   cam_vtb_sel_piped;


  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 vtb_lkup_en_pipe_reg1   (
               .scan_in(vtb_lkup_en_pipe_reg1_scanin),
               .scan_out(vtb_lkup_en_pipe_reg1_scanout),
               .din        ( vtb_lkup_en_pipe_reg1_in  ),
               .dout       ( vtb_lkup_en_piped     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 vtb_lkup_en_pipe_reg2   (
               .scan_in(vtb_lkup_en_pipe_reg2_scanin),
               .scan_out(vtb_lkup_en_pipe_reg2_scanout),
               .din        ( vtb_lkup_en_pipe_reg2_in  ),
               .dout       ( vtb_lkup_en_piped2    ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign vtb_lkup_en_pipe_reg1_in  =  reset_engine    ?    1'b0:   dmu_cb0_mmu_vtb_lkup_en; 
  assign vtb_lkup_en_pipe_reg2_in  =  reset_engine    ?    1'b0:   vtb_lkup_en_piped;

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 ptb_lkup_en_pipe_reg1   (
               .scan_in(ptb_lkup_en_pipe_reg1_scanin),
               .scan_out(ptb_lkup_en_pipe_reg1_scanout),
               .din        ( ptb_lkup_en_pipe_reg1_in  ),
               .dout       ( ptb_lkup_en_piped     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 ptb_lkup_en_pipe_reg2   (
               .scan_in(ptb_lkup_en_pipe_reg2_scanin),
               .scan_out(ptb_lkup_en_pipe_reg2_scanout),
               .din        ( ptb_lkup_en_pipe_reg2_in  ),
               .dout       ( ptb_lkup_en_piped2    ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign ptb_lkup_en_pipe_reg1_in  =  reset_engine    ?    1'b0:   dmu_cb0_mmu_ptb_lkup_en; 
  assign ptb_lkup_en_pipe_reg2_in  =  reset_engine    ?    1'b0:   ptb_lkup_en_piped;

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_3  ctest_pipe_reg1   (
               .scan_in(ctest_pipe_reg1_scanin),
               .scan_out(ctest_pipe_reg1_scanout),
               .din        ( ctest_pipe_reg1_in[2:0]  ),
               .dout       ( ctest_pipe_out1[2:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_3  ctest_pipe_reg2   (
               .scan_in(ctest_pipe_reg2_scanin),
               .scan_out(ctest_pipe_reg2_scanout),
               .din        ( ctest_pipe_reg2_in[2:0]  ),
               .dout       ( ctest_pipe_out2[2:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_3  ctest_pipe_reg3   (
               .scan_in(ctest_pipe_reg3_scanin),
               .scan_out(ctest_pipe_reg3_scanout),
               .din        ( ctest_pipe_reg3_in[2:0]  ),
               .dout       ( ctest_pipe_out3[2:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign ctest_pipe_reg1_in[2:0]   =  reset_engine    ?    3'b000:      ctest[2:0];
  assign ctest_pipe_reg2_in[2:0]   =  reset_engine    ?    3'b000:      ctest_pipe_out1[2:0];
  assign ctest_pipe_reg3_in[2:0]   =  reset_engine    ?    3'b000:      ctest_pipe_out2[2:0];

  assign ctest_piped3[2:0]  =  ctest_pipe_out3[2:0];

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_3  crw_pipe_reg1   (
               .scan_in(crw_pipe_reg1_scanin),
               .scan_out(crw_pipe_reg1_scanout),
               .din        ( crw_pipe_reg1_in[2:0]  ),
               .dout       ( crw_pipe_out1[2:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_3  crw_pipe_reg2   (
               .scan_in(crw_pipe_reg2_scanin),
               .scan_out(crw_pipe_reg2_scanout),
               .din        ( crw_pipe_reg2_in[2:0]  ),
               .dout       ( crw_pipe_out2[2:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_3  crw_pipe_reg3   (
               .scan_in(crw_pipe_reg3_scanin),
               .scan_out(crw_pipe_reg3_scanout),
               .din        ( crw_pipe_reg3_in[2:0]  ),
               .dout       ( crw_pipe_out3[2:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign crw_pipe_reg1_in[2:0]   =  reset_engine    ?    3'b00:      crw[2:0];
  assign crw_pipe_reg2_in[2:0]   =  reset_engine    ?    3'b00:      crw_pipe_out1[2:0];
  assign crw_pipe_reg3_in[2:0]   =  reset_engine    ?    3'b00:      crw_pipe_out2[2:0];

  assign crw_piped3[2:0]  =  crw_pipe_out3[2:0];

// /////////////////////////////////////////////////////////////////////////////
// Shared Fail Detection
// /////////////////////////////////////////////////////////////////////////////
// 05/10/05: Updated to meet these new features:
// 1.When mbist_done signal is asserted when it completes all the
//   tests, it also need to assert static membist fail signal if
//   there were any failures during the tests.
// 2.The mbist_fail signal won't be sticky bit from membist   
//   engine.  The TCU will make it sticky fail bit as needed.


  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_2 fail_reg    (
                   .scan_in(fail_reg_scanin),
                   .scan_out(fail_reg_scanout),
                   .din      ( fail_reg_in[1:0]   ),
                   .dout     ( fail_reg_out[1:0]  ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign    fail_reg_in[1:0]      =    reset_engine      ?    2'b0: {qual_ptb_fail,qual_vtb_fail}  |  fail_reg_out[1:0];

  assign    qual_vtb_fail      =  fail_detect && vtb_rd_en_piped2;
  assign    qual_ptb_fail      =  fail_detect && ptb_rd_en_piped2;

  assign    fail               =  mbist_done ?  (|fail_reg_out[1:0]) || (|cam_fail_reg_out[1:0]):
                                  qual_vtb_fail | qual_ptb_fail | qual_cam_vtb_fail | qual_cam_ptb_fail;


//  assign    fail_detect        =  vtb_rd_en_piped2  ?
//                                       ({4{dmu_cb0_piped_data[7:0]} } != res_read_data_piped[31:0]):
//             ({ dmu_cb0_piped_data[0], {4{dmu_cb0_piped_data[7:0]}} } != res_read_data_piped[32:0]);

  assign    fail_detect        =  ({ dmu_cb0_piped_data[0], {4{dmu_cb0_piped_data[7:0]}} } != res_read_data_piped[32:0]);

// CAM Fail

  dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_2 cam_fail_reg    (
                   .scan_in(cam_fail_reg_scanin),
                   .scan_out(cam_fail_reg_scanout),
                   .din      ( cam_fail_reg_in[1:0]   ),
                   .dout     ( cam_fail_reg_out[1:0]  ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign    cam_fail_reg_in[1:0]      =    reset_engine      ?    2'b0: {qual_cam_ptb_fail,qual_cam_vtb_fail}  |  
                                                                         cam_fail_reg_out[1:0];

  assign    qual_cam_vtb_fail      =  cam_fail_detect && vtb_lkup_en_piped2;
  assign    qual_cam_ptb_fail      =  cam_fail_detect && ptb_lkup_en_piped2;


// integer i;
reg [63:0] expct_res_hit_data_piped;

//   always@(dmu_cb0_piped_addr)
//   begin
//   for(i=0;i<64;i=i+1)
//   begin
//	if(i==(dmu_cb0_piped_addr[5:0]))
//	  expct_res_hit_data_piped[i] = 1'b1;
//	else 
//	expct_res_hit_data_piped[i] = 1'b0;
// end
//end

  always@ (dmu_cb0_piped_addr[5:0]) begin
    case (dmu_cb0_piped_addr[5:0]) //synopsys parallel_case full_case
    
    6'h00 : expct_res_hit_data_piped = {63'b0, 1'b1};
    6'h01 : expct_res_hit_data_piped = {62'b0, 1'b1, 1'b0};
    6'h02 : expct_res_hit_data_piped = {61'b0, 1'b1, 2'b0};
    6'h03 : expct_res_hit_data_piped = {60'b0, 1'b1, 3'b0};
    6'h04 : expct_res_hit_data_piped = {59'b0, 1'b1, 4'b0};
    6'h05 : expct_res_hit_data_piped = {58'b0, 1'b1, 5'b0};
    6'h06 : expct_res_hit_data_piped = {57'b0, 1'b1, 6'b0};
    6'h07 : expct_res_hit_data_piped = {56'b0, 1'b1, 7'b0};
    6'h08 : expct_res_hit_data_piped = {55'b0, 1'b1, 8'b0};
    6'h09 : expct_res_hit_data_piped = {54'b0, 1'b1, 9'b0};
    6'h0A : expct_res_hit_data_piped = {53'b0, 1'b1, 10'b0};
    6'h0B : expct_res_hit_data_piped = {52'b0, 1'b1, 11'b0};
    6'h0C : expct_res_hit_data_piped = {51'b0, 1'b1, 12'b0};
    6'h0D : expct_res_hit_data_piped = {50'b0, 1'b1, 13'b0};
    6'h0E : expct_res_hit_data_piped = {49'b0, 1'b1, 14'b0};
    6'h0F : expct_res_hit_data_piped = {48'b0, 1'b1, 15'b0};

    6'h10 : expct_res_hit_data_piped = {47'b0, 1'b1, 16'b0};
    6'h11 : expct_res_hit_data_piped = {46'b0, 1'b1, 17'b0};
    6'h12 : expct_res_hit_data_piped = {45'b0, 1'b1, 18'b0};
    6'h13 : expct_res_hit_data_piped = {44'b0, 1'b1, 19'b0};
    6'h14 : expct_res_hit_data_piped = {43'b0, 1'b1, 20'b0};
    6'h15 : expct_res_hit_data_piped = {42'b0, 1'b1, 21'b0};
    6'h16 : expct_res_hit_data_piped = {41'b0, 1'b1, 22'b0};
    6'h17 : expct_res_hit_data_piped = {40'b0, 1'b1, 23'b0};
    6'h18 : expct_res_hit_data_piped = {39'b0, 1'b1, 24'b0};
    6'h19 : expct_res_hit_data_piped = {38'b0, 1'b1, 25'b0};
    6'h1A : expct_res_hit_data_piped = {37'b0, 1'b1, 26'b0};
    6'h1B : expct_res_hit_data_piped = {36'b0, 1'b1, 27'b0};
    6'h1C : expct_res_hit_data_piped = {35'b0, 1'b1, 28'b0};
    6'h1D : expct_res_hit_data_piped = {34'b0, 1'b1, 29'b0};
    6'h1E : expct_res_hit_data_piped = {33'b0, 1'b1, 30'b0};
    6'h1F : expct_res_hit_data_piped = {32'b0, 1'b1, 31'b0};

    6'h20 : expct_res_hit_data_piped = {31'b0, 1'b1, 32'b0};
    6'h21 : expct_res_hit_data_piped = {30'b0, 1'b1, 33'b0};
    6'h22 : expct_res_hit_data_piped = {29'b0, 1'b1, 34'b0};
    6'h23 : expct_res_hit_data_piped = {28'b0, 1'b1, 35'b0};
    6'h24 : expct_res_hit_data_piped = {27'b0, 1'b1, 36'b0};
    6'h25 : expct_res_hit_data_piped = {26'b0, 1'b1, 37'b0};
    6'h26 : expct_res_hit_data_piped = {25'b0, 1'b1, 38'b0};
    6'h27 : expct_res_hit_data_piped = {24'b0, 1'b1, 39'b0};
    6'h28 : expct_res_hit_data_piped = {23'b0, 1'b1, 40'b0};
    6'h29 : expct_res_hit_data_piped = {22'b0, 1'b1, 41'b0};
    6'h2A : expct_res_hit_data_piped = {21'b0, 1'b1, 42'b0};
    6'h2B : expct_res_hit_data_piped = {20'b0, 1'b1, 43'b0};
    6'h2C : expct_res_hit_data_piped = {19'b0, 1'b1, 44'b0};
    6'h2D : expct_res_hit_data_piped = {18'b0, 1'b1, 45'b0};
    6'h2E : expct_res_hit_data_piped = {17'b0, 1'b1, 46'b0};
    6'h2F : expct_res_hit_data_piped = {16'b0, 1'b1, 47'b0};

    6'h30 : expct_res_hit_data_piped = {15'b0, 1'b1, 48'b0};
    6'h31 : expct_res_hit_data_piped = {14'b0, 1'b1, 49'b0};
    6'h32 : expct_res_hit_data_piped = {13'b0, 1'b1, 50'b0};
    6'h33 : expct_res_hit_data_piped = {12'b0, 1'b1, 51'b0};
    6'h34 : expct_res_hit_data_piped = {11'b0, 1'b1, 52'b0};
    6'h35 : expct_res_hit_data_piped = {10'b0, 1'b1, 53'b0};
    6'h36 : expct_res_hit_data_piped = {9'b0, 1'b1, 54'b0};
    6'h37 : expct_res_hit_data_piped = {8'b0, 1'b1, 55'b0};
    6'h38 : expct_res_hit_data_piped = {7'b0, 1'b1, 56'b0};
    6'h39 : expct_res_hit_data_piped = {6'b0, 1'b1, 57'b0};
    6'h3A : expct_res_hit_data_piped = {5'b0, 1'b1, 58'b0};
    6'h3B : expct_res_hit_data_piped = {4'b0, 1'b1, 59'b0};
    6'h3C : expct_res_hit_data_piped = {3'b0, 1'b1, 60'b0};
    6'h3D : expct_res_hit_data_piped = {2'b0, 1'b1, 61'b0};
    6'h3E : expct_res_hit_data_piped = {1'b0, 1'b1, 62'b0};
  default : expct_res_hit_data_piped = {1'b1, 63'b0};
    
    endcase
  end

  assign    cam_fail_detect        =  (( ctest_piped3[2:0] == 3'b000 ) | ( ctest_piped3[2:0] == 3'b001 )) ?
//(( res_hit_data_piped[dmu_cb0_piped_addr] != 1'b1 ) & (  res_hit_data_piped[~dmu_cb0_piped_addr] != 1'b0 )) :
                     (expct_res_hit_data_piped[63:0] != res_hit_data_piped[63:0]) :
         ( ctest_piped3[2:0] == 3'b010 ) & (( crw_piped3[2:0] == 3'b001 ) | ( crw_piped3[2:0] == 3'b010 )) ?
                     (expct_res_hit_data_piped[63:0] != res_hit_data_piped[63:0]) :
                     ( ctest_piped3[2:0] == 3'b010 ) & ( crw_piped3[2:0] == 3'b011 )                      ?
                    (~expct_res_hit_data_piped[63:0] != res_hit_data_piped[63:0]) :
                                 ( res_hit_data_piped[63:0] != 64'b0);


// fixscan start:
assign config_reg_scanin         = scan_in                  ;
assign user_data_reg_scanin      = config_reg_scanout       ;
assign user_start_addr_reg_scanin = user_data_reg_scanout    ;
assign user_stop_addr_reg_scanin = user_start_addr_reg_scanout;
assign user_incr_addr_reg_scanin = user_stop_addr_reg_scanout;
assign user_array_sel_reg_scanin = user_incr_addr_reg_scanout;
assign user_cam_mode_reg_scanin  = user_array_sel_reg_scanout;
assign user_cam_select_reg_scanin = user_cam_mode_reg_scanout;
assign user_cam_test_select_reg_scanin = user_cam_select_reg_scanout;
assign user_bisi_wr_reg_scanin   = user_cam_test_select_reg_scanout;
assign user_bisi_rd_reg_scanin   = user_bisi_wr_reg_scanout ;
assign start_transition_reg_scanin = user_bisi_rd_reg_scanout ;
assign run_reg_scanin            = start_transition_reg_scanout;
assign run1_reg_scanin           = run_reg_scanout          ;
assign run2_reg_scanin           = run1_reg_scanout         ;
assign addr_reg_scanin           = run2_reg_scanout         ;
assign key_reg_scanin            = addr_reg_scanout         ;
assign wr_rd_en_reg_scanin       = key_reg_scanout          ;
assign hld_reg_scanin            = wr_rd_en_reg_scanout     ;
assign done_reg_scanin           = hld_reg_scanout          ;
assign mbist_fail_reg_scanin     = done_reg_scanout         ;
assign read_data_pipe_reg_scanin = mbist_fail_reg_scanout   ;
assign hit_data_pipe_reg_scanin  = read_data_pipe_reg_scanout;
assign control_reg_scanin        = hit_data_pipe_reg_scanout;
assign done_counter_reg_scanin   = control_reg_scanout      ;
assign cam_cntl_reg_scanin       = done_counter_reg_scanout ;
assign addr_pipe_reg1_scanin     = cam_cntl_reg_scanout     ;
assign addr_pipe_reg2_scanin     = addr_pipe_reg1_scanout   ;
assign data_pipe_reg1_scanin     = addr_pipe_reg2_scanout   ;
assign data_pipe_reg2_scanin     = data_pipe_reg1_scanout   ;
assign vtb_sel_pipe_reg1_scanin  = data_pipe_reg2_scanout   ;
assign vtb_sel_pipe_reg2_scanin  = vtb_sel_pipe_reg1_scanout;
assign vtb_ren_pipe_reg1_scanin  = vtb_sel_pipe_reg2_scanout;
assign vtb_ren_pipe_reg2_scanin  = vtb_ren_pipe_reg1_scanout;
assign ptb_ren_pipe_reg1_scanin  = vtb_ren_pipe_reg2_scanout;
assign ptb_ren_pipe_reg2_scanin  = ptb_ren_pipe_reg1_scanout;
assign cam_vtb_sel_pipe_reg1_scanin = ptb_ren_pipe_reg2_scanout;
assign cam_vtb_sel_pipe_reg2_scanin = cam_vtb_sel_pipe_reg1_scanout;
assign vtb_lkup_en_pipe_reg1_scanin = cam_vtb_sel_pipe_reg2_scanout;
assign vtb_lkup_en_pipe_reg2_scanin = vtb_lkup_en_pipe_reg1_scanout;
assign ptb_lkup_en_pipe_reg1_scanin = vtb_lkup_en_pipe_reg2_scanout;
assign ptb_lkup_en_pipe_reg2_scanin = ptb_lkup_en_pipe_reg1_scanout;
assign ctest_pipe_reg1_scanin    = ptb_lkup_en_pipe_reg2_scanout;
assign ctest_pipe_reg2_scanin    = ctest_pipe_reg1_scanout  ;
assign ctest_pipe_reg3_scanin    = ctest_pipe_reg2_scanout  ;
assign crw_pipe_reg1_scanin      = ctest_pipe_reg3_scanout  ;
assign crw_pipe_reg2_scanin      = crw_pipe_reg1_scanout    ;
assign crw_pipe_reg3_scanin      = crw_pipe_reg2_scanout    ;
assign fail_reg_scanin           = crw_pipe_reg3_scanout    ;
assign cam_fail_reg_scanin       = fail_reg_scanout         ;
assign scan_out                  = cam_fail_reg_scanout     ;
// fixscan end:
endmodule 






// any PARAMS parms go into naming of macro

module dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_8 (
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

module dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_6 (
  din, 
  reset, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [5:1] sout;

  input [5:0] din;
  input reset;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0] & {6 {reset}};









    







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
.si(scan_in),
.so(sout[5]),
.reset(reset),
.q(dout[5])
);




endmodule













// any PARAMS parms go into naming of macro

module dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_1 (
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

module dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_3 (
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

module dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_33 (
  din, 
  reset, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [32:0] fdin;
wire [32:1] sout;

  input [32:0] din;
  input reset;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [32:0] dout;
  output scan_out;
assign fdin[32:0] = din[32:0] & {33 {reset}};









    







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
.si(sout[20]),
.so(sout[19]),
.reset(reset),
.q(dout[19])
);
cl_a1_msff_syrst_4x d0_20 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[20]),
.si(sout[21]),
.so(sout[20]),
.reset(reset),
.q(dout[20])
);
cl_a1_msff_syrst_4x d0_21 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[21]),
.si(sout[22]),
.so(sout[21]),
.reset(reset),
.q(dout[21])
);
cl_a1_msff_syrst_4x d0_22 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[22]),
.si(sout[23]),
.so(sout[22]),
.reset(reset),
.q(dout[22])
);
cl_a1_msff_syrst_4x d0_23 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[23]),
.si(sout[24]),
.so(sout[23]),
.reset(reset),
.q(dout[23])
);
cl_a1_msff_syrst_4x d0_24 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[24]),
.si(sout[25]),
.so(sout[24]),
.reset(reset),
.q(dout[24])
);
cl_a1_msff_syrst_4x d0_25 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[25]),
.si(sout[26]),
.so(sout[25]),
.reset(reset),
.q(dout[25])
);
cl_a1_msff_syrst_4x d0_26 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[26]),
.si(sout[27]),
.so(sout[26]),
.reset(reset),
.q(dout[26])
);
cl_a1_msff_syrst_4x d0_27 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[27]),
.si(sout[28]),
.so(sout[27]),
.reset(reset),
.q(dout[27])
);
cl_a1_msff_syrst_4x d0_28 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[28]),
.si(sout[29]),
.so(sout[28]),
.reset(reset),
.q(dout[28])
);
cl_a1_msff_syrst_4x d0_29 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[29]),
.si(sout[30]),
.so(sout[29]),
.reset(reset),
.q(dout[29])
);
cl_a1_msff_syrst_4x d0_30 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[30]),
.si(sout[31]),
.so(sout[30]),
.reset(reset),
.q(dout[30])
);
cl_a1_msff_syrst_4x d0_31 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31]),
.si(sout[32]),
.so(sout[31]),
.reset(reset),
.q(dout[31])
);
cl_a1_msff_syrst_4x d0_32 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[32]),
.si(scan_in),
.so(sout[32]),
.reset(reset),
.q(dout[32])
);




endmodule













// any PARAMS parms go into naming of macro

module dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_64 (
  din, 
  reset, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [63:1] sout;

  input [63:0] din;
  input reset;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = din[63:0] & {64 {reset}};









    







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
.si(sout[20]),
.so(sout[19]),
.reset(reset),
.q(dout[19])
);
cl_a1_msff_syrst_4x d0_20 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[20]),
.si(sout[21]),
.so(sout[20]),
.reset(reset),
.q(dout[20])
);
cl_a1_msff_syrst_4x d0_21 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[21]),
.si(sout[22]),
.so(sout[21]),
.reset(reset),
.q(dout[21])
);
cl_a1_msff_syrst_4x d0_22 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[22]),
.si(sout[23]),
.so(sout[22]),
.reset(reset),
.q(dout[22])
);
cl_a1_msff_syrst_4x d0_23 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[23]),
.si(sout[24]),
.so(sout[23]),
.reset(reset),
.q(dout[23])
);
cl_a1_msff_syrst_4x d0_24 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[24]),
.si(sout[25]),
.so(sout[24]),
.reset(reset),
.q(dout[24])
);
cl_a1_msff_syrst_4x d0_25 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[25]),
.si(sout[26]),
.so(sout[25]),
.reset(reset),
.q(dout[25])
);
cl_a1_msff_syrst_4x d0_26 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[26]),
.si(sout[27]),
.so(sout[26]),
.reset(reset),
.q(dout[26])
);
cl_a1_msff_syrst_4x d0_27 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[27]),
.si(sout[28]),
.so(sout[27]),
.reset(reset),
.q(dout[27])
);
cl_a1_msff_syrst_4x d0_28 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[28]),
.si(sout[29]),
.so(sout[28]),
.reset(reset),
.q(dout[28])
);
cl_a1_msff_syrst_4x d0_29 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[29]),
.si(sout[30]),
.so(sout[29]),
.reset(reset),
.q(dout[29])
);
cl_a1_msff_syrst_4x d0_30 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[30]),
.si(sout[31]),
.so(sout[30]),
.reset(reset),
.q(dout[30])
);
cl_a1_msff_syrst_4x d0_31 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31]),
.si(sout[32]),
.so(sout[31]),
.reset(reset),
.q(dout[31])
);
cl_a1_msff_syrst_4x d0_32 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[32]),
.si(sout[33]),
.so(sout[32]),
.reset(reset),
.q(dout[32])
);
cl_a1_msff_syrst_4x d0_33 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[33]),
.si(sout[34]),
.so(sout[33]),
.reset(reset),
.q(dout[33])
);
cl_a1_msff_syrst_4x d0_34 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[34]),
.si(sout[35]),
.so(sout[34]),
.reset(reset),
.q(dout[34])
);
cl_a1_msff_syrst_4x d0_35 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[35]),
.si(sout[36]),
.so(sout[35]),
.reset(reset),
.q(dout[35])
);
cl_a1_msff_syrst_4x d0_36 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[36]),
.si(sout[37]),
.so(sout[36]),
.reset(reset),
.q(dout[36])
);
cl_a1_msff_syrst_4x d0_37 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[37]),
.si(sout[38]),
.so(sout[37]),
.reset(reset),
.q(dout[37])
);
cl_a1_msff_syrst_4x d0_38 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[38]),
.si(sout[39]),
.so(sout[38]),
.reset(reset),
.q(dout[38])
);
cl_a1_msff_syrst_4x d0_39 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[39]),
.si(sout[40]),
.so(sout[39]),
.reset(reset),
.q(dout[39])
);
cl_a1_msff_syrst_4x d0_40 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[40]),
.si(sout[41]),
.so(sout[40]),
.reset(reset),
.q(dout[40])
);
cl_a1_msff_syrst_4x d0_41 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[41]),
.si(sout[42]),
.so(sout[41]),
.reset(reset),
.q(dout[41])
);
cl_a1_msff_syrst_4x d0_42 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[42]),
.si(sout[43]),
.so(sout[42]),
.reset(reset),
.q(dout[42])
);
cl_a1_msff_syrst_4x d0_43 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[43]),
.si(sout[44]),
.so(sout[43]),
.reset(reset),
.q(dout[43])
);
cl_a1_msff_syrst_4x d0_44 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[44]),
.si(sout[45]),
.so(sout[44]),
.reset(reset),
.q(dout[44])
);
cl_a1_msff_syrst_4x d0_45 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[45]),
.si(sout[46]),
.so(sout[45]),
.reset(reset),
.q(dout[45])
);
cl_a1_msff_syrst_4x d0_46 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[46]),
.si(sout[47]),
.so(sout[46]),
.reset(reset),
.q(dout[46])
);
cl_a1_msff_syrst_4x d0_47 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[47]),
.si(sout[48]),
.so(sout[47]),
.reset(reset),
.q(dout[47])
);
cl_a1_msff_syrst_4x d0_48 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[48]),
.si(sout[49]),
.so(sout[48]),
.reset(reset),
.q(dout[48])
);
cl_a1_msff_syrst_4x d0_49 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[49]),
.si(sout[50]),
.so(sout[49]),
.reset(reset),
.q(dout[49])
);
cl_a1_msff_syrst_4x d0_50 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[50]),
.si(sout[51]),
.so(sout[50]),
.reset(reset),
.q(dout[50])
);
cl_a1_msff_syrst_4x d0_51 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[51]),
.si(sout[52]),
.so(sout[51]),
.reset(reset),
.q(dout[51])
);
cl_a1_msff_syrst_4x d0_52 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[52]),
.si(sout[53]),
.so(sout[52]),
.reset(reset),
.q(dout[52])
);
cl_a1_msff_syrst_4x d0_53 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[53]),
.si(sout[54]),
.so(sout[53]),
.reset(reset),
.q(dout[53])
);
cl_a1_msff_syrst_4x d0_54 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[54]),
.si(sout[55]),
.so(sout[54]),
.reset(reset),
.q(dout[54])
);
cl_a1_msff_syrst_4x d0_55 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[55]),
.si(sout[56]),
.so(sout[55]),
.reset(reset),
.q(dout[55])
);
cl_a1_msff_syrst_4x d0_56 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[56]),
.si(sout[57]),
.so(sout[56]),
.reset(reset),
.q(dout[56])
);
cl_a1_msff_syrst_4x d0_57 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[57]),
.si(sout[58]),
.so(sout[57]),
.reset(reset),
.q(dout[57])
);
cl_a1_msff_syrst_4x d0_58 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[58]),
.si(sout[59]),
.so(sout[58]),
.reset(reset),
.q(dout[58])
);
cl_a1_msff_syrst_4x d0_59 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[59]),
.si(sout[60]),
.so(sout[59]),
.reset(reset),
.q(dout[59])
);
cl_a1_msff_syrst_4x d0_60 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[60]),
.si(sout[61]),
.so(sout[60]),
.reset(reset),
.q(dout[60])
);
cl_a1_msff_syrst_4x d0_61 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[61]),
.si(sout[62]),
.so(sout[61]),
.reset(reset),
.q(dout[61])
);
cl_a1_msff_syrst_4x d0_62 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[62]),
.si(sout[63]),
.so(sout[62]),
.reset(reset),
.q(dout[62])
);
cl_a1_msff_syrst_4x d0_63 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63]),
.si(scan_in),
.so(sout[63]),
.reset(reset),
.q(dout[63])
);




endmodule













// any PARAMS parms go into naming of macro

module dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_19 (
  din, 
  reset, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [18:0] fdin;
wire [18:1] sout;

  input [18:0] din;
  input reset;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [18:0] dout;
  output scan_out;
assign fdin[18:0] = din[18:0] & {19 {reset}};









    







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
.si(scan_in),
.so(sout[18]),
.reset(reset),
.q(dout[18])
);




endmodule













// any PARAMS parms go into naming of macro

module dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_15 (
  din, 
  reset, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [14:0] fdin;
wire [14:1] sout;

  input [14:0] din;
  input reset;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [14:0] dout;
  output scan_out;
assign fdin[14:0] = din[14:0] & {15 {reset}};









    







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
.si(scan_in),
.so(sout[14]),
.reset(reset),
.q(dout[14])
);




endmodule













// any PARAMS parms go into naming of macro

module dmu_cb0_msff_ctl_macro__library_a1__reset_1__width_2 (
  din, 
  reset, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [1:1] sout;

  input [1:0] din;
  input reset;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0] & {2 {reset}};









    







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
.si(scan_in),
.so(sout[1]),
.reset(reset),
.q(dout[1])
);




endmodule








