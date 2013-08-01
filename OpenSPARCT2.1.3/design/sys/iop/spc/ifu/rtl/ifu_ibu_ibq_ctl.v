// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_ibu_ibq_ctl.v
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
module ifu_ibu_ibq_ctl (
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  pku_flush_buffer0, 
  pku_flush_upper_buffer, 
  ftu_fetch_thr_c, 
  ftu_instr_sf_valid_c, 
  pku_pick_p, 
  lsu_ifu_ibu_pmen, 
  ftu_buffer_wr_en_f, 
  l15_ifu_valid, 
  ftu_redirect_bf, 
  ftu_exception_valid_c, 
  ftu_instr_valid_c, 
  ftu_bus_0_is_first, 
  ftu_bus_1_is_first, 
  ftu_bus_2_is_first, 
  ftu_bus_3_is_first, 
  ifu_buf0_valid_p, 
  ifu_upper_buffer_valid_p, 
  ibu_empty, 
  ibu_room_4ormore, 
  ibq_buff_clken, 
  ibq_ctl_clken, 
  ibq_buf0_sel_inst0_pick, 
  ibq_buf0_sel_inst0_pick_, 
  ibq_buf0_sel_inst1_pick, 
  ibq_buf0_sel_inst1_pick_, 
  ibq_buf0_sel_inst2_pick, 
  ibq_buf0_sel_inst2_pick_, 
  ibq_buf0_sel_inst3_pick, 
  ibq_buf0_sel_inst3_pick_, 
  ibq_buf0_sel_buf1, 
  ibq_buf0_sel_buf2, 
  ibq_buf0_sel_buf3, 
  ibq_buf0_sel_buf4, 
  ibq_buf0_sel_buf5, 
  ibq_buf0_sel_buf6, 
  ibq_buf0_sel_buf7, 
  ibq_buf0_sel_hold_pick, 
  ibq_buf0_sel_hold_pick_, 
  ibq_buf0_sel_buf1to7_pick, 
  ibq_buf0_sel_buf1to7_pick_, 
  ibq_buf1_sel_inst0, 
  ibq_buf1_sel_inst1, 
  ibq_buf1_sel_inst2, 
  ibq_buf1_sel_inst3, 
  ibq_buf1_sel_hold, 
  ibq_buf2_sel_inst0, 
  ibq_buf2_sel_inst1, 
  ibq_buf2_sel_inst2, 
  ibq_buf2_sel_inst3, 
  ibq_buf2_sel_hold, 
  ibq_buf3_sel_inst0, 
  ibq_buf3_sel_inst1, 
  ibq_buf3_sel_inst2, 
  ibq_buf3_sel_inst3, 
  ibq_buf3_sel_hold, 
  ibq_buf4_sel_inst0, 
  ibq_buf4_sel_inst1, 
  ibq_buf4_sel_inst2, 
  ibq_buf4_sel_inst3, 
  ibq_buf4_sel_hold, 
  ibq_buf5_sel_inst0, 
  ibq_buf5_sel_inst1, 
  ibq_buf5_sel_inst2, 
  ibq_buf5_sel_inst3, 
  ibq_buf5_sel_hold, 
  ibq_buf6_sel_inst0, 
  ibq_buf6_sel_inst1, 
  ibq_buf6_sel_inst2, 
  ibq_buf6_sel_inst3, 
  ibq_buf6_sel_hold, 
  ibq_buf7_sel_inst0, 
  ibq_buf7_sel_inst1, 
  ibq_buf7_sel_inst2, 
  ibq_buf7_sel_inst3, 
  ibq_buf7_sel_hold, 
  scan_out);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire l1clk;
wire l1clk_pm1;
wire ibq_buff_clken_in;
wire ifu_ibu_pmen_d;
wire buff_clken_reg_scanin;
wire buff_clken_reg_scanout;
wire pmen_reg_scanin;
wire pmen_reg_scanout;
wire buf7to1_empty;
wire [7:1] curr_ip;
wire [7:1] buf_valid_p;
wire buf0_sel_hold_;
wire [7:1] nxt_fp;
wire ibq_buf1_sel_lsb;
wire ibq_buf2_sel_lsb;
wire ibq_buf3_sel_lsb;
wire ibq_buf4_sel_lsb;
wire ibq_buf5_sel_lsb;
wire ibq_buf6_sel_lsb;
wire ibq_buf7_sel_lsb;
wire buf1_val_inst0;
wire buf2_val_inst0;
wire buf3_val_inst0;
wire buf4_val_inst0;
wire buf5_val_inst0;
wire buf6_val_inst0;
wire buf7_val_inst0;
wire buf1_val_inst1;
wire buf2_val_inst1;
wire buf3_val_inst1;
wire buf4_val_inst1;
wire buf5_val_inst1;
wire buf6_val_inst1;
wire buf7_val_inst1;
wire buf1_val_inst2;
wire buf2_val_inst2;
wire buf3_val_inst2;
wire buf4_val_inst2;
wire buf5_val_inst2;
wire buf6_val_inst2;
wire buf7_val_inst2;
wire buf1_val_inst3;
wire buf2_val_inst3;
wire buf3_val_inst3;
wire buf4_val_inst3;
wire buf5_val_inst3;
wire buf6_val_inst3;
wire buf7_val_inst3;
wire buf1_val_hold;
wire buf2_val_hold;
wire buf3_val_hold;
wire buf4_val_hold;
wire buf5_val_hold;
wire buf6_val_hold;
wire buf7_val_hold;
wire ibq_buf1_sel_n_lsb;
wire ibq_buf2_sel_n_lsb;
wire ibq_buf3_sel_n_lsb;
wire ibq_buf4_sel_n_lsb;
wire ibq_buf5_sel_n_lsb;
wire ibq_buf6_sel_n_lsb;
wire ibq_buf7_sel_n_lsb;
wire instr_sf_valid_except_c;
wire fetch_sig_reg_scanin;
wire fetch_sig_reg_scanout;
wire any_instr_valid;
wire instr_sf_valid_except_p;
wire fetch_thr_p;
wire any_instr_valid_p;
wire bus_0_is_first_p;
wire bus_1_is_first_p;
wire instr_sf_valid_except_p_ff;
wire bus_2_is_first_p;
wire bus_3_is_first_p;
wire flush_upper_buffer_ff;
wire redirect_p;
wire [3:0] instr_valid_p;
wire sel_no_shift;
wire reset_fp_to_one;
wire sel_shift_left_by_one;
wire sel_shift_left_by_two;
wire sel_shift_left_by_three;
wire sel_shift_left_by_four;
wire [7:1] cur_fp;
wire cur_fp_7to2_scanin;
wire cur_fp_7to2_scanout;
wire [7:1] cur_fpq;
wire [1:1] nxt_fpd;
wire cur_fp_1_scanin;
wire cur_fp_1_scanout;
wire no_shift_ip;
wire shift_left_one_ip;
wire fp_plus_1_to_ip;
wire fp_to_ip;
wire [7:1] next_ip;
wire next_ip_7to2_scanin;
wire next_ip_7to2_scanout;
wire [7:1] curr_ipq;
wire [2:2] next_ipd;
wire next_ip_1_scanin;
wire next_ip_1_scanout;
wire [7:0] buf_valid_in;
wire [7:0] buf_valid_din;
wire valid_outpk_7to1_scanin;
wire valid_outpk_7to1_scanout;
wire true_buf0_valid_p;
wire valid_outpk_buf0_scanin;
wire valid_outpk_buf0_scanout;
wire spares_scanin;
wire spares_scanout;
wire se;


input tcu_scan_en ;
   input         l2clk;

   input 	 scan_in;
   input 	 tcu_pce_ov;			// scan signals
   input 	 spc_aclk;
   input 	 spc_bclk;

   input         pku_flush_buffer0; 		// flush buf0 only
   input         pku_flush_upper_buffer;	// flush buf1-7 only

   input         ftu_fetch_thr_c;		// enables fetch
   input         ftu_instr_sf_valid_c;          // Single instr fetch. Valid only during fetch not by_pass.
   input         pku_pick_p;			// instruction issue/pick indicator

   input         lsu_ifu_ibu_pmen;              // enable power management.
   input         ftu_buffer_wr_en_f;            // Buffer clock enables (Normal fetch)
   input         l15_ifu_valid;                 // 
   input         ftu_redirect_bf;               // The thread is redirected.
   input         ftu_exception_valid_c ;  

   input [3:0]   ftu_instr_valid_c;
   input         ftu_bus_0_is_first ;           // bus 0 contains first instr
   input         ftu_bus_1_is_first ;           // bus 1 contains first instr
   input         ftu_bus_2_is_first ;           // bus 2 contains first instr
   input         ftu_bus_3_is_first ;           // bus 3 contains first instr

   output        ifu_buf0_valid_p   ;		// buf0 valid
   output        ifu_upper_buffer_valid_p;	// at least one of buf1-7 valid


   output        ibu_empty          ;		// buf0-7 empty
   output        ibu_room_4ormore   ;		// at least 4 empty buffers

   output        ibq_buff_clken     ;
   output        ibq_ctl_clken      ;

   output        ibq_buf0_sel_inst0_pick ;
   output        ibq_buf0_sel_inst0_pick_ ;
   output        ibq_buf0_sel_inst1_pick ;
   output        ibq_buf0_sel_inst1_pick_ ;
   output        ibq_buf0_sel_inst2_pick ;
   output        ibq_buf0_sel_inst2_pick_ ;
   output        ibq_buf0_sel_inst3_pick ;
   output        ibq_buf0_sel_inst3_pick_ ;
   output        ibq_buf0_sel_buf1  ;
   output        ibq_buf0_sel_buf2  ;
   output        ibq_buf0_sel_buf3  ;
   output        ibq_buf0_sel_buf4  ;
   output        ibq_buf0_sel_buf5  ;
   output        ibq_buf0_sel_buf6  ;
   output        ibq_buf0_sel_buf7  ;
   output        ibq_buf0_sel_hold_pick  ;
   output        ibq_buf0_sel_hold_pick_  ;

   output        ibq_buf0_sel_buf1to7_pick;
   output        ibq_buf0_sel_buf1to7_pick_;
   
   output        ibq_buf1_sel_inst0 ;
   output        ibq_buf1_sel_inst1 ;
   output        ibq_buf1_sel_inst2 ;
   output        ibq_buf1_sel_inst3 ;
   output        ibq_buf1_sel_hold  ;
        
   output        ibq_buf2_sel_inst0 ;
   output        ibq_buf2_sel_inst1 ;
   output        ibq_buf2_sel_inst2 ;
   output        ibq_buf2_sel_inst3 ;
   output        ibq_buf2_sel_hold  ;
        
   output        ibq_buf3_sel_inst0 ;
   output        ibq_buf3_sel_inst1 ;
   output        ibq_buf3_sel_inst2 ;
   output        ibq_buf3_sel_inst3 ;
   output        ibq_buf3_sel_hold  ;
        
   output        ibq_buf4_sel_inst0 ;
   output        ibq_buf4_sel_inst1 ;
   output        ibq_buf4_sel_inst2 ;
   output        ibq_buf4_sel_inst3 ;
   output        ibq_buf4_sel_hold  ;
        
   output        ibq_buf5_sel_inst0 ;
   output        ibq_buf5_sel_inst1 ;
   output        ibq_buf5_sel_inst2 ;
   output        ibq_buf5_sel_inst3 ;
   output        ibq_buf5_sel_hold  ;
   
   output        ibq_buf6_sel_inst0 ;
   output        ibq_buf6_sel_inst1 ;
   output        ibq_buf6_sel_inst2 ;
   output        ibq_buf6_sel_inst3 ;
   output        ibq_buf6_sel_hold  ;
   
   output        ibq_buf7_sel_inst0 ;
   output        ibq_buf7_sel_inst1 ;
   output        ibq_buf7_sel_inst2 ;
   output        ibq_buf7_sel_inst3 ;
   output        ibq_buf7_sel_hold  ;

   output 	 scan_out;

// renames
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = spc_aclk;
assign soclk = spc_bclk;

////////////////////////////////////////////////////////////
// cur_fp[7:1] is one hot vector showing where the
// first instruction should be written.            
// cur_fp[7:1] = 8'b00000010 means the current location  
// to write to is buf2. 
// 
// Assumptions:
// if pku_pick_p, it implies:
//   There is at least one valid inst in buf0-7.
//
// At start up:
//   curr_ip = 7'b0000010
//   cur_fp  = 7'b0000001
//   ibu_empty = 1;
//   buf7to1_empty = 1;            <--local signal
//   buf_valid_p[7:0] = 8'b0; <--local except bit 0
////////////////////////////////////////////////////////////
  
ifu_ibu_ibq_ctl_l1clkhdr_ctl_macro clkgen (
 .l2clk(l2clk),
 .l1en (1'b1 ),
 .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

ifu_ibu_ibq_ctl_l1clkhdr_ctl_macro clkgen_pm (
 .l2clk(l2clk),
 .l1en (ibq_ctl_clken ),
 .l1clk(l1clk_pm1),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

assign ibq_buff_clken_in =    ( ftu_buffer_wr_en_f  |  l15_ifu_valid | ~ifu_ibu_pmen_d);           
assign ibq_ctl_clken     =    1'b1 ; 


ifu_ibu_ibq_ctl_msff_ctl_macro__width_1 buff_clken_reg (
    .scan_in(buff_clken_reg_scanin),
    .scan_out(buff_clken_reg_scanout),
    .l1clk(l1clk),
    .din  (ibq_buff_clken_in),
    .dout (ibq_buff_clken),
  .siclk(siclk),
  .soclk(soclk));

ifu_ibu_ibq_ctl_msff_ctl_macro__width_1 pmen_reg (
    .scan_in(pmen_reg_scanin),
    .scan_out(pmen_reg_scanout),
    .l1clk(l1clk),
    .din  (lsu_ifu_ibu_pmen),
    .dout (ifu_ibu_pmen_d),
  .siclk(siclk),
  .soclk(soclk));


// choose which instr to put in a particular buffer.
/////////////////////////////////////////////////////
// Thread 0 , buffer 0 selects                     //
/////////////////////////////////////////////////////

///////////////////////////////////////////////////////// 
// cases where buf0 gets inst0 directly:
// if inst0 is valid and all buffers are empty.
/////////////////////////////////////////////////////////
// treat (flush_buffer0 & ~flush_upper_buffer) as a pick when upper buffers are not empty 
// IB may think it is empty when fetch and pick are done at the same time.


// for the 1st level buf0 mux in dp: buf0_sel_inst0 if not taking from buf1-7.
// each ibq_buf0_sel_bufx = curr_ip[x] & buf_valid_p[x];
//

assign ibq_buf0_sel_inst0_pick_ = ((ibu_empty | pku_flush_buffer0) & buf7to1_empty) &  ftu_bus_0_is_first;
assign ibq_buf0_sel_inst0_pick  =   buf7to1_empty &  ftu_bus_0_is_first;
assign ibq_buf0_sel_inst1_pick_ = ((ibu_empty | pku_flush_buffer0) & buf7to1_empty) &  ftu_bus_1_is_first;
assign ibq_buf0_sel_inst1_pick  =   buf7to1_empty &  ftu_bus_1_is_first;
assign ibq_buf0_sel_inst2_pick_ = ((ibu_empty | pku_flush_buffer0) & buf7to1_empty) &  ftu_bus_2_is_first;
assign ibq_buf0_sel_inst2_pick  =   buf7to1_empty &  ftu_bus_2_is_first;
assign ibq_buf0_sel_inst3_pick_ = ((ibu_empty | pku_flush_buffer0) & buf7to1_empty) &  ftu_bus_3_is_first;
assign ibq_buf0_sel_inst3_pick  =   buf7to1_empty &  ftu_bus_3_is_first;

assign ibq_buf0_sel_buf1to7_pick_ = (ibq_buf0_sel_buf1 | ibq_buf0_sel_buf2 | ibq_buf0_sel_buf3 | ibq_buf0_sel_buf4 | ibq_buf0_sel_buf5 |
                              ibq_buf0_sel_buf6 | ibq_buf0_sel_buf7) &  pku_flush_buffer0 ;
                            
assign ibq_buf0_sel_buf1to7_pick  = (ibq_buf0_sel_buf1 | ibq_buf0_sel_buf2 | ibq_buf0_sel_buf3 | ibq_buf0_sel_buf4 | ibq_buf0_sel_buf5 |
                              ibq_buf0_sel_buf6 | ibq_buf0_sel_buf7)  ;
                            
                            
///////////////////////////////////////////////////////// 
// cases where buf0 gets inst from buf1-7:
// a) curr_ip points at buf1-7 and that inst is valid
///////////////////////////////////////////////////////// 

//can do concurrent pick and flush (but no refill of buf0)

assign ibq_buf0_sel_buf1 = curr_ip[1] & buf_valid_p[1];
assign ibq_buf0_sel_buf2 = curr_ip[2] & buf_valid_p[2];
assign ibq_buf0_sel_buf3 = curr_ip[3] & buf_valid_p[3];
assign ibq_buf0_sel_buf4 = curr_ip[4] & buf_valid_p[4];
assign ibq_buf0_sel_buf5 = curr_ip[5] & buf_valid_p[5]; 
assign ibq_buf0_sel_buf6 = curr_ip[6] & buf_valid_p[6]; 
assign ibq_buf0_sel_buf7 = curr_ip[7] & buf_valid_p[7];

///////////////////////////////////////////////////////// 
// the output from the 1st level buf0 mux in dp can make it to the end if:
// a). pku_pick_p = 1 and flush_upper_buffer = 0 OR          (issue)
// b). pku_flush_buffer0 = 1 and flush_upper_buffer = 0 OR   (issue equivalent)
// c). ibu_empty = 1 and ftu_fetch_thr_c = 1 and ftu_instr_valid_c[0] = 1 
//     (and buf7to1_empty = 1)                                (fetch)
//
// the output should be held if:
// a). pku_pick_p = 0 and pku_flush_buffer0 = 0 AND  (no issue)
// b). ftu_instr_valid_c[0] = 0                      (no fetch)
///////////////////////////////////////////////////////// 

// assign buf0_sel_hold_ = pku_flush_buffer0 | (ftu_fetch_thr_c & (ftu_instr_valid_c[0] | ftu_instr_valid_c[1] | 
//                                ftu_instr_valid_c[2] | ftu_instr_valid_c[3]) &  ibu_empty & buf7to1_empty);

assign buf0_sel_hold_     = pku_flush_buffer0 | (ibu_empty & buf7to1_empty);
assign ibq_buf0_sel_hold_pick_  = ~(buf0_sel_hold_ );
assign ibq_buf0_sel_hold_pick   = 1'b0 ;
/////////////////////////////////////////////////////
// Thread 0 , buffer 1-7 selects                     
// Buf1-7 will fetch as usual while flush_upper_buffer is on, but the valid bits will be off.
/////////////////////////////////////////////////////
 
///////////////////////////////////////////////////////// 
// Example using buf1:
// buf1 gets inst0: 
// - cur_fp[1], fetch & inst0 valid (inst_vld_0 & addr_x00)
// - cur_fp[7], fetch & inst0 valid (inst_vld_3 & addr_011)
// - cur_fp[6], fetch & inst0 valid (inst_vld_2 & addr_010)
// - cur_fp[5], fetch & inst0 valid (inst_vld_1 & addr_001)
//   
// buf1 gets inst1: 
// - cur_fp[7], fetch & inst0 valid (inst_vld_0 & addr_x00)
// - cur_fp[6], fetch & inst0 valid (inst_vld_3 & addr_011)
// - cur_fp[5], fetch & inst0 valid (inst_vld_2 & addr_010)
// - cur_fp[1], fetch & inst0 valid (inst_vld_1 & addr_001)
//
// buf1 gets inst2:
// - cur_fp[6], fetch & inst0 valid (inst_vld_0 & addr_x00)
// - cur_fp[7], fetch & inst0 valid (inst_vld_3 & addr_011)
// - cur_fp[1], fetch & inst0 valid (inst_vld_2 & addr_010)
// - cur_fp[5], fetch & inst0 valid (inst_vld_1 & addr_001)
//
// buf1 gets inst3:
// - cur_fp[5], fetch & inst0 valid (inst_vld_0 & addr_x00)
// - cur_fp[6], fetch & inst0 valid (inst_vld_3 & addr_011)
// - cur_fp[7], fetch & inst0 valid (inst_vld_2 & addr_010)
// - cur_fp[1], fetch & inst0 valid (inst_vld_1 & addr_001)
//
///////////////////////////////////////////////////////// 



//////////////////////////////////////////////////////////////
// Bus 0 selects
//////////////////////////////////////////////////////////////
assign ibq_buf1_sel_inst0 = ((nxt_fp[1] & ftu_bus_0_is_first)|
                             (nxt_fp[5] & ftu_bus_1_is_first)|
                             (nxt_fp[6] & ftu_bus_2_is_first)|
                             (nxt_fp[7] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf2_sel_inst0 = ((nxt_fp[2] & ftu_bus_0_is_first)|
                             (nxt_fp[6] & ftu_bus_1_is_first)|
                             (nxt_fp[7] & ftu_bus_2_is_first)|
                             (nxt_fp[1] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf3_sel_inst0 = ((nxt_fp[3] & ftu_bus_0_is_first)|
                             (nxt_fp[7] & ftu_bus_1_is_first)|
                             (nxt_fp[1] & ftu_bus_2_is_first)|
                             (nxt_fp[2] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf4_sel_inst0 = ((nxt_fp[4] & ftu_bus_0_is_first)|
                             (nxt_fp[1] & ftu_bus_1_is_first)|
                             (nxt_fp[2] & ftu_bus_2_is_first)|
                             (nxt_fp[3] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf5_sel_inst0 = ((nxt_fp[5] & ftu_bus_0_is_first)|
                             (nxt_fp[2] & ftu_bus_1_is_first)|
                             (nxt_fp[3] & ftu_bus_2_is_first)|
                             (nxt_fp[4] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf6_sel_inst0 = ((nxt_fp[6] & ftu_bus_0_is_first)|
                             (nxt_fp[3] & ftu_bus_1_is_first)|
                             (nxt_fp[4] & ftu_bus_2_is_first)|
                             (nxt_fp[5] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf7_sel_inst0 = ((nxt_fp[7] & ftu_bus_0_is_first)|
                             (nxt_fp[4] & ftu_bus_1_is_first)|
                             (nxt_fp[5] & ftu_bus_2_is_first)|
                             (nxt_fp[6] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

//////////////////////////////////////////////////////////////
// Bus 1 selects
//////////////////////////////////////////////////////////////
assign ibq_buf1_sel_inst1 = ((nxt_fp[7] & ftu_bus_0_is_first)|
                             (nxt_fp[1] & ftu_bus_1_is_first)|
                             (nxt_fp[5] & ftu_bus_2_is_first)|
                             (nxt_fp[6] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf2_sel_inst1 = ((nxt_fp[1] & ftu_bus_0_is_first)|
                             (nxt_fp[2] & ftu_bus_1_is_first)|
                             (nxt_fp[6] & ftu_bus_2_is_first)|
                             (nxt_fp[7] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf3_sel_inst1 = ((nxt_fp[2] & ftu_bus_0_is_first)|
                             (nxt_fp[3] & ftu_bus_1_is_first)|
                             (nxt_fp[7] & ftu_bus_2_is_first)|
                             (nxt_fp[1] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf4_sel_inst1 = ((nxt_fp[3] & ftu_bus_0_is_first)|
                             (nxt_fp[4] & ftu_bus_1_is_first)|
                             (nxt_fp[1] & ftu_bus_2_is_first)|
                             (nxt_fp[2] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf5_sel_inst1 = ((nxt_fp[4] & ftu_bus_0_is_first)|
                             (nxt_fp[5] & ftu_bus_1_is_first)|
                             (nxt_fp[2] & ftu_bus_2_is_first)|
                             (nxt_fp[3] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf6_sel_inst1 = ((nxt_fp[5] & ftu_bus_0_is_first)|
                             (nxt_fp[6] & ftu_bus_1_is_first)|
                             (nxt_fp[3] & ftu_bus_2_is_first)|
                             (nxt_fp[4] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf7_sel_inst1 = ((nxt_fp[6] & ftu_bus_0_is_first)|
                             (nxt_fp[7] & ftu_bus_1_is_first)|
                             (nxt_fp[4] & ftu_bus_2_is_first)|
                             (nxt_fp[5] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

//////////////////////////////////////////////////////////////
// Bus 2 selects
//////////////////////////////////////////////////////////////
assign ibq_buf1_sel_inst2 = ((nxt_fp[6] & ftu_bus_0_is_first)|
                             (nxt_fp[7] & ftu_bus_1_is_first)|
                             (nxt_fp[1] & ftu_bus_2_is_first)|
                             (nxt_fp[5] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf2_sel_inst2 = ((nxt_fp[7] & ftu_bus_0_is_first)|
                             (nxt_fp[1] & ftu_bus_1_is_first)|
                             (nxt_fp[2] & ftu_bus_2_is_first)|
                             (nxt_fp[6] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf3_sel_inst2 = ((nxt_fp[1] & ftu_bus_0_is_first)|
                             (nxt_fp[2] & ftu_bus_1_is_first)|
                             (nxt_fp[3] & ftu_bus_2_is_first)|
                             (nxt_fp[7] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf4_sel_inst2 = ((nxt_fp[2] & ftu_bus_0_is_first)|
                             (nxt_fp[3] & ftu_bus_1_is_first)|
                             (nxt_fp[4] & ftu_bus_2_is_first)|
                             (nxt_fp[1] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf5_sel_inst2 = ((nxt_fp[3] & ftu_bus_0_is_first)|
                             (nxt_fp[4] & ftu_bus_1_is_first)|
                             (nxt_fp[5] & ftu_bus_2_is_first)|
                             (nxt_fp[2] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf6_sel_inst2 = ((nxt_fp[4] & ftu_bus_0_is_first)|
                             (nxt_fp[5] & ftu_bus_1_is_first)|
                             (nxt_fp[6] & ftu_bus_2_is_first)|
                             (nxt_fp[3] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf7_sel_inst2 = ((nxt_fp[5] & ftu_bus_0_is_first)|
                             (nxt_fp[6] & ftu_bus_1_is_first)|
                             (nxt_fp[7] & ftu_bus_2_is_first)|
                             (nxt_fp[4] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

//////////////////////////////////////////////////////////////
// Bus 3 selects
//////////////////////////////////////////////////////////////
assign ibq_buf1_sel_inst3 = ((nxt_fp[5] & ftu_bus_0_is_first)|
                             (nxt_fp[6] & ftu_bus_1_is_first)|
                             (nxt_fp[7] & ftu_bus_2_is_first)|
                             (nxt_fp[1] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf2_sel_inst3 = ((nxt_fp[6] & ftu_bus_0_is_first)|
                             (nxt_fp[7] & ftu_bus_1_is_first)|
                             (nxt_fp[1] & ftu_bus_2_is_first)|
                             (nxt_fp[2] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf3_sel_inst3 = ((nxt_fp[7] & ftu_bus_0_is_first)|
                             (nxt_fp[1] & ftu_bus_1_is_first)|
                             (nxt_fp[2] & ftu_bus_2_is_first)|
                             (nxt_fp[3] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf4_sel_inst3 = ((nxt_fp[1] & ftu_bus_0_is_first)|
                             (nxt_fp[2] & ftu_bus_1_is_first)|
                             (nxt_fp[3] & ftu_bus_2_is_first)|
                             (nxt_fp[4] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf5_sel_inst3 = ((nxt_fp[2] & ftu_bus_0_is_first)|
                             (nxt_fp[3] & ftu_bus_1_is_first)|
                             (nxt_fp[4] & ftu_bus_2_is_first)|
                             (nxt_fp[5] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf6_sel_inst3 = ((nxt_fp[3] & ftu_bus_0_is_first)|
                             (nxt_fp[4] & ftu_bus_1_is_first)|
                             (nxt_fp[5] & ftu_bus_2_is_first)|
                             (nxt_fp[6] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf7_sel_inst3 = ((nxt_fp[4] & ftu_bus_0_is_first)|
                             (nxt_fp[5] & ftu_bus_1_is_first)|
                             (nxt_fp[6] & ftu_bus_2_is_first)|
                             (nxt_fp[7] & ftu_bus_3_is_first)) &  ftu_fetch_thr_c & ibu_room_4ormore;

assign ibq_buf1_sel_hold = ~(ibq_buf1_sel_inst0 | ibq_buf1_sel_inst1 | ibq_buf1_sel_inst2 | ibq_buf1_sel_inst3);
assign ibq_buf2_sel_hold = ~(ibq_buf2_sel_inst0 | ibq_buf2_sel_inst1 | ibq_buf2_sel_inst2 | ibq_buf2_sel_inst3);
assign ibq_buf3_sel_hold = ~(ibq_buf3_sel_inst0 | ibq_buf3_sel_inst1 | ibq_buf3_sel_inst2 | ibq_buf3_sel_inst3);
assign ibq_buf4_sel_hold = ~(ibq_buf4_sel_inst0 | ibq_buf4_sel_inst1 | ibq_buf4_sel_inst2 | ibq_buf4_sel_inst3);
assign ibq_buf5_sel_hold = ~(ibq_buf5_sel_inst0 | ibq_buf5_sel_inst1 | ibq_buf5_sel_inst2 | ibq_buf5_sel_inst3);
assign ibq_buf6_sel_hold = ~(ibq_buf6_sel_inst0 | ibq_buf6_sel_inst1 | ibq_buf6_sel_inst2 | ibq_buf6_sel_inst3);
assign ibq_buf7_sel_hold = ~(ibq_buf7_sel_inst0 | ibq_buf7_sel_inst1 | ibq_buf7_sel_inst2 | ibq_buf7_sel_inst3);


// prepare for the pointer shifting

assign ibq_buf1_sel_lsb   = ftu_fetch_thr_c &   ~ftu_redirect_bf & ((nxt_fp[1]    &  ftu_bus_0_is_first  & ftu_instr_valid_c[0])  | 
                                                 (nxt_fp[1] & ftu_bus_1_is_first  & ftu_instr_valid_c[1])  | 		      
				 	         (nxt_fp[1] & ftu_bus_2_is_first  & ftu_instr_valid_c[2])  |      
                                                 (nxt_fp[1] & ftu_bus_3_is_first  & ftu_instr_valid_c[3]));

assign ibq_buf2_sel_lsb   = ftu_fetch_thr_c &   ~ftu_redirect_bf & ((nxt_fp[2] & ftu_bus_0_is_first & ftu_instr_valid_c[0]) | 
                                                 (nxt_fp[2] & ftu_bus_1_is_first & ftu_instr_valid_c[1]) | 		      
				 	         (nxt_fp[2] & ftu_bus_2_is_first & ftu_instr_valid_c[2]) |      
                                                 (nxt_fp[2] & ftu_bus_3_is_first & ftu_instr_valid_c[3]));

assign ibq_buf3_sel_lsb   = ftu_fetch_thr_c &   ~ftu_redirect_bf & ((nxt_fp[3] & ftu_bus_0_is_first & ftu_instr_valid_c[0]) | 
                                                 (nxt_fp[3] & ftu_bus_1_is_first & ftu_instr_valid_c[1]) | 		      
				 	         (nxt_fp[3] & ftu_bus_2_is_first & ftu_instr_valid_c[2]) |      
                                                 (nxt_fp[3] & ftu_bus_3_is_first & ftu_instr_valid_c[3]));

assign ibq_buf4_sel_lsb   = ftu_fetch_thr_c &   ~ftu_redirect_bf & ((nxt_fp[4] & ftu_bus_0_is_first & ftu_instr_valid_c[0]) | 
                                                 (nxt_fp[4] & ftu_bus_1_is_first & ftu_instr_valid_c[1]) | 		      
				 	         (nxt_fp[4] & ftu_bus_2_is_first & ftu_instr_valid_c[2]) |      
                                                 (nxt_fp[4] & ftu_bus_3_is_first & ftu_instr_valid_c[3]));

assign ibq_buf5_sel_lsb   = ftu_fetch_thr_c &   ~ftu_redirect_bf & ((nxt_fp[5] & ftu_bus_0_is_first & ftu_instr_valid_c[0]) | 
                                                 (nxt_fp[5] & ftu_bus_1_is_first & ftu_instr_valid_c[1]) | 		      
				 	         (nxt_fp[5] & ftu_bus_2_is_first & ftu_instr_valid_c[2]) |      
                                                 (nxt_fp[5] & ftu_bus_3_is_first & ftu_instr_valid_c[3]));

assign ibq_buf6_sel_lsb   = ftu_fetch_thr_c &   ~ftu_redirect_bf & ((nxt_fp[6] & ftu_bus_0_is_first & ftu_instr_valid_c[0]) | 
                                                 (nxt_fp[6] & ftu_bus_1_is_first & ftu_instr_valid_c[1]) | 		      
				 	         (nxt_fp[6] & ftu_bus_2_is_first & ftu_instr_valid_c[2]) |      
                                                 (nxt_fp[6] & ftu_bus_3_is_first & ftu_instr_valid_c[3]));

assign ibq_buf7_sel_lsb   = ftu_fetch_thr_c &   ~ftu_redirect_bf & ((nxt_fp[7] & ftu_bus_0_is_first & ftu_instr_valid_c[0]) | 
                                                 (nxt_fp[7] & ftu_bus_1_is_first & ftu_instr_valid_c[1]) | 		      
				 	         (nxt_fp[7] & ftu_bus_2_is_first & ftu_instr_valid_c[2]) |      
                                                 (nxt_fp[7] & ftu_bus_3_is_first & ftu_instr_valid_c[3]));

//////////////////////////////////////////////////////////////
// Bus 0 selects
//////////////////////////////////////////////////////////////
assign buf1_val_inst0 =    ((nxt_fp[1] & ftu_bus_0_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[5] & ftu_bus_1_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[6] & ftu_bus_2_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[7] & ftu_bus_3_is_first & ftu_instr_valid_c[0])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf2_val_inst0 =    ((nxt_fp[2] & ftu_bus_0_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[6] & ftu_bus_1_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[7] & ftu_bus_2_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[1] & ftu_bus_3_is_first & ftu_instr_valid_c[0])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf3_val_inst0 =    ((nxt_fp[3] & ftu_bus_0_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[7] & ftu_bus_1_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[1] & ftu_bus_2_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[2] & ftu_bus_3_is_first & ftu_instr_valid_c[0])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf4_val_inst0 =    ((nxt_fp[4] & ftu_bus_0_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[1] & ftu_bus_1_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[2] & ftu_bus_2_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[3] & ftu_bus_3_is_first & ftu_instr_valid_c[0])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf5_val_inst0 =    ((nxt_fp[5] & ftu_bus_0_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[2] & ftu_bus_1_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[3] & ftu_bus_2_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[4] & ftu_bus_3_is_first & ftu_instr_valid_c[0])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf6_val_inst0 =    ((nxt_fp[6] & ftu_bus_0_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[3] & ftu_bus_1_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[4] & ftu_bus_2_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[5] & ftu_bus_3_is_first & ftu_instr_valid_c[0])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf7_val_inst0 =    ((nxt_fp[7] & ftu_bus_0_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[4] & ftu_bus_1_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[5] & ftu_bus_2_is_first & ftu_instr_valid_c[0])|
                            (nxt_fp[6] & ftu_bus_3_is_first & ftu_instr_valid_c[0])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

//////////////////////////////////////////////////////////////
// Bus 1 selects
//////////////////////////////////////////////////////////////
assign buf1_val_inst1 =    ((nxt_fp[7] & ftu_bus_0_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[1] & ftu_bus_1_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[5] & ftu_bus_2_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[6] & ftu_bus_3_is_first & ftu_instr_valid_c[1])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf2_val_inst1 =    ((nxt_fp[1] & ftu_bus_0_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[2] & ftu_bus_1_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[6] & ftu_bus_2_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[7] & ftu_bus_3_is_first & ftu_instr_valid_c[1])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf3_val_inst1 =    ((nxt_fp[2] & ftu_bus_0_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[3] & ftu_bus_1_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[7] & ftu_bus_2_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[1] & ftu_bus_3_is_first & ftu_instr_valid_c[1])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf4_val_inst1 =    ((nxt_fp[3] & ftu_bus_0_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[4] & ftu_bus_1_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[1] & ftu_bus_2_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[2] & ftu_bus_3_is_first & ftu_instr_valid_c[1])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf5_val_inst1 =    ((nxt_fp[4] & ftu_bus_0_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[5] & ftu_bus_1_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[2] & ftu_bus_2_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[3] & ftu_bus_3_is_first & ftu_instr_valid_c[1])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf6_val_inst1 =    ((nxt_fp[5] & ftu_bus_0_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[6] & ftu_bus_1_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[3] & ftu_bus_2_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[4] & ftu_bus_3_is_first & ftu_instr_valid_c[1])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf7_val_inst1 =    ((nxt_fp[6] & ftu_bus_0_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[7] & ftu_bus_1_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[4] & ftu_bus_2_is_first & ftu_instr_valid_c[1])|
                            (nxt_fp[5] & ftu_bus_3_is_first & ftu_instr_valid_c[1])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

//////////////////////////////////////////////////////////////
// Bus 2 selects
//////////////////////////////////////////////////////////////
assign buf1_val_inst2 =    ((nxt_fp[6] & ftu_bus_0_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[7] & ftu_bus_1_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[1] & ftu_bus_2_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[5] & ftu_bus_3_is_first & ftu_instr_valid_c[2])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf2_val_inst2 =    ((nxt_fp[7] & ftu_bus_0_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[1] & ftu_bus_1_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[2] & ftu_bus_2_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[6] & ftu_bus_3_is_first & ftu_instr_valid_c[2])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf3_val_inst2 =    ((nxt_fp[1] & ftu_bus_0_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[2] & ftu_bus_1_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[3] & ftu_bus_2_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[7] & ftu_bus_3_is_first & ftu_instr_valid_c[2])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf4_val_inst2 =    ((nxt_fp[2] & ftu_bus_0_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[3] & ftu_bus_1_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[4] & ftu_bus_2_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[1] & ftu_bus_3_is_first & ftu_instr_valid_c[2])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf5_val_inst2 =    ((nxt_fp[3] & ftu_bus_0_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[4] & ftu_bus_1_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[5] & ftu_bus_2_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[2] & ftu_bus_3_is_first & ftu_instr_valid_c[2])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf6_val_inst2 =    ((nxt_fp[4] & ftu_bus_0_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[5] & ftu_bus_1_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[6] & ftu_bus_2_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[3] & ftu_bus_3_is_first & ftu_instr_valid_c[2])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf7_val_inst2 =    ((nxt_fp[5] & ftu_bus_0_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[6] & ftu_bus_1_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[7] & ftu_bus_2_is_first & ftu_instr_valid_c[2])|
                            (nxt_fp[4] & ftu_bus_3_is_first & ftu_instr_valid_c[2])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

//////////////////////////////////////////////////////////////
// Bus 3 selects
//////////////////////////////////////////////////////////////
assign buf1_val_inst3 =    ((nxt_fp[5] & ftu_bus_0_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[6] & ftu_bus_1_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[7] & ftu_bus_2_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[1] & ftu_bus_3_is_first & ftu_instr_valid_c[3])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf2_val_inst3 =    ((nxt_fp[6] & ftu_bus_0_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[7] & ftu_bus_1_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[1] & ftu_bus_2_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[2] & ftu_bus_3_is_first & ftu_instr_valid_c[3])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf3_val_inst3 =    ((nxt_fp[7] & ftu_bus_0_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[1] & ftu_bus_1_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[2] & ftu_bus_2_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[3] & ftu_bus_3_is_first & ftu_instr_valid_c[3])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf4_val_inst3 =    ((nxt_fp[1] & ftu_bus_0_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[2] & ftu_bus_1_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[3] & ftu_bus_2_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[4] & ftu_bus_3_is_first & ftu_instr_valid_c[3])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf5_val_inst3 =    ((nxt_fp[2] & ftu_bus_0_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[3] & ftu_bus_1_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[4] & ftu_bus_2_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[5] & ftu_bus_3_is_first & ftu_instr_valid_c[3])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf6_val_inst3 =    ((nxt_fp[3] & ftu_bus_0_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[4] & ftu_bus_1_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[5] & ftu_bus_2_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[6] & ftu_bus_3_is_first & ftu_instr_valid_c[3])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf7_val_inst3 =    ((nxt_fp[4] & ftu_bus_0_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[5] & ftu_bus_1_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[6] & ftu_bus_2_is_first & ftu_instr_valid_c[3])|
                            (nxt_fp[7] & ftu_bus_3_is_first & ftu_instr_valid_c[3])) &  ftu_fetch_thr_c & ~ftu_redirect_bf;

assign buf1_val_hold = (buf1_val_inst0 | buf1_val_inst1 | buf1_val_inst2 | buf1_val_inst3);
assign buf2_val_hold = (buf2_val_inst0 | buf2_val_inst1 | buf2_val_inst2 | buf2_val_inst3);
assign buf3_val_hold = (buf3_val_inst0 | buf3_val_inst1 | buf3_val_inst2 | buf3_val_inst3);
assign buf4_val_hold = (buf4_val_inst0 | buf4_val_inst1 | buf4_val_inst2 | buf4_val_inst3);
assign buf5_val_hold = (buf5_val_inst0 | buf5_val_inst1 | buf5_val_inst2 | buf5_val_inst3);
assign buf6_val_hold = (buf6_val_inst0 | buf6_val_inst1 | buf6_val_inst2 | buf6_val_inst3);
assign buf7_val_hold = (buf7_val_inst0 | buf7_val_inst1 | buf7_val_inst2 | buf7_val_inst3);


assign ibq_buf1_sel_n_lsb =  buf1_val_hold & ~ibq_buf1_sel_lsb ;
assign ibq_buf2_sel_n_lsb =  buf2_val_hold & ~ibq_buf2_sel_lsb ;
assign ibq_buf3_sel_n_lsb =  buf3_val_hold & ~ibq_buf3_sel_lsb ;
assign ibq_buf4_sel_n_lsb =  buf4_val_hold & ~ibq_buf4_sel_lsb ;
assign ibq_buf5_sel_n_lsb =  buf5_val_hold & ~ibq_buf5_sel_lsb ;
assign ibq_buf6_sel_n_lsb =  buf6_val_hold & ~ibq_buf6_sel_lsb ;
assign ibq_buf7_sel_n_lsb =  buf7_val_hold & ~ibq_buf7_sel_lsb ;


///////////////////////////////////////////////////////// 
// Generate the cur_fp[7:1]                            //
///////////////////////////////////////////////////////// 
// The new fp depends on the numbers of new instrs     //
// whether the buffer is empty, and the original       //
// pointer. Here are all the different cases.          //
//                                                     //
// 1) cur_fp is the same if :                          //
//    a) no fetch -- don't care about emptiness or pick//
//       fetch = ftu_fetch_thr_c & ftu_instr_valid_c[0]//
// 2) nxt_fp is cur_fp shift left by one.              //
//    a) 1 new inst fetched                            //
// 3) nxt_fp is cur_fp shift left by two.              //
//    a) 2 new inst fetched                            // 
// 4) nxt_fp is cur_fp shift left by three.            //
//    a) 3 new inst fetched                            //
// 5) nxt_fp is cur_fp shift left by four              //
//    a) 4 new inst fetched                            //
///////////////////////////////////////////////////////// 
assign instr_sf_valid_except_c = ftu_instr_sf_valid_c & ftu_exception_valid_c & ftu_fetch_thr_c; 
ifu_ibu_ibq_ctl_msff_ctl_macro__width_14 fetch_sig_reg (
    .scan_in(fetch_sig_reg_scanin),
    .scan_out(fetch_sig_reg_scanout),
    .l1clk(l1clk),
    .din  ({ftu_fetch_thr_c,any_instr_valid,ftu_bus_0_is_first, ftu_bus_1_is_first, instr_sf_valid_except_c,instr_sf_valid_except_p, 
            ftu_bus_2_is_first, ftu_bus_3_is_first ,pku_flush_upper_buffer,ftu_redirect_bf,ftu_instr_valid_c[3:0] }),
    .dout ({fetch_thr_p,any_instr_valid_p,bus_0_is_first_p, bus_1_is_first_p, instr_sf_valid_except_p,instr_sf_valid_except_p_ff,
            bus_2_is_first_p, bus_3_is_first_p,flush_upper_buffer_ff,redirect_p,instr_valid_p[3:0]}),
  .siclk(siclk),
  .soclk(soclk));

// all the shifts must be re-evaluated.

assign sel_no_shift            = ~reset_fp_to_one & ~(fetch_thr_p & any_instr_valid_p) ;

assign sel_shift_left_by_one   = ~reset_fp_to_one & fetch_thr_p & ~redirect_p & 
                                                   ((bus_0_is_first_p & instr_valid_p[0] & ~instr_valid_p[1]) |
                                                    (bus_1_is_first_p & instr_valid_p[1] & ~instr_valid_p[2]) |
                                                    (bus_2_is_first_p & instr_valid_p[2] & ~instr_valid_p[3]) |
                                                    (bus_3_is_first_p & instr_valid_p[3] & ~instr_valid_p[0]));
						    
assign sel_shift_left_by_two   = ~reset_fp_to_one & fetch_thr_p & ~redirect_p & 
                                                   ((bus_0_is_first_p & instr_valid_p[1] & ~instr_valid_p[2]) |
                                                    (bus_1_is_first_p & instr_valid_p[2] & ~instr_valid_p[3]) |
                                                    (bus_2_is_first_p & instr_valid_p[3] & ~instr_valid_p[0]) |
                                                    (bus_3_is_first_p & instr_valid_p[0] & ~instr_valid_p[1]));

assign sel_shift_left_by_three = ~reset_fp_to_one & fetch_thr_p & ~redirect_p & 
                                                   ((bus_0_is_first_p & instr_valid_p[2] & ~instr_valid_p[3]) |
                                                    (bus_1_is_first_p & instr_valid_p[3] & ~instr_valid_p[0]) |
                                                    (bus_2_is_first_p & instr_valid_p[0] & ~instr_valid_p[1]) |
                                                    (bus_3_is_first_p & instr_valid_p[1] & ~instr_valid_p[2]));

assign sel_shift_left_by_four  = ~reset_fp_to_one & fetch_thr_p & ~redirect_p & 
                                                   ((bus_0_is_first_p & instr_valid_p[3] ) |
                                                    (bus_1_is_first_p & instr_valid_p[0] ) |
                                                    (bus_2_is_first_p & instr_valid_p[1] ) |
                                                    (bus_3_is_first_p & instr_valid_p[2] ));

assign reset_fp_to_one = flush_upper_buffer_ff  | instr_sf_valid_except_p_ff; 

assign nxt_fp[7:1] = ({7{sel_no_shift}} & cur_fp[7:1]) |
                     ({7{reset_fp_to_one}} & 7'b0000001) | 
 		     ({7{sel_shift_left_by_one}} & {cur_fp[6:1], cur_fp[7]}) |
                     ({7{sel_shift_left_by_two}} & {cur_fp[5:1], cur_fp[7:6]}) | 
		     ({7{sel_shift_left_by_three}} & {cur_fp[4:1], cur_fp[7:5]})|
		     ({7{sel_shift_left_by_four}} & {cur_fp[3:1], cur_fp[7:4]});

ifu_ibu_ibq_ctl_msff_ctl_macro__width_6 cur_fp_7to2 (
    .scan_in(cur_fp_7to2_scanin),
    .scan_out(cur_fp_7to2_scanout),
    .l1clk(l1clk_pm1),
    .din  (nxt_fp[7:2]),
    .dout (cur_fpq[7:2]),
  .siclk(siclk),
  .soclk(soclk)
   );
   
assign nxt_fpd[1] = ~nxt_fp[1];

ifu_ibu_ibq_ctl_msff_ctl_macro__width_1 cur_fp_1 (
    .scan_in(cur_fp_1_scanin),
    .scan_out(cur_fp_1_scanout),
    .l1clk(l1clk_pm1),
    .din  (nxt_fpd[1]),
    .dout (cur_fpq[1]),
  .siclk(siclk),
  .soclk(soclk)
   );

assign cur_fp[7:1] = {cur_fpq[7:2], ~cur_fpq[1]}  ;

// redirecting the pointer(s)
// update curr_ip, up to one instruction issued per cycle:
// if the pointer is at 7'b10000000, then restart from 7'b00000001;
// special when buf1-7 are empty. aka. issueing an instruction from buf0.

///////////////////////////////////////////////////////// 
// Generate the next_ip[7:1]                           
///////////////////////////////////////////////////////// 
//                                                     
// must note whether an instr goes into buf0           
// must note the fetch&issue case                      
// 1) next_ip shifts by one if ~pku_flush_upper_buffer:
//    - pick or flush0 occurs while ~buf7to1_empty     
//    - fetch occurs (at buf0) while buf0_sel_inst0*   
// 2) next_ip stays if ~pku_flush_upper_buffer:        
//    - ~pick and ~flush0 & nofetch at buf0                             
// 3) next_ip = nxt_fp if pku_flush_upper_buffer       
///////////////////////////////////////////////////////// 


   assign no_shift_ip       = ~(shift_left_one_ip |  fp_plus_1_to_ip | fp_to_ip) ;
   assign shift_left_one_ip =  ((pku_pick_p | (pku_flush_buffer0 & ~ibu_empty)))  & ~pku_flush_upper_buffer & ~instr_sf_valid_except_p;
   assign fp_to_ip          =  (pku_flush_upper_buffer | instr_sf_valid_except_p) & ~(ibu_empty | pku_pick_p | pku_flush_buffer0) ;
   assign fp_plus_1_to_ip   =  (pku_flush_upper_buffer | instr_sf_valid_except_p) &  (ibu_empty | pku_pick_p | pku_flush_buffer0); 


assign next_ip[7:1] = ({7{shift_left_one_ip}} & {curr_ip[6:1], curr_ip[7]}) |
                      ({7{no_shift_ip}} & curr_ip[7:1]) |
                      ({7{fp_to_ip}}    & 7'b0000001)  |
                      ({7{fp_plus_1_to_ip}} & 7'b0000010);

ifu_ibu_ibq_ctl_msff_ctl_macro__width_6 next_ip_7to2 (
    .scan_in(next_ip_7to2_scanin),
    .scan_out(next_ip_7to2_scanout),
    .l1clk(l1clk),
    .din  ({next_ip[7:3],next_ip[1]}),
    .dout ({curr_ipq[7:3],curr_ipq[1]}),
  .siclk(siclk),
  .soclk(soclk)
   );

assign next_ipd[2] = ~next_ip[2];
ifu_ibu_ibq_ctl_msff_ctl_macro__width_1 next_ip_1 (
    .scan_in(next_ip_1_scanin),
    .scan_out(next_ip_1_scanout),
    .l1clk(l1clk),
    .din  (next_ipd[2]),
    .dout (curr_ipq[2]),
  .siclk(siclk),
  .soclk(soclk)
   );

assign curr_ip[7:1] = { curr_ipq[7:3], ~curr_ipq[2], curr_ipq[1]}  ;

////////////////////////////////////////////////////////
// generate the valids for buf1-7:                      
// curr    next                                         
// 0       0     a) no fetch, no issue OR 
//               b) fetched inst0 & ibu_empty                   
// 0       1     a) fetch inst0 but cannot have below 
//                  i)  buf0_sel_inst0 = 1
//                  ii) flush_upper_buffer = 1
//               b) fetch inst1 or 2 & ~flush_upper                  
// 1       0     a) issue or flush_upper and no fetch     
// 1       1     a) no issue (stay valid)
//                  i)  ~pku_pick_p & ~flush_upper
//                  ii) ~flush_upper             
// buf0_sel_inst0 means ftu_fetch_thr_c & ftu_instr_valid_c[0] & (ibu_empty | (pku_pick_p | pku_flush_buffer0) & buf7to1_empty).
// (ibq_buf1_sel_inst0 & ~ibq_buf0_sel_inst0) | ibq_buf1_sel_inst1 | ibq_buf1_sel_inst2 | (~ibq_buf0_sel_buf1 & buf_valid_p[1])
// if an instruction is issued from any buffer, invalidate that entry.
//////////////////////////////////////////////////////// 

assign buf_valid_in[1] = (((ibq_buf1_sel_lsb & ~(ftu_fetch_thr_c &  
                          (ibu_empty | (pku_pick_p | pku_flush_buffer0) & buf7to1_empty))) | 
                           ibq_buf1_sel_n_lsb) & ~buf_valid_p[1]) | 		  
                          (~(curr_ip[1] & (pku_pick_p | pku_flush_buffer0)) & buf_valid_p[1]) |
                          (ftu_exception_valid_c  & ftu_fetch_thr_c & ~ftu_redirect_bf);		       

assign buf_valid_in[2] = (((ibq_buf2_sel_lsb & ~(ftu_fetch_thr_c &  
                          (ibu_empty | (pku_pick_p | pku_flush_buffer0) & buf7to1_empty))) | 
                           ibq_buf2_sel_n_lsb) & ~buf_valid_p[2]) | 		  
                          (~(curr_ip[2] & (pku_pick_p | pku_flush_buffer0)) & buf_valid_p[2])|		       
                          (ftu_exception_valid_c  & ftu_fetch_thr_c & ~ftu_redirect_bf);		       

assign buf_valid_in[3] = (((ibq_buf3_sel_lsb & ~(ftu_fetch_thr_c &  
                          (ibu_empty | (pku_pick_p | pku_flush_buffer0) & buf7to1_empty))) | 
                           ibq_buf3_sel_n_lsb) & ~buf_valid_p[3]) | 		  
                          (~(curr_ip[3] & (pku_pick_p | pku_flush_buffer0)) & buf_valid_p[3])|		       
                          (ftu_exception_valid_c  & ftu_fetch_thr_c & ~ftu_redirect_bf);		       

assign buf_valid_in[4] = (((ibq_buf4_sel_lsb & ~(ftu_fetch_thr_c &  
                          (ibu_empty | (pku_pick_p | pku_flush_buffer0) & buf7to1_empty))) | 
                           ibq_buf4_sel_n_lsb) & ~buf_valid_p[4]) | 		  
                          (~(curr_ip[4] & (pku_pick_p | pku_flush_buffer0)) & buf_valid_p[4])|		       
                          (ftu_exception_valid_c  & ftu_fetch_thr_c & ~ftu_redirect_bf);		       

assign buf_valid_in[5] = (((ibq_buf5_sel_lsb & ~(ftu_fetch_thr_c &  
                          (ibu_empty | (pku_pick_p | pku_flush_buffer0) & buf7to1_empty))) | 
                           ibq_buf5_sel_n_lsb) & ~buf_valid_p[5]) | 		  
                          (~(curr_ip[5] & (pku_pick_p | pku_flush_buffer0)) & buf_valid_p[5])|		       
                          (ftu_exception_valid_c  & ftu_fetch_thr_c & ~ftu_redirect_bf);		       

assign buf_valid_in[6] = (((ibq_buf6_sel_lsb & ~(ftu_fetch_thr_c &  
                          (ibu_empty | (pku_pick_p | pku_flush_buffer0) & buf7to1_empty))) | 
                           ibq_buf6_sel_n_lsb) & ~buf_valid_p[6]) | 		  
                          (~(curr_ip[6] & (pku_pick_p | pku_flush_buffer0)) & buf_valid_p[6])|		       
                          (ftu_exception_valid_c  & ftu_fetch_thr_c & ~ftu_redirect_bf);		       

assign buf_valid_in[7] = (((ibq_buf7_sel_lsb & ~(ftu_fetch_thr_c &  
                          (ibu_empty | (pku_pick_p | pku_flush_buffer0) & buf7to1_empty))) | 
                           ibq_buf7_sel_n_lsb) & ~buf_valid_p[7]) | 		  
                          (~(curr_ip[7] & (pku_pick_p | pku_flush_buffer0)) & buf_valid_p[7])|		       
                          (ftu_exception_valid_c  & ftu_fetch_thr_c & ~ftu_redirect_bf);		       

assign buf_valid_din[7:1] = ({7{~pku_flush_upper_buffer & ~instr_sf_valid_except_p}} & buf_valid_in[7:1]);

ifu_ibu_ibq_ctl_msff_ctl_macro__width_7 valid_outpk_7to1 (
    .scan_in(valid_outpk_7to1_scanin),
    .scan_out(valid_outpk_7to1_scanout),
    .l1clk(l1clk_pm1),
    .din(buf_valid_din[7:1]),
    .dout (buf_valid_p[7:1]),
  .siclk(siclk),
  .soclk(soclk)
   );

/////////////////////////////////////////////////////// 
// generate the valids for buf0:                       
// curr    next                                        
// 0       0     no fetch, no issue OR fetch one & (issue one | flush0) ?                    
// 0       1     fetch 1 or more instr (issue cannot be on):                    
//               - ftu_fetch_thr_c & ftu_instr_valid_c[0]
//               - ifu_buf0_valid_p = 0 (same as ibu_empty = 1)
//               - flush0 = 0
//               - flush_upper = 0
//
// 1       0     issue & buf7to1_empty or flush0       
// 1       1     a) issue or flush0 & ~buf7to1_empty
//                  - pku_pick_p | pku_flush_buffer0 = 1
//                  - flush_upper = 0
//                  - buf7to1_empty = 0
//                  - flush0 = 0
//               b)  issue or flush0 & buf7to1_empty & fetch
//                  - pku_pick_p | pku_flush_buffer0 = 1
//                  - flush_upper = 0  
//                  - buf7to1_empty = 1
//                  - ftu_fetch_thr_c & ftu_instr_valid_c[0]
//                  - flush0 = 0
//               c) no issue 
//                  - pku_pick_p = 0
//                  - flush_upper = x  
//                  - flush0 = 0
//
//               ~flush_upper OR ~issue & ~flush0      
////////////////////////////////////////////////////////

// validate if buf0 picks any entry in buf1-7, stay validated if no pick, or any fetching is done
assign any_instr_valid =  ~ftu_redirect_bf & (ftu_instr_valid_c[0] | ftu_instr_valid_c[1] | ftu_instr_valid_c[2] | ftu_instr_valid_c[3]) ;

assign buf_valid_in[0] = ( ftu_fetch_thr_c   &  any_instr_valid & ~true_buf0_valid_p & ~pku_flush_upper_buffer ) | 
			 ( ftu_fetch_thr_c   &  any_instr_valid &  true_buf0_valid_p &  pku_pick_p & ~pku_flush_upper_buffer) | 
			 (~true_buf0_valid_p & ~buf7to1_empty   & ~pku_flush_upper_buffer) | 
			 ( pku_pick_p        & ~buf7to1_empty   & ~pku_flush_upper_buffer) |
			 (~pku_pick_p        &  true_buf0_valid_p);
			


assign buf_valid_din[0] = buf_valid_in[0] |
                          (ftu_exception_valid_c  & ftu_fetch_thr_c & ~ftu_redirect_bf & ~pku_flush_upper_buffer );

ifu_ibu_ibq_ctl_msff_ctl_macro__width_1 valid_outpk_buf0 (
    .scan_in(valid_outpk_buf0_scanin),
    .scan_out(valid_outpk_buf0_scanout),
    .l1clk(l1clk_pm1),
    .din(buf_valid_din[0]),
    .dout (ifu_buf0_valid_p),
  .siclk(siclk),
  .soclk(soclk)
   );

assign true_buf0_valid_p = ifu_buf0_valid_p & ~pku_flush_buffer0;

assign ifu_upper_buffer_valid_p = (buf_valid_p[1] | buf_valid_p[2] | buf_valid_p[3] | 
                                   buf_valid_p[4] | buf_valid_p[5] | buf_valid_p[6] |
				   buf_valid_p[7] ) & ~instr_sf_valid_except_p;


assign buf7to1_empty = ~ifu_upper_buffer_valid_p;
assign ibu_empty = ~ifu_buf0_valid_p;


// room for >4: check buffers 1-7 ;
assign ibu_room_4ormore =  (~buf_valid_p[1] & ~buf_valid_p[2] & ~buf_valid_p[3] & ~buf_valid_p[4]) |
                           (~buf_valid_p[2] & ~buf_valid_p[3] & ~buf_valid_p[4] & ~buf_valid_p[5]) |
                           (~buf_valid_p[3] & ~buf_valid_p[4] & ~buf_valid_p[5] & ~buf_valid_p[6]) |
                           (~buf_valid_p[4] & ~buf_valid_p[5] & ~buf_valid_p[6] & ~buf_valid_p[7]) |
                           (~buf_valid_p[5] & ~buf_valid_p[6] & ~buf_valid_p[7] & ~buf_valid_p[1]) |
                           (~buf_valid_p[6] & ~buf_valid_p[7] & ~buf_valid_p[1] & ~buf_valid_p[2]) |
                           (~buf_valid_p[7] & ~buf_valid_p[1] & ~buf_valid_p[2] & ~buf_valid_p[3]);

///////////////////////////////////////////////////////////////////////
// Spare circuits                                                    //
///////////////////////////////////////////////////////////////////////
ifu_ibu_ibq_ctl_spare_ctl_macro__num_2 spares  (
    .scan_in(spares_scanin),
    .scan_out(spares_scanout),
    .l1clk  (l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



supply0 vss;
supply1 vdd;
assign se = tcu_scan_en ;
// fixscan start:
assign buff_clken_reg_scanin     = scan_in                  ;
assign pmen_reg_scanin           = buff_clken_reg_scanout   ;
assign fetch_sig_reg_scanin      = pmen_reg_scanout         ;
assign cur_fp_7to2_scanin        = fetch_sig_reg_scanout    ;
assign cur_fp_1_scanin           = cur_fp_7to2_scanout      ;
assign next_ip_7to2_scanin       = cur_fp_1_scanout         ;
assign next_ip_1_scanin          = next_ip_7to2_scanout     ;
assign valid_outpk_7to1_scanin   = next_ip_1_scanout        ;
assign valid_outpk_buf0_scanin   = valid_outpk_7to1_scanout ;
assign spares_scanin             = valid_outpk_buf0_scanout ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module ifu_ibu_ibq_ctl_l1clkhdr_ctl_macro (
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

module ifu_ibu_ibq_ctl_msff_ctl_macro__width_1 (
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

module ifu_ibu_ibq_ctl_msff_ctl_macro__width_14 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [13:0] fdin;
wire [12:0] so;

  input [13:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [13:0] dout;
  output scan_out;
assign fdin[13:0] = din[13:0];






dff #(14)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[13:0]),
.si({scan_in,so[12:0]}),
.so({so[12:0],scan_out}),
.q(dout[13:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ifu_ibu_ibq_ctl_msff_ctl_macro__width_6 (
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

module ifu_ibu_ibq_ctl_msff_ctl_macro__width_7 (
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


module ifu_ibu_ibq_ctl_spare_ctl_macro__num_2 (
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

