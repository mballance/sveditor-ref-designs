// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_ControlRegs.v
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
 *  niu_txc_ControlRegs.v
 *
 *  NIU Transmit Controller Deficit Round Robin Engine
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

module niu_txc_ControlRegs (
        SysClk,
        Reset_L, 
        niu_txc_interrupts, 

        Slave_32BitMode,
        Slave_Read,             // Slave Read & Write Bar
        Slave_Sel,              // Slave Sel
        Slave_Addr,             // Slave Address
        Slave_DataIn,           // Slave Write Data
        Slave_Ack,              // Slave PIO Ack
        Slave_Err,              // Slave PIO Error
        Slave_DataOut,          // Slave Read Data

        Txc_Enabled, 
        MAC0_Enabled, 
        MAC1_Enabled, 
`ifdef NEPTUNE
        MAC2_Enabled, 
        MAC3_Enabled, 
`endif
        FlushEngine, 

        Port0_TidsInUse,
        Port0_DuplicateTid,
        Port0_UnInitializedTID,
        Port0_TimedoutTids,
        Port0_ReOrderStateLogic,
        Port0_ReOrderStateControl,
        Port0_ReOrderStateData0,
        Port0_ReOrderStateData1,
        Port0_ReOrderStateData2,
        Port0_ReOrderStateData3,
        Port0_WrTidsInUse,
        Port0_WrDuplicateTid,
        Port0_WrUnInitializedTID,
        Port0_WrTimedoutTids,
        Port0_WrReOrderStateLogic,
        Port0_WrReOrderStateControl,
        Port0_WrReOrderStateData0,
        Port0_WrReOrderStateData1,
        Port0_WrReOrderStateData2,
        Port0_WrReOrderStateData3,
        Port0_PioDataIn,
        Port0_ReOrder_ECC_State,
        Port0_StoreForward_ECC_State,
        Port0_ReOrder_EccData,
        Port0_StoreForward_EccData,
        Port0_ReOrder_ClearEccError,
        Port0_WrReOrderEccState,
        Port0_WrReOrderEccData0,
        Port0_WrReOrderEccData1,
        Port0_WrReOrderEccData2,
        Port0_WrReOrderEccData3,
        Port0_WrReOrderEccData4,
        Port0_StoreForward_ClearEccError,
        Port0_WrStoreForwardEccState,
        Port0_WrStoreForwardEccData0,
        Port0_WrStoreForwardEccData1,
        Port0_WrStoreForwardEccData2,
        Port0_WrStoreForwardEccData3,
        Port0_WrStoreForwardEccData4,
        Port0_PacketAssyDead,
        Port0_ReOrder_Error,
        Port0_ReOrderEccControl,
        Port0_StoreForwardEccControl,
        Port0_ClrMaxBurst,
        Port0_UpdateDMA,
        Port0_UpdateDMALength,
        Port0_UpdateDMANumber,
        Port0_ClearStatistics,
        Port0_WrPacketStuffed,
        Port0_WrPacketXmitted,
        Port0_WrPacketRequested,
        Port0_GatherRequestCount,
        Port0_PacketRequestCount,
        Port0_PktErrAbortCount,
        Port0_ReOrdersStuffed,
        Port0_PacketsStuffed,
        Port0_PacketsTransmitted,
        Port0_BytesTransmitted,
        Port0_MaxReorderNumber,
        Port0_DMA_List,

        Port1_TidsInUse,
        Port1_DuplicateTid,
        Port1_UnInitializedTID,
        Port1_TimedoutTids,
        Port1_ReOrderStateLogic,
        Port1_ReOrderStateControl,
        Port1_ReOrderStateData0,
        Port1_ReOrderStateData1,
        Port1_ReOrderStateData2,
        Port1_ReOrderStateData3,
        Port1_WrTidsInUse,
        Port1_WrDuplicateTid,
        Port1_WrUnInitializedTID,
        Port1_WrTimedoutTids,
        Port1_WrReOrderStateLogic,
        Port1_WrReOrderStateControl,
        Port1_WrReOrderStateData0,
        Port1_WrReOrderStateData1,
        Port1_WrReOrderStateData2,
        Port1_WrReOrderStateData3,
        Port1_PioDataIn,
        Port1_ReOrder_ECC_State,
        Port1_StoreForward_ECC_State,
        Port1_ReOrder_EccData,
        Port1_StoreForward_EccData,
        Port1_ReOrder_ClearEccError,
        Port1_WrReOrderEccState,
        Port1_WrReOrderEccData0,
        Port1_WrReOrderEccData1,
        Port1_WrReOrderEccData2,
        Port1_WrReOrderEccData3,
        Port1_WrReOrderEccData4,
        Port1_StoreForward_ClearEccError,
        Port1_WrStoreForwardEccState,
        Port1_WrStoreForwardEccData0,
        Port1_WrStoreForwardEccData1,
        Port1_WrStoreForwardEccData2,
        Port1_WrStoreForwardEccData3,
        Port1_WrStoreForwardEccData4,
        Port1_PacketAssyDead,
        Port1_ReOrder_Error,
        Port1_ReOrderEccControl,
        Port1_StoreForwardEccControl,
        Port1_ClrMaxBurst,
        Port1_UpdateDMA,
        Port1_UpdateDMALength,
        Port1_UpdateDMANumber,
        Port1_ClearStatistics,
        Port1_WrPacketStuffed,
        Port1_WrPacketXmitted,
        Port1_WrPacketRequested,
        Port1_GatherRequestCount,
        Port1_PacketRequestCount,
        Port1_PktErrAbortCount,
        Port1_ReOrdersStuffed,
        Port1_PacketsStuffed,
        Port1_PacketsTransmitted,
        Port1_BytesTransmitted,
        Port1_MaxReorderNumber,
        Port1_DMA_List,

`ifdef NEPTUNE
        Port2_TidsInUse,
        Port2_DuplicateTid,
        Port2_UnInitializedTID,
        Port2_TimedoutTids,
        Port2_ReOrderStateLogic,
        Port2_ReOrderStateControl,
        Port2_ReOrderStateData0,
        Port2_ReOrderStateData1,
        Port2_ReOrderStateData2,
        Port2_ReOrderStateData3,
        Port2_WrTidsInUse,
        Port2_WrDuplicateTid,
        Port2_WrUnInitializedTID,
        Port2_WrTimedoutTids,
        Port2_WrReOrderStateLogic,
        Port2_WrReOrderStateControl,
        Port2_WrReOrderStateData0,
        Port2_WrReOrderStateData1,
        Port2_WrReOrderStateData2,
        Port2_WrReOrderStateData3,
        Port2_PioDataIn,
        Port2_ReOrder_ECC_State,
        Port2_StoreForward_ECC_State,
        Port2_ReOrder_EccData,
        Port2_StoreForward_EccData,
        Port2_ReOrder_ClearEccError,
        Port2_WrReOrderEccState,
        Port2_WrReOrderEccData0,
        Port2_WrReOrderEccData1,
        Port2_WrReOrderEccData2,
        Port2_WrReOrderEccData3,
        Port2_WrReOrderEccData4,
        Port2_StoreForward_ClearEccError,
        Port2_WrStoreForwardEccState,
        Port2_WrStoreForwardEccData0,
        Port2_WrStoreForwardEccData1,
        Port2_WrStoreForwardEccData2,
        Port2_WrStoreForwardEccData3,
        Port2_WrStoreForwardEccData4,
        Port2_PacketAssyDead,
        Port2_ReOrder_Error,
        Port2_ReOrderEccControl,
        Port2_StoreForwardEccControl,
        Port2_ClrMaxBurst,
        Port2_UpdateDMA,
        Port2_UpdateDMALength,
        Port2_UpdateDMANumber,
        Port2_ClearStatistics,
        Port2_WrPacketStuffed,
        Port2_WrPacketXmitted,
        Port2_WrPacketRequested,
        Port2_GatherRequestCount,
        Port2_PacketRequestCount,
        Port2_PktErrAbortCount,
        Port2_ReOrdersStuffed,
        Port2_PacketsStuffed,
        Port2_PacketsTransmitted,
        Port2_BytesTransmitted,
        Port2_MaxReorderNumber,
        Port2_DMA_List,

        Port3_TidsInUse,
        Port3_DuplicateTid,
        Port3_UnInitializedTID,
        Port3_TimedoutTids,
        Port3_ReOrderStateLogic,
        Port3_ReOrderStateControl,
        Port3_ReOrderStateData0,
        Port3_ReOrderStateData1,
        Port3_ReOrderStateData2,
        Port3_ReOrderStateData3,
        Port3_WrTidsInUse,
        Port3_WrDuplicateTid,
        Port3_WrUnInitializedTID,
        Port3_WrTimedoutTids,
        Port3_WrReOrderStateLogic,
        Port3_WrReOrderStateControl,
        Port3_WrReOrderStateData0,
        Port3_WrReOrderStateData1,
        Port3_WrReOrderStateData2,
        Port3_WrReOrderStateData3,
        Port3_PioDataIn,
        Port3_ReOrder_ECC_State,
        Port3_StoreForward_ECC_State,
        Port3_ReOrder_EccData,
        Port3_StoreForward_EccData,
        Port3_ReOrder_ClearEccError,
        Port3_WrReOrderEccState,
        Port3_WrReOrderEccData0,
        Port3_WrReOrderEccData1,
        Port3_WrReOrderEccData2,
        Port3_WrReOrderEccData3,
        Port3_WrReOrderEccData4,
        Port3_StoreForward_ClearEccError,
        Port3_WrStoreForwardEccState,
        Port3_WrStoreForwardEccData0,
        Port3_WrStoreForwardEccData1,
        Port3_WrStoreForwardEccData2,
        Port3_WrStoreForwardEccData3,
        Port3_WrStoreForwardEccData4,
        Port3_PacketAssyDead,
        Port3_ReOrder_Error,
        Port3_ReOrderEccControl,
        Port3_StoreForwardEccControl,
        Port3_ClrMaxBurst,
        Port3_UpdateDMA,
        Port3_UpdateDMALength,
        Port3_UpdateDMANumber,
        Port3_ClearStatistics,
        Port3_WrPacketStuffed,
        Port3_WrPacketXmitted,
        Port3_WrPacketRequested,
        Port3_GatherRequestCount,
        Port3_PacketRequestCount,
        Port3_PktErrAbortCount,
        Port3_ReOrdersStuffed,
        Port3_PacketsStuffed,
        Port3_PacketsTransmitted,
        Port3_BytesTransmitted,
        Port3_MaxReorderNumber,
        Port3_DMA_List,
`endif

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

        DMA16_NewMaxBurst,
        DMA17_NewMaxBurst,
        DMA18_NewMaxBurst,
        DMA19_NewMaxBurst,
        DMA20_NewMaxBurst,
        DMA21_NewMaxBurst,
        DMA22_NewMaxBurst,
        DMA23_NewMaxBurst,
        DMA16_MaxBurst,
        DMA17_MaxBurst,
        DMA18_MaxBurst,
        DMA19_MaxBurst,
        DMA20_MaxBurst,
        DMA21_MaxBurst,
        DMA22_MaxBurst,
        DMA23_MaxBurst,

        Debug_Select, 
        TrainingVector
       );
    
// Include Header Files
`include "txc_defines.h"
`include "niu_txc_reg_defines.h"

// Global Signals
input          SysClk;
input          Reset_L;

// Interrupts Interface
output         niu_txc_interrupts;

// Slave Interface
input          Slave_32BitMode;
input          Slave_Read;
input          Slave_Sel;
input  [19:0]  Slave_Addr;
input  [31:0]  Slave_DataIn;

output         Slave_Ack;
output         Slave_Err;
output [63:0]  Slave_DataOut;

//
output         Txc_Enabled;
output         MAC0_Enabled;
output         MAC1_Enabled;
output         FlushEngine;
output [5:0]   Debug_Select;
output [31:0]  TrainingVector;

`ifdef NEPTUNE
output         MAC2_Enabled;
output         MAC3_Enabled;
`endif

/*--------------------------------------------------------------*/
// Port 0 Registers
/*--------------------------------------------------------------*/
// Port 0 ReOrder PIO Control Registers
input  [31:0]  Port0_TidsInUse;
input  [31:0]  Port0_DuplicateTid;
input  [31:0]  Port0_UnInitializedTID;
input  [31:0]  Port0_TimedoutTids;
input  [31:0]  Port0_ReOrderStateLogic;
input  [31:0]  Port0_ReOrderStateControl;
input  [31:0]  Port0_ReOrderStateData0;
input  [31:0]  Port0_ReOrderStateData1;
input  [31:0]  Port0_ReOrderStateData2;
input  [31:0]  Port0_ReOrderStateData3;

output         Port0_WrTidsInUse;
output         Port0_WrDuplicateTid;
output         Port0_WrUnInitializedTID;
output         Port0_WrTimedoutTids;
output         Port0_WrReOrderStateLogic;
output         Port0_WrReOrderStateControl;
output         Port0_WrReOrderStateData0;
output         Port0_WrReOrderStateData1;
output         Port0_WrReOrderStateData2;
output         Port0_WrReOrderStateData3;
output [31:0]  Port0_PioDataIn;

// ECC Error Reporting PIO Control Registers
input  [31:0]  Port0_ReOrder_ECC_State;
input  [31:0]  Port0_StoreForward_ECC_State;
input  [151:0] Port0_ReOrder_EccData;
input  [151:0] Port0_StoreForward_EccData;

output         Port0_ReOrder_ClearEccError;
output         Port0_WrReOrderEccState;
output         Port0_WrReOrderEccData0;
output         Port0_WrReOrderEccData1;
output         Port0_WrReOrderEccData2;
output         Port0_WrReOrderEccData3;
output         Port0_WrReOrderEccData4;
output         Port0_StoreForward_ClearEccError;
output         Port0_WrStoreForwardEccState;
output         Port0_WrStoreForwardEccData0;
output         Port0_WrStoreForwardEccData1;
output         Port0_WrStoreForwardEccData2;
output         Port0_WrStoreForwardEccData3;
output         Port0_WrStoreForwardEccData4;

// ECC Control & Status Registers
input          Port0_PacketAssyDead;
input          Port0_ReOrder_Error;

output [31:0]  Port0_ReOrderEccControl;
output [31:0]  Port0_StoreForwardEccControl;

// Diagnostics Control Registers
input  [3:0]   Port0_GatherRequestCount;
input  [11:0]  Port0_PacketRequestCount;
input  [15:0]  Port0_PktErrAbortCount;
input  [15:0]  Port0_ReOrdersStuffed;
input  [15:0]  Port0_PacketsStuffed;
input  [15:0]  Port0_PacketsTransmitted;
input  [15:0]  Port0_BytesTransmitted;

output         Port0_ClearStatistics;
output         Port0_WrPacketStuffed;
output         Port0_WrPacketXmitted;
output         Port0_WrPacketRequested;

// Control Registers
input          Port0_ClrMaxBurst;
input          Port0_UpdateDMA;
input  [13:0]  Port0_UpdateDMALength;
input  [23:0]  Port0_UpdateDMANumber;

output [3:0]   Port0_MaxReorderNumber;
output [23:0]  Port0_DMA_List;

/*--------------------------------------------------------------*/
// Port 1 Registers
/*--------------------------------------------------------------*/
// ReOrder PIO Control Registers
input  [31:0]  Port1_TidsInUse;
input  [31:0]  Port1_DuplicateTid;
input  [31:0]  Port1_UnInitializedTID;
input  [31:0]  Port1_TimedoutTids;
input  [31:0]  Port1_ReOrderStateLogic;
input  [31:0]  Port1_ReOrderStateControl;
input  [31:0]  Port1_ReOrderStateData0;
input  [31:0]  Port1_ReOrderStateData1;
input  [31:0]  Port1_ReOrderStateData2;
input  [31:0]  Port1_ReOrderStateData3;

output         Port1_WrTidsInUse;
output         Port1_WrDuplicateTid;
output         Port1_WrUnInitializedTID;
output         Port1_WrTimedoutTids;
output         Port1_WrReOrderStateLogic;
output         Port1_WrReOrderStateControl;
output         Port1_WrReOrderStateData0;
output         Port1_WrReOrderStateData1;
output         Port1_WrReOrderStateData2;
output         Port1_WrReOrderStateData3;
output [31:0]  Port1_PioDataIn;

// ECC Error Reporting PIO Control Registers
input  [31:0]  Port1_ReOrder_ECC_State;
input  [31:0]  Port1_StoreForward_ECC_State;
input  [151:0] Port1_ReOrder_EccData;
input  [151:0] Port1_StoreForward_EccData;

output         Port1_ReOrder_ClearEccError;
output         Port1_WrReOrderEccState;
output         Port1_WrReOrderEccData0;
output         Port1_WrReOrderEccData1;
output         Port1_WrReOrderEccData2;
output         Port1_WrReOrderEccData3;
output         Port1_WrReOrderEccData4;
output         Port1_StoreForward_ClearEccError;
output         Port1_WrStoreForwardEccState;
output         Port1_WrStoreForwardEccData0;
output         Port1_WrStoreForwardEccData1;
output         Port1_WrStoreForwardEccData2;
output         Port1_WrStoreForwardEccData3;
output         Port1_WrStoreForwardEccData4;

// ECC Control & Status Registers
input          Port1_PacketAssyDead;
input          Port1_ReOrder_Error;

output [31:0]  Port1_ReOrderEccControl;
output [31:0]  Port1_StoreForwardEccControl;

// Diagnostics Control Registers
input  [3:0]   Port1_GatherRequestCount;
input  [11:0]  Port1_PacketRequestCount;
input  [15:0]  Port1_PktErrAbortCount;
input  [15:0]  Port1_ReOrdersStuffed;
input  [15:0]  Port1_PacketsStuffed;
input  [15:0]  Port1_PacketsTransmitted;
input  [15:0]  Port1_BytesTransmitted;

output         Port1_ClearStatistics;
output         Port1_WrPacketStuffed;
output         Port1_WrPacketXmitted;
output         Port1_WrPacketRequested;

// Control Registers
input          Port1_ClrMaxBurst;
input          Port1_UpdateDMA;
input  [13:0]  Port1_UpdateDMALength;
input  [23:0]  Port1_UpdateDMANumber;

output [3:0]   Port1_MaxReorderNumber;
output [23:0]  Port1_DMA_List;

/*--------------------------------------------------------------*/
// Port 2 Registers
/*--------------------------------------------------------------*/
`ifdef NEPTUNE
// ReOrder PIO Control Registers
input  [31:0]  Port2_TidsInUse;
input  [31:0]  Port2_DuplicateTid;
input  [31:0]  Port2_UnInitializedTID;
input  [31:0]  Port2_TimedoutTids;
input  [31:0]  Port2_ReOrderStateLogic;
input  [31:0]  Port2_ReOrderStateControl;
input  [31:0]  Port2_ReOrderStateData0;
input  [31:0]  Port2_ReOrderStateData1;
input  [31:0]  Port2_ReOrderStateData2;
input  [31:0]  Port2_ReOrderStateData3;

output         Port2_WrTidsInUse;
output         Port2_WrDuplicateTid;
output         Port2_WrUnInitializedTID;
output         Port2_WrTimedoutTids;
output         Port2_WrReOrderStateLogic;
output         Port2_WrReOrderStateControl;
output         Port2_WrReOrderStateData0;
output         Port2_WrReOrderStateData1;
output         Port2_WrReOrderStateData2;
output         Port2_WrReOrderStateData3;
output [31:0]  Port2_PioDataIn;

// ECC Error Reporting PIO Control Registers
input  [31:0]  Port2_ReOrder_ECC_State;
input  [31:0]  Port2_StoreForward_ECC_State;
input  [151:0] Port2_ReOrder_EccData;
input  [151:0] Port2_StoreForward_EccData;

output         Port2_ReOrder_ClearEccError;
output         Port2_WrReOrderEccState;
output         Port2_WrReOrderEccData0;
output         Port2_WrReOrderEccData1;
output         Port2_WrReOrderEccData2;
output         Port2_WrReOrderEccData3;
output         Port2_WrReOrderEccData4;
output         Port2_StoreForward_ClearEccError;
output         Port2_WrStoreForwardEccState;
output         Port2_WrStoreForwardEccData0;
output         Port2_WrStoreForwardEccData1;
output         Port2_WrStoreForwardEccData2;
output         Port2_WrStoreForwardEccData3;
output         Port2_WrStoreForwardEccData4;

// ECC Control & Status Registers
input          Port2_PacketAssyDead;
input          Port2_ReOrder_Error;

output [31:0]  Port2_ReOrderEccControl;
output [31:0]  Port2_StoreForwardEccControl;

// Diagnostics Control Registers
input  [3:0]   Port2_GatherRequestCount;
input  [11:0]  Port2_PacketRequestCount;
input  [15:0]  Port2_PktErrAbortCount;
input  [15:0]  Port2_ReOrdersStuffed;
input  [15:0]  Port2_PacketsStuffed;
input  [15:0]  Port2_PacketsTransmitted;
input  [15:0]  Port2_BytesTransmitted;

output         Port2_ClearStatistics;
output         Port2_WrPacketStuffed;
output         Port2_WrPacketXmitted;
output         Port2_WrPacketRequested;

// Control Registers
input          Port2_ClrMaxBurst;
input          Port2_UpdateDMA;
input  [13:0]  Port2_UpdateDMALength;
input  [23:0]  Port2_UpdateDMANumber;

output [3:0]   Port2_MaxReorderNumber;
output [23:0]  Port2_DMA_List;

/*--------------------------------------------------------------*/
// Port 3 Registers
/*--------------------------------------------------------------*/
// ReOrder PIO Control Registers
input  [31:0]  Port3_TidsInUse;
input  [31:0]  Port3_DuplicateTid;
input  [31:0]  Port3_UnInitializedTID;
input  [31:0]  Port3_TimedoutTids;
input  [31:0]  Port3_ReOrderStateLogic;
input  [31:0]  Port3_ReOrderStateControl;
input  [31:0]  Port3_ReOrderStateData0;
input  [31:0]  Port3_ReOrderStateData1;
input  [31:0]  Port3_ReOrderStateData2;
input  [31:0]  Port3_ReOrderStateData3;

output         Port3_WrTidsInUse;
output         Port3_WrDuplicateTid;
output         Port3_WrUnInitializedTID;
output         Port3_WrTimedoutTids;
output         Port3_WrReOrderStateLogic;
output         Port3_WrReOrderStateControl;
output         Port3_WrReOrderStateData0;
output         Port3_WrReOrderStateData1;
output         Port3_WrReOrderStateData2;
output         Port3_WrReOrderStateData3;
output [31:0]  Port3_PioDataIn;

// ECC Error Reporting PIO Control Registers
input  [31:0]  Port3_ReOrder_ECC_State;
input  [31:0]  Port3_StoreForward_ECC_State;
input  [151:0] Port3_ReOrder_EccData;
input  [151:0] Port3_StoreForward_EccData;

output         Port3_ReOrder_ClearEccError;
output         Port3_WrReOrderEccState;
output         Port3_WrReOrderEccData0;
output         Port3_WrReOrderEccData1;
output         Port3_WrReOrderEccData2;
output         Port3_WrReOrderEccData3;
output         Port3_WrReOrderEccData4;
output         Port3_StoreForward_ClearEccError;
output         Port3_WrStoreForwardEccState;
output         Port3_WrStoreForwardEccData0;
output         Port3_WrStoreForwardEccData1;
output         Port3_WrStoreForwardEccData2;
output         Port3_WrStoreForwardEccData3;
output         Port3_WrStoreForwardEccData4;

// ECC Control & Status Registers
input          Port3_PacketAssyDead;
input          Port3_ReOrder_Error;

output [31:0]  Port3_ReOrderEccControl;
output [31:0]  Port3_StoreForwardEccControl;

// Diagnostics Control Registers
input  [3:0]   Port3_GatherRequestCount;
input  [11:0]  Port3_PacketRequestCount;
input  [15:0]  Port3_PktErrAbortCount;
input  [15:0]  Port3_ReOrdersStuffed;
input  [15:0]  Port3_PacketsStuffed;
input  [15:0]  Port3_PacketsTransmitted;
input  [15:0]  Port3_BytesTransmitted;

output         Port3_ClearStatistics;
output         Port3_WrPacketStuffed;
output         Port3_WrPacketXmitted;
output         Port3_WrPacketRequested;

// Control Registers
input          Port3_ClrMaxBurst;
input          Port3_UpdateDMA;
input  [13:0]  Port3_UpdateDMALength;
input  [23:0]  Port3_UpdateDMANumber;

output [3:0]   Port3_MaxReorderNumber;
output [23:0]  Port3_DMA_List;

`endif
/*--------------------------------------------------------------*/
// Port 3 Registers
/*--------------------------------------------------------------*/
output         DMA0_NewMaxBurst;
output         DMA1_NewMaxBurst;
output         DMA2_NewMaxBurst;
output         DMA3_NewMaxBurst;
output         DMA4_NewMaxBurst;
output         DMA5_NewMaxBurst;
output         DMA6_NewMaxBurst;
output         DMA7_NewMaxBurst;
output         DMA8_NewMaxBurst;
output         DMA9_NewMaxBurst;
output         DMA10_NewMaxBurst;
output         DMA11_NewMaxBurst;
output         DMA12_NewMaxBurst;
output         DMA13_NewMaxBurst;
output         DMA14_NewMaxBurst;
output         DMA15_NewMaxBurst;
output [19:0]  DMA0_MaxBurst;
output [19:0]  DMA1_MaxBurst;
output [19:0]  DMA2_MaxBurst;
output [19:0]  DMA3_MaxBurst;
output [19:0]  DMA4_MaxBurst;
output [19:0]  DMA5_MaxBurst;
output [19:0]  DMA6_MaxBurst;
output [19:0]  DMA7_MaxBurst;
output [19:0]  DMA8_MaxBurst;
output [19:0]  DMA9_MaxBurst;
output [19:0]  DMA10_MaxBurst;
output [19:0]  DMA11_MaxBurst;
output [19:0]  DMA12_MaxBurst;
output [19:0]  DMA13_MaxBurst;
output [19:0]  DMA14_MaxBurst;

output         DMA16_NewMaxBurst;
output         DMA17_NewMaxBurst;
output         DMA18_NewMaxBurst;
output         DMA19_NewMaxBurst;
output         DMA20_NewMaxBurst;
output         DMA21_NewMaxBurst;
output         DMA22_NewMaxBurst;
output         DMA23_NewMaxBurst;
output [19:0]  DMA15_MaxBurst;
output [19:0]  DMA16_MaxBurst;
output [19:0]  DMA17_MaxBurst;
output [19:0]  DMA18_MaxBurst;
output [19:0]  DMA19_MaxBurst;
output [19:0]  DMA20_MaxBurst;
output [19:0]  DMA21_MaxBurst;
output [19:0]  DMA22_MaxBurst;
output [19:0]  DMA23_MaxBurst;

/*--------------------------------------------------------------*/
// Wires & Registers
/*--------------------------------------------------------------*/
wire           slaveStrobe;
wire           posEdgeWritePort0;
wire           read_Port0_Register;
wire           write_Port0_Register;
wire           read_DMA0_Register;
wire           read_DMA1_Register;
wire           read_DMA2_Register;
wire           read_DMA3_Register;
wire           read_DMA4_Register;
wire           read_DMA5_Register;
wire           read_DMA6_Register;
wire           read_DMA7_Register;
wire           read_DMA8_Register;
wire           read_DMA9_Register;
wire           read_DMA10_Register;
wire           read_DMA11_Register;
wire           read_DMA12_Register;
wire           read_DMA13_Register;
wire           read_DMA14_Register;
wire           read_DMA15_Register;
wire           write_DMA0_Register;
wire           write_DMA1_Register;
wire           write_DMA2_Register;
wire           write_DMA3_Register;
wire           write_DMA4_Register;
wire           write_DMA5_Register;
wire           write_DMA6_Register;
wire           write_DMA7_Register;
wire           write_DMA8_Register;
wire           write_DMA9_Register;
wire           write_DMA10_Register;
wire           write_DMA11_Register;
wire           write_DMA12_Register;
wire           write_DMA13_Register;
wire           write_DMA14_Register;
wire           write_DMA15_Register;
wire   [8:2]   slaveAddrB1;
wire   [11:2]  slaveAddrB0;
wire   [31:0]  dMA0to3_Slave_Data;
wire   [31:0]  dMA4to7_Slave_Data;
wire   [31:0]  dMA8to11_Slave_Data;
wire   [31:0]  dMA12to15_Slave_Data;
wire   [31:0]  port0to1_Slave_Data;
wire   [31:0]  slaveDataIn;


`ifdef NEPTUNE
wire           posEdgeWritePort2;
wire           read_Port2_Register;
wire           write_Port2_Register;
wire           read_DMA16_Register;
wire           read_DMA17_Register;
wire           read_DMA18_Register;
wire           read_DMA19_Register;
wire           read_DMA20_Register;
wire           read_DMA21_Register;
wire           read_DMA22_Register;
wire           read_DMA23_Register;
wire           write_DMA16_Register;
wire           write_DMA17_Register;
wire           write_DMA18_Register;
wire           write_DMA19_Register;
wire           write_DMA20_Register;
wire           write_DMA21_Register;
wire           write_DMA22_Register;
wire           write_DMA23_Register;
wire   [31:0]  dMA16to19_Slave_Data;
wire   [31:0]  dMA20to23_Slave_Data;
wire   [31:0]  port2to3_Slave_Data;
`endif

/*--------------------------------------------------------------*/
// Parameters and Defines
/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/
// Zero In Checks
/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/
// Ifdef NEPTUNE assigns
/*--------------------------------------------------------------*/
`ifdef NEPTUNE
`else
assign DMA16_NewMaxBurst = 1'b0;
assign DMA16_MaxBurst    = 20'h0;

assign DMA17_NewMaxBurst = 1'b0;
assign DMA17_MaxBurst    = 20'h0;

assign DMA18_NewMaxBurst = 1'b0;
assign DMA18_MaxBurst    = 20'h0;

assign DMA19_NewMaxBurst = 1'b0;
assign DMA19_MaxBurst    = 20'h0;

assign DMA20_NewMaxBurst = 1'b0;
assign DMA20_MaxBurst    = 20'h0;

assign DMA21_NewMaxBurst = 1'b0;
assign DMA21_MaxBurst    = 20'h0;

assign DMA22_NewMaxBurst = 1'b0;
assign DMA22_MaxBurst    = 20'h0;

assign DMA23_NewMaxBurst = 1'b0;
assign DMA23_MaxBurst    = 20'h0;
`endif

/*--------------------------------------------------------------*/
// TXC Global Control PIO  Read & Write Registers
/*--------------------------------------------------------------*/

niu_txc_RegisterControl niu_txc_RegisterControl (
        .SysClk                            (SysClk),
        .Reset_L                           (Reset_L), 
        .niu_txc_interrupts                (niu_txc_interrupts), 

        .Slave_32BitMode                   (Slave_32BitMode),
        .Slave_Read                        (Slave_Read),
        .Slave_Sel                         (Slave_Sel),
        .Slave_Addr                        (Slave_Addr),
        .Slave_DataIn                      (Slave_DataIn),
        .Slave_Ack                         (Slave_Ack),
        .Slave_Err                         (Slave_Err),
        .SlaveStrobe                       (slaveStrobe),
        .SlaveAddrB0                       (slaveAddrB0[11:2]),
        .SlaveAddrB1                       (slaveAddrB1[8:2]),
        .SlaveDataInB0                     (slaveDataIn),
        .Slave_DataOut                     (Slave_DataOut),

        .Txc_Enabled                       (Txc_Enabled), 
        .Port0_Enabled                     (MAC0_Enabled), 
        .Port1_Enabled                     (MAC1_Enabled), 
`ifdef NEPTUNE
        .Port2_Enabled                     (MAC2_Enabled), 
        .Port3_Enabled                     (MAC3_Enabled), 
`endif
        .FlushEngine                       (FlushEngine), 

        .DMA0to3_Slave_Data                (dMA0to3_Slave_Data),
        .DMA4to7_Slave_Data                (dMA4to7_Slave_Data),
        .DMA8to11_Slave_Data               (dMA8to11_Slave_Data),
        .DMA12to15_Slave_Data              (dMA12to15_Slave_Data),
        .Read_DMA0_Register                (read_DMA0_Register),
        .Read_DMA1_Register                (read_DMA1_Register),
        .Read_DMA2_Register                (read_DMA2_Register),
        .Read_DMA3_Register                (read_DMA3_Register),
        .Read_DMA4_Register                (read_DMA4_Register),
        .Read_DMA5_Register                (read_DMA5_Register),
        .Read_DMA6_Register                (read_DMA6_Register),
        .Read_DMA7_Register                (read_DMA7_Register),
        .Read_DMA8_Register                (read_DMA8_Register),
        .Read_DMA9_Register                (read_DMA9_Register),
        .Read_DMA10_Register               (read_DMA10_Register),
        .Read_DMA11_Register               (read_DMA11_Register),
        .Read_DMA12_Register               (read_DMA12_Register),
        .Read_DMA13_Register               (read_DMA13_Register),
        .Read_DMA14_Register               (read_DMA14_Register),
        .Read_DMA15_Register               (read_DMA15_Register),
        .Write_DMA0_Register               (write_DMA0_Register),
        .Write_DMA1_Register               (write_DMA1_Register),
        .Write_DMA2_Register               (write_DMA2_Register),
        .Write_DMA3_Register               (write_DMA3_Register),
        .Write_DMA4_Register               (write_DMA4_Register),
        .Write_DMA5_Register               (write_DMA5_Register),
        .Write_DMA6_Register               (write_DMA6_Register),
        .Write_DMA7_Register               (write_DMA7_Register),
        .Write_DMA8_Register               (write_DMA8_Register),
        .Write_DMA9_Register               (write_DMA9_Register),
        .Write_DMA10_Register              (write_DMA10_Register),
        .Write_DMA11_Register              (write_DMA11_Register),
        .Write_DMA12_Register              (write_DMA12_Register),
        .Write_DMA13_Register              (write_DMA13_Register),
        .Write_DMA14_Register              (write_DMA14_Register),
        .Write_DMA15_Register              (write_DMA15_Register),

`ifdef NEPTUNE
        .DMA16to19_Slave_Data              (dMA16to19_Slave_Data),
        .DMA20to23_Slave_Data              (dMA20to23_Slave_Data),
        .Read_DMA16_Register               (read_DMA16_Register),
        .Read_DMA17_Register               (read_DMA17_Register),
        .Read_DMA18_Register               (read_DMA18_Register),
        .Read_DMA19_Register               (read_DMA19_Register),
        .Read_DMA20_Register               (read_DMA20_Register),
        .Read_DMA21_Register               (read_DMA21_Register),
        .Read_DMA22_Register               (read_DMA22_Register),
        .Read_DMA23_Register               (read_DMA23_Register),
        .Write_DMA16_Register              (write_DMA16_Register),
        .Write_DMA17_Register              (write_DMA17_Register),
        .Write_DMA18_Register              (write_DMA18_Register),
        .Write_DMA19_Register              (write_DMA19_Register),
        .Write_DMA20_Register              (write_DMA20_Register),
        .Write_DMA21_Register              (write_DMA21_Register),
        .Write_DMA22_Register              (write_DMA22_Register),
        .Write_DMA23_Register              (write_DMA23_Register),
`endif

        .Port0to1_Slave_Data               (port0to1_Slave_Data),
        .Read_Port0_Register               (read_Port0_Register),
        .Write_Port0_Register              (write_Port0_Register),
        .PosEdgeWritePort0                 (posEdgeWritePort0),

`ifdef NEPTUNE
        .Port2to3_Slave_Data               (port2to3_Slave_Data),
        .Read_Port2_Register               (read_Port2_Register),
        .Write_Port2_Register              (write_Port2_Register),
        .PosEdgeWritePort2                 (posEdgeWritePort2),
`endif

        .Port0_PioDataIn                   (Port0_PioDataIn),
        .Port0_ReOrder_ECC_State           (Port0_ReOrder_ECC_State[17:16]),
        .Port0_StoreForward_ECC_State      (Port0_StoreForward_ECC_State[17:16]),
        .Port0_PacketAssyDead              (Port0_PacketAssyDead),
        .Port0_ReOrder_Error               (Port0_ReOrder_Error),
        .Port0_MaxReorderNumber            (Port0_MaxReorderNumber),

        .Port1_PioDataIn                   (Port1_PioDataIn),
        .Port1_ReOrder_ECC_State           (Port1_ReOrder_ECC_State[17:16]),
        .Port1_StoreForward_ECC_State      (Port1_StoreForward_ECC_State[17:16]),
        .Port1_PacketAssyDead              (Port1_PacketAssyDead),
        .Port1_ReOrder_Error               (Port1_ReOrder_Error),
        .Port1_MaxReorderNumber            (Port1_MaxReorderNumber),

`ifdef NEPTUNE
        .Port2_PioDataIn                   (Port2_PioDataIn),
        .Port2_ReOrder_ECC_State           (Port2_ReOrder_ECC_State[17:16]),
        .Port2_StoreForward_ECC_State      (Port2_StoreForward_ECC_State[17:16]),
        .Port2_PacketAssyDead              (Port2_PacketAssyDead),
        .Port2_ReOrder_Error               (Port2_ReOrder_Error),
        .Port2_MaxReorderNumber            (Port2_MaxReorderNumber),

        .Port3_PioDataIn                   (Port3_PioDataIn),
        .Port3_ReOrder_ECC_State           (Port3_ReOrder_ECC_State[17:16]),
        .Port3_StoreForward_ECC_State      (Port3_StoreForward_ECC_State[17:16]),
        .Port3_PacketAssyDead              (Port3_PacketAssyDead),
        .Port3_ReOrder_Error               (Port3_ReOrder_Error),
        .Port3_MaxReorderNumber            (Port3_MaxReorderNumber),
`endif
        .Debug_Select                      (Debug_Select), 
        .TrainingVector                    (TrainingVector)
       );

/*--------------------------------------------------------------*/
// TXC DMAs 0-3 PIO Read & Write Registers
/*--------------------------------------------------------------*/

niu_txc_dmaRegisters niu_txc_dma0to3Registers (
        .SysClk                            (SysClk),
        .Reset_L                           (Reset_L),
        .Read_DMA0_Register                (read_DMA0_Register),
        .Read_DMA1_Register                (read_DMA1_Register),
        .Read_DMA2_Register                (read_DMA2_Register),
        .Read_DMA3_Register                (read_DMA3_Register),
        .Write_DMA0_Register               (write_DMA0_Register),
        .Write_DMA1_Register               (write_DMA1_Register),
        .Write_DMA2_Register               (write_DMA2_Register),
        .Write_DMA3_Register               (write_DMA3_Register),
        .SlaveStrobe                       (slaveStrobe),
        .SlaveAddr                         (slaveAddrB0[11:2]),
        .SlaveDataIn                       (slaveDataIn[27:0]),
        .DMA_Slave_DataOut                 (dMA0to3_Slave_Data),
        .Port0_ClrMaxBurst                 (Port0_ClrMaxBurst),
        .Port0_UpdateDMA                   (Port0_UpdateDMA),
        .Port0_DMA_List                    (Port0_DMA_List[3:0]),
        .Port0_UpdateDMANumber             (Port0_UpdateDMANumber[3:0]),
        .Port0_UpdateDMALength             (Port0_UpdateDMALength),
        .Port1_ClrMaxBurst                 (Port1_ClrMaxBurst),
        .Port1_UpdateDMA                   (Port1_UpdateDMA),
        .Port1_DMA_List                    (Port1_DMA_List[3:0]),
        .Port1_UpdateDMANumber             (Port1_UpdateDMANumber[3:0]),
        .Port1_UpdateDMALength             (Port1_UpdateDMALength),
`ifdef NEPTUNE
        .Port2_ClrMaxBurst                 (Port2_ClrMaxBurst),
        .Port2_UpdateDMA                   (Port2_UpdateDMA),
        .Port2_DMA_List                    (Port2_DMA_List[3:0]),
        .Port2_UpdateDMANumber             (Port2_UpdateDMANumber[3:0]),
        .Port2_UpdateDMALength             (Port2_UpdateDMALength),
        .Port3_ClrMaxBurst                 (Port3_ClrMaxBurst),
        .Port3_UpdateDMA                   (Port3_UpdateDMA),
        .Port3_DMA_List                    (Port3_DMA_List[3:0]),
        .Port3_UpdateDMANumber             (Port3_UpdateDMANumber[3:0]),
        .Port3_UpdateDMALength             (Port3_UpdateDMALength),
`endif
        .DMA0_NewMaxBurst                  (DMA0_NewMaxBurst),
        .DMA0_MaxBurst                     (DMA0_MaxBurst),
        .DMA1_NewMaxBurst                  (DMA1_NewMaxBurst),
        .DMA1_MaxBurst                     (DMA1_MaxBurst),
        .DMA2_NewMaxBurst                  (DMA2_NewMaxBurst),
        .DMA2_MaxBurst                     (DMA2_MaxBurst),
        .DMA3_NewMaxBurst                  (DMA3_NewMaxBurst),
        .DMA3_MaxBurst                     (DMA3_MaxBurst)
       );

/*--------------------------------------------------------------*/
// TXC DMAs 4-7 PIO Read & Write Registers
/*--------------------------------------------------------------*/

niu_txc_dmaRegisters niu_txc_dma4to7Registers (
        .SysClk                            (SysClk),
        .Reset_L                           (Reset_L),
        .Read_DMA0_Register                (read_DMA4_Register),
        .Read_DMA1_Register                (read_DMA5_Register),
        .Read_DMA2_Register                (read_DMA6_Register),
        .Read_DMA3_Register                (read_DMA7_Register),
        .Write_DMA0_Register               (write_DMA4_Register),
        .Write_DMA1_Register               (write_DMA5_Register),
        .Write_DMA2_Register               (write_DMA6_Register),
        .Write_DMA3_Register               (write_DMA7_Register),
        .SlaveStrobe                       (slaveStrobe),
        .SlaveAddr                         (slaveAddrB0[11:2]),
        .SlaveDataIn                       (slaveDataIn[27:0]),
        .DMA_Slave_DataOut                 (dMA4to7_Slave_Data),
        .Port0_ClrMaxBurst                 (Port0_ClrMaxBurst),
        .Port0_UpdateDMA                   (Port0_UpdateDMA),
        .Port0_DMA_List                    (Port0_DMA_List[7:4]),
        .Port0_UpdateDMANumber             (Port0_UpdateDMANumber[7:4]),
        .Port0_UpdateDMALength             (Port0_UpdateDMALength),
        .Port1_ClrMaxBurst                 (Port1_ClrMaxBurst),
        .Port1_UpdateDMA                   (Port1_UpdateDMA),
        .Port1_DMA_List                    (Port1_DMA_List[7:4]),
        .Port1_UpdateDMANumber             (Port1_UpdateDMANumber[7:4]),
        .Port1_UpdateDMALength             (Port1_UpdateDMALength),
`ifdef NEPTUNE
        .Port2_ClrMaxBurst                 (Port2_ClrMaxBurst),
        .Port2_UpdateDMA                   (Port2_UpdateDMA),
        .Port2_DMA_List                    (Port2_DMA_List[7:4]),
        .Port2_UpdateDMANumber             (Port2_UpdateDMANumber[7:4]),
        .Port2_UpdateDMALength             (Port2_UpdateDMALength),
        .Port3_ClrMaxBurst                 (Port3_ClrMaxBurst),
        .Port3_UpdateDMA                   (Port3_UpdateDMA),
        .Port3_DMA_List                    (Port3_DMA_List[7:4]),
        .Port3_UpdateDMANumber             (Port3_UpdateDMANumber[7:4]),
        .Port3_UpdateDMALength             (Port3_UpdateDMALength),
`endif
        .DMA0_NewMaxBurst                  (DMA4_NewMaxBurst),
        .DMA0_MaxBurst                     (DMA4_MaxBurst),
        .DMA1_NewMaxBurst                  (DMA5_NewMaxBurst),
        .DMA1_MaxBurst                     (DMA5_MaxBurst),
        .DMA2_NewMaxBurst                  (DMA6_NewMaxBurst),
        .DMA2_MaxBurst                     (DMA6_MaxBurst),
        .DMA3_NewMaxBurst                  (DMA7_NewMaxBurst),
        .DMA3_MaxBurst                     (DMA7_MaxBurst)
       );

/*--------------------------------------------------------------*/
// TXC DMAs 8-11 PIO Read & Write Registers
/*--------------------------------------------------------------*/

niu_txc_dmaRegisters niu_txc_dma8to11Registers (
        .SysClk                            (SysClk),
        .Reset_L                           (Reset_L),
        .Read_DMA0_Register                (read_DMA8_Register),
        .Read_DMA1_Register                (read_DMA9_Register),
        .Read_DMA2_Register                (read_DMA10_Register),
        .Read_DMA3_Register                (read_DMA11_Register),
        .Write_DMA0_Register               (write_DMA8_Register),
        .Write_DMA1_Register               (write_DMA9_Register),
        .Write_DMA2_Register               (write_DMA10_Register),
        .Write_DMA3_Register               (write_DMA11_Register),
        .SlaveStrobe                       (slaveStrobe),
        .SlaveAddr                         (slaveAddrB0[11:2]),
        .SlaveDataIn                       (slaveDataIn[27:0]),
        .DMA_Slave_DataOut                 (dMA8to11_Slave_Data),
        .Port0_ClrMaxBurst                 (Port0_ClrMaxBurst),
        .Port0_UpdateDMA                   (Port0_UpdateDMA),
        .Port0_DMA_List                    (Port0_DMA_List[11:8]),
        .Port0_UpdateDMANumber             (Port0_UpdateDMANumber[11:8]),
        .Port0_UpdateDMALength             (Port0_UpdateDMALength),
        .Port1_ClrMaxBurst                 (Port1_ClrMaxBurst),
        .Port1_UpdateDMA                   (Port1_UpdateDMA),
        .Port1_DMA_List                    (Port1_DMA_List[11:8]),
        .Port1_UpdateDMANumber             (Port1_UpdateDMANumber[11:8]),
        .Port1_UpdateDMALength             (Port1_UpdateDMALength),
`ifdef NEPTUNE
        .Port2_ClrMaxBurst                 (Port2_ClrMaxBurst),
        .Port2_UpdateDMA                   (Port2_UpdateDMA),
        .Port2_DMA_List                    (Port2_DMA_List[11:8]),
        .Port2_UpdateDMANumber             (Port2_UpdateDMANumber[11:8]),
        .Port2_UpdateDMALength             (Port2_UpdateDMALength),
        .Port3_ClrMaxBurst                 (Port3_ClrMaxBurst),
        .Port3_UpdateDMA                   (Port3_UpdateDMA),
        .Port3_DMA_List                    (Port3_DMA_List[11:8]),
        .Port3_UpdateDMANumber             (Port3_UpdateDMANumber[11:8]),
        .Port3_UpdateDMALength             (Port3_UpdateDMALength),
`endif
        .DMA0_NewMaxBurst                  (DMA8_NewMaxBurst),
        .DMA0_MaxBurst                     (DMA8_MaxBurst),
        .DMA1_NewMaxBurst                  (DMA9_NewMaxBurst),
        .DMA1_MaxBurst                     (DMA9_MaxBurst),
        .DMA2_NewMaxBurst                  (DMA10_NewMaxBurst),
        .DMA2_MaxBurst                     (DMA10_MaxBurst),
        .DMA3_NewMaxBurst                  (DMA11_NewMaxBurst),
        .DMA3_MaxBurst                     (DMA11_MaxBurst)
       );

/*--------------------------------------------------------------*/
// TXC DMAs 12-15 PIO Read & Write Registers
/*--------------------------------------------------------------*/

niu_txc_dmaRegisters niu_txc_dma12to15Registers (
        .SysClk                            (SysClk),
        .Reset_L                           (Reset_L),
        .Read_DMA0_Register                (read_DMA12_Register),
        .Read_DMA1_Register                (read_DMA13_Register),
        .Read_DMA2_Register                (read_DMA14_Register),
        .Read_DMA3_Register                (read_DMA15_Register),
        .Write_DMA0_Register               (write_DMA12_Register),
        .Write_DMA1_Register               (write_DMA13_Register),
        .Write_DMA2_Register               (write_DMA14_Register),
        .Write_DMA3_Register               (write_DMA15_Register),
        .SlaveStrobe                       (slaveStrobe),
        .SlaveAddr                         (slaveAddrB0[11:2]),
        .SlaveDataIn                       (slaveDataIn[27:0]),
        .DMA_Slave_DataOut                 (dMA12to15_Slave_Data),
        .Port0_ClrMaxBurst                 (Port0_ClrMaxBurst),
        .Port0_UpdateDMA                   (Port0_UpdateDMA),
        .Port0_DMA_List                    (Port0_DMA_List[15:12]),
        .Port0_UpdateDMANumber             (Port0_UpdateDMANumber[15:12]),
        .Port0_UpdateDMALength             (Port0_UpdateDMALength),
        .Port1_ClrMaxBurst                 (Port1_ClrMaxBurst),
        .Port1_UpdateDMA                   (Port1_UpdateDMA),
        .Port1_DMA_List                    (Port1_DMA_List[15:12]),
        .Port1_UpdateDMANumber             (Port1_UpdateDMANumber[15:12]),
        .Port1_UpdateDMALength             (Port1_UpdateDMALength),
`ifdef NEPTUNE
        .Port2_ClrMaxBurst                 (Port2_ClrMaxBurst),
        .Port2_UpdateDMA                   (Port2_UpdateDMA),
        .Port2_DMA_List                    (Port2_DMA_List[15:12]),
        .Port2_UpdateDMANumber             (Port2_UpdateDMANumber[15:12]),
        .Port2_UpdateDMALength             (Port2_UpdateDMALength),
        .Port3_ClrMaxBurst                 (Port3_ClrMaxBurst),
        .Port3_UpdateDMA                   (Port3_UpdateDMA),
        .Port3_DMA_List                    (Port3_DMA_List[15:12]),
        .Port3_UpdateDMANumber             (Port3_UpdateDMANumber[15:12]),
        .Port3_UpdateDMALength             (Port3_UpdateDMALength),
`endif
        .DMA0_NewMaxBurst                  (DMA12_NewMaxBurst),
        .DMA0_MaxBurst                     (DMA12_MaxBurst),
        .DMA1_NewMaxBurst                  (DMA13_NewMaxBurst),
        .DMA1_MaxBurst                     (DMA13_MaxBurst),
        .DMA2_NewMaxBurst                  (DMA14_NewMaxBurst),
        .DMA2_MaxBurst                     (DMA14_MaxBurst),
        .DMA3_NewMaxBurst                  (DMA15_NewMaxBurst),
        .DMA3_MaxBurst                     (DMA15_MaxBurst)
       );

`ifdef NEPTUNE
/*--------------------------------------------------------------*/
// TXC DMAs 16-19 PIO Read & Write Registers
/*--------------------------------------------------------------*/

niu_txc_dmaRegisters niu_txc_dma16to19Registers (
        .SysClk                            (SysClk),
        .Reset_L                           (Reset_L),
        .Read_DMA0_Register                (read_DMA16_Register),
        .Read_DMA1_Register                (read_DMA17_Register),
        .Read_DMA2_Register                (read_DMA18_Register),
        .Read_DMA3_Register                (read_DMA19_Register),
        .Write_DMA0_Register               (write_DMA16_Register),
        .Write_DMA1_Register               (write_DMA17_Register),
        .Write_DMA2_Register               (write_DMA18_Register),
        .Write_DMA3_Register               (write_DMA19_Register),
        .SlaveStrobe                       (slaveStrobe),
        .SlaveAddr                         (slaveAddrB0[11:2]),
        .SlaveDataIn                       (slaveDataIn[27:0]),
        .DMA_Slave_DataOut                 (dMA16to19_Slave_Data),
        .Port0_ClrMaxBurst                 (Port0_ClrMaxBurst),
        .Port0_UpdateDMA                   (Port0_UpdateDMA),
        .Port0_DMA_List                    (Port0_DMA_List[19:16]),
        .Port0_UpdateDMANumber             (Port0_UpdateDMANumber[19:16]),
        .Port0_UpdateDMALength             (Port0_UpdateDMALength),
        .Port1_ClrMaxBurst                 (Port1_ClrMaxBurst),
        .Port1_UpdateDMA                   (Port1_UpdateDMA),
        .Port1_DMA_List                    (Port1_DMA_List[19:16]),
        .Port1_UpdateDMANumber             (Port1_UpdateDMANumber[19:16]),
        .Port1_UpdateDMALength             (Port1_UpdateDMALength),
`ifdef NEPTUNE
        .Port2_ClrMaxBurst                 (Port2_ClrMaxBurst),
        .Port2_UpdateDMA                   (Port2_UpdateDMA),
        .Port2_DMA_List                    (Port2_DMA_List[19:16]),
        .Port2_UpdateDMANumber             (Port2_UpdateDMANumber[19:16]),
        .Port2_UpdateDMALength             (Port2_UpdateDMALength),
        .Port3_ClrMaxBurst                 (Port3_ClrMaxBurst),
        .Port3_UpdateDMA                   (Port3_UpdateDMA),
        .Port3_DMA_List                    (Port3_DMA_List[19:16]),
        .Port3_UpdateDMANumber             (Port3_UpdateDMANumber[19:16]),
        .Port3_UpdateDMALength             (Port3_UpdateDMALength),
`endif
        .DMA0_NewMaxBurst                  (DMA16_NewMaxBurst),
        .DMA0_MaxBurst                     (DMA16_MaxBurst),
        .DMA1_NewMaxBurst                  (DMA17_NewMaxBurst),
        .DMA1_MaxBurst                     (DMA17_MaxBurst),
        .DMA2_NewMaxBurst                  (DMA18_NewMaxBurst),
        .DMA2_MaxBurst                     (DMA18_MaxBurst),
        .DMA3_NewMaxBurst                  (DMA19_NewMaxBurst),
        .DMA3_MaxBurst                     (DMA19_MaxBurst)
       );

/*--------------------------------------------------------------*/
// TXC DMAs 20-23 PIO Read & Write Registers
/*--------------------------------------------------------------*/

niu_txc_dmaRegisters niu_txc_dma20to23Registers (
        .SysClk                            (SysClk),
        .Reset_L                           (Reset_L),
        .Read_DMA0_Register                (read_DMA20_Register),
        .Read_DMA1_Register                (read_DMA21_Register),
        .Read_DMA2_Register                (read_DMA22_Register),
        .Read_DMA3_Register                (read_DMA23_Register),
        .Write_DMA0_Register               (write_DMA20_Register),
        .Write_DMA1_Register               (write_DMA21_Register),
        .Write_DMA2_Register               (write_DMA22_Register),
        .Write_DMA3_Register               (write_DMA23_Register),
        .SlaveStrobe                       (slaveStrobe),
        .SlaveAddr                         (slaveAddrB0[11:2]),
        .SlaveDataIn                       (slaveDataIn[27:0]),
        .DMA_Slave_DataOut                 (dMA20to23_Slave_Data),
        .Port0_ClrMaxBurst                 (Port0_ClrMaxBurst),
        .Port0_UpdateDMA                   (Port0_UpdateDMA),
        .Port0_DMA_List                    (Port0_DMA_List[23:20]),
        .Port0_UpdateDMANumber             (Port0_UpdateDMANumber[23:20]),
        .Port0_UpdateDMALength             (Port0_UpdateDMALength),
        .Port1_ClrMaxBurst                 (Port1_ClrMaxBurst),
        .Port1_UpdateDMA                   (Port1_UpdateDMA),
        .Port1_DMA_List                    (Port1_DMA_List[23:20]),
        .Port1_UpdateDMANumber             (Port1_UpdateDMANumber[23:20]),
        .Port1_UpdateDMALength             (Port1_UpdateDMALength),
`ifdef NEPTUNE
        .Port2_ClrMaxBurst                 (Port2_ClrMaxBurst),
        .Port2_UpdateDMA                   (Port2_UpdateDMA),
        .Port2_DMA_List                    (Port2_DMA_List[23:20]),
        .Port2_UpdateDMANumber             (Port2_UpdateDMANumber[23:20]),
        .Port2_UpdateDMALength             (Port2_UpdateDMALength),
        .Port3_ClrMaxBurst                 (Port3_ClrMaxBurst),
        .Port3_UpdateDMA                   (Port3_UpdateDMA),
        .Port3_DMA_List                    (Port3_DMA_List[23:20]),
        .Port3_UpdateDMANumber             (Port3_UpdateDMANumber[23:20]),
        .Port3_UpdateDMALength             (Port3_UpdateDMALength),
`endif
        .DMA0_NewMaxBurst                  (DMA20_NewMaxBurst),
        .DMA0_MaxBurst                     (DMA20_MaxBurst),
        .DMA1_NewMaxBurst                  (DMA21_NewMaxBurst),
        .DMA1_MaxBurst                     (DMA21_MaxBurst),
        .DMA2_NewMaxBurst                  (DMA22_NewMaxBurst),
        .DMA2_MaxBurst                     (DMA22_MaxBurst),
        .DMA3_NewMaxBurst                  (DMA23_NewMaxBurst),
        .DMA3_MaxBurst                     (DMA23_MaxBurst)
       );
`endif

/*--------------------------------------------------------------*/
// End DMA Registers
/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/
// Ports 0 & 1 PIO Read & Write Registers
/*--------------------------------------------------------------*/

niu_txc_portRegisters  niu_txc_port0and1Registers (
        .SysClk                            (SysClk),
        .Reset_L                           (Reset_L),
        .ReadPortRegister                  (read_Port0_Register),
        .WritePortRegister                 (write_Port0_Register),
        .PosEdgeWritePort                  (posEdgeWritePort0),
        .Slave_Addr                        (slaveAddrB1[8:2]),
        .Slave_DataIn                      (slaveDataIn),
        .Slave_DataOut                     (port0to1_Slave_Data),
        .Port0_TidsInUse                   (Port0_TidsInUse),
        .Port0_DuplicateTid                (Port0_DuplicateTid),
        .Port0_UnInitializedTID            (Port0_UnInitializedTID),
        .Port0_TimedoutTids                (Port0_TimedoutTids),
        .Port0_ReOrderStateLogic           (Port0_ReOrderStateLogic),
        .Port0_ReOrderStateControl         (Port0_ReOrderStateControl),
        .Port0_ReOrderStateData0           (Port0_ReOrderStateData0),
        .Port0_ReOrderStateData1           (Port0_ReOrderStateData1),
        .Port0_ReOrderStateData2           (Port0_ReOrderStateData2),
        .Port0_ReOrderStateData3           (Port0_ReOrderStateData3),
        .Port0_WrTidsInUse                 (Port0_WrTidsInUse),
        .Port0_WrDuplicateTid              (Port0_WrDuplicateTid),
        .Port0_WrUnInitializedTID          (Port0_WrUnInitializedTID),
        .Port0_WrTimedoutTids              (Port0_WrTimedoutTids),
        .Port0_WrReOrderStateLogic         (Port0_WrReOrderStateLogic),
        .Port0_WrReOrderStateControl       (Port0_WrReOrderStateControl),
        .Port0_WrReOrderStateData0         (Port0_WrReOrderStateData0),
        .Port0_WrReOrderStateData1         (Port0_WrReOrderStateData1),
        .Port0_WrReOrderStateData2         (Port0_WrReOrderStateData2),
        .Port0_WrReOrderStateData3         (Port0_WrReOrderStateData3),
        .Port0_ReOrder_ECC_State           (Port0_ReOrder_ECC_State),
        .Port0_StoreForward_ECC_State      (Port0_StoreForward_ECC_State),
        .Port0_ReOrder_EccData             (Port0_ReOrder_EccData),
        .Port0_StoreForward_EccData        (Port0_StoreForward_EccData),
        .Port0_ReOrder_ClearEccError       (Port0_ReOrder_ClearEccError),
        .Port0_WrReOrderEccState           (Port0_WrReOrderEccState),
        .Port0_WrReOrderEccData0           (Port0_WrReOrderEccData0),
        .Port0_WrReOrderEccData1           (Port0_WrReOrderEccData1),
        .Port0_WrReOrderEccData2           (Port0_WrReOrderEccData2),
        .Port0_WrReOrderEccData3           (Port0_WrReOrderEccData3),
        .Port0_WrReOrderEccData4           (Port0_WrReOrderEccData4),
        .Port0_StoreForward_ClearEccError  (Port0_StoreForward_ClearEccError),
        .Port0_WrStoreForwardEccState      (Port0_WrStoreForwardEccState),
        .Port0_WrStoreForwardEccData0      (Port0_WrStoreForwardEccData0),
        .Port0_WrStoreForwardEccData1      (Port0_WrStoreForwardEccData1),
        .Port0_WrStoreForwardEccData2      (Port0_WrStoreForwardEccData2),
        .Port0_WrStoreForwardEccData3      (Port0_WrStoreForwardEccData3),
        .Port0_WrStoreForwardEccData4      (Port0_WrStoreForwardEccData4),
        .Port0_ReOrderEccControl           (Port0_ReOrderEccControl),
        .Port0_StoreForwardEccControl      (Port0_StoreForwardEccControl),
        .Port0_ClearStatistics             (Port0_ClearStatistics),
        .Port0_WrPacketStuffed             (Port0_WrPacketStuffed),
        .Port0_WrPacketXmitted             (Port0_WrPacketXmitted),
        .Port0_WrPacketRequested           (Port0_WrPacketRequested),
        .Port0_GatherRequestCount          (Port0_GatherRequestCount),
        .Port0_PacketRequestCount          (Port0_PacketRequestCount),
        .Port0_PktErrAbortCount            (Port0_PktErrAbortCount),
        .Port0_ReOrdersStuffed             (Port0_ReOrdersStuffed),
        .Port0_PacketsStuffed              (Port0_PacketsStuffed),
        .Port0_PacketsTransmitted          (Port0_PacketsTransmitted),
        .Port0_BytesTransmitted            (Port0_BytesTransmitted),
        .Port0_DMA_List                    (Port0_DMA_List),
        .Port1_TidsInUse                   (Port1_TidsInUse),
        .Port1_DuplicateTid                (Port1_DuplicateTid),
        .Port1_UnInitializedTID            (Port1_UnInitializedTID),
        .Port1_TimedoutTids                (Port1_TimedoutTids),
        .Port1_ReOrderStateLogic           (Port1_ReOrderStateLogic),
        .Port1_ReOrderStateControl         (Port1_ReOrderStateControl),
        .Port1_ReOrderStateData0           (Port1_ReOrderStateData0),
        .Port1_ReOrderStateData1           (Port1_ReOrderStateData1),
        .Port1_ReOrderStateData2           (Port1_ReOrderStateData2),
        .Port1_ReOrderStateData3           (Port1_ReOrderStateData3),
        .Port1_WrTidsInUse                 (Port1_WrTidsInUse),
        .Port1_WrDuplicateTid              (Port1_WrDuplicateTid),
        .Port1_WrUnInitializedTID          (Port1_WrUnInitializedTID),
        .Port1_WrTimedoutTids              (Port1_WrTimedoutTids),
        .Port1_WrReOrderStateLogic         (Port1_WrReOrderStateLogic),
        .Port1_WrReOrderStateControl       (Port1_WrReOrderStateControl),
        .Port1_WrReOrderStateData0         (Port1_WrReOrderStateData0),
        .Port1_WrReOrderStateData1         (Port1_WrReOrderStateData1),
        .Port1_WrReOrderStateData2         (Port1_WrReOrderStateData2),
        .Port1_WrReOrderStateData3         (Port1_WrReOrderStateData3),
        .Port1_ReOrder_ECC_State           (Port1_ReOrder_ECC_State),
        .Port1_StoreForward_ECC_State      (Port1_StoreForward_ECC_State),
        .Port1_ReOrder_EccData             (Port1_ReOrder_EccData),
        .Port1_StoreForward_EccData        (Port1_StoreForward_EccData),
        .Port1_ReOrder_ClearEccError       (Port1_ReOrder_ClearEccError),
        .Port1_WrReOrderEccState           (Port1_WrReOrderEccState),
        .Port1_WrReOrderEccData0           (Port1_WrReOrderEccData0),
        .Port1_WrReOrderEccData1           (Port1_WrReOrderEccData1),
        .Port1_WrReOrderEccData2           (Port1_WrReOrderEccData2),
        .Port1_WrReOrderEccData3           (Port1_WrReOrderEccData3),
        .Port1_WrReOrderEccData4           (Port1_WrReOrderEccData4),
        .Port1_StoreForward_ClearEccError  (Port1_StoreForward_ClearEccError),
        .Port1_WrStoreForwardEccState      (Port1_WrStoreForwardEccState),
        .Port1_WrStoreForwardEccData0      (Port1_WrStoreForwardEccData0),
        .Port1_WrStoreForwardEccData1      (Port1_WrStoreForwardEccData1),
        .Port1_WrStoreForwardEccData2      (Port1_WrStoreForwardEccData2),
        .Port1_WrStoreForwardEccData3      (Port1_WrStoreForwardEccData3),
        .Port1_WrStoreForwardEccData4      (Port1_WrStoreForwardEccData4),
        .Port1_ReOrderEccControl           (Port1_ReOrderEccControl),
        .Port1_StoreForwardEccControl      (Port1_StoreForwardEccControl),
        .Port1_ClearStatistics             (Port1_ClearStatistics),
        .Port1_WrPacketStuffed             (Port1_WrPacketStuffed),
        .Port1_WrPacketXmitted             (Port1_WrPacketXmitted),
        .Port1_WrPacketRequested           (Port1_WrPacketRequested),
        .Port1_GatherRequestCount          (Port1_GatherRequestCount),
        .Port1_PacketRequestCount          (Port1_PacketRequestCount),
        .Port1_PktErrAbortCount            (Port1_PktErrAbortCount),
        .Port1_ReOrdersStuffed             (Port1_ReOrdersStuffed),
        .Port1_PacketsStuffed              (Port1_PacketsStuffed),
        .Port1_PacketsTransmitted          (Port1_PacketsTransmitted),
        .Port1_BytesTransmitted            (Port1_BytesTransmitted),
        .Port1_DMA_List                    (Port1_DMA_List)
       );

/*--------------------------------------------------------------*/
// Ports 2 & 3 PIO Read & Write Registers
/*--------------------------------------------------------------*/
`ifdef NEPTUNE

niu_txc_portRegisters  niu_txc_port2and3Registers (
        .SysClk                            (SysClk),
        .Reset_L                           (Reset_L),
        .ReadPortRegister                  (read_Port2_Register),
        .WritePortRegister                 (write_Port2_Register),
        .PosEdgeWritePort                  (posEdgeWritePort2),
        .Slave_Addr                        (slaveAddrB1[8:2]),
        .Slave_DataIn                      (slaveDataIn),
        .Slave_DataOut                     (port2to3_Slave_Data),
        .Port0_TidsInUse                   (Port2_TidsInUse),
        .Port0_DuplicateTid                (Port2_DuplicateTid),
        .Port0_UnInitializedTID            (Port2_UnInitializedTID),
        .Port0_TimedoutTids                (Port2_TimedoutTids),
        .Port0_ReOrderStateLogic           (Port2_ReOrderStateLogic),
        .Port0_ReOrderStateControl         (Port2_ReOrderStateControl),
        .Port0_ReOrderStateData0           (Port2_ReOrderStateData0),
        .Port0_ReOrderStateData1           (Port2_ReOrderStateData1),
        .Port0_ReOrderStateData2           (Port2_ReOrderStateData2),
        .Port0_ReOrderStateData3           (Port2_ReOrderStateData3),
        .Port0_WrTidsInUse                 (Port2_WrTidsInUse),
        .Port0_WrDuplicateTid              (Port2_WrDuplicateTid),
        .Port0_WrUnInitializedTID          (Port2_WrUnInitializedTID),
        .Port0_WrTimedoutTids              (Port2_WrTimedoutTids),
        .Port0_WrReOrderStateLogic         (Port2_WrReOrderStateLogic),
        .Port0_WrReOrderStateControl       (Port2_WrReOrderStateControl),
        .Port0_WrReOrderStateData0         (Port2_WrReOrderStateData0),
        .Port0_WrReOrderStateData1         (Port2_WrReOrderStateData1),
        .Port0_WrReOrderStateData2         (Port2_WrReOrderStateData2),
        .Port0_WrReOrderStateData3         (Port2_WrReOrderStateData3),
        .Port0_ReOrder_ECC_State           (Port2_ReOrder_ECC_State),
        .Port0_StoreForward_ECC_State      (Port2_StoreForward_ECC_State),
        .Port0_ReOrder_EccData             (Port2_ReOrder_EccData),
        .Port0_StoreForward_EccData        (Port2_StoreForward_EccData),
        .Port0_ReOrder_ClearEccError       (Port2_ReOrder_ClearEccError),
        .Port0_WrReOrderEccState           (Port2_WrReOrderEccState),
        .Port0_WrReOrderEccData0           (Port2_WrReOrderEccData0),
        .Port0_WrReOrderEccData1           (Port2_WrReOrderEccData1),
        .Port0_WrReOrderEccData2           (Port2_WrReOrderEccData2),
        .Port0_WrReOrderEccData3           (Port2_WrReOrderEccData3),
        .Port0_WrReOrderEccData4           (Port2_WrReOrderEccData4),
        .Port0_StoreForward_ClearEccError  (Port2_StoreForward_ClearEccError),
        .Port0_WrStoreForwardEccState      (Port2_WrStoreForwardEccState),
        .Port0_WrStoreForwardEccData0      (Port2_WrStoreForwardEccData0),
        .Port0_WrStoreForwardEccData1      (Port2_WrStoreForwardEccData1),
        .Port0_WrStoreForwardEccData2      (Port2_WrStoreForwardEccData2),
        .Port0_WrStoreForwardEccData3      (Port2_WrStoreForwardEccData3),
        .Port0_WrStoreForwardEccData4      (Port2_WrStoreForwardEccData4),
        .Port0_ReOrderEccControl           (Port2_ReOrderEccControl),
        .Port0_StoreForwardEccControl      (Port2_StoreForwardEccControl),
        .Port0_ClearStatistics             (Port2_ClearStatistics),
        .Port0_WrPacketStuffed             (Port2_WrPacketStuffed),
        .Port0_WrPacketXmitted             (Port2_WrPacketXmitted),
        .Port0_WrPacketRequested           (Port2_WrPacketRequested),
        .Port0_GatherRequestCount          (Port2_GatherRequestCount),
        .Port0_PacketRequestCount          (Port2_PacketRequestCount),
        .Port0_PktErrAbortCount            (Port2_PktErrAbortCount),
        .Port0_ReOrdersStuffed             (Port2_ReOrdersStuffed),
        .Port0_PacketsStuffed              (Port2_PacketsStuffed),
        .Port0_PacketsTransmitted          (Port2_PacketsTransmitted),
        .Port0_BytesTransmitted            (Port2_BytesTransmitted),
        .Port0_DMA_List                    (Port2_DMA_List),
        .Port1_TidsInUse                   (Port3_TidsInUse),
        .Port1_DuplicateTid                (Port3_DuplicateTid),
        .Port1_UnInitializedTID            (Port3_UnInitializedTID),
        .Port1_TimedoutTids                (Port3_TimedoutTids),
        .Port1_ReOrderStateLogic           (Port3_ReOrderStateLogic),
        .Port1_ReOrderStateControl         (Port3_ReOrderStateControl),
        .Port1_ReOrderStateData0           (Port3_ReOrderStateData0),
        .Port1_ReOrderStateData1           (Port3_ReOrderStateData1),
        .Port1_ReOrderStateData2           (Port3_ReOrderStateData2),
        .Port1_ReOrderStateData3           (Port3_ReOrderStateData3),
        .Port1_WrTidsInUse                 (Port3_WrTidsInUse),
        .Port1_WrDuplicateTid              (Port3_WrDuplicateTid),
        .Port1_WrUnInitializedTID          (Port3_WrUnInitializedTID),
        .Port1_WrTimedoutTids              (Port3_WrTimedoutTids),
        .Port1_WrReOrderStateLogic         (Port3_WrReOrderStateLogic),
        .Port1_WrReOrderStateControl       (Port3_WrReOrderStateControl),
        .Port1_WrReOrderStateData0         (Port3_WrReOrderStateData0),
        .Port1_WrReOrderStateData1         (Port3_WrReOrderStateData1),
        .Port1_WrReOrderStateData2         (Port3_WrReOrderStateData2),
        .Port1_WrReOrderStateData3         (Port3_WrReOrderStateData3),
        .Port1_ReOrder_ECC_State           (Port3_ReOrder_ECC_State),
        .Port1_StoreForward_ECC_State      (Port3_StoreForward_ECC_State),
        .Port1_ReOrder_EccData             (Port3_ReOrder_EccData),
        .Port1_StoreForward_EccData        (Port3_StoreForward_EccData),
        .Port1_ReOrder_ClearEccError       (Port3_ReOrder_ClearEccError),
        .Port1_WrReOrderEccState           (Port3_WrReOrderEccState),
        .Port1_WrReOrderEccData0           (Port3_WrReOrderEccData0),
        .Port1_WrReOrderEccData1           (Port3_WrReOrderEccData1),
        .Port1_WrReOrderEccData2           (Port3_WrReOrderEccData2),
        .Port1_WrReOrderEccData3           (Port3_WrReOrderEccData3),
        .Port1_WrReOrderEccData4           (Port3_WrReOrderEccData4),
        .Port1_StoreForward_ClearEccError  (Port3_StoreForward_ClearEccError),
        .Port1_WrStoreForwardEccState      (Port3_WrStoreForwardEccState),
        .Port1_WrStoreForwardEccData0      (Port3_WrStoreForwardEccData0),
        .Port1_WrStoreForwardEccData1      (Port3_WrStoreForwardEccData1),
        .Port1_WrStoreForwardEccData2      (Port3_WrStoreForwardEccData2),
        .Port1_WrStoreForwardEccData3      (Port3_WrStoreForwardEccData3),
        .Port1_WrStoreForwardEccData4      (Port3_WrStoreForwardEccData4),
        .Port1_ReOrderEccControl           (Port3_ReOrderEccControl),
        .Port1_StoreForwardEccControl      (Port3_StoreForwardEccControl),
        .Port1_ClearStatistics             (Port3_ClearStatistics),
        .Port1_WrPacketStuffed             (Port3_WrPacketStuffed),
        .Port1_WrPacketXmitted             (Port3_WrPacketXmitted),
        .Port1_WrPacketRequested           (Port3_WrPacketRequested),
        .Port1_GatherRequestCount          (Port3_GatherRequestCount),
        .Port1_PacketRequestCount          (Port3_PacketRequestCount),
        .Port1_PktErrAbortCount            (Port3_PktErrAbortCount),
        .Port1_ReOrdersStuffed             (Port3_ReOrdersStuffed),
        .Port1_PacketsStuffed              (Port3_PacketsStuffed),
        .Port1_PacketsTransmitted          (Port3_PacketsTransmitted),
        .Port1_BytesTransmitted            (Port3_BytesTransmitted),
        .Port1_DMA_List                    (Port3_DMA_List)
       );
`endif

/*--------------------------------------------------------------*/
// END NIU TXC Read & Write Registers
/*--------------------------------------------------------------*/

endmodule
