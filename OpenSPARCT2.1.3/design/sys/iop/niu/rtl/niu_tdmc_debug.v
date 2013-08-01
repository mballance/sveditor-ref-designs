// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_tdmc_debug.v
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
 *  niu_tdmc_debug..v
 *
 *  NIU TDMC Top Level Debug Module
 *
 *  Orignal Author(s):   Arvind Srinivasan
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

module niu_tdmc_debug( /*AUTOARG*/
   // Outputs
   tdmc_debug_port, 
   // Inputs
   SysClk, Reset_L, debug_select, training_vector, TxCacheFetchState, 

  dma0_debug_port, dma1_debug_port, dma2_debug_port, dma3_debug_port,
  dma4_debug_port, dma5_debug_port, dma6_debug_port, dma7_debug_port,
  dma8_debug_port, dma9_debug_port, dma10_debug_port, dma11_debug_port,
  dma12_debug_port, dma13_debug_port, dma14_debug_port, dma15_debug_port,

`ifdef NEPTUNE
  dma16_debug_port, dma17_debug_port, dma18_debug_port, dma19_debug_port,
  dma20_debug_port, dma21_debug_port, dma22_debug_port, dma23_debug_port,
`else
`endif
   mbox_debug_state
   );

`include "txc_defines.h"

// Global Signals
input         SysClk;
input         Reset_L;

// To Debug Module
output [31:0] tdmc_debug_port;

reg    [31:0] tdmc_debug_port;

// From Control Regs
   input [5:0] debug_select ;
   input [31:0] training_vector ;
   input [3:0] TxCacheFetchState;
   input [11:0] mbox_debug_state;

  input[31:0] dma0_debug_port;
  input[31:0] dma1_debug_port;
  input[31:0] dma2_debug_port;
  input[31:0] dma3_debug_port;
  input[31:0] dma4_debug_port;
  input[31:0] dma5_debug_port;
  input[31:0] dma6_debug_port;
  input[31:0] dma7_debug_port;
  input[31:0] dma8_debug_port;
  input[31:0] dma9_debug_port;
  input[31:0] dma10_debug_port;
  input[31:0] dma11_debug_port;
  input[31:0] dma12_debug_port;
  input[31:0] dma13_debug_port;
  input[31:0] dma14_debug_port;
  input[31:0] dma15_debug_port;

`ifdef NEPTUNE
  input[31:0] dma16_debug_port;
  input[31:0] dma17_debug_port;
  input[31:0] dma18_debug_port;
  input[31:0] dma19_debug_port;
  input[31:0] dma20_debug_port;
  input[31:0] dma21_debug_port;
  input[31:0] dma22_debug_port;
  input[31:0] dma23_debug_port;

`else
`endif

/*--------------------------------------------------------------*/
// Debug Block
/*--------------------------------------------------------------*/


always @(posedge SysClk)
  if (!Reset_L) tdmc_debug_port  <= #`SD 32'h0;
  else
   case(debug_select)
     6'h0: tdmc_debug_port <= #`SD 32'h0;
     `TDMC_CACHE_FETCH_STATE:      tdmc_debug_port <= #`SD {28'h0,TxCacheFetchState};
     `TDMC_MBOX_STATE:      tdmc_debug_port <= #`SD {20'h0,mbox_debug_state};
     `TDMC_DMA0_DEBUG_SEL: tdmc_debug_port<= #`SD dma0_debug_port;
     `TDMC_DMA1_DEBUG_SEL: tdmc_debug_port<= #`SD dma1_debug_port;
     `TDMC_DMA2_DEBUG_SEL: tdmc_debug_port<= #`SD dma2_debug_port;
     `TDMC_DMA3_DEBUG_SEL: tdmc_debug_port<= #`SD dma3_debug_port;
     `TDMC_DMA4_DEBUG_SEL: tdmc_debug_port<= #`SD dma4_debug_port;
     `TDMC_DMA5_DEBUG_SEL: tdmc_debug_port<= #`SD dma5_debug_port;
     `TDMC_DMA6_DEBUG_SEL: tdmc_debug_port<= #`SD dma6_debug_port;
     `TDMC_DMA7_DEBUG_SEL: tdmc_debug_port<= #`SD dma7_debug_port;
     `TDMC_DMA8_DEBUG_SEL: tdmc_debug_port<= #`SD dma8_debug_port;
     `TDMC_DMA9_DEBUG_SEL: tdmc_debug_port<= #`SD dma9_debug_port;
     `TDMC_DMA10_DEBUG_SEL: tdmc_debug_port<= #`SD dma10_debug_port;
     `TDMC_DMA11_DEBUG_SEL: tdmc_debug_port<= #`SD dma11_debug_port;
     `TDMC_DMA12_DEBUG_SEL: tdmc_debug_port<= #`SD dma12_debug_port;
     `TDMC_DMA13_DEBUG_SEL: tdmc_debug_port<= #`SD dma13_debug_port;
     `TDMC_DMA14_DEBUG_SEL: tdmc_debug_port<= #`SD dma14_debug_port;
     `TDMC_DMA15_DEBUG_SEL: tdmc_debug_port<= #`SD dma15_debug_port;

`ifdef NEPTUNE
     `TDMC_DMA16_DEBUG_SEL: tdmc_debug_port<= #`SD dma16_debug_port;
     `TDMC_DMA17_DEBUG_SEL: tdmc_debug_port<= #`SD dma17_debug_port;
     `TDMC_DMA18_DEBUG_SEL: tdmc_debug_port<= #`SD dma18_debug_port;
     `TDMC_DMA19_DEBUG_SEL: tdmc_debug_port<= #`SD dma19_debug_port;
     `TDMC_DMA20_DEBUG_SEL: tdmc_debug_port<= #`SD dma20_debug_port;
     `TDMC_DMA21_DEBUG_SEL: tdmc_debug_port<= #`SD dma21_debug_port;
     `TDMC_DMA22_DEBUG_SEL: tdmc_debug_port<= #`SD dma22_debug_port;
     `TDMC_DMA23_DEBUG_SEL: tdmc_debug_port<= #`SD dma23_debug_port;
`else
`endif
     `TDMC_TRAINING_SET:      tdmc_debug_port <= #`SD ~tdmc_debug_port;
     `TDMC_TRAINING_LOAD:     tdmc_debug_port <= #`SD training_vector;
     
  default: tdmc_debug_port <= tdmc_debug_port;

  endcase

endmodule
