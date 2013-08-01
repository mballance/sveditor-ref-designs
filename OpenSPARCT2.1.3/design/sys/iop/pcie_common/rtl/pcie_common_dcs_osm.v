// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcie_common_dcs_osm.v
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
module pcie_common_dcs_osm 
  (
   clk,				// source clock
   rst_l,			// reset
   csr_pkt_ack,			// csr packet acknowledge
   ism2osm_vld,			// ism valid
   csr_pkt_req,			// csr request
   osm2ism_deq,			// ism dequeue
   osm2sdp_ld			// sdp load
   );

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter	IDLE = 2'b00,			// state machine states
		LDMS = 2'b01,
		LDLS = 2'b10,
		RQST = 2'b11;

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input 				clk;
  input 				rst_l;
  input 				csr_pkt_ack;
  input					ism2osm_vld;

  output 				csr_pkt_req;
  output				osm2ism_deq;
  output [2:0]				osm2sdp_ld;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire					ack;

  reg 					osm2ism_deq;
  reg  [2:0]				osm2sdp_ld;
  reg					req, nxt_req;
  reg  [1:0]				state, nxt_state;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

  // 0in known_driven -var req -active rst_l
  // 0in known_driven -var state -active rst_l
  // 0in state_transition -var state -val IDLE -next LDMS RQST
  // 0in state_transition -var state -val LDMS -next LDLS
  // 0in state_transition -var state -val LDLS -next RQST
  // 0in state_transition -var state -val RQST -next IDLE

// ----------------------------------------------------------------------------
// Instantiations
// ----------------------------------------------------------------------------
/* N2- AT 03/04/05: 
  pcie_common_sync_flop #(1'b1) sff
    (
     .clk	(clk),
     .din	(csr_pkt_ack),
     .dout	(ack)
     );
END N2- AT 03/04/05 */

// N2+ AT 03/04/05: repalce pcie_common_sync_flop w/ sync cells from N2 lib.
cl_a1_clksyncff_4x sff(
        .siclk                  (1'b0),
        .soclk                  (1'b0),
        .si                     (1'b0),
        .so                     (),
        .l1clk                  (clk),
        .d                      (csr_pkt_ack),
        .q                      (ack)
);
// END N2+ AT 03/04/05

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------

// csr packet request
  assign csr_pkt_req = req;

// next state
  always @ (state or ism2osm_vld or req or ack) begin
    case (state) // synopsys parallel_case
      IDLE : begin
	if (ism2osm_vld) nxt_state = LDMS;
	else             nxt_state = IDLE;
      end
      LDMS :             nxt_state = LDLS;
      LDLS :             nxt_state = RQST;
      RQST : begin
	if (req ^ ack)   nxt_state = RQST;
	else             nxt_state = IDLE;
      end
    endcase
  end

// state outputs
  always @ (state or nxt_state or req) begin
    osm2ism_deq = 1'b0;
    osm2sdp_ld  = 3'b000;
    nxt_req     = req;
    case (state) // synopsys parallel_case
      IDLE : begin
	case (nxt_state) // synopsys parallel_case
	  LDMS : begin
	    osm2ism_deq = 1'b1;
	    osm2sdp_ld  = 3'b100;
	    nxt_req     = req;
	  end
	  default : begin
	    osm2ism_deq = 1'b0;
	    osm2sdp_ld  = 3'b000;
	    nxt_req     = req;
	  end
	endcase
      end
      LDMS : begin
	osm2ism_deq = 1'b1;
	osm2sdp_ld  = 3'b010;
	nxt_req     = req;
      end
      LDLS : begin
	osm2ism_deq = 1'b1;
	osm2sdp_ld  = 3'b001;
	nxt_req     = ~req;
      end
      RQST : begin
	osm2ism_deq = 1'b0;
	osm2sdp_ld  = 3'b000;
	nxt_req     = req;
      end
    endcase
  end

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) begin
    if (!rst_l) begin 
      req   <= 0;
      state <= IDLE;
    end
    else begin
      req   <= nxt_req;
      state <= nxt_state;
    end
  end

endmodule // pcie_common_dcs_osm
