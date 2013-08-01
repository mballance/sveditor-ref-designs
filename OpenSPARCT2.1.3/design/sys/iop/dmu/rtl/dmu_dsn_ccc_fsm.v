// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_dsn_ccc_fsm.v
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
module dmu_dsn_ccc_fsm
  (
   clk,
   rst_l,
   rd_req_vld,
   wr_req_vld,
   dep2fsm_acc_vio,
   dep2fsm_done,
   dep2fsm_valid,
   ack_busy,
   rd_ack_vld,
   rd_nack_vld,
   fsm2arb_done,
   fsm2pkt_valid,
   fsm2ctl_dbg_grp_b_1	
   );

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter 	IDLE = 3'b000,		// state machine states
		RQST = 3'b001,
		WAIT = 3'b010,
//		MAPD = 3'b011,
		DONE = 3'b110,
		AVIO = 3'b100,
		MDTO = 3'b101,
		SKIP = 3'b111;

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input					clk;
  input 				rst_l;


  input 				rd_req_vld;
  input 				wr_req_vld;


  input 				dep2fsm_acc_vio;
  input 				dep2fsm_done;
  input 				dep2fsm_valid;
  input 				ack_busy;


  output				fsm2arb_done;
  output				rd_ack_vld;
  output				rd_nack_vld;
  output 				fsm2pkt_valid;
  output [4:0] 				fsm2ctl_dbg_grp_b_1;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  reg					fsm2arb_done;
  reg 					fsm2cdp_stts;
  reg					fsm2pkt_valid;

  reg [2:0] 				state, nxt_state;
  reg [`FIRE_CSR_TOUT_BITS] 		timer, nxt_timer;
  
// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

// csr_ring_fsm
    //0in state_transition  -var state  -val IDLE  -next IDLE MDTO RQST
    //0in state_transition  -var state  -val RQST  -next WAIT RQST
    //0in state_transition  -var state  -val WAIT  -next AVIO DONE MDTO WAIT
    //0in state_transition  -var state  -val DONE  -next SKIP
    //0in state_transition  -var state  -val MDTO  -next SKIP
    //0in state_transition  -var state  -val AVIO  -next SKIP
    //0in state_transition  -var state  -val SKIP  -next IDLE



// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------

// timeout
  wire   timeout = ~|timer;

// arb valid and map error
  wire   arb_vld = (rd_req_vld | wr_req_vld) && ~ack_busy;
  wire   map_err = 1'b0;

// access violation, request valid, and response valid
  wire   acc_vio = dep2fsm_valid &  dep2fsm_done &  dep2fsm_acc_vio;
//BP 3-17-04 req_vld should be 1 at the beginning of the csr ring transfer, right????
  wire   req_vld = dep2fsm_valid & ~dep2fsm_done & ~dep2fsm_acc_vio;
  wire   rsp_vld = dep2fsm_valid &   dep2fsm_done & ~dep2fsm_acc_vio;
//BP 5-07-04
 wire	rd_ack_vld = fsm2arb_done & ~fsm2cdp_stts & rd_req_vld;
 wire	rd_nack_vld = fsm2arb_done & fsm2cdp_stts & rd_req_vld;
// next state
  always @ (state or arb_vld or acc_vio or map_err or  
	    req_vld or rsp_vld or timeout) begin
	nxt_state	= IDLE;
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
	if (acc_vio)      nxt_state = AVIO;
	else if (rsp_vld) nxt_state = DONE;
	else if (timeout) nxt_state = MDTO;
	else              nxt_state = WAIT;
      end
      DONE :              nxt_state = SKIP;
      MDTO :              nxt_state = SKIP;
      AVIO :              nxt_state = SKIP;
      SKIP :              nxt_state = IDLE;
	default:	begin
			nxt_state	= 3'b000;	//0in < fire  -message " got x's in dsn_ccc_fsm"
			end
    endcase
  end

// state outputs
  always @ (state or timer ) begin
    fsm2arb_done  = 1'b0;
    fsm2cdp_stts  = 1'b0;
    fsm2pkt_valid = 1'b0;
    nxt_timer     = 8'b11100000;
    case (state) // synopsys parallel_case
      IDLE : begin
	end
      RQST : begin
	fsm2pkt_valid = 1'b1;
      end
      WAIT : begin
	fsm2pkt_valid = 1'b1;
	nxt_timer     = timer - 8'b00000001;
      end
      DONE : begin
	fsm2arb_done  = 1'b1;
      end
      MDTO : begin
	fsm2arb_done  = 1'b1;
	fsm2cdp_stts  = 1'b1;
      end
      AVIO : begin
	fsm2arb_done  = 1'b1;
	fsm2cdp_stts  = 1'b1;
      end
      SKIP : begin
	fsm2pkt_valid = 1'b0;
	fsm2arb_done  = 1'b0;
      end
	default:	begin
			fsm2arb_done	= 1'b0;		
			fsm2pkt_valid	= 1'b0;		
			fsm2cdp_stts	= 1'b0;		
			nxt_timer	= 8'b00000000;	
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

  always @ (posedge clk) 
    if (!rst_l) begin 
    timer <= 8'b0;
  end
    else begin
    timer <= nxt_timer;
  end

// ----------------------------------------------------------------------------
// debug--  debug signals for debug group b sub_sel 1
// ----------------------------------------------------------------------------
assign	fsm2ctl_dbg_grp_b_1[4:0] = {arb_vld,req_vld,acc_vio,rsp_vld,timeout};

endmodule // dmu_dsn_ccc_fsm
