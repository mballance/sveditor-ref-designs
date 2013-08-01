// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_tdmc_cachewrite.v
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
module niu_tdmc_cachewrite (/*AUTOJUNK*/
			    // Outputs
			    DMC_TxCache_SMX_Resp_Accept, updateCacheWritePtrs, 
			    meta_resp_dma_num, meta_resp_address, DMA_TxCacheWritePtr, 
			    DMA_TxCacheWrite, NoOfValidEntries, DMA_TxCacheWriteEntriesValid, 
			    DMA_TxCacheWriteData, parity_corrupt_dma_match, receivedErrorResp,
			    txpref_dma_nack_resp, txpref_nack_resp, txpref_nack_rd_addr, 
			    // Inputs
			    SMX_DMC_TxCache_Resp_Rdy, SMX_DMC_TxCache_Resp_DMA_Num, 
			    SMX_DMC_TxCache_Resp_Address, SMX_DMC_TxCache_Trans_Complete, 
			    SMX_DMC_TxCache_Resp_Complete, SMX_DMC_TxCache_Resp_ByteEnables, 
			    SMX_DMC_TxCache_Resp_Data_Length, SMX_DMC_TxCache_Resp_Data_Valid, 
			    SMX_DMC_TxCache_Resp_Data, meta_dmc_resp_cmd, 
			    meta_dmc_resp_cmd_status, meta_dmc_data_status, 
			    DMA0_CacheWritePtrReOrder, DMA1_CacheWritePtrReOrder, 
			    DMA2_CacheWritePtrReOrder, DMA3_CacheWritePtrReOrder, 
			    DMA4_CacheWritePtrReOrder, DMA5_CacheWritePtrReOrder, 
			    DMA6_CacheWritePtrReOrder, DMA7_CacheWritePtrReOrder, 
			    DMA8_CacheWritePtrReOrder, DMA9_CacheWritePtrReOrder, 
			    DMA10_CacheWritePtrReOrder, DMA11_CacheWritePtrReOrder, 
			    DMA12_CacheWritePtrReOrder, DMA13_CacheWritePtrReOrder, 
			    DMA14_CacheWritePtrReOrder, DMA15_CacheWritePtrReOrder, 
`ifdef NEPTUNE

			    DMA16_CacheWritePtrReOrder, DMA17_CacheWritePtrReOrder, 
			    DMA18_CacheWritePtrReOrder, DMA19_CacheWritePtrReOrder, 
			    DMA20_CacheWritePtrReOrder, DMA21_CacheWritePtrReOrder, 
			    DMA22_CacheWritePtrReOrder, DMA23_CacheWritePtrReOrder, 
`else
`endif
			    meta_entries_requested_dma0, meta_entries_requested_dma1, 
			    meta_entries_requested_dma2, meta_entries_requested_dma3, 
			    meta_entries_requested_dma4, meta_entries_requested_dma5, 
			    meta_entries_requested_dma6, meta_entries_requested_dma7, 
			    meta_entries_requested_dma8, meta_entries_requested_dma9, 
			    meta_entries_requested_dma10, meta_entries_requested_dma11, 
			    meta_entries_requested_dma12, meta_entries_requested_dma13, 
			    meta_entries_requested_dma14, meta_entries_requested_dma15, 
`ifdef NEPTUNE
			    meta_entries_requested_dma16, meta_entries_requested_dma17, 
			    meta_entries_requested_dma18, meta_entries_requested_dma19, 
			    meta_entries_requested_dma20, meta_entries_requested_dma21, 
			    meta_entries_requested_dma22, meta_entries_requested_dma23, 
`else
`endif
			    SysClk, Reset_L
			    );
   output DMC_TxCache_SMX_Resp_Accept;
   output [`NO_OF_DMAS - 1 :0] updateCacheWritePtrs ;
   output [4:0] 	       meta_resp_dma_num ;
   output [3:0] 	       meta_resp_address ;

   output [7:0] 	       DMA_TxCacheWritePtr;
   output 		       DMA_TxCacheWrite ;
   output [4:0] 	       NoOfValidEntries ;
   output [3:0] 	       DMA_TxCacheWriteEntriesValid;
   output [127:0] 	       DMA_TxCacheWriteData;// ???
   output [`NO_OF_DMAS - 1:0]  parity_corrupt_dma_match;
   output [`NO_OF_DMAS - 1:0]  txpref_dma_nack_resp;
   output 		       txpref_nack_resp ;
   output [43:0] 	       txpref_nack_rd_addr;
   output [`NO_OF_DMAS - 1:0]  receivedErrorResp;
   
   input 		       SMX_DMC_TxCache_Resp_Rdy;
   input [4:0] 		       SMX_DMC_TxCache_Resp_DMA_Num;
   input [63:0] 	       SMX_DMC_TxCache_Resp_Address;
   input 		       SMX_DMC_TxCache_Trans_Complete;
   input 		       SMX_DMC_TxCache_Resp_Complete;
   input [15:0] 	       SMX_DMC_TxCache_Resp_ByteEnables;
   input [13:0] 	       SMX_DMC_TxCache_Resp_Data_Length;
   input 		       SMX_DMC_TxCache_Resp_Data_Valid;
   input [127:0] 	       SMX_DMC_TxCache_Resp_Data;// ???
   input [7:0] 		       meta_dmc_resp_cmd;

   input [3:0] 		       meta_dmc_resp_cmd_status;
   input [3:0] 		       meta_dmc_data_status;

   
   input [3:0] 		       DMA0_CacheWritePtrReOrder;
   input [3:0] 		       DMA1_CacheWritePtrReOrder;
   input [3:0] 		       DMA2_CacheWritePtrReOrder;
   input [3:0] 		       DMA3_CacheWritePtrReOrder;
   input [3:0] 		       DMA4_CacheWritePtrReOrder;
   input [3:0] 		       DMA5_CacheWritePtrReOrder;
   input [3:0] 		       DMA6_CacheWritePtrReOrder;
   input [3:0] 		       DMA7_CacheWritePtrReOrder;
   input [3:0] 		       DMA8_CacheWritePtrReOrder;
   input [3:0] 		       DMA9_CacheWritePtrReOrder;
   input [3:0] 		       DMA10_CacheWritePtrReOrder;
   input [3:0] 		       DMA11_CacheWritePtrReOrder;
   input [3:0] 		       DMA12_CacheWritePtrReOrder;
   input [3:0] 		       DMA13_CacheWritePtrReOrder;
   input [3:0] 		       DMA14_CacheWritePtrReOrder;
   input [3:0] 		       DMA15_CacheWritePtrReOrder;
   input [4:0] 		       meta_entries_requested_dma0;
   input [4:0] 		       meta_entries_requested_dma1;
   input [4:0] 		       meta_entries_requested_dma2;
   input [4:0] 		       meta_entries_requested_dma3;
   input [4:0] 		       meta_entries_requested_dma4;
   input [4:0] 		       meta_entries_requested_dma5;
   input [4:0] 		       meta_entries_requested_dma6;
   input [4:0] 		       meta_entries_requested_dma7;
   input [4:0] 		       meta_entries_requested_dma8;
   input [4:0] 		       meta_entries_requested_dma9;
   input [4:0] 		       meta_entries_requested_dma10;
   input [4:0] 		       meta_entries_requested_dma11;
   input [4:0] 		       meta_entries_requested_dma12;
   input [4:0] 		       meta_entries_requested_dma13;
   input [4:0] 		       meta_entries_requested_dma14;
   input [4:0] 		       meta_entries_requested_dma15;
`ifdef NEPTUNE
   
   input [3:0] 		       DMA16_CacheWritePtrReOrder;
   input [3:0] 		       DMA17_CacheWritePtrReOrder;
   input [3:0] 		       DMA18_CacheWritePtrReOrder;
   input [3:0] 		       DMA19_CacheWritePtrReOrder;
   input [3:0] 		       DMA20_CacheWritePtrReOrder;
   input [3:0] 		       DMA21_CacheWritePtrReOrder;
   input [3:0] 		       DMA22_CacheWritePtrReOrder;
   input [3:0] 		       DMA23_CacheWritePtrReOrder;
   
   input [4:0] 		       meta_entries_requested_dma16;
   input [4:0] 		       meta_entries_requested_dma17;
   input [4:0] 		       meta_entries_requested_dma18;
   input [4:0] 		       meta_entries_requested_dma19;
   input [4:0] 		       meta_entries_requested_dma20;
   input [4:0] 		       meta_entries_requested_dma21;
   input [4:0] 		       meta_entries_requested_dma22;
   input [4:0] 		       meta_entries_requested_dma23;
   
`else
`endif // !ifdef CHANNELS_16

   input 		       SysClk;
   input 		       Reset_L;
   
   /*--------------------------------------------------------------*/
   // Parameters and Defines
   /*--------------------------------------------------------------*/
   
   parameter 		       CACHE_WRITE_IDLE          = 4'h0,
			       WAIT_FOR_TRANS_COMP = 4'h1,
			       UPDATE_CACHE_STATE = 4'h2;   

   reg 			       DMC_TxCache_SMX_Resp_Accept;
   reg [`NO_OF_DMAS - 1:0]     updateCacheWritePtrs ;
   reg [4:0] 		       meta_resp_dma_num ;
   reg [3:0] 		       meta_resp_address ;
   reg [4:0] 		       meta_resp_length;

   reg [4:0] 		       meta_entries_requested_dma;
   reg [7:0] 		       cmd_received;

   reg [7:0] 		       DMA_TxCacheWritePtr;
   reg 			       DMA_TxCacheWrite ;
   reg [3:0] 		       NoOfCacheWrites;
   reg [4:0] 		       NoOfValidEntries ;
   reg [3:0] 		       DMA_TxCacheWriteEntriesValid;
   reg 			       SelectCacheWriteContexts;
   reg [7:0] 		       DMA_TxCacheWritePtr_n; 
   reg [3:0] 		       TxCacheWriteState;
   reg [127:0] 		       DMA_TxCacheWriteData;// ???
   reg [`NO_OF_DMAS - 1:0]     DMA_CacheWriteUpdate;

   reg [`NO_OF_DMAS - 1:0]     parity_corrupt_dma_match;
   
   reg [`NO_OF_DMAS - 1:0]     txpref_dma_nack_resp;
   reg [`NO_OF_DMAS - 1:0]     receivedErrorResp;
   reg [`NO_OF_DMAS - 1:0]     prev_pending_error;
   reg 			       txpref_nack_resp ;
   reg [43:0] 		       txpref_nack_rd_addr;
   reg 			       resp_error_status;
   reg 			       update_pending_error_status;
   reg 			       prev_data_error;
   reg 			       prev_data_error_dma;
`ifdef NEPTUNE
   wire 		       prev_data_error_dma23;
   wire 		       prev_data_error_dma22;
   wire 		       prev_data_error_dma21;
   wire 		       prev_data_error_dma20;
   wire 		       prev_data_error_dma19;
   wire 		       prev_data_error_dma18;
   wire 		       prev_data_error_dma17;
   wire 		       prev_data_error_dma16;
`else
`endif
   wire 		       prev_data_error_dma15;
   wire 		       prev_data_error_dma14;
   wire 		       prev_data_error_dma13;
   wire 		       prev_data_error_dma12;
   wire 		       prev_data_error_dma11;
   wire 		       prev_data_error_dma10;
   wire 		       prev_data_error_dma9;
   wire 		       prev_data_error_dma8;
   wire 		       prev_data_error_dma7;
   wire 		       prev_data_error_dma6;
   wire 		       prev_data_error_dma5;
   wire 		       prev_data_error_dma4;
   wire 		       prev_data_error_dma3;
   wire 		       prev_data_error_dma2;
   wire 		       prev_data_error_dma1;
   wire 		       prev_data_error_dma0;

   //VCS coverage off
   // synopsys translate_off
   reg [192:1] 		       CACHE_DATA_WRITE_STATE;


   always @(TxCacheWriteState)
   begin
      case(TxCacheWriteState)
	CACHE_WRITE_IDLE :            CACHE_DATA_WRITE_STATE = "CACHE_WRITE_IDLE";
	UPDATE_CACHE_STATE:    CACHE_DATA_WRITE_STATE = "UPDATE_CACHE_STATE";
	WAIT_FOR_TRANS_COMP :   CACHE_DATA_WRITE_STATE = "WAIT_FOR_TRANS_COMP";
	default :            CACHE_DATA_WRITE_STATE = "UNKNOWN";
      endcase
   end

   // synopsys translate_on
   //VCS coverage on

   

   /*--------------------------------------------------------------*/
   // Write Back Data State Machine
   /*--------------------------------------------------------------*/

   // cache response sm - move to a module

   always@(posedge SysClk )
     if (!Reset_L) begin
	TxCacheWriteState <= CACHE_WRITE_IDLE;
	SelectCacheWriteContexts <= 1'b0;
	DMC_TxCache_SMX_Resp_Accept <= 1'b0;
	updateCacheWritePtrs <= `NO_OF_DMAS'b0;
	meta_resp_length <= 5'h0;
	meta_resp_dma_num <= 5'h0;
	meta_resp_address <= 4'h0;
	cmd_received <= 8'h0;
	txpref_dma_nack_resp <= `NO_OF_DMAS'h0;
	receivedErrorResp <= `NO_OF_DMAS'h0;
	txpref_nack_resp <= 1'b0;
	resp_error_status <= 1'b0;
	prev_data_error <= 1'b0;
	update_pending_error_status <= 1'b0;
     end else begin
	case(TxCacheWriteState) // synopsys parallel_case
	  CACHE_WRITE_IDLE: begin
	     updateCacheWritePtrs <= `NO_OF_DMAS'b0;
	     prev_data_error <= 1'b0;
	     update_pending_error_status <= 1'b0;
	     if(SMX_DMC_TxCache_Resp_Rdy) begin
		// This should happen only if the response ID matches that of the txCache
		// request else its a bug
		TxCacheWriteState <= WAIT_FOR_TRANS_COMP;
		meta_resp_dma_num <= SMX_DMC_TxCache_Resp_DMA_Num;
		// this gets added to the Anchor address 
		//REORDER
		meta_resp_address <= SMX_DMC_TxCache_Resp_Address[7:4];// -- for reorder 
		meta_resp_length <= SMX_DMC_TxCache_Resp_Data_Length[7:3];
		SelectCacheWriteContexts <= 1'b1;
		DMC_TxCache_SMX_Resp_Accept <= 1'b1;
		// ERROR - Timeout
		txpref_nack_rd_addr <= SMX_DMC_TxCache_Resp_Address[43:0];
		cmd_received <= meta_dmc_resp_cmd;
		resp_error_status <= (meta_dmc_resp_cmd_status==4'hf)   ;
		
	     end else begin // if (SMX_DMC_TxCache_Resp_Rdy)
		// Just wait
		meta_resp_length <= 5'h0;
		meta_resp_dma_num <= 5'h0;
		TxCacheWriteState <= CACHE_WRITE_IDLE;
		SelectCacheWriteContexts <= 1'b0;
		DMC_TxCache_SMX_Resp_Accept <= 1'b0;
	     end // else: !if(SMX_DMC_TxCache_Resp_Rdy)
	  end // case: CACHE_WRITE_IDLE
	  WAIT_FOR_TRANS_COMP: begin
	     SelectCacheWriteContexts <= 1'b0;
	     DMC_TxCache_SMX_Resp_Accept <= 1'b0;
	     
	     if(SMX_DMC_TxCache_Trans_Complete &  (resp_error_status | ( cmd_received== 8'h6/*COMPLETIONWITHOUTDATA*/)| ( prev_data_error | (meta_dmc_data_status==4'hf)))) begin
		updateCacheWritePtrs <= `NO_OF_DMAS'h0;
		txpref_nack_resp <= 1'b1;
		txpref_dma_nack_resp <= DMA_CacheWriteUpdate;
		receivedErrorResp <= DMA_CacheWriteUpdate;
	     end else if(SMX_DMC_TxCache_Trans_Complete  &~resp_error_status & ( cmd_received== 8'h5/*COMPLETIONWITHDATA*/))
	       updateCacheWritePtrs <= DMA_CacheWriteUpdate;
	     else  updateCacheWritePtrs <= `NO_OF_DMAS'h0;

	     if(SMX_DMC_TxCache_Trans_Complete | SMX_DMC_TxCache_Resp_Complete ) begin
		TxCacheWriteState <= UPDATE_CACHE_STATE;
		update_pending_error_status <= 1'b1;
	     end else begin // if (SMX_DMC_TxCache_Trans_Complete)
		TxCacheWriteState <= WAIT_FOR_TRANS_COMP; 
	     end // else: !if(SMX_DMC_TxCache_Trans_Complete)
	     
	     if(SMX_DMC_TxCache_Resp_Data_Valid & (meta_dmc_data_status==4'hf) & ~SMX_DMC_TxCache_Trans_Complete) begin
               	prev_data_error <= prev_data_error| prev_data_error_dma | 1'b1;
             end else if(SMX_DMC_TxCache_Trans_Complete) begin
               	prev_data_error <= 1'b0;
             end
	  end // case: WAIT_FOR_TRANS_COMP
	  UPDATE_CACHE_STATE: begin
	     update_pending_error_status <= 1'b0;
	     txpref_dma_nack_resp <= `NO_OF_DMAS'h0;
	     receivedErrorResp <= `NO_OF_DMAS'h0;
	     updateCacheWritePtrs <= `NO_OF_DMAS'b0;
	     txpref_nack_resp <= 1'b0;
	     resp_error_status <= 1'b0;
	     TxCacheWriteState <= CACHE_WRITE_IDLE;
	  end
	  
	endcase // case(TxCacheWriteState)
	
     end // else: !if(!Reset_L)
   


   // common cache engine- module
   
   always@(posedge SysClk )
     if (!Reset_L)  begin
	DMA_TxCacheWritePtr_n <= 8'b0;
	DMA_CacheWriteUpdate <= `NO_OF_DMAS'h0;
	parity_corrupt_dma_match <= `NO_OF_DMAS'h0;
	meta_entries_requested_dma <= 5'h0;
	prev_data_error_dma <= 1'b0;
     end else begin // if (!Reset_L)
	if(SelectCacheWriteContexts  ) begin
	   case(meta_resp_dma_num) // synopsys full_case parallel_case
	     // REORDER
	     //	     offset = ( meta_resp_address > anchor_address  ) ? ( meta_resp_address - anchor_address ) :
	     //	     		( 4'h8 - meta_resp_address + anchor_address);;
	     `DMA_CHANNEL_ZERO: begin 
		DMA_TxCacheWritePtr_n <= {5'h0,DMA0_CacheWritePtrReOrder[2:0] } + `DMA0_Cache_OFFSET;
		meta_entries_requested_dma <= meta_entries_requested_dma0;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h1;
		parity_corrupt_dma_match <=  `NO_OF_DMAS'h1;
	        prev_data_error_dma <= prev_data_error_dma0;
	     end // case: `DMA_CHANNEL_ZERO
	     `DMA_CHANNEL_ONE: begin 
		DMA_TxCacheWritePtr_n <= {5'h0,DMA1_CacheWritePtrReOrder[2:0] } + `DMA1_Cache_OFFSET;
		meta_entries_requested_dma <= meta_entries_requested_dma1;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h2;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h2;
	        prev_data_error_dma <= prev_data_error_dma1;
	     end
	     `DMA_CHANNEL_TWO: begin 
		meta_entries_requested_dma <= meta_entries_requested_dma2;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA2_CacheWritePtrReOrder[2:0] } + `DMA2_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h4;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h4;
	        prev_data_error_dma <= prev_data_error_dma2;
	     end 
	     `DMA_CHANNEL_THREE: begin
		meta_entries_requested_dma <= meta_entries_requested_dma3;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA3_CacheWritePtrReOrder[2:0] } + `DMA3_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h8;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h8;
	        prev_data_error_dma <= prev_data_error_dma3;
	     end 
	     `DMA_CHANNEL_FOUR: begin
		meta_entries_requested_dma <= meta_entries_requested_dma4;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA4_CacheWritePtrReOrder[2:0] } + `DMA4_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h10;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h10;
	        prev_data_error_dma <= prev_data_error_dma4;
	     end 
	     `DMA_CHANNEL_FIVE: begin
		meta_entries_requested_dma <= meta_entries_requested_dma5;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA5_CacheWritePtrReOrder[2:0] } + `DMA5_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h20;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h20;
	        prev_data_error_dma <= prev_data_error_dma5;
	     end 
	     `DMA_CHANNEL_SIX: begin
		meta_entries_requested_dma <= meta_entries_requested_dma6;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA6_CacheWritePtrReOrder[2:0] } + `DMA6_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h40;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h40;
	        prev_data_error_dma <= prev_data_error_dma6;
	     end 
	     `DMA_CHANNEL_SEVEN: begin
		meta_entries_requested_dma <= meta_entries_requested_dma7;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA7_CacheWritePtrReOrder[2:0] } + `DMA7_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h80;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h80;
	        prev_data_error_dma <= prev_data_error_dma7;
	     end 
	     `DMA_CHANNEL_EIGHT: begin
		meta_entries_requested_dma <= meta_entries_requested_dma8;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA8_CacheWritePtrReOrder[2:0] } + `DMA8_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h100;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h100;
	        prev_data_error_dma <= prev_data_error_dma8;
	     end
	     `DMA_CHANNEL_NINE: begin
		meta_entries_requested_dma <= meta_entries_requested_dma9;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA9_CacheWritePtrReOrder[2:0] } + `DMA9_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h200;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h200;
	        prev_data_error_dma <= prev_data_error_dma9;
	     end
	     `DMA_CHANNEL_TEN: begin
		meta_entries_requested_dma <= meta_entries_requested_dma10;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA10_CacheWritePtrReOrder[2:0] } + `DMA10_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h400;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h400;
	        prev_data_error_dma <= prev_data_error_dma10;
	     end 
	     `DMA_CHANNEL_ELEVEN: begin
		meta_entries_requested_dma <= meta_entries_requested_dma11;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA11_CacheWritePtrReOrder[2:0] } + `DMA11_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h800;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h800;
	        prev_data_error_dma <= prev_data_error_dma11;
	     end
	     `DMA_CHANNEL_TWELVE: begin
		meta_entries_requested_dma <= meta_entries_requested_dma12;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA12_CacheWritePtrReOrder[2:0] } + `DMA12_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h1000;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h1000;
	        prev_data_error_dma <= prev_data_error_dma12;
	     end
	     `DMA_CHANNEL_THIRTEEN: begin
		meta_entries_requested_dma <= meta_entries_requested_dma13;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA13_CacheWritePtrReOrder[2:0] } + `DMA13_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h2000;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h2000;
	        prev_data_error_dma <= prev_data_error_dma13;
	     end
	     `DMA_CHANNEL_FOURTEEN: begin
		meta_entries_requested_dma <= meta_entries_requested_dma14;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA14_CacheWritePtrReOrder[2:0] } + `DMA14_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h4000;
		parity_corrupt_dma_match <=`NO_OF_DMAS'h4000; 
	        prev_data_error_dma <= prev_data_error_dma14;
	     end
	     `DMA_CHANNEL_FIFTEEN: begin
		meta_entries_requested_dma <= meta_entries_requested_dma15;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA15_CacheWritePtrReOrder[2:0] } + `DMA15_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h8000;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h8000;
	        prev_data_error_dma <= prev_data_error_dma15;
	     end
			    `ifdef NEPTUNE
	     
	     `DMA_CHANNEL_SIXTEEN: begin
		meta_entries_requested_dma <= meta_entries_requested_dma16;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA16_CacheWritePtrReOrder[2:0] } + `DMA16_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h10000;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h10000;
	        prev_data_error_dma <= prev_data_error_dma16;
	     end 
	     `DMA_CHANNEL_SEVENTEEN: begin
		meta_entries_requested_dma <= meta_entries_requested_dma17;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA17_CacheWritePtrReOrder[2:0] } + `DMA17_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h20000;
		parity_corrupt_dma_match <=`NO_OF_DMAS'h20000; 
	        prev_data_error_dma <= prev_data_error_dma17;
	     end 
	     `DMA_CHANNEL_EIGHTEEN: begin
		meta_entries_requested_dma <= meta_entries_requested_dma18;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA18_CacheWritePtrReOrder[2:0] } + `DMA18_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h40000;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h40000;
	        prev_data_error_dma <= prev_data_error_dma18;
	     end
	     `DMA_CHANNEL_NINETEEN: begin
		meta_entries_requested_dma <= meta_entries_requested_dma19;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA19_CacheWritePtrReOrder[2:0] } + `DMA19_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h80000;
		parity_corrupt_dma_match <=  `NO_OF_DMAS'h80000;
	        prev_data_error_dma <= prev_data_error_dma19;
	     end
	     `DMA_CHANNEL_TWENTY: begin
		meta_entries_requested_dma <= meta_entries_requested_dma20;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA20_CacheWritePtrReOrder[2:0] } + `DMA20_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h100000;
		parity_corrupt_dma_match <=`NO_OF_DMAS'h100000; 
	        prev_data_error_dma <= prev_data_error_dma20;
	     end
	     `DMA_CHANNEL_TWENTYONE: begin
		meta_entries_requested_dma <= meta_entries_requested_dma21;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA21_CacheWritePtrReOrder[2:0] } + `DMA21_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h200000;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h200000;
	        prev_data_error_dma <= prev_data_error_dma21;
	     end
	     `DMA_CHANNEL_TWENTYTWO: begin
		meta_entries_requested_dma <= meta_entries_requested_dma22;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA22_CacheWritePtrReOrder[2:0] } + `DMA22_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h400000;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h400000;
	        prev_data_error_dma <= prev_data_error_dma22;
	     end
	     `DMA_CHANNEL_TWENTYTHREE: begin
		meta_entries_requested_dma <= meta_entries_requested_dma23;
		DMA_TxCacheWritePtr_n <= {5'h0,DMA23_CacheWritePtrReOrder[2:0] } + `DMA23_Cache_OFFSET;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h800000;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h800000;
	        prev_data_error_dma <= prev_data_error_dma23;
	     end
			    `else
			    `endif // !ifdef CHANNELS_16
	     default: begin
		DMA_TxCacheWritePtr_n <= 8'h0;
		meta_entries_requested_dma <= 5'h0;
		DMA_CacheWriteUpdate <= `NO_OF_DMAS'h0;
		parity_corrupt_dma_match <= `NO_OF_DMAS'h0;
		prev_data_error_dma <= 1'b0;
	     end
	     

	     //         
	   endcase // case(DMC_TxCache_SMX_Req_DMA_Num)
	end
     end // else: !if(!Reset_L)
   
			    `ifdef NEPTUNE
   assign {prev_data_error_dma23, prev_data_error_dma22, prev_data_error_dma21, prev_data_error_dma20,
	   prev_data_error_dma19, prev_data_error_dma18, prev_data_error_dma17, prev_data_error_dma16,
	   prev_data_error_dma15, prev_data_error_dma14, prev_data_error_dma13, prev_data_error_dma12,
	   prev_data_error_dma11, prev_data_error_dma10, prev_data_error_dma9, prev_data_error_dma8,
	   prev_data_error_dma7, prev_data_error_dma6, prev_data_error_dma5, prev_data_error_dma4,
	   prev_data_error_dma3, prev_data_error_dma2, prev_data_error_dma1, prev_data_error_dma0 } = prev_pending_error;
			    `else 
   assign {prev_data_error_dma15, prev_data_error_dma14, prev_data_error_dma13, prev_data_error_dma12,
	   prev_data_error_dma11, prev_data_error_dma10, prev_data_error_dma9, prev_data_error_dma8,
	   prev_data_error_dma7, prev_data_error_dma6, prev_data_error_dma5, prev_data_error_dma4,
	   prev_data_error_dma3, prev_data_error_dma2, prev_data_error_dma1, prev_data_error_dma0 } = prev_pending_error;
			    `endif

   always@(posedge SysClk )
     if (!Reset_L)  begin
	prev_pending_error<=`NO_OF_DMAS'h0;
     end else begin
	if(update_pending_error_status ) begin
	   case(meta_resp_dma_num) // synopsys full_case parallel_case
   	     `DMA_CHANNEL_ZERO:         prev_pending_error[0] <= prev_data_error;
	     `DMA_CHANNEL_ONE:          prev_pending_error[1] <= prev_data_error;
	     `DMA_CHANNEL_TWO:          prev_pending_error[2] <= prev_data_error;
	     `DMA_CHANNEL_THREE:        prev_pending_error[3] <= prev_data_error;
	     `DMA_CHANNEL_FOUR:         prev_pending_error[4] <= prev_data_error;
	     `DMA_CHANNEL_FIVE:         prev_pending_error[5] <= prev_data_error;
	     `DMA_CHANNEL_SIX:          prev_pending_error[6] <= prev_data_error;
	     `DMA_CHANNEL_SEVEN:        prev_pending_error[7] <= prev_data_error;
	     `DMA_CHANNEL_EIGHT:        prev_pending_error[8] <= prev_data_error;
	     `DMA_CHANNEL_NINE:         prev_pending_error[9] <= prev_data_error;
	     `DMA_CHANNEL_TEN:          prev_pending_error[10] <= prev_data_error;
	     `DMA_CHANNEL_ELEVEN:       prev_pending_error[11] <= prev_data_error;
	     `DMA_CHANNEL_TWELVE:       prev_pending_error[12] <= prev_data_error;
	     `DMA_CHANNEL_THIRTEEN:     prev_pending_error[13] <= prev_data_error;
	     `DMA_CHANNEL_FOURTEEN:     prev_pending_error[14] <= prev_data_error;
	     `DMA_CHANNEL_FIFTEEN:      prev_pending_error[15] <= prev_data_error;
`ifdef NEPTUNE                                             
	     `DMA_CHANNEL_SIXTEEN:      prev_pending_error[16] <= prev_data_error;
	     `DMA_CHANNEL_SEVENTEEN:    prev_pending_error[17] <= prev_data_error;
	     `DMA_CHANNEL_EIGHTEEN:     prev_pending_error[18] <= prev_data_error;
	     `DMA_CHANNEL_NINETEEN:     prev_pending_error[19] <= prev_data_error;
	     `DMA_CHANNEL_TWENTY:       prev_pending_error[20] <= prev_data_error;
	     `DMA_CHANNEL_TWENTYONE:    prev_pending_error[21] <= prev_data_error;
	     `DMA_CHANNEL_TWENTYTWO:    prev_pending_error[22] <= prev_data_error;
	     `DMA_CHANNEL_TWENTYTHREE:  prev_pending_error[23] <= prev_data_error;
`endif
	     default: prev_pending_error<=`NO_OF_DMAS'h0;
	   endcase // case(meta_resp_dma_num)
	end // if (SelectCacheWriteContexts  )
     end // else: !if(!Reset_L)
	

   // cache pointer module
   
   always@(posedge SysClk )
     if (!Reset_L)  begin
	DMA_TxCacheWritePtr <= 8'b0;
	DMA_TxCacheWrite <= 1'b0;
	NoOfCacheWrites <= 4'b0;
	NoOfValidEntries <= 5'b0;
	DMA_TxCacheWriteEntriesValid <= 4'h0;
	
     end // if (!Reset_L)
     else begin 
	if(SelectCacheWriteContexts) begin 
	   NoOfCacheWrites <= 4'b0;
	   NoOfValidEntries <= 5'b0;
	   DMA_TxCacheWrite <= 1'b0;
	end else  begin
	   if( SMX_DMC_TxCache_Resp_Data_Valid & ( meta_dmc_data_status!=4'hf) ) begin // if (!Reset_L)
	      DMA_TxCacheWrite <= 1'b1;
	      DMA_TxCacheWritePtr <= {DMA_TxCacheWritePtr_n[7:3], (DMA_TxCacheWritePtr_n[2:0] + NoOfCacheWrites[2:0]) };
	      DMA_TxCacheWriteData <= SMX_DMC_TxCache_Resp_Data;  // ???? size
	      DMA_TxCacheWriteEntriesValid <= {2'h0,(|SMX_DMC_TxCache_Resp_ByteEnables[15:8]) ,(|SMX_DMC_TxCache_Resp_ByteEnables[7:0])};
	      NoOfCacheWrites <= NoOfCacheWrites + 1; // just to keep track of how many bytes have been written
	      NoOfValidEntries <= meta_entries_requested_dma;
	      // synopsys translate_off
	      if(~SMX_DMC_TxCache_Resp_ByteEnables[8] & ~SMX_DMC_TxCache_Resp_ByteEnables[0])
	      $display(" %m : Time - %t Byte Enables into TDMC not set correctly!! ERROR ",$time);
	      if(NoOfCacheWrites > 8 ) begin
		 $display("ERROR -- %m Time - %t, No of cache writes in TMDC - %d ",$time,NoOfCacheWrites);
	      end
	      // synopsys translate_on
	   end else begin // if ( SMX_DMC_TxCache_Resp_Data_Valid)
	      DMA_TxCacheWrite <= 1'b0;   
	   end // else: !if( SMX_DMC_TxCache_Resp_Data_Valid)
	end // else: !if(SelectCacheWriteContexts)
     end // else: !if(!Reset_L)
   // cache pointer module
endmodule // niu_tdmc_cachewrite
