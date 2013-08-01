// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_portRegisters.v
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
 *  niu_txc_portRegisters.v
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

module niu_txc_portRegisters (
        SysClk,
        Reset_L, 

        ReadPortRegister,
        WritePortRegister,
        PosEdgeWritePort,
        Slave_Addr,             // Slave Address
        Slave_DataIn,           // Slave Write Data
        Slave_DataOut,          // Slave Read Data

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
        Port0_ReOrderEccControl,
        Port0_StoreForwardEccControl,
        Port0_ClearStatistics,
        Port0_WrPacketRequested,
        Port0_WrPacketStuffed,
        Port0_WrPacketXmitted,
        Port0_GatherRequestCount,
        Port0_PacketRequestCount,
        Port0_PktErrAbortCount,
        Port0_ReOrdersStuffed,
        Port0_PacketsStuffed,
        Port0_PacketsTransmitted,
        Port0_BytesTransmitted,
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
        Port1_ReOrderEccControl,
        Port1_StoreForwardEccControl,
        Port1_ClearStatistics,
        Port1_WrPacketRequested,
        Port1_WrPacketStuffed,
        Port1_WrPacketXmitted,
        Port1_GatherRequestCount,
        Port1_PacketRequestCount,
        Port1_PktErrAbortCount,
        Port1_ReOrdersStuffed,
        Port1_PacketsStuffed,
        Port1_PacketsTransmitted,
        Port1_BytesTransmitted,
        Port1_DMA_List
       );
    
// Include Header Files
`include "txc_defines.h"
`include "niu_txc_reg_defines.h"

// Global Signals
input          SysClk;
input          Reset_L;

// Slave Interface
input          ReadPortRegister;
input          WritePortRegister;
input          PosEdgeWritePort;
input  [8:2]   Slave_Addr;
input  [31:0]  Slave_DataIn;

output [31:0]  Slave_DataOut;

reg    [31:0]  Slave_DataOut;

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

reg            Port0_WrTidsInUse;
reg            Port0_WrDuplicateTid;
reg            Port0_WrUnInitializedTID;
reg            Port0_WrTimedoutTids;
reg            Port0_WrReOrderStateLogic;
reg            Port0_WrReOrderStateControl;
reg            Port0_WrReOrderStateData0;
reg            Port0_WrReOrderStateData1;
reg            Port0_WrReOrderStateData2;
reg            Port0_WrReOrderStateData3;

// Port 0 ECC Error Reporting PIO Control Registers
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

reg            Port0_ReOrder_ClearEccError;
reg            Port0_WrReOrderEccState;
reg            Port0_WrReOrderEccData0;
reg            Port0_WrReOrderEccData1;
reg            Port0_WrReOrderEccData2;
reg            Port0_WrReOrderEccData3;
reg            Port0_WrReOrderEccData4;
reg            Port0_StoreForward_ClearEccError;
reg            Port0_WrStoreForwardEccState;
reg            Port0_WrStoreForwardEccData0;
reg            Port0_WrStoreForwardEccData1;
reg            Port0_WrStoreForwardEccData2;
reg            Port0_WrStoreForwardEccData3;
reg            Port0_WrStoreForwardEccData4;

// Port 0 ECC Control & Status Registers
output [31:0]  Port0_ReOrderEccControl;
output [31:0]  Port0_StoreForwardEccControl;

// Port 0 Diagnostics Control Registers
input  [3:0]   Port0_GatherRequestCount;
input  [11:0]  Port0_PacketRequestCount;
input  [15:0]  Port0_PktErrAbortCount;
input  [15:0]  Port0_ReOrdersStuffed;
input  [15:0]  Port0_PacketsStuffed;
input  [15:0]  Port0_PacketsTransmitted;
input  [15:0]  Port0_BytesTransmitted;

output         Port0_ClearStatistics;
output         Port0_WrPacketRequested;
output         Port0_WrPacketStuffed;
output         Port0_WrPacketXmitted;

reg            Port0_ClearStatistics;
reg            Port0_WrPacketRequested;
reg            Port0_WrPacketStuffed;
reg            Port0_WrPacketXmitted;

// Port 0 Bind Control Registers
output [23:0]  Port0_DMA_List;

reg    [23:0]  Port0_DMA_List;

// Port 1 ReOrder PIO Control Registers
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

reg            Port1_WrTidsInUse;
reg            Port1_WrDuplicateTid;
reg            Port1_WrUnInitializedTID;
reg            Port1_WrTimedoutTids;
reg            Port1_WrReOrderStateLogic;
reg            Port1_WrReOrderStateControl;
reg            Port1_WrReOrderStateData0;
reg            Port1_WrReOrderStateData1;
reg            Port1_WrReOrderStateData2;
reg            Port1_WrReOrderStateData3;

// Port 1 ECC Error Reporting PIO Control Registers
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

reg            Port1_ReOrder_ClearEccError;
reg            Port1_WrReOrderEccState;
reg            Port1_WrReOrderEccData0;
reg            Port1_WrReOrderEccData1;
reg            Port1_WrReOrderEccData2;
reg            Port1_WrReOrderEccData3;
reg            Port1_WrReOrderEccData4;
reg            Port1_StoreForward_ClearEccError;
reg            Port1_WrStoreForwardEccState;
reg            Port1_WrStoreForwardEccData0;
reg            Port1_WrStoreForwardEccData1;
reg            Port1_WrStoreForwardEccData2;
reg            Port1_WrStoreForwardEccData3;
reg            Port1_WrStoreForwardEccData4;

// Port 1 ECC Control & Status Registers
output [31:0]  Port1_ReOrderEccControl;
output [31:0]  Port1_StoreForwardEccControl;

// Port 1 Diagnostics Control Registers
input  [3:0]   Port1_GatherRequestCount;
input  [11:0]  Port1_PacketRequestCount;
input  [15:0]  Port1_PktErrAbortCount;
input  [15:0]  Port1_ReOrdersStuffed;
input  [15:0]  Port1_PacketsStuffed;
input  [15:0]  Port1_PacketsTransmitted;
input  [15:0]  Port1_BytesTransmitted;

output         Port1_ClearStatistics;
output         Port1_WrPacketRequested;
output         Port1_WrPacketStuffed;
output         Port1_WrPacketXmitted;

reg            Port1_ClearStatistics;
reg            Port1_WrPacketRequested;
reg            Port1_WrPacketStuffed;
reg            Port1_WrPacketXmitted;

// Port 1 Bind Control Registers
output [23:0]  Port1_DMA_List;

reg    [23:0]  Port1_DMA_List;

/*--------------------------------------------------------------*/
// Wires & Registers
/*--------------------------------------------------------------*/
reg            port0_RO_Disable_UE;
reg            port0_RO_Double_Bit_Err;
reg            port0_RO_Single_Bit_Err;
reg            port0_RO_All_Pkts;
reg            port0_RO_Alt_Pkts;
reg            port0_RO_One_Pkt_Only;
reg            port0_RO_Last_Pkt_Line;
reg            port0_RO_Second_Pkt_Line;
reg            port0_RO_First_Pkt_Line;
reg            port0_SF_Disable_UE;
reg            port0_SF_Double_Bit_Err;
reg            port0_SF_Single_Bit_Err;
reg            port0_SF_All_Pkts;
reg            port0_SF_Alt_Pkts;
reg            port0_SF_One_Pkt_Only;
reg            port0_SF_Last_Pkt_Line;
reg            port0_SF_Second_Pkt_Line;
reg            port0_SF_First_Pkt_Line;

reg            port1_RO_Disable_UE;
reg            port1_RO_Double_Bit_Err;
reg            port1_RO_Single_Bit_Err;
reg            port1_RO_All_Pkts;
reg            port1_RO_Alt_Pkts;
reg            port1_RO_One_Pkt_Only;
reg            port1_RO_Last_Pkt_Line;
reg            port1_RO_Second_Pkt_Line;
reg            port1_RO_First_Pkt_Line;
reg            port1_SF_Disable_UE;
reg            port1_SF_Double_Bit_Err;
reg            port1_SF_Single_Bit_Err;
reg            port1_SF_All_Pkts;
reg            port1_SF_Alt_Pkts;
reg            port1_SF_One_Pkt_Only;
reg            port1_SF_Last_Pkt_Line;
reg            port1_SF_Second_Pkt_Line;
reg            port1_SF_First_Pkt_Line;

/*--------------------------------------------------------------*/
// ECC Control Logic
/*--------------------------------------------------------------*/
assign Port0_ReOrderEccControl = {port0_RO_Disable_UE,       // 31
                                  13'h0,                     // 30:18
                                  port0_RO_Double_Bit_Err,   // 17
                                  port0_RO_Single_Bit_Err,   // 16
                                  5'h0,                      // 15:11
                                  port0_RO_All_Pkts,         // 10
                                  port0_RO_Alt_Pkts,         // 9
                                  port0_RO_One_Pkt_Only,     // 8
                                  5'h0,                      // 7:3
                                  port0_RO_Last_Pkt_Line,    // 2
                                  port0_RO_Second_Pkt_Line,  // 1
                                  port0_RO_First_Pkt_Line    // 0
                                 };

assign Port0_StoreForwardEccControl = {port0_SF_Disable_UE,       // 31
                                       13'h0,                     // 30:18
                                       port0_SF_Double_Bit_Err,   // 17
                                       port0_SF_Single_Bit_Err,   // 16
                                       5'h0,                      // 15:11
                                       port0_SF_All_Pkts,         // 10
                                       port0_SF_Alt_Pkts,         // 9
                                       port0_SF_One_Pkt_Only,     // 8
                                       5'h0,                      // 7:3
                                       port0_SF_Last_Pkt_Line,    // 2
                                       port0_SF_Second_Pkt_Line,  // 1
                                       port0_SF_First_Pkt_Line    // 0
                                      };

assign Port1_ReOrderEccControl = {port1_RO_Disable_UE,       // 31
                                  13'h0,                     // 30:18
                                  port1_RO_Double_Bit_Err,   // 17
                                  port1_RO_Single_Bit_Err,   // 16
                                  5'h0,                      // 15:11
                                  port1_RO_All_Pkts,         // 10
                                  port1_RO_Alt_Pkts,         // 9
                                  port1_RO_One_Pkt_Only,     // 8
                                  5'h0,                      // 7:3
                                  port1_RO_Last_Pkt_Line,    // 2
                                  port1_RO_Second_Pkt_Line,  // 1
                                  port1_RO_First_Pkt_Line    // 0
                                 };

assign Port1_StoreForwardEccControl = {port1_SF_Disable_UE,       // 31
                                       13'h0,                     // 30:18
                                       port1_SF_Double_Bit_Err,   // 17
                                       port1_SF_Single_Bit_Err,   // 16
                                       5'h0,                      // 15:11
                                       port1_SF_All_Pkts,         // 10
                                       port1_SF_Alt_Pkts,         // 9
                                       port1_SF_One_Pkt_Only,     // 8
                                       5'h0,                      // 7:3
                                       port1_SF_Last_Pkt_Line,    // 2
                                       port1_SF_Second_Pkt_Line,  // 1
                                       port1_SF_First_Pkt_Line    // 0
                                      };

/*--------------------------------------------------------------*/
// NIU TXC Port PIO Read & Write Registers
/*--------------------------------------------------------------*/

always @ (posedge SysClk)
  if (!Reset_L)
    Slave_DataOut <= 32'h0;
  else if (ReadPortRegister)
      case ({3'h0, Slave_Addr[8:2], 2'h0}) // synopsys parallel_case
                                       /* 0in < case -parallel */

      `PORT0_DMA_ENABLE:       Slave_DataOut <= {8'h0, Port0_DMA_List};
      `PORT0_PACKETS_STUFFED:  Slave_DataOut <= {Port0_ReOrdersStuffed,
                                               Port0_PacketsStuffed};
      `PORT0_PACKETS_XMITTED:  Slave_DataOut <= {Port0_BytesTransmitted,
                                               Port0_PacketsTransmitted};
      `PORT0_RO_ECC_CONTROL:   Slave_DataOut <= Port0_ReOrderEccControl;
      `PORT0_RO_ECC_ADDR:      Slave_DataOut <= Port0_ReOrder_ECC_State;
      `PORT0_RO_ECC_DATA0:     Slave_DataOut <= Port0_ReOrder_EccData[31:0];
      `PORT0_RO_ECC_DATA1:     Slave_DataOut <= Port0_ReOrder_EccData[63:32];
      `PORT0_RO_ECC_DATA2:     Slave_DataOut <= Port0_ReOrder_EccData[95:64];
      `PORT0_RO_ECC_DATA3:     Slave_DataOut <= Port0_ReOrder_EccData[127:96];
      `PORT0_RO_ECC_DATA4:     Slave_DataOut <= {8'h0,
                                              Port0_ReOrder_EccData[151:128]};

      `PORT0_SF_ECC_CONTROL:   Slave_DataOut <= Port0_StoreForwardEccControl;
      `PORT0_SF_ECC_ADDR:      Slave_DataOut <= Port0_StoreForward_ECC_State;
      `PORT0_SF_ECC_DATA0:  Slave_DataOut <= Port0_StoreForward_EccData[31:0];
      `PORT0_SF_ECC_DATA1:  Slave_DataOut <= Port0_StoreForward_EccData[63:32];
      `PORT0_SF_ECC_DATA2:  Slave_DataOut <= Port0_StoreForward_EccData[95:64];
      `PORT0_SF_ECC_DATA3:  Slave_DataOut <= Port0_StoreForward_EccData[127:96];
      `PORT0_SF_ECC_DATA4:  Slave_DataOut <= {8'h0,
                                        Port0_StoreForward_EccData[151:128]};

      `PORT0_REORDER_TID:      Slave_DataOut <= Port0_TidsInUse;
      `PORT0_REORDER_STATE0:   Slave_DataOut <= Port0_DuplicateTid;
      `PORT0_REORDER_STATE1:   Slave_DataOut <= Port0_UnInitializedTID;
      `PORT0_REORDER_STATE2:   Slave_DataOut <= Port0_TimedoutTids;
      `PORT0_REORDER_STATE3:   Slave_DataOut <= Port0_ReOrderStateLogic;
      `PORT0_REORDER_CONTROL:  Slave_DataOut <= Port0_ReOrderStateControl;
      `PORT0_REORDER_DATA0:    Slave_DataOut <= Port0_ReOrderStateData0;
      `PORT0_REORDER_DATA1:    Slave_DataOut <= Port0_ReOrderStateData1;
      `PORT0_REORDER_DATA2:    Slave_DataOut <= Port0_ReOrderStateData2;
      `PORT0_REORDER_DATA3:    Slave_DataOut <= Port0_ReOrderStateData3;
      `PORT0_PACKETS_REQUEST:  Slave_DataOut <= {Port0_GatherRequestCount,
                                                 Port0_PacketRequestCount,
                                                 Port0_PktErrAbortCount};

      `PORT1_DMA_ENABLE:       Slave_DataOut <= {8'h0, Port1_DMA_List};
      `PORT1_PACKETS_STUFFED:  Slave_DataOut <= {Port1_ReOrdersStuffed,
                                               Port1_PacketsStuffed};
      `PORT1_PACKETS_XMITTED:  Slave_DataOut <= {Port1_BytesTransmitted,
                                               Port1_PacketsTransmitted};
      `PORT1_RO_ECC_CONTROL:   Slave_DataOut <= Port1_ReOrderEccControl;
      `PORT1_RO_ECC_ADDR:      Slave_DataOut <= Port1_ReOrder_ECC_State;
      `PORT1_RO_ECC_DATA0:     Slave_DataOut <= Port1_ReOrder_EccData[31:0];
      `PORT1_RO_ECC_DATA1:     Slave_DataOut <= Port1_ReOrder_EccData[63:32];
      `PORT1_RO_ECC_DATA2:     Slave_DataOut <= Port1_ReOrder_EccData[95:64];
      `PORT1_RO_ECC_DATA3:     Slave_DataOut <= Port1_ReOrder_EccData[127:96];
      `PORT1_RO_ECC_DATA4:     Slave_DataOut <= {8'h0,
                                              Port1_ReOrder_EccData[151:128]};

      `PORT1_SF_ECC_CONTROL:   Slave_DataOut <= Port1_StoreForwardEccControl;
      `PORT1_SF_ECC_ADDR:   Slave_DataOut <= Port1_StoreForward_ECC_State;
      `PORT1_SF_ECC_DATA0:  Slave_DataOut <= Port1_StoreForward_EccData[31:0];
      `PORT1_SF_ECC_DATA1:  Slave_DataOut <= Port1_StoreForward_EccData[63:32];
      `PORT1_SF_ECC_DATA2:  Slave_DataOut <= Port1_StoreForward_EccData[95:64];
      `PORT1_SF_ECC_DATA3:  Slave_DataOut <= Port1_StoreForward_EccData[127:96];
      `PORT1_SF_ECC_DATA4:  Slave_DataOut <= {8'h0,
                                        Port1_StoreForward_EccData[151:128]};

      `PORT1_REORDER_TID:      Slave_DataOut <= Port1_TidsInUse;
      `PORT1_REORDER_STATE0:   Slave_DataOut <= Port1_DuplicateTid;
      `PORT1_REORDER_STATE1:   Slave_DataOut <= Port1_UnInitializedTID;
      `PORT1_REORDER_STATE2:   Slave_DataOut <= Port1_TimedoutTids;
      `PORT1_REORDER_STATE3:   Slave_DataOut <= Port1_ReOrderStateLogic;
      `PORT1_REORDER_CONTROL:  Slave_DataOut <= Port1_ReOrderStateControl;
      `PORT1_REORDER_DATA0:    Slave_DataOut <= Port1_ReOrderStateData0;
      `PORT1_REORDER_DATA1:    Slave_DataOut <= Port1_ReOrderStateData1;
      `PORT1_REORDER_DATA2:    Slave_DataOut <= Port1_ReOrderStateData2;
      `PORT1_REORDER_DATA3:    Slave_DataOut <= Port1_ReOrderStateData3;
      `PORT1_PACKETS_REQUEST:  Slave_DataOut <= {Port1_GatherRequestCount,
                                                 Port1_PacketRequestCount,
                                                 Port1_PktErrAbortCount};

           default: Slave_DataOut <= 32'h0;

      endcase


always @ (posedge SysClk)
  if (!Reset_L)
    begin
      Port0_ClearStatistics <= 1'b0;
      Port0_ReOrder_ClearEccError <= 1'b0;
      Port0_WrReOrderEccState <= 1'b0;
      Port0_WrReOrderEccData0 <= 1'b0;
      Port0_WrReOrderEccData1 <= 1'b0;
      Port0_WrReOrderEccData2 <= 1'b0;
      Port0_WrReOrderEccData3 <= 1'b0;
      Port0_WrReOrderEccData4 <= 1'b0;
      Port0_StoreForward_ClearEccError <= 1'b0;
      Port0_WrStoreForwardEccState <= 1'b0;
      Port0_WrStoreForwardEccData0 <= 1'b0;
      Port0_WrStoreForwardEccData1 <= 1'b0;
      Port0_WrStoreForwardEccData2 <= 1'b0;
      Port0_WrStoreForwardEccData3 <= 1'b0;
      Port0_WrStoreForwardEccData4 <= 1'b0;
      Port1_ClearStatistics <= 1'b0;
      Port1_ReOrder_ClearEccError <= 1'b0;
      Port1_WrReOrderEccState <= 1'b0;
      Port1_WrReOrderEccData0 <= 1'b0;
      Port1_WrReOrderEccData1 <= 1'b0;
      Port1_WrReOrderEccData2 <= 1'b0;
      Port1_WrReOrderEccData3 <= 1'b0;
      Port1_WrReOrderEccData4 <= 1'b0;
      Port1_StoreForward_ClearEccError <= 1'b0;
      Port1_WrStoreForwardEccState <= 1'b0;
      Port1_WrStoreForwardEccData0 <= 1'b0;
      Port1_WrStoreForwardEccData1 <= 1'b0;
      Port1_WrStoreForwardEccData2 <= 1'b0;
      Port1_WrStoreForwardEccData3 <= 1'b0;
      Port1_WrStoreForwardEccData4 <= 1'b0;
    end
  else if (PosEdgeWritePort)
    begin
      case ({3'h0, Slave_Addr[8:2], 2'h0}) // synopsys parallel_case
                                       /* 0in < case -parallel */

        `PORT0_CONTROL:           Port0_ClearStatistics <= Slave_DataIn[0];
        `PORT0_RO_ECC_ADDR: begin
                            Port0_ReOrder_ClearEccError <= Slave_DataIn[31];
                            Port0_WrReOrderEccState <= 1'b1;
                            end
        `PORT0_RO_ECC_DATA0:      Port0_WrReOrderEccData0 <= 1'b1;
        `PORT0_RO_ECC_DATA1:      Port0_WrReOrderEccData1 <= 1'b1;
        `PORT0_RO_ECC_DATA2:      Port0_WrReOrderEccData2 <= 1'b1;
        `PORT0_RO_ECC_DATA3:      Port0_WrReOrderEccData3 <= 1'b1;
        `PORT0_RO_ECC_DATA4:      Port0_WrReOrderEccData4 <= 1'b1;
        `PORT0_SF_ECC_ADDR: begin
                           Port0_StoreForward_ClearEccError <= Slave_DataIn[31];
                           Port0_WrStoreForwardEccState <= 1'b1;
                            end
        `PORT0_SF_ECC_DATA0:      Port0_WrStoreForwardEccData0 <= 1'b1;
        `PORT0_SF_ECC_DATA1:      Port0_WrStoreForwardEccData1 <= 1'b1;
        `PORT0_SF_ECC_DATA2:      Port0_WrStoreForwardEccData2 <= 1'b1;
        `PORT0_SF_ECC_DATA3:      Port0_WrStoreForwardEccData3 <= 1'b1;
        `PORT0_SF_ECC_DATA4:      Port0_WrStoreForwardEccData4 <= 1'b1;

        `PORT1_CONTROL:           Port1_ClearStatistics <= Slave_DataIn[0];
        `PORT1_RO_ECC_ADDR: begin
                            Port1_ReOrder_ClearEccError <= Slave_DataIn[31];
                            Port1_WrReOrderEccState <= 1'b1;
                            end
        `PORT1_RO_ECC_DATA0:      Port1_WrReOrderEccData0 <= 1'b1;
        `PORT1_RO_ECC_DATA1:      Port1_WrReOrderEccData1 <= 1'b1;
        `PORT1_RO_ECC_DATA2:      Port1_WrReOrderEccData2 <= 1'b1;
        `PORT1_RO_ECC_DATA3:      Port1_WrReOrderEccData3 <= 1'b1;
        `PORT1_RO_ECC_DATA4:      Port1_WrReOrderEccData4 <= 1'b1;
        `PORT1_SF_ECC_ADDR: begin
                           Port1_StoreForward_ClearEccError <= Slave_DataIn[31];
                           Port1_WrStoreForwardEccState <= 1'b1;
                            end
        `PORT1_SF_ECC_DATA0:      Port1_WrStoreForwardEccData0 <= 1'b1;
        `PORT1_SF_ECC_DATA1:      Port1_WrStoreForwardEccData1 <= 1'b1;
        `PORT1_SF_ECC_DATA2:      Port1_WrStoreForwardEccData2 <= 1'b1;
        `PORT1_SF_ECC_DATA3:      Port1_WrStoreForwardEccData3 <= 1'b1;
        `PORT1_SF_ECC_DATA4:      Port1_WrStoreForwardEccData4 <= 1'b1;
      endcase
    end
  else
    begin
      Port0_ClearStatistics <= 1'b0;
      Port0_ReOrder_ClearEccError <= 1'b0;
      Port0_WrReOrderEccState <= 1'b0;
      Port0_WrReOrderEccData0 <= 1'b0;
      Port0_WrReOrderEccData1 <= 1'b0;
      Port0_WrReOrderEccData2 <= 1'b0;
      Port0_WrReOrderEccData3 <= 1'b0;
      Port0_WrReOrderEccData4 <= 1'b0;
      Port0_StoreForward_ClearEccError <= 1'b0;
      Port0_WrStoreForwardEccState <= 1'b0;
      Port0_WrStoreForwardEccData0 <= 1'b0;
      Port0_WrStoreForwardEccData1 <= 1'b0;
      Port0_WrStoreForwardEccData2 <= 1'b0;
      Port0_WrStoreForwardEccData3 <= 1'b0;
      Port0_WrStoreForwardEccData4 <= 1'b0;
      Port1_ClearStatistics <= 1'b0;
      Port1_ReOrder_ClearEccError <= 1'b0;
      Port1_WrReOrderEccState <= 1'b0;
      Port1_WrReOrderEccData0 <= 1'b0;
      Port1_WrReOrderEccData1 <= 1'b0;
      Port1_WrReOrderEccData2 <= 1'b0;
      Port1_WrReOrderEccData3 <= 1'b0;
      Port1_WrReOrderEccData4 <= 1'b0;
      Port1_StoreForward_ClearEccError <= 1'b0;
      Port1_WrStoreForwardEccState <= 1'b0;
      Port1_WrStoreForwardEccData0 <= 1'b0;
      Port1_WrStoreForwardEccData1 <= 1'b0;
      Port1_WrStoreForwardEccData2 <= 1'b0;
      Port1_WrStoreForwardEccData3 <= 1'b0;
      Port1_WrStoreForwardEccData4 <= 1'b0;
    end


always @ (posedge SysClk)
  if (!Reset_L)
    begin
      Port0_DMA_List <= 24'h0;
      Port0_WrPacketRequested <= 1'b0;
      Port0_WrPacketStuffed <= 1'b0;
      Port0_WrPacketXmitted <= 1'b0;
      port0_RO_Disable_UE <= 1'b0;
      port0_RO_Double_Bit_Err <= 1'b0;
      port0_RO_Single_Bit_Err <= 1'b0;
      port0_RO_All_Pkts <= 1'b0;
      port0_RO_Alt_Pkts <= 1'b0;
      port0_RO_One_Pkt_Only <= 1'b0;
      port0_RO_Last_Pkt_Line <= 1'b0;
      port0_RO_Second_Pkt_Line <= 1'b0;
      port0_RO_First_Pkt_Line <= 1'b0;
      port0_SF_Disable_UE <= 1'b0;
      port0_SF_Double_Bit_Err <= 1'b0;
      port0_SF_Single_Bit_Err <= 1'b0;
      port0_SF_All_Pkts <= 1'b0;
      port0_SF_Alt_Pkts <= 1'b0;
      port0_SF_One_Pkt_Only <= 1'b0;
      port0_SF_Last_Pkt_Line <= 1'b0;
      port0_SF_Second_Pkt_Line <= 1'b0;
      port0_SF_First_Pkt_Line <= 1'b0;
      Port0_WrTidsInUse <= 1'b0;
      Port0_WrDuplicateTid <= 1'b0;
      Port0_WrUnInitializedTID <= 1'b0;
      Port0_WrTimedoutTids <= 1'b0;
      Port0_WrReOrderStateLogic <= 1'b0;
      Port0_WrReOrderStateControl <= 1'b0;
      Port0_WrReOrderStateData0 <= 1'b0;
      Port0_WrReOrderStateData1 <= 1'b0;
      Port0_WrReOrderStateData2 <= 1'b0;
      Port0_WrReOrderStateData3 <= 1'b0;
      Port1_DMA_List <= 24'h0;
      Port1_WrPacketRequested <= 1'b0;
      Port1_WrPacketStuffed <= 1'b0;
      Port1_WrPacketXmitted <= 1'b0;
      port1_RO_Disable_UE <= 1'b0;
      port1_RO_Double_Bit_Err <= 1'b0;
      port1_RO_Single_Bit_Err <= 1'b0;
      port1_RO_All_Pkts <= 1'b0;
      port1_RO_Alt_Pkts <= 1'b0;
      port1_RO_One_Pkt_Only <= 1'b0;
      port1_RO_Last_Pkt_Line <= 1'b0;
      port1_RO_Second_Pkt_Line <= 1'b0;
      port1_RO_First_Pkt_Line <= 1'b0;
      port1_SF_Disable_UE <= 1'b0;
      port1_SF_Double_Bit_Err <= 1'b0;
      port1_SF_Single_Bit_Err <= 1'b0;
      port1_SF_All_Pkts <= 1'b0;
      port1_SF_Alt_Pkts <= 1'b0;
      port1_SF_One_Pkt_Only <= 1'b0;
      port1_SF_Last_Pkt_Line <= 1'b0;
      port1_SF_Second_Pkt_Line <= 1'b0;
      port1_SF_First_Pkt_Line <= 1'b0;
      Port1_WrTidsInUse <= 1'b0;
      Port1_WrDuplicateTid <= 1'b0;
      Port1_WrUnInitializedTID <= 1'b0;
      Port1_WrTimedoutTids <= 1'b0;
      Port1_WrReOrderStateLogic <= 1'b0;
      Port1_WrReOrderStateControl <= 1'b0;
      Port1_WrReOrderStateData0 <= 1'b0;
      Port1_WrReOrderStateData1 <= 1'b0;
      Port1_WrReOrderStateData2 <= 1'b0;
      Port1_WrReOrderStateData3 <= 1'b0;
    end
  else if (WritePortRegister)
    begin
      case ({3'h0, Slave_Addr[8:2], 2'h0}) // synopsys parallel_case
                                       /* 0in < case -parallel */

`ifdef NEPTUNE
        `PORT0_DMA_ENABLE:        Port0_DMA_List <= Slave_DataIn[23:0];
`else
        `PORT0_DMA_ENABLE:        Port0_DMA_List <= {8'h0, Slave_DataIn[15:0]};
`endif
        `PORT0_PACKETS_STUFFED:   Port0_WrPacketStuffed <= 1'b1;
        `PORT0_PACKETS_XMITTED:   Port0_WrPacketXmitted <= 1'b1;

        `PORT0_RO_ECC_CONTROL: begin
                                  port0_RO_Disable_UE <= Slave_DataIn[31];
                                  port0_RO_Double_Bit_Err <= Slave_DataIn[17];
                                  port0_RO_Single_Bit_Err <= Slave_DataIn[16];
                                  port0_RO_All_Pkts <= Slave_DataIn[10];
                                  port0_RO_Alt_Pkts <= Slave_DataIn[9];
                                  port0_RO_One_Pkt_Only <= Slave_DataIn[8];
                                  port0_RO_Last_Pkt_Line <= Slave_DataIn[2];
                                  port0_RO_Second_Pkt_Line <= Slave_DataIn[1];
                                  port0_RO_First_Pkt_Line <= Slave_DataIn[0];
                               end

        `PORT0_SF_ECC_CONTROL: begin
                                  port0_SF_Disable_UE <= Slave_DataIn[31];
                                  port0_SF_Double_Bit_Err <= Slave_DataIn[17];
                                  port0_SF_Single_Bit_Err <= Slave_DataIn[16];
                                  port0_SF_All_Pkts <= Slave_DataIn[10];
                                  port0_SF_Alt_Pkts <= Slave_DataIn[9];
                                  port0_SF_One_Pkt_Only <= Slave_DataIn[8];
                                  port0_SF_Last_Pkt_Line <= Slave_DataIn[2];
                                  port0_SF_Second_Pkt_Line <= Slave_DataIn[1];
                                  port0_SF_First_Pkt_Line <= Slave_DataIn[0];
                               end

        `PORT0_REORDER_TID:       Port0_WrTidsInUse <= 1'b1;
        `PORT0_REORDER_STATE0:    Port0_WrDuplicateTid <= 1'b1;
        `PORT0_REORDER_STATE1:    Port0_WrUnInitializedTID <= 1'b1;
        `PORT0_REORDER_STATE2:    Port0_WrTimedoutTids <= 1'b1;
        `PORT0_REORDER_STATE3:    Port0_WrReOrderStateLogic <= 1'b1;
        `PORT0_REORDER_CONTROL:   Port0_WrReOrderStateControl <= 1'b1;
        `PORT0_REORDER_DATA0:     Port0_WrReOrderStateData0 <= 1'b1;
        `PORT0_REORDER_DATA1:     Port0_WrReOrderStateData1 <= 1'b1;
        `PORT0_REORDER_DATA2:     Port0_WrReOrderStateData2 <= 1'b1;
        `PORT0_REORDER_DATA3:     Port0_WrReOrderStateData3 <= 1'b1;

        `PORT0_PACKETS_REQUEST:   Port0_WrPacketRequested <= 1'b1;

`ifdef NEPTUNE
        `PORT1_DMA_ENABLE:        Port1_DMA_List <= Slave_DataIn[23:0];
`else
        `PORT1_DMA_ENABLE:        Port1_DMA_List <= {8'h0, Slave_DataIn[15:0]};
`endif
        `PORT1_PACKETS_STUFFED:   Port1_WrPacketStuffed <= 1'b1;
        `PORT1_PACKETS_XMITTED:   Port1_WrPacketXmitted <= 1'b1;

        `PORT1_RO_ECC_CONTROL: begin
                                  port1_RO_Disable_UE <= Slave_DataIn[31];
                                  port1_RO_Double_Bit_Err <= Slave_DataIn[17];
                                  port1_RO_Single_Bit_Err <= Slave_DataIn[16];
                                  port1_RO_All_Pkts <= Slave_DataIn[10];
                                  port1_RO_Alt_Pkts <= Slave_DataIn[9];
                                  port1_RO_One_Pkt_Only <= Slave_DataIn[8];
                                  port1_RO_Last_Pkt_Line <= Slave_DataIn[2];
                                  port1_RO_Second_Pkt_Line <= Slave_DataIn[1];
                                  port1_RO_First_Pkt_Line <= Slave_DataIn[0];
                               end

        `PORT1_SF_ECC_CONTROL: begin
                                  port1_SF_Disable_UE <= Slave_DataIn[31];
                                  port1_SF_Double_Bit_Err <= Slave_DataIn[17];
                                  port1_SF_Single_Bit_Err <= Slave_DataIn[16];
                                  port1_SF_All_Pkts <= Slave_DataIn[10];
                                  port1_SF_Alt_Pkts <= Slave_DataIn[9];
                                  port1_SF_One_Pkt_Only <= Slave_DataIn[8];
                                  port1_SF_Last_Pkt_Line <= Slave_DataIn[2];
                                  port1_SF_Second_Pkt_Line <= Slave_DataIn[1];
                                  port1_SF_First_Pkt_Line <= Slave_DataIn[0];
                               end

        `PORT1_REORDER_TID:       Port1_WrTidsInUse <= 1'b1;
        `PORT1_REORDER_STATE0:    Port1_WrDuplicateTid <= 1'b1;
        `PORT1_REORDER_STATE1:    Port1_WrUnInitializedTID <= 1'b1;
        `PORT1_REORDER_STATE2:    Port1_WrTimedoutTids <= 1'b1;
        `PORT1_REORDER_STATE3:    Port1_WrReOrderStateLogic <= 1'b1;
        `PORT1_REORDER_CONTROL:   Port1_WrReOrderStateControl <= 1'b1;
        `PORT1_REORDER_DATA0:     Port1_WrReOrderStateData0 <= 1'b1;
        `PORT1_REORDER_DATA1:     Port1_WrReOrderStateData1 <= 1'b1;
        `PORT1_REORDER_DATA2:     Port1_WrReOrderStateData2 <= 1'b1;
        `PORT1_REORDER_DATA3:     Port1_WrReOrderStateData3 <= 1'b1;
        `PORT1_PACKETS_REQUEST:   Port1_WrPacketRequested <= 1'b1;

      endcase
    end
  else
    begin
      Port0_WrPacketRequested <= 1'b0;
      Port0_WrPacketStuffed <= 1'b0;
      Port0_WrPacketXmitted <= 1'b0;
      Port0_WrTidsInUse <= 1'b0;
      Port0_WrDuplicateTid <= 1'b0;
      Port0_WrUnInitializedTID <= 1'b0;
      Port0_WrTimedoutTids <= 1'b0;
      Port0_WrReOrderStateLogic <= 1'b0;
      Port0_WrReOrderStateControl <= 1'b0;
      Port0_WrReOrderStateData0 <= 1'b0;
      Port0_WrReOrderStateData1 <= 1'b0;
      Port0_WrReOrderStateData2 <= 1'b0;
      Port0_WrReOrderStateData3 <= 1'b0;
      Port1_WrPacketRequested <= 1'b0;
      Port1_WrPacketStuffed <= 1'b0;
      Port1_WrPacketXmitted <= 1'b0;
      Port1_WrTidsInUse <= 1'b0;
      Port1_WrDuplicateTid <= 1'b0;
      Port1_WrUnInitializedTID <= 1'b0;
      Port1_WrTimedoutTids <= 1'b0;
      Port1_WrReOrderStateLogic <= 1'b0;
      Port1_WrReOrderStateControl <= 1'b0;
      Port1_WrReOrderStateData0 <= 1'b0;
      Port1_WrReOrderStateData1 <= 1'b0;
      Port1_WrReOrderStateData2 <= 1'b0;
      Port1_WrReOrderStateData3 <= 1'b0;
    end

endmodule
