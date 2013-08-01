// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_mac_transfer.v
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
 *  niu_txc_mac_transfer.v
 *
 *  MAC_ Transfer State Machine
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

module niu_txc_mac_transfer (
        SysClk,              // Clock
        Reset_L,             // Reset_L
        Txc_Enabled,         // NTx Enable
        EnableGMACMode,      // Enable GMAC Mode only

        DisableEccCheking,
        UnCorrectError,
        FifoEmpty,           // Fifo empty signal from the fifo
        FifoDataOut,         // Data word from the Fifo
        FifoRead,            // Fifo read signal

        ClearStatistics,     // Clear All Statistics
        WrPacketXmitted,
        PioDataIn,
        PacketsTransmitted,  // Number of packets transmitted
        BytesTransmitted,    // Number of bytes in the packet transmitted

        MAC_Req,             // Data request from the MAC
        MAC_Ack,             // Ack signal to MAC
        MAC_Tag,             // Tag signal to MAC
        MAC_Abort,           // Abort signal to MAC
        MAC_Status,          // Status to MAC
        MAC_Data,            // Data request from the MAC
        Mac_Xfer_State
       );

`include "txc_defines.h"

// Global signals
input         SysClk;
input         Reset_L;
input         Txc_Enabled;
input         EnableGMACMode;

// Control Reg Interface
input         DisableEccCheking;

// Fifo Interface
input         UnCorrectError;
input         FifoEmpty;
input [135:0] FifoDataOut;

output        FifoRead;

reg           FifoRead;

// Control Register Interface
input         ClearStatistics;
input         WrPacketXmitted;
input [31:0]  PioDataIn;

output [15:0] PacketsTransmitted;
output [15:0] BytesTransmitted;

reg    [15:0] PacketsTransmitted;
reg    [15:0] BytesTransmitted;

// MAC Interface
input         MAC_Req;

output        MAC_Ack;
output        MAC_Tag;
output        MAC_Abort;
output [3:0]  MAC_Status;
output [63:0] MAC_Data;

reg           MAC_Ack;
reg           MAC_Tag;
reg           MAC_Abort;
reg    [3:0]  MAC_Status;
reg    [63:0] MAC_Data;

// MAC Interface
output [3:0]  Mac_Xfer_State;

reg    [3:0]  Mac_Xfer_State;

/*--------------------------------------------------------------*/
// Reg & Wires
/*--------------------------------------------------------------*/
wire        lastLineOfPacket;
wire        packetEndsOnLowBits;
wire        par_error;
wire        abortPacket;
wire        collisionXmit;
wire        collisionBytes;
wire [3:0]  straddleBytesOne;
wire [3:0]  straddleBytesTwo;
wire [63:0] gigMACStatus; 

reg         packetEndsOnHighBits;
reg         latchedAbort;
reg         parityError;
reg         fifoWasEmpty;
reg         detectedFifoEmpty;
reg         macAck;
reg         macTag;
reg         macAbort;
reg         ldFifoDataOut;
reg         clearAllState;
reg         setFifoWasEmpty;
reg         clrFifoWasEmpty;
reg         setDetectedFifoEmpty;
reg         clrDetectedFifoEmpty;
reg         incPacketsTransmitted;
reg         addEightBytes;
reg         addStraddleOne;
reg         addStraddleTwo;
reg         ldStatus;
reg         ldLatchedStatus;
reg         ldFifoHBits;
reg         ldGigMACStatus;
reg  [3:0]  nextXferState;
reg  [3:0]  latchedStatus;
reg  [63:0] fifoHBits; 

/*--------------------------------------------------------------*/
// Parameters and Defines
/*--------------------------------------------------------------*/
parameter  MAC_XFER_IDLE            = 4'h0,
           CHECK_FIFO               = 4'h1,
           XFER_LOW_BITS_0          = 4'h2,
           XFER_HIGH_BITS_0         = 4'h3,
           XFER_LOW_BITS_1          = 4'h4,
           XFER_HIGH_BITS_1         = 4'h5,
           WAIT_FOR_NO_REQ          = 4'h6,
           CHECK_FOR_BURST_REQ      = 4'h7,
           CHECK_FOR_REQ            = 4'h8,
           XFER_STATUS              = 4'h9,
           WAIT_FOR_REQ_LOW         = 4'hA, 
           WAIT_FOR_COUNT_DEC       = 4'hB, 
           WAIT_FOR_FIFO            = 4'hF;

//VCS coverage off
// synopsys translate_off
reg [192:1] TRANSFER_STATE;


always @(Mac_Xfer_State)
begin
  case(Mac_Xfer_State)
    MAC_XFER_IDLE :               TRANSFER_STATE = "MAC_XFER_IDLE";
    CHECK_FIFO:                   TRANSFER_STATE = "CHECK_FIFO";
    XFER_LOW_BITS_0:              TRANSFER_STATE = "XFER_LOW_BITS_0";
    XFER_HIGH_BITS_0:             TRANSFER_STATE = "XFER_HIGH_BITS_0";
    XFER_LOW_BITS_1:              TRANSFER_STATE = "XFER_LOW_BITS_1";
    XFER_HIGH_BITS_1:             TRANSFER_STATE = "XFER_HIGH_BITS_1";
    WAIT_FOR_NO_REQ:              TRANSFER_STATE = "WAIT_FOR_NO_REQ";
    CHECK_FOR_BURST_REQ:          TRANSFER_STATE = "CHECK_FOR_BURST_REQ";
    CHECK_FOR_REQ:                TRANSFER_STATE = "CHECK_FOR_REQ";
    XFER_STATUS:                  TRANSFER_STATE = "XFER_STATUS";
    WAIT_FOR_REQ_LOW:             TRANSFER_STATE = "WAIT_FOR_REQ_LOW";
    WAIT_FOR_COUNT_DEC:           TRANSFER_STATE = "WAIT_FOR_COUNT_DEC";
    WAIT_FOR_FIFO:                TRANSFER_STATE = "WAIT_FOR_FIFO";
       default :    TRANSFER_STATE = "UNKNOWN";
  endcase
end

// synopsys translate_on
//VCS coverage on


/*--------------------------------------------------------------*/
// Zero In Checks
/*--------------------------------------------------------------*/

/*--------------------------------------------------------------*/
// Assigns
/*--------------------------------------------------------------*/
assign lastLineOfPacket    = (FifoDataOut[128] | FifoDataOut[135]);
assign packetEndsOnLowBits = FifoDataOut[134];

assign gigMACStatus = {(latchedAbort | parityError), latchedStatus, 59'h0};

assign abortPacket = (parityError | par_error);

/*--------------------------------------------------------------*/
// Parity Check on Incoming Data
/*--------------------------------------------------------------*/
assign par_error = (UnCorrectError & ~DisableEccCheking);

/*--------------------------------------------------------------*/
// Straddle Bytes
/*--------------------------------------------------------------*/
assign straddleBytesOne = ({1'b0,FifoDataOut[132:130]} + 4'h1);
assign straddleBytesTwo = ({1'b0,latchedStatus[2:0]} + 4'h1);

/*--------------------------------------------------------------*/
// Control Logic
/*--------------------------------------------------------------*/
assign collisionXmit  = ClearStatistics & incPacketsTransmitted;
assign collisionBytes = (ClearStatistics & (addEightBytes
                                            |
                                            addStraddleOne
                                            |
                                            addStraddleTwo
                                           )
                        );

always @ (posedge SysClk)
  if (!Reset_L)                   PacketsTransmitted <= 16'b0;
  else if (collisionXmit)         PacketsTransmitted <= #`SD 16'h1;
  else if (ClearStatistics)       PacketsTransmitted <= #`SD 16'h0;
  else if (WrPacketXmitted)       PacketsTransmitted <= #`SD PioDataIn[15:0];
  else if (incPacketsTransmitted) PacketsTransmitted <= #`SD PacketsTransmitted
                                                             +
                                                             16'b1;

always @ (posedge SysClk)
  if (!Reset_L)           parityError <= 1'b0;
  else if (ldFifoDataOut) parityError <= #`SD parityError | par_error;
  else if (clearAllState) parityError <= #`SD 1'b0;

always @ (posedge SysClk)
  if (!Reset_L)             fifoWasEmpty <= 1'b0;
  else if (setFifoWasEmpty) fifoWasEmpty <= #`SD 1'b1;
  else if (clrFifoWasEmpty) fifoWasEmpty <= #`SD 1'b0;

always @ (posedge SysClk)
  if (!Reset_L)                  detectedFifoEmpty <= 1'b0;
  else if (setDetectedFifoEmpty) detectedFifoEmpty <= #`SD 1'b1;
  else if (clrDetectedFifoEmpty) detectedFifoEmpty <= #`SD 1'b0;

always @ (posedge SysClk)
  if (!Reset_L)             BytesTransmitted <= 16'b0;
  else if (collisionBytes)
    begin
      if (addEightBytes)       BytesTransmitted <= #`SD 16'd8;
      else if (addStraddleOne) BytesTransmitted <= #`SD {12'h0,
                                                         straddleBytesOne};

      else if (addStraddleTwo) BytesTransmitted <= #`SD {12'h0,
                                                         straddleBytesTwo};
    end
  else if (ClearStatistics) BytesTransmitted <= #`SD 16'h0;
  else if (WrPacketXmitted) BytesTransmitted <= #`SD PioDataIn[31:16];
  else if (addEightBytes)   BytesTransmitted <= #`SD BytesTransmitted + 16'd8;
  else if (addStraddleOne)  BytesTransmitted <= #`SD BytesTransmitted
                                                     +
                                                     {12'h0, straddleBytesOne};

  else if (addStraddleTwo)  BytesTransmitted <= #`SD BytesTransmitted
                                                     +
                                                     {12'h0, straddleBytesTwo};

always @ (posedge SysClk)
  if (!Reset_L)           packetEndsOnHighBits <= 1'b0;
  else if (ldFifoDataOut) packetEndsOnHighBits <= #`SD lastLineOfPacket;
  else if (clearAllState) packetEndsOnHighBits <= #`SD 1'b0;

always @ (posedge SysClk)
  if (!Reset_L)           latchedAbort <= #`SD 1'b0;
  else if (ldFifoDataOut) latchedAbort <= #`SD FifoDataOut[129];
  else if (clearAllState) latchedAbort <= #`SD 1'b0;

always @ (posedge SysClk)
  if (!Reset_L)           latchedStatus <= #`SD 4'h0;
  else if (ldFifoDataOut) latchedStatus <= #`SD FifoDataOut[133:130];
  else if (clearAllState) latchedStatus <= #`SD 4'h0;

always @ (posedge SysClk)
  if (!Reset_L)           fifoHBits <= #`SD 64'h0;
  else if (ldFifoDataOut) fifoHBits <= #`SD FifoDataOut[127:64]; 
  else if (clearAllState) fifoHBits <= #`SD 64'b0;

/*--------------------------------------------------------------*/
// MAC Transfer Interface Logic
/*--------------------------------------------------------------*/
always @ (posedge SysClk)
  if (!Reset_L) MAC_Ack <= 1'b0;
  else          MAC_Ack <= #`SD macAck;

always @ (posedge SysClk)
  if (!Reset_L) MAC_Tag <= 1'b0;
  else          MAC_Tag <= #`SD macTag;

always @ (posedge SysClk)
  if (!Reset_L) MAC_Abort <= 1'b0;
  else          MAC_Abort <= #`SD macAbort;

always @ (posedge SysClk)
  if (!Reset_L)             MAC_Status <= #`SD 4'h0;
  else if (ldStatus)        MAC_Status <= #`SD FifoDataOut[133:130];
  else if (ldLatchedStatus) MAC_Status <= #`SD latchedStatus;
  else if (clearAllState)   MAC_Status <= #`SD 4'h0;

always @ (posedge SysClk)
  if (!Reset_L)            MAC_Data <= #`SD 64'h0;
  else if (ldFifoDataOut)  MAC_Data <= #`SD FifoDataOut[63:0]; 
  else if (ldFifoHBits)    MAC_Data <= #`SD fifoHBits; 
  else if (ldGigMACStatus) MAC_Data <= #`SD gigMACStatus;
  else if (clearAllState)  MAC_Data <= 64'h0;

/*--------------------------------------------------------------*/
// Mac Xfer State Vectors
/*--------------------------------------------------------------*/
always @(posedge SysClk)
  if (!Reset_L) Mac_Xfer_State <= #`SD MAC_XFER_IDLE;
  else          Mac_Xfer_State <= #`SD nextXferState;

/*--------------------------------------------------------------*/
// MAC_ Transfer State Machine
/*--------------------------------------------------------------*/
function [3:0] XferDefaults;
input [3:0] currentState;
  begin
    XferDefaults = currentState;
    FifoRead = 1'b0;
    macAck = 1'b0;
    macTag = 1'b0;
    macAbort = 1'b0;
    ldFifoDataOut = 1'b0;
    clearAllState = 1'b0;
    setFifoWasEmpty = 1'b0;
    clrFifoWasEmpty = 1'b0;
    setDetectedFifoEmpty = 1'b0;
    clrDetectedFifoEmpty = 1'b0;
    incPacketsTransmitted = 1'b0;
    addEightBytes = 1'b0;
    addStraddleOne = 1'b0;
    addStraddleTwo = 1'b0;
    ldStatus = 1'b0;
    ldLatchedStatus  = 1'b0;
    ldFifoHBits = 1'b0;
    ldGigMACStatus = 1'b0;
  end
endfunction


always @(/*AUTOSENSE*/Mac_Xfer_State or Txc_Enabled
         or MAC_Req or FifoEmpty or EnableGMACMode
         or lastLineOfPacket or packetEndsOnLowBits
         or FifoDataOut or abortPacket
         or packetEndsOnHighBits or detectedFifoEmpty
         or fifoWasEmpty or parityError
         or latchedAbort or MAC_Abort
        )
    begin
      case(Mac_Xfer_State) // synopsys full_case parallel_case
                           /* 0in < case -full -parallel */
        MAC_XFER_IDLE:
          begin
            nextXferState = XferDefaults(Mac_Xfer_State);

            if (Txc_Enabled)
              begin
                if (MAC_Req)
                  begin
                    if (~FifoEmpty)
                      begin
                        FifoRead = 1'b1;
                        nextXferState = CHECK_FIFO;
                      end
                  end
              end
          end


        CHECK_FIFO:
          begin
            nextXferState = XferDefaults(Mac_Xfer_State);

            if (MAC_Req | EnableGMACMode)
              begin
                if (~FifoEmpty | lastLineOfPacket)
                  nextXferState = XFER_LOW_BITS_0;
              end
           end

        XFER_LOW_BITS_0:
          begin
            nextXferState = XferDefaults(Mac_Xfer_State);
            ldFifoDataOut = 1'b1;

            if (MAC_Req | EnableGMACMode)
              begin
                macAck = 1'b1; 

                if (lastLineOfPacket & packetEndsOnLowBits)
                  begin         
                    macAbort = (FifoDataOut[129] | abortPacket);
                    ldStatus = 1'b1;
                    macTag   = 1'b1;
                    incPacketsTransmitted = 1'b1;
                    addStraddleOne = 1'b1;

                    if (EnableGMACMode)
                      nextXferState = XFER_STATUS;
                    else
                      nextXferState = WAIT_FOR_COUNT_DEC;
                  end         
                else
                  begin
                    nextXferState = XFER_HIGH_BITS_0;
                    addEightBytes = 1'b1;
                  end

                if (~lastLineOfPacket)
                  begin
                    if (FifoEmpty)
                      setDetectedFifoEmpty = 1'b1;
                    else
                      FifoRead = 1'b1;
                  end
              end
          end


        XFER_HIGH_BITS_0:
          begin
            nextXferState = XferDefaults(Mac_Xfer_State);

            if (MAC_Req | EnableGMACMode)
              begin
                macAck = 1'b1; 
                ldFifoHBits = 1'b1;

                if (packetEndsOnHighBits) 
                  begin 
                    macTag   = 1'b1;
                    macAbort = (latchedAbort | parityError);
                    ldLatchedStatus  = 1'b1;
                    incPacketsTransmitted = 1'b1;
                    addStraddleTwo = 1'b1;

                    if (EnableGMACMode)
                      nextXferState = XFER_STATUS;
                    else
                      nextXferState = WAIT_FOR_COUNT_DEC;
                  end 
                else // if (!packetEndsOnHighBits)
                  begin
                    if (EnableGMACMode)
                      nextXferState = XFER_LOW_BITS_1;
                    else if (detectedFifoEmpty)
                      nextXferState = WAIT_FOR_FIFO;
                    else 
                    //else if (~FifoEmpty)
                      nextXferState = XFER_LOW_BITS_0;
                    //else 
                    //  nextXferState = CHECK_FIFO;

                    addEightBytes = 1'b1;
                  end
              end 
          end


        XFER_LOW_BITS_1:
          begin
            nextXferState = XferDefaults(Mac_Xfer_State);
            macAck = 1'b1; 
            ldFifoDataOut = 1'b1;

            if (~lastLineOfPacket)
              begin
                if (~FifoEmpty)
                  FifoRead = 1'b1;
                else
                  setFifoWasEmpty = 1'b1;
              end

            if (lastLineOfPacket & packetEndsOnLowBits)
              begin         
                macTag   = 1'b1;
                incPacketsTransmitted = 1'b1;
                addStraddleOne = 1'b1;
                nextXferState = XFER_STATUS;
              end         
            else
              begin
                nextXferState = XFER_HIGH_BITS_1;
                addEightBytes = 1'b1;
              end
          end


        XFER_HIGH_BITS_1:
          begin
            nextXferState = XferDefaults(Mac_Xfer_State);
            macAck = 1'b1; 
            ldFifoHBits = 1'b1;
            nextXferState = WAIT_FOR_NO_REQ;
 
            if (fifoWasEmpty & ~FifoEmpty)
              begin
                FifoRead = 1'b1;
                clrFifoWasEmpty = 1'b1;
              end

            if (packetEndsOnHighBits)
              begin 
                macTag   = 1'b1;
                incPacketsTransmitted = 1'b1;
                addStraddleTwo = 1'b1;
              end 
            else
              addEightBytes = 1'b1;
          end


        WAIT_FOR_NO_REQ:
          begin
            nextXferState = XferDefaults(Mac_Xfer_State);

            if (fifoWasEmpty & ~FifoEmpty)
              begin
                FifoRead = 1'b1;
                clrFifoWasEmpty = 1'b0;
              end

            if (!MAC_Req)
              begin
                if (packetEndsOnHighBits)
                  nextXferState = CHECK_FOR_REQ;
                else
                  nextXferState = CHECK_FOR_BURST_REQ;
              end
          end


        CHECK_FOR_BURST_REQ:
          begin
            nextXferState = XferDefaults(Mac_Xfer_State);

            if (MAC_Req)
              begin
                if (fifoWasEmpty)
                  begin
                    if (~FifoEmpty)
                      begin
                        FifoRead = 1'b1;
                        clrFifoWasEmpty = 1'b1;
                        nextXferState = CHECK_FIFO;
                      end
                  end
                else if (~FifoEmpty | lastLineOfPacket)
                  nextXferState = XFER_LOW_BITS_0;
              end
          end


        CHECK_FOR_REQ:
          begin
            nextXferState = XferDefaults(Mac_Xfer_State);

            if (MAC_Req)
              nextXferState = XFER_STATUS;
          end


        XFER_STATUS:
          begin
            nextXferState = XferDefaults(Mac_Xfer_State);
            macAck = 1'b1; 
            macTag   = 1'b1;
            macAbort = MAC_Abort; // Don't know if need this
            ldGigMACStatus = 1'b1;
            nextXferState = WAIT_FOR_REQ_LOW;
          end


        WAIT_FOR_REQ_LOW:
          begin
            nextXferState = XferDefaults(Mac_Xfer_State);
            clearAllState = 1'b1;

            if (!MAC_Req)
              nextXferState = MAC_XFER_IDLE;
          end


        WAIT_FOR_COUNT_DEC:
          begin
            nextXferState = XferDefaults(Mac_Xfer_State);
            clearAllState = 1'b1;
            nextXferState = MAC_XFER_IDLE;
          end


        WAIT_FOR_FIFO:
          begin
            nextXferState = XferDefaults(Mac_Xfer_State);
            clrDetectedFifoEmpty = 1'b1;

            if (MAC_Req)
              begin
                if (~FifoEmpty)
                  begin
                    FifoRead = 1'b1;   
                    nextXferState = CHECK_FIFO;
                  end
              end
          end

      endcase
    end

endmodule
