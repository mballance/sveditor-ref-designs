// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_ibu.v
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
module ifu_ibu (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk, 
  spc_bclk, 
  pku_flush_buffer0, 
  pku_flush_upper_buffer, 
  ftu_fetch_thr_c, 
  pku_pick_p, 
  ftu_exception_valid_c, 
  ftu_instr_sf_valid_c, 
  ftu_ibu_redirect_bf, 
  ftu_ic_no_err_c, 
  ftu_bus_0_is_first, 
  ftu_bus_1_is_first, 
  ftu_bus_2_is_first, 
  ftu_bus_3_is_first, 
  ftu_instr_valid_c, 
  ftu_instr_0_c_rep0, 
  ftu_instr_0_c_rep1, 
  ftu_instr_0_c_rep2, 
  ftu_instr_0_c_rep3, 
  ftu_instr_1_c_rep0, 
  ftu_instr_1_c_rep1, 
  ftu_instr_1_c_rep2, 
  ftu_instr_1_c_rep3, 
  ftu_instr_2_c_rep0, 
  ftu_instr_2_c_rep1, 
  ftu_instr_2_c_rep2, 
  ftu_instr_2_c_rep3, 
  ftu_instr_3_c_rep0, 
  ftu_instr_3_c_rep1, 
  ftu_instr_3_c_rep2, 
  ftu_instr_3_c_rep3, 
  ftu_instr_0_exceptions_c_rep0, 
  ftu_instr_0_exceptions_c_rep1, 
  ftu_instr_0_exceptions_c_rep2, 
  ftu_instr_0_exceptions_c_rep3, 
  ftu_instr_1_exceptions_c_rep0, 
  ftu_instr_1_exceptions_c_rep1, 
  ftu_instr_1_exceptions_c_rep2, 
  ftu_instr_1_exceptions_c_rep3, 
  ftu_instr_2_exceptions_c_rep0, 
  ftu_instr_2_exceptions_c_rep1, 
  ftu_instr_2_exceptions_c_rep2, 
  ftu_instr_2_exceptions_c_rep3, 
  ftu_instr_3_exceptions_c_rep0, 
  ftu_instr_3_exceptions_c_rep1, 
  ftu_instr_3_exceptions_c_rep2, 
  ftu_instr_3_exceptions_c_rep3, 
  lsu_ifu_ibu_pmen, 
  ftu_buffer_wr_en_f, 
  l15_ifu_valid, 
  ifu_buf0_valid_p, 
  ifu_upper_buffer_valid_p, 
  ibu_empty, 
  ibu_room_4ormore, 
  ifu_buf0_inst0, 
  ifu_buf0_inst1, 
  ifu_buf0_inst2, 
  ifu_buf0_inst3, 
  ifu_buf0_inst4, 
  ifu_buf0_inst5, 
  ifu_buf0_inst6, 
  ifu_buf0_inst7, 
  ifu_buf0_excp0, 
  ifu_buf0_excp1, 
  ifu_buf0_excp2, 
  ifu_buf0_excp3, 
  ifu_buf0_excp4, 
  ifu_buf0_excp5, 
  ifu_buf0_excp6, 
  ifu_buf0_excp7, 
  scan_out);
wire ibf0_scanin;
wire ibf0_scanout;
wire [7:0] ibq_buff_clken;
wire [7:0] ibq_ctl_clken;
wire [7:0] ibq_buf0_sel_inst0_pick;
wire [7:0] ibq_buf0_sel_inst1_pick;
wire [7:0] ibq_buf0_sel_inst2_pick;
wire [7:0] ibq_buf0_sel_inst3_pick;
wire [7:0] ibq_buf0_sel_inst0_pick_;
wire [7:0] ibq_buf0_sel_inst1_pick_;
wire [7:0] ibq_buf0_sel_inst2_pick_;
wire [7:0] ibq_buf0_sel_inst3_pick_;
wire [7:0] ibq_buf0_sel_buf1;
wire [7:0] ibq_buf0_sel_buf2;
wire [7:0] ibq_buf0_sel_buf3;
wire [7:0] ibq_buf0_sel_buf4;
wire [7:0] ibq_buf0_sel_buf5;
wire [7:0] ibq_buf0_sel_buf6;
wire [7:0] ibq_buf0_sel_buf7;
wire [7:0] ibq_buf0_sel_hold_pick;
wire [7:0] ibq_buf0_sel_hold_pick_;
wire [7:0] ibq_buf0_sel_buf1to7_pick;
wire [7:0] ibq_buf0_sel_buf1to7_pick_;
wire [7:0] ibq_buf1_sel_inst0;
wire [7:0] ibq_buf1_sel_inst1;
wire [7:0] ibq_buf1_sel_inst2;
wire [7:0] ibq_buf1_sel_inst3;
wire [7:0] ibq_buf1_sel_hold;
wire [7:0] ibq_buf2_sel_inst0;
wire [7:0] ibq_buf2_sel_inst1;
wire [7:0] ibq_buf2_sel_inst2;
wire [7:0] ibq_buf2_sel_inst3;
wire [7:0] ibq_buf2_sel_hold;
wire [7:0] ibq_buf3_sel_inst0;
wire [7:0] ibq_buf3_sel_inst1;
wire [7:0] ibq_buf3_sel_inst2;
wire [7:0] ibq_buf3_sel_inst3;
wire [7:0] ibq_buf3_sel_hold;
wire [7:0] ibq_buf4_sel_inst0;
wire [7:0] ibq_buf4_sel_inst1;
wire [7:0] ibq_buf4_sel_inst2;
wire [7:0] ibq_buf4_sel_inst3;
wire [7:0] ibq_buf4_sel_hold;
wire [7:0] ibq_buf5_sel_inst0;
wire [7:0] ibq_buf5_sel_inst1;
wire [7:0] ibq_buf5_sel_inst2;
wire [7:0] ibq_buf5_sel_inst3;
wire [7:0] ibq_buf5_sel_hold;
wire [7:0] ibq_buf6_sel_inst0;
wire [7:0] ibq_buf6_sel_inst1;
wire [7:0] ibq_buf6_sel_inst2;
wire [7:0] ibq_buf6_sel_inst3;
wire [7:0] ibq_buf6_sel_hold;
wire [7:0] ibq_buf7_sel_inst0;
wire [7:0] ibq_buf7_sel_inst1;
wire [7:0] ibq_buf7_sel_inst2;
wire [7:0] ibq_buf7_sel_inst3;
wire [7:0] ibq_buf7_sel_hold;
wire ibf1_scanin;
wire ibf1_scanout;
wire ibf2_scanin;
wire ibf2_scanout;
wire ibf3_scanin;
wire ibf3_scanout;
wire ibf4_scanin;
wire ibf4_scanout;
wire ibf5_scanin;
wire ibf5_scanout;
wire ibf6_scanin;
wire ibf6_scanout;
wire ibf7_scanin;
wire ibf7_scanout;
wire ibq0_scanin;
wire ibq0_scanout;
wire ibq1_scanin;
wire ibq1_scanout;
wire ibq2_scanin;
wire ibq2_scanout;
wire ibq3_scanin;
wire ibq3_scanout;
wire ibq4_scanin;
wire ibq4_scanout;
wire ibq5_scanin;
wire ibq5_scanout;
wire ibq6_scanin;
wire ibq6_scanout;
wire ibq7_scanin;
wire ibq7_scanout;


   input   l2clk;
   input   scan_in;
   input   tcu_pce_ov;  	  // scan signals
   input   tcu_scan_en;  	  // scan signals
   input   spc_aclk;
   input   spc_bclk;
	   
   input   [7:0] pku_flush_buffer0    ; 	// flush buf0 only
   input   [7:0] pku_flush_upper_buffer   ;	// flush buf1-7 only

   input   [7:0] ftu_fetch_thr_c       ;	// enables fetch
   input   [7:0] pku_pick_p	   ;		// instruction issue/pick indicator
   input         ftu_exception_valid_c ;
   input         ftu_instr_sf_valid_c ;

   input   [7:0] ftu_ibu_redirect_bf;
   input         ftu_ic_no_err_c   ;                // Data being by_passed does not have an error
   input         ftu_bus_0_is_first ;           // bus 0 contains first instr
   input         ftu_bus_1_is_first ;           // bus 1 contains first instr
   input         ftu_bus_2_is_first ;           // bus 2 contains first instr
   input         ftu_bus_3_is_first ;           // bus 3 contains first instr

 

   input   [3:0] ftu_instr_valid_c  ;

   input  [32:0] ftu_instr_0_c_rep0; 		
   input  [32:0] ftu_instr_0_c_rep1; 		
   input  [32:0] ftu_instr_0_c_rep2; 		
   input  [32:0] ftu_instr_0_c_rep3; 		
   input  [32:0] ftu_instr_1_c_rep0; 		
   input  [32:0] ftu_instr_1_c_rep1; 		
   input  [32:0] ftu_instr_1_c_rep2; 		
   input  [32:0] ftu_instr_1_c_rep3; 		
   input  [32:0] ftu_instr_2_c_rep0;
   input  [32:0] ftu_instr_2_c_rep1;
   input  [32:0] ftu_instr_2_c_rep2;
   input  [32:0] ftu_instr_2_c_rep3;
   input  [32:0] ftu_instr_3_c_rep0; 		
   input  [32:0] ftu_instr_3_c_rep1; 		
   input  [32:0] ftu_instr_3_c_rep2; 		
   input  [32:0] ftu_instr_3_c_rep3; 		
   input   [4:0] ftu_instr_0_exceptions_c_rep0;
   input   [4:0] ftu_instr_0_exceptions_c_rep1;
   input   [4:0] ftu_instr_0_exceptions_c_rep2;
   input   [4:0] ftu_instr_0_exceptions_c_rep3;
   input   [4:0] ftu_instr_1_exceptions_c_rep0;	
   input   [4:0] ftu_instr_1_exceptions_c_rep1;	
   input   [4:0] ftu_instr_1_exceptions_c_rep2;	
   input   [4:0] ftu_instr_1_exceptions_c_rep3;	
   input   [4:0] ftu_instr_2_exceptions_c_rep0;	
   input   [4:0] ftu_instr_2_exceptions_c_rep1;	
   input   [4:0] ftu_instr_2_exceptions_c_rep2;	
   input   [4:0] ftu_instr_2_exceptions_c_rep3;	
   input   [4:0] ftu_instr_3_exceptions_c_rep0;
   input   [4:0] ftu_instr_3_exceptions_c_rep1;
   input   [4:0] ftu_instr_3_exceptions_c_rep2;
   input   [4:0] ftu_instr_3_exceptions_c_rep3;

   input         lsu_ifu_ibu_pmen;              // enable power management.
   input   [7:0] ftu_buffer_wr_en_f;            // Buffer clock enables (Normal fetch)
   input         l15_ifu_valid;                 
    

   output  [7:0] ifu_buf0_valid_p  ;		// buf0 valid
   output  [7:0] ifu_upper_buffer_valid_p  ;	// at least one of buf1-7 valid


   output  [7:0] ibu_empty	  ;		// buf0-7 empty
   output  [7:0] ibu_room_4ormore  ;		// at least 4 empty buffers
      
   output [32:0] ifu_buf0_inst0; 
   output [32:0] ifu_buf0_inst1; 
   output [32:0] ifu_buf0_inst2; 
   output [32:0] ifu_buf0_inst3; 
   output [32:0] ifu_buf0_inst4; 
   output [32:0] ifu_buf0_inst5; 
   output [32:0] ifu_buf0_inst6; 
   output [32:0] ifu_buf0_inst7; 

   output  [4:0] ifu_buf0_excp0;
   output  [4:0] ifu_buf0_excp1;
   output  [4:0] ifu_buf0_excp2;
   output  [4:0] ifu_buf0_excp3;
   output  [4:0] ifu_buf0_excp4;
   output  [4:0] ifu_buf0_excp5;
   output  [4:0] ifu_buf0_excp6;
   output  [4:0] ifu_buf0_excp7;

   output  scan_out;
        
ifu_ibu_ibf_dp ibf0 (
   .scan_in(ibf0_scanin),
   .scan_out(ibf0_scanout),
   .l2clk(l2clk),

   .pku_pick_p         (pku_pick_p[0]  ),
   .ibq_buff_clken     (ibq_buff_clken[0] ),
   .ibq_ctl_clken      (ibq_ctl_clken[0] ),

   .ftu_ic_no_err_c (ftu_ic_no_err_c),
   

   .ftu_instr_0_c(ftu_instr_0_c_rep0[32:0]),
   .ftu_instr_1_c(ftu_instr_1_c_rep0[32:0]),
   .ftu_instr_2_c(ftu_instr_2_c_rep0[32:0]),
   .ftu_instr_3_c(ftu_instr_3_c_rep0[32:0]),
   .ftu_instr_0_exceptions_c(ftu_instr_0_exceptions_c_rep0[4:0]),
   .ftu_instr_1_exceptions_c(ftu_instr_1_exceptions_c_rep0[4:0]),
   .ftu_instr_2_exceptions_c(ftu_instr_2_exceptions_c_rep0[4:0]),
   .ftu_instr_3_exceptions_c(ftu_instr_3_exceptions_c_rep0[4:0]),

   .ibq_buf0_sel_inst0_pick (ibq_buf0_sel_inst0_pick[0] ),
   .ibq_buf0_sel_inst1_pick (ibq_buf0_sel_inst1_pick[0] ),
   .ibq_buf0_sel_inst2_pick (ibq_buf0_sel_inst2_pick[0] ),
   .ibq_buf0_sel_inst3_pick (ibq_buf0_sel_inst3_pick[0] ),
   .ibq_buf0_sel_inst0_pick_ (ibq_buf0_sel_inst0_pick_[0] ),
   .ibq_buf0_sel_inst1_pick_ (ibq_buf0_sel_inst1_pick_[0] ),
   .ibq_buf0_sel_inst2_pick_ (ibq_buf0_sel_inst2_pick_[0] ),
   .ibq_buf0_sel_inst3_pick_ (ibq_buf0_sel_inst3_pick_[0] ),
   .ibq_buf0_sel_buf1  (ibq_buf0_sel_buf1[0]  ),
   .ibq_buf0_sel_buf2  (ibq_buf0_sel_buf2[0]  ),
   .ibq_buf0_sel_buf3  (ibq_buf0_sel_buf3[0]  ),
   .ibq_buf0_sel_buf4  (ibq_buf0_sel_buf4[0]  ),
   .ibq_buf0_sel_buf5  (ibq_buf0_sel_buf5[0]  ),
   .ibq_buf0_sel_buf6  (ibq_buf0_sel_buf6[0]  ),
   .ibq_buf0_sel_buf7  (ibq_buf0_sel_buf7[0]  ),
   .ibq_buf0_sel_hold_pick  (ibq_buf0_sel_hold_pick[0]  ),
   .ibq_buf0_sel_hold_pick_  (ibq_buf0_sel_hold_pick_[0]  ),

   .ibq_buf0_sel_buf1to7_pick (ibq_buf0_sel_buf1to7_pick[0]),
   .ibq_buf0_sel_buf1to7_pick_ (ibq_buf0_sel_buf1to7_pick_[0]),

   .ibq_buf1_sel_inst0 (ibq_buf1_sel_inst0[0] ),
   .ibq_buf1_sel_inst1 (ibq_buf1_sel_inst1[0] ),
   .ibq_buf1_sel_inst2 (ibq_buf1_sel_inst2[0] ),
   .ibq_buf1_sel_inst3 (ibq_buf1_sel_inst3[0] ),
   .ibq_buf1_sel_hold  (ibq_buf1_sel_hold[0]  ),

   .ibq_buf2_sel_inst0 (ibq_buf2_sel_inst0[0] ),
   .ibq_buf2_sel_inst1 (ibq_buf2_sel_inst1[0] ),
   .ibq_buf2_sel_inst2 (ibq_buf2_sel_inst2[0] ),
   .ibq_buf2_sel_inst3 (ibq_buf2_sel_inst3[0] ),
   .ibq_buf2_sel_hold  (ibq_buf2_sel_hold[0]  ),

   .ibq_buf3_sel_inst0 (ibq_buf3_sel_inst0[0] ),
   .ibq_buf3_sel_inst1 (ibq_buf3_sel_inst1[0] ),
   .ibq_buf3_sel_inst2 (ibq_buf3_sel_inst2[0] ),
   .ibq_buf3_sel_inst3 (ibq_buf3_sel_inst3[0] ),
   .ibq_buf3_sel_hold  (ibq_buf3_sel_hold[0]  ),

   .ibq_buf4_sel_inst0 (ibq_buf4_sel_inst0[0] ),
   .ibq_buf4_sel_inst1 (ibq_buf4_sel_inst1[0] ),
   .ibq_buf4_sel_inst2 (ibq_buf4_sel_inst2[0] ),
   .ibq_buf4_sel_inst3 (ibq_buf4_sel_inst3[0] ),
   .ibq_buf4_sel_hold  (ibq_buf4_sel_hold[0]  ),

   .ibq_buf5_sel_inst0 (ibq_buf5_sel_inst0[0] ),
   .ibq_buf5_sel_inst1 (ibq_buf5_sel_inst1[0] ),
   .ibq_buf5_sel_inst2 (ibq_buf5_sel_inst2[0] ),
   .ibq_buf5_sel_inst3 (ibq_buf5_sel_inst3[0] ),
   .ibq_buf5_sel_hold  (ibq_buf5_sel_hold[0]  ),

   .ibq_buf6_sel_inst0 (ibq_buf6_sel_inst0[0] ),
   .ibq_buf6_sel_inst1 (ibq_buf6_sel_inst1[0] ),
   .ibq_buf6_sel_inst2 (ibq_buf6_sel_inst2[0] ),
   .ibq_buf6_sel_inst3 (ibq_buf6_sel_inst3[0] ),
   .ibq_buf6_sel_hold  (ibq_buf6_sel_hold[0]  ),

   .ibq_buf7_sel_inst0 (ibq_buf7_sel_inst0[0] ),
   .ibq_buf7_sel_inst1 (ibq_buf7_sel_inst1[0] ),
   .ibq_buf7_sel_inst2 (ibq_buf7_sel_inst2[0] ),
   .ibq_buf7_sel_inst3 (ibq_buf7_sel_inst3[0] ),
   .ibq_buf7_sel_hold  (ibq_buf7_sel_hold[0]  ),



   .ifu_buf0_excp    (ifu_buf0_excp0) ,
   .ifu_buf0_inst  (ifu_buf0_inst0[32:0]  ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk)) ;

ifu_ibu_ibf_dp ibf1 (
   .scan_in(ibf1_scanin),
   .scan_out(ibf1_scanout),
   .l2clk(l2clk),

   .ibq_buff_clken     (ibq_buff_clken[1] ),
   .ibq_ctl_clken      (ibq_ctl_clken[1] ),
   .pku_pick_p         (pku_pick_p[1]  ),

   .ftu_ic_no_err_c (ftu_ic_no_err_c),

   .ftu_instr_0_c(ftu_instr_0_c_rep0[32:0]),
   .ftu_instr_1_c(ftu_instr_1_c_rep0[32:0]),
   .ftu_instr_2_c(ftu_instr_2_c_rep0[32:0]),
   .ftu_instr_3_c(ftu_instr_3_c_rep0[32:0]),
   .ftu_instr_0_exceptions_c(ftu_instr_0_exceptions_c_rep0[4:0]),
   .ftu_instr_1_exceptions_c(ftu_instr_1_exceptions_c_rep0[4:0]),
   .ftu_instr_2_exceptions_c(ftu_instr_2_exceptions_c_rep0[4:0]),
   .ftu_instr_3_exceptions_c(ftu_instr_3_exceptions_c_rep0[4:0]),

   .ibq_buf0_sel_inst0_pick (ibq_buf0_sel_inst0_pick[1] ),
   .ibq_buf0_sel_inst1_pick (ibq_buf0_sel_inst1_pick[1] ),
   .ibq_buf0_sel_inst2_pick (ibq_buf0_sel_inst2_pick[1] ),
   .ibq_buf0_sel_inst3_pick (ibq_buf0_sel_inst3_pick[1] ),
   .ibq_buf0_sel_inst0_pick_ (ibq_buf0_sel_inst0_pick_[1] ),
   .ibq_buf0_sel_inst1_pick_ (ibq_buf0_sel_inst1_pick_[1] ),
   .ibq_buf0_sel_inst2_pick_ (ibq_buf0_sel_inst2_pick_[1] ),
   .ibq_buf0_sel_inst3_pick_ (ibq_buf0_sel_inst3_pick_[1] ),
   .ibq_buf0_sel_buf1  (ibq_buf0_sel_buf1[1]  ),
   .ibq_buf0_sel_buf2  (ibq_buf0_sel_buf2[1]  ),
   .ibq_buf0_sel_buf3  (ibq_buf0_sel_buf3[1]  ),
   .ibq_buf0_sel_buf4  (ibq_buf0_sel_buf4[1]  ),
   .ibq_buf0_sel_buf5  (ibq_buf0_sel_buf5[1]  ),
   .ibq_buf0_sel_buf6  (ibq_buf0_sel_buf6[1]  ),
   .ibq_buf0_sel_buf7  (ibq_buf0_sel_buf7[1]  ),
   .ibq_buf0_sel_hold_pick  (ibq_buf0_sel_hold_pick[1]  ),
   .ibq_buf0_sel_hold_pick_  (ibq_buf0_sel_hold_pick_[1]  ),

   .ibq_buf0_sel_buf1to7_pick (ibq_buf0_sel_buf1to7_pick[1]),
   .ibq_buf0_sel_buf1to7_pick_ (ibq_buf0_sel_buf1to7_pick_[1]),

   .ibq_buf1_sel_inst0 (ibq_buf1_sel_inst0[1] ),
   .ibq_buf1_sel_inst1 (ibq_buf1_sel_inst1[1] ),
   .ibq_buf1_sel_inst2 (ibq_buf1_sel_inst2[1] ),
   .ibq_buf1_sel_inst3 (ibq_buf1_sel_inst3[1] ),
   .ibq_buf1_sel_hold  (ibq_buf1_sel_hold[1]  ),

   .ibq_buf2_sel_inst0 (ibq_buf2_sel_inst0[1] ),
   .ibq_buf2_sel_inst1 (ibq_buf2_sel_inst1[1] ),
   .ibq_buf2_sel_inst2 (ibq_buf2_sel_inst2[1] ),
   .ibq_buf2_sel_inst3 (ibq_buf2_sel_inst3[1] ),
   .ibq_buf2_sel_hold  (ibq_buf2_sel_hold[1]  ),

   .ibq_buf3_sel_inst0 (ibq_buf3_sel_inst0[1] ),
   .ibq_buf3_sel_inst1 (ibq_buf3_sel_inst1[1] ),
   .ibq_buf3_sel_inst2 (ibq_buf3_sel_inst2[1] ),
   .ibq_buf3_sel_inst3 (ibq_buf3_sel_inst3[1] ),
   .ibq_buf3_sel_hold  (ibq_buf3_sel_hold[1]  ),

   .ibq_buf4_sel_inst0 (ibq_buf4_sel_inst0[1] ),
   .ibq_buf4_sel_inst1 (ibq_buf4_sel_inst1[1] ),
   .ibq_buf4_sel_inst2 (ibq_buf4_sel_inst2[1] ),
   .ibq_buf4_sel_inst3 (ibq_buf4_sel_inst3[1] ),
   .ibq_buf4_sel_hold  (ibq_buf4_sel_hold[1]  ),

   .ibq_buf5_sel_inst0 (ibq_buf5_sel_inst0[1] ),
   .ibq_buf5_sel_inst1 (ibq_buf5_sel_inst1[1] ),
   .ibq_buf5_sel_inst2 (ibq_buf5_sel_inst2[1] ),
   .ibq_buf5_sel_inst3 (ibq_buf5_sel_inst3[1] ),
   .ibq_buf5_sel_hold  (ibq_buf5_sel_hold[1]  ),

   .ibq_buf6_sel_inst0 (ibq_buf6_sel_inst0[1] ),
   .ibq_buf6_sel_inst1 (ibq_buf6_sel_inst1[1] ),
   .ibq_buf6_sel_inst2 (ibq_buf6_sel_inst2[1] ),
   .ibq_buf6_sel_inst3 (ibq_buf6_sel_inst3[1] ),
   .ibq_buf6_sel_hold  (ibq_buf6_sel_hold[1]  ),

   .ibq_buf7_sel_inst0 (ibq_buf7_sel_inst0[1] ),
   .ibq_buf7_sel_inst1 (ibq_buf7_sel_inst1[1] ),
   .ibq_buf7_sel_inst2 (ibq_buf7_sel_inst2[1] ),
   .ibq_buf7_sel_inst3 (ibq_buf7_sel_inst3[1] ),
   .ibq_buf7_sel_hold  (ibq_buf7_sel_hold[1]  ),



   .ifu_buf0_excp    (ifu_buf0_excp1) ,
   .ifu_buf0_inst  (ifu_buf0_inst1[32:0]  ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk)) ;

ifu_ibu_ibf_dp ibf2 (
   .scan_in(ibf2_scanin),
   .scan_out(ibf2_scanout),
   .l2clk(l2clk),

   .ibq_buff_clken     (ibq_buff_clken[2] ),
   .ibq_ctl_clken      (ibq_ctl_clken[2] ),
   .pku_pick_p         (pku_pick_p[2]  ),

   .ftu_ic_no_err_c (ftu_ic_no_err_c),

   .ftu_instr_0_c(ftu_instr_0_c_rep1[32:0]),
   .ftu_instr_1_c(ftu_instr_1_c_rep1[32:0]),
   .ftu_instr_2_c(ftu_instr_2_c_rep1[32:0]),
   .ftu_instr_3_c(ftu_instr_3_c_rep1[32:0]),
   .ftu_instr_0_exceptions_c(ftu_instr_0_exceptions_c_rep1[4:0]),
   .ftu_instr_1_exceptions_c(ftu_instr_1_exceptions_c_rep1[4:0]),
   .ftu_instr_2_exceptions_c(ftu_instr_2_exceptions_c_rep1[4:0]),
   .ftu_instr_3_exceptions_c(ftu_instr_3_exceptions_c_rep1[4:0]),


   .ibq_buf0_sel_inst0_pick (ibq_buf0_sel_inst0_pick[2] ),
   .ibq_buf0_sel_inst1_pick (ibq_buf0_sel_inst1_pick[2] ),
   .ibq_buf0_sel_inst2_pick (ibq_buf0_sel_inst2_pick[2] ),
   .ibq_buf0_sel_inst3_pick (ibq_buf0_sel_inst3_pick[2] ),
   .ibq_buf0_sel_inst0_pick_ (ibq_buf0_sel_inst0_pick_[2] ),
   .ibq_buf0_sel_inst1_pick_ (ibq_buf0_sel_inst1_pick_[2] ),
   .ibq_buf0_sel_inst2_pick_ (ibq_buf0_sel_inst2_pick_[2] ),
   .ibq_buf0_sel_inst3_pick_ (ibq_buf0_sel_inst3_pick_[2] ),
   .ibq_buf0_sel_buf1  (ibq_buf0_sel_buf1[2]  ),
   .ibq_buf0_sel_buf2  (ibq_buf0_sel_buf2[2]  ),
   .ibq_buf0_sel_buf3  (ibq_buf0_sel_buf3[2]  ),
   .ibq_buf0_sel_buf4  (ibq_buf0_sel_buf4[2]  ),
   .ibq_buf0_sel_buf5  (ibq_buf0_sel_buf5[2]  ),
   .ibq_buf0_sel_buf6  (ibq_buf0_sel_buf6[2]  ),
   .ibq_buf0_sel_buf7  (ibq_buf0_sel_buf7[2]  ),
   .ibq_buf0_sel_hold_pick  (ibq_buf0_sel_hold_pick[2]  ),
   .ibq_buf0_sel_hold_pick_  (ibq_buf0_sel_hold_pick_[2]  ),

   .ibq_buf0_sel_buf1to7_pick (ibq_buf0_sel_buf1to7_pick[2]),
   .ibq_buf0_sel_buf1to7_pick_ (ibq_buf0_sel_buf1to7_pick_[2]),

   .ibq_buf1_sel_inst0 (ibq_buf1_sel_inst0[2] ),
   .ibq_buf1_sel_inst1 (ibq_buf1_sel_inst1[2] ),
   .ibq_buf1_sel_inst2 (ibq_buf1_sel_inst2[2] ),
   .ibq_buf1_sel_inst3 (ibq_buf1_sel_inst3[2] ),
   .ibq_buf1_sel_hold  (ibq_buf1_sel_hold[2]  ),

   .ibq_buf2_sel_inst0 (ibq_buf2_sel_inst0[2] ),
   .ibq_buf2_sel_inst1 (ibq_buf2_sel_inst1[2] ),
   .ibq_buf2_sel_inst2 (ibq_buf2_sel_inst2[2] ),
   .ibq_buf2_sel_inst3 (ibq_buf2_sel_inst3[2] ),
   .ibq_buf2_sel_hold  (ibq_buf2_sel_hold[2]  ),

   .ibq_buf3_sel_inst0 (ibq_buf3_sel_inst0[2] ),
   .ibq_buf3_sel_inst1 (ibq_buf3_sel_inst1[2] ),
   .ibq_buf3_sel_inst2 (ibq_buf3_sel_inst2[2] ),
   .ibq_buf3_sel_inst3 (ibq_buf3_sel_inst3[2] ),
   .ibq_buf3_sel_hold  (ibq_buf3_sel_hold[2]  ),

   .ibq_buf4_sel_inst0 (ibq_buf4_sel_inst0[2] ),
   .ibq_buf4_sel_inst1 (ibq_buf4_sel_inst1[2] ),
   .ibq_buf4_sel_inst2 (ibq_buf4_sel_inst2[2] ),
   .ibq_buf4_sel_inst3 (ibq_buf4_sel_inst3[2] ),
   .ibq_buf4_sel_hold  (ibq_buf4_sel_hold[2]  ),

   .ibq_buf5_sel_inst0 (ibq_buf5_sel_inst0[2] ),
   .ibq_buf5_sel_inst1 (ibq_buf5_sel_inst1[2] ),
   .ibq_buf5_sel_inst2 (ibq_buf5_sel_inst2[2] ),
   .ibq_buf5_sel_inst3 (ibq_buf5_sel_inst3[2] ),
   .ibq_buf5_sel_hold  (ibq_buf5_sel_hold[2]  ),

   .ibq_buf6_sel_inst0 (ibq_buf6_sel_inst0[2] ),
   .ibq_buf6_sel_inst1 (ibq_buf6_sel_inst1[2] ),
   .ibq_buf6_sel_inst2 (ibq_buf6_sel_inst2[2] ),
   .ibq_buf6_sel_inst3 (ibq_buf6_sel_inst3[2] ),
   .ibq_buf6_sel_hold  (ibq_buf6_sel_hold[2]  ),

   .ibq_buf7_sel_inst0 (ibq_buf7_sel_inst0[2] ),
   .ibq_buf7_sel_inst1 (ibq_buf7_sel_inst1[2] ),
   .ibq_buf7_sel_inst2 (ibq_buf7_sel_inst2[2] ),
   .ibq_buf7_sel_inst3 (ibq_buf7_sel_inst3[2] ),
   .ibq_buf7_sel_hold  (ibq_buf7_sel_hold[2]  ),



   .ifu_buf0_excp    (ifu_buf0_excp2) ,
   .ifu_buf0_inst  (ifu_buf0_inst2[32:0]  ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk)) ;

ifu_ibu_ibf_dp ibf3 (
   .scan_in(ibf3_scanin),
   .scan_out(ibf3_scanout),
   .l2clk(l2clk),

   .ibq_buff_clken     (ibq_buff_clken[3] ),
   .ibq_ctl_clken      (ibq_ctl_clken[3] ),
   .pku_pick_p         (pku_pick_p[3]  ),

   .ftu_ic_no_err_c (ftu_ic_no_err_c),

   .ftu_instr_0_c(ftu_instr_0_c_rep1[32:0]),
   .ftu_instr_1_c(ftu_instr_1_c_rep1[32:0]),
   .ftu_instr_2_c(ftu_instr_2_c_rep1[32:0]),
   .ftu_instr_3_c(ftu_instr_3_c_rep1[32:0]),
   .ftu_instr_0_exceptions_c(ftu_instr_0_exceptions_c_rep1[4:0]),
   .ftu_instr_1_exceptions_c(ftu_instr_1_exceptions_c_rep1[4:0]),
   .ftu_instr_2_exceptions_c(ftu_instr_2_exceptions_c_rep1[4:0]),
   .ftu_instr_3_exceptions_c(ftu_instr_3_exceptions_c_rep1[4:0]),


   .ibq_buf0_sel_inst0_pick (ibq_buf0_sel_inst0_pick[3] ),
   .ibq_buf0_sel_inst1_pick (ibq_buf0_sel_inst1_pick[3] ),
   .ibq_buf0_sel_inst2_pick (ibq_buf0_sel_inst2_pick[3] ),
   .ibq_buf0_sel_inst3_pick (ibq_buf0_sel_inst3_pick[3] ),
   .ibq_buf0_sel_inst0_pick_ (ibq_buf0_sel_inst0_pick_[3] ),
   .ibq_buf0_sel_inst1_pick_ (ibq_buf0_sel_inst1_pick_[3] ),
   .ibq_buf0_sel_inst2_pick_ (ibq_buf0_sel_inst2_pick_[3] ),
   .ibq_buf0_sel_inst3_pick_ (ibq_buf0_sel_inst3_pick_[3] ),
   .ibq_buf0_sel_buf1  (ibq_buf0_sel_buf1[3]  ),
   .ibq_buf0_sel_buf2  (ibq_buf0_sel_buf2[3]  ),
   .ibq_buf0_sel_buf3  (ibq_buf0_sel_buf3[3]  ),
   .ibq_buf0_sel_buf4  (ibq_buf0_sel_buf4[3]  ),
   .ibq_buf0_sel_buf5  (ibq_buf0_sel_buf5[3]  ),
   .ibq_buf0_sel_buf6  (ibq_buf0_sel_buf6[3]  ),
   .ibq_buf0_sel_buf7  (ibq_buf0_sel_buf7[3]  ),
   .ibq_buf0_sel_hold_pick  (ibq_buf0_sel_hold_pick[3]  ),
   .ibq_buf0_sel_hold_pick_  (ibq_buf0_sel_hold_pick_[3]  ),

   .ibq_buf0_sel_buf1to7_pick (ibq_buf0_sel_buf1to7_pick[3]),
   .ibq_buf0_sel_buf1to7_pick_ (ibq_buf0_sel_buf1to7_pick_[3]),

   .ibq_buf1_sel_inst0 (ibq_buf1_sel_inst0[3] ),
   .ibq_buf1_sel_inst1 (ibq_buf1_sel_inst1[3] ),
   .ibq_buf1_sel_inst2 (ibq_buf1_sel_inst2[3] ),
   .ibq_buf1_sel_inst3 (ibq_buf1_sel_inst3[3] ),
   .ibq_buf1_sel_hold  (ibq_buf1_sel_hold[3]  ),

   .ibq_buf2_sel_inst0 (ibq_buf2_sel_inst0[3] ),
   .ibq_buf2_sel_inst1 (ibq_buf2_sel_inst1[3] ),
   .ibq_buf2_sel_inst2 (ibq_buf2_sel_inst2[3] ),
   .ibq_buf2_sel_inst3 (ibq_buf2_sel_inst3[3] ),
   .ibq_buf2_sel_hold  (ibq_buf2_sel_hold[3]  ),

   .ibq_buf3_sel_inst0 (ibq_buf3_sel_inst0[3] ),
   .ibq_buf3_sel_inst1 (ibq_buf3_sel_inst1[3] ),
   .ibq_buf3_sel_inst2 (ibq_buf3_sel_inst2[3] ),
   .ibq_buf3_sel_inst3 (ibq_buf3_sel_inst3[3] ),
   .ibq_buf3_sel_hold  (ibq_buf3_sel_hold[3]  ),

   .ibq_buf4_sel_inst0 (ibq_buf4_sel_inst0[3] ),
   .ibq_buf4_sel_inst1 (ibq_buf4_sel_inst1[3] ),
   .ibq_buf4_sel_inst2 (ibq_buf4_sel_inst2[3] ),
   .ibq_buf4_sel_inst3 (ibq_buf4_sel_inst3[3] ),
   .ibq_buf4_sel_hold  (ibq_buf4_sel_hold[3]  ),

   .ibq_buf5_sel_inst0 (ibq_buf5_sel_inst0[3] ),
   .ibq_buf5_sel_inst1 (ibq_buf5_sel_inst1[3] ),
   .ibq_buf5_sel_inst2 (ibq_buf5_sel_inst2[3] ),
   .ibq_buf5_sel_inst3 (ibq_buf5_sel_inst3[3] ),
   .ibq_buf5_sel_hold  (ibq_buf5_sel_hold[3]  ),

   .ibq_buf6_sel_inst0 (ibq_buf6_sel_inst0[3] ),
   .ibq_buf6_sel_inst1 (ibq_buf6_sel_inst1[3] ),
   .ibq_buf6_sel_inst2 (ibq_buf6_sel_inst2[3] ),
   .ibq_buf6_sel_inst3 (ibq_buf6_sel_inst3[3] ),
   .ibq_buf6_sel_hold  (ibq_buf6_sel_hold[3]  ),

   .ibq_buf7_sel_inst0 (ibq_buf7_sel_inst0[3] ),
   .ibq_buf7_sel_inst1 (ibq_buf7_sel_inst1[3] ),
   .ibq_buf7_sel_inst2 (ibq_buf7_sel_inst2[3] ),
   .ibq_buf7_sel_inst3 (ibq_buf7_sel_inst3[3] ),
   .ibq_buf7_sel_hold  (ibq_buf7_sel_hold[3]  ),



   .ifu_buf0_excp    (ifu_buf0_excp3) ,
   .ifu_buf0_inst  (ifu_buf0_inst3[32:0]  ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk)) ;

ifu_ibu_ibf_dp ibf4 (
   .scan_in(ibf4_scanin),
   .scan_out(ibf4_scanout),
   .l2clk(l2clk),

   .ibq_buff_clken     (ibq_buff_clken[4] ),
   .ibq_ctl_clken      (ibq_ctl_clken[4] ),
   .pku_pick_p         (pku_pick_p[4]  ),

   .ftu_ic_no_err_c (ftu_ic_no_err_c),

   .ftu_instr_0_c(ftu_instr_0_c_rep2[32:0]),
   .ftu_instr_1_c(ftu_instr_1_c_rep2[32:0]),
   .ftu_instr_2_c(ftu_instr_2_c_rep2[32:0]),
   .ftu_instr_3_c(ftu_instr_3_c_rep2[32:0]),
   .ftu_instr_0_exceptions_c(ftu_instr_0_exceptions_c_rep2[4:0]),
   .ftu_instr_1_exceptions_c(ftu_instr_1_exceptions_c_rep2[4:0]),
   .ftu_instr_2_exceptions_c(ftu_instr_2_exceptions_c_rep2[4:0]),
   .ftu_instr_3_exceptions_c(ftu_instr_3_exceptions_c_rep2[4:0]),


   .ibq_buf0_sel_inst0_pick (ibq_buf0_sel_inst0_pick[4] ),
   .ibq_buf0_sel_inst1_pick (ibq_buf0_sel_inst1_pick[4] ),
   .ibq_buf0_sel_inst2_pick (ibq_buf0_sel_inst2_pick[4] ),
   .ibq_buf0_sel_inst3_pick (ibq_buf0_sel_inst3_pick[4] ),
   .ibq_buf0_sel_inst0_pick_ (ibq_buf0_sel_inst0_pick_[4] ),
   .ibq_buf0_sel_inst1_pick_ (ibq_buf0_sel_inst1_pick_[4] ),
   .ibq_buf0_sel_inst2_pick_ (ibq_buf0_sel_inst2_pick_[4] ),
   .ibq_buf0_sel_inst3_pick_ (ibq_buf0_sel_inst3_pick_[4] ),
   .ibq_buf0_sel_buf1  (ibq_buf0_sel_buf1[4]  ),
   .ibq_buf0_sel_buf2  (ibq_buf0_sel_buf2[4]  ),
   .ibq_buf0_sel_buf3  (ibq_buf0_sel_buf3[4]  ),
   .ibq_buf0_sel_buf4  (ibq_buf0_sel_buf4[4]  ),
   .ibq_buf0_sel_buf5  (ibq_buf0_sel_buf5[4]  ),
   .ibq_buf0_sel_buf6  (ibq_buf0_sel_buf6[4]  ),
   .ibq_buf0_sel_buf7  (ibq_buf0_sel_buf7[4]  ),
   .ibq_buf0_sel_hold_pick  (ibq_buf0_sel_hold_pick[4]  ),
   .ibq_buf0_sel_hold_pick_  (ibq_buf0_sel_hold_pick_[4]  ),

   .ibq_buf0_sel_buf1to7_pick (ibq_buf0_sel_buf1to7_pick[4]),
   .ibq_buf0_sel_buf1to7_pick_ (ibq_buf0_sel_buf1to7_pick_[4]),

   .ibq_buf1_sel_inst0 (ibq_buf1_sel_inst0[4] ),
   .ibq_buf1_sel_inst1 (ibq_buf1_sel_inst1[4] ),
   .ibq_buf1_sel_inst2 (ibq_buf1_sel_inst2[4] ),
   .ibq_buf1_sel_inst3 (ibq_buf1_sel_inst3[4] ),
   .ibq_buf1_sel_hold  (ibq_buf1_sel_hold[4]  ),

   .ibq_buf2_sel_inst0 (ibq_buf2_sel_inst0[4] ),
   .ibq_buf2_sel_inst1 (ibq_buf2_sel_inst1[4] ),
   .ibq_buf2_sel_inst2 (ibq_buf2_sel_inst2[4] ),
   .ibq_buf2_sel_inst3 (ibq_buf2_sel_inst3[4] ),
   .ibq_buf2_sel_hold  (ibq_buf2_sel_hold[4]  ),

   .ibq_buf3_sel_inst0 (ibq_buf3_sel_inst0[4] ),
   .ibq_buf3_sel_inst1 (ibq_buf3_sel_inst1[4] ),
   .ibq_buf3_sel_inst2 (ibq_buf3_sel_inst2[4] ),
   .ibq_buf3_sel_inst3 (ibq_buf3_sel_inst3[4] ),
   .ibq_buf3_sel_hold  (ibq_buf3_sel_hold[4]  ),

   .ibq_buf4_sel_inst0 (ibq_buf4_sel_inst0[4] ),
   .ibq_buf4_sel_inst1 (ibq_buf4_sel_inst1[4] ),
   .ibq_buf4_sel_inst2 (ibq_buf4_sel_inst2[4] ),
   .ibq_buf4_sel_inst3 (ibq_buf4_sel_inst3[4] ),
   .ibq_buf4_sel_hold  (ibq_buf4_sel_hold[4]  ),

   .ibq_buf5_sel_inst0 (ibq_buf5_sel_inst0[4] ),
   .ibq_buf5_sel_inst1 (ibq_buf5_sel_inst1[4] ),
   .ibq_buf5_sel_inst2 (ibq_buf5_sel_inst2[4] ),
   .ibq_buf5_sel_inst3 (ibq_buf5_sel_inst3[4] ),
   .ibq_buf5_sel_hold  (ibq_buf5_sel_hold[4]  ),

   .ibq_buf6_sel_inst0 (ibq_buf6_sel_inst0[4] ),
   .ibq_buf6_sel_inst1 (ibq_buf6_sel_inst1[4] ),
   .ibq_buf6_sel_inst2 (ibq_buf6_sel_inst2[4] ),
   .ibq_buf6_sel_inst3 (ibq_buf6_sel_inst3[4] ),
   .ibq_buf6_sel_hold  (ibq_buf6_sel_hold[4]  ),

   .ibq_buf7_sel_inst0 (ibq_buf7_sel_inst0[4] ),
   .ibq_buf7_sel_inst1 (ibq_buf7_sel_inst1[4] ),
   .ibq_buf7_sel_inst2 (ibq_buf7_sel_inst2[4] ),
   .ibq_buf7_sel_inst3 (ibq_buf7_sel_inst3[4] ),
   .ibq_buf7_sel_hold  (ibq_buf7_sel_hold[4]  ),



   .ifu_buf0_excp    (ifu_buf0_excp4) ,
   .ifu_buf0_inst  (ifu_buf0_inst4[32:0]  ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk)) ;


ifu_ibu_ibf_dp ibf5 (
   .scan_in(ibf5_scanin),
   .scan_out(ibf5_scanout),
   .l2clk(l2clk),

   .ibq_buff_clken     (ibq_buff_clken[5] ),
   .ibq_ctl_clken      (ibq_ctl_clken[5] ),
   .pku_pick_p         (pku_pick_p[5]  ),

   .ftu_ic_no_err_c (ftu_ic_no_err_c),

   .ftu_instr_0_c(ftu_instr_0_c_rep2[32:0]),
   .ftu_instr_1_c(ftu_instr_1_c_rep2[32:0]),
   .ftu_instr_2_c(ftu_instr_2_c_rep2[32:0]),
   .ftu_instr_3_c(ftu_instr_3_c_rep2[32:0]),
   .ftu_instr_0_exceptions_c(ftu_instr_0_exceptions_c_rep2[4:0]),
   .ftu_instr_1_exceptions_c(ftu_instr_1_exceptions_c_rep2[4:0]),
   .ftu_instr_2_exceptions_c(ftu_instr_2_exceptions_c_rep2[4:0]),
   .ftu_instr_3_exceptions_c(ftu_instr_3_exceptions_c_rep2[4:0]),

   .ibq_buf0_sel_inst0_pick  (ibq_buf0_sel_inst0_pick[5] ),
   .ibq_buf0_sel_inst1_pick  (ibq_buf0_sel_inst1_pick[5] ),
   .ibq_buf0_sel_inst2_pick  (ibq_buf0_sel_inst2_pick[5] ),
   .ibq_buf0_sel_inst3_pick  (ibq_buf0_sel_inst3_pick[5] ),
   .ibq_buf0_sel_inst0_pick_ (ibq_buf0_sel_inst0_pick_[5] ),
   .ibq_buf0_sel_inst1_pick_ (ibq_buf0_sel_inst1_pick_[5] ),
   .ibq_buf0_sel_inst2_pick_ (ibq_buf0_sel_inst2_pick_[5] ),
   .ibq_buf0_sel_inst3_pick_ (ibq_buf0_sel_inst3_pick_[5] ),
   .ibq_buf0_sel_buf1  (ibq_buf0_sel_buf1[5]  ),
   .ibq_buf0_sel_buf2  (ibq_buf0_sel_buf2[5]  ),
   .ibq_buf0_sel_buf3  (ibq_buf0_sel_buf3[5]  ),
   .ibq_buf0_sel_buf4  (ibq_buf0_sel_buf4[5]  ),
   .ibq_buf0_sel_buf5  (ibq_buf0_sel_buf5[5]  ),
   .ibq_buf0_sel_buf6  (ibq_buf0_sel_buf6[5]  ),
   .ibq_buf0_sel_buf7  (ibq_buf0_sel_buf7[5]  ),
   .ibq_buf0_sel_hold_pick  (ibq_buf0_sel_hold_pick[5]  ),
   .ibq_buf0_sel_hold_pick_  (ibq_buf0_sel_hold_pick_[5]  ),

   .ibq_buf0_sel_buf1to7_pick (ibq_buf0_sel_buf1to7_pick[5]),
   .ibq_buf0_sel_buf1to7_pick_ (ibq_buf0_sel_buf1to7_pick_[5]),

   .ibq_buf1_sel_inst0 (ibq_buf1_sel_inst0[5] ),
   .ibq_buf1_sel_inst1 (ibq_buf1_sel_inst1[5] ),
   .ibq_buf1_sel_inst2 (ibq_buf1_sel_inst2[5] ),
   .ibq_buf1_sel_inst3 (ibq_buf1_sel_inst3[5] ),
   .ibq_buf1_sel_hold  (ibq_buf1_sel_hold[5]  ),

   .ibq_buf2_sel_inst0 (ibq_buf2_sel_inst0[5] ),
   .ibq_buf2_sel_inst1 (ibq_buf2_sel_inst1[5] ),
   .ibq_buf2_sel_inst2 (ibq_buf2_sel_inst2[5] ),
   .ibq_buf2_sel_inst3 (ibq_buf2_sel_inst3[5] ),
   .ibq_buf2_sel_hold  (ibq_buf2_sel_hold[5]  ),

   .ibq_buf3_sel_inst0 (ibq_buf3_sel_inst0[5] ),
   .ibq_buf3_sel_inst1 (ibq_buf3_sel_inst1[5] ),
   .ibq_buf3_sel_inst2 (ibq_buf3_sel_inst2[5] ),
   .ibq_buf3_sel_inst3 (ibq_buf3_sel_inst3[5] ),
   .ibq_buf3_sel_hold  (ibq_buf3_sel_hold[5]  ),

   .ibq_buf4_sel_inst0 (ibq_buf4_sel_inst0[5] ),
   .ibq_buf4_sel_inst1 (ibq_buf4_sel_inst1[5] ),
   .ibq_buf4_sel_inst2 (ibq_buf4_sel_inst2[5] ),
   .ibq_buf4_sel_inst3 (ibq_buf4_sel_inst3[5] ),
   .ibq_buf4_sel_hold  (ibq_buf4_sel_hold[5]  ),

   .ibq_buf5_sel_inst0 (ibq_buf5_sel_inst0[5] ),
   .ibq_buf5_sel_inst1 (ibq_buf5_sel_inst1[5] ),
   .ibq_buf5_sel_inst2 (ibq_buf5_sel_inst2[5] ),
   .ibq_buf5_sel_inst3 (ibq_buf5_sel_inst3[5] ),
   .ibq_buf5_sel_hold  (ibq_buf5_sel_hold[5]  ),

   .ibq_buf6_sel_inst0 (ibq_buf6_sel_inst0[5] ),
   .ibq_buf6_sel_inst1 (ibq_buf6_sel_inst1[5] ),
   .ibq_buf6_sel_inst2 (ibq_buf6_sel_inst2[5] ),
   .ibq_buf6_sel_inst3 (ibq_buf6_sel_inst3[5] ),
   .ibq_buf6_sel_hold  (ibq_buf6_sel_hold[5]  ),

   .ibq_buf7_sel_inst0 (ibq_buf7_sel_inst0[5] ),
   .ibq_buf7_sel_inst1 (ibq_buf7_sel_inst1[5] ),
   .ibq_buf7_sel_inst2 (ibq_buf7_sel_inst2[5] ),
   .ibq_buf7_sel_inst3 (ibq_buf7_sel_inst3[5] ),
   .ibq_buf7_sel_hold  (ibq_buf7_sel_hold[5]  ),



   .ifu_buf0_excp    (ifu_buf0_excp5) ,
   .ifu_buf0_inst  (ifu_buf0_inst5[32:0]  ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk)) ;

ifu_ibu_ibf_dp ibf6 (
   .scan_in(ibf6_scanin),
   .scan_out(ibf6_scanout),
   .l2clk(l2clk),

   .ibq_buff_clken     (ibq_buff_clken[6] ),
   .ibq_ctl_clken      (ibq_ctl_clken[6] ),
   .pku_pick_p         (pku_pick_p[6]  ),

   .ftu_ic_no_err_c (ftu_ic_no_err_c),

   .ftu_instr_0_c(ftu_instr_0_c_rep3[32:0]),
   .ftu_instr_1_c(ftu_instr_1_c_rep3[32:0]),
   .ftu_instr_2_c(ftu_instr_2_c_rep3[32:0]),
   .ftu_instr_3_c(ftu_instr_3_c_rep3[32:0]),
   .ftu_instr_0_exceptions_c(ftu_instr_0_exceptions_c_rep3[4:0]),
   .ftu_instr_1_exceptions_c(ftu_instr_1_exceptions_c_rep3[4:0]),
   .ftu_instr_2_exceptions_c(ftu_instr_2_exceptions_c_rep3[4:0]),
   .ftu_instr_3_exceptions_c(ftu_instr_3_exceptions_c_rep3[4:0]),


   .ibq_buf0_sel_inst0_pick  (ibq_buf0_sel_inst0_pick[6] ),
   .ibq_buf0_sel_inst1_pick  (ibq_buf0_sel_inst1_pick[6] ),
   .ibq_buf0_sel_inst2_pick  (ibq_buf0_sel_inst2_pick[6] ),
   .ibq_buf0_sel_inst3_pick  (ibq_buf0_sel_inst3_pick[6] ),
   .ibq_buf0_sel_inst0_pick_ (ibq_buf0_sel_inst0_pick_[6] ),
   .ibq_buf0_sel_inst1_pick_ (ibq_buf0_sel_inst1_pick_[6] ),
   .ibq_buf0_sel_inst2_pick_ (ibq_buf0_sel_inst2_pick_[6] ),
   .ibq_buf0_sel_inst3_pick_ (ibq_buf0_sel_inst3_pick_[6] ),
   .ibq_buf0_sel_buf1  (ibq_buf0_sel_buf1[6]  ),
   .ibq_buf0_sel_buf2  (ibq_buf0_sel_buf2[6]  ),
   .ibq_buf0_sel_buf3  (ibq_buf0_sel_buf3[6]  ),
   .ibq_buf0_sel_buf4  (ibq_buf0_sel_buf4[6]  ),
   .ibq_buf0_sel_buf5  (ibq_buf0_sel_buf5[6]  ),
   .ibq_buf0_sel_buf6  (ibq_buf0_sel_buf6[6]  ),
   .ibq_buf0_sel_buf7  (ibq_buf0_sel_buf7[6]  ),
   .ibq_buf0_sel_hold_pick  (ibq_buf0_sel_hold_pick[6]  ),
   .ibq_buf0_sel_hold_pick_  (ibq_buf0_sel_hold_pick_[6]  ),

   .ibq_buf0_sel_buf1to7_pick (ibq_buf0_sel_buf1to7_pick[6]),
   .ibq_buf0_sel_buf1to7_pick_ (ibq_buf0_sel_buf1to7_pick_[6]),

   .ibq_buf1_sel_inst0 (ibq_buf1_sel_inst0[6] ),
   .ibq_buf1_sel_inst1 (ibq_buf1_sel_inst1[6] ),
   .ibq_buf1_sel_inst2 (ibq_buf1_sel_inst2[6] ),
   .ibq_buf1_sel_inst3 (ibq_buf1_sel_inst3[6] ),
   .ibq_buf1_sel_hold  (ibq_buf1_sel_hold[6]  ),

   .ibq_buf2_sel_inst0 (ibq_buf2_sel_inst0[6] ),
   .ibq_buf2_sel_inst1 (ibq_buf2_sel_inst1[6] ),
   .ibq_buf2_sel_inst2 (ibq_buf2_sel_inst2[6] ),
   .ibq_buf2_sel_inst3 (ibq_buf2_sel_inst3[6] ),
   .ibq_buf2_sel_hold  (ibq_buf2_sel_hold[6]  ),

   .ibq_buf3_sel_inst0 (ibq_buf3_sel_inst0[6] ),
   .ibq_buf3_sel_inst1 (ibq_buf3_sel_inst1[6] ),
   .ibq_buf3_sel_inst2 (ibq_buf3_sel_inst2[6] ),
   .ibq_buf3_sel_inst3 (ibq_buf3_sel_inst3[6] ),
   .ibq_buf3_sel_hold  (ibq_buf3_sel_hold[6]  ),

   .ibq_buf4_sel_inst0 (ibq_buf4_sel_inst0[6] ),
   .ibq_buf4_sel_inst1 (ibq_buf4_sel_inst1[6] ),
   .ibq_buf4_sel_inst2 (ibq_buf4_sel_inst2[6] ),
   .ibq_buf4_sel_inst3 (ibq_buf4_sel_inst3[6] ),
   .ibq_buf4_sel_hold  (ibq_buf4_sel_hold[6]  ),

   .ibq_buf5_sel_inst0 (ibq_buf5_sel_inst0[6] ),
   .ibq_buf5_sel_inst1 (ibq_buf5_sel_inst1[6] ),
   .ibq_buf5_sel_inst2 (ibq_buf5_sel_inst2[6] ),
   .ibq_buf5_sel_inst3 (ibq_buf5_sel_inst3[6] ),
   .ibq_buf5_sel_hold  (ibq_buf5_sel_hold[6]  ),

   .ibq_buf6_sel_inst0 (ibq_buf6_sel_inst0[6] ),
   .ibq_buf6_sel_inst1 (ibq_buf6_sel_inst1[6] ),
   .ibq_buf6_sel_inst2 (ibq_buf6_sel_inst2[6] ),
   .ibq_buf6_sel_inst3 (ibq_buf6_sel_inst3[6] ),
   .ibq_buf6_sel_hold  (ibq_buf6_sel_hold[6]  ),

   .ibq_buf7_sel_inst0 (ibq_buf7_sel_inst0[6] ),
   .ibq_buf7_sel_inst1 (ibq_buf7_sel_inst1[6] ),
   .ibq_buf7_sel_inst2 (ibq_buf7_sel_inst2[6] ),
   .ibq_buf7_sel_inst3 (ibq_buf7_sel_inst3[6] ),
   .ibq_buf7_sel_hold  (ibq_buf7_sel_hold[6]  ),



   .ifu_buf0_excp    (ifu_buf0_excp6) ,
   .ifu_buf0_inst  (ifu_buf0_inst6[32:0]  ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk)) ;

ifu_ibu_ibf_dp ibf7 (
   .scan_in(ibf7_scanin),
   .scan_out(ibf7_scanout),
   .l2clk(l2clk),

   
   .ibq_buff_clken     (ibq_buff_clken[7] ),
   .ibq_ctl_clken      (ibq_ctl_clken[7] ),
   .pku_pick_p         (pku_pick_p[7]  ),

   .ftu_ic_no_err_c (ftu_ic_no_err_c),

   .ftu_instr_0_c(ftu_instr_0_c_rep3[32:0]),
   .ftu_instr_1_c(ftu_instr_1_c_rep3[32:0]),
   .ftu_instr_2_c(ftu_instr_2_c_rep3[32:0]),
   .ftu_instr_3_c(ftu_instr_3_c_rep3[32:0]),
   .ftu_instr_0_exceptions_c(ftu_instr_0_exceptions_c_rep3[4:0]),
   .ftu_instr_1_exceptions_c(ftu_instr_1_exceptions_c_rep3[4:0]),
   .ftu_instr_2_exceptions_c(ftu_instr_2_exceptions_c_rep3[4:0]),
   .ftu_instr_3_exceptions_c(ftu_instr_3_exceptions_c_rep3[4:0]),


   .ibq_buf0_sel_inst0_pick  (ibq_buf0_sel_inst0_pick[7] ),
   .ibq_buf0_sel_inst1_pick  (ibq_buf0_sel_inst1_pick[7] ),
   .ibq_buf0_sel_inst2_pick  (ibq_buf0_sel_inst2_pick[7] ),
   .ibq_buf0_sel_inst3_pick  (ibq_buf0_sel_inst3_pick[7] ),
   .ibq_buf0_sel_inst0_pick_ (ibq_buf0_sel_inst0_pick_[7] ),
   .ibq_buf0_sel_inst1_pick_ (ibq_buf0_sel_inst1_pick_[7] ),
   .ibq_buf0_sel_inst2_pick_ (ibq_buf0_sel_inst2_pick_[7] ),
   .ibq_buf0_sel_inst3_pick_ (ibq_buf0_sel_inst3_pick_[7] ),
   .ibq_buf0_sel_buf1  (ibq_buf0_sel_buf1[7]  ),
   .ibq_buf0_sel_buf2  (ibq_buf0_sel_buf2[7]  ),
   .ibq_buf0_sel_buf3  (ibq_buf0_sel_buf3[7]  ),
   .ibq_buf0_sel_buf4  (ibq_buf0_sel_buf4[7]  ),
   .ibq_buf0_sel_buf5  (ibq_buf0_sel_buf5[7]  ),
   .ibq_buf0_sel_buf6  (ibq_buf0_sel_buf6[7]  ),
   .ibq_buf0_sel_buf7  (ibq_buf0_sel_buf7[7]  ),
   .ibq_buf0_sel_hold_pick  (ibq_buf0_sel_hold_pick[7]  ),
   .ibq_buf0_sel_hold_pick_  (ibq_buf0_sel_hold_pick_[7]  ),

   .ibq_buf0_sel_buf1to7_pick (ibq_buf0_sel_buf1to7_pick[7]),
   .ibq_buf0_sel_buf1to7_pick_ (ibq_buf0_sel_buf1to7_pick_[7]),

   .ibq_buf1_sel_inst0 (ibq_buf1_sel_inst0[7] ),
   .ibq_buf1_sel_inst1 (ibq_buf1_sel_inst1[7] ),
   .ibq_buf1_sel_inst2 (ibq_buf1_sel_inst2[7] ),
   .ibq_buf1_sel_inst3 (ibq_buf1_sel_inst3[7] ),
   .ibq_buf1_sel_hold  (ibq_buf1_sel_hold[7]  ),

   .ibq_buf2_sel_inst0 (ibq_buf2_sel_inst0[7] ),
   .ibq_buf2_sel_inst1 (ibq_buf2_sel_inst1[7] ),
   .ibq_buf2_sel_inst2 (ibq_buf2_sel_inst2[7] ),
   .ibq_buf2_sel_inst3 (ibq_buf2_sel_inst3[7] ),
   .ibq_buf2_sel_hold  (ibq_buf2_sel_hold[7]  ),

   .ibq_buf3_sel_inst0 (ibq_buf3_sel_inst0[7] ),
   .ibq_buf3_sel_inst1 (ibq_buf3_sel_inst1[7] ),
   .ibq_buf3_sel_inst2 (ibq_buf3_sel_inst2[7] ),
   .ibq_buf3_sel_inst3 (ibq_buf3_sel_inst3[7] ),
   .ibq_buf3_sel_hold  (ibq_buf3_sel_hold[7]  ),

   .ibq_buf4_sel_inst0 (ibq_buf4_sel_inst0[7] ),
   .ibq_buf4_sel_inst1 (ibq_buf4_sel_inst1[7] ),
   .ibq_buf4_sel_inst2 (ibq_buf4_sel_inst2[7] ),
   .ibq_buf4_sel_inst3 (ibq_buf4_sel_inst3[7] ),
   .ibq_buf4_sel_hold  (ibq_buf4_sel_hold[7]  ),

   .ibq_buf5_sel_inst0 (ibq_buf5_sel_inst0[7] ),
   .ibq_buf5_sel_inst1 (ibq_buf5_sel_inst1[7] ),
   .ibq_buf5_sel_inst2 (ibq_buf5_sel_inst2[7] ),
   .ibq_buf5_sel_inst3 (ibq_buf5_sel_inst3[7] ),
   .ibq_buf5_sel_hold  (ibq_buf5_sel_hold[7]  ),

   .ibq_buf6_sel_inst0 (ibq_buf6_sel_inst0[7] ),
   .ibq_buf6_sel_inst1 (ibq_buf6_sel_inst1[7] ),
   .ibq_buf6_sel_inst2 (ibq_buf6_sel_inst2[7] ),
   .ibq_buf6_sel_inst3 (ibq_buf6_sel_inst3[7] ),
   .ibq_buf6_sel_hold  (ibq_buf6_sel_hold[7]  ),

   .ibq_buf7_sel_inst0 (ibq_buf7_sel_inst0[7] ),
   .ibq_buf7_sel_inst1 (ibq_buf7_sel_inst1[7] ),
   .ibq_buf7_sel_inst2 (ibq_buf7_sel_inst2[7] ),
   .ibq_buf7_sel_inst3 (ibq_buf7_sel_inst3[7] ),
   .ibq_buf7_sel_hold  (ibq_buf7_sel_hold[7]  ),



   .ifu_buf0_excp    (ifu_buf0_excp7) ,
   .ifu_buf0_inst  (ifu_buf0_inst7[32:0]  ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk)) ;

        
ifu_ibu_ibq_ctl  ibq0(
   .scan_in(ibq0_scanin),
   .scan_out(ibq0_scanout),
   .l2clk(l2clk),
   
   .pku_flush_buffer0  (pku_flush_buffer0[0]     ),
   .pku_flush_upper_buffer (pku_flush_upper_buffer[0]    ),
   
   .ftu_fetch_thr_c    (ftu_fetch_thr_c[0]   ),
   .ftu_buffer_wr_en_f (ftu_buffer_wr_en_f[0] ),
   .pku_pick_p         (pku_pick_p[0]  ),
 
   .ftu_instr_valid_c   (ftu_instr_valid_c      ),
   .ftu_redirect_bf     (ftu_ibu_redirect_bf[0]  ),

   .ifu_buf0_valid_p   (ifu_buf0_valid_p[0]   ),
   .ifu_upper_buffer_valid_p   (ifu_upper_buffer_valid_p[0]   ),


   .ibu_empty          (ibu_empty[0]          ),
   .ibu_room_4ormore   (ibu_room_4ormore[0]   ),

   .ibq_buff_clken (ibq_buff_clken[0] ),
   .ibq_ctl_clken      (ibq_ctl_clken[0] ),

   .ibq_buf0_sel_inst0_pick (ibq_buf0_sel_inst0_pick[0] ),
   .ibq_buf0_sel_inst1_pick (ibq_buf0_sel_inst1_pick[0] ),
   .ibq_buf0_sel_inst2_pick (ibq_buf0_sel_inst2_pick[0] ),
   .ibq_buf0_sel_inst3_pick (ibq_buf0_sel_inst3_pick[0] ),
   .ibq_buf0_sel_inst0_pick_ (ibq_buf0_sel_inst0_pick_[0] ),
   .ibq_buf0_sel_inst1_pick_ (ibq_buf0_sel_inst1_pick_[0] ),
   .ibq_buf0_sel_inst2_pick_ (ibq_buf0_sel_inst2_pick_[0] ),
   .ibq_buf0_sel_inst3_pick_ (ibq_buf0_sel_inst3_pick_[0] ),
   .ibq_buf0_sel_buf1  (ibq_buf0_sel_buf1[0]  ),
   .ibq_buf0_sel_buf2  (ibq_buf0_sel_buf2[0]  ),
   .ibq_buf0_sel_buf3  (ibq_buf0_sel_buf3[0]  ),
   .ibq_buf0_sel_buf4  (ibq_buf0_sel_buf4[0]  ),
   .ibq_buf0_sel_buf5  (ibq_buf0_sel_buf5[0]  ),
   .ibq_buf0_sel_buf6  (ibq_buf0_sel_buf6[0]  ),
   .ibq_buf0_sel_buf7  (ibq_buf0_sel_buf7[0]  ),
   .ibq_buf0_sel_hold_pick  (ibq_buf0_sel_hold_pick[0]  ),
   .ibq_buf0_sel_hold_pick_  (ibq_buf0_sel_hold_pick_[0]  ),

   .ibq_buf0_sel_buf1to7_pick (ibq_buf0_sel_buf1to7_pick[0]),
   .ibq_buf0_sel_buf1to7_pick_ (ibq_buf0_sel_buf1to7_pick_[0]),

   .ibq_buf1_sel_inst0 (ibq_buf1_sel_inst0[0] ),
   .ibq_buf1_sel_inst1 (ibq_buf1_sel_inst1[0] ),
   .ibq_buf1_sel_inst2 (ibq_buf1_sel_inst2[0] ),
   .ibq_buf1_sel_inst3 (ibq_buf1_sel_inst3[0] ),
   .ibq_buf1_sel_hold  (ibq_buf1_sel_hold[0]  ),

   .ibq_buf2_sel_inst0 (ibq_buf2_sel_inst0[0] ),
   .ibq_buf2_sel_inst1 (ibq_buf2_sel_inst1[0] ),
   .ibq_buf2_sel_inst2 (ibq_buf2_sel_inst2[0] ),
   .ibq_buf2_sel_inst3 (ibq_buf2_sel_inst3[0] ),
   .ibq_buf2_sel_hold  (ibq_buf2_sel_hold[0]  ),

   .ibq_buf3_sel_inst0 (ibq_buf3_sel_inst0[0] ),
   .ibq_buf3_sel_inst1 (ibq_buf3_sel_inst1[0] ),
   .ibq_buf3_sel_inst2 (ibq_buf3_sel_inst2[0] ),
   .ibq_buf3_sel_inst3 (ibq_buf3_sel_inst3[0] ),
   .ibq_buf3_sel_hold  (ibq_buf3_sel_hold[0]  ),

   .ibq_buf4_sel_inst0 (ibq_buf4_sel_inst0[0] ),
   .ibq_buf4_sel_inst1 (ibq_buf4_sel_inst1[0] ),
   .ibq_buf4_sel_inst2 (ibq_buf4_sel_inst2[0] ),
   .ibq_buf4_sel_inst3 (ibq_buf4_sel_inst3[0] ),
   .ibq_buf4_sel_hold  (ibq_buf4_sel_hold[0]  ),

   .ibq_buf5_sel_inst0 (ibq_buf5_sel_inst0[0] ),
   .ibq_buf5_sel_inst1 (ibq_buf5_sel_inst1[0] ),
   .ibq_buf5_sel_inst2 (ibq_buf5_sel_inst2[0] ),
   .ibq_buf5_sel_inst3 (ibq_buf5_sel_inst3[0] ),
   .ibq_buf5_sel_hold  (ibq_buf5_sel_hold[0]  ),

   .ibq_buf6_sel_inst0 (ibq_buf6_sel_inst0[0] ),
   .ibq_buf6_sel_inst1 (ibq_buf6_sel_inst1[0] ),
   .ibq_buf6_sel_inst2 (ibq_buf6_sel_inst2[0] ),
   .ibq_buf6_sel_inst3 (ibq_buf6_sel_inst3[0] ),
   .ibq_buf6_sel_hold  (ibq_buf6_sel_hold[0]  ),

   .ibq_buf7_sel_inst0 (ibq_buf7_sel_inst0[0] ),
   .ibq_buf7_sel_inst1 (ibq_buf7_sel_inst1[0] ),
   .ibq_buf7_sel_inst2 (ibq_buf7_sel_inst2[0] ),
   .ibq_buf7_sel_inst3 (ibq_buf7_sel_inst3[0] ),
   .ibq_buf7_sel_hold  (ibq_buf7_sel_hold[0]  ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .ftu_instr_sf_valid_c(ftu_instr_sf_valid_c),
  .lsu_ifu_ibu_pmen(lsu_ifu_ibu_pmen),
  .l15_ifu_valid(l15_ifu_valid),
  .ftu_exception_valid_c(ftu_exception_valid_c),
  .ftu_bus_0_is_first(ftu_bus_0_is_first),
  .ftu_bus_1_is_first(ftu_bus_1_is_first),
  .ftu_bus_2_is_first(ftu_bus_2_is_first),
  .ftu_bus_3_is_first(ftu_bus_3_is_first)) ;


ifu_ibu_ibq_ctl  ibq1(
   .scan_in(ibq1_scanin),
   .scan_out(ibq1_scanout),
   .l2clk(l2clk),
   
   .pku_flush_buffer0  (pku_flush_buffer0[1]     ),
   .pku_flush_upper_buffer (pku_flush_upper_buffer[1]    ),
   
   .ftu_fetch_thr_c        (ftu_fetch_thr_c[1]   ),
   .ftu_buffer_wr_en_f     (ftu_buffer_wr_en_f[1] ),
   .pku_pick_p             (pku_pick_p[1]  ),

   .ftu_instr_valid_c   (ftu_instr_valid_c      ),
   .ftu_redirect_bf     (ftu_ibu_redirect_bf[1]  ),

   .ifu_buf0_valid_p   (ifu_buf0_valid_p[1]   ),
   .ifu_upper_buffer_valid_p   (ifu_upper_buffer_valid_p[1]   ),


   .ibu_empty          (ibu_empty[1]          ),
   .ibu_room_4ormore   (ibu_room_4ormore[1]   ),
   .ibq_buff_clken (ibq_buff_clken[1] ),
   .ibq_ctl_clken      (ibq_ctl_clken[1] ),

   .ibq_buf0_sel_inst0_pick (ibq_buf0_sel_inst0_pick[1] ),
   .ibq_buf0_sel_inst1_pick (ibq_buf0_sel_inst1_pick[1] ),
   .ibq_buf0_sel_inst2_pick (ibq_buf0_sel_inst2_pick[1] ),
   .ibq_buf0_sel_inst3_pick (ibq_buf0_sel_inst3_pick[1] ),
   .ibq_buf0_sel_inst0_pick_ (ibq_buf0_sel_inst0_pick_[1] ),
   .ibq_buf0_sel_inst1_pick_ (ibq_buf0_sel_inst1_pick_[1] ),
   .ibq_buf0_sel_inst2_pick_ (ibq_buf0_sel_inst2_pick_[1] ),
   .ibq_buf0_sel_inst3_pick_ (ibq_buf0_sel_inst3_pick_[1] ),
   .ibq_buf0_sel_buf1  (ibq_buf0_sel_buf1[1]  ),
   .ibq_buf0_sel_buf2  (ibq_buf0_sel_buf2[1]  ),
   .ibq_buf0_sel_buf3  (ibq_buf0_sel_buf3[1]  ),
   .ibq_buf0_sel_buf4  (ibq_buf0_sel_buf4[1]  ),
   .ibq_buf0_sel_buf5  (ibq_buf0_sel_buf5[1]  ),
   .ibq_buf0_sel_buf6  (ibq_buf0_sel_buf6[1]  ),
   .ibq_buf0_sel_buf7  (ibq_buf0_sel_buf7[1]  ),
   .ibq_buf0_sel_hold_pick  (ibq_buf0_sel_hold_pick[1]  ),
   .ibq_buf0_sel_hold_pick_  (ibq_buf0_sel_hold_pick_[1]  ),

   .ibq_buf0_sel_buf1to7_pick (ibq_buf0_sel_buf1to7_pick[1]),
   .ibq_buf0_sel_buf1to7_pick_ (ibq_buf0_sel_buf1to7_pick_[1]),

   .ibq_buf1_sel_inst0 (ibq_buf1_sel_inst0[1] ),
   .ibq_buf1_sel_inst1 (ibq_buf1_sel_inst1[1] ),
   .ibq_buf1_sel_inst2 (ibq_buf1_sel_inst2[1] ),
   .ibq_buf1_sel_inst3 (ibq_buf1_sel_inst3[1] ),
   .ibq_buf1_sel_hold  (ibq_buf1_sel_hold[1]  ),

   .ibq_buf2_sel_inst0 (ibq_buf2_sel_inst0[1] ),
   .ibq_buf2_sel_inst1 (ibq_buf2_sel_inst1[1] ),
   .ibq_buf2_sel_inst2 (ibq_buf2_sel_inst2[1] ),
   .ibq_buf2_sel_inst3 (ibq_buf2_sel_inst3[1] ),
   .ibq_buf2_sel_hold  (ibq_buf2_sel_hold[1]  ),

   .ibq_buf3_sel_inst0 (ibq_buf3_sel_inst0[1] ),
   .ibq_buf3_sel_inst1 (ibq_buf3_sel_inst1[1] ),
   .ibq_buf3_sel_inst2 (ibq_buf3_sel_inst2[1] ),
   .ibq_buf3_sel_inst3 (ibq_buf3_sel_inst3[1] ),
   .ibq_buf3_sel_hold  (ibq_buf3_sel_hold[1]  ),

   .ibq_buf4_sel_inst0 (ibq_buf4_sel_inst0[1] ),
   .ibq_buf4_sel_inst1 (ibq_buf4_sel_inst1[1] ),
   .ibq_buf4_sel_inst2 (ibq_buf4_sel_inst2[1] ),
   .ibq_buf4_sel_inst3 (ibq_buf4_sel_inst3[1] ),
   .ibq_buf4_sel_hold  (ibq_buf4_sel_hold[1]  ),

   .ibq_buf5_sel_inst0 (ibq_buf5_sel_inst0[1] ),
   .ibq_buf5_sel_inst1 (ibq_buf5_sel_inst1[1] ),
   .ibq_buf5_sel_inst2 (ibq_buf5_sel_inst2[1] ),
   .ibq_buf5_sel_inst3 (ibq_buf5_sel_inst3[1] ),
   .ibq_buf5_sel_hold  (ibq_buf5_sel_hold[1]  ),

   .ibq_buf6_sel_inst0 (ibq_buf6_sel_inst0[1] ),
   .ibq_buf6_sel_inst1 (ibq_buf6_sel_inst1[1] ),
   .ibq_buf6_sel_inst2 (ibq_buf6_sel_inst2[1] ),
   .ibq_buf6_sel_inst3 (ibq_buf6_sel_inst3[1] ),
   .ibq_buf6_sel_hold  (ibq_buf6_sel_hold[1]  ),

   .ibq_buf7_sel_inst0 (ibq_buf7_sel_inst0[1] ),
   .ibq_buf7_sel_inst1 (ibq_buf7_sel_inst1[1] ),
   .ibq_buf7_sel_inst2 (ibq_buf7_sel_inst2[1] ),
   .ibq_buf7_sel_inst3 (ibq_buf7_sel_inst3[1] ),
   .ibq_buf7_sel_hold  (ibq_buf7_sel_hold[1]  ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .ftu_instr_sf_valid_c(ftu_instr_sf_valid_c),
  .lsu_ifu_ibu_pmen(lsu_ifu_ibu_pmen),
  .l15_ifu_valid(l15_ifu_valid),
  .ftu_exception_valid_c(ftu_exception_valid_c),
  .ftu_bus_0_is_first(ftu_bus_0_is_first),
  .ftu_bus_1_is_first(ftu_bus_1_is_first),
  .ftu_bus_2_is_first(ftu_bus_2_is_first),
  .ftu_bus_3_is_first(ftu_bus_3_is_first)) ;


ifu_ibu_ibq_ctl  ibq2(
   .scan_in(ibq2_scanin),
   .scan_out(ibq2_scanout),
   .l2clk(l2clk),
   
   .pku_flush_buffer0  (pku_flush_buffer0[2]     ),
   .pku_flush_upper_buffer (pku_flush_upper_buffer[2]    ),
   
   .ftu_fetch_thr_c        (ftu_fetch_thr_c[2]   ),
   .ftu_buffer_wr_en_f     (ftu_buffer_wr_en_f[2] ),   
   .pku_pick_p             (pku_pick_p[2]  ),

   .ftu_instr_valid_c   (ftu_instr_valid_c      ),
   .ftu_redirect_bf     (ftu_ibu_redirect_bf[2]  ),

   .ifu_buf0_valid_p   (ifu_buf0_valid_p[2]   ),
   .ifu_upper_buffer_valid_p   (ifu_upper_buffer_valid_p[2]   ),


   .ibu_empty          (ibu_empty[2]          ),
   .ibu_room_4ormore   (ibu_room_4ormore[2]   ),
   .ibq_buff_clken (ibq_buff_clken[2] ),
   .ibq_ctl_clken      (ibq_ctl_clken[2] ),

   .ibq_buf0_sel_inst0_pick (ibq_buf0_sel_inst0_pick[2] ),
   .ibq_buf0_sel_inst1_pick (ibq_buf0_sel_inst1_pick[2] ),
   .ibq_buf0_sel_inst2_pick (ibq_buf0_sel_inst2_pick[2] ),
   .ibq_buf0_sel_inst3_pick (ibq_buf0_sel_inst3_pick[2] ),
   .ibq_buf0_sel_inst0_pick_ (ibq_buf0_sel_inst0_pick_[2] ),
   .ibq_buf0_sel_inst1_pick_ (ibq_buf0_sel_inst1_pick_[2] ),
   .ibq_buf0_sel_inst2_pick_ (ibq_buf0_sel_inst2_pick_[2] ),
   .ibq_buf0_sel_inst3_pick_ (ibq_buf0_sel_inst3_pick_[2] ),
   .ibq_buf0_sel_buf1  (ibq_buf0_sel_buf1[2]  ),
   .ibq_buf0_sel_buf2  (ibq_buf0_sel_buf2[2]  ),
   .ibq_buf0_sel_buf3  (ibq_buf0_sel_buf3[2]  ),
   .ibq_buf0_sel_buf4  (ibq_buf0_sel_buf4[2]  ),
   .ibq_buf0_sel_buf5  (ibq_buf0_sel_buf5[2]  ),
   .ibq_buf0_sel_buf6  (ibq_buf0_sel_buf6[2]  ),
   .ibq_buf0_sel_buf7  (ibq_buf0_sel_buf7[2]  ),
   .ibq_buf0_sel_hold_pick  (ibq_buf0_sel_hold_pick[2]  ),
   .ibq_buf0_sel_hold_pick_  (ibq_buf0_sel_hold_pick_[2]  ),

   .ibq_buf0_sel_buf1to7_pick (ibq_buf0_sel_buf1to7_pick[2]),
   .ibq_buf0_sel_buf1to7_pick_ (ibq_buf0_sel_buf1to7_pick_[2]),

   .ibq_buf1_sel_inst0 (ibq_buf1_sel_inst0[2] ),
   .ibq_buf1_sel_inst1 (ibq_buf1_sel_inst1[2] ),
   .ibq_buf1_sel_inst2 (ibq_buf1_sel_inst2[2] ),
   .ibq_buf1_sel_inst3 (ibq_buf1_sel_inst3[2] ),
   .ibq_buf1_sel_hold  (ibq_buf1_sel_hold[2]  ),

   .ibq_buf2_sel_inst0 (ibq_buf2_sel_inst0[2] ),
   .ibq_buf2_sel_inst1 (ibq_buf2_sel_inst1[2] ),
   .ibq_buf2_sel_inst2 (ibq_buf2_sel_inst2[2] ),
   .ibq_buf2_sel_inst3 (ibq_buf2_sel_inst3[2] ),
   .ibq_buf2_sel_hold  (ibq_buf2_sel_hold[2]  ),

   .ibq_buf3_sel_inst0 (ibq_buf3_sel_inst0[2] ),
   .ibq_buf3_sel_inst1 (ibq_buf3_sel_inst1[2] ),
   .ibq_buf3_sel_inst2 (ibq_buf3_sel_inst2[2] ),
   .ibq_buf3_sel_inst3 (ibq_buf3_sel_inst3[2] ),
   .ibq_buf3_sel_hold  (ibq_buf3_sel_hold[2]  ),

   .ibq_buf4_sel_inst0 (ibq_buf4_sel_inst0[2] ),
   .ibq_buf4_sel_inst1 (ibq_buf4_sel_inst1[2] ),
   .ibq_buf4_sel_inst2 (ibq_buf4_sel_inst2[2] ),
   .ibq_buf4_sel_inst3 (ibq_buf4_sel_inst3[2] ),
   .ibq_buf4_sel_hold  (ibq_buf4_sel_hold[2]  ),

   .ibq_buf5_sel_inst0 (ibq_buf5_sel_inst0[2] ),
   .ibq_buf5_sel_inst1 (ibq_buf5_sel_inst1[2] ),
   .ibq_buf5_sel_inst2 (ibq_buf5_sel_inst2[2] ),
   .ibq_buf5_sel_inst3 (ibq_buf5_sel_inst3[2] ),
   .ibq_buf5_sel_hold  (ibq_buf5_sel_hold[2]  ),

   .ibq_buf6_sel_inst0 (ibq_buf6_sel_inst0[2] ),
   .ibq_buf6_sel_inst1 (ibq_buf6_sel_inst1[2] ),
   .ibq_buf6_sel_inst2 (ibq_buf6_sel_inst2[2] ),
   .ibq_buf6_sel_inst3 (ibq_buf6_sel_inst3[2] ),
   .ibq_buf6_sel_hold  (ibq_buf6_sel_hold[2]  ),

   .ibq_buf7_sel_inst0 (ibq_buf7_sel_inst0[2] ),
   .ibq_buf7_sel_inst1 (ibq_buf7_sel_inst1[2] ),
   .ibq_buf7_sel_inst2 (ibq_buf7_sel_inst2[2] ),
   .ibq_buf7_sel_inst3 (ibq_buf7_sel_inst3[2] ),
   .ibq_buf7_sel_hold  (ibq_buf7_sel_hold[2]  ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .ftu_instr_sf_valid_c(ftu_instr_sf_valid_c),
  .lsu_ifu_ibu_pmen(lsu_ifu_ibu_pmen),
  .l15_ifu_valid(l15_ifu_valid),
  .ftu_exception_valid_c(ftu_exception_valid_c),
  .ftu_bus_0_is_first(ftu_bus_0_is_first),
  .ftu_bus_1_is_first(ftu_bus_1_is_first),
  .ftu_bus_2_is_first(ftu_bus_2_is_first),
  .ftu_bus_3_is_first(ftu_bus_3_is_first)) ;


ifu_ibu_ibq_ctl  ibq3(
   .scan_in(ibq3_scanin),
   .scan_out(ibq3_scanout),
   .l2clk(l2clk),
   
   .pku_flush_buffer0  (pku_flush_buffer0[3]     ),
   .pku_flush_upper_buffer (pku_flush_upper_buffer[3]    ),
   
   .ftu_fetch_thr_c    (ftu_fetch_thr_c[3]   ),
   .ftu_buffer_wr_en_f (ftu_buffer_wr_en_f[3] ),
   .pku_pick_p         (pku_pick_p[3]  ),

   .ftu_instr_valid_c   (ftu_instr_valid_c      ),
   .ftu_redirect_bf     (ftu_ibu_redirect_bf[3]  ),

   .ifu_buf0_valid_p   (ifu_buf0_valid_p[3]   ),
   .ifu_upper_buffer_valid_p   (ifu_upper_buffer_valid_p[3]   ),


   .ibu_empty          (ibu_empty[3]          ),
   .ibu_room_4ormore   (ibu_room_4ormore[3]   ),
   .ibq_buff_clken (ibq_buff_clken[3] ),
   .ibq_ctl_clken      (ibq_ctl_clken[3] ),

   .ibq_buf0_sel_inst0_pick (ibq_buf0_sel_inst0_pick[3] ),
   .ibq_buf0_sel_inst1_pick (ibq_buf0_sel_inst1_pick[3] ),
   .ibq_buf0_sel_inst2_pick (ibq_buf0_sel_inst2_pick[3] ),
   .ibq_buf0_sel_inst3_pick (ibq_buf0_sel_inst3_pick[3] ),
   .ibq_buf0_sel_inst0_pick_ (ibq_buf0_sel_inst0_pick_[3] ),
   .ibq_buf0_sel_inst1_pick_ (ibq_buf0_sel_inst1_pick_[3] ),
   .ibq_buf0_sel_inst2_pick_ (ibq_buf0_sel_inst2_pick_[3] ),
   .ibq_buf0_sel_inst3_pick_ (ibq_buf0_sel_inst3_pick_[3] ),
   .ibq_buf0_sel_buf1  (ibq_buf0_sel_buf1[3]  ),
   .ibq_buf0_sel_buf2  (ibq_buf0_sel_buf2[3]  ),
   .ibq_buf0_sel_buf3  (ibq_buf0_sel_buf3[3]  ),
   .ibq_buf0_sel_buf4  (ibq_buf0_sel_buf4[3]  ),
   .ibq_buf0_sel_buf5  (ibq_buf0_sel_buf5[3]  ),
   .ibq_buf0_sel_buf6  (ibq_buf0_sel_buf6[3]  ),
   .ibq_buf0_sel_buf7  (ibq_buf0_sel_buf7[3]  ),
   .ibq_buf0_sel_hold_pick  (ibq_buf0_sel_hold_pick[3]  ),
   .ibq_buf0_sel_hold_pick_  (ibq_buf0_sel_hold_pick_[3]  ),

   .ibq_buf0_sel_buf1to7_pick (ibq_buf0_sel_buf1to7_pick[3]),
   .ibq_buf0_sel_buf1to7_pick_ (ibq_buf0_sel_buf1to7_pick_[3]),

   .ibq_buf1_sel_inst0 (ibq_buf1_sel_inst0[3] ),
   .ibq_buf1_sel_inst1 (ibq_buf1_sel_inst1[3] ),
   .ibq_buf1_sel_inst2 (ibq_buf1_sel_inst2[3] ),
   .ibq_buf1_sel_inst3 (ibq_buf1_sel_inst3[3] ),
   .ibq_buf1_sel_hold  (ibq_buf1_sel_hold[3]  ),

   .ibq_buf2_sel_inst0 (ibq_buf2_sel_inst0[3] ),
   .ibq_buf2_sel_inst1 (ibq_buf2_sel_inst1[3] ),
   .ibq_buf2_sel_inst2 (ibq_buf2_sel_inst2[3] ),
   .ibq_buf2_sel_inst3 (ibq_buf2_sel_inst3[3] ),
   .ibq_buf2_sel_hold  (ibq_buf2_sel_hold[3]  ),

   .ibq_buf3_sel_inst0 (ibq_buf3_sel_inst0[3] ),
   .ibq_buf3_sel_inst1 (ibq_buf3_sel_inst1[3] ),
   .ibq_buf3_sel_inst2 (ibq_buf3_sel_inst2[3] ),
   .ibq_buf3_sel_inst3 (ibq_buf3_sel_inst3[3] ),
   .ibq_buf3_sel_hold  (ibq_buf3_sel_hold[3]  ),

   .ibq_buf4_sel_inst0 (ibq_buf4_sel_inst0[3] ),
   .ibq_buf4_sel_inst1 (ibq_buf4_sel_inst1[3] ),
   .ibq_buf4_sel_inst2 (ibq_buf4_sel_inst2[3] ),
   .ibq_buf4_sel_inst3 (ibq_buf4_sel_inst3[3] ),
   .ibq_buf4_sel_hold  (ibq_buf4_sel_hold[3]  ),

   .ibq_buf5_sel_inst0 (ibq_buf5_sel_inst0[3] ),
   .ibq_buf5_sel_inst1 (ibq_buf5_sel_inst1[3] ),
   .ibq_buf5_sel_inst2 (ibq_buf5_sel_inst2[3] ),
   .ibq_buf5_sel_inst3 (ibq_buf5_sel_inst3[3] ),
   .ibq_buf5_sel_hold  (ibq_buf5_sel_hold[3]  ),

   .ibq_buf6_sel_inst0 (ibq_buf6_sel_inst0[3] ),
   .ibq_buf6_sel_inst1 (ibq_buf6_sel_inst1[3] ),
   .ibq_buf6_sel_inst2 (ibq_buf6_sel_inst2[3] ),
   .ibq_buf6_sel_inst3 (ibq_buf6_sel_inst3[3] ),
   .ibq_buf6_sel_hold  (ibq_buf6_sel_hold[3]  ),

   .ibq_buf7_sel_inst0 (ibq_buf7_sel_inst0[3] ),
   .ibq_buf7_sel_inst1 (ibq_buf7_sel_inst1[3] ),
   .ibq_buf7_sel_inst2 (ibq_buf7_sel_inst2[3] ),
   .ibq_buf7_sel_inst3 (ibq_buf7_sel_inst3[3] ),
   .ibq_buf7_sel_hold  (ibq_buf7_sel_hold[3]  ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .ftu_instr_sf_valid_c(ftu_instr_sf_valid_c),
  .lsu_ifu_ibu_pmen(lsu_ifu_ibu_pmen),
  .l15_ifu_valid(l15_ifu_valid),
  .ftu_exception_valid_c(ftu_exception_valid_c),
  .ftu_bus_0_is_first(ftu_bus_0_is_first),
  .ftu_bus_1_is_first(ftu_bus_1_is_first),
  .ftu_bus_2_is_first(ftu_bus_2_is_first),
  .ftu_bus_3_is_first(ftu_bus_3_is_first)) ;


ifu_ibu_ibq_ctl  ibq4(
   .scan_in(ibq4_scanin),
   .scan_out(ibq4_scanout),
   .l2clk(l2clk),
   
   .pku_flush_buffer0  (pku_flush_buffer0[4]     ),
   .pku_flush_upper_buffer (pku_flush_upper_buffer[4]    ),
   
   .ftu_fetch_thr_c    (ftu_fetch_thr_c[4]   ),
   .ftu_buffer_wr_en_f (ftu_buffer_wr_en_f[4] ),
   .pku_pick_p         (pku_pick_p[4]  ),

   .ftu_instr_valid_c   (ftu_instr_valid_c      ),
   .ftu_redirect_bf     (ftu_ibu_redirect_bf[4]  ),

   .ifu_buf0_valid_p   (ifu_buf0_valid_p[4]   ),
   .ifu_upper_buffer_valid_p   (ifu_upper_buffer_valid_p[4]   ),


   .ibu_empty          (ibu_empty[4]          ),
   .ibu_room_4ormore   (ibu_room_4ormore[4]   ),
   .ibq_buff_clken (ibq_buff_clken[4] ),
   .ibq_ctl_clken      (ibq_ctl_clken[4] ),

   .ibq_buf0_sel_inst0_pick (ibq_buf0_sel_inst0_pick[4] ),
   .ibq_buf0_sel_inst1_pick (ibq_buf0_sel_inst1_pick[4] ),
   .ibq_buf0_sel_inst2_pick (ibq_buf0_sel_inst2_pick[4] ),
   .ibq_buf0_sel_inst3_pick (ibq_buf0_sel_inst3_pick[4] ),
   .ibq_buf0_sel_inst0_pick_ (ibq_buf0_sel_inst0_pick_[4] ),
   .ibq_buf0_sel_inst1_pick_ (ibq_buf0_sel_inst1_pick_[4] ),
   .ibq_buf0_sel_inst2_pick_ (ibq_buf0_sel_inst2_pick_[4] ),
   .ibq_buf0_sel_inst3_pick_ (ibq_buf0_sel_inst3_pick_[4] ),
   .ibq_buf0_sel_buf1  (ibq_buf0_sel_buf1[4]  ),
   .ibq_buf0_sel_buf2  (ibq_buf0_sel_buf2[4]  ),
   .ibq_buf0_sel_buf3  (ibq_buf0_sel_buf3[4]  ),
   .ibq_buf0_sel_buf4  (ibq_buf0_sel_buf4[4]  ),
   .ibq_buf0_sel_buf5  (ibq_buf0_sel_buf5[4]  ),
   .ibq_buf0_sel_buf6  (ibq_buf0_sel_buf6[4]  ),
   .ibq_buf0_sel_buf7  (ibq_buf0_sel_buf7[4]  ),
   .ibq_buf0_sel_hold_pick  (ibq_buf0_sel_hold_pick[4]  ),
   .ibq_buf0_sel_hold_pick_  (ibq_buf0_sel_hold_pick_[4]  ),

   .ibq_buf0_sel_buf1to7_pick (ibq_buf0_sel_buf1to7_pick[4]),
   .ibq_buf0_sel_buf1to7_pick_ (ibq_buf0_sel_buf1to7_pick_[4]),

   .ibq_buf1_sel_inst0 (ibq_buf1_sel_inst0[4] ),
   .ibq_buf1_sel_inst1 (ibq_buf1_sel_inst1[4] ),
   .ibq_buf1_sel_inst2 (ibq_buf1_sel_inst2[4] ),
   .ibq_buf1_sel_inst3 (ibq_buf1_sel_inst3[4] ),
   .ibq_buf1_sel_hold  (ibq_buf1_sel_hold[4]  ),

   .ibq_buf2_sel_inst0 (ibq_buf2_sel_inst0[4] ),
   .ibq_buf2_sel_inst1 (ibq_buf2_sel_inst1[4] ),
   .ibq_buf2_sel_inst2 (ibq_buf2_sel_inst2[4] ),
   .ibq_buf2_sel_inst3 (ibq_buf2_sel_inst3[4] ),
   .ibq_buf2_sel_hold  (ibq_buf2_sel_hold[4]  ),

   .ibq_buf3_sel_inst0 (ibq_buf3_sel_inst0[4] ),
   .ibq_buf3_sel_inst1 (ibq_buf3_sel_inst1[4] ),
   .ibq_buf3_sel_inst2 (ibq_buf3_sel_inst2[4] ),
   .ibq_buf3_sel_inst3 (ibq_buf3_sel_inst3[4] ),
   .ibq_buf3_sel_hold  (ibq_buf3_sel_hold[4]  ),

   .ibq_buf4_sel_inst0 (ibq_buf4_sel_inst0[4] ),
   .ibq_buf4_sel_inst1 (ibq_buf4_sel_inst1[4] ),
   .ibq_buf4_sel_inst2 (ibq_buf4_sel_inst2[4] ),
   .ibq_buf4_sel_inst3 (ibq_buf4_sel_inst3[4] ),
   .ibq_buf4_sel_hold  (ibq_buf4_sel_hold[4]  ),

   .ibq_buf5_sel_inst0 (ibq_buf5_sel_inst0[4] ),
   .ibq_buf5_sel_inst1 (ibq_buf5_sel_inst1[4] ),
   .ibq_buf5_sel_inst2 (ibq_buf5_sel_inst2[4] ),
   .ibq_buf5_sel_inst3 (ibq_buf5_sel_inst3[4] ),
   .ibq_buf5_sel_hold  (ibq_buf5_sel_hold[4]  ),

   .ibq_buf6_sel_inst0 (ibq_buf6_sel_inst0[4] ),
   .ibq_buf6_sel_inst1 (ibq_buf6_sel_inst1[4] ),
   .ibq_buf6_sel_inst2 (ibq_buf6_sel_inst2[4] ),
   .ibq_buf6_sel_inst3 (ibq_buf6_sel_inst3[4] ),
   .ibq_buf6_sel_hold  (ibq_buf6_sel_hold[4]  ),

   .ibq_buf7_sel_inst0 (ibq_buf7_sel_inst0[4] ),
   .ibq_buf7_sel_inst1 (ibq_buf7_sel_inst1[4] ),
   .ibq_buf7_sel_inst2 (ibq_buf7_sel_inst2[4] ),
   .ibq_buf7_sel_inst3 (ibq_buf7_sel_inst3[4] ),
   .ibq_buf7_sel_hold  (ibq_buf7_sel_hold[4]  ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .ftu_instr_sf_valid_c(ftu_instr_sf_valid_c),
  .lsu_ifu_ibu_pmen(lsu_ifu_ibu_pmen),
  .l15_ifu_valid(l15_ifu_valid),
  .ftu_exception_valid_c(ftu_exception_valid_c),
  .ftu_bus_0_is_first(ftu_bus_0_is_first),
  .ftu_bus_1_is_first(ftu_bus_1_is_first),
  .ftu_bus_2_is_first(ftu_bus_2_is_first),
  .ftu_bus_3_is_first(ftu_bus_3_is_first)) ;


ifu_ibu_ibq_ctl  ibq5(
   .scan_in(ibq5_scanin),
   .scan_out(ibq5_scanout),
   .l2clk(l2clk),
   
   .pku_flush_buffer0  (pku_flush_buffer0[5]     ),
   .pku_flush_upper_buffer (pku_flush_upper_buffer[5]    ),
   
   .ftu_fetch_thr_c    (ftu_fetch_thr_c[5]   ),
   .ftu_buffer_wr_en_f (ftu_buffer_wr_en_f[5] ),
   .pku_pick_p         (pku_pick_p[5]  ),

   .ftu_instr_valid_c   (ftu_instr_valid_c      ),
   .ftu_redirect_bf     (ftu_ibu_redirect_bf[5]  ),

   .ifu_buf0_valid_p   (ifu_buf0_valid_p[5]   ),
   .ifu_upper_buffer_valid_p   (ifu_upper_buffer_valid_p[5]   ),


   .ibu_empty          (ibu_empty[5]          ),
   .ibu_room_4ormore   (ibu_room_4ormore[5]   ),
   .ibq_buff_clken (ibq_buff_clken[5] ),
   .ibq_ctl_clken      (ibq_ctl_clken[5] ),

   .ibq_buf0_sel_inst0_pick (ibq_buf0_sel_inst0_pick[5] ),
   .ibq_buf0_sel_inst1_pick (ibq_buf0_sel_inst1_pick[5] ),
   .ibq_buf0_sel_inst2_pick (ibq_buf0_sel_inst2_pick[5] ),
   .ibq_buf0_sel_inst3_pick (ibq_buf0_sel_inst3_pick[5] ),
   .ibq_buf0_sel_inst0_pick_ (ibq_buf0_sel_inst0_pick_[5] ),
   .ibq_buf0_sel_inst1_pick_ (ibq_buf0_sel_inst1_pick_[5] ),
   .ibq_buf0_sel_inst2_pick_ (ibq_buf0_sel_inst2_pick_[5] ),
   .ibq_buf0_sel_inst3_pick_ (ibq_buf0_sel_inst3_pick_[5] ),
   .ibq_buf0_sel_buf1  (ibq_buf0_sel_buf1[5]  ),
   .ibq_buf0_sel_buf2  (ibq_buf0_sel_buf2[5]  ),
   .ibq_buf0_sel_buf3  (ibq_buf0_sel_buf3[5]  ),
   .ibq_buf0_sel_buf4  (ibq_buf0_sel_buf4[5]  ),
   .ibq_buf0_sel_buf5  (ibq_buf0_sel_buf5[5]  ),
   .ibq_buf0_sel_buf6  (ibq_buf0_sel_buf6[5]  ),
   .ibq_buf0_sel_buf7  (ibq_buf0_sel_buf7[5]  ),
   .ibq_buf0_sel_hold_pick  (ibq_buf0_sel_hold_pick[5]  ),
   .ibq_buf0_sel_hold_pick_  (ibq_buf0_sel_hold_pick_[5]  ),

   .ibq_buf0_sel_buf1to7_pick (ibq_buf0_sel_buf1to7_pick[5]),
   .ibq_buf0_sel_buf1to7_pick_ (ibq_buf0_sel_buf1to7_pick_[5]),

   .ibq_buf1_sel_inst0 (ibq_buf1_sel_inst0[5] ),
   .ibq_buf1_sel_inst1 (ibq_buf1_sel_inst1[5] ),
   .ibq_buf1_sel_inst2 (ibq_buf1_sel_inst2[5] ),
   .ibq_buf1_sel_inst3 (ibq_buf1_sel_inst3[5] ),
   .ibq_buf1_sel_hold  (ibq_buf1_sel_hold[5]  ),

   .ibq_buf2_sel_inst0 (ibq_buf2_sel_inst0[5] ),
   .ibq_buf2_sel_inst1 (ibq_buf2_sel_inst1[5] ),
   .ibq_buf2_sel_inst2 (ibq_buf2_sel_inst2[5] ),
   .ibq_buf2_sel_inst3 (ibq_buf2_sel_inst3[5] ),
   .ibq_buf2_sel_hold  (ibq_buf2_sel_hold[5]  ),

   .ibq_buf3_sel_inst0 (ibq_buf3_sel_inst0[5] ),
   .ibq_buf3_sel_inst1 (ibq_buf3_sel_inst1[5] ),
   .ibq_buf3_sel_inst2 (ibq_buf3_sel_inst2[5] ),
   .ibq_buf3_sel_inst3 (ibq_buf3_sel_inst3[5] ),
   .ibq_buf3_sel_hold  (ibq_buf3_sel_hold[5]  ),

   .ibq_buf4_sel_inst0 (ibq_buf4_sel_inst0[5] ),
   .ibq_buf4_sel_inst1 (ibq_buf4_sel_inst1[5] ),
   .ibq_buf4_sel_inst2 (ibq_buf4_sel_inst2[5] ),
   .ibq_buf4_sel_inst3 (ibq_buf4_sel_inst3[5] ),
   .ibq_buf4_sel_hold  (ibq_buf4_sel_hold[5]  ),

   .ibq_buf5_sel_inst0 (ibq_buf5_sel_inst0[5] ),
   .ibq_buf5_sel_inst1 (ibq_buf5_sel_inst1[5] ),
   .ibq_buf5_sel_inst2 (ibq_buf5_sel_inst2[5] ),
   .ibq_buf5_sel_inst3 (ibq_buf5_sel_inst3[5] ),
   .ibq_buf5_sel_hold  (ibq_buf5_sel_hold[5]  ),

   .ibq_buf6_sel_inst0 (ibq_buf6_sel_inst0[5] ),
   .ibq_buf6_sel_inst1 (ibq_buf6_sel_inst1[5] ),
   .ibq_buf6_sel_inst2 (ibq_buf6_sel_inst2[5] ),
   .ibq_buf6_sel_inst3 (ibq_buf6_sel_inst3[5] ),
   .ibq_buf6_sel_hold  (ibq_buf6_sel_hold[5]  ),

   .ibq_buf7_sel_inst0 (ibq_buf7_sel_inst0[5] ),
   .ibq_buf7_sel_inst1 (ibq_buf7_sel_inst1[5] ),
   .ibq_buf7_sel_inst2 (ibq_buf7_sel_inst2[5] ),
   .ibq_buf7_sel_inst3 (ibq_buf7_sel_inst3[5] ),
   .ibq_buf7_sel_hold  (ibq_buf7_sel_hold[5]  ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .ftu_instr_sf_valid_c(ftu_instr_sf_valid_c),
  .lsu_ifu_ibu_pmen(lsu_ifu_ibu_pmen),
  .l15_ifu_valid(l15_ifu_valid),
  .ftu_exception_valid_c(ftu_exception_valid_c),
  .ftu_bus_0_is_first(ftu_bus_0_is_first),
  .ftu_bus_1_is_first(ftu_bus_1_is_first),
  .ftu_bus_2_is_first(ftu_bus_2_is_first),
  .ftu_bus_3_is_first(ftu_bus_3_is_first)) ;


ifu_ibu_ibq_ctl  ibq6(
   .scan_in(ibq6_scanin),
   .scan_out(ibq6_scanout),
   .l2clk(l2clk),
   
   .pku_flush_buffer0  (pku_flush_buffer0[6]     ),
   .pku_flush_upper_buffer (pku_flush_upper_buffer[6]    ),
   
   .ftu_fetch_thr_c        (ftu_fetch_thr_c[6]   ),
   .ftu_buffer_wr_en_f (ftu_buffer_wr_en_f[6] ),
   .pku_pick_p         (pku_pick_p[6]  ),

   .ftu_instr_valid_c   (ftu_instr_valid_c      ),
   .ftu_redirect_bf     (ftu_ibu_redirect_bf[6]  ),

   .ifu_buf0_valid_p   (ifu_buf0_valid_p[6]   ),
   .ifu_upper_buffer_valid_p   (ifu_upper_buffer_valid_p[6]   ),


   .ibu_empty          (ibu_empty[6]          ),
   .ibu_room_4ormore   (ibu_room_4ormore[6]   ),
   .ibq_buff_clken     (ibq_buff_clken[6] ),
   .ibq_ctl_clken      (ibq_ctl_clken[6] ),

   .ibq_buf0_sel_inst0_pick (ibq_buf0_sel_inst0_pick[6] ),
   .ibq_buf0_sel_inst1_pick (ibq_buf0_sel_inst1_pick[6] ),
   .ibq_buf0_sel_inst2_pick (ibq_buf0_sel_inst2_pick[6] ),
   .ibq_buf0_sel_inst3_pick (ibq_buf0_sel_inst3_pick[6] ),
   .ibq_buf0_sel_inst0_pick_ (ibq_buf0_sel_inst0_pick_[6] ),
   .ibq_buf0_sel_inst1_pick_ (ibq_buf0_sel_inst1_pick_[6] ),
   .ibq_buf0_sel_inst2_pick_ (ibq_buf0_sel_inst2_pick_[6] ),
   .ibq_buf0_sel_inst3_pick_ (ibq_buf0_sel_inst3_pick_[6] ),
   .ibq_buf0_sel_buf1  (ibq_buf0_sel_buf1[6]  ),
   .ibq_buf0_sel_buf2  (ibq_buf0_sel_buf2[6]  ),
   .ibq_buf0_sel_buf3  (ibq_buf0_sel_buf3[6]  ),
   .ibq_buf0_sel_buf4  (ibq_buf0_sel_buf4[6]  ),
   .ibq_buf0_sel_buf5  (ibq_buf0_sel_buf5[6]  ),
   .ibq_buf0_sel_buf6  (ibq_buf0_sel_buf6[6]  ),
   .ibq_buf0_sel_buf7  (ibq_buf0_sel_buf7[6]  ),
   .ibq_buf0_sel_hold_pick  (ibq_buf0_sel_hold_pick[6]  ),
   .ibq_buf0_sel_hold_pick_  (ibq_buf0_sel_hold_pick_[6]  ),

   .ibq_buf0_sel_buf1to7_pick (ibq_buf0_sel_buf1to7_pick[6]),
   .ibq_buf0_sel_buf1to7_pick_ (ibq_buf0_sel_buf1to7_pick_[6]),

   .ibq_buf1_sel_inst0 (ibq_buf1_sel_inst0[6] ),
   .ibq_buf1_sel_inst1 (ibq_buf1_sel_inst1[6] ),
   .ibq_buf1_sel_inst2 (ibq_buf1_sel_inst2[6] ),
   .ibq_buf1_sel_inst3 (ibq_buf1_sel_inst3[6] ),
   .ibq_buf1_sel_hold  (ibq_buf1_sel_hold[6]  ),

   .ibq_buf2_sel_inst0 (ibq_buf2_sel_inst0[6] ),
   .ibq_buf2_sel_inst1 (ibq_buf2_sel_inst1[6] ),
   .ibq_buf2_sel_inst2 (ibq_buf2_sel_inst2[6] ),
   .ibq_buf2_sel_inst3 (ibq_buf2_sel_inst3[6] ),
   .ibq_buf2_sel_hold  (ibq_buf2_sel_hold[6]  ),

   .ibq_buf3_sel_inst0 (ibq_buf3_sel_inst0[6] ),
   .ibq_buf3_sel_inst1 (ibq_buf3_sel_inst1[6] ),
   .ibq_buf3_sel_inst2 (ibq_buf3_sel_inst2[6] ),
   .ibq_buf3_sel_inst3 (ibq_buf3_sel_inst3[6] ),
   .ibq_buf3_sel_hold  (ibq_buf3_sel_hold[6]  ),

   .ibq_buf4_sel_inst0 (ibq_buf4_sel_inst0[6] ),
   .ibq_buf4_sel_inst1 (ibq_buf4_sel_inst1[6] ),
   .ibq_buf4_sel_inst2 (ibq_buf4_sel_inst2[6] ),
   .ibq_buf4_sel_inst3 (ibq_buf4_sel_inst3[6] ),
   .ibq_buf4_sel_hold  (ibq_buf4_sel_hold[6]  ),

   .ibq_buf5_sel_inst0 (ibq_buf5_sel_inst0[6] ),
   .ibq_buf5_sel_inst1 (ibq_buf5_sel_inst1[6] ),
   .ibq_buf5_sel_inst2 (ibq_buf5_sel_inst2[6] ),
   .ibq_buf5_sel_inst3 (ibq_buf5_sel_inst3[6] ),
   .ibq_buf5_sel_hold  (ibq_buf5_sel_hold[6]  ),

   .ibq_buf6_sel_inst0 (ibq_buf6_sel_inst0[6] ),
   .ibq_buf6_sel_inst1 (ibq_buf6_sel_inst1[6] ),
   .ibq_buf6_sel_inst2 (ibq_buf6_sel_inst2[6] ),
   .ibq_buf6_sel_inst3 (ibq_buf6_sel_inst3[6] ),
   .ibq_buf6_sel_hold  (ibq_buf6_sel_hold[6]  ),

   .ibq_buf7_sel_inst0 (ibq_buf7_sel_inst0[6] ),
   .ibq_buf7_sel_inst1 (ibq_buf7_sel_inst1[6] ),
   .ibq_buf7_sel_inst2 (ibq_buf7_sel_inst2[6] ),
   .ibq_buf7_sel_inst3 (ibq_buf7_sel_inst3[6] ),
   .ibq_buf7_sel_hold  (ibq_buf7_sel_hold[6]  ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .ftu_instr_sf_valid_c(ftu_instr_sf_valid_c),
  .lsu_ifu_ibu_pmen(lsu_ifu_ibu_pmen),
  .l15_ifu_valid(l15_ifu_valid),
  .ftu_exception_valid_c(ftu_exception_valid_c),
  .ftu_bus_0_is_first(ftu_bus_0_is_first),
  .ftu_bus_1_is_first(ftu_bus_1_is_first),
  .ftu_bus_2_is_first(ftu_bus_2_is_first),
  .ftu_bus_3_is_first(ftu_bus_3_is_first)) ;


ifu_ibu_ibq_ctl  ibq7(
   .scan_in(ibq7_scanin),
   .scan_out(ibq7_scanout),
   .l2clk(l2clk),
   
   .pku_flush_buffer0  (pku_flush_buffer0[7]     ),
   .pku_flush_upper_buffer (pku_flush_upper_buffer[7]    ),
   
   .ftu_fetch_thr_c    (ftu_fetch_thr_c[7]   ),
   .ftu_buffer_wr_en_f (ftu_buffer_wr_en_f[7] ),
   .pku_pick_p         (pku_pick_p[7]  ),

   .ftu_instr_valid_c   (ftu_instr_valid_c      ),
   .ftu_redirect_bf     (ftu_ibu_redirect_bf[7]  ),

   .ifu_buf0_valid_p   (ifu_buf0_valid_p[7]   ),
   .ifu_upper_buffer_valid_p   (ifu_upper_buffer_valid_p[7]   ),


   .ibu_empty          (ibu_empty[7]          ),
   .ibu_room_4ormore   (ibu_room_4ormore[7]   ),
   .ibq_buff_clken     (ibq_buff_clken[7] ),
   .ibq_ctl_clken      (ibq_ctl_clken[7] ),

   .ibq_buf0_sel_inst0_pick (ibq_buf0_sel_inst0_pick[7] ),
   .ibq_buf0_sel_inst1_pick (ibq_buf0_sel_inst1_pick[7] ),
   .ibq_buf0_sel_inst2_pick (ibq_buf0_sel_inst2_pick[7] ),
   .ibq_buf0_sel_inst3_pick (ibq_buf0_sel_inst3_pick[7] ),
   .ibq_buf0_sel_inst0_pick_ (ibq_buf0_sel_inst0_pick_[7] ),
   .ibq_buf0_sel_inst1_pick_ (ibq_buf0_sel_inst1_pick_[7] ),
   .ibq_buf0_sel_inst2_pick_ (ibq_buf0_sel_inst2_pick_[7] ),
   .ibq_buf0_sel_inst3_pick_ (ibq_buf0_sel_inst3_pick_[7] ),
   .ibq_buf0_sel_buf1  (ibq_buf0_sel_buf1[7]  ),
   .ibq_buf0_sel_buf2  (ibq_buf0_sel_buf2[7]  ),
   .ibq_buf0_sel_buf3  (ibq_buf0_sel_buf3[7]  ),
   .ibq_buf0_sel_buf4  (ibq_buf0_sel_buf4[7]  ),
   .ibq_buf0_sel_buf5  (ibq_buf0_sel_buf5[7]  ),
   .ibq_buf0_sel_buf6  (ibq_buf0_sel_buf6[7]  ),
   .ibq_buf0_sel_buf7  (ibq_buf0_sel_buf7[7]  ),
   .ibq_buf0_sel_hold_pick  (ibq_buf0_sel_hold_pick[7]  ),
   .ibq_buf0_sel_hold_pick_  (ibq_buf0_sel_hold_pick_[7]  ),

   .ibq_buf0_sel_buf1to7_pick (ibq_buf0_sel_buf1to7_pick[7]),
   .ibq_buf0_sel_buf1to7_pick_ (ibq_buf0_sel_buf1to7_pick_[7]),

   .ibq_buf1_sel_inst0 (ibq_buf1_sel_inst0[7] ),
   .ibq_buf1_sel_inst1 (ibq_buf1_sel_inst1[7] ),
   .ibq_buf1_sel_inst2 (ibq_buf1_sel_inst2[7] ),
   .ibq_buf1_sel_inst3 (ibq_buf1_sel_inst3[7] ),
   .ibq_buf1_sel_hold  (ibq_buf1_sel_hold[7]  ),

   .ibq_buf2_sel_inst0 (ibq_buf2_sel_inst0[7] ),
   .ibq_buf2_sel_inst1 (ibq_buf2_sel_inst1[7] ),
   .ibq_buf2_sel_inst2 (ibq_buf2_sel_inst2[7] ),
   .ibq_buf2_sel_inst3 (ibq_buf2_sel_inst3[7] ),
   .ibq_buf2_sel_hold  (ibq_buf2_sel_hold[7]  ),

   .ibq_buf3_sel_inst0 (ibq_buf3_sel_inst0[7] ),
   .ibq_buf3_sel_inst1 (ibq_buf3_sel_inst1[7] ),
   .ibq_buf3_sel_inst2 (ibq_buf3_sel_inst2[7] ),
   .ibq_buf3_sel_inst3 (ibq_buf3_sel_inst3[7] ),
   .ibq_buf3_sel_hold  (ibq_buf3_sel_hold[7]  ),

   .ibq_buf4_sel_inst0 (ibq_buf4_sel_inst0[7] ),
   .ibq_buf4_sel_inst1 (ibq_buf4_sel_inst1[7] ),
   .ibq_buf4_sel_inst2 (ibq_buf4_sel_inst2[7] ),
   .ibq_buf4_sel_inst3 (ibq_buf4_sel_inst3[7] ),
   .ibq_buf4_sel_hold  (ibq_buf4_sel_hold[7]  ),

   .ibq_buf5_sel_inst0 (ibq_buf5_sel_inst0[7] ),
   .ibq_buf5_sel_inst1 (ibq_buf5_sel_inst1[7] ),
   .ibq_buf5_sel_inst2 (ibq_buf5_sel_inst2[7] ),
   .ibq_buf5_sel_inst3 (ibq_buf5_sel_inst3[7] ),
   .ibq_buf5_sel_hold  (ibq_buf5_sel_hold[7]  ),

   .ibq_buf6_sel_inst0 (ibq_buf6_sel_inst0[7] ),
   .ibq_buf6_sel_inst1 (ibq_buf6_sel_inst1[7] ),
   .ibq_buf6_sel_inst2 (ibq_buf6_sel_inst2[7] ),
   .ibq_buf6_sel_inst3 (ibq_buf6_sel_inst3[7] ),
   .ibq_buf6_sel_hold  (ibq_buf6_sel_hold[7]  ),

   .ibq_buf7_sel_inst0 (ibq_buf7_sel_inst0[7] ),
   .ibq_buf7_sel_inst1 (ibq_buf7_sel_inst1[7] ),
   .ibq_buf7_sel_inst2 (ibq_buf7_sel_inst2[7] ),
   .ibq_buf7_sel_inst3 (ibq_buf7_sel_inst3[7] ),
   .ibq_buf7_sel_hold  (ibq_buf7_sel_hold[7]  ),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .ftu_instr_sf_valid_c(ftu_instr_sf_valid_c),
  .lsu_ifu_ibu_pmen(lsu_ifu_ibu_pmen),
  .l15_ifu_valid(l15_ifu_valid),
  .ftu_exception_valid_c(ftu_exception_valid_c),
  .ftu_bus_0_is_first(ftu_bus_0_is_first),
  .ftu_bus_1_is_first(ftu_bus_1_is_first),
  .ftu_bus_2_is_first(ftu_bus_2_is_first),
  .ftu_bus_3_is_first(ftu_bus_3_is_first)) ;


// fixscan start:
assign ibf0_scanin               = scan_in                  ;
assign ibf1_scanin               = ibf0_scanout             ;
assign ibf2_scanin               = ibf1_scanout             ;
assign ibf3_scanin               = ibf2_scanout             ;
assign ibf4_scanin               = ibf3_scanout             ;
assign ibf5_scanin               = ibf4_scanout             ;
assign ibf6_scanin               = ibf5_scanout             ;
assign ibf7_scanin               = ibf6_scanout             ;
assign ibq0_scanin               = ibf7_scanout             ;
assign ibq1_scanin               = ibq0_scanout             ;
assign ibq2_scanin               = ibq1_scanout             ;
assign ibq3_scanin               = ibq2_scanout             ;
assign ibq4_scanin               = ibq3_scanout             ;
assign ibq5_scanin               = ibq4_scanout             ;
assign ibq6_scanin               = ibq5_scanout             ;
assign ibq7_scanin               = ibq6_scanout             ;
assign scan_out                  = ibq7_scanout             ;
// fixscan end:
endmodule

