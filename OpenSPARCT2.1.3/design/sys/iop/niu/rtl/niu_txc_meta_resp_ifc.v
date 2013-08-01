// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_meta_resp_ifc.v
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
 *  niu_txc_meta_resp_ifc.v
 *
 *  Meta Interface Logic
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

module niu_txc_meta_resp_ifc (
         SysClk,                // Clock
         Reset_L,               // Reset_L
         meta_dmc_resp_ready,
         meta_dmc_resp_complete,
         meta_dmc_resp_transfer_cmpl,
         meta_dmc_data_valid,
         meta_dmc_resp_client,
         meta_dmc_resp_port_num,
         meta_dmc_resp_cmd_status,
         meta_dmc_resp_data_status,
         meta_dmc_resp_dma_num,
         meta_dmc_resp_transID,
         meta_dmc_resp_cmd,
         meta_dmc_resp_byteenable,
         meta_dmc_resp_length,
         meta_dmc_resp_address,
         meta_dmc_data,
         dmc_meta_resp_accept,
         Port0_TXC_DMC_Resp_Accept,
         Port1_TXC_DMC_Resp_Accept,
         Port2_TXC_DMC_Resp_Accept,
         Port3_TXC_DMC_Resp_Accept,
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
         DMC_TXC_Resp_Data
        );

`include "txc_defines.h"

// MAC Global Signals
input          SysClk;
input          Reset_L;

// Meta Response Interface
input          meta_dmc_resp_ready;
input          meta_dmc_resp_complete;
input          meta_dmc_resp_transfer_cmpl;
input          meta_dmc_data_valid;
input          meta_dmc_resp_client;
input  [1:0]   meta_dmc_resp_port_num;
input  [3:0]   meta_dmc_resp_cmd_status;
input  [3:0]   meta_dmc_resp_data_status;
input  [4:0]   meta_dmc_resp_dma_num;
input  [5:0]   meta_dmc_resp_transID;
input  [7:0]   meta_dmc_resp_cmd;
input  [13:0]  meta_dmc_resp_length;
input  [15:0]  meta_dmc_resp_byteenable;
input  [63:0]  meta_dmc_resp_address;
input  [127:0] meta_dmc_data;

output         dmc_meta_resp_accept;

reg            dmc_meta_resp_accept;

// NIU Internal Response Interface
input          Port0_TXC_DMC_Resp_Accept;
input          Port1_TXC_DMC_Resp_Accept;
input          Port2_TXC_DMC_Resp_Accept;
input          Port3_TXC_DMC_Resp_Accept;

output         DMC_TXC_Resp_Rdy;
output         DMC_TXC_Resp_Complete;
output         DMC_TXC_Trans_Complete;
output         DMC_TXC_Resp_Data_Valid;
output         DMC_TXC_Resp_Client;
output [1:0]   DMC_TXC_Resp_Port_Num;
output [3:0]   DMC_TXC_Resp_Cmd_Status;
output [3:0]   DMC_TXC_Resp_Data_Status;
output [4:0]   DMC_TXC_Resp_DMA_Num;
output [5:0]   DMC_TXC_Resp_TransID;
output [7:0]   DMC_TXC_Resp_Cmd;
output [13:0]  DMC_TXC_Resp_Data_Length;
output [15:0]  DMC_TXC_Resp_ByteEnables;
output [63:0]  DMC_TXC_Resp_Address;
output [127:0] DMC_TXC_Resp_Data;

reg            DMC_TXC_Resp_Data_Valid;
reg    [3:0]   DMC_TXC_Resp_Data_Status;
reg    [13:0]  DMC_TXC_Resp_Data_Length;
reg    [15:0]  DMC_TXC_Resp_ByteEnables;
reg    [127:0] DMC_TXC_Resp_Data;

/*--------------------------------------------------------------*/
// Reg & Wires
/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/
// Assigns CMD Phase
/*--------------------------------------------------------------*/
assign DMC_TXC_Resp_Rdy         = meta_dmc_resp_ready;
assign DMC_TXC_Resp_Complete    = meta_dmc_resp_complete;
assign DMC_TXC_Trans_Complete   = meta_dmc_resp_transfer_cmpl;
assign DMC_TXC_Resp_Client      = meta_dmc_resp_client;
assign DMC_TXC_Resp_Port_Num    = meta_dmc_resp_port_num;
assign DMC_TXC_Resp_Cmd_Status  = meta_dmc_resp_cmd_status;
assign DMC_TXC_Resp_DMA_Num     = meta_dmc_resp_dma_num;
assign DMC_TXC_Resp_TransID     = meta_dmc_resp_transID;
assign DMC_TXC_Resp_Cmd         = meta_dmc_resp_cmd;
assign DMC_TXC_Resp_Address     = meta_dmc_resp_address;


/*--------------------------------------------------------------*/
// Logic Cmd Phase
/*--------------------------------------------------------------*/
always @(posedge SysClk)
  if (!Reset_L)
    dmc_meta_resp_accept <= #`SD 1'b0;
  else
    dmc_meta_resp_accept <= #`SD (Port3_TXC_DMC_Resp_Accept
                                  |
                                  Port2_TXC_DMC_Resp_Accept
                                  |
                                  Port1_TXC_DMC_Resp_Accept
                                  |
                                  Port0_TXC_DMC_Resp_Accept);

/*--------------------------------------------------------------*/
// Logic Data Phase
/*--------------------------------------------------------------*/
always @(posedge SysClk)
  if (!Reset_L) DMC_TXC_Resp_Data_Valid <= #`SD 1'b0;
  else          DMC_TXC_Resp_Data_Valid <= #`SD meta_dmc_data_valid;

always @(posedge SysClk)
  if (!Reset_L) DMC_TXC_Resp_Data_Status <= #`SD 4'h0;
  else          DMC_TXC_Resp_Data_Status <= #`SD meta_dmc_resp_data_status;

always @(posedge SysClk)
  if (!Reset_L) DMC_TXC_Resp_Data_Length <= #`SD 14'h0;
  else          DMC_TXC_Resp_Data_Length <= #`SD meta_dmc_resp_length;

always @(posedge SysClk)
  if (!Reset_L) DMC_TXC_Resp_ByteEnables <= #`SD 16'h0;
  else          DMC_TXC_Resp_ByteEnables <= #`SD meta_dmc_resp_byteenable;

always @(posedge SysClk)
  if (!Reset_L) DMC_TXC_Resp_Data <= #`SD 128'h0;
  else          DMC_TXC_Resp_Data <= #`SD meta_dmc_data;

endmodule
