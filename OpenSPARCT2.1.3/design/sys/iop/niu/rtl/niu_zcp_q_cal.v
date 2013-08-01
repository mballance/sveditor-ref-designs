// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_zcp_q_cal.v
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
/*%W%	%G%*/

/*************************************************************************
 *
 * File Name    : niu_zcp_q_cal.v
 * Authors Name : John Lo
 * Description  : wb_HoQ, win_HoQ, cross_q_end calculation.
 * Parent Module: niu_zcp_tt_dpath.v
 * Child  Module: 
 * Interface Mod: 
 * Date Created : 7/7/2004
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential
 *
 * Design Notes:
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/


module niu_zcp_q_cal 
  (/*AUTOARG*/
   // Outputs
   buf_req_ok, wb_HoQ, win_HoQ, cross_q_end, 
   // Inputs
   clk, reset, ring_size, HoQ, ToQ, num_buf_requested, num_buf, 
   wb_win_buf_offset
   );
   
   input                      clk;
   input 		      reset;
   input  [3:0]  	      ring_size;
   input  [15:0] 	      HoQ;
   input  [15:0] 	      ToQ;
   input  [5:0]               num_buf_requested;
   input  [5:0]               num_buf;
   input  [5:0] 	      wb_win_buf_offset;
   output 		      buf_req_ok;
   output [15:0] 	      wb_HoQ;
   output [15:0] 	      win_HoQ;
   output 		      cross_q_end;
   
   // has to have enough buffers for unmapping and prefetching. 
   // This is the only chance to reuquest buffers.
   reg 			      buf_req_ok;
   reg  [15:0] 		      wb_HoQ;     
   reg 	[15:0] 		      la_HoQ;     // look ahead HoQ = wb_HoQ + num_buf
   reg  [15:0] 		      win_HoQ;     
   reg 			      cross_q_end;
   reg  [15:0] 		      full_space;
   
   // wb_win_buf_offset  = first_byte_buf[5:0];
   // num_buf_requested  = wb_win_buf_offset[5:0] + dmaw_type [1:0] + reach_buf_end;
   // num_buf_requested == num_buf_will_be_unmapped
   wire [15:0]  wb_HoQ_temp  =  HoQ[15:0] + {10'b0,num_buf_requested[5:0]};
   wire [15:0]  win_HoQ_temp =  HoQ[15:0] + {10'b0,num_buf[5:0]};

always @ (ring_size or wb_HoQ_temp or num_buf or ToQ or win_HoQ_temp)
  begin
	          wb_HoQ                 = {12'b0,wb_HoQ_temp[`HOQ3_PTR]};
	          la_HoQ[`HOQ3_PTR]      = num_buf[`HOQ3_PTR] +  wb_HoQ[`HOQ3_PTR];
                  win_HoQ                = {12'b0,win_HoQ_temp[`HOQ3_PTR]};
                  cross_q_end            = win_HoQ[`HOQ3_MSB] != la_HoQ[`HOQ3_MSB];
                  full_space[`HOQ3_PTR]  =(ToQ[`HOQ3_MSB]==la_HoQ[`HOQ3_MSB]) ? ({1'b0,ToQ[`HOQ3_A]} - {1'b0,la_HoQ[`HOQ3_A]})
                                                   : (`HOQ3_D - ({1'b0,la_HoQ[`HOQ3_A]}-{1'b0,ToQ[`HOQ3_A]}));
	          buf_req_ok             = full_space[`HOQ3_PTR]  > 0;
     casex (ring_size[3:0]) // synopsys parallel_case full_case 
       4'd0   : begin       //  8 buffer pointers; [3:0]
	          wb_HoQ                 = {12'b0,wb_HoQ_temp[`HOQ3_PTR]};
	          la_HoQ[`HOQ3_PTR]      = num_buf[`HOQ3_PTR] +  wb_HoQ[`HOQ3_PTR];
                  win_HoQ                = {12'b0,win_HoQ_temp[`HOQ3_PTR]};
                  cross_q_end            = win_HoQ[`HOQ3_MSB] != la_HoQ[`HOQ3_MSB];
                  full_space[`HOQ3_PTR]  =(ToQ[`HOQ3_MSB]==la_HoQ[`HOQ3_MSB]) ? ({1'b0,ToQ[`HOQ3_A]} - {1'b0,la_HoQ[`HOQ3_A]})
                                                   : (`HOQ3_D - ({1'b0,la_HoQ[`HOQ3_A]}-{1'b0,ToQ[`HOQ3_A]}));
	          buf_req_ok             = full_space[`HOQ3_PTR]  > 0;
                end
       4'd1   : begin       // 16 buffer pointers; [4:0]
	          wb_HoQ                 = {11'b0,wb_HoQ_temp[`HOQ4_PTR]};
	          la_HoQ[`HOQ4_PTR]      = num_buf[`HOQ4_PTR] +  wb_HoQ[`HOQ4_PTR];
                  win_HoQ                = {11'b0,win_HoQ_temp[`HOQ4_PTR]};
                  cross_q_end            = win_HoQ[`HOQ4_MSB] != la_HoQ[`HOQ4_MSB];
                  full_space[`HOQ4_PTR]  =(ToQ[`HOQ4_MSB]==la_HoQ[`HOQ4_MSB]) ? ({1'b0,ToQ[`HOQ4_A]} - {1'b0,la_HoQ[`HOQ4_A]})
                                                   : (`HOQ4_D - ({1'b0,la_HoQ[`HOQ4_A]}-{1'b0,ToQ[`HOQ4_A]}));
	          buf_req_ok             = full_space[`HOQ4_PTR]  > 0;
                end
       4'd2   : begin       // 32 buffer pointers; [5:0]
	          wb_HoQ                 = {10'b0,wb_HoQ_temp[`HOQ5_PTR]};
	          la_HoQ[`HOQ5_PTR]      = num_buf[5:0]       +  wb_HoQ[`HOQ5_PTR];
                  win_HoQ                = {10'b0,win_HoQ_temp[`HOQ5_PTR]};
                  cross_q_end            = win_HoQ[`HOQ5_MSB] != la_HoQ[`HOQ5_MSB];
                  full_space[`HOQ5_PTR]  =(ToQ[`HOQ5_MSB]==la_HoQ[`HOQ5_MSB]) ? ({1'b0,ToQ[`HOQ5_A]} - {1'b0,la_HoQ[`HOQ5_A]})
                                                   : (`HOQ5_D - ({1'b0,la_HoQ[`HOQ5_A]}-{1'b0,ToQ[`HOQ5_A]}));
	          buf_req_ok             = full_space[`HOQ5_PTR]  > 0;
                end
       4'd3   : begin       // 64 buffer pointers; [6:0]
	          wb_HoQ                 = {9'b0,wb_HoQ_temp[`HOQ6_PTR]};
	          la_HoQ[`HOQ6_PTR]      = {1'b0,num_buf[5:0]}+  wb_HoQ[`HOQ6_PTR];
                  win_HoQ                = {9'b0,win_HoQ_temp[`HOQ6_PTR]};
                  cross_q_end            = win_HoQ[`HOQ6_MSB] != la_HoQ[`HOQ6_MSB];
                  full_space[`HOQ6_PTR]  =(ToQ[`HOQ6_MSB]==la_HoQ[`HOQ6_MSB]) ? ({1'b0,ToQ[`HOQ6_A]} - {1'b0,la_HoQ[`HOQ6_A]})
                                                   : (`HOQ6_D - ({1'b0,la_HoQ[`HOQ6_A]}-{1'b0,ToQ[`HOQ6_A]}));
	          buf_req_ok             = full_space[`HOQ6_PTR]  > 0;
                end
       4'd4   : begin       // 128 buffer pointers; [7:0]
	          wb_HoQ                 = {8'b0,wb_HoQ_temp[`HOQ7_PTR]};
	          la_HoQ[`HOQ7_PTR]      = {2'b0,num_buf[5:0]}+  wb_HoQ[`HOQ7_PTR];
                  win_HoQ                = {8'b0,win_HoQ_temp[`HOQ7_PTR]};
                  cross_q_end            = win_HoQ[`HOQ7_MSB] != la_HoQ[`HOQ7_MSB];
                  full_space[`HOQ7_PTR]  =(ToQ[`HOQ7_MSB]==la_HoQ[`HOQ7_MSB]) ? ({1'b0,ToQ[`HOQ7_A]} - {1'b0,la_HoQ[`HOQ7_A]})
                                                   : (`HOQ7_D - ({1'b0,la_HoQ[`HOQ7_A]}-{1'b0,ToQ[`HOQ7_A]}));
	          buf_req_ok             = full_space[`HOQ7_PTR]  > 0;
                end
       4'd5   : begin       // 256 buffer pointers; [8:0]
	          wb_HoQ                 = {7'b0,wb_HoQ_temp[`HOQ8_PTR]};
	          la_HoQ[`HOQ8_PTR]      = {3'b0,num_buf[5:0]}+  wb_HoQ[`HOQ8_PTR];
                  win_HoQ                = {7'b0,win_HoQ_temp[`HOQ8_PTR]};
                  cross_q_end            = win_HoQ[`HOQ8_MSB] != la_HoQ[`HOQ8_MSB];
                  full_space[`HOQ8_PTR]  =(ToQ[`HOQ8_MSB]==la_HoQ[`HOQ8_MSB]) ? ({1'b0,ToQ[`HOQ8_A]} - {1'b0,la_HoQ[`HOQ8_A]})
                                                   : (`HOQ8_D - ({1'b0,la_HoQ[`HOQ8_A]}-{1'b0,ToQ[`HOQ8_A]}));
	          buf_req_ok             = full_space[`HOQ8_PTR]  > 0;
                end
       4'd6   : begin       // 512 buffer pointers; [9:0]
	          wb_HoQ                 = {6'b0,wb_HoQ_temp[`HOQ9_PTR]};
	          la_HoQ[`HOQ9_PTR]      = {4'b0,num_buf[5:0]}+  wb_HoQ[`HOQ9_PTR];
                  win_HoQ                = {6'b0,win_HoQ_temp[`HOQ9_PTR]};
                  cross_q_end            = win_HoQ[`HOQ9_MSB] != la_HoQ[`HOQ9_MSB];
                  full_space[`HOQ9_PTR]  =(ToQ[`HOQ9_MSB]==la_HoQ[`HOQ9_MSB]) ? ({1'b0,ToQ[`HOQ9_A]} - {1'b0,la_HoQ[`HOQ9_A]})
                                                   : (`HOQ9_D - ({1'b0,la_HoQ[`HOQ9_A]}-{1'b0,ToQ[`HOQ9_A]}));
	          buf_req_ok             = full_space[`HOQ9_PTR]  > 0;
                end
       4'd7   : begin       //1024: 1K buffer pointers; [10:0]
	          wb_HoQ                 = {5'b0,wb_HoQ_temp[`HOQ10_PTR]};
	          la_HoQ[`HOQ10_PTR]     = {5'b0,num_buf[5:0]}+  wb_HoQ[`HOQ10_PTR];
                  win_HoQ                = {5'b0,win_HoQ_temp[`HOQ10_PTR]};
                  cross_q_end            = win_HoQ[`HOQ10_MSB] != la_HoQ[`HOQ10_MSB];
                  full_space[`HOQ10_PTR] =(ToQ[`HOQ10_MSB]==la_HoQ[`HOQ10_MSB]) ? ({1'b0,ToQ[`HOQ10_A]} - {1'b0,la_HoQ[`HOQ10_A]})
                                                      : (`HOQ10_D - ({1'b0,la_HoQ[`HOQ10_A]}-{1'b0,ToQ[`HOQ10_A]}));
	          buf_req_ok             = full_space[`HOQ10_PTR]  > 0;
                end
       4'd8   : begin       //2048: 2K buffer pointers; [11:0]
	          wb_HoQ                 = {4'b0,wb_HoQ_temp[`HOQ11_PTR]};
	          la_HoQ[`HOQ11_PTR]     = {6'b0,num_buf[5:0]}+  wb_HoQ[`HOQ11_PTR];
                  win_HoQ                = {4'b0,win_HoQ_temp[`HOQ11_PTR]};
                  cross_q_end            = win_HoQ[`HOQ11_MSB] != la_HoQ[`HOQ11_MSB];
                  full_space[`HOQ11_PTR] =(ToQ[`HOQ11_MSB]==la_HoQ[`HOQ11_MSB]) ? ({1'b0,ToQ[`HOQ11_A]} - {1'b0,la_HoQ[`HOQ11_A]})
                                                      : (`HOQ11_D - ({1'b0,la_HoQ[`HOQ11_A]}-{1'b0,ToQ[`HOQ11_A]}));
	          buf_req_ok             = full_space[`HOQ11_PTR]  > 0;
                end
       4'd9   : begin       //4096: 4K buffer pointers; [12:0]
	          wb_HoQ                 = {3'b0,wb_HoQ_temp[`HOQ12_PTR]};
	          la_HoQ[`HOQ12_PTR]     = {7'b0,num_buf[5:0]}+  wb_HoQ[`HOQ12_PTR];
                  win_HoQ                = {3'b0,win_HoQ_temp[`HOQ12_PTR]};
                  cross_q_end            = win_HoQ[`HOQ12_MSB] != la_HoQ[`HOQ12_MSB];
                  full_space[`HOQ12_PTR] =(ToQ[`HOQ12_MSB]==la_HoQ[`HOQ12_MSB]) ? ({1'b0,ToQ[`HOQ12_A]} - {1'b0,la_HoQ[`HOQ12_A]})
                                                      : (`HOQ12_D - ({1'b0,la_HoQ[`HOQ12_A]}-{1'b0,ToQ[`HOQ12_A]}));
	          buf_req_ok             = full_space[`HOQ12_PTR]  > 0;
                end
       4'd10  : begin       //8192: 8K buffer pointers; [13:0]
	          wb_HoQ                 = {2'b0,wb_HoQ_temp[`HOQ13_PTR]};
	          la_HoQ[`HOQ13_PTR]     = {8'b0,num_buf[5:0]}+  wb_HoQ[`HOQ13_PTR];
                  win_HoQ                = {2'b0,win_HoQ_temp[`HOQ13_PTR]};
                  cross_q_end            = win_HoQ[`HOQ13_MSB] != la_HoQ[`HOQ13_MSB];
                  full_space[`HOQ13_PTR] =(ToQ[`HOQ13_MSB]==la_HoQ[`HOQ13_MSB]) ? ({1'b0,ToQ[`HOQ13_A]} - {1'b0,la_HoQ[`HOQ13_A]})
                                                      : (`HOQ13_D - ({1'b0,la_HoQ[`HOQ13_A]}-{1'b0,ToQ[`HOQ13_A]}));
	          buf_req_ok             = full_space[`HOQ13_PTR]  > 0;
                end
       4'd11  : begin       //16384: 16K buffer pointers; [14:0]
	          wb_HoQ                 = {1'b0,wb_HoQ_temp[`HOQ14_PTR]};
	          la_HoQ[`HOQ14_PTR]     = {9'b0,num_buf[5:0]}+  wb_HoQ[`HOQ14_PTR];
                  win_HoQ                = {1'b0,win_HoQ_temp[`HOQ14_PTR]};
                  cross_q_end            = win_HoQ[`HOQ14_MSB] != la_HoQ[`HOQ14_MSB];
                  full_space[`HOQ14_PTR] =(ToQ[`HOQ14_MSB]==la_HoQ[`HOQ14_MSB]) ? ({1'b0,ToQ[`HOQ14_A]} - {1'b0,la_HoQ[`HOQ14_A]})
                                                      : (`HOQ14_D - ({1'b0,la_HoQ[`HOQ14_A]}-{1'b0,ToQ[`HOQ14_A]}));
	          buf_req_ok             = full_space[`HOQ14_PTR]  > 0;
                end
       4'd12  : begin       //32768: 32K buffer pointers; [15:0]
	          wb_HoQ                 = wb_HoQ_temp[`HOQ15_PTR];
	          la_HoQ[`HOQ15_PTR]     = {10'b0,num_buf[5:0]}+  wb_HoQ[`HOQ15_PTR];
                  win_HoQ                = win_HoQ_temp[`HOQ15_PTR];
                  cross_q_end            = win_HoQ[`HOQ15_MSB] != la_HoQ[`HOQ15_MSB];
                  full_space[`HOQ15_PTR] =(ToQ[`HOQ15_MSB]==la_HoQ[`HOQ15_MSB]) ? ({1'b0,ToQ[`HOQ15_A]} - {1'b0,la_HoQ[`HOQ15_A]})
                                                      : (`HOQ15_D - ({1'b0,la_HoQ[`HOQ15_A]}-{1'b0,ToQ[`HOQ15_A]}));
	          buf_req_ok             = full_space[`HOQ15_PTR]  > 0;
                end
       default: begin
	          wb_HoQ                 = {12'b0,wb_HoQ_temp[`HOQ3_PTR]};
	          la_HoQ[`HOQ3_PTR]      = num_buf[`HOQ3_PTR]  + wb_HoQ[`HOQ3_PTR];
                  win_HoQ                = {12'b0,win_HoQ_temp[`HOQ3_PTR]};
                  cross_q_end            = win_HoQ[`HOQ3_MSB] != la_HoQ[`HOQ3_MSB];
                  full_space[`HOQ3_PTR]  =(ToQ[`HOQ3_MSB]==la_HoQ[`HOQ3_MSB]) ? ({1'b0,ToQ[`HOQ3_A]} - {1'b0,la_HoQ[`HOQ3_A]})
                                                   : (`HOQ3_D - ({1'b0,la_HoQ[`HOQ3_A]}-{1'b0,ToQ[`HOQ3_A]}));
	          buf_req_ok             = full_space[`HOQ3_PTR]  > 0;
	        end
     endcase // casex(ring_size[3:0])
  end 


endmodule // niu_zcp_q_cal

   /* ----- begin comments -----

// wire  [38:0]  ring_base_addr;  // 39b
// wire  [19:0]  handle;          // 20b
// 2'b0 to take care of 32 bits (4B) va ptr address. It has to be 4 bytes aligned.
                                                           
ring_size == 4'd0 :  8  pointers -> {handle,ring_base_addr[38:0],win_HoQ[2:0], 2'b0}
ring_size == 4'd1 : 16  pointers -> {handle,ring_base_addr[38:1],win_HoQ[3:0], 2'b0}
ring_size == 4'd2 : 32  pointers -> {handle,ring_base_addr[38:2],win_HoQ[4:0], 2'b0}
ring_size == 4'd3 : 64  pointers -> {handle,ring_base_addr[38:3],win_HoQ[5:0], 2'b0}
ring_size == 4'd4 :128  pointers -> {handle,ring_base_addr[38:4],win_HoQ[6:0], 2'b0}
ring_size == 4'd5 :256  pointers -> {handle,ring_base_addr[38:5],win_HoQ[7:0], 2'b0}
ring_size == 4'd6 :512  pointers -> {handle,ring_base_addr[38:6],win_HoQ[8:0], 2'b0}
ring_size == 4'd7 :  1k pointers -> {handle,ring_base_addr[38:7],win_HoQ[9:0], 2'b0}
ring_size == 4'd8 :  2k pointers -> {handle,ring_base_addr[38:8],win_HoQ[10:0],2'b0}
ring_size == 4'd9 :  4K pointers -> {handle,ring_base_addr[38:9],win_HoQ[11:0],2'b0}
ring_size == 4'd10:  8K pointers -> {handle,ring_base_addr[38:10],win_HoQ[12:0],2'b0}
ring_size == 4'd11: 16K pointers -> {handle,ring_base_addr[38:11],win_HoQ[13:0],2'b0}
ring_size == 4'd12: 32K pointers -> {handle,ring_base_addr[38:12],win_HoQ[14:0],2'b0}
							   
 ----- end comments ----- */


