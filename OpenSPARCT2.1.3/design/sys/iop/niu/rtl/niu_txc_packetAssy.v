// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_txc_packetAssy.v
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
 *  niu_txc_packetAssy.v.v
 *
 *  Packet Assembly State Machine
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

module niu_txc_packetAssy (
         SysClk,                // Clock
         Reset_L,               // Reset_L
         PacketAssyDead,
         Txc_Enabled,           // Txc Enable
         MAC_Enabled,

         StoreForwardFifoRead,
         StoreForwardEccControl,
         StoreForwardFifoEmpty,
         StoreForward_CorruptECCSingle,
         StoreForward_CorruptECCDouble,
         StoreForwardFifoWrite,
         StoreForwardFifoReadStrobe,
         StoreForwardReadPtr,
         StoreForwardWritePtr,
         PacketAssyEngineDataOut,

         ReOrderFifoEmpty,
         ReOrderUnCorrectError,
         ReOrderFifoAlmostEmpty,
         ReOrderFifoDataValid,
         DisableEccCheking,
         PacketAssyEngineDataIn,

         ReOrderFifoRead,

         CheckSumValid,
         ChecksumValue,
         StartTCPChecksum,
         ChecksumPacketDone,
         PacketType,
         Layer3Version,
         Layer3Start,
         IPv4IPHeaderLen,

	 ClearStatistics,
	 WrPacketRequested,
	 WrPacketStuffed,
	 PioDataIn,
	 PacketsStuffed,
	 PktErrAbortCount,

         PacketAssy_State
        );

`include "txc_defines.h"

// MAC Global Signals
input          SysClk;
input          Reset_L;

output         PacketAssyDead;

// Control Registers
input          Txc_Enabled;
input          MAC_Enabled;

// Store and Forward Fifo
input          StoreForwardFifoRead;
input  [31:0]  StoreForwardEccControl;

output         StoreForwardFifoEmpty;
output         StoreForward_CorruptECCSingle;
output         StoreForward_CorruptECCDouble;
output         StoreForwardFifoWrite;
output         StoreForwardFifoReadStrobe;
output [9:0]   StoreForwardReadPtr;
output [9:0]   StoreForwardWritePtr;
output [135:0] PacketAssyEngineDataOut;

// reg    [9:0]   StoreForwardWritePtr;

// Re-Order Fifo
input          ReOrderFifoEmpty;
input          ReOrderUnCorrectError;
input          ReOrderFifoAlmostEmpty;
input          ReOrderFifoDataValid;
input          DisableEccCheking;
input  [135:0] PacketAssyEngineDataIn;

output         ReOrderFifoRead;

reg            ReOrderFifoRead;

// CRC and Checksum Interface
input          CheckSumValid;
input  [15:0]  ChecksumValue;

output         StartTCPChecksum;
reg            StartTCPChecksum;

output         ChecksumPacketDone;
reg            ChecksumPacketDone;

output [1:0]   PacketType;
output [1:0]   Layer3Version;
output [1:0]   Layer3Start;
output [3:0]   IPv4IPHeaderLen;

//reg    [1:0]   Layer3Start;
//reg    [3:0]   IPv4IPHeaderLen;
//wire     [4:0]   IPv4IPHeaderLen_tmp;

input          ClearStatistics;
input          WrPacketRequested;
input          WrPacketStuffed;
input  [15:0]  PioDataIn;

output [15:0]  PacketsStuffed;
output [15:0]  PktErrAbortCount;

reg    [15:0]  PacketsStuffed;
reg    [15:0]  PktErrAbortCount;

// State machine registers
output [3:0]   PacketAssy_State;

reg    [3:0]   PacketAssy_State;

/*--------------------------------------------------------------*/
// Reg & Wires
/*--------------------------------------------------------------*/
wire           collisionRequested;
wire           ipVersion;
wire           noQueuedWrites;
wire           collision;
wire           collisionStuffed;
wire           incQueuedWrites;
wire           decQueuedWrites;
wire           loadControlHeader;
wire           decPacketLength;
wire           lastLineOfPacket;
reg            dropPacket;
wire           set_dropPacket_n;	
wire	       rst_dropPacket_n;	
wire           insertLowWord;
wire           stuff_status;
wire           low_word_pkt_end;
wire           fifo_mac_abort;
wire           storeForwardfifoAlmostFull;
reg           storeForwardWriteConfirm;
reg           storeForwardWriteConfirm_r;
reg           StoreForwardFifoWrite;
wire           StoreForwardFifoWrite_n;
wire           llc_snap_pkt;
wire           vlan_pkt;
wire   [3:0]   fifo_mac_stat;
wire   [3:0]   ififo_mac_stat;
wire   [1:0]   PacketType;
wire   [5:0]   l4_start;
wire   [5:0]   l4_stuff;
reg    [5:0]   l4_stuff_dup_1;
reg    [5:0]   l4_stuff_dup_2;
reg    [5:0]   l4_stuff_dup_3;
wire   [6:0]   pipeLineDelay;
wire   [6:0]   memoryMode;
wire   [10:0]  pointerDifference;
wire   [127:0] sfFifoDataIn;
wire   [7:0]   msb_sfFifoDataIn;
wire   [9:0]   cksStoreFwdffWptr_plus1_n;
wire   	       cks_stuffat_lastline;
reg    [7:0]   msb_sfFifoDataIn_for_cks;

reg            readFifo;
reg            setLdControlHdr;
reg            ldControlHdr;
reg            enableFifoWrite;
reg            setEnableFifoWrite;
reg            setEnableFifoWrite_r;
reg    [15:0]  setEnableFifoWrite_mr;
reg            clrEnableFifoWrite;
reg            storeForwardFifoFull;
reg    [2:0]   lastByteBoundary;
reg    [3:0]   nextPacketState;
reg    [5:0]   queuedWrites;
reg    [9:0]   readPtr;
reg    [9:0]   shadowFifoWrPtr;
reg    [10:0]  storeForwardSpaceAvailable;
reg    [13:0]  packetLength;
reg    [13:0]  readLength;
reg    [127:0] controlHeader;

	// byteAlign data valid output  
wire 		ba_dv;
wire [15:0] 	ba_dv_dup;
wire 		ba_qwr_dv;
wire 		ba_sop, ba_eop;
wire [127:0] 	ba_data;

	// byteAlign checksum ctrl output
reg		writeCks;	
reg [9:0] 	cksStoreFwdffWptr; // pktdata with cks write ptr position 
reg [127:0]  	pktDataWithCks;    // pktData to have cksum overwrites   
wire 		cksen;
wire 		StartTCPChecksum_n;
wire 		ChecksumPacketDone_n;

	// storeForward write ptr select data/cks_insert
reg    [9:0]   ffStoreForwardWritePtr;
wire   [9:0]   StoreForwardWritePtr_n;
reg   [9:0]   StoreForwardWritePtr;

	// read roff control output
wire 		rcvEQorder;
wire 		orderEnable;
wire 		pktRdDone;
wire 		roff_ok_n;

	// input to byteAlign logic
reg 		writeCks_n;
reg 		sfConfirm_n; // from sm
reg 		roff_dv_r;
reg [17:0]	roff_dv_r_dup;
reg [135:0] 	roff_data_r;
reg  	        roff_data_abort_r;
reg  	        roff_uc_r;	// registered uncorr ecc err
reg  	        roff_dv_nc_r; // non-conditioned roff data valid

	// pad ctrl
wire [4:0] ff_pktpad_n;

	// pkt abort logic
wire		set_pktAbort_n;
wire [17:0]	set_pktAbort_dup_n;
reg		rst_pktAbort_n;
reg		pktAbort;
//wire    	roff_parity_err_n;
reg [9:0] 	rdFifoCnt;
reg [9:0] 	rcvFifoCnt;
wire		rdEQrcvFifoCnt_n= (rdFifoCnt == rcvFifoCnt);
reg		noWrite;
reg		set_noWrite_n;
reg		rst_noWrite_n;
reg		errWrite, errWrite_n;
reg		force_ld_ControlHdr;
wire		missing_sop_err_n; // calc exp sop; roff not sop;
wire		premature_sop_err_n; // midl of pkt; roff sop;
wire		eop_err_n;  // eop not match between calc, roff;

reg PacketAssyDead;
reg hdr_ecc_err_n;
reg StoreForward_CorruptECCSingle;
wire StoreForward_CorruptECCSingle_n;
reg StoreForward_CorruptECCDouble;
wire StoreForward_CorruptECCDouble_n;

reg [135:0] PacketAssyEngineDataOut;
wire [135:0] PacketAssyEngineDataOut_n;

/*--------------------------------------------------------------*/
// Parameters and Defines 
/*--------------------------------------------------------------*/
parameter WRITE_PACKET_IDLE     = 4'h0,
          LOAD_CONTROL_HDR      = 4'h1,
          DECODE_CONTROL_HDR    = 4'h2,
          WRITE_PACKET_DATA     = 4'h3,
          FLUSH_PIPELINE        = 4'h4,
          WAIT_FOR_REORDER_FIFO = 4'h5,
          WAIT_FOR_SF_FIFO      = 4'h6;

	// ??? not need WAIT_FOR_REORDER_FIFO/WAIT_FOR_SF_FIFO ??

parameter WAIT_FOR_CKS_DONE	= 4'h7,
	  PKT_CONFIRM		= 4'h8,
	  ERR_HANDLE_0		= 4'h9,
	  ERR_HANDLE_1		= 4'ha,
	  ENABLE_FIFO_WRITE	= 4'hb;


//VCS coverage off
// synopsys translate_off
reg [192:1] PACKET_ASSY;


always @(PacketAssy_State)
begin
  case(PacketAssy_State)
    WRITE_PACKET_IDLE:       PACKET_ASSY = "WRITE_PACKET_IDLE";
    LOAD_CONTROL_HDR:        PACKET_ASSY = "LOAD_CONTROL_HDR";
    DECODE_CONTROL_HDR:      PACKET_ASSY = "DECODE_CONTROL_HDR";
    WRITE_PACKET_DATA:       PACKET_ASSY = "WRITE_PACKET_DATA";
    FLUSH_PIPELINE:          PACKET_ASSY = "FLUSH_PIPELINE";
    WAIT_FOR_REORDER_FIFO:   PACKET_ASSY = "WAIT_FOR_REORDER_FIFO";
    WAIT_FOR_SF_FIFO:        PACKET_ASSY = "WAIT_FOR_SF_FIFO";
    WAIT_FOR_CKS_DONE:       PACKET_ASSY = "WAIT_FOR_CKS_DONE";
    PKT_CONFIRM:             PACKET_ASSY = "PKT_CONFIRM";
    ERR_HANDLE_0:              PACKET_ASSY = "ERR_HANDLE_0";
    ERR_HANDLE_1:              PACKET_ASSY = "ERR_HANDLE_1";
    ENABLE_FIFO_WRITE:       PACKET_ASSY = "ENABLE_FIFO_WRITE";
       default:    PACKET_ASSY = "UNKNOWN";
  endcase
end


// synopsys translate_on
//VCS coverage on

/*--------------------------------------------------------------*/
// Zero In Checks 
/*--------------------------------------------------------------*/
// ??? dropPacket make flag ; @ parity, set; @ abort set;
//     rst flag at next new pkt 
always @ (posedge SysClk)
  if (!Reset_L)
    dropPacket<= #`SD 1'b0;
  else if (set_dropPacket_n) dropPacket<= #`SD 1'b1;
  else if (rst_dropPacket_n) dropPacket<= #`SD 1'b0;

assign set_dropPacket_n= roff_dv_nc_r & roff_uc_r; 
					// set drop on every nc ecc err
assign rst_dropPacket_n= setLdControlHdr;  // reset flag at every state start

/*--------------------------------------------------------------*/
// Assigns 
/*--------------------------------------------------------------*/
// assign PacketAssyDead = 1'b0;
// assign StoreForward_CorruptECCSingle = 1'b0;
// assign StoreForward_CorruptECCDouble = 1'b0;
assign loadControlHeader = (ldControlHdr & ReOrderFifoDataValid);

//  *** original ******* 
//assign decPacketLength   = (StoreForwardFifoWrite && (packetLength != 14'h0));
//  *** original ******* 

	// dec per ba_dv; 
	// don't wanna use StoreForwardFifoWrite since includes cksum write
assign decPacketLength   = ((enableFifoWrite & ba_dv) && (packetLength != 14'h0));

assign lastLineOfPacket  = (packetLength <= 14'd16);


assign StoreForwardFifoReadStrobe  = StoreForwardFifoRead;
assign StoreForwardReadPtr         = readPtr;


/*--------------------------------------------------------------*/
// Read logic
/*--------------------------------------------------------------*/
assign StoreForwardFifoEmpty       = !Reset_L ? 1'b0
                                              : (readPtr == shadowFifoWrPtr);

always @ (posedge SysClk)
  if (!Reset_L)
     readPtr <= #`SD 10'h0;
  else if (StoreForwardFifoRead && !StoreForwardFifoEmpty)
    begin
      if ({1'b0, readPtr} == `FIFO_SIZE_640_MINUS_1)
        readPtr <= #`SD 10'h0;
      else
        readPtr <= #`SD readPtr + 10'd1;
    end


/*--------------------------------------------------------------*/
// Write logic
/*--------------------------------------------------------------*/
  // chg StoreForwardWritePtr to ffStoreForwardWritePtr (fifo wptr value);
  // StoreForwardWritePtr mux from ff wptr, cks wptr,
assign   StoreForwardWritePtr_n= (writeCks)? 
		  cksStoreFwdffWptr : ffStoreForwardWritePtr;

always @(posedge SysClk)
  if (!Reset_L) StoreForwardWritePtr <= #`SD 10'h0;
  else          StoreForwardWritePtr <= #`SD StoreForwardWritePtr_n;
	// this one align with added stage on storeForward fifo write
	// synth fix
  

always @ (posedge SysClk)
  begin
   if (!Reset_L)
         storeForwardFifoFull <= 1'b0;
   else if (ffStoreForwardWritePtr > readPtr)
     begin
       if ((ffStoreForwardWritePtr - readPtr) > 10'd638)
         storeForwardFifoFull <= #`SD 1'b1;
       else
         storeForwardFifoFull <= #`SD 1'b0;
     end
   else if (ffStoreForwardWritePtr < readPtr)
     begin
       if ((readPtr - ffStoreForwardWritePtr) <= 10'd2)
         storeForwardFifoFull <= #`SD 1'b1;
       else
         storeForwardFifoFull <= #`SD 1'b0;
     end
   else if (readPtr == ffStoreForwardWritePtr)
     storeForwardFifoFull <= #`SD 1'b0;
  end

assign pointerDifference = (ffStoreForwardWritePtr < readPtr) 
                            ?  {1'b0, (ffStoreForwardWritePtr + 10'd640)}
                                -
                               {1'b0, readPtr}
                            : {1'b0, ffStoreForwardWritePtr} - {1'b0, readPtr};


always @ (posedge SysClk)
   if (!Reset_L)
      storeForwardSpaceAvailable <= 11'h0;
   else
      storeForwardSpaceAvailable <= #`SD {
                             (`FIFO_SIZE_640 - {1'b0, pointerDifference[9:0]}
                               -
                             {10'h0, StoreForwardFifoWrite_n}
                             +
                             {10'h0, StoreForwardFifoRead})
                       };

always @ (posedge SysClk)
  if (!Reset_L)
     ffStoreForwardWritePtr <= 10'h0;
  else if (StoreForwardFifoWrite_n && !storeForwardFifoFull && !writeCks)
    begin		// do not incr if inserting checksum
      if ({1'b0, ffStoreForwardWritePtr} == `FIFO_SIZE_640_MINUS_1)
        ffStoreForwardWritePtr <= #`SD 10'h0;
      else
        ffStoreForwardWritePtr <= #`SD ffStoreForwardWritePtr + 10'd1;
    end

always @ (posedge SysClk)
  if (!Reset_L)
     shadowFifoWrPtr <= 10'h0;
  else if (StoreForwardFifoWrite && storeForwardWriteConfirm_r)
     shadowFifoWrPtr <= #`SD ffStoreForwardWritePtr + 10'd1;
  else if (storeForwardWriteConfirm_r)
     shadowFifoWrPtr <= #`SD ffStoreForwardWritePtr;
  // confirm align with store fifo write at ram;
  // current storeForwardWriteConfirm is a cycle later
  // than writeCks, storeForwardWrite_n; 
  // confirm needs to be after or same time as ram
  // write since it affects empty flag




/*--------------------------------------------------------------*/
// Load Header Control Word
/*--------------------------------------------------------------*/
always @ (posedge SysClk) 
  if (!Reset_L)               controlHeader <= 128'h0;
  else if (loadControlHeader) controlHeader <= #`SD PacketAssyEngineDataIn[127:0];
  else if (force_ld_ControlHdr) controlHeader <=  #`SD roff_data_r[127:0];

/*--------------------------------------------------------------*/
// Control Header Word Fields
//
// CKSUM_EN_PKT_TYPE[63:62]: Checksum PacketType
//      NOP  => 00
//      TCP  => 01
//      UDP  => 10
//      RSVD => 11
//
// IP_VER[61]: IP Version
//      IPv4 => 0
//      IPv6 => 1
//
// LLC[57]: Logical Link Control
//      LLC/SNAP Encapsulated => 1
//
// VLAN[56]: Virtual Local Area Network
//      VLAN PKT => 1
//
// IHL[55:52]: IP Header Length in Quadlets (4 Bytes)
//      IPV4 Header Length => 5-15 => 20 -> 60 Bytes
//      IPV6 Header Length => 10 => 40 Bytes
//
// The three following L3START, L4START & L4STUFF are in multiples of 2 bytes,
// starting from the L2 frame.
//
// L3START[51:48]: Layer 3 Start
// L4START[45:40]: Layer 4 Start
// L4STUFF[37:32]: Layer 4 Checksum stuff offset
//
// TOT_XFER_LENGTH[29:16]: Total transfer length, sum of all gathers including
//                         control header in bytes.
//
// PAD[2:0]: Number of pad bytes in multiples of two bytes between transmit
//           header and the start of the L2 Frame.Tota
//
/*--------------------------------------------------------------*/
assign PacketType       = controlHeader[`CKSUM_EN_PKT_TYPE];
assign ipVersion        = controlHeader[`IP_VER];
assign llc_snap_pkt     = controlHeader[`LLC_SNAP_PACKET];
assign vlan_pkt         = controlHeader[`VLAN_PACKET];
assign IPv4IPHeaderLen  = controlHeader[`IHL];
assign l4_start         = controlHeader[`L4START];
assign l4_stuff         = controlHeader[`L4STUFF];


assign Layer3Version = ipVersion ? `IPV6 : `IPV4;
assign Layer3Start   = {llc_snap_pkt, vlan_pkt};

// assign IPv4IPHeaderLen = 4'd5;	// ??? constant ???
//assign IPv4IPHeaderLen_tmp = l4_start - controlHeader[`L3START];// ??? constant ???
//assign IPv4IPHeaderLen = {1'b0,IPv4IPHeaderLen_tmp[4:1]};
//assign cksen= !(PacketType==2'b00);
assign cksen = ((PacketType==2'b01) || (PacketType==2'b10));

always @ (posedge SysClk)
  if (!Reset_L)
    begin
      l4_stuff_dup_1 <= 6'h0;
      l4_stuff_dup_2 <= 6'h0;
      l4_stuff_dup_3 <= 6'h0;
    end
  else
    begin
      l4_stuff_dup_1<= #`SD controlHeader[`L4STUFF];
      l4_stuff_dup_2<= #`SD controlHeader[`L4STUFF];
      l4_stuff_dup_3<= #`SD controlHeader[`L4STUFF];
    end

/*--------------------------------------------------------------*/
// controlHeader[`L3START] in two byte offsets, including Type
/*--------------------------------------------------------------*/
//always @ (controlHeader)
//  begin
//    case (controlHeader[`L3START]) // synopsys full_case parallel_case
//                                        /* 0in < case -full -parallel */
//      4'd7:       Layer3Start  = `ETHERNET_PKT;
//      4'd9:       Layer3Start  = `VLAN_ONLY;
//      4'd11:      Layer3Start  = `LLC_SNAP_ONLY;
//      4'd13:      Layer3Start  = `LLC_SNAP_PLUS_VLAN;
//           default:   Layer3Start  = 2'b00;
//    endcase
//  end

/*--------------------------------------------------------------*/
// Packet Length
/*--------------------------------------------------------------*/
assign pipeLineDelay  = 7'd2;
assign memoryMode     = ({1'b0, queuedWrites} + pipeLineDelay);
assign storeForwardfifoAlmostFull = (storeForwardSpaceAvailable
                                     <=
                                    (11'd2 + {4'h0, memoryMode}));

/*--------------------------------------------------------------*/
// Packet Length
/*--------------------------------------------------------------*/
// wire [13:0] adj_ctrlhdr_pktlen_n= controlHeader[`TOT_XFER_LENGTH];

wire [13:0] adj_ctrlhdr_pktlen_n= controlHeader[`TOT_XFER_LENGTH]- 
				 	{9'h0, ff_pktpad_n};
	// tb len is ntw_pktlen + pad  
/*
   use this when tb updated
wire [13:0] adj_ctrlhdr_pktlen_n= controlHeader[`TOT_XFER_LENGTH]- 
				{9'h0, 5'd16} - {9'h0, ff_pktpad_n};
*/

	// ???? gather list is  ntw_pktlen + ctrlHdr + pad
	//  controlHeader[`TOT_XFER_LENGTH] - {9'h0, 5'd16} - {9'h0, ff_pktpad_n};  
	//  right now tb's pktlen in ctrlhdr field is ntw_pktlen   
	// this is used in load of :
	//	packetLength - sf_fifo data in (16B - aligned)  
	//	readLength - ro_fifo read cnt ctrl (non-16B)
	//	pktLength - ro_fifo data out (dv) cnt (non-16Bs)   
	//

  //  use ctrlHeader (reg out) to do len calc instead of data from ram
always @ (posedge SysClk) 
  if (!Reset_L)               packetLength <= 14'h0;
  else if (setEnableFifoWrite_r)  
    packetLength <= #`SD adj_ctrlhdr_pktlen_n;
  else if (decPacketLength)
    begin
      if (lastLineOfPacket)
        packetLength <= #`SD 14'd0;
      else if (decPacketLength)
        packetLength <= #`SD packetLength - 14'd16;
    end

always @ (posedge SysClk) 
  if (!Reset_L)               readLength <= 14'h0;
  else if (setEnableFifoWrite_r)
    readLength <= #`SD adj_ctrlhdr_pktlen_n;

/*--------------------------------------------------------------*/
// Packet Data Write
/*--------------------------------------------------------------*/

// ecc error force
reg firstline, secondline;
wire rst_firstline_n= firstline & ba_dv;
wire rst_secondline_n= secondline & ba_dv;

always @(posedge SysClk)
  if (!Reset_L) begin
     firstline <= #`SD 1'b0;
     secondline <= #`SD 1'b0;
  end
  else begin
     if(setEnableFifoWrite_r) firstline <= #`SD 1'b1;
     else if(rst_firstline_n) firstline <= #`SD 1'b0;

     if(rst_firstline_n) secondline <= #`SD 1'b1;
     else if(rst_secondline_n) secondline <= #`SD 1'b0;
  end

reg pkt_toggle_flag;
reg pkt_one_forced_flag;

always @(posedge SysClk)
  if (!Reset_L) begin
    pkt_toggle_flag<=  #`SD 1'b0;
    pkt_one_forced_flag<=  #`SD 1'b0;
  end 
  else begin
    if(setEnableFifoWrite_r) pkt_toggle_flag<=  #`SD ~pkt_toggle_flag;

    if(!pkt_one_forced_flag && (StoreForward_CorruptECCSingle_n || StoreForward_CorruptECCDouble_n))
       pkt_one_forced_flag<=  #`SD 1'b1;
    else if(setEnableFifoWrite_r && !StoreForwardEccControl[8]) // reset forced if ctrl off
       pkt_one_forced_flag<=  #`SD 1'b0;
  end

wire force_err_en_n= (~pkt_one_forced_flag & StoreForwardEccControl[8]) || // force at first one  
		     (pkt_toggle_flag & StoreForwardEccControl[9]) || // force at toggle=1 
		     (StoreForwardEccControl[10]); // all pkts

assign StoreForward_CorruptECCSingle_n= StoreForwardFifoWrite_n & StoreForwardEccControl[16] & 
				force_err_en_n &
				((StoreForwardEccControl[0] & firstline) ||
				(StoreForwardEccControl[1] & secondline) ||
				(StoreForwardEccControl[2] & stuff_status));

assign StoreForward_CorruptECCDouble_n= StoreForwardFifoWrite_n & StoreForwardEccControl[17] & 
				force_err_en_n &
				((StoreForwardEccControl[0] & firstline) ||
				(StoreForwardEccControl[1] & secondline) ||
				(StoreForwardEccControl[2] & stuff_status));

always @(posedge SysClk)
  if (!Reset_L) 
    StoreForward_CorruptECCSingle<=  #`SD 1'b0;
  else
    StoreForward_CorruptECCSingle<=  #`SD StoreForward_CorruptECCSingle_n;

always @(posedge SysClk)
  if (!Reset_L) 
    StoreForward_CorruptECCDouble<=  #`SD 1'b0;
  else
    StoreForward_CorruptECCDouble<=  #`SD StoreForward_CorruptECCDouble_n;


always @(posedge SysClk)
  if (!Reset_L) begin
    PacketAssyDead<=  #`SD 1'b0;
  end 
  else begin
    PacketAssyDead<=  #`SD hdr_ecc_err_n;
  end

//  *** original ******* 
// assign stuff_status     = (lastLineOfPacket & enableFifoWrite & ReOrderFifoDataValid);
//  *** original ******* 

assign collisionStuffed = ClearStatistics & storeForwardWriteConfirm;

always @(posedge SysClk)
  if (!Reset_L)
      PacketsStuffed <=  #`SD 16'h0;
  else if(collisionStuffed) 
      PacketsStuffed <= #`SD 16'h1;
  else if(ClearStatistics) 
      PacketsStuffed <= #`SD 16'h0;
  else if(WrPacketStuffed) 
      PacketsStuffed <= #`SD PioDataIn[15:0];
  else if(storeForwardWriteConfirm)
      PacketsStuffed <= #`SD PacketsStuffed + 16'h1;


		// align with new valid 
assign stuff_status     = (lastLineOfPacket & enableFifoWrite & ba_dv);

assign low_word_pkt_end = stuff_status & insertLowWord;
assign fifo_mac_abort   = stuff_status & dropPacket;
assign fifo_mac_stat    = stuff_status ? ififo_mac_stat : 4'h0;

assign insertLowWord    = (lastLineOfPacket
                           && 
                           ((packetLength <= 14'd8) && (packetLength >= 14'h0))
                          );

assign ififo_mac_stat   = {1'b0, lastByteBoundary};


always @ (packetLength)
  begin
    case ({4'h0, packetLength[2:0]}) // synopsys full_case parallel_case
                                       /* 0in < case -full -parallel */
      `ONE_BYTE:         lastByteBoundary  = `OFFSET_ZERO;
      `TWO_BYTES:        lastByteBoundary  = `OFFSET_ONE;
      `THREE_BYTES:      lastByteBoundary  = `OFFSET_TWO;
      `FOUR_BYTES:       lastByteBoundary  = `OFFSET_THREE;
      `FIVE_BYTES:       lastByteBoundary  = `OFFSET_FOUR;
      `SIX_BYTES:        lastByteBoundary  = `OFFSET_FIVE;
      `SEVEN_BYTES:      lastByteBoundary  = `OFFSET_SIX;
           default:   lastByteBoundary  = `OFFSET_SEVEN;
    endcase
  end


/*--------------------------------------------------------------*/
// Packet Write variables
/*--------------------------------------------------------------*/

//  *** original ******* 
/*
 assign StoreForwardFifoWrite    = (enableFifoWrite & ReOrderFifoDataValid);
 assign sfFifoDataIn             = enableFifoWrite 
                                  ? PacketAssyEngineDataIn[127:0] : 128'h0;
*/
//  *** original ******* 

		// align with new valid; cksum add 
assign StoreForwardFifoWrite_n    = (enableFifoWrite & ba_dv) | writeCks | errWrite_n;
assign sfFifoDataIn             = (enableFifoWrite) ? ba_data: pktDataWithCks; 

// editing ....??
		// check if cks stuff occurs at lastline of a pkt
		// align with writeCks
assign cksStoreFwdffWptr_plus1_n=  ({1'b0, cksStoreFwdffWptr}==`FIFO_SIZE_640_MINUS_1)? 
					10'h0 : (cksStoreFwdffWptr + 10'h1);
assign cks_stuffat_lastline= (cksStoreFwdffWptr_plus1_n == StoreForwardWritePtr);
		// StoreForwardWritePtr already pointing to next location;
		// therefore needs to compare with plus1

assign msb_sfFifoDataIn= (enableFifoWrite)?  
				{stuff_status, low_word_pkt_end, 
				fifo_mac_stat, fifo_mac_abort,stuff_status} : 
				 ((cks_stuffat_lastline)? msb_sfFifoDataIn_for_cks : 8'h0);



assign PacketAssyEngineDataOut_n   = (errWrite_n)? {1'b1, 1'b0, 4'h0, 1'b1, 1'b1, 128'h0} :
					{msb_sfFifoDataIn, sfFifoDataIn};  

/* positon of sffdata bits
				   {stuff_status,             //[135]
                                   low_word_pkt_end,          //[134]
                                   fifo_mac_stat,             //[133:130]
                                   fifo_mac_abort,            //[129]
                                   stuff_status,              //[128]
                                   sfFifoDataIn};             //[127:0]
*/

always @(posedge SysClk)
  if (!Reset_L)
    msb_sfFifoDataIn_for_cks<= #`SD 8'h0;
  else
    if(stuff_status) msb_sfFifoDataIn_for_cks<= #`SD msb_sfFifoDataIn;
		// store status field in case stuff cks at last line


always @(posedge SysClk)
  if (!Reset_L)
    PacketAssyEngineDataOut <= #`SD 136'h0;
  else
    PacketAssyEngineDataOut <= #`SD PacketAssyEngineDataOut_n;

always @(posedge SysClk)
  if (!Reset_L) StoreForwardFifoWrite <= #`SD 1'b0;
  else          StoreForwardFifoWrite <= #`SD StoreForwardFifoWrite_n;

//  *** original ******* 
// assign storeForwardWriteConfirm = clrEnableFifoWrite;
//  *** original ******* 

		// move confirm to after cks insert
always @(posedge SysClk)
  if (!Reset_L) storeForwardWriteConfirm <= #`SD 1'b0;
  else          storeForwardWriteConfirm <= #`SD sfConfirm_n | errWrite;

always @(posedge SysClk)
  if (!Reset_L) storeForwardWriteConfirm_r <= #`SD 1'b0;
  else          storeForwardWriteConfirm_r <= #`SD storeForwardWriteConfirm;

//  *** original ******* 
// assign collision        = (readFifo & ReOrderFifoDataValid);
//assign decQueuedWrites  = (ReOrderFifoDataValid && (queuedWrites != 6'h0));
//  *** original ******* 

		// align with new dv 
assign collision        = (readFifo & ba_qwr_dv);

assign noQueuedWrites   = (queuedWrites == 6'h0);

assign incQueuedWrites  = readFifo;

assign decQueuedWrites  = (ba_qwr_dv && (queuedWrites != 6'h0));

always @(posedge SysClk)
  if (!Reset_L) ReOrderFifoRead <= #`SD 1'b0;
  else          ReOrderFifoRead <= #`SD readFifo;


always @(posedge SysClk)
  if (!Reset_L)                  ldControlHdr <= #`SD 1'b0;
  else if (setLdControlHdr)      ldControlHdr <= #`SD 1'b1;
  else if (ReOrderFifoDataValid) ldControlHdr <= #`SD 1'b0;

always @(posedge SysClk)
  if (!Reset_L)                enableFifoWrite <= #`SD 1'b0;
  else if (setEnableFifoWrite) enableFifoWrite <= #`SD 1'b1;
  else if (clrEnableFifoWrite) enableFifoWrite <= #`SD 1'b0;

always @(posedge SysClk)
  if (!Reset_L)             queuedWrites <= #`SD 6'h0;
  else if (collision)       queuedWrites <= #`SD queuedWrites;
  else if (incQueuedWrites) queuedWrites <= #`SD queuedWrites + 1;
  else if (decQueuedWrites) queuedWrites <= #`SD queuedWrites - 1;


/*--------------------------------------------------------------*/
// Packet Assembly State Vector
/*--------------------------------------------------------------*/
always @(posedge SysClk)
  if (!Reset_L) PacketAssy_State <= #`SD WRITE_PACKET_IDLE;
  else          PacketAssy_State <= #`SD nextPacketState;

always @(posedge SysClk)
  if (!Reset_L) setEnableFifoWrite_r <= #`SD 1'b0;
  else          setEnableFifoWrite_r <= #`SD setEnableFifoWrite;

always @(posedge SysClk)
  if (!Reset_L) setEnableFifoWrite_mr <= #`SD 16'h0;
  else          setEnableFifoWrite_mr <= #`SD {16{setEnableFifoWrite}};

/*--------------------------------------------------------------*/
// Packet Assembly State Machine
/*--------------------------------------------------------------*/
/*
function [3:0] AssemblyDefaults;
input [3:0] currentState;
  begin
    AssemblyDefaults = currentState;
    readFifo = 1'b0;
    setLdControlHdr = 1'b0;
    setEnableFifoWrite = 1'b0;
    clrEnableFifoWrite = 1'b0;
    writeCks_n= 1'b0;
    sfConfirm_n= 1'b0;
    set_noWrite_n= 1'b0;  // err handle
    rst_noWrite_n= 1'b0;  // err handle
    rst_pktAbort_n= 1'b0;
    errWrite_n= 1'b0;	
    force_ld_ControlHdr= 1'b0;
  end
endfunction
*/

assign roff_ok_n= ({ReOrderFifoAlmostEmpty,ReOrderFifoEmpty} == 2'b00) || // sth in roff
		(({ReOrderFifoAlmostEmpty,ReOrderFifoEmpty} == 2'b10) && rcvEQorder);
			// in case of residual: leftover dataline sitting between
			// empty and almostEmpty; instead of waiting next
			// new data to push it out of almostEmpty, read
			// one line at a time till empty;

always @(/*AUTOSENSE*/CheckSumValid or MAC_Enabled or PacketAssy_State
	 or ReOrderFifoAlmostEmpty or ReOrderFifoDataValid
	 or ReOrderFifoEmpty or Txc_Enabled 
	 or cksen or noQueuedWrites or noWrite
	 or orderEnable or pktRdDone or rcvFifoCnt or rdEQrcvFifoCnt_n
	 or roff_data_r or roff_ok_n or ReOrderUnCorrectError 
	 or DisableEccCheking  or roff_uc_r 
	 or set_pktAbort_dup_n or storeForwardfifoAlmostFull) begin

    nextPacketState = PacketAssy_State;
    readFifo = 1'b0;
    setLdControlHdr = 1'b0;
    setEnableFifoWrite = 1'b0;
    clrEnableFifoWrite = 1'b0;
    writeCks_n= 1'b0;
    sfConfirm_n= 1'b0;
    set_noWrite_n= 1'b0;  // err handle
    rst_noWrite_n= 1'b0;  // err handle
    rst_pktAbort_n= 1'b0;
    errWrite_n= 1'b0;	
    force_ld_ControlHdr= 1'b0;
    hdr_ecc_err_n= 1'b0;
      case(PacketAssy_State) 
                             /* 0in < case -full -parallel*/
        WRITE_PACKET_IDLE:
          begin
            // nextPacketState = AssemblyDefaults(PacketAssy_State);

            if (Txc_Enabled)
              begin
                if (MAC_Enabled)
                  begin
                    if (~(ReOrderFifoEmpty | ReOrderFifoAlmostEmpty))
                      begin
                        readFifo = 1'b1;
                        setLdControlHdr = 1'b1;
                        nextPacketState = LOAD_CONTROL_HDR;
                      end
                  end
              end
          end

        LOAD_CONTROL_HDR: // load roff data (non-reg) to controlHeader
          begin
            // nextPacketState = AssemblyDefaults(PacketAssy_State);

            if (ReOrderFifoDataValid) begin
	      hdr_ecc_err_n= ReOrderUnCorrectError & ~DisableEccCheking;
              nextPacketState = DECODE_CONTROL_HDR;
  	    end
          end

        DECODE_CONTROL_HDR: // decode loaded controlHeader;  
          begin	 // ctrl header loaded in roff_data_r; check for err
	    if(set_pktAbort_dup_n[16]) begin 
	      set_noWrite_n= 1'b1; // @soh, no pkt write
	      nextPacketState= ERR_HANDLE_0;
	    end
	    else begin
              setEnableFifoWrite = 1'b1;
              nextPacketState =  ENABLE_FIFO_WRITE;
	    end
          end

	ENABLE_FIFO_WRITE:
          begin		// flop in setEnableFifoWrite; timing fix
            // nextPacketState = AssemblyDefaults(PacketAssy_State);
            nextPacketState = WRITE_PACKET_DATA;
          end

        WRITE_PACKET_DATA:
          begin
            // nextPacketState = AssemblyDefaults(PacketAssy_State);

	    if(set_pktAbort_dup_n[17]) begin
		if(rcvFifoCnt==10'h2) set_noWrite_n= 1'b1; // @sop 
		nextPacketState= ERR_HANDLE_0;
	    end	
	    else begin
	      readFifo= roff_ok_n & (~storeForwardfifoAlmostFull) & 
		      				orderEnable;

              if (pktRdDone) nextPacketState = FLUSH_PIPELINE;
	    end
          end

        FLUSH_PIPELINE:
          begin
            // nextPacketState = AssemblyDefaults(PacketAssy_State);

            if (noQueuedWrites)
              begin
                clrEnableFifoWrite = 1'b1;
                nextPacketState = (cksen)? WAIT_FOR_CKS_DONE : PKT_CONFIRM;
		
              end
          end

        WAIT_FOR_REORDER_FIFO:
          begin
            // nextPacketState = AssemblyDefaults(PacketAssy_State);

            if (~(ReOrderFifoEmpty | ReOrderFifoAlmostEmpty))
              begin
                if (~storeForwardfifoAlmostFull)
                  nextPacketState = WRITE_PACKET_DATA;
                else
                  nextPacketState = WAIT_FOR_SF_FIFO;
              end
            else
              nextPacketState = WAIT_FOR_REORDER_FIFO;
          end

        WAIT_FOR_SF_FIFO:
          begin
            // nextPacketState = AssemblyDefaults(PacketAssy_State);

            if (~storeForwardfifoAlmostFull)
              begin
                if (~(ReOrderFifoEmpty | ReOrderFifoAlmostEmpty))
                  nextPacketState = WRITE_PACKET_DATA;
                else
                  nextPacketState = WAIT_FOR_REORDER_FIFO;
              end
            else
              nextPacketState = WAIT_FOR_SF_FIFO;
          end

        WAIT_FOR_CKS_DONE:
          begin
            // nextPacketState = AssemblyDefaults(PacketAssy_State);

	    if(CheckSumValid) begin
	      writeCks_n= 1'b1; 
              nextPacketState = PKT_CONFIRM;
	    end
          end

        PKT_CONFIRM:
          begin
            // nextPacketState = AssemblyDefaults(PacketAssy_State);

	    sfConfirm_n= 1'b1;
            nextPacketState = WRITE_PACKET_IDLE;
          end

	ERR_HANDLE_0:   // wait read/rcv equal and flushed;
			// write sf_ff with drop if err not at sop; 
	  begin
            // nextPacketState = AssemblyDefaults(PacketAssy_State);
	    if(rdEQrcvFifoCnt_n && noQueuedWrites) begin 
				// Cnt align with roff_data_r
	        errWrite_n= ~noWrite;  // confirm at nxt cycle errWrite
	        rst_noWrite_n= noWrite; 
                nextPacketState = ERR_HANDLE_1;
	    end
  	  end

  	ERR_HANDLE_1:  // read off roff until good sop
	  begin
	    if(rdEQrcvFifoCnt_n) begin 
				// Cnt align with roff_data_r
				// check if next sop (good pkt)
	      if(roff_data_r[`ROFF_SOP] & ~roff_data_r[`ROFF_ABORT] 
	 	 & ~roff_data_r[`ROFF_EOP] & ~roff_uc_r) begin
	        rst_pktAbort_n= 1'b1;
	        force_ld_ControlHdr= 1'b1;
                nextPacketState = DECODE_CONTROL_HDR;
                clrEnableFifoWrite = 1'b1;
	      end
	      else readFifo= ~ReOrderFifoEmpty;  // continue to read	
	    end
  	  end
      endcase
  end

/*--------------------------------------------------------------*/
// End of Packet Assembly State Machine
/*--------------------------------------------------------------*/


  always @(posedge SysClk) begin
    if(!Reset_L) begin
      roff_dv_r<= #`SD 1'b0;	
      roff_dv_r_dup<= #`SD 18'h0;	
      roff_data_abort_r<= #`SD 1'b0;	
      roff_uc_r<= #`SD 1'b0;
      roff_dv_nc_r<= #`SD 1'b0;	
    end
    else begin
      roff_dv_r<= #`SD ReOrderFifoDataValid & ~set_pktAbort_n & ~pktAbort;
		// stop valid data to proc pipe if in abort mode
      roff_dv_r_dup<= #`SD {18{(ReOrderFifoDataValid & ~set_pktAbort_n & ~pktAbort)}};	
		// stop valid data to proc pipe if in abort mode
      roff_data_abort_r<= #`SD PacketAssyEngineDataIn[`ROFF_ABORT];	
      roff_uc_r<= #`SD ReOrderUnCorrectError & ~DisableEccCheking;
      roff_dv_nc_r<= #`SD ReOrderFifoDataValid; // non-conditioned roff data valid 
    end
  end

  always @(posedge SysClk)
    if (!Reset_L)                  roff_data_r<= #`SD 136'h0;
    else if (ReOrderFifoDataValid) roff_data_r<= #`SD PacketAssyEngineDataIn;

  assign StartTCPChecksum_n= ba_sop & cksen;
  assign ChecksumPacketDone_n= ba_eop & cksen; 

  always @(posedge SysClk)
    if(!Reset_L) begin 
      StartTCPChecksum<=  #`SD 1'b0;
      ChecksumPacketDone<=  #`SD 1'b0;
    end
    else begin // add stage to match StoreForwardFifoWrite 
	// stage added to reduce logic stage for synth timing purpose
      StartTCPChecksum<=  #`SD StartTCPChecksum_n;
      ChecksumPacketDone<=  #`SD ChecksumPacketDone_n;
    end
    

wire 		roffDataValid= roff_dv_r;
wire [135:0] 	roffDataOut= roff_data_r;
wire [17:0]	roffDataValid_dup= roff_dv_r_dup;


// *****************************
// ff sop (ctrl_hdr, pkt_data)
// *****************************
  reg		startOfPkt;
  always @(posedge SysClk) begin
    if (!Reset_L)                startOfPkt <= #`SD 1'b0;
    else if (setEnableFifoWrite_r)      startOfPkt <= #`SD 1'b1; 
		// current ff_data is ctrl hdr; next ff_data is sop; 
    else if (roffDataValid) startOfPkt <= #`SD 1'b0;
  end


// *****************************
// pkt data sop
// *****************************
  reg		startHdr;
  always @(posedge SysClk) begin
    if (!Reset_L)                startHdr <= #`SD 1'b0;
    else if (loadControlHeader)      startHdr <= #`SD 1'b1; 
	     	// current ff_data (non-flop) is ctrl hdr; 
		// next ff_data (non-flop) is sop; 
		// loading ff_data (non-flop) to ctrlHeader reg; 
		// eval logic look at roffData (flopped) at 
		// startHdr assert cycle 
    else if (roffDataValid) startHdr <= #`SD 1'b0;
  end


// *****************************
// ff eop
// *****************************
  reg pktProc; // use pktProc to avoid sampling roffDataValid of ctrl_hdr's 
	// hdr...data_sop_r....data_eop_r
	//    |------------------------|  
	//
  reg [15:0] pktProc_dup;

  wire [4:0] ff_byteOffset;
  wire [4:0] force_ff_byteOffset_n= (roffDataValid)?  // zero out in invalid data state
			{~(|ff_byteOffset[3:0]), ff_byteOffset[3:0]} : 5'h0;
					// force 5'd16 if 0

  reg [13:0] 	pktLength; // pktlen at each ro_fifo read

  wire [13:0] pktLength_n= pktLength - {9'h0, force_ff_byteOffset_n};
	// pktLength_n can also be used in readFifo logic;
	// at time when (rcv==order) && (rdCnt==0), if remain length >16B,
	// update rdCnt to remain 16B in order to make bursty reads;
	//

		// pktLength valid only after setEnableFifoWrite
  wire	endOfPkt_n= pktProc && roffDataValid && (pktLength <= {9'h0, force_ff_byteOffset_n});
  wire	decPktLength= pktProc & roffDataValid & !endOfPkt_n;


  always @ (posedge SysClk) begin 
    if (!Reset_L) pktLength <= 14'h0;
    else if(setEnableFifoWrite_r) 
    	 pktLength <= #`SD adj_ctrlhdr_pktlen_n;
			// control header pktlen field load
	// ???? gather list is  ntw_pktlen + ctrlHdr + pad
	//  controlHeader[`TOT_XFER_LENGTH] - {9'h0, 5'd16} - {9'h0, ff_pktpad_n};  
	//  right now tb's pktlen in ctrlhdr field is ntw_pktlen   
	//
    else if(decPktLength)
         pktLength <= #`SD pktLength_n;
  end 	// always

// *****************************
// pkt proc bit; valid after pkt ctrl_hdr; 
// ctrl_hdr...sop... eop; include ..or.. before sop
// pkt proc deassert when pkt abort (one cycle later)
// *****************************
  always @(posedge SysClk) begin
    if (!Reset_L) begin
      pktProc <= #`SD 1'b0;
      pktProc_dup <= #`SD 16'h0;
    end
    else begin
      if (setEnableFifoWrite_r) begin
        pktProc <= #`SD 1'b1; 
        pktProc_dup <= #`SD 16'hffff; 
      end
      else begin
        if ((endOfPkt_n & pktProc) || set_pktAbort_n) begin
	     pktProc <= #`SD 1'b0;	
	     pktProc_dup <= #`SD 16'h0;	
        end
      end
    end
  end

// *****************************
//  pkt abort
// *****************************
  assign set_pktAbort_n= (roffDataOut[`ROFF_ABORT] | missing_sop_err_n | 
			  premature_sop_err_n | eop_err_n) & roffDataValid;
		// roffDataValid (roff_dv_r) reset by set_pktAbort_n, 
		// pktAbort in subsequent cycles;
  assign set_pktAbort_dup_n[0]= (roffDataOut[`ROFF_ABORT] | missing_sop_err_n | 
			  premature_sop_err_n | eop_err_n) & roffDataValid_dup[0];
  assign set_pktAbort_dup_n[1]= (roffDataOut[`ROFF_ABORT] | missing_sop_err_n | 
			  premature_sop_err_n | eop_err_n) & roffDataValid_dup[1];
  assign set_pktAbort_dup_n[2]= (roffDataOut[`ROFF_ABORT] | missing_sop_err_n | 
			  premature_sop_err_n | eop_err_n) & roffDataValid_dup[2];
  assign set_pktAbort_dup_n[3]= (roffDataOut[`ROFF_ABORT] | missing_sop_err_n | 
			  premature_sop_err_n | eop_err_n) & roffDataValid_dup[3];
  assign set_pktAbort_dup_n[4]= (roffDataOut[`ROFF_ABORT] | missing_sop_err_n | 
			  premature_sop_err_n | eop_err_n) & roffDataValid_dup[4];
  assign set_pktAbort_dup_n[5]= (roffDataOut[`ROFF_ABORT] | missing_sop_err_n | 
			  premature_sop_err_n | eop_err_n) & roffDataValid_dup[5];
  assign set_pktAbort_dup_n[6]= (roffDataOut[`ROFF_ABORT] | missing_sop_err_n | 
			  premature_sop_err_n | eop_err_n) & roffDataValid_dup[6];
  assign set_pktAbort_dup_n[7]= (roffDataOut[`ROFF_ABORT] | missing_sop_err_n | 
			  premature_sop_err_n | eop_err_n) & roffDataValid_dup[7];
  assign set_pktAbort_dup_n[8]= (roffDataOut[`ROFF_ABORT] | missing_sop_err_n | 
			  premature_sop_err_n | eop_err_n) & roffDataValid_dup[8];
  assign set_pktAbort_dup_n[9]= (roffDataOut[`ROFF_ABORT] | missing_sop_err_n | 
			  premature_sop_err_n | eop_err_n) & roffDataValid_dup[9];
  assign set_pktAbort_dup_n[10]= (roffDataOut[`ROFF_ABORT] | missing_sop_err_n | 
			  premature_sop_err_n | eop_err_n) & roffDataValid_dup[10];
  assign set_pktAbort_dup_n[11]= (roffDataOut[`ROFF_ABORT] | missing_sop_err_n | 
			  premature_sop_err_n | eop_err_n) & roffDataValid_dup[11];
  assign set_pktAbort_dup_n[12]= (roffDataOut[`ROFF_ABORT] | missing_sop_err_n | 
			  premature_sop_err_n | eop_err_n) & roffDataValid_dup[12];
  assign set_pktAbort_dup_n[13]= (roffDataOut[`ROFF_ABORT] | missing_sop_err_n | 
			  premature_sop_err_n | eop_err_n) & roffDataValid_dup[13];
  assign set_pktAbort_dup_n[14]= (roffDataOut[`ROFF_ABORT] | missing_sop_err_n | 
			  premature_sop_err_n | eop_err_n) & roffDataValid_dup[14];
  assign set_pktAbort_dup_n[15]= (roffDataOut[`ROFF_ABORT] | missing_sop_err_n | 
			  premature_sop_err_n | eop_err_n) & roffDataValid_dup[15];
  assign set_pktAbort_dup_n[16]= (roff_data_abort_r | missing_sop_err_n | 
			  premature_sop_err_n | eop_err_n) & roffDataValid_dup[16];
  assign set_pktAbort_dup_n[17]= (roff_data_abort_r | missing_sop_err_n | 
			  premature_sop_err_n | eop_err_n) & roffDataValid_dup[17];

  always @(posedge SysClk) begin
    if (!Reset_L)                pktAbort <= #`SD 1'b0;
    else if (set_pktAbort_n)  	pktAbort <= #`SD 1'b1; 
    else if (rst_pktAbort_n)   	pktAbort <= #`SD 1'b0;	
  end

// *****************************
// assign roff 
// *****************************
  wire  roff_soh_n= roffDataOut[`ROFF_SOP] & roffDataValid; 

 // temp put 0; use below when ro_fifo sop fix ????
 // assign  missing_sop_err_n=  1'b0;
 // assign premature_sop_err_n= 1'b0;
  assign  missing_sop_err_n=  roffDataValid & startHdr & (~roffDataOut[`ROFF_SOP] | roff_uc_r);
			// start of pkt hdr; no sop at ff; 
			// ignore this error at pktAbort state;
			// roffDataValid is conditioned to '0' in pktAbort state;
			// sop in roff align with ctrlHeader	
			// err if data (ctrl hdr) not shown sop 
  assign premature_sop_err_n= roff_soh_n & pktProc;
			// mid of pkt process; not expecting sop;
			// err valid only if in pktProc mode;
			// pktProc also get reset at set_pktAbort_n

  wire 	ff_sop= startOfPkt; // calc version of sop (start of pkt data)
			    // use by data pipe 

  wire	roff_eop_n= (roffDataOut[`ROFF_EOP] & roffDataValid); 
  wire 	ff_eop= endOfPkt_n; // calc version of eop

  // temp put 0; use below when ro_fifo eop fix ????
  // assign eop_err_n= 1'b0;
  assign  eop_err_n= (roff_eop_n ^ endOfPkt_n) & pktProc & roffDataValid;
		// eop not match between calc and roff;
		// err valid only if in pktProc mode and roff dv;
		// pktProc also get reset at set_pktAbort_n

  // ???  at sop, start of ethernet pkt might have pad;
  // ctrlHeader[2:0] in 2 bytes unit -> byteOffset to load 
  // to byteOffset_1
  // also need to rotatte data to right align 
  //
  assign ff_pktpad_n= {1'b0, controlHeader[`CTRLHDR_STARTPKT_PAD], 1'b0}; 
						// convert to bytes;
						// original field in 2B unit
  wire ff_pad_n= |ff_pktpad_n; // pkt is padded

  wire [127:0] ff_pktData_padshift_n= genRemInPkt(ff_pktpad_n, roffDataOut[`ROFF_PKTDATA]);
						// right align data if padded

  wire [127:0] ff_pktData= (ff_sop & ff_pad_n)? ff_pktData_padshift_n : 
						roffDataOut[`ROFF_PKTDATA];

  assign      ff_byteOffset= (ff_sop & ff_pad_n)? 
			(5'd16 - ff_pktpad_n) : // convert pad to valid byte offset 
				roffDataOut[`ROFF_BYTEOFFSET];

/*
  // without pad
  wire [127:0] ff_pktData= roffDataOut[`ROFF_PKTDATA];
  assign      ff_byteOffset= 	roffDataOut[`ROFF_BYTEOFFSET];
*/

	//  detect bad parity on inbound roff_data_r
//  wire [15:0] ff_pktDataEcc= roffDataOut[`ROFF_PKTDATA_ECC];
//  assign roff_parity_err_n= |(ff_pktDataEcc ^ calc_roff_parity_n); 
	// ??? currently this field is zero

	
// *****************************
// registered roff;  stage 1
// *****************************
  reg dv_1;
  reg [15:0] dv_dup_1;
  reg sop_1;
  reg eop_1;
  reg [4:0] byteOffset_1;
  reg [127:0] pktData_1;
  always @(posedge SysClk) begin
    if(!Reset_L) begin
      dv_1 <=  #`SD 1'b0;
      dv_dup_1 <=  #`SD 16'h0;
      sop_1 <=  #`SD 1'b0;
      eop_1 <=  #`SD 1'b0;
      byteOffset_1 <=  #`SD 5'h0;
      pktData_1 <= #`SD 128'h0;
    end
    else begin
      dv_1 <=  #`SD roffDataValid & pktProc & ~set_pktAbort_n; 
      dv_dup_1 <=  #`SD {16{roffDataValid & pktProc & ~set_pktAbort_n}}; 
			// do not want bad pkt to go into pipe
      sop_1 <=  #`SD ff_sop & roffDataValid & pktProc & ~set_pktAbort_n;
      eop_1 <=  #`SD ff_eop & roffDataValid & pktProc & ~set_pktAbort_n;
      if(roffDataValid & pktProc & ~set_pktAbort_n) begin
        byteOffset_1 <=  #`SD force_ff_byteOffset_n; // force 5'd16 if 0
      end
      if(roffDataValid_dup[0] & pktProc_dup[0] & ~set_pktAbort_dup_n[0]) begin
        pktData_1[`TXC_B0] <= #`SD ff_pktData[`TXC_B0];
      end
      if(roffDataValid_dup[1] & pktProc_dup[1] & ~set_pktAbort_dup_n[1]) begin
        pktData_1[`TXC_B1] <= #`SD ff_pktData[`TXC_B1];
      end
      if(roffDataValid_dup[2] & pktProc_dup[2] & ~set_pktAbort_dup_n[2]) begin
        pktData_1[`TXC_B2] <= #`SD ff_pktData[`TXC_B2];
      end
      if(roffDataValid_dup[3] & pktProc_dup[3] & ~set_pktAbort_dup_n[3]) begin
        pktData_1[`TXC_B3] <= #`SD ff_pktData[`TXC_B3];
      end
      if(roffDataValid_dup[4] & pktProc_dup[4] & ~set_pktAbort_dup_n[4]) begin
        pktData_1[`TXC_B4] <= #`SD ff_pktData[`TXC_B4];
      end
      if(roffDataValid_dup[5] & pktProc_dup[5] & ~set_pktAbort_dup_n[5]) begin
        pktData_1[`TXC_B5] <= #`SD ff_pktData[`TXC_B5];
      end
      if(roffDataValid_dup[6] & pktProc_dup[6] & ~set_pktAbort_dup_n[6]) begin
        pktData_1[`TXC_B6] <= #`SD ff_pktData[`TXC_B6];
      end
      if(roffDataValid_dup[7] & pktProc_dup[7] & ~set_pktAbort_dup_n[7]) begin
        pktData_1[`TXC_B7] <= #`SD ff_pktData[`TXC_B7];
      end
      if(roffDataValid_dup[8] & pktProc_dup[8] & ~set_pktAbort_dup_n[8]) begin
        pktData_1[`TXC_B8] <= #`SD ff_pktData[`TXC_B8];
      end
      if(roffDataValid_dup[9] & pktProc_dup[9] & ~set_pktAbort_dup_n[9]) begin
        pktData_1[`TXC_B9] <= #`SD ff_pktData[`TXC_B9];
      end
      if(roffDataValid_dup[10] & pktProc_dup[10] & ~set_pktAbort_dup_n[10]) begin
        pktData_1[`TXC_B10] <= #`SD ff_pktData[`TXC_B10];
      end
      if(roffDataValid_dup[11] & pktProc_dup[11] & ~set_pktAbort_dup_n[11]) begin
        pktData_1[`TXC_B11] <= #`SD ff_pktData[`TXC_B11];
      end
      if(roffDataValid_dup[12] & pktProc_dup[12] & ~set_pktAbort_dup_n[12]) begin
        pktData_1[`TXC_B12] <= #`SD ff_pktData[`TXC_B12];
      end
      if(roffDataValid_dup[13] & pktProc_dup[13] & ~set_pktAbort_dup_n[13]) begin
        pktData_1[`TXC_B13] <= #`SD ff_pktData[`TXC_B13];
      end
      if(roffDataValid_dup[14] & pktProc_dup[14] & ~set_pktAbort_dup_n[14]) begin
        pktData_1[`TXC_B14] <= #`SD ff_pktData[`TXC_B14];
      end
      if(roffDataValid_dup[15] & pktProc_dup[15] & ~set_pktAbort_dup_n[15]) begin
        pktData_1[`TXC_B15] <= #`SD ff_pktData[`TXC_B15];
      end
    end
  end

// ***************************** 
// registered stage 2; mux data
// ***************************** 
  reg dv_2;
  reg sop_2;
  reg eop_2;
//  reg [4:0] byteOffset_2;
  reg [127:0] pktData_2;
  always @(posedge SysClk) begin
    if(!Reset_L) begin
      dv_2 <=  #`SD 1'b0;
      sop_2 <=  #`SD 1'b0;
      eop_2 <=  #`SD 1'b0;
//      byteOffset_2 <=  #`SD 5'h0;
      pktData_2 <= #`SD 128'h0;
    end
    else begin
      dv_2 <=  #`SD dv_1;
      sop_2 <=  #`SD sop_1;
      eop_2 <=  #`SD eop_1;
/*
      if(dv_1) begin
        byteOffset_2 <=  #`SD byteOffset_1;
      end
*/
      if(dv_dup_1[0]) pktData_2[`TXC_B0] <= #`SD pktData_1[`TXC_B0];
      if(dv_dup_1[1]) pktData_2[`TXC_B1] <= #`SD pktData_1[`TXC_B1];
      if(dv_dup_1[2]) pktData_2[`TXC_B2] <= #`SD pktData_1[`TXC_B2];
      if(dv_dup_1[3]) pktData_2[`TXC_B3] <= #`SD pktData_1[`TXC_B3];
      if(dv_dup_1[4]) pktData_2[`TXC_B4] <= #`SD pktData_1[`TXC_B4];
      if(dv_dup_1[5]) pktData_2[`TXC_B5] <= #`SD pktData_1[`TXC_B5];
      if(dv_dup_1[6]) pktData_2[`TXC_B6] <= #`SD pktData_1[`TXC_B6];
      if(dv_dup_1[7]) pktData_2[`TXC_B7] <= #`SD pktData_1[`TXC_B7];
      if(dv_dup_1[8]) pktData_2[`TXC_B8] <= #`SD pktData_1[`TXC_B8];
      if(dv_dup_1[9]) pktData_2[`TXC_B9] <= #`SD pktData_1[`TXC_B9];
      if(dv_dup_1[10]) pktData_2[`TXC_B10] <= #`SD pktData_1[`TXC_B10];
      if(dv_dup_1[11]) pktData_2[`TXC_B11] <= #`SD pktData_1[`TXC_B11];
      if(dv_dup_1[12]) pktData_2[`TXC_B12] <= #`SD pktData_1[`TXC_B12];
      if(dv_dup_1[13]) pktData_2[`TXC_B13] <= #`SD pktData_1[`TXC_B13];
      if(dv_dup_1[14]) pktData_2[`TXC_B14] <= #`SD pktData_1[`TXC_B14];
      if(dv_dup_1[15]) pktData_2[`TXC_B15] <= #`SD pktData_1[`TXC_B15];
    end
  end

// ***************************** 
// 	byteOffsetStored
// ***************************** 
  reg [4:0] byteOffsetStored_1;	// update at stage 1
  reg [4:0] byteOffsetStored_2;	// use with stage 2

  wire [4:0] byteOffsetSum_n= byteOffsetStored_1 + byteOffset_1;
  wire sumGT16_n=  byteOffsetSum_n[4] & (|byteOffsetSum_n[3:0]);
  wire sumEQ16_n= (byteOffsetSum_n==5'h10) ||
		  (byteOffsetSum_n==5'h0); // in case 0==16B
  wire sumLT16_n= ~byteOffsetSum_n[4] & (|byteOffsetSum_n[3:0]);
				// lt 16B and not 0
  wire [4:0] sumDiff_n= (sumGT16_n)? 
				(byteOffsetSum_n - 5'h10):
				(5'h10 - byteOffsetSum_n);

			// value to update byteOffsetStored_1
  wire [4:0] byteOffsetStored_n= (sumEQ16_n)? 5'h0 : 
			((sumLT16_n)? byteOffsetSum_n : sumDiff_n);


  always @(posedge SysClk) begin
    if(!Reset_L) begin
      byteOffsetStored_1<= #`SD 5'h0;
      byteOffsetStored_2<= #`SD 5'h0;
    end
    else begin
      if(roffDataValid & ff_sop) begin // reset at sop
        byteOffsetStored_1<= #`SD 5'h0;
      end
      else begin // update on each dv1
	if(dv_1) byteOffsetStored_1<= #`SD byteOffsetStored_n;
      end	
      byteOffsetStored_2<= #`SD byteOffsetStored_1;
    end 
  end

// ***************************** 
// control to update pktDataStored 
// ***************************** 
  reg mergeStored_2; 
  reg replaceStored_2; // replace with remain in pktData_2
  reg clearStored_2;
  wire [4:0] byteToUseInPktData_n= 5'h10 - byteOffsetStored_1;
  reg [4:0] byteToUseInPktData_2; // use in pktData select

  always @(posedge SysClk) begin
    if(!Reset_L) begin
      mergeStored_2<= #`SD 1'b0;
      replaceStored_2<= #`SD 1'b0;
      clearStored_2<= #`SD 1'b0;
      byteToUseInPktData_2<= #`SD 5'h0;
    end
    else begin
      if(dv_1) begin
	mergeStored_2<= #`SD sumLT16_n;
	replaceStored_2<= #`SD sumGT16_n;
	clearStored_2<= #`SD sumEQ16_n;
        byteToUseInPktData_2<= #`SD byteToUseInPktData_n;
      end
    end
  end

  reg dv_3;	// dv fwd to chksum
  reg [15:0] dv_dup_3;
  reg sop_3;	// sop fwd to chksum
  reg eop_3;	// eop fwd to chksum

// ***************************** 
// stored pkt and info for next alignment
// ***************************** 
  reg 	sopStored_2;	//  use with stage 2
  reg 	eopStored_2;	//  use with stage 2
  reg [15:0] eopStored_2_dup;
  reg [127:0] pktDataStored_2;  // use with stage 2


	// pkt data to forward to next stage
wire[127:0]  pktData_n= genPktData(byteToUseInPktData_2,
			     pktData_2, pktDataStored_2);
wire [127:0] mergePkt_n= genMergePkt(byteOffsetStored_2,
				pktData_2, pktDataStored_2);
wire [127:0] remInPkt_n= genRemInPkt(byteToUseInPktData_2, pktData_2);

  wire sopStored_n= (sop_2 & mergeStored_2 & ~eop_2);  // current is sop
  wire eopStored_n= eop_2 & replaceStored_2;

  wire sop_3_n= (dv_2 & sop_2 & ~sopStored_n) | 	// current is sop_2 
		(dv_2 & sopStored_2 & ~mergeStored_2) | // current not sop_2; use sopStored_2   
		(dv_2 & sopStored_2 & eop_2);	// if eop_2, push sopStored
  wire eop_3_n= (dv_2 & eop_2 & ~eopStored_n) | 	// current is eop_2
		(eopStored_2);		// (not eop_2) use last remain line
  wire dv_3_n= (dv_2 & ~(mergeStored_2 & ~eop_2)); // skip dv only if merge and not eop 
					// no dv for extra eop cycle; use eopStored

  always @(posedge SysClk) begin
    if(!Reset_L) begin
      sopStored_2<= #`SD 1'b0;
      eopStored_2<= #`SD 1'b0;
      eopStored_2_dup<= #`SD 16'h0;
      pktDataStored_2<= #`SD 128'h0;
    end
    else begin
      if((sop_3_n && dv_3_n) || setEnableFifoWrite_r) begin // reset stored sop
						// clear bit at start
        sopStored_2<= #`SD 1'b0;
      end
      else if(sop_2 & dv_2) sopStored_2<= #`SD sopStored_n;

      if(eop_3_n || setEnableFifoWrite_r) begin // reset for next pkt
					// clear bit at start
        eopStored_2<= #`SD 1'b0;
        eopStored_2_dup<= #`SD 16'h0;
      end
      else if(eop_2 & dv_2) begin
        eopStored_2<= #`SD eopStored_n;
        eopStored_2_dup<= #`SD {16{eopStored_n}};
      end

      if(eop_3_n || setEnableFifoWrite_mr[0]) begin // reset for next pkt
					// clear bit at start	
        pktDataStored_2[`TXC_B0]<= #`SD 8'h0;
      end
      else if(dv_2)  pktDataStored_2[`TXC_B0]<= #`SD (clearStored_2)? 8'h0 : 
			((mergeStored_2)? mergePkt_n[`TXC_B0] : remInPkt_n[`TXC_B0]);

      if(eop_3_n || setEnableFifoWrite_mr[1]) begin // reset for next pkt
					// clear bit at start	
        pktDataStored_2[`TXC_B1]<= #`SD 8'h0;
      end
      else if(dv_2)  pktDataStored_2[`TXC_B1]<= #`SD (clearStored_2)? 8'h0 : 
			((mergeStored_2)? mergePkt_n[`TXC_B1] : remInPkt_n[`TXC_B1]);

      if(eop_3_n || setEnableFifoWrite_mr[2]) begin // reset for next pkt
					// clear bit at start	
        pktDataStored_2[`TXC_B2]<= #`SD 8'h0;
      end
      else if(dv_2)  pktDataStored_2[`TXC_B2]<= #`SD (clearStored_2)? 8'h0 : 
			((mergeStored_2)? mergePkt_n[`TXC_B2] : remInPkt_n[`TXC_B2]);

      if(eop_3_n || setEnableFifoWrite_mr[3]) begin // reset for next pkt
					// clear bit at start	
        pktDataStored_2[`TXC_B3]<= #`SD 8'h0;
      end
      else if(dv_2)  pktDataStored_2[`TXC_B3]<= #`SD (clearStored_2)? 8'h0 : 
			((mergeStored_2)? mergePkt_n[`TXC_B3] : remInPkt_n[`TXC_B3]);

      if(eop_3_n || setEnableFifoWrite_mr[4]) begin // reset for next pkt
					// clear bit at start	
        pktDataStored_2[`TXC_B4]<= #`SD 8'h0;
      end
      else if(dv_2)  pktDataStored_2[`TXC_B4]<= #`SD (clearStored_2)? 8'h0 : 
			((mergeStored_2)? mergePkt_n[`TXC_B4] : remInPkt_n[`TXC_B4]);

      if(eop_3_n || setEnableFifoWrite_mr[5]) begin // reset for next pkt
					// clear bit at start	
        pktDataStored_2[`TXC_B5]<= #`SD 8'h0;
      end
      else if(dv_2)  pktDataStored_2[`TXC_B5]<= #`SD (clearStored_2)? 8'h0 : 
			((mergeStored_2)? mergePkt_n[`TXC_B5] : remInPkt_n[`TXC_B5]);

      if(eop_3_n || setEnableFifoWrite_mr[6]) begin // reset for next pkt
					// clear bit at start	
        pktDataStored_2[`TXC_B6]<= #`SD 8'h0;
      end
      else if(dv_2)  pktDataStored_2[`TXC_B6]<= #`SD (clearStored_2)? 8'h0 : 
			((mergeStored_2)? mergePkt_n[`TXC_B6] : remInPkt_n[`TXC_B6]);

      if(eop_3_n || setEnableFifoWrite_mr[7]) begin // reset for next pkt
					// clear bit at start	
        pktDataStored_2[`TXC_B7]<= #`SD 8'h0;
      end
      else if(dv_2)  pktDataStored_2[`TXC_B7]<= #`SD (clearStored_2)? 8'h0 : 
			((mergeStored_2)? mergePkt_n[`TXC_B7] : remInPkt_n[`TXC_B7]);

      if(eop_3_n || setEnableFifoWrite_mr[8]) begin // reset for next pkt
					// clear bit at start	
        pktDataStored_2[`TXC_B8]<= #`SD 8'h0;
      end
      else if(dv_2)  pktDataStored_2[`TXC_B8]<= #`SD (clearStored_2)? 8'h0 : 
			((mergeStored_2)? mergePkt_n[`TXC_B8] : remInPkt_n[`TXC_B8]);

      if(eop_3_n || setEnableFifoWrite_mr[9]) begin // reset for next pkt
					// clear bit at start	
        pktDataStored_2[`TXC_B9]<= #`SD 8'h0;
      end
      else if(dv_2)  pktDataStored_2[`TXC_B9]<= #`SD (clearStored_2)? 8'h0 : 
			((mergeStored_2)? mergePkt_n[`TXC_B9] : remInPkt_n[`TXC_B9]);

      if(eop_3_n || setEnableFifoWrite_mr[10]) begin // reset for next pkt
					// clear bit at start	
        pktDataStored_2[`TXC_B10]<= #`SD 8'h0;
      end
      else if(dv_2)  pktDataStored_2[`TXC_B10]<= #`SD (clearStored_2)? 8'h0 : 
			((mergeStored_2)? mergePkt_n[`TXC_B10] : remInPkt_n[`TXC_B10]);

      if(eop_3_n || setEnableFifoWrite_mr[11]) begin // reset for next pkt
					// clear bit at start	
        pktDataStored_2[`TXC_B11]<= #`SD 8'h0;
      end
      else if(dv_2)  pktDataStored_2[`TXC_B11]<= #`SD (clearStored_2)? 8'h0 : 
			((mergeStored_2)? mergePkt_n[`TXC_B11] : remInPkt_n[`TXC_B11]);

      if(eop_3_n || setEnableFifoWrite_mr[12]) begin // reset for next pkt
					// clear bit at start	
        pktDataStored_2[`TXC_B12]<= #`SD 8'h0;
      end
      else if(dv_2)  pktDataStored_2[`TXC_B12]<= #`SD (clearStored_2)? 8'h0 : 
			((mergeStored_2)? mergePkt_n[`TXC_B12] : remInPkt_n[`TXC_B12]);

      if(eop_3_n || setEnableFifoWrite_mr[13]) begin // reset for next pkt
					// clear bit at start	
        pktDataStored_2[`TXC_B13]<= #`SD 8'h0;
      end
      else if(dv_2)  pktDataStored_2[`TXC_B13]<= #`SD (clearStored_2)? 8'h0 : 
			((mergeStored_2)? mergePkt_n[`TXC_B13] : remInPkt_n[`TXC_B13]);

      if(eop_3_n || setEnableFifoWrite_mr[14]) begin // reset for next pkt
					// clear bit at start	
        pktDataStored_2[`TXC_B14]<= #`SD 8'h0;
      end
      else if(dv_2)  pktDataStored_2[`TXC_B14]<= #`SD (clearStored_2)? 8'h0 : 
			((mergeStored_2)? mergePkt_n[`TXC_B14] : remInPkt_n[`TXC_B14]);

      if(eop_3_n || setEnableFifoWrite_mr[15]) begin // reset for next pkt
					// clear bit at start	
        pktDataStored_2[`TXC_B15]<= #`SD 8'h0;
      end
      else if(dv_2)  pktDataStored_2[`TXC_B15]<= #`SD (clearStored_2)? 8'h0 : 
			((mergeStored_2)? mergePkt_n[`TXC_B15] : remInPkt_n[`TXC_B15]);
    end // not reset
  end  // always


// ***************************** 
// pkt forward to sf_fifo, chksum; stage 3 
// ***************************** 
  wire remLastInStored_n= eopStored_2; 	
  wire [15:0] remLastInStored_dup_n= eopStored_2_dup; 	
//  wire ld_pktData_3_n= dv_3_n | remLastInStored_n;
  wire [15:0] ld_pktData_3_dup_n;

  assign ld_pktData_3_dup_n= {16{dv_3_n}} | remLastInStored_dup_n;

  wire [127:0] pktData_3_n;
  assign pktData_3_n [7:0]= (remLastInStored_dup_n[0])?
                        	pktDataStored_2 [7:0]: pktData_n [7:0];

  assign pktData_3_n [15:8]= (remLastInStored_dup_n[1])?
                        	pktDataStored_2 [15:8]: pktData_n [15:8];

  assign pktData_3_n [23:16]= (remLastInStored_dup_n[2])?
                        	pktDataStored_2 [23:16]: pktData_n [23:16];

  assign pktData_3_n [31:24]= (remLastInStored_dup_n[3])?
                        	pktDataStored_2 [31:24]: pktData_n [31:24];

  assign pktData_3_n [39:32]= (remLastInStored_dup_n[4])?
                        	pktDataStored_2 [39:32]: pktData_n [39:32];

  assign pktData_3_n [47:40]= (remLastInStored_dup_n[5])?
                        	pktDataStored_2 [47:40]: pktData_n [47:40];

  assign pktData_3_n [55:48]= (remLastInStored_dup_n[6])?
                        	pktDataStored_2 [55:48]: pktData_n [55:48];

  assign pktData_3_n [63:56]= (remLastInStored_dup_n[7])?
                        	pktDataStored_2 [63:56]: pktData_n [63:56];

  assign pktData_3_n [71:64]= (remLastInStored_dup_n[8])?
                        	pktDataStored_2 [71:64]: pktData_n [71:64];

  assign pktData_3_n [79:72]= (remLastInStored_dup_n[9])?
                        	pktDataStored_2 [79:72]: pktData_n [79:72];

  assign pktData_3_n [87:80]= (remLastInStored_dup_n[10])?
                        	pktDataStored_2 [87:80]: pktData_n [87:80];

  assign pktData_3_n [95:88]= (remLastInStored_dup_n[11])?
                        	pktDataStored_2 [95:88]: pktData_n [95:88];

  assign pktData_3_n [103:96]= (remLastInStored_dup_n[12])?
                        	pktDataStored_2 [103:96]: pktData_n [103:96];

  assign pktData_3_n [111:104]= (remLastInStored_dup_n[13])?
                        	pktDataStored_2 [111:104]: pktData_n [111:104];

  assign pktData_3_n [119:112]= (remLastInStored_dup_n[14])?
                        	pktDataStored_2 [119:112]: pktData_n [119:112];

  assign pktData_3_n [127:120]= (remLastInStored_dup_n[15])?
                        	pktDataStored_2 [127:120]: pktData_n [127:120];


  reg [127:0] pktData_3;
  always @(posedge SysClk) begin
    if(!Reset_L) begin
      sop_3<= #`SD  1'b0;
      eop_3<= #`SD  1'b0;
      dv_3<= #`SD  1'b0;
      dv_dup_3<= #`SD  16'h0;
      pktData_3<= #`SD 128'h0;
    end
    else begin
      sop_3<= #`SD  sop_3_n;
      eop_3<= #`SD  eop_3_n;
      dv_3<= #`SD  dv_3_n | remLastInStored_n;
      dv_dup_3<= #`SD  {16{dv_3_n | remLastInStored_n}};
      if(ld_pktData_3_dup_n[0])  pktData_3[7:0]<= #`SD pktData_3_n[7:0];
      if(ld_pktData_3_dup_n[1])  pktData_3[15:8]<= #`SD pktData_3_n[15:8];
      if(ld_pktData_3_dup_n[2])  pktData_3[23:16]<= #`SD pktData_3_n[23:16];
      if(ld_pktData_3_dup_n[3])  pktData_3[31:24]<= #`SD pktData_3_n[31:24];
      if(ld_pktData_3_dup_n[4])  pktData_3[39:32]<= #`SD pktData_3_n[39:32];
      if(ld_pktData_3_dup_n[5])  pktData_3[47:40]<= #`SD pktData_3_n[47:40];
      if(ld_pktData_3_dup_n[6])  pktData_3[55:48]<= #`SD pktData_3_n[55:48];
      if(ld_pktData_3_dup_n[7])  pktData_3[63:56]<= #`SD pktData_3_n[63:56];
      if(ld_pktData_3_dup_n[8])  pktData_3[71:64]<= #`SD pktData_3_n[71:64];
      if(ld_pktData_3_dup_n[9])  pktData_3[79:72]<= #`SD pktData_3_n[79:72];
      if(ld_pktData_3_dup_n[10])  pktData_3[87:80]<= #`SD pktData_3_n[87:80];
      if(ld_pktData_3_dup_n[11])  pktData_3[95:88]<= #`SD pktData_3_n[95:88];
      if(ld_pktData_3_dup_n[12])  pktData_3[103:96]<= #`SD pktData_3_n[103:96];
      if(ld_pktData_3_dup_n[13])  pktData_3[111:104]<= #`SD pktData_3_n[111:104];
      if(ld_pktData_3_dup_n[14])  pktData_3[119:112]<= #`SD pktData_3_n[119:112];
      if(ld_pktData_3_dup_n[15])  pktData_3[127:120]<= #`SD pktData_3_n[127:120];
    end
  end


  reg qwr_dv_1; 
  reg qwr_dv_2; 
  reg qwr_dv_3; 

  always @(posedge SysClk) begin
    if(!Reset_L) begin
      qwr_dv_1<= #`SD  1'b0;
      qwr_dv_2<= #`SD  1'b0;
      qwr_dv_3<= #`SD  1'b0;
    end
    else begin
      qwr_dv_1<= #`SD  roff_dv_nc_r; // use uncondition dv since
				     // queueWrites used in pktAbort case	
      qwr_dv_2<= #`SD  qwr_dv_1;
      qwr_dv_3<= #`SD  qwr_dv_2;
    end
  end

/*--------------------------------------------------------------*/
//  data rotation function 
/*--------------------------------------------------------------*/


function [127:0] genPktData; // LE
    input[4:0] byteOffset;
    input[127:0] pkt_a;	// pktData
    input[127:0] pkt_b; // pktDataStored
    reg [127:0] pktData_n;
  begin
    case(byteOffset)
      5'h0: pktData_n= {pkt_b};
      5'h1: pktData_n= {pkt_a[`TXC_B0], pkt_b[`TXC_B14_B0]} ;
      5'h2: pktData_n= {pkt_a[`TXC_B1_B0], pkt_b[`TXC_B13_B0]} ;
      5'h3: pktData_n= {pkt_a[`TXC_B2_B0], pkt_b[`TXC_B12_B0]} ;
      5'h4: pktData_n= {pkt_a[`TXC_B3_B0], pkt_b[`TXC_B11_B0]} ;
      5'h5: pktData_n= {pkt_a[`TXC_B4_B0], pkt_b[`TXC_B10_B0]} ;
      5'h6: pktData_n= {pkt_a[`TXC_B5_B0], pkt_b[`TXC_B9_B0]} ;
      5'h7: pktData_n= {pkt_a[`TXC_B6_B0], pkt_b[`TXC_B8_B0]} ;
      5'h8: pktData_n= {pkt_a[`TXC_B7_B0], pkt_b[`TXC_B7_B0]} ;
      5'h9: pktData_n= {pkt_a[`TXC_B8_B0], pkt_b[`TXC_B6_B0]} ;
      5'ha: pktData_n= {pkt_a[`TXC_B9_B0], pkt_b[`TXC_B5_B0]} ;
      5'hb: pktData_n= {pkt_a[`TXC_B10_B0], pkt_b[`TXC_B4_B0]} ;
      5'hc: pktData_n= {pkt_a[`TXC_B11_B0], pkt_b[`TXC_B3_B0]} ;
      5'hd: pktData_n= {pkt_a[`TXC_B12_B0], pkt_b[`TXC_B2_B0]} ;
      5'he: pktData_n= {pkt_a[`TXC_B13_B0], pkt_b[`TXC_B1_B0]} ;
      5'hf: pktData_n= {pkt_a[`TXC_B14_B0], pkt_b[`TXC_B0]} ;
      5'h10: pktData_n= {pkt_a};
      default: pktData_n= {pkt_b};
    endcase
    genPktData= pktData_n;
  end 
endfunction

	// pkt data to store for next byte align
	// choose either from mergePkt_n or remIn1Pkt_n
	// merge stored and pktData_1

function [127:0] genMergePkt;  // LE
  input[4:0] byteOffset;
  input[127:0] pkt_a;
  input[127:0] pkt_b;
  reg [127:0] mergePkt_n;

  begin
    case(byteOffset)
      5'h0: mergePkt_n= {pkt_a};
      5'h1: mergePkt_n= {pkt_a[`TXC_B14_B0], pkt_b[`TXC_B0]};
      5'h2: mergePkt_n= {pkt_a[`TXC_B13_B0], pkt_b[`TXC_B1_B0]};
      5'h3: mergePkt_n= {pkt_a[`TXC_B12_B0], pkt_b[`TXC_B2_B0]};
      5'h4: mergePkt_n= {pkt_a[`TXC_B11_B0], pkt_b[`TXC_B3_B0]};
      5'h5: mergePkt_n= {pkt_a[`TXC_B10_B0], pkt_b[`TXC_B4_B0]};
      5'h6: mergePkt_n= {pkt_a[`TXC_B9_B0], pkt_b[`TXC_B5_B0]};
      5'h7: mergePkt_n= {pkt_a[`TXC_B8_B0], pkt_b[`TXC_B6_B0]};
      5'h8: mergePkt_n= {pkt_a[`TXC_B7_B0], pkt_b[`TXC_B7_B0]};
      5'h9: mergePkt_n= {pkt_a[`TXC_B6_B0], pkt_b[`TXC_B8_B0]};
      5'ha: mergePkt_n= {pkt_a[`TXC_B5_B0], pkt_b[`TXC_B9_B0]};
      5'hb: mergePkt_n= {pkt_a[`TXC_B4_B0], pkt_b[`TXC_B10_B0]};
      5'hc: mergePkt_n= {pkt_a[`TXC_B3_B0], pkt_b[`TXC_B11_B0]};
      5'hd: mergePkt_n= {pkt_a[`TXC_B2_B0], pkt_b[`TXC_B12_B0]};
      5'he: mergePkt_n= {pkt_a[`TXC_B1_B0], pkt_b[`TXC_B13_B0]};
      5'hf: mergePkt_n= {pkt_a[`TXC_B0], pkt_b[`TXC_B14_B0]};
      default: mergePkt_n= {pkt_b};
    endcase
    genMergePkt= mergePkt_n;
  end
endfunction


function [127:0] genRemInPkt; // LE
  input [4:0] byteOffset;
  input [127:0] pkt_a; 
  reg [127:0] remInPkt_n;

  begin
    case(byteOffset)
      5'h0: remInPkt_n= {pkt_a};
      5'h1: remInPkt_n= {8'h0, pkt_a[`TXC_B15_B1]};
      5'h2: remInPkt_n= {16'h0, pkt_a[`TXC_B15_B2]};
      5'h3: remInPkt_n= {24'h0, pkt_a[`TXC_B15_B3]};
      5'h4: remInPkt_n= {32'h0, pkt_a[`TXC_B15_B4]};
      5'h5: remInPkt_n= {40'h0, pkt_a[`TXC_B15_B5]};
      5'h6: remInPkt_n= {48'h0, pkt_a[`TXC_B15_B6]};
      5'h7: remInPkt_n= {56'h0, pkt_a[`TXC_B15_B7]};
      5'h8: remInPkt_n= {64'h0, pkt_a[`TXC_B15_B8]};
      5'h9: remInPkt_n= {72'h0, pkt_a[`TXC_B15_B9]};
      5'ha: remInPkt_n= {80'h0, pkt_a[`TXC_B15_B10]};
      5'hb: remInPkt_n= {88'h0, pkt_a[`TXC_B15_B11]};
      5'hc: remInPkt_n= {96'h0, pkt_a[`TXC_B15_B12]};
      5'hd: remInPkt_n= {104'h0, pkt_a[`TXC_B15_B13]};
      5'he: remInPkt_n= {112'h0, pkt_a[`TXC_B15_B14]};
      5'hf: remInPkt_n= {120'h0, pkt_a[`TXC_B15]};
      default: remInPkt_n= {pkt_a};
    endcase
    genRemInPkt= remInPkt_n;
  end
endfunction

assign ba_sop= sop_3; 	// StartTCPChecksum= sop_3;
assign ba_eop= eop_3;	// ChecksumPacketDone= eop_3;
assign ba_dv=  dv_3;	//dChecksumValid= dv_3;
assign ba_dv_dup=  dv_dup_3;	//dChecksumValid= dv_3;
assign ba_qwr_dv= qwr_dv_3;
assign ba_data= pktData_3;	//ChecksumDataIn= pktData_3;


/*--------------------------------------------------------------*/
//  CheckSum insertion function
/*--------------------------------------------------------------*/

  function [127:0] getCksReplPktData;  // LE
    input [3:0]  byteOffset;
    input [127:0] data;
    input [15:0] cks;
    begin
      case(byteOffset)
        4'h0:  getCksReplPktData= {data[`TXC_B15_B2], cks};
        4'h1:  getCksReplPktData= {data[`TXC_B15_B3], cks, data[`TXC_B0]};
        4'h2:  getCksReplPktData= {data[`TXC_B15_B4], cks, data[`TXC_B1_B0]};
        4'h3:  getCksReplPktData= {data[`TXC_B15_B5], cks, data[`TXC_B2_B0]};
        4'h4:  getCksReplPktData= {data[`TXC_B15_B6], cks, data[`TXC_B3_B0]};
        4'h5:  getCksReplPktData= {data[`TXC_B15_B7], cks, data[`TXC_B4_B0]};
        4'h6:  getCksReplPktData= {data[`TXC_B15_B8], cks, data[`TXC_B5_B0]};
        4'h7:  getCksReplPktData= {data[`TXC_B15_B9], cks, data[`TXC_B6_B0]};
        4'h8:  getCksReplPktData= {data[`TXC_B15_B10], cks, data[`TXC_B7_B0]};
        4'h9:  getCksReplPktData= {data[`TXC_B15_B11], cks, data[`TXC_B8_B0]};
        4'ha:  getCksReplPktData= {data[`TXC_B15_B12], cks, data[`TXC_B9_B0]};
        4'hb:  getCksReplPktData= {data[`TXC_B15_B13], cks, data[`TXC_B10_B0]};
        4'hc:  getCksReplPktData= {data[`TXC_B15_B14], cks, data[`TXC_B11_B0]};
        4'hd:  getCksReplPktData= {data[`TXC_B15], cks, data[`TXC_B12_B0]};
        4'he:  getCksReplPktData= {cks, data[`TXC_B13_B0]};
        4'hf:  getCksReplPktData= {cks, data[`TXC_B13_B0]};
        default: getCksReplPktData= {data};
      endcase
    end
  endfunction

  wire [6:0] tcpStuffInByte= {l4_stuff[5:0], 1'b0};
  wire [2:0] tcpStuffIn16B= tcpStuffInByte[6:4];  // ??

  wire [6:0] tcpStuffInByte_dup_1= {l4_stuff_dup_1[5:0], 1'b0};
  wire [2:0] tcpStuffIn16B_dup_1= tcpStuffInByte_dup_1[6:4];  // ??

  wire [6:0] tcpStuffInByte_dup_2= {l4_stuff_dup_2[5:0], 1'b0};
  wire [2:0] tcpStuffIn16B_dup_2= tcpStuffInByte_dup_2[6:4];  // ??

  wire [6:0] tcpStuffInByte_dup_3= {l4_stuff_dup_3[5:0], 1'b0};
  wire [2:0] tcpStuffIn16B_dup_3= tcpStuffInByte_dup_3[6:4];  // ??

  wire [9:0] curStoreFwdffWptr= StoreForwardWritePtr_n;  // wptr position at sop
  reg [4:0] cksStuffByteOffset; // stuff pos byte offset  
				// 0 - stuff at B0, 1- stuff at B1 .. 
  reg [9:0] bawrCnt;	// inc per ba_dv 
  reg [9:0] bawrCnt_dup_1;	// inc per ba_dv 
  reg [9:0] bawrCnt_dup_2;	// inc per ba_dv 
  reg [9:0] bawrCnt_dup_3;	// inc per ba_dv 

			// load at cks pos line
  wire [15:0] ld_pktDataWithCks_dup_n;
//  wire ld_pktDataWithCks_n= ba_dv && (bawrCnt ==  {7'h0, tcpStuffIn16B});

  assign ld_pktDataWithCks_dup_n[0]= ba_dv_dup[0] && (bawrCnt ==  {7'h0, tcpStuffIn16B});
  assign ld_pktDataWithCks_dup_n[1]= ba_dv_dup[1] && (bawrCnt ==  {7'h0, tcpStuffIn16B});
  assign ld_pktDataWithCks_dup_n[2]= ba_dv_dup[2] && (bawrCnt ==  {7'h0, tcpStuffIn16B});
  assign ld_pktDataWithCks_dup_n[3]= ba_dv_dup[3] && (bawrCnt ==  {7'h0, tcpStuffIn16B});
  assign ld_pktDataWithCks_dup_n[4]= ba_dv_dup[4] && (bawrCnt_dup_1 ==  {7'h0, tcpStuffIn16B_dup_1});
  assign ld_pktDataWithCks_dup_n[5]= ba_dv_dup[5] && (bawrCnt_dup_1 ==  {7'h0, tcpStuffIn16B_dup_1});
  assign ld_pktDataWithCks_dup_n[6]= ba_dv_dup[6] && (bawrCnt_dup_1 ==  {7'h0, tcpStuffIn16B_dup_1});
  assign ld_pktDataWithCks_dup_n[7]= ba_dv_dup[7] && (bawrCnt_dup_1 ==  {7'h0, tcpStuffIn16B_dup_1});
  assign ld_pktDataWithCks_dup_n[8]= ba_dv_dup[8] && (bawrCnt_dup_2 ==  {7'h0, tcpStuffIn16B_dup_2});
  assign ld_pktDataWithCks_dup_n[9]= ba_dv_dup[9] && (bawrCnt_dup_2 ==  {7'h0, tcpStuffIn16B_dup_2});
  assign ld_pktDataWithCks_dup_n[10]= ba_dv_dup[10] && (bawrCnt_dup_2 ==  {7'h0, tcpStuffIn16B_dup_2});
  assign ld_pktDataWithCks_dup_n[11]= ba_dv_dup[11] && (bawrCnt_dup_2 ==  {7'h0, tcpStuffIn16B_dup_2});
  assign ld_pktDataWithCks_dup_n[12]= ba_dv_dup[12] && (bawrCnt_dup_3 ==  {7'h0, tcpStuffIn16B_dup_3});
  assign ld_pktDataWithCks_dup_n[13]= ba_dv_dup[13] && (bawrCnt_dup_3 ==  {7'h0, tcpStuffIn16B_dup_3});
  assign ld_pktDataWithCks_dup_n[14]= ba_dv_dup[14] && (bawrCnt_dup_3 ==  {7'h0, tcpStuffIn16B_dup_3});
  assign ld_pktDataWithCks_dup_n[15]= ba_dv_dup[15] && (bawrCnt_dup_3 ==  {7'h0, tcpStuffIn16B_dup_3});

			// insert cks
  wire[127:0] pktDataWithCks_n= getCksReplPktData(cksStuffByteOffset[3:0], 
				pktDataWithCks, {ChecksumValue[7:0],ChecksumValue[15:8]});

  wire[9:0] cksffwptr_n=  curStoreFwdffWptr + {7'h0, tcpStuffIn16B}; 
  wire [9:0] adj_cksffwptr_n= cksffwptr_n - 10'd640; 

  always @(posedge SysClk) begin
    if(!Reset_L) begin
      cksStoreFwdffWptr<=  #`SD 10'h0;
      cksStuffByteOffset<=  #`SD 5'h0;
      pktDataWithCks<=  #`SD 128'h0;
      bawrCnt<= #`SD 10'h0; 
      bawrCnt_dup_1<= #`SD 10'h0; 
      bawrCnt_dup_2<= #`SD 10'h0; 
      bawrCnt_dup_3<= #`SD 10'h0; 
      writeCks<=  #`SD 1'b0;
    end
    else begin
      if(setEnableFifoWrite_r) begin // start of a pkt write
        cksStoreFwdffWptr<=  #`SD (cksffwptr_n < 10'd640)? cksffwptr_n : adj_cksffwptr_n;
        cksStuffByteOffset<=  #`SD tcpStuffInByte[4:0]; 	// wrap at FIFO_SIZE_640
      end
      if(setEnableFifoWrite_r) begin  
	 bawrCnt<=  #`SD 10'h0;
      end
      else if(ba_dv) bawrCnt<= #`SD bawrCnt + 1'b1; 

      if(setEnableFifoWrite_r) begin  
	 bawrCnt_dup_1<=  #`SD 10'h0;
      end
      else if(ba_dv_dup[1]) bawrCnt_dup_1<= #`SD bawrCnt_dup_1 + 1'b1; 

      if(setEnableFifoWrite_r) begin  
	 bawrCnt_dup_2<=  #`SD 10'h0;
      end
      else if(ba_dv_dup[2]) bawrCnt_dup_2<= #`SD bawrCnt_dup_2 + 1'b1; 

      if(setEnableFifoWrite_r) begin  
	 bawrCnt_dup_3<=  #`SD 10'h0;
      end
      else if(ba_dv_dup[3]) bawrCnt_dup_3<= #`SD bawrCnt_dup_3 + 1'b1; 


      if(ld_pktDataWithCks_dup_n[0]) begin // load at cks pos line
	pktDataWithCks[`TXC_B0]<=  #`SD ba_data[`TXC_B0];
      end
      else if(writeCks_n) pktDataWithCks[`TXC_B0]<=  #`SD  pktDataWithCks_n[`TXC_B0];

      if(ld_pktDataWithCks_dup_n[1]) begin // load at cks pos line
	pktDataWithCks[`TXC_B1]<=  #`SD ba_data[`TXC_B1];
      end
      else if(writeCks_n) pktDataWithCks[`TXC_B1]<=  #`SD  pktDataWithCks_n[`TXC_B1];

      if(ld_pktDataWithCks_dup_n[2]) begin // load at cks pos line
	pktDataWithCks[`TXC_B2]<=  #`SD ba_data[`TXC_B2];
      end
      else if(writeCks_n) pktDataWithCks[`TXC_B2]<=  #`SD  pktDataWithCks_n[`TXC_B2];

      if(ld_pktDataWithCks_dup_n[3]) begin // load at cks pos line
	pktDataWithCks[`TXC_B3]<=  #`SD ba_data[`TXC_B3];
      end
      else if(writeCks_n) pktDataWithCks[`TXC_B3]<=  #`SD  pktDataWithCks_n[`TXC_B3];

      if(ld_pktDataWithCks_dup_n[4]) begin // load at cks pos line
	pktDataWithCks[`TXC_B4]<=  #`SD ba_data[`TXC_B4];
      end
      else if(writeCks_n) pktDataWithCks[`TXC_B4]<=  #`SD  pktDataWithCks_n[`TXC_B4];

      if(ld_pktDataWithCks_dup_n[5]) begin // load at cks pos line
	pktDataWithCks[`TXC_B5]<=  #`SD ba_data[`TXC_B5];
      end
      else if(writeCks_n) pktDataWithCks[`TXC_B5]<=  #`SD  pktDataWithCks_n[`TXC_B5];

      if(ld_pktDataWithCks_dup_n[6]) begin // load at cks pos line
	pktDataWithCks[`TXC_B6]<=  #`SD ba_data[`TXC_B6];
      end
      else if(writeCks_n) pktDataWithCks[`TXC_B6]<=  #`SD  pktDataWithCks_n[`TXC_B6];

      if(ld_pktDataWithCks_dup_n[7]) begin // load at cks pos line
	pktDataWithCks[`TXC_B7]<=  #`SD ba_data[`TXC_B7];
      end
      else if(writeCks_n) pktDataWithCks[`TXC_B7]<=  #`SD  pktDataWithCks_n[`TXC_B7];

      if(ld_pktDataWithCks_dup_n[8]) begin // load at cks pos line
	pktDataWithCks[`TXC_B8]<=  #`SD ba_data[`TXC_B8];
      end
      else if(writeCks_n) pktDataWithCks[`TXC_B8]<=  #`SD  pktDataWithCks_n[`TXC_B8];

      if(ld_pktDataWithCks_dup_n[9]) begin // load at cks pos line
	pktDataWithCks[`TXC_B9]<=  #`SD ba_data[`TXC_B9];
      end
      else if(writeCks_n) pktDataWithCks[`TXC_B9]<=  #`SD  pktDataWithCks_n[`TXC_B9];

      if(ld_pktDataWithCks_dup_n[10]) begin // load at cks pos line
	pktDataWithCks[`TXC_B10]<=  #`SD ba_data[`TXC_B10];
      end
      else if(writeCks_n) pktDataWithCks[`TXC_B10]<=  #`SD  pktDataWithCks_n[`TXC_B10];

      if(ld_pktDataWithCks_dup_n[11]) begin // load at cks pos line
	pktDataWithCks[`TXC_B11]<=  #`SD ba_data[`TXC_B11];
      end
      else if(writeCks_n) pktDataWithCks[`TXC_B11]<=  #`SD  pktDataWithCks_n[`TXC_B11];

      if(ld_pktDataWithCks_dup_n[12]) begin // load at cks pos line
	pktDataWithCks[`TXC_B12]<=  #`SD ba_data[`TXC_B12];
      end
      else if(writeCks_n) pktDataWithCks[`TXC_B12]<=  #`SD  pktDataWithCks_n[`TXC_B12];

      if(ld_pktDataWithCks_dup_n[13]) begin // load at cks pos line
	pktDataWithCks[`TXC_B13]<=  #`SD ba_data[`TXC_B13];
      end
      else if(writeCks_n) pktDataWithCks[`TXC_B13]<=  #`SD  pktDataWithCks_n[`TXC_B13];

      if(ld_pktDataWithCks_dup_n[14]) begin // load at cks pos line
	pktDataWithCks[`TXC_B14]<=  #`SD ba_data[`TXC_B14];
      end
      else if(writeCks_n) pktDataWithCks[`TXC_B14]<=  #`SD  pktDataWithCks_n[`TXC_B14];

      if(ld_pktDataWithCks_dup_n[15]) begin // load at cks pos line
	pktDataWithCks[`TXC_B15]<=  #`SD ba_data[`TXC_B15];
      end
      else if(writeCks_n) pktDataWithCks[`TXC_B15]<=  #`SD  pktDataWithCks_n[`TXC_B15];

      writeCks<=  #`SD (writeCks_n & cksen);

    end
  end

/*--------------------------------------------------------------*/
// 		readLength control
/*--------------------------------------------------------------*/

reg [9:0] rdCnt_16B;	// readLength -> 16B chunks
reg [9:0] rcvCnt_16B;		// rcv'd 16B dataline count (per read)
reg [13:0] rcvCnt_1B;		// rcv'd count in bytes
				// pkt done if rcvCnt_1B==readLength
reg [9:0] orderCnt_16B;	// 16B dataline ordered (per read)	

reg [4:0] bytesNotRcv;	// for each 16B ordered, accumulate partial bytes 
			// not rcv'd from data read
wire [4:0] bytesNotRcv_toadd_n= 5'h10 - force_ff_byteOffset_n;
wire [4:0] bytesNotRcv_sum_n= bytesNotRcv + bytesNotRcv_toadd_n;
wire inc_bytesNotRcv_n= pktProc & roffDataValid; // update per dataline
				// and during pkt data process phase

wire inc_orderCnt_16B= pktProc & readFifo;
wire rcvEQorder_n= (rcvCnt_16B==orderCnt_16B);
assign rcvEQorder= rcvEQorder_n;
wire rdNotDone_n= (|rdCnt_16B);

wire extraToOrder_n= roffDataValid & bytesNotRcv_sum_n[4] & ~rcvEQorder_n;
			// order extra when bytes ordered but not rcv'd >= 16B;
			// stop when no more to order (rcv==order) since
			// in (rcv==order) case, extra dataline req is governed by 
			// each rcvbytes read; one read, check/order,... 
			// this is because each dataline read in can be partial bytes
			// and this logic is designed not to read cross a pkt.
wire dec_rdCnt_n= pktProc & readFifo & ~extraToOrder_n & rdNotDone_n;
				    // dec only if non-zero (for read at a time case);
wire inc_rdCnt_n= pktProc & extraToOrder_n & ~readFifo;


		// implement this only if wanna improve for bursty read
		// in  (rcv==order) with no more rdCnt case; this
		// happens when partial bytes spreaded among datalines;
		// assumption is this doesn't happen that often;
wire ld_rdCnt_n= pktProc & ~rdNotDone_n & rcvEQorder_n & (|pktLength_n[6:4]);
		// remain pktlength >=16B at (rcv==order) with no more rdCnt 
		// ld in extra 16B needed in order to make bursty reads;
		// orderEnable= ... (rcvPktNotDone_n & rcvEQorder_n & ~ld_rdCnt_n)
		// let rdCnt do the ordering; [6:4] -> assume remain rdCnt<7;


wire inc_rcvCnt_16B= pktProc & ReOrderFifoDataValid; // use one stage ahead so that updated 
					// rcvCnt align with roffDataValid

wire inc_rcvCnt_1B= pktProc & roffDataValid; // this needs to align with roff_byteOffset 
wire [13:0] rcvCnt_1B_sum_n= rcvCnt_1B + {9'h0, force_ff_byteOffset_n};
				// ff_byteOffset align with roffDataValid 

wire rcvPktNotDone_n= (rcvCnt_1B_sum_n < readLength); 

assign orderEnable= pktProc & 
		 (rdNotDone_n | 	// rdCnt non zero
		 (rcvPktNotDone_n & rcvEQorder_n & 
		  ~ld_rdCnt_n)); // in remain >=16B case, let rdCnt continue;
				// wanna do burst read if can
					// if <16B, needs to be 
					// one read at a time (rd,rcv..rd,rcv)
					// caused these are partial bytes in a line
					// and we don't wanna cross next pkt;

assign pktRdDone= pktProc & ~rcvPktNotDone_n;

always @(posedge SysClk) begin
  if(!Reset_L) begin
    rdCnt_16B<= #`SD 10'h0;
    rcvCnt_16B<= #`SD 10'h0;
    rcvCnt_1B<= #`SD 14'h0;
    orderCnt_16B<= #`SD 10'h0; 
  end
  else begin
    if(setEnableFifoWrite_r) 
      rdCnt_16B<= #`SD adj_ctrlhdr_pktlen_n[13:4] + 
		      ((|adj_ctrlhdr_pktlen_n[3:0])? 10'h1 : 10'h0);
    else if(inc_rdCnt_n) rdCnt_16B<= #`SD rdCnt_16B + 1'b1;
    else if(dec_rdCnt_n) rdCnt_16B<= #`SD rdCnt_16B - 1'b1;
    else if(ld_rdCnt_n) rdCnt_16B<= #`SD pktLength_n[13:4];

    if(setEnableFifoWrite_r) 
      rcvCnt_16B<= #`SD 10'h0;	
    else if(inc_rcvCnt_16B) rcvCnt_16B<= #`SD rcvCnt_16B + 1'b1;

    if(setEnableFifoWrite_r) 
      rcvCnt_1B<= #`SD 14'h0;	
    else if(inc_rcvCnt_1B)  rcvCnt_1B<= #`SD rcvCnt_1B_sum_n;

    if(setEnableFifoWrite_r) 
      orderCnt_16B<= #`SD 10'h0;
    else if(inc_orderCnt_16B)  orderCnt_16B<= #`SD orderCnt_16B + 1'b1;
  end
end


always @(posedge SysClk) begin
  if(!Reset_L) begin
    bytesNotRcv<= #`SD 5'h0;
  end
  else begin
    if(setEnableFifoWrite_r) 
      bytesNotRcv<= #`SD 5'h0;
    else if(inc_bytesNotRcv_n) bytesNotRcv<= #`SD  {1'b0, bytesNotRcv_sum_n[3:0]};
  end 
  
end



// err handling

	// rcvFifoCnt; use for err handling  
always @(posedge SysClk)
  if (!Reset_L) rcvFifoCnt <= #`SD 10'h0;
  else if(ReOrderFifoDataValid) rcvFifoCnt <= #`SD rcvFifoCnt + 1'b1;
  else if(clrEnableFifoWrite) rcvFifoCnt <= #`SD 10'h0;

	// rdFifoCnt; use for err handling  
always @(posedge SysClk)
  if (!Reset_L) rdFifoCnt <= #`SD 10'h0;
  else if(readFifo) rdFifoCnt<= #`SD rdFifoCnt + 1'b1;
  else if(clrEnableFifoWrite) rdFifoCnt <= #`SD 10'h0;

always @(posedge SysClk)
  if (!Reset_L) noWrite <= #`SD 1'b0;
  else if(set_noWrite_n) noWrite<= #`SD 1'b1;
  else if(rst_noWrite_n) noWrite<= #`SD 1'b0;

always @(posedge SysClk)
  if (!Reset_L) errWrite <= #`SD 1'b0;
  else errWrite  <= #`SD errWrite_n;

assign collisionRequested = ClearStatistics & set_pktAbort_n;

always @(posedge SysClk) begin
  if (!Reset_L)                PktErrAbortCount <= #`SD 16'h0;
  else if (collisionRequested) PktErrAbortCount <= #`SD 16'h1;
  else if (ClearStatistics)    PktErrAbortCount <= #`SD 16'h0;
  else if (WrPacketRequested)  PktErrAbortCount <= #`SD PioDataIn[15:0];
  else if (set_pktAbort_n)     PktErrAbortCount <= #`SD PktErrAbortCount +16'b1;
end

/*
niu_txc_byteAlign byteAlign(
	.SysClk		(SysClk), 
	.Reset_L	(Reset_L),
	.ReOrderFifoDataValid   (ReOrderFifoDataValid), // pre-reg version
	.roffDataValid  (roff_dv_r),
	.roffDataOut	(roff_data_r[151:0]), 
	.loadControlHeader	(loadControlHeader),
	.controlHeader		(controlHeader [127:0]),
	.setEnableFifoWrite	(setEnableFifoWrite),   // start data fifo read signal
	.writeCks_n		(writeCks_n),	// signal time to write checksum
	.StoreForwardWritePtr	(ffStoreForwardWritePtr [9:0]), // 
	.ChecksumValue		(ChecksumValue[15:0]),
	.writeCks		(writeCks),
	.cksStoreFwdffWptr	(cksStoreFwdffWptr [9:0]),	
	.pktDataWithCks		(pktDataWithCks [127:0]),
	.ba_dv			(ba_dv),
	.ba_sop			(ba_sop),
	.ba_eop			(ba_eop),
	.ba_qwr_dv		(ba_qwr_dv),
	.ba_data		(ba_data[127:0]),
	.readFifo		(readFifo),
	.readLength		(readLength [13:0]),
	.rcvEQorder		(rcvEQorder),
	.orderEnable		(orderEnable),
	.pktRdDone		(pktRdDone)
);
*/



endmodule
