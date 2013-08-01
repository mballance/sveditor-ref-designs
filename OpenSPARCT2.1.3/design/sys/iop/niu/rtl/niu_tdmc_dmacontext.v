// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_tdmc_dmacontext.v
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

`include "txc_defines.h"
`include "niu_dmc_reg_defines.h"

module niu_tdmc_dmacontext ( /*AUTOARG*/
   // Outputs
   ShadowRingCurrentPtr_DMA, DMA_Address, DMA_Ring_Wrapped, 
   DMA_RingLength, DMACacheEntryValid, dmc_txc_dma_active, 
   dmc_txc_dma_eoflist, DMA_EmptySpace, tx_rng_head_dma, 
   DMA_AvailableFor_Fetch, DMA_ReqPending, DMA_EntriesValid, 
   DMA_CacheEmpty, DMA_CacheReadPtr, DMA_CacheWritePtrReOrder, 
   dma_reset_scheduled, dma_clear_reset,  
   set_conf_part_error_dma, set_tx_ring_oflow_dma,
   meta_entries_requested_dma, tx_dma_cfg_dma_stop_state, 
   dma_debug_port,
   // Inputs
   inc_DMAHeadShadow, updateCacheWritePtrs, ResetDMARdPtr, 
   meta_resp_address, tx_rng_cfg_dma_staddr, 
   meta_req_address, DMA_UpdateAddress, 
   DMC_TxCache_SMX_Req_Length, tx_rng_cfg_dma_len, tx_rng_tail_dma, 
   tx_dma_cfg_dma_stall, NoOfCacheWritesDispatched, DMANumToReq, 
   dmc_txc_dma_cacheready, meta_resp_dma_num, IncrDMARdPtr, 
   updateCacheContext, NoOfValidEntries, page0_mask_dma, 
   page0_value_dma, page0_reloc_dma, page0_valid_dma, page1_mask_dma, 
   page1_value_dma, page1_reloc_dma, page1_valid_dma, 
   dmc_txc_dma_page_handle, txc_dmc_dma_inc_head, 
   dmc_txc_dma_partial, receivedErrorResp,
   dma_reset_done_hold, tx_dma_cfg_dma_rst, 
   tx_dma_cfg_dma_stop, SysClk, Reset_L
   );

   
   output [`PTR_WIDTH -1 :0] ShadowRingCurrentPtr_DMA;
   output [63:0] DMA_Address;
   output 	 DMA_Ring_Wrapped;
   output [`PTR_WIDTH -1 :0] DMA_RingLength;
   output 	 DMACacheEntryValid;
   output 	 dmc_txc_dma_active;
   output 	 dmc_txc_dma_eoflist;
   output [3:0]  DMA_EmptySpace   ;
   output [`PTR_WIDTH  :0] tx_rng_head_dma;
   output 	 DMA_AvailableFor_Fetch;
   output 	 DMA_ReqPending;
   output [4:0]  DMA_EntriesValid;
   output 	 DMA_CacheEmpty;
   output [3:0]  DMA_CacheReadPtr;
   output [3:0]  DMA_CacheWritePtrReOrder;
   output 	 dma_reset_scheduled;
   output 	 dma_clear_reset;
   output 	 set_conf_part_error_dma;
   output        set_tx_ring_oflow_dma;
   output [4:0] meta_entries_requested_dma;
   input 	 inc_DMAHeadShadow;
   input 	 updateCacheWritePtrs;
   input 	 ResetDMARdPtr;
   input [2:0] 	 meta_resp_address;
   input [37:0]  tx_rng_cfg_dma_staddr;
   input [7:0]   meta_req_address;
   input [43:0]  DMA_UpdateAddress;
   input [13:0]  DMC_TxCache_SMX_Req_Length;
   input [`RNG_LENGTH_WIDTH - 1 :0]  tx_rng_cfg_dma_len;
   input [`PTR_WIDTH  :0]  tx_rng_tail_dma;
   input 	 tx_dma_cfg_dma_stall;
   input [3:0] 	 NoOfCacheWritesDispatched;
   input [4:0] 	 DMANumToReq;
   input 	 dmc_txc_dma_cacheready;
   input [4:0] 	 meta_resp_dma_num;
   input 	 IncrDMARdPtr;
   input 	 updateCacheContext;
   input [4:0] 	 NoOfValidEntries;

   input [31:0]  page0_mask_dma;
   input [31:0]  page0_value_dma;
   input [31:0]  page0_reloc_dma;
   input 	 page0_valid_dma;
   input [31:0]  page1_mask_dma;
   input [31:0]  page1_value_dma;
   input [31:0]  page1_reloc_dma;
   input 	 page1_valid_dma;
   input [19:0]  dmc_txc_dma_page_handle;
   input 	 dmc_txc_dma_partial;
   input 	 dma_reset_done_hold;
   input 	 receivedErrorResp;
   input 	 tx_dma_cfg_dma_rst;
   input 	 tx_dma_cfg_dma_stop;
   output 	 tx_dma_cfg_dma_stop_state;
   input 	 SysClk;
   input 	 Reset_L;
   input 	 txc_dmc_dma_inc_head; // Needs to come from txc
   output [31:0] dma_debug_port;
   
   reg [`PTR_WIDTH -1 :0] 	 ShadowRingCurrentPtr_DMA;
   reg [63:0] 	 DMA_Address;
   wire 	 DMA_Ring_Wrapped;
   reg [`PTR_WIDTH -1 :0] 	 DMA_RingLength;
   wire 	 DMACacheEntryValid;
   wire 	 FetchMoreDMA  ;
   wire 	 dmc_txc_dma_active;
   wire 	 dmc_txc_dma_eoflist;
   wire 	 DMAActive;
   wire [3:0] 	 DMA_EmptySpace   ;
   reg 		 ReceivedDMAKick;
   reg [`PTR_WIDTH  :0] 	 tx_rng_head_dma;
   wire 	 DMA_AvailableFor_Fetch;
   reg 		 DMA_ReqPending;
   reg 		 DMA_ReqPending_d;
   reg [3:0] 	 DMA_Anchor_Address;
   wire 	 DMA_CacheEmpty;
   reg [3:0] 	 DMA_CacheWritePtr;
   reg [3:0] 	 DMA_CacheShadowWritePtr;
   reg [3:0] 	 DMA_CacheReadPtr;
   reg [3:0] 	 DMA_CacheWritePtrReOrder;
   reg [4:0] 	 DMA_EntriesValid;
   wire 	 DMA_EntryUpdateCollision;
   reg 		 ld_TxCacheAddress_dma;


   reg [`PTR_WIDTH -1 :0] 	 DMA_RingCurrentPtr;
   reg 		 tx_dma_cfg_dma_stall_d;
   reg 		 DMA_EofList;
   reg [3:0] 	 DMA_CacheReOrderOffset;
   wire 	 ClearDMAKick;

   reg 		 ShadowRingCurrentPtrWrap_DMA;
   reg 		 DMA_RingCurrentPtrWrap;
   wire 	 DMA_RingTailWrap;
   wire 	 DMA_Cache_SpaceAvailable;

   reg [4:0]     meta_entries_requested_dma;
   
   // Logic for Pagetable translation
   reg 		 xlate_done;
   reg [43:0] 	 xlate_start_addr;
   reg [3:0] 	 page_xlate_state;
   reg 		 page0_match;
   reg 		 page1_match;
   reg [31:0] 	 page0_reloc_addr;
   reg [31:0] 	 page1_reloc_addr;
   reg 		 set_conf_part_error_dma;
   reg 		 page_xlate_error;
   reg           xlate_valid;
   
   /* signals for reset logic */
   reg [3:0] 	 DMA_ResetSM;
   reg 		 dma_reset_scheduled;
   reg 		 stop_fetch_descriptors;
   reg 		 dma_clear_reset;
   reg 		 flush_dma_cache;
   wire 	 reset_asserted;
   reg 		 stop_asserted;
   reg 		 tx_dma_cfg_dma_stop_d;
   reg 		 restart_asserted;
   reg           set_stop_state;
   reg           dma_stopped;
   wire 	 pkt_counts_equal;
   /* registers for status registers and mailbox */


   reg 		 set_tx_ring_oflow_dma;
   reg 		 oflow_error;
   reg           updateCacheContext_d;
   /* Debug Port*/
   wire [31:0] dma_debug_port;
   
   

   /*--------------------------------------------------------------*/
   // Parameters and Defines 
   /*--------------------------------------------------------------*/
   parameter 	 PAGE_XLATE_IDLE          = 4'h0,
		 CHECK_PAGE_STATUS    = 4'h1,
		 PAGE_XLATE_ERROR = 4'h2;

   parameter 	 RESET_IDLE = 4'h0,
		 WAIT_FOR_RESP = 4'h1,
		 WAIT_FOR_DONE = 4'h2,
		 FLUSH_STATES = 4'h3,
		 WAIT_FOR_PKT_DONE = 4'h4;
   
   //VCS coverage off
   // synopsys translate_off
   reg [192:1] 	 PAGE_XLATE_STATE;
   
   always @(page_xlate_state)
     begin
        case(page_xlate_state)
          PAGE_XLATE_IDLE :  PAGE_XLATE_STATE  = "PAGE_XLATE_IDLE";
          CHECK_PAGE_STATUS:      PAGE_XLATE_STATE = "CHECK_PAGE_STATUS";
	  PAGE_XLATE_ERROR : PAGE_XLATE_STATE = "PAGE_XLATE_ERROR";
          default :          PAGE_XLATE_STATE = "UNKNOWN";
        endcase
     end 

   reg [192:1] RESET_STATE;
   always @(DMA_ResetSM)
     begin
        case(DMA_ResetSM)
          RESET_IDLE :  RESET_STATE  = "RESET_IDLE";
          WAIT_FOR_RESP:      RESET_STATE = "WAIT_FOR_RESP";
	  WAIT_FOR_DONE : RESET_STATE = "WAIT_FOR_DONE";
	  FLUSH_STATES : RESET_STATE = "FLUSH_STATES";
	  WAIT_FOR_PKT_DONE : RESET_STATE = "WAIT_FOR_PKT_DONE";
          default :          RESET_STATE = "UNKNOWN";
        endcase
     end 
   // synopsys translate_on
   //VCS coverage on
   

   function [3:0] IncrTxCachePtr;
      input [3:0] CurrentPtr;
      input [3:0] ValueToAdd;
      reg [3:0] tmp_result;
      begin
	 tmp_result = {1'b0,CurrentPtr[2:0]} + { ValueToAdd[3:0]};
	 IncrTxCachePtr[3] = CurrentPtr[3] ^ tmp_result[3];
	 IncrTxCachePtr[2:0] = tmp_result[2:0];
      end
   endfunction // IncrTxCachePtr


   wire [43:0] dma_start_addr =  {tx_rng_cfg_dma_staddr,6'h0};

    
   always@(posedge SysClk) begin
      if (!Reset_L) begin
	xlate_valid <= 1'b0;
      end else begin
	xlate_valid <= xlate_done | ( xlate_valid & ~ dma_clear_reset) ;
      end
      end
   always@(posedge SysClk) begin
      if (!Reset_L) begin
	 page_xlate_state <= PAGE_XLATE_IDLE;
	 xlate_done <= 1'b0;
	 page0_match <= 1'b0;
	 page1_match <= 1'b0;
	 set_conf_part_error_dma <= 1'b0;
	 page_xlate_error <= 1'b0;
         xlate_start_addr <= 44'h0;
      end else begin
	 case(page_xlate_state) // synopsys full_case parallel_case
	   PAGE_XLATE_IDLE: begin
	      xlate_done <= 1'b0;
	      set_conf_part_error_dma <= 1'b0;
	      page_xlate_error <= 1'b0;
	      if(ld_TxCacheAddress_dma ) begin
		  xlate_start_addr <= {tx_rng_cfg_dma_staddr,6'h0};
		 if( ~page0_valid_dma & ~page1_valid_dma ) begin
		    // Set ERROR Flags?
		    set_conf_part_error_dma <= 1'b1;
		    page_xlate_state <= PAGE_XLATE_ERROR;  
		 end else  begin 
		    page_xlate_state <= CHECK_PAGE_STATUS;
		    page0_reloc_addr <=  ((dma_start_addr[43:12] & ~page0_mask_dma) | 
					  ( page0_reloc_dma & page0_mask_dma)) ;
		    page0_match <= page0_valid_dma & 
				   ((page0_mask_dma & dma_start_addr [43:12] ) ==  page0_value_dma );
		    
		    page1_reloc_addr <=  ((dma_start_addr[43:12] & ~page1_mask_dma) | 
					  ( page1_reloc_dma & page1_mask_dma)) ;
		    
		    page1_match <= page1_valid_dma & 
				   ((page1_mask_dma & dma_start_addr [43:12] ) ==  page1_value_dma ); 

		 end // else: !if( ~page0_valid_dma & ~page1_valid_dma )
	      end // if (ld_TxCacheAddress_dma )
	   end // case: PAGE_XLATE_IDLE
	   CHECK_PAGE_STATUS: begin
	      if(page0_match) begin
		 xlate_done <= 1'b1;
		 xlate_start_addr <= {page0_reloc_addr,xlate_start_addr[11:0]};
		 page_xlate_state <= PAGE_XLATE_IDLE;  
	      end else if(page1_match) begin
		 xlate_done <= 1'b1;
		 xlate_start_addr <= {page1_reloc_addr,xlate_start_addr[11:0]};
		 page_xlate_state <= PAGE_XLATE_IDLE;  
	      end else begin
		 set_conf_part_error_dma <= 1'b1;
		 page_xlate_state <= PAGE_XLATE_ERROR;   
	      end
	   end // case: CHECK_PAGE_STATUS
	   PAGE_XLATE_ERROR: begin
	      // Go back to IDLE -- for now
	      set_conf_part_error_dma <= 1'b0;
	      page_xlate_error <= 1'b1;
	      // xlate_done <= 1'b1; // This is to be removed !!!
	      if(reset_asserted) begin
	        page_xlate_state <= PAGE_XLATE_IDLE;
	      end else begin
		 page_xlate_state <= PAGE_XLATE_ERROR;   
	      end
	      // synopsys translate_off
	      // $display(" %m: Warning-- Page translation failure Time - %t",$time);
	      // synopsys translate_on
	   end
	   default: begin
	      page_xlate_state <= PAGE_XLATE_IDLE;
	      xlate_done <= 1'b0;
	      page0_match <= 1'b0;
	      page1_match <= 1'b0;
	      set_conf_part_error_dma <= 1'b0;
	      page_xlate_error <= 1'b0;
              xlate_start_addr <= 44'h0;
	   end
	 endcase // case(page_xlate_state)
      end // else: !if(!Reset_L)
   end // always@ (posedge SysClk)
   
   


   assign ClearDMAKick = updateCacheContext & ReceivedDMAKick;
   
   always@(posedge SysClk )
     if (!Reset_L) begin
      updateCacheContext_d <= 1'b0;
     end else begin
      updateCacheContext_d <= updateCacheContext;
     end
   // DMA
   reg ring_wraped_or_not;
   always@(posedge SysClk )
     if (!Reset_L) begin
	ShadowRingCurrentPtr_DMA <= `PTR_WIDTH'h0;
	ShadowRingCurrentPtrWrap_DMA <= 1'b0;
	DMA_Address <= 64'h0;
	ring_wraped_or_not <= 1'b0;
     end else begin // if (!Reset_L)
	if(xlate_done | dma_clear_reset ) begin
	   ShadowRingCurrentPtr_DMA <= `PTR_WIDTH'h0;
	   // DMA_Address <= {20'h0,tx_rng_cfg_dma_staddr,6'h0};
	   DMA_Address <= {dmc_txc_dma_page_handle,xlate_start_addr}; 
	   ShadowRingCurrentPtrWrap_DMA <= 1'b0;
	   ring_wraped_or_not <= 1'b0;
	end else begin
           if(updateCacheContext) begin
             ring_wraped_or_not <= ( ( ShadowRingCurrentPtr_DMA + {10'h0,DMC_TxCache_SMX_Req_Length[8:3]}) >= (DMA_RingLength ));
	   end else if(updateCacheContext_d ) begin
	      if(ring_wraped_or_not) begin
		 // ShadowRingCurrentPtr_DMA <= {13'h0,DMC_TxCache_SMX_Req_Length[8:3]};
		 ShadowRingCurrentPtr_DMA <= `PTR_WIDTH'h0;
		 ShadowRingCurrentPtrWrap_DMA <= ~ ShadowRingCurrentPtrWrap_DMA;
		 // DMA_Address <= {20'h0,tx_rng_cfg_dma_staddr,6'h0};
		 DMA_Address <= {dmc_txc_dma_page_handle,xlate_start_addr};
	      end else  begin
		 ShadowRingCurrentPtr_DMA <= ShadowRingCurrentPtr_DMA + {10'h0,DMC_TxCache_SMX_Req_Length[8:3]};
		 ShadowRingCurrentPtrWrap_DMA <= ShadowRingCurrentPtrWrap_DMA;
		 DMA_Address <= {dmc_txc_dma_page_handle,DMA_UpdateAddress};
	      end // else: !if(( ShadowRingCurrentPtr_DMA + {13'h0,DMC_TxCache_SMX_Req_Length[8:3]}) > (DMA_RingLength ) )
	   end // if (updateCacheContext & (DMANumToReq== DMA_CHANNEL_NUMBER) )
	end // else: !if(xlate_done)
     end // else: !if(!Reset_L)
   
   assign DMA_Ring_Wrapped = ShadowRingCurrentPtrWrap_DMA ^ DMA_RingTailWrap  ;

    always@(posedge SysClk )
      if (!Reset_L) begin
         meta_entries_requested_dma <= 5'h0;
      end else if(updateCacheContext) begin
         meta_entries_requested_dma <= DMC_TxCache_SMX_Req_Length[7:3];
      end

   always@(posedge SysClk )
     if (!Reset_L) begin
        DMA_RingLength <= `PTR_WIDTH'h0;
     end else if(xlate_done) begin
	DMA_RingLength <= {tx_rng_cfg_dma_len,3'h0};
     end // if (xlate_done)

   // Head Pointer for S/W
   

   always@(posedge SysClk )
     if (!Reset_L) begin
        tx_rng_head_dma <= `PTR_WIDTH_PLUS1'h0;
     end else if(xlate_done | dma_clear_reset) begin
	tx_rng_head_dma <= `PTR_WIDTH_PLUS1'h0;
     end else if( txc_dmc_dma_inc_head) begin// if (xlate_done)
	if( tx_rng_head_dma[`PTR_WIDTH -1 :0] == (DMA_RingLength - `PTR_WIDTH'b1) ) begin
	   tx_rng_head_dma[`PTR_WIDTH] <= ~tx_rng_head_dma[`PTR_WIDTH];
	   tx_rng_head_dma[`PTR_WIDTH -1 :0]  <= `PTR_WIDTH'h0;
	end else begin // if ( tx_rng_head_dma[`PTR_WIDTH -1 :0] == (DMA_RingLength - `PTR_WIDTH'b1) )
	   tx_rng_head_dma[`PTR_WIDTH -1 :0]  <= tx_rng_head_dma[`PTR_WIDTH -1 :0]   + `PTR_WIDTH'h1 ;
	end // else: !if( tx_rng_head_dma[`PTR_WIDTH -1 :0] == (DMA_RingLength - `PTR_WIDTH'b1) )
     end // if ( txc_dmc_inc_head)
   
   
   reg ring_oflow; 
   reg ring_oflow_d; 
   always@(posedge SysClk) begin
      if(!Reset_L) begin 
	 set_tx_ring_oflow_dma <= 1'b0;
	 oflow_error <= 1'b0;
         ring_oflow <= 1'b0;
         ring_oflow_d <= 1'b0;
      end else begin
         ring_oflow <= xlate_valid & ( (tx_rng_tail_dma[`PTR_WIDTH -1 :0] > DMA_RingLength)
		      | ( ~DMA_Ring_Wrapped &  ( ShadowRingCurrentPtr_DMA > tx_rng_tail_dma[`PTR_WIDTH -1 :0]) )
		      | ( DMA_Ring_Wrapped & ( tx_rng_tail_dma[`PTR_WIDTH -1 :0] > ShadowRingCurrentPtr_DMA )  )
		      );
         ring_oflow_d <= ring_oflow;

	 if(dma_clear_reset) begin
	    set_tx_ring_oflow_dma <= 1'b0;
	    oflow_error <= 1'b0;
         end else if(ring_oflow &~ring_oflow_d) begin
	    set_tx_ring_oflow_dma <= 1'b1;
	    oflow_error <= 1'b1;
         end else set_tx_ring_oflow_dma <= 1'b0;
      end // else: !if(!Reset_L)
   end // always@ (posedge SysClk)
   
   // This logic can be taken out-- TOADS This is used by TxCif files
   
   always@(posedge SysClk )
     if (!Reset_L) begin
	DMA_RingCurrentPtr <= `PTR_WIDTH'h0;
	DMA_RingCurrentPtrWrap <= 1'b0;
     end else if(xlate_done | dma_clear_reset ) begin
	DMA_RingCurrentPtr <= `PTR_WIDTH'h0;
	DMA_RingCurrentPtrWrap <= 1'b0;
     end else if(inc_DMAHeadShadow) begin // if (xlate_done)
	// Take care of wrap around cases
	if(DMA_RingCurrentPtr == (DMA_RingLength - `PTR_WIDTH'b1) ) begin
	   DMA_RingCurrentPtr <= `PTR_WIDTH'h0;
	   DMA_RingCurrentPtrWrap <= ~DMA_RingCurrentPtrWrap; 
	end else begin
	   DMA_RingCurrentPtr <= DMA_RingCurrentPtr + `PTR_WIDTH'b1;
	   DMA_RingCurrentPtrWrap <= DMA_RingCurrentPtrWrap; 
	end // else: !if(DMA_RingCurrentPtr == DMA_RingLength )
     end // if (inc_DMAHeadShadow)

   assign DMA_RingTailWrap = tx_rng_tail_dma[`PTR_WIDTH];
   
   
   assign DMACacheEntryValid = ( ~ ( ( DMA_RingCurrentPtrWrap == DMA_RingTailWrap ) &  
				   (  DMA_RingCurrentPtr == tx_rng_tail_dma[`PTR_WIDTH -1 :0] ) ) ) & DMAActive ; // Check exact width
   
   

   always@(posedge SysClk )
     if (!Reset_L) begin
        DMA_CacheShadowWritePtr <=4'h0;
     end else if(flush_dma_cache) begin
        DMA_CacheShadowWritePtr <=4'h0;
     end else if(updateCacheContext ) begin 
	DMA_CacheShadowWritePtr <= IncrTxCachePtr(DMA_CacheShadowWritePtr,NoOfCacheWritesDispatched);
     end // if (updateCacheContext)
   

   assign FetchMoreDMA =  ~ ( ( ShadowRingCurrentPtrWrap_DMA == DMA_RingTailWrap ) &  
			      (ShadowRingCurrentPtr_DMA   == tx_rng_tail_dma[`PTR_WIDTH -1 :0] ) );

   assign dmc_txc_dma_active = DMAActive ;

   always@(posedge SysClk )
     if(!Reset_L)begin
        DMA_EofList <= 1'b1;
     end else begin
        DMA_EofList <= ~DMACacheEntryValid;
     end // else: !if(!Reset_L)
   
   assign  dmc_txc_dma_eoflist =DMA_EofList; 
   assign  DMAActive = ~tx_dma_cfg_dma_stall;
   assign  DMA_EmptySpace= (DMA_CacheShadowWritePtr[3]^DMA_CacheReadPtr[3]) ? 
			   ( {1'b0,DMA_CacheReadPtr[2:0]} - {1'b0,DMA_CacheShadowWritePtr[2:0]}) :
			   ( 4'h8 - {1'b0,DMA_CacheShadowWritePtr[2:0]} + {1'b0,DMA_CacheReadPtr[2:0]}) ;
   assign  DMA_Cache_SpaceAvailable = ( (DMA_EmptySpace >4'h3) ? 1'b1: 1'b0 ) | 
	   			      ( (dmc_txc_dma_partial & (DMA_EmptySpace >4'h0)) ? 1'b1:1'b0  );
   always@(posedge SysClk )
     if(!Reset_L) begin
        ReceivedDMAKick <= 1'b0;
        tx_dma_cfg_dma_stall_d <= 1'b0;
	ld_TxCacheAddress_dma <= 1'b0;
	DMA_ReqPending_d <= 1'b0;
     end else begin
        tx_dma_cfg_dma_stall_d <= tx_dma_cfg_dma_stall;
        ReceivedDMAKick  <= (!tx_dma_cfg_dma_stall & tx_dma_cfg_dma_stall_d) | ( ReceivedDMAKick & ~ClearDMAKick);
	ld_TxCacheAddress_dma <= ~tx_dma_cfg_dma_stall & tx_dma_cfg_dma_stall_d;
	DMA_ReqPending_d <= DMA_ReqPending;
     end // else: !if(!Reset_L)


   
   assign DMA_AvailableFor_Fetch = ( ( FetchMoreDMA & ReceivedDMAKick & DMA_Cache_SpaceAvailable ) | ( FetchMoreDMA &  DMA_Cache_SpaceAvailable)) 
  				    & DMAActive & ~stop_fetch_descriptors & ~page_xlate_error & ~dma_stopped & xlate_valid & ~DMA_ReqPending_d & ~oflow_error;

   // DMA
   always@(posedge SysClk )
     if (!Reset_L) begin
        DMA_ReqPending <=1'h0;
	DMA_Anchor_Address <= 4'h0;
     end else if(updateCacheContext ) begin
	DMA_ReqPending <= 1'b1;
	DMA_Anchor_Address <= meta_req_address[7:4];
     end else if(updateCacheWritePtrs | receivedErrorResp  ) begin
	/* This should be write confirm signal based upon transaction complete */
	DMA_ReqPending <= 1'b0;
     end // if (updateCacheWritePtrs & (meta_resp_dma_num ==DMA_CHANNEL_NUMBER) )
   
   assign DMA_EntryUpdateCollision = inc_DMAHeadShadow & updateCacheWritePtrs;

   always@(posedge SysClk )
     if (!Reset_L)  begin
        DMA_EntriesValid <= 5'h0;
     end else begin // if (!Reset_L)
        if(flush_dma_cache) begin
           DMA_EntriesValid <= 5'h0;
        end else if(~DMA_EntryUpdateCollision & updateCacheWritePtrs) begin
           DMA_EntriesValid <= DMA_EntriesValid   + NoOfValidEntries;
        end // if (~DMA_EntryUpdateCollision & (updateCacheWritePtrs & (meta_resp_dma_num ==DMA_CHANNEL_NUMBER) ) begin...
        else if( ~DMA_EntryUpdateCollision & inc_DMAHeadShadow ) begin
           DMA_EntriesValid <= DMA_EntriesValid   -  5'h1;
        end // if ( ~DMA_EntryUpdateCollision & IncrDMARdPtr)
        else if(DMA_EntryUpdateCollision) begin
	   DMA_EntriesValid <= DMA_EntriesValid   + NoOfValidEntries - 5'h1;
        end else begin
           DMA_EntriesValid <= DMA_EntriesValid;
        end // else: !if(DMA_EntryUpdateCollision)
     end // else: !if(!Reset_L)


   // DMA
   // assign DMA_CacheFull = (DMA_CacheReadPtr[2:0] ==  DMA_CacheWritePtr[2:0]) & (DMA_CacheReadPtr[3]^DMA_CacheWritePtr[3]) ;
   assign DMA_CacheEmpty = (DMA_CacheReadPtr[2:0] ==  DMA_CacheWritePtr[2:0]) &~ (DMA_CacheReadPtr[3]^DMA_CacheWritePtr[3]);

   always@(posedge SysClk )
     if (!Reset_L)  begin
        DMA_CacheWritePtr <=4'h0;
     end else begin
        if(flush_dma_cache) begin
           DMA_CacheWritePtr <=4'h0;
        end else if(updateCacheWritePtrs) begin 
           DMA_CacheWritePtr  <= DMA_CacheShadowWritePtr;
        end // if (updateCacheWritePtrs)
     end // else: !if(!Reset_L)
   
   always@(posedge SysClk )
     if (!Reset_L)  begin
        DMA_CacheReadPtr <=4'h0;
     end else begin // if (!Reset_L)
        if(IncrDMARdPtr) begin
           DMA_CacheReadPtr <=  IncrTxCachePtr(DMA_CacheReadPtr,4'h1);
        end else if(flush_dma_cache ) begin // if (IncrDMARdPtr)
           DMA_CacheReadPtr <=4'h0;
        end else if(ResetDMARdPtr ) begin // if (IncrDMARdPtr)
           DMA_CacheReadPtr <= DMA_CacheWritePtr;
        end // if (ResetDMARdPtr)
     end // else: !if(!Reset_L)




   // DMA_31 Offset Calculations
   always@( meta_resp_address or DMA_Anchor_Address  or DMA_CacheWritePtr) begin
      DMA_CacheReOrderOffset = ( meta_resp_address[2:0] >= DMA_Anchor_Address[2:0]  ) ? 
			       ( {1'b0,meta_resp_address[2:0]} - {1'b0,DMA_Anchor_Address[2:0]} ) :
			       ( 4'h8 + {1'b0,meta_resp_address[2:0]} - {1'b0,DMA_Anchor_Address[2:0]} );
      DMA_CacheWritePtrReOrder = IncrTxCachePtr(DMA_CacheWritePtr, DMA_CacheReOrderOffset);
   end
   

   /* DMA Reset logic - */

   //TODO-
   // PIO Write Collisions
   // Knowing what is the state of pending scheduling info
   // 
   assign reset_asserted = tx_dma_cfg_dma_rst;
   assign tx_dma_cfg_dma_stop_state = dma_stopped;
   assign pkt_counts_equal = ( {DMA_RingCurrentPtrWrap,DMA_RingCurrentPtr} == tx_rng_head_dma[`PTR_WIDTH:0] );
   
   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 dma_stopped <= 1'b0;
	 tx_dma_cfg_dma_stop_d <= 1'b0;
	 restart_asserted <= 1'b0;
	 stop_asserted <= 1'b0;
      end else begin
	 tx_dma_cfg_dma_stop_d <= tx_dma_cfg_dma_stop;
	 stop_asserted  <= (tx_dma_cfg_dma_stop & ~tx_dma_cfg_dma_stop_d) | ( stop_asserted & ~set_stop_state);
	 restart_asserted <= ~tx_dma_cfg_dma_stop & tx_dma_cfg_dma_stop_d;
	 dma_stopped <= set_stop_state | (dma_stopped & ~restart_asserted);
      end
   end // always@ (posedge SysClk)
   

   

   always@(posedge SysClk) begin
      if(!Reset_L) begin
	 DMA_ResetSM <= RESET_IDLE;
	 dma_reset_scheduled <= 1'b0;
	 stop_fetch_descriptors <= 1'b0;
	 dma_clear_reset <= 1'b0;
	 flush_dma_cache <= 1'b0;
	 set_stop_state <= 1'b0;
      end else begin
	 case(DMA_ResetSM)
	   RESET_IDLE: begin
	      dma_reset_scheduled <= 1'b0;
	      flush_dma_cache <= 1'b0;
	      stop_fetch_descriptors <= 1'b0;
	      dma_clear_reset <= 1'b0;
	      set_stop_state <= 1'b0;
	      if(reset_asserted | stop_asserted ) begin
		 if(!DMAActive) begin 
	            if(reset_asserted) begin
		      DMA_ResetSM <= WAIT_FOR_PKT_DONE;
		    end  else begin
		      DMA_ResetSM <= RESET_IDLE;
		      set_stop_state <= 1'b1;
	         end
		 end else begin
		    DMA_ResetSM <= WAIT_FOR_DONE;
		    dma_reset_scheduled <= 1'b1;
		 end // else: !if(!DMAActive)
	      end // if (reset_asserted | stop_asserted )
	   end // case: RESET_IDLE
	   WAIT_FOR_DONE: begin
	      if(dma_reset_done_hold) begin
		 DMA_ResetSM <= WAIT_FOR_RESP;
		 stop_fetch_descriptors <= 1'b1;
	      end else begin
		 DMA_ResetSM <= WAIT_FOR_DONE; 
	      end // else: !if(!dma_reset_done)
	   end // case: WAIT_FOR_DONE
	   WAIT_FOR_RESP: begin
	     if(!DMA_ReqPending) begin
		DMA_ResetSM <= WAIT_FOR_PKT_DONE;
 	     end else begin
		DMA_ResetSM <= WAIT_FOR_RESP;
	     end
	   end
	   WAIT_FOR_PKT_DONE: begin
	      if(pkt_counts_equal) begin
		 DMA_ResetSM <= FLUSH_STATES;
		 dma_reset_scheduled <= 1'b0;
		 if(reset_asserted) begin
		    flush_dma_cache <= 1'b1;
		    dma_clear_reset <= 1'b1;
		 end // if (reset_asserted)
		if(stop_asserted)
		   set_stop_state <= 1'b1;
	      end else begin
		 DMA_ResetSM <= WAIT_FOR_PKT_DONE;
	      end // else: !if(pkt_counts_equal)
	   end // case: WAIT_FOR_PKT_DONE
	   FLUSH_STATES: begin
	      // clear caches, clear reset bit etc
	      flush_dma_cache <= 1'b0;
	      dma_clear_reset <= 1'b0;
	      set_stop_state <= 1'b0;
	      dma_reset_scheduled <= 1'b0;
	      DMA_ResetSM <= RESET_IDLE;
	   end
	 endcase // case(DMA_ResetSM)
      end // else: !if(!Reset_L)
   end
   


assign dma_debug_port = {3'h0,dmc_txc_dma_cacheready,dmc_txc_dma_partial,stop_fetch_descriptors,FetchMoreDMA,DMA_AvailableFor_Fetch,DMA_Cache_SpaceAvailable,
		         DMA_ReqPending,DMACacheEntryValid,DMA_EmptySpace,DMA_EntriesValid,DMA_ResetSM,DMA_CacheReadPtr,DMA_CacheWritePtr};
// DMA_CacheWritePtr  Cache Write Pointer Updated only after transfer_complete is received bit 3 is used for  wrap_arounds
// DMA_CacheReadPtr   Cache Read Pointer Updated based upon number of getNextDesc signals from TXC bit3 is used for  wrap_arounds
// DMA_ResetSM        DMA Reset/Stop State Machine
// DMA_EntriesValid   Number of descriptors currently within the cache - Max of 16 
// DMA_EmptySpace     Indicates how much Space is available withing the cache. Computed based upon ( ShadowWritePtr - ReadPtr)
// DMACacheEntryValid Compares current local ringptr with software tail pointer 
// DMA_ReqPending     Pending Request Flag
// DMA_Cache_SpaceAvailable Is Space available for new requests?
// DMA_AvailableFor_Fetch - This triggers a new descriptor fetch, function of new kicks, space availble and any errors
// FetchMoreDMA       ShadowHead Pointer and tail pointer difference indicator.
// stop_fetch_descriptors - Function of reaset/stop issued by Software. This needs to be cleared for any new fetch requests
// dmc_txc_dma_partial - Partial signal to TXC
   
endmodule

/* -- algorithm for page table translation
 if( ~page0_valid & ~page1_valid ){
 set_error();
 }
 
 if(page0_valid) { // check page0 match
 mask0 = page0_mask;
 value0 = page0_value;
 reloc0 = page0_reloc;
 if( (mask0 & address[43:12] )  == (value0)) {
 page0_match = 1;
 page1_match = 0;

 }
 }
 if(page1_valid & ~page0_match) {// check page1 match
 mask1 = page1_mask;
 value1 = page1_value;
 reloc1 = page1_reloc;
 if( (mask1 & address[43:12] )  == (value1)) {
 page1_match = 1;
 page0_match = 0;

 }
 } 
 
 // Calculate new address
 if(page0_match) {
 new_address[43:12] = (address[43:12] & ~mask0) | ( reloc0 & mask0) ;
 new_address[11:0]  = address[11:0];
 } else if(page1_match) {
 new_address[43:12] = (address[43:12] & ~mask1) | ( reloc1 & mask1) ;
 new_address[11:0]  = address[11:0];
 } else {
 new_address  = address; // no change
 }

 */







