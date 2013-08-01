// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_tdmc_cacheread.v
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

module niu_tdmc_cacheread (/*AUTOARG*/
   // Outputs
   DMA_TxCacheRead, DMA_TxCacheReadPtr, DMA0_CacheReadGnt, 
   DMA1_CacheReadGnt, DMA2_CacheReadGnt, DMA3_CacheReadGnt, 
   DMA4_CacheReadGnt, DMA5_CacheReadGnt, DMA6_CacheReadGnt, 
   DMA7_CacheReadGnt, DMA8_CacheReadGnt, DMA9_CacheReadGnt, 
   DMA10_CacheReadGnt, DMA11_CacheReadGnt, DMA12_CacheReadGnt, 
   DMA13_CacheReadGnt, DMA14_CacheReadGnt, DMA15_CacheReadGnt, 
   DMA16_CacheReadGnt, DMA17_CacheReadGnt, DMA18_CacheReadGnt, 
   DMA19_CacheReadGnt, DMA20_CacheReadGnt, DMA21_CacheReadGnt, 
   DMA22_CacheReadGnt, DMA23_CacheReadGnt, 
   // Inputs
   DMA0_CacheReadPtr, DMA0_CacheReadReq, DMA1_CacheReadPtr, 
   DMA1_CacheReadReq, DMA2_CacheReadPtr, DMA2_CacheReadReq, 
   DMA3_CacheReadPtr, DMA3_CacheReadReq, DMA4_CacheReadPtr, 
   DMA4_CacheReadReq, DMA5_CacheReadPtr, DMA5_CacheReadReq, 
   DMA6_CacheReadPtr, DMA6_CacheReadReq, DMA7_CacheReadPtr, 
   DMA7_CacheReadReq, DMA8_CacheReadPtr, DMA8_CacheReadReq, 
   DMA9_CacheReadPtr, DMA9_CacheReadReq, DMA10_CacheReadPtr, 
   DMA10_CacheReadReq, DMA11_CacheReadPtr, DMA11_CacheReadReq, 
   DMA12_CacheReadPtr, DMA12_CacheReadReq, DMA13_CacheReadPtr, 
   DMA13_CacheReadReq, DMA14_CacheReadPtr, DMA14_CacheReadReq, 
   DMA15_CacheReadPtr, DMA15_CacheReadReq, DMA16_CacheReadPtr, 
   DMA16_CacheReadReq, DMA17_CacheReadPtr, DMA17_CacheReadReq, 
   DMA18_CacheReadPtr, DMA18_CacheReadReq, DMA19_CacheReadPtr, 
   DMA19_CacheReadReq, DMA20_CacheReadPtr, DMA20_CacheReadReq, 
   DMA21_CacheReadPtr, DMA21_CacheReadReq, DMA22_CacheReadPtr, 
   DMA22_CacheReadReq, DMA23_CacheReadPtr, DMA23_CacheReadReq, 
   SysClk, Reset_L
   );
   
   output DMA_TxCacheRead;
   output [7:0] DMA_TxCacheReadPtr; 

   output DMA0_CacheReadGnt;
   output DMA1_CacheReadGnt;
   output DMA2_CacheReadGnt;
   output DMA3_CacheReadGnt;
   output DMA4_CacheReadGnt;
   output DMA5_CacheReadGnt;
   output DMA6_CacheReadGnt;
   output DMA7_CacheReadGnt;
   output DMA8_CacheReadGnt;
   output DMA9_CacheReadGnt;
   output DMA10_CacheReadGnt;
   output DMA11_CacheReadGnt;
   output DMA12_CacheReadGnt;
   output DMA13_CacheReadGnt;
   output DMA14_CacheReadGnt;
   output DMA15_CacheReadGnt;
   output DMA16_CacheReadGnt;
   output DMA17_CacheReadGnt;
   output DMA18_CacheReadGnt;
   output DMA19_CacheReadGnt;
   output DMA20_CacheReadGnt;
   output DMA21_CacheReadGnt;
   output DMA22_CacheReadGnt;
   output DMA23_CacheReadGnt;



   
   input [3:0] DMA0_CacheReadPtr;		       
   input       DMA0_CacheReadReq;
   input [3:0] DMA1_CacheReadPtr;		       
   input       DMA1_CacheReadReq;
   input [3:0] DMA2_CacheReadPtr;		       
   input       DMA2_CacheReadReq;
   input [3:0] DMA3_CacheReadPtr;		       
   input       DMA3_CacheReadReq;
   input [3:0] DMA4_CacheReadPtr;		       
   input       DMA4_CacheReadReq;
   input [3:0] DMA5_CacheReadPtr;		       
   input       DMA5_CacheReadReq;
   input [3:0] DMA6_CacheReadPtr;		       
   input       DMA6_CacheReadReq;
   input [3:0] DMA7_CacheReadPtr;		       
   input       DMA7_CacheReadReq;
   input [3:0] DMA8_CacheReadPtr;		       
   input       DMA8_CacheReadReq;
   input [3:0] DMA9_CacheReadPtr;		       
   input       DMA9_CacheReadReq;
   input [3:0] DMA10_CacheReadPtr;		       
   input       DMA10_CacheReadReq;
   input [3:0] DMA11_CacheReadPtr;		       
   input       DMA11_CacheReadReq;
   input [3:0] DMA12_CacheReadPtr;		       
   input       DMA12_CacheReadReq;
   input [3:0] DMA13_CacheReadPtr;		       
   input       DMA13_CacheReadReq;
   input [3:0] DMA14_CacheReadPtr;		       
   input       DMA14_CacheReadReq;
   input [3:0] DMA15_CacheReadPtr;		       
   input       DMA15_CacheReadReq;
   input [3:0] DMA16_CacheReadPtr;		       
   input       DMA16_CacheReadReq;
   input [3:0] DMA17_CacheReadPtr;		       
   input       DMA17_CacheReadReq;
   input [3:0] DMA18_CacheReadPtr;		       
   input       DMA18_CacheReadReq;
   input [3:0] DMA19_CacheReadPtr;		       
   input       DMA19_CacheReadReq;
   input [3:0] DMA20_CacheReadPtr;		       
   input       DMA20_CacheReadReq;
   input [3:0] DMA21_CacheReadPtr;		       
   input       DMA21_CacheReadReq;
   input [3:0] DMA22_CacheReadPtr;		       
   input       DMA22_CacheReadReq;
   input [3:0] DMA23_CacheReadPtr;		       
   input       DMA23_CacheReadReq;


   
   input       SysClk;
   input       Reset_L;
   
   
   reg 	       DMA_TxCacheRead;
   reg [7:0]   DMA_TxCacheReadPtr; 

   wire [31:0] DMA_CacheReadReq;
   wire [31:0] DMA_CacheReadGnt;
   wire [4:0]  DMA_NoToPop;
   wire        DMA_ArbForPop;
   wire        DMA0_CacheReadGnt;
   wire        DMA1_CacheReadGnt;
   wire        DMA2_CacheReadGnt;
   wire        DMA3_CacheReadGnt;
   wire        DMA4_CacheReadGnt;
   wire        DMA5_CacheReadGnt;
   wire        DMA6_CacheReadGnt;
   wire        DMA7_CacheReadGnt;
   wire        DMA8_CacheReadGnt;
   wire        DMA9_CacheReadGnt;
   wire        DMA10_CacheReadGnt;
   wire        DMA11_CacheReadGnt;
   wire        DMA12_CacheReadGnt;
   wire        DMA13_CacheReadGnt;
   wire        DMA14_CacheReadGnt;
   wire        DMA15_CacheReadGnt;
   wire        DMA16_CacheReadGnt;
   wire        DMA17_CacheReadGnt;
   wire        DMA18_CacheReadGnt;
   wire        DMA19_CacheReadGnt;
   wire        DMA20_CacheReadGnt;
   wire        DMA21_CacheReadGnt;
   wire        DMA22_CacheReadGnt;
   wire        DMA23_CacheReadGnt;


   // Arbitration for Cache reads and poping data into  TxC ? To be added here
   assign DMA_ArbForPop = | DMA_CacheReadReq;

   assign DMA_CacheReadReq ={ 8'h0,
/* -----\/----- EXCLUDED -----\/-----
			     DMA31_CacheReadReq, DMA30_CacheReadReq, DMA29_CacheReadReq, DMA28_CacheReadReq,
			     DMA27_CacheReadReq, DMA26_CacheReadReq, DMA25_CacheReadReq, DMA24_CacheReadReq,
 -----/\----- EXCLUDED -----/\----- */
			     DMA23_CacheReadReq, DMA22_CacheReadReq, DMA21_CacheReadReq, DMA20_CacheReadReq,
			     DMA19_CacheReadReq, DMA18_CacheReadReq, DMA17_CacheReadReq, DMA16_CacheReadReq,
			     DMA15_CacheReadReq, DMA14_CacheReadReq, DMA13_CacheReadReq, DMA12_CacheReadReq,
			     DMA11_CacheReadReq, DMA10_CacheReadReq, DMA9_CacheReadReq, DMA8_CacheReadReq,
			     DMA7_CacheReadReq, DMA6_CacheReadReq, DMA5_CacheReadReq, DMA4_CacheReadReq,
			     DMA3_CacheReadReq, DMA2_CacheReadReq, DMA1_CacheReadReq, DMA0_CacheReadReq };

   assign { DMA23_CacheReadGnt, DMA22_CacheReadGnt, DMA21_CacheReadGnt, DMA20_CacheReadGnt,
	    DMA19_CacheReadGnt, DMA18_CacheReadGnt, DMA17_CacheReadGnt, DMA16_CacheReadGnt,
	    DMA15_CacheReadGnt, DMA14_CacheReadGnt, DMA13_CacheReadGnt, DMA12_CacheReadGnt,
	    DMA11_CacheReadGnt, DMA10_CacheReadGnt, DMA9_CacheReadGnt, DMA8_CacheReadGnt,
	    DMA7_CacheReadGnt, DMA6_CacheReadGnt, DMA5_CacheReadGnt, DMA4_CacheReadGnt,
	    DMA3_CacheReadGnt, DMA2_CacheReadGnt, DMA1_CacheReadGnt, DMA0_CacheReadGnt } = DMA_CacheReadGnt[23:0];
   

   niu_dmc_dmaarb dma_pop_arb ( .SysClk(SysClk),
				.Reset_L(Reset_L),
				.Choose_DMAs(DMA_ArbForPop),
				.DMA_Reqs(DMA_CacheReadReq),
				.ArbDone(),
				.DMANum(DMA_NoToPop),
				.DMAsGranted(DMA_CacheReadGnt)
				);
   
   

   always@(/*AUTOJUNK*/DMA0_CacheReadPtr or DMA10_CacheReadPtr
	   or DMA11_CacheReadPtr or DMA12_CacheReadPtr
	   or DMA13_CacheReadPtr or DMA14_CacheReadPtr
	   or DMA15_CacheReadPtr or DMA16_CacheReadPtr
	   or DMA17_CacheReadPtr or DMA18_CacheReadPtr
	   or DMA19_CacheReadPtr or DMA1_CacheReadPtr
	   or DMA20_CacheReadPtr or DMA21_CacheReadPtr
	   or DMA22_CacheReadPtr or DMA23_CacheReadPtr
	   or DMA2_CacheReadPtr or DMA3_CacheReadPtr
	   or DMA4_CacheReadPtr or DMA5_CacheReadPtr
	   or DMA6_CacheReadPtr or DMA7_CacheReadPtr
	   or DMA8_CacheReadPtr or DMA9_CacheReadPtr or DMA_NoToPop
	) begin
	      case(DMA_NoToPop) // Synopsys full_case parallel_case
		// REORDER
		`DMA_CHANNEL_ZERO:  DMA_TxCacheReadPtr = {5'h0,DMA0_CacheReadPtr[2:0] } + `DMA0_Cache_OFFSET;
		`DMA_CHANNEL_ONE:  DMA_TxCacheReadPtr = {5'h0,DMA1_CacheReadPtr[2:0] } + `DMA1_Cache_OFFSET;
		`DMA_CHANNEL_TWO:  DMA_TxCacheReadPtr = {5'h0,DMA2_CacheReadPtr[2:0] } + `DMA2_Cache_OFFSET;
		`DMA_CHANNEL_THREE:  DMA_TxCacheReadPtr = {5'h0,DMA3_CacheReadPtr[2:0] } + `DMA3_Cache_OFFSET;
		`DMA_CHANNEL_FOUR:  DMA_TxCacheReadPtr = {5'h0,DMA4_CacheReadPtr[2:0] }+ `DMA4_Cache_OFFSET;
		`DMA_CHANNEL_FIVE:  DMA_TxCacheReadPtr = {5'h0,DMA5_CacheReadPtr[2:0] }+ `DMA5_Cache_OFFSET;
		`DMA_CHANNEL_SIX:  DMA_TxCacheReadPtr = {5'h0,DMA6_CacheReadPtr[2:0] }+ `DMA6_Cache_OFFSET;
		`DMA_CHANNEL_SEVEN:  DMA_TxCacheReadPtr = {5'h0,DMA7_CacheReadPtr[2:0] } + `DMA7_Cache_OFFSET;
		`DMA_CHANNEL_EIGHT:  DMA_TxCacheReadPtr = {5'h0,DMA8_CacheReadPtr[2:0] } + `DMA8_Cache_OFFSET;
		`DMA_CHANNEL_NINE:  DMA_TxCacheReadPtr = {5'h0,DMA9_CacheReadPtr[2:0] }+ `DMA9_Cache_OFFSET;
		`DMA_CHANNEL_TEN:  DMA_TxCacheReadPtr = {5'h0,DMA10_CacheReadPtr[2:0] }+ `DMA10_Cache_OFFSET;
		`DMA_CHANNEL_ELEVEN:  DMA_TxCacheReadPtr = {5'h0,DMA11_CacheReadPtr[2:0] }+ `DMA11_Cache_OFFSET;
		`DMA_CHANNEL_TWELVE:  DMA_TxCacheReadPtr = {5'h0,DMA12_CacheReadPtr[2:0] }+ `DMA12_Cache_OFFSET;
		`DMA_CHANNEL_THIRTEEN:  DMA_TxCacheReadPtr = {5'h0,DMA13_CacheReadPtr[2:0] }+ `DMA13_Cache_OFFSET;
		`DMA_CHANNEL_FOURTEEN:  DMA_TxCacheReadPtr = {5'h0,DMA14_CacheReadPtr[2:0] }+ `DMA14_Cache_OFFSET;
		`DMA_CHANNEL_FIFTEEN:  DMA_TxCacheReadPtr = {5'h0,DMA15_CacheReadPtr[2:0] }+ `DMA15_Cache_OFFSET;
		`DMA_CHANNEL_SIXTEEN:  DMA_TxCacheReadPtr = {5'h0,DMA16_CacheReadPtr[2:0] }+ `DMA16_Cache_OFFSET;
		`DMA_CHANNEL_SEVENTEEN:  DMA_TxCacheReadPtr = {5'h0,DMA17_CacheReadPtr[2:0] } + `DMA17_Cache_OFFSET;
		`DMA_CHANNEL_EIGHTEEN:  DMA_TxCacheReadPtr = {5'h0,DMA18_CacheReadPtr[2:0] }+ `DMA18_Cache_OFFSET;
		`DMA_CHANNEL_NINETEEN:  DMA_TxCacheReadPtr = {5'h0,DMA19_CacheReadPtr[2:0] }+ `DMA19_Cache_OFFSET;
		`DMA_CHANNEL_TWENTY:  DMA_TxCacheReadPtr = {5'h0,DMA20_CacheReadPtr[2:0] }+ `DMA20_Cache_OFFSET;
		`DMA_CHANNEL_TWENTYONE:  DMA_TxCacheReadPtr = {5'h0,DMA21_CacheReadPtr[2:0] }+ `DMA21_Cache_OFFSET;
		`DMA_CHANNEL_TWENTYTWO:  DMA_TxCacheReadPtr = {5'h0,DMA22_CacheReadPtr[2:0] }+ `DMA22_Cache_OFFSET;
		`DMA_CHANNEL_TWENTYTHREE:  DMA_TxCacheReadPtr = {5'h0,DMA23_CacheReadPtr[2:0] }+ `DMA23_Cache_OFFSET;
		default: DMA_TxCacheReadPtr = 8'h0;
	      endcase // case(DMA_NoToPop)
	   end // always@ ( DMA_NoToPop or DMA0_CacheReadPtr or DMA1_CacheReadPtr )
   
   always@(/*AUTOJUNK*/DMA0_CacheReadGnt or DMA10_CacheReadGnt
	   or DMA11_CacheReadGnt or DMA12_CacheReadGnt
	   or DMA13_CacheReadGnt or DMA14_CacheReadGnt
	   or DMA15_CacheReadGnt or DMA16_CacheReadGnt
	   or DMA17_CacheReadGnt or DMA18_CacheReadGnt
	   or DMA19_CacheReadGnt or DMA1_CacheReadGnt
	   or DMA20_CacheReadGnt or DMA21_CacheReadGnt
	   or DMA22_CacheReadGnt or DMA23_CacheReadGnt
	   or DMA2_CacheReadGnt or DMA3_CacheReadGnt
	   or DMA4_CacheReadGnt or DMA5_CacheReadGnt
	   or DMA6_CacheReadGnt or DMA7_CacheReadGnt
	   or DMA8_CacheReadGnt or DMA9_CacheReadGnt or DMA_NoToPop
	   ) begin
	      case(DMA_NoToPop) // synopsys full_case parallel_case
		`DMA_CHANNEL_ZERO: DMA_TxCacheRead = DMA0_CacheReadGnt;
		`DMA_CHANNEL_ONE: DMA_TxCacheRead = DMA1_CacheReadGnt;
		`DMA_CHANNEL_TWO: DMA_TxCacheRead = DMA2_CacheReadGnt;
		`DMA_CHANNEL_THREE: DMA_TxCacheRead = DMA3_CacheReadGnt;
		`DMA_CHANNEL_FOUR: DMA_TxCacheRead = DMA4_CacheReadGnt;
		`DMA_CHANNEL_FIVE: DMA_TxCacheRead = DMA5_CacheReadGnt;
		`DMA_CHANNEL_SIX: DMA_TxCacheRead = DMA6_CacheReadGnt;
		`DMA_CHANNEL_SEVEN: DMA_TxCacheRead = DMA7_CacheReadGnt;
		`DMA_CHANNEL_EIGHT: DMA_TxCacheRead = DMA8_CacheReadGnt;
		`DMA_CHANNEL_NINE: DMA_TxCacheRead = DMA9_CacheReadGnt;
		`DMA_CHANNEL_TEN: DMA_TxCacheRead = DMA10_CacheReadGnt;
		`DMA_CHANNEL_ELEVEN: DMA_TxCacheRead = DMA11_CacheReadGnt;
		`DMA_CHANNEL_TWELVE: DMA_TxCacheRead = DMA12_CacheReadGnt;
		`DMA_CHANNEL_THIRTEEN: DMA_TxCacheRead = DMA13_CacheReadGnt;
		`DMA_CHANNEL_FOURTEEN: DMA_TxCacheRead = DMA14_CacheReadGnt;
		`DMA_CHANNEL_FIFTEEN: DMA_TxCacheRead = DMA15_CacheReadGnt;
		`DMA_CHANNEL_SIXTEEN: DMA_TxCacheRead = DMA16_CacheReadGnt;
		`DMA_CHANNEL_SEVENTEEN: DMA_TxCacheRead = DMA17_CacheReadGnt;
		`DMA_CHANNEL_EIGHTEEN: DMA_TxCacheRead = DMA18_CacheReadGnt;
		`DMA_CHANNEL_NINETEEN: DMA_TxCacheRead = DMA19_CacheReadGnt;
		`DMA_CHANNEL_TWENTY: DMA_TxCacheRead = DMA20_CacheReadGnt;
		`DMA_CHANNEL_TWENTYONE: DMA_TxCacheRead = DMA21_CacheReadGnt;
		`DMA_CHANNEL_TWENTYTWO: DMA_TxCacheRead = DMA22_CacheReadGnt;
		`DMA_CHANNEL_TWENTYTHREE: DMA_TxCacheRead = DMA23_CacheReadGnt;
		default: DMA_TxCacheRead = 1'b0;
	      endcase // case(DMA_NoToPop)
	   end  // always@ (...


endmodule
