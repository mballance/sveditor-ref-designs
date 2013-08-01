// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_drr_arbiter.v
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
 *  niu_txc_drr_arbiter.v
 *
 *  DRR Arbiter State Machine
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

module niu_txc_drr_arbiter (
        SysClk,
        Reset_L, 
        Txc_Enabled, 
        MAC_Enabled, 
        FlushEngine, 

        DMA0_Active,
        DMA0_Error,
        DMA0_EofList,
        DMA0_CacheReady,
        DMA0_Partial,
        DMA0_Reset_Scheduled,
        DMA0_Reset_Done,
        DMA1_Active,
        DMA1_Error,
        DMA1_EofList,
        DMA1_CacheReady,
        DMA1_Partial,
        DMA1_Reset_Scheduled,
        DMA1_Reset_Done,
        DMA2_Active,
        DMA2_Error,
        DMA2_EofList,
        DMA2_CacheReady,
        DMA2_Partial,
        DMA2_Reset_Scheduled,
        DMA2_Reset_Done,
        DMA3_Active,
        DMA3_Error,
        DMA3_EofList,
        DMA3_CacheReady,
        DMA3_Partial,
        DMA3_Reset_Scheduled,
        DMA3_Reset_Done,
        DMA4_Active,
        DMA4_Error,
        DMA4_EofList,
        DMA4_CacheReady,
        DMA4_Partial,
        DMA4_Reset_Scheduled,
        DMA4_Reset_Done,
        DMA5_Active,
        DMA5_Error,
        DMA5_EofList,
        DMA5_CacheReady,
        DMA5_Partial,
        DMA5_Reset_Scheduled,
        DMA5_Reset_Done,
        DMA6_Active,
        DMA6_Error,
        DMA6_EofList,
        DMA6_CacheReady,
        DMA6_Partial,
        DMA6_Reset_Scheduled,
        DMA6_Reset_Done,
        DMA7_Active,
        DMA7_Error,
        DMA7_EofList,
        DMA7_CacheReady,
        DMA7_Partial,
        DMA7_Reset_Scheduled,
        DMA7_Reset_Done,
        DMA8_Active,
        DMA8_Error,
        DMA8_EofList,
        DMA8_CacheReady,
        DMA8_Partial,
        DMA8_Reset_Scheduled,
        DMA8_Reset_Done,
        DMA9_Active,
        DMA9_Error,
        DMA9_EofList,
        DMA9_CacheReady,
        DMA9_Partial,
        DMA9_Reset_Scheduled,
        DMA9_Reset_Done,
        DMA10_Active,
        DMA10_Error,
        DMA10_EofList,
        DMA10_CacheReady,
        DMA10_Partial,
        DMA10_Reset_Scheduled,
        DMA10_Reset_Done,
        DMA11_Active,
        DMA11_Error,
        DMA11_EofList,
        DMA11_CacheReady,
        DMA11_Partial,
        DMA11_Reset_Scheduled,
        DMA11_Reset_Done,
        DMA12_Active,
        DMA12_Error,
        DMA12_EofList,
        DMA12_CacheReady,
        DMA12_Partial,
        DMA12_Reset_Scheduled,
        DMA12_Reset_Done,
        DMA13_Active,
        DMA13_Error,
        DMA13_EofList,
        DMA13_CacheReady,
        DMA13_Partial,
        DMA13_Reset_Scheduled,
        DMA13_Reset_Done,
        DMA14_Active,
        DMA14_Error,
        DMA14_EofList,
        DMA14_CacheReady,
        DMA14_Partial,
        DMA14_Reset_Scheduled,
        DMA14_Reset_Done,
        DMA15_Active,
        DMA15_Error,
        DMA15_EofList,
        DMA15_CacheReady,
        DMA15_Partial,
        DMA15_Reset_Scheduled,
        DMA15_Reset_Done,
        DMA16_Active,
        DMA16_Error,
        DMA16_EofList,
        DMA16_CacheReady,
        DMA16_Partial,
        DMA16_Reset_Scheduled,
        DMA16_Reset_Done,
        DMA17_Active,
        DMA17_Error,
        DMA17_EofList,
        DMA17_CacheReady,
        DMA17_Partial,
        DMA17_Reset_Scheduled,
        DMA17_Reset_Done,
        DMA18_Active,
        DMA18_Error,
        DMA18_EofList,
        DMA18_CacheReady,
        DMA18_Partial,
        DMA18_Reset_Scheduled,
        DMA18_Reset_Done,
        DMA19_Active,
        DMA19_Error,
        DMA19_EofList,
        DMA19_CacheReady,
        DMA19_Partial,
        DMA19_Reset_Scheduled,
        DMA19_Reset_Done,
        DMA20_Active,
        DMA20_Error,
        DMA20_EofList,
        DMA20_CacheReady,
        DMA20_Partial,
        DMA20_Reset_Scheduled,
        DMA20_Reset_Done,
        DMA21_Active,
        DMA21_Error,
        DMA21_EofList,
        DMA21_CacheReady,
        DMA21_Partial,
        DMA21_Reset_Scheduled,
        DMA21_Reset_Done,
        DMA22_Active,
        DMA22_Error,
        DMA22_EofList,
        DMA22_CacheReady,
        DMA22_Partial,
        DMA22_Reset_Scheduled,
        DMA22_Reset_Done,
        DMA23_Active,
        DMA23_Error,
        DMA23_EofList,
        DMA23_CacheReady,
        DMA23_Partial,
        DMA23_Reset_Scheduled,
        DMA23_Reset_Done,

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

        Port_DMA_List,
        ClrMaxBurst,        // Clear max burst bit in control register

        DMA0_NoDeficit,
        DMA1_NoDeficit,
        DMA2_NoDeficit,
        DMA3_NoDeficit,
        DMA4_NoDeficit,
        DMA5_NoDeficit,
        DMA6_NoDeficit,
        DMA7_NoDeficit,
        DMA8_NoDeficit,
        DMA9_NoDeficit,
        DMA10_NoDeficit,
        DMA11_NoDeficit,
        DMA12_NoDeficit,
        DMA13_NoDeficit,
        DMA14_NoDeficit,
        DMA15_NoDeficit,
        DMA16_NoDeficit,
        DMA17_NoDeficit,
        DMA18_NoDeficit,
        DMA19_NoDeficit,
        DMA20_NoDeficit,
        DMA21_NoDeficit,
        DMA22_NoDeficit,
        DMA23_NoDeficit,
        AddCreditToContext,
        ClrDeficitForEofList,
        ContextActiveList,

        DRR_PacketDone,
        DRR_Arb_Valid,
        DRR_NextDMAChannel,

        LatchActiveDMA,

        DRR_ArbState
       );
    
`include "txc_defines.h"

// Global Signals
input         SysClk;
input         Reset_L;
input         Txc_Enabled;
input         MAC_Enabled;
input         FlushEngine;

// DAM Cache Registers
//DMA0
input          DMA0_Active;
input          DMA0_Error;
input          DMA0_EofList;
input          DMA0_CacheReady;
input          DMA0_Partial;
input          DMA0_Reset_Scheduled;

output         DMA0_Reset_Done;

//DMA1
input          DMA1_Active;
input          DMA1_Error;
input          DMA1_EofList;
input          DMA1_CacheReady;
input          DMA1_Partial;
input          DMA1_Reset_Scheduled;

output         DMA1_Reset_Done;

//DMA2
input          DMA2_Active;
input          DMA2_Error;
input          DMA2_EofList;
input          DMA2_CacheReady;
input          DMA2_Partial;
input          DMA2_Reset_Scheduled;

output         DMA2_Reset_Done;

//DMA3
input          DMA3_Active;
input          DMA3_Error;
input          DMA3_EofList;
input          DMA3_CacheReady;
input          DMA3_Partial;
input          DMA3_Reset_Scheduled;

output         DMA3_Reset_Done;

//DMA4
input          DMA4_Active;
input          DMA4_Error;
input          DMA4_EofList;
input          DMA4_CacheReady;
input          DMA4_Partial;
input          DMA4_Reset_Scheduled;

output         DMA4_Reset_Done;

//DMA5
input          DMA5_Active;
input          DMA5_Error;
input          DMA5_EofList;
input          DMA5_CacheReady;
input          DMA5_Partial;
input          DMA5_Reset_Scheduled;

output         DMA5_Reset_Done;

//DMA6
input          DMA6_Active;
input          DMA6_Error;
input          DMA6_EofList;
input          DMA6_CacheReady;
input          DMA6_Partial;
input          DMA6_Reset_Scheduled;

output         DMA6_Reset_Done;

//DMA7
input          DMA7_Active;
input          DMA7_Error;
input          DMA7_EofList;
input          DMA7_CacheReady;
input          DMA7_Partial;
input          DMA7_Reset_Scheduled;

output         DMA7_Reset_Done;

//DMA8
input          DMA8_Active;
input          DMA8_Error;
input          DMA8_EofList;
input          DMA8_CacheReady;
input          DMA8_Partial;
input          DMA8_Reset_Scheduled;

output         DMA8_Reset_Done;

//DMA9
input          DMA9_Active;
input          DMA9_Error;
input          DMA9_EofList;
input          DMA9_CacheReady;
input          DMA9_Partial;
input          DMA9_Reset_Scheduled;

output         DMA9_Reset_Done;

//DMA10
input          DMA10_Active;
input          DMA10_Error;
input          DMA10_EofList;
input          DMA10_CacheReady;
input          DMA10_Partial;
input          DMA10_Reset_Scheduled;

output         DMA10_Reset_Done;

//DMA11
input          DMA11_Active;
input          DMA11_Error;
input          DMA11_EofList;
input          DMA11_CacheReady;
input          DMA11_Partial;
input          DMA11_Reset_Scheduled;

output         DMA11_Reset_Done;

//DMA12
input          DMA12_Active;
input          DMA12_Error;
input          DMA12_EofList;
input          DMA12_CacheReady;
input          DMA12_Partial;
input          DMA12_Reset_Scheduled;

output         DMA12_Reset_Done;

//DMA13
input          DMA13_Active;
input          DMA13_Error;
input          DMA13_EofList;
input          DMA13_CacheReady;
input          DMA13_Partial;
input          DMA13_Reset_Scheduled;

output         DMA13_Reset_Done;

//DMA14
input          DMA14_Active;
input          DMA14_Error;
input          DMA14_EofList;
input          DMA14_CacheReady;
input          DMA14_Partial;
input          DMA14_Reset_Scheduled;

output         DMA14_Reset_Done;

//DMA15
input          DMA15_Active;
input          DMA15_Error;
input          DMA15_EofList;
input          DMA15_CacheReady;
input          DMA15_Partial;
input          DMA15_Reset_Scheduled;

output         DMA15_Reset_Done;

//DMA16
input          DMA16_Active;
input          DMA16_Error;
input          DMA16_EofList;
input          DMA16_CacheReady;
input          DMA16_Partial;
input          DMA16_Reset_Scheduled;

output         DMA16_Reset_Done;

//DMA17
input          DMA17_Active;
input          DMA17_Error;
input          DMA17_EofList;
input          DMA17_CacheReady;
input          DMA17_Partial;
input          DMA17_Reset_Scheduled;

output         DMA17_Reset_Done;

//DMA18
input          DMA18_Active;
input          DMA18_Error;
input          DMA18_EofList;
input          DMA18_CacheReady;
input          DMA18_Partial;
input          DMA18_Reset_Scheduled;

output         DMA18_Reset_Done;

//DMA19
input          DMA19_Active;
input          DMA19_Error;
input          DMA19_EofList;
input          DMA19_CacheReady;
input          DMA19_Partial;
input          DMA19_Reset_Scheduled;

output         DMA19_Reset_Done;

//DMA20
input          DMA20_Active;
input          DMA20_Error;
input          DMA20_EofList;
input          DMA20_CacheReady;
input          DMA20_Partial;
input          DMA20_Reset_Scheduled;

output         DMA20_Reset_Done;

//DMA21
input          DMA21_Active;
input          DMA21_Error;
input          DMA21_EofList;
input          DMA21_CacheReady;
input          DMA21_Partial;
input          DMA21_Reset_Scheduled;

output         DMA21_Reset_Done;

//DMA22
input          DMA22_Active;
input          DMA22_Error;
input          DMA22_EofList;
input          DMA22_CacheReady;
input          DMA22_Partial;
input          DMA22_Reset_Scheduled;

output         DMA22_Reset_Done;

//DMA23
input          DMA23_Active;
input          DMA23_Error;
input          DMA23_EofList;
input          DMA23_CacheReady;
input          DMA23_Partial;
input          DMA23_Reset_Scheduled;

output         DMA23_Reset_Done;

// Control Registers
input         DMA0_NewMaxBurst;
input         DMA1_NewMaxBurst;
input         DMA2_NewMaxBurst;
input         DMA3_NewMaxBurst;
input         DMA4_NewMaxBurst;
input         DMA5_NewMaxBurst;
input         DMA6_NewMaxBurst;
input         DMA7_NewMaxBurst;
input         DMA8_NewMaxBurst;
input         DMA9_NewMaxBurst;
input         DMA10_NewMaxBurst;
input         DMA11_NewMaxBurst;
input         DMA12_NewMaxBurst;
input         DMA13_NewMaxBurst;
input         DMA14_NewMaxBurst;
input         DMA15_NewMaxBurst;
input         DMA16_NewMaxBurst;
input         DMA17_NewMaxBurst;
input         DMA18_NewMaxBurst;
input         DMA19_NewMaxBurst;
input         DMA20_NewMaxBurst;
input         DMA21_NewMaxBurst;
input         DMA22_NewMaxBurst;
input         DMA23_NewMaxBurst;
input  [23:0] Port_DMA_List;

output        ClrMaxBurst;

reg           ClrMaxBurst;

// DMA deficit state
input         DMA0_NoDeficit;
input         DMA1_NoDeficit;
input         DMA2_NoDeficit;
input         DMA3_NoDeficit;
input         DMA4_NoDeficit;
input         DMA5_NoDeficit;
input         DMA6_NoDeficit;
input         DMA7_NoDeficit;
input         DMA8_NoDeficit;
input         DMA9_NoDeficit;
input         DMA10_NoDeficit;
input         DMA11_NoDeficit;
input         DMA12_NoDeficit;
input         DMA13_NoDeficit;
input         DMA14_NoDeficit;
input         DMA15_NoDeficit;
input         DMA16_NoDeficit;
input         DMA17_NoDeficit;
input         DMA18_NoDeficit;
input         DMA19_NoDeficit;
input         DMA20_NoDeficit;
input         DMA21_NoDeficit;
input         DMA22_NoDeficit;
input         DMA23_NoDeficit;

output        AddCreditToContext;
output        ClrDeficitForEofList;
output [23:0] ContextActiveList;

reg           AddCreditToContext;
reg           ClrDeficitForEofList;
reg    [23:0] ContextActiveList;

// Data Fetch State Machine
input         DRR_PacketDone;

output        DRR_Arb_Valid;
output [4:0]  DRR_NextDMAChannel;

reg           DRR_Arb_Valid;
reg    [4:0]  DRR_NextDMAChannel;

// Debug Block
output        LatchActiveDMA;

reg           LatchActiveDMA;

// State Machine
output [3:0]  DRR_ArbState;

reg    [3:0]  DRR_ArbState;

/*--------------------------------------------------------------*/
// Wires & Registers
/*--------------------------------------------------------------*/
wire          allDMAdeficited;
wire          activeDMA;
wire          newMaxBurst;
wire          dmaGoneDeficit;
wire          drrStateMachineIdle;
wire          someDMALeftToService;
wire   [23:0] dmaDeficited;
wire   [23:0] activeListDMA;
wire   [23:0] dmaList;
wire   [23:0] dmaEofList;
wire   [23:0] dmaNewMaxBurst;
wire   [23:0] dmaActive;
wire   [23:0] dmaPartial;
wire   [23:0] dmaError;
wire   [23:0] dmacacheReady;
wire   [23:0] dmaResetScheduled;
wire   [23:0] noDMADeficitList;

reg           clrMaxBurst_n;
reg           drr_Valid_n;
reg           updateServiced;
reg           endOfList;
reg           dmaHasAnError;
reg    [3:0]  nextState;
reg    [4:0]  predictedDMA;
reg    [23:0] dmaResetDone;
reg    [23:0] dmaServicedList;
reg    [23:0] currentDMAChannel;
reg    [23:0] noDefictedContextActiveList;

/*--------------------------------------------------------------*/
// Parameters and Defines
/*--------------------------------------------------------------*/
parameter DRR_IDLE            = 4'h0,
          UPDATE_NEW_CREDIT   = 4'h1,
          LATCH_ACTIVE_DMA    = 4'h2,
          CHECK_DEFECITS      = 4'h3,
          DRR_ARBITER         = 4'h4,
          WAIT_FOR_TRANSMIT   = 4'h5,
          CHECK_DMA_STATE     = 4'h6,
          CHECK_ACTIVE_STATE  = 4'h7,
          ADD_CREDITS         = 4'h8;

// synopsys translate_off
reg [192:1] DRR_ARB_STATE;


always @(DRR_ArbState)
begin
  case(DRR_ArbState)
    DRR_IDLE :               DRR_ARB_STATE = "DRR_IDLE";
    UPDATE_NEW_CREDIT:       DRR_ARB_STATE = "UPDATE_NEW_CREDIT";
    LATCH_ACTIVE_DMA :       DRR_ARB_STATE = "LATCH_ACTIVE_DMA";
    CHECK_DEFECITS:          DRR_ARB_STATE = "CHECK_DEFECITS";
    DRR_ARBITER :            DRR_ARB_STATE = "DRR_ARBITER";
    WAIT_FOR_TRANSMIT :      DRR_ARB_STATE = "WAIT_FOR_TRANSMIT";
    CHECK_DMA_STATE :        DRR_ARB_STATE = "CHECK_DMA_STATE";
    CHECK_ACTIVE_STATE :     DRR_ARB_STATE = "CHECK_ACTIVE_STATE";
    ADD_CREDITS :            DRR_ARB_STATE = "ADD_CREDITS";
       default :    DRR_ARB_STATE = "UNKNOWN";
  endcase
end
    always@(posedge DRR_Arb_Valid ) begin
      if ($test$plusargs("DRR_DEBUG")) begin
    $display("DRR DEBUG %m: Selected Channel - %d Time -%t",DRR_NextDMAChannel,$time);
      end
    end


// synopsys translate_on

/*--------------------------------------------------------------*/
// Zero In Checks
/*--------------------------------------------------------------*/


/*--------------------------------------------------------------*/
// Assigns
/*--------------------------------------------------------------*/
assign DMA0_Reset_Done  = dmaResetDone[0];
assign DMA1_Reset_Done  = dmaResetDone[1];
assign DMA2_Reset_Done  = dmaResetDone[2];
assign DMA3_Reset_Done  = dmaResetDone[3];
assign DMA4_Reset_Done  = dmaResetDone[4];
assign DMA5_Reset_Done  = dmaResetDone[5];
assign DMA6_Reset_Done  = dmaResetDone[6];
assign DMA7_Reset_Done  = dmaResetDone[7];
assign DMA8_Reset_Done  = dmaResetDone[8];
assign DMA9_Reset_Done  = dmaResetDone[9];
assign DMA10_Reset_Done = dmaResetDone[10];
assign DMA11_Reset_Done = dmaResetDone[11];
assign DMA12_Reset_Done = dmaResetDone[12];
assign DMA13_Reset_Done = dmaResetDone[13];
assign DMA14_Reset_Done = dmaResetDone[14];
assign DMA15_Reset_Done = dmaResetDone[15];
assign DMA16_Reset_Done = dmaResetDone[16];
assign DMA17_Reset_Done = dmaResetDone[17];
assign DMA18_Reset_Done = dmaResetDone[18];
assign DMA19_Reset_Done = dmaResetDone[19];
assign DMA20_Reset_Done = dmaResetDone[20];
assign DMA21_Reset_Done = dmaResetDone[21];
assign DMA22_Reset_Done = dmaResetDone[22];
assign DMA23_Reset_Done = dmaResetDone[23];

assign dmaEofList = {
                    DMA23_EofList, DMA22_EofList, DMA21_EofList, DMA20_EofList,
                    DMA19_EofList, DMA18_EofList, DMA17_EofList, DMA16_EofList,
                    DMA15_EofList, DMA14_EofList, DMA13_EofList, DMA12_EofList,
                    DMA11_EofList, DMA10_EofList, DMA9_EofList, DMA8_EofList,
                    DMA7_EofList, DMA6_EofList, DMA5_EofList, DMA4_EofList,
                    DMA3_EofList, DMA2_EofList, DMA1_EofList, DMA0_EofList};

assign dmacacheReady = {
                        DMA23_CacheReady, DMA22_CacheReady, DMA21_CacheReady,
                        DMA20_CacheReady, DMA19_CacheReady, DMA18_CacheReady, 
                        DMA17_CacheReady, DMA16_CacheReady, DMA15_CacheReady, 
                        DMA14_CacheReady, DMA13_CacheReady, DMA12_CacheReady, 
                        DMA11_CacheReady, DMA10_CacheReady, DMA9_CacheReady, 
                        DMA8_CacheReady, DMA7_CacheReady, DMA6_CacheReady, 
                        DMA5_CacheReady, DMA4_CacheReady, DMA3_CacheReady, 
                        DMA2_CacheReady, DMA1_CacheReady, DMA0_CacheReady};

assign dmaActive = {
                    DMA23_Active, DMA22_Active, DMA21_Active, 
                    DMA20_Active, DMA19_Active, DMA18_Active, 
                    DMA17_Active, DMA16_Active, DMA15_Active, 
                    DMA14_Active, DMA13_Active, DMA12_Active, 
                    DMA11_Active, DMA10_Active, DMA9_Active, 
                    DMA8_Active, DMA7_Active, DMA6_Active, 
                    DMA5_Active, DMA4_Active, DMA3_Active, 
                    DMA2_Active, DMA1_Active, DMA0_Active};

assign dmaPartial = {
                     DMA23_Partial, DMA22_Partial, DMA21_Partial, 
                     DMA20_Partial, DMA19_Partial, DMA18_Partial, 
                     DMA17_Partial, DMA16_Partial, DMA15_Partial, 
                     DMA14_Partial, DMA13_Partial, DMA12_Partial, 
                     DMA11_Partial, DMA10_Partial, DMA9_Partial, 
                     DMA8_Partial, DMA7_Partial, DMA6_Partial, 
                     DMA5_Partial, DMA4_Partial, DMA3_Partial, 
                     DMA2_Partial, DMA1_Partial, DMA0_Partial};

assign dmaResetScheduled = {
                            DMA23_Reset_Scheduled, DMA22_Reset_Scheduled,
                            DMA21_Reset_Scheduled, DMA20_Reset_Scheduled,
                            DMA19_Reset_Scheduled, DMA18_Reset_Scheduled, 
                            DMA17_Reset_Scheduled, DMA16_Reset_Scheduled,
                            DMA15_Reset_Scheduled, DMA14_Reset_Scheduled,
                            DMA13_Reset_Scheduled, DMA12_Reset_Scheduled, 
                            DMA11_Reset_Scheduled, DMA10_Reset_Scheduled,
                            DMA9_Reset_Scheduled, DMA8_Reset_Scheduled,
                            DMA7_Reset_Scheduled, DMA6_Reset_Scheduled, 
                            DMA5_Reset_Scheduled, DMA4_Reset_Scheduled,
                            DMA3_Reset_Scheduled, DMA2_Reset_Scheduled,
                            DMA1_Reset_Scheduled, DMA0_Reset_Scheduled};

assign dmaError = {
                   DMA23_Error, DMA22_Error, DMA21_Error,
                   DMA20_Error, DMA19_Error, DMA18_Error,
                   DMA17_Error, DMA16_Error, DMA15_Error,
                   DMA14_Error, DMA13_Error, DMA12_Error,
                   DMA11_Error, DMA10_Error, DMA9_Error,
                   DMA8_Error, DMA7_Error, DMA6_Error,
                   DMA5_Error, DMA4_Error, DMA3_Error,
                   DMA2_Error, DMA1_Error, DMA0_Error};

assign noDMADeficitList = {
                           DMA23_NoDeficit, DMA22_NoDeficit, DMA21_NoDeficit, 
                           DMA20_NoDeficit, DMA19_NoDeficit, DMA18_NoDeficit, 
                           DMA17_NoDeficit, DMA16_NoDeficit, DMA15_NoDeficit, 
                           DMA14_NoDeficit, DMA13_NoDeficit, DMA12_NoDeficit, 
                           DMA11_NoDeficit, DMA10_NoDeficit, DMA9_NoDeficit,  
                           DMA8_NoDeficit, DMA7_NoDeficit,  DMA6_NoDeficit,  
                           DMA5_NoDeficit, DMA4_NoDeficit,  DMA3_NoDeficit,  
                           DMA2_NoDeficit, DMA1_NoDeficit,  DMA0_NoDeficit
                          };

assign dmaNewMaxBurst = {
                         DMA23_NewMaxBurst, DMA22_NewMaxBurst,
                         DMA21_NewMaxBurst, DMA20_NewMaxBurst,
                         DMA19_NewMaxBurst, DMA18_NewMaxBurst,
                         DMA17_NewMaxBurst, DMA16_NewMaxBurst,
                         DMA15_NewMaxBurst, DMA14_NewMaxBurst,
                         DMA13_NewMaxBurst, DMA12_NewMaxBurst,
                         DMA11_NewMaxBurst, DMA10_NewMaxBurst,
                         DMA9_NewMaxBurst, DMA8_NewMaxBurst,
                         DMA7_NewMaxBurst, DMA6_NewMaxBurst,
                         DMA5_NewMaxBurst, DMA4_NewMaxBurst,
                         DMA3_NewMaxBurst, DMA2_NewMaxBurst,
                         DMA1_NewMaxBurst, DMA0_NewMaxBurst
                        };


assign activeListDMA   = (dmaActive & dmacacheReady & Port_DMA_List
                          & 
                          ~dmaError & ~dmaEofList
                          & 
                          ~dmaPartial & ~dmaResetScheduled);

assign activeDMA       = |(activeListDMA);

assign dmaDeficited    = (~noDMADeficitList | dmaEofList
                          |
                          ~noDefictedContextActiveList);

assign allDMAdeficited = &(dmaDeficited);
assign dmaGoneDeficit  = (|(dmaDeficited  & currentDMAChannel));
assign newMaxBurst     = |(dmaNewMaxBurst & Port_DMA_List);

assign someDMALeftToService = (|(ContextActiveList & dmaServicedList));

/*--------------------------------------------------------------*/
// For Debug Only, need to remove later
/*--------------------------------------------------------------*/
// synopsys translate_off

wire          dma0Deficited;
wire          dma1Deficited;
wire          dma2Deficited;
wire          dma3Deficited;
wire          dma4Deficited;
wire          dma5Deficited;
wire          dma6Deficited;
wire          dma7Deficited;
wire          dma8Deficited;
wire          dma9Deficited;
wire          dma10Deficited;
wire          dma11Deficited;
wire          dma12Deficited;
wire          dma13Deficited;
wire          dma14Deficited;
wire          dma15Deficited;
wire          dma16Deficited;
wire          dma17Deficited;
wire          dma18Deficited;
wire          dma19Deficited;
wire          dma20Deficited;
wire          dma21Deficited;
wire          dma22Deficited;
wire          dma23Deficited;

assign dma0Deficited  = dmaDeficited[0];
assign dma1Deficited  = dmaDeficited[1];
assign dma2Deficited  = dmaDeficited[2];
assign dma3Deficited  = dmaDeficited[3];
assign dma4Deficited  = dmaDeficited[4];
assign dma5Deficited  = dmaDeficited[5];
assign dma6Deficited  = dmaDeficited[6];
assign dma7Deficited  = dmaDeficited[7];
assign dma8Deficited  = dmaDeficited[8];
assign dma9Deficited  = dmaDeficited[9];
assign dma10Deficited = dmaDeficited[10];
assign dma11Deficited = dmaDeficited[11];
assign dma12Deficited = dmaDeficited[12];
assign dma13Deficited = dmaDeficited[13];
assign dma14Deficited = dmaDeficited[14];
assign dma15Deficited = dmaDeficited[15];
assign dma16Deficited = dmaDeficited[16];
assign dma17Deficited = dmaDeficited[17];
assign dma18Deficited = dmaDeficited[18];
assign dma19Deficited = dmaDeficited[19];
assign dma20Deficited = dmaDeficited[20];
assign dma21Deficited = dmaDeficited[21];
assign dma22Deficited = dmaDeficited[22];
assign dma23Deficited = dmaDeficited[23];

// synopsys translate_on

/*--------------------------------------------------------------*/
// Round Robin
/*--------------------------------------------------------------*/

assign dmaList = (noDefictedContextActiveList & dmaServicedList);

always @(dmaList
        )
    casex(dmaList) // synopsys parallel_case 
      24'bxxxx_xxxx_xxxx_xxxx_xxxx_xxx1:
            predictedDMA = `DMA_CHANNEL_ZERO;
      24'bxxxx_xxxx_xxxx_xxxx_xxxx_xx10:
            predictedDMA = `DMA_CHANNEL_ONE;
      24'bxxxx_xxxx_xxxx_xxxx_xxxx_x100:
            predictedDMA = `DMA_CHANNEL_TWO;
      24'bxxxx_xxxx_xxxx_xxxx_xxxx_1000:
            predictedDMA = `DMA_CHANNEL_THREE;
      24'bxxxx_xxxx_xxxx_xxxx_xxx1_0000:
            predictedDMA = `DMA_CHANNEL_FOUR;
      24'bxxxx_xxxx_xxxx_xxxx_xx10_0000:
            predictedDMA = `DMA_CHANNEL_FIVE;
      24'bxxxx_xxxx_xxxx_xxxx_x100_0000:
            predictedDMA = `DMA_CHANNEL_SIX;
      24'bxxxx_xxxx_xxxx_xxxx_1000_0000:
            predictedDMA = `DMA_CHANNEL_SEVEN;
      24'bxxxx_xxxx_xxxx_xxx1_0000_0000:
            predictedDMA = `DMA_CHANNEL_EIGHT;
      24'bxxxx_xxxx_xxxx_xx10_0000_0000:
            predictedDMA = `DMA_CHANNEL_NINE;
      24'bxxxx_xxxx_xxxx_x100_0000_0000:
            predictedDMA = `DMA_CHANNEL_TEN;
      24'bxxxx_xxxx_xxxx_1000_0000_0000:
            predictedDMA = `DMA_CHANNEL_ELEVEN;
      24'bxxxx_xxxx_xxx1_0000_0000_0000:
            predictedDMA = `DMA_CHANNEL_TWELVE;
      24'bxxxx_xxxx_xx10_0000_0000_0000:
            predictedDMA = `DMA_CHANNEL_THIRTEEN;
      24'bxxxx_xxxx_x100_0000_0000_0000:
            predictedDMA = `DMA_CHANNEL_FOURTEEN;
      24'bxxxx_xxxx_1000_0000_0000_0000:
            predictedDMA = `DMA_CHANNEL_FIFTEEN;
      24'bxxxx_xxx1_0000_0000_0000_0000:
            predictedDMA = `DMA_CHANNEL_SIXTEEN;
      24'bxxxx_xx10_0000_0000_0000_0000:
            predictedDMA = `DMA_CHANNEL_SEVENTEEN;
      24'bxxxx_x100_0000_0000_0000_0000:
            predictedDMA = `DMA_CHANNEL_EIGHTEEN;
      24'bxxxx_1000_0000_0000_0000_0000:
            predictedDMA = `DMA_CHANNEL_NINETEEN;
      24'bxxx1_0000_0000_0000_0000_0000:
            predictedDMA = `DMA_CHANNEL_TWENTY;
      24'bxx10_0000_0000_0000_0000_0000:
            predictedDMA = `DMA_CHANNEL_TWENTYONE;
      24'bx100_0000_0000_0000_0000_0000:
            predictedDMA = `DMA_CHANNEL_TWENTYTWO;
      24'b1000_0000_0000_0000_0000_0000:
            predictedDMA = `DMA_CHANNEL_TWENTYTHREE;
          default: predictedDMA = 5'hx;
    endcase

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

always @(DRR_NextDMAChannel
         or DMA23_EofList or DMA22_EofList or DMA21_EofList or DMA20_EofList
         or DMA19_EofList or DMA18_EofList or DMA17_EofList or DMA16_EofList
         or DMA15_EofList or DMA14_EofList or DMA13_EofList or DMA12_EofList
         or DMA11_EofList or DMA10_EofList or DMA9_EofList or DMA8_EofList
         or DMA7_EofList or DMA6_EofList or DMA5_EofList or DMA4_EofList
         or DMA3_EofList or DMA2_EofList or DMA1_EofList or DMA0_EofList
        )
    case(DRR_NextDMAChannel) // synopsys full_case parallel_case
     `DMA_CHANNEL_ZERO:         endOfList = DMA0_EofList;
     `DMA_CHANNEL_ONE:          endOfList = DMA1_EofList;
     `DMA_CHANNEL_TWO:          endOfList = DMA2_EofList;
     `DMA_CHANNEL_THREE:        endOfList = DMA3_EofList;
     `DMA_CHANNEL_FOUR:         endOfList = DMA4_EofList;
     `DMA_CHANNEL_FIVE:         endOfList = DMA5_EofList;
     `DMA_CHANNEL_SIX:          endOfList = DMA6_EofList;
     `DMA_CHANNEL_SEVEN:        endOfList = DMA7_EofList;
     `DMA_CHANNEL_EIGHT:        endOfList = DMA8_EofList;
     `DMA_CHANNEL_NINE:         endOfList = DMA9_EofList;
     `DMA_CHANNEL_TEN:          endOfList = DMA10_EofList;
     `DMA_CHANNEL_ELEVEN:       endOfList = DMA11_EofList;
     `DMA_CHANNEL_TWELVE:       endOfList = DMA12_EofList;
     `DMA_CHANNEL_THIRTEEN:     endOfList = DMA13_EofList;
     `DMA_CHANNEL_FOURTEEN:     endOfList = DMA14_EofList;
     `DMA_CHANNEL_FIFTEEN:      endOfList = DMA15_EofList;
     `DMA_CHANNEL_SIXTEEN:      endOfList = DMA16_EofList;
     `DMA_CHANNEL_SEVENTEEN:    endOfList = DMA17_EofList;
     `DMA_CHANNEL_EIGHTEEN:     endOfList = DMA18_EofList;
     `DMA_CHANNEL_NINETEEN:     endOfList = DMA19_EofList;
     `DMA_CHANNEL_TWENTY:       endOfList = DMA20_EofList;
     `DMA_CHANNEL_TWENTYONE:    endOfList = DMA21_EofList;
     `DMA_CHANNEL_TWENTYTWO:    endOfList = DMA22_EofList;
     `DMA_CHANNEL_TWENTYTHREE:  endOfList = DMA23_EofList;
           default: endOfList = 1'bx;
    endcase

always @(DRR_NextDMAChannel
         or DMA23_Error or DMA22_Error or DMA21_Error or DMA20_Error
         or DMA19_Error or DMA18_Error or DMA17_Error or DMA16_Error
         or DMA15_Error or DMA14_Error or DMA13_Error or DMA12_Error
         or DMA11_Error or DMA10_Error or DMA9_Error or DMA8_Error
         or DMA7_Error or DMA6_Error or DMA5_Error or DMA4_Error
         or DMA3_Error or DMA2_Error or DMA1_Error or DMA0_Error
        )
    case(DRR_NextDMAChannel) // synopsys full_case parallel_case
     `DMA_CHANNEL_ZERO:         dmaHasAnError = DMA0_Error;
     `DMA_CHANNEL_ONE:          dmaHasAnError = DMA1_Error;
     `DMA_CHANNEL_TWO:          dmaHasAnError = DMA2_Error;
     `DMA_CHANNEL_THREE:        dmaHasAnError = DMA3_Error;
     `DMA_CHANNEL_FOUR:         dmaHasAnError = DMA4_Error;
     `DMA_CHANNEL_FIVE:         dmaHasAnError = DMA5_Error;
     `DMA_CHANNEL_SIX:          dmaHasAnError = DMA6_Error;
     `DMA_CHANNEL_SEVEN:        dmaHasAnError = DMA7_Error;
     `DMA_CHANNEL_EIGHT:        dmaHasAnError = DMA8_Error;
     `DMA_CHANNEL_NINE:         dmaHasAnError = DMA9_Error;
     `DMA_CHANNEL_TEN:          dmaHasAnError = DMA10_Error;
     `DMA_CHANNEL_ELEVEN:       dmaHasAnError = DMA11_Error;
     `DMA_CHANNEL_TWELVE:       dmaHasAnError = DMA12_Error;
     `DMA_CHANNEL_THIRTEEN:     dmaHasAnError = DMA13_Error;
     `DMA_CHANNEL_FOURTEEN:     dmaHasAnError = DMA14_Error;
     `DMA_CHANNEL_FIFTEEN:      dmaHasAnError = DMA15_Error;
     `DMA_CHANNEL_SIXTEEN:      dmaHasAnError = DMA16_Error;
     `DMA_CHANNEL_SEVENTEEN:    dmaHasAnError = DMA17_Error;
     `DMA_CHANNEL_EIGHTEEN:     dmaHasAnError = DMA18_Error;
     `DMA_CHANNEL_NINETEEN:     dmaHasAnError = DMA19_Error;
     `DMA_CHANNEL_TWENTY:       dmaHasAnError = DMA20_Error;
     `DMA_CHANNEL_TWENTYONE:    dmaHasAnError = DMA21_Error;
     `DMA_CHANNEL_TWENTYTWO:    dmaHasAnError = DMA22_Error;
     `DMA_CHANNEL_TWENTYTHREE:  dmaHasAnError = DMA23_Error;
           default: dmaHasAnError = 1'bx;
    endcase

/*--------------------------------------------------------------*/
// Instantiated Flops
/*--------------------------------------------------------------*/
always @(posedge SysClk)
  if (!Reset_L) ClrMaxBurst <= #`SD 1'b0;
  else          ClrMaxBurst <= #`SD clrMaxBurst_n;

always @(posedge SysClk)
  if (!Reset_L)            DRR_Arb_Valid <= #`SD 1'b0;
  else if (drr_Valid_n)    DRR_Arb_Valid <= #`SD 1'b1;
  else if (DRR_PacketDone) DRR_Arb_Valid <= #`SD 1'b0;

always @(posedge SysClk)
  if (!Reset_L)         DRR_NextDMAChannel <= #`SD 5'h0;
  else if (drr_Valid_n) DRR_NextDMAChannel <= #`SD predictedDMA;

/*--------------------------------------------------------------*/
// Reset Done Logic Flops
/*--------------------------------------------------------------*/
assign drrStateMachineIdle = (DRR_ArbState == DRR_IDLE);

always @(posedge SysClk)
  if (!Reset_L)                 dmaResetDone <= #`SD 24'h0;
  else if (LatchActiveDMA)      dmaResetDone <= #`SD dmaResetScheduled
                                                     &
                                                     Port_DMA_List;
  else if (drrStateMachineIdle) dmaResetDone <= #`SD dmaResetScheduled
                                                     &
                                                     Port_DMA_List;
  else                          dmaResetDone <= #`SD dmaResetDone
                                                     &
                                                     Port_DMA_List
                                                     &
                                                     dmaResetScheduled
                                                     &
                                                     dmaActive;

/*--------------------------------------------------------------*/
// Instantiated Flops
//
// ContextActiveList is a list of participating dmas that will
// get acredit update whether deficited or not
//
// noDeficted dma are participants of drr arbitration.
/*--------------------------------------------------------------*/
always @(posedge SysClk)
  if (!Reset_L)            ContextActiveList <= #`SD 24'b0;
  else if (LatchActiveDMA) ContextActiveList <= #`SD activeListDMA;

always @(posedge SysClk)
  if (!Reset_L)            noDefictedContextActiveList <= #`SD 24'b0;
  else if (LatchActiveDMA) noDefictedContextActiveList <= #`SD activeListDMA
                                                               &
                                                               noDMADeficitList;

always @(posedge SysClk)
  if (!Reset_L)            dmaServicedList <= #`SD 24'b0;
  else if (LatchActiveDMA) dmaServicedList <= #`SD activeListDMA
                                                   &
                                                   noDMADeficitList;
  else if (updateServiced)
        dmaServicedList <= #`SD dmaServicedList
                                ^
                                currentDMAChannel;

/*--------------------------------------------------------------*/
// DRR Arbiter State Vector
/*--------------------------------------------------------------*/
always @(posedge SysClk)
  if (!Reset_L) DRR_ArbState <= #`SD DRR_IDLE;
  else          DRR_ArbState <= #`SD nextState;

/*--------------------------------------------------------------*/
// DRR Arbiter State Machine
/*--------------------------------------------------------------*/
function [3:0] Defaults;
input [3:0] currentState;
  begin
    Defaults = currentState;
    clrMaxBurst_n = 1'b0;
    LatchActiveDMA = 1'b0;
    drr_Valid_n = 1'b0;
    AddCreditToContext = 1'b0;
    ClrDeficitForEofList = 1'b0;
    updateServiced = 1'b0;
  end
endfunction


always @(/*AUTOSENSE*/FlushEngine or MAC_Enabled
     or DRR_PacketDone or Txc_Enabled or activeDMA
     or someDMALeftToService
     or allDMAdeficited or ContextActiveList or dmaGoneDeficit
     or newMaxBurst or endOfList or dmaHasAnError
     or DRR_ArbState)

      case(DRR_ArbState) // synopsys full_case parallel_case
                         /* 0in < case -full -parallel */
        DRR_IDLE:
          begin
            nextState = Defaults(DRR_ArbState);

            if (Txc_Enabled) 
              begin
                if (MAC_Enabled) 
                  begin
                    if (newMaxBurst) 
                      begin
                        nextState = UPDATE_NEW_CREDIT;
                        clrMaxBurst_n = 1'b1;
                      end
                    else if (activeDMA) 
                      nextState = LATCH_ACTIVE_DMA;
                  end
              end
          end

        UPDATE_NEW_CREDIT:
          begin
            nextState = Defaults(DRR_ArbState);

            if (activeDMA) 
              nextState = LATCH_ACTIVE_DMA;
            else 
              nextState = DRR_IDLE;

          end

        LATCH_ACTIVE_DMA:
          begin
            nextState = Defaults(DRR_ArbState);
            LatchActiveDMA = 1'b1;
            nextState =  CHECK_DEFECITS;
          end

        CHECK_DEFECITS:
          begin
            nextState = Defaults(DRR_ArbState);

            if (|ContextActiveList)
              begin
                if (allDMAdeficited)
                  nextState = ADD_CREDITS;
                else
                  nextState = DRR_ARBITER;
              end
            else
              nextState = DRR_IDLE;
          end

        DRR_ARBITER:
          begin
            nextState = Defaults(DRR_ArbState);
            drr_Valid_n = 1'b1;
            nextState = WAIT_FOR_TRANSMIT;
          end

        WAIT_FOR_TRANSMIT:
          begin
            nextState = Defaults(DRR_ArbState);

            if (FlushEngine) 
              nextState = DRR_IDLE;
            else if (DRR_PacketDone) 
              nextState = CHECK_DMA_STATE;
          end

        CHECK_DMA_STATE:
          begin
            nextState = Defaults(DRR_ArbState);

            if (dmaGoneDeficit | endOfList | dmaHasAnError)
              updateServiced = 1'b1;

            if (FlushEngine) 
              nextState = DRR_IDLE;
            else if (allDMAdeficited)
              nextState = ADD_CREDITS;
            else
              nextState = CHECK_ACTIVE_STATE;
          end

        CHECK_ACTIVE_STATE:
          begin
            nextState = Defaults(DRR_ArbState);

            if (someDMALeftToService)
              nextState = DRR_ARBITER;
            else
              begin
                ClrDeficitForEofList = 1'b1;
                nextState = DRR_IDLE;
              end
          end

        ADD_CREDITS:
          begin
            nextState = Defaults(DRR_ArbState);
            AddCreditToContext = 1'b1;
            ClrDeficitForEofList = 1'b1;

            if (FlushEngine) 
              nextState = DRR_IDLE;
            else if (newMaxBurst)
              begin
                clrMaxBurst_n = 1'b1;
                nextState = UPDATE_NEW_CREDIT;
              end
            else
              nextState = DRR_IDLE;
          end

      endcase

endmodule
