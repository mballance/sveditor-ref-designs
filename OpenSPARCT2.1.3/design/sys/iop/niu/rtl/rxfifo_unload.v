// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rxfifo_unload.v
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
 * File Name    : rxfifo_unload.v
 * Author Name  : John Lo
 * Description  : It contains system clock domain read/write pointer 
 *                management logic and rxmac_ipp_ack, ipp_rxmac_req logic.
 * Parent Module: xmac_core
 * Child  Module: 
 * Interface Mod: many.
 * Date Created : 5/9/00
 *
 * Copyright (c) 2002, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

`include  "xmac.h"

module rxfifo_unload (
                   clk,
                   rx_reset_clk,
		   // rxfifo stuff
                   srfifo_g_wr_ptr_sync,
                   rxfifo_g_wr_ptr_sync, // from rx_clk
		   rxfifo_dout,
                   ipp_rxmac_req,
		   srfifo_dout,
// outputs
		   // Rx DMA Interface
                   rxmac_ipp_ack,
                   rxmac_ipp_tag,
                   rxmac_ipp_data,
                   rxmac_ipp_ctrl,
                   rxmac_ipp_stat, 
		   // rxfifo stuff
                   rxfifo_g_rd_ptr_clk, // to xmac_sync.v
                   rxfifo_rd_ptr_clk,
                   rxfifo_wr_ptr_clk,
		   rxfifo_underrun_clk,
		   // srfifo stuff
                   srfifo_rd_ptr_clk,
                   // rmon
         	   inc_histo_cntr1,
                   inc_histo_cntr2,
        	   inc_histo_cntr3,
        	   inc_histo_cntr4,
        	   inc_histo_cntr5,
         	   inc_histo_cntr6,
         	   inc_histo_cntr7,
                   // for signal observation 
          	   rxfifo_full_clk_reg,
          	   rxfifo_empty_clk_reg,
		   rxfifo_full_space_clk
                      );

      
   input           clk;
   input           rx_reset_clk;
		   // rxfifo stuff
   input [4:0] 	   srfifo_g_wr_ptr_sync;
   input [4:0] 	   rxfifo_g_wr_ptr_sync; // from rx_clk
   input [65:0]	   rxfifo_dout;
   input 	   ipp_rxmac_req;
   input  [`TBITS] srfifo_dout; 
// outputs
		   // Rx DMA Interface
   output 	   rxmac_ipp_ack;
   output 	   rxmac_ipp_tag;
   output [63:0]   rxmac_ipp_data;
   output 	   rxmac_ipp_ctrl;
   output [`TBITS] rxmac_ipp_stat;
		   // rxfifo stuff
   output [4:0]    rxfifo_g_rd_ptr_clk; // to xmac_sync.v
   output [4:0]    rxfifo_rd_ptr_clk;
   output [4:0]    rxfifo_wr_ptr_clk;
   output 	   rxfifo_underrun_clk;
		   // srfifo stuff
   output [4:0]    srfifo_rd_ptr_clk;
                   // rmon
   output 	   inc_histo_cntr1;
   output 	   inc_histo_cntr2;
   output 	   inc_histo_cntr3;
   output 	   inc_histo_cntr4;
   output 	   inc_histo_cntr5;
   output 	   inc_histo_cntr6;
   output 	   inc_histo_cntr7;
                   // for signal observation 
   output 	   rxfifo_full_clk_reg;
   output 	   rxfifo_empty_clk_reg;
   output [4:0]    rxfifo_full_space_clk;

   wire 	   rxmac_ipp_ack;
   wire 	   ipp_rxmac_req;
   wire 	   ipp_req;
   wire [4:0] 	   srfifo_g_wr_ptr_sync;
   wire [4:0] 	   rxfifo_wr_ptr_clk;
   wire [4:0] 	   rxfifo_g_rd_ptr_clk,rxfifo_rd_ptr_clk;
   wire 	   srfifo_rd_en;
   wire 	   new_inc_histo_cntr1,new_inc_histo_cntr2,
                   new_inc_histo_cntr3,new_inc_histo_cntr4,
		   new_inc_histo_cntr5,new_inc_histo_cntr6,
                   new_inc_histo_cntr7;
// alias   
   wire 	   ctrl_out = rxfifo_dout[65];
   wire 	   tag_out  = rxfifo_dout[64];
   wire 	   filterred_ctrl_out;
   wire 	   filterred_tag_out;

   // internal signal
   wire   	   rxfifo_full_clk;
   wire 	   rxfifo_empty_clk;
   wire   	   rxfifo_full_clk_reg;
   wire 	   rxfifo_empty_clk_reg;
   wire 	   rxfifo_rd_en;
   wire   [4:0]    srfifo_rd_ptr_clk;   
   wire 	   rxmac_ipp_tag_pls;
   wire 	   rxmac_ipp_tag_pls_d;
   wire 	   rxmac_ipp_tag_pls_d2;
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire   [4:0]    srfifo_wr_ptr_clk;   
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on

/* ----------------------- Rx Burst I/F ----------------------------- */
   // register output signals
   RegRst #(1)  rxmac_ipp_ack_RegRst (.reset(rx_reset_clk),
                              .din(rxfifo_rd_en),.clk(clk), 
                              .qout(rxmac_ipp_ack));	

   RegRst #(1)  rxmac_ipp_ctrl_RegDff (.reset(rx_reset_clk),
                              .din(filterred_ctrl_out),.clk(clk),
                              .qout(rxmac_ipp_ctrl));

   RegRst #(1)  rxmac_ipp_tag_RegDff (.reset(rx_reset_clk),
                              .din(filterred_tag_out),.clk(clk),
                              .qout(rxmac_ipp_tag));

   RegDff #(64) rxmac_ipp_data_RegDff (
                              .din(rxfifo_dout[63:0]),.clk(clk),
                              .qout(rxmac_ipp_data[63:0]));

   // 1st bubble 
PlsGen rxmac_ipp_tag_pls_PlsGen(.reset(rx_reset_clk),
                                .clk(clk),
                                .iSigIn(rxmac_ipp_tag),
                                .oPlsOut(rxmac_ipp_tag_pls));
   // 2nd bubble
   RegDff #(1)  rxmac_ipp_tag_pls_d_RegDff (
                              .din(rxmac_ipp_tag_pls),.clk(clk),
                              .qout(rxmac_ipp_tag_pls_d));

   // loj eco 3-8-06
   // The following flop will help to create the 3rd bubble
   // such that the total bubble is 3 cycles between
   // tag de-assertion and next ctl assertion.
   RegDff #(1)  rxmac_ipp_tag_pls_d2_RegDff (
                              .din (rxmac_ipp_tag_pls_d),.clk(clk),
                              .qout(rxmac_ipp_tag_pls_d2));
   
   RegDff #(`TBITS_WIDTH) rxmac_ipp_stat_RegDff (
                              .din(srfifo_dout[`TBITS]),.clk(clk),
                              .qout(rxmac_ipp_stat[`TBITS]));
   
/* ------------------------------------------------------------------ */
   
/* --------------- start rxfifo pointer Management ------------------ */
   // It is possible that the rxfifo underrun_clk when ipp is not following rules.
   RegDff #(1) ipp_req_RegDff (.din(ipp_rxmac_req),.clk(clk),
                               .qout(ipp_req));

   assign  rxfifo_underrun_clk = rxfifo_rd_en &  rxfifo_empty_clk;

   // loj eco 3-8-06
   assign  rxfifo_rd_en = ipp_req & (~rxfifo_empty_clk) &
	   (~rxmac_ipp_tag_pls) & (~rxmac_ipp_tag_pls_d) & (~rxmac_ipp_tag_pls_d2);
   
// Rxfifo write Pointer, wr_ptr from rx_clk   
g2b_5bit rxfifo_wr_ptr_clk_g2b_5bit(.g_cnt(rxfifo_g_wr_ptr_sync),
                        .b_cnt(rxfifo_wr_ptr_clk));

// Rxfifo G read Pointer, g_wr_ptr to sysclk   
g_cntr_5bit rxfifo_g_rd_ptr_clk_g_cntr_5bit(
                        .reset(rx_reset_clk),
                        .clk(clk),
                        .ce(rxfifo_rd_en),
                        .g_cnt(rxfifo_g_rd_ptr_clk));

// Rxfifo Read Pointer
g2b_5bit rxfifo_g2b_5bit(.g_cnt(rxfifo_g_rd_ptr_clk),
                         .b_cnt(rxfifo_rd_ptr_clk));

   assign  rxfifo_full_clk  = (rxfifo_wr_ptr_clk[4] == (!rxfifo_rd_ptr_clk[4])) &&
                            (rxfifo_wr_ptr_clk[3:0] == rxfifo_rd_ptr_clk[3:0]);

   FD1     rxfifo_full_clk_reg_FD1 (.D(rxfifo_full_clk), .CP(clk),.Q(rxfifo_full_clk_reg));

   assign  rxfifo_empty_clk = (rxfifo_wr_ptr_clk[4:0] == rxfifo_rd_ptr_clk[4:0]);

   FD1     rxfifo_empty_clk_reg_FD1(.D(rxfifo_empty_clk),.CP(clk),.Q(rxfifo_empty_clk_reg));
    
wire [4:0] rxfifo_full_space_clk = (rxfifo_wr_ptr_clk[4]   == rxfifo_rd_ptr_clk[4])   ?
                                   ({1'b0,rxfifo_wr_ptr_clk[3:0]}  - {1'b0,rxfifo_rd_ptr_clk[3:0]}) :
                             (16 - ({1'b0,rxfifo_rd_ptr_clk[3:0]}  - {1'b0,rxfifo_wr_ptr_clk[3:0]}));

//  wire [4:0] rxfifo_rd_ptr_plus_1 =  rxfifo_rd_ptr_clk + 1;
//  wire rxfifo_aempty =(rxfifo_wr_ptr_clk[4:0] == rxfifo_rd_ptr_plus_1[4:0]);

/* --------------- end of rxfifo pointer Management ----------------- */
 
 /* --------------- start srfifo pointer Management ------------------ */
// srfifo write Pointer, wr_ptr from rx_clk   
g2b_5bit srfifo_wr_ptr_g2b_5bit(.g_cnt(srfifo_g_wr_ptr_sync),
                        .b_cnt(srfifo_wr_ptr_clk));

// srfifo Read Pointer
   assign  filterred_tag_out  = rxfifo_rd_en & tag_out;
   assign  filterred_ctrl_out = rxfifo_rd_en & ctrl_out;
   
   assign srfifo_rd_en = (filterred_tag_out | filterred_ctrl_out);
   
counter_X5 srfifo_rd_ptr_counter_X5(.clk(clk),
                     .clr(rx_reset_clk),
                     .enable(srfifo_rd_en),
                     .count(srfifo_rd_ptr_clk));

/* --------------- end of srfifo pointer Management ----------------- */
 

/* ---------------------------- RMON Support ------------------------ */
 assign new_inc_histo_cntr1 = rxmac_ipp_tag & 
                              (rxmac_ipp_stat[13:0] == 14'h40);
 assign new_inc_histo_cntr2 = rxmac_ipp_tag & 
                              (rxmac_ipp_stat[13:0] > 14'h40) &
                              (rxmac_ipp_stat[13:0] <= 14'h7F);
 assign new_inc_histo_cntr3 = rxmac_ipp_tag & 
                              (rxmac_ipp_stat[13:0] > 14'h7F) &
                              (rxmac_ipp_stat[13:0] <= 14'hFF);
 assign new_inc_histo_cntr4 = rxmac_ipp_tag & 
                              (rxmac_ipp_stat[13:0] > 14'hFF) &
                              (rxmac_ipp_stat[13:0] <= 14'h1FF);
 assign new_inc_histo_cntr5 = rxmac_ipp_tag & 
                              (rxmac_ipp_stat[13:0] > 14'h1FF) &
                              (rxmac_ipp_stat[13:0] <= 14'h3FF);
 assign new_inc_histo_cntr6 = rxmac_ipp_tag &
                              (rxmac_ipp_stat[13:0] > 14'h3FF) &
                              (rxmac_ipp_stat[13:0] <= 14'h5F2);
 assign new_inc_histo_cntr7 = rxmac_ipp_tag &
                              (rxmac_ipp_stat[13:0] > 14'h5F2);
 FD1 INC_HIST_CNTR1_FF(.D(new_inc_histo_cntr1),.CP(clk),.Q(inc_histo_cntr1));
 FD1 INC_HIST_CNTR2_FF(.D(new_inc_histo_cntr2),.CP(clk),.Q(inc_histo_cntr2));
 FD1 INC_HIST_CNTR3_FF(.D(new_inc_histo_cntr3),.CP(clk),.Q(inc_histo_cntr3));
 FD1 INC_HIST_CNTR4_FF(.D(new_inc_histo_cntr4),.CP(clk),.Q(inc_histo_cntr4));
 FD1 INC_HIST_CNTR5_FF(.D(new_inc_histo_cntr5),.CP(clk),.Q(inc_histo_cntr5));
 FD1 INC_HIST_CNTR6_FF(.D(new_inc_histo_cntr6),.CP(clk),.Q(inc_histo_cntr6));
 FD1 INC_HIST_CNTR7_FF(.D(new_inc_histo_cntr7),.CP(clk),.Q(inc_histo_cntr7));


 /* ------------------------------------------------------------------------- */


endmodule // rxfifo_unload


/**********************************************************
 * 
 * tag   ctrl  srfifo_rd_ptr 
 * ----  ----  ------------- 
 *   0     0   no change    
 *  
 *   0     1   inc 1
 *  
 *   1     0   inc 1
 *  
 *   1     1   inc 1
 * -------------------------
 * 
 * rxfifo_rd_en is controlled by ipp_rxmac_req only. 
 * assign rxfifo_rd_en = ipp_rxmac_req & ~rxfifo_empty_clk;
 * 
 * 
 * ******************************************************/





		    
