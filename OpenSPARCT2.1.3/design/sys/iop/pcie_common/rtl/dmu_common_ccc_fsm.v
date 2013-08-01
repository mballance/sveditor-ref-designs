// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_common_ccc_fsm.v
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
module dmu_common_ccc_fsm 
  (
   clk,
   rst_l,
   done_timeout_value,
   arb2fsm_valid,
   cdp2fsm_error,
   dep2fsm_acc_vio,
   dep2fsm_done,
   dep2fsm_mapped,
   dep2fsm_valid,
   ccc_idle,
   fsm2arb_done,
   fsm2cdp_stts,
   fsm2pkt_valid
   );

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter 	IDLE = 3'b000,		// state machine states
		RQST = 3'b001,
		WAIT = 3'b010,
		MAPD = 3'b011,
		DONE = 3'b110,
		AVIO = 3'b100,
		MDTO = 3'b101,
		SKIP = 3'b111;

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input					clk;
  input 				rst_l;

  input  [`FIRE_CSR_TOUT_BITS]		done_timeout_value;

  input 				arb2fsm_valid;

  input 				cdp2fsm_error;

  input 				dep2fsm_acc_vio;
  input 				dep2fsm_done;
  input 				dep2fsm_mapped;
  input 				dep2fsm_valid;

  output				ccc_idle;

  output				fsm2arb_done;
  output [`FIRE_CSR_STTS_BITS]		fsm2cdp_stts;
  output 				fsm2pkt_valid;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  reg 					ccc_idle;
  reg					fsm2arb_done;
  reg [`FIRE_CSR_STTS_BITS]		fsm2cdp_stts;
  reg					fsm2pkt_valid;

  reg [2:0] 				state, nxt_state;
  reg [`FIRE_CSR_TOUT_BITS] 		timer, nxt_timer;
  
// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------

// timeout
  wire   timeout = ~|timer;

// arb valid and map error
  wire   arb_vld = arb2fsm_valid;
  wire   map_err = cdp2fsm_error;

// access violation, request valid, and response valid
  wire   acc_vio = dep2fsm_valid &  dep2fsm_mapped &  dep2fsm_done &  dep2fsm_acc_vio;
  wire   map_vld = dep2fsm_valid &  dep2fsm_mapped & ~dep2fsm_done & ~dep2fsm_acc_vio;
  wire   req_vld = dep2fsm_valid & ~dep2fsm_mapped & ~dep2fsm_done & ~dep2fsm_acc_vio;
  wire   rsp_vld = dep2fsm_valid &  dep2fsm_mapped &  dep2fsm_done & ~dep2fsm_acc_vio;

// next state
  always @ (state or arb_vld or acc_vio or map_err or map_vld or 
	    req_vld or rsp_vld or timeout) begin
    case (state) // synopsys parallel_case
      IDLE : begin
	if (!arb_vld)     nxt_state = IDLE;
	else if (map_err) nxt_state = MDTO;
	else              nxt_state = RQST;
      end
      RQST : begin
	if (req_vld)      nxt_state = WAIT;
	else              nxt_state = RQST;
      end
      WAIT : begin
	if (map_vld)      nxt_state = MAPD;
	else if (acc_vio) nxt_state = AVIO;
	else if (rsp_vld) nxt_state = DONE;
	else if (timeout) nxt_state = MDTO;
	else              nxt_state = WAIT;
      end
      MAPD : begin
	if (rsp_vld)      nxt_state = DONE;
	else if (timeout) nxt_state = MDTO;
	else              nxt_state = MAPD;
      end
      DONE :              nxt_state = SKIP;
      MDTO :              nxt_state = SKIP;
      AVIO :              nxt_state = SKIP;
      SKIP :              nxt_state = IDLE;
    endcase
  end

// state outputs
  always @ (state or timer or done_timeout_value) begin
    ccc_idle      = 0;
    fsm2arb_done  = 0;
    fsm2cdp_stts  = `FIRE_CSR_HOST_DONE_STATUS_SUCCESS;
    fsm2pkt_valid = 0;
    nxt_timer     = done_timeout_value;
    case (state) // synopsys parallel_case
      IDLE : begin
	ccc_idle = 1'b1;
      end
      RQST : begin
	fsm2pkt_valid = 1'b1;
      end
      WAIT : begin
	fsm2pkt_valid = 1'b1;
	nxt_timer     = timer - 1;
      end
      MAPD : begin
	fsm2pkt_valid = 1'b1;
	nxt_timer     = timer - 1;
      end
      DONE : begin
	fsm2arb_done  = 1'b1;
      end
      MDTO : begin
	fsm2arb_done  = 1'b1;
	fsm2cdp_stts  = `FIRE_CSR_HOST_DONE_STATUS_MAP_DONE_TIMEOUT;
      end
      AVIO : begin
	fsm2arb_done  = 1'b1;
	fsm2cdp_stts  = `FIRE_CSR_HOST_DONE_STATUS_ACCESS_VIO;
      end
      SKIP : begin
	fsm2pkt_valid = 0;
	fsm2arb_done  = 0;
      end
    endcase
  end

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) begin
    if (!rst_l) begin 
      state <= IDLE;
    end
    else begin
      state <= nxt_state;
    end
  end

  always @ (posedge clk) begin
    timer <= nxt_timer;
  end

endmodule // dmu_common_ccc_fsm
