// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_tdmc_mbox_context.v
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
/*********************************************************************
 *
 *  NIU TDMC - DMA Context for Mailbox Writes
 *
 *  Orignal Author(s):   Arvind Srinivasan
 *  Modifier(s):
 *  Project(s):          Neptune
 *
 *  Copyright (c) 2004   Sun Microsystems, Inc.
 *
 *  All Rights Reserved.
 *
 *  This verilog model is the confidential and proprietary property of
 *  Sun Microsystems, Inc., and the possession or use of this model
 *  requires a written license from Sun Microsystems, Inc.
 *
 **********************************************************************/



module niu_tdmc_mbox_context(/*AUTOARG*/
   // Outputs
   send_mbox_dma, mbox_dma_data, mbox_dma_data_valid, 
   mbox_dma_data_done, clear_cfg_dma_mb, set_cfg_dma_mmk, 
   set_cfg_dma_mk, 
   // Inputs
   SysClk, Reset_L, txc_dmc_dma_mark_bit, tx_cfg_dma_mk, 
   tx_cfg_dma_mmk, tx_cfg_dma_enable_mb, tx_cs_dma, tx_dma_pre_st, 
   tx_rng_head_dma, tx_rng_tail_dma, tx_dma_rng_err_logh, 
   tx_dma_rng_err_logl, mbox_ack_dma_received, 
   mbox_ack_dma_received_error, done_mbox_dma, mbox_dma_scheduled, 
   meta_data_req
   ) ;

   input SysClk;
   input Reset_L;
   
   input txc_dmc_dma_mark_bit;
   input tx_cfg_dma_mk;
   input tx_cfg_dma_mmk;
   input tx_cfg_dma_enable_mb;
   
 
   
   // all the mailbox info
   input [63:0] tx_cs_dma;
   input [63:0] tx_dma_pre_st;
   input [`PTR_WIDTH:0] tx_rng_head_dma;
   input [`PTR_WIDTH:0] tx_rng_tail_dma;
   input [63:0] tx_dma_rng_err_logh;
   input [63:0] tx_dma_rng_err_logl;

   input 	mbox_ack_dma_received;
   input 	mbox_ack_dma_received_error;
   
   output 	send_mbox_dma;
   input 	done_mbox_dma; 
   input 	mbox_dma_scheduled;
   
   output [127:0] mbox_dma_data;
   output 	  mbox_dma_data_valid;
   output 	  mbox_dma_data_done;
   
   output 	  clear_cfg_dma_mb;
   output 	  set_cfg_dma_mmk;
   output 	  set_cfg_dma_mk;

   input 	  meta_data_req;
   


   //

   // if(tx_cfg_dma_enable_mb &  txc_dmc_dma_mark_bit & tx_cfg_dma_mk)
   // send_mbox_dma = 1;
   // if ( done_mbox_dma) clear_cfg_dma_mk;
   // if(mbox_dma_scheduled ) // should happen only when send_mbox_dma is set
   // copy the registers into a shadow registers
   // if another markbit is seen then set_cfg_dma_mmk = 1;
   // if( done_mbox_dma) set_pending_flag-
   // clear pending flag once ack is received and clear_cfg_dma_mk = 1;
   // if pending flag is set- and another markbit is seen- set mmk bit
   //
   // To generate data and data valid and complete signal
   // set count = 0 if(mbox_ is scheduled)
   // incr count everytime data_req is asserted and mbox is scheduled
   // for very request- send data and data valid out
   // decrement send counter and once it reached 0 generate complete signals
   parameter IDLE = 2'h0,
	     SEND_DATA = 2'h1;


   
   reg [127:0] mbox_dma_data;
   reg 	       mbox_dma_data_valid;
   reg 	       mbox_dma_data_done;
   reg [1:0]   send_state;
   reg 	       done;
   reg [2:0]   send_count;

   reg 		  send_mbox_dma;
   reg 		  pending_ack;
   reg 		  set_cfg_dma_mmk;
   reg [63:0] 	  sh_tx_cfg_dma_cs;
   reg [63:0] 	  sh_tx_dma_pre_st;
   reg [`PTR_WIDTH:0] 	  sh_tx_ring_dma_hdl;
   reg [`PTR_WIDTH:0] 	  sh_tx_ring_dma_kick;
   reg [63:0] 	  sh_tx_ring_dma_errlog;
   
   reg 		  mbox_dma_scheduled_d;
   reg 		  mmk_seen;
   reg 		  set_cfg_dma_mk;
   reg            shadow_mark_bit;

  
   //VCS coverage off
   
      // synopsys translate_off
    reg [192:1] SEND_STATE;
    always @(send_state)
      begin
	 case(send_state)
	   IDLE :    SEND_STATE  = "IDLE";
	   SEND_DATA:SEND_STATE = "SEND_DATA";
	   default : SEND_STATE = "UNKNOWN";
	 endcase
      end  
   // synopsys translate_on 
   //VCS coverage on
   
   
 

   always@(posedge SysClk) begin
      if(!Reset_L) 
	mbox_dma_scheduled_d <= 1'b0; 
      else mbox_dma_scheduled_d <= mbox_dma_scheduled;
   end // always@ (posedge SysClk)
   
      
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 send_mbox_dma <= 1'b0; 
      end else begin // if (!Reset_L)
	 if(done_mbox_dma)
	   send_mbox_dma <= 1'b0;
	 else if(tx_cfg_dma_enable_mb &  txc_dmc_dma_mark_bit & !pending_ack) begin
	    send_mbox_dma <= 1'b1;
	 end // if (tx_cfg_dma_enable_mb & txc_dmc_dma_mark_bit & tx_cfg_dma_mk  & !pending_ack)
      end // else: !if(!Reset_L)
   end // always@ (posedge SysClk)
   
   assign clear_cfg_dma_mb = mbox_ack_dma_received;

   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_cfg_dma_mk <= 1'b0;
      end else begin // if (!Reset_L)
	 if(tx_cfg_dma_enable_mb) begin
	   set_cfg_dma_mk <=  clear_cfg_dma_mb;
	 end else begin
	    set_cfg_dma_mk <= txc_dmc_dma_mark_bit;
	 end // else: !if(tx_cfg_dma_enable_mb)
      end // else: !if(!Reset_L)
   end // always@ (posedge SysClk)
   
   
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 set_cfg_dma_mmk <= 1'b0;
      end else begin
        set_cfg_dma_mmk <= ( mmk_seen  & tx_cfg_dma_mk ) & ~set_cfg_dma_mmk;
      end
     end
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 mmk_seen <= 1'b0;
         shadow_mark_bit <= 1'b0;
      end else begin
/*
         mmk_seen <= (tx_cfg_dma_enable_mb & txc_dmc_dma_mark_bit & ( pending_ack | send_mbox_dma ) ) |
		     ( ~tx_cfg_dma_enable_mb & txc_dmc_dma_mark_bit &  tx_cfg_dma_mk) |
	             (mmk_seen & ~tx_cfg_dma_mk);
*/
        mmk_seen <= (txc_dmc_dma_mark_bit &  tx_cfg_dma_mk) | shadow_mark_bit | (mmk_seen & ~tx_cfg_dma_mk);
        shadow_mark_bit <= txc_dmc_dma_mark_bit | ( shadow_mark_bit & ~tx_cfg_dma_mk);

      end // else: !if(!Reset_L)
   end // always@ (posedge SysClk)
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 pending_ack <= 1'b0; 
      end else if(done_mbox_dma) begin // if (!Reset_L)
	 pending_ack <= 1'b1;
      end else if(mbox_ack_dma_received ) begin // if (done_mbox_dma)
	 pending_ack <= 1'b0; 
      end // if (mbox_ack_dma_received )
   end // always@ (posedge SysClk)
   
   always@(posedge SysClk) begin
      if(mbox_dma_scheduled & !mbox_dma_scheduled_d) begin
	 sh_tx_cfg_dma_cs <=   tx_cs_dma ;
	 sh_tx_ring_dma_hdl <= tx_rng_head_dma ;
	 sh_tx_dma_pre_st <=   tx_dma_pre_st ;
	 sh_tx_ring_dma_kick <= tx_rng_tail_dma;
	 sh_tx_ring_dma_errlog<= {tx_dma_rng_err_logh[31:0],tx_dma_rng_err_logl[31:0]} ;
      end // if (mbox_dma_scheduled & !mbox_dma_scheduled_d)
   end // always@ (posedge SysClk)

   // State machine to send these data to the Meta Bus-
   
   reg [2:0] req_count;
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 req_count <= 3'h0;
      end else begin
	 if(!mbox_dma_scheduled)  req_count <= 3'h0;
	 else if(mbox_dma_scheduled & meta_data_req) 
	   req_count<= req_count +1;
      end
      end

   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 send_state <= IDLE;
	 send_count <= 3'h0;
	 mbox_dma_data_valid <= 1'b0;
	 mbox_dma_data_done <= 1'b0;
      end else begin
	 case(send_state)
	   IDLE: begin
	      send_count <= 3'h0;
	      mbox_dma_data_valid <= 1'b0;
	      mbox_dma_data_done <= 1'b0;
	      done <= 1'b0;
	      if(mbox_dma_scheduled & meta_data_req) begin
		 send_state <= SEND_DATA; 
		 done <= 1'b0;
	      end // if (mbox_dma_scheduled & arb0_tdmc_data_req)
	   end
	   SEND_DATA: begin
	      if(!done & (req_count <= send_count) ) begin
		 mbox_dma_data <= 128'hfeedbeef_feedbeef_feedbeef_feedbeef;
	         mbox_dma_data_valid <= 1'b0;
	      end else if(!done) begin
		 case(send_count)
		   3'h0: begin
		      mbox_dma_data <=  {sh_tx_cfg_dma_cs,sh_tx_dma_pre_st};   
		      mbox_dma_data_valid <= 1'b1;
		      mbox_dma_data_done <= 1'b0;
		   end // case: 2'h0
		   3'h1: begin
		      mbox_dma_data <=  {45'h0,2'h0,sh_tx_ring_dma_hdl, 45'h0, 2'h0,sh_tx_ring_dma_kick};
		      mbox_dma_data_valid <= 1'b1;
		      mbox_dma_data_done <= 1'b0;
		   end
		   3'h2: begin
                      mbox_dma_data <=  {sh_tx_ring_dma_errlog,64'h0};
		      mbox_dma_data_valid <= 1'b1;
		      mbox_dma_data_done <= 1'b0;
		   end // case: 3'h2
		   3'h3: begin
                      mbox_dma_data <=  128'h0;
		      mbox_dma_data_valid <= 1'b1;
		      mbox_dma_data_done <= 1'b1;
		      done <= 1'b1;
		   end
		   default: begin
                      mbox_dma_data <=  128'h0;
		      mbox_dma_data_valid <= 1'b0;
		      mbox_dma_data_done <= 1'b0;
		   end
		 endcase // case(send_count)
		 send_count <= send_count + 3'h1;
		 send_state <= SEND_DATA;
	      end else  begin
		 send_state <= IDLE;
		 mbox_dma_data <= 128'hfeedbeef_feedbeef_feedbeef_feedbeef;
	         mbox_dma_data_valid <= 1'b0;
	      end // else: !if(!done)
	   end // case: SEND_DATA
	   default: begin
	      send_state <= IDLE;
	   end
	 endcase // case(send_state)
      end // else: !if(!Reset_L)
   end // always@ (posedge SysClk)
   
   

 
endmodule

