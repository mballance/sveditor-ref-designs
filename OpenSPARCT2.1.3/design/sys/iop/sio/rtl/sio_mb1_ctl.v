// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sio_mb1_ctl.v
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
module sio_mb1_ctl (
  sio_mb1_run, 
  sio_mb1_addr, 
  sio_mb1_wdata, 
  sio_mb1_opddq00_wr_en, 
  sio_mb1_opddq00_rd_en, 
  sio_mb1_opddq01_wr_en, 
  sio_mb1_opddq01_rd_en, 
  sio_mb1_opddq10_wr_en, 
  sio_mb1_opddq10_rd_en, 
  sio_mb1_opddq11_wr_en, 
  sio_mb1_opddq11_rd_en, 
  sio_mb1_opdhq0_wr_en, 
  sio_mb1_opdhq0_rd_en, 
  sio_mb1_opdhq1_wr_en, 
  sio_mb1_opdhq1_rd_en, 
  sio_mb1_opdhq_sel, 
  sio_mb1_opddq0_sel, 
  sio_mb1_opddq1_sel, 
  sio_mb1_done, 
  sio_mb1_fail, 
  scan_out, 
  iol2clk, 
  tcu_scan_en, 
  scan_in, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_sio_mb1_start, 
  sio_mb1_bisi_mode, 
  sio_mb1_user_mode, 
  opd0_read_data, 
  opd1_read_data);
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
wire counter_reg_scanin;
wire counter_reg_scanout;
wire [3:0] counter_in;
wire [3:0] counter_out;
wire cycle16;
wire run_piped16;
wire msb;
wire addr_reg_scanin;
wire addr_reg_scanout;
wire [5:0] mbist_address;
wire wdata_reg_scanin;
wire wdata_reg_scanout;
wire [7:0] mbist_wdata;
wire wr_rd_en_reg0_scanin;
wire wr_rd_en_reg0_scanout;
wire mbist_opddq00_wr_en;
wire mbist_opddq00_rd_en;
wire wr_rd_en_reg1_scanin;
wire wr_rd_en_reg1_scanout;
wire mbist_opddq01_wr_en;
wire mbist_opddq01_rd_en;
wire wr_rd_en_reg2_scanin;
wire wr_rd_en_reg2_scanout;
wire mbist_opddq10_wr_en;
wire mbist_opddq10_rd_en;
wire wr_rd_en_reg3_scanin;
wire wr_rd_en_reg3_scanout;
wire mbist_opddq11_wr_en;
wire mbist_opddq11_rd_en;
wire wr_rd_en_reg4_scanin;
wire wr_rd_en_reg4_scanout;
wire mbist_opdhq0_wr_en;
wire mbist_opdhq0_rd_en;
wire wr_rd_en_reg5_scanin;
wire wr_rd_en_reg5_scanout;
wire mbist_opdhq1_wr_en;
wire mbist_opdhq1_rd_en;
wire sel_reg_scanin;
wire sel_reg_scanout;
wire mbist_opdhq_sel;
wire mbist_opddq0_sel;
wire mbist_opddq1_sel;
wire done_reg_scanin;
wire done_reg_scanout;
wire new_fail_reg_scanin;
wire new_fail_reg_scanout;
wire fail;
wire control_reg_scanin;
wire control_reg_scanout;
wire [20:0] control_in;
wire [20:0] control_out;
wire bisi_wr_rd;
wire [2:0] array_sel;
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
wire opdhq_sel;
wire [5:0] incr_addr;
wire overflow;
wire [6:0] compare_addr;
wire [5:0] add;
wire [5:0] adj_address;
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
wire opddq00_sel;
wire opddq10_sel;
wire opddq01_sel;
wire opddq11_sel;
wire opdhq0_sel;
wire opdhq1_sel;
wire opd1_or_opd0_sel;
wire opddq0_sel;
wire opddq1_sel;
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
wire [7:0] sio_opd_piped_wdata;
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
wire sio_opd_piped_ren;
wire opd_sel_reg1_scanin;
wire opd_sel_reg1_scanout;
wire opdhq_sel_reg1_in;
wire opddq0_sel_reg1_in;
wire opddq1_sel_reg1_in;
wire opdhq_sel_reg1_out;
wire opddq0_sel_reg1_out;
wire opddq1_sel_reg1_out;
wire opd_sel_reg2_scanin;
wire opd_sel_reg2_scanout;
wire opdhq_sel_reg2_in;
wire opddq0_sel_reg2_in;
wire opddq1_sel_reg2_in;
wire opdhq_sel_reg2_out;
wire opddq0_sel_reg2_out;
wire opddq1_sel_reg2_out;
wire opd_sel_reg4_scanin;
wire opd_sel_reg4_scanout;
wire opdhq_sel_reg4_in;
wire opddq0_sel_reg4_in;
wire opddq1_sel_reg4_in;
wire opdhq_sel_reg4_out;
wire opddq0_sel_reg4_out;
wire opddq1_sel_reg4_out;
wire sio_mb1_opdhq_sel_piped;
wire sio_mb1_opddq0_sel_piped;
wire sio_mb1_opddq1_sel_piped;
wire opd1or0_sel_reg1_scanin;
wire opd1or0_sel_reg1_scanout;
wire opd1or0_sel_reg1_in;
wire opd1or0_sel_out1;
wire opd1or0_sel_reg2_scanin;
wire opd1or0_sel_reg2_scanout;
wire opd1or0_sel_reg2_in;
wire opd1or0_sel_out2;
wire opd1or0_sel_reg3_scanin;
wire opd1or0_sel_reg3_scanout;
wire opd1or0_sel_reg3_in;
wire opd1or0_sel_out3;
wire opd1or0_sel_reg4_scanin;
wire opd1or0_sel_reg4_scanout;
wire opd1or0_sel_reg4_in;
wire opd1or0_sel_out4;
wire sio_mb1_opd1_or_opd0_sel;
wire sio_mb1_opd1_or_opd0_sel_piped;
wire opddq00_sel_piped;
wire opddq01_sel_piped;
wire opddq10_sel_piped;
wire opddq11_sel_piped;
wire opdhq0_sel_piped;
wire opdhq1_sel_piped;
wire spares_scanin;
wire spares_scanout;
wire read_data_pipe_reg_scanin;
wire read_data_pipe_reg_scanout;
wire [71:0] opd1_or_opd0_read_data;
wire [71:0] read_data_pipe;
wire fail_reg_scanin;
wire fail_reg_scanout;
wire [5:0] fail_reg_in;
wire [5:0] fail_reg_out;
wire qual_sio_opdhq1_fail;
wire qual_sio_opddq11_fail;
wire qual_sio_opddq10_fail;
wire qual_sio_opdhq0_fail;
wire qual_sio_opddq01_fail;
wire qual_sio_opddq00_fail;
wire fail_detect;



   output 	      sio_mb1_run;

   output [5:0]	  sio_mb1_addr;
   output [7:0]   sio_mb1_wdata;

   output     	  sio_mb1_opddq00_wr_en;
   output 	      sio_mb1_opddq00_rd_en;
   
   output     	  sio_mb1_opddq01_wr_en;
   output 	      sio_mb1_opddq01_rd_en;
   
   output     	  sio_mb1_opddq10_wr_en;
   output 	      sio_mb1_opddq10_rd_en;
   
   output     	  sio_mb1_opddq11_wr_en;
   output 	      sio_mb1_opddq11_rd_en;
   
   output     	  sio_mb1_opdhq0_wr_en;
   output 	      sio_mb1_opdhq0_rd_en;
   
   output     	  sio_mb1_opdhq1_wr_en;
   output 	      sio_mb1_opdhq1_rd_en;

   output         sio_mb1_opdhq_sel; 
   output         sio_mb1_opddq0_sel; 
   output         sio_mb1_opddq1_sel; 
   
   output         sio_mb1_done;
   output         sio_mb1_fail;
   output     	  scan_out;

   input          iol2clk;
   input 	      tcu_scan_en;
   input     	  scan_in;
   input     	  tcu_aclk;
   input 	      tcu_bclk; 
   input 	      tcu_pce_ov;
   input 	      tcu_clk_stop;

   input          tcu_sio_mb1_start;
   input          sio_mb1_bisi_mode;
   input          sio_mb1_user_mode;


   input [71:0]   opd0_read_data;
   input [71:0]   opd1_read_data;


   
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

   sio_mb1_ctl_l1clkhdr_ctl_macro clkgen (
			      .l2clk  (iol2clk  ),
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


  sio_mb1_ctl_msff_ctl_macro__width_8 config_reg  (
               .scan_in(config_reg_scanin),
               .scan_out(config_reg_scanout),
               .din      ( config_in[7:0]       ),
               .dout     ( config_out[7:0]      ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign config_in[0]        =    tcu_sio_mb1_start;
  assign config_in[1]        =    config_out[0];
  assign start_transition    =    config_out[0]      &  ~config_out[1];
  assign reset_engine        =    start_transition   |  (mbist_user_loop_mode  &  mbist_done);
//  assign run                 =    config_out[1]      &  (mbist_user_loop_mode | ~mbist_done);
  assign run                 =    config_out[0] & config_out[1]; // 9/19/05 run to follow start only!

  assign config_in[2]        =    start_transition   ?   sio_mb1_bisi_mode:      config_out[2];
  assign bisi                =    config_out[2];

  assign config_in[3]        =    start_transition   ?   sio_mb1_user_mode:      config_out[3];
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


  sio_mb1_ctl_msff_ctl_macro__width_8 user_data_reg  (
                 .scan_in(user_data_reg_scanin),
                 .scan_out(user_data_reg_scanout),
                 .din      ( user_data_in[7:0]       ),
                 .dout     ( user_data_out[7:0]      ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign user_data_in[7:0]    =    user_data_out[7:0];


// Defining User start, stop, and increment addresses.

  sio_mb1_ctl_msff_ctl_macro__width_6 user_start_addr_reg  (
                 .scan_in(user_start_addr_reg_scanin),
                 .scan_out(user_start_addr_reg_scanout),
                 .din      ( user_start_addr_in[5:0]  ),
                 .dout     ( user_start_addr[5:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_start_addr_in[5:0]   =    user_start_addr[5:0];

  sio_mb1_ctl_msff_ctl_macro__width_6 user_stop_addr_reg  (
                 .scan_in(user_stop_addr_reg_scanin),
                 .scan_out(user_stop_addr_reg_scanout),
                 .din      ( user_stop_addr_in[5:0]  ),
                 .dout     ( user_stop_addr[5:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_stop_addr_in[5:0]   =    user_stop_addr[5:0];


  sio_mb1_ctl_msff_ctl_macro__width_6 user_incr_addr_reg  (
                 .scan_in(user_incr_addr_reg_scanin),
                 .scan_out(user_incr_addr_reg_scanout),
                 .din      ( user_incr_addr_in[5:0]  ),
                 .dout     ( user_incr_addr[5:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_incr_addr_in[5:0]   =    user_incr_addr[5:0];

// Defining User array_sel.

  sio_mb1_ctl_msff_ctl_macro__width_3 user_array_sel_reg  (
                 .scan_in(user_array_sel_reg_scanin),
                 .scan_out(user_array_sel_reg_scanout),
                 .din      ( user_array_sel_in[2:0]  ),
                 .dout     ( user_array_sel[2:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_array_sel_in[2:0]   =    user_array_sel[2:0];

// Defining user_bisi write and read registers

  sio_mb1_ctl_msff_ctl_macro__width_1 user_bisi_wr_reg  (
                 .scan_in(user_bisi_wr_reg_scanin),
                 .scan_out(user_bisi_wr_reg_scanout),
                 .din      ( user_bisi_wr_mode_in  ),
                 .dout     ( user_bisi_wr_mode ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_bisi_wr_mode_in     =    user_bisi_wr_mode;

  sio_mb1_ctl_msff_ctl_macro__width_1 user_bisi_rd_reg  (
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

  sio_mb1_ctl_msff_ctl_macro__width_1 start_transition_reg  (
               .scan_in(start_transition_reg_scanin),
               .scan_out(start_transition_reg_scanout),
               .din      ( start_transition ),
               .dout     ( start_transition_piped ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


////////////////////////////////////////////////////////////////////////////////
// Staging run for 16 cycles for mbist engines supporting async FIFO's
////////////////////////////////////////////////////////////////////////////////
  
  sio_mb1_ctl_msff_ctl_macro__width_1 run_reg  (
               .scan_in(run_reg_scanin),
               .scan_out(run_reg_scanout),
               .din      ( run ),
               .dout     ( sio_mb1_run ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb1_ctl_msff_ctl_macro__width_4 counter_reg  (
               .scan_in(counter_reg_scanin),
               .scan_out(counter_reg_scanout),
               .din      ( counter_in[3:0]       ),
               .dout     ( counter_out[3:0]      ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign cycle16 = (&counter_out[3:0] == 1'b1);
  assign counter_in[3:0] = reset_engine         ?   4'b0:    
                            run & ~cycle16      ?   counter_out[3:0] + 4'b0001:
                                                    counter_out[3:0];

//  assign run_piped16 = cycle16 & run; // As soon as run goes low, mbist operation is done!                                                
  assign run_piped16 = config_out[0] & cycle16 & ~msb; // As soon as run goes low, mbist operation is done!                                                

////////////////////////////////////////////////////////////////////////////////
// Creating flop boundaries for the outputs of the mbist
////////////////////////////////////////////////////////////////////////////////

  sio_mb1_ctl_msff_ctl_macro__width_6 addr_reg  (
               .scan_in(addr_reg_scanin),
               .scan_out(addr_reg_scanout),
               .din      ( mbist_address[5:0]       ),
               .dout     ( sio_mb1_addr[5:0]      ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb1_ctl_msff_ctl_macro__width_8 wdata_reg  (
               .scan_in(wdata_reg_scanin),
               .scan_out(wdata_reg_scanout),
               .din      ( mbist_wdata[7:0]       ),
               .dout     ( sio_mb1_wdata[7:0]      ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb1_ctl_msff_ctl_macro__width_2 wr_rd_en_reg0  (
               .scan_in(wr_rd_en_reg0_scanin),
               .scan_out(wr_rd_en_reg0_scanout),
               .din      ( {mbist_opddq00_wr_en, mbist_opddq00_rd_en  }       ),
               .dout     ( {sio_mb1_opddq00_wr_en, sio_mb1_opddq00_rd_en  }     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb1_ctl_msff_ctl_macro__width_2 wr_rd_en_reg1  (
               .scan_in(wr_rd_en_reg1_scanin),
               .scan_out(wr_rd_en_reg1_scanout),
               .din      ( {mbist_opddq01_wr_en, mbist_opddq01_rd_en }       ),
               .dout     ( {sio_mb1_opddq01_wr_en, sio_mb1_opddq01_rd_en }     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb1_ctl_msff_ctl_macro__width_2 wr_rd_en_reg2  (
               .scan_in(wr_rd_en_reg2_scanin),
               .scan_out(wr_rd_en_reg2_scanout),
               .din      ( {mbist_opddq10_wr_en, mbist_opddq10_rd_en }       ),
               .dout     ( { sio_mb1_opddq10_wr_en, sio_mb1_opddq10_rd_en }     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb1_ctl_msff_ctl_macro__width_2 wr_rd_en_reg3  (
               .scan_in(wr_rd_en_reg3_scanin),
               .scan_out(wr_rd_en_reg3_scanout),
               .din      ( {mbist_opddq11_wr_en, mbist_opddq11_rd_en }       ),
               .dout     ( { sio_mb1_opddq11_wr_en, sio_mb1_opddq11_rd_en }     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb1_ctl_msff_ctl_macro__width_2 wr_rd_en_reg4  (
               .scan_in(wr_rd_en_reg4_scanin),
               .scan_out(wr_rd_en_reg4_scanout),
               .din      ( {mbist_opdhq0_wr_en, mbist_opdhq0_rd_en}       ),
               .dout     ( {sio_mb1_opdhq0_wr_en, sio_mb1_opdhq0_rd_en}     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb1_ctl_msff_ctl_macro__width_2 wr_rd_en_reg5  (
               .scan_in(wr_rd_en_reg5_scanin),
               .scan_out(wr_rd_en_reg5_scanout),
               .din      ( {mbist_opdhq1_wr_en, mbist_opdhq1_rd_en }       ),
               .dout     ( {sio_mb1_opdhq1_wr_en, sio_mb1_opdhq1_rd_en }     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  sio_mb1_ctl_msff_ctl_macro__width_3 sel_reg  (
               .scan_in(sel_reg_scanin),
               .scan_out(sel_reg_scanout),
               .din      ( { mbist_opdhq_sel, mbist_opddq0_sel, mbist_opddq1_sel }    ),
               .dout     ( { sio_mb1_opdhq_sel, sio_mb1_opddq0_sel, sio_mb1_opddq1_sel }    ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb1_ctl_msff_ctl_macro__width_1 done_reg  (
               .scan_in(done_reg_scanin),
               .scan_out(done_reg_scanout),
               .din      ( mbist_done    ),
               .dout     (  sio_mb1_done    ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb1_ctl_msff_ctl_macro__width_1 new_fail_reg  (
               .scan_in(new_fail_reg_scanin),
               .scan_out(new_fail_reg_scanout),
               .din      ( fail    ),
               .dout     (  sio_mb1_fail    ),
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

   sio_mb1_ctl_msff_ctl_macro__width_21 control_reg  (
                      .scan_in(control_reg_scanin),
                      .scan_out(control_reg_scanout),
                      .din   ( control_in[20:0]           ),
                      .dout  ( control_out[20:0]          ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign   msb                       =     control_out[20];
  assign   bisi_wr_rd     = (bisi & ~user_mode) | mbist_user_bisi_wr_rd_mode ? control_out[19] : 1'b1;
  assign   array_sel[2:0]            =     user_mode           ?  user_array_sel[2:0] : control_out[18:16];
  assign   data_control[1:0]         =     control_out[15:14];
  assign   address_mix               = (bisi | mbist_user_addr_mode) ?  1'b0:   control_out[13];
  assign   march_element[3:0]        =     control_out[12:9];
//  assign   array_address[5:0]        =     opdhq_sel           ?  {2'b11, control_out[6:3]} : control_out[8:3];
  assign   array_address[5:0]        =     upaddress_march     ?   control_out[8:3] : ~control_out[8:3];

  assign   read_write_control[2:0]   =     ~five_cycle_march   ?   {2'b11,  control_out[0]} :
                                                                   control_out[2:0];


  assign   control_in[2:0]           =     reset_engine        ?   3'b0:
                                          ~run_piped16         ?   control_out[2:0]:
     (five_cycle_march && (read_write_control[2:0] == 3'b100)) ?   3'b000:
      (one_cycle_march && (read_write_control[2:0] == 3'b110)) ?   3'b000:
                                                                   control_out[2:0]   +  3'b001;

  assign   increment_addr            =     (five_cycle_march && (read_write_control[2:0] == 3'b100)) || 
                                            (one_cycle_march && (read_write_control[2:0] == 3'b110)) ||
                                            (read_write_control[2:0] == 3'b111);

// start_transition_piped was added to have the correct start_addr at the start
// of mbist during user_addr_mode
  assign   control_in[8:3]  = start_transition_piped || reset_engine  ?  start_addr[5:0]:
                                    ~run_piped16 || ~increment_addr   ?  control_out[8:3]:
                                                                       next_array_address[5:0];

  assign   next_array_address[5:0]   =    next_upaddr_march      ?  start_addr[5:0]:
                                          next_downaddr_march    ?  ~stop_addr[5:0]:
                                                                    (overflow_addr[5:0]);     // array_addr + incr_addr
                                                                    
  assign   start_addr[5:0]           =    mbist_user_addr_mode   ?   user_start_addr[5:0]: 6'b000000;
  assign   stop_addr[5:0]            =    mbist_user_addr_mode   ?   user_stop_addr[5:0] : 
                                          opdhq_sel              ?   6'b001111           : 6'b111111;
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

  assign   adj_address[5:0]          =     { array_address[5:2], ~array_address[1], array_address[0] };  

// opd_data is 2 blks of 32 row each and opd_hdr is a blk of 16 rows.
  assign   mbist_address[5:0]        =     address_mix & opdhq_sel ?  {add[5],add[4],add[0],add[3],add[2],add[1]}:
                                           address_mix             ?  {add[0],add[5],add[4],add[3],add[2],add[1]}:
                                                                       add[5:0];

// Definition of the rest of the control register  

 assign   increment_march_elem      =     increment_addr && overflow;

 assign   control_in[20:9]          =     reset_engine        ?   12'b0:
                                         ~run_piped16         ?   control_out[20:9]:
                                           {msb, bisi_wr_rd, next_array_sel[2:0], next_data_control[1:0], next_address_mix, next_march_element[3:0]} + 
                                           {11'b0, increment_march_elem};                        


  assign   next_array_sel[2:0]       =     user_mode           ?   3'b111: 
           bisi & 
     (array_sel[2:0] == 3'b101) & (array_address == stop_addr) ?   3'b111:
   (array_sel[2:0] == 3'b101) & (data_control[1:0] == 2'b11) & 
   (next_address_mix == 1'b1) & (march_element[3:0] == 4'b1000) &
   (array_address == 6'b0) & (read_write_control[2:0] == 3'h4) ?   3'b111:  control_out[18:16]; 
  
  assign   next_data_control[1:0]    =     (bisi || (mbist_user_data_mode && (data_control[1:0] == 2'b00)))  ?   2'b11:
                                                                                                                 data_control[1:0];

  assign   next_address_mix          =     bisi | mbist_user_addr_mode ?  1'b1 : address_mix;

// Incorporated ten_n_mode!  
  assign   next_march_element[3:0]   =     ( bisi || 
                                             (mbist_ten_n_mode && (march_element[3:0] == 4'b0101)) || 
                                          ((march_element[3:0] == 4'b1000) && (read_write_control[2:0] == 3'b100)) ) 
                                            && overflow ?   4'b1111:  march_element[3:0];


  assign   array_write               =     ~run_piped16          ?    1'b0:
                                           five_cycle_march    ?  (read_write_control[2:0] == 3'h0) || 
                                                                  (read_write_control[2:0] == 3'h1) ||
                                                                  (read_write_control[2:0] == 3'h4): 
                        (~five_cycle_march & ~one_cycle_march) ?  read_write_control[0]:
     ( ((march_element[3:0] == 4'h0) & (~bisi || ~bisi_wr_rd || mbist_user_bisi_wr_mode)) || (march_element[3:0] == 4'h7));

  assign   array_read                =    ~array_write        &&  run_piped16;     //  &&  ~initialize;
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

  sio_mb1_ctl_msff_ctl_macro__width_3 done_counter_reg  (
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
// Creating the select lines.
/////////////////////////////////////////////////////////////////////////
// array_sel[0] is to select between opd0 or opd1 (0: opd0; 1:opd1)

  assign   opddq00_sel               =    ~array_sel[2] & ~array_sel[1] & ~array_sel[0];
  assign   opddq10_sel               =    ~array_sel[2] & ~array_sel[1] &  array_sel[0];

  assign   opddq01_sel               =    ~array_sel[2] &  array_sel[1] & ~array_sel[0];
  assign   opddq11_sel               =    ~array_sel[2] &  array_sel[1] &  array_sel[0];

  assign   opdhq0_sel                =     array_sel[2] & ~array_sel[1] & ~array_sel[0];
  assign   opdhq1_sel                =     array_sel[2] & ~array_sel[1] &  array_sel[0];

  assign   opd1_or_opd0_sel          =     array_sel[0]; // 0: opd0; 1:opd1

  assign   opdhq_sel                 =     array_sel[2] & ~array_sel[1];
  assign   opddq0_sel                =    ~array_sel[2] & ~array_sel[1];
  assign   opddq1_sel                =    ~array_sel[2] &  array_sel[1];

// rd_en and wr_en

  assign   mbist_opddq00_rd_en       =     opddq00_sel && array_read;
  assign   mbist_opddq00_wr_en       =     opddq00_sel &&  array_write;

  assign   mbist_opddq01_rd_en       =     opddq01_sel && array_read;
  assign   mbist_opddq01_wr_en       =     opddq01_sel &&  array_write;

  assign   mbist_opddq10_rd_en       =     opddq10_sel && array_read;
  assign   mbist_opddq10_wr_en       =     opddq10_sel &&  array_write;

  assign   mbist_opddq11_rd_en       =     opddq11_sel && array_read;
  assign   mbist_opddq11_wr_en       =     opddq11_sel &&  array_write;

  assign   mbist_opdhq0_rd_en        =     opdhq0_sel && array_read;
  assign   mbist_opdhq0_wr_en        =     opdhq0_sel &&  array_write;

  assign   mbist_opdhq1_rd_en        =     opdhq1_sel && array_read;
  assign   mbist_opdhq1_wr_en        =     opdhq1_sel &&  array_write;


// /////////////////////////////////////////////////////////////////////////////
// Pipeline for Address, wdata, and Read_en
// /////////////////////////////////////////////////////////////////////////////

// Adding proper pipe stages for wdata  
  sio_mb1_ctl_msff_ctl_macro__width_8  data_pipe_reg1 (
               .scan_in(data_pipe_reg1_scanin),
               .scan_out(data_pipe_reg1_scanout),
               .din        ( data_pipe_reg1_in[7:0]  ),
               .dout       ( data_pipe_out1[7:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb1_ctl_msff_ctl_macro__width_8  data_pipe_reg2 (
               .scan_in(data_pipe_reg2_scanin),
               .scan_out(data_pipe_reg2_scanout),
               .din        ( data_pipe_reg2_in[7:0]  ),
               .dout       ( data_pipe_out2[7:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb1_ctl_msff_ctl_macro__width_8  data_pipe_reg3 (
               .scan_in(data_pipe_reg3_scanin),
               .scan_out(data_pipe_reg3_scanout),
               .din        ( data_pipe_reg3_in[7:0]  ),
               .dout       ( data_pipe_out3[7:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign data_pipe_reg1_in[7:0]   =  reset_engine    ?    8'h00:      sio_mb1_wdata[7:0];
  assign data_pipe_reg2_in[7:0]   =  reset_engine    ?    8'h00:      data_pipe_out1[7:0];
  assign data_pipe_reg3_in[7:0]   =  reset_engine    ?    8'h00:      data_pipe_out2[7:0];

  assign sio_opd_piped_wdata[7:0]  =  data_pipe_out3[7:0];

// Adding proper pipe stages for read_en
  sio_mb1_ctl_msff_ctl_macro__width_1  ren_pipe_reg1 (
               .scan_in(ren_pipe_reg1_scanin),
               .scan_out(ren_pipe_reg1_scanout),
               .din        ( ren_pipe_reg1_in  ),
               .dout       ( ren_pipe_out1     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb1_ctl_msff_ctl_macro__width_1  ren_pipe_reg2 (
               .scan_in(ren_pipe_reg2_scanin),
               .scan_out(ren_pipe_reg2_scanout),
               .din        ( ren_pipe_reg2_in  ),
               .dout       ( ren_pipe_out2     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb1_ctl_msff_ctl_macro__width_1  ren_pipe_reg3 (
               .scan_in(ren_pipe_reg3_scanin),
               .scan_out(ren_pipe_reg3_scanout),
               .din        ( ren_pipe_reg3_in  ),
               .dout       ( ren_pipe_out3     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb1_ctl_msff_ctl_macro__width_1  ren_pipe_reg4 (
               .scan_in(ren_pipe_reg4_scanin),
               .scan_out(ren_pipe_reg4_scanout),
               .din        ( ren_pipe_reg4_in  ),
               .dout       ( ren_pipe_out4     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign ren_pipe_reg1_in   =  reset_engine    ?    1'b0:      array_read;
  assign ren_pipe_reg2_in   =  reset_engine    ?    1'b0:      ren_pipe_out1;
  assign ren_pipe_reg3_in   =  reset_engine    ?    1'b0:      ren_pipe_out2;
  assign ren_pipe_reg4_in   =  reset_engine    ?    1'b0:      ren_pipe_out3;
  assign sio_opd_piped_ren  =  ren_pipe_out4;


//Defining array_sel

  sio_mb1_ctl_msff_ctl_macro__width_3 opd_sel_reg1  (
               .scan_in(opd_sel_reg1_scanin),
               .scan_out(opd_sel_reg1_scanout),
               .din      ( { opdhq_sel_reg1_in, opddq0_sel_reg1_in, opddq1_sel_reg1_in }    ),
               .dout     ( { opdhq_sel_reg1_out, opddq0_sel_reg1_out, opddq1_sel_reg1_out }    ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb1_ctl_msff_ctl_macro__width_3 opd_sel_reg2  (
               .scan_in(opd_sel_reg2_scanin),
               .scan_out(opd_sel_reg2_scanout),
               .din      ( { opdhq_sel_reg2_in, opddq0_sel_reg2_in, opddq1_sel_reg2_in }    ),
               .dout     ( { opdhq_sel_reg2_out, opddq0_sel_reg2_out, opddq1_sel_reg2_out }    ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign opdhq_sel_reg1_in  =  reset_engine    ?    1'b0:      opdhq_sel;
  assign opdhq_sel_reg2_in  =  reset_engine    ?    1'b0:      opdhq_sel_reg1_out;
  assign mbist_opdhq_sel    =  opdhq_sel_reg2_out;

  assign opddq0_sel_reg1_in  =  reset_engine    ?    1'b0:      opddq0_sel;
  assign opddq0_sel_reg2_in  =  reset_engine    ?    1'b0:      opddq0_sel_reg1_out;
  assign mbist_opddq0_sel    =  opddq0_sel_reg2_out;

  assign opddq1_sel_reg1_in  =  reset_engine    ?    1'b0:      opddq1_sel;
  assign opddq1_sel_reg2_in  =  reset_engine    ?    1'b0:      opddq1_sel_reg1_out;
  assign mbist_opddq1_sel    =  opddq1_sel_reg2_out;

  sio_mb1_ctl_msff_ctl_macro__width_3 opd_sel_reg4  (
               .scan_in(opd_sel_reg4_scanin),
               .scan_out(opd_sel_reg4_scanout),
               .din      ( { opdhq_sel_reg4_in, opddq0_sel_reg4_in, opddq1_sel_reg4_in }    ),
               .dout     ( { opdhq_sel_reg4_out, opddq0_sel_reg4_out, opddq1_sel_reg4_out }    ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign opdhq_sel_reg4_in   =  reset_engine    ?    1'b0:      sio_mb1_opdhq_sel;
  assign opddq0_sel_reg4_in  =  reset_engine    ?    1'b0:      sio_mb1_opddq0_sel;
  assign opddq1_sel_reg4_in  =  reset_engine    ?    1'b0:      sio_mb1_opddq1_sel;

  assign sio_mb1_opdhq_sel_piped    =  opdhq_sel_reg4_out;
  assign sio_mb1_opddq0_sel_piped   =  opddq0_sel_reg4_out;
  assign sio_mb1_opddq1_sel_piped   =  opddq1_sel_reg4_out;

//opd1_or_opd0_sel
  sio_mb1_ctl_msff_ctl_macro__width_1  opd1or0_sel_reg1 (
               .scan_in(opd1or0_sel_reg1_scanin),
               .scan_out(opd1or0_sel_reg1_scanout),
               .din        ( opd1or0_sel_reg1_in  ),
               .dout       ( opd1or0_sel_out1     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb1_ctl_msff_ctl_macro__width_1  opd1or0_sel_reg2 (
               .scan_in(opd1or0_sel_reg2_scanin),
               .scan_out(opd1or0_sel_reg2_scanout),
               .din        ( opd1or0_sel_reg2_in  ),
               .dout       ( opd1or0_sel_out2     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb1_ctl_msff_ctl_macro__width_1  opd1or0_sel_reg3 (
               .scan_in(opd1or0_sel_reg3_scanin),
               .scan_out(opd1or0_sel_reg3_scanout),
               .din        ( opd1or0_sel_reg3_in  ),
               .dout       ( opd1or0_sel_out3     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sio_mb1_ctl_msff_ctl_macro__width_1  opd1or0_sel_reg4 (
               .scan_in(opd1or0_sel_reg4_scanin),
               .scan_out(opd1or0_sel_reg4_scanout),
               .din        ( opd1or0_sel_reg4_in  ),
               .dout       ( opd1or0_sel_out4     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign opd1or0_sel_reg1_in   =  reset_engine    ?    1'b0:      opd1_or_opd0_sel;
  assign opd1or0_sel_reg2_in   =  reset_engine    ?    1'b0:      opd1or0_sel_out1;
  assign opd1or0_sel_reg3_in   =  reset_engine    ?    1'b0:      opd1or0_sel_out2;
  assign opd1or0_sel_reg4_in   =  reset_engine    ?    1'b0:      opd1or0_sel_out3;

  assign sio_mb1_opd1_or_opd0_sel  =  opd1or0_sel_out3;
  assign sio_mb1_opd1_or_opd0_sel_piped  =  opd1or0_sel_out4;


  assign   opddq00_sel_piped   =    ~sio_mb1_opd1_or_opd0_sel_piped & sio_mb1_opddq0_sel_piped; 
  assign   opddq01_sel_piped   =    ~sio_mb1_opd1_or_opd0_sel_piped & sio_mb1_opddq1_sel_piped;

  assign   opddq10_sel_piped   =     sio_mb1_opd1_or_opd0_sel_piped & sio_mb1_opddq0_sel_piped; 
  assign   opddq11_sel_piped   =     sio_mb1_opd1_or_opd0_sel_piped & sio_mb1_opddq1_sel_piped;

  assign   opdhq0_sel_piped    =    ~sio_mb1_opd1_or_opd0_sel_piped & sio_mb1_opdhq_sel_piped;
  assign   opdhq1_sel_piped    =     sio_mb1_opd1_or_opd0_sel_piped & sio_mb1_opdhq_sel_piped;


// /////////////////////////////////////////////////////////////////////////////
// Spare gates
// /////////////////////////////////////////////////////////////////////////////

  sio_mb1_ctl_spare_ctl_macro__num_3 spares  (
                   .scan_in(spares_scanin),
                   .scan_out(spares_scanout),
                   .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
  );

// /////////////////////////////////////////////////////////////////////////////
// Shared Fail Detection
// /////////////////////////////////////////////////////////////////////////////
// Updated to meet these new features:
// 1.When mbist_done signal is asserted when it completes all the
//   tests, it also need to assert static membist fail signal if
//   there were any failures during the tests.
// 2.The mbist_fail signal won't be sticky bit from membist   
//   engine.  The TCU will make it sticky fail bit as needed.


// Pipelining the read_data to meet the sio timing requirement

  sio_mb1_ctl_msff_ctl_macro__width_72 read_data_pipe_reg  (
                   .scan_in(read_data_pipe_reg_scanin),
                   .scan_out(read_data_pipe_reg_scanout),
                   .din      ( opd1_or_opd0_read_data[71:0] ),
                   .dout     ( read_data_pipe[71:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign   opd1_or_opd0_read_data[71:0]  =  sio_mb1_opd1_or_opd0_sel ? opd1_read_data[71:0]:
                                                                       opd0_read_data[71:0];

  sio_mb1_ctl_msff_ctl_macro__width_6 fail_reg  (
                   .scan_in(fail_reg_scanin),
                   .scan_out(fail_reg_scanout),
                   .din      ( fail_reg_in[5:0]   ),
                   .dout     ( fail_reg_out[5:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign    fail_reg_in[5:0]      =    reset_engine      ?    6'b0: {qual_sio_opdhq1_fail, qual_sio_opddq11_fail, qual_sio_opddq10_fail,qual_sio_opdhq0_fail, qual_sio_opddq01_fail, qual_sio_opddq00_fail}  |  fail_reg_out[5:0];


  assign    qual_sio_opddq00_fail      =   fail_detect && opddq00_sel_piped;
  assign    qual_sio_opddq01_fail      =   fail_detect && opddq01_sel_piped;
  assign    qual_sio_opdhq0_fail       =   fail_detect && opdhq0_sel_piped;
  assign    qual_sio_opddq10_fail      =   fail_detect && opddq10_sel_piped;
  assign    qual_sio_opddq11_fail      =   fail_detect && opddq11_sel_piped;
  assign    qual_sio_opdhq1_fail       =   fail_detect && opdhq1_sel_piped;

  assign    fail                       =   mbist_done ?   |fail_reg_out[5:0] :
                                           qual_sio_opddq00_fail | qual_sio_opddq01_fail |
                                           qual_sio_opdhq0_fail  | qual_sio_opdhq1_fail |
                                           qual_sio_opddq10_fail | qual_sio_opddq11_fail;


  assign    fail_detect                =  (opdhq0_sel_piped || opdhq1_sel_piped)  ? 
                     (({ 40'b0, {4{sio_opd_piped_wdata[7:0]}} } !=  read_data_pipe[71:0])   &&   sio_opd_piped_ren):
                         (({9{sio_opd_piped_wdata[7:0]}} !=  read_data_pipe[71:0])   &&   sio_opd_piped_ren);


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
assign counter_reg_scanin        = run_reg_scanout          ;
assign addr_reg_scanin           = counter_reg_scanout      ;
assign wdata_reg_scanin          = addr_reg_scanout         ;
assign wr_rd_en_reg0_scanin      = wdata_reg_scanout        ;
assign wr_rd_en_reg1_scanin      = wr_rd_en_reg0_scanout    ;
assign wr_rd_en_reg2_scanin      = wr_rd_en_reg1_scanout    ;
assign wr_rd_en_reg3_scanin      = wr_rd_en_reg2_scanout    ;
assign wr_rd_en_reg4_scanin      = wr_rd_en_reg3_scanout    ;
assign wr_rd_en_reg5_scanin      = wr_rd_en_reg4_scanout    ;
assign sel_reg_scanin            = wr_rd_en_reg5_scanout    ;
assign done_reg_scanin           = sel_reg_scanout          ;
assign new_fail_reg_scanin       = done_reg_scanout         ;
assign control_reg_scanin        = new_fail_reg_scanout     ;
assign done_counter_reg_scanin   = control_reg_scanout      ;
assign data_pipe_reg1_scanin     = done_counter_reg_scanout ;
assign data_pipe_reg2_scanin     = data_pipe_reg1_scanout   ;
assign data_pipe_reg3_scanin     = data_pipe_reg2_scanout   ;
assign ren_pipe_reg1_scanin      = data_pipe_reg3_scanout   ;
assign ren_pipe_reg2_scanin      = ren_pipe_reg1_scanout    ;
assign ren_pipe_reg3_scanin      = ren_pipe_reg2_scanout    ;
assign ren_pipe_reg4_scanin      = ren_pipe_reg3_scanout    ;
assign opd_sel_reg1_scanin       = ren_pipe_reg4_scanout    ;
assign opd_sel_reg2_scanin       = opd_sel_reg1_scanout     ;
assign opd_sel_reg4_scanin       = opd_sel_reg2_scanout     ;
assign opd1or0_sel_reg1_scanin   = opd_sel_reg4_scanout     ;
assign opd1or0_sel_reg2_scanin   = opd1or0_sel_reg1_scanout ;
assign opd1or0_sel_reg3_scanin   = opd1or0_sel_reg2_scanout ;
assign opd1or0_sel_reg4_scanin   = opd1or0_sel_reg3_scanout ;
assign spares_scanin             = opd1or0_sel_reg4_scanout ;
assign read_data_pipe_reg_scanin = spares_scanout           ;
assign fail_reg_scanin           = read_data_pipe_reg_scanout;
assign scan_out                  = fail_reg_scanout         ;
// fixscan end:
endmodule // sio_mbist_ctl






// any PARAMS parms go into naming of macro

module sio_mb1_ctl_l1clkhdr_ctl_macro (
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

module sio_mb1_ctl_msff_ctl_macro__width_8 (
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

module sio_mb1_ctl_msff_ctl_macro__width_6 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0];






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sio_mb1_ctl_msff_ctl_macro__width_3 (
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

module sio_mb1_ctl_msff_ctl_macro__width_1 (
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

module sio_mb1_ctl_msff_ctl_macro__width_4 (
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

module sio_mb1_ctl_msff_ctl_macro__width_2 (
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

module sio_mb1_ctl_msff_ctl_macro__width_21 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [20:0] fdin;
wire [19:0] so;

  input [20:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [20:0] dout;
  output scan_out;
assign fdin[20:0] = din[20:0];






dff #(21)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[20:0]),
.si({scan_in,so[19:0]}),
.so({so[19:0],scan_out}),
.q(dout[20:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module sio_mb1_ctl_spare_ctl_macro__num_3 (
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






// any PARAMS parms go into naming of macro

module sio_mb1_ctl_msff_ctl_macro__width_72 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [71:0] fdin;
wire [70:0] so;

  input [71:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [71:0] dout;
  output scan_out;
assign fdin[71:0] = din[71:0];






dff #(72)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[71:0]),
.si({scan_in,so[70:0]}),
.so({so[70:0],scan_out}),
.q(dout[71:0])
);












endmodule








