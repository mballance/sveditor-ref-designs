// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_mb0_ctl.v
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
module l2t_mb0_ctl (
  mb0_l2t_run, 
  mb0_l2t_cambist, 
  mb0_l2t_addr, 
  mb0_l2t_icrow_wr_en, 
  mb0_l2t_icrow_rd_en, 
  mb0_l2t_lookup_wdata, 
  mb0_l2t_icrow_lookup_en, 
  mb0_l2t_icrow_row_en, 
  mb0_l2t_icrow_panel_en, 
  mb0_l2t_mbist_write_data, 
  mb0_l2t_dcrow_wr_en, 
  mb0_l2t_dcrow_rd_en, 
  mb0_l2t_dcrow_lookup_en, 
  mb0_l2t_dcrow_row_en, 
  mb0_l2t_dcrow_panel_en, 
  mb0_l2t_mask, 
  mb0_l2t_oqarray_wr_en, 
  mb0_l2t_oqarray_rd_en, 
  mb0_l2t_cmpsel, 
  mb0_l2t_done, 
  mb0_l2t_fail, 
  scan_out, 
  dc_cam_fail, 
  ic_cam_fail, 
  dir_dc_rw_fail, 
  dir_ic_rw_fail, 
  oqarray_rw_fail, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  mbist_start, 
  mbist_user_mode, 
  mbist_bisi_mode);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire clock_enable;
wire start_in;
wire l1clk_pm1;
wire mb_ic_rw_fail;
wire mb_dc_rw_fail;
wire array_usr_reg_scanin;
wire array_usr_reg_scanout;
wire [3:0] user_array_sel_in;
wire [3:0] user_array_sel;
wire user_addr_mode_reg_scanin;
wire user_addr_mode_reg_scanout;
wire user_addr_mode_in;
wire user_addr_mode;
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
wire user_data_mode_reg_scanin;
wire user_data_mode_reg_scanout;
wire user_data_mode_in;
wire user_data_mode;
wire user_data_reg_scanin;
wire user_data_reg_scanout;
wire [7:0] user_data_in;
wire [7:0] user_data;
wire user_cmpsel_hold_reg_scanin;
wire user_cmpsel_hold_reg_scanout;
wire user_cmpsel_hold_in;
wire user_cmpsel_hold;
wire user_cmpsel_reg_scanin;
wire user_cmpsel_reg_scanout;
wire [3:0] user_cmpsel_in;
wire [3:0] user_cmpsel;
wire user_loop_mode_reg_scanin;
wire user_loop_mode_reg_scanout;
wire user_loop_mode_in;
wire user_loop_mode;
wire ten_n_mode_reg_scanin;
wire ten_n_mode_reg_scanout;
wire ten_n_mode_in;
wire ten_n_mode;
wire user_cam_mode_reg_scanin;
wire user_cam_mode_reg_scanout;
wire user_cam_mode_in;
wire user_cam_mode;
wire user_cam_select_reg_scanin;
wire user_cam_select_reg_scanout;
wire [1:0] user_cam_sel_in;
wire [1:0] user_cam_sel;
wire user_cam_test_select_reg_scanin;
wire user_cam_test_select_reg_scanout;
wire [1:0] user_cam_test_sel_in;
wire [1:0] user_cam_test_sel;
wire user_bisi_wr_mode_reg_scanin;
wire user_bisi_wr_mode_reg_scanout;
wire user_bisi_wr_mode_in;
wire user_bisi_wr_mode;
wire user_bisi_rd_mode_reg_scanin;
wire user_bisi_rd_mode_reg_scanout;
wire user_bisi_rd_mode_in;
wire user_bisi_rd_mode;
wire mb_user_data_mode;
wire user_mode;
wire mb_user_addr_mode;
wire mb_user_cmpsel_hold;
wire mb_user_cam_mode;
wire mb_user_ram_mode;
wire mb_user_loop_mode;
wire mb_user_bisi_wr_mode;
wire bisi_mode;
wire mb_user_bisi_rd_mode;
wire mb_user_bisi_rw_mode;
wire mb_default_bisi;
wire input_signals_reg_scanin;
wire input_signals_reg_scanout;
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
wire cam_cntl_reg_scanin;
wire cam_cntl_reg_scanout;
wire [18:0] cam_in;
wire [18:0] cam_out;
wire cam_shift_reg_scanin;
wire cam_shift_reg_scanout;
wire cam_shift_val;
wire cam_shift;
wire cam_msb;
wire [1:0] cam_array_sel;
wire [1:0] cam_panel_sel;
wire [1:0] ctest;
wire [1:0] cam_cseq;
wire sel_cseq_pass;
wire [7:0] cam_addr;
wire ctest2;
wire ctest3;
wire cseq1;
wire [1:0] cam_crw;
wire sel_crw_pass;
wire [1:0] crw;
wire cseq2;
wire cseq0;
wire cambist;
wire ctest0;
wire [1:0] ctest_sel;
wire ctest1;
wire [1:0] cseq;
wire cseq3;
wire crw0;
wire crw1;
wire crw2;
wire crw3;
wire [15:0] lookup_wdata;
wire cam_zero;
wire [7:0] l2_mask;
wire cam_wr_en;
wire cam_en;
wire cam_walk1;
wire end_shift;
wire [18:0] qual_cam;
wire run3;
wire mb_icrow0_cam_hit;
wire [1:0] icrow_sel_d3;
wire mb_icrow1_cam_hit;
wire mb_dcrow0_cam_hit;
wire [1:0] dcrow_sel_d3;
wire mb_dcrow1_cam_hit;
wire cam_hit_reg_scanin;
wire cam_hit_reg_scanout;
wire icrow0_cam_hit;
wire icrow1_cam_hit;
wire dcrow0_cam_hit;
wire dcrow1_cam_hit;
wire exp_cam_hit_delay_reg_scanin;
wire exp_cam_hit_delay_reg_scanout;
wire cam_hit_cmp;
wire cam_hit_cmp_d1;
wire cam_hit_cmp_d2;
wire cam_hit_cmp_d3;
wire cam_hit_cmp_d4;
wire cam_hit_cmp_d5;
wire exp_cam_exp_delay_reg_scanin;
wire exp_cam_exp_delay_reg_scanout;
wire cam_hit_exp;
wire cam_hit_exp_d1;
wire cam_hit_exp_d2;
wire cam_hit_exp_d3;
wire cam_hit_exp_d4;
wire cam_hit_exp_d5;
wire cam_sel_icrow_delay_reg_scanin;
wire cam_sel_icrow_delay_reg_scanout;
wire [1:0] icrow_sel_d1;
wire [1:0] icrow_sel_d2;
wire [1:0] icrow_sel_d4;
wire [1:0] icrow_sel_d5;
wire cam_sel_dcrow_delay_reg_scanin;
wire cam_sel_dcrow_delay_reg_scanout;
wire [1:0] dcrow_sel_d1;
wire [1:0] dcrow_sel_d2;
wire [1:0] dcrow_sel_d4;
wire [1:0] dcrow_sel_d5;
wire icrow0_cam_pass;
wire icrow1_cam_pass;
wire dcrow0_cam_pass;
wire dcrow1_cam_pass;
wire icrow0_cam_fail;
wire icrow1_cam_fail;
wire dcrow0_cam_fail;
wire dcrow1_cam_fail;
wire cntl_msb;
wire valid_fail;
wire cam_0;
wire [1:0] cam_sel;
wire cam_1;
wire cam_2;
wire cam_3;
wire [3:0] icrow_lookup_en;
wire cam_panel_en_0;
wire cam_panel_en_1;
wire cam_panel_en_2;
wire cam_panel_en_3;
wire [3:0] dcrow_lookup_en;
wire [1:0] icrow_row_en;
wire array_0;
wire array_1;
wire [1:0] dcrow_row_en;
wire array_2;
wire array_3;
wire panel_en_0;
wire cmp_0;
wire panel_en_1;
wire cmp_1;
wire panel_en_2;
wire cmp_2;
wire panel_en_3;
wire cmp_3;
wire icrow_arrays;
wire dcrow_arrays;
wire [3:0] icrow_panel_en;
wire [3:0] dcrow_panel_en;
wire mbist_output_reg_scanin;
wire mbist_output_reg_scanout;
wire [15:0] mb_lookup_wdata;
wire [7:0] mem_data;
wire mbist_output_data_reg_scanin;
wire mbist_output_data_reg_scanout;
wire cntl_reg_scanin;
wire cntl_reg_scanout;
wire [35:0] cntl_in;
wire [35:0] cntl_out;
wire [16:0] cntl_algr;
wire [16:0] next_algr;
wire sel_nextaddr_reset;
wire sel_nextaddr_restart;
wire overflow;
wire sel_nextaddr_incred;
wire cout_rw;
wire sel_nextaddr_same;
wire [7:0] start_addr;
wire [7:0] restart_addr;
wire [7:0] incred_addr;
wire [7:0] cntl_addr;
wire [2:0] cntl_rw;
wire [2:0] next_rw;
wire cntl_bisi;
wire [3:0] cntl_array_sel;
wire last_array;
wire [3:0] cntl_cmp_sel;
wire sel_cmp_pass;
wire [1:0] cntl_data_sel;
wire cntl_addr_mix;
wire [3:0] cntl_march_element;
wire sel_march_1_pass;
wire addr_mix;
wire cout_addr;
wire upaddr;
wire march_0;
wire march_1;
wire march_2;
wire march_6;
wire march_7;
wire [3:0] march_element_pre;
wire march_pre_0;
wire march_pre_1;
wire march_pre_2;
wire march_pre_6;
wire march_pre_7;
wire upaddr_pre;
wire [7:0] incr_addr;
wire [7:0] stop_addr;
wire sel_rw_pass;
wire one_cycle_march;
wire march_5;
wire five_cycle_march;
wire march_8;
wire two_cycle_march;
wire mem_wr_pbi;
wire march_3;
wire march_4;
wire rw_1;
wire rw_0;
wire rw_4;
wire mem_wr;
wire bisi_wr_mode;
wire bisi_rd_mode;
wire mem_rd_pbi;
wire mem_rd;
wire [7:0] adj_addr;
wire rw_3;
wire [7:0] mem_addr1;
wire true_data_l;
wire rw_2;
wire true_data;
wire [7:0] data_pat_sel;
wire array_4;
wire [7:0] mem_addr;
wire [3:0] array_sel;
wire [3:0] cmp_sel;
wire [3:0] march_element;
wire [2:0] rw;
wire [1:0] cseq_cntl_out;
wire cseq_reg_scanin;
wire cseq_reg_scanout;
wire [1:0] cseq_out;
wire [1:0] cam_sel_cntl_out;
wire [1:0] ctest_sel_cntl_out;
wire ctest_sel_reg_scanin;
wire ctest_sel_reg_scanout;
wire [1:0] ctest_sel_out;
wire [3:0] array_sel_cntl_out;
wire array_sel_reg_scanin;
wire array_sel_reg_scanout;
wire [3:0] array_sel_out;
wire [3:0] cmp_sel_cntl_out;
wire cmp_sel_reg_scanin;
wire cmp_sel_reg_scanout;
wire [3:0] cmp_sel_out;
wire [3:0] march_element_cntl_out;
wire marche_element_reg_scanin;
wire marche_element_reg_scanout;
wire [3:0] march_element_out;
wire sel_rw_1_pass;
wire sel_rw_2_pass;
wire sel_rw_5_pass;
wire [3:0] mb_cmp_sel;
wire [7:0] mb_addr;
wire [7:0] mb_write_data;
wire mb_array_0_rd;
wire mb_array_1_rd;
wire mb_array_2_rd;
wire mb_array_3_rd;
wire mb_array_4_rd;
wire mb_array_0_wr;
wire mb_array_1_wr;
wire mb_array_2_wr;
wire mb_array_3_wr;
wire mb_array_4_wr;
wire mb_run;
wire [4:0] done_delay;
wire msb_latch_scanin;
wire msb_latch_scanout;
wire msb_in;
wire msb_out;
wire mb_done;
wire run3_transition_reg_scanin;
wire run3_transition_reg_scanout;
wire run3_out;
wire run3_transition;
wire done_delay_reg_scanin;
wire done_delay_reg_scanout;
wire [4:0] done_delay_in;
wire mb_ic0_rw_fail;
wire mb_ic1_rw_fail;
wire mb_dc0_rw_fail;
wire mb_dc1_rw_fail;
wire mb_oqarray_rw_fail;
wire ic0_fail_d;
wire ic0_fail_sticky;
wire ic1_fail_d;
wire ic1_fail_sticky;
wire dc0_fail_d;
wire dc0_fail_sticky;
wire dc1_fail_d;
wire dc1_fail_sticky;
wire oqarray_fail_d;
wire oqarray_fail_sticky;
wire icrow0_cam_fail_d;
wire icrow0_cam_fail_sticky;
wire icrow1_cam_fail_d;
wire icrow1_cam_fail_sticky;
wire dcrow0_cam_fail_d;
wire dcrow0_cam_fail_sticky;
wire dcrow1_cam_fail_d;
wire dcrow1_cam_fail_sticky;
wire mbist_fail_input_reg_scanin;
wire mbist_fail_input_reg_scanout;
wire mbist_fail_sticky;
wire mbist_fail_array;
wire mb_fail;
wire out_mb_tcu_done_reg_scanin;
wire out_mb_tcu_done_reg_scanout;
wire mb_done_out;
wire inv_mask_reg_scanin;
wire inv_mask_reg_scanout;
wire out_mb_tcu_fail_reg_scanin;
wire out_mb_tcu_fail_reg_scanout;
wire mb_fail_out;
wire out_cmp_sel_reg_scanin;
wire out_cmp_sel_reg_scanout;
wire [3:0] mb_cmpsel_out;
wire out_run_mb_arrays_reg_scanin;
wire out_run_mb_arrays_reg_scanout;
wire mb_run_out;
wire out_data_mb_arrays_reg_scanin;
wire out_data_mb_arrays_reg_scanout;
wire [7:0] mb_write_data_out;
wire out_addr_mb_arrays_reg_scanin;
wire out_addr_mb_arrays_reg_scanout;
wire [7:0] mb_addr_out;
wire out_wr_mb_arrays_reg_scanin;
wire out_wr_mb_arrays_reg_scanout;
wire mb_array_0_wr_out;
wire mb_array_1_wr_out;
wire mb_array_2_wr_out;
wire mb_array_3_wr_out;
wire mb_array_4_wr_out;
wire out_rd_mb_arrays_reg_scanin;
wire out_rd_mb_arrays_reg_scanout;
wire mb_array_0_rd_out;
wire mb_array_1_rd_out;
wire mb_array_2_rd_out;
wire mb_array_3_rd_out;
wire mb_array_4_rd_out;
wire spares_scanin;
wire spares_scanout;


// Please note that this is going to be used as a place holder. 
// The inputs and outputs are defined based on the analysis of cluster memories.
// For this version, the outputs of memories are taken into mbist controller.
//



// /////////////////////////////////////////////////////////////////////////////
// Outputs
// /////////////////////////////////////////////////////////////////////////////

   output        mb0_l2t_run;
   output        mb0_l2t_cambist;
   // IC row
   output [5:0]	 mb0_l2t_addr;  			// Writing to 1/64 entries
   output 	 mb0_l2t_icrow_wr_en;
   output 	 mb0_l2t_icrow_rd_en;
   output [15:0] mb0_l2t_lookup_wdata; 		// CAM compare data
   output [3:0]	 mb0_l2t_icrow_lookup_en; 	// CAM enable for 4 panels
   output [1:0]	 mb0_l2t_icrow_row_en;		// pick 1/2 rows
   output [3:0]	 mb0_l2t_icrow_panel_en;	// one of 4 panels select
   
   output [7:0]  mb0_l2t_mbist_write_data;  // only for oqarray
                         
   // DC row             
   output 	     mb0_l2t_dcrow_wr_en;
   output 	     mb0_l2t_dcrow_rd_en;
   output [3:0]	 mb0_l2t_dcrow_lookup_en;	// CAM enable for 4 panels
   output [1:0]	 mb0_l2t_dcrow_row_en;   	// pick 1/2 rows
   output [3:0]	 mb0_l2t_dcrow_panel_en; 	// one of 4 panels select

   output [7:0]	 mb0_l2t_mask; 	// mask to mask off the cam hit resetting valid bit
                         
   output 	 mb0_l2t_oqarray_wr_en;
   output 	 mb0_l2t_oqarray_rd_en;
   output [3:0]	 mb0_l2t_cmpsel;            // 1/16 mux select
   output        mb0_l2t_done;
   output        mb0_l2t_fail;

   output        scan_out;

   input  [1:0]  dc_cam_fail;      // free flowing will be qualified in mb0
   input  [1:0]  ic_cam_fail;      // free flowing will be qualified in mb0
   input  [3:0]  dir_dc_rw_fail;      // free flowing will be qualified in mb0
   input  [3:0]  dir_ic_rw_fail;      // free flowing will be qualified in mb0

   input        oqarray_rw_fail;


///////////////////////////////////////////////////////////////////////////////
// Inputs
///////////////////////////////////////////////////////////////////////////////

   input              l2clk;
   input              scan_in;
   input              tcu_pce_ov;             // scan signals
   input              tcu_aclk;
   input              tcu_bclk;
   input              tcu_scan_en;
   input              tcu_clk_stop;

   input              mbist_start;
   input              mbist_user_mode;
   input              mbist_bisi_mode;


// /////////////////////////////////////////////////////////////////////////////
// Scan Renames
// /////////////////////////////////////////////////////////////////////////////

assign pce_ov = tcu_pce_ov;
assign stop   = tcu_clk_stop;
assign siclk  = tcu_aclk;
assign soclk  = tcu_bclk;
assign se = tcu_scan_en;



////////////////////////////////////////////////////////////////////////////////
// Clock header



l2t_mb0_ctl_l1clkhdr_ctl_macro clkgen_freeclk (
        .l2clk  (l2clk 		),
        .l1en   (1'b1		),
        .l1clk  (l1clk		),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));



assign clock_enable	= start_in | mb0_l2t_done | mb0_l2t_run | mb0_l2t_fail ;

l2t_mb0_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk 			),
        .l1en   (clock_enable		),
        .l1clk  (l1clk_pm1			),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);



// /////////////////////////////////////////////////////////////////////////////
//
// user mode resgisters   
// MBIST PGM Control Register
//
// /////////////////////////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////////////////////////

// TEMP ASSIGN



// there are 4 panels in the directory and 2 rows.
// One of the rows depending on the read enable/row select 
// picks the row and muxes the top/bottom column 
// Hence there are 4 places where in the data gets compared
// and 4 bit NOT fail.  All the 4 bit fails should be OR-ed 
// after inverting it. 


assign mb_ic_rw_fail = |(~(dir_ic_rw_fail[3:0]));
assign mb_dc_rw_fail = |(~(dir_dc_rw_fail[3:0]));

////////////////////////////////////////////////////////////////////////////////
// user control registers
//                         size
// -  user_array_sel            4
// -  user_addr_mode        1
// -  user_start_addr      15
// -  user_stop_addr       15
// -  user_inc_addr        15
// -  user_data_mode        1
// -  user_data             8
// -  user_cmpsel_hold      1
// -  user_cmpsel           3
// -  user_loop_mode        1

   l2t_mb0_ctl_msff_ctl_macro__width_4 array_usr_reg  (
              .scan_in(array_usr_reg_scanin),
              .scan_out(array_usr_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_array_sel_in[3:0]       ),
  		      .dout     ( user_array_sel[3:0]      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_array_sel_in[3:0]=user_array_sel[3:0];


   // user address mode

   l2t_mb0_ctl_msff_ctl_macro__width_1 user_addr_mode_reg  (
              .scan_in(user_addr_mode_reg_scanin),
              .scan_out(user_addr_mode_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_addr_mode_in       ),
  		      .dout     ( user_addr_mode        ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_addr_mode_in=user_addr_mode;
   

   //  user start address
   
  l2t_mb0_ctl_msff_ctl_macro__width_8 user_start_addr_reg  (
              .scan_in(user_start_addr_reg_scanin),
              .scan_out(user_start_addr_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
                 .din      ( user_start_addr_in[7:0]       ),
                 .dout     ( user_start_addr[7:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_start_addr_in[7:0]=user_start_addr[7:0];

   //  user stop address
   
  l2t_mb0_ctl_msff_ctl_macro__width_8 user_stop_addr_reg  (
              .scan_in(user_stop_addr_reg_scanin),
              .scan_out(user_stop_addr_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
                 .din      ( user_stop_addr_in[7:0]       ),
                 .dout     ( user_stop_addr[7:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_stop_addr_in[7:0]=user_stop_addr[7:0];
   

  //  user increment address
   
  l2t_mb0_ctl_msff_ctl_macro__width_8 user_incr_addr_reg  (
              .scan_in(user_incr_addr_reg_scanin),
              .scan_out(user_incr_addr_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
                 .din      ( user_incr_addr_in[7:0]       ),
                 .dout     ( user_incr_addr[7:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_incr_addr_in[7:0]=user_incr_addr[7:0];

   // user data mode

   l2t_mb0_ctl_msff_ctl_macro__width_1 user_data_mode_reg  (
              .scan_in(user_data_mode_reg_scanin),
              .scan_out(user_data_mode_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_data_mode_in       ),
   		      .dout     ( user_data_mode        ),
  .siclk(siclk),
  .soclk(soclk));

							 
   assign user_data_mode_in=user_data_mode;

   //  user data select
   
   l2t_mb0_ctl_msff_ctl_macro__width_8 user_data_reg  (
              .scan_in(user_data_reg_scanin),
              .scan_out(user_data_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
                 .din      ( user_data_in[7:0]       ),
                 .dout     ( user_data[7:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_data_in[7:0]    =    user_data[7:0];

   // user cmp sel inc
   // if its one, user need to program the cmpselinc register
   // otherwise it will loop all cmpsel

   l2t_mb0_ctl_msff_ctl_macro__width_1 user_cmpsel_hold_reg  (
              .scan_in(user_cmpsel_hold_reg_scanin),
              .scan_out(user_cmpsel_hold_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_cmpsel_hold_in       ),
   		      .dout     ( user_cmpsel_hold        ),
  .siclk(siclk),
  .soclk(soclk));

							 
   assign user_cmpsel_hold_in=user_cmpsel_hold;



   // user cmp sel reg
   
   l2t_mb0_ctl_msff_ctl_macro__width_4 user_cmpsel_reg  (
              .scan_in(user_cmpsel_reg_scanin),
              .scan_out(user_cmpsel_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_cmpsel_in[3:0]       ),
  		      .dout     ( user_cmpsel[3:0]      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_cmpsel_in[3:0]=user_cmpsel[3:0];


   // user loop mode

   l2t_mb0_ctl_msff_ctl_macro__width_1 user_loop_mode_reg  (
              .scan_in(user_loop_mode_reg_scanin),
              .scan_out(user_loop_mode_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_loop_mode_in       ),
  		      .dout     ( user_loop_mode        ),
  .siclk(siclk),
  .soclk(soclk));

  
   assign user_loop_mode_in=user_loop_mode;



   // 10N Algorithm for bit mapping

   l2t_mb0_ctl_msff_ctl_macro__width_1 ten_n_mode_reg  (
              .scan_in(ten_n_mode_reg_scanin),
              .scan_out(ten_n_mode_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( ten_n_mode_in       ),
  		      .dout     ( ten_n_mode        ),
  .siclk(siclk),
  .soclk(soclk));

  
   assign ten_n_mode_in=ten_n_mode;


   // cambist: user array select



   l2t_mb0_ctl_msff_ctl_macro__width_1 user_cam_mode_reg  (
              .scan_in(user_cam_mode_reg_scanin),
              .scan_out(user_cam_mode_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_cam_mode_in       ),
  		      .dout     ( user_cam_mode      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_cam_mode_in=user_cam_mode;



   l2t_mb0_ctl_msff_ctl_macro__width_2 user_cam_select_reg  (
              .scan_in(user_cam_select_reg_scanin),
              .scan_out(user_cam_select_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_cam_sel_in[1:0]       ),
  		      .dout     ( user_cam_sel[1:0]      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_cam_sel_in[1:0]=user_cam_sel[1:0];


   l2t_mb0_ctl_msff_ctl_macro__width_2 user_cam_test_select_reg  (
              .scan_in(user_cam_test_select_reg_scanin),
              .scan_out(user_cam_test_select_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_cam_test_sel_in[1:0]       ),
  		      .dout     ( user_cam_test_sel[1:0]      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_cam_test_sel_in[1:0]=user_cam_test_sel[1:0];


   l2t_mb0_ctl_msff_ctl_macro__width_1 user_bisi_wr_mode_reg  (
                  .scan_in(user_bisi_wr_mode_reg_scanin),
                  .scan_out(user_bisi_wr_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1	                  ),
  	          .din      ( user_bisi_wr_mode_in   ),
  		  .dout     ( user_bisi_wr_mode      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_bisi_wr_mode_in=user_bisi_wr_mode;

   l2t_mb0_ctl_msff_ctl_macro__width_1 user_bisi_rd_mode_reg  (
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
   assign mb_user_cmpsel_hold = user_mode & user_cmpsel_hold;
   assign mb_user_cam_mode = user_mode & user_cam_mode;
   assign mb_user_ram_mode = user_mode & ~user_cam_mode;
   assign mb_user_loop_mode = user_mode & user_loop_mode;


   assign mb_user_bisi_wr_mode   = user_mode & user_bisi_wr_mode & bisi_mode;
   assign mb_user_bisi_rd_mode   = user_mode & user_bisi_rd_mode & bisi_mode;

   assign mb_user_bisi_rw_mode   = ((~user_bisi_wr_mode & ~user_bisi_rd_mode) | (user_bisi_wr_mode & user_bisi_rd_mode)) & bisi_mode;

   assign mb_default_bisi = bisi_mode & ~user_mode;



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

  l2t_mb0_ctl_msff_ctl_macro__width_3 input_signals_reg  (
              .scan_in(input_signals_reg_scanin),
              .scan_out(input_signals_reg_scanout),
              .l1clk    ( l1clk	           ),
               .din      ( {mbist_start,mbist_bisi_mode,mbist_user_mode} ),
               .dout     ( {start_in,bisi_mode,user_mode} ),
  .siclk(siclk),
  .soclk(soclk));
  


  // default   : mb_enable=0
  // bisi      : mb_enable=0
  // user_mode : mb_enable=depend on programmed value

  l2t_mb0_ctl_msff_ctl_macro__width_1 mb_enable_reg  (
              .scan_in(mb_enable_reg_scanin),
              .scan_out(mb_enable_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      ( mb_enable       ),
               .dout     ( mb_enable_out       ),
  .siclk(siclk),
  .soclk(soclk));


  assign mb_enable = user_mode ? mb_enable_out : 1'b0;

 
  assign start = user_mode ? (mb_enable_out & start_in) :
                             (start_in);



  l2t_mb0_ctl_msff_ctl_macro__width_2 config_reg  (
              .scan_in(config_reg_scanin),
              .scan_out(config_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      ( config_in[1:0]       ),
               .dout     ( config_out[1:0]      ),
  .siclk(siclk),
  .soclk(soclk));

     
  assign config_in[0]        =    start;
  assign config_in[1]        =    config_out[0];
  assign start_transition    =    config_out[0] &  ~config_out[1];
  assign end_transition      =   ~config_out[0] &   config_out[1];
  assign reset_engine        =    start_transition | loop_again  | end_transition;
  assign run                 =    config_out[1];


  l2t_mb0_ctl_msff_ctl_macro__width_1 loop_again_reg  (
              .scan_in(loop_again_reg_scanin),
              .scan_out(loop_again_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      (  stop_engine_l   ),
               .dout     (  stop_engine_l_q  ),
  .siclk(siclk),
  .soclk(soclk));


assign loop_again=mb_user_loop_mode ? stop_engine_l & ~stop_engine_l_q:  1'b0;

   

   
// /////////////////////////////////////////////////////////////////////////////
//
// MBIST Control Register
//
// /////////////////////////////////////////////////////////////////////////////
// standard membist
// /////////////////////////////////////////////////////////////////////////////
//   0       1       2       3      4      5          6         7        8
// ^(W0);^(R0W1);^(R1W0);v(R0W1);v(R1W0);v(R0);^(W1W0*R1R0W0);^(W1);v(W0W1*R0R1W1);
//   

// mbist address:



   
// /////////////////////////////////////////////////////////////////////////////
//
// CAM BIST:
//
// /////////////////////////////////////////////////////////////////////////////

// cambistwork


  // - ctest 0:  match camdata 0
  //    - write data 0 ^(W0);
  //    - cam data 0   ^(W0C0RxW1);
  //    this requires (cseq0, cseq1, cseq2, cseq3)
  // - ctest 1:  match camdata 1
  //    - write data 1 ^(W1);
  //    - camdata 1    ^(W1C1RxW0);
  //    this requires (cseq0, cseq1, cseq2, cseq3)
  // - ctest 2:  walking1 mismatch
  //    - write 0
  //    - walking 1
  // 

   // ctest0:
   // cseq0:                   camdata
   //    crw0  write              0
   // cseq1:
   //    crw0  write              1
   //    crw1  cam                1
   //    crw2  write1             0
   //    crw3  dead cycle         0

   // cseq1:                   camdata  (valid bit test)
   //    crw0  write              0
   // cseq2:
   //    crw0  write              1
   //    crw1  cam                1
   //    crw2  write1             0
   //    crw3  dead cycle         0

   // ctest1:
   // cseq0:                   camdata
   //    crw0  write              1
   // cseq1:
   //    crw0  write              0
   //    crw1  cam                0
   //    crw2  write1             1
   //    crw3  dead cycle         0
   // cseq2:                   camdata (valid bit test)
   //    crw0  write              1
   // cseq3:
   //    crw0  write              0
   //    crw1  cam                0
   //    crw2  write1             1
   //    crw3  dead cycle         0


   // ctest2:                   camdata
   // cseq0:   write              0
   // cseq1-2: walkin1           N/A
   //          cam_zer0
   //          cam_walk1


   l2t_mb0_ctl_msff_ctl_macro__width_19 cam_cntl_reg  (
              .scan_in(cam_cntl_reg_scanin),
              .scan_out(cam_cntl_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
                 .din      ( cam_in[18:0]       ),
                 .dout     ( cam_out[18:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   l2t_mb0_ctl_msff_ctl_macro__width_1 cam_shift_reg  (
              .scan_in(cam_shift_reg_scanin),
              .scan_out(cam_shift_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
                 .din      ( cam_shift_val       ),
                 .dout     ( cam_shift      ),
  .siclk(siclk),
  .soclk(soclk));


   assign cam_msb           = start_in & cam_out[18];    //

   assign cam_array_sel[1:0]     = mb_user_cam_mode  ? 2'b11:
                                                     cam_out[17:16];    // 2 bits

   assign cam_panel_sel[1:0]     = cam_out[15:14];

//   assign ctest[1:0]             = mb_user_cam_mode ? user_cam_test_sel[1:0] :
   assign ctest[1:0]             = mb_user_cam_mode ? 2'b11 :
                                                cam_out[13:12];    //   

   assign cam_cseq[1:0]                =   sel_cseq_pass ? 2'b11 :  cam_out[11:10];   

//   assign cam_addr[7:0]          =   (ctest2_out & cseq2_out) ? cam_out[9:2]:
//                                     (ctest3_out & cseq2_out) ? cam_out[9:2]:
//                                     (cam_walk1 & cseq3_out)   ? {4'b1111,cam_out[5:2]}:
//                                                                 cam_out[9:2];

   assign cam_addr[7:0]          =  (ctest2 | ctest3) & cseq1 ?  {1'b1,  cam_out[8:2]}:
                                                                 {2'b11, cam_out[7:2]};
                                                          
                                     
//   assign cam_crw[1:0]               =   (cseq2_out) ? 2'b11:
//                                         (ctest2_out) ? 2'b11:
//                                         (ctest3_out) ? 2'b11:
//                                               cam_out[1:0];    // read write control


   assign cam_crw[1:0]               =   sel_crw_pass ? 2'b11:
                                               cam_out[1:0];    // read write control



   assign crw[1:0] = cam_out[1:0];

   assign sel_cseq_pass = (ctest2  & cseq1) |
                          (ctest3  & cseq2) ;

   assign sel_crw_pass = ((cseq0 | cseq2 | ((ctest2 | ctest3) & cseq1)) & cambist);

//   assign ctest2_out=cam_out[13:12]==2'b10;
//   assign ctest3_out=cam_out[13:12]==2'b11;


   assign ctest0  =  ctest_sel[1:0]==2'b00 & cambist;
   assign ctest1  =  ctest_sel[1:0]==2'b01 & cambist;
   assign ctest2  =  ctest_sel[1:0]==2'b10 & cambist;
   assign ctest3  =  ctest_sel[1:0]==2'b11 & cambist;

   assign cseq0   = ~( cseq[1] |  cseq[0]);
   assign cseq1   = ~( cseq[1] | ~cseq[0]);
   assign cseq2   = ~(~cseq[1] |  cseq[0]);
   assign cseq3   = ~(~cseq[1] | ~cseq[0]);

   assign crw0    = ~( crw[1] |  crw[0]);
   assign crw1    = ~( crw[1] | ~crw[0]);
   assign crw2    = ~(~crw[1] |  crw[0]);
   assign crw3    = ~(~crw[1] | ~crw[0]);

   // use lookup_wdata for write data and cam data
   // bit 15 valid, bit 14 parity
   assign lookup_wdata[15:0] = (ctest0 & (cseq1 | cseq3) & (crw0 | crw1 | crw2)) |
                               (ctest1 & (cseq0 | cseq2) & crw0) |
                               (ctest1 & (cseq1 | cseq3) & crw3) |
                               (ctest2 & cseq0)   ? 16'hBFFF:
                               (ctest3 & cseq0 )  ? 16'h8000:
                               (ctest3 & cseq2 )  ? 16'h0000:
                               (ctest3 & cam_zero)              ? 16'h8001:
                               (ctest3 & cam_shift)             ? {2'b10,mb0_l2t_lookup_wdata[12:0],1'b0}:
                               (ctest2 & cam_zero)              ? 16'hBFFE:
                               (ctest2 & cam_shift)             ? {2'b10,mb0_l2t_lookup_wdata[12:0],1'b1}:
                                                         16'h8000;


   assign l2_mask[7:0] =       (ctest0 & cseq1 ) |
                               (ctest1 & cseq1 ) ? 8'hFF:
                                                   8'h00;


//   assign cam_wr_en = (ctest0 & cseq2) ? crw3 :
//                      (ctest0 & cseq3) ? (crw0 | crw2) :
//                      (ctest1 & cseq2) ? crw3 :
//                      (ctest1 & cseq3) ? (crw0 | crw2) :
//                      (ctest2 & cseq2) ? crw3 :
//                      (ctest3 & cseq2) ? crw3 :
//                                        1'b0;


    assign cam_wr_en = ( ctest0 & (cseq0 | cseq2)  & crw0) | 
                       ( ctest0 & (cseq1 | cseq3) & (crw0 | crw3)) |
                       ( ctest1 & (cseq0 | cseq2) & crw0) | 
                       ( ctest1 & (cseq1 | cseq3)  & (crw0 | crw3)) |
                       ( ctest2 & cseq0 & crw0) |
                       ( ctest3 & cseq0 & crw0) |
                       ( ctest3 & cseq2 ) ; 

//   assign cam_en    = (ctest0 & cseq3) ? crw1 :
//                      (ctest1 & cseq3) ? crw1 :
//                      (ctest2 & cseq3) ? cam_shift :
//                      (ctest3 & cseq3) ? cam_shift :
//                                        1'b0;

   assign cam_en    = (ctest0 & (cseq1 | cseq3) & (crw1 | crw2)) |
                      (ctest1 & (cseq1 | cseq3) & (crw1 | crw2)) |
                      (cam_shift  | cam_zero);              // valid bit test


  assign cam_walk1 = (ctest2 | ctest3) & cseq1;

//  assign end_shift = cam_walk1 & (tlb_addr[6] & tlb_addr[5] & ~tlb_addr[4] & tlb_addr[3] & ~tlb_addr[2] & ~tlb_addr[1] & ~tlb_addr[0]);

  assign cam_zero  = ~|cam_addr[6:0] & cam_walk1 & cseq1;

  assign end_shift =  cambist ? (cam_walk1 & (cam_addr[7:0]==8'b10001101)):
                              1'b0;


  assign cam_shift_val =   ~cambist | end_shift  ? 1'b0 :
                            cam_zero & cseq1   ? 1'b1 :
                                                  cam_shift;
  
   
   assign qual_cam[18:0]={cam_msb,
              			  cam_array_sel[1:0],			  			  
              			  cam_panel_sel[1:0],			  			  
              			  ctest[1:0],
              			  cam_cseq[1:0],
                          cam_addr[7:0],
			              cam_crw[1:0]};

   assign cam_in[18:0]=reset_engine          ? 19'b0:                    // set zero
	                   ~run3  | ~cambist     ? qual_cam[18:0]:           // save value                
	                                           qual_cam[18:0]+19'h1;     // increment


   assign mb_icrow0_cam_hit= ic_cam_fail[0] & icrow_sel_d3[0];
   assign mb_icrow1_cam_hit= ic_cam_fail[1] & icrow_sel_d3[1];
   assign mb_dcrow0_cam_hit= dc_cam_fail[0] & dcrow_sel_d3[0];
   assign mb_dcrow1_cam_hit= dc_cam_fail[1] & dcrow_sel_d3[1];



   l2t_mb0_ctl_msff_ctl_macro__width_4  cam_hit_reg  (
              .scan_in(cam_hit_reg_scanin),
              .scan_out(cam_hit_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      (  {mb_icrow0_cam_hit, mb_icrow1_cam_hit, mb_dcrow0_cam_hit, mb_dcrow1_cam_hit}   ),
               .dout     (  {icrow0_cam_hit,    icrow1_cam_hit,    dcrow0_cam_hit,    dcrow1_cam_hit}  ),
  .siclk(siclk),
  .soclk(soclk));



   l2t_mb0_ctl_msff_ctl_macro__width_5  exp_cam_hit_delay_reg  (
              .scan_in(exp_cam_hit_delay_reg_scanin),
              .scan_out(exp_cam_hit_delay_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      (  {cam_hit_cmp,   cam_hit_cmp_d1,cam_hit_cmp_d2,cam_hit_cmp_d3, cam_hit_cmp_d4}),
               .dout     (  {cam_hit_cmp_d1,cam_hit_cmp_d2,cam_hit_cmp_d3,cam_hit_cmp_d4, cam_hit_cmp_d5}),
  .siclk(siclk),
  .soclk(soclk));


   l2t_mb0_ctl_msff_ctl_macro__width_5  exp_cam_exp_delay_reg  (
              .scan_in(exp_cam_exp_delay_reg_scanin),
              .scan_out(exp_cam_exp_delay_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      (  {cam_hit_exp,   cam_hit_exp_d1,cam_hit_exp_d2,cam_hit_exp_d3, cam_hit_exp_d4}),
               .dout     (  {cam_hit_exp_d1,cam_hit_exp_d2,cam_hit_exp_d3,cam_hit_exp_d4, cam_hit_exp_d5}),
  .siclk(siclk),
  .soclk(soclk));



   l2t_mb0_ctl_msff_ctl_macro__width_10  cam_sel_icrow_delay_reg  (
              .scan_in(cam_sel_icrow_delay_reg_scanin),
              .scan_out(cam_sel_icrow_delay_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      (  {mb0_l2t_icrow_row_en[1:0],icrow_sel_d1[1:0],icrow_sel_d2[1:0],icrow_sel_d3[1:0],icrow_sel_d4[1:0]}),
               .dout     (  {icrow_sel_d1[1:0],        icrow_sel_d2[1:0],icrow_sel_d3[1:0],icrow_sel_d4[1:0],icrow_sel_d5[1:0]}),
  .siclk(siclk),
  .soclk(soclk));


   l2t_mb0_ctl_msff_ctl_macro__width_10  cam_sel_dcrow_delay_reg  (
              .scan_in(cam_sel_dcrow_delay_reg_scanin),
              .scan_out(cam_sel_dcrow_delay_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      (  {mb0_l2t_dcrow_row_en[1:0],dcrow_sel_d1[1:0],dcrow_sel_d2[1:0],dcrow_sel_d3[1:0],dcrow_sel_d4[1:0]}),
               .dout     (  {dcrow_sel_d1[1:0],        dcrow_sel_d2[1:0],dcrow_sel_d3[1:0],dcrow_sel_d4[1:0],dcrow_sel_d5[1:0]}),
  .siclk(siclk),
  .soclk(soclk));

   
   assign cam_hit_cmp =cam_en;

   assign cam_hit_exp =(ctest0 & cseq1 & crw1) |
                       (ctest0 & cseq3 & (crw1 | crw2)) |
                       (ctest1 & cseq1 & crw1) |
                       (ctest1 & cseq3 & (crw1 | crw2)) ;




   assign icrow0_cam_pass = (~cam_hit_cmp_d5) |  (cam_hit_cmp_d5 & (cam_hit_exp_d5 == icrow0_cam_hit));
   assign icrow1_cam_pass = (~cam_hit_cmp_d5) |  (cam_hit_cmp_d5 & (cam_hit_exp_d5 == icrow1_cam_hit));
   assign dcrow0_cam_pass = (~cam_hit_cmp_d5) |  (cam_hit_cmp_d5 & (cam_hit_exp_d5 == dcrow0_cam_hit));
   assign dcrow1_cam_pass = (~cam_hit_cmp_d5) |  (cam_hit_cmp_d5 & (cam_hit_exp_d5 == dcrow1_cam_hit));


   assign icrow0_cam_fail = ~icrow0_cam_pass & icrow_sel_d5[0];
   assign icrow1_cam_fail = ~icrow1_cam_pass & icrow_sel_d5[1];
   assign dcrow0_cam_fail = ~dcrow0_cam_pass & dcrow_sel_d5[0];
   assign dcrow1_cam_fail = ~dcrow1_cam_pass & dcrow_sel_d5[1];






   assign cambist     = ((mb_user_cam_mode | (cntl_msb & ~bisi_mode)) & (valid_fail & ~mb_user_ram_mode));


   assign cam_0       = (cam_sel[1:0]==2'b00) & cambist;
   assign cam_1       = (cam_sel[1:0]==2'b01) & cambist;
   assign cam_2       = (cam_sel[1:0]==2'b10) & cambist;
   assign cam_3       = (cam_sel[1:0]==2'b11) & cambist;



   

 


//   assign  icrow_rd = mb_array_0_rd | mb_array_1_rd;
//   assign  icrow_wr = mb_array_0_wr | mb_array_1_wr;

//   assign  dcrow_rd = mb_array_2_rd | mb_array_3_rd;
//   assign  dcrow_wr = mb_array_2_wr | mb_array_3_wr;


// cam signals

assign icrow_lookup_en[0]=cam_en & (cam_0 | cam_1) & cam_panel_en_0;
assign icrow_lookup_en[1]=cam_en & (cam_0 | cam_1) & cam_panel_en_1;
assign icrow_lookup_en[2]=cam_en & (cam_0 | cam_1) & cam_panel_en_2;
assign icrow_lookup_en[3]=cam_en & (cam_0 | cam_1) & cam_panel_en_3;

assign dcrow_lookup_en[0]=cam_en & (cam_2 | cam_3) & cam_panel_en_0;
assign dcrow_lookup_en[1]=cam_en & (cam_2 | cam_3) & cam_panel_en_1;
assign dcrow_lookup_en[2]=cam_en & (cam_2 | cam_3) & cam_panel_en_2;
assign dcrow_lookup_en[3]=cam_en & (cam_2 | cam_3) & cam_panel_en_3;
  

  assign icrow_row_en[0]=array_0 | cam_0;
  assign icrow_row_en[1]=array_1 | cam_1;

  assign dcrow_row_en[0]=array_2 | cam_2;
  assign dcrow_row_en[1]=array_3 | cam_3;


  assign panel_en_0     =  cmp_0 & ~cambist;
  assign panel_en_1     =  cmp_1 & ~cambist;
  assign panel_en_2     =  cmp_2 & ~cambist;
  assign panel_en_3     =  cmp_3 & ~cambist;


  assign cam_panel_en_0     = ~( cam_panel_sel[1] |  cam_panel_sel[0]) & cambist; 
  assign cam_panel_en_1     = ~( cam_panel_sel[1] | ~cam_panel_sel[0]) & cambist;
  assign cam_panel_en_2     = ~(~cam_panel_sel[1] |  cam_panel_sel[0]) & cambist;
  assign cam_panel_en_3     = ~(~cam_panel_sel[1] | ~cam_panel_sel[0]) & cambist;



   assign icrow_arrays   = array_0 | array_1 | cam_0 | cam_1;
   assign dcrow_arrays   = array_2 | array_3 | cam_2 | cam_3;

   assign icrow_panel_en[0]   = icrow_arrays & (panel_en_0 | cam_panel_en_0);
   assign icrow_panel_en[1]   = icrow_arrays & (panel_en_1 | cam_panel_en_1);
   assign icrow_panel_en[2]   = icrow_arrays & (panel_en_2 | cam_panel_en_2);
   assign icrow_panel_en[3]   = icrow_arrays & (panel_en_3 | cam_panel_en_3);

   assign dcrow_panel_en[0]   = dcrow_arrays & (panel_en_0 | cam_panel_en_0);        
   assign dcrow_panel_en[1]   = dcrow_arrays & (panel_en_1 | cam_panel_en_1);
   assign dcrow_panel_en[2]   = dcrow_arrays & (panel_en_2 | cam_panel_en_2);
   assign dcrow_panel_en[3]   = dcrow_arrays & (panel_en_3 | cam_panel_en_3);






l2t_mb0_ctl_msff_ctl_macro__width_21		mbist_output_reg		 (
              .scan_in(mbist_output_reg_scanin),
              .scan_out(mbist_output_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
 .din  ({
         cambist,
         icrow_lookup_en[3:0],
         icrow_row_en[1:0],
         icrow_panel_en[3:0],
         dcrow_lookup_en[3:0],
         dcrow_row_en[1:0],
         dcrow_panel_en[3:0]
         }),
 .dout ({
         mb0_l2t_cambist,
         mb0_l2t_icrow_lookup_en[3:0],
         mb0_l2t_icrow_row_en[1:0],
         mb0_l2t_icrow_panel_en[3:0],
         mb0_l2t_dcrow_lookup_en[3:0],
         mb0_l2t_dcrow_row_en[1:0],
         mb0_l2t_dcrow_panel_en[3:0]
          }),
  .siclk(siclk),
  .soclk(soclk));

assign mb_lookup_wdata[15:0] = cambist ? lookup_wdata[15:0] :
                                        {mem_data[7:0],mem_data[7:0]};

l2t_mb0_ctl_msff_ctl_macro__width_16		mbist_output_data_reg		 (
 .scan_in(mbist_output_data_reg_scanin),
 .scan_out(mbist_output_data_reg_scanout),
 .l1clk( l1clk_pm1				),
 .din  (mb_lookup_wdata[15:0]),
 .dout (mb0_l2t_lookup_wdata[15:0]),
  .siclk(siclk),
  .soclk(soclk)
        );



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////   ////////////////////////////////////
//  CONTROL REG:
////////////////////////////////////   ////////////////////////////////////


   l2t_mb0_ctl_msff_ctl_macro__width_36 cntl_reg  (
                 .scan_in(cntl_reg_scanin),
                 .scan_out(cntl_reg_scanout),
                 .l1clk( l1clk_pm1				),
                 .din      ( cntl_in[35:0]       ),
                 .dout     ( cntl_out[35:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign cntl_in[35:19]   = reset_engine   ? {17'b000000_0000000000}:
     	                     (~run3 | cambist)          ? cntl_algr[16:0]:	  
	                                          next_algr[16:0];

   
//   assign cntl_in[12:3]    = reset_engine ? start_addr[7:0]:
//	                         ~run3        ? cntl_addr[7:0]:
//	                                        next_addr[7:0];

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
   assign sel_nextaddr_same     = ~(sel_nextaddr_reset | sel_nextaddr_restart | sel_nextaddr_incred) | cambist;

   assign cntl_in[10:3] = ({8{sel_nextaddr_reset}} & start_addr[7:0]) |
                          ({8{sel_nextaddr_restart}} & restart_addr[7:0]) |
                          ({8{sel_nextaddr_incred}} & incred_addr[7:0]) |
                          ({8{sel_nextaddr_same}} & cntl_addr[7:0]);  
   

   
   assign cntl_in[18:11]  =  8'b00000000;

   
   assign cntl_in[2:0]     = reset_engine  ? 3'b000 : 
                             (~run3 | cambist)          ? cntl_rw[2:0]:
                                             next_rw[2:0];



////////////////////////////////////   ////////////////////////////////////
//  NEXT ALGR
////////////////////////////////////   ////////////////////////////////////

   // msb
   assign cntl_msb                    =       start_in & cntl_out[   35];    // done selection


   assign cntl_bisi                    =       mb_default_bisi | mb_user_bisi_rw_mode ? cntl_out[34] :
                                                                                        1'b1;


   // array
   assign cntl_array_sel[3:0]        =       (user_mode | last_array)     ? 4'b1111:
                                                            cntl_out[33:30];    // array selection 
   // cmpel
   assign cntl_cmp_sel[3:0]  = sel_cmp_pass ? {4'b1111} :
                                              cntl_out[29:26];

   // data
   assign cntl_data_sel[1:0]          =   (bisi_mode | mb_user_data_mode)  ? 2'b11 :    cntl_out[25:24];    // data selection

   // address mix
   assign cntl_addr_mix               =   (mb_user_addr_mode | bisi_mode) ? 1'b1  :    cntl_out[   23];    // address mix



   assign cntl_march_element[3:0]     =   sel_march_1_pass  ? 4'b1111:
                                                              cntl_out[22:19];    // march element

   assign addr_mix = (bisi_mode | mb_user_addr_mode) ? 1'b0 :
                                                       cntl_addr_mix;


   assign cntl_algr[16:0] =       {cntl_msb,
                                   cntl_bisi,
                                   cntl_array_sel[3:0],
			                       cntl_cmp_sel[3:0],
			                       cntl_data_sel[1:0],
			                       cntl_addr_mix,
			                       cntl_march_element[3:0]};

   assign next_algr[16:0] = cout_addr ? cntl_algr[16:0] + 17'h1 : cntl_algr[16:0];         // mbist control




////////////////////////////////////   ////////////////////////////////////
//  NEXT ADDR
////////////////////////////////////   ////////////////////////////////////


   /////////////////////////
   // address engine
   /////////////////////////


   assign upaddr           =    march_0 | march_1 | march_2 | march_6 | march_7 | bisi_mode ;
                                

   assign march_element_pre[3:0]=next_algr[3:0];

   assign march_pre_0   = march_element_pre[3:0]==4'h0;
   assign march_pre_1   = march_element_pre[3:0]==4'h1;
   assign march_pre_2   = march_element_pre[3:0]==4'h2;
   assign march_pre_6   = march_element_pre[3:0]==4'h6;
   assign march_pre_7   = march_element_pre[3:0]==4'h7;

   assign upaddr_pre =     march_pre_0 | march_pre_1 | march_pre_2 | march_pre_6 | march_pre_7;


   assign incr_addr[7:0]  = mb_user_addr_mode ? user_incr_addr[7:0] :  8'b00000001;

   assign start_addr[7:0] = mb_user_addr_mode ? user_start_addr[7:0] : 8'b00000000;
   
   
//   assign next_addr_out[8:0] = cout_rw ? cntl_addr[8:0] + incr_addr[8:0] : cntl_addr[8:0];    // next address


   assign incred_addr[7:0] = cntl_addr[7:0] + incr_addr[7:0];


   assign overflow   = upaddr   ? ( cntl_addr[7:0] == stop_addr[7:0])  & (cntl_rw[2:0]==3'b111):
                                  (~cntl_addr[7:0] == start_addr[7:0]) & (cntl_rw[2:0]==3'b111);


//   assign next_addr[7:0]= overflow ? restart_addr[7:0] : next_addr_out[7:0];
  
   assign restart_addr[7:0] = upaddr_pre ? start_addr[7:0] : ~stop_addr[7:0];
      
   assign cout_addr =  overflow;




////////////////////////////////////   ////////////////////////////////////
//  NEXT RW
////////////////////////////////////   ////////////////////////////////////


   assign cntl_rw[2:0]                =   sel_rw_pass      ? 3'b111: 
                                                               cntl_out[ 2: 0];    // read write control

   assign next_rw[2:0] = cntl_rw[2:0]+3'b001 ;              
   
   assign cout_rw = &cntl_rw[2:0];     // carry over for rw 





////////////////////////////////////   ////////////////////////////////////
//  MBIST CONTROL SIGNAL
//  - mem_wr
////////////////////////////////////   ////////////////////////////////////


   assign one_cycle_march  =  march_0 | march_5 | march_7;
   assign five_cycle_march =  march_6 | march_8;
   assign two_cycle_march  = ~(one_cycle_march | five_cycle_march);


   /////////////////////////
   // membist write enable
   /////////////////////////


    assign mem_wr_pbi     = run3 & (
                               march_0 |
                               ((march_1 | march_2 | march_3 | march_4 ) & rw_1) |
                               (march_6 & (rw_0 | rw_1 | rw_4)) |
                               march_7 |
                               (march_8 & (rw_0 | rw_1 | rw_4))
                               );  


   assign mem_wr = bisi_wr_mode ? 1'b1 :
                   bisi_rd_mode ? 1'b0 :
                                  mem_wr_pbi;

   /////////////////////////
   // membist read enable
   /////////////////////////

                                            

      assign mem_rd_pbi         =     run3   &      ~mem_wr;  

   assign mem_rd= bisi_rd_mode ? 1'b1 : mem_rd_pbi;

   /////////////////////
   // membist address:
   ////////////////////

   assign cntl_addr[7:0]   = cntl_out[10:3];

   assign adj_addr          = (five_cycle_march & (rw_1 | rw_3)) ? {cntl_addr[7:4],~cntl_addr[3],cntl_addr[2:0]}:
                                                                      cntl_addr[7:0] ;

   assign mem_addr1[7:0]    = upaddr   ?  adj_addr[7:0]:  ~adj_addr[7:0];



   /////////////////////
   // true data
   ////////////////////

   assign true_data_l     =    bisi_mode |
                             march_0   |
                             (march_1 & rw_0)   |
                             (march_2 & rw_1)   |
                             (march_3 & rw_0)   |
                             (march_4 & rw_1)   |
                             (march_5)   |
                             (march_6 & (rw_1 | rw_3 | rw_4))   |
                             (march_8 & (rw_0 | rw_2));

   assign true_data=~true_data_l;

   /////////////////////
   // membist data:
   ////////////////////

   assign data_pat_sel[7:0]        =     (mb_user_data_mode & bisi_mode)         ?   ~user_data[7:0]:
                                         (mb_user_data_mode)                     ?    user_data[7:0]:
                                         bisi_mode                               ?    8'hFF: 
                                         (cntl_data_sel[1:0] == 2'h0)            ?    8'hAA:
                                         (cntl_data_sel[1:0] == 2'h1)            ?    8'h99:
                                         (cntl_data_sel[1:0] == 2'h2)            ?    8'hCC:
                                                                                      8'h00;
   assign mem_data[7:0]         = true_data ? data_pat_sel[7:0] : ~data_pat_sel[7:0];


////////////////////////////////////   ////////////////////////////////////
//  STOP ADDR
////////////////////////////////////   ////////////////////////////////////

   assign stop_addr[7:0]  = mb_user_addr_mode ? user_stop_addr[7:0] : 
                                                   array_0   ?  8'b00111111:  // icrow0
                                                   array_1   ?  8'b00111111:  // icrow1
                                                   array_2   ?  8'b00111111:  // dcrow0
                                                   array_3   ?  8'b00111111:  // dcrow1
                                                   array_4   ?  8'b00001111:  // oqarray
                                                                8'b00111111;


////////////////////////////////////   ////////////////////////////////////
//  ADDR MIX
////////////////////////////////////   ////////////////////////////////////


   assign mem_addr[7:0]   =   (addr_mix & (array_0 | array_1 | array_2 | array_3)) 
                                                        ? {mem_addr1[7:6],mem_addr1[0],mem_addr1[5:1]} : // done
                              (addr_mix & array_4) ? {mem_addr1[7:4],mem_addr1[0],mem_addr1[3:1]} : // done
                                                          mem_addr1[7:0];




////////////////////////////////////   ////////////////////////////////////
//  SEQ selection
////////////////////////////////////   ////////////////////////////////////

    // array

    assign array_0     = array_sel[3:0]==4'h0 & ~cambist;
    assign array_1     = array_sel[3:0]==4'h1 & ~cambist;
    assign array_2     = array_sel[3:0]==4'h2 & ~cambist;
    assign array_3     = array_sel[3:0]==4'h3 & ~cambist;
    assign array_4     = array_sel[3:0]==4'h4 & ~cambist;

    assign last_array = array_4;
   // cmp
   assign cmp_0       = cmp_sel[3:0]==4'b0000;
   assign cmp_1       = cmp_sel[3:0]==4'b0001;
   assign cmp_2       = cmp_sel[3:0]==4'b0010;
   assign cmp_3       = cmp_sel[3:0]==4'b0011;
//   assign cmp_4       = cmp_sel[3:0]==4'b0100;
//   assign cmp_5       = cmp_sel[3:0]==4'b0101;
//   assign cmp_6       = cmp_sel[3:0]==4'b0110;
//   assign cmp_7       = cmp_sel[3:0]==4'b0111;
//   assign cmp_15      = cmp_sel[3:0]==4'b1111;

   // march

   assign march_0   = (march_element[3:0]==4'h0);
   assign march_1   = (march_element[3:0]==4'h1);
   assign march_2   = (march_element[3:0]==4'h2);
   assign march_3   = (march_element[3:0]==4'h3);
   assign march_4   = (march_element[3:0]==4'h4);
   assign march_5   = (march_element[3:0]==4'h5);
   assign march_6   = (march_element[3:0]==4'h6);
   assign march_7   = (march_element[3:0]==4'h7);
   assign march_8   = (march_element[3:0]==4'h8);

   // rw

   assign rw_0           =  (rw[2:0]==3'b000);
   assign rw_1           =  (rw[2:0]==3'b001);
   assign rw_2           =  (rw[2:0]==3'b010);
   assign rw_3           =  (rw[2:0]==3'b011);
   assign rw_4           =  (rw[2:0]==3'b100);
//   assign rw_5           =  (rw[2:0]==3'b101);
//   assign rw_6           =  (rw[2:0]==3'b110);
//   assign rw_7           =  (rw[2:0]==3'b111);





////////////////////////////////////   ////////////////////////////////////
//  SEQ logic
////////////////////////////////////   ////////////////////////////////////

   // cseq


  assign cseq_cntl_out[1:0]=cam_out[11:10];


  l2t_mb0_ctl_msff_ctl_macro__width_2 cseq_reg  (
              .scan_in(cseq_reg_scanin),
              .scan_out(cseq_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      ( cseq[1:0] ),
               .dout     ( cseq_out[1:0] ),
  .siclk(siclk),
  .soclk(soclk));

   assign cseq[1:0]=(&cseq_cntl_out[1:0] & ~(ctest0 | ctest1)) ? cseq_out[1:0] :
                                            cseq_cntl_out[1:0];

   
   // cam select logic

  assign cam_sel_cntl_out[1:0]=cam_out[17:16];


  assign cam_sel[1:0]= user_mode             ? user_cam_sel[1:0] :
                                               cam_sel_cntl_out[1:0];


   // ctest select logic

  assign ctest_sel_cntl_out[1:0]=cam_out[13:12];


  l2t_mb0_ctl_msff_ctl_macro__width_2 ctest_sel_reg  (
              .scan_in(ctest_sel_reg_scanin),
              .scan_out(ctest_sel_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      ( ctest_sel[1:0] ),
               .dout     ( ctest_sel_out[1:0] ),
  .siclk(siclk),
  .soclk(soclk));

   assign ctest_sel[1:0]=(&ctest_sel_cntl_out[1:0] & ~(ctest[1:0]==2'b11)) ? ctest_sel_out[1:0] :
                          mb_user_cam_mode          ? user_cam_test_sel[1:0] :
                                                     ctest_sel_cntl_out[1:0];


   // array logic

  assign array_sel_cntl_out[3:0]=cntl_out[33:30];


  l2t_mb0_ctl_msff_ctl_macro__width_4 array_sel_reg  (
              .scan_in(array_sel_reg_scanin),
              .scan_out(array_sel_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      ( array_sel[3:0] ),
               .dout     ( array_sel_out[3:0] ),
  .siclk(siclk),
  .soclk(soclk));

   assign array_sel[3:0]=(&array_sel_cntl_out[3:0]) ? array_sel_out[3:0] :
                          user_mode                 ? user_array_sel[3:0] :
                                                      array_sel_cntl_out[3:0];


  
   // cmp logic

   assign cmp_sel_cntl_out[3:0] = cntl_out[29:26];

   l2t_mb0_ctl_msff_ctl_macro__width_4 cmp_sel_reg  (
              .scan_in(cmp_sel_reg_scanin),
              .scan_out(cmp_sel_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      ( cmp_sel[3:0] ),
               .dout     ( cmp_sel_out[3:0] ),
  .siclk(siclk),
  .soclk(soclk));

   assign cmp_sel[3:0]=  (&cmp_sel_cntl_out[3:0] & ~array_4) ? cmp_sel_out[3:0] :
                           mb_user_cmpsel_hold               ? user_cmpsel[3:0] :
                                                               cmp_sel_cntl_out[3:0];
   

 // march logic                                          

  assign march_element_cntl_out[3:0]=cntl_out[22:19];


  l2t_mb0_ctl_msff_ctl_macro__width_4 marche_element_reg  (
              .scan_in(marche_element_reg_scanin),
              .scan_out(marche_element_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      ( march_element[3:0] ),
               .dout     ( march_element_out ),
  .siclk(siclk),
  .soclk(soclk));

   assign march_element[3:0]=(&march_element_cntl_out[3:0]) ? march_element_out[3:0] :
                                                              march_element_cntl_out[3:0];


   // rw
   assign rw[2:0]=cntl_out[2:0];





//////////////////////////////////////////////////////////////////
// SEL_PASS LOGIC
//////////////////////////////////////////////////////////////////


   // pass logic:





   // march
   assign sel_march_1_pass = bisi_mode | (ten_n_mode & march_5) | march_8 ;
 
   // cmp

   assign bisi_wr_mode = mb_default_bisi | mb_user_bisi_rw_mode ?  ~cntl_bisi & run3 :
                                                                   mb_user_bisi_wr_mode & run3;
                         
   assign bisi_rd_mode  =mb_default_bisi | mb_user_bisi_rw_mode ?  cntl_bisi & run3 :
                                                                   mb_user_bisi_rd_mode & run3;
                          


   // cmp


   assign sel_cmp_pass= (mb_user_cmpsel_hold ) |
                             (array_0 & cmp_3) |
                             (array_1 & cmp_3) |
                             (array_2 & cmp_3) |
                             (array_3 & cmp_3) |
                             (array_4 & cmp_3) ;



   // rw
   assign sel_rw_1_pass = bisi_mode | one_cycle_march ;

   assign sel_rw_2_pass = two_cycle_march;
   assign sel_rw_5_pass = five_cycle_march;

   assign sel_rw_pass = (run3 & sel_rw_1_pass & rw_0) |
                        (run3 & sel_rw_2_pass & rw_1) |
                        (run3 & sel_rw_5_pass & rw_4) ;











////////////////////////////////////   ////////////////////////////////////
//  membist control assignment
////////////////////////////////////   ////////////////////////////////////

			       

   assign mb_cmp_sel[0] = cmp_sel[1:0]==2'b00 & array_4; 
   assign mb_cmp_sel[1] = cmp_sel[1:0]==2'b01 & array_4; 
   assign mb_cmp_sel[2] = cmp_sel[1:0]==2'b10 & array_4; 
   assign mb_cmp_sel[3] = cmp_sel[1:0]==2'b11 & array_4; 


   assign mb_addr[7:0]= cambist ? cam_addr[7:0] : mem_addr[7:0];


   assign mb_write_data[7:0] = mem_data[7:0];

 

  // only one array read signal should be active   

   assign  mb_array_0_rd    = array_0  & mem_rd;
   assign  mb_array_1_rd    = array_1  & mem_rd;
   assign  mb_array_2_rd    = array_2  & mem_rd;
   assign  mb_array_3_rd    = array_3  & mem_rd;
   assign  mb_array_4_rd    = array_4  & mem_rd;

   
   assign  mb_array_0_wr    = (array_0  & mem_wr & run) | (cam_0 & cam_wr_en & run);
   assign  mb_array_1_wr    = (array_1  & mem_wr & run) | (cam_1 & cam_wr_en & run);
   assign  mb_array_2_wr    = (array_2  & mem_wr & run) | (cam_2 & cam_wr_en & run);
   assign  mb_array_3_wr    = (array_3  & mem_wr & run) | (cam_3 & cam_wr_en & run);
   assign  mb_array_4_wr    = array_4   & mem_wr & run;

   
   assign mb_run = run | ((cntl_msb | cam_msb) &  ~&done_delay[2:1]);




////////////////////////////////////   ////////////////////////////////////
//  DONE LOGIC
////////////////////////////////////   ////////////////////////////////////

   
     
   

  l2t_mb0_ctl_msff_ctl_macro__width_1  msb_latch  (
               .scan_in(msb_latch_scanin),
               .scan_out(msb_latch_scanout),
               .l1clk    ( l1clk_pm1	    ),
               .din      ( msb_in    ),
               .dout     ( msb_out  ),
  .siclk(siclk),
  .soclk(soclk));
   
   assign msb_in= (~start_in ) | (mb_user_loop_mode & mb_done) ? 1'b0 :
                   (cntl_msb | cam_msb)                        ? 1'b1 :
                                                                 msb_out;

   assign stop_engine_l     =  ~start_in ? 1'b0 :
                               mb_user_cam_mode                 ? cam_msb :
                               mb_user_loop_mode                ? cntl_msb :
                               (mb_user_ram_mode | bisi_mode)   ? cntl_msb :
                                                                  cam_msb;

   assign mb_done=  ~start_in ? 1'b0 :
                     bisi_mode | mb_user_loop_mode | mb_user_ram_mode ? msb_out & (done_delay[4:0]==5'b11110): 
                                       cam_msb & (done_delay[4:0]==5'b11110) ;
 
  assign  run3   = &done_delay[4:1] & ~stop_engine_l & start_in;


   l2t_mb0_ctl_msff_ctl_macro__width_1 run3_transition_reg  (
                  .scan_in(run3_transition_reg_scanin),
                  .scan_out(run3_transition_reg_scanout),
                  .l1clk    ( l1clk_pm1	          ),
                  .din      ( run3  ),
                  .dout     ( run3_out    ),
  .siclk(siclk),
  .soclk(soclk));

   assign run3_transition = run3 & ~run3_out;

   l2t_mb0_ctl_msff_ctl_macro__width_5 done_delay_reg  (
                  .scan_in(done_delay_reg_scanin),
                  .scan_out(done_delay_reg_scanout),
                  .l1clk    ( l1clk_pm1	          ),
                  .din      ( done_delay_in[4:0]  ),
                  .dout     ( done_delay[4:0]    ),
  .siclk(siclk),
  .soclk(soclk));


   assign done_delay_in[4:0] = run3         ?  5'b11111 :
                               mb_done      ?  5'b11110 :
                              (run & ~run3) ? done_delay[4:0] + 5'b00001 : 
                                                   5'b00000;





////////////////////////////////////   ////////////////////////////////////
//  FAIL LOGIC
////////////////////////////////////   ////////////////////////////////////



assign mb_ic0_rw_fail = (array_0 & mb_ic_rw_fail);
assign mb_ic1_rw_fail = (array_1 & mb_ic_rw_fail);
assign mb_dc0_rw_fail = (array_2 & mb_dc_rw_fail);
assign mb_dc1_rw_fail = (array_3 & mb_dc_rw_fail);

assign mb_oqarray_rw_fail = ~oqarray_rw_fail;

assign ic0_fail_d         = run3_transition ? 1'b0 : mb_ic0_rw_fail       | ic0_fail_sticky;
assign ic1_fail_d         = run3_transition ? 1'b0 : mb_ic1_rw_fail       | ic1_fail_sticky;
assign dc0_fail_d         = run3_transition ? 1'b0 : mb_dc0_rw_fail       | dc0_fail_sticky;
assign dc1_fail_d         = run3_transition ? 1'b0 : mb_dc1_rw_fail       | dc1_fail_sticky;
assign oqarray_fail_d     = run3_transition ? 1'b0 : mb_oqarray_rw_fail   | oqarray_fail_sticky;
assign icrow0_cam_fail_d  = run3_transition ? 1'b0 : icrow0_cam_fail      | icrow0_cam_fail_sticky;
assign icrow1_cam_fail_d  = run3_transition ? 1'b0 : icrow1_cam_fail      | icrow1_cam_fail_sticky;
assign dcrow0_cam_fail_d  = run3_transition ? 1'b0 : dcrow0_cam_fail      | dcrow0_cam_fail_sticky;
assign dcrow1_cam_fail_d  = run3_transition ? 1'b0 : dcrow1_cam_fail      | dcrow1_cam_fail_sticky;


l2t_mb0_ctl_msff_ctl_macro__width_9		mbist_fail_input_reg		 (
              .scan_in(mbist_fail_input_reg_scanin),
              .scan_out(mbist_fail_input_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
 .din  ({ic0_fail_d,
         ic1_fail_d,
         dc0_fail_d,
         dc1_fail_d,
         oqarray_fail_d,
         icrow0_cam_fail_d,
         icrow1_cam_fail_d,
         dcrow0_cam_fail_d,
         dcrow1_cam_fail_d
       }),
 .dout ({ic0_fail_sticky,
         ic1_fail_sticky,
         dc0_fail_sticky,
         dc1_fail_sticky,
         oqarray_fail_sticky,
         icrow0_cam_fail_sticky,
         icrow1_cam_fail_sticky,
         dcrow0_cam_fail_sticky,
         dcrow1_cam_fail_sticky
       }),
  .siclk(siclk),
  .soclk(soclk));



assign mbist_fail_sticky = ic0_fail_sticky |
                 		   ic1_fail_sticky |
                 		   dc0_fail_sticky |
                 		   dc1_fail_sticky |
                           oqarray_fail_sticky |
                           icrow0_cam_fail_sticky |
                           icrow1_cam_fail_sticky |
                           dcrow0_cam_fail_sticky |
                           dcrow1_cam_fail_sticky; 


assign mbist_fail_array = mb_ic0_rw_fail |
                          mb_ic1_rw_fail |
                          mb_dc0_rw_fail |
                          mb_dc1_rw_fail |
                          mb_oqarray_rw_fail  |
                          icrow0_cam_fail  |
                          icrow1_cam_fail  |
                          dcrow0_cam_fail  |
                          dcrow1_cam_fail  ;




assign valid_fail=run3 | (stop_engine_l & ~mb_done);


assign mb_fail = mb_done ? mbist_fail_sticky : mbist_fail_array & valid_fail;




//////////////////////////////////////////////////////////////////
// OUTPUT FLOP:
//////////////////////////////////////////////////////////////////

// mb_done


l2t_mb0_ctl_msff_ctl_macro__width_1  out_mb_tcu_done_reg  (
              .scan_in(out_mb_tcu_done_reg_scanin),
              .scan_out(out_mb_tcu_done_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      (  mb_done   ),
               .dout     (  mb_done_out  ),
  .siclk(siclk),
  .soclk(soclk));


l2t_mb0_ctl_msff_ctl_macro__width_8  inv_mask_reg  (
              .scan_in(inv_mask_reg_scanin),
              .scan_out(inv_mask_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      (  l2_mask[7:0]   ),
               .dout     (  mb0_l2t_mask[7:0]  ),
  .siclk(siclk),
  .soclk(soclk));


// mb_fail


l2t_mb0_ctl_msff_ctl_macro__width_1 out_mb_tcu_fail_reg  (
              .scan_in(out_mb_tcu_fail_reg_scanin),
              .scan_out(out_mb_tcu_fail_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      (  mb_fail   ),
               .dout     (  mb_fail_out  ),
  .siclk(siclk),
  .soclk(soclk));




// out cmpsel

l2t_mb0_ctl_msff_ctl_macro__width_4		out_cmp_sel_reg		 (
              .scan_in(out_cmp_sel_reg_scanin),
              .scan_out(out_cmp_sel_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
 .din  ({
	 mb_cmp_sel[3:0]	}			),
 .dout ({
	 mb_cmpsel_out[3:0]}		),
  .siclk(siclk),
  .soclk(soclk));



// thes are all the output flops to arrays
// for the following signals:
//
// - run
// - data
// - address


l2t_mb0_ctl_msff_ctl_macro__width_1		out_run_mb_arrays_reg		 (
              .scan_in(out_run_mb_arrays_reg_scanin),
              .scan_out(out_run_mb_arrays_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
 .din  ( mb_run),
 .dout ( mb_run_out),
  .siclk(siclk),
  .soclk(soclk));

// data 8 bits

l2t_mb0_ctl_msff_ctl_macro__width_8		out_data_mb_arrays_reg		 (
              .scan_in(out_data_mb_arrays_reg_scanin),
              .scan_out(out_data_mb_arrays_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
 .din  ( mb_write_data[7:0]),
 .dout ( mb_write_data_out[7:0]),
  .siclk(siclk),
  .soclk(soclk));


// address 16 bits


l2t_mb0_ctl_msff_ctl_macro__width_8		out_addr_mb_arrays_reg		 (
              .scan_in(out_addr_mb_arrays_reg_scanin),
              .scan_out(out_addr_mb_arrays_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
 .din  ( mb_addr[7:0]),
 .dout ( mb_addr_out[7:0]),
  .siclk(siclk),
  .soclk(soclk));




// write enable

l2t_mb0_ctl_msff_ctl_macro__width_5		out_wr_mb_arrays_reg		 (
              .scan_in(out_wr_mb_arrays_reg_scanin),
              .scan_out(out_wr_mb_arrays_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
 .din  ( {
          mb_array_0_wr,
          mb_array_1_wr,
          mb_array_2_wr,
          mb_array_3_wr,
          mb_array_4_wr
          }		),
 .dout ({ 
          mb_array_0_wr_out,
          mb_array_1_wr_out,
          mb_array_2_wr_out,
          mb_array_3_wr_out,
          mb_array_4_wr_out
        }		),
  .siclk(siclk),
  .soclk(soclk));




// read enable
 
l2t_mb0_ctl_msff_ctl_macro__width_5		out_rd_mb_arrays_reg		 (
              .scan_in(out_rd_mb_arrays_reg_scanin),
              .scan_out(out_rd_mb_arrays_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
 .din  ( {
          mb_array_0_rd,
          mb_array_1_rd,
          mb_array_2_rd,
          mb_array_3_rd,
          mb_array_4_rd
          }		),
 .dout ({ 
          mb_array_0_rd_out,
          mb_array_1_rd_out,
          mb_array_2_rd_out,
          mb_array_3_rd_out,
          mb_array_4_rd_out
        }		),
  .siclk(siclk),
  .soclk(soclk));




// port name re-assignment


   assign mb0_l2t_run             =mb_run_out;
   assign mb0_l2t_mbist_write_data[7:0]      =mb_write_data_out[7:0];
   assign mb0_l2t_addr[5:0]       =mb_addr_out[5:0];
   assign mb0_l2t_cmpsel[3:0]        =mb_cmpsel_out[3:0];
   assign mb0_l2t_fail            =mb_fail_out;
   assign mb0_l2t_done            =mb_done_out;

   assign mb0_l2t_icrow_wr_en     =mb_array_0_wr_out | mb_array_1_wr_out;
   assign mb0_l2t_dcrow_wr_en     =mb_array_2_wr_out | mb_array_3_wr_out;
   assign mb0_l2t_oqarray_wr_en   =mb_array_4_wr_out;

   assign mb0_l2t_icrow_rd_en     =mb_array_0_rd_out | mb_array_1_rd_out;
   assign mb0_l2t_dcrow_rd_en     =mb_array_2_rd_out | mb_array_3_rd_out;
   assign mb0_l2t_oqarray_rd_en   =mb_array_4_rd_out;





// spare gates:

l2t_mb0_ctl_spare_ctl_macro__num_2 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk_pm1),
  .siclk(siclk),
  .soclk(soclk)
);



supply0 vss; // <- port for ground
supply1 vdd; // <- port for power 
// /////////////////////////////////////////////////////////////////////////////



// fixscan start:
assign array_usr_reg_scanin      = scan_in                  ;
assign user_addr_mode_reg_scanin = array_usr_reg_scanout    ;
assign user_start_addr_reg_scanin = user_addr_mode_reg_scanout;
assign user_stop_addr_reg_scanin = user_start_addr_reg_scanout;
assign user_incr_addr_reg_scanin = user_stop_addr_reg_scanout;
assign user_data_mode_reg_scanin = user_incr_addr_reg_scanout;
assign user_data_reg_scanin      = user_data_mode_reg_scanout;
assign user_cmpsel_hold_reg_scanin = user_data_reg_scanout    ;
assign user_cmpsel_reg_scanin    = user_cmpsel_hold_reg_scanout;
assign user_loop_mode_reg_scanin = user_cmpsel_reg_scanout  ;
assign ten_n_mode_reg_scanin     = user_loop_mode_reg_scanout;
assign user_cam_mode_reg_scanin  = ten_n_mode_reg_scanout   ;
assign user_cam_select_reg_scanin = user_cam_mode_reg_scanout;
assign user_cam_test_select_reg_scanin = user_cam_select_reg_scanout;
assign user_bisi_wr_mode_reg_scanin = user_cam_test_select_reg_scanout;
assign user_bisi_rd_mode_reg_scanin = user_bisi_wr_mode_reg_scanout;
assign input_signals_reg_scanin  = user_bisi_rd_mode_reg_scanout;
assign mb_enable_reg_scanin      = input_signals_reg_scanout;
assign config_reg_scanin         = mb_enable_reg_scanout    ;
assign loop_again_reg_scanin     = config_reg_scanout       ;
assign cam_cntl_reg_scanin       = loop_again_reg_scanout   ;
assign cam_shift_reg_scanin      = cam_cntl_reg_scanout     ;
assign cam_hit_reg_scanin        = cam_shift_reg_scanout    ;
assign exp_cam_hit_delay_reg_scanin = cam_hit_reg_scanout      ;
assign exp_cam_exp_delay_reg_scanin = exp_cam_hit_delay_reg_scanout;
assign cam_sel_icrow_delay_reg_scanin = exp_cam_exp_delay_reg_scanout;
assign cam_sel_dcrow_delay_reg_scanin = cam_sel_icrow_delay_reg_scanout;
assign mbist_output_reg_scanin   = cam_sel_dcrow_delay_reg_scanout;
assign mbist_output_data_reg_scanin = mbist_output_reg_scanout ;
assign cntl_reg_scanin           = mbist_output_data_reg_scanout;
assign cseq_reg_scanin           = cntl_reg_scanout         ;
assign ctest_sel_reg_scanin      = cseq_reg_scanout         ;
assign array_sel_reg_scanin      = ctest_sel_reg_scanout    ;
assign cmp_sel_reg_scanin        = array_sel_reg_scanout    ;
assign marche_element_reg_scanin = cmp_sel_reg_scanout      ;
assign msb_latch_scanin          = marche_element_reg_scanout;
assign run3_transition_reg_scanin = msb_latch_scanout        ;
assign done_delay_reg_scanin     = run3_transition_reg_scanout;
assign mbist_fail_input_reg_scanin = done_delay_reg_scanout   ;
assign out_mb_tcu_done_reg_scanin = mbist_fail_input_reg_scanout;
assign inv_mask_reg_scanin       = out_mb_tcu_done_reg_scanout;
assign out_mb_tcu_fail_reg_scanin = inv_mask_reg_scanout     ;
assign out_cmp_sel_reg_scanin    = out_mb_tcu_fail_reg_scanout;
assign out_run_mb_arrays_reg_scanin = out_cmp_sel_reg_scanout  ;
assign out_data_mb_arrays_reg_scanin = out_run_mb_arrays_reg_scanout;
assign out_addr_mb_arrays_reg_scanin = out_data_mb_arrays_reg_scanout;
assign out_wr_mb_arrays_reg_scanin = out_addr_mb_arrays_reg_scanout;
assign out_rd_mb_arrays_reg_scanin = out_wr_mb_arrays_reg_scanout;
assign spares_scanin             = out_rd_mb_arrays_reg_scanout;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule
// /////////////////////////////////////////////////////////////////////////////






// any PARAMS parms go into naming of macro

module l2t_mb0_ctl_l1clkhdr_ctl_macro (
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

module l2t_mb0_ctl_msff_ctl_macro__width_4 (
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

module l2t_mb0_ctl_msff_ctl_macro__width_1 (
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

module l2t_mb0_ctl_msff_ctl_macro__width_8 (
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

module l2t_mb0_ctl_msff_ctl_macro__width_2 (
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

module l2t_mb0_ctl_msff_ctl_macro__width_3 (
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

module l2t_mb0_ctl_msff_ctl_macro__width_19 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [18:0] fdin;
wire [17:0] so;

  input [18:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [18:0] dout;
  output scan_out;
assign fdin[18:0] = din[18:0];






dff #(19)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[18:0]),
.si({scan_in,so[17:0]}),
.so({so[17:0],scan_out}),
.q(dout[18:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_mb0_ctl_msff_ctl_macro__width_5 (
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

module l2t_mb0_ctl_msff_ctl_macro__width_10 (
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

module l2t_mb0_ctl_msff_ctl_macro__width_21 (
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













// any PARAMS parms go into naming of macro

module l2t_mb0_ctl_msff_ctl_macro__width_16 (
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













// any PARAMS parms go into naming of macro

module l2t_mb0_ctl_msff_ctl_macro__width_36 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [35:0] fdin;
wire [34:0] so;

  input [35:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [35:0] dout;
  output scan_out;
assign fdin[35:0] = din[35:0];






dff #(36)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[35:0]),
.si({scan_in,so[34:0]}),
.so({so[34:0],scan_out}),
.q(dout[35:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2t_mb0_ctl_msff_ctl_macro__width_9 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;
wire [7:0] so;

  input [8:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [8:0] dout;
  output scan_out;
assign fdin[8:0] = din[8:0];






dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module l2t_mb0_ctl_spare_ctl_macro__num_2 (
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

