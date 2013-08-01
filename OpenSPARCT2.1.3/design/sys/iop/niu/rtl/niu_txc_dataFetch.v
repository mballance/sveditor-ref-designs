// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_dataFetch.v
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
 *  niu_txc_dataFetch.v
 *
 *  TXC Data Fetch
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

module niu_txc_dataFetch (
        SysClk,
        Reset_L, 
        Txc_Enabled, 

        DMC_TXC_Tx_Addr_Md,

        DMC_TXC_Req_Ack,
        TXC_DMC_Req,
        TXC_DMC_Req_Func_Num,
        TXC_DMC_Req_Port_Num,
        TXC_DMC_Req_DMA_Num,
        TXC_DMC_Req_Cmd,
        TXC_DMC_Req_Length,
        TXC_DMC_Req_Address,

        Port_Selected,

        Port0_Request,
        Port0_Request_Func_Num,
        Port0_Request_DMA_Num,
        Port0_Request_Length,
        Port0_Request_Address,

        Port1_Request,
        Port1_Request_Func_Num,
        Port1_Request_DMA_Num,
        Port1_Request_Length,
        Port1_Request_Address,

        Port2_Request,
        Port2_Request_Func_Num,
        Port2_Request_DMA_Num,
        Port2_Request_Length,
        Port2_Request_Address,

        Port3_Request,
        Port3_Request_Func_Num,
        Port3_Request_DMA_Num,
        Port3_Request_Length,
        Port3_Request_Address,

        PortSelect_State,
        DataFetch_State
       );
    
`include "txc_defines.h"

// Global Signals
input          SysClk;
input          Reset_L;
input          Txc_Enabled;

// Tx DMA Cache
input          DMC_TXC_Tx_Addr_Md;

// Tx DMA Request Interface
input          DMC_TXC_Req_Ack;

output         TXC_DMC_Req;
output [1:0]   TXC_DMC_Req_Func_Num;
output [1:0]   TXC_DMC_Req_Port_Num;
output [4:0]   TXC_DMC_Req_DMA_Num;
output [7:0]   TXC_DMC_Req_Cmd;
output [13:0]  TXC_DMC_Req_Length;
output [63:0]  TXC_DMC_Req_Address;

reg            TXC_DMC_Req;
reg    [1:0]   TXC_DMC_Req_Func_Num;
reg    [1:0]   TXC_DMC_Req_Port_Num;
reg    [4:0]   TXC_DMC_Req_DMA_Num;
reg    [7:0]   TXC_DMC_Req_Cmd;
reg    [63:0]  TXC_DMC_Req_Address;

// Global Port Interface
output [3:0]   Port_Selected;

// Port 0 Interface
input          Port0_Request;
input [1:0]    Port0_Request_Func_Num;
input [4:0]    Port0_Request_DMA_Num;
input [12:0]   Port0_Request_Length;
input [63:0]   Port0_Request_Address;

// Port 1 Interface
input          Port1_Request;
input [1:0]    Port1_Request_Func_Num;
input [4:0]    Port1_Request_DMA_Num;
input [12:0]   Port1_Request_Length;
input [63:0]   Port1_Request_Address;

// Port 2 Interface
input          Port2_Request;
input [1:0]    Port2_Request_Func_Num;
input [4:0]    Port2_Request_DMA_Num;
input [12:0]   Port2_Request_Length;
input [63:0]   Port2_Request_Address;

// Port 3 Interface
input          Port3_Request;
input [1:0]    Port3_Request_Func_Num;
input [4:0]    Port3_Request_DMA_Num;
input [12:0]   Port3_Request_Length;
input [63:0]   Port3_Request_Address;

// State Machine
output [3:0]   PortSelect_State;
output [3:0]   DataFetch_State;

reg    [3:0]   PortSelect_State;
reg    [3:0]   DataFetch_State;

/*--------------------------------------------------------------*/
// Wires & Registers
/*--------------------------------------------------------------*/
wire           requestValid;
wire           selectPortZero;
wire           selectPortOne;
wire           selectPortTwo;
wire           selectPortThree;
wire   [3:0]   portRequest;
wire   [3:0]   lastPortGranted;

reg            dMC_TXC_Req_AckD1;
reg            latchArbSelect;
reg            requestDone_n;
reg            requestDone;
reg            tXC_DMC_Req_n;
reg            ldPortGranted;
reg            portSelectValid;
reg    [1:0]   portArbSelect_n;
reg    [1:0]   portArbSelect;
reg    [1:0]   requestFunctionNum;
reg    [3:0]   nextFetchState;
reg    [3:0]   nextPortGrant;
reg    [3:0]   nextPortState;
reg    [3:0]   portGranted;
reg    [3:0]   portsThatHaveBeenGranted;
reg    [4:0]   requestDMAChannel;
reg    [12:0]  requestLength;
reg    [12:0]  txcDmcRequestLength;
reg    [63:0]  requestAddress;

/*--------------------------------------------------------------*/
// Parameters and Defines
/*--------------------------------------------------------------*/
parameter PORT_REQ_IDLE         = 4'h0,
          PORT_ARB_SELECT       = 4'h1,
          WAIT_FOR_PORT_DONE    = 4'h2;

parameter FETCH_IDLE            = 4'h0,
          CHECK_PORTS_STATE     = 4'h1,
          PORT_SELECT           = 4'h2,
          TRANSACTION_REQ       = 4'h3,
          WAIT_FOR_REQ_ACCEPT   = 4'h4,
          WAIT_FOR_NEXT_DESC    = 4'h5,
          WAIT_FOR_REQUEST_DONE = 4'h6;

//VCS coverage off
// synopsys translate_off
reg [192:1] DATA_PORT_STATE;
reg [192:1] DATA_FETCH_STATE;


always @(PortSelect_State)
begin
  case(PortSelect_State)
    PORT_REQ_IDLE :         DATA_PORT_STATE = "PORT_REQ_IDLE";
    PORT_ARB_SELECT:        DATA_PORT_STATE = "PORT_ARB_SELECT";
    WAIT_FOR_PORT_DONE :    DATA_PORT_STATE = "WAIT_FOR_PORT_DONE";
       default :            DATA_PORT_STATE = "UNKNOWN";
  endcase
end

always @(DataFetch_State)
begin
  case(DataFetch_State)
    FETCH_IDLE :            DATA_FETCH_STATE = "FETCH_IDLE";
    CHECK_PORTS_STATE:      DATA_FETCH_STATE = "CHECK_PORTS_STATE";
    PORT_SELECT :           DATA_FETCH_STATE = "PORT_SELECT";
    TRANSACTION_REQ:        DATA_FETCH_STATE = "TRANSACTION_REQ";
    WAIT_FOR_REQ_ACCEPT :   DATA_FETCH_STATE = "WAIT_FOR_REQ_ACCEPT";
    WAIT_FOR_NEXT_DESC :    DATA_FETCH_STATE = "WAIT_FOR_NEXT_DESC";
    WAIT_FOR_REQUEST_DONE : DATA_FETCH_STATE = "WAIT_FOR_REQUEST_DONE";
       default :            DATA_FETCH_STATE = "UNKNOWN";
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
assign requestValid = (Port3_Request | Port2_Request
                       |
                       Port1_Request | Port0_Request);

/*--------------------------------------------------------------*/
// Ports Select Round Robin Arbiter
/*--------------------------------------------------------------*/
assign portRequest = {Port3_Request, Port2_Request,
                      Port1_Request, Port0_Request};

assign lastPortGranted = portRequest & ~portsThatHaveBeenGranted;

always @(/*AUTOSENSE*/lastPortGranted or portGranted
        )
      casex(lastPortGranted) // Synopsys full_case
          4'b???1:  nextPortGrant = 4'b0001;
          4'b??10:  nextPortGrant = 4'b0010;
          4'b?100:  nextPortGrant = 4'b0100;
          4'b1000:  nextPortGrant = 4'b1000;
               default:   nextPortGrant = portGranted;
      endcase

always @(posedge SysClk)
  if (!Reset_L)           portGranted <= #`SD 4'h0;
  else if (ldPortGranted) portGranted <= #`SD nextPortGrant;

always @(posedge SysClk)
  if (!Reset_L)
    portsThatHaveBeenGranted <= #`SD 4'h0;
  else if (ldPortGranted) 
    portsThatHaveBeenGranted <= #`SD (portsThatHaveBeenGranted | nextPortGrant);
  else if (lastPortGranted == 4'h0) 
    portsThatHaveBeenGranted <= #`SD 4'h0;

always @(posedge SysClk)
  if (!Reset_L)           portSelectValid <= #`SD 1'b0;
  else if (ldPortGranted) portSelectValid <= #`SD 1'b1;
  else if (requestDone)   portSelectValid <= #`SD 1'b0;

assign selectPortZero  = portGranted[0];
assign selectPortOne   = portGranted[1];
assign selectPortTwo   = portGranted[2];
assign selectPortThree = portGranted[3];

assign Port_Selected = portGranted;

/*--------------------------------------------------------------*/
// Round Robin
/*--------------------------------------------------------------*/
always @(portArbSelect or Port3_Request_DMA_Num or Port2_Request_DMA_Num
         or Port1_Request_DMA_Num or Port0_Request_DMA_Num
        )
    case(portArbSelect) // synopsys full_case parallel_case 
     `PORT_ZERO:   requestDMAChannel = Port0_Request_DMA_Num;
     `PORT_ONE:    requestDMAChannel = Port1_Request_DMA_Num;
     `PORT_TWO:    requestDMAChannel = Port2_Request_DMA_Num;
     `PORT_THREE:  requestDMAChannel = Port3_Request_DMA_Num;
           default: requestDMAChannel = 5'hx;
    endcase

always @(portArbSelect or Port3_Request_Func_Num or Port2_Request_Func_Num
         or Port1_Request_Func_Num or Port0_Request_Func_Num
        )
    case(portArbSelect) // synopsys full_case parallel_case 
     `PORT_ZERO:   requestFunctionNum = Port0_Request_Func_Num;
     `PORT_ONE:    requestFunctionNum = Port1_Request_Func_Num;
     `PORT_TWO:    requestFunctionNum = Port2_Request_Func_Num;
     `PORT_THREE:  requestFunctionNum = Port3_Request_Func_Num;
           default: requestFunctionNum = 2'hx;
    endcase

always @(portArbSelect or Port3_Request_Length or Port2_Request_Length
         or Port1_Request_Length or Port0_Request_Length
        )
    case(portArbSelect) // synopsys full_case parallel_case 
     `PORT_ZERO:   requestLength = Port0_Request_Length;
     `PORT_ONE:    requestLength = Port1_Request_Length;
     `PORT_TWO:    requestLength = Port2_Request_Length;
     `PORT_THREE:  requestLength = Port3_Request_Length;
           default: requestLength = 13'hx;
    endcase

always @(portArbSelect or Port3_Request_Address or Port2_Request_Address
         or Port1_Request_Address or Port0_Request_Address
        )
    case(portArbSelect) // synopsys full_case parallel_case 
     `PORT_ZERO:   requestAddress = Port0_Request_Address;
     `PORT_ONE:    requestAddress = Port1_Request_Address;
     `PORT_TWO:    requestAddress = Port2_Request_Address;
     `PORT_THREE:  requestAddress = Port3_Request_Address;
           default: requestAddress = 64'hx;
    endcase

/*--------------------------------------------------------------*/
// Request State Variables
/*--------------------------------------------------------------*/
always @(posedge SysClk)
  if (!Reset_L) dMC_TXC_Req_AckD1 <= #`SD 1'b0;
  else          dMC_TXC_Req_AckD1 <= #`SD DMC_TXC_Req_Ack;

always @(posedge SysClk)
  if (!Reset_L)             TXC_DMC_Req <= #`SD 1'b0;
  else if (tXC_DMC_Req_n)   TXC_DMC_Req <= #`SD 1'b1;
  else if (DMC_TXC_Req_Ack) TXC_DMC_Req <= #`SD 1'b0;

always @(posedge SysClk)
  if (!Reset_L)             TXC_DMC_Req_Cmd <= #`SD 8'h0;
  else if (tXC_DMC_Req_n)
    begin
      if (DMC_TXC_Tx_Addr_Md) TXC_DMC_Req_Cmd <= #`SD `TXC_MEM_READ_BYPASS_32;
      else                    TXC_DMC_Req_Cmd <= #`SD `TXC_MEM_READ_BYPASS_64;
    end

always @(posedge SysClk)
  if (!Reset_L)             TXC_DMC_Req_Func_Num <= #`SD 2'h0;
  else if (tXC_DMC_Req_n)   TXC_DMC_Req_Func_Num <= #`SD requestFunctionNum;

always @(posedge SysClk)
  if (!Reset_L)             TXC_DMC_Req_Port_Num <= #`SD 2'h0;
  else if (tXC_DMC_Req_n)   TXC_DMC_Req_Port_Num <= #`SD portArbSelect;

always @(posedge SysClk)
  if (!Reset_L)             TXC_DMC_Req_DMA_Num <= #`SD 5'h0;
  else if (tXC_DMC_Req_n)   TXC_DMC_Req_DMA_Num <= #`SD requestDMAChannel;

assign TXC_DMC_Req_Length = {1'b0, txcDmcRequestLength};

always @(posedge SysClk)
  if (!Reset_L)             txcDmcRequestLength <= #`SD 13'h0;
  else if (tXC_DMC_Req_n)   txcDmcRequestLength <= #`SD requestLength;

always @(posedge SysClk)
  if (!Reset_L)             TXC_DMC_Req_Address <= #`SD 64'h0;
  else if (tXC_DMC_Req_n)   TXC_DMC_Req_Address <= #`SD requestAddress;

/*--------------------------------------------------------------*/
// Local Variables
/*--------------------------------------------------------------*/

always @(posedge SysClk)
  if (!Reset_L) requestDone <= #`SD 1'b0;
  else          requestDone <= #`SD requestDone_n;

always @(posedge SysClk)
  if (!Reset_L)            portArbSelect <= #`SD 2'b0;
  else if (latchArbSelect) portArbSelect <= #`SD portArbSelect_n;

/*--------------------------------------------------------------*/
// Port Select & Data Fetch State Vector
/*--------------------------------------------------------------*/
always @(posedge SysClk)
  if (!Reset_L) PortSelect_State <= #`SD PORT_REQ_IDLE;
  else          PortSelect_State <= #`SD nextPortState;

always @(posedge SysClk)
  if (!Reset_L) DataFetch_State <= #`SD FETCH_IDLE;
  else          DataFetch_State <= #`SD nextFetchState;

/*--------------------------------------------------------------*/
// Ports Select Round Robin Arbiter
/*--------------------------------------------------------------*/
function [3:0] PortDefaults;
input [3:0] currentState;
  begin
    PortDefaults = currentState;
    ldPortGranted = 1'b0;
  end
endfunction


always @(/*AUTOSENSE*/PortSelect_State or Txc_Enabled
         or requestValid or dMC_TXC_Req_AckD1
        )

      case(PortSelect_State) // synopsys full_case parallel_case
                             /* 0in < case -full -parallel */
        PORT_REQ_IDLE:
          begin
            nextPortState = PortDefaults(PortSelect_State);

            if (Txc_Enabled)
              begin
                if (requestValid)
                  nextPortState = PORT_ARB_SELECT;
              end
          end

        PORT_ARB_SELECT:
          begin
            nextPortState = PortDefaults(PortSelect_State);
            ldPortGranted = 1'b1;
            nextPortState = WAIT_FOR_PORT_DONE;
          end


        WAIT_FOR_PORT_DONE: begin
          begin
            nextPortState = PortDefaults(PortSelect_State);

            if (dMC_TXC_Req_AckD1) 
              nextPortState = PORT_REQ_IDLE;

             end
          end

        endcase


/*--------------------------------------------------------------*/
// Data Fetch State Machine
/*--------------------------------------------------------------*/
function [3:0] FetchDefaults;
input [3:0] currentState;
  begin
    FetchDefaults = currentState;
    portArbSelect_n = 2'b0;
    latchArbSelect = 1'b0;
    tXC_DMC_Req_n = 1'b0;
    requestDone_n = 1'b0;
  end
endfunction


always @(/*AUTOSENSE*/DataFetch_State or Txc_Enabled or requestValid
         or selectPortZero or selectPortOne or selectPortTwo or selectPortThree
         or dMC_TXC_Req_AckD1 or portSelectValid or requestDone
	)

      case(DataFetch_State) // synopsys full_case parallel_case
                            /* 0in < case -full -parallel */
        FETCH_IDLE:
          begin
            nextFetchState = FetchDefaults(DataFetch_State);

            if (Txc_Enabled) 
              begin
                if (requestValid) 
                  nextFetchState = CHECK_PORTS_STATE;
              end
          end

        CHECK_PORTS_STATE:
          begin
            nextFetchState = FetchDefaults(DataFetch_State);

            if (~requestValid) 
              nextFetchState = FETCH_IDLE;
            else if (portSelectValid) 
              nextFetchState = PORT_SELECT;

          end

        PORT_SELECT:
          begin
            nextFetchState = FetchDefaults(DataFetch_State);
            latchArbSelect = 1'b1;

            if (portSelectValid) 
              begin

                if (selectPortZero) 
                  portArbSelect_n = `PORT_ZERO;
                else if (selectPortOne) 
                  portArbSelect_n = `PORT_ONE;
                else if (selectPortTwo) 
                  portArbSelect_n = `PORT_TWO;
                else if (selectPortThree) 
                  portArbSelect_n = `PORT_THREE;

                nextFetchState =  TRANSACTION_REQ;
              end
          end

        TRANSACTION_REQ:
          begin
            nextFetchState = FetchDefaults(DataFetch_State);
            tXC_DMC_Req_n = 1'b1;
            nextFetchState = WAIT_FOR_REQ_ACCEPT;
          end

        WAIT_FOR_REQ_ACCEPT:
          begin
            nextFetchState = FetchDefaults(DataFetch_State);

            if (dMC_TXC_Req_AckD1) 
              begin
                nextFetchState = WAIT_FOR_REQUEST_DONE;
                requestDone_n = 1'b1;
              end
          end

        WAIT_FOR_REQUEST_DONE:
          begin
            nextFetchState = FetchDefaults(DataFetch_State);

            if (requestDone)
              begin
                if (!requestValid) 
                  nextFetchState = FETCH_IDLE;
                else
                  nextFetchState = CHECK_PORTS_STATE;
              end
          end

      endcase

endmodule
