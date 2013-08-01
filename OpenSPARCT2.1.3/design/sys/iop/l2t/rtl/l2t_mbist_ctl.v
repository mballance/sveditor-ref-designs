// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_mbist_ctl.v
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
module l2t_mbist_ctl (
  mbist_run, 
  mbist_l2tag_read, 
  mbist_l2tag_write, 
  mbist_l2tag_index, 
  mbist_l2tag_way, 
  mbist_l2tag_dec_way, 
  mbist_l2tag_lkup_tag, 
  mbist_l2tag_fail, 
  mbist_l2tag_hit_way, 
  mbist_l2data_write, 
  mbist_l2data_word, 
  mbist_l2data_way, 
  mbist_l2data_index, 
  mbist_l2data_fail, 
  mbist_l2vuad_read, 
  mbist_l2vuad_write, 
  mbist_l2vuad_index, 
  mbist_l2vuad_vd, 
  mbist_l2vuad_fail, 
  mbist_arb_l2t_write, 
  mbist_write_data, 
  mbist_write_data_decck, 
  mbist_done, 
  mbist_fail, 
  mbist0_done, 
  mbist2_done, 
  mbist0_fail, 
  mbist2_fail, 
  mbist_start_mb0, 
  mbist_start_mb2, 
  mbist_arb_l2d_en, 
  mbist_arb_l2d_write, 
  mbist_l2d_en, 
  l2clk, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  scan_in, 
  scan_out, 
  mbist_start, 
  mbist_bisi_mode, 
  mbist_user_mode);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire clock_enable;
wire start_in;
wire l1clk_pm1;
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
wire [17:0] user_start_addr_in;
wire [17:0] user_start_addr;
wire user_stop_addr_reg_scanin;
wire user_stop_addr_reg_scanout;
wire [17:0] user_stop_addr_in;
wire [17:0] user_stop_addr;
wire user_incr_addr_reg_scanin;
wire user_incr_addr_reg_scanout;
wire [17:0] user_incr_addr_in;
wire [17:0] user_incr_addr;
wire user_data_mode_reg_scanin;
wire user_data_mode_reg_scanout;
wire user_data_mode_in;
wire user_data_mode;
wire user_data_reg_scanin;
wire user_data_reg_scanout;
wire [7:0] user_data_in;
wire [7:0] user_data;
wire user_loop_mode_reg_scanin;
wire user_loop_mode_reg_scanout;
wire user_loop_mode_in;
wire user_loop_mode;
wire ten_n_mode_reg_scanin;
wire ten_n_mode_reg_scanout;
wire ten_n_mode_in;
wire ten_n_mode;
wire user_quad_sel_reg_scanin;
wire user_quad_sel_reg_scanout;
wire user_quad_sel_in;
wire user_quad_sel;
wire user_bisi_wr_mode_reg_scanin;
wire user_bisi_wr_mode_reg_scanout;
wire user_bisi_wr_mode_in;
wire user_bisi_wr_mode;
wire user_bisi_rd_mode_reg_scanin;
wire user_bisi_rd_mode_reg_scanout;
wire user_bisi_rd_mode_in;
wire user_bisi_rd_mode;
wire user_addr_mix_sel_reg_scanin;
wire user_addr_mix_sel_reg_scanout;
wire [1:0] user_addr_mix_sel_in;
wire [1:0] user_addr_mix_sel;
wire mb_user_data_mode;
wire user_mode;
wire mb_user_addr_mode;
wire mb_user_quad_sel;
wire mb_ten_n_mode;
wire mb_user_loop_mode;
wire mb_user_bisi_wr_mode;
wire bisi_mode;
wire mb_user_bisi_rd_mode;
wire mb_user_bisi_rw_mode;
wire mb_default_bisi;
wire mbist_start_reg_scanin;
wire mbist_start_reg_scanout;
wire mbist_start_all;
wire mbist_start_all_reg_scanin;
wire mbist_start_all_reg_scanout;
wire mbist_start_mb1;
wire input_signals_reg_scanin;
wire input_signals_reg_scanout;
wire mb_enable_reg_scanin;
wire mb_enable_reg_scanout;
wire mb_enable;
wire mb_enable_out;
wire start;
wire mb2_done;
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
wire [15:0] l2tag_dec_way;
wire [3:0] l2tag_way;
wire d_mbist_l2vuad_vd;
wire array_1;
wire arb_l2d_en;
wire array_3;
wire array_2;
wire arb_l2d_write;
wire l2d_en;
wire mbist_output_reg_scanin;
wire mbist_output_reg_scanout;
wire cntl_l2rw;
wire [27:0] mb_l2tag_lkup_tag;
wire mb_array_2_wr;
wire cntl_l2rw_out;
wire input_cam_hit_reg_scanin;
wire input_cam_hit_reg_scanout;
wire [15:0] mb_l2tag_hit_way;
wire cntl_reg_scanin;
wire cntl_reg_scanout;
wire [35:0] cntl_in;
wire [35:0] cntl_out;
wire run3;
wire [13:0] cntl_algr;
wire [13:0] next_algr;
wire sel_nextaddr_reset;
wire sel_nextaddr_restart;
wire overflow;
wire sel_nextaddr_incred;
wire cout_rw;
wire sel_nextaddr_same;
wire [17:0] start_addr;
wire [17:0] restart_addr;
wire [17:0] incred_addr;
wire [17:0] cntl_addr;
wire [2:0] cntl_rw;
wire [3:0] next_rw;
wire cntl_msb;
wire cntl_bisi;
wire [3:0] cntl_array_sel;
wire last_array;
wire [1:0] cntl_data_sel;
wire [1:0] cntl_addr_mix;
wire addr_mix_pass;
wire [3:0] cntl_march_element;
wire sel_march_1_pass;
wire [1:0] addr_mix_cntl_out;
wire cntl_addr_mix_reg_scanin;
wire cntl_addr_mix_reg_scanout;
wire [1:0] addr_mix_sel;
wire [1:0] addr_mix_sel_out;
wire array_0;
wire addr_mix_1;
wire addr_mix_0;
wire addr_mix_2;
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
wire [17:0] incr_addr;
wire [17:0] stop_addr;
wire sel_rw_pass;
wire [3:0] rw_incr;
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
wire [17:0] adj_addr;
wire rw_3;
wire [17:0] mem_addr1;
wire true_data_l;
wire rw_2;
wire true_data;
wire [7:0] data_pat_sel;
wire [7:0] mem_data;
wire l2tag_data_0_or_1;
wire [27:0] l2tag_lkup_tag;
wire l2tag_cam_pass;
wire l2tag_cam_cmp_d4;
wire l2tag_cam_fail;
wire l2tag_strobe_valid;
wire [17:0] mb_addr;
wire l2tag_cam_cmp;
wire mb_array_2_rd;
wire cam_cmp_fail_delay_reg_scanin;
wire cam_cmp_fail_delay_reg_scanout;
wire l2tag_cam_cmp_d1;
wire l2tag_cam_cmp_d2;
wire l2tag_cam_cmp_d3;
wire [17:0] mem_addr_mix0;
wire [17:0] mem_addr_mix1;
wire [17:0] mem_addr_mix2_pre;
wire [3:0] mem_addr_mix2_dec;
wire [17:0] mem_addr_mix2;
wire [17:0] mem_addr;
wire [3:0] array_sel;
wire [3:0] march_element;
wire [2:0] rw;
wire [3:0] array_sel_cntl_out;
wire array_sel_reg_scanin;
wire array_sel_reg_scanout;
wire [3:0] array_sel_out;
wire [3:0] march_element_cntl_out;
wire marche_element_reg_scanin;
wire marche_element_reg_scanout;
wire [3:0] march_element_out;
wire [2:0] rw_cntl_out;
wire march_element_reg_scanin;
wire march_element_reg_scanout;
wire [2:0] rw_out;
wire sel_rw_1_pass;
wire sel_rw_2_pass;
wire sel_rw_5_pass;
wire [7:0] mb_write_data;
wire mb_array_0_rd;
wire mb_array_1_rd;
wire mb_array_3_rd;
wire quad_cntl;
wire mb_array_0_wr;
wire mb_array_1_wr;
wire mb_array_3_wr;
wire mb_run;
wire msb_latch_scanin;
wire msb_latch_scanout;
wire msb_in;
wire msb_out;
wire mb_done;
wire [4:0] done_delay;
wire run3_transition_reg_scanin;
wire run3_transition_reg_scanout;
wire run3_out;
wire run3_transition;
wire done_delay_reg_scanin;
wire done_delay_reg_scanout;
wire [4:0] done_delay_in;
wire merged_fail_scanin;
wire merged_fail_scanout;
wire mb_fail_merged;
wire mb0_fail;
wire mb2_fail;
wire merged_done_scanin;
wire merged_done_scanout;
wire mb_done_merged;
wire mb0_done;
wire mb1_fail;
wire mb1_done;
wire mb_l2tag_fail;
wire mb_l2vuad_fail;
wire mb_l2data_fail_pregate;
wire l2data_rd_cmp_reg_scanin;
wire l2data_rd_cmp_reg_scanout;
wire array_3_rd_d1;
wire array_3_rd_d2;
wire array_3_rd_d3;
wire array_3_rd_d4;
wire array_3_rd_d5;
wire array_3_rd_d6;
wire mb_l2data_fail;
wire l2tag_fail_d;
wire l2tag_fail_sticky;
wire l2vuad_fail_d;
wire l2vuad_fail_sticky;
wire l2data_fail_d;
wire l2data_fail_sticky;
wire l2tag_cam_fail_d;
wire l2tag_cam_sticky;
wire mbist_fail_input_reg_scanin;
wire mbist_fail_input_reg_scanout;
wire mbist_fail_sticky;
wire mbist_fail_array;
wire valid_fail;
wire mb_fail;
wire out_mb_tcu_done_reg_scanin;
wire out_mb_tcu_done_reg_scanout;
wire mb_done_out;
wire out_mb_tcu_fail_reg_scanin;
wire out_mb_tcu_fail_reg_scanout;
wire mb_fail_out;
wire out_run_mb_arrays_reg_scanin;
wire out_run_mb_arrays_reg_scanout;
wire mb_run_out;
wire out_data_mb_arrays_reg_scanin;
wire out_data_mb_arrays_reg_scanout;
wire [7:0] mb_write_data_out;
wire [7:0] mbist_write_data_decck_out;
wire out_addr_mb_arrays_reg_scanin;
wire out_addr_mb_arrays_reg_scanout;
wire [17:0] mb_addr_out;
wire out_wr_mb_arrays_reg_scanin;
wire out_wr_mb_arrays_reg_scanout;
wire mb_array_0_wr_out;
wire mb_array_1_wr_out;
wire mb_array_2_wr_out;
wire mb_array_3_wr_out;
wire out_rd_mb_arrays_reg_scanin;
wire out_rd_mb_arrays_reg_scanout;
wire mb_array_0_rd_out;
wire mb_array_1_rd_out;
wire mb_array_2_rd_out;
wire [3:0] l2data_word;
wire spares_scanin;
wire spares_scanout;
 
 
/////////////////////////////////////////////////////////////////////////////// 
// Outputs 
/////////////////////////////////////////////////////////////////////////////// 
 
output            mbist_run;           // run

// l2tag
output            mbist_l2tag_read;    // read enable for tag array
output            mbist_l2tag_write;   // write enable for tag array
output    [8:0]   mbist_l2tag_index;   // Tag array index 
output    [3:0]   mbist_l2tag_way;     // mux select to pick out a way for a read
output    [15:0]  mbist_l2tag_dec_way; // The way select for the tag array
output    [27:0]  mbist_l2tag_lkup_tag; //To test lookup operation.
input             mbist_l2tag_fail; 

input   [15:0]    mbist_l2tag_hit_way; //To see if a match happened.
                                        //Added 2/28/05. 

// l2data

output            mbist_l2data_write;  // 0=Write to the dataarray 1=read
output    [3:0]   mbist_l2data_word;   // encoded 1/16 words are picked to write
            	   	   	               // out of 624 bits you can only write 78 bits at 
            	   	                   // a time
output    [3:0]   mbist_l2data_way;    // encoded way for data array access
output    [8:0]   mbist_l2data_index;  // data access index encoded
input             mbist_l2data_fail;

// l2vuad
output            mbist_l2vuad_read;   // Read enable for vuad array 
output            mbist_l2vuad_write;  // VUAD array write enable
output    [8:0]   mbist_l2vuad_index;  // index to access vuad arrays
output            mbist_l2vuad_vd;     // This is a select signal to pick vd or ua arrays
input             mbist_l2vuad_fail; 

// ???

output            mbist_arb_l2t_write; // Asserted as a request for writing tag array
output    [7:0]   mbist_write_data;    // write data
output    [7:0]   mbist_write_data_decck;    // write data
          
output            mbist_done; 
output            mbist_fail; 
input		      mbist0_done;
input             mbist2_done;
input             mbist0_fail;
input             mbist2_fail;



// mbist_start redistribution:

   output      mbist_start_mb0;
   output      mbist_start_mb2;



// ???????????????????????????????????????????????????????????????????????????????????????


output    	      mbist_arb_l2d_en;    // select to pick mbist index for data array access
output    	      mbist_arb_l2d_write; // select to pick mbist data for data array access
output    	      mbist_l2d_en;        // select to pick mbist way for data array access

 
/////////////////////////////////////////////////////////////////////////////// 
// Inputs 
/////////////////////////////////////////////////////////////////////////////// 
 
input            l2clk; 
input           tcu_pce_ov;
input           tcu_aclk;
input           tcu_bclk;
input           tcu_scan_en;
input           tcu_clk_stop;

input 		    scan_in; 
output 		    scan_out; 

input           mbist_start; 
input           mbist_bisi_mode; 
input           mbist_user_mode; 


/////////////////////////////////////////////////////////////////////////////// 
// Wires 
/////////////////////////////////////////////////////////////////////////////// 



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


l2t_l1clkhdr_ctl_macro clkgen_freeclk (
        .l2clk  (l2clk 		),
        .l1en   (1'b1		),
        .l1clk  (l1clk		),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));


assign clock_enable	= start_in | mbist_done | mbist_run | mbist_fail ;
l2t_l1clkhdr_ctl_macro clkgen (
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


////////////////////////////////////////////////////////////////////////////////
// user control registers
//                         size
// -  user_array_sel        4
// -  user_addr_mode        1
// -  user_start_addr      15
// -  user_stop_addr       15
// -  user_inc_addr        15
// -  user_data_mode        1
// -  user_data             8
// -  user_cmpsel_hold      1
// -  user_cmpsel           3
// -  user_loop_mode        1
// -  user_quad_sel         1  (selects upper and lower halves )


   l2t_msff_ctl_macro__width_4 array_usr_reg  (
              .scan_in(array_usr_reg_scanin),
              .scan_out(array_usr_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_array_sel_in[3:0]       ),
  		      .dout     ( user_array_sel[3:0]      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_array_sel_in[3:0]=user_array_sel[3:0];


   // user address mode

   l2t_msff_ctl_macro__width_1 user_addr_mode_reg  (
              .scan_in(user_addr_mode_reg_scanin),
              .scan_out(user_addr_mode_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_addr_mode_in       ),
  		      .dout     ( user_addr_mode        ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_addr_mode_in=user_addr_mode;
   

   //  user start address
   
  l2t_msff_ctl_macro__width_18 user_start_addr_reg  (
                 .scan_in(user_start_addr_reg_scanin),
                 .scan_out(user_start_addr_reg_scanout),
                 .l1clk    ( l1clk_pm1	           ),
                 .din      ( user_start_addr_in[17:0]       ),
                 .dout     ( user_start_addr[17:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_start_addr_in[17:0]=user_start_addr[17:0];

   //  user stop address
   
  l2t_msff_ctl_macro__width_18 user_stop_addr_reg  (
                 .scan_in(user_stop_addr_reg_scanin),
                 .scan_out(user_stop_addr_reg_scanout),
                 .l1clk    ( l1clk_pm1	           ),
                 .din      ( user_stop_addr_in[17:0]       ),
                 .dout     ( user_stop_addr[17:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_stop_addr_in[17:0]=user_stop_addr[17:0];
   

  //  user increment address
   
  l2t_msff_ctl_macro__width_18 user_incr_addr_reg  (
                 .scan_in(user_incr_addr_reg_scanin),
                 .scan_out(user_incr_addr_reg_scanout),
                 .l1clk    ( l1clk_pm1	           ),
                 .din      ( user_incr_addr_in[17:0]       ),
                 .dout     ( user_incr_addr[17:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_incr_addr_in[17:0]=user_incr_addr[17:0];

   // user data mode

   l2t_msff_ctl_macro__width_1 user_data_mode_reg  (
              .scan_in(user_data_mode_reg_scanin),
              .scan_out(user_data_mode_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_data_mode_in       ),
   		      .dout     ( user_data_mode        ),
  .siclk(siclk),
  .soclk(soclk));

							 
   assign user_data_mode_in=user_data_mode;

   //  user data select
   
   l2t_msff_ctl_macro__width_8 user_data_reg  (
                 .scan_in(user_data_reg_scanin),
                 .scan_out(user_data_reg_scanout),
                 .l1clk    ( l1clk_pm1	           ),
                 .din      ( user_data_in[7:0]       ),
                 .dout     ( user_data[7:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_data_in[7:0]    =    user_data[7:0];


   // user loop mode

   l2t_msff_ctl_macro__width_1 user_loop_mode_reg  (
              .scan_in(user_loop_mode_reg_scanin),
              .scan_out(user_loop_mode_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_loop_mode_in       ),
  		      .dout     ( user_loop_mode        ),
  .siclk(siclk),
  .soclk(soclk));

  
   assign user_loop_mode_in=user_loop_mode;



   // 10N Algorithm for bit mapping

   l2t_msff_ctl_macro__width_1 ten_n_mode_reg  (
              .scan_in(ten_n_mode_reg_scanin),
              .scan_out(ten_n_mode_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( ten_n_mode_in       ),
  		      .dout     ( ten_n_mode        ),
  .siclk(siclk),
  .soclk(soclk));

  
   assign ten_n_mode_in=ten_n_mode;



   // user data mode

   l2t_msff_ctl_macro__width_1 user_quad_sel_reg  (
              .scan_in(user_quad_sel_reg_scanin),
              .scan_out(user_quad_sel_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_quad_sel_in       ),
   		      .dout     ( user_quad_sel        ),
  .siclk(siclk),
  .soclk(soclk));

							 
   assign user_quad_sel_in=user_quad_sel;


   l2t_msff_ctl_macro__width_1 user_bisi_wr_mode_reg  (
                  .scan_in(user_bisi_wr_mode_reg_scanin),
                  .scan_out(user_bisi_wr_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1	                  ),
  	          .din      ( user_bisi_wr_mode_in   ),
  		  .dout     ( user_bisi_wr_mode      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_bisi_wr_mode_in=user_bisi_wr_mode;

   l2t_msff_ctl_macro__width_1 user_bisi_rd_mode_reg  (
                  .scan_in(user_bisi_rd_mode_reg_scanin),
                  .scan_out(user_bisi_rd_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1	                  ),
  	          .din      ( user_bisi_rd_mode_in   ),
  		  .dout     ( user_bisi_rd_mode      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_bisi_rd_mode_in=user_bisi_rd_mode;


   
  l2t_msff_ctl_macro__width_2 user_addr_mix_sel_reg  (
                 .scan_in(user_addr_mix_sel_reg_scanin),
                 .scan_out(user_addr_mix_sel_reg_scanout),
                 .l1clk    ( l1clk_pm1	           ),
                 .din      ( user_addr_mix_sel_in[1:0]       ),
                 .dout     ( user_addr_mix_sel[1:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_addr_mix_sel_in[1:0]=user_addr_mix_sel[1:0];
   




   assign mb_user_data_mode = user_mode & user_data_mode;
   assign mb_user_addr_mode = user_mode & user_addr_mode;
   assign mb_user_quad_sel = user_mode & user_quad_sel;
   assign mb_ten_n_mode          = user_mode & ten_n_mode;
   assign mb_user_loop_mode      = user_mode & user_loop_mode;



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


  // flop incoming signals:

  // --> mbist_start -> flop -> flop-> mbist_mb2
  //                 -> mbist_start_all -> mbist_start_mb1
  //                 -> mbist_start_all -> mbist_start_mb0

  l2t_msff_ctl_macro__width_1 mbist_start_reg  (
              .scan_in(mbist_start_reg_scanin),
              .scan_out(mbist_start_reg_scanout),
              .l1clk    ( l1clk           ),
               .din      ( mbist_start ),
               .dout     ( mbist_start_all ),
  .siclk(siclk),
  .soclk(soclk));

  l2t_msff_ctl_macro__width_3 mbist_start_all_reg  (
              .scan_in(mbist_start_all_reg_scanin),
              .scan_out(mbist_start_all_reg_scanout),
              .l1clk    ( l1clk           ),
               .din      ( {mbist_start_all,mbist_start_all, mbist_start_all} ),
               .dout     ( {mbist_start_mb1,mbist_start_mb0, mbist_start_mb2} ),
  .siclk(siclk),
  .soclk(soclk));


  l2t_msff_ctl_macro__width_3 input_signals_reg  (
               .scan_in(input_signals_reg_scanin),
               .scan_out(input_signals_reg_scanout),
               .l1clk    ( l1clk          ),
               .din      ( {mbist_start_mb1,mbist_bisi_mode,mbist_user_mode} ),
               .dout     ( {start_in,bisi_mode,user_mode} ),
  .siclk(siclk),
  .soclk(soclk));
  

  // default   : mb_enable=0
  // bisi      : mb_enable=0
  // user_mode : mb_enable=depend on programmed value

  l2t_msff_ctl_macro__width_1 mb_enable_reg  (
               .scan_in(mb_enable_reg_scanin),
               .scan_out(mb_enable_reg_scanout),
               .l1clk    ( l1clk_pm1	           ),
               .din      ( mb_enable       ),
               .dout     ( mb_enable_out       ),
  .siclk(siclk),
  .soclk(soclk));


  assign mb_enable = user_mode ? mb_enable_out : 1'b0;


  assign start = user_mode ? (mb_enable_out & start_in) :
                             (start_in & mb2_done);

//  assign start = start_in ;



  l2t_msff_ctl_macro__width_2 config_reg  (
               .scan_in(config_reg_scanin),
               .scan_out(config_reg_scanout),
               .l1clk    ( l1clk_pm1	           ),
               .din      ( config_in[1:0]       ),
               .dout     ( config_out[1:0]      ),
  .siclk(siclk),
  .soclk(soclk));

   
  assign config_in[0]        =    start;
  assign config_in[1]        =    config_out[0];
  assign start_transition    =    config_out[0]      &  ~config_out[1];
  assign end_transition      =   ~config_out[0] &  config_out[1];
  assign reset_engine        =    start_transition | loop_again  | end_transition;
  assign run                 =    config_out[1]  ;



  l2t_msff_ctl_macro__width_1 loop_again_reg  (
               .scan_in(loop_again_reg_scanin),
               .scan_out(loop_again_reg_scanout),
               .l1clk    ( l1clk_pm1	           ),
               .din      (  stop_engine_l   ),
               .dout     (  stop_engine_l_q  ),
  .siclk(siclk),
  .soclk(soclk));


assign loop_again=mb_user_loop_mode ? stop_engine_l & ~stop_engine_l_q:  1'b0;



    

   assign l2tag_dec_way[0]   = (l2tag_way[3:0]==4'h0);
   assign l2tag_dec_way[1]   = (l2tag_way[3:0]==4'h1);
   assign l2tag_dec_way[2]   = (l2tag_way[3:0]==4'h2);
   assign l2tag_dec_way[3]   = (l2tag_way[3:0]==4'h3);


   assign l2tag_dec_way[4]   = (l2tag_way[3:0]==4'h4);
   assign l2tag_dec_way[5]   = (l2tag_way[3:0]==4'h5);
   assign l2tag_dec_way[6]   = (l2tag_way[3:0]==4'h6);
   assign l2tag_dec_way[7]   = (l2tag_way[3:0]==4'h7);


   assign l2tag_dec_way[8]   = (l2tag_way[3:0]==4'h8);
   assign l2tag_dec_way[9]   = (l2tag_way[3:0]==4'h9);
   assign l2tag_dec_way[10]  = (l2tag_way[3:0]==4'hA);
   assign l2tag_dec_way[11]  = (l2tag_way[3:0]==4'hB);


   assign l2tag_dec_way[12]  = (l2tag_way[3:0]==4'hC);
   assign l2tag_dec_way[13]  = (l2tag_way[3:0]==4'hD);
   assign l2tag_dec_way[14]  = (l2tag_way[3:0]==4'hE);
   assign l2tag_dec_way[15]  = (l2tag_way[3:0]==4'hF);






assign          d_mbist_l2vuad_vd=array_1;  // selects vuad dirty

assign          arb_l2d_en   =user_mode ?  run : array_3 | array_2;  // provide early static signal
assign          arb_l2d_write=user_mode ?  run : array_3 | array_2;  // provide early static signal
assign          l2d_en       =user_mode ?  run : array_3 | array_2;  // provide early static signal


l2t_msff_ctl_macro__width_50		mbist_output_reg		 (
 .scan_in(mbist_output_reg_scanin),
 .scan_out(mbist_output_reg_scanout),
 .l1clk    ( l1clk_pm1	           ),
 .din  ({ cntl_l2rw,
          l2tag_dec_way[15:0],
          mb_l2tag_lkup_tag[27:0],
          d_mbist_l2vuad_vd,
          mb_array_2_wr,
          arb_l2d_en,
          arb_l2d_write,
          l2d_en}),                 
 .dout ({ cntl_l2rw_out,
          mbist_l2tag_dec_way[15:0],
          mbist_l2tag_lkup_tag[27:0],
          mbist_l2vuad_vd,
          mbist_arb_l2t_write,
          mbist_arb_l2d_en,
          mbist_arb_l2d_write,
          mbist_l2d_en}),
  .siclk(siclk),
  .soclk(soclk));




   l2t_msff_ctl_macro__width_16 input_cam_hit_reg  (
              .scan_in(input_cam_hit_reg_scanin),
              .scan_out(input_cam_hit_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( mbist_l2tag_hit_way[15:0]       ),
  		      .dout     ( mb_l2tag_hit_way[15:0]      ),
  .siclk(siclk),
  .soclk(soclk));




// work
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////   ////////////////////////////////////
//  CONTROL REG:
////////////////////////////////////   ////////////////////////////////////


   l2t_msff_ctl_macro__width_36 cntl_reg  (
                 .scan_in(cntl_reg_scanin),
                 .scan_out(cntl_reg_scanout),
                 .l1clk    ( l1clk_pm1	           ),
                 .din      ( cntl_in[35:0]       ),
                 .dout     ( cntl_out[35:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign cntl_in[35:22]   = reset_engine   ? {14'b00000000000000}:
     	                     (~run3)          ? cntl_algr[13:0]:	  
	                                          next_algr[13:0];

   
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
   assign sel_nextaddr_same     = ~(sel_nextaddr_reset | sel_nextaddr_restart | sel_nextaddr_incred);

   assign cntl_in[21:4] = ({18{sel_nextaddr_reset}} & start_addr[17:0]) |
                          ({18{sel_nextaddr_restart}} & restart_addr[17:0]) |
                          ({18{sel_nextaddr_incred}} & incred_addr[17:0]) |
                          ({18{sel_nextaddr_same}} & cntl_addr[17:0]);  
   

   assign cntl_in[3:1]     = reset_engine  ? 3'b000 : 
                             (~run3 )          ? cntl_rw[2:0]:
                                             next_rw[3:1];


   assign cntl_in[0]       =     next_rw[0];


////////////////////////////////////   ////////////////////////////////////
//  NEXT ALGR
////////////////////////////////////   ////////////////////////////////////

   // msb
   assign cntl_msb                    =     start_in &  cntl_out[   35];    // done selection

   assign cntl_bisi                    =       mb_default_bisi | mb_user_bisi_rw_mode ? cntl_out[34] :
                                                                                        1'b1;

   // array
   assign cntl_array_sel[3:0]        =       (user_mode | last_array)     ? 4'b1111:
                                                            cntl_out[33:30];    // array selection 

   // data
   assign cntl_data_sel[1:0]          =   (bisi_mode | mb_user_data_mode)  ? 2'b11 :    cntl_out[29:28];    // data selection



   // address mix
   assign cntl_addr_mix[1:0]          =     addr_mix_pass ? 2'b11  :    
                                          
                                                     cntl_out[27:26];    // address mix


   assign cntl_march_element[3:0]     =   sel_march_1_pass  ? 4'b1111:
                                                              cntl_out[25:22];    // march element

//   assign addr_mix[1:0] = (bisi_mode | mb_user_addr_mode ) ? 2'b00 :
//                                                       cntl_addr_mix[1:0];



  
   // cmp logic

   assign addr_mix_cntl_out[1:0] = cntl_out[27:26];

   l2t_msff_ctl_macro__width_2 cntl_addr_mix_reg  (
              .scan_in(cntl_addr_mix_reg_scanin),
              .scan_out(cntl_addr_mix_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      ( addr_mix_sel[1:0] ),
               .dout     ( addr_mix_sel_out[1:0] ),
  .siclk(siclk),
  .soclk(soclk));

//   assign cmp_sel[3:0]=  (&cmp_sel_cntl_out[3:0] & ~(array_5)) ? cmp_sel_out[3:0] :
   assign addr_mix_sel[1:0]=  (&addr_mix_cntl_out[1:0] ) ? addr_mix_sel_out[1:0] :
                               mb_user_addr_mode                 ? user_addr_mix_sel[1:0] :
                                                          addr_mix_cntl_out[1:0];

   assign addr_mix_pass = (mb_user_addr_mode | bisi_mode ) |
                          array_0 & addr_mix_1 |
                          array_1 & addr_mix_1 |
                          array_2 & addr_mix_1 |
                          array_3 & addr_mix_1 ;

   assign addr_mix_0 = addr_mix_sel==2'b00 & run3;
   assign addr_mix_1 = addr_mix_sel==2'b01 & run3;
   assign addr_mix_2 = addr_mix_sel==2'b10 & run3;

   assign cntl_algr[13:0] =       {cntl_msb,
                                   cntl_bisi,
                                   cntl_array_sel[3:0],
			                       cntl_data_sel[1:0],
			                       cntl_addr_mix[1:0],
			                       cntl_march_element[3:0]};

   assign next_algr[13:0] = cout_addr ? cntl_algr[13:0] + 14'h1 : cntl_algr[13:0];         // mbist control




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


   assign incr_addr[17:0]  = mb_user_addr_mode ? user_incr_addr[17:0] :  18'b000000000000000001;

   assign start_addr[17:0] = mb_user_addr_mode ? user_start_addr[17:0] : 18'b000000000000000000;
   
   
//   assign next_addr_out[8:0] = cout_rw ? cntl_addr[8:0] + incr_addr[8:0] : cntl_addr[8:0];    // next address


   assign incred_addr[17:0] = cntl_addr[17:0] + incr_addr[17:0];


   assign overflow   = upaddr   ? ( cntl_addr[17:0] == stop_addr[17:0])  & (cntl_rw[2:0]==3'b111 & cntl_l2rw):
                                  (~cntl_addr[17:0] == start_addr[17:0]) & (cntl_rw[2:0]==3'b111 & cntl_l2rw);


//   assign next_addr[17:0]= overflow ? restart_addr[17:0] : next_addr_out[17:0];
  
   assign restart_addr[17:0] = upaddr_pre ? start_addr[17:0] : ~stop_addr[17:0];
      
   assign cout_addr =  overflow;




////////////////////////////////////   ////////////////////////////////////
//  NEXT RW
////////////////////////////////////   ////////////////////////////////////


   assign cntl_rw[2:0]                =   sel_rw_pass      ? 3'b111: 
                                                               cntl_out[ 3: 1];    // read write control

   assign cntl_l2rw                   =  (run3 & (array_3 & cntl_out[0]) | ~(array_3)) ;

   assign rw_incr[3:0]                = {cntl_rw[2:0],cntl_l2rw};     

   assign next_rw[3:0] = rw_incr[3:0]+4'b0001 ;              

   
   assign cout_rw = &{cntl_rw[2:0],cntl_l2rw};     // carry over for rw 








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

   assign cntl_addr[17:0]   = cntl_out[21:4];

// Original Code:
//   assign adj_addr[17:0]      = (five_cycle_march & (rw_1 | rw_3)) ? {cntl_addr[17:6],~cntl_addr[5],cntl_addr[4:0]}:
//                                                                  cntl_addr[17:0] ;

// Proposed Code:
   assign adj_addr[17:0]      = (five_cycle_march & (rw_1 | rw_3)) ? {cntl_addr[17:4],~cntl_addr[3],cntl_addr[2:0]}:
                                                                      cntl_addr[17:0] ;

// If l2d:   default cntl_addr[7:0] works
//           addr_mix cntl_addr[10:3] works
// Note: Based on my conversation w/ Judy, for l2d, if a row needs to be replaced with a
// redundant row, the redundant row is in the other 16KB block. In that case,
// for that row and its corresponding row for weak-bit test, weak-bit address
// would not be on the bitline.

// If l2t:   default cntl_addr[8:2] works
//           addr_mix cntl_addr[6:0] works

// If vuad:  default cntl_addr[5:2] works
//           addr_mix cntl_addr[3:0] works

 
   assign mem_addr1[17:0]    = upaddr   ?  adj_addr[17:0]:  ~adj_addr[17:0];



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


   // l2tag cam


   assign l2tag_data_0_or_1 = mem_data[7:0] == 8'h00 | mem_data[7:0]==8'hFF;

   assign l2tag_lkup_tag[27:0] = {mem_data[3:0],mem_data[7:0],mem_data[7:0],mem_data[7:0]};

   assign mb_l2tag_lkup_tag[27:0] = (march_1 | march_2) ? l2tag_lkup_tag[27:0] : ~l2tag_lkup_tag[27:0];

   assign l2tag_cam_pass = l2tag_cam_cmp_d4 ? &mb_l2tag_hit_way[15:0] : ~|mb_l2tag_hit_way[15:0];
   assign l2tag_cam_fail = (l2tag_strobe_valid) ? ~l2tag_cam_pass : 1'b0;

   assign l2tag_strobe_valid = mb_addr[8] & array_2 & (~bisi_mode | ~mb_user_addr_mode) & l2tag_way[3:0]==4'h0 & (march_1 | march_2) ;
   assign l2tag_cam_cmp = mb_array_2_rd & (march_1 | march_2) & l2tag_data_0_or_1;


l2t_msff_ctl_macro__width_4		cam_cmp_fail_delay_reg		 (
 .scan_in(cam_cmp_fail_delay_reg_scanin),
 .scan_out(cam_cmp_fail_delay_reg_scanout),
 .l1clk    ( l1clk_pm1	           ),
 .din  ( {
          l2tag_cam_cmp,
          l2tag_cam_cmp_d1,
          l2tag_cam_cmp_d2,
          l2tag_cam_cmp_d3
          }		),
 .dout ({ 
          l2tag_cam_cmp_d1,
          l2tag_cam_cmp_d2,
          l2tag_cam_cmp_d3,
          l2tag_cam_cmp_d4
        }		),
  .siclk(siclk),
  .soclk(soclk));



////////////////////////////////////   ////////////////////////////////////
//  STOP ADDR
////////////////////////////////////   ////////////////////////////////////
// cycle count for bisi:
//  arrays   cycles  operation
//  ---------------------------
//  vuad0:      512  write
//  vuad1:      512  write
//  l2tag:     8192  write
// l2data:   131072  write
//  vuad0:      512  read
//  vuad1:      512  read
//  l2tag:     8192  read <--  abort after 1st read
// l2data:   131072  read
//-----------------------------
//  total    280576


   assign stop_addr[17:0]  = mb_user_addr_mode ? user_stop_addr[17:0]  : 
                                                 array_0   ?  18'b00_00000001_11111111:  // l2vuad (valid)
                                                 array_1   ?  18'b00_00000001_11111111:  // l2vuad (dirty)
                                                 array_2   ?  18'b00_00011111_11111111:  // l2tag
                                                 array_3   ?  18'b00_11111111_11111111:  // l2data
                                                              18'b01_11111111_11111111;


////////////////////////////////////   ////////////////////////////////////
//  ADDR MIX
////////////////////////////////////   ////////////////////////////////////

// L2tag
// ------
// Each L2t bank is 8Kx28. Each bank is composed of 8 arrays
// and each array represent 2 ways.

// Each array is 128 rows x (28x8) columns. There is a 4:1 column muxing
// and since 2 ways, the 8 consecutive columns represent 2 ways, where
// every 4 goes to one sense amp.

// Therefore, index[8:0] chooses one of 512 entires, where:

// index[8:2] are row addresses, and
// index[1:0] are column addresses.


// VUAD memories
// --------------
// Each VUAD instance is 32 words x 160 bits and structured as
// 32 rows x 160 columns. It is a straight forward memory.
// The rows are divided in between for read. i.e. 16 rows on top
// and 16 rows in the bottom.

// Therefore, for addressing, consider this:

// address_mix = 0 : mem_address[4:0]
//             = 1 : mem_address[3:0],mem_address[4]  // to jump between
                                                   // top & bottom.
// For adjacent row, consider inverting one of mem_address[3:0] so that
// both fall amongst the top or bottom rows.                               
// 
// Furthermore, there are 4 arrays of 32x160 for VD and 4 for UA.
// There are index[8:0] is used to address the bits of each set of 4 arrays.
// For VD bits, since there 2 bits for each entry and for each way, then 
// # of bits per entry for 16 ways are 16x2=32 which requires 7 bits of ecc,
// therefore 39 bits per entry is needed. Therefore, for 512 entries, we need:
// 512 x 39 which is stored as (4 arrays) of (32rows) x (39x4).
// So, index[8:0] is used in the following way:

// index[1:0]: decodes which entry on each row,
// index[6:2]: decodes which row within an array,
// index[8:7]: decodes which of four 32x160 array instances.

// L2data
// ------
// Each bank of L2data is composed of a top and bottom half. Top half for
// col_offset 1 and 3 and the bottom one for col_offset 0 and 2.
// Each half is composed of 2 quadrants and each quadrant is made up of four
// 32KB blocks. 
// The top two 32KB in each quadrant is controlled with way_sel[7:0] and the
// bottom two is controlled with way_sel[15:8].
// Each 32KB block is built of two 16KB blocks. 
// Each 16KB block is the configured as 256 rows x 624 columns.
// These 624 columns are muxed 8:1 into 78 i/o's. 
// way_sel[7:0] and way_sel[15:8] decode the 8 columns within an i/o.
// set[7:0] decodes 256 rows within a 16K B and set[8] chooses between top and
// bottom 16KB. 
// 

   // l2tag  

   assign mem_addr_mix0[17:0]   =     mem_addr1[17:0];



   assign mem_addr_mix1[17:0]   =    (array_2) ? { mem_addr1[17:13],
                                                   mem_addr1[12],
                                                   mem_addr1[9],
                                                   mem_addr1[11],
                                                   mem_addr1[10],
                                                   mem_addr1[6:0],
                                                   mem_addr1[8:7] } :   // l2tag fast row

                                     (array_0) ? { mem_addr1[17:7],mem_addr1[4:0],mem_addr1[6:5] } :   // vuad
                                     (array_1) ? { mem_addr1[17:7],mem_addr1[4:0],mem_addr1[6:5] } :
                                     (array_3) ? { mem_addr1[17:16],mem_addr1[5:3],mem_addr1[6],mem_addr1[2:0],mem_addr1[15:7] } :
                                                          mem_addr1[17:0];  // Default l2d: fast row, then 16K block, then column 
                                                                         // Default l2t: fast col, then row, then way
                                                                           // Default vuad: fast word_en, then row

                                        // index[7:0], waysel, index[8], word
     assign mem_addr_mix2_pre[17:0]   =    { mem_addr1[17:16],mem_addr1[2:0],mem_addr1[7:4],mem_addr1[3],mem_addr1[15:8] } ;


     assign mem_addr_mix2_dec[3:0] = mem_addr_mix2_pre[12:9]==4'd0  ? 4'd0  :
                                     mem_addr_mix2_pre[12:9]==4'd1  ? 4'd8  :
                                     mem_addr_mix2_pre[12:9]==4'd2  ? 4'd1  :
                                     mem_addr_mix2_pre[12:9]==4'd3  ? 4'd9  :
                                     mem_addr_mix2_pre[12:9]==4'd4  ? 4'd2  :
                                     mem_addr_mix2_pre[12:9]==4'd5  ? 4'd10 :
                                     mem_addr_mix2_pre[12:9]==4'd6  ? 4'd3  :
                                     mem_addr_mix2_pre[12:9]==4'd7  ? 4'd11 :
                                     mem_addr_mix2_pre[12:9]==4'd8  ? 4'd4  :
                                     mem_addr_mix2_pre[12:9]==4'd9  ? 4'd12 :
                                     mem_addr_mix2_pre[12:9]==4'd10 ? 4'd5  :
                                     mem_addr_mix2_pre[12:9]==4'd11 ? 4'd13 :
                                     mem_addr_mix2_pre[12:9]==4'd12 ? 4'd6  :
                                     mem_addr_mix2_pre[12:9]==4'd13 ? 4'd14 :
                                     mem_addr_mix2_pre[12:9]==4'd14 ? 4'd7  :
                                     mem_addr_mix2_pre[12:9]==4'd15 ? 4'd15 :
                                                                   4'h0 ;

     
     assign mem_addr_mix2[17:0]={mem_addr_mix2_pre[17:13],mem_addr_mix2_dec[3:0],mem_addr_mix2_pre[8:0]};

     assign mem_addr[17:0] = addr_mix_0  ? mem_addr_mix0[17:0] : 
                             addr_mix_1  ? mem_addr_mix1[17:0] :
                             addr_mix_2  ? mem_addr_mix2[17:0] :
                                           mem_addr1[17:0];
                                           


////////////////////////////////////   ////////////////////////////////////
//  SEQ selection
////////////////////////////////////   ////////////////////////////////////

    // array

    assign array_0     = array_sel[3:0]==4'h0 & run3;
    assign array_1     = array_sel[3:0]==4'h1 & run3;
    assign array_2     = array_sel[3:0]==4'h2 & run3;
    assign array_3     = array_sel[3:0]==4'h3 & run3;
//    assign array_4     = array_sel[3:0]==4'h4;
//    assign array_5     = array_sel[3:0]==4'h5;

    assign last_array = array_3;
   // cmp
//   assign cmp_0       = cmp_sel[3:0]==4'b0000;
//   assign cmp_1       = cmp_sel[3:0]==4'b0001;
//   assign cmp_2       = cmp_sel[3:0]==4'b0010;
//   assign cmp_3       = cmp_sel[3:0]==4'b0011;
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
   
   // array logic

  assign array_sel_cntl_out[3:0]=cntl_out[33:30];


  l2t_msff_ctl_macro__width_4 array_sel_reg  (
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

//   assign cmp_sel_cntl_out[3:0] = cntl_out[29:26];

//   msff_ctl_macro cmp_sel_reg (width=4) (
//               .scan_in(cmp_sel_reg_scanin),
//               .scan_out(cmp_sel_reg_scanout),
//               .din      ( cmp_sel[3:0] ),
//               .dout     ( cmp_sel_out[3:0] ));
//
//   assign cmp_sel[3:0]=  (&cmp_sel_cntl_out[3:0] & ~(array_4 | array_5)) ? cmp_sel_out[3:0] :
//                                                                           cmp_sel_cntl_out[3:0];
   

 // march logic                                          

  assign march_element_cntl_out[3:0]=cntl_out[25:22];


  l2t_msff_ctl_macro__width_4 marche_element_reg  (
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

  assign rw_cntl_out[2:0]=cntl_out[3:1];


  l2t_msff_ctl_macro__width_3 march_element_reg  (
               .scan_in(march_element_reg_scanin),
               .scan_out(march_element_reg_scanout),
               .l1clk    ( l1clk_pm1	           ),
               .din      ( rw[2:0] ),
               .dout     ( rw_out[2:0] ),
  .siclk(siclk),
  .soclk(soclk));

   assign rw[2:0]=(&rw_cntl_out[2:0]) ? rw_out[2:0] :
                                                  rw_cntl_out[2:0];



//////////////////////////////////////////////////////////////////
// SEL_PASS LOGIC
//////////////////////////////////////////////////////////////////


   // pass logic:

   // march
   assign sel_march_1_pass = bisi_mode | (mb_ten_n_mode & march_5) | march_8;
 

   assign bisi_wr_mode = mb_default_bisi | mb_user_bisi_rw_mode ?  ~cntl_bisi & run3 :
                                                                   mb_user_bisi_wr_mode & run3;
                         
   assign bisi_rd_mode  =mb_default_bisi | mb_user_bisi_rw_mode ?  cntl_bisi & run3 :
                                                                   mb_user_bisi_rd_mode & run3;
                          



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

			       
 
   assign mb_addr[17:0]= mem_addr[17:0]; 
   assign l2tag_way[3:0]=mb_addr[12:9];

   assign mb_write_data[7:0]=mem_data[7:0];


 

  // only one array read signal should be active   

   assign  mb_array_0_rd    = array_0  & mem_rd; // l2tag
   assign  mb_array_1_rd    = array_1  & mem_rd; // l2vuad (valid)
   assign  mb_array_2_rd    = array_2  & mem_rd; // l2vuad (dirty)
//   assign  mb_array_3_rd    = array_3  & mem_rd & (mb_user_addr_mode ; // l2data
   assign  mb_array_3_rd    = mb_user_addr_mode  ? array_3 & mem_rd & ~quad_cntl:
                                                   array_3 & mem_rd ;



   assign  mb_array_0_wr    = array_0  & mem_wr;
   assign  mb_array_1_wr    = array_1  & mem_wr;
   assign  mb_array_2_wr    = array_2  & mem_wr;
   assign  mb_array_3_wr    = mb_user_addr_mode ? array_3 & mem_wr & quad_cntl : 
                                         array_3  & mem_wr ;

//((~user_mode) | (user_mode & quad_cntl)) & array_3; 
   assign  quad_cntl        = mb_user_quad_sel ? cntl_l2rw_out : ~cntl_l2rw_out;

   assign mb_run = run;


////////////////////////////////////   ////////////////////////////////////
//  DONE LOGIC
////////////////////////////////////   ////////////////////////////////////








  l2t_msff_ctl_macro__width_1  msb_latch  (
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


   l2t_msff_ctl_macro__width_1 run3_transition_reg  (
                  .scan_in(run3_transition_reg_scanin),
                  .scan_out(run3_transition_reg_scanout),
                  .l1clk    ( l1clk_pm1	          ),
                  .din      ( run3  ),
                  .dout     ( run3_out    ),
  .siclk(siclk),
  .soclk(soclk));

   assign run3_transition = run3 & ~run3_out;
   
   l2t_msff_ctl_macro__width_5 done_delay_reg  (
                  .scan_in(done_delay_reg_scanin),
                  .scan_out(done_delay_reg_scanout),
                  .l1clk    ( l1clk_pm1	          ),
                  .din      ( done_delay_in[4:0]  ),
                  .dout     ( done_delay[4:0]    ),
  .siclk(siclk),
  .soclk(soclk));



   assign done_delay_in[4:0] = run3          ?  5'b11111 :
                               mb_done       ?  5'b11110 :
                              (run & ~run3)  ? done_delay[4:0] + 5'b00001 : 
                                                   5'b00000;



   // merge start, done, fail signals:
   // ordering of test operation of engines
   //   -  mb0 parallel with mb2 - mb1
   // default mode:
   //      done - default:   mb_all_done = mb0_done & mb1_done;
   //           - user   :   mb_all_done = mb0_done | mb1_done | mb2_done;
   //      fail - default:   mb_all_fail = mb0_fail | mb1_fail | mb2_fail;
   //           - user   :   mb_all_fail = mb0_fail | mb1_fail | mb2_fail;
   

// merge fail and done signals:

   l2t_msff_ctl_macro__width_3 merged_fail  (
              .scan_in(merged_fail_scanin),
              .scan_out(merged_fail_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( {mbist0_fail,mbist2_fail,mb_fail_merged} ),
  		      .dout     ( {mb0_fail,   mb2_fail,   mbist_fail}    ),
  .siclk(siclk),
  .soclk(soclk));

   l2t_msff_ctl_macro__width_3 merged_done  (
              .scan_in(merged_done_scanin),
              .scan_out(merged_done_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( {mbist0_done,mbist2_done,mb_done_merged} ),
  		      .dout     ( {mb0_done,   mb2_done,   mbist_done}    ),
  .siclk(siclk),
  .soclk(soclk));





   assign mb_fail_merged=mb1_fail | mb2_fail | mb0_fail;


   assign mb_done_merged= user_mode ? (mb0_done | mb2_done | mb1_done) : (mb0_done & mb1_done);



////////////////////////////////////   ////////////////////////////////////
//  FAIL LOGIC
////////////////////////////////////   ////////////////////////////////////

// mb_*_fail signals are all inverted
// 0 - pass, 1 - fail

assign mb_l2tag_fail = ~mbist_l2tag_fail;
assign mb_l2vuad_fail = ~mbist_l2vuad_fail;
assign mb_l2data_fail_pregate =  ~mbist_l2data_fail;


l2t_msff_ctl_macro__width_6  l2data_rd_cmp_reg  (
               .scan_in(l2data_rd_cmp_reg_scanin),
               .scan_out(l2data_rd_cmp_reg_scanout),
               .l1clk    ( l1clk_pm1	           ),
               .din      (  {mb_array_3_rd,array_3_rd_d1,array_3_rd_d2,array_3_rd_d3,array_3_rd_d4,array_3_rd_d5} ),
               .dout     (  {array_3_rd_d1 ,array_3_rd_d2,array_3_rd_d3,array_3_rd_d4,array_3_rd_d5,array_3_rd_d6} ),
  .siclk(siclk),
  .soclk(soclk));


assign mb_l2data_fail = array_3_rd_d6 ? mb_l2data_fail_pregate : 1'b0;

//assign mb_l2data_fail= (~mb_array_3_wr & mb_l2data_fail_pregate);

assign l2tag_fail_d      = run3_transition ? 1'b0 : mb_l2tag_fail    | l2tag_fail_sticky;
assign l2vuad_fail_d     = run3_transition ? 1'b0 : mb_l2vuad_fail   | l2vuad_fail_sticky;
assign l2data_fail_d     = run3_transition ? 1'b0 : mb_l2data_fail   | l2data_fail_sticky;
assign l2tag_cam_fail_d  = run3_transition ? 1'b0 : l2tag_cam_fail   | l2tag_cam_sticky;


l2t_msff_ctl_macro__width_4		mbist_fail_input_reg		 (
 .scan_in(mbist_fail_input_reg_scanin),
 .scan_out(mbist_fail_input_reg_scanout),
 .l1clk    ( l1clk_pm1	           ),
 .din  ({l2tag_fail_d,
         l2vuad_fail_d,
         l2data_fail_d,
         l2tag_cam_fail_d
       }),
 .dout ({l2tag_fail_sticky,
         l2vuad_fail_sticky,
         l2data_fail_sticky,
         l2tag_cam_sticky
       }),
  .siclk(siclk),
  .soclk(soclk));



assign mbist_fail_sticky = l2tag_fail_sticky |
                 		   l2vuad_fail_sticky |
                           l2data_fail_sticky |
                           l2tag_cam_sticky ; 


assign mbist_fail_array = mb_l2tag_fail |
                          mb_l2vuad_fail |
                          mb_l2data_fail | 
                          l2tag_cam_fail  ;


assign valid_fail=run3 | (stop_engine_l & ~mb_done);


assign mb_fail = mb_done ? mbist_fail_sticky  : mbist_fail_array & valid_fail;


//////////////////////////////////////////////////////////////////
// OUTPUT FLOP:
//////////////////////////////////////////////////////////////////

// mb_done


l2t_msff_ctl_macro__width_1  out_mb_tcu_done_reg  (
               .scan_in(out_mb_tcu_done_reg_scanin),
               .scan_out(out_mb_tcu_done_reg_scanout),
               .l1clk    ( l1clk_pm1	           ),
               .din      (  mb_done   ),
               .dout     (  mb_done_out  ),
  .siclk(siclk),
  .soclk(soclk));


// mb_fail


l2t_msff_ctl_macro__width_1 out_mb_tcu_fail_reg  (
               .scan_in(out_mb_tcu_fail_reg_scanin),
               .scan_out(out_mb_tcu_fail_reg_scanout),
               .l1clk    ( l1clk_pm1	           ),
               .din      (  mb_fail   ),
               .dout     (  mb_fail_out  ),
  .siclk(siclk),
  .soclk(soclk));






// thes are all the output flops to arrays
// for the following signals:
//
// - run
// - data
// - address


l2t_msff_ctl_macro__width_1		out_run_mb_arrays_reg		 (
 .scan_in(out_run_mb_arrays_reg_scanin),
 .scan_out(out_run_mb_arrays_reg_scanout),
 .l1clk    ( l1clk_pm1	           ),
 .din  ( mb_run),
 .dout ( mb_run_out),
  .siclk(siclk),
  .soclk(soclk));

// data 8 bits

l2t_msff_ctl_macro__width_16		out_data_mb_arrays_reg		 (
 .scan_in(out_data_mb_arrays_reg_scanin),
 .scan_out(out_data_mb_arrays_reg_scanout),
 .l1clk    ( l1clk_pm1	           ),
 .din  ( {mb_write_data[7:0],mb_write_data[7:0]}),
 .dout ( {mb_write_data_out[7:0],mbist_write_data_decck_out[7:0]}),
  .siclk(siclk),
  .soclk(soclk));


// address 16 bits


l2t_msff_ctl_macro__width_18		out_addr_mb_arrays_reg		 (
 .scan_in(out_addr_mb_arrays_reg_scanin),
 .scan_out(out_addr_mb_arrays_reg_scanout),
 .l1clk    ( l1clk_pm1	           ),
 .din  ( mb_addr[17:0]),
 .dout ( mb_addr_out[17:0]),
  .siclk(siclk),
  .soclk(soclk));



//
// write enable

l2t_msff_ctl_macro__width_4		out_wr_mb_arrays_reg		 (
 .scan_in(out_wr_mb_arrays_reg_scanin),
 .scan_out(out_wr_mb_arrays_reg_scanout),
 .l1clk    ( l1clk_pm1	           ),
 .din  ( {
          mb_array_0_wr,
          mb_array_1_wr,
          mb_array_2_wr,
          mb_array_3_wr
          }		),
 .dout ({ 
          mb_array_0_wr_out,
          mb_array_1_wr_out,
          mb_array_2_wr_out,
          mb_array_3_wr_out
        }		),
  .siclk(siclk),
  .soclk(soclk));



// read enable
 
l2t_msff_ctl_macro__width_3		out_rd_mb_arrays_reg		 (
 .scan_in(out_rd_mb_arrays_reg_scanin),
 .scan_out(out_rd_mb_arrays_reg_scanout),
 .l1clk    ( l1clk_pm1	           ),
 .din  ( {
          mb_array_0_rd,
          mb_array_1_rd,
          mb_array_2_rd
          }		),
 .dout ({ 
          mb_array_0_rd_out,
          mb_array_1_rd_out,
          mb_array_2_rd_out
        }		),
  .siclk(siclk),
  .soclk(soclk));



// port name re-assignment


   assign mbist_run               =mb_run_out;
   assign mbist_write_data[7:0]   =mb_write_data_out[7:0];
   assign mbist_write_data_decck[7:0]   =mbist_write_data_decck_out[7:0]; // duplicated the bus for routing reasons
   assign mbist_l2tag_index[8:0]  =mb_addr_out[8:0];
   assign mbist_l2data_index[8:0] =mb_addr_out[8:0];
   assign mbist_l2vuad_index[8:0] =mb_addr_out[8:0];


   assign mbist_l2tag_way[3:0]    =mb_addr_out[12:9];
   assign mbist_l2data_way[3:0]   =mb_addr_out[12:9];

   // top half 0,1,2,3 ,8 ,9, 10,11
   // bot hald 4,5,6,7  12,13,14,15
   // current:
   //   0  1  2  3  11 10  9  8
   //  15 14 13 12   4  5  6  7
   // designer's request:
   //  0  2 8 10  1 3  9 11  top half
   // 15 13 7  5  4 6 12 14  bot half

   //  mb_addr_out[16:13] 
   //                  000  
   //                  001  
   //                  010  
   //                  011  
   //                  100  
   //                  101  
   //                  110  
   //                  111  



   assign l2data_word[3:0]      = mb_addr_out[16:15]==2'b01 ? ~mb_addr_out[16:13] : mb_addr_out[16:13];

   assign mbist_l2data_word[3:0]  =cntl_l2rw_out  ? ~l2data_word[3:0] : l2data_word[3:0];
  


//   assign l2data_word_frow[3:0] = l2data_word_raw[3:0]==4'd0   ?  4'd0  :
//                                  l2data_word_raw[3:0]==4'd1   ?  4'd2  :
//                                  l2data_word_raw[3:0]==4'd2   ?  4'd8  :
//                                  l2data_word_raw[3:0]==4'd3   ?  4'd10 :
//                                  l2data_word_raw[3:0]==4'd11  ?  4'd1  :
//                                  l2data_word_raw[3:0]==4'd10  ?  4'd3  :
//                                  l2data_word_raw[3:0]==4'd9   ?  4'd9  :
//                                  l2data_word_raw[3:0]==4'd8   ?  4'd11 :
//                                  l2data_word_raw[3:0]==4'd15  ?  4'd15 :
//                                  l2data_word_raw[3:0]==4'd14  ?  4'd13 :
//                                  l2data_word_raw[3:0]==4'd13  ?  4'd7  :
//                                  l2data_word_raw[3:0]==4'd12  ?  4'd5  :
//                                  l2data_word_raw[3:0]==4'd4   ?  4'd4  :
//                                  l2data_word_raw[3:0]==4'd5   ?  4'd6  :
//                                  l2data_word_raw[3:0]==4'd6   ?  4'd12 :
//                                  l2data_word_raw[3:0]==4'd7   ?  4'd14 :
//                                                                  4'd0;
//

   assign mb1_fail              =mb_fail_out;
   assign mb1_done              =mb_done_out;
   assign mbist_l2vuad_write      =mb_array_0_wr_out | mb_array_1_wr_out;
   assign mbist_l2tag_write       =mb_array_2_wr_out;
   assign mbist_l2data_write      =mb_array_3_wr_out;


   assign mbist_l2tag_read        =mb_array_2_rd_out;
   assign mbist_l2vuad_read       =mb_array_0_rd_out | mb_array_1_rd_out;


// spare gates:



l2t_spare_ctl_macro__num_2 spares  (
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
assign user_loop_mode_reg_scanin = user_data_reg_scanout    ;
assign ten_n_mode_reg_scanin     = user_loop_mode_reg_scanout;
assign user_quad_sel_reg_scanin  = ten_n_mode_reg_scanout   ;
assign user_bisi_wr_mode_reg_scanin = user_quad_sel_reg_scanout;
assign user_bisi_rd_mode_reg_scanin = user_bisi_wr_mode_reg_scanout;
assign user_addr_mix_sel_reg_scanin = user_bisi_rd_mode_reg_scanout;
assign mbist_start_reg_scanin    = user_addr_mix_sel_reg_scanout;
assign mbist_start_all_reg_scanin = mbist_start_reg_scanout  ;
assign input_signals_reg_scanin  = mbist_start_all_reg_scanout;
assign mb_enable_reg_scanin      = input_signals_reg_scanout;
assign config_reg_scanin         = mb_enable_reg_scanout    ;
assign loop_again_reg_scanin     = config_reg_scanout       ;
assign mbist_output_reg_scanin   = loop_again_reg_scanout   ;
assign input_cam_hit_reg_scanin  = mbist_output_reg_scanout ;
assign cntl_reg_scanin           = input_cam_hit_reg_scanout;
assign cntl_addr_mix_reg_scanin  = cntl_reg_scanout         ;
assign cam_cmp_fail_delay_reg_scanin = cntl_addr_mix_reg_scanout;
assign array_sel_reg_scanin      = cam_cmp_fail_delay_reg_scanout;
assign marche_element_reg_scanin = array_sel_reg_scanout    ;
assign march_element_reg_scanin  = marche_element_reg_scanout;
assign msb_latch_scanin          = march_element_reg_scanout;
assign run3_transition_reg_scanin = msb_latch_scanout        ;
assign done_delay_reg_scanin     = run3_transition_reg_scanout;
assign merged_fail_scanin        = done_delay_reg_scanout   ;
assign merged_done_scanin        = merged_fail_scanout      ;
assign l2data_rd_cmp_reg_scanin  = merged_done_scanout      ;
assign mbist_fail_input_reg_scanin = l2data_rd_cmp_reg_scanout;
assign out_mb_tcu_done_reg_scanin = mbist_fail_input_reg_scanout;
assign out_mb_tcu_fail_reg_scanin = out_mb_tcu_done_reg_scanout;
assign out_run_mb_arrays_reg_scanin = out_mb_tcu_fail_reg_scanout;
assign out_data_mb_arrays_reg_scanin = out_run_mb_arrays_reg_scanout;
assign out_addr_mb_arrays_reg_scanin = out_data_mb_arrays_reg_scanout;
assign out_wr_mb_arrays_reg_scanin = out_addr_mb_arrays_reg_scanout;
assign out_rd_mb_arrays_reg_scanin = out_wr_mb_arrays_reg_scanout;
assign spares_scanin             = out_rd_mb_arrays_reg_scanout;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule




// any PARAMS parms go into naming of macro

module l2t_msff_ctl_macro__width_18 (
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


