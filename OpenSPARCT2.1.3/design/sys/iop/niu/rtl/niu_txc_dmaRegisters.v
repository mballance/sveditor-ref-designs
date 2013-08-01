// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_dmaRegisters.v
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
 *  niu_txc_dmaRegisters.v
 *
 *  NIU Transmit DMA Registers
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

module niu_txc_dmaRegisters (
        SysClk,
        Reset_L, 
        Read_DMA0_Register,
        Read_DMA1_Register,
        Read_DMA2_Register,
        Read_DMA3_Register,
        Write_DMA0_Register,
        Write_DMA1_Register,
        Write_DMA2_Register,
        Write_DMA3_Register,
        SlaveStrobe,
        SlaveAddr,
        SlaveDataIn,
        DMA_Slave_DataOut,

        Port0_ClrMaxBurst,
        Port0_UpdateDMA,
        Port0_DMA_List,
        Port0_UpdateDMANumber,
        Port0_UpdateDMALength,

        Port1_ClrMaxBurst,
        Port1_UpdateDMA,
        Port1_DMA_List,
        Port1_UpdateDMANumber,
        Port1_UpdateDMALength,
`ifdef NEPTUNE
        Port2_ClrMaxBurst,
        Port2_UpdateDMA,
        Port2_DMA_List,
        Port2_UpdateDMANumber,
        Port2_UpdateDMALength,

        Port3_ClrMaxBurst,
        Port3_UpdateDMA,
        Port3_DMA_List,
        Port3_UpdateDMANumber,
        Port3_UpdateDMALength,
`endif
        DMA0_NewMaxBurst,
        DMA0_MaxBurst,
        DMA1_NewMaxBurst,
        DMA1_MaxBurst,
        DMA2_NewMaxBurst,
        DMA2_MaxBurst,
        DMA3_NewMaxBurst,
        DMA3_MaxBurst
       );
    
// Include Header Files
`include "txc_defines.h"
`include "niu_txc_reg_defines.h"

// Global Signals
input          SysClk;
input          Reset_L;

// Slave Interface
input         Read_DMA0_Register;
input         Read_DMA1_Register;
input         Read_DMA2_Register;
input         Read_DMA3_Register;
input         Write_DMA0_Register;
input         Write_DMA1_Register;
input         Write_DMA2_Register;
input         Write_DMA3_Register;
input         SlaveStrobe;
input  [11:2] SlaveAddr;
input  [27:0] SlaveDataIn;

output [31:0] DMA_Slave_DataOut;

reg    [31:0] DMA_Slave_DataOut;

// DMA Port Signals
input         Port0_ClrMaxBurst;
input         Port0_UpdateDMA;
input  [3:0]  Port0_DMA_List;
input  [3:0]  Port0_UpdateDMANumber;
input  [13:0] Port0_UpdateDMALength;

input         Port1_ClrMaxBurst;
input         Port1_UpdateDMA;
input  [3:0]  Port1_DMA_List;
input  [3:0]  Port1_UpdateDMANumber;
input  [13:0] Port1_UpdateDMALength;

`ifdef NEPTUNE
input         Port2_ClrMaxBurst;
input         Port2_UpdateDMA;
input  [3:0]  Port2_DMA_List;
input  [3:0]  Port2_UpdateDMANumber;
input  [13:0] Port2_UpdateDMALength;

input         Port3_ClrMaxBurst;
input         Port3_UpdateDMA;
input  [3:0]  Port3_DMA_List;
input  [3:0]  Port3_UpdateDMANumber;
input  [13:0] Port3_UpdateDMALength;
`endif                    

// DMA Registers Grouped in Banks or Four
output        DMA0_NewMaxBurst;
output [19:0] DMA0_MaxBurst;

output        DMA1_NewMaxBurst;
output [19:0] DMA1_MaxBurst;

output        DMA2_NewMaxBurst;
output [19:0] DMA2_MaxBurst;

output        DMA3_NewMaxBurst;
output [19:0] DMA3_MaxBurst;

reg           DMA0_NewMaxBurst;
reg           DMA1_NewMaxBurst;
reg           DMA2_NewMaxBurst;
reg           DMA3_NewMaxBurst;
reg    [19:0] DMA0_MaxBurst;
reg    [19:0] DMA1_MaxBurst;
reg    [19:0] DMA2_MaxBurst;
reg    [19:0] DMA3_MaxBurst;

/*--------------------------------------------------------------*/
// Wires & Registers
/*--------------------------------------------------------------*/
wire           setNewMaxBurstDMA0;
wire           setNewMaxBurstDMA1;
wire           setNewMaxBurstDMA2;
wire           setNewMaxBurstDMA3;
wire           collisionDma0Update;
wire           collisionDma1Update;
wire           collisionDma2Update;
wire           collisionDma3Update;
wire           dma0Update;
wire           dma1Update;
wire           dma2Update;
wire           dma3Update;
wire           readDMAregister;
wire           writeDMAregister;
wire   [3:0]   dma0Select;
wire   [3:0]   dma1Select;
wire   [3:0]   dma2Select;
wire   [3:0]   dma3Select;
wire   [3:0]   readIndex;
wire   [3:0]   writeIndex;
wire   [13:0]  writeAddress;
wire   [13:0]  readAddress;

reg            clrNewMaxBurstDMA0;
reg            clrNewMaxBurstDMA1;
reg            clrNewMaxBurstDMA2;
reg            clrNewMaxBurstDMA3;
reg            updateDMA0Strobe;
reg            updateDMA1Strobe;
reg            updateDMA2Strobe;
reg            updateDMA3Strobe;
reg            dma0Valid;
reg            dma1Valid;
reg            dma2Valid;
reg            dma3Valid;
reg            wrDMA0_Length;
reg            wrDMA1_Length;
reg            wrDMA2_Length;
reg            wrDMA3_Length;
reg    [1:0]   dmaReadIndex;
reg    [1:0]   dmaWriteIndex;
reg    [13:0]  dma0LengthUpdate;
reg    [13:0]  dma1LengthUpdate;
reg    [13:0]  dma2LengthUpdate;
reg    [13:0]  dma3LengthUpdate;
reg    [27:0]  dma0_Length;
reg    [27:0]  dma1_Length;
reg    [27:0]  dma2_Length;
reg    [27:0]  dma3_Length;

/*--------------------------------------------------------------*/
// Parameters and Defines
/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/
// Zero In Checks
/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/
// TXC DMA 0-3 decodes
/*--------------------------------------------------------------*/
assign readDMAregister = (Read_DMA3_Register | Read_DMA2_Register
                          |
                          Read_DMA1_Register | Read_DMA0_Register
                         );

assign readIndex = {Read_DMA3_Register, Read_DMA2_Register,
                    Read_DMA1_Register, Read_DMA0_Register
                   };

assign readAddress = {dmaReadIndex, SlaveAddr[11:2], 2'h0};

always @(readIndex)
  begin
      case (readIndex) // synopsys parallel_case
                       /* 0in < case -parallel */

        4'h1:   dmaReadIndex = 2'h0;
        4'h2:   dmaReadIndex = 2'h1;
        4'h4:   dmaReadIndex = 2'h2;
        4'h8:   dmaReadIndex = 2'h3;
             default: dmaReadIndex = 2'hx;
      endcase
    end

assign writeDMAregister = (Write_DMA3_Register | Write_DMA2_Register
                           |
                           Write_DMA1_Register | Write_DMA0_Register
                          );

assign writeIndex = {Write_DMA3_Register, Write_DMA2_Register,
                     Write_DMA1_Register, Write_DMA0_Register
                    };

assign writeAddress = {dmaWriteIndex, SlaveAddr[11:2], 2'h0};

always @(writeIndex)
  begin
      case (writeIndex) // synopsys parallel_case
                       /* 0in < case -parallel */

        4'h1:   dmaWriteIndex = 2'h0;
        4'h2:   dmaWriteIndex = 2'h1;
        4'h4:   dmaWriteIndex = 2'h2;
        4'h8:   dmaWriteIndex = 2'h3;
             default: dmaWriteIndex = 2'hx;
      endcase
    end

/*--------------------------------------------------------------*/
// TXC DMA 0 PIO Read & Write Registers
/*--------------------------------------------------------------*/
`ifdef NEPTUNE
assign dma0Select = {Port3_DMA_List[0], Port2_DMA_List[0],
                     Port1_DMA_List[0], Port0_DMA_List[0]};
`else
assign dma0Select = {2'h0, Port1_DMA_List[0], Port0_DMA_List[0]};
`endif

`ifdef NEPTUNE
always @(dma0Select or Port3_ClrMaxBurst
         or Port2_ClrMaxBurst or Port1_ClrMaxBurst or Port0_ClrMaxBurst
        )
`else
always @(dma0Select or Port1_ClrMaxBurst or Port0_ClrMaxBurst)
`endif
  begin
  casex(dma0Select)  // Synopsys full_case parallel_case
     4'bxxx1:         clrNewMaxBurstDMA0 = Port0_ClrMaxBurst;
     4'bxx10:         clrNewMaxBurstDMA0 = Port1_ClrMaxBurst;
`ifdef NEPTUNE
     4'bx100:         clrNewMaxBurstDMA0 = Port2_ClrMaxBurst;
     4'b1000:         clrNewMaxBurstDMA0 = Port3_ClrMaxBurst;
`endif
           default: clrNewMaxBurstDMA0 = 1'b0;
  endcase
end

`ifdef NEPTUNE
always @(dma0Select or Port3_UpdateDMA
         or Port2_UpdateDMA or Port1_UpdateDMA or Port0_UpdateDMA
        )
`else
always @(dma0Select or Port1_UpdateDMA or Port0_UpdateDMA)
`endif
  begin
  casex(dma0Select)  // Synopsys full_case parallel_case
     4'bxxx1:         updateDMA0Strobe = Port0_UpdateDMA;
     4'bxx10:         updateDMA0Strobe = Port1_UpdateDMA;
`ifdef NEPTUNE
     4'bx100:         updateDMA0Strobe = Port2_UpdateDMA;
     4'b1000:         updateDMA0Strobe = Port3_UpdateDMA;
`endif
           default: updateDMA0Strobe = 1'b0;
  endcase
end

`ifdef NEPTUNE
always @(dma0Select or Port3_UpdateDMANumber
         or Port2_UpdateDMANumber or Port1_UpdateDMANumber
         or Port0_UpdateDMANumber
        )
`else
always @(dma0Select or Port1_UpdateDMANumber or Port0_UpdateDMANumber)
`endif
  begin
  casex(dma0Select)  // Synopsys full_case parallel_case
     4'bxxx1:         dma0Valid = Port0_UpdateDMANumber[0];
     4'bxx10:         dma0Valid = Port1_UpdateDMANumber[0];
`ifdef NEPTUNE
     4'bx100:         dma0Valid = Port2_UpdateDMANumber[0];
     4'b1000:         dma0Valid = Port3_UpdateDMANumber[0];
`endif
           default: dma0Valid = 1'b0;
  endcase
end

`ifdef NEPTUNE
always @(dma0Select or Port3_UpdateDMALength
         or Port2_UpdateDMALength or Port1_UpdateDMALength
         or Port0_UpdateDMALength
        )
`else
always @(dma0Select or Port1_UpdateDMALength or Port0_UpdateDMALength)
`endif
  begin
  casex(dma0Select)  // Synopsys full_case parallel_case
     4'bxxx1:         dma0LengthUpdate = Port0_UpdateDMALength;
     4'bxx10:         dma0LengthUpdate = Port1_UpdateDMALength;
`ifdef NEPTUNE
     4'bx100:         dma0LengthUpdate = Port2_UpdateDMALength;
     4'b1000:         dma0LengthUpdate = Port3_UpdateDMALength;
`endif
           default: dma0LengthUpdate = 14'h0;
  endcase
end

assign dma0Update = updateDMA0Strobe & dma0Valid;

assign collisionDma0Update = (dma0Update
                              &
                              (({SlaveAddr[11:2], 2'h0} == `DMA_LENGTH)
                                 &&
                                 Read_DMA0_Register && SlaveStrobe)
                             );

always @ (posedge SysClk)
  if (!Reset_L)
    dma0_Length <= 28'h0;
  else if (wrDMA0_Length)
    dma0_Length <= #`SD SlaveDataIn[27:0];
  else if (collisionDma0Update)
    dma0_Length <= #`SD {14'h0, dma0LengthUpdate};
  else if (dma0Update)
    dma0_Length <= #`SD ((dma0_Length + {14'h0, dma0LengthUpdate})
                          |
                          {dma0_Length[27], 27'h0}
                        );


assign setNewMaxBurstDMA0 = (({SlaveAddr[11:2], 2'h0} == `DMA_MAXBURST)
                             &&
                             Write_DMA0_Register && SlaveStrobe);

always @ (posedge SysClk)
  if (!Reset_L)                DMA0_NewMaxBurst <= 1'b0;
  else if (setNewMaxBurstDMA0) DMA0_NewMaxBurst <= 1'b1;
  else if (clrNewMaxBurstDMA0) DMA0_NewMaxBurst <= 1'b0;

/*--------------------------------------------------------------*/
// TXC DMA 1 PIO Read & Write Registers
/*--------------------------------------------------------------*/
`ifdef NEPTUNE
assign dma1Select = {Port3_DMA_List[1], Port2_DMA_List[1],
                     Port1_DMA_List[1], Port0_DMA_List[1]};
`else
assign dma1Select = {2'h0, Port1_DMA_List[1], Port0_DMA_List[1]};
`endif

`ifdef NEPTUNE
always @(dma1Select or Port3_ClrMaxBurst
         or Port2_ClrMaxBurst or Port1_ClrMaxBurst or Port0_ClrMaxBurst
        )
`else
always @(dma1Select or Port1_ClrMaxBurst or Port0_ClrMaxBurst)
`endif
  begin
  casex(dma1Select)  // Synopsys full_case parallel_case
     4'bxxx1:         clrNewMaxBurstDMA1 = Port0_ClrMaxBurst;
     4'bxx10:         clrNewMaxBurstDMA1 = Port1_ClrMaxBurst;
`ifdef NEPTUNE
     4'bx100:         clrNewMaxBurstDMA1 = Port2_ClrMaxBurst;
     4'b1000:         clrNewMaxBurstDMA1 = Port3_ClrMaxBurst;
`endif
           default: clrNewMaxBurstDMA1 = 1'b0;
  endcase
end

`ifdef NEPTUNE
always @(dma1Select or Port3_UpdateDMA
         or Port2_UpdateDMA or Port1_UpdateDMA or Port0_UpdateDMA
        )
`else
always @(dma1Select or Port1_UpdateDMA or Port0_UpdateDMA)
`endif
  begin
  casex(dma1Select)  // Synopsys full_case parallel_case
     4'bxxx1:         updateDMA1Strobe = Port0_UpdateDMA;
     4'bxx10:         updateDMA1Strobe = Port1_UpdateDMA;
`ifdef NEPTUNE
     4'bx100:         updateDMA1Strobe = Port2_UpdateDMA;
     4'b1000:         updateDMA1Strobe = Port3_UpdateDMA;
`endif
           default: updateDMA1Strobe = 1'b0;
  endcase
end

`ifdef NEPTUNE
always @(dma1Select or Port3_UpdateDMANumber
         or Port2_UpdateDMANumber or Port1_UpdateDMANumber
         or Port0_UpdateDMANumber
        )
`else
always @(dma1Select or Port1_UpdateDMANumber or Port0_UpdateDMANumber)
`endif
  begin
  casex(dma1Select)  // Synopsys full_case parallel_case
     4'bxxx1:         dma1Valid = Port0_UpdateDMANumber[1];
     4'bxx10:         dma1Valid = Port1_UpdateDMANumber[1];
`ifdef NEPTUNE
     4'bx100:         dma1Valid = Port2_UpdateDMANumber[1];
     4'b1000:         dma1Valid = Port3_UpdateDMANumber[1];
`endif
           default: dma1Valid = 1'b0;
  endcase
end

`ifdef NEPTUNE
always @(dma1Select or Port3_UpdateDMALength
         or Port2_UpdateDMALength or Port1_UpdateDMALength
         or Port0_UpdateDMALength
        )
`else
always @(dma1Select or Port1_UpdateDMALength or Port0_UpdateDMALength)
`endif
  begin
  casex(dma1Select)  // Synopsys full_case parallel_case
     4'bxxx1:         dma1LengthUpdate = Port0_UpdateDMALength;
     4'bxx10:         dma1LengthUpdate = Port1_UpdateDMALength;
`ifdef NEPTUNE
     4'bx100:         dma1LengthUpdate = Port2_UpdateDMALength;
     4'b1000:         dma1LengthUpdate = Port3_UpdateDMALength;
`endif
           default: dma1LengthUpdate = 14'h0;
  endcase
end


assign dma1Update = updateDMA1Strobe & dma1Valid;

assign collisionDma1Update = (dma1Update
                              &
                              (({SlaveAddr[11:2], 2'h0} == `DMA_LENGTH)
                                 &&
                                 Read_DMA1_Register && SlaveStrobe)
                             );

always @ (posedge SysClk)
  if (!Reset_L)
    dma1_Length <= 28'h0;
  else if (wrDMA1_Length)
    dma1_Length <= #`SD SlaveDataIn[27:0];
  else if (collisionDma1Update)
    dma1_Length <= #`SD {14'h0, dma1LengthUpdate};
  else if (dma1Update)
    dma1_Length <= #`SD ((dma1_Length + {14'h0, dma1LengthUpdate})
                          |
                          {dma1_Length[27], 27'h0}
                        );


assign setNewMaxBurstDMA1 = (({SlaveAddr[11:2], 2'h0} == `DMA_MAXBURST)
                             &&
                             Write_DMA1_Register && SlaveStrobe);

always @ (posedge SysClk)
  if (!Reset_L)                DMA1_NewMaxBurst <= 1'b0;
  else if (setNewMaxBurstDMA1) DMA1_NewMaxBurst <= 1'b1;
  else if (clrNewMaxBurstDMA1) DMA1_NewMaxBurst <= 1'b0;

/*--------------------------------------------------------------*/
// TXC DMA 2 PIO Read & Write Registers
/*--------------------------------------------------------------*/
`ifdef NEPTUNE
assign dma2Select = {Port3_DMA_List[2], Port2_DMA_List[2],
                     Port1_DMA_List[2], Port0_DMA_List[2]};
`else
assign dma2Select = {2'h0, Port1_DMA_List[2], Port0_DMA_List[2]};
`endif

`ifdef NEPTUNE
always @(dma2Select or Port3_ClrMaxBurst
         or Port2_ClrMaxBurst or Port1_ClrMaxBurst or Port0_ClrMaxBurst
        )
`else
always @(dma2Select or Port1_ClrMaxBurst or Port0_ClrMaxBurst)
`endif
  begin
  casex(dma2Select)  // Synopsys full_case parallel_case
     4'bxxx1:         clrNewMaxBurstDMA2 = Port0_ClrMaxBurst;
     4'bxx10:         clrNewMaxBurstDMA2 = Port1_ClrMaxBurst;
`ifdef NEPTUNE
     4'bx100:         clrNewMaxBurstDMA2 = Port2_ClrMaxBurst;
     4'b1000:         clrNewMaxBurstDMA2 = Port3_ClrMaxBurst;
`endif
           default: clrNewMaxBurstDMA2 = 1'b0;
  endcase
end

`ifdef NEPTUNE
always @(dma2Select or Port3_UpdateDMA
         or Port2_UpdateDMA or Port1_UpdateDMA or Port0_UpdateDMA
        )
`else
always @(dma2Select or Port1_UpdateDMA or Port0_UpdateDMA)
`endif
  begin
  casex(dma2Select)  // Synopsys full_case parallel_case
     4'bxxx1:         updateDMA2Strobe = Port0_UpdateDMA;
     4'bxx10:         updateDMA2Strobe = Port1_UpdateDMA;
`ifdef NEPTUNE
     4'bx100:         updateDMA2Strobe = Port2_UpdateDMA;
     4'b1000:         updateDMA2Strobe = Port3_UpdateDMA;
`endif
           default: updateDMA2Strobe = 1'b0;
  endcase
end

`ifdef NEPTUNE
always @(dma2Select or Port3_UpdateDMANumber
         or Port2_UpdateDMANumber or Port1_UpdateDMANumber
         or Port0_UpdateDMANumber
        )
`else
always @(dma2Select or Port1_UpdateDMANumber or Port0_UpdateDMANumber)
`endif
  begin
  casex(dma2Select)  // Synopsys full_case parallel_case
     4'bxxx1:         dma2Valid = Port0_UpdateDMANumber[2];
     4'bxx10:         dma2Valid = Port1_UpdateDMANumber[2];
`ifdef NEPTUNE
     4'bx100:         dma2Valid = Port2_UpdateDMANumber[2];
     4'b1000:         dma2Valid = Port3_UpdateDMANumber[2];
`endif
           default: dma2Valid = 1'b0;
  endcase
end

`ifdef NEPTUNE
always @(dma2Select or Port3_UpdateDMALength
         or Port2_UpdateDMALength or Port1_UpdateDMALength
         or Port0_UpdateDMALength
        )
`else
always @(dma2Select or Port1_UpdateDMALength or Port0_UpdateDMALength)
`endif
  begin
  casex(dma2Select)  // Synopsys full_case parallel_case
     4'bxxx1:         dma2LengthUpdate = Port0_UpdateDMALength;
     4'bxx10:         dma2LengthUpdate = Port1_UpdateDMALength;
`ifdef NEPTUNE
     4'bx100:         dma2LengthUpdate = Port2_UpdateDMALength;
     4'b1000:         dma2LengthUpdate = Port3_UpdateDMALength;
`endif
           default: dma2LengthUpdate = 14'h0;
  endcase
end


assign dma2Update = updateDMA2Strobe & dma2Valid;

assign collisionDma2Update = (dma2Update
                              &
                              (({SlaveAddr[11:2], 2'h0} == `DMA_LENGTH)
                                 &&
                                 Read_DMA2_Register && SlaveStrobe)
                             );

always @ (posedge SysClk)
  if (!Reset_L)
    dma2_Length <= 28'h0;
  else if (wrDMA2_Length)
    dma2_Length <= #`SD SlaveDataIn[27:0];
  else if (collisionDma2Update)
    dma2_Length <= #`SD {14'h0, dma2LengthUpdate};
  else if (dma2Update)
    dma2_Length <= #`SD ((dma2_Length + {14'h0, dma2LengthUpdate})
                          |
                          {dma2_Length[27], 27'h0}
                        );


assign setNewMaxBurstDMA2 = (({SlaveAddr[11:2], 2'h0} == `DMA_MAXBURST)
                             &&
                             Write_DMA2_Register && SlaveStrobe);

always @ (posedge SysClk)
  if (!Reset_L)                DMA2_NewMaxBurst <= 1'b0;
  else if (setNewMaxBurstDMA2) DMA2_NewMaxBurst <= 1'b1;
  else if (clrNewMaxBurstDMA2) DMA2_NewMaxBurst <= 1'b0;

/*--------------------------------------------------------------*/
// TXC DMA 3 PIO Read & Write Registers
/*--------------------------------------------------------------*/
`ifdef NEPTUNE
assign dma3Select = {Port3_DMA_List[3], Port2_DMA_List[3],
                     Port1_DMA_List[3], Port0_DMA_List[3]};
`else
assign dma3Select = {2'h0, Port1_DMA_List[3], Port0_DMA_List[3]};
`endif

`ifdef NEPTUNE
always @(dma3Select or Port3_ClrMaxBurst
         or Port2_ClrMaxBurst or Port1_ClrMaxBurst or Port0_ClrMaxBurst
        )
`else
always @(dma3Select or Port1_ClrMaxBurst or Port0_ClrMaxBurst)
`endif
  begin
  casex(dma3Select)  // Synopsys full_case parallel_case
     4'bxxx1:         clrNewMaxBurstDMA3 = Port0_ClrMaxBurst;
     4'bxx10:         clrNewMaxBurstDMA3 = Port1_ClrMaxBurst;
`ifdef NEPTUNE
     4'bx100:         clrNewMaxBurstDMA3 = Port2_ClrMaxBurst;
     4'b1000:         clrNewMaxBurstDMA3 = Port3_ClrMaxBurst;
`endif
           default: clrNewMaxBurstDMA3 = 1'b0;
  endcase
end

`ifdef NEPTUNE
always @(dma3Select or Port3_UpdateDMA
         or Port2_UpdateDMA or Port1_UpdateDMA or Port0_UpdateDMA
        )
`else
always @(dma3Select or Port1_UpdateDMA or Port0_UpdateDMA)
`endif
  begin
  casex(dma3Select)  // Synopsys full_case parallel_case
     4'bxxx1:         updateDMA3Strobe = Port0_UpdateDMA;
     4'bxx10:         updateDMA3Strobe = Port1_UpdateDMA;
`ifdef NEPTUNE
     4'bx100:         updateDMA3Strobe = Port2_UpdateDMA;
     4'b1000:         updateDMA3Strobe = Port3_UpdateDMA;
`endif
           default: updateDMA3Strobe = 1'b0;
  endcase
end

`ifdef NEPTUNE
always @(dma3Select or Port3_UpdateDMANumber
         or Port2_UpdateDMANumber or Port1_UpdateDMANumber
         or Port0_UpdateDMANumber
        )
`else
always @(dma3Select or Port1_UpdateDMANumber or Port0_UpdateDMANumber)
`endif
  begin
  casex(dma3Select)  // Synopsys full_case parallel_case
     4'bxxx1:         dma3Valid = Port0_UpdateDMANumber[3];
     4'bxx10:         dma3Valid = Port1_UpdateDMANumber[3];
`ifdef NEPTUNE
     4'bx100:         dma3Valid = Port2_UpdateDMANumber[3];
     4'b1000:         dma3Valid = Port3_UpdateDMANumber[3];
`endif
           default: dma3Valid = 1'b0;
  endcase
end

`ifdef NEPTUNE
always @(dma3Select or Port3_UpdateDMALength
         or Port2_UpdateDMALength or Port1_UpdateDMALength
         or Port0_UpdateDMALength
        )
`else
always @(dma3Select or Port1_UpdateDMALength or Port0_UpdateDMALength)
`endif
  begin
  casex(dma3Select)  // Synopsys full_case parallel_case
     4'bxxx1:         dma3LengthUpdate = Port0_UpdateDMALength;
     4'bxx10:         dma3LengthUpdate = Port1_UpdateDMALength;
`ifdef NEPTUNE
     4'bx100:         dma3LengthUpdate = Port2_UpdateDMALength;
     4'b1000:         dma3LengthUpdate = Port3_UpdateDMALength;
`endif
           default: dma3LengthUpdate = 14'h0;
  endcase
end


assign dma3Update = updateDMA3Strobe & dma3Valid;

assign collisionDma3Update = (dma3Update
                              &
                              (({SlaveAddr[11:2], 2'h0} == `DMA_LENGTH)
                                 &&
                                 Read_DMA3_Register && SlaveStrobe)
                             );

always @ (posedge SysClk)
  if (!Reset_L)
    dma3_Length <= 28'h0;
  else if (wrDMA3_Length)
    dma3_Length <= #`SD SlaveDataIn[27:0];
  else if (collisionDma3Update)
    dma3_Length <= #`SD {14'h0, dma3LengthUpdate};
  else if (dma3Update)
    dma3_Length <= #`SD ((dma3_Length + {14'h0, dma3LengthUpdate})
                          |
                          {dma3_Length[27], 27'h0}
                        );


assign setNewMaxBurstDMA3 = (({SlaveAddr[11:2], 2'h0} == `DMA_MAXBURST)
                             &&
                             Write_DMA3_Register && SlaveStrobe);

always @ (posedge SysClk)
  if (!Reset_L)                DMA3_NewMaxBurst <= 1'b0;
  else if (setNewMaxBurstDMA3) DMA3_NewMaxBurst <= 1'b1;
  else if (clrNewMaxBurstDMA3) DMA3_NewMaxBurst <= 1'b0;

/*--------------------------------------------------------------*/
// TXC DMA 0-3 PIO Read & Write Registers
/*--------------------------------------------------------------*/
always @ (posedge SysClk)
  if (!Reset_L)
    DMA_Slave_DataOut <= 32'h0;
  else if (readDMAregister)
    begin
      case (readAddress) // synopsys parallel_case
                         /* 0in < case -parallel */

        `DMA_0_MAXBURST:   DMA_Slave_DataOut <= {12'h0, DMA0_MaxBurst};
        `DMA_0_LENGTH:     DMA_Slave_DataOut <= {4'h0, dma0_Length};
        `DMA_1_MAXBURST:   DMA_Slave_DataOut <= {12'h0, DMA1_MaxBurst};
        `DMA_1_LENGTH:     DMA_Slave_DataOut <= {4'h0, dma1_Length};
        `DMA_2_MAXBURST:   DMA_Slave_DataOut <= {12'h0, DMA2_MaxBurst};
        `DMA_2_LENGTH:     DMA_Slave_DataOut <= {4'h0, dma2_Length};
        `DMA_3_MAXBURST:   DMA_Slave_DataOut <= {12'h0, DMA3_MaxBurst};
        `DMA_3_LENGTH:     DMA_Slave_DataOut <= {4'h0, dma3_Length};
             default: DMA_Slave_DataOut <= 32'h0;
      endcase
    end
  else
                DMA_Slave_DataOut <= 32'h0;


always @ (posedge SysClk)
  if (!Reset_L)
    begin
      DMA0_MaxBurst <= 20'h0;
      wrDMA0_Length <= 1'b0;
      DMA1_MaxBurst <= 20'h0;
      wrDMA1_Length <= 1'b0;
      DMA2_MaxBurst <= 20'h0;
      wrDMA2_Length <= 1'b0;
      DMA3_MaxBurst <= 20'h0;
      wrDMA3_Length <= 1'b0;
    end
  else if (writeDMAregister)
   begin
      case (writeAddress) // synopsys parallel_case
                         /* 0in < case -parallel */

        `DMA_0_MAXBURST:  DMA0_MaxBurst <= SlaveDataIn[19:0];
        `DMA_0_LENGTH:    wrDMA0_Length <= 1'b1; 
        `DMA_1_MAXBURST:  DMA1_MaxBurst <= SlaveDataIn[19:0];
        `DMA_1_LENGTH:    wrDMA1_Length <= 1'b1; 
        `DMA_2_MAXBURST:  DMA2_MaxBurst <= SlaveDataIn[19:0];
        `DMA_2_LENGTH:    wrDMA2_Length <= 1'b1; 
        `DMA_3_MAXBURST:  DMA3_MaxBurst <= SlaveDataIn[19:0];
        `DMA_3_LENGTH:    wrDMA3_Length <= 1'b1; 

      endcase
    end
  else
    begin
      wrDMA0_Length <= 1'b0;
      wrDMA1_Length <= 1'b0;
      wrDMA2_Length <= 1'b0;
      wrDMA3_Length <= 1'b0;
    end

/*--------------------------------------------------------------*/
// End PIO Read & Write
/*--------------------------------------------------------------*/

endmodule
