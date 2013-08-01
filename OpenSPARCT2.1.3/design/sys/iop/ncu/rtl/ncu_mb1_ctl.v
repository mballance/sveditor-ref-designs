// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_mb1_ctl.v
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
module ncu_mb1_ctl (
  mb1_run, 
  mb1_addr, 
  mb1_wdata, 
  mb1_intman_wr_en, 
  mb1_intman_rd_en, 
  mb1_dmubuf0_wr_en, 
  mb1_dmubuf0_rd_en, 
  mb1_dmubuf1_wr_en, 
  mb1_dmubuf1_rd_en, 
  mb1_cpubuf_wr_en, 
  mb1_cpubuf_rd_en, 
  mb1_done, 
  mb1_fail, 
  scan_out, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  mb1_start, 
  mb1_bisi_mode, 
  mb1_user_mode, 
  intman_dout, 
  cpubuf_dout, 
  dmubuf0_dout, 
  dmubuf1_dout);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire config_reg_scanin;
wire config_reg_scanout;
wire [8:0] config_in;
wire [8:0] config_out;
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
wire user_cmpsel_hold;
wire ten_n_mode;
wire mbist_user_data_mode;
wire mbist_user_addr_mode;
wire mbist_user_cmpsel_hold;
wire mbist_ten_n_mode;
wire user_data_reg_scanin;
wire user_data_reg_scanout;
wire [7:0] user_data_in;
wire [7:0] user_data_out;
wire user_start_addr_reg_scanin;
wire user_start_addr_reg_scanout;
wire [6:0] user_start_addr_in;
wire [6:0] user_start_addr;
wire user_stop_addr_reg_scanin;
wire user_stop_addr_reg_scanout;
wire [6:0] user_stop_addr_in;
wire [6:0] user_stop_addr;
wire user_incr_addr_reg_scanin;
wire user_incr_addr_reg_scanout;
wire [6:0] user_incr_addr_in;
wire [6:0] user_incr_addr;
wire user_array_sel_reg_scanin;
wire user_array_sel_reg_scanout;
wire [1:0] user_array_sel_in;
wire [1:0] user_array_sel;
wire user_cmpsel_reg_scanin;
wire user_cmpsel_reg_scanout;
wire [1:0] user_cmpsel_in;
wire [1:0] user_cmpsel;
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
wire intman_rd_wr_en_reg_scanin;
wire intman_rd_wr_en_reg_scanout;
wire mbist_intman_read;
wire mbist_intman_write;
wire dmubuf0_rd_wr_en_reg_scanin;
wire dmubuf0_rd_wr_en_reg_scanout;
wire mbist_dmubuf0_read;
wire mbist_dmubuf0_write;
wire dmubuf1_rd_wr_en_reg_scanin;
wire dmubuf1_rd_wr_en_reg_scanout;
wire mbist_dmubuf1_read;
wire mbist_dmubuf1_write;
wire cpubuf_rd_wr_en_reg_scanin;
wire cpubuf_rd_wr_en_reg_scanout;
wire mbist_cpubuf_read;
wire mbist_cpubuf_write;
wire mb1_addr_reg_scanin;
wire mb1_addr_reg_scanout;
wire [6:0] mbist_address;
wire mb1_wdata_reg_scanin;
wire mb1_wdata_reg_scanout;
wire [7:0] mbist_wdata;
wire done_fail_reg_scanin;
wire done_fail_reg_scanout;
wire fail;
wire intman_rd_en_piped2;
wire dmubuf0_rd_en_piped2;
wire dmubuf1_rd_en_piped2;
wire cpubuf_rd_en_piped2;
wire [1:0] cmpsel_piped3;
wire res_read_data_reg_scanin;
wire res_read_data_reg_scanout;
wire [39:0] res_read_data_piped;
wire control_reg_scanin;
wire control_reg_scanout;
wire [22:0] control_in;
wire [22:0] control_out;
wire bisi_wr_rd;
wire [1:0] array_sel;
wire [1:0] cmpsel;
wire intman_sel;
wire [1:0] data_control;
wire address_mix;
wire [3:0] march_element;
wire [6:0] array_address;
wire upaddress_march;
wire [2:0] read_write_control;
wire five_cycle_march;
wire one_cycle_march;
wire increment_addr;
wire [6:0] start_addr;
wire [6:0] next_array_address;
wire next_upaddr_march;
wire next_downaddr_march;
wire [6:0] stop_addr;
wire [7:0] overflow_addr;
wire cpubuf_sel;
wire dmubuf0_sel;
wire dmubuf1_sel;
wire [6:0] incr_addr;
wire overflow;
wire [7:0] compare_addr;
wire [6:0] add;
wire [6:0] adj_address;
wire increment_march_elem;
wire [1:0] next_array_sel;
wire [1:0] next_cmpsel;
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
wire data_pipe_reg1_scanin;
wire data_pipe_reg1_scanout;
wire [7:0] date_pipe_reg1_in;
wire [7:0] data_pipe_out1;
wire data_pipe_reg2_scanin;
wire data_pipe_reg2_scanout;
wire [7:0] date_pipe_reg2_in;
wire [7:0] data_pipe_out2;
wire data_pipe_reg3_scanin;
wire data_pipe_reg3_scanout;
wire [7:0] date_pipe_reg3_in;
wire [7:0] data_pipe_out3;
wire [7:0] ncu_mb1_piped_wdata;
wire ren_pipe_reg1_scanin;
wire ren_pipe_reg1_scanout;
wire [3:0] ren_pipe_reg1_in;
wire [3:0] rd_en_piped;
wire ren_pipe_reg2_scanin;
wire ren_pipe_reg2_scanout;
wire [3:0] ren_pipe_reg2_in;
wire [3:0] rd_en_piped2;
wire ren_pipe_reg3_scanin;
wire ren_pipe_reg3_scanout;
wire [3:0] ren_pipe_reg3_in;
wire [3:0] rd_en_piped3;
wire intman_rd_en_piped3;
wire dmubuf0_rd_en_piped3;
wire dmubuf1_rd_en_piped3;
wire cpubuf_rd_en_piped3;
wire cmpsel_pipe_reg1_scanin;
wire cmpsel_pipe_reg1_scanout;
wire [1:0] cmpsel_pipe_reg1_in;
wire [1:0] cmpsel_pipe_out1;
wire cmpsel_pipe_reg2_scanin;
wire cmpsel_pipe_reg2_scanout;
wire [1:0] cmpsel_pipe_reg2_in;
wire [1:0] cmpsel_pipe_out2;
wire cmpsel_pipe_reg3_scanin;
wire cmpsel_pipe_reg3_scanout;
wire [1:0] cmpsel_pipe_reg3_in;
wire [1:0] cmpsel_pipe_out3;
wire cmpsel_pipe_reg4_scanin;
wire cmpsel_pipe_reg4_scanout;
wire [1:0] cmpsel_pipe_reg4_in;
wire [1:0] cmpsel_pipe_out4;
wire [1:0] cmpsel_piped4;
wire fail_reg_scanin;
wire fail_reg_scanout;
wire [3:0] fail_reg_in;
wire [3:0] fail_reg_out;
wire qual_cpubuf_fail;
wire qual_dmubuf1_fail;
wire qual_dmubuf0_fail;
wire qual_intman_fail;
wire fail_detect;





// /////////////////////////////////////////////////////////////////////////////
// Outputs
// /////////////////////////////////////////////////////////////////////////////

   output 	          mb1_run;

   output [6:0]	      mb1_addr;
   output [7:0]       mb1_wdata;

   output 	          mb1_intman_wr_en;
   output 	          mb1_intman_rd_en;
   
   output 	          mb1_dmubuf0_wr_en;
   output 	          mb1_dmubuf0_rd_en;

   output 	          mb1_dmubuf1_wr_en;
   output 	          mb1_dmubuf1_rd_en;
   
   output 	          mb1_cpubuf_wr_en;
   output 	          mb1_cpubuf_rd_en;
   
   output             mb1_done;
   output             mb1_fail;

   output             scan_out;


// /////////////////////////////////////////////////////////////////////////////
// Inputs
// /////////////////////////////////////////////////////////////////////////////

   input              l2clk;
   input              scan_in;
   input              tcu_pce_ov;             // scan signals
   input              tcu_clk_stop;
   input              tcu_aclk;
   input              tcu_bclk;
   input	          tcu_scan_en;


   input              mb1_start;
   input              mb1_bisi_mode;
   input              mb1_user_mode;

   input  [15:0]	intman_dout;
   input  [143:0]	cpubuf_dout;
   input  [143:0]	dmubuf0_dout;
   input  [143:0]	dmubuf1_dout;


// /////////////////////////////////////////////////////////////////////////////
// Scan Renames
// /////////////////////////////////////////////////////////////////////////////

reg [47:0] res_read_data;

assign pce_ov = tcu_pce_ov;
assign stop   = tcu_clk_stop;
assign siclk  = tcu_aclk;
assign soclk  = tcu_bclk;
assign se     = tcu_scan_en;


////////////////////////////////////////////////////////////////////////////////
// Clock header

ncu_scd_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk 			),
        .l1en   (1'b1			),
        .l1clk  (l1clk			),
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
// A low to high transition on mb1_start will reset and start the engine.  
// mb1_start must remain active high for the duration of MBIST.  
// If mb1_start deasserts the engine will stop but not reset.
// Once MBIST has completed mbist_done will assert and the fail status
// signals will be valid.  
// To run MBIST again the mb1_start signal must transition low then high.
//
// Loop on Address will disable the address mix function.
//
// /////////////////////////////////////////////////////////////////////////////

  ncu_scd_ctl_msff_ctl_macro__width_9 config_reg  (
               .scan_in(config_reg_scanin),
               .scan_out(config_reg_scanout),
               .din      ( config_in[8:0]       ),
               .dout     ( config_out[8:0]      ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign config_in[0]        =    mb1_start;
  assign config_in[1]        =    config_out[0];
  assign start_transition    =    config_out[0]      &  ~config_out[1];
  assign reset_engine        =    start_transition   |  (mbist_user_loop_mode  &  mbist_done);
//  assign run                 =    config_out[1]      &  (mbist_user_loop_mode | ~mbist_done);
  assign run                 =    config_out[0] & config_out[1]; // 9/19/05 run to follow start only!

  assign config_in[2]        =    start_transition   ?   mb1_bisi_mode:      config_out[2];
  assign bisi                =    config_out[2];

  assign config_in[3]        =    start_transition   ?   mb1_user_mode:      config_out[3];
  assign user_mode           =    config_out[3];

  assign config_in[4]        =    config_out[4];
  assign user_data_mode      =    config_out[4];

  assign config_in[5]        =    config_out[5];
  assign user_addr_mode      =    config_out[5];

  assign config_in[6]        =    config_out[6];
  assign user_loop_mode      =    config_out[6];

  assign config_in[7]        =    config_out[7];
  assign user_cmpsel_hold    =    config_out[7];   //cmpsel_hold = 0 :  Default, All cominations
                                                   //          = 1 :  User-specified cmpsel
  assign config_in[8]        =    config_out[8];
  assign ten_n_mode          =    config_out[8];


  assign mbist_user_data_mode =   user_mode & user_data_mode;
  assign mbist_user_addr_mode =   user_mode & user_addr_mode;
  assign mbist_user_loop_mode =   user_mode & user_loop_mode;
  assign mbist_user_cmpsel_hold = user_mode & user_cmpsel_hold;
  assign mbist_ten_n_mode     =   user_mode & ten_n_mode;


  ncu_scd_ctl_msff_ctl_macro__width_8 user_data_reg  (
                 .scan_in(user_data_reg_scanin),
                 .scan_out(user_data_reg_scanout),
                 .din      ( user_data_in[7:0]       ),
                 .dout     ( user_data_out[7:0]      ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign user_data_in[7:0]    =    user_data_out[7:0];


// Defining User start, stop, and increment addresses.

  ncu_scd_ctl_msff_ctl_macro__width_7 user_start_addr_reg  (
                 .scan_in(user_start_addr_reg_scanin),
                 .scan_out(user_start_addr_reg_scanout),
                 .din      ( user_start_addr_in[6:0]  ),
                 .dout     ( user_start_addr[6:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_start_addr_in[6:0]   =    user_start_addr[6:0];

  ncu_scd_ctl_msff_ctl_macro__width_7 user_stop_addr_reg  (
                 .scan_in(user_stop_addr_reg_scanin),
                 .scan_out(user_stop_addr_reg_scanout),
                 .din      ( user_stop_addr_in[6:0]  ),
                 .dout     ( user_stop_addr[6:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_stop_addr_in[6:0]   =    user_stop_addr[6:0];


  ncu_scd_ctl_msff_ctl_macro__width_7 user_incr_addr_reg  (
                 .scan_in(user_incr_addr_reg_scanin),
                 .scan_out(user_incr_addr_reg_scanout),
                 .din      ( user_incr_addr_in[6:0]  ),
                 .dout     ( user_incr_addr[6:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_incr_addr_in[6:0]   =    user_incr_addr[6:0];

// Defining User array_sel.

  ncu_scd_ctl_msff_ctl_macro__width_2 user_array_sel_reg  (
                 .scan_in(user_array_sel_reg_scanin),
                 .scan_out(user_array_sel_reg_scanout),
                 .din      ( user_array_sel_in[1:0]  ),
                 .dout     ( user_array_sel[1:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_array_sel_in[1:0]   =    user_array_sel[1:0];

// Defining User cmpsel.

  ncu_scd_ctl_msff_ctl_macro__width_2 user_cmpsel_reg  (
                 .scan_in(user_cmpsel_reg_scanin),
                 .scan_out(user_cmpsel_reg_scanout),
                 .din      ( user_cmpsel_in[1:0]  ),
                 .dout     ( user_cmpsel[1:0] ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_cmpsel_in[1:0]      =    user_cmpsel[1:0];

// Defining user_bisi write and read registers

  ncu_scd_ctl_msff_ctl_macro__width_1 user_bisi_wr_reg  (
                 .scan_in(user_bisi_wr_reg_scanin),
                 .scan_out(user_bisi_wr_reg_scanout),
                 .din      ( user_bisi_wr_mode_in  ),
                 .dout     ( user_bisi_wr_mode ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_bisi_wr_mode_in     =    user_bisi_wr_mode;

  ncu_scd_ctl_msff_ctl_macro__width_1 user_bisi_rd_reg  (
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

  ncu_scd_ctl_msff_ctl_macro__width_1 start_transition_reg  (
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

 ncu_scd_ctl_msff_ctl_macro__width_1 run_reg (
               .scan_in(run_reg_scanin),
               .scan_out(run_reg_scanout),
               .din      ( run  ),
               .dout     ( mb1_run ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  ncu_scd_ctl_msff_ctl_macro__width_4 counter_reg  (
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

  assign run_piped16 = config_out[0] & cycle16 & ~msb; // As soon as run goes low, mbist operation is done!

// /////////////////////////////////////////////////////////////////////////////
// Adding Flop Boundaries for mbist
// /////////////////////////////////////////////////////////////////////////////

ncu_scd_ctl_msff_ctl_macro__width_2 intman_rd_wr_en_reg (
               .scan_in(intman_rd_wr_en_reg_scanin),
               .scan_out(intman_rd_wr_en_reg_scanout),
               .din      ( {mbist_intman_read, mbist_intman_write}   ),
               .dout     ( {mb1_intman_rd_en, mb1_intman_wr_en}  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

ncu_scd_ctl_msff_ctl_macro__width_2 dmubuf0_rd_wr_en_reg (
               .scan_in(dmubuf0_rd_wr_en_reg_scanin),
               .scan_out(dmubuf0_rd_wr_en_reg_scanout),
               .din      ( {mbist_dmubuf0_read, mbist_dmubuf0_write}   ),
               .dout     ( {mb1_dmubuf0_rd_en, mb1_dmubuf0_wr_en}  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

ncu_scd_ctl_msff_ctl_macro__width_2 dmubuf1_rd_wr_en_reg (
               .scan_in(dmubuf1_rd_wr_en_reg_scanin),
               .scan_out(dmubuf1_rd_wr_en_reg_scanout),
               .din      ( {mbist_dmubuf1_read, mbist_dmubuf1_write}   ),
               .dout     ( {mb1_dmubuf1_rd_en, mb1_dmubuf1_wr_en}  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

ncu_scd_ctl_msff_ctl_macro__width_2 cpubuf_rd_wr_en_reg (
               .scan_in(cpubuf_rd_wr_en_reg_scanin),
               .scan_out(cpubuf_rd_wr_en_reg_scanout),
               .din      ( {mbist_cpubuf_read, mbist_cpubuf_write}   ),
               .dout     ( {mb1_cpubuf_rd_en, mb1_cpubuf_wr_en}  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

ncu_scd_ctl_msff_ctl_macro__width_7 mb1_addr_reg (
               .scan_in(mb1_addr_reg_scanin),
               .scan_out(mb1_addr_reg_scanout),
               .din      ( mbist_address[6:0]   ),
               .dout     ( mb1_addr[6:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

ncu_scd_ctl_msff_ctl_macro__width_8 mb1_wdata_reg (
               .scan_in(mb1_wdata_reg_scanin),
               .scan_out(mb1_wdata_reg_scanout),
               .din      ( mbist_wdata[7:0]   ),
               .dout     ( mb1_wdata[7:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

ncu_scd_ctl_msff_ctl_macro__width_2 done_fail_reg (
               .scan_in(done_fail_reg_scanin),
               .scan_out(done_fail_reg_scanout),
               .din      ( {mbist_done, fail}   ),
               .dout     ( {mb1_done, mb1_fail}  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Creating 40 bit result read_data to be compared

always@( intman_rd_en_piped2 or dmubuf0_rd_en_piped2 or dmubuf1_rd_en_piped2 or cpubuf_rd_en_piped2 or cmpsel_piped3 or intman_dout or dmubuf0_dout or dmubuf1_dout or cpubuf_dout ) begin
    case( {intman_rd_en_piped2,dmubuf0_rd_en_piped2,dmubuf1_rd_en_piped2,cpubuf_rd_en_piped2,cmpsel_piped3[1:0]} ) //synopsys parallel_case full_case
    6'b100011  : res_read_data[39:0] = {24'b0,intman_dout[15:0]};
    6'b010000  : res_read_data[39:0] = dmubuf0_dout[39:0];
    6'b010001  : res_read_data[39:0] = dmubuf0_dout[79:40];
    6'b010010  : res_read_data[39:0] = dmubuf0_dout[119:80];
    6'b010011  : res_read_data[39:0] = {16'b0,dmubuf0_dout[143:120]};
    6'b001000  : res_read_data[39:0] = dmubuf1_dout[39:0];
    6'b001001  : res_read_data[39:0] = dmubuf1_dout[79:40];
    6'b001010  : res_read_data[39:0] = dmubuf1_dout[119:80];
    6'b001011  : res_read_data[39:0] = {16'b0,dmubuf1_dout[143:120]};
    6'b000100  : res_read_data[39:0] = cpubuf_dout[39:0];
    6'b000101  : res_read_data[39:0] = cpubuf_dout[79:40];
    6'b000110  : res_read_data[39:0] = cpubuf_dout[119:80];
    6'b000111  : res_read_data[39:0] = {16'b0,cpubuf_dout[143:120]};
    default    : res_read_data[39:0] = dmubuf0_dout[39:0];
    endcase
 end   

ncu_scd_ctl_msff_ctl_macro__width_40 res_read_data_reg (
               .scan_in(res_read_data_reg_scanin),
               .scan_out(res_read_data_reg_scanout),
               .din      ( res_read_data[39:0]   ),
               .dout     ( res_read_data_piped[39:0]  ),
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
   ncu_scd_ctl_msff_ctl_macro__width_23 control_reg  (
                      .scan_in(control_reg_scanin),
                      .scan_out(control_reg_scanout),
                      .din   ( control_in[22:0]           ),
                      .dout  ( control_out[22:0]          ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign   msb                       =     control_out[22];
  assign   bisi_wr_rd     = (bisi & ~user_mode) | mbist_user_bisi_wr_rd_mode ? control_out[21] : 1'b1;
  assign   array_sel[1:0]            =     user_mode           ?  user_array_sel[1:0] : control_out[20:19];
  assign   cmpsel[1:0]               =  mbist_user_cmpsel_hold ?  user_cmpsel         : 
                                                   intman_sel  ?  2'b11               : control_out[18:17];
  assign   data_control[1:0]         =     control_out[16:15];
  assign   address_mix         = (bisi | mbist_user_addr_mode) ?  1'b0       : control_out[14];
  assign   march_element[3:0]        =     control_out[13:10];
  assign   array_address[6:0]        =     upaddress_march     ?  control_out[9:3] : ~control_out[9:3];

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

  assign   control_in[9:3]  = start_transition_piped || reset_engine  ?  start_addr[6:0]:
                              ~run_piped16 || ~increment_addr   ?  control_out[9:3]:
                                                                   next_array_address[6:0];

  assign   next_array_address[6:0]   =    next_upaddr_march     ?  start_addr[6:0]:
                                          next_downaddr_march   ?  ~stop_addr[6:0]:
                                                                   (overflow_addr[6:0]);   // array_addr + incr_addr

  assign   start_addr[6:0]           =    mbist_user_addr_mode  ?   user_start_addr[6:0]: 7'b0000000;
  assign   stop_addr[6:0]            =    mbist_user_addr_mode  ?   user_stop_addr[6:0] :  
                     cpubuf_sel || dmubuf0_sel ||  dmubuf1_sel  ?   7'b0011111          : 7'b1111111;                                        
  assign   incr_addr[6:0]            =    mbist_user_addr_mode  ?   user_incr_addr[6:0] : 7'b0000001;

  assign   overflow_addr[7:0]        =    {1'b0,control_out[9:3]} + {1'b0,incr_addr[6:0]};
  assign   overflow                  =    compare_addr[7:0] < overflow_addr[7:0];

  assign   compare_addr[7:0]         =    upaddress_march       ?  {1'b0, stop_addr[6:0]} :
                                                                   {1'b0, ~start_addr[6:0]}; 

   
  assign   next_upaddr_march         =   ( (march_element[3:0] == 4'h0) || (march_element[3:0] == 4'h1) || 
                                           (march_element[3:0] == 4'h6) || (march_element[3:0] == 4'h5) || 
                                           (march_element[3:0] == 4'h8) ) && overflow; 
   
  assign   next_downaddr_march       =   ( (march_element[3:0] == 4'h2) || (march_element[3:0] == 4'h7) ||
                                           (march_element[3:0] == 4'h3) || (march_element[3:0] == 4'h4) ) && 
                                            overflow; 
   
   
  assign   add[6:0]                  =     five_cycle_march && ( (read_write_control[2:0] == 3'h1) || 
                                                                 (read_write_control[2:0] == 3'h3)) ?   
                                                                 adj_address[6:0]:    array_address[6:0];

  assign   adj_address[6:0]          =    {array_address[6:2], ~array_address[1], array_address[0]};  
  
//intman has 128 words, while the other 3 memories have 32 words.  
//intman is 2 blks of 32 rows and 32 cols (2:1 colmux; col address is MSB!)
//The other 3 memories are 32x144, signle blk of 32 rows.

  assign   mbist_address[6:0]        =    address_mix & intman_sel ?  {add[0],add[6:1]}: //Fast colum, then row
                                          address_mix              ?  {add[6:5],add[0],add[4:1]}: 
                                                                       add[6:0]; //Fast Row
                                                              
// Definition of the rest of the control register  
  assign   increment_march_elem      =     increment_addr && overflow;

  assign   control_in[22:10]         =     reset_engine        ?   13'b0:
                                         ~run_piped16          ?   control_out[22:10]:
                                           {msb, bisi_wr_rd, next_array_sel[1:0], next_cmpsel[1:0], next_data_control[1:0], next_address_mix, next_march_element[3:0]} + 
                                           {12'b0, increment_march_elem};                        


  assign   next_array_sel[1:0]       =     user_mode           ?   2'b11:  control_out[20:19]; 

  assign   next_cmpsel[1:0]          =  (mbist_user_cmpsel_hold || ~bisi_wr_rd || mbist_user_bisi_wr_mode) ?   2'b11 : 
                                           intman_sel            ?   2'b11 : control_out[18:17]; 
  
  assign   next_data_control[1:0]    =     (bisi || (mbist_user_data_mode && (data_control[1:0] == 2'b00)))  ?   2'b11:
                                                                                                                 data_control[1:0];

  assign   next_address_mix          =     bisi | mbist_user_addr_mode ?  1'b1 : address_mix;

// Incorporated ten_n_mode!  
  assign   next_march_element[3:0]   =     ( bisi || 
                                             (mbist_ten_n_mode && (march_element[3:0] == 4'b0101)) || 
                                          ((march_element[3:0] == 4'b1000) && (read_write_control[2:0] == 3'b100)) ) 
                                            && overflow ?   4'b1111:  march_element[3:0];


  assign   array_write               =     ~run_piped16        ?    1'b0:
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

  ncu_scd_ctl_msff_ctl_macro__width_3 done_counter_reg  (
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
// Array Selects and read and write_en
// /////////////////////////////////////////////////////////////////////////////
  
  assign   intman_sel                =    ~array_sel[1] & ~array_sel[0];
  assign   dmubuf0_sel               =    ~array_sel[1] &  array_sel[0];
  assign   dmubuf1_sel               =     array_sel[1] & ~array_sel[0];
  assign   cpubuf_sel                =     array_sel[1] &  array_sel[0];
  
  assign   mbist_intman_read         =    intman_sel  &&  array_read;
  assign   mbist_intman_write        =    intman_sel  &&  array_write;

  assign   mbist_dmubuf0_read        =    dmubuf0_sel  &&  array_read;
  assign   mbist_dmubuf0_write       =    dmubuf0_sel  &&  array_write;

  assign   mbist_dmubuf1_read        =    dmubuf1_sel  &&  array_read;
  assign   mbist_dmubuf1_write       =    dmubuf1_sel  &&  array_write;

  assign   mbist_cpubuf_read         =    cpubuf_sel  &&  array_read;
  assign   mbist_cpubuf_write        =    cpubuf_sel  &&  array_write;


// /////////////////////////////////////////////////////////////////////////////
// Pipeline for wdata, enables, and cmpsel
// /////////////////////////////////////////////////////////////////////////////

// Pipeline for wdata

  ncu_scd_ctl_msff_ctl_macro__width_8  data_pipe_reg1 (
               .scan_in(data_pipe_reg1_scanin),
               .scan_out(data_pipe_reg1_scanout),
               .din        ( date_pipe_reg1_in[7:0]  ),
               .dout       ( data_pipe_out1[7:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  ncu_scd_ctl_msff_ctl_macro__width_8  data_pipe_reg2 (
               .scan_in(data_pipe_reg2_scanin),
               .scan_out(data_pipe_reg2_scanout),
               .din        ( date_pipe_reg2_in[7:0]  ),
               .dout       ( data_pipe_out2[7:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  ncu_scd_ctl_msff_ctl_macro__width_8  data_pipe_reg3 (
               .scan_in(data_pipe_reg3_scanin),
               .scan_out(data_pipe_reg3_scanout),
               .din        ( date_pipe_reg3_in[7:0]  ),
               .dout       ( data_pipe_out3[7:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign date_pipe_reg1_in[7:0]   =  reset_engine    ?    8'h00:      mb1_wdata[7:0];
  assign date_pipe_reg2_in[7:0]   =  reset_engine    ?    8'h00:      data_pipe_out1[7:0];
  assign date_pipe_reg3_in[7:0]   =  reset_engine    ?    8'h00:      data_pipe_out2[7:0];

  assign ncu_mb1_piped_wdata[7:0]  =  data_pipe_out3[7:0];

// Pipeline for Read Enable
  ncu_scd_ctl_msff_ctl_macro__width_4 ren_pipe_reg1 (
               .scan_in(ren_pipe_reg1_scanin),
               .scan_out(ren_pipe_reg1_scanout),
               .din        ( ren_pipe_reg1_in[3:0]  ),
               .dout       ( rd_en_piped[3:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  ncu_scd_ctl_msff_ctl_macro__width_4 ren_pipe_reg2 (
               .scan_in(ren_pipe_reg2_scanin),
               .scan_out(ren_pipe_reg2_scanout),
               .din        ( ren_pipe_reg2_in[3:0]  ),
               .dout       ( rd_en_piped2[3:0]    ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  ncu_scd_ctl_msff_ctl_macro__width_4 ren_pipe_reg3 (
               .scan_in(ren_pipe_reg3_scanin),
               .scan_out(ren_pipe_reg3_scanout),
               .din        ( ren_pipe_reg3_in[3:0]  ),
               .dout       ( rd_en_piped3[3:0]    ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign ren_pipe_reg1_in[3:0]  =  reset_engine   ?   4'b0:  {mb1_cpubuf_rd_en,mb1_dmubuf1_rd_en,mb1_dmubuf0_rd_en,mb1_intman_rd_en} ; 
  assign ren_pipe_reg2_in[3:0]  =  reset_engine   ?   4'b0:  rd_en_piped[3:0];
  assign ren_pipe_reg3_in[3:0]  =  reset_engine   ?   4'b0:  rd_en_piped2[3:0];

  assign intman_rd_en_piped2    =  rd_en_piped2[0];
  assign dmubuf0_rd_en_piped2   =  rd_en_piped2[1];
  assign dmubuf1_rd_en_piped2   =  rd_en_piped2[2];
  assign cpubuf_rd_en_piped2    =  rd_en_piped2[3];

  assign intman_rd_en_piped3    =  rd_en_piped3[0];
  assign dmubuf0_rd_en_piped3   =  rd_en_piped3[1];
  assign dmubuf1_rd_en_piped3   =  rd_en_piped3[2];
  assign cpubuf_rd_en_piped3    =  rd_en_piped3[3];

// Pipelining cmpsel

  ncu_scd_ctl_msff_ctl_macro__width_2  cmpsel_pipe_reg1 (
               .scan_in(cmpsel_pipe_reg1_scanin),
               .scan_out(cmpsel_pipe_reg1_scanout),
               .din        ( cmpsel_pipe_reg1_in[1:0]  ),
               .dout       ( cmpsel_pipe_out1[1:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  ncu_scd_ctl_msff_ctl_macro__width_2  cmpsel_pipe_reg2 (
               .scan_in(cmpsel_pipe_reg2_scanin),
               .scan_out(cmpsel_pipe_reg2_scanout),
               .din        ( cmpsel_pipe_reg2_in[1:0]  ),
               .dout       ( cmpsel_pipe_out2[1:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  ncu_scd_ctl_msff_ctl_macro__width_2  cmpsel_pipe_reg3 (
               .scan_in(cmpsel_pipe_reg3_scanin),
               .scan_out(cmpsel_pipe_reg3_scanout),
               .din        ( cmpsel_pipe_reg3_in[1:0]  ),
               .dout       ( cmpsel_pipe_out3[1:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  ncu_scd_ctl_msff_ctl_macro__width_2  cmpsel_pipe_reg4 (
               .scan_in(cmpsel_pipe_reg4_scanin),
               .scan_out(cmpsel_pipe_reg4_scanout),
               .din        ( cmpsel_pipe_reg4_in[1:0]  ),
               .dout       ( cmpsel_pipe_out4[1:0]     ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign cmpsel_pipe_reg1_in[1:0]   =  reset_engine    ?    2'b0:     cmpsel[1:0];
  assign cmpsel_pipe_reg2_in[1:0]   =  reset_engine    ?    2'b0:     cmpsel_pipe_out1[1:0];
  assign cmpsel_pipe_reg3_in[1:0]   =  reset_engine    ?    2'b0:     cmpsel_pipe_out2[1:0];
  assign cmpsel_pipe_reg4_in[1:0]   =  reset_engine    ?    2'b0:     cmpsel_pipe_out3[1:0];
  assign cmpsel_piped3[1:0]         =  cmpsel_pipe_out3[1:0];
  assign cmpsel_piped4[1:0]         =  cmpsel_pipe_out4[1:0];



// /////////////////////////////////////////////////////////////////////////////
// Shared Fail Detection
// /////////////////////////////////////////////////////////////////////////////
// Updated to meet these new features:
// 1.When mbist_done signal is asserted when it completes all the
//   tests, it also need to assert static membist fail signal if
//   there were any failures during the tests.
// 2.The mbist_fail signal won't be sticky bit from membist   
//   engine.  The TCU will make it sticky fail bit as needed.


  ncu_scd_ctl_msff_ctl_macro__width_4 fail_reg  (
                   .scan_in(fail_reg_scanin),
                   .scan_out(fail_reg_scanout),
                   .din      ( fail_reg_in[3:0]   ),
                   .dout     ( fail_reg_out[3:0]  ),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign    fail_reg_in[3:0]      =    reset_engine      ?    4'b0: 
                           {qual_cpubuf_fail,qual_dmubuf1_fail,qual_dmubuf0_fail,qual_intman_fail}  |  fail_reg_out[3:0];


  assign    qual_intman_fail     =  fail_detect && intman_rd_en_piped3;
  assign    qual_dmubuf0_fail    =  fail_detect && dmubuf0_rd_en_piped3;
  assign    qual_dmubuf1_fail    =  fail_detect && dmubuf1_rd_en_piped3;
  assign    qual_cpubuf_fail     =  fail_detect && cpubuf_rd_en_piped3;

  assign    fail               =  mbist_done ?  |fail_reg_out[3:0]:
                                  qual_intman_fail | qual_dmubuf0_fail | qual_dmubuf1_fail | qual_cpubuf_fail;

  assign    fail_detect        =  intman_rd_en_piped3 ?  
                                      ({2{ncu_mb1_piped_wdata[7:0]}}  !=  res_read_data_piped[15:0]):
                                 (dmubuf0_rd_en_piped3 || dmubuf1_rd_en_piped3 || cpubuf_rd_en_piped3) &
                                 (cmpsel_piped4[1:0] == 2'b11) ?
                                      ({3{ncu_mb1_piped_wdata[7:0]}}  !=  res_read_data_piped[23:0]):
                                      ({5{ncu_mb1_piped_wdata[7:0]}}  !=  res_read_data_piped[39:0]);



supply0 vss; // <- port for ground
supply1 vdd; // <- port for power 
// /////////////////////////////////////////////////////////////////////////////
// fixscan start:
assign config_reg_scanin         = scan_in                  ;
assign user_data_reg_scanin      = config_reg_scanout       ;
assign user_start_addr_reg_scanin = user_data_reg_scanout    ;
assign user_stop_addr_reg_scanin = user_start_addr_reg_scanout;
assign user_incr_addr_reg_scanin = user_stop_addr_reg_scanout;
assign user_array_sel_reg_scanin = user_incr_addr_reg_scanout;
assign user_cmpsel_reg_scanin    = user_array_sel_reg_scanout;
assign user_bisi_wr_reg_scanin   = user_cmpsel_reg_scanout  ;
assign user_bisi_rd_reg_scanin   = user_bisi_wr_reg_scanout ;
assign start_transition_reg_scanin = user_bisi_rd_reg_scanout ;
assign run_reg_scanin            = start_transition_reg_scanout;
assign counter_reg_scanin        = run_reg_scanout          ;
assign intman_rd_wr_en_reg_scanin = counter_reg_scanout      ;
assign dmubuf0_rd_wr_en_reg_scanin = intman_rd_wr_en_reg_scanout;
assign dmubuf1_rd_wr_en_reg_scanin = dmubuf0_rd_wr_en_reg_scanout;
assign cpubuf_rd_wr_en_reg_scanin = dmubuf1_rd_wr_en_reg_scanout;
assign mb1_addr_reg_scanin       = cpubuf_rd_wr_en_reg_scanout;
assign mb1_wdata_reg_scanin      = mb1_addr_reg_scanout     ;
assign done_fail_reg_scanin      = mb1_wdata_reg_scanout    ;
assign res_read_data_reg_scanin  = done_fail_reg_scanout    ;
assign control_reg_scanin        = res_read_data_reg_scanout;
assign done_counter_reg_scanin   = control_reg_scanout      ;
assign data_pipe_reg1_scanin     = done_counter_reg_scanout ;
assign data_pipe_reg2_scanin     = data_pipe_reg1_scanout   ;
assign data_pipe_reg3_scanin     = data_pipe_reg2_scanout   ;
assign ren_pipe_reg1_scanin      = data_pipe_reg3_scanout   ;
assign ren_pipe_reg2_scanin      = ren_pipe_reg1_scanout    ;
assign ren_pipe_reg3_scanin      = ren_pipe_reg2_scanout    ;
assign cmpsel_pipe_reg1_scanin   = ren_pipe_reg3_scanout    ;
assign cmpsel_pipe_reg2_scanin   = cmpsel_pipe_reg1_scanout ;
assign cmpsel_pipe_reg3_scanin   = cmpsel_pipe_reg2_scanout ;
assign cmpsel_pipe_reg4_scanin   = cmpsel_pipe_reg3_scanout ;
assign fail_reg_scanin           = cmpsel_pipe_reg4_scanout ;
assign scan_out                  = fail_reg_scanout         ;
// fixscan end:
endmodule
// /////////////////////////////////////////////////////////////////////////////


