// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_tdmc_context.v
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
 *  niu_txc_tdmc_context.v
 *
 *  TXC TDMC DMA Context
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

module niu_txc_tdmc_context (
        SysClk,
        Reset_L,

        Port0_DMA_inc_head,
        Port0_DMA_reset_done,
        Port0_DMA_mark_bit,
        Port0_DMA_inc_pkt_cnt,
        Port0_SetGetNextDescDMA,

        Port1_DMA_inc_head,
        Port1_DMA_reset_done,
        Port1_DMA_mark_bit,
        Port1_DMA_inc_pkt_cnt,
        Port1_SetGetNextDescDMA,

        Port2_DMA_inc_head,
        Port2_DMA_reset_done,
        Port2_DMA_mark_bit,
        Port2_DMA_inc_pkt_cnt,
        Port2_SetGetNextDescDMA,

        Port3_DMA_inc_head,
        Port3_DMA_reset_done,
        Port3_DMA_mark_bit,
        Port3_DMA_inc_pkt_cnt,
        Port3_SetGetNextDescDMA,

        DMC_TXC_DMA_GotNxtDesc,
        TXC_DMC_DMA_GetNxtDesc,
        TXC_DMC_DMA_inc_head,
        TXC_DMC_DMA_reset_done,
        TXC_DMC_DMA_mark_bit,
        TXC_DMC_DMA_inc_pkt_cnt
       );

`include "txc_defines.h"

// Global Signals
input         SysClk;
input         Reset_L;

// Port Interfaces
input         Port0_DMA_inc_head;
input         Port0_DMA_reset_done;
input         Port0_DMA_mark_bit;
input         Port0_DMA_inc_pkt_cnt;
input         Port0_SetGetNextDescDMA;

input         Port1_DMA_inc_head;
input         Port1_DMA_reset_done;
input         Port1_DMA_mark_bit;
input         Port1_DMA_inc_pkt_cnt;
input         Port1_SetGetNextDescDMA;

input         Port2_DMA_inc_head;
input         Port2_DMA_reset_done;
input         Port2_DMA_mark_bit;
input         Port2_DMA_inc_pkt_cnt;
input         Port2_SetGetNextDescDMA;

input         Port3_DMA_inc_head;
input         Port3_DMA_reset_done;
input         Port3_DMA_mark_bit;
input         Port3_DMA_inc_pkt_cnt;
input         Port3_SetGetNextDescDMA;

// TDMC Interface
input         DMC_TXC_DMA_GotNxtDesc;

output        TXC_DMC_DMA_GetNxtDesc;
output        TXC_DMC_DMA_inc_head;
output        TXC_DMC_DMA_reset_done;
output        TXC_DMC_DMA_mark_bit;
output        TXC_DMC_DMA_inc_pkt_cnt;

reg           TXC_DMC_DMA_GetNxtDesc;
reg           TXC_DMC_DMA_inc_head;
reg           TXC_DMC_DMA_reset_done;
reg           TXC_DMC_DMA_mark_bit;
reg           TXC_DMC_DMA_inc_pkt_cnt;

/*--------------------------------------------------------------*/
// Wires & Registers
/*--------------------------------------------------------------*/
wire          dma_inc_head;
wire          dma_reset_done;
wire          dma_mark_bit;
wire          dma_inc_pkt_cnt;
wire          setGetNextDescDMA;

/*--------------------------------------------------------------*/
// Assigns
/*--------------------------------------------------------------*/
assign dma_inc_head    = (Port0_DMA_inc_head | Port1_DMA_inc_head
                          |
                          Port2_DMA_inc_head | Port3_DMA_inc_head
                         );

assign dma_reset_done  = (Port0_DMA_reset_done | Port1_DMA_reset_done
                          |
                          Port2_DMA_reset_done | Port3_DMA_reset_done
                         );

assign dma_mark_bit    = (Port0_DMA_mark_bit | Port1_DMA_mark_bit
                          |
                          Port2_DMA_mark_bit | Port3_DMA_mark_bit
                         );

assign dma_inc_pkt_cnt = (Port0_DMA_inc_pkt_cnt | Port1_DMA_inc_pkt_cnt
                          |
                          Port2_DMA_inc_pkt_cnt | Port3_DMA_inc_pkt_cnt
                         );

assign setGetNextDescDMA = (Port3_SetGetNextDescDMA | Port2_SetGetNextDescDMA
                            |
                            Port1_SetGetNextDescDMA | Port0_SetGetNextDescDMA);

/*--------------------------------------------------------------*/
// Logic
/*--------------------------------------------------------------*/
always @(posedge SysClk)
  if (!Reset_L) TXC_DMC_DMA_inc_head <= #`SD 1'b0;
  else          TXC_DMC_DMA_inc_head <= #`SD dma_inc_head;

always @(posedge SysClk)
  if (!Reset_L) TXC_DMC_DMA_reset_done <= #`SD 1'b0;
  else          TXC_DMC_DMA_reset_done <= #`SD dma_reset_done;

always @(posedge SysClk)
  if (!Reset_L) TXC_DMC_DMA_mark_bit <= #`SD 1'b0;
  else          TXC_DMC_DMA_mark_bit <= #`SD dma_mark_bit;

always @(posedge SysClk)
  if (!Reset_L) TXC_DMC_DMA_inc_pkt_cnt <= #`SD 1'b0;
  else          TXC_DMC_DMA_inc_pkt_cnt <= #`SD dma_inc_pkt_cnt;

always @(posedge SysClk)
  if (!Reset_L)                    TXC_DMC_DMA_GetNxtDesc <= #`SD 1'b0;
  else if (setGetNextDescDMA)      TXC_DMC_DMA_GetNxtDesc <= #`SD 1'b1;
  else if (DMC_TXC_DMA_GotNxtDesc) TXC_DMC_DMA_GetNxtDesc <= #`SD 1'b0;

endmodule
