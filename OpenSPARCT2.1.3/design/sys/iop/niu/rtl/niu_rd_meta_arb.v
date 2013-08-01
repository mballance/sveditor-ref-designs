// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_rd_meta_arb.v
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
/*-----------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Company: Sun Microsystems, Inc.
-- SUN CONFIDENTIAL/PROPRIETARY - Copyright 2004
-- Description: [Verilog RTL Code]
--   Read META Arb
--   TransID Management
-- Project: Niagara2/Neptune
-- Platform: 
-- Parent Module: NIU
-- Module: NIU_RD_META_ARB
-- Designer: Carl Childers 
           : Nimita Taneja
-- Date Created: 07/01/2004
-- Date Modified 10/11/2004 
-- Notes: 
--   1.   
--   2.   
-- Rev: 0.1; Board Rev: P1.0
-------------------------------------------------------------------------------
-----------------------------------------------------------------------------*/

/*--------------------------------------
-- Module
--------------------------------------*/

module niu_rd_meta_arb ( /*AUTOARG*/
   // Outputs
   dmc_meta1_req_cmd, dmc_meta1_req_address, dmc_meta1_req_length, 
   dmc_meta1_req_transID, dmc_meta1_req_port_num, 
   dmc_meta1_req_dma_num, dmc_meta1_req_func_num, 
   dmc_meta1_req_client, dmc_meta1_req, arb1_zcp_req_accept, 
   arb1_zcp_req_errors, arb1_txc_req_accept, arb1_txc_req_errors, 
   arb1_tdmc_req_accept, arb1_tdmc_req_errors, arb1_rbr_req_accept, 
   arb1_rbr_req_errors, arb_pio_dirtid_rdstatus, arb_pio_all_rddirty, 
   // Inputs
   meta_dmc1_req_accept, meta_dmc1_req_errors, zcp_arb1_req_cmd, 
   zcp_arb1_req_address, zcp_arb1_req_length, zcp_arb1_req_port_num, 
   zcp_arb1_req_dma_num, zcp_arb1_req_func_num, zcp_arb1_req, 
   txc_arb1_req_cmd, txc_arb1_req_address, txc_arb1_req_length, 
   txc_arb1_req_port_num, txc_arb1_req_dma_num, 
   txc_arb1_req_func_num, txc_arb1_req, tdmc_arb1_req_cmd, 
   tdmc_arb1_req_address, tdmc_arb1_req_length, 
   tdmc_arb1_req_port_num, tdmc_arb1_req_dma_num, 
   tdmc_arb1_req_func_num, tdmc_arb1_req, rbr_arb1_req_cmd, 
   rbr_arb1_req_address, rbr_arb1_req_length, rbr_arb1_req_port_num, 
   rbr_arb1_req_dma_num, rbr_arb1_req_func_num, rbr_arb1_req, 
   meta_dmc_resp_transID, dmc_meta_resp_accept, 
   meta_dmc_resp_transfer_cmpl, meta_dmc_resp_cmd_status, 
   pio_arb_dirtid_enable, pio_arb_dirtid_clr, pio_arb_rd_threshold, 
   clk, reset
   );                                       // from reset


/*-----------------------------------------------------------------------------
-- Declarations
-----------------------------------------------------------------------------*/
/*--------------------------------------
-- Port Declaration
--------------------------------------*/

  // META Request Outputs
  output   [7:0] dmc_meta1_req_cmd;                  // Command Request
  output  [63:0] dmc_meta1_req_address;              // Memory Address
  output  [13:0] dmc_meta1_req_length;               // Packet Length
  output   [5:0] dmc_meta1_req_transID;              // Transaction ID
  output   [1:0] dmc_meta1_req_port_num;             // Port Number
  output   [4:0] dmc_meta1_req_dma_num;              // Channel Number
  output   [1:0] dmc_meta1_req_func_num;              // Channel Number
  output   [7:0] dmc_meta1_req_client;               // Client [vector]
  output         dmc_meta1_req;                      // Req Command Request

  // ZCP I/F Outputs
  output         arb1_zcp_req_accept;                // Response to REQ
  output         arb1_zcp_req_errors;                // Error flag

  // TXC I/F Output
  output         arb1_txc_req_accept;                // Response to REQ
  output         arb1_txc_req_errors;                // Error flag

  // TDMC I/F Output
  output         arb1_tdmc_req_accept;               // Response to REQ
  output         arb1_tdmc_req_errors;               // Error flag

  // RCR I/F Output
//  output         arb1_rcr_req_accept;                // Response to REQ
//  output         arb1_rcr_req_errors;                // Error flag

  // RBR I/F Output
  output         arb1_rbr_req_accept;                // Response to REQ
  output         arb1_rbr_req_errors;                // Error flag

   // Read Dirty TID status
   output [5:0]  arb_pio_dirtid_rdstatus; // count for number of read TID's dirty
   output 	 arb_pio_all_rddirty;   // all dirty bin entries are dirty

   
  // META Request Inputs
  input          meta_dmc1_req_accept;               // Response to REQ
  input          meta_dmc1_req_errors;               // Error flag

  // ZCP I/F Inputs
  input    [7:0] zcp_arb1_req_cmd;                   // Command Request
  input   [63:0] zcp_arb1_req_address;               // Memory Address
  input   [13:0] zcp_arb1_req_length;                // Packet Length
  input    [1:0] zcp_arb1_req_port_num;              // Port Number
  input    [4:0] zcp_arb1_req_dma_num;               // Channel Number
  input    [1:0] zcp_arb1_req_func_num;               // Channel Number
  input          zcp_arb1_req;                       // Req Command Request

  // TXC I/F Inputs
  input    [7:0] txc_arb1_req_cmd;                   // Command Request
  input   [63:0] txc_arb1_req_address;               // Memory Address
  input   [13:0] txc_arb1_req_length;                // Packet Length
  input    [1:0] txc_arb1_req_port_num;              // Port Number
  input    [4:0] txc_arb1_req_dma_num;               // Channel Number
  input    [1:0] txc_arb1_req_func_num;               // Channel Number
  input          txc_arb1_req;                       // Req Command Request

  // TDMC I/F Inputs
  input    [7:0] tdmc_arb1_req_cmd;                  // Command Request
  input   [63:0] tdmc_arb1_req_address;              // Memory Address
  input   [13:0] tdmc_arb1_req_length;               // Packet Length
  input    [1:0] tdmc_arb1_req_port_num;             // Port Number
  input    [4:0] tdmc_arb1_req_dma_num;              // Channel Number
  input    [1:0] tdmc_arb1_req_func_num;              // Channel Number
  input          tdmc_arb1_req;                      // Req Command Request

  // RCR I/F Inputs
//  input    [7:0] rcr_arb1_req_cmd;                   // Command Request
//  input   [63:0] rcr_arb1_req_address;               // Memory Address
//  input   [13:0] rcr_arb1_req_length;                // Packet Length
//  input    [1:0] rcr_arb1_req_port_num;              // Port Number
//  input    [4:0] rcr_arb1_req_dma_num;               // Channel Number
//  input          rcr_arb1_req;                       // Req Command Request

  // RBR I/F Inputs
  input    [7:0] rbr_arb1_req_cmd;                   // Command Request
  input   [63:0] rbr_arb1_req_address;               // Memory Address
  input   [13:0] rbr_arb1_req_length;                // Packet Length
  input    [1:0] rbr_arb1_req_port_num;              // Port Number
  input    [4:0] rbr_arb1_req_dma_num;               // Channel Number
  input    [1:0] rbr_arb1_req_func_num;               // Channel Number
  input          rbr_arb1_req;                       // Req Command Request

  // META Response Input
  input    [5:0] meta_dmc_resp_transID;              // Free TransID
  input    [7:0] dmc_meta_resp_accept;               // Valid TransID
  input    [7:0] meta_dmc_resp_transfer_cmpl;        // Last trans of TransID
   input [3:0] 	 meta_dmc_resp_cmd_status;       // status in command phase

   //Dirty TID Interface
   input 	 pio_arb_dirtid_enable; // Enable Dirty TID logic
   input 	 pio_arb_dirtid_clr;    // Clear all Dirty TID Entries
   input [5:0] 	 pio_arb_rd_threshold; // read threshold

  // other inputs
  input          clk;                                // core clock
  input          reset;                              // reset


/***************************************/
/* Wire Declaration                    */
/***************************************/

 /*AUTOWIRE*/
 // Beginning of automatic wires (for undeclared instantiated-module outputs)
 // End of automatics


 
  
   wire 		arb1_fifo_not_empty;		// From arb_tagfifo of arb_tagfifo.v
   wire [4:0] 		rdtagoutR;			// From arb_tagfifo of arb_tagfifo.v


 

   wire 		meta_dmc_resp_transfer_cmpl_ORd;
   wire 		dmc_meta_resp_accept_ORd;

   wire 		transaction_timeout;
   wire [5:0] 		dirty_tag_count;
   wire 		dirtybinfifo_not_empty;
   wire 		dirtybinfifo_full;
   wire [4:0] 		dirty_tag;
   wire 		arb_pio_all_rddirty;
   wire 		rd_threshold_reached;
   
/***************************************/
/* Reg Declaration                    */
/***************************************/
/*AUTOREG*/
// Beginning of automatic regs (for this module's undeclared outputs)
// End of automatics
   
  reg     [2:0] arb_control_sel_ff,
                arb_control_sel_in;
  reg           arb_control_sel_ld;


  // Transaction ID tag read and write pointer incrementer
   reg 		read_tag;
   reg 		write_tag;
   reg          write_dirty_tag;
   reg [4:0] 	meta_dmc_resp_transID_cmpl;
   reg [4:0] 	meta_dmc_resp_transIDR;
   reg [4:0] 	meta_dmc_resp_transID0R;
   reg [4:0] 	meta_dmc_resp_transID1R;
   reg [4:0] 	meta_dmc_resp_transID2R;
   reg [4:0] 	meta_dmc_resp_transID3R;
   reg [4:0] 	meta_dmc_resp_transID4R;
   reg [4:0] 	meta_dmc_resp_transID5R;
   reg [4:0] 	meta_dmc_resp_transID6R;
   reg [4:0] 	meta_dmc_resp_transID7R;
   reg [3:0] 	meta_dmc_resp_cmd_statusR;
   reg [4:0]    reclaimed_transID;

  // Arb Control MUX
  reg     [7:0] mux_dmc_meta1_req_cmd;
  reg    [63:0] mux_dmc_meta1_req_address;
  reg    [13:0] mux_dmc_meta1_req_length;
  reg     [1:0] mux_dmc_meta1_req_port_num;
  reg     [4:0] mux_dmc_meta1_req_dma_num;
  reg     [1:0] mux_dmc_meta1_req_func_num;
  reg     [7:0] mux_dmc_meta1_req_client;
  reg           mux_dmc_meta1_req;

  reg           demux_arb1_zcp_req_accept;
  reg           demux_arb1_zcp_req_errors;

  reg           demux_arb1_txc_req_accept;
  reg           demux_arb1_txc_req_errors;

  reg           demux_arb1_tdmc_req_accept;
  reg           demux_arb1_tdmc_req_errors;

//  reg           demux_arb1_rcr_req_accept;
//  reg           demux_arb1_rcr_req_errors;

  reg           demux_arb1_rbr_req_accept;
  reg           demux_arb1_rbr_req_errors;


  reg     [3:0] current_arb_control_state_ff,
                next_arb_control_state;

// dirty bin registers
   reg 		transfer_cmpl_pending;
   reg [5:0] 	arb_pio_dirtid_rdstatus;
   reg [1:0]    dirbin_state, dirbin_stateR;
   reg 		inc_dirtybinfifo_rp;
   reg 		return_dirty_tag;
   reg [5:0] 	outstanding_tid_cnt;

   wire inc_outstanding_tid_cnt= meta_dmc1_req_accept & ~meta_dmc_resp_transfer_cmpl_ORd;
   wire dec_outstanding_tid_cnt= meta_dmc_resp_transfer_cmpl_ORd & ~meta_dmc1_req_accept;
   wire [5:0] outstanding_tid_cnt_plus1= outstanding_tid_cnt + 1'b1; 
   wire [5:0] outstanding_tid_cnt_minus1= outstanding_tid_cnt - 1'b1; 
   wire [5:0] outstanding_tid_cnt_add_n= (outstanding_tid_cnt==6'd32)? 6'h0 : outstanding_tid_cnt_plus1;
   wire [5:0] outstanding_tid_cnt_sub_n= (outstanding_tid_cnt==6'd0)? 6'h0 : outstanding_tid_cnt_minus1;

/***************************************/
/* Parameter Declaration               */
/***************************************/

  parameter  [2:0] NULL             = 3'b000,
                   ZCP              = 3'b001, 
                   TXC              = 3'b010,
                   TDMC             = 3'b011,
                   RBR              = 3'b101;

//                   RCR              = 3'b100

  parameter  [7:0] NULL_CLIENT      = 8'h00,
                   ZCP_CLIENT       = 8'h01,
                   TXC_CLIENT       = 8'h02,
                   TDMC_CLIENT      = 8'h04,
                   RBR_CLIENT       = 8'h20;

//                   RDC_CLIENT       = 8'h08

   parameter [3:0] CACS0            = 4'b0000,
                   CACS1            = 4'b0001,
                   CACS2            = 4'b0010,
                   CACS3            = 4'b0011,
                   CACS4            = 4'b0100,
                   CACS5            = 4'b0101,
                   CACS6            = 4'b0110,
                   CACS7            = 4'b0111,
                   CACS8            = 4'b1000,
                   CACS9            = 4'b1001;

  parameter         ZERO_1          = 1'b0;
  parameter   [1:0] ZEROES_2        = 2'b00;
  parameter   [4:0] ZEROES_5        = 5'b00000;
  parameter   [7:0] ZEROES_8        = 8'b00000000;
  parameter  [13:0] ZEROES_14       = 14'b00000000000000;
  parameter  [63:0] ZEROES_64       = 64'h0000;

  // misc
  parameter        ASSERT_H         = 1'b1,
                   DEASSERT_L       = 1'b0,
                   TRUE_H           = 1'b1;

   parameter [1:0] IDLEBIN = 2'b00,
		   CLRBIN = 2'b01,
		   RDBIN = 2'b10;


/*-----------------------------------------------------------------------------
-- Output Assignments
-----------------------------------------------------------------------------*/
  // META Request Outputs
  assign dmc_meta1_req_cmd           = mux_dmc_meta1_req_cmd;
  assign dmc_meta1_req_address       = mux_dmc_meta1_req_address;
  assign dmc_meta1_req_length        = mux_dmc_meta1_req_length;
  assign dmc_meta1_req_transID       = {1'b0,rdtagoutR};
  assign dmc_meta1_req_port_num      = mux_dmc_meta1_req_port_num;
  assign dmc_meta1_req_dma_num       = mux_dmc_meta1_req_dma_num;
  assign dmc_meta1_req_func_num       = mux_dmc_meta1_req_func_num;
  assign dmc_meta1_req_client        = mux_dmc_meta1_req_client;
  assign dmc_meta1_req               = mux_dmc_meta1_req;

  // ZCP I/F Outputs
  assign arb1_zcp_req_accept         = demux_arb1_zcp_req_accept;
  assign arb1_zcp_req_errors         = demux_arb1_zcp_req_errors;

  // TXC I/F Outputs
  assign arb1_txc_req_accept         = demux_arb1_txc_req_accept;
  assign arb1_txc_req_errors         = demux_arb1_txc_req_errors;

  // TDMC I/F Outputs
  assign arb1_tdmc_req_accept        = demux_arb1_tdmc_req_accept;
  assign arb1_tdmc_req_errors        = demux_arb1_tdmc_req_errors;

  // RCR I/F Outputs
//  assign arb1_rcr_req_accept         = demux_arb1_rcr_req_accept;
//  assign arb1_rcr_req_errors         = demux_arb1_rcr_req_errors;

  // RBR I/F Outputs
  assign arb1_rbr_req_accept         = demux_arb1_rbr_req_accept;
  assign arb1_rbr_req_errors         = demux_arb1_rbr_req_errors;


/*-----------------------------------------------------------------------------
-- Arbitration CONTROL
-----------------------------------------------------------------------------*/
/*--------------------------------------
-- Concurrent combinatorial logic: Arbitration CONTROL MUX
--------------------------------------*/

  always @ (/*AUTOSENSE*/arb_control_sel_ff or meta_dmc1_req_accept
	    or meta_dmc1_req_errors or rbr_arb1_req
	    or rbr_arb1_req_address or rbr_arb1_req_cmd
	    or rbr_arb1_req_dma_num or rbr_arb1_req_func_num
	    or rbr_arb1_req_length or rbr_arb1_req_port_num
	    or tdmc_arb1_req or tdmc_arb1_req_address
	    or tdmc_arb1_req_cmd or tdmc_arb1_req_dma_num
	    or tdmc_arb1_req_func_num or tdmc_arb1_req_length
	    or tdmc_arb1_req_port_num or txc_arb1_req
	    or txc_arb1_req_address or txc_arb1_req_cmd
	    or txc_arb1_req_dma_num or txc_arb1_req_func_num
	    or txc_arb1_req_length or txc_arb1_req_port_num
	    or zcp_arb1_req or zcp_arb1_req_address
	    or zcp_arb1_req_cmd or zcp_arb1_req_dma_num
	    or zcp_arb1_req_func_num or zcp_arb1_req_length
	    or zcp_arb1_req_port_num)

  begin: arbitration_control_mux
    mux_dmc_meta1_req_cmd      = ZEROES_8;
    mux_dmc_meta1_req_address  = ZEROES_64;
    mux_dmc_meta1_req_length   = ZEROES_14;
    mux_dmc_meta1_req_port_num = ZEROES_2;
    mux_dmc_meta1_req_dma_num  = ZEROES_5;
    mux_dmc_meta1_req_func_num  = ZEROES_2;
    mux_dmc_meta1_req_client   = NULL_CLIENT;
    mux_dmc_meta1_req          = ZERO_1;

    demux_arb1_zcp_req_accept  = ZERO_1;
    demux_arb1_zcp_req_errors  = ZERO_1;

    demux_arb1_txc_req_accept  = ZERO_1;
    demux_arb1_txc_req_errors  = ZERO_1;

    demux_arb1_tdmc_req_accept = ZERO_1;
    demux_arb1_tdmc_req_errors = ZERO_1;

//    demux_arb1_rcr_req_accept  = ZERO_1;
//    demux_arb1_rcr_req_errors  = ZERO_1;

    demux_arb1_rbr_req_accept  = ZERO_1;
    demux_arb1_rbr_req_errors  = ZERO_1;

    case (arb_control_sel_ff) /* synopsys parallel_case full_case */
      NULL: begin
        mux_dmc_meta1_req_cmd      = ZEROES_8;
        mux_dmc_meta1_req_address  = ZEROES_64;
        mux_dmc_meta1_req_length   = ZEROES_14;
        mux_dmc_meta1_req_port_num = ZEROES_2;
        mux_dmc_meta1_req_dma_num  = ZEROES_5;
        mux_dmc_meta1_req_func_num  = ZEROES_2;
        mux_dmc_meta1_req_client   = NULL_CLIENT;
        mux_dmc_meta1_req          = ZERO_1;

        demux_arb1_zcp_req_accept  = ZERO_1;
        demux_arb1_zcp_req_errors  = ZERO_1;

        demux_arb1_txc_req_accept  = ZERO_1;
        demux_arb1_txc_req_errors  = ZERO_1;

        demux_arb1_tdmc_req_accept = ZERO_1;
        demux_arb1_tdmc_req_errors = ZERO_1;

//        demux_arb1_rcr_req_accept  = ZERO_1;
//        demux_arb1_rcr_req_errors  = ZERO_1;

        demux_arb1_rbr_req_accept  = ZERO_1;
        demux_arb1_rbr_req_errors  = ZERO_1;
      end
      ZCP: begin
        mux_dmc_meta1_req_cmd      = zcp_arb1_req_cmd;
        mux_dmc_meta1_req_address  = zcp_arb1_req_address;
        mux_dmc_meta1_req_length   = zcp_arb1_req_length;
        mux_dmc_meta1_req_port_num = zcp_arb1_req_port_num;
        mux_dmc_meta1_req_dma_num  = zcp_arb1_req_dma_num;
        mux_dmc_meta1_req_func_num  = zcp_arb1_req_func_num;
        mux_dmc_meta1_req_client   = ZCP_CLIENT;
        mux_dmc_meta1_req          = zcp_arb1_req;

        demux_arb1_zcp_req_accept  = meta_dmc1_req_accept;
        demux_arb1_zcp_req_errors  = meta_dmc1_req_errors;
      end
      TXC: begin
        mux_dmc_meta1_req_cmd      = txc_arb1_req_cmd;
        mux_dmc_meta1_req_address  = txc_arb1_req_address;
        mux_dmc_meta1_req_length   = txc_arb1_req_length;
        mux_dmc_meta1_req_port_num = txc_arb1_req_port_num;
        mux_dmc_meta1_req_dma_num  = txc_arb1_req_dma_num;
        mux_dmc_meta1_req_func_num  = txc_arb1_req_func_num;
        mux_dmc_meta1_req_client   = TXC_CLIENT;
        mux_dmc_meta1_req          = txc_arb1_req;

        demux_arb1_txc_req_accept  = meta_dmc1_req_accept;
        demux_arb1_txc_req_errors  = meta_dmc1_req_errors;
      end
      TDMC: begin
        mux_dmc_meta1_req_cmd      = tdmc_arb1_req_cmd;
        mux_dmc_meta1_req_address  = tdmc_arb1_req_address;
        mux_dmc_meta1_req_length   = tdmc_arb1_req_length;
        mux_dmc_meta1_req_port_num = tdmc_arb1_req_port_num;
        mux_dmc_meta1_req_dma_num  = tdmc_arb1_req_dma_num;
        mux_dmc_meta1_req_func_num  = tdmc_arb1_req_func_num;
        mux_dmc_meta1_req_client   = TDMC_CLIENT;
        mux_dmc_meta1_req          = tdmc_arb1_req;

        demux_arb1_tdmc_req_accept = meta_dmc1_req_accept;
        demux_arb1_tdmc_req_errors = meta_dmc1_req_errors;
      end
//      RCR: begin
//        mux_dmc_meta1_req_cmd      = rcr_arb1_req_cmd;
//        mux_dmc_meta1_req_address  = rcr_arb1_req_address;
//        mux_dmc_meta1_req_length   = rcr_arb1_req_length;
//        mux_dmc_meta1_req_port_num = rcr_arb1_req_port_num;
//        mux_dmc_meta1_req_dma_num  = rcr_arb1_req_dma_num;
//        mux_dmc_meta1_req_client   = RCR_CLIENT;
//        mux_dmc_meta1_req          = rcr_arb1_req;

//        demux_arb1_rcr_req_accept  = meta_dmc1_req_accept;
//        demux_arb1_rcr_req_errors  = meta_dmc1_req_errors;
//      end
      RBR: begin
        mux_dmc_meta1_req_cmd      = rbr_arb1_req_cmd;
        mux_dmc_meta1_req_address  = rbr_arb1_req_address;
        mux_dmc_meta1_req_length   = rbr_arb1_req_length;
        mux_dmc_meta1_req_port_num = rbr_arb1_req_port_num;
        mux_dmc_meta1_req_dma_num  = rbr_arb1_req_dma_num;
        mux_dmc_meta1_req_func_num  = rbr_arb1_req_func_num;
        mux_dmc_meta1_req_client   = RBR_CLIENT;
        mux_dmc_meta1_req          = rbr_arb1_req;

        demux_arb1_rbr_req_accept  = meta_dmc1_req_accept;
        demux_arb1_rbr_req_errors  = meta_dmc1_req_errors;
      end
      default: begin
        mux_dmc_meta1_req_cmd      = ZEROES_8;
        mux_dmc_meta1_req_address  = ZEROES_64;
        mux_dmc_meta1_req_length   = ZEROES_14;
        mux_dmc_meta1_req_port_num = ZEROES_2;
        mux_dmc_meta1_req_dma_num  = ZEROES_5;
        mux_dmc_meta1_req_func_num  = ZEROES_2;
        mux_dmc_meta1_req_client   = NULL_CLIENT;
        mux_dmc_meta1_req          = ZERO_1;

        demux_arb1_zcp_req_accept  = ZERO_1;
        demux_arb1_zcp_req_errors  = ZERO_1;

        demux_arb1_txc_req_accept  = ZERO_1;
        demux_arb1_txc_req_errors  = ZERO_1;

        demux_arb1_tdmc_req_accept = ZERO_1;
        demux_arb1_tdmc_req_errors = ZERO_1;

//        demux_arb1_rcr_req_accept  = ZERO_1;
//        demux_arb1_rcr_req_errors  = ZERO_1;

        demux_arb1_rbr_req_accept  = ZERO_1;
        demux_arb1_rbr_req_errors  = ZERO_1;
      end
    endcase
  end

/*--------------------------------------
-- Concurrent combinatorial logic:Round Robin Arbitration CONTROL State Machine
--------------------------------------*/
  always @ (/*AUTOSENSE*/arb1_fifo_not_empty
	    or current_arb_control_state_ff or meta_dmc1_req_accept
	    or rbr_arb1_req or rd_threshold_reached or tdmc_arb1_req
	    or txc_arb1_req or zcp_arb1_req)
  begin: arbitration_control_fsm
     arb_control_sel_in = NULL;
     arb_control_sel_ld = DEASSERT_L;
     read_tag    = DEASSERT_L;
     next_arb_control_state = CACS0;
    case (current_arb_control_state_ff) /* synopsys parallel_case full_case */
      CACS0: begin
	 if (arb1_fifo_not_empty & ~rd_threshold_reached ) begin
	    if (zcp_arb1_req == TRUE_H) begin            // ZCP Request
	       arb_control_sel_in = ZCP;                  // Select ZCP module
	       next_arb_control_state = CACS5;            // next state
	    end
	    else if (txc_arb1_req == TRUE_H) begin       // TXC Request
	       arb_control_sel_in = TXC;                  // Select TXC module
	       next_arb_control_state = CACS6;            // next state
	    end
	    else if (tdmc_arb1_req == TRUE_H) begin      // TDMC Request
	       arb_control_sel_in = TDMC;                 // Select TDMC module
	       next_arb_control_state = CACS7;            // next state
	    end
	    //        else if (rcr_arb1_req == TRUE_H) begin       // RCR Request
	    //          arb_control_sel_in = RCR;                  // Select RCR module
	    //          next_arb_control_state = CACS8;            // next state
	    //        end
	    else if (rbr_arb1_req == TRUE_H) begin       // RBR Request
	       arb_control_sel_in = RBR;                  // Select RBR module
	       next_arb_control_state = CACS9;            // next state
	    end
	    else begin                                   // No Request
	       arb_control_sel_in = NULL;                 // Select NULL module
	       next_arb_control_state = CACS0;            // loop
	    end // else: !if(rbr_arb1_req == TRUE_H)
	 end // if (arb1_fifo_not_empty)
	 else begin                                   // No Request
	    arb_control_sel_in = NULL;                 // Select NULL module
	    next_arb_control_state = CACS0;            // loop
	 end // else: !if(arb1_fifo_not_empty)
	 arb_control_sel_ld = ASSERT_H;               // load register
      end
      CACS1: begin
	 if (arb1_fifo_not_empty & ~rd_threshold_reached) begin
	    if (txc_arb1_req == TRUE_H) begin            // TXC Request
	       arb_control_sel_in = TXC;                  // Select TXC module
	       next_arb_control_state = CACS6;            // next state
	    end
	    else if (tdmc_arb1_req == TRUE_H) begin      // TDMC Request
	       arb_control_sel_in = TDMC;                 // Select TDMC module
	       next_arb_control_state = CACS7;            // next state
	    end
	    //        else if (rcr_arb1_req == TRUE_H) begin       // RCR Request
	    //          arb_control_sel_in = RCR;                  // Select RCR module
	    //          next_arb_control_state = CACS8;            // next state
	    //        end
	    else if (rbr_arb1_req == TRUE_H) begin       // RBR Request
	       arb_control_sel_in = RBR;                  // Select RBR module
	       next_arb_control_state = CACS9;            // next state
	    end
	    else if (zcp_arb1_req == TRUE_H) begin       // ZCP Request
	       arb_control_sel_in = ZCP;                  // Select ZCP module
	       next_arb_control_state = CACS5;            // next state
	    end
	    else begin                                   // No Request
	       arb_control_sel_in = NULL;                 // Select NULL module
	       next_arb_control_state = CACS0;            // loop
	    end
	 end
	 else begin                                   // No Request
	    arb_control_sel_in = NULL;                 // Select NULL module
	    next_arb_control_state = CACS1;            // loop
	 end
	 arb_control_sel_ld = ASSERT_H;               // load register
      end
      CACS2: begin
	 if (arb1_fifo_not_empty & ~rd_threshold_reached) begin
	    if (tdmc_arb1_req == TRUE_H) begin           // TDMC Request
	       arb_control_sel_in = TDMC;                 // Select TDMC module
	       next_arb_control_state = CACS7;            // next state
	    end
	    //        else if (rcr_arb1_req == TRUE_H) begin       // RCR Request
	    //          arb_control_sel_in = RCR;                  // Select RCR module
	    //          next_arb_control_state = CACS8;            // next state
	    //        end
	    else if (rbr_arb1_req == TRUE_H) begin       // RBR Request
	       arb_control_sel_in = RBR;                  // Select RBR module
	       next_arb_control_state = CACS9;            // next state
	    end
	    else if (zcp_arb1_req == TRUE_H) begin       // ZCP Request
	       arb_control_sel_in = ZCP;                  // Select ZCP module
	       next_arb_control_state = CACS5;            // next state
	    end
	    else if (txc_arb1_req == TRUE_H) begin       // TXC Request
	       arb_control_sel_in = TXC;                  // Select TXC module
	       next_arb_control_state = CACS6;            // next state
	    end
	    else begin                                   // No Request
	       arb_control_sel_in = NULL;                 // Select NULL module
	       next_arb_control_state = CACS0;            // loop
	    end // else: !if(txc_arb1_req == TRUE_H)
	 end
	 else begin                                   // No Request
	    arb_control_sel_in = NULL;                 // Select NULL module
	    next_arb_control_state = CACS2;            // loop
	 end // else: !if(txc_arb1_req == TRUE_H)
	 
	 arb_control_sel_ld = ASSERT_H;               // load register
      end
      CACS3: begin
	 //        if (rcr_arb1_req == TRUE_H) begin            // RCR Request
	 //          arb_control_sel_in = RCR;                  // Select RCR module
	 //          next_arb_control_state = CACS8;            // next state
	 //        end
	 //        else if (rbr_arb1_req == TRUE_H) begin       // RBR Request

	 if (arb1_fifo_not_empty & ~rd_threshold_reached) begin
	    if (rbr_arb1_req == TRUE_H) begin             // RBR Request
	       arb_control_sel_in = RBR;                  // Select RBR module
	       next_arb_control_state = CACS9;            // next state
	    end
	    else if (zcp_arb1_req == TRUE_H) begin       // ZCP Request
	       arb_control_sel_in = ZCP;                  // Select ZCP module
	       next_arb_control_state = CACS5;            // next state
	    end
	    else if (txc_arb1_req == TRUE_H) begin       // TXC Request
	       arb_control_sel_in = TXC;                  // Select TXC module
	       next_arb_control_state = CACS6;            // next state
	    end
	    else if (tdmc_arb1_req == TRUE_H) begin      // TDMC Request
	       arb_control_sel_in = TDMC;                 // Select TDMC module
	       next_arb_control_state = CACS7;            // next state
	    end
	    else begin                                   // No Request
	       arb_control_sel_in = NULL;                 // Select NULL module
	       next_arb_control_state = CACS3;            // loop
	    end // else: !if(tdmc_arb1_req == TRUE_H)
	 end // if (arb1_fifo_not_empty)
	 else begin                                   // No Request
	    arb_control_sel_in = NULL;                 // Select NULL module
	    next_arb_control_state = CACS3;            // loop
	 end
	 arb_control_sel_ld = ASSERT_H;               // load register
      end
      CACS4: begin
	 if (arb1_fifo_not_empty & ~rd_threshold_reached ) begin
	    if (rbr_arb1_req == TRUE_H) begin            // RBR Request
	       arb_control_sel_in = RBR;                  // Select RBR module
	       next_arb_control_state = CACS9;            // next state
	    end
	    else if (zcp_arb1_req == TRUE_H) begin       // ZCP Request
	       arb_control_sel_in = ZCP;                  // Select ZCP module
	       next_arb_control_state = CACS5;            // next state
	    end
	    else if (txc_arb1_req == TRUE_H) begin       // TXC Request
	       arb_control_sel_in = TXC;                  // Select TXC module
	       next_arb_control_state = CACS6;            // next state
	    end
	    else if (tdmc_arb1_req == TRUE_H) begin      // TDMC Request
	       arb_control_sel_in = TDMC;                 // Select TDMC module
	       next_arb_control_state = CACS7;            // next state
	    end
	    //        else if (rcr_arb1_req == TRUE_H) begin       // RCR Request
	    //          arb_control_sel_in = RCR;                  // Select RCR module
	    //          next_arb_control_state = CACS8;            // next state
	    //        end
	    else begin                                   // No Request
	       arb_control_sel_in = NULL;                 // Select NULL module
	       next_arb_control_state = CACS0;            // loop
	    end // else: !if(tdmc_arb1_req == TRUE_H)
	 end // if (arb1_fifo_not_empty)
	 else begin                                   // No Request
	    arb_control_sel_in = NULL;                 // Select NULL module
	    next_arb_control_state = CACS4;            // loop
	 end 
	 arb_control_sel_ld = ASSERT_H;               // load register
      end
      CACS5: begin
        if (meta_dmc1_req_accept == TRUE_H) begin    // Control Complete
	   read_tag = ASSERT_H;
          next_arb_control_state = CACS1;            // next state
        end
        else begin
          next_arb_control_state = CACS5;            // loop
        end
      end
      CACS6: begin
        if (meta_dmc1_req_accept == TRUE_H) begin    // Control Complete
          read_tag        = ASSERT_H;         // Select a new TransID
          next_arb_control_state = CACS2;            // next state
        end
        else begin
          next_arb_control_state = CACS6;            // loop
        end
      end
      CACS7: begin
        if (meta_dmc1_req_accept == TRUE_H) begin    // Control Complete
          read_tag        = ASSERT_H;         // Select a new TransID
          next_arb_control_state = CACS3;            // next state
        end
        else begin
          next_arb_control_state = CACS7;            // loop
        end
      end
      CACS8: begin
        if (meta_dmc1_req_accept == TRUE_H) begin    // Control Complete
          read_tag        = ASSERT_H;         // Select a new TransID
          next_arb_control_state = CACS0;            // next state
        end
        else begin
          next_arb_control_state = CACS8;            // loop
        end
      end
      CACS9: begin
        if (meta_dmc1_req_accept == TRUE_H) begin    // Control Complete
          read_tag        = ASSERT_H;         // Select a new TransID
          next_arb_control_state = CACS0;            // next state
        end
        else begin
          next_arb_control_state = CACS9;            // loop
        end
      end
      default: begin
        next_arb_control_state = CACS0;              // next state
      end
    endcase
  end



/*---------------------------------------------------------------------------
----Dirty TID handing state machine 
 ---------------------------------------------------------------------------*/


     // synopsys translate_off
   
   reg [55:0] 	 DIR_BIN_STATE;
   always @(dirbin_stateR)
     begin
	case(dirbin_stateR)
	  IDLEBIN :      DIR_BIN_STATE = "IDLEBIN";
	  CLRBIN :       DIR_BIN_STATE = "CLRBIN";
	  RDBIN :  DIR_BIN_STATE = "RDBIN";
	  default :    DIR_BIN_STATE = "UNKNOWN";
	endcase
     end

   // synopsys translate_on

 always @ (/*AUTOSENSE*/dirbin_stateR or dirtybinfifo_not_empty
	   or pio_arb_dirtid_clr or transfer_cmpl_pending)
     begin
	// set all default values here
	return_dirty_tag = 1'b0;
	inc_dirtybinfifo_rp = 1'b0;
        dirbin_state = dirbin_stateR;		
	case(dirbin_stateR)
	  IDLEBIN:
	    begin
	       if (pio_arb_dirtid_clr ) begin
		 dirbin_state = CLRBIN;
		  end
		  else
		    dirbin_state = IDLEBIN;	
	    end // case: IDLEBIN
	  CLRBIN:
	    begin
	       if (dirtybinfifo_not_empty) begin
		  if  (transfer_cmpl_pending)
		    dirbin_state = CLRBIN;
		  else begin
		    return_dirty_tag = 1'b1;
	            inc_dirtybinfifo_rp = 1'b1;
	  	  end
	       end // if (dirtybinfifo_not_empty)
	       else
		 dirbin_state = IDLEBIN;
	    end // case: CLRBIN
	  RDBIN:
	    begin
	       inc_dirtybinfifo_rp = 1'b1;
	       dirbin_state = CLRBIN;
	    end 
	  default: dirbin_state = IDLEBIN;
	endcase 
     end





   

/*-----------------------------------------------------------------------------
-- TransID Management
-----------------------------------------------------------------------------*/
 
 niu_meta_rd_tagfifo niu_meta_rd_tagfifo (
			  // Outputs
			  .fifo_not_empty(arb1_fifo_not_empty),
			  .fifo_full	(),
			  .rdout	(rdtagoutR),
			  .dout		(),
			  .count	(),
			  // Inputs
			  .core_clk	(clk),
			  .reset	(reset),
			  .inc_rp	(read_tag),
			  .inc_wp	(write_tag | return_dirty_tag),
			  .din		(reclaimed_transID));
 
 
 /*------------------------------------------------------------------------
  ---Dirty Bin Fifo -----------------------------
  -------------------------------------------------------------------------*/
 niu_meta_arb_syncfifo #(5,32,5) rddirtybinfifo (
				       .core_clk         (clk),
				       .reset            (reset),
				       .inc_rp           (inc_dirtybinfifo_rp),
				       .inc_wp           (write_dirty_tag),
				       .fifo_not_empty    (dirtybinfifo_not_empty),
				       .fifo_full         (dirtybinfifo_full),
				       .count                  (dirty_tag_count),
				       .din                    (meta_dmc_resp_transIDR),
				       .rdout                  (),
				       .dout                   (dirty_tag));

  
 
 
 //------------------------------------------------------------------

  assign dmc_meta_resp_accept_ORd        = dmc_meta_resp_accept[7] |
                                          dmc_meta_resp_accept[6] |
                                          dmc_meta_resp_accept[5] |
                                          dmc_meta_resp_accept[4] |
                                          dmc_meta_resp_accept[3] |
                                          dmc_meta_resp_accept[2] |
                                          dmc_meta_resp_accept[1] |
                                          dmc_meta_resp_accept[0];

  assign meta_dmc_resp_transfer_cmpl_ORd = meta_dmc_resp_transfer_cmpl[7] |
                                           meta_dmc_resp_transfer_cmpl[6] |
                                           meta_dmc_resp_transfer_cmpl[5] |
                                           meta_dmc_resp_transfer_cmpl[4] |
                                           meta_dmc_resp_transfer_cmpl[3] |
                                           meta_dmc_resp_transfer_cmpl[2] |
                                           meta_dmc_resp_transfer_cmpl[1] |
                                           meta_dmc_resp_transfer_cmpl[0];

   assign transaction_timeout = (meta_dmc_resp_cmd_statusR == 4'b1111);



always @ (/*AUTOSENSE*/meta_dmc_resp_transID0R
	  or meta_dmc_resp_transID1R or meta_dmc_resp_transID2R
	  or meta_dmc_resp_transID3R or meta_dmc_resp_transID4R
	  or meta_dmc_resp_transID5R or meta_dmc_resp_transID6R
	  or meta_dmc_resp_transID7R or meta_dmc_resp_transfer_cmpl) begin
   if ( meta_dmc_resp_transfer_cmpl[0])
     meta_dmc_resp_transID_cmpl = meta_dmc_resp_transID0R;
   else if (meta_dmc_resp_transfer_cmpl[1])
    meta_dmc_resp_transID_cmpl = meta_dmc_resp_transID1R;
     else if (meta_dmc_resp_transfer_cmpl[2])
    meta_dmc_resp_transID_cmpl = meta_dmc_resp_transID2R;
     else if (meta_dmc_resp_transfer_cmpl[3])
    meta_dmc_resp_transID_cmpl = meta_dmc_resp_transID3R;
     else if (meta_dmc_resp_transfer_cmpl[4])
    meta_dmc_resp_transID_cmpl = meta_dmc_resp_transID4R;
     else if (meta_dmc_resp_transfer_cmpl[5])
    meta_dmc_resp_transID_cmpl = meta_dmc_resp_transID5R;
     else if (meta_dmc_resp_transfer_cmpl[6])
    meta_dmc_resp_transID_cmpl = meta_dmc_resp_transID6R;
    else if (meta_dmc_resp_transfer_cmpl[7])
    meta_dmc_resp_transID_cmpl = meta_dmc_resp_transID7R;
    else
      meta_dmc_resp_transID_cmpl = 5'b00000;
   end
  
always @ (/*AUTOSENSE*/dirty_tag or meta_dmc_resp_transIDR
	  or return_dirty_tag) begin
   if (return_dirty_tag)
     reclaimed_transID = dirty_tag;
   else
     reclaimed_transID = meta_dmc_resp_transIDR;
   end

   
   /*--------------------------------------
    -- Concurrent processes: State Machine Registers
    --------------------------------------*/

   always @ (posedge clk) begin
     if (reset == 1'b1)
       current_arb_control_state_ff <= 4'h0;          // synchronous reset
     else
       current_arb_control_state_ff <= next_arb_control_state;  
end




/*--------------------------------------
 -- Concurrent processes: Registers
 --------------------------------------*/

always @ (posedge clk) begin: arb_control_sel_reg
   if (reset == 1'b1)
     arb_control_sel_ff <= 3'b000;                  // synchronous reset
   else if (arb_control_sel_ld == TRUE_H)
     arb_control_sel_ff <= arb_control_sel_in;
end


   always @ (posedge clk) begin
      if (reset == 1'b1) begin
	 write_tag <= 1'b0;
	 write_dirty_tag <= 1'b0;
	 meta_dmc_resp_transIDR <= 5'h0;
	 meta_dmc_resp_transID0R <= 5'h0;
	 meta_dmc_resp_transID1R <= 5'h0;
	 meta_dmc_resp_transID2R <= 5'h0;
	 meta_dmc_resp_transID3R <= 5'h0;
	 meta_dmc_resp_transID4R <= 5'h0;
	 meta_dmc_resp_transID5R <= 5'h0;
	 meta_dmc_resp_transID6R <= 5'h0;
	 meta_dmc_resp_transID7R <= 5'h0;
	 meta_dmc_resp_cmd_statusR <= 4'h0;
	 transfer_cmpl_pending <= 1'b0;
	 dirbin_stateR <= 2'b00;
	 arb_pio_dirtid_rdstatus <= 0;
	 outstanding_tid_cnt <= 0;
      end
      else  begin
	 // if dirty tid enable only put non timed out tids in good bin
	 write_tag <= meta_dmc_resp_transfer_cmpl_ORd & ( pio_arb_dirtid_enable ? !transaction_timeout : 1'b1 );
	 write_dirty_tag <= meta_dmc_resp_transfer_cmpl_ORd & transaction_timeout  & pio_arb_dirtid_enable ;
	 meta_dmc_resp_transIDR <= meta_dmc_resp_transID_cmpl;
	 meta_dmc_resp_transID0R <= dmc_meta_resp_accept[0] ? meta_dmc_resp_transID[4:0] : meta_dmc_resp_transID0R;
	 meta_dmc_resp_transID1R <= dmc_meta_resp_accept[1] ? meta_dmc_resp_transID[4:0] : meta_dmc_resp_transID1R;
	 meta_dmc_resp_transID2R <= dmc_meta_resp_accept[2] ? meta_dmc_resp_transID[4:0] : meta_dmc_resp_transID2R;
	 meta_dmc_resp_transID3R <= dmc_meta_resp_accept[3] ? meta_dmc_resp_transID[4:0] : meta_dmc_resp_transID3R;
	 meta_dmc_resp_transID4R <= dmc_meta_resp_accept[4] ? meta_dmc_resp_transID[4:0] : meta_dmc_resp_transID4R;
	 meta_dmc_resp_transID5R <= dmc_meta_resp_accept[5] ? meta_dmc_resp_transID[4:0] : meta_dmc_resp_transID5R;
	 meta_dmc_resp_transID6R <= dmc_meta_resp_accept[6] ? meta_dmc_resp_transID[4:0] : meta_dmc_resp_transID6R;
	 meta_dmc_resp_transID7R <= dmc_meta_resp_accept[7] ? meta_dmc_resp_transID[4:0] : meta_dmc_resp_transID7R;
	 meta_dmc_resp_cmd_statusR <= dmc_meta_resp_accept_ORd ? meta_dmc_resp_cmd_status : meta_dmc_resp_cmd_statusR ;
	 transfer_cmpl_pending <= dmc_meta_resp_accept_ORd ? 1'b1 : meta_dmc_resp_transfer_cmpl_ORd ? 1'b0 : transfer_cmpl_pending;
	 dirbin_stateR <= dirbin_state;
	 arb_pio_dirtid_rdstatus <= dirty_tag_count;

	 if(inc_outstanding_tid_cnt) outstanding_tid_cnt<= outstanding_tid_cnt_add_n;
	 else if(dec_outstanding_tid_cnt)  outstanding_tid_cnt<= outstanding_tid_cnt_sub_n;
      end // else: !if(reset == 1'b1)
   end



 // assign threshold reached  

   assign  rd_threshold_reached = (outstanding_tid_cnt >= pio_arb_rd_threshold); 
// assign outputs

assign   arb_pio_all_rddirty = dirtybinfifo_full;

   
endmodule

