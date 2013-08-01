// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_portRequest.v
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
 *  niu_txc_portRequest.v
 *
 *  TXC Data PortReq
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

module niu_txc_portRequest (
        SysClk,
        Reset_L, 
        Txc_Enabled, 

        Port_Enabled, 

        Pkt_Size_Err,
        DMA_Pkt_Size_Err,
        Pkt_Size_Err_Addr,

        DMA0_EofList,
        DMA0_Error,
        DMA0_GotNxtDesc,
        DMA0_Mark,
        DMA0_SOP,
        DMA0_Func_Num,
        DMA0_DescList,
        DMA0_Length,
        DMA0_PageHandle,
        DMA0_Address,
        SetGetNextDescDMA0,

        DMA1_EofList,
        DMA1_Error,
        DMA1_GotNxtDesc,
        DMA1_Mark,
        DMA1_SOP,
        DMA1_Func_Num,
        DMA1_DescList,
        DMA1_Length,
        DMA1_PageHandle,
        DMA1_Address,
        SetGetNextDescDMA1,

        DMA2_EofList,
        DMA2_Error,
        DMA2_GotNxtDesc,
        DMA2_Mark,
        DMA2_SOP,
        DMA2_Func_Num,
        DMA2_DescList,
        DMA2_Length,
        DMA2_PageHandle,
        DMA2_Address,
        SetGetNextDescDMA2,

        DMA3_EofList,
        DMA3_Error,
        DMA3_GotNxtDesc,
        DMA3_Mark,
        DMA3_SOP,
        DMA3_Func_Num,
        DMA3_DescList,
        DMA3_Length,
        DMA3_PageHandle,
        DMA3_Address,
        SetGetNextDescDMA3,

        DMA4_EofList,
        DMA4_Error,
        DMA4_GotNxtDesc,
        DMA4_Mark,
        DMA4_SOP,
        DMA4_Func_Num,
        DMA4_DescList,
        DMA4_Length,
        DMA4_PageHandle,
        DMA4_Address,
        SetGetNextDescDMA4,

        DMA5_EofList,
        DMA5_Error,
        DMA5_GotNxtDesc,
        DMA5_Mark,
        DMA5_SOP,
        DMA5_Func_Num,
        DMA5_DescList,
        DMA5_Length,
        DMA5_PageHandle,
        DMA5_Address,
        SetGetNextDescDMA5,

        DMA6_EofList,
        DMA6_Error,
        DMA6_GotNxtDesc,
        DMA6_Mark,
        DMA6_SOP,
        DMA6_Func_Num,
        DMA6_DescList,
        DMA6_Length,
        DMA6_PageHandle,
        DMA6_Address,
        SetGetNextDescDMA6,

        DMA7_EofList,
        DMA7_Error,
        DMA7_GotNxtDesc,
        DMA7_Mark,
        DMA7_SOP,
        DMA7_Func_Num,
        DMA7_DescList,
        DMA7_Length,
        DMA7_PageHandle,
        DMA7_Address,
        SetGetNextDescDMA7,

        DMA8_EofList,
        DMA8_Error,
        DMA8_GotNxtDesc,
        DMA8_Mark,
        DMA8_SOP,
        DMA8_Func_Num,
        DMA8_DescList,
        DMA8_Length,
        DMA8_PageHandle,
        DMA8_Address,
        SetGetNextDescDMA8,

        DMA9_EofList,
        DMA9_Error,
        DMA9_GotNxtDesc,
        DMA9_Mark,
        DMA9_SOP,
        DMA9_Func_Num,
        DMA9_DescList,
        DMA9_Length,
        DMA9_PageHandle,
        DMA9_Address,
        SetGetNextDescDMA9,

        DMA10_EofList,
        DMA10_Error,
        DMA10_GotNxtDesc,
        DMA10_Mark,
        DMA10_SOP,
        DMA10_Func_Num,
        DMA10_DescList,
        DMA10_Length,
        DMA10_PageHandle,
        DMA10_Address,
        SetGetNextDescDMA10,

        DMA11_EofList,
        DMA11_Error,
        DMA11_GotNxtDesc,
        DMA11_Mark,
        DMA11_SOP,
        DMA11_Func_Num,
        DMA11_DescList,
        DMA11_Length,
        DMA11_PageHandle,
        DMA11_Address,
        SetGetNextDescDMA11,

        DMA12_EofList,
        DMA12_Error,
        DMA12_GotNxtDesc,
        DMA12_Mark,
        DMA12_SOP,
        DMA12_Func_Num,
        DMA12_DescList,
        DMA12_Length,
        DMA12_PageHandle,
        DMA12_Address,
        SetGetNextDescDMA12,

        DMA13_EofList,
        DMA13_Error,
        DMA13_GotNxtDesc,
        DMA13_Mark,
        DMA13_SOP,
        DMA13_Func_Num,
        DMA13_DescList,
        DMA13_Length,
        DMA13_PageHandle,
        DMA13_Address,
        SetGetNextDescDMA13,

        DMA14_EofList,
        DMA14_Error,
        DMA14_GotNxtDesc,
        DMA14_Mark,
        DMA14_SOP,
        DMA14_Func_Num,
        DMA14_DescList,
        DMA14_Length,
        DMA14_PageHandle,
        DMA14_Address,
        SetGetNextDescDMA14,

        DMA15_EofList,
        DMA15_Error,
        DMA15_GotNxtDesc,
        DMA15_Mark,
        DMA15_SOP,
        DMA15_Func_Num,
        DMA15_DescList,
        DMA15_Length,
        DMA15_PageHandle,
        DMA15_Address,
        SetGetNextDescDMA15,

        DMA16_EofList,
        DMA16_Error,
        DMA16_GotNxtDesc,
        DMA16_Mark,
        DMA16_SOP,
        DMA16_Func_Num,
        DMA16_DescList,
        DMA16_Length,
        DMA16_PageHandle,
        DMA16_Address,
        SetGetNextDescDMA16,

        DMA17_EofList,
        DMA17_Error,
        DMA17_GotNxtDesc,
        DMA17_Mark,
        DMA17_SOP,
        DMA17_Func_Num,
        DMA17_DescList,
        DMA17_Length,
        DMA17_PageHandle,
        DMA17_Address,
        SetGetNextDescDMA17,

        DMA18_EofList,
        DMA18_Error,
        DMA18_GotNxtDesc,
        DMA18_Mark,
        DMA18_SOP,
        DMA18_Func_Num,
        DMA18_DescList,
        DMA18_Length,
        DMA18_PageHandle,
        DMA18_Address,
        SetGetNextDescDMA18,

        DMA19_EofList,
        DMA19_Error,
        DMA19_GotNxtDesc,
        DMA19_Mark,
        DMA19_SOP,
        DMA19_Func_Num,
        DMA19_DescList,
        DMA19_Length,
        DMA19_PageHandle,
        DMA19_Address,
        SetGetNextDescDMA19,

        DMA20_EofList,
        DMA20_Error,
        DMA20_GotNxtDesc,
        DMA20_Mark,
        DMA20_SOP,
        DMA20_Func_Num,
        DMA20_DescList,
        DMA20_Length,
        DMA20_PageHandle,
        DMA20_Address,
        SetGetNextDescDMA20,

        DMA21_EofList,
        DMA21_Error,
        DMA21_GotNxtDesc,
        DMA21_Mark,
        DMA21_SOP,
        DMA21_Func_Num,
        DMA21_DescList,
        DMA21_Length,
        DMA21_PageHandle,
        DMA21_Address,
        SetGetNextDescDMA21,

        DMA22_EofList,
        DMA22_Error,
        DMA22_GotNxtDesc,
        DMA22_Mark,
        DMA22_SOP,
        DMA22_Func_Num,
        DMA22_DescList,
        DMA22_Length,
        DMA22_PageHandle,
        DMA22_Address,
        SetGetNextDescDMA22,

        DMA23_EofList,
        DMA23_Error,
        DMA23_GotNxtDesc,
        DMA23_Mark,
        DMA23_SOP,
        DMA23_Func_Num,
        DMA23_DescList,
        DMA23_Length,
        DMA23_PageHandle,
        DMA23_Address,
        SetGetNextDescDMA23,

        DRR_Arb_Valid,
        DRR_NextDMAChannel,
        DRR_PacketDone,
        PacketByteCount,

        Anchor_Done,
        Anchor_MarkBit,
        Anchor_SopBit,
        Anchor_GatherLast,
        Anchor_LoadTID,
        Anchor_DMA,
        Anchor_TransID,
        Anchor_Length,
        Anchor_Address,
        Req_Anchor,

        DMC_TXC_Req_Ack,
        DMC_TXC_Req_TransID,

        Port_Selected,
        Port_Request,
        Port_Request_Func_Num,
        Port_Request_DMA_Num,
        Port_Request_Length,
        Port_Request_Address,

        DataPortReq_State
       );
    
`include "txc_defines.h"

// Global Signals
input          SysClk;
input          Reset_L;
input          Txc_Enabled;

// Control Registers
input          Port_Enabled;

// Tx Error Interface
output         Pkt_Size_Err;
output [23:0]  DMA_Pkt_Size_Err;
output [43:0]  Pkt_Size_Err_Addr;

reg            Pkt_Size_Err;
reg    [23:0]  DMA_Pkt_Size_Err;
reg    [43:0]  Pkt_Size_Err_Addr;

//DMA0
input          DMA0_EofList;
input          DMA0_Error;
input          DMA0_GotNxtDesc;
input          DMA0_Mark;
input          DMA0_SOP;
input  [1:0]   DMA0_Func_Num;
input  [3:0]   DMA0_DescList;
input  [12:0]  DMA0_Length;
input  [19:0]  DMA0_PageHandle;
input  [43:0]  DMA0_Address;

output         SetGetNextDescDMA0;

//DMA1
input          DMA1_EofList;
input          DMA1_Error;
input          DMA1_GotNxtDesc;
input          DMA1_Mark;
input          DMA1_SOP;
input  [1:0]   DMA1_Func_Num;
input  [3:0]   DMA1_DescList;
input  [12:0]  DMA1_Length;
input  [19:0]  DMA1_PageHandle;
input  [43:0]  DMA1_Address;

output         SetGetNextDescDMA1;

//DMA2
input          DMA2_EofList;
input          DMA2_Error;
input          DMA2_GotNxtDesc;
input          DMA2_Mark;
input          DMA2_SOP;
input  [1:0]   DMA2_Func_Num;
input  [3:0]   DMA2_DescList;
input  [12:0]  DMA2_Length;
input  [19:0]  DMA2_PageHandle;
input  [43:0]  DMA2_Address;

output         SetGetNextDescDMA2;

//DMA3
input          DMA3_EofList;
input          DMA3_Error;
input          DMA3_GotNxtDesc;
input          DMA3_Mark;
input          DMA3_SOP;
input  [1:0]   DMA3_Func_Num;
input  [3:0]   DMA3_DescList;
input  [12:0]  DMA3_Length;
input  [19:0]  DMA3_PageHandle;
input  [43:0]  DMA3_Address;

output         SetGetNextDescDMA3;

//DMA4
input          DMA4_EofList;
input          DMA4_Error;
input          DMA4_GotNxtDesc;
input          DMA4_Mark;
input          DMA4_SOP;
input  [1:0]   DMA4_Func_Num;
input  [3:0]   DMA4_DescList;
input  [12:0]  DMA4_Length;
input  [19:0]  DMA4_PageHandle;
input  [43:0]  DMA4_Address;

output         SetGetNextDescDMA4;

//DMA5
input          DMA5_EofList;
input          DMA5_Error;
input          DMA5_GotNxtDesc;
input          DMA5_Mark;
input          DMA5_SOP;
input  [1:0]   DMA5_Func_Num;
input  [3:0]   DMA5_DescList;
input  [12:0]  DMA5_Length;
input  [19:0]  DMA5_PageHandle;
input  [43:0]  DMA5_Address;

output         SetGetNextDescDMA5;

//DMA6
input          DMA6_EofList;
input          DMA6_Error;
input          DMA6_GotNxtDesc;
input          DMA6_Mark;
input          DMA6_SOP;
input  [1:0]   DMA6_Func_Num;
input  [3:0]   DMA6_DescList;
input  [12:0]  DMA6_Length;
input  [19:0]  DMA6_PageHandle;
input  [43:0]  DMA6_Address;

output         SetGetNextDescDMA6;

//DMA7
input          DMA7_EofList;
input          DMA7_Error;
input          DMA7_GotNxtDesc;
input          DMA7_Mark;
input          DMA7_SOP;
input  [1:0]   DMA7_Func_Num;
input  [3:0]   DMA7_DescList;
input  [12:0]  DMA7_Length;
input  [19:0]  DMA7_PageHandle;
input  [43:0]  DMA7_Address;

output         SetGetNextDescDMA7;

//DMA8
input          DMA8_EofList;
input          DMA8_Error;
input          DMA8_GotNxtDesc;
input          DMA8_Mark;
input          DMA8_SOP;
input  [1:0]   DMA8_Func_Num;
input  [3:0]   DMA8_DescList;
input  [12:0]  DMA8_Length;
input  [19:0]  DMA8_PageHandle;
input  [43:0]  DMA8_Address;

output         SetGetNextDescDMA8;

//DMA9
input          DMA9_EofList;
input          DMA9_Error;
input          DMA9_GotNxtDesc;
input          DMA9_Mark;
input          DMA9_SOP;
input  [1:0]   DMA9_Func_Num;
input  [3:0]   DMA9_DescList;
input  [12:0]  DMA9_Length;
input  [19:0]  DMA9_PageHandle;
input  [43:0]  DMA9_Address;

output         SetGetNextDescDMA9;

//DMA10
input          DMA10_EofList;
input          DMA10_Error;
input          DMA10_GotNxtDesc;
input          DMA10_Mark;
input          DMA10_SOP;
input  [1:0]   DMA10_Func_Num;
input  [3:0]   DMA10_DescList;
input  [12:0]  DMA10_Length;
input  [19:0]  DMA10_PageHandle;
input  [43:0]  DMA10_Address;

output         SetGetNextDescDMA10;

//DMA11
input          DMA11_EofList;
input          DMA11_Error;
input          DMA11_GotNxtDesc;
input          DMA11_Mark;
input          DMA11_SOP;
input  [1:0]   DMA11_Func_Num;
input  [3:0]   DMA11_DescList;
input  [12:0]  DMA11_Length;
input  [19:0]  DMA11_PageHandle;
input  [43:0]  DMA11_Address;

output         SetGetNextDescDMA11;

//DMA12
input          DMA12_EofList;
input          DMA12_Error;
input          DMA12_GotNxtDesc;
input          DMA12_Mark;
input          DMA12_SOP;
input  [1:0]   DMA12_Func_Num;
input  [3:0]   DMA12_DescList;
input  [12:0]  DMA12_Length;
input  [19:0]  DMA12_PageHandle;
input  [43:0]  DMA12_Address;

output         SetGetNextDescDMA12;

//DMA13
input          DMA13_EofList;
input          DMA13_Error;
input          DMA13_GotNxtDesc;
input          DMA13_Mark;
input          DMA13_SOP;
input  [1:0]   DMA13_Func_Num;
input  [3:0]   DMA13_DescList;
input  [12:0]  DMA13_Length;
input  [19:0]  DMA13_PageHandle;
input  [43:0]  DMA13_Address;

output         SetGetNextDescDMA13;

//DMA14
input          DMA14_EofList;
input          DMA14_Error;
input          DMA14_GotNxtDesc;
input          DMA14_Mark;
input          DMA14_SOP;
input  [1:0]   DMA14_Func_Num;
input  [3:0]   DMA14_DescList;
input  [12:0]  DMA14_Length;
input  [19:0]  DMA14_PageHandle;
input  [43:0]  DMA14_Address;

output         SetGetNextDescDMA14;

//DMA15
input          DMA15_EofList;
input          DMA15_Error;
input          DMA15_GotNxtDesc;
input          DMA15_Mark;
input          DMA15_SOP;
input  [1:0]   DMA15_Func_Num;
input  [3:0]   DMA15_DescList;
input  [12:0]  DMA15_Length;
input  [19:0]  DMA15_PageHandle;
input  [43:0]  DMA15_Address;

output         SetGetNextDescDMA15;

//DMA16
input          DMA16_EofList;
input          DMA16_Error;
input          DMA16_GotNxtDesc;
input          DMA16_Mark;
input          DMA16_SOP;
input  [1:0]   DMA16_Func_Num;
input  [3:0]   DMA16_DescList;
input  [12:0]  DMA16_Length;
input  [19:0]  DMA16_PageHandle;
input  [43:0]  DMA16_Address;

output         SetGetNextDescDMA16;

//DMA17
input          DMA17_EofList;
input          DMA17_Error;
input          DMA17_GotNxtDesc;
input          DMA17_Mark;
input          DMA17_SOP;
input  [1:0]   DMA17_Func_Num;
input  [3:0]   DMA17_DescList;
input  [12:0]  DMA17_Length;
input  [19:0]  DMA17_PageHandle;
input  [43:0]  DMA17_Address;

output         SetGetNextDescDMA17;

//DMA18
input          DMA18_EofList;
input          DMA18_Error;
input          DMA18_GotNxtDesc;
input          DMA18_Mark;
input          DMA18_SOP;
input  [1:0]   DMA18_Func_Num;
input  [3:0]   DMA18_DescList;
input  [12:0]  DMA18_Length;
input  [19:0]  DMA18_PageHandle;
input  [43:0]  DMA18_Address;

output         SetGetNextDescDMA18;

//DMA19
input          DMA19_EofList;
input          DMA19_Error;
input          DMA19_GotNxtDesc;
input          DMA19_Mark;
input          DMA19_SOP;
input  [1:0]   DMA19_Func_Num;
input  [3:0]   DMA19_DescList;
input  [12:0]  DMA19_Length;
input  [19:0]  DMA19_PageHandle;
input  [43:0]  DMA19_Address;

output         SetGetNextDescDMA19;

//DMA20
input          DMA20_EofList;
input          DMA20_Error;
input          DMA20_GotNxtDesc;
input          DMA20_Mark;
input          DMA20_SOP;
input  [1:0]   DMA20_Func_Num;
input  [3:0]   DMA20_DescList;
input  [12:0]  DMA20_Length;
input  [19:0]  DMA20_PageHandle;
input  [43:0]  DMA20_Address;

output         SetGetNextDescDMA20;

//DMA21
input          DMA21_EofList;
input          DMA21_Error;
input          DMA21_GotNxtDesc;
input          DMA21_Mark;
input          DMA21_SOP;
input  [1:0]   DMA21_Func_Num;
input  [3:0]   DMA21_DescList;
input  [12:0]  DMA21_Length;
input  [19:0]  DMA21_PageHandle;
input  [43:0]  DMA21_Address;

output         SetGetNextDescDMA21;

//DMA22
input          DMA22_EofList;
input          DMA22_Error;
input          DMA22_GotNxtDesc;
input          DMA22_Mark;
input          DMA22_SOP;
input  [1:0]   DMA22_Func_Num;
input  [3:0]   DMA22_DescList;
input  [12:0]  DMA22_Length;
input  [19:0]  DMA22_PageHandle;
input  [43:0]  DMA22_Address;

output         SetGetNextDescDMA22;

//DMA23
input          DMA23_EofList;
input          DMA23_Error;
input          DMA23_GotNxtDesc;
input          DMA23_Mark;
input          DMA23_SOP;
input  [1:0]   DMA23_Func_Num;
input  [3:0]   DMA23_DescList;
input  [12:0]  DMA23_Length;
input  [19:0]  DMA23_PageHandle;
input  [43:0]  DMA23_Address;

output         SetGetNextDescDMA23;

// DRR Engines Interface
input          DRR_Arb_Valid;
input  [4:0]   DRR_NextDMAChannel;

output         DRR_PacketDone;
output [15:0]  PacketByteCount;

reg    [15:0]  PacketByteCount;

// ReAligner Interface
input          Anchor_Done;

output         Req_Anchor;
output         Anchor_MarkBit;
output         Anchor_SopBit;
output         Anchor_GatherLast;
output         Anchor_LoadTID;
output [4:0]   Anchor_DMA;
output [5:0]   Anchor_TransID;
output [12:0]  Anchor_Length;
output [63:0]  Anchor_Address;

reg            Anchor_MarkBit;
reg            Anchor_SopBit;
reg            Anchor_GatherLast;
reg            Req_Anchor;
reg            Anchor_LoadTID;
reg    [4:0]   Anchor_DMA;
reg    [5:0]   Anchor_TransID;
reg    [12:0]  Anchor_Length;
reg    [63:0]  Anchor_Address;

// Meta Bus
input           DMC_TXC_Req_Ack;
input  [5:0]    DMC_TXC_Req_TransID;

// Data Fetch Interface
input           Port_Selected;

output          Port_Request;
output [1:0]    Port_Request_Func_Num;
output [4:0]    Port_Request_DMA_Num;
output [12:0]   Port_Request_Length;
output [63:0]   Port_Request_Address;

reg             Port_Request;
reg    [1:0]    Port_Request_Func_Num;
reg    [4:0]    Port_Request_DMA_Num;
reg    [12:0]   Port_Request_Length;
reg    [63:0]   Port_Request_Address;

// State Machine
output [3:0]   DataPortReq_State;

reg    [3:0]   DataPortReq_State;

/*--------------------------------------------------------------*/
// Wires & Registers
/*--------------------------------------------------------------*/
wire           nullDescriptor;
wire           singleDescriptor;
wire           multiDescriptor;
wire           decrementDescList;
wire           setPacketSizeErr;
wire           sopBitNotSet;
wire   [63:0]  requestAddress;

reg            portRequestDone;
reg            ldDescList;
reg            anchorRequest;
reg            drrPacketDone;
reg            DRR_PacketDone;
reg            setPortRequest;
reg            gotNextDescriptor;
reg            setGetNextDescriptor;
reg            sopBitSet;
reg            eofListBitSet;
reg            errorBitSet;
reg            markBitSet;
reg            enableSizeCheck;
reg            setEnableSizeCheck;
reg            clrEnableSizeCheck;
reg    [1:0]   dmaFunctionNumber;
reg    [3:0]   nextPortReqState;
reg    [3:0]   descriptorList;
reg    [3:0]   anchorDescList;
reg    [12:0]  anchorLength;
reg    [12:0]  anchorLengthD1;
reg    [15:0]  pktSizeCheck;
reg    [19:0]  pageHandle;
reg    [23:0]  currentDMAChannel;
reg    [43:0]  anchorAddress;

/*--------------------------------------------------------------*/
// Parameters and Defines
/*--------------------------------------------------------------*/
parameter PORT_REQUEST_IDLE    = 4'h0,
          CHECK_FOR_DESCRIPTOR = 4'h1,
          REQ_ANCHOR           = 4'h2,
          WAIT_FOR_ANCHOR      = 4'h3,
          PORT_REQUEST         = 4'h4,
          WAIT_FOR_REQ_ACCEPT  = 4'h5,
          WAIT_FOR_NEXT_DESC   = 4'h6,
          CHECK_PACKET_SIZE    = 4'h7,
          WAIT_FOR_DRR_UPDATE  = 4'h8,
          ERROR_STATE          = 4'h9;

//VCS coverage off
// synopsys translate_off
reg [192:1] PORT_REQUEST_STATE;

always @(DataPortReq_State)
begin
  case(DataPortReq_State)
    PORT_REQUEST_IDLE :     PORT_REQUEST_STATE = "PORT_REQUEST_IDLE";
    CHECK_FOR_DESCRIPTOR :  PORT_REQUEST_STATE = "CHECK_FOR_DESCRIPTOR";
    REQ_ANCHOR :            PORT_REQUEST_STATE = "REQ_ANCHOR";
    WAIT_FOR_ANCHOR :       PORT_REQUEST_STATE = "WAIT_FOR_ANCHOR";
    PORT_REQUEST:           PORT_REQUEST_STATE = "PORT_REQUEST";
    WAIT_FOR_REQ_ACCEPT :   PORT_REQUEST_STATE = "WAIT_FOR_REQ_ACCEPT";
    WAIT_FOR_NEXT_DESC :    PORT_REQUEST_STATE = "WAIT_FOR_NEXT_DESC";
    CHECK_PACKET_SIZE :     PORT_REQUEST_STATE = "CHECK_PACKET_SIZE";
    WAIT_FOR_DRR_UPDATE :   PORT_REQUEST_STATE = "WAIT_FOR_DRR_UPDATE";
    ERROR_STATE :           PORT_REQUEST_STATE = "ERROR_STATE";
       default :            PORT_REQUEST_STATE = "UNKNOWN";
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
assign sopBitNotSet = ~sopBitSet;

/*--------------------------------------------------------------*/
// DRR_NextDMAChannel to one hot encoding
/*--------------------------------------------------------------*/
always @(DRR_NextDMAChannel
        )
    case(DRR_NextDMAChannel) // synopsys full_case parallel_case
     `DMA_CHANNEL_ZERO:         currentDMAChannel = 24'h000001;
     `DMA_CHANNEL_ONE:          currentDMAChannel = 24'h000002;
     `DMA_CHANNEL_TWO:          currentDMAChannel = 24'h000004;
     `DMA_CHANNEL_THREE:        currentDMAChannel = 24'h000008;
     `DMA_CHANNEL_FOUR:         currentDMAChannel = 24'h000010;
     `DMA_CHANNEL_FIVE:         currentDMAChannel = 24'h000020;
     `DMA_CHANNEL_SIX:          currentDMAChannel = 24'h000040;
     `DMA_CHANNEL_SEVEN:        currentDMAChannel = 24'h000080;
     `DMA_CHANNEL_EIGHT:        currentDMAChannel = 24'h000100;
     `DMA_CHANNEL_NINE:         currentDMAChannel = 24'h000200;
     `DMA_CHANNEL_TEN:          currentDMAChannel = 24'h000400;
     `DMA_CHANNEL_ELEVEN:       currentDMAChannel = 24'h000800;
     `DMA_CHANNEL_TWELVE:       currentDMAChannel = 24'h001000;
     `DMA_CHANNEL_THIRTEEN:     currentDMAChannel = 24'h002000;
     `DMA_CHANNEL_FOURTEEN:     currentDMAChannel = 24'h004000;
     `DMA_CHANNEL_FIFTEEN:      currentDMAChannel = 24'h008000;
     `DMA_CHANNEL_SIXTEEN:      currentDMAChannel = 24'h010000;
     `DMA_CHANNEL_SEVENTEEN:    currentDMAChannel = 24'h020000;
     `DMA_CHANNEL_EIGHTEEN:     currentDMAChannel = 24'h040000;
     `DMA_CHANNEL_NINETEEN:     currentDMAChannel = 24'h080000;
     `DMA_CHANNEL_TWENTY:       currentDMAChannel = 24'h100000;
     `DMA_CHANNEL_TWENTYONE:    currentDMAChannel = 24'h200000;
     `DMA_CHANNEL_TWENTYTWO:    currentDMAChannel = 24'h400000;
     `DMA_CHANNEL_TWENTYTHREE:  currentDMAChannel = 24'h800000;
           default: currentDMAChannel = 24'hx;
    endcase


/*--------------------------------------------------------------*/
// Request State Variables
/*--------------------------------------------------------------*/
always @(posedge SysClk)
  if (!Reset_L) portRequestDone <= #`SD 1'b0;
  else          portRequestDone <= #`SD (DMC_TXC_Req_Ack & Port_Selected);

/*--------------------------------------------------------------*/
// Anchor Request State Variables
/*--------------------------------------------------------------*/
assign requestAddress = {pageHandle, anchorAddress};

always @(posedge SysClk)
  if (!Reset_L)           Req_Anchor <= #`SD 1'b0;
  else if (anchorRequest) Req_Anchor <= #`SD 1'b1;
  else if (Anchor_Done)   Req_Anchor <= #`SD 1'b0;

always @(posedge SysClk)
  if (!Reset_L) Anchor_Length <= #`SD 13'h0;
  else          Anchor_Length <= #`SD anchorLength;

always @(posedge SysClk)
  if (!Reset_L) Anchor_Address <= #`SD 64'h0;
  else          Anchor_Address <= #`SD requestAddress;

always @(posedge SysClk)
  if (!Reset_L) Anchor_MarkBit <= #`SD 1'b0;
  else          Anchor_MarkBit <= #`SD markBitSet;

always @(posedge SysClk)
  if (!Reset_L) Anchor_SopBit <= #`SD 1'b0;
  else          Anchor_SopBit <= #`SD sopBitSet;

always @(posedge SysClk)
  if (!Reset_L) Anchor_GatherLast <= #`SD 1'b0;
  else          Anchor_GatherLast <= #`SD singleDescriptor;

always @(posedge SysClk)
  if (!Reset_L) Anchor_DMA <= #`SD 5'h0;
  else          Anchor_DMA <= #`SD DRR_NextDMAChannel;

always @(posedge SysClk)
  if (!Reset_L)           Anchor_TransID <= #`SD 6'h0;
  else if (Port_Selected) Anchor_TransID <= #`SD DMC_TXC_Req_TransID;
  else                    Anchor_TransID <= #`SD 6'h0;

always @(posedge SysClk)
  if (!Reset_L)           Anchor_LoadTID <= #`SD 1'b0;
  else if (Port_Selected) Anchor_LoadTID <= #`SD DMC_TXC_Req_Ack;
  else                    Anchor_LoadTID <= #`SD 1'b0;

/*--------------------------------------------------------------*/
// DMA Channel Variables
/*--------------------------------------------------------------*/
always @(posedge SysClk)
  if (!Reset_L)                             Port_Request <= #`SD 1'b0;
  else if (setPortRequest)                  Port_Request <= #`SD 1'b1;
  else if (DMC_TXC_Req_Ack & Port_Selected) Port_Request <= #`SD 1'b0;

always @(posedge SysClk)
  if (!Reset_L)            Port_Request_Func_Num <= #`SD 2'h0;
  else if (setPortRequest) Port_Request_Func_Num <= #`SD dmaFunctionNumber;

always @(posedge SysClk)
  if (!Reset_L)            Port_Request_DMA_Num <= #`SD 5'h0;
  else if (setPortRequest) Port_Request_DMA_Num <= #`SD DRR_NextDMAChannel;

always @(posedge SysClk)
  if (!Reset_L)            Port_Request_Length <= #`SD 13'h0;
  else if (setPortRequest) Port_Request_Length <= #`SD anchorLength;

always @(posedge SysClk)
  if (!Reset_L)            Port_Request_Address <= #`SD 64'h0;
  else if (setPortRequest) Port_Request_Address <= #`SD requestAddress;

/*--------------------------------------------------------------*/
// DMA Channel Variables
/*--------------------------------------------------------------*/
always @(/*AUTOSENSE*/DRR_NextDMAChannel 
         or DMA23_Func_Num or DMA22_Func_Num or DMA21_Func_Num
         or DMA20_Func_Num or DMA19_Func_Num or DMA18_Func_Num
         or DMA17_Func_Num or DMA16_Func_Num or DMA15_Func_Num
         or DMA14_Func_Num or DMA13_Func_Num or DMA12_Func_Num
         or DMA11_Func_Num or DMA10_Func_Num or DMA9_Func_Num
         or DMA8_Func_Num or DMA7_Func_Num or DMA6_Func_Num
         or DMA5_Func_Num or DMA4_Func_Num or DMA3_Func_Num
         or DMA2_Func_Num or DMA1_Func_Num or DMA0_Func_Num
        )
    case(DRR_NextDMAChannel) // synopsys full_case parallel_case 
     `DMA_CHANNEL_ZERO:         dmaFunctionNumber = DMA0_Func_Num;
     `DMA_CHANNEL_ONE:          dmaFunctionNumber = DMA1_Func_Num;
     `DMA_CHANNEL_TWO:          dmaFunctionNumber = DMA2_Func_Num;
     `DMA_CHANNEL_THREE:        dmaFunctionNumber = DMA3_Func_Num;
     `DMA_CHANNEL_FOUR:         dmaFunctionNumber = DMA4_Func_Num;
     `DMA_CHANNEL_FIVE:         dmaFunctionNumber = DMA5_Func_Num;
     `DMA_CHANNEL_SIX:          dmaFunctionNumber = DMA6_Func_Num;
     `DMA_CHANNEL_SEVEN:        dmaFunctionNumber = DMA7_Func_Num;
     `DMA_CHANNEL_EIGHT:        dmaFunctionNumber = DMA8_Func_Num;
     `DMA_CHANNEL_NINE:         dmaFunctionNumber = DMA9_Func_Num;
     `DMA_CHANNEL_TEN:          dmaFunctionNumber = DMA10_Func_Num;
     `DMA_CHANNEL_ELEVEN:       dmaFunctionNumber = DMA11_Func_Num;
     `DMA_CHANNEL_TWELVE:       dmaFunctionNumber = DMA12_Func_Num;
     `DMA_CHANNEL_THIRTEEN:     dmaFunctionNumber = DMA13_Func_Num;
     `DMA_CHANNEL_FOURTEEN:     dmaFunctionNumber = DMA14_Func_Num;
     `DMA_CHANNEL_FIFTEEN:      dmaFunctionNumber = DMA15_Func_Num;
     `DMA_CHANNEL_SIXTEEN:      dmaFunctionNumber = DMA16_Func_Num;
     `DMA_CHANNEL_SEVENTEEN:    dmaFunctionNumber = DMA17_Func_Num;
     `DMA_CHANNEL_EIGHTEEN:     dmaFunctionNumber = DMA18_Func_Num;
     `DMA_CHANNEL_NINETEEN:     dmaFunctionNumber = DMA19_Func_Num;
     `DMA_CHANNEL_TWENTY:       dmaFunctionNumber = DMA20_Func_Num;
     `DMA_CHANNEL_TWENTYONE:    dmaFunctionNumber = DMA21_Func_Num;
     `DMA_CHANNEL_TWENTYTWO:    dmaFunctionNumber = DMA22_Func_Num;
     `DMA_CHANNEL_TWENTYTHREE:  dmaFunctionNumber = DMA23_Func_Num;
           default: dmaFunctionNumber = 2'hx;
    endcase



always @(/*AUTOSENSE*/DRR_NextDMAChannel
         or DMA23_SOP or DMA22_SOP or DMA21_SOP or DMA20_SOP
         or DMA19_SOP or DMA18_SOP or DMA17_SOP or DMA16_SOP
         or DMA15_SOP or DMA14_SOP or DMA13_SOP or DMA12_SOP
         or DMA11_SOP or DMA10_SOP or DMA9_SOP or DMA8_SOP
         or DMA7_SOP or DMA6_SOP or DMA5_SOP or DMA4_SOP
         or DMA3_SOP or DMA2_SOP or DMA1_SOP or DMA0_SOP
        )
    case(DRR_NextDMAChannel) // synopsys full_case parallel_case
     `DMA_CHANNEL_ZERO:         sopBitSet = DMA0_SOP;
     `DMA_CHANNEL_ONE:          sopBitSet = DMA1_SOP;
     `DMA_CHANNEL_TWO:          sopBitSet = DMA2_SOP;
     `DMA_CHANNEL_THREE:        sopBitSet = DMA3_SOP;
     `DMA_CHANNEL_FOUR:         sopBitSet = DMA4_SOP;
     `DMA_CHANNEL_FIVE:         sopBitSet = DMA5_SOP;
     `DMA_CHANNEL_SIX:          sopBitSet = DMA6_SOP;
     `DMA_CHANNEL_SEVEN:        sopBitSet = DMA7_SOP;
     `DMA_CHANNEL_EIGHT:        sopBitSet = DMA8_SOP;
     `DMA_CHANNEL_NINE:         sopBitSet = DMA9_SOP;
     `DMA_CHANNEL_TEN:          sopBitSet = DMA10_SOP;
     `DMA_CHANNEL_ELEVEN:       sopBitSet = DMA11_SOP;
     `DMA_CHANNEL_TWELVE:       sopBitSet = DMA12_SOP;
     `DMA_CHANNEL_THIRTEEN:     sopBitSet = DMA13_SOP;
     `DMA_CHANNEL_FOURTEEN:     sopBitSet = DMA14_SOP;
     `DMA_CHANNEL_FIFTEEN:      sopBitSet = DMA15_SOP;
     `DMA_CHANNEL_SIXTEEN:      sopBitSet = DMA16_SOP;
     `DMA_CHANNEL_SEVENTEEN:    sopBitSet = DMA17_SOP;
     `DMA_CHANNEL_EIGHTEEN:     sopBitSet = DMA18_SOP;
     `DMA_CHANNEL_NINETEEN:     sopBitSet = DMA19_SOP;
     `DMA_CHANNEL_TWENTY:       sopBitSet = DMA20_SOP;
     `DMA_CHANNEL_TWENTYONE:    sopBitSet = DMA21_SOP;
     `DMA_CHANNEL_TWENTYTWO:    sopBitSet = DMA22_SOP;
     `DMA_CHANNEL_TWENTYTHREE:  sopBitSet = DMA23_SOP;
           default: sopBitSet = 1'bx;
    endcase


always @(/*AUTOSENSE*/DRR_NextDMAChannel
         or DMA23_EofList or DMA22_EofList or DMA21_EofList or DMA20_EofList
         or DMA19_EofList or DMA18_EofList or DMA17_EofList or DMA16_EofList
         or DMA15_EofList or DMA14_EofList or DMA13_EofList or DMA12_EofList
         or DMA11_EofList or DMA10_EofList or DMA9_EofList or DMA8_EofList
         or DMA7_EofList or DMA6_EofList or DMA5_EofList or DMA4_EofList
         or DMA3_EofList or DMA2_EofList or DMA1_EofList or DMA0_EofList
        )
    case(DRR_NextDMAChannel) // synopsys full_case parallel_case
     `DMA_CHANNEL_ZERO:         eofListBitSet = DMA0_EofList;
     `DMA_CHANNEL_ONE:          eofListBitSet = DMA1_EofList;
     `DMA_CHANNEL_TWO:          eofListBitSet = DMA2_EofList;
     `DMA_CHANNEL_THREE:        eofListBitSet = DMA3_EofList;
     `DMA_CHANNEL_FOUR:         eofListBitSet = DMA4_EofList;
     `DMA_CHANNEL_FIVE:         eofListBitSet = DMA5_EofList;
     `DMA_CHANNEL_SIX:          eofListBitSet = DMA6_EofList;
     `DMA_CHANNEL_SEVEN:        eofListBitSet = DMA7_EofList;
     `DMA_CHANNEL_EIGHT:        eofListBitSet = DMA8_EofList;
     `DMA_CHANNEL_NINE:         eofListBitSet = DMA9_EofList;
     `DMA_CHANNEL_TEN:          eofListBitSet = DMA10_EofList;
     `DMA_CHANNEL_ELEVEN:       eofListBitSet = DMA11_EofList;
     `DMA_CHANNEL_TWELVE:       eofListBitSet = DMA12_EofList;
     `DMA_CHANNEL_THIRTEEN:     eofListBitSet = DMA13_EofList;
     `DMA_CHANNEL_FOURTEEN:     eofListBitSet = DMA14_EofList;
     `DMA_CHANNEL_FIFTEEN:      eofListBitSet = DMA15_EofList;
     `DMA_CHANNEL_SIXTEEN:      eofListBitSet = DMA16_EofList;
     `DMA_CHANNEL_SEVENTEEN:    eofListBitSet = DMA17_EofList;
     `DMA_CHANNEL_EIGHTEEN:     eofListBitSet = DMA18_EofList;
     `DMA_CHANNEL_NINETEEN:     eofListBitSet = DMA19_EofList;
     `DMA_CHANNEL_TWENTY:       eofListBitSet = DMA20_EofList;
     `DMA_CHANNEL_TWENTYONE:    eofListBitSet = DMA21_EofList;
     `DMA_CHANNEL_TWENTYTWO:    eofListBitSet = DMA22_EofList;
     `DMA_CHANNEL_TWENTYTHREE:  eofListBitSet = DMA23_EofList;
           default: eofListBitSet = 1'bx;
    endcase


always @(/*AUTOSENSE*/DRR_NextDMAChannel
         or DMA23_Error or DMA22_Error or DMA21_Error or DMA20_Error
         or DMA19_Error or DMA18_Error or DMA17_Error or DMA16_Error
         or DMA15_Error or DMA14_Error or DMA13_Error or DMA12_Error
         or DMA11_Error or DMA10_Error or DMA9_Error or DMA8_Error
         or DMA7_Error or DMA6_Error or DMA5_Error or DMA4_Error
         or DMA3_Error or DMA2_Error or DMA1_Error or DMA0_Error
        )
    case(DRR_NextDMAChannel) // synopsys full_case parallel_case
     `DMA_CHANNEL_ZERO:         errorBitSet = DMA0_Error;
     `DMA_CHANNEL_ONE:          errorBitSet = DMA1_Error;
     `DMA_CHANNEL_TWO:          errorBitSet = DMA2_Error;
     `DMA_CHANNEL_THREE:        errorBitSet = DMA3_Error;
     `DMA_CHANNEL_FOUR:         errorBitSet = DMA4_Error;
     `DMA_CHANNEL_FIVE:         errorBitSet = DMA5_Error;
     `DMA_CHANNEL_SIX:          errorBitSet = DMA6_Error;
     `DMA_CHANNEL_SEVEN:        errorBitSet = DMA7_Error;
     `DMA_CHANNEL_EIGHT:        errorBitSet = DMA8_Error;
     `DMA_CHANNEL_NINE:         errorBitSet = DMA9_Error;
     `DMA_CHANNEL_TEN:          errorBitSet = DMA10_Error;
     `DMA_CHANNEL_ELEVEN:       errorBitSet = DMA11_Error;
     `DMA_CHANNEL_TWELVE:       errorBitSet = DMA12_Error;
     `DMA_CHANNEL_THIRTEEN:     errorBitSet = DMA13_Error;
     `DMA_CHANNEL_FOURTEEN:     errorBitSet = DMA14_Error;
     `DMA_CHANNEL_FIFTEEN:      errorBitSet = DMA15_Error;
     `DMA_CHANNEL_SIXTEEN:      errorBitSet = DMA16_Error;
     `DMA_CHANNEL_SEVENTEEN:    errorBitSet = DMA17_Error;
     `DMA_CHANNEL_EIGHTEEN:     errorBitSet = DMA18_Error;
     `DMA_CHANNEL_NINETEEN:     errorBitSet = DMA19_Error;
     `DMA_CHANNEL_TWENTY:       errorBitSet = DMA20_Error;
     `DMA_CHANNEL_TWENTYONE:    errorBitSet = DMA21_Error;
     `DMA_CHANNEL_TWENTYTWO:    errorBitSet = DMA22_Error;
     `DMA_CHANNEL_TWENTYTHREE:  errorBitSet = DMA23_Error;
           default: errorBitSet = 1'bx;
    endcase


always @(/*AUTOSENSE*/DRR_NextDMAChannel
         or DMA23_Mark or DMA22_Mark or DMA21_Mark or DMA20_Mark
         or DMA19_Mark or DMA18_Mark or DMA17_Mark or DMA16_Mark
         or DMA15_Mark or DMA14_Mark or DMA13_Mark or DMA12_Mark
         or DMA11_Mark or DMA10_Mark or DMA9_Mark or DMA8_Mark
         or DMA7_Mark or DMA6_Mark or DMA5_Mark or DMA4_Mark
         or DMA3_Mark or DMA2_Mark or DMA1_Mark or DMA0_Mark
        )
    case(DRR_NextDMAChannel) // synopsys full_case parallel_case
     `DMA_CHANNEL_ZERO:         markBitSet = DMA0_Mark;
     `DMA_CHANNEL_ONE:          markBitSet = DMA1_Mark;
     `DMA_CHANNEL_TWO:          markBitSet = DMA2_Mark;
     `DMA_CHANNEL_THREE:        markBitSet = DMA3_Mark;
     `DMA_CHANNEL_FOUR:         markBitSet = DMA4_Mark;
     `DMA_CHANNEL_FIVE:         markBitSet = DMA5_Mark;
     `DMA_CHANNEL_SIX:          markBitSet = DMA6_Mark;
     `DMA_CHANNEL_SEVEN:        markBitSet = DMA7_Mark;
     `DMA_CHANNEL_EIGHT:        markBitSet = DMA8_Mark;
     `DMA_CHANNEL_NINE:         markBitSet = DMA9_Mark;
     `DMA_CHANNEL_TEN:          markBitSet = DMA10_Mark;
     `DMA_CHANNEL_ELEVEN:       markBitSet = DMA11_Mark;
     `DMA_CHANNEL_TWELVE:       markBitSet = DMA12_Mark;
     `DMA_CHANNEL_THIRTEEN:     markBitSet = DMA13_Mark;
     `DMA_CHANNEL_FOURTEEN:     markBitSet = DMA14_Mark;
     `DMA_CHANNEL_FIFTEEN:      markBitSet = DMA15_Mark;
     `DMA_CHANNEL_SIXTEEN:      markBitSet = DMA16_Mark;
     `DMA_CHANNEL_SEVENTEEN:    markBitSet = DMA17_Mark;
     `DMA_CHANNEL_EIGHTEEN:     markBitSet = DMA18_Mark;
     `DMA_CHANNEL_NINETEEN:     markBitSet = DMA19_Mark;
     `DMA_CHANNEL_TWENTY:       markBitSet = DMA20_Mark;
     `DMA_CHANNEL_TWENTYONE:    markBitSet = DMA21_Mark;
     `DMA_CHANNEL_TWENTYTWO:    markBitSet = DMA22_Mark;
     `DMA_CHANNEL_TWENTYTHREE:  markBitSet = DMA23_Mark;
           default: markBitSet = 1'bx;
    endcase



always @(/*AUTOSENSE*/DRR_NextDMAChannel 
         or DMA23_Length or DMA22_Length or DMA21_Length or DMA20_Length
         or DMA19_Length or DMA18_Length or DMA17_Length or DMA16_Length
         or DMA15_Length or DMA14_Length or DMA13_Length or DMA12_Length
         or DMA11_Length or DMA10_Length or DMA9_Length or DMA8_Length
         or DMA7_Length or DMA6_Length or DMA5_Length or DMA4_Length
         or DMA3_Length or DMA2_Length or DMA1_Length or DMA0_Length
        )
    case(DRR_NextDMAChannel) // synopsys full_case parallel_case 
     `DMA_CHANNEL_ZERO:         anchorLength = DMA0_Length;
     `DMA_CHANNEL_ONE:          anchorLength = DMA1_Length;
     `DMA_CHANNEL_TWO:          anchorLength = DMA2_Length;
     `DMA_CHANNEL_THREE:        anchorLength = DMA3_Length;
     `DMA_CHANNEL_FOUR:         anchorLength = DMA4_Length;
     `DMA_CHANNEL_FIVE:         anchorLength = DMA5_Length;
     `DMA_CHANNEL_SIX:          anchorLength = DMA6_Length;
     `DMA_CHANNEL_SEVEN:        anchorLength = DMA7_Length;
     `DMA_CHANNEL_EIGHT:        anchorLength = DMA8_Length;
     `DMA_CHANNEL_NINE:         anchorLength = DMA9_Length;
     `DMA_CHANNEL_TEN:          anchorLength = DMA10_Length;
     `DMA_CHANNEL_ELEVEN:       anchorLength = DMA11_Length;
     `DMA_CHANNEL_TWELVE:       anchorLength = DMA12_Length;
     `DMA_CHANNEL_THIRTEEN:     anchorLength = DMA13_Length;
     `DMA_CHANNEL_FOURTEEN:     anchorLength = DMA14_Length;
     `DMA_CHANNEL_FIFTEEN:      anchorLength = DMA15_Length;
     `DMA_CHANNEL_SIXTEEN:      anchorLength = DMA16_Length;
     `DMA_CHANNEL_SEVENTEEN:    anchorLength = DMA17_Length;
     `DMA_CHANNEL_EIGHTEEN:     anchorLength = DMA18_Length;
     `DMA_CHANNEL_NINETEEN:     anchorLength = DMA19_Length;
     `DMA_CHANNEL_TWENTY:       anchorLength = DMA20_Length;
     `DMA_CHANNEL_TWENTYONE:    anchorLength = DMA21_Length;
     `DMA_CHANNEL_TWENTYTWO:    anchorLength = DMA22_Length;
     `DMA_CHANNEL_TWENTYTHREE:  anchorLength = DMA23_Length;
           default: anchorLength = 13'hx;
    endcase

always @(/*AUTOSENSE*/DRR_NextDMAChannel 
         or DMA23_PageHandle
         or DMA22_PageHandle or DMA21_PageHandle or DMA20_PageHandle
         or DMA19_PageHandle or DMA18_PageHandle or DMA17_PageHandle
         or DMA16_PageHandle or DMA15_PageHandle or DMA14_PageHandle
         or DMA13_PageHandle or DMA12_PageHandle or DMA11_PageHandle
         or DMA10_PageHandle or DMA9_PageHandle or DMA8_PageHandle
         or DMA7_PageHandle or DMA6_PageHandle or DMA5_PageHandle
         or DMA4_PageHandle or DMA3_PageHandle or DMA2_PageHandle
         or DMA1_PageHandle or DMA0_PageHandle
        )
    case(DRR_NextDMAChannel) // synopsys full_case parallel_case 
     `DMA_CHANNEL_ZERO:         pageHandle = DMA0_PageHandle;
     `DMA_CHANNEL_ONE:          pageHandle = DMA1_PageHandle;
     `DMA_CHANNEL_TWO:          pageHandle = DMA2_PageHandle;
     `DMA_CHANNEL_THREE:        pageHandle = DMA3_PageHandle;
     `DMA_CHANNEL_FOUR:         pageHandle = DMA4_PageHandle;
     `DMA_CHANNEL_FIVE:         pageHandle = DMA5_PageHandle;
     `DMA_CHANNEL_SIX:          pageHandle = DMA6_PageHandle;
     `DMA_CHANNEL_SEVEN:        pageHandle = DMA7_PageHandle;
     `DMA_CHANNEL_EIGHT:        pageHandle = DMA8_PageHandle;
     `DMA_CHANNEL_NINE:         pageHandle = DMA9_PageHandle;
     `DMA_CHANNEL_TEN:          pageHandle = DMA10_PageHandle;
     `DMA_CHANNEL_ELEVEN:       pageHandle = DMA11_PageHandle;
     `DMA_CHANNEL_TWELVE:       pageHandle = DMA12_PageHandle;
     `DMA_CHANNEL_THIRTEEN:     pageHandle = DMA13_PageHandle;
     `DMA_CHANNEL_FOURTEEN:     pageHandle = DMA14_PageHandle;
     `DMA_CHANNEL_FIFTEEN:      pageHandle = DMA15_PageHandle;
     `DMA_CHANNEL_SIXTEEN:      pageHandle = DMA16_PageHandle;
     `DMA_CHANNEL_SEVENTEEN:    pageHandle = DMA17_PageHandle;
     `DMA_CHANNEL_EIGHTEEN:     pageHandle = DMA18_PageHandle;
     `DMA_CHANNEL_NINETEEN:     pageHandle = DMA19_PageHandle;
     `DMA_CHANNEL_TWENTY:       pageHandle = DMA20_PageHandle;
     `DMA_CHANNEL_TWENTYONE:    pageHandle = DMA21_PageHandle;
     `DMA_CHANNEL_TWENTYTWO:    pageHandle = DMA22_PageHandle;
     `DMA_CHANNEL_TWENTYTHREE:  pageHandle = DMA23_PageHandle;
           default: pageHandle = 20'hx;
    endcase


   // synopsys infer_mux "AnchorAddress_Mux"
always @(/*AUTOSENSE*/DRR_NextDMAChannel 
         or DMA23_Address or DMA22_Address or DMA21_Address or DMA20_Address
         or DMA19_Address or DMA18_Address or DMA17_Address or DMA16_Address
         or DMA15_Address or DMA14_Address or DMA13_Address or DMA12_Address
         or DMA11_Address or DMA10_Address or DMA9_Address or DMA8_Address
         or DMA7_Address or DMA6_Address or DMA5_Address or DMA4_Address
         or DMA3_Address or DMA2_Address or DMA1_Address or DMA0_Address
        )
  begin: AnchorAddress_Mux
    case(DRR_NextDMAChannel) // synopsys full_case parallel_case 
     `DMA_CHANNEL_ZERO:         anchorAddress = DMA0_Address;
     `DMA_CHANNEL_ONE:          anchorAddress = DMA1_Address;
     `DMA_CHANNEL_TWO:          anchorAddress = DMA2_Address;
     `DMA_CHANNEL_THREE:        anchorAddress = DMA3_Address;
     `DMA_CHANNEL_FOUR:         anchorAddress = DMA4_Address;
     `DMA_CHANNEL_FIVE:         anchorAddress = DMA5_Address;
     `DMA_CHANNEL_SIX:          anchorAddress = DMA6_Address;
     `DMA_CHANNEL_SEVEN:        anchorAddress = DMA7_Address;
     `DMA_CHANNEL_EIGHT:        anchorAddress = DMA8_Address;
     `DMA_CHANNEL_NINE:         anchorAddress = DMA9_Address;
     `DMA_CHANNEL_TEN:          anchorAddress = DMA10_Address;
     `DMA_CHANNEL_ELEVEN:       anchorAddress = DMA11_Address;
     `DMA_CHANNEL_TWELVE:       anchorAddress = DMA12_Address;
     `DMA_CHANNEL_THIRTEEN:     anchorAddress = DMA13_Address;
     `DMA_CHANNEL_FOURTEEN:     anchorAddress = DMA14_Address;
     `DMA_CHANNEL_FIFTEEN:      anchorAddress = DMA15_Address;
     `DMA_CHANNEL_SIXTEEN:      anchorAddress = DMA16_Address;
     `DMA_CHANNEL_SEVENTEEN:    anchorAddress = DMA17_Address;
     `DMA_CHANNEL_EIGHTEEN:     anchorAddress = DMA18_Address;
     `DMA_CHANNEL_NINETEEN:     anchorAddress = DMA19_Address;
     `DMA_CHANNEL_TWENTY:       anchorAddress = DMA20_Address;
     `DMA_CHANNEL_TWENTYONE:    anchorAddress = DMA21_Address;
     `DMA_CHANNEL_TWENTYTWO:    anchorAddress = DMA22_Address;
     `DMA_CHANNEL_TWENTYTHREE:  anchorAddress = DMA23_Address;
           default: anchorAddress = 44'hx;
    endcase
  end

always @(/*AUTOSENSE*/DRR_NextDMAChannel 
         or DMA23_DescList
         or DMA22_DescList or DMA21_DescList or DMA20_DescList
         or DMA19_DescList or DMA18_DescList or DMA17_DescList
         or DMA16_DescList or DMA15_DescList or DMA14_DescList
         or DMA13_DescList or DMA12_DescList or DMA11_DescList
         or DMA10_DescList or DMA9_DescList or DMA8_DescList
         or DMA7_DescList or DMA6_DescList or DMA5_DescList
         or DMA4_DescList or DMA3_DescList or DMA2_DescList
         or DMA1_DescList or DMA0_DescList
        )
    case(DRR_NextDMAChannel) // synopsys full_case parallel_case 
     `DMA_CHANNEL_ZERO:         anchorDescList = DMA0_DescList;
     `DMA_CHANNEL_ONE:          anchorDescList = DMA1_DescList;
     `DMA_CHANNEL_TWO:          anchorDescList = DMA2_DescList;
     `DMA_CHANNEL_THREE:        anchorDescList = DMA3_DescList;
     `DMA_CHANNEL_FOUR:         anchorDescList = DMA4_DescList;
     `DMA_CHANNEL_FIVE:         anchorDescList = DMA5_DescList;
     `DMA_CHANNEL_SIX:          anchorDescList = DMA6_DescList;
     `DMA_CHANNEL_SEVEN:        anchorDescList = DMA7_DescList;
     `DMA_CHANNEL_EIGHT:        anchorDescList = DMA8_DescList;
     `DMA_CHANNEL_NINE:         anchorDescList = DMA9_DescList;
     `DMA_CHANNEL_TEN:          anchorDescList = DMA10_DescList;
     `DMA_CHANNEL_ELEVEN:       anchorDescList = DMA11_DescList;
     `DMA_CHANNEL_TWELVE:       anchorDescList = DMA12_DescList;
     `DMA_CHANNEL_THIRTEEN:     anchorDescList = DMA13_DescList;
     `DMA_CHANNEL_FOURTEEN:     anchorDescList = DMA14_DescList;
     `DMA_CHANNEL_FIFTEEN:      anchorDescList = DMA15_DescList;
     `DMA_CHANNEL_SIXTEEN:      anchorDescList = DMA16_DescList;
     `DMA_CHANNEL_SEVENTEEN:    anchorDescList = DMA17_DescList;
     `DMA_CHANNEL_EIGHTEEN:     anchorDescList = DMA18_DescList;
     `DMA_CHANNEL_NINETEEN:     anchorDescList = DMA19_DescList;
     `DMA_CHANNEL_TWENTY:       anchorDescList = DMA20_DescList;
     `DMA_CHANNEL_TWENTYONE:    anchorDescList = DMA21_DescList;
     `DMA_CHANNEL_TWENTYTWO:    anchorDescList = DMA22_DescList;
     `DMA_CHANNEL_TWENTYTHREE:  anchorDescList = DMA23_DescList;
           default: anchorDescList = 4'hx;
    endcase

always @(/*AUTOSENSE*/DRR_NextDMAChannel 
         or DMA23_GotNxtDesc
         or DMA22_GotNxtDesc or DMA21_GotNxtDesc or DMA20_GotNxtDesc
         or DMA19_GotNxtDesc or DMA18_GotNxtDesc or DMA17_GotNxtDesc
         or DMA16_GotNxtDesc or DMA15_GotNxtDesc or DMA14_GotNxtDesc
         or DMA13_GotNxtDesc or DMA12_GotNxtDesc or DMA11_GotNxtDesc
         or DMA10_GotNxtDesc or DMA9_GotNxtDesc or DMA8_GotNxtDesc
         or DMA7_GotNxtDesc or DMA6_GotNxtDesc or DMA5_GotNxtDesc
         or DMA4_GotNxtDesc or DMA3_GotNxtDesc or DMA2_GotNxtDesc
         or DMA1_GotNxtDesc or DMA0_GotNxtDesc
        )
    case(DRR_NextDMAChannel) // synopsys full_case parallel_case 
     `DMA_CHANNEL_ZERO:         gotNextDescriptor = DMA0_GotNxtDesc;
     `DMA_CHANNEL_ONE:          gotNextDescriptor = DMA1_GotNxtDesc;
     `DMA_CHANNEL_TWO:          gotNextDescriptor = DMA2_GotNxtDesc;
     `DMA_CHANNEL_THREE:        gotNextDescriptor = DMA3_GotNxtDesc;
     `DMA_CHANNEL_FOUR:         gotNextDescriptor = DMA4_GotNxtDesc;
     `DMA_CHANNEL_FIVE:         gotNextDescriptor = DMA5_GotNxtDesc;
     `DMA_CHANNEL_SIX:          gotNextDescriptor = DMA6_GotNxtDesc;
     `DMA_CHANNEL_SEVEN:        gotNextDescriptor = DMA7_GotNxtDesc;
     `DMA_CHANNEL_EIGHT:        gotNextDescriptor = DMA8_GotNxtDesc;
     `DMA_CHANNEL_NINE:         gotNextDescriptor = DMA9_GotNxtDesc;
     `DMA_CHANNEL_TEN:          gotNextDescriptor = DMA10_GotNxtDesc;
     `DMA_CHANNEL_ELEVEN:       gotNextDescriptor = DMA11_GotNxtDesc;
     `DMA_CHANNEL_TWELVE:       gotNextDescriptor = DMA12_GotNxtDesc;
     `DMA_CHANNEL_THIRTEEN:     gotNextDescriptor = DMA13_GotNxtDesc;
     `DMA_CHANNEL_FOURTEEN:     gotNextDescriptor = DMA14_GotNxtDesc;
     `DMA_CHANNEL_FIFTEEN:      gotNextDescriptor = DMA15_GotNxtDesc;
     `DMA_CHANNEL_SIXTEEN:      gotNextDescriptor = DMA16_GotNxtDesc;
     `DMA_CHANNEL_SEVENTEEN:    gotNextDescriptor = DMA17_GotNxtDesc;
     `DMA_CHANNEL_EIGHTEEN:     gotNextDescriptor = DMA18_GotNxtDesc;
     `DMA_CHANNEL_NINETEEN:     gotNextDescriptor = DMA19_GotNxtDesc;
     `DMA_CHANNEL_TWENTY:       gotNextDescriptor = DMA20_GotNxtDesc;
     `DMA_CHANNEL_TWENTYONE:    gotNextDescriptor = DMA21_GotNxtDesc;
     `DMA_CHANNEL_TWENTYTWO:    gotNextDescriptor = DMA22_GotNxtDesc;
     `DMA_CHANNEL_TWENTYTHREE:  gotNextDescriptor = DMA23_GotNxtDesc;
           default: gotNextDescriptor = 1'b0;
    endcase

/*--------------------------------------------------------------*/
// DRR State Update
// Make sure that packetbytecount works when we abort the data request
// when anchor fails; 
/*--------------------------------------------------------------*/
always @(posedge SysClk)
  if (!Reset_L) DRR_PacketDone <= #`SD 1'b0;
  else          DRR_PacketDone <= #`SD drrPacketDone;

always @(posedge SysClk)
  if (!Reset_L)            PacketByteCount <= #`SD 16'h0;
  else if (Anchor_Done)    PacketByteCount <= #`SD PacketByteCount 
                                                   +
                                                   {3'h0, Anchor_Length};
  else if (DRR_PacketDone) PacketByteCount <= #`SD 16'h0;

/*--------------------------------------------------------------*/
// Set Get Next Descriptor Logic
/*--------------------------------------------------------------*/
assign SetGetNextDescDMA0  = currentDMAChannel[0] & setGetNextDescriptor;
assign SetGetNextDescDMA1  = currentDMAChannel[1] & setGetNextDescriptor;
assign SetGetNextDescDMA2  = currentDMAChannel[2] & setGetNextDescriptor;
assign SetGetNextDescDMA3  = currentDMAChannel[3] & setGetNextDescriptor;
assign SetGetNextDescDMA4  = currentDMAChannel[4] & setGetNextDescriptor;
assign SetGetNextDescDMA5  = currentDMAChannel[5] & setGetNextDescriptor;
assign SetGetNextDescDMA6  = currentDMAChannel[6] & setGetNextDescriptor;
assign SetGetNextDescDMA7  = currentDMAChannel[7] & setGetNextDescriptor;
assign SetGetNextDescDMA8  = currentDMAChannel[8] & setGetNextDescriptor;
assign SetGetNextDescDMA9  = currentDMAChannel[9] & setGetNextDescriptor;
assign SetGetNextDescDMA10 = currentDMAChannel[10] & setGetNextDescriptor;
assign SetGetNextDescDMA11 = currentDMAChannel[11] & setGetNextDescriptor;
assign SetGetNextDescDMA12 = currentDMAChannel[12] & setGetNextDescriptor;
assign SetGetNextDescDMA13 = currentDMAChannel[13] & setGetNextDescriptor;
assign SetGetNextDescDMA14 = currentDMAChannel[14] & setGetNextDescriptor;
assign SetGetNextDescDMA15 = currentDMAChannel[15] & setGetNextDescriptor;
assign SetGetNextDescDMA16 = currentDMAChannel[16] & setGetNextDescriptor;
assign SetGetNextDescDMA17 = currentDMAChannel[17] & setGetNextDescriptor;
assign SetGetNextDescDMA18 = currentDMAChannel[18] & setGetNextDescriptor;
assign SetGetNextDescDMA19 = currentDMAChannel[19] & setGetNextDescriptor;
assign SetGetNextDescDMA20 = currentDMAChannel[20] & setGetNextDescriptor;
assign SetGetNextDescDMA21 = currentDMAChannel[21] & setGetNextDescriptor;
assign SetGetNextDescDMA22 = currentDMAChannel[22] & setGetNextDescriptor;
assign SetGetNextDescDMA23 = currentDMAChannel[23] & setGetNextDescriptor;

/*--------------------------------------------------------------*/
// Descriptor Gather logic
/*--------------------------------------------------------------*/
always @(posedge SysClk)
  if (!Reset_L)               descriptorList <= #`SD 4'h0;
  else if (ldDescList)        descriptorList <= #`SD anchorDescList;
  else if (decrementDescList) descriptorList <= #`SD descriptorList - 4'h1;

assign decrementDescList = ((descriptorList != 4'h0) && portRequestDone);
assign nullDescriptor    = (descriptorList == 4'h0);
assign singleDescriptor  = (descriptorList == 4'h1);
assign multiDescriptor   = (descriptorList >= 4'h2);

/*--------------------------------------------------------------*/
// Packet Size Error Logic
/*--------------------------------------------------------------*/
assign setPacketSizeErr = enableSizeCheck
                           ? (pktSizeCheck + {3'h0, anchorLengthD1}) > 16'd9600
                           : 1'b0;

always @(posedge SysClk)
  if (!Reset_L)                enableSizeCheck <= #`SD 1'b0;
  else if (setEnableSizeCheck) enableSizeCheck <= #`SD 1'b1;
  else if (anchorRequest)      enableSizeCheck <= #`SD 1'b0; 
  else if (clrEnableSizeCheck) enableSizeCheck <= #`SD 1'b0; 

always @(posedge SysClk)
  if (!Reset_L) anchorLengthD1 <= #`SD 13'h0;
  else          anchorLengthD1 <= #`SD anchorLength;

always @(posedge SysClk)
  if (!Reset_L)           pktSizeCheck <= #`SD 16'h0;
  else if (anchorRequest) pktSizeCheck <= #`SD pktSizeCheck 
                                               +
                                               {3'h0, anchorLengthD1};
  else if (DRR_PacketDone)    pktSizeCheck <= #`SD 16'b0;

always @(posedge SysClk)
  if (!Reset_L)              Pkt_Size_Err <= #`SD 1'b0;
  else if (setPacketSizeErr) Pkt_Size_Err <= #`SD 1'b1;
  else if (DRR_PacketDone)   Pkt_Size_Err <= #`SD 1'b0;

always @(posedge SysClk)
  if (!Reset_L)              DMA_Pkt_Size_Err <= #`SD 24'h0;
  else if (setPacketSizeErr) DMA_Pkt_Size_Err <= #`SD currentDMAChannel;
  else if (DRR_PacketDone)   DMA_Pkt_Size_Err <= #`SD 24'h0;

always @(posedge SysClk)
  if (!Reset_L)              Pkt_Size_Err_Addr <= #`SD 44'h0;
  else if (setPacketSizeErr) Pkt_Size_Err_Addr <= #`SD anchorAddress;
  else if (DRR_PacketDone)   Pkt_Size_Err_Addr <= #`SD 44'h0;

/*--------------------------------------------------------------*/
// Port Select, Data PortReq & Data Write State Vector
/*--------------------------------------------------------------*/
always @(posedge SysClk)
  if (!Reset_L) DataPortReq_State <= #`SD PORT_REQUEST_IDLE;
  else          DataPortReq_State <= #`SD nextPortReqState;

/*--------------------------------------------------------------*/
// Data PortReq State Machine
/*--------------------------------------------------------------*/
function [3:0] PortReqDefaults;
input [3:0] currentState;
  begin
    PortReqDefaults = currentState;
    anchorRequest = 1'b0;
    setPortRequest = 1'b0;
    drrPacketDone = 1'b0;
    ldDescList = 1'b0;
    setGetNextDescriptor = 1'b0;
    setEnableSizeCheck = 1'b0;
    clrEnableSizeCheck = 1'b0;
  end
endfunction


always @(/*AUTOSENSE*/DataPortReq_State or Txc_Enabled
	 or Port_Enabled or DRR_Arb_Valid
         or Anchor_Done or portRequestDone
         or gotNextDescriptor or multiDescriptor or nullDescriptor
         or setPacketSizeErr
         or sopBitNotSet or eofListBitSet or errorBitSet
	)

      case(DataPortReq_State) // synopsys full_case parallel_case
                            /* 0in < case -full -parallel */
        PORT_REQUEST_IDLE:
          begin
            nextPortReqState = PortReqDefaults(DataPortReq_State);

            if (Txc_Enabled) 
              begin
                if (Port_Enabled) 
                  begin
                    if (DRR_Arb_Valid) 
                      nextPortReqState = CHECK_FOR_DESCRIPTOR;
                  end
              end
          end

        CHECK_FOR_DESCRIPTOR:
          begin
            nextPortReqState = PortReqDefaults(DataPortReq_State);

            if (errorBitSet)
              nextPortReqState = ERROR_STATE;
            else if (gotNextDescriptor)
              begin
                setEnableSizeCheck = 1'b1;
                nextPortReqState = REQ_ANCHOR;
              end
          end

        REQ_ANCHOR:
          begin
            nextPortReqState = PortReqDefaults(DataPortReq_State);

            if (setPacketSizeErr | eofListBitSet | errorBitSet | sopBitNotSet)
              begin
                clrEnableSizeCheck = 1'b1;
                nextPortReqState = ERROR_STATE;
              end
            else
              begin
                anchorRequest = 1'b1;
                ldDescList = 1'b1;
                nextPortReqState = WAIT_FOR_ANCHOR;
              end
          end

        WAIT_FOR_ANCHOR:
          begin
            nextPortReqState = PortReqDefaults(DataPortReq_State);
            if (Anchor_Done)
              nextPortReqState =  PORT_REQUEST;
          end

        PORT_REQUEST:
          begin
            nextPortReqState = PortReqDefaults(DataPortReq_State);
            setPortRequest = 1'b1;

            if (!nullDescriptor)
              setGetNextDescriptor = 1'b1;

            nextPortReqState = WAIT_FOR_REQ_ACCEPT;
          end

        WAIT_FOR_REQ_ACCEPT:
          begin
            nextPortReqState = PortReqDefaults(DataPortReq_State);

            if (portRequestDone) 
              begin
              if (multiDescriptor)
                nextPortReqState = WAIT_FOR_NEXT_DESC;
              else
                begin
                  drrPacketDone = 1'b1;
                  nextPortReqState = WAIT_FOR_DRR_UPDATE;
                end
              end
          end

        WAIT_FOR_NEXT_DESC:
          begin
            nextPortReqState = PortReqDefaults(DataPortReq_State);

            if (errorBitSet)
              nextPortReqState = ERROR_STATE;
            else if (gotNextDescriptor)
              begin
                setEnableSizeCheck = 1'b1;
                nextPortReqState =  CHECK_PACKET_SIZE;
              end
          end

        CHECK_PACKET_SIZE:
          begin
            nextPortReqState = PortReqDefaults(DataPortReq_State);

            if (setPacketSizeErr | eofListBitSet | errorBitSet)
              begin
                clrEnableSizeCheck = 1'b1;
                nextPortReqState = ERROR_STATE;
              end
            else
              begin
                anchorRequest = 1'b1;
                nextPortReqState = WAIT_FOR_ANCHOR;
              end
          end

        WAIT_FOR_DRR_UPDATE:
          begin
            nextPortReqState = PortReqDefaults(DataPortReq_State);

            if (!DRR_Arb_Valid) 
              nextPortReqState = PORT_REQUEST_IDLE;
          end

        ERROR_STATE:
          begin
            nextPortReqState = PortReqDefaults(DataPortReq_State);

            if (errorBitSet) 
              begin
                drrPacketDone = 1'b1;
                nextPortReqState = WAIT_FOR_DRR_UPDATE;
              end
          end


      endcase

endmodule
