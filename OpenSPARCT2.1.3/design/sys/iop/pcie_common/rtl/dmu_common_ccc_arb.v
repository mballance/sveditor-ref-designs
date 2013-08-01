// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_common_ccc_arb.v
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
module dmu_common_ccc_arb 
  (
   clk,
   rst_l,

   csr_host_0_req,
   csr_host_1_req,
   csr_host_2_req, 
   csr_host_3_req,

   fsm2arb_done,

   csr_host_0_done,
   csr_host_1_done, 
   csr_host_2_done,
   csr_host_3_done,

   arb2cdp_sel,
   arb2fsm_valid
   );

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter	IDLE = 2'b00,		// state machine states
		BUSY = 2'b01,
		DONE = 2'b11;
  
// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input 				clk;
  input 				rst_l;

  input 				csr_host_0_req;
  input 				csr_host_1_req;
  input 				csr_host_2_req;
  input 				csr_host_3_req;

  input 				fsm2arb_done;

  output				csr_host_0_done;
  output				csr_host_1_done;
  output				csr_host_2_done;
  output				csr_host_3_done;

  output [`FIRE_CSR_SRCB_BITS]		arb2cdp_sel;
  output				arb2fsm_valid;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [3:0]				req;

  reg [3:0] 				done, nxt_done;
  reg [1:0]				grant, new_grant, nxt_grant;
  reg [1:0]				state, nxt_state;
  reg					valid, nxt_valid;

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------
// csr host dones
  wire   csr_host_0_done = done[0];
  wire 	 csr_host_1_done = done[1];
  wire 	 csr_host_2_done = done[2];
  wire 	 csr_host_3_done = done[3];

// cdp select and fsm valid
  assign arb2cdp_sel   = grant;
  wire   arb2fsm_valid = valid;

// csr host requests
  assign req[0] = csr_host_0_req;
  assign req[1] = csr_host_1_req;
  assign req[2] = csr_host_2_req;
  assign req[3] = csr_host_3_req;

  wire   any_req = |req;

// round-robin new grant
  always @ (req or grant) begin
    casez ({grant, req}) // synopsys parallel_case
      6'b00_zz1z : new_grant = 2'b01;
      6'b00_z10z : new_grant = 2'b10;
      6'b00_100z : new_grant = 2'b11;
      6'b00_000z : new_grant = 2'b00;

      6'b01_z1zz : new_grant = 2'b10;
      6'b01_10zz : new_grant = 2'b11;
      6'b01_00z1 : new_grant = 2'b00;
      6'b01_00z0 : new_grant = 2'b01;

      6'b10_1zzz : new_grant = 2'b00;
      6'b10_0zz1 : new_grant = 2'b00;
      6'b10_0z10 : new_grant = 2'b00;
      6'b10_0z00 : new_grant = 2'b00;

      6'b11_zzz1 : new_grant = 2'b00;
      6'b11_zz10 : new_grant = 2'b00;
      6'b11_z100 : new_grant = 2'b00;
      6'b11_z000 : new_grant = 2'b00;
    endcase
  end

  always @ (state or any_req or fsm2arb_done) begin
    case (state) // synopsys parallel_case
      IDLE : begin
	if (any_req)      nxt_state = BUSY;
	else              nxt_state = IDLE;
      end
      BUSY : begin
	if (fsm2arb_done) nxt_state = DONE;
	else              nxt_state = BUSY;
      end
      DONE :              nxt_state = IDLE;
      default :           nxt_state = IDLE;
    endcase
  end

  always @ (state or nxt_state or new_grant or grant) begin
    nxt_done  = 0;
    nxt_grant = grant;
    nxt_valid = 0;
    case (state) // synopsys parallel_case
      IDLE : begin
	case (nxt_state) // synopsys parallel_case
	  BUSY : begin
	    nxt_valid = 1'b1;
	    nxt_grant = new_grant;
	  end
	  default : begin
	    nxt_valid = 0;
	  end
	endcase
      end
      BUSY : begin
	case (nxt_state) // synopsys parallel_case
	  DONE : begin
	    nxt_done[grant] = 1'b1;
	  end
	  default : begin
	    nxt_done = 0;
	  end
	endcase
      end
      default : begin
	nxt_done  = 0;
	nxt_valid = 0;
      end
    endcase
  end

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always  @(posedge clk) begin     
    if (!rst_l) begin
      done  <= 0;
      grant <= 0;
      state <= IDLE;
      valid <= 0;
    end
    else begin
      done  <= nxt_done;
      grant <= nxt_grant;
      state <= nxt_state;
      valid <= nxt_valid;
    end
  end

endmodule // dmu_common_ccc_arb
