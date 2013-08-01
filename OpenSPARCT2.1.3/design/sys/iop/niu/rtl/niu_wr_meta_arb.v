// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_wr_meta_arb.v
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
--   Write META Arb
--   TransID Management
-- Project: Niagara2/Neptune
-- Platform: 
-- Parent Module: NIU
-- Module: NIU_WR_META_ARB
-- Designer: Carl Childers 
           : Nimita Taneja
-- Date Created: 07/01/2004
-- Date Modified 10/19/2004  
-- Notes: 
--   1.   
--   2.   
-- Rev: 0.1; Board Rev: P1.0
-------------------------------------------------------------------------------
-----------------------------------------------------------------------------*/

/*--------------------------------------
-- Module
--------------------------------------*/

module niu_wr_meta_arb ( /*AUTOARG*/
   // Outputs
   dmc_meta0_req_cmd, dmc_meta0_req_address, dmc_meta0_req_length, 
   dmc_meta0_req_transID, dmc_meta0_req_port_num, 
   dmc_meta0_req_dma_num, dmc_meta0_req_func_num, 
   dmc_meta0_req_client, dmc_meta0_req, dmc_meta0_transfer_complete, 
   dmc_meta0_data, dmc_meta0_req_byteenable, dmc_meta0_status, 
   dmc_meta0_data_valid, arb0_tdmc_req_accept, arb0_tdmc_data_req, 
   arb0_tdmc_req_errors, arb0_rdc_req_accept, arb0_rdc_data_req, 
   arb0_rdc_req_errors, arb0_rcr_req_accept, arb0_rcr_data_req, 
   arb0_rcr_req_errors, arb_pio_dirtid_npwstatus, 
   arb_pio_all_npwdirty, 
   // Inputs
   meta_dmc0_req_accept, meta_dmc0_data_req, meta_dmc0_req_errors, 
   tdmc_arb0_req_cmd, tdmc_arb0_req_address, tdmc_arb0_req_length, 
   tdmc_arb0_req_port_num, tdmc_arb0_req_dma_num, 
   tdmc_arb0_req_func_num, tdmc_arb0_req, 
   tdmc_arb0_transfer_complete, tdmc_arb0_data, 
   tdmc_arb0_req_byteenable, tdmc_arb0_status, tdmc_arb0_data_valid, 
   rdc_arb0_req_cmd, rdc_arb0_req_address, rdc_arb0_req_length, 
   rdc_arb0_req_port_num, rdc_arb0_req_dma_num, 
   rdc_arb0_req_func_num, rdc_arb0_req, rdc_arb0_transfer_complete, 
   rdc_arb0_data, rdc_arb0_req_byteenable, rdc_arb0_status, 
   rdc_arb0_data_valid, rcr_arb0_req_cmd, rcr_arb0_req_address, 
   rcr_arb0_req_length, rcr_arb0_req_port_num, rcr_arb0_req_dma_num, 
   rcr_arb0_req_func_num, rcr_arb0_req, rcr_arb0_transfer_complete, 
   rcr_arb0_data, rcr_arb0_req_byteenable, rcr_arb0_status, 
   rcr_arb0_data_valid, meta_dmc_ack_transID, dmc_meta_ack_accept, 
   meta_dmc_ack_transfer_cmpl, meta_dmc_ack_cmd_status, 
   pio_arb_dirtid_enable, pio_arb_dirtid_clr, pio_arb_np_threshold, 
   clk, reset
   );                                       // from reset


/*-----------------------------------------------------------------------------
-- Declarations
-----------------------------------------------------------------------------*/
/*--------------------------------------
-- Port Declaration
--------------------------------------*/

  // META Request Outputs
  output   [7:0] dmc_meta0_req_cmd;                  // Command Request
  output  [63:0] dmc_meta0_req_address;              // Memory Address
  output  [13:0] dmc_meta0_req_length;               // Packet Length
  output   [5:0] dmc_meta0_req_transID;              // Transaction ID
  output   [1:0] dmc_meta0_req_port_num;             // Port Number
  output   [4:0] dmc_meta0_req_dma_num;              // Channel Number
  output   [1:0] dmc_meta0_req_func_num;              // Channel Number
  output   [7:0] dmc_meta0_req_client;               // Client [vector]
  output         dmc_meta0_req;                      // Req Command Request
  output         dmc_meta0_transfer_complete;        // Transfer Data Complete

  output [127:0] dmc_meta0_data;                     // Transfer Data
  output  [15:0] dmc_meta0_req_byteenable;           // First/Last BE
  output   [3:0] dmc_meta0_status;                   // Transfer Data Status
  output         dmc_meta0_data_valid;               // Transfer Data Ack

  // TDMC I/F Output
  output         arb0_tdmc_req_accept;               // Response to REQ
  output         arb0_tdmc_data_req;                 // Memory line request
  output         arb0_tdmc_req_errors;               // Error flag

  // RDC I/F Output
  output         arb0_rdc_req_accept;                // Response to REQ
  output         arb0_rdc_data_req;                  // Memory line request
  output         arb0_rdc_req_errors;                // Error flag

  // RCR I/F Output
  output         arb0_rcr_req_accept;                // Response to REQ
  output         arb0_rcr_data_req;                  // Memory line request
  output         arb0_rcr_req_errors;                // Error flag

   output [5:0]  arb_pio_dirtid_npwstatus;//  count for number of np write TID's dirty
   output 	 arb_pio_all_npwdirty;   // all dirty bin entries are dirty



  // RBR I/F Output
//  output         arb0_rbr_req_accept;                // Response to REQ
//  output         arb0_rbr_data_req;                  // Memory line request
//  output         arb0_rbr_req_errors;                // Error flag

  // META Request Inputs
  input          meta_dmc0_req_accept;               // Response to REQ
  input          meta_dmc0_data_req;                 // Memory line request
  input          meta_dmc0_req_errors;               // Error flag

  // TDMC I/F Inputs
  input    [7:0] tdmc_arb0_req_cmd;                  // Command Request
  input   [63:0] tdmc_arb0_req_address;              // Memory Address
  input   [13:0] tdmc_arb0_req_length;               // Packet Length
  input    [1:0] tdmc_arb0_req_port_num;             // Port Number
  input    [4:0] tdmc_arb0_req_dma_num;              // Channel Number
  input    [1:0] tdmc_arb0_req_func_num;              // Func Number
  input          tdmc_arb0_req;                      // Req Command Request
  input          tdmc_arb0_transfer_complete;        // Transfer Data Complete

  input  [127:0] tdmc_arb0_data;                     // Transfer Data
  input   [15:0] tdmc_arb0_req_byteenable;           // First/Last BE
  input    [3:0] tdmc_arb0_status;                   // Transfer Data Status
  input          tdmc_arb0_data_valid;               // Transfer Data Ack

  // RDC I/F Inputs
  input    [7:0] rdc_arb0_req_cmd;                   // Command Request
  input   [63:0] rdc_arb0_req_address;               // Memory Address
  input   [13:0] rdc_arb0_req_length;                // Packet Length
  input    [1:0] rdc_arb0_req_port_num;              // Port Number
  input    [4:0] rdc_arb0_req_dma_num;               // Channel Number
  input    [1:0] rdc_arb0_req_func_num;               // Channel Number
  input          rdc_arb0_req;                       // Req Command Request
  input          rdc_arb0_transfer_complete;         // Transfer Data Complete

  input  [127:0] rdc_arb0_data;                      // Transfer Data
  input   [15:0] rdc_arb0_req_byteenable;            // First/Last BE
  input    [3:0] rdc_arb0_status;                    // Transfer Data Status
  input          rdc_arb0_data_valid;                // Transfer Data Ack

  // RCR I/F Inputs
  input    [7:0] rcr_arb0_req_cmd;                   // Command Request
  input   [63:0] rcr_arb0_req_address;               // Memory Address
  input   [13:0] rcr_arb0_req_length;                // Packet Length
  input    [1:0] rcr_arb0_req_port_num;              // Port Number
  input    [4:0] rcr_arb0_req_dma_num;               // Channel Number
  input    [1:0] rcr_arb0_req_func_num;               // Channel Number
  input          rcr_arb0_req;                       // Req Command Request
  input          rcr_arb0_transfer_complete;         // Transfer Data Complete

  input  [127:0] rcr_arb0_data;                      // Transfer Data
  input   [15:0] rcr_arb0_req_byteenable;            // First/Last BE
  input    [3:0] rcr_arb0_status;                    // Transfer Data Status
  input          rcr_arb0_data_valid;                // Transfer Data Ack

  // RBR I/F Inputs
//  input    [7:0] rbr_arb0_req_cmd;                   // Command Request
//  input   [63:0] rbr_arb0_req_address;               // Memory Address
//  input   [13:0] rbr_arb0_req_length;                // Packet Length
//  input    [1:0] rbr_arb0_req_port_num;              // Port Number
//  input    [4:0] rbr_arb0_req_dma_num;               // Channel Number
//  input          rbr_arb0_req;                       // Req Command Request
//  input          rbr_arb0_transfer_complete;         // Transfer Data Complete

//  input  [127:0] rbr_arb0_data;                      // Transfer Data
//  input   [15:0] rbr_arb0_req_byteenable;            // First/Last BE
//  input    [3:0] rbr_arb0_status;                    // Transfer Data Status
//  input          rbr_arb0_data_valid;                // Transfer Data Ack

  // META Acknowledge Input
  input    [5:0] meta_dmc_ack_transID;               // Free TransID
  input    [7:0] dmc_meta_ack_accept;                // Valid TransID
  input    [7:0] meta_dmc_ack_transfer_cmpl;         // Last trans of TransID
   input [3:0] 	 meta_dmc_ack_cmd_status;       // status in command phase


    //Dirty TID Interface
   input 	 pio_arb_dirtid_enable; // Enable Dirty TID logic
   input 	 pio_arb_dirtid_clr;    // Clear all Dirty TID Entries
   input [5:0] 	 pio_arb_np_threshold; // np write threshold


  // other inputs
  input          clk;                                // core clock
  input          reset;                              // reset

/***************************************/
/* Wire Declaration                    */
/***************************************/
 /*AUTOWIRE*/
 // Beginning of automatic wires (for undeclared instantiated-module outputs)
 // End of automatics
 
   wire 		arb0_fifo_not_empty;		// From arb_tagfifo of arb_tagfifo.v
   wire [4:0] 		rdtagoutR;			// From arb_tagfifo of arb_tagfifo.v

   wire 		dmc_meta_ack_accept_ORd;

   wire 	meta_dmc_ack_transfer_cmpl_ORd;
   wire 	posted_req_accepted;
   wire 	posted_req;

   
   wire 	transaction_timeout;
   wire [5:0] 	dirty_tag_count;
   wire 	dirtybinfifo_not_empty;
   wire 	dirtybinfifo_full;
   wire [4:0] 	dirty_tag;
   wire 	arb_pio_all_npwdirty;
   wire 	npw_threshold_reached;
   
/***************************************/
/* Reg Declaration                    */
/***************************************/
   reg [2:0] 	arb_control_sel_ff,
                arb_control_sel_in;
   reg 		arb_control_sel_ld;
//   reg [2:0] 	arb_control_sel_ffR;

   reg [2:0] 	arb_datapath_sel_ff,
                arb_datapath_sel_in;
   reg 		arb_datapath_sel_ld;

  // Transaction ID tag read and write pointer incrementer
   reg 		read_tag;
   reg 		write_tag;
   reg          write_dirty_tag;
   reg 		meta_dmc_ack_transfer_cmpl_ORdR;
   reg [4:0] 	meta_dmc_ack_transID_cmpl;
   reg [4:0] 	meta_dmc_ack_transIDR;
   reg [4:0] 	meta_dmc_ack_transID0R;
   reg [4:0] 	meta_dmc_ack_transID1R;
   reg [4:0] 	meta_dmc_ack_transID2R;
   reg [4:0] 	meta_dmc_ack_transID3R;
   reg [4:0] 	meta_dmc_ack_transID4R;
   reg [4:0] 	meta_dmc_ack_transID5R;
   reg [4:0] 	meta_dmc_ack_transID6R;
   reg [4:0] 	meta_dmc_ack_transID7R; 
   reg [4:0]    dmc_meta0_req_transIDR;
   reg [3:0] 	meta_dmc_ack_cmd_statusR;



  // Arb Control MUX
  reg     [7:0] mux_dmc_meta0_req_cmd;
  reg    [63:0] mux_dmc_meta0_req_address;
  reg    [13:0] mux_dmc_meta0_req_length;
  reg     [1:0] mux_dmc_meta0_req_port_num;
  reg     [4:0] mux_dmc_meta0_req_dma_num;
  reg     [1:0] mux_dmc_meta0_req_func_num;
  reg     [7:0] mux_dmc_meta0_req_client;
  reg           mux_dmc_meta0_req;

  reg           demux_arb0_tdmc_req_accept;
  reg           demux_arb0_rdc_req_accept;
  reg           demux_arb0_rcr_req_accept;
//  reg           demux_arb0_rbr_req_accept;

  // Arb Control State Machine
 
//   reg 		fsm_start_datapath_fsm;
//   reg          start_data_phase;
//   reg          data_phase_started;        		  

  reg     [2:0] current_arb_control_state_ff,
                next_arb_control_state;

  // Arb Datapath MUX
  reg           mux_dmc_meta0_transfer_complete;

  reg   [127:0] mux_dmc_meta0_data;
  reg    [15:0] mux_dmc_meta0_req_byteenable;
  reg     [3:0] mux_dmc_meta0_status;
  reg           mux_dmc_meta0_data_valid;

  reg           demux_arb0_tdmc_data_req;
  reg           demux_arb0_tdmc_req_errors;

  reg           demux_arb0_rdc_data_req;
  reg           demux_arb0_rdc_req_errors;

  reg           demux_arb0_rcr_data_req;
  reg           demux_arb0_rcr_req_errors;

//  reg           demux_arb0_rbr_data_req;
//  reg           demux_arb0_rbr_req_errors;

  // Arb Datapath State Machine
//  reg     [2:0] current_arb_datapath_state_ff,
//                next_arb_datapath_state;

  // Returned TransID State Machine
 reg 	sel_posted_tag;
    //State Register
   
   reg 	state, stateR; 
   reg [4:0] returned_tag;
   reg 	     posted_req_acceptedR;

   // dirty bin registers
   reg 		transfer_cmpl_pending;
   reg [5:0] 	arb_pio_dirtid_npwstatus;
   reg [1:0]    dirbin_state, dirbin_stateR;
   reg 		inc_dirtybinfifo_rp;
   reg 		return_dirty_tag;
   reg [5:0] 	outstanding_tid_cnt;

   wire inc_outstanding_tid_cnt= (meta_dmc0_req_accept & ~posted_req) & ~meta_dmc_ack_transfer_cmpl_ORd;
   wire dec_outstanding_tid_cnt= meta_dmc_ack_transfer_cmpl_ORd & ~(meta_dmc0_req_accept &  ~posted_req);

   wire [5:0] outstanding_tid_cnt_plus1= outstanding_tid_cnt + 1'b1; 
   wire [5:0] outstanding_tid_cnt_minus1= outstanding_tid_cnt - 1'b1; 
   wire [5:0] outstanding_tid_cnt_add_n= (outstanding_tid_cnt==6'd32)? 6'h0 : outstanding_tid_cnt_plus1;
   wire [5:0] outstanding_tid_cnt_sub_n= (outstanding_tid_cnt==6'd0)? 6'h0 : outstanding_tid_cnt_minus1;


wire tdmc_is_post= tdmc_arb0_req_cmd[5];
wire rdc_is_post= rdc_arb0_req_cmd[5];
wire rcr_is_post= rcr_arb0_req_cmd[5];

// active low; mask off req if threshold reached and req is non-post 
wire mask_tdmc_req_l= ~(npw_threshold_reached & ~tdmc_is_post);
wire mask_rdc_req_l= ~(npw_threshold_reached & ~rdc_is_post);
wire mask_rcr_req_l= ~(npw_threshold_reached & ~rcr_is_post);

wire tdmc_arb0_req_cond= tdmc_arb0_req & mask_tdmc_req_l;
wire rdc_arb0_req_cond= rdc_arb0_req & mask_rdc_req_l;
wire rcr_arb0_req_cond= rcr_arb0_req & mask_rcr_req_l;

   
/***************************************/
/* Parameter Declaration               */
/***************************************/

  parameter  [2:0] NULL             = 3'b000,
                   TDMC             = 3'b001,
                   RDC              = 3'b010,
                   RCR              = 3'b011;
//                   RBR              = 3'b100;

 

   parameter  [7:0] NULL_CLIENT      = 8'h00,
		    TDMC_CLIENT      = 8'h04,
		    RDC_CLIENT       = 8'h08,
		    RCR_CLIENT       = 8'h10;
        
  


  parameter  [2:0] CACS0            = 3'b000,
                   CACS1            = 3'b001,
                   CACS2            = 3'b010,
                   CACS3            = 3'b011,
                   CACS4            = 3'b100,
                   CACS5            = 3'b101,
                   CACS6            = 3'b110,
                   CACS7            = 3'b111;

/*
  parameter  [2:0] CADS0            = 3'b000,
                   CADS1            = 3'b001,
                   CADS2            = 3'b010,
                   CADS3            = 3'b011,
                   CADS4            = 3'b100;
*/



  parameter         ZERO_1          = 1'b0;
  parameter   [1:0] ZEROES_2        = 2'b00;
  parameter   [3:0] ZEROES_4        = 4'h0;
  parameter   [4:0] ZEROES_5        = 5'b00000;
  parameter   [7:0] ZEROES_8        = 8'b00000000;
  parameter  [13:0] ZEROES_14       = 14'b00000000000000;
  parameter  [15:0] ZEROES_16       = 16'h0;
  parameter  [63:0] ZEROES_64       = 64'h0000;
  parameter [127:0] ZEROES_128      = 128'h00000000;

  // misc
  parameter        ASSERT_H         = 1'b1,
                   DEASSERT_L       = 1'b0,
                   TRUE_H           = 1'b1;


   parameter IDLE = 1'b0,
	     TAG1 = 1'b1;

   parameter [1:0] IDLEBIN = 2'b00,
		   CLRBIN = 2'b01,
		   RDBIN = 2'b10;

/*-----------------------------------------------------------------------------
-- Output Assignments
-----------------------------------------------------------------------------*/
  // META Request Outputs
  assign dmc_meta0_req_cmd           = mux_dmc_meta0_req_cmd;
  assign dmc_meta0_req_address       = mux_dmc_meta0_req_address;
  assign dmc_meta0_req_length        = mux_dmc_meta0_req_length;
  assign dmc_meta0_req_transID       =  {1'b1,rdtagoutR};
  assign dmc_meta0_req_port_num      = mux_dmc_meta0_req_port_num;
  assign dmc_meta0_req_dma_num       = mux_dmc_meta0_req_dma_num;
  assign dmc_meta0_req_func_num       = mux_dmc_meta0_req_func_num;
  assign dmc_meta0_req_client        = mux_dmc_meta0_req_client;
  assign dmc_meta0_req               = mux_dmc_meta0_req;
  assign dmc_meta0_transfer_complete = mux_dmc_meta0_transfer_complete;

  assign dmc_meta0_data              = mux_dmc_meta0_data;
  assign dmc_meta0_req_byteenable    = mux_dmc_meta0_req_byteenable;
  assign dmc_meta0_status            = mux_dmc_meta0_status;
  assign dmc_meta0_data_valid        = mux_dmc_meta0_data_valid;

  // TDMC I/F Outputs
  assign arb0_tdmc_req_accept        = demux_arb0_tdmc_req_accept;
  assign arb0_tdmc_data_req          = demux_arb0_tdmc_data_req;
  assign arb0_tdmc_req_errors        = demux_arb0_tdmc_req_errors;

  // RDC I/F Outputs
  assign arb0_rdc_req_accept         = demux_arb0_rdc_req_accept;
  assign arb0_rdc_data_req           = demux_arb0_rdc_data_req;
  assign arb0_rdc_req_errors         = demux_arb0_rdc_req_errors;

  // RCR I/F Outputs
  assign arb0_rcr_req_accept         = demux_arb0_rcr_req_accept;
  assign arb0_rcr_data_req           = demux_arb0_rcr_data_req;
  assign arb0_rcr_req_errors         = demux_arb0_rcr_req_errors;

  // RBR I/F Outputs
//  assign arb0_rbr_req_accept         = demux_arb0_rbr_req_accept;
//  assign arb0_rbr_data_req           = demux_arb0_rbr_data_req;
//  assign arb0_rbr_req_errors         = demux_arb0_rbr_req_errors;


/*-----------------------------------------------------------------------------
-- Arbitration CONTROL
-----------------------------------------------------------------------------*/
/*--------------------------------------
-- Concurrent combinatorial logic: Arbitration CONTROL MUX
--------------------------------------*/

  always @ (tdmc_arb0_req_cmd     or tdmc_arb0_req_address  or
            tdmc_arb0_req_length  or tdmc_arb0_req_port_num or
            tdmc_arb0_req_dma_num or tdmc_arb0_req_cond          or
	    tdmc_arb0_req_func_num or

            rdc_arb0_req_cmd      or rdc_arb0_req_address   or
            rdc_arb0_req_length   or rdc_arb0_req_port_num  or
            rdc_arb0_req_dma_num  or rdc_arb0_req_cond           or
	    rdc_arb0_req_func_num or

            rcr_arb0_req_cmd      or rcr_arb0_req_address   or
            rcr_arb0_req_length   or rcr_arb0_req_port_num  or
            rcr_arb0_req_dma_num  or rcr_arb0_req_cond           or
	    rcr_arb0_req_func_num or

//            rbr_arb0_req_cmd      or rbr_arb0_req_address   or
//            rbr_arb0_req_length   or rbr_arb0_req_port_num  or
//            rbr_arb0_req_dma_num  or rbr_arb0_req           or

            meta_dmc0_req_accept  or arb_control_sel_ff)

  begin: arbitration_control_mux
    mux_dmc_meta0_req_cmd      = ZEROES_8;
    mux_dmc_meta0_req_address  = ZEROES_64;
    mux_dmc_meta0_req_length   = ZEROES_14;
    mux_dmc_meta0_req_port_num = ZEROES_2;
    mux_dmc_meta0_req_dma_num  = ZEROES_5;
    mux_dmc_meta0_req_func_num  = ZEROES_2;
    mux_dmc_meta0_req_client   = NULL_CLIENT;
    mux_dmc_meta0_req          = ZERO_1;

    demux_arb0_tdmc_req_accept = ZERO_1;
    demux_arb0_rdc_req_accept  = ZERO_1;
    demux_arb0_rcr_req_accept  = ZERO_1;
//    demux_arb0_rbr_req_accept  = ZERO_1;

    case (arb_control_sel_ff) /* synopsys parallel_case full_case */
      NULL: begin
        mux_dmc_meta0_req_cmd      = ZEROES_8;
        mux_dmc_meta0_req_address  = ZEROES_64;
        mux_dmc_meta0_req_length   = ZEROES_14;
        mux_dmc_meta0_req_port_num = ZEROES_2;
        mux_dmc_meta0_req_dma_num  = ZEROES_5;
        mux_dmc_meta0_req_func_num  = ZEROES_2;
        mux_dmc_meta0_req_client   = NULL_CLIENT;
        mux_dmc_meta0_req          = ZERO_1;
        demux_arb0_tdmc_req_accept = ZERO_1;
        demux_arb0_rdc_req_accept  = ZERO_1;
        demux_arb0_rcr_req_accept  = ZERO_1;
//        demux_arb0_rbr_req_accept  = ZERO_1;
      end
      TDMC: begin
        mux_dmc_meta0_req_cmd      = tdmc_arb0_req_cmd;
        mux_dmc_meta0_req_address  = tdmc_arb0_req_address;
        mux_dmc_meta0_req_length   = tdmc_arb0_req_length;
        mux_dmc_meta0_req_port_num = tdmc_arb0_req_port_num;
        mux_dmc_meta0_req_dma_num  = tdmc_arb0_req_dma_num;
        mux_dmc_meta0_req_func_num  = tdmc_arb0_req_func_num;
        mux_dmc_meta0_req_client   = TDMC_CLIENT;
        mux_dmc_meta0_req          = tdmc_arb0_req_cond;

        demux_arb0_tdmc_req_accept = meta_dmc0_req_accept;
      end
      RDC: begin
        mux_dmc_meta0_req_cmd      = rdc_arb0_req_cmd;
        mux_dmc_meta0_req_address  = rdc_arb0_req_address;
        mux_dmc_meta0_req_length   = rdc_arb0_req_length;
        mux_dmc_meta0_req_port_num = rdc_arb0_req_port_num;
        mux_dmc_meta0_req_dma_num  = rdc_arb0_req_dma_num;
        mux_dmc_meta0_req_func_num  = rdc_arb0_req_func_num;
        mux_dmc_meta0_req_client   = RDC_CLIENT;
        mux_dmc_meta0_req          = rdc_arb0_req_cond;

        demux_arb0_rdc_req_accept  = meta_dmc0_req_accept;
      end
      RCR: begin
        mux_dmc_meta0_req_cmd      = rcr_arb0_req_cmd;
        mux_dmc_meta0_req_address  = rcr_arb0_req_address;
        mux_dmc_meta0_req_length   = rcr_arb0_req_length;
        mux_dmc_meta0_req_port_num = rcr_arb0_req_port_num;
        mux_dmc_meta0_req_dma_num  = rcr_arb0_req_dma_num;
        mux_dmc_meta0_req_func_num  = rcr_arb0_req_func_num;
        mux_dmc_meta0_req_client   = RCR_CLIENT;
        mux_dmc_meta0_req          = rcr_arb0_req_cond;

        demux_arb0_rcr_req_accept  = meta_dmc0_req_accept;
      end
//      RBR: begin
//        mux_dmc_meta0_req_cmd      = rbr_arb0_req_cmd;
//        mux_dmc_meta0_req_address  = rbr_arb0_req_address;
//        mux_dmc_meta0_req_length   = rbr_arb0_req_length;
//        mux_dmc_meta0_req_port_num = rbr_arb0_req_port_num;
//        mux_dmc_meta0_req_dma_num  = rbr_arb0_req_dma_num;
//        mux_dmc_meta0_req_client   = RBR_CLIENT;
//        mux_dmc_meta0_req          = rbr_arb0_req;

//        demux_arb0_rbr_req_accept  = meta_dmc0_req_accept;
//      end
      default: begin
        mux_dmc_meta0_req_cmd      = ZEROES_8;
        mux_dmc_meta0_req_address  = ZEROES_64;
        mux_dmc_meta0_req_length   = ZEROES_14;
        mux_dmc_meta0_req_port_num = ZEROES_2;
        mux_dmc_meta0_req_dma_num  = ZEROES_5;
        mux_dmc_meta0_req_func_num  = ZEROES_2;
        mux_dmc_meta0_req_client   = NULL_CLIENT;
        mux_dmc_meta0_req          = ZERO_1;

        demux_arb0_tdmc_req_accept = ZERO_1;
        demux_arb0_rdc_req_accept  = ZERO_1;
        demux_arb0_rcr_req_accept  = ZERO_1;
//        demux_arb0_rbr_req_accept  = ZERO_1;
      end
    endcase
  end

/*--------------------------------------
-- Concurrent combinatorial logic:Round Robin Arbitration CONTROL State Machine
--------------------------------------*/
   always @ (/*AUTOSENSE*/arb0_fifo_not_empty
	     or current_arb_control_state_ff or meta_dmc0_req_accept
	     or rcr_arb0_req_cond or rdc_arb0_req_cond or tdmc_arb0_req_cond or
	     arb_control_sel_ff)
     begin: arbitration_control_fsm
	arb_control_sel_in = NULL;
	arb_control_sel_ld = DEASSERT_L;
	arb_datapath_sel_ld= 1'b0; // @accept, datapath switch to that client;
	arb_datapath_sel_in= NULL; // ok for pipeline since meta will not accept 
				   // if diff client; same client loaded in data sel
	read_tag    = DEASSERT_L;
//	fsm_start_datapath_fsm = DEASSERT_L;
	next_arb_control_state = CACS0;
	case (current_arb_control_state_ff) /* synopsys parallel_case full_case */
	  CACS0: begin
	     if  (arb0_fifo_not_empty) begin
		if (tdmc_arb0_req_cond == TRUE_H) begin           // TDMC Request
		   arb_control_sel_in = TDMC;                 // Select TDMC module
		   next_arb_control_state = CACS4;            // next state
		end
		else if (rdc_arb0_req_cond == TRUE_H) begin       // RDC Request
		   arb_control_sel_in = RDC;                  // Select RDC module
		   next_arb_control_state = CACS5;            // next state
		end
		else if (rcr_arb0_req_cond == TRUE_H) begin       // RCR Request
		   arb_control_sel_in = RCR;                  // Select RCR module
		   next_arb_control_state = CACS6;            // next state
		end
		//        else if (rbr_arb0_req == TRUE_H) begin       // RBR Request
		//          arb_control_sel_in = RBR;                  // Select RBR module
		//          next_arb_control_state = CACS7;            // next state
		//        end
		else begin                                   // No Request
		   arb_control_sel_in = NULL;                 // Select NULL module
		   next_arb_control_state = CACS0;            // loop
		end // else: !if(rcr_arb0_req == TRUE_H)
	     end
	     else begin                                   // No Request
		arb_control_sel_in = NULL;                 // Select NULL module
		next_arb_control_state = CACS0;            // loop
	     end  
	     arb_control_sel_ld = ASSERT_H;               // load register
	  end
	  CACS1: begin
	     if (arb0_fifo_not_empty) begin
		if (rdc_arb0_req_cond == TRUE_H) begin            // RDC Request
		   arb_control_sel_in = RDC;                  // Select RDC module
		   next_arb_control_state = CACS5;            // next state
		end
		else if (rcr_arb0_req_cond == TRUE_H) begin       // RCR Request
		   arb_control_sel_in = RCR;                  // Select RCR module
		   next_arb_control_state = CACS6;            // next state
		end
		//        else if (rbr_arb0_req == TRUE_H) begin       // RBR Request
		//          arb_control_sel_in = RBR;                  // Select RBR module
		//          next_arb_control_state = CACS7;            // next state
		//        end
		else if (tdmc_arb0_req_cond == TRUE_H) begin      // TDMC Request
		   arb_control_sel_in = TDMC;                 // Select TDMC module
		   next_arb_control_state = CACS4;            // next state
		end
		else begin                                   // No Request
		   arb_control_sel_in = NULL;                 // Select NULL module
		   next_arb_control_state = CACS1;            // loop
		end
	     end 
	     else begin                                   // No Request
		arb_control_sel_in = NULL;                 // Select NULL module
		next_arb_control_state = CACS1;            // loop
	     end
	     arb_control_sel_ld = ASSERT_H;               // load register
	  end
	  CACS2: begin
	     if (arb0_fifo_not_empty) begin
		if (rcr_arb0_req_cond == TRUE_H) begin            // RCR Request
		   arb_control_sel_in = RCR;                  // Select RCR module
		   next_arb_control_state = CACS6;            // next state
		end
		//        else if (rbr_arb0_req == TRUE_H) begin       // RBR Request
		//          arb_control_sel_in = RBR;                  // Select RBR module
		//          next_arb_control_state = CACS7;            // next state
		//        end
		else if (tdmc_arb0_req_cond == TRUE_H) begin      // TDMC Request
		   arb_control_sel_in = TDMC;                 // Select TDMC module
		   next_arb_control_state = CACS4;            // next state
		end
		else if (rdc_arb0_req_cond == TRUE_H) begin       // RDC Request
		   arb_control_sel_in = RDC;                  // Select RDC module
		   next_arb_control_state = CACS5;            // next state
		end
		else begin                                   // No Request
		   arb_control_sel_in = NULL;                 // Select NULL module
		   next_arb_control_state = CACS2;            // loop
		end // else: !if(rdc_arb0_req == TRUE_H)
	     end // if (arb0_fifo_not_empty)
	     else begin                                   // No Request
		arb_control_sel_in = NULL;                 // Select NULL module
		next_arb_control_state = CACS2;            // loop
	     end
	     arb_control_sel_ld = ASSERT_H;               // load register
	  end
	  CACS3: begin
	     if (arb0_fifo_not_empty) begin
		//        if (rbr_arb0_req == TRUE_H) begin            // RBR Request
		//          arb_control_sel_in = RBR;                  // Select RBR module
		//          next_arb_control_state = CACS7;            // next state
		//        end
		//        else if (tdmc_arb0_req == TRUE_H) begin      // TDMC Request
		if (tdmc_arb0_req_cond == TRUE_H) begin           // TDMC Request
		   arb_control_sel_in = TDMC;                 // Select TDMC module
		   next_arb_control_state = CACS4;            // next state
		end
		else if (rdc_arb0_req_cond == TRUE_H) begin       // RDC Request
		   arb_control_sel_in = RDC;                  // Select RDC module
		   next_arb_control_state = CACS5;            // next state
		end
		else if (rcr_arb0_req_cond == TRUE_H) begin       // RCR Request
		   arb_control_sel_in = RCR;                  // Select RCR module
		   next_arb_control_state = CACS6;            // next state
		end
		else begin                                   // No Request
		   arb_control_sel_in = NULL;                 // Select NULL module
		   next_arb_control_state = CACS3;            // loop
		end // else: !if(rcr_arb0_req == TRUE_H)
	     end
	     else begin                                   // No Request
		arb_control_sel_in = NULL;                 // Select NULL module
		next_arb_control_state = CACS3;            // loop
	     end
	     arb_control_sel_ld = ASSERT_H;               // load register
	  end
	  CACS4: begin
	     if (meta_dmc0_req_accept == TRUE_H) begin    // Control Complete
		read_tag        = ASSERT_H;         // Select a new TransID
//		fsm_start_datapath_fsm = ASSERT_H;         // Start Datapath FSM
		next_arb_control_state = CACS1;            // next state
		arb_datapath_sel_ld= 1'b1;
		arb_datapath_sel_in= arb_control_sel_ff;
	     end
	     else begin
		next_arb_control_state = CACS4;            // loop
	     end
	  end
	  CACS5: begin
	     if (meta_dmc0_req_accept == TRUE_H) begin    // Control Complete
		read_tag        = ASSERT_H;         // Select a new TransID
//		fsm_start_datapath_fsm = ASSERT_H;         // Start Datapath FSM
		next_arb_control_state = CACS2;            // next state
		arb_datapath_sel_ld= 1'b1;
		arb_datapath_sel_in= arb_control_sel_ff;
	     end
	     else begin
		next_arb_control_state = CACS5;            // loop
	     end
	  end
	  CACS6: begin
	     if (meta_dmc0_req_accept == TRUE_H) begin    // Control Complete
		read_tag        = ASSERT_H;         // Select a new TransID
//		fsm_start_datapath_fsm = ASSERT_H;         // Start Datapath FSM
		next_arb_control_state = CACS3;            // next state
		arb_datapath_sel_ld= 1'b1;
		arb_datapath_sel_in= arb_control_sel_ff;
	     end
	     else begin
		next_arb_control_state = CACS6;            // loop
	     end
	  end
	  CACS7: begin
	     if (meta_dmc0_req_accept == TRUE_H) begin    // Control Complete
		read_tag        = ASSERT_H;         // Select a new TransID
//		fsm_start_datapath_fsm = ASSERT_H;         // Start Datapath FSM
		next_arb_control_state = CACS0;            // next state
		arb_datapath_sel_ld= 1'b1;
		arb_datapath_sel_in= arb_control_sel_ff;
	     end
	     else begin
		next_arb_control_state = CACS7;            // loop
	     end
	  end
	  default: begin
	     next_arb_control_state = CACS0;              // next state
	  end
	endcase
     end


/*-----------------------------------------------------------------------------
-- Arbitration DATAPATH
-----------------------------------------------------------------------------*/
/*--------------------------------------
-- Concurrent combinatorial logic: Arbitration DATAPATH MUX
--------------------------------------*/

  always @ (tdmc_arb0_transfer_complete or tdmc_arb0_data       or
            tdmc_arb0_req_byteenable    or tdmc_arb0_status     or
            tdmc_arb0_data_valid        or

            rdc_arb0_transfer_complete  or rdc_arb0_data        or
            rdc_arb0_req_byteenable     or rdc_arb0_status      or
            rdc_arb0_data_valid         or

            rcr_arb0_transfer_complete  or rcr_arb0_data        or
            rcr_arb0_req_byteenable     or rcr_arb0_status      or
            rcr_arb0_data_valid         or

//            rbr_arb0_transfer_complete  or rbr_arb0_data        or
//            rbr_arb0_req_byteenable     or rbr_arb0_status      or
//            rbr_arb0_data_valid         or

            meta_dmc0_data_req          or meta_dmc0_req_errors or  

            arb_datapath_sel_ff)

  begin: arbitration_datapath_mux
    mux_dmc_meta0_transfer_complete = ZERO_1;

    mux_dmc_meta0_data              = ZEROES_128;
    mux_dmc_meta0_req_byteenable    = ZEROES_16;
    mux_dmc_meta0_status            = ZEROES_4;
    mux_dmc_meta0_data_valid        = ZERO_1;

    demux_arb0_tdmc_data_req        = ZERO_1;
    demux_arb0_tdmc_req_errors      = ZERO_1;

    demux_arb0_rdc_data_req         = ZERO_1;
    demux_arb0_rdc_req_errors       = ZERO_1;

    demux_arb0_rcr_data_req         = ZERO_1;
    demux_arb0_rcr_req_errors       = ZERO_1;

//    demux_arb0_rbr_data_req         = ZERO_1;
//    demux_arb0_rbr_req_errors       = ZERO_1;

    case (arb_datapath_sel_ff) /* synopsys parallel_case full_case */
      NULL: begin
        mux_dmc_meta0_transfer_complete = ZERO_1;

        mux_dmc_meta0_data              = ZEROES_128;
        mux_dmc_meta0_req_byteenable    = ZEROES_16;
        mux_dmc_meta0_status            = ZEROES_4;
        mux_dmc_meta0_data_valid        = ZERO_1;

        demux_arb0_tdmc_data_req        = ZERO_1;
        demux_arb0_tdmc_req_errors      = ZERO_1;

        demux_arb0_rdc_data_req         = ZERO_1;
        demux_arb0_rdc_req_errors       = ZERO_1;

        demux_arb0_rcr_data_req         = ZERO_1;
        demux_arb0_rcr_req_errors       = ZERO_1;

//        demux_arb0_rbr_data_req         = ZERO_1;
//        demux_arb0_rbr_req_errors       = ZERO_1;
      end
      TDMC: begin
        mux_dmc_meta0_transfer_complete = tdmc_arb0_transfer_complete;

        mux_dmc_meta0_data              = tdmc_arb0_data;
        mux_dmc_meta0_req_byteenable    = tdmc_arb0_req_byteenable;
        mux_dmc_meta0_status            = tdmc_arb0_status;
        mux_dmc_meta0_data_valid        = tdmc_arb0_data_valid;

        demux_arb0_tdmc_data_req        = meta_dmc0_data_req;
        demux_arb0_tdmc_req_errors      = meta_dmc0_req_errors;
      end
      RDC: begin
        mux_dmc_meta0_transfer_complete = rdc_arb0_transfer_complete;

        mux_dmc_meta0_data              = rdc_arb0_data;
        mux_dmc_meta0_req_byteenable    = rdc_arb0_req_byteenable;
        mux_dmc_meta0_status            = rdc_arb0_status;
        mux_dmc_meta0_data_valid        = rdc_arb0_data_valid;

        demux_arb0_rdc_data_req         = meta_dmc0_data_req;
        demux_arb0_rdc_req_errors       = meta_dmc0_req_errors;
      end
      RCR: begin
        mux_dmc_meta0_transfer_complete = rcr_arb0_transfer_complete;

        mux_dmc_meta0_data              = rcr_arb0_data;
        mux_dmc_meta0_req_byteenable    = rcr_arb0_req_byteenable;
        mux_dmc_meta0_status            = rcr_arb0_status;
        mux_dmc_meta0_data_valid        = rcr_arb0_data_valid;

        demux_arb0_rcr_data_req         = meta_dmc0_data_req;
        demux_arb0_rcr_req_errors       = meta_dmc0_req_errors;
      end
//      RBR: begin
//        mux_dmc_meta0_transfer_complete = rbr_arb0_transfer_complete;

//        mux_dmc_meta0_data              = rbr_arb0_data;
//        mux_dmc_meta0_req_byteenable    = rbr_arb0_req_byteenable;
//        mux_dmc_meta0_status            = rbr_arb0_status;
//        mux_dmc_meta0_data_valid        = rbr_arb0_data_valid;

//        demux_arb0_rbr_data_req         = meta_dmc0_data_req;
//        demux_arb0_rbr_req_errors       = meta_dmc0_req_errors;
//      end
      default: begin
        mux_dmc_meta0_transfer_complete = ZERO_1;

        mux_dmc_meta0_data              = ZEROES_128;
        mux_dmc_meta0_req_byteenable    = ZEROES_16;
        mux_dmc_meta0_status            = ZEROES_4;
        mux_dmc_meta0_data_valid        = ZERO_1;

        demux_arb0_tdmc_data_req        = ZERO_1;
        demux_arb0_tdmc_req_errors      = ZERO_1;

        demux_arb0_rdc_data_req         = ZERO_1;
        demux_arb0_rdc_req_errors       = ZERO_1;

        demux_arb0_rcr_data_req         = ZERO_1;
        demux_arb0_rcr_req_errors       = ZERO_1;

//        demux_arb0_rbr_data_req         = ZERO_1;
//        demux_arb0_rbr_req_errors       = ZERO_1;
      end
    endcase
  end

/*--------------------------------------
-- Concurrent combinatorial logic: Arbitration DATAPATH State Machine
--------------------------------------*/
`ifdef old_code_not_use
  always @ (/*AUTOSENSE*/arb_control_sel_ff
	    or current_arb_datapath_state_ff
	    or rcr_arb0_transfer_complete
	    or rdc_arb0_transfer_complete or start_data_phase
	    or tdmc_arb0_transfer_complete)
    begin: arbitration_datapath_fsm
       arb_datapath_sel_in = NULL;
       arb_datapath_sel_ld = DEASSERT_L;
       next_arb_datapath_state = CADS0;
       data_phase_started = DEASSERT_L;
       case (current_arb_datapath_state_ff) /* synopsys parallel_case full_case */
	 CADS0: begin
	    if (start_data_phase == TRUE_H) begin
	       data_phase_started = ASSERT_H;
	       arb_datapath_sel_in = arb_control_sel_ff;
	       arb_datapath_sel_ld = ASSERT_H;
	       case (arb_control_sel_ff) /* synopsys parallel_case full_case */
		 NULL: begin
		    next_arb_datapath_state = CADS0;       // next state
		 end
		 TDMC: begin
		    next_arb_datapath_state = CADS1;       // next state
		 end
		 RDC: begin
		    next_arb_datapath_state = CADS2;       // next state
		 end
		 RCR: begin
		    next_arb_datapath_state = CADS3;       // next state
		 end
		 RBR: begin
		    next_arb_datapath_state = CADS4;       // next state
		 end
		 default: begin
		    next_arb_datapath_state = CADS0;       // next state
		 end
	       endcase
	    end
	    else begin
	       next_arb_datapath_state = CADS0;           // next state
	    end
	 end
	 CADS1: begin
	    if (tdmc_arb0_transfer_complete == TRUE_H) begin // Data Complete
	       arb_datapath_sel_ld     = ASSERT_H;        // null datapath sel
	       next_arb_datapath_state = CADS0;           // next state
	    end
	    else begin
	       next_arb_datapath_state = CADS1;           // loop
	    end
	 end
	 CADS2: begin
	    if (rdc_arb0_transfer_complete == TRUE_H) begin // Data Complete
	       arb_datapath_sel_ld     = ASSERT_H;        // null datapath sel
	       next_arb_datapath_state = CADS0;           // next state
	    end
	    else begin
	       next_arb_datapath_state = CADS2;           // loop
	    end
	 end
	 CADS3: begin
	    if (rcr_arb0_transfer_complete == TRUE_H) begin // Data Complete
	       arb_datapath_sel_ld     = ASSERT_H;        // null datapath sel
	       next_arb_datapath_state = CADS0;           // next state
	    end
	    else begin
	       next_arb_datapath_state = CADS3;           // loop
	    end
	 end
//	 CADS4: begin
	    //        if (rbr_arb0_transfer_complete == TRUE_H) begin // Data Complete
	    //          arb_datapath_sel_ld     = ASSERT_H;        // null datapath sel
	    //          next_arb_datapath_state = CADS0;           // next state
	    //        end
	    //        else begin
	    //          next_arb_datapath_state = CADS4;           // loop
	    //        end
//	 end
	 default: begin
	    arb_datapath_sel_ld     = ASSERT_H;          // null datapath sel
	    next_arb_datapath_state = CADS0;             // next state
	 end
       endcase
    end
`endif

/*-----------------------------------------------------------------------------
-- TransID Write Tag Management s/m
-----------------------------------------------------------------------------*/


assign posted_req_accepted = dmc_meta0_req_cmd[5] && meta_dmc0_req_accept; 
assign posted_req = dmc_meta0_req_cmd[5];

   always @ (/*AUTOSENSE*/dirty_tag or dmc_meta0_req_transIDR
	     or meta_dmc_ack_transIDR or return_dirty_tag
	     or sel_posted_tag) begin
      if (sel_posted_tag) 
	returned_tag = dmc_meta0_req_transIDR;
      else if (return_dirty_tag)
	returned_tag = dirty_tag;
	else	
	  returned_tag = meta_dmc_ack_transIDR;
      end 
	    		
	     
 always @ (/*AUTOSENSE*/meta_dmc_ack_transfer_cmpl_ORdR
	   or pio_arb_dirtid_enable or posted_req_acceptedR or stateR
	   or transaction_timeout)

   begin
	// set all default values here
      write_tag = 1'b0;
      write_dirty_tag = 1'b0;
      sel_posted_tag = 1'b0;
      state = stateR;		
	case(stateR)
	  IDLE:
	    begin
	       if (posted_req_acceptedR & meta_dmc_ack_transfer_cmpl_ORdR) begin
		  write_tag = 1'b1;
		  sel_posted_tag = 1'b1;
		  state = TAG1;
		  end
	       else if (posted_req_acceptedR) begin
		    write_tag = 1'b1;
		  sel_posted_tag = 1'b1;
		  state = IDLE;
	       end // if (posted_req_accepted)
	       else if (meta_dmc_ack_transfer_cmpl_ORdR & ( pio_arb_dirtid_enable ? !transaction_timeout : 1'b1 )) begin
		  write_tag = 1'b1;
		  sel_posted_tag = 1'b0;
	       end 
	       else if (meta_dmc_ack_transfer_cmpl_ORdR & transaction_timeout  & pio_arb_dirtid_enable) begin
		  write_dirty_tag = 1'b1;
		  sel_posted_tag = 1'b0;  
	       end
	       else
		 state = IDLE;	
	    end // case: IDLE
	  TAG1:
	    begin
	      write_tag = 1'b1;
	      sel_posted_tag = 1'b0;
	       state = IDLE;	
	    end // case: TAG1
	endcase // case(stateR)
 end // always @ (...

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
	   or pio_arb_dirtid_clr or posted_req
	   or transfer_cmpl_pending)
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
		  if  (transfer_cmpl_pending || posted_req)
		    dirbin_state = CLRBIN;
		  else begin
	            inc_dirtybinfifo_rp = 1'b1;
		    return_dirty_tag = 1'b1;
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


// add stage to fix timing
reg write_tag_r;
reg return_dirty_tag_r;
reg [4:0] returned_tag_r;

always @(posedge clk) begin
  if(reset) begin
    write_tag_r<= 1'b0;
    return_dirty_tag_r<= 1'b0;
  end
  else begin
    write_tag_r<= write_tag;
    return_dirty_tag_r<= return_dirty_tag;
  end
end
   
always @(posedge clk) begin
  returned_tag_r<= returned_tag;
end


/*-----------------------------------------------------------------------------
-- TransID Management
-----------------------------------------------------------------------------*/
 niu_meta_wr_tagfifo niu_meta_wr_tagfifo (
			  // Outputs
			  .fifo_not_empty(arb0_fifo_not_empty),
			  .fifo_full	(),
			  .rdout	(rdtagoutR),
			  .dout		(),
			  .count	(),
			  // Inputs
			  .core_clk	(clk),
			  .reset	(reset),
			  .inc_rp	(read_tag),
			  .inc_wp	(write_tag_r | return_dirty_tag_r),
			  .din		(returned_tag_r));
 
 
 /*------------------------------------------------------------------------
  ---Dirty Bin Fifo -----------------------------
  -------------------------------------------------------------------------*/
 niu_meta_arb_syncfifo #(5,32,5) wrdirtybinfifo (
				       .core_clk         (clk),
				       .reset            (reset),
				       .inc_rp           (inc_dirtybinfifo_rp),
				       .inc_wp           (write_dirty_tag),
				       .fifo_not_empty    (dirtybinfifo_not_empty),
				       .fifo_full         (dirtybinfifo_full),
				       .count                  (dirty_tag_count),
				       .din                    (meta_dmc_ack_transIDR),
				       .rdout                  (),
				       .dout                   (dirty_tag));

  
 
 
 //------------------------------------------------------------------

  assign dmc_meta_ack_accept_ORd        = dmc_meta_ack_accept[7] |
                                          dmc_meta_ack_accept[6] |
                                          dmc_meta_ack_accept[5] |
                                          dmc_meta_ack_accept[4] |
                                          dmc_meta_ack_accept[3] |
                                          dmc_meta_ack_accept[2] |
                                          dmc_meta_ack_accept[1] |
                                          dmc_meta_ack_accept[0];

  assign meta_dmc_ack_transfer_cmpl_ORd = meta_dmc_ack_transfer_cmpl[7] |
                                          meta_dmc_ack_transfer_cmpl[6] |
                                          meta_dmc_ack_transfer_cmpl[5] |
                                          meta_dmc_ack_transfer_cmpl[4] |
                                          meta_dmc_ack_transfer_cmpl[3] |
                                          meta_dmc_ack_transfer_cmpl[2] |
                                          meta_dmc_ack_transfer_cmpl[1] |
                                          meta_dmc_ack_transfer_cmpl[0];

   assign transaction_timeout = (meta_dmc_ack_cmd_statusR == 4'b1111);


always @ (/*AUTOSENSE*/meta_dmc_ack_transID0R
	  or meta_dmc_ack_transID1R or meta_dmc_ack_transID2R
	  or meta_dmc_ack_transID3R or meta_dmc_ack_transID4R
	  or meta_dmc_ack_transID5R or meta_dmc_ack_transID6R
	  or meta_dmc_ack_transID7R or meta_dmc_ack_transfer_cmpl) begin
   if ( meta_dmc_ack_transfer_cmpl[0])
     meta_dmc_ack_transID_cmpl = meta_dmc_ack_transID0R;
   else if (meta_dmc_ack_transfer_cmpl[1])
    meta_dmc_ack_transID_cmpl = meta_dmc_ack_transID1R;
     else if (meta_dmc_ack_transfer_cmpl[2])
    meta_dmc_ack_transID_cmpl = meta_dmc_ack_transID2R;
     else if (meta_dmc_ack_transfer_cmpl[3])
    meta_dmc_ack_transID_cmpl = meta_dmc_ack_transID3R;
     else if (meta_dmc_ack_transfer_cmpl[4])
    meta_dmc_ack_transID_cmpl = meta_dmc_ack_transID4R;
     else if (meta_dmc_ack_transfer_cmpl[5])
    meta_dmc_ack_transID_cmpl = meta_dmc_ack_transID5R;
     else if (meta_dmc_ack_transfer_cmpl[6])
    meta_dmc_ack_transID_cmpl = meta_dmc_ack_transID6R;
    else if (meta_dmc_ack_transfer_cmpl[7])
    meta_dmc_ack_transID_cmpl = meta_dmc_ack_transID7R;
    else
    meta_dmc_ack_transID_cmpl = 5'b00000;  
   end
  


/*-----------------------------------------------------------------------------
-- Implicit Registers
-----------------------------------------------------------------------------*/
/*--------------------------------------
-- Concurrent processes: State Machine Registers
--------------------------------------*/

  always @ (posedge clk) begin: current_arb_control_state_reg
    if (reset == 1'b1)
      current_arb_control_state_ff <= 3'b000;        // synchronous reset
    else
      current_arb_control_state_ff <= next_arb_control_state;
  end

`ifdef old_code_not_use
  always @ (posedge clk) begin: current_arb_datapath_state_reg
    if (reset == 1'b1)
      current_arb_datapath_state_ff <= 3'b000;       // synchronous reset
    else
      current_arb_datapath_state_ff <= next_arb_datapath_state;
  end
`endif



 
/*--------------------------------------
-- Concurrent processes: Registers
--------------------------------------*/

  always @ (posedge clk) begin: arb_control_sel_reg
    if (reset == 1'b1)
      arb_control_sel_ff <= 3'b000;                  // synchronous reset
    else if (arb_control_sel_ld == TRUE_H)
      arb_control_sel_ff <= arb_control_sel_in;
  end

  always @ (posedge clk) begin: arb_datapath_sel_reg
    if (reset == 1'b1)
      arb_datapath_sel_ff <= 3'b000;                 // synchronous reset
    else if (arb_datapath_sel_ld == TRUE_H)
      arb_datapath_sel_ff <= arb_datapath_sel_in;
  end // block: arb_datapath_sel_reg


   // Register the arb_control_sel_ff and fsm_start_datapath_fsm
   // after the accept of the request as the previous data can complete some
   // cycles after the accept has happened
`ifdef old_code_not_use
   always @(posedge clk) begin
      if (reset == 1'b1) begin
	arb_control_sel_ffR <= 0;
	start_data_phase <= 1'b0;
      end
      else begin
	 arb_control_sel_ffR <= fsm_start_datapath_fsm ? arb_control_sel_ff : arb_control_sel_ffR;
	 start_data_phase <= fsm_start_datapath_fsm ? 1'b1 : data_phase_started ? 1'b0 : start_data_phase;
      end
	
   end // always @ (posedge clk)
`endif
   
   

 always @ (posedge clk) begin
      if (reset == 1'b1) begin
	  stateR <=  IDLE;
	 posted_req_acceptedR <= 1'b0;
	 meta_dmc_ack_transfer_cmpl_ORdR <= 1'b0;
	 meta_dmc_ack_transIDR  <= 5'h0;
	 dmc_meta0_req_transIDR <= 5'h0;
	 meta_dmc_ack_transID0R <= 5'h0;
	 meta_dmc_ack_transID1R <= 5'h0;
	 meta_dmc_ack_transID2R <= 5'h0;
	 meta_dmc_ack_transID3R <= 5'h0;
	 meta_dmc_ack_transID4R <= 5'h0;
	 meta_dmc_ack_transID5R <= 5'h0;
	 meta_dmc_ack_transID6R <= 5'h0;
	 meta_dmc_ack_transID7R <= 5'h0;
	 meta_dmc_ack_cmd_statusR <= 4'h0;
	 transfer_cmpl_pending <= 1'b0;
	 dirbin_stateR <= 2'b00;
	 arb_pio_dirtid_npwstatus <= 0;
	 outstanding_tid_cnt <= 6'h0;
      end
      else  begin
	  stateR <=  state;
	 posted_req_acceptedR <= posted_req_accepted;
	 meta_dmc_ack_transfer_cmpl_ORdR <= meta_dmc_ack_transfer_cmpl_ORd;
	 if(meta_dmc_ack_transfer_cmpl_ORd) meta_dmc_ack_transIDR  <= meta_dmc_ack_transID_cmpl;
		// this the selected xID to stay until next new ID
	 dmc_meta0_req_transIDR <= posted_req_accepted ? dmc_meta0_req_transID[4:0]: dmc_meta0_req_transIDR;
	 meta_dmc_ack_transID0R <= dmc_meta_ack_accept[0] ? meta_dmc_ack_transID[4:0] : meta_dmc_ack_transID0R;
	 meta_dmc_ack_transID1R <= dmc_meta_ack_accept[1] ? meta_dmc_ack_transID[4:0] : meta_dmc_ack_transID1R;
	 meta_dmc_ack_transID2R <= dmc_meta_ack_accept[2] ? meta_dmc_ack_transID[4:0] : meta_dmc_ack_transID2R;
	 meta_dmc_ack_transID3R <= dmc_meta_ack_accept[3] ? meta_dmc_ack_transID[4:0] : meta_dmc_ack_transID3R;
	 meta_dmc_ack_transID4R <= dmc_meta_ack_accept[4] ? meta_dmc_ack_transID[4:0] : meta_dmc_ack_transID4R;
	 meta_dmc_ack_transID5R <= dmc_meta_ack_accept[5] ? meta_dmc_ack_transID[4:0] : meta_dmc_ack_transID5R;
	 meta_dmc_ack_transID6R <= dmc_meta_ack_accept[6] ? meta_dmc_ack_transID[4:0] : meta_dmc_ack_transID6R;
	 meta_dmc_ack_transID7R <= dmc_meta_ack_accept[7] ? meta_dmc_ack_transID[4:0] : meta_dmc_ack_transID7R;
	 meta_dmc_ack_cmd_statusR <= dmc_meta_ack_accept_ORd ? meta_dmc_ack_cmd_status : meta_dmc_ack_cmd_statusR ;
	 transfer_cmpl_pending <= dmc_meta_ack_accept_ORd ? 1'b1 : meta_dmc_ack_transfer_cmpl_ORd ? 1'b0 : transfer_cmpl_pending;
	 dirbin_stateR <= dirbin_state;
	 arb_pio_dirtid_npwstatus <= dirty_tag_count;
	 if(inc_outstanding_tid_cnt) outstanding_tid_cnt<= outstanding_tid_cnt_add_n;
	 else if(dec_outstanding_tid_cnt)  outstanding_tid_cnt<= outstanding_tid_cnt_sub_n;
      end // else: !if(reset == 1'b1)
   end


 // assign threshold reached  

   assign  npw_threshold_reached = !(pio_arb_np_threshold==6'd32) && (outstanding_tid_cnt >= pio_arb_np_threshold); 
					// disable threshold when set to 32
// assign outputs

assign   arb_pio_all_npwdirty = dirtybinfifo_full;


endmodule

