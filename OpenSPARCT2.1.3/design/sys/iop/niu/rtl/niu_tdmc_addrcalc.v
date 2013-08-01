// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_tdmc_addrcalc.v
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
module niu_tdmc_addrcalc (/*AUTOJUNK*/
   // Outputs
   NoOfFreeSpaceInCache, DMA_AddressToReq_ff,  
   ShadowRingWrap, NoOfDescInMem, NoOfDescLeft, 
   // Inputs
   LatchDMAPtrs, DMANumToReq, tx_rng_tail_dma0, 
   ShadowRingCurrentPtr_DMA0, DMA0_EmptySpace, DMA0_RingLength, 
   DMA0_Ring_Wrapped, DMA0_Address, tx_rng_tail_dma1, 
   ShadowRingCurrentPtr_DMA1, DMA1_EmptySpace, DMA1_RingLength, 
   DMA1_Ring_Wrapped, DMA1_Address, tx_rng_tail_dma2, 
   ShadowRingCurrentPtr_DMA2, DMA2_EmptySpace, DMA2_RingLength, 
   DMA2_Ring_Wrapped, DMA2_Address, tx_rng_tail_dma3, 
   ShadowRingCurrentPtr_DMA3, DMA3_EmptySpace, DMA3_RingLength, 
   DMA3_Ring_Wrapped, DMA3_Address, tx_rng_tail_dma4, 
   ShadowRingCurrentPtr_DMA4, DMA4_EmptySpace, DMA4_RingLength, 
   DMA4_Ring_Wrapped, DMA4_Address, tx_rng_tail_dma5, 
   ShadowRingCurrentPtr_DMA5, DMA5_EmptySpace, DMA5_RingLength, 
   DMA5_Ring_Wrapped, DMA5_Address, tx_rng_tail_dma6, 
   ShadowRingCurrentPtr_DMA6, DMA6_EmptySpace, DMA6_RingLength, 
   DMA6_Ring_Wrapped, DMA6_Address, tx_rng_tail_dma7, 
   ShadowRingCurrentPtr_DMA7, DMA7_EmptySpace, DMA7_RingLength, 
   DMA7_Ring_Wrapped, DMA7_Address, tx_rng_tail_dma8, 
   ShadowRingCurrentPtr_DMA8, DMA8_EmptySpace, DMA8_RingLength, 
   DMA8_Ring_Wrapped, DMA8_Address, tx_rng_tail_dma9, 
   ShadowRingCurrentPtr_DMA9, DMA9_EmptySpace, DMA9_RingLength, 
   DMA9_Ring_Wrapped, DMA9_Address, tx_rng_tail_dma10, 
   ShadowRingCurrentPtr_DMA10, DMA10_EmptySpace, DMA10_RingLength, 
   DMA10_Ring_Wrapped, DMA10_Address, tx_rng_tail_dma11, 
   ShadowRingCurrentPtr_DMA11, DMA11_EmptySpace, DMA11_RingLength, 
   DMA11_Ring_Wrapped, DMA11_Address, tx_rng_tail_dma12, 
   ShadowRingCurrentPtr_DMA12, DMA12_EmptySpace, DMA12_RingLength, 
   DMA12_Ring_Wrapped, DMA12_Address, tx_rng_tail_dma13, 
   ShadowRingCurrentPtr_DMA13, DMA13_EmptySpace, DMA13_RingLength, 
   DMA13_Ring_Wrapped, DMA13_Address, tx_rng_tail_dma14, 
   ShadowRingCurrentPtr_DMA14, DMA14_EmptySpace, DMA14_RingLength, 
   DMA14_Ring_Wrapped, DMA14_Address, tx_rng_tail_dma15, 
   ShadowRingCurrentPtr_DMA15, DMA15_EmptySpace, DMA15_RingLength, 
   DMA15_Ring_Wrapped, DMA15_Address, 
`ifdef NEPTUNE

   tx_rng_tail_dma16, 
   ShadowRingCurrentPtr_DMA16, DMA16_EmptySpace, DMA16_RingLength, 
   DMA16_Ring_Wrapped, DMA16_Address, tx_rng_tail_dma17, 
   ShadowRingCurrentPtr_DMA17, DMA17_EmptySpace, DMA17_RingLength, 
   DMA17_Ring_Wrapped, DMA17_Address, tx_rng_tail_dma18, 
   ShadowRingCurrentPtr_DMA18, DMA18_EmptySpace, DMA18_RingLength, 
   DMA18_Ring_Wrapped, DMA18_Address, tx_rng_tail_dma19, 
   ShadowRingCurrentPtr_DMA19, DMA19_EmptySpace, DMA19_RingLength, 
   DMA19_Ring_Wrapped, DMA19_Address, tx_rng_tail_dma20, 
   ShadowRingCurrentPtr_DMA20, DMA20_EmptySpace, DMA20_RingLength, 
   DMA20_Ring_Wrapped, DMA20_Address, tx_rng_tail_dma21, 
   ShadowRingCurrentPtr_DMA21, DMA21_EmptySpace, DMA21_RingLength, 
   DMA21_Ring_Wrapped, DMA21_Address, tx_rng_tail_dma22, 
   ShadowRingCurrentPtr_DMA22, DMA22_EmptySpace, DMA22_RingLength, 
   DMA22_Ring_Wrapped, DMA22_Address, tx_rng_tail_dma23, 
   ShadowRingCurrentPtr_DMA23, DMA23_EmptySpace, DMA23_RingLength, 
   DMA23_Ring_Wrapped, DMA23_Address,
`else
`endif // !ifdef CHANNELS_16
 SysClk, Reset_L
   );

   output [4:0]  NoOfFreeSpaceInCache ;
   output [63:0] DMA_AddressToReq_ff ;
   output 	 ShadowRingWrap ;

   output [`PTR_WIDTH - 1:0] NoOfDescInMem;
   output [`PTR_WIDTH - 1:0] NoOfDescLeft;

   input 	 LatchDMAPtrs;
   input [4:0] 	 DMANumToReq;

   input [`PTR_WIDTH :0]  tx_rng_tail_dma0;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA0;
   input [3:0] 	 DMA0_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA0_RingLength;
   input 	 DMA0_Ring_Wrapped;
   input [63:0]  DMA0_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma1;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA1;
   input [3:0] 	 DMA1_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA1_RingLength;
   input 	 DMA1_Ring_Wrapped;
   input [63:0]  DMA1_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma2;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA2;
   input [3:0] 	 DMA2_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA2_RingLength;
   input 	 DMA2_Ring_Wrapped;
   input [63:0]  DMA2_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma3;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA3;
   input [3:0] 	 DMA3_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA3_RingLength;
   input 	 DMA3_Ring_Wrapped;
   input [63:0]  DMA3_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma4;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA4;
   input [3:0] 	 DMA4_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA4_RingLength;
   input 	 DMA4_Ring_Wrapped;
   input [63:0]  DMA4_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma5;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA5;
   input [3:0] 	 DMA5_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA5_RingLength;
   input 	 DMA5_Ring_Wrapped;
   input [63:0]  DMA5_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma6;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA6;
   input [3:0] 	 DMA6_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA6_RingLength;
   input 	 DMA6_Ring_Wrapped;
   input [63:0]  DMA6_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma7;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA7;
   input [3:0] 	 DMA7_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA7_RingLength;
   input 	 DMA7_Ring_Wrapped;
   input [63:0]  DMA7_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma8;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA8;
   input [3:0] 	 DMA8_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA8_RingLength;
   input 	 DMA8_Ring_Wrapped;
   input [63:0]  DMA8_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma9;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA9;
   input [3:0] 	 DMA9_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA9_RingLength;
   input 	 DMA9_Ring_Wrapped;
   input [63:0]  DMA9_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma10;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA10;
   input [3:0] 	 DMA10_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA10_RingLength;
   input 	 DMA10_Ring_Wrapped;
   input [63:0]  DMA10_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma11;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA11;
   input [3:0] 	 DMA11_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA11_RingLength;
   input 	 DMA11_Ring_Wrapped;
   input [63:0]  DMA11_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma12;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA12;
   input [3:0] 	 DMA12_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA12_RingLength;
   input 	 DMA12_Ring_Wrapped;
   input [63:0]  DMA12_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma13;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA13;
   input [3:0] 	 DMA13_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA13_RingLength;
   input 	 DMA13_Ring_Wrapped;
   input [63:0]  DMA13_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma14;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA14;
   input [3:0] 	 DMA14_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA14_RingLength;
   input 	 DMA14_Ring_Wrapped;
   input [63:0]  DMA14_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma15;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA15;
   input [3:0] 	 DMA15_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA15_RingLength;
   input 	 DMA15_Ring_Wrapped;
   input [63:0]  DMA15_Address;
`ifdef NEPTUNE
   
   input [`PTR_WIDTH :0]  tx_rng_tail_dma16;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA16;
   input [3:0] 	 DMA16_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA16_RingLength;
   input 	 DMA16_Ring_Wrapped;
   input [63:0]  DMA16_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma17;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA17;
   input [3:0] 	 DMA17_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA17_RingLength;
   input 	 DMA17_Ring_Wrapped;
   input [63:0]  DMA17_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma18;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA18;
   input [3:0] 	 DMA18_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA18_RingLength;
   input 	 DMA18_Ring_Wrapped;
   input [63:0]  DMA18_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma19;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA19;
   input [3:0] 	 DMA19_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA19_RingLength;
   input 	 DMA19_Ring_Wrapped;
   input [63:0]  DMA19_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma20;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA20;
   input [3:0] 	 DMA20_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA20_RingLength;
   input 	 DMA20_Ring_Wrapped;
   input [63:0]  DMA20_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma21;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA21;
   input [3:0] 	 DMA21_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA21_RingLength;
   input 	 DMA21_Ring_Wrapped;
   input [63:0]  DMA21_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma22;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA22;
   input [3:0] 	 DMA22_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA22_RingLength;
   input 	 DMA22_Ring_Wrapped;
   input [63:0]  DMA22_Address;
   input [`PTR_WIDTH :0]  tx_rng_tail_dma23;
   input [`PTR_WIDTH - 1:0]  ShadowRingCurrentPtr_DMA23;
   input [3:0] 	 DMA23_EmptySpace;
   input [`PTR_WIDTH - 1:0]  DMA23_RingLength;
   input 	 DMA23_Ring_Wrapped;
   input [63:0]  DMA23_Address;

`else
`endif
   
   
   input 	 SysClk;
   input 	 Reset_L;
   
   reg [4:0] 	 NoOfFreeSpaceInCache ;
   reg 		 ShadowRingWrap ;
   reg [63:0] 	 DMA_AddressToReq_ff ;

reg [`PTR_WIDTH - 1:0] 	 NoOfDescInMem;
reg [`PTR_WIDTH - 1:0] 	 NoOfDescLeft;



reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA0;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA0;
// code for different logic for pointer wrap arounds
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA0 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA0 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA0 <=  ~DMA0_Ring_Wrapped ? ( tx_rng_tail_dma0[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA0 ) : ( DMA0_RingLength - (ShadowRingCurrentPtr_DMA0 - tx_rng_tail_dma0[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA0  <=  DMA0_RingLength - ShadowRingCurrentPtr_DMA0 ;
end // always@ (...

reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA1;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA1;
// code for different logic for pointer wrap arounds
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA1 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA1 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA1 <=  ~DMA1_Ring_Wrapped ? ( tx_rng_tail_dma1[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA1 ) : ( DMA1_RingLength - (ShadowRingCurrentPtr_DMA1 - tx_rng_tail_dma1[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA1  <=  DMA1_RingLength - ShadowRingCurrentPtr_DMA1 ;
end // always@ (...

reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA2;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA2;
// code for different logic for pointer wrap arounds
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA2 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA2 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA2 <=  ~DMA2_Ring_Wrapped ? ( tx_rng_tail_dma2[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA2 ) : ( DMA2_RingLength - (ShadowRingCurrentPtr_DMA2 - tx_rng_tail_dma2[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA2  <=  DMA2_RingLength - ShadowRingCurrentPtr_DMA2 ;
end // always@ (...

reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA3;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA3;
// code for different logic for pointer wrap arounds
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA3 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA3 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA3 <=  ~DMA3_Ring_Wrapped ? ( tx_rng_tail_dma3[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA3 ) : ( DMA3_RingLength - (ShadowRingCurrentPtr_DMA3 - tx_rng_tail_dma3[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA3  <=  DMA3_RingLength - ShadowRingCurrentPtr_DMA3 ;
end // always@ (...

reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA4;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA4;
// code for different logic for pointer wrap arounds
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA4 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA4 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA4 <=  ~DMA4_Ring_Wrapped ? ( tx_rng_tail_dma4[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA4 ) : ( DMA4_RingLength - (ShadowRingCurrentPtr_DMA4 - tx_rng_tail_dma4[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA4  <=  DMA4_RingLength - ShadowRingCurrentPtr_DMA4 ;
end // always@ (...

reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA5;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA5;
// code for different logic for pointer wrap arounds
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA5 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA5 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA5 <=  ~DMA5_Ring_Wrapped ? ( tx_rng_tail_dma5[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA5 ) : ( DMA5_RingLength - (ShadowRingCurrentPtr_DMA5 - tx_rng_tail_dma5[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA5  <=  DMA5_RingLength - ShadowRingCurrentPtr_DMA5 ;
end // always@ (...

reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA6;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA6;
// code for different logic for pointer wrap arounds
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA6 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA6 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA6 <=  ~DMA6_Ring_Wrapped ? ( tx_rng_tail_dma6[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA6 ) : ( DMA6_RingLength - (ShadowRingCurrentPtr_DMA6 - tx_rng_tail_dma6[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA6  <=  DMA6_RingLength - ShadowRingCurrentPtr_DMA6 ;
end // always@ (...

reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA7;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA7;
// code for different logic for pointer wrap arounds
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA7 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA7 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA7 <=  ~DMA7_Ring_Wrapped ? ( tx_rng_tail_dma7[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA7 ) : ( DMA7_RingLength - (ShadowRingCurrentPtr_DMA7 - tx_rng_tail_dma7[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA7  <=  DMA7_RingLength - ShadowRingCurrentPtr_DMA7 ;
end // always@ (...

reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA8;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA8;
// code for different logic for pointer wrap arounds
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA8 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA8 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA8 <=  ~DMA8_Ring_Wrapped ? ( tx_rng_tail_dma8[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA8 ) : ( DMA8_RingLength - (ShadowRingCurrentPtr_DMA8 - tx_rng_tail_dma8[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA8  <=  DMA8_RingLength - ShadowRingCurrentPtr_DMA8 ;
end // always@ (...

reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA9;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA9;
// code for different logic for pointer wrap arounds
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA9 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA9 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA9 <=  ~DMA9_Ring_Wrapped ? ( tx_rng_tail_dma9[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA9 ) : ( DMA9_RingLength - (ShadowRingCurrentPtr_DMA9 - tx_rng_tail_dma9[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA9  <=  DMA9_RingLength - ShadowRingCurrentPtr_DMA9 ;
end // always@ (...

reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA10;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA10;
// code for different logic for pointer wrap arounds
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA10 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA10 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA10 <=  ~DMA10_Ring_Wrapped ? ( tx_rng_tail_dma10[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA10 ) : ( DMA10_RingLength - (ShadowRingCurrentPtr_DMA10 - tx_rng_tail_dma10[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA10  <=  DMA10_RingLength - ShadowRingCurrentPtr_DMA10 ;
end // always@ (...

reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA11;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA11;
// code for different logic for pointer wrap arounds
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA11 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA11 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA11 <=  ~DMA11_Ring_Wrapped ? ( tx_rng_tail_dma11[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA11 ) : ( DMA11_RingLength - (ShadowRingCurrentPtr_DMA11 - tx_rng_tail_dma11[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA11  <=  DMA11_RingLength - ShadowRingCurrentPtr_DMA11 ;
end // always@ (...

reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA12;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA12;
// code for different logic for pointer wrap arounds
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA12 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA12 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA12 <=  ~DMA12_Ring_Wrapped ? ( tx_rng_tail_dma12[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA12 ) : ( DMA12_RingLength - (ShadowRingCurrentPtr_DMA12 - tx_rng_tail_dma12[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA12  <=  DMA12_RingLength - ShadowRingCurrentPtr_DMA12 ;
end // always@ (...

reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA13;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA13;
// code for different logic for pointer wrap arounds
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA13 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA13 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA13 <=  ~DMA13_Ring_Wrapped ? ( tx_rng_tail_dma13[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA13 ) : ( DMA13_RingLength - (ShadowRingCurrentPtr_DMA13 - tx_rng_tail_dma13[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA13  <=  DMA13_RingLength - ShadowRingCurrentPtr_DMA13 ;
end // always@ (...

reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA14;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA14;
// code for different logic for pointer wrap arounds
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA14 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA14 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA14 <=  ~DMA14_Ring_Wrapped ? ( tx_rng_tail_dma14[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA14 ) : ( DMA14_RingLength - (ShadowRingCurrentPtr_DMA14 - tx_rng_tail_dma14[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA14  <=  DMA14_RingLength - ShadowRingCurrentPtr_DMA14 ;
end // always@ (...

reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA15;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA15;
// code for different logic for pointer wrap arounds
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA15 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA15 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA15 <=  ~DMA15_Ring_Wrapped ? ( tx_rng_tail_dma15[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA15 ) : ( DMA15_RingLength - (ShadowRingCurrentPtr_DMA15 - tx_rng_tail_dma15[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA15  <=  DMA15_RingLength - ShadowRingCurrentPtr_DMA15 ;
end // always@ (...

`ifdef NEPTUNE
reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA16;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA16;
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA16 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA16 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA16 <=  ~DMA16_Ring_Wrapped ? ( tx_rng_tail_dma16[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA16 ) : ( DMA16_RingLength - (ShadowRingCurrentPtr_DMA16 - tx_rng_tail_dma16[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA16  <=  DMA16_RingLength - ShadowRingCurrentPtr_DMA16 ;
end // always@ (...
reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA17;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA17;
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA17 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA17 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA17 <=  ~DMA17_Ring_Wrapped ? ( tx_rng_tail_dma17[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA17 ) : ( DMA17_RingLength - (ShadowRingCurrentPtr_DMA17 - tx_rng_tail_dma17[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA17  <=  DMA17_RingLength - ShadowRingCurrentPtr_DMA17 ;
end // always@ (...
reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA18;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA18;
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA18 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA18 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA18 <=  ~DMA18_Ring_Wrapped ? ( tx_rng_tail_dma18[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA18 ) : ( DMA18_RingLength - (ShadowRingCurrentPtr_DMA18 - tx_rng_tail_dma18[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA18  <=  DMA18_RingLength - ShadowRingCurrentPtr_DMA18 ;
end // always@ (...
reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA19;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA19;
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA19 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA19 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA19 <=  ~DMA19_Ring_Wrapped ? ( tx_rng_tail_dma19[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA19 ) : ( DMA19_RingLength - (ShadowRingCurrentPtr_DMA19 - tx_rng_tail_dma19[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA19  <=  DMA19_RingLength - ShadowRingCurrentPtr_DMA19 ;
end // always@ (...
reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA20;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA20;
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA20 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA20 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA20 <=  ~DMA20_Ring_Wrapped ? ( tx_rng_tail_dma20[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA20 ) : ( DMA20_RingLength - (ShadowRingCurrentPtr_DMA20 - tx_rng_tail_dma20[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA20  <=  DMA20_RingLength - ShadowRingCurrentPtr_DMA20 ;
end // always@ (...
reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA21;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA21;
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA21 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA21 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA21 <=  ~DMA21_Ring_Wrapped ? ( tx_rng_tail_dma21[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA21 ) : ( DMA21_RingLength - (ShadowRingCurrentPtr_DMA21 - tx_rng_tail_dma21[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA21  <=  DMA21_RingLength - ShadowRingCurrentPtr_DMA21 ;
end // always@ (...
reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA22;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA22;
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA22 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA22 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA22 <=  ~DMA22_Ring_Wrapped ? ( tx_rng_tail_dma22[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA22 ) : ( DMA22_RingLength - (ShadowRingCurrentPtr_DMA22 - tx_rng_tail_dma22[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA22  <=  DMA22_RingLength - ShadowRingCurrentPtr_DMA22 ;
end // always@ (...
reg [`PTR_WIDTH - 1:0]   NoOfDescInMem_DMA23;
reg [`PTR_WIDTH - 1:0]   NoOfDescLeft_DMA23;
always@(posedge SysClk)
if(!Reset_L) begin
  NoOfDescInMem_DMA23 <= `PTR_WIDTH'h0;
  NoOfDescLeft_DMA23 <= `PTR_WIDTH'h0;
end else begin
        NoOfDescInMem_DMA23 <=  ~DMA23_Ring_Wrapped ? ( tx_rng_tail_dma23[`PTR_WIDTH - 1:0] - ShadowRingCurrentPtr_DMA23 ) : ( DMA23_RingLength - (ShadowRingCurrentPtr_DMA23 - tx_rng_tail_dma23[`PTR_WIDTH - 1:0] ));
        NoOfDescLeft_DMA23  <=  DMA23_RingLength - ShadowRingCurrentPtr_DMA23 ;
end // always@ (...
`else
`endif

   // this will change to accomodate new ptr manipulations
   
   //--add here
   // synopsys infer_mux "dma_addr_calc_mux"
   always@(posedge SysClk )
     if (!Reset_L) begin
	NoOfFreeSpaceInCache <= 5'h0;
	DMA_AddressToReq_ff <= 64'h0;
	NoOfDescInMem <= `PTR_WIDTH'h0;
	NoOfDescLeft  <= `PTR_WIDTH'h0;
	ShadowRingWrap <= 1'b0;
     end else begin
	if(LatchDMAPtrs) begin:dma_addr_calc_mux
	   case(DMANumToReq)  // synopsys full_case parallel_case


 	     `DMA_CHANNEL_ZERO: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA0;
		NoOfDescLeft  <= NoOfDescLeft_DMA0;
		NoOfFreeSpaceInCache <= {DMA0_EmptySpace,1'b0};
                ShadowRingWrap <= DMA0_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA0_Address ;
	     end
	     `DMA_CHANNEL_ONE: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA1;
		NoOfDescLeft  <= NoOfDescLeft_DMA1;
		NoOfFreeSpaceInCache <= {DMA1_EmptySpace,1'b0};
                ShadowRingWrap <= DMA1_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA1_Address ;
	     end
	     `DMA_CHANNEL_TWO: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA2;
		NoOfDescLeft  <= NoOfDescLeft_DMA2;
		NoOfFreeSpaceInCache <= {DMA2_EmptySpace,1'b0};
                ShadowRingWrap <= DMA2_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA2_Address ;
	     end
	     `DMA_CHANNEL_THREE: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA3;
		NoOfDescLeft  <= NoOfDescLeft_DMA3;
		NoOfFreeSpaceInCache <= {DMA3_EmptySpace,1'b0};
                ShadowRingWrap <= DMA3_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA3_Address ;
	     end
	     `DMA_CHANNEL_FOUR: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA4;
		NoOfDescLeft  <= NoOfDescLeft_DMA4;
		NoOfFreeSpaceInCache <= {DMA4_EmptySpace,1'b0};
                ShadowRingWrap <= DMA4_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA4_Address ;
	     end
	     `DMA_CHANNEL_FIVE: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA5;
		NoOfDescLeft  <= NoOfDescLeft_DMA5;
		NoOfFreeSpaceInCache <= {DMA5_EmptySpace,1'b0};
                ShadowRingWrap <= DMA5_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA5_Address ;
	     end
	     `DMA_CHANNEL_SIX: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA6;
		NoOfDescLeft  <= NoOfDescLeft_DMA6;
		NoOfFreeSpaceInCache <= {DMA6_EmptySpace,1'b0};
                ShadowRingWrap <= DMA6_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA6_Address ;
	     end
	     `DMA_CHANNEL_SEVEN: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA7;
		NoOfDescLeft  <= NoOfDescLeft_DMA7;
		NoOfFreeSpaceInCache <= {DMA7_EmptySpace,1'b0};
                ShadowRingWrap <= DMA7_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA7_Address ;
	     end
	     `DMA_CHANNEL_EIGHT: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA8;
		NoOfDescLeft  <= NoOfDescLeft_DMA8;
		NoOfFreeSpaceInCache <= {DMA8_EmptySpace,1'b0};
                ShadowRingWrap <= DMA8_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA8_Address ;
	     end
	     `DMA_CHANNEL_NINE: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA9;
		NoOfDescLeft  <= NoOfDescLeft_DMA9;
		NoOfFreeSpaceInCache <= {DMA9_EmptySpace,1'b0};
                ShadowRingWrap <= DMA9_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA9_Address ;
	     end
	     `DMA_CHANNEL_TEN: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA10;
		NoOfDescLeft  <= NoOfDescLeft_DMA10;
		NoOfFreeSpaceInCache <= {DMA10_EmptySpace,1'b0};
                ShadowRingWrap <= DMA10_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA10_Address ;
	     end
	     `DMA_CHANNEL_ELEVEN: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA11;
		NoOfDescLeft  <= NoOfDescLeft_DMA11;
		NoOfFreeSpaceInCache <= {DMA11_EmptySpace,1'b0};
                ShadowRingWrap <= DMA11_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA11_Address ;
	     end
	     `DMA_CHANNEL_TWELVE: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA12;
		NoOfDescLeft  <= NoOfDescLeft_DMA12;
		NoOfFreeSpaceInCache <= {DMA12_EmptySpace,1'b0};
                ShadowRingWrap <= DMA12_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA12_Address ;
	     end
	     `DMA_CHANNEL_THIRTEEN: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA13;
		NoOfDescLeft  <= NoOfDescLeft_DMA13;
		NoOfFreeSpaceInCache <= {DMA13_EmptySpace,1'b0};
                ShadowRingWrap <= DMA13_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA13_Address ;
	     end
	     `DMA_CHANNEL_FOURTEEN: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA14;
		NoOfDescLeft  <= NoOfDescLeft_DMA14;
		NoOfFreeSpaceInCache <= {DMA14_EmptySpace,1'b0};
                ShadowRingWrap <= DMA14_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA14_Address ;
	     end
	     `DMA_CHANNEL_FIFTEEN: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA15;
		NoOfDescLeft  <= NoOfDescLeft_DMA15;
		NoOfFreeSpaceInCache <= {DMA15_EmptySpace,1'b0};
                ShadowRingWrap <= DMA15_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA15_Address ;
	     end
`ifdef NEPTUNE
	     
	     `DMA_CHANNEL_SIXTEEN: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA16;
		NoOfDescLeft  <= NoOfDescLeft_DMA16;
		NoOfFreeSpaceInCache <= {DMA16_EmptySpace,1'b0};
                ShadowRingWrap <= DMA16_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA16_Address ;
	     end
	     `DMA_CHANNEL_SEVENTEEN: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA17;
		NoOfDescLeft  <= NoOfDescLeft_DMA17;
		NoOfFreeSpaceInCache <= {DMA17_EmptySpace,1'b0};
                ShadowRingWrap <= DMA17_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA17_Address ;
	     end
	     `DMA_CHANNEL_EIGHTEEN: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA18;
		NoOfDescLeft  <= NoOfDescLeft_DMA18;
		NoOfFreeSpaceInCache <= {DMA18_EmptySpace,1'b0};
                ShadowRingWrap <= DMA18_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA18_Address ;
	     end
	     `DMA_CHANNEL_NINETEEN: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA19;
		NoOfDescLeft  <= NoOfDescLeft_DMA19;
		NoOfFreeSpaceInCache <= {DMA19_EmptySpace,1'b0};
                ShadowRingWrap <= DMA19_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA19_Address ;
	     end
	     `DMA_CHANNEL_TWENTY: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA20;
		NoOfDescLeft  <= NoOfDescLeft_DMA20;
		NoOfFreeSpaceInCache <= {DMA20_EmptySpace,1'b0};
                ShadowRingWrap <= DMA20_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA20_Address ;
	     end
	     `DMA_CHANNEL_TWENTYONE: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA21;
		NoOfDescLeft  <= NoOfDescLeft_DMA21;
		NoOfFreeSpaceInCache <= {DMA21_EmptySpace,1'b0};
                ShadowRingWrap <= DMA21_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA21_Address ;
	     end
	     `DMA_CHANNEL_TWENTYTWO: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA22;
		NoOfDescLeft  <= NoOfDescLeft_DMA22;
		NoOfFreeSpaceInCache <= {DMA22_EmptySpace,1'b0};
                ShadowRingWrap <= DMA22_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA22_Address ;
	     end
	     `DMA_CHANNEL_TWENTYTHREE: begin
  		NoOfDescInMem <= NoOfDescInMem_DMA23;
		NoOfDescLeft  <= NoOfDescLeft_DMA23;
		NoOfFreeSpaceInCache <= {DMA23_EmptySpace,1'b0};
                ShadowRingWrap <= DMA23_Ring_Wrapped;
		DMA_AddressToReq_ff <= DMA23_Address ;
	     end
 
`else
`endif


	     default: begin
                ShadowRingWrap <= 1'b0;
		NoOfDescInMem <= `PTR_WIDTH'h0;
		NoOfDescLeft  <= `PTR_WIDTH'h0;
		NoOfFreeSpaceInCache <= 5'h0;
		DMA_AddressToReq_ff <= 64'h0;
	     end
	   endcase // case(DMANumToReq)
	end // if (LatchDMAPtrs)
     end // else: !if(!Reset_L)
   
endmodule // niu_tdmc_addrcalc
