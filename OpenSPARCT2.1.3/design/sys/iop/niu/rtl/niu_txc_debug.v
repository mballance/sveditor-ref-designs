// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_debug.v
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
 *  niu_txc_debug.v
 *
 *  NIU TXC Top Level Debug Module
 *
 *  Orignal Author(s):   Rahoul Puri
 *  Modifier(s):
 *  Project(s):          Neptune/Niagara 2
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

module niu_txc_debug( 
        SysClk,
        Reset_L,
        Debug_Select,
        TrainingVector,
        PortSelect_State,
        DataFetch_State,
        Port0_LatchActiveDMA,
        Port0_Anchor_State,
        Port0_ReOrder_State,
        Port0_Pointer_State,
        Port0_PacketAssy_State,
        Port0_DRR_ArbState,
        Port0_Mac_Xfer_State,
        Port0_DataPortReq_State,
        Port0_ContextActiveList,
        Port0_Sum_prt_state,
        Port1_LatchActiveDMA,
        Port1_Anchor_State,
        Port1_ReOrder_State,
        Port1_Pointer_State,
        Port1_PacketAssy_State,
        Port1_DRR_ArbState,
        Port1_Mac_Xfer_State,
        Port1_DataPortReq_State,
        Port1_ContextActiveList,
        Port1_Sum_prt_state,
        Port2_LatchActiveDMA,
        Port2_Anchor_State,
        Port2_ReOrder_State,
        Port2_Pointer_State,
        Port2_PacketAssy_State,
        Port2_DRR_ArbState,
        Port2_Mac_Xfer_State,
        Port2_DataPortReq_State,
        Port2_ContextActiveList,
        Port2_Sum_prt_state,
        Port3_LatchActiveDMA,
        Port3_Anchor_State,
        Port3_ReOrder_State,
        Port3_Pointer_State,
        Port3_PacketAssy_State,
        Port3_DRR_ArbState,
        Port3_Mac_Xfer_State,
        Port3_DataPortReq_State,
        Port3_ContextActiveList,
        Port3_Sum_prt_state,
        Txc_Debug_Port
       );

`include "txc_defines.h"

// Global Signals
input         SysClk;
input         Reset_L;

// Control Registers
input  [5:0]  Debug_Select;
input  [31:0] TrainingVector;

// Data Fetch State Machine
input  [3:0]  PortSelect_State;
input  [3:0]  DataFetch_State;

// Port 0 State Machine
input         Port0_LatchActiveDMA;
input  [3:0]  Port0_Anchor_State;
input  [3:0]  Port0_ReOrder_State;
input  [3:0]  Port0_Pointer_State;
input  [3:0]  Port0_PacketAssy_State;
input  [3:0]  Port0_DRR_ArbState;
input  [3:0]  Port0_Mac_Xfer_State;
input  [3:0]  Port0_DataPortReq_State;
input  [23:0] Port0_ContextActiveList;
input  [31:0] Port0_Sum_prt_state;

// Port 1 State Machine
input         Port1_LatchActiveDMA;
input  [3:0]  Port1_Anchor_State;
input  [3:0]  Port1_ReOrder_State;
input  [3:0]  Port1_Pointer_State;
input  [3:0]  Port1_PacketAssy_State;
input  [3:0]  Port1_DRR_ArbState;
input  [3:0]  Port1_Mac_Xfer_State;
input  [3:0]  Port1_DataPortReq_State;
input  [23:0] Port1_ContextActiveList;
input  [31:0] Port1_Sum_prt_state;

// Port 2 State Machine
input         Port2_LatchActiveDMA;
input  [3:0]  Port2_Anchor_State;
input  [3:0]  Port2_ReOrder_State;
input  [3:0]  Port2_Pointer_State;
input  [3:0]  Port2_PacketAssy_State;
input  [3:0]  Port2_DRR_ArbState;
input  [3:0]  Port2_Mac_Xfer_State;
input  [3:0]  Port2_DataPortReq_State;
input  [23:0] Port2_ContextActiveList;
input  [31:0] Port2_Sum_prt_state;

// Port 3 State Machine
input         Port3_LatchActiveDMA;
input  [3:0]  Port3_Anchor_State;
input  [3:0]  Port3_ReOrder_State;
input  [3:0]  Port3_Pointer_State;
input  [3:0]  Port3_PacketAssy_State;
input  [3:0]  Port3_DRR_ArbState;
input  [3:0]  Port3_Mac_Xfer_State;
input  [3:0]  Port3_DataPortReq_State;
input  [23:0] Port3_ContextActiveList;
input  [31:0] Port3_Sum_prt_state;

// To Debug Module
output [31:0] Txc_Debug_Port;

reg    [31:0] Txc_Debug_Port;

/*--------------------------------------------------------------*/
// Wires & Regs
/*--------------------------------------------------------------*/
wire   [31:0]  dataFetch_engine;
wire   [31:0]  port0_states;
wire   [31:0]  port0_drr;
wire   [31:0]  port1_states;
wire   [31:0]  port1_drr;
wire   [31:0]  port2_states;
wire   [31:0]  port2_drr;
wire   [31:0]  port3_states;
wire   [31:0]  port3_drr;

/*--------------------------------------------------------------*/
// Assigns
/*--------------------------------------------------------------*/
assign dataFetch_engine = {24'h0,
                           PortSelect_State, DataFetch_State
                          };

assign port0_states = {4'h0,
                       Port0_Anchor_State, Port0_ReOrder_State,
                       Port0_Pointer_State, Port0_PacketAssy_State,
                       Port0_DRR_ArbState, Port0_Mac_Xfer_State,
                       Port0_DataPortReq_State
                      };

assign port0_drr    = {Port0_LatchActiveDMA, 7'h0, Port0_ContextActiveList};

assign port1_states = {4'h0,
                       Port1_Anchor_State, Port1_ReOrder_State,
                       Port1_Pointer_State, Port1_PacketAssy_State,
                       Port1_DRR_ArbState, Port1_Mac_Xfer_State,
                       Port1_DataPortReq_State
                      };

assign port1_drr    = {Port1_LatchActiveDMA, 7'h0, Port1_ContextActiveList};

assign port2_states = {4'h0,
                       Port2_Anchor_State, Port2_ReOrder_State,
                       Port2_Pointer_State, Port2_PacketAssy_State,
                       Port2_DRR_ArbState, Port2_Mac_Xfer_State,
                       Port2_DataPortReq_State
                      };

assign port2_drr    = {Port2_LatchActiveDMA, 7'h0, Port2_ContextActiveList};

assign port3_states = {4'h0,
                       Port3_Anchor_State, Port3_ReOrder_State,
                       Port3_Pointer_State, Port3_PacketAssy_State,
                       Port3_DRR_ArbState, Port3_Mac_Xfer_State,
                       Port3_DataPortReq_State
                      };

assign port3_drr    = {Port3_LatchActiveDMA, 7'h0, Port3_ContextActiveList};

/*--------------------------------------------------------------*/
// Debug Block
/*--------------------------------------------------------------*/

always @(posedge SysClk)
  if (!Reset_L) Txc_Debug_Port  <= #`SD 32'h0;
  else
   case(Debug_Select)
    `DATA_FETCH_ENGINE: Txc_Debug_Port <= #`SD dataFetch_engine;
    `PORT0_ENGINE:      Txc_Debug_Port <= #`SD port0_states;
    `PORT0_CKSUM:       Txc_Debug_Port <= #`SD Port0_Sum_prt_state;
    `PORT0_DRR:         Txc_Debug_Port <= #`SD port0_drr;
    `PORT1_ENGINE:      Txc_Debug_Port <= #`SD port1_states;
    `PORT1_CKSUM:       Txc_Debug_Port <= #`SD Port1_Sum_prt_state;
    `PORT1_DRR:         Txc_Debug_Port <= #`SD port1_drr;
    `PORT2_ENGINE:      Txc_Debug_Port <= #`SD port2_states;
    `PORT2_CKSUM:       Txc_Debug_Port <= #`SD Port2_Sum_prt_state;
    `PORT2_DRR:         Txc_Debug_Port <= #`SD port2_drr;
    `PORT3_ENGINE:      Txc_Debug_Port <= #`SD port3_states;
    `PORT3_CKSUM:       Txc_Debug_Port <= #`SD Port3_Sum_prt_state;
    `PORT3_DRR:         Txc_Debug_Port <= #`SD port3_drr;
    `TRAINING_SET:      Txc_Debug_Port <= #`SD ~Txc_Debug_Port;
    `TRAINING_LOAD:     Txc_Debug_Port <= #`SD TrainingVector;
  
  default: Txc_Debug_Port <= Txc_Debug_Port;

  endcase

endmodule
