// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2b_mb0_ctl.v
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
module l2b_mb0_ctl (
  mbist_run, 
  mbist_addr, 
  mbist_wb_array_wr_en, 
  mbist_wb_array_rd_en, 
  mbist_rdma_array_wr_en, 
  mbist_rdma_array_rd_en, 
  mbist_fb_array_rd_en, 
  mbist_fb_array_wr_en, 
  mbist_sel_wb_arrays, 
  mbist_cmpsel, 
  mbist_compare_read_sel, 
  fb_mux_sel, 
  scan_out, 
  mbist_done, 
  mbist_fail, 
  wb_or_rdma_rw_fail, 
  fb_rw_fail, 
  rdma_mbist_enable, 
  rdma_mbist_data_in, 
  fb_mbist_enable, 
  fb_mbist_data_in, 
  wb_mbist_enable, 
  wb_mbist_data_in, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
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
wire [2:0] user_start_addr_in;
wire [2:0] user_start_addr;
wire user_stop_addr_reg_scanin;
wire user_stop_addr_reg_scanout;
wire [2:0] user_stop_addr_in;
wire [2:0] user_stop_addr;
wire user_incr_addr_reg_scanin;
wire user_incr_addr_reg_scanout;
wire [2:0] user_incr_addr_in;
wire [2:0] user_incr_addr;
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
wire input_signals_reg_scanin;
wire input_signals_reg_scanout;
wire start;
wire bisi_mode;
wire user_mode;
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
wire rdma_enable;
wire array_1;
wire mb_run;
wire fb_enable;
wire array_2;
wire wb_enable;
wire array_0;
wire sel_wb_arrays;
wire [15:0] cmp_sel_dec;
wire [3:0] cmp_sel;
wire mbist_misc_output_reg_scanin;
wire mbist_misc_output_reg_scanout;
wire [15:0] fb_mux_sel_unreg;
wire [15:0] fb_mux_sel_unreg2;
wire [15:0] fb_mux_sel_unreg3;
wire rdma_enable_d1;
wire fb_enable_d1;
wire fb_enable_d2;
wire wb_enable_d1;
wire wb_enable_d2;
wire cntl_reg_scanin;
wire cntl_reg_scanout;
wire [35:0] cntl_in;
wire [35:0] cntl_out;
wire run3;
wire [16:0] cntl_algr;
wire [16:0] next_algr;
wire sel_nextaddr_reset;
wire sel_nextaddr_restart;
wire overflow;
wire sel_nextaddr_incred;
wire cout_rw;
wire sel_nextaddr_same;
wire [2:0] start_addr;
wire [2:0] restart_addr;
wire [2:0] incred_addr;
wire [2:0] cntl_addr;
wire [2:0] cntl_rw;
wire [2:0] next_rw;
wire cntl_msb;
wire cntl_bisi;
wire mb_default_bisi;
wire mb_user_bisi_rw_mode;
wire [3:0] cntl_array_sel;
wire last_array;
wire [3:0] cntl_cmp_sel;
wire sel_cmp_pass;
wire [1:0] cntl_data_sel;
wire mb_user_data_mode;
wire cntl_addr_mix;
wire mb_user_addr_mode;
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
wire [2:0] incr_addr;
wire [2:0] stop_addr;
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
wire [2:0] adj_addr;
wire rw_3;
wire [2:0] mem_addr1;
wire true_data_l;
wire rw_2;
wire true_data;
wire [7:0] data_pat_sel;
wire [7:0] mem_data;
wire [2:0] mem_addr;
wire [3:0] array_sel;
wire cmp_7;
wire cmp_15;
wire [3:0] march_element;
wire [2:0] rw;
wire [3:0] array_sel_cntl_out;
wire array_sel_reg_scanin;
wire array_sel_reg_scanout;
wire [3:0] array_sel_out;
wire [3:0] cmp_sel_cntl_out;
wire cmp_sel_reg_scanin;
wire cmp_sel_reg_scanout;
wire [3:0] cmp_sel_out;
wire mb_user_cmpsel_hold;
wire [3:0] march_element_cntl_out;
wire marche_element_reg_scanin;
wire marche_element_reg_scanout;
wire [3:0] march_element_out;
wire mb_user_bisi_wr_mode;
wire mb_user_bisi_rd_mode;
wire sel_rw_1_pass;
wire sel_rw_2_pass;
wire sel_rw_5_pass;
wire user_bisi_wr_mode_reg_scanin;
wire user_bisi_wr_mode_reg_scanout;
wire user_bisi_wr_mode_in;
wire user_bisi_wr_mode;
wire user_bisi_rd_mode_reg_scanin;
wire user_bisi_rd_mode_reg_scanout;
wire user_bisi_rd_mode_in;
wire user_bisi_rd_mode;
wire [4:0] mb_cmp_sel;
wire [2:0] mb_addr;
wire [7:0] mb_write_data;
wire mb_array_0_rd;
wire mb_array_1_rd;
wire mb_array_2_rd;
wire mb_array_0_wr;
wire mb_array_1_wr;
wire mb_array_2_wr;
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
wire mb_rdma_rw_fail;
wire mb_wb_rw_fail;
wire mb_fb_rw_fail;
wire rdma_fail_d;
wire rdma_fail_sticky;
wire wb_fail_d;
wire wb_fail_sticky;
wire fb_fail_d;
wire fb_fail_sticky;
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
wire out_cmp_sel_reg_scanin;
wire out_cmp_sel_reg_scanout;
wire [4:0] mb_cmpsel_out;
wire out_run_mb_arrays_reg_scanin;
wire out_run_mb_arrays_reg_scanout;
wire mb_run_out;
wire out_data_mb_arrays_delay1_reg_scanin;
wire out_data_mb_arrays_delay1_reg_scanout;
wire [7:0] mb_write_data_delay_out;
wire out_data_mb_arrays_delay2_reg_scanin;
wire out_data_mb_arrays_delay2_reg_scanout;
wire [7:0] mb_write_data_out;
wire out_data_mb_arrays_delay3_reg_scanin;
wire out_data_mb_arrays_delay3_reg_scanout;
wire [7:0] mb_write_data_out_d1;
wire out_addr_mb_arrays_reg_scanin;
wire out_addr_mb_arrays_reg_scanout;
wire [2:0] mb_addr_out;
wire out_wr_mb_arrays_reg_scanin;
wire out_wr_mb_arrays_reg_scanout;
wire mb_array_0_wr_out;
wire mb_array_1_wr_out;
wire mb_array_2_wr_out;
wire out_rd_mb_arrays_reg_scanin;
wire out_rd_mb_arrays_reg_scanout;
wire mb_array_0_rd_out;
wire mb_array_1_rd_out;
wire mb_array_2_rd_out;
wire [7:0] mbist_compare_read_sel_r;
wire spares_scanin;
wire spares_scanout;


// Please note that this is going to be used as a place holder. 
// The inputs and outputs are defined based on the analysis of cluster memories.
// There are 16 instances of 16*160 rf arrays, where 156 bits of each is
// functionally used. The inputs of these memories are flopped and the outputs
// are not.

// The plan is to test in this sequential order:
// 1. 4 wb_array's
// 2. 4 rdma_array's
// 3. 4 fb_array's
// The mbist will exercise the 4 arrays, 78 bits at a time.
//
// Functionally, the wb_array and rdma_array outputs get muxed into 78 bits
// and then get flopped. Mbist takes those 78 bits and compare.
// For fb_array, for now, the plan is to take the 624 bits to mbist controller 
// and mux them down to 78 bits and then flop them. and finally, use the same 
// comparators as for 78 bits from wb/rdma arrays.

// Very IMPORTANT NOTE: Since there are 624 lines coming in, in order to reduce
// hardware cost due to input muxes, so that memory provides writing 0's or 1's for
// each bit, using two mbist related inputs to the memories:
//
// mbist_run: indicating the memory bist and
// mbist_data0_or1: If 0, during mbist, holding a 0 at the memory inputs,
//                  If 1, during mbist, holding a 1 at the memory inputs. 
// Then the write is decided based on mbist_byte_en and mbist_word_en  bits.
//
// changes:
// 06/10/05:  (rdma,fb,wb)*_mbist_enable is disable when not in membist mode
// 06/10/05:  added address mix logic
// 10/03/05: fb data needs to be 2 cycles compared to wr_en
///////////////////////////////////////////////////////////////////////////////
// Outputs
///////////////////////////////////////////////////////////////////////////////

output            mbist_run;
output [2:0]	  mbist_addr;

output 	          mbist_wb_array_wr_en;
output 	          mbist_wb_array_rd_en;
output 	          mbist_rdma_array_wr_en;
output 	          mbist_rdma_array_rd_en;
output 	          mbist_fb_array_rd_en;
output 	          mbist_fb_array_wr_en;

///output  [15:0]    mbist_sel_78bits;    // picks 1/16 of 623 bits

output            mbist_sel_wb_arrays; // sel=1 for wb and sel=0 for rdma
output  [4:0]     mbist_cmpsel;        // Encoded mux select for wb/rdma array 1/16
output  [2:0]     mbist_compare_read_sel;        // One hot mux select for  wb/rdma array compare data
output [15:0]     fb_mux_sel;	       // picks 1/16 of 623 bits

output            scan_out;
output            mbist_done;
output            mbist_fail;

input		  wb_or_rdma_rw_fail;	// fb compare output
input		  fb_rw_fail;		// fb compare output

//////////////////////////////////////////////////////////////////
//There are 3 different of arrays in l2b.filbuf, writeback buffer 
//and rdma buf
//The following signals go to array directly.
//These are flopped inside the array.
//The enables are used as mux select to pick between functional
//or mbist paths.
//////////////////////////////////////////////////////////////////
output	     	  rdma_mbist_enable;	
output	[7:0]     rdma_mbist_data_in;
output	          fb_mbist_enable;
output	[7:0]     fb_mbist_data_in;
output	          wb_mbist_enable;
output	[7:0]     wb_mbist_data_in;

///////////////////////////////////////////////////////////////////////////////
// Inputs
///////////////////////////////////////////////////////////////////////////////

input              l2clk;
input              scan_in;
input              tcu_pce_ov;             // scan signals
input              tcu_clk_stop;
input              tcu_aclk;
input              tcu_bclk;
input              tcu_scan_en;


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



l2b_mb0_ctl_l1clkhdr_ctl_macro clkgen_freeclk (
        .l2clk  (l2clk 		),
        .l1en   (1'b1		),
        .l1clk  (l1clk		),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));


assign clock_enable	= start_in | mbist_done | mbist_run | mbist_fail ;

l2b_mb0_ctl_l1clkhdr_ctl_macro clkgen (
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
// -  user_start_addr       3
// -  user_stop_addr        3
// -  user_inc_addr         3
// -  user_data_mode        1
// -  user_data             8
// -  user_cmpsel_hold      1
// -  user_cmpsel           3
// -  user_loop_mode        1
// -  ten_n_mode


   l2b_mb0_ctl_msff_ctl_macro__width_4 array_usr_reg  (
              .scan_in(array_usr_reg_scanin),
              .scan_out(array_usr_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_array_sel_in[3:0]       ),
  		      .dout     ( user_array_sel[3:0]      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_array_sel_in[3:0]=user_array_sel[3:0];


   // user address mode

   l2b_mb0_ctl_msff_ctl_macro__width_1 user_addr_mode_reg  (
              .scan_in(user_addr_mode_reg_scanin),
              .scan_out(user_addr_mode_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_addr_mode_in       ),
  		      .dout     ( user_addr_mode        ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_addr_mode_in=user_addr_mode;
   

   //  user start address
   
  l2b_mb0_ctl_msff_ctl_macro__width_3 user_start_addr_reg  (
              .scan_in(user_start_addr_reg_scanin),
              .scan_out(user_start_addr_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
                 .din      ( user_start_addr_in[2:0]       ),
                 .dout     ( user_start_addr[2:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_start_addr_in[2:0]=user_start_addr[2:0];

   //  user stop address
   
  l2b_mb0_ctl_msff_ctl_macro__width_3 user_stop_addr_reg  (
              .scan_in(user_stop_addr_reg_scanin),
              .scan_out(user_stop_addr_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
                 .din      ( user_stop_addr_in[2:0]       ),
                 .dout     ( user_stop_addr[2:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_stop_addr_in[2:0]=user_stop_addr[2:0];
   

  //  user increment address
   
  l2b_mb0_ctl_msff_ctl_macro__width_3 user_incr_addr_reg  (
              .scan_in(user_incr_addr_reg_scanin),
              .scan_out(user_incr_addr_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
                 .din      ( user_incr_addr_in[2:0]       ),
                 .dout     ( user_incr_addr[2:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign user_incr_addr_in[2:0]=user_incr_addr[2:0];

   // user data mode

   l2b_mb0_ctl_msff_ctl_macro__width_1 user_data_mode_reg  (
              .scan_in(user_data_mode_reg_scanin),
              .scan_out(user_data_mode_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_data_mode_in       ),
   		      .dout     ( user_data_mode        ),
  .siclk(siclk),
  .soclk(soclk));

							 
   assign user_data_mode_in=user_data_mode;

   //  user data select
   
   l2b_mb0_ctl_msff_ctl_macro__width_8 user_data_reg  (
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

   l2b_mb0_ctl_msff_ctl_macro__width_1 user_cmpsel_hold_reg  (
              .scan_in(user_cmpsel_hold_reg_scanin),
              .scan_out(user_cmpsel_hold_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_cmpsel_hold_in       ),
   		      .dout     ( user_cmpsel_hold        ),
  .siclk(siclk),
  .soclk(soclk));

							 
   assign user_cmpsel_hold_in=user_cmpsel_hold;



   // user cmp sel reg
   
   l2b_mb0_ctl_msff_ctl_macro__width_4 user_cmpsel_reg  (
              .scan_in(user_cmpsel_reg_scanin),
              .scan_out(user_cmpsel_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_cmpsel_in[3:0]       ),
  		      .dout     ( user_cmpsel[3:0]      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_cmpsel_in[3:0]=user_cmpsel[3:0];


   // user loop mode

   l2b_mb0_ctl_msff_ctl_macro__width_1 user_loop_mode_reg  (
              .scan_in(user_loop_mode_reg_scanin),
              .scan_out(user_loop_mode_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( user_loop_mode_in       ),
  		      .dout     ( user_loop_mode        ),
  .siclk(siclk),
  .soclk(soclk));

  
   assign user_loop_mode_in=user_loop_mode;



   // 10N Algorithm for bit mapping

   l2b_mb0_ctl_msff_ctl_macro__width_1 ten_n_mode_reg  (
              .scan_in(ten_n_mode_reg_scanin),
              .scan_out(ten_n_mode_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
  	          .din      ( ten_n_mode_in       ),
  		      .dout     ( ten_n_mode        ),
  .siclk(siclk),
  .soclk(soclk));

  
   assign ten_n_mode_in=ten_n_mode;


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

  l2b_mb0_ctl_msff_ctl_macro__width_3 input_signals_reg  (
              .scan_in(input_signals_reg_scanin),
              .scan_out(input_signals_reg_scanout),
              .l1clk    ( l1clk	           ),
               .din      ( {mbist_start,mbist_bisi_mode,mbist_user_mode} ),
               .dout     ( {start,bisi_mode,user_mode} ),
  .siclk(siclk),
  .soclk(soclk));
  

  assign start_in=start;

  // 3 cycle delay for the run signal
   



  l2b_mb0_ctl_msff_ctl_macro__width_2 config_reg  (
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



  l2b_mb0_ctl_msff_ctl_macro__width_1 loop_again_reg  (
              .scan_in(loop_again_reg_scanin),
              .scan_out(loop_again_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      (  stop_engine_l   ),
               .dout     (  stop_engine_l_q  ),
  .siclk(siclk),
  .soclk(soclk));


assign loop_again=mb_user_loop_mode ? stop_engine_l & ~stop_engine_l_q:  1'b0;




///////////////////////////////////////////////

assign rdma_enable = array_1 & mb_run;
assign fb_enable   = array_2 & mb_run;
assign wb_enable   = array_0 & mb_run;


assign sel_wb_arrays=array_0;




  assign cmp_sel_dec[0]  = array_2 & (cmp_sel[3:0]==4'b0000);
  assign cmp_sel_dec[1]  = array_2 & (cmp_sel[3:0]==4'b0001);
  assign cmp_sel_dec[2]  = array_2 & (cmp_sel[3:0]==4'b0010);
  assign cmp_sel_dec[3]  = array_2 & (cmp_sel[3:0]==4'b0011);
  assign cmp_sel_dec[4]  = array_2 & (cmp_sel[3:0]==4'b0100);
  assign cmp_sel_dec[5]  = array_2 & (cmp_sel[3:0]==4'b0101);
  assign cmp_sel_dec[6]  = array_2 & (cmp_sel[3:0]==4'b0110);
  assign cmp_sel_dec[7]  = array_2 & (cmp_sel[3:0]==4'b0111);
  assign cmp_sel_dec[8]  = array_2 & (cmp_sel[3:0]==4'b1000);
  assign cmp_sel_dec[9]  = array_2 & (cmp_sel[3:0]==4'b1001);
  assign cmp_sel_dec[10] = array_2 & (cmp_sel[3:0]==4'b1010);
  assign cmp_sel_dec[11] = array_2 & (cmp_sel[3:0]==4'b1011);
  assign cmp_sel_dec[12] = array_2 & (cmp_sel[3:0]==4'b1100);
  assign cmp_sel_dec[13] = array_2 & (cmp_sel[3:0]==4'b1101);
  assign cmp_sel_dec[14] = array_2 & (cmp_sel[3:0]==4'b1110);
  assign cmp_sel_dec[15] = array_2 & (cmp_sel[3:0]==4'b1111);





l2b_mb0_ctl_msff_ctl_macro__width_73		mbist_misc_output_reg		 (
              .scan_in(mbist_misc_output_reg_scanin),
              .scan_out(mbist_misc_output_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
 .din  ({
         sel_wb_arrays,                  
         cmp_sel_dec[15:0],              
         fb_mux_sel_unreg[15:0],
         fb_mux_sel_unreg2[15:0],
         fb_mux_sel_unreg3[15:0],
         rdma_enable,           rdma_enable_d1, 
         fb_enable,             fb_enable_d1,   fb_enable_d2,
         wb_enable,             wb_enable_d1,    wb_enable_d2
         }),                    
 .dout ({

         mbist_sel_wb_arrays,
         fb_mux_sel_unreg[15:0],
         fb_mux_sel_unreg2[15:0],
         fb_mux_sel_unreg3[15:0], 
         fb_mux_sel[15:0],                              // staged 3 cycles instead of 2
         rdma_enable_d1,           rdma_mbist_enable,   // requested to delay by one cycle
         fb_enable_d1,             fb_enable_d2,   fb_mbist_enable,
         wb_enable_d1,             wb_enable_d2,   wb_mbist_enable
          }),
  .siclk(siclk),
  .soclk(soclk));



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////   ////////////////////////////////////
//  CONTROL REG:
////////////////////////////////////   ////////////////////////////////////


   l2b_mb0_ctl_msff_ctl_macro__width_36 cntl_reg  (
              .scan_in(cntl_reg_scanin),
              .scan_out(cntl_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
                 .din      ( cntl_in[35:0]       ),
                 .dout     ( cntl_out[35:0]      ),
  .siclk(siclk),
  .soclk(soclk));


   assign cntl_in[35:19]   = reset_engine   ? {17'b000000_0000000000}:
     	                     ~run3          ? cntl_algr[16:0]:	  
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
   assign sel_nextaddr_same     = ~(sel_nextaddr_reset | sel_nextaddr_restart | sel_nextaddr_incred) ;

   assign cntl_in[5:3] = ({3{sel_nextaddr_reset}} & start_addr[2:0]) |
                          ({3{sel_nextaddr_restart}} & restart_addr[2:0]) |
                          ({3{sel_nextaddr_incred}} & incred_addr[2:0]) |
                          ({3{sel_nextaddr_same}} & cntl_addr[2:0]);  
   

   
   assign cntl_in[18:6]  =  13'b0000000000000;

   
   assign cntl_in[2:0]     = reset_engine  ? 3'b000 : 
                             (~run3 )          ? cntl_rw[2:0]:
                                             next_rw[2:0];



////////////////////////////////////   ////////////////////////////////////
//  NEXT ALGR
////////////////////////////////////   ////////////////////////////////////

   // msb
   assign cntl_msb                    =    start_in &   cntl_out[   35];    // done selection


   assign cntl_bisi                    =       mb_default_bisi | mb_user_bisi_rw_mode ? cntl_out[34] :
                                                                                        1'b1;

 

   // array
   assign cntl_array_sel[3:0]        =       (user_mode | last_array)     ? 4'b1111:
                                                            cntl_out[33:30];    // array selection 
   // cmp
   assign cntl_cmp_sel[3:0]  = sel_cmp_pass ? {4'b1111} :
                                              cntl_out[29:26];

   // data
   assign cntl_data_sel[1:0]          =   (bisi_mode | mb_user_data_mode)  ? 2'b11 :    cntl_out[25:24];    // data selection

   // address mix
   assign cntl_addr_mix               =   (mb_user_addr_mode | bisi_mode)  ? 1'b1  :    cntl_out[   23];    // address mix

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


   assign incr_addr[2:0]  = mb_user_addr_mode ? user_incr_addr[2:0] : 3'b001;

   assign start_addr[2:0] = mb_user_addr_mode ? user_start_addr[2:0] : 3'b000;
   
   
//   assign next_addr_out[8:0] = cout_rw ? cntl_addr[8:0] + incr_addr[8:0] : cntl_addr[8:0];    // next address


   assign incred_addr[2:0] = cntl_addr[2:0] + incr_addr[2:0];


   assign overflow   = upaddr   ? ( cntl_addr[2:0] == stop_addr[2:0])  & (cntl_rw[2:0]==3'b111):
                                  (~cntl_addr[2:0] == start_addr[2:0]) & (cntl_rw[2:0]==3'b111);


//   assign next_addr[4:0]= overflow ? restart_addr[4:0] : next_addr_out[4:0];
  
   assign restart_addr[2:0] = upaddr_pre ? start_addr[2:0] : ~stop_addr[2:0];
      
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

   assign cntl_addr[2:0]   = cntl_out[5:3];

   assign adj_addr          = (five_cycle_march & (rw_1 | rw_3)) ? {cntl_addr[2:1],~cntl_addr[0]}:
                                                                      cntl_addr[2:0] ;

   assign mem_addr1[2:0]    = upaddr   ?  adj_addr[2:0]:  ~adj_addr[2:0];



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


   assign stop_addr[2:0]  =     user_mode & user_addr_mode    ? user_stop_addr[2:0]  : 
                               (array_0 | array_2)            ?  3'b111:  // wb
                               (array_1)                      ?  3'b011:  // rdma
                                                                 3'b111;



////////////////////////////////////   ////////////////////////////////////
//  ADDR MIX
////////////////////////////////////   ////////////////////////////////////


   assign mem_addr[2:0]   =   (addr_mix & (array_0 | array_2)) ? { mem_addr1[0],mem_addr1[2],mem_addr1[1]    } :
                              (addr_mix & array_1)             ? { mem_addr1[2],mem_addr1[0],mem_addr1[1]    } :
                                                                        mem_addr1[2:0];



////////////////////////////////////   ////////////////////////////////////
//  SEQ selection
////////////////////////////////////   ////////////////////////////////////

    // array

    assign array_0     = array_sel[3:0]==4'h0;
    assign array_1     = array_sel[3:0]==4'h1;
    assign array_2     = array_sel[3:0]==4'h2;

   assign last_array= array_2;

   // cmp
//   assign cmp_0      = cmp_sel[4:0]==5'b00000;
//   assign cmp_1      = cmp_sel[4:0]==5'b00001;
//   assign cmp_2      = cmp_sel[4:0]==5'b00010;
//   assign cmp_3      = cmp_sel[4:0]==5'b00011;
//   assign cmp_4      = cmp_sel[4:0]==5'b00100;
//   assign cmp_5      = cmp_sel[4:0]==5'b00101;
//   assign cmp_6      = cmp_sel[4:0]==5'b00110;
   assign cmp_7       = cmp_sel[3:0]==4'b0111;
   assign cmp_15      = cmp_sel[3:0]==4'b1111;

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


  l2b_mb0_ctl_msff_ctl_macro__width_4 array_sel_reg  (
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

   l2b_mb0_ctl_msff_ctl_macro__width_4 cmp_sel_reg  (
              .scan_in(cmp_sel_reg_scanin),
              .scan_out(cmp_sel_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      ( cmp_sel[3:0] ),
               .dout     ( cmp_sel_out[3:0] ),
  .siclk(siclk),
  .soclk(soclk));

   assign cmp_sel[3:0]=  (&cmp_sel_cntl_out[3:0] & ~array_2) ? cmp_sel_out[3:0] :
                           mb_user_cmpsel_hold         ? user_cmpsel[3:0] :
                                                          cmp_sel_cntl_out[3:0];
   

 // march logic                                          

  assign march_element_cntl_out[3:0]=cntl_out[22:19];


  l2b_mb0_ctl_msff_ctl_macro__width_4 marche_element_reg  (
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




   // march
   assign sel_march_1_pass = bisi_mode | (ten_n_mode & march_5) | march_8 ;
 

   // cmp

   assign bisi_wr_mode = mb_default_bisi | mb_user_bisi_rw_mode ?  ~cntl_bisi & run3 :
                                                                   mb_user_bisi_wr_mode & run3;
                         
   assign bisi_rd_mode  =mb_default_bisi | mb_user_bisi_rw_mode ?  cntl_bisi & run3 :
                                                                   mb_user_bisi_rd_mode & run3;
                          


   // cmp

   assign sel_cmp_pass= (mb_user_cmpsel_hold) |
                             (array_0 & cmp_7) |
                             (array_1 & cmp_7) |
                             (array_2 & cmp_15) ;




   // rw
   assign sel_rw_1_pass = bisi_mode | one_cycle_march ;

   assign sel_rw_2_pass = two_cycle_march;
   assign sel_rw_5_pass = five_cycle_march;

   assign sel_rw_pass = (run3 & sel_rw_1_pass & rw_0) |
                        (run3 & sel_rw_2_pass & rw_1) |
                        (run3 & sel_rw_5_pass & rw_4) ;




   l2b_mb0_ctl_msff_ctl_macro__width_1 user_bisi_wr_mode_reg  (
                  .scan_in(user_bisi_wr_mode_reg_scanin),
                  .scan_out(user_bisi_wr_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1	                  ),
  	          .din      ( user_bisi_wr_mode_in   ),
  		  .dout     ( user_bisi_wr_mode      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_bisi_wr_mode_in=user_bisi_wr_mode;

   l2b_mb0_ctl_msff_ctl_macro__width_1 user_bisi_rd_mode_reg  (
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
   assign mb_user_loop_mode = user_mode & user_loop_mode;




   assign mb_user_bisi_wr_mode   = user_mode & user_bisi_wr_mode & bisi_mode;
   assign mb_user_bisi_rd_mode   = user_mode & user_bisi_rd_mode & bisi_mode;

   assign mb_user_bisi_rw_mode   = ((~user_bisi_wr_mode & ~user_bisi_rd_mode) | (user_bisi_wr_mode & user_bisi_rd_mode)) & bisi_mode;

   assign mb_default_bisi = bisi_mode & ~user_mode;




////////////////////////////////////   ////////////////////////////////////
//  membist control assignment
////////////////////////////////////   ////////////////////////////////////

			       
   assign mb_cmp_sel[0] = (array_0 | array_1) & ((cmp_sel[3:0]==4'b0100) | (cmp_sel[3:0]==4'b0000));
   assign mb_cmp_sel[1] = (array_0 | array_1) & ((cmp_sel[3:0]==4'b0101) | (cmp_sel[3:0]==4'b0001));
   assign mb_cmp_sel[2] = (array_0 | array_1) & ((cmp_sel[3:0]==4'b0110) | (cmp_sel[3:0]==4'b0010));
   assign mb_cmp_sel[3] = (array_0 | array_1) & ((cmp_sel[3:0]==4'b0111) | (cmp_sel[3:0]==4'b0011));
   assign mb_cmp_sel[4] = (array_0 | array_1) & (cmp_sel[2]);



 
   assign mb_addr[2:0]=mem_addr[2:0];
   assign mb_write_data[7:0]=mem_data[7:0];


   // only one array read signal should be active   

   assign  mb_array_0_rd = array_0  & mem_rd;
   assign  mb_array_1_rd = array_1  & mem_rd;
   assign  mb_array_2_rd = array_2  & mem_rd;


   // only one array write signal should be active

   assign  mb_array_0_wr  = array_0  & mem_wr;
   assign  mb_array_1_wr  = array_1  & mem_wr;
   assign  mb_array_2_wr  = array_2  & mem_wr;


   assign mb_run = run;



////////////////////////////////////   ////////////////////////////////////
//  DONE LOGIC
////////////////////////////////////   ////////////////////////////////////


  l2b_mb0_ctl_msff_ctl_macro__width_1  msb_latch  (
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


   l2b_mb0_ctl_msff_ctl_macro__width_1 run3_transition_reg  (
                  .scan_in(run3_transition_reg_scanin),
                  .scan_out(run3_transition_reg_scanout),
                  .l1clk    ( l1clk_pm1	          ),
                  .din      ( run3  ),
                  .dout     ( run3_out    ),
  .siclk(siclk),
  .soclk(soclk));

   assign run3_transition = run3 & ~run3_out;
   
   l2b_mb0_ctl_msff_ctl_macro__width_5 done_delay_reg  (
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




////////////////////////////////////   ////////////////////////////////////
//  FAIL LOGIC
////////////////////////////////////   ////////////////////////////////////

// mb_*_fail are the true fail signals

assign mb_rdma_rw_fail = (~sel_wb_arrays & ~wb_or_rdma_rw_fail);
assign mb_wb_rw_fail   = ( sel_wb_arrays & ~wb_or_rdma_rw_fail);


assign mb_fb_rw_fail   = ~fb_rw_fail;

assign rdma_fail_d=run3_transition ? 1'b0 : mb_rdma_rw_fail | rdma_fail_sticky;
assign wb_fail_d  =run3_transition ? 1'b0 : mb_wb_rw_fail   | wb_fail_sticky;
assign fb_fail_d  =run3_transition ? 1'b0 : mb_fb_rw_fail   | fb_fail_sticky;



l2b_mb0_ctl_msff_ctl_macro__width_3		mbist_fail_input_reg		 (
              .scan_in(mbist_fail_input_reg_scanin),
              .scan_out(mbist_fail_input_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
 .din  ({rdma_fail_d,
         wb_fail_d,
         fb_fail_d
       }),
 .dout ({rdma_fail_sticky,
         wb_fail_sticky,
         fb_fail_sticky
       }),
  .siclk(siclk),
  .soclk(soclk));



assign mbist_fail_sticky = rdma_fail_sticky |
                 		   wb_fail_sticky |
                           fb_fail_sticky; 


assign mbist_fail_array = mb_rdma_rw_fail |
                          mb_wb_rw_fail |
                          mb_fb_rw_fail  ;


assign valid_fail=run3 | (stop_engine_l & ~mb_done);
assign mb_fail = mb_done ? mbist_fail_sticky : mbist_fail_array & valid_fail;

//////////////////////////////////////////////////////////////////
// OUTPUT FLOP:
//////////////////////////////////////////////////////////////////

// mb_done


l2b_mb0_ctl_msff_ctl_macro__width_1  out_mb_tcu_done_reg  (
              .scan_in(out_mb_tcu_done_reg_scanin),
              .scan_out(out_mb_tcu_done_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      (  mb_done   ),
               .dout     (  mb_done_out  ),
  .siclk(siclk),
  .soclk(soclk));


// mb_fail


l2b_mb0_ctl_msff_ctl_macro__width_1 out_mb_tcu_fail_reg  (
              .scan_in(out_mb_tcu_fail_reg_scanin),
              .scan_out(out_mb_tcu_fail_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
               .din      (  mb_fail   ),
               .dout     (  mb_fail_out  ),
  .siclk(siclk),
  .soclk(soclk));




// out cmpsel


l2b_mb0_ctl_msff_ctl_macro__width_5		out_cmp_sel_reg		 (
              .scan_in(out_cmp_sel_reg_scanin),
              .scan_out(out_cmp_sel_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
 .din  ({
	 mb_cmp_sel[4:0]	}			),
 .dout ({
	 mb_cmpsel_out[4:0]}		),
  .siclk(siclk),
  .soclk(soclk));


// thes are all the output flops to arrays
// for the following signals:
//
// - run
// - data
// - address


l2b_mb0_ctl_msff_ctl_macro__width_1		out_run_mb_arrays_reg		 (
              .scan_in(out_run_mb_arrays_reg_scanin),
              .scan_out(out_run_mb_arrays_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
 .din  ( mb_run),
 .dout ( mb_run_out),
  .siclk(siclk),
  .soclk(soclk));

// data 8 bits delay 1

l2b_mb0_ctl_msff_ctl_macro__width_8		out_data_mb_arrays_delay1_reg		 (
              .scan_in(out_data_mb_arrays_delay1_reg_scanin),
              .scan_out(out_data_mb_arrays_delay1_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
 .din  ( mb_write_data[7:0]),
 .dout ( mb_write_data_delay_out[7:0]),
  .siclk(siclk),
  .soclk(soclk));


// data 8 bits delay 2

l2b_mb0_ctl_msff_ctl_macro__width_8		out_data_mb_arrays_delay2_reg		 (
              .scan_in(out_data_mb_arrays_delay2_reg_scanin),
              .scan_out(out_data_mb_arrays_delay2_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
 .din  ( mb_write_data_delay_out[7:0]),
 .dout ( mb_write_data_out[7:0]),
  .siclk(siclk),
  .soclk(soclk));


// data 8 bits delay 3 only for fb
   
l2b_mb0_ctl_msff_ctl_macro__width_8          out_data_mb_arrays_delay3_reg            (
              .scan_in(out_data_mb_arrays_delay3_reg_scanin),
              .scan_out(out_data_mb_arrays_delay3_reg_scanout),
              .l1clk    ( l1clk_pm1                ),
 .din  ( mb_write_data_out[7:0]),
 .dout ( mb_write_data_out_d1[7:0]),
  .siclk(siclk),
  .soclk(soclk));

// address 16 bits


l2b_mb0_ctl_msff_ctl_macro__width_3		out_addr_mb_arrays_reg		 (
              .scan_in(out_addr_mb_arrays_reg_scanin),
              .scan_out(out_addr_mb_arrays_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
 .din  ( mb_addr[2:0]),
 .dout ( mb_addr_out[2:0]),
  .siclk(siclk),
  .soclk(soclk));


// write enable

l2b_mb0_ctl_msff_ctl_macro__width_3		out_wr_mb_arrays_reg		 (
              .scan_in(out_wr_mb_arrays_reg_scanin),
              .scan_out(out_wr_mb_arrays_reg_scanout),
              .l1clk    ( l1clk_pm1	           ),
 .din  ( {
          mb_array_0_wr,
          mb_array_1_wr,
          mb_array_2_wr
          }		),
 .dout ({ 
          mb_array_0_wr_out,
          mb_array_1_wr_out,
          mb_array_2_wr_out
        }		),
  .siclk(siclk),
  .soclk(soclk));


// read enable
 
l2b_mb0_ctl_msff_ctl_macro__width_3		out_rd_mb_arrays_reg		 (
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
   assign rdma_mbist_data_in[7:0] =mb_write_data_out[7:0];
   assign wb_mbist_data_in[7:0]   =mb_write_data_out[7:0];
   assign fb_mbist_data_in[7:0]   =mb_write_data_out_d1[7:0];

   assign mbist_addr[2:0]       =mb_addr_out[2:0];
   assign mbist_cmpsel[4:0]     =mb_cmpsel_out[4:0];
   assign mbist_fail            =mb_fail_out;
   assign mbist_done            =mb_done_out;

   assign mbist_wb_array_wr_en   =mb_array_0_wr_out;
   assign mbist_rdma_array_wr_en =mb_array_1_wr_out;
   assign mbist_fb_array_wr_en   =mb_array_2_wr_out;

   assign mbist_wb_array_rd_en   =mb_array_0_rd_out;
   assign mbist_rdma_array_rd_en =mb_array_1_rd_out;
   assign mbist_fb_array_rd_en   =mb_array_2_rd_out;

//  mbist_compare_read

assign mbist_compare_read_sel_r[0] = ~mbist_cmpsel[4] & mbist_cmpsel[0];
assign mbist_compare_read_sel_r[1] = ~mbist_cmpsel[4] & mbist_cmpsel[1];
assign mbist_compare_read_sel_r[2] = ~mbist_cmpsel[4] & mbist_cmpsel[2];
assign mbist_compare_read_sel_r[3] = ~mbist_cmpsel[4] & mbist_cmpsel[3];
assign mbist_compare_read_sel_r[4] =  mbist_cmpsel[4] & mbist_cmpsel[0];
assign mbist_compare_read_sel_r[5] =  mbist_cmpsel[4] & mbist_cmpsel[1];
assign mbist_compare_read_sel_r[6] =  mbist_cmpsel[4] & mbist_cmpsel[2];
assign mbist_compare_read_sel_r[7] =  mbist_cmpsel[4] & mbist_cmpsel[3];

assign mbist_compare_read_sel[2] = mbist_compare_read_sel_r[4] | mbist_compare_read_sel_r[5] | mbist_compare_read_sel_r[6] | mbist_compare_read_sel_r[7];
assign mbist_compare_read_sel[1] = mbist_compare_read_sel_r[2] | mbist_compare_read_sel_r[3] | mbist_compare_read_sel_r[6] | mbist_compare_read_sel_r[7];
assign mbist_compare_read_sel[0] = mbist_compare_read_sel_r[1] | mbist_compare_read_sel_r[3] | mbist_compare_read_sel_r[5] | mbist_compare_read_sel_r[7];



// spare gates:


l2b_mb0_ctl_spare_ctl_macro__num_2 spares  (
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
assign input_signals_reg_scanin  = ten_n_mode_reg_scanout   ;
assign config_reg_scanin         = input_signals_reg_scanout;
assign loop_again_reg_scanin     = config_reg_scanout       ;
assign mbist_misc_output_reg_scanin = loop_again_reg_scanout   ;
assign cntl_reg_scanin           = mbist_misc_output_reg_scanout;
assign array_sel_reg_scanin      = cntl_reg_scanout         ;
assign cmp_sel_reg_scanin        = array_sel_reg_scanout    ;
assign marche_element_reg_scanin = cmp_sel_reg_scanout      ;
assign user_bisi_wr_mode_reg_scanin = marche_element_reg_scanout;
assign user_bisi_rd_mode_reg_scanin = user_bisi_wr_mode_reg_scanout;
assign msb_latch_scanin          = user_bisi_rd_mode_reg_scanout;
assign run3_transition_reg_scanin = msb_latch_scanout        ;
assign done_delay_reg_scanin     = run3_transition_reg_scanout;
assign mbist_fail_input_reg_scanin = done_delay_reg_scanout   ;
assign out_mb_tcu_done_reg_scanin = mbist_fail_input_reg_scanout;
assign out_mb_tcu_fail_reg_scanin = out_mb_tcu_done_reg_scanout;
assign out_cmp_sel_reg_scanin    = out_mb_tcu_fail_reg_scanout;
assign out_run_mb_arrays_reg_scanin = out_cmp_sel_reg_scanout  ;
assign out_data_mb_arrays_delay1_reg_scanin = out_run_mb_arrays_reg_scanout;
assign out_data_mb_arrays_delay2_reg_scanin = out_data_mb_arrays_delay1_reg_scanout;
assign out_data_mb_arrays_delay3_reg_scanin = out_data_mb_arrays_delay2_reg_scanout;
assign out_addr_mb_arrays_reg_scanin = out_data_mb_arrays_delay3_reg_scanout;
assign out_wr_mb_arrays_reg_scanin = out_addr_mb_arrays_reg_scanout;
assign out_rd_mb_arrays_reg_scanin = out_wr_mb_arrays_reg_scanout;
assign spares_scanin             = out_rd_mb_arrays_reg_scanout;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module l2b_mb0_ctl_l1clkhdr_ctl_macro (
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

module l2b_mb0_ctl_msff_ctl_macro__width_4 (
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

module l2b_mb0_ctl_msff_ctl_macro__width_1 (
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

module l2b_mb0_ctl_msff_ctl_macro__width_3 (
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

module l2b_mb0_ctl_msff_ctl_macro__width_8 (
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

module l2b_mb0_ctl_msff_ctl_macro__width_2 (
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

module l2b_mb0_ctl_msff_ctl_macro__width_73 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [72:0] fdin;
wire [71:0] so;

  input [72:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [72:0] dout;
  output scan_out;
assign fdin[72:0] = din[72:0];






dff #(73)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[72:0]),
.si({scan_in,so[71:0]}),
.so({so[71:0],scan_out}),
.q(dout[72:0])
);












endmodule













// any PARAMS parms go into naming of macro

module l2b_mb0_ctl_msff_ctl_macro__width_36 (
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

module l2b_mb0_ctl_msff_ctl_macro__width_5 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module l2b_mb0_ctl_spare_ctl_macro__num_2 (
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

