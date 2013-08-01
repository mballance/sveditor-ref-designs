// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_mb0.v
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
module dmu_mb0 (
  dmu_mb0_run, 
  dmu_mb0_addr, 
  dmu_mb0_wdata, 
  dmu_mb0_diu_wr_en, 
  dmu_mb0_diu_rd_en, 
  dmu_mb0_tdb_wr_en, 
  dmu_mb0_tdb_rd_en, 
  dmu_mb0_dou_dma_data_wr_en, 
  dmu_mb0_dou_dma_data_rd_en, 
  dmu_mb0_dou_pio_data_wr_en, 
  dmu_mb0_dou_pio_data_rd_en, 
  dmu_mb0_dev_wr_en, 
  dmu_mb0_dev_rd_en, 
  dmu_mb0_tsb_wr_en, 
  dmu_mb0_tsb_rd_en, 
  dmu_mb0_done, 
  dmu_mb0_fail, 
  scan_out, 
  l1clk, 
  scan_in, 
  tcu_aclk, 
  tcu_bclk, 
  rst_, 
  tcu_dmu_mb0_start, 
  dmu_mb0_bisi_mode, 
  dmu_mb0_user_mode, 
  dmu_diu_read_data, 
  dmu_tdb_read_data, 
  dmu_dou_dma_read_data, 
  dmu_dou_pio_read_data, 
  dev_tsb_read_data);
wire siclk;
wire soclk;
wire reset;
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
wire [8:0] user_start_addr_in;
wire [8:0] user_start_addr;
wire user_stop_addr_reg_scanin;
wire user_stop_addr_reg_scanout;
wire [8:0] user_stop_addr_in;
wire [8:0] user_stop_addr;
wire user_incr_addr_reg_scanin;
wire user_incr_addr_reg_scanout;
wire [8:0] user_incr_addr_in;
wire [8:0] user_incr_addr;
wire user_array_sel_reg_scanin;
wire user_array_sel_reg_scanout;
wire [2:0] user_array_sel_in;
wire [2:0] user_array_sel;
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
wire [8:0] mbist_address;
wire wdata_reg_scanin;
wire wdata_reg_scanout;
wire [7:0] mbist_wdata;
wire wr_rd_en_reg_scanin;
wire wr_rd_en_reg_scanout;
wire diu_wr_en;
wire diu_rd_en;
wire tdb_wr_en;
wire tdb_rd_en;
wire dma_data_wr_en;
wire dma_data_rd_en;
wire pio_data_wr_en;
wire pio_data_rd_en;
wire dev_wr_en;
wire dev_rd_en;
wire tsb_wr_en;
wire tsb_rd_en;
wire done_reg_scanin;
wire done_reg_scanout;
wire mbist_fail_reg_scanin;
wire mbist_fail_reg_scanout;
wire fail;
wire diu_sel_piped2;
wire tdb_sel_piped2;
wire dma_data_sel_piped2;
wire pio_data_sel_piped2;
wire dev_sel_piped2;
wire tsb_sel_piped2;
wire [1:0] cmpsel_piped2;
wire res_read_data_reg_scanin;
wire res_read_data_reg_scanout;
wire [39:0] res_read_data_piped;
wire control_reg_scanin;
wire control_reg_scanout;
wire [25:0] control_in;
wire [25:0] control_out;
wire bisi_wr_rd;
wire [2:0] array_sel;
wire [1:0] cmpsel;
wire tdb_sel;
wire dev_sel;
wire tsb_sel;
wire [1:0] data_control;
wire address_mix;
wire [3:0] march_element;
wire [8:0] array_address;
wire upaddress_march;
wire [2:0] read_write_control;
wire five_cycle_march;
wire one_cycle_march;
wire increment_addr;
wire [8:0] start_addr;
wire [8:0] next_array_address;
wire next_upaddr_march;
wire next_downaddr_march;
wire [8:0] stop_addr;
wire [9:0] overflow_addr;
wire diu_sel;
wire dma_data_sel;
wire pio_data_sel;
wire [8:0] incr_addr;
wire overflow;
wire [9:0] compare_addr;
wire [8:0] add;
wire [8:0] adj_address;
wire increment_march_elem;
wire [2:0] next_array_sel;
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
wire [7:0] data_pipe_reg1_in;
wire [7:0] data_pipe_out1;
wire data_pipe_reg2_scanin;
wire data_pipe_reg2_scanout;
wire [7:0] data_pipe_reg2_in;
wire [7:0] data_pipe_out2;
wire [7:0] dmu_mb0_piped_data;
wire array_sel_pipe_reg1_scanin;
wire array_sel_pipe_reg1_scanout;
wire [2:0] array_sel_pipe_reg1_in;
wire [2:0] array_sel_piped;
wire array_sel_pipe_reg2_scanin;
wire array_sel_pipe_reg2_scanout;
wire [2:0] array_sel_pipe_reg2_in;
wire [2:0] array_sel_piped2;
wire diu_ren_pipe_reg1_scanin;
wire diu_ren_pipe_reg1_scanout;
wire diu_ren_pipe_reg1_in;
wire diu_rd_en_piped;
wire diu_ren_pipe_reg2_scanin;
wire diu_ren_pipe_reg2_scanout;
wire diu_ren_pipe_reg2_in;
wire diu_rd_en_piped2;
wire tdb_ren_pipe_reg1_scanin;
wire tdb_ren_pipe_reg1_scanout;
wire tdb_ren_pipe_reg1_in;
wire tdb_rd_en_piped;
wire tdb_ren_pipe_reg2_scanin;
wire tdb_ren_pipe_reg2_scanout;
wire tdb_ren_pipe_reg2_in;
wire tdb_rd_en_piped2;
wire dma_data_ren_pipe_reg1_scanin;
wire dma_data_ren_pipe_reg1_scanout;
wire dma_data_ren_pipe_reg1_in;
wire dma_data_rd_en_piped;
wire dma_data_ren_pipe_reg2_scanin;
wire dma_data_ren_pipe_reg2_scanout;
wire dma_data_ren_pipe_reg2_in;
wire dma_data_rd_en_piped2;
wire pio_data_ren_pipe_reg1_scanin;
wire pio_data_ren_pipe_reg1_scanout;
wire pio_data_ren_pipe_reg1_in;
wire pio_data_rd_en_piped;
wire pio_data_ren_pipe_reg2_scanin;
wire pio_data_ren_pipe_reg2_scanout;
wire pio_data_ren_pipe_reg2_in;
wire pio_data_rd_en_piped2;
wire dev_ren_pipe_reg1_scanin;
wire dev_ren_pipe_reg1_scanout;
wire dev_ren_pipe_reg1_in;
wire dev_rd_en_piped;
wire dev_ren_pipe_reg2_scanin;
wire dev_ren_pipe_reg2_scanout;
wire dev_ren_pipe_reg2_in;
wire dev_rd_en_piped2;
wire tsb_ren_pipe_reg1_scanin;
wire tsb_ren_pipe_reg1_scanout;
wire tsb_ren_pipe_reg1_in;
wire tsb_rd_en_piped;
wire tsb_ren_pipe_reg2_scanin;
wire tsb_ren_pipe_reg2_scanout;
wire tsb_ren_pipe_reg2_in;
wire tsb_rd_en_piped2;
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
wire [1:0] cmpsel_piped3;
wire fail_reg_scanin;
wire fail_reg_scanout;
wire [5:0] fail_reg_in;
wire [5:0] fail_reg_out;
wire qual_tsb_fail;
wire qual_dev_fail;
wire qual_pio_data_fail;
wire qual_dma_data_fail;
wire qual_tdb_fail;
wire qual_diu_fail;
wire fail_detect;



   output 	  dmu_mb0_run;

   output [8:0]	  dmu_mb0_addr;
   output [7:0]   dmu_mb0_wdata;
//Removed as all the muxing was moved to bist rtl.
//   output [3:0]   dmu_mb0_cmpsel; // Decoded comparator select lines
                                  // Used to reduce routed memory outputs to 
                                  // the mbist engine.

   output 	      dmu_mb0_diu_wr_en;
   output 	      dmu_mb0_diu_rd_en;
   
   output     	  dmu_mb0_tdb_wr_en;
   output 	      dmu_mb0_tdb_rd_en;
   
   output     	  dmu_mb0_dou_dma_data_wr_en;
   output 	      dmu_mb0_dou_dma_data_rd_en;
   
   output     	  dmu_mb0_dou_pio_data_wr_en;
   output     	  dmu_mb0_dou_pio_data_rd_en;
   
   output 	      dmu_mb0_dev_wr_en;
   output 	      dmu_mb0_dev_rd_en;
   
   output 	      dmu_mb0_tsb_wr_en;
   output 	      dmu_mb0_tsb_rd_en;
   
   output         dmu_mb0_done;
   output         dmu_mb0_fail;

   output 	      scan_out;

//   input          l2clk;   
   input          l1clk;  // Since l1clkhdr was removed to make asic flow easier.
//   input     	  tcu_scan_en;
   input     	  scan_in;
   input 	      tcu_aclk;
   input     	  tcu_bclk; 
//   input 	      tcu_pce_ov;
//   input     	  tcu_clk_stop;
   input          rst_;

   input          tcu_dmu_mb0_start;
   input          dmu_mb0_bisi_mode;
   input          dmu_mb0_user_mode;

   // To minimize routing of the memory outputs to the mbist controller,
   // their outputs are muxed. Since the largest memory is x149, the
   // outputs are muxed 4:1 to get a maximum 38 lines going back to the
   // mbist engine. To make compare more consistent, this is increased to 40 bits.

   input [148:0]  dmu_diu_read_data;

   input [59:0]   dmu_tdb_read_data; // dmu_mmu_tdb 

   input [131:0]  dmu_dou_dma_read_data; 
   input [131:0]  dmu_dou_pio_read_data; 

   input [63:0]   dev_tsb_read_data; // dmu_mmu_tdb 


   
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

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_9 config_reg    (
               .scan_in(config_reg_scanin),
               .scan_out(config_reg_scanout),
               .din      ( config_in[8:0]       ),
               .dout     ( config_out[8:0]      ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));



  assign config_in[0]        =    tcu_dmu_mb0_start;
  assign config_in[1]        =    config_out[0];
  assign start_transition    =    config_out[0]      &  ~config_out[1];
  assign reset_engine        =    start_transition   |  (mbist_user_loop_mode  &  mbist_done);
//  assign run                 =    config_out[1]      &  ~mbist_done;
//  assign run                 =    config_out[1]      &  (mbist_user_loop_mode | ~mbist_done);
  assign run                 =    config_out[0] & config_out[1]; // 9/19/05 run to follow start only!

  assign config_in[2]        =    start_transition   ?   dmu_mb0_bisi_mode:      config_out[2];
  assign bisi                =    config_out[2];

  assign config_in[3]        =    start_transition   ?   dmu_mb0_user_mode:      config_out[3];
  assign user_mode           =    config_out[3];

  assign config_in[4]        =    config_out[4];
  assign user_data_mode      =    config_out[4];

  assign config_in[5]        =    config_out[5];
  assign user_addr_mode      =    config_out[5];

  assign config_in[6]        =    config_out[6];
  assign user_loop_mode      =    config_out[6];

  assign config_in[7]        =    config_out[7];
  assign user_cmpsel_hold    =    config_out[7];   //cmpsel_hold = 0 :  Default, All cominations
                                                   //            = 1 :  User-specified cmpsel
  assign config_in[8]        =    config_out[8];
  assign ten_n_mode          =    config_out[8];


  assign mbist_user_data_mode =   user_mode & user_data_mode;
  assign mbist_user_addr_mode =   user_mode & user_addr_mode;
  assign mbist_user_loop_mode =   user_mode & user_loop_mode;
  assign mbist_user_cmpsel_hold = user_mode & user_cmpsel_hold;
  assign mbist_ten_n_mode     =   user_mode & ten_n_mode;


  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_8 user_data_reg    (
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

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_9 user_start_addr_reg    (
                 .scan_in(user_start_addr_reg_scanin),
                 .scan_out(user_start_addr_reg_scanout),
                 .din      ( user_start_addr_in[8:0]  ),
                 .dout     ( user_start_addr[8:0] ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_start_addr_in[8:0]   =    user_start_addr[8:0];

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_9 user_stop_addr_reg    (
                 .scan_in(user_stop_addr_reg_scanin),
                 .scan_out(user_stop_addr_reg_scanout),
                 .din      ( user_stop_addr_in[8:0]  ),
                 .dout     ( user_stop_addr[8:0] ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_stop_addr_in[8:0]   =    user_stop_addr[8:0];


  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_9 user_incr_addr_reg    (
                 .scan_in(user_incr_addr_reg_scanin),
                 .scan_out(user_incr_addr_reg_scanout),
                 .din      ( user_incr_addr_in[8:0]  ),
                 .dout     ( user_incr_addr[8:0] ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_incr_addr_in[8:0]   =    user_incr_addr[8:0];

// Defining User array_sel.

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_3 user_array_sel_reg    (
                 .scan_in(user_array_sel_reg_scanin),
                 .scan_out(user_array_sel_reg_scanout),
                 .din      ( user_array_sel_in[2:0]  ),
                 .dout     ( user_array_sel[2:0] ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_array_sel_in[2:0]   =    user_array_sel[2:0];

// Defining User cmpsel.

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_2 user_cmpsel_reg    (
                 .scan_in(user_cmpsel_reg_scanin),
                 .scan_out(user_cmpsel_reg_scanout),
                 .din      ( user_cmpsel_in[1:0]  ),
                 .dout     ( user_cmpsel[1:0] ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_cmpsel_in[1:0]      =    user_cmpsel[1:0];

// Defining user_bisi write and read registers

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 user_bisi_wr_reg    (
                 .scan_in(user_bisi_wr_reg_scanin),
                 .scan_out(user_bisi_wr_reg_scanout),
                 .din      ( user_bisi_wr_mode_in  ),
                 .dout     ( user_bisi_wr_mode ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign user_bisi_wr_mode_in     =    user_bisi_wr_mode;

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 user_bisi_rd_reg    (
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

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 start_transition_reg    (
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

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 run_reg    (
               .scan_in(run_reg_scanin),
               .scan_out(run_reg_scanout),
               .din      ( run ),
               .dout     ( dmu_mb0_run ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//Adding 2 extra pipeline stages to run to delay the start of mbist for 3 cycles.
  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 run1_reg    (
               .scan_in(run1_reg_scanin),
               .scan_out(run1_reg_scanout),
               .din      ( run1_in ),
               .dout     ( run1_out ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign run1_in = reset_engine        ?   1'b0:      dmu_mb0_run;

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 run2_reg    (
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

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_9 addr_reg    (
               .scan_in(addr_reg_scanin),
               .scan_out(addr_reg_scanout),
               .din      ( mbist_address[8:0]       ),
               .dout     ( dmu_mb0_addr[8:0]      ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_8 wdata_reg    (
               .scan_in(wdata_reg_scanin),
               .scan_out(wdata_reg_scanout),
               .din      ( mbist_wdata[7:0]       ),
               .dout     ( dmu_mb0_wdata[7:0]      ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_12 wr_rd_en_reg    (
               .scan_in(wr_rd_en_reg_scanin),
               .scan_out(wr_rd_en_reg_scanout),
               .din      ( {diu_wr_en, diu_rd_en, tdb_wr_en, tdb_rd_en, dma_data_wr_en, dma_data_rd_en, pio_data_wr_en, pio_data_rd_en, dev_wr_en, dev_rd_en, tsb_wr_en, tsb_rd_en }       ),
               .dout     ( {dmu_mb0_diu_wr_en, dmu_mb0_diu_rd_en, dmu_mb0_tdb_wr_en, dmu_mb0_tdb_rd_en, dmu_mb0_dou_dma_data_wr_en, dmu_mb0_dou_dma_data_rd_en, dmu_mb0_dou_pio_data_wr_en, dmu_mb0_dou_pio_data_rd_en, dmu_mb0_dev_wr_en, dmu_mb0_dev_rd_en, dmu_mb0_tsb_wr_en, dmu_mb0_tsb_rd_en }  ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 done_reg   (
               .scan_in(done_reg_scanin),
               .scan_out(done_reg_scanout),
               .din      ( mbist_done  ),
               .dout     ( dmu_mb0_done ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 mbist_fail_reg   (
               .scan_in(mbist_fail_reg_scanin),
               .scan_out(mbist_fail_reg_scanout),
               .din      ( fail  ),
               .dout     ( dmu_mb0_fail ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////////////////////////////////////
// Creating 40 bit resultant read_data by muxing the memories outputs
////////////////////////////////////////////////////////////////////////////////

reg [39:0] res_read_data;

always @ (diu_sel_piped2 or tdb_sel_piped2 or dma_data_sel_piped2 or pio_data_sel_piped2 or dev_sel_piped2 or tsb_sel_piped2 or cmpsel_piped2[1:0] or dmu_diu_read_data or dmu_tdb_read_data or dmu_dou_dma_read_data or dmu_dou_pio_read_data or dev_tsb_read_data) begin 
    case({diu_sel_piped2,tdb_sel_piped2,dma_data_sel_piped2,pio_data_sel_piped2,dev_sel_piped2,tsb_sel_piped2,cmpsel_piped2[1:0]}) //synopsys parallel_case full_case 

    8'b10000000  : res_read_data[39:0] = dmu_diu_read_data[39:0];
    8'b10000001  : res_read_data[39:0] = dmu_diu_read_data[79:40];
    8'b10000010  : res_read_data[39:0] = dmu_diu_read_data[119:80];
    8'b10000011  : res_read_data[39:0] = {11'b0,dmu_diu_read_data[148:120]};
    8'b01000010  : res_read_data[39:0] = dmu_tdb_read_data[39:0];
    8'b01000011  : res_read_data[39:0] = {20'b0,dmu_tdb_read_data[59:40]};
    8'b00100000  : res_read_data[39:0] = dmu_dou_dma_read_data[39:0];
    8'b00100001  : res_read_data[39:0] = dmu_dou_dma_read_data[79:40];
    8'b00100010  : res_read_data[39:0] = dmu_dou_dma_read_data[119:80];
    8'b00100011  : res_read_data[39:0] = {28'b0,dmu_dou_dma_read_data[131:120]};
    8'b00010000  : res_read_data[39:0] = dmu_dou_pio_read_data[39:0];
    8'b00010001  : res_read_data[39:0] = dmu_dou_pio_read_data[79:40];
    8'b00010010  : res_read_data[39:0] = dmu_dou_pio_read_data[119:80];
    8'b00010011  : res_read_data[39:0] = {28'b0,dmu_dou_pio_read_data[131:120]};
    8'b00001010  : res_read_data[39:0] = dev_tsb_read_data[39:0]; //dev
    8'b00001011  : res_read_data[39:0] = {16'b0,dev_tsb_read_data[63:40]};
    8'b00000110  : res_read_data[39:0] = dev_tsb_read_data[39:0]; //tsb
    8'b00000111  : res_read_data[39:0] = {16'b0,dev_tsb_read_data[63:40]};
    default      : res_read_data[39:0] = dmu_diu_read_data[39:0];
    endcase
 end   

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_40 res_read_data_reg    (
                 .scan_in(res_read_data_reg_scanin),
                 .scan_out(res_read_data_reg_scanout),
                 .din      ( res_read_data[39:0]       ),
                 .dout     ( res_read_data_piped[39:0]      ),
  .reset(reset),
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

   dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_26 control_reg    (
                      .scan_in(control_reg_scanin),
                      .scan_out(control_reg_scanout),
                      .din   ( control_in[25:0]           ),
                      .dout  ( control_out[25:0]          ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign   msb                       =     control_out[25];
  assign   bisi_wr_rd       = (bisi & ~user_mode) | mbist_user_bisi_wr_rd_mode ? control_out[24] : 1'b1;
  assign   array_sel[2:0]            =     user_mode           ?  user_array_sel[2:0] : control_out[23:21];
  assign   cmpsel[1:0]               =  mbist_user_cmpsel_hold ?  user_cmpsel         : 
                               (tdb_sel || dev_sel || tsb_sel) ?  {1'b1, control_out[19]}: 
                                                                   control_out[20:19];
  assign   data_control[1:0]         =     control_out[18:17];
  assign   address_mix         = (bisi | mbist_user_addr_mode) ?  1'b0: control_out[16];
  assign   march_element[3:0]        =     control_out[15:12];
  assign   array_address[8:0]        =     upaddress_march     ?   control_out[11:3] : ~control_out[11:3];

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

// start_transition_piped was added to have the correct start_addr at the start
// of mbist during user_addr_mode
  assign   control_in[11:3]  = start_transition_piped || reset_engine ?  start_addr[8:0]:
                                     ~run_piped3 || ~increment_addr   ?  control_out[11:3]:
                                                                   next_array_address[8:0];

  assign   next_array_address[8:0]   =    next_upaddr_march      ?  start_addr[8:0]:
                                          next_downaddr_march    ?  ~stop_addr[8:0]:
                                                                    (overflow_addr[8:0]);     // array_addr + incr_addr
                                                                    
  assign   start_addr[8:0]           =    mbist_user_addr_mode   ?   user_start_addr[8:0]: 9'h000;
  assign   stop_addr[8:0]            =    mbist_user_addr_mode   ?   user_stop_addr[8:0] : 
                                          diu_sel                ?   9'h08F              : 
                                          dma_data_sel           ?   9'h07F              :
                                          pio_data_sel || dev_sel?   9'h00F              :
                                          tsb_sel                ?   9'h01F              : 9'h1FF;
  assign   incr_addr[8:0]            =    mbist_user_addr_mode   ?   user_incr_addr[8:0] : 9'h001;

  assign   overflow_addr[9:0]        =    {1'b0,control_out[11:3]} + {1'b0,incr_addr[8:0]};
  assign   overflow                  =    compare_addr[9:0] < overflow_addr[9:0];

  assign   compare_addr[9:0]         =    upaddress_march       ?  {1'b0, stop_addr[8:0]} :
                                                                   {1'b0, ~start_addr[8:0]}; 


  assign   next_upaddr_march         =   ( (march_element[3:0] == 4'h0) || (march_element[3:0] == 4'h1) || 
                                           (march_element[3:0] == 4'h6) || (march_element[3:0] == 4'h5) || 
                                           (march_element[3:0] == 4'h8) ) && overflow; 
   
  assign   next_downaddr_march       =   ( (march_element[3:0] == 4'h2) || (march_element[3:0] == 4'h7) ||
                                           (march_element[3:0] == 4'h3) || (march_element[3:0] == 4'h4) ) && 
                                            overflow; 
   

   
  assign   add[8:0]                  =     five_cycle_march && ( (read_write_control[2:0] == 3'h1) || 
                                                                 (read_write_control[2:0] == 3'h3)) ?   
                                                                 adj_address[8:0]:    array_address[8:0];

// Addresses (MSB:LSB)
// diu:       6R, 2B
// tdb:       2B, 5R, 2C
// dma_data:  2B, 5R
// pio_data:  4R
// dev:       1B, 3R
// tsb:       1B, 4R
  
  assign   adj_address[8:0]          =  address_mix & (tdb_sel || diu_sel)  ?  {array_address[8:1], ~array_address[0]} :
                                        tdb_sel || diu_sel ? { array_address[8:3], ~array_address[2], array_address[1:0]} : //2 bit col addr
                                        { array_address[8:3], ~array_address[2], array_address[1:0] };  // For all other memories, addresses are bank or row!!

  assign   mbist_address[8:0]        =     address_mix & tdb_sel  ?  {add[8:7], add[4:0], add[6:5]}:  // Fast row, then column, then bank
                                           address_mix & diu_sel  ?  {add[8], add[7:4], add[1:0], add[3:2]}:  // Fast 4 row, then bank, next set of rows--- This is easiest way not to get into the address hole problem.
                                       address_mix & dma_data_sel ?  {add[8:7], add[1:0], add[6:2]}:  // Fast bank
                                       address_mix & pio_data_sel ?  {add[8:4], add[0], add[3:1]}:  // Random
                                            address_mix & dev_sel ?  {add[8:4], add[0], add[3:1]}:  // Fast bank
                                            address_mix & tsb_sel ?  {add[8:5], add[0], add[4:1]}:  // Fast bank
                                                                      add[8:0]; 

// Definition of the rest of the control register  

 assign   increment_march_elem      =     increment_addr && overflow;

 assign   control_in[25:12]         =     reset_engine        ?   14'b0:
                                         ~run_piped3          ?   control_out[25:12]:
                                           {msb, bisi_wr_rd, next_array_sel[2:0], next_cmpsel[1:0], next_data_control[1:0], next_address_mix, next_march_element[3:0]} + 
                                           {13'b0, increment_march_elem};                        


  assign   next_array_sel[2:0]       =     user_mode           ?   3'b111:  
             bisi & (array_sel[2:0] == 3'b101) & 
         (cmpsel[1:0] == 2'b11) & (array_address == stop_addr) ?   3'b111:
   (array_sel[2:0] == 3'b101) & (cmpsel[1:0] == 2'b11) & (data_control[1:0] == 2'b11) & 
   (next_address_mix == 1'b1) & (march_element[3:0] == 4'b1000) &
   (array_address == 9'b0) & (read_write_control[2:0] == 3'h4) ?   3'b111:  control_out[23:21]; 
  
  assign   next_cmpsel[1:0]          =     mbist_user_cmpsel_hold || ~bisi_wr_rd || mbist_user_bisi_wr_mode  ?   2'b11:  
                                          (tdb_sel || dev_sel || tsb_sel)    ?   {1'b1, control_out[19]}:
                                                                                 control_out[20:19]; 

  assign   next_data_control[1:0]    =     (bisi || (mbist_user_data_mode && (data_control[1:0] == 2'b00)))  ?   2'b11:
                                                                                                                 data_control[1:0];

  assign   next_address_mix          =     bisi | mbist_user_addr_mode ?  1'b1 : address_mix;

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

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_3 done_counter_reg    (
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
                 msb & ~mbist_done & config_out[1] ?   done_counter_out[2:0] + 3'b001:
                                                       done_counter_out[2:0];


/////////////////////////////////////////////////////////////////////////
// Creating the select and enable lines.
/////////////////////////////////////////////////////////////////////////

  assign   diu_sel                   =    ~array_sel[2] & ~array_sel[1] & ~array_sel[0];
  assign   tdb_sel                   =    ~array_sel[2] & ~array_sel[1] &  array_sel[0];

  assign   dma_data_sel              =    ~array_sel[2] &  array_sel[1] & ~array_sel[0];
  assign   pio_data_sel              =    ~array_sel[2] &  array_sel[1] &  array_sel[0];

  assign   dev_sel                   =     array_sel[2] & ~array_sel[1] & ~array_sel[0];
  assign   tsb_sel                   =     array_sel[2] & ~array_sel[1] &  array_sel[0];

  assign   diu_rd_en                 =     diu_sel && array_read;
  assign   diu_wr_en                 =     diu_sel &&  array_write;

  assign   tdb_rd_en                 =     tdb_sel && array_read;
  assign   tdb_wr_en                 =     tdb_sel &&  array_write;

  assign   dma_data_rd_en            =     dma_data_sel && array_read;
  assign   dma_data_wr_en            =     dma_data_sel &&  array_write;

  assign   pio_data_rd_en            =     pio_data_sel && array_read;
  assign   pio_data_wr_en            =     pio_data_sel &&  array_write;

  assign   dev_rd_en                 =     dev_sel && array_read;
  assign   dev_wr_en                 =     dev_sel &&  array_write;

  assign   tsb_rd_en                 =     tsb_sel && array_read;
  assign   tsb_wr_en                 =     tsb_sel &&  array_write;


// /////////////////////////////////////////////////////////////////////////////
// Pipeline for Address, wdata, and Read_en
// /////////////////////////////////////////////////////////////////////////////

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_8  data_pipe_reg1   (
               .scan_in(data_pipe_reg1_scanin),
               .scan_out(data_pipe_reg1_scanout),
               .din        ( data_pipe_reg1_in[7:0]  ),
               .dout       ( data_pipe_out1[7:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_8  data_pipe_reg2   (
               .scan_in(data_pipe_reg2_scanin),
               .scan_out(data_pipe_reg2_scanout),
               .din        ( data_pipe_reg2_in[7:0]  ),
               .dout       ( data_pipe_out2[7:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//Adding an extra level of pipe since piping the read_data
//  msff_ctl_macro  data_pipe_reg3 (width=8, library=a1)(
//               .scan_in(data_pipe_reg3_scanin),
//               .scan_out(data_pipe_reg3_scanout),
//               .din        ( date_pipe_reg3_in[7:0]  ),
//               .dout       ( data_pipe_out3[7:0]     ));

  assign data_pipe_reg1_in[7:0]   =  reset_engine    ?    8'h00:      dmu_mb0_wdata[7:0];
  assign data_pipe_reg2_in[7:0]   =  reset_engine    ?    8'h00:      data_pipe_out1[7:0];
//  assign date_pipe_reg3_in[7:0]   =  reset_engine    ?    8'h00:      data_pipe_out2[7:0];

  assign dmu_mb0_piped_data[7:0]  =  data_pipe_out2[7:0];

// Creating pipelined array_sel's

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_3 array_sel_pipe_reg1   (
               .scan_in(array_sel_pipe_reg1_scanin),
               .scan_out(array_sel_pipe_reg1_scanout),
               .din        ( array_sel_pipe_reg1_in[2:0]  ),
               .dout       ( array_sel_piped[2:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_3 array_sel_pipe_reg2   (
               .scan_in(array_sel_pipe_reg2_scanin),
               .scan_out(array_sel_pipe_reg2_scanout),
               .din        ( array_sel_pipe_reg2_in[2:0]  ),
               .dout       ( array_sel_piped2[2:0]    ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign array_sel_pipe_reg1_in[2:0]  =  reset_engine    ?    3'b0:   array_sel[2:0]; 
  assign array_sel_pipe_reg2_in[2:0]  =  reset_engine    ?    3'b0:   array_sel_piped[2:0];

  assign   diu_sel_piped2             =  ~array_sel_piped2[2] & ~array_sel_piped2[1] & ~array_sel_piped2[0];
  assign   tdb_sel_piped2             =  ~array_sel_piped2[2] & ~array_sel_piped2[1] &  array_sel_piped2[0];

  assign   dma_data_sel_piped2        =  ~array_sel_piped2[2] &  array_sel_piped2[1] & ~array_sel_piped2[0];
  assign   pio_data_sel_piped2        =  ~array_sel_piped2[2] &  array_sel_piped2[1] &  array_sel_piped2[0];

  assign   dev_sel_piped2             =   array_sel_piped2[2] & ~array_sel_piped2[1] & ~array_sel_piped2[0];
  assign   tsb_sel_piped2             =   array_sel_piped2[2] & ~array_sel_piped2[1] &  array_sel_piped2[0];


// Creating pipelined array rd_en's

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 diu_ren_pipe_reg1   (
               .scan_in(diu_ren_pipe_reg1_scanin),
               .scan_out(diu_ren_pipe_reg1_scanout),
               .din        ( diu_ren_pipe_reg1_in  ),
               .dout       ( diu_rd_en_piped     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 diu_ren_pipe_reg2   (
               .scan_in(diu_ren_pipe_reg2_scanin),
               .scan_out(diu_ren_pipe_reg2_scanout),
               .din        ( diu_ren_pipe_reg2_in  ),
               .dout       ( diu_rd_en_piped2    ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign diu_ren_pipe_reg1_in  =  reset_engine    ?    1'b0:   dmu_mb0_diu_rd_en; 
  assign diu_ren_pipe_reg2_in  =  reset_engine    ?    1'b0:   diu_rd_en_piped;

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 tdb_ren_pipe_reg1   (
               .scan_in(tdb_ren_pipe_reg1_scanin),
               .scan_out(tdb_ren_pipe_reg1_scanout),
               .din        ( tdb_ren_pipe_reg1_in  ),
               .dout       ( tdb_rd_en_piped     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 tdb_ren_pipe_reg2   (
               .scan_in(tdb_ren_pipe_reg2_scanin),
               .scan_out(tdb_ren_pipe_reg2_scanout),
               .din        ( tdb_ren_pipe_reg2_in  ),
               .dout       ( tdb_rd_en_piped2    ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign tdb_ren_pipe_reg1_in  =  reset_engine    ?    1'b0:   dmu_mb0_tdb_rd_en; 
  assign tdb_ren_pipe_reg2_in  =  reset_engine    ?    1'b0:   tdb_rd_en_piped;

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 dma_data_ren_pipe_reg1   (
               .scan_in(dma_data_ren_pipe_reg1_scanin),
               .scan_out(dma_data_ren_pipe_reg1_scanout),
               .din        ( dma_data_ren_pipe_reg1_in  ),
               .dout       ( dma_data_rd_en_piped     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 dma_data_ren_pipe_reg2   (
               .scan_in(dma_data_ren_pipe_reg2_scanin),
               .scan_out(dma_data_ren_pipe_reg2_scanout),
               .din        ( dma_data_ren_pipe_reg2_in  ),
               .dout       ( dma_data_rd_en_piped2    ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign dma_data_ren_pipe_reg1_in  =  reset_engine    ?    1'b0:   dmu_mb0_dou_dma_data_rd_en; 
  assign dma_data_ren_pipe_reg2_in  =  reset_engine    ?    1'b0:   dma_data_rd_en_piped;


  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 pio_data_ren_pipe_reg1   (
               .scan_in(pio_data_ren_pipe_reg1_scanin),
               .scan_out(pio_data_ren_pipe_reg1_scanout),
               .din        ( pio_data_ren_pipe_reg1_in  ),
               .dout       ( pio_data_rd_en_piped     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 pio_data_ren_pipe_reg2   (
               .scan_in(pio_data_ren_pipe_reg2_scanin),
               .scan_out(pio_data_ren_pipe_reg2_scanout),
               .din        ( pio_data_ren_pipe_reg2_in  ),
               .dout       ( pio_data_rd_en_piped2    ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign pio_data_ren_pipe_reg1_in  =  reset_engine    ?    1'b0:   dmu_mb0_dou_pio_data_rd_en; 
  assign pio_data_ren_pipe_reg2_in  =  reset_engine    ?    1'b0:   pio_data_rd_en_piped;


  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 dev_ren_pipe_reg1   (
               .scan_in(dev_ren_pipe_reg1_scanin),
               .scan_out(dev_ren_pipe_reg1_scanout),
               .din        ( dev_ren_pipe_reg1_in  ),
               .dout       ( dev_rd_en_piped     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 dev_ren_pipe_reg2   (
               .scan_in(dev_ren_pipe_reg2_scanin),
               .scan_out(dev_ren_pipe_reg2_scanout),
               .din        ( dev_ren_pipe_reg2_in  ),
               .dout       ( dev_rd_en_piped2    ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign dev_ren_pipe_reg1_in  =  reset_engine    ?    1'b0:   dmu_mb0_dev_rd_en; 
  assign dev_ren_pipe_reg2_in  =  reset_engine    ?    1'b0:   dev_rd_en_piped;


  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 tsb_ren_pipe_reg1   (
               .scan_in(tsb_ren_pipe_reg1_scanin),
               .scan_out(tsb_ren_pipe_reg1_scanout),
               .din        ( tsb_ren_pipe_reg1_in  ),
               .dout       ( tsb_rd_en_piped     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 tsb_ren_pipe_reg2   (
               .scan_in(tsb_ren_pipe_reg2_scanin),
               .scan_out(tsb_ren_pipe_reg2_scanout),
               .din        ( tsb_ren_pipe_reg2_in  ),
               .dout       ( tsb_rd_en_piped2    ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign tsb_ren_pipe_reg1_in  =  reset_engine    ?    1'b0:   dmu_mb0_tsb_rd_en; 
  assign tsb_ren_pipe_reg2_in  =  reset_engine    ?    1'b0:   tsb_rd_en_piped;

// Pipelining cmpsel

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_2  cmpsel_pipe_reg1   (
               .scan_in(cmpsel_pipe_reg1_scanin),
               .scan_out(cmpsel_pipe_reg1_scanout),
               .din        ( cmpsel_pipe_reg1_in[1:0]  ),
               .dout       ( cmpsel_pipe_out1[1:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_2  cmpsel_pipe_reg2   (
               .scan_in(cmpsel_pipe_reg2_scanin),
               .scan_out(cmpsel_pipe_reg2_scanout),
               .din        ( cmpsel_pipe_reg2_in[1:0]  ),
               .dout       ( cmpsel_pipe_out2[1:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_2  cmpsel_pipe_reg3   (
               .scan_in(cmpsel_pipe_reg3_scanin),
               .scan_out(cmpsel_pipe_reg3_scanout),
               .din        ( cmpsel_pipe_reg3_in[1:0]  ),
               .dout       ( cmpsel_pipe_out3[1:0]     ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

  assign cmpsel_pipe_reg1_in[1:0]   =  reset_engine    ?    2'b0:     cmpsel[1:0];
  assign cmpsel_pipe_reg2_in[1:0]   =  reset_engine    ?    2'b0:     cmpsel_pipe_out1[1:0];
  assign cmpsel_pipe_reg3_in[1:0]   =  reset_engine    ?    2'b0:     cmpsel_pipe_out2[1:0];
  assign cmpsel_piped2[1:0]         =  cmpsel_pipe_out2[1:0];
  assign cmpsel_piped3[1:0]         =  cmpsel_pipe_out3[1:0];



// /////////////////////////////////////////////////////////////////////////////
// Shared Fail Detection
// /////////////////////////////////////////////////////////////////////////////
// 05/10/05: Updated to meet these new features:
// 1.When mbist_done signal is asserted when it completes all the
//   tests, it also need to assert static membist fail signal if
//   there were any failures during the tests.
// 2.The mbist_fail signal won't be sticky bit from membist   
//   engine.  The TCU will make it sticky fail bit as needed.


  dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_6 fail_reg    (
                   .scan_in(fail_reg_scanin),
                   .scan_out(fail_reg_scanout),
                   .din      ( fail_reg_in[5:0]   ),
                   .dout     ( fail_reg_out[5:0]  ),
  .reset(reset),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


  assign    fail_reg_in[5:0]      =    reset_engine      ?    6'b0: {qual_tsb_fail,qual_dev_fail,qual_pio_data_fail,qual_dma_data_fail,qual_tdb_fail,qual_diu_fail}  |  fail_reg_out[5:0];


  assign    qual_diu_fail      =  fail_detect && diu_rd_en_piped2;
  assign    qual_tdb_fail      =  fail_detect && tdb_rd_en_piped2;
  assign    qual_dma_data_fail =  fail_detect && dma_data_rd_en_piped2;
  assign    qual_pio_data_fail =  fail_detect && pio_data_rd_en_piped2;
  assign    qual_dev_fail      =  fail_detect && dev_rd_en_piped2;
  assign    qual_tsb_fail      =  fail_detect && tsb_rd_en_piped2;

  assign    fail               =  mbist_done ?  |fail_reg_out[5:0]:
                                  qual_diu_fail | qual_tdb_fail | qual_dma_data_fail |
                                  qual_pio_data_fail | qual_dev_fail | qual_tsb_fail;


  assign    fail_detect        =  (diu_rd_en_piped2 && (cmpsel_piped3[1:0] == 2'b11)) ? 
                                       ({dmu_mb0_piped_data[4:0], {3{dmu_mb0_piped_data[7:0]}} } != res_read_data_piped[28:0]):
                                  (tdb_rd_en_piped2 && (cmpsel_piped3[1:0] == 2'b11)) ?
                                       ({dmu_mb0_piped_data[3:0], {2{dmu_mb0_piped_data[7:0]}} } != res_read_data_piped[19:0]):
                                  ((dma_data_rd_en_piped2 || pio_data_rd_en_piped2)  && (cmpsel_piped3[1:0] == 2'b11)) ?
                                       ({dmu_mb0_piped_data[3:0], dmu_mb0_piped_data[7:0] } != res_read_data_piped[11:0]):
                                  ((dev_rd_en_piped2 || tsb_rd_en_piped2)  && (cmpsel_piped3[1:0] == 2'b11)) ?
                                       ({3{dmu_mb0_piped_data[7:0]} } != res_read_data_piped[23:0]):
                                       ({5{dmu_mb0_piped_data[7:0]} }  !=  res_read_data_piped[39:0]) ;


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
assign run1_reg_scanin           = run_reg_scanout          ;
assign run2_reg_scanin           = run1_reg_scanout         ;
assign addr_reg_scanin           = run2_reg_scanout         ;
assign wdata_reg_scanin          = addr_reg_scanout         ;
assign wr_rd_en_reg_scanin       = wdata_reg_scanout        ;
assign done_reg_scanin           = wr_rd_en_reg_scanout     ;
assign mbist_fail_reg_scanin     = done_reg_scanout         ;
assign res_read_data_reg_scanin  = mbist_fail_reg_scanout   ;
assign control_reg_scanin        = res_read_data_reg_scanout;
assign done_counter_reg_scanin   = control_reg_scanout      ;
assign data_pipe_reg1_scanin     = done_counter_reg_scanout ;
assign data_pipe_reg2_scanin     = data_pipe_reg1_scanout   ;
assign array_sel_pipe_reg1_scanin = data_pipe_reg2_scanout   ;
assign array_sel_pipe_reg2_scanin = array_sel_pipe_reg1_scanout;
assign diu_ren_pipe_reg1_scanin  = array_sel_pipe_reg2_scanout;
assign diu_ren_pipe_reg2_scanin  = diu_ren_pipe_reg1_scanout;
assign tdb_ren_pipe_reg1_scanin  = diu_ren_pipe_reg2_scanout;
assign tdb_ren_pipe_reg2_scanin  = tdb_ren_pipe_reg1_scanout;
assign dma_data_ren_pipe_reg1_scanin = tdb_ren_pipe_reg2_scanout;
assign dma_data_ren_pipe_reg2_scanin = dma_data_ren_pipe_reg1_scanout;
assign pio_data_ren_pipe_reg1_scanin = dma_data_ren_pipe_reg2_scanout;
assign pio_data_ren_pipe_reg2_scanin = pio_data_ren_pipe_reg1_scanout;
assign dev_ren_pipe_reg1_scanin  = pio_data_ren_pipe_reg2_scanout;
assign dev_ren_pipe_reg2_scanin  = dev_ren_pipe_reg1_scanout;
assign tsb_ren_pipe_reg1_scanin  = dev_ren_pipe_reg2_scanout;
assign tsb_ren_pipe_reg2_scanin  = tsb_ren_pipe_reg1_scanout;
assign cmpsel_pipe_reg1_scanin   = tsb_ren_pipe_reg2_scanout;
assign cmpsel_pipe_reg2_scanin   = cmpsel_pipe_reg1_scanout ;
assign cmpsel_pipe_reg3_scanin   = cmpsel_pipe_reg2_scanout ;
assign fail_reg_scanin           = cmpsel_pipe_reg3_scanout ;
assign scan_out                  = fail_reg_scanout         ;
// fixscan end:
endmodule 






// any PARAMS parms go into naming of macro

module dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_9 (
  din, 
  reset, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;
wire [8:1] sout;

  input [8:0] din;
  input reset;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [8:0] dout;
  output scan_out;
assign fdin[8:0] = din[8:0] & {9 {reset}};









    







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
.si(scan_in),
.so(sout[8]),
.reset(reset),
.q(dout[8])
);




endmodule













// any PARAMS parms go into naming of macro

module dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_8 (
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

module dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_3 (
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

module dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_2 (
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













// any PARAMS parms go into naming of macro

module dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_1 (
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

module dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_12 (
  din, 
  reset, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [11:0] fdin;
wire [11:1] sout;

  input [11:0] din;
  input reset;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [11:0] dout;
  output scan_out;
assign fdin[11:0] = din[11:0] & {12 {reset}};









    







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
.si(scan_in),
.so(sout[11]),
.reset(reset),
.q(dout[11])
);




endmodule













// any PARAMS parms go into naming of macro

module dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_40 (
  din, 
  reset, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [39:0] fdin;
wire [39:1] sout;

  input [39:0] din;
  input reset;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [39:0] dout;
  output scan_out;
assign fdin[39:0] = din[39:0] & {40 {reset}};









    







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
.si(scan_in),
.so(sout[39]),
.reset(reset),
.q(dout[39])
);




endmodule













// any PARAMS parms go into naming of macro

module dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_26 (
  din, 
  reset, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [25:0] fdin;
wire [25:1] sout;

  input [25:0] din;
  input reset;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [25:0] dout;
  output scan_out;
assign fdin[25:0] = din[25:0] & {26 {reset}};









    







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
.si(scan_in),
.so(sout[25]),
.reset(reset),
.q(dout[25])
);




endmodule













// any PARAMS parms go into naming of macro

module dmu_mb0_msff_ctl_macro__library_a1__reset_1__width_6 (
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








