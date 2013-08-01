// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_tdmc_error.v
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
 *  niu_txc_tdmc_error.v
 *
 *  NIU TXC To TDMC Error Interface
 *
 *  Orignal Author(s):   Rahoul Puri
 *  Modifier(s):
 *  Project(s):          Neptune
 *
 *  Copyright (c) 2005   Sun Microsystems, Inc.
 *
 *  All Rights Reserved.
 *
 *  This verilog model is the confidential and proprietary property of
 *  Sun Microsystems, Inc., and the possession or use of this model
 *  requires a written license from Sun Microsystems, Inc.
 *
 **********************************************************************/

`include "timescale.v"

module niu_txc_tdmc_error (
        SysClk,
        Reset_L,
        Port0_Nack_Pkt_Rd,
        Port0_DMA_Nack_Pkt_Rd,
        Port0_Nack_Pkt_Rd_Addr,
        Port1_Nack_Pkt_Rd,
        Port1_DMA_Nack_Pkt_Rd,
        Port1_Nack_Pkt_Rd_Addr,
        Port2_Nack_Pkt_Rd,
        Port2_DMA_Nack_Pkt_Rd,
        Port2_Nack_Pkt_Rd_Addr,
        Port3_Nack_Pkt_Rd,
        Port3_DMA_Nack_Pkt_Rd,
        Port3_Nack_Pkt_Rd_Addr,
        TXC_DMC_Nack_Pkt_Rd,
        TXC_DMC_DMA_Nack_Pkt_Rd,
        TXC_DMC_Nack_Pkt_Rd_Addr
       );

`include "txc_defines.h"

// Global Signals
input          SysClk;
input          Reset_L;

// Port 0 Error Signals
input          Port0_Nack_Pkt_Rd;
input  [23:0]  Port0_DMA_Nack_Pkt_Rd;
input  [43:0]  Port0_Nack_Pkt_Rd_Addr;

// Port 1 Error Signals
input          Port1_Nack_Pkt_Rd;
input  [23:0]  Port1_DMA_Nack_Pkt_Rd;
input  [43:0]  Port1_Nack_Pkt_Rd_Addr;

// Port 2 Error Signals
input          Port2_Nack_Pkt_Rd;
input  [23:0]  Port2_DMA_Nack_Pkt_Rd;
input  [43:0]  Port2_Nack_Pkt_Rd_Addr;

// Port 3 Error Signals
input          Port3_Nack_Pkt_Rd;
input  [23:0]  Port3_DMA_Nack_Pkt_Rd;
input  [43:0]  Port3_Nack_Pkt_Rd_Addr;

// TXC To TDMC Error Interface Signals
output         TXC_DMC_Nack_Pkt_Rd;
output [23:0]  TXC_DMC_DMA_Nack_Pkt_Rd;
output [43:0]  TXC_DMC_Nack_Pkt_Rd_Addr;

reg            TXC_DMC_Nack_Pkt_Rd;
reg    [23:0]  TXC_DMC_DMA_Nack_Pkt_Rd;
reg    [43:0]  TXC_DMC_Nack_Pkt_Rd_Addr;

/*--------------------------------------------------------------*/
// Wires & Registers
/*--------------------------------------------------------------*/
wire   [3:0]   portSelect;
wire           transactionTimeout;

reg    [23:0]  dmaNackPktRd;
reg    [43:0]  dmaNackPktRdAddr;

/*--------------------------------------------------------------*/
// Transaction Timeout Size Error Logic
/*--------------------------------------------------------------*/
assign portSelect = {Port3_Nack_Pkt_Rd, Port2_Nack_Pkt_Rd,
                     Port1_Nack_Pkt_Rd, Port0_Nack_Pkt_Rd
                    };

assign transactionTimeout = (Port3_Nack_Pkt_Rd | Port2_Nack_Pkt_Rd
                             |
                             Port1_Nack_Pkt_Rd | Port0_Nack_Pkt_Rd
                            );

always @(portSelect
         or Port3_DMA_Nack_Pkt_Rd or Port2_DMA_Nack_Pkt_Rd
         or Port1_DMA_Nack_Pkt_Rd or Port0_DMA_Nack_Pkt_Rd
        )
  begin
  casex(portSelect)  // Synopsys full_case parallel_case
     4'bxxx1:          dmaNackPktRd = Port0_DMA_Nack_Pkt_Rd;
     4'bxx10:          dmaNackPktRd = Port1_DMA_Nack_Pkt_Rd;
     4'bx100:          dmaNackPktRd = Port2_DMA_Nack_Pkt_Rd;
     4'b1000:          dmaNackPktRd = Port3_DMA_Nack_Pkt_Rd;
           default: dmaNackPktRd = 24'hx;
  endcase
end

always @(portSelect
         or Port3_Nack_Pkt_Rd_Addr or Port2_Nack_Pkt_Rd_Addr
         or Port1_Nack_Pkt_Rd_Addr or Port0_Nack_Pkt_Rd_Addr
        )
  begin
  casex(portSelect)  // Synopsys full_case parallel_case
     4'bxxx1:          dmaNackPktRdAddr = Port0_Nack_Pkt_Rd_Addr;
     4'bxx10:          dmaNackPktRdAddr = Port1_Nack_Pkt_Rd_Addr;
     4'bx100:          dmaNackPktRdAddr = Port2_Nack_Pkt_Rd_Addr;
     4'b1000:          dmaNackPktRdAddr = Port3_Nack_Pkt_Rd_Addr;
           default: dmaNackPktRdAddr = 44'hx;
  endcase
end

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      TXC_DMC_Nack_Pkt_Rd      <= 1'b0;
      TXC_DMC_DMA_Nack_Pkt_Rd  <= 24'h0;
      TXC_DMC_Nack_Pkt_Rd_Addr <= 44'h0;
    end
  else if (transactionTimeout)
    begin
      TXC_DMC_Nack_Pkt_Rd      <= #`SD 1'b1;
      TXC_DMC_DMA_Nack_Pkt_Rd  <= #`SD dmaNackPktRd;
      TXC_DMC_Nack_Pkt_Rd_Addr <= #`SD dmaNackPktRdAddr;
    end
  else
      TXC_DMC_Nack_Pkt_Rd      <= #`SD 1'b0;

endmodule
