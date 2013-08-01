// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_packetEngine.v
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
 *  niu_txc_packetEngine.v
 *
 *  NIU Txc Packet Engine    (Fifo Size is abstracted out)
 *
 *  Orignal Author   (s):   Rahoul Puri
 *  Modifier   (s):
 *  Project   (s):          Neptune
 *
 *  Copyright    (c) 2004   Sun Microsystems, Inc.
 *
 *  All Rights Reserved.
 *
 *  This verilog model is the confidential and proprietary property of
 *  Sun Microsystems, Inc., and the possession or use of this model
 *  requires a written license from Sun Microsystems, Inc.
 *
 **********************************************************************/

`include "timescale.v"

module niu_txc_packetEngine    (
        SysClk,                // System Clock
        Reset_L,               // Reset_L
        Txc_Enabled,           // NTx Enable
        PortIndentifier,
        EnableGMACMode,        // Enable GMAC mode only
        MAC_Enabled,
        FlushEngine,           // Flush Engine State
        PacketAssyDead,
        ReOrder_Error,

        MAC_Req,               // Request from the MAC to OPP
        MAC_Ack,               // Acknowledge Signal to the MAC from OPP
        MAC_Tag,               // End of Packet and Status Word Indicator
        MAC_Status,            // Abort Signal from OPP to Xmac 
        MAC_Abort,             // Abort Signal from OPP to Xmac 
        MAC_Data,              // 8 Byte Wide Data Bus from the OPP to MAC

        WrPacketStuffed,
        WrPacketRequested,
        WrPacketXmitted,
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
        PktErrAbortCount,
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

        ClearStatistics,
        PacketsStuffed,
        PacketsTransmitted,
        BytesTransmitted,

        Pkt_Size_Err,
        DMA_Pkt_Size_Err,
        Pkt_Size_Err_Addr,
        Nack_Pkt_Rd,
        DMA_Nack_Pkt_Rd,
        Nack_Pkt_Rd_Addr,

        DMA0_Active,
        DMA0_EofList,
        DMA0_Error,
        DMA0_CacheReady,
        DMA0_Partial,
        DMA0_Reset_Scheduled,
        DMA0_GotNxtDesc,
        DMA0_Mark,
        DMA0_SOP,
        DMA0_Func_Num,
        DMA0_DescList,
        DMA0_Length,
        DMA0_PageHandle,
        DMA0_Address,
        DMA0_Inc_Head,
        DMA0_Reset_Done,
        DMA0_Mark_Bit,
        DMA0_Inc_Pkt_Cnt,
        SetGetNextDescDMA0,
        DMA1_Active,
        DMA1_EofList,
        DMA1_Error,
        DMA1_CacheReady,
        DMA1_Partial,
        DMA1_Reset_Scheduled,
        DMA1_GotNxtDesc,
        DMA1_Mark,
        DMA1_SOP,
        DMA1_Func_Num,
        DMA1_DescList,
        DMA1_Length,
        DMA1_PageHandle,
        DMA1_Address,
        DMA1_Inc_Head,
        DMA1_Reset_Done,
        DMA1_Mark_Bit,
        DMA1_Inc_Pkt_Cnt,
        SetGetNextDescDMA1,
        DMA2_Active,
        DMA2_EofList,
        DMA2_Error,
        DMA2_CacheReady,
        DMA2_Partial,
        DMA2_Reset_Scheduled,
        DMA2_GotNxtDesc,
        DMA2_Mark,
        DMA2_SOP,
        DMA2_Func_Num,
        DMA2_DescList,
        DMA2_Length,
        DMA2_PageHandle,
        DMA2_Address,
        DMA2_Inc_Head,
        DMA2_Reset_Done,
        DMA2_Mark_Bit,
        DMA2_Inc_Pkt_Cnt,
        SetGetNextDescDMA2,
        DMA3_Active,
        DMA3_EofList,
        DMA3_Error,
        DMA3_CacheReady,
        DMA3_Partial,
        DMA3_Reset_Scheduled,
        DMA3_GotNxtDesc,
        DMA3_Mark,
        DMA3_SOP,
        DMA3_Func_Num,
        DMA3_DescList,
        DMA3_Length,
        DMA3_PageHandle,
        DMA3_Address,
        DMA3_Inc_Head,
        DMA3_Reset_Done,
        DMA3_Mark_Bit,
        DMA3_Inc_Pkt_Cnt,
        SetGetNextDescDMA3,
        DMA4_Active,
        DMA4_EofList,
        DMA4_Error,
        DMA4_CacheReady,
        DMA4_Partial,
        DMA4_Reset_Scheduled,
        DMA4_GotNxtDesc,
        DMA4_Mark,
        DMA4_SOP,
        DMA4_Func_Num,
        DMA4_DescList,
        DMA4_Length,
        DMA4_PageHandle,
        DMA4_Address,
        DMA4_Inc_Head,
        DMA4_Reset_Done,
        DMA4_Mark_Bit,
        DMA4_Inc_Pkt_Cnt,
        SetGetNextDescDMA4,
        DMA5_Active,
        DMA5_EofList,
        DMA5_Error,
        DMA5_CacheReady,
        DMA5_Partial,
        DMA5_Reset_Scheduled,
        DMA5_GotNxtDesc,
        DMA5_Mark,
        DMA5_SOP,
        DMA5_Func_Num,
        DMA5_DescList,
        DMA5_Length,
        DMA5_PageHandle,
        DMA5_Address,
        DMA5_Inc_Head,
        DMA5_Reset_Done,
        DMA5_Mark_Bit,
        DMA5_Inc_Pkt_Cnt,
        SetGetNextDescDMA5,
        DMA6_Active,
        DMA6_EofList,
        DMA6_Error,
        DMA6_CacheReady,
        DMA6_Partial,
        DMA6_Reset_Scheduled,
        DMA6_GotNxtDesc,
        DMA6_Mark,
        DMA6_SOP,
        DMA6_Func_Num,
        DMA6_DescList,
        DMA6_Length,
        DMA6_PageHandle,
        DMA6_Address,
        DMA6_Inc_Head,
        DMA6_Reset_Done,
        DMA6_Mark_Bit,
        DMA6_Inc_Pkt_Cnt,
        SetGetNextDescDMA6,
        DMA7_Active,
        DMA7_EofList,
        DMA7_Error,
        DMA7_CacheReady,
        DMA7_Partial,
        DMA7_Reset_Scheduled,
        DMA7_GotNxtDesc,
        DMA7_Mark,
        DMA7_SOP,
        DMA7_Func_Num,
        DMA7_DescList,
        DMA7_Length,
        DMA7_PageHandle,
        DMA7_Address,
        DMA7_Inc_Head,
        DMA7_Reset_Done,
        DMA7_Mark_Bit,
        DMA7_Inc_Pkt_Cnt,
        SetGetNextDescDMA7,
        DMA8_Active,
        DMA8_EofList,
        DMA8_Error,
        DMA8_CacheReady,
        DMA8_Partial,
        DMA8_Reset_Scheduled,
        DMA8_GotNxtDesc,
        DMA8_Mark,
        DMA8_SOP,
        DMA8_Func_Num,
        DMA8_DescList,
        DMA8_Length,
        DMA8_PageHandle,
        DMA8_Address,
        DMA8_Inc_Head,
        DMA8_Reset_Done,
        DMA8_Mark_Bit,
        DMA8_Inc_Pkt_Cnt,
        SetGetNextDescDMA8,
        DMA9_Active,
        DMA9_EofList,
        DMA9_Error,
        DMA9_CacheReady,
        DMA9_Partial,
        DMA9_Reset_Scheduled,
        DMA9_GotNxtDesc,
        DMA9_Mark,
        DMA9_SOP,
        DMA9_Func_Num,
        DMA9_DescList,
        DMA9_Length,
        DMA9_PageHandle,
        DMA9_Address,
        DMA9_Inc_Head,
        DMA9_Reset_Done,
        DMA9_Mark_Bit,
        DMA9_Inc_Pkt_Cnt,
        SetGetNextDescDMA9,
        DMA10_Active,
        DMA10_EofList,
        DMA10_Error,
        DMA10_CacheReady,
        DMA10_Partial,
        DMA10_Reset_Scheduled,
        DMA10_GotNxtDesc,
        DMA10_Mark,
        DMA10_SOP,
        DMA10_Func_Num,
        DMA10_DescList,
        DMA10_Length,
        DMA10_PageHandle,
        DMA10_Address,
        DMA10_Inc_Head,
        DMA10_Reset_Done,
        DMA10_Mark_Bit,
        DMA10_Inc_Pkt_Cnt,
        SetGetNextDescDMA10,
        DMA11_Active,
        DMA11_EofList,
        DMA11_Error,
        DMA11_CacheReady,
        DMA11_Partial,
        DMA11_Reset_Scheduled,
        DMA11_GotNxtDesc,
        DMA11_Mark,
        DMA11_SOP,
        DMA11_Func_Num,
        DMA11_DescList,
        DMA11_Length,
        DMA11_PageHandle,
        DMA11_Address,
        DMA11_Inc_Head,
        DMA11_Reset_Done,
        DMA11_Mark_Bit,
        DMA11_Inc_Pkt_Cnt,
        SetGetNextDescDMA11,
        DMA12_Active,
        DMA12_EofList,
        DMA12_Error,
        DMA12_CacheReady,
        DMA12_Partial,
        DMA12_Reset_Scheduled,
        DMA12_GotNxtDesc,
        DMA12_Mark,
        DMA12_SOP,
        DMA12_Func_Num,
        DMA12_DescList,
        DMA12_Length,
        DMA12_PageHandle,
        DMA12_Address,
        DMA12_Inc_Head,
        DMA12_Reset_Done,
        DMA12_Mark_Bit,
        DMA12_Inc_Pkt_Cnt,
        SetGetNextDescDMA12,
        DMA13_Active,
        DMA13_EofList,
        DMA13_Error,
        DMA13_CacheReady,
        DMA13_Partial,
        DMA13_Reset_Scheduled,
        DMA13_GotNxtDesc,
        DMA13_Mark,
        DMA13_SOP,
        DMA13_Func_Num,
        DMA13_DescList,
        DMA13_Length,
        DMA13_PageHandle,
        DMA13_Address,
        DMA13_Inc_Head,
        DMA13_Reset_Done,
        DMA13_Mark_Bit,
        DMA13_Inc_Pkt_Cnt,
        SetGetNextDescDMA13,
        DMA14_Active,
        DMA14_EofList,
        DMA14_Error,
        DMA14_CacheReady,
        DMA14_Partial,
        DMA14_Reset_Scheduled,
        DMA14_GotNxtDesc,
        DMA14_Mark,
        DMA14_SOP,
        DMA14_Func_Num,
        DMA14_DescList,
        DMA14_Length,
        DMA14_PageHandle,
        DMA14_Address,
        DMA14_Inc_Head,
        DMA14_Reset_Done,
        DMA14_Mark_Bit,
        DMA14_Inc_Pkt_Cnt,
        SetGetNextDescDMA14,
        DMA15_Active,
        DMA15_EofList,
        DMA15_Error,
        DMA15_CacheReady,
        DMA15_Partial,
        DMA15_Reset_Scheduled,
        DMA15_GotNxtDesc,
        DMA15_Mark,
        DMA15_SOP,
        DMA15_Func_Num,
        DMA15_DescList,
        DMA15_Length,
        DMA15_PageHandle,
        DMA15_Address,
        DMA15_Inc_Head,
        DMA15_Reset_Done,
        DMA15_Mark_Bit,
        DMA15_Inc_Pkt_Cnt,
        SetGetNextDescDMA15,
        DMA16_Active,
        DMA16_EofList,
        DMA16_Error,
        DMA16_CacheReady,
        DMA16_Partial,
        DMA16_Reset_Scheduled,
        DMA16_GotNxtDesc,
        DMA16_Mark,
        DMA16_SOP,
        DMA16_Func_Num,
        DMA16_DescList,
        DMA16_Length,
        DMA16_PageHandle,
        DMA16_Address,
        DMA16_Inc_Head,
        DMA16_Reset_Done,
        DMA16_Mark_Bit,
        DMA16_Inc_Pkt_Cnt,
        SetGetNextDescDMA16,
        DMA17_Active,
        DMA17_EofList,
        DMA17_Error,
        DMA17_CacheReady,
        DMA17_Partial,
        DMA17_Reset_Scheduled,
        DMA17_GotNxtDesc,
        DMA17_Mark,
        DMA17_SOP,
        DMA17_Func_Num,
        DMA17_DescList,
        DMA17_Length,
        DMA17_PageHandle,
        DMA17_Address,
        DMA17_Inc_Head,
        DMA17_Reset_Done,
        DMA17_Mark_Bit,
        DMA17_Inc_Pkt_Cnt,
        SetGetNextDescDMA17,
        DMA18_Active,
        DMA18_EofList,
        DMA18_Error,
        DMA18_CacheReady,
        DMA18_Partial,
        DMA18_Reset_Scheduled,
        DMA18_GotNxtDesc,
        DMA18_Mark,
        DMA18_SOP,
        DMA18_Func_Num,
        DMA18_DescList,
        DMA18_Length,
        DMA18_PageHandle,
        DMA18_Address,
        DMA18_Inc_Head,
        DMA18_Reset_Done,
        DMA18_Mark_Bit,
        DMA18_Inc_Pkt_Cnt,
        SetGetNextDescDMA18,
        DMA19_Active,
        DMA19_EofList,
        DMA19_Error,
        DMA19_CacheReady,
        DMA19_Partial,
        DMA19_Reset_Scheduled,
        DMA19_GotNxtDesc,
        DMA19_Mark,
        DMA19_SOP,
        DMA19_Func_Num,
        DMA19_DescList,
        DMA19_Length,
        DMA19_PageHandle,
        DMA19_Address,
        DMA19_Inc_Head,
        DMA19_Reset_Done,
        DMA19_Mark_Bit,
        DMA19_Inc_Pkt_Cnt,
        SetGetNextDescDMA19,
        DMA20_Active,
        DMA20_EofList,
        DMA20_Error,
        DMA20_CacheReady,
        DMA20_Partial,
        DMA20_Reset_Scheduled,
        DMA20_GotNxtDesc,
        DMA20_Mark,
        DMA20_SOP,
        DMA20_Func_Num,
        DMA20_DescList,
        DMA20_Length,
        DMA20_PageHandle,
        DMA20_Address,
        DMA20_Inc_Head,
        DMA20_Reset_Done,
        DMA20_Mark_Bit,
        DMA20_Inc_Pkt_Cnt,
        SetGetNextDescDMA20,
        DMA21_Active,
        DMA21_EofList,
        DMA21_Error,
        DMA21_CacheReady,
        DMA21_Partial,
        DMA21_Reset_Scheduled,
        DMA21_GotNxtDesc,
        DMA21_Mark,
        DMA21_SOP,
        DMA21_Func_Num,
        DMA21_DescList,
        DMA21_Length,
        DMA21_PageHandle,
        DMA21_Address,
        DMA21_Inc_Head,
        DMA21_Reset_Done,
        DMA21_Mark_Bit,
        DMA21_Inc_Pkt_Cnt,
        SetGetNextDescDMA21,
        DMA22_Active,
        DMA22_EofList,
        DMA22_Error,
        DMA22_CacheReady,
        DMA22_Partial,
        DMA22_Reset_Scheduled,
        DMA22_GotNxtDesc,
        DMA22_Mark,
        DMA22_SOP,
        DMA22_Func_Num,
        DMA22_DescList,
        DMA22_Length,
        DMA22_PageHandle,
        DMA22_Address,
        DMA22_Inc_Head,
        DMA22_Reset_Done,
        DMA22_Mark_Bit,
        DMA22_Inc_Pkt_Cnt,
        SetGetNextDescDMA22,
        DMA23_Active,
        DMA23_EofList,
        DMA23_Error,
        DMA23_CacheReady,
        DMA23_Partial,
        DMA23_Reset_Scheduled,
        DMA23_GotNxtDesc,
        DMA23_Mark,
        DMA23_SOP,
        DMA23_Func_Num,
        DMA23_DescList,
        DMA23_Length,
        DMA23_PageHandle,
        DMA23_Address,
        DMA23_Inc_Head,
        DMA23_Reset_Done,
        DMA23_Mark_Bit,
        DMA23_Inc_Pkt_Cnt,
        SetGetNextDescDMA23,
        DMA0_NewMaxBurst,
        DMA1_NewMaxBurst,
        DMA2_NewMaxBurst,
        DMA3_NewMaxBurst,
        DMA4_NewMaxBurst,
        DMA5_NewMaxBurst,
        DMA6_NewMaxBurst,
        DMA7_NewMaxBurst,
        DMA8_NewMaxBurst,
        DMA9_NewMaxBurst,
        DMA10_NewMaxBurst,
        DMA11_NewMaxBurst,
        DMA12_NewMaxBurst,
        DMA13_NewMaxBurst,
        DMA14_NewMaxBurst,
        DMA15_NewMaxBurst,
        DMA16_NewMaxBurst,
        DMA17_NewMaxBurst,
        DMA18_NewMaxBurst,
        DMA19_NewMaxBurst,
        DMA20_NewMaxBurst,
        DMA21_NewMaxBurst,
        DMA22_NewMaxBurst,
        DMA23_NewMaxBurst,
        DMA0_MaxBurst,
        DMA1_MaxBurst,
        DMA2_MaxBurst,
        DMA3_MaxBurst,
        DMA4_MaxBurst,
        DMA5_MaxBurst,
        DMA6_MaxBurst,
        DMA7_MaxBurst,
        DMA8_MaxBurst,
        DMA9_MaxBurst,
        DMA10_MaxBurst,
        DMA11_MaxBurst,
        DMA12_MaxBurst,
        DMA13_MaxBurst,
        DMA14_MaxBurst,
        DMA15_MaxBurst,
        DMA16_MaxBurst,
        DMA17_MaxBurst,
        DMA18_MaxBurst,
        DMA19_MaxBurst,
        DMA20_MaxBurst,
        DMA21_MaxBurst,
        DMA22_MaxBurst,
        DMA23_MaxBurst,
        MaxReorderNumber,
        Port_DMA_List,
        ClrMaxBurst,
        UpdateDMA,
        UpdateDMALength,
        UpdateDMANumber,

        DMC_TXC_Req_Ack,
        DMC_TXC_Req_TransID,

        Port_Selected,
        Port_Request,
        Port_Request_Func_Num,
        Port_Request_DMA_Num,
        Port_Request_Length,
        Port_Request_Address,

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

        ReOrderFifoDataValid,
        ReOrderUnCorrectError,
        ReOrderEccControl,
        PacketAssyEngineDataIn,
        ReOrderCorruptECCSingle,
        ReOrderCorruptECCDouble,
        ReOrderFifoWrite,
        ReOrderFifoReadStrobe,
        ReOrderWritePtr,
        ReOrderReadPtr,
        ReOrderEngineDataOut,

        StoreForwardUnCorrectError,
        StoreForwardEccControl,
        MacXferEngineDataIn,
        StoreForward_CorruptECCSingle,
        StoreForward_CorruptECCDouble,
        StoreForwardFifoWrite,
        StoreForwardFifoReadStrobe,
        StoreForwardWritePtr,
        StoreForwardReadPtr,
        PacketAssyEngineDataOut,

        LatchActiveDMA,
        ContextActiveList,

        Anchor_State,
        ReOrder_State,
        Pointer_State,
        PacketAssy_State,
        DRR_ArbState,
        Mac_Xfer_State,
        DataPortReq_State,
        Sum_prt_state
       );

`include "txc_defines.h"

// Global signals
input          SysClk;
input          Reset_L;
input          Txc_Enabled;
input  [1:0]   PortIndentifier;
input          EnableGMACMode;
input          FlushEngine;

// Data Error Interface
output         PacketAssyDead;
output         ReOrder_Error;

// Mac Interface
input          MAC_Req;

output         MAC_Ack;
output         MAC_Tag;
output         MAC_Abort;
output [3:0]   MAC_Status;
output [63:0]  MAC_Data;

// ReOrder PIO Control Registers
input          WrPacketStuffed;
input          WrPacketRequested;
input          WrPacketXmitted;
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
output [15:0]  PktErrAbortCount;
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

//TXC Transaction Timeout -> TDMC Interface
output         Pkt_Size_Err;
output [23:0]  DMA_Pkt_Size_Err;
output [43:0]  Pkt_Size_Err_Addr;

output         Nack_Pkt_Rd;
output [23:0]  DMA_Nack_Pkt_Rd;
output [43:0]  Nack_Pkt_Rd_Addr;

//TXC -> TDMC Interface
//DMA0
input          DMA0_Active;
input          DMA0_EofList;
input          DMA0_Error;
input          DMA0_CacheReady;
input          DMA0_Partial;
input          DMA0_Reset_Scheduled;
input          DMA0_GotNxtDesc;
input          DMA0_Mark;
input          DMA0_SOP;
input  [1:0]   DMA0_Func_Num;
input  [3:0]   DMA0_DescList;
input  [12:0]  DMA0_Length;
input  [19:0]  DMA0_PageHandle;
input  [43:0]  DMA0_Address;

output         DMA0_Inc_Head;
output         DMA0_Reset_Done;
output         DMA0_Mark_Bit;
output         DMA0_Inc_Pkt_Cnt;
output         SetGetNextDescDMA0;

//DMA1
input          DMA1_Active;
input          DMA1_EofList;
input          DMA1_Error;
input          DMA1_CacheReady;
input          DMA1_Partial;
input          DMA1_Reset_Scheduled;
input          DMA1_GotNxtDesc;
input          DMA1_Mark;
input          DMA1_SOP;
input  [1:0]   DMA1_Func_Num;
input  [3:0]   DMA1_DescList;
input  [12:0]  DMA1_Length;
input  [19:0]  DMA1_PageHandle;
input  [43:0]  DMA1_Address;

output         DMA1_Inc_Head;
output         DMA1_Reset_Done;
output         DMA1_Mark_Bit;
output         DMA1_Inc_Pkt_Cnt;
output         SetGetNextDescDMA1;

//DMA2
input          DMA2_Active;
input          DMA2_EofList;
input          DMA2_Error;
input          DMA2_CacheReady;
input          DMA2_Partial;
input          DMA2_Reset_Scheduled;
input          DMA2_GotNxtDesc;
input          DMA2_Mark;
input          DMA2_SOP;
input  [1:0]   DMA2_Func_Num;
input  [3:0]   DMA2_DescList;
input  [12:0]  DMA2_Length;
input  [19:0]  DMA2_PageHandle;
input  [43:0]  DMA2_Address;

output         DMA2_Inc_Head;
output         DMA2_Reset_Done;
output         DMA2_Mark_Bit;
output         DMA2_Inc_Pkt_Cnt;
output         SetGetNextDescDMA2;

//DMA3
input          DMA3_Active;
input          DMA3_EofList;
input          DMA3_Error;
input          DMA3_CacheReady;
input          DMA3_Partial;
input          DMA3_Reset_Scheduled;
input          DMA3_GotNxtDesc;
input          DMA3_Mark;
input          DMA3_SOP;
input  [1:0]   DMA3_Func_Num;
input  [3:0]   DMA3_DescList;
input  [12:0]  DMA3_Length;
input  [19:0]  DMA3_PageHandle;
input  [43:0]  DMA3_Address;

output         DMA3_Inc_Head;
output         DMA3_Reset_Done;
output         DMA3_Mark_Bit;
output         DMA3_Inc_Pkt_Cnt;
output         SetGetNextDescDMA3;

//DMA4
input          DMA4_Active;
input          DMA4_EofList;
input          DMA4_Error;
input          DMA4_CacheReady;
input          DMA4_Partial;
input          DMA4_Reset_Scheduled;
input          DMA4_GotNxtDesc;
input          DMA4_Mark;
input          DMA4_SOP;
input  [1:0]   DMA4_Func_Num;
input  [3:0]   DMA4_DescList;
input  [12:0]  DMA4_Length;
input  [19:0]  DMA4_PageHandle;
input  [43:0]  DMA4_Address;

output         DMA4_Inc_Head;
output         DMA4_Reset_Done;
output         DMA4_Mark_Bit;
output         DMA4_Inc_Pkt_Cnt;
output         SetGetNextDescDMA4;

//DMA5
input          DMA5_Active;
input          DMA5_EofList;
input          DMA5_Error;
input          DMA5_CacheReady;
input          DMA5_Partial;
input          DMA5_Reset_Scheduled;
input          DMA5_GotNxtDesc;
input          DMA5_Mark;
input          DMA5_SOP;
input  [1:0]   DMA5_Func_Num;
input  [3:0]   DMA5_DescList;
input  [12:0]  DMA5_Length;
input  [19:0]  DMA5_PageHandle;
input  [43:0]  DMA5_Address;

output         DMA5_Inc_Head;
output         DMA5_Reset_Done;
output         DMA5_Mark_Bit;
output         DMA5_Inc_Pkt_Cnt;
output         SetGetNextDescDMA5;

//DMA6
input          DMA6_Active;
input          DMA6_EofList;
input          DMA6_Error;
input          DMA6_CacheReady;
input          DMA6_Partial;
input          DMA6_Reset_Scheduled;
input          DMA6_GotNxtDesc;
input          DMA6_Mark;
input          DMA6_SOP;
input  [1:0]   DMA6_Func_Num;
input  [3:0]   DMA6_DescList;
input  [12:0]  DMA6_Length;
input  [19:0]  DMA6_PageHandle;
input  [43:0]  DMA6_Address;

output         DMA6_Inc_Head;
output         DMA6_Reset_Done;
output         DMA6_Mark_Bit;
output         DMA6_Inc_Pkt_Cnt;
output         SetGetNextDescDMA6;

//DMA7
input          DMA7_Active;
input          DMA7_EofList;
input          DMA7_Error;
input          DMA7_CacheReady;
input          DMA7_Partial;
input          DMA7_Reset_Scheduled;
input          DMA7_GotNxtDesc;
input          DMA7_Mark;
input          DMA7_SOP;
input  [1:0]   DMA7_Func_Num;
input  [3:0]   DMA7_DescList;
input  [12:0]  DMA7_Length;
input  [19:0]  DMA7_PageHandle;
input  [43:0]  DMA7_Address;

output         DMA7_Inc_Head;
output         DMA7_Reset_Done;
output         DMA7_Mark_Bit;
output         DMA7_Inc_Pkt_Cnt;
output         SetGetNextDescDMA7;

//DMA8
input          DMA8_Active;
input          DMA8_EofList;
input          DMA8_Error;
input          DMA8_CacheReady;
input          DMA8_Partial;
input          DMA8_Reset_Scheduled;
input          DMA8_GotNxtDesc;
input          DMA8_Mark;
input          DMA8_SOP;
input  [1:0]   DMA8_Func_Num;
input  [3:0]   DMA8_DescList;
input  [12:0]  DMA8_Length;
input  [19:0]  DMA8_PageHandle;
input  [43:0]  DMA8_Address;

output         DMA8_Inc_Head;
output         DMA8_Reset_Done;
output         DMA8_Mark_Bit;
output         DMA8_Inc_Pkt_Cnt;
output         SetGetNextDescDMA8;

//DMA9
input          DMA9_Active;
input          DMA9_EofList;
input          DMA9_Error;
input          DMA9_CacheReady;
input          DMA9_Partial;
input          DMA9_Reset_Scheduled;
input          DMA9_GotNxtDesc;
input          DMA9_Mark;
input          DMA9_SOP;
input  [1:0]   DMA9_Func_Num;
input  [3:0]   DMA9_DescList;
input  [12:0]  DMA9_Length;
input  [19:0]  DMA9_PageHandle;
input  [43:0]  DMA9_Address;

output         DMA9_Inc_Head;
output         DMA9_Reset_Done;
output         DMA9_Mark_Bit;
output         DMA9_Inc_Pkt_Cnt;
output         SetGetNextDescDMA9;

//DMA10
input          DMA10_Active;
input          DMA10_EofList;
input          DMA10_Error;
input          DMA10_CacheReady;
input          DMA10_Partial;
input          DMA10_Reset_Scheduled;
input          DMA10_GotNxtDesc;
input          DMA10_Mark;
input          DMA10_SOP;
input  [1:0]   DMA10_Func_Num;
input  [3:0]   DMA10_DescList;
input  [12:0]  DMA10_Length;
input  [19:0]  DMA10_PageHandle;
input  [43:0]  DMA10_Address;

output         DMA10_Inc_Head;
output         DMA10_Reset_Done;
output         DMA10_Mark_Bit;
output         DMA10_Inc_Pkt_Cnt;
output         SetGetNextDescDMA10;

//DMA11
input          DMA11_Active;
input          DMA11_EofList;
input          DMA11_Error;
input          DMA11_CacheReady;
input          DMA11_Partial;
input          DMA11_Reset_Scheduled;
input          DMA11_GotNxtDesc;
input          DMA11_Mark;
input          DMA11_SOP;
input  [1:0]   DMA11_Func_Num;
input  [3:0]   DMA11_DescList;
input  [12:0]  DMA11_Length;
input  [19:0]  DMA11_PageHandle;
input  [43:0]  DMA11_Address;

output         DMA11_Inc_Head;
output         DMA11_Reset_Done;
output         DMA11_Mark_Bit;
output         DMA11_Inc_Pkt_Cnt;
output         SetGetNextDescDMA11;

//DMA12
input          DMA12_Active;
input          DMA12_EofList;
input          DMA12_Error;
input          DMA12_CacheReady;
input          DMA12_Partial;
input          DMA12_Reset_Scheduled;
input          DMA12_GotNxtDesc;
input          DMA12_Mark;
input          DMA12_SOP;
input  [1:0]   DMA12_Func_Num;
input  [3:0]   DMA12_DescList;
input  [12:0]  DMA12_Length;
input  [19:0]  DMA12_PageHandle;
input  [43:0]  DMA12_Address;

output         DMA12_Inc_Head;
output         DMA12_Reset_Done;
output         DMA12_Mark_Bit;
output         DMA12_Inc_Pkt_Cnt;
output         SetGetNextDescDMA12;

//DMA13
input          DMA13_Active;
input          DMA13_EofList;
input          DMA13_Error;
input          DMA13_CacheReady;
input          DMA13_Partial;
input          DMA13_Reset_Scheduled;
input          DMA13_GotNxtDesc;
input          DMA13_Mark;
input          DMA13_SOP;
input  [1:0]   DMA13_Func_Num;
input  [3:0]   DMA13_DescList;
input  [12:0]  DMA13_Length;
input  [19:0]  DMA13_PageHandle;
input  [43:0]  DMA13_Address;

output         DMA13_Inc_Head;
output         DMA13_Reset_Done;
output         DMA13_Mark_Bit;
output         DMA13_Inc_Pkt_Cnt;
output         SetGetNextDescDMA13;

//DMA14
input          DMA14_Active;
input          DMA14_EofList;
input          DMA14_Error;
input          DMA14_CacheReady;
input          DMA14_Partial;
input          DMA14_Reset_Scheduled;
input          DMA14_GotNxtDesc;
input          DMA14_Mark;
input          DMA14_SOP;
input  [1:0]   DMA14_Func_Num;
input  [3:0]   DMA14_DescList;
input  [12:0]  DMA14_Length;
input  [19:0]  DMA14_PageHandle;
input  [43:0]  DMA14_Address;

output         DMA14_Inc_Head;
output         DMA14_Reset_Done;
output         DMA14_Mark_Bit;
output         DMA14_Inc_Pkt_Cnt;
output         SetGetNextDescDMA14;

//DMA15
input          DMA15_Active;
input          DMA15_EofList;
input          DMA15_Error;
input          DMA15_CacheReady;
input          DMA15_Partial;
input          DMA15_Reset_Scheduled;
input          DMA15_GotNxtDesc;
input          DMA15_Mark;
input          DMA15_SOP;
input  [1:0]   DMA15_Func_Num;
input  [3:0]   DMA15_DescList;
input  [12:0]  DMA15_Length;
input  [19:0]  DMA15_PageHandle;
input  [43:0]  DMA15_Address;

output         DMA15_Inc_Head;
output         DMA15_Reset_Done;
output         DMA15_Mark_Bit;
output         DMA15_Inc_Pkt_Cnt;
output         SetGetNextDescDMA15;

//DMA16
input          DMA16_Active;
input          DMA16_EofList;
input          DMA16_Error;
input          DMA16_CacheReady;
input          DMA16_Partial;
input          DMA16_Reset_Scheduled;
input          DMA16_GotNxtDesc;
input          DMA16_Mark;
input          DMA16_SOP;
input  [1:0]   DMA16_Func_Num;
input  [3:0]   DMA16_DescList;
input  [12:0]  DMA16_Length;
input  [19:0]  DMA16_PageHandle;
input  [43:0]  DMA16_Address;

output         DMA16_Inc_Head;
output         DMA16_Reset_Done;
output         DMA16_Mark_Bit;
output         DMA16_Inc_Pkt_Cnt;
output         SetGetNextDescDMA16;

//DMA17
input          DMA17_Active;
input          DMA17_EofList;
input          DMA17_Error;
input          DMA17_CacheReady;
input          DMA17_Partial;
input          DMA17_Reset_Scheduled;
input          DMA17_GotNxtDesc;
input          DMA17_Mark;
input          DMA17_SOP;
input  [1:0]   DMA17_Func_Num;
input  [3:0]   DMA17_DescList;
input  [12:0]  DMA17_Length;
input  [19:0]  DMA17_PageHandle;
input  [43:0]  DMA17_Address;

output         DMA17_Inc_Head;
output         DMA17_Reset_Done;
output         DMA17_Mark_Bit;
output         DMA17_Inc_Pkt_Cnt;
output         SetGetNextDescDMA17;

//DMA18
input          DMA18_Active;
input          DMA18_EofList;
input          DMA18_Error;
input          DMA18_CacheReady;
input          DMA18_Partial;
input          DMA18_Reset_Scheduled;
input          DMA18_GotNxtDesc;
input          DMA18_Mark;
input          DMA18_SOP;
input  [1:0]   DMA18_Func_Num;
input  [3:0]   DMA18_DescList;
input  [12:0]  DMA18_Length;
input  [19:0]  DMA18_PageHandle;
input  [43:0]  DMA18_Address;

output         DMA18_Inc_Head;
output         DMA18_Reset_Done;
output         DMA18_Mark_Bit;
output         DMA18_Inc_Pkt_Cnt;
output         SetGetNextDescDMA18;

//DMA19
input          DMA19_Active;
input          DMA19_EofList;
input          DMA19_Error;
input          DMA19_CacheReady;
input          DMA19_Partial;
input          DMA19_Reset_Scheduled;
input          DMA19_GotNxtDesc;
input          DMA19_Mark;
input          DMA19_SOP;
input  [1:0]   DMA19_Func_Num;
input  [3:0]   DMA19_DescList;
input  [12:0]  DMA19_Length;
input  [19:0]  DMA19_PageHandle;
input  [43:0]  DMA19_Address;

output         DMA19_Inc_Head;
output         DMA19_Reset_Done;
output         DMA19_Mark_Bit;
output         DMA19_Inc_Pkt_Cnt;
output         SetGetNextDescDMA19;

//DMA20
input          DMA20_Active;
input          DMA20_EofList;
input          DMA20_Error;
input          DMA20_CacheReady;
input          DMA20_Partial;
input          DMA20_Reset_Scheduled;
input          DMA20_GotNxtDesc;
input          DMA20_Mark;
input          DMA20_SOP;
input  [1:0]   DMA20_Func_Num;
input  [3:0]   DMA20_DescList;
input  [12:0]  DMA20_Length;
input  [19:0]  DMA20_PageHandle;
input  [43:0]  DMA20_Address;

output         DMA20_Inc_Head;
output         DMA20_Reset_Done;
output         DMA20_Mark_Bit;
output         DMA20_Inc_Pkt_Cnt;
output         SetGetNextDescDMA20;

//DMA21
input          DMA21_Active;
input          DMA21_EofList;
input          DMA21_Error;
input          DMA21_CacheReady;
input          DMA21_Partial;
input          DMA21_Reset_Scheduled;
input          DMA21_GotNxtDesc;
input          DMA21_Mark;
input          DMA21_SOP;
input  [1:0]   DMA21_Func_Num;
input  [3:0]   DMA21_DescList;
input  [12:0]  DMA21_Length;
input  [19:0]  DMA21_PageHandle;
input  [43:0]  DMA21_Address;

output         DMA21_Inc_Head;
output         DMA21_Reset_Done;
output         DMA21_Mark_Bit;
output         DMA21_Inc_Pkt_Cnt;
output         SetGetNextDescDMA21;

//DMA22
input          DMA22_Active;
input          DMA22_EofList;
input          DMA22_Error;
input          DMA22_CacheReady;
input          DMA22_Partial;
input          DMA22_Reset_Scheduled;
input          DMA22_GotNxtDesc;
input          DMA22_Mark;
input          DMA22_SOP;
input  [1:0]   DMA22_Func_Num;
input  [3:0]   DMA22_DescList;
input  [12:0]  DMA22_Length;
input  [19:0]  DMA22_PageHandle;
input  [43:0]  DMA22_Address;

output         DMA22_Inc_Head;
output         DMA22_Reset_Done;
output         DMA22_Mark_Bit;
output         DMA22_Inc_Pkt_Cnt;
output         SetGetNextDescDMA22;

//DMA23
input          DMA23_Active;
input          DMA23_EofList;
input          DMA23_Error;
input          DMA23_CacheReady;
input          DMA23_Partial;
input          DMA23_Reset_Scheduled;
input          DMA23_GotNxtDesc;
input          DMA23_Mark;
input          DMA23_SOP;
input  [1:0]   DMA23_Func_Num;
input  [3:0]   DMA23_DescList;
input  [12:0]  DMA23_Length;
input  [19:0]  DMA23_PageHandle;
input  [43:0]  DMA23_Address;

output         DMA23_Inc_Head;
output         DMA23_Reset_Done;
output         DMA23_Mark_Bit;
output         DMA23_Inc_Pkt_Cnt;
output         SetGetNextDescDMA23;

// Diag Control Regs Interface
input          MAC_Enabled;
input          ClearStatistics;

output [15:0]  PacketsStuffed;
output [15:0]  PacketsTransmitted;
output [15:0]  BytesTransmitted;

// DMA Control Registers
input          DMA0_NewMaxBurst;
input          DMA1_NewMaxBurst;
input          DMA2_NewMaxBurst;
input          DMA3_NewMaxBurst;
input          DMA4_NewMaxBurst;
input          DMA5_NewMaxBurst;
input          DMA6_NewMaxBurst;
input          DMA7_NewMaxBurst;
input          DMA8_NewMaxBurst;
input          DMA9_NewMaxBurst;
input          DMA10_NewMaxBurst;
input          DMA11_NewMaxBurst;
input          DMA12_NewMaxBurst;
input          DMA13_NewMaxBurst;
input          DMA14_NewMaxBurst;
input          DMA15_NewMaxBurst;
input          DMA16_NewMaxBurst;
input          DMA17_NewMaxBurst;
input          DMA18_NewMaxBurst;
input          DMA19_NewMaxBurst;
input          DMA20_NewMaxBurst;
input          DMA21_NewMaxBurst;
input          DMA22_NewMaxBurst;
input          DMA23_NewMaxBurst;
input  [19:0]  DMA0_MaxBurst;
input  [19:0]  DMA1_MaxBurst;
input  [19:0]  DMA2_MaxBurst;
input  [19:0]  DMA3_MaxBurst;
input  [19:0]  DMA4_MaxBurst;
input  [19:0]  DMA5_MaxBurst;
input  [19:0]  DMA6_MaxBurst;
input  [19:0]  DMA7_MaxBurst;
input  [19:0]  DMA8_MaxBurst;
input  [19:0]  DMA9_MaxBurst;
input  [19:0]  DMA10_MaxBurst;
input  [19:0]  DMA11_MaxBurst;
input  [19:0]  DMA12_MaxBurst;
input  [19:0]  DMA13_MaxBurst;
input  [19:0]  DMA14_MaxBurst;
input  [19:0]  DMA15_MaxBurst;
input  [19:0]  DMA16_MaxBurst;
input  [19:0]  DMA17_MaxBurst;
input  [19:0]  DMA18_MaxBurst;
input  [19:0]  DMA19_MaxBurst;
input  [19:0]  DMA20_MaxBurst;
input  [19:0]  DMA21_MaxBurst;
input  [19:0]  DMA22_MaxBurst;
input  [19:0]  DMA23_MaxBurst;

input  [3:0]   MaxReorderNumber;
input  [23:0]  Port_DMA_List;

output         ClrMaxBurst;
output         UpdateDMA;
output [13:0]  UpdateDMALength;
output [23:0]  UpdateDMANumber;

// Data Fetch Interface
wire            dRR_PacketDone;
wire    [15:0]  dRR_PacketByteCount;

wire            dRR_Arb_Valid;
wire    [4:0]   dRR_NextDMAChannel;

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

// Re-Order Fifo Interface
input          ReOrderFifoDataValid;
input          ReOrderUnCorrectError;
input  [31:0]  ReOrderEccControl;
input  [135:0] PacketAssyEngineDataIn;

output         ReOrderCorruptECCSingle;
output         ReOrderCorruptECCDouble;
output         ReOrderFifoWrite;
output         ReOrderFifoReadStrobe;
output [9:0]   ReOrderWritePtr;
output [9:0]   ReOrderReadPtr;
output [135:0] ReOrderEngineDataOut;

// Store & Forward Fifo Interface
input          StoreForwardUnCorrectError;
input  [31:0]  StoreForwardEccControl;
input  [135:0] MacXferEngineDataIn;

output         StoreForward_CorruptECCSingle;
output         StoreForward_CorruptECCDouble;
output         StoreForwardFifoWrite;
output         StoreForwardFifoReadStrobe;
output [9:0]   StoreForwardWritePtr;
output [9:0]   StoreForwardReadPtr;
output [135:0] PacketAssyEngineDataOut;

// Debug Block
output         LatchActiveDMA;
output [23:0]  ContextActiveList;

// State Machine
output [3:0]   Anchor_State;
output [3:0]   ReOrder_State;
output [3:0]   Pointer_State;
output [3:0]   PacketAssy_State;
output [3:0]   DRR_ArbState;
output [3:0]   Mac_Xfer_State;
output [3:0]   DataPortReq_State;
output [31:0]  Sum_prt_state;

/*--------------------------------------------------------------*/
// Wires
/*--------------------------------------------------------------*/
wire           anchor_LoadTID;
wire           req_Anchor;
wire           anchor_MarkBit;
wire           anchor_SopBit;
wire           anchor_GatherLast;
wire           anchor_Done;
wire           reOrderFifoRead;
wire           reOrderFifoEmpty;
wire           reOrderFifoAlmostEmpty;
wire           startTCPchecksum;
wire           checksumPacketDone;
wire           checkSumValid;
wire           storeForwardFifoEmpty;
wire           storeForwardFifoRead;
wire   [1:0]   packetType;
wire   [1:0]   layer3Version;
wire   [1:0]   layer3Start;
wire   [3:0]   iPv4IPHeaderLen;
wire   [4:0]   anchor_DMA;
wire   [5:0]   anchor_TransID;
wire   [12:0]  anchor_Length;
wire   [15:0]  checksumValue; 
wire   [63:0]  anchor_Address;

/*--------------------------------------------------------------*/
// Assigns
/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/
// Overload Parameters
/*--------------------------------------------------------------*/
parameter REORDER_SIZE = 16,
          REORDER_PTR  = 4;

/*--------------------------------------------------------------*/
// Module Instantiations
/*--------------------------------------------------------------*/

niu_txc_drr_engine niu_txc_drr_engine (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .Txc_Enabled                     (Txc_Enabled),
        .MAC_Enabled                     (MAC_Enabled),
        .FlushEngine                     (FlushEngine),
        .DMA0_Active                     (DMA0_Active),
        .DMA0_Error                      (DMA0_Error),
        .DMA0_EofList                    (DMA0_EofList),
        .DMA0_CacheReady                 (DMA0_CacheReady),
        .DMA0_Partial                    (DMA0_Partial),
        .DMA0_Reset_Scheduled            (DMA0_Reset_Scheduled),
        .DMA0_Reset_Done                 (DMA0_Reset_Done),
        .DMA1_Active                     (DMA1_Active),
        .DMA1_Error                      (DMA1_Error),
        .DMA1_EofList                    (DMA1_EofList),
        .DMA1_CacheReady                 (DMA1_CacheReady),
        .DMA1_Partial                    (DMA1_Partial),
        .DMA1_Reset_Scheduled            (DMA1_Reset_Scheduled),
        .DMA1_Reset_Done                 (DMA1_Reset_Done),
        .DMA2_Active                     (DMA2_Active),
        .DMA2_Error                      (DMA2_Error),
        .DMA2_EofList                    (DMA2_EofList),
        .DMA2_CacheReady                 (DMA2_CacheReady),
        .DMA2_Partial                    (DMA2_Partial),
        .DMA2_Reset_Scheduled            (DMA2_Reset_Scheduled),
        .DMA2_Reset_Done                 (DMA2_Reset_Done),
        .DMA3_Active                     (DMA3_Active),
        .DMA3_Error                      (DMA3_Error),
        .DMA3_EofList                    (DMA3_EofList),
        .DMA3_CacheReady                 (DMA3_CacheReady),
        .DMA3_Partial                    (DMA3_Partial),
        .DMA3_Reset_Scheduled            (DMA3_Reset_Scheduled),
        .DMA3_Reset_Done                 (DMA3_Reset_Done),
        .DMA4_Active                     (DMA4_Active),
        .DMA4_Error                      (DMA4_Error),
        .DMA4_EofList                    (DMA4_EofList),
        .DMA4_CacheReady                 (DMA4_CacheReady),
        .DMA4_Partial                    (DMA4_Partial),
        .DMA4_Reset_Scheduled            (DMA4_Reset_Scheduled),
        .DMA4_Reset_Done                 (DMA4_Reset_Done),
        .DMA5_Active                     (DMA5_Active),
        .DMA5_Error                      (DMA5_Error),
        .DMA5_EofList                    (DMA5_EofList),
        .DMA5_CacheReady                 (DMA5_CacheReady),
        .DMA5_Partial                    (DMA5_Partial),
        .DMA5_Reset_Scheduled            (DMA5_Reset_Scheduled),
        .DMA5_Reset_Done                 (DMA5_Reset_Done),
        .DMA6_Active                     (DMA6_Active),
        .DMA6_Error                      (DMA6_Error),
        .DMA6_EofList                    (DMA6_EofList),
        .DMA6_CacheReady                 (DMA6_CacheReady),
        .DMA6_Partial                    (DMA6_Partial),
        .DMA6_Reset_Scheduled            (DMA6_Reset_Scheduled),
        .DMA6_Reset_Done                 (DMA6_Reset_Done),
        .DMA7_Active                     (DMA7_Active),
        .DMA7_Error                      (DMA7_Error),
        .DMA7_EofList                    (DMA7_EofList),
        .DMA7_CacheReady                 (DMA7_CacheReady),
        .DMA7_Partial                    (DMA7_Partial),
        .DMA7_Reset_Scheduled            (DMA7_Reset_Scheduled),
        .DMA7_Reset_Done                 (DMA7_Reset_Done),
        .DMA8_Active                     (DMA8_Active),
        .DMA8_Error                      (DMA8_Error),
        .DMA8_EofList                    (DMA8_EofList),
        .DMA8_CacheReady                 (DMA8_CacheReady),
        .DMA8_Partial                    (DMA8_Partial),
        .DMA8_Reset_Scheduled            (DMA8_Reset_Scheduled),
        .DMA8_Reset_Done                 (DMA8_Reset_Done),
        .DMA9_Active                     (DMA9_Active),
        .DMA9_Error                      (DMA9_Error),
        .DMA9_EofList                    (DMA9_EofList),
        .DMA9_CacheReady                 (DMA9_CacheReady),
        .DMA9_Partial                    (DMA9_Partial),
        .DMA9_Reset_Scheduled            (DMA9_Reset_Scheduled),
        .DMA9_Reset_Done                 (DMA9_Reset_Done),
        .DMA10_Active                    (DMA10_Active),
        .DMA10_Error                     (DMA10_Error),
        .DMA10_EofList                   (DMA10_EofList),
        .DMA10_CacheReady                (DMA10_CacheReady),
        .DMA10_Partial                   (DMA10_Partial),
        .DMA10_Reset_Scheduled           (DMA10_Reset_Scheduled),
        .DMA10_Reset_Done                (DMA10_Reset_Done),
        .DMA11_Active                    (DMA11_Active),
        .DMA11_Error                     (DMA11_Error),
        .DMA11_EofList                   (DMA11_EofList),
        .DMA11_CacheReady                (DMA11_CacheReady),
        .DMA11_Partial                   (DMA11_Partial),
        .DMA11_Reset_Scheduled           (DMA11_Reset_Scheduled),
        .DMA11_Reset_Done                (DMA11_Reset_Done),
        .DMA12_Active                    (DMA12_Active),
        .DMA12_Error                     (DMA12_Error),
        .DMA12_EofList                   (DMA12_EofList),
        .DMA12_CacheReady                (DMA12_CacheReady),
        .DMA12_Partial                   (DMA12_Partial),
        .DMA12_Reset_Scheduled           (DMA12_Reset_Scheduled),
        .DMA12_Reset_Done                (DMA12_Reset_Done),
        .DMA13_Active                    (DMA13_Active),
        .DMA13_Error                     (DMA13_Error),
        .DMA13_EofList                   (DMA13_EofList),
        .DMA13_CacheReady                (DMA13_CacheReady),
        .DMA13_Partial                   (DMA13_Partial),
        .DMA13_Reset_Scheduled           (DMA13_Reset_Scheduled),
        .DMA13_Reset_Done                (DMA13_Reset_Done),
        .DMA14_Active                    (DMA14_Active),
        .DMA14_Error                     (DMA14_Error),
        .DMA14_EofList                   (DMA14_EofList),
        .DMA14_CacheReady                (DMA14_CacheReady),
        .DMA14_Partial                   (DMA14_Partial),
        .DMA14_Reset_Scheduled           (DMA14_Reset_Scheduled),
        .DMA14_Reset_Done                (DMA14_Reset_Done),
        .DMA15_Active                    (DMA15_Active),
        .DMA15_Error                     (DMA15_Error),
        .DMA15_EofList                   (DMA15_EofList),
        .DMA15_CacheReady                (DMA15_CacheReady),
        .DMA15_Partial                   (DMA15_Partial),
        .DMA15_Reset_Scheduled           (DMA15_Reset_Scheduled),
        .DMA15_Reset_Done                (DMA15_Reset_Done),
        .DMA16_Active                    (DMA16_Active),
        .DMA16_Error                     (DMA16_Error),
        .DMA16_EofList                   (DMA16_EofList),
        .DMA16_CacheReady                (DMA16_CacheReady),
        .DMA16_Partial                   (DMA16_Partial),
        .DMA16_Reset_Scheduled           (DMA16_Reset_Scheduled),
        .DMA16_Reset_Done                (DMA16_Reset_Done),
        .DMA17_Active                    (DMA17_Active),
        .DMA17_Error                     (DMA17_Error),
        .DMA17_EofList                   (DMA17_EofList),
        .DMA17_CacheReady                (DMA17_CacheReady),
        .DMA17_Partial                   (DMA17_Partial),
        .DMA17_Reset_Scheduled           (DMA17_Reset_Scheduled),
        .DMA17_Reset_Done                (DMA17_Reset_Done),
        .DMA18_Active                    (DMA18_Active),
        .DMA18_Error                     (DMA18_Error),
        .DMA18_EofList                   (DMA18_EofList),
        .DMA18_CacheReady                (DMA18_CacheReady),
        .DMA18_Partial                   (DMA18_Partial),
        .DMA18_Reset_Scheduled           (DMA18_Reset_Scheduled),
        .DMA18_Reset_Done                (DMA18_Reset_Done),
        .DMA19_Active                    (DMA19_Active),
        .DMA19_Error                     (DMA19_Error),
        .DMA19_EofList                   (DMA19_EofList),
        .DMA19_CacheReady                (DMA19_CacheReady),
        .DMA19_Partial                   (DMA19_Partial),
        .DMA19_Reset_Scheduled           (DMA19_Reset_Scheduled),
        .DMA19_Reset_Done                (DMA19_Reset_Done),
        .DMA20_Active                    (DMA20_Active),
        .DMA20_Error                     (DMA20_Error),
        .DMA20_EofList                   (DMA20_EofList),
        .DMA20_CacheReady                (DMA20_CacheReady),
        .DMA20_Partial                   (DMA20_Partial),
        .DMA20_Reset_Scheduled           (DMA20_Reset_Scheduled),
        .DMA20_Reset_Done                (DMA20_Reset_Done),
        .DMA21_Active                    (DMA21_Active),
        .DMA21_Error                     (DMA21_Error),
        .DMA21_EofList                   (DMA21_EofList),
        .DMA21_CacheReady                (DMA21_CacheReady),
        .DMA21_Partial                   (DMA21_Partial),
        .DMA21_Reset_Scheduled           (DMA21_Reset_Scheduled),
        .DMA21_Reset_Done                (DMA21_Reset_Done),
        .DMA22_Active                    (DMA22_Active),
        .DMA22_Error                     (DMA22_Error),
        .DMA22_EofList                   (DMA22_EofList),
        .DMA22_CacheReady                (DMA22_CacheReady),
        .DMA22_Partial                   (DMA22_Partial),
        .DMA22_Reset_Scheduled           (DMA22_Reset_Scheduled),
        .DMA22_Reset_Done                (DMA22_Reset_Done),
        .DMA23_Active                    (DMA23_Active),
        .DMA23_Error                     (DMA23_Error),
        .DMA23_EofList                   (DMA23_EofList),
        .DMA23_CacheReady                (DMA23_CacheReady),
        .DMA23_Partial                   (DMA23_Partial),
        .DMA23_Reset_Scheduled           (DMA23_Reset_Scheduled),
        .DMA23_Reset_Done                (DMA23_Reset_Done),
        .DMA0_NewMaxBurst                (DMA0_NewMaxBurst),
        .DMA1_NewMaxBurst                (DMA1_NewMaxBurst),
        .DMA2_NewMaxBurst                (DMA2_NewMaxBurst),
        .DMA3_NewMaxBurst                (DMA3_NewMaxBurst),
        .DMA4_NewMaxBurst                (DMA4_NewMaxBurst),
        .DMA5_NewMaxBurst                (DMA5_NewMaxBurst),
        .DMA6_NewMaxBurst                (DMA6_NewMaxBurst),
        .DMA7_NewMaxBurst                (DMA7_NewMaxBurst),
        .DMA8_NewMaxBurst                (DMA8_NewMaxBurst),
        .DMA9_NewMaxBurst                (DMA9_NewMaxBurst),
        .DMA10_NewMaxBurst               (DMA10_NewMaxBurst),
        .DMA11_NewMaxBurst               (DMA11_NewMaxBurst),
        .DMA12_NewMaxBurst               (DMA12_NewMaxBurst),
        .DMA13_NewMaxBurst               (DMA13_NewMaxBurst),
        .DMA14_NewMaxBurst               (DMA14_NewMaxBurst),
        .DMA15_NewMaxBurst               (DMA15_NewMaxBurst),
        .DMA16_NewMaxBurst               (DMA16_NewMaxBurst),
        .DMA17_NewMaxBurst               (DMA17_NewMaxBurst),
        .DMA18_NewMaxBurst               (DMA18_NewMaxBurst),
        .DMA19_NewMaxBurst               (DMA19_NewMaxBurst),
        .DMA20_NewMaxBurst               (DMA20_NewMaxBurst),
        .DMA21_NewMaxBurst               (DMA21_NewMaxBurst),
        .DMA22_NewMaxBurst               (DMA22_NewMaxBurst),
        .DMA23_NewMaxBurst               (DMA23_NewMaxBurst),
        .DMA0_MaxBurst                   (DMA0_MaxBurst),
        .DMA1_MaxBurst                   (DMA1_MaxBurst),
        .DMA2_MaxBurst                   (DMA2_MaxBurst),
        .DMA3_MaxBurst                   (DMA3_MaxBurst),
        .DMA4_MaxBurst                   (DMA4_MaxBurst),
        .DMA5_MaxBurst                   (DMA5_MaxBurst),
        .DMA6_MaxBurst                   (DMA6_MaxBurst),
        .DMA7_MaxBurst                   (DMA7_MaxBurst),
        .DMA8_MaxBurst                   (DMA8_MaxBurst),
        .DMA9_MaxBurst                   (DMA9_MaxBurst),
        .DMA10_MaxBurst                  (DMA10_MaxBurst),
        .DMA11_MaxBurst                  (DMA11_MaxBurst),
        .DMA12_MaxBurst                  (DMA12_MaxBurst),
        .DMA13_MaxBurst                  (DMA13_MaxBurst),
        .DMA14_MaxBurst                  (DMA14_MaxBurst),
        .DMA15_MaxBurst                  (DMA15_MaxBurst),
        .DMA16_MaxBurst                  (DMA16_MaxBurst),
        .DMA17_MaxBurst                  (DMA17_MaxBurst),
        .DMA18_MaxBurst                  (DMA18_MaxBurst),
        .DMA19_MaxBurst                  (DMA19_MaxBurst),
        .DMA20_MaxBurst                  (DMA20_MaxBurst),
        .DMA21_MaxBurst                  (DMA21_MaxBurst),
        .DMA22_MaxBurst                  (DMA22_MaxBurst),
        .DMA23_MaxBurst                  (DMA23_MaxBurst),
        .Port_DMA_List                   (Port_DMA_List),
        .ClrMaxBurst                     (ClrMaxBurst),

        .DRR_PacketDone                  (dRR_PacketDone),
        .DRR_PacketByteCount             (dRR_PacketByteCount),
        .DRR_Arb_Valid                   (dRR_Arb_Valid),
        .DRR_NextDMAChannel              (dRR_NextDMAChannel),

        .LatchActiveDMA                  (LatchActiveDMA),
        .ContextActiveList               (ContextActiveList),

        .DRR_ArbState                    (DRR_ArbState)
       );


niu_txc_portRequest niu_txc_portRequest (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .Txc_Enabled                     (Txc_Enabled),

        .Port_Enabled                    (MAC_Enabled),

        .Pkt_Size_Err                    (Pkt_Size_Err),
        .DMA_Pkt_Size_Err                (DMA_Pkt_Size_Err),
        .Pkt_Size_Err_Addr               (Pkt_Size_Err_Addr),

        .DMA0_EofList                    (DMA0_EofList),
        .DMA0_Error                      (DMA0_Error),
        .DMA0_GotNxtDesc                 (DMA0_GotNxtDesc),
        .DMA0_SOP                        (DMA0_SOP),
        .DMA0_Mark                       (DMA0_Mark),
        .DMA0_Func_Num                   (DMA0_Func_Num),
        .DMA0_DescList                   (DMA0_DescList),
        .DMA0_Length                     (DMA0_Length),
        .DMA0_PageHandle                 (DMA0_PageHandle),
        .DMA0_Address                    (DMA0_Address),
        .SetGetNextDescDMA0              (SetGetNextDescDMA0),

        .DMA1_EofList                    (DMA1_EofList),
        .DMA1_Error                      (DMA1_Error),
        .DMA1_GotNxtDesc                 (DMA1_GotNxtDesc),
        .DMA1_SOP                        (DMA1_SOP),
        .DMA1_Mark                       (DMA1_Mark),
        .DMA1_Func_Num                   (DMA1_Func_Num),
        .DMA1_DescList                   (DMA1_DescList),
        .DMA1_Length                     (DMA1_Length),
        .DMA1_PageHandle                 (DMA1_PageHandle),
        .DMA1_Address                    (DMA1_Address),
        .SetGetNextDescDMA1              (SetGetNextDescDMA1),

        .DMA2_EofList                    (DMA2_EofList),
        .DMA2_Error                      (DMA2_Error),
        .DMA2_GotNxtDesc                 (DMA2_GotNxtDesc),
        .DMA2_SOP                        (DMA2_SOP),
        .DMA2_Mark                       (DMA2_Mark),
        .DMA2_Func_Num                   (DMA2_Func_Num),
        .DMA2_DescList                   (DMA2_DescList),
        .DMA2_Length                     (DMA2_Length),
        .DMA2_PageHandle                 (DMA2_PageHandle),
        .DMA2_Address                    (DMA2_Address),
        .SetGetNextDescDMA2              (SetGetNextDescDMA2),

        .DMA3_EofList                    (DMA3_EofList),
        .DMA3_Error                      (DMA3_Error),
        .DMA3_GotNxtDesc                 (DMA3_GotNxtDesc),
        .DMA3_SOP                        (DMA3_SOP),
        .DMA3_Mark                       (DMA3_Mark),
        .DMA3_Func_Num                   (DMA3_Func_Num),
        .DMA3_DescList                   (DMA3_DescList),
        .DMA3_Length                     (DMA3_Length),
        .DMA3_PageHandle                 (DMA3_PageHandle),
        .DMA3_Address                    (DMA3_Address),
        .SetGetNextDescDMA3              (SetGetNextDescDMA3),

        .DMA4_EofList                    (DMA4_EofList),
        .DMA4_Error                      (DMA4_Error),
        .DMA4_GotNxtDesc                 (DMA4_GotNxtDesc),
        .DMA4_SOP                        (DMA4_SOP),
        .DMA4_Mark                       (DMA4_Mark),
        .DMA4_Func_Num                   (DMA4_Func_Num),
        .DMA4_DescList                   (DMA4_DescList),
        .DMA4_Length                     (DMA4_Length),
        .DMA4_PageHandle                 (DMA4_PageHandle),
        .DMA4_Address                    (DMA4_Address),
        .SetGetNextDescDMA4              (SetGetNextDescDMA4),

        .DMA5_EofList                    (DMA5_EofList),
        .DMA5_Error                      (DMA5_Error),
        .DMA5_GotNxtDesc                 (DMA5_GotNxtDesc),
        .DMA5_SOP                        (DMA5_SOP),
        .DMA5_Mark                       (DMA5_Mark),
        .DMA5_Func_Num                   (DMA5_Func_Num),
        .DMA5_DescList                   (DMA5_DescList),
        .DMA5_Length                     (DMA5_Length),
        .DMA5_PageHandle                 (DMA5_PageHandle),
        .DMA5_Address                    (DMA5_Address),
        .SetGetNextDescDMA5              (SetGetNextDescDMA5),

        .DMA6_EofList                    (DMA6_EofList),
        .DMA6_Error                      (DMA6_Error),
        .DMA6_GotNxtDesc                 (DMA6_GotNxtDesc),
        .DMA6_SOP                        (DMA6_SOP),
        .DMA6_Mark                       (DMA6_Mark),
        .DMA6_Func_Num                   (DMA6_Func_Num),
        .DMA6_DescList                   (DMA6_DescList),
        .DMA6_Length                     (DMA6_Length),
        .DMA6_PageHandle                 (DMA6_PageHandle),
        .DMA6_Address                    (DMA6_Address),
        .SetGetNextDescDMA6              (SetGetNextDescDMA6),

        .DMA7_EofList                    (DMA7_EofList),
        .DMA7_Error                      (DMA7_Error),
        .DMA7_GotNxtDesc                 (DMA7_GotNxtDesc),
        .DMA7_SOP                        (DMA7_SOP),
        .DMA7_Mark                       (DMA7_Mark),
        .DMA7_Func_Num                   (DMA7_Func_Num),
        .DMA7_DescList                   (DMA7_DescList),
        .DMA7_Length                     (DMA7_Length),
        .DMA7_PageHandle                 (DMA7_PageHandle),
        .DMA7_Address                    (DMA7_Address),
        .SetGetNextDescDMA7              (SetGetNextDescDMA7),

        .DMA8_EofList                    (DMA8_EofList),
        .DMA8_Error                      (DMA8_Error),
        .DMA8_GotNxtDesc                 (DMA8_GotNxtDesc),
        .DMA8_SOP                        (DMA8_SOP),
        .DMA8_Mark                       (DMA8_Mark),
        .DMA8_Func_Num                   (DMA8_Func_Num),
        .DMA8_DescList                   (DMA8_DescList),
        .DMA8_Length                     (DMA8_Length),
        .DMA8_PageHandle                 (DMA8_PageHandle),
        .DMA8_Address                    (DMA8_Address),
        .SetGetNextDescDMA8              (SetGetNextDescDMA8),

        .DMA9_EofList                    (DMA9_EofList),
        .DMA9_Error                      (DMA9_Error),
        .DMA9_GotNxtDesc                 (DMA9_GotNxtDesc),
        .DMA9_SOP                        (DMA9_SOP),
        .DMA9_Mark                       (DMA9_Mark),
        .DMA9_Func_Num                   (DMA9_Func_Num),
        .DMA9_DescList                   (DMA9_DescList),
        .DMA9_Length                     (DMA9_Length),
        .DMA9_PageHandle                 (DMA9_PageHandle),
        .DMA9_Address                    (DMA9_Address),
        .SetGetNextDescDMA9              (SetGetNextDescDMA9),

        .DMA10_EofList                   (DMA10_EofList),
        .DMA10_Error                     (DMA10_Error),
        .DMA10_GotNxtDesc                (DMA10_GotNxtDesc),
        .DMA10_SOP                       (DMA10_SOP),
        .DMA10_Mark                      (DMA10_Mark),
        .DMA10_Func_Num                  (DMA10_Func_Num),
        .DMA10_DescList                  (DMA10_DescList),
        .DMA10_Length                    (DMA10_Length),
        .DMA10_PageHandle                (DMA10_PageHandle),
        .DMA10_Address                   (DMA10_Address),
        .SetGetNextDescDMA10             (SetGetNextDescDMA10),

        .DMA11_EofList                   (DMA11_EofList),
        .DMA11_Error                     (DMA11_Error),
        .DMA11_GotNxtDesc                (DMA11_GotNxtDesc),
        .DMA11_SOP                       (DMA11_SOP),
        .DMA11_Mark                      (DMA11_Mark),
        .DMA11_Func_Num                  (DMA11_Func_Num),
        .DMA11_DescList                  (DMA11_DescList),
        .DMA11_Length                    (DMA11_Length),
        .DMA11_PageHandle                (DMA11_PageHandle),
        .DMA11_Address                   (DMA11_Address),
        .SetGetNextDescDMA11             (SetGetNextDescDMA11),

        .DMA12_EofList                   (DMA12_EofList),
        .DMA12_Error                     (DMA12_Error),
        .DMA12_GotNxtDesc                (DMA12_GotNxtDesc),
        .DMA12_SOP                       (DMA12_SOP),
        .DMA12_Mark                      (DMA12_Mark),
        .DMA12_Func_Num                  (DMA12_Func_Num),
        .DMA12_DescList                  (DMA12_DescList),
        .DMA12_Length                    (DMA12_Length),
        .DMA12_PageHandle                (DMA12_PageHandle),
        .DMA12_Address                   (DMA12_Address),
        .SetGetNextDescDMA12             (SetGetNextDescDMA12),

        .DMA13_EofList                   (DMA13_EofList),
        .DMA13_Error                     (DMA13_Error),
        .DMA13_GotNxtDesc                (DMA13_GotNxtDesc),
        .DMA13_SOP                       (DMA13_SOP),
        .DMA13_Mark                      (DMA13_Mark),
        .DMA13_Func_Num                  (DMA13_Func_Num),
        .DMA13_DescList                  (DMA13_DescList),
        .DMA13_Length                    (DMA13_Length),
        .DMA13_PageHandle                (DMA13_PageHandle),
        .DMA13_Address                   (DMA13_Address),
        .SetGetNextDescDMA13             (SetGetNextDescDMA13),

        .DMA14_EofList                   (DMA14_EofList),
        .DMA14_Error                     (DMA14_Error),
        .DMA14_GotNxtDesc                (DMA14_GotNxtDesc),
        .DMA14_SOP                       (DMA14_SOP),
        .DMA14_Mark                      (DMA14_Mark),
        .DMA14_Func_Num                  (DMA14_Func_Num),
        .DMA14_DescList                  (DMA14_DescList),
        .DMA14_Length                    (DMA14_Length),
        .DMA14_PageHandle                (DMA14_PageHandle),
        .DMA14_Address                   (DMA14_Address),
        .SetGetNextDescDMA14             (SetGetNextDescDMA14),

        .DMA15_EofList                   (DMA15_EofList),
        .DMA15_Error                     (DMA15_Error),
        .DMA15_GotNxtDesc                (DMA15_GotNxtDesc),
        .DMA15_SOP                       (DMA15_SOP),
        .DMA15_Mark                      (DMA15_Mark),
        .DMA15_Func_Num                  (DMA15_Func_Num),
        .DMA15_DescList                  (DMA15_DescList),
        .DMA15_Length                    (DMA15_Length),
        .DMA15_PageHandle                (DMA15_PageHandle),
        .DMA15_Address                   (DMA15_Address),
        .SetGetNextDescDMA15             (SetGetNextDescDMA15),

        .DMA16_EofList                   (DMA16_EofList),
        .DMA16_Error                     (DMA16_Error),
        .DMA16_GotNxtDesc                (DMA16_GotNxtDesc),
        .DMA16_SOP                       (DMA16_SOP),
        .DMA16_Mark                      (DMA16_Mark),
        .DMA16_Func_Num                  (DMA16_Func_Num),
        .DMA16_DescList                  (DMA16_DescList),
        .DMA16_Length                    (DMA16_Length),
        .DMA16_PageHandle                (DMA16_PageHandle),
        .DMA16_Address                   (DMA16_Address),
        .SetGetNextDescDMA16             (SetGetNextDescDMA16),

        .DMA17_EofList                   (DMA17_EofList),
        .DMA17_Error                     (DMA17_Error),
        .DMA17_GotNxtDesc                (DMA17_GotNxtDesc),
        .DMA17_SOP                       (DMA17_SOP),
        .DMA17_Mark                      (DMA17_Mark),
        .DMA17_Func_Num                  (DMA17_Func_Num),
        .DMA17_DescList                  (DMA17_DescList),
        .DMA17_Length                    (DMA17_Length),
        .DMA17_PageHandle                (DMA17_PageHandle),
        .DMA17_Address                   (DMA17_Address),
        .SetGetNextDescDMA17             (SetGetNextDescDMA17),

        .DMA18_EofList                   (DMA18_EofList),
        .DMA18_Error                     (DMA18_Error),
        .DMA18_GotNxtDesc                (DMA18_GotNxtDesc),
        .DMA18_SOP                       (DMA18_SOP),
        .DMA18_Mark                      (DMA18_Mark),
        .DMA18_Func_Num                  (DMA18_Func_Num),
        .DMA18_DescList                  (DMA18_DescList),
        .DMA18_Length                    (DMA18_Length),
        .DMA18_PageHandle                (DMA18_PageHandle),
        .DMA18_Address                   (DMA18_Address),
        .SetGetNextDescDMA18             (SetGetNextDescDMA18),

        .DMA19_EofList                   (DMA19_EofList),
        .DMA19_Error                     (DMA19_Error),
        .DMA19_GotNxtDesc                (DMA19_GotNxtDesc),
        .DMA19_SOP                       (DMA19_SOP),
        .DMA19_Mark                      (DMA19_Mark),
        .DMA19_Func_Num                  (DMA19_Func_Num),
        .DMA19_DescList                  (DMA19_DescList),
        .DMA19_Length                    (DMA19_Length),
        .DMA19_PageHandle                (DMA19_PageHandle),
        .DMA19_Address                   (DMA19_Address),
        .SetGetNextDescDMA19             (SetGetNextDescDMA19),

        .DMA20_EofList                   (DMA20_EofList),
        .DMA20_Error                     (DMA20_Error),
        .DMA20_GotNxtDesc                (DMA20_GotNxtDesc),
        .DMA20_SOP                       (DMA20_SOP),
        .DMA20_Mark                      (DMA20_Mark),
        .DMA20_Func_Num                  (DMA20_Func_Num),
        .DMA20_DescList                  (DMA20_DescList),
        .DMA20_Length                    (DMA20_Length),
        .DMA20_PageHandle                (DMA20_PageHandle),
        .DMA20_Address                   (DMA20_Address),
        .SetGetNextDescDMA20             (SetGetNextDescDMA20),

        .DMA21_EofList                   (DMA21_EofList),
        .DMA21_Error                     (DMA21_Error),
        .DMA21_GotNxtDesc                (DMA21_GotNxtDesc),
        .DMA21_SOP                       (DMA21_SOP),
        .DMA21_Mark                      (DMA21_Mark),
        .DMA21_Func_Num                  (DMA21_Func_Num),
        .DMA21_DescList                  (DMA21_DescList),
        .DMA21_Length                    (DMA21_Length),
        .DMA21_PageHandle                (DMA21_PageHandle),
        .DMA21_Address                   (DMA21_Address),
        .SetGetNextDescDMA21             (SetGetNextDescDMA21),

        .DMA22_EofList                   (DMA22_EofList),
        .DMA22_Error                     (DMA22_Error),
        .DMA22_GotNxtDesc                (DMA22_GotNxtDesc),
        .DMA22_SOP                       (DMA22_SOP),
        .DMA22_Mark                      (DMA22_Mark),
        .DMA22_Func_Num                  (DMA22_Func_Num),
        .DMA22_DescList                  (DMA22_DescList),
        .DMA22_Length                    (DMA22_Length),
        .DMA22_PageHandle                (DMA22_PageHandle),
        .DMA22_Address                   (DMA22_Address),
        .SetGetNextDescDMA22             (SetGetNextDescDMA22),

        .DMA23_EofList                   (DMA23_EofList),
        .DMA23_Error                     (DMA23_Error),
        .DMA23_GotNxtDesc                (DMA23_GotNxtDesc),
        .DMA23_SOP                       (DMA23_SOP),
        .DMA23_Mark                      (DMA23_Mark),
        .DMA23_Func_Num                  (DMA23_Func_Num),
        .DMA23_DescList                  (DMA23_DescList),
        .DMA23_Length                    (DMA23_Length),
        .DMA23_PageHandle                (DMA23_PageHandle),
        .DMA23_Address                   (DMA23_Address),
        .SetGetNextDescDMA23             (SetGetNextDescDMA23),

        .DRR_Arb_Valid                   (dRR_Arb_Valid),
        .DRR_NextDMAChannel              (dRR_NextDMAChannel),
        .DRR_PacketDone                  (dRR_PacketDone),
        .PacketByteCount                 (dRR_PacketByteCount),

        .Anchor_Done                     (anchor_Done),
        .Req_Anchor                      (req_Anchor),
        .Anchor_LoadTID                  (anchor_LoadTID),
        .Anchor_MarkBit                  (anchor_MarkBit),
        .Anchor_SopBit                   (anchor_SopBit),
        .Anchor_GatherLast               (anchor_GatherLast),
        .Anchor_DMA                      (anchor_DMA),
        .Anchor_TransID                  (anchor_TransID),
        .Anchor_Length                   (anchor_Length),
        .Anchor_Address                  (anchor_Address),

        .DMC_TXC_Req_Ack                 (DMC_TXC_Req_Ack),
        .DMC_TXC_Req_TransID             (DMC_TXC_Req_TransID),

        .Port_Selected                   (Port_Selected),
        .Port_Request                    (Port_Request),
        .Port_Request_Func_Num           (Port_Request_Func_Num),
        .Port_Request_DMA_Num            (Port_Request_DMA_Num),
        .Port_Request_Length             (Port_Request_Length),
        .Port_Request_Address            (Port_Request_Address),

        .DataPortReq_State               (DataPortReq_State)
       );


niu_txc_reAligner #(REORDER_SIZE, REORDER_PTR) niu_txc_reAligner (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .Txc_Enabled                     (Txc_Enabled),
        .EnableGMACMode                  (EnableGMACMode),
        .PortIndentifier                 (PortIndentifier),

        .ClearStatistics                 (ClearStatistics),
        .WrPacketRequested               (WrPacketRequested),
        .WrPacketStuffed                 (WrPacketStuffed),
        .WrTidsInUse                     (WrTidsInUse),
        .WrDuplicateTid                  (WrDuplicateTid),
        .WrUnInitializedTID              (WrUnInitializedTID),
        .WrTimedoutTids                  (WrTimedoutTids),
        .WrReOrderStateLogic             (WrReOrderStateLogic),
        .WrReOrderStateControl           (WrReOrderStateControl),
        .WrReOrderStateData0             (WrReOrderStateData0),
        .WrReOrderStateData1             (WrReOrderStateData1),
        .WrReOrderStateData2             (WrReOrderStateData2),
        .WrReOrderStateData3             (WrReOrderStateData3),
        .PioDataIn                       (PioDataIn),
        .GatherRequestCount              (GatherRequestCount),
        .PacketRequestCount              (PacketRequestCount),
        .ReOrdersStuffed                 (ReOrdersStuffed),
        .TidsInUse                       (TidsInUse),
        .DuplicateTid                    (DuplicateTid),
        .UnInitializedTID                (UnInitializedTID),
        .TimedoutTids                    (TimedoutTids),
        .ReOrderStateLogic               (ReOrderStateLogic),
        .ReOrderStateControl             (ReOrderStateControl),
        .ReOrderStateData0               (ReOrderStateData0),
        .ReOrderStateData1               (ReOrderStateData1),
        .ReOrderStateData2               (ReOrderStateData2),
        .ReOrderStateData3               (ReOrderStateData3),

        .MAC_Enabled                     (MAC_Enabled),

        .MaxReorderNumber                (MaxReorderNumber),
        .UpdateDMA                       (UpdateDMA),
        .UpdateDMALength                 (UpdateDMALength),
        .UpdateDMANumber                 (UpdateDMANumber),

        .ReOrderFifoRead                 (reOrderFifoRead),
        .ReOrderEccControl               (ReOrderEccControl),
        .ReOrderCorruptECCSingle         (ReOrderCorruptECCSingle),
        .ReOrderCorruptECCDouble         (ReOrderCorruptECCDouble),
        .ReOrderFifoWrite                (ReOrderFifoWrite),
        .ReOrderFifoReadStrobe           (ReOrderFifoReadStrobe),
        .ReOrderFifoEmpty                (reOrderFifoEmpty),
        .ReOrderFifoAlmostEmpty          (reOrderFifoAlmostEmpty),
        .ReOrderWritePtr                 (ReOrderWritePtr),
        .ReOrderReadPtr                  (ReOrderReadPtr),
        .ReOrderEngineDataOut            (ReOrderEngineDataOut),

        .Req_Anchor                      (req_Anchor),
        .Anchor_MarkBit                  (anchor_MarkBit),
        .Anchor_SopBit                   (anchor_SopBit),
        .Anchor_GatherLast               (anchor_GatherLast),
        .Anchor_DMA                      (anchor_DMA),
        .Anchor_Length                   (anchor_Length),
        .Anchor_Address                  (anchor_Address),
        .Anchor_Done                     (anchor_Done),

        .Anchor_LoadTID                  (anchor_LoadTID),
        .Anchor_TransID                  (anchor_TransID),

        .DMC_TXC_Resp_Rdy                (DMC_TXC_Resp_Rdy),
        .DMC_TXC_Resp_Complete           (DMC_TXC_Resp_Complete),
        .DMC_TXC_Trans_Complete          (DMC_TXC_Trans_Complete),
        .DMC_TXC_Resp_Data_Valid         (DMC_TXC_Resp_Data_Valid),
        .DMC_TXC_Resp_Client             (DMC_TXC_Resp_Client),
        .DMC_TXC_Resp_Port_Num           (DMC_TXC_Resp_Port_Num),
        .DMC_TXC_Resp_Cmd_Status         (DMC_TXC_Resp_Cmd_Status),
        .DMC_TXC_Resp_Data_Status        (DMC_TXC_Resp_Data_Status),
        .DMC_TXC_Resp_DMA_Num            (DMC_TXC_Resp_DMA_Num),
        .DMC_TXC_Resp_TransID            (DMC_TXC_Resp_TransID),
        .DMC_TXC_Resp_Cmd                (DMC_TXC_Resp_Cmd),
        .DMC_TXC_Resp_ByteEnables        (DMC_TXC_Resp_ByteEnables),
        .DMC_TXC_Resp_Data_Length        (DMC_TXC_Resp_Data_Length),
        .DMC_TXC_Resp_Address            (DMC_TXC_Resp_Address),
        .DMC_TXC_Resp_Data               (DMC_TXC_Resp_Data),
        .TXC_DMC_Resp_Accept             (TXC_DMC_Resp_Accept),

        .ReOrder_Error                   (ReOrder_Error),

        .Nack_Pkt_Rd                     (Nack_Pkt_Rd),
        .DMA_Nack_Pkt_Rd                 (DMA_Nack_Pkt_Rd),
        .Nack_Pkt_Rd_Addr                (Nack_Pkt_Rd_Addr),

        .DMA0_Inc_Head                   (DMA0_Inc_Head),
        .DMA0_Mark_Bit                   (DMA0_Mark_Bit),
        .DMA0_Inc_Pkt_Cnt                (DMA0_Inc_Pkt_Cnt),
        .DMA1_Inc_Head                   (DMA1_Inc_Head),
        .DMA1_Mark_Bit                   (DMA1_Mark_Bit),
        .DMA1_Inc_Pkt_Cnt                (DMA1_Inc_Pkt_Cnt),
        .DMA2_Inc_Head                   (DMA2_Inc_Head),
        .DMA2_Mark_Bit                   (DMA2_Mark_Bit),
        .DMA2_Inc_Pkt_Cnt                (DMA2_Inc_Pkt_Cnt),
        .DMA3_Inc_Head                   (DMA3_Inc_Head),
        .DMA3_Mark_Bit                   (DMA3_Mark_Bit),
        .DMA3_Inc_Pkt_Cnt                (DMA3_Inc_Pkt_Cnt),
        .DMA4_Inc_Head                   (DMA4_Inc_Head),
        .DMA4_Mark_Bit                   (DMA4_Mark_Bit),
        .DMA4_Inc_Pkt_Cnt                (DMA4_Inc_Pkt_Cnt),
        .DMA5_Inc_Head                   (DMA5_Inc_Head),
        .DMA5_Mark_Bit                   (DMA5_Mark_Bit),
        .DMA5_Inc_Pkt_Cnt                (DMA5_Inc_Pkt_Cnt),
        .DMA6_Inc_Head                   (DMA6_Inc_Head),
        .DMA6_Mark_Bit                   (DMA6_Mark_Bit),
        .DMA6_Inc_Pkt_Cnt                (DMA6_Inc_Pkt_Cnt),
        .DMA7_Inc_Head                   (DMA7_Inc_Head),
        .DMA7_Mark_Bit                   (DMA7_Mark_Bit),
        .DMA7_Inc_Pkt_Cnt                (DMA7_Inc_Pkt_Cnt),
        .DMA8_Inc_Head                   (DMA8_Inc_Head),
        .DMA8_Mark_Bit                   (DMA8_Mark_Bit),
        .DMA8_Inc_Pkt_Cnt                (DMA8_Inc_Pkt_Cnt),
        .DMA9_Inc_Head                   (DMA9_Inc_Head),
        .DMA9_Mark_Bit                   (DMA9_Mark_Bit),
        .DMA9_Inc_Pkt_Cnt                (DMA9_Inc_Pkt_Cnt),
        .DMA10_Inc_Head                  (DMA10_Inc_Head),
        .DMA10_Mark_Bit                  (DMA10_Mark_Bit),
        .DMA10_Inc_Pkt_Cnt               (DMA10_Inc_Pkt_Cnt),
        .DMA11_Inc_Head                  (DMA11_Inc_Head),
        .DMA11_Mark_Bit                  (DMA11_Mark_Bit),
        .DMA11_Inc_Pkt_Cnt               (DMA11_Inc_Pkt_Cnt),
        .DMA12_Inc_Head                  (DMA12_Inc_Head),
        .DMA12_Mark_Bit                  (DMA12_Mark_Bit),
        .DMA12_Inc_Pkt_Cnt               (DMA12_Inc_Pkt_Cnt),
        .DMA13_Inc_Head                  (DMA13_Inc_Head),
        .DMA13_Mark_Bit                  (DMA13_Mark_Bit),
        .DMA13_Inc_Pkt_Cnt               (DMA13_Inc_Pkt_Cnt),
        .DMA14_Inc_Head                  (DMA14_Inc_Head),
        .DMA14_Mark_Bit                  (DMA14_Mark_Bit),
        .DMA14_Inc_Pkt_Cnt               (DMA14_Inc_Pkt_Cnt),
        .DMA15_Inc_Head                  (DMA15_Inc_Head),
        .DMA15_Mark_Bit                  (DMA15_Mark_Bit),
        .DMA15_Inc_Pkt_Cnt               (DMA15_Inc_Pkt_Cnt),
        .DMA16_Inc_Head                  (DMA16_Inc_Head),
        .DMA16_Mark_Bit                  (DMA16_Mark_Bit),
        .DMA16_Inc_Pkt_Cnt               (DMA16_Inc_Pkt_Cnt),
        .DMA17_Inc_Head                  (DMA17_Inc_Head),
        .DMA17_Mark_Bit                  (DMA17_Mark_Bit),
        .DMA17_Inc_Pkt_Cnt               (DMA17_Inc_Pkt_Cnt),
        .DMA18_Inc_Head                  (DMA18_Inc_Head),
        .DMA18_Mark_Bit                  (DMA18_Mark_Bit),
        .DMA18_Inc_Pkt_Cnt               (DMA18_Inc_Pkt_Cnt),
        .DMA19_Inc_Head                  (DMA19_Inc_Head),
        .DMA19_Mark_Bit                  (DMA19_Mark_Bit),
        .DMA19_Inc_Pkt_Cnt               (DMA19_Inc_Pkt_Cnt),
        .DMA20_Inc_Head                  (DMA20_Inc_Head),
        .DMA20_Mark_Bit                  (DMA20_Mark_Bit),
        .DMA20_Inc_Pkt_Cnt               (DMA20_Inc_Pkt_Cnt),
        .DMA21_Inc_Head                  (DMA21_Inc_Head),
        .DMA21_Mark_Bit                  (DMA21_Mark_Bit),
        .DMA21_Inc_Pkt_Cnt               (DMA21_Inc_Pkt_Cnt),
        .DMA22_Inc_Head                  (DMA22_Inc_Head),
        .DMA22_Mark_Bit                  (DMA22_Mark_Bit),
        .DMA22_Inc_Pkt_Cnt               (DMA22_Inc_Pkt_Cnt),
        .DMA23_Inc_Head                  (DMA23_Inc_Head),
        .DMA23_Mark_Bit                  (DMA23_Mark_Bit),
        .DMA23_Inc_Pkt_Cnt               (DMA23_Inc_Pkt_Cnt),

        .Anchor_State                    (Anchor_State),
        .ReOrder_State                   (ReOrder_State),
        .Pointer_State                   (Pointer_State)
        );


niu_txc_packetAssy niu_txc_packetAssy (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .PacketAssyDead                  (PacketAssyDead),
        .Txc_Enabled                     (Txc_Enabled),
        .MAC_Enabled                     (MAC_Enabled),

        .StoreForwardFifoRead            (storeForwardFifoRead),
        .StoreForwardEccControl          (StoreForwardEccControl),
        .StoreForwardFifoEmpty           (storeForwardFifoEmpty),
        .StoreForward_CorruptECCSingle   (StoreForward_CorruptECCSingle),
        .StoreForward_CorruptECCDouble   (StoreForward_CorruptECCDouble),
        .StoreForwardFifoWrite           (StoreForwardFifoWrite),
        .StoreForwardFifoReadStrobe      (StoreForwardFifoReadStrobe),
        .StoreForwardReadPtr             (StoreForwardReadPtr),
        .StoreForwardWritePtr            (StoreForwardWritePtr),
        .PacketAssyEngineDataOut         (PacketAssyEngineDataOut),

        .ReOrderFifoEmpty                (reOrderFifoEmpty),
        .ReOrderUnCorrectError           (ReOrderUnCorrectError),
        .ReOrderFifoAlmostEmpty          (reOrderFifoAlmostEmpty),
        .ReOrderFifoDataValid            (ReOrderFifoDataValid),
        .DisableEccCheking               (ReOrderEccControl[31]),
        .PacketAssyEngineDataIn          (PacketAssyEngineDataIn),
        .ReOrderFifoRead                 (reOrderFifoRead),

        .CheckSumValid                   (checkSumValid),
        .ChecksumValue                   (checksumValue), 
        .StartTCPChecksum                (startTCPchecksum),
        .ChecksumPacketDone              (checksumPacketDone),
        .PacketType                      (packetType),
        .Layer3Version                   (layer3Version),
        .Layer3Start                     (layer3Start),
        .IPv4IPHeaderLen                 (iPv4IPHeaderLen),

        .ClearStatistics                 (ClearStatistics),
        .WrPacketRequested               (WrPacketRequested),
        .WrPacketStuffed                 (WrPacketStuffed),
        .PioDataIn                       (PioDataIn[15:0]),
        .PacketsStuffed                  (PacketsStuffed),
        .PktErrAbortCount                (PktErrAbortCount),

        .PacketAssy_State                (PacketAssy_State)
        );


niu_ipp_sum_unit txc_sum_unit (
        .clk                             (SysClk),
        .reset                           (~Reset_L),           
        .ipp_din_dat                     (PacketAssyEngineDataOut[127:0]),
        .port_num                        (1'b1),
        .ipp_full_cksum                  (1'b0),   
        .ipp_la4_prot                    (packetType),   
        .ipp_la3_vers                    (layer3Version),  
        .ipp_la2_opti                    (layer3Start),
        .ip4_hdr_leng                    (iPv4IPHeaderLen),
        .ipp_info_valid                  (StoreForwardFifoWrite),  
        .ipp_start_tcp                   (startTCPchecksum), 
        .ipp_pkt_end                     (checksumPacketDone),
        .ipp_max_bytes                   (17'h1FFFF),
        .sum_prt_started                 (), 
        .sum_prt_valid                   (checkSumValid),
        .sum_prt_fail                    (),    
        .sum_prt_cksum                   (checksumValue), 
        .sum_prt_length                  (),
        .sum_prt_state                   (Sum_prt_state)
       );

niu_txc_mac_transfer niu_txc_mac_transfer (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .Txc_Enabled                     (Txc_Enabled),
        .EnableGMACMode                  (EnableGMACMode),
        .DisableEccCheking               (StoreForwardEccControl[31]),
        .UnCorrectError                  (StoreForwardUnCorrectError),
        .FifoEmpty                       (storeForwardFifoEmpty),
        .FifoDataOut                     (MacXferEngineDataIn),
        .FifoRead                        (storeForwardFifoRead),
        .ClearStatistics                 (ClearStatistics),
        .WrPacketXmitted                 (WrPacketXmitted),
        .PioDataIn                       (PioDataIn),
        .PacketsTransmitted              (PacketsTransmitted),
        .BytesTransmitted                (BytesTransmitted),
        .MAC_Req                         (MAC_Req),
        .MAC_Ack                         (MAC_Ack),
        .MAC_Tag                         (MAC_Tag),
        .MAC_Abort                       (MAC_Abort),
        .MAC_Status                      (MAC_Status),
        .MAC_Data                        (MAC_Data),
        .Mac_Xfer_State                  (Mac_Xfer_State)
       );


endmodule
