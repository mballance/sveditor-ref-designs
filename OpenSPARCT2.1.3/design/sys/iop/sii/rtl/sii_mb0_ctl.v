// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sii_mb0_ctl.v
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
module sii_mb0_ctl (
  sii_mb0_run, 
  sii_mb0_addr, 
  sii_mb0_wdata, 
  sii_mb0_wr_en, 
  sii_mb0_rd_en, 
  sii_mb0_ind_wr_en, 
  sii_mb0_ind_rd_en, 
  sii_mb0_done, 
  sii_mb0_fail, 
  scan_out, 
  l2clk, 
  tcu_scan_en, 
  scan_in, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_sii_mb0_start, 
  sii_mb0_bisi_mode, 
  sii_mb0_user_mode, 
  sii_mb0_ild0_fail, 
  sii_mb0_ild1_fail, 
  sii_mb0_ild2_fail, 
  sii_mb0_ild3_fail, 
  sii_mb0_ild4_fail, 
  sii_mb0_ild5_fail, 
  sii_mb0_ild6_fail, 
  sii_mb0_ild7_fail, 
  sii_mb0_ind_fail);
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
wire run_reg_scanin;
wire run_reg_scanout;
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
wire [5:0] mbist_address;
wire wdata_reg_scanin;
wire wdata_reg_scanout;
wire [7:0] mbist_wdata;
wire rd_wr_en_reg_scanin;
wire rd_wr_en_reg_scanout;
wire mbist_ind_wr_en;
wire mbist_ind_rd_en;
wire ild_rd_wr_en_reg_scanin;
wire ild_rd_wr_en_reg_scanout;
wire mbist_ild_wr_en;
wire mbist_ild_rd_en;
wire sii_mb0_fail_reg_scanin;
wire sii_mb0_fail_reg_scanout;
wire fail;
wire sii_mb0_done_reg_scanin;
wire sii_mb0_done_reg_scanout;
wire control_reg_scanin;
wire control_reg_scanout;
wire [17:0] control_in;
wire [17:0] control_out;
wire bisi_wr_rd;
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
wire ind_ren_pipe_reg1_scanin;
wire ind_ren_pipe_reg1_scanout;
wire ind_ren_pipe_reg1_in;
wire ind_ren_pipe_out1;
wire ind_ren_pipe_reg2_scanin;
wire ind_ren_pipe_reg2_scanout;
wire ind_ren_pipe_reg2_in;
wire ind_ren_pipe_out2;
wire ind_ren_pipe_reg3_scanin;
wire ind_ren_pipe_reg3_scanout;
wire ind_ren_pipe_reg3_in;
wire ind_ren_pipe_out3;
wire ind_ren_pipe_reg4_scanin;
wire ind_ren_pipe_reg4_scanout;
wire ind_ren_pipe_reg4_in;
wire ind_ren_pipe_out4;
wire ind_ren_pipe_reg5_scanin;
wire ind_ren_pipe_reg5_scanout;
wire ind_ren_pipe_reg5_in;
wire ind_ren_pipe_out5;
wire sii_piped_ind_ren;
wire ild_ren_pipe_reg1_scanin;
wire ild_ren_pipe_reg1_scanout;
wire ild_ren_pipe_reg1_in;
wire ild_ren_pipe_out1;
wire ild_ren_pipe_reg2_scanin;
wire ild_ren_pipe_reg2_scanout;
wire ild_ren_pipe_reg2_in;
wire ild_ren_pipe_out2;
wire ild_ren_pipe_reg3_scanin;
wire ild_ren_pipe_reg3_scanout;
wire ild_ren_pipe_reg3_in;
wire ild_ren_pipe_out3;
wire ild_ren_pipe_reg4_scanin;
wire ild_ren_pipe_reg4_scanout;
wire ild_ren_pipe_reg4_in;
wire ild_ren_pipe_out4;
wire ild_ren_pipe_reg5_scanin;
wire ild_ren_pipe_reg5_scanout;
wire ild_ren_pipe_reg5_in;
wire ild_ren_pipe_out5;
wire sii_mb0_ild_rd_en;
wire sii_piped_ild_ren;
wire ild0_fail_reg_scanin;
wire ild0_fail_reg_scanout;
wire [1:0] sii_mb0_ild0_fail_piped;
wire ild1_fail_reg_scanin;
wire ild1_fail_reg_scanout;
wire [1:0] sii_mb0_ild1_fail_piped;
wire ild2_fail_reg_scanin;
wire ild2_fail_reg_scanout;
wire [1:0] sii_mb0_ild2_fail_piped;
wire ild3_fail_reg_scanin;
wire ild3_fail_reg_scanout;
wire [1:0] sii_mb0_ild3_fail_piped;
wire ild4_fail_reg_scanin;
wire ild4_fail_reg_scanout;
wire [1:0] sii_mb0_ild4_fail_piped;
wire ild5_fail_reg_scanin;
wire ild5_fail_reg_scanout;
wire [1:0] sii_mb0_ild5_fail_piped;
wire ild6_fail_reg_scanin;
wire ild6_fail_reg_scanout;
wire [1:0] sii_mb0_ild6_fail_piped;
wire ild7_fail_reg_scanin;
wire ild7_fail_reg_scanout;
wire [1:0] sii_mb0_ild7_fail_piped;
wire ind_fail_reg_scanin;
wire ind_fail_reg_scanout;
wire [1:0] sii_mb0_ind_fail_piped;
wire spares_scanin;
wire spares_scanout;
wire fail_reg_scanin;
wire fail_reg_scanout;
wire [17:0] fail_reg_in;
wire [17:0] fail_reg_out;
wire [1:0] qual_sii_ind_fail;
wire [1:0] qual_sii_ild7_fail;
wire [1:0] qual_sii_ild6_fail;
wire [1:0] qual_sii_ild5_fail;
wire [1:0] qual_sii_ild4_fail;
wire [1:0] qual_sii_ild3_fail;
wire [1:0] qual_sii_ild2_fail;
wire [1:0] qual_sii_ild1_fail;
wire [1:0] qual_sii_ild0_fail;



   output 	  sii_mb0_run;

   output [5:0]	  sii_mb0_addr;
   output [7:0]   sii_mb0_wdata;

   output         sii_mb0_wr_en;   //ild_wr_en
   output         sii_mb0_rd_en;   //ild_rd_en

   output         sii_mb0_ind_wr_en;
   output         sii_mb0_ind_rd_en;

   
   output         sii_mb0_done;
   output         sii_mb0_fail;
   output 	  scan_out;

   input          l2clk;
   input 	  tcu_scan_en;
   input 	  scan_in;
   input 	  tcu_aclk;
   input 	  tcu_bclk; 
   input 	  tcu_pce_ov;
   input 	  tcu_clk_stop;

   input          tcu_sii_mb0_start;
   input          sii_mb0_bisi_mode;
   input          sii_mb0_user_mode;

//   input [63:0]   read_data;
   input [1:0]    sii_mb0_ild0_fail;
   input [1:0]    sii_mb0_ild1_fail;
   input [1:0]    sii_mb0_ild2_fail;
   input [1:0]    sii_mb0_ild3_fail;
   input [1:0]    sii_mb0_ild4_fail;
   input [1:0]    sii_mb0_ild5_fail;
   input [1:0]    sii_mb0_ild6_fail;
   input [1:0]    sii_mb0_ild7_fail;

   input [1:0]    sii_mb0_ind_fail;

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

   sii_mb0_ctll1clkhdr_ctl_macro clkgen (
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

  sii_mb0_ctlmsff_ctl_macro__width_8 config_reg  (
               .scan_in(config_reg_scanin),
               .scan_out(config_reg_scanout),
               .din      ( config_in[7:0]       ),
               .dout     ( config_out[7:0]      ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));



  assign config_in[0]        =    tcu_sii_mb0_start;
  assign config_in[1]        =    config_out[0];
  assign start_transition    =    config_out[0]      &  ~config_out[1];
  assign reset_engine        =    start_transition   |  (mbist_user_loop_mode  &  mbist_done);
//  assign run                 =    config_out[1]      &  (mbist_user_loop_mode | ~mbist_done);
  assign run                 =    config_out[0] & config_out[1];   // 9/13/05 run to follow start only!

  assign config_in[2]        =    start_transition   ?   sii_mb0_bisi_mode:      config_out[2];
  assign bisi                =    config_out[2];

  assign config_in[3]        =    start_transition   ?   sii_mb0_user_mode:      config_out[3];
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

  
  sii_mb0_ctlmsff_ctl_macro__width_8 user_data_reg  (
                 .scan_in(user_data_reg_scanin),
                 .scan_out(user_data_reg_scanout),
                 .din      ( user_data_in[7:0]       ),
                 .dout     ( user_data_out[7:0]      ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign user_data_in[7:0]    =    user_data_out[7:0];

// If had array_select, then needed to define a user_array_sel register.


// Defining User start, stop, and increment addresses.

  sii_mb0_ctlmsff_ctl_macro__width_6 user_start_addr_reg  (
                 .scan_in(user_start_addr_reg_scanin),
                 .scan_out(user_start_addr_reg_scanout),
                 .din      ( user_start_addr_in[5:0]  ),
                 .dout     ( user_start_addr[5:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_start_addr_in[5:0]   =    user_start_addr[5:0];

  sii_mb0_ctlmsff_ctl_macro__width_6 user_stop_addr_reg  (
                 .scan_in(user_stop_addr_reg_scanin),
                 .scan_out(user_stop_addr_reg_scanout),
                 .din      ( user_stop_addr_in[5:0]  ),
                 .dout     ( user_stop_addr[5:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_stop_addr_in[5:0]   =    user_stop_addr[5:0];


  sii_mb0_ctlmsff_ctl_macro__width_6 user_incr_addr_reg  (
                 .scan_in(user_incr_addr_reg_scanin),
                 .scan_out(user_incr_addr_reg_scanout),
                 .din      ( user_incr_addr_in[5:0]  ),
                 .dout     ( user_incr_addr[5:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_incr_addr_in[5:0]   =    user_incr_addr[5:0];

  sii_mb0_ctlmsff_ctl_macro__width_1 run_reg  (
               .scan_in(run_reg_scanin),
               .scan_out(run_reg_scanout),
               .din      ( run ),
               .dout     ( sii_mb0_run ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Defining user_bisi write and read registers

  sii_mb0_ctlmsff_ctl_macro__width_1 user_bisi_wr_reg  (
                 .scan_in(user_bisi_wr_reg_scanin),
                 .scan_out(user_bisi_wr_reg_scanout),
                 .din      ( user_bisi_wr_mode_in  ),
                 .dout     ( user_bisi_wr_mode ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_bisi_wr_mode_in     =    user_bisi_wr_mode;

  sii_mb0_ctlmsff_ctl_macro__width_1 user_bisi_rd_reg  (
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

  sii_mb0_ctlmsff_ctl_macro__width_1 start_transition_reg  (
               .scan_in(start_transition_reg_scanin),
               .scan_out(start_transition_reg_scanout),
               .din      ( start_transition ),
               .dout     ( start_transition_piped ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


// /////////////////////////////////////////////////////////////////////////////
// Adding 2 extra pipeline stages to run to delay the start of mbist for 3 cycles.
// /////////////////////////////////////////////////////////////////////////////

  sii_mb0_ctlmsff_ctl_macro__width_1 run1_reg  (
               .scan_in(run1_reg_scanin),
               .scan_out(run1_reg_scanout),
               .din      ( run1_in ),
               .dout     ( run1_out ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign run1_in = reset_engine        ?   1'b0:      sii_mb0_run;

  sii_mb0_ctlmsff_ctl_macro__width_1 run2_reg  (
               .scan_in(run2_reg_scanin),
               .scan_out(run2_reg_scanout),
               .din      ( run2_in ),
               .dout     ( run2_out ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign run2_in = reset_engine        ?   1'b0:      run1_out;
//  assign run_piped3 = run2_out & run; //As soon as run goes low, mbist operation is done!
  assign run_piped3 = config_out[0] & run2_out & ~msb; //As soon as run goes low, mbist operation is done!
 

// /////////////////////////////////////////////////////////////////////////////
// Pipelining mbist outputs.
// /////////////////////////////////////////////////////////////////////////////

  sii_mb0_ctlmsff_ctl_macro__width_6 addr_reg  (
               .scan_in(addr_reg_scanin),
               .scan_out(addr_reg_scanout),
               .din      ( mbist_address[5:0]     ),
               .dout     ( sii_mb0_addr[5:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sii_mb0_ctlmsff_ctl_macro__width_8 wdata_reg  (
               .scan_in(wdata_reg_scanin),
               .scan_out(wdata_reg_scanout),
               .din      ( mbist_wdata[7:0]      ),
               .dout     ( sii_mb0_wdata[7:0]   ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sii_mb0_ctlmsff_ctl_macro__width_2 rd_wr_en_reg  (
               .scan_in(rd_wr_en_reg_scanin),
               .scan_out(rd_wr_en_reg_scanout),
               .din      ( {mbist_ind_wr_en, mbist_ind_rd_en} ),
               .dout     ( {sii_mb0_ind_wr_en, sii_mb0_ind_rd_en} ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sii_mb0_ctlmsff_ctl_macro__width_2 ild_rd_wr_en_reg  (
               .scan_in(ild_rd_wr_en_reg_scanin),
               .scan_out(ild_rd_wr_en_reg_scanout),
               .din      ( {mbist_ild_wr_en, mbist_ild_rd_en} ),
               .dout     ( {sii_mb0_wr_en, sii_mb0_rd_en} ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// fail and done
  sii_mb0_ctlmsff_ctl_macro__width_1  sii_mb0_fail_reg (
               .scan_in(sii_mb0_fail_reg_scanin),
               .scan_out(sii_mb0_fail_reg_scanout),
               .din        ( fail  ),
               .dout       ( sii_mb0_fail    ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sii_mb0_ctlmsff_ctl_macro__width_1  sii_mb0_done_reg (
               .scan_in(sii_mb0_done_reg_scanin),
               .scan_out(sii_mb0_done_reg_scanout),
               .din        ( mbist_done  ),
               .dout       ( sii_mb0_done    ),
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


   sii_mb0_ctlmsff_ctl_macro__width_18 control_reg  (
                      .scan_in(control_reg_scanin),
                      .scan_out(control_reg_scanout),
                      .din   ( control_in[17:0]           ),
                      .dout  ( control_out[17:0]          ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign   msb                       =     control_out[17];
  assign   bisi_wr_rd     = (bisi & ~user_mode) | mbist_user_bisi_wr_rd_mode ? control_out[16] : 1'b1;
  assign   data_control[1:0]         =     control_out[15:14];
  assign   address_mix               = (bisi | mbist_user_addr_mode) ?  1'b0:   control_out[13];
  assign   march_element[3:0]        =     control_out[12:9];
//  assign   array_address[5:0]        =     control_out[8:3];
  assign   array_address[5:0]        =     upaddress_march     ?  control_out[8:3] : ~control_out[8:3];

  assign   read_write_control[2:0]   =     ~five_cycle_march   ?   {2'b11,  control_out[0]} :
                                                                   control_out[2:0];

  assign   control_in[2:0]           =     reset_engine        ?   3'b0:
                                          ~run_piped3          ?   control_out[2:0]:
     (five_cycle_march && (read_write_control[2:0] == 3'b100)) ?   3'b000:
      (one_cycle_march && (read_write_control[2:0] == 3'b110)) ?   3'b000:
                                                                   control_out[2:0]   +  3'b001;

  assign   increment_addr            =     (five_cycle_march && (read_write_control[2:0] == 3'b100)) || 
                                            (one_cycle_march && (read_write_control[2:0] == 3'b110)) ||
                                            (read_write_control[2:0] == 3'b111);

  assign   control_in[8:3]  = start_transition_piped || reset_engine ?  start_addr[5:0]:
                                    ~run_piped3 || ~increment_addr   ?  control_out[8:3]:
                                                                   next_array_address[5:0];

  assign   next_array_address[5:0]   =    next_upaddr_march     ?  start_addr[5:0]:
                                          next_downaddr_march   ?  ~stop_addr[5:0]:
                                                                   (overflow_addr[5:0]);   // array_addr + incr_addr

  assign   start_addr[5:0]           =    mbist_user_addr_mode   ?   user_start_addr[5:0] : 6'b000000;
  assign   stop_addr[5:0]            =    mbist_user_addr_mode   ?   user_stop_addr[5:0] : 6'b111111;
  assign   incr_addr[5:0]            =    mbist_user_addr_mode   ?   user_incr_addr[5:0] : 6'b000001;

  assign   overflow_addr[6:0]        =    {1'b0,control_out[8:3]} + {1'b0,incr_addr[5:0]};
  assign   overflow                  =    compare_addr[6:0] < overflow_addr[6:0];

  assign   compare_addr[6:0]         =    upaddress_march       ?  {1'b0, stop_addr[5:0]} :
                                                                   {1'b0, ~start_addr[5:0]}; 

  
  assign   next_upaddr_march         =  ( (march_element[3:0] == 4'h0) || (march_element[3:0] == 4'h1) || 
                                           (march_element[3:0] == 4'h6) || (march_element[3:0] == 4'h5) || 
                                           (march_element[3:0] == 4'h8) ) && overflow; 
   
   
  assign   next_downaddr_march       =   ( (march_element[3:0] == 4'h2) || (march_element[3:0] == 4'h7) ||
                                           (march_element[3:0] == 4'h3) || (march_element[3:0] == 4'h4) ) && 
                                            overflow; 
   
   
  assign   add[5:0]                  =     five_cycle_march && ( (read_write_control[2:0] == 3'h1) || 
                                                                 (read_write_control[2:0] == 3'h3)) ?   
                                                                 adj_address[5:0]:    array_address[5:0];

  assign   adj_address[5:0]          =     { array_address[5:2], ~array_address[1], array_address[0] };  // 16 rows/column 

// Since ildq instances and indq are tested in parallel, add[5] needs to stay as
// MSB as ildq's are 32 words.
  assign   mbist_address[5:0]        =     address_mix         ?  {add[5],add[0],add[4],add[3],add[2],add[1]}:
                                                                    add[5:0];

// Definition of the rest of the control register  
  assign   increment_march_elem      =    increment_addr && overflow;
 
  assign   control_in[17:9]          =     reset_engine        ?   9'b0:
                                          ~run_piped3          ?   control_out[17:9]:
                                           {msb, bisi_wr_rd, next_data_control[1:0], next_address_mix, next_march_element[3:0]} + 
                                           {8'b0, increment_march_elem};                        

  assign   next_data_control[1:0]    =     (bisi || (mbist_user_data_mode && (data_control[1:0] == 2'b00)))  ?   2'b11:
                                                                                                                 data_control[1:0];

  assign   next_address_mix          =     bisi | mbist_user_addr_mode ?  1'b1 : address_mix;

// Incorporated ten_n_mode!  
  assign   next_march_element[3:0]   =     ( bisi || 
                                             (mbist_ten_n_mode && (march_element[3:0] == 4'b0101)) || 
                                          ((march_element[3:0] == 4'b1000) && (read_write_control[2:0] == 3'b100)) ) 
                                            && overflow ?   4'b1111:  march_element[3:0];


  assign   array_write               =    ~run_piped3          ?    1'b0:
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
   
// Declaring rd_en and wr_en
  assign   mbist_ind_rd_en           =     array_read;
  assign   mbist_ild_rd_en           =     array_read & ~array_address[5];
  assign   mbist_ind_wr_en           =     array_write;
  assign   mbist_ild_wr_en           =     array_write & ~array_address[5];


/////////////////////////////////////////////////////////////////////////
// Creating the mbist_done signal
/////////////////////////////////////////////////////////////////////////
// Delaying mbist_done 8 clock signals after msb going high, to provide
// a generic solution for done going high after the last fail has come back!

  sii_mb0_ctlmsff_ctl_macro__width_3 done_counter_reg  (
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

// /////////////////////////////////////////////////////////////////////////////
// Pipeline for wdata, and Read_en
// /////////////////////////////////////////////////////////////////////////////

// Since the fail is staged after comparator and at the mbist engine, need to
// stage read_en 4 times.
// 4/27/05: Adding an extra stage to compensate for the inverter and flop stage
// that is added to fail signals coming back to mbist engine to fix the fail logic
// and improve timing.

  sii_mb0_ctlmsff_ctl_macro__width_1  ind_ren_pipe_reg1 (
               .scan_in(ind_ren_pipe_reg1_scanin),
               .scan_out(ind_ren_pipe_reg1_scanout),
               .din        ( ind_ren_pipe_reg1_in  ),
               .dout       ( ind_ren_pipe_out1     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sii_mb0_ctlmsff_ctl_macro__width_1  ind_ren_pipe_reg2 (
               .scan_in(ind_ren_pipe_reg2_scanin),
               .scan_out(ind_ren_pipe_reg2_scanout),
               .din        ( ind_ren_pipe_reg2_in  ),
               .dout       ( ind_ren_pipe_out2     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sii_mb0_ctlmsff_ctl_macro__width_1  ind_ren_pipe_reg3 (
               .scan_in(ind_ren_pipe_reg3_scanin),
               .scan_out(ind_ren_pipe_reg3_scanout),
               .din        ( ind_ren_pipe_reg3_in  ),
               .dout       ( ind_ren_pipe_out3     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sii_mb0_ctlmsff_ctl_macro__width_1  ind_ren_pipe_reg4 (
               .scan_in(ind_ren_pipe_reg4_scanin),
               .scan_out(ind_ren_pipe_reg4_scanout),
               .din        ( ind_ren_pipe_reg4_in  ),
               .dout       ( ind_ren_pipe_out4     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sii_mb0_ctlmsff_ctl_macro__width_1  ind_ren_pipe_reg5 (
               .scan_in(ind_ren_pipe_reg5_scanin),
               .scan_out(ind_ren_pipe_reg5_scanout),
               .din        ( ind_ren_pipe_reg5_in  ),
               .dout       ( ind_ren_pipe_out5     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign ind_ren_pipe_reg1_in   =  reset_engine    ?    1'b0:      sii_mb0_ind_rd_en;
  assign ind_ren_pipe_reg2_in   =  reset_engine    ?    1'b0:      ind_ren_pipe_out1;
  assign ind_ren_pipe_reg3_in   =  reset_engine    ?    1'b0:      ind_ren_pipe_out2;
  assign ind_ren_pipe_reg4_in   =  reset_engine    ?    1'b0:      ind_ren_pipe_out3;
  assign ind_ren_pipe_reg5_in   =  reset_engine    ?    1'b0:      ind_ren_pipe_out4;
  assign sii_piped_ind_ren      =  ind_ren_pipe_out5;

  sii_mb0_ctlmsff_ctl_macro__width_1  ild_ren_pipe_reg1 (
               .scan_in(ild_ren_pipe_reg1_scanin),
               .scan_out(ild_ren_pipe_reg1_scanout),
               .din        ( ild_ren_pipe_reg1_in  ),
               .dout       ( ild_ren_pipe_out1     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sii_mb0_ctlmsff_ctl_macro__width_1  ild_ren_pipe_reg2 (
               .scan_in(ild_ren_pipe_reg2_scanin),
               .scan_out(ild_ren_pipe_reg2_scanout),
               .din        ( ild_ren_pipe_reg2_in  ),
               .dout       ( ild_ren_pipe_out2     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sii_mb0_ctlmsff_ctl_macro__width_1  ild_ren_pipe_reg3 (
               .scan_in(ild_ren_pipe_reg3_scanin),
               .scan_out(ild_ren_pipe_reg3_scanout),
               .din        ( ild_ren_pipe_reg3_in  ),
               .dout       ( ild_ren_pipe_out3     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sii_mb0_ctlmsff_ctl_macro__width_1  ild_ren_pipe_reg4 (
               .scan_in(ild_ren_pipe_reg4_scanin),
               .scan_out(ild_ren_pipe_reg4_scanout),
               .din        ( ild_ren_pipe_reg4_in  ),
               .dout       ( ild_ren_pipe_out4     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sii_mb0_ctlmsff_ctl_macro__width_1  ild_ren_pipe_reg5 (
               .scan_in(ild_ren_pipe_reg5_scanin),
               .scan_out(ild_ren_pipe_reg5_scanout),
               .din        ( ild_ren_pipe_reg5_in  ),
               .dout       ( ild_ren_pipe_out5     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign sii_mb0_ild_rd_en      =  sii_mb0_rd_en;
  assign ild_ren_pipe_reg1_in   =  reset_engine    ?    1'b0:      sii_mb0_ild_rd_en;
  assign ild_ren_pipe_reg2_in   =  reset_engine    ?    1'b0:      ild_ren_pipe_out1;
  assign ild_ren_pipe_reg3_in   =  reset_engine    ?    1'b0:      ild_ren_pipe_out2;
  assign ild_ren_pipe_reg4_in   =  reset_engine    ?    1'b0:      ild_ren_pipe_out3;
  assign ild_ren_pipe_reg5_in   =  reset_engine    ?    1'b0:      ild_ren_pipe_out4;
  assign sii_piped_ild_ren      =  ild_ren_pipe_out5;

/////////////////////////////////////////////////////////////////////////
// Pipelining fail inputs to the memory to guarantee timing.
/////////////////////////////////////////////////////////////////////////

  sii_mb0_ctlmsff_ctl_macro__width_2 ild0_fail_reg  (
                   .scan_in(ild0_fail_reg_scanin),
                   .scan_out(ild0_fail_reg_scanout),
                   .din      ( sii_mb0_ild0_fail[1:0]   ),
                   .dout     ( sii_mb0_ild0_fail_piped[1:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sii_mb0_ctlmsff_ctl_macro__width_2 ild1_fail_reg  (
                   .scan_in(ild1_fail_reg_scanin),
                   .scan_out(ild1_fail_reg_scanout),
                   .din      ( sii_mb0_ild1_fail[1:0]   ),
                   .dout     ( sii_mb0_ild1_fail_piped[1:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sii_mb0_ctlmsff_ctl_macro__width_2 ild2_fail_reg  (
                   .scan_in(ild2_fail_reg_scanin),
                   .scan_out(ild2_fail_reg_scanout),
                   .din      ( sii_mb0_ild2_fail[1:0]   ),
                   .dout     ( sii_mb0_ild2_fail_piped[1:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sii_mb0_ctlmsff_ctl_macro__width_2 ild3_fail_reg  (
                   .scan_in(ild3_fail_reg_scanin),
                   .scan_out(ild3_fail_reg_scanout),
                   .din      ( sii_mb0_ild3_fail[1:0]   ),
                   .dout     ( sii_mb0_ild3_fail_piped[1:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sii_mb0_ctlmsff_ctl_macro__width_2 ild4_fail_reg  (
                   .scan_in(ild4_fail_reg_scanin),
                   .scan_out(ild4_fail_reg_scanout),
                   .din      ( sii_mb0_ild4_fail[1:0]   ),
                   .dout     ( sii_mb0_ild4_fail_piped[1:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  sii_mb0_ctlmsff_ctl_macro__width_2 ild5_fail_reg  (
                   .scan_in(ild5_fail_reg_scanin),
                   .scan_out(ild5_fail_reg_scanout),
                   .din      ( sii_mb0_ild5_fail[1:0]   ),
                   .dout     ( sii_mb0_ild5_fail_piped[1:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  sii_mb0_ctlmsff_ctl_macro__width_2 ild6_fail_reg  (
                   .scan_in(ild6_fail_reg_scanin),
                   .scan_out(ild6_fail_reg_scanout),
                   .din      ( sii_mb0_ild6_fail[1:0]   ),
                   .dout     ( sii_mb0_ild6_fail_piped[1:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sii_mb0_ctlmsff_ctl_macro__width_2 ild7_fail_reg  (
                   .scan_in(ild7_fail_reg_scanin),
                   .scan_out(ild7_fail_reg_scanout),
                   .din      ( sii_mb0_ild7_fail[1:0]   ),
                   .dout     ( sii_mb0_ild7_fail_piped[1:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  sii_mb0_ctlmsff_ctl_macro__width_2 ind_fail_reg  (
                   .scan_in(ind_fail_reg_scanin),
                   .scan_out(ind_fail_reg_scanout),
                   .din      ( sii_mb0_ind_fail[1:0]   ),
                   .dout     ( sii_mb0_ind_fail_piped[1:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  
// /////////////////////////////////////////////////////////////////////////////
// Spare gates
// /////////////////////////////////////////////////////////////////////////////

  sii_mb0_ctlspare_ctl_macro__num_2 spares  (
                   .scan_in(spares_scanin),
                   .scan_out(spares_scanout),
                   .l1clk (l1clk),
  .siclk(siclk),
  .soclk(soclk)
  );

// /////////////////////////////////////////////////////////////////////////////
// Shared Fail Detection
// /////////////////////////////////////////////////////////////////////////////
//  Updated to meet these new features:
// 1.When mbist_done signal is asserted when it completes all the
//   tests, it also need to assert static membist fail signal if
//   there were any failures during the tests.
// 2.The mbist_fail signal won't be sticky bit from membist   
//   engine.  The TCU will make it sticky fail bit as needed.


  sii_mb0_ctlmsff_ctl_macro__width_18 fail_reg  (
                   .scan_in(fail_reg_scanin),
                   .scan_out(fail_reg_scanout),
                   .din      ( fail_reg_in[17:0]   ),
                   .dout     ( fail_reg_out[17:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign    fail_reg_in[17:0]      =    reset_engine      ?    18'b0: {qual_sii_ind_fail[1:0],qual_sii_ild7_fail[1:0],qual_sii_ild6_fail[1:0],qual_sii_ild5_fail[1:0],qual_sii_ild4_fail[1:0],qual_sii_ild3_fail[1:0],qual_sii_ild2_fail[1:0],qual_sii_ild1_fail[1:0],qual_sii_ild0_fail[1:0]}  |  fail_reg_out[17:0];


//Assuming Connie has not qualified the fail with read_en staged properly!
  assign    qual_sii_ild0_fail[0]   =   sii_piped_ild_ren &&  sii_mb0_ild0_fail_piped[0];
  assign    qual_sii_ild0_fail[1]   =   sii_piped_ild_ren &&  sii_mb0_ild0_fail_piped[1];
  assign    qual_sii_ild1_fail[0]   =   sii_piped_ild_ren &&  sii_mb0_ild1_fail_piped[0];
  assign    qual_sii_ild1_fail[1]   =   sii_piped_ild_ren &&  sii_mb0_ild1_fail_piped[1];
  assign    qual_sii_ild2_fail[0]   =   sii_piped_ild_ren &&  sii_mb0_ild2_fail_piped[0];
  assign    qual_sii_ild2_fail[1]   =   sii_piped_ild_ren &&  sii_mb0_ild2_fail_piped[1];
  assign    qual_sii_ild3_fail[0]   =   sii_piped_ild_ren &&  sii_mb0_ild3_fail_piped[0];
  assign    qual_sii_ild3_fail[1]   =   sii_piped_ild_ren &&  sii_mb0_ild3_fail_piped[1];
  assign    qual_sii_ild4_fail[0]   =   sii_piped_ild_ren &&  sii_mb0_ild4_fail_piped[0];
  assign    qual_sii_ild4_fail[1]   =   sii_piped_ild_ren &&  sii_mb0_ild4_fail_piped[1];
  assign    qual_sii_ild5_fail[0]   =   sii_piped_ild_ren &&  sii_mb0_ild5_fail_piped[0];
  assign    qual_sii_ild5_fail[1]   =   sii_piped_ild_ren &&  sii_mb0_ild5_fail_piped[1];
  assign    qual_sii_ild6_fail[0]   =   sii_piped_ild_ren &&  sii_mb0_ild6_fail_piped[0];
  assign    qual_sii_ild6_fail[1]   =   sii_piped_ild_ren &&  sii_mb0_ild6_fail_piped[1];
  assign    qual_sii_ild7_fail[0]   =   sii_piped_ild_ren &&  sii_mb0_ild7_fail_piped[0];
  assign    qual_sii_ild7_fail[1]   =   sii_piped_ild_ren &&  sii_mb0_ild7_fail_piped[1];

  assign    qual_sii_ind_fail[0]    =   sii_piped_ind_ren &&  sii_mb0_ind_fail_piped[0];
  assign    qual_sii_ind_fail[1]    =   sii_piped_ind_ren &&  sii_mb0_ind_fail_piped[1];

  assign    fail                    =   mbist_done ?   |fail_reg_out[17:0] :
                                        qual_sii_ild0_fail[0] | qual_sii_ild0_fail[1] |
                                        qual_sii_ild1_fail[0] | qual_sii_ild1_fail[1] |
                                        qual_sii_ild2_fail[0] | qual_sii_ild2_fail[1] |
                                        qual_sii_ild3_fail[0] | qual_sii_ild3_fail[1] |
                                        qual_sii_ild4_fail[0] | qual_sii_ild4_fail[1] |
                                        qual_sii_ild5_fail[0] | qual_sii_ild5_fail[1] |
                                        qual_sii_ild6_fail[0] | qual_sii_ild6_fail[1] |
                                        qual_sii_ild7_fail[0] | qual_sii_ild7_fail[1] |
                                        qual_sii_ind_fail[0]  | qual_sii_ind_fail[1];



// fixscan start:
assign config_reg_scanin         = scan_in                  ;
assign user_data_reg_scanin      = config_reg_scanout       ;
assign user_start_addr_reg_scanin = user_data_reg_scanout    ;
assign user_stop_addr_reg_scanin = user_start_addr_reg_scanout;
assign user_incr_addr_reg_scanin = user_stop_addr_reg_scanout;
assign run_reg_scanin            = user_incr_addr_reg_scanout;
assign user_bisi_wr_reg_scanin   = run_reg_scanout          ;
assign user_bisi_rd_reg_scanin   = user_bisi_wr_reg_scanout ;
assign start_transition_reg_scanin = user_bisi_rd_reg_scanout ;
assign run1_reg_scanin           = start_transition_reg_scanout;
assign run2_reg_scanin           = run1_reg_scanout         ;
assign addr_reg_scanin           = run2_reg_scanout         ;
assign wdata_reg_scanin          = addr_reg_scanout         ;
assign rd_wr_en_reg_scanin       = wdata_reg_scanout        ;
assign ild_rd_wr_en_reg_scanin   = rd_wr_en_reg_scanout     ;
assign sii_mb0_fail_reg_scanin   = ild_rd_wr_en_reg_scanout ;
assign sii_mb0_done_reg_scanin   = sii_mb0_fail_reg_scanout ;
assign control_reg_scanin        = sii_mb0_done_reg_scanout ;
assign done_counter_reg_scanin   = control_reg_scanout      ;
assign ind_ren_pipe_reg1_scanin  = done_counter_reg_scanout ;
assign ind_ren_pipe_reg2_scanin  = ind_ren_pipe_reg1_scanout;
assign ind_ren_pipe_reg3_scanin  = ind_ren_pipe_reg2_scanout;
assign ind_ren_pipe_reg4_scanin  = ind_ren_pipe_reg3_scanout;
assign ind_ren_pipe_reg5_scanin  = ind_ren_pipe_reg4_scanout;
assign ild_ren_pipe_reg1_scanin  = ind_ren_pipe_reg5_scanout;
assign ild_ren_pipe_reg2_scanin  = ild_ren_pipe_reg1_scanout;
assign ild_ren_pipe_reg3_scanin  = ild_ren_pipe_reg2_scanout;
assign ild_ren_pipe_reg4_scanin  = ild_ren_pipe_reg3_scanout;
assign ild_ren_pipe_reg5_scanin  = ild_ren_pipe_reg4_scanout;
assign ild0_fail_reg_scanin      = ild_ren_pipe_reg5_scanout;
assign ild1_fail_reg_scanin      = ild0_fail_reg_scanout    ;
assign ild2_fail_reg_scanin      = ild1_fail_reg_scanout    ;
assign ild3_fail_reg_scanin      = ild2_fail_reg_scanout    ;
assign ild4_fail_reg_scanin      = ild3_fail_reg_scanout    ;
assign ild5_fail_reg_scanin      = ild4_fail_reg_scanout    ;
assign ild6_fail_reg_scanin      = ild5_fail_reg_scanout    ;
assign ild7_fail_reg_scanin      = ild6_fail_reg_scanout    ;
assign ind_fail_reg_scanin       = ild7_fail_reg_scanout    ;
assign spares_scanin             = ind_fail_reg_scanout     ;
assign fail_reg_scanin           = spares_scanout           ;
assign scan_out                  = fail_reg_scanout         ;
// fixscan end:
endmodule // sii_mb0_ctl






// any PARAMS parms go into naming of macro

module sii_mb0_ctll1clkhdr_ctl_macro (
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

module sii_mb0_ctlmsff_ctl_macro__width_8 (
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

module sii_mb0_ctlmsff_ctl_macro__width_6 (
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

module sii_mb0_ctlmsff_ctl_macro__width_1 (
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

module sii_mb0_ctlmsff_ctl_macro__width_2 (
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

module sii_mb0_ctlmsff_ctl_macro__width_18 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [17:0] fdin;
wire [16:0] so;

  input [17:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [17:0] dout;
  output scan_out;
assign fdin[17:0] = din[17:0];






dff #(18)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[17:0]),
.si({scan_in,so[16:0]}),
.so({so[16:0],scan_out}),
.q(dout[17:0])
);












endmodule













// any PARAMS parms go into naming of macro

module sii_mb0_ctlmsff_ctl_macro__width_3 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module sii_mb0_ctlspare_ctl_macro__num_2 (
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
assign scan_out = so_1;



endmodule

