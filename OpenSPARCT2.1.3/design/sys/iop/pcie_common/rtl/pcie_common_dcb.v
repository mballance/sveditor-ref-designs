// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcie_common_dcb.v
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
module pcie_common_dcb 
  (
   csr_byp_ring_out,		// bypass ring out
   csr_ext_ring_out,		// extended ring out
   clk,				// clock
   rst_l,			// reset
   byp_src,			// bypass source bus
   csr_byp_ring_in,		// bypass ring in
   csr_ext_ring_in		// extended ring in
   );

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter 	IDLE = 3'b000,		// state machine states
		ERMS = 3'b100,
		ERLS = 3'b101,
		BRMS = 3'b110,
		BRLS = 3'b111;

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  output [`FIRE_CSR_RING_BITS]		csr_byp_ring_out;
  output [`FIRE_CSR_RING_BITS]		csr_ext_ring_out;

  input 				clk;
  input 				rst_l;
  input  [`FIRE_CSR_SRCB_BITS]		byp_src;
  input  [`FIRE_CSR_RING_BITS]		csr_byp_ring_in;
  input  [`FIRE_CSR_RING_BITS]		csr_ext_ring_in;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_CSR_RING_BITS] 		csr_byp_ring_out, nxt_byp_ring;
  wire [`FIRE_CSR_RING_BITS] 		csr_ext_ring_out, nxt_ext_ring;
  wire [`FIRE_CSR_CMND_BITS]		cmd;
  wire [`FIRE_CSR_SRCB_BITS]		src;

  reg  [`FIRE_CSR_RING_BITS] 		byp_ring;
  reg  [`FIRE_CSR_RING_BITS] 		ext_ring;
  reg  [2:0]				state, nxt_state;
  reg					sel;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

  // 0in known_driven -var state -active rst_l
  // 0in state_transition -var state -val IDLE -next ERMS BRMS
  // 0in state_transition -var state -val ERMS -next ERLS
  // 0in state_transition -var state -val ERLS -next IDLE
  // 0in state_transition -var state -val BRMS -next BRLS
  // 0in state_transition -var state -val BRLS -next IDLE

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------

// outputs
  assign csr_byp_ring_out = byp_ring;
  assign csr_ext_ring_out = ext_ring;

// valid, command, and source bus
  assign cmd = csr_byp_ring_in[`FIRE_CSR_RING_CMND_BITS];
  assign src = csr_byp_ring_in[`FIRE_CSR_RING_SRCB_BITS];

// bypass source
  wire   vld = |cmd;
  wire	 byp = (src == byp_src);

// next state
  always @ (state or vld or byp) begin
    case (state) // synopsys parallel_case
      IDLE : begin
	case ({vld, byp}) // synopsys parallel_case
	  2'b00 : nxt_state = IDLE;
	  2'b01 : nxt_state = IDLE;
	  2'b10 : nxt_state = ERMS;
	  2'b11 : nxt_state = BRMS;
	endcase
      end
      ERMS :      nxt_state = ERLS;
      ERLS :      nxt_state = IDLE;
      BRMS :      nxt_state = BRLS;
      BRLS :      nxt_state = IDLE;
      default :   nxt_state = IDLE;
    endcase
  end

// state outputs
  always @ (state or byp) begin
    case (state) // synopsys parallel_case
      IDLE : begin
	if (byp) sel = 1'b0;
	else     sel = 1'b1;
      end
      ERMS :     sel = 1'b1;
      ERLS :     sel = 1'b1;
      BRMS :     sel = 1'b0;
      BRLS :     sel = 1'b0;
      default :  sel = 1'b0;
    endcase
  end

  assign nxt_byp_ring = sel ? csr_ext_ring_in : csr_byp_ring_in;
  assign nxt_ext_ring = sel ? csr_byp_ring_in : 0;
  
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
      byp_ring <= 32'b0;
      ext_ring <= 32'b0;
    end
	else	begin
    byp_ring <= nxt_byp_ring;
    ext_ring <= nxt_ext_ring;
  end
  
endmodule // pcie_common_dcb
