// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_reAligner.v
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
 *  niu_txc_reAligner.v.v
 *
 *  Anchor and ReAligner State Machine
 *
 *  Orignal Author(s):   Rahoul Puri
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

`include "timescale.v"

module niu_txc_reAligner (
         SysClk,                // Clock
         Reset_L,               // Reset_L
         Txc_Enabled,           // Txc Enable
         EnableGMACMode,
         PortIndentifier,

         ClearStatistics,
         WrPacketRequested,
         WrPacketStuffed,
         WrTidsInUse,
         WrDuplicateTid,
         WrUnInitializedTID,
         WrTimedoutTids,
         WrReOrderStateLogic,
         WrReOrderStateControl,
         WrReOrderStateData0,
         WrReOrderStateData1,
         WrReOrderStateData2,
         WrReOrderStateData3,
         PioDataIn,
         GatherRequestCount,
         PacketRequestCount,
         ReOrdersStuffed,
         TidsInUse,
         DuplicateTid,
         UnInitializedTID,
         TimedoutTids,
         ReOrderStateLogic,
         ReOrderStateControl,
         ReOrderStateData0,
         ReOrderStateData1,
         ReOrderStateData2,
         ReOrderStateData3,

         MAC_Enabled,
         MaxReorderNumber,

         UpdateDMA,
         UpdateDMALength,
         UpdateDMANumber,

         ReOrderFifoRead,
         ReOrderEccControl,
         ReOrderCorruptECCSingle,
         ReOrderCorruptECCDouble,
         ReOrderFifoWrite,
         ReOrderFifoReadStrobe,
         ReOrderFifoEmpty,
         ReOrderFifoAlmostEmpty,
         ReOrderWritePtr,
         ReOrderReadPtr,
         ReOrderEngineDataOut,

         Req_Anchor,
         Anchor_LoadTID,
         Anchor_MarkBit,
         Anchor_SopBit,
         Anchor_GatherLast,
         Anchor_DMA,
         Anchor_TransID,
         Anchor_Length,
         Anchor_Address,
         Anchor_Done,

         DMC_TXC_Resp_Rdy,
         DMC_TXC_Resp_Complete,
         DMC_TXC_Trans_Complete,
         DMC_TXC_Resp_Data_Valid,
         DMC_TXC_Resp_Client,
         DMC_TXC_Resp_Port_Num,
         DMC_TXC_Resp_Cmd_Status,
         DMC_TXC_Resp_Data_Status,
         DMC_TXC_Resp_DMA_Num,
         DMC_TXC_Resp_TransID,
         DMC_TXC_Resp_Cmd,
         DMC_TXC_Resp_Data_Length,
         DMC_TXC_Resp_ByteEnables,
         DMC_TXC_Resp_Address,
         DMC_TXC_Resp_Data,
         TXC_DMC_Resp_Accept,

         ReOrder_Error,

         Nack_Pkt_Rd,
         DMA_Nack_Pkt_Rd,
         Nack_Pkt_Rd_Addr,

         DMA0_Inc_Head,
         DMA0_Mark_Bit,
         DMA0_Inc_Pkt_Cnt,
         DMA1_Inc_Head,
         DMA1_Mark_Bit,
         DMA1_Inc_Pkt_Cnt,
         DMA2_Inc_Head,
         DMA2_Mark_Bit,
         DMA2_Inc_Pkt_Cnt,
         DMA3_Inc_Head,
         DMA3_Mark_Bit,
         DMA3_Inc_Pkt_Cnt,
         DMA4_Inc_Head,
         DMA4_Mark_Bit,
         DMA4_Inc_Pkt_Cnt,
         DMA5_Inc_Head,
         DMA5_Mark_Bit,
         DMA5_Inc_Pkt_Cnt,
         DMA6_Inc_Head,
         DMA6_Mark_Bit,
         DMA6_Inc_Pkt_Cnt,
         DMA7_Inc_Head,
         DMA7_Mark_Bit,
         DMA7_Inc_Pkt_Cnt,
         DMA8_Inc_Head,
         DMA8_Mark_Bit,
         DMA8_Inc_Pkt_Cnt,
         DMA9_Inc_Head,
         DMA9_Mark_Bit,
         DMA9_Inc_Pkt_Cnt,
         DMA10_Inc_Head,
         DMA10_Mark_Bit,
         DMA10_Inc_Pkt_Cnt,
         DMA11_Inc_Head,
         DMA11_Mark_Bit,
         DMA11_Inc_Pkt_Cnt,
         DMA12_Inc_Head,
         DMA12_Mark_Bit,
         DMA12_Inc_Pkt_Cnt,
         DMA13_Inc_Head,
         DMA13_Mark_Bit,
         DMA13_Inc_Pkt_Cnt,
         DMA14_Inc_Head,
         DMA14_Mark_Bit,
         DMA14_Inc_Pkt_Cnt,
         DMA15_Inc_Head,
         DMA15_Mark_Bit,
         DMA15_Inc_Pkt_Cnt,
         DMA16_Inc_Head,
         DMA16_Mark_Bit,
         DMA16_Inc_Pkt_Cnt,
         DMA17_Inc_Head,
         DMA17_Mark_Bit,
         DMA17_Inc_Pkt_Cnt,
         DMA18_Inc_Head,
         DMA18_Mark_Bit,
         DMA18_Inc_Pkt_Cnt,
         DMA19_Inc_Head,
         DMA19_Mark_Bit,
         DMA19_Inc_Pkt_Cnt,
         DMA20_Inc_Head,
         DMA20_Mark_Bit,
         DMA20_Inc_Pkt_Cnt,
         DMA21_Inc_Head,
         DMA21_Mark_Bit,
         DMA21_Inc_Pkt_Cnt,
         DMA22_Inc_Head,
         DMA22_Mark_Bit,
         DMA22_Inc_Pkt_Cnt,
         DMA23_Inc_Head,
         DMA23_Mark_Bit,
         DMA23_Inc_Pkt_Cnt,

         Anchor_State,
         ReOrder_State,
         Pointer_State
        );

`include "txc_defines.h"

// MAC Global Signals
input          SysClk;
input          Reset_L;
input          Txc_Enabled;
input          EnableGMACMode;
input  [1:0]   PortIndentifier;

//output         FlushEngine;

//reg            FlushEngine;

// ReOrder PIO Control Registers
input          ClearStatistics;
input          WrPacketRequested;
input          WrPacketStuffed;
input          WrTidsInUse;
input          WrDuplicateTid;
input          WrUnInitializedTID;
input          WrTimedoutTids;
input          WrReOrderStateLogic;
input          WrReOrderStateControl;
input          WrReOrderStateData0;
input          WrReOrderStateData1;
input          WrReOrderStateData2;
input          WrReOrderStateData3;
input  [31:0]  PioDataIn;

output [3:0]   GatherRequestCount;
output [11:0]  PacketRequestCount;
output [15:0]  ReOrdersStuffed;
output [31:0]  TidsInUse;
output [31:0]  DuplicateTid;
output [31:0]  UnInitializedTID;
output [31:0]  TimedoutTids;
output [31:0]  ReOrderStateLogic;
output [31:0]  ReOrderStateControl;
output [31:0]  ReOrderStateData0;
output [31:0]  ReOrderStateData1;
output [31:0]  ReOrderStateData2;
output [31:0]  ReOrderStateData3;

reg    [3:0]   GatherRequestCount;
reg    [11:0]  PacketRequestCount;
reg    [15:0]  ReOrdersStuffed;
reg    [31:0]  TidsInUse;
reg    [31:0]  DuplicateTid;
reg    [31:0]  UnInitializedTID;
reg    [31:0]  TimedoutTids;
reg    [31:0]  ReOrderStateData0;
reg    [31:0]  ReOrderStateData1;
reg    [31:0]  ReOrderStateData2;
reg    [31:0]  ReOrderStateData3;


// Control Registers
input          MAC_Enabled;
input  [3:0]   MaxReorderNumber;

output         UpdateDMA;
output [13:0]  UpdateDMALength;
output [23:0]  UpdateDMANumber;

reg            UpdateDMA;
reg    [23:0]  UpdateDMANumber;

// Re-Order Fifo Interface
input          ReOrderFifoRead;
input  [31:0]  ReOrderEccControl;

output         ReOrderCorruptECCSingle;
output         ReOrderCorruptECCDouble;
output         ReOrderFifoWrite;
output         ReOrderFifoReadStrobe;
output         ReOrderFifoEmpty;
output         ReOrderFifoAlmostEmpty;
output [9:0]   ReOrderWritePtr;
output [9:0]   ReOrderReadPtr;
output [135:0] ReOrderEngineDataOut;

reg    [9:0]   ReOrderWritePtr;

// Anchor Interface
input          Req_Anchor;
input          Anchor_LoadTID;
input          Anchor_MarkBit;
input          Anchor_SopBit;
input          Anchor_GatherLast;
input  [4:0]   Anchor_DMA;
input  [5:0]   Anchor_TransID;
input  [12:0]  Anchor_Length;
input  [63:0]  Anchor_Address;

output         Anchor_Done;

reg            Anchor_Done;

// Tx DMA Response Interface
input          DMC_TXC_Resp_Rdy;
input          DMC_TXC_Resp_Complete;
input          DMC_TXC_Trans_Complete;
input          DMC_TXC_Resp_Data_Valid;
input          DMC_TXC_Resp_Client;
input  [1:0]   DMC_TXC_Resp_Port_Num;
input  [3:0]   DMC_TXC_Resp_Cmd_Status;
input  [3:0]   DMC_TXC_Resp_Data_Status;
input  [4:0]   DMC_TXC_Resp_DMA_Num;
input  [5:0]   DMC_TXC_Resp_TransID;
input  [7:0]   DMC_TXC_Resp_Cmd;
input  [13:0]  DMC_TXC_Resp_Data_Length;
input  [15:0]  DMC_TXC_Resp_ByteEnables;
input  [63:0]  DMC_TXC_Resp_Address;
input  [127:0] DMC_TXC_Resp_Data;

output         TXC_DMC_Resp_Accept;

reg            TXC_DMC_Resp_Accept;

// Packet Data Error Interface
output         ReOrder_Error;

reg            ReOrder_Error;

// Transaction Timeout -> TDMC Interface
output         Nack_Pkt_Rd;
output [23:0]  DMA_Nack_Pkt_Rd;
output [43:0]  Nack_Pkt_Rd_Addr;

reg            Nack_Pkt_Rd;
reg    [23:0]  DMA_Nack_Pkt_Rd;
reg    [43:0]  Nack_Pkt_Rd_Addr;

// TXC -> TDMC Interface
//DMA0
output         DMA0_Inc_Head;
output         DMA0_Mark_Bit;
output         DMA0_Inc_Pkt_Cnt;

reg            DMA0_Inc_Head;
reg            DMA0_Mark_Bit;
reg            DMA0_Inc_Pkt_Cnt;

//DMA1
output         DMA1_Inc_Head;
output         DMA1_Mark_Bit;
output         DMA1_Inc_Pkt_Cnt;

reg            DMA1_Inc_Head;
reg            DMA1_Mark_Bit;
reg            DMA1_Inc_Pkt_Cnt;

//DMA2
output         DMA2_Inc_Head;
output         DMA2_Mark_Bit;
output         DMA2_Inc_Pkt_Cnt;

reg            DMA2_Inc_Head;
reg            DMA2_Mark_Bit;
reg            DMA2_Inc_Pkt_Cnt;

//DMA3
output         DMA3_Inc_Head;
output         DMA3_Mark_Bit;
output         DMA3_Inc_Pkt_Cnt;

reg            DMA3_Inc_Head;
reg            DMA3_Mark_Bit;
reg            DMA3_Inc_Pkt_Cnt;

//DMA4
output         DMA4_Inc_Head;
output         DMA4_Mark_Bit;
output         DMA4_Inc_Pkt_Cnt;

reg            DMA4_Inc_Head;
reg            DMA4_Mark_Bit;
reg            DMA4_Inc_Pkt_Cnt;

//DMA5
output         DMA5_Inc_Head;
output         DMA5_Mark_Bit;
output         DMA5_Inc_Pkt_Cnt;

reg            DMA5_Inc_Head;
reg            DMA5_Mark_Bit;
reg            DMA5_Inc_Pkt_Cnt;

//DMA6
output         DMA6_Inc_Head;
output         DMA6_Mark_Bit;
output         DMA6_Inc_Pkt_Cnt;

reg            DMA6_Inc_Head;
reg            DMA6_Mark_Bit;
reg            DMA6_Inc_Pkt_Cnt;

//DMA7
output         DMA7_Inc_Head;
output         DMA7_Mark_Bit;
output         DMA7_Inc_Pkt_Cnt;

reg            DMA7_Inc_Head;
reg            DMA7_Mark_Bit;
reg            DMA7_Inc_Pkt_Cnt;

//DMA8
output         DMA8_Inc_Head;
output         DMA8_Mark_Bit;
output         DMA8_Inc_Pkt_Cnt;

reg            DMA8_Inc_Head;
reg            DMA8_Mark_Bit;
reg            DMA8_Inc_Pkt_Cnt;

//DMA9
output         DMA9_Inc_Head;
output         DMA9_Mark_Bit;
output         DMA9_Inc_Pkt_Cnt;

reg            DMA9_Inc_Head;
reg            DMA9_Mark_Bit;
reg            DMA9_Inc_Pkt_Cnt;

//DMA10
output         DMA10_Inc_Head;
output         DMA10_Mark_Bit;
output         DMA10_Inc_Pkt_Cnt;

reg            DMA10_Inc_Head;
reg            DMA10_Mark_Bit;
reg            DMA10_Inc_Pkt_Cnt;

//DMA11
output         DMA11_Inc_Head;
output         DMA11_Mark_Bit;
output         DMA11_Inc_Pkt_Cnt;

reg            DMA11_Inc_Head;
reg            DMA11_Mark_Bit;
reg            DMA11_Inc_Pkt_Cnt;

//DMA12
output         DMA12_Inc_Head;
output         DMA12_Mark_Bit;
output         DMA12_Inc_Pkt_Cnt;

reg            DMA12_Inc_Head;
reg            DMA12_Mark_Bit;
reg            DMA12_Inc_Pkt_Cnt;

//DMA13
output         DMA13_Inc_Head;
output         DMA13_Mark_Bit;
output         DMA13_Inc_Pkt_Cnt;

reg            DMA13_Inc_Head;
reg            DMA13_Mark_Bit;
reg            DMA13_Inc_Pkt_Cnt;

//DMA14
output         DMA14_Inc_Head;
output         DMA14_Mark_Bit;
output         DMA14_Inc_Pkt_Cnt;

reg            DMA14_Inc_Head;
reg            DMA14_Mark_Bit;
reg            DMA14_Inc_Pkt_Cnt;

//DMA15
output         DMA15_Inc_Head;
output         DMA15_Mark_Bit;
output         DMA15_Inc_Pkt_Cnt;

reg            DMA15_Inc_Head;
reg            DMA15_Mark_Bit;
reg            DMA15_Inc_Pkt_Cnt;

//DMA16
output         DMA16_Inc_Head;
output         DMA16_Mark_Bit;
output         DMA16_Inc_Pkt_Cnt;

reg            DMA16_Inc_Head;
reg            DMA16_Mark_Bit;
reg            DMA16_Inc_Pkt_Cnt;

//DMA17
output         DMA17_Inc_Head;
output         DMA17_Mark_Bit;
output         DMA17_Inc_Pkt_Cnt;

reg            DMA17_Inc_Head;
reg            DMA17_Mark_Bit;
reg            DMA17_Inc_Pkt_Cnt;

//DMA18
output         DMA18_Inc_Head;
output         DMA18_Mark_Bit;
output         DMA18_Inc_Pkt_Cnt;

reg            DMA18_Inc_Head;
reg            DMA18_Mark_Bit;
reg            DMA18_Inc_Pkt_Cnt;

//DMA19
output         DMA19_Inc_Head;
output         DMA19_Mark_Bit;
output         DMA19_Inc_Pkt_Cnt;

reg            DMA19_Inc_Head;
reg            DMA19_Mark_Bit;
reg            DMA19_Inc_Pkt_Cnt;

//DMA20
output         DMA20_Inc_Head;
output         DMA20_Mark_Bit;
output         DMA20_Inc_Pkt_Cnt;

reg            DMA20_Inc_Head;
reg            DMA20_Mark_Bit;
reg            DMA20_Inc_Pkt_Cnt;

//DMA21
output         DMA21_Inc_Head;
output         DMA21_Mark_Bit;
output         DMA21_Inc_Pkt_Cnt;

reg            DMA21_Inc_Head;
reg            DMA21_Mark_Bit;
reg            DMA21_Inc_Pkt_Cnt;

//DMA22
output         DMA22_Inc_Head;
output         DMA22_Mark_Bit;
output         DMA22_Inc_Pkt_Cnt;

reg            DMA22_Inc_Head;
reg            DMA22_Mark_Bit;
reg            DMA22_Inc_Pkt_Cnt;

//DMA23
output         DMA23_Inc_Head;
output         DMA23_Mark_Bit;
output         DMA23_Inc_Pkt_Cnt;

reg            DMA23_Inc_Head;
reg            DMA23_Mark_Bit;
reg            DMA23_Inc_Pkt_Cnt;

// State machine registers
output [3:0]   Anchor_State;
output [3:0]   ReOrder_State;
output [3:0]   Pointer_State;

reg    [3:0]   Anchor_State;
reg    [3:0]   ReOrder_State;
reg    [3:0]   Pointer_State;

/*--------------------------------------------------------------*/
// Overloaded Parameters
/*--------------------------------------------------------------*/
parameter REORDER_SIZE = 16,
          REORDER_PTR  = 4;

/*--------------------------------------------------------------*/
// Reg & Wires
/*--------------------------------------------------------------*/
wire           spaceForAnchor;
wire           startOfPacket;
wire           endOfPacket;
wire           resp_Trans_Complete;
wire           resp_Resp_Complete;
wire           resp_Data_Valid;
wire           resp_Data_Error;
wire           abortThisPacket;
wire           reOrderCollision;
wire           reOrderStateEmpty;
wire           reOrderStateFull;
wire           bufferDone;
wire           setBuffDone;
wire           clrBuffDone;
wire           collisionBuffDone;
wire           residualBytes;
wire           tIDValid;
wire           updateTDMC;
wire           transactionTimeout;
wire           nullTransaction;
wire           validTransaction;
wire           extractedOddNumberPkt;
wire           atHeadOfFifoMarkBit;
wire           atHeadOfFifoGatherLast;
wire           extractedGatherLast;
wire           extractedSopBit;
wire           corruptFirstLine;
wire           corruptSecondLine;
wire           corruptLastLine;
wire           onePacketOnly;
wire           alternatePackets;
wire           eccCoruptionValid;
wire           allPackets;
wire           corruptSingleErr;
wire           corruptDoubleErr;
wire           corruptECC;
wire           respDmaNumFail;
wire           respAddrFail;
wire           respLengthFail;
wire           collisionTidsUpdate;
wire           setTidTimeOut;
wire           loadReOrderWatermark;
wire           loadSpaceWatermark;
wire           clrFailedStatePosEdge;
wire           incReOrderStuffed;
wire           collisionStuffed;
wire           collisionRequested;
wire           reOrderStateRdDonePosEdge;
wire           reOrderStateWrDonePosEdge;
wire           loadFailedState;
wire           enableFailedStateLoad;
wire           incReOrderWritePtr;
wire           atLastLineOfPacket;
wire           respAddressPass;
wire           respAddrPageHandleMatch;
wire           respAddrLessThanEq2UpperBound;
wire           respAddrGreaterThanEq2LowerBound;
wire           collisionDupTids; 
wire           collisionUnInit; 
wire           collisionTimeout; 
wire   [3:0]   highestReOrderUsed;
wire   [3:0]   numberOfReOrderEntries;
wire   [3:0]   reOrderStatePioAddr;
wire   [3:0]   reOrderStateFailAddr;
wire   [4:0]   numberOfBytes;
wire   [4:0]   extractedDMANumber;
wire   [4:0]   atHeadOfFifoDMANumber;
wire   [9:0]   endingReOrderWritePtr;
wire   [9:0]   extractedNextWrPtr;
wire   [9:0]   extractedEndingWrPtr;
wire   [9:0]   atHeadOfFifoEndingWrPtr;
wire   [9:0]   newReOrderWritePtr;
wire   [9:0]   reOrderWritePtrPlusOne;
wire   [10:0]  readPtrPlusOne;
wire   [10:0]  pointerDifference;
wire   [10:0]  normalized_Anchor_Length;
wire   [10:0]  offsetForReOrderWritePtr;
wire   [12:0]  extractedReqLength;
wire   [13:0]  totalAlignedNumberofBytes;
wire   [15:0]  resp_ByteEnables;
wire   [15:0]  reAlignerSpaceAvailable;
wire   [16:0]  reOrderPktStuffed;
wire   [63:0]  extractedReqAddress;
wire   [44:0]  upperBoundAddress;
wire   [127:0] resp_Data;
wire   [127:0] alignedRespData;

reg            sopDoneFlag;
reg            oddNumberPkt;
reg            onePacketOneShot;
reg            portFifoSelect;
reg            ldPortInfo;
reg            ldExtractedState;
reg            ldExtractedStateD1;
reg            ldTimeoutState;
reg            ldTimeoutStateD1;
reg            reOrderFifoFull;
reg            primeAnchor;
reg            anchorDone;
reg            updateShadowReOrderWrPtr;
reg            reOrderEntriesRd;
reg            decReOrderEntries;
reg            responseComplete;
reg            transactionComplete;
reg            enableSpaceAvailWatermark;
reg            enableReOrderWatermark;
reg            clrFailedState;
reg            clrFailedStateD1;
reg            addressFailed;
reg            dMAFailed;
reg            lengthFailed;
reg            captureAddressFail;
reg            captureDMAFail;
reg            captureLengthFail;
reg            reOrderStateRdDone;
reg            reOrderStateRdDoneD1;
reg            reOrderStateWrDone;
reg            reOrderStateWrDoneD1;
reg            reOrderStateRead;
reg            reOrderStateWrite;
reg            loadAddrFailed;
reg            loadDMAFailed;
reg            loadLengthFailed;
reg            failedStateLoaded;
reg            atSecondLineOfPkt;
reg            nack_Pkt_RdD1;
reg    [3:0]   dmc_Resp_Cmd_Status;
reg    [3:0]   nextAnchorState;
reg    [3:0]   nextReOrderState;
reg    [3:0]   nextPointerState;
reg    [4:0]   resp_DMA_Num;
reg    [5:0]   resp_TransID;
reg    [7:0]   dmc_Resp_Cmd;
reg    [9:0]   highestSpaceUsed;
reg    [9:0]   nextReOrderWritePtr;
reg    [9:0]   readPtr;
reg    [9:0]   shadowReOrderWritePtr;
reg    [9:0]   extractedNextWrPtrD1;
reg    [9:0]   offsetForReOrderWritePtrD1;
reg    [10:0]  spaceAvailable;
reg    [12:0]  extractedReqLengthD1;
reg    [13:0]  resp_Data_Length;
reg    [23:0]  dmaNumber;
reg    [23:0]  responseDmaNumber;
reg    [23:0]  responseDmaNumberD1;
reg    [31:0]  loadTID;
reg    [31:0]  clearTID;
reg    [43:0]  addressUpperBound;
reg    [31:0]  alignedRespDataUpper1;
reg    [31:0]  alignedRespDataUpper0;
reg    [31:0]  alignedRespDataLower1;
reg    [31:0]  alignedRespDataLower0;
reg    [63:0]  extractedReqAddressD1;
reg    [63:0]  resp_Address;

wire           pioStateSopBit;
wire           pioStateOddNumberPkt;
wire           pioStateDMAMarkBit;
wire           pioStateGatherLast;
wire   [4:0]   pioStateDMANumber;
wire   [9:0]   pioStateEndingWrPtr;
wire   [9:0]   pioStateNextWrPtr;
wire   [12:0]  pioStateAnchorLength;
wire   [63:0]  pioStateAnchorAddr;

wire   [REORDER_PTR-1:0]   reOrderIndex;

reg                        transIDEntryValid[0:63];
reg    [REORDER_PTR-1:0]   highestROUsed;
reg    [REORDER_PTR-1:0]   reOrderStRdAddr;
reg    [REORDER_PTR-1:0]   rOStatePioAddr;
reg    [REORDER_PTR-1:0]   rOStateFailAddr;
reg    [REORDER_PTR-1:0]   transIDTable[0:31];
reg    [REORDER_PTR-1:0]   reOrderStateRdPtr;
reg    [REORDER_PTR-1:0]   reOrderStateWrPtr;
reg    [REORDER_PTR-1:0]   reOrderEntries;
reg    [REORDER_SIZE-1:0]  buffDone;

reg            reOrderOddNumberPkt[0:REORDER_SIZE-1];
reg            reOrderDMAMarkBit[0:REORDER_SIZE-1];
reg            reOrderGatherLast[0:REORDER_SIZE-1];
reg            reOrderSopBit[0:REORDER_SIZE-1];
reg    [4:0]   reOrderDMANumber[0:REORDER_SIZE-1];
reg    [9:0]   reOrderEndingWrPtr[0:REORDER_SIZE-1];
reg    [9:0]   reOrderNextWrPtr[0:REORDER_SIZE-1];
reg    [12:0]  reOrderAnchorLength[0:REORDER_SIZE-1];
reg    [63:0]  reOrderAnchorAddr[0:REORDER_SIZE-1];

integer i;

/*--------------------------------------------------------------*/
// Parameters and Defines 
/*--------------------------------------------------------------*/
parameter ANCHOR_IDLE           = 4'h0,
          CHECK_ANCHOR_SIZE     = 4'h1,
          ANCHOR_ACCEPT         = 4'h2,
          ANCHOR_REJECT         = 4'h3,
          ANCHOR_WAIT           = 4'h4;


parameter RE_ORDER_IDLE         = 4'h0,
          REORDER_STATE_LOAD    = 4'h1,
          WAIT_FOR_RESP_COMP    = 4'h2,
          TRANSACTION_TIMEOUT   = 4'h3,
          NULL_TRANSACTION      = 4'h4,
          FLUSH_PIPELINE        = 4'h5,
          RE_ORDER_FATAL        = 4'h6;


parameter POINTER_IDLE          = 4'h0,
          WAIT_FOR_POINTER_DONE = 4'h1,
          POINTER_RD_UPDATE     = 4'h6;


//VCS coverage off
// synopsys translate_off
reg [192:1] ANCHOR_REQ;
reg [192:1] RE_ORDER;
reg [192:1] POINTER_ST;
reg [192:1] SHIFT_VALUE;


always @(Anchor_State)
begin
  case(Anchor_State)
    ANCHOR_IDLE:             ANCHOR_REQ = "ANCHOR_IDLE";
    CHECK_ANCHOR_SIZE:       ANCHOR_REQ = "CHECK_ANCHOR_SIZE";
    ANCHOR_ACCEPT:           ANCHOR_REQ = "ANCHOR_ACCEPT";
    ANCHOR_REJECT:           ANCHOR_REQ = "ANCHOR_REJECT";
    ANCHOR_WAIT:             ANCHOR_REQ = "ANCHOR_WAIT";
       default:    ANCHOR_REQ = "UNKNOWN";
  endcase
end

always @(ReOrder_State)
begin
  case(ReOrder_State)
    RE_ORDER_IDLE:           RE_ORDER = "RE_ORDER_IDLE";
    REORDER_STATE_LOAD:      RE_ORDER = "REORDER_STATE_LOAD";
    WAIT_FOR_RESP_COMP:      RE_ORDER = "WAIT_FOR_RESP_COMP";
    TRANSACTION_TIMEOUT:     RE_ORDER = "TRANSACTION_TIMEOUT";
    NULL_TRANSACTION:        RE_ORDER = "NULL_TRANSACTION";
    FLUSH_PIPELINE:          RE_ORDER = "FLUSH_PIPELINE";
    RE_ORDER_FATAL:          RE_ORDER = "RE_ORDER_FATAL";
       default:    RE_ORDER = "UNKNOWN";
  endcase
end

always @(Pointer_State)
begin
  case(Pointer_State)
    POINTER_IDLE:           POINTER_ST = "POINTER_IDLE";
    WAIT_FOR_POINTER_DONE:  POINTER_ST = "WAIT_FOR_POINTER_DONE";
    POINTER_RD_UPDATE:      POINTER_ST = "POINTER_RD_UPDATE";
       default:    POINTER_ST = "UNKNOWN";
  endcase
end

wire           dummySopBit;
wire           dummyOddNumberPkts;
wire           dummyDMAMarkBit;
wire           dummyGatherLast;
wire   [4:0]   dummyDMANumber;
wire   [9:0]   dummyEndingWrPtr;
wire   [9:0]   dummyNextWrPtr;
wire   [12:0]  dummyAnchorLength;
wire   [63:0]  dummyAnchorAddr;

assign dummySopBit           = reOrderSopBit[rOStatePioAddr];
assign dummyOddNumberPkts    = reOrderOddNumberPkt[rOStatePioAddr];
assign dummyDMAMarkBit       = reOrderDMAMarkBit[rOStatePioAddr];
assign dummyGatherLast       = reOrderGatherLast[rOStatePioAddr];
assign dummyDMANumber        = reOrderDMANumber[rOStatePioAddr];
assign dummyEndingWrPtr      = reOrderEndingWrPtr[rOStatePioAddr];
assign dummyNextWrPtr        = reOrderNextWrPtr[rOStatePioAddr];
assign dummyAnchorLength     = reOrderAnchorLength[rOStatePioAddr];
assign dummyAnchorAddr       = reOrderAnchorAddr[rOStatePioAddr];

always @(resp_ByteEnables or resp_Data)
  begin
  casex(resp_ByteEnables)  // Synopsys full_case parallel_case
     `SHIFT_FIFTEEN_BYTES:      SHIFT_VALUE = "SHIFT_FIFTEEN_BYTES";
     `SHIFT_FOURTEEN_BYTES:     SHIFT_VALUE = "SHIFT_FOURTEEN_BYTES";
     `SHIFT_THIRTEEN_BYTES:     SHIFT_VALUE = "SHIFT_THIRTEEN_BYTES";
     `SHIFT_TWELVE_BYTES:       SHIFT_VALUE = "SHIFT_TWELVE_BYTES";
     `SHIFT_ELEVEN_BYTES:       SHIFT_VALUE = "SHIFT_ELEVEN_BYTES";
     `SHIFT_TEN_BYTES:          SHIFT_VALUE = "SHIFT_TEN_BYTES";
     `SHIFT_NINE_BYTES:         SHIFT_VALUE = "SHIFT_NINE_BYTES";
     `SHIFT_EIGHT_BYTES:        SHIFT_VALUE = "SHIFT_EIGHT_BYTES";
     `SHIFT_SEVEN_BYTES:        SHIFT_VALUE = "SHIFT_SEVEN_BYTES";
     `SHIFT_SIX_BYTES:          SHIFT_VALUE = "SHIFT_SIX_BYTES";
     `SHIFT_FIVE_BYTES:         SHIFT_VALUE = "SHIFT_FIVE_BYTES";
     `SHIFT_FOUR_BYTES:         SHIFT_VALUE = "SHIFT_FOUR_BYTES";
     `SHIFT_THREE_BYTES:        SHIFT_VALUE = "SHIFT_THREE_BYTES";
     `SHIFT_TWO_BYTES:          SHIFT_VALUE = "SHIFT_TWO_BYTES";
     `SHIFT_ONE_BYTE:           SHIFT_VALUE = "SHIFT_ONE_BYTE";
     `SHIFT_ZERO_BYTE:          SHIFT_VALUE = "SHIFT_ZERO_BYTE";
           default: SHIFT_VALUE = "NONE";
  endcase
  end

// synopsys translate_on
//VCS coverage on

/*--------------------------------------------------------------*/
// Zero In Checks 
/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/
// Assigns 
/*--------------------------------------------------------------*/
/*--------------------------------------------------------------*/
// ReOrderEccControl Bit defines 
//   First Line of Packet    [0]
//   Second Line of Packet   [1]
//   Last Line of Packet     [2]
//   Reserved                [7:3]
//   One Packet Only         [8]
//   Alternate Packets       [9]
//   All Packets             [10]
//   Reserved                [15:11]
//   Single Bit Error        [16]
//   Double Bit Error        [17]
//   Reserved                [30:18]
//   Dsable Double Bit Error [31] - This is used by Mac Xfer
/*--------------------------------------------------------------*/
assign corruptFirstLine  = ReOrderEccControl[0];
assign corruptSecondLine = ReOrderEccControl[1];
assign corruptLastLine   = ReOrderEccControl[2];
assign onePacketOnly     = ReOrderEccControl[8];
assign alternatePackets  = ReOrderEccControl[9];
assign allPackets        = ReOrderEccControl[10];
assign corruptSingleErr  = ReOrderEccControl[16];
assign corruptDoubleErr  = ReOrderEccControl[17];

assign eccCoruptionValid = (allPackets
                            |
                            (alternatePackets & ~extractedOddNumberPkt)
                            |
                            (onePacketOnly & ~onePacketOneShot)
                           );

assign corruptECC = ((corruptFirstLine
                      &
                      extractedSopBit 
                      &
                      startOfPacket
                     )
                     ||
                     (corruptSecondLine & atSecondLineOfPkt)
                     ||
                     (corruptLastLine
                      &
                      extractedGatherLast 
                      &
                      resp_Trans_Complete
                     )
                     );

assign ReOrderCorruptECCSingle = corruptSingleErr & eccCoruptionValid
                                 &
                                 resp_Data_Valid & corruptECC;

assign ReOrderCorruptECCDouble = corruptDoubleErr & eccCoruptionValid
                                 &
                                 resp_Data_Valid & corruptECC;

always @(posedge SysClk)
  if (!Reset_L)           onePacketOneShot <= #`SD 1'b0;
  else if (onePacketOnly) onePacketOneShot <= #`SD (onePacketOneShot
                                                    |
                                                    (ReOrderCorruptECCSingle
                                                     |
                                                     ReOrderCorruptECCDouble
                                                    )
                                                   );
  else                    onePacketOneShot <= #`SD 1'b0;

/*--------------------------------------------------------------*/
// FeOrderFifo Data Out 
/*--------------------------------------------------------------*/
always @(posedge SysClk)
  if (!Reset_L)
    sopDoneFlag <= #`SD 1'b0;
  else if (resp_Resp_Complete | resp_Trans_Complete)
    sopDoneFlag <= #`SD 1'b0;
  else if ((extractedReqAddress == resp_Address) & resp_Data_Valid) 
    sopDoneFlag <= #`SD 1'b1;

always @(posedge SysClk)
  if (!Reset_L)
    atSecondLineOfPkt <= #`SD 1'b0;
  else if (startOfPacket & resp_Data_Valid) 
    atSecondLineOfPkt <= #`SD 1'b1;
  else if (ReOrderFifoWrite)
//  else if (corruptECC | responseComplete | transactionComplete)
    atSecondLineOfPkt <= #`SD 1'b0;

assign startOfPacket      = ((extractedReqAddress == resp_Address)
                             &&
                             ~sopDoneFlag
                             &&
                             extractedSopBit 
                            );

assign atLastLineOfPacket = (reOrderWritePtrPlusOne ==  extractedEndingWrPtr);

assign endOfPacket        = extractedGatherLast
                            &
                            atLastLineOfPacket
                            &
                            (resp_Trans_Complete | resp_Resp_Complete);

assign ReOrderFifoWrite   = (resp_Data_Valid | setTidTimeOut);

assign numberOfBytes = ({4'h0, resp_ByteEnables[15]}
                        + {4'h0, resp_ByteEnables[14]}
                        + {4'h0, resp_ByteEnables[13]}
                        + {4'h0, resp_ByteEnables[12]}
                        + {4'h0, resp_ByteEnables[11]}
                        + {4'h0, resp_ByteEnables[10]}
                        + {4'h0, resp_ByteEnables[9]}
                        + {4'h0, resp_ByteEnables[8]}
                        + {4'h0, resp_ByteEnables[7]}
                        + {4'h0, resp_ByteEnables[6]}
                        + {4'h0, resp_ByteEnables[5]}
                        + {4'h0, resp_ByteEnables[4]}
                        + {4'h0, resp_ByteEnables[3]}
                        + {4'h0, resp_ByteEnables[2]}
                        + {4'h0, resp_ByteEnables[1]}
                        + {4'h0, resp_ByteEnables[0]}
                       );


assign alignedRespData = {alignedRespDataUpper1,
                          alignedRespDataUpper0,
                          alignedRespDataLower1,
                          alignedRespDataLower0};


always @(resp_ByteEnables or resp_Data)
  begin
  casex(resp_ByteEnables)  // Synopsys full_case
     `SHIFT_ZERO_BYTE:      alignedRespDataUpper1 = resp_Data[127:96];
     `SHIFT_ONE_BYTE:       alignedRespDataUpper1 = {8'h0, resp_Data[127:104]};
     `SHIFT_TWO_BYTES:      alignedRespDataUpper1 = {16'h0, resp_Data[127:112]};
     `SHIFT_THREE_BYTES:    alignedRespDataUpper1 = {24'h0, resp_Data[127:120]};
           default: alignedRespDataUpper1 = 32'h0;
  endcase
  end

always @(resp_ByteEnables or resp_Data)
  begin
  casex(resp_ByteEnables)  // Synopsys full_case
     `SHIFT_ZERO_BYTE:      alignedRespDataUpper0 = resp_Data[95:64];
     `SHIFT_ONE_BYTE:       alignedRespDataUpper0 = {resp_Data[103:72]};
     `SHIFT_TWO_BYTES:      alignedRespDataUpper0 = {resp_Data[111:80]};
     `SHIFT_THREE_BYTES:    alignedRespDataUpper0 = {resp_Data[119:88]};
     `SHIFT_FOUR_BYTES:     alignedRespDataUpper0 = {resp_Data[127:96]};
     `SHIFT_FIVE_BYTES:     alignedRespDataUpper0 = {8'h0, resp_Data[127:104]};
     `SHIFT_SIX_BYTES:      alignedRespDataUpper0 = {16'h0, resp_Data[127:112]};
     `SHIFT_SEVEN_BYTES:    alignedRespDataUpper0 = {24'h0, resp_Data[127:120]};
           default: alignedRespDataUpper0 = 32'h0;
  endcase
  end

always @(resp_ByteEnables or resp_Data)
  begin
  casex(resp_ByteEnables)  // Synopsys full_case
     `SHIFT_ZERO_BYTE:      alignedRespDataLower1 = resp_Data[63:32];
     `SHIFT_ONE_BYTE:       alignedRespDataLower1 = {resp_Data[71:40]};
     `SHIFT_TWO_BYTES:      alignedRespDataLower1 = {resp_Data[79:48]};
     `SHIFT_THREE_BYTES:    alignedRespDataLower1 = {resp_Data[87:56]};
     `SHIFT_FOUR_BYTES:     alignedRespDataLower1 = {resp_Data[95:64]};
     `SHIFT_FIVE_BYTES:     alignedRespDataLower1 = {resp_Data[103:72]};
     `SHIFT_SIX_BYTES:      alignedRespDataLower1 = {resp_Data[111:80]};
     `SHIFT_SEVEN_BYTES:    alignedRespDataLower1 = {resp_Data[119:88]};
     `SHIFT_EIGHT_BYTES:    alignedRespDataLower1 = {resp_Data[127:96]};
     `SHIFT_NINE_BYTES:     alignedRespDataLower1 = {8'h0, resp_Data[127:104]};
     `SHIFT_TEN_BYTES:      alignedRespDataLower1 = {16'h0, resp_Data[127:112]};
     `SHIFT_ELEVEN_BYTES:   alignedRespDataLower1 = {24'h0, resp_Data[127:120]};
     `SHIFT_TWELVE_BYTES:   alignedRespDataLower1 = 32'h0;
           default: alignedRespDataLower1 = 32'h0;
  endcase
  end

always @(resp_ByteEnables or resp_Data)
  begin
  casex(resp_ByteEnables)  // Synopsys full_case
     `SHIFT_ZERO_BYTE:      alignedRespDataLower0 = resp_Data[31:0];
     `SHIFT_ONE_BYTE:       alignedRespDataLower0 = resp_Data[39:8];
     `SHIFT_TWO_BYTES:      alignedRespDataLower0 = resp_Data[47:16];
     `SHIFT_THREE_BYTES:    alignedRespDataLower0 = resp_Data[55:24];
     `SHIFT_FOUR_BYTES:     alignedRespDataLower0 = resp_Data[63:32];
     `SHIFT_FIVE_BYTES:     alignedRespDataLower0 = resp_Data[71:40];
     `SHIFT_SIX_BYTES:      alignedRespDataLower0 = resp_Data[79:48];
     `SHIFT_SEVEN_BYTES:    alignedRespDataLower0 = resp_Data[87:56];
     `SHIFT_EIGHT_BYTES:    alignedRespDataLower0 = resp_Data[95:64];
     `SHIFT_NINE_BYTES:     alignedRespDataLower0 = resp_Data[103:72];
     `SHIFT_TEN_BYTES:      alignedRespDataLower0 = resp_Data[111:80];
     `SHIFT_ELEVEN_BYTES:   alignedRespDataLower0 = resp_Data[119:88];
     `SHIFT_TWELVE_BYTES:   alignedRespDataLower0 = resp_Data[127:96];
     `SHIFT_THIRTEEN_BYTES: alignedRespDataLower0 = {8'h0, resp_Data[127:104]};
     `SHIFT_FOURTEEN_BYTES: alignedRespDataLower0 = {16'h0, resp_Data[127:112]};
     `SHIFT_FIFTEEN_BYTES:  alignedRespDataLower0 = {24'h0, resp_Data[127:120]};
           default: alignedRespDataLower0 = 32'h0;
  endcase
  end


assign abortThisPacket = (resp_Data_Error | transactionTimeout);

assign ReOrderEngineDataOut = {abortThisPacket,      //135
                               numberOfBytes,        //134:130
                               startOfPacket,        //129
                               endOfPacket,          //128
                               alignedRespData};     //127:0

/*--------------------------------------------------------------*/
// Transaction Decodes
/*--------------------------------------------------------------*/
assign transactionTimeout = ((dmc_Resp_Cmd == `RESPONSE_NO_DATA)
                              &&
                             (dmc_Resp_Cmd_Status == `RESPONSE_TIMEOUT)
                            );

assign validTransaction   = ((dmc_Resp_Cmd == `RESPONSE_WITH_DATA)
                              &&
                             (dmc_Resp_Cmd_Status == `RESPONSE_GOOD)
                            );

assign nullTransaction    = (
                              ((dmc_Resp_Cmd == `RESPONSE_NO_DATA)
                                &&
                               (dmc_Resp_Cmd_Status == `RESPONSE_GOOD)
                             )
                             ||
                              ((dmc_Resp_Cmd == `RESPONSE_WITH_DATA)
                                &&
                               (dmc_Resp_Cmd_Status == `RESPONSE_TIMEOUT)
                              )
                            );

/*--------------------------------------------------------------*/
// Port Response data
/*--------------------------------------------------------------*/
always @(posedge SysClk)
  if (!Reset_L)
    portFifoSelect <= #`SD 1'b0;
  else if (ldPortInfo)
    portFifoSelect <= #`SD (DMC_TXC_Resp_Port_Num == PortIndentifier);
  else if (responseComplete | transactionComplete)
    portFifoSelect <= #`SD 1'b0;

always @(posedge SysClk)
  if (!Reset_L)
    dmc_Resp_Cmd <= #`SD 8'h0;
  else if (ldPortInfo)
    dmc_Resp_Cmd <= #`SD DMC_TXC_Resp_Cmd;
  else if (responseComplete | transactionComplete)
    dmc_Resp_Cmd <= #`SD 8'h0;

always @(posedge SysClk)
  if (!Reset_L)
    dmc_Resp_Cmd_Status <= #`SD 4'h0;
  else if (ldPortInfo)
    dmc_Resp_Cmd_Status <= #`SD DMC_TXC_Resp_Cmd_Status;
  else if (responseComplete | transactionComplete)
    dmc_Resp_Cmd_Status <= #`SD 4'h0;

always @(posedge SysClk)
  if (!Reset_L)
    resp_Data_Length <= #`SD 14'h0;
  else if (ldPortInfo)
    resp_Data_Length <= #`SD DMC_TXC_Resp_Data_Length;
  else if (responseComplete | transactionComplete)
    resp_Data_Length <= #`SD 14'h0;


always @(posedge SysClk)
  if (!Reset_L)                    resp_TransID <= #`SD 6'b0;
  else if (ldPortInfo && (DMC_TXC_Resp_Port_Num == PortIndentifier))
                                   resp_TransID <= #`SD DMC_TXC_Resp_TransID;

always @(posedge SysClk)
  if (!Reset_L) responseComplete <= #`SD 1'b0;
  else          responseComplete <= #`SD DMC_TXC_Resp_Complete;

always @(posedge SysClk)
  if (!Reset_L) transactionComplete <= #`SD 1'b0;
  else          transactionComplete <= #`SD DMC_TXC_Trans_Complete;

assign resp_Trans_Complete = portFifoSelect ? transactionComplete : 1'b0;
assign resp_Resp_Complete  = portFifoSelect ? responseComplete : 1'b0;
assign resp_Data_Valid     = portFifoSelect ? DMC_TXC_Resp_Data_Valid : 1'b0;
assign resp_ByteEnables    = portFifoSelect ? DMC_TXC_Resp_ByteEnables : 16'h0;
assign resp_Data_Error     = portFifoSelect ? |DMC_TXC_Resp_Data_Status : 1'b0;
assign resp_Data           = portFifoSelect ? DMC_TXC_Resp_Data : 128'h0;

always @(extractedDMANumber)
  begin
  case(extractedDMANumber)  // Synopsys full_case parallel_case
     `DMA_CHANNEL_ZERO:         responseDmaNumber = 24'h000001;
     `DMA_CHANNEL_ONE:          responseDmaNumber = 24'h000002;
     `DMA_CHANNEL_TWO:          responseDmaNumber = 24'h000004;
     `DMA_CHANNEL_THREE:        responseDmaNumber = 24'h000008;
     `DMA_CHANNEL_FOUR:         responseDmaNumber = 24'h000010;
     `DMA_CHANNEL_FIVE:         responseDmaNumber = 24'h000020;
     `DMA_CHANNEL_SIX:          responseDmaNumber = 24'h000040;
     `DMA_CHANNEL_SEVEN:        responseDmaNumber = 24'h000080;
     `DMA_CHANNEL_EIGHT:        responseDmaNumber = 24'h000100;
     `DMA_CHANNEL_NINE:         responseDmaNumber = 24'h000200;
     `DMA_CHANNEL_TEN:          responseDmaNumber = 24'h000400;
     `DMA_CHANNEL_ELEVEN:       responseDmaNumber = 24'h000800;
     `DMA_CHANNEL_TWELVE:       responseDmaNumber = 24'h001000;
     `DMA_CHANNEL_THIRTEEN:     responseDmaNumber = 24'h002000;
     `DMA_CHANNEL_FOURTEEN:     responseDmaNumber = 24'h004000;
     `DMA_CHANNEL_FIFTEEN:      responseDmaNumber = 24'h008000;
     `DMA_CHANNEL_SIXTEEN:      responseDmaNumber = 24'h010000;
     `DMA_CHANNEL_SEVENTEEN:    responseDmaNumber = 24'h020000;
     `DMA_CHANNEL_EIGHTEEN:     responseDmaNumber = 24'h040000;
     `DMA_CHANNEL_NINETEEN:     responseDmaNumber = 24'h080000;
     `DMA_CHANNEL_TWENTY:       responseDmaNumber = 24'h100000;
     `DMA_CHANNEL_TWENTYONE:    responseDmaNumber = 24'h200000;
     `DMA_CHANNEL_TWENTYTWO:    responseDmaNumber = 24'h400000;
     `DMA_CHANNEL_TWENTYTHREE:  responseDmaNumber = 24'h800000;
           default: responseDmaNumber = 24'h0;
  endcase
end

always @ (posedge SysClk)
  if (!Reset_L) UpdateDMA <= 1'b0;
  else          UpdateDMA <= #`SD ldExtractedState & portFifoSelect;

assign UpdateDMALength = resp_Data_Length;

always @ (posedge SysClk)
  if (!Reset_L)              UpdateDMANumber <= 24'h0;
  else if (ldExtractedState) UpdateDMANumber <= #`SD responseDmaNumber;


always @ (posedge SysClk)
  if (!Reset_L) ldTimeoutStateD1 <= 1'b0;
  else          ldTimeoutStateD1 <= #`SD ldTimeoutState;

always @ (posedge SysClk)
  if (!Reset_L) responseDmaNumberD1 <= 24'h0;
  else          responseDmaNumberD1 <= #`SD responseDmaNumber;

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      resp_DMA_Num <= 5'h0;
      resp_Address <= 64'h0;
    end
  else if (ldPortInfo && (DMC_TXC_Resp_Port_Num == PortIndentifier))
    begin
      resp_DMA_Num <= #`SD DMC_TXC_Resp_DMA_Num;
      resp_Address <= #`SD DMC_TXC_Resp_Address;
    end

always @ (posedge SysClk)
  if (!Reset_L) nack_Pkt_RdD1 <= 1'b0;
  else          nack_Pkt_RdD1 <= #`SD Nack_Pkt_Rd;

always @ (posedge SysClk)
  if (!Reset_L)              Nack_Pkt_Rd <= 1'b0;
  else if (ldTimeoutStateD1) Nack_Pkt_Rd <= #`SD 1'b1;
  else                       Nack_Pkt_Rd <= #`SD 1'b0;

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA_Nack_Pkt_Rd  <= 24'h0;
      Nack_Pkt_Rd_Addr <= 44'h0;
    end
  else if (ldTimeoutStateD1)
    begin
      DMA_Nack_Pkt_Rd  <= #`SD responseDmaNumberD1;
      Nack_Pkt_Rd_Addr <= #`SD resp_Address[43:0];
    end
  else if (nack_Pkt_RdD1)
    begin
      DMA_Nack_Pkt_Rd  <= #`SD 24'h0;
      Nack_Pkt_Rd_Addr <= #`SD 44'h0;
    end

/*--------------------------------------------------------------*/
// ReOrder Counter
/*--------------------------------------------------------------*/
assign reOrderPktStuffed = ({1'b0, ReOrdersStuffed} + 17'h1);

always @ (posedge SysClk)
  if (!Reset_L)               ReOrdersStuffed <= 16'b0;
  else if (collisionStuffed)  ReOrdersStuffed <= #`SD 16'h1;
  else if (ClearStatistics)   ReOrdersStuffed <= #`SD 16'h0;
  else if (WrPacketStuffed)   ReOrdersStuffed <= #`SD PioDataIn[31:16];
  else if (incReOrderStuffed) ReOrdersStuffed <= #`SD reOrderPktStuffed[15:0];

assign collisionStuffed = ClearStatistics & incReOrderStuffed;
assign incReOrderStuffed = updateTDMC && atHeadOfFifoGatherLast;

/*--------------------------------------------------------------*/
// ReOrder Counter
/*--------------------------------------------------------------*/
assign collisionRequested = ClearStatistics & Anchor_Done;

always @ (posedge SysClk)
  if (!Reset_L)
    GatherRequestCount <= 4'b0;
  else if (collisionRequested & ~Anchor_GatherLast)
    GatherRequestCount <= #`SD 4'h1;
  else if (WrPacketRequested)
    GatherRequestCount <= #`SD PioDataIn[31:28];
  else if (Anchor_Done & Anchor_GatherLast)
    GatherRequestCount <= #`SD 4'h0;
  else if (Anchor_Done & ~Anchor_GatherLast)
    GatherRequestCount <= #`SD GatherRequestCount + 4'h1;

always @ (posedge SysClk)
  if (!Reset_L)
    PacketRequestCount <= 12'b0;
  else if (collisionRequested & Anchor_GatherLast)
    PacketRequestCount <= #`SD 12'h1;
  else if (ClearStatistics)
    PacketRequestCount <= #`SD 12'h0;
  else if (WrPacketRequested)
    PacketRequestCount <= #`SD PioDataIn[27:16];
  else if (Anchor_Done & Anchor_GatherLast)
    PacketRequestCount <= #`SD PacketRequestCount + 12'h1;

/*--------------------------------------------------------------*/
// Trasaction ID Table
/*--------------------------------------------------------------*/
always @ (posedge SysClk)
  if (!Reset_L)
    begin
      for (i = 0; i < 32; i=i+1)
       begin
         transIDEntryValid[i]  <= 1'b0;
       end
    end
  else if (Anchor_LoadTID)
     transIDEntryValid[Anchor_TransID[4:0]] <= #`SD 1'b1;

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      for (i = 0; i < 32; i=i+1)
       begin
         transIDTable[i]  <= {REORDER_PTR{1'b0}};
       end
    end
  else if (Anchor_LoadTID)
     transIDTable[Anchor_TransID[4:0]] <= #`SD reOrderStateWrPtr;

assign tIDValid     = transIDEntryValid[resp_TransID[4:0]];
assign reOrderIndex = transIDTable[resp_TransID[4:0]];

/*--------------------------------------------------------------*/
// ReOrder State 
/*--------------------------------------------------------------*/
assign reOrderCollision  = Anchor_LoadTID & reOrderEntriesRd;
assign reOrderStateEmpty = (reOrderEntries == {REORDER_PTR{1'b0}});
assign reOrderStateFull = (reOrderEntries == MaxReorderNumber[REORDER_PTR-1:0]);

always @ (posedge SysClk)
   if (!Reset_L)               reOrderEntries <= {REORDER_PTR{1'b0}};
   else if (reOrderCollision)  reOrderEntries <= reOrderEntries;
   else if (Anchor_LoadTID)    reOrderEntries <= reOrderEntries
                                                 +
                                          {{(REORDER_PTR-1){1'b0}}, 1'b1};
   else if (decReOrderEntries) reOrderEntries <= reOrderEntries
                                                 -
                                          {{(REORDER_PTR-1){1'b0}}, 1'b1};


assign setBuffDone       = (resp_Trans_Complete & tIDValid);
assign clrBuffDone       = decReOrderEntries;
assign collisionBuffDone = setBuffDone & clrBuffDone;
assign bufferDone        = buffDone[reOrderStateRdPtr];

always @ (posedge SysClk)
  if (!Reset_L)
    buffDone  <= {REORDER_SIZE{1'b0}};
  else if (collisionBuffDone)
    buffDone <= #`SD buffDone
                     ^
                     (
                      ({{(REORDER_SIZE-1){1'b0}},1'b1} << reOrderIndex) 
                      |
                      ({{(REORDER_SIZE-1){1'b0}},1'b1} << reOrderStateRdPtr)
                     );

  else if (setBuffDone)
    buffDone <= #`SD buffDone
                     ^
                     ({{(REORDER_SIZE-1){1'b0}},1'b1} << reOrderIndex);
  else if (clrBuffDone)
    buffDone <= #`SD buffDone
                     ^
                     ({{(REORDER_SIZE-1){1'b0}},1'b1} << reOrderStateRdPtr);

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      for (i = 0; i < REORDER_SIZE; i=i+1)
       begin
         reOrderSopBit[i]           <= 1'b0;
         reOrderOddNumberPkt[i]     <= 1'b0;
         reOrderDMAMarkBit[i]       <= 1'b0;
         reOrderGatherLast[i]       <= 1'b0;
         reOrderDMANumber[i]        <= 5'h0;
         reOrderEndingWrPtr[i]      <= 10'h0;
         reOrderNextWrPtr[i]        <= 10'h0;
         reOrderAnchorLength[i]     <= 13'h0;
         reOrderAnchorAddr[i]       <= 64'h0;
       end
    end
else if (reOrderStateWrDonePosEdge)
 begin
  reOrderSopBit[rOStatePioAddr]       <= #`SD ReOrderStateData0[25];
  reOrderOddNumberPkt[rOStatePioAddr] <= #`SD ReOrderStateData0[24];
  reOrderDMAMarkBit[rOStatePioAddr]   <= #`SD ReOrderStateData0[22];
  reOrderGatherLast[rOStatePioAddr]   <= #`SD ReOrderStateData0[20];
  reOrderDMANumber[rOStatePioAddr]    <= #`SD ReOrderStateData0[15:11];
  reOrderEndingWrPtr[rOStatePioAddr]  <= #`SD ReOrderStateData0[9:0];
  reOrderNextWrPtr[rOStatePioAddr]    <= #`SD ReOrderStateData1[25:16];
  reOrderAnchorLength[rOStatePioAddr] <= #`SD ReOrderStateData1[12:0];
  reOrderAnchorAddr[rOStatePioAddr]   <= #`SD {ReOrderStateData2,
                                               ReOrderStateData3};
 end
  else if (primeAnchor)
    begin
     reOrderSopBit[reOrderStateWrPtr]           <= #`SD Anchor_SopBit;
     reOrderOddNumberPkt[reOrderStateWrPtr]     <= #`SD oddNumberPkt;
     reOrderDMAMarkBit[reOrderStateWrPtr]       <= #`SD Anchor_MarkBit;
     reOrderGatherLast[reOrderStateWrPtr]       <= #`SD Anchor_GatherLast;
     reOrderDMANumber[reOrderStateWrPtr]        <= #`SD Anchor_DMA;
     reOrderEndingWrPtr[reOrderStateWrPtr]      <= #`SD endingReOrderWritePtr;
     reOrderNextWrPtr[reOrderStateWrPtr]        <= #`SD nextReOrderWritePtr;
     reOrderAnchorLength[reOrderStateWrPtr]     <= #`SD Anchor_Length;
     reOrderAnchorAddr[reOrderStateWrPtr]       <= #`SD Anchor_Address;
    end

always @ (posedge SysClk)
  if (!Reset_L)        oddNumberPkt <= 1'b0;
  else if (anchorDone) oddNumberPkt <= #`SD ~oddNumberPkt;

always @ (posedge SysClk)
  if (!Reset_L)              reOrderStateRdPtr <= {REORDER_PTR{1'b0}};
  else if (reOrderEntriesRd) reOrderStateRdPtr <= #`SD reOrderStateRdPtr
                                                       +
                                            {{(REORDER_PTR-1){1'b0}}, 1'b1};

always @ (posedge SysClk)
  if (!Reset_L)            reOrderStateWrPtr <= {REORDER_PTR{1'b0}};
  else if (Anchor_LoadTID) reOrderStateWrPtr <= #`SD reOrderStateWrPtr
                                                     +
                                          {{(REORDER_PTR-1){1'b0}}, 1'b1};

/*--------------------------------------------------------------*/
// Re-Order FIFO Logic
/*--------------------------------------------------------------*/
assign ReOrderFifoReadStrobe  = ReOrderFifoRead;
assign ReOrderReadPtr         = readPtr;


assign residualBytes = |(totalAlignedNumberofBytes[3:0]);

assign totalAlignedNumberofBytes = ({1'b0, Anchor_Length}
                                     +
                                    {10'h0, Anchor_Address[3:0]}
                                   );

assign normalized_Anchor_Length = ({1'b0,totalAlignedNumberofBytes[13:4]}
                                   +
                                   {10'h0, residualBytes}
                                  );

assign reAlignerSpaceAvailable = {1'b0, spaceAvailable[10:0],4'h0};

/*--------------------------------------------------------------*/
// Re-Order Read Logic
/*--------------------------------------------------------------*/
assign ReOrderFifoEmpty       = !Reset_L ? 1'b0
                                    : (readPtr == shadowReOrderWritePtr);

assign readPtrPlusOne = ({1'b0, readPtr} + 11'h1);

assign ReOrderFifoAlmostEmpty = !Reset_L ? 1'b0
                              : (readPtrPlusOne[9:0]) == shadowReOrderWritePtr;

always @ (posedge SysClk)
  if (!Reset_L)
     readPtr <= 10'h0;
  else if (ReOrderFifoRead && !ReOrderFifoEmpty)
     readPtr <= #`SD readPtr + 10'd1;

/*--------------------------------------------------------------*/
// Re-Order Write Logic
/*--------------------------------------------------------------*/
always @ (posedge SysClk)
  begin
   if (!Reset_L)
         reOrderFifoFull <= 1'b0;
   else if (shadowReOrderWritePtr > readPtr)
     begin
       if ((shadowReOrderWritePtr - readPtr) > 10'd1022)
         reOrderFifoFull <= #`SD 1'b1;
       else
         reOrderFifoFull <= #`SD 1'b0;
     end
   else if (shadowReOrderWritePtr < readPtr)
     begin
       if ((readPtr - shadowReOrderWritePtr) <= 10'd2)
         reOrderFifoFull <= #`SD 1'b1;
       else
         reOrderFifoFull <= #`SD 1'b0;
     end
   else if (readPtr == shadowReOrderWritePtr)
     reOrderFifoFull <= #`SD 1'b0;
  end

assign pointerDifference = {1'b0, nextReOrderWritePtr} - {1'b0, readPtr};


always @ (posedge SysClk)
   if (!Reset_L)
      spaceAvailable <= 11'h0;
   else
      spaceAvailable <= #`SD {(`FIFO_SIZE_1024_MINUS_1
                                -
                                {1'b0, pointerDifference[9:0]}
                               +
                               {10'h0, ReOrderFifoRead})
                              };

assign endingReOrderWritePtr = nextReOrderWritePtr 
                               +
                               normalized_Anchor_Length[9:0];

always @ (posedge SysClk)
  if (!Reset_L)
     nextReOrderWritePtr <= 10'h0;
  else if (primeAnchor)
     nextReOrderWritePtr <= #`SD nextReOrderWritePtr 
                                 +
                                 normalized_Anchor_Length[9:0];

assign offsetForReOrderWritePtr = portFifoSelect ?
                                     {1'b0, resp_Address[13:4]} 
                                      -
                                     {1'b0, extractedReqAddress[13:4]}
                                     : 11'h0;


always @ (posedge SysClk)
  if (!Reset_L)              extractedNextWrPtrD1 <= 10'h0;
  else if (ldExtractedState) extractedNextWrPtrD1 <= #`SD extractedNextWrPtr;

always @ (posedge SysClk)
  if (!Reset_L)
    offsetForReOrderWritePtrD1 <= 10'h0;
  else if (ldExtractedState)
    offsetForReOrderWritePtrD1 <= #`SD offsetForReOrderWritePtr[9:0];

assign newReOrderWritePtr =  extractedNextWrPtrD1
                             +
                             offsetForReOrderWritePtrD1;

assign reOrderWritePtrPlusOne = ReOrderWritePtr + 10'd1;

assign incReOrderWritePtr = ReOrderFifoWrite && !reOrderFifoFull;

always @ (posedge SysClk)
  if (!Reset_L) ldExtractedStateD1 <= 1'b0;
  else          ldExtractedStateD1 <= #`SD ldExtractedState;

always @ (posedge SysClk)
  if (!Reset_L)                ReOrderWritePtr <= 10'h0;
  else if (ldExtractedStateD1) ReOrderWritePtr <= #`SD newReOrderWritePtr;
  else if (incReOrderWritePtr) ReOrderWritePtr <= #`SD reOrderWritePtrPlusOne;

always @ (posedge SysClk)
  if (!Reset_L)
     shadowReOrderWritePtr <= 10'h0;
  else if (updateShadowReOrderWrPtr)
     shadowReOrderWritePtr <= #`SD atHeadOfFifoEndingWrPtr;

/*--------------------------------------------------------------*/
// Extracted State from ReOrder Logic
/*--------------------------------------------------------------*/
assign atHeadOfFifoMarkBit     = reOrderDMAMarkBit[reOrderStateRdPtr];
assign atHeadOfFifoGatherLast  = reOrderGatherLast[reOrderStateRdPtr];
assign atHeadOfFifoDMANumber   = reOrderDMANumber[reOrderStateRdPtr];
assign atHeadOfFifoEndingWrPtr = reOrderEndingWrPtr[reOrderStateRdPtr];

assign extractedEndingWrPtr  = reOrderEndingWrPtr[reOrderIndex];
assign extractedSopBit       = reOrderSopBit[reOrderIndex];
assign extractedGatherLast   = reOrderGatherLast[reOrderIndex];
assign extractedOddNumberPkt = reOrderOddNumberPkt[reOrderIndex];
assign extractedDMANumber    = reOrderDMANumber[reOrderIndex];
assign extractedNextWrPtr    = reOrderNextWrPtr[reOrderIndex];
assign extractedReqLength    = reOrderAnchorLength[reOrderIndex];
assign extractedReqAddress   = reOrderAnchorAddr[reOrderIndex];

assign respDmaNumFail = (extractedDMANumber != resp_DMA_Num);

assign respLengthFail = (resp_Data_Length > {1'b0, extractedReqLength});

assign upperBoundAddress = ({1'b0, extractedReqAddressD1[43:0]}
                            +
                            {32'h0, extractedReqLengthD1});

always @ (posedge SysClk)
  if (!Reset_L) extractedReqLengthD1 <= 13'h0;
  else          extractedReqLengthD1 <= #`SD extractedReqLength;

always @ (posedge SysClk)
  if (!Reset_L) extractedReqAddressD1 <= 64'h0;
  else          extractedReqAddressD1 <= #`SD extractedReqAddress;

always @ (posedge SysClk)
  if (!Reset_L) addressUpperBound <= 44'h0;
  else          addressUpperBound <= #`SD upperBoundAddress[43:0];


assign respAddrPageHandleMatch          = (resp_Address[63:44]
                                           ==
                                           extractedReqAddressD1[63:44]);

assign respAddrLessThanEq2UpperBound    = (addressUpperBound[43:0]
                                           >=
                                           resp_Address[43:0]);

assign respAddrGreaterThanEq2LowerBound = (addressUpperBound[43:0]
                                           >=
                                           resp_Address[43:0]);


assign respAddressPass = (respAddrPageHandleMatch
                          &
                          respAddrLessThanEq2UpperBound
                          &
                          respAddrGreaterThanEq2LowerBound
                         );

assign respAddrFail = (ldExtractedStateD1
                       &
                       ~respAddressPass
                      );

/*--------------------------------------------------------------*/
// Re-Order State PIO Accessable
/*--------------------------------------------------------------*/
assign collisionTidsUpdate = Anchor_LoadTID & setBuffDone;


always @(Anchor_TransID)
  begin
  case(Anchor_TransID[4:0])  // Synopsys full_case parallel_case
     `TID_ZERO:         loadTID = 32'h00000001;
     `TID_ONE:          loadTID = 32'h00000002;
     `TID_TWO:          loadTID = 32'h00000004;
     `TID_THREE:        loadTID = 32'h00000008;
     `TID_FOUR:         loadTID = 32'h00000010;
     `TID_FIVE:         loadTID = 32'h00000020;
     `TID_SIX:          loadTID = 32'h00000040;
     `TID_SEVEN:        loadTID = 32'h00000080;
     `TID_EIGHT:        loadTID = 32'h00000100;
     `TID_NINE:         loadTID = 32'h00000200;
     `TID_TEN:          loadTID = 32'h00000400;
     `TID_ELEVEN:       loadTID = 32'h00000800;
     `TID_TWELVE:       loadTID = 32'h00001000;
     `TID_THIRTEEN:     loadTID = 32'h00002000;
     `TID_FOURTEEN:     loadTID = 32'h00004000;
     `TID_FIFTEEN:      loadTID = 32'h00008000;
     `TID_SIXTEEN:      loadTID = 32'h00010000;
     `TID_SEVENTEEN:    loadTID = 32'h00020000;
     `TID_EIGHTEEN:     loadTID = 32'h00040000;
     `TID_NINETEEN:     loadTID = 32'h00080000;
     `TID_TWENTY:       loadTID = 32'h00100000;
     `TID_TWENTYONE:    loadTID = 32'h00200000;
     `TID_TWENTYTWO:    loadTID = 32'h00400000;
     `TID_TWENTYTHREE:  loadTID = 32'h00800000;
     `TID_TWENTYFOUR:   loadTID = 32'h01000000;
     `TID_TWENTYFIVE:   loadTID = 32'h02000000;
     `TID_TWENTYSIX:    loadTID = 32'h04000000;
     `TID_TWENTYSEVEN:  loadTID = 32'h08000000;
     `TID_TWENTYEIGHT:  loadTID = 32'h10000000;
     `TID_TWENTYNINE:   loadTID = 32'h20000000;
     `TID_THIRTY:       loadTID = 32'h40000000;
     `TID_THIRTYONE:    loadTID = 32'h80000000;
  endcase
end

always @(resp_TransID)
  begin
  case(resp_TransID[4:0])  // Synopsys full_case parallel_case
     `TID_ZERO:         clearTID = 32'h00000001;
     `TID_ONE:          clearTID = 32'h00000002;
     `TID_TWO:          clearTID = 32'h00000004;
     `TID_THREE:        clearTID = 32'h00000008;
     `TID_FOUR:         clearTID = 32'h00000010;
     `TID_FIVE:         clearTID = 32'h00000020;
     `TID_SIX:          clearTID = 32'h00000040;
     `TID_SEVEN:        clearTID = 32'h00000080;
     `TID_EIGHT:        clearTID = 32'h00000100;
     `TID_NINE:         clearTID = 32'h00000200;
     `TID_TEN:          clearTID = 32'h00000400;
     `TID_ELEVEN:       clearTID = 32'h00000800;
     `TID_TWELVE:       clearTID = 32'h00001000;
     `TID_THIRTEEN:     clearTID = 32'h00002000;
     `TID_FOURTEEN:     clearTID = 32'h00004000;
     `TID_FIFTEEN:      clearTID = 32'h00008000;
     `TID_SIXTEEN:      clearTID = 32'h00010000;
     `TID_SEVENTEEN:    clearTID = 32'h00020000;
     `TID_EIGHTEEN:     clearTID = 32'h00040000;
     `TID_NINETEEN:     clearTID = 32'h00080000;
     `TID_TWENTY:       clearTID = 32'h00100000;
     `TID_TWENTYONE:    clearTID = 32'h00200000;
     `TID_TWENTYTWO:    clearTID = 32'h00400000;
     `TID_TWENTYTHREE:  clearTID = 32'h00800000;
     `TID_TWENTYFOUR:   clearTID = 32'h01000000;
     `TID_TWENTYFIVE:   clearTID = 32'h02000000;
     `TID_TWENTYSIX:    clearTID = 32'h04000000;
     `TID_TWENTYSEVEN:  clearTID = 32'h08000000;
     `TID_TWENTYEIGHT:  clearTID = 32'h10000000;
     `TID_TWENTYNINE:   clearTID = 32'h20000000;
     `TID_THIRTY:       clearTID = 32'h40000000;
     `TID_THIRTYONE:    clearTID = 32'h80000000;
  endcase
end

always @ (posedge SysClk)
  if (!Reset_L)                 TidsInUse <= 32'h0;
  else if (WrTidsInUse)         TidsInUse <= #`SD PioDataIn;
  else if (collisionTidsUpdate) TidsInUse <= #`SD ((TidsInUse & ~(clearTID))
                                                   |
                                                   loadTID
                                                  );
  else if (Anchor_LoadTID)      TidsInUse <= #`SD TidsInUse | loadTID;
  else if (setBuffDone)         TidsInUse <= #`SD TidsInUse & ~(clearTID);

assign collisionDupTids = ClearStatistics & Anchor_LoadTID;
assign collisionUnInit  = ClearStatistics & setBuffDone;
assign collisionTimeout = ClearStatistics & setTidTimeOut;
assign setTidTimeOut    = resp_Trans_Complete & transactionTimeout;

always @ (posedge SysClk)
  if (!Reset_L)                 DuplicateTid <= 32'h0;
  else if (collisionDupTids)    DuplicateTid <= #`SD (TidsInUse & loadTID);
  else if (ClearStatistics)     DuplicateTid <= #`SD 32'h0;
  else if (WrDuplicateTid)      DuplicateTid <= #`SD PioDataIn;
  else if (Anchor_LoadTID)      DuplicateTid <= #`SD (DuplicateTid
                                                      |
                                                      (TidsInUse & loadTID)
                                                     );

always @ (posedge SysClk)
  if (!Reset_L)                UnInitializedTID <= 32'h0;
  else if (collisionUnInit)    UnInitializedTID <= #`SD (~TidsInUse & clearTID);
  else if (ClearStatistics)    UnInitializedTID <= #`SD 32'h0;
  else if (WrUnInitializedTID) UnInitializedTID <= #`SD PioDataIn;
  else if (setBuffDone)        UnInitializedTID <= #`SD (UnInitializedTID
                                                         |
                                                         (~TidsInUse & clearTID)
                                                        );

always @ (posedge SysClk)
  if (!Reset_L)              TimedoutTids <= 32'h0;
  else if (collisionTimeout) TimedoutTids <= #`SD (TidsInUse & clearTID);
  else if (ClearStatistics)  TimedoutTids <= #`SD 32'h0;
  else if (WrTimedoutTids)   TimedoutTids <= #`SD PioDataIn;
  else if (setTidTimeOut)    TimedoutTids <= #`SD (TimedoutTids
                                                   |
                                                   (TidsInUse & clearTID)
                                                  );

/*--------------------------------------------------------------*/
// Re-Order State Logic PIO Accessable
/*--------------------------------------------------------------*/
assign numberOfReOrderEntries = EnableGMACMode
                                  ? {1'b0,reOrderEntries[2:0]}
                                  : reOrderEntries;

assign ReOrderStateLogic = {enableSpaceAvailWatermark,  //31      1
                            highestSpaceUsed,           //30:21  10
                            spaceAvailable[9:0],        //20:11  10
                            2'b0,                       //10:9    4
                            enableReOrderWatermark,     //8       1
                            highestReOrderUsed,         //7:4     4
                            numberOfReOrderEntries};    //3:0     4

always @ (posedge SysClk)
  if (!Reset_L)                 enableSpaceAvailWatermark <= 1'b0;
  else if (WrReOrderStateLogic) enableSpaceAvailWatermark <= #`SD PioDataIn[31];

assign loadSpaceWatermark = (enableSpaceAvailWatermark
                             &&
                             (highestSpaceUsed < pointerDifference[9:0])
                            );

always @ (posedge SysClk)
  if (!Reset_L) 
     highestSpaceUsed <= 10'h0;
  else if (loadSpaceWatermark)
    begin
      if (pointerDifference[9:0] > highestSpaceUsed)
        highestSpaceUsed <= #`SD pointerDifference[9:0];
    end
  else  highestSpaceUsed <= #`SD pointerDifference[9:0];

always @ (posedge SysClk)
  if (!Reset_L)                 enableReOrderWatermark <= 1'b0;
  else if (WrReOrderStateLogic) enableReOrderWatermark <= #`SD PioDataIn[8];

assign loadReOrderWatermark = (enableReOrderWatermark
                               &&
                               (highestROUsed < reOrderEntries)
                              );

assign highestReOrderUsed  = EnableGMACMode ? {1'b0, highestROUsed}
                                            : highestROUsed;

always @ (posedge SysClk)
  if (!Reset_L)
     highestROUsed <= {REORDER_PTR{1'b0}};
  else if (loadReOrderWatermark)
    begin
      if (reOrderEntries > highestROUsed)
        highestROUsed <= #`SD reOrderEntries;
    end
  else  highestROUsed <= #`SD reOrderEntries;

/*--------------------------------------------------------------*/
// Re-Order State Control PIO Accessable
/*--------------------------------------------------------------*/
assign ReOrderStateControl = {clrFailedState,       //31     RW
                              3'b0,                 //30:28  RSVD
                              reOrderStateFailAddr, //27:24  RO
                              1'b0,                 //23     RSVD
                              addressFailed,        //22     RO
                              dMAFailed,            //21     RO
                              lengthFailed,         //20     RO
                              1'b0,                 //19     RSVD
                              captureAddressFail,   //18     RW
                              captureDMAFail,       //17     RW
                              captureLengthFail,    //16     RW
                              8'b0,                 //15:8   RSVD
                              reOrderStateRdDone,   //7      RO
                              reOrderStateWrDone,   //6      RO
                              reOrderStateRead,     //5      RW
                              reOrderStateWrite,    //4      RW
                              reOrderStatePioAddr}; //3:0    RW

assign reOrderStatePioAddr  = EnableGMACMode ? {1'b0, rOStatePioAddr}
                                             : rOStatePioAddr;

assign reOrderStateFailAddr = EnableGMACMode ? {1'b0, rOStateFailAddr}
                                             : rOStateFailAddr;
always @ (posedge SysClk)
  if (!Reset_L)
    begin
      clrFailedState      <= 1'b0;
      captureAddressFail  <= 1'b0;
      captureDMAFail      <= 1'b0;
      captureLengthFail   <= 1'b0;
      reOrderStateRead    <= 1'b0;
      reOrderStateWrite   <= 1'b0;
      rOStatePioAddr      <= {REORDER_PTR{1'b0}};
    end
  else if (WrReOrderStateControl)
    begin
      clrFailedState      <= #`SD PioDataIn[31];
      captureAddressFail  <= #`SD PioDataIn[18];
      captureDMAFail      <= #`SD PioDataIn[17];
      captureLengthFail   <= #`SD PioDataIn[16];
      reOrderStateRead    <= #`SD PioDataIn[5];
      reOrderStateWrite   <= #`SD PioDataIn[4];
      if (EnableGMACMode)
        rOStatePioAddr <= #`SD PioDataIn[2:0];
      else
        rOStatePioAddr <= #`SD PioDataIn[3:0];
    end
  else
    begin
      if (reOrderStateRdDone) reOrderStateRead  <= #`SD 1'b0;
      if (reOrderStateWrDone) reOrderStateWrite <= #`SD 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L) clrFailedStateD1 <= 1'b0;
  else          clrFailedStateD1 <= #`SD clrFailedState;

assign clrFailedStatePosEdge = clrFailedState & ~clrFailedStateD1;

always @ (posedge SysClk)
  if (!Reset_L)                   reOrderStateRdDone <= 1'b0;
  else if (clrFailedStatePosEdge) reOrderStateRdDone <= #`SD 1'b0;
  else if (reOrderStateRead)      reOrderStateRdDone <= #`SD 1'b1;

always @ (posedge SysClk)
  if (!Reset_L) reOrderStateRdDoneD1 <= 1'b0;
  else          reOrderStateRdDoneD1 <= #`SD reOrderStateRdDone;

assign reOrderStateRdDonePosEdge = reOrderStateRdDone & ~reOrderStateRdDoneD1;

always @ (posedge SysClk)
  if (!Reset_L)                   reOrderStateWrDone <= 1'b0;
  else if (WrReOrderStateControl) reOrderStateWrDone <= #`SD 1'b0;
  else if (reOrderStateWrite)     reOrderStateWrDone <= #`SD 1'b1;

always @ (posedge SysClk)
  if (!Reset_L) reOrderStateWrDoneD1 <= 1'b0;
  else          reOrderStateWrDoneD1 <= #`SD reOrderStateWrDone;

assign reOrderStateWrDonePosEdge = reOrderStateWrDone & ~reOrderStateWrDoneD1;

always @ (posedge SysClk)
  if (!Reset_L)                   failedStateLoaded <= 1'b0;
  else if (WrReOrderStateControl) failedStateLoaded <= #`SD 1'b0;
  else if (loadFailedState)       failedStateLoaded <= #`SD 1'b1;

assign enableFailedStateLoad = (!failedStateLoaded & portFifoSelect);

always @ (posedge SysClk)
  if (!Reset_L)                   loadAddrFailed <= 1'b0;
  else if (enableFailedStateLoad) loadAddrFailed <= #`SD (respAddrFail
                                                          &
                                                          captureAddressFail);
  else                            loadAddrFailed <= #`SD 1'b0;

always @ (posedge SysClk)
  if (!Reset_L)                   loadDMAFailed <= 1'b0;
  else if (enableFailedStateLoad) loadDMAFailed <= #`SD (respDmaNumFail
                                                         &
                                                         captureDMAFail);

  else                            loadDMAFailed <= #`SD 1'b0;

always @ (posedge SysClk)
  if (!Reset_L)                   loadLengthFailed <= 1'b0;
  else if (enableFailedStateLoad) loadLengthFailed <= #`SD (respLengthFail
                                                            &
                                                            captureLengthFail);

  else                            loadLengthFailed <= #`SD 1'b0;

assign loadFailedState = (loadAddrFailed | loadDMAFailed | loadLengthFailed);

always @ (posedge SysClk)
  if (!Reset_L)                    addressFailed <= 1'b0;
  else if (clrFailedStatePosEdge)  addressFailed <= #`SD 1'b0;
  else if (loadAddrFailed)         addressFailed <= #`SD 1'b1;

always @ (posedge SysClk)
  if (!Reset_L)                    dMAFailed <= 1'b0;
  else if (clrFailedStatePosEdge)  dMAFailed <= #`SD 1'b0;
  else if (loadDMAFailed)          dMAFailed <= #`SD 1'b1;

always @ (posedge SysClk)
  if (!Reset_L)                    lengthFailed <= 1'b0;
  else if (clrFailedStatePosEdge)  lengthFailed <= #`SD 1'b0;
  else if (loadLengthFailed)       lengthFailed <= #`SD 1'b1;

always @ (posedge SysClk)
  if (!Reset_L)                    rOStateFailAddr <= {REORDER_PTR{1'b0}};
  else if (clrFailedStatePosEdge)  rOStateFailAddr <= #`SD 4'h0;
  else if (loadFailedState)        rOStateFailAddr <= #`SD reOrderIndex;

always @ (posedge SysClk)
  if (!Reset_L)               reOrderStRdAddr <= {REORDER_PTR{1'b0}};
  else if (reOrderStateRead)  reOrderStRdAddr <= #`SD rOStatePioAddr;
  else                        reOrderStRdAddr <= #`SD reOrderIndex;


assign pioStateSopBit       = reOrderSopBit[reOrderStRdAddr];      // 1'b0
assign pioStateOddNumberPkt = reOrderOddNumberPkt[reOrderStRdAddr];// 1'b0
assign pioStateDMAMarkBit   = reOrderDMAMarkBit[reOrderStRdAddr];  // 1'b0
assign pioStateGatherLast   = reOrderGatherLast[reOrderStRdAddr];  // 1'b0
assign pioStateDMANumber    = reOrderDMANumber[reOrderStRdAddr];   // 5'h0
assign pioStateEndingWrPtr  = reOrderEndingWrPtr[reOrderStRdAddr]; // 10'h0
assign pioStateNextWrPtr    = reOrderNextWrPtr[reOrderStRdAddr];   // 10'h0
assign pioStateAnchorLength = reOrderAnchorLength[reOrderStRdAddr];// 13'h0
assign pioStateAnchorAddr   = reOrderAnchorAddr[reOrderStRdAddr];  // 64'h0


always @ (posedge SysClk)
  if (!Reset_L)                 ReOrderStateData0 <= 32'h0;
  else if (WrReOrderStateData0) ReOrderStateData0 <= #`SD PioDataIn;
  else if (loadFailedState | reOrderStateRdDonePosEdge)
    ReOrderStateData0 <= #`SD {6'b0,                   //       - 31:26
                               pioStateSopBit,         // 1'b0  - 25
                               pioStateOddNumberPkt,   // 1'b0  - 24
                               1'b0,                   //       - 23
                               pioStateDMAMarkBit,     // 1'b0  - 22
                               1'b0,                   //       - 21
                               pioStateGatherLast,     // 1'b0  - 20
                               4'b0,                   //       - 19:16
                               pioStateDMANumber,      // 5'h0  - 15:11
                               1'b0,                   //       - 10
                               pioStateEndingWrPtr     // 10'h0 -  9:0
                              };

always @ (posedge SysClk)
  if (!Reset_L)                 ReOrderStateData1 <= 32'h0;
  else if (WrReOrderStateData1) ReOrderStateData1 <= #`SD PioDataIn;
  else if (loadFailedState | reOrderStateRdDonePosEdge)
    ReOrderStateData1 <= #`SD {6'b0,                   //       - 31:26
                               pioStateNextWrPtr,      // 10'h0 - 25:16
                               3'b0,                   //       - 15:13
                               pioStateAnchorLength    // 13'h0 - 12:0
                              };

always @ (posedge SysClk)
  if (!Reset_L)                 ReOrderStateData2 <= 32'h0;
  else if (WrReOrderStateData2) ReOrderStateData2 <= #`SD PioDataIn;
  else if (loadFailedState | reOrderStateRdDonePosEdge)
    ReOrderStateData2 <= #`SD pioStateAnchorAddr[63:32];

always @ (posedge SysClk)
  if (!Reset_L)                 ReOrderStateData3 <= 32'h0;
  else if (WrReOrderStateData3) ReOrderStateData3 <= #`SD PioDataIn;
  else if (loadFailedState | reOrderStateRdDonePosEdge)
    ReOrderStateData3 <= #`SD pioStateAnchorAddr[31:0];


/*--------------------------------------------------------------*/
// TXC -> TDMC Interface Signals
/*--------------------------------------------------------------*/
always @(atHeadOfFifoDMANumber)
  begin
  case(atHeadOfFifoDMANumber)  // Synopsys full_case parallel_case
     `DMA_CHANNEL_ZERO:         dmaNumber = 24'h000001;
     `DMA_CHANNEL_ONE:          dmaNumber = 24'h000002;
     `DMA_CHANNEL_TWO:          dmaNumber = 24'h000004;
     `DMA_CHANNEL_THREE:        dmaNumber = 24'h000008;
     `DMA_CHANNEL_FOUR:         dmaNumber = 24'h000010;
     `DMA_CHANNEL_FIVE:         dmaNumber = 24'h000020;
     `DMA_CHANNEL_SIX:          dmaNumber = 24'h000040;
     `DMA_CHANNEL_SEVEN:        dmaNumber = 24'h000080;
     `DMA_CHANNEL_EIGHT:        dmaNumber = 24'h000100;
     `DMA_CHANNEL_NINE:         dmaNumber = 24'h000200;
     `DMA_CHANNEL_TEN:          dmaNumber = 24'h000400;
     `DMA_CHANNEL_ELEVEN:       dmaNumber = 24'h000800;
     `DMA_CHANNEL_TWELVE:       dmaNumber = 24'h001000;
     `DMA_CHANNEL_THIRTEEN:     dmaNumber = 24'h002000;
     `DMA_CHANNEL_FOURTEEN:     dmaNumber = 24'h004000;
     `DMA_CHANNEL_FIFTEEN:      dmaNumber = 24'h008000;
     `DMA_CHANNEL_SIXTEEN:      dmaNumber = 24'h010000;
     `DMA_CHANNEL_SEVENTEEN:    dmaNumber = 24'h020000;
     `DMA_CHANNEL_EIGHTEEN:     dmaNumber = 24'h040000;
     `DMA_CHANNEL_NINETEEN:     dmaNumber = 24'h080000;
     `DMA_CHANNEL_TWENTY:       dmaNumber = 24'h100000;
     `DMA_CHANNEL_TWENTYONE:    dmaNumber = 24'h200000;
     `DMA_CHANNEL_TWENTYTWO:    dmaNumber = 24'h400000;
     `DMA_CHANNEL_TWENTYTHREE:  dmaNumber = 24'h800000;
           default: dmaNumber = 24'h0;
  endcase
end

assign updateTDMC   = updateShadowReOrderWrPtr;

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA0_Inc_Head    <= 1'b0;
      DMA0_Mark_Bit    <= 1'b0;
      DMA0_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA0_Inc_Head    <= dmaNumber[0];
      DMA0_Mark_Bit    <= dmaNumber[0] & atHeadOfFifoMarkBit;
      DMA0_Inc_Pkt_Cnt <= dmaNumber[0] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA0_Inc_Head    <= 1'b0;
      DMA0_Mark_Bit    <= 1'b0;
      DMA0_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA1_Inc_Head    <= 1'b0;
      DMA1_Mark_Bit    <= 1'b0;
      DMA1_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA1_Inc_Head    <= dmaNumber[1];
      DMA1_Mark_Bit    <= dmaNumber[1] & atHeadOfFifoMarkBit;
      DMA1_Inc_Pkt_Cnt <= dmaNumber[1] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA1_Inc_Head    <= 1'b0;
      DMA1_Mark_Bit    <= 1'b0;
      DMA1_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA2_Inc_Head    <= 1'b0;
      DMA2_Mark_Bit    <= 1'b0;
      DMA2_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA2_Inc_Head    <= dmaNumber[2];
      DMA2_Mark_Bit    <= dmaNumber[2] & atHeadOfFifoMarkBit;
      DMA2_Inc_Pkt_Cnt <= dmaNumber[2] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA2_Inc_Head    <= 1'b0;
      DMA2_Mark_Bit    <= 1'b0;
      DMA2_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA3_Inc_Head    <= 1'b0;
      DMA3_Mark_Bit    <= 1'b0;
      DMA3_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA3_Inc_Head    <= dmaNumber[3];
      DMA3_Mark_Bit    <= dmaNumber[3] & atHeadOfFifoMarkBit;
      DMA3_Inc_Pkt_Cnt <= dmaNumber[3] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA3_Inc_Head    <= 1'b0;
      DMA3_Mark_Bit    <= 1'b0;
      DMA3_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA4_Inc_Head    <= 1'b0;
      DMA4_Mark_Bit    <= 1'b0;
      DMA4_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA4_Inc_Head    <= dmaNumber[4];
      DMA4_Mark_Bit    <= dmaNumber[4] & atHeadOfFifoMarkBit;
      DMA4_Inc_Pkt_Cnt <= dmaNumber[4] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA4_Inc_Head    <= 1'b0;
      DMA4_Mark_Bit    <= 1'b0;
      DMA4_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA5_Inc_Head    <= 1'b0;
      DMA5_Mark_Bit    <= 1'b0;
      DMA5_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA5_Inc_Head    <= dmaNumber[5];
      DMA5_Mark_Bit    <= dmaNumber[5] & atHeadOfFifoMarkBit;
      DMA5_Inc_Pkt_Cnt <= dmaNumber[5] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA5_Inc_Head    <= 1'b0;
      DMA5_Mark_Bit    <= 1'b0;
      DMA5_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA6_Inc_Head    <= 1'b0;
      DMA6_Mark_Bit    <= 1'b0;
      DMA6_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA6_Inc_Head    <= dmaNumber[6];
      DMA6_Mark_Bit    <= dmaNumber[6] & atHeadOfFifoMarkBit;
      DMA6_Inc_Pkt_Cnt <= dmaNumber[6] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA6_Inc_Head    <= 1'b0;
      DMA6_Mark_Bit    <= 1'b0;
      DMA6_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA7_Inc_Head    <= 1'b0;
      DMA7_Mark_Bit    <= 1'b0;
      DMA7_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA7_Inc_Head    <= dmaNumber[7];
      DMA7_Mark_Bit    <= dmaNumber[7] & atHeadOfFifoMarkBit;
      DMA7_Inc_Pkt_Cnt <= dmaNumber[7] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA7_Inc_Head    <= 1'b0;
      DMA7_Mark_Bit    <= 1'b0;
      DMA7_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA8_Inc_Head    <= 1'b0;
      DMA8_Mark_Bit    <= 1'b0;
      DMA8_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA8_Inc_Head    <= dmaNumber[8];
      DMA8_Mark_Bit    <= dmaNumber[8] & atHeadOfFifoMarkBit;
      DMA8_Inc_Pkt_Cnt <= dmaNumber[8] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA8_Inc_Head    <= 1'b0;
      DMA8_Mark_Bit    <= 1'b0;
      DMA8_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA9_Inc_Head    <= 1'b0;
      DMA9_Mark_Bit    <= 1'b0;
      DMA9_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA9_Inc_Head    <= dmaNumber[9];
      DMA9_Mark_Bit    <= dmaNumber[9] & atHeadOfFifoMarkBit;
      DMA9_Inc_Pkt_Cnt <= dmaNumber[9] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA9_Inc_Head    <= 1'b0;
      DMA9_Mark_Bit    <= 1'b0;
      DMA9_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA10_Inc_Head    <= 1'b0;
      DMA10_Mark_Bit    <= 1'b0;
      DMA10_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA10_Inc_Head    <= dmaNumber[10];
      DMA10_Mark_Bit    <= dmaNumber[10] & atHeadOfFifoMarkBit;
      DMA10_Inc_Pkt_Cnt <= dmaNumber[10] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA10_Inc_Head    <= 1'b0;
      DMA10_Mark_Bit    <= 1'b0;
      DMA10_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA11_Inc_Head    <= 1'b0;
      DMA11_Mark_Bit    <= 1'b0;
      DMA11_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA11_Inc_Head    <= dmaNumber[11];
      DMA11_Mark_Bit    <= dmaNumber[11] & atHeadOfFifoMarkBit;
      DMA11_Inc_Pkt_Cnt <= dmaNumber[11] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA11_Inc_Head    <= 1'b0;
      DMA11_Mark_Bit    <= 1'b0;
      DMA11_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA12_Inc_Head    <= 1'b0;
      DMA12_Mark_Bit    <= 1'b0;
      DMA12_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA12_Inc_Head    <= dmaNumber[12];
      DMA12_Mark_Bit    <= dmaNumber[12] & atHeadOfFifoMarkBit;
      DMA12_Inc_Pkt_Cnt <= dmaNumber[12] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA12_Inc_Head    <= 1'b0;
      DMA12_Mark_Bit    <= 1'b0;
      DMA12_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA13_Inc_Head    <= 1'b0;
      DMA13_Mark_Bit    <= 1'b0;
      DMA13_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA13_Inc_Head    <= dmaNumber[13];
      DMA13_Mark_Bit    <= dmaNumber[13] & atHeadOfFifoMarkBit;
      DMA13_Inc_Pkt_Cnt <= dmaNumber[13] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA13_Inc_Head    <= 1'b0;
      DMA13_Mark_Bit    <= 1'b0;
      DMA13_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA14_Inc_Head    <= 1'b0;
      DMA14_Mark_Bit    <= 1'b0;
      DMA14_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA14_Inc_Head    <= dmaNumber[14];
      DMA14_Mark_Bit    <= dmaNumber[14] & atHeadOfFifoMarkBit;
      DMA14_Inc_Pkt_Cnt <= dmaNumber[14] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA14_Inc_Head    <= 1'b0;
      DMA14_Mark_Bit    <= 1'b0;
      DMA14_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA15_Inc_Head    <= 1'b0;
      DMA15_Mark_Bit    <= 1'b0;
      DMA15_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA15_Inc_Head    <= dmaNumber[15];
      DMA15_Mark_Bit    <= dmaNumber[15] & atHeadOfFifoMarkBit;
      DMA15_Inc_Pkt_Cnt <= dmaNumber[15] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA15_Inc_Head    <= 1'b0;
      DMA15_Mark_Bit    <= 1'b0;
      DMA15_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA16_Inc_Head    <= 1'b0;
      DMA16_Mark_Bit    <= 1'b0;
      DMA16_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA16_Inc_Head    <= dmaNumber[16];
      DMA16_Mark_Bit    <= dmaNumber[16] & atHeadOfFifoMarkBit;
      DMA16_Inc_Pkt_Cnt <= dmaNumber[16] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA16_Inc_Head    <= 1'b0;
      DMA16_Mark_Bit    <= 1'b0;
      DMA16_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA17_Inc_Head    <= 1'b0;
      DMA17_Mark_Bit    <= 1'b0;
      DMA17_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA17_Inc_Head    <= dmaNumber[17];
      DMA17_Mark_Bit    <= dmaNumber[17] & atHeadOfFifoMarkBit;
      DMA17_Inc_Pkt_Cnt <= dmaNumber[17] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA17_Inc_Head    <= 1'b0;
      DMA17_Mark_Bit    <= 1'b0;
      DMA17_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA18_Inc_Head    <= 1'b0;
      DMA18_Mark_Bit    <= 1'b0;
      DMA18_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA18_Inc_Head    <= dmaNumber[18];
      DMA18_Mark_Bit    <= dmaNumber[18] & atHeadOfFifoMarkBit;
      DMA18_Inc_Pkt_Cnt <= dmaNumber[18] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA18_Inc_Head    <= 1'b0;
      DMA18_Mark_Bit    <= 1'b0;
      DMA18_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA19_Inc_Head    <= 1'b0;
      DMA19_Mark_Bit    <= 1'b0;
      DMA19_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA19_Inc_Head    <= dmaNumber[19];
      DMA19_Mark_Bit    <= dmaNumber[19] & atHeadOfFifoMarkBit;
      DMA19_Inc_Pkt_Cnt <= dmaNumber[19] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA19_Inc_Head    <= 1'b0;
      DMA19_Mark_Bit    <= 1'b0;
      DMA19_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA20_Inc_Head    <= 1'b0;
      DMA20_Mark_Bit    <= 1'b0;
      DMA20_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA20_Inc_Head    <= dmaNumber[20];
      DMA20_Mark_Bit    <= dmaNumber[20] & atHeadOfFifoMarkBit;
      DMA20_Inc_Pkt_Cnt <= dmaNumber[20] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA20_Inc_Head    <= 1'b0;
      DMA20_Mark_Bit    <= 1'b0;
      DMA20_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA21_Inc_Head    <= 1'b0;
      DMA21_Mark_Bit    <= 1'b0;
      DMA21_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA21_Inc_Head    <= dmaNumber[21];
      DMA21_Mark_Bit    <= dmaNumber[21] & atHeadOfFifoMarkBit;
      DMA21_Inc_Pkt_Cnt <= dmaNumber[21] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA21_Inc_Head    <= 1'b0;
      DMA21_Mark_Bit    <= 1'b0;
      DMA21_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA22_Inc_Head    <= 1'b0;
      DMA22_Mark_Bit    <= 1'b0;
      DMA22_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA22_Inc_Head    <= dmaNumber[22];
      DMA22_Mark_Bit    <= dmaNumber[22] & atHeadOfFifoMarkBit;
      DMA22_Inc_Pkt_Cnt <= dmaNumber[22] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA22_Inc_Head    <= 1'b0;
      DMA22_Mark_Bit    <= 1'b0;
      DMA22_Inc_Pkt_Cnt <= 1'b0;
    end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA23_Inc_Head    <= 1'b0;
      DMA23_Mark_Bit    <= 1'b0;
      DMA23_Inc_Pkt_Cnt <= 1'b0;
    end
  else if (updateTDMC)
    begin
      DMA23_Inc_Head    <= dmaNumber[23];
      DMA23_Mark_Bit    <= dmaNumber[23] & atHeadOfFifoMarkBit;
      DMA23_Inc_Pkt_Cnt <= dmaNumber[23] & atHeadOfFifoGatherLast;
    end
  else
    begin
      DMA23_Inc_Head    <= 1'b0;
      DMA23_Mark_Bit    <= 1'b0;
      DMA23_Inc_Pkt_Cnt <= 1'b0;
    end

/*--------------------------------------------------------------*/
// Anchor variables
/*--------------------------------------------------------------*/
assign spaceForAnchor = ({1'b0, totalAlignedNumberofBytes}
                         <
                         reAlignerSpaceAvailable[14:0]);


always @(posedge SysClk)
  if (!Reset_L) Anchor_Done <= #`SD 1'b0;
  else          Anchor_Done <= #`SD anchorDone;

/*--------------------------------------------------------------*/
// Anchor, Re-order & Pointer State Vectors
/*--------------------------------------------------------------*/
always @(posedge SysClk)
  if (!Reset_L) Anchor_State <= #`SD ANCHOR_IDLE;
  else          Anchor_State <= #`SD nextAnchorState;

always @(posedge SysClk)
  if (!Reset_L) ReOrder_State <= #`SD RE_ORDER_IDLE;
  else          ReOrder_State <= #`SD nextReOrderState;

always @(posedge SysClk)
  if (!Reset_L) Pointer_State <= #`SD POINTER_IDLE;
  else          Pointer_State <= #`SD nextPointerState;

/*--------------------------------------------------------------*/
// Anchor State Machine
/*--------------------------------------------------------------*/
function [3:0] AnchorDefaults;
input [3:0] currentState;
  begin
    AnchorDefaults = currentState;
    primeAnchor = 1'b0;
    anchorDone = 1'b0;
  end
endfunction

always @(/*AUTOSENSE*/Txc_Enabled or MAC_Enabled
         or Anchor_State or Req_Anchor
         or spaceForAnchor or reOrderStateFull
        )

      case(Anchor_State) // synopsys full_case parallel_case
                         /* 0in < case -full -parallel */
        ANCHOR_IDLE:
          begin
            nextAnchorState = AnchorDefaults(Anchor_State);

            if (Txc_Enabled)
              begin
                if (MAC_Enabled)
                  begin
                    if (Req_Anchor)
                      nextAnchorState = CHECK_ANCHOR_SIZE;
                  end
              end
          end

        CHECK_ANCHOR_SIZE:
          begin
            nextAnchorState = AnchorDefaults(Anchor_State);

            if (spaceForAnchor & ~reOrderStateFull)
              begin
                primeAnchor = 1'b1;
                anchorDone = 1'b1;
                nextAnchorState = ANCHOR_ACCEPT;
              end
            else
              nextAnchorState = ANCHOR_REJECT;
          end

        ANCHOR_ACCEPT:
          begin
            nextAnchorState = AnchorDefaults(Anchor_State);
            nextAnchorState = ANCHOR_WAIT;
          end

        ANCHOR_REJECT:
          begin
            nextAnchorState = AnchorDefaults(Anchor_State);
            nextAnchorState = ANCHOR_WAIT;
          end

        ANCHOR_WAIT:
          begin
            nextAnchorState = AnchorDefaults(Anchor_State);
            nextAnchorState = ANCHOR_IDLE;
          end

      endcase
/*--------------------------------------------------------------*/
// End of Anchor State Machine
/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/
// Re-Order Data State Machine
/*--------------------------------------------------------------*/
function [3:0] ReOrderDefaults;
input [3:0] currentState;
  begin
    ReOrderDefaults = currentState;
    TXC_DMC_Resp_Accept = 1'b0;
    ldPortInfo = 1'b0;
    ldExtractedState = 1'b0;
    ldTimeoutState = 1'b0;
    ReOrder_Error = 1'b0;
  end
endfunction


always @(/*AUTOSENSE*/Txc_Enabled or MAC_Enabled
         or ReOrder_State or DMC_TXC_Resp_Rdy or DMC_TXC_Resp_Client
         or transactionTimeout or nullTransaction or validTransaction
         or DMC_TXC_Trans_Complete or DMC_TXC_Resp_Complete
        )

      case(ReOrder_State) // synopsys full_case parallel_case
                          /* 0in < case -full -parallel */
        RE_ORDER_IDLE:
          begin
            nextReOrderState = ReOrderDefaults(ReOrder_State);

            if (Txc_Enabled)
              begin
                if (MAC_Enabled)
                  begin
                    if (DMC_TXC_Resp_Rdy & DMC_TXC_Resp_Client)
                      begin
                        nextReOrderState = REORDER_STATE_LOAD;
                        TXC_DMC_Resp_Accept = 1'b1;
                        ldPortInfo = 1'b1;
                      end
                  end
              end
          end


        REORDER_STATE_LOAD:
          begin
            nextReOrderState = ReOrderDefaults(ReOrder_State);
            ldExtractedState = 1'b1;
            if (transactionTimeout)
              begin
                ldTimeoutState = 1'b1;
                nextReOrderState = TRANSACTION_TIMEOUT;
              end
            else if (nullTransaction)
              nextReOrderState = NULL_TRANSACTION;
            else if (validTransaction)
              nextReOrderState = WAIT_FOR_RESP_COMP;
            else
              begin
                ReOrder_Error = 1'b1;
                nextReOrderState = RE_ORDER_FATAL;
              end
          end

        WAIT_FOR_RESP_COMP:
          begin
            nextReOrderState = ReOrderDefaults(ReOrder_State);

            if (DMC_TXC_Trans_Complete | DMC_TXC_Resp_Complete)
              nextReOrderState = FLUSH_PIPELINE;
          end

        TRANSACTION_TIMEOUT:
          begin
            nextReOrderState = ReOrderDefaults(ReOrder_State);

            if (DMC_TXC_Trans_Complete | DMC_TXC_Resp_Complete)
              nextReOrderState = RE_ORDER_IDLE;
          end

        NULL_TRANSACTION:
          begin
            nextReOrderState = ReOrderDefaults(ReOrder_State);

            if (DMC_TXC_Trans_Complete | DMC_TXC_Resp_Complete)
              nextReOrderState = RE_ORDER_IDLE;
          end

        FLUSH_PIPELINE:
          begin
            nextReOrderState = ReOrderDefaults(ReOrder_State);

            if (Txc_Enabled & MAC_Enabled)
              begin
                if (DMC_TXC_Resp_Rdy & DMC_TXC_Resp_Client)
                  begin
                    nextReOrderState = REORDER_STATE_LOAD;
                    TXC_DMC_Resp_Accept = 1'b1;
                    ldPortInfo = 1'b1;
                  end
                else
                  nextReOrderState = RE_ORDER_IDLE;
              end
            else
              nextReOrderState = RE_ORDER_IDLE;
          end

        RE_ORDER_FATAL:
          begin
            nextReOrderState = ReOrderDefaults(ReOrder_State);

            if (!Txc_Enabled | !MAC_Enabled)
              nextReOrderState = RE_ORDER_IDLE;
          end

      endcase

/*--------------------------------------------------------------*/
// Re-Order Read Pointer State Machine
/*--------------------------------------------------------------*/
function [3:0] PointerDefaults;
input [3:0] currentState;
  begin
    PointerDefaults = currentState;
    updateShadowReOrderWrPtr = 1'b0;
    reOrderEntriesRd = 1'b0;
    decReOrderEntries = 1'b0;
  end
endfunction


always @(/*AUTOSENSE*/Txc_Enabled or MAC_Enabled
         or Pointer_State or reOrderStateEmpty
         or bufferDone
        )

      case(Pointer_State) // synopsys full_case parallel_case
                          /* 0in < case -full -parallel */
        POINTER_IDLE:
          begin
            nextPointerState = PointerDefaults(Pointer_State);

            if (Txc_Enabled)
              begin
                if (MAC_Enabled)
                  begin
                    if (~reOrderStateEmpty)
                      begin
                        nextPointerState = WAIT_FOR_POINTER_DONE;
                      end
                  end
              end
          end


        WAIT_FOR_POINTER_DONE:
          begin
            nextPointerState = PointerDefaults(Pointer_State);
            if (bufferDone)
              begin
                updateShadowReOrderWrPtr = 1'b1;
                nextPointerState = POINTER_RD_UPDATE;
              end
          end

        POINTER_RD_UPDATE:
          begin
            nextPointerState = PointerDefaults(Pointer_State);
            reOrderEntriesRd = ~reOrderStateEmpty;
            decReOrderEntries = ~reOrderStateEmpty;
            nextPointerState = POINTER_IDLE;
          end

      endcase

endmodule
