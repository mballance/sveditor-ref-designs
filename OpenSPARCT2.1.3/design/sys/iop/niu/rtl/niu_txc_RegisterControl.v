// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_RegisterControl.v
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
 *  niu_txc_RegisterControl.v
 *
 *  NIU Transmit Register Decodes & Controller
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

module niu_txc_RegisterControl (
        SysClk,
        Reset_L, 
        niu_txc_interrupts, 

        Slave_32BitMode,
        Slave_Read,             // Slave Read & Write Bar
        Slave_Sel,              // Slave Sel
        Slave_Addr,             // Slave Address
        Slave_DataIn,           // Slave Write Data
        Slave_Ack,              // Slave PIO Ack
        Slave_Err,              // Slave PIO Error
        SlaveStrobe,
        SlaveAddrB1,
        SlaveAddrB0,
        SlaveDataInB0,
        Slave_DataOut,          // Slave Read Data

        Txc_Enabled, 
        Port0_Enabled, 
        Port1_Enabled, 
`ifdef NEPTUNE
        Port2_Enabled, 
        Port3_Enabled, 
`endif
        FlushEngine, 

        DMA0to3_Slave_Data,
        DMA4to7_Slave_Data,
        DMA8to11_Slave_Data,
        DMA12to15_Slave_Data,
        Read_DMA0_Register,
        Read_DMA1_Register,
        Read_DMA2_Register,
        Read_DMA3_Register,
        Read_DMA4_Register,
        Read_DMA5_Register,
        Read_DMA6_Register,
        Read_DMA7_Register,
        Read_DMA8_Register,
        Read_DMA9_Register,
        Read_DMA10_Register,
        Read_DMA11_Register,
        Read_DMA12_Register,
        Read_DMA13_Register,
        Read_DMA14_Register,
        Read_DMA15_Register,
        Write_DMA0_Register,
        Write_DMA1_Register,
        Write_DMA2_Register,
        Write_DMA3_Register,
        Write_DMA4_Register,
        Write_DMA5_Register,
        Write_DMA6_Register,
        Write_DMA7_Register,
        Write_DMA8_Register,
        Write_DMA9_Register,
        Write_DMA10_Register,
        Write_DMA11_Register,
        Write_DMA12_Register,
        Write_DMA13_Register,
        Write_DMA14_Register,
        Write_DMA15_Register,

`ifdef NEPTUNE
        DMA16to19_Slave_Data,
        DMA20to23_Slave_Data,
        Read_DMA16_Register,
        Read_DMA17_Register,
        Read_DMA18_Register,
        Read_DMA19_Register,
        Read_DMA20_Register,
        Read_DMA21_Register,
        Read_DMA22_Register,
        Read_DMA23_Register,
        Write_DMA16_Register,
        Write_DMA17_Register,
        Write_DMA18_Register,
        Write_DMA19_Register,
        Write_DMA20_Register,
        Write_DMA21_Register,
        Write_DMA22_Register,
        Write_DMA23_Register,
`endif

        Port0to1_Slave_Data,
        Read_Port0_Register,
        Write_Port0_Register,
        PosEdgeWritePort0,

`ifdef NEPTUNE
        Port2to3_Slave_Data,
        Read_Port2_Register,
        Write_Port2_Register,
        PosEdgeWritePort2,
`endif

        Port0_PioDataIn,
        Port0_ReOrder_ECC_State,
        Port0_StoreForward_ECC_State,
        Port0_PacketAssyDead,
        Port0_ReOrder_Error,
        Port0_MaxReorderNumber,

        Port1_PioDataIn,
        Port1_ReOrder_ECC_State,
        Port1_StoreForward_ECC_State,
        Port1_PacketAssyDead,
        Port1_ReOrder_Error,
        Port1_MaxReorderNumber,

`ifdef NEPTUNE
        Port2_PioDataIn,
        Port2_ReOrder_ECC_State,
        Port2_StoreForward_ECC_State,
        Port2_PacketAssyDead,
        Port2_ReOrder_Error,
        Port2_MaxReorderNumber,

        Port3_PioDataIn,
        Port3_ReOrder_ECC_State,
        Port3_StoreForward_ECC_State,
        Port3_PacketAssyDead,
        Port3_ReOrder_Error,
        Port3_MaxReorderNumber,
`endif
        Debug_Select, 
        TrainingVector
       );
    
// Include Header Files
`include "txc_defines.h"
`include "niu_txc_reg_defines.h"

// Global Signals
input          SysClk;
input          Reset_L;

// Interrupts Interface
output         niu_txc_interrupts;

reg            niu_txc_interrupts;

// Slave Interface
input          Slave_32BitMode;
input          Slave_Read;
input          Slave_Sel;
input  [19:0]  Slave_Addr;
input  [31:0]  Slave_DataIn;

output         Slave_Ack;
output         Slave_Err;
output         SlaveStrobe;
output [8:2]   SlaveAddrB1;
output [11:2]  SlaveAddrB0;
output [31:0]  SlaveDataInB0;
output [63:0]  Slave_DataOut;

reg            Slave_Ack;
reg            Slave_Err;
reg    [31:0]  SlaveDataInB0;

//
output         Txc_Enabled;
output         Port0_Enabled;
output         Port1_Enabled;
output         FlushEngine;
output [5:0]   Debug_Select;
output [31:0]  TrainingVector;

reg            Txc_Enabled;
reg            Port0_Enabled;
reg            Port1_Enabled;
//reg            FlushEngine;
reg    [5:0]   Debug_Select;
reg    [31:0]  TrainingVector;

`ifdef NEPTUNE
output         Port2_Enabled;
output         Port3_Enabled;

reg            Port2_Enabled;
reg            Port3_Enabled;
`endif

/*--------------------------------------------------------------*/
// DMA Registers
/*--------------------------------------------------------------*/
input  [31:0]  DMA0to3_Slave_Data;
input  [31:0]  DMA4to7_Slave_Data;
input  [31:0]  DMA8to11_Slave_Data;
input  [31:0]  DMA12to15_Slave_Data;

output         Read_DMA0_Register;
output         Read_DMA1_Register;
output         Read_DMA2_Register;
output         Read_DMA3_Register;
output         Read_DMA4_Register;
output         Read_DMA5_Register;
output         Read_DMA6_Register;
output         Read_DMA7_Register;
output         Read_DMA8_Register;
output         Read_DMA9_Register;
output         Read_DMA10_Register;
output         Read_DMA11_Register;
output         Read_DMA12_Register;
output         Read_DMA13_Register;
output         Read_DMA14_Register;
output         Read_DMA15_Register;
output         Write_DMA0_Register;
output         Write_DMA1_Register;
output         Write_DMA2_Register;
output         Write_DMA3_Register;
output         Write_DMA4_Register;
output         Write_DMA5_Register;
output         Write_DMA6_Register;
output         Write_DMA7_Register;
output         Write_DMA8_Register;
output         Write_DMA9_Register;
output         Write_DMA10_Register;
output         Write_DMA11_Register;
output         Write_DMA12_Register;
output         Write_DMA13_Register;
output         Write_DMA14_Register;
output         Write_DMA15_Register;

`ifdef NEPTUNE
input  [31:0]  DMA16to19_Slave_Data;
input  [31:0]  DMA20to23_Slave_Data;

output         Read_DMA16_Register;
output         Read_DMA17_Register;
output         Read_DMA18_Register;
output         Read_DMA19_Register;
output         Read_DMA20_Register;
output         Read_DMA21_Register;
output         Read_DMA22_Register;
output         Read_DMA23_Register;
output         Write_DMA16_Register;
output         Write_DMA17_Register;
output         Write_DMA18_Register;
output         Write_DMA19_Register;
output         Write_DMA20_Register;
output         Write_DMA21_Register;
output         Write_DMA22_Register;
output         Write_DMA23_Register;
`endif

/*--------------------------------------------------------------*/
// Grouped Port Registers
/*--------------------------------------------------------------*/
input  [31:0]  Port0to1_Slave_Data;

output         Read_Port0_Register;
output         Write_Port0_Register;
output         PosEdgeWritePort0;

`ifdef NEPTUNE
input  [31:0]  Port2to3_Slave_Data;

output         Read_Port2_Register;
output         Write_Port2_Register;
output         PosEdgeWritePort2;
`endif

/*--------------------------------------------------------------*/
// Port 0 Registers
/*--------------------------------------------------------------*/
// Port 0 ReOrder PIO Control Registers
output [31:0]  Port0_PioDataIn;

reg    [31:0]  Port0_PioDataIn;

// ECC Error Reporting PIO Control Registers
input  [17:16] Port0_ReOrder_ECC_State;
input  [17:16] Port0_StoreForward_ECC_State;

// ECC Control & Status Registers
input          Port0_PacketAssyDead;
input          Port0_ReOrder_Error;

// Control Registers
output [3:0]   Port0_MaxReorderNumber;

reg    [3:0]   Port0_MaxReorderNumber;

/*--------------------------------------------------------------*/
// Port 1 Registers
/*--------------------------------------------------------------*/
// ReOrder PIO Control Registers
output [31:0]  Port1_PioDataIn;

reg    [31:0]  Port1_PioDataIn;

// ECC Error Reporting PIO Control Registers
input  [17:16] Port1_ReOrder_ECC_State;
input  [17:16] Port1_StoreForward_ECC_State;

// ECC Control & Status Registers
input          Port1_PacketAssyDead;
input          Port1_ReOrder_Error;

// Control Registers
output [3:0]   Port1_MaxReorderNumber;

reg    [3:0]   Port1_MaxReorderNumber;

/*--------------------------------------------------------------*/
// Port 2 Registers
/*--------------------------------------------------------------*/
`ifdef NEPTUNE
// ReOrder PIO Control Registers
output [31:0]  Port2_PioDataIn;

reg    [31:0]  Port2_PioDataIn;

// ECC Error Reporting PIO Control Registers
input  [17:16] Port2_ReOrder_ECC_State;
input  [17:16] Port2_StoreForward_ECC_State;

// ECC Control & Status Registers
input          Port2_PacketAssyDead;
input          Port2_ReOrder_Error;

// Control Registers
output [3:0]   Port2_MaxReorderNumber;

reg    [3:0]   Port2_MaxReorderNumber;

/*--------------------------------------------------------------*/
// Port 3 Registers
/*--------------------------------------------------------------*/
// ReOrder PIO Control Registers
output [31:0]  Port3_PioDataIn;

reg    [31:0]  Port3_PioDataIn;

// ECC Error Reporting PIO Control Registers
input  [17:16] Port3_ReOrder_ECC_State;
input  [17:16] Port3_StoreForward_ECC_State;

// ECC Control & Status Registers
input          Port3_PacketAssyDead;
input          Port3_ReOrder_Error;

// Control Registers
output [3:0]   Port3_MaxReorderNumber;

reg    [3:0]   Port3_MaxReorderNumber;

`endif

/*--------------------------------------------------------------*/
// Wires & Registers
/*--------------------------------------------------------------*/
wire           reserved32Bit;
wire           generateNACK;
wire           readSlaveRegB0;
wire           readSlaveRegB1;
wire           writeSlaveRegB0;
wire           writeSlaveRegB1;
wire           niu_txc_RSV_decode;
wire           niu_txc_valid_decode;
wire           txc_pio_decode;
wire           txc_port0_decode;
wire           txc_port1_decode;
wire           ports0and1_decode;
wire           read_PIO_Register;
wire           write_PIO_Register;
wire           dma0_decode;
wire           dma1_decode;
wire           dma2_decode;
wire           dma3_decode;
wire           dma4_decode;
wire           dma5_decode;
wire           dma6_decode;
wire           dma7_decode;
wire           dma8_decode;
wire           dma9_decode;
wire           dma10_decode;
wire           dma11_decode;
wire           dma12_decode;
wire           dma13_decode;
wire           dma14_decode;
wire           dma15_decode;
wire           dma_rsv_space;
wire           dma_decode_space;
wire           posEdgeSetIntEvent;
wire           posEdgeClrIntEvent;
wire           read_DMA0to3_Register;
wire           read_DMA4to7_Register;
wire           read_DMA8to11_Register;
wire           read_DMA12to15_Register;
wire   [31:0]  setTxcIntEvents;
wire   [31:0]  txcInterruptMask;

reg            en_Slave_Ack;
reg            en_Slave_AckD1;
reg            write_Port0_RegisterD1;
reg            functionZero;
reg            setIntEvent;
reg            setIntEventD1;
reg            clrIntEvent;
reg            clrIntEventD1;
reg            slaveReadB0;
reg            slaveReadB1;
reg            slaveSelB0;
reg            slaveSelB1;
reg    [5:0]   port0_txcInterruptMask;
reg    [5:0]   port1_txcInterruptMask;
reg    [11:2]  slaveAddrBuf1;
reg    [18:0]  slaveAddrBuf0;
reg    [31:0]  iSlave_DataOut;
reg    [31:0]  txcInterruptEvents;
reg    [31:0]  pio_sl_data;

`ifdef NEPTUNE
wire           dma16_decode;
wire           dma17_decode;
wire           dma18_decode;
wire           dma19_decode;
wire           dma20_decode;
wire           dma21_decode;
wire           dma22_decode;
wire           dma23_decode;
wire           read_DMA16to19_Register;
wire           read_DMA20to23_Register;
wire           txc_port2_decode;
wire           txc_port3_decode;
wire           posEdgeWritePort2;
wire           ports2and3_decode;

reg            write_Port2_RegisterD1;
reg    [5:0]   port2_txcInterruptMask;
reg    [5:0]   port3_txcInterruptMask;
`endif

/*--------------------------------------------------------------*/
// Parameters and Defines
/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/
// Zero In Checks
/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/
// Interrupt
// Give Precedance to setting when clearing interrupts
/*--------------------------------------------------------------*/
`ifdef NEPTUNE
assign setTxcIntEvents = {2'h0,
                          Port3_PacketAssyDead, Port3_ReOrder_Error,
                          Port3_ReOrder_ECC_State[16],
                          Port3_ReOrder_ECC_State[17],
                          Port3_StoreForward_ECC_State[16],
                          Port3_StoreForward_ECC_State[17],
                          2'h0,
                          Port2_PacketAssyDead, Port2_ReOrder_Error,
                          Port2_ReOrder_ECC_State[16],
                          Port2_ReOrder_ECC_State[17],
                          Port2_StoreForward_ECC_State[16],
                          Port2_StoreForward_ECC_State[17],
                          2'h0,
                          Port1_PacketAssyDead, Port1_ReOrder_Error,
                          Port1_ReOrder_ECC_State[16],
                          Port1_ReOrder_ECC_State[17],
                          Port1_StoreForward_ECC_State[16],
                          Port1_StoreForward_ECC_State[17],
                          2'h0,
                          Port0_PacketAssyDead, Port0_ReOrder_Error,
                          Port0_ReOrder_ECC_State[16],
                          Port0_ReOrder_ECC_State[17],
                          Port0_StoreForward_ECC_State[16],
                          Port0_StoreForward_ECC_State[17]
                         };

`else
assign setTxcIntEvents = {16'h0,
                          2'h0,
                          Port1_PacketAssyDead, Port1_ReOrder_Error,
                          Port1_ReOrder_ECC_State[16],
                          Port1_ReOrder_ECC_State[17],
                          Port1_StoreForward_ECC_State[16],
                          Port1_StoreForward_ECC_State[17],
                          2'h0,
                          Port0_PacketAssyDead, Port0_ReOrder_Error,
                          Port0_ReOrder_ECC_State[16],
                          Port0_ReOrder_ECC_State[17],
                          Port0_StoreForward_ECC_State[16],
                          Port0_StoreForward_ECC_State[17]
                         };
`endif


`ifdef NEPTUNE
assign txcInterruptMask = {2'h0, port3_txcInterruptMask,
                           2'h0, port2_txcInterruptMask,
                           2'h0, port1_txcInterruptMask,
                           2'h0, port0_txcInterruptMask
                          };
`else
assign txcInterruptMask = {16'h0,
                           2'h0, port1_txcInterruptMask,
                           2'h0, port0_txcInterruptMask
                          };
`endif


always @ (posedge SysClk)
  if (!Reset_L) setIntEventD1 <= 1'b0;
  else          setIntEventD1 <= #`SD setIntEvent;

assign posEdgeSetIntEvent = setIntEvent & ~setIntEventD1;

always @ (posedge SysClk)
  if (!Reset_L) clrIntEventD1 <= 1'b0;
  else          clrIntEventD1 <= #`SD clrIntEvent;

assign posEdgeClrIntEvent = clrIntEvent & ~clrIntEventD1;


always @ (posedge SysClk)
  if (!Reset_L)
    txcInterruptEvents <= 32'h0;
  else if (posEdgeSetIntEvent)
`ifdef NEPTUNE
    txcInterruptEvents <= #`SD {2'h0, SlaveDataInB0[29:24],
                                2'h0, SlaveDataInB0[21:16],
                                2'h0, SlaveDataInB0[13:8],
                                2'h0, SlaveDataInB0[5:0]
                               };
`else
    txcInterruptEvents <= #`SD {16'h0,
                                2'h0, SlaveDataInB0[13:8],
                                2'h0, SlaveDataInB0[5:0]
                               };
`endif
  else if (posEdgeClrIntEvent)
`ifdef NEPTUNE
    txcInterruptEvents <= #`SD ((txcInterruptEvents
                                 & 
                                 {2'h0, ~SlaveDataInB0[29:24],
                                  2'h0, ~SlaveDataInB0[21:16],
                                  2'h0, ~SlaveDataInB0[13:8],
                                  2'h0, ~SlaveDataInB0[5:0]
                                 }
                                )
                                |
                                setTxcIntEvents
                               );
`else
    txcInterruptEvents <= #`SD ((txcInterruptEvents
                                 & 
                                 {16'h0,
                                  2'h0, ~SlaveDataInB0[13:8],
                                  2'h0, ~SlaveDataInB0[5:0]
                                 }
                                )
                                |
                                setTxcIntEvents
                               );
`endif
  else
    txcInterruptEvents <= #`SD (setTxcIntEvents | txcInterruptEvents);


always @ (posedge SysClk)
  if (!Reset_L) niu_txc_interrupts <= 1'b0;
  else          niu_txc_interrupts <= #`SD |(txcInterruptEvents
                                             &
                                             ~txcInterruptMask);

/*--------------------------------------------------------------*/
// Address Decodes
/*--------------------------------------------------------------*/
assign dma_rsv_space       = (slaveAddrBuf0[11:0] >= `DMA_RSV_SPACE);
assign niu_txc_RSV_decode  = (~niu_txc_valid_decode
                              ||
                              ~functionZero
                             );

assign txc_pio_decode    = ((((slaveAddrBuf0[18:0] >= `TXC_LOWER)
                               &&
                              (slaveAddrBuf0[18:0] <= `TXC_UPPER)
                             )
                             ||
                             ((slaveAddrBuf0[18:0] >= `TXC_INT_LOWER)
                               &&
                              (slaveAddrBuf0[18:0] <= `TXC_INT_UPPER)
                             )
                            )
                            &&
                            functionZero
                           );


assign ports0and1_decode = (txc_port0_decode | txc_port1_decode);

assign txc_port0_decode = ((slaveAddrBuf0[18:0] >= `PORT0_LOWER)
                           &&
                           (slaveAddrBuf0[18:0] <= `PORT0_UPPER)
                           &&
                           functionZero
                          );

assign txc_port1_decode = ((slaveAddrBuf0[18:0] >= `PORT1_LOWER)
                           &&
                           (slaveAddrBuf0[18:0] <= `PORT1_UPPER)
                           &&
                           functionZero
                          );

assign niu_txc_valid_decode = ((dma_decode_space & ~dma_rsv_space)
                               ||
                               txc_pio_decode
                               ||
                               ports0and1_decode
                    `ifdef NEPTUNE
                               ||
                               ports2and3_decode
                     `endif
                              );

assign dma_decode_space = ({functionZero, slaveAddrBuf0[18:12]}
                    `ifdef NEPTUNE
                            <= `DMA23_SPACE
                     `else
                            <= `DMA15_SPACE
                     `endif
                          );

assign SlaveAddrB0  = slaveAddrBuf0[11:2];
assign SlaveAddrB1  = slaveAddrBuf1[8:2];

assign dma0_decode  = ({functionZero, slaveAddrBuf0[18:12]} == `DMA0_SPACE);
assign dma1_decode  = ({functionZero, slaveAddrBuf0[18:12]} == `DMA1_SPACE);
assign dma2_decode  = ({functionZero, slaveAddrBuf0[18:12]} == `DMA2_SPACE);
assign dma3_decode  = ({functionZero, slaveAddrBuf0[18:12]} == `DMA3_SPACE);
assign dma4_decode  = ({functionZero, slaveAddrBuf0[18:12]} == `DMA4_SPACE);
assign dma5_decode  = ({functionZero, slaveAddrBuf0[18:12]} == `DMA5_SPACE);
assign dma6_decode  = ({functionZero, slaveAddrBuf0[18:12]} == `DMA6_SPACE);
assign dma7_decode  = ({functionZero, slaveAddrBuf0[18:12]} == `DMA7_SPACE);
assign dma8_decode  = ({functionZero, slaveAddrBuf0[18:12]} == `DMA8_SPACE);
assign dma9_decode  = ({functionZero, slaveAddrBuf0[18:12]} == `DMA9_SPACE);
assign dma10_decode = ({functionZero, slaveAddrBuf0[18:12]} == `DMA10_SPACE);
assign dma11_decode = ({functionZero, slaveAddrBuf0[18:12]} == `DMA11_SPACE);
assign dma12_decode = ({functionZero, slaveAddrBuf0[18:12]} == `DMA12_SPACE);
assign dma13_decode = ({functionZero, slaveAddrBuf0[18:12]} == `DMA13_SPACE);
assign dma14_decode = ({functionZero, slaveAddrBuf0[18:12]} == `DMA14_SPACE);
assign dma15_decode = ({functionZero, slaveAddrBuf0[18:12]} == `DMA15_SPACE);

assign Read_DMA0_Register   = (readSlaveRegB0 & dma0_decode & ~dma_rsv_space);
assign Read_DMA1_Register   = (readSlaveRegB0 & dma1_decode & ~dma_rsv_space);
assign Read_DMA2_Register   = (readSlaveRegB0 & dma2_decode & ~dma_rsv_space);
assign Read_DMA3_Register   = (readSlaveRegB0 & dma3_decode & ~dma_rsv_space);
assign Read_DMA4_Register   = (readSlaveRegB0 & dma4_decode & ~dma_rsv_space);
assign Read_DMA5_Register   = (readSlaveRegB0 & dma5_decode & ~dma_rsv_space);
assign Read_DMA6_Register   = (readSlaveRegB0 & dma6_decode & ~dma_rsv_space);
assign Read_DMA7_Register   = (readSlaveRegB0 & dma7_decode & ~dma_rsv_space);
assign Read_DMA8_Register   = (readSlaveRegB0 & dma8_decode & ~dma_rsv_space);
assign Read_DMA9_Register   = (readSlaveRegB0 & dma9_decode & ~dma_rsv_space);
assign Read_DMA10_Register  = (readSlaveRegB0 & dma10_decode & ~dma_rsv_space);
assign Read_DMA11_Register  = (readSlaveRegB0 & dma11_decode & ~dma_rsv_space);
assign Read_DMA12_Register  = (readSlaveRegB1 & dma12_decode & ~dma_rsv_space);
assign Read_DMA13_Register  = (readSlaveRegB1 & dma13_decode & ~dma_rsv_space);
assign Read_DMA14_Register  = (readSlaveRegB1 & dma14_decode & ~dma_rsv_space);
assign Read_DMA15_Register  = (readSlaveRegB1 & dma15_decode & ~dma_rsv_space);

assign Write_DMA0_Register  = (writeSlaveRegB0 & dma0_decode & ~dma_rsv_space);
assign Write_DMA1_Register  = (writeSlaveRegB0 & dma1_decode & ~dma_rsv_space);
assign Write_DMA2_Register  = (writeSlaveRegB0 & dma2_decode & ~dma_rsv_space);
assign Write_DMA3_Register  = (writeSlaveRegB0 & dma3_decode & ~dma_rsv_space);
assign Write_DMA4_Register  = (writeSlaveRegB0 & dma4_decode & ~dma_rsv_space);
assign Write_DMA5_Register  = (writeSlaveRegB0 & dma5_decode & ~dma_rsv_space);
assign Write_DMA6_Register  = (writeSlaveRegB0 & dma6_decode & ~dma_rsv_space);
assign Write_DMA7_Register  = (writeSlaveRegB0 & dma7_decode & ~dma_rsv_space);
assign Write_DMA8_Register  = (writeSlaveRegB0 & dma8_decode & ~dma_rsv_space);
assign Write_DMA9_Register  = (writeSlaveRegB0 & dma9_decode & ~dma_rsv_space);
assign Write_DMA10_Register = (writeSlaveRegB0 & dma10_decode & ~dma_rsv_space);
assign Write_DMA11_Register = (writeSlaveRegB0 & dma11_decode & ~dma_rsv_space);
assign Write_DMA12_Register = (writeSlaveRegB0 & dma12_decode & ~dma_rsv_space);
assign Write_DMA13_Register = (writeSlaveRegB1 & dma13_decode & ~dma_rsv_space);
assign Write_DMA14_Register = (writeSlaveRegB1 & dma14_decode & ~dma_rsv_space);
assign Write_DMA15_Register = (writeSlaveRegB1 & dma15_decode & ~dma_rsv_space);

assign read_PIO_Register    = (readSlaveRegB0 & txc_pio_decode);
assign write_PIO_Register   = (writeSlaveRegB0 & txc_pio_decode);

assign Read_Port0_Register  = (readSlaveRegB0 & ports0and1_decode);
assign Write_Port0_Register = (writeSlaveRegB0 & ports0and1_decode);


`ifdef NEPTUNE

assign ports2and3_decode = (txc_port2_decode | txc_port3_decode);

assign txc_port2_decode  = ((slaveAddrBuf0[18:0] >= `PORT2_LOWER)
                            &&
                            (slaveAddrBuf0[18:0] <= `PORT2_UPPER)
                            &&
                            functionZero
                           );

assign txc_port3_decode  = ((slaveAddrBuf0[18:0] >= `PORT3_LOWER)
                            &&
                            (slaveAddrBuf0[18:0] <= `PORT3_UPPER)
                            &&
                            functionZero
                           );

assign dma16_decode = ({functionZero, slaveAddrBuf0[18:12]} == `DMA16_SPACE);
assign dma17_decode = ({functionZero, slaveAddrBuf0[18:12]} == `DMA17_SPACE);
assign dma18_decode = ({functionZero, slaveAddrBuf0[18:12]} == `DMA18_SPACE);
assign dma19_decode = ({functionZero, slaveAddrBuf0[18:12]} == `DMA19_SPACE);
assign dma20_decode = ({functionZero, slaveAddrBuf0[18:12]} == `DMA20_SPACE);
assign dma21_decode = ({functionZero, slaveAddrBuf0[18:12]} == `DMA21_SPACE);
assign dma22_decode = ({functionZero, slaveAddrBuf0[18:12]} == `DMA22_SPACE);
assign dma23_decode = ({functionZero, slaveAddrBuf0[18:12]} == `DMA23_SPACE);

assign Read_DMA16_Register  = (readSlaveRegB1 & dma16_decode & ~dma_rsv_space);
assign Read_DMA17_Register  = (readSlaveRegB1 & dma17_decode & ~dma_rsv_space);
assign Read_DMA18_Register  = (readSlaveRegB1 & dma18_decode & ~dma_rsv_space);
assign Read_DMA19_Register  = (readSlaveRegB1 & dma19_decode & ~dma_rsv_space);
assign Read_DMA20_Register  = (readSlaveRegB1 & dma20_decode & ~dma_rsv_space);
assign Read_DMA21_Register  = (readSlaveRegB1 & dma21_decode & ~dma_rsv_space);
assign Read_DMA22_Register  = (readSlaveRegB1 & dma22_decode & ~dma_rsv_space);
assign Read_DMA23_Register  = (readSlaveRegB1 & dma23_decode & ~dma_rsv_space);

assign Write_DMA16_Register = (writeSlaveRegB1 & dma16_decode & ~dma_rsv_space);
assign Write_DMA17_Register = (writeSlaveRegB1 & dma17_decode & ~dma_rsv_space);
assign Write_DMA18_Register = (writeSlaveRegB1 & dma18_decode & ~dma_rsv_space);
assign Write_DMA19_Register = (writeSlaveRegB1 & dma19_decode & ~dma_rsv_space);
assign Write_DMA20_Register = (writeSlaveRegB1 & dma20_decode & ~dma_rsv_space);
assign Write_DMA21_Register = (writeSlaveRegB1 & dma21_decode & ~dma_rsv_space);
assign Write_DMA22_Register = (writeSlaveRegB1 & dma22_decode & ~dma_rsv_space);
assign Write_DMA23_Register = (writeSlaveRegB1 & dma23_decode & ~dma_rsv_space);

assign Read_Port2_Register  = (readSlaveRegB0 & ports2and3_decode);
assign Write_Port2_Register = (writeSlaveRegB0 & ports2and3_decode);

`endif

/*--------------------------------------------------------------*/
// Pipeline Delay for PIO Signals
/*--------------------------------------------------------------*/
assign readSlaveRegB0  = (slaveSelB0 & slaveReadB0);
assign readSlaveRegB1  = (slaveSelB1 & slaveReadB1);
assign writeSlaveRegB0 = (slaveSelB0 & ~slaveReadB0);
assign writeSlaveRegB1 = (slaveSelB1 & ~slaveReadB1);

always @ (posedge SysClk)
  if (!Reset_L) slaveReadB0 <= 1'b0;
  else          slaveReadB0 <= #`SD Slave_Read;

always @ (posedge SysClk)
  if (!Reset_L) slaveReadB1 <= 1'b0;
  else          slaveReadB1 <= #`SD Slave_Read;

always @ (posedge SysClk)
  if (!Reset_L) slaveSelB0 <= 1'b0;
  else          slaveSelB0 <= #`SD Slave_Sel;

always @ (posedge SysClk)
  if (!Reset_L) slaveSelB1 <= 1'b0;
  else          slaveSelB1 <= #`SD Slave_Sel;

always @ (posedge SysClk)
  if (!Reset_L) functionZero <= 1'b0;
  else          functionZero <= #`SD Slave_Addr[19];

always @ (posedge SysClk)
  if (!Reset_L) slaveAddrBuf0 <= 19'h0;
  else          slaveAddrBuf0 <= #`SD Slave_Addr[18:0];

always @ (posedge SysClk)
  if (!Reset_L) slaveAddrBuf1 <= 10'h0;
  else          slaveAddrBuf1 <= #`SD Slave_Addr[11:2];

always @ (posedge SysClk)
  if (!Reset_L) SlaveDataInB0 <= 32'h0;
  else          SlaveDataInB0 <= #`SD Slave_DataIn;

always @ (posedge SysClk)
  if (!Reset_L) Port0_PioDataIn <= 32'h0;
  else          Port0_PioDataIn <= #`SD Slave_DataIn;

always @ (posedge SysClk)
  if (!Reset_L) Port1_PioDataIn <= 32'h0;
  else          Port1_PioDataIn <= #`SD Slave_DataIn;

`ifdef NEPTUNE
always @ (posedge SysClk)
  if (!Reset_L) Port2_PioDataIn <= 32'h0;
  else          Port2_PioDataIn <= #`SD Slave_DataIn;

always @ (posedge SysClk)
  if (!Reset_L) Port3_PioDataIn <= 32'h0;
  else          Port3_PioDataIn <= #`SD Slave_DataIn;
`endif

/*--------------------------------------------------------------*/
// Slave Control Logic
/*--------------------------------------------------------------*/
always @ (posedge SysClk)
  if (!Reset_L) en_Slave_Ack <= 1'b0;
  else          en_Slave_Ack <= #`SD slaveSelB0;

always @ (posedge SysClk)
  if (!Reset_L) en_Slave_AckD1 <= 1'b0;
  else          en_Slave_AckD1 <= #`SD en_Slave_Ack;

assign SlaveStrobe = en_Slave_Ack & ~en_Slave_AckD1;

/*--------------------------------------------------------------*/
// Posedge NIU PIO Write Logic
/*--------------------------------------------------------------*/
always @ (posedge SysClk)
  if (!Reset_L) write_Port0_RegisterD1 <= 1'b0;
  else          write_Port0_RegisterD1 <= #`SD Write_Port0_Register;

assign PosEdgeWritePort0  = (Write_Port0_Register & ~write_Port0_RegisterD1);

`ifdef NEPTUNE
always @ (posedge SysClk)
  if (!Reset_L) write_Port2_RegisterD1 <= 1'b0;
  else          write_Port2_RegisterD1 <= #`SD Write_Port2_Register;

assign PosEdgeWritePort2  = (Write_Port2_Register & ~write_Port2_RegisterD1);
`endif

/*--------------------------------------------------------------*/
// Slave Interface
/*--------------------------------------------------------------*/
always @ (posedge SysClk)
  if (!Reset_L)         Slave_Ack <= 1'b0;
  else if (SlaveStrobe) Slave_Ack <= #`SD 1'b1;
  else                  Slave_Ack <= #`SD 1'b0;

assign generateNACK = (SlaveStrobe & Slave_Read & niu_txc_RSV_decode);

always @ (posedge SysClk)
  if (!Reset_L)          Slave_Err <= 1'b0;
  else if (generateNACK) Slave_Err <= #`SD 1'b1;
  else                   Slave_Err <= #`SD 1'b0;

assign Slave_DataOut = {32'h0, iSlave_DataOut};

assign reserved32Bit = Slave_32BitMode & slaveAddrBuf0[2];

always @ (posedge SysClk)
  if (!Reset_L)                     iSlave_DataOut <= 32'h0;
  else if (reserved32Bit)           iSlave_DataOut <= #`SD 32'h0;
  else if (read_PIO_Register)       iSlave_DataOut <= #`SD pio_sl_data;
  else if (Read_Port0_Register)     iSlave_DataOut <= #`SD Port0to1_Slave_Data;
`ifdef NEPTUNE
  else if (Read_Port2_Register)     iSlave_DataOut <= #`SD Port2to3_Slave_Data;
`endif
  else if (read_DMA0to3_Register)   iSlave_DataOut <= #`SD DMA0to3_Slave_Data;
  else if (read_DMA4to7_Register)   iSlave_DataOut <= #`SD DMA4to7_Slave_Data;
  else if (read_DMA8to11_Register)  iSlave_DataOut <= #`SD DMA8to11_Slave_Data;
  else if (read_DMA12to15_Register) iSlave_DataOut <= #`SD DMA12to15_Slave_Data;

`ifdef NEPTUNE
  else if (read_DMA16to19_Register) iSlave_DataOut <= #`SD DMA16to19_Slave_Data;
  else if (read_DMA20to23_Register) iSlave_DataOut <= #`SD DMA20to23_Slave_Data;
`endif
  else                              iSlave_DataOut <= #`SD 32'hDEADBEEF;


assign read_DMA0to3_Register   =   (Read_DMA0_Register | Read_DMA1_Register
                                    |
                                    Read_DMA2_Register | Read_DMA3_Register);

assign read_DMA4to7_Register   =   (Read_DMA4_Register  | Read_DMA5_Register
                                    |
                                    Read_DMA6_Register |  Read_DMA7_Register);

assign read_DMA8to11_Register  =   (Read_DMA8_Register | Read_DMA9_Register
                                    |
                                    Read_DMA10_Register | Read_DMA11_Register);

assign read_DMA12to15_Register =   (Read_DMA12_Register | Read_DMA13_Register
                                    |
                                    Read_DMA14_Register | Read_DMA15_Register);

`ifdef NEPTUNE
assign read_DMA16to19_Register =   (Read_DMA16_Register | Read_DMA17_Register
                                    |
                                    Read_DMA18_Register | Read_DMA19_Register);

assign read_DMA20to23_Register =   (Read_DMA20_Register | Read_DMA21_Register
                                    |
                                    Read_DMA22_Register | Read_DMA23_Register);
`endif

/*--------------------------------------------------------------*/
// NIU TXC PIO Read & Write Registers
/*--------------------------------------------------------------*/
assign  FlushEngine    = 1'b0;

always @ (posedge SysClk)
  if (!Reset_L)
    pio_sl_data <= 32'h0;
  else if (read_PIO_Register)
      case ({slaveAddrBuf1[11:2], 2'h0}) // synopsys parallel_case
                                       /* 0in < case -parallel */

        `TXC_CONTROL:            pio_sl_data <= {27'h0,
                                                 Txc_Enabled,
                                              `ifdef NEPTUNE
                                                 Port3_Enabled, Port2_Enabled,
                                              `else
                                                 2'h0,
                                              `endif
                                                 Port1_Enabled, Port0_Enabled};

        `TXC_TRAINING:           pio_sl_data <= TrainingVector;

        `TXC_DEBUG_SELECT:       pio_sl_data <= {26'h0, Debug_Select};

        `TXC_MAX_REORDER:        pio_sl_data <= {
                                              `ifdef NEPTUNE
                                                 4'h0, Port3_MaxReorderNumber,
                                                 4'h0, Port2_MaxReorderNumber,
                                              `else
                                                 16'h0,
                                              `endif
                                                 4'h0, Port1_MaxReorderNumber,
                                                 4'h0, Port0_MaxReorderNumber
                                                };

        `TXC_INT_SET_EVENT,
        `TXC_INT_CLR_EVENT:      pio_sl_data <= txcInterruptEvents;

        `TXC_INT_MASK:           pio_sl_data <= txcInterruptMask;

             default: pio_sl_data <= 32'h0;

      endcase


always @ (posedge SysClk)
  if (!Reset_L)
    begin
      Txc_Enabled  <= 1'b0;
      TrainingVector <= 32'h0;
      Debug_Select <= 6'b0;
      setIntEvent <= 1'b0;
      clrIntEvent <= 1'b0;
      Port0_Enabled <= 1'b0;
      Port0_MaxReorderNumber <= 4'HF;
      port0_txcInterruptMask <= 6'h3F;
      Port1_Enabled <= 1'b0;
      Port1_MaxReorderNumber <= 4'HF;
      port1_txcInterruptMask <= 6'h3F;

`ifdef NEPTUNE
      Port3_Enabled <= 1'b0;
      Port2_Enabled <= 1'b0;
      Port2_MaxReorderNumber <= 4'H7;
      Port3_MaxReorderNumber <= 4'H7;
      port2_txcInterruptMask <= 6'h3F;
      port3_txcInterruptMask <= 6'h3F;
`endif

    end
  else if (write_PIO_Register)
    begin
      case ({slaveAddrBuf1[11:2], 2'h0}) // synopsys parallel_case
                                     /* 0in < case -parallel */

        `TXC_CONTROL: begin        Txc_Enabled  <= SlaveDataInB0[4];
                              `ifdef NEPTUNE
                                   Port3_Enabled <= SlaveDataInB0[3];
                                   Port2_Enabled <= SlaveDataInB0[2];
                               `endif
                                   Port1_Enabled <= SlaveDataInB0[1];
                                   Port0_Enabled <= SlaveDataInB0[0];
                      end

        `TXC_TRAINING:            TrainingVector <= SlaveDataInB0;

        `TXC_DEBUG_SELECT:        Debug_Select <= SlaveDataInB0[5:0];

        `TXC_MAX_REORDER: begin
                              `ifdef NEPTUNE
                                 Port3_MaxReorderNumber <= SlaveDataInB0[27:24];
                                 Port2_MaxReorderNumber <= SlaveDataInB0[19:16];
                               `endif
                                 Port1_MaxReorderNumber <= SlaveDataInB0[11:8];
                                 Port0_MaxReorderNumber <= SlaveDataInB0[3:0];
                           end

        `TXC_INT_SET_EVENT:       setIntEvent <= 1'b1;
        `TXC_INT_CLR_EVENT:       clrIntEvent <= 1'b1;
        `TXC_INT_MASK: begin
                              `ifdef NEPTUNE
                                 port3_txcInterruptMask <= SlaveDataInB0[29:24];
                                 port2_txcInterruptMask <= SlaveDataInB0[21:16];
                               `endif
                                 port1_txcInterruptMask <= SlaveDataInB0[13:8];
                                 port0_txcInterruptMask <= SlaveDataInB0[5:0];
                       end

      endcase
    end
  else
    begin
      setIntEvent <= 1'b0;
      clrIntEvent <= 1'b0;
    end

endmodule
