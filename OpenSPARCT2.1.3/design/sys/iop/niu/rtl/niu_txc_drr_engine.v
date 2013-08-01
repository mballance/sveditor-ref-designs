// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_drr_engine.v
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
 *  niu_txc_drr_engine.v
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

module niu_txc_drr_engine (
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
        Port_DMA_List,
        ClrMaxBurst,        // Clear max burst bit in control register

        DRR_PacketDone,
        DRR_PacketByteCount,

        DRR_Arb_Valid,
        DRR_NextDMAChannel,

        LatchActiveDMA,
        ContextActiveList,

        DRR_ArbState
       );
    
`include "txc_defines.h"

// Global Signals
input         SysClk;
input         Reset_L;
input         Txc_Enabled;
input         MAC_Enabled;
input         FlushEngine;

// DMA Cache Registers

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
input  [19:0] DMA0_MaxBurst;
input  [19:0] DMA1_MaxBurst;
input  [19:0] DMA2_MaxBurst;
input  [19:0] DMA3_MaxBurst;
input  [19:0] DMA4_MaxBurst;
input  [19:0] DMA5_MaxBurst;
input  [19:0] DMA6_MaxBurst;
input  [19:0] DMA7_MaxBurst;
input  [19:0] DMA8_MaxBurst;
input  [19:0] DMA9_MaxBurst;
input  [19:0] DMA10_MaxBurst;
input  [19:0] DMA11_MaxBurst;
input  [19:0] DMA12_MaxBurst;
input  [19:0] DMA13_MaxBurst;
input  [19:0] DMA14_MaxBurst;
input  [19:0] DMA15_MaxBurst;
input  [19:0] DMA16_MaxBurst;
input  [19:0] DMA17_MaxBurst;
input  [19:0] DMA18_MaxBurst;
input  [19:0] DMA19_MaxBurst;
input  [19:0] DMA20_MaxBurst;
input  [19:0] DMA21_MaxBurst;
input  [19:0] DMA22_MaxBurst;
input  [19:0] DMA23_MaxBurst;
input  [23:0] Port_DMA_List;

output        ClrMaxBurst;

// Data Fetsch State Machine
input         DRR_PacketDone;
input  [15:0] DRR_PacketByteCount;

output        DRR_Arb_Valid;
output [4:0]  DRR_NextDMAChannel;

// Debug Block
output        LatchActiveDMA;
output [23:0] ContextActiveList;

// State Machine
output [3:0]  DRR_ArbState;

/*--------------------------------------------------------------*/
// Wires & Registers
/*--------------------------------------------------------------*/
wire          dma0_NoDeficit;
wire          dma1_NoDeficit;
wire          dma2_NoDeficit;
wire          dma3_NoDeficit;
wire          dma4_NoDeficit;
wire          dma5_NoDeficit;
wire          dma6_NoDeficit;
wire          dma7_NoDeficit;
wire          dma8_NoDeficit;
wire          dma9_NoDeficit;
wire          dma10_NoDeficit;
wire          dma11_NoDeficit;
wire          dma12_NoDeficit;
wire          dma13_NoDeficit;
wire          dma14_NoDeficit;
wire          dma15_NoDeficit;
wire          dma16_NoDeficit;
wire          dma17_NoDeficit;
wire          dma18_NoDeficit;
wire          dma19_NoDeficit;
wire          dma20_NoDeficit;
wire          dma21_NoDeficit;
wire          dma22_NoDeficit;
wire          dma23_NoDeficit;
wire          addCreditToContext;
wire          clrDeficitForEofList;

/*--------------------------------------------------------------*/
// Parameters and Defines
/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/
// Zero In Checks
/*--------------------------------------------------------------*/


/*--------------------------------------------------------------*/
// Module Instantiations
/*--------------------------------------------------------------*/

niu_txc_drr_arbiter niu_txc_drr_arbiter (

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
        .Port_DMA_List                   (Port_DMA_List),
        .ClrMaxBurst                     (ClrMaxBurst),

        .DMA0_NoDeficit                  (dma0_NoDeficit),
        .DMA1_NoDeficit                  (dma1_NoDeficit),
        .DMA2_NoDeficit                  (dma2_NoDeficit),
        .DMA3_NoDeficit                  (dma3_NoDeficit),
        .DMA4_NoDeficit                  (dma4_NoDeficit),
        .DMA5_NoDeficit                  (dma5_NoDeficit),
        .DMA6_NoDeficit                  (dma6_NoDeficit),
        .DMA7_NoDeficit                  (dma7_NoDeficit),
        .DMA8_NoDeficit                  (dma8_NoDeficit),
        .DMA9_NoDeficit                  (dma9_NoDeficit),
        .DMA10_NoDeficit                 (dma10_NoDeficit),
        .DMA11_NoDeficit                 (dma11_NoDeficit),
        .DMA12_NoDeficit                 (dma12_NoDeficit),
        .DMA13_NoDeficit                 (dma13_NoDeficit),
        .DMA14_NoDeficit                 (dma14_NoDeficit),
        .DMA15_NoDeficit                 (dma15_NoDeficit),
        .DMA16_NoDeficit                 (dma16_NoDeficit),
        .DMA17_NoDeficit                 (dma17_NoDeficit),
        .DMA18_NoDeficit                 (dma18_NoDeficit),
        .DMA19_NoDeficit                 (dma19_NoDeficit),
        .DMA20_NoDeficit                 (dma20_NoDeficit),
        .DMA21_NoDeficit                 (dma21_NoDeficit),
        .DMA22_NoDeficit                 (dma22_NoDeficit),
        .DMA23_NoDeficit                 (dma23_NoDeficit),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList),

        .DRR_PacketDone                  (DRR_PacketDone),
        .DRR_Arb_Valid                   (DRR_Arb_Valid),
        .DRR_NextDMAChannel              (DRR_NextDMAChannel),

        .LatchActiveDMA                  (LatchActiveDMA),

        .DRR_ArbState                    (DRR_ArbState)
       );


niu_txc_drr_context niu_txc_drr_context0 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA0_NewMaxBurst),
        .MaxBurst                        (DMA0_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA0_Reset_Done),
        .DMA_EofList                     (DMA0_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[0]),
        .NoDeficit                       (dma0_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_ZERO)
       );

niu_txc_drr_context niu_txc_drr_context1 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA1_NewMaxBurst),
        .MaxBurst                        (DMA1_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA1_Reset_Done),
        .DMA_EofList                     (DMA1_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[1]),
        .NoDeficit                       (dma1_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_ONE)
       );

niu_txc_drr_context niu_txc_drr_context2 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA2_NewMaxBurst),
        .MaxBurst                        (DMA2_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA2_Reset_Done),
        .DMA_EofList                     (DMA2_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[2]),
        .NoDeficit                       (dma2_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_TWO)
       );

niu_txc_drr_context niu_txc_drr_context3 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA3_NewMaxBurst),
        .MaxBurst                        (DMA3_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA3_Reset_Done),
        .DMA_EofList                     (DMA3_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[3]),
        .NoDeficit                       (dma3_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_THREE)
       );

niu_txc_drr_context niu_txc_drr_context4 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA4_NewMaxBurst),
        .MaxBurst                        (DMA4_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA4_Reset_Done),
        .DMA_EofList                     (DMA4_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[4]),
        .NoDeficit                       (dma4_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_FOUR)
       );

niu_txc_drr_context niu_txc_drr_context5 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA5_NewMaxBurst),
        .MaxBurst                        (DMA5_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA5_Reset_Done),
        .DMA_EofList                     (DMA5_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[5]),
        .NoDeficit                       (dma5_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_FIVE)
       );

niu_txc_drr_context niu_txc_drr_context6 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA6_NewMaxBurst),
        .MaxBurst                        (DMA6_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA6_Reset_Done),
        .DMA_EofList                     (DMA6_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[6]),
        .NoDeficit                       (dma6_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_SIX)
       );

niu_txc_drr_context niu_txc_drr_context7 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA7_NewMaxBurst),
        .MaxBurst                        (DMA7_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA7_Reset_Done),
        .DMA_EofList                     (DMA7_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[7]),
        .NoDeficit                       (dma7_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_SEVEN)
       );

niu_txc_drr_context niu_txc_drr_context8 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA8_NewMaxBurst),
        .MaxBurst                        (DMA8_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA8_Reset_Done),
        .DMA_EofList                     (DMA8_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[8]),
        .NoDeficit                       (dma8_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_EIGHT)
       );

niu_txc_drr_context niu_txc_drr_context9 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA9_NewMaxBurst),
        .MaxBurst                        (DMA9_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA9_Reset_Done),
        .DMA_EofList                     (DMA9_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[9]),
        .NoDeficit                       (dma9_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_NINE)
       );




niu_txc_drr_context niu_txc_drr_context10 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA10_NewMaxBurst),
        .MaxBurst                        (DMA10_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA10_Reset_Done),
        .DMA_EofList                     (DMA10_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[10]),
        .NoDeficit                       (dma10_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_TEN)
       );

niu_txc_drr_context niu_txc_drr_context11 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA11_NewMaxBurst),
        .MaxBurst                        (DMA11_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA11_Reset_Done),
        .DMA_EofList                     (DMA11_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[11]),
        .NoDeficit                       (dma11_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_ELEVEN)
       );

niu_txc_drr_context niu_txc_drr_context12 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA12_NewMaxBurst),
        .MaxBurst                        (DMA12_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA12_Reset_Done),
        .DMA_EofList                     (DMA12_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[12]),
        .NoDeficit                       (dma12_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_TWELVE)
       );

niu_txc_drr_context niu_txc_drr_context13 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA13_NewMaxBurst),
        .MaxBurst                        (DMA13_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA13_Reset_Done),
        .DMA_EofList                     (DMA13_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[13]),
        .NoDeficit                       (dma13_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_THIRTEEN)
       );

niu_txc_drr_context niu_txc_drr_context14 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA14_NewMaxBurst),
        .MaxBurst                        (DMA14_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA14_Reset_Done),
        .DMA_EofList                     (DMA14_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[14]),
        .NoDeficit                       (dma14_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_FOURTEEN)
       );

niu_txc_drr_context niu_txc_drr_context15 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA15_NewMaxBurst),
        .MaxBurst                        (DMA15_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA15_Reset_Done),
        .DMA_EofList                     (DMA15_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[15]),
        .NoDeficit                       (dma15_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_FIFTEEN)
       );

niu_txc_drr_context niu_txc_drr_context16 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA16_NewMaxBurst),
        .MaxBurst                        (DMA16_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA16_Reset_Done),
        .DMA_EofList                     (DMA16_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[16]),
        .NoDeficit                       (dma16_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_SIXTEEN)
       );

niu_txc_drr_context niu_txc_drr_context17 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA17_NewMaxBurst),
        .MaxBurst                        (DMA17_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA17_Reset_Done),
        .DMA_EofList                     (DMA17_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[17]),
        .NoDeficit                       (dma17_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_SEVENTEEN)
       );

niu_txc_drr_context niu_txc_drr_context18 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA18_NewMaxBurst),
        .MaxBurst                        (DMA18_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA18_Reset_Done),
        .DMA_EofList                     (DMA18_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[18]),
        .NoDeficit                       (dma18_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_EIGHTEEN)
       );

niu_txc_drr_context niu_txc_drr_context19 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA19_NewMaxBurst),
        .MaxBurst                        (DMA19_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA19_Reset_Done),
        .DMA_EofList                     (DMA19_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[19]),
        .NoDeficit                       (dma19_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_NINETEEN)
       );

niu_txc_drr_context niu_txc_drr_context20 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA20_NewMaxBurst),
        .MaxBurst                        (DMA20_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA20_Reset_Done),
        .DMA_EofList                     (DMA20_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[20]),
        .NoDeficit                       (dma20_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_TWENTY)
       );

niu_txc_drr_context niu_txc_drr_context21 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA21_NewMaxBurst),
        .MaxBurst                        (DMA21_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA21_Reset_Done),
        .DMA_EofList                     (DMA21_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[21]),
        .NoDeficit                       (dma21_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_TWENTYONE)
       );

niu_txc_drr_context niu_txc_drr_context22 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA22_NewMaxBurst),
        .MaxBurst                        (DMA22_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA22_Reset_Done),
        .DMA_EofList                     (DMA22_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[22]),
        .NoDeficit                       (dma22_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_TWENTYTWO)
       );

niu_txc_drr_context niu_txc_drr_context23 (
        .SysClk                          (SysClk),
        .Reset_L                         (Reset_L),
        .FlushEngine                     (FlushEngine),
        .ClrMaxBurst                     (ClrMaxBurst),
        .NewMaxBurst                     (DMA23_NewMaxBurst),
        .MaxBurst                        (DMA23_MaxBurst),
        .PacketDone                      (DRR_PacketDone),
        .PacketByteCount                 (DRR_PacketByteCount),
        .DMA_Reset_Done                  (DMA23_Reset_Done),
        .DMA_EofList                     (DMA23_EofList),
        .AddCreditToContext              (addCreditToContext),
        .ClrDeficitForEofList            (clrDeficitForEofList),
        .ContextActiveList               (ContextActiveList[23]),
        .NoDeficit                       (dma23_NoDeficit),
        .NextDMAChannel                  (DRR_NextDMAChannel),
        .ContextNumber                   (`DMA_CHANNEL_TWENTYTHREE)
       );

endmodule
