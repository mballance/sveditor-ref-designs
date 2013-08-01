// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: spc_mb2_ctl.v
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
module spc_mb2_ctl (
  scan_out, 
  mb2_done, 
  mb2_run, 
  mb2_addr, 
  mb2_frf_read_en, 
  mb2_frf_write_en, 
  mb2_arf_read_en, 
  mb2_arf_write_en, 
  mb2_irf_read_en, 
  mb2_irf_write_en, 
  mb2_irf_save_en, 
  mb2_irf_restore_en, 
  mb2_mam_read_en, 
  mb2_mam_write_en, 
  mb2_rrf_read_en, 
  mb2_rrf_write_en, 
  mb2_write_data, 
  mb2_write_data_p1, 
  mb2_write_data_p2, 
  mb2_misc_pmen, 
  mb2_mbist_fail, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  lsu_misc_pmen, 
  mbist_start, 
  mbist_user_mode, 
  mbist_bisi_mode, 
  spu_mbi_mam_fail_, 
  spu_mbi_mam_fail2_, 
  spu_mbi_arf_fail_, 
  spu_mbi_rrf_fail_, 
  exu0_mbi_irf_fail_, 
  exu1_mbi_irf_fail_, 
  fgu_mbi_frf_fail);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire pmen_scanin;
wire pmen_scanout;
wire start_in;
wire misc_pmen_;
wire pmem_unused;
wire clock_enable;
wire l1clk_pm1;
wire input_signals_reg_scanin;
wire input_signals_reg_scanout;
wire bisi_mode;
wire user_mode;
wire mb_enable_reg_scanin;
wire mb_enable_reg_scanout;
wire mb_enable;
wire mb_enable_out;
wire start;
wire config_reg_scanin;
wire config_reg_scanout;
wire [1:0] config_in;
wire [1:0] config_out;
wire start_transition;
wire end_transition;
wire reset_engine;
wire loop_again;
wire run;
wire loop_again_reg_scanin;
wire loop_again_reg_scanout;
wire stop_engine_l;
wire stop_engine_l_q;
wire mb_user_loop_mode;
wire array_usr_reg_scanin;
wire array_usr_reg_scanout;
wire [3:0] user_array_in;
wire [3:0] user_array;
wire user_addr_mode_reg_scanin;
wire user_addr_mode_reg_scanout;
wire user_addr_mode_in;
wire user_addr_mode;
wire user_start_addr_reg_scanin;
wire user_start_addr_reg_scanout;
wire [9:0] user_start_addr_in;
wire [9:0] user_start_addr;
wire user_stop_addr_reg_scanin;
wire user_stop_addr_reg_scanout;
wire [9:0] user_stop_addr_in;
wire [9:0] user_stop_addr;
wire user_incr_addr_reg_scanin;
wire user_incr_addr_reg_scanout;
wire [9:0] user_incr_addr_in;
wire [9:0] user_incr_addr;
wire user_data_mode_reg_scanin;
wire user_data_mode_reg_scanout;
wire user_data_mode_in;
wire user_data_mode;
wire user_data_reg_scanin;
wire user_data_reg_scanout;
wire [7:0] user_data_in;
wire [7:0] user_data;
wire user_cmpselinc_hold_reg_scanin;
wire user_cmpselinc_hold_reg_scanout;
wire user_cmpselinc_hold_in;
wire user_cmpselinc_hold;
wire user_cmpsel_reg_scanin;
wire user_cmpsel_reg_scanout;
wire [2:0] user_cmpsel_in;
wire [2:0] user_cmpsel;
wire user_loop_mode_reg_scanin;
wire user_loop_mode_reg_scanout;
wire user_loop_mode_in;
wire user_loop_mode;
wire ten_n_mode_reg_scanin;
wire ten_n_mode_reg_scanout;
wire ten_n_mode_in;
wire ten_n_mode;
wire user_bisi_wr_mode_reg_scanin;
wire user_bisi_wr_mode_reg_scanout;
wire user_bisi_wr_mode_in;
wire user_bisi_wr_mode;
wire user_bisi_rd_mode_reg_scanin;
wire user_bisi_rd_mode_reg_scanout;
wire user_bisi_rd_mode_in;
wire user_bisi_rd_mode;
wire mb_user_data_mode;
wire mb_user_addr_mode;
wire mb_ten_n_mode;
wire mb_user_cmpselinc_hold;
wire mb_user_bisi_wr_mode;
wire mb_user_bisi_rd_mode;
wire mb_user_bisi_rw_mode;
wire mb_default_bisi;
wire [9:0] stop_addr;
wire array_0;
wire array_1;
wire array_2;
wire array_3;
wire array_4;
wire array_5;
wire rw_0;
wire [2:0] rw;
wire rw_1;
wire rw_2;
wire rw_3;
wire rw_4;
wire rw_5;
wire rw_6;
wire march_0;
wire [3:0] march_element;
wire march_1;
wire march_2;
wire march_3;
wire march_4;
wire march_5;
wire march_6;
wire march_7;
wire march_8;
wire [9:0] mem_addr;
wire addr_mix;
wire [9:0] up_addr;
wire cntl_msb;
wire [34:0] cntl_out;
wire cntl_bisi;
wire [3:0] cntl_array_sel;
wire last_array;
wire [2:0] cntl_cmp_sel;
wire sel_cmp_pass;
wire cmp_0;
wire cmp_7;
wire [2:0] cmp_sel_cntl_out;
wire cmp_sel_reg_scanin;
wire cmp_sel_reg_scanout;
wire [2:0] cmp_sel;
wire [2:0] cmp_sel_out;
wire [1:0] cntl_data_sel;
wire cntl_addr_mix;
wire [3:0] cntl_march_element;
wire sel_march_1_pass;
wire [15:0] cntl_algr;
wire [15:0] next_algr;
wire cout_addr;
wire [34:0] cntl_in;
wire run3;
wire sel_nextaddr_reset;
wire sel_nextaddr_restart;
wire overflow;
wire sel_nextaddr_incred;
wire cout_rw;
wire sel_nextaddr_same;
wire [9:0] start_addr;
wire [9:0] restart_addr;
wire [9:0] incred_addr;
wire [9:0] cntl_addr;
wire [9:0] incr_addr;
wire upaddr;
wire [2:0] cntl_rw;
wire upaddr_pre;
wire [3:0] march_element_pre;
wire march_pre_0;
wire march_pre_1;
wire march_pre_2;
wire march_pre_6;
wire march_pre_7;
wire sel_rw_pass;
wire [2:0] next_rw;
wire [3:0] array_sel;
wire cntl_reg_scanin;
wire cntl_reg_scanout;
wire one_cycle_march;
wire five_cycle_march;
wire two_cycle_march;
wire bisi_wr_mode;
wire bisi_rd_mode;
wire sel_rw_1_pass;
wire sel_rw_2_pass;
wire sel_rw_5_pass;
wire true_data_l;
wire true_data;
wire [7:0] data_pat_sel;
wire [7:0] mem_data1;
wire [7:0] mem_data;
wire [9:0] adj_addr;
wire mem_wr_pbi;
wire mem_wr;
wire mem_save;
wire mem_restore;
wire mem_rd_pbi;
wire mem_rd;
wire [3:0] array_sel_cntl_out;
wire array_sel_reg_scanin;
wire array_sel_reg_scanout;
wire [3:0] array_sel_out;
wire [3:0] march_element_cntl_out;
wire marche_element_reg_scanin;
wire marche_element_reg_scanout;
wire [3:0] march_element_out;
wire mb_run;
wire [15:0] mb_addr;
wire [7:0] mb_write_data;
wire mb_array_0_rd;
wire mb_array_1_rd;
wire mb_array_2_rd;
wire mb_array_3_rd;
wire mb_array_save;
wire mb_array_5_rd;
wire mb_array_0_wr;
wire mb_array_1_wr;
wire mb_array_2_wr;
wire mb_array_3_wr;
wire mb_array_restore;
wire mb_array_5_wr;
wire spu_arf_fail;
wire mb2_arf_read_en_p2;
wire spu_rrf_fail;
wire mb2_rrf_read_en_p2;
wire spu_mam_fail;
wire mb2_mam_read_en_p2;
wire exu0_irf_fail;
wire mb2_irf_read_en_p4;
wire exu1_irf_fail;
wire arf_fail;
wire run3_transition;
wire spu_arf_fail_sticky;
wire rrf_fail;
wire spu_rrf_fail_sticky;
wire mam_fail;
wire spu_mam_fail_sticky;
wire irf0_fail;
wire exu0_irf_fail_sticky;
wire irf1_fail;
wire exu1_irf_fail_sticky;
wire frf_fail;
wire fgu_frf_fail_sticky;
wire fail_reg_scanin;
wire fail_reg_scanout;
wire mbist_fail_sticky;
wire mbist_fail_array;
wire valid_fail;
wire mb_done;
wire mb_fail;
wire msb_latch_scanin;
wire msb_latch_scanout;
wire msb_in;
wire msb_out;
wire [4:0] done_delay;
wire run3_transition_reg_scanin;
wire run3_transition_reg_scanout;
wire run3_out;
wire done_delay_reg_scanin;
wire done_delay_reg_scanout;
wire [4:0] done_delay_in;
wire out_run_mb_arrays_reg_scanin;
wire out_run_mb_arrays_reg_scanout;
wire mb_run_out;
wire out_data_mb_arrays_reg_scanin;
wire out_data_mb_arrays_reg_scanout;
wire [7:0] mb_write_data_out;
wire out_addr_mb_arrays_reg_scanin;
wire out_addr_mb_arrays_reg_scanout;
wire [15:0] mb_addr_out;
wire out_wr_mb_arrays_reg_scanin;
wire out_wr_mb_arrays_reg_scanout;
wire mb_array_0_wr_out;
wire mb_array_1_wr_out;
wire mb_array_2_wr_out;
wire mb_array_3_wr_out;
wire mb_array_5_wr_out;
wire out_rd_mb_arrays_reg_scanin;
wire out_rd_mb_arrays_reg_scanout;
wire mb_array_0_rd_out;
wire mb_array_1_rd_out;
wire mb_array_2_rd_out;
wire mb_array_3_rd_out;
wire mb_array_5_rd_out;
wire out_mb_tcu_done_reg_scanin;
wire out_mb_tcu_done_reg_scanout;
wire mb_done_out;
wire out_mb_tcu_fail_reg_scanin;
wire out_mb_tcu_fail_reg_scanout;
wire mb_fail_out;
wire spares_scanin;
wire spares_scanout;
wire i_delay_4th_scanin;
wire i_delay_4th_scanout;
wire mb2_irf_read_en_p1;
wire mb2_irf_read_en_p2;
wire mb2_irf_read_en_p3;
wire delayed_cmp_rd_data_reg_scanin;
wire delayed_cmp_rd_data_reg_scanout;
wire mb2_arf_read_en_p1;
wire mb2_mam_read_en_p1;
wire mb2_rrf_read_en_p1;
wire out_save_restore_mb_arrays_reg_scanin;
wire out_save_restore_mb_arrays_reg_scanout;




// /////////////////////////////////////////////////////////////////////////////
// Outputs
// /////////////////////////////////////////////////////////////////////////////

   output		    scan_out;

   output		    mb2_done;

   output		    mb2_run;
   output [15:0]	    mb2_addr;
   output		    mb2_frf_read_en;
   output		    mb2_frf_write_en;
   output		    mb2_arf_read_en;
   output		    mb2_arf_write_en;
   output		    mb2_irf_read_en;
   output		    mb2_irf_write_en;
   output		    mb2_irf_save_en;
   output		    mb2_irf_restore_en;
   output		    mb2_mam_read_en;
   output		    mb2_mam_write_en;
   output		    mb2_rrf_read_en;
   output		    mb2_rrf_write_en;
   output [7:0]		    mb2_write_data;
   output [7:0]		    mb2_write_data_p1;
   output [7:0]		    mb2_write_data_p2;

   output                   mb2_misc_pmen;
   output		    mb2_mbist_fail;

// /////////////////////////////////////////////////////////////////////////////
// Inputs
// /////////////////////////////////////////////////////////////////////////////

   input		    l2clk;
   input		    scan_in;
   input		    tcu_pce_ov;			// scan signals
   input		    tcu_clk_stop;
   input		    tcu_aclk;
   input		    tcu_bclk;
   input            	    tcu_scan_en;
   input                    lsu_misc_pmen;		// Power management enable

   input		    mbist_start;
   input		    mbist_user_mode;
   input		    mbist_bisi_mode;


   input		    spu_mbi_mam_fail_; 		// MBIST comparator output bits 63:0
   input		    spu_mbi_mam_fail2_; 	// MBIST comparator output bits 71:64
   input		    spu_mbi_arf_fail_;		// MBIST comparator
   input		    spu_mbi_rrf_fail_;		// MBIST comparator

   input  [1:0]		    exu0_mbi_irf_fail_;		// MBIST [0] == data[63:0]; [1] == data[71:64]
   input  [1:0]		    exu1_mbi_irf_fail_;		// MBIST [0] == data[63:0]; [1] == data[71:64]
   input     		    fgu_mbi_frf_fail;


   supply0 vss; // <- port for ground
   supply1 vdd; // <- port for power 



// /////////////////////////////////////////////////////////////////////////////
// Scan Renames
// /////////////////////////////////////////////////////////////////////////////

assign pce_ov = tcu_pce_ov;
assign stop   = tcu_clk_stop;
assign siclk  = tcu_aclk;
assign soclk  = tcu_bclk;
assign se     = tcu_scan_en;




////////////////////////////////////////////////////////////////////////////////
// Clock header
////////////////////////////////////////////////////////////////////////////////

spc_mb2_ctll1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk 		),
        .l1en   (1'b1		),
        .l1clk  (l1clk		),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

spc_mb2_ctlmsff_ctl_macro__width_3 pmen  (
	.scan_in(pmen_scanin),
	.scan_out(pmen_scanout),
	.l1clk    ( l1clk					),	// Must be connected to a free running clock
	.din      ({mbist_start, ~lsu_misc_pmen , 1'b0}		),
	.dout     ({start_in   ,  misc_pmen_    , pmem_unused}	),
  .siclk(siclk),
  .soclk(soclk));

assign mb2_misc_pmen	= ~misc_pmen_;					// Sent to MB1 for timing reasons

assign clock_enable	= start_in | mb2_done | mb2_run | mb2_mbist_fail | misc_pmen_;

spc_mb2_ctll1clkhdr_ctl_macro clkgen_pm1 (
        .l2clk  (l2clk 		),
        .l1en   (clock_enable	),
        .l1clk  (l1clk_pm1	),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));


// /////////////////////////////////////////////////////////////////////////////
//
// MBIST Config Register
//
// /////////////////////////////////////////////////////////////////////////////
//
// A low to high transition on mbist_start will reset and start the engine.  
// mbist_start must remain active high for the duration of MBIST.  
// If mbist_start deasserts the engine will stop but not reset.
// Once MBIST has completed mb0_done will assert and the fail status
// signals will be valid.  
// To run MBIST again the mbist_start signal must transition low then high.
//
// Loop on Address will disable the address mix function.
//
// /////////////////////////////////////////////////////////////////////////////

  // flop incoming signals:

  spc_mb2_ctlmsff_ctl_macro__width_2 input_signals_reg  (
               .scan_in(input_signals_reg_scanin),
               .scan_out(input_signals_reg_scanout),
               .l1clk    ( l1clk	                                 ),
               .din      ( {mbist_bisi_mode,mbist_user_mode} ),
               .dout     ( {bisi_mode      ,user_mode}       ),
  .siclk(siclk),
  .soclk(soclk));
  

  // default   : mb_enable=0
  // bisi      : mb_enable=0
  // user_mode : mb_enable=depend on programmed value

  spc_mb2_ctlmsff_ctl_macro__width_1 mb_enable_reg  (
               .scan_in(mb_enable_reg_scanin),
               .scan_out(mb_enable_reg_scanout),
               .l1clk    ( l1clk_pm1           ),
               .din      ( mb_enable           ),
               .dout     ( mb_enable_out       ),
  .siclk(siclk),
  .soclk(soclk));


//assign mb_enable = user_mode ? mb_enable_out : 1'b0;
  assign mb_enable = mb_enable_out;

 
  assign start = user_mode ? (mb_enable_out & start_in) :
                              start_in;



  spc_mb2_ctlmsff_ctl_macro__width_2 config_reg  (
               .scan_in(config_reg_scanin),
               .scan_out(config_reg_scanout),
               .l1clk    ( l1clk_pm1            ),
               .din      ( config_in[1:0]       ),
               .dout     ( config_out[1:0]      ),
  .siclk(siclk),
  .soclk(soclk));

   
  assign config_in[0]        =    start;
  assign config_in[1]        =    config_out[0];
  assign start_transition    =    config_out[0] & ~config_out[1];
  assign end_transition      =   ~config_out[0] &  config_out[1];
  assign reset_engine        =    start_transition | loop_again  | end_transition;
  assign run                 =    config_out[1];


  spc_mb2_ctlmsff_ctl_macro__width_1 loop_again_reg  (
               .scan_in(loop_again_reg_scanin),
               .scan_out(loop_again_reg_scanout),
               .l1clk    ( l1clk_pm1        ),
               .din      ( stop_engine_l    ),
               .dout     ( stop_engine_l_q  ),
  .siclk(siclk),
  .soclk(soclk));

  assign loop_again=mb_user_loop_mode ? stop_engine_l & ~stop_engine_l_q:  1'b0;


   





////////////////////////////////////////////////////////////////////////////////
// user control registers
//                         size
// -  user_array           4
// -  user_addr_mode        1
// -  user_start_addr      10
// -  user_stop_addr       10
// -  user_inc_addr        10
// -  user_data_mode        1
// -  user_data             8
// -  user_cmpselinc_mode   1
// -  user_cmpselinc        3
// -  user_loop_mode        1
// -  user_cam_select       2
// -  user_cam_test_sel     4
////////////////////////////////////////////////////////////////////////////////


   spc_mb2_ctlmsff_ctl_macro__width_4 array_usr_reg  (
                  .scan_in(array_usr_reg_scanin),
                  .scan_out(array_usr_reg_scanout),
                  .l1clk    ( l1clk_pm1            ),
  	          .din      ( user_array_in[3:0]   ),
  		  .dout     ( user_array[3:0]      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_array_in[3:0]=user_array[3:0];


   // user address mode

   spc_mb2_ctlmsff_ctl_macro__width_1 user_addr_mode_reg  (
                  .scan_in(user_addr_mode_reg_scanin),
                  .scan_out(user_addr_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1             ),
  	          .din      ( user_addr_mode_in     ),
  		  .dout     ( user_addr_mode        ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_addr_mode_in=user_addr_mode;
   

   //  user start address
   
  spc_mb2_ctlmsff_ctl_macro__width_10 user_start_addr_reg  (
                 .scan_in(user_start_addr_reg_scanin),
                 .scan_out(user_start_addr_reg_scanout),
                 .l1clk    ( l1clk_pm1                 ),
                 .din      ( user_start_addr_in[9:0]   ),
                 .dout     ( user_start_addr[9:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_start_addr_in[9:0]=user_start_addr[9:0];

   //  user stop address
   
  spc_mb2_ctlmsff_ctl_macro__width_10 user_stop_addr_reg  (
                 .scan_in(user_stop_addr_reg_scanin),
                 .scan_out(user_stop_addr_reg_scanout),
                 .l1clk    ( l1clk_pm1                ),
                 .din      ( user_stop_addr_in[9:0]   ),
                 .dout     ( user_stop_addr[9:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_stop_addr_in[9:0]=user_stop_addr[9:0];
   

  //  user increment address
   
  spc_mb2_ctlmsff_ctl_macro__width_10 user_incr_addr_reg  (
                 .scan_in(user_incr_addr_reg_scanin),
                 .scan_out(user_incr_addr_reg_scanout),
                 .l1clk    ( l1clk_pm1                ),
                 .din      ( user_incr_addr_in[9:0]   ),
                 .dout     ( user_incr_addr[9:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_incr_addr_in[9:0]=user_incr_addr[9:0];

   // user data mode

   spc_mb2_ctlmsff_ctl_macro__width_1 user_data_mode_reg  (
                  .scan_in(user_data_mode_reg_scanin),
                  .scan_out(user_data_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1             ),
  	          .din      ( user_data_mode_in     ),
   		  .dout     ( user_data_mode        ),
  .siclk(siclk),
  .soclk(soclk));

							 
   assign user_data_mode_in=user_data_mode;

   //  user data select
   
   spc_mb2_ctlmsff_ctl_macro__width_8 user_data_reg  (
                 .scan_in(user_data_reg_scanin),
                 .scan_out(user_data_reg_scanout),
                 .l1clk    ( l1clk_pm1           ),
                 .din      ( user_data_in[7:0]   ),
                 .dout     ( user_data[7:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_data_in[7:0]    =    user_data[7:0];


   // user cmp sel inc
   // if its one, user need to program the cmpselinc register
   // otherwise it will loop all cmpsel

   spc_mb2_ctlmsff_ctl_macro__width_1 user_cmpselinc_hold_reg  (
                  .scan_in(user_cmpselinc_hold_reg_scanin),
                  .scan_out(user_cmpselinc_hold_reg_scanout),
                  .l1clk    ( l1clk_pm1                  ),
  	          .din      ( user_cmpselinc_hold_in     ),
   		  .dout     ( user_cmpselinc_hold        ),
  .siclk(siclk),
  .soclk(soclk));

							 
   assign user_cmpselinc_hold_in=user_cmpselinc_hold;



   // user cmp sel reg
   
   spc_mb2_ctlmsff_ctl_macro__width_3 user_cmpsel_reg  (
                  .scan_in(user_cmpsel_reg_scanin),
                  .scan_out(user_cmpsel_reg_scanout),
                  .l1clk    ( l1clk_pm1             ),
  	          .din      ( user_cmpsel_in[2:0]   ),
  		  .dout     ( user_cmpsel[2:0]      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_cmpsel_in[2:0]=user_cmpsel[2:0];

   // user loop mode

   spc_mb2_ctlmsff_ctl_macro__width_1 user_loop_mode_reg  (
                  .scan_in(user_loop_mode_reg_scanin),
                  .scan_out(user_loop_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1             ),
  	          .din      ( user_loop_mode_in     ),
  		  .dout     ( user_loop_mode        ),
  .siclk(siclk),
  .soclk(soclk));

  
   assign user_loop_mode_in=user_loop_mode;

   
   // 10N Algorithm for bit mapping

   spc_mb2_ctlmsff_ctl_macro__width_1 ten_n_mode_reg  (
                  .scan_in(ten_n_mode_reg_scanin),
                  .scan_out(ten_n_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1         ),
  	          .din      ( ten_n_mode_in     ),
  		  .dout     ( ten_n_mode        ),
  .siclk(siclk),
  .soclk(soclk));

  
   assign ten_n_mode_in=ten_n_mode;



   spc_mb2_ctlmsff_ctl_macro__width_1 user_bisi_wr_mode_reg  (
                  .scan_in(user_bisi_wr_mode_reg_scanin),
                  .scan_out(user_bisi_wr_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1	                  ),
  	          .din      ( user_bisi_wr_mode_in   ),
  		  .dout     ( user_bisi_wr_mode      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_bisi_wr_mode_in=user_bisi_wr_mode;

   spc_mb2_ctlmsff_ctl_macro__width_1 user_bisi_rd_mode_reg  (
                  .scan_in(user_bisi_rd_mode_reg_scanin),
                  .scan_out(user_bisi_rd_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1	                  ),
  	          .din      ( user_bisi_rd_mode_in   ),
  		  .dout     ( user_bisi_rd_mode      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_bisi_rd_mode_in=user_bisi_rd_mode;


   assign mb_user_data_mode = user_mode & user_data_mode;
   assign mb_user_addr_mode = user_mode & user_addr_mode;
   assign mb_ten_n_mode     = user_mode & ten_n_mode;
   assign mb_user_loop_mode = user_mode & user_loop_mode;
   assign mb_user_cmpselinc_hold = user_mode & user_cmpselinc_hold;



   assign mb_user_bisi_wr_mode   = user_mode & user_bisi_wr_mode & bisi_mode;
   assign mb_user_bisi_rd_mode   = user_mode & user_bisi_rd_mode & bisi_mode;

   assign mb_user_bisi_rw_mode   = ((~user_bisi_wr_mode & ~user_bisi_rd_mode) | (user_bisi_wr_mode & user_bisi_rd_mode)) & bisi_mode;

   assign mb_default_bisi = bisi_mode & ~user_mode;



   assign stop_addr[9:0]  = ({10{ mb_user_addr_mode          }} & user_stop_addr[9:0]) |
                            ({10{~mb_user_addr_mode & array_0}} & 10'b00_0001_1111   ) |	// arf
                            ({10{~mb_user_addr_mode & array_1}} & 10'b00_0011_1111   ) |	// rrf
                            ({10{~mb_user_addr_mode & array_2}} & 10'b00_1001_1111   ) |	// mam
                            ({10{~mb_user_addr_mode & array_3}} & 10'b00_0111_1111   ) |	// irf active
                            ({10{~mb_user_addr_mode & array_4}} & 10'b00_0111_1111   ) |    // irf shadow
                            ({10{~mb_user_addr_mode & array_5}} & 10'b00_1111_1111   );		// frf



   assign rw_0           =  (rw[2:0]==3'b000);
   assign rw_1           =  (rw[2:0]==3'b001);
   assign rw_2           =  (rw[2:0]==3'b010);
   assign rw_3           =  (rw[2:0]==3'b011);
   assign rw_4           =  (rw[2:0]==3'b100);
   assign rw_5           =  (rw[2:0]==3'b101);
   assign rw_6           =  (rw[2:0]==3'b110);
// assign rw_7           =  (rw[2:0]==3'b111);








   assign march_0   = (march_element[3:0]==4'h0);
   assign march_1   = (march_element[3:0]==4'h1);
   assign march_2   = (march_element[3:0]==4'h2);
   assign march_3   = (march_element[3:0]==4'h3);
   assign march_4   = (march_element[3:0]==4'h4);
   assign march_5   = (march_element[3:0]==4'h5);
   assign march_6   = (march_element[3:0]==4'h6);
   assign march_7   = (march_element[3:0]==4'h7);
   assign march_8   = (march_element[3:0]==4'h8);


   ////////////////////////////////////////////////////////////////////////////////////////////////////////////
   /// address mix : fast_row and fast_column
   ////////////////////////////////////////////////////////////////////////////////////////////////////////////

   // arf: no column decorder or multiple bansk
   // maps one to one  - logical to physical

   // rrf:  no column decoder or banks addr[5:0]
   //       maps one to one



   // mam:  
   //        -  address 7:5 is for block select (0-5) blocks
   //        -  4:1  row select
   //        -  0 column select

   // irf:  
   //        -  addr[0] is for column select
   //        -  addr[6:0]
   //


   
   assign mem_addr[9:0]   =   (addr_mix & array_0) ? { up_addr[9:5],up_addr[3:0],up_addr[4] } : // arf fixed w/circuit
                              (addr_mix & array_1) ? { up_addr[9:6],up_addr[2:0],up_addr[5:3] } : // rrf fixed w/circuit
                              (addr_mix & array_2) ? { up_addr[9:5],up_addr[3:0],up_addr[4] } : // mam fixed w/circuit
                              (addr_mix & array_3) ? { up_addr[9:7],up_addr[5:0],up_addr[6] } : // irf active w/circuit
                              (addr_mix & array_4) ? { up_addr[9:0] } : // no addr mix for irf shadow
                              (addr_mix & array_5) ? { up_addr[9:8],up_addr[6:0],up_addr[7]} :  // frf w/circuit
                                             up_addr[9:0];






   assign cntl_msb                    =       start_in & cntl_out[34];    // done selection


   assign cntl_bisi                    =       mb_default_bisi | mb_user_bisi_rw_mode ? cntl_out[33] :
                                                                                        1'b1;


   assign cntl_array_sel[3:0]        =       (last_array | user_mode) ? 4'b1111:
                                                        cntl_out[32:29];    // array selection 

   assign cntl_cmp_sel[2:0]  = sel_cmp_pass ? {3'b111} :
                                              cntl_out[28:26];
   
   // cmp

   assign sel_cmp_pass= mb_user_cmpselinc_hold |
                             (array_0 & cmp_0) |  // arf
                             (array_1 & cmp_0) |  // rrf
  	                         (array_2 & cmp_0) |  // mam
                             (array_3 & cmp_0) |  // irf active
                             (array_4 & cmp_7) |  // irf shadow
                             (array_5 & cmp_0) ;  // frf


  // cmp logic

   assign cmp_sel_cntl_out[2:0] = cntl_out[28:26];

   spc_mb2_ctlmsff_ctl_macro__width_3 cmp_sel_reg  (
               .scan_in(cmp_sel_reg_scanin),
               .scan_out(cmp_sel_reg_scanout),
               .l1clk    ( l1clk_pm1        ),
               .din      ( cmp_sel[2:0]     ),
               .dout     ( cmp_sel_out[2:0] ),
  .siclk(siclk),
  .soclk(soclk));

   assign cmp_sel[2:0]=(&cmp_sel_cntl_out[2:0] & ~array_4) ? cmp_sel_out[2:0] :
                        mb_user_cmpselinc_hold         ? user_cmpsel[2:0] :
                                                  cmp_sel_cntl_out[2:0];
   

   assign cmp_0      = cmp_sel[2:0]==3'b000;
   assign cmp_7      = cmp_sel[2:0]==3'b111;


   assign cntl_data_sel[1:0]          =   bisi_mode |
                                          mb_user_data_mode  ? 2'b11 :    cntl_out[25:24];    // data selection

   assign cntl_addr_mix               =   (bisi_mode | mb_user_addr_mode) ? 1'b1  :    cntl_out[23];    // address mix
   assign addr_mix                    =   (bisi_mode | mb_user_addr_mode) ? 1'b0  :    cntl_out[23];


   assign cntl_march_element[3:0]     =   sel_march_1_pass  ? 4'b1111:
                                                              cntl_out[22:19];    // march element


   assign cntl_algr[15:0] =       {cntl_msb,
                                   cntl_bisi,
                                   cntl_array_sel[3:0],
			                       cntl_cmp_sel[2:0],
			                       cntl_data_sel[1:0],
			                       cntl_addr_mix,
			                       cntl_march_element[3:0]};


   assign next_algr[15:0] = cout_addr ? cntl_algr[15:0] + 16'h1 : cntl_algr[15:0];         // mbist control

   // next algr
   assign cntl_in[34:19]   = reset_engine              ? {16'b000000_0000000000}:
     	                     ~run3                     ? cntl_algr[15:0]:	  
	                                                    next_algr[15:0];



   // reset_engine   run3    overflow   cout_rw    output
   // ---------------------------------------------------------
   //    1             x        x          x       start_addr
   //    0             0        x          x       cntl_addr
   //    0             1        1          x       restart_addr
   //    0             1        0          1       incred_addr
   //    0             1        0          0       cntl_addr                                     


   assign sel_nextaddr_reset    = reset_engine;
   assign sel_nextaddr_restart  = ~reset_engine & run3 & overflow;
   assign sel_nextaddr_incred   = ~reset_engine & run3 & ~overflow & cout_rw;
   assign sel_nextaddr_same     = ~(sel_nextaddr_reset | sel_nextaddr_restart | sel_nextaddr_incred);

   assign cntl_in[12:3] = ({10{sel_nextaddr_reset}} & start_addr[9:0]) |
                          ({10{sel_nextaddr_restart}} & restart_addr[9:0]) |
                          ({10{sel_nextaddr_incred}} & incred_addr[9:0]) |
                          ({10{sel_nextaddr_same}} & cntl_addr[9:0]);  
   




   assign incr_addr[9:0]  = mb_user_addr_mode ? user_incr_addr[9:0] : 10'b00_00000001;


   assign start_addr[9:0] = mb_user_addr_mode ? user_start_addr[9:0] : 10'b00_00000000;
   
   
   // assign next_addr_out[9:0] = cout_rw ? cntl_addr[9:0] + incr_addr[9:0] : cntl_addr[9:0];    // next address

   assign incred_addr[9:0] = cntl_addr[9:0] + incr_addr[9:0];


   assign overflow   = upaddr   ? ( cntl_addr[9:0] == stop_addr[9:0]) &  (cntl_rw[2:0]==3'b111):
                                  (~cntl_addr[9:0] == start_addr[9:0]) & (cntl_rw[2:0]==3'b111);


   // assign next_addr[9:0]= overflow ? restart_addr[9:0] : next_addr_out[9:0];
  
   assign restart_addr[9:0] = upaddr_pre ? start_addr[9:0] : ~stop_addr[9:0];
      
   assign cout_addr =  overflow;


   assign march_element_pre[3:0]=next_algr[3:0];

   assign march_pre_0   = ~(march_element_pre[3] | march_element_pre[2] |  march_element_pre[1] |  march_element_pre[0]);
   assign march_pre_1   = ~(march_element_pre[3] | march_element_pre[2] |  march_element_pre[1] | ~march_element_pre[0]);
   assign march_pre_2   = ~(march_element_pre[3] | march_element_pre[2] | ~march_element_pre[1] |  march_element_pre[0]);
   assign march_pre_6   = ~(march_element_pre[3] |~march_element_pre[2] | ~march_element_pre[1] |  march_element_pre[0]);
   assign march_pre_7   = ~(march_element_pre[3] | march_element_pre[3] | ~march_element_pre[2] | ~march_element_pre[1] | ~march_element_pre[0]); 
   

   assign upaddr_pre =     march_pre_0 | march_pre_1 | march_pre_2 | march_pre_6 | march_pre_7;



   /////////////////////////
   // rw engine
   /////////////////////////

   assign cntl_rw[2:0]                =   sel_rw_pass      ? 3'b111: 
                                                               cntl_out[ 2: 0];    // read write control

   assign next_rw[2:0] = cntl_rw[2:0]+3'b001 ;              

   
   assign cout_rw = &cntl_rw[2:0];     // carry over for rw 


   // next rw
   assign cntl_in[2:0]     = reset_engine  ? 3'b000 : 
	                         ~run3            ? cntl_rw[2:0]:
	                                                    next_rw[2:0];
   


    ////////////////////////////////////////////////////////////////////////////////
    // array selection
    ////////////////////////////////////////////////////////////////////////////////



   
    assign array_0     = array_sel[3:0]==4'h0;
    assign array_1     = array_sel[3:0]==4'h1;
    assign array_2     = array_sel[3:0]==4'h2;
    assign array_3     = array_sel[3:0]==4'h3;
    assign array_4     = array_sel[3:0]==4'h4;
    assign array_5     = array_sel[3:0]==4'h5;
//    assign array_end   = array_sel[3:0]==4'h5;


   assign last_array = array_5;




// /////////////////////////////////////////////////////////////////////////////
//
// MBIST Control Register
//
// /////////////////////////////////////////////////////////////////////////////
// standard membist
// /////////////////////////////////////////////////////////////////////////////
//   0       1       2       3      4      5          6         7        8
// ^(W0);^(R0W1);^(R1W0);v(R0W1);v(R1W0);v(R0);^(W1W0*R1R0W0);v(W1);^(W0W1*R0R1W1);
//   
// - there are 9 march elements in the engine
//   march_0 - march_8 indicate which march element it's in
//
// - for each march element, there are write and read sequences and for some
//   just write or just read
// 
// - for each march element, it can move upaddr (0-max) or downaddr (max-0)
//
//       march      rw       upaddr                    truedata
// --------------------------------------------------------------------------------
//    -  march_0    w          1    one_cycle_march       rw_0        ^(W0)
//    -  march_1    rw         1    two_cycle_march       rw_0        ^(R0W1)
//    -  march_2    rw         1    two_cycle_march       rw_1        ^(R1W0)
//    -  march_3    rw         0    two_cycle_march       rw_0        v(R0W1)
//    -  march_4    rw         0    two_cycle_march       rw_1        v(R1W0)
//    -  march_5    r          0    one_cycle_march       rw_0        v(R0)
//    -  march_6    wwrrw      1    five_cycle_march      rw_1,3,4    ^(W1W0*R1R0W0)
//    -  march_7    w          0    one_cycle_march       --          v(W1)
//    -  march_8    wwrrw      1    five_cycle_march      rw_0,2      ^(W0W1*R0R1W1)
// mbist address:
//    one_cycle_march  : march_0 | march_5 | march_7
//    five_cycle_march : march_6 | march_8
//    two_cycle_march  : ~(one_cycle_march | five_cycle_march)

   ////////////////////////////////////////////////////////////////////////////////
   //////  user mode signals

// the different between cntl_march and march is that march is before mux and
// and cntl_march is after mux

// IRF-shadow
// write: W1,S1,X,W0,restore
// rw   : R1,W1,S1,X,W0,restore

   spc_mb2_ctlmsff_ctl_macro__width_29 cntl_reg  (
                 .scan_in(cntl_reg_scanin),
                 .scan_out(cntl_reg_scanout),
                 .l1clk    ( l1clk_pm1                            ),
                 .din      ({cntl_in[34:19] ,cntl_in[12:0]}       ),
                 .dout     ({cntl_out[34:19],cntl_out[12:0]}      ),
  .siclk(siclk),
  .soclk(soclk));


   assign one_cycle_march  =  march_0 | march_5 | march_7;
   assign five_cycle_march =  march_6 | march_8;
   assign two_cycle_march  = ~(one_cycle_march | five_cycle_march);


   // this will indicate last march turn
   assign sel_march_1_pass = bisi_mode | ((mb_ten_n_mode | array_4) & march_5) | march_8;


   assign bisi_wr_mode = mb_default_bisi | mb_user_bisi_rw_mode ?  ~cntl_bisi & run3 :
                                                                   mb_user_bisi_wr_mode & run3;
                         
   assign bisi_rd_mode  =mb_default_bisi | mb_user_bisi_rw_mode ?  cntl_bisi & run3 :
                                                                   mb_user_bisi_rd_mode & run3;


   //  control for rw
   assign sel_rw_1_pass = bisi_mode | one_cycle_march ;

   assign sel_rw_2_pass = two_cycle_march;
   assign sel_rw_5_pass = five_cycle_march;

   assign sel_rw_pass = (run3 & sel_rw_1_pass & rw_0 & ~array_4) |
                        (run3 & sel_rw_2_pass & rw_1 & ~array_4) |
                        (run3 & sel_rw_5_pass & rw_4 & ~array_4) |
                        (run3 & array_4 & march_5 & rw_0)  |
                        (run3 & array_4 & march_0 & rw_5)  |
                        (run3 & array_4 & ~(march_5 | march_0) & rw_6) ;

   /////////////////////
   // true data
   ////////////////////


   assign true_data_l     =    bisi_mode |
                             (~array_4 & march_0)   |
                             (array_4 & march_0 & ~rw_3)   |
                             (~array_4 & march_1 & rw_0)   |
                             (array_4 & march_1 & (rw_0 | rw_4))   |
                             (~array_4 & march_2 & rw_1)   |
                             (array_4 & march_2 & (rw_1 | rw_4))   |
                             (~array_4 & march_3 & rw_0)   |
                             (array_4 & march_3 & (rw_0 | rw_4))   |
                             (~array_4 & march_4 & rw_1)   |
                             (array_4 & march_4 & (rw_1 | rw_4))   |
                             (march_5)   |
                             (march_6 & (rw_1 | rw_3 | rw_4))   |
                             (march_8 & (rw_0 | rw_2));

   assign true_data=~true_data_l;


   /////////////////////
   // membist data:
   ////////////////////

   assign data_pat_sel[7:0]        =     mb_user_data_mode                 ?    user_data[7:0]:
                                         bisi_mode                         ?    8'hFF:              
                                         (cntl_data_sel[1:0] == 2'h0)      ?    8'hAA:
                                         (cntl_data_sel[1:0] == 2'h1)      ?    8'h99:
                                         (cntl_data_sel[1:0] == 2'h2)      ?    8'hCC:
                                                                                8'h00;

   assign mem_data1[7:0]         = (true_data) ? data_pat_sel[7:0] : ~data_pat_sel[7:0];
   assign mem_data[7:0]         = ~array_4     ?   mem_data1[7:0] : 
                                   array_4 & bisi_mode ? 8'h00  :
                                                   ~mem_data1[7:0];

   /////////////////////
   // membist address:
   ////////////////////

   assign cntl_addr[9:0]   = cntl_out[12:3];

   assign adj_addr          = (five_cycle_march & (rw_1 | rw_3)) ? {cntl_addr[9:3],~cntl_addr[2],cntl_addr[1:0]}:
                                                                      cntl_addr[9:0] ;



   assign up_addr[9:0]    = upaddr   ?  adj_addr[9:0]:  ~adj_addr[9:0];




   /////////////////////////
   // membist write enable
   /////////////////////////

   
   assign mem_wr_pbi     =    (run3 & ~array_4 & (
                               march_0 |
                               ((march_1 | march_2 | march_3 | march_4 ) & rw_1) |
                               (march_6 & (rw_0 | rw_1 | rw_4)) |
                               march_7 |
                               (march_8 & (rw_0 | rw_1 | rw_4))
                               )) |
                         (run3 & array_4 & (
                               (march_0 & (rw_0 | rw_3)) |
                               ((march_1 | march_2 | march_3 | march_4 ) & (rw_1 | rw_4)) 
                               )) ;


   assign mem_wr = bisi_wr_mode ? mem_wr_pbi :
                   bisi_rd_mode ? 1'b0 :
                                  mem_wr_pbi;
   
   assign mem_save    = (run3 & array_4 & ((march_0 & rw_1) | (~march_0 & rw_2)));
   assign mem_restore = (run3 & array_4 & ((march_0 & rw_4) | (~march_0 & rw_5)));
   /////////////////////////
   // membist read enable
   /////////////////////////

                                            
   assign mem_rd_pbi         =  (~array_4 & run3 & ~mem_wr) |
                            ( array_4 & run3 & ~march_0 & rw_0);  
                                        
   assign mem_rd= bisi_rd_mode ? 1'b1 : mem_rd_pbi;
   // loop detection


   assign upaddr           =    march_0 | march_1 | march_2 | march_6 | march_7 | bisi_mode ;
                                
   
   // next_rw[1:0]
   
   


  assign array_sel_cntl_out[3:0]=cntl_out[32:29];


  spc_mb2_ctlmsff_ctl_macro__width_4 array_sel_reg  (
               .scan_in(array_sel_reg_scanin),
               .scan_out(array_sel_reg_scanout),
               .l1clk    ( l1clk_pm1          ),
               .din      ( array_sel[3:0]     ),
               .dout     ( array_sel_out[3:0] ),
  .siclk(siclk),
  .soclk(soclk));

   assign array_sel[3:0]=(&array_sel_cntl_out[3:0]) ? array_sel_out[3:0] :
                          user_mode                 ? user_array[3:0] :
                                                      array_sel_cntl_out[3:0];

   

  assign march_element_cntl_out[3:0]=cntl_out[22:19];


  spc_mb2_ctlmsff_ctl_macro__width_4 marche_element_reg  (
               .scan_in(marche_element_reg_scanin),
               .scan_out(marche_element_reg_scanout),
               .l1clk    ( l1clk_pm1          ),
               .din      ( march_element[3:0] ),
               .dout     ( march_element_out  ),
  .siclk(siclk),
  .soclk(soclk));

   assign march_element[3:0]=(&march_element_cntl_out[3:0]) ? march_element_out[3:0] :
                                                              march_element_cntl_out[3:0];



  assign rw[2:0]=cntl_out[2:0];







   ////////////////////////////////////   ////////////////////////////////////
   // mbist signals
   ////////////////////////////////////   ////////////////////////////////////
   
   assign mb_run=run;
//   assign mbist_cmp_sel[2:0]=~cntl_cmp_sel[2:0];
   assign mb_addr[15:0]=array_4 ? {6'b000000,cmp_sel[2:0],mem_addr[6:0]} : {6'b000000,mem_addr[9:0]};
   assign mb_write_data[7:0]=mem_data[7:0];


   // only one array read signal should be active   


   assign  mb_array_0_rd= array_0  & mem_rd;
   assign  mb_array_1_rd= array_1  & mem_rd;
   assign  mb_array_2_rd= array_2  & mem_rd;
   assign  mb_array_3_rd= (array_3 & mem_rd & ((|mem_addr[4:0]) | ~(|mem_data[7:0])) & ~bisi_mode) |
                          (array_4 & mem_rd & ((|mem_addr[4:0]) | ~(|mem_data[7:0])) & ~bisi_mode);
   assign  mb_array_save= mem_save;
   assign  mb_array_5_rd= array_5  & mem_rd;

   // only one array write signal should be active
  
 
   assign  mb_array_0_wr= array_0  & mem_wr;
   assign  mb_array_1_wr= array_1  & mem_wr;
   assign  mb_array_2_wr= array_2  & mem_wr;
   assign  mb_array_3_wr= (array_3 & mem_wr) | (array_4  & mem_wr);
   assign  mb_array_restore = mem_restore;
   assign  mb_array_5_wr= array_5  & mem_wr;   




// fail sigals from arrays


assign spu_arf_fail	=  mb2_arf_read_en_p2 & ~spu_mbi_arf_fail_;
assign spu_rrf_fail	=  mb2_rrf_read_en_p2 & ~spu_mbi_rrf_fail_;
assign spu_mam_fail	= (mb2_mam_read_en_p2 & ~spu_mbi_mam_fail_ ) |
         		  (mb2_mam_read_en_p2 & ~spu_mbi_mam_fail2_);

assign exu0_irf_fail	= (mb2_irf_read_en_p4 & ~exu0_mbi_irf_fail_[0] ) |
            		  (mb2_irf_read_en_p4 & ~exu0_mbi_irf_fail_[1]);
assign exu1_irf_fail	= (mb2_irf_read_en_p4 & ~exu1_mbi_irf_fail_[0] ) |
             		  (mb2_irf_read_en_p4 & ~exu1_mbi_irf_fail_[1]);
  

   

assign   arf_fail  = run3_transition ? 1'b0 : (spu_arf_fail | spu_arf_fail_sticky);
assign	 rrf_fail  = run3_transition ? 1'b0 : (spu_rrf_fail | spu_rrf_fail_sticky);
assign	 mam_fail  = run3_transition ? 1'b0 : (spu_mam_fail | spu_mam_fail_sticky);
assign	 irf0_fail = run3_transition ? 1'b0 : (exu0_irf_fail | exu0_irf_fail_sticky);
assign	 irf1_fail = run3_transition ? 1'b0 : (exu1_irf_fail | exu1_irf_fail_sticky);
assign	 frf_fail =  run3_transition ? 1'b0 : (fgu_mbi_frf_fail | fgu_frf_fail_sticky);




spc_mb2_ctlmsff_ctl_macro__width_6		fail_reg		 (
 .scan_in(fail_reg_scanin),
 .scan_out(fail_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ({arf_fail			,
	 rrf_fail			,
	 mam_fail			,
	 irf0_fail			,
	 irf1_fail			,
	 frf_fail}			),
 .dout ({spu_arf_fail_sticky		,
	 spu_rrf_fail_sticky		,
	 spu_mam_fail_sticky		,
	 exu0_irf_fail_sticky		,
	 exu1_irf_fail_sticky		,
	 fgu_frf_fail_sticky}		),
  .siclk(siclk),
  .soclk(soclk));



assign mbist_fail_sticky =      spu_arf_fail_sticky    |
                               spu_rrf_fail_sticky    |
                               spu_mam_fail_sticky    |
                               exu0_irf_fail_sticky	  |
                               exu1_irf_fail_sticky   |
                               fgu_frf_fail_sticky   ;



assign mbist_fail_array =   spu_arf_fail |
                            spu_rrf_fail |
                			spu_mam_fail |
                			exu0_irf_fail |
			                exu1_irf_fail |
			                fgu_mbi_frf_fail;

assign valid_fail=run3 | (stop_engine_l & ~mb_done);

assign mb_fail = mb_done ? mbist_fail_sticky  : mbist_fail_array & valid_fail;




////////////////////////////////////   ////////////////////////////////////
//  DONE LOGIC
////////////////////////////////////   ////////////////////////////////////




  spc_mb2_ctlmsff_ctl_macro__width_1  msb_latch  (
               .scan_in(msb_latch_scanin),
               .scan_out(msb_latch_scanout),
               .l1clk    ( l1clk_pm1	    ),
               .din      ( msb_in    ),
               .dout     ( msb_out  ),
  .siclk(siclk),
  .soclk(soclk));
   
   assign msb_in= (~start_in ) | (mb_user_loop_mode & mb_done) ? 1'b0 :
                   (cntl_msb)                                  ? 1'b1 :
                                                                 msb_out;

   
   assign stop_engine_l     =  start_in  & cntl_msb;


   assign mb_done=msb_out & (done_delay[4:0]==5'b11110);

   assign  run3   = &done_delay[4:1] & ~stop_engine_l & start_in;


   spc_mb2_ctlmsff_ctl_macro__width_1 run3_transition_reg  (
                  .scan_in(run3_transition_reg_scanin),
                  .scan_out(run3_transition_reg_scanout),
                  .l1clk    ( l1clk_pm1	          ),
                  .din      ( run3  ),
                  .dout     ( run3_out    ),
  .siclk(siclk),
  .soclk(soclk));

   assign run3_transition = run3 & ~run3_out;
   
   spc_mb2_ctlmsff_ctl_macro__width_5 done_delay_reg  (
                  .scan_in(done_delay_reg_scanin),
                  .scan_out(done_delay_reg_scanout),
                  .l1clk    ( l1clk_pm1	          ),
                  .din      ( done_delay_in[4:0]  ),
                  .dout     ( done_delay[4:0]    ),
  .siclk(siclk),
  .soclk(soclk));



   assign done_delay_in[4:0] = run3      ?  5'b11111 :
                               mb_done   ?  5'b11110 :
                               (run & ~run3) ? done_delay[4:0] + 5'b00001 :
                                                   5'b00000;



////////////////////////////////////   ////////////////////////////////////
//  FAIL LOGIC
////////////////////////////////////   ////////////////////////////////////







spc_mb2_ctlmsff_ctl_macro__width_1		out_run_mb_arrays_reg		 (
 .scan_in(out_run_mb_arrays_reg_scanin),
 .scan_out(out_run_mb_arrays_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ( mb_run				),
 .dout ( mb_run_out			),
  .siclk(siclk),
  .soclk(soclk));



spc_mb2_ctlmsff_ctl_macro__width_8		out_data_mb_arrays_reg		 (
 .scan_in(out_data_mb_arrays_reg_scanin),
 .scan_out(out_data_mb_arrays_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ( mb_write_data[7:0]		),
 .dout ( mb_write_data_out[7:0]		),
  .siclk(siclk),
  .soclk(soclk));



spc_mb2_ctlmsff_ctl_macro__width_16		out_addr_mb_arrays_reg		 (
 .scan_in(out_addr_mb_arrays_reg_scanin),
 .scan_out(out_addr_mb_arrays_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ( mb_addr[15:0]			),
 .dout ( mb_addr_out[15:0]		),
  .siclk(siclk),
  .soclk(soclk));




spc_mb2_ctlmsff_ctl_macro__width_5		out_wr_mb_arrays_reg		 (
 .scan_in(out_wr_mb_arrays_reg_scanin),
 .scan_out(out_wr_mb_arrays_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ( {
          mb_array_0_wr		,
     	  mb_array_1_wr		,
	  mb_array_2_wr,
	  mb_array_3_wr,
	  mb_array_5_wr
         }		),
 .dout ({ 
          mb_array_0_wr_out		,
       	  mb_array_1_wr_out		,
   	  mb_array_2_wr_out,
   	  mb_array_3_wr_out,
   	  mb_array_5_wr_out
        }		),
  .siclk(siclk),
  .soclk(soclk));


spc_mb2_ctlmsff_ctl_macro__width_5		out_rd_mb_arrays_reg		 (
 .scan_in(out_rd_mb_arrays_reg_scanin),
 .scan_out(out_rd_mb_arrays_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ( {
          mb_array_0_rd,
     	  mb_array_1_rd,
	  mb_array_2_rd,
	  mb_array_3_rd,
	  mb_array_5_rd
          }		),
 .dout ({ 
          mb_array_0_rd_out,
          mb_array_1_rd_out,
          mb_array_2_rd_out,
          mb_array_3_rd_out,
          mb_array_5_rd_out
        }		),
  .siclk(siclk),
  .soclk(soclk));


assign mb2_run=mb_run_out;
assign mb2_write_data[7:0]=mb_write_data_out[7:0];
assign mb2_addr[15:0]=mb_addr_out[15:0];


assign mb2_arf_write_en=mb_array_0_wr_out;
assign mb2_rrf_write_en=mb_array_1_wr_out;
assign mb2_mam_write_en=mb_array_2_wr_out;
assign mb2_irf_write_en=mb_array_3_wr_out;
assign mb2_frf_write_en=mb_array_5_wr_out;

assign mb2_arf_read_en=mb_array_0_rd_out;
assign mb2_rrf_read_en=mb_array_1_rd_out;
assign mb2_mam_read_en=mb_array_2_rd_out;
assign mb2_irf_read_en=mb_array_3_rd_out;
assign mb2_frf_read_en=mb_array_5_rd_out;





spc_mb2_ctlmsff_ctl_macro__width_1  out_mb_tcu_done_reg  (
               .scan_in(out_mb_tcu_done_reg_scanin),
               .scan_out(out_mb_tcu_done_reg_scanout),
               .l1clk    ( l1clk_pm1	),
               .din      ( mb_done      ),
               .dout     ( mb_done_out  ),
  .siclk(siclk),
  .soclk(soclk));




spc_mb2_ctlmsff_ctl_macro__width_1 out_mb_tcu_fail_reg  (
               .scan_in(out_mb_tcu_fail_reg_scanin),
               .scan_out(out_mb_tcu_fail_reg_scanout),
               .l1clk    ( l1clk_pm1	 ),
               .din      (  mb_fail      ),
               .dout     (  mb_fail_out  ),
  .siclk(siclk),
  .soclk(soclk));


assign mb2_done=mb_done_out;
assign mb2_mbist_fail=mb_fail_out;

    // spare gates:


    spc_mb2_ctlspare_ctl_macro__num_3 spares  (
      .scan_in(spares_scanin),
      .scan_out(spares_scanout),
      .l1clk	(l1clk_pm1),
  .siclk(siclk),
  .soclk(soclk)
      );



   ////////////////////////////////////////////////////////////////////////////////
   // UNIQUE TO ENGINE
   ////////////////////////////////////////////////////////////////////////////////

//   assign first_six_march =~(march_6 | march_7 | march_8);



   // END UNIQUE   




spc_mb2_ctlmsff_ctl_macro__width_4		i_delay_4th		 (
 .scan_in(i_delay_4th_scanin),
 .scan_out(i_delay_4th_scanout),
 .l1clk( l1clk_pm1			),
 .din  ({mb2_irf_read_en		,
	 mb2_irf_read_en_p1		,
	 mb2_irf_read_en_p2		,
	 mb2_irf_read_en_p3}		),
 .dout ({mb2_irf_read_en_p1		,
	 mb2_irf_read_en_p2		,
	 mb2_irf_read_en_p3		,
	 mb2_irf_read_en_p4}		),
  .siclk(siclk),
  .soclk(soclk));





// delayed compare read and data signals

spc_mb2_ctlmsff_ctl_macro__width_22		delayed_cmp_rd_data_reg		 (
 .scan_in(delayed_cmp_rd_data_reg_scanin),
 .scan_out(delayed_cmp_rd_data_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ({mb2_arf_read_en		,
	 mb2_mam_read_en		,
	 mb2_rrf_read_en		,
	 mb2_write_data[7:0]		,
	 mb2_arf_read_en_p1		,
	 mb2_mam_read_en_p1		,
	 mb2_rrf_read_en_p1		,
	 mb2_write_data_p1[7:0]}	),
 .dout ({mb2_arf_read_en_p1		,
	 mb2_mam_read_en_p1		,
	 mb2_rrf_read_en_p1		,
	 mb2_write_data_p1[7:0]		,
	 mb2_arf_read_en_p2		,
	 mb2_mam_read_en_p2		,
	 mb2_rrf_read_en_p2		,
	 mb2_write_data_p2[7:0]}	),
  .siclk(siclk),
  .soclk(soclk));


// save and restore signals to arrays


spc_mb2_ctlmsff_ctl_macro__width_2		out_save_restore_mb_arrays_reg		 (
 .scan_in(out_save_restore_mb_arrays_reg_scanin),
 .scan_out(out_save_restore_mb_arrays_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ({mb_array_save			,
    	 mb_array_restore}		),
 .dout ({mb2_irf_save_en		,
	 mb2_irf_restore_en}		),
  .siclk(siclk),
  .soclk(soclk));





// fixscan start:
assign pmen_scanin               = scan_in                  ;
assign input_signals_reg_scanin  = pmen_scanout             ;
assign mb_enable_reg_scanin      = input_signals_reg_scanout;
assign config_reg_scanin         = mb_enable_reg_scanout    ;
assign loop_again_reg_scanin     = config_reg_scanout       ;
assign array_usr_reg_scanin      = loop_again_reg_scanout   ;
assign user_addr_mode_reg_scanin = array_usr_reg_scanout    ;
assign user_start_addr_reg_scanin = user_addr_mode_reg_scanout;
assign user_stop_addr_reg_scanin = user_start_addr_reg_scanout;
assign user_incr_addr_reg_scanin = user_stop_addr_reg_scanout;
assign user_data_mode_reg_scanin = user_incr_addr_reg_scanout;
assign user_data_reg_scanin      = user_data_mode_reg_scanout;
assign user_cmpselinc_hold_reg_scanin = user_data_reg_scanout    ;
assign user_cmpsel_reg_scanin    = user_cmpselinc_hold_reg_scanout;
assign user_loop_mode_reg_scanin = user_cmpsel_reg_scanout  ;
assign ten_n_mode_reg_scanin     = user_loop_mode_reg_scanout;
assign user_bisi_wr_mode_reg_scanin = ten_n_mode_reg_scanout   ;
assign user_bisi_rd_mode_reg_scanin = user_bisi_wr_mode_reg_scanout;
assign cmp_sel_reg_scanin        = user_bisi_rd_mode_reg_scanout;
assign cntl_reg_scanin           = cmp_sel_reg_scanout      ;
assign array_sel_reg_scanin      = cntl_reg_scanout         ;
assign marche_element_reg_scanin = array_sel_reg_scanout    ;
assign fail_reg_scanin           = marche_element_reg_scanout;
assign msb_latch_scanin          = fail_reg_scanout         ;
assign run3_transition_reg_scanin = msb_latch_scanout        ;
assign done_delay_reg_scanin     = run3_transition_reg_scanout;
assign out_run_mb_arrays_reg_scanin = done_delay_reg_scanout   ;
assign out_data_mb_arrays_reg_scanin = out_run_mb_arrays_reg_scanout;
assign out_addr_mb_arrays_reg_scanin = out_data_mb_arrays_reg_scanout;
assign out_wr_mb_arrays_reg_scanin = out_addr_mb_arrays_reg_scanout;
assign out_rd_mb_arrays_reg_scanin = out_wr_mb_arrays_reg_scanout;
assign out_mb_tcu_done_reg_scanin = out_rd_mb_arrays_reg_scanout;
assign out_mb_tcu_fail_reg_scanin = out_mb_tcu_done_reg_scanout;
assign spares_scanin             = out_mb_tcu_fail_reg_scanout;
assign i_delay_4th_scanin        = spares_scanout           ;
assign delayed_cmp_rd_data_reg_scanin = i_delay_4th_scanout      ;
assign out_save_restore_mb_arrays_reg_scanin = delayed_cmp_rd_data_reg_scanout;
assign scan_out                  = out_save_restore_mb_arrays_reg_scanout;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module spc_mb2_ctll1clkhdr_ctl_macro (
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

module spc_mb2_ctlmsff_ctl_macro__width_3 (
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

module spc_mb2_ctlmsff_ctl_macro__width_2 (
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

module spc_mb2_ctlmsff_ctl_macro__width_1 (
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

module spc_mb2_ctlmsff_ctl_macro__width_4 (
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

module spc_mb2_ctlmsff_ctl_macro__width_10 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [9:0] fdin;
wire [8:0] so;

  input [9:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [9:0] dout;
  output scan_out;
assign fdin[9:0] = din[9:0];






dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);












endmodule













// any PARAMS parms go into naming of macro

module spc_mb2_ctlmsff_ctl_macro__width_8 (
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

module spc_mb2_ctlmsff_ctl_macro__width_29 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [28:0] fdin;
wire [27:0] so;

  input [28:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [28:0] dout;
  output scan_out;
assign fdin[28:0] = din[28:0];






dff #(29)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[28:0]),
.si({scan_in,so[27:0]}),
.so({so[27:0],scan_out}),
.q(dout[28:0])
);












endmodule













// any PARAMS parms go into naming of macro

module spc_mb2_ctlmsff_ctl_macro__width_6 (
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

module spc_mb2_ctlmsff_ctl_macro__width_5 (
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

module spc_mb2_ctlmsff_ctl_macro__width_16 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = din[15:0];






dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module spc_mb2_ctlspare_ctl_macro__num_3 (
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

module spc_mb2_ctlmsff_ctl_macro__width_22 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [21:0] fdin;
wire [20:0] so;

  input [21:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [21:0] dout;
  output scan_out;
assign fdin[21:0] = din[21:0];






dff #(22)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[21:0]),
.si({scan_in,so[20:0]}),
.so({so[20:0],scan_out}),
.q(dout[21:0])
);












endmodule








