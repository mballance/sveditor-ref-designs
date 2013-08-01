// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: spc_mb1_ctl.v
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
module spc_mb1_ctl (
  scan_out, 
  mb1_done, 
  mb1_run, 
  mb1_addr, 
  mb1_cmpsel, 
  mb1_write_data, 
  mb1_tsa0_read_en, 
  mb1_tsa0_write_en, 
  mb1_tsa1_read_en, 
  mb1_tsa1_write_en, 
  mb1_tca_read_en, 
  mb1_tca_write_en, 
  mb1_scp0_read_en, 
  mb1_scp0_write_en, 
  mb1_scp1_read_en, 
  mb1_scp1_write_en, 
  mb1_mra0_read_en, 
  mb1_mra0_write_en, 
  mb1_mra1_read_en, 
  mb1_mra1_write_en, 
  mb1_mbist_fail, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  mb2_misc_pmen, 
  mbist_start, 
  mbist_bisi_mode, 
  mbist_user_mode, 
  mmu_mbi_mra0_fail, 
  mmu_mbi_mra1_fail, 
  mmu_mbi_scp0_fail, 
  mmu_mbi_scp1_fail, 
  tlu_mbi_tsa0_fail, 
  tlu_mbi_tsa1_fail, 
  tlu_mbi_tca_fail);
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
wire mb_user_cmpselinc_hold;
wire mb_ten_n_mode;
wire mb_user_bisi_wr_mode;
wire mb_user_bisi_rd_mode;
wire mb_user_bisi_rw_mode;
wire mb_default_bisi;
wire cntl_reg_scanin;
wire cntl_reg_scanout;
wire [34:0] cntl_in;
wire [34:0] cntl_out;
wire run3;
wire [15:0] cntl_algr;
wire [15:0] next_algr;
wire sel_nextaddr_reset;
wire sel_nextaddr_restart;
wire overflow;
wire sel_nextaddr_incred;
wire cout_rw;
wire sel_nextaddr_same;
wire [4:0] start_addr;
wire [4:0] restart_addr;
wire [4:0] incred_addr;
wire [4:0] cntl_addr;
wire [2:0] cntl_rw;
wire [2:0] next_rw;
wire cntl_msb;
wire cntl_bisi;
wire [3:0] cntl_array_sel;
wire last_array;
wire [2:0] cntl_cmp_sel;
wire sel_cmp_pass;
wire [1:0] cntl_data_sel;
wire cntl_addr_mix;
wire addr_mix;
wire [3:0] cntl_march_element;
wire sel_march_1_pass;
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
wire [4:0] incr_addr;
wire [4:0] stop_addr;
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
wire [4:0] adj_addr;
wire rw_3;
wire [4:0] mem_addr1;
wire true_data_l;
wire rw_2;
wire true_data;
wire [7:0] data_pat_sel;
wire [7:0] mem_data;
wire array_0;
wire array_1;
wire array_2;
wire array_3;
wire array_4;
wire array_5;
wire array_6;
wire [4:0] mem_addr;
wire [3:0] array_sel;
wire cmp_2;
wire [2:0] cmp_sel;
wire cmp_3;
wire cmp_4;
wire [3:0] march_element;
wire [2:0] rw;
wire [3:0] array_sel_cntl_out;
wire array_sel_reg_scanin;
wire array_sel_reg_scanout;
wire [3:0] array_sel_out;
wire [2:0] cmp_sel_cntl_out;
wire cmp_sel_reg_scanin;
wire cmp_sel_reg_scanout;
wire [2:0] cmp_sel_out;
wire [3:0] march_element_cntl_out;
wire marche_element_reg_scanin;
wire marche_element_reg_scanout;
wire [3:0] march_element_out;
wire sel_rw_1_pass;
wire sel_rw_2_pass;
wire sel_rw_5_pass;
wire cmp_decoded_arrays;
wire [4:0] mb_cmp_sel;
wire [4:0] mb_addr;
wire [7:0] mb_write_data;
wire mb_array_0_rd;
wire mb_array_1_rd;
wire mb_array_2_rd;
wire mb_array_3_rd;
wire mb_array_4_rd;
wire mb_array_5_rd;
wire mb_array_6_rd;
wire mb_array_0_wr;
wire mb_array_1_wr;
wire mb_array_2_wr;
wire mb_array_3_wr;
wire mb_array_4_wr;
wire mb_array_5_wr;
wire mb_array_6_wr;
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
wire mra0_fail;
wire mra0_fail_sticky;
wire mra1_fail;
wire mra1_fail_sticky;
wire scp0_fail;
wire scp0_fail_sticky;
wire scp1_fail;
wire scp1_fail_sticky;
wire tsa0_fail;
wire tsa0_fail_sticky;
wire tsa1_fail;
wire tsa1_fail_sticky;
wire tca_fail;
wire tca_fail_sticky;
wire fail_reg_scanin;
wire fail_reg_scanout;
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
wire out_data_mb_arrays_reg_scanin;
wire out_data_mb_arrays_reg_scanout;
wire [7:0] mb_write_data_out;
wire out_addr_mb_arrays_reg_scanin;
wire out_addr_mb_arrays_reg_scanout;
wire [4:0] mb_addr_out;
wire out_wr_mb_arrays_reg_scanin;
wire out_wr_mb_arrays_reg_scanout;
wire mb_array_0_wr_out;
wire mb_array_1_wr_out;
wire mb_array_2_wr_out;
wire mb_array_3_wr_out;
wire mb_array_4_wr_out;
wire mb_array_5_wr_out;
wire mb_array_6_wr_out;
wire out_rd_mb_arrays_reg_scanin;
wire out_rd_mb_arrays_reg_scanout;
wire mb_array_0_rd_out;
wire mb_array_1_rd_out;
wire mb_array_2_rd_out;
wire mb_array_3_rd_out;
wire mb_array_4_rd_out;
wire mb_array_5_rd_out;
wire mb_array_6_rd_out;
wire spares_scanin;
wire spares_scanout;





// /////////////////////////////////////////////////////////////////////////////
// Outputs
// /////////////////////////////////////////////////////////////////////////////

   output		scan_out;
   output		mb1_done;
   output		mb1_run;
   output [15:0]	mb1_addr;
   output [4:0]		mb1_cmpsel;
   output [7:0]		mb1_write_data;

   output		mb1_tsa0_read_en;
   output		mb1_tsa0_write_en;
   output		mb1_tsa1_read_en;
   output		mb1_tsa1_write_en;
   output		mb1_tca_read_en;
   output		mb1_tca_write_en;
   output		mb1_scp0_read_en;
   output		mb1_scp0_write_en;
   output		mb1_scp1_read_en;
   output		mb1_scp1_write_en;
   output		mb1_mra0_read_en;
   output		mb1_mra0_write_en;
   output		mb1_mra1_read_en;
   output		mb1_mra1_write_en;
   
   output		mb1_mbist_fail;

// /////////////////////////////////////////////////////////////////////////////
// Inputs
// /////////////////////////////////////////////////////////////////////////////

   input		l2clk;
   input		scan_in;
   input		tcu_pce_ov;             // scan signals
   input		tcu_clk_stop;
   input		tcu_aclk;
   input		tcu_bclk;
   input		tcu_scan_en;
   input		mb2_misc_pmen;		// Power management enable

   input		mbist_start;
   input		mbist_bisi_mode;
   input		mbist_user_mode;   

// membist fail

   input		mmu_mbi_mra0_fail;
   input		mmu_mbi_mra1_fail;
   input		mmu_mbi_scp0_fail;
   input		mmu_mbi_scp1_fail;
   input		tlu_mbi_tsa0_fail;
   input		tlu_mbi_tsa1_fail;
   input		tlu_mbi_tca_fail;



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

spc_mb1_ctll1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk 		),
        .l1en   (1'b1		),
        .l1clk  (l1clk		),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

spc_mb1_ctlmsff_ctl_macro__width_3 pmen  (
	.scan_in(pmen_scanin),
	.scan_out(pmen_scanout),
	.l1clk    ( l1clk					),	// Must be connected to a free running clock
	.din      ({mbist_start, ~mb2_misc_pmen , 1'b0}		),
	.dout     ({start_in   ,  misc_pmen_    , pmem_unused}	),
  .siclk(siclk),
  .soclk(soclk));


assign clock_enable	= start_in | mb1_done | mb1_run | mb1_mbist_fail | misc_pmen_;

spc_mb1_ctll1clkhdr_ctl_macro clkgen_pm1 (
        .l2clk  (l2clk 		),
        .l1en   (clock_enable	),
        .l1clk  (l1clk_pm1	),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));


////////////////////////////////////   ////////////////////////////////////
//  START LOGIC
////////////////////////////////////   ////////////////////////////////////


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

  spc_mb1_ctlmsff_ctl_macro__width_2 input_signals_reg  (
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

  spc_mb1_ctlmsff_ctl_macro__width_1 mb_enable_reg  (
               .scan_in(mb_enable_reg_scanin),
               .scan_out(mb_enable_reg_scanout),
               .l1clk    ( l1clk_pm1	       ),
               .din      ( mb_enable           ),
               .dout     ( mb_enable_out       ),
  .siclk(siclk),
  .soclk(soclk));


//assign mb_enable = user_mode ? mb_enable_out : 1'b0;
  assign mb_enable = mb_enable_out;

 
  assign start = user_mode ? (mb_enable_out & start_in) :
                              start_in;



  spc_mb1_ctlmsff_ctl_macro__width_2 config_reg  (
               .scan_in(config_reg_scanin),
               .scan_out(config_reg_scanout),
               .l1clk    ( l1clk_pm1	        ),
               .din      ( config_in[1:0]       ),
               .dout     ( config_out[1:0]      ),
  .siclk(siclk),
  .soclk(soclk));

   
  assign config_in[0]        =    start;
  assign config_in[1]        =    config_out[0];
  assign start_transition    =    config_out[0] & ~config_out[1];
  assign end_transition      =   ~config_out[0] &  config_out[1];
  assign reset_engine        =    start_transition | loop_again  | end_transition;
  assign run                 =    config_out[1] ;





  spc_mb1_ctlmsff_ctl_macro__width_1 loop_again_reg  (
               .scan_in(loop_again_reg_scanin),
               .scan_out(loop_again_reg_scanout),
               .l1clk    ( l1clk_pm1	     ),
               .din      ( stop_engine_l     ),
               .dout     ( stop_engine_l_q   ),
  .siclk(siclk),
  .soclk(soclk));


assign loop_again=mb_user_loop_mode ? (stop_engine_l & ~stop_engine_l_q): 1'b0;



////////////////////////////////////   ////////////////////////////////////
//  USER MODE REGISTER (CONFIG)
////////////////////////////////////   ////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
// user control registers
//                         size
// -  user_array            4
// -  user_addr_mode        1
// -  user_start_addr      15
// -  user_stop_addr       15
// -  user_inc_addr        15
// -  user_data_mode        1
// -  user_data             8
// -  user_cmpselinc_mode   1
// -  user_cmpselinc        3
// -  user_loop_mode        1

   spc_mb1_ctlmsff_ctl_macro__width_4 array_usr_reg  (
                  .scan_in(array_usr_reg_scanin),
                  .scan_out(array_usr_reg_scanout),
                  .l1clk    ( l1clk_pm1	                ),
  	          .din      ( user_array_in[3:0]	),
  		  .dout     ( user_array[3:0]		),
  .siclk(siclk),
  .soclk(soclk));

   assign user_array_in[3:0]=user_array[3:0];


   // user address mode

   spc_mb1_ctlmsff_ctl_macro__width_1 user_addr_mode_reg  (
                  .scan_in(user_addr_mode_reg_scanin),
                  .scan_out(user_addr_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1	                ),
  	          .din      ( user_addr_mode_in		),
  		  .dout     ( user_addr_mode		),
  .siclk(siclk),
  .soclk(soclk));

   assign user_addr_mode_in=user_addr_mode;
   

   //  user start address
   
  spc_mb1_ctlmsff_ctl_macro__width_5 user_start_addr_reg  (
                 .scan_in(user_start_addr_reg_scanin),
                 .scan_out(user_start_addr_reg_scanout),
                 .l1clk    ( l1clk_pm1	                ),
                 .din      ( user_start_addr_in[4:0]	),
                 .dout     ( user_start_addr[4:0]	),
  .siclk(siclk),
  .soclk(soclk));


   assign user_start_addr_in[4:0]=user_start_addr[4:0];

   //  user stop address
   
  spc_mb1_ctlmsff_ctl_macro__width_5 user_stop_addr_reg  (
                 .scan_in(user_stop_addr_reg_scanin),
                 .scan_out(user_stop_addr_reg_scanout),
                 .l1clk    ( l1clk_pm1	                ),
                 .din      ( user_stop_addr_in[4:0]	),
                 .dout     ( user_stop_addr[4:0]	),
  .siclk(siclk),
  .soclk(soclk));


   assign user_stop_addr_in[4:0]=user_stop_addr[4:0];
   

  //  user increment address
   
  spc_mb1_ctlmsff_ctl_macro__width_5 user_incr_addr_reg  (
                 .scan_in(user_incr_addr_reg_scanin),
                 .scan_out(user_incr_addr_reg_scanout),
                 .l1clk    ( l1clk_pm1	                ),
                 .din      ( user_incr_addr_in[4:0]	),
                 .dout     ( user_incr_addr[4:0]	),
  .siclk(siclk),
  .soclk(soclk));


   assign user_incr_addr_in[4:0]=user_incr_addr[4:0];

   // user data mode

   spc_mb1_ctlmsff_ctl_macro__width_1 user_data_mode_reg  (
                  .scan_in(user_data_mode_reg_scanin),
                  .scan_out(user_data_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1	                ),
  	          .din      ( user_data_mode_in		),
   		  .dout     ( user_data_mode		),
  .siclk(siclk),
  .soclk(soclk));

							 
   assign user_data_mode_in=user_data_mode;

   //  user data select
   
   spc_mb1_ctlmsff_ctl_macro__width_8 user_data_reg  (
                 .scan_in(user_data_reg_scanin),
                 .scan_out(user_data_reg_scanout),
                 .l1clk    ( l1clk_pm1	                ),
                 .din      ( user_data_in[7:0]		),
                 .dout     ( user_data[7:0]		),
  .siclk(siclk),
  .soclk(soclk));


   assign user_data_in[7:0]    =    user_data[7:0];

   // user cmp sel inc
   // if its one, user need to program the cmpselinc register
   // otherwise it will loop all cmpsel

   spc_mb1_ctlmsff_ctl_macro__width_1 user_cmpselinc_hold_reg  (
                  .scan_in(user_cmpselinc_hold_reg_scanin),
                  .scan_out(user_cmpselinc_hold_reg_scanout),
                  .l1clk    ( l1clk_pm1	                ),
  	          .din      ( user_cmpselinc_hold_in	),
   		  .dout     ( user_cmpselinc_hold	),
  .siclk(siclk),
  .soclk(soclk));

							 
   assign user_cmpselinc_hold_in=user_cmpselinc_hold;



   // user cmp sel reg
   
   spc_mb1_ctlmsff_ctl_macro__width_3 user_cmpsel_reg  (
                  .scan_in(user_cmpsel_reg_scanin),
                  .scan_out(user_cmpsel_reg_scanout),
                  .l1clk    ( l1clk_pm1	                ),
  	          .din      ( user_cmpsel_in[2:0]	),
  		  .dout     ( user_cmpsel[2:0]		),
  .siclk(siclk),
  .soclk(soclk));

   assign user_cmpsel_in[2:0]=user_cmpsel[2:0];


   // user loop mode

   spc_mb1_ctlmsff_ctl_macro__width_1 user_loop_mode_reg  (
                  .scan_in(user_loop_mode_reg_scanin),
                  .scan_out(user_loop_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1	                ),
  	          .din      ( user_loop_mode_in		),
  		  .dout     ( user_loop_mode		),
  .siclk(siclk),
  .soclk(soclk));

  
   assign user_loop_mode_in=user_loop_mode;



   // 10N Algorithm for bit mapping

   spc_mb1_ctlmsff_ctl_macro__width_1 ten_n_mode_reg  (
                  .scan_in(ten_n_mode_reg_scanin),
                  .scan_out(ten_n_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1	                ),
  	          .din      ( ten_n_mode_in		),
  		  .dout     ( ten_n_mode		),
  .siclk(siclk),
  .soclk(soclk));

  
   assign ten_n_mode_in=ten_n_mode;


   spc_mb1_ctlmsff_ctl_macro__width_1 user_bisi_wr_mode_reg  (
                  .scan_in(user_bisi_wr_mode_reg_scanin),
                  .scan_out(user_bisi_wr_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1	                  ),
  	          .din      ( user_bisi_wr_mode_in   ),
  		  .dout     ( user_bisi_wr_mode      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_bisi_wr_mode_in=user_bisi_wr_mode;

   spc_mb1_ctlmsff_ctl_macro__width_1 user_bisi_rd_mode_reg  (
                  .scan_in(user_bisi_rd_mode_reg_scanin),
                  .scan_out(user_bisi_rd_mode_reg_scanout),
                  .l1clk    ( l1clk_pm1	                  ),
  	          .din      ( user_bisi_rd_mode_in   ),
  		  .dout     ( user_bisi_rd_mode      ),
  .siclk(siclk),
  .soclk(soclk));

   assign user_bisi_rd_mode_in=user_bisi_rd_mode;




   assign mb_user_data_mode      = user_mode & user_data_mode;
   assign mb_user_addr_mode      = user_mode & user_addr_mode;
   assign mb_user_cmpselinc_hold = user_mode & user_cmpselinc_hold;
   assign mb_ten_n_mode          = user_mode & ten_n_mode;
   assign mb_user_loop_mode      = user_mode & user_loop_mode;



   assign mb_user_bisi_wr_mode   = user_mode & user_bisi_wr_mode & bisi_mode;
   assign mb_user_bisi_rd_mode   = user_mode & user_bisi_rd_mode & bisi_mode;

   assign mb_user_bisi_rw_mode   = ((~user_bisi_wr_mode & ~user_bisi_rd_mode) | (user_bisi_wr_mode & user_bisi_rd_mode)) & bisi_mode;

   assign mb_default_bisi = bisi_mode & ~user_mode;



////////////////////////////////////   ////////////////////////////////////
//  CONTROL REG:
////////////////////////////////////   ////////////////////////////////////


   spc_mb1_ctlmsff_ctl_macro__width_24 cntl_reg  (
                 .scan_in(cntl_reg_scanin),
                 .scan_out(cntl_reg_scanout),
                 .l1clk    ( l1clk_pm1	                   ),
                 .din      ({cntl_in[34:19] ,cntl_in[7:0]} ),
                 .dout     ({cntl_out[34:19],cntl_out[7:0]}),
  .siclk(siclk),
  .soclk(soclk));


   assign cntl_in[34:19]   = reset_engine   ? {16'b0000_0000000000}:
     	                     ~run3          ? cntl_algr[15:0]:	  
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


   assign cntl_in[7:3]  = ({5{sel_nextaddr_reset  }} & start_addr[4:0]) |
                          ({5{sel_nextaddr_restart}} & restart_addr[4:0]) |
                          ({5{sel_nextaddr_incred }} & incred_addr[4:0]) |
                          ({5{sel_nextaddr_same   }} & cntl_addr[4:0]);  
   

   assign cntl_in[2:0]     = reset_engine  ? 3'b000 : 
                            ~run3          ? cntl_rw[2:0]:
                                             next_rw[2:0];

////////////////////////////////////   ////////////////////////////////////
//  NEXT ALGR
////////////////////////////////////   ////////////////////////////////////

   // msb
   assign cntl_msb                    =      start_in & cntl_out[34];    // done selection

   assign cntl_bisi                    =       mb_default_bisi | mb_user_bisi_rw_mode ? cntl_out[33] :
                                                                                        1'b1;
   // array
   assign cntl_array_sel[3:0]         =       (last_array | user_mode) ? 4'b1111:
                                                        cntl_out[32:29];    // array selection 
   // cmp
   assign cntl_cmp_sel[2:0]           =   sel_cmp_pass ? {3'b111} :
                                                        cntl_out[28:26];

   // data
   assign cntl_data_sel[1:0]          =   (bisi_mode | mb_user_data_mode)  ? 2'b11 :    cntl_out[25:24];    // data selection

   // address mix
   assign cntl_addr_mix               =   (mb_user_addr_mode | bisi_mode) ? 1'b1  :    cntl_out[23];    // address mix
   assign addr_mix                    =   (mb_user_addr_mode | bisi_mode) ? 1'b0  :    cntl_out[23];

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


   assign incr_addr[4:0]  = mb_user_addr_mode ? user_incr_addr[4:0] : 5'b00001;

   assign start_addr[4:0] = mb_user_addr_mode ? user_start_addr[4:0] : 5'b00000;
   
   
//   assign next_addr_out[7:0] = cout_rw ? cntl_addr[7:0] + incr_addr[7:0] : cntl_addr[7:0];    // next address


   assign incred_addr[4:0] = cntl_addr[4:0] + incr_addr[4:0];


   assign overflow   = upaddr   ? ( cntl_addr[4:0] == stop_addr[4:0])  & (cntl_rw[2:0]==3'b111):
                                  (~cntl_addr[4:0] == start_addr[4:0]) & (cntl_rw[2:0]==3'b111);


//   assign next_addr[7:0]= overflow ? restart_addr[7:0] : next_addr_out[7:0];
  
   assign restart_addr[4:0] = upaddr_pre ? start_addr[4:0] : ~stop_addr[4:0];
      
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

   assign cntl_addr[4:0]   = cntl_out[7:3];

   assign adj_addr[4:0]     = (five_cycle_march & (rw_1 | rw_3)) ? {cntl_addr[4:1],~cntl_addr[0]}:
                                                                      cntl_addr[4:0] ;

   assign mem_addr1[4:0]    = upaddr   ?  adj_addr[4:0]:  ~adj_addr[4:0];



   /////////////////////
   // true data
   ////////////////////

   assign true_data_l     =   bisi_mode |
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

   assign data_pat_sel[7:0]        =     (mb_user_data_mode)     ?    user_data[7:0]:
                                         bisi_mode               ?    8'hFF:              
                                         (cntl_data_sel[1:0] == 2'h0)            ?    8'hAA:
                                         (cntl_data_sel[1:0] == 2'h1)            ?    8'h99:
                                         (cntl_data_sel[1:0] == 2'h2)            ?    8'hCC:
                                                                                      8'h00;
   assign mem_data[7:0]         = true_data ? data_pat_sel[7:0] : ~data_pat_sel[7:0];

////////////////////////////////////   ////////////////////////////////////
//  STOP ADDR
////////////////////////////////////   ////////////////////////////////////

   assign stop_addr[4:0]  = mb_user_addr_mode ? user_stop_addr[4:0]  : 
                                                   array_0   ?  5'b1_1111:  // tsa0
                                                   array_1   ?  5'b1_1111:  // tsa1
                                                   array_2   ?  5'b1_1111:  // tca
                                                   array_3   ?  5'b1_1111:  // scp0
                                                   array_4   ?  5'b1_1111:  // scp1
                                                   array_5   ?  5'b1_1111:  // mra0
                                                   array_6   ?  5'b1_1111:  // mra1
                                                                5'b1_1111;




////////////////////////////////////   ////////////////////////////////////
//  ADDR MIX
////////////////////////////////////   ////////////////////////////////////

   assign mem_addr[4:0]   =  (addr_mix) ?  
                                   {mem_addr1[0],mem_addr1[4:1]} :
                                    mem_addr1[4:0];




////////////////////////////////////   ////////////////////////////////////
//  SEQ selection
////////////////////////////////////   ////////////////////////////////////

    // array
    assign array_0     = array_sel[3:0]==4'h0;
    assign array_1     = array_sel[3:0]==4'h1;
    assign array_2     = array_sel[3:0]==4'h2;
    assign array_3     = array_sel[3:0]==4'h3;
    assign array_4     = array_sel[3:0]==4'h4;
    assign array_5     = array_sel[3:0]==4'h5;
    assign array_6     = array_sel[3:0]==4'h6;


   assign last_array= array_6;

   // cmp
// assign cmp_0      = cmp_sel[2:0]==3'b000;
   assign cmp_2      = cmp_sel[2:0]==3'b010;
   assign cmp_3      = cmp_sel[2:0]==3'b011;
   assign cmp_4      = cmp_sel[2:0]==3'b100;

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
// assign rw_5           =  (rw[2:0]==3'b101);
// assign rw_6           =  (rw[2:0]==3'b110);
// assign rw_7           =  (rw[2:0]==3'b111);


////////////////////////////////////   ////////////////////////////////////
//  SEQ logic
////////////////////////////////////   ////////////////////////////////////
   

   // array logic

  assign array_sel_cntl_out[3:0]=cntl_out[32:29];


  spc_mb1_ctlmsff_ctl_macro__width_4 array_sel_reg  (
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


  
   // cmp logic

   assign cmp_sel_cntl_out[2:0] = cntl_out[28:26];

   spc_mb1_ctlmsff_ctl_macro__width_3 cmp_sel_reg  (
               .scan_in(cmp_sel_reg_scanin),
               .scan_out(cmp_sel_reg_scanout),
               .l1clk    ( l1clk_pm1        ),
               .din      ( cmp_sel[2:0]     ),
               .dout     ( cmp_sel_out[2:0] ),
  .siclk(siclk),
  .soclk(soclk));

   assign cmp_sel[2:0]=(&cmp_sel_cntl_out[2:0]) ? cmp_sel_out[2:0] :
                        mb_user_cmpselinc_hold         ? user_cmpsel[2:0] :
                                                  cmp_sel_cntl_out[2:0];
   

 // march logic                                          

  assign march_element_cntl_out[3:0]=cntl_out[22:19];


  spc_mb1_ctlmsff_ctl_macro__width_4 marche_element_reg  (
               .scan_in(marche_element_reg_scanin),
               .scan_out(marche_element_reg_scanout),
               .l1clk    ( l1clk_pm1          ),
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
   assign sel_march_1_pass = bisi_mode | (mb_ten_n_mode & march_5) | march_8;
 


   assign bisi_wr_mode = mb_default_bisi | mb_user_bisi_rw_mode ?  ~cntl_bisi & run3 :
                                                                   mb_user_bisi_wr_mode & run3;
                         
   assign bisi_rd_mode  =mb_default_bisi | mb_user_bisi_rw_mode ?  cntl_bisi & run3 :
                                                                   mb_user_bisi_rd_mode & run3;
                          


   // cmp

   assign sel_cmp_pass= (mb_user_cmpselinc_hold | bisi_wr_mode) |
                             (array_0 & cmp_4) |  // tsa0 5
                             (array_1 & cmp_4) |  // tsa1 5
  	                     (array_2 & cmp_2) |  // tca  3
                             (array_3 & cmp_2) |  // scp0 3
                             (array_4 & cmp_2) |  // scp1 3
                             (array_5 & cmp_3) |  // mra0 4
                             (array_6 & cmp_3) ;  // mra1 4



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

			       
   // TSA0, TSA1, and TCA are fully decoded for cmp signals
   // extra logic for cmp
   assign cmp_decoded_arrays= array_0 | array_1 | array_2 ;

   assign mb_cmp_sel[4:0] = cmp_decoded_arrays & (cmp_sel[2:0] == 3'b000) ? 5'b00001 :
                            cmp_decoded_arrays & (cmp_sel[2:0] == 3'b001) ? 5'b00010 :
                            cmp_decoded_arrays & (cmp_sel[2:0] == 3'b010) ? 5'b00100 :
                            cmp_decoded_arrays & (cmp_sel[2:0] == 3'b011) ? 5'b01000 :
                            cmp_decoded_arrays & (cmp_sel[2:0] == 3'b100) ? 5'b10000 :
                                                                            {2'b00,cmp_sel[2:0]};

 
   assign mb_addr[4:0]=mem_addr[4:0];
   assign mb_write_data[7:0]=mem_data[7:0];


   // only one array read signal should be active   

   assign  mb_array_0_rd= array_0  && mem_rd;
   assign  mb_array_1_rd= array_1  && mem_rd;
   assign  mb_array_2_rd= array_2  && mem_rd;
   assign  mb_array_3_rd= array_3  && mem_rd;
   assign  mb_array_4_rd= array_4  && mem_rd;
   assign  mb_array_5_rd= array_5  && mem_rd;
   assign  mb_array_6_rd= array_6  && mem_rd;


   
   assign  mb_array_0_wr= array_0  && mem_wr;
   assign  mb_array_1_wr= array_1  && mem_wr;
   assign  mb_array_2_wr= array_2  && mem_wr;
   assign  mb_array_3_wr= array_3  && mem_wr;
   assign  mb_array_4_wr= array_4  && mem_wr;
   assign  mb_array_5_wr= array_5  && mem_wr;
   assign  mb_array_6_wr= array_6  && mem_wr;


   assign mb_run = run;



////////////////////////////////////   ////////////////////////////////////
//  DONE LOGIC
////////////////////////////////////   ////////////////////////////////////


  spc_mb1_ctlmsff_ctl_macro__width_1  msb_latch  (
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


   spc_mb1_ctlmsff_ctl_macro__width_1 run3_transition_reg  (
                  .scan_in(run3_transition_reg_scanin),
                  .scan_out(run3_transition_reg_scanout),
                  .l1clk    ( l1clk_pm1	          ),
                  .din      ( run3  ),
                  .dout     ( run3_out    ),
  .siclk(siclk),
  .soclk(soclk));

   assign run3_transition = run3 & ~run3_out;
   
   spc_mb1_ctlmsff_ctl_macro__width_5 done_delay_reg  (
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



assign mra0_fail=run3_transition ? 1'b0 : (mmu_mbi_mra0_fail | mra0_fail_sticky);
assign mra1_fail=run3_transition ? 1'b0 : (mmu_mbi_mra1_fail | mra1_fail_sticky);
assign scp0_fail=run3_transition ? 1'b0 : (mmu_mbi_scp0_fail | scp0_fail_sticky);
assign scp1_fail=run3_transition ? 1'b0 : (mmu_mbi_scp1_fail | scp1_fail_sticky);
assign tsa0_fail=run3_transition ? 1'b0 : (tlu_mbi_tsa0_fail | tsa0_fail_sticky);
assign tsa1_fail=run3_transition ? 1'b0 : (tlu_mbi_tsa1_fail | tsa1_fail_sticky);
assign tca_fail =run3_transition ? 1'b0 : (tlu_mbi_tca_fail  | tca_fail_sticky);



spc_mb1_ctlmsff_ctl_macro__width_7		fail_reg		 (
 .scan_in(fail_reg_scanin),
 .scan_out(fail_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ({mra0_fail			,
	     mra1_fail			,
	     scp0_fail			,
	     scp1_fail			,
	     tsa0_fail			,
	     tsa1_fail			,
	     tca_fail}			),
 .dout ({mra0_fail_sticky		,
	     mra1_fail_sticky		,
	     scp0_fail_sticky		,
	     scp1_fail_sticky		,
	     tsa0_fail_sticky		,
	     tsa1_fail_sticky		,
	     tca_fail_sticky}		),
  .siclk(siclk),
  .soclk(soclk));




assign mbist_fail_sticky = mra0_fail_sticky |
                           mra1_fail_sticky |
                           scp0_fail_sticky |
                           scp1_fail_sticky |
                           tsa0_fail_sticky |
                           tsa1_fail_sticky |
                           tca_fail_sticky; 


assign mbist_fail_array = mmu_mbi_mra0_fail |
                          mmu_mbi_mra1_fail |
                          mmu_mbi_scp0_fail |
                          mmu_mbi_scp1_fail | 
                          tlu_mbi_tsa0_fail |
                          tlu_mbi_tsa1_fail |
                          tlu_mbi_tca_fail  ;

assign valid_fail=run3 | (stop_engine_l & ~mb_done);


assign mb_fail = mb_done ? mbist_fail_sticky : mbist_fail_array & valid_fail;


//////////////////////////////////////////////////////////////////
// OUTPUT FLOP:
//////////////////////////////////////////////////////////////////

// mb_done


spc_mb1_ctlmsff_ctl_macro__width_1  out_mb_tcu_done_reg  (
               .scan_in(out_mb_tcu_done_reg_scanin),
               .scan_out(out_mb_tcu_done_reg_scanout),
               .l1clk    ( l1clk_pm1    ),
               .din      ( mb_done      ),
               .dout     ( mb_done_out  ),
  .siclk(siclk),
  .soclk(soclk));


// mb_fail


spc_mb1_ctlmsff_ctl_macro__width_1 out_mb_tcu_fail_reg  (
               .scan_in(out_mb_tcu_fail_reg_scanin),
               .scan_out(out_mb_tcu_fail_reg_scanout),
               .l1clk    ( l1clk_pm1    ),
               .din      ( mb_fail      ),
               .dout     ( mb_fail_out  ),
  .siclk(siclk),
  .soclk(soclk));




// out cmpsel


spc_mb1_ctlmsff_ctl_macro__width_5		out_cmp_sel_reg		 (
 .scan_in(out_cmp_sel_reg_scanin),
 .scan_out(out_cmp_sel_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ( mb_cmp_sel[4:0]		),
 .dout ( mb_cmpsel_out[4:0]		),
  .siclk(siclk),
  .soclk(soclk));



// thes are all the output flops to arrays
// for the following signals:
//
// - run
// - data
// - address


spc_mb1_ctlmsff_ctl_macro__width_1		out_run_mb_arrays_reg		 (
 .scan_in(out_run_mb_arrays_reg_scanin),
 .scan_out(out_run_mb_arrays_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ( mb_run				),
 .dout ( mb_run_out			),
  .siclk(siclk),
  .soclk(soclk));

// data 8 bits

spc_mb1_ctlmsff_ctl_macro__width_8		out_data_mb_arrays_reg		 (
 .scan_in(out_data_mb_arrays_reg_scanin),
 .scan_out(out_data_mb_arrays_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ( mb_write_data[7:0]		),
 .dout ( mb_write_data_out[7:0]		),
  .siclk(siclk),
  .soclk(soclk));


// address 16 bits


spc_mb1_ctlmsff_ctl_macro__width_5		out_addr_mb_arrays_reg		 (
 .scan_in(out_addr_mb_arrays_reg_scanin),
 .scan_out(out_addr_mb_arrays_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ( mb_addr[4:0]			),
 .dout ( mb_addr_out[4:0]		),
  .siclk(siclk),
  .soclk(soclk));


//
// write enable

spc_mb1_ctlmsff_ctl_macro__width_7		out_wr_mb_arrays_reg		 (
 .scan_in(out_wr_mb_arrays_reg_scanin),
 .scan_out(out_wr_mb_arrays_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ( {mb_array_0_wr,
     	  mb_array_1_wr,
	  mb_array_2_wr,
	  mb_array_3_wr,
          mb_array_4_wr,
     	  mb_array_5_wr,
	  mb_array_6_wr}		),
 .dout ({ mb_array_0_wr_out,
       	  mb_array_1_wr_out,
   	  mb_array_2_wr_out,
   	  mb_array_3_wr_out,
          mb_array_4_wr_out,
       	  mb_array_5_wr_out,
   	  mb_array_6_wr_out}		),
  .siclk(siclk),
  .soclk(soclk));


// read enable
 
spc_mb1_ctlmsff_ctl_macro__width_7		out_rd_mb_arrays_reg		 (
 .scan_in(out_rd_mb_arrays_reg_scanin),
 .scan_out(out_rd_mb_arrays_reg_scanout),
 .l1clk( l1clk_pm1			),
 .din  ( {mb_array_0_rd,
     	  mb_array_1_rd,
	  mb_array_2_rd,
	  mb_array_3_rd,
          mb_array_4_rd,
     	  mb_array_5_rd,
	  mb_array_6_rd}		),
 .dout ({ mb_array_0_rd_out,
          mb_array_1_rd_out,
          mb_array_2_rd_out,
          mb_array_3_rd_out,
          mb_array_4_rd_out,
          mb_array_5_rd_out,
          mb_array_6_rd_out}		),
  .siclk(siclk),
  .soclk(soclk));


// port name re-assignment


   assign mb1_run             =mb_run_out;
   assign mb1_write_data[7:0] =mb_write_data_out[7:0];
   assign mb1_addr[15:0]      ={11'b000_0000_0000,mb_addr_out[4:0]};
   assign mb1_cmpsel[4:0]     =mb_cmpsel_out[4:0];
   assign mb1_mbist_fail      = mb_fail_out;
   assign mb1_done            = mb_done_out;

   assign mb1_tsa0_write_en=mb_array_0_wr_out;
   assign mb1_tsa1_write_en=mb_array_1_wr_out;
   assign mb1_tca_write_en =mb_array_2_wr_out;
   assign mb1_scp0_write_en=mb_array_3_wr_out;
   assign mb1_scp1_write_en=mb_array_4_wr_out;
   assign mb1_mra0_write_en=mb_array_5_wr_out;
   assign mb1_mra1_write_en=mb_array_6_wr_out;


   assign mb1_tsa0_read_en=mb_array_0_rd_out;
   assign mb1_tsa1_read_en=mb_array_1_rd_out;
   assign mb1_tca_read_en =mb_array_2_rd_out;
   assign mb1_scp0_read_en=mb_array_3_rd_out;
   assign mb1_scp1_read_en=mb_array_4_rd_out;
   assign mb1_mra0_read_en=mb_array_5_rd_out;
   assign mb1_mra1_read_en=mb_array_6_rd_out;





// spare gate

spc_mb1_ctlspare_ctl_macro__num_2 spares  (
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
assign cntl_reg_scanin           = user_bisi_rd_mode_reg_scanout;
assign array_sel_reg_scanin      = cntl_reg_scanout         ;
assign cmp_sel_reg_scanin        = array_sel_reg_scanout    ;
assign marche_element_reg_scanin = cmp_sel_reg_scanout      ;
assign msb_latch_scanin          = marche_element_reg_scanout;
assign run3_transition_reg_scanin = msb_latch_scanout        ;
assign done_delay_reg_scanin     = run3_transition_reg_scanout;
assign fail_reg_scanin           = done_delay_reg_scanout   ;
assign out_mb_tcu_done_reg_scanin = fail_reg_scanout         ;
assign out_mb_tcu_fail_reg_scanin = out_mb_tcu_done_reg_scanout;
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

module spc_mb1_ctll1clkhdr_ctl_macro (
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

module spc_mb1_ctlmsff_ctl_macro__width_3 (
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

module spc_mb1_ctlmsff_ctl_macro__width_2 (
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

module spc_mb1_ctlmsff_ctl_macro__width_1 (
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

module spc_mb1_ctlmsff_ctl_macro__width_4 (
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

module spc_mb1_ctlmsff_ctl_macro__width_5 (
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

module spc_mb1_ctlmsff_ctl_macro__width_8 (
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

module spc_mb1_ctlmsff_ctl_macro__width_24 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [23:0] fdin;
wire [22:0] so;

  input [23:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [23:0] dout;
  output scan_out;
assign fdin[23:0] = din[23:0];






dff #(24)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[23:0]),
.si({scan_in,so[22:0]}),
.so({so[22:0],scan_out}),
.q(dout[23:0])
);












endmodule













// any PARAMS parms go into naming of macro

module spc_mb1_ctlmsff_ctl_macro__width_7 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [5:0] so;

  input [6:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = din[6:0];






dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module spc_mb1_ctlspare_ctl_macro__num_2 (
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

