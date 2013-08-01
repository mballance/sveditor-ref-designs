// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcie_common_dcs_ism.v
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
module pcie_common_dcs_ism 
  (
   clk,				// source clock
   rst_l,			// reset
   csr_rng_cmd,			// csr ring command
   osm2ism_deq,			// osm dequeue
   ism2osm_vld,			// osm valid
   ism2sdp_ds,			// sdp data select
   ism2sdp_ld			// sdp load
   );

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter	QD = 3;				// queue depth

  parameter	IDLE = 2'b00,			// state machine states
		LDMS = 2'b01,
		LDLS = 2'b10;

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input 				clk;
  input 				rst_l;
  input  [`FIRE_CSR_CMND_BITS]		csr_rng_cmd;
  input 				osm2ism_deq;

  output 				ism2osm_vld;
  output [QD-2:0]			ism2sdp_ds;
  output [QD-1:0]			ism2sdp_ld;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire					ism2osm_vld, deq;

  reg [QD-2:0] 				ism2sdp_ds;
  reg [QD-1:0] 				ism2sdp_ld;
  reg [QD-1:0] 				vld, nxt_vld;
  reg [1:0]				state, nxt_state;
  reg					enq;

  integer i;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

  // 0in fifo -enq enq -deq deq -depth QD
  // 0in known_driven -var vld -active rst_l
  // 0in known_driven -var state -active rst_l
  // 0in state_transition -var state -val IDLE -next LDMS
  // 0in state_transition -var state -val LDMS -next LDLS
  // 0in state_transition -var state -val LDLS -next IDLE

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------

// valid command
  wire 	 rng_vld = |csr_rng_cmd;

// next state
  always @ (state or rng_vld) begin
    case (state) // synopsys parallel_case
      IDLE : begin
	if (rng_vld) nxt_state = LDMS;
	else         nxt_state = IDLE;
      end
      LDMS :         nxt_state = LDLS;
      LDLS :         nxt_state = IDLE;
      default :      nxt_state = IDLE;
    endcase
  end

// state outputs
  always @ (state or rng_vld) begin
    case (state) // synopsys parallel_case
      IDLE :    enq = rng_vld;
      LDMS :    enq = 1'b1;
      LDLS :    enq = 1'b1;
      default : enq = 1'b0;
    endcase
  end

// osm valid
  assign ism2osm_vld = vld[0];

// dequeue
  assign deq = osm2ism_deq;
  
// queue controls
  always @ (rst_l or enq or deq or vld) begin
    for (i = 0; i < QD - 1; i = i + 1) ism2sdp_ds[i] = vld[i+1];
    case ({enq, deq})
      2'b00 : ism2sdp_ld = ~{ QD { rst_l } };
      2'b01 : ism2sdp_ld =  vld;
      2'b10 : ism2sdp_ld = ~vld;
      2'b11 : ism2sdp_ld =  vld;
    endcase
    case ({enq, deq})
      2'b00 : nxt_vld = vld;
      2'b01 : nxt_vld = { 1'b0, vld[QD-1:1] };
      2'b10 : nxt_vld = { vld[QD-2:0], 1'b1 };
      2'b11 : nxt_vld = vld;
    endcase
  end

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always @ (posedge clk) begin
    if (!rst_l) begin 
      vld   <= 0;
      state <= IDLE;
    end
    else begin
      vld   <= nxt_vld;
      state <= nxt_state;
    end
  end

endmodule // pcie_common_dcs_ism
