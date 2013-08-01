// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_ecc_engine.v
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
/**********************************************************************
 *
 *  niu_txc_ecc_engine.v
 *
 *  TXC ECC Engine
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

module niu_txc_ecc_engine (
        SysClk,
        Reset_L,
        ReOrder_ClearEccError,
        WrReOrderEccState,
        WrReOrderEccData0,
        WrReOrderEccData1,
        WrReOrderEccData2,
        WrReOrderEccData3,
        WrReOrderEccData4,
        StoreForward_ClearEccError,
        WrStoreForwardEccState,
        WrStoreForwardEccData0,
        WrStoreForwardEccData1,
        WrStoreForwardEccData2,
        WrStoreForwardEccData3,
        WrStoreForwardEccData4,
        PioDataIn,
        ReOrder_ECC_State,
        ReOrder_EccData,
        StoreForward_ECC_State,
        StoreForward_EccData,

        ReOrder_CorruptECCSingle,
        ReOrder_CorruptECCDouble,
        ReOrder_FifoRead,
        ReOrder_ReadPtr,
        ReOrder_PreECCData,
        ReOrder_FifoDataOut,
        ReOrder_FifoDataValid,
        ReOrder_UnCorrectError,
        ReOrder_CorrectedData,
        ReOrder_PostECCData,
        StoreForward_CorruptECCSingle,
        StoreForward_CorruptECCDouble,
        StoreForward_FifoRead,
        StoreForward_ReadPtr,
        StoreForward_PreECCData,
        StoreForward_FifoDataOut,
        StoreForward_UnCorrectError,
        StoreForward_CorrectedData,
        StoreForward_PostECCData
       );

    
`include "txc_defines.h"

// Global signals
input          SysClk;
input          Reset_L;

// PIO Access
input          ReOrder_ClearEccError;
input          WrReOrderEccState;
input          WrReOrderEccData0;
input          WrReOrderEccData1;
input          WrReOrderEccData2;
input          WrReOrderEccData3;
input          WrReOrderEccData4;
input          StoreForward_ClearEccError;
input          WrStoreForwardEccState;
input          WrStoreForwardEccData0;
input          WrStoreForwardEccData1;
input          WrStoreForwardEccData2;
input          WrStoreForwardEccData3;
input          WrStoreForwardEccData4;
input  [31:0]  PioDataIn;

output [31:0]  ReOrder_ECC_State;
output [151:0] ReOrder_EccData;

output [31:0]  StoreForward_ECC_State;
output [151:0] StoreForward_EccData;

// Error forcing
input          ReOrder_CorruptECCSingle;
input          ReOrder_CorruptECCDouble;
input          ReOrder_FifoRead;
input  [9:0]   ReOrder_ReadPtr;
input  [135:0] ReOrder_PreECCData;
input  [151:0] ReOrder_FifoDataOut;

output         ReOrder_FifoDataValid;
output         ReOrder_UnCorrectError;
output [135:0] ReOrder_CorrectedData;
output [151:0] ReOrder_PostECCData;

reg            ReOrder_FifoDataValid;

input          StoreForward_CorruptECCSingle;
input          StoreForward_CorruptECCDouble;
input          StoreForward_FifoRead;
input  [9:0]   StoreForward_ReadPtr;
input  [135:0] StoreForward_PreECCData;
input  [151:0] StoreForward_FifoDataOut;

output         StoreForward_UnCorrectError;
output [135:0] StoreForward_CorrectedData;
output [151:0] StoreForward_PostECCData;

/*--------------------------------------------------------------*/
// Wires & Registers
/*--------------------------------------------------------------*/
wire           reOrder_CorrectError;
wire           reOrder_CorrectError0;
wire           reOrder_CorrectError1;
wire           reOrder_UnCorrectError0;
wire           reOrder_UnCorrectError1;
wire           rO_loadEccError;
wire   [1:0]   ro_ForceECCError;
wire   [7:0]   reOrder_ECCSyn0;
wire   [7:0]   reOrder_ECCSyn1;
wire   [75:0]  ro_PostECCData0;
wire   [75:0]  ro_PostECCData1;
wire   [75:0]  ro_ECCDataOut0;
wire   [75:0]  ro_ECCDataOut1;
wire   [151:0] ro_PostECCData;
wire   [151:0] ro_ECCDataOut;

wire           storeForward_CorrectError;
wire           storeForward_CorrectError0;
wire           storeForward_CorrectError1;
wire           storeForward_UnCorrectError0;
wire           storeForward_UnCorrectError1;
wire           sF_loadEccError;
wire           sf_ForceECCErrorBit144;
wire           sf_ForceECCErrorBit151;
wire   [1:0]   sf_ForceECCError;
wire   [7:0]   storeForward_ECCSyn0;
wire   [7:0]   storeForward_ECCSyn1;
wire   [75:0]  sf_PostECCData0;
wire   [75:0]  sf_PostECCData1;
wire   [75:0]  sf_ECCDataOut0;
wire   [75:0]  sf_ECCDataOut1;
wire   [151:0] sf_PostECCData;
wire   [151:0] sf_ECCDataOut;

reg            storeForward_FifoDataValid;
reg            reOrder_FifoReadD1;
reg            rO_ErrorValid;
reg            rO_CorrectError;
reg            rO_UnCorrectError;
reg    [9:0]   rO_EccAddr;
reg    [9:0]   reOrder_ReadAddrD1;
reg    [31:0]  rO_EccData0;
reg    [31:0]  rO_EccData1;
reg    [31:0]  rO_EccData2;
reg    [31:0]  rO_EccData3;
reg    [23:0]  rO_EccData4;
reg    [75:0]  reOrder_FifoDataOutD0;
reg    [75:0]  reOrder_FifoDataOutD1;

reg            storeForward_FifoReadD1;
reg            sF_ErrorValid;
reg            sF_CorrectError;
reg            sF_UnCorrectError;
reg    [9:0]   sF_EccAddr;
reg    [9:0]   storeForward_ReadAddrD1;
reg    [31:0]  sF_EccData0;
reg    [31:0]  sF_EccData1;
reg    [31:0]  sF_EccData2;
reg    [31:0]  sF_EccData3;
reg    [23:0]  sF_EccData4;
reg    [75:0]  storeForward_FifoDataOutD0;
reg    [75:0]  storeForward_FifoDataOutD1;

/*--------------------------------------------------------------*/
// Assigns
/*--------------------------------------------------------------*/
assign ro_PostECCData         = {ro_PostECCData1, ro_PostECCData0};
assign ro_ECCDataOut          = {ro_ECCDataOut1, ro_ECCDataOut0};
assign ReOrder_UnCorrectError = (reOrder_UnCorrectError1
                                 |
                                 reOrder_UnCorrectError0
                                );

assign reOrder_CorrectError   = (reOrder_CorrectError1
                                 |
                                 reOrder_CorrectError0
                                );

assign ReOrder_CorrectedData      = {ro_ECCDataOut1[75:8], ro_ECCDataOut0[75:8]};


assign sf_PostECCData              = {sf_PostECCData1, sf_PostECCData0};
assign sf_ECCDataOut               = {sf_ECCDataOut1, sf_ECCDataOut0};
assign StoreForward_UnCorrectError = (storeForward_UnCorrectError1
                                      |
                                      storeForward_UnCorrectError0
                                     );

assign storeForward_CorrectError   = (storeForward_CorrectError1
                                      |
                                      storeForward_CorrectError0
                                     );

assign StoreForward_CorrectedData = {sf_ECCDataOut1[75:8], sf_ECCDataOut0[75:8]};


assign ro_ForceECCError =
      ReOrder_CorruptECCDouble ? ~ro_PostECCData[1:0] :
      ReOrder_CorruptECCSingle ? {ro_PostECCData[1], ~ro_PostECCData[0]}
                               :  ro_PostECCData[1:0];

assign sf_ForceECCErrorBit144 =
      (StoreForward_CorruptECCDouble & StoreForward_CorruptECCSingle)
                                    ? ~sf_PostECCData[144]
                                    : sf_PostECCData[144];

assign sf_ForceECCErrorBit151 =
      (StoreForward_CorruptECCDouble & StoreForward_CorruptECCSingle)
                                    ? ~sf_PostECCData[151]
                                    : sf_PostECCData[151];
assign sf_ForceECCError =
      StoreForward_CorruptECCDouble ? ~sf_PostECCData[1:0] :
      StoreForward_CorruptECCSingle ? {sf_PostECCData[1], ~sf_PostECCData[0]}
                                    : sf_PostECCData[1:0];

assign ReOrder_PostECCData      = {ro_PostECCData[151:2], ro_ForceECCError}; 

assign StoreForward_PostECCData = {sf_ForceECCErrorBit151,   // Bit 135
                                   sf_PostECCData[150:145],  // Bit 134-129
                                   sf_ForceECCErrorBit144,   // Bit 128
                                   sf_PostECCData[143:84],   // Bits [127:69]
                                   sf_PostECCData[83:76],    // Syndrome
                                   sf_PostECCData[75:8],     // Bits [68:0]
                                   sf_PostECCData[7:2],      // Syndrome
                                   sf_ForceECCError          // Syndrome
                                  }; 

/*--------------------------------------------------------------*/
// Logic
/*--------------------------------------------------------------*/
always @(posedge SysClk)
  if (!Reset_L) reOrder_FifoDataOutD1 <= #`SD 76'h0;
  else          reOrder_FifoDataOutD1 <= #`SD ReOrder_FifoDataOut[151:76];

always @(posedge SysClk)
  if (!Reset_L) reOrder_FifoDataOutD0 <= #`SD 76'h0;
  else          reOrder_FifoDataOutD0 <= #`SD ReOrder_FifoDataOut[75:0];


always @(posedge SysClk)
  if (!Reset_L) reOrder_FifoReadD1 <= #`SD 1'b0;
  else          reOrder_FifoReadD1 <= #`SD ReOrder_FifoRead;


always @(posedge SysClk)
  if (!Reset_L) ReOrder_FifoDataValid <= #`SD 1'b0;
  else          ReOrder_FifoDataValid <= #`SD reOrder_FifoReadD1;


always @(posedge SysClk)
  if (!Reset_L) reOrder_ReadAddrD1 <= #`SD 10'h0;
  else          reOrder_ReadAddrD1 <= #`SD ReOrder_ReadPtr;

always @(posedge SysClk)
  if (!Reset_L) storeForward_FifoDataOutD1 <= #`SD 76'h0;
  else          storeForward_FifoDataOutD1 <= #`SD StoreForward_FifoDataOut[151:76];

always @(posedge SysClk)
  if (!Reset_L) storeForward_FifoDataOutD0 <= #`SD 76'h0;
  else          storeForward_FifoDataOutD0 <= #`SD StoreForward_FifoDataOut[75:0];

always @(posedge SysClk)
  if (!Reset_L) storeForward_FifoReadD1 <= #`SD 1'b0;
  else          storeForward_FifoReadD1 <= #`SD StoreForward_FifoRead;

always @(posedge SysClk)
  if (!Reset_L) storeForward_FifoDataValid <= #`SD 1'b0;
  else          storeForward_FifoDataValid <= #`SD storeForward_FifoReadD1;

always @(posedge SysClk)
  if (!Reset_L) storeForward_ReadAddrD1 <= #`SD 10'h0;
  else          storeForward_ReadAddrD1 <= #`SD StoreForward_ReadPtr;

/*--------------------------------------------------------------*/
// RO Latching of ECC Errors
/*--------------------------------------------------------------*/
assign ReOrder_EccData = {rO_EccData4, rO_EccData3, rO_EccData2,
                          rO_EccData1, rO_EccData0
                         };

assign ReOrder_ECC_State = {14'h0, rO_CorrectError,
                                   rO_UnCorrectError, 6'b0, rO_EccAddr};

assign rO_loadEccError = (ReOrder_FifoDataValid
                          &
                          (reOrder_CorrectError
                           |
                           ReOrder_UnCorrectError
                          )
                          &
                          ~rO_ErrorValid
                         );

always @ (posedge SysClk)
  if (!Reset_L)                   rO_ErrorValid <= 1'b0;
  else if (ReOrder_ClearEccError) rO_ErrorValid <= 1'b0;
  else if (rO_loadEccError)       rO_ErrorValid <= 1'b1;

always @ (posedge SysClk)
  if (!Reset_L)                   rO_CorrectError <= 1'b0;
  else if (ReOrder_ClearEccError) rO_CorrectError <= 1'b0;
  else if (WrReOrderEccState)     rO_CorrectError <= PioDataIn[17];
  else if (rO_loadEccError)       rO_CorrectError <= reOrder_CorrectError;

always @ (posedge SysClk)
  if (!Reset_L)                   rO_UnCorrectError <= 1'b0;
  else if (ReOrder_ClearEccError) rO_UnCorrectError <= 1'b0;
  else if (WrReOrderEccState)     rO_UnCorrectError <= PioDataIn[16];
  else if (rO_loadEccError)       rO_UnCorrectError <= ReOrder_UnCorrectError;

always @ (posedge SysClk)
  if (!Reset_L)                   rO_EccAddr <= 10'b0;
  else if (ReOrder_ClearEccError) rO_EccAddr <= 10'h0;
  else if (WrReOrderEccState)     rO_EccAddr <= PioDataIn[9:0];
  else if (rO_loadEccError)       rO_EccAddr <= reOrder_ReadAddrD1;

always @ (posedge SysClk)
  if (!Reset_L)                   rO_EccData0 <= 32'h0;
  else if (ReOrder_ClearEccError) rO_EccData0 <= 32'h0;
  else if (WrReOrderEccData0)     rO_EccData0 <= PioDataIn[31:0];
  else if (rO_loadEccError)       rO_EccData0 <= ro_ECCDataOut[31:0];

always @ (posedge SysClk)
  if (!Reset_L)                   rO_EccData1 <= 32'h0;
  else if (ReOrder_ClearEccError) rO_EccData1 <= 32'h0;
  else if (WrReOrderEccData1)     rO_EccData1 <= PioDataIn[31:0];
  else if (rO_loadEccError)       rO_EccData1 <= ro_ECCDataOut[63:32];

always @ (posedge SysClk)
  if (!Reset_L)                   rO_EccData2 <= 32'h0;
  else if (ReOrder_ClearEccError) rO_EccData2 <= 32'h0;
  else if (WrReOrderEccData2)     rO_EccData2 <= PioDataIn[31:0];
  else if (rO_loadEccError)       rO_EccData2 <= ro_ECCDataOut[95:64];

always @ (posedge SysClk)
  if (!Reset_L)                   rO_EccData3 <= 32'h0;
  else if (ReOrder_ClearEccError) rO_EccData3 <= 32'h0;
  else if (WrReOrderEccData3)     rO_EccData3 <= PioDataIn[31:0];
  else if (rO_loadEccError)       rO_EccData3 <= ro_ECCDataOut[127:96];

always @ (posedge SysClk)
  if (!Reset_L)                   rO_EccData4 <= 24'h0;
  else if (ReOrder_ClearEccError) rO_EccData4 <= 24'h0;
  else if (WrReOrderEccData4)     rO_EccData4 <= PioDataIn[23:0];
  else if (rO_loadEccError)       rO_EccData4 <= ro_ECCDataOut[151:128];

/*--------------------------------------------------------------*/
// SF Latching of ECC Errors
/*--------------------------------------------------------------*/
assign StoreForward_EccData = {sF_EccData4, sF_EccData3, sF_EccData2,
                               sF_EccData1, sF_EccData0
                              };


assign StoreForward_ECC_State = {14'h0, sF_CorrectError,
                                 sF_UnCorrectError, 6'b0, sF_EccAddr};

assign sF_loadEccError = (storeForward_FifoDataValid
                          &
                          (storeForward_CorrectError
                           |
                           StoreForward_UnCorrectError
                          )
                          &
                          ~sF_ErrorValid
                         );


always @ (posedge SysClk)
  if (!Reset_L)                        sF_ErrorValid <= 1'b0;
  else if (StoreForward_ClearEccError) sF_ErrorValid <= 1'b0;
  else if (sF_loadEccError)            sF_ErrorValid <= 1'b1;

always @ (posedge SysClk)
  if (!Reset_L)
    sF_CorrectError <= 1'b0;
  else if (StoreForward_ClearEccError)
    sF_CorrectError <= 1'b0;
  else if (WrStoreForwardEccState)
    sF_CorrectError <= PioDataIn[17];
  else if (sF_loadEccError) 
    sF_CorrectError <= storeForward_CorrectError;

always @ (posedge SysClk)
  if (!Reset_L)
    sF_UnCorrectError <= 1'b0;
  else if (StoreForward_ClearEccError)
    sF_UnCorrectError <= 1'b0;
  else if (WrStoreForwardEccState)
    sF_UnCorrectError <= PioDataIn[16];
  else if (sF_loadEccError)
    sF_UnCorrectError <= StoreForward_UnCorrectError;

always @ (posedge SysClk)
  if (!Reset_L)                        sF_EccAddr <= 10'b0;
  else if (StoreForward_ClearEccError) sF_EccAddr <= 10'h0;
  else if (WrStoreForwardEccState)     sF_EccAddr <= PioDataIn[9:0];
  else if (sF_loadEccError)            sF_EccAddr <= storeForward_ReadAddrD1;

always @ (posedge SysClk)
  if (!Reset_L)                        sF_EccData0 <= 32'h0;
  else if (StoreForward_ClearEccError) sF_EccData0 <= 32'h0;
  else if (WrStoreForwardEccData0)     sF_EccData0 <= PioDataIn[31:0];
  else if (sF_loadEccError)            sF_EccData0 <= sf_ECCDataOut[31:0];

always @ (posedge SysClk)
  if (!Reset_L)                        sF_EccData1 <= 32'h0;
  else if (StoreForward_ClearEccError) sF_EccData1 <= 32'h0;
  else if (WrStoreForwardEccData1)     sF_EccData1 <= PioDataIn[31:0];
  else if (sF_loadEccError)            sF_EccData1 <= sf_ECCDataOut[63:32];

always @ (posedge SysClk)
  if (!Reset_L)                        sF_EccData2 <= 32'h0;
  else if (StoreForward_ClearEccError) sF_EccData2 <= 32'h0;
  else if (WrStoreForwardEccData2)     sF_EccData2 <= PioDataIn[31:0];
  else if (sF_loadEccError)            sF_EccData2 <= sf_ECCDataOut[95:64];

always @ (posedge SysClk)
  if (!Reset_L)                        sF_EccData3 <= 32'h0;
  else if (StoreForward_ClearEccError) sF_EccData3 <= 32'h0;
  else if (WrStoreForwardEccData3)     sF_EccData3 <= PioDataIn[31:0];
  else if (sF_loadEccError)            sF_EccData3 <= sf_ECCDataOut[127:96];

always @ (posedge SysClk)
  if (!Reset_L)                        sF_EccData4 <= 24'h0;
  else if (StoreForward_ClearEccError) sF_EccData4 <= 24'h0;
  else if (WrStoreForwardEccData4)     sF_EccData4 <= PioDataIn[23:0];
  else if (sF_loadEccError)            sF_EccData4 <= sf_ECCDataOut[151:128];

/*--------------------------------------------------------------*/
// Modules
/*--------------------------------------------------------------*/

niu_txc_ecc_generate niu_txc_RO_ecc_generate1 (
        .din                          (ReOrder_PreECCData[135:68]),
        .dout                         (ro_PostECCData1)
       );

niu_txc_ecc_generate niu_txc_RO_ecc_generate0 (
        .din                          (ReOrder_PreECCData[67:0]),
        .dout                         (ro_PostECCData0)
       );

niu_txc_ecc_syndrome niu_txc_RO_ecc_syndrome1 (
        .din                          (reOrder_FifoDataOutD1),
        .syn                          (reOrder_ECCSyn1)
       );

niu_txc_ecc_syndrome niu_txc_RO_ecc_syndrome0 (
        .din                          (reOrder_FifoDataOutD0),
        .syn                          (reOrder_ECCSyn0)
       );

niu_txc_ecc_correct niu_txc_RO_ecc_correct1 (
        .din                          (reOrder_FifoDataOutD1),
        .syn                          (reOrder_ECCSyn1),
        .dout                         (ro_ECCDataOut1),
        .no_error                     (),
        .error                        (),
        .corr_error                   (reOrder_CorrectError1),
        .uncorr_error                 (reOrder_UnCorrectError1)
       );

niu_txc_ecc_correct niu_txc_RO_ecc_correct0 (
        .din                          (reOrder_FifoDataOutD0),
        .syn                          (reOrder_ECCSyn0),
        .dout                         (ro_ECCDataOut0),
        .no_error                     (),
        .error                        (),
        .corr_error                   (reOrder_CorrectError0),
        .uncorr_error                 (reOrder_UnCorrectError0)
       );

niu_txc_ecc_generate niu_txc_SF_ecc_generate1 (
        .din                          (StoreForward_PreECCData[135:68]),
        .dout                         (sf_PostECCData1)
       );

niu_txc_ecc_generate niu_txc_SF_ecc_generate0 (
        .din                          (StoreForward_PreECCData[67:0]),
        .dout                         (sf_PostECCData0)
       );

niu_txc_ecc_syndrome niu_txc_SF_ecc_syndrome1 (
        .din                          (storeForward_FifoDataOutD1),
        .syn                          (storeForward_ECCSyn1)
       );

niu_txc_ecc_syndrome niu_txc_SF_ecc_syndrome0 (
        .din                          (storeForward_FifoDataOutD0),
        .syn                          (storeForward_ECCSyn0)
       );

niu_txc_ecc_correct niu_txc_SF_ecc_correct1 (
        .din                          (storeForward_FifoDataOutD1),
        .syn                          (storeForward_ECCSyn1),
        .dout                         (sf_ECCDataOut1),
        .no_error                     (),
        .error                        (),
        .corr_error                   (storeForward_CorrectError1),
        .uncorr_error                 (storeForward_UnCorrectError1)
       );

niu_txc_ecc_correct niu_txc_SF_ecc_correct0 (
        .din                          (storeForward_FifoDataOutD0),
        .syn                          (storeForward_ECCSyn0),
        .dout                         (sf_ECCDataOut0),
        .no_error                     (),
        .error                        (),
        .corr_error                   (storeForward_CorrectError0),
        .uncorr_error                 (storeForward_UnCorrectError0)
       );

endmodule
