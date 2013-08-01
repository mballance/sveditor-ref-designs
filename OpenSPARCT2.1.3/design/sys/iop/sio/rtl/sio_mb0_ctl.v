// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sio_mb0_ctl.v
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
module sio_mb0_ctl (
  sio_mb0_run, 
  sio_mb0_old_addr, 
  sio_mb0_wdata, 
  sio_mb0_sel_l1, 
  sio_mb0_sel_l2, 
  sio_mb0_old0x_wr_en, 
  sio_mb0_old0x_rd_en, 
  sio_mb0_old1x_wr_en, 
  sio_mb0_old1x_rd_en, 
  sio_mb0_old2x_wr_en, 
  sio_mb0_old2x_rd_en, 
  sio_mb0_old3x_wr_en, 
  sio_mb0_old3x_rd_en, 
  sio_mb0_old4x_wr_en, 
  sio_mb0_old4x_rd_en, 
  sio_mb0_old5x_wr_en, 
  sio_mb0_old5x_rd_en, 
  sio_mb0_old6x_wr_en, 
  sio_mb0_old6x_rd_en, 
  sio_mb0_old7x_wr_en, 
  sio_mb0_old7x_rd_en, 
  sio_mb0_done, 
  sio_mb0_fail, 
  scan_out, 
  l2clk, 
  tcu_scan_en, 
  scan_in, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_sio_mb0_start, 
  sio_mb0_bisi_mode, 
  sio_mb0_user_mode, 
  read_data_top, 
  read_data_bot);
wire se;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire l1clk;
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
wire [4:0] user_start_addr_in;
wire [4:0] user_start_addr;
wire user_stop_addr_reg_scanin;
wire user_stop_addr_reg_scanout;
wire [4:0] user_stop_addr_in;
wire [4:0] user_stop_addr;
wire user_incr_addr_reg_scanin;
wire user_incr_addr_reg_scanout;
wire [4:0] user_incr_addr_in;
wire [4:0] user_incr_addr;
wire user_array_sel_reg_scanin;
wire user_array_sel_reg_scanout;
wire [2:0] user_array_sel_in;
wire [2:0] user_array_sel;
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
wire [4:0] mbist_address;
wire wdata_reg_scanin;
wire wdata_reg_scanout;
wire [7:0] mbist_wdata;
wire rd_wr_en_reg0_scanin;
wire rd_wr_en_reg0_scanout;
wire mbist_old0x_wr_en;
wire mbist_old0x_rd_en;
wire rd_wr_en_reg1_scanin;
wire rd_wr_en_reg1_scanout;
wire mbist_old1x_wr_en;
wire mbist_old1x_rd_en;
wire rd_wr_en_reg2_scanin;
wire rd_wr_en_reg2_scanout;
wire mbist_old2x_wr_en;
wire mbist_old2x_rd_en;
wire rd_wr_en_reg3_scanin;
wire rd_wr_en_reg3_scanout;
wire mbist_old3x_wr_en;
wire mbist_old3x_rd_en;
wire rd_wr_en_reg4_scanin;
wire rd_wr_en_reg4_scanout;
wire mbist_old4x_wr_en;
wire mbist_old4x_rd_en;
wire rd_wr_en_reg5_scanin;
wire rd_wr_en_reg5_scanout;
wire mbist_old5x_wr_en;
wire mbist_old5x_rd_en;
wire rd_wr_en_reg6_scanin;
wire rd_wr_en_reg6_scanout;
wire mbist_old6x_wr_en;
wire mbist_old6x_rd_en;
wire rd_wr_en_reg7_scanin;
wire rd_wr_en_reg7_scanout;
wire mbist_old7x_wr_en;
wire mbist_old7x_rd_en;
wire sio_mb0_fail_reg_scanin;
wire sio_mb0_fail_reg_scanout;
wire fail;
wire sio_mb0_done_reg_scanin;
wire sio_mb0_done_reg_scanout;
wire [67:0] read_data;
wire sio_mb0_sel_l3;
wire read_data_pipe_reg_scanin;
wire read_data_pipe_reg_scanout;
wire [67:0] read_data_pipe;
wire control_reg_scanin;
wire control_reg_scanout;
wire [19:0] control_in;
wire [19:0] control_out;
wire bisi_wr_rd;
wire [2:0] array_sel;
wire [1:0] data_control;
wire address_mix;
wire [3:0] march_element;
wire [4:0] array_address;
wire upaddress_march;
wire [2:0] read_write_control;
wire five_cycle_march;
wire one_cycle_march;
wire increment_addr;
wire [4:0] start_addr;
wire [4:0] next_array_address;
wire next_upaddr_march;
wire next_downaddr_march;
wire [4:0] stop_addr;
wire [5:0] overflow_addr;
wire [4:0] incr_addr;
wire overflow;
wire [5:0] compare_addr;
wire [4:0] add;
wire [4:0] adj_address;
wire increment_march_elem;
wire [2:0] next_array_sel;
wire [1:0] next_data_control;
wire next_address_mix;
wire [3:0] next_march_element;
wire array_write;
wire array_read;
wire true_data;
wire [7:0] data_pattern;
wire done_counter_reg_scanin;
wire done_counter_reg_scanout;
wire [2:0] done_counter_in;
wire [2:0] done_counter_out;
wire old0x_sel;
wire old1x_sel;
wire old2x_sel;
wire old3x_sel;
wire old4x_sel;
wire old5x_sel;
wire old6x_sel;
wire old7x_sel;
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
wire data_pipe_reg4_scanin;
wire data_pipe_reg4_scanout;
wire [7:0] data_pipe_reg4_in;
wire [7:0] data_pipe_out4;
wire [7:0] sio_old_piped_data;
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
wire ren_pipe_reg4_scanin;
wire ren_pipe_reg4_scanout;
wire ren_pipe_reg4_in;
wire ren_pipe_out4;
wire ren_pipe_reg5_scanin;
wire ren_pipe_reg5_scanout;
wire ren_pipe_reg5_in;
wire ren_pipe_out5;
wire sio_old_piped_ren;
wire ary_sel_pipe_reg1_scanin;
wire ary_sel_pipe_reg1_scanout;
wire [2:0] ary_sel_pipe_reg1_in;
wire [2:0] ary_sel_pipe_out1;
wire ary_sel_pipe_reg2_scanin;
wire ary_sel_pipe_reg2_scanout;
wire [2:0] ary_sel_pipe_reg2_in;
wire [2:0] ary_sel_pipe_out2;
wire ary_sel_pipe_reg3_scanin;
wire ary_sel_pipe_reg3_scanout;
wire [2:0] ary_sel_pipe_reg3_in;
wire [2:0] ary_sel_pipe_out3;
wire ary_sel_pipe_reg4_scanin;
wire ary_sel_pipe_reg4_scanout;
wire [2:0] ary_sel_pipe_reg4_in;
wire [2:0] ary_sel_pipe_out4;
wire ary_sel_pipe_reg5_scanin;
wire ary_sel_pipe_reg5_scanout;
wire [2:0] ary_sel_pipe_reg5_in;
wire [2:0] ary_sel_pipe_out5;
wire [2:0] piped_array_sel;
wire old0x_sel_piped;
wire old1x_sel_piped;
wire old2x_sel_piped;
wire old3x_sel_piped;
wire old4x_sel_piped;
wire old5x_sel_piped;
wire old6x_sel_piped;
wire old7x_sel_piped;
wire spares_scanin;
wire spares_scanout;
wire fail_reg_scanin;
wire fail_reg_scanout;
wire [7:0] fail_reg_in;
wire [7:0] fail_reg_out;
wire qual_sio_old7x_fail;
wire qual_sio_old6x_fail;
wire qual_sio_old5x_fail;
wire qual_sio_old4x_fail;
wire qual_sio_old3x_fail;
wire qual_sio_old2x_fail;
wire qual_sio_old1x_fail;
wire qual_sio_old0x_fail;
wire fail_detect;
wire fail_detect_lo;
wire fail_detect_hi;



   output 	  sio_mb0_run;

   output [4:0]	  sio_mb0_old_addr;
   output [7:0]   sio_mb0_wdata;

   output 	  sio_mb0_sel_l1; // To select 1x over 0x, 3x over 2x, 5x over 4x, 7x over 6x.
   output 	  sio_mb0_sel_l2; // To select RHS old's over LHS.

   output 	  sio_mb0_old0x_wr_en;
   output 	  sio_mb0_old0x_rd_en;
   
   output 	  sio_mb0_old1x_wr_en;
   output 	  sio_mb0_old1x_rd_en;
   
   output 	  sio_mb0_old2x_wr_en;
   output 	  sio_mb0_old2x_rd_en;
   
   output 	  sio_mb0_old3x_wr_en;
   output 	  sio_mb0_old3x_rd_en;
   
   output 	  sio_mb0_old4x_wr_en;
   output 	  sio_mb0_old4x_rd_en;
   
   output 	  sio_mb0_old5x_wr_en;
   output 	  sio_mb0_old5x_rd_en;
   
   output 	  sio_mb0_old6x_wr_en;
   output 	  sio_mb0_old6x_rd_en;
   
   output 	  sio_mb0_old7x_wr_en;
   output 	  sio_mb0_old7x_rd_en;
   
   output     sio_mb0_done;
   output     sio_mb0_fail;
   output 	  scan_out;

   input      l2clk;
   input 	  tcu_scan_en;
   input 	  scan_in;
   input 	  tcu_aclk;
   input 	  tcu_bclk; 
   input 	  tcu_pce_ov;
   input 	  tcu_clk_stop;

   input          tcu_sio_mb0_start;
   input          sio_mb0_bisi_mode;
   input          sio_mb0_user_mode; 

   input [67:0]   read_data_top;
   input [67:0]   read_data_bot;

   
   ///////////////////////////////////////
   // Scan chain connections            
   ///////////////////////////////////////
   // scan renames
   assign 	  se = tcu_scan_en;
   assign 	  siclk = tcu_aclk;
   assign 	  soclk = tcu_bclk;
   assign 	  pce_ov = tcu_pce_ov;
   assign 	  stop = tcu_clk_stop;
   // end scan

   sio_mb0_ctl_l1clkhdr_ctl_macro clkgen (
			      .l2clk  (l2clk  ),
			      .l1en   (1'b1 ),
			      .l1clk  (l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
			      );

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
 

  sio_mb0_ctl_msff_ctl_macro__width_8 config_reg  (
               .scan_in(config_reg_scanin),
               .scan_out(config_reg_scanout),
               .din      ( config_in[7:0]       ),
               .dout     ( config_out[7:0]      ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign config_in[0]        =    tcu_sio_mb0_start;
  assign config_in[1]        =    config_out[0];
  assign start_transition    =    config_out[0]      &  ~config_out[1];
  assign reset_engine        =    start_transition   |  (mbist_user_loop_mode  &  mbist_done);
//  assign run                 =    config_out[1]      &  ~mbist_done;
//  assign run                 =    config_out[1]      &  (mbist_user_loop_mode | ~mbist_done);
  assign run                 =    config_out[0] & config_out[1]; // 9/19/05 run to follow start only!

  assign config_in[2]        =    start_transition   ?   sio_mb0_bisi_mode:      config_out[2];
  assign bisi                =    config_out[2];

  assign config_in[3]        =    start_transition   ?   sio_mb0_user_mode:      config_out[3];
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


  sio_mb0_ctl_msff_ctl_macro__width_8 user_data_reg  (
                 .scan_in(user_data_reg_scanin),
                 .scan_out(user_data_reg_scanout),
                 .din      ( user_data_in[7:0]       ),
                 .dout     ( user_data_out[7:0]      ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign user_data_in[7:0]    =    user_data_out[7:0];


// Defining User start, stop, and increment addresses.

  sio_mb0_ctl_msff_ctl_macro__width_5 user_start_addr_reg  (
                 .scan_in(user_start_addr_reg_scanin),
                 .scan_out(user_start_addr_reg_scanout),
                 .din      ( user_start_addr_in[4:0]  ),
                 .dout     ( user_start_addr[4:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_start_addr_in[4:0]   =    user_start_addr[4:0];

  sio_mb0_ctl_msff_ctl_macro__width_5 user_stop_addr_reg  (
                 .scan_in(user_stop_addr_reg_scanin),
                 .scan_out(user_stop_addr_reg_scanout),
                 .din      ( user_stop_addr_in[4:0]  ),
                 .dout     ( user_stop_addr[4:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_stop_addr_in[4:0]   =    user_stop_addr[4:0];


  sio_mb0_ctl_msff_ctl_macro__width_5 user_incr_addr_reg  (
                 .scan_in(user_incr_addr_reg_scanin),
                 .scan_out(user_incr_addr_reg_scanout),
                 .din      ( user_incr_addr_in[4:0]  ),
                 .dout     ( user_incr_addr[4:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_incr_addr_in[4:0]   =    user_incr_addr[4:0];

// Defining User array_sel.

  sio_mb0_ctl_msff_ctl_macro__width_3 user_array_sel_reg  (
                 .scan_in(user_array_sel_reg_scanin),
                 .scan_out(user_array_sel_reg_scanout),
                 .din      ( user_array_sel_in[2:0]  ),
                 .dout     ( user_array_sel[2:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_array_sel_in[2:0]   =    user_array_sel[2:0];

// Defining user_bisi write and read registers

  sio_mb0_ctl_msff_ctl_macro__width_1 user_bisi_wr_reg  (
                 .scan_in(user_bisi_wr_reg_scanin),
                 .scan_out(user_bisi_wr_reg_scanout),
                 .din      ( user_bisi_wr_mode_in  ),
                 .dout     ( user_bisi_wr_mode ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_bisi_wr_mode_in     =    user_bisi_wr_mode;

  sio_mb0_ctl_msff_ctl_macro__width_1 user_bisi_rd_reg  (
                 .scan_in(user_bisi_rd_reg_scanin),
                 .scan_out(user_bisi_rd_reg_scanout),
                 .din      ( user_bisi_rd_mode_in  ),
                 .dout     ( user_bisi_rd_mode ),
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

  sio_mb0_ctl_msff_ctl_macro__width_1 start_transition_reg  (
               .scan_in(start_transition_reg_scanin),
               .scan_out(start_transition_reg_scanout),
               .din      ( start_transition ),
               .dout     ( start_transition_piped ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////////////////////////////////////
// Staging run for 3 cycles 
////////////////////////////////////////////////////////////////////////////////

  sio_mb0_ctl_msff_ctl_macro__width_1 run_reg  (
               .scan_in(run_reg_scanin),
               .scan_out(run_reg_scanout),
               .din      ( run ),
               .dout     ( sio_mb0_run ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//Adding 2 extra pipeline stages to run to delay the start of mbist for 3 cycles.
  sio_mb0_ctl_msff_ctl_macro__width_1 run1_reg  (
               .scan_in(run1_reg_scanin),
               .scan_out(run1_reg_scanout),
               .din      ( run1_in ),
               .dout     ( run1_out ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign run1_in = reset_engine        ?   1'b0:      sio_mb0_run;

  sio_mb0_ctl_msff_ctl_macro__width_1 run2_reg  (
               .scan_in(run2_reg_scanin),
               .scan_out(run2_reg_scanout),
               .din      ( run2_in ),
               .dout     ( run2_out ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign run2_in = reset_engine        ?   1'b0:      run1_out;
//  assign run_piped3 = run2_out & run;
  assign run_piped3 = config_out[0] & run2_out & ~msb;



// /////////////////////////////////////////////////////////////////////////////
// Pipelining mbist outputs and inputs.
// /////////////////////////////////////////////////////////////////////////////

  sio_mb0_ctl_msff_ctl_macro__width_5 addr_reg  (
               .scan_in(addr_reg_scanin),
               .scan_out(addr_reg_scanout),
               .din      ( mbist_address[4:0]     ),
               .dout     ( sio_mb0_old_addr[4:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_8 wdata_reg  (
               .scan_in(wdata_reg_scanin),
               .scan_out(wdata_reg_scanout),
               .din      ( mbist_wdata[7:0]      ),
               .dout     ( sio_mb0_wdata[7:0]   ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_2 rd_wr_en_reg0  (
               .scan_in(rd_wr_en_reg0_scanin),
               .scan_out(rd_wr_en_reg0_scanout),
               .din      ( {mbist_old0x_wr_en, mbist_old0x_rd_en} ),
               .dout     ( {sio_mb0_old0x_wr_en, sio_mb0_old0x_rd_en} ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_2 rd_wr_en_reg1  (
               .scan_in(rd_wr_en_reg1_scanin),
               .scan_out(rd_wr_en_reg1_scanout),
               .din      ( {mbist_old1x_wr_en, mbist_old1x_rd_en} ),
               .dout     ( {sio_mb0_old1x_wr_en, sio_mb0_old1x_rd_en} ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_2 rd_wr_en_reg2  (
               .scan_in(rd_wr_en_reg2_scanin),
               .scan_out(rd_wr_en_reg2_scanout),
               .din      ( {mbist_old2x_wr_en, mbist_old2x_rd_en} ),
               .dout     ( {sio_mb0_old2x_wr_en, sio_mb0_old2x_rd_en} ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_2 rd_wr_en_reg3  (
               .scan_in(rd_wr_en_reg3_scanin),
               .scan_out(rd_wr_en_reg3_scanout),
               .din      ( {mbist_old3x_wr_en, mbist_old3x_rd_en} ),
               .dout     ( {sio_mb0_old3x_wr_en, sio_mb0_old3x_rd_en} ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_2 rd_wr_en_reg4  (
               .scan_in(rd_wr_en_reg4_scanin),
               .scan_out(rd_wr_en_reg4_scanout),
               .din      ( {mbist_old4x_wr_en, mbist_old4x_rd_en} ),
               .dout     ( {sio_mb0_old4x_wr_en, sio_mb0_old4x_rd_en} ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_2 rd_wr_en_reg5  (
               .scan_in(rd_wr_en_reg5_scanin),
               .scan_out(rd_wr_en_reg5_scanout),
               .din      ( {mbist_old5x_wr_en, mbist_old5x_rd_en} ),
               .dout     ( {sio_mb0_old5x_wr_en, sio_mb0_old5x_rd_en} ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_2 rd_wr_en_reg6  (
               .scan_in(rd_wr_en_reg6_scanin),
               .scan_out(rd_wr_en_reg6_scanout),
               .din      ( {mbist_old6x_wr_en, mbist_old6x_rd_en} ),
               .dout     ( {sio_mb0_old6x_wr_en, sio_mb0_old6x_rd_en} ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_2 rd_wr_en_reg7  (
               .scan_in(rd_wr_en_reg7_scanin),
               .scan_out(rd_wr_en_reg7_scanout),
               .din      ( {mbist_old7x_wr_en, mbist_old7x_rd_en} ),
               .dout     ( {sio_mb0_old7x_wr_en, sio_mb0_old7x_rd_en} ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Flopping the done and fail

  sio_mb0_ctl_msff_ctl_macro__width_1  sio_mb0_fail_reg (
               .scan_in(sio_mb0_fail_reg_scanin),
               .scan_out(sio_mb0_fail_reg_scanout),
               .din        ( fail  ),
               .dout       ( sio_mb0_fail    ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_1  sio_mb0_done_reg (
               .scan_in(sio_mb0_done_reg_scanin),
               .scan_out(sio_mb0_done_reg_scanout),
               .din        ( mbist_done  ),
               .dout       ( sio_mb0_done    ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Selecting and Pipelining the read_data 

  assign   read_data[67:0] = sio_mb0_sel_l3 ? read_data_bot[67:0] : read_data_top[67:0];

  sio_mb0_ctl_msff_ctl_macro__width_68 read_data_pipe_reg  (
                   .scan_in(read_data_pipe_reg_scanin),
                   .scan_out(read_data_pipe_reg_scanout),
                   .din      ( read_data[67:0]   ),
                   .dout     ( read_data_pipe[67:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


// /////////////////////////////////////////////////////////////////////////////
//
// MBIST Control Register
//
// /////////////////////////////////////////////////////////////////////////////
// Remove Address mix disable before delivery
// /////////////////////////////////////////////////////////////////////////////

   sio_mb0_ctl_msff_ctl_macro__width_20 control_reg  (
                      .scan_in(control_reg_scanin),
                      .scan_out(control_reg_scanout),
                      .din   ( control_in[19:0]           ),
                      .dout  ( control_out[19:0]          ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign   msb                       =     control_out[19];
  assign   bisi_wr_rd     = (bisi & ~user_mode) | mbist_user_bisi_wr_rd_mode ? control_out[18] : 1'b1;
  assign   array_sel[2:0]            =     user_mode           ?  user_array_sel[2:0] : control_out[17:15];
  assign   data_control[1:0]         =     control_out[14:13];
  assign   address_mix               = ( bisi | mbist_user_addr_mode) ?  1'b0:   control_out[12];
  assign   march_element[3:0]        =     control_out[11:8];
  assign   array_address[4:0]        =     upaddress_march     ?  control_out[7:3] : ~control_out[7:3];
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
  assign   control_in[7:3]  =     start_transition_piped || reset_engine ?  start_addr[4:0]:
                                        ~run_piped3 || ~increment_addr   ?  control_out[7:3]:
                                                                           next_array_address[4:0];

  assign   next_array_address[4:0]   =    next_upaddr_march      ?  start_addr[4:0]:
                                          next_downaddr_march    ?  ~stop_addr[4:0]:
                                                                   (overflow_addr[4:0]);     // array_addr + incr_addr

  assign   start_addr[4:0]           =    mbist_user_addr_mode   ?   user_start_addr[4:0] : 5'b00000;
  assign   stop_addr[4:0]            =    mbist_user_addr_mode   ?   user_stop_addr[4:0] : 5'b11111;
  assign   incr_addr[4:0]            =    mbist_user_addr_mode   ?   user_incr_addr[4:0] : 5'b00001;

  assign   overflow_addr[5:0]        =    {1'b0,control_out[7:3]} + {1'b0,incr_addr[4:0]};
  assign   overflow                  =    compare_addr[5:0] < overflow_addr[5:0];

  assign   compare_addr[5:0]         =    upaddress_march       ?  {1'b0, stop_addr[4:0]} :
                                                                   {1'b0, ~start_addr[4:0]}; 

  assign   next_upaddr_march         =   ( (march_element[3:0] == 4'h0) || (march_element[3:0] == 4'h1) || 
                                           (march_element[3:0] == 4'h6) || (march_element[3:0] == 4'h5) || 
                                           (march_element[3:0] == 4'h8) ) && overflow; 
   
  assign   next_downaddr_march       =   ( (march_element[3:0] == 4'h2) || (march_element[3:0] == 4'h7) ||
                                           (march_element[3:0] == 4'h3) || (march_element[3:0] == 4'h4) ) && 
                                            overflow; 
   

   
  assign   add[4:0]                  =     five_cycle_march && ( (read_write_control[2:0] == 3'h1) || 
                                                                 (read_write_control[2:0] == 3'h3)) ?   
                                                                 adj_address[4:0]:    array_address[4:0];

  assign   adj_address[4:0]          =     { array_address[4:2], ~array_address[1], array_address[0] };  
  assign   mbist_address[4:0]        =     address_mix         ?  {add[0],add[4],add[3],add[2],add[1]}: // fast bank
                                                                    add[4:0];

// Definition of the rest of the control register  
  assign   increment_march_elem      =     increment_addr && overflow;

  assign   control_in[19:8]          =     reset_engine        ?   12'b0:
                                          ~run_piped3          ?   control_out[19:8]:
                                           {msb, bisi_wr_rd, next_array_sel[2:0], next_data_control[1:0], next_address_mix, next_march_element[3:0]}
                                           + {11'b0, increment_march_elem};                        

  assign   next_array_sel[2:0]       =     user_mode           ?   3'b111:  control_out[17:15]; 
  assign   next_data_control[1:0]    =     (bisi || (mbist_user_data_mode && (data_control[1:0] == 2'b00)))  ?   2'b11:
                                                                                                                 data_control[1:0];
  assign   next_address_mix          =    ( bisi | mbist_user_addr_mode) ?  1'b1 : address_mix;

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


//  assign   second_time_through       =    ~loop_on_address    &&   address_mix;
//  assign   initialize                =    (march_element[3:0] == 4'b0000)  &&  ~second_time_through;


//  assign   four_cycle_march          =    (march_element[3:0] == 3'h6)    ||  (march_element[3:0] == 3'h7);
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

  sio_mb0_ctl_msff_ctl_macro__width_3 done_counter_reg  (
               .scan_in(done_counter_reg_scanin),
               .scan_out(done_counter_reg_scanout),
               .din      ( done_counter_in[2:0]       ),
               .dout     ( done_counter_out[2:0]      ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// config_out[1] is AND'ed to force mbist_done low 2 cycles after mbist_start
// goes low.  

  assign mbist_done = (&done_counter_out[2:0] == 1'b1) & config_out[1];
  assign done_counter_in[2:0] = reset_engine       ?   3'b000:    
                 msb & ~mbist_done & config_out[1] ?   done_counter_out[2:0] + 3'b001:
                                                       done_counter_out[2:0];


/////////////////////////////////////////////////////////////////////////
// Creating the select lines and enable signals.
/////////////////////////////////////////////////////////////////////////

  assign   old0x_sel                 =    ~array_sel[2] & ~array_sel[1] & ~array_sel[0];
  assign   old1x_sel                 =    ~array_sel[2] & ~array_sel[1] &  array_sel[0];

  assign   old2x_sel                 =    ~array_sel[2] &  array_sel[1] & ~array_sel[0];
  assign   old3x_sel                 =    ~array_sel[2] &  array_sel[1] &  array_sel[0];

  assign   old4x_sel                 =     array_sel[2] & ~array_sel[1] & ~array_sel[0];
  assign   old5x_sel                 =     array_sel[2] & ~array_sel[1] &  array_sel[0];

  assign   old6x_sel                 =     array_sel[2] &  array_sel[1] & ~array_sel[0];
  assign   old7x_sel                 =     array_sel[2] &  array_sel[1] &  array_sel[0];

//  assign   sel_l1                    =     array_sel[0];
//  assign   sel_l2                    =     array_sel[2];
//  assign   sel_l3                    =     array_sel[1];

  assign   mbist_old0x_rd_en       =     old0x_sel && array_read;
  assign   mbist_old0x_wr_en       =     old0x_sel &&  array_write;
//Kept this as a sample!
//  assign   mbist_old0x_wr_en       =     (old0x_sel || bisi) &&  array_write;

  assign   mbist_old1x_rd_en       =     old1x_sel && array_read;
  assign   mbist_old1x_wr_en       =     old1x_sel &&  array_write;

  assign   mbist_old2x_rd_en       =     old2x_sel && array_read;
  assign   mbist_old2x_wr_en       =     old2x_sel &&  array_write;

  assign   mbist_old3x_rd_en       =     old3x_sel && array_read;
  assign   mbist_old3x_wr_en       =     old3x_sel &&  array_write;

  assign   mbist_old4x_rd_en       =     old4x_sel && array_read;
  assign   mbist_old4x_wr_en       =     old4x_sel &&  array_write;

  assign   mbist_old5x_rd_en       =     old5x_sel && array_read;
  assign   mbist_old5x_wr_en       =     old5x_sel &&  array_write;

  assign   mbist_old6x_rd_en       =     old6x_sel && array_read;
  assign   mbist_old6x_wr_en       =     old6x_sel &&  array_write;

  assign   mbist_old7x_rd_en       =     old7x_sel && array_read;
  assign   mbist_old7x_wr_en       =     old7x_sel &&  array_write;


// /////////////////////////////////////////////////////////////////////////////
// Pipeline for Address, wdata, Read_en, select lines
// /////////////////////////////////////////////////////////////////////////////


  sio_mb0_ctl_msff_ctl_macro__width_8  data_pipe_reg1 (
               .scan_in(data_pipe_reg1_scanin),
               .scan_out(data_pipe_reg1_scanout),
               .din        ( data_pipe_reg1_in[7:0]  ),
               .dout       ( data_pipe_out1[7:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_8  data_pipe_reg2 (
               .scan_in(data_pipe_reg2_scanin),
               .scan_out(data_pipe_reg2_scanout),
               .din        ( data_pipe_reg2_in[7:0]  ),
               .dout       ( data_pipe_out2[7:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_8  data_pipe_reg3 (
               .scan_in(data_pipe_reg3_scanin),
               .scan_out(data_pipe_reg3_scanout),
               .din        ( data_pipe_reg3_in[7:0]  ),
               .dout       ( data_pipe_out3[7:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_8  data_pipe_reg4 (
               .scan_in(data_pipe_reg4_scanin),
               .scan_out(data_pipe_reg4_scanout),
               .din        ( data_pipe_reg4_in[7:0]  ),
               .dout       ( data_pipe_out4[7:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign data_pipe_reg1_in[7:0]   =  reset_engine    ?    8'h00:      sio_mb0_wdata[7:0];
  assign data_pipe_reg2_in[7:0]   =  reset_engine    ?    8'h00:      data_pipe_out1[7:0];
  assign data_pipe_reg3_in[7:0]   =  reset_engine    ?    8'h00:      data_pipe_out2[7:0];
  assign data_pipe_reg4_in[7:0]   =  reset_engine    ?    8'h00:      data_pipe_out3[7:0];

  assign sio_old_piped_data[7:0]  =  data_pipe_out4[7:0];

  sio_mb0_ctl_msff_ctl_macro__width_1  ren_pipe_reg1 (
               .scan_in(ren_pipe_reg1_scanin),
               .scan_out(ren_pipe_reg1_scanout),
               .din        ( ren_pipe_reg1_in  ),
               .dout       ( ren_pipe_out1     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_1  ren_pipe_reg2 (
               .scan_in(ren_pipe_reg2_scanin),
               .scan_out(ren_pipe_reg2_scanout),
               .din        ( ren_pipe_reg2_in  ),
               .dout       ( ren_pipe_out2     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_1  ren_pipe_reg3 (
               .scan_in(ren_pipe_reg3_scanin),
               .scan_out(ren_pipe_reg3_scanout),
               .din        ( ren_pipe_reg3_in  ),
               .dout       ( ren_pipe_out3     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_1  ren_pipe_reg4 (
               .scan_in(ren_pipe_reg4_scanin),
               .scan_out(ren_pipe_reg4_scanout),
               .din        ( ren_pipe_reg4_in  ),
               .dout       ( ren_pipe_out4     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_1  ren_pipe_reg5 (
               .scan_in(ren_pipe_reg5_scanin),
               .scan_out(ren_pipe_reg5_scanout),
               .din        ( ren_pipe_reg5_in  ),
               .dout       ( ren_pipe_out5     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign ren_pipe_reg1_in   =  reset_engine    ?    1'b0:      array_read;
  assign ren_pipe_reg2_in   =  reset_engine    ?    1'b0:      ren_pipe_out1;
  assign ren_pipe_reg3_in   =  reset_engine    ?    1'b0:      ren_pipe_out2;
  assign ren_pipe_reg4_in   =  reset_engine    ?    1'b0:      ren_pipe_out3;
  assign ren_pipe_reg5_in   =  reset_engine    ?    1'b0:      ren_pipe_out4;
  assign sio_old_piped_ren  =  ren_pipe_out5;

//array_sel
  sio_mb0_ctl_msff_ctl_macro__width_3 ary_sel_pipe_reg1  (
                   .scan_in(ary_sel_pipe_reg1_scanin),
                   .scan_out(ary_sel_pipe_reg1_scanout),
                   .din      ( ary_sel_pipe_reg1_in[2:0]     ),
                   .dout     ( ary_sel_pipe_out1[2:0]        ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_3 ary_sel_pipe_reg2  (
                   .scan_in(ary_sel_pipe_reg2_scanin),
                   .scan_out(ary_sel_pipe_reg2_scanout),
                   .din      ( ary_sel_pipe_reg2_in[2:0]     ),
                   .dout     ( ary_sel_pipe_out2[2:0]        ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_3 ary_sel_pipe_reg3  (
                   .scan_in(ary_sel_pipe_reg3_scanin),
                   .scan_out(ary_sel_pipe_reg3_scanout),
                   .din      ( ary_sel_pipe_reg3_in[2:0]     ),
                   .dout     ( ary_sel_pipe_out3[2:0]        ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_3 ary_sel_pipe_reg4  (
                   .scan_in(ary_sel_pipe_reg4_scanin),
                   .scan_out(ary_sel_pipe_reg4_scanout),
                   .din      ( ary_sel_pipe_reg4_in[2:0]     ),
                   .dout     ( ary_sel_pipe_out4[2:0]        ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb0_ctl_msff_ctl_macro__width_3 ary_sel_pipe_reg5  (
                   .scan_in(ary_sel_pipe_reg5_scanin),
                   .scan_out(ary_sel_pipe_reg5_scanout),
                   .din      ( ary_sel_pipe_reg5_in[2:0]     ),
                   .dout     ( ary_sel_pipe_out5[2:0]        ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign ary_sel_pipe_reg1_in[2:0]  =  reset_engine    ?    3'h0:      array_sel[2:0];
  assign ary_sel_pipe_reg2_in[2:0]  =  reset_engine    ?    3'h0:      ary_sel_pipe_out1[2:0];
  assign ary_sel_pipe_reg3_in[2:0]  =  reset_engine    ?    3'h0:      ary_sel_pipe_out2[2:0];
  assign ary_sel_pipe_reg4_in[2:0]  =  reset_engine    ?    3'h0:      ary_sel_pipe_out3[2:0];
  assign ary_sel_pipe_reg5_in[2:0]  =  reset_engine    ?    3'h0:      ary_sel_pipe_out4[2:0];
  assign piped_array_sel[2:0]       =  ary_sel_pipe_out5[2:0];

  assign sio_mb0_sel_l1             =  ~ary_sel_pipe_out3[0];
  assign sio_mb0_sel_l2             =  ~ary_sel_pipe_out3[2];
  assign sio_mb0_sel_l3             =  ary_sel_pipe_out4[1]; // After the 2nd mux, there is another level 
                                                             // of flop, therefore one more stage on sel_l3!

  assign   old0x_sel_piped          = ~piped_array_sel[2] & ~piped_array_sel[1] & ~piped_array_sel[0];
  assign   old1x_sel_piped          = ~piped_array_sel[2] & ~piped_array_sel[1] &  piped_array_sel[0];

  assign   old2x_sel_piped          = ~piped_array_sel[2] &  piped_array_sel[1] & ~piped_array_sel[0];
  assign   old3x_sel_piped          = ~piped_array_sel[2] &  piped_array_sel[1] &  piped_array_sel[0];

  assign   old4x_sel_piped          =  piped_array_sel[2] & ~piped_array_sel[1] & ~piped_array_sel[0];
  assign   old5x_sel_piped          =  piped_array_sel[2] & ~piped_array_sel[1] &  piped_array_sel[0];

  assign   old6x_sel_piped          =  piped_array_sel[2] &  piped_array_sel[1] & ~piped_array_sel[0];
  assign   old7x_sel_piped          =  piped_array_sel[2] &  piped_array_sel[1] &  piped_array_sel[0];

// /////////////////////////////////////////////////////////////////////////////
// Spare gates
// /////////////////////////////////////////////////////////////////////////////

  sio_mb0_ctl_spare_ctl_macro__num_3 spares  (
                   .scan_in(spares_scanin),
                   .scan_out(spares_scanout),
                   .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
  );


// /////////////////////////////////////////////////////////////////////////////
// Shared Fail Detection
// /////////////////////////////////////////////////////////////////////////////
// 05/07/05: Updated to meet these new features:
// 1.When mbist_done signal is asserted when it completes all the
//   tests, it also need to assert static membist fail signal if
//   there were any failures during the tests.
// 2.The mbist_fail signal won't be sticky bit from membist   
//   engine.  The TCU will make it sticky fail bit as needed.


  sio_mb0_ctl_msff_ctl_macro__width_8 fail_reg  (
                   .scan_in(fail_reg_scanin),
                   .scan_out(fail_reg_scanout),
                   .din      ( fail_reg_in[7:0]   ),
                   .dout     ( fail_reg_out[7:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign    fail_reg_in[7:0]      =    reset_engine      ?    8'b0: {qual_sio_old7x_fail,qual_sio_old6x_fail,qual_sio_old5x_fail,qual_sio_old4x_fail,qual_sio_old3x_fail,qual_sio_old2x_fail,qual_sio_old1x_fail,qual_sio_old0x_fail}  |  fail_reg_out[7:0];


  assign    qual_sio_old0x_fail      =  fail_detect && old0x_sel_piped;
  assign    qual_sio_old1x_fail      =  fail_detect && old1x_sel_piped;
  assign    qual_sio_old2x_fail      =  fail_detect && old2x_sel_piped;
  assign    qual_sio_old3x_fail      =  fail_detect && old3x_sel_piped;
  assign    qual_sio_old4x_fail      =  fail_detect && old4x_sel_piped;
  assign    qual_sio_old5x_fail      =  fail_detect && old5x_sel_piped;
  assign    qual_sio_old6x_fail      =  fail_detect && old6x_sel_piped;
  assign    qual_sio_old7x_fail      =  fail_detect && old7x_sel_piped;

  assign    fail                  =   mbist_done ?   |fail_reg_out[7:0] : 
                                      qual_sio_old7x_fail | qual_sio_old6x_fail | qual_sio_old5x_fail | qual_sio_old4x_fail |
                                      qual_sio_old3x_fail | qual_sio_old2x_fail | qual_sio_old1x_fail | qual_sio_old0x_fail;


  assign    fail_detect_lo        =  (({ sio_old_piped_data[1:0], {4{sio_old_piped_data[7:0]}} } !=  read_data_pipe[33:0]) && sio_old_piped_ren);
  assign    fail_detect_hi        =  (({ sio_old_piped_data[1:0], {4{sio_old_piped_data[7:0]}} } !=  read_data_pipe[67:34]) && sio_old_piped_ren);

  assign    fail_detect           =  fail_detect_lo | fail_detect_hi;




// fixscan start:
assign config_reg_scanin         = scan_in                  ;
assign user_data_reg_scanin      = config_reg_scanout       ;
assign user_start_addr_reg_scanin = user_data_reg_scanout    ;
assign user_stop_addr_reg_scanin = user_start_addr_reg_scanout;
assign user_incr_addr_reg_scanin = user_stop_addr_reg_scanout;
assign user_array_sel_reg_scanin = user_incr_addr_reg_scanout;
assign user_bisi_wr_reg_scanin   = user_array_sel_reg_scanout;
assign user_bisi_rd_reg_scanin   = user_bisi_wr_reg_scanout ;
assign start_transition_reg_scanin = user_bisi_rd_reg_scanout ;
assign run_reg_scanin            = start_transition_reg_scanout;
assign run1_reg_scanin           = run_reg_scanout          ;
assign run2_reg_scanin           = run1_reg_scanout         ;
assign addr_reg_scanin           = run2_reg_scanout         ;
assign wdata_reg_scanin          = addr_reg_scanout         ;
assign rd_wr_en_reg0_scanin      = wdata_reg_scanout        ;
assign rd_wr_en_reg1_scanin      = rd_wr_en_reg0_scanout    ;
assign rd_wr_en_reg2_scanin      = rd_wr_en_reg1_scanout    ;
assign rd_wr_en_reg3_scanin      = rd_wr_en_reg2_scanout    ;
assign rd_wr_en_reg4_scanin      = rd_wr_en_reg3_scanout    ;
assign rd_wr_en_reg5_scanin      = rd_wr_en_reg4_scanout    ;
assign rd_wr_en_reg6_scanin      = rd_wr_en_reg5_scanout    ;
assign rd_wr_en_reg7_scanin      = rd_wr_en_reg6_scanout    ;
assign sio_mb0_fail_reg_scanin   = rd_wr_en_reg7_scanout    ;
assign sio_mb0_done_reg_scanin   = sio_mb0_fail_reg_scanout ;
assign read_data_pipe_reg_scanin = sio_mb0_done_reg_scanout ;
assign control_reg_scanin        = read_data_pipe_reg_scanout;
assign done_counter_reg_scanin   = control_reg_scanout      ;
assign data_pipe_reg1_scanin     = done_counter_reg_scanout ;
assign data_pipe_reg2_scanin     = data_pipe_reg1_scanout   ;
assign data_pipe_reg3_scanin     = data_pipe_reg2_scanout   ;
assign data_pipe_reg4_scanin     = data_pipe_reg3_scanout   ;
assign ren_pipe_reg1_scanin      = data_pipe_reg4_scanout   ;
assign ren_pipe_reg2_scanin      = ren_pipe_reg1_scanout    ;
assign ren_pipe_reg3_scanin      = ren_pipe_reg2_scanout    ;
assign ren_pipe_reg4_scanin      = ren_pipe_reg3_scanout    ;
assign ren_pipe_reg5_scanin      = ren_pipe_reg4_scanout    ;
assign ary_sel_pipe_reg1_scanin  = ren_pipe_reg5_scanout    ;
assign ary_sel_pipe_reg2_scanin  = ary_sel_pipe_reg1_scanout;
assign ary_sel_pipe_reg3_scanin  = ary_sel_pipe_reg2_scanout;
assign ary_sel_pipe_reg4_scanin  = ary_sel_pipe_reg3_scanout;
assign ary_sel_pipe_reg5_scanin  = ary_sel_pipe_reg4_scanout;
assign spares_scanin             = ary_sel_pipe_reg5_scanout;
assign fail_reg_scanin           = spares_scanout           ;
assign scan_out                  = fail_reg_scanout         ;
// fixscan end:
endmodule // sio_mb0_ctl






// any PARAMS parms go into naming of macro

module sio_mb0_ctl_l1clkhdr_ctl_macro (
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

module sio_mb0_ctl_msff_ctl_macro__width_8 (
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

module sio_mb0_ctl_msff_ctl_macro__width_5 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = din[4:0];






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

module sio_mb0_ctl_msff_ctl_macro__width_3 (
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

module sio_mb0_ctl_msff_ctl_macro__width_1 (
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

module sio_mb0_ctl_msff_ctl_macro__width_2 (
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

module sio_mb0_ctl_msff_ctl_macro__width_68 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [67:0] fdin;
wire [66:0] so;

  input [67:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [67:0] dout;
  output scan_out;
assign fdin[67:0] = din[67:0];






dff #(68)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[67:0]),
.si({scan_in,so[66:0]}),
.so({so[66:0],scan_out}),
.q(dout[67:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sio_mb0_ctl_msff_ctl_macro__width_20 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [19:0] fdin;
wire [18:0] so;

  input [19:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [19:0] dout;
  output scan_out;
assign fdin[19:0] = din[19:0];






dff #(20)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[19:0]),
.si({scan_in,so[18:0]}),
.so({so[18:0],scan_out}),
.q(dout[19:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module sio_mb0_ctl_spare_ctl_macro__num_3 (
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
assign scan_out = so_2;



endmodule

