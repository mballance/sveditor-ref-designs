// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dmu_dsn_ccc_pkt.v
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
module dmu_dsn_ccc_pkt
  (
   clk, 
   rst_l,			   

   wr_req_vld,			   
   cdp2pkt_addr,			   
   cdp2pkt_data,
//   cdp2pkt_src_bus,
   buf_id_in,

   fsm2pkt_valid,

   j2d_csr_ring_out,			  			 
   pkt2ctl_dbg_grp_b_1			  			 
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
//  input  [`FIRE_CSR_SRCB_BITS]		cdp2pkt_src_bus;
  input  [1:0]				buf_id_in;
  input  [`FIRE_CSR_ADDR_BITS]		cdp2pkt_addr;

  input 				wr_req_vld;
  input 				fsm2pkt_valid;

  output [`FIRE_CSR_RING_BITS]		j2d_csr_ring_out;
  output [2:0]				pkt2ctl_dbg_grp_b_1;

// ----------------------------------------------------------------------------
// Variables
// ----------------------------------------------------------------------------
  wire [`FIRE_CSR_RING_BITS] 		j2d_csr_ring_out, addr_phase;
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
  assign j2d_csr_ring_out = ring;

// next state
  always @ (state or fsm2pkt_valid) begin
	nxt_state	= IDLE;
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
//	default:	nxt_state = 2'bxx;
    endcase
  end

  always @ (state or fsm2pkt_valid or wr_req_vld) begin
	select = 2'b00;
    case (state) 
      IDLE : begin
	if (fsm2pkt_valid) begin
	  select  = 2'b01;
	end
	else begin
	  select  = 2'b00;
	end
      end
      RDMS : begin
	select  = {wr_req_vld, 1'b0};
      end
      RDLS : begin
	select  = {wr_req_vld, wr_req_vld};
      end
      BUSY : begin
	select  = 2'b00;
      end
//	default:	select = 2'bxx;
    endcase
  end

  assign cmnd = wr_req_vld ? `FIRE_CSR_CMND_WREQ : `FIRE_CSR_CMND_RREQ;
//BP 3-08-04 src bus decodes for fast, medium and slow, see FIRE/JBC MAS sec. 6.15.11.3.4
wire	[1:0]	cdp2pkt_src_bus;
wire	fast_bus, medium_bus, slow_bus;
//BP 4.29.04 note these decodes are using addresses such that the bit positions are byte aligned
// see the code /jbc/csr/ars/ops/rtl/fire_jlc_csr_ars.v  line 333
assign fast_bus		 = ( (cdp2pkt_addr[19:16] == 4'h0) ||		// fast bus
				(cdp2pkt_addr[19:16] == 4'h1) ||
				(cdp2pkt_addr[19:16] == 4'h2) ||
				(cdp2pkt_addr[19:16] == 4'h3) );
assign medium_bus	 = ( (cdp2pkt_addr[19:16] == 4'h4) ||		// medium bus
				(cdp2pkt_addr[19:16] == 4'h5) ||
				(cdp2pkt_addr[19:16] == 4'h6) ||
				(cdp2pkt_addr[19:16] == 4'h7) );
assign slow_bus	 	= ( (cdp2pkt_addr[19:16] == 4'h8) ||		// slow bus
				(cdp2pkt_addr[19:16] == 4'h9) ||
				(cdp2pkt_addr[19:16] == 4'ha) ||
				(cdp2pkt_addr[19:16] == 4'hb) ||
				(cdp2pkt_addr[19:16] == 4'hc) ||
				(cdp2pkt_addr[19:16] == 4'hd) ||
				(cdp2pkt_addr[19:16] == 4'he) ||
				(cdp2pkt_addr[19:16] == 4'hf) );
assign	cdp2pkt_src_bus[0] = (fast_bus || slow_bus) && ~buf_id_in[0];
assign	cdp2pkt_src_bus[1] = (fast_bus || medium_bus) && ~buf_id_in[0];
  assign addr_phase[`FIRE_CSR_RING_CMND_BITS] = cmnd;
  assign addr_phase[`FIRE_CSR_RING_SRCB_BITS] = cdp2pkt_src_bus;
// BP note: cdp2pkt_addr in N2 is a byte address, so I need to drop the bottom 3 bits here
//	because the address out onto the ring is [22:3]
  assign addr_phase[`FIRE_CSR_RING_ADDR_BITS] = {3'b0,cdp2pkt_addr[26:3]};

  always @ (select or addr_phase or cdp2pkt_data) begin
	nxt_ring	= 0;
    case (select) // synopsys infer_mux
      2'b00 : nxt_ring = 0;
      2'b01 : nxt_ring = addr_phase;
      2'b10 : nxt_ring = cdp2pkt_data[`FIRE_CSR_RDMS_BITS];
      2'b11 : nxt_ring = cdp2pkt_data[`FIRE_CSR_RDLS_BITS];
//	default 	nxt_ring = 32'bxxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx;
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

// ----------------------------------------------------------------------------
// debug --- for dbg group b sub sel 1
// ----------------------------------------------------------------------------
assign	pkt2ctl_dbg_grp_b_1[2:0] = cmnd[2:0];

endmodule // dmu_dsn_ddd_pkt
