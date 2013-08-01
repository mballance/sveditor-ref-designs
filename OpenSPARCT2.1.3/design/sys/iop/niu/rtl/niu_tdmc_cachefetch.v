// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_tdmc_cachefetch.v
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


`include "txc_defines.h"
`include "niu_dmc_reg_defines.h"

module niu_tdmc_cachefetch ( /*AUTOARG*/
   // Outputs
   choose_available_dmas, updateCacheContext, DMC_TxCache_SMX_Req, 
   DMC_TxCache_SMX_Req_Port_Num, DMC_TxCache_SMX_Req_Address, 
   DMA_UpdateAddress, DMC_TxCache_SMX_Req_Length, 
   tdmc_arb1_req_func_num, DMC_TxCache_SMX_Req_Cmd, 
   DMC_TxCache_SMX_Req_DMA_Num, LatchDMAPtrs, DMANumToReq, 
   NoOfCacheWritesDispatched, DMAs_AvailableFor_Fetch, 
   TxCacheFetchState, 
   // Inputs
   SysClk, Reset_L, DMA0_AvailableFor_Fetch, DMA1_AvailableFor_Fetch, 
   DMA2_AvailableFor_Fetch, DMA3_AvailableFor_Fetch, 
   DMA4_AvailableFor_Fetch, DMA5_AvailableFor_Fetch, 
   DMA6_AvailableFor_Fetch, DMA7_AvailableFor_Fetch, 
   DMA8_AvailableFor_Fetch, DMA9_AvailableFor_Fetch, 
   DMA10_AvailableFor_Fetch, DMA11_AvailableFor_Fetch, 
   DMA12_AvailableFor_Fetch, DMA13_AvailableFor_Fetch, 
   DMA14_AvailableFor_Fetch, DMA15_AvailableFor_Fetch, 
   DMA16_AvailableFor_Fetch, DMA17_AvailableFor_Fetch, 
   DMA18_AvailableFor_Fetch, DMA19_AvailableFor_Fetch, 
   DMA20_AvailableFor_Fetch, DMA21_AvailableFor_Fetch, 
   DMA22_AvailableFor_Fetch, DMA23_AvailableFor_Fetch, 
   DMA0_ReqPending, DMA1_ReqPending, DMA2_ReqPending, 
   DMA3_ReqPending, DMA4_ReqPending, DMA5_ReqPending, 
   DMA6_ReqPending, DMA7_ReqPending, DMA8_ReqPending, 
   DMA9_ReqPending, DMA10_ReqPending, DMA11_ReqPending, 
   DMA12_ReqPending, DMA13_ReqPending, DMA14_ReqPending, 
   DMA15_ReqPending, DMA16_ReqPending, DMA17_ReqPending, 
   DMA18_ReqPending, DMA19_ReqPending, DMA20_ReqPending, 
   DMA21_ReqPending, DMA22_ReqPending, DMA23_ReqPending, ArbDone, 
   DMANumToReqArbOut, DMANumToUpdate, SMX_DMC_TxCache_Req_Ack, 
   NoOfFreeSpaceInCache, ShadowRingWrap, DMA_AddressToReq_ff, 
   dmc_txc_tx_addr_md, NoOfDescInMem, NoOfDescLeft, 
   dmc_txc_dma0_func_num, dmc_txc_dma1_func_num, 
   dmc_txc_dma2_func_num, dmc_txc_dma3_func_num, 
   dmc_txc_dma4_func_num, dmc_txc_dma5_func_num, 
   dmc_txc_dma6_func_num, dmc_txc_dma7_func_num, 
   dmc_txc_dma8_func_num, dmc_txc_dma9_func_num, 
   dmc_txc_dma10_func_num, dmc_txc_dma11_func_num, 
   dmc_txc_dma12_func_num, dmc_txc_dma13_func_num, 
   dmc_txc_dma14_func_num, dmc_txc_dma15_func_num, 
   dmc_txc_dma16_func_num, dmc_txc_dma17_func_num, 
   dmc_txc_dma18_func_num, dmc_txc_dma19_func_num, 
   dmc_txc_dma20_func_num, dmc_txc_dma21_func_num, 
   dmc_txc_dma22_func_num, dmc_txc_dma23_func_num
   );

   input SysClk;
   input Reset_L;
   

   input DMA0_AvailableFor_Fetch;
   input DMA1_AvailableFor_Fetch;
   input DMA2_AvailableFor_Fetch;
   input DMA3_AvailableFor_Fetch;
   input DMA4_AvailableFor_Fetch;
   input DMA5_AvailableFor_Fetch;
   input DMA6_AvailableFor_Fetch;
   input DMA7_AvailableFor_Fetch;
   input DMA8_AvailableFor_Fetch;
   input DMA9_AvailableFor_Fetch;
   input DMA10_AvailableFor_Fetch;
   input DMA11_AvailableFor_Fetch;
   input DMA12_AvailableFor_Fetch;
   input DMA13_AvailableFor_Fetch;
   input DMA14_AvailableFor_Fetch;
   input DMA15_AvailableFor_Fetch;
   input DMA16_AvailableFor_Fetch;
   input DMA17_AvailableFor_Fetch;
   input DMA18_AvailableFor_Fetch;
   input DMA19_AvailableFor_Fetch;
   input DMA20_AvailableFor_Fetch;
   input DMA21_AvailableFor_Fetch;
   input DMA22_AvailableFor_Fetch;
   input DMA23_AvailableFor_Fetch;


   input DMA0_ReqPending;
   input DMA1_ReqPending;
   input DMA2_ReqPending;
   input DMA3_ReqPending;
   input DMA4_ReqPending;
   input DMA5_ReqPending;
   input DMA6_ReqPending;
   input DMA7_ReqPending;
   input DMA8_ReqPending;
   input DMA9_ReqPending;
   input DMA10_ReqPending;
   input DMA11_ReqPending;
   input DMA12_ReqPending;
   input DMA13_ReqPending;
   input DMA14_ReqPending;
   input DMA15_ReqPending;
   input DMA16_ReqPending;
   input DMA17_ReqPending;
   input DMA18_ReqPending;
   input DMA19_ReqPending;
   input DMA20_ReqPending;
   input DMA21_ReqPending;
   input DMA22_ReqPending;
   input DMA23_ReqPending;
 

   
   input ArbDone;
   input [4:0] DMANumToReqArbOut;
   input [31 :0] DMANumToUpdate;
   input 	SMX_DMC_TxCache_Req_Ack;

   input [4:0] 	NoOfFreeSpaceInCache;
   input 	ShadowRingWrap;
   input [63:0] DMA_AddressToReq_ff;
   input 	dmc_txc_tx_addr_md;
   
   input [`PTR_WIDTH - 1 :0] NoOfDescInMem;
   input [`PTR_WIDTH - 1 :0] NoOfDescLeft;

   output 	choose_available_dmas;
   output [`NO_OF_DMAS -1 :0] updateCacheContext;
   output 	 DMC_TxCache_SMX_Req;
   output [1:0]  DMC_TxCache_SMX_Req_Port_Num ;
   output [63:0] DMC_TxCache_SMX_Req_Address;
   output [43:0] DMA_UpdateAddress;
   output [13:0] DMC_TxCache_SMX_Req_Length ;
   output [1:0] tdmc_arb1_req_func_num;
   output [7:0]  DMC_TxCache_SMX_Req_Cmd;
   output [4:0]  DMC_TxCache_SMX_Req_DMA_Num ;
   output 	 LatchDMAPtrs;
   output [4:0]  DMANumToReq;
   output [3:0]  NoOfCacheWritesDispatched;
   output [31:0] DMAs_AvailableFor_Fetch;

   
   output [3:0]  TxCacheFetchState;


   // function numbers for requests to meta

   input [1:0] 	 dmc_txc_dma0_func_num;
   input [1:0]  dmc_txc_dma1_func_num;
   input [1:0]  dmc_txc_dma2_func_num;
   input [1:0]  dmc_txc_dma3_func_num;
   input [1:0]  dmc_txc_dma4_func_num;
   input [1:0]  dmc_txc_dma5_func_num;
   input [1:0]  dmc_txc_dma6_func_num;
   input [1:0]  dmc_txc_dma7_func_num;
   input [1:0]  dmc_txc_dma8_func_num;
   input [1:0]  dmc_txc_dma9_func_num;
   input [1:0]  dmc_txc_dma10_func_num;
   input [1:0]  dmc_txc_dma11_func_num;
   input [1:0]  dmc_txc_dma12_func_num;
   input [1:0]  dmc_txc_dma13_func_num;
   input [1:0]  dmc_txc_dma14_func_num;
   input [1:0]  dmc_txc_dma15_func_num;
   input [1:0]  dmc_txc_dma16_func_num;
   input [1:0]  dmc_txc_dma17_func_num;
   input [1:0]  dmc_txc_dma18_func_num;
   input [1:0]  dmc_txc_dma19_func_num;
   input [1:0]  dmc_txc_dma20_func_num;
   input [1:0]  dmc_txc_dma21_func_num;
   input [1:0]  dmc_txc_dma22_func_num;
   input [1:0]  dmc_txc_dma23_func_num;


   reg 		 choose_available_dmas;
   reg [`NO_OF_DMAS -1 :0] updateCacheContext;
   reg 		 DMC_TxCache_SMX_Req;
   reg [1:0] 	 DMC_TxCache_SMX_Req_Port_Num ;
   reg [63:0] 	 DMC_TxCache_SMX_Req_Address;
   reg [13:0] 	 DMC_TxCache_SMX_Req_Length ;
   reg [7:0] 	 DMC_TxCache_SMX_Req_Cmd;
   reg [4:0] 	 DMC_TxCache_SMX_Req_DMA_Num ;
   reg 		 LatchDMAPtrs;
   reg 		 CheckDMAReqSize;
   reg [4:0] 	 DMANumToReq;
   reg [43:0] 	 DMA_UpdateAddress;

   reg 		 dma_req_pending;
   reg [3:0] 	 NoOfCacheWritesDispatched;
   

   
   reg [13:0] 	 DMA_BytesToReq;
   reg [63:0] 	 DMA_AddressToReq;
   reg [3:0] 	 TxCacheFetchState;
   reg 		 UpdateTxCache;
   reg [31:0] 	 DMAs_AvailableFor_Fetch;
   wire [31:0] 	 DMAs_AvailableFor_Fetch_pre;
   reg [`NO_OF_DMAS -1:0] 	 UpdateDMAs;

   reg [1:0] func_num;
   reg [1:0] tdmc_arb1_req_func_num;

   /*--------------------------------------------------------------*/
   // Parameters and Defines
   /*--------------------------------------------------------------*/
   parameter 	 TXCACHE_FETCH_IDLE          = 4'h0,
		 ARB_FOR_DMAS   = 4'h1,
		 CHECK_PENDING_REQS = 4'h2,
		 LATCH_PTRS     = 4'h3,
		 EVAL_REQ_SIZE  = 4'h4,
		 REQ_TX_CACHE         = 4'h5,
		 WAIT_FOR_REQ_ACCEPT          = 4'h6,
		 TXCACHE_UPDATE_STATE = 4'h7;
   
//VCS coverage off
	
   // synopsys translate_off
   reg [192:1] 	 CACHE_DATA_FETCH_STATE;

   always @(TxCacheFetchState)
     begin
	case(TxCacheFetchState)
	  TXCACHE_FETCH_IDLE :      CACHE_DATA_FETCH_STATE = "TXCACHE_FETCH_IDLE";
	  ARB_FOR_DMAS:             CACHE_DATA_FETCH_STATE = "ARB_FOR_DMAS";
	  CHECK_PENDING_REQS:       CACHE_DATA_FETCH_STATE = "CHECK_PENDING_REQS";
          LATCH_PTRS:               CACHE_DATA_FETCH_STATE = "LATCH_PTRS";
          EVAL_REQ_SIZE:            CACHE_DATA_FETCH_STATE = "EVAL_REQ_SIZE";
	  REQ_TX_CACHE :            CACHE_DATA_FETCH_STATE = "REQ_TX_CACHE";
	  WAIT_FOR_REQ_ACCEPT :     CACHE_DATA_FETCH_STATE = "WAIT_FOR_REQ_ACCEPT";
	  TXCACHE_UPDATE_STATE :     CACHE_DATA_FETCH_STATE = "TXCACHE_UPDATE_STATE";
	  default :                 CACHE_DATA_FETCH_STATE = "UNKNOWN";
	endcase
     end
   // synopsys translate_on
//VCS coverage on

   // New pointer manipulation logic
   function [13:0] minimum ;
      input [18:0] A;
      input [18:0] B;
      begin
	 if(A >= B)
	   minimum = B[13:0] ;
	 else minimum = A[13:0] ;
      end
   endfunction // minimum
   
   // Determine if this request address is 8bytes aligned
   // if so the response would need one additional entry in the
   // cache. So take care of this additional entry
   wire [4:0]  AlignedFreeSpaceInCache = ( DMA_AddressToReq_ff[3] & ( NoOfFreeSpaceInCache>  5'h1)) ? 
	   					( NoOfFreeSpaceInCache - 5'h1) : NoOfFreeSpaceInCache;
   always@(posedge SysClk ) 
     if (!Reset_L) begin
	DMA_BytesToReq <= 14'h0;
	DMA_AddressToReq<= 64'h0; 
     end else begin
	if(CheckDMAReqSize) begin // ???
	   if(ShadowRingWrap ) begin
	      DMA_BytesToReq <= minimum ( {NoOfDescLeft[15:0],3'h0},  { 11'h0, AlignedFreeSpaceInCache, 3'h0} );
	   end else begin
	      DMA_BytesToReq <= minimum ( {NoOfDescInMem[15:0] ,3'h0}, {  11'h0, AlignedFreeSpaceInCache,3'h0} );
	   end // else: !if(ShadowRingWrap )
	   DMA_AddressToReq<= DMA_AddressToReq_ff; 
	end
     end // else: !if(!Reset_L)
   
   
   
   /* -----\/----- EXCLUDED -----\/-----
    assign DMAs_AvailableFor_Fetch = {DMA31_AvailableFor_Fetch, DMA30_AvailableFor_Fetch, DMA29_AvailableFor_Fetch, DMA28_AvailableFor_Fetch, 
    DMA27_AvailableFor_Fetch, DMA26_AvailableFor_Fetch, DMA25_AvailableFor_Fetch, DMA24_AvailableFor_Fetch, 
    DMA23_AvailableFor_Fetch, DMA22_AvailableFor_Fetch, DMA21_AvailableFor_Fetch, DMA20_AvailableFor_Fetch,
    DMA19_AvailableFor_Fetch, DMA18_AvailableFor_Fetch, DMA17_AvailableFor_Fetch, DMA16_AvailableFor_Fetch, 
    DMA15_AvailableFor_Fetch, DMA14_AvailableFor_Fetch, DMA13_AvailableFor_Fetch, DMA12_AvailableFor_Fetch, 
    DMA11_AvailableFor_Fetch, DMA10_AvailableFor_Fetch, DMA9_AvailableFor_Fetch, DMA8_AvailableFor_Fetch, 
    DMA7_AvailableFor_Fetch, DMA6_AvailableFor_Fetch, DMA5_AvailableFor_Fetch, DMA4_AvailableFor_Fetch, 
    DMA3_AvailableFor_Fetch, DMA2_AvailableFor_Fetch, DMA1_AvailableFor_Fetch, DMA0_AvailableFor_Fetch };
    -----/\----- EXCLUDED -----/\----- */
   assign DMAs_AvailableFor_Fetch_pre = {8'h0,
				     DMA23_AvailableFor_Fetch, DMA22_AvailableFor_Fetch, DMA21_AvailableFor_Fetch, DMA20_AvailableFor_Fetch,
				     DMA19_AvailableFor_Fetch, DMA18_AvailableFor_Fetch, DMA17_AvailableFor_Fetch, DMA16_AvailableFor_Fetch, 
				     DMA15_AvailableFor_Fetch, DMA14_AvailableFor_Fetch, DMA13_AvailableFor_Fetch, DMA12_AvailableFor_Fetch, 
				     DMA11_AvailableFor_Fetch, DMA10_AvailableFor_Fetch, DMA9_AvailableFor_Fetch, DMA8_AvailableFor_Fetch, 
				     DMA7_AvailableFor_Fetch, DMA6_AvailableFor_Fetch, DMA5_AvailableFor_Fetch, DMA4_AvailableFor_Fetch, 
				     DMA3_AvailableFor_Fetch, DMA2_AvailableFor_Fetch, DMA1_AvailableFor_Fetch, DMA0_AvailableFor_Fetch };



   always@(posedge SysClk )
     if(!Reset_L) 
       UpdateTxCache <= 1'b0;
     else 
       UpdateTxCache <= |DMAs_AvailableFor_Fetch_pre; 
   
   
   

   
   always@(posedge SysClk )
     if (!Reset_L) begin
	TxCacheFetchState <= TXCACHE_FETCH_IDLE;
	choose_available_dmas <= 1'b0;
	updateCacheContext <= `NO_OF_DMAS'b0;
	DMC_TxCache_SMX_Req <= 1'b0;
	DMC_TxCache_SMX_Req_Port_Num <= 2'b0;
	DMC_TxCache_SMX_Req_Address <= 64'b0;
	DMA_UpdateAddress <= 44'b0;
	DMC_TxCache_SMX_Req_Length <= 14'b0;
	DMC_TxCache_SMX_Req_Cmd <= 8'b0;
	DMC_TxCache_SMX_Req_DMA_Num  <= 5'b0;
	tdmc_arb1_req_func_num <= 2'h0;
	LatchDMAPtrs <= 1'b0;
	CheckDMAReqSize <= 1'b0;
	DMANumToReq <= 5'h0;
	NoOfCacheWritesDispatched <= 4'h0;	
	DMAs_AvailableFor_Fetch <= 32'h0;

     end else begin
	case(TxCacheFetchState) // synopsys full_case parallel_case
	  TXCACHE_FETCH_IDLE: begin
	     updateCacheContext <= `NO_OF_DMAS'b0;
	     DMANumToReq <= 5'h0;
	     DMA_UpdateAddress <= 44'b0;
	     DMC_TxCache_SMX_Req_Length <= 14'b0;
	     if(UpdateTxCache) begin
		DMAs_AvailableFor_Fetch <= DMAs_AvailableFor_Fetch_pre;
		TxCacheFetchState <= ARB_FOR_DMAS;
		choose_available_dmas <= 1'b1;
	     end else begin // if (UpdateTxCache)
		TxCacheFetchState <= TXCACHE_FETCH_IDLE;
		choose_available_dmas <= 1'b0;
	     end // else: !if(UpdateTxCache)
	  end // case: TXCACHE_FETCH_IDLE
	  ARB_FOR_DMAS: begin
	     if(ArbDone) begin
		// Need another signal here to indicated DMA has been scheduled
		// This will be used by the reset state machine -- TOADS
		
		DMANumToReq <= DMANumToReqArbOut;
		UpdateDMAs  <= DMANumToUpdate[`NO_OF_DMAS -1 :0];
		DMAs_AvailableFor_Fetch <= 32'h0;
		choose_available_dmas <= 1'b0;
		TxCacheFetchState <= CHECK_PENDING_REQS;
	     end // if (ArbDone)
	     else begin
		TxCacheFetchState <= ARB_FOR_DMAS;
	     end // else: !if(ArbDone)
	  end // case: ARB_FOR_DMAS
	  CHECK_PENDING_REQS: begin
	     if(dma_req_pending) begin
		TxCacheFetchState <= TXCACHE_FETCH_IDLE;
		// go back and rearbitrate
	     end else begin
		TxCacheFetchState <= LATCH_PTRS;
		LatchDMAPtrs <= 1'b1;
	     end
	  end
	  LATCH_PTRS: begin
	     LatchDMAPtrs <= 1'b0;
	     TxCacheFetchState <= EVAL_REQ_SIZE;
	     CheckDMAReqSize <= 1'b1;
	  end
	  EVAL_REQ_SIZE: begin
	     CheckDMAReqSize <= 1'b0;
	     TxCacheFetchState <= REQ_TX_CACHE;
	  end
	  REQ_TX_CACHE: begin
	     DMC_TxCache_SMX_Req <= 1'b1;
	     tdmc_arb1_req_func_num <= func_num;
	     DMC_TxCache_SMX_Req_Address <= DMA_AddressToReq;
	     // added--
	     DMA_UpdateAddress <= DMA_AddressToReq[43:0] + {30'h0,DMA_BytesToReq};
	     // DMC_TxCache_SMX_Req_Length <= 14'd64;
	     DMC_TxCache_SMX_Req_Length <= DMA_BytesToReq;

	     NoOfCacheWritesDispatched <= (DMA_AddressToReq[3 ] | DMA_BytesToReq[3] ) ? 
					  ( {1'b0,DMA_BytesToReq[6:4]} +4'b1):
					  DMA_BytesToReq[7:4] ;

	     DMC_TxCache_SMX_Req_Cmd <= dmc_txc_tx_addr_md ? `TXC_MEM_READ_BYPASS_32 : `TXC_MEM_READ_BYPASS_64;
	     DMC_TxCache_SMX_Req_DMA_Num <= DMANumToReq;
	     choose_available_dmas <= 1'b0;
	     TxCacheFetchState <= WAIT_FOR_REQ_ACCEPT;
	     updateCacheContext <= UpdateDMAs [ `NO_OF_DMAS -1: 0];
	  end
	  WAIT_FOR_REQ_ACCEPT: begin
	     updateCacheContext <= `NO_OF_DMAS'b0;
	     if (SMX_DMC_TxCache_Req_Ack) begin
		DMC_TxCache_SMX_Req <= 1'b0; 
		TxCacheFetchState <= TXCACHE_UPDATE_STATE;
	     end
	  end // case: WAIT_FOR_REQ_ACCEPT
	  TXCACHE_UPDATE_STATE: begin
	     TxCacheFetchState <= TXCACHE_FETCH_IDLE;
	     updateCacheContext <= `NO_OF_DMAS'b0;
	  end // case: TXCACHE_UPDATE_STATE
	  default: begin
	     TxCacheFetchState <= TXCACHE_FETCH_IDLE;
	     choose_available_dmas <= 1'b0;
	     updateCacheContext <= `NO_OF_DMAS'b0;
	     DMC_TxCache_SMX_Req <= 1'b0;
	     DMC_TxCache_SMX_Req_Port_Num <= 2'b0;
	     DMC_TxCache_SMX_Req_Address <= 64'b0;
	     DMA_UpdateAddress <= 44'b0;
	     DMC_TxCache_SMX_Req_Length <= 14'b0;
	     DMC_TxCache_SMX_Req_Cmd <= 8'b0;
	     DMC_TxCache_SMX_Req_DMA_Num  <= 5'b0;
	     tdmc_arb1_req_func_num <= 2'h0;
	     LatchDMAPtrs <= 1'b0;
	     CheckDMAReqSize <= 1'b0;
	     DMANumToReq <= 5'h0;
	     NoOfCacheWritesDispatched <= 4'h0;	
	     DMAs_AvailableFor_Fetch <= 32'h0;
	  end
	endcase // case(TxCacheFetchState)
     end // else: !if(!Reset_L)
   
   // move this to a common module which interfaces all the dmas
   // Q? Will this meet timing?

   always@(/*AUTOJUNK*/DMA0_ReqPending or DMA10_ReqPending
	   or DMA11_ReqPending or DMA12_ReqPending or DMA13_ReqPending
	   or DMA14_ReqPending or DMA15_ReqPending or DMA16_ReqPending
	   or DMA17_ReqPending or DMA18_ReqPending or DMA19_ReqPending
	   or DMA1_ReqPending or DMA20_ReqPending or DMA21_ReqPending
	   or DMA22_ReqPending or DMA23_ReqPending 
	   or DMA3_ReqPending or DMA2_ReqPending
	   or DMA4_ReqPending or DMA5_ReqPending or DMA6_ReqPending
	   or DMA7_ReqPending or DMA8_ReqPending or DMA9_ReqPending
	   or DMANumToReq ) begin
	      case(DMANumToReq) // synopsys full_case parallel_case
		`DMA_CHANNEL_ZERO: dma_req_pending = DMA0_ReqPending;
		`DMA_CHANNEL_ONE: dma_req_pending = DMA1_ReqPending;
		`DMA_CHANNEL_TWO: dma_req_pending = DMA2_ReqPending;
		`DMA_CHANNEL_THREE: dma_req_pending = DMA3_ReqPending;
		`DMA_CHANNEL_FOUR: dma_req_pending = DMA4_ReqPending;
		`DMA_CHANNEL_FIVE: dma_req_pending = DMA5_ReqPending;
		`DMA_CHANNEL_SIX: dma_req_pending = DMA6_ReqPending;
		`DMA_CHANNEL_SEVEN: dma_req_pending = DMA7_ReqPending;
		`DMA_CHANNEL_EIGHT: dma_req_pending = DMA8_ReqPending;
		`DMA_CHANNEL_NINE: dma_req_pending = DMA9_ReqPending;
		`DMA_CHANNEL_TEN: dma_req_pending = DMA10_ReqPending;
		`DMA_CHANNEL_ELEVEN: dma_req_pending = DMA11_ReqPending;
		`DMA_CHANNEL_TWELVE: dma_req_pending = DMA12_ReqPending;
		`DMA_CHANNEL_THIRTEEN: dma_req_pending = DMA13_ReqPending;
		`DMA_CHANNEL_FOURTEEN: dma_req_pending = DMA14_ReqPending;
		`DMA_CHANNEL_FIFTEEN: dma_req_pending = DMA15_ReqPending;
		`DMA_CHANNEL_SIXTEEN: dma_req_pending = DMA16_ReqPending;
		`DMA_CHANNEL_SEVENTEEN: dma_req_pending = DMA17_ReqPending;
		`DMA_CHANNEL_EIGHTEEN: dma_req_pending = DMA18_ReqPending;
		`DMA_CHANNEL_NINETEEN: dma_req_pending = DMA19_ReqPending;
		`DMA_CHANNEL_TWENTY: dma_req_pending = DMA20_ReqPending;
		`DMA_CHANNEL_TWENTYONE: dma_req_pending = DMA21_ReqPending;
		`DMA_CHANNEL_TWENTYTWO: dma_req_pending = DMA22_ReqPending;
		`DMA_CHANNEL_TWENTYTHREE: dma_req_pending = DMA23_ReqPending;
	
		default: dma_req_pending = 1'b0;
	      endcase
	   end // always@ (...

   always@(/*AUTOJUNK*/DMANumToReq or  dmc_txc_dma0_func_num
	   or dmc_txc_dma10_func_num or dmc_txc_dma11_func_num
	   or dmc_txc_dma12_func_num or dmc_txc_dma13_func_num
	   or dmc_txc_dma14_func_num or dmc_txc_dma15_func_num
	   or dmc_txc_dma16_func_num or dmc_txc_dma17_func_num
	   or dmc_txc_dma18_func_num or dmc_txc_dma19_func_num
	   or dmc_txc_dma1_func_num or dmc_txc_dma20_func_num
	   or dmc_txc_dma21_func_num or dmc_txc_dma22_func_num
	   or dmc_txc_dma23_func_num or dmc_txc_dma2_func_num
	   or dmc_txc_dma3_func_num or dmc_txc_dma4_func_num
	   or dmc_txc_dma5_func_num or dmc_txc_dma6_func_num
	   or dmc_txc_dma7_func_num or dmc_txc_dma8_func_num
	   or dmc_txc_dma9_func_num) begin
	      case(DMANumToReq) // synopsys full_case parallel_case
		`DMA_CHANNEL_TWENTYTHREE: func_num  = dmc_txc_dma23_func_num;
		`DMA_CHANNEL_TWENTYTWO: func_num  = dmc_txc_dma22_func_num;
		`DMA_CHANNEL_TWENTYONE: func_num  = dmc_txc_dma21_func_num;
		`DMA_CHANNEL_TWENTY: func_num  = dmc_txc_dma20_func_num;
		`DMA_CHANNEL_NINETEEN: func_num  = dmc_txc_dma19_func_num;
		`DMA_CHANNEL_EIGHTEEN: func_num  = dmc_txc_dma18_func_num;
		`DMA_CHANNEL_SEVENTEEN: func_num  = dmc_txc_dma17_func_num;
		`DMA_CHANNEL_SIXTEEN: func_num  = dmc_txc_dma16_func_num;
		`DMA_CHANNEL_FIFTEEN: func_num  = dmc_txc_dma15_func_num;
		`DMA_CHANNEL_FOURTEEN: func_num  = dmc_txc_dma14_func_num;
		`DMA_CHANNEL_THIRTEEN: func_num  = dmc_txc_dma13_func_num;
		`DMA_CHANNEL_TWELVE: func_num  = dmc_txc_dma12_func_num;
		`DMA_CHANNEL_ELEVEN: func_num  = dmc_txc_dma11_func_num;
		`DMA_CHANNEL_TEN: func_num  = dmc_txc_dma10_func_num;
		`DMA_CHANNEL_NINE: func_num  = dmc_txc_dma9_func_num;
		`DMA_CHANNEL_EIGHT: func_num  = dmc_txc_dma8_func_num;
		`DMA_CHANNEL_SEVEN: func_num  = dmc_txc_dma7_func_num;
		`DMA_CHANNEL_SIX: func_num  = dmc_txc_dma6_func_num;
		`DMA_CHANNEL_FIVE: func_num  = dmc_txc_dma5_func_num;
		`DMA_CHANNEL_FOUR: func_num  = dmc_txc_dma4_func_num;
		`DMA_CHANNEL_THREE: func_num  = dmc_txc_dma3_func_num;
		`DMA_CHANNEL_TWO: func_num  = dmc_txc_dma2_func_num;
		`DMA_CHANNEL_ONE: func_num  = dmc_txc_dma1_func_num;
		`DMA_CHANNEL_ZERO: func_num  = dmc_txc_dma0_func_num;
		
		default: func_num = 2'h0;
	      endcase // case(DMANumToReq)
	   end // always@ (...
endmodule // niu_tdmc_cachefetch

			    
