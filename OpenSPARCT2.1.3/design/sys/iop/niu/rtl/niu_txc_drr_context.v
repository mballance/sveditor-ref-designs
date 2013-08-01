// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_drr_context.v
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
 *  niu_txc_drr_context.v
 *
 *  DRR Arbiter Context
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

module niu_txc_drr_context (
        SysClk,
        Reset_L, 
        FlushEngine, 

        ClrMaxBurst,        // Clear max burst bit in control register
        NewMaxBurst,        // Max burst bit in control register
        MaxBurst,

        PacketDone,
        PacketByteCount,    // Byte count of the packet that was serviced

        DMA_Reset_Done,
        DMA_EofList,
        AddCreditToContext,
        ClrDeficitForEofList,
        ContextActiveList,
        NextDMAChannel,
        ContextNumber,
        NoDeficit
       );
    
`include "txc_defines.h"

// Global Signals
input         SysClk;
input         Reset_L;
input         FlushEngine;

// Control Registers
input         ClrMaxBurst;
input         NewMaxBurst;
input  [19:0] MaxBurst;

// Data Fetch State Machine
input         PacketDone;
input  [15:0] PacketByteCount;

// DRR Arbiter State Machine
input         DMA_Reset_Done;
input         DMA_EofList;
input         AddCreditToContext;
input         ClrDeficitForEofList;
input         ContextActiveList;
input  [4:0]  NextDMAChannel;
input  [4:0]  ContextNumber;

output        NoDeficit;

/*--------------------------------------------------------------*/
// Wires & Registers
/*--------------------------------------------------------------*/
wire          addCredit;
wire          updatebyteCount;
wire          updateMaxBurst;

reg    [19:0] contextBurst;
reg    [20:0] byteCount;

/*--------------------------------------------------------------*/
// Parameters and Defines
/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/
// Zero In Checks
/*--------------------------------------------------------------*/


/*--------------------------------------------------------------*/
// Assigns
/*--------------------------------------------------------------*/

assign NoDeficit = (byteCount < {1'b0, contextBurst});

assign addCredit = (AddCreditToContext & ContextActiveList);

assign updateMaxBurst  = (ClrMaxBurst & NewMaxBurst);

assign updatebyteCount = (PacketDone
                          &&
                          (NextDMAChannel == ContextNumber)
                         );

/*--------------------------------------------------------------*/
// Instantiated Flops
/*--------------------------------------------------------------*/

always @(posedge SysClk)
  if (!Reset_L)            contextBurst <= #`SD 20'h0;
  else if (updateMaxBurst) contextBurst <= #`SD MaxBurst;

always @(posedge SysClk)
  if (!Reset_L)                                byteCount <= #`SD 21'h0;
  else if (FlushEngine)                        byteCount <= #`SD 21'h0;
  else if (DMA_Reset_Done)                     byteCount <= #`SD 21'h0;
  else if (ClrDeficitForEofList & DMA_EofList) byteCount <= #`SD 21'h0;
  else if (addCredit)
    begin
      if (NoDeficit) byteCount <= #`SD 21'h0;
      else           byteCount <= #`SD (byteCount - {1'b0, contextBurst});
    end
  else if (updatebyteCount) byteCount <= #`SD (byteCount
                                               +
                                              {5'h0, PacketByteCount});

endmodule
