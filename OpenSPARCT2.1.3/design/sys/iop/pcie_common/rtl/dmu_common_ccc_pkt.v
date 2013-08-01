// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_common_ccc_pkt.v
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
module dmu_common_ccc_pkt 
  (
   clk, 
   rst_l,			   

   cdp2pkt_addr,			   
   cdp2pkt_data,
   cdp2pkt_src_bus,
   cdp2pkt_wr,

   fsm2pkt_valid,

   csr_ring_out			  			 
   );

// ----------------------------------------------------------------------------
// Parameters
// ----------------------------------------------------------------------------
  parameter	IDLE = 2'b00,		// state machine states
		RDMS = 2'b01,
		RDLS = 2'b10,
		BUSY = 2'b11;

// ----------------------------------------------------------------------------
// Ports
// ----------------------------------------------------------------------------
  input					clk;
  input 				rst_l;

  input  [`FIRE_CSR_DATA_BITS]		cdp2pkt_data;
  input 				cdp2pkt_wr;
  input  [`FIRE_CSR_SRCB_BITS]		cdp2pkt_src_bus;
  input  [`FIRE_CSR_ADDR_BITS]		cdp2pkt_addr;

  input 				fsm2pkt_valid;

  output [`FIRE_CSR_RING_BITS]		csr_ring_out;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_CSR_RING_BITS] 		csr_ring_out, addr_phase;
  wire [`FIRE_CSR_CMND_BITS] 		cmnd;

  reg  [`FIRE_CSR_RING_BITS] 		ring, nxt_ring;
  reg  [1:0] 				state, nxt_state;
  reg  [1:0]				select;

// ----------------------------------------------------------------------------
// Zero In Checkers
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Combinational
// ----------------------------------------------------------------------------
  assign csr_ring_out = ring;

// next state
  always @ (state or fsm2pkt_valid) begin
    case (state) 
      IDLE : begin
	if (fsm2pkt_valid) nxt_state = RDMS;
	else               nxt_state = IDLE;
      end
      RDMS :               nxt_state = RDLS;
      RDLS :               nxt_state = BUSY;
      BUSY : begin
	if (fsm2pkt_valid) nxt_state = BUSY;
	else               nxt_state = IDLE;
      end
    endcase
  end

  always @ (state or fsm2pkt_valid or cdp2pkt_wr) begin
    case (state) 
      IDLE : begin
	if (fsm2pkt_valid) begin
	  select  = 2'b01;
	end
	else begin
	  select  = 0;
	end
      end
      RDMS : begin
	select  = {cdp2pkt_wr, 1'b0};
      end
      RDLS : begin
	select  = {cdp2pkt_wr, cdp2pkt_wr};
      end
      BUSY : begin
	select  = 0;
      end
    endcase
  end

  assign cmnd = cdp2pkt_wr ? `FIRE_CSR_CMND_WREQ : `FIRE_CSR_CMND_RREQ;

  assign addr_phase[`FIRE_CSR_RING_CMND_BITS] = cmnd;
  assign addr_phase[`FIRE_CSR_RING_SRCB_BITS] = cdp2pkt_src_bus;
  assign addr_phase[`FIRE_CSR_RING_ADDR_BITS] = cdp2pkt_addr;

  always @ (select or addr_phase or cdp2pkt_data) begin
    case (select) // synopsys infer_mux
      2'b00 : nxt_ring = 0;
      2'b01 : nxt_ring = addr_phase;
      2'b10 : nxt_ring = cdp2pkt_data[`FIRE_CSR_RDMS_BITS];
      2'b11 : nxt_ring = cdp2pkt_data[`FIRE_CSR_RDLS_BITS];
    endcase
  end

// ----------------------------------------------------------------------------
// Sequential
// ----------------------------------------------------------------------------
  always  @ (posedge clk) begin
    if (!rst_l) begin
      ring  <= 0;
      state <= IDLE;
    end
    else begin
      ring  <= nxt_ring;
      state <= nxt_state;
    end
  end

endmodule // dmu_common_ccc_pkt
