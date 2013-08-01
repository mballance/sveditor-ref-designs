// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcie_common_dcd.v
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
module pcie_common_dcd 
  (
   clk,				// destination clock
   rst_l,			// reset
   csr_pkt_data,		// packet data
   csr_pkt_req,			// packet request
   csr_pkt_ack,			// packet acknowledge
   csr_rng_data			// ring data
   );

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter	IDLE = 2'b00,			// state machine states
		LDMS = 2'b01,
		LDLS = 2'b10;

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input 				clk;
  input 				rst_l;
  input  [`FIRE_CSR_PCKT_BITS]		csr_pkt_data;
  input 				csr_pkt_req;

  output 				csr_pkt_ack;
  output [`FIRE_CSR_RING_BITS]		csr_rng_data;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire					req;

  reg  [`FIRE_CSR_RING_BITS]		csr_rng_data, nxt_rng;
  reg  [1:0]				state, nxt_state;
  reg  [1:0]				sel;
  reg					ack, nxt_ack;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

  // 0in known_driven -var ack -active rst_l
  // 0in known_driven -var state -active rst_l
  // 0in state_transition -var state -val IDLE -next LDMS
  // 0in state_transition -var state -val LDMS -next LDLS
  // 0in state_transition -var state -val LDLS -next IDLE

// ----------------------------------------------------------------------------
// Instantiations
// ----------------------------------------------------------------------------
/* N2- AT 03/04/05: 
  pcie_common_sync_flop #(1'b1) sff
    (
     .clk	(clk),
     .din	(csr_pkt_req),
     .dout	(req)
     );
END N2- AT 03/04/05 */

// N2+ AT 03/04/05: repalce pcie_common_sync_flop w/ sync cells from N2 lib.
cl_a1_clksyncff_4x sff(
        .siclk                  (1'b0),
        .soclk                  (1'b0),
        .si                     (1'b0),
        .so                     (),
        .l1clk                  (clk),
        .d                      (csr_pkt_req),
        .q                      (req)
);
// END N2+ AT 03/04/05

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------
  wire   csr_pkt_ack = ack;

// next state
  always @ (state or req or ack) begin
    case (state) // synopsys parallel_case
      IDLE : begin
	if (req ^ ack) nxt_state = LDMS;
	else           nxt_state = IDLE;
      end
      LDMS :           nxt_state = LDLS;
      LDLS :           nxt_state = IDLE;
      default :        nxt_state = IDLE;
    endcase
  end

// state outputs
  always @ (state or nxt_state or ack) begin
    case (state) // synopsys parallel_case
      IDLE : begin
	case (nxt_state)  // synopsys parallel_case
	  LDMS : begin
	    nxt_ack = ack;
	    sel     = 2'b01;
	  end
	  default : begin
	    nxt_ack = ack;
	    sel     = 2'b00;
	  end
	endcase
      end
      LDMS : begin
	nxt_ack = ack;
	sel     = 2'b10;
      end
      LDLS : begin
	nxt_ack = ~ack;
	sel     = 2'b11;
      end
      default : begin
	nxt_ack = ack;
	sel     = 2'b00;
      end
    endcase
  end

// next ring
  always @ (sel or csr_pkt_data) begin
    case (sel) // synopsys infer_mux
      2'b00 : nxt_rng = 0;
      2'b01 : nxt_rng = csr_pkt_data[`FIRE_CSR_PCKT_ADDR_BITS];
      2'b10 : nxt_rng = csr_pkt_data[`FIRE_CSR_PCKT_RDMS_BITS];
      2'b11 : nxt_rng = csr_pkt_data[`FIRE_CSR_PCKT_RDLS_BITS];
    endcase
  end

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) begin
    if (!rst_l) begin 
      ack   <= 0;
      state <= IDLE;
    end
    else begin
      ack   <= nxt_ack;
      state <= nxt_state;
    end
  end

  always @ (posedge clk) 
    if (!rst_l) begin 
    csr_rng_data <= {32{1'b0}};
    end
	else begin
    csr_rng_data <= nxt_rng;
  end
  
endmodule // pcie_common_dcd
